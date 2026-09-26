#!/usr/bin/env python3
"""Decode Toll of the Warden cutscene actors and spatial setup records.

The FFXIV 1.x cutscene files contain an actor dictionary and 0x40-byte spatial
records. Four Man300 scenes expose a normal ``setup`` block. The three
composite scenes (``man30030``, ``man30040``, and ``man30050``) are decoded
with the same record signature over the complete file.

The regression anchors below are decoded facts. They are only checked after all
candidate records have been found; they are never used to locate a record.
"""

from __future__ import annotations

import argparse
import json
import math
import struct
from dataclasses import asdict, dataclass
from pathlib import Path


DEFAULT_CLIENT_ROOT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
SCENES = tuple(f"man300{index:02d}" for index in range(0, 70, 10))
EXPECTED_SCENE_METADATA = {
    "man30000": (105600, 3),
    "man30010": (105488, 11),
    "man30020": (130736, 8),
    "man30030": (2239504, 17),
    "man30040": (76560, 10),
    "man30050": (819872, 15),
    "man30060": (38752, 5),
}
COMPOSITE_SCENE_SPATIAL_OPCODES = {
    "man30030": 6,
    "man30040": 4,
    "man30050": 16,
}

TRACKED_LABELS = {
    "man30000": ("MINFILIA", "PC"),
    "man30010": ("PC", "HEDYN"),
    "man30020": ("SHANGA_MESHANGA", "Sylph_Troxia", "PC", "SNPC", "HEDYN"),
    "man30030": (
        "PC",
        "snpc",
        "nananobi",
        "S_ALMXIO",
        "S_ZOXIO",
        "I_ixal01",
        "I_ixal02",
        "I_ixal03",
        "A_amarujya01",
        "A_amarujya02",
        "A_amarujya03",
        "ixal_04",
        "amarujya_04",
    ),
    "man30040": ("PC", "snpc", "nananobi", "S_ALMXIO", "S_ZOXIO", "SCALELIZARD_FIR"),
    "man30050": ("PC", "SNPC", "NANABINO", "Asien", "Crystal"),
    "man30060": ("PC", "SNPC", "HEDYN", "NANANOBY"),
}

EXPECTED_ACTOR_IDS = {
    ("man30000", "MINFILIA"): 1000843,
    ("man30000", "PC"): 0,
    ("man30010", "PC"): 0,
    ("man30010", "HEDYN"): 1001047,
    ("man30020", "SHANGA_MESHANGA"): 1001048,
    ("man30020", "Sylph_Troxia"): 1001049,
    ("man30020", "PC"): 0,
    ("man30020", "SNPC"): 0,
    ("man30020", "HEDYN"): 1001047,
    ("man30030", "PC"): 0,
    ("man30030", "snpc"): 0,
    ("man30030", "nananobi"): 1001050,
    ("man30030", "S_ALMXIO"): 1001085,
    ("man30030", "S_ZOXIO"): 1001086,
    ("man30030", "I_ixal01"): 1001093,
    ("man30030", "I_ixal02"): 1001094,
    ("man30030", "I_ixal03"): 1001095,
    ("man30030", "A_amarujya01"): 1001173,
    ("man30030", "A_amarujya02"): 1001097,
    ("man30030", "A_amarujya03"): 1001098,
    ("man30030", "ixal_04"): 1001172,
    ("man30030", "amarujya_04"): 1000517,
    ("man30040", "PC"): 0,
    ("man30040", "snpc"): 0,
    ("man30040", "nananobi"): 1001050,
    ("man30040", "S_ALMXIO"): 1001085,
    ("man30040", "S_ZOXIO"): 1001086,
    ("man30040", "SCALELIZARD_FIR"): 1001099,
    ("man30050", "PC"): 0,
    ("man30050", "SNPC"): 0,
    ("man30050", "NANABINO"): 1001050,
    ("man30050", "Asien"): 1001174,
    ("man30050", "Crystal"): 6500003,
    ("man30060", "PC"): 0,
    ("man30060", "SNPC"): 0,
    ("man30060", "HEDYN"): 1001047,
    ("man30060", "NANANOBY"): 1001050,
}

# Exact positions used by the implementation or needed to identify its scene
# boundaries. Some actors move during a scene; every expected transform merely
# has to occur among that actor's independently decoded candidates.
EXPECTED_ANCHORS = {
    ("man30000", "MINFILIA"): (((39.330, 1.205, 0.022), -1.571),),
    ("man30000", "PC"): (((35.848, 1.202, 0.021), 1.523),),
    ("man30010", "PC"): (((-46.775, 0.000, 0.000), 1.571),),
    ("man30010", "HEDYN"): (((-39.317, -0.006, -2.861), 0.0),),
    ("man30020", "SHANGA_MESHANGA"): (
        ((38.675442, 1.516505, -0.021378), -1.570796),
        ((35.006550, 1.516505, 1.394714), -1.836529),
    ),
    ("man30020", "Sylph_Troxia"): (((34.967342, 2.143379, 2.591506), -1.802091),),
    ("man30020", "PC"): (((-39.279690, -0.005594, -1.615932), -math.pi),),
    ("man30020", "SNPC"): (((33.265858, 1.518178, -1.563492), 0.568904),),
    ("man30020", "HEDYN"): (((-39.317429, -0.005594, -2.861295), 0.0),),
    ("man30030", "S_ALMXIO"): (((969.014, 250.484, -317.854), -2.192),),
    ("man30030", "S_ZOXIO"): (((968.186, 250.635, -316.680), -2.534),),
    ("man30030", "nananobi"): (((970.606, 250.186, -315.500), -2.457),),
    ("man30030", "snpc"): (((1000.454, 252.739, -280.282), -2.860),),
    ("man30030", "PC"): (((998.925, 253.076, -280.176), 3.124),),
    ("man30030", "I_ixal01"): (((953.176, 250.165, -308.133), 2.757),),
    ("man30030", "I_ixal02"): (((955.367, 250.132, -318.879), 2.883),),
    ("man30030", "I_ixal03"): (((956.790, 250.132, -307.071), -2.806),),
    ("man30030", "A_amarujya01"): (((963.076, 250.132, -324.483), -0.923),),
    ("man30030", "A_amarujya02"): (((956.023, 250.131, -321.013), -0.316),),
    ("man30030", "A_amarujya03"): (((950.188, 250.132, -327.993), -0.379),),
    ("man30030", "ixal_04"): (((939.248, 251.355, -324.261), 1.881),),
    ("man30030", "amarujya_04"): (((949.233, 251.688, -340.480), 0.0),),
    ("man30040", "S_ALMXIO"): (((1016.189, 251.877, -274.602), 0.076),),
    ("man30040", "S_ZOXIO"): (((1016.978, 251.880, -274.742), -0.177),),
    ("man30040", "nananobi"): (((1015.150, 251.404, -272.363), 1.086),),
    ("man30040", "snpc"): (((1017.404, 251.110, -272.218), -1.378),),
    ("man30040", "PC"): (((1016.166, 250.998, -270.654), 3.124),),
    ("man30040", "SCALELIZARD_FIR"): (((965.687, 250.132, -318.301), 3.124),),
    ("man30050", "PC"): (((1054.047, 251.661, -282.217), 2.381),),
    ("man30050", "Crystal"): (((1090.315, 248.161, -293.469), 0.0),),
    ("man30060", "PC"): (((-39.317, -0.006, -1.520), 3.131),),
    ("man30060", "SNPC"): (((-45.930, 0.017, -0.330), 2.022),),
    ("man30060", "HEDYN"): (((-39.317, -0.006, -2.861), 0.0),),
    ("man30060", "NANANOBY"): (((-35.163, -0.006, -2.220), -1.544),),
}


@dataclass(frozen=True)
class ActorRecord:
    index: int
    label: str
    actor_id: int
    offset: int


@dataclass(frozen=True)
class SpatialRecord:
    offset: int
    opcode: int
    actor_index: int
    position: tuple[float, float, float]
    rotation: float


@dataclass(frozen=True)
class ActorPlacements:
    scene: str
    label: str
    actor_index: int
    actor_id: int
    placements: tuple[SpatialRecord, ...]


def unpack_u32(data: bytes, offset: int) -> int:
    return struct.unpack_from("<I", data, offset)[0]


def find_all(data: bytes, needle: bytes) -> list[int]:
    offsets: list[int] = []
    start = 0
    while True:
        offset = data.find(needle, start)
        if offset < 0:
            return offsets
        offsets.append(offset)
        start = offset + 1


def decode_actor_dictionary(data: bytes) -> dict[str, ActorRecord]:
    actors: dict[str, ActorRecord] = {}
    for offset in range(0, len(data) - 0x3C):
        if data[offset : offset + 2] != b"\x3c\x00":
            continue
        if (
            unpack_u32(data, offset + 0x20) != 5
            or unpack_u32(data, offset + 0x28) != 0xFFFFFFFF
            or unpack_u32(data, offset + 0x2C) != 2
        ):
            continue
        raw_label = data[offset + 4 : offset + 0x14].split(b"\0", 1)[0]
        try:
            label = raw_label.decode("ascii")
        except UnicodeDecodeError:
            continue
        if not label:
            continue
        actors[label] = ActorRecord(
            index=data[offset + 3],
            label=label,
            actor_id=unpack_u32(data, offset + 0x30),
            offset=offset,
        )
    return actors


def plausible_spatial_record(data: bytes, offset: int, actor_indexes: set[int]) -> SpatialRecord | None:
    if offset + 0x40 > len(data) or data[offset] != 0x40 or data[offset + 1] != 0:
        return None
    actor_index = data[offset + 3]
    if actor_index not in actor_indexes:
        return None
    position = struct.unpack_from("<3f", data, offset + 0x10)
    rotation = struct.unpack_from("<f", data, offset + 0x20)[0]
    if not all(math.isfinite(value) and abs(value) < 5000 for value in position):
        return None
    if not math.isfinite(rotation) or abs(rotation) > math.tau + 0.01:
        return None
    if all(abs(value) < 0.000001 for value in position):
        return None
    return SpatialRecord(offset, data[offset + 2], actor_index, position, rotation)


def scan_spatial_records(data: bytes, actor_indexes: set[int]) -> list[SpatialRecord]:
    records: list[SpatialRecord] = []
    for offset in range(0, len(data) - 0x40):
        record = plausible_spatial_record(data, offset, actor_indexes)
        if record is not None:
            records.append(record)
    return records


def decode_setup_spatial_records(data: bytes, actor_indexes: set[int]) -> tuple[int, list[SpatialRecord]]:
    setup_hits = find_all(data, b"setup")
    if len(setup_hits) != 1:
        raise AssertionError(f"expected one setup block, found {len(setup_hits)}")
    setup_start = setup_hits[0] + 0x30
    records: list[SpatialRecord] = []
    offset = setup_start
    while offset + 4 <= len(data):
        size = data[offset]
        if size < 0x14 or size > 0x80 or size % 4 != 0 or data[offset + 1] != 0 or offset + size > len(data):
            break
        if size == 0x40:
            record = plausible_spatial_record(data, offset, actor_indexes)
            if record is not None:
                records.append(record)
        offset += size
    return setup_start, records


def close_transform(
    record: SpatialRecord,
    expected_position: tuple[float, float, float],
    expected_rotation: float,
    tolerance: float = 0.01,
) -> bool:
    return all(math.isclose(a, b, abs_tol=tolerance) for a, b in zip(record.position, expected_position)) and math.isclose(
        record.rotation, expected_rotation, abs_tol=tolerance
    )


def unique_records(records: list[SpatialRecord]) -> tuple[SpatialRecord, ...]:
    unique: list[SpatialRecord] = []
    for record in records:
        if any(close_transform(other, record.position, record.rotation, 0.001) for other in unique):
            continue
        unique.append(record)
    return tuple(unique)


def decode(client_root: Path) -> tuple[list[dict[str, object]], list[ActorPlacements]]:
    summaries: list[dict[str, object]] = []
    placements: list[ActorPlacements] = []
    for scene in SCENES:
        path = client_root / "client" / "cut" / scene / scene
        data = path.read_bytes()
        actors = decode_actor_dictionary(data)
        expected_size, expected_actor_count = EXPECTED_SCENE_METADATA[scene]
        if len(data) != expected_size:
            raise AssertionError(f"{scene}: expected {expected_size} bytes, found {len(data)}")
        if len(actors) != expected_actor_count:
            raise AssertionError(f"{scene}: expected {expected_actor_count} actor records, found {len(actors)}")
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
        if scene in COMPOSITE_SCENE_SPATIAL_OPCODES:
            setup_start = None
            spatial = [
                record
                for record in scan_spatial_records(data, actor_indexes)
                if record.opcode == COMPOSITE_SCENE_SPATIAL_OPCODES[scene]
            ]
            mode = "whole-file signature scan"
        else:
            setup_start, spatial = decode_setup_spatial_records(data, actor_indexes)
            mode = "setup stream"
        summaries.append(
            {
                "scene": scene,
                "path": str(path),
                "bytes": len(data),
                "actor_records": len(actors),
                "decode_mode": mode,
                "setup_start": setup_start,
                "spatial_records": len(spatial),
            }
        )
        for label in tracked:
            actor = actors[label]
            candidates = unique_records([record for record in spatial if record.actor_index == actor.index])
            placements.append(ActorPlacements(scene, label, actor.index, actor.actor_id, candidates))

    by_key = {(row.scene, row.label): row for row in placements}
    for key, anchors in EXPECTED_ANCHORS.items():
        row = by_key[key]
        for expected_position, expected_rotation in anchors:
            if not any(close_transform(record, expected_position, expected_rotation) for record in row.placements):
                raise AssertionError(f"{key[0]}/{key[1]}: expected transform was not decoded")
    return summaries, placements


def json_ready(row: ActorPlacements) -> dict[str, object]:
    payload = asdict(row)
    for record in payload["placements"]:
        record["offset_hex"] = f"0x{record['offset']:X}"
    return payload


def print_text(client_root: Path, summaries: list[dict[str, object]], placements: list[ActorPlacements]) -> None:
    print("Toll of the Warden (Man300) cutscene setup decode")
    print(f"Client root: {client_root}")
    print("Scenes: " + ", ".join(f"{row['scene']}={row['bytes']} bytes" for row in summaries))
    print()
    for row in placements:
        if not row.placements:
            continue
        print(f"{row.scene}/{row.label} actor={row.actor_id} index={row.actor_index}")
        for record in row.placements:
            xyz = ", ".join(f"{value:.3f}" for value in record.position)
            print(f"  0x{record.offset:X} opcode={record.opcode} ({xyz}) rot={record.rotation:.3f}")
    print()
    print("Boundary: these are cutscene-managed transforms, not persistent world-spawn records.")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT_ROOT)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()
    client_root = args.client_root.resolve()
    summaries, placements = decode(client_root)
    if args.json:
        print(
            json.dumps(
                {
                    "client_root": str(client_root),
                    "scenes": summaries,
                    "actors": [json_ready(row) for row in placements],
                    "boundary": "Cutscene-managed transforms; not persistent world-spawn records.",
                },
                indent=2,
            )
        )
    else:
        print_text(client_root, summaries, placements)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
