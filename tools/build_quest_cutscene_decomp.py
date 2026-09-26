#!/usr/bin/env python3
"""Extract quest cutscene structure from the recovered LPB Lua decompilation.

This analyzer is intentionally static. It does not decompile new LPBs itself;
it turns the broad quest-family decomp output into quest-ready tables:

* scene launcher calls and fade/warp behavior by quest method
* per-quest summary joined to gamedata_quests.sql
* local server delegateEvent/RunEventFunction callsites joined back to methods
* a compact protocol table for the recovered cutscene launch families
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Iterable


DEFAULT_DECOMP = Path("tools/outputs/lpb/decomp_more_20260617")
DEFAULT_QUEST_SQL = Path("Data/sql/gamedata_quests.sql")
DEFAULT_SERVER_SCRIPTS = Path("Data/scripts")
DEFAULT_CUTSCENE_SOURCE = Path("tools/outputs/lpb/content_systems_20260612")
DEFAULT_DAT_MINING = Path("docs/Dat Mining")
DEFAULT_OUTPUT = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618")


FUNCTION_RE = re.compile(
    r"^\s*function\s+(?:(?P<class>[A-Za-z_][A-Za-z0-9_]*)\.)?"
    r"(?P<method>[A-Za-z_][A-Za-z0-9_]*)\s*\("
)

SQL_QUEST_RE = re.compile(
    r"\(\s*(?P<id>\d+)\s*,\s*'(?P<name>(?:\\.|''|[^'])*)'\s*,\s*"
    r"'(?P<class>(?:\\.|''|[^'])*)'\s*,\s*(?P<prereq>\d+)\s*,\s*(?P<level>\d+)\s*\)"
)

CALL_NAMES = (
    "startSnpcNQCutScene",
    "startSnpcHQCutScene",
    "startNQCutScene",
    "startHQCutScene",
    "startNQCutSceneDebugCase",
    "startHQCutSceneDebugCase",
    "replayNQCutScene",
    "executeCutScene",
    "eventNoticeCutScene",
    "createCutScene",
    "startCutScene",
    "processCutScenePlay",
    "startFadeOutCutSceneDefault",
    "startFadeInCutSceneDefault",
    "startFadeInCutSceneAfterWarp",
    "_fadeInAfterWarp",
    "_fadeInNowLoadingForNoticeEventJustInArea",
    "_waitForMapLoaded",
    "openCutSceneEffectWidget",
    "closeCutSceneEffectWidget",
    "openCutSceneReplaySelectWidget",
    "selectCutSceneReplaySelectWidget",
    "closeCutSceneReplaySelectWidget",
)

CALL_RE = re.compile(
    r"(?P<prefix>[A-Za-z0-9_:\.\)\(]+)?(?P<call>"
    + "|".join(re.escape(name) for name in CALL_NAMES)
    + r")\s*\("
)

EVENT_CALL_NAMES = (
    "tellByNpcLinkshellChat",
    "askEventModeWidgetYield",
    "askQuestDetailWidget",
    "askSelectReleaseQuestWidget",
    "askRetainerNamingWidget",
    "askEventModeWidget",
    "openJobQuestInformationWidget",
    "showQuestRewardAsClientCall",
    "showQuestInfomation",
    "showQuestInformation",
    "contentsJoinAskInBasaClass",
    "pastAreaJoinAskInBasaClass",
    "instanceAreaJoinAskInBasaClass",
    "sayFreeDisplayName",
    "showMessage",
    "showLog",
    "sqrwa",
    "say",
    "ask",
    "notify",
    "setMusic",
    "_setMusic",
    "_runCharaScheduler",
    "_wait",
    "_turnDir",
    "_waitForTurning",
)

EVENT_CALL_RE = re.compile(
    r"(?:(?P<receiver>[A-Za-z_][A-Za-z0-9_\.]*)\s*[:\.])?(?P<call>"
    + "|".join(re.escape(name) for name in EVENT_CALL_NAMES)
    + r")\s*\("
)

SERVER_FLOW_NAMES = (
    "StartSequence",
    "StartSequenceForNpcLs",
    "CompleteQuest",
    "AcceptQuest",
    "UpdateENPCs",
    "SetENpc",
    "SetENPC",
    "GetSequence",
    "GetData",
    "GetCounter",
    "SetCounter",
    "IncCounter",
    "GetFlag",
    "SetFlag",
    "ClearFlag",
    "NewNpcLsMsg",
    "ReadNpcLsMsg",
    "EndOfNpcLsMsgs",
    "AddItem",
    "RemoveItem",
    "HasItem",
    "AddGil",
    "AddExp",
    "callClientFunction",
    "runClientFunction",
    "runClientFunctionTyped",
    "RunEventFunction",
    "EndEvent",
    "ScheduleEventWarp",
    "WarpToPrivateArea",
    "WarpToPublicArea",
    "WarpToPosition",
    "DoZoneChange",
    "ChangeMusic",
    "SendGameMessageLocalizedDisplayName",
    "SendGameMessage",
    "SendMessage",
    "attentionMessage",
    "Message",
    "DoEmote",
    "wait",
    "GetStaticActor",
    "SetQuestGraphic",
)

SERVER_FLOW_RE = re.compile(
    r"(?:(?P<receiver>[A-Za-z_][A-Za-z0-9_\.]*)\s*[:\.])?(?P<call>"
    + "|".join(re.escape(name) for name in SERVER_FLOW_NAMES)
    + r")\s*\("
)

SCENE_LAUNCHERS = {
    "startSnpcNQCutScene",
    "startSnpcHQCutScene",
    "startNQCutScene",
    "startHQCutScene",
    "startNQCutSceneDebugCase",
    "startHQCutSceneDebugCase",
    "replayNQCutScene",
    "executeCutScene",
    "eventNoticeCutScene",
    "createCutScene",
}

REPLAY_PLACEHOLDERS = {
    "-200": "literal zero/default placeholder",
    "-201": "player cutscene-replay SNPC nickname",
    "-202": "player cutscene-replay SNPC coordinate, then converted to actor class for SNPC scenes",
    "-203": "player cutscene-replay SNPC skin",
    "-204": "player cutscene-replay SNPC personality",
    "-205": "player initial town",
    "-206": "player main-skill 41 flag, handled by PopulaceCutScenePlayer",
    "-207": "player initial town",
    "-208": "quest 110480 completion selector",
    "-209": "quest 110019 completion plus initial-town 2 selector",
    "-210": "quest 110019 completion plus initial-town 1 selector",
    "-211": "quest 110019 completion plus initial-town 3 selector",
    "-212": "not completed 111806/111606 selector",
    "-213": "not completed 111406/111606 selector",
    "-214": "SNPC skin remapped to grouped skin/body selector",
    "-215": "player nation",
    "-216": "literal unknown-name string",
    "-217": "SNPC skin remapped through getSnpcSexualityToSkin",
    "-218": "literal true",
    "-219": "literal false",
    "-220": "initial-town 3 selector",
    "-221": "player Grand Company, defaulting zero to one",
    "-222": "quest 110019 completion flag",
    "-223": "completion flag for 111827/111627/111427",
}

FADE_CALLS = {
    "startFadeOutCutSceneDefault",
    "startFadeInCutSceneDefault",
    "startFadeInCutSceneAfterWarp",
    "_fadeInAfterWarp",
    "_fadeInNowLoadingForNoticeEventJustInArea",
    "_waitForMapLoaded",
}


@dataclass(frozen=True)
class QuestMeta:
    quest_id: str
    quest_name: str
    class_name: str
    prerequisite: str
    min_level: str


@dataclass(frozen=True)
class FunctionBlock:
    source_path: str
    absolute_path: str
    code: str
    scope: str
    class_name: str
    method: str
    start_line: int
    end_line: int
    lines: list[str]


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="replace")


def csv_write(path: Path, rows: Iterable[dict[str, object]], fields: list[str]) -> int:
    rows = list(rows)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)
    return len(rows)


def csv_read(path: Path) -> list[dict[str, str]]:
    if not path.exists():
        return []
    with path.open(newline="", encoding="utf-8-sig") as handle:
        reader = csv.DictReader(handle)
        if reader.fieldnames:
            reader.fieldnames = [name.strip().strip('"').lstrip("\ufeff") for name in reader.fieldnames]
        return list(reader)


def csv_get(row: list[str], index: int) -> str:
    return row[index] if index < len(row) else ""


def sql_unescape(value: str) -> str:
    return value.replace("\\'", "'").replace("''", "'").replace("\\\\", "\\")


def parse_quest_sql(path: Path) -> dict[str, list[QuestMeta]]:
    by_code: dict[str, list[QuestMeta]] = defaultdict(list)
    if not path.exists():
        return by_code

    text = read_text(path)
    for match in SQL_QUEST_RE.finditer(text):
        meta = QuestMeta(
            quest_id=match.group("id"),
            quest_name=sql_unescape(match.group("name")),
            class_name=sql_unescape(match.group("class")),
            prerequisite=match.group("prereq"),
            min_level=match.group("level"),
        )
        by_code[meta.class_name.lower()].append(meta)
    return by_code


def combine_meta(values: list[QuestMeta]) -> dict[str, str]:
    if not values:
        return {
            "quest_ids": "",
            "quest_names": "",
            "quest_classes": "",
            "prerequisites": "",
            "min_levels": "",
        }
    return {
        "quest_ids": ";".join(v.quest_id for v in values),
        "quest_names": ";".join(v.quest_name for v in values),
        "quest_classes": ";".join(v.class_name for v in values),
        "prerequisites": ";".join(v.prerequisite for v in values),
        "min_levels": ";".join(v.min_level for v in values),
    }


def infer_code_and_scope(lua_root: Path, path: Path) -> tuple[str, str]:
    rel_parts = path.relative_to(lua_root).with_suffix("").parts
    rel = "/".join(rel_parts)

    if len(rel_parts) >= 3 and rel_parts[0] == "quest" and rel_parts[1] == "scenario":
        return rel_parts[-1].lower(), "quest_scenario"
    if len(rel_parts) >= 3 and rel_parts[0] == "quest" and rel_parts[1] == "passiveguildleve":
        return rel_parts[-1].lower(), "passive_guildleve"
    if len(rel_parts) >= 2 and rel_parts[0] == "quest":
        return rel_parts[-1].lower(), "quest_base_or_helper"
    if len(rel_parts) >= 2 and rel_parts[0] == "director" and rel_parts[1] == "quest":
        stem = rel_parts[-1].lower()
        stem = re.sub(r"^questdirector", "", stem)
        stem = re.sub(r"\d{2}$", "", stem)
        return stem, "quest_director"
    if len(rel_parts) >= 2 and rel_parts[0] == "director" and rel_parts[1] == "guildleve":
        return rel_parts[-1].lower(), "guildleve_director"
    if len(rel_parts) >= 2 and rel_parts[0] == "chara":
        return rel_parts[-1].lower(), "quest_actor_or_object"
    if len(rel_parts) >= 2 and rel_parts[0] == "widget":
        return rel_parts[-1].lower(), "quest_widget"
    if len(rel_parts) >= 2 and rel_parts[0] == "command":
        return rel_parts[-1].lower(), "quest_command"
    return path.stem.lower(), rel.split("/")[0] if rel_parts else ""


def collect_quest_family_lua_paths(decomp: Path, lua_root: Path) -> list[Path]:
    manifest = decomp / "manifest.csv"
    rows = csv_read(manifest)
    paths: list[Path] = []
    seen: set[Path] = set()

    for row in rows:
        families = row.get("families", "")
        logical_path = row.get("logical_path", "")
        if "quest" not in families or row.get("decompiled") != "True" or not logical_path:
            continue
        candidate = lua_root / f"{logical_path}.lua"
        if candidate.exists() and candidate not in seen:
            paths.append(candidate)
            seen.add(candidate)

    if paths:
        return sorted(paths)

    fallback = list((lua_root / "quest").rglob("*.lua"))
    director_quest_root = lua_root / "director" / "quest"
    if director_quest_root.exists():
        fallback.extend(director_quest_root.rglob("*.lua"))
    return sorted(fallback)


def iter_function_blocks(lua_root: Path, paths: Iterable[Path]) -> list[FunctionBlock]:
    blocks: list[FunctionBlock] = []
    for path in sorted(paths):
        text = read_text(path)
        lines = text.splitlines()
        starts: list[tuple[int, re.Match[str]]] = []
        for index, line in enumerate(lines):
            match = FUNCTION_RE.search(line)
            if match:
                starts.append((index, match))
        if not starts:
            continue

        rel = path.relative_to(lua_root).with_suffix("").as_posix()
        code, scope = infer_code_and_scope(lua_root, path)
        for ordinal, (start_index, match) in enumerate(starts):
            end_index = starts[ordinal + 1][0] if ordinal + 1 < len(starts) else len(lines)
            class_name = match.group("class") or ""
            method = match.group("method")
            blocks.append(
                FunctionBlock(
                    source_path=rel,
                    absolute_path=str(path.resolve()),
                    code=code,
                    scope=scope,
                    class_name=class_name,
                    method=method,
                    start_line=start_index + 1,
                    end_line=end_index,
                    lines=lines[start_index:end_index],
                )
            )
    return blocks


def split_lua_args(text: str) -> list[str]:
    args: list[str] = []
    current: list[str] = []
    depth = 0
    quote: str | None = None
    escape = False
    for char in text:
        if quote:
            current.append(char)
            if escape:
                escape = False
            elif char == "\\":
                escape = True
            elif char == quote:
                quote = None
            continue
        if char in {"'", '"'}:
            quote = char
            current.append(char)
        elif char in "({[":
            depth += 1
            current.append(char)
        elif char in ")}]":
            if depth > 0:
                depth -= 1
            current.append(char)
        elif char == "," and depth == 0:
            args.append("".join(current).strip())
            current = []
        else:
            current.append(char)
    if current or text.strip():
        args.append("".join(current).strip())
    return args


def extract_call_args(line: str, match: re.Match[str]) -> str:
    start = match.end()
    depth = 1
    quote: str | None = None
    escape = False
    for index in range(start, len(line)):
        char = line[index]
        if quote:
            if escape:
                escape = False
            elif char == "\\":
                escape = True
            elif char == quote:
                quote = None
            continue
        if char in {"'", '"'}:
            quote = char
        elif char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth == 0:
                return line[start:index]
    return line[start:].strip()


def unquote_lua_string(value: str) -> str:
    value = value.strip()
    if len(value) >= 2 and value[0] == value[-1] and value[0] in {"'", '"'}:
        inner = value[1:-1]
        return inner.replace('\\"', '"').replace("\\'", "'").replace("\\\\", "\\")
    return ""


def extract_scene_key(call: str, args: list[str]) -> str:
    if not args:
        return ""
    if call == "startCutScene":
        return ""
    return unquote_lua_string(args[0])


def extract_mode_arg(call: str, args: list[str]) -> str:
    if call == "startCutScene" and len(args) >= 3:
        return args[2]
    if call in SCENE_LAUNCHERS and len(args) >= 2:
        return args[1]
    return ""


def function_has_conditional_scene_return(text: str) -> bool:
    return bool(
        re.search(r"if\s+.*start(?:Snpc)?(?:NQ|HQ)CutScene\s*\(.*\)\s*==\s*1", text)
        or re.search(r"if\s+.*start(?:Snpc)?(?:NQ|HQ)CutScene\s*\(.*\)\s*~=\s*1", text)
    )


def classify_fade(has_default: bool, has_after_warp: bool) -> str:
    if has_default and has_after_warp:
        return "branch_or_mixed_default_and_after_warp"
    if has_after_warp:
        return "after_warp"
    if has_default:
        return "default"
    return "none"


def classify_function(scene_keys: list[str], launchers: list[str], fade_mode: str) -> str:
    if scene_keys:
        return "direct_scene_after_warp" if fade_mode != "default" and "after_warp" in fade_mode else "direct_scene"
    if launchers:
        return "dynamic_scene"
    if fade_mode != "none":
        return "fade_or_warp_helper"
    return "other"


def build_call_and_function_rows(
    blocks: list[FunctionBlock], quests_by_code: dict[str, list[QuestMeta]]
) -> tuple[list[dict[str, object]], list[dict[str, object]], dict[tuple[str, str], list[dict[str, object]]]]:
    call_rows: list[dict[str, object]] = []
    function_rows: list[dict[str, object]] = []
    function_index: dict[tuple[str, str], list[dict[str, object]]] = defaultdict(list)

    for block in blocks:
        body_text = "\n".join(block.lines)
        calls_in_function: list[dict[str, object]] = []
        for offset, line in enumerate(block.lines):
            if "CutScene" not in line and "cutScene" not in line and "_fadeIn" not in line and "_waitForMapLoaded" not in line:
                continue
            for match in CALL_RE.finditer(line):
                call = match.group("call")
                args_text = extract_call_args(line, match)
                args = split_lua_args(args_text)
                scene_key = extract_scene_key(call, args)
                row = {
                    **combine_meta(quests_by_code.get(block.code, [])),
                    "code": block.code,
                    "scope": block.scope,
                    "logical_path": block.source_path,
                    "source_file": block.absolute_path,
                    "class_name": block.class_name,
                    "method": block.method,
                    "function_start_line": block.start_line,
                    "function_end_line": block.end_line,
                    "call_line": block.start_line + offset,
                    "call": call,
                    "scene_key": scene_key,
                    "mode_arg": extract_mode_arg(call, args),
                    "arg_count": len(args),
                    "args_preview": ", ".join(args[:10]),
                    "direct_scene_key": "true" if scene_key else "false",
                    "line_text": line.strip(),
                }
                calls_in_function.append(row)
                call_rows.append(row)

        has_default = "startFadeInCutSceneDefault" in body_text
        has_after_warp = "startFadeInCutSceneAfterWarp" in body_text or "_fadeInAfterWarp" in body_text
        has_fade_out = "startFadeOutCutSceneDefault" in body_text
        has_now_loading = "_fadeInNowLoadingForNoticeEventJustInArea" in body_text
        has_map_wait = "_waitForMapLoaded" in body_text
        launchers = [row["call"] for row in calls_in_function if row["call"] in SCENE_LAUNCHERS]
        scene_keys = sorted({str(row["scene_key"]) for row in calls_in_function if row["scene_key"]})
        fade_mode = classify_fade(has_default, has_after_warp)

        if not calls_in_function and fade_mode == "none" and not has_fade_out and not has_now_loading and not has_map_wait:
            continue

        function_row = {
            **combine_meta(quests_by_code.get(block.code, [])),
            "code": block.code,
            "scope": block.scope,
            "logical_path": block.source_path,
            "source_file": block.absolute_path,
            "class_name": block.class_name,
            "method": block.method,
            "function_start_line": block.start_line,
            "function_end_line": block.end_line,
            "scene_call_count": len(launchers),
            "direct_scene_key_count": len(scene_keys),
            "scene_keys": ";".join(scene_keys),
            "launchers": ";".join(sorted(set(launchers))),
            "has_fade_out": str(has_fade_out).lower(),
            "has_default_fade_in": str(has_default).lower(),
            "has_after_warp_fade_in": str(has_after_warp).lower(),
            "has_now_loading_fade": str(has_now_loading).lower(),
            "has_map_wait": str(has_map_wait).lower(),
            "conditional_scene_return": str(function_has_conditional_scene_return(body_text)).lower(),
            "fade_mode": fade_mode,
            "classification": classify_function(scene_keys, launchers, fade_mode),
        }
        function_rows.append(function_row)
        function_index[(block.code, block.method)].append(function_row)

    return call_rows, function_rows, function_index


def classify_event_call(call: str, args: list[str]) -> str:
    if call == "say":
        return "dialogue_say"
    if call == "ask":
        return "dialogue_ask"
    if call == "tellByNpcLinkshellChat":
        return "npc_linkshell_chat"
    if call in {"sqrwa", "showQuestRewardAsClientCall"} or "QuestRewardWidget" in ",".join(args):
        return "quest_reward_widget"
    if call in {"showQuestInfomation", "showQuestInformation", "askQuestDetailWidget"}:
        return "quest_offer_or_detail_widget"
    if call == "askEventModeWidgetYield":
        widget = unquote_lua_string(args[0]) if args else ""
        if "QuestRewardWidget" in widget:
            return "quest_reward_widget"
        if "QuestAskWidget" in widget:
            return "quest_ask_widget"
        return "event_mode_widget"
    if call in {"contentsJoinAskInBasaClass", "pastAreaJoinAskInBasaClass", "instanceAreaJoinAskInBasaClass"}:
        return "content_or_area_join_prompt"
    if call in {"setMusic", "_setMusic"}:
        return "music"
    if call in {"_runCharaScheduler", "_turnDir", "_waitForTurning"}:
        return "chara_control"
    if call in {"_wait"}:
        return "wait"
    if call in {"showMessage", "showLog", "notify", "sayFreeDisplayName"}:
        return "message_or_notification"
    return "other"


def extract_text_or_actor_ids(call: str, args: list[str]) -> tuple[str, str, str]:
    actor_id = ""
    text_id = ""
    widget = ""
    if call in {"say", "ask", "showMessage", "showLog"}:
        if len(args) >= 2 and re.fullmatch(r"-?\d+", args[1].strip()):
            text_id = args[1].strip()
    elif call == "tellByNpcLinkshellChat":
        if args:
            actor_id = args[0].strip()
        if len(args) >= 3 and re.fullmatch(r"-?\d+", args[2].strip()):
            text_id = args[2].strip()
    elif call in {"askEventModeWidgetYield", "openJobQuestInformationWidget"} and args:
        widget = unquote_lua_string(args[0])
    elif call in {"sqrwa", "showQuestRewardAsClientCall"}:
        # sqrwa(player, owner, exp, ...)
        if len(args) >= 3:
            text_id = args[2].strip()
    return actor_id, text_id, widget


def build_quest_event_call_rows(
    blocks: list[FunctionBlock],
    quests_by_code: dict[str, list[QuestMeta]],
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for block in blocks:
        for offset, line in enumerate(block.lines):
            stripped = line.strip()
            if stripped.startswith("function "):
                continue
            if "(" not in stripped:
                continue
            for match in EVENT_CALL_RE.finditer(line):
                call = match.group("call")
                args_text = extract_call_args(line, match)
                args = split_lua_args(args_text)
                actor_id, text_id, widget = extract_text_or_actor_ids(call, args)
                rows.append(
                    {
                        **combine_meta(quests_by_code.get(block.code, [])),
                        "code": block.code,
                        "scope": block.scope,
                        "logical_path": block.source_path,
                        "source_file": block.absolute_path,
                        "class_name": block.class_name,
                        "method": block.method,
                        "function_start_line": block.start_line,
                        "call_line": block.start_line + offset,
                        "receiver": match.group("receiver") or "",
                        "call": call,
                        "category": classify_event_call(call, args),
                        "actor_id_or_expr": actor_id,
                        "text_id_or_expr": text_id,
                        "widget": widget,
                        "arg_count": len(args),
                        "args_preview": ", ".join(args[:12]),
                        "line_text": stripped,
                    }
                )
    return rows


def build_quest_event_summary_rows(
    event_rows: list[dict[str, object]],
    cutscene_summary_rows: list[dict[str, object]],
    quests_by_code: dict[str, list[QuestMeta]],
) -> list[dict[str, object]]:
    by_code_events: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in event_rows:
        by_code_events[str(row["code"])].append(row)
    cutscene_by_code = {str(row["code"]): row for row in cutscene_summary_rows}
    codes = sorted(set(by_code_events) | set(cutscene_by_code) | set(quests_by_code))

    rows: list[dict[str, object]] = []
    for code in codes:
        events = by_code_events.get(code, [])
        categories = Counter(str(row["category"]) for row in events)
        text_ids = sorted({str(row["text_id_or_expr"]) for row in events if row.get("text_id_or_expr")})
        widgets = sorted({str(row["widget"]) for row in events if row.get("widget")})
        cutscene = cutscene_by_code.get(code, {})
        rows.append(
            {
                **combine_meta(quests_by_code.get(code, [])),
                "code": code,
                "event_call_rows": len(events),
                "dialogue_say_rows": categories["dialogue_say"],
                "dialogue_ask_rows": categories["dialogue_ask"],
                "npc_linkshell_rows": categories["npc_linkshell_chat"],
                "reward_widget_rows": categories["quest_reward_widget"],
                "quest_offer_widget_rows": categories["quest_offer_or_detail_widget"] + categories["quest_ask_widget"],
                "content_join_prompt_rows": categories["content_or_area_join_prompt"],
                "music_rows": categories["music"],
                "chara_control_rows": categories["chara_control"],
                "unique_text_id_count": len(text_ids),
                "text_ids": ";".join(text_ids),
                "widgets": ";".join(widgets),
                "unique_scene_key_count": cutscene.get("unique_scene_key_count", "0"),
                "scene_keys": cutscene.get("scene_keys", ""),
                "functions_after_warp": cutscene.get("functions_after_warp", "0"),
                "functions_default_fade": cutscene.get("functions_default_fade", "0"),
            }
        )
    return rows


def build_text_sheet_map(decomp: Path) -> dict[str, dict[str, str]]:
    rows = csv_read(decomp / "text_data_loads.csv")
    by_logical_path: dict[str, dict[str, str]] = {}
    for row in rows:
        logical_path = row.get("logical_path", "")
        sheet_name = row.get("sheet_name", "")
        if logical_path and sheet_name:
            by_logical_path[logical_path] = row
    return by_logical_path


def read_dat_text_sheet(dat_mining: Path, sheet_name: str) -> tuple[str, dict[str, dict[str, str]]]:
    path = dat_mining / f"{sheet_name}.csv"
    if not path.exists():
        return "missing_sheet_file", {}

    rows: dict[str, dict[str, str]] = {}
    with path.open(newline="", encoding="utf-8-sig", errors="replace") as handle:
        reader = csv.reader(handle)
        for index, row in enumerate(reader):
            if index < 2 or not row:
                continue
            row_id = csv_get(row, 0).strip()
            if not row_id:
                continue
            rows[row_id] = {
                "ja": csv_get(row, 1),
                "en": csv_get(row, 2),
                "de": csv_get(row, 3),
                "fr": csv_get(row, 4),
                "extra": csv_get(row, 5),
            }
    return "loaded", rows


def resolve_text_sheet(
    row: dict[str, object],
    text_sheets_by_logical_path: dict[str, dict[str, str]],
    dat_mining: Path,
) -> dict[str, str]:
    logical_path = str(row.get("logical_path", ""))
    text_sheet = text_sheets_by_logical_path.get(logical_path)
    if text_sheet:
        return text_sheet

    code = str(row.get("code", ""))
    sheet_candidates = [code] if code else []
    if code.endswith("_quest"):
        sheet_candidates.append(code[: -len("_quest")])
    logical_stem = logical_path.rsplit("/", 1)[-1]
    if logical_stem and logical_stem not in sheet_candidates:
        sheet_candidates.append(logical_stem)
    if logical_stem.endswith("_quest"):
        sheet_candidates.append(logical_stem[: -len("_quest")])

    for candidate in sheet_candidates:
        if candidate and (dat_mining / f"{candidate}.csv").exists():
            loader = "fallback_code_sheet" if candidate == code else "fallback_code_alias_sheet"
            return {
                "family": "",
                "logical_path": logical_path,
                "line": "",
                "loader": loader,
                "sheet_id": "",
                "sheet_name": candidate,
                "raw_args": "",
            }
    return {}


def event_references_world_master(row: dict[str, object]) -> bool:
    return "worldMaster" in " ".join(
        str(row.get(field, ""))
        for field in ("receiver", "actor_id_or_expr", "args_preview", "line_text")
    )


def build_quest_event_text_rows(
    event_rows: list[dict[str, object]],
    text_sheets_by_logical_path: dict[str, dict[str, str]],
    dat_mining: Path,
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    sheet_cache: dict[str, tuple[str, dict[str, dict[str, str]]]] = {}

    def load_sheet(sheet_name: str) -> tuple[str, dict[str, dict[str, str]]]:
        if sheet_name not in sheet_cache:
            sheet_cache[sheet_name] = read_dat_text_sheet(dat_mining, sheet_name)
        return sheet_cache[sheet_name]

    def lookup_text(sheet_name: str, text_id: str) -> tuple[str, dict[str, str]]:
        sheet_status, sheet_rows = load_sheet(sheet_name)
        empty_text = {"ja": "", "en": "", "de": "", "fr": "", "extra": ""}
        if sheet_status != "loaded":
            return sheet_status, empty_text
        if text_id not in sheet_rows:
            return "missing_text_row", empty_text
        return "joined", sheet_rows[text_id]

    for event in event_rows:
        text_id = str(event.get("text_id_or_expr", "")).strip()
        text_sheet = resolve_text_sheet(event, text_sheets_by_logical_path, dat_mining)
        sheet_name = text_sheet.get("sheet_name", "")
        sheet_id = text_sheet.get("sheet_id", "")
        source_loader = text_sheet.get("loader", "")
        source_text_line = text_sheet.get("line", "")

        joined_text = {"ja": "", "en": "", "de": "", "fr": "", "extra": ""}
        if not text_id:
            join_status = "no_text_id"
        elif not re.fullmatch(r"-?\d+", text_id):
            join_status = "non_numeric_text_id"
        elif not sheet_name:
            if event_references_world_master(event):
                join_status, joined_text = lookup_text("worldMaster", text_id)
                if join_status == "joined":
                    sheet_name = "worldMaster"
                    source_loader = "fallback_world_master"
            else:
                join_status = "missing_sheet_mapping"
        else:
            join_status, joined_text = lookup_text(sheet_name, text_id)
            if join_status == "missing_text_row" and event_references_world_master(event):
                fallback_status, fallback_text = lookup_text("worldMaster", text_id)
                if fallback_status == "joined":
                    sheet_name = "worldMaster"
                    sheet_id = ""
                    source_loader = "fallback_world_master"
                    source_text_line = ""
                    join_status = fallback_status
                    joined_text = fallback_text

        rows.append(
            {
                **event,
                "text_sheet_id": sheet_id,
                "text_sheet_name": sheet_name,
                "text_sheet_loader": source_loader,
                "text_sheet_load_line": source_text_line,
                "text_row_id": text_id,
                "text_join_status": join_status,
                "text_ja": joined_text["ja"],
                "text_en": joined_text["en"],
                "text_de": joined_text["de"],
                "text_fr": joined_text["fr"],
                "text_extra": joined_text["extra"],
            }
        )
    return rows


def truncate_text(value: object, limit: int = 120) -> str:
    text = re.sub(r"\s+", " ", str(value or "")).strip()
    if len(text) <= limit:
        return text
    return text[: limit - 3] + "..."


def build_quest_text_summary_rows(
    text_rows: list[dict[str, object]],
    quests_by_code: dict[str, list[QuestMeta]],
) -> list[dict[str, object]]:
    by_code: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in text_rows:
        by_code[str(row["code"])].append(row)

    rows: list[dict[str, object]] = []
    for code in sorted(set(by_code) | set(quests_by_code)):
        quest_rows = by_code.get(code, [])
        statuses = Counter(str(row["text_join_status"]) for row in quest_rows)
        text_refs = [row for row in quest_rows if row.get("text_row_id")]
        joined = [row for row in quest_rows if row.get("text_join_status") == "joined"]
        unique_refs = sorted(
            {
                f"{row.get('text_sheet_name')}:{row.get('text_row_id')}"
                for row in text_refs
                if row.get("text_sheet_name") and row.get("text_row_id")
            }
        )
        english_samples = [
            truncate_text(row.get("text_en"))
            for row in joined
            if row.get("text_en")
        ][:8]
        rows.append(
            {
                **combine_meta(quests_by_code.get(code, [])),
                "code": code,
                "event_rows": len(quest_rows),
                "text_reference_rows": len(text_refs),
                "joined_text_rows": statuses["joined"],
                "missing_sheet_mapping_rows": statuses["missing_sheet_mapping"],
                "missing_sheet_file_rows": statuses["missing_sheet_file"],
                "missing_text_row_rows": statuses["missing_text_row"],
                "no_text_id_rows": statuses["no_text_id"],
                "non_numeric_text_id_rows": statuses["non_numeric_text_id"],
                "unique_text_ref_count": len(unique_refs),
                "text_sheets": ";".join(sorted({str(row.get("text_sheet_name")) for row in quest_rows if row.get("text_sheet_name")})),
                "text_refs": ";".join(unique_refs),
                "english_samples": " | ".join(english_samples),
            }
        )
    return rows


def row_method_uid(row: dict[str, object]) -> str:
    return "|".join(
        str(row.get(field, ""))
        for field in ("logical_path", "class_name", "method", "function_start_line")
    )


def build_quest_method_timeline_rows(
    event_text_rows: list[dict[str, object]],
    call_rows: list[dict[str, object]],
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    source_order = 0

    for event in event_text_rows:
        source_order += 1
        rows.append(
            {
                **combine_meta([]),
                **{field: event.get(field, "") for field in ("quest_ids", "quest_names", "quest_classes", "prerequisites", "min_levels")},
                "method_uid": row_method_uid(event),
                "code": event.get("code", ""),
                "scope": event.get("scope", ""),
                "logical_path": event.get("logical_path", ""),
                "source_file": event.get("source_file", ""),
                "class_name": event.get("class_name", ""),
                "method": event.get("method", ""),
                "function_start_line": event.get("function_start_line", ""),
                "call_line": event.get("call_line", ""),
                "sequence_index": 0,
                "step_source": "client_event",
                "step_type": event.get("category", ""),
                "call": event.get("call", ""),
                "scene_key": "",
                "mode_arg": "",
                "text_sheet_name": event.get("text_sheet_name", ""),
                "text_row_id": event.get("text_row_id", ""),
                "text_join_status": event.get("text_join_status", ""),
                "text_en": event.get("text_en", ""),
                "receiver": event.get("receiver", ""),
                "actor_id_or_expr": event.get("actor_id_or_expr", ""),
                "widget": event.get("widget", ""),
                "arg_count": event.get("arg_count", ""),
                "args_preview": event.get("args_preview", ""),
                "line_text": event.get("line_text", ""),
                "_source_order": source_order,
            }
        )

    for call in call_rows:
        source_order += 1
        step_type = "scene_launcher" if call.get("call") in SCENE_LAUNCHERS else "fade_or_warp"
        if call.get("call") not in SCENE_LAUNCHERS and call.get("call") not in FADE_CALLS:
            step_type = "cutscene_helper"
        rows.append(
            {
                **combine_meta([]),
                **{field: call.get(field, "") for field in ("quest_ids", "quest_names", "quest_classes", "prerequisites", "min_levels")},
                "method_uid": row_method_uid(call),
                "code": call.get("code", ""),
                "scope": call.get("scope", ""),
                "logical_path": call.get("logical_path", ""),
                "source_file": call.get("source_file", ""),
                "class_name": call.get("class_name", ""),
                "method": call.get("method", ""),
                "function_start_line": call.get("function_start_line", ""),
                "call_line": call.get("call_line", ""),
                "sequence_index": 0,
                "step_source": "cutscene",
                "step_type": step_type,
                "call": call.get("call", ""),
                "scene_key": call.get("scene_key", ""),
                "mode_arg": call.get("mode_arg", ""),
                "text_sheet_name": "",
                "text_row_id": "",
                "text_join_status": "",
                "text_en": "",
                "receiver": "",
                "actor_id_or_expr": "",
                "widget": "",
                "arg_count": call.get("arg_count", ""),
                "args_preview": call.get("args_preview", ""),
                "line_text": call.get("line_text", ""),
                "_source_order": source_order,
            }
        )

    rows.sort(
        key=lambda row: (
            str(row["logical_path"]),
            str(row["class_name"]),
            str(row["method"]),
            int(row["function_start_line"] or 0),
            int(row["call_line"] or 0),
            int(row["_source_order"]),
        )
    )

    by_uid_counts: dict[str, int] = defaultdict(int)
    for row in rows:
        uid = str(row["method_uid"])
        by_uid_counts[uid] += 1
        row["sequence_index"] = by_uid_counts[uid]
        row.pop("_source_order", None)
    return rows


def timeline_step_label(row: dict[str, object]) -> str:
    call = str(row.get("call", ""))
    if row.get("scene_key"):
        return f"{call}({row.get('scene_key')})"
    if row.get("text_en"):
        return f"{call}:{truncate_text(row.get('text_en'), 70)}"
    if row.get("text_row_id"):
        return f"{call}:text#{row.get('text_row_id')}:{row.get('text_join_status')}"
    return call


def build_quest_method_context_rows(
    timeline_rows: list[dict[str, object]],
    function_rows: list[dict[str, object]],
    delegate_rows: list[dict[str, object]],
) -> list[dict[str, object]]:
    by_uid: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in timeline_rows:
        by_uid[str(row["method_uid"])].append(row)

    function_by_uid = {row_method_uid(row): row for row in function_rows}
    delegate_counts = Counter((str(row.get("inferred_target_code", "")), str(row.get("method", ""))) for row in delegate_rows)
    delegate_files: dict[tuple[str, str], set[str]] = defaultdict(set)
    for row in delegate_rows:
        delegate_files[(str(row.get("inferred_target_code", "")), str(row.get("method", "")))].add(str(row.get("server_script", "")))

    rows: list[dict[str, object]] = []
    for uid in sorted(by_uid):
        steps = sorted(by_uid[uid], key=lambda row: int(row.get("sequence_index") or 0))
        first = steps[0]
        function = function_by_uid.get(uid, {})
        code_method = (str(first.get("code", "")), str(first.get("method", "")))
        text_steps = [row for row in steps if row.get("text_en")]
        scene_steps = [row for row in steps if row.get("scene_key")]
        fade_steps = [row for row in steps if row.get("call") in FADE_CALLS]
        rows.append(
            {
                **{field: first.get(field, "") for field in ("quest_ids", "quest_names", "quest_classes", "prerequisites", "min_levels")},
                "method_uid": uid,
                "code": first.get("code", ""),
                "scope": first.get("scope", ""),
                "logical_path": first.get("logical_path", ""),
                "source_file": first.get("source_file", ""),
                "class_name": first.get("class_name", ""),
                "method": first.get("method", ""),
                "function_start_line": first.get("function_start_line", ""),
                "timeline_step_count": len(steps),
                "client_event_step_count": sum(1 for row in steps if row.get("step_source") == "client_event"),
                "cutscene_step_count": sum(1 for row in steps if row.get("step_source") == "cutscene"),
                "scene_launcher_count": sum(1 for row in steps if row.get("step_type") == "scene_launcher"),
                "direct_scene_keys": ";".join(sorted({str(row.get("scene_key", "")) for row in scene_steps if row.get("scene_key")})),
                "fade_or_warp_calls": ";".join(str(row.get("call", "")) for row in fade_steps),
                "joined_text_rows": sum(1 for row in steps if row.get("text_join_status") == "joined"),
                "ask_rows": sum(1 for row in steps if row.get("call") == "ask"),
                "say_rows": sum(1 for row in steps if row.get("call") == "say"),
                "music_rows": sum(1 for row in steps if row.get("step_type") == "music"),
                "chara_control_rows": sum(1 for row in steps if row.get("step_type") == "chara_control"),
                "wait_rows": sum(1 for row in steps if row.get("step_type") == "wait"),
                "first_text_en": truncate_text(text_steps[0].get("text_en"), 220) if text_steps else "",
                "last_text_en": truncate_text(text_steps[-1].get("text_en"), 220) if text_steps else "",
                "text_sample_en": " | ".join(truncate_text(row.get("text_en"), 110) for row in text_steps[:6]),
                "ordered_step_sample": " -> ".join(timeline_step_label(row) for row in steps[:24]),
                "fade_mode": function.get("fade_mode", ""),
                "classification": function.get("classification", ""),
                "conditional_scene_return": function.get("conditional_scene_return", ""),
                "server_delegate_count": delegate_counts[code_method],
                "server_delegate_scripts": ";".join(sorted(delegate_files.get(code_method, set()))),
            }
        )
    return rows


def build_quest_scene_context_rows(
    call_rows: list[dict[str, object]],
    timeline_rows: list[dict[str, object]],
) -> list[dict[str, object]]:
    timeline_by_uid: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in timeline_rows:
        timeline_by_uid[str(row["method_uid"])].append(row)
    for rows in timeline_by_uid.values():
        rows.sort(key=lambda row: (int(row.get("call_line") or 0), int(row.get("sequence_index") or 0)))

    rows: list[dict[str, object]] = []
    for call in call_rows:
        scene_key = str(call.get("scene_key", ""))
        if not scene_key:
            continue
        uid = row_method_uid(call)
        call_line = int(call.get("call_line") or 0)
        timeline = timeline_by_uid.get(uid, [])
        previous_text = [
            row for row in timeline
            if int(row.get("call_line") or 0) < call_line and row.get("text_en")
        ][-4:]
        next_text = [
            row for row in timeline
            if int(row.get("call_line") or 0) > call_line and row.get("text_en")
        ][:4]
        nearby = [
            row for row in timeline
            if abs(int(row.get("call_line") or 0) - call_line) <= 12
        ][:18]
        rows.append(
            {
                **{field: call.get(field, "") for field in ("quest_ids", "quest_names", "quest_classes", "prerequisites", "min_levels")},
                "method_uid": uid,
                "code": call.get("code", ""),
                "scope": call.get("scope", ""),
                "logical_path": call.get("logical_path", ""),
                "source_file": call.get("source_file", ""),
                "class_name": call.get("class_name", ""),
                "method": call.get("method", ""),
                "function_start_line": call.get("function_start_line", ""),
                "call_line": call.get("call_line", ""),
                "call": call.get("call", ""),
                "scene_key": scene_key,
                "mode_arg": call.get("mode_arg", ""),
                "previous_text_en": " | ".join(truncate_text(row.get("text_en"), 150) for row in previous_text),
                "next_text_en": " | ".join(truncate_text(row.get("text_en"), 150) for row in next_text),
                "nearby_step_sample": " -> ".join(timeline_step_label(row) for row in nearby),
                "line_text": call.get("line_text", ""),
            }
        )
    return rows


def build_server_delegate_context_rows(
    delegate_rows: list[dict[str, object]],
    method_context_rows: list[dict[str, object]],
) -> list[dict[str, object]]:
    context_by_code_method: dict[tuple[str, str], list[dict[str, object]]] = defaultdict(list)
    for row in method_context_rows:
        context_by_code_method[(str(row.get("code", "")), str(row.get("method", "")))].append(row)

    rows: list[dict[str, object]] = []
    for delegate in delegate_rows:
        key = (str(delegate.get("inferred_target_code", "")), str(delegate.get("method", "")))
        contexts = context_by_code_method.get(key, [])
        scene_keys = sorted(
            {
                scene
                for context in contexts
                for scene in str(context.get("direct_scene_keys", "")).split(";")
                if scene
            }
        )
        rows.append(
            {
                **delegate,
                "client_method_context_count": len(contexts),
                "client_method_uids": ";".join(str(context.get("method_uid", "")) for context in contexts),
                "client_timeline_step_count": sum(int(context.get("timeline_step_count") or 0) for context in contexts),
                "client_joined_text_rows": sum(int(context.get("joined_text_rows") or 0) for context in contexts),
                "client_direct_scene_keys": ";".join(scene_keys),
                "client_first_text_en": " | ".join(
                    truncate_text(context.get("first_text_en"), 140) for context in contexts if context.get("first_text_en")
                ),
                "client_ordered_step_sample": " || ".join(
                    truncate_text(context.get("ordered_step_sample"), 240)
                    for context in contexts[:3]
                    if context.get("ordered_step_sample")
                ),
            }
        )
    return rows


def server_flow_label(row: dict[str, object]) -> str:
    return (
        f"{row.get('line')}:{row.get('call')}"
        f"[{row.get('category')}]({truncate_text(row.get('args_preview'), 90)})"
    )


def build_server_delegate_flow_context_rows(
    delegate_context_rows: list[dict[str, object]],
    server_flow_rows: list[dict[str, object]],
) -> list[dict[str, object]]:
    flow_by_script: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in server_flow_rows:
        flow_by_script[str(row.get("server_script", ""))].append(row)
    for rows in flow_by_script.values():
        rows.sort(key=lambda row: int(row.get("line") or 0))

    rows: list[dict[str, object]] = []
    for delegate in delegate_context_rows:
        script = str(delegate.get("server_script", ""))
        line = int(delegate.get("line") or 0)
        flows = flow_by_script.get(script, [])
        previous_flow = [
            row for row in flows
            if 0 < line - int(row.get("line") or 0) <= 12
        ][-8:]
        next_flow = [
            row for row in flows
            if 0 < int(row.get("line") or 0) - line <= 12
        ][:8]
        nearby_flow = [
            row for row in flows
            if abs(int(row.get("line") or 0) - line) <= 12
        ][:16]
        rows.append(
            {
                **delegate,
                "previous_server_flow": " -> ".join(server_flow_label(row) for row in previous_flow),
                "next_server_flow": " -> ".join(server_flow_label(row) for row in next_flow),
                "nearby_server_flow": " -> ".join(server_flow_label(row) for row in nearby_flow),
                "nearby_warp_or_zone_calls": ";".join(
                    server_flow_label(row) for row in nearby_flow if row.get("category") == "warp_or_zone"
                ),
                "nearby_sequence_calls": ";".join(
                    server_flow_label(row)
                    for row in nearby_flow
                    if row.get("call") in {"StartSequence", "StartSequenceForNpcLs"}
                ),
                "nearby_counter_or_flag_calls": ";".join(
                    server_flow_label(row) for row in nearby_flow if row.get("category") == "quest_data"
                ),
            }
        )
    return rows


def build_summary_rows(
    function_rows: list[dict[str, object]],
    call_rows: list[dict[str, object]],
    quests_by_code: dict[str, list[QuestMeta]],
) -> list[dict[str, object]]:
    by_code_functions: dict[str, list[dict[str, object]]] = defaultdict(list)
    by_code_calls: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in function_rows:
        by_code_functions[str(row["code"])].append(row)
    for row in call_rows:
        by_code_calls[str(row["code"])].append(row)

    codes = sorted(set(by_code_functions) | set(by_code_calls) | set(quests_by_code))
    rows: list[dict[str, object]] = []
    for code in codes:
        funcs = by_code_functions.get(code, [])
        calls = by_code_calls.get(code, [])
        scene_keys = sorted({str(row["scene_key"]) for row in calls if row.get("scene_key")})
        launchers = Counter(str(row["call"]) for row in calls if row.get("call") in SCENE_LAUNCHERS)
        fade_modes = Counter(str(row.get("fade_mode", "")) for row in funcs)
        rows.append(
            {
                **combine_meta(quests_by_code.get(code, [])),
                "code": code,
                "function_rows": len(funcs),
                "cutscene_call_rows": len(calls),
                "scene_launcher_rows": sum(launchers.values()),
                "unique_scene_key_count": len(scene_keys),
                "scene_keys": ";".join(scene_keys),
                "functions_after_warp": sum(1 for row in funcs if row["has_after_warp_fade_in"] == "true"),
                "functions_default_fade": sum(1 for row in funcs if row["has_default_fade_in"] == "true"),
                "functions_branch_or_mixed": sum(
                    1 for row in funcs if row["fade_mode"] == "branch_or_mixed_default_and_after_warp"
                ),
                "functions_dynamic_scene": sum(1 for row in funcs if row["classification"] == "dynamic_scene"),
                "functions_direct_scene": sum(1 for row in funcs if str(row["classification"]).startswith("direct_scene")),
                "nq_launcher_rows": launchers["startNQCutScene"] + launchers["startSnpcNQCutScene"],
                "hq_launcher_rows": launchers["startHQCutScene"] + launchers["startSnpcHQCutScene"],
                "execute_launcher_rows": launchers["executeCutScene"],
                "fade_modes": ";".join(f"{key}:{value}" for key, value in sorted(fade_modes.items()) if key),
            }
        )
    return rows


def collect_delegate_blocks(path: Path) -> list[tuple[int, str]]:
    lines = read_text(path).splitlines()
    blocks: list[tuple[int, str]] = []
    index = 0
    while index < len(lines):
        line = lines[index]
        if "delegateEvent" not in line and "RunEventFunction" not in line and "runClientFunction" not in line:
            index += 1
            continue
        start = index
        collected = [line]
        while index + 1 < len(lines) and len(collected) < 10 and ");" not in lines[index]:
            index += 1
            collected.append(lines[index])
        blocks.append((start + 1, " ".join(part.strip() for part in collected)))
        index += 1
    return blocks


def infer_server_file_code(server_scripts: Path, path: Path) -> str:
    rel = path.relative_to(server_scripts).with_suffix("").parts
    if len(rel) >= 3 and rel[0] == "quests":
        return rel[-1].lower()
    return path.stem.lower()


def extract_delegate_method(block: str) -> tuple[str, str, str]:
    static = re.search(r"GetStaticActor\s*\(\s*\"([A-Za-z0-9_]+)\"\s*\)", block)
    method = ""
    target_expr = ""
    if '"delegateEvent"' in block:
        strings = re.findall(r'"([^"]+)"', block)
        try:
            delegate_index = strings.index("delegateEvent")
        except ValueError:
            delegate_index = -1
        if delegate_index >= 0 and delegate_index + 1 < len(strings):
            for candidate in strings[delegate_index + 1 :]:
                if candidate != "delegateEvent" and not candidate.startswith("Ask/"):
                    method = candidate
                    break
        target_match = re.search(r'"delegateEvent"\s*,\s*[^,]+,\s*(?P<target>.+?)\s*,\s*"' + re.escape(method), block)
        if target_match:
            target_expr = re.sub(r"\s+", " ", target_match.group("target")).strip()
    else:
        run_match = re.search(r'RunEventFunction\s*\(\s*"([^"]+)"', block)
        if run_match:
            method = run_match.group(1)
            target_expr = "player"
        run_client = re.search(r'runClientFunction(?:Typed)?\s*\([^,]+,\s*"([^"]+)"\s*,', block)
        if run_client:
            method = run_client.group(1)
            target_expr = "runClientFunction"

    static_code = static.group(1).lower() if static else ""
    return method, target_expr, static_code


def build_delegate_rows(
    server_scripts: Path,
    function_index: dict[tuple[str, str], list[dict[str, object]]],
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    if not server_scripts.exists():
        return rows

    for path in sorted(server_scripts.rglob("*.lua")):
        rel = path.relative_to(server_scripts).as_posix()
        file_code = infer_server_file_code(server_scripts, path)
        for line_no, block in collect_delegate_blocks(path):
            method, target_expr, static_code = extract_delegate_method(block)
            if not method:
                continue
            inferred_code = static_code or (file_code if target_expr in {"quest", ""} or " quest" in target_expr else "")
            joined = function_index.get((inferred_code, method), []) if inferred_code else []
            scene_keys = sorted(
                {
                    key
                    for row in joined
                    for key in str(row.get("scene_keys", "")).split(";")
                    if key
                }
            )
            rows.append(
                {
                    "server_script": rel,
                    "server_file": str(path.resolve()),
                    "line": line_no,
                    "call_type": "delegateEvent" if "delegateEvent" in block else "run_or_player_event",
                    "inferred_target_code": inferred_code,
                    "target_expr": target_expr,
                    "method": method,
                    "joined_function_count": len(joined),
                    "joined_scene_keys": ";".join(scene_keys),
                    "joined_fade_modes": ";".join(sorted({str(row.get("fade_mode", "")) for row in joined if row.get("fade_mode")})),
                    "joined_classifications": ";".join(
                        sorted({str(row.get("classification", "")) for row in joined if row.get("classification")})
                    ),
                    "block_text": block,
                }
            )
    return rows


def build_server_flow_rows(
    server_scripts: Path,
    quests_by_code: dict[str, list[QuestMeta]],
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    quest_root = server_scripts / "quests"
    if not quest_root.exists():
        return rows

    for path in sorted(quest_root.rglob("*.lua")):
        rel = path.relative_to(server_scripts).as_posix()
        code = infer_server_file_code(server_scripts, path)
        for line_no, line in enumerate(read_text(path).splitlines(), start=1):
            stripped = line.strip()
            if not stripped or stripped.startswith("--"):
                continue
            for match in SERVER_FLOW_RE.finditer(line):
                call = match.group("call")
                args_text = extract_call_args(line, match)
                args = split_lua_args(args_text)
                rows.append(
                    {
                        **combine_meta(quests_by_code.get(code, [])),
                        "code": code,
                        "server_script": rel,
                        "server_file": str(path.resolve()),
                        "line": line_no,
                        "receiver": match.group("receiver") or "",
                        "call": call,
                        "category": classify_server_flow_call(call),
                        "arg_count": len(args),
                        "args_preview": ", ".join(args[:12]),
                        "line_text": stripped,
                    }
                )
    return rows


def classify_server_flow_call(call: str) -> str:
    if call in {
        "StartSequence",
        "StartSequenceForNpcLs",
        "AcceptQuest",
        "CompleteQuest",
        "UpdateENPCs",
        "SetENpc",
        "SetENPC",
        "GetSequence",
        "SetQuestGraphic",
    }:
        return "quest_state"
    if call in {"GetData", "GetCounter", "SetCounter", "IncCounter", "GetFlag", "SetFlag", "ClearFlag"}:
        return "quest_data"
    if call in {"AddItem", "RemoveItem", "HasItem", "AddGil", "AddExp"}:
        return "reward_or_inventory"
    if call in {"callClientFunction", "runClientFunction", "runClientFunctionTyped", "RunEventFunction"}:
        return "client_event_dispatch"
    if call in {"ScheduleEventWarp", "WarpToPrivateArea", "WarpToPublicArea", "WarpToPosition", "DoZoneChange"}:
        return "warp_or_zone"
    if call in {"NewNpcLsMsg", "ReadNpcLsMsg", "EndOfNpcLsMsgs"}:
        return "npc_linkshell"
    if call in {"ChangeMusic"}:
        return "music"
    if call in {"SendGameMessage", "SendGameMessageLocalizedDisplayName", "SendMessage", "Message", "attentionMessage"}:
        return "player_message"
    if call in {"DoEmote", "wait"}:
        return "chara_or_wait"
    if call in {"EndEvent"}:
        return "event_end"
    if call in {"GetStaticActor"}:
        return "actor_or_marker"
    return "other"


def build_server_flow_summary_rows(
    server_flow_rows: list[dict[str, object]],
    quests_by_code: dict[str, list[QuestMeta]],
) -> list[dict[str, object]]:
    by_code: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in server_flow_rows:
        by_code[str(row["code"])].append(row)
    rows: list[dict[str, object]] = []
    for code in sorted(set(by_code) | set(quests_by_code)):
        flow_rows = by_code.get(code, [])
        calls = Counter(str(row["call"]) for row in flow_rows)
        categories = Counter(str(row["category"]) for row in flow_rows)
        rows.append(
            {
                **combine_meta(quests_by_code.get(code, [])),
                "code": code,
                "server_flow_rows": len(flow_rows),
                "quest_state_rows": categories["quest_state"],
                "quest_data_rows": categories["quest_data"],
                "client_event_dispatch_rows": categories["client_event_dispatch"],
                "reward_or_inventory_rows": categories["reward_or_inventory"],
                "event_warp_rows": categories["warp_or_zone"],
                "npc_linkshell_rows": categories["npc_linkshell"],
                "player_message_rows": categories["player_message"],
                "music_rows": categories["music"],
                "chara_or_wait_rows": categories["chara_or_wait"],
                "event_end_rows": categories["event_end"],
                "actor_or_marker_rows": categories["actor_or_marker"],
                "start_sequence_rows": calls["StartSequence"],
                "start_sequence_npc_ls_rows": calls["StartSequenceForNpcLs"],
                "complete_quest_rows": calls["CompleteQuest"],
                "accept_quest_rows": calls["AcceptQuest"],
                "delegate_rows": calls["callClientFunction"],
                "run_event_rows": calls["RunEventFunction"],
                "set_enpc_rows": calls["SetENpc"] + calls["SetENPC"],
                "warp_private_rows": calls["WarpToPrivateArea"],
                "warp_public_rows": calls["WarpToPublicArea"],
                "zone_change_rows": calls["DoZoneChange"],
                "counter_update_rows": calls["SetCounter"] + calls["IncCounter"],
                "top_calls": ";".join(f"{name}:{count}" for name, count in calls.most_common(12)),
            }
        )
    return rows


def replay_placeholder_summary(values: list[str]) -> str:
    parts: list[str] = []
    for value in values:
        value = str(value or "").strip()
        if value.startswith("-"):
            parts.append(f"{value}={REPLAY_PLACEHOLDERS.get(value, 'unmapped placeholder')}")
    return "; ".join(dict.fromkeys(parts))


def build_quest_replay_rows(
    scene_asset_rows: list[dict[str, object]],
    cutscene_source: Path,
) -> list[dict[str, object]]:
    replay_rows = csv_read(cutscene_source / "cutscene_cutreplay_full_inventory.csv")
    scenes = {normalize_scene_key(row.get("scene_key")): row for row in scene_asset_rows}
    rows: list[dict[str, object]] = []
    slot_columns = ["unknown8", "slot9", "slot10", "slot11", "slot12", "slot13", "slot14", "slot15"]

    for replay in replay_rows:
        key = normalize_scene_key(replay.get("normalized_key") or replay.get("cutscene_key"))
        scene = scenes.get(key)
        if not scene:
            continue
        slot_values = [replay.get(column, "") for column in slot_columns]
        rows.append(
            {
                "scene_key": key,
                "sample_key": scene.get("sample_key", key),
                "quest_codes": scene.get("quest_codes", ""),
                "quest_ids": scene.get("quest_ids", ""),
                "quest_names": scene.get("quest_names", ""),
                "functions": scene.get("functions", ""),
                "fade_modes": scene.get("fade_modes", ""),
                "classifications": scene.get("classifications", ""),
                "replay_id": replay.get("replay_id", ""),
                "unlock_kind": replay.get("unlock_kind", ""),
                "col2": replay.get("col2", ""),
                "col3": replay.get("col3", ""),
                "col4": replay.get("col4", ""),
                "col5": replay.get("col5", ""),
                "col6": replay.get("col6", ""),
                "unknown8": replay.get("unknown8", ""),
                "slot9": replay.get("slot9", ""),
                "slot10": replay.get("slot10", ""),
                "slot11": replay.get("slot11", ""),
                "slot12": replay.get("slot12", ""),
                "slot13": replay.get("slot13", ""),
                "slot14": replay.get("slot14", ""),
                "slot15": replay.get("slot15", ""),
                "placeholder_summary": replay_placeholder_summary(slot_values),
            }
        )
    return rows


def build_protocol_rows() -> list[dict[str, object]]:
    return [
        {
            "type": "quest_nq_cutscene",
            "entrypoint": "QuestBaseClass.startNQCutScene(scene, mode, ...)",
            "desktop_mode": "61",
            "owner": "quest actor",
            "selection": "direct scene key from quest scenario method",
            "post_play": "caller chooses default fade-in or after-warp fade-in",
            "evidence": "lua/quest/questbaseclass_common.lua startNQCutScene",
        },
        {
            "type": "quest_hq_cutscene",
            "entrypoint": "QuestBaseClass.startHQCutScene(scene, mode, ...)",
            "desktop_mode": "62",
            "owner": "quest actor",
            "selection": "direct scene key from quest scenario method",
            "post_play": "caller chooses default fade-in or after-warp fade-in",
            "evidence": "lua/quest/questbaseclass_common.lua startHQCutScene",
        },
        {
            "type": "quest_snpc_cutscene",
            "entrypoint": "startSnpcNQCutScene/startSnpcHQCutScene(scene, mode, snpc args...)",
            "desktop_mode": "61/62",
            "owner": "quest actor",
            "selection": "wrapper forwards actor class/name/appearance args into NQ/HQ launcher",
            "post_play": "same as quest NQ/HQ",
            "evidence": "lua/quest/questbaseclass_common.lua startSnpcNQCutScene/startSnpcHQCutScene",
        },
        {
            "type": "quest_replay_cutscene",
            "entrypoint": "PopulaceCutScenePlayer.processCutScenePlay",
            "desktop_mode": "61/62 via NQ/HQ wrappers",
            "owner": "quest actor resolved from cutReplay quest id",
            "selection": "desktop replay widget -> cutReplaySheet row -> cut name and actor args",
            "post_play": "default fade-in, music reset, temporary replay actor cleanup",
            "evidence": "lua/chara/npc/populace/populacecutsceneplayer.lua",
        },
        {
            "type": "instance_raid_cutscene",
            "entrypoint": "InstanceRaidBaseClass.executeCutScene(scene, owner, skippable, ...)",
            "desktop_mode": "63",
            "owner": "instance director unless explicit owner supplied",
            "selection": "dynamic server startEvent/cutSceneEvent args or subclass literal",
            "post_play": "instance lifecycle opens/closes execution/information widgets separately",
            "evidence": "lua/director/instanceraid/instanceraidbaseclass.lua executeCutScene",
        },
        {
            "type": "legacy_occupancy_raid_cutscene",
            "entrypoint": "occupancy director eventNoticeCutScene/player handoff",
            "desktop_mode": "61",
            "owner": "occupancy director",
            "selection": "server supplies scene key/cutscene arg",
            "post_play": "opens RaidDungeonExecutionWidget with content id and finish time",
            "evidence": "lua/director/occupancy/raidfst0dungeon03.lua and raidroc0dungeon01.lua",
        },
        {
            "type": "retainer_manager_tutorial_cutscene",
            "entrypoint": "PopulaceRetainerManager createCutScene(...):startCutScene(1, 61, 2, ...)",
            "desktop_mode": "61",
            "owner": "retainer manager NPC",
            "selection": "retainer manager script argument",
            "post_play": "returns tutorial/menu result through retainer manager flow",
            "evidence": "lua/chara/npc/populace/populaceretainermanager.lua",
        },
        {
            "type": "cutscene_effect_widget_clip",
            "entrypoint": "CutScene._onShowWidgetClip/_onHideWidgetClip",
            "desktop_mode": "inside active cutscene",
            "owner": "CutScene object",
            "selection": "clip names 2DEffectLocation1..11, ContentsSuccess, DutySuccess1..3",
            "post_play": "opens/closes CutSceneEffectWidget or toggles static NPC-say widget",
            "evidence": "lua/gamedata/cutscene_common.lua _onShowWidgetClip",
        },
        {
            "type": "default_fade_finalizer",
            "entrypoint": "QuestBaseClass.startFadeInCutSceneDefault(player)",
            "desktop_mode": "post cutscene",
            "owner": "player",
            "selection": "quest method calls it after playback",
            "post_play": "waits for map loaded, fades in, waits for fading",
            "evidence": "lua/quest/questbaseclass_common.lua startFadeInCutSceneDefault",
        },
        {
            "type": "after_warp_fade_finalizer",
            "entrypoint": "QuestBaseClass.startFadeInCutSceneAfterWarp(player)",
            "desktop_mode": "post cutscene/warp",
            "owner": "player",
            "selection": "quest method calls it after warp-producing scene",
            "post_play": "uses native _fadeInAfterWarp outside test zone",
            "evidence": "lua/quest/questbaseclass_common.lua startFadeInCutSceneAfterWarp",
        },
    ]


def normalize_scene_key(value: object) -> str:
    return str(value or "").strip().lower()


def build_scene_asset_crosscheck_rows(
    call_rows: list[dict[str, object]],
    function_rows: list[dict[str, object]],
    cutscene_source: Path,
) -> list[dict[str, object]]:
    crosscheck_rows = csv_read(cutscene_source / "cutscene_key_crosscheck.csv")
    replay_rows = csv_read(cutscene_source / "cutscene_cutreplay_full_inventory.csv")

    cross_by_key = {normalize_scene_key(row.get("normalized_key")): row for row in crosscheck_rows}
    replay_by_key: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in replay_rows:
        replay_by_key[normalize_scene_key(row.get("normalized_key"))].append(row)

    calls_by_key: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in call_rows:
        key = normalize_scene_key(row.get("scene_key"))
        if key:
            calls_by_key[key].append(row)

    functions_by_key: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in function_rows:
        for key in str(row.get("scene_keys", "")).split(";"):
            normalized = normalize_scene_key(key)
            if normalized:
                functions_by_key[normalized].append(row)

    rows: list[dict[str, object]] = []
    for key in sorted(calls_by_key):
        calls = calls_by_key[key]
        funcs = functions_by_key.get(key, [])
        cross = cross_by_key.get(key, {})
        replay = replay_by_key.get(key, [])
        rows.append(
            {
                "scene_key": key,
                "sample_key": calls[0].get("scene_key", key),
                "quest_codes": ";".join(sorted({str(row.get("code", "")) for row in calls if row.get("code")})),
                "quest_ids": ";".join(sorted({qid for row in calls for qid in str(row.get("quest_ids", "")).split(";") if qid})),
                "quest_names": ";".join(
                    sorted({name for row in calls for name in str(row.get("quest_names", "")).split(";") if name})
                ),
                "call_count": len(calls),
                "function_count": len(funcs),
                "functions": ";".join(
                    sorted({f"{row.get('code')}.{row.get('method')}" for row in funcs if row.get("method")})
                ),
                "fade_modes": ";".join(sorted({str(row.get("fade_mode", "")) for row in funcs if row.get("fade_mode")})),
                "classifications": ";".join(
                    sorted({str(row.get("classification", "")) for row in funcs if row.get("classification")})
                ),
                "in_lua_refs": cross.get("in_lua_refs", ""),
                "in_cutReplay": cross.get("in_cutReplay", "True" if replay else ""),
                "in_client_cut_assets": cross.get("in_client_cut_assets", ""),
                "asset_file_count": cross.get("asset_file_count", ""),
                "asset_dataset_file_count": cross.get("asset_dataset_file_count", ""),
                "cutReplay_row_count": cross.get("cutReplay_row_count", len(replay) if replay else ""),
                "replay_ids": ";".join(row.get("replay_id", "") for row in replay if row.get("replay_id")),
                "family_prefix": cross.get("family_prefix", key[:3]),
            }
        )
    return rows


def write_readme(output: Path, summary: dict[str, object]) -> None:
    lines = [
        "# Quest Cutscene Decomp Extraction",
        "",
        f"- Created: {summary['created_at']}",
        f"- Source decomp: `{summary['source_decomp']}`",
        f"- Quest Lua files scanned: {summary['quest_lua_files']}",
        f"- Function rows with cutscene/fade behavior: {summary['quest_cutscene_functions']}",
        f"- Cutscene/fade call rows: {summary['quest_cutscene_calls']}",
        f"- Quest dialogue/widget/control call rows: {summary['quest_event_call_rows']}",
        f"- Quest text rows joined to dat-mined sheets: {summary['quest_event_text_joined_rows']}",
        f"- Quest method timeline rows: {summary['quest_method_timeline_rows']}",
        f"- Direct scene dialogue context rows: {summary['quest_scene_dialogue_context_rows']}",
        f"- Server delegate/event rows: {summary['server_delegate_rows']}",
        f"- Server quest-flow rows: {summary['server_quest_flow_rows']}",
        f"- Server delegate flow-context rows: {summary['server_delegate_flow_context_rows']}",
        f"- Joined quest cutReplay rows: {summary['quest_cutreplay_joined_rows']}",
        "",
        "## Practical Read",
        "",
        "- Quest NQ scenes route through `QuestBaseClass.startNQCutScene` and desktop mode `61`.",
        "- Quest HQ scenes route through `QuestBaseClass.startHQCutScene` and desktop mode `62`.",
        "- Instance raid scenes route through `InstanceRaidBaseClass.executeCutScene` and desktop mode `63`.",
        "- SNPC wrappers are argument packers around NQ/HQ quest scenes.",
        "- Replay scenes are selected through `cutReplaySheet`, then replayed through the same NQ/HQ/SNPC wrappers.",
        "- Quest methods that call `startFadeInCutSceneAfterWarp` need the server/runtime warp finalizer path to be correct.",
        "",
        "## Generated Files",
        "",
        "- `quest_cutscene_calls.csv` - every recovered quest-family cutscene/fade call line.",
        "- `quest_cutscene_functions.csv` - method-level scene keys, launchers, and fade/warp classification.",
        "- `quest_cutscene_summary_by_quest.csv` - per-code rollup joined to `gamedata_quests.sql`.",
        "- `server_delegate_to_cutscene_join.csv` - local server `delegateEvent`/event callsites joined back to decompiled quest methods when possible.",
        "- `quest_event_calls.csv` - dialogue, ask, reward widget, linkshell, music, scheduler, and content prompt calls in client quest Lua.",
        "- `quest_event_text_join.csv` - quest event calls joined to dat-mined localized text rows where a numeric text id is present.",
        "- `quest_event_summary_by_quest.csv` - per-code rollup of those client quest event surfaces.",
        "- `quest_text_summary_by_quest.csv` - per-code rollup of text join coverage and sample English lines.",
        "- `quest_method_timeline.csv` - ordered per-method sequence of localized dialogue, asks, music/control calls, scene launches, and fades.",
        "- `quest_method_context.csv` - method-level timeline rollup with dialogue samples, scene keys, fade modes, and server delegate counts.",
        "- `quest_scene_dialogue_context.csv` - each direct scene key with nearby previous/next localized dialogue from the same method.",
        "- `server_delegate_method_context.csv` - server delegate rows enriched with joined client timeline/context summaries.",
        "- `server_delegate_flow_context.csv` - server delegate rows with nearby quest-state, counter, warp/zone, message, and linkpearl operations.",
        "- `server_quest_flow_calls.csv` - local server quest state, reward, dispatch, marker, and warp operation callsites.",
        "- `server_quest_flow_summary_by_quest.csv` - per-code rollup of local server quest-flow operations.",
        "- `cutscene_type_protocols.csv` - compact explanation of the recovered cutscene launch families.",
        "- `quest_scene_asset_crosscheck.csv` - direct quest scene keys joined to physical cut assets and cutReplay rows.",
        "- `quest_scene_key_gaps.csv` - the direct scene keys missing a physical cut asset or cutReplay row.",
        "- `quest_cutreplay_rows_joined.csv` - replay rows for direct quest scenes with decoded placeholder meanings.",
        "- `cutreplay_placeholder_meanings.csv` - recovered meanings for `-200..-223` replay placeholders.",
        "- `summary.json` - aggregate counts.",
        "",
    ]
    (output / "README.md").write_text("\n".join(lines), encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--decomp", type=Path, default=DEFAULT_DECOMP)
    parser.add_argument("--quest-sql", type=Path, default=DEFAULT_QUEST_SQL)
    parser.add_argument("--server-scripts", type=Path, default=DEFAULT_SERVER_SCRIPTS)
    parser.add_argument("--cutscene-source", type=Path, default=DEFAULT_CUTSCENE_SOURCE)
    parser.add_argument("--dat-mining", type=Path, default=DEFAULT_DAT_MINING)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    lua_root = args.decomp / "lua"
    if not lua_root.exists():
        raise SystemExit(f"Lua root not found: {lua_root}")

    quest_paths = collect_quest_family_lua_paths(args.decomp, lua_root)

    quests_by_code = parse_quest_sql(args.quest_sql)
    blocks = iter_function_blocks(lua_root, quest_paths)
    call_rows, function_rows, function_index = build_call_and_function_rows(blocks, quests_by_code)
    summary_rows = build_summary_rows(function_rows, call_rows, quests_by_code)
    event_rows = build_quest_event_call_rows(blocks, quests_by_code)
    event_summary_rows = build_quest_event_summary_rows(event_rows, summary_rows, quests_by_code)
    text_sheets_by_logical_path = build_text_sheet_map(args.decomp)
    event_text_rows = build_quest_event_text_rows(event_rows, text_sheets_by_logical_path, args.dat_mining)
    text_summary_rows = build_quest_text_summary_rows(event_text_rows, quests_by_code)
    delegate_rows = build_delegate_rows(args.server_scripts, function_index)
    server_flow_rows = build_server_flow_rows(args.server_scripts, quests_by_code)
    server_flow_summary_rows = build_server_flow_summary_rows(server_flow_rows, quests_by_code)
    protocol_rows = build_protocol_rows()
    scene_asset_rows = build_scene_asset_crosscheck_rows(call_rows, function_rows, args.cutscene_source)
    quest_replay_rows = build_quest_replay_rows(scene_asset_rows, args.cutscene_source)
    method_timeline_rows = build_quest_method_timeline_rows(event_text_rows, call_rows)
    method_context_rows = build_quest_method_context_rows(method_timeline_rows, function_rows, delegate_rows)
    scene_context_rows = build_quest_scene_context_rows(call_rows, method_timeline_rows)
    delegate_context_rows = build_server_delegate_context_rows(delegate_rows, method_context_rows)
    delegate_flow_context_rows = build_server_delegate_flow_context_rows(delegate_context_rows, server_flow_rows)

    output = args.output
    output.mkdir(parents=True, exist_ok=True)

    csv_write(
        output / "quest_cutscene_calls.csv",
        call_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "scope",
            "logical_path",
            "source_file",
            "class_name",
            "method",
            "function_start_line",
            "function_end_line",
            "call_line",
            "call",
            "scene_key",
            "mode_arg",
            "arg_count",
            "args_preview",
            "direct_scene_key",
            "line_text",
        ],
    )
    csv_write(
        output / "quest_cutscene_functions.csv",
        function_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "scope",
            "logical_path",
            "source_file",
            "class_name",
            "method",
            "function_start_line",
            "function_end_line",
            "scene_call_count",
            "direct_scene_key_count",
            "scene_keys",
            "launchers",
            "has_fade_out",
            "has_default_fade_in",
            "has_after_warp_fade_in",
            "has_now_loading_fade",
            "has_map_wait",
            "conditional_scene_return",
            "fade_mode",
            "classification",
        ],
    )
    csv_write(
        output / "quest_cutscene_summary_by_quest.csv",
        summary_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "function_rows",
            "cutscene_call_rows",
            "scene_launcher_rows",
            "unique_scene_key_count",
            "scene_keys",
            "functions_after_warp",
            "functions_default_fade",
            "functions_branch_or_mixed",
            "functions_dynamic_scene",
            "functions_direct_scene",
            "nq_launcher_rows",
            "hq_launcher_rows",
            "execute_launcher_rows",
            "fade_modes",
        ],
    )
    csv_write(
        output / "server_delegate_to_cutscene_join.csv",
        delegate_rows,
        [
            "server_script",
            "server_file",
            "line",
            "call_type",
            "inferred_target_code",
            "target_expr",
            "method",
            "joined_function_count",
            "joined_scene_keys",
            "joined_fade_modes",
            "joined_classifications",
            "block_text",
        ],
    )
    csv_write(
        output / "quest_event_calls.csv",
        event_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "scope",
            "logical_path",
            "source_file",
            "class_name",
            "method",
            "function_start_line",
            "call_line",
            "receiver",
            "call",
            "category",
            "actor_id_or_expr",
            "text_id_or_expr",
            "widget",
            "arg_count",
            "args_preview",
            "line_text",
        ],
    )
    csv_write(
        output / "quest_event_text_join.csv",
        event_text_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "scope",
            "logical_path",
            "source_file",
            "class_name",
            "method",
            "function_start_line",
            "call_line",
            "receiver",
            "call",
            "category",
            "actor_id_or_expr",
            "text_id_or_expr",
            "widget",
            "arg_count",
            "args_preview",
            "text_sheet_id",
            "text_sheet_name",
            "text_sheet_loader",
            "text_sheet_load_line",
            "text_row_id",
            "text_join_status",
            "text_en",
            "text_ja",
            "text_de",
            "text_fr",
            "text_extra",
            "line_text",
        ],
    )
    csv_write(
        output / "quest_event_summary_by_quest.csv",
        event_summary_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "event_call_rows",
            "dialogue_say_rows",
            "dialogue_ask_rows",
            "npc_linkshell_rows",
            "reward_widget_rows",
            "quest_offer_widget_rows",
            "content_join_prompt_rows",
            "music_rows",
            "chara_control_rows",
            "unique_text_id_count",
            "text_ids",
            "widgets",
            "unique_scene_key_count",
            "scene_keys",
            "functions_after_warp",
            "functions_default_fade",
        ],
    )
    csv_write(
        output / "quest_text_summary_by_quest.csv",
        text_summary_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "event_rows",
            "text_reference_rows",
            "joined_text_rows",
            "missing_sheet_mapping_rows",
            "missing_sheet_file_rows",
            "missing_text_row_rows",
            "no_text_id_rows",
            "non_numeric_text_id_rows",
            "unique_text_ref_count",
            "text_sheets",
            "text_refs",
            "english_samples",
        ],
    )
    csv_write(
        output / "quest_method_timeline.csv",
        method_timeline_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "method_uid",
            "code",
            "scope",
            "logical_path",
            "source_file",
            "class_name",
            "method",
            "function_start_line",
            "call_line",
            "sequence_index",
            "step_source",
            "step_type",
            "call",
            "scene_key",
            "mode_arg",
            "text_sheet_name",
            "text_row_id",
            "text_join_status",
            "text_en",
            "receiver",
            "actor_id_or_expr",
            "widget",
            "arg_count",
            "args_preview",
            "line_text",
        ],
    )
    csv_write(
        output / "quest_method_context.csv",
        method_context_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "method_uid",
            "code",
            "scope",
            "logical_path",
            "source_file",
            "class_name",
            "method",
            "function_start_line",
            "timeline_step_count",
            "client_event_step_count",
            "cutscene_step_count",
            "scene_launcher_count",
            "direct_scene_keys",
            "fade_or_warp_calls",
            "joined_text_rows",
            "ask_rows",
            "say_rows",
            "music_rows",
            "chara_control_rows",
            "wait_rows",
            "first_text_en",
            "last_text_en",
            "text_sample_en",
            "ordered_step_sample",
            "fade_mode",
            "classification",
            "conditional_scene_return",
            "server_delegate_count",
            "server_delegate_scripts",
        ],
    )
    csv_write(
        output / "quest_scene_dialogue_context.csv",
        scene_context_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "method_uid",
            "code",
            "scope",
            "logical_path",
            "source_file",
            "class_name",
            "method",
            "function_start_line",
            "call_line",
            "call",
            "scene_key",
            "mode_arg",
            "previous_text_en",
            "next_text_en",
            "nearby_step_sample",
            "line_text",
        ],
    )
    csv_write(
        output / "server_delegate_method_context.csv",
        delegate_context_rows,
        [
            "server_script",
            "server_file",
            "line",
            "call_type",
            "inferred_target_code",
            "target_expr",
            "method",
            "joined_function_count",
            "joined_scene_keys",
            "joined_fade_modes",
            "joined_classifications",
            "block_text",
            "client_method_context_count",
            "client_method_uids",
            "client_timeline_step_count",
            "client_joined_text_rows",
            "client_direct_scene_keys",
            "client_first_text_en",
            "client_ordered_step_sample",
        ],
    )
    csv_write(
        output / "server_delegate_flow_context.csv",
        delegate_flow_context_rows,
        [
            "server_script",
            "server_file",
            "line",
            "call_type",
            "inferred_target_code",
            "target_expr",
            "method",
            "joined_function_count",
            "joined_scene_keys",
            "joined_fade_modes",
            "joined_classifications",
            "block_text",
            "client_method_context_count",
            "client_method_uids",
            "client_timeline_step_count",
            "client_joined_text_rows",
            "client_direct_scene_keys",
            "client_first_text_en",
            "client_ordered_step_sample",
            "previous_server_flow",
            "next_server_flow",
            "nearby_server_flow",
            "nearby_warp_or_zone_calls",
            "nearby_sequence_calls",
            "nearby_counter_or_flag_calls",
        ],
    )
    csv_write(
        output / "server_quest_flow_calls.csv",
        server_flow_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "server_script",
            "server_file",
            "line",
            "receiver",
            "call",
            "category",
            "arg_count",
            "args_preview",
            "line_text",
        ],
    )
    csv_write(
        output / "server_quest_flow_summary_by_quest.csv",
        server_flow_summary_rows,
        [
            "quest_ids",
            "quest_names",
            "quest_classes",
            "prerequisites",
            "min_levels",
            "code",
            "server_flow_rows",
            "quest_state_rows",
            "quest_data_rows",
            "client_event_dispatch_rows",
            "reward_or_inventory_rows",
            "event_warp_rows",
            "npc_linkshell_rows",
            "player_message_rows",
            "music_rows",
            "chara_or_wait_rows",
            "event_end_rows",
            "actor_or_marker_rows",
            "start_sequence_rows",
            "start_sequence_npc_ls_rows",
            "complete_quest_rows",
            "accept_quest_rows",
            "delegate_rows",
            "run_event_rows",
            "set_enpc_rows",
            "warp_private_rows",
            "warp_public_rows",
            "zone_change_rows",
            "counter_update_rows",
            "top_calls",
        ],
    )
    csv_write(
        output / "cutscene_type_protocols.csv",
        protocol_rows,
        ["type", "entrypoint", "desktop_mode", "owner", "selection", "post_play", "evidence"],
    )
    csv_write(
        output / "quest_scene_asset_crosscheck.csv",
        scene_asset_rows,
        [
            "scene_key",
            "sample_key",
            "quest_codes",
            "quest_ids",
            "quest_names",
            "call_count",
            "function_count",
            "functions",
            "fade_modes",
            "classifications",
            "in_lua_refs",
            "in_cutReplay",
            "in_client_cut_assets",
            "asset_file_count",
            "asset_dataset_file_count",
            "cutReplay_row_count",
            "replay_ids",
            "family_prefix",
        ],
    )
    csv_write(
        output / "quest_cutreplay_rows_joined.csv",
        quest_replay_rows,
        [
            "scene_key",
            "sample_key",
            "quest_codes",
            "quest_ids",
            "quest_names",
            "functions",
            "fade_modes",
            "classifications",
            "replay_id",
            "unlock_kind",
            "col2",
            "col3",
            "col4",
            "col5",
            "col6",
            "unknown8",
            "slot9",
            "slot10",
            "slot11",
            "slot12",
            "slot13",
            "slot14",
            "slot15",
            "placeholder_summary",
        ],
    )
    csv_write(
        output / "cutreplay_placeholder_meanings.csv",
        (
            {"placeholder": key, "meaning": value}
            for key, value in sorted(REPLAY_PLACEHOLDERS.items(), key=lambda item: int(item[0]))
        ),
        ["placeholder", "meaning"],
    )
    scene_gap_rows = [
        {
            **row,
            "gap_type": ";".join(
                part
                for part in [
                    "missing_client_cut_asset" if row["in_client_cut_assets"] != "True" else "",
                    "missing_cutReplay_row" if row["in_cutReplay"] != "True" else "",
                ]
                if part
            ),
        }
        for row in scene_asset_rows
        if row["in_client_cut_assets"] != "True" or row["in_cutReplay"] != "True"
    ]
    csv_write(
        output / "quest_scene_key_gaps.csv",
        scene_gap_rows,
        [
            "gap_type",
            "scene_key",
            "sample_key",
            "quest_codes",
            "quest_ids",
            "quest_names",
            "call_count",
            "function_count",
            "functions",
            "fade_modes",
            "classifications",
            "in_lua_refs",
            "in_cutReplay",
            "in_client_cut_assets",
            "asset_file_count",
            "asset_dataset_file_count",
            "cutReplay_row_count",
            "replay_ids",
            "family_prefix",
        ],
    )

    direct_scene_keys = {str(row["scene_key"]) for row in call_rows if row.get("scene_key")}
    summary = {
        "created_at": datetime.now().replace(microsecond=0).isoformat(),
        "source_decomp": str(args.decomp),
        "quest_lua_files": len(quest_paths),
        "function_blocks": len(blocks),
        "quest_cutscene_functions": len(function_rows),
        "quest_cutscene_calls": len(call_rows),
        "direct_scene_key_count": len(direct_scene_keys),
        "server_delegate_rows": len(delegate_rows),
        "server_delegate_joined_rows": sum(1 for row in delegate_rows if row["joined_function_count"]),
        "server_delegate_joined_scene_rows": sum(1 for row in delegate_rows if row["joined_scene_keys"]),
        "quest_event_call_rows": len(event_rows),
        "quest_event_summary_rows": len(event_summary_rows),
        "quest_event_text_rows": len(event_text_rows),
        "quest_event_text_joined_rows": sum(1 for row in event_text_rows if row["text_join_status"] == "joined"),
        "quest_event_text_missing_sheet_mapping_rows": sum(
            1 for row in event_text_rows if row["text_join_status"] == "missing_sheet_mapping"
        ),
        "quest_event_text_missing_sheet_file_rows": sum(
            1 for row in event_text_rows if row["text_join_status"] == "missing_sheet_file"
        ),
        "quest_event_text_missing_text_row_rows": sum(
            1 for row in event_text_rows if row["text_join_status"] == "missing_text_row"
        ),
        "quest_text_summary_rows": len(text_summary_rows),
        "quest_method_timeline_rows": len(method_timeline_rows),
        "quest_method_context_rows": len(method_context_rows),
        "quest_scene_dialogue_context_rows": len(scene_context_rows),
        "server_delegate_method_context_rows": len(delegate_context_rows),
        "server_delegate_flow_context_rows": len(delegate_flow_context_rows),
        "server_quest_flow_rows": len(server_flow_rows),
        "server_quest_flow_summary_rows": len(server_flow_summary_rows),
        "summary_by_quest_rows": len(summary_rows),
        "protocol_rows": len(protocol_rows),
        "dat_mining_source": str(args.dat_mining),
        "text_sheet_mappings": len(text_sheets_by_logical_path),
        "quest_scene_asset_crosscheck_rows": len(scene_asset_rows),
        "quest_cutreplay_joined_rows": len(quest_replay_rows),
        "quest_scene_key_gap_rows": len(scene_gap_rows),
        "cutreplay_placeholder_meanings": len(REPLAY_PLACEHOLDERS),
        "quest_scene_keys_with_assets": sum(1 for row in scene_asset_rows if row["in_client_cut_assets"] == "True"),
        "quest_scene_keys_without_assets": sum(1 for row in scene_asset_rows if row["in_client_cut_assets"] == "False"),
        "quest_scene_keys_with_cutReplay": sum(1 for row in scene_asset_rows if row["in_cutReplay"] == "True"),
        "quest_scene_keys_without_cutReplay": sum(1 for row in scene_asset_rows if row["in_cutReplay"] == "False"),
        "top_calls": Counter(str(row["call"]) for row in call_rows).most_common(20),
        "top_event_calls": Counter(str(row["call"]) for row in event_rows).most_common(20),
        "top_text_join_statuses": Counter(str(row["text_join_status"]) for row in event_text_rows).most_common(20),
        "top_timeline_step_types": Counter(str(row["step_type"]) for row in method_timeline_rows).most_common(20),
        "top_server_flow_calls": Counter(str(row["call"]) for row in server_flow_rows).most_common(20),
        "top_server_flow_categories": Counter(str(row["category"]) for row in server_flow_rows).most_common(20),
        "top_replay_placeholders": Counter(
            value
            for row in quest_replay_rows
            for value in [
                row["unknown8"],
                row["slot9"],
                row["slot10"],
                row["slot11"],
                row["slot12"],
                row["slot13"],
                row["slot14"],
                row["slot15"],
            ]
            if str(value).startswith("-")
        ).most_common(30),
        "top_codes_by_scene_keys": sorted(
            (
                {
                    "code": row["code"],
                    "quest_ids": row["quest_ids"],
                    "quest_names": row["quest_names"],
                    "unique_scene_key_count": row["unique_scene_key_count"],
                }
                for row in summary_rows
                if int(row["unique_scene_key_count"]) > 0
            ),
            key=lambda item: int(item["unique_scene_key_count"]),
            reverse=True,
        )[:25],
    }
    (output / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    write_readme(output, summary)

    print(
        "quest_cutscene_decomp: "
        f"calls={len(call_rows)} functions={len(function_rows)} "
        f"direct_scene_keys={len(direct_scene_keys)} delegates={len(delegate_rows)} "
        f"events={len(event_rows)} server_flow={len(server_flow_rows)} "
        f"text_joined={summary['quest_event_text_joined_rows']} "
        f"timeline={len(method_timeline_rows)} scene_context={len(scene_context_rows)} "
        f"delegate_flow_context={len(delegate_flow_context_rows)} "
        f"asset_xcheck={len(scene_asset_rows)} replay_rows={len(quest_replay_rows)} "
        f"output={output}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
