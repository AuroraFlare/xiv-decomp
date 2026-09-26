#!/usr/bin/env python3
"""Build a unified decomp atlas for every seasonal event client surface.

Covers all 25 recovered seasonal quest scripts (spl bucket including
spl101_quest) and all 13 seasonal populace scripts (Valentione, Moonfire
summer, Halloween, Foundation/company festival). Each row records the
recovered class, methods, text bank, widget/call counts, DAT text rows,
quest SQL row, and local server binding.

This is an inventory/decomp audit. It does not recover retail actor XYZ,
spawn rules, drop probabilities, or client acceptance.
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from datetime import datetime, timezone
from pathlib import Path


RECOVERED_SPL_DIR = Path("tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/spl")
RECOVERED_POPULACE_DIR = Path("tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/populace")
DAT_MINING_DIR = Path("docs/Dat Mining")
LOCAL_SPL_DIR = Path("Data/scripts/quests/spl")
LOCAL_BASE_POPULACE_DIR = Path("Data/scripts/base/chara/npc/populace")
LOCAL_SCRIPTS_ROOT = Path("Data/scripts")
QUEST_SQL = Path("Data/sql/gamedata_quests.sql")

DEFAULT_OUTPUT = Path("tools/outputs/seasonal-event-decomp-atlas-20260926")
DEFAULT_DOC = Path("docs/seasonal_event_decomp_atlas_2026-09-26.md")

SPL_CODES = [
    "spl000",
    "spl0g1", "spl0g2", "spl0g3", "spl0g4", "spl0g5",
    "spl0i1", "spl0i2", "spl0i3", "spl0i4", "spl0i5",
    "spl0l1", "spl0l2", "spl0l3", "spl0l4", "spl0l5",
    "spl0u1", "spl0u2", "spl0u3", "spl0u4", "spl0u5",
    "spl101", "spl101_quest", "spl102", "spl103",
]

POPULACE_FILES = [
    "populacevalentmaster.lua",
    "populacesumfes.lua",
    "populaceswimsuit2011.lua",
    "populaceyukata.lua",
    "populacehalloweentrans.lua",
    "populacespecialeventcryer.lua",
    "populacecompanyshop.lua",
    "populacecompanybuffer.lua",
    "populacecompanyglpublisher.lua",
    "populacecompanyguide.lua",
    "populacecompanyofficer.lua",
    "populacecompanysupply.lua",
    "populacecompanywarp.lua",
]

EVENT_BUCKETS = {
    "spl000": "Little Ladies'/Princess Day + Foundation static dialogue",
    "spl0g1": "Hatching-tide 2011 Dreamer's Gospel (Gridania)",
    "spl0g2": "Hatching-tide 2011 Dreamer's Dilemma (Gridania)",
    "spl0g3": "Placeholder (no event flow)",
    "spl0g4": "Placeholder (no event flow)",
    "spl0g5": "Placeholder (no event flow)",
    "spl0i1": "Moonfire 2011 The Heat Is On",
    "spl0i2": "All Saints' Wake 2011 Impish Impositions",
    "spl0i3": "Starlight 2011 Winter Is Not Coming",
    "spl0i4": "Heavensturn Gone with the Snow",
    "spl0i5": "Placeholder (no event flow)",
    "spl0l1": "Hatching-tide 2011 Dreamer's Gospel (Limsa)",
    "spl0l2": "Hatching-tide 2011 Dreamer's Dilemma (Limsa)",
    "spl0l3": "Placeholder (no event flow)",
    "spl0l4": "Placeholder (no event flow)",
    "spl0l5": "Placeholder (no event flow)",
    "spl0u1": "Hatching-tide 2011 Dreamer's Gospel (Ul'dah)",
    "spl0u2": "Hatching-tide 2011 Dreamer's Dilemma (Ul'dah)",
    "spl0u3": "Placeholder (no event flow)",
    "spl0u4": "Placeholder (no event flow)",
    "spl0u5": "Placeholder (no event flow)",
    "spl101": "Hatching-tide 2012 Scrambled Eggs (item-select bridge)",
    "spl101_quest": "Hatching-tide 2012 Easter quest dialogue/menus (no quest row)",
    "spl102": "Moonfire 2012 Bombard Backlash",
    "spl103": "Placeholder (no event flow)",
    "populacevalentmaster.lua": "Valentione's Day 2012 Bonds of Love",
    "populacesumfes.lua": "Moonfire mortar/summer festival",
    "populaceswimsuit2011.lua": "Moonfire 2011 swimsuit/mortar text",
    "populaceyukata.lua": "Moonfire 2012 yukata exchange",
    "populacehalloweentrans.lua": "All Saints' Wake pumpkin-head disguise",
    "populacespecialeventcryer.lua": "Foundation Day recruitment speeches",
    "populacecompanyshop.lua": "Foundation/company festival shop (modes 8/11)",
    "populacecompanybuffer.lua": "Company festival supporting role",
    "populacecompanyglpublisher.lua": "Company festival supporting role",
    "populacecompanyguide.lua": "Company festival supporting role",
    "populacecompanyofficer.lua": "Foundation prism/exchange officer",
    "populacecompanysupply.lua": "Company festival supporting role",
    "populacecompanywarp.lua": "Company festival supporting role",
}

FUNCTION_RE = re.compile(r"^\s*function\s+([A-Za-z0-9_]+)\.([A-Za-z0-9_]+)\s*\(", re.MULTILINE)
CLASS_RE = re.compile(r"_defineClass\(\s*\"([^\"]+)\"")
TEXT_RE = re.compile(r"_loadTextDataPermanently\((\d+),\s*\"([^\"]+)\"\)")


def read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8", errors="replace")


def parse_lua_surface(path: Path) -> dict[str, object]:
    body = read_text(path)
    class_match = CLASS_RE.search(body)
    methods = FUNCTION_RE.findall(body)
    text_match = TEXT_RE.search(body)
    return {
        "class": class_match.group(1) if class_match else "",
        "methods": [m for _, m in methods],
        "text_bank_id": text_match.group(1) if text_match else "",
        "text_bank_name": text_match.group(2) if text_match else "",
        "bytes": path.stat().st_size if path.exists() else 0,
        "say_calls": body.count(":say("),
        "world_say_calls": body.count("worldMaster:say"),
        "scheduler_calls": body.count("_runCharaScheduler"),
        "fade_calls": body.count("startFade"),
        "show_quest_info_calls": body.count("showQuestInfomation"),
        "ask_extend_widget_calls": body.count("askExtendWidget"),
        "event_mode_widget_calls": body.count("askEventModeWidgetYield"),
        "reward_select_widget_calls": body.count("RewardSelectWidget"),
        "ask_calls": len(re.findall(r":ask\(", body)),
        "nq_cutscene_calls": body.count("startNQCutScene"),
    }


def dat_data_rows(csv_path: Path) -> int:
    if not csv_path.exists():
        return 0
    try:
        with csv_path.open("r", encoding="utf-8-sig", newline="", errors="replace") as handle:
            rows = list(csv.reader(handle))
        # DAT-mining CSVs carry two header rows before data.
        return max(0, len(rows) - 2)
    except OSError:
        return 0


def quest_sql_rows() -> dict[str, dict[str, str]]:
    out: dict[str, dict[str, str]] = {}
    if not QUEST_SQL.exists():
        return out
    body = read_text(QUEST_SQL)
    # Quest names may contain escaped quotes (e.g. Dreamer's), so allow
    # backslash escapes inside the name field.
    for match in re.finditer(r"\((\d+),\s*'(?:[^'\\]|\\.)*',\s*'([^']*)',", body):
        qid, cls = match.groups()
        out[cls.lower()] = {"id": qid, "name": "", "class": cls}
    # Second pass recovers display names without parsing escapes.
    for match in re.finditer(r"\((\d+),\s*'((?:[^'\\]|\\.)*)',\s*'([^']*)',", body):
        qid, name, cls = match.groups()
        if cls.lower() in out:
            out[cls.lower()]["name"] = name.replace("\\'", "'")
    return out


def local_spl_status(code: str) -> tuple[str, int]:
    path = LOCAL_SPL_DIR / f"{code}.lua"
    if not path.exists():
        return "missing", 0
    body = read_text(path)
    size = path.stat().st_size
    if 'InitMoonfireQuest' in body:
        return "moonfire delegate driver", size
    if 'InitDreamerGospelQuest' in body:
        return "dreamer gospel driver", size
    if 'InitDreamerDilemmaQuest' in body:
        return "dreamer dilemma driver", size
    if 'InitQuestScaffold' in body:
        return "generic scaffold", size
    if 'delegateEvent' in body or 'callClientFunction' in body:
        return "custom driver", size
    if size <= 100:
        return "placeholder stub", size
    return "present unknown", size


def local_populace_status(filename: str) -> tuple[str, int]:
    stem_lower = filename.lower()
    # Exact base-class file match first (case-insensitive).
    base_match = None
    if LOCAL_BASE_POPULACE_DIR.exists():
        for candidate in LOCAL_BASE_POPULACE_DIR.glob("*.lua"):
            if candidate.name.lower() == stem_lower:
                base_match = candidate
                break
    hits: list[str] = []
    if LOCAL_SCRIPTS_ROOT.exists():
        for candidate in LOCAL_SCRIPTS_ROOT.rglob("*.lua"):
            if "bin" in candidate.parts or "obj" in candidate.parts:
                continue
            try:
                text = candidate.read_text(encoding="utf-8", errors="replace")
            except OSError:
                continue
            class_name = stem_lower.replace(".lua", "")
            if class_name in text.lower():
                hits.append(candidate.as_posix())
                if len(hits) >= 8:
                    break
    if base_match is not None:
        if hits:
            return f"base script present + {len(hits)} referencing lua", base_match.stat().st_size
        return "base script present (native-method bridge)", base_match.stat().st_size
    if hits:
        return f"{len(hits)} referencing lua (no base script)", 0
    return "no local binding found", 0


def write_csv(path: Path, rows: list[dict[str, object]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({name: row.get(name, "") for name in fields})


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    quest_lookup = quest_sql_rows()

    quest_rows: list[dict[str, object]] = []
    for code in SPL_CODES:
        recovered = RECOVERED_SPL_DIR / f"{code}.lua"
        parsed = parse_lua_surface(recovered)
        dat_rows = dat_data_rows(DAT_MINING_DIR / f"{code}.csv")
        quest = quest_lookup.get(code.lower(), {})
        local_status, local_bytes = local_spl_status(code)
        quest_rows.append({
            "code": code,
            "event": EVENT_BUCKETS.get(code, ""),
            "recovered_exists": recovered.exists(),
            "recovered_bytes": parsed["bytes"],
            "class": parsed["class"],
            "method_count": len(parsed["methods"]),  # type: ignore[arg-type]
            "methods": ";".join(parsed["methods"]),  # type: ignore[arg-type]
            "text_bank_id": parsed["text_bank_id"],
            "text_bank_name": parsed["text_bank_name"],
            "dat_text_data_rows": dat_rows,
            "quest_id": quest.get("id", ""),
            "quest_name": quest.get("name", ""),
            "say_calls": parsed["say_calls"],
            "world_say_calls": parsed["world_say_calls"],
            "scheduler_calls": parsed["scheduler_calls"],
            "show_quest_info_calls": parsed["show_quest_info_calls"],
            "ask_extend_widget_calls": parsed["ask_extend_widget_calls"],
            "event_mode_widget_calls": parsed["event_mode_widget_calls"],
            "reward_select_widget_calls": parsed["reward_select_widget_calls"],
            "ask_calls": parsed["ask_calls"],
            "nq_cutscene_calls": parsed["nq_cutscene_calls"],
            "local_status": local_status,
            "local_bytes": local_bytes,
        })

    populace_rows: list[dict[str, object]] = []
    for filename in POPULACE_FILES:
        recovered = RECOVERED_POPULACE_DIR / filename
        parsed = parse_lua_surface(recovered)
        dat_rows = dat_data_rows(DAT_MINING_DIR / f"{filename.replace('.lua', '')}.csv")
        # DAT files use mixed case (populaceValentMaster.csv); fall back case-insensitively.
        if dat_rows == 0 and DAT_MINING_DIR.exists():
            for candidate in DAT_MINING_DIR.glob("*.csv"):
                if candidate.name.lower() == filename.replace(".lua", ".csv").lower():
                    dat_rows = dat_data_rows(candidate)
                    break
        local_status, local_bytes = local_populace_status(filename)
        populace_rows.append({
            "file": filename,
            "event": EVENT_BUCKETS.get(filename, ""),
            "recovered_exists": recovered.exists(),
            "recovered_bytes": parsed["bytes"],
            "class": parsed["class"],
            "method_count": len(parsed["methods"]),  # type: ignore[arg-type]
            "methods": ";".join(parsed["methods"]),  # type: ignore[arg-type]
            "text_bank_id": parsed["text_bank_id"],
            "text_bank_name": parsed["text_bank_name"],
            "dat_text_data_rows": dat_rows,
            "say_calls": parsed["say_calls"],
            "world_say_calls": parsed["world_say_calls"],
            "scheduler_calls": parsed["scheduler_calls"],
            "ask_extend_widget_calls": parsed["ask_extend_widget_calls"],
            "ask_calls": parsed["ask_calls"],
            "local_status": local_status,
            "local_bytes": local_bytes,
        })

    missing_recovered = [r for r in quest_rows + populace_rows if not r["recovered_exists"]]
    if missing_recovered:
        raise AssertionError(
            "missing recovered seasonal lua: "
            + ", ".join(str(r.get("code") or r.get("file")) for r in missing_recovered)
        )

    total_methods = sum(int(r["method_count"]) for r in quest_rows + populace_rows)  # type: ignore[arg-type]
    placeholder_quests = [r for r in quest_rows if int(r["method_count"]) <= 1]  # type: ignore[arg-type]

    summary = {
        "generated_utc": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "seasonal_quest_surfaces": len(quest_rows),
        "seasonal_populace_surfaces": len(populace_rows),
        "total_surfaces": len(quest_rows) + len(populace_rows),
        "total_recovered_methods": total_methods,
        "placeholder_quest_surfaces": sorted(str(r["code"]) for r in placeholder_quests),
        "quest_ids_recovered": sorted({str(r["quest_id"]) for r in quest_rows if r["quest_id"]}),
        "note": "Inventory only. No retail XYZ, spawn, probability, or client-acceptance claims.",
    }

    write_csv(args.output / "seasonal_quest_surface.csv", quest_rows, [
        "code", "event", "recovered_exists", "recovered_bytes", "class",
        "method_count", "methods", "text_bank_id", "text_bank_name",
        "dat_text_data_rows", "quest_id", "quest_name", "say_calls",
        "world_say_calls", "scheduler_calls", "show_quest_info_calls",
        "ask_extend_widget_calls", "event_mode_widget_calls",
        "reward_select_widget_calls", "ask_calls", "nq_cutscene_calls",
        "local_status", "local_bytes",
    ])
    write_csv(args.output / "seasonal_populace_surface.csv", populace_rows, [
        "file", "event", "recovered_exists", "recovered_bytes", "class",
        "method_count", "methods", "text_bank_id", "text_bank_name",
        "dat_text_data_rows", "say_calls", "world_say_calls", "scheduler_calls",
        "ask_extend_widget_calls", "ask_calls", "local_status", "local_bytes",
    ])
    (args.output / "contract_summary.json").write_text(
        json.dumps(summary, indent=2) + "\n", encoding="utf-8")

    quest_table = "\n".join(
        f"| `{r['code']}` | {r['event']} | {r['method_count']} | "
        f"{r['text_bank_id']}/{r['text_bank_name']} | {r['dat_text_data_rows']} | "
        f"{r['quest_id']} | {r['local_status']} |"
        for r in quest_rows
    )
    populace_table = "\n".join(
        f"| `{r['file']}` | {r['event']} | {r['method_count']} | "
        f"{r['text_bank_id']}/{r['text_bank_name']} | {r['dat_text_data_rows']} | {r['local_status']} |"
        for r in populace_rows
    )
    doc = f"""# Seasonal event decomp atlas — all events

Generated: {summary['generated_utc']}

This pass unifies the decompilation inventory for **every** seasonal event
client surface: all {len(quest_rows)} recovered `spl` quest scripts (including
`spl101_quest`, which has dialogue/menus but no quest row) and all
{len(populace_rows)} seasonal populace scripts (Valentione, Moonfire summer,
Halloween, Foundation/company festival). Total recovered methods:
**{total_methods}**.

## Scope and evidence boundary

- Recovered Lua lives under `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/spl`
  and `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/populace`.
- English text rows live under `docs/Dat Mining/<code>.csv`; the
  `dat_text_data_rows` column counts data rows after the two header rows.
- Quest IDs/names join `Data/sql/gamedata_quests.sql` by script class.
- `local_status` describes the current server binding only. It is not a claim
  about retail scheduling, spawn positions, drop rates, or client acceptance.
- Placeholder scripts (`spl0g3-5`, `spl0l3-5`, `spl0u3-5`, `spl0i5`, `spl103`)
  decompile to `initText` only. They have no event flow and need no server
  driver until better recovery appears.
- `PopulaceSwimSuit2011` has no dedicated base script; its 2011 mortar text is
  served through the local `PopulaceSumFes` runtime. That is a server
  compatibility choice, not a recovered retail class rename.

## Seasonal quest surfaces (spl)

| Code | Event | Methods | Text bank | DAT rows | Quest | Local binding |
|---|---|---:|---|---|---:|---|
{quest_table}

## Seasonal populace surfaces

| File | Event | Methods | Text bank | DAT rows | Local binding |
|---|---|---:|---|---|---|
{populace_table}

## Method-count notes

- The five deep-widget quests (`spl0i1`, `spl0i2`, `spl0i3`, `spl102`,
  `spl101_quest`) carry the reward/menu complexity documented in
  `docs/seasonal_quest_gap_contract_2026-06-19.md`. Selector branches in the
  LPB decompile are fragile; the server re-validates every cost, ownership,
  inventory, entitlement, and session check instead of trusting a client row.
- `spl0i4` (Gone with the Snow) is the cutscene/clue driver; exact Hyrstmill
  clue push-object mapping remains open and the quest advances those scenes
  from Waldomar prompts without inventing object class IDs.
- `spl101` bridges only the native `askEgg` item-select; ring rewards and item
  removal stay behind the validated seasonal exchange path.
- Company/populace scripts carry the Foundation Day mode-8/11 shop contract
  from `docs/seasonal_control_plane_decomp_2026-07-11.md`; weather/decor stays
  on the separate area-weather and layout-selector lane.

## Reproduction

```powershell
python -B tools/build_seasonal_event_decomp_atlas.py
python -B tools/build_seasonal_quest_gap_contract.py
python -B tools/validate_seasonal_event_runtime.py
python -B tools/validate_quest_availability.py
```

Outputs:

- `{args.output / 'seasonal_quest_surface.csv'}`
- `{args.output / 'seasonal_populace_surface.csv'}`
- `{args.output / 'contract_summary.json'}`
"""
    args.doc.parent.mkdir(parents=True, exist_ok=True)
    args.doc.write_text(doc, encoding="utf-8")
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
