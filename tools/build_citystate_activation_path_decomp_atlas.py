#!/usr/bin/env python3
"""Build a city-state seasonal furnishing activation-path atlas."""

from __future__ import annotations

import argparse
import csv
import re
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path


BRIDGE_OUTPUT = Path("outputs/citystate-decor-probe-bridge-atlas-20260703")
DEFAULT_OUTPUT = Path("outputs/citystate-activation-path-decomp-atlas-20260703")
DEFAULT_DOC = Path("docs/citystate_activation_path_decomp_atlas_2026-07-03.md")

RAW_OCCURRENCES_CSV = BRIDGE_OUTPUT / "raw_city_decor_occurrences.csv"
RAW_FAMILY_SCORES_CSV = BRIDGE_OUTPUT / "raw_decor_stem_family_scores.csv"
RAW_OWNER_BRIDGES_CSV = BRIDGE_OUTPUT / "raw_isgrp_owner_bridge_extended.csv"
BEST_PROBE_QUEUE_CSV = BRIDGE_OUTPUT / "best_decor_probe_queue.csv"
MAPOBJ_BINDINGS_CSV = Path("outputs/citystate-seasonal-furnishing-decomp-atlas-20260703/mapobj_binding_surfaces.csv")

NEIGHBORHOOD_WINDOW_BYTES = 768
RAW_ADJACENT_OWNER_WINDOW_BYTES = 80
DEFAULT_RAW_OWNER_ACTOR_CLASS_ID = "5900001"
ISGRP_RE = re.compile(r"^isgrp_(\d{6})$")


def read_csv(path: Path) -> list[dict[str, str]]:
    if not path.exists():
        return []
    with path.open(newline="", encoding="utf-8-sig") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        path.write_text("", encoding="utf-8")
        return
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)


def try_int(value: object) -> int | None:
    try:
        return int(str(value))
    except (TypeError, ValueError):
        return None


def offset_hex(value: object) -> str:
    parsed = try_int(value)
    return f"0x{parsed:08X}" if parsed is not None else ""


def summarize(rows: list[dict[str, object]], field: str) -> str:
    counts = Counter(str(row.get(field, "") or "<blank>") for row in rows)
    return ", ".join(f"{name}={count}" for name, count in counts.most_common())


def event_rank(event_hint: str) -> int:
    order = {
        "All Saints/Halloween city decor": 0,
        "Grand Company/Foundation flag": 1,
        "City flag/decor": 2,
        "City gate/flag group": 3,
        "Moonfire/fireworks": 4,
        "Starlight/Xmas": 5,
    }
    return order.get(event_hint, 99)


def confidence_rank(confidence: str) -> int:
    order = {
        "high": 0,
        "medium-high": 1,
        "medium": 2,
        "low-distance-only": 3,
        "fallback-host": 4,
        "inventory-only": 5,
    }
    return order.get(confidence, 9)


def short_examples(values: list[str], limit: int = 14) -> str:
    result: list[str] = []
    seen: set[str] = set()
    for value in values:
        if value in seen:
            continue
        seen.add(value)
        result.append(value)
        if len(result) >= limit:
            break
    return " | ".join(result)


def token_role(row: dict[str, str], family: dict[str, str], bridge: dict[str, str], center_offset: int) -> str:
    value = row.get("string", "")
    lowered = value.lower()
    offset = try_int(row.get("offset_dec", "")) or 0
    time_base = family.get("time_scheduler_base", "")
    family_stem = family.get("family_stem", "")

    if bridge and value == bridge.get("isgrp", "") and offset == try_int(bridge.get("isgrp_offset_dec", "")):
        return "owner_isgrp"
    if bridge and value == bridge.get("nearby_string", "") and offset == try_int(bridge.get("nearby_offset_dec", "")):
        return "matched_group"
    if time_base and value == f"{time_base}_show":
        return "time_show"
    if time_base and value == f"{time_base}_hide":
        return "time_hide"
    if family_stem and family_stem.lower() in lowered:
        if lowered.startswith("sgrp_"):
            return "same_family_sgrp"
        if lowered.startswith(("attr_", "grp_")) or "_001" in lowered:
            return "same_family_mesh_or_attr"
        if lowered.endswith(".dds") or "/sourceimages/" in lowered:
            return "same_family_texture"
        return "same_family"
    if lowered.startswith("isgrp_"):
        return "other_isgrp"
    if lowered.startswith("sgrp_"):
        return "other_sgrp"
    if abs(offset - center_offset) <= 32:
        return "center_neighbor"
    return "nearby"


def raw_rows_by_resource(raw_rows: list[dict[str, str]]) -> dict[tuple[str, str, str], list[dict[str, str]]]:
    grouped: dict[tuple[str, str, str], list[dict[str, str]]] = defaultdict(list)
    for row in raw_rows:
        key = (row.get("city_state", ""), row.get("layout_id", ""), row.get("resource_token", ""))
        grouped[key].append(row)
    for rows in grouped.values():
        rows.sort(key=lambda item: try_int(item.get("offset_dec", "")) or -1)
    return grouped


def best_bridge_for_family(
    family: dict[str, str],
    bridges_by_city_base: dict[tuple[str, str], list[dict[str, str]]],
) -> dict[str, str]:
    city = family.get("city_state", "")
    base = family.get("time_scheduler_base", "")
    unique_id = family.get("best_owner_unique_id", "")
    candidates = bridges_by_city_base.get((city, base), [])
    if unique_id:
        exact = [row for row in candidates if row.get("unique_id", "") == unique_id]
        if exact:
            return exact[0]
    return candidates[0] if candidates else {}


def build_neighborhood_rows(
    raw_rows: list[dict[str, str]],
    family_rows: list[dict[str, str]],
    owner_bridge_rows: list[dict[str, str]],
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    resources = raw_rows_by_resource(raw_rows)
    bridges_by_city_base: dict[tuple[str, str], list[dict[str, str]]] = defaultdict(list)
    for bridge in owner_bridge_rows:
        key = (bridge.get("city_state", ""), bridge.get("derived_time_scheduler_base", ""))
        if key[0] and key[1]:
            bridges_by_city_base[key].append(bridge)
    for bridges in bridges_by_city_base.values():
        bridges.sort(key=lambda item: try_int(item.get("byte_distance", "")) or 999999)

    summary_rows: list[dict[str, object]] = []
    sequence_rows: list[dict[str, object]] = []
    for index, family in enumerate(family_rows, start=1):
        confidence = family.get("confidence", "")
        if confidence == "inventory-only":
            continue
        bridge = best_bridge_for_family(family, bridges_by_city_base)
        raw_family_rows = [
            row
            for row in raw_rows
            if row.get("city_state", "") == family.get("city_state", "")
            and row.get("event_hint", "") == family.get("event_hint", "")
            and row.get("family_stem", "") == family.get("family_stem", "")
        ]
        if not raw_family_rows:
            continue

        resource_key = (
            raw_family_rows[0].get("city_state", ""),
            raw_family_rows[0].get("layout_id", ""),
            raw_family_rows[0].get("resource_token", ""),
        )
        resource_rows = resources.get(resource_key, [])
        family_offsets = [try_int(row.get("offset_dec", "")) for row in raw_family_rows]
        family_offsets = [offset for offset in family_offsets if offset is not None]
        family_center = try_int(bridge.get("nearby_offset_dec", "")) if bridge else None
        if family_center is None:
            family_center = min(family_offsets) if family_offsets else 0
        owner_center = try_int(bridge.get("isgrp_offset_dec", "")) if bridge else None

        windows: list[tuple[str, int]] = [("family_window", family_center)]
        if owner_center is not None:
            windows.insert(0, ("owner_window", owner_center))

        token_counts_by_window: dict[str, int] = {}
        role_counts: Counter[str] = Counter()
        example_tokens: list[str] = []
        for window_kind, center in windows:
            start = center - NEIGHBORHOOD_WINDOW_BYTES
            end = center + NEIGHBORHOOD_WINDOW_BYTES
            window_tokens = [
                row
                for row in resource_rows
                if (try_int(row.get("offset_dec", "")) is not None)
                and start <= (try_int(row.get("offset_dec", "")) or 0) <= end
            ]
            token_counts_by_window[window_kind] = len(window_tokens)
            for sequence_index, row in enumerate(window_tokens, start=1):
                offset = try_int(row.get("offset_dec", "")) or 0
                role = token_role(row, family, bridge, center)
                role_counts[role] += 1
                if role != "nearby":
                    example_tokens.append(row.get("string", ""))
                sequence_rows.append(
                    {
                        "window_id": index,
                        "window_kind": window_kind,
                        "sequence_index": sequence_index,
                        "city_state": family.get("city_state", ""),
                        "event_hint": family.get("event_hint", ""),
                        "family_stem": family.get("family_stem", ""),
                        "time_scheduler_base": family.get("time_scheduler_base", ""),
                        "resource_token": resource_key[2],
                        "center_offset_dec": center,
                        "center_offset_hex": offset_hex(center),
                        "offset_dec": offset,
                        "offset_hex": offset_hex(offset),
                        "offset_from_center": offset - center,
                        "role": role,
                        "string": row.get("string", ""),
                        "string_class": row.get("string_class", ""),
                    }
                )

        has_owner = bool(bridge)
        has_sgrp = any(row.get("string", "").lower().startswith("sgrp_") for row in raw_family_rows)
        has_show = any(row.get("string", "") == f"{family.get('time_scheduler_base', '')}_show" for row in raw_family_rows)
        has_hide = any(row.get("string", "") == f"{family.get('time_scheduler_base', '')}_hide" for row in raw_family_rows)
        readout = "authored DAT scheduler family"
        if has_owner:
            readout += " with SQL-backed live owner bridge"
        if not has_owner:
            readout += " without a confirmed live owner bridge"
        if has_show and has_hide:
            readout += "; show/hide pair present"
        if confidence == "low-distance-only":
            readout += "; owner distance is loose"

        summary_rows.append(
            {
                "window_id": index,
                "city_state": family.get("city_state", ""),
                "event_hint": family.get("event_hint", ""),
                "family_stem": family.get("family_stem", ""),
                "time_scheduler_base": family.get("time_scheduler_base", ""),
                "score": family.get("score", ""),
                "confidence": confidence,
                "resource_token": resource_key[2],
                "best_owner_spawn": family.get("best_owner_spawn", ""),
                "best_owner_unique_id": family.get("best_owner_unique_id", ""),
                "best_owner_instance": family.get("best_owner_instance", ""),
                "best_owner_distance": family.get("best_owner_distance", ""),
                "owner_isgrp": bridge.get("isgrp", ""),
                "owner_isgrp_offset_dec": bridge.get("isgrp_offset_dec", ""),
                "owner_isgrp_offset_hex": offset_hex(bridge.get("isgrp_offset_dec", "")),
                "matched_group": bridge.get("nearby_string", ""),
                "matched_group_offset_dec": bridge.get("nearby_offset_dec", ""),
                "matched_group_offset_hex": offset_hex(bridge.get("nearby_offset_dec", "")),
                "owner_window_token_count": token_counts_by_window.get("owner_window", ""),
                "family_window_token_count": token_counts_by_window.get("family_window", ""),
                "role_counts": ", ".join(f"{role}={count}" for role, count in role_counts.most_common()),
                "has_sgrp": "yes" if has_sgrp else "no",
                "has_show_hide_pair": "yes" if has_show and has_hide else "no",
                "readout": readout,
                "example_relevant_tokens": short_examples(example_tokens),
            }
        )

    summary_rows.sort(
        key=lambda row: (
            event_rank(str(row["event_hint"])),
            str(row["city_state"]),
            confidence_rank(str(row["confidence"])),
            -try_int(row["score"]),
            str(row["family_stem"]),
        )
    )
    sequence_rows.sort(
        key=lambda row: (
            int(row["window_id"]),
            str(row["window_kind"]),
            int(row["sequence_index"]),
        )
    )
    return summary_rows, sequence_rows


def build_probe_batch_rows(queue_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    grouped: dict[tuple[str, str, str, str, str], list[dict[str, str]]] = defaultdict(list)
    for row in queue_rows:
        key = (
            row.get("city_state", ""),
            row.get("event_hint", ""),
            row.get("best_owner_spawn", ""),
            row.get("best_owner_unique_id", ""),
            row.get("confidence", ""),
        )
        grouped[key].append(row)

    rows: list[dict[str, object]] = []
    for key, group in grouped.items():
        city, event, spawn, unique_id, confidence = key
        group.sort(key=lambda item: (item.get("family_stem", ""), item.get("action", "")))
        probes = [row.get("probe_command", "") for row in group if row.get("probe_command", "")]
        families = sorted({row.get("family_stem", "") for row in group if row.get("family_stem", "")})
        rows.append(
            {
                "city_state": city,
                "event_hint": event,
                "confidence": confidence,
                "owner_spawn": spawn,
                "owner_unique_id": unique_id,
                "family_count": len(families),
                "probe_count": len(probes),
                "spawn_command": f"!spawnbgobj placed {spawn}" if spawn else "",
                "families": " | ".join(families),
                "first_probe_commands": " | ".join(probes[:20]),
                "readout": "Spawn once, then run the show/hide probe list for the grouped DAT families.",
            }
        )

    rows.sort(
        key=lambda row: (
            event_rank(str(row["event_hint"])),
            str(row["city_state"]),
            confidence_rank(str(row["confidence"])),
            -int(row["probe_count"]),
        )
    )
    return rows


def build_probe_batch_command_rows(batch_rows: list[dict[str, object]], queue_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    batch_id_by_key: dict[tuple[str, str, str, str, str], int] = {}
    for batch_id, batch in enumerate(batch_rows, start=1):
        key = (
            str(batch.get("city_state", "")),
            str(batch.get("event_hint", "")),
            str(batch.get("owner_spawn", "")),
            str(batch.get("owner_unique_id", "")),
            str(batch.get("confidence", "")),
        )
        batch_id_by_key[key] = batch_id

    grouped: dict[tuple[str, str, str, str, str], list[dict[str, str]]] = defaultdict(list)
    for row in queue_rows:
        key = (
            row.get("city_state", ""),
            row.get("event_hint", ""),
            row.get("best_owner_spawn", ""),
            row.get("best_owner_unique_id", ""),
            row.get("confidence", ""),
        )
        grouped[key].append(row)

    rows: list[dict[str, object]] = []
    for key, group in grouped.items():
        batch_id = batch_id_by_key.get(key)
        if batch_id is None:
            continue
        city, event, spawn, unique_id, confidence = key
        rows.append(
            {
                "batch_id": batch_id,
                "sequence": 0,
                "city_state": city,
                "event_hint": event,
                "confidence": confidence,
                "owner_spawn": spawn,
                "owner_unique_id": unique_id,
                "family_stem": "",
                "action": "spawn",
                "command": f"!spawnbgobj placed {spawn}" if spawn else "",
            }
        )
        group.sort(key=lambda item: (item.get("family_stem", ""), item.get("action", "")))
        for sequence, probe in enumerate(group, start=1):
            rows.append(
                {
                    "batch_id": batch_id,
                    "sequence": sequence,
                    "city_state": city,
                    "event_hint": event,
                    "confidence": confidence,
                    "owner_spawn": spawn,
                    "owner_unique_id": unique_id,
                    "family_stem": probe.get("family_stem", ""),
                    "action": probe.get("action", ""),
                    "command": probe.get("probe_command", ""),
                }
            )

    rows.sort(key=lambda row: (int(row["batch_id"]), int(row["sequence"])))
    return rows


def build_raw_adjacent_owner_rows(raw_rows: list[dict[str, str]], mapobj_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    sql_owners: dict[tuple[str, str, str], list[dict[str, str]]] = defaultdict(list)
    for mapobj in mapobj_rows:
        key = (mapobj.get("city_state", ""), mapobj.get("layout_id", ""), mapobj.get("instance_id", ""))
        if key[0] and key[1] and key[2]:
            sql_owners[key].append(mapobj)

    grouped = raw_rows_by_resource(raw_rows)
    rows: list[dict[str, object]] = []
    seen: set[tuple[str, str, str, str]] = set()
    for (city, layout, resource), resource_rows in grouped.items():
        for index, row in enumerate(resource_rows):
            string = row.get("string", "")
            if not string.startswith("sgrp_"):
                continue
            event = row.get("event_hint", "")
            stem = row.get("family_stem", "")
            if not event or not stem:
                continue
            offset = try_int(row.get("offset_dec", ""))
            if offset is None:
                continue

            best_owner: tuple[int, dict[str, str]] | None = None
            for previous in reversed(resource_rows[:index]):
                previous_offset = try_int(previous.get("offset_dec", ""))
                if previous_offset is None:
                    continue
                distance = offset - previous_offset
                if distance < 0:
                    continue
                if distance > RAW_ADJACENT_OWNER_WINDOW_BYTES:
                    break
                if ISGRP_RE.fullmatch(previous.get("string", "")):
                    best_owner = (distance, previous)
                    break
            if best_owner is None:
                continue

            distance, owner = best_owner
            owner_instance = ISGRP_RE.fullmatch(owner.get("string", "")).group(1).lstrip("0") or "0"  # type: ignore[union-attr]
            owner_key = (city, layout, owner_instance)
            owners = sql_owners.get(owner_key, [])
            sql_owner = owners[0] if owners else {}
            unique_id = sql_owner.get("unique_id", "target")
            spawn_id = sql_owner.get("spawn_id", "")
            time_base = row.get("time_scheduler_base", "")
            dedupe_key = (city, layout, owner_instance, string)
            if dedupe_key in seen:
                continue
            seen.add(dedupe_key)

            has_sql = bool(sql_owner)
            spawn_command = (
                f"!spawnbgobj placed {spawn_id}"
                if has_sql and spawn_id
                else f"!spawnbgobj {layout} {owner_instance} {DEFAULT_RAW_OWNER_ACTOR_CLASS_ID}"
            )
            probe_target = unique_id if has_sql and unique_id else "target"
            rows.append(
                {
                    "city_state": city,
                    "layout_id": layout,
                    "resource_token": resource,
                    "event_hint": event,
                    "family_stem": stem,
                    "time_scheduler_base": time_base,
                    "raw_owner_isgrp": owner.get("string", ""),
                    "raw_owner_instance": owner_instance,
                    "raw_owner_offset_dec": owner.get("offset_dec", ""),
                    "raw_owner_offset_hex": owner.get("offset_hex", ""),
                    "sgrp": string,
                    "sgrp_offset_dec": offset,
                    "sgrp_offset_hex": row.get("offset_hex", ""),
                    "byte_distance": distance,
                    "has_sql_backed_owner": "yes" if has_sql else "no",
                    "sql_spawn_id": spawn_id,
                    "sql_unique_id": sql_owner.get("unique_id", ""),
                    "sql_actor_class_id": sql_owner.get("actor_class_id", ""),
                    "spawn_command": spawn_command,
                    "group_probe_command": f"!testbgschedulerlong {probe_target} {string} 0",
                    "show_probe_command": f"!testbgschedulerlong {probe_target} {time_base}_show 0" if time_base else "",
                    "hide_probe_command": f"!testbgschedulerlong {probe_target} {time_base}_hide 0" if time_base else "",
                    "readout": (
                        "Adjacent raw DAT owner also has a SQL mapobj row."
                        if has_sql
                        else "Adjacent raw DAT owner has no SQL mapobj row; spawn by layout/instance as a raw probe."
                    ),
                }
            )

    rows.sort(
        key=lambda row: (
            str(row["has_sql_backed_owner"]),
            event_rank(str(row["event_hint"])),
            str(row["city_state"]),
            int(row["byte_distance"]),
            str(row["family_stem"]),
        )
    )
    return rows


def build_activation_surface_rows() -> list[dict[str, object]]:
    return [
        {
            "surface": "MapObjOnlyShowHide",
            "kind": "generic live map-object scheduler runner",
            "evidence": "tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/mapobj/mapobjonlyshowhide.lua:3",
            "actor_or_packet": "actor classes 5900006/5900007",
            "activation_shape": "initForEvent runs _runBgScheduler('show') for 5900006, otherwise _runBgScheduler('hide')",
            "citystate_read": "Proves show/hide is a map-object scheduler action. SQL rows found for tutorial/merchward, not a full city global switch.",
            "confidence": "high",
        },
        {
            "surface": "MapObjFireworks",
            "kind": "generic live map-object fireworks scheduler runner",
            "evidence": "tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/mapobj/mapobjfireworks.lua:16",
            "actor_or_packet": "actor classes 5900036/5900037/5900038",
            "activation_shape": "night loop runs v_l#/v_c#/v_r# schedulers",
            "citystate_read": "Moonfire/fireworks support path; not the All Saints city furnishing switch.",
            "confidence": "high",
        },
        {
            "surface": "BeaconFortGateGimmick",
            "kind": "parameterized live map-object scheduler runner",
            "evidence": "tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/gimmick/gimmickmapobj/beaconfortgategimmick.lua:3",
            "actor_or_packet": "gimmick class, no city SQL actor-class rows found in this pass",
            "activation_shape": "initForGimmick stores arbitrary showSchedulerName/hideSchedulerName and later runs one",
            "citystate_read": "Important pattern for arbitrary long scheduler names, but not currently linked to city seasonal furnishing rows.",
            "confidence": "medium",
        },
        {
            "surface": "!testbgschedulerlong / RunEventFunctionPacket",
            "kind": "manual GM probe path",
            "evidence": "Map Server/CommandProcessor.cs:134",
            "actor_or_packet": "RunEventFunctionPacket against a live owner actor",
            "activation_shape": "_runBgSchedulerFromMidstream(<scheduler>, <offset>)",
            "citystate_read": "Best current test bridge for authored city DAT scheduler names such as time_bg_hw1_show.",
            "confidence": "high",
        },
        {
            "surface": "RunEventFunctionPacket payload",
            "kind": "negative evidence: owner-scoped packet",
            "evidence": "Map Server/Packets/Send/Events/RunEventFunctionPacket.cs:37",
            "actor_or_packet": "trigger actor id, owner actor id, event type/name, function name, Lua params",
            "activation_shape": "No layout id, instance id, sgrp, isgrp, or city/global selector field found.",
            "citystate_read": "Explains why city furnishing probes need a live owner actor instead of a pure group/global call.",
            "confidence": "high",
        },
        {
            "surface": "SetActorBGPropertiesPacket",
            "kind": "negative evidence: layout binding is actor-local",
            "evidence": "Map Server/Packets/Send/Actor/SetActorBGPropertiesPacket.cs:34",
            "actor_or_packet": "layout/instance sent as BG properties for one NPC actor",
            "activation_shape": "Map-object layout and instance are properties of a concrete spawned NPC.",
            "citystate_read": "Supports the live-owner bridge model: spawn/rebind an owner, then run its scheduler.",
            "confidence": "high",
        },
        {
            "surface": "PlayBGAnimation",
            "kind": "negative evidence: short animation path",
            "evidence": "Map Server/Packets/Send/Actor/PlayBGAnimation.cs:28",
            "actor_or_packet": "actor-sourced BG animation packet",
            "activation_shape": "Short animation/scheduler name path, capped at 8 bytes in the GM helper surface.",
            "citystate_read": "Not enough for authored city names like time_bg_hw_obj1_h_show.",
            "confidence": "medium-high",
        },
        {
            "surface": "SetActorEventCondition",
            "kind": "negative evidence: condition setup, not decor activation",
            "evidence": "Map Server/Actors/Actor.cs:244",
            "actor_or_packet": "per-actor event condition packets",
            "activation_shape": "Prepares actor event conditions; does not dispatch BG schedulers by group.",
            "citystate_read": "Useful actor plumbing, but not the missing city furnishing switch.",
            "confidence": "medium-high",
        },
        {
            "surface": "Weather aliases",
            "kind": "weather/resource overlay",
            "evidence": "Data/scripts/commands/gm/weather.lua:91",
            "actor_or_packet": "weather ids 8027/8029/8032 and friends",
            "activation_shape": "SetWeatherPacket/weatherNormal/fireworks_enabled",
            "citystate_read": "Useful for sky/VFX overlays, but separate from placed furnishing scheduler groups.",
            "confidence": "high",
        },
        {
            "surface": "Seasonal quest/festival gates",
            "kind": "quest/NPC talk/shop gate",
            "evidence": "Data/scripts/quests/generic_quest_scaffold.lua:133",
            "actor_or_packet": "GetSeasonalQuestsEnabled/eventTalkFestival*",
            "activation_shape": "enables seasonal quest/talk/shop behavior",
            "citystate_read": "No DAT furnishing scheduler activation found through this path.",
            "confidence": "medium-high",
        },
    ]


def build_city_readout_rows(summary_rows: list[dict[str, object]], batch_rows: list[dict[str, object]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for city in sorted({str(row.get("city_state", "")) for row in summary_rows if row.get("city_state", "")}):
        city_summaries = [row for row in summary_rows if row.get("city_state", "") == city]
        city_batches = [row for row in batch_rows if row.get("city_state", "") == city]
        best = sorted(
            city_summaries,
            key=lambda row: (
                event_rank(str(row.get("event_hint", ""))),
                confidence_rank(str(row.get("confidence", ""))),
                -(try_int(row.get("score", "")) or 0),
            ),
        )[:5]
        rows.append(
            {
                "city_state": city,
                "event_counts": summarize(city_summaries, "event_hint"),
                "best_confidence_counts": summarize(city_summaries, "confidence"),
                "probe_batch_count": len(city_batches),
                "best_spawn_commands": " | ".join(str(row.get("spawn_command", "")) for row in city_batches[:4] if row.get("spawn_command", "")),
                "best_families": " | ".join(f"{row.get('family_stem')}:{row.get('confidence')}" for row in best),
                "readout": city_readout(city),
            }
        )
    return rows


def city_readout(city: str) -> str:
    if city == "Ul'dah":
        return "Strongest city-state furnishing bridge: one SQL-backed owner is close to the full hw0..9 Halloween scheduler block."
    if city == "Gridania":
        return "Coherent Halloween scheduler family chain; best live owner is medium-distance through gridania_shipport."
    if city == "Limsa Lominsa":
        return "Real Halloween show/hide DAT families exist, but the SQL-backed owner bridge remains loose-distance only."
    return ""


def write_doc(
    path: Path,
    output: Path,
    activation_rows: list[dict[str, object]],
    neighborhood_rows: list[dict[str, object]],
    sequence_rows: list[dict[str, object]],
    batch_rows: list[dict[str, object]],
    batch_command_rows: list[dict[str, object]],
    raw_adjacent_rows: list[dict[str, object]],
    city_rows: list[dict[str, object]],
) -> None:
    doc = f"""# City-State Activation Path Decomp Atlas - 2026-07-03

Generated: {datetime.now(timezone.utc).replace(microsecond=0).isoformat()}

## Inputs

- Raw city decor occurrences: `{RAW_OCCURRENCES_CSV}`
- Raw family scores: `{RAW_FAMILY_SCORES_CSV}`
- Raw owner bridges: `{RAW_OWNER_BRIDGES_CSV}`
- Best probe queue: `{BEST_PROBE_QUEUE_CSV}`
- SQL map-object bindings: `{MAPOBJ_BINDINGS_CSV}`

## Summary

- Activation/runtime surface rows: {len(activation_rows)}
- Raw owner/family neighborhood windows: {len(neighborhood_rows)}
- Neighborhood token sequence rows: {len(sequence_rows)}
- Probe batch rows: {len(batch_rows)}
- Probe batch command sequence rows: {len(batch_command_rows)}
- Raw-adjacent owner candidate rows: {len(raw_adjacent_rows)}
- City readout rows: {len(city_rows)}
- Neighborhood events: {summarize(neighborhood_rows, "event_hint")}
- Neighborhood confidence: {summarize(neighborhood_rows, "confidence")}
- Probe batches by city: {summarize(batch_rows, "city_state")}
- Raw-adjacent candidates by SQL backing: {summarize(raw_adjacent_rows, "has_sql_backed_owner")}
- Raw-adjacent candidate events: {summarize(raw_adjacent_rows, "event_hint")}

## Readout

- I still do not see a recovered global switch that turns on every city-state seasonal furnishing group by event name.
- The furnishing evidence is stronger as grouped authored layout data than as per-position manual SQL. Each major city Halloween family has `sgrp_*` plus `time_bg_*_show` / `time_bg_*_hide` in the city DAT.
- The server-side/live bridge still needs a source actor. `!testbgschedulerlong` uses `RunEventFunctionPacket` to call `_runBgSchedulerFromMidstream` on a live map-object owner.
- `MapObjOnlyShowHide` and `BeaconFortGateGimmick` are the important script patterns: one is a fixed show/hide actor-class runner, the other can accept arbitrary scheduler names, but this pass did not find city SQL rows that already bind `BeaconFortGateGimmick` to the seasonal city furnishings.
- Ul'dah is the cleanest proof: `isgrp_004289` / spawn `2050` sits close to the `sgrp_w0t0_h0_hlw*` block and now covers `time_bg_hw0..9_show/hide`.
- Gridania is coherent but less tight: `gridania_shipport` / spawn `589` is the best owner for `time_bg_hlw1a..2b_show/hide`.
- Limsa has real `sgrp_bg_hw_obj1_h..8_h` and `time_bg_hw_obj*_show/hide`, but no tight SQL-backed owner emerged. Treat spawn `496` / `guild_msk` as a loose probe, not proof.
- Raw-adjacent owner probes fill that gap for investigation: Limsa has raw `isgrp_003215` 13 bytes before `sgrp_bg_hw_obj1_h`, and Gridania has raw `isgrp_003392` 13 bytes before `sgrp_f0t0_a0_hlw1a_h`; these are not SQL-backed placed rows, so they are lower safety/proof than `!spawnbgobj placed ...` but much closer to the authored DAT blocks.

## Output Files

- `{output / "activation_surface_evidence.csv"}`
- `{output / "best_owner_neighborhoods.csv"}`
- `{output / "neighborhood_token_sequence.csv"}`
- `{output / "city_family_probe_batches.csv"}`
- `{output / "city_family_probe_batch_commands.csv"}`
- `{output / "raw_adjacent_owner_probe_candidates.csv"}`
- `{output / "city_activation_readout.csv"}`

## First Probe Batches

- Ul'dah Halloween: `!spawnbgobj placed 2050`, then run `time_bg_hw0..9_show/hide` against `man0u0_tutorial_mapobj1`.
- Gridania Halloween: `!spawnbgobj placed 589`, then run `time_bg_hlw1a..2b_show/hide` against `gridania_shipport`.
- Limsa Halloween: `!spawnbgobj placed 496`, then run `time_bg_hw_obj1_h..8_h_show/hide` against `guild_msk` as loose-distance evidence.
- Limsa raw-adjacent Halloween check: `!spawnbgobj 121 3215 5900001`, then `!testbgschedulerlong target time_bg_hw_obj1_h_show 0`.
- Gridania raw-adjacent Halloween check: `!spawnbgobj 321 3392 5900001`, then `!testbgschedulerlong target time_bg_hlw1a_show 0`.
"""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(doc, encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    raw_rows = read_csv(RAW_OCCURRENCES_CSV)
    family_rows = read_csv(RAW_FAMILY_SCORES_CSV)
    owner_bridge_rows = read_csv(RAW_OWNER_BRIDGES_CSV)
    queue_rows = read_csv(BEST_PROBE_QUEUE_CSV)
    mapobj_rows = read_csv(MAPOBJ_BINDINGS_CSV)

    activation_rows = build_activation_surface_rows()
    neighborhood_rows, sequence_rows = build_neighborhood_rows(raw_rows, family_rows, owner_bridge_rows)
    batch_rows = build_probe_batch_rows(queue_rows)
    batch_command_rows = build_probe_batch_command_rows(batch_rows, queue_rows)
    raw_adjacent_rows = build_raw_adjacent_owner_rows(raw_rows, mapobj_rows)
    city_rows = build_city_readout_rows(neighborhood_rows, batch_rows)

    write_csv(args.output / "activation_surface_evidence.csv", activation_rows)
    write_csv(args.output / "best_owner_neighborhoods.csv", neighborhood_rows)
    write_csv(args.output / "neighborhood_token_sequence.csv", sequence_rows)
    write_csv(args.output / "city_family_probe_batches.csv", batch_rows)
    write_csv(args.output / "city_family_probe_batch_commands.csv", batch_command_rows)
    write_csv(args.output / "raw_adjacent_owner_probe_candidates.csv", raw_adjacent_rows)
    write_csv(args.output / "city_activation_readout.csv", city_rows)
    write_doc(args.doc, args.output, activation_rows, neighborhood_rows, sequence_rows, batch_rows, batch_command_rows, raw_adjacent_rows, city_rows)

    print(f"activation_surface_evidence={len(activation_rows)}")
    print(f"best_owner_neighborhoods={len(neighborhood_rows)}")
    print(f"neighborhood_token_sequence={len(sequence_rows)}")
    print(f"city_family_probe_batches={len(batch_rows)}")
    print(f"city_family_probe_batch_commands={len(batch_command_rows)}")
    print(f"raw_adjacent_owner_probe_candidates={len(raw_adjacent_rows)}")
    print(f"city_activation_readout={len(city_rows)}")
    print(f"output={args.output}")
    print(f"doc={args.doc}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
