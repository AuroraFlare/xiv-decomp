#!/usr/bin/env python3
"""Build a deeper scheduler/string atlas for city-state seasonal decor."""

from __future__ import annotations

import argparse
import csv
import re
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path

from build_citystate_furnishing_decomp_atlas import (
    ACTOR_CLASS_SQL,
    CITY_LAYOUT_TOKENS,
    MAPOBJ_SQL,
    REGION_RESOURCE_CSV,
    SPAWN_SQL,
    WEATHER_TOKENS,
    dat_key_to_path,
    grouped_resource_rows,
    read_actor_classes,
    read_mapobj_bindings,
    read_region_rows,
    read_spawns,
    read_text,
)


DEFAULT_OUTPUT = Path("outputs/citystate-seasonal-scheduler-decomp-atlas-20260703")
DEFAULT_DOC = Path("docs/citystate_scheduler_decomp_atlas_2026-07-03.md")
MAP_LAYOUT_RESOURCE_OUTPUT = Path("tools/outputs/lpb/map_layout_resource_data_20260621")
DECOMP_LUA_ROOTS = (
    Path("Data/scripts"),
    Path("tools/outputs/lpb/decomp_further_20260617/lua"),
    Path("tools/outputs/lpb/decomp_more_20260617/lua"),
)
MAPOBJ_ONLY_SHOW_HIDE_LUA = Path(
    "tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/mapobj/mapobjonlyshowhide.lua"
)
MAPOBJ_FIREWORKS_LUA = Path(
    "tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/mapobj/mapobjfireworks.lua"
)

TOKEN_RE = re.compile(rb"[A-Za-z0-9_./-]{4,}")
FUNCTION_RE = re.compile(r"^\s*function\s+([^(]+)")
STRING_ARG_RE = re.compile(r'"([^"]*)"')
RUN_SCHEDULER_RE = re.compile(r"_runBgScheduler(?:FromMidstream)?")

INTERESTING_SUBSTRINGS = (
    "time_",
    "sgrp_",
    "isgrp_",
    "bg_",
    "vfx_",
    "wtr_",
    "xmas",
    "hall",
    "hallo",
    "hlw",
    "hlow",
    "smmr",
    "smmn",
    "hanabi",
    "fire",
    "star",
    "flag",
    "flg",
    "gcflag",
    "gatflag",
    "event",
    "sdef_",
    "tree",
    "gra_rapture/",
    ".reference.dst",
)

EVENT_HINTS = (
    ("xmas", "Starlight/Xmas"),
    ("hallo", "All Saints"),
    ("hlow", "All Saints/Halloween city decor"),
    ("hlw", "All Saints/Halloween city decor"),
    ("hall", "All Saints"),
    ("smmr", "Moonfire/summer"),
    ("hanabi", "Moonfire/fireworks"),
    ("firework", "Moonfire/fireworks"),
    ("vfx_hanabi", "Moonfire/fireworks"),
    ("wtr_chry", "Aurora/star/hanabi"),
    ("chry", "Aurora/star/hanabi"),
    ("star", "Aurora/star"),
    ("comp", "Dalamud/comet"),
    ("dalamud", "Dalamud/comet"),
    ("smmn", "Primal/summon"),
    ("gcflag", "Grand Company/Foundation flag"),
    ("gatflag", "City gate/flag group"),
    ("flag", "City flag/decor"),
    ("tree", "City prop/tree"),
)

CITY_FROM_REGION_TOKEN = {
    "sea_s0": "Limsa Lominsa",
    "fst_f0": "Gridania",
    "wil_w0": "Ul'dah",
}

DECOR_ACTOR_CLASSES = {
    5900006: "MapObjOnlyShowHide show actor",
    5900007: "MapObjOnlyShowHide hide actor",
    5900036: "MapObjFireworks controller",
    5900037: "MapObjFireworks controller",
    5900038: "MapObjFireworks controller",
}


def interesting_token(value: str) -> bool:
    lowered = value.lower()
    return any(part in lowered for part in INTERESTING_SUBSTRINGS)


def classify_string(value: str) -> str:
    lowered = value.lower()
    if "gra_rapture/" in lowered or lowered.endswith(".reference.dst"):
        return "resource_path"
    if lowered.startswith("time_"):
        return "time_scheduler"
    if lowered.startswith(("sgrp_", "isgrp_")):
        return "scheduler_group"
    if "gcflag" in lowered or "gatflag" in lowered or "flag" in lowered or "flg" in lowered:
        return "flag_or_decor_group"
    if lowered.startswith(("vfx_", "sdef_")):
        return "vfx_or_scene_def"
    if lowered.startswith("wtr_"):
        return "weather_token"
    if any(token in lowered for token in ("xmas", "hallo", "smmr", "hanabi", "star", "fire", "tree")):
        return "event_asset_or_group"
    return "interesting"


def event_hint(value: str) -> str:
    lowered = value.lower()
    for needle, label in EVENT_HINTS:
        if needle in lowered:
            return label
    return ""


def city_from_string(value: str) -> str:
    lowered = value.lower()
    for token, city in CITY_FROM_REGION_TOKEN.items():
        if f"/{token}/" in lowered or lowered.startswith(token):
            return city
    return ""


def group_hint(value: str) -> str:
    lowered = value.lower()
    if lowered.endswith("_show"):
        return "show"
    if lowered.endswith("_hide"):
        return "hide"
    if lowered.endswith("_lop0"):
        return "loop"
    if lowered.startswith("time_"):
        return "time"
    if lowered.startswith(("sgrp_", "isgrp_")):
        return "group"
    return ""


def extract_interesting_tokens(path: Path) -> list[dict[str, object]]:
    if not path.exists():
        return []
    data = path.read_bytes()
    rows: list[dict[str, object]] = []
    seen: set[str] = set()
    for match in TOKEN_RE.finditer(data):
        value = match.group(0).decode("ascii", errors="ignore")
        if value in seen or not interesting_token(value):
            continue
        seen.add(value)
        rows.append(
            {
                "offset_hex": f"0x{match.start():08X}",
                "offset_dec": match.start(),
                "string": value,
                "string_class": classify_string(value),
                "event_hint": event_hint(value),
                "group_hint": group_hint(value),
                "string_city_hint": city_from_string(value),
            }
        )
    return rows


def source_occurrences(row: dict[str, object]) -> int:
    offsets = row.get("offsets", [])
    return len(offsets) if isinstance(offsets, list) else 0


def build_target_string_rows(region_rows: list[dict[str, str]]) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    city_rows: list[dict[str, object]] = []
    weather_rows: list[dict[str, object]] = []
    targets = grouped_resource_rows(region_rows, set(CITY_LAYOUT_TOKENS) | set(WEATHER_TOKENS))
    for target in targets:
        token = str(target["token"])
        dat_key_hex = str(target["dat_key_hex"])
        sources = " | ".join(str(source) for source in target.get("sources", []))
        dat_path = dat_key_to_path(dat_key_hex, sources)
        token_rows = extract_interesting_tokens(dat_path)
        if token in CITY_LAYOUT_TOKENS:
            city_state, layout_id = CITY_LAYOUT_TOKENS[token]
            for row in token_rows:
                city_rows.append(
                    {
                        "city_state": city_state,
                        "layout_id": layout_id,
                        "resource_token": token,
                        "dat_key_hex": dat_key_hex,
                        "dat_path": dat_path.as_posix(),
                        "dat_exists": dat_path.exists(),
                        "source_occurrences": source_occurrences(target),
                        **row,
                    }
                )
        else:
            info = WEATHER_TOKENS[token]
            for row in token_rows:
                weather_rows.append(
                    {
                        "weather_id": target["id"],
                        "resource_token": token,
                        "inferred_event": info["event"],
                        "dat_key_hex": dat_key_hex,
                        "dat_path": dat_path.as_posix(),
                        "dat_exists": dat_path.exists(),
                        "source_occurrences": source_occurrences(target),
                        "city_hint": row["string_city_hint"],
                        **row,
                    }
                )
    return (
        sorted(city_rows, key=lambda item: (str(item["city_state"]), str(item["resource_token"]), str(item["string"]))),
        sorted(weather_rows, key=lambda item: (str(item["weather_id"]), str(item["resource_token"]), str(item["string"]))),
    )


def build_support_resource_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    if not MAP_LAYOUT_RESOURCE_OUTPUT.exists():
        return rows
    for path in sorted(MAP_LAYOUT_RESOURCE_OUTPUT.glob("strings_*.csv")):
        with path.open(newline="", encoding="utf-8-sig") as handle:
            reader = csv.DictReader(handle)
            for source_row in reader:
                value = source_row.get("string", "")
                if not interesting_token(value) or not event_hint(value):
                    continue
                rows.append(
                    {
                        "source_csv": path.as_posix(),
                        "resource_token": source_row.get("token", ""),
                        "offset_hex": source_row.get("offset_hex", ""),
                        "offset_dec": source_row.get("offset_dec", ""),
                        "string": value,
                        "string_class": source_row.get("classification", "") or classify_string(value),
                        "event_hint": event_hint(value),
                        "group_hint": group_hint(value),
                    }
                )
    return rows


def scheduler_event(base: str, hint: str) -> str:
    lowered = base.lower()
    if (
        "xmas" in lowered
        or lowered == "time_bg_crs1"
        or lowered.startswith("time_bg_itm0_pstr")
    ):
        return "Starlight/Xmas"
    if re.search(r"(?:^|_)hlw|(?:^|_)hw", lowered):
        return "All Saints/Halloween"
    if "smmr" in lowered or "hanabi" in lowered:
        return "Moonfire/fireworks"
    if "comp" in lowered:
        return "Dalamud/comet"
    return hint or "unclassified"


def build_paired_scheduler_rows(city_rows: list[dict[str, object]]) -> list[dict[str, object]]:
    grouped: dict[tuple[str, int, str, str, str], dict[str, dict[str, object]]] = defaultdict(dict)
    for row in city_rows:
        value = str(row.get("string", ""))
        match = re.match(r"^(time_.+)_(show|hide)$", value)
        if not match:
            continue
        base, action = match.groups()
        key = (
            str(row["city_state"]),
            int(row["layout_id"]),
            str(row["resource_token"]),
            str(row["dat_key_hex"]),
            base,
        )
        grouped[key][action] = row

    rows: list[dict[str, object]] = []
    for (city, layout_id, token, dat_key, base), actions in sorted(grouped.items()):
        if "show" not in actions or "hide" not in actions:
            continue
        show = actions["show"]
        hide = actions["hide"]
        rows.append(
            {
                "city_state": city,
                "layout_id": layout_id,
                "resource_token": token,
                "dat_key_hex": dat_key,
                "scheduler_base": base,
                "event": scheduler_event(base, str(show.get("event_hint", ""))),
                "show_scheduler": f"{base}_show",
                "hide_scheduler": f"{base}_hide",
                "show_offset_hex": show["offset_hex"],
                "hide_offset_hex": hide["offset_hex"],
                "activation_status": "authored pair; owner/visual confirmation still required",
            }
        )
    return rows


def script_event_hint(path: Path, line: str, args: list[str]) -> str:
    joined = f"{path.as_posix()} {' '.join(args)} {line}".lower()
    if "fireworks" in joined or "v_l" in joined or "v_c" in joined or "v_r" in joined:
        return "Hatching-tide egg/fireworks controller"
    if "onlyshowhide" in joined:
        return "generic show/hide decor controller"
    if "shipport" in joined:
        return "transport/shipport scheduler"
    if "marketstand" in joined:
        return "market stand show/hide/customization"
    if "door" in joined:
        return "door/gate scheduler"
    return event_hint(joined)


def build_script_scheduler_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    seen_paths: set[Path] = set()
    for root in DECOMP_LUA_ROOTS:
        if not root.exists():
            continue
        for path in sorted(root.rglob("*.lua")):
            resolved = path.resolve()
            if resolved in seen_paths:
                continue
            seen_paths.add(resolved)
            current_function = ""
            for line_number, line in enumerate(read_text(path).splitlines(), start=1):
                match = FUNCTION_RE.match(line)
                if match:
                    current_function = match.group(1)
                if not RUN_SCHEDULER_RE.search(line):
                    continue
                call_method = "_runBgSchedulerFromMidstream" if "_runBgSchedulerFromMidstream" in line else "_runBgScheduler"
                args = STRING_ARG_RE.findall(line)
                rows.append(
                    {
                        "script_path": path.as_posix(),
                        "line": line_number,
                        "function": current_function,
                        "call_method": call_method,
                        "literal_scheduler_args": " | ".join(args),
                        "dynamic": "yes" if ".." in line or not args else "no",
                        "event_hint": script_event_hint(path, line, args),
                        "line_text": line.strip(),
                    }
                )

    for side in ("l", "c", "r"):
        for number in range(1, 6):
            rows.append(
                {
                    "script_path": MAPOBJ_FIREWORKS_LUA.as_posix(),
                    "line": 46,
                    "function": "MapObjFireworks.getFireworksSchedulor",
                    "call_method": "_runBgScheduler",
                    "literal_scheduler_args": f"v_{side}{number}",
                    "dynamic": "generated",
                    "event_hint": "Hatching-tide egg/fireworks controller",
                    "line_text": "Generated from return \"v_\" .. side .. random(1..5).",
                }
            )
    return sorted(rows, key=lambda item: (str(item["script_path"]), int(item["line"]), str(item["literal_scheduler_args"])))


def mapobj_behavior(actor_class_id: int, unique_id: str) -> str:
    if actor_class_id == 5900006:
        return "initForEvent runs scheduler show"
    if actor_class_id == 5900007:
        return "initForEvent runs scheduler hide"
    if actor_class_id in {5900036, 5900037, 5900038}:
        return "night loop runs generated v_l#/v_c#/v_r# fireworks schedulers"
    if "flag" in unique_id.lower() or "deco" in unique_id.lower():
        return "name suggests decor/flag; inspect actor class script"
    return ""


def build_mapobj_decor_rows() -> list[dict[str, object]]:
    spawns = read_spawns()
    bindings = read_mapobj_bindings()
    classes = read_actor_classes()
    rows: list[dict[str, object]] = []
    present_actor_classes = {int(spawn["actor_class_id"]) for spawn in spawns.values()}

    for spawn_id, spawn in sorted(spawns.items()):
        actor_class_id = int(spawn["actor_class_id"])
        unique_id = str(spawn["unique_id"])
        include = (
            actor_class_id in DECOR_ACTOR_CLASSES
            or any(token in unique_id.lower() for token in ("deco", "flag", "firework", "hanabi", "xmas", "hallo", "smmr"))
        )
        if not include:
            continue
        binding_rows = bindings.get(spawn_id, [{}])
        for binding in binding_rows:
            layout_id = binding.get("layout_id", "")
            instance_id = binding.get("instance_id", "")
            direct_probe = (
                f"!spawnbgobj placed {spawn_id} {actor_class_id}"
                if layout_id != ""
                else f"!spawnbgobj placed {spawn_id} {actor_class_id} force"
            )
            rows.append(
                {
                    "spawn_id": spawn_id,
                    "zone_id": spawn["zone_id"],
                    "private_area_name": spawn["private_area_name"],
                    "actor_class_id": actor_class_id,
                    "class_path": classes.get(actor_class_id, ""),
                    "unique_id": unique_id,
                    "layout_id": layout_id,
                    "instance_id": instance_id,
                    "x": spawn["x"],
                    "y": spawn["y"],
                    "z": spawn["z"],
                    "behavior": mapobj_behavior(actor_class_id, unique_id),
                    "direct_probe": direct_probe,
                    "layout_probe": f"!spawnbgobj {layout_id} {instance_id} {actor_class_id}" if layout_id != "" else "",
                    "notes": "MapObjOnlyShowHide class makes 5900006 a positive show probe and 5900007 a negative hide probe."
                    if actor_class_id in {5900006, 5900007}
                    else "",
                }
            )

    for actor_class_id in (5900036, 5900037, 5900038):
        if actor_class_id in present_actor_classes:
            continue
        rows.append(
            {
                "spawn_id": "",
                "zone_id": "",
                "private_area_name": "",
                "actor_class_id": actor_class_id,
                "class_path": classes.get(actor_class_id, "/Chara/Npc/MapObj/MapObjFireworks"),
                "unique_id": "",
                "layout_id": "",
                "instance_id": "",
                "x": "",
                "y": "",
                "z": "",
                "behavior": mapobj_behavior(actor_class_id, ""),
                "direct_probe": "!spawnbgobj <layoutId> <instanceId> 5900036",
                "layout_probe": "",
                "notes": "Actor class exists without local spawn rows; needs layout/instance discovery first.",
            }
        )
    return rows


def build_probe_rows(mapobj_rows: list[dict[str, object]]) -> list[dict[str, object]]:
    rows = [
        {
            "probe": "!weather moonfire 0 0",
            "surface": "weather 8029 / wtr_smmr",
            "expected_signal": "Moonfire/summer weather resource overlay",
            "risk": "smaller immediate packet, but still mutates Area.weatherNormal; restore after test",
        },
        {
            "probe": "!weather dalamudthunder 0 0",
            "surface": "weather 8032 / wtr_xmas",
            "expected_signal": "Dalamud thunder weather overlay (the resource token is misleading)",
            "risk": "weather-only probe; do not treat the internal wtr_xmas token as decor proof",
        },
        {
            "probe": "!eventdecor halloween info / !eventdecor starlight info",
            "surface": "weather 8027 / wtr_hall",
            "expected_signal": "area-specific combined-pack classification without sending a weather packet",
            "risk": "8027 is blocked from !weather and may only be applied by the matching !eventdecor control",
        },
        {
            "probe": "!weather clear 0 1",
            "surface": "weather restore",
            "expected_signal": "restore a normal clear packet zone-wide after manual weather probes",
            "risk": "use only after confirming no test relies on the special weather staying active",
        },
    ]
    for row in mapobj_rows:
        unique_id = str(row["unique_id"])
        if unique_id in {"merchward_mapobj_deco", "merchward_mapobj_flag"}:
            rows.append(
                {
                    "probe": row["direct_probe"],
                    "surface": f"{unique_id} layout={row['layout_id']} instance={row['instance_id']}",
                    "expected_signal": row["behavior"],
                    "risk": "temporary map-object spawn only; do not add DB rows until visible behavior is confirmed",
                }
            )
            rows.append(
                {
                    "probe": f"!spawnbgobj {row['layout_id']} {row['instance_id']} 5900007",
                    "surface": f"{unique_id} negative hide check",
                    "expected_signal": "same layout/instance should run hide through MapObjOnlyShowHide",
                    "risk": "confirms class 5900006 vs 5900007 polarity",
                }
            )
    rows.append(
        {
            "probe": "!spawnbgobj <layoutId> <instanceId> 5900036",
            "surface": "MapObjFireworks generated v_l#/v_c#/v_r# schedulers",
            "expected_signal": "nighttime fireworks scheduler if layout/instance has those BG scheduler names",
            "risk": "needs confirmed layout/instance; otherwise it may spawn a controller with nothing to drive",
        }
    )
    rows.append(
        {
            "probe": "!testbgscheduler target v_l1 0",
            "surface": "live MapObjFireworks scheduler poke",
            "expected_signal": "runs one authored fireworks BG scheduler on the targeted live map object",
            "risk": "target must be a live map-object NPC; scheduler names are limited to 1-8 printable ASCII chars",
        }
    )
    rows.append(
        {
            "probe": "!spawnbgmodel b933",
            "surface": "seasonal/furnishing model preview",
            "expected_signal": "preview a BG model appearance without proving layout activation",
            "risk": "model-identification only; does not prove city-state scheduler wiring",
        }
    )
    return rows


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        path.write_text("", encoding="utf-8")
        return
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)


def summarize_counter(rows: list[dict[str, object]], key: str, limit: int = 8) -> str:
    counts = Counter(str(row[key]) for row in rows if str(row.get(key, "")))
    if not counts:
        return "none"
    return ", ".join(f"{name}={count}" for name, count in counts.most_common(limit))


def write_doc(
    path: Path,
    output: Path,
    city_rows: list[dict[str, object]],
    weather_rows: list[dict[str, object]],
    support_rows: list[dict[str, object]],
    script_rows: list[dict[str, object]],
    mapobj_rows: list[dict[str, object]],
    probe_rows: list[dict[str, object]],
    paired_rows: list[dict[str, object]],
) -> None:
    mapobj_show_rows = [row for row in mapobj_rows if str(row["actor_class_id"]) == "5900006"]
    doc = f"""# City-State Scheduler Decomp Atlas - 2026-07-03

Generated: {datetime.now(timezone.utc).replace(microsecond=0).isoformat()}

## Inputs

- Region/resource rows: `{REGION_RESOURCE_CSV}`
- Client DAT targets: city public-town, interior, transit/airship layouts and special weather resources
- Existing map-layout resource dumps: `{MAP_LAYOUT_RESOURCE_OUTPUT}`
- Lua roots: `{', '.join(path.as_posix() for path in DECOMP_LUA_ROOTS)}`
- Map-object SQL: `{SPAWN_SQL}` / `{MAPOBJ_SQL}` / `{ACTOR_CLASS_SQL}`

## Summary

- City layout scheduler/decor strings: {len(city_rows)}
- Complete city layout show/hide pairs: {len(paired_rows)}
- Weather overlay scheduler/decor strings: {len(weather_rows)}
- Supporting region scheduler strings: {len(support_rows)}
- Script scheduler calls: {len(script_rows)}
- Map-object decor/controller candidates: {len(mapobj_rows)}
- Probe candidates: {len(probe_rows)}
- City string event hints: {summarize_counter(city_rows, "event_hint")}
- Weather string event hints: {summarize_counter(weather_rows, "event_hint")}
- Script scheduler hints: {summarize_counter(script_rows, "event_hint")}
- MapObjOnlyShowHide show rows: {len(mapobj_show_rows)}

## Readout

- The city-state public and interior DATs contain exact flag/decor scheduler names, not only generic resource references. `city_layout_paired_schedulers.csv` is the concise complete-pair inventory.
- Halloween pairs exist in all three city families. Exact October-to-December retail-patch diffs additionally authenticate five interior Starlight pairs: Gridania `time_bg_crs1`, Limsa `time_bg_itm0_pstr1_h/3_h`, and Ul'dah `time_bg_xmas1/2`.
- A string pair proves that the client authored a visibility scheduler. It does not by itself prove the owning instance or visible result, so the runtime command keeps unverified paths labeled experimental.
- The script side is mostly generic controllers. `MapObjOnlyShowHide` is important: actor class `5900006` runs scheduler `show`; actor class `5900007` runs `hide`.
- Existing SQL already has visible decor-shaped candidates: `merchward_mapobj_deco` and `merchward_mapobj_flag`, both actor class `5900006`, layout `5013`, instances `408` and `161`.
- `MapObjFireworks` is a different controller style. It dynamically runs `v_l#`, `v_c#`, and `v_r#` schedulers at Hydaelyn night, but local SQL still has no spawn rows for actor classes `5900036`-`5900038`.
- Supporting resource dumps expose explicit summer/fireworks scheduler names such as `time_bg_smmr_show`, `time_bg_smmr_hide`, and `sgrp_vfx_hanabi` outside the town-layout rows. Those are good layout-instance hunting clues.

## Output Files

- `{output / "city_layout_scheduler_strings.csv"}`
- `{output / "city_layout_paired_schedulers.csv"}`
- `{output / "weather_overlay_scheduler_strings.csv"}`
- `{output / "support_resource_scheduler_strings.csv"}`
- `{output / "script_scheduler_calls.csv"}`
- `{output / "mapobj_decor_controller_candidates.csv"}`
- `{output / "decor_probe_plan.csv"}`

## Safest Next Test Order

1. Use `!eventdecor list` in the destination city and start with the recovered public-town Halloween scheduler batch.
2. Restore every tested batch with the opposite action; packet delivery is not visual confirmation.
3. Probe interior layout pairs only after recovering their owning instance; a layout ID alone is insufficient.
4. Use `!spawnbgmodel b933`-style previews only for model identification; they do not prove city layout activation.
5. Probe weather-only overlays through `!weather list`; combined resource 8027 is blocked from `!weather` and owned by `!eventdecor`.

## Safety Notes

- `!weather ... 0 0` is not fully private: the immediate packet is player-limited, but `Area.weatherNormal` still changes.
- `fireworks_enabled=true` is broad: the current `WeatherManager` applies weather `8029` to all loaded zones during the Eorzea night window.
- `!spawnbgobj` is reversible in the sense that it avoids DB edits, but it still creates a live actor in the current area.
- Weather DATs are for weather/VFX overlays; city layout DATs are where layout/instance and scheduler group clues live.
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
    city_rows, weather_rows = build_target_string_rows(region_rows)
    support_rows = build_support_resource_rows()
    script_rows = build_script_scheduler_rows()
    mapobj_rows = build_mapobj_decor_rows()
    probe_rows = build_probe_rows(mapobj_rows)
    paired_rows = build_paired_scheduler_rows(city_rows)

    write_csv(args.output / "city_layout_scheduler_strings.csv", city_rows)
    write_csv(args.output / "city_layout_paired_schedulers.csv", paired_rows)
    write_csv(args.output / "weather_overlay_scheduler_strings.csv", weather_rows)
    write_csv(args.output / "support_resource_scheduler_strings.csv", support_rows)
    write_csv(args.output / "script_scheduler_calls.csv", script_rows)
    write_csv(args.output / "mapobj_decor_controller_candidates.csv", mapobj_rows)
    write_csv(args.output / "decor_probe_plan.csv", probe_rows)
    write_doc(args.doc, args.output, city_rows, weather_rows, support_rows, script_rows, mapobj_rows, probe_rows, paired_rows)

    print(f"city_layout_scheduler_strings={len(city_rows)}")
    print(f"city_layout_paired_schedulers={len(paired_rows)}")
    print(f"weather_overlay_scheduler_strings={len(weather_rows)}")
    print(f"support_resource_scheduler_strings={len(support_rows)}")
    print(f"script_scheduler_calls={len(script_rows)}")
    print(f"mapobj_decor_controller_candidates={len(mapobj_rows)}")
    print(f"decor_probe_plan={len(probe_rows)}")
    print(f"output={args.output}")
    print(f"doc={args.doc}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
