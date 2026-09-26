#!/usr/bin/env python3
"""Decode Futures Perfect cutscene actor dictionaries and spatial anchors."""

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
    "man40600": (61984, 13, 6),
    "man40610": (77360, 12, 5),
    "man40615": (85664, 13, 5),
    "man40620": (197632, 15, 5),
    "man40625": (386144, 12, 4),
    "man40630": (153264, 14, 5),
    "man40635": (16254448, 52, 30),
    "man40640": (9909200, 27, 26),
    "man40645": (56416, 6, 3),
    "man40650": (311760, 19, 3),
    "man40660": (45296, 9, 0),
}

TRACKED_LABELS = {
    "man40600": (
        "MINFILIA", "PC", "snpc", "aramigo_leader", "aramigo_rd",
        "aramigo_bb", "aramigo_hf", "aramigo_hf2", "aramigo_rrm",
        "aramigo_hm", "aramigo_elz", "SAHJA_ZHWAN",
    ),
    "man40610": (
        "MINFILIA", "PC", "snpc", "aramigo_leader", "aramigo_rd",
        "aramigo_bb", "aramigo_hf", "aramigo_hf2", "aramigo_rrm",
        "aramigo_hm", "aramigo_elz",
    ),
    "man40615": ("MINFILIA", "PC", "snpc", "aramigo_leader", "aramigo_leader2"),
    "man40620": (
        "PC", "aramigo_rd", "pt1", "pt2", "teikoku_hm", "teikoku_hf",
        "teikoku_elm", "lake_kanri01_el", "lake_kanri02_rr", "obj",
    ),
    "man40625": (
        "PC", "pt1", "pt2", "mado_", "teikoku_elm", "teikoku_hm",
        "teikoku_hf", "lake_kanri02_hm",
    ),
    "man40630": (
        "PC", "sNPC", "pt1", "pt2", "mado_", "teikoku_bb",
        "teikoku_rd", "teikoku_elf", "teikoku_hm", "teikoku_hf",
    ),
    "man40635": ("c00100", "c00190", "c001c0", "c002d0", "c005e0", "c008g0", "c009h0", "b910p0"),
    "man40640": tuple(),
    "man40645": ("PC", "Child-A_HFK", "Child-B_HFM", "Child-C_HFM", "Child-D_HFK", "Child-E_HFM"),
    "man40650": (
        "PC", "SNPC", "1_sea_YShtola", "Child-A_HFK", "Child-B_HFM", "Child-C_HFM",
        "Child-D_HFK", "Child-E_HFM", "EmpireBoss_EM", "3_wil_Thancred", "2_fst_Papalymo", "2_fst_Yda",
    ),
    "man40660": ("Tatal_LF", "pc", "Minfilia", "Minfilia_2"),
}

EXPECTED_ACTOR_IDS = {
    ("man40600", "MINFILIA"): 1000843,
    ("man40600", "aramigo_leader"): 1000477,
    ("man40620", "teikoku_elm"): 1001243,
    ("man40620", "teikoku_hm"): 1001244,
    ("man40620", "teikoku_hf"): 1001245,
    ("man40625", "mado_"): 1001457,
    ("man40625", "teikoku_elm"): 2207001,
    ("man40625", "teikoku_hm"): 2280003,
    ("man40625", "teikoku_hf"): 2280006,
    ("man40645", "Child-A_HFK"): 1000957,
    ("man40645", "Child-B_HFM"): 1000958,
    ("man40645", "Child-C_HFM"): 1000959,
    ("man40645", "Child-D_HFK"): 1000960,
    ("man40645", "Child-E_HFM"): 1000961,
    ("man40650", "EmpireBoss_EM"): 1500131,
    ("man40660", "Tatal_LF"): 1001046,
    ("man40660", "Minfilia"): 1000843,
}

EXPECTED_ANCHORS = {
    ("man40600", "MINFILIA"): (((39.330, 1.205, 0.022), -1.641),),
    ("man40620", "PC"): (((-218.470, 18.542, -666.627), -2.817),),
    ("man40625", "PC"): (((-70.983, 19.746, -703.104), 1.449),),
    ("man40625", "teikoku_elm"): (((-62.181, 20.001, -703.240), 1.449),),
    ("man40645", "PC"): (((265.470, 56.408, -799.867), -1.654),),
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
            if not any(close_transform(record, expected_position, expected_rotation) for record in by_key[key].placements):
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
        print(json.dumps({"client_root": str(args.client_root), "scenes": summaries, "actors": [json_ready(row) for row in placements]}, indent=2))
    else:
        print("Futures Perfect (Man406) cutscene setup decode")
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
