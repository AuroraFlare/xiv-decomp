#!/usr/bin/env python3
"""Decode the six city-airship cutscene actor and placement records.

The FFXIV 1.x ``zep0*`` cutscene files are PWIB resource containers.  Each
contains a fixed-width actor dictionary followed by a ``setup`` command stream;
later timeline blocks can contain additional placements for moving actors.  This
tool records both the authoritative initial setup records and the wider set of
structurally valid placement records without treating either as persistent
world-spawn data.

The source sizes and hashes below are regression anchors from the installed
1.23 client.  They validate inputs after reading them and are not used to find
records.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
import struct
from dataclasses import asdict, dataclass
from pathlib import Path


DEFAULT_CLIENT_ROOT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT_DIR = Path("tools/outputs/lpb/airship_decomp_20260824")

SCENES = {
    "zep0g000": {
        "city": "Gridania",
        "role": "departure",
        "bytes": 111520,
        "sha256": "6dc88355de9859a5ec0ad4ee856086eb37ebea6916acaf657d84649e1d11e893",
    },
    "zep0g010": {
        "city": "Gridania",
        "role": "arrival",
        "bytes": 115488,
        "sha256": "1958c9fadf4f147177f19d779ebf3e2c3df2bf86e0c01c4479e804e83eeaadbb",
    },
    "zep0l000": {
        "city": "Limsa Lominsa",
        "role": "departure",
        "bytes": 117408,
        "sha256": "7b2009d319ebce90d41e9d7091a7e4bb4d0e10e8783b74c013b4a71b72a52197",
    },
    "zep0l010": {
        "city": "Limsa Lominsa",
        "role": "arrival",
        "bytes": 159648,
        "sha256": "5ab93053dfa7f8d0d71d27241a0c00ae0f89f803af9dd912345af135fa5715d6",
    },
    "zep0u000": {
        "city": "Ul'dah",
        "role": "departure",
        "bytes": 129424,
        "sha256": "71634fb82d460530bbda822dea9bb5ea7b5e8154559788611a2cd376fdc6966f",
    },
    "zep0u010": {
        "city": "Ul'dah",
        "role": "arrival",
        "bytes": 149824,
        "sha256": "5923855356423f238a412bf578470e8d26d04cb034e5e1a201a52768cc205ee5",
    },
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


def decode_actor_dictionary(data: bytes) -> dict[int, ActorRecord]:
    actors: dict[int, ActorRecord] = {}
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
        index = data[offset + 3]
        actors[index] = ActorRecord(index, label, unpack_u32(data, offset + 0x30), offset)
    return actors


def plausible_spatial_record(
    data: bytes, offset: int, actor_indexes: set[int]
) -> SpatialRecord | None:
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


def decode_setup_records(
    data: bytes, actor_indexes: set[int]
) -> tuple[int, list[SpatialRecord]]:
    setup_hits = find_all(data, b"setup")
    if len(setup_hits) != 1:
        raise AssertionError(f"expected one setup block, found {len(setup_hits)}")
    setup_start = setup_hits[0] + 0x30
    records: list[SpatialRecord] = []
    offset = setup_start
    while offset + 4 <= len(data):
        size = data[offset]
        if size < 0x14 or size > 0x80 or size % 4 != 0 or data[offset + 1] != 0:
            break
        if offset + size > len(data):
            break
        if size == 0x40:
            record = plausible_spatial_record(data, offset, actor_indexes)
            if record is not None:
                records.append(record)
        offset += size
    return setup_start, records


def decode(client_root: Path) -> tuple[list[dict[str, object]], list[dict[str, object]], list[dict[str, object]]]:
    scenes: list[dict[str, object]] = []
    actor_rows: list[dict[str, object]] = []
    spatial_rows: list[dict[str, object]] = []

    for scene, expected in SCENES.items():
        source = client_root / "client" / "cut" / scene / scene
        data = source.read_bytes()
        digest = hashlib.sha256(data).hexdigest()
        if len(data) != expected["bytes"]:
            raise AssertionError(f"{scene}: expected {expected['bytes']} bytes, found {len(data)}")
        if digest != expected["sha256"]:
            raise AssertionError(f"{scene}: SHA-256 drifted: {digest}")

        actors = decode_actor_dictionary(data)
        if 5 not in actors or actors[5].label != "Airship" or actors[5].actor_id != 1200090:
            raise AssertionError(f"{scene}: missing canonical Airship actor 1200090 at index 5")
        pilot = [actor for actor in actors.values() if actor.label == "sentyou" and actor.actor_id == 1001781]
        if len(pilot) != 1:
            raise AssertionError(f"{scene}: missing canonical sentyou pilot actor 1001781")

        setup_start, setup_records = decode_setup_records(data, set(actors))
        all_records = scan_spatial_records(data, set(actors))
        setup_offsets = {record.offset for record in setup_records}

        scenes.append(
            {
                "scene": scene,
                "city": expected["city"],
                "role": expected["role"],
                "source": str(source),
                "bytes": len(data),
                "sha256": digest,
                "actor_records": len(actors),
                "setup_offset": f"0x{setup_start:X}",
                "setup_spatial_records": len(setup_records),
                "all_spatial_records": len(all_records),
            }
        )

        for actor in sorted(actors.values(), key=lambda item: item.index):
            actor_rows.append(
                {
                    "scene": scene,
                    "city": expected["city"],
                    "role": expected["role"],
                    "actor_index": actor.index,
                    "label": actor.label,
                    "actor_id": actor.actor_id,
                    "record_offset": f"0x{actor.offset:X}",
                }
            )

        for record in all_records:
            actor = actors[record.actor_index]
            spatial_rows.append(
                {
                    "scene": scene,
                    "city": expected["city"],
                    "role": expected["role"],
                    "scope": "initial_setup" if record.offset in setup_offsets else "later_timeline",
                    "record_offset": f"0x{record.offset:X}",
                    "opcode": record.opcode,
                    "actor_index": record.actor_index,
                    "label": actor.label,
                    "actor_id": actor.actor_id,
                    "x": f"{record.position[0]:.6f}",
                    "y": f"{record.position[1]:.6f}",
                    "z": f"{record.position[2]:.6f}",
                    "rotation": f"{record.rotation:.6f}",
                }
            )

    return scenes, actor_rows, spatial_rows


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    if not rows:
        raise AssertionError(f"refusing to write empty CSV: {path}")
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=tuple(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT_ROOT)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT_DIR)
    args = parser.parse_args()

    client_root = args.client_root.resolve()
    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)
    scenes, actors, spatial = decode(client_root)

    write_csv(output_dir / "scene_inventory.csv", scenes)
    write_csv(output_dir / "actor_dictionary.csv", actors)
    write_csv(output_dir / "spatial_records.csv", spatial)
    (output_dir / "manifest.json").write_text(
        json.dumps(
            {
                "client_root": str(client_root),
                "scenes": scenes,
                "actor_records": len(actors),
                "spatial_records": len(spatial),
                "boundary": "Cutscene-managed actors/transforms; not persistent world-spawn records.",
            },
            indent=2,
        )
        + "\n",
        encoding="utf-8",
    )

    print(
        f"Decoded {len(scenes)} zep0 scenes: {len(actors)} actors, "
        f"{len(spatial)} placement records -> {output_dir}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
