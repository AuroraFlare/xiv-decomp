#!/usr/bin/env python3
"""Decode Lord Errant cutscene actor dictionaries and spatial records.

The scene-specific opcodes below were identified structurally. Regression
anchors are checked only after decoding and are never used to locate records.
"""

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
    "man30800": (89312, 4, 1),
    "man30810": (62992, 9, 1),
    "man30820": (49056, 11, 9),
    "man30830": (16304, 5, 1),
    "man30850": (4777472, 15, 2),
    "man30860": (9360, 3, 2),
    "man30880": (2358128, 15, 15),
    "man30890": (94496, 7, 6),
    "man30900": (44960, 7, 8),
    "man40640": (9909200, 27, 26),
}

TRACKED_LABELS = {
    "man30800": ("PC", "SNPC", "Silphu_A", "Silphu_B"),
    "man30810": ("PC", "SNPC", "Amalja_A", "Amalja_B", "Amalja_C", "Amalja_D", "Amalja_E"),
    "man30820": ("PC",),
    "man30830": ("PC", "SNPC", "Amalja_A", "Amalja_B", "Amalja_E"),
    "man30850": ("PC", "SNPC", "etra_F_Lal_A", "etra_F_Lal_B", "etra_M_Elz", "etra_M_Hur", "IFLEAT"),
    "man30860": ("Amalja_P_A", "Amalja_D", "Amalja_E"),
    "man30880": ("PC", "SNPC", "etra_F_Lal_A", "etra_F_Lal_B", "etra_M_Elz", "etra_M_Hur", "IFLEAT"),
    "man30890": ("PC", "SNPC", "Silphu_A", "Silphu_B", "Ama_A", "Ama_B", "Ama_C"),
    "man30900": ("MINFILIA", "PC", "TATARU"),
    "man40640": ("c00100", "c00190", "c006a0", "c006b0", "c003c0", "c001d0", "m852e0"),
}

EXPECTED_ACTOR_IDS = {
    ("man30800", "Silphu_A"): 1001085,
    ("man30800", "Silphu_B"): 1001086,
    ("man30830", "Amalja_A"): 1000517,
    ("man30830", "Amalja_B"): 1000518,
    ("man30830", "Amalja_E"): 1000612,
    ("man30850", "etra_F_Lal_A"): 6000116,
    ("man30850", "etra_F_Lal_B"): 6000117,
    ("man30850", "etra_M_Elz"): 6000118,
    ("man30850", "etra_M_Hur"): 6000119,
    ("man30850", "IFLEAT"): 6000242,
    ("man30860", "Amalja_P_A"): 2206513,
    ("man30860", "Amalja_D"): 2206506,
    ("man30860", "Amalja_E"): 2206506,
    ("man30900", "MINFILIA"): 1000843,
    ("man30900", "TATARU"): 1001046,
    ("man40640", "c006a0"): 6000116,
    ("man40640", "c006b0"): 6000117,
    ("man40640", "c003c0"): 6000118,
    ("man40640", "c001d0"): 6000119,
    ("man40640", "m852e0"): 6000242,
}

EXPECTED_ANCHORS = {
    ("man30800", "PC"): (((1240.229, 319.338, 746.182), -0.929),),
    ("man30810", "PC"): (
        ((1134.053, 312.430, 830.706), -1.649),
        ((1000.714, 308.565, 985.779), 1.541),
    ),
    ("man30820", "PC"): (((-96.391, 6.610, 25.016), -2.469),),
    ("man30830", "PC"): (((995.168, 309.146, 982.116), -2.519),),
    ("man30830", "SNPC"): (((996.166, 309.178, 980.941), -2.240),),
    ("man30830", "Amalja_A"): (((990.180, 309.682, 979.995), 1.795),),
    ("man30830", "Amalja_B"): (((992.990, 309.931, 976.904), -0.001),),
    ("man30830", "Amalja_E"): (((992.674, 309.542, 979.550), 0.822),),
    ("man30860", "Amalja_P_A"): (((2535.898, 249.642, 2219.305), -2.178),),
    ("man30890", "PC"): (((1217.650, 311.707, 776.001), -0.931),),
    ("man30890", "SNPC"): (((1217.388, 311.818, 774.381), -0.868),),
    ("man30900", "PC"): (((-40.159, 0.000, -1.605), 2.209),),
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
                raise AssertionError(f"{scene}/{label}: expected actor {expected_actor_id}, found {actor.actor_id}")
        actor_indexes = {actors[label].index for label in tracked}
        spatial = [
            record
            for record in scan_spatial_records(data, actor_indexes)
            if record.opcode == opcode
        ]
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
            candidates = unique_records([record for record in spatial if record.actor_index == actor.index])
            placements.append(ActorPlacements(scene, label, actor.index, actor.actor_id, candidates))

    by_key = {(row.scene, row.label): row for row in placements}
    for key, anchors in EXPECTED_ANCHORS.items():
        for expected_position, expected_rotation in anchors:
            if not any(close_transform(record, expected_position, expected_rotation) for record in by_key[key].placements):
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
    client_root = args.client_root.resolve()
    summaries, placements = decode(client_root)
    if args.json:
        print(json.dumps({"client_root": str(client_root), "scenes": summaries, "actors": [json_ready(row) for row in placements]}, indent=2))
    else:
        print("Lord Errant (Man308) cutscene setup decode")
        print(f"Client root: {client_root}")
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
