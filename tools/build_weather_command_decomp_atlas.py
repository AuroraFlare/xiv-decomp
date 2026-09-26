#!/usr/bin/env python3
"""Build a focused atlas for GM weather command ids and mined weather resources."""

from __future__ import annotations

import argparse
import csv
import json
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path


DEFAULT_OUTPUT = Path("outputs/weather-command-decomp-atlas-20260708")
DEFAULT_DOC = Path("docs/weather_command_decomp_atlas_2026-07-08.md")

REGION_RESOURCE_CSV = Path(
    "tools/outputs/lpb/airship_ferry_region_resource_data_20260621/region_resource_all_rows.csv"
)
WEATHER_COMMAND = Path("Data/scripts/commands/gm/weather.lua")
WEATHER_REGISTRY = Path("Data/scripts/weather_registry.lua")
WARP_COMMAND = Path("Data/scripts/commands/gm/warp.lua")
WEATHER_PACKET = Path("Map Server/Packets/Send/SetWeatherPacket.cs")
WEATHER_DIRECTOR = Path(
    "tools/outputs/lpb/decomp_further_20260617/lua/director/weather/weatherdirectorbaseclass.lua"
)
WEATHER_MANAGER = Path("Map Server/WeatherManager.cs")
DECOR_BRIDGE_DOC = Path("docs/citystate_decor_probe_bridge_atlas_2026-07-03.md")
WEATHER_OVERLAY_STRINGS = Path(
    "outputs/citystate-seasonal-scheduler-decomp-atlas-20260703/weather_overlay_scheduler_strings.csv"
)

SPECIAL_WEATHER = [
    {
        "weather_id": 8027,
        "token": "wtr_hall",
        "inferred_event": "Area-specific combined seasonal environment/decor pack",
        "aliases": [
            "seasonal", "wtr_hall", "halloween", "hallow", "hallows", "hall",
            "allsaints", "allsaintswake", "starlight", "xmas", "christmas",
        ],
        "probe": "blocked in !weather; use area-specific !eventdecor",
        "confidence": "high",
        "command_policy": "combined-event-blocked",
        "observed_visual": "Live-confirmed combined pack: Limsa/Ul'dah Halloween decorations; Gridania Starlight/Xmas assets.",
        "furnishing_signal": "combined resource; not executable through weather-only command",
        "still_to_discover": "A true client-native sub-layer selector; recovered _setWeather accepts only one weather id and transition.",
        "notes": "All aliases and raw 8027 are blocked by !weather and routed to !eventdecor halloween or starlight.",
    },
    {
        "weather_id": 8028,
        "token": "wtr_smmn",
        "inferred_event": "Primal / summon weather overlay",
        "aliases": ["primal", "summon", "smmn", "wtr_smmn"],
        "probe": "!weather primal 0 1",
        "confidence": "high",
        "command_policy": "weather-only",
        "observed_visual": "Runtime-confirmed as trial/summon weather by warp.lua; still worth visual screenshots per arena.",
        "furnishing_signal": "runtime trial weather plus asset refs",
        "still_to_discover": "Whether any non-primal furnished props appear outside trial/summon weather VFX.",
        "notes": "warp.lua hard-forces 8028 after Garuda, Ifrit, King Moggle Mog, and Nael/Rivenroad warps.",
    },
    {
        "weather_id": 8029,
        "token": "wtr_smmr",
        "inferred_event": "Moonfire / summer fireworks weather overlay",
        "aliases": ["fireworks", "moonfire", "summer", "smmr", "wtr_smmr"],
        "probe": "!weather fireworks 0 1",
        "confidence": "high",
        "command_policy": "weather-only",
        "observed_visual": "Needs per-zone visual confirmation.",
        "furnishing_signal": "overlay plus scheduler leads",
        "still_to_discover": "Exact Moonfire furnishing/layout owners; support resources expose time_bg_smmr_show/hide and fireworks scheduler clues.",
        "notes": "Also driven by map_config fireworks_enabled through WeatherManager during the nightly window.",
    },
    {
        "weather_id": 8030,
        "token": "wtr_comp",
        "inferred_event": "Dalamud / comet weather overlay",
        "aliases": ["dalamud", "dalamud1", "comet", "comp", "wtr_comp"],
        "probe": "!weather dalamud 0 1",
        "confidence": "medium",
        "command_policy": "weather-only",
        "observed_visual": "Needs visual confirmation.",
        "furnishing_signal": "asset refs, needs visual probe",
        "still_to_discover": "Whether comet/Dalamud is VFX-only in most areas or also brings visible props in some city/layout families.",
        "notes": "Resource token and strings point at comet/Dalamud weather.",
    },
    {
        "weather_id": 8031,
        "token": "wtr_chry",
        "inferred_event": "Aurora / cherry / hanabi / star weather overlay",
        "aliases": ["aurora", "chry", "cherry", "hanabi", "star", "stars", "wtr_chry"],
        "probe": "!weather aurora 0 1",
        "confidence": "medium",
        "command_policy": "weather-only",
        "observed_visual": "Needs visual confirmation.",
        "furnishing_signal": "asset refs, needs visual probe",
        "still_to_discover": "Whether star/hanabi assets are only sky/VFX or visible placed scene objects in some layouts.",
        "notes": "Mined resource rows expose star/hanabi/VFX strings; server already used Aurora for this id.",
    },
    {
        "weather_id": 8032,
        "token": "wtr_xmas",
        "inferred_event": "Dalamud Thunder special overlay",
        "aliases": ["dalamudthunder", "dalamud2", "wtr_xmas"],
        "probe": "!weather dalamudthunder 0 1",
        "confidence": "high",
        "command_policy": "weather-only",
        "observed_visual": "Final 1.23b: user-confirmed Dalamud Thunder; Dec 2010 patch: authenticated Starlight.",
        "furnishing_signal": "not a final-client Starlight candidate; historical resource was wtr_xmas",
        "still_to_discover": "Later Starlight-year bindings; 8032 must not be used as the snow alias on final 1.23b.",
        "notes": "The same three DAT keys carried all-city Starlight in Dec 2010 and were repurposed to Dalamud Thunder by final 1.23b.",
    },
]

CITY_EVENT_PROBES = [
    {
        "city": "Limsa Lominsa",
        "event": "Halloween / pumpkins",
        "status": "proven combined event pack",
        "primary_command": "!eventdecor halloween show",
        "secondary_command": "!eventdecor halloween hide",
        "evidence": "Limsa 8027 DAT contains sdef_hallo_imp; raw layout 121/3215 owns hw_obj*_h show/hide scheduler families.",
        "next_check": "Do not expose 8027 through !weather; raw schedulers remain explicit probes only.",
    },
    {
        "city": "Gridania",
        "event": "Snow / Starlight-like weather",
        "status": "proven combined event pack",
        "primary_command": "!eventdecor starlight show",
        "secondary_command": "!eventdecor starlight hide",
        "evidence": "Gridania 8027 DAT contains vfx_cam_xmas, cbind_xmas, wtr_xmas paths, and time_xmas_se.",
        "next_check": "Keep 8027 blocked from !weather and owned by eventdecor.",
    },
    {
        "city": "Ul'dah",
        "event": "Halloween / All Saints",
        "status": "proven combined event pack",
        "primary_command": "!eventdecor halloween show",
        "secondary_command": "!eventdecor halloween hide",
        "evidence": "Ul'dah 8027 DAT contains sdef_hallo_imp; raw layouts 421/4313 and 421/4326 own hw0..9 show/hide families.",
        "next_check": "Do not expose 8027 through !weather; raw schedulers remain explicit probes only.",
    },
    {
        "city": "Gridania",
        "event": "Halloween / All Saints",
        "status": "scheduler candidate",
        "primary_command": "!eventdecor halloween probe-show",
        "secondary_command": "!eventdecor halloween probe-hide",
        "evidence": "Raw layout 321/3392 owns Gridania hlw1a..2b scheduler families; no mapped Gridania Halloween atmosphere DAT was found.",
        "next_check": "Normal show/hide must refuse until a live-backed activation path is recovered.",
    },
    {
        "city": "Ul'dah",
        "event": "Snow / Starlight-like weather",
        "status": "needs discovery",
        "primary_command": "!weather snow 0 1; !weather wintry 0 1",
        "secondary_command": "!weather probe unknown1 0 1; !weather probe unknown2 0 1; !weather probe unknown3 0 1",
        "evidence": "User reports 8027/seasonal is not Ul'dah snow; 8032 is Dalamud Thunder; deep DAT rows include wil_w0 hidden 8067/8068/8069 resources.",
        "next_check": "Probe normal snow ids first, then hidden 8067/8068/8069 variants in Ul'dah.",
    },
    {
        "city": "Limsa Lominsa",
        "event": "Snow / Starlight-like weather",
        "status": "needs discovery",
        "primary_command": "!weather snow 0 1; !weather wintry 0 1",
        "secondary_command": "No sea_s0 rows for unknown1-3; inspect quest/actor scheduler clues if snow/wintry fail.",
        "evidence": "User-confirmed 8027/seasonal is pumpkins in Limsa; 8032 is Dalamud Thunder; deep DAT rows only show sea_s0 hidden 8065/8066 resources.",
        "next_check": "Do not treat unknown1-3 as dat-backed in Limsa; follow spl0i4/seasonal actor scheduler leads if normal snow ids fail.",
    },
    {
        "city": "All areas",
        "event": "Dalamud Thunder",
        "status": "confirmed special weather id",
        "primary_command": "!weather dalamudthunder 0 1",
        "secondary_command": "!weather 8032 0 1",
        "evidence": "User-confirmed 8032 is Dalamud Thunder despite the raw wtr_xmas resource token.",
        "next_check": "Do not use starlight/xmas/christmas aliases for this id.",
    },
]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames: list[str] = []
    for row in rows:
        for key in row:
            if key not in fieldnames:
                fieldnames.append(key)

    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def collect_region_resource_evidence(region_rows: list[dict[str, str]]) -> dict[tuple[int, str], list[dict[str, str]]]:
    targets = {(item["weather_id"], item["token"]) for item in SPECIAL_WEATHER}
    grouped: dict[tuple[int, str], list[dict[str, str]]] = defaultdict(list)

    for row in region_rows:
        try:
            key = (int(row["id"]), row["resource_token"])
        except (KeyError, ValueError):
            continue

        if key in targets:
            grouped[key].append(row)

    return grouped


def collect_overlay_signals(path: Path) -> dict[int, dict[str, object]]:
    signals: dict[int, dict[str, object]] = defaultdict(
        lambda: {
            "city_prop_tree_refs": 0,
            "event_asset_refs": 0,
            "event_resource_paths": 0,
            "time_scheduler_refs": 0,
            "scheduler_group_refs": 0,
            "vfx_scene_defs": 0,
            "event_hints": defaultdict(int),
            "examples": [],
        }
    )

    if not path.exists():
        return signals

    for row in read_csv(path):
        try:
            weather_id = int(row["weather_id"])
        except (KeyError, ValueError):
            continue

        signal = signals[weather_id]
        string_class = row.get("string_class", "")
        event_hint = row.get("event_hint", "")
        value = row.get("string", "")

        if string_class == "event_asset_or_group":
            signal["event_asset_refs"] += 1
            if event_hint == "City prop/tree":
                signal["city_prop_tree_refs"] += 1
        elif string_class == "resource_path" and event_hint:
            signal["event_resource_paths"] += 1
        elif string_class == "time_scheduler":
            signal["time_scheduler_refs"] += 1
        elif string_class == "scheduler_group":
            signal["scheduler_group_refs"] += 1
        elif string_class == "vfx_or_scene_def":
            signal["vfx_scene_defs"] += 1

        if event_hint:
            signal["event_hints"][event_hint] += 1

        examples = signal["examples"]
        if event_hint and value and len(examples) < 8:
            examples.append(value)

    return signals


def format_top_hints(signal: dict[str, object]) -> str:
    hints = signal.get("event_hints", {})
    if not hints:
        return ""

    return " | ".join(
        f"{hint}:{count}" for hint, count in sorted(hints.items(), key=lambda item: (-item[1], item[0]))[:6]
    )


def build_summary_rows(
    grouped: dict[tuple[int, str], list[dict[str, str]]],
    overlay_signals: dict[int, dict[str, object]],
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for item in SPECIAL_WEATHER:
        evidence = grouped.get((item["weather_id"], item["token"]), [])
        dat_keys = sorted({row.get("dat_key_hex", "") for row in evidence if row.get("dat_key_hex")})
        offsets = [row.get("offset_hex", "") for row in evidence[:12] if row.get("offset_hex")]
        signal = overlay_signals.get(item["weather_id"], {})
        rows.append(
            {
                "weather_id": item["weather_id"],
                "token": item["token"],
                "inferred_event": item["inferred_event"],
                "primary_aliases": " | ".join(item["aliases"]),
                "probe": item["probe"],
                "confidence": item["confidence"],
                "command_policy": item["command_policy"],
                "observed_visual": item["observed_visual"],
                "furnishing_signal": item["furnishing_signal"],
                "region_resource_rows": len(evidence),
                "unique_dat_keys": len(dat_keys),
                "city_prop_tree_refs": signal.get("city_prop_tree_refs", 0),
                "event_asset_refs": signal.get("event_asset_refs", 0),
                "event_resource_paths": signal.get("event_resource_paths", 0),
                "time_scheduler_refs": signal.get("time_scheduler_refs", 0),
                "scheduler_group_refs": signal.get("scheduler_group_refs", 0),
                "vfx_scene_defs": signal.get("vfx_scene_defs", 0),
                "top_overlay_hints": format_top_hints(signal),
                "example_overlay_strings": " | ".join(signal.get("examples", [])),
                "dat_key_hexes": " | ".join(dat_keys),
                "sample_offsets": " | ".join(offsets),
                "still_to_discover": item["still_to_discover"],
                "notes": item["notes"],
            }
        )
    return rows


def build_alias_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for item in SPECIAL_WEATHER:
        for alias in item["aliases"]:
            rows.append(
                {
                    "alias": alias,
                    "weather_id": item["weather_id"],
                    "token": item["token"],
                    "inferred_event": item["inferred_event"],
                    "probe": item["probe"],
                    "confidence": item["confidence"],
                    "command_policy": item["command_policy"],
                }
            )
    return rows


def build_furnishing_rows(summary_rows: list[dict[str, object]]) -> list[dict[str, object]]:
    return [
        {
            "weather_id": row["weather_id"],
            "token": row["token"],
            "easy_command": row["probe"],
            "furnishing_signal": row["furnishing_signal"],
            "observed_visual": row["observed_visual"],
            "city_prop_tree_refs": row["city_prop_tree_refs"],
            "event_asset_refs": row["event_asset_refs"],
            "event_resource_paths": row["event_resource_paths"],
            "top_overlay_hints": row["top_overlay_hints"],
            "example_overlay_strings": row["example_overlay_strings"],
            "still_to_discover": row["still_to_discover"],
        }
        for row in summary_rows
    ]


def build_city_event_probe_rows() -> list[dict[str, object]]:
    return CITY_EVENT_PROBES


def build_source_rows() -> list[dict[str, str]]:
    return [
        {
            "source": str(REGION_RESOURCE_CSV),
            "evidence": "Mined RegionResourceData rows bind special weather ids to wtr_* resource tokens and DAT keys.",
        },
        {
            "source": str(WEATHER_OVERLAY_STRINGS),
            "evidence": "Weather overlay DAT string scan surfaces event asset refs, City prop/tree refs, scheduler groups, and VFX scene defs.",
        },
        {
            "source": str(WEATHER_DIRECTOR),
            "evidence": "Recovered client WeatherDirector syncs a 16-bit weatherId and calls player _setWeather(weatherId, 15).",
        },
        {
            "source": str(WEATHER_REGISTRY),
            "evidence": "Auditable allowlists separate weather-only, debug-probe, and combined-event ids by area family.",
        },
        {
            "source": str(WEATHER_COMMAND),
            "evidence": "GM command fails closed against the registry; combined ids emit no weather packet and route to !eventdecor.",
        },
        {
            "source": str(WARP_COMMAND),
            "evidence": "GM warp command hard-forces 8028/wtr_smmn after several primal/Nael trial warps.",
        },
        {
            "source": str(WEATHER_PACKET),
            "evidence": "Server packet encodes weatherId with transitionTime for opcode 0x000D.",
        },
        {
            "source": str(WEATHER_MANAGER),
            "evidence": "Runtime automatic weather uses SQL pools; fireworks_enabled can force 8029 at night.",
        },
        {
            "source": str(DECOR_BRIDGE_DOC),
            "evidence": "City decor/furnishing schedulers are a separate BG-scheduler layer from weather resource overlays.",
        },
    ]


def markdown_table(rows: list[dict[str, object]], columns: list[str]) -> str:
    lines = [
        "| " + " | ".join(columns) + " |",
        "| " + " | ".join("---" for _ in columns) + " |",
    ]
    for row in rows:
        values = [str(row.get(column, "")).replace("|", "/") for column in columns]
        lines.append("| " + " | ".join(values) + " |")
    return "\n".join(lines)


def write_doc(
    path: Path,
    summary_rows: list[dict[str, object]],
    city_probe_rows: list[dict[str, object]],
    output: Path,
) -> None:
    generated = datetime.now(timezone.utc).replace(microsecond=0).isoformat()
    table_rows = [
        {
            "id": row["weather_id"],
            "token": row["token"],
            "readout": row["inferred_event"],
            "aliases": row["primary_aliases"],
            "decor": row["furnishing_signal"],
            "observed": row["observed_visual"],
            "rows": row["region_resource_rows"],
            "confidence": row["confidence"],
        }
        for row in summary_rows
    ]

    furnishing_rows = [
        {
            "id": row["weather_id"],
            "token": row["token"],
            "cmd": row["probe"],
            "signal": row["furnishing_signal"],
            "observed": row["observed_visual"],
            "propRefs": row["city_prop_tree_refs"],
            "assetRefs": row["event_asset_refs"],
            "stillNeeded": row["still_to_discover"],
        }
        for row in summary_rows
    ]

    doc = f"""# Weather Command Decomp Atlas - 2026-07-08

Generated: {generated}

## Inputs

- Region/resource rows: `{REGION_RESOURCE_CSV}`
- Weather overlay string scan: `{WEATHER_OVERLAY_STRINGS}`
- Recovered WeatherDirector: `{WEATHER_DIRECTOR}`
- GM command: `{WEATHER_COMMAND}`
- GM warp command: `{WARP_COMMAND}`
- Server weather packet/constants: `{WEATHER_PACKET}`
- Runtime weather manager: `{WEATHER_MANAGER}`

## Readout

- `!weather` only needs a weather id plus transition. The client decomp shows `WeatherDirectorBaseClass` syncing `weatherId` and calling `_setWeather(weatherId, 15)`.
- `8027` / `wtr_hall` is a combined environment/decor pack, not weather-only. `!weather` blocks its aliases and raw numeric id; Limsa/Ul'dah route to `!eventdecor halloween`, while Gridania routes to `!eventdecor starlight`.
- `8028` / `wtr_smmn` is runtime-confirmed as primal/summon weather: `warp.lua` forces it after Garuda, Ifrit, King Moggle Mog, and Nael/Rivenroad warps.
- `8032` is authenticated as all-city Starlight in both December 2010 and December 2011. `D2012.07.21.0000.patch` replaces all three payloads with Dalamud Thunder. Do not use `starlight`, `xmas`, or `christmas` as friendly aliases for the final client.
- `8031 / wtr_chry` was already all-city in December 2010. Its extracted payloads are star/cloud/camera resources with no Hina, peach, petal, sakura, or momo token, and no March 2011 event call has been recovered; it is not authenticated Little Ladies weather.
- The remaining seasonal-looking weather overlay with a clear event label is Moonfire/fireworks: `8029` / `wtr_smmr`.
- The executable weather-only special range is `8028`-`8032`; any future live-confirmed combined pack must move to the eventdecor denylist.
- Debug rows `8065`-`8069` and `8081` require `!weather probe` and an authored current-area mapping.
- In game, use `!weather list` for current-area normal/special/debug coverage and `!eventdecor list` for seasonal furnishings.

## Special Weather Matrix

{markdown_table(table_rows, ["id", "token", "readout", "aliases", "decor", "observed", "rows", "confidence"])}

## Furnishing / Decor Signals

{markdown_table(furnishing_rows, ["id", "token", "cmd", "signal", "observed", "propRefs", "assetRefs", "stillNeeded"])}

## City Event Probe Matrix

{markdown_table(city_probe_rows, ["city", "event", "status", "primary_command", "secondary_command", "evidence", "next_check"])}

## Best Probe Order

1. `!weather list` to print weather-only and debug-probe coverage for the current area.
2. Confirm `!weather 8027 0 1`, `seasonal`, `halloween`, and `starlight` are blocked without sending a packet.
3. Use `!eventdecor halloween show|hide` in Limsa/Ul'dah or `!eventdecor starlight show|hide` in Gridania.
4. If Ul'dah snow is still being researched, use `!weather probe unknown1|unknown2|unknown3 0 1`; those hidden IDs have `wil_w0` DAT rows.
5. Do not treat `unknown1`-`unknown3` as dat-backed Limsa snow probes; the sea_s0 family only showed hidden `8065`/`8066` rows in the deeper scan.
6. `!weather dalamudthunder 0 1` verifies final-client `8032`; its December 2010 meaning must not be applied to 1.23b.
7. If weather visuals appear but city decor does not, continue with the city BG scheduler probe queues from `{DECOR_BRIDGE_DOC}`.

## Still To Discover

- Exact per-zone weather-only matrix; combined `8027` is intentionally excluded from `!weather` regardless of its city visual.
- Exact object lists: what `wtr_hall`, `wtr_smmr`, `wtr_chry`, `wtr_comp`, and `wtr_xmas`/Dalamud Thunder visibly add in each area.
- True client-native sub-layer selection for combined packs; the recovered weather API has only weather id and transition.
- High/unknown weather ids `8067`, `8068`, and `8069`; they are dat-backed for Ul'dah/Gridania but still need visual proof. `8081` appears outside the city families in the deeper scan.

## Output Files

- `{output / "weather_special_resource_summary.csv"}`
- `{output / "weather_command_aliases.csv"}`
- `{output / "weather_furnishing_signal_matrix.csv"}`
- `{output / "weather_city_event_probe_matrix.csv"}`
- `{output / "source_evidence_index.csv"}`
- `{output / "contract_summary.json"}`

## Cautions

- Treat `8032` as Dalamud Thunder in the final-client command surface. Its historical Starlight identity is evidence of patch-dependent ID reuse, not a safe friendly snow alias.
- Use `zonewide=1` only in a disposable test session.
- `seasonal_quests_enabled` and `fireworks_enabled` are config gates for different systems; they do not replace the manual weather probes.
"""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(doc, encoding="utf-8")


def write_contract(
    path: Path,
    summary_rows: list[dict[str, object]],
    city_probe_rows: list[dict[str, object]],
) -> None:
    payload = {
        "generated": datetime.now(timezone.utc).replace(microsecond=0).isoformat(),
        "special_weather_ids": [row["weather_id"] for row in summary_rows],
        "special_weather_rows": sum(int(row["region_resource_rows"]) for row in summary_rows),
        "conclusion": "!weather is fail-closed and weather-only; 8027/wtr_hall is a combined pack blocked from aliases and raw numeric execution, while 8032 remains Dalamud Thunder.",
        "furnishing_conclusion": "Combined 8027 city resources are owned by !eventdecor: Halloween in Limsa/Ul'dah and Starlight in Gridania; scheduler-only paths remain explicit probes.",
        "city_event_probe_rows": len(city_probe_rows),
        "next_probe": [
            "!weather events",
            "!eventdecor halloween show",
            "!eventdecor starlight show",
            "!weather snow 0 1",
            "!weather wintry 0 1",
            "!weather dalamudthunder 0 1",
            "!weather fireworks 0 1",
            "!weather clear 0 1",
        ],
    }
    path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    region_rows = read_csv(REGION_RESOURCE_CSV)
    grouped = collect_region_resource_evidence(region_rows)
    overlay_signals = collect_overlay_signals(WEATHER_OVERLAY_STRINGS)
    summary_rows = build_summary_rows(grouped, overlay_signals)
    alias_rows = build_alias_rows()
    furnishing_rows = build_furnishing_rows(summary_rows)
    city_probe_rows = build_city_event_probe_rows()
    source_rows = build_source_rows()

    args.output.mkdir(parents=True, exist_ok=True)
    write_csv(args.output / "weather_special_resource_summary.csv", summary_rows)
    write_csv(args.output / "weather_command_aliases.csv", alias_rows)
    write_csv(args.output / "weather_furnishing_signal_matrix.csv", furnishing_rows)
    write_csv(args.output / "weather_city_event_probe_matrix.csv", city_probe_rows)
    write_csv(args.output / "source_evidence_index.csv", source_rows)
    write_contract(args.output / "contract_summary.json", summary_rows, city_probe_rows)
    write_doc(args.doc, summary_rows, city_probe_rows, args.output)

    print(f"weather_special_resource_summary={len(summary_rows)}")
    print(f"weather_command_aliases={len(alias_rows)}")
    print(f"weather_furnishing_signal_matrix={len(furnishing_rows)}")
    print(f"weather_city_event_probe_matrix={len(city_probe_rows)}")
    print(f"output={args.output}")
    print(f"doc={args.doc}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
