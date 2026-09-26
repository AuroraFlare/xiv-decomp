#!/usr/bin/env python3
"""Read-only extraction of the installed Deepvoid appearance/aura carriers.

Uses the SQL column names, never positional names copied from older reports.
The client is only read; all outputs go to the selected evidence directory.
"""
from __future__ import annotations

import argparse
import collections
import json
import re
import struct
from pathlib import Path

import build_garuda_tornado_decomp as scb
from build_ifrit_ground_vfx_decomp import ascii_strings, digest, payload_tag, walk_resources, write_csv

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT = ROOT / "outputs/atomos-deepvoid-decomp-20260907/deepvoid-aura"
ROSTER = {
    "Watcher": ("m029", (2101714, 2101715)),
    "Pikeman": ("m030", (2101819, 2101821)),
    "Wizard": ("m030", (2101820, 2101822)),
    "Warrior": ("m031", (2101910, 2101911)),
    "Slave": ("m037", (2102507, 2102508)),
    "Scamp": ("m038", (2102612, 2102613)),
    "Sludge": ("m049", (2103405, 2103406)),
    "Butcher": ("m054", (2103504, 2103505)),
    "Soul": ("m505", (2104328, 2104329)),
}


def sql_appearances(path: Path) -> dict[int, dict[str, int]]:
    source = path.read_text(encoding="utf-8-sig")
    schema = source.split("CREATE TABLE IF NOT EXISTS `gamedata_actor_appearance` (", 1)[1].split("PRIMARY KEY", 1)[0]
    columns = re.findall(r"^\s*`([^`]+)`", schema, re.M)
    assert len(columns) == 40 and columns[27:30] == ["head", "body", "legs"]
    rows = {}
    for match in re.finditer(r"INSERT INTO `gamedata_actor_appearance` VALUES \(([^)]+)\)", source):
        values = [int(value) for value in match[1].split(",")]
        assert len(values) == len(columns)
        row = dict(zip(columns, values))
        rows[row["id"]] = row
    return rows


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client", type=Path, default=DEFAULT_CLIENT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    appearance_path = ROOT / "Data/sql/gamedata_actor_appearance.sql"
    appearances = sql_appearances(appearance_path)
    appearance_rows = []
    for name, (model, actor_ids) in ROSTER.items():
        for actor_id in actor_ids:
            row = appearances[actor_id]
            assert row["base"] == 10000 + int(model[1:])
            assert row["head"] == 5120 and row["legs"] == 0
            appearance_rows.append({
                "name": f"Deepvoid {name}", "actor_id": actor_id, "model": model,
                "base": row["base"], "size": row["size"], "head": row["head"],
                "body": row["body"], "legs": row["legs"],
                "head_equipment": (row["head"] >> 10) & 1023,
                "head_variant_low10": row["head"] & 1023,
                "body_equipment": (row["body"] >> 10) & 1023,
                "body_variant_low10": row["body"] & 1023,
                "aura_carrier": f"client/chara/mon/{model}/equ/e005/met_mdl/0001",
            })
    write_csv(output / "appearance_bindings.csv", appearance_rows)

    sources, resources, graph, tokens, references, colors, hooks, action_flags = [], [], [], [], [], [], [], []
    models = sorted({model for model, _ids in ROSTER.values()})
    scb.EXPECTED_MODEL_SCHEDULERS = {}
    for model in models:
        path = args.client / f"client/chara/mon/{model}/equ/e005/met_mdl/0001"
        data = path.read_bytes()
        sources.append({"model": model, "path": str(path), "bytes": len(data), "sha256": digest(data)})
        rows, objects = walk_resources(model, data)
        resources.extend(rows)
        by_tag_id = {(payload_tag(res.payload), res.resource_id): res for _, res in objects}
        for layer, res in objects:
            tag = payload_tag(res.payload)
            if tag == "SEDBSCB":
                clip_rows = scb.parse_scb_graph(model, res.resource_id, res.payload)
                for row in clip_rows:
                    row.pop("active_duration_seconds", None)
                    row.pop("start_seconds", None)
                    row["layer"] = layer
                    row["scheduler_sha256"] = digest(res.payload)
                    row["managed_scheduler"] = ""
                    body = bytes.fromhex(str(row["entry_payload_hex"]))
                    if row["clip_class"] in {"RaptureCasterManagedSchClip", "RaptureCancelChantSyncClip"}:
                        name = body[9:25].split(b"\0", 1)[0].decode("ascii")
                        row["managed_scheduler"] = name
                        assert ("SEDBSCB", name) in by_tag_id, (model, name)
                        hooks.append({"model": model, "scheduler": res.resource_id, "clip_class": row["clip_class"], "start_units": row["start_units"], "target_scheduler": name, "record_offset_hex": row["record_offset_hex"]})
                graph.extend(clip_rows)
            if tag == "SEDBACB":
                flags_a, flags_b = struct.unpack_from("<II", res.payload, 0x9C)
                assert (flags_a, flags_b) == (0xC0, 0x101)
                action_flags.append({"model": model, "resource_id": res.resource_id, "sha256": digest(res.payload), "flags_at_0x9C": f"0x{flags_a:X}", "flags_at_0xA0": f"0x{flags_b:X}"})
            for offset, value in ascii_strings(res.payload):
                if tag in {"SEDBSCB", "SEDBACB", "SEDBvins", "SEDBleaf", "SEDBveff", "SEDBvmdl", "SEDBvtex"}:
                    if any(needle in value for needle in ("awl", "EID_", "QixControl", "DISTORTION", "UVScroll", "UVScale", "LeafLife")):
                        tokens.append({"model": model, "layer": layer, "resource_id": res.resource_id, "tag": tag, "offset_hex": f"0x{offset:X}", "value": value})
            # Typed resource records: ID occupies 16 bytes followed by its FourCC.
            for target_tag, fourcc in (("SEDBvins", b"sniv"), ("SEDBleaf", b"fael"), ("SEDBveff", b"ffev")):
                if (tag, target_tag) not in {("SEDBACB", "SEDBvins"), ("SEDBvins", "SEDBleaf"), ("SEDBleaf", "SEDBveff")}:
                    continue
                for (candidate_tag, target_id), target in by_tag_id.items():
                    if candidate_tag != target_tag:
                        continue
                    encoded = target_id.encode("ascii").ljust(16, b"\0") + fourcc
                    offset = res.payload.find(encoded)
                    if offset >= 0:
                        references.append({"model": model, "from_tag": tag, "from_id": res.resource_id, "record_offset_hex": f"0x{offset:X}", "to_tag": target_tag, "to_id": target_id, "to_sha256": digest(target.payload)})
            if tag == "SEDBveff":
                for match in re.finditer(re.escape(struct.pack("<I", 0x402)), res.payload):
                    offset = match.start()
                    if offset + 52 > len(res.payload):
                        continue
                    raw = res.payload[offset:offset + 52]
                    values = struct.unpack_from("<12f", raw, 4)
                    colors.append({"model": model, "resource_id": res.resource_id, "veff_sha256": digest(res.payload), "offset_hex": f"0x{offset:X}", **{f"f{i:02}": f"{v:.9g}" for i, v in enumerate(values)}, "record_hex": raw.hex(" ")})
        assert any(row["model"] == model and row["value"] == "EID_BODY_DYN" for row in tokens)
        assert not any(payload_tag(res.payload) in {"SEDBmdl", "SEDBskl", "SEDBMCB", "SEDBMTB"} for _, res in objects if model != "m030")

    for filename, rows in (("sources.csv", sources), ("resources.csv", resources), ("scheduler_graph.csv", graph), ("lifecycle_hooks.csv", hooks), ("typed_effect_edges.csv", references), ("attachment_and_control_tokens.csv", tokens), ("raw_color_records.csv", colors), ("action_flags.csv", action_flags)):
        write_csv(output / filename, rows)

    extra_carriers = []
    for path in sorted((args.client / "client/chara/mon").glob("m*/equ/e005/met_mdl/*")):
        data = path.read_bytes()
        if b"mon_awl" in data:
            extra_carriers.append({"path": str(path.relative_to(args.client)), "bytes": len(data), "sha256": digest(data)})
    write_csv(output / "all_installed_e005_awl_carriers.csv", extra_carriers)
    # Show every appearance using these carrier models, including rows outside
    # the named event roster. These are evidence, not inferred event identities.
    other_bindings = []
    candidate_models = {int(Path(row["path"]).parts[3][1:]) for row in extra_carriers}
    for row in appearances.values():
        if row["base"] - 10000 in candidate_models and row["head"] == 5120:
            other_bindings.append({key: row[key] for key in ("id", "base", "size", "head", "body", "legs")})
    write_csv(output / "all_sql_e005_awl_bindings.csv", other_bindings)

    summary = {
        "sql_source": str(appearance_path), "sql_sha256": digest(appearance_path.read_bytes()),
        "actor_count": len(appearance_rows), "model_count": len(models), "resource_count": len(resources),
        "scheduler_clip_count": len(graph), "typed_effect_edge_count": len(references),
        "all_installed_e005_awl_carrier_count": len(extra_carriers),
        "head_value": 5120, "head_equipment": 5, "corrects_old_report": "5120 is SQL head / HEADGEAR 12; body is 1024/1056/2048, legs is 0.",
        "terminal_veff_hashes": sorted({row["sha256"] for row in resources if row["payload_tag"] == "SEDBveff"}),
        "rendered_validation": False,
        "timing_note": "Only raw SCB units are exported; chant/cancellation controls determine persistent lifetime, not the short active block envelope.",
    }
    input_paths = [appearance_path, ROOT / "Data/sql/gamedata_actor_class.sql", ROOT / "Map Server/Actors/Chara/Npc/Npc.cs", ROOT / "Map Server/Actors/Chara/Character.cs", ROOT / "Map Server/Actors/Chara/Player/Player.cs", ROOT / "Map Server/Packets/Send/Actor/SetActorAppearancePacket.cs", Path(__file__), ROOT / "tools/build_ifrit_ground_vfx_decomp.py", ROOT / "tools/build_garuda_tornado_decomp.py"]
    write_csv(output / "input_sources.csv", [{"path": str(path.relative_to(ROOT)), "bytes": path.stat().st_size, "sha256": digest(path.read_bytes())} for path in input_paths])
    (output / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
