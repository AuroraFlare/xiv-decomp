"""Read-only Rivenroad 1.23b command, Lua bytecode and animation recovery.

No client files are modified. Numerical command fields are decoded from the
installed DATs and compared field-for-field with the retained typed CSV export.
Animation resource names describe presentation, not server mechanic timings.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import struct
from pathlib import Path

import build_garuda_command_decomp as commands
from build_gc_mission_decomp import read_chunk
from disassemble_lua51 import direct_method_map, format_instruction
from build_garuda_tornado_decomp import ascii_strings, walk_pwib_resources, read_executable_verified
from build_monster_action_scheduler_contract import parse_scheduler, parse_mtb
from extract_ifrit_bowl_layout_neighborhood import Layout

ROOT = Path(__file__).resolve().parents[1]
IDS = tuple(range(23596, 23618)) + tuple(range(23624, 23628)) + (23631, 23644, 23645)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def build(client, output):
    output.mkdir(parents=True, exist_ok=True)
    read_executable_verified(client)
    schemas, exports, triples = {}, {}, {}
    _, _, names = commands.read_csv(ROOT / "AI Scripts/command.csv")
    for sheet, size in commands.SHEETS.items():
        schemas[sheet], exports[sheet] = commands.schema_for(sheet, size)
        triples[sheet] = commands.existing.discover_rows(client, size)
    rows, manifest = [], {}
    for command in IDS:
        decoded = {}
        for sheet, size in commands.SHEETS.items():
            triple = commands.fixed.find_triple(triples[sheet], command)
            raw = commands.existing.source_fixed_row(client, triples[sheet], size, command)
            fields = commands.decode_row(raw, schemas[sheet], exports[sheet][command], command)
            decoded[sheet] = dict(fields=fields, sha256=sha(raw), raw_hex=raw.hex(),
                                 data_path=triple.data_rel.as_posix(),
                                 offset=commands.fixed.catalog_offset(triple.ranges, size, command))
            for role, relative in (("data", triple.data_rel), ("ranges", triple.range_rel), ("offsets", triple.offset_rel)):
                manifest[relative.as_posix()] = commands.file_record(client / relative, client, f"{sheet}:{role}")
        summary = {label: decoded[sheet]["fields"][str(field)]
                   for sheet, labels in commands.LABELS.items() for field, label in labels.items()}
        rows.append(dict(command=command, name=names[command][3], japanese_name=names[command][2],
                         summary=summary, raw_sheets=decoded))
    write(output / "commands.json", rows)
    write(output / "schemas.json", schemas)

    lua_rows, disassembly = [], []
    recovered = ROOT / "tools/outputs/lpb/content_systems_20260612/luac"
    paths = sorted(recovered.rglob("*whitegeneral*.luac"))
    for path in paths:
        proto = read_chunk(path)
        methods = direct_method_map(proto)
        lua_rows.append(dict(path=path.relative_to(ROOT).as_posix(), sha256=sha(path.read_bytes()),
                             methods={name: dict(parameters=p.numparams, constants=p.constants,
                                                  instructions=len(p.instructions)) for name, p in methods.items()}))
        for name, p in methods.items():
            disassembly.append(f"\n{path.relative_to(recovered)} :: {name}")
            disassembly.extend(format_instruction(p, pc, ins) for pc, ins in enumerate(p.instructions))
    write(output / "lua_methods.json", lua_rows)
    (output / "lua_disassembly.txt").write_text("\n".join(disassembly) + "\n", encoding="utf-8")

    animations, diagnostics = [], []
    for model in (917, 91):
        root = client / f"client/chara/mon/m{model:03}"
        sources = sorted((root / "act").rglob("*")) + sorted((root / "equ").glob("*/*_mdl/*"))
        for path in sources:
            if not path.is_file() or not ("/wss/" in path.as_posix() or "/bid/" in path.as_posix() or "_mdl/" in path.as_posix()):
                continue
            data = path.read_bytes()
            relative = path.relative_to(client).as_posix()
            manifest[relative] = dict(path=relative, bytes=len(data), sha256=sha(data))
            resources = []
            for layer, resource in walk_pwib_resources(data):
                payload = resource.payload
                item = dict(layer=layer, id=resource.resource_id, path=resource.resource_path,
                            tag=payload[:8].hex(), strings=ascii_strings(payload), sha256=sha(payload))
                try:
                    if payload.startswith(b"SEDBSCB"):
                        header, actors, blocks, clips = parse_scheduler(payload)
                        item.update(header=header, actors=actors, blocks=blocks, clips=clips)
                    elif payload.startswith(b"SEDBmtb"):
                        item["motion"] = parse_mtb(payload)
                except ValueError as error:
                    diagnostics.append(dict(path=relative, resource=resource.resource_id, error=str(error)))
                resources.append(item)
            animations.append(dict(path=relative, resources=resources))
    write(output / "animations.json", animations)

    layout_relative = Path("data/AB/F4/00/00.DAT")
    layout_path = client / layout_relative
    layout_data = layout_path.read_bytes()
    layout = Layout(layout_data)
    layout_instances = layout.instances()
    unit_members = []
    for instance in layout_instances:
        node = instance["reference_offset"]
        if instance["reference_type"] != "RefObjects/UnitTree/UnitTreeObject":
            continue
        array = layout.u32(node + 48)
        for member in layout.unit_members(node):
            item = array + member["member_index"] * 48
            x, y, z = struct.unpack_from("<3f", layout.relative, item)
            unit_members.append(dict(owner=instance["reference_name"], x=x, y=y, z=z, **member))
    write(output / "layout.json", dict(source=layout_relative.as_posix(), sha256=sha(layout_data),
                                        instances=layout_instances, unit_members=unit_members))
    manifest[layout_relative.as_posix()] = commands.file_record(
        layout_path, client, "Rivenroad:MapLayoutResourceData")
    write(output / "manifest.json", list(manifest.values()))
    write(output / "diagnostics.json", diagnostics)
    summary = dict(commands=len(rows), lua_chunks=len(lua_rows), animation_files=len(animations),
                   layout_instances=len(layout_instances), layout_members=len(unit_members),
                   source_files=len(manifest), diagnostics=len(diagnostics))
    write(output / "summary.json", summary)
    return summary


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=commands.DEFAULT_CLIENT)
    parser.add_argument("--output", type=Path, default=ROOT / "outputs/rivenroad-decomp-20260907")
    args = parser.parse_args()
    print(json.dumps(build(args.client_root, args.output), indent=2))
