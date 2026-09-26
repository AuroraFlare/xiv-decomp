#!/usr/bin/env python3
"""Build a city-state seasonal furnishing/decor activation atlas."""

from __future__ import annotations

import argparse
import csv
import re
import struct
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path


DEFAULT_OUTPUT = Path("outputs/citystate-seasonal-furnishing-decomp-atlas-20260703")
DEFAULT_DOC = Path("docs/citystate_seasonal_furnishing_decomp_atlas_2026-07-03.md")
DEFAULT_CLIENT_ROOT = Path("C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV")

REGION_RESOURCE_CSV = Path(
    "tools/outputs/lpb/airship_ferry_region_resource_data_20260621/region_resource_all_rows.csv"
)
SPAWN_SQL = Path("Data/sql/server_eventnpc_spawn_locations.sql")
MAPOBJ_SQL = Path("Data/sql/server_eventnpc_mapobj.sql")
ACTOR_CLASS_SQL = Path("Data/sql/gamedata_actor_class.sql")
MAP_CONFIG = Path("Data/map_config.ini")
WEATHER_PACKET = Path("Map Server/Packets/Send/SetWeatherPacket.cs")
WEATHER_COMMAND = Path("Data/scripts/commands/gm/weather.lua")
SPAWNBGOBJ_COMMAND = Path("Data/scripts/commands/gm/spawnbgobj.lua")
MAPOBJ_FIREWORKS_LUA = Path(
    "tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/mapobj/mapobjfireworks.lua"
)

CITY_LAYOUT_TOKENS = {
    "sea_s0_twn01": ("Limsa Lominsa", 121),
    "sea_s0_ind01": ("Limsa Lominsa", 131),
    "sea_s0_lin01": ("Limsa Lominsa", 196),
    "fst_f0_twn01": ("Gridania", 321),
    "fst_f0_ind01": ("Gridania", 331),
    "fst_f0_air01": ("Gridania", 391),
    "wil_w0_twn01": ("Ul'dah", 421),
    "wil_w0_twn02": ("Ul'dah", 422),
    "wil_w0_ind01": ("Ul'dah", 431),
}

CITY_LAYOUT_IDS = {
    121: "Limsa Lominsa",
    131: "Limsa Lominsa",
    196: "Limsa Lominsa",
    321: "Gridania",
    331: "Gridania",
    391: "Gridania",
    421: "Ul'dah",
    422: "Ul'dah",
    431: "Ul'dah",
}

CITY_ZONE_IDS = {
    133: "Limsa Lominsa",
    155: "Gridania",
    175: "Ul'dah",
}

WEATHER_TOKENS = {
    "wtr_hall": {
        "event": "All Saints / seasonal overlay",
        "activation": "!weather seasonal (8027)",
        "confidence": "medium",
        "notes": "Token name and strings point to Halloween/seasonal resources; local server comment says generic seasonal/snow.",
    },
    "wtr_smmn": {
        "event": "Primal/summon weather overlay",
        "activation": "!weather primal (8028)",
        "confidence": "medium",
        "notes": "Probably not city furnishing, but included because it sits in the same special-weather range.",
    },
    "wtr_smmr": {
        "event": "Moonfire / summer fireworks overlay",
        "activation": "!weather fireworks (8029) or map_config fireworks_enabled=true",
        "confidence": "high",
        "notes": "Matches local WEATHER_SEASONAL_FIREWORKS and the timed fireworks WeatherManager path.",
    },
    "wtr_comp": {
        "event": "Dalamud/comet weather overlay",
        "activation": "!weather dalamud (8030)",
        "confidence": "medium",
        "notes": "Comet/Dalamud sky resource surface.",
    },
    "wtr_chry": {
        "event": "Aurora/hanabi/star overlay",
        "activation": "!weather aurora (8031)",
        "confidence": "medium",
        "notes": "Several DATs expose star/hanabi/VFX strings; local server names this Aurora.",
    },
    "wtr_xmas": {
        "event": "Starlight / Xmas weather-resource overlay",
        "activation": "!weather dalamudthunder (8032) or !weather 8032",
        "confidence": "high",
        "notes": "RegionResourceData token is wtr_xmas, while local server names 8032 Dalamud thunder.",
    },
}

STRING_PATTERNS = (
    "wtr_",
    "xmas",
    "hall",
    "hallo",
    "smmr",
    "smmn",
    "comp",
    "chry",
    "hanabi",
    "fire",
    "star",
    "vfx",
    "schedul",
    "time_",
    "flag",
    "gcflag",
    "gatflag",
    "sgrp",
    "event",
    "tree",
    "sdef_",
)

SQL_TUPLE_RE = re.compile(r"\(([^()]*)\)")
PRINTABLE_RE = re.compile(rb"[\x20-\x7e]{4,}")
PUBLIC_REGION_RE = re.compile(r"gra_rapture/bg/public/([^/\s]+)/")
RESOURCE_PATH_RE = re.compile(r"gra_rapture/[A-Za-z0-9_./-]+")


def read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8", errors="replace")


def parse_sql_values(payload: str) -> list[str]:
    reader = csv.reader([payload], delimiter=",", quotechar="'", escapechar="\\", skipinitialspace=True)
    return [value.strip().strip("'") for value in next(reader)]


def iter_sql_value_rows(path: Path) -> list[list[str]]:
    rows: list[list[str]] = []
    body = read_text(path)
    for line in body.splitlines():
        line = line.strip()
        if not line.startswith("("):
            continue
        line = re.sub(r"\s*--.*$", "", line).rstrip(",;")
        match = SQL_TUPLE_RE.search(line)
        if match:
            rows.append(parse_sql_values(match.group(1)))
    return rows


def read_region_rows(path: Path) -> list[dict[str, str]]:
    if not path.exists():
        return []
    with path.open(newline="", encoding="utf-8-sig") as handle:
        return list(csv.DictReader(handle))


def read_spawns() -> dict[int, dict[str, object]]:
    spawns: dict[int, dict[str, object]] = {}
    for values in iter_sql_value_rows(SPAWN_SQL):
        if len(values) < 11:
            continue
        spawn_id = int(values[0])
        spawns[spawn_id] = {
            "spawn_id": spawn_id,
            "actor_class_id": int(values[1]),
            "unique_id": values[2],
            "zone_id": int(values[3]),
            "private_area_name": values[4],
            "private_area_level": int(values[5]),
            "x": values[6],
            "y": values[7],
            "z": values[8],
            "rotation": values[9],
            "motion_pack": values[10],
        }
    return spawns


def read_mapobj_bindings() -> dict[int, list[dict[str, int]]]:
    bindings: dict[int, list[dict[str, int]]] = defaultdict(list)
    for values in iter_sql_value_rows(MAPOBJ_SQL):
        if len(values) < 3:
            continue
        spawn_id = int(values[0])
        bindings[spawn_id].append(
            {
                "spawn_id": spawn_id,
                "layout_id": int(values[1]),
                "instance_id": int(values[2]),
            }
        )
    return bindings


def read_actor_classes() -> dict[int, str]:
    classes: dict[int, str] = {}
    for values in iter_sql_value_rows(ACTOR_CLASS_SQL):
        if len(values) < 2:
            continue
        classes[int(values[0])] = values[1]
    return classes


def client_root_from_source(source_hint: str) -> Path:
    if not source_hint:
        return DEFAULT_CLIENT_ROOT
    source_path = Path(source_hint)
    for index, part in enumerate(source_path.parts):
        if part.lower() == "data":
            return Path(*source_path.parts[:index])
    return DEFAULT_CLIENT_ROOT


def dat_key_to_path(key_hex: str, source_hint: str = "") -> Path:
    value = int(key_hex, 16)
    client_root = client_root_from_source(source_hint)
    return (
        client_root
        / "data"
        / f"{(value >> 24) & 0xFF:02X}"
        / f"{(value >> 16) & 0xFF:02X}"
        / f"{(value >> 8) & 0xFF:02X}"
        / f"{value & 0xFF:02X}.DAT"
    )


def extract_strings(path: Path, limit: int = 40) -> dict[str, object]:
    result: dict[str, object] = {
        "dat_path": path.as_posix(),
        "exists": path.exists(),
        "size_hex": "",
        "entry_count": "",
        "scheduler_hits": 0,
        "flag_scheduler_hits": 0,
        "seasonal_string_hits": 0,
        "physical_region_hint": "",
        "interesting_strings": "",
    }
    if not path.exists():
        return result

    data = path.read_bytes()
    result["size_hex"] = f"0x{len(data):X}"
    if len(data) >= 0x28:
        table_size = struct.unpack_from("<I", data, 0x20)[0]
        if table_size and table_size % 0x20 == 0:
            result["entry_count"] = str(table_size // 0x20)

    strings = []
    seen: set[str] = set()
    for match in PRINTABLE_RE.finditer(data):
        value = match.group(0).decode("ascii", errors="ignore")
        lowered = value.lower()
        if any(pattern in lowered for pattern in STRING_PATTERNS):
            if value not in seen:
                seen.add(value)
                strings.append(value)

    joined = "\n".join(strings).lower()
    result["scheduler_hits"] = joined.count("schedul")
    result["flag_scheduler_hits"] = sum(
        1
        for value in strings
        if any(token in value.lower() for token in ("time_bg_flag", "gcflag", "gatflag", "sgrp_"))
    )
    result["seasonal_string_hits"] = sum(
        1
        for value in strings
        if any(token in value.lower() for token in ("xmas", "hallo", "smmr", "hanabi", "fire", "star", "event"))
    )
    region_match = PUBLIC_REGION_RE.search("\n".join(strings))
    if region_match:
        result["physical_region_hint"] = region_match.group(1)

    preferred = sorted(
        strings,
        key=lambda item: (
            not item.lower().startswith("gra_rapture/"),
            not any(token in item.lower() for token in ("xmas", "hallo", "smmr", "hanabi", "fire")),
            len(item),
            item,
        ),
    )
    result["interesting_strings"] = " | ".join(preferred[:limit])
    return result


def extract_resource_paths(interesting_strings: str) -> list[str]:
    paths: list[str] = []
    for match in RESOURCE_PATH_RE.finditer(interesting_strings):
        value = match.group(0)
        if value not in paths:
            paths.append(value)
    return paths


def grouped_resource_rows(region_rows: list[dict[str, str]], tokens: set[str]) -> list[dict[str, object]]:
    grouped: dict[tuple[str, str, str], dict[str, object]] = {}
    for row in region_rows:
        token = row.get("resource_token", "")
        if token not in tokens:
            continue
        key = (row.get("id", ""), token, row.get("dat_key_hex", ""))
        if key not in grouped:
            grouped[key] = {
                "id": row.get("id", ""),
                "token": token,
                "dat_key_hex": row.get("dat_key_hex", ""),
                "sources": [],
                "offsets": [],
            }
        if row.get("source", "") not in grouped[key]["sources"]:
            grouped[key]["sources"].append(row.get("source", ""))
        grouped[key]["offsets"].append(row.get("offset_dec", ""))
    return list(grouped.values())


def build_weather_rows(region_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for row in grouped_resource_rows(region_rows, set(WEATHER_TOKENS)):
        token = str(row["token"])
        dat_key_hex = str(row["dat_key_hex"])
        source_region_table = " | ".join(str(source) for source in row["sources"])
        scan = extract_strings(dat_key_to_path(dat_key_hex, source_region_table))
        info = WEATHER_TOKENS[token]
        rows.append(
            {
                "weather_id": row["id"],
                "token": token,
                "inferred_event": info["event"],
                "dat_key_hex": dat_key_hex,
                "dat_path": scan["dat_path"],
                "dat_exists": scan["exists"],
                "physical_region_hint": scan["physical_region_hint"],
                "source_region_table": source_region_table,
                "source_occurrences": len(row["offsets"]),
                "source_offsets": " | ".join(str(offset) for offset in row["offsets"][:20]),
                "size_hex": scan["size_hex"],
                "entry_count": scan["entry_count"],
                "scheduler_hits": scan["scheduler_hits"],
                "interesting_strings": scan["interesting_strings"],
                "resource_paths": " | ".join(extract_resource_paths(str(scan["interesting_strings"]))),
                "activation_surface": info["activation"],
                "confidence": info["confidence"],
                "notes": info["notes"],
            }
        )
    return sorted(rows, key=lambda item: (int(str(item["weather_id"]) or 0), str(item["token"]), str(item["dat_key_hex"])))


def build_town_rows(
    region_rows: list[dict[str, str]],
    mapobj_bindings: dict[int, list[dict[str, int]]],
) -> list[dict[str, object]]:
    layout_counts = Counter()
    for binding_rows in mapobj_bindings.values():
        for binding in binding_rows:
            layout_counts[binding["layout_id"]] += 1

    rows: list[dict[str, object]] = []
    for row in grouped_resource_rows(region_rows, set(CITY_LAYOUT_TOKENS)):
        token = str(row["token"])
        city_state, layout_id = CITY_LAYOUT_TOKENS[token]
        dat_key_hex = str(row["dat_key_hex"])
        source_region_table = " | ".join(str(source) for source in row["sources"])
        scan = extract_strings(dat_key_to_path(dat_key_hex, source_region_table), limit=60)
        notes = []
        if int(scan["flag_scheduler_hits"]) > 0:
            notes.append("DAT exposes flag/scheduler strings; likely preauthored layout groups are toggled rather than hand-placed.")
        if int(scan["seasonal_string_hits"]) > 0:
            notes.append("DAT contains seasonal/event-looking strings.")
        if layout_counts[layout_id]:
            notes.append("Server already binds map objects against this layout id.")
        rows.append(
            {
                "layout_id": layout_id,
                "token": token,
                "city_state": city_state,
                "dat_key_hex": dat_key_hex,
                "dat_path": scan["dat_path"],
                "dat_exists": scan["exists"],
                "physical_region_hint": scan["physical_region_hint"],
                "source_region_table": source_region_table,
                "source_occurrences": len(row["offsets"]),
                "source_offsets": " | ".join(str(offset) for offset in row["offsets"][:20]),
                "size_hex": scan["size_hex"],
                "entry_count": scan["entry_count"],
                "scheduler_hits": scan["scheduler_hits"],
                "flag_scheduler_hits": scan["flag_scheduler_hits"],
                "seasonal_string_hits": scan["seasonal_string_hits"],
                "existing_mapobj_bindings": layout_counts[layout_id],
                "interesting_strings": scan["interesting_strings"],
                "notes": " ".join(notes) if notes else "No obvious seasonal flag strings in printable scan.",
            }
        )
    return sorted(rows, key=lambda item: (str(item["city_state"]), int(item["layout_id"])))


def city_for_binding(zone_id: int, layout_id: int) -> str:
    if zone_id in CITY_ZONE_IDS:
        return CITY_ZONE_IDS[zone_id]
    if layout_id in CITY_LAYOUT_IDS:
        return CITY_LAYOUT_IDS[layout_id]
    return ""


def activation_hint(actor_class_id: int, class_path: str, layout_id: int, unique_id: str) -> str:
    lowered = f"{class_path} {unique_id}".lower()
    if actor_class_id in {5900036, 5900037, 5900038}:
        return "MapObjFireworks script actor; needs spawn/controller row before scheduler can run."
    if "mapobj" in class_path.lower() or actor_class_id >= 5900000:
        return "Map object binding; test with !spawnbgobj placed <spawn_id> or current SQL spawn path."
    if layout_id in CITY_LAYOUT_IDS:
        return "City-state layout binding; may be a controller, blocker, door, or decor group handle."
    if "door" in lowered or "gate" in lowered or "shipport" in lowered:
        return "Existing city infrastructure object; probably not seasonal decor."
    return "Spawn has mapobj layout/instance metadata."


def build_mapobj_rows(
    spawns: dict[int, dict[str, object]],
    mapobj_bindings: dict[int, list[dict[str, int]]],
    actor_classes: dict[int, str],
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for spawn_id, binding_rows in mapobj_bindings.items():
        spawn = spawns.get(spawn_id, {})
        actor_class_id = int(spawn.get("actor_class_id", 0) or 0)
        class_path = actor_classes.get(actor_class_id, "")
        for binding in binding_rows:
            layout_id = binding["layout_id"]
            zone_id = int(spawn.get("zone_id", 0) or 0)
            city_state = city_for_binding(zone_id, layout_id)
            if not city_state and actor_class_id not in {5900036, 5900037, 5900038}:
                continue
            rows.append(
                {
                    "spawn_id": spawn_id,
                    "zone_id": zone_id,
                    "city_state": city_state,
                    "actor_class_id": actor_class_id,
                    "class_path": class_path,
                    "unique_id": spawn.get("unique_id", ""),
                    "layout_id": layout_id,
                    "instance_id": binding["instance_id"],
                    "x": spawn.get("x", ""),
                    "y": spawn.get("y", ""),
                    "z": spawn.get("z", ""),
                    "rotation": spawn.get("rotation", ""),
                    "activation_hint": activation_hint(actor_class_id, class_path, layout_id, str(spawn.get("unique_id", ""))),
                }
            )

    present_spawn_actor_ids = {int(spawn.get("actor_class_id", 0) or 0) for spawn in spawns.values()}
    for actor_class_id in (5900036, 5900037, 5900038):
        if actor_class_id in present_spawn_actor_ids:
            continue
        rows.append(
            {
                "spawn_id": "",
                "zone_id": "",
                "city_state": "",
                "actor_class_id": actor_class_id,
                "class_path": actor_classes.get(actor_class_id, "/Chara/Npc/MapObj/MapObjFireworks"),
                "unique_id": "",
                "layout_id": "",
                "instance_id": "",
                "x": "",
                "y": "",
                "z": "",
                "rotation": "",
                "activation_hint": "Actor class exists, but no local spawn row was found.",
            }
        )

    return sorted(
        rows,
        key=lambda item: (
            str(item["city_state"]),
            int(item["layout_id"] or 0),
            int(item["instance_id"] or 0),
            int(item["spawn_id"] or 0),
        ),
    )


def config_value(path: Path, key: str) -> str:
    body = read_text(path)
    match = re.search(rf"^\s*{re.escape(key)}\s*=\s*(\S+)", body, flags=re.MULTILINE | re.IGNORECASE)
    return match.group(1) if match else ""


def contains(path: Path, needle: str) -> bool:
    return needle.lower() in read_text(path).lower()


def build_activation_candidates(
    weather_rows: list[dict[str, object]],
    town_rows: list[dict[str, object]],
    mapobj_rows: list[dict[str, object]],
) -> list[dict[str, object]]:
    seen_weather = {str(row["token"]) for row in weather_rows}
    firework_spawn_rows = [row for row in mapobj_rows if int(row["actor_class_id"] or 0) in {5900036, 5900037, 5900038} and row["spawn_id"]]
    city_town_flag_rows = [row for row in town_rows if int(row["flag_scheduler_hits"] or 0) > 0]

    candidates: list[dict[str, object]] = []
    for token, info in WEATHER_TOKENS.items():
        if token not in seen_weather:
            continue
        status = "manual_weather_test_candidate"
        if token == "wtr_smmr":
            status = "already_runtime_flagged"
        if token == "wtr_smmn":
            status = "nonseasonal_special_weather_neighbor"
        weather_ids = sorted({row["weather_id"] for row in weather_rows if row["token"] == token})
        candidates.append(
            {
                "surface": f"weather:{'/'.join(weather_ids)} {token}",
                "status": status,
                "confidence": info["confidence"],
                "evidence": f"RegionResourceData token {token}; activation surface {info['activation']}.",
                "next_probe": info["activation"],
                "notes": info["notes"],
            }
        )

    candidates.append(
        {
            "surface": "config:fireworks_enabled",
            "status": "already_runtime_flagged",
            "confidence": "high",
            "evidence": f"Data/map_config.ini fireworks_enabled={config_value(MAP_CONFIG, 'fireworks_enabled') or 'missing'}; WeatherManager routes it to weather 8029 at night.",
            "next_probe": "Set fireworks_enabled=true, restart map server, visit a city at 20:00-05:59 Eorzea time.",
            "notes": "This controls the weather/VFX overlay path, not all furnishing layout groups.",
        }
    )

    candidates.append(
        {
            "surface": "mapobj:5900036/5900037/5900038 MapObjFireworks",
            "status": "actor_class_present_no_spawn_rows" if not firework_spawn_rows else "spawn_rows_present",
            "confidence": "high",
            "evidence": "Actor class rows exist; recovered MapObjFireworks runs v_l#/v_c#/v_r# schedulers at Hydaelyn night; no local SQL spawn rows were found."
            if not firework_spawn_rows
            else f"{len(firework_spawn_rows)} MapObjFireworks spawn rows found.",
            "next_probe": "!spawnbgobj <layoutId> <instanceId> 5900036 or add a guarded spawn row after identifying retail layout/instance.",
            "notes": "This is likely a controller for authored BG schedulers, not furniture item placement.",
        }
    )

    candidates.append(
        {
            "surface": "city-town-layout flag/scheduler groups",
            "status": "town_layout_scheduler_present_needs_bg_scheduler_bridge"
            if city_town_flag_rows
            else "town_layout_printable_scan_sparse",
            "confidence": "medium",
            "evidence": "; ".join(f"{row['city_state']} {row['token']} flag_scheduler_hits={row['flag_scheduler_hits']}" for row in city_town_flag_rows)
            or "No town DAT flag strings were found by printable scan.",
            "next_probe": "Find which city NPC/controller calls _runBgScheduler or _runBgSchedulerFromMidstream for time_bg_flag*/sgrp_* names.",
            "notes": "This supports the hunch that some city decor is preauthored in the city-state layout and toggled by scheduler state.",
        }
    )

    candidates.append(
        {
            "surface": "gm:weather command aliases",
            "status": "manual_probe_ready",
            "confidence": "high",
            "evidence": f"{WEATHER_COMMAND.as_posix()} exposes seasonal/primal/fireworks/dalamud/aurora/dalamudthunder aliases.",
            "next_probe": "!weather 8027 0 1, !weather 8029 0 1, !weather 8032 0 1 in city zones.",
            "notes": "Use zonewide=1 only on a test server/session.",
        }
    )

    candidates.append(
        {
            "surface": "gm:spawnbgobj command",
            "status": "manual_probe_ready",
            "confidence": "high",
            "evidence": f"{SPAWNBGOBJ_COMMAND.as_posix()} can bind layoutId/instanceId and optionally actorClassId for a player.",
            "next_probe": "!spawnbgobj list <cityZoneId>; !spawnbgobj placed <spawnLocationId> 5900001; !spawnbgobj <layoutId> <instanceId> 5900036",
            "notes": "Best path for probing layout/instance IDs without permanently editing SQL.",
        }
    )

    if contains(WEATHER_PACKET, "WEATHER_DALAMUD_THUNDER       = 8032"):
        candidates.append(
            {
                "surface": "naming-mismatch:8032",
                "status": "constant_name_mismatch",
                "confidence": "high",
                "evidence": "SetWeatherPacket names 8032 WEATHER_DALAMUD_THUNDER, but RegionResourceData repeatedly labels 8032 as wtr_xmas.",
                "next_probe": "!weather 8032 0 1 in Limsa/Gridania/Ul'dah and screenshot/log loaded resources.",
                "notes": "Treat 8032 as a resource-token finding until visually tested.",
            }
        )

    return candidates


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        path.write_text("", encoding="utf-8")
        return
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)


def markdown_list(rows: list[dict[str, object]], key: str, limit: int = 12) -> str:
    values = Counter(str(row[key]) for row in rows if str(row.get(key, "")))
    if not values:
        return "none"
    return ", ".join(f"{name}={count}" for name, count in values.most_common(limit))


def write_doc(
    path: Path,
    weather_rows: list[dict[str, object]],
    town_rows: list[dict[str, object]],
    mapobj_rows: list[dict[str, object]],
    activation_rows: list[dict[str, object]],
    output: Path,
) -> None:
    weather_ids = sorted({str(row["weather_id"]) for row in weather_rows})
    city_bindings = [row for row in mapobj_rows if str(row.get("city_state", ""))]
    no_spawn_fireworks = [
        row
        for row in mapobj_rows
        if int(row["actor_class_id"] or 0) in {5900036, 5900037, 5900038} and not row["spawn_id"]
    ]
    doc = f"""# City-State Seasonal Furnishing Decomp Atlas - 2026-07-03

Generated: {datetime.now(timezone.utc).replace(microsecond=0).isoformat()}

## Inputs

- Region/resource rows: `{REGION_RESOURCE_CSV}`
- Map-object spawn SQL: `{SPAWN_SQL}` + `{MAPOBJ_SQL}`
- Actor class SQL: `{ACTOR_CLASS_SQL}`
- Weather constants/GM command: `{WEATHER_PACKET}` / `{WEATHER_COMMAND}`
- Temporary map-object GM command: `{SPAWNBGOBJ_COMMAND}`
- Recovered MapObjFireworks script: `{MAPOBJ_FIREWORKS_LUA}`

## Summary

- Special weather resource rows inventoried: {len(weather_rows)}
- Special weather IDs seen: {', '.join(weather_ids)}
- City town layout rows inventoried: {len(town_rows)}
- City map-object bindings surfaced: {len(city_bindings)}
- MapObjFireworks actor classes without local spawn rows: {len(no_spawn_fireworks)}
- Weather token counts: {markdown_list(weather_rows, "token")}
- Town layout flag/scheduler counts: {markdown_list(town_rows, "token")}

## Readout

- Your hunch looks right for a big slice of this: several event city visuals are exposed as region/weather resources, not manually placed furnishing items.
- `wtr_smmr` is the cleanest existing path. RegionResourceData maps it to weather `8029`, and the local server already has `fireworks_enabled` plus `!weather fireworks`.
- `wtr_xmas` is the spicy one. RegionResourceData repeatedly maps Xmas/Starlight resources to weather `8032`, while the current server constant calls `8032` Dalamud Thunder. That should be tested visually before renaming or wiring it.
- `wtr_hall`, `wtr_chry`, `wtr_comp`, and `wtr_smmn` sit in the same special-weather range. Their token names and embedded strings suggest All Saints, star/hanabi/aurora, comet/Dalamud, and primal/summon surfaces.
- The city-town DATs also expose scheduler/flag strings, especially Gridania and Ul'dah. That means some decor groups are probably authored in the city-state layout and toggled by BG scheduler state.
- `MapObjFireworks` actor classes `5900036`, `5900037`, and `5900038` exist and have recovered script behavior, but there are no local spawn rows for them. They need a layout/instance/controller probe rather than item grants.

## Best Next Probes

1. In a test session, use `!weather fireworks 0 1` in each city and confirm `wtr_smmr` behavior.
2. Probe `!weather 8032 0 1` in Limsa/Gridania/Ul'dah and compare against Starlight/Xmas resource loading.
3. Probe `!weather seasonal 0 1` for `wtr_hall`/seasonal-overlay behavior.
4. Use `!spawnbgobj list <zoneId>` and `!spawnbgobj placed <spawnLocationId>` to inspect current city layout/instance handles.
5. For fireworks controllers, test temporary `!spawnbgobj <layoutId> <instanceId> 5900036` only after finding likely retail layout/instance pairs.

## Output Files

- `{output / "weather_resource_surfaces.csv"}`
- `{output / "city_town_layout_surfaces.csv"}`
- `{output / "mapobj_binding_surfaces.csv"}`
- `{output / "activation_candidates.csv"}`

## Cautions

- Weather IDs are resource evidence plus local constant names; they are not a complete retail semantics claim until visually tested.
- `seasonal_quests_enabled` is an NPC/quest gate. It does not appear to be the main city furnishing/decor switch.
- Do not permanently add MapObjFireworks spawn rows until the layout/instance pair is confirmed. Temporary GM spawning is the safer probe.
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
    region_rows = read_region_rows(REGION_RESOURCE_CSV)
    spawns = read_spawns()
    mapobj_bindings = read_mapobj_bindings()
    actor_classes = read_actor_classes()

    weather_rows = build_weather_rows(region_rows)
    town_rows = build_town_rows(region_rows, mapobj_bindings)
    mapobj_rows = build_mapobj_rows(spawns, mapobj_bindings, actor_classes)
    activation_rows = build_activation_candidates(weather_rows, town_rows, mapobj_rows)

    write_csv(args.output / "weather_resource_surfaces.csv", weather_rows)
    write_csv(args.output / "city_town_layout_surfaces.csv", town_rows)
    write_csv(args.output / "mapobj_binding_surfaces.csv", mapobj_rows)
    write_csv(args.output / "activation_candidates.csv", activation_rows)
    write_doc(args.doc, weather_rows, town_rows, mapobj_rows, activation_rows, args.output)

    print(f"weather_resource_surfaces={len(weather_rows)}")
    print(f"city_town_layout_surfaces={len(town_rows)}")
    print(f"mapobj_binding_surfaces={len(mapobj_rows)}")
    print(f"activation_candidates={len(activation_rows)}")
    print(f"output={args.output}")
    print(f"doc={args.doc}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
