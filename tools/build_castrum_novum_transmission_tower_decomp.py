from __future__ import annotations

import argparse
import csv
import hashlib
import html
import json
import math
import re
import struct
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

TOOLS_DIR = Path(__file__).resolve().parent
if str(TOOLS_DIR) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR))

from build_dungeon_layout_animation_atlas import parse_scb, unit_tree_members
from extract_ifrit_bowl_layout_neighborhood import Layout


DEFAULT_CLIENT_ROOT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT_DIR = Path("outputs/castrum-novum-transmission-tower-decomp-20260817")
DEFAULT_WEATHER_8076_PATH = Path(
    "outputs/windower-weather-v16-purple-haze-20260725/data/29/B0/00/32.DAT"
)
DEFAULT_STARLIGHT_SOURCE_PATH = Path(
    "outputs/windower-weather-v16-purple-haze-20260725/data/29/B0/00/30.DAT"
)
REGION_KEY = 0x03C00000
FCURVE_RESOURCE_PATTERN = re.compile(rb"FCurve\d{4}\.fcr\0\0")
PRINTABLE_PATTERN = re.compile(rb"[\x20-\x7E]{4,}")
LAYOUT_TYPE_PATTERN = re.compile(
    rb"[A-Za-z0-9_]*(?:Objects|Root)(?:/[A-Za-z0-9_]+)+Object\x00"
)


@dataclass(frozen=True)
class Target:
    role: str
    resource_id: int
    token: str
    dat_key: int
    note: str


TARGETS = (
    Target("field-layout", 501, "lak_l0_fld01", 0x03E70001, "open-world Castrum/Mor Dhona field context"),
    Target("duty-layout", 511, "lak_l0_dun01", 0x03E7000B, "Transmission Tower instance layout selected by zoneParam 5014"),
    Target("event-weather", 8031, "wtr_chry", 0x03E7000C, "Aurora event atmosphere; comparison candidate"),
    Target("event-weather", 8030, "wtr_comp", 0x03E7000D, "Dalamud/cloud event atmosphere; comparison candidate"),
    Target("event-weather", 8032, "wtr_xmas", 0x03E7000E, "Dalamud Thunder atmosphere; strongest Tower candidate"),
)

NORMAL_WEATHER_NAMES = {
    8001: "Clear",
    8002: "Fair",
    8003: "Cloudy",
    8004: "Foggy",
    8007: "Rainy",
    8017: "Dusty",
    8030: "Dalamud",
    8031: "Aurora",
    8032: "Dalamud Thunder",
    8065: "Debug/test",
}

HIGH_SIGNAL_TERMS = (
    "beacon",
    "taihi",
    "shutter",
    "gate_",
    "lght",
    "ilght",
    "dwev",
    "glare",
    "shadow",
    "colorcorrection",
    "volumetriclight",
    "blur",
    "screenenv",
    "timeline",
    "schedul",
    "fcurve",
    "fog",
    "sky",
    "cloud",
    "aurora",
    "star",
    "lastwtr",
    "tunder",
    "thdr",
    "chara",
    "vfx",
)


def dat_path(client_root: Path, key: int) -> Path:
    return (
        client_root
        / "data"
        / f"{(key >> 24) & 0xFF:02X}"
        / f"{(key >> 16) & 0xFF:02X}"
        / f"{(key >> 8) & 0xFF:02X}"
        / f"{key & 0xFF:02X}.DAT"
    )


def cstr(raw: bytes) -> str:
    return raw.split(b"\0", 1)[0].decode("ascii", errors="replace")


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def write_csv(path: Path, fieldnames: list[str], rows: list[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def parse_region_rows(data: bytes) -> list[dict[str, object]]:
    if not data.startswith(b"RegionResourceData"):
        raise ValueError("03/C0/00/00.DAT is not RegionResourceData")
    rows: list[dict[str, object]] = []
    for offset in range(0x40, len(data) - 0x2F, 0x30):
        row_id, flags, key, count_type, raw_token, *meta = struct.unpack_from(
            "<IIII16sIIII", data, offset
        )
        token = cstr(raw_token)
        if not token or not re.fullmatch(r"[A-Za-z0-9_]+", token):
            continue
        rows.append(
            {
                "offset_hex": f"0x{offset:08X}",
                "id": row_id,
                "flags_hex": f"0x{flags:08X}",
                "dat_key_hex": f"0x{key:08X}",
                "count_type_hex": f"0x{count_type:08X}",
                "resource_token": token,
                "meta20_hex": f"0x{meta[0]:08X}",
                "meta24_hex": f"0x{meta[1]:08X}",
                "meta28_hex": f"0x{meta[2]:08X}",
                "meta2c_hex": f"0x{meta[3]:08X}",
            }
        )
    return rows


def parse_dependency_rows(
    client_root: Path, target: Target, data: bytes
) -> tuple[list[dict[str, object]], int, int]:
    if not data.startswith(b"MapLayoutResourceData"):
        raise ValueError(f"{target.token} is not MapLayoutResourceData")
    table_size, authored_count = struct.unpack_from("<II", data, 0x20)
    if table_size % 0x20:
        raise ValueError(f"{target.token} dependency table is not 0x20 aligned")
    rows: list[dict[str, object]] = []
    for index in range(min(authored_count, table_size // 0x20)):
        offset = 0x40 + index * 0x20
        raw_name, raw_ext, key, flags, zero = struct.unpack_from("<16s4sIII", data, offset)
        rows.append(
            {
                "target_token": target.token,
                "target_id": target.resource_id,
                "target_key_hex": f"0x{target.dat_key:08X}",
                "index": index,
                "offset_hex": f"0x{offset:08X}",
                "name": cstr(raw_name),
                "extension": cstr(raw_ext),
                "dependency_key_hex": f"0x{key:08X}",
                "kind_flags_hex": f"0x{flags:08X}",
                "zero_hex": f"0x{zero:08X}",
                "dependency_exists": dat_path(client_root, key).exists() if key else True,
            }
        )
    return rows, table_size, authored_count


def classify_string(value: str) -> str:
    lowered = value.lower()
    if "fcurve" in lowered or value == "@FCURVE":
        return "fcurve"
    if "schedul" in lowered or lowered.startswith("time_") or value in {"fdin", "fdot"}:
        return "scheduler"
    if "light" in lowered or "lght" in lowered:
        return "lighting"
    if any(term in lowered for term in ("fog", "dwev", "glare", "shadow", "blur", "screenenv", "colorcorrection")):
        return "draw-environment"
    if any(term in lowered for term in ("vfx", "aurora", "cloud", "star", "lastwtr", "tunder", "thdr")):
        return "weather-vfx"
    if any(term in lowered for term in ("beacon", "taihi", "shutter", "gate_")):
        return "tower-gimmick"
    if "/" in value or value.endswith(".dst") or value.endswith(".dds"):
        return "resource-path"
    return "other"


def printable_rows(target: Target, data: bytes) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for match in PRINTABLE_PATTERN.finditer(data):
        value = match.group().decode("ascii", errors="replace")
        classification = classify_string(value)
        rows.append(
            {
                "target_token": target.token,
                "target_id": target.resource_id,
                "offset_hex": f"0x{match.start():08X}",
                "offset_dec": match.start(),
                "classification": classification,
                "high_signal": classification != "other" or any(term in value.lower() for term in HIGH_SIGNAL_TERMS),
                "value": value,
            }
        )
    return rows


def fcurve_entries(target: Target, data: bytes) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for resource_index, match in enumerate(FCURVE_RESOURCE_PATTERN.finditer(data)):
        resource_base = match.start() + 0x20
        resource_size = struct.unpack_from("<I", data, match.start() + 0x10)[0]
        resource_end = resource_base + resource_size
        if resource_end > len(data) or data[resource_base : resource_base + 8] != b"SEDBmtb\0":
            raise ValueError(f"bad FCurve resource in {target.token} at 0x{match.start():X}")

        cursor = resource_base + 0x40
        tables: list[tuple[int, ...]] = []
        for _ in range(3):
            count = struct.unpack_from("<I", data, cursor)[0]
            cursor += 4
            tables.append(struct.unpack_from(f"<{count}I", data, cursor) if count else ())
            cursor += count * 4
        entry_offsets, _secondary_offsets, property_offsets = tables
        if len(entry_offsets) != len(property_offsets) + 1:
            raise ValueError(f"FCurve property count mismatch in {target.token}")

        for property_index, property_offset in enumerate(property_offsets):
            name_start = resource_base + property_offset
            name_end = data.find(b"\0", name_start, resource_end)
            if name_end < 0:
                raise ValueError(f"unterminated FCurve property in {target.token}")
            name = data[name_start:name_end].decode("ascii", errors="replace")
            entry_offset = resource_base + entry_offsets[property_index + 1]
            property_type = struct.unpack_from("<I", data, entry_offset + 0x14)[0]
            channel_count = property_type & 0xFF
            cursor = entry_offset + 0x18
            values: list[float] = []
            animated_channels = 0
            keyframes = 0
            parse_status = "parsed"
            try:
                for _channel_index in range(channel_count):
                    channel_header = struct.unpack_from("<I", data, cursor)[0]
                    if channel_header == 0:
                        values.append(struct.unpack_from("<f", data, cursor + 4)[0])
                        cursor += 8
                        continue
                    interpolation = channel_header & 0xFFFF
                    key_count = channel_header >> 16
                    if interpolation not in (2, 4) or key_count == 0:
                        raise ValueError(f"interpolation={interpolation} keys={key_count}")
                    animated_channels += 1
                    keyframes += key_count
                    record_size = 0x10 if interpolation == 2 else 0x08
                    cursor += 4
                    for key_index in range(key_count):
                        record_offset = cursor + key_index * record_size
                        value_offset = record_offset + 4 if interpolation == 2 else record_offset
                        values.append(struct.unpack_from("<f", data, value_offset)[0])
                    cursor += key_count * record_size
            except (struct.error, ValueError) as exc:
                parse_status = f"header-only: {exc}"
                values = []

            finite = [value for value in values if value == value and abs(value) != float("inf")]
            values_digest = hashlib.sha256(
                b"".join(struct.pack("<f", value) for value in values)
            ).hexdigest()
            rows.append(
                {
                    "target_token": target.token,
                    "target_id": target.resource_id,
                    "resource_index": resource_index,
                    "resource_marker_offset_hex": f"0x{match.start():08X}",
                    "resource_size": resource_size,
                    "property_index": property_index,
                    "property": name,
                    "property_type_hex": f"0x{property_type:08X}",
                    "channel_count": channel_count,
                    "animated_channels": animated_channels,
                    "keyframes": keyframes,
                    "sample_count": len(finite),
                    "minimum": min(finite) if finite else "",
                    "maximum": max(finite) if finite else "",
                    "values_sha256": values_digest,
                    "parse_status": parse_status,
                }
            )
    return rows


def fcurve_channel_rows(target: Target, data: bytes) -> list[dict[str, object]]:
    """Preserve every serialized FCurve channel/key record without hiding raw words."""
    rows: list[dict[str, object]] = []
    for resource_index, match in enumerate(FCURVE_RESOURCE_PATTERN.finditer(data)):
        resource_base = match.start() + 0x20
        resource_size = struct.unpack_from("<I", data, match.start() + 0x10)[0]
        resource_end = resource_base + resource_size
        cursor = resource_base + 0x40
        tables: list[tuple[int, ...]] = []
        for _ in range(3):
            count = struct.unpack_from("<I", data, cursor)[0]
            cursor += 4
            tables.append(struct.unpack_from(f"<{count}I", data, cursor) if count else ())
            cursor += count * 4
        entry_offsets, _secondary_offsets, property_offsets = tables
        for property_index, property_offset in enumerate(property_offsets):
            name_start = resource_base + property_offset
            name_end = data.find(b"\0", name_start, resource_end)
            name = data[name_start:name_end].decode("ascii", errors="replace")
            entry_offset = resource_base + entry_offsets[property_index + 1]
            property_type = struct.unpack_from("<I", data, entry_offset + 0x14)[0]
            cursor = entry_offset + 0x18
            for channel_index in range(property_type & 0xFF):
                channel_header = struct.unpack_from("<I", data, cursor)[0]
                if channel_header == 0:
                    value = struct.unpack_from("<f", data, cursor + 4)[0]
                    rows.append(
                        {
                            "target_token": target.token,
                            "resource_index": resource_index,
                            "property_index": property_index,
                            "property": name,
                            "channel_index": channel_index,
                            "interpolation": 0,
                            "key_index": "",
                            "record_offset_hex": f"0x{cursor + 4:08X}",
                            "time": "",
                            "value": value,
                            "tangent_in": "",
                            "tangent_out": "",
                            "raw_words_hex": f"0x{struct.unpack_from('<I', data, cursor + 4)[0]:08X}",
                        }
                    )
                    cursor += 8
                    continue
                interpolation = channel_header & 0xFFFF
                key_count = channel_header >> 16
                if interpolation not in (2, 4) or not key_count:
                    raise ValueError(
                        f"unsupported FCurve channel in {target.token}: interpolation={interpolation}, keys={key_count}"
                    )
                cursor += 4
                record_size = 0x10 if interpolation == 2 else 0x08
                for key_index in range(key_count):
                    record = cursor + key_index * record_size
                    words = struct.unpack_from(f"<{record_size // 4}I", data, record)
                    floats = struct.unpack_from(f"<{record_size // 4}f", data, record)
                    rows.append(
                        {
                            "target_token": target.token,
                            "resource_index": resource_index,
                            "property_index": property_index,
                            "property": name,
                            "channel_index": channel_index,
                            "interpolation": interpolation,
                            "key_index": key_index,
                            "record_offset_hex": f"0x{record:08X}",
                            "time": floats[0] if interpolation == 2 else "",
                            "value": floats[1] if interpolation == 2 else floats[0],
                            "tangent_in": floats[2] if interpolation == 2 else "",
                            "tangent_out": floats[3] if interpolation == 2 else "",
                            "raw_words_hex": " ".join(f"0x{word:08X}" for word in words),
                        }
                    )
                cursor += key_count * record_size
    return rows


def expanded_layout_descriptors(layout: Layout) -> dict[int, str]:
    """Discover all Tower descriptor families, including Misc/DrawEnv/ScreenEnv."""
    descriptors: dict[int, str] = {}
    for match in LAYOUT_TYPE_PATTERN.finditer(layout.relative):
        candidates = [
            (layout.word_counts[offset], offset)
            for offset in range(0, len(layout.relative) - 12, 4)
            if layout.u32(offset + 4) == 0 and layout.u32(offset + 8) == match.start()
        ]
        if candidates:
            usage, descriptor = max(candidates)
            if usage:
                descriptors[descriptor] = match.group()[:-1].decode("ascii")
    layout.type_descriptors.update(descriptors)
    return descriptors


def named_typed_nodes(layout: Layout, descriptors: dict[int, str]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    first_object = max(descriptors) + 0x14
    for offset in range(first_object, len(layout.relative) - 12, 4):
        descriptor = layout.u32(offset + 4)
        name = layout.node_name(offset)
        if descriptor not in descriptors or not layout.printable(name):
            continue
        rows.append(
            {
                "node_offset_hex": f"0x{offset:04X}",
                "physical_offset_hex": f"0x{layout.base_physical + offset:04X}",
                "node_gid": layout.u32(offset),
                "type": descriptors[descriptor],
                "name": name,
            }
        )
    return rows


def layout_type_inventory(layout: Layout, descriptors: dict[int, str]) -> list[dict[str, object]]:
    first_object = max(descriptors) + 0x14
    rows: list[dict[str, object]] = []
    for descriptor, type_name in sorted(descriptors.items()):
        nodes = [
            offset
            for offset in range(first_object, len(layout.relative) - 12, 4)
            if layout.u32(offset + 4) == descriptor
        ]
        rows.append(
            {
                "descriptor_offset_hex": f"0x{descriptor:04X}",
                "type": type_name,
                "serialized_node_count": len(nodes),
                "named_node_count": sum(layout.printable(layout.node_name(node)) for node in nodes),
                "node_offsets_hex": ";".join(f"0x{node:04X}" for node in nodes),
            }
        )
    return rows


def nodes_of_type(layout: Layout, descriptors: dict[int, str], type_name: str, minimum_bytes: int) -> list[int]:
    descriptor = next(pointer for pointer, name in descriptors.items() if name == type_name)
    return [
        offset
        for offset in range(0, len(layout.relative) - minimum_bytes, 4)
        if layout.u32(offset + 4) == descriptor and layout.printable(layout.node_name(offset))
    ]


def parse_instance(layout: Layout, folder: str, ordinal: int, cell: int, node: int) -> dict[str, object]:
    if layout.type_name(node) != "RefObjects/InstanceObject":
        raise ValueError(f"divide-map cell 0x{cell:X} does not point to an InstanceObject")
    reference = layout.u32(node + 60)
    rotation = layout.vector3(layout.u32(node + 44))
    scale = layout.vector3(layout.u32(node + 48))
    return {
        "folder": folder,
        "folder_ordinal": ordinal,
        "pointer_cell_offset_hex": f"0x{cell:04X}",
        "node_offset_hex": f"0x{node:04X}",
        "physical_offset_hex": f"0x{layout.base_physical + node:04X}",
        "node_gid": layout.u32(node),
        "instance_name": layout.node_name(node),
        "position_x": layout.f32(node + 32),
        "position_y": layout.f32(node + 36),
        "position_z": layout.f32(node + 40),
        "rotation_x": rotation[0],
        "rotation_y": rotation[1],
        "rotation_z": rotation[2],
        "scale_x": scale[0],
        "scale_y": scale[1],
        "scale_z": scale[2],
        "reference_offset_hex": f"0x{reference:04X}",
        "reference_gid": layout.u32(reference),
        "reference_name": layout.node_name(reference),
        "reference_type": layout.type_name(reference),
    }


def parse_divide_map(
    layout: Layout, descriptors: dict[int, str]
) -> tuple[list[dict[str, object]], list[dict[str, object]], list[dict[str, object]]]:
    type_name = "RefObjects/SharedFolder/DivideMap/DivideMapFolderObject"
    folders = nodes_of_type(layout, descriptors, type_name, 0x58)
    folder_rows: list[dict[str, object]] = []
    instance_rows: list[dict[str, object]] = []
    string_rows: list[dict[str, object]] = []
    seen_instances: set[int] = set()
    for node in folders:
        name = layout.node_name(node)
        primary_array, primary_count = layout.u32(node + 0x10), layout.u32(node + 0x14)
        secondary_array, secondary_count = layout.u32(node + 0x50), layout.u32(node + 0x54)
        if primary_count > 256 or secondary_count > 256:
            raise ValueError(f"implausible divide-map counts at 0x{node:X}")
        folder_rows.append(
            {
                "folder": name,
                "node_offset_hex": f"0x{node:04X}",
                "primary_instance_count": primary_count,
                "secondary_string_count": secondary_count,
                "bounds_min_x": layout.f32(node + 0x30),
                "bounds_min_y": layout.f32(node + 0x34),
                "bounds_min_z": layout.f32(node + 0x38),
                "bounds_max_x": layout.f32(node + 0x40),
                "bounds_max_y": layout.f32(node + 0x44),
                "bounds_max_z": layout.f32(node + 0x48),
            }
        )
        for ordinal in range(primary_count):
            cell = layout.u32(primary_array + ordinal * 4)
            instance = layout.u32(cell)
            if instance in seen_instances:
                raise ValueError(f"InstanceObject 0x{instance:X} is owned by multiple folders")
            seen_instances.add(instance)
            instance_rows.append(parse_instance(layout, name, ordinal, cell, instance))
        for ordinal in range(secondary_count):
            string_rows.append(
                {
                    "folder": name,
                    "ordinal": ordinal,
                    "pointer_offset_hex": f"0x{secondary_array + ordinal * 4:04X}",
                    "value": layout.cstr(layout.u32(secondary_array + ordinal * 4)),
                }
            )
    return folder_rows, instance_rows, string_rows


def parse_unit_trees(layout: Layout, descriptors: dict[int, str]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for node in nodes_of_type(layout, descriptors, "RefObjects/UnitTree/UnitTreeObject", 0x38):
        for member in unit_tree_members(layout, node):
            rows.append(
                {
                    "unit_tree": layout.node_name(node),
                    "unit_tree_offset_hex": f"0x{node:04X}",
                    **member,
                    "target_offset": f"0x{int(member['target_offset']):04X}",
                }
            )
    return rows


def parse_lights(layout: Layout, descriptors: dict[int, str]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for node in nodes_of_type(layout, descriptors, "BaseObjects/Light/LightBaseObject", 0x50):
        color = tuple(layout.f32(node + offset) for offset in (0x20, 0x24, 0x28))
        rows.append(
            {
                "name": layout.node_name(node),
                "node_gid": layout.u32(node),
                "node_offset_hex": f"0x{node:04X}",
                "color_r": color[0],
                "color_g": color[1],
                "color_b": color[2],
                "color_hex": "#" + "".join(f"{round(value * 255):02X}" for value in color),
                "intensity": layout.f32(node + 0x2C),
                "decay_rate": layout.f32(node + 0x30),
                "cone_angle_radians": layout.f32(node + 0x34),
                "penumbra_angle_radians": layout.f32(node + 0x38),
                "radius": layout.f32(node + 0x3C),
                "unknown_40_u32": layout.u32(node + 0x40),
                "light_type": layout.u32(node + 0x44),
                "light_type_name": {0: "directional", 1: "point", 3: "ambient"}.get(
                    layout.u32(node + 0x44), "unknown"
                ),
                "radius_candidate_b": layout.f32(node + 0x48),
                "tail_4c_raw": layout.u32(node + 0x4C),
                "semantic_confidence": "color/intensity/decay/angles/radius/light type native-labeled; conditional 0x48 and tail labels remain candidates",
            }
        )
    return rows


def native_light_abi_rows(executable: Path) -> list[dict[str, object]]:
    """Verify and export the installed client's LightBaseObject getter ABI."""
    data = executable.read_bytes()
    expected_sequences = {
        "light_type": bytes.fromhex("8b018b5020ffd28a4044c3"),
        "intensity": bytes.fromhex("8b018b5020ffd2d9402cc3"),
        "decay_rate": bytes.fromhex("8b018b5020ffd2d94030c3"),
        "cone_angle": bytes.fromhex("8b018b5020ffd2d94034c3"),
        "penumbra_angle": bytes.fromhex("8b018b5020ffd2d94038c3"),
        "radius": bytes.fromhex("8b018b5020ffd2d9403cc3"),
        "unknown_40": bytes.fromhex("8b018b5020ffd28b4040c3"),
    }
    missing = [name for name, sequence in expected_sequences.items() if sequence not in data]
    labels = {
        "light_type": "LightType: %u",
        "color": "Color: %.2f %.2f %.2f",
        "intensity": "Intensity: %f",
        "decay_rate": "DecayRate: %f",
        "cone_angle": "ConeAngle: %f",
        "penumbra_angle": "PenumbraAngle: %f",
        "radius": "Radius : %f",
    }
    missing.extend(name for name, label in labels.items() if label.encode() + b"\0" not in data)
    if missing:
        raise ValueError(f"installed LightBaseObject ABI drifted: {sorted(set(missing))}")

    executable_hash = sha256(data)
    definitions = (
        ("color", "0x20,0x24,0x28", "float32 x3", 40, "0x00AAE4A0", labels["color"], "native-labeled"),
        ("intensity", "0x2C", "float32", 41, "0x00AAE500", labels["intensity"], "native-labeled"),
        ("decay_rate", "0x30", "float32", 42, "0x00AAE510", labels["decay_rate"], "native-labeled"),
        ("cone_angle", "0x34", "float32", 43, "0x00AAE520", labels["cone_angle"], "native-labeled"),
        ("penumbra_angle", "0x38", "float32", 44, "0x00AAE530", labels["penumbra_angle"], "native-labeled"),
        ("radius", "0x3C", "float32", 45, "0x00AAE540", labels["radius"], "native-labeled"),
        ("radius_candidate_b", "0x48", "float32", 46, "0x00AAE550", "", "conditional getter; semantic name remains candidate"),
        ("unknown_40", "0x40", "uint32", 47, "0x00AAE590", "", "getter-proven; semantic name unknown"),
        ("light_type", "0x44", "uint8", 39, "0x00AAE490", labels["light_type"], "native-labeled"),
        ("tail_4c", "0x4C", "uint32", "", "", "", "serialized tail; no ILight getter identified"),
    )
    return [
        {
            "field": field,
            "serialized_offset": offset,
            "storage": storage,
            "ilight_vtable_slot": slot,
            "getter_va": getter,
            "client_diagnostic_label": label,
            "semantic_status": status,
            "executable_sha256": executable_hash,
        }
        for field, offset, storage, slot, getter, label, status in definitions
    ]


def light_type_crosscheck_rows(
    client_root: Path, tower_layout: Layout, tower_descriptors: dict[int, str]
) -> list[dict[str, object]]:
    samples = (
        (0x29B00008, "fst0Dungeon01", "DirectionalLight", "directional"),
        (0x29B00008, "fst0Dungeon01", "PointLight_A", "point"),
        (0x29B00008, "fst0Dungeon01", "AmbientLight", "ambient"),
    )
    rows: list[dict[str, object]] = []
    cached: dict[int, list[dict[str, object]]] = {}
    for key, layout_token, object_name, semantic in samples:
        if key not in cached:
            layout = Layout(dat_path(client_root, key).read_bytes())
            cached[key] = parse_lights(layout, expanded_layout_descriptors(layout))
        match = next(row for row in cached[key] if row["name"] == object_name)
        rows.append(
            {
                "layout_token": layout_token,
                "dat_key_hex": f"0x{key:08X}",
                "object_name": object_name,
                "authored_semantic": semantic,
                "light_type_value": match["light_type"],
                "evidence": "named comparison object",
            }
        )
    for light in parse_lights(tower_layout, tower_descriptors):
        rows.append(
            {
                "layout_token": "lak_l0_dun01",
                "dat_key_hex": "0x03E7000B",
                "object_name": light["name"],
                "authored_semantic": light["light_type_name"],
                "light_type_value": light["light_type"],
                "evidence": "Tower object classified by comparison values",
            }
        )
    return rows


def light_scheduler_crosscheck_rows(
    client_root: Path, tower_layout: Layout, tower_descriptors: dict[int, str]
) -> list[dict[str, object]]:
    comparisons = (
        ("Castrum Novum Transmission Tower", 511, 0x03E7000B, tower_layout, tower_descriptors),
        ("The Mun-Tuy Cellars", 311, 0x29B00008, None, None),
    )
    rows: list[dict[str, object]] = []
    for content, layout_id, key, provided_layout, provided_descriptors in comparisons:
        layout = provided_layout or Layout(dat_path(client_root, key).read_bytes())
        descriptors = provided_descriptors or expanded_layout_descriptors(layout)
        timeline_nodes = nodes_of_type(
            layout, descriptors, "BaseObjects/TimeLine/TimeLineBaseObject", 0x1C
        )
        compiled_names: list[str] = []
        point_light_clips: list[dict[str, object]] = []
        for node in timeline_nodes:
            try:
                _, payload = layout.timeline_scb(node)
            except ValueError:
                continue
            _, _, clips = parse_scb(payload)
            compiled_names.append(layout.node_name(node))
            point_light_clips.extend(
                {"timeline": layout.node_name(node), **clip}
                for clip in clips
                if clip.get("clip_class") == "LayRapturePointLightClip"
            )
        rows.append(
            {
                "content": content,
                "layout_id": layout_id,
                "dat_key_hex": f"0x{key:08X}",
                "serialized_timeline_count": len(timeline_nodes),
                "compiled_timeline_count": len(compiled_names),
                "compiled_timeline_names": ";".join(compiled_names),
                "point_light_clip_count": len(point_light_clips),
                "point_light_timelines": ";".join(
                    sorted({str(clip["timeline"]) for clip in point_light_clips})
                ),
                "controlled_point_light_actors": ";".join(
                    sorted({str(clip["controlled_actor"]) for clip in point_light_clips})
                ),
            }
        )
    return rows


def raw_field_rows(layout: Layout, node: int, type_name: str, start: int, end: int) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for field_offset in range(start, end, 4):
        raw = layout.u32(node + field_offset)
        value = layout.f32(node + field_offset)
        rows.append(
            {
                "object_name": layout.node_name(node),
                "object_type": type_name,
                "node_offset_hex": f"0x{node:04X}",
                "field_offset_hex": f"0x{field_offset:02X}",
                "raw_u32": raw,
                "raw_hex": f"0x{raw:08X}",
                "float32": value if math.isfinite(value) else "",
            }
        )
    return rows


def parse_screen_and_draw_environment(
    layout: Layout, descriptors: dict[int, str]
) -> tuple[list[dict[str, object]], list[dict[str, object]], list[dict[str, object]]]:
    links: list[dict[str, object]] = []
    raw: list[dict[str, object]] = []
    draw_raw: list[dict[str, object]] = []
    screen_sizes = {
        "ScreenEnvObjects/Glare/GlareObject": 0x44,
        "ScreenEnvObjects/Shadow/ShadowObject": 0x64,
        "ScreenEnvObjects/ColorCorrection/ColorCorrectionObject": 0x4C,
        "ScreenEnvObjects/VolumetricLight/VolumetricLightObject": 0x70,
        "ScreenEnvObjects/Blur/BlurObject": 0x30,
    }
    for node in nodes_of_type(layout, descriptors, "BaseObjects/ScreenEnv/ScreenEnvBaseObject", 0x30):
        for field_offset in (0x18, 0x20, 0x24, 0x28, 0x2C):
            child = layout.u32(node + field_offset)
            if child == 0:
                continue
            child_type = layout.type_name(child)
            if child_type not in screen_sizes:
                raise ValueError(
                    f"unexpected ScreenEnv child 0x{child:X} ({child_type!r}) at 0x{node:X}+0x{field_offset:X}"
                )
            links.append(
                {
                    "screen_environment": layout.node_name(node),
                    "screen_offset_hex": f"0x{node:04X}",
                    "link_field_offset_hex": f"0x{field_offset:02X}",
                    "child_offset_hex": f"0x{child:04X}",
                    "child_name": layout.node_name(child),
                    "child_type": child_type,
                }
            )
            raw.extend(raw_field_rows(layout, child, child_type, 0x0C, screen_sizes[child_type]))
    for node in nodes_of_type(layout, descriptors, "DrawEnvObjects/DrawEnv/DrawEnvObject", 0x3C):
        draw_raw.extend(raw_field_rows(layout, node, layout.type_name(node), 0x0C, 0x3C))
    return links, raw, draw_raw


def parse_screen_environment_parameters(
    layout: Layout, descriptors: dict[int, str], executable: Path
) -> list[dict[str, object]]:
    """Export the component fields named by the native ScreenEnv property printer."""
    executable_data = executable.read_bytes()
    executable_hash = sha256(executable_data)
    schemas = {
        "ScreenEnvObjects/Glare/GlareObject": (
            ("enabled", (0x25,), "bit0", "0x00AAFB90", "Glare Enabled: %s"),
            ("threshold", (0x10,), "float32", "0x00AAFBE0", "Glare Threshold: %f"),
            ("brightness", (0x14,), "float32", "0x00AAFC10", "Glare Brightness: %f"),
            ("type", (0x24,), "uint8", "0x00AAFC40", "Glare Type: %d"),
            ("color_saturation", (0x18,), "float32", "0x00AAFC70", "Glare ColorSaturaion: %f"),
            ("latitude_min", (0x1C,), "float32", "0x00AAFCA0", "Glare LatitudeMin: %f"),
            ("latitude_max", (0x20,), "float32", "0x00AAFCD0", "Glare LatitudeMax: %f"),
            ("multi_direction_latitude", (0x25,), "bit1", "0x00AAFD00", "Glare MultiDirectionLatitude: %c"),
        ),
        "ScreenEnvObjects/Shadow/ShadowObject": (
            ("enabled", (0x5C,), "bit0", "0x00AB0120", "Shadow Enabled: %s"),
            ("direction_fixed", (0x5C,), "bit1", "0x00AB0170", "Shadow DirFixed: %s"),
            ("bias", (0x1C,), "float32", "0x00AB0250", "Shadow Bias: %f"),
            ("direction", (0x10, 0x14, 0x18), "float32 x3", "0x00AB01C0", "Shadow Dir: (%f, %f, %f)"),
            ("color", (0x20, 0x24, 0x28, 0x34), "float32 x4", "0x00AB0280", "Shadow Color: (%f, %f, %f, %f)"),
        ),
        "ScreenEnvObjects/ColorCorrection/ColorCorrectionObject": (
            ("enabled", (0x3C,), "bit0", "0x00AB0620", "ColorCorrection Enabled: %s"),
            ("hsv", (0x10, 0x14, 0x18), "float32 x3", "0x00AB0670", "ColorCorrection HSV: (%f, %f, %f)"),
            ("brightness", (0x1C,), "float32", "0x00AB0740", "ColorCorrection Brightness: %f"),
            ("contrast", (0x20,), "float32", "0x00AB0790", "ColorCorrection Contrast: %f"),
            ("noise_amount", (0x24,), "float32", "0x00AB07E0", "ColorCorrection NoiseAmount: %f"),
            ("noise_offset", (0x28,), "float32", "0x00AB0830", "ColorCorrection NoiseOffset: %f"),
            ("grayscale_noise", (0x3C,), "bit1", "0x00AB0880", "ColorCorrection GraySclaeNoise: %s"),
            ("vignetting_blend_type", (0x2C,), "uint32", "0x00AB08D0", "ColorCorrection VignettingBlendType: %d"),
            ("vignetting_range", (0x30,), "float32", "0x00AB0910", "ColorCorrection VignettingRange: %f"),
            ("vignetting_exponent", (0x34,), "float32", "0x00AB0960", "ColorCorrection VignettingExp: %f"),
            ("vignetting_darkness", (0x38,), "float32", "0x00AB09B0", "ColorCorrection VignettingDarkness: %f"),
        ),
        "ScreenEnvObjects/Blur/BlurObject": (
            ("enabled", (0x2C,), "bit0", "0x00AB0A20", "Blur Enabled: %s"),
            ("position", (0x1C, 0x20), "float32 x2", "0x00AB0A70", "Blur Pos: (%f, %f)"),
            ("scale", (0x24,), "float32", "0x00AB0B10", "Blur Scale: %f"),
            ("color", (0x10, 0x14, 0x18), "float32 x3", "0x00AB0B40", "Blur Color: (%f, %f, %f)"),
            ("alpha", (0x28,), "float32", "0x00AB0BD0", "Blur Alpha: %f"),
        ),
        "ScreenEnvObjects/VolumetricLight/VolumetricLightObject": (
            ("enabled", (0x64,), "bit0", "0x00AB0C20", ""),
            ("vector_00", (0x10, 0x14, 0x18), "float32 x3", "0x00AB0E20", ""),
            ("scalar_00", (0x1C,), "float32", "0x00AB0C70", ""),
            ("vector_01", (0x20, 0x24, 0x28), "float32 x3", "0x00AB0EB0", ""),
            ("scalar_01", (0x2C,), "float32", "0x00AB0CA0", ""),
            ("scalar_02", (0x30,), "float32", "0x00AB0CD0", ""),
            ("scalar_03", (0x34,), "float32", "0x00AB0D00", ""),
            ("scalar_04", (0x38,), "float32", "0x00AB0D30", ""),
            ("scalar_05", (0x3C,), "float32", "0x00AB0D60", ""),
            ("scalar_06", (0x40,), "float32", "0x00AB0D90", ""),
            ("scalar_07", (0x44,), "float32", "0x00AB0DC0", ""),
            ("scalar_08", (0x48,), "float32", "0x00AB0DF0", ""),
            ("vector_02", (0x4C, 0x50, 0x54), "float32 x3", "0x00AB0F40", ""),
            ("mode_00", (0x58,), "uint32", "0x00AB1040", ""),
            ("mode_01", (0x5C,), "uint32", "0x00AB1010", ""),
            ("scalar_09", (0x60,), "float32", "0x00AB1070", ""),
        ),
    }
    required_labels = {
        label for fields in schemas.values() for _, _, _, _, label in fields if label
    }
    missing_labels = [
        label for label in required_labels if label.encode() + b"\0" not in executable_data
    ]
    if missing_labels:
        raise ValueError(f"installed ScreenEnv diagnostic labels drifted: {missing_labels}")

    def byte_value(node: int, offset: int) -> int:
        word = layout.u32(node + (offset & ~3))
        return (word >> ((offset & 3) * 8)) & 0xFF

    rows: list[dict[str, object]] = []
    for type_name, fields in schemas.items():
        nodes = nodes_of_type(layout, descriptors, type_name, 0x0C)
        for node in nodes:
            for field, offsets, storage, getter, label in fields:
                if storage.startswith("bit"):
                    bit = int(storage[-1])
                    value: object = bool((byte_value(node, offsets[0]) >> bit) & 1)
                elif storage.startswith("uint"):
                    value = byte_value(node, offsets[0]) if storage == "uint8" else layout.u32(node + offsets[0])
                else:
                    values = [layout.f32(node + offset) for offset in offsets]
                    value = values[0] if len(values) == 1 else json.dumps(values)
                rows.append(
                    {
                        "component_name": layout.node_name(node),
                        "component_type": type_name,
                        "field": field,
                        "serialized_offsets": ",".join(f"0x{offset:02X}" for offset in offsets),
                        "storage": storage,
                        "value": value,
                        "getter_va": getter,
                        "client_diagnostic_label": label,
                        "semantic_status": "native-labeled" if label else "native getter; no diagnostic label",
                        "executable_sha256": executable_hash,
                    }
                )
    return rows


def native_volumetric_light_abi_rows(executable: Path) -> list[dict[str, object]]:
    """Preserve the exact getter-to-serialized-field map without guessing labels."""
    fields = (
        ("enabled", "0x64 bit0", "bool", "0x00AB0C20"),
        ("vector_00", "0x10,0x14,0x18", "float32 x3", "0x00AB0E20"),
        ("scalar_00", "0x1C", "float32", "0x00AB0C70"),
        ("vector_01", "0x20,0x24,0x28", "float32 x3", "0x00AB0EB0"),
        ("scalar_01", "0x2C", "float32", "0x00AB0CA0"),
        ("scalar_02", "0x30", "float32", "0x00AB0CD0"),
        ("scalar_03", "0x34", "float32", "0x00AB0D00"),
        ("scalar_04", "0x38", "float32", "0x00AB0D30"),
        ("scalar_05", "0x3C", "float32", "0x00AB0D60"),
        ("scalar_06", "0x40", "float32", "0x00AB0D90"),
        ("scalar_07", "0x44", "float32", "0x00AB0DC0"),
        ("scalar_08", "0x48", "float32", "0x00AB0DF0"),
        ("vector_02", "0x4C,0x50,0x54", "float32 x3", "0x00AB0F40"),
        ("mode_00", "0x58", "uint32", "0x00AB1040"),
        ("mode_01", "0x5C", "uint32", "0x00AB1010"),
        ("scalar_09", "0x60", "float32", "0x00AB1070"),
    )
    executable_hash = sha256(executable.read_bytes())
    return [
        {
            "field": field,
            "serialized_offsets": offsets,
            "storage": storage,
            "getter_va": getter,
            "semantic_status": "native getter and storage proven; retail field label not recovered",
            "executable_sha256": executable_hash,
        }
        for field, offsets, storage, getter in fields
    ]


def native_volumetric_clip_property_rows(executable: Path) -> list[dict[str, object]]:
    """Export the names adjacent to the native Cut VolumetricLightClip vtable."""
    data = executable.read_bytes()
    sequence = b"SunPosition\0SunArea\0SunColor\0\0\0\0VolumetricLight\0"
    base = data.find(sequence)
    if base != 0x00D38344:
        raise ValueError(f"native VolumetricLightClip property table drifted: 0x{base:X}")
    executable_hash = sha256(data)
    properties = (
        ("SunPosition", base, "0x01138344"),
        ("SunArea", base + 0x0C, "0x01138350"),
        ("SunColor", base + 0x14, "0x01138358"),
        ("VolumetricLight", base + 0x20, "0x01138364"),
    )
    return [
        {
            "clip_class": "VolumetricLightClip@Plugins@Cut",
            "property": name,
            "executable_file_offset_hex": f"0x{offset:08X}",
            "native_va": va,
            "semantic_boundary": (
                "native clip property name; no serialized Tower/weather FCurve binding found"
            ),
            "executable_sha256": executable_hash,
        }
        for name, offset, va in properties
    ]


def native_draw_environment_abi_rows(
    layout: Layout, descriptors: dict[int, str], executable: Path
) -> list[dict[str, object]]:
    """Export the final native DrawEnv getters while keeping semantics conservative."""
    executable_hash = sha256(executable.read_bytes())
    rows: list[dict[str, object]] = []
    for node in nodes_of_type(
        layout, descriptors, "DrawEnvObjects/DrawEnv/DrawEnvObject", 0x3C
    ):
        feature_mask = layout.u32(node + 0x0C)
        fields = (
            (
                "feature_mask_bit_2",
                "0x0C bit2",
                "bool",
                bool(feature_mask & 4),
                "0x00A81710 gate",
                "gates the conditional boolean getter",
            ),
            (
                "conditional_flag_00",
                "0x2C bit0",
                "bool",
                bool(layout.u32(node + 0x2C) & 1),
                "0x00A81710",
                "returned only when feature-mask bit 2 is set",
            ),
            (
                "scalar_00",
                "0x34",
                "float32",
                layout.f32(node + 0x34),
                "0x00A81730",
                "native getter; retail field label not recovered",
            ),
            (
                "mode_00",
                "0x38",
                "uint32",
                layout.u32(node + 0x38),
                "0x00A81740",
                "native getter; retail field label not recovered",
            ),
        )
        for field, offsets, storage, value, getter, condition in fields:
            rows.append(
                {
                    "object_name": layout.node_name(node),
                    "field": field,
                    "serialized_offsets": offsets,
                    "storage": storage,
                    "value": value,
                    "getter_va": getter,
                    "condition_or_status": condition,
                    "executable_sha256": executable_hash,
                }
            )
    return rows


def parse_weather_timelines(
    source: str, layout: Layout, descriptors: dict[int, str]
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    packages: list[dict[str, object]] = []
    clips_out: list[dict[str, object]] = []
    for node in nodes_of_type(layout, descriptors, "BaseObjects/TimeLine/TimeLineBaseObject", 0x1C):
        timeline = layout.node_name(node)
        common = {
            "source": source,
            "timeline": timeline,
            "timeline_node_offset_hex": f"0x{node:04X}",
        }
        physical = layout.u32(node + 0x14)
        scb_size = layout.u32(node + 0x18)
        if physical == 0 and scb_size == 0:
            packages.append(
                {
                    **common,
                    "compile_status": "serialized-name-only",
                    "scb_physical_offset_hex": "",
                    "scb_size": 0,
                    "active_duration_seconds": "",
                    "entry_count": 0,
                    "controlled_actor_count": 0,
                    "clip_classes": "",
                }
            )
            continue
        actual_physical, payload = layout.timeline_scb(node)
        package, _actors, clips = parse_scb(payload)
        packages.append(
            {
                **common,
                "compile_status": "compiled-scb",
                "scb_physical_offset_hex": f"0x{actual_physical:04X}",
                "scb_size": len(payload),
                "active_duration_seconds": package["active_duration_seconds"],
                "entry_count": package["entry_count"],
                "controlled_actor_count": package["controlled_actor_count"],
                "clip_classes": package["clip_classes"],
            }
        )
        clips_out.extend(
            {
                **common,
                "clip_index": clip_index,
                "clip_class": clip["clip_class"],
                "controlled_actor": clip["controlled_actor"],
                "controlled_actor_class": clip["controlled_actor_class"],
                "start_seconds": clip["start_seconds"],
                "record_size": clip["record_size"],
                "body_sha256": clip["body_sha256"],
            }
            for clip_index, clip in enumerate(clips)
        )
    return packages, clips_out


def weather_fcurve_records(source: str, data: bytes) -> list[dict[str, object]]:
    """Attach each raw FCurve record to its owning compiled weather timeline."""
    layout = Layout(data)
    descriptors = expanded_layout_descriptors(layout)
    spans: list[tuple[str, int, int]] = []
    for node in nodes_of_type(
        layout, descriptors, "BaseObjects/TimeLine/TimeLineBaseObject", 0x1C
    ):
        if layout.u32(node + 0x14) == 0 and layout.u32(node + 0x18) == 0:
            continue
        physical, payload = layout.timeline_scb(node)
        spans.append((layout.node_name(node), physical, physical + len(payload)))

    _packages, timeline_clips = parse_weather_timelines(source, layout, descriptors)
    clip_context = {
        (str(row["timeline"]), int(row["clip_index"])): row
        for row in timeline_clips
    }
    markers = [match.start() for match in FCURVE_RESOURCE_PATTERN.finditer(data)]
    rows = fcurve_channel_rows(Target("event-weather", 0, source, 0, ""), data)
    resource_ordinals: dict[str, int] = Counter()
    resource_context: dict[int, tuple[str, int]] = {}
    for resource_index, marker in enumerate(markers):
        timeline = next(
            (name for name, start, end in spans if start <= marker < end),
            "unowned-layout-fcurve",
        )
        ordinal = resource_ordinals[timeline]
        resource_ordinals[timeline] += 1
        resource_context[resource_index] = (timeline, ordinal)

    enriched: list[dict[str, object]] = []
    for row in rows:
        resource_index = int(row["resource_index"])
        timeline, ordinal = resource_context[resource_index]
        clip = clip_context.get((timeline, ordinal))
        enriched.append(
            {
                "source": source,
                "timeline": timeline,
                "timeline_resource_index": ordinal,
                "clip_class": clip["clip_class"] if clip is not None else "",
                "controlled_actor": clip["controlled_actor"] if clip is not None else "",
                "resource_marker_offset_hex": f"0x{markers[resource_index]:08X}",
                **{key: value for key, value in row.items() if key != "target_token"},
            }
        )
    return enriched


def weather_tower_lane_comparison_rows(
    client_root: Path, custom_8076: Path
) -> list[dict[str, object]]:
    """Compare the lanes the Tower can actually register against the imported event lane."""
    sources = (
        ("Clear weather 8001", 8001, "0x03E70003", dat_path(client_root, 0x03E70003)),
        ("Retail weather 8032", 8032, "0x03E7000E", dat_path(client_root, 0x03E7000E)),
        ("Custom weather 8076", 8076, "0x29B00032", custom_8076),
    )
    lanes = ("dwev_00", "dwev_20", "dwev_01")
    rows: list[dict[str, object]] = []
    actor_sets: dict[tuple[str, str], set[str]] = {}
    hash_by_source_lane: dict[tuple[str, str], str] = {}
    for source, weather_id, dat_key_hex, path in sources:
        data = path.read_bytes()
        layout = Layout(data)
        descriptors = expanded_layout_descriptors(layout)
        draw_names = {
            layout.node_name(node)
            for node in nodes_of_type(
                layout, descriptors, "DrawEnvObjects/DrawEnv/DrawEnvObject", 0x3C
            )
        }
        packages, clips = parse_weather_timelines(source, layout, descriptors)
        records = weather_fcurve_records(source, data)
        for lane in lanes:
            timeline = f"time_{lane}"
            package = next((row for row in packages if row["timeline"] == timeline), None)
            lane_clips = [row for row in clips if row["timeline"] == timeline]
            lane_records = [row for row in records if row["timeline"] == timeline]
            actors = {str(row["controlled_actor"]) for row in lane_clips}
            actor_sets[(source, lane)] = actors
            digest = hashlib.sha256(
                "|".join(str(row["raw_words_hex"]) for row in lane_records).encode("ascii")
            ).hexdigest()
            hash_by_source_lane[(source, lane)] = digest
            material_values: list[str] = []
            for actor in sorted(
                str(row["controlled_actor"])
                for row in lane_clips
                if "Material" in str(row["clip_class"])
            ):
                actor_records = [
                    row for row in lane_records if row["controlled_actor"] == actor
                ]
                for property_name in sorted({str(row["property"]) for row in actor_records}):
                    property_records = [
                        row for row in actor_records if row["property"] == property_name
                    ]
                    values = sorted({float(row["value"]) for row in property_records})
                    material_values.append(
                        f"{actor}.{property_name}="
                        + "/".join(f"{value:g}" for value in values)
                    )
            animated_times = [
                float(row["time"]) for row in lane_records if row["time"] != ""
            ]
            rows.append(
                {
                    "source": source,
                    "weather_id": weather_id,
                    "dat_key_hex": dat_key_hex,
                    "lane": lane,
                    "active_at_observed_tower_coordinate": lane == "dwev_00",
                    "tower_layout_declares_lane": lane in {"dwev_00", "dwev_20"},
                    "drawenv_object_present": lane in draw_names,
                    "timeline_present": package is not None,
                    "timeline_active_duration_seconds": (
                        package["active_duration_seconds"] if package is not None else ""
                    ),
                    "clip_count": len(lane_clips),
                    "controlled_actors": ";".join(sorted(actors)),
                    "material_override_actors": ";".join(
                        sorted(
                            str(row["controlled_actor"])
                            for row in lane_clips
                            if "Material" in str(row["clip_class"])
                        )
                    ),
                    "material_override_values": ";".join(material_values),
                    "fcurve_resource_count": len(
                        {int(row["timeline_resource_index"]) for row in lane_records}
                    ),
                    "fcurve_record_count": len(lane_records),
                    "curve_time_min": min(animated_times) if animated_times else "",
                    "curve_time_max": max(animated_times) if animated_times else "",
                    "fcurve_raw_words_sha256": digest,
                    "fcurve_properties": ";".join(
                        sorted({str(row["property"]) for row in lane_records})
                    ),
                    "extra_actors_vs_clear_same_lane": "",
                    "missing_actors_vs_clear_same_lane": "",
                    "fcurve_hash_matches_clear_same_lane": "",
                }
            )
    clear_source = "Clear weather 8001"
    for row in rows:
        source = str(row["source"])
        lane = str(row["lane"])
        clear_actors = actor_sets[(clear_source, lane)]
        actors = actor_sets[(source, lane)]
        row["extra_actors_vs_clear_same_lane"] = ";".join(sorted(actors - clear_actors))
        row["missing_actors_vs_clear_same_lane"] = ";".join(sorted(clear_actors - actors))
        row["fcurve_hash_matches_clear_same_lane"] = (
            hash_by_source_lane[(source, lane)]
            == hash_by_source_lane[(clear_source, lane)]
        )
    active_custom = next(
        row
        for row in rows
        if row["source"] == "Custom weather 8076" and row["lane"] == "dwev_00"
    )
    if active_custom["extra_actors_vs_clear_same_lane"] != "diffuseColor_00;lightMapOcclusi":
        raise ValueError("8076 active dwev_00 material override set drifted")
    if active_custom["material_override_values"] != (
        "diffuseColor_00.Attr=0;lightMapOcclusi.Attr=1"
    ):
        raise ValueError("8076 active dwev_00 material override constants drifted")
    return rows


def weather_8076_derivation_rows(
    source_path: Path, custom_path: Path
) -> tuple[
    list[dict[str, object]],
    list[dict[str, object]],
    list[dict[str, object]],
    list[dict[str, object]],
]:
    """Prove exactly which 8076 bytes/FCurves differ from restored Starlight."""
    source_data = source_path.read_bytes()
    custom_data = custom_path.read_bytes()
    if len(source_data) != len(custom_data):
        raise ValueError("8076 derivation changed the restored Starlight payload length")

    source_records = weather_fcurve_records("Restored Starlight 8071", source_data)
    custom_records = weather_fcurve_records("Custom winter-night 8076", custom_data)

    structure_fields = (
        "timeline",
        "timeline_resource_index",
        "resource_index",
        "resource_marker_offset_hex",
        "property_index",
        "property",
        "channel_index",
        "interpolation",
        "key_index",
        "record_offset_hex",
        "time",
    )
    source_structure = [tuple(row[field] for field in structure_fields) for row in source_records]
    custom_structure = [tuple(row[field] for field in structure_fields) for row in custom_records]
    if source_structure != custom_structure:
        raise ValueError("8076 changed the restored Starlight FCurve graph structure")

    change_rows: list[dict[str, object]] = []
    changed_record_offsets: set[int] = set()
    for source_row, custom_row in zip(source_records, custom_records):
        if source_row["raw_words_hex"] == custom_row["raw_words_hex"]:
            continue
        record_offset = int(str(source_row["record_offset_hex"]), 16)
        changed_record_offsets.add(record_offset)
        change_rows.append(
            {
                "timeline": source_row["timeline"],
                "timeline_resource_index": source_row["timeline_resource_index"],
                "property": source_row["property"],
                "channel_index": source_row["channel_index"],
                "interpolation": source_row["interpolation"],
                "key_index": source_row["key_index"],
                "record_offset_hex": source_row["record_offset_hex"],
                "curve_time": source_row["time"],
                "timeline_seconds": (
                    float(source_row["time"]) / 100.0 if source_row["time"] != "" else ""
                ),
                "source_value": source_row["value"],
                "custom_value": custom_row["value"],
                "source_tangent_in": source_row["tangent_in"],
                "custom_tangent_in": custom_row["tangent_in"],
                "source_tangent_out": source_row["tangent_out"],
                "custom_tangent_out": custom_row["tangent_out"],
                "source_raw_words_hex": source_row["raw_words_hex"],
                "custom_raw_words_hex": custom_row["raw_words_hex"],
            }
        )

    source_layout = Layout(source_data)
    custom_layout = Layout(custom_data)
    source_descriptors = expanded_layout_descriptors(source_layout)
    custom_descriptors = expanded_layout_descriptors(custom_layout)
    source_packages, _ = parse_weather_timelines(
        "Restored Starlight 8071", source_layout, source_descriptors
    )
    custom_packages, _ = parse_weather_timelines(
        "Custom winter-night 8076", custom_layout, custom_descriptors
    )
    package_fields = (
        "timeline",
        "timeline_node_offset_hex",
        "compile_status",
        "scb_physical_offset_hex",
        "scb_size",
        "active_duration_seconds",
        "entry_count",
        "controlled_actor_count",
        "clip_classes",
    )
    timeline_structure_equal = [
        tuple(row[field] for field in package_fields) for row in source_packages
    ] == [tuple(row[field] for field in package_fields) for row in custom_packages]
    if not timeline_structure_equal:
        raise ValueError("8076 changed the restored Starlight timeline package structure")

    source_units = [
        row
        for row in parse_unit_trees(source_layout, source_descriptors)
        if str(row["unit_tree"]).startswith("sgrp_dwev")
    ]
    custom_units = [
        row
        for row in parse_unit_trees(custom_layout, custom_descriptors)
        if str(row["unit_tree"]).startswith("sgrp_dwev")
    ]
    if source_units != custom_units:
        raise ValueError("8076 changed the restored Starlight draw-environment UnitTree graph")
    unit_rows = [
        {
            "provenance": "restored Starlight graph; byte-identical in custom 8076",
            **row,
        }
        for row in custom_units
    ]

    snow_entry_indices = tuple(range(25, 30))
    snow_ranges = [range(0x40 + index * 0x20, 0x40 + (index + 1) * 0x20) for index in snow_entry_indices]
    allowed_offsets = {offset for offsets in snow_ranges for offset in offsets}
    for source_row, custom_row in zip(source_records, custom_records):
        if source_row["raw_words_hex"] == custom_row["raw_words_hex"]:
            continue
        record_offset = int(str(source_row["record_offset_hex"]), 16)
        word_count = len(str(source_row["raw_words_hex"]).split())
        allowed_offsets.update(range(record_offset, record_offset + word_count * 4))
    diff_offsets = {index for index, pair in enumerate(zip(source_data, custom_data)) if pair[0] != pair[1]}
    if not diff_offsets <= allowed_offsets:
        unexpected = sorted(diff_offsets - allowed_offsets)[:16]
        raise ValueError(f"8076 has unexplained changed bytes: {unexpected}")

    table_size, entry_count = struct.unpack_from("<II", source_data, 0x20)
    source_dependency_rows = sum(
        struct.unpack_from("<I", source_data, 0x40 + index * 0x20 + 0x14)[0] != 0
        for index in range(min(entry_count, table_size // 0x20))
    )
    custom_dependency_rows = sum(
        struct.unpack_from("<I", custom_data, 0x40 + index * 0x20 + 0x14)[0] != 0
        for index in range(min(entry_count, table_size // 0x20))
    )
    changed_timelines = sorted({str(row["timeline"]) for row in change_rows})
    summary_rows = [
        {
            "source_path": str(source_path),
            "source_sha256": sha256(source_data),
            "custom_path": str(custom_path),
            "custom_sha256": sha256(custom_data),
            "payload_bytes": len(source_data),
            "changed_byte_count": len(diff_offsets),
            "source_nonzero_dependency_rows": source_dependency_rows,
            "custom_nonzero_dependency_rows": custom_dependency_rows,
            "zeroed_dependency_entry_indices": ";".join(map(str, snow_entry_indices)),
            "fcurve_record_count": len(source_records),
            "changed_fcurve_record_count": len(change_rows),
            "changed_timeline_count": len(changed_timelines),
            "changed_timelines": ";".join(changed_timelines),
            "timeline_structure_equal": timeline_structure_equal,
            "drawenv_unit_tree_graph_equal": True,
            "time_dwev_01_inherited_from_source": any(
                row["timeline"] == "time_dwev_01" for row in source_packages
            ),
            "time_dwev_01_changed_fcurve_records": sum(
                row["timeline"] == "time_dwev_01" for row in change_rows
            ),
            "all_changed_bytes_explained": True,
        }
    ]

    source_by_offset = {
        str(row["record_offset_hex"]): row for row in source_records
    }
    profile_groups: dict[tuple[object, ...], list[dict[str, object]]] = {}
    for row in custom_records:
        if not str(row["timeline"]).startswith("time_dwev_"):
            continue
        key = (
            row["timeline"],
            row["timeline_resource_index"],
            row["property_index"],
            row["property"],
            row["channel_index"],
            row["interpolation"],
        )
        profile_groups.setdefault(key, []).append(row)
    profile_rows: list[dict[str, object]] = []
    for key, records in profile_groups.items():
        times = [float(row["time"]) for row in records if row["time"] != ""]
        values = [float(row["value"]) for row in records]
        changed_count = sum(
            row["raw_words_hex"]
            != source_by_offset[str(row["record_offset_hex"])]["raw_words_hex"]
            for row in records
        )
        profile_rows.append(
            {
                "timeline": key[0],
                "timeline_resource_index": key[1],
                "property_index": key[2],
                "property": key[3],
                "channel_index": key[4],
                "interpolation": key[5],
                "record_count": len(records),
                "curve_time_min": min(times) if times else "",
                "curve_time_max": max(times) if times else "",
                "timeline_seconds_min": min(times) / 100.0 if times else "",
                "timeline_seconds_max": max(times) / 100.0 if times else "",
                "curve_times": ";".join(f"{time:g}" for time in times),
                "value_min": min(values),
                "value_max": max(values),
                "changed_records_from_starlight": changed_count,
                "time_mapping_status": (
                    "serialized FCurve time is centiseconds; time/100 matches the compiled SCB active duration"
                    if times
                    else "constant channel"
                ),
            }
        )
    return summary_rows, change_rows, profile_rows, unit_rows


def weather_drawenv_controller_abi_rows(executable: Path) -> list[dict[str, object]]:
    data = executable.read_bytes()
    for literal in (b"dwev_0\0", b"dwev_1\0", b"dwev_2\0", b"dwev_21\0"):
        if literal not in data:
            raise ValueError(f"native weather draw-environment literal drifted: {literal!r}")
    executable_hash = sha256(data)
    return [
        {
            "native_va": "0x007E7480",
            "operation": "WeatherManager::RegistWeatherLayout",
            "literal_or_field": "dwev_0 / dwev_1 / dwev_2",
            "finding": "classifies registered layout names into base and transition draw-environment lanes using substring tests",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007E7500-0x007E7595",
            "operation": "draw-environment lane selection",
            "literal_or_field": "dwev_0 / dwev_1 / dwev_2",
            "finding": "sets transition mode 1 or 2 and registers the corresponding named lane when current/next families differ",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x00FEF4C0-0x00FEF4F8",
            "operation": "draw-environment family literal table",
            "literal_or_field": "dwev_0 / dwev_1 / dwev_2 (two repeated triplets)",
            "finding": "registration classifies only the first suffix family; it contains no literal test for exact second-suffix identities such as dwev_01",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007E763E-0x007E773A",
            "operation": "draw-environment interpolation",
            "literal_or_field": "registered lane objects + transition mode",
            "finding": "iterates matching draw-environment objects and submits interpolated state to the weather layout controller",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007E2330",
            "operation": "weather transition progress normalization",
            "literal_or_field": "30.0 scale / 86400 remainder guard; manager +0x138..+0x150",
            "finding": "computes elapsed/target weather-transition progress and clamps it to 0..1",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007E933D",
            "operation": "WeatherManager::OnUpdate transition handoff",
            "literal_or_field": "normalized transition fraction from 0x007E2330",
            "finding": "passes the current normalized weather-transition fraction directly to WeatherManager::Leap",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007E78D0",
            "operation": "WeatherManager::Leap",
            "literal_or_field": "single float argument constrained to 0..1",
            "finding": "selects the oldest/newest 12-byte queued DrawEnv entries, removes the old entry when progress reaches 1.0, and submits both entries for blending",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007E6690",
            "operation": "queued DrawEnv renderer-state blend",
            "literal_or_field": "old/new layout objects + transition fraction",
            "finding": "blends light, environment-map, fog, screen-environment, shadow/material, and related renderer state banks using the same transition fraction",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007DB9C0 / caller 0x007DCE8C",
            "operation": "active spatial draw-environment registration",
            "literal_or_field": "camera/player spatial query; current layout object name",
            "finding": "selects the current spatial draw-environment object and registers its name with WeatherManager",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007DCE65-0x007DCEA5",
            "operation": "selected DrawEnv exact-name handoff",
            "literal_or_field": "selected object vfunc +0xA4; previous object +0x20; current object +0x24; cached name +0xC0",
            "finding": "only when the selected spatial object pointer changes, obtains its exact full name through vfunc +0xA4, passes new and previous names to RegistWeatherLayout, then caches the new name",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "0x007DCE9A-0x007DCEAD",
            "operation": "dwev_0 family fade direction",
            "literal_or_field": "dwev_0; WeatherManager +0x1A4",
            "finding": "sets the +0x1A4 direction flag when the exact selected name does not contain dwev_0; the separate +0x1A0 state moves toward that direction at delta*0.05",
            "confidence": "native-direct",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "unresolved runtime lane identity",
            "operation": "Tower coordinate boundary",
            "literal_or_field": "zone-in coordinate (0,-100,0)",
            "finding": "static decomp cannot prove which exact dwev suffix is active at this coordinate; live object-name logging is still required",
            "confidence": "explicit-boundary",
            "executable_sha256": executable_hash,
        },
    ]


def native_material2_clip_abi_rows(executable: Path) -> list[dict[str, object]]:
    data = executable.read_bytes()
    required = (
        b".?AVLayRaptureMaterial2Clip@Clip@Cut@Scene@Application@@\0",
        b".?AVRaptureMaterial2Clip@Clip@Cut@Scene@Application@@\0",
        b"RaptureMaterial2Clip::OnEnter\0",
        b"RaptureMaterial2Clip.cpp\0",
        b"Attr\0",
    )
    for literal in required:
        if literal not in data:
            raise ValueError(f"native Material2 clip literal drifted: {literal!r}")
    executable_hash = sha256(data)
    common = {"confidence": "native-direct", "executable_sha256": executable_hash}
    return [
        {
            "native_va": "0x01039F9C",
            "operation": "LayRaptureMaterial2Clip vtable",
            "field_or_literal": "42 virtual entries; RTTI 0x012CF2F8",
            "finding": "layout-bound Material2 clip class used by weather time_dwev_00",
            **common,
        },
        {
            "native_va": "0x01039E2C",
            "operation": "RaptureMaterial2Clip vtable",
            "field_or_literal": "42 virtual entries; RTTI 0x012CF274",
            "finding": "runtime Material2 clip implementation",
            **common,
        },
        {
            "native_va": "0x00835250",
            "operation": "RaptureMaterial2Clip initialization",
            "field_or_literal": "native diagnostic RaptureMaterial2Clip::OnEnter; property Attr at 0x01039910",
            "finding": "resolves the Attr FCurve, animation node, four channel handles at object +0x68/+0x6C/+0x70/+0x74, and whether the controlled actor is LaySystemActor",
            **common,
        },
        {
            "native_va": "0x00835470",
            "operation": "Material2 RGBA application",
            "field_or_literal": "channel suffixes R/G/B/A at 0x01039928/2C/30/34",
            "finding": "samples four Attr curves, appends R, G, B, and A to the controlled actor name, and submits each name/value pair to every material entry in the active container",
            **common,
        },
        {
            "native_va": "0x00835470 material loop",
            "operation": "Material2 target iteration",
            "field_or_literal": "container +0x360 count; +0x364 entries; 0x54-byte stride; entry vfunc +0x10",
            "finding": "the clip is a material-parameter broadcast across the active container rather than a Tower point-light controller",
            **common,
        },
        {
            "native_va": "0x00835470 result cache",
            "operation": "Material2 sampled value cache",
            "field_or_literal": "clip object +0x40/+0x44/+0x48/+0x4C",
            "finding": "stores the last sampled R/G/B/A values after applying them",
            **common,
        },
        {
            "native_va": "serialized 8076 time_dwev_00 resource 4",
            "operation": "active diffuseColor_00 override",
            "field_or_literal": "Attr channels R/G/B/A = 0/0/0/0",
            "finding": "the live-selected 8076 lane broadcasts diffuseColor_00R/G/B/A as zero; clear 8001 has no corresponding Material2 clip",
            "confidence": "native/direct-structure",
            "executable_sha256": executable_hash,
        },
        {
            "native_va": "serialized 8076 time_dwev_00 resource 5",
            "operation": "active lightMapOcclusi override",
            "field_or_literal": "Attr channels R/G/B/A = 1/1/1/1",
            "finding": "the live-selected 8076 lane broadcasts lightMapOcclusiR/G/B/A as one; clear 8001 has no corresponding Material2 clip",
            "confidence": "native/direct-structure",
            "executable_sha256": executable_hash,
        },
    ]


def weather_special_lane_census_rows(
    client_root: Path, starlight_source: Path, custom_8076: Path
) -> list[dict[str, object]]:
    """Distinguish the standardized city-event `_01` lane from local weather lanes."""
    sources: list[tuple[str, int, str, str, Path]] = [
        ("Mor Dhona local", 8001, "clear", "0x03E70003", dat_path(client_root, 0x03E70003)),
        ("Mor Dhona local", 8002, "fair", "0x03E70004", dat_path(client_root, 0x03E70004)),
        ("Mor Dhona local", 8003, "cloudy", "0x03E70005", dat_path(client_root, 0x03E70005)),
        ("Mor Dhona local", 8004, "fog", "0x03E70006", dat_path(client_root, 0x03E70006)),
        ("Mor Dhona local", 8007, "rain", "0x03E70007", dat_path(client_root, 0x03E70007)),
        ("Mor Dhona local", 8017, "dust", "0x03E70008", dat_path(client_root, 0x03E70008)),
        ("Mor Dhona local event", 8030, "Dalamud", "0x03E7000D", dat_path(client_root, 0x03E7000D)),
        ("Mor Dhona local event", 8031, "aurora", "0x03E7000C", dat_path(client_root, 0x03E7000C)),
        ("Mor Dhona local event", 8032, "Dalamud Thunder", "0x03E7000E", dat_path(client_root, 0x03E7000E)),
        ("Gridania city seasonal", 8027, "Halloween", "0x29B00020", dat_path(client_root, 0x29B00020)),
        ("Gridania city seasonal", 8028, "primal/summon", "0x29B0001E", dat_path(client_root, 0x29B0001E)),
        ("Gridania city seasonal", 8029, "Moonfire", "0x29B0001D", dat_path(client_root, 0x29B0001D)),
        ("Gridania city seasonal", 8030, "Dalamud", "0x29B0001C", dat_path(client_root, 0x29B0001C)),
        ("Gridania city seasonal", 8031, "aurora", "0x29B0001B", dat_path(client_root, 0x29B0001B)),
        ("Gridania city seasonal", 8032, "Starlight", "0x29B0001A", dat_path(client_root, 0x29B0001A)),
        ("Restored Gridania seasonal", 8071, "restored Starlight", "0x29B00030", starlight_source),
        ("Universal custom from Gridania", 8076, "winter night", "0x29B00032", custom_8076),
    ]
    rows: list[dict[str, object]] = []
    for scope, weather_id, label, key_hex, path in sources:
        data = path.read_bytes()
        layout = Layout(data)
        descriptors = expanded_layout_descriptors(layout)
        draw_nodes = nodes_of_type(
            layout, descriptors, "DrawEnvObjects/DrawEnv/DrawEnvObject", 0x3C
        )
        draw_by_name = {layout.node_name(node): node for node in draw_nodes}
        lane_node = draw_by_name.get("dwev_01")
        unit_members = [
            row
            for row in parse_unit_trees(layout, descriptors)
            if row["unit_tree"] == "sgrp_dwev_01"
        ]
        packages, _clips = parse_weather_timelines(label, layout, descriptors)
        package = next(
            (row for row in packages if row["timeline"] == "time_dwev_01"), None
        )

        instance_names: list[str] = []
        instance_gids: list[int] = []
        for folder in nodes_of_type(
            layout,
            descriptors,
            "RefObjects/SharedFolder/DivideMap/DivideMapFolderObject",
            0x58,
        ):
            if layout.node_name(folder) != "blk_0000":
                continue
            array, count = layout.u32(folder + 0x10), layout.u32(folder + 0x14)
            if count > 256 or array + count * 4 > len(layout.relative):
                continue
            for ordinal in range(count):
                cell = layout.u32(array + ordinal * 4)
                if cell + 4 > len(layout.relative):
                    continue
                instance = layout.u32(cell)
                if instance + 0x40 > len(layout.relative):
                    continue
                parsed = parse_instance(layout, "blk_0000", ordinal, cell, instance)
                if parsed["reference_name"] == "sgrp_dwev_01":
                    instance_names.append(str(parsed["instance_name"]))
                    instance_gids.append(int(parsed["node_gid"]))

        wind_names: list[str] = []
        if lane_node is not None:
            wind_array = layout.u32(lane_node + 0x18)
            wind_count = layout.u32(lane_node + 0x1C)
            if wind_count <= 32 and wind_array + wind_count * 4 <= len(layout.relative):
                for index in range(wind_count):
                    instance = layout.u32(wind_array + index * 4)
                    if instance + 0x40 <= len(layout.relative):
                        reference = layout.u32(instance + 0x3C)
                        if reference < len(layout.relative):
                            wind_names.append(layout.node_name(reference))

        rows.append(
            {
                "scope": scope,
                "weather_id": weather_id,
                "weather_label": label,
                "dat_key_hex": key_hex,
                "path": str(path),
                "payload_bytes": len(data),
                "dwev_01_present": lane_node is not None,
                "numbered_drawenv_lanes": ";".join(
                    sorted(name for name in draw_by_name if re.fullmatch(r"dwev_\d\d", name))
                ),
                "unit_member_count": len(unit_members),
                "instance_names": ";".join(instance_names),
                "instance_gids": ";".join(map(str, instance_gids)),
                "wind_objects": ";".join(wind_names),
                "timeline_present": package is not None,
                "timeline_active_duration_seconds": (
                    package["active_duration_seconds"] if package is not None else ""
                ),
                "timeline_clip_count": package["entry_count"] if package is not None else 0,
                "classification": (
                    "standardized Gridania seasonal/event overlay lane"
                    if lane_node is not None
                    else "local Mor Dhona wrapper with standard numbered lanes only"
                ),
            }
        )

    mor_dhona = [row for row in rows if str(row["scope"]).startswith("Mor Dhona")]
    gridania = [row for row in rows if row["scope"] == "Gridania city seasonal"]
    if any(row["dwev_01_present"] for row in mor_dhona):
        raise ValueError("unexpected dwev_01 lane in a Mor Dhona local weather wrapper")
    if len(gridania) != 6 or not all(row["dwev_01_present"] for row in gridania):
        raise ValueError("Gridania seasonal `_01` lane census drifted")
    if {
        (row["instance_names"], row["instance_gids"], row["unit_member_count"])
        for row in gridania
    } != {("isgrp_000019", "942", 4)}:
        raise ValueError("Gridania seasonal `_01` instance identity drifted")
    if not all(
        bool(row["dwev_01_present"])
        for row in rows
        if row["weather_id"] in (8071, 8076)
    ):
        raise ValueError("restored/custom Starlight `_01` inheritance drifted")
    return rows


def weather_render_state_comparison(
    tower_layout: Layout,
    tower_descriptors: dict[int, str],
    client_root: Path,
    weather_8076_path: Path,
    executable: Path,
) -> tuple[list[dict[str, object]], list[dict[str, object]], list[dict[str, object]], list[dict[str, object]]]:
    sources = (
        ("Tower layout 511", "layout-owned", tower_layout, tower_descriptors),
        (
            "Retail weather 8032",
            "weather-overlay",
            Layout(dat_path(client_root, 0x03E7000E).read_bytes()),
            None,
        ),
        (
            "Custom weather 8076",
            "weather-overlay",
            Layout(weather_8076_path.read_bytes()),
            None,
        ),
    )
    comparison_rows: list[dict[str, object]] = []
    parameter_rows: list[dict[str, object]] = []
    timeline_rows: list[dict[str, object]] = []
    clip_rows: list[dict[str, object]] = []
    for source, layer, layout, provided_descriptors in sources:
        descriptors = provided_descriptors or expanded_layout_descriptors(layout)
        links, _raw, _draw_raw = parse_screen_and_draw_environment(layout, descriptors)
        parameters = parse_screen_environment_parameters(layout, descriptors, executable)
        packages, clips = parse_weather_timelines(source, layout, descriptors)
        parameter_rows.extend({"source": source, **row} for row in parameters)
        timeline_rows.extend(packages)
        clip_rows.extend(clips)
        enabled = sorted(
            str(row["component_name"])
            for row in parameters
            if row["field"] == "enabled" and row["value"] is True
        )
        draw_env_names = sorted(
            layout.node_name(node)
            for node in nodes_of_type(
                layout, descriptors, "DrawEnvObjects/DrawEnv/DrawEnvObject", 0x3C
            )
        )
        material_actors = sorted(
            {
                str(row["controlled_actor"])
                for row in clips
                if "Material" in str(row["clip_class"])
            }
        )
        comparison_rows.append(
            {
                "source": source,
                "layer": layer,
                "screen_environment_roots": len(
                    nodes_of_type(
                        layout, descriptors, "BaseObjects/ScreenEnv/ScreenEnvBaseObject", 0x30
                    )
                ),
                "screen_environment_links": len(links),
                "enabled_screen_components": len(enabled),
                "enabled_component_names": ";".join(enabled),
                "draw_environment_objects": len(draw_env_names),
                "draw_environment_names": ";".join(draw_env_names),
                "timeline_objects": len(packages),
                "compiled_timelines": sum(row["compile_status"] == "compiled-scb" for row in packages),
                "time_dwev_01_present": any(row["timeline"] == "time_dwev_01" for row in packages),
                "render_clip_count": len(clips),
                "material_override_actors": ";".join(material_actors),
                "screen_parameter_overlap_with_8032": "",
                "screen_parameter_value_differences_with_8032": "",
                "extra_screen_parameter_rows_vs_8032": "",
            }
        )
    parameter_maps = {
        source: {
            (str(row["component_name"]), str(row["field"])): row["value"]
            for row in parameter_rows
            if row["source"] == source
        }
        for source in ("Retail weather 8032", "Custom weather 8076")
    }
    retail_parameters = parameter_maps["Retail weather 8032"]
    custom_parameters = parameter_maps["Custom weather 8076"]
    overlap = sorted(set(retail_parameters) & set(custom_parameters))
    differences = [
        key for key in overlap if retail_parameters[key] != custom_parameters[key]
    ]
    custom_row = next(
        row for row in comparison_rows if row["source"] == "Custom weather 8076"
    )
    custom_row["screen_parameter_overlap_with_8032"] = len(overlap)
    custom_row["screen_parameter_value_differences_with_8032"] = len(differences)
    custom_row["extra_screen_parameter_rows_vs_8032"] = len(
        set(custom_parameters) - set(retail_parameters)
    )
    if len(overlap) != 136 or differences or custom_row["extra_screen_parameter_rows_vs_8032"] != 13:
        raise ValueError(
            "8076/8032 ScreenEnv comparison drifted: "
            f"overlap={len(overlap)} differences={differences} "
            f"custom_only={custom_row['extra_screen_parameter_rows_vs_8032']}"
        )
    return comparison_rows, parameter_rows, timeline_rows, clip_rows


def parse_timelines(
    layout: Layout, descriptors: dict[int, str]
) -> tuple[list[dict[str, object]], list[dict[str, object]], list[dict[str, object]]]:
    packages: list[dict[str, object]] = []
    actors_out: list[dict[str, object]] = []
    clips_out: list[dict[str, object]] = []
    for node in nodes_of_type(layout, descriptors, "BaseObjects/TimeLine/TimeLineBaseObject", 0x1C):
        physical, payload = layout.timeline_scb(node)
        package, actors, clips = parse_scb(payload)
        common = {
            "timeline": layout.node_name(node),
            "timeline_node_offset_hex": f"0x{node:04X}",
            "scb_physical_offset_hex": f"0x{physical:04X}",
            "scb_size": len(payload),
        }
        packages.append({**common, **package})
        actors_out.extend({**common, **actor} for actor in actors)
        clips_out.extend({**common, **clip} for clip in clips)
    return packages, actors_out, clips_out


def write_topdown_svg(path: Path, instances: list[dict[str, object]], folders: list[dict[str, object]]) -> None:
    width, height, scale = 720, 1080, 10.0
    origin_x, origin_y = width / 2, 740.0

    def xy(x: float, z: float) -> tuple[float, float]:
        return origin_x + x * scale, origin_y - z * scale

    shapes: list[str] = []
    for folder in folders:
        if not int(folder["primary_instance_count"]):
            continue
        x1, y1 = xy(float(folder["bounds_min_x"]), float(folder["bounds_max_z"]))
        x2, y2 = xy(float(folder["bounds_max_x"]), float(folder["bounds_min_z"]))
        shapes.append(
            f'<rect x="{x1:.1f}" y="{y1:.1f}" width="{x2-x1:.1f}" height="{y2-y1:.1f}" '
            'fill="none" stroke="#41546f" stroke-width="1.5" stroke-dasharray="6 4"/>'
        )
    for row in instances:
        x, y = xy(float(row["position_x"]), float(row["position_z"]))
        ref = str(row["reference_name"])
        ref_type = str(row["reference_type"])
        angle = -math.degrees(float(row["rotation_y"]))
        if "wall" in ref or "walle" in ref:
            shapes.append(f'<rect x="{x-38:.1f}" y="{y-3:.1f}" width="76" height="6" rx="2" fill="#8c99aa" transform="rotate({angle:.2f} {x:.1f} {y:.1f})"/>')
        elif "gate" in ref or "shtr" in ref:
            shapes.append(f'<rect x="{x-38:.1f}" y="{y-5:.1f}" width="76" height="10" fill="#d7a441" transform="rotate({angle:.2f} {x:.1f} {y:.1f})"/>')
        elif "Light" in ref_type:
            shapes.append(f'<circle cx="{x:.1f}" cy="{y:.1f}" r="8" fill="#ffe16a" stroke="#fff3ad" stroke-width="3"/>')
        elif "PositionMarker" in ref_type:
            shapes.append(f'<path d="M {x:.1f} {y-9:.1f} L {x+8:.1f} {y+7:.1f} L {x-8:.1f} {y+7:.1f} Z" fill="#6ef0d0"/>')
        elif "UnitTree" in ref_type:
            shapes.append(f'<circle cx="{x:.1f}" cy="{y:.1f}" r="6" fill="#b668ff" stroke="#e0bdff" stroke-width="2"/>')
    labels = [
        (0.0, 0.0, "Transmission chamber"),
        (0.0, 31.0, "Connector / shutter"),
        (0.0, 51.444, "Retreat room"),
    ]
    for x_value, z_value, label in labels:
        x, y = xy(x_value, z_value)
        shapes.append(f'<text x="{x:.1f}" y="{y:.1f}" text-anchor="middle" fill="#f2f5fb" font-size="16" font-family="Segoe UI, sans-serif">{html.escape(label)}</text>')
    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">
<rect width="100%" height="100%" fill="#111722"/>
<text x="36" y="42" fill="#ffffff" font-size="25" font-family="Segoe UI, sans-serif" font-weight="600">Castrum Novum Transmission Tower — authored layout</text>
<text x="36" y="70" fill="#9eabc0" font-size="15" font-family="Segoe UI, sans-serif">Top-down X/Z reconstruction from 67 DivideMap-owned InstanceObject records</text>
{''.join(shapes)}
<g font-family="Segoe UI, sans-serif" font-size="14" fill="#cbd4e1">
<circle cx="44" cy="1018" r="6" fill="#b668ff"/><text x="58" y="1023">unit-tree / pillar group</text>
<circle cx="260" cy="1018" r="7" fill="#ffe16a"/><text x="274" y="1023">light placement</text>
<path d="M 464 1010 L 472 1026 L 456 1026 Z" fill="#6ef0d0"/><text x="480" y="1023">semantic marker</text>
</g>
</svg>\n'''
    path.write_text(svg, encoding="utf-8")


def read_csv_id(path: Path, row_id: int) -> list[str]:
    with path.open(newline="", encoding="utf-8-sig") as handle:
        for row in csv.reader(handle):
            if row and row[0].strip() == str(row_id):
                return row
    raise KeyError(f"row {row_id} not found in {path}")


def main() -> int:
    parser = argparse.ArgumentParser(description="Build a reproducible Castrum Novum Transmission Tower client decomp bundle.")
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT_ROOT)
    parser.add_argument("--out-dir", type=Path, default=DEFAULT_OUTPUT_DIR)
    parser.add_argument("--weather-8076", type=Path, default=DEFAULT_WEATHER_8076_PATH)
    parser.add_argument(
        "--starlight-source", type=Path, default=DEFAULT_STARLIGHT_SOURCE_PATH
    )
    args = parser.parse_args()
    # Remove the superseded profile whose filename encoded the disproven
    # 24-hour-clock interpretation. The SCB/Fcurve domain is centiseconds.
    (args.out_dir / "weather_clock_timeline_profile.csv").unlink(missing_ok=True)

    region_path = dat_path(args.client_root, REGION_KEY)
    region_data = region_path.read_bytes()
    region_rows = parse_region_rows(region_data)
    lak_rows: list[dict[str, object]] = []
    for index, row in enumerate(region_rows):
        if row["resource_token"] != "lak_l0":
            continue
        child_count = int(str(row["count_type_hex"]), 16) & 0xFFFF
        lak_rows.extend(region_rows[index : index + child_count + 1])
    # RegionResourceData repeats the lak_l0 family under two parent variants. Keep
    # both offsets in the raw chain CSV, but count unique id/token/key identities.
    write_csv(args.out_dir / "region_resource_chain.csv", list(lak_rows[0]), lak_rows)

    dependency_rows: list[dict[str, object]] = []
    string_rows: list[dict[str, object]] = []
    curve_rows: list[dict[str, object]] = []
    curve_channel_records: list[dict[str, object]] = []
    inventory_rows: list[dict[str, object]] = []
    tower_data = b""
    for target in TARGETS:
        path = dat_path(args.client_root, target.dat_key)
        data = path.read_bytes()
        target_dependencies, table_size, authored_count = parse_dependency_rows(args.client_root, target, data)
        target_strings = printable_rows(target, data)
        target_curves = fcurve_entries(target, data)
        dependency_rows.extend(target_dependencies)
        string_rows.extend(target_strings)
        curve_rows.extend(target_curves)
        if target.token == "lak_l0_dun01":
            tower_data = data
            curve_channel_records.extend(fcurve_channel_rows(target, data))
        inventory_rows.append(
            {
                "role": target.role,
                "resource_id": target.resource_id,
                "token": target.token,
                "dat_key_hex": f"0x{target.dat_key:08X}",
                "source": str(path),
                "size": len(data),
                "sha256": sha256(data),
                "identity": cstr(data[:0x18]),
                "version": cstr(data[0x18:0x20]),
                "dependency_table_size": table_size,
                "authored_dependency_rows": authored_count,
                "nonzero_dependency_keys": sum(int(row["dependency_key_hex"], 16) != 0 for row in target_dependencies),
                "printable_strings": len(target_strings),
                "high_signal_strings": sum(bool(row["high_signal"]) for row in target_strings),
                "fcurve_resources": len({row["resource_marker_offset_hex"] for row in target_curves}),
                "fcurve_properties": len(target_curves),
                "note": target.note,
            }
        )

    write_csv(args.out_dir / "resource_inventory.csv", list(inventory_rows[0]), inventory_rows)
    write_csv(args.out_dir / "resource_dependencies.csv", list(dependency_rows[0]), dependency_rows)
    write_csv(args.out_dir / "printable_strings.csv", list(string_rows[0]), string_rows)
    high_signal_rows = [row for row in string_rows if row["high_signal"]]
    write_csv(args.out_dir / "high_signal_strings.csv", list(high_signal_rows[0]), high_signal_rows)
    write_csv(args.out_dir / "lighting_fcurve_inventory.csv", list(curve_rows[0]), curve_rows)
    write_csv(
        args.out_dir / "tower_fcurve_channel_records.csv",
        list(curve_channel_records[0]),
        curve_channel_records,
    )

    tower_layout = Layout(tower_data)
    descriptors = expanded_layout_descriptors(tower_layout)
    typed_node_rows = named_typed_nodes(tower_layout, descriptors)
    type_inventory_rows = layout_type_inventory(tower_layout, descriptors)
    folder_rows, instance_rows, divide_string_rows = parse_divide_map(tower_layout, descriptors)
    unit_member_rows = parse_unit_trees(tower_layout, descriptors)
    light_rows = parse_lights(tower_layout, descriptors)
    screen_link_rows, screen_raw_rows, draw_raw_rows = parse_screen_and_draw_environment(
        tower_layout, descriptors
    )
    screen_parameter_rows = parse_screen_environment_parameters(
        tower_layout, descriptors, args.client_root / "ffxivgame.exe"
    )
    native_volumetric_rows = native_volumetric_light_abi_rows(
        args.client_root / "ffxivgame.exe"
    )
    native_volumetric_clip_rows = native_volumetric_clip_property_rows(
        args.client_root / "ffxivgame.exe"
    )
    native_drawenv_rows = native_draw_environment_abi_rows(
        tower_layout, descriptors, args.client_root / "ffxivgame.exe"
    )
    timeline_rows, timeline_actor_rows, timeline_clip_rows = parse_timelines(
        tower_layout, descriptors
    )
    native_light_rows = native_light_abi_rows(args.client_root / "ffxivgame.exe")
    light_type_rows = light_type_crosscheck_rows(args.client_root, tower_layout, descriptors)
    light_scheduler_rows = light_scheduler_crosscheck_rows(
        args.client_root, tower_layout, descriptors
    )
    (
        weather_render_rows,
        weather_screen_parameter_rows,
        weather_timeline_rows,
        weather_timeline_clip_rows,
    ) = weather_render_state_comparison(
        tower_layout,
        descriptors,
        args.client_root,
        args.weather_8076,
        args.client_root / "ffxivgame.exe",
    )
    weather_controller_rows = weather_drawenv_controller_abi_rows(
        args.client_root / "ffxivgame.exe"
    )
    native_material2_rows = native_material2_clip_abi_rows(
        args.client_root / "ffxivgame.exe"
    )
    weather_special_lane_rows = weather_special_lane_census_rows(
        args.client_root, args.starlight_source, args.weather_8076
    )
    weather_tower_lane_rows = weather_tower_lane_comparison_rows(
        args.client_root, args.weather_8076
    )
    (
        weather_derivation_rows,
        weather_fcurve_change_rows,
        weather_transition_profile_rows,
        weather_drawenv_unit_rows,
    ) = weather_8076_derivation_rows(args.starlight_source, args.weather_8076)
    tower_timeline_names = [str(row["timeline"]) for row in timeline_rows]
    tower_light_timeline_rows = [
        row
        for row in timeline_rows
        if any(token in str(row).lower() for token in ("lght", "light", "ilght"))
    ]
    if [int(row["primary_instance_count"]) for row in folder_rows] != [0, 19, 16, 32]:
        raise ValueError("Tower DivideMap folder counts drifted")
    expected_counts = {
        "instances": (len(instance_rows), 67),
        "unit-tree members": (len(unit_member_rows), 12),
        "lights": (len(light_rows), 5),
        "screen-environment links": (len(screen_link_rows), 5),
        "screen-environment getter-backed parameters": (len(screen_parameter_rows), 45),
        "timelines": (len(timeline_rows), 2),
        "timeline actors": (len(timeline_actor_rows), 4),
        "timeline clips": (len(timeline_clip_rows), 4),
    }
    drifted = {name: values for name, values in expected_counts.items() if values[0] != values[1]}
    if drifted:
        raise ValueError(f"Tower object graph counts drifted: {drifted}")
    if set(tower_timeline_names) != {"time_bg_gate_open", "time_bg_gate_close"}:
        raise ValueError(f"Tower timeline inventory drifted: {tower_timeline_names}")
    if tower_light_timeline_rows:
        raise ValueError(f"unexpected Tower light-control timeline: {tower_light_timeline_rows}")
    if {int(row["light_type"]) for row in light_rows} != {1}:
        raise ValueError("Tower authored point-light types drifted")
    screen_enabled_rows = [row for row in screen_parameter_rows if row["field"] == "enabled"]
    if len(screen_enabled_rows) != 5 or any(row["value"] for row in screen_enabled_rows):
        raise ValueError(f"Tower screen-environment enabled bits drifted: {screen_enabled_rows}")
    write_csv(args.out_dir / "layout_type_inventory.csv", list(type_inventory_rows[0]), type_inventory_rows)
    write_csv(args.out_dir / "layout_named_nodes.csv", list(typed_node_rows[0]), typed_node_rows)
    write_csv(args.out_dir / "divide_map_folders.csv", list(folder_rows[0]), folder_rows)
    write_csv(args.out_dir / "layout_instances.csv", list(instance_rows[0]), instance_rows)
    write_csv(args.out_dir / "divide_map_strings.csv", list(divide_string_rows[0]), divide_string_rows)
    write_csv(args.out_dir / "unit_tree_members.csv", list(unit_member_rows[0]), unit_member_rows)
    write_csv(args.out_dir / "light_parameters.csv", list(light_rows[0]), light_rows)
    write_csv(args.out_dir / "native_light_abi.csv", list(native_light_rows[0]), native_light_rows)
    write_csv(args.out_dir / "light_type_crosscheck.csv", list(light_type_rows[0]), light_type_rows)
    write_csv(
        args.out_dir / "light_scheduler_crosscheck.csv",
        list(light_scheduler_rows[0]),
        light_scheduler_rows,
    )
    write_csv(args.out_dir / "screen_environment_links.csv", list(screen_link_rows[0]), screen_link_rows)
    write_csv(
        args.out_dir / "screen_environment_parameters.csv",
        list(screen_parameter_rows[0]),
        screen_parameter_rows,
    )
    write_csv(
        args.out_dir / "native_volumetric_light_abi.csv",
        list(native_volumetric_rows[0]),
        native_volumetric_rows,
    )
    write_csv(
        args.out_dir / "native_volumetric_clip_properties.csv",
        list(native_volumetric_clip_rows[0]),
        native_volumetric_clip_rows,
    )
    write_csv(args.out_dir / "screen_environment_raw_fields.csv", list(screen_raw_rows[0]), screen_raw_rows)
    write_csv(args.out_dir / "draw_environment_raw_fields.csv", list(draw_raw_rows[0]), draw_raw_rows)
    write_csv(
        args.out_dir / "native_draw_environment_abi.csv",
        list(native_drawenv_rows[0]),
        native_drawenv_rows,
    )
    write_csv(args.out_dir / "timeline_packages.csv", list(timeline_rows[0]), timeline_rows)
    write_csv(args.out_dir / "timeline_controlled_actors.csv", list(timeline_actor_rows[0]), timeline_actor_rows)
    write_csv(args.out_dir / "timeline_clip_entries.csv", list(timeline_clip_rows[0]), timeline_clip_rows)
    write_csv(
        args.out_dir / "weather_render_state_comparison.csv",
        list(weather_render_rows[0]),
        weather_render_rows,
    )
    write_csv(
        args.out_dir / "weather_screen_environment_parameters.csv",
        list(weather_screen_parameter_rows[0]),
        weather_screen_parameter_rows,
    )
    write_csv(
        args.out_dir / "weather_timeline_packages.csv",
        list(weather_timeline_rows[0]),
        weather_timeline_rows,
    )
    write_csv(
        args.out_dir / "weather_timeline_render_bindings.csv",
        list(weather_timeline_clip_rows[0]),
        weather_timeline_clip_rows,
    )
    write_csv(
        args.out_dir / "weather_drawenv_controller_abi.csv",
        list(weather_controller_rows[0]),
        weather_controller_rows,
    )
    write_csv(
        args.out_dir / "native_material2_clip_abi.csv",
        list(native_material2_rows[0]),
        native_material2_rows,
    )
    write_csv(
        args.out_dir / "weather_special_lane_census.csv",
        list(weather_special_lane_rows[0]),
        weather_special_lane_rows,
    )
    write_csv(
        args.out_dir / "weather_tower_lane_comparison.csv",
        list(weather_tower_lane_rows[0]),
        weather_tower_lane_rows,
    )
    write_csv(
        args.out_dir / "weather_8076_derivation_summary.csv",
        list(weather_derivation_rows[0]),
        weather_derivation_rows,
    )
    write_csv(
        args.out_dir / "weather_8076_fcurve_changes.csv",
        list(weather_fcurve_change_rows[0])
        if weather_fcurve_change_rows
        else [
            "timeline",
            "timeline_resource_index",
            "property",
            "channel_index",
            "interpolation",
            "key_index",
            "record_offset_hex",
            "curve_time",
            "timeline_seconds",
            "source_value",
            "custom_value",
            "source_tangent_in",
            "custom_tangent_in",
            "source_tangent_out",
            "custom_tangent_out",
            "source_raw_words_hex",
            "custom_raw_words_hex",
        ],
        weather_fcurve_change_rows,
    )
    write_csv(
        args.out_dir / "weather_transition_timeline_profile.csv",
        list(weather_transition_profile_rows[0]),
        weather_transition_profile_rows,
    )
    write_csv(
        args.out_dir / "weather_drawenv_unit_tree_members.csv",
        list(weather_drawenv_unit_rows[0]),
        weather_drawenv_unit_rows,
    )
    write_topdown_svg(args.out_dir / "tower_layout_topdown.svg", instance_rows, folder_rows)

    shutter_instance = next(row for row in instance_rows if row["instance_name"] == "isgrp_000012")
    if int(shutter_instance["node_gid"]) != 935 or shutter_instance["reference_name"] != "sgrp_shutter":
        raise ValueError(f"Tower shutter identity drifted: {shutter_instance}")

    zone_rows = []
    for zone_id in (251, 264):
        zone_param = read_csv_id(Path("docs/Dat Mining/_zoneParam.csv"), zone_id)[1]
        zone_rows.append(
            {
                "zone_id": zone_id,
                "zone_param": int(zone_param),
                "layout_id": 511,
                "region_parent": "lak_l0",
                "region_child": "lak_l0_dun01",
                "layout_dat_key_hex": "0x03E7000B",
                "content_id": 13,
                "content_name": "Castrum Novum Transmission Tower",
            }
        )
    write_csv(args.out_dir / "zone_content_identity.csv", list(zone_rows[0]), zone_rows)

    live_probe_path = args.out_dir / "live_weather_drawenv_probe.json"
    live_probe = (
        json.loads(live_probe_path.read_text(encoding="utf-8"))
        if live_probe_path.exists()
        else None
    )
    if live_probe is not None:
        if live_probe["image_sha256"] != sha256(
            (args.client_root / "ffxivgame.exe").read_bytes()
        ):
            raise ValueError("live WeatherManager probe executable hash drifted")
        if live_probe["registered_drawenv_name"] != "dwev_00":
            raise ValueError("observed Tower DrawEnv lane drifted")

    live_layout_probe_path = args.out_dir / "live_layout_drawenv_probe.json"
    live_layout_probe = (
        json.loads(live_layout_probe_path.read_text(encoding="utf-8"))
        if live_layout_probe_path.exists()
        else None
    )
    if live_layout_probe is not None:
        if live_layout_probe["image_sha256"] != sha256(
            (args.client_root / "ffxivgame.exe").read_bytes()
        ):
            raise ValueError("live layout DrawEnv probe executable hash drifted")
        if live_layout_probe["registered_drawenv_name"] != "dwev_20":
            raise ValueError("observed Tower layout DrawEnv identity drifted")

    runtime_capture_path = args.out_dir / "runtime_capture_analysis.json"
    runtime_capture = (
        json.loads(runtime_capture_path.read_text(encoding="utf-8"))
        if runtime_capture_path.exists()
        else None
    )
    if runtime_capture is not None:
        if runtime_capture["post_to_pre_saturation_ratio"] >= 0.5:
            raise ValueError("runtime capture no longer proves the Tower chroma collapse")
        if runtime_capture["distance_from_decompiled_2_4_second_drawenv_duration"] > 0.5:
            raise ValueError("runtime capture handoff drifted from the DrawEnv duration")

    evidence_rows = [
        {"claim": "Content identity", "finding": "raidDungeon 13 is Castrum Novum Transmission Tower", "confidence": "direct", "source": "docs/Dat Mining/xtx_raidDungeon.csv"},
        {"claim": "Zone identity", "finding": "zones 251 and 264 both select zoneParam 5014", "confidence": "direct", "source": "docs/Dat Mining/_zoneParam.csv"},
        {"claim": "Layout identity", "finding": "layout 511 is type 2 and selects zoneParam 5014", "confidence": "direct", "source": "docs/Dat Mining/_layout.csv"},
        {"claim": "Dungeon package", "finding": "RegionResourceData binds layout 511 to lak_l0_dun01 / 0x03E7000B", "confidence": "direct", "source": str(region_path)},
        {"claim": "Live dungeon-layout selection", "finding": "a hash-guarded read-only client probe inside the test instance reports active spatial DrawEnv name dwev_20; field layout 501 contains only dwev_00/dwev_10, while dungeon layout 511 uniquely contains dwev_20", "confidence": "live-native-direct/cross-resource", "source": "live_layout_drawenv_probe.json + high_signal_strings.csv + tools/probe_ffxiv_weather_drawenv.py"},
        {"claim": "Captured render-state handoff", "finding": "10 Hz signal analysis of the supplied 4.35-second runtime capture finds the largest non-startup luma discontinuity at 2.0 seconds and a post/pre saturation ratio of 0.386; the handoff is 0.4 seconds from the decompiled 2.4-second DrawEnv package duration, while the contact sheet shows UI colors remain", "confidence": "direct-runtime/quantified", "source": "runtime_capture_analysis.json + runtime_capture_signalstats.csv + runtime_capture_contact_sheet.png"},
        {"claim": "Interior lighting", "finding": "dungeon package authors five named lights, repeated interior light groups, glare, shadow, color correction, volumetric light and blur", "confidence": "direct", "source": "high_signal_strings.csv"},
        {"claim": "Complete placement graph", "finding": "four DivideMap folders own 67 unique InstanceObject placements: 19 in the transmission chamber, 16 in the connector, 32 in the retreat room, and none in resident", "confidence": "direct-structure", "source": "divide_map_folders.csv + layout_instances.csv"},
        {"claim": "Room geometry", "finding": "the authored graph contains a nine-position pillar/light ring, circular wall shells, two shutter placements, four placed light instances, and two semantic position markers", "confidence": "direct-structure", "source": "layout_instances.csv + unit_tree_members.csv"},
        {"claim": "Native light ABI", "finding": "the installed client labels serialized 0x30 as float DecayRate and 0x44 as byte LightType; named directional/point/ambient comparison objects encode LightType 0/1/3, and all five Tower lights encode 1 (point)", "confidence": "native/direct-structure", "source": "native_light_abi.csv + light_type_crosscheck.csv"},
        {"claim": "Light parameters", "finding": "five point lights preserve exact normalized RGB, intensity, zero decay, cone/penumbra and duplicate radius-candidate values; only 0x3C/0x48 radius semantics, 0x40, and the tail remain conservatively named", "confidence": "native/direct-structure", "source": "light_parameters.csv + native_light_abi.csv"},
        {"claim": "Visual light placement match", "finding": "the supplied capture's pre-handoff frames show a cyan/blue central floor pool and a red perimeter/pillar treatment, directly matching colocated main-chamber lght_0001 #A8FDF0 plus intensity-3 lght_0003 #389AFC and the nine-pillar instances of lght_0002 #FC1603", "confidence": "direct-runtime/direct-structure", "source": "runtime_capture_contact_sheet.png + light_parameters.csv + layout_instances.csv + unit_tree_members.csv"},
        {"claim": "Light scheduler boundary", "finding": "layout 511 has no LayRapturePointLightClip and its complete timeline inventory is only time_bg_gate_open and time_bg_gate_close; comparison dungeon layout 311 has explicit time_pointlight_b/c tracks controlling PointLight_B_00/C_00", "confidence": "direct-comparative-negative", "source": "light_scheduler_crosscheck.csv + timeline_packages.csv + timeline_clip_entries.csv"},
        {"claim": "Screen environment", "finding": "scev_0001 links exactly one glare, shadow, color-correction, volumetric-light and blur object; the native getters show all five enabled bits are false while preserving their authored parameter banks", "confidence": "native/direct-structure", "source": "screen_environment_links.csv + screen_environment_parameters.csv + screen_environment_raw_fields.csv"},
        {"claim": "Volumetric-light ABI", "finding": "the native interface exposes the enabled bit plus three float3 vectors, ten float scalars and two uint32 modes from the serialized Tower component; exact getter addresses and values are exported without speculative retail labels", "confidence": "native/direct-structure", "source": "native_volumetric_light_abi.csv + screen_environment_parameters.csv"},
        {"claim": "Volumetric clip boundary", "finding": "the native Cut VolumetricLightClip property table names SunPosition, SunArea, SunColor and VolumetricLight, but no Tower or compared weather FCurve binds such a clip", "confidence": "native/direct-negative", "source": "native_volumetric_clip_properties.csv + weather_timeline_render_bindings.csv"},
        {"claim": "Draw-environment ABI", "finding": "both Tower draw-environment objects set feature-mask bit 2, return a true conditional flag, scalar 500.0 and mode 0 through the final native ILayoutDrawEnvObject getters; field purpose remains conservatively unlabeled", "confidence": "native/direct-structure", "source": "native_draw_environment_abi.csv + draw_environment_raw_fields.csv"},
        {"claim": "Gimmick timeline", "finding": "dungeon package includes gate_open/gate_close scheduler resources and time_bg_gate_open/time_bg_gate_close", "confidence": "direct", "source": "high_signal_strings.csv"},
        {"claim": "Shutter map-object binding", "finding": "layout 511 instance isgrp_000012 maps to packet instance ID 12; serialized node GID 935 is not the map-object instance ID", "confidence": "direct-structure", "source": "layout_instances.csv + established layout-instance suffix join"},
        {"claim": "Shutter timing", "finding": "time_bg_gate_open has a 1.00-second active block and starts transform at 0.00s plus sound at 0.01s; close has a 0.25-second active block with sound and transform at 0.00s", "confidence": "direct-structure", "source": "timeline_packages.csv + timeline_clip_entries.csv"},
        {"claim": "Enemy path", "finding": "the layout declares the EnemyPath class descriptor but serializes zero EnemyPath nodes in this Tower payload", "confidence": "direct-negative", "source": "layout_type_inventory.csv"},
        {"claim": "Weather candidate", "finding": "8032/wtr_xmas is a native lak_l0 child and uniquely adds the vfx_tunder1 group marker plus six thunder asset dependency rows over 8030", "confidence": "direct-resource", "source": "region_resource_chain.csv + resource_dependencies.csv"},
        {"claim": "Weather lighting", "finding": "8030 and 8032 have exactly matching FCurve property structures and float-value hashes; 8032 is the 8030 Dalamud lighting grade plus thunder assets", "confidence": "direct-resource", "source": "lighting_fcurve_inventory.csv"},
        {"claim": "8076 Starlight provenance", "finding": "the installed 8076 payload inherits its entire render graph and all 2,565 FCurve records byte-for-byte from restored Starlight; its only changes are 119 bytes across the five zeroed snowfall dependency entries 25-29", "confidence": "direct-byte-comparison", "source": "weather_8076_derivation_summary.csv + weather_8076_fcurve_changes.csv"},
        {"claim": "Inherited Starlight render lane", "finding": "restored Starlight and therefore 8076 contain a compiled time_dwev_01 package binding directional light, ambient light, fog, environment map, sun/moon and enabled glare_01/shadow_01; retail Tower candidate 8032 has no time_dwev_01", "confidence": "native/direct-structure", "source": "weather_render_state_comparison.csv + weather_timeline_packages.csv + weather_timeline_render_bindings.csv + weather_drawenv_unit_tree_members.csv"},
        {"claim": "Standardized city event lane", "finding": "all six installed Gridania seasonal/event wrappers 8027-8032 instantiate sgrp_dwev_01 as isgrp_000019/GID 942 with four members, while all nine inspected Mor Dhona local wrappers—including local 8030-8032—omit it; 8076 imports this city lane by deriving from Gridania Starlight", "confidence": "direct-comparative", "source": "weather_special_lane_census.csv"},
        {"claim": "Observed active Tower lane", "finding": "a hash-guarded read-only WeatherManager probe during the Tower test reports registered name dwev_00, completed transition fraction 1.0, transition mode 0, and one queued DrawEnv entry; inherited dwev_01 is not active at the observed position", "confidence": "live-native-direct", "source": "live_weather_drawenv_probe.json + tools/probe_ffxiv_weather_drawenv.py"},
        {"claim": "Active 8076 overlay difference", "finding": "8076 time_dwev_00 is a 2.4-second 11-clip package; versus clear 8001's otherwise matching nine actor roles, it adds Material2 overrides diffuseColor_00.Attr=0 and lightMapOcclusi.Attr=1", "confidence": "live-selected/direct-structure", "source": "weather_tower_lane_comparison.csv + weather_timeline_render_bindings.csv"},
        {"claim": "Material override semantics", "finding": "native RaptureMaterial2Clip code proves Attr is RGBA: it appends R/G/B/A to the controlled actor name and broadcasts each sampled value to every material entry; active 8076 therefore applies diffuseColor_00=(0,0,0,0) and lightMapOcclusi=(1,1,1,1)", "confidence": "native/live-selected/direct-structure", "source": "native_material2_clip_abi.csv + weather_tower_lane_comparison.csv"},
        {"claim": "Weather transition duration", "finding": "the active time_dwev_00 and inherited time_dwev_01 packages use the same centisecond FCurve encoding as the Tower shutter and span raw time 0-240, exactly matching their compiled 2.4-second active durations; these are not 24-hour clock lanes", "confidence": "direct-structure/comparative", "source": "weather_transition_timeline_profile.csv + weather_tower_lane_comparison.csv + tower_fcurve_channel_records.csv"},
        {"claim": "Weather controller handoff", "finding": "WeatherManager computes normalized 0..1 transition progress, blends the oldest/newest queued DrawEnv renderer states, and removes the old entry at 1.0; spatial code supplies the current full object name while registration classifies only dwev_0/dwev_1/dwev_2 families", "confidence": "native-direct", "source": "weather_drawenv_controller_abi.csv"},
        {"claim": "Duty-to-weather assignment", "finding": "no static content-13 to weather-8032 binding survives in the recovered client Lua; original server/event state supplied weather", "confidence": "negative/direct", "source": "Data/scripts/directors/InstanceRaid/InstanceRaidBeaconBattle.lua"},
        {"claim": "Recommended reconstruction", "finding": "suppress the Tower instance's initial SetWeather bootstrap and preserve layout 511's own dwev_20/dwev_00 render state; live tests show the light bank during raw layout initialization and lose it when the normal weather DrawEnv blend settles", "confidence": "runtime-observed/native-corroborated", "source": "attached runtime capture + live DrawEnv probes + WeatherManager native decomp"},
    ]
    write_csv(args.out_dir / "evidence_matrix.csv", list(evidence_rows[0]), evidence_rows)

    tower_strings = [row for row in high_signal_rows if row["target_token"] == "lak_l0_dun01"]
    tower_values = [str(row["value"]) for row in tower_strings]
    thunder_dependencies = [row for row in dependency_rows if row["target_token"] == "wtr_xmas" and any(term in str(row["name"]).lower() for term in ("tunder", "thdr"))]
    curve_comparison_fields = (
        "resource_index",
        "resource_size",
        "property_index",
        "property",
        "property_type_hex",
        "channel_count",
        "animated_channels",
        "keyframes",
        "sample_count",
        "minimum",
        "maximum",
        "values_sha256",
        "parse_status",
    )
    curve_signatures = {
        target_id: [
            tuple(row[field] for field in curve_comparison_fields)
            for row in curve_rows
            if row["target_id"] == target_id
        ]
        for target_id in (8030, 8032)
    }
    summary = {
        "generated_by": "tools/build_castrum_novum_transmission_tower_decomp.py",
        "client_root": str(args.client_root),
        "region_resource_sha256": sha256(region_data),
        "content_id": 13,
        "zones": [251, 264],
        "zone_param": 5014,
        "layout_id": 511,
        "layout_token": "lak_l0_dun01",
        "layout_dat_key": "0x03E7000B",
        "shutter_map_object": {
            "layout_id": 511,
            "instance_name": shutter_instance["instance_name"],
            "packet_instance_id": int(str(shutter_instance["instance_name"]).removeprefix("isgrp_")),
            "serialized_node_gid": int(shutter_instance["node_gid"]),
            "unit_tree": shutter_instance["reference_name"],
            "scheduler_aliases": ["open", "clos"],
        },
        "weather_candidate": {"id": 8032, "token": "wtr_xmas", "display": "Dalamud Thunder", "dat_key": "0x03E7000E"},
        "runtime_weather": {"id": None, "token": "layout_owned", "status": "Tower zone-in SetWeather bootstrap suppressed; explicit GM weather remains diagnostic"},
        "live_layout_drawenv": (
            live_layout_probe["registered_drawenv_name"]
            if live_layout_probe is not None
            else None
        ),
        "runtime_capture": runtime_capture,
        "weather_assignment_status": "8032 is a recovered special payload, but continuous duty assignment is rejected by runtime capture",
        "weather_8030_8032_fcurve_values_exact_match": curve_signatures[8030] == curve_signatures[8032],
        "tower_high_signal_string_count": len(tower_values),
        "thunder_dependency_rows": len(thunder_dependencies),
        "layout_declared_node_count": tower_layout.node_count,
        "layout_descriptor_count": len(descriptors),
        "divide_map_folder_count": len(folder_rows),
        "placed_instance_count": len(instance_rows),
        "unit_tree_member_count": len(unit_member_rows),
        "authored_light_count": len(light_rows),
        "authored_light_type_values": sorted({int(row["light_type"]) for row in light_rows}),
        "authored_light_type_names": sorted({str(row["light_type_name"]) for row in light_rows}),
        "authored_light_decay_rates": sorted({float(row["decay_rate"]) for row in light_rows}),
        "placed_light_instance_count": sum("Light" in str(row["reference_type"]) for row in instance_rows),
        "position_marker_instance_count": sum("PositionMarker" in str(row["reference_type"]) for row in instance_rows),
        "timeline_count": len(timeline_rows),
        "timeline_names": tower_timeline_names,
        "light_control_timeline_count": len(tower_light_timeline_rows),
        "timeline_clip_count": len(timeline_clip_rows),
        "screen_environment_component_count": len(screen_link_rows),
        "screen_environment_getter_backed_parameter_count": len(screen_parameter_rows),
        "screen_environment_enabled_states": {
            str(row["component_name"]): bool(row["value"]) for row in screen_enabled_rows
        },
        "weather_8076": {
            "path": str(args.weather_8076),
            "sha256": sha256(args.weather_8076.read_bytes()),
            "starlight_source_path": str(args.starlight_source),
            "starlight_source_sha256": sha256(args.starlight_source.read_bytes()),
            "changed_bytes_from_starlight": int(
                weather_derivation_rows[0]["changed_byte_count"]
            ),
            "changed_fcurve_records_from_starlight": int(
                weather_derivation_rows[0]["changed_fcurve_record_count"]
            ),
            "zeroed_dependency_entry_indices": [25, 26, 27, 28, 29],
            "time_dwev_01_inherited_from_starlight": True,
            "time_dwev_01_active_duration_seconds": 2.4,
            "time_dwev_01_time_encoding": "serialized centiseconds",
            "standardized_gridania_event_lane_inherited": True,
            "mor_dhona_local_wrappers_with_dwev_01": sum(
                bool(row["dwev_01_present"])
                for row in weather_special_lane_rows
                if str(row["scope"]).startswith("Mor Dhona")
            ),
            "gridania_city_event_wrappers_with_dwev_01": sum(
                bool(row["dwev_01_present"])
                for row in weather_special_lane_rows
                if row["scope"] == "Gridania city seasonal"
            ),
            "observed_active_tower_lane": (
                live_probe["registered_drawenv_name"] if live_probe is not None else None
            ),
            "observed_transition_fraction": (
                live_probe["transition_fraction_field_0x8c"]
                if live_probe is not None
                else None
            ),
            "observed_queued_drawenv_entry_count": (
                live_probe["queued_drawenv_entry_count"] if live_probe is not None else None
            ),
            "active_lane_extra_actors_vs_clear": [
                "diffuseColor_00",
                "lightMapOcclusi",
            ],
            "active_lane_material_constants": {
                "diffuseColor_00.Attr": 0.0,
                "lightMapOcclusi.Attr": 1.0,
            },
            "active_lane_material2_rgba_application_proven": True,
            "time_dwev_01_present": next(
                bool(row["time_dwev_01_present"])
                for row in weather_render_rows
                if row["source"] == "Custom weather 8076"
            ),
            "enabled_screen_components": next(
                int(row["enabled_screen_components"])
                for row in weather_render_rows
                if row["source"] == "Custom weather 8076"
            ),
        },
        "fcurve_property_counts": dict(sorted(Counter(row["property"] for row in curve_rows if row["target_id"] in (8030, 8031, 8032)).items())),
    }
    (args.out_dir / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")

    readme = """# Castrum Novum Transmission Tower decomp

Generated from the installed FFXIV 1.23b client by:

```powershell
python tools/build_castrum_novum_transmission_tower_decomp.py
```

The bundle separates direct binary/table evidence from reconstruction:

- `zone_content_identity.csv`: content/zone/zoneParam/layout chain.
- `region_resource_chain.csv`: every `lak_l0` region child and weather row.
- `resource_inventory.csv`: hashes and structural counts for field, duty, and event-weather DATs.
- `resource_dependencies.csv`: decoded MapLayoutResourceData dependency rows.
- `high_signal_strings.csv`: tower gimmick, lighting, draw-environment, scheduler, and weather strings with byte offsets.
- `printable_strings.csv`: complete printable-string dump for the five target DATs.
- `lighting_fcurve_inventory.csv`: every embedded FCurve property, type, channel count, animation count, and value range.
- `tower_fcurve_channel_records.csv`: every Tower FCurve constant/key record, including raw words and tangents.
- `layout_type_inventory.csv` and `layout_named_nodes.csv`: the complete serialized class/node inventory.
- `divide_map_folders.csv` and `layout_instances.csv`: all 67 owned placements, transforms, and references.
- `unit_tree_members.csv`: all 12 nested room, pillar/light-ring, and shutter members.
- `light_parameters.csv`: exact point-light colors, intensities, decay, angles, and preserved ambiguous tail fields.
- `native_light_abi.csv` and `light_type_crosscheck.csv`: client getter/property labels and cross-layout proof that Tower LightType 1 means point light.
- `light_scheduler_crosscheck.csv`: Tower's zero point-light clips beside a dungeon that authors explicit point-light tracks.
- `screen_environment_links.csv`, `screen_environment_parameters.csv`, and `screen_environment_raw_fields.csv`: post-processing graph, getter-backed values/enabled bits, and lossless serialized words.
- `native_volumetric_light_abi.csv`: exact getter/storage map for the complete volumetric-light block; unlabeled fields remain conservatively numbered.
- `native_volumetric_clip_properties.csv`: native Cut clip names (`SunPosition`, `SunArea`, `SunColor`, `VolumetricLight`) and the explicit no-binding boundary.
- `draw_environment_raw_fields.csv` and `native_draw_environment_abi.csv`: lossless words plus the final feature/flag/scalar/mode getters; unresolved retail names remain conservative.
- `timeline_packages.csv`, `timeline_controlled_actors.csv`, and `timeline_clip_entries.csv`: decoded shutter scheduler packages and clip timing.
- `weather_render_state_comparison.csv` and `weather_screen_environment_parameters.csv`: Tower-owned state beside retail 8032 and custom 8076.
- `weather_timeline_packages.csv` and `weather_timeline_render_bindings.csv`: every weather draw-environment timeline and controlled render actor.
- `weather_drawenv_controller_abi.csv`: native WeatherManager evidence for automatic `dwev_0`/`dwev_1`/`dwev_2` lane registration and interpolation.
- `weather_special_lane_census.csv`: nine Mor Dhona wrappers beside six Gridania seasonal/event wrappers, proving that `_01` is standardized city-event state imported by 8076 rather than a native Tower lane.
- `weather_tower_lane_comparison.csv`: clear 8001, retail 8032, and custom 8076 compared lane-by-lane; the live-selected `_00` lane exposes 8076's two extra material overrides.
- `native_material2_clip_abi.csv`: RTTI/vtables and native proof that Material2 `Attr` channels are broadcast as named R/G/B/A material parameters.
- `live_weather_drawenv_probe.json`: hash-guarded read-only capture of the active WeatherManager name and transition/queue state; regenerate with `tools/probe_ffxiv_weather_drawenv.py`.
- `live_layout_drawenv_probe.json`: separate live capture proving the Tower client selected dungeon-only `dwev_20`, not field layout 501.
- `runtime_capture_analysis.json`, `runtime_capture_signalstats.csv`, and `runtime_capture_contact_sheet.png`: reproducible 10 Hz measurement and visual sequence of the colored Tower state collapsing at the DrawEnv handoff.
- `tools/verify_transmission_tower_live_test.py`: post-deployment verifier for the layout-owned entry contract, weather-bootstrap omission, completed region-105/zone-251 handoff, and an optional read-only post-entry `dwev_20` client-probe gate.
- `weather_8076_derivation_summary.csv` and `weather_8076_fcurve_changes.csv`: byte-for-byte restored-Starlight provenance; the latter intentionally contains only its header because this installed 8076 changes no FCurve record.
- `weather_transition_timeline_profile.csv`: all 975 property/channel profiles across the ten compiled `time_dwev_*` lanes; serialized curve time is centiseconds, so raw 0-240 is a 2.4-second transition.
- `weather_drawenv_unit_tree_members.csv`: all 48 members of the eleven Starlight draw-environment UnitTrees inherited unchanged by 8076.
- `tower_layout_topdown.svg`: top-down reconstruction generated directly from the placement records.
- `evidence_matrix.csv`: direct findings, negative findings, and the inferred reconstruction boundary.
- `summary.json`: machine-readable result.

Important boundary: `8032` is directly proven to be a native `lak_l0` Dalamud
Thunder payload with thunder VFX. The original recovered client Lua does not
contain a static content-13 -> weather-8032 assignment, and runtime capture
rejects forcing it continuously because it settles into opaque gray fog. Its
original use was transient or depended on unrecovered server/event-side state.

The runnable reconstruction lives in:

- `Map Server/CastrumNovum/TransmissionTowerManager.cs`
- `Data/scripts/content/TransmissionTower.lua`
- `Data/scripts/commands/gm/testtower.lua`

It deliberately publishes only layout 511's shutter controller (instance 12,
from `isgrp_000012`; serialized node GID 935 is a different identifier).
Geometry, lights, draw environments, and screen effects remain client-owned.
Runtime capture showed forced 8032 settling into opaque gray fog, while 8076
removed the fog but visually suppressed the Tower light bank. Byte comparison
now proves that 8076 did not author or retint that lighting behavior: it inherits
the complete restored-Starlight graph and all 2,565 FCurve records unchanged,
zeroing only five snowfall dependency entries (119 changed bytes). Starlight's
`time_dwev_01` lane binds fog, ambient/directional light, sun/moon, environment
map, glare and shadow, but a read-only live WeatherManager probe during the
Tower test resolves the selected name to `dwev_00`, not `_01`. The active 8076
`time_dwev_00` package has eleven clips and adds two Material2 actors absent
from clear 8001's corresponding lane: `diffuseColor_00` with `Attr=0` and
`lightMapOcclusi` with `Attr=1`. Native `RaptureMaterial2Clip` code proves that
`Attr` is RGBA: it appends `R`, `G`, `B`, and `A` to the actor name and
broadcasts the four sampled values across the active material container. Thus
the selected lane applies diffuse color `(0,0,0,0)` and light-map occlusion
`(1,1,1,1)`. Its raw FCurve span of 0-240 uses the same
centisecond encoding as the Tower shutter and exactly matches the compiled
2.4-second package duration. WeatherManager blends the oldest and newest queued DrawEnv
renderer states with normalized transition progress, removes the old entry at
1.0, and spatially registers the active draw-environment name. All nine
inspected Mor Dhona wrappers omit `_01`; all six Gridania seasonal/event
wrappers instantiate it identically. Thus 8076 imports a standardized Gridania
event graph into the Tower region, but `_01` is inactive at the observed Tower
position. Layout 511 has no
light-control timeline: all five authored lights are LightType 1 point lights,
and its only two timelines are the shutter open/close pair. The runnable shell sends
no content override and suppresses the Tower's normal zone-in SetWeather so
layout 511 keeps its initial authored render state.
Validate that boundary with
`python tools/validate_castrum_novum_transmission_tower_rebuild.py`.
"""
    (args.out_dir / "README.md").write_text(readme, encoding="utf-8")
    print(f"out={args.out_dir} targets={len(TARGETS)} dependencies={len(dependency_rows)} fcurves={len(curve_rows)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
