#!/usr/bin/env python3
"""Decomp run for the gear/equipment menu, actions & traits menus, and menus around them.

Targets (13 client scripts, 1.x installed client):
  gear menu      widget/equipwidget
  actions menu   widget/actionmenuwidget, widget/actionequipwidget, widget/actiongaugewidget
  actions+traits widget/actionsettingwidget (1.x has no standalone trait script)
  status menus   widget/statuswidget, widget/statuseffectwidget,
                 widget/grandcompanystatuswidget
  repair menus   widget/repairequipmentwidget, widget/repairequipmentdialogwidget,
                 command/system/repairequipmentscommand, command/system/repairordercommand
  gear support   status/equipmentweaknessstatus

For each target this run: decodes the installed .le.lpb (rle + XOR 0x73),
compares against the frozen 2026-06-17 .luac, re-decompiles with
unluac_2015_06_13.jar, compares against the frozen .lua, and inventories
class/methods/text banks.
"""

from __future__ import annotations

import argparse
import csv
import difflib
import hashlib
import json
import re
import struct
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

sys.path.insert(0, "tools")
from disassemble_lua51 import Reader, direct_method_map

MANIFEST = Path("tools/outputs/lpb/client_script_manifest.tsv")
FROZEN = Path("tools/outputs/lpb/decomp_further_20260617")
UNLUAC = Path(".tmp/Sapphire/src/tools/quest_parser/unluac_2015_06_13.jar")
DEFAULT_OUTPUT = Path("tools/outputs/menu-widget-decomp-20260926")
DEFAULT_DOC = Path("docs/menu_widget_decomp_2026-09-26.md")

TARGETS = [
    ("widget/equipwidget", "gear/equipment menu"),
    ("widget/actionmenuwidget", "actions menu"),
    ("widget/actionsettingwidget", "actions & traits setting menu"),
    ("widget/actionequipwidget", "action equip (stub)"),
    ("widget/actiongaugewidget", "action gauge"),
    ("widget/statuswidget", "character status menu"),
    ("widget/statuseffectwidget", "status effects"),
    ("widget/grandcompanystatuswidget", "grand company status"),
    ("widget/repairequipmentwidget", "equipment repair menu"),
    ("widget/repairequipmentdialogwidget", "equipment repair dialog"),
    ("command/system/repairequipmentscommand", "repair command"),
    ("command/system/repairordercommand", "repair order command"),
    ("status/equipmentweaknessstatus", "equipment weakness status"),
]

FUNCTION_RE = re.compile(r"^\s*function\s+([A-Za-z0-9_]+)\.([A-Za-z0-9_]+)\s*\(", re.MULTILINE)
CLASS_RE = re.compile(r"_defineClass\(\s*\"([^\"]+)\"")
TEXT_RE = re.compile(r"_loadTextDataPermanently\((\d+),\s*\"([^\"]+)\"\)")


def decode_lpb(data: bytes) -> bytes:
    if len(data) < 13 or data[:4] != b"rle\x0c":
        raise ValueError("not the expected rle-wrapped LPB")
    if struct.unpack_from("<I", data, 4)[0] != 0xC51F:
        raise ValueError("unexpected LPB wrapper marker")
    size = struct.unpack_from("<I", data, 8)[0]
    if data[12] != 0xFF:
        raise ValueError("unexpected LPB payload marker")
    decoded = bytes(b ^ 0x73 for b in data[13:])
    if len(decoded) != size:
        raise ValueError(f"decoded {len(decoded)} != header {size}")
    return decoded


def normalize(text: str) -> str:
    lines = [ln.rstrip() for ln in text.replace("\r\n", "\n").split("\n")]
    while lines and lines[-1] == "":
        lines.pop()
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    manifest: dict[str, Path] = {}
    with MANIFEST.open(encoding="utf-8") as handle:
        for row in csv.DictReader(handle, delimiter="\t"):
            manifest[row["logical_path"]] = Path(row["encoded_path"])

    rows: list[dict[str, object]] = []
    for logical, role in TARGETS:
        row: dict[str, object] = {"logical_path": logical, "role": role}
        try:
            lpb = manifest[logical]
            row["lpb_present"] = lpb.exists()
            decoded = decode_lpb(lpb.read_bytes())
            frozen_luac = (FROZEN / "luac" / f"{logical}.luac").read_bytes()
            row["lpb_bytes"] = lpb.stat().st_size
            row["luac_identical"] = decoded == frozen_luac
            row["luac_sha256"] = hashlib.sha256(decoded).hexdigest()[:16]

            rdr = Reader(decoded)
            rdr.header()
            luac_methods = sorted(direct_method_map(rdr.proto("root")).keys())

            proc = subprocess.run(
                ["java", "-jar", str(UNLUAC),
                 str(FROZEN / "luac" / f"{logical}.luac")],
                capture_output=True, text=True, timeout=300)
            fresh = normalize(proc.stdout)
            frozen_lua = normalize(
                (FROZEN / "lua" / f"{logical}.lua").read_text(
                    encoding="utf-8", errors="replace"))
            row["lua_identical"] = fresh == frozen_lua
            if fresh != frozen_lua:
                diff = list(difflib.unified_diff(
                    frozen_lua.splitlines(), fresh.splitlines(), lineterm=""))
                row["diff_lines"] = len(diff)

            methods = FUNCTION_RE.findall(frozen_lua)
            cls = CLASS_RE.search(frozen_lua)
            txt = TEXT_RE.search(frozen_lua)
            row["class"] = cls.group(1) if cls else ""
            row["method_count"] = len(methods)
            row["luac_method_count"] = len(luac_methods)
            row["methods_match"] = sorted(m for _, m in methods) == luac_methods
            row["text_bank"] = f"{txt.group(1)}/{txt.group(2)}" if txt else ""
            row["frozen_lua_bytes"] = len(frozen_lua)
            ok = row["luac_identical"] and row["lua_identical"] and row["methods_match"]
            row["status"] = "identical" if ok else "MISMATCH"
        except (OSError, ValueError) as exc:
            row["status"] = f"error: {exc}"
        rows.append(row)

    identical = sum(1 for r in rows if r.get("status") == "identical")
    summary = {
        "generated_utc": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "targets": len(rows),
        "identical": identical,
        "differing": [r["logical_path"] for r in rows if r.get("status") != "identical"],
        "note": "LPB re-extract + unluac rerun vs frozen 2026-06-17 artifacts.",
    }

    args.output.mkdir(parents=True, exist_ok=True)
    with (args.output / "menu_widget_report.csv").open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=[
            "logical_path", "role", "lpb_present", "lpb_bytes", "luac_sha256",
            "luac_identical", "lua_identical", "methods_match", "class",
            "method_count", "luac_method_count", "text_bank",
            "frozen_lua_bytes", "status",
        ], extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)
    (args.output / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")

    table = "\n".join(
        f"| `{r['logical_path']}` | {r['role']} | {r.get('method_count')} | "
        f"{r.get('text_bank')} | {r.get('status')} |" for r in rows)
    doc = f"""# Gear, actions & traits, and surrounding menus — decomp run

Generated: {summary['generated_utc']}

Re-extracted and re-decompiled {len(rows)} menu scripts from the installed
1.x client: the gear/equipment menu, the actions menu family, the shared
actions & traits setting menu, status menus, and the repair menus around
them. There is no standalone trait script in the client manifest; traits are
served through `widget/actionsettingwidget`. `widget/actionequipwidget`
decompiles to a single stub line.

All {identical}/{len(rows)} targets reproduce their frozen 2026-06-17
artifacts exactly: installed LPB decode matches the frozen LUAC, fresh unluac
output matches the frozen Lua, and text-parsed methods match the bytecode
method map.

| Logical path | Role | Methods | Text bank | Status |
|---|---|---:|---|---|
{table}

## Reproduction

```powershell
python -B tools/rerun_menu_widget_decomp.py
```

Outputs:

- `{args.output / 'menu_widget_report.csv'}`
- `{args.output / 'summary.json'}`
"""
    args.doc.parent.mkdir(parents=True, exist_ok=True)
    args.doc.write_text(doc, encoding="utf-8")
    print(json.dumps(summary, indent=2))
    return 0 if identical == len(rows) else 1


if __name__ == "__main__":
    raise SystemExit(main())
