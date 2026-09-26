#!/usr/bin/env python3
"""Typed SCB actor/block/clip decoder for the requested job and GC scenes.

Use each SCB's class registry. A 0x40-byte record is not necessarily SetPosClip,
and its class index is not constant between scenes. Offsets are in the outer
installed scene file; raw payload is retained for uninterpreted clip fields.
"""
from __future__ import annotations

import re
import struct

from build_garuda_tornado_decomp import walk_pwib_resources, scb_resource_table


def parse_type_tables(payload):
    """Decode the String/CATT/CCPT mapping consumed by native A271B0/A27210.

    Each descriptor stores a uint16 string index plus a raw low-byte descriptor.
    Actor/clip kinds index that scene's descriptor array, not global enums.
    """
    strings = [m.start() for m in re.finditer(re.escape(b"@CRES"), payload)
               if payload[m.start() + 16:m.start() + 32].split(b"\0", 1)[0] == b"String"]
    if len(strings) != 1:
        raise ValueError("Ambiguous SCB String pool")
    marker = strings[0]
    pool = marker + 32
    first = struct.unpack_from("<h", payload, pool)[0]
    if first <= 0 or first % 2:
        raise ValueError("Invalid String offset table")
    pool_end = marker + struct.unpack_from("<H", payload, marker + 6)[0] * 16
    names = []
    for i in range(first // 2):
        offset = struct.unpack_from("<h", payload, pool + 2 * i)[0]
        # The uint16 offset array is padded to four bytes when its real count
        # is odd. No descriptor is allowed to reference that zero padding.
        if offset == 0 and i == first // 2 - 1:
            break
        start = pool + offset
        end = payload.find(b"\0", start, pool_end)
        if not pool + first <= start < end < pool_end:
            raise ValueError("Invalid SCB String offset")
        names.append(payload[start:end].decode("ascii"))
    tables = []
    for tag in (b"@CATT", b"@CCPT"):
        at = payload.find(tag)
        units, version, count, reserved = struct.unpack_from("<HHHI", payload, at + 6)
        if at < 0 or version != 1 or reserved:
            raise ValueError(f"Invalid descriptor table {tag!r}")
        end = at + units * 16
        entries = []
        for i in range(count):
            string_index, raw_descriptor = struct.unpack_from("<HH", payload, at + 16 + i * 4)
            if string_index >= len(names):
                raise ValueError("Descriptor string index out of range")
            entries.append({"name": names[string_index], "string_index": string_index,
                            "raw_descriptor": raw_descriptor, "native_descriptor_byte": raw_descriptor & 255})
        if any(payload[at + 16 + count * 4:end]):
            raise ValueError("Nonzero descriptor table padding")
        tables.append(entries)
    return names, tables[0], tables[1]


def parse_actor_table(payload, outer_offset, actor_types):
    cact, cdpt = payload.find(b"@CACT"), payload.find(b"@CDPT")
    if not 0 <= cact < cdpt:
        raise ValueError("Missing CACT/CDPT actor envelope")
    units, version, count, reserved = struct.unpack_from("<HHHI", payload, cact + 6)
    if version != 1 or reserved or cact + units * 16 != cdpt:
        raise ValueError("CACT envelope/size mismatch")
    cursor, actors = cact + 16, []
    for ordinal in range(count):
        size, kind, index = struct.unpack_from("<HBB", payload, cursor)
        if size < 0x14 or size % 4 or cursor + size > cdpt:
            raise ValueError(f"Invalid actor record at {cursor:#x}")
        raw = payload[cursor:cursor + size]
        label = raw[4:20].split(b"\0", 1)[0].decode("ascii", errors="backslashreplace")
        if kind >= len(actor_types):
            raise ValueError("Actor descriptor index out of range")
        kind_name = actor_types[kind]["name"]
        # The serialized ProxyActor binds PC/NPC actor classes. CharacterActor
        # is a different scene actor type, often a stage with no class-ID field.
        actor_class = struct.unpack_from("<I", raw, 0x30)[0] if kind_name == "ProxyActor" and size == 0x3C else None
        actors.append({"ordinal": ordinal, "index": index, "kind": kind,
                       "kind_name": kind_name, "type_descriptor": actor_types[kind],
                       "label": label, "actor_class_id": actor_class, "record_size": size,
                       "offset": outer_offset + cursor, "offset_hex": f"0x{outer_offset + cursor:X}",
                       "raw_hex": raw.hex()})
        cursor += size
    if any(payload[cursor:cdpt]):
        raise ValueError("Nonzero CACT padding")
    if len({a["index"] for a in actors}) != len(actors):
        raise ValueError("Duplicate actor index in one SCB")
    return actors


def parse_timeline(data):
    resources = [(layer, resource) for layer, resource in walk_pwib_resources(data)
                 if resource.payload.startswith(b"SEDBSCB\0")]
    if len(resources) != 1:
        raise ValueError(f"Expected one SCB resource, found {len(resources)}")
    layer, resource = resources[0]
    payload = resource.payload
    outer = data.find(payload)
    if outer < 0 or data.find(payload, outer + 1) >= 0:
        raise ValueError("SCB outer offset is ambiguous")
    version, abi, size = struct.unpack_from("<III", payload, 8)
    if version != 2 or abi != 0x00300000 or size != len(payload):
        raise ValueError("SCB envelope changed")
    strings, actor_types, clip_types = parse_type_tables(payload)
    actors = parse_actor_table(payload, outer, actor_types)
    actor_by_index = {a["index"]: a for a in actors}
    classes, references = [t["name"] for t in clip_types], scb_resource_table(payload)
    ccnt = payload.find(b"@CCNT")
    if ccnt < 0:
        raise ValueError("SCB has no CCNT envelope")
    markers = [m.start() for m in re.finditer(re.escape(b"@CBLK"), payload[:ccnt])]
    blocks, clips = [], []
    for ordinal, marker in enumerate(markers):
        duration, count = struct.unpack_from("<II", payload, marker + 0x24)
        raw_label = payload[marker + 16:marker + 32]
        label = raw_label.rstrip(b"\0").decode("cp932", errors="backslashreplace")
        cursor, block_clips = marker + 64, []
        for entry in range(count):
            record_size, class_index, actor_index, start = struct.unpack_from("<HBBI", payload, cursor)
            if record_size < 16 or record_size % 4 or cursor + record_size > len(payload):
                raise ValueError(f"Invalid clip at {cursor:#x}")
            if class_index >= len(classes) or actor_index not in actor_by_index:
                raise ValueError(f"Invalid clip class/actor at {cursor:#x}: {class_index}/{actor_index}")
            raw = payload[cursor:cursor + record_size]
            clip_class, actor = classes[class_index], actor_by_index[actor_index]
            track, flags, clip_id = struct.unpack_from("<HHI", raw, 8)
            position = rotation = None
            if clip_class == "SetPosClip":
                if record_size != 0x40:
                    raise ValueError(f"Unexpected SetPosClip size at {cursor:#x}")
                position = struct.unpack_from("<3f", raw, 16)
                rotation = struct.unpack_from("<f", raw, 32)[0]
            ref = None
            if clip_class == "MotionClip":
                ref_index = struct.unpack_from("<I", raw, 16)[0]
                if ref_index >= len(references):
                    raise ValueError(f"Invalid MotionClip resource at {cursor:#x}")
                ref = {"index": ref_index, "id": references[ref_index][0], "type": references[ref_index][1]}
            row = {"block_ordinal": ordinal, "block_label": label, "entry_ordinal": entry,
                   "offset": outer + cursor, "offset_hex": f"0x{outer + cursor:X}", "size": record_size,
                   "class_index": class_index, "clip_class": clip_class, "actor_index": actor_index,
                   "actor_label": actor["label"], "actor_kind": actor["kind_name"],
                   "actor_class_id": actor["actor_class_id"], "start_units": start,
                   "start_seconds": start / 1_000_000, "target_track_id": track,
                   "flags_hex": f"0x{flags:04X}", "timeline_clip_id": clip_id,
                   "position": position, "rotation": rotation, "motion_resource": ref, "raw_hex": raw.hex()}
            block_clips.append(row)
            clips.append(row)
            cursor += record_size
        end = markers[ordinal + 1] if ordinal + 1 < len(markers) else ccnt
        padding = payload[cursor:end]
        if len(padding) not in (0, 4, 8, 12) or any(padding):
            raise ValueError(f"Invalid CBLK padding after {label!r}: {len(padding)} bytes")
        blocks.append({"ordinal": ordinal, "label": label, "label_raw_hex": raw_label.hex(),
                       "offset": outer + marker, "offset_hex": f"0x{outer + marker:X}",
                       "duration_units": duration, "duration_seconds": duration / 1_000_000,
                       "entry_count": count, "padding_bytes": len(padding)})
    return {"resource_id": resource.resource_id, "resource_layer": layer, "scb_outer_offset": outer,
            "string_pool": strings, "actor_types": actor_types, "clip_types": clip_types,
            "actors": actors, "clip_classes": classes, "resources": references, "blocks": blocks, "clips": clips}
