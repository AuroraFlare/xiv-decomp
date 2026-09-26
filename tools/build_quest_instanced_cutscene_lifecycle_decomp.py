#!/usr/bin/env python3
"""Build a cutscene/lifecycle decomp matrix for the instanced quest slice."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Iterable


DEFAULT_OUTPUT = Path("outputs/quest-instanced-cutscene-lifecycle-20260702")
DEFAULT_DOC = Path("docs/quest_instanced_cutscene_lifecycle_decomp_2026-07-02.md")

CONTENT_SCENARIO = Path("tools/outputs/lpb/content_systems_20260612/lua/quest/scenario")
MORE_SCENARIO = Path("tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario")
SQB_DIRECTOR_ROOT = Path("tools/outputs/lpb/decomp_more_20260617/lua/director/quest/simplequestbattle")

TOTORAK_ENTRY = Path("Data/scripts/totorak_entry.lua")
GC_TEMPLATE = Path("Data/scripts/quests/com/gc_quest_template.lua")
GLOBAL_LUA = Path("Data/scripts/global.lua")
WORLD_MANAGER = Path("Map Server/WorldManager.cs")
PLAYER_CS = Path("Map Server/Actors/Chara/Player/Player.cs")

TOTORAK_ENTRY_QUEST_SCRIPTS = [
    Path("Data/scripts/quests/com/com0l5.lua"),
    Path("Data/scripts/quests/com/com0g6.lua"),
    Path("Data/scripts/quests/com/com0u5.lua"),
    Path("Data/scripts/quests/com/com0l6.lua"),
]


QUESTS = [
    {
        "code": "com0u4",
        "quest_id": "111804",
        "title": "Arms Race",
        "lane": "sqb_spawn_ready_postkill_cutscene",
        "script": "Data/scripts/quests/com/com0u4.lua",
        "scenario": CONTENT_SCENARIO / "com/com0u4.lua",
        "director": "questdirectorcom0u401.lua",
        "focus": "Hellhound kill advances 10->20; post-kill Aubrey talk uses com0u410 local alias.",
    },
    {
        "code": "com0g1",
        "quest_id": "111601",
        "title": "Breaking the Seals",
        "lane": "sqb_spawn_ready_afterwarp_cutscene",
        "script": "Data/scripts/quests/com/com0g1.lua",
        "scenario": CONTENT_SCENARIO / "com/com0g1.lua",
        "director": "questdirectorcom0g101.lua",
        "focus": "Urianger and Ailith route has COM0G105/COM0G110 after-warp variants around the familiar fight.",
    },
    {
        "code": "com0u1",
        "quest_id": "111801",
        "title": "Career Opportunities",
        "lane": "sqb_spawn_ready_afterwarp_cutscene",
        "script": "Data/scripts/quests/com/com0u1.lua",
        "scenario": CONTENT_SCENARIO / "com/com0u1.lua",
        "director": "questdirectorcom0u101.lua",
        "focus": "Urianger and Taylor route has COM0U105/COM0U110 after-warp variants around the familiar fight.",
    },
    {
        "code": "com0l4",
        "quest_id": "111404",
        "title": "Engineering Victory",
        "lane": "sqb_shell_cutscene_only",
        "script": "Data/scripts/quests/com/com0l4.lua",
        "scenario": CONTENT_SCENARIO / "com/com0l4.lua",
        "director": "questdirectorcom0l401.lua",
        "focus": "Recovered client has com0l410 cutscene in processEvent_020, but SQB director is shell-only.",
    },
    {
        "code": "com0g4",
        "quest_id": "111604",
        "title": "The Mail Must Get Through",
        "lane": "sqb_shell_cutscene_only",
        "script": "Data/scripts/quests/com/com0g4.lua",
        "scenario": CONTENT_SCENARIO / "com/com0g4.lua",
        "director": "questdirectorcom0g401.lua",
        "focus": "Recovered client has com0g410 in processEventClear only when args are 0,0.",
    },
    {
        "code": "com0l1",
        "quest_id": "111401",
        "title": "The Price of Integrity",
        "lane": "sqb_spawn_ready_afterwarp_cutscene",
        "script": "Data/scripts/quests/com/com0l1.lua",
        "scenario": CONTENT_SCENARIO / "com/com0l1.lua",
        "director": "questdirectorcom0l101.lua",
        "focus": "Urianger and Walcher route has COM0L105/COM0l110 after-warp variants around the familiar fight.",
    },
    {
        "code": "etc2g3",
        "quest_id": "110667",
        "title": "Hunting the Hunters",
        "lane": "push_object_not_sqb",
        "script": "Data/scripts/quests/etc/etc2g3.lua",
        "scenario": MORE_SCENARIO / "etc/etc2g3.lua",
        "director": "",
        "focus": "Local QFLAG_PUSH objective 4000257 advances 0->1; do not replace with SQB.",
    },
    {
        "code": "com0l5",
        "quest_id": "111405",
        "title": "An Officer and a Wise Man",
        "lane": "totorak_entry_investigation_gap",
        "script": "Data/scripts/quests/com/com0l5.lua",
        "scenario": CONTENT_SCENARIO / "com/com0l5.lua",
        "director": "questdirectorcom0l501.lua",
        "focus": "Bloisirant starts Toto-Rak; recovered client has COM0l110 and elevator/exit asks.",
    },
    {
        "code": "com0g6",
        "quest_id": "111606",
        "title": "Appetite for Destruction",
        "lane": "totorak_entry_cutscene_gap",
        "script": "Data/scripts/quests/com/com0g6.lua",
        "scenario": CONTENT_SCENARIO / "com/com0g6.lua",
        "director": "questdirectorcom0g601.lua",
        "focus": "Bloisirant starts Toto-Rak; recovered processEventNq plays COM0G510.",
    },
    {
        "code": "com0u5",
        "quest_id": "111805",
        "title": "Burning Man",
        "lane": "totorak_entry_investigation_gap",
        "script": "Data/scripts/quests/com/com0u5.lua",
        "scenario": CONTENT_SCENARIO / "com/com0u5.lua",
        "director": "questdirectorcom0u501.lua",
        "focus": "Explicit SQB quest id override exists, but local route is Toto-Rak and recovered processEvent025 uses com0u610 after warp.",
    },
    {
        "code": "com0l6",
        "quest_id": "111406",
        "title": "Ceruleum Shock",
        "lane": "totorak_entry_cutscene_gap",
        "script": "Data/scripts/quests/com/com0l6.lua",
        "scenario": CONTENT_SCENARIO / "com/com0l6.lua",
        "director": "questdirectorcom0l601.lua",
        "focus": "Explicit SQB quest id override exists; processEvent_010 plays com0l510 with a payload arg, elevator tails warp.",
    },
    {
        "code": "gcu302",
        "quest_id": "111818",
        "title": "Different Strokes",
        "lane": "gc_template_tail_metadata_only",
        "script": "Data/scripts/quests/gcu/gcu302.lua",
        "scenario": MORE_SCENARIO / "gcu/gcu302.lua",
        "director": "questdirectorgcu30201.lua",
        "focus": "Template wrapper only; recovered client has several talk/cutscene methods but no local GC_BATTLES row.",
    },
    {
        "code": "gcg301",
        "quest_id": "111617",
        "title": "Eternal Recurrence",
        "lane": "gc_template_tail_metadata_only",
        "script": "Data/scripts/quests/gcg/gcg301.lua",
        "scenario": MORE_SCENARIO / "gcg/gcg301.lua",
        "director": "questdirectorgcg30101.lua",
        "focus": "Template wrapper only; recovered client methods do not identify a safe battle row by themselves.",
    },
    {
        "code": "gcu301",
        "quest_id": "111817",
        "title": "Prying Eyes",
        "lane": "gc_template_tail_metadata_only",
        "script": "Data/scripts/quests/gcu/gcu301.lua",
        "scenario": MORE_SCENARIO / "gcu/gcu301.lua",
        "director": "questdirectorgcu30101.lua",
        "focus": "Template wrapper only; recovered client methods do not identify a safe battle row by themselves.",
    },
    {
        "code": "gcl302",
        "quest_id": "111418",
        "title": "Saving the Stead Instead",
        "lane": "gc_template_tail_metadata_only",
        "script": "Data/scripts/quests/gcl/gcl302.lua",
        "scenario": MORE_SCENARIO / "gcl/gcl302.lua",
        "director": "questdirectorgcl30201.lua",
        "focus": "Template wrapper only; recovered client has processEventClear but no local battle metadata.",
    },
    {
        "code": "gcl301",
        "quest_id": "111417",
        "title": "The Cove",
        "lane": "gc_template_tail_metadata_only",
        "script": "Data/scripts/quests/gcl/gcl301.lua",
        "scenario": MORE_SCENARIO / "gcl/gcl301.lua",
        "director": "questdirectorgcl30101.lua",
        "focus": "Template wrapper only; recovered client methods do not identify a safe battle row by themselves.",
    },
    {
        "code": "gcg302",
        "quest_id": "111618",
        "title": "The Pen Is Mightier Than the Spear",
        "lane": "gc_template_tail_metadata_only",
        "script": "Data/scripts/quests/gcg/gcg302.lua",
        "scenario": MORE_SCENARIO / "gcg/gcg302.lua",
        "director": "questdirectorgcg30201.lua",
        "focus": "Template wrapper only; recovered client has processEventClear but no local battle metadata.",
    },
    {
        "code": "com0u6",
        "quest_id": "111806",
        "title": "Know Your Enemy",
        "lane": "actor_data_blocked_afterwarp_cutscene",
        "script": "Data/scripts/quests/com/com0u6.lua",
        "scenario": CONTENT_SCENARIO / "com/com0u6.lua",
        "director": "questdirectorcom0u601.lua",
        "focus": "Local Charledore kill guard exists, but actor 2289025 is not spawn-safe; recovered com0u510 path is after-warp sensitive.",
    },
]


KEY_METHOD_HINTS = {
    "com0u4": "processEvent_050 starts NQ com0u410 unless payload arg 1 chooses talk-only branch.",
    "com0g1": "processEventUrianger uses COM0G105; processEventUriangerMore uses COM0G110 and always after-warp fade-in.",
    "com0u1": "processEvent_020 uses COM0U105; processEvent_030 uses COM0U110 and always after-warp fade-in.",
    "com0l1": "processEvent_020 uses COM0L105; processEvent_030 uses COM0l110 and always after-warp fade-in.",
    "com0l4": "processEvent_020 starts NQ com0l410 unless payload arg 1 chooses talk-only branch.",
    "com0g4": "processEventClear starts NQ com0g410 only when both payload args are 0.",
    "com0l5": "processEvent_010 starts COM0l110 after warp; elevator methods ask row 79; processEventExit asks 51036.",
    "com0g6": "processEventNq starts COM0G510; processEventClear is payload-sensitive talk.",
    "com0u5": "processEvent025 starts com0u610 after warp; local com0u510 post-instance talk remains unmapped to a same-name NQ in recovered Lua.",
    "com0l6": "processEvent_010 starts com0l510 with payload arg; elevator methods use after-warp fade-in.",
    "com0u6": "processEvent_005_03 starts com0u510 with payload arg and after-warp fade-in; elevator methods also after-warp.",
}


def read_text(path: Path) -> str:
    if not path.exists() or not path.is_file():
        return ""
    return path.read_text(encoding="utf-8", errors="replace")


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
        text = str(value or "").strip()
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


def line_ref(path: str | Path, line: int = 0) -> str:
    text = str(path).replace("/", "\\")
    return f"{text}:{line}" if line else text


def has_immediate_return_after_line(lines: list[str], line_no: int) -> bool:
    for raw in lines[line_no : min(len(lines), line_no + 5)]:
        stripped = raw.strip()
        if re.match(r"return\s*;?$", stripped):
            return True
        if stripped == "end" or stripped == "end;":
            return False
    return False


def parse_constants(text: str) -> dict[str, str]:
    constants: dict[str, str] = {}
    for line in text.splitlines():
        match = re.match(r"\s*([A-Z][A-Z0-9_]+)\s*=\s*([0-9]+)\s*;", line)
        if match:
            constants[match.group(1)] = match.group(2)
    return constants


def parse_sequence_comments(text: str) -> dict[str, str]:
    out: dict[str, str] = {}
    for line in text.splitlines():
        match = re.match(r"\s*(SEQ_[A-Z0-9_]+)\s*=\s*([0-9]+)\s*;\s*(?:--\s*(.*))?", line)
        if match:
            comment = (match.group(3) or "").strip()
            out[match.group(1)] = f"{match.group(1)}({match.group(2)}): {comment}".strip()
    return out


def local_event_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for quest in QUESTS:
        path = Path(str(quest["script"]))
        text = read_text(path)
        constants = parse_constants(text)
        sequences = parse_sequence_comments(text)
        current_sequence = ""
        current_actor = ""
        in_on_talk = False
        in_on_push = False
        lines = text.splitlines()
        for line_no, line in enumerate(lines, 1):
            stripped = line.strip()
            if re.match(r"function\s+onTalk\b", stripped):
                in_on_talk = True
                in_on_push = False
                current_sequence = ""
                current_actor = ""
            elif re.match(r"function\s+onPush\b", stripped):
                in_on_push = True
                in_on_talk = False
                current_sequence = ""
                current_actor = ""
            elif re.match(r"function\s+", stripped):
                in_on_talk = False
                in_on_push = False

            if not (in_on_talk or in_on_push):
                continue

            seq_match = re.search(r"sequence\s*==\s*(SEQ_[A-Z0-9_]+)", stripped)
            if not seq_match:
                seq_match = re.search(r"quest:GetSequence\(\)\s*~=\s*(SEQ_[A-Z0-9_]+)", stripped)
            if seq_match:
                current_sequence = seq_match.group(1)
                current_actor = ""

            actor_match = re.search(r"classId\s*==\s*([A-Z][A-Z0-9_]+)", stripped)
            if not actor_match:
                actor_match = re.search(r"npcClassId\s*~=\s*([A-Z][A-Z0-9_]+)", stripped)
            if actor_match:
                current_actor = actor_match.group(1)

            call_match = re.search(r'callClientFunction\(player,\s*"([^"]+)",\s*(.*)\)\s*;?', stripped)
            if "TotorakTryStartFromNpc(player)" in stripped:
                guarded_return = has_immediate_return_after_line(lines, line_no)
                rows.append(
                    {
                        "code": quest["code"],
                        "quest_id": quest["quest_id"],
                        "title": quest["title"],
                        "lane": quest["lane"],
                        "handler": "onTalk",
                        "sequence": sequences.get(current_sequence, current_sequence),
                        "owner_actor_constant": current_actor,
                        "owner_actor_id": constants.get(current_actor, ""),
                        "event_function": "TotorakTryStartFromNpc",
                        "event_alias_or_method": "totorak_entry",
                        "extra_args": "",
                        "post_call_mutations": (
                            "helper_zone_change:TotorakStartDebugInstance/StartTotorakInstance; "
                            "quest_sequence:StartSequence(20); handler_tail_close_skipped_on_started=true"
                            if guarded_return
                            else local_post_context(lines, line_no)
                        ),
                        "event_end_policy": (
                            "guarded return skips onTalk tail when helper starts content; false result falls through to player:EndEvent"
                            if guarded_return
                            else "player:EndEvent at onTalk tail after entry attempt"
                        ),
                        "source_ref": line_ref(path, line_no),
                    }
                )
            if not call_match:
                continue

            event_function = call_match.group(1)
            args = call_match.group(2)
            alias_match = re.search(r'"([^"]+)"', args)
            alias = alias_match.group(1) if alias_match else ""
            extra_args = ""
            if alias_match:
                after_alias = args[alias_match.end() :].strip()
                if after_alias.startswith(","):
                    extra_args = after_alias[1:].strip()
            owner_constant = current_actor or ("IXAL_OBJECTIVE" if in_on_push and quest["code"] == "etc2g3" else "")
            owner_id = constants.get(owner_constant, "")
            if quest["code"] == "etc2g3" and in_on_talk:
                owner_constant = "ODHINEK|ODHINEK_ACTOR"
                owner_id = "1900140|1000829"
            rows.append(
                {
                    "code": quest["code"],
                    "quest_id": quest["quest_id"],
                    "title": quest["title"],
                    "lane": quest["lane"],
                    "handler": "onPush" if in_on_push else "onTalk",
                    "sequence": sequences.get(current_sequence, current_sequence),
                    "owner_actor_constant": owner_constant,
                    "owner_actor_id": owner_id,
                    "event_function": event_function,
                    "event_alias_or_method": alias,
                    "extra_args": extra_args,
                    "post_call_mutations": local_post_context(text.splitlines(), line_no),
                    "event_end_policy": "explicit EndEvent in branch" if "player:EndEvent()" in local_post_context(text.splitlines(), line_no, 4) else "player:EndEvent at handler tail",
                    "source_ref": line_ref(path, line_no),
                }
            )

        if quest["code"] == "etc2g3":
            rows.append(
                {
                    "code": quest["code"],
                    "quest_id": quest["quest_id"],
                    "title": quest["title"],
                    "lane": quest["lane"],
                    "handler": "onPush",
                    "sequence": sequences.get("SEQ_000", "SEQ_000"),
                    "owner_actor_constant": "IXAL_OBJECTIVE",
                    "owner_actor_id": "4000257",
                    "event_function": "none",
                    "event_alias_or_method": "QFLAG_PUSH objective",
                    "extra_args": "",
                    "post_call_mutations": "attentionMessage(..., 25225, questId); quest:StartSequence(SEQ_001); quest:UpdateENPCs(); player:EndEvent()",
                    "event_end_policy": "no client cutscene; immediate EndEvent after push mutation",
                    "source_ref": line_ref(path, line_number(path, r"function\s+onPush")),
                }
            )

        if str(quest["lane"]).startswith("gc_template"):
            rows.append(
                {
                    "code": quest["code"],
                    "quest_id": quest["quest_id"],
                    "title": quest["title"],
                    "lane": quest["lane"],
                    "handler": "template",
                    "sequence": "dynamic GC step",
                    "owner_actor_constant": "city officer",
                    "owner_actor_id": "1500198/1500199/1500200",
                    "event_function": "InitGrandCompanyQuest",
                    "event_alias_or_method": "no local delegateEvent in wrapper",
                    "extra_args": "",
                    "post_call_mutations": "gc_quest_template onTalk advances unless GC_BATTLES row exists",
                    "event_end_policy": "template player:EndEvent after officer advance",
                    "source_ref": line_ref(path, line_number(path, r"InitGrandCompanyQuest")),
                }
            )
    return rows


def local_post_context(lines: list[str], line_no: int, window: int = 8) -> str:
    findings: list[str] = []
    for raw in lines[line_no : min(len(lines), line_no + window)]:
        text = raw.strip().rstrip(";")
        if not text:
            continue
        if any(token in text for token in ("StartSequence", "AddItem", "RemoveItem", "AddExp", "AddGil", "CompleteQuest", "AcceptQuest", "EndEvent")):
            findings.append(text)
    return csv_join(findings)


def extract_functions(path: Path) -> list[dict[str, object]]:
    text = read_text(path)
    if not text:
        return []
    lines = text.splitlines()
    starts: list[tuple[int, str, str]] = []
    for index, line in enumerate(lines, 1):
        match = re.match(r"function\s+([A-Za-z0-9_]+)\.([A-Za-z0-9_]+)\(([^)]*)\)", line.strip())
        if match:
            starts.append((index, match.group(2), match.group(3)))
    rows: list[dict[str, object]] = []
    for pos, (start, method, args) in enumerate(starts):
        end = starts[pos + 1][0] - 1 if pos + 1 < len(starts) else len(lines)
        body = "\n".join(lines[start - 1 : end])
        nq = re.findall(r'startNQCutScene\("([^"]+)"([^)]*)\)', body)
        nq_values = [f"{name}{params}" for name, params in nq]
        ask_rows = re.findall(r"ask\([^,\n]+,\s*(?:worldMaster,\s*)?([0-9]+)\s*,\s*([0-9]+)", body)
        rows.append(
            {
                "method": method,
                "line": start,
                "arg_count": len([arg for arg in args.split(",") if arg.strip()]),
                "nq_cutscenes": csv_join(nq_values),
                "has_after_warp_fade": "yes" if "startFadeInCutSceneAfterWarp" in body else "no",
                "has_default_cutscene_fade": "yes" if "startFadeInCutSceneDefault" in body else "no",
                "has_plain_fade": "yes" if re.search(r"startFade(?:In|Out)\(", body) else "no",
                "ask_rows": csv_join([f"{row}:{mode}" for row, mode in ask_rows]),
                "show_quest_info": "yes" if "showQuestInfomation" in body else "no",
                "say_count": len(re.findall(r":say\(", body)),
                "payload_branches": csv_join(re.findall(r"if\s+([A-Z][0-9]_[0-9]+)\s*==\s*([^ ]+)", body), limit=5),
                "return_present": "yes" if re.search(r"\breturn\b", body) else "no",
            }
        )
    return rows


def recovered_method_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for quest in QUESTS:
        path = Path(quest["scenario"])
        for method in extract_functions(path):
            is_key = (
                method["nq_cutscenes"]
                or method["has_after_warp_fade"] == "yes"
                or method["ask_rows"]
                or method["show_quest_info"] == "yes"
            )
            if not is_key and not str(quest["lane"]).startswith("gc_template"):
                continue
            rows.append(
                {
                    "code": quest["code"],
                    "quest_id": quest["quest_id"],
                    "title": quest["title"],
                    "lane": quest["lane"],
                    "method": method["method"],
                    "arg_count": method["arg_count"],
                    "nq_cutscenes": method["nq_cutscenes"],
                    "has_after_warp_fade": method["has_after_warp_fade"],
                    "has_default_cutscene_fade": method["has_default_cutscene_fade"],
                    "has_plain_fade": method["has_plain_fade"],
                    "ask_rows": method["ask_rows"],
                    "show_quest_info": method["show_quest_info"],
                    "say_count": method["say_count"],
                    "return_present": method["return_present"],
                    "key_mapping_note": KEY_METHOD_HINTS.get(str(quest["code"]), ""),
                    "source_ref": line_ref(path, int(method["line"] or 0)),
                }
            )
    return rows


def director_recovery_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    base = SQB_DIRECTOR_ROOT / "simplequestbattlebaseclass.lua"
    for quest in QUESTS:
        director = str(quest["director"] or "")
        if not director:
            continue
        path = SQB_DIRECTOR_ROOT / director
        text = read_text(path)
        if not text:
            shape = "missing_or_non_sqb"
        elif "getOwnClientQuestIdAsSimple" in text:
            shape = "shell_plus_explicit_client_quest_id"
        elif "_defineClass" in text and len([line for line in text.splitlines() if line.strip()]) <= 2:
            shape = "pure_shell"
        else:
            shape = "custom_recovered"
        override_match = re.search(r"getOwnClientQuestIdAsSimple.*?([0-9]{6})", text, re.S)
        rows.append(
            {
                "code": quest["code"],
                "quest_id": quest["quest_id"],
                "title": quest["title"],
                "director": director,
                "director_shape": shape,
                "explicit_client_quest_id": override_match.group(1) if override_match else "",
                "base_give_up_row": "25230 mode 2",
                "event_content_cancel_recovered": "no",
                "base_get_own_client_quest_id": "delegates to getOwnClientQuestIdAsSimple; base default nil",
                "implementation_risk": director_risk(str(quest["lane"]), shape),
                "source_refs": csv_join([line_ref(path, 1) if path.exists() else "", line_ref(base, 3)]),
            }
        )
    return rows


def director_risk(lane: str, shape: str) -> str:
    if shape == "shell_plus_explicit_client_quest_id":
        return "quest id override is useful but does not recover target, success owner, cleanup, or return"
    if lane.startswith("gc_template"):
        return "GC tail has both base-class and SQB shell artifacts; neither is launch permission without GC_BATTLES recovery"
    if shape == "pure_shell":
        return "shell-only director; no onKillBNpc, onCreateContentArea, target actor, cleanup, or return"
    return "verify manually before adapter launch"


def totorak_rows() -> list[dict[str, object]]:
    quest_lines = []
    text = read_text(TOTORAK_ENTRY)
    for line_no, line in enumerate(text.splitlines(), 1):
        match = re.search(r"\{\s*questId\s*=\s*([0-9]+),\s*eventName\s*=\s*\"([^\"]+)\",\s*label\s*=\s*\"([^\"]+)\"", line)
        if match:
            quest_lines.append((line_no, match.group(1), match.group(2), match.group(3)))
    rows = [
        {
            "surface": "retail_dialog_probe",
            "state": toggle_state("TOTORAK_NPC_RETAIL_TALK_PROBE_ENABLED"),
            "contract": "Retail Bloisirant default talk probe is intentionally off because it can leave the client waiting.",
            "quest_or_event": "defaultTalkWithBloisirant_001",
            "source_ref": line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"TOTORAK_NPC_RETAIL_TALK_PROBE_ENABLED\s*=\s*false")),
        },
        {
            "surface": "raid_entry_widget",
            "state": toggle_state("TOTORAK_NPC_ENTRY_WIDGET_ENABLED"),
            "contract": "Raid-entry widget is off for working NPC entry; flip only for widget probing.",
            "quest_or_event": "askEnterInstanceRaid",
            "source_ref": line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"TOTORAK_NPC_ENTRY_WIDGET_ENABLED\s*=\s*false")),
        },
        {
            "surface": "safe_solo_debug_entry",
            "state": toggle_state("TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED"),
            "contract": "Current default starts a safe solo copy instead of enforcing retail party/timer/level rules.",
            "quest_or_event": "TotorakStartDebugInstance",
            "source_ref": line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED\s*=\s*true")),
        },
        {
            "surface": "sequence_advance_gate",
            "state": "active",
            "contract": "Quest sequence 10 advances to 20 only after instance start succeeds.",
            "quest_or_event": "TotorakAdvanceEntryQuest",
            "source_ref": line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"function\s+TotorakAdvanceEntryQuest")),
        },
        {
            "surface": "guarded_helper_return",
            "state": "mitigated_on_success",
            "contract": "The Toto-Rak quest callers wrap TotorakTryStartFromNpc in an immediate return guard, so successful content starts skip the unconditional onTalk tail close; only failed/no-start attempts fall through to close.",
            "quest_or_event": "com0l5/com0g6/com0u5/com0l6 Bloisirant SEQ_010",
            "source_ref": csv_join(
                line_ref(path, line_number(path, r"TotorakTryStartFromNpc"))
                for path in TOTORAK_ENTRY_QUEST_SCRIPTS
            ),
        },
        {
            "surface": "entry_event_name_field",
            "state": "configured_but_unused",
            "contract": "TOTORAK_ENTRY_QUESTS carries eventName values, but the helper currently uses only quest id/sequence for advancement.",
            "quest_or_event": "com0l610/com0l510/com0g610/com0g510/com0u610",
            "source_ref": line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"TOTORAK_ENTRY_QUESTS")),
        },
        {
            "surface": "content_start",
            "state": "debug_or_retail",
            "contract": "Debug path creates runtime content named Totorak; retail path calls WorldManager:StartTotorakInstance.",
            "quest_or_event": "CreateContentArea / StartTotorakInstance",
            "source_ref": csv_join(
                [
                    line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"function\s+TotorakStartDebugInstance")),
                    line_ref(WORLD_MANAGER, line_number(WORLD_MANAGER, r"StartTotorakInstance\(Player")),
                ]
            ),
        },
    ]
    for line_no, quest_id, event_name, label in quest_lines:
        rows.append(
            {
                "surface": "entry_quest_row",
                "state": "configured",
                "contract": "Entry helper can advance this quest from sequence 10 to 20 after successful start.",
                "quest_or_event": f"{quest_id} {event_name} {label}",
                "source_ref": line_ref(TOTORAK_ENTRY, line_no),
            }
        )
    return rows


def toggle_state(name: str) -> str:
    text = read_text(TOTORAK_ENTRY)
    match = re.search(rf"^{name}\s*=\s*(true|false)\s*;", text, re.M)
    return match.group(1) if match else "unknown"


def gate_rows() -> list[dict[str, object]]:
    return [
        {
            "gate": "event_owner_smoke",
            "applies_to": "all delegateEvent aliases",
            "required_proof": "Confirm active event owner/npc and event type before swapping local alias to recovered process method.",
            "why": "The same local alias can represent different recovered methods depending on owner and payload.",
            "source_refs": line_ref(GLOBAL_LUA, line_number(GLOBAL_LUA, r"RunEventFunction")),
        },
        {
            "gate": "after_warp_lifetime",
            "applies_to": "com0g1/com0u1/com0l1/com0l5/com0u5/com0l6/com0u6",
            "required_proof": "Verify the event remains open until startFadeInCutSceneAfterWarp returns.",
            "why": "Closing EndEvent too early can strand the client after a cutscene warp.",
            "source_refs": line_ref(PLAYER_CS, line_number(PLAYER_CS, r"EndEvent")),
        },
        {
            "gate": "totorak_instance_entry",
            "applies_to": "com0l5/com0g6/com0u5/com0l6",
            "required_proof": "Start instance, zone into content, and advance 10->20 only after success; separately recover investigation/exit owner.",
            "why": "These quests are not private SQB spawn probes in the local route.",
            "source_refs": line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"TotorakAdvanceEntryQuest")),
        },
        {
            "gate": "totorak_guarded_helper_return",
            "applies_to": "com0l5/com0g6/com0u5/com0l6",
            "required_proof": "Smoke successful and failed/no-start paths separately; successful starts should return before the handler tail close, while failed starts should close normally.",
            "why": "The source scripts guard the helper with an immediate return, so the remaining risk is widget/no-start behavior rather than an unavoidable post-zone tail close.",
            "source_refs": csv_join(
                [
                    line_ref(TOTORAK_ENTRY, line_number(TOTORAK_ENTRY, r"TotorakTryStartFromNpc")),
                    line_ref(WORLD_MANAGER, line_number(WORLD_MANAGER, r"DoZoneChangeContent")),
                    *(line_ref(path, line_number(path, r"TotorakTryStartFromNpc")) for path in TOTORAK_ENTRY_QUEST_SCRIPTS),
                ]
            ),
        },
        {
            "gate": "sqb_cancel_policy",
            "applies_to": "all SQB/director-backed probes",
            "required_proof": "Treat give-up as a UI ask only until server-side cancel/return/despawn policy is recovered.",
            "why": "Recovered SimpleQuestBattleBaseClass has eventContentGiveUp but no eventContentCancel.",
            "source_refs": line_ref(SQB_DIRECTOR_ROOT / "simplequestbattlebaseclass.lua", 3),
        },
        {
            "gate": "gc_battle_metadata",
            "applies_to": "gcu302/gcg301/gcu301/gcl302/gcl301/gcg302",
            "required_proof": "Recover exact GC_BATTLES step and BNPC, actor/mob data, success owner, cleanup, and return before adding a row.",
            "why": "Without a GC_BATTLES row, template onTalk advances through the city officer.",
            "source_refs": line_ref(GC_TEMPLATE, line_number(GC_TEMPLATE, r"local\s+GC_BATTLES")),
        },
        {
            "gate": "reward_lock",
            "applies_to": "all focused quests",
            "required_proof": "No CompleteQuest/AddExp/AddGil/AddItem until kill/entry, return, cutscene result, and duplicate-grant policy are proven.",
            "why": "Local quest scripts grant rewards directly before CompleteQuest on several paths.",
            "source_refs": line_ref(PLAYER_CS, line_number(PLAYER_CS, r"CompleteQuest")),
        },
    ]


def write_doc(path: Path, output_dir: Path, local_rows: list[dict[str, object]], method_rows: list[dict[str, object]]) -> None:
    after_warp_count = sum(1 for row in method_rows if row["has_after_warp_fade"] == "yes")
    nq_count = sum(1 for row in method_rows if row["nq_cutscenes"])
    totorak_codes = [quest["code"] for quest in QUESTS if str(quest["lane"]).startswith("totorak")]
    gc_codes = [quest["code"] for quest in QUESTS if str(quest["lane"]).startswith("gc_template")]

    lines = [
        "# Quest Instanced Cutscene Lifecycle Decomp - 2026-07-02",
        "",
        "This pass focuses on the event/cutscene half of the instanced quest set: local server event calls, recovered client scenario methods, Toto-Rak entry, SQB director shell recovery, and the gates that must be proven before automation.",
        "",
        "## Findings",
        "",
        f"- Recovered scenario methods contain {nq_count} NQ cutscene callers in the focused slice; {after_warp_count} recovered methods use `startFadeInCutSceneAfterWarp`.",
        "- `com0u4`, `com0g1`, `com0u1`, and `com0l1` remain the only spawn-ready SQB-private wave, but their post-kill/talk cutscenes still need owner and after-warp lifetime proof before reward automation.",
        f"- Toto-Rak quests `{', '.join(totorak_codes)}` are an instance-entry lane: `TotorakTryStartFromNpc` advances sequence `10 -> 20` only after instance start succeeds.",
        "- Toto-Rak entry callers guard successful starts with an immediate `return`, so the older caller-tail `EndEvent` hazard is mitigated on the success path; widget/no-start behavior still needs smoke.",
        f"- GC tails `{', '.join(gc_codes)}` are template wrappers plus recovered client scenario methods; they still lack safe `GC_BATTLES` metadata.",
        "- `etc2g3` is a push-object lane, not an SQB lane; preserve `QFLAG_PUSH` and `onPush` behavior.",
        "- Recovered SQB base has `eventContentGiveUp` via ask row `25230`, but no recovered `eventContentCancel`; cancel/return/despawn policy stays probe-only.",
        "",
        "## Most Important Cutscene Hazards",
        "",
        "| Quest | Hazard |",
        "| --- | --- |",
    ]
    for code in ("com0g1", "com0u1", "com0l1", "com0l5", "com0u5", "com0l6", "com0u6", "com0g4"):
        quest = next(item for item in QUESTS if item["code"] == code)
        lines.append(f"| `{code}` / {quest['title']} | {KEY_METHOD_HINTS.get(code, quest['focus'])} |")

    lines.extend(
        [
            "",
            "## Local Event Shape",
            "",
            "Local quest scripts call `callClientFunction(player, \"delegateEvent\", ...)`, mutate sequence/items after the call returns, and generally close with `player:EndEvent()` at handler tail. Because `callClientFunction` yields on `_WAIT_EVENT`, sequence updates are after-cutscene from the server's point of view, but after-warp client methods still need event-lifetime smoke before we automate close/return.",
            "",
            "## Generated Files",
            "",
            f"- `{output_dir / 'local_event_call_rows.csv'}`",
            f"- `{output_dir / 'recovered_client_event_method_rows.csv'}`",
            f"- `{output_dir / 'sqb_director_recovery_rows.csv'}`",
            f"- `{output_dir / 'totorak_entry_contract_rows.csv'}`",
            f"- `{output_dir / 'implementation_gate_rows.csv'}`",
        ]
    )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


LOCAL_FIELDS = [
    "code",
    "quest_id",
    "title",
    "lane",
    "handler",
    "sequence",
    "owner_actor_constant",
    "owner_actor_id",
    "event_function",
    "event_alias_or_method",
    "extra_args",
    "post_call_mutations",
    "event_end_policy",
    "source_ref",
]

METHOD_FIELDS = [
    "code",
    "quest_id",
    "title",
    "lane",
    "method",
    "arg_count",
    "nq_cutscenes",
    "has_after_warp_fade",
    "has_default_cutscene_fade",
    "has_plain_fade",
    "ask_rows",
    "show_quest_info",
    "say_count",
    "return_present",
    "key_mapping_note",
    "source_ref",
]

DIRECTOR_FIELDS = [
    "code",
    "quest_id",
    "title",
    "director",
    "director_shape",
    "explicit_client_quest_id",
    "base_give_up_row",
    "event_content_cancel_recovered",
    "base_get_own_client_quest_id",
    "implementation_risk",
    "source_refs",
]

TOTORAK_FIELDS = ["surface", "state", "contract", "quest_or_event", "source_ref"]
GATE_FIELDS = ["gate", "applies_to", "required_proof", "why", "source_refs"]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    local_rows = local_event_rows()
    method_rows = recovered_method_rows()
    director_rows = director_recovery_rows()
    totorak = totorak_rows()
    gates = gate_rows()

    args.output.mkdir(parents=True, exist_ok=True)
    csv_write(args.output / "local_event_call_rows.csv", local_rows, LOCAL_FIELDS)
    csv_write(args.output / "recovered_client_event_method_rows.csv", method_rows, METHOD_FIELDS)
    csv_write(args.output / "sqb_director_recovery_rows.csv", director_rows, DIRECTOR_FIELDS)
    csv_write(args.output / "totorak_entry_contract_rows.csv", totorak, TOTORAK_FIELDS)
    csv_write(args.output / "implementation_gate_rows.csv", gates, GATE_FIELDS)
    write_doc(args.doc, args.output, local_rows, method_rows)

    print(f"wrote {len(local_rows)} local event rows")
    print(f"wrote {len(method_rows)} recovered method rows")
    print(f"wrote {len(director_rows)} director rows")
    print(f"wrote {len(totorak)} Toto-Rak rows")
    print(f"wrote {len(gates)} gate rows")
    print(f"wrote {args.doc}")


if __name__ == "__main__":
    main()
