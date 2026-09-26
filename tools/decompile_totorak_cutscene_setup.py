#!/usr/bin/env python3
"""Decode Toto-Rak PWIB setup placements from an installed FFXIV 1.x client.

The replay scenes contain an actor dictionary followed by a byte-sized setup
record stream. Spatial records are 0x40 bytes long, use actor index at +0x03,
position floats at +0x10, and rotation at +0x20. A 0x48-byte root record stores
its position at +0x24.

This tool deliberately reports cutscene staging actors. It does not reinterpret
them as persistent world spawns.
"""

from __future__ import annotations

import argparse
import json
import math
import struct
from dataclasses import asdict, dataclass
from pathlib import Path


DEFAULT_CLIENT_ROOT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
SCENES = tuple(f"rad0f30{index}" for index in range(9))
MAP_LAYOUT = Path("data/29/B0/00/0A.DAT")
MAP_ANCHOR_OFFSET = 0x1C370
ZONE_TRANSLATION = (1216.0, -40.0, 736.0)

# These labels isolate the player, boss, and route device transforms that are
# useful to the server implementation. Other setup actors remain available to
# the parser, but are intentionally omitted from the concise report.
TRACKED_LABELS = {
    "rad0f303": ("PC", "SPIDER"),
    "rad0f304": ("PC",),
    "rad0f305": ("PC", "Boss"),
    "rad0f306": ("PC", "BOSS", "gate"),
    "rad0f307": ("PC", "MON1", "GOAL"),
    "rad0f308": ("PC", "Boss", "vfx"),
}

# Regression values are decoded facts, not inputs used to locate records.
EXPECTED_PLACEMENTS = {
    ("rad0f303", "PC"): ((11.951040, -7.046751, 176.306808), 1.415041),
    ("rad0f303", "SPIDER"): ((38.232742, -6.922284, 195.777161), -2.183308),
    ("rad0f304", "PC"): ((260.579987, -18.900000, -102.769997), 0.0),
    ("rad0f305", "PC"): ((129.007004, -22.955919, -187.893280), 0.0),
    ("rad0f305", "Boss"): ((148.251785, -22.947641, -192.584610), 0.0),
    ("rad0f306", "PC"): ((30.156878, -6.971693, 190.439270), 0.986454),
    ("rad0f306", "BOSS"): ((33.270908, -7.010288, 193.214066), -2.434680),
    ("rad0f306", "gate"): ((37.880001, -6.890000, 195.940002), 0.0),
    ("rad0f307", "PC"): ((260.579987, -18.900000, -102.769997), 0.0),
    ("rad0f307", "MON1"): ((257.037292, -18.900000, -97.505447), -0.630359),
    ("rad0f307", "GOAL"): ((260.579987, -18.900000, -102.769997), 0.0),
    ("rad0f308", "PC"): ((128.438675, -22.941727, -191.665451), 1.792122),
    ("rad0f308", "Boss"): ((133.277466, -22.993948, -192.257660), -1.422006),
    ("rad0f308", "vfx"): ((136.440002, -22.980000, -193.550003), 0.0),
}


@dataclass(frozen=True)
class ActorRecord:
    index: int
    label: str
    actor_id: int
    offset: int


@dataclass(frozen=True)
class SetupRecord:
    offset: int
    size: int
    opcode: int
    actor_index: int
    position: tuple[float, float, float] | None
    rotation: float | None


@dataclass(frozen=True)
class Placement:
    scene: str
    label: str
    actor_index: int
    actor_id: int
    local: tuple[float, float, float]
    rotation: float
    world: tuple[float, float, float]
    setup_offsets: tuple[int, ...]


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
        if not raw_label:
            continue
        try:
            label = raw_label.decode("ascii")
        except UnicodeDecodeError:
            continue

        record = ActorRecord(
            index=data[offset + 3],
            label=label,
            actor_id=unpack_u32(data, offset + 0x30),
            offset=offset,
        )
        previous = actors.get(label)
        if previous is not None and previous != record:
            raise AssertionError(f"duplicate actor label {label!r}")
        actors[label] = record
    return actors


def decode_setup_records(data: bytes) -> tuple[int, list[SetupRecord]]:
    setup_hits = find_all(data, b"setup")
    if len(setup_hits) != 1:
        raise AssertionError(f"expected one setup block, found {len(setup_hits)}")

    setup_start = setup_hits[0] + 0x30
    offset = setup_start
    records: list[SetupRecord] = []
    while offset + 4 <= len(data):
        size = data[offset]
        # All recovered setup records are aligned, start with a byte size, and
        # reserve byte +1 as zero. This also prevents @CBLK from being mistaken
        # for a 0x40-byte setup record.
        if (
            size < 0x14
            or size > 0x80
            or size % 4 != 0
            or data[offset + 1] != 0
            or offset + size > len(data)
        ):
            break

        position = None
        rotation = None
        if size == 0x40:
            position = struct.unpack_from("<3f", data, offset + 0x10)
            rotation = struct.unpack_from("<f", data, offset + 0x20)[0]
        elif size == 0x48:
            position = struct.unpack_from("<3f", data, offset + 0x24)

        records.append(
            SetupRecord(
                offset=offset,
                size=size,
                opcode=data[offset + 2],
                actor_index=data[offset + 3],
                position=position,
                rotation=rotation,
            )
        )
        offset += size

    if not records:
        raise AssertionError("setup block contained no records")
    return setup_start, records


def close_vector(
    left: tuple[float, float, float],
    right: tuple[float, float, float],
    tolerance: float = 0.001,
) -> bool:
    return all(math.isclose(a, b, abs_tol=tolerance) for a, b in zip(left, right))


def unique_spatial_records(records: list[SetupRecord], actor_index: int) -> list[SetupRecord]:
    unique: list[SetupRecord] = []
    for record in records:
        if record.size != 0x40 or record.actor_index != actor_index:
            continue
        assert record.position is not None and record.rotation is not None
        if any(
            close_vector(record.position, other.position)  # type: ignore[arg-type]
            and math.isclose(record.rotation, other.rotation, abs_tol=0.001)
            for other in unique
        ):
            continue
        unique.append(record)
    return unique


def verify_map_anchor(client_root: Path) -> list[int]:
    map_path = client_root / MAP_LAYOUT
    data = map_path.read_bytes()
    anchor = struct.pack("<3f", *ZONE_TRANSLATION)
    offsets = find_all(data, anchor)
    if offsets != [MAP_ANCHOR_OFFSET]:
        rendered = ", ".join(f"0x{offset:X}" for offset in offsets) or "none"
        raise AssertionError(
            f"Toto-Rak map anchor drifted: expected 0x{MAP_ANCHOR_OFFSET:X}, found {rendered}"
        )
    return offsets


def decode(client_root: Path) -> tuple[list[dict[str, object]], list[Placement]]:
    scene_summaries: list[dict[str, object]] = []
    placements: list[Placement] = []

    for scene in SCENES:
        path = client_root / "client" / "cut" / scene / scene
        data = path.read_bytes()
        actors = decode_actor_dictionary(data)
        setup_start, records = decode_setup_records(data)
        scene_summaries.append(
            {
                "scene": scene,
                "path": str(path),
                "bytes": len(data),
                "actor_records": len(actors),
                "setup_start": setup_start,
                "setup_records": len(records),
            }
        )

        for label in TRACKED_LABELS.get(scene, ()):
            actor = actors.get(label)
            if actor is None:
                raise AssertionError(f"{scene}: missing actor label {label!r}")
            spatial = unique_spatial_records(records, actor.index)
            if len(spatial) != 1:
                raise AssertionError(
                    f"{scene}/{label}: expected one unique spatial placement, found {len(spatial)}"
                )

            selected = spatial[0]
            assert selected.position is not None and selected.rotation is not None
            matching_offsets = tuple(
                record.offset
                for record in records
                if record.size == 0x40
                and record.actor_index == actor.index
                and record.position is not None
                and record.rotation is not None
                and close_vector(record.position, selected.position)
                and math.isclose(record.rotation, selected.rotation, abs_tol=0.001)
            )
            expected_position, expected_rotation = EXPECTED_PLACEMENTS[(scene, label)]
            if not close_vector(selected.position, expected_position) or not math.isclose(
                selected.rotation, expected_rotation, abs_tol=0.001
            ):
                raise AssertionError(f"{scene}/{label}: decoded placement drifted")

            world = tuple(
                value + translation
                for value, translation in zip(selected.position, ZONE_TRANSLATION)
            )
            placements.append(
                Placement(
                    scene=scene,
                    label=label,
                    actor_index=actor.index,
                    actor_id=actor.actor_id,
                    local=selected.position,
                    rotation=selected.rotation,
                    world=world,
                    setup_offsets=matching_offsets,
                )
            )

    return scene_summaries, placements


def json_ready_placement(placement: Placement) -> dict[str, object]:
    payload = asdict(placement)
    payload["setup_offsets_hex"] = [f"0x{offset:X}" for offset in placement.setup_offsets]
    return payload


def print_text(
    client_root: Path,
    scene_summaries: list[dict[str, object]],
    placements: list[Placement],
) -> None:
    print("Toto-Rak PWIB setup decode")
    print(f"Client root: {client_root}")
    print(
        "Map anchor: "
        f"{MAP_LAYOUT.as_posix()} @ 0x{MAP_ANCHOR_OFFSET:X} "
        f"= {ZONE_TRANSLATION}"
    )
    print(
        "Scene records: "
        + ", ".join(
            f"{row['scene']}={row['setup_records']}" for row in scene_summaries
        )
    )
    print()
    print(
        "scene     actor    class     local xyz / rotation"
        "                         world xyz"
    )
    for placement in placements:
        local = ", ".join(f"{value:.3f}" for value in placement.local)
        world = ", ".join(f"{value:.3f}" for value in placement.world)
        print(
            f"{placement.scene:<10}"
            f"{placement.label:<9}"
            f"{placement.actor_id:<10}"
            f"({local}) / {placement.rotation:.3f}"
            f" -> ({world})"
        )

    print()
    print(
        "Boundary: these are cutscene-managed staging actors; this decode does "
        "not establish persistent world spawns."
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--client-root",
        type=Path,
        default=DEFAULT_CLIENT_ROOT,
        help=f"Installed 1.x client root (default: {DEFAULT_CLIENT_ROOT})",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Write the decoded report as JSON on stdout.",
    )
    args = parser.parse_args()
    client_root = args.client_root.resolve()

    anchor_offsets = verify_map_anchor(client_root)
    scene_summaries, placements = decode(client_root)
    if args.json:
        print(
            json.dumps(
                {
                    "client_root": str(client_root),
                    "map_layout": str(client_root / MAP_LAYOUT),
                    "map_anchor_offsets": anchor_offsets,
                    "zone_translation": ZONE_TRANSLATION,
                    "scenes": scene_summaries,
                    "placements": [
                        json_ready_placement(placement) for placement in placements
                    ],
                    "boundary": (
                        "Cutscene-managed staging actors; not persistent world-spawn records."
                    ),
                },
                indent=2,
            )
        )
    else:
        print_text(client_root, scene_summaries, placements)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
