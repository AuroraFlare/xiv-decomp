#!/usr/bin/env python3
"""Build a focused decomp pack for the three starter city opening quests."""

from __future__ import annotations

import csv
import re
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "outputs" / "starter-city-opening-quests-decomp-20260705"

QUESTS = {
    "man0l0": {
        "quest_id": "110001",
        "quest_name": "Shapeless Melody",
        "class_name": "Man0l0",
        "local_script": "Data/scripts/quests/man/man0l0.lua",
        "content_script": "Data/scripts/content/SimpleContent30002.lua",
        "director_script": "Data/scripts/directors/Quest/QuestDirectorMan0l001.lua",
        "content_area": "man0l01",
        "content_class": "SimpleContent30002",
        "director_class": "Quest/QuestDirectorMan0l001",
        "objective_actor": "2205403",
        "objective_label": "jellyfish",
        "objective_count": "3",
        "attention_packet": "51073:1",
        "post_fight_method": "processEvent000_3",
        "questcomplete_checkpoint": "jellyfish",
        "return_zone": "230",
        "return_private_area": "PrivateAreaMasterPast",
        "return_private_area_type": "1",
        "return_pos": "-826.868469,6,193.745865,-0.008368492",
        "handoff": "Hob choice 1 -> Man0l1",
    },
    "man0g0": {
        "quest_id": "110005",
        "quest_name": "Sundered Skies",
        "class_name": "Man0g0",
        "local_script": "Data/scripts/quests/man/man0g0.lua",
        "content_script": "Data/scripts/content/SimpleContent30010.lua",
        "director_script": "Data/scripts/directors/Quest/QuestDirectorMan0g001.lua",
        "content_area": "man0g01",
        "content_class": "SimpleContent30010",
        "director_class": "Quest/QuestDirectorMan0g001",
        "objective_actor": "2201407",
        "objective_label": "wolf",
        "objective_count": "3",
        "attention_packet": "51073:2",
        "post_fight_method": "processEvent020_1",
        "questcomplete_checkpoint": "wolf",
        "return_zone": "155",
        "return_private_area": "PrivateAreaMasterPast",
        "return_private_area_type": "1",
        "return_pos": "175.38,-1.21,-1156.51,-2.1",
        "handoff": "Push 1099046 -> Man0g1",
    },
    "man0u0": {
        "quest_id": "110009",
        "quest_name": "Flowers for All",
        "class_name": "Man0u0",
        "local_script": "Data/scripts/quests/man/man0u0.lua",
        "content_script": "Data/scripts/content/SimpleContent30079.lua",
        "director_script": "Data/scripts/directors/Quest/QuestDirectorMan0u001.lua",
        "content_area": "man0u01",
        "content_class": "SimpleContent30079",
        "director_class": "Quest/QuestDirectorMan0u001",
        "objective_actor": "2203301",
        "objective_label": "goobbue",
        "objective_count": "1",
        "attention_packet": "51073:3",
        "post_fight_method": "processEvent020",
        "questcomplete_checkpoint": "goobbue",
        "return_zone": "175",
        "return_private_area": "PrivateAreaMasterPast",
        "return_private_area_type": "3",
        "return_pos": "-22.81,196,87.82,2.98",
        "handoff": "Push 1099046 -> Man0u1",
    },
}

CODE_BY_CLASS = {v["class_name"]: code for code, v in QUESTS.items()}
CODE_BY_ID = {v["quest_id"]: code for code, v in QUESTS.items()}


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open("r", encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, str]], fieldnames: list[str]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def split_values(value: str) -> list[str]:
    if not value:
        return []
    return [part for part in re.split(r"[;,]", value) if part]


def first_nonempty(values: list[str]) -> str:
    for value in values:
        if value:
            return value
    return ""


def shorten(value: str, limit: int = 260) -> str:
    value = re.sub(r"\s+", " ", value or "").strip()
    if len(value) <= limit:
        return value
    return value[: limit - 3] + "..."


def code_matches(row: dict[str, str]) -> str:
    for key in ("code", "script_code", "inferred_target_code"):
        value = (row.get(key) or "").lower()
        if value in QUESTS:
            return value
    for value in split_values(row.get("quest_ids", "")):
        if value in CODE_BY_ID:
            return CODE_BY_ID[value]
    for value in split_values(row.get("quest_classes", "")):
        if value in CODE_BY_CLASS:
            return CODE_BY_CLASS[value]
    value = (row.get("quest_codes") or "").lower()
    for code in QUESTS:
        if code in value:
            return code
    return ""


def build_client_method_summary() -> list[dict[str, str]]:
    path = ROOT / "tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_method_timeline.csv"
    methods: dict[tuple[str, str], dict[str, object]] = {}
    raw_functions = build_raw_function_index()

    with path.open("r", encoding="utf-8-sig", newline="") as handle:
        for row in csv.DictReader(handle):
            code = code_matches(row)
            if not code:
                continue
            method = row.get("method", "")
            key = (code, method)
            entry = methods.setdefault(
                key,
                {
                    "code": code,
                    "quest_id": QUESTS[code]["quest_id"],
                    "quest_name": QUESTS[code]["quest_name"],
                    "method": method,
                    "function_start_line": row.get("function_start_line", ""),
                    "raw_method_present": "yes",
                    "method_uid": row.get("method_uid", ""),
                    "step_count": 0,
                    "text_row_count": 0,
                    "scene_keys": set(),
                    "calls": [],
                    "widgets": set(),
                    "first_text_en": "",
                    "text_ids": [],
                    "sample_steps": [],
                },
            )
            entry["step_count"] = int(entry["step_count"]) + 1
            if row.get("text_en"):
                entry["text_row_count"] = int(entry["text_row_count"]) + 1
                if not entry["first_text_en"]:
                    entry["first_text_en"] = row["text_en"]
                if row.get("text_row_id"):
                    cast_list(entry["text_ids"]).append(row["text_row_id"])
            if row.get("scene_key"):
                cast_set(entry["scene_keys"]).add(row["scene_key"])
            if row.get("widget"):
                cast_set(entry["widgets"]).add(row["widget"])
            if row.get("call") and len(cast_list(entry["calls"])) < 8:
                cast_list(entry["calls"]).append(row["call"])
            if len(cast_list(entry["sample_steps"])) < 8:
                step = row.get("call") or row.get("step_type") or row.get("line_text", "")
                if row.get("text_en"):
                    step = f"{step}:{shorten(row['text_en'], 80)}"
                elif row.get("scene_key"):
                    step = f"{step}:{row['scene_key']}"
                cast_list(entry["sample_steps"]).append(step)

    for (code, method), line_no in raw_functions.items():
        methods.setdefault(
            (code, method),
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "method": method,
                "function_start_line": str(line_no),
                "raw_method_present": "yes",
                "method_uid": f"raw:{code}:{method}:{line_no}",
                "step_count": 0,
                "text_row_count": 0,
                "scene_keys": set(),
                "calls": [],
                "widgets": set(),
                "first_text_en": "",
                "text_ids": [],
                "sample_steps": [],
            },
        )

    rows: list[dict[str, str]] = []
    for entry in sorted(methods.values(), key=lambda item: (str(item["code"]), int(str(item["function_start_line"]) or 0), str(item["method"]))):
        rows.append(
            {
                "code": str(entry["code"]),
                "quest_id": str(entry["quest_id"]),
                "quest_name": str(entry["quest_name"]),
                "method": str(entry["method"]),
                "function_start_line": str(entry["function_start_line"]),
                "raw_method_present": str(entry.get("raw_method_present", "yes")),
                "step_count": str(entry["step_count"]),
                "text_row_count": str(entry["text_row_count"]),
                "scene_keys": ";".join(sorted(cast_set(entry["scene_keys"]))),
                "widgets": ";".join(sorted(cast_set(entry["widgets"]))),
                "first_text_en": shorten(str(entry["first_text_en"])),
                "text_ids_sample": ";".join(cast_list(entry["text_ids"])[:12]),
                "calls_sample": " -> ".join(cast_list(entry["calls"])),
                "ordered_step_sample": " -> ".join(cast_list(entry["sample_steps"])),
                "method_uid": str(entry["method_uid"]),
            }
        )
    return rows


def build_client_dialogue_rows() -> list[dict[str, str]]:
    path = ROOT / "tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_method_timeline.csv"
    rows = []
    for row in read_csv(path):
        code = code_matches(row)
        if not code or not row.get("text_en"):
            continue
        rows.append(
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "method": row.get("method", ""),
                "function_start_line": row.get("function_start_line", ""),
                "call": row.get("call", ""),
                "scene_key": row.get("scene_key", ""),
                "text_row_id": row.get("text_row_id", ""),
                "text_en": shorten(row.get("text_en", ""), 520),
                "line_text": shorten(row.get("line_text", ""), 420),
                "method_uid": row.get("method_uid", ""),
            }
        )
    return rows


def build_client_signal_rows() -> list[dict[str, str]]:
    path = ROOT / "tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_method_timeline.csv"
    rows = []
    for row in read_csv(path):
        code = code_matches(row)
        if not code:
            continue
        signal_kind = classify_client_signal(row)
        rows.append(
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "method": row.get("method", ""),
                "function_start_line": row.get("function_start_line", ""),
                "call_line": row.get("call_line", ""),
                "sequence_index": row.get("sequence_index", ""),
                "signal_kind": signal_kind,
                "call": row.get("call", ""),
                "scene_key": row.get("scene_key", ""),
                "widget": row.get("widget", ""),
                "text_row_id": row.get("text_row_id", ""),
                "text_en": shorten(row.get("text_en", ""), 360),
                "receiver": row.get("receiver", ""),
                "args_preview": shorten(row.get("args_preview", ""), 360),
                "line_text": shorten(row.get("line_text", ""), 420),
                "method_uid": row.get("method_uid", ""),
            }
        )
    return rows


def classify_client_signal(row: dict[str, str]) -> str:
    call = row.get("call", "")
    if row.get("text_en") or call == "say":
        return "dialogue"
    if row.get("scene_key") or call == "startHQCutScene":
        return "cutscene"
    if row.get("widget") or "Widget" in call or row.get("receiver") == "desktopWidget":
        return "widget"
    if "Fade" in call:
        return "fade"
    if call == "setMusic":
        return "music"
    if call == "_wait":
        return "wait"
    if call == "_runCharaScheduler":
        return "scheduler"
    if call:
        return "client_call"
    return "raw_or_unknown"


def build_client_method_body_extracts() -> list[dict[str, str]]:
    rows = []
    for code, quest in QUESTS.items():
        class_name = quest["class_name"]
        path = recovered_client_path(code)
        lines = path.read_text(encoding="utf-8-sig").splitlines()
        functions = []
        function_re = re.compile(rf"^function\s+{re.escape(class_name)}\.(?P<method>\w+)\(")
        for line_no, line in enumerate(lines, 1):
            match = function_re.match(line)
            if match:
                functions.append((match.group("method"), line_no))
        for index, (method, start_line) in enumerate(functions):
            end_line = (functions[index + 1][1] - 1) if index + 1 < len(functions) else len(lines)
            body_lines = lines[start_line - 1 : end_line]
            body_text = "\n".join(body_lines)
            rows.append(
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "client_script": str(path.relative_to(ROOT)).replace("\\", "/"),
                    "method": method,
                    "start_line": str(start_line),
                    "end_line": str(end_line),
                    "body_line_count": str(len(body_lines)),
                    "scene_keys": ";".join(sorted(set(re.findall(r"startHQCutScene\(\"([^\"]+)\"", body_text)))),
                    "direct_say_ids": ";".join(re.findall(r":say\([^,\n]+,\s*(\d+)", body_text)[:18]),
                    "public_inform_ids": ";".join(re.findall(r"openPublicInformDialogWidget\([^)]*?(\d{7,})", body_text)[:8]),
                    "tutorial_judge_wrappers": ";".join(re.findall(r"_getTutorialJudge\(\):(\w+)", body_text)),
                    "desktop_widget_ops": ";".join(sorted(set(re.findall(r"desktopWidget[:.](\w+)", body_text)))),
                    "body_excerpt": shorten(" | ".join(line.strip() for line in body_lines[:28] if line.strip()), 1200),
                }
            )
    return rows


def recovered_client_path(code: str) -> Path:
    return ROOT / "tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man" / f"{code}.lua"


def build_raw_function_index() -> dict[tuple[str, str], int]:
    function_re = re.compile(r"^function\s+(?P<class>\w+)\.(?P<method>\w+)\(")
    functions: dict[tuple[str, str], int] = {}
    for code, quest in QUESTS.items():
        path = recovered_client_path(code)
        for line_no, line in enumerate(path.read_text(encoding="utf-8-sig").splitlines(), 1):
            match = function_re.match(line)
            if match and match.group("class") == quest["class_name"]:
                functions[(code, match.group("method"))] = line_no
    return functions


def cast_set(value: object) -> set[str]:
    return value if isinstance(value, set) else set()


def cast_list(value: object) -> list[str]:
    return value if isinstance(value, list) else []


def build_server_delegate_surface() -> list[dict[str, str]]:
    raw_functions = build_raw_function_index()
    context_rows = {
        (row.get("server_script", ""), row.get("line", ""), row.get("method", "")): row
        for row in read_csv(ROOT / "tools/outputs/lpb/quest_cutscene_decomp_20260618/server_delegate_method_context.csv")
        if code_matches(row)
    }

    rows = []
    for row in read_csv(ROOT / "outputs/quest-execution-atlas-20260630/local_delegate_event_callers.csv"):
        code = code_matches(row)
        if not code:
            continue
        server_script = (row.get("file", "") or "").replace("\\", "/")
        server_script = server_script.removeprefix("Data/scripts/")
        method = row.get("event_method", "")
        context = context_rows.get((server_script, row.get("line", ""), method), {})
        raw_line = raw_functions.get((code, method), "")
        rows.append(
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "server_file": row.get("file", ""),
                "line": row.get("line", ""),
                "function": row.get("function", ""),
                "event_method": method,
                "call_kind": row.get("call_kind", ""),
                "raw_client_method_present": "yes" if raw_line else "no",
                "raw_client_function_start_line": str(raw_line),
                "client_method_context_count": context.get("client_method_context_count", ""),
                "client_timeline_step_count": context.get("client_timeline_step_count", ""),
                "client_joined_text_rows": context.get("client_joined_text_rows", ""),
                "client_direct_scene_keys": context.get("client_direct_scene_keys", ""),
                "client_first_text_en": shorten(context.get("client_first_text_en", "")),
                "client_ordered_step_sample": shorten(context.get("client_ordered_step_sample", ""), 360),
                "line_text": shorten(row.get("line_text", ""), 360),
            }
        )
    return rows


def build_replay_rows() -> list[dict[str, str]]:
    rows = []
    for row in read_csv(ROOT / "tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutreplay_rows_joined.csv"):
        code = code_matches(row)
        if not code:
            continue
        out = {
            "code": code,
            "quest_id": QUESTS[code]["quest_id"],
            "quest_name": QUESTS[code]["quest_name"],
            "scene_key": row.get("scene_key", ""),
            "sample_key": row.get("sample_key", ""),
            "functions": row.get("functions", ""),
            "fade_modes": row.get("fade_modes", ""),
            "classifications": row.get("classifications", ""),
            "replay_id": row.get("replay_id", ""),
            "unlock_kind": row.get("unlock_kind", ""),
            "placeholder_summary": row.get("placeholder_summary", ""),
        }
        rows.append(out)
    return rows


def parse_content_spawns() -> list[dict[str, str]]:
    spawn_re = re.compile(
        r"(?P<label_var>\w+)\s*=\s*contentArea:(?P<call>SpawnAlly|SpawnEnemy|SpawnActor)\("
        r"(?P<actor>\d+),\s*\"(?P<label>[^\"]+)\"\s*,\s*(?P<args>[^)]*)\)"
    )
    rows = []
    for code, quest in QUESTS.items():
        path = ROOT / quest["content_script"]
        for line_no, line in enumerate(path.read_text(encoding="utf-8-sig").splitlines(), 1):
            match = spawn_re.search(line)
            if not match:
                continue
            args = [part.strip() for part in match.group("args").split(",")]
            role = {
                "SpawnAlly": "ally",
                "SpawnEnemy": "enemy",
                "SpawnActor": "actor",
            }[match.group("call")]
            rows.append(
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "content_script": quest["content_script"],
                    "line": str(line_no),
                    "role": role,
                    "actor_class_id": match.group("actor"),
                    "label": match.group("label"),
                    "x": args[0] if len(args) > 0 else "",
                    "y": args[1] if len(args) > 1 else "",
                    "z": args[2] if len(args) > 2 else "",
                    "rot": args[3] if len(args) > 3 else "",
                    "extra_arg": args[4] if len(args) > 4 else "",
                    "line_text": line.strip(),
                }
            )
    return rows


def build_content_spawn_atlas_rows() -> list[dict[str, str]]:
    code_by_content_file = {
        norm_source_file(quest["content_script"]): code
        for code, quest in QUESTS.items()
    }
    rows = []
    for row in read_csv(ROOT / "outputs/quest-runtime-deep-atlas-20260630/local_content_spawns.csv"):
        source_file = norm_source_file(row.get("file", ""))
        code = code_by_content_file.get(source_file)
        if not code:
            continue
        rows.append(
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "source_file": source_file,
                "line": row.get("line", ""),
                "function": row.get("function", ""),
                "spawn_kind": row.get("spawn_kind", ""),
                "actor_expr": row.get("actor_expr", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "actor_class_path": row.get("actor_class_path", ""),
                "display_name_id": row.get("display_name_id", ""),
                "unique_name": row.get("unique_name", ""),
                "x": row.get("x", ""),
                "y": row.get("y", ""),
                "z": row.get("z", ""),
                "rotation": row.get("rotation", ""),
                "raw_args": shorten(row.get("raw_args", ""), 420),
            }
        )
    return rows


def build_objective_crosscheck_rows(content_spawn_atlas_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    normalized_objectives = defaultdict(list)
    for row in read_csv(ROOT / "outputs/quest-normalized-data-pack-20260630/quest_bnpc_objectives.csv"):
        code = code_matches(row)
        if code:
            normalized_objectives[code].append(row)

    ambient_spawns = defaultdict(list)
    for row in read_csv(ROOT / "outputs/quest-bnpc-spawns-20260620/quest_bnpc_spawn_summary.csv"):
        code = code_matches(row)
        if code:
            ambient_spawns[code].append(row)

    rows = []
    for code, quest in QUESTS.items():
        enemy_spawns = [
            row
            for row in content_spawn_atlas_rows
            if row["code"] == code and row["spawn_kind"] == "enemy" and row["actor_class_id"] == quest["objective_actor"]
        ]
        all_enemy_spawns = [
            row
            for row in content_spawn_atlas_rows
            if row["code"] == code and row["spawn_kind"] == "enemy"
        ]
        objective_rows = normalized_objectives.get(code, [])
        ambient_rows = ambient_spawns.get(code, [])
        rows.append(
            {
                "code": code,
                "quest_id": quest["quest_id"],
                "quest_name": quest["quest_name"],
                "objective_actor": quest["objective_actor"],
                "objective_label": quest["objective_label"],
                "objective_count": quest["objective_count"],
                "script_enemy_spawn_count": str(len(enemy_spawns)),
                "script_enemy_unique_names": ";".join(row["unique_name"] for row in enemy_spawns),
                "script_enemy_actor_paths": ";".join(sorted(set(row["actor_class_path"] for row in enemy_spawns if row["actor_class_path"]))),
                "script_enemy_display_name_ids": ";".join(sorted(set(row["display_name_id"] for row in enemy_spawns if row["display_name_id"]))),
                "all_script_enemy_actor_ids": ";".join(sorted(set(row["actor_class_id"] for row in all_enemy_spawns))),
                "normalized_bnpc_objective_rows": str(len(objective_rows)),
                "ambient_spawn_summary_rows": str(len(ambient_rows)),
                "materialization_read": (
                    "bespoke_content_script_spawn"
                    if len(enemy_spawns) == int(quest["objective_count"]) and not objective_rows and not ambient_rows
                    else "review"
                ),
                "probe_read": f"simulate {quest['objective_count']}x !testbnpckill {quest['objective_actor']}",
            }
        )
    return rows


def build_actor_surface_rows() -> list[dict[str, str]]:
    rows = []
    for row in read_csv(ROOT / "outputs/quest-runtime-deep-atlas-20260630/local_quest_enpc_bindings.csv"):
        code = code_matches(row)
        if not code:
            continue
        if (row.get("is_commented", "") or "").lower() in {"1", "true", "yes"}:
            continue
        rows.append(
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "source_file": row.get("file", ""),
                "line": row.get("line", ""),
                "function": row.get("function", ""),
                "sequence_expr": row.get("sequence_expr", ""),
                "actor_expr": row.get("actor_expr", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "actor_class_path": row.get("actor_class_path", ""),
                "display_name_id": row.get("display_name_id", ""),
                "flag_expr": row.get("flag_expr", ""),
                "raw_args": shorten(row.get("raw_args", ""), 360),
            }
        )
    return rows


def build_dat_marker_rows() -> list[dict[str, str]]:
    fields = [
        "sequence",
        "marker_constant",
        "marker_id",
        "slot",
        "x",
        "z",
        "map_group",
        "map_id",
        "radius",
        "marker_class",
        "visible",
        "source",
        "confidence",
    ]
    rows = []
    for row in read_csv(ROOT / "outputs/quest-normalized-data-pack-20260630/quest_markers.csv"):
        code = code_matches(row)
        if not code:
            continue
        out = {
            "code": code,
            "quest_id": QUESTS[code]["quest_id"],
            "quest_name": QUESTS[code]["quest_name"],
        }
        for field in fields:
            out[field] = row.get(field, "")
        rows.append(out)
    return rows


def build_local_marker_constants() -> list[dict[str, str]]:
    marker_re = re.compile(r"^\s*(?P<constant>MRKR_\w+)\s*=\s*(?P<id>\d+)\s*;(?:\s*--\s*(?P<note>.*))?")
    rows = []
    for code, quest in QUESTS.items():
        path = ROOT / quest["local_script"]
        for line_no, line in enumerate(path.read_text(encoding="utf-8-sig").splitlines(), 1):
            match = marker_re.match(line)
            if not match:
                continue
            rows.append(
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "local_script": quest["local_script"],
                    "line": str(line_no),
                    "marker_constant": match.group("constant"),
                    "marker_id": match.group("id"),
                    "note": shorten(match.group("note") or ""),
                    "line_text": line.strip(),
                }
            )
    return rows


def build_local_constant_rows() -> list[dict[str, str]]:
    rows = []
    for row in read_csv(ROOT / "outputs/quest-runtime-deep-atlas-20260630/local_quest_constants.csv"):
        code = code_matches(row)
        if not code:
            continue
        rows.append(
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "source_file": row.get("file", ""),
                "constant": row.get("constant", ""),
                "value": row.get("value", ""),
                "actor_class_path": row.get("actor_class_path", ""),
                "display_name_id": row.get("display_name_id", ""),
                "constant_kind": constant_kind(row.get("constant", "")),
            }
        )
    return rows


def constant_kind(name: str) -> str:
    if name.startswith("SEQ_"):
        return "sequence"
    if name.startswith("FLAG_"):
        return "flag"
    if name.startswith("MRKR_"):
        return "marker"
    if name.startswith("BNPC_"):
        return "bnpc"
    if name.startswith("ENPC_"):
        return "enpc"
    if name.startswith("EOBJ_"):
        return "eobj"
    return "actor_or_other"


def build_delegate_push_call_rows() -> list[dict[str, str]]:
    fields = [
        "file",
        "line",
        "function",
        "sequence_expr",
        "call_kind",
        "target_expr",
        "target_kind",
        "target_code",
        "event_method",
        "extra_args",
        "extra_arg_count",
        "matched_recovered_row",
        "match_kind",
        "recovered_event_method",
        "active_owner_kind",
        "active_event_name_expected",
        "active_event_type_expected",
        "active_event_type_source",
        "wait_recipe",
        "end_event_policy",
        "owner_visibility_precondition",
        "scene_keys",
        "fade_mode",
        "cutReplay_rows",
        "risk_notes",
        "raw_call",
    ]
    rows = []
    for row in read_csv(ROOT / "outputs/quest-runtime-deep-atlas-20260630/local_delegate_push_calls.csv"):
        code = code_matches(row)
        if not code:
            continue
        if (row.get("is_commented", "") or "").lower() in {"1", "true", "yes"}:
            continue
        out = {
            "code": code,
            "quest_id": QUESTS[code]["quest_id"],
            "quest_name": QUESTS[code]["quest_name"],
        }
        for field in fields:
            out[field] = shorten(row.get(field, ""), 420) if field in {"extra_args", "risk_notes", "raw_call"} else row.get(field, "")
        rows.append(out)
    return rows


def build_lifecycle_action_rows() -> list[dict[str, str]]:
    rows = []
    for row in read_csv(ROOT / "outputs/quest-runtime-deep-atlas-20260630/local_event_lifecycle_actions.csv"):
        code = code_matches(row)
        if not code:
            continue
        if (row.get("is_commented", "") or "").lower() in {"1", "true", "yes"}:
            continue
        rows.append(
            {
                "code": code,
                "quest_id": QUESTS[code]["quest_id"],
                "quest_name": QUESTS[code]["quest_name"],
                "source_file": row.get("file", ""),
                "line": row.get("line", ""),
                "function": row.get("function", ""),
                "sequence_expr": row.get("sequence_expr", ""),
                "action": row.get("action", ""),
                "args": shorten(row.get("args", ""), 360),
                "raw_call": shorten(row.get("raw_call", ""), 420),
            }
        )
    return rows


def build_reward_rows() -> list[dict[str, str]]:
    fields = [
        "sort_order",
        "reward_type",
        "reward_id",
        "quantity",
        "class_job_id",
        "source",
        "auto_grant",
        "confidence",
        "duplicate_grant_risk",
        "notes",
    ]
    rows = []
    for row in read_csv(ROOT / "outputs/quest-normalized-data-pack-20260630/quest_rewards.csv"):
        code = code_matches(row)
        if not code:
            continue
        out = {
            "code": code,
            "quest_id": QUESTS[code]["quest_id"],
            "quest_name": QUESTS[code]["quest_name"],
        }
        for field in fields:
            out[field] = shorten(row.get(field, ""), 360) if field == "notes" else row.get(field, "")
        rows.append(out)
    return rows


def quest_source_paths(code: str) -> list[tuple[str, Path]]:
    quest = QUESTS[code]
    return [
        (quest["local_script"], ROOT / quest["local_script"]),
        (quest["director_script"], ROOT / quest["director_script"]),
    ]


def norm_source_file(value: str) -> str:
    return (value or "").replace("\\", "/")


def iter_source_lines() -> list[dict[str, str]]:
    function_re = re.compile(r"^\s*function\s+(?P<function>[\w.:]+)\(")
    rows = []
    for code in QUESTS:
        for source_file, path in quest_source_paths(code):
            current_function = ""
            for line_no, line in enumerate(path.read_text(encoding="utf-8-sig").splitlines(), 1):
                match = function_re.match(line)
                if match:
                    current_function = match.group("function")
                rows.append(
                    {
                        "code": code,
                        "quest_id": QUESTS[code]["quest_id"],
                        "quest_name": QUESTS[code]["quest_name"],
                        "source_file": norm_source_file(source_file),
                        "line": str(line_no),
                        "function": current_function,
                        "line_text": line.strip(),
                    }
                )
    return rows


def build_local_constant_value_index() -> dict[tuple[str, str], str]:
    return {
        (row["code"], row["constant"]): row["value"]
        for row in build_local_constant_rows()
    }


def build_flag_usage_rows() -> list[dict[str, str]]:
    flag_re = re.compile(r"(?P<owner>\w+(?::GetData\(\))?):(?P<operation>GetFlag|SetFlag|UnsetFlag)\((?P<flag_expr>[^)]*)\)")
    constants = build_local_constant_value_index()
    rows = []
    for source in iter_source_lines():
        for match in flag_re.finditer(source["line_text"]):
            flag_expr = match.group("flag_expr").strip()
            rows.append(
                {
                    "code": source["code"],
                    "quest_id": source["quest_id"],
                    "quest_name": source["quest_name"],
                    "source_file": source["source_file"],
                    "line": source["line"],
                    "function": source["function"],
                    "operation": match.group("operation"),
                    "owner_expr": match.group("owner"),
                    "flag_expr": flag_expr,
                    "flag_value": constants.get((source["code"], flag_expr), ""),
                    "line_text": source["line_text"],
                }
            )
    return rows


def build_counter_usage_rows() -> list[dict[str, str]]:
    counter_re = re.compile(
        r"(?P<owner>[\w:()]+):(?P<operation>GetCounter|SetCounter|AddCounter|IncrementCounter)\((?P<args>[^)]*)\)"
    )
    constants = build_local_constant_value_index()
    rows = []
    for source in iter_source_lines():
        for match in counter_re.finditer(source["line_text"]):
            args = [part.strip() for part in match.group("args").split(",")]
            counter_expr = args[0] if args else ""
            rows.append(
                {
                    "code": source["code"],
                    "quest_id": source["quest_id"],
                    "quest_name": source["quest_name"],
                    "source_file": source["source_file"],
                    "line": source["line"],
                    "function": source["function"],
                    "operation": match.group("operation"),
                    "owner_expr": match.group("owner"),
                    "counter_expr": counter_expr,
                    "counter_value": constants.get((source["code"], counter_expr), ""),
                    "args": match.group("args").strip(),
                    "line_text": source["line_text"],
                }
            )
    return rows


def build_source_delegate_call_rows() -> list[dict[str, str]]:
    delegate_re = re.compile(r"callClientFunction\([^;\n]*?\"delegateEvent\"[^;\n]*?,\s*\"(?P<method>\w+)\"")
    rows = []
    for source in iter_source_lines():
        for match in delegate_re.finditer(source["line_text"]):
            rows.append(
                {
                    "code": source["code"],
                    "quest_id": source["quest_id"],
                    "quest_name": source["quest_name"],
                    "source_file": source["source_file"],
                    "line": source["line"],
                    "function": source["function"],
                    "event_method": match.group("method"),
                    "line_text": source["line_text"],
                }
            )
    return rows


def build_source_to_client_method_rows(
    source_delegate_rows: list[dict[str, str]],
    methods: list[dict[str, str]],
    body_rows: list[dict[str, str]],
) -> list[dict[str, str]]:
    method_index = {(row["code"], row["method"]): row for row in methods}
    body_index = {(row["code"], row["method"]): row for row in body_rows}
    rows = []
    for row in source_delegate_rows:
        method = method_index.get((row["code"], row["event_method"]), {})
        body = body_index.get((row["code"], row["event_method"]), {})
        rows.append(
            {
                "code": row["code"],
                "quest_id": row["quest_id"],
                "quest_name": row["quest_name"],
                "source_file": row["source_file"],
                "line": row["line"],
                "function": row["function"],
                "event_method": row["event_method"],
                "raw_method_present": "yes" if body else "no",
                "client_start_line": body.get("start_line", method.get("function_start_line", "")),
                "client_end_line": body.get("end_line", ""),
                "body_line_count": body.get("body_line_count", ""),
                "scene_keys": first_nonempty([method.get("scene_keys", ""), body.get("scene_keys", "")]),
                "text_row_count": method.get("text_row_count", ""),
                "text_ids_sample": method.get("text_ids_sample", ""),
                "first_text_en": method.get("first_text_en", ""),
                "calls_sample": method.get("calls_sample", ""),
                "tutorial_judge_wrappers": body.get("tutorial_judge_wrappers", ""),
                "desktop_widget_ops": body.get("desktop_widget_ops", ""),
                "body_excerpt": body.get("body_excerpt", ""),
            }
        )
    return rows


def build_marker_condition_rows(
    dat_marker_rows: list[dict[str, str]],
    local_marker_rows: list[dict[str, str]],
) -> list[dict[str, str]]:
    marker_id_by_constant = {
        (row["code"], row["marker_constant"]): row["marker_id"]
        for row in local_marker_rows
    }
    dat_by_marker: dict[tuple[str, str], list[dict[str, str]]] = defaultdict(list)
    for row in dat_marker_rows:
        dat_by_marker[(row["code"], row["marker_id"])].append(row)

    rows = []
    recent_by_function: dict[tuple[str, str, str], list[str]] = defaultdict(list)
    marker_re = re.compile(r"table\.insert\(possibleMarkers,\s*(?P<marker>MRKR_\w+)\)")
    for source in iter_source_lines():
        if source["function"] != "getJournalMapMarkerList":
            continue
        key = (source["code"], source["source_file"], source["function"])
        if source["line_text"]:
            recent_by_function[key].append(source["line_text"])
            recent_by_function[key] = recent_by_function[key][-5:]
        for match in marker_re.finditer(source["line_text"]):
            marker_constant = match.group("marker")
            marker_id = marker_id_by_constant.get((source["code"], marker_constant), "")
            dat_rows = dat_by_marker.get((source["code"], marker_id), [])
            rows.append(
                {
                    "code": source["code"],
                    "quest_id": source["quest_id"],
                    "quest_name": source["quest_name"],
                    "source_file": source["source_file"],
                    "line": source["line"],
                    "marker_constant": marker_constant,
                    "marker_id": marker_id,
                    "condition_context": shorten(" | ".join(recent_by_function[key]), 700),
                    "dat_sequence_values": ";".join(sorted(set(row.get("sequence", "") for row in dat_rows if row.get("sequence", "")))),
                    "dat_position_sample": "; ".join(
                        shorten(
                            f"slot {row.get('slot', '')} map {row.get('map_id', '')} "
                            f"x {row.get('x', '')} z {row.get('z', '')} radius {row.get('radius', '')}",
                            180,
                        )
                        for row in dat_rows[:4]
                    ),
                    "dat_row_count": str(len(dat_rows)),
                    "line_text": source["line_text"],
                }
            )
    return rows


def build_transition_action_rows() -> list[dict[str, str]]:
    patterns = [
        ("StartSequence", re.compile(r"quest:StartSequence\((?P<args>[^)]*)\)")),
        ("ReplaceQuest", re.compile(r"player:ReplaceQuest\((?P<args>[^)]*)\)")),
        ("AddDirector", re.compile(r"player:AddDirectorWithoutContentGroup\((?P<args>[^)]*)\)")),
        ("StartDirector", re.compile(r"director:StartDirector\((?P<args>[^)]*)\)")),
        ("SetLoginDirector", re.compile(r"player:SetLoginDirector\((?P<args>[^)]*)\)")),
        ("DoZoneChangeContent", re.compile(r"GetWorldManager\(\):DoZoneChangeContent\((?P<args>[^)]*)\)")),
        ("StartContentGroup", re.compile(r"director:StartContentGroup\((?P<args>[^)]*)\)")),
        ("KickEvent", re.compile(r"player:KickEvent\((?P<args>[^)]*)\)")),
        ("kickEventContinue", re.compile(r"kickEventContinue\((?P<args>[^)]*)\)")),
        ("ContentFinished", re.compile(r"ContentFinished\((?P<args>[^)]*)\)")),
        ("DoZoneChange", re.compile(r"GetWorldManager\(\):DoZoneChange\((?P<args>[^)]*)\)")),
        ("CompleteQuest", re.compile(r"player:CompleteQuest\((?P<args>[^)]*)\)")),
        ("EndEvent", re.compile(r"\bEndEvent\((?P<args>[^)]*)\)")),
    ]
    rows = []
    for source in iter_source_lines():
        for action, pattern in patterns:
            for match in pattern.finditer(source["line_text"]):
                rows.append(
                    {
                        "code": source["code"],
                        "quest_id": source["quest_id"],
                        "quest_name": source["quest_name"],
                        "source_file": source["source_file"],
                        "line": source["line"],
                        "function": source["function"],
                        "action": action,
                        "args": shorten(match.group("args"), 360),
                        "line_text": source["line_text"],
                    }
                )
    return rows


def build_choice_gate_rows() -> list[dict[str, str]]:
    choice_re = re.compile(
        r"\b(?P<var>\w*choice\w*)\s*=\s*callClientFunction\([^;\n]*?\"delegateEvent\"[^;\n]*?,\s*\"(?P<method>\w+)\"",
        re.IGNORECASE,
    )
    compare_re = re.compile(r"\b(?P<var>\w*choice\w*)\s*(?P<operator>==|~=|<=|>=|<|>)\s*(?P<value>[\w\"']+)", re.IGNORECASE)
    rows = []
    last_choice_by_function: dict[tuple[str, str, str], tuple[str, str, str]] = {}
    for source in iter_source_lines():
        key = (source["code"], source["source_file"], source["function"])
        for match in choice_re.finditer(source["line_text"]):
            last_choice_by_function[key] = (match.group("var"), match.group("method"), source["line"])
            rows.append(
                {
                    "code": source["code"],
                    "quest_id": source["quest_id"],
                    "quest_name": source["quest_name"],
                    "source_file": source["source_file"],
                    "line": source["line"],
                    "function": source["function"],
                    "choice_var": match.group("var"),
                    "event_method": match.group("method"),
                    "operator": "",
                    "expected_value": "",
                    "related_choice_line": source["line"],
                    "line_text": source["line_text"],
                }
            )
        for match in compare_re.finditer(source["line_text"]):
            related = last_choice_by_function.get(key, (match.group("var"), "", ""))
            rows.append(
                {
                    "code": source["code"],
                    "quest_id": source["quest_id"],
                    "quest_name": source["quest_name"],
                    "source_file": source["source_file"],
                    "line": source["line"],
                    "function": source["function"],
                    "choice_var": match.group("var"),
                    "event_method": related[1],
                    "operator": match.group("operator"),
                    "expected_value": match.group("value"),
                    "related_choice_line": related[2],
                    "line_text": source["line_text"],
                }
            )
    return rows


def build_function_skeleton_rows(
    delegate_rows: list[dict[str, str]],
    flag_rows: list[dict[str, str]],
    counter_rows: list[dict[str, str]],
    transition_rows: list[dict[str, str]],
) -> list[dict[str, str]]:
    skeletons: dict[tuple[str, str, str], dict[str, object]] = {}

    for source in iter_source_lines():
        if not source["function"]:
            continue
        key = (source["code"], source["source_file"], source["function"])
        entry = skeletons.setdefault(
            key,
            {
                "code": source["code"],
                "quest_id": source["quest_id"],
                "quest_name": source["quest_name"],
                "source_file": source["source_file"],
                "function": source["function"],
                "start_line": source["line"],
                "end_line": source["line"],
                "event_methods": [],
                "flags_read": set(),
                "flags_written": set(),
                "counters_touched": set(),
                "transition_actions": [],
                "ordered_anchor_sample": [],
            },
        )
        entry["end_line"] = source["line"]

    for row in delegate_rows:
        add_function_anchor(
            skeletons,
            row,
            "event_methods",
            row.get("event_method", ""),
            f"{row.get('line', '')}:event:{row.get('event_method', '')}",
        )
    for row in flag_rows:
        column = "flags_written" if row.get("operation") in {"SetFlag", "UnsetFlag"} else "flags_read"
        add_function_anchor(
            skeletons,
            row,
            column,
            row.get("flag_expr", ""),
            f"{row.get('line', '')}:{row.get('operation', '')}:{row.get('flag_expr', '')}",
        )
    for row in counter_rows:
        add_function_anchor(
            skeletons,
            row,
            "counters_touched",
            row.get("counter_expr", ""),
            f"{row.get('line', '')}:{row.get('operation', '')}:{row.get('counter_expr', '')}",
        )
    for row in transition_rows:
        add_function_anchor(
            skeletons,
            row,
            "transition_actions",
            row.get("action", ""),
            f"{row.get('line', '')}:action:{row.get('action', '')}",
        )

    rows = []
    for entry in sorted(skeletons.values(), key=lambda item: (str(item["code"]), str(item["source_file"]), int(str(item["start_line"])))):
        rows.append(
            {
                "code": str(entry["code"]),
                "quest_id": str(entry["quest_id"]),
                "quest_name": str(entry["quest_name"]),
                "source_file": str(entry["source_file"]),
                "function": str(entry["function"]),
                "start_line": str(entry["start_line"]),
                "end_line": str(entry["end_line"]),
                "event_method_count": str(len(cast_list(entry["event_methods"]))),
                "event_methods": ";".join(cast_list(entry["event_methods"])),
                "flags_read": ";".join(sorted(cast_set(entry["flags_read"]))),
                "flags_written": ";".join(sorted(cast_set(entry["flags_written"]))),
                "counters_touched": ";".join(sorted(cast_set(entry["counters_touched"]))),
                "transition_actions": ";".join(cast_list(entry["transition_actions"])),
                "ordered_anchor_sample": " -> ".join(cast_list(entry["ordered_anchor_sample"])[:14]),
            }
        )
    return rows


def add_function_anchor(
    skeletons: dict[tuple[str, str, str], dict[str, object]],
    row: dict[str, str],
    column: str,
    value: str,
    anchor: str,
) -> None:
    key = (row.get("code", ""), row.get("source_file") or row.get("file") or row.get("server_file", ""), row.get("function", ""))
    key = (key[0], norm_source_file(key[1]), key[2])
    entry = skeletons.get(key)
    if not entry:
        return
    bucket = entry[column]
    if isinstance(bucket, set):
        if value:
            bucket.add(value)
    elif isinstance(bucket, list) and value and value not in bucket:
        bucket.append(value)
    cast_list(entry["ordered_anchor_sample"]).append(anchor)


def build_fight_route_rows() -> list[dict[str, str]]:
    lifecycle_by_code = {}
    for row in read_csv(ROOT / "outputs/quest-fight-materialization-atlas-20260630/fight_content_lifecycle_join.csv"):
        code = code_matches(row)
        if code:
            lifecycle_by_code[code] = row

    kill_by_code = {}
    for row in read_csv(ROOT / "outputs/quest-fight-materialization-atlas-20260630/fight_kill_route_join.csv"):
        code = code_matches(row)
        if code:
            kill_by_code[code] = row

    rows = []
    for code, quest in QUESTS.items():
        lifecycle = lifecycle_by_code.get(code, {})
        kill = kill_by_code.get(code, {})
        rows.append(
            {
                "code": code,
                "quest_id": quest["quest_id"],
                "quest_name": quest["quest_name"],
                "content_area": quest["content_area"],
                "content_script": quest["content_class"],
                "director_script": quest["director_class"],
                "objective_actor": quest["objective_actor"],
                "objective_label": quest["objective_label"],
                "objective_count": quest["objective_count"],
                "attention_packet": quest["attention_packet"],
                "post_fight_method": quest["post_fight_method"],
                "return_zone": quest["return_zone"],
                "return_private_area": quest["return_private_area"],
                "return_private_area_type": quest["return_private_area_type"],
                "return_pos": quest["return_pos"],
                "handoff": quest["handoff"],
                "lifecycle_status": lifecycle.get("lifecycle_status", ""),
                "route_status": kill.get("route_status", ""),
                "actor_materialization_statuses": kill.get("actor_materialization_statuses", ""),
                "next_fix": first_nonempty([kill.get("next_fix", ""), lifecycle.get("next_fix", "")]),
                "evidence_refs": first_nonempty([kill.get("evidence_refs", ""), lifecycle.get("evidence_refs", "")]),
            }
        )
    return rows


def build_sequence_flow_rows() -> list[dict[str, str]]:
    rows = []
    for code, quest in QUESTS.items():
        rows.extend(
            [
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "sequence": "000",
                    "phase": "city tutorial setup",
                    "server_anchor": quest["local_script"],
                    "client_anchor": "processTtrNomal002;processTtrNomal003",
                    "expected_state": "required opening talks and tutorial pushes unlock the content entry",
                },
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "sequence": "005",
                    "phase": "private content fight",
                    "server_anchor": f"{quest['content_area']} / {quest['director_class']}",
                    "client_anchor": "processTtrBtl001;processTtrBtl002",
                    "expected_state": (
                        f"kill {quest['objective_count']}x {quest['objective_actor']} "
                        f"then send attention {quest['attention_packet']}"
                    ),
                },
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "sequence": "005 -> 010",
                    "phase": "post-fight return",
                    "server_anchor": quest["director_script"],
                    "client_anchor": quest["post_fight_method"],
                    "expected_state": (
                        f"finish content, warp to zone {quest['return_zone']} "
                        f"type {quest['return_private_area_type']}, start SEQ_010"
                    ),
                },
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "sequence": "010",
                    "phase": "city handoff",
                    "server_anchor": quest["local_script"],
                    "client_anchor": quest["handoff"],
                    "expected_state": "next city quest replacement only occurs through the explicit handoff actor",
                },
            ]
        )
    return rows


def build_probe_checklist() -> list[dict[str, str]]:
    common_checks = [
        "content entry fires noticeEvent once",
        "battle tutorial reaches objective-kill widget",
        "objective kill counter reaches threshold",
        "attention packet is sent before post-fight story handoff",
        "kickEventContinue resumes the event lane",
        "post-fight story method runs",
        "ContentFinished fires before return zone change",
        "quest starts SEQ_010 after return handoff",
        "temporary party and combat mods are cleared",
        "next quest replacement only happens through the explicit city handoff",
    ]
    rows = []
    for code, quest in QUESTS.items():
        for index, check in enumerate(common_checks, 1):
            rows.append(
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "check_order": str(index),
                    "check": check,
                    "expected_anchor": anchor_for_check(quest, check),
                }
            )
    return rows


def anchor_for_check(quest: dict[str, str], check: str) -> str:
    if "objective kill" in check:
        return f"{quest['objective_count']}x {quest['objective_actor']}"
    if "attention packet" in check:
        return quest["attention_packet"]
    if "post-fight story" in check:
        return quest["post_fight_method"]
    if "return zone" in check or "SEQ_010" in check:
        return f"{quest['return_zone']} {quest['return_private_area']} type {quest['return_private_area_type']} {quest['return_pos']}"
    if "next quest" in check:
        return quest["handoff"]
    if "noticeEvent" in check:
        return quest["director_class"]
    return ""


def build_probe_commands() -> list[dict[str, str]]:
    rows = []
    for code, quest in QUESTS.items():
        kill_count = int(quest["objective_count"])
        commands = [
            (
                "1",
                "accept",
                f"!quest {quest['quest_id']} add",
                "ensure the opening quest is in the player journal",
                "",
                "journal contains quest",
            ),
            (
                "2",
                "direct content checkpoint",
                f"!questcomplete {code} {quest['questcomplete_checkpoint']}",
                "enter the private content fight checkpoint",
                "",
                f"{quest['content_area']} starts with {quest['director_class']}",
            ),
            (
                "3",
                "inspect in content",
                f"!quest info {quest['quest_id']}",
                "confirm sequence and counters after content entry",
                "",
                "SEQ_005 is active",
            ),
            (
                "4",
                "complete objective",
                f"!testbnpckill {quest['objective_actor']}",
                "simulate objective kill credit",
                str(kill_count),
                f"{kill_count}x {quest['objective_actor']} reaches completion",
            ),
            (
                "5",
                "inspect after return",
                f"!quest info {quest['quest_id']}",
                "confirm return handoff state",
                "",
                f"SEQ_010 in zone {quest['return_zone']}",
            ),
        ]
        for order, phase, command, purpose, repeat_count, expected_anchor in commands:
            rows.append(
                {
                    "code": code,
                    "quest_id": quest["quest_id"],
                    "quest_name": quest["quest_name"],
                    "command_order": order,
                    "phase": phase,
                    "command": command,
                    "repeat_count": repeat_count,
                    "purpose": purpose,
                    "expected_anchor": expected_anchor,
                }
            )
    return rows


def write_readme(summary_rows: list[dict[str, str]]) -> None:
    lines = [
        "# Starter City Opening Quests Decomp Pack - 2026-07-05",
        "",
        "Focused extracts for `Man0l0`, `Man0g0`, and `Man0u0`.",
        "",
        "Generated by `python tools/build_starter_city_opening_quests_decomp.py`.",
        "",
        "## Files",
        "",
        "- `quest_summary.csv`: quest identity and implementation counters.",
        "- `fight_route_matrix.csv`: content/director/kill/return route summary.",
        "- `content_spawn_rows.csv`: parsed local content spawns for allies, enemies, and stopper actors.",
        "- `actor_surface_rows.csv`: active local ENPC bindings by sequence/function.",
        "- `dat_marker_rows.csv`: DAT marker rows filtered to the three quest ids.",
        "- `local_marker_constants.csv`: marker constants defined by the local quest scripts.",
        "- `local_constant_rows.csv`: sequence, flag, marker, actor, and other local constants from the deep atlas.",
        "- `delegate_push_call_rows.csv`: local delegate pushes with owner/wait/end-event contract hints.",
        "- `lifecycle_action_rows.csv`: local event lifecycle actions such as `EndEvent`, `ContentFinished`, and warps.",
        "- `reward_rows.csv`: normalized reward rows and duplicate-grant risk notes.",
        "- `flag_usage_rows.csv`: local `GetFlag`/`SetFlag`/`UnsetFlag` reads and writes.",
        "- `counter_usage_rows.csv`: local quest/director counter reads and writes.",
        "- `source_delegate_call_rows.csv`: direct source scan of quest and director client delegate calls.",
        "- `transition_action_rows.csv`: ordered local sequence, zone, event, and completion actions.",
        "- `choice_gate_rows.csv`: client choice-return captures and comparisons.",
        "- `function_skeleton_rows.csv`: per-function local event/state/action summaries.",
        "- `sequence_flow_rows.csv`: compact sequence-to-runtime flow map.",
        "- `server_delegate_surface.csv`: local delegate calls joined to recovered client method context, with raw method presence marked separately.",
        "- `client_method_summary.csv`: recovered client method step/text/scene summary, including raw widget-only/helper-only methods.",
        "- `client_dialogue_rows.csv`: all recovered dialogue/text rows for these methods.",
        "- `client_signal_rows.csv`: granular recovered client operations by method and signal kind.",
        "- `client_method_body_extracts.csv`: raw recovered client method body excerpts and body signals.",
        "- `content_spawn_atlas_rows.csv`: richer content spawn rows with actor paths and display ids.",
        "- `objective_crosscheck_rows.csv`: objective actor/count vs script-spawn and ambient-objective evidence.",
        "- `source_to_client_method_rows.csv`: source delegate calls joined to recovered method summaries and body excerpts.",
        "- `marker_condition_rows.csv`: local marker insert conditions joined to marker ids and DAT marker rows.",
        "- `replay_scene_rows.csv`: cutscene replay rows for these quests.",
        "- `runtime_probe_checklist.csv`: concrete probe checklist.",
        "- `probe_commands.csv`: GM command scaffold for live smoke checks.",
        "- `dossier_man0l0.md`, `dossier_man0g0.md`, `dossier_man0u0.md`: generated per-quest handoff notes.",
        "",
        "## Summary",
        "",
        "| Code | Quest | Source Calls | Client Signals | Dialogue | Objective Rows | Spawns | Flags | Transitions |",
        "| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |",
    ]
    for row in summary_rows:
        lines.append(
            f"| `{row['code']}` | {row['quest_name']} | {row['source_delegate_call_count']} | "
            f"{row['client_signal_count']} | {row['client_dialogue_row_count']} | "
            f"{row['objective_crosscheck_count']} | {row['content_spawn_atlas_count']} | "
            f"{row['flag_usage_count']} | {row['transition_action_count']} |"
        )
    lines.extend(
        [
            "",
            "Read with `docs/starter_city_opening_quests_decomp_2026-07-05.md`.",
        ]
    )
    (OUT / "README.md").write_text("\n".join(lines) + "\n", encoding="utf-8")


def write_quest_dossiers(
    summary_rows: list[dict[str, str]],
    fight_routes: list[dict[str, str]],
    spawns: list[dict[str, str]],
    reward_rows: list[dict[str, str]],
    marker_conditions: list[dict[str, str]],
    objective_rows: list[dict[str, str]],
    choice_rows: list[dict[str, str]],
    source_to_client_rows: list[dict[str, str]],
    transition_rows: list[dict[str, str]],
    probe_commands: list[dict[str, str]],
) -> None:
    summary_by_code = {row["code"]: row for row in summary_rows}
    fight_by_code = {row["code"]: row for row in fight_routes}
    for code, quest in QUESTS.items():
        summary = summary_by_code[code]
        fight = fight_by_code[code]
        lines = [
            f"# {quest['quest_name']} / {quest['class_name']} Dossier",
            "",
            "Generated by `tools/build_starter_city_opening_quests_decomp.py`.",
            "",
            "## Route",
            "",
            f"- Quest id: `{quest['quest_id']}`",
            f"- Local script: `{quest['local_script']}`",
            f"- Content: `{fight['content_area']}` / `{fight['content_script']}` / `{fight['director_script']}`",
            f"- Objective: `{fight['objective_count']}`x `{fight['objective_actor']}` ({fight['objective_label']})",
            f"- Post-fight method: `{fight['post_fight_method']}`",
            f"- Return: zone `{fight['return_zone']}`, type `{fight['return_private_area_type']}`, `{fight['return_pos']}`",
            f"- Handoff: {fight['handoff']}",
            "",
            "## Counts",
            "",
            "| Delegates | Source calls | Client methods | Dialogue rows | Flags | Transitions | Actors | Markers |",
            "| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |",
            (
                f"| {summary['delegate_count']} | {summary['source_delegate_call_count']} | "
                f"{summary['client_method_count']} | {summary['client_text_row_count']} | "
                f"{summary['flag_usage_count']} | {summary['transition_action_count']} | "
                f"{summary['actor_binding_count']} | {summary['dat_marker_count']} |"
            ),
            "",
            "## Content Spawns",
            "",
            "| Role | Actor | Label | Position |",
            "| --- | ---: | --- | --- |",
        ]
        for row in rows_for(code, spawns):
            lines.append(f"| {row['role']} | {row['actor_class_id']} | `{row['label']}` | `{row['x']}, {row['y']}, {row['z']}, {row['rot']}` |")

        lines.extend(["", "## Objective Cross-Check", "", "| Objective | Script spawns | Actor path | Read |", "| --- | ---: | --- | --- |"])
        for row in rows_for(code, objective_rows):
            lines.append(
                f"| `{row['objective_count']}x {row['objective_actor']}` | {row['script_enemy_spawn_count']} | "
                f"`{md_cell(row['script_enemy_actor_paths'])}` | `{row['materialization_read']}` |"
            )

        lines.extend(["", "## Source To Client Calls", "", "| Function | Line | Method | Text | Body signals |", "| --- | ---: | --- | --- | --- |"])
        for row in rows_for(code, source_to_client_rows):
            if row["function"] not in {"onKillBNpc", "onEventStarted", "doExitDoor", "doContentArea", "doExitTrigger", "seq010_onTalk"}:
                continue
            signal = first_nonempty([row.get("scene_keys", ""), row.get("tutorial_judge_wrappers", ""), row.get("desktop_widget_ops", "")])
            lines.append(
                f"| `{row['function']}` | {row['line']} | `{row['event_method']}` | "
                f"{md_cell(shorten(row.get('first_text_en', ''), 80))} | `{md_cell(signal)}` |"
            )

        lines.extend(["", "## Transition Anchors", "", "| Line | Function | Action | Args |", "| ---: | --- | --- | --- |"])
        for row in rows_for(code, transition_rows):
            if row["action"] not in {"StartSequence", "DoZoneChangeContent", "KickEvent", "ContentFinished", "DoZoneChange", "ReplaceQuest"}:
                continue
            lines.append(f"| {row['line']} | `{row['function']}` | `{row['action']}` | `{row['args']}` |")

        choices = rows_for(code, choice_rows)
        if choices:
            lines.extend(["", "## Choice Gates", "", "| Line | Function | Method | Gate |", "| ---: | --- | --- | --- |"])
            for row in choices:
                gate = f"{row['operator']} {row['expected_value']}".strip()
                lines.append(f"| {row['line']} | `{row['function']}` | `{row['event_method']}` | `{gate}` |")

        lines.extend(["", "## Marker Conditions", "", "| Marker | Id | Condition Context | DAT rows |", "| --- | ---: | --- | ---: |"])
        for row in rows_for(code, marker_conditions):
            lines.append(
                f"| `{row['marker_constant']}` | {row['marker_id']} | {md_cell(shorten(row['condition_context'], 120))} | {row['dat_row_count']} |"
            )

        lines.extend(["", "## Rewards", "", "| Type | Id | Qty | Source | Note |", "| --- | ---: | ---: | --- | --- |"])
        for row in rows_for(code, reward_rows):
            lines.append(f"| {row['reward_type']} | {row['reward_id']} | {row['quantity']} | {row['source']} | {md_cell(shorten(row['notes'], 80))} |")

        lines.extend(["", "## Probe Commands", ""])
        for row in rows_for(code, probe_commands):
            repeat = f" x{row['repeat_count']}" if row["repeat_count"] else ""
            lines.append(f"{row['command_order']}. `{row['command']}`{repeat} - {row['expected_anchor']}")

        (OUT / f"dossier_{code}.md").write_text("\n".join(lines) + "\n", encoding="utf-8")


def rows_for(code: str, rows: list[dict[str, str]]) -> list[dict[str, str]]:
    return [row for row in rows if row.get("code") == code]


def md_cell(value: str) -> str:
    return (value or "").replace("\n", " ").replace("|", "\\|")


def build_summary(
    delegates: list[dict[str, str]],
    methods: list[dict[str, str]],
    spawns: list[dict[str, str]],
    replay_rows: list[dict[str, str]],
    actor_rows: list[dict[str, str]],
    dat_marker_rows: list[dict[str, str]],
    local_marker_rows: list[dict[str, str]],
    local_constant_rows: list[dict[str, str]],
    delegate_push_rows: list[dict[str, str]],
    lifecycle_rows: list[dict[str, str]],
    reward_rows: list[dict[str, str]],
    flag_rows: list[dict[str, str]],
    counter_rows: list[dict[str, str]],
    source_delegate_rows: list[dict[str, str]],
    transition_rows: list[dict[str, str]],
    choice_rows: list[dict[str, str]],
    skeleton_rows: list[dict[str, str]],
    dialogue_rows: list[dict[str, str]],
    body_rows: list[dict[str, str]],
    source_to_client_rows: list[dict[str, str]],
    marker_condition_rows: list[dict[str, str]],
    client_signal_rows: list[dict[str, str]],
    content_spawn_atlas_rows: list[dict[str, str]],
    objective_crosscheck_rows: list[dict[str, str]],
) -> list[dict[str, str]]:
    counts = defaultdict(lambda: defaultdict(int))
    for row in delegates:
        counts[row["code"]]["delegate_count"] += 1
    for row in methods:
        counts[row["code"]]["client_method_count"] += 1
        counts[row["code"]]["client_text_row_count"] += int(row["text_row_count"] or 0)
    for row in spawns:
        counts[row["code"]]["content_spawn_count"] += 1
    for row in replay_rows:
        counts[row["code"]]["replay_row_count"] += 1
    for row in actor_rows:
        counts[row["code"]]["actor_binding_count"] += 1
    for row in dat_marker_rows:
        counts[row["code"]]["dat_marker_count"] += 1
    for row in local_marker_rows:
        counts[row["code"]]["local_marker_count"] += 1
    for row in local_constant_rows:
        counts[row["code"]]["local_constant_count"] += 1
    for row in delegate_push_rows:
        counts[row["code"]]["delegate_push_call_count"] += 1
    for row in lifecycle_rows:
        counts[row["code"]]["lifecycle_action_count"] += 1
    for row in reward_rows:
        counts[row["code"]]["reward_row_count"] += 1
    for row in flag_rows:
        counts[row["code"]]["flag_usage_count"] += 1
        if row.get("operation") in {"SetFlag", "UnsetFlag"}:
            counts[row["code"]]["flag_write_count"] += 1
        elif row.get("operation") == "GetFlag":
            counts[row["code"]]["flag_read_count"] += 1
    for row in counter_rows:
        counts[row["code"]]["counter_usage_count"] += 1
    for row in source_delegate_rows:
        counts[row["code"]]["source_delegate_call_count"] += 1
    for row in transition_rows:
        counts[row["code"]]["transition_action_count"] += 1
    for row in choice_rows:
        counts[row["code"]]["choice_gate_count"] += 1
    for row in skeleton_rows:
        counts[row["code"]]["function_skeleton_count"] += 1
    for row in dialogue_rows:
        counts[row["code"]]["client_dialogue_row_count"] += 1
    for row in body_rows:
        counts[row["code"]]["client_body_extract_count"] += 1
    for row in source_to_client_rows:
        counts[row["code"]]["source_to_client_method_count"] += 1
    for row in marker_condition_rows:
        counts[row["code"]]["marker_condition_count"] += 1
    for row in client_signal_rows:
        counts[row["code"]]["client_signal_count"] += 1
    for row in content_spawn_atlas_rows:
        counts[row["code"]]["content_spawn_atlas_count"] += 1
    for row in objective_crosscheck_rows:
        counts[row["code"]]["objective_crosscheck_count"] += 1

    rows = []
    for code, quest in QUESTS.items():
        rows.append(
            {
                "code": code,
                "quest_id": quest["quest_id"],
                "quest_name": quest["quest_name"],
                "local_script": quest["local_script"],
                "content_script": quest["content_script"],
                "director_script": quest["director_script"],
                "delegate_count": str(counts[code]["delegate_count"]),
                "client_method_count": str(counts[code]["client_method_count"]),
                "client_text_row_count": str(counts[code]["client_text_row_count"]),
                "content_spawn_count": str(counts[code]["content_spawn_count"]),
                "replay_row_count": str(counts[code]["replay_row_count"]),
                "actor_binding_count": str(counts[code]["actor_binding_count"]),
                "dat_marker_count": str(counts[code]["dat_marker_count"]),
                "local_marker_count": str(counts[code]["local_marker_count"]),
                "local_constant_count": str(counts[code]["local_constant_count"]),
                "delegate_push_call_count": str(counts[code]["delegate_push_call_count"]),
                "lifecycle_action_count": str(counts[code]["lifecycle_action_count"]),
                "reward_row_count": str(counts[code]["reward_row_count"]),
                "flag_usage_count": str(counts[code]["flag_usage_count"]),
                "flag_read_count": str(counts[code]["flag_read_count"]),
                "flag_write_count": str(counts[code]["flag_write_count"]),
                "counter_usage_count": str(counts[code]["counter_usage_count"]),
                "source_delegate_call_count": str(counts[code]["source_delegate_call_count"]),
                "transition_action_count": str(counts[code]["transition_action_count"]),
                "choice_gate_count": str(counts[code]["choice_gate_count"]),
                "function_skeleton_count": str(counts[code]["function_skeleton_count"]),
                "client_dialogue_row_count": str(counts[code]["client_dialogue_row_count"]),
                "client_body_extract_count": str(counts[code]["client_body_extract_count"]),
                "source_to_client_method_count": str(counts[code]["source_to_client_method_count"]),
                "marker_condition_count": str(counts[code]["marker_condition_count"]),
                "client_signal_count": str(counts[code]["client_signal_count"]),
                "content_spawn_atlas_count": str(counts[code]["content_spawn_atlas_count"]),
                "objective_crosscheck_count": str(counts[code]["objective_crosscheck_count"]),
                "implementation_read": "bespoke_content_strict_kill_route_ready_probe_rewards",
            }
        )
    return rows


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)

    methods = build_client_method_summary()
    dialogue_rows = build_client_dialogue_rows()
    client_signal_rows = build_client_signal_rows()
    body_rows = build_client_method_body_extracts()
    delegates = build_server_delegate_surface()
    replay_rows = build_replay_rows()
    spawns = parse_content_spawns()
    content_spawn_atlas_rows = build_content_spawn_atlas_rows()
    objective_crosscheck_rows = build_objective_crosscheck_rows(content_spawn_atlas_rows)
    actor_rows = build_actor_surface_rows()
    dat_marker_rows = build_dat_marker_rows()
    local_marker_rows = build_local_marker_constants()
    local_constant_rows = build_local_constant_rows()
    delegate_push_rows = build_delegate_push_call_rows()
    lifecycle_rows = build_lifecycle_action_rows()
    reward_rows = build_reward_rows()
    flag_rows = build_flag_usage_rows()
    counter_rows = build_counter_usage_rows()
    source_delegate_rows = build_source_delegate_call_rows()
    transition_rows = build_transition_action_rows()
    choice_rows = build_choice_gate_rows()
    source_to_client_rows = build_source_to_client_method_rows(source_delegate_rows, methods, body_rows)
    marker_condition_rows = build_marker_condition_rows(dat_marker_rows, local_marker_rows)
    skeleton_rows = build_function_skeleton_rows(source_delegate_rows, flag_rows, counter_rows, transition_rows)
    fight_routes = build_fight_route_rows()
    sequence_flows = build_sequence_flow_rows()
    probes = build_probe_checklist()
    probe_commands = build_probe_commands()
    summary = build_summary(
        delegates,
        methods,
        spawns,
        replay_rows,
        actor_rows,
        dat_marker_rows,
        local_marker_rows,
        local_constant_rows,
        delegate_push_rows,
        lifecycle_rows,
        reward_rows,
        flag_rows,
        counter_rows,
        source_delegate_rows,
        transition_rows,
        choice_rows,
        skeleton_rows,
        dialogue_rows,
        body_rows,
        source_to_client_rows,
        marker_condition_rows,
        client_signal_rows,
        content_spawn_atlas_rows,
        objective_crosscheck_rows,
    )

    write_csv(
        OUT / "quest_summary.csv",
        summary,
        [
            "code",
            "quest_id",
            "quest_name",
            "local_script",
            "content_script",
            "director_script",
            "delegate_count",
            "client_method_count",
            "client_text_row_count",
            "content_spawn_count",
            "replay_row_count",
            "actor_binding_count",
            "dat_marker_count",
            "local_marker_count",
            "local_constant_count",
            "delegate_push_call_count",
            "lifecycle_action_count",
            "reward_row_count",
            "flag_usage_count",
            "flag_read_count",
            "flag_write_count",
            "counter_usage_count",
            "source_delegate_call_count",
            "transition_action_count",
            "choice_gate_count",
            "function_skeleton_count",
            "client_dialogue_row_count",
            "client_body_extract_count",
            "source_to_client_method_count",
            "marker_condition_count",
            "client_signal_count",
            "content_spawn_atlas_count",
            "objective_crosscheck_count",
            "implementation_read",
        ],
    )
    write_csv(
        OUT / "fight_route_matrix.csv",
        fight_routes,
        [
            "code",
            "quest_id",
            "quest_name",
            "content_area",
            "content_script",
            "director_script",
            "objective_actor",
            "objective_label",
            "objective_count",
            "attention_packet",
            "post_fight_method",
            "return_zone",
            "return_private_area",
            "return_private_area_type",
            "return_pos",
            "handoff",
            "lifecycle_status",
            "route_status",
            "actor_materialization_statuses",
            "next_fix",
            "evidence_refs",
        ],
    )
    write_csv(
        OUT / "content_spawn_rows.csv",
        spawns,
        [
            "code",
            "quest_id",
            "quest_name",
            "content_script",
            "line",
            "role",
            "actor_class_id",
            "label",
            "x",
            "y",
            "z",
            "rot",
            "extra_arg",
            "line_text",
        ],
    )
    write_csv(
        OUT / "content_spawn_atlas_rows.csv",
        content_spawn_atlas_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "spawn_kind",
            "actor_expr",
            "actor_class_id",
            "actor_class_path",
            "display_name_id",
            "unique_name",
            "x",
            "y",
            "z",
            "rotation",
            "raw_args",
        ],
    )
    write_csv(
        OUT / "objective_crosscheck_rows.csv",
        objective_crosscheck_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "objective_actor",
            "objective_label",
            "objective_count",
            "script_enemy_spawn_count",
            "script_enemy_unique_names",
            "script_enemy_actor_paths",
            "script_enemy_display_name_ids",
            "all_script_enemy_actor_ids",
            "normalized_bnpc_objective_rows",
            "ambient_spawn_summary_rows",
            "materialization_read",
            "probe_read",
        ],
    )
    write_csv(
        OUT / "actor_surface_rows.csv",
        actor_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "sequence_expr",
            "actor_expr",
            "actor_class_id",
            "actor_class_path",
            "display_name_id",
            "flag_expr",
            "raw_args",
        ],
    )
    write_csv(
        OUT / "dat_marker_rows.csv",
        dat_marker_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "sequence",
            "marker_constant",
            "marker_id",
            "slot",
            "x",
            "z",
            "map_group",
            "map_id",
            "radius",
            "marker_class",
            "visible",
            "source",
            "confidence",
        ],
    )
    write_csv(
        OUT / "local_marker_constants.csv",
        local_marker_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "local_script",
            "line",
            "marker_constant",
            "marker_id",
            "note",
            "line_text",
        ],
    )
    write_csv(
        OUT / "local_constant_rows.csv",
        local_constant_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "constant",
            "value",
            "actor_class_path",
            "display_name_id",
            "constant_kind",
        ],
    )
    write_csv(
        OUT / "delegate_push_call_rows.csv",
        delegate_push_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "file",
            "line",
            "function",
            "sequence_expr",
            "call_kind",
            "target_expr",
            "target_kind",
            "target_code",
            "event_method",
            "extra_args",
            "extra_arg_count",
            "matched_recovered_row",
            "match_kind",
            "recovered_event_method",
            "active_owner_kind",
            "active_event_name_expected",
            "active_event_type_expected",
            "active_event_type_source",
            "wait_recipe",
            "end_event_policy",
            "owner_visibility_precondition",
            "scene_keys",
            "fade_mode",
            "cutReplay_rows",
            "risk_notes",
            "raw_call",
        ],
    )
    write_csv(
        OUT / "lifecycle_action_rows.csv",
        lifecycle_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "sequence_expr",
            "action",
            "args",
            "raw_call",
        ],
    )
    write_csv(
        OUT / "reward_rows.csv",
        reward_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "sort_order",
            "reward_type",
            "reward_id",
            "quantity",
            "class_job_id",
            "source",
            "auto_grant",
            "confidence",
            "duplicate_grant_risk",
            "notes",
        ],
    )
    write_csv(
        OUT / "flag_usage_rows.csv",
        flag_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "operation",
            "owner_expr",
            "flag_expr",
            "flag_value",
            "line_text",
        ],
    )
    write_csv(
        OUT / "counter_usage_rows.csv",
        counter_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "operation",
            "owner_expr",
            "counter_expr",
            "counter_value",
            "args",
            "line_text",
        ],
    )
    write_csv(
        OUT / "source_delegate_call_rows.csv",
        source_delegate_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "event_method",
            "line_text",
        ],
    )
    write_csv(
        OUT / "transition_action_rows.csv",
        transition_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "action",
            "args",
            "line_text",
        ],
    )
    write_csv(
        OUT / "choice_gate_rows.csv",
        choice_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "choice_var",
            "event_method",
            "operator",
            "expected_value",
            "related_choice_line",
            "line_text",
        ],
    )
    write_csv(
        OUT / "function_skeleton_rows.csv",
        skeleton_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "function",
            "start_line",
            "end_line",
            "event_method_count",
            "event_methods",
            "flags_read",
            "flags_written",
            "counters_touched",
            "transition_actions",
            "ordered_anchor_sample",
        ],
    )
    write_csv(
        OUT / "server_delegate_surface.csv",
        delegates,
        [
            "code",
            "quest_id",
            "quest_name",
            "server_file",
            "line",
            "function",
            "event_method",
            "call_kind",
            "raw_client_method_present",
            "raw_client_function_start_line",
            "client_method_context_count",
            "client_timeline_step_count",
            "client_joined_text_rows",
            "client_direct_scene_keys",
            "client_first_text_en",
            "client_ordered_step_sample",
            "line_text",
        ],
    )
    write_csv(
        OUT / "client_dialogue_rows.csv",
        dialogue_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "method",
            "function_start_line",
            "call",
            "scene_key",
            "text_row_id",
            "text_en",
            "line_text",
            "method_uid",
        ],
    )
    write_csv(
        OUT / "client_signal_rows.csv",
        client_signal_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "method",
            "function_start_line",
            "call_line",
            "sequence_index",
            "signal_kind",
            "call",
            "scene_key",
            "widget",
            "text_row_id",
            "text_en",
            "receiver",
            "args_preview",
            "line_text",
            "method_uid",
        ],
    )
    write_csv(
        OUT / "client_method_summary.csv",
        methods,
        [
            "code",
            "quest_id",
            "quest_name",
            "method",
            "function_start_line",
            "raw_method_present",
            "step_count",
            "text_row_count",
            "scene_keys",
            "widgets",
            "first_text_en",
            "text_ids_sample",
            "calls_sample",
            "ordered_step_sample",
            "method_uid",
        ],
    )
    write_csv(
        OUT / "client_method_body_extracts.csv",
        body_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "client_script",
            "method",
            "start_line",
            "end_line",
            "body_line_count",
            "scene_keys",
            "direct_say_ids",
            "public_inform_ids",
            "tutorial_judge_wrappers",
            "desktop_widget_ops",
            "body_excerpt",
        ],
    )
    write_csv(
        OUT / "source_to_client_method_rows.csv",
        source_to_client_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "function",
            "event_method",
            "raw_method_present",
            "client_start_line",
            "client_end_line",
            "body_line_count",
            "scene_keys",
            "text_row_count",
            "text_ids_sample",
            "first_text_en",
            "calls_sample",
            "tutorial_judge_wrappers",
            "desktop_widget_ops",
            "body_excerpt",
        ],
    )
    write_csv(
        OUT / "marker_condition_rows.csv",
        marker_condition_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "source_file",
            "line",
            "marker_constant",
            "marker_id",
            "condition_context",
            "dat_sequence_values",
            "dat_position_sample",
            "dat_row_count",
            "line_text",
        ],
    )
    write_csv(
        OUT / "sequence_flow_rows.csv",
        sequence_flows,
        [
            "code",
            "quest_id",
            "quest_name",
            "sequence",
            "phase",
            "server_anchor",
            "client_anchor",
            "expected_state",
        ],
    )
    write_csv(
        OUT / "replay_scene_rows.csv",
        replay_rows,
        [
            "code",
            "quest_id",
            "quest_name",
            "scene_key",
            "sample_key",
            "functions",
            "fade_modes",
            "classifications",
            "replay_id",
            "unlock_kind",
            "placeholder_summary",
        ],
    )
    write_csv(
        OUT / "runtime_probe_checklist.csv",
        probes,
        [
            "code",
            "quest_id",
            "quest_name",
            "check_order",
            "check",
            "expected_anchor",
        ],
    )
    write_csv(
        OUT / "probe_commands.csv",
        probe_commands,
        [
            "code",
            "quest_id",
            "quest_name",
            "command_order",
            "phase",
            "command",
            "repeat_count",
            "purpose",
            "expected_anchor",
        ],
    )
    write_readme(summary)
    write_quest_dossiers(
        summary,
        fight_routes,
        spawns,
        reward_rows,
        marker_condition_rows,
        objective_crosscheck_rows,
        choice_rows,
        source_to_client_rows,
        transition_rows,
        probe_commands,
    )
    print(f"Wrote {OUT}")


if __name__ == "__main__":
    main()
