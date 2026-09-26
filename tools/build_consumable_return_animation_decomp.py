"""Read-only evidence extraction for consumable and Return animation research.

Does not send packets, change the installed client, or modify server behavior.
Scheduler units are preserved raw: the existing parser's seconds conversion is
not established here and disagrees with some embedded motion frame counts.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import struct
from pathlib import Path

from build_garuda_tornado_decomp import (
    ascii_strings, pe_bytes, pe_dwords, walk_pwib_resources, scb_resource_table,
)
from build_monster_action_scheduler_contract import parse_scheduler, parse_mtb

ROOT = Path(__file__).resolve().parents[1]
CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
OUTPUT = ROOT / "outputs/consumable-return-animation-decomp-20260904"
EXECUTABLE_SHA256 = "9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9"


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def pack(category: int, bank: int, effect: int) -> int:
    if not 0 <= category <= 255 or not 0 <= bank <= 4095 or not 0 <= effect <= 4095:
        raise ValueError("animation fields outside 8/12/12-bit bounds")
    return category << 24 | bank << 12 | effect


def category_rows(executable: bytes) -> list[dict]:
    rows = []
    # 0x798640 reads the path pointer at +0; 0x7982D0 reads +4/+5/+8.
    # Do not shift the pointer by four bytes: that silently names the NEXT row.
    for category in range(33):
        address = 0xFE32D8 + category * 12
        pointer = pe_dwords(executable, address, 1)[0]
        name = pe_bytes(executable, pointer, 16).split(b"\0", 1)[0].decode("ascii")
        chara, vfx, kind = struct.unpack("<BB2xI", pe_bytes(executable, address + 4, 8))
        rows.append(dict(category=category, path=name, chara_bank=chara,
                         vfx_bank=vfx, route_kind=kind, table_va=f"0x{address:08X}"))
    return rows


def selected_files(client: Path) -> list[Path]:
    paths = set()
    for race in sorted((client / "client/chara/pc").iterdir()):
        if not race.is_dir():
            continue
        for lane in ("em1", "em2", "em3"):
            for bank in (4001, 4002, 4003, 4004):
                path = race / f"act/cmn/{lane}/base/{bank:04d}"
                if path.is_file():
                    paths.add(path)
        for bank in (290, 291):
            path = race / f"act/cmn/lib/base/{bank:04d}"
            if path.is_file():
                paths.add(path)
        path = race / "act/cmn/mgc/base/0001"
        if path.is_file():
            paths.add(path)
    for lane in ("itm", "pop"):
        paths.update(p for p in (client / "client/vfx" / lane).iterdir() if p.is_file())
    paths.update(client / f"client/vfx/mgc/{bank:04d}" for bank in (102, 148))
    return sorted(paths)


def write_csv(path: Path, rows: list[dict]) -> None:
    fields = list(dict.fromkeys(k for row in rows for k in row))
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def build(client: Path, output: Path) -> dict:
    executable = (client / "ffxivgame.exe").read_bytes()
    if digest(executable) != EXECUTABLE_SHA256:
        raise ValueError("executable differs from the verified image; native offsets must be reviewed")
    output.mkdir(parents=True, exist_ok=True)
    manifest, resources, schedulers, clips, motions, failures = [], [], [], [], [], []
    authored_paths = []
    for path in selected_files(client):
        data = path.read_bytes()
        rel = path.relative_to(client).as_posix()
        manifest.append(dict(path=rel, bytes=len(data), sha256=digest(data)))
        for value in sorted(set(ascii_strings(data, minimum=10))):
            if "\\" in value and any(token in value.lower() for token in
                                       ("potion", "mesi", "reise", "mah1_rei", "getting_up", "body_up")):
                authored_paths.append(dict(path=rel, authored_path=value))
        for layer, resource in walk_pwib_resources(data):
            payload = resource.payload
            identity = dict(path=rel, layer=layer, resource=resource.resource_id,
                            resource_path=resource.resource_path)
            resources.append(dict(**identity, tag=payload[:8].decode("ascii", errors="replace"),
                                  bytes=len(payload), sha256=digest(payload)))
            if payload.startswith(b"SEDBSCB"):
                try:
                    summary, actors, blocks, records = parse_scheduler(payload)
                    for block in blocks:
                        block.pop("duration_seconds", None)
                    schedulers.append(dict(**identity, **summary, actors=actors,
                                           blocks=blocks, refs=scb_resource_table(payload)))
                    for record in records:
                        record.pop("start_seconds", None)
                        offset = int(record["record_offset_hex"], 16)
                        record["body_hex"] = payload[offset + 8:offset + record["record_size"]].hex()
                        clips.append(dict(**identity, **record))
                except ValueError as error:
                    failures.append(dict(**identity, error=str(error)))
            elif payload.startswith(b"SEDBmtb"):
                try:
                    motions.append(dict(**identity, **parse_mtb(payload)))
                except ValueError as error:
                    failures.append(dict(**identity, error=str(error)))

    categories = category_rows(executable)
    write_csv(output / "source_manifest.csv", manifest)
    write_csv(output / "resource_inventory.csv", resources)
    write_csv(output / "scheduler_clips.csv", clips)
    write_csv(output / "motion_headers.csv", motions)
    write_csv(output / "native_categories.csv", categories)
    write_csv(output / "authored_paths.csv", authored_paths)
    write_csv(output / "parse_failures.csv", failures)
    (output / "schedulers.json").write_text(json.dumps(schedulers, indent=2) + "\n", encoding="utf-8")

    # These assertions check the recovered graph, not current server constants.
    def graph(path: str, scheduler: str) -> list[dict]:
        return [c for c in clips if c["path"] == path and c["resource"] == scheduler]

    eat_path = "client/chara/pc/c001/act/cmn/em1/base/4003"
    drink_path = "client/chara/pc/c001/act/cmn/em1/base/4002"
    for path, motion in ((eat_path, "cbnm_eat"), (drink_path, "cbnm_drink")):
        assert any(c["resource_ref_id"] == motion for c in graph(path, "itm00"))
        assert any(c["scheduler_target_name"] == "food_vfx" for c in graph(path, "itm00"))
        assert not graph(path, "main"), f"unexpected main scheduler: {path}"
    for path in ("client/vfx/itm/0001", "client/vfx/itm/0101", "client/vfx/itm/0102"):
        children = {c["scheduler_target_name"] for c in graph(path, "main")}
        assert {"itm00", "item_main"} <= children
    assert any(c["resource_ref_id"] == "cbnm_revive"
               for c in graph("client/vfx/mgc/0102", "main"))
    assert not any(c["clip_class"] == "MotionClip" for c in clips
                   if c["path"] == "client/vfx/mgc/0148")
    assert categories[5]["route_kind"] == 7 and categories[5]["path"] == "emt"
    assert categories[6]["route_kind"] == 6 and categories[6]["path"] == "em1"

    summary = dict(
        executable_sha256=digest(executable), files=len(manifest),
        resources=len(resources), schedulers=len(schedulers), clips=len(clips),
        motion_headers=len(motions), parse_failures=failures,
        runtime_tested=False,
        timing_note="SCB units retained raw; no conversion to seconds asserted. MTB frames/fps are separate header evidence.",
        probe_ids={
            "eat_bread_visual": f"0x{pack(5, 4003, 101):08X}",
            "drink_visual": f"0x{pack(5, 4002, 102):08X}",
            "generic_item_effect_1": f"0x{pack(5, 4001, 1):08X}",
            "revive_effect_only": f"0x{pack(1, 0, 102):08X}",
            "getting_up_motion": f"0x{pack(4, 290, 0):08X}",
            "body_up_motion": f"0x{pack(4, 291, 0):08X}",
        },
    )
    (output / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    return summary


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client", type=Path, default=CLIENT)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()
    result = build(args.client, args.output)
    print(json.dumps(result, indent=2))
    if result["parse_failures"]:
        raise SystemExit(1)
