#!/usr/bin/env python3
"""Decode Of Men They Sing cutscene actor dictionaries and transforms."""

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
    "man40200": (31216, 8, 2),
    "man40210": (287456, 17, 7),
    "man40220": (20976, 6, 7),
    "man40230": (67648, 8, 2),
}

TRACKED_LABELS = {
    "man40200": ("TATARU", "PC", "MINFILIA", "dami_rrm", "dami_bb", "dami_elf", "dami_hm", "obj"),
    "man40210": (
        "PC",
        "sNPC",
        "aramigo_rrm",
        "aramigo_hf",
        "obj",
        "AHLDWAEN_cp",
        "TROEGMOER_cp",
        "aramigo_bb",
        "mon_haiena1",
        "mon_haiena2",
        "dami_rrm",
        "aramigo_mc",
        "pt1",
        "pt2",
        "aramigo_rd",
        "dami_rrm2",
        "dami_hm2",
    ),
    "man40220": ("PC", "sNPC", "dami_rrm", "aramigo_jyujyut", "pt1", "pt2"),
    "man40230": ("TATARU", "PC", "snpc", "dami_rrm", "dami_elf", "dami_hm", "dami_mc", "dami_obg"),
}

EXPECTED_ACTOR_IDS = {
    ("man40200", "TATARU"): 1001046,
    ("man40200", "MINFILIA"): 1000843,
    ("man40210", "aramigo_rrm"): 1000480,
    ("man40210", "aramigo_hf"): 1000478,
    ("man40210", "obj"): 1200013,
    ("man40210", "AHLDWAEN_cp"): 1500069,
    ("man40210", "TROEGMOER_cp"): 1500095,
    ("man40210", "aramigo_bb"): 1000477,
    ("man40210", "mon_haiena1"): 1001370,
    ("man40210", "mon_haiena2"): 1001370,
    ("man40210", "aramigo_mc"): 1001239,
    ("man40210", "aramigo_rd"): 1001240,
    ("man40220", "aramigo_jyujyut"): 1001239,
    ("man40230", "TATARU"): 1001046,
}

EXPECTED_ANCHORS = {
    ("man40200", "TATARU"): (((-38.994, 0.000, -2.514), -0.808),),
    ("man40200", "PC"): (((-39.967, -0.001, -1.677), 2.306),),
    ("man40210", "PC"): (
        ((1689.109, 20.419, -855.612), 2.575),
        ((1690.881, 20.171, -857.553), 2.539),
    ),
    ("man40210", "sNPC"): (((1694.418, 19.997, -861.227), -2.319),),
    ("man40210", "aramigo_mc"): (((1984.491, 31.996, -1680.115), -0.302),),
    ("man40210", "mon_haiena1"): (((1987.319, 32.733, -1713.693), -0.339),),
    ("man40210", "mon_haiena2"): (((1989.393, 32.656, -1714.478), -0.339),),
    ("man40220", "PC"): (((1870.347, 19.690, -1731.395), 1.457),),
    ("man40220", "sNPC"): (((1872.844, 19.809, -1731.084), -1.672),),
    ("man40230", "TATARU"): (((-38.994, 0.000, -2.514), -0.808),),
    ("man40230", "PC"): (((-40.019, -0.001, -1.648), 2.306),),
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
            actor = actors[label]
            expected_actor_id = EXPECTED_ACTOR_IDS.get((scene, label))
            if expected_actor_id is not None and actor.actor_id != expected_actor_id:
                raise AssertionError(
                    f"{scene}/{label}: expected actor {expected_actor_id}, found {actor.actor_id}"
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
    parser = argparse.ArgumentParser()
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT_ROOT)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    summaries, placements = decode(args.client_root)
    if args.json:
        print(
            json.dumps(
                {
                    "client_root": str(args.client_root),
                    "scenes": summaries,
                    "actors": [json_ready(row) for row in placements],
                },
                indent=2,
            )
        )
    else:
        print("Of Men They Sing (Man402) cutscene setup decode")
        print(f"Client root: {args.client_root}")
        print("Scenes: " + ", ".join(f"{row['scene']}={row['bytes']} bytes" for row in summaries))
        for row in placements:
            if not row.placements:
                continue
            print(f"{row.scene}/{row.label} actor={row.actor_id} index={row.actor_index}")
            for record in row.placements:
                xyz = ", ".join(f"{value:.3f}" for value in record.position)
                print(f"  0x{record.offset:X} opcode={record.opcode} ({xyz}) rot={record.rotation:.3f}")
        print("Boundary: these are cutscene-managed transforms, not persistent world-spawn records.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
