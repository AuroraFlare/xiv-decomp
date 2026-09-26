"""Read-only exact bytecode/native slices for the enlistment cleanup review."""
from pathlib import Path
import hashlib
import json
import sys

ROOT = Path(__file__).resolve().parents[4]
OUT = Path(__file__).parent
sys.path.insert(0, str(ROOT / "tools"))
from disassemble_lua51 import Reader, direct_method_map, format_instruction

SELECTED = {
    "tools/outputs/lpb/decomp_further_20260617/luac/chara/player/playerbaseclass.luac": ["_onPostEvent"],
    "tools/outputs/lpb/decomp_further_20260617/luac/chara/npc/npcbaseclass.luac": ["delegateEvent", "_onEventCancel"],
    "tools/outputs/lpb/decomp_further_20260617/luac/chara/npc/npcbaseclass_event.luac": ["finishCliantTalkTurn"],
    "tools/outputs/lpb/decomp_further_20260617/luac/chara/npc/populace/populacecompanyofficer.luac": ["eventTalkStepBreak", "eventRankUpDone"],
    "tools/outputs/lpb/decomp_further_20260617/luac/widget/desktopwidget_connector.luac": [
        "closeGrandCompanyStatusWidget", "closeAllEventModeWidget", "getWidget", "getWidgetByName",
        "closeWidget", "closeWidgetDirect", "closeWidgetLocal", "closeWidgetRecursive"],
}

sources, slices = [], []
for relative, names in SELECTED.items():
    raw = (ROOT / relative).read_bytes()
    reader = Reader(raw); reader.header(); methods = direct_method_map(reader.proto("root"))
    sources.append({"path": relative, "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest(), "methods": names})
    for name in names:
        proto = methods[name]
        slices.append(f"\n## {relative}::{name} params={proto.numparams}\n")
        slices.extend(format_instruction(proto, pc, instruction) + "\n" for pc, instruction in enumerate(proto.instructions))
(OUT / "enlistment-cleanup-bytecode.txt").write_text("".join(slices), encoding="utf-8")

asm = ROOT.parent / "IDA Free/ffxivgame.exe_20260527205729.asm"
ranges = [(0x4D895F, 0x4D899B), (0x575050, 0x57505B), (0x8977B0, 0x897902),
          (0xDC014A, 0xDC017A), (0x1056AA4, 0x1056ABD), (0x1056C58, 0x1056C8C), (0x1056D28, 0x1056D5C)]
native = []
with asm.open("r", encoding="utf-8", errors="replace") as stream:
    for number, line in enumerate(stream, 1):
        try:
            address = int(line[:8], 16)
        except ValueError:
            continue
        if any(start <= address < end for start, end in ranges):
            native.append(f"line {number}: {line}")
with asm.open("rb") as stream:
    digest = hashlib.file_digest(stream, "sha256").hexdigest()
sources.append({"path": str(asm), "bytes": asm.stat().st_size, "sha256": digest,
                "ranges": [[hex(start), hex(end)] for start, end in ranges]})
(OUT / "enlistment-cleanup-native.txt").write_text("".join(native), encoding="utf-8")
(OUT / "enlistment-cleanup-sources.json").write_text(json.dumps(sources, indent=2) + "\n", encoding="utf-8")
print(f"Saved {len(SELECTED)} bytecode sources and {len(native)} bounded native lines.")
