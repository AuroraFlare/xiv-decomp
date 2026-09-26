"""Preserve Garuda's installed 1.23b command DAT contract without patching it.

Only the three JSON reports under --output are written. All client inputs and
existing extraction helpers are used read-only; no overlay/patch function runs.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import io
import json
import math
import re
import struct
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT = ROOT / "outputs" / "garuda-command-decomp-20260907"
sys.path.insert(0, str(ROOT / "tools" / "actions"))
import build_action_icon_swap_overlay as fixed  # noqa: E402
import build_assassin_action_overlay as existing  # noqa: E402


# Include unnamed slots without claiming that they implement additional moves.
# 23560..23567 belong to other named command families and are not included.
COMMAND_IDS = tuple(range(23537, 23560)) + tuple(range(23568, 23576))
FORMATS = {"s8": "b", "u8": "B", "s16": "h", "s32": "i", "float": "f", "bool": "?"}
SHEETS = {"gameCommand": 180, "gameCommandBasic": 26}
LABELS = {
    "gameCommand": {
        64: "range", 65: "best_range", 66: "minimum_range", 67: "effect_range",
        108: "damage_attribute", 110: "damage_element",
    },
    "gameCommandBasic": {76: "cast_seconds", 79: "recast_seconds", 114: "mp_cost", 115: "tp_cost"},
}
LUA_SOURCE = Path("tools/outputs/lpb/decomp_further_20260617/lua/command/game/gamecommandbaseclass.lua")
ALIAS_SOURCE = Path("Map Server/Actors/Chara/Ai/BattleCommand.cs")
SQL_SOURCE = Path("Data/sql/server_battle_commands.sql")
UNCERTAIN_VARIANTS = {23992, 23993, 23994, 23995, 23996}


def file_record(path: Path, base: Path, role: str) -> dict:
    data = path.read_bytes()
    return {"path": path.relative_to(base).as_posix(), "role": role,
            "size_bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}


def read_csv(path: Path) -> tuple[list[str], list[str], dict[int, list[str]]]:
    with path.open(encoding="utf-8-sig", newline="") as handle:
        reader = csv.reader(handle)
        header, types = next(reader), next(reader)
        rows = {int(row[0]): row for row in reader if row and row[0].strip().isdigit()}
    return header, types, rows


def schema_for(sheet: str, expected_size: int) -> tuple[dict, dict[int, list[str]]]:
    relative = Path("docs/Dat Mining") / f"{sheet}.csv"
    header, types, rows = read_csv(ROOT / relative)
    fields = []
    offset = 0
    for raw_index, source_type in enumerate(types[1:], 1):
        if not source_type:
            continue
        if source_type not in FORMATS:
            raise ValueError(f"Unsupported type {source_type!r} in {sheet}")
        field = int(header[raw_index])
        fmt = "<" + FORMATS[source_type]
        size = struct.calcsize(fmt)
        fields.append({"sheet_field": field, "raw_csv_index": raw_index,
                       "byte_offset": offset, "size_bytes": size,
                       "source_type": source_type, "struct_format": fmt,
                       "semantic_name": LABELS[sheet].get(field)})
        offset += size
    if offset != expected_size:
        raise ValueError(f"{sheet} schema totals {offset}, expected {expected_size}")
    return {"sheet": sheet, "row_size_bytes": offset, "endianness": "little",
            "schema_source": relative.as_posix(), "fields": fields}, rows


def decode_row(raw: bytes, schema: dict, exported: list[str], command_id: int) -> dict:
    result = {}
    for field in schema["fields"]:
        value = struct.unpack_from(field["struct_format"], raw, field["byte_offset"])[0]
        text = exported[field["raw_csv_index"]]
        if field["source_type"] == "bool":
            if text not in {"true", "false"} or value != (text == "true"):
                raise ValueError(f"{command_id}/{schema['sheet']}/{field['sheet_field']}: bool CSV mismatch")
        elif not math.isclose(value, float(text), rel_tol=1e-6, abs_tol=1e-6):
            raise ValueError(f"{command_id}/{schema['sheet']}/{field['sheet_field']}: {value} != CSV {text}")
        result[str(field["sheet_field"])] = value
    return result


def private_aliases(names: dict[int, str]) -> list[dict]:
    source = (ROOT / ALIAS_SOURCE).read_text(encoding="utf-8")
    method = source.split("public ushort GetClientPresentationId", 1)[1].split(
        "public uint GetClientPresentationAnimationId", 1)[0]
    mappings = {int(a): int(b) for a, b in re.findall(r"case\s+(239\d\d):\s*return\s+(235\d\d);", method)
                if 23989 <= int(a) <= 23999}
    if set(mappings) != set(range(23989, 24000)):
        raise ValueError("Expected all eleven private Garuda client-ID mappings")
    sql = (ROOT / SQL_SOURCE).read_text(encoding="utf-8")
    aliases = []
    for private_id, canonical_id in sorted(mappings.items()):
        match = re.search(rf"^INSERT INTO `?server_battle_commands`? VALUES \(({private_id},[^\r\n]+)\);", sql, re.M)
        if match is None:
            raise ValueError(f"Missing private SQL row {private_id}")
        row = next(csv.reader(io.StringIO(match.group(1)), skipinitialspace=True, quotechar="'"))
        if len(row) != 46:
            raise ValueError(f"Unexpected SQL schema for {private_id}")
        aliases.append({
            "private_id": private_id, "private_name": row[1], "canonical_id": canonical_id,
            "canonical_name": names[canonical_id], "join_source": ALIAS_SOURCE.as_posix(),
            "join_kind": "current_server_implementation_not_retail_packet_capture",
            "duplicate_named_variant_requires_phase_or_actor_join": private_id in UNCERTAIN_VARIANTS,
            "retail_phase_join_recovered": False,
            "selected_wss_proven_by_this_mapping": False,
            "current_seed": {"cast_ms": int(row[26]), "selected_target_range": float(row[17]),
                             "aoe_type": int(row[7]), "aoe_maximum": float(row[8]),
                             "aoe_minimum": float(row[9]), "action_type": int(row[42]),
                             "action_property": int(row[43]), "battle_animation": int(row[34])},
        })
    return aliases


def build(client: Path) -> dict[str, dict]:
    _, _, joined = read_csv(ROOT / "AI Scripts/command.csv")
    names = {command_id: joined[command_id][3] for command_id in COMMAND_IDS}
    schemas, exported, triples = {}, {}, {}
    for sheet, size in SHEETS.items():
        schemas[sheet], exported[sheet] = schema_for(sheet, size)
        triples[sheet] = existing.discover_rows(client, size)

    sources = {}
    decoded = []
    for command_id in COMMAND_IDS:
        values, raw_sheets = {}, {}
        for sheet, size in SHEETS.items():
            triple = fixed.find_triple(triples[sheet], command_id)
            raw = existing.source_fixed_row(client, triples[sheet], size, command_id)
            if len(raw) != size:
                raise ValueError(f"Truncated {sheet} row {command_id}")
            values[sheet] = decode_row(raw, schemas[sheet], exported[sheet][command_id], command_id)
            raw_sheets[sheet] = {
                "data_path": triple.data_rel.as_posix(),
                "row_byte_offset": fixed.catalog_offset(triple.ranges, size, command_id),
                "row_size_bytes": size, "row_sha256": hashlib.sha256(raw).hexdigest(),
                "raw_hex": raw.hex(), "fields": values[sheet],
            }
            for role, relative in (("data", triple.data_rel), ("ranges", triple.range_rel), ("offsets", triple.offset_rel)):
                sources[relative.as_posix()] = file_record(client / relative, client, f"{sheet}:{role}")
        summary = {label: values[sheet][str(field)] for sheet, labels in LABELS.items()
                   for field, label in labels.items()}
        decoded.append({"command_id": command_id, "english_name": names[command_id],
                        "name_source": "AI Scripts/command.csv raw index 3 (English text export)",
                        "named_action": bool(names[command_id].strip(".*- ")),
                        "summary": summary, "raw_sheets": raw_sheets,
                        "all_typed_fields_match_exported_csv": True})

    by_id = {row["command_id"]: row for row in decoded}
    for command_id, radius, minimum in ((23556, 12, 0), (23559, 44, 12), (23544, 0, 0), (23573, 8, 0)):
        summary = by_id[command_id]["summary"]
        if (summary["range"], summary["minimum_range"]) != (radius, minimum):
            raise ValueError(f"Installed client does not match audited Garuda baseline {command_id}")
    repository_sources = [Path(__file__).relative_to(ROOT), LUA_SOURCE, ALIAS_SOURCE, SQL_SOURCE,
                          Path("AI Scripts/command.csv"), Path("docs/Dat Mining/gameCommand.csv"),
                          Path("docs/Dat Mining/gameCommandBasic.csv"),
                          Path("tools/actions/build_assassin_action_overlay.py"),
                          Path("tools/actions/build_action_icon_swap_overlay.py"),
                          Path("tools/actions/build_custom_gladiator_action_dats.py")]
    return {
        "decoded_rows.json": {"format_version": 1, "command_ids": list(COMMAND_IDS), "rows": decoded,
                              "current_private_aliases": private_aliases(names),
                              "boundaries": [
                                  "Names come from retained English CSV text; numbers come from installed DAT bytes.",
                                  "Unnamed neighboring slots are preserved, not asserted as additional mechanics.",
                                  "Repeated Mistral, Aerial, and Featherlance names do not recover their retail phase/actor join.",
                                  "getCommandRangeLength returns range and minimum separately; they are not added.",
                                  "Native WSS joins, cone selectors, potency, status duration, and phase timing are not recovered here.",
                                  "Private seed values describe current implementation; Lua execution/phase overrides may differ.",
                              ]},
        "field_schema.json": {"format_version": 1, "index_convention": "sheet_field = raw_csv_index - 1; ID occupies raw index 0",
                              "semantic_source": LUA_SOURCE.as_posix(), "sheets": list(schemas.values())},
        "source_hashes.json": {"format_version": 1, "client_root": str(client),
                               "client_files": [sources[key] for key in sorted(sources)],
                               "repository_files": [file_record(ROOT / path, ROOT, "audit_input_or_helper")
                                                    for path in repository_sources],
                               "client_mutations": False, "database_access": False,
                               "verification": {"row_count": len(decoded), "typed_rows_checked": len(decoded) * len(SHEETS),
                                                "all_typed_fields_match_csv": True}},
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true", help="Rebuild in memory and verify existing reports without writing")
    args = parser.parse_args()
    client, output = args.client_root.resolve(), args.output.resolve()
    outputs_root = (ROOT / "outputs").resolve()
    if not output.is_relative_to(outputs_root) or output == outputs_root or output.is_relative_to(client):
        raise ValueError("Output must be a dedicated repository outputs subdirectory, never the client")
    reports = build(client)
    for name, report in reports.items():
        rendered = json.dumps(report, ensure_ascii=False, indent=2, allow_nan=False) + "\n"
        destination = output / name
        if args.check:
            if not destination.is_file() or destination.read_text(encoding="utf-8") != rendered:
                raise ValueError(f"Stale or missing report: {destination}")
        else:
            output.mkdir(parents=True, exist_ok=True)
            destination.write_text(rendered, encoding="utf-8", newline="\n")
    mode = "Verified" if args.check else "Wrote"
    print(f"{mode} {len(reports)} reports, {len(COMMAND_IDS)} command IDs, {len(COMMAND_IDS) * len(SHEETS)} typed DAT rows: {output}")


if __name__ == "__main__":
    main()
