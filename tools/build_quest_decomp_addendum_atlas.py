#!/usr/bin/env python3
"""Build a quest decomp addendum atlas.

This pass captures newly identified quest additions and data-enrichment leads
without treating them as runtime-proven gameplay. The key distinction is:

- hidden/no-offer loaders are safe to add for decomp probing
- private mob type candidates are implementation notes, not spawn/reward enablement
- missing local script rows stay disabled until objectives, owners, and rewards are proven
"""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path
from typing import Iterable


DEFAULT_OUTPUT = Path("outputs/quest-decomp-addendum-atlas-20260630")
DEFAULT_DOC = Path("docs/quest_decomp_addendum_atlas_2026-06-30.md")

QUEST_DIMENSION = Path("outputs/quest-master-gap-atlas-20260630/quest_dimension.csv")
CUTSCENE_ARGS = Path("outputs/quest-cutscene-argument-atlas-20260630/cutscene_argument_requirements.csv")
OWNER_SEEDS = Path("outputs/quest-runtime-proof-gap-atlas-20260630/blocked_owner_candidate_seed_rows.csv")
OWNER_QUEUE = Path("outputs/quest-runtime-proof-gap-atlas-20260630/blocked_owner_resolution_decomp_queue.csv")
BNPC_CANDIDATES = Path("outputs/quest-bnpc-materialization-candidate-atlas-20260630/bnpc_materialization_candidates.csv")
BNPC_SPAWN_SUMMARY = Path("outputs/quest-bnpc-spawns-20260620/quest_bnpc_spawn_summary.csv")
SQB_FIRST_SLICE = Path("outputs/quest-sqb-adapter-atlas-20260630/sqb_first_slice_queue.csv")
SAFETY_QUEUE = Path("outputs/quest-safe-enablement-atlas-20260630/quest_enablement_safety_queue.csv")
SAFE_ALIAS_PATCH_QUEUE = Path("outputs/quest-cutscene-argument-atlas-20260630/safe_alias_patch_queue.csv")


CLASS_TAIL_CODES = {"bsm400", "cul400", "exc400", "fsh400"}
NEW_SAFE_CLASS_TAIL_CODES = {"bsm400", "exc400", "fsh400"}
ACN_REFERENCE_CODES = {"acn200", "acn300", "acn306", "acn400", "acn500", "acn506"}
STATIC_REFERENCE_ONLY_CODES = {"man502", "man504"}
HELPER_BNPC_SHORTLIST = {"com0g1", "com0l1", "com0u1", "com0u4", "etc1g2", "etc1g5", "etc1l0", "etc1l6"}
HIGH_CONFIDENCE_EXISTING_BNPC_CODES = {"etc1g4", "etc1u1", "etc1u5", "etc1u6", "etc2l0", "etc2u2", "wld0g1", "wld0g4"}
SAFE_ALIAS_FOCUS_CODES = {"com0g4", "com0g6", "com0l4", "com0l6", "com0u4"}


REWARD_DISPLAY_SYNC_CANDIDATES = [
    {
        "priority": 120,
        "code": "etc1l8",
        "quest_id": "110641",
        "quest_name": "Food for Thought",
        "file_path": "Data\\scripts\\quests\\etc\\etc1l8.lua",
        "line_hint": "124",
        "old_display_exp": "200",
        "expected_display_exp": "1120",
        "reward_source": "wiki",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:172",
    },
    {
        "priority": 118,
        "code": "etc303",
        "quest_id": "110810",
        "quest_name": "Call of Booty",
        "file_path": "Data\\scripts\\quests\\etc\\etc303.lua",
        "line_hint": "60",
        "old_display_exp": "200",
        "expected_display_exp": "500",
        "reward_source": "dat-new",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:326",
    },
    {
        "priority": 118,
        "code": "etc3g3",
        "quest_id": "110737",
        "quest_name": "A Slippery Stone",
        "file_path": "Data\\scripts\\quests\\etc\\etc3g3.lua",
        "line_hint": "79",
        "old_display_exp": "200",
        "expected_display_exp": "500",
        "reward_source": "dat-new",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:285",
    },
    {
        "priority": 118,
        "code": "etc3l3",
        "quest_id": "110746",
        "quest_name": "What a Pirate Wants",
        "file_path": "Data\\scripts\\quests\\etc\\etc3l3.lua",
        "line_hint": "79",
        "old_display_exp": "200",
        "expected_display_exp": "500",
        "reward_source": "dat-new",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:292",
    },
    {
        "priority": 118,
        "code": "etc3u3",
        "quest_id": "110728",
        "quest_name": "Cutthroat Prices",
        "file_path": "Data\\scripts\\quests\\etc\\etc3u3.lua",
        "line_hint": "79",
        "old_display_exp": "200",
        "expected_display_exp": "500",
        "reward_source": "dat-new",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:275",
    },
    {
        "priority": 116,
        "code": "etc5l2",
        "quest_id": "110840",
        "quest_name": "Mysteries of the Red Moon",
        "file_path": "Data\\scripts\\quests\\etc\\etc5l2.lua",
        "line_hint": "109",
        "old_display_exp": "1000",
        "expected_display_exp": "1120",
        "reward_source": "wiki",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:337",
    },
    {
        "priority": 118,
        "code": "wld0g2",
        "quest_id": "110763",
        "quest_name": "Hearing Confession",
        "file_path": "Data\\scripts\\quests\\wld\\wld0g2.lua",
        "line_hint": "131",
        "old_display_exp": "200",
        "expected_display_exp": "300",
        "reward_source": "dat-new",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:306",
    },
    {
        "priority": 118,
        "code": "wld0l2",
        "quest_id": "110772",
        "quest_name": "Letting Out Orion's Belt",
        "file_path": "Data\\scripts\\quests\\wld\\wld0l2.lua",
        "line_hint": "131",
        "old_display_exp": "200",
        "expected_display_exp": "300",
        "reward_source": "dat-new",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:317",
    },
    {
        "priority": 116,
        "code": "wld0l3",
        "quest_id": "110773",
        "quest_name": "Sour Grapes",
        "file_path": "Data\\scripts\\quests\\wld\\wld0l3.lua",
        "line_hint": "74",
        "old_display_exp": "200",
        "expected_display_exp": "841",
        "reward_source": "wiki",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:319",
    },
    {
        "priority": 116,
        "code": "wld0l4",
        "quest_id": "110774",
        "quest_name": "Sniffing Out a Profit",
        "file_path": "Data\\scripts\\quests\\wld\\wld0l4.lua",
        "line_hint": "74",
        "old_display_exp": "200",
        "expected_display_exp": "3100",
        "reward_source": "wiki",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:321",
    },
    {
        "priority": 118,
        "code": "wld0u1",
        "quest_id": "110753",
        "quest_name": "Of Archons and Muses",
        "file_path": "Data\\scripts\\quests\\wld\\wld0u1.lua",
        "line_hint": "74",
        "old_display_exp": "200",
        "expected_display_exp": "300",
        "reward_source": "dat-new",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:294",
    },
    {
        "priority": 116,
        "code": "wld0u3",
        "quest_id": "110755",
        "quest_name": "Secrets Unearthed",
        "file_path": "Data\\scripts\\quests\\wld\\wld0u3.lua",
        "line_hint": "74",
        "old_display_exp": "200",
        "expected_display_exp": "960",
        "reward_source": "wiki",
        "reward_join_ref": "outputs\\quest-master-gap-atlas-20260630\\quest_reward_join.csv:298",
    },
]


JOB_METADATA_ENRICHMENT_NOTES = [
    {"code": "war0j3", "job": "WAR", "level": "40", "scene_anchor": "war0j310", "director": "questdirectorwar0j301", "action_id": "27188", "metadata_status": "markers/action present; SQB/director exists", "safe_policy": "metadata/TODO only; do not wire SQB or rewards until strict kill route and cleanup are proven"},
    {"code": "mnk0j3", "job": "MNK", "level": "40", "scene_anchor": "mnk0j310", "director": "", "action_id": "27109", "metadata_status": "action present; recovered clear and ability widget surface", "safe_policy": "metadata/TODO only; do not infer markers from cutReplay or recovered scene ids"},
    {"code": "blm0j3", "job": "BLM", "level": "40", "scene_anchor": "", "director": "questdirectorblm0j301", "action_id": "27318", "metadata_status": "dialogue/job ability surface recovered", "safe_policy": "metadata/TODO only; marker route and objective flow still missing"},
    {"code": "whm0j3", "job": "WHM", "level": "40", "scene_anchor": "", "director": "", "action_id": "27357", "metadata_status": "dialogue/job ability surface recovered", "safe_policy": "metadata/TODO only; marker route and objective flow still missing"},
    {"code": "pld0j3", "job": "PLD", "level": "40", "scene_anchor": "", "director": "", "action_id": "27149", "metadata_status": "dialogue/job ability surface recovered", "safe_policy": "metadata/TODO only; marker route and objective flow still missing"},
    {"code": "brd0j3", "job": "BRD", "level": "40", "scene_anchor": "", "director": "", "action_id": "27238", "metadata_status": "markers/action present; recovered dialogue surface", "safe_policy": "metadata/TODO only; do not infer extra markers"},
    {"code": "drg0j3", "job": "DRG", "level": "40", "scene_anchor": "", "director": "", "action_id": "27267", "metadata_status": "dialogue/job ability surface recovered", "safe_policy": "metadata/TODO only; marker route and objective flow still missing"},
]


NORMALIZED_SCHEMA_RECOMMENDATIONS = [
    {"table_name": "quest_rewards.csv", "columns": "quest_id,code,sort_order,reward_type,reward_id,quantity,class_job_id,source,auto_grant,confidence,duplicate_grant_risk,notes", "why": "separates reward display from auto-granted CompleteQuest data"},
    {"table_name": "quest_markers.csv", "columns": "quest_id,code,sequence,marker_constant,marker_id,slot,x,z,map_group,map_id,radius,marker_class,visible,source,confidence", "why": "keeps DAT marker joins auditable without rewriting Lua markers blindly"},
    {"table_name": "quest_actor_surfaces.csv", "columns": "quest_id,code,sequence,actor_role,actor_constant,actor_class_id,actor_class_path,display_name_id,quest_flag,source_file,source_line,confidence,gap_status", "why": "tracks ENPC/object actors separately from owner proof"},
    {"table_name": "quest_bnpc_objectives.csv", "columns": "quest_id,code,sequence,objective_constant,actor_class_id,actor_class_path,objective_item_id,objective_count,bnpc_id,display_name,min_level,max_level,materialization_status,confidence,next_action", "why": "keeps objective identity distinct from spawn and kill-route proof"},
    {"table_name": "quest_spawn_points.csv", "columns": "quest_id,code,actor_class_id,bnpc_id,spawn_surface,spawn_id,unique_id,zone_id,private_area,x,y,z,rot,source,confidence,needs_capture", "why": "prevents ambient spawn rows from being mixed with private SQB materialization candidates"},
]


SAFE_HIDDEN_CLASS_ADDITIONS = {
    "bsm400": {
        "priority": 108,
        "config_key": "Bsm400",
        "class_id": "30",
        "actor_id": "1000144",
        "first_marker_id": "11032301",
        "owner_probe_method": "processEventBodenolfStart",
        "script_stub_path": "Data\\scripts\\quests\\bsm\\bsm400.lua",
        "local_change_status": "added_hidden_no_offer_loader_this_pass",
        "safety_policy": "hidden/no-offer; decomp probe only; no objective, completion, reward, or scene push enablement",
        "implementation_blockers": "after-warp ordering, crafting or turn-in objectives, route owner, rewards, and completion path are unproven",
    },
    "exc400": {
        "priority": 106,
        "config_key": "Exc400",
        "class_id": "4",
        "actor_id": "1000003",
        "first_marker_id": "11010301",
        "owner_probe_method": "processEventWaekbyrtStart",
        "script_stub_path": "Data\\scripts\\quests\\exc\\exc400.lua",
        "local_change_status": "added_hidden_no_offer_loader_this_pass",
        "safety_policy": "hidden/no-offer; decomp probe only; text/fade route may be weak; no progression enablement",
        "implementation_blockers": "no explicit startNQCutScene rows in recovered route, owner route, objectives, rewards, and completion path are unproven",
    },
    "fsh400": {
        "priority": 109,
        "config_key": "Fsh400",
        "class_id": "41",
        "actor_id": "1000153",
        "first_marker_id": "11050301",
        "owner_probe_method": "processEventNnmulikaStart",
        "script_stub_path": "Data\\scripts\\quests\\fsh\\fsh400.lua",
        "local_change_status": "added_hidden_no_offer_loader_this_pass",
        "safety_policy": "hidden/no-offer; decomp probe only; no objective, completion, reward, or scene push enablement",
        "implementation_blockers": "title, secondary actors, fishing objective, route owner, rewards, and completion path are unproven",
    },
    "cul400": {
        "priority": 90,
        "config_key": "Cul400",
        "class_id": "36",
        "actor_id": "1100450",
        "first_marker_id": "11044301",
        "owner_probe_method": "processEventCharlysStart",
        "script_stub_path": "Data\\scripts\\quests\\cul\\cul400.lua",
        "local_change_status": "existing_hidden_no_offer_loader_reference",
        "safety_policy": "hidden/no-offer; existing reference probe; no progression enablement",
        "implementation_blockers": "owner route, objectives, rewards, markers, and completion path are unproven",
    },
}


HELPER_FINDINGS = [
    {
        "helper": "Huygens",
        "focus": "new quest/data candidates",
        "finding": "Safe additions are hidden/no-offer loaders only. Private BNPC/SQB mob rows are data candidates only and must not enable ambient spawns, kill success, completion, or rewards.",
        "applied_to": "safe_hidden_class_tail_additions; private_bnpc_materialization_candidate_addendum; new_quest_candidate_queue",
        "candidate_codes": "bsm400; exc400; fsh400; acn200; acn300; acn306; acn400; acn500; acn506; com0g1; com0l1; com0u1; com0u4; etc1g2; etc1g5; etc1l0; etc1l6; man502; man504",
        "live_proof_still_needed": "natural owner EventStart, cutscene args, after-warp lifetime, SQB adapter launch, strict kill callback, cleanup, and reward-lock proof",
    },
    {
        "helper": "Curie",
        "focus": "class/job quest tails",
        "finding": "Bsm400, Exc400, and Fsh400 should be wrappers only. Level-40 job rows are useful metadata/TODO enrichments, not behavior wiring.",
        "applied_to": "safe_hidden_class_tail_additions; job_metadata_enrichment_notes",
        "candidate_codes": "bsm400; exc400; fsh400; cul400; war0j3; mnk0j3; blm0j3; whm0j3; pld0j3; brd0j3; drg0j3; wvr306",
        "live_proof_still_needed": "job objective route, SQB target data, strict kill route, return flow, cleanup, and reward silence",
    },
    {
        "helper": "Harvey",
        "focus": "structured rewards, markers, actors, BNPC joins",
        "finding": "Quest dimension joins are trustworthy; existing ambient BNPC rows can be surfaced separately from missing materialization candidates. Use small normalized CSVs for future quest data.",
        "applied_to": "existing_bnpc_spawn_enrichment_candidates; normalized_quest_data_schema_recommendations",
        "candidate_codes": "etc1g4; etc1u1; etc1u5; etc1u6; etc2l0; etc2u2; wld0g1; wld0g4; com0g1; com0l1; com0u1; com0u4; com0u6",
        "live_proof_still_needed": "spawn route ownership, callback identity, duplicate reward guard, and runtime capture before broad enablement",
    },
    {
        "helper": "Franklin",
        "focus": "existing quest enrichments",
        "finding": "Low-risk patches are reward-window display EXP syncs only. Cutscene method swaps are promising but should be smoke-tested per route.",
        "applied_to": "reward_display_sync_candidates; safe_cutscene_alias_patch_candidates",
        "candidate_codes": "etc1l8; etc303; etc3g3; etc3l3; etc3u3; etc5l2; wld0g2; wld0l2; wld0l3; wld0l4; wld0u1; wld0u3; com0g4; com0g6; com0l4; com0l6; com0u4",
        "live_proof_still_needed": "route smoke for alias swaps; ensure reward widget display stays aligned with normalized CompleteQuest rewards",
    },
]


def csv_read(path: Path) -> list[dict[str, str]]:
    if not path.exists():
        return []
    with path.open(newline="", encoding="utf-8-sig", errors="replace") as handle:
        return list(csv.DictReader(handle))


def csv_write(path: Path, rows: Iterable[dict[str, object]], fields: list[str]) -> int:
    rows = list(rows)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})
    return len(rows)


def norm_code(value: object) -> str:
    return str(value or "").strip().lower()


def as_int(value: object) -> int:
    try:
        return int(str(value or "0").strip() or "0")
    except ValueError:
        return 0


def csv_join(values: Iterable[object], limit: int | None = None) -> str:
    out = []
    seen = set()
    for value in values:
        text = str(value or "").strip()
        if not text or text in seen:
            continue
        seen.add(text)
        out.append(text)
    if limit is not None:
        out = out[:limit]
    return "; ".join(out)


def by_code(rows: list[dict[str, str]], key: str = "code") -> dict[str, dict[str, str]]:
    return {norm_code(row.get(key, "")): row for row in rows if norm_code(row.get(key, ""))}


def index_by_code(rows: list[dict[str, str]], key: str = "code") -> dict[str, list[dict[str, str]]]:
    out: dict[str, list[dict[str, str]]] = {}
    for row in rows:
        code = norm_code(row.get(key, ""))
        if code:
            out.setdefault(code, []).append(row)
    return out


def local_stub_exists(path_value: str) -> str:
    if not path_value:
        return ""
    return "yes" if Path(path_value.replace("\\", "/")).exists() else "no"


def scene_summary(rows: list[dict[str, str]]) -> tuple[str, str, str, str]:
    scene_keys = csv_join((row.get("scene_keys", "") for row in rows if row.get("scene_keys", "")))
    methods = csv_join((row.get("event_method", "") for row in rows), limit=18)
    patch_classes = csv_join((row.get("patch_class", "") for row in rows if row.get("patch_class", "")))
    blockers = csv_join((row.get("blocker_notes", "") for row in rows if row.get("blocker_notes", "")), limit=3)
    return scene_keys, methods, patch_classes, blockers


def safe_policy_for_missing(row: dict[str, str]) -> tuple[int, str, str, str]:
    code = norm_code(row.get("code", ""))
    category = row.get("category", "")
    gap_score = as_int(row.get("gap_score", ""))
    base_priority = min(gap_score, 160)

    if code in NEW_SAFE_CLASS_TAIL_CODES:
        return (
            220 + gap_score,
            "hidden_no_offer_loader_added",
            "keep hidden/no-offer; use only for owner/cutscene probes",
            "objectives, rewards, route owner, and completion path unproven",
        )
    if code in CLASS_TAIL_CODES:
        return (
            190 + gap_score,
            "hidden_no_offer_loader_reference",
            "keep hidden/no-offer until route and objectives are proven",
            "recovered scene rows exist, but runtime owner/cutscene args are not proven",
        )
    if code in ACN_REFERENCE_CODES:
        return (
            175 + gap_score,
            "reference_only_disabled_acn_scaffold",
            "add only disabled/no-offer reference loaders if ACN coverage is needed",
            "recovered scripts are initText-heavy; local ACN template, objectives, rewards, and titles are missing",
        )
    if code in STATIC_REFERENCE_ONLY_CODES:
        return (
            70 + gap_score,
            "reference_only_static_loader",
            "do not add as gameplay; use only as static text/decomp reference",
            "initText-only style row; no director, quest route, objective, or reward proof",
        )
    if category == "class":
        return (
            145 + gap_score,
            "disabled_class_scaffold_candidate",
            "generate disabled/no-offer scaffold only after class owner and objective route are inspected",
            "class objectives, rewards, and owner route need proof",
        )
    if row.get("sqb_director", "") or row.get("bnpc_rows", ""):
        return (
            135 + base_priority,
            "fight_or_bnpc_data_candidate",
            "use data-only probes; do not enable kill completion or rewards",
            "materialization, kill callback, cleanup, and reward lock are unproven",
        )
    if as_int(row.get("content_launch_rows", "")) > 0 or row.get("content_launches", ""):
        return (
            125 + base_priority,
            "instance_or_content_probe_candidate",
            "keep log-only until instance lifecycle and after-warp event lifetime are proven",
            "director lifecycle, scene=none handling, cleanup, and reward locks are unproven",
        )
    return (
        100 + base_priority,
        "disabled_no_offer_scaffold_candidate",
        "add only disabled/no-offer scaffolding after owner/objective inspection",
        "missing local script; route owner, objectives, cutscenes, and rewards need proof",
    )


def build_safe_hidden_class_tail_rows(
    dimension_by_code: dict[str, dict[str, str]], cutscenes_by_code: dict[str, list[dict[str, str]]]
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for code, config in SAFE_HIDDEN_CLASS_ADDITIONS.items():
        dim = dimension_by_code.get(code, {})
        cutscene_rows = cutscenes_by_code.get(code, [])
        scene_keys, methods, patch_classes, blockers = scene_summary(cutscene_rows)
        rows.append(
            {
                "priority": config["priority"],
                "code": code,
                "quest_id": dim.get("quest_id", ""),
                "quest_name": dim.get("quest_name", ""),
                "category": dim.get("category", ""),
                "config_key": config["config_key"],
                "class_id": config["class_id"],
                "actor_id": config["actor_id"],
                "first_marker_id": config["first_marker_id"],
                "owner_probe_method": config["owner_probe_method"],
                "script_stub_path": config["script_stub_path"],
                "script_stub_exists_now": local_stub_exists(config["script_stub_path"]),
                "local_change_status": config["local_change_status"],
                "master_local_script_path_before_pass": dim.get("local_script_path", ""),
                "recovered_script_path": dim.get("recovered_script_path", ""),
                "marker_count": dim.get("marker_count", ""),
                "reward_count": dim.get("reward_count", ""),
                "recovered_scene_keys": scene_keys,
                "recovered_event_methods": methods,
                "patch_classes": patch_classes,
                "safety_policy": config["safety_policy"],
                "implementation_blockers": csv_join([config["implementation_blockers"], blockers], limit=2),
                "recommended_next_step": "capture natural EventStart owner/event tuple, then probe cutscene args without completion or rewards",
                "evidence_refs": csv_join(
                    [
                        dim.get("recovered_script_path", ""),
                        "outputs\\quest-cutscene-argument-atlas-20260630\\cutscene_argument_requirements.csv",
                        "outputs\\quest-runtime-proof-gap-atlas-20260630\\blocked_owner_candidate_seed_rows.csv",
                        "Data\\scripts\\quests\\class_quest_template.lua",
                    ]
                ),
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority"]), str(row["code"])))
    return rows


def build_new_quest_candidate_rows(dimension_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for dim in dimension_rows:
        code = norm_code(dim.get("code", ""))
        missing_local = "missing_local_script" in dim.get("parity_status", "") or not dim.get("local_script_path", "")
        if not missing_local:
            continue
        priority, lane, next_step, blockers = safe_policy_for_missing(dim)
        rows.append(
            {
                "priority": priority,
                "code": code,
                "quest_id": dim.get("quest_id", ""),
                "quest_name": dim.get("quest_name", ""),
                "category": dim.get("category", ""),
                "min_level": dim.get("min_level", ""),
                "parity_status": dim.get("parity_status", ""),
                "has_recovered_script": "yes" if dim.get("recovered_script_path", "") else "no",
                "marker_count": dim.get("marker_count", ""),
                "reward_count": dim.get("reward_count", ""),
                "cutscene_event_rows": dim.get("cutscene_event_rows", ""),
                "missing_scene_push_rows": dim.get("missing_scene_push_rows", ""),
                "after_warp_rows": dim.get("after_warp_rows", ""),
                "bnpc_rows": dim.get("bnpc_rows", ""),
                "sqb_target": dim.get("sqb_target", ""),
                "content_launch_rows": dim.get("content_launch_rows", ""),
                "gap_score": dim.get("gap_score", ""),
                "enablement_risk_score": dim.get("enablement_risk_score", ""),
                "candidate_lane": lane,
                "safe_add_policy": "disabled/no-offer/log-only only",
                "recommended_next_step": next_step,
                "blockers": blockers,
                "local_script_path": dim.get("local_script_path", ""),
                "recovered_script_path": dim.get("recovered_script_path", ""),
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority"]), str(row["code"])))
    return rows


def build_current_enrichment_rows(dimension_rows: list[dict[str, str]], safety_by_code: dict[str, dict[str, str]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for dim in dimension_rows:
        code = norm_code(dim.get("code", ""))
        if not dim.get("local_script_path", ""):
            continue
        gap_score = as_int(dim.get("gap_score", ""))
        marker_gap = as_int(dim.get("local_marker_dat_gap_count", ""))
        reward_gap = as_int(dim.get("reward_gap_rows", ""))
        exp_gap = as_int(dim.get("exp_gap_rows", ""))
        missing_push = as_int(dim.get("missing_scene_push_rows", ""))
        after_warp = as_int(dim.get("after_warp_rows", ""))
        bnpc_rows = as_int(dim.get("bnpc_rows", ""))
        if gap_score <= 0 and not any([marker_gap, reward_gap, exp_gap, missing_push, after_warp, bnpc_rows]):
            continue
        safety = safety_by_code.get(code, {})
        priority = gap_score + marker_gap * 4 + reward_gap * 6 + exp_gap * 4 + missing_push * 5 + after_warp * 4 + bnpc_rows * 6
        if safety.get("log_only", ""):
            priority += 25
        if safety.get("safety_class", "") == "log_only":
            priority += 20
        blockers = csv_join(
            [
                dim.get("gap_reasons", ""),
                dim.get("enablement_risk_reasons", ""),
                safety.get("blockers", ""),
                safety.get("log_only_reason", ""),
            ],
            limit=5,
        )
        rows.append(
            {
                "priority": priority,
                "code": code,
                "quest_id": dim.get("quest_id", ""),
                "quest_name": dim.get("quest_name", ""),
                "category": dim.get("category", ""),
                "local_script_path": dim.get("local_script_path", ""),
                "gap_score": dim.get("gap_score", ""),
                "implementation_gap_score": dim.get("implementation_gap_score", ""),
                "enablement_risk_score": dim.get("enablement_risk_score", ""),
                "marker_count": dim.get("marker_count", ""),
                "local_marker_dat_gap_count": dim.get("local_marker_dat_gap_count", ""),
                "reward_count": dim.get("reward_count", ""),
                "reward_gap_rows": dim.get("reward_gap_rows", ""),
                "exp_gap_rows": dim.get("exp_gap_rows", ""),
                "missing_scene_push_rows": dim.get("missing_scene_push_rows", ""),
                "after_warp_rows": dim.get("after_warp_rows", ""),
                "bnpc_rows": dim.get("bnpc_rows", ""),
                "sqb_target": dim.get("sqb_target", ""),
                "content_launch_rows": dim.get("content_launch_rows", ""),
                "recommended_lane": dim.get("recommended_lane", ""),
                "enablement_action": safety.get("enablement_action", ""),
                "effective_offerable": safety.get("effective_offerable", ""),
                "recommended_next_step": "enrich data only where runtime proof exists; otherwise capture owner/cutscene/fight proof first",
                "blockers": blockers,
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority"]), str(row["code"])))
    return rows


def build_owner_probe_rows(owner_seed_rows: list[dict[str, str]], owner_queue_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    queue_by_code = index_by_code(owner_queue_rows)
    rows: list[dict[str, object]] = []
    for seed in owner_seed_rows:
        code = norm_code(seed.get("code", ""))
        queue_rows = queue_by_code.get(code, [])
        rows.append(
            {
                "priority": seed.get("priority", ""),
                "blocked_category": seed.get("blocked_category", ""),
                "code": code,
                "quest_id": seed.get("quest_id", ""),
                "event_method": seed.get("event_method", ""),
                "candidate_owner_selector": seed.get("candidate_owner_selector", ""),
                "candidate_source": seed.get("candidate_source", ""),
                "candidate_confidence": seed.get("candidate_confidence", ""),
                "candidate_reason": seed.get("candidate_reason", ""),
                "probe_command": seed.get("probe_command", ""),
                "mutation_policy": seed.get("mutation_policy", ""),
                "blocked_owner_queue_rows": len(queue_rows),
                "queue_blockers": csv_join((row.get("blocker", "") or row.get("blocker_notes", "") for row in queue_rows), limit=4),
                "decomp_addendum_action": "capture natural EventStart owner and event tuple before wiring any recovered method",
                "proof_required": "owner actor/object id, active event name, event type, event open/close lifecycle, and no state mutation",
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority"]), str(row["code"])))
    return rows


def build_class_tail_cutscene_rows(cutscene_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for row in cutscene_rows:
        code = norm_code(row.get("code", ""))
        if code not in CLASS_TAIL_CODES:
            continue
        rows.append(
            {
                "priority_score": row.get("priority_score", ""),
                "code": code,
                "quest_id": row.get("quest_id", ""),
                "event_method": row.get("event_method", ""),
                "delegate_method_to_call": row.get("delegate_method_to_call", ""),
                "args": row.get("args", ""),
                "arg_count": row.get("arg_count", ""),
                "scene_keys": row.get("scene_keys", ""),
                "scene_calls": row.get("scene_calls", ""),
                "scene_call_kind": row.get("scene_call_kind", ""),
                "fade_mode": row.get("fade_mode", ""),
                "route_status": row.get("route_status", ""),
                "push_safety": row.get("push_safety", ""),
                "active_owner_kind": row.get("active_owner_kind", ""),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "argument_shape": row.get("argument_shape", ""),
                "required_runtime_args": row.get("required_runtime_args", ""),
                "patch_class": row.get("patch_class", ""),
                "next_step": row.get("next_step", ""),
                "blocker_notes": row.get("blocker_notes", ""),
                "runtime_proof_contract": "log EventUpdate return tuple and cutscene args; keep event open through after-warp paths; do not complete quest",
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority_score"]), str(row["code"]), str(row["event_method"])))
    return rows


def build_private_bnpc_rows(bnpc_rows: list[dict[str, str]], sqb_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    sqb_by_code = by_code(sqb_rows)
    rows: list[dict[str, object]] = []
    for row in bnpc_rows:
        code = norm_code(row.get("code", ""))
        if code not in HELPER_BNPC_SHORTLIST and row.get("candidate_status", "") != "curated_sqb_private_mob_candidate":
            continue
        sqb = sqb_by_code.get(code, {})
        helper_rank = "yes" if code in HELPER_BNPC_SHORTLIST else ""
        add_policy = "private/SQB mob type candidate only; no ambient spawn, completion, ContentFinished, or rewards"
        if row.get("suggested_spawn_surface", "") == "world_or_script_spawn":
            add_policy = "data-only mob mapping candidate; verify spawn route and callback before adding live spawns"
        rows.append(
            {
                "priority": row.get("priority", ""),
                "helper_shortlist": helper_rank,
                "code": code,
                "quest_id": row.get("quest_id", ""),
                "quest_name": row.get("quest_name", ""),
                "category": row.get("category", ""),
                "fight_lane": row.get("fight_lane", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "actor_class_path": row.get("actor_class_path", ""),
                "monster_family": row.get("monster_family", ""),
                "objective_constant": row.get("objective_constant", ""),
                "display_hint": row.get("display_hint", ""),
                "candidate_status": row.get("candidate_status", ""),
                "curated_closest_existing_analog": row.get("curated_closest_existing_analog", ""),
                "same_family_fight_analogs": row.get("same_family_fight_analogs", ""),
                "sql_display_keyword_analogs": row.get("sql_display_keyword_analogs", ""),
                "suggested_spawn_surface": row.get("suggested_spawn_surface", ""),
                "sqb_adapter_status": row.get("sqb_adapter_status", "") or sqb.get("adapter_status", ""),
                "success_signal": row.get("sqb_success_signal", "") or sqb.get("success_signal", ""),
                "local_onkill_summary": row.get("local_onkill_summary", "") or sqb.get("local_onkill_summary", ""),
                "recommended_next_action": row.get("recommended_next_action", "") or sqb.get("recommended_next_step", ""),
                "add_policy": add_policy,
                "blockers": csv_join([row.get("risk_notes", ""), sqb.get("blockers", ""), sqb.get("reward_lock_status", "")], limit=4),
                "source_refs": csv_join([row.get("source_refs", ""), sqb.get("evidence_refs", "")], limit=4),
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority"]), str(row["code"]), str(row["actor_class_id"])))
    return rows


def build_reward_display_sync_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for row in REWARD_DISPLAY_SYNC_CANDIDATES:
        path = Path(row["file_path"].replace("\\", "/"))
        current_line = ""
        if path.exists():
            lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
            index = as_int(row["line_hint"]) - 1
            if 0 <= index < len(lines):
                current_line = lines[index].strip()
        status = "candidate"
        if row["expected_display_exp"] in current_line:
            status = "applied"
        rows.append(
            {
                **row,
                "file_exists": "yes" if path.exists() else "no",
                "current_line": current_line,
                "patch_policy": "display-only sqrwa EXP sync; do not add AddExp/AddGil/AddItem because CompleteQuest auto-grants normalized rewards",
                "implementation_status": status,
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority"]), str(row["code"])))
    return rows


def build_safe_alias_patch_rows(alias_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for row in alias_rows:
        code = norm_code(row.get("code", ""))
        if code not in SAFE_ALIAS_FOCUS_CODES:
            continue
        rows.append(
            {
                "priority_score": row.get("priority_score", ""),
                "code": code,
                "quest_id": row.get("quest_id", ""),
                "quest_name": row.get("quest_name", ""),
                "local_script_path": row.get("local_script_path", ""),
                "event_method": row.get("event_method", ""),
                "scene_keys": row.get("scene_keys", ""),
                "alias_callers": row.get("alias_callers", ""),
                "alias_bad_delegate_methods": row.get("alias_bad_delegate_methods", ""),
                "alias_patch_extra_args": row.get("alias_patch_extra_args", ""),
                "argument_shape": row.get("argument_shape", ""),
                "patch_class": row.get("patch_class", ""),
                "push_safety": row.get("push_safety", ""),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "recommended_patch": "replace scene-key delegate string with recovered method name; preserve owner/wait/end policy and extra args",
                "proof_before_merge": "smoke the route and confirm EventUpdate tuple/after-warp lifetime before enabling rewards",
                "blocker_notes": row.get("blocker_notes", ""),
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority_score"]), str(row["code"]), str(row["event_method"])))
    return rows


def build_existing_bnpc_spawn_rows(spawn_rows: list[dict[str, str]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for row in spawn_rows:
        code = norm_code(row.get("quest_code", ""))
        if code not in HIGH_CONFIDENCE_EXISTING_BNPC_CODES:
            continue
        rows.append(
            {
                "priority": 100 if row.get("status", "") == "ambient_server_spawn" else 80,
                "code": code,
                "quest_id": row.get("quest_id", ""),
                "quest_name": row.get("quest_name", ""),
                "min_level": row.get("min_level", ""),
                "script": row.get("script", ""),
                "script_line": row.get("script_line", ""),
                "objective_constant": row.get("constant", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "actor_class_path": row.get("actor_class_path", ""),
                "bnpc_type_ids": row.get("bnpc_type_ids", ""),
                "mob_display_names": row.get("mob_display_names", ""),
                "objective_item_id": row.get("objective_item_id", ""),
                "objective_item_name": row.get("objective_item_name", ""),
                "objective_amount": row.get("objective_amount", ""),
                "ambient_spawn_count": row.get("ambient_spawn_count", ""),
                "zone_summary": row.get("zone_summary", ""),
                "sample_spawn_points": row.get("sample_spawn_points", ""),
                "status": row.get("status", ""),
                "confidence": "high" if row.get("status", "") == "ambient_server_spawn" else "medium",
                "safe_policy": "existing ambient spawn evidence; verify callback/objective and duplicate reward guard before enabling any quest completion route",
            }
        )
    rows.sort(key=lambda row: (-as_int(row["priority"]), str(row["code"])))
    return rows


def build_job_metadata_rows(dimension_by_code: dict[str, dict[str, str]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for note in JOB_METADATA_ENRICHMENT_NOTES:
        dim = dimension_by_code.get(note["code"], {})
        rows.append(
            {
                **note,
                "quest_id": dim.get("quest_id", ""),
                "quest_name": dim.get("quest_name", ""),
                "local_script_path": dim.get("local_script_path", ""),
                "recovered_script_path": dim.get("recovered_script_path", ""),
                "marker_count": dim.get("marker_count", ""),
                "reward_count": dim.get("reward_count", ""),
                "sqb_target": dim.get("sqb_target", ""),
                "gap_score": dim.get("gap_score", ""),
                "enablement_risk_score": dim.get("enablement_risk_score", ""),
                "recommended_next_step": "record metadata/TODO only; probe owner/objective route before cutscene or SQB wiring",
            }
        )
    rows.sort(key=lambda row: (str(row["job"]), str(row["code"])))
    return rows


def build_source_manifest() -> list[dict[str, str]]:
    paths = [
        QUEST_DIMENSION,
        CUTSCENE_ARGS,
        OWNER_SEEDS,
        OWNER_QUEUE,
        BNPC_CANDIDATES,
        BNPC_SPAWN_SUMMARY,
        SQB_FIRST_SLICE,
        SAFETY_QUEUE,
        SAFE_ALIAS_PATCH_QUEUE,
        Path("Data/scripts/quests/class_quest_template.lua"),
        Path("Data/scripts/quests/bsm/bsm400.lua"),
        Path("Data/scripts/quests/exc/exc400.lua"),
        Path("Data/scripts/quests/fsh/fsh400.lua"),
    ]
    return [
        {
            "source_path": str(path).replace("/", "\\"),
            "exists": "yes" if path.exists() else "no",
            "bytes": path.stat().st_size if path.exists() else "",
        }
        for path in paths
    ]


def write_readme(output: Path, counts: dict[str, int]) -> None:
    lines = [
        "# Quest Decomp Addendum Atlas - 2026-06-30",
        "",
        "This atlas captures the next decomp additions after the runtime proof gap pass.",
        "It intentionally separates safe hidden loaders from runtime-unproven gameplay.",
        "",
        "## Outputs",
        "",
        "- `safe_hidden_class_tail_additions.csv`: hidden/no-offer class-tail loaders that are safe only as probes.",
        "- `new_quest_candidate_queue.csv`: missing-local-script rows sorted by safe add policy and priority.",
        "- `current_quest_data_enrichment_queue.csv`: existing local scripts with marker, reward, cutscene, BNPC, or content gaps.",
        "- `owner_probe_addendum.csv`: strong blocked-owner probe seeds that still require natural EventStart proof.",
        "- `class_tail_cutscene_seed_rows.csv`: recovered class-tail cutscene methods and runtime argument contracts.",
        "- `private_bnpc_materialization_candidate_addendum.csv`: private/SQB and data-only BNPC candidates; no SQL is generated.",
        "- `reward_display_sync_candidates.csv`: sqrwa reward-window EXP values that can be aligned without duplicate grants.",
        "- `safe_cutscene_alias_patch_candidates.csv`: recovered method-name swaps that still need route smoke testing.",
        "- `existing_bnpc_spawn_enrichment_candidates.csv`: high-confidence existing ambient BNPC/objective joins.",
        "- `job_metadata_enrichment_notes.csv`: level-40 job metadata details that should stay TODO/data-only for now.",
        "- `normalized_quest_data_schema_recommendations.csv`: proposed small CSV schemas for future quest data.",
        "- `ai_helper_decomp_addendum_findings.csv`: helper findings folded into this pass.",
        "- `source_manifest.csv`: generator inputs.",
        "",
        "## Counts",
        "",
    ]
    for name, count in counts.items():
        lines.append(f"- `{name}`: {count}")
    lines.extend(
        [
            "",
            "## Safety Notes",
            "",
            "- `bsm400`, `exc400`, and `fsh400` were added only as hidden/no-offer loader stubs.",
            "- ACN rows are reference-only candidates because the local ACN quest template/data is not proven.",
            "- BNPC/SQB rows are data candidates only. They require materialization, strict kill callback, cleanup, and reward-lock proof before gameplay enablement.",
            "- Owner/cutscene rows still need live EventStart and EventUpdate capture.",
            "- Reward display syncs do not grant rewards; normalized rewards are granted by `CompleteQuest`.",
        ]
    )
    (output / "README.md").write_text("\n".join(lines) + "\n", encoding="utf-8")


def write_doc(doc: Path, counts: dict[str, int], output: Path) -> None:
    doc.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "# Quest Decomp Addendum Atlas - 2026-06-30",
        "",
        f"Generated output directory: `{output}`",
        "",
        "## What Changed",
        "",
        "- Added hidden/no-offer class-tail probes for `bsm400`, `exc400`, and `fsh400`.",
        "- Kept `cul400` as the existing comparison row.",
        "- Promoted ACN, private BNPC/SQB, side BNPC, job metadata, reward-display, and static main-scenario rows into explicit queues instead of enabling them.",
        "",
        "## Output Counts",
        "",
    ]
    for name, count in counts.items():
        lines.append(f"- `{name}`: {count}")
    lines.extend(
        [
            "",
            "## Highest Confidence Adds",
            "",
            "`safe_hidden_class_tail_additions.csv` is the only list that corresponds to code stubs added in this pass.",
            "Every row is still `noOffer` and should be used for owner/cutscene probing only.",
            "",
            "## Runtime Proof Still Missing",
            "",
            "- EventUpdate return tuples and typed branch values.",
            "- Real SNPC tuple values per scene.",
            "- A8/branch semantics by method family.",
            "- Natural owner resolution for blocked owner rows.",
            "- After-warp event lifetime proof.",
            "- Modern scene=none instance lifecycle proof.",
            "- Fight materialization, strict kill callback, cleanup, and reward-lock proof.",
            "",
            "## Safe Patch Lane",
            "",
            "`reward_display_sync_candidates.csv` is display-only: it aligns the `sqrwa` reward widget value with normalized reward data and does not add duplicate `AddExp`, `AddGil`, or `AddItem` calls.",
        ]
    )
    doc.write_text("\n".join(lines) + "\n", encoding="utf-8")


def build(output: Path, doc: Path) -> dict[str, int]:
    output.mkdir(parents=True, exist_ok=True)

    dimension_rows = csv_read(QUEST_DIMENSION)
    cutscene_rows = csv_read(CUTSCENE_ARGS)
    owner_seed_rows = csv_read(OWNER_SEEDS)
    owner_queue_rows = csv_read(OWNER_QUEUE)
    bnpc_rows = csv_read(BNPC_CANDIDATES)
    bnpc_spawn_rows = csv_read(BNPC_SPAWN_SUMMARY)
    sqb_rows = csv_read(SQB_FIRST_SLICE)
    safety_rows = csv_read(SAFETY_QUEUE)
    alias_rows = csv_read(SAFE_ALIAS_PATCH_QUEUE)

    dimension_by_code = by_code(dimension_rows)
    cutscenes_by_code = index_by_code(cutscene_rows)
    safety_by_code = by_code(safety_rows)

    outputs = {
        "safe_hidden_class_tail_additions": (
            build_safe_hidden_class_tail_rows(dimension_by_code, cutscenes_by_code),
            [
                "priority",
                "code",
                "quest_id",
                "quest_name",
                "category",
                "config_key",
                "class_id",
                "actor_id",
                "first_marker_id",
                "owner_probe_method",
                "script_stub_path",
                "script_stub_exists_now",
                "local_change_status",
                "master_local_script_path_before_pass",
                "recovered_script_path",
                "marker_count",
                "reward_count",
                "recovered_scene_keys",
                "recovered_event_methods",
                "patch_classes",
                "safety_policy",
                "implementation_blockers",
                "recommended_next_step",
                "evidence_refs",
            ],
        ),
        "new_quest_candidate_queue": (
            build_new_quest_candidate_rows(dimension_rows),
            [
                "priority",
                "code",
                "quest_id",
                "quest_name",
                "category",
                "min_level",
                "parity_status",
                "has_recovered_script",
                "marker_count",
                "reward_count",
                "cutscene_event_rows",
                "missing_scene_push_rows",
                "after_warp_rows",
                "bnpc_rows",
                "sqb_target",
                "content_launch_rows",
                "gap_score",
                "enablement_risk_score",
                "candidate_lane",
                "safe_add_policy",
                "recommended_next_step",
                "blockers",
                "local_script_path",
                "recovered_script_path",
            ],
        ),
        "current_quest_data_enrichment_queue": (
            build_current_enrichment_rows(dimension_rows, safety_by_code),
            [
                "priority",
                "code",
                "quest_id",
                "quest_name",
                "category",
                "local_script_path",
                "gap_score",
                "implementation_gap_score",
                "enablement_risk_score",
                "marker_count",
                "local_marker_dat_gap_count",
                "reward_count",
                "reward_gap_rows",
                "exp_gap_rows",
                "missing_scene_push_rows",
                "after_warp_rows",
                "bnpc_rows",
                "sqb_target",
                "content_launch_rows",
                "recommended_lane",
                "enablement_action",
                "effective_offerable",
                "recommended_next_step",
                "blockers",
            ],
        ),
        "owner_probe_addendum": (
            build_owner_probe_rows(owner_seed_rows, owner_queue_rows),
            [
                "priority",
                "blocked_category",
                "code",
                "quest_id",
                "event_method",
                "candidate_owner_selector",
                "candidate_source",
                "candidate_confidence",
                "candidate_reason",
                "probe_command",
                "mutation_policy",
                "blocked_owner_queue_rows",
                "queue_blockers",
                "decomp_addendum_action",
                "proof_required",
            ],
        ),
        "class_tail_cutscene_seed_rows": (
            build_class_tail_cutscene_rows(cutscene_rows),
            [
                "priority_score",
                "code",
                "quest_id",
                "event_method",
                "delegate_method_to_call",
                "args",
                "arg_count",
                "scene_keys",
                "scene_calls",
                "scene_call_kind",
                "fade_mode",
                "route_status",
                "push_safety",
                "active_owner_kind",
                "wait_recipe",
                "end_event_policy",
                "argument_shape",
                "required_runtime_args",
                "patch_class",
                "next_step",
                "blocker_notes",
                "runtime_proof_contract",
            ],
        ),
        "private_bnpc_materialization_candidate_addendum": (
            build_private_bnpc_rows(bnpc_rows, sqb_rows),
            [
                "priority",
                "helper_shortlist",
                "code",
                "quest_id",
                "quest_name",
                "category",
                "fight_lane",
                "actor_class_id",
                "actor_class_path",
                "monster_family",
                "objective_constant",
                "display_hint",
                "candidate_status",
                "curated_closest_existing_analog",
                "same_family_fight_analogs",
                "sql_display_keyword_analogs",
                "suggested_spawn_surface",
                "sqb_adapter_status",
                "success_signal",
                "local_onkill_summary",
                "recommended_next_action",
                "add_policy",
                "blockers",
                "source_refs",
            ],
        ),
        "reward_display_sync_candidates": (
            build_reward_display_sync_rows(),
            [
                "priority",
                "code",
                "quest_id",
                "quest_name",
                "file_path",
                "line_hint",
                "file_exists",
                "old_display_exp",
                "expected_display_exp",
                "reward_source",
                "current_line",
                "patch_policy",
                "implementation_status",
                "reward_join_ref",
            ],
        ),
        "safe_cutscene_alias_patch_candidates": (
            build_safe_alias_patch_rows(alias_rows),
            [
                "priority_score",
                "code",
                "quest_id",
                "quest_name",
                "local_script_path",
                "event_method",
                "scene_keys",
                "alias_callers",
                "alias_bad_delegate_methods",
                "alias_patch_extra_args",
                "argument_shape",
                "patch_class",
                "push_safety",
                "wait_recipe",
                "end_event_policy",
                "recommended_patch",
                "proof_before_merge",
                "blocker_notes",
            ],
        ),
        "existing_bnpc_spawn_enrichment_candidates": (
            build_existing_bnpc_spawn_rows(bnpc_spawn_rows),
            [
                "priority",
                "code",
                "quest_id",
                "quest_name",
                "min_level",
                "script",
                "script_line",
                "objective_constant",
                "actor_class_id",
                "actor_class_path",
                "bnpc_type_ids",
                "mob_display_names",
                "objective_item_id",
                "objective_item_name",
                "objective_amount",
                "ambient_spawn_count",
                "zone_summary",
                "sample_spawn_points",
                "status",
                "confidence",
                "safe_policy",
            ],
        ),
        "job_metadata_enrichment_notes": (
            build_job_metadata_rows(dimension_by_code),
            [
                "code",
                "job",
                "level",
                "quest_id",
                "quest_name",
                "scene_anchor",
                "director",
                "action_id",
                "metadata_status",
                "local_script_path",
                "recovered_script_path",
                "marker_count",
                "reward_count",
                "sqb_target",
                "gap_score",
                "enablement_risk_score",
                "safe_policy",
                "recommended_next_step",
            ],
        ),
        "normalized_quest_data_schema_recommendations": (
            NORMALIZED_SCHEMA_RECOMMENDATIONS,
            ["table_name", "columns", "why"],
        ),
        "ai_helper_decomp_addendum_findings": (
            HELPER_FINDINGS,
            [
                "helper",
                "focus",
                "finding",
                "applied_to",
                "candidate_codes",
                "live_proof_still_needed",
            ],
        ),
        "source_manifest": (
            build_source_manifest(),
            ["source_path", "exists", "bytes"],
        ),
    }

    counts: dict[str, int] = {}
    for name, (rows, fields) in outputs.items():
        counts[name] = csv_write(output / f"{name}.csv", rows, fields)

    summary_rows = [
        {"metric": "output_file_count", "value": len(outputs), "notes": ""},
        {"metric": "new_hidden_class_tail_stub_count", "value": len(NEW_SAFE_CLASS_TAIL_CODES), "notes": csv_join(sorted(NEW_SAFE_CLASS_TAIL_CODES))},
        {"metric": "missing_local_script_candidates", "value": counts["new_quest_candidate_queue"], "notes": "all remain disabled/no-offer/log-only candidates"},
        {"metric": "private_bnpc_candidate_rows", "value": counts["private_bnpc_materialization_candidate_addendum"], "notes": "no SQL generated by this atlas"},
    ]
    summary_rows.extend(
        {"metric": f"category:{category}", "value": count, "notes": "new quest candidate queue"}
        for category, count in Counter(row.get("category", "") for row in outputs["new_quest_candidate_queue"][0]).most_common()
    )
    counts["summary"] = csv_write(output / "summary.csv", summary_rows, ["metric", "value", "notes"])

    write_readme(output, counts)
    write_doc(doc, counts, output)
    return counts


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()
    counts = build(args.output, args.doc)
    for name, count in counts.items():
        print(f"{name}: {count}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
