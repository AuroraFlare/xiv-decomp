#!/usr/bin/env python3
"""Decode Forever Taken cutscene actor dictionaries and spatial anchors."""

from __future__ import annotations

import argparse
import json
from dataclasses import asdict
from pathlib import Path

from decompile_man300_cutscene_setup import (
    ActorPlacements,
    close_transform,
    decode_actor_dictionary,
    scan_spatial_records,
    unique_records,
)


DEFAULT_CLIENT_ROOT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
SCENE_METADATA = {
    "man30400": (294992, 11, 7),
    "man30410": (55104, 8, 7),
    "man30420": (70832, 12, 5),
    "man30430": (116160, 4, 5),
}

TRACKED_LABELS = {
    "man30400": ("MINFILIA", "PC", "SNPC", "Sylph_a", "Sylph_b", "HEDYN"),
    "man30410": ("PC", "SNPC", "Sylph_a", "Sylph_b"),
    "man30420": ("MINFILIA", "PC", "snpc"),
    "man30430": ("MINFILIA", "PC", "snpc"),
}

EXPECTED_ACTOR_IDS = {
    ("man30400", "MINFILIA"): 1000843,
    ("man30400", "Sylph_a"): 1001085,
    ("man30400", "Sylph_b"): 1001086,
    ("man30400", "HEDYN"): 1001047,
    ("man30420", "MINFILIA"): 1000843,
    ("man30430", "MINFILIA"): 1000843,
}

EXPECTED_ANCHORS = {
    ("man30400", "PC"): (((-39.280, -0.006, -1.616), -3.142),),
    ("man30410", "PC"): (((-33.488, -1.954, -36.533), 2.883),),
    ("man30420", "PC"): (((-28.064, -3.000, -48.384), -2.117),),
    ("man30430", "PC"): (((35.392, 1.204, -0.899), 1.561),),
}


def decode(client_root: Path) -> tuple[list[dict[str, object]], list[ActorPlacements]]:
    summaries: list[dict[str, object]] = []
    placements: list[ActorPlacements] = []
    for scene, (expected_size, expected_count, opcode) in SCENE_METADATA.items():
        path = client_root / "client" / "cut" / scene / scene
        data = path.read_bytes()
        actors = decode_actor_dictionary(data)
        if len(data) != expected_size:
            raise AssertionError(f"{scene}: expected {expected_size} bytes, found {len(data)}")
        if len(actors) != expected_count:
            raise AssertionError(f"{scene}: expected {expected_count} actors, found {len(actors)}")

        tracked = TRACKED_LABELS[scene]
        missing = [label for label in tracked if label not in actors]
        if missing:
            raise AssertionError(f"{scene}: missing actor labels {missing}")
        for label in tracked:
            expected_actor_id = EXPECTED_ACTOR_IDS.get((scene, label))
            if expected_actor_id is not None and actors[label].actor_id != expected_actor_id:
                raise AssertionError(
                    f"{scene}/{label}: expected actor {expected_actor_id}, found {actors[label].actor_id}"
                )

        actor_indexes = {actors[label].index for label in tracked}
        spatial = [record for record in scan_spatial_records(data, actor_indexes) if record.opcode == opcode]
        summaries.append(
            {
                "scene": scene,
                "path": str(path),
                "bytes": len(data),
                "actor_records": len(actors),
                "spatial_opcode": opcode,
                "spatial_records": len(spatial),
            }
        )
        for label in tracked:
            actor = actors[label]
            records = unique_records([record for record in spatial if record.actor_index == actor.index])
            placements.append(ActorPlacements(scene, label, actor.index, actor.actor_id, records))

    by_key = {(row.scene, row.label): row for row in placements}
    for key, anchors in EXPECTED_ANCHORS.items():
        for expected_position, expected_rotation in anchors:
            if not any(
                close_transform(record, expected_position, expected_rotation)
                for record in by_key[key].placements
            ):
                raise AssertionError(f"{key[0]}/{key[1]}: expected transform was not decoded")
    return summaries, placements


def json_ready(row: ActorPlacements) -> dict[str, object]:
    payload = asdict(row)
    for record in payload["placements"]:
        record["offset_hex"] = f"0x{record['offset']:X}"
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT_ROOT)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()
    summaries, placements = decode(args.client_root.resolve())
    if args.json:
        print(json.dumps({"scenes": summaries, "actors": [json_ready(row) for row in placements]}, indent=2))
    else:
        print("Forever Taken (Man304) cutscene setup decode")
        print("Scenes: " + ", ".join(f"{row['scene']}={row['bytes']} bytes" for row in summaries))
        for row in placements:
            if row.placements:
                print(f"{row.scene}/{row.label} actor={row.actor_id} placements={len(row.placements)}")
        print("Boundary: these are cutscene-managed transforms, not persistent world destinations.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
