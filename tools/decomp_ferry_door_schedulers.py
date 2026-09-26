#!/usr/bin/env python3
"""Decode ferry line-layout door scheduler ownership from the installed 1.23b client."""

from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path

from build_dungeon_layout_animation_atlas import (
    parse_controlled_actors,
    typed_nodes,
    unit_tree_members,
)
from build_garuda_tornado_decomp import scb_resource_table
from extract_ifrit_bowl_layout_neighborhood import Layout, parse_scb


DEFAULT_CLIENT_ROOT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT = Path("outputs/ferry-door-scheduler-decomp-20260827/decomp.json")
TIMELINE_TYPE = "BaseObjects/TimeLine/TimeLineBaseObject"
UNIT_TREE_TYPE = "RefObjects/UnitTree/UnitTreeObject"

SPECS = (
    {
        "layout_id": 196,
        "token": "sea_s0_lin01",
        "relative_path": Path(r"data\29\D9\00\17.DAT"),
        "binding_instance_ids": (456,),
    },
    {
        "layout_id": 496,
        "token": "wil_w0_lin01",
        "relative_path": Path(r"data\61\5A\00\1B.DAT"),
        "binding_instance_ids": (456,),
    },
    {
        "layout_id": 5142,
        "token": "srt_o0_lin01",
        "relative_path": Path(r"data\89\ED\00\03.DAT"),
        "binding_instance_ids": (323, 326),
    },
    {
        "layout_id": 5143,
        "token": "srt_o0_lin02",
        "relative_path": Path(r"data\89\ED\00\04.DAT"),
        "binding_instance_ids": (323, 326),
    },
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT_ROOT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    return parser.parse_args()


def decompile_layout(client_root: Path, spec: dict[str, object]) -> dict[str, object]:
    path = client_root / Path(spec["relative_path"])
    data = path.read_bytes()
    layout = Layout(data)
    instances = layout.instances()
    nodes_by_id: dict[int, list[dict[str, object]]] = {}
    for offset in range(0, len(layout.relative) - 12, 4):
        name = layout.node_name(offset)
        type_name = layout.type_name(offset)
        if not layout.printable(name) or not layout.printable(type_name):
            continue
        nodes_by_id.setdefault(layout.u32(offset), []).append({
            "node_offset_hex": f"0x{offset:X}",
            "name": name,
            "type": type_name,
        })
    instances_by_reference: dict[int, list[dict[str, object]]] = {}
    for instance in instances:
        instances_by_reference.setdefault(int(instance["reference_offset"]), []).append(instance)

    binding_instance_ids = tuple(int(value) for value in spec["binding_instance_ids"])
    binding_instance_names = {
        f"isgrp_{binding_instance_id:06d}"
        for binding_instance_id in binding_instance_ids
    }
    binding_instances = [
        instance for instance in instances
        if str(instance["instance_name"]) in binding_instance_names
    ]

    timeline_descriptor = layout.descriptor(TIMELINE_TYPE)
    unit_tree_descriptor = layout.descriptor(UNIT_TREE_TYPE)
    members_by_owner: dict[int, list[dict[str, object]]] = {}
    for owner_pointer in typed_nodes(layout, unit_tree_descriptor, 56):
        members_by_owner[owner_pointer] = unit_tree_members(layout, owner_pointer)

    # Some ferry layouts keep reachable UnitTree nodes out of the ordinary
    # descriptor scan. Walk the live binding root as the client does so those
    # nested door groups and aliases are still part of the evidence.
    def collect_reachable(pointer: int, seen: set[int]) -> None:
        if pointer in seen or layout.type_name(pointer) != UNIT_TREE_TYPE:
            return
        seen.add(pointer)
        members = layout.unit_members(pointer)
        members_by_owner[pointer] = members
        for member in members:
            collect_reachable(int(member["target_offset"]), seen)

    for binding_instance in binding_instances:
        collect_reachable(int(binding_instance["reference_offset"]), set())

    owners_by_target: dict[int, list[dict[str, object]]] = {}
    members_by_serialized_gid: dict[int, list[dict[str, object]]] = {}
    for owner_pointer, members in members_by_owner.items():
        for member in members:
            member = dict(member)
            member["owner_offset"] = owner_pointer
            member["owner_name"] = layout.node_name(owner_pointer)
            owners_by_target.setdefault(int(member["target_offset"]), []).append(member)
            serialized_gid = member.get("serialized_actor_ref_gid")
            if isinstance(serialized_gid, int):
                members_by_serialized_gid.setdefault(serialized_gid, []).append({
                    "owner_name": member["owner_name"],
                    "alias": member["alias"],
                    "target_name": member["target_name"],
                    "target_type": member["target_type"],
                })

    def owner_paths(root: int, target: int) -> list[list[dict[str, object]]]:
        paths: list[list[dict[str, object]]] = []

        def visit(pointer: int, path: list[dict[str, object]], seen: set[int]) -> None:
            if pointer == target:
                paths.append(path)
                return
            if pointer in seen:
                return
            for member in members_by_owner.get(pointer, []):
                child = int(member["target_offset"])
                if child not in members_by_owner:
                    continue
                visit(child, path + [{
                    "alias": member["alias"],
                    "target_name": member["target_name"],
                    "target_type": member["target_type"],
                    "target_offset_hex": f"0x{child:X}",
                }], seen | {pointer})

        visit(root, [], set())
        return paths

    timelines: list[dict[str, object]] = []
    for pointer in typed_nodes(layout, timeline_descriptor, 28):
        name = layout.node_name(pointer)
        if "door" not in name.lower():
            continue

        physical, payload = layout.timeline_scb(pointer)
        clip_rows: list[dict[str, object]] = []
        controlled_actors: list[dict[str, object]] = []
        parse_error = ""
        try:
            controlled_actors = parse_controlled_actors(payload)
            clip_rows = parse_scb("", name, physical, payload)
            for clip in clip_rows:
                actor_index = int(clip["track_flags"])
                if actor_index < len(controlled_actors):
                    actor = controlled_actors[actor_index]
                    clip["controlled_actor_index"] = actor_index
                    clip["controlled_actor_name"] = actor["actor_name"]
                    clip["controlled_actor_class"] = actor["actor_class"]
        except Exception as error:  # Preserve the structure even if a new clip shape appears.
            parse_error = f"{type(error).__name__}: {error}"

        owners: list[dict[str, object]] = []
        for owner in owners_by_target.get(pointer, []):
            owner_pointer = int(owner["owner_offset"])
            placements = [
                {
                    "node_id": item["node_id"],
                    "instance_name": item["instance_name"],
                    "x": item["x"],
                    "y": item["y"],
                    "z": item["z"],
                }
                for item in instances_by_reference.get(owner_pointer, [])
            ]
            owners.append(
                {
                    "owner_offset_hex": f"0x{owner_pointer:X}",
                    "owner_name": owner["owner_name"],
                    "timeline_member_alias": owner["alias"],
                    "serialized_actor_ref_gid": owner.get("serialized_actor_ref_gid", ""),
                    "placements": placements,
                    "paths_from_binding_instance": [
                        path
                        for binding_instance in binding_instances
                        for path in owner_paths(
                            int(binding_instance["reference_offset"]),
                            owner_pointer,
                        )
                    ],
                }
            )

        timelines.append(
            {
                "name": name,
                "node_offset_hex": f"0x{pointer:X}",
                "scb_physical_offset_hex": f"0x{physical:X}",
                "scb_bytes": len(payload),
                "owners": owners,
                "controlled_actors": controlled_actors,
                "clip_classes": sorted({str(row["clip_class"]) for row in clip_rows}),
                "clip_count": len(clip_rows),
                "clips": clip_rows,
                "parse_error": parse_error,
            }
        )

    binding_timelines: list[dict[str, object]] = []
    seen_binding_timelines: set[int] = set()
    for binding_instance in binding_instances:
        root = int(binding_instance["reference_offset"])
        for member in members_by_owner.get(root, []):
            pointer = int(member["target_offset"])
            if member["target_type"] != TIMELINE_TYPE or pointer in seen_binding_timelines:
                continue
            seen_binding_timelines.add(pointer)
            physical, payload = layout.timeline_scb(pointer)
            controlled_actors: list[dict[str, object]] = []
            clip_rows: list[dict[str, object]] = []
            resources: list[tuple[str, str]] = []
            parse_error = ""
            try:
                controlled_actors = parse_controlled_actors(payload)
                clip_rows = parse_scb(str(member["alias"]), str(member["target_name"]), physical, payload)
                resources = scb_resource_table(payload)
                for clip in clip_rows:
                    actor_index = int(clip["track_flags"])
                    if actor_index < len(controlled_actors):
                        actor = controlled_actors[actor_index]
                        clip["controlled_actor_index"] = actor_index
                        clip["controlled_actor_name"] = actor["actor_name"]
                        clip["controlled_actor_class"] = actor["actor_class"]
                    if clip["clip_class"] == "LayRaptureCallSchedulerClip":
                        body = bytes.fromhex(str(clip["entry_payload_hex"]))
                        resource_index = struct.unpack_from("<I", body, 12)[0]
                        clip["scheduler_resource_index"] = resource_index
                        clip["scheduler_resource_nodes"] = nodes_by_id.get(resource_index, [])
                        clip["scheduler_resource_members"] = members_by_serialized_gid.get(resource_index, [])
                        if resource_index < len(resources):
                            clip["scheduler_resource_id"] = resources[resource_index][0]
                            clip["scheduler_resource_type"] = resources[resource_index][1]
            except Exception as error:
                parse_error = f"{type(error).__name__}: {error}"
            binding_timelines.append({
                "alias": member["alias"],
                "name": member["target_name"],
                "node_offset_hex": f"0x{pointer:X}",
                "scb_physical_offset_hex": f"0x{physical:X}",
                "scb_bytes": len(payload),
                "controlled_actors": controlled_actors,
                "resource_table": [
                    {"index": index, "id": resource_id, "type": resource_type}
                    for index, (resource_id, resource_type) in enumerate(resources)
                ],
                "clips": clip_rows,
                "parse_error": parse_error,
            })

    scheduler_offsets: dict[str, list[str]] = {}
    scheduler_nodes: dict[str, list[dict[str, object]]] = {}
    for scheduler in (
        "sdef_door_a_open",
        "sdef_door_a_clos",
        "sdef_door_b_open",
        "sdef_door_b_clos",
        "sdef_door_l_open",
        "sdef_door_l_clos",
    ):
        needle = scheduler.encode("ascii")
        offsets: list[str] = []
        start = 0
        while True:
            found = layout.relative.find(needle, start)
            if found < 0:
                break
            offsets.append(f"0x{found:X}")
            for node_offset in range(0, len(layout.relative) - 12, 4):
                if layout.u32(node_offset + 8) != found:
                    continue
                scheduler_nodes.setdefault(scheduler, []).append({
                    "string_offset_hex": f"0x{found:X}",
                    "node_offset_hex": f"0x{node_offset:X}",
                    "node_id": layout.u32(node_offset),
                    "parent_offset_hex": f"0x{layout.u32(node_offset + 4):X}",
                    "type": layout.type_name(node_offset),
                })
            start = found + 1
        scheduler_offsets[scheduler] = offsets

    return {
        "layout_id": spec["layout_id"],
        "token": spec["token"],
        "relative_path": str(spec["relative_path"]),
        "path": str(path),
        "bytes": len(data),
        "instance_count": len(instances),
        "binding_instance_ids": binding_instance_ids,
        "binding_instances": binding_instances,
        "door_instances": [
            instance for instance in instances
            if "door" in str(instance["reference_name"]).lower()
            or "door" in str(instance["instance_name"]).lower()
        ],
        "binding_root_members": [
            {
                "binding_instance": binding_instance["instance_name"],
                "root_name": binding_instance["reference_name"],
                "members": members_by_owner.get(
                    int(binding_instance["reference_offset"]), []
                ),
            }
            for binding_instance in binding_instances
        ],
        "door_unit_trees": [
            {
                "node_offset_hex": f"0x{pointer:X}",
                "name": layout.node_name(pointer),
                "members": members,
                "paths_from_binding_instance": [
                    path
                    for binding_instance in binding_instances
                    for path in owner_paths(
                        int(binding_instance["reference_offset"]),
                        pointer,
                    )
                ],
            }
            for pointer, members in members_by_owner.items()
            if "door" in layout.node_name(pointer).lower()
        ],
        "scheduler_offsets": scheduler_offsets,
        "scheduler_nodes": scheduler_nodes,
        "door_timeline_count": len(timelines),
        "door_timelines": timelines,
        "binding_timelines": binding_timelines,
    }


def main() -> int:
    args = parse_args()
    output = args.output.resolve()
    result = {
        "purpose": "Recover exact ferry door scheduler owners before changing runtime bindings.",
        "layouts": [decompile_layout(args.client_root.resolve(), spec) for spec in SPECS],
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({
        "output": str(output),
        "layouts": [
            {
                "layout_id": item["layout_id"],
                "door_timeline_count": item["door_timeline_count"],
                "scheduler_offsets": item["scheduler_offsets"],
            }
            for item in result["layouts"]
        ],
    }, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
