#!/usr/bin/env python3
"""Build event text and owner evidence for the instanced quest decomp slice."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Iterable


DEFAULT_OUTPUT = Path("outputs/quest-instanced-event-text-owner-20260702")
DEFAULT_DOC = Path("docs/quest_instanced_event_text_owner_decomp_2026-07-02.md")

DAT_MINING = Path("docs/Dat Mining")
CONTENT_SCENARIO = Path("tools/outputs/lpb/content_systems_20260612/lua/quest/scenario")
MORE_SCENARIO = Path("tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario")
MONSTER_ROOT = Path("tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/monster")

GC_TEMPLATE = Path("Data/scripts/quests/com/gc_quest_template.lua")
TOTORAK_ENTRY = Path("Data/scripts/totorak_entry.lua")
WORLD_MANAGER = Path("Map Server/WorldManager.cs")
INSTANCE_RAID_EXIT = Path("Data/scripts/base/chara/npc/object/InstanceRaidExit.lua")
ITEM_SQL = Path("Data/sql/gamedata_items.sql")
ACTOR_CLASS_SQL = Path("Data/sql/gamedata_actor_class.sql")
EVENT_SPAWN_SQL = Path("Data/sql/server_eventnpc_spawn_locations.sql")
MOB_SQL = Path("Data/sql/server_battlenpc_mob_types_loot.sql")
BATTLE_MOB_TYPES_SQL = Path("Data/sql/server_battlenpc_mob_types.sql")
BATTLE_SPAWN_SQL = Path("Data/sql/server_battlenpc_spawn_locations.sql")

DFT_SEA = Path("Data/scripts/quests/dft/DftSea.lua")
DFT_FST = Path("Data/scripts/quests/dft/DftFst.lua")
DFT_WIL = Path("Data/scripts/quests/dft/DftWil.lua")
CATEGORY_JOBS = Path("docs/categories/Jobs_Classes_Abilities.md")
QUEST_ARCHIVE = Path("docs/ffxiv-1.0-wiki/quest_archive_rows.csv")
GM_TOTORAK = Path("Data/scripts/commands/gm/totorak.lua")
RECOVERED_RAID_GUIDE = Path(
    "tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/populace/instanceraidguide/instanceraidguidebaseclass.lua"
)
RECOVERED_ELEVATOR = Path("tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/elevatorstandard.lua")
SQB_ADAPTER_ROWS = Path("outputs/quest-sqb-adapter-atlas-20260630/sqb_adapter_rows.csv")
PUSH_OPERATOR_ROWS = Path("outputs/quest-universal-push-operator-atlas-20260630/fight_sqb_push_operator_rows.csv")
METHOD_SPINE_ROWS = Path("outputs/quest-recovered-method-spine-atlas-20260630/quest_method_spine.csv")
TEXT_USAGE_ROWS = Path("tools/outputs/lpb/decomp_correlation_20260617/text_sheet_usage_join.csv")
METHOD_SUMMARY_ROWS = Path("tools/outputs/lpb/decomp_correlation_20260617/target_system_method_summaries.csv")


QUESTS = [
    {
        "code": "gcl301",
        "quest_id": "111417",
        "title": "The Cove",
        "lane": "gc_tail",
        "scenario": MORE_SCENARIO / "gcl/gcl301.lua",
        "script": Path("Data/scripts/quests/gcl/gcl301.lua"),
        "dat": DAT_MINING / "gcl301.csv",
        "start_owner": "Clifton",
        "start_actor": "1000199",
        "default_ref": (DFT_SEA, r"1000199"),
        "category_ref": r"The Cove \| Clifton",
        "archive_ref": r"side,The Cove",
        "officer_actor": "1500199",
        "target_hint": "Dart Slug Anti-venom item and SlugLesserQuestGcl301 class, but no actor/mob binding.",
        "item_ids": ["11000407"],
        "monster_class": "SlugLesserQuestGcl301",
        "monster_path": MONSTER_ROOT / "slug/sluglesserquestgcl301.lua",
        "actor_candidates": "Clifton display 1000069; likely actor class/default talk 1000199",
        "generic_analogs": "2204211 dart slug name; not quest-bound",
        "blocker_note": "No quest-bound actor/mob/callback tying dart slug rows to SlugLesserQuestGcl301.",
    },
    {
        "code": "gcl302",
        "quest_id": "111418",
        "title": "Saving the Stead Instead",
        "lane": "gc_tail",
        "scenario": MORE_SCENARIO / "gcl/gcl302.lua",
        "script": Path("Data/scripts/quests/gcl/gcl302.lua"),
        "dat": DAT_MINING / "gcl302.csv",
        "start_owner": "Hasthwab",
        "start_actor": "1001064",
        "default_ref": (DFT_SEA, r"1001064"),
        "category_ref": r"Saving the Stead Instead \| Hasthwab",
        "archive_ref": r"side,Saving the Stead Instead",
        "officer_actor": "1500199",
        "target_hint": "Red Rooster Stead/Kobold text context; no exact quest monster class or mob row yet.",
        "item_ids": [],
        "monster_class": "",
        "monster_path": Path(""),
        "actor_candidates": "Hasthwab 1001064; Fyrilskyf/Albin/TGizzoh/Denston 1001681/1001682/1001683/1001684",
        "generic_analogs": "Kobold generic mob types 1023/1024/1025",
        "blocker_note": "Named helper actors have empty script paths; generic kobolds are not bound to the private cave/SQB callback.",
    },
    {
        "code": "gcg301",
        "quest_id": "111617",
        "title": "Eternal Recurrence",
        "lane": "gc_tail",
        "scenario": MORE_SCENARIO / "gcg/gcg301.lua",
        "script": Path("Data/scripts/quests/gcg/gcg301.lua"),
        "dat": DAT_MINING / "gcg301.csv",
        "start_owner": "Dyrstbrod",
        "start_actor": "1001079",
        "default_ref": (DFT_FST, r"1001079"),
        "category_ref": r"Eternal Recurrence \| Dyrstbrod",
        "archive_ref": r"side,Eternal Recurrence",
        "officer_actor": "1500200",
        "target_hint": "Leather Armor Scrap/Hypnotic Scales items and recovered Dyrstbrod flow; no exact attacker/mob binding.",
        "item_ids": ["11000401", "11000402"],
        "monster_class": "",
        "monster_path": Path(""),
        "actor_candidates": "Dyrstbrod 1001079",
        "generic_analogs": "Dreadwolf name evidence only",
        "blocker_note": "No quest-specific class, mob type, spawn, or kill callback for the skirmish hazards.",
    },
    {
        "code": "gcg302",
        "quest_id": "111618",
        "title": "The Pen Is Mightier Than the Spear",
        "lane": "gc_tail",
        "scenario": MORE_SCENARIO / "gcg/gcg302.lua",
        "script": Path("Data/scripts/quests/gcg/gcg302.lua"),
        "dat": DAT_MINING / "gcg302.csv",
        "start_owner": "Dhemdaeg",
        "start_actor": "1000567",
        "default_ref": (DFT_FST, r"1000567"),
        "category_ref": r"The Pen Is Mightier Than the Spear \| Dhemdaeg",
        "archive_ref": r"side,The Pen Is Mightier Than the Spear",
        "officer_actor": "1500200",
        "target_hint": "Sketch of Challinie item plus FlyLesserQuestGcg302 class; no SQL binding to a spawned target.",
        "item_ids": ["11000403"],
        "monster_class": "FlyLesserQuestGcg302",
        "monster_path": MONSTER_ROOT / "fly/flylesserquestgcg302.lua",
        "actor_candidates": "Dhemdaeg 1000567; Challinie 1000956; Hilith display 1100085",
        "generic_analogs": "Forest beast/monster text; quest fly class-file hint",
        "blocker_note": "FlyLesserQuestGcg302 proves only a class-file hint, not a spawned actor/mob/callback.",
    },
    {
        "code": "gcu301",
        "quest_id": "111817",
        "title": "Prying Eyes",
        "lane": "gc_tail",
        "scenario": MORE_SCENARIO / "gcu/gcu301.lua",
        "script": Path("Data/scripts/quests/gcu/gcu301.lua"),
        "dat": DAT_MINING / "gcu301.csv",
        "start_owner": "Lefchild",
        "start_actor": "1000994",
        "default_ref": (DFT_WIL, r"1000994"),
        "category_ref": r"Prying Eyes \| Lefchild",
        "archive_ref": r"side,Prying Eyes",
        "officer_actor": "1500198",
        "target_hint": "Recovered scenario start token says CLIFTON even though external/default data starts Lefchild.",
        "item_ids": ["11000404", "11000405", "11000406"],
        "monster_class": "",
        "monster_path": Path(""),
        "actor_candidates": "Lefchild display/default talk 1000994; recovered method token says Clifton",
        "generic_analogs": "Copper coblyn type 1303 near zone 171",
        "blocker_note": "Coblyn analog is an open-world row and is not bound to this quest's private SQB/callback.",
    },
    {
        "code": "gcu302",
        "quest_id": "111818",
        "title": "Different Strokes",
        "lane": "gc_tail",
        "scenario": MORE_SCENARIO / "gcu/gcu302.lua",
        "script": Path("Data/scripts/quests/gcu/gcu302.lua"),
        "dat": DAT_MINING / "gcu302.csv",
        "start_owner": "Galeren",
        "start_actor": "1000963",
        "default_ref": (DFT_WIL, r"1000963"),
        "category_ref": r"Different Strokes \| Galeren",
        "archive_ref": r"side,Different Strokes",
        "officer_actor": "1500198",
        "target_hint": "Galeren/rank-gated recovered flow and dangerous route text; no exact target row.",
        "item_ids": [],
        "monster_class": "",
        "monster_path": Path(""),
        "actor_candidates": "Galeren 1000963; Adalbert Cotter 1001685; Lennard Westin 1001686",
        "generic_analogs": "Ravenous/ferocious beasts text only",
        "blocker_note": "Text never resolves the attackers to a family, actor, mob type, or kill callback.",
    },
    {
        "code": "com0l5",
        "quest_id": "111405",
        "title": "An Officer and a Wise Man",
        "lane": "totorak",
        "scenario": CONTENT_SCENARIO / "com/com0l5.lua",
        "script": Path("Data/scripts/quests/com/com0l5.lua"),
        "dat": DAT_MINING / "com0l5.csv",
        "start_owner": "Orn Guincum",
        "start_actor": "1500199",
        "default_ref": (EVENT_SPAWN_SQL, r"1500199"),
        "category_ref": r"An Officer and a Wise Man \| Guincum",
        "archive_ref": r"side,An Officer and a Wise Man",
        "officer_actor": "1500199",
        "target_hint": "Toto-Rak entry/investigation lane; recovered elevator asks and NQ chain are stronger than battle target data.",
        "item_ids": [],
        "monster_class": "",
        "monster_path": Path(""),
    },
    {
        "code": "com0g6",
        "quest_id": "111606",
        "title": "Appetite for Destruction",
        "lane": "totorak",
        "scenario": CONTENT_SCENARIO / "com/com0g6.lua",
        "script": Path("Data/scripts/quests/com/com0g6.lua"),
        "dat": DAT_MINING / "com0g6.csv",
        "start_owner": "Syro Fulke",
        "start_actor": "1500200",
        "default_ref": (EVENT_SPAWN_SQL, r"1500200"),
        "category_ref": r"Appetite for Destruction",
        "archive_ref": r"side,Appetite for Destruction",
        "officer_actor": "1500200",
        "target_hint": "Toto-Rak entry/cutscene lane; recovered processEventNq plays COM0G510.",
        "item_ids": [],
        "monster_class": "",
        "monster_path": Path(""),
    },
    {
        "code": "com0u5",
        "quest_id": "111805",
        "title": "Burning Man",
        "lane": "totorak",
        "scenario": CONTENT_SCENARIO / "com/com0u5.lua",
        "script": Path("Data/scripts/quests/com/com0u5.lua"),
        "dat": DAT_MINING / "com0u5.csv",
        "start_owner": "Aubrey",
        "start_actor": "1500198",
        "default_ref": (EVENT_SPAWN_SQL, r"1500198"),
        "category_ref": r"Burning Man \| Aubrey",
        "archive_ref": r"side,Burning Man",
        "officer_actor": "1500198",
        "target_hint": "Toto-Rak entry/investigation lane; recovered processEvent025 plays com0u610; local com0u510 is suspicious because it belongs to another quest path.",
        "item_ids": [],
        "monster_class": "",
        "monster_path": Path(""),
    },
    {
        "code": "com0l6",
        "quest_id": "111406",
        "title": "Ceruleum Shock",
        "lane": "totorak",
        "scenario": CONTENT_SCENARIO / "com/com0l6.lua",
        "script": Path("Data/scripts/quests/com/com0l6.lua"),
        "dat": DAT_MINING / "com0l6.csv",
        "start_owner": "Orn Guincum",
        "start_actor": "1500199",
        "default_ref": (EVENT_SPAWN_SQL, r"1500199"),
        "category_ref": r"Ceruleum Shock",
        "archive_ref": r"side,Ceruleum Shock",
        "officer_actor": "1500199",
        "target_hint": "Toto-Rak entry/cutscene lane; recovered processEvent_010 plays com0l510 with payload arg.",
        "item_ids": [],
        "monster_class": "",
        "monster_path": Path(""),
    },
]


TEXT_TERMS = [
    "Aleport",
    "cove",
    "Dart Slug",
    "anti-venom",
    "Red Rooster",
    "kobold",
    "Stead",
    "Fallgourd",
    "Dreadwolf",
    "Hypnotic",
    "leather",
    "scrap",
    "Challinie",
    "Hilith",
    "Rootslake",
    "sketch",
    "Lefchild",
    "Dhemdaeg",
    "Hasthwab",
    "Clifton",
    "Dyrstbrod",
    "Galeren",
    "Drybone",
    "Copperbell",
    "Cobalt",
    "Coblyn",
    "Omnomite",
    "Prismatic",
    "Eye",
    "Nanawa",
    "Pearl Lane",
    "Beastcleavers",
    "Adalbert",
    "Cotter",
    "Westin",
    "Merlwyb",
    "Urianger",
    "Zanthael",
    "Y'shtola",
    "Bloisirant",
    "Toto-Rak",
    "lift",
    "elevator",
    "photocell",
    "A-Ruhn-Senna",
    "pirate",
    "pirates",
    "raiders",
    "antivenom",
]

OWNER_TOKENS = [
    "CLIFTON",
    "DYRSTBROD",
    "GALEREN",
    "GUINCUM",
    "Aubrey",
    "Fyrilskyf",
    "Albin",
    "TGizzoh",
    "Denston",
    "Challinie",
    "Lewin",
    "Pesi",
    "Swethyna",
    "Concessa",
    "Kinborow",
    "Norbertillon",
    "Sorezari",
    "merlwyb",
    "uri",
]


def read_text(path: Path) -> str:
    if not path or not path.exists() or not path.is_file():
        return ""
    return path.read_text(encoding="utf-8", errors="replace")


def ascii_clean(text: object) -> str:
    value = str(text or "")
    replacements = {
        "\u2018": "'",
        "\u2019": "'",
        "\u201c": '"',
        "\u201d": '"',
        "\u2013": "-",
        "\u2014": "-",
        "\u2026": "...",
        "\xa0": " ",
    }
    for source, target in replacements.items():
        value = value.replace(source, target)
    value = re.sub(r"\[@[^\]]+\]", "", value)
    value = re.sub(r"<[^>]+>", " ", value)
    value = value.encode("ascii", errors="ignore").decode("ascii")
    value = re.sub(r"\s+", " ", value).strip()
    return value


def snippet(text: object, words: int = 12) -> str:
    value = ascii_clean(text)
    parts = value.split()
    if len(parts) <= words:
        return value
    return " ".join(parts[:words]) + "..."


def csv_write(path: Path, rows: Iterable[dict[str, object]], fields: list[str]) -> int:
    rows = list(rows)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})
    return len(rows)


def csv_join(values: Iterable[object], limit: int | None = None) -> str:
    out: list[str] = []
    seen: set[str] = set()
    for value in values:
        text = ascii_clean(value)
        if not text or text in seen:
            continue
        seen.add(text)
        out.append(text)
    if limit is not None:
        out = out[:limit]
    return "; ".join(out)


def line_number(path: Path, pattern: str) -> int:
    regex = re.compile(pattern)
    for index, line in enumerate(read_text(path).splitlines(), 1):
        if regex.search(line):
            return index
    return 0


def line_ref(path: Path | str, line: int = 0) -> str:
    text = str(path).replace("/", "\\")
    return f"{text}:{line}" if line else text


def dat_rows(path: Path) -> dict[int, dict[str, object]]:
    rows: dict[int, dict[str, object]] = {}
    if not path.exists():
        return rows
    with path.open(encoding="utf-8-sig", errors="replace", newline="") as handle:
        reader = csv.reader(handle)
        for line_index, row in enumerate(reader, 1):
            if line_index <= 2 or not row:
                continue
            try:
                row_id = int(row[0])
            except ValueError:
                continue
            english = row[2] if len(row) > 2 else ""
            rows[row_id] = {
                "row_id": row_id,
                "english": ascii_clean(english),
                "line": line_index,
                "ref": line_ref(path, line_index),
            }
    return rows


def text_tags(text: str) -> list[str]:
    value = text.lower()
    tags: list[str] = []
    for term in TEXT_TERMS:
        if term.lower() in value:
            tags.append(term)
    return tags


def extract_functions(path: Path) -> list[dict[str, object]]:
    text = read_text(path)
    if not text:
        return []
    pattern = re.compile(r"^function\s+([A-Za-z0-9_]+)\.([A-Za-z0-9_]+)\(([^)]*)\)", re.M)
    matches = list(pattern.finditer(text))
    functions: list[dict[str, object]] = []
    for index, match in enumerate(matches):
        start = match.end()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        body = text[start:end]
        args = [part.strip() for part in match.group(3).split(",") if part.strip()]
        line = text.count("\n", 0, match.start()) + 1
        functions.append(
            {
                "class_name": match.group(1),
                "method": match.group(2),
                "args": args,
                "body": body,
                "line": line,
                "source_ref": line_ref(path, line),
            }
        )
    return functions


def method_say_rows(body: str) -> list[int]:
    return [int(value) for value in re.findall(r":say\([^,\n]+,\s*([0-9]+)\s*,", body)]


def method_ask_rows(body: str) -> list[str]:
    rows: list[str] = []
    for call in re.findall(r":ask\(([^)]*)\)", body):
        numbers = [int(value) for value in re.findall(r"\b[0-9]+\b", call)]
        if len(numbers) >= 2:
            rows.append(f"{numbers[-2]} mode {numbers[-1]}")
    return rows


def method_nq_cutscenes(body: str) -> list[str]:
    return re.findall(r"startNQCutScene\(\"([^\"]+)\"", body)


def method_owner_tokens(method: str) -> list[str]:
    return [token for token in OWNER_TOKENS if token.lower() in method.lower()]


def method_text_summary(rows: list[int], text_rows: dict[int, dict[str, object]], limit: int = 3) -> tuple[str, str, str]:
    highlights: list[int] = []
    for row_id in rows:
        text = str(text_rows.get(row_id, {}).get("english", ""))
        if text and text_tags(text):
            highlights.append(row_id)
    if not highlights:
        highlights = [row_id for row_id in rows if row_id in text_rows]
    highlights = highlights[:limit]
    snippets = [f"{row_id}:{snippet(text_rows[row_id]['english'])}" for row_id in highlights if row_id in text_rows]
    tags = []
    refs = []
    for row_id in highlights:
        row = text_rows.get(row_id)
        if not row:
            continue
        tags.extend(text_tags(str(row["english"])))
        refs.append(row["ref"])
    return csv_join(highlights), csv_join(snippets), csv_join(tags), csv_join(refs)


def text_clue_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for quest in QUESTS:
        text_rows = dat_rows(quest["dat"])
        for row_id, row in sorted(text_rows.items()):
            tags = text_tags(str(row["english"]))
            if not tags:
                continue
            rows.append(
                {
                    "code": quest["code"],
                    "title": quest["title"],
                    "lane": quest["lane"],
                    "row_id": row_id,
                    "clue_tags": csv_join(tags),
                    "snippet": snippet(row["english"]),
                    "source_ref": row["ref"],
                }
            )
    return rows


def recovered_method_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for quest in QUESTS:
        text_rows = dat_rows(quest["dat"])
        for fn in extract_functions(quest["scenario"]):
            body = str(fn["body"])
            say_rows = method_say_rows(body)
            ask_rows = method_ask_rows(body)
            highlight_ids, snippets, tags, dat_refs = method_text_summary(say_rows, text_rows)
            nq = method_nq_cutscenes(body)
            rows.append(
                {
                    "code": quest["code"],
                    "quest_id": quest["quest_id"],
                    "title": quest["title"],
                    "lane": quest["lane"],
                    "method": fn["method"],
                    "arg_count": len(fn["args"]),
                    "owner_tokens": csv_join(method_owner_tokens(str(fn["method"]))),
                    "say_rows": csv_join(say_rows),
                    "ask_rows": csv_join(ask_rows),
                    "nq_cutscenes": csv_join(nq),
                    "text_highlight_rows": highlight_ids,
                    "text_snippets": snippets,
                    "text_clue_tags": tags,
                    "has_show_quest_info": "yes" if "showQuestInfomation" in body else "",
                    "has_salute_or_rank_check": "yes" if "doSalute" in body or "isUpperRank" in body else "",
                    "fade_flags": csv_join(
                        [
                            "fade_out" if "startFadeOut" in body else "",
                            "fade_in" if "startFadeIn" in body else "",
                            "wait" if "_wait(" in body else "",
                        ]
                    ),
                    "source_refs": csv_join([fn["source_ref"], dat_refs]),
                }
            )
    return rows


def owner_candidate_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for quest in QUESTS:
        methods = [str(fn["method"]) for fn in extract_functions(quest["scenario"])]
        token_methods = [method for method in methods if method_owner_tokens(method)]
        start_token = quest["start_owner"].replace(" ", "").lower()
        exactish = [method for method in token_methods if start_token in method.lower()]
        mismatch = ""
        if quest["code"] == "gcu301":
            mismatch = "recovered_start_token_mismatch_clifton_vs_lefchild"
        elif exactish:
            mismatch = "recovered_owner_token_matches_start_owner"
        elif quest["lane"] == "gc_tail":
            mismatch = "external_start_owner_known_but_recovered_start_method_is_generic"
        else:
            mismatch = "local_sequence_owner_known; recovered event methods fill in cutscene flow"
        default_path, default_pattern = quest["default_ref"]
        refs = [
            line_ref(default_path, line_number(default_path, default_pattern)),
            line_ref(CATEGORY_JOBS, line_number(CATEGORY_JOBS, quest["category_ref"])),
            line_ref(QUEST_ARCHIVE, line_number(QUEST_ARCHIVE, quest["archive_ref"])),
            line_ref(quest["scenario"], line_number(quest["scenario"], r"function\s+[A-Za-z0-9_]+\.processEvent")),
            line_ref(quest["script"], 1),
        ]
        rows.append(
            {
                "code": quest["code"],
                "quest_id": quest["quest_id"],
                "title": quest["title"],
                "lane": quest["lane"],
                "external_start_owner": quest["start_owner"],
                "external_start_actor_id": quest["start_actor"],
                "current_local_actor_or_officer": quest["officer_actor"],
                "recovered_owner_methods": csv_join(token_methods),
                "owner_status": mismatch,
                "implementation_note": owner_note(quest, mismatch),
                "source_refs": csv_join(refs),
            }
        )
    return rows


def owner_note(quest: dict[str, object], status: str) -> str:
    code = str(quest["code"])
    if code == "gcu301":
        return "Do not bind Prying Eyes to Clifton without more proof; external data and default talk say Lefchild."
    if str(quest["lane"]) == "gc_tail":
        return "Current wrapper enters GC template/officer flow; per-NPC start owner does not prove battle launch metadata."
    if code in {"com0l5", "com0u5"}:
        return "Seq20 is still scaffolded through Bloisirant fallback; recover the in-dungeon owner before retailizing."
    return "Toto-Rak entry owner is local; recovered method rows are mainly cutscene/lifecycle proof."


def item_refs(item_ids: list[str]) -> str:
    refs: list[str] = []
    for item_id in item_ids:
        refs.append(line_ref(ITEM_SQL, line_number(ITEM_SQL, rf"\({re.escape(item_id)},'")))
    return csv_join(refs)


def numeric_id_refs(text: str, paths: list[Path]) -> str:
    refs: list[str] = []
    for value in re.findall(r"\b[0-9]{4,7}\b", text):
        for path in paths:
            line = line_number(path, rf"\b{re.escape(value)}\b")
            if line:
                refs.append(line_ref(path, line))
                break
    return csv_join(refs)


def target_hint_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    actor_text = read_text(ACTOR_CLASS_SQL)
    mob_text = "\n".join([read_text(MOB_SQL), read_text(BATTLE_MOB_TYPES_SQL), read_text(BATTLE_SPAWN_SQL)])
    for quest in QUESTS:
        if quest["lane"] != "gc_tail":
            continue
        monster_class = str(quest["monster_class"])
        class_bound = "no"
        mob_bound = "no"
        if monster_class:
            class_bound = "yes" if monster_class.lower() in actor_text.lower() else "no"
            mob_bound = "yes" if monster_class.lower() in mob_text.lower() else "no"
        text_rows = dat_rows(quest["dat"])
        clue_rows = [
            row_id
            for row_id, row in text_rows.items()
            if text_tags(str(row["english"]))
        ][:8]
        rows.append(
            {
                "code": quest["code"],
                "quest_id": quest["quest_id"],
                "title": quest["title"],
                "hint_summary": quest["target_hint"],
                "actor_candidates": quest.get("actor_candidates", ""),
                "generic_analogs": quest.get("generic_analogs", ""),
                "item_ids": csv_join(quest["item_ids"]),
                "monster_class": monster_class,
                "monster_class_file_exists": "yes" if monster_class and quest["monster_path"].exists() else "",
                "monster_class_bound_to_actor_sql": class_bound if monster_class else "",
                "monster_class_bound_to_mob_sql": mob_bound if monster_class else "",
                "text_clue_rows": csv_join(clue_rows),
                "safe_for_gc_battles": "no",
                "required_proof": "Need exact battle step, launch owner, spawned actor/mob row, kill callback, cleanup, return, and reward boundary.",
                "blocker_note": quest.get("blocker_note", ""),
                "source_refs": csv_join(
                    [
                        item_refs(list(quest["item_ids"])),
                        line_ref(quest["monster_path"], 1) if monster_class and quest["monster_path"].exists() else "",
                        line_ref(quest["dat"], text_rows[clue_rows[0]]["line"]) if clue_rows else "",
                        numeric_id_refs(str(quest.get("actor_candidates", "")), [EVENT_SPAWN_SQL, ACTOR_CLASS_SQL]),
                        numeric_id_refs(str(quest.get("generic_analogs", "")), [BATTLE_MOB_TYPES_SQL, BATTLE_SPAWN_SQL, ACTOR_CLASS_SQL]),
                        line_ref(GC_TEMPLATE, line_number(GC_TEMPLATE, r"local\s+GC_BATTLES")),
                    ]
                ),
            }
        )
    return rows


def totorak_cutscene_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for row in recovered_method_rows():
        if row["lane"] != "totorak":
            continue
        body_text = read_text(next(q["scenario"] for q in QUESTS if q["code"] == row["code"]))
        method = str(row["method"])
        method_body = ""
        for fn in extract_functions(next(q["scenario"] for q in QUESTS if q["code"] == row["code"])):
            if fn["method"] == method:
                method_body = str(fn["body"])
                break
        rows.append(
            {
                "code": row["code"],
                "quest_id": row["quest_id"],
                "title": row["title"],
                "method": method,
                "nq_cutscenes": row["nq_cutscenes"],
                "ask_rows": row["ask_rows"],
                "text_clue_tags": row["text_clue_tags"],
                "event_lifetime_flags": row["fade_flags"],
                "after_warp_signal": "yes" if "startFadeIn" in method_body and "startFadeOut" in method_body else "",
                "local_use_status": totorak_method_status(str(row["code"]), method),
                "source_refs": row["source_refs"],
            }
        )
        _ = body_text
    return rows


def totorak_method_status(code: str, method: str) -> str:
    known = {
        ("com0l5", "processEvent_010"): "recovered_after_warp_cutscene_COM0l110; not currently wired as retail NQ adapter",
        ("com0l5", "processEvent_elevator_nq1"): "strong elevator contract: ask row 79, elv0l110, then com0l610",
        ("com0l5", "processEventExit"): "worldMaster exit ask row 51036",
        ("com0g6", "processEventNq"): "strong NQ contract: COM0G510",
        ("com0u5", "processEvent025"): "strong NQ contract: com0u610",
        ("com0l6", "processEvent_010"): "strong NQ contract: com0l510 with payload arg",
        ("com0l6", "processEvent_elevator_nq1"): "elevator NQ contract: elv0l01a",
        ("com0l6", "processEvent_elevator_nq2"): "elevator NQ contract: elv0l02a",
    }
    if (code, method) in known:
        return known[(code, method)]
    if "GUINCUMStart" in method or "AubreyStart" in method or method == "processEventStart":
        return "start-owner dialogue; useful for retail event adapter, not a content launch proof by itself"
    if "Clear" in method or "030" in method or "015" in method:
        return "post-instance or branching dialogue; keep separate from launch and clear completion"
    return "recovered dialogue method; needs local trigger owner proof before wiring"


def wiki_signal_rows() -> list[dict[str, object]]:
    signal_specs = [
        {
            "title": "An Officer and a Wise Man",
            "page": Path("docs/ffxiv-1.0-wiki/pages/An_Officer_and_a_Wise_Man.html"),
            "patterns": [r"Camp Bloodshore", r"Urianger", r"Zanthael", r"instance"],
            "note": "Wiki walkthrough supports a two-instance/cave/Zanthael flow around the local Toto-Rak scaffold.",
        },
        {
            "title": "Burning Man",
            "page": Path("docs/ffxiv-1.0-wiki/pages/Burning_Man.html"),
            "patterns": [r"Thancred", r"Urianger", r"docks"],
            "note": "Wiki summary supports post-entry story actors but not a safe SQB battle row.",
        },
        {
            "title": "The Cove",
            "page": QUEST_ARCHIVE,
            "patterns": [r"side,The Cove"],
            "note": "Archive confirms Clifton/Fisherman's Bottom start and Saving the Stead prerequisite.",
        },
        {
            "title": "Prying Eyes",
            "page": QUEST_ARCHIVE,
            "patterns": [r"side,Prying Eyes"],
            "note": "Archive confirms Lefchild start, which conflicts with recovered CLIFTON method token.",
        },
        {
            "title": "The Pen Is Mightier Than the Spear",
            "page": QUEST_ARCHIVE,
            "patterns": [r"side,The Pen Is Mightier Than the Spear"],
            "note": "Archive confirms Dhemdaeg start while recovered flow introduces Challinie.",
        },
    ]
    rows: list[dict[str, object]] = []
    for spec in signal_specs:
        refs = [line_ref(spec["page"], line_number(spec["page"], pattern)) for pattern in spec["patterns"]]
        rows.append(
            {
                "title": spec["title"],
                "signal": spec["note"],
                "source_refs": csv_join(refs),
            }
        )
    return rows


def totorak_runtime_probe_rows() -> list[dict[str, object]]:
    return [
        {
            "surface": "gm_prep_scene_aliases",
            "purpose": "Prepare each of the four Toto-Rak quest lanes with the current local scene alias mapping.",
            "command_or_actor": "prep limsa/gridania2/uldah/limsa2; prepenter for Bloisirant click path",
            "proof_value": "Separates quest-entry cutscene alias checks from live occupancy lifecycle checks.",
            "source_refs": csv_join(
                [
                    line_ref(GM_TOTORAK, line_number(GM_TOTORAK, r"prep limsa")),
                    line_ref(GM_TOTORAK, line_number(GM_TOTORAK, r"prepenter")),
                    line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"QUEST_ENTRY_SCENES")),
                ]
            ),
        },
        {
            "surface": "recovered_raid_guide_ask",
            "purpose": "Recover the retail-like instance entry prompt contract without forcing the local safe-solo route to claim parity.",
            "command_or_actor": "askEnterInstanceRaid prompt 52045, choices 52046/52047, raid id parameter",
            "proof_value": "Use as entry UI contract; not as proof that Bloisirant wrapper is retail complete.",
            "source_refs": line_ref(RECOVERED_RAID_GUIDE, line_number(RECOVERED_RAID_GUIDE, r"askEnterInstanceRaid")),
        },
        {
            "surface": "in_dungeon_owner_candidates",
            "purpose": "Track possible Toto-Rak interior interaction owners before wiring seq20/seq30 away from fallback Bloisirant.",
            "command_or_actor": "A-Ruhn-Senna 1001571; Toto-Rak entrance NPCs 1001636-1001638",
            "proof_value": "Candidate-owner evidence only; no quest sequence binding yet.",
            "source_refs": csv_join(
                [
                    line_ref(DFT_FST, line_number(DFT_FST, r"1001571")),
                    line_ref(DFT_FST, line_number(DFT_FST, r"1001636")),
                ]
            ),
        },
        {
            "surface": "elevator_owner_candidate",
            "purpose": "Separate generic elevator object NQs from quest-side elevator chains.",
            "command_or_actor": "ElevatorStandard elv0l01a/elv0l02a; com0l5 quest-side elv0l110 still lacks local owner binding",
            "proof_value": "Prevents treating object elevator NQs as proof for com0l5/com0l6 sequence advancement.",
            "source_refs": csv_join(
                [
                    line_ref(RECOVERED_ELEVATOR, line_number(RECOVERED_ELEVATOR, r"elv0l01a")),
                    line_ref(RECOVERED_ELEVATOR, line_number(RECOVERED_ELEVATOR, r"elv0l02a")),
                    line_ref(CONTENT_SCENARIO / "com/com0l5.lua", line_number(CONTENT_SCENARIO / "com/com0l5.lua", r"elv0l110")),
                ]
            ),
        },
        {
            "surface": "live_lifecycle_probes",
            "purpose": "Exercise normal occupancy, widget, duty cutscene, and boss clear paths independently.",
            "command_or_actor": "start; livetest widgetonly/csprobe; dutycs; livecs; spawnboss shaula",
            "proof_value": "Best path for proving opening/clear/fail/exit cutscene dispatch without granting quest rewards.",
            "source_refs": csv_join(
                [
                    line_ref(GM_TOTORAK, line_number(GM_TOTORAK, r"\bstart\b")),
                    line_ref(GM_TOTORAK, line_number(GM_TOTORAK, r"livetest")),
                    line_ref(GM_TOTORAK, line_number(GM_TOTORAK, r"dutycs")),
                    line_ref(GM_TOTORAK, line_number(GM_TOTORAK, r"livecs")),
                    line_ref(GM_TOTORAK, line_number(GM_TOTORAK, r"spawnboss")),
                ]
            ),
        },
        {
            "surface": "shaula_clear_once",
            "purpose": "Prove battle-to-clear-cutscene transition without conflating it with quest completion.",
            "command_or_actor": "Shaula actor class 2301104 death -> clear/rad0f306 once",
            "proof_value": "Concrete combat lifecycle probe for Toto-Rak.",
            "source_refs": csv_join(
                [
                    line_ref(WORLD_MANAGER, line_number(WORLD_MANAGER, r"2301104")),
                    line_ref(WORLD_MANAGER, line_number(WORLD_MANAGER, r"rad0f306")),
                    line_ref(Path("Map Server/Actors/Chara/Npc/BattleNpc.cs"), line_number(Path("Map Server/Actors/Chara/Npc/BattleNpc.cs"), r"HandleTotorakBattleNpcDeath")),
                ]
            ),
        },
    ]


def gate_rows() -> list[dict[str, object]]:
    return [
        {
            "gate": "gc_owner_vs_battle_owner",
            "applies_to": "gcl301/gcl302/gcg301/gcg302/gcu301/gcu302",
            "finding": "Start owner/default talk evidence is useful, but does not prove SQB launch owner or kill target.",
            "next_action": "Recover GC_BATTLES metadata before changing template active-step routing.",
            "source_refs": csv_join(
                [
                    line_ref(GC_TEMPLATE, line_number(GC_TEMPLATE, r"local\s+GC_BATTLES")),
                    line_ref(GC_TEMPLATE, line_number(GC_TEMPLATE, r"function onTalk")),
                    line_ref(SQB_ADAPTER_ROWS, line_number(SQB_ADAPTER_ROWS, r",gcl301,")),
                    line_ref(PUSH_OPERATOR_ROWS, line_number(PUSH_OPERATOR_ROWS, r",gcl301,")),
                ]
            ),
        },
        {
            "gate": "gc_numeric_bnpc_blocked",
            "applies_to": "all six GC tails",
            "finding": "Recovered Lua/correlation rows prove text and method shape only; generic dart slug/kobold/dreadwolf/fly/coblyn/beast analogs are not safe BNPC IDs.",
            "next_action": "Require exact quest-bound actor/mob type, spawn/materialization path, death callback, cleanup, and return path before enabling a battle row.",
            "source_refs": csv_join(
                [
                    line_ref(TEXT_USAGE_ROWS, line_number(TEXT_USAGE_ROWS, r"gcl301|gcl302|gcg301|gcg302|gcu301|gcu302")),
                    line_ref(METHOD_SUMMARY_ROWS, line_number(METHOD_SUMMARY_ROWS, r"gcl301|gcl302|gcg301|gcg302|gcu301|gcu302")),
                    line_ref(SQB_ADAPTER_ROWS, line_number(SQB_ADAPTER_ROWS, r"gcl301|gcl302|gcg301|gcg302|gcu301|gcu302")),
                ]
            ),
        },
        {
            "gate": "gcu301_owner_mismatch",
            "applies_to": "Prying Eyes",
            "finding": "External/default data says Lefchild; recovered method name says CLIFTONStart.",
            "next_action": "Treat as asset reuse or decomp naming anomaly until another source proves the event actor.",
            "source_refs": csv_join([line_ref(CATEGORY_JOBS, line_number(CATEGORY_JOBS, r"Prying Eyes \| Lefchild")), line_ref(MORE_SCENARIO / "gcu/gcu301.lua", line_number(MORE_SCENARIO / "gcu/gcu301.lua", r"processEventCLIFTONStart"))]),
        },
        {
            "gate": "totorak_cutscene_lifetime",
            "applies_to": "com0l5/com0g6/com0u5/com0l6",
            "finding": "Recovered events combine fades, asks, and NQ cutscenes; local zone-change helpers can also close events.",
            "next_action": "Guard successful zone-changing tails before wiring retail-like cutscene adapters.",
            "source_refs": csv_join([line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"TotorakTryStartFromNpc")), line_ref(INSTANCE_RAID_EXIT, line_number(INSTANCE_RAID_EXIT, r"player:EndEvent")), line_ref(WORLD_MANAGER, line_number(WORLD_MANAGER, r"DoZoneChangeContent"))]),
        },
        {
            "gate": "totorak_seq20_owner",
            "applies_to": "com0l5/com0u5",
            "finding": "Local seq20/seq30 fallback still uses Bloisirant, while recovered text points to in-dungeon or post-instance actors.",
            "next_action": "Recover in-dungeon owner/trigger before retailizing completion flow.",
            "source_refs": csv_join([line_ref(Path("Data/scripts/quests/com/com0l5.lua"), line_number(Path("Data/scripts/quests/com/com0l5.lua"), r"TODO: replace")), line_ref(Path("Data/scripts/quests/com/com0u5.lua"), line_number(Path("Data/scripts/quests/com/com0u5.lua"), r"TODO: replace"))]),
        },
        {
            "gate": "com0u5_scene_alias_mismatch",
            "applies_to": "Burning Man",
            "finding": "Local com0u510 is suspicious for com0u5; recovered com0u5 processEvent025 plays com0u610, while com0u510 belongs to another quest path.",
            "next_action": "Do not wire com0u510 as Burning Man's recovered NQ without another source proving alias reuse.",
            "source_refs": csv_join([line_ref(Path("Data/scripts/quests/com/com0u5.lua"), line_number(Path("Data/scripts/quests/com/com0u5.lua"), r"com0u510")), line_ref(CONTENT_SCENARIO / "com/com0u5.lua", line_number(CONTENT_SCENARIO / "com/com0u5.lua", r"com0u610"))]),
        },
    ]


def write_doc(path: Path, output_dir: Path) -> None:
    lines = [
        "# Quest Instanced Event Text/Owner Decomp - 2026-07-02",
        "",
        "This pass joins recovered scenario Lua, localized event-text rows, default-talk owner mappings, wiki/category breadcrumbs, and SQL item/class hints. Dialogue is reduced to short snippets and tags on purpose; the point is evidence shape, not transcript recovery.",
        "",
        "## Findings",
        "",
        "- GC tail start owners are now separated from battle/content owners. Clifton, Hasthwab, Dyrstbrod, Dhemdaeg, Lefchild, and Galeren are useful entry-owner candidates, but none proves a `GC_BATTLES` row.",
        "- `gcu301`/Prying Eyes is the caution flag: external/default-talk evidence says Lefchild, while recovered Lua names `processEventCLIFTONStart`. Keep it blocked until another source explains the mismatch.",
        "- The best GC target hints are still hints: `gcl301` has `Dart Slug Anti-venom` plus `SlugLesserQuestGcl301`; `gcg302` has `Sketch of Challinie` plus `FlyLesserQuestGcg302`; `gcu301` has coblyn/item clues. None of those analogs is bound to a quest-safe actor/mob/callback row.",
        "- Helper NPC candidates are now tracked for the unresolved tails: Hasthwab/Fyrilskyf/Albin/TGizzoh/Denston, Dhemdaeg/Challinie, Galeren/Cotter/Westin, and Lefchild. Several are empty-script or display-only clues, so they remain owner evidence, not wiring proof.",
        "- Toto-Rak recovered methods now give concrete cutscene contracts: `com0l5` elevator asks row 79 then chains `elv0l110` -> `com0l610`; `com0g6` plays `COM0G510`; `com0u5` plays `com0u610`; `com0l6` plays `com0l510` and has elevator NQs.",
        "- Cutscene wiring remains separate from completion/reward wiring. The local Toto-Rak entry/exit helpers can already zone-change and close events, so retail-like adapters need event-lifetime guards first.",
        "",
        "## Generated Files",
        "",
        f"- `{output_dir / 'quest_text_clue_rows.csv'}`",
        f"- `{output_dir / 'recovered_method_text_rows.csv'}`",
        f"- `{output_dir / 'event_owner_candidate_rows.csv'}`",
        f"- `{output_dir / 'gc_target_hint_rows.csv'}`",
        f"- `{output_dir / 'totorak_cutscene_flow_rows.csv'}`",
        f"- `{output_dir / 'totorak_runtime_probe_rows.csv'}`",
        f"- `{output_dir / 'wiki_walkthrough_signal_rows.csv'}`",
        f"- `{output_dir / 'decomp_gate_rows.csv'}`",
    ]
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


TEXT_CLUE_FIELDS = ["code", "title", "lane", "row_id", "clue_tags", "snippet", "source_ref"]

METHOD_FIELDS = [
    "code",
    "quest_id",
    "title",
    "lane",
    "method",
    "arg_count",
    "owner_tokens",
    "say_rows",
    "ask_rows",
    "nq_cutscenes",
    "text_highlight_rows",
    "text_snippets",
    "text_clue_tags",
    "has_show_quest_info",
    "has_salute_or_rank_check",
    "fade_flags",
    "source_refs",
]

OWNER_FIELDS = [
    "code",
    "quest_id",
    "title",
    "lane",
    "external_start_owner",
    "external_start_actor_id",
    "current_local_actor_or_officer",
    "recovered_owner_methods",
    "owner_status",
    "implementation_note",
    "source_refs",
]

TARGET_FIELDS = [
    "code",
    "quest_id",
    "title",
    "hint_summary",
    "actor_candidates",
    "generic_analogs",
    "item_ids",
    "monster_class",
    "monster_class_file_exists",
    "monster_class_bound_to_actor_sql",
    "monster_class_bound_to_mob_sql",
    "text_clue_rows",
    "safe_for_gc_battles",
    "required_proof",
    "blocker_note",
    "source_refs",
]

TOTORAK_CUTSCENE_FIELDS = [
    "code",
    "quest_id",
    "title",
    "method",
    "nq_cutscenes",
    "ask_rows",
    "text_clue_tags",
    "event_lifetime_flags",
    "after_warp_signal",
    "local_use_status",
    "source_refs",
]

WIKI_FIELDS = ["title", "signal", "source_refs"]
TOTORAK_RUNTIME_FIELDS = ["surface", "purpose", "command_or_actor", "proof_value", "source_refs"]
GATE_FIELDS = ["gate", "applies_to", "finding", "next_action", "source_refs"]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    args.output.mkdir(parents=True, exist_ok=True)
    text_rows = text_clue_rows()
    method_rows = recovered_method_rows()
    owner_rows = owner_candidate_rows()
    target_rows = target_hint_rows()
    totorak_rows = totorak_cutscene_rows()
    runtime_rows = totorak_runtime_probe_rows()
    wiki_rows = wiki_signal_rows()
    gates = gate_rows()

    csv_write(args.output / "quest_text_clue_rows.csv", text_rows, TEXT_CLUE_FIELDS)
    csv_write(args.output / "recovered_method_text_rows.csv", method_rows, METHOD_FIELDS)
    csv_write(args.output / "event_owner_candidate_rows.csv", owner_rows, OWNER_FIELDS)
    csv_write(args.output / "gc_target_hint_rows.csv", target_rows, TARGET_FIELDS)
    csv_write(args.output / "totorak_cutscene_flow_rows.csv", totorak_rows, TOTORAK_CUTSCENE_FIELDS)
    csv_write(args.output / "totorak_runtime_probe_rows.csv", runtime_rows, TOTORAK_RUNTIME_FIELDS)
    csv_write(args.output / "wiki_walkthrough_signal_rows.csv", wiki_rows, WIKI_FIELDS)
    csv_write(args.output / "decomp_gate_rows.csv", gates, GATE_FIELDS)
    write_doc(args.doc, args.output)

    print(f"wrote {len(text_rows)} text clue rows")
    print(f"wrote {len(method_rows)} recovered method rows")
    print(f"wrote {len(owner_rows)} owner candidate rows")
    print(f"wrote {len(target_rows)} GC target hint rows")
    print(f"wrote {len(totorak_rows)} Toto-Rak cutscene rows")
    print(f"wrote {len(runtime_rows)} Toto-Rak runtime probe rows")
    print(f"wrote {len(wiki_rows)} wiki signal rows")
    print(f"wrote {len(gates)} decomp gate rows")
    print(f"wrote {args.doc}")


if __name__ == "__main__":
    main()
