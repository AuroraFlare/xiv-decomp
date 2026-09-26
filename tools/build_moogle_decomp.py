"""Recover Thornmarch's installed command rows and m701 action timelines read-only.

Outputs are derived evidence, not a claim to possess the original server AI.
The installed DATs and retained typed CSV exports must agree byte-for-field.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT / "tools/actions"))
import build_assassin_action_overlay as dat
import build_action_icon_swap_overlay as index
from build_garuda_tornado_decomp import (
    DEFAULT_CLIENT, TYPE_LABELS, ascii_strings, read_executable_verified,
    scb_resource_table, walk_pwib_resources,
)
from build_monster_action_scheduler_contract import parse_mcb, parse_mtb, parse_scheduler

IDS = tuple(range(23414, 23439)) + (23451, 23452, 23453)
FORMATS = {"s8": "b", "u8": "B", "s16": "h", "s32": "i", "float": "f", "bool": "?"}
LABELS = {"gameCommand": {64: "range", 65: "best_range", 66: "minimum_range", 67: "effect_range",
                          108: "damage_attribute", 110: "damage_element"},
          "gameCommandBasic": {76: "cast_seconds", 79: "recast_seconds", 114: "mp_cost", 115: "tp_cost"}}


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def csv_rows(path: Path):
    with path.open(encoding="utf-8-sig", newline="") as handle:
        reader = csv.reader(handle)
        header, types = next(reader), next(reader)
        return header, types, {int(row[0]): row for row in reader if row and row[0].isdigit()}


def commands(client: Path):
    _, _, names = csv_rows(ROOT / "AI Scripts/command.csv")
    result = {id: {"id": id, "name": names[id][3], "summary": {}, "sheets": {}} for id in IDS}
    schemas, manifest = {}, {}
    for sheet, size in (("gameCommand", 180), ("gameCommandBasic", 26)):
        header, types, rows = csv_rows(ROOT / f"docs/Dat Mining/{sheet}.csv")
        fields, offset = [], 0
        for raw_index, kind in enumerate(types[1:], 1):
            if not kind:
                continue
            fmt = "<" + FORMATS[kind]
            field = int(header[raw_index])
            fields.append(dict(field=field, raw_index=raw_index, offset=offset, format=fmt, type=kind,
                               name=LABELS[sheet].get(field)))
            offset += struct.calcsize(fmt)
        if offset != size:
            raise ValueError(f"Unexpected {sheet} row size {offset}")
        schemas[sheet] = fields
        triples = dat.discover_rows(client, size)
        for id in IDS:
            triple = index.find_triple(triples, id)
            raw = dat.source_fixed_row(client, triples, size, id)
            values = {}
            for field in fields:
                value = struct.unpack_from(field["format"], raw, field["offset"])[0]
                exported = rows[id][field["raw_index"]]
                expected = exported == "true" if field["type"] == "bool" else float(exported)
                if abs(value - expected) > 0.00001:
                    raise ValueError(f"CSV mismatch: {id}/{sheet}/{field['field']}")
                values[field["field"]] = value
                if field["name"]:
                    result[id]["summary"][field["name"]] = value
            result[id]["sheets"][sheet] = dict(path=triple.data_rel.as_posix(),
                offset=index.catalog_offset(triple.ranges, size, id), raw_hex=raw.hex(), sha256=sha(raw), fields=values)
            for relative in (triple.data_rel, triple.range_rel, triple.offset_rel):
                manifest[relative.as_posix()] = sha((client / relative).read_bytes())
    return dict(rows=list(result.values()), schemas=schemas, sources=manifest,
                typed_rows_verified=len(IDS) * 2,
                boundaries=["No original server AI, potency formula, or phase timings recovered.",
                            "Duplicate names do not establish phase or animation joins.",
                            "Names are retained CSV text; typed fields are installed DAT bytes."])


def actions(client: Path, output: Path):
    action_root = client / "client/chara/mon/m701/act"
    manifest, summary, diagnostics = [], [], []
    for path in sorted(action_root.rglob("*")):
        if not path.is_file():
            continue
        relative = path.relative_to(client).as_posix()
        data = path.read_bytes()
        resources, clips = [], []
        for depth, resource in walk_pwib_resources(data):
            payload = resource.payload
            entry = dict(depth=depth, id=resource.resource_id, path=resource.resource_path,
                         type=TYPE_LABELS.get(resource.resource_type, hex(resource.resource_type)),
                         bytes=len(payload), sha256=sha(payload))
            entry["effects"] = sorted({s for s in ascii_strings(payload) if ".veffbin" in s})
            try:
                if payload.startswith(b"SEDBSCB"):
                    header, actors, blocks, graph = parse_scheduler(payload)
                    entry.update(header=header, actors=actors, blocks=blocks,
                                 references=scb_resource_table(payload))
                    for clip in graph:
                        clip.update(scheduler=resource.resource_id, depth=depth)
                    clips.extend(graph)
                elif payload.startswith(b"SEDBmtb"):
                    entry["motion"] = parse_mtb(payload)
                elif payload.startswith(b"SEDBMCB"):
                    header, entries = parse_mcb(payload, resource.resource_id)
                    entry.update(header=header, commands=entries)
            except ValueError as error:
                diagnostics.append(dict(path=relative, resource=resource.resource_id, error=str(error)))
            resources.append(entry)
        source = "_".join(path.relative_to(action_root).parts)
        record = dict(source=relative, bytes=len(data), sha256=sha(data), resources=resources, clips=clips)
        (output / f"{source}.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
        manifest.append(dict(path=relative, bytes=len(data), sha256=sha(data)))
        summary.append(dict(source=source, resources=len(resources), clips=len(clips),
                            motions=[r["motion"] for r in resources if "motion" in r],
                            effects=sorted({e for r in resources for e in r["effects"]})))
    return dict(manifest=manifest, summary=summary, diagnostics=diagnostics)


def lua_chunks(source_root: Path, jar: Path, output: Path):
    """Decompile retained client chunks; these are not recovered server scripts."""
    paths = sorted((source_root / "chara/npc/monster/moogle").glob("*.luac"))
    paths += [source_root / "director/monster/monsterdirectordarkmoogle.luac",
              source_root / "director/instanceraid/instanceraiddarkmoogle.luac"]
    if len(paths) != 11 or not jar.is_file() or any(not path.is_file() for path in paths):
        raise ValueError("Expected eleven retained Moogle chunks and an existing unluac JAR")
    destination = output / "lua"
    destination.mkdir(exist_ok=True)
    manifest = []
    for path in paths:
        decoded = subprocess.run(["java", "-jar", str(jar.resolve()), str(path.resolve())],
                                 check=True, capture_output=True)
        target = destination / (path.stem + ".lua")
        target.write_bytes(decoded.stdout)
        manifest.append(dict(source=str(path.resolve()), source_sha256=sha(path.read_bytes()),
                             output=target.relative_to(output).as_posix(),
                             output_sha256=sha(decoded.stdout)))
    evidence = dict(tool=str(jar.resolve()), tool_sha256=sha(jar.read_bytes()), chunks=manifest,
                    boundary="Retained extracted client Lua. No original server combat AI in these class stubs.")
    (output / "lua_manifest.json").write_text(json.dumps(evidence, indent=2) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT)
    parser.add_argument("--output", type=Path, default=ROOT / "outputs/moogle-decomp-20260907")
    parser.add_argument("--lua-jar", type=Path, help="Optional existing unluac JAR; needs Java on PATH")
    parser.add_argument("--luac-root", type=Path,
                        default=ROOT / "tools/outputs/lpb/content_systems_20260612/luac")
    args = parser.parse_args()
    output = args.output.resolve()
    if output == ROOT / "outputs" or not output.is_relative_to(ROOT / "outputs"):
        raise ValueError("Use a dedicated repository outputs directory")
    read_executable_verified(args.client_root)
    output.mkdir(parents=True, exist_ok=True)
    decoded = commands(args.client_root)
    (output / "commands.json").write_text(json.dumps(decoded, indent=2) + "\n", encoding="utf-8")
    action_data = actions(args.client_root, output)
    for name, value in action_data.items():
        (output / f"action_{name}.json").write_text(json.dumps(value, indent=2) + "\n", encoding="utf-8")
    if args.lua_jar:
        lua_chunks(args.luac_root, args.lua_jar, output)
    print(f"Verified {decoded['typed_rows_verified']} typed command rows; decoded {len(action_data['manifest'])} action banks; {len(action_data['diagnostics'])} diagnostics")
    for row in decoded["rows"]:
        if row["name"]:
            print(row["id"], row["name"], row["summary"])


if __name__ == "__main__":
    main()
