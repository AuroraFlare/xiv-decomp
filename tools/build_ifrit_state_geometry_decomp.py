#!/usr/bin/env python3
"""Decode the native m999 Plume/Eruption model-state payloads.

The report produced by this tool is deliberately narrow: it records the
serialized VINS/ACB wrapper values, the VEFF structural vocabulary, and the
embedded VMDL bounds for m999/e001 state 4 (Radiant Plume) and state 5
(Eruption pre-impact).  It does not infer runtime helper placement.
"""

from __future__ import annotations

import argparse
import json
import math
import struct
from pathlib import Path

from build_ifrit_ground_vfx_decomp import (
    ascii_strings,
    digest,
    payload_tag,
    walk_resources,
    write_csv,
)


DEFAULT_CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT = Path("tools/outputs/ifrit-state-geometry-decomp-20260805")
SOURCE_RELATIVE = Path(r"client\chara\mon\m999\equ\e001\met_mdl\0001")
SOURCE_SHA256 = "c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105"

STATE_DEFS = {
    4: {
        "semantic": "Radiant Plume localized state package",
        "vins": "3ULJ7Kvleafinst",
        "leaf": "1xuk6vmsb4_k",
        "acb": "msb4",
        "veff": "0Xv7Tfift_eish2",
        "path_token": "skill04",
    },
    5: {
        "semantic": "Eruption pre-impact ground formation",
        "vins": "258RjYvleafinst",
        "leaf": "2pm3upmsb5_k",
        "acb": "msb5",
        "veff": "2Jckltift_skleb",
        "path_token": "skill05",
    },
}

CONTROL_TOKENS = (
    "ActorBind",
    "ColorRGBALeaf",
    "LeafLife",
    "GenerateMaster",
    "ManyGenerateUnitTime",
    "ManyGenerateFormSphere",
    "ManyGenerateMotionEmission",
    "ManyGenerateDrawLine",
    "Position3DMapBind",
    "Position3DMapBindGenerated",
    "Position3D",
    "Rotation3D",
    "Scale3D",
    "jLoop",
)


def one_resource(objects: list[tuple[str, object]], resource_id: str):
    matches = [resource for _, resource in objects if resource.resource_id == resource_id]
    if len(matches) != 1:
        raise ValueError(f"expected one {resource_id!r}, found {len(matches)}")
    return matches[0]


def finite_floats(values: tuple[float, ...]) -> bool:
    return all(math.isfinite(value) for value in values)


def vmdl_bounds(payload: bytes) -> tuple[int, tuple[float, ...]]:
    """Find the documented kind=14,size=68,live=1 bounds record."""
    matches: list[tuple[int, tuple[float, ...]]] = []
    for offset in range(0, len(payload) - 0x2C, 4):
        kind, size, live = struct.unpack_from("<III", payload, offset)
        if (kind, size, live) != (14, 68, 1):
            continue
        values = struct.unpack_from("<6f", payload, offset + 0x14)
        if finite_floats(values):
            matches.append((offset, values))
    if len(matches) != 1:
        raise ValueError(f"expected one VMDL bounds record, found {len(matches)}")
    return matches[0]


def exact_ascii(payload: bytes, value: str) -> bool:
    return any(item == value for _, item in ascii_strings(payload))


def source_path(payload: bytes) -> str:
    candidates = [
        value
        for _, value in ascii_strings(payload)
        if value.lower().endswith(".veffbin")
    ]
    if len(candidates) != 1:
        raise ValueError(f"expected one VEFF source path, found {len(candidates)}")
    return candidates[0]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--client", type=Path, default=DEFAULT_CLIENT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    repo = Path(__file__).resolve().parents[1]
    output = args.output if args.output.is_absolute() else repo / args.output
    output.mkdir(parents=True, exist_ok=True)

    source = args.client / SOURCE_RELATIVE
    data = source.read_bytes()
    actual_sha = digest(data)
    if actual_sha != SOURCE_SHA256:
        raise ValueError(f"expected {SOURCE_SHA256}, got {actual_sha} ({source})")

    _, objects = walk_resources("m999_e001", data)
    wrapper_rows: list[dict[str, object]] = []
    structure_rows: list[dict[str, object]] = []
    bounds_rows: list[dict[str, object]] = []
    acb_payloads: dict[int, bytes] = {}

    for state, definition in STATE_DEFS.items():
        vins = one_resource(objects, str(definition["vins"]))
        leaf = one_resource(objects, str(definition["leaf"]))
        acb = one_resource(objects, str(definition["acb"]))
        veff = one_resource(objects, str(definition["veff"]))
        acb_payloads[state] = acb.payload

        if payload_tag(vins.payload) != "SEDBvins" or len(vins.payload) != 878:
            raise ValueError(f"state {state}: unexpected VINS layout")
        if payload_tag(acb.payload) != "SEDBACB" or len(acb.payload) != 1016:
            raise ValueError(f"state {state}: unexpected ACB layout")

        scale = struct.unpack_from("<3f", vins.payload, 0x320)
        rgba = struct.unpack_from("<4f", vins.payload, 0x340)
        wrapper_rows.append(
            {
                "state": state,
                "semantic": definition["semantic"],
                "vins_id": vins.resource_id,
                "vins_bytes": len(vins.payload),
                "vins_sha256": digest(vins.payload),
                "actor_bind_eid": "EID_CURRENT" if exact_ascii(vins.payload, "EID_CURRENT") else "",
                "vins_raw_signed_0x31c": struct.unpack_from("<i", vins.payload, 0x31C)[0],
                "scale_x": scale[0],
                "scale_y": scale[1],
                "scale_z": scale[2],
                "vins_flags_0x32c": f"0x{struct.unpack_from('<I', vins.payload, 0x32C)[0]:08X}",
                "color_r": rgba[0],
                "color_g": rgba[1],
                "color_b": rgba[2],
                "color_a": rgba[3],
                "leaf_life_word_a": struct.unpack_from("<I", vins.payload, 0x350)[0],
                "leaf_life_word_b": struct.unpack_from("<I", vins.payload, 0x354)[0],
                "leaf_life_mode": vins.payload[0x358],
                "leaf_id": leaf.resource_id,
                "leaf_bytes": len(leaf.payload),
                "leaf_sha256": digest(leaf.payload),
                "authored_veff_source": source_path(leaf.payload),
                "veff_id": veff.resource_id,
                "veff_sha256": digest(veff.payload),
                "acb_id": acb.resource_id,
                "acb_sha256": digest(acb.payload),
                "acb_flags_0x9c": f"0x{struct.unpack_from('<I', acb.payload, 0x9C)[0]:08X}",
                "acb_flags_0xa0": f"0x{struct.unpack_from('<I', acb.payload, 0xA0)[0]:08X}",
                "acb_sample_rate_fps": struct.unpack_from("<f", acb.payload, 0x218)[0],
                "acb_frame_count": struct.unpack_from("<f", acb.payload, 0x21C)[0],
                "acb_curve_seconds": (
                    struct.unpack_from("<f", acb.payload, 0x21C)[0]
                    / struct.unpack_from("<f", acb.payload, 0x218)[0]
                ),
            }
        )

        literals = [value for _, value in ascii_strings(veff.payload)]
        row: dict[str, object] = {
            "state": state,
            "semantic": definition["semantic"],
            "veff_id": veff.resource_id,
            "veff_bytes": len(veff.payload),
            "veff_sha256": digest(veff.payload),
            "default_literal_count": sum(value == "Default" for value in literals),
        }
        for token in CONTROL_TOKENS:
            row[f"has_{token}"] = int(any(token in value for value in literals))
        structure_rows.append(row)

        model_resources = [
            resource
            for _, resource in objects
            if payload_tag(resource.payload) == "SEDBvmdl"
            and str(definition["path_token"]) in resource.resource_path
        ]
        for model in model_resources:
            offset, values = vmdl_bounds(model.payload)
            minimum = values[:3]
            maximum = values[3:]
            extent = tuple(maximum[index] - minimum[index] for index in range(3))
            bounds_rows.append(
                {
                    "state": state,
                    "semantic": definition["semantic"],
                    "model_id": model.resource_id,
                    "resource_path": model.resource_path.replace("\\", "/"),
                    "bytes": len(model.payload),
                    "sha256": digest(model.payload),
                    "bounds_record_offset_hex": f"0x{offset:X}",
                    "min_x": minimum[0],
                    "min_y": minimum[1],
                    "min_z": minimum[2],
                    "max_x": maximum[0],
                    "max_y": maximum[1],
                    "max_z": maximum[2],
                    "extent_x": extent[0],
                    "extent_y": extent[1],
                    "extent_z": extent[2],
                }
            )

    acb_diff_rows = [
        {
            "offset_hex": f"0x{offset:X}",
            "msb4_hex": f"0x{left:02X}",
            "msb5_hex": f"0x{right:02X}",
        }
        for offset, (left, right) in enumerate(zip(acb_payloads[4], acb_payloads[5]))
        if left != right
    ]

    write_csv(output / "state_wrappers.csv", wrapper_rows)
    write_csv(output / "veff_structure.csv", structure_rows)
    write_csv(output / "model_bounds.csv", bounds_rows)
    write_csv(output / "msb4_msb5_acb_byte_diff.csv", acb_diff_rows)

    summary = {
        "source": str(SOURCE_RELATIVE).replace("\\", "/"),
        "source_sha256": actual_sha,
        "states": sorted(STATE_DEFS),
        "wrapper_rows": len(wrapper_rows),
        "veff_structure_rows": len(structure_rows),
        "model_bounds_rows": len(bounds_rows),
        "msb4_msb5_acb_differing_bytes": len(acb_diff_rows),
    }
    (output / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
