#!/usr/bin/env python3
"""Build a broad decomp index for normal quest rows.

This pass is intentionally data-only. It joins the existing recovered Lua
atlases, normalized quest tables, replay rows, local script status, and battle
breadcrumbs into a compact pack for follow-up quest implementation work.

The default filter keeps game quest rows with a real title and skips unfinished
`[en]` placeholders. Seasonal quests remain included.
"""

from __future__ import annotations

import argparse
import csv
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Iterable


DEFAULT_OUTPUT = Path("outputs/all-normal-quest-decomp-20260707")
DEFAULT_DOC = Path("docs/all_normal_quest_decomp_2026-07-07.md")

DAT_MINING_DIR = Path("docs/Dat Mining")
DAT_CORE_TABLES = (
    "quest.csv",
    "_quest.csv",
    "xtx_quest.csv",
    "quest_marker.csv",
    "quest_new_reward.csv",
    "quest_reward.csv",
    "cutReplay.csv",
    "xtx_cutReplay.csv",
    "xtx_questCompleteText.csv",
)
QUEST_DIMENSION = Path("outputs/quest-master-gap-atlas-20260630/quest_dimension.csv")
QUEST_REWARDS = Path("outputs/quest-master-gap-atlas-20260630/quest_reward_join.csv")
QUEST_MARKERS = Path("outputs/quest-master-gap-atlas-20260630/quest_marker_join.csv")
QUEST_ACTORS = Path("outputs/quest-master-gap-atlas-20260630/quest_actor_surface_join.csv")
QUEST_BNPC_OBJECTIVES = Path("outputs/quest-normalized-data-pack-20260630/quest_bnpc_objectives.csv")
QUEST_SPAWN_POINTS = Path("outputs/quest-normalized-data-pack-20260630/quest_spawn_points.csv")
QUEST_MARKER_SEED_BACKLOG = Path("outputs/quest-normalized-data-pack-20260630/new_quest_marker_seed_backlog.csv")
PARITY = Path("tools/outputs/lpb/quest_scenario_parity_contract_20260619/quest_code_parity.csv")
RECOVERED_INVENTORY = Path("tools/outputs/lpb/quest_scenario_parity_contract_20260619/recovered_quest_scenario_inventory.csv")
RECOVERED_DIRECTORS = Path("tools/outputs/lpb/quest_scenario_parity_contract_20260619/recovered_quest_director_inventory.csv")
LOCAL_DIRECTORS = Path("tools/outputs/lpb/quest_scenario_parity_contract_20260619/local_quest_director_inventory.csv")
CUTSCENE_SUMMARY = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutscene_summary_by_quest.csv")
CUTSCENE_CALLS = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutscene_calls.csv")
EVENT_SUMMARY = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_event_summary_by_quest.csv")
TEXT_SUMMARY = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_text_summary_by_quest.csv")
EVENT_TEXT_JOIN = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_event_text_join.csv")
SERVER_FLOW_SUMMARY = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/server_quest_flow_summary_by_quest.csv")
SERVER_FLOW_CALLS = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/server_quest_flow_calls.csv")
CUTREPLAY_ROWS = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutreplay_rows_joined.csv")
METHOD_SPINE = Path("outputs/quest-recovered-method-spine-atlas-20260630/quest_method_spine.csv")
METHOD_CALLS = Path("outputs/quest-recovered-method-spine-atlas-20260630/quest_method_calls.csv")
BNPC_SPAWNS = Path("outputs/quest-bnpc-spawns-20260620/quest_bnpc_spawn_summary.csv")
BNPC_SPAWN_POINTS = Path("outputs/quest-bnpc-spawns-20260620/quest_bnpc_spawn_points.csv")
BNPC_MATERIALIZATION = Path("outputs/quest-bnpc-materialization-candidate-atlas-20260630/bnpc_materialization_candidates.csv")
BNPC_LOOT_SQL = Path("Data/sql/server_battlenpc_mob_types_loot.sql")
GAMEDATA_ACTOR_CLASS_SQL = Path("Data/sql/gamedata_actor_class.sql")
GAMEDATA_ACTOR_APPEARANCE_SQL = Path("Data/sql/gamedata_actor_appearance.sql")
SERVER_EVENTNPC_SPAWN_LOCATIONS_SQL = Path("Data/sql/server_eventnpc_spawn_locations.sql")
QUEST_EXECUTION_SUMMARY = Path("outputs/quest-execution-atlas-20260630/quest_execution_summary_by_code.csv")
QUEST_SCENE_PUSH_MAP = Path("outputs/quest-execution-atlas-20260630/quest_event_cutscene_push_map.csv")
QUEST_RUNTIME_WORKQUEUE = Path("outputs/quest-runtime-probe-atlas-20260630/runtime_probe_workqueue.csv")
QUEST_CUTSCENE_RUNTIME_PLAN = Path("outputs/quest-runtime-probe-atlas-20260630/cutscene_runtime_probe_plan.csv")
QUEST_FIGHT_RUNTIME_PLAN = Path("outputs/quest-runtime-probe-atlas-20260630/fight_runtime_probe_plan.csv")
QUEST_ENABLEMENT_SAFETY = Path("outputs/quest-safe-enablement-atlas-20260630/quest_enablement_safety_queue.csv")
QUEST_SAFE_PUSH_ENABLEMENT = Path("outputs/quest-safe-push-enablement-atlas-20260630/safe_push_enablement_rows.csv")
QUEST_IMPLEMENTATION_ROADMAP = Path("outputs/quest-implementation-roadmap-20260630/quest_implementation_roadmap.csv")
QUEST_PUSH_OPERATORS = Path("outputs/quest-universal-push-operator-atlas-20260630/quest_push_operator_rows.csv")
QUEST_PUSH_DEPENDENCIES = Path("outputs/quest-universal-push-operator-atlas-20260630/quest_push_dependency_bundles.csv")
QUEST_LOCAL_CONSTANTS = Path("outputs/quest-runtime-deep-atlas-20260630/local_quest_constants.csv")
QUEST_LOCAL_DELEGATE_PUSH_CALLS = Path("outputs/quest-runtime-deep-atlas-20260630/local_delegate_push_calls.csv")
QUEST_LOCAL_ENPC_BINDINGS = Path("outputs/quest-runtime-deep-atlas-20260630/local_quest_enpc_bindings.csv")
QUEST_UNMATCHED_DELEGATE_CALLS = Path("outputs/quest-runtime-deep-atlas-20260630/unmatched_active_delegate_calls.csv")
QUEST_LOCAL_EVENT_LIFECYCLE = Path("outputs/quest-runtime-deep-atlas-20260630/local_event_lifecycle_actions.csv")
QUEST_CUTSCENE_ARGUMENTS = Path("outputs/quest-cutscene-argument-atlas-20260630/cutscene_argument_requirements.csv")
QUEST_AFTER_WARP_ARGUMENTS = Path("outputs/quest-cutscene-argument-atlas-20260630/after_warp_event_lifetime_queue.csv")
QUEST_ROUTE_OWNERS = Path("outputs/quest-route-owner-inference-atlas-20260630/route_owner_inference_rows.csv")
QUEST_PAYLOAD_ATLAS = Path("outputs/quest-push-payload-execution-atlas-20260630/owner_bound_cutscene_payload_atlas.csv")
QUEST_PAYLOAD_PROBE_QUEUE = Path("outputs/quest-push-payload-execution-atlas-20260630/owner_bound_cutscene_payload_probe_queue.csv")
QUEST_EVENTUPDATE_PROOF_QUEUE = Path("outputs/quest-runtime-proof-gap-atlas-20260630/eventupdate_return_tuple_decomp_queue.csv")
QUEST_AFTER_WARP_PROOF_QUEUE = Path("outputs/quest-runtime-proof-gap-atlas-20260630/after_warp_lifetime_proof_queue.csv")
QUEST_BLOCKED_OWNER_QUEUE = Path("outputs/quest-runtime-proof-gap-atlas-20260630/blocked_owner_resolution_decomp_queue.csv")
QUEST_FIGHT_READINESS = Path("outputs/quest-master-gap-atlas-20260630/fight_readiness_by_quest.csv")
QUEST_FIGHT_RETURN_REWARD = Path("outputs/quest-fight-materialization-atlas-20260630/fight_return_reward_lock_join.csv")
QUEST_FIGHT_KILL_ROUTE = Path("outputs/quest-fight-materialization-atlas-20260630/fight_kill_route_join.csv")
QUEST_BLUEPRINT_WORKQUEUE = Path("outputs/quest-implementation-blueprint-atlas-20260630/implementation_blueprint_workqueue.csv")
QUEST_RETAIL_SEQUENCE_BLUEPRINTS = Path("outputs/quest-implementation-blueprint-atlas-20260630/retail_sequence_spine_blueprints.csv")
QUEST_CUTSCENE_PUSH_CONTRACTS = Path("outputs/quest-cutscene-push-contract-atlas-20260630/cutscene_push_contracts.csv")
QUEST_TEMPLATE_SCAFFOLD_PUSH_CONTRACTS = Path("outputs/quest-cutscene-push-contract-atlas-20260630/template_scaffold_push_contracts.csv")
QUEST_SAFE_CUTSCENE_PATCH_CONTRACTS = Path("outputs/quest-cutscene-push-contract-atlas-20260630/safe_cutscene_patch_contracts.csv")
QUEST_SNPC_PAYLOAD_PROBE_CONTRACTS = Path("outputs/quest-cutscene-push-contract-atlas-20260630/snpc_payload_probe_contracts.csv")
QUEST_MANUAL_ROUTE_RECOVERY_CONTRACTS = Path("outputs/quest-cutscene-push-contract-atlas-20260630/manual_route_recovery_contracts.csv")
QUEST_DIRECTOR_NOTICE_CONTRACTS = Path("outputs/quest-cutscene-push-contract-atlas-20260630/director_notice_contracts.csv")
QUEST_CUTSCENE_PUSH_RECIPES = Path("outputs/quest-push-recipe-atlas-20260630/cutscene_push_recipes.csv")
QUEST_PUSH_IMPLEMENTATION_QUEUE = Path("outputs/quest-push-recipe-atlas-20260630/push_implementation_queue.csv")
QUEST_OWNER_PROBE_QUEUE = Path("outputs/quest-push-command-blueprint-atlas-20260630/questdelegate_owner_probe_queue.csv")
QUEST_CUTSCENE_METHOD_PROBE_RECIPES = Path("outputs/quest-universal-push-operator-atlas-20260630/cutscene_method_probe_recipes.csv")
QUEST_RUNTIME_UNLOCK_TRIAGE = Path("outputs/quest-next-runtime-unlock-atlas-20260630/non_en_completed_cutscene_triage.csv")
QUEST_RUNTIME_UNLOCK_SCAFFOLD = Path("outputs/quest-next-runtime-unlock-atlas-20260630/non_en_scaffold_cutscene_queue.csv")
QUEST_RUNTIME_UNLOCK_EXACT_HAZARD = Path("outputs/quest-next-runtime-unlock-atlas-20260630/non_en_exact_delegate_hazard_smoke_queue.csv")
QUEST_RUNTIME_UNLOCK_SNPC_A8 = Path("outputs/quest-next-runtime-unlock-atlas-20260630/snpc_a8_capture_queue.csv")
QUEST_RUNTIME_UNLOCK_SQB_PRIVATE = Path("outputs/quest-next-runtime-unlock-atlas-20260630/sqb_private_materialization_queue.csv")
QUEST_RUNTIME_UNLOCK_WORLD_BNPC = Path("outputs/quest-next-runtime-unlock-atlas-20260630/world_bnpc_callback_probe_queue.csv")
QUEST_RUNTIME_UNLOCK_REQUESTED_PROOF = Path("outputs/quest-next-runtime-unlock-atlas-20260630/requested_gap_runtime_proof_queue.csv")
QUEST_RUNTIME_UNLOCK_WAVE2 = Path("outputs/quest-next-runtime-unlock-atlas-20260630/runtime_unlock_wave2.csv")
QUEST_RUNTIME_UNLOCK_SAFE_SMOKE = Path("outputs/quest-next-runtime-unlock-atlas-20260630/safe_smoke_targets.csv")
QUEST_RUNTIME_UNLOCK_MISSING_DELEGATE = Path("outputs/quest-next-runtime-unlock-atlas-20260630/non_en_missing_recovered_delegate_queue.csv")
QUEST_RUNTIME_UNLOCK_EXACT_SMOKE = Path("outputs/quest-next-runtime-unlock-atlas-20260630/non_en_exact_delegate_smoke_queue.csv")
QUEST_RUNTIME_UNLOCK_FIRST_LIVE = Path("outputs/quest-runtime-proof-gap-atlas-20260630/first_live_runtime_probe_wave.csv")
QUEST_RUNTIME_UNLOCK_FIRST_PAYLOAD = Path("outputs/quest-push-payload-execution-atlas-20260630/first_payload_probe_wave.csv")
QUEST_RUNTIME_UNLOCK_FIRST_PROBE = Path("outputs/quest-push-command-blueprint-atlas-20260630/first_probe_wave.csv")
QUEST_RUNTIME_UNLOCK_ALIAS_UNLOCK = Path("outputs/quest-next-runtime-unlock-atlas-20260630/cutscene_alias_unlock_review.csv")
QUEST_RUNTIME_UNLOCK_ALIAS_DEFERRED = Path("outputs/quest-next-runtime-unlock-atlas-20260630/cutscene_alias_deferred_review.csv")
QUEST_RUNTIME_UNLOCK_EVENTUPDATE_TUPLE = Path("outputs/quest-next-runtime-unlock-atlas-20260630/eventupdate_tuple_probe_queue.csv")
QUEST_RUNTIME_UNLOCK_ELEVATOR = Path("outputs/quest-next-runtime-unlock-atlas-20260630/elevator_cutscene_probe_queue.csv")
QUEST_RUNTIME_UNLOCK_WORLD_BNPC_DEFERRED = Path("outputs/quest-next-runtime-unlock-atlas-20260630/world_bnpc_callback_deferred_queue.csv")
QUEST_INSTANCE_LOCAL_SEQUENCE = Path("outputs/quest-instanced-sequence-owner-matrix-20260702/local_sequence_action_rows.csv")
QUEST_INSTANCE_EVENT_METHODS = Path("outputs/quest-instanced-event-adapter-contract-20260702/recovered_event_method_rows.csv")
QUEST_INSTANCE_OWNER_SCENES = Path("outputs/quest-instanced-sequence-owner-matrix-20260702/recovered_owner_scene_rows.csv")
QUEST_INSTANCE_OWNER_HINTS = Path("outputs/quest-instanced-actor-owner-resolution-20260702/recovered_owner_hint_rows.csv")
QUEST_INSTANCE_METHOD_TEXT = Path("outputs/quest-instanced-event-text-owner-20260702/recovered_method_text_rows.csv")
QUEST_INSTANCE_TEXT_CLUES = Path("outputs/quest-instanced-event-text-owner-20260702/quest_text_clue_rows.csv")
QUEST_INSTANCE_TOTORAK_FLOW = Path("outputs/quest-instanced-event-text-owner-20260702/totorak_cutscene_flow_rows.csv")
QUEST_INSTANCE_RECOVERED_CLIENT_EVENTS = Path("outputs/quest-instanced-cutscene-lifecycle-20260702/recovered_client_event_method_rows.csv")
QUEST_INSTANCE_LOCAL_EVENT_CALLS = Path("outputs/quest-instanced-cutscene-lifecycle-20260702/local_event_call_rows.csv")
QUEST_INSTANCE_LOCAL_DELEGATE_PAYLOAD = Path("outputs/quest-instanced-scene-payload-contract-20260702/local_delegate_payload_rows.csv")
QUEST_INSTANCE_ALIAS_PAYLOAD_RECONCILIATION = Path("outputs/quest-instanced-scene-payload-contract-20260702/alias_payload_reconciliation_rows.csv")
QUEST_INSTANCE_LOCAL_ACTOR_USAGE = Path("outputs/quest-instanced-actor-owner-resolution-20260702/local_actor_usage_rows.csv")
QUEST_INSTANCE_SCENE_OWNER_RECONCILIATION = Path("outputs/quest-instanced-actor-owner-resolution-20260702/scene_owner_reconciliation_rows.csv")
QUEST_INSTANCE_SEQUENCE_OWNER_RECONCILIATION = Path("outputs/quest-instanced-sequence-owner-matrix-20260702/sequence_owner_reconciliation_rows.csv")
QUEST_INSTANCE_LOCAL_DELEGATE_TRANSITION = Path("outputs/quest-instanced-sequence-owner-matrix-20260702/local_delegate_transition_rows.csv")
QUEST_INSTANCE_RECOVERED_PAYLOAD_BRANCH = Path("outputs/quest-instanced-scene-payload-contract-20260702/recovered_payload_branch_rows.csv")
QUEST_INSTANCE_CALLSITE_RUNTIME_PROBE = Path("outputs/quest-instanced-runtime-probe-packet-20260702/per_callsite_runtime_probe_rows.csv")
QUEST_INSTANCE_CUTSCENE_RETURN_STATE = Path("outputs/quest-instanced-event-return-state-machine-20260702/cutscene_return_state_rows.csv")
QUEST_INSTANCE_OWNER_HAZARD = Path("outputs/quest-instanced-actor-owner-resolution-20260702/owner_hazard_rows.csv")
QUEST_INSTANCE_LIFECYCLE_HAZARD = Path("outputs/quest-instanced-sequence-owner-matrix-20260702/event_lifecycle_hazard_rows.csv")
QUEST_INSTANCE_GC_TAIL_RECOVERED = Path("outputs/quest-instanced-unresolved-recovery-targets-20260702/gc_tail_recovered_scenario_methods.csv")
QUEST_INSTANCE_RUNTIME_PLAYBOOK = Path("outputs/quest-instanced-scene-payload-contract-20260702/runtime_probe_playbook_rows.csv")
QUEST_INSTANCE_NEXT_ACTION = Path("outputs/quest-instanced-runtime-probe-packet-20260702/per_quest_next_action_rows.csv")
QUEST_INSTANCE_EVENT_CONTRACT = Path("outputs/quest-instanced-event-return-state-machine-20260702/per_quest_event_contract_rows.csv")
QUEST_INSTANCE_REWARD_BOUNDARY = Path("outputs/quest-instanced-event-adapter-contract-20260702/reward_boundary_rows.csv")
QUEST_INSTANCE_HANDLER_CONTRACT = Path("outputs/quest-instanced-event-adapter-contract-20260702/local_handler_contract_rows.csv")
QUEST_INSTANCE_ADAPTER_GATE = Path("outputs/quest-instanced-event-adapter-contract-20260702/adapter_gate_rows.csv")
QUEST_INSTANCE_BATTLE_ADAPTER = Path("outputs/quest-instanced-battle-adapter-blueprint-20260702/battle_adapter_quest_rows.csv")
QUEST_INSTANCE_SQB_DIRECTOR_RECOVERY = Path("outputs/quest-instanced-cutscene-lifecycle-20260702/sqb_director_recovery_rows.csv")
QUEST_INSTANCE_SQB_BLOCKED_FOLLOWUP = Path("outputs/quest-instanced-sqb-probe-contract-20260702/sqb_blocked_followup_rows.csv")
QUEST_INSTANCE_SQB_SHELL_GAP = Path("outputs/quest-instanced-battle-adapter-blueprint-20260702/sqb_shell_gap_rows.csv")
QUEST_INSTANCE_ALIAS_ACTOR_MULTIPLICITY = Path("outputs/quest-instanced-actor-owner-resolution-20260702/alias_actor_multiplicity_rows.csv")
QUEST_INSTANCE_ALIAS_RECONCILIATION = Path("outputs/quest-instanced-event-adapter-contract-20260702/alias_reconciliation_rows.csv")
QUEST_INSTANCE_RECOVERED_FOCUS = Path("outputs/quest-instanced-runtime-probe-packet-20260702/recovered_focus_rows.csv")
QUEST_INSTANCE_EVENT_OWNER_CANDIDATE = Path("outputs/quest-instanced-event-text-owner-20260702/event_owner_candidate_rows.csv")
QUEST_INSTANCE_GC_TAIL_RECOVERY = Path("outputs/quest-instanced-unresolved-recovery-targets-20260702/gc_tail_recovery_rows.csv")
QUEST_INSTANCE_GC_TARGET_HINT = Path("outputs/quest-instanced-event-text-owner-20260702/gc_target_hint_rows.csv")
QUEST_INSTANCE_GC_RECOVERED_OWNER_GAP = Path("outputs/quest-instanced-actor-owner-resolution-20260702/gc_recovered_owner_gap_rows.csv")
QUEST_INSTANCE_PAYLOAD_SMOKE_MATRIX = Path("outputs/quest-instanced-scene-payload-contract-20260702/payload_smoke_matrix_rows.csv")
QUEST_INSTANCE_TOTORAK_SEQUENCE = Path("outputs/quest-instanced-unresolved-recovery-targets-20260702/totorak_quest_sequence_rows.csv")
QUEST_INSTANCE_SQB_SPAWN_PROBE_CASES = Path("outputs/quest-instanced-sqb-probe-contract-20260702/sqb_spawn_probe_cases.csv")
QUEST_INSTANCE_SPAWN_READY_PROBE = Path("outputs/quest-instanced-battle-adapter-blueprint-20260702/spawn_ready_probe_rows.csv")
QUEST_INSTANCE_GC_TAIL_MONSTER_HINT = Path("outputs/quest-instanced-unresolved-recovery-targets-20260702/gc_tail_monster_hint_rows.csv")
QUEST_INSTANCE_ACTOR_DATA_BLOCKER = Path("outputs/quest-instanced-battle-adapter-blueprint-20260702/actor_data_blocker_rows.csv")
QUEST_INSTANCE_PER_QUEST_ACTION_QUEUE = Path("outputs/quest-next-runtime-unlock-atlas-20260630/instanced_per_quest_action_queue.csv")
STARTER_CLIENT_SIGNAL_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/client_signal_rows.csv")
STARTER_CLIENT_METHOD_SUMMARY = Path("outputs/starter-city-opening-quests-decomp-20260705/client_method_summary.csv")
STARTER_SEQUENCE_FLOW_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/sequence_flow_rows.csv")
STARTER_FIGHT_ROUTE_MATRIX = Path("outputs/starter-city-opening-quests-decomp-20260705/fight_route_matrix.csv")
STARTER_RUNTIME_PROBE_CHECKLIST = Path("outputs/starter-city-opening-quests-decomp-20260705/runtime_probe_checklist.csv")
STARTER_LOCAL_CONSTANT_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/local_constant_rows.csv")
STARTER_CLIENT_METHOD_BODIES = Path("outputs/starter-city-opening-quests-decomp-20260705/client_method_body_extracts.csv")
STARTER_CLIENT_DIALOGUE_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/client_dialogue_rows.csv")
STARTER_TRANSITION_ACTION_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/transition_action_rows.csv")
STARTER_SOURCE_TO_CLIENT_METHOD_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/source_to_client_method_rows.csv")
STARTER_SOURCE_DELEGATE_CALL_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/source_delegate_call_rows.csv")
STARTER_FLAG_USAGE_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/flag_usage_rows.csv")
STARTER_SERVER_DELEGATE_SURFACE = Path("outputs/starter-city-opening-quests-decomp-20260705/server_delegate_surface.csv")
STARTER_DELEGATE_PUSH_CALL_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/delegate_push_call_rows.csv")
STARTER_DAT_MARKER_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/dat_marker_rows.csv")
STARTER_ACTOR_SURFACE_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/actor_surface_rows.csv")
STARTER_LIFECYCLE_ACTION_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/lifecycle_action_rows.csv")
STARTER_FUNCTION_SKELETON_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/function_skeleton_rows.csv")
STARTER_PROBE_COMMANDS = Path("outputs/starter-city-opening-quests-decomp-20260705/probe_commands.csv")
STARTER_LOCAL_MARKER_CONSTANTS = Path("outputs/starter-city-opening-quests-decomp-20260705/local_marker_constants.csv")
STARTER_CONTENT_SPAWN_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/content_spawn_rows.csv")
STARTER_MARKER_CONDITION_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/marker_condition_rows.csv")
STARTER_CONTENT_SPAWN_ATLAS_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/content_spawn_atlas_rows.csv")
STARTER_REPLAY_SCENE_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/replay_scene_rows.csv")
STARTER_CHOICE_GATE_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/choice_gate_rows.csv")
STARTER_COUNTER_USAGE_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/counter_usage_rows.csv")
STARTER_QUEST_SUMMARY = Path("outputs/starter-city-opening-quests-decomp-20260705/quest_summary.csv")
STARTER_OBJECTIVE_CROSSCHECK_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/objective_crosscheck_rows.csv")
STARTER_REWARD_ROWS = Path("outputs/starter-city-opening-quests-decomp-20260705/reward_rows.csv")
SEASONAL_QUEST_ITEM_SURFACE = Path("outputs/seasonal-item-decomp-atlas-20260703/seasonal_quest_item_surface.csv")
SEASONAL_ITEM_ATLAS = Path("outputs/seasonal-item-decomp-atlas-20260703/seasonal_item_atlas.csv")
QUEST_LOCAL_CUTSCENE_DELEGATES = Path("outputs/quest-cutscene-push-matrix-atlas-20260630/local_cutscene_delegate_inventory.csv")
QUEST_LOCAL_DELEGATE_EVENT_CALLERS = Path("outputs/quest-execution-atlas-20260630/local_delegate_event_callers.csv")
QUEST_RECOVERED_CUTSCENE_PUSH_MATRIX = Path("outputs/quest-cutscene-push-matrix-atlas-20260630/recovered_cutscene_push_matrix.csv")
QUEST_CUTSCENE_PUSH_TEMPLATE_CANDIDATES = Path("outputs/quest-cutscene-push-matrix-atlas-20260630/cutscene_push_template_candidates.csv")
QUEST_CUTSCENE_IMPLEMENTATION_GAP_WORKQUEUE = Path("outputs/quest-cutscene-push-matrix-atlas-20260630/cutscene_implementation_gap_workqueue.csv")
QUEST_SCRIPT_CUTSCENE_GAP_SUMMARY = Path("outputs/quest-cutscene-push-matrix-atlas-20260630/script_cutscene_gap_summary.csv")
QUEST_SCENE_BEARING_EVENTS_NEEDING_LOCAL_PUSH = Path("outputs/quest-execution-atlas-20260630/scene_bearing_events_needing_local_push.csv")
QUEST_AFTER_WARP_CUTSCENE_EVENTS = Path("outputs/quest-execution-atlas-20260630/after_warp_cutscene_events.csv")
QUEST_BLOCKER_METHOD_SPINE_FOCUS = Path("outputs/quest-recovered-method-spine-atlas-20260630/blocker_method_spine_focus.csv")
QUEST_ROUTE_OWNER_PATCH_FOCUS = Path("outputs/quest-route-owner-inference-atlas-20260630/route_owner_patch_focus_queue.csv")
QUEST_LOCAL_MUTATOR_SCAN = Path("outputs/quest-safe-enablement-atlas-20260630/local_mutator_scan.csv")
QUEST_REWARD_DISPLAY_SYNC_SCAN = Path("outputs/quest-reward-display-sync-atlas-20260630/reward_display_sync_scan.csv")
QUEST_REWARD_DISPLAY_DAT_PATCH = Path("outputs/quest-reward-display-sync-atlas-20260630/dat_backed_patch_queue.csv")
QUEST_REWARD_DISPLAY_WIKI_REVIEW = Path("outputs/quest-reward-display-sync-atlas-20260630/wiki_review_queue.csv")
QUEST_ADDENDUM_ENRICHMENT_QUEUE = Path("outputs/quest-decomp-addendum-atlas-20260630/current_quest_data_enrichment_queue.csv")
QUEST_ADDENDUM_REWARD_SYNC = Path("outputs/quest-decomp-addendum-atlas-20260630/reward_display_sync_candidates.csv")
QUEST_ADDENDUM_EXISTING_BNPC = Path("outputs/quest-decomp-addendum-atlas-20260630/existing_bnpc_spawn_enrichment_candidates.csv")
QUEST_ADDENDUM_PRIVATE_BNPC = Path("outputs/quest-decomp-addendum-atlas-20260630/private_bnpc_materialization_candidate_addendum.csv")
QUEST_SIMPLEQUESTBATTLE_TARGETS = Path("outputs/quest-runtime-deep-atlas-20260630/simplequestbattle_targets.csv")
QUEST_SQB_ADAPTER_ROWS = Path("outputs/quest-sqb-adapter-atlas-20260630/sqb_adapter_rows.csv")
QUEST_FIGHT_SQB_PUSH_OPERATORS = Path("outputs/quest-universal-push-operator-atlas-20260630/fight_sqb_push_operator_rows.csv")
QUEST_SQB_CUTSCENE_DEPENDENCIES = Path("outputs/quest-sqb-adapter-atlas-20260630/sqb_cutscene_dependency_queue.csv")
QUEST_SQB_REWARD_LOCKED = Path("outputs/quest-safe-push-enablement-atlas-20260630/sqb_reward_locked_queue.csv")
QUEST_FIGHT_ACTOR_MOB_SPAWN = Path("outputs/quest-fight-materialization-atlas-20260630/fight_actor_mob_spawn_join.csv")
QUEST_FIGHT_PAYLOAD_PROBE = Path("outputs/quest-push-payload-execution-atlas-20260630/fight_payload_probe_queue.csv")
QUEST_FIGHT_REWARD_LOCK_PROOF = Path("outputs/quest-runtime-proof-gap-atlas-20260630/fight_materialization_reward_lock_proof_queue.csv")
QUEST_PAYLOAD_EXECUTION_QUEUE = Path("outputs/quest-push-payload-execution-atlas-20260630/questdelegate_payload_execution_queue.csv")
QUEST_AFTER_WARP_LIFETIME_PAYLOAD_QUEUE = Path("outputs/quest-push-payload-execution-atlas-20260630/after_warp_lifetime_payload_queue.csv")
QUEST_AFTER_WARP_PUSH_QUEUE = Path("outputs/quest-push-recipe-atlas-20260630/after_warp_push_queue.csv")
QUEST_CONTENT_LAUNCH_CALLS = Path("outputs/quest-execution-atlas-20260630/content_launch_calls.csv")
QUEST_CUTSCENE_ROUTE_SUMMARY = Path("outputs/quest-push-recipe-atlas-20260630/quest_cutscene_route_summary.csv")
QUEST_EXECUTION_PRIORITY_QUEUE = Path("outputs/quest-execution-atlas-20260630/quest_execution_priority_queue.csv")
QUEST_SCAFFOLD_CUTSCENE_SEED_QUEUE = Path("outputs/quest-universal-push-operator-atlas-20260630/scaffold_cutscene_seed_queue.csv")
QUEST_SAFE_PUSH_SCAFFOLD_OWNER_ONLY = Path("outputs/quest-safe-push-enablement-atlas-20260630/scaffold_owner_only_queue.csv")
QUEST_BLOCKED_OWNER_SELECTOR_MATRIX = Path("outputs/quest-runtime-proof-gap-atlas-20260630/blocked_owner_selector_attempt_matrix.csv")
QUEST_CLASS_SCAFFOLD_ENRICHMENT = Path("outputs/quest-next-runtime-unlock-atlas-20260630/current_class_scaffold_enrichment.csv")
QUEST_DEEP_PUSH_WORKQUEUE = Path("outputs/quest-deep-push-probe-atlas-20260630/push_probe_workqueue.csv")
QUEST_DEEP_CUTSCENE_TEMPLATES = Path("outputs/quest-deep-push-probe-atlas-20260630/cutscene_call_templates.csv")
QUEST_SNPC_ARGUMENT_PROBE_QUEUE = Path("outputs/quest-cutscene-argument-atlas-20260630/snpc_argument_probe_queue.csv")
QUEST_RUNTIME_SNPC_A8_SEMANTICS = Path("outputs/quest-runtime-proof-gap-atlas-20260630/snpc_a8_branch_semantics_queue.csv")
QUEST_SNPC_PAYLOAD_CAPTURE_QUEUE = Path("outputs/quest-push-payload-execution-atlas-20260630/snpc_payload_capture_queue.csv")
QUEST_FIGHT_MATERIALIZATION_RECIPES = Path("outputs/quest-deep-push-probe-atlas-20260630/fight_materialization_recipes.csv")
QUEST_ROADMAP_TOP25 = Path("outputs/quest-implementation-roadmap-20260630/quest_implementation_top25.csv")
QUEST_WORLD_BNPC_MATERIALIZATION = Path("outputs/quest-bnpc-materialization-candidate-atlas-20260630/world_bnpc_materialization_candidates.csv")
QUEST_SAFE_PUSH_MANUAL_RECOVERY = Path("outputs/quest-safe-push-enablement-atlas-20260630/manual_recovery_queue.csv")
QUEST_SAFE_PUSH_TARGETED_SMOKE = Path("outputs/quest-safe-push-enablement-atlas-20260630/targeted_smoke_queue.csv")
QUEST_CUTSCENE_ALIAS_BLUEPRINTS = Path("outputs/quest-implementation-blueprint-atlas-20260630/cutscene_alias_callsite_blueprints.csv")
QUEST_FIGHT_PRIORITY_PAYLOAD_SEED = Path("outputs/quest-push-payload-execution-atlas-20260630/fight_priority_payload_seed_rows.csv")
QUEST_RETAIL_SEQUENCE_RUNTIME_PLAN = Path("outputs/quest-runtime-probe-atlas-20260630/retail_sequence_runtime_probe_plan.csv")
QUEST_REWARD_DAT_APPLIED = Path("outputs/quest-reward-display-sync-atlas-20260630/dat_backed_applied_this_pass.csv")
QUEST_LOCAL_CONTENT_AREA_LAUNCHES = Path("outputs/quest-runtime-deep-atlas-20260630/local_content_area_launches.csv")
QUEST_AFTER_WARP_PRIORITY_SEED = Path("outputs/quest-runtime-proof-gap-atlas-20260630/after_warp_priority_seed_rows.csv")
QUEST_BLOCKED_BNPC_ACTOR_RECOVERY = Path("outputs/quest-next-runtime-unlock-atlas-20260630/blocked_bnpc_actor_recovery_queue.csv")
QUEST_AFTER_WARP_LIFETIME_SEED = Path("outputs/quest-next-runtime-unlock-atlas-20260630/after_warp_lifetime_seed_queue.csv")
QUEST_DIRECTOR_EVENT_PUSH_REQUIREMENTS = Path("outputs/quest-push-recipe-atlas-20260630/director_event_push_requirements.csv")
QUEST_SCENE_KEY_DELEGATE_ALIASES = Path("outputs/quest-runtime-deep-atlas-20260630/scene_key_delegate_aliases.csv")
QUEST_ALIAS_PATCH_PLAN = Path("outputs/quest-push-recipe-atlas-20260630/alias_patch_plan.csv")
QUEST_SQB_PRIVATE_MOB_SQL_BLUEPRINTS = Path("outputs/quest-implementation-blueprint-atlas-20260630/sqb_private_mob_sql_blueprints.csv")
QUEST_FIGHT_HELPER_PRIORITY_SEED = Path("outputs/quest-runtime-proof-gap-atlas-20260630/fight_helper_priority_seed_rows.csv")
QUEST_SQB_FIRST_SLICE_QUEUE = Path("outputs/quest-sqb-adapter-atlas-20260630/sqb_first_slice_queue.csv")
QUEST_SQBPRIVATE_COMMAND_BLUEPRINTS = Path("outputs/quest-push-command-blueprint-atlas-20260630/sqbprivate_command_blueprints.csv")
QUEST_RETAIL_BLOCKER_BLUEPRINTS = Path("outputs/quest-implementation-blueprint-atlas-20260630/retail_blocker_blueprints.csv")
QUEST_CURATED_BLOCKER_REVIEWS = Path("outputs/quest-deep-push-probe-atlas-20260630/curated_blocker_reviews.csv")
QUEST_JOB_METADATA_ENRICHMENT = Path("outputs/quest-decomp-addendum-atlas-20260630/job_metadata_enrichment_notes.csv")
QUEST_FIGHT_CONTENT_LIFECYCLE = Path("outputs/quest-fight-materialization-atlas-20260630/fight_content_lifecycle_join.csv")
QUEST_SQB_MATERIALIZATION_GAP = Path("outputs/quest-sqb-adapter-atlas-20260630/sqb_materialization_gap_queue.csv")
QUEST_SQB_MATERIALIZATION_CANDIDATES = Path("outputs/quest-bnpc-materialization-candidate-atlas-20260630/sqb_materialization_candidates.csv")
QUEST_SCENE_ALIAS_PAYLOAD_HAZARD = Path("outputs/quest-next-runtime-unlock-atlas-20260630/non_en_scene_alias_payload_hazard_queue.csv")
QUEST_SCENE_ALIAS_PATCH_CANDIDATES = Path("outputs/quest-cutscene-push-matrix-atlas-20260630/scene_alias_patch_candidates.csv")
QUEST_BLOCKED_OWNER_CANDIDATE_SEED = Path("outputs/quest-runtime-proof-gap-atlas-20260630/blocked_owner_candidate_seed_rows.csv")
QUEST_OWNER_PROBE_ADDENDUM = Path("outputs/quest-decomp-addendum-atlas-20260630/owner_probe_addendum.csv")
QUEST_BLOCKED_SQB_ACTOR_RECOVERY = Path("outputs/quest-next-runtime-unlock-atlas-20260630/blocked_sqb_actor_recovery_queue.csv")
LPB_METHOD_CALL_EDGES = Path("tools/outputs/lpb/decomp_correlation_20260617/method_call_edges.csv")
LPB_BRIDGE_CALLS_BY_METHOD = Path("tools/outputs/lpb/decomp_correlation_20260617/bridge_calls_by_method.csv")
LPB_TARGET_SYSTEM_BRIDGE_CALLS = Path("tools/outputs/lpb/decomp_correlation_20260617/target_system_bridge_calls.csv")
LPB_METHOD_SUMMARIES = Path("tools/outputs/lpb/decomp_correlation_20260617/method_summaries.csv")
LPB_METHOD_RANGES = Path("tools/outputs/lpb/decomp_correlation_20260617/method_ranges.csv")
LPB_TARGET_SYSTEM_METHOD_SUMMARIES = Path("tools/outputs/lpb/decomp_correlation_20260617/target_system_method_summaries.csv")
LPB_EVENT_PROTOCOL_CANDIDATES = Path("tools/outputs/lpb/decomp_correlation_20260617/event_protocol_candidates.csv")
LPB_TARGET_SYSTEM_EVENT_PROTOCOLS = Path("tools/outputs/lpb/decomp_correlation_20260617/target_system_event_protocols.csv")
LPB_FULL_CLASS_METHODS = Path("tools/outputs/lpb/decomp_further_20260617/full_class_methods.csv")
LPB_FULL_EVENT_ENTRYPOINTS = Path("tools/outputs/lpb/decomp_further_20260617/full_event_entrypoints.csv")
LPB_FULL_CLASS_INVENTORY = Path("tools/outputs/lpb/decomp_further_20260617/full_class_inventory.csv")
LPB_CLASS_METHODS = Path("tools/outputs/lpb/decomp_more_20260617/class_methods.csv")
LPB_CLASS_INVENTORY = Path("tools/outputs/lpb/decomp_more_20260617/class_inventory.csv")
LPB_CLASS_INHERITANCE_GRAPH = Path("tools/outputs/lpb/decomp_correlation_20260617/class_inheritance_graph.csv")
LPB_QUEST_METHOD_TIMELINE = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_method_timeline.csv")
LPB_QUEST_EVENT_CALLS = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_event_calls.csv")
LPB_QUEST_METHOD_CONTEXT = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_method_context.csv")
LPB_QUEST_SCENE_DIALOGUE_CONTEXT = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_scene_dialogue_context.csv")
LPB_QUEST_CUTSCENE_FUNCTIONS = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutscene_functions.csv")
LPB_SERVER_DELEGATE_FLOW_CONTEXT = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/server_delegate_flow_context.csv")
LPB_SERVER_DELEGATE_METHOD_CONTEXT = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/server_delegate_method_context.csv")
LPB_SERVER_DELEGATE_TO_CUTSCENE_JOIN = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/server_delegate_to_cutscene_join.csv")
LPB_QUEST_SCENE_ASSET_CROSSCHECK = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_scene_asset_crosscheck.csv")
LPB_QUEST_SCENE_KEY_GAPS = Path("tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_scene_key_gaps.csv")
LPB_LOCAL_QUEST_SCRIPT_INVENTORY = Path("tools/outputs/lpb/quest_scenario_parity_contract_20260619/local_quest_script_inventory.csv")
LPB_SIDE_WORLD_CODE_PARITY = Path("tools/outputs/lpb/side_world_quest_gap_contract_20260619/side_world_code_parity.csv")
LPB_RECOVERED_SIDE_WORLD_INVENTORY = Path("tools/outputs/lpb/side_world_quest_gap_contract_20260619/recovered_side_world_inventory.csv")
LPB_LOCAL_SIDE_WORLD_INVENTORY = Path("tools/outputs/lpb/side_world_quest_gap_contract_20260619/local_side_world_inventory.csv")
LPB_SIMPLEQUESTBATTLE_DIRECTOR_INVENTORY = Path("tools/outputs/lpb/simple_quest_battle_director_contract_20260619/simplequestbattle_director_inventory.csv")
LPB_QUEST_CUTSCENE_HOTSPOTS = Path("tools/outputs/lpb/quest_cutscene_bridge_contract_20260619/quest_cutscene_hotspots.csv")
LPB_SERVER_DELEGATE_BRIDGE_SUMMARY = Path("tools/outputs/lpb/quest_cutscene_bridge_contract_20260619/server_delegate_bridge_summary.csv")
LPB_QUEST_SCENE_KEY_GAP_CONTRACT = Path("tools/outputs/lpb/quest_cutscene_bridge_contract_20260619/quest_scene_key_gap_contract.csv")
LPB_SEASONAL_SCRIPT_INVENTORY = Path("tools/outputs/lpb/seasonal_quest_gap_contract_20260619/seasonal_script_inventory.csv")
LPB_SEASONAL_REPLACEMENT_CANDIDATES = Path("tools/outputs/lpb/seasonal_quest_gap_contract_20260619/seasonal_replacement_candidates.csv")
LPB_LOCAL_CREATE_CONTENT_AREA_CALLS = Path("tools/outputs/lpb/simple_quest_battle_director_contract_20260619/local_create_content_area_calls.csv")
LPB_SIMPLEQUESTBATTLE_CLIENT_OVERRIDES = Path("tools/outputs/lpb/simple_quest_battle_director_contract_20260619/simplequestbattle_client_quest_id_overrides.csv")
LPB_SIMPLEQUESTBATTLE_FAMILY_COVERAGE = Path("tools/outputs/lpb/simple_quest_battle_director_contract_20260619/simplequestbattle_family_coverage.csv")
LPB_SIMPLEQUESTBATTLE_PROBE_QUEUE = Path("tools/outputs/lpb/simple_quest_battle_director_contract_20260619/probe_queue.csv")
LPB_SCAFFOLD_CONFIG_CONTRACT = Path("tools/outputs/lpb/scaffold_quest_replacement_contract_20260619/scaffold_config_contract.csv")
LPB_SCAFFOLD_REPLACEMENT_TARGETS = Path("tools/outputs/lpb/side_world_quest_gap_contract_20260619/scaffold_replacement_targets.csv")
LPB_SIDE_EVENT_BRIDGE_PARITY = Path("tools/outputs/lpb/side_world_quest_gap_contract_20260619/event_bridge_parity.csv")
LPB_SCAFFOLD_REPLACEMENT_PLAN = Path("tools/outputs/lpb/scaffold_quest_replacement_contract_20260619/replacement_plan.csv")
LPB_RECOVERED_SCAFFOLD_SCENARIO = Path("tools/outputs/lpb/scaffold_quest_replacement_contract_20260619/recovered_scaffold_scenario_contract.csv")
LPB_LOCAL_SCAFFOLD_BEHAVIOR = Path("tools/outputs/lpb/scaffold_quest_replacement_contract_20260619/local_scaffold_current_behavior.csv")
LPB_SCAFFOLD_LOCAL_GAP_MATRIX = Path("tools/outputs/lpb/scaffold_quest_replacement_contract_20260619/local_gap_matrix.csv")
LPB_SCAFFOLD_PROBE_QUEUE = Path("tools/outputs/lpb/scaffold_quest_replacement_contract_20260619/probe_queue.csv")
LPB_SIDE_WORLD_LOCAL_GAP_MATRIX = Path("tools/outputs/lpb/side_world_quest_gap_contract_20260619/local_gap_matrix.csv")
LPB_SIDE_WORLD_PROBE_QUEUE = Path("tools/outputs/lpb/side_world_quest_gap_contract_20260619/probe_queue.csv")
LPB_TARGET_SYSTEM_TEXT_SHEETS = Path("tools/outputs/lpb/decomp_correlation_20260617/target_system_text_sheets.csv")
LPB_TEXT_SHEET_USAGE_JOIN = Path("tools/outputs/lpb/decomp_correlation_20260617/text_sheet_usage_join.csv")
LPB_FULL_TEXT_DATA_LOADS = Path("tools/outputs/lpb/decomp_further_20260617/full_text_data_loads.csv")
LPB_TEXT_DATA_LOADS = Path("tools/outputs/lpb/decomp_more_20260617/text_data_loads.csv")
LPB_CONTENT_CUTSCENE_KEY_INVENTORY = Path("tools/outputs/lpb/content_systems_20260612/content_cutscene_key_inventory.csv")
LPB_CUTSCENE_KEY_CROSSCHECK = Path("tools/outputs/lpb/content_systems_20260612/cutscene_key_crosscheck.csv")
LPB_CUTSCENE_CONTENT_FAMILY_KEY_CROSSCHECK = Path("tools/outputs/lpb/content_systems_20260612/cutscene_content_family_key_crosscheck.csv")
LPB_LOOT_LIST_TEXT_MESSAGE_CONTRACT = Path("tools/outputs/lpb/loot_list_reward_surface_contract_20260619/loot_list_text_message_contract.csv")
QUEST_INSTANCE_ADAPTER_HARDENING = Path("outputs/quest-instanced-event-adapter-contract-20260702/adapter_hardening_rows.csv")
QUEST_INSTANCE_LANE_EXECUTION_ORDER = Path("outputs/quest-instanced-runtime-probe-packet-20260702/lane_execution_order_rows.csv")


GENERIC_TITLES = {"", "[en]", "small talk", "seasonal event"}
SQL_ROW_RE = re.compile(r"^\s*\((.*)\),?\s*$")
LUA_FUNCTION_RE = re.compile(r"^\s*(?:local\s+)?function\s+([A-Za-z_][A-Za-z0-9_:.]*)\s*\(([^)]*)\)")
LUA_REQUIRE_RE = re.compile(r"require\s*\(?\s*[\"']([^\"']+)[\"']")
LUA_DEFINE_CLASS_RE = re.compile(r"_defineClass\s*\(\s*[\"']([^\"']+)[\"']\s*,\s*[\"']([^\"']+)[\"']")
REPLAY_PLACEHOLDER_HINTS = {
    "-200": "literal zero/default placeholder",
    "-201": "SNPC nickname",
    "-202": "SNPC raw skin",
    "-203": "SNPC personality",
    "-204": "SNPC coordinate",
    "-205": "player initial town",
    "-206": "player main-skill 41 flag",
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
    "-217": "SNPC personality remapped through getSnpcSexualityToSkin",
    "-218": "literal true",
    "-219": "literal false",
    "-220": "initial-town 3 selector",
    "-221": "player Grand Company, defaulting zero to one",
    "-222": "quest 110019 completion flag",
    "-223": "completion flag for 111827/111627/111427",
}
REPLAY_SLOT_FIELDS = ["slot9", "slot10", "slot11", "slot12", "slot13", "slot14", "slot15"]


@dataclass(frozen=True)
class Inputs:
    root: Path
    output: Path
    doc: Path

    def path(self, value: Path) -> Path:
        return value if value.is_absolute() else self.root / value


def read_csv(path: Path) -> list[dict[str, str]]:
    if not path.exists():
        return []
    with path.open(newline="", encoding="utf-8-sig", errors="replace") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: Iterable[dict[str, object]], fields: list[str]) -> int:
    rows = list(rows)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})
    return len(rows)


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8", newline="\n")


def clean(value: object) -> str:
    return " ".join(str(value or "").replace("\r", " ").replace("\n", " ").split())


def truthy_text(value: object) -> bool:
    return clean(value).lower() in {"1", "true", "yes", "y"}


def to_int(value: object) -> int:
    try:
        return int(float(str(value or "").strip()))
    except ValueError:
        return 0


def norm_code(value: object) -> str:
    return str(value or "").strip().lower()


def split_many(value: object) -> list[str]:
    text = str(value or "")
    return [clean(part) for part in re.split(r";|\|", text) if clean(part)]


def join_unique(values: Iterable[object], limit: int | None = None) -> str:
    out: list[str] = []
    seen: set[str] = set()
    for value in values:
        for part in split_many(value) or [clean(value)]:
            text = clean(part)
            if not text or text in seen:
                continue
            seen.add(text)
            out.append(text)
            if limit is not None and len(out) >= limit:
                return "; ".join(out)
    return "; ".join(out)


def replay_placeholder_hint(value: object) -> str:
    placeholder = clean(value)
    if not placeholder:
        return ""
    return REPLAY_PLACEHOLDER_HINTS.get(placeholder, "unknown replay placeholder")


def replay_slot_hints(row: dict[str, str]) -> str:
    hints: list[str] = []
    for field in REPLAY_SLOT_FIELDS:
        placeholder = clean(row.get(field, ""))
        if not placeholder:
            continue
        hints.append(f"{field}={placeholder} {replay_placeholder_hint(placeholder)}")
    return "; ".join(hints)


def replay_payload_shape(row: dict[str, str]) -> str:
    slots = [clean(row.get(field, "")) for field in REPLAY_SLOT_FIELDS if clean(row.get(field, ""))]
    dynamic = [slot for slot in slots if slot and slot != "-200"]
    if not dynamic:
        return "static_no_dynamic_payload"
    if slots[:5] == ["-201", "-202", "-203", "-204", "-205"]:
        if "-217" in dynamic:
            return "snpc_raw_tuple_plus_sexuality_skin"
        if slots[5:6] == ["-205"]:
            return "snpc_raw_tuple_plus_initial_town_extra"
        return "snpc_raw_tuple"
    return "dynamic_placeholder_payload"


def replay_helper_hint(shape: str) -> str:
    if shape == "snpc_raw_tuple":
        return "getSnpcReplayArgList / getSnpcDelegateArgList"
    if shape == "snpc_raw_tuple_plus_sexuality_skin":
        return "getSnpcReplayArgListWithSexualitySkin"
    if shape == "snpc_raw_tuple_plus_initial_town_extra":
        return "getSnpcDelegateArgListWithExtras(player, helpers.getInitialTown(player))"
    if shape == "static_no_dynamic_payload":
        return "delegateEvent / no dynamic replay payload"
    return "manual replay placeholder review"


def first_value(*values: object) -> str:
    for value in values:
        text = clean(value)
        if text:
            return text
    return ""


def rows_by_code(rows: Iterable[dict[str, str]], field: str = "code") -> dict[str, dict[str, str]]:
    out: dict[str, dict[str, str]] = {}
    for row in rows:
        code = norm_code(row.get(field, ""))
        if code and code not in out:
            out[code] = row
    return out


def list_rows_by_code(rows: Iterable[dict[str, str]], field: str = "code") -> dict[str, list[dict[str, str]]]:
    out: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        code = norm_code(row.get(field, ""))
        if code:
            out[code].append(row)
    return out


def infer_included_code(row: dict[str, str], code_field: str, included: set[str], source_fields: Iterable[str] = ()) -> str:
    code = norm_code(row.get(code_field, ""))
    if code in included:
        return code

    candidates = sorted(included, key=len, reverse=True)
    for field in source_fields:
        source = clean(row.get(field, ""))
        if not source:
            continue
        stem = Path(source.replace("\\", "/")).stem.lower()
        token = re.sub(r"[^a-z0-9]", "", stem)
        for prefix in ("questdirectorevent", "questdirector"):
            if token.startswith(prefix):
                token = token[len(prefix) :]
                break
        for candidate in candidates:
            if token.startswith(candidate):
                return candidate
    return ""


def pick_included_code(row: dict[str, str], included: set[str], code_fields: Iterable[str], source_fields: Iterable[str] = ()) -> str:
    for field in code_fields:
        code = norm_code(row.get(field, ""))
        if code in included:
            return code
    for field in code_fields:
        code = infer_included_code(row, field, included, source_fields)
        if code in included:
            return code
    return infer_included_code(row, "", included, source_fields)


def extract_included_codes(row: dict[str, str], included: set[str], code_fields: Iterable[str], source_fields: Iterable[str] = ()) -> list[str]:
    codes: list[str] = []
    seen: set[str] = set()

    def add(code: str) -> None:
        code = norm_code(code)
        if code in included and code not in seen:
            seen.add(code)
            codes.append(code)

    for field in code_fields:
        text = clean(row.get(field, ""))
        add(text)
        for part in re.split(r"[;|,\s]+", text):
            add(part)
        for token in re.findall(r"[a-z][a-z0-9]{3,12}", text.lower().replace("\\", "/")):
            for prefix in ("questdirectorevent", "questdirector"):
                if token.startswith(prefix):
                    token = token[len(prefix) :]
                    break
            add(token.removesuffix(".lua"))

    for field in source_fields:
        code = infer_included_code(row, field, included, (field,))
        add(code)

    return codes


def include_dimension_row(row: dict[str, str]) -> bool:
    quest_id = clean(row.get("quest_id", ""))
    title = clean(row.get("quest_name", ""))
    return bool(quest_id and title and title != "[en]")


def family_from_row(code: str, row: dict[str, str], parity: dict[str, str]) -> str:
    recovered_families = split_many(parity.get("recovered_families", ""))
    if recovered_families:
        return recovered_families[0]
    recovered_path = first_value(row.get("recovered_script_path", ""), parity.get("recovered_paths", ""))
    parts = re.split(r"[\\/]", recovered_path)
    if "scenario" in parts:
        index = parts.index("scenario")
        if index + 1 < len(parts):
            return parts[index + 1]
    match = re.match(r"([a-z]+)", code)
    return match.group(1) if match else ""


def local_script_status(root: Path, local_path: str) -> tuple[str, int, str]:
    if not local_path:
        return ("missing", 0, "")
    path = root / local_path
    if not path.exists():
        return ("missing", 0, "")
    body = path.read_text(encoding="utf-8", errors="replace")
    flags: list[str] = []
    if "InitQuestScaffold" in body:
        flags.append("scaffold")
    if "InitClassQuest" in body or "InitJobQuest" in body or "InitQuestTemplate" in body:
        flags.append("template")
    if "delegateEvent" in body or "callClientFunction" in body or "runClientFunction" in body:
        flags.append("client_event")
    if "CompleteQuest" in body:
        flags.append("complete")
    if "AddItem" in body or "RemoveItem" in body or "AddGil" in body or "AddExp" in body:
        flags.append("reward_or_inventory")
    if "TODO" in body or "FIXME" in body:
        flags.append("todo")
    if "IssueGoobbue" in body:
        flags.append("custom_goobbue")

    if "InitQuestScaffold" in body:
        status = "scaffold"
    elif len(body.strip()) <= 100:
        status = "data_or_stub"
    elif "delegateEvent" in body or "callClientFunction" in body or "runClientFunction" in body:
        status = "handwritten_event_driver"
    elif "CompleteQuest" in body or "StartSequence" in body:
        status = "handwritten_state_driver"
    else:
        status = "present_unknown"

    return (status, len(body.splitlines()), "; ".join(flags))


def aggregate_method_calls(rows: Iterable[dict[str, str]], included: set[str]) -> tuple[dict[str, Counter], dict[tuple[str, str], dict[str, object]]]:
    by_code: dict[str, Counter] = defaultdict(Counter)
    by_method: dict[tuple[str, str], dict[str, object]] = {}

    for row in rows:
        code = norm_code(row.get("script_code", ""))
        if code not in included:
            continue
        method = clean(row.get("method_name", ""))
        key = (code, method)
        item = by_method.setdefault(
            key,
            {
                "call_count": 0,
                "call_families": [],
                "callees": [],
                "cutscene_ids": [],
                "ask_rows": [],
                "mutation_families": [],
            },
        )
        item["call_count"] = int(item["call_count"]) + 1
        for field, target in (
            ("call_family", "call_families"),
            ("callee", "callees"),
            ("cutscene_id", "cutscene_ids"),
            ("ask_row_id", "ask_rows"),
            ("mutation_family", "mutation_families"),
        ):
            value = clean(row.get(field, ""))
            if value:
                item[target].append(value)
                by_code[code][field + ":" + value] += 1
        by_code[code]["call_rows"] += 1
    return by_code, by_method


def aggregate_method_spine(rows: Iterable[dict[str, str]], included: set[str]) -> dict[str, Counter]:
    out: dict[str, Counter] = defaultdict(Counter)
    for row in rows:
        code = norm_code(row.get("script_code", ""))
        if code not in included:
            continue
        out[code]["method_rows"] += 1
        if clean(row.get("after_warp", "")):
            out[code]["after_warp_methods"] += 1
        if clean(row.get("cutscene_ids", "")):
            out[code]["methods_with_cutscene_ids"] += 1
        if clean(row.get("ask_rows", "")):
            out[code]["methods_with_asks"] += 1
        if clean(row.get("mutation_families", "")):
            out[code]["methods_with_mutations"] += 1
    return out


def aggregate_simple(rows: Iterable[dict[str, str]], code_field: str, fields: list[str]) -> dict[str, dict[str, str]]:
    grouped: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        code = norm_code(row.get(code_field, ""))
        if code:
            grouped[code].append(row)
    out: dict[str, dict[str, str]] = {}
    for code, values in grouped.items():
        agg: dict[str, str] = {"row_count": str(len(values))}
        for field in fields:
            agg[field] = join_unique((row.get(field, "") for row in values), limit=30)
        out[code] = agg
    return out


def aggregate_by_evidence_code(rows: Iterable[dict[str, str]], included: set[str], fields: list[str]) -> dict[str, dict[str, str]]:
    grouped: dict[str, list[dict[str, str]]] = defaultdict(list)
    codes_by_length = sorted(included, key=len, reverse=True)
    for row in rows:
        evidence = clean(row.get("evidence", "")).lower().replace("\\", "/")
        for code in codes_by_length:
            if f"/{code}.lua" in evidence:
                grouped[code].append(row)
                break

    out: dict[str, dict[str, str]] = {}
    for code, values in grouped.items():
        agg: dict[str, str] = {"row_count": str(len(values))}
        for field in fields:
            agg[field] = join_unique((row.get(field, "") for row in values), limit=30)
        out[code] = agg
    return out


def aggregate_named_sources(inputs: Inputs, sources: Iterable[tuple[str, Path, str]]) -> dict[str, dict[str, str]]:
    grouped: dict[str, dict[str, object]] = defaultdict(lambda: {"row_count": 0, "sources": []})
    included_codes = {
        norm_code(row.get("code", ""))
        for row in read_csv(inputs.path(QUEST_DIMENSION))
        if include_dimension_row(row)
    }
    source_fields = (
        "logical_path",
        "source_file",
        "source_path",
        "path",
        "local_path",
        "recovered_path",
        "source_script",
        "local_director_path",
        "server_script",
        "server_file",
    )
    for source, path, code_field in sources:
        counts: Counter[str] = Counter()
        for row in read_csv(inputs.path(path)):
            for code in extract_included_codes(
                row,
                included_codes,
                (
                    code_field,
                    "code",
                    "class_name",
                    "inferred_code",
                    "quest_code",
                    "inferred_target_code",
                    "quest_codes",
                    "sheet_name",
                    "key",
                    "sample_key",
                    "normalized_key",
                    "matched_codes",
                    "sample_codes",
                    "sample",
                    "source",
                    "scope",
                    "applies_to",
                ),
                source_fields,
            ):
                counts[code] += 1
        for code, count in counts.items():
            item = grouped[code]
            item["row_count"] = int(item["row_count"]) + count
            item["sources"].append(f"{source}:{count}")

    out: dict[str, dict[str, str]] = {}
    for code, item in grouped.items():
        out[code] = {
            "row_count": str(item["row_count"]),
            "sources": join_unique(item["sources"], limit=30),
        }
    return out


def lpb_surface_sources() -> tuple[tuple[str, Path, str], ...]:
    return (
        ("lpb_method_call_edges", LPB_METHOD_CALL_EDGES, "class_name"),
        ("lpb_bridge_calls_by_method", LPB_BRIDGE_CALLS_BY_METHOD, "class_name"),
        ("lpb_target_system_bridge_calls", LPB_TARGET_SYSTEM_BRIDGE_CALLS, "class_name"),
        ("lpb_method_summaries", LPB_METHOD_SUMMARIES, "class_name"),
        ("lpb_method_ranges", LPB_METHOD_RANGES, "class_name"),
        ("lpb_target_system_method_summaries", LPB_TARGET_SYSTEM_METHOD_SUMMARIES, "class_name"),
        ("lpb_event_protocol_candidates", LPB_EVENT_PROTOCOL_CANDIDATES, "class_name"),
        ("lpb_target_system_event_protocols", LPB_TARGET_SYSTEM_EVENT_PROTOCOLS, "class_name"),
        ("lpb_full_class_methods", LPB_FULL_CLASS_METHODS, "class_name"),
        ("lpb_full_event_entrypoints", LPB_FULL_EVENT_ENTRYPOINTS, "class_name"),
        ("lpb_full_class_inventory", LPB_FULL_CLASS_INVENTORY, "class_name"),
        ("lpb_class_methods", LPB_CLASS_METHODS, "class_name"),
        ("lpb_class_inventory", LPB_CLASS_INVENTORY, "class_name"),
        ("lpb_class_inheritance_graph", LPB_CLASS_INHERITANCE_GRAPH, "class_name"),
        ("lpb_quest_method_timeline", LPB_QUEST_METHOD_TIMELINE, "code"),
        ("lpb_quest_event_calls", LPB_QUEST_EVENT_CALLS, "code"),
        ("lpb_quest_method_context", LPB_QUEST_METHOD_CONTEXT, "code"),
        ("lpb_quest_scene_dialogue_context", LPB_QUEST_SCENE_DIALOGUE_CONTEXT, "code"),
        ("lpb_quest_cutscene_functions", LPB_QUEST_CUTSCENE_FUNCTIONS, "code"),
        ("lpb_server_delegate_flow_context", LPB_SERVER_DELEGATE_FLOW_CONTEXT, "inferred_target_code"),
        ("lpb_server_delegate_method_context", LPB_SERVER_DELEGATE_METHOD_CONTEXT, "inferred_target_code"),
        ("lpb_server_delegate_to_cutscene_join", LPB_SERVER_DELEGATE_TO_CUTSCENE_JOIN, "inferred_target_code"),
        ("lpb_quest_scene_asset_crosscheck", LPB_QUEST_SCENE_ASSET_CROSSCHECK, "quest_codes"),
        ("lpb_quest_scene_key_gaps", LPB_QUEST_SCENE_KEY_GAPS, "quest_codes"),
        ("lpb_local_quest_script_inventory", LPB_LOCAL_QUEST_SCRIPT_INVENTORY, "code"),
        ("lpb_side_world_code_parity", LPB_SIDE_WORLD_CODE_PARITY, "code"),
        ("lpb_recovered_side_world_inventory", LPB_RECOVERED_SIDE_WORLD_INVENTORY, "code"),
        ("lpb_local_side_world_inventory", LPB_LOCAL_SIDE_WORLD_INVENTORY, "code"),
        ("lpb_simplequestbattle_director_inventory", LPB_SIMPLEQUESTBATTLE_DIRECTOR_INVENTORY, "inferred_code"),
        ("lpb_quest_cutscene_hotspots", LPB_QUEST_CUTSCENE_HOTSPOTS, "code"),
        ("lpb_server_delegate_bridge_summary", LPB_SERVER_DELEGATE_BRIDGE_SUMMARY, "inferred_target_code"),
        ("lpb_quest_scene_key_gap_contract", LPB_QUEST_SCENE_KEY_GAP_CONTRACT, "quest_codes"),
        ("lpb_seasonal_script_inventory", LPB_SEASONAL_SCRIPT_INVENTORY, "code"),
        ("lpb_seasonal_replacement_candidates", LPB_SEASONAL_REPLACEMENT_CANDIDATES, "code"),
        ("lpb_local_create_content_area_calls", LPB_LOCAL_CREATE_CONTENT_AREA_CALLS, "quest_code"),
        ("lpb_simplequestbattle_client_overrides", LPB_SIMPLEQUESTBATTLE_CLIENT_OVERRIDES, "inferred_code"),
        ("lpb_simplequestbattle_family_coverage", LPB_SIMPLEQUESTBATTLE_FAMILY_COVERAGE, "sample_codes"),
        ("lpb_simplequestbattle_probe_queue", LPB_SIMPLEQUESTBATTLE_PROBE_QUEUE, "sample_codes"),
        ("lpb_scaffold_config_contract", LPB_SCAFFOLD_CONFIG_CONTRACT, "code"),
        ("lpb_scaffold_replacement_targets", LPB_SCAFFOLD_REPLACEMENT_TARGETS, "code"),
        ("lpb_side_event_bridge_parity", LPB_SIDE_EVENT_BRIDGE_PARITY, "code"),
        ("lpb_scaffold_replacement_plan", LPB_SCAFFOLD_REPLACEMENT_PLAN, "code"),
        ("lpb_recovered_scaffold_scenario", LPB_RECOVERED_SCAFFOLD_SCENARIO, "code"),
        ("lpb_local_scaffold_behavior", LPB_LOCAL_SCAFFOLD_BEHAVIOR, "code"),
        ("lpb_scaffold_local_gap_matrix", LPB_SCAFFOLD_LOCAL_GAP_MATRIX, "sample"),
        ("lpb_scaffold_probe_queue", LPB_SCAFFOLD_PROBE_QUEUE, "sample_codes"),
        ("lpb_side_world_local_gap_matrix", LPB_SIDE_WORLD_LOCAL_GAP_MATRIX, "sample"),
        ("lpb_side_world_probe_queue", LPB_SIDE_WORLD_PROBE_QUEUE, "sample_codes"),
        ("lpb_target_system_text_sheets", LPB_TARGET_SYSTEM_TEXT_SHEETS, "sheet_name"),
        ("lpb_text_sheet_usage_join", LPB_TEXT_SHEET_USAGE_JOIN, "sheet_name"),
        ("lpb_full_text_data_loads", LPB_FULL_TEXT_DATA_LOADS, "sheet_name"),
        ("lpb_text_data_loads", LPB_TEXT_DATA_LOADS, "sheet_name"),
        ("lpb_content_cutscene_key_inventory", LPB_CONTENT_CUTSCENE_KEY_INVENTORY, "key"),
        ("lpb_cutscene_key_crosscheck", LPB_CUTSCENE_KEY_CROSSCHECK, "normalized_key"),
        ("lpb_cutscene_content_family_key_crosscheck", LPB_CUTSCENE_CONTENT_FAMILY_KEY_CROSSCHECK, "normalized_key"),
        ("lpb_loot_list_text_message_contract", LPB_LOOT_LIST_TEXT_MESSAGE_CONTRACT, "source"),
        ("instanced_adapter_hardening_rows", QUEST_INSTANCE_ADAPTER_HARDENING, "applies_to"),
        ("instanced_lane_execution_order_rows", QUEST_INSTANCE_LANE_EXECUTION_ORDER, "scope"),
    )


def local_directors_by_code(rows: Iterable[dict[str, str]], included: set[str]) -> dict[str, dict[str, str]]:
    grouped: dict[str, list[dict[str, str]]] = defaultdict(list)
    codes_by_length = sorted(included, key=len, reverse=True)
    for row in rows:
        director = clean(row.get("director", "")).lower()
        token = director
        for prefix in ("questdirectorevent", "questdirector"):
            if token.startswith(prefix):
                token = token[len(prefix) :]
                break
        code = ""
        for candidate in codes_by_length:
            if token.startswith(candidate):
                code = candidate
                break
        if code:
            grouped[code].append(row)

    out: dict[str, dict[str, str]] = {}
    for code, values in grouped.items():
        out[code] = {
            "row_count": str(len(values)),
            "director": join_unique((row.get("director", "") for row in values), limit=20),
            "path": join_unique((row.get("path", "") for row in values), limit=20),
            "functions": join_unique((row.get("functions", "") for row in values), limit=20),
            "feature_flags": join_unique((row.get("feature_flags", "") for row in values), limit=20),
        }
    return out


def replay_rows_by_code(rows: Iterable[dict[str, str]], included: set[str]) -> tuple[dict[str, list[dict[str, str]]], dict[tuple[str, str], list[dict[str, str]]]]:
    by_code: dict[str, list[dict[str, str]]] = defaultdict(list)
    by_scene: dict[tuple[str, str], list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        codes = [norm_code(code) for code in split_many(row.get("quest_codes", ""))]
        for code in codes:
            if code not in included:
                continue
            by_code[code].append(row)
            scene = clean(row.get("scene_key", ""))
            if scene:
                by_scene[(code, scene.lower())].append(row)
    return by_code, by_scene


def aggregate_cutscene_calls(rows: Iterable[dict[str, str]], included: set[str]) -> dict[tuple[str, str], dict[str, object]]:
    out: dict[tuple[str, str], dict[str, object]] = {}
    for row in rows:
        code = norm_code(row.get("code", ""))
        scene = clean(row.get("scene_key", ""))
        if code not in included or not scene:
            continue
        key = (code, scene.lower())
        item = out.setdefault(
            key,
            {
                "code": code,
                "scene_key": scene,
                "methods": [],
                "launchers": [],
                "call_count": 0,
                "source_files": [],
            },
        )
        item["call_count"] = int(item["call_count"]) + 1
        item["methods"].append(row.get("method", ""))
        item["launchers"].append(row.get("call", ""))
        item["source_files"].append(row.get("source_file", ""))
    return out


def parse_sql_values(line: str) -> list[str]:
    text = line.strip()
    match = SQL_ROW_RE.match(text)
    if not match:
        match = re.match(r"^\s*(?:INSERT|REPLACE)\s+INTO\s+`?[^`\s]+`?(?:\s*\([^)]*\))?\s+VALUES\s*\((.*)\)\s*;?\s*$", text, flags=re.IGNORECASE)
    if not match:
        return []
    inner = match.group(1)
    try:
        return next(csv.reader([inner], quotechar="'", skipinitialspace=True))
    except csv.Error:
        return []


def build_sql_battle_notes(path: Path, titles_by_code: dict[str, str]) -> list[dict[str, object]]:
    title_to_codes: dict[str, list[str]] = defaultdict(list)
    for code, title in titles_by_code.items():
        normalized = clean(title).lower()
        if normalized not in GENERIC_TITLES and len(normalized) >= 6:
            title_to_codes[normalized].append(code)

    rows: list[dict[str, object]] = []
    if not path.exists():
        return rows

    for line_number, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), start=1):
        values = parse_sql_values(line)
        if len(values) < 14:
            continue
        note = clean(values[-1])
        if not note or note.lower() == "none":
            continue
        note_lower = note.lower()
        matched_codes: set[str] = set()
        for title, codes in title_to_codes.items():
            if title in note_lower:
                matched_codes.update(codes)
        for code in sorted(matched_codes):
            rows.append(
                {
                    "source": "server_battlenpc_mob_types_loot.sql",
                    "code": code,
                    "mob_type_id": clean(values[0]),
                    "actor_class_id": clean(values[1]),
                    "display_key": clean(values[2]),
                    "min_level": clean(values[4]) if len(values) > 4 else "",
                    "max_level": clean(values[5]) if len(values) > 5 else "",
                    "status": "sql_note_quest_breadcrumb",
                    "note": note,
                    "recommended_next_action": "treat as battle breadcrumb only; verify spawn trigger, director, win condition, and cleanup before scripting",
                    "source_refs": f"{path}:{line_number}",
                }
            )
    return rows


def classify_inventory(row: dict[str, object]) -> tuple[str, str, int]:
    local_status = str(row.get("local_status", ""))
    category = str(row.get("category", ""))
    scene_count = to_int(row.get("unique_scene_key_count", ""))
    event_rows = to_int(row.get("event_call_rows", ""))
    text_rows = to_int(row.get("joined_text_rows", ""))
    method_rows = to_int(row.get("method_rows", ""))
    mutation_methods = to_int(row.get("methods_with_mutations", ""))
    battle_count = to_int(row.get("battle_candidate_count", ""))
    reward_widgets = to_int(row.get("reward_widget_rows", ""))
    offer_widgets = to_int(row.get("quest_offer_widget_rows", ""))
    content_join = to_int(row.get("content_join_prompt_rows", ""))
    warp_rows = to_int(row.get("event_warp_rows", ""))
    gap_score = min(to_int(row.get("gap_score", "")), 120)

    score = gap_score
    if local_status == "missing":
        score += 100
    elif local_status in {"scaffold", "data_or_stub"}:
        score += 80
    elif local_status == "present_unknown":
        score += 40
    else:
        score += 15
    if scene_count:
        score += 20
    if event_rows or text_rows:
        score += 10
    if method_rows > 5:
        score += 10
    if battle_count:
        score += 30
    if category == "seasonal":
        score += 12
    if mutation_methods or reward_widgets or content_join or warp_rows:
        score += 12

    if battle_count and local_status in {"missing", "scaffold", "data_or_stub"}:
        return ("battle_candidate_needs_director_probe", "verify fight spawn/lifetime before Lua enablement", score)
    if scene_count and local_status in {"missing", "scaffold", "data_or_stub"}:
        return ("cutscene_route_candidate", "probe recovered scene delegates and map safe helper payloads", score)
    if mutation_methods or reward_widgets:
        return ("reward_or_item_flow_risk", "audit reward/item mutation and duplicate grant behavior before wiring", score)
    if content_join or warp_rows:
        return ("content_or_warp_flow_risk", "recover content join/warp owner and completion semantics", score)
    if category == "seasonal" and local_status in {"missing", "scaffold", "data_or_stub"}:
        return ("seasonal_script_candidate", "compare recovered seasonal methods with local event gate helpers", score)
    if local_status == "missing":
        return ("missing_local_script_candidate", "create scaffold/probe script from recovered method index", score)
    if local_status in {"scaffold", "data_or_stub"} and (event_rows or text_rows):
        return ("dialogue_or_talk_candidate", "safe dialogue/event delegate probe candidate", score)
    if local_status.startswith("handwritten"):
        return ("implemented_driver_audit", "audit current handwritten route against recovered method index", score)
    return ("data_inventory", "keep as indexed evidence until a narrower pass needs it", score)


def build_inventory(inputs: Inputs) -> tuple[list[dict[str, object]], dict[str, dict[str, object]]]:
    dimension_rows = [row for row in read_csv(inputs.path(QUEST_DIMENSION)) if include_dimension_row(row)]
    included = {norm_code(row.get("code", "")) for row in dimension_rows if norm_code(row.get("code", ""))}

    parity_by_code = rows_by_code(read_csv(inputs.path(PARITY)))
    recovered_by_code = rows_by_code(read_csv(inputs.path(RECOVERED_INVENTORY)))
    cutscene_by_code = rows_by_code(read_csv(inputs.path(CUTSCENE_SUMMARY)))
    event_by_code = rows_by_code(read_csv(inputs.path(EVENT_SUMMARY)))
    text_by_code = rows_by_code(read_csv(inputs.path(TEXT_SUMMARY)))
    server_by_code = rows_by_code(read_csv(inputs.path(SERVER_FLOW_SUMMARY)))
    method_spine_rows = read_csv(inputs.path(METHOD_SPINE))
    method_call_rows = read_csv(inputs.path(METHOD_CALLS))
    method_counts = aggregate_method_spine(method_spine_rows, included)
    call_counts, _method_calls = aggregate_method_calls(method_call_rows, included)
    rewards = aggregate_simple(read_csv(inputs.path(QUEST_REWARDS)), "code", ["rewardType", "rewardId", "source", "autoGrant"])
    markers = aggregate_simple(read_csv(inputs.path(QUEST_MARKERS)), "code", ["marker_id", "display_name_id", "map_group", "map_id"])
    actors = aggregate_simple(read_csv(inputs.path(QUEST_ACTORS)), "code", ["actor_class_id", "display_name_id", "flag_expr", "actor_surface_gap"])
    bnpc_objectives = aggregate_simple(
        read_csv(inputs.path(QUEST_BNPC_OBJECTIVES)),
        "code",
        ["objective_constant", "actor_class_id", "objective_item_id", "bnpc_id", "materialization_status", "confidence"],
    )
    spawn_points = aggregate_simple(
        read_csv(inputs.path(QUEST_SPAWN_POINTS)),
        "code",
        ["actor_class_id", "bnpc_id", "spawn_surface", "zone_name", "needs_capture"],
    )
    bnpc_spawns = aggregate_simple(read_csv(inputs.path(BNPC_SPAWNS)), "quest_code", ["constant", "actor_class_id", "bnpc_type_ids", "status", "mob_display_names"])
    bnpc_material = aggregate_simple(read_csv(inputs.path(BNPC_MATERIALIZATION)), "code", ["actor_class_id", "existing_bnpc_type_ids", "candidate_status", "recommended_next_action"])
    execution = aggregate_simple(read_csv(inputs.path(QUEST_EXECUTION_SUMMARY)), "code", ["priority_reason", "scene_keys", "missing_local_scene_event_rows"])
    scene_push = aggregate_simple(read_csv(inputs.path(QUEST_SCENE_PUSH_MAP)), "code", ["push_recipe", "risk_notes", "scene_keys"])
    runtime_workqueue = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_WORKQUEUE)), "subject", ["runtime_lane", "target", "mutation_policy"])
    cutscene_runtime = aggregate_simple(read_csv(inputs.path(QUEST_CUTSCENE_RUNTIME_PLAN)), "code", ["probe_lane", "scene_keys", "candidate_command"])
    fight_runtime = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_RUNTIME_PLAN)), "code", ["fight_lane", "smoke_command", "materialization_step"])
    enablement_safety = aggregate_simple(read_csv(inputs.path(QUEST_ENABLEMENT_SAFETY)), "code", ["safety_class", "enablement_action", "gate_key", "fight_or_content_risk"])
    safe_push = aggregate_simple(read_csv(inputs.path(QUEST_SAFE_PUSH_ENABLEMENT)), "code", ["push_enablement_class", "recommended_action", "blocker_notes", "reward_lock_status"])
    roadmap = aggregate_simple(read_csv(inputs.path(QUEST_IMPLEMENTATION_ROADMAP)), "code", ["lane", "status", "recommended_action", "blocker"])
    push_ops = aggregate_simple(read_csv(inputs.path(QUEST_PUSH_OPERATORS)), "subject", ["operator_lane", "current_status", "risk_class", "data_needed"])
    push_deps = aggregate_simple(read_csv(inputs.path(QUEST_PUSH_DEPENDENCIES)), "code", ["next_best_operator_step", "risk_class", "missing_commands"])
    local_constants = aggregate_simple(read_csv(inputs.path(QUEST_LOCAL_CONSTANTS)), "code", ["constant", "value", "actor_class_path"])
    local_delegate_push = aggregate_simple(read_csv(inputs.path(QUEST_LOCAL_DELEGATE_PUSH_CALLS)), "target_code", ["call_kind", "event_method", "match_kind", "risk_notes"])
    local_enpc = aggregate_simple(read_csv(inputs.path(QUEST_LOCAL_ENPC_BINDINGS)), "code", ["actor_expr", "actor_class_id", "flag_expr"])
    unmatched_delegate = aggregate_simple(read_csv(inputs.path(QUEST_UNMATCHED_DELEGATE_CALLS)), "target_code", ["call_kind", "event_method", "risk_notes"])
    local_lifecycle = aggregate_simple(read_csv(inputs.path(QUEST_LOCAL_EVENT_LIFECYCLE)), "code", ["action", "function"])
    cutscene_arguments = aggregate_simple(read_csv(inputs.path(QUEST_CUTSCENE_ARGUMENTS)), "code", ["argument_shape", "required_runtime_args", "patch_class", "blocker_notes"])
    route_owners = aggregate_simple(read_csv(inputs.path(QUEST_ROUTE_OWNERS)), "code", ["route_owner_resolution_status", "inferred_actor_class_id", "confidence_class"])
    payload_atlas = aggregate_simple(read_csv(inputs.path(QUEST_PAYLOAD_ATLAS)), "code", ["payload_status", "probe_wave", "argument_shape", "patch_gate"])
    payload_probes = aggregate_simple(read_csv(inputs.path(QUEST_PAYLOAD_PROBE_QUEUE)), "code", ["probe_lane", "payload_to_capture", "pass_condition"])
    eventupdate_proofs = aggregate_simple(read_csv(inputs.path(QUEST_EVENTUPDATE_PROOF_QUEUE)), "code", ["proof_status", "probe_lane", "tuple_pass_condition"])
    after_warp_proofs = aggregate_simple(read_csv(inputs.path(QUEST_AFTER_WARP_PROOF_QUEUE)), "code", ["proof_status", "payload_status", "pass_condition"])
    blocked_owner = aggregate_simple(read_csv(inputs.path(QUEST_BLOCKED_OWNER_QUEUE)), "code", ["recoverability", "mutation_policy", "blocker_notes"])
    fight_readiness = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_READINESS)), "code", ["fight_lane", "blocking_gaps", "implementation_hint"])
    fight_return = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_RETURN_REWARD)), "code", ["reward_lock_status", "safe_to_enable_rewards", "next_fix"])
    fight_kill = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_KILL_ROUTE)), "code", ["route_status", "next_fix", "strict_kill_route_reachable"])
    blueprints = aggregate_simple(read_csv(inputs.path(QUEST_BLUEPRINT_WORKQUEUE)), "subject", ["blueprint_lane", "disposition", "implementation_step"])
    sequence_blueprints = aggregate_simple(read_csv(inputs.path(QUEST_RETAIL_SEQUENCE_BLUEPRINTS)), "code", ["blocker_type", "likely_owner", "no_mutation_probe"])
    contract_rows = aggregate_simple(read_csv(inputs.path(QUEST_CUTSCENE_PUSH_CONTRACTS)), "code", ["contract_class", "contract_readiness", "recommended_action"])
    scaffold_contract_rows = aggregate_simple(read_csv(inputs.path(QUEST_TEMPLATE_SCAFFOLD_PUSH_CONTRACTS)), "code", ["contract_class", "contract_readiness", "recommended_action"])
    safe_patch_contract_rows = aggregate_simple(read_csv(inputs.path(QUEST_SAFE_CUTSCENE_PATCH_CONTRACTS)), "code", ["contract_class", "contract_readiness", "recommended_action"])
    snpc_contract_rows = aggregate_simple(read_csv(inputs.path(QUEST_SNPC_PAYLOAD_PROBE_CONTRACTS)), "code", ["contract_class", "contract_readiness", "recommended_action"])
    manual_contract_rows = aggregate_simple(read_csv(inputs.path(QUEST_MANUAL_ROUTE_RECOVERY_CONTRACTS)), "code", ["contract_class", "contract_readiness", "recommended_action"])
    director_notice_rows = aggregate_simple(read_csv(inputs.path(QUEST_DIRECTOR_NOTICE_CONTRACTS)), "code", ["contract_class", "contract_readiness", "recommended_action"])
    push_recipe_rows = aggregate_simple(read_csv(inputs.path(QUEST_CUTSCENE_PUSH_RECIPES)), "code", ["implementation_recipe", "recommended_next_step", "push_safety"])
    push_impl_rows = aggregate_simple(read_csv(inputs.path(QUEST_PUSH_IMPLEMENTATION_QUEUE)), "code", ["implementation_recipe", "recommended_next_step", "push_safety"])
    owner_probe_rows = aggregate_simple(read_csv(inputs.path(QUEST_OWNER_PROBE_QUEUE)), "code", ["probe_wave", "owner_resolution_status", "probe_command"])
    method_probe_rows = aggregate_simple(read_csv(inputs.path(QUEST_CUTSCENE_METHOD_PROBE_RECIPES)), "script_code", ["payload_status", "safe_to_execute", "data_needed"])
    runtime_triage_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_TRIAGE)), "script_code", ["triage_status", "action_lane", "runtime_command"])
    runtime_scaffold_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_SCAFFOLD)), "script_code", ["probe_status", "recommended_lane", "required_runtime_command"])
    runtime_exact_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_EXACT_HAZARD)), "script_code", ["hazard_status", "safety_class", "safe_action"])
    runtime_snpc_a8_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_SNPC_A8)), "code", ["a8_meaning_status", "proof_status", "probe_command"])
    runtime_sqb_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_SQB_PRIVATE)), "code", ["proof_status", "static_status", "probe_command"])
    runtime_world_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_WORLD_BNPC)), "code", ["safe_status", "materialization_step", "smoke_command"])
    runtime_requested_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_REQUESTED_PROOF)), "code", ["gap_lane", "proof_status", "primary_next_action"])
    runtime_wave2_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_WAVE2)), "code", ["lane", "target", "command"])
    runtime_safe_smoke_rows = aggregate_simple(read_csv(inputs.path(QUEST_RUNTIME_UNLOCK_SAFE_SMOKE)), "code", ["safety_class", "push_enablement_class", "recommended_action"])
    runtime_extra_rows = aggregate_named_sources(
        inputs,
        (
            ("non_en_missing_recovered_delegate_queue", QUEST_RUNTIME_UNLOCK_MISSING_DELEGATE, "script_code"),
            ("non_en_exact_delegate_smoke_queue", QUEST_RUNTIME_UNLOCK_EXACT_SMOKE, "script_code"),
            ("first_live_runtime_probe_wave", QUEST_RUNTIME_UNLOCK_FIRST_LIVE, "subject"),
            ("first_payload_probe_wave", QUEST_RUNTIME_UNLOCK_FIRST_PAYLOAD, "subject"),
            ("first_probe_wave", QUEST_RUNTIME_UNLOCK_FIRST_PROBE, "subject"),
            ("cutscene_alias_unlock_review", QUEST_RUNTIME_UNLOCK_ALIAS_UNLOCK, "code"),
            ("cutscene_alias_deferred_review", QUEST_RUNTIME_UNLOCK_ALIAS_DEFERRED, "code"),
            ("eventupdate_tuple_probe_queue", QUEST_RUNTIME_UNLOCK_EVENTUPDATE_TUPLE, "code"),
            ("elevator_cutscene_probe_queue", QUEST_RUNTIME_UNLOCK_ELEVATOR, "code"),
            ("world_bnpc_callback_deferred_queue", QUEST_RUNTIME_UNLOCK_WORLD_BNPC_DEFERRED, "code"),
        ),
    )
    instance_local_rows = aggregate_simple(read_csv(inputs.path(QUEST_INSTANCE_LOCAL_SEQUENCE)), "code", ["lane", "action_kind", "risk_class"])
    instance_event_rows = aggregate_simple(read_csv(inputs.path(QUEST_INSTANCE_EVENT_METHODS)), "code", ["lane", "method_role", "adapter_status"])
    instance_scene_rows = aggregate_simple(read_csv(inputs.path(QUEST_INSTANCE_OWNER_SCENES)), "code", ["lane", "method_kind", "nq_calls"])
    instance_hint_rows = aggregate_simple(read_csv(inputs.path(QUEST_INSTANCE_OWNER_HINTS)), "code", ["lane", "owner_resolution_status", "inferred_owner_hint"])
    instance_text_rows = aggregate_simple(read_csv(inputs.path(QUEST_INSTANCE_METHOD_TEXT)), "code", ["lane", "text_clue_tags", "text_snippets"])
    instance_clue_rows = aggregate_simple(read_csv(inputs.path(QUEST_INSTANCE_TEXT_CLUES)), "code", ["lane", "clue_tags", "snippet"])
    instance_runtime_rows = aggregate_named_sources(
        inputs,
        (
            ("totorak_cutscene_flow_rows", QUEST_INSTANCE_TOTORAK_FLOW, "code"),
            ("recovered_client_event_method_rows", QUEST_INSTANCE_RECOVERED_CLIENT_EVENTS, "code"),
            ("local_event_call_rows", QUEST_INSTANCE_LOCAL_EVENT_CALLS, "code"),
            ("local_delegate_payload_rows", QUEST_INSTANCE_LOCAL_DELEGATE_PAYLOAD, "code"),
            ("alias_payload_reconciliation_rows", QUEST_INSTANCE_ALIAS_PAYLOAD_RECONCILIATION, "code"),
            ("local_actor_usage_rows", QUEST_INSTANCE_LOCAL_ACTOR_USAGE, "code"),
            ("scene_owner_reconciliation_rows", QUEST_INSTANCE_SCENE_OWNER_RECONCILIATION, "code"),
            ("sequence_owner_reconciliation_rows", QUEST_INSTANCE_SEQUENCE_OWNER_RECONCILIATION, "code"),
            ("local_delegate_transition_rows", QUEST_INSTANCE_LOCAL_DELEGATE_TRANSITION, "code"),
            ("recovered_payload_branch_rows", QUEST_INSTANCE_RECOVERED_PAYLOAD_BRANCH, "code"),
            ("per_callsite_runtime_probe_rows", QUEST_INSTANCE_CALLSITE_RUNTIME_PROBE, "code"),
            ("cutscene_return_state_rows", QUEST_INSTANCE_CUTSCENE_RETURN_STATE, "code"),
            ("owner_hazard_rows", QUEST_INSTANCE_OWNER_HAZARD, "code"),
            ("event_lifecycle_hazard_rows", QUEST_INSTANCE_LIFECYCLE_HAZARD, "code"),
            ("gc_tail_recovered_scenario_methods", QUEST_INSTANCE_GC_TAIL_RECOVERED, "code"),
            ("runtime_probe_playbook_rows", QUEST_INSTANCE_RUNTIME_PLAYBOOK, "code"),
            ("per_quest_next_action_rows", QUEST_INSTANCE_NEXT_ACTION, "code"),
            ("per_quest_event_contract_rows", QUEST_INSTANCE_EVENT_CONTRACT, "code"),
            ("reward_boundary_rows", QUEST_INSTANCE_REWARD_BOUNDARY, "code"),
            ("local_handler_contract_rows", QUEST_INSTANCE_HANDLER_CONTRACT, "code"),
            ("adapter_gate_rows", QUEST_INSTANCE_ADAPTER_GATE, "code"),
            ("battle_adapter_quest_rows", QUEST_INSTANCE_BATTLE_ADAPTER, "code"),
            ("sqb_director_recovery_rows", QUEST_INSTANCE_SQB_DIRECTOR_RECOVERY, "code"),
            ("sqb_blocked_followup_rows", QUEST_INSTANCE_SQB_BLOCKED_FOLLOWUP, "code"),
            ("sqb_shell_gap_rows", QUEST_INSTANCE_SQB_SHELL_GAP, "code"),
            ("alias_actor_multiplicity_rows", QUEST_INSTANCE_ALIAS_ACTOR_MULTIPLICITY, "code"),
            ("alias_reconciliation_rows", QUEST_INSTANCE_ALIAS_RECONCILIATION, "code"),
            ("recovered_focus_rows", QUEST_INSTANCE_RECOVERED_FOCUS, "code"),
            ("event_owner_candidate_rows", QUEST_INSTANCE_EVENT_OWNER_CANDIDATE, "code"),
            ("gc_tail_recovery_rows", QUEST_INSTANCE_GC_TAIL_RECOVERY, "code"),
            ("gc_target_hint_rows", QUEST_INSTANCE_GC_TARGET_HINT, "code"),
            ("gc_recovered_owner_gap_rows", QUEST_INSTANCE_GC_RECOVERED_OWNER_GAP, "code"),
            ("payload_smoke_matrix_rows", QUEST_INSTANCE_PAYLOAD_SMOKE_MATRIX, "code"),
            ("totorak_quest_sequence_rows", QUEST_INSTANCE_TOTORAK_SEQUENCE, "code"),
            ("sqb_spawn_probe_cases", QUEST_INSTANCE_SQB_SPAWN_PROBE_CASES, "code"),
            ("spawn_ready_probe_rows", QUEST_INSTANCE_SPAWN_READY_PROBE, "code"),
            ("gc_tail_monster_hint_rows", QUEST_INSTANCE_GC_TAIL_MONSTER_HINT, "code"),
            ("actor_data_blocker_rows", QUEST_INSTANCE_ACTOR_DATA_BLOCKER, "code"),
            ("instanced_per_quest_action_queue", QUEST_INSTANCE_PER_QUEST_ACTION_QUEUE, "code"),
        ),
    )
    starter_signal_rows = aggregate_simple(read_csv(inputs.path(STARTER_CLIENT_SIGNAL_ROWS)), "code", ["signal_kind", "scene_key", "widget"])
    starter_method_rows = aggregate_simple(read_csv(inputs.path(STARTER_CLIENT_METHOD_SUMMARY)), "code", ["method", "scene_keys", "widgets"])
    starter_sequence_rows = aggregate_simple(read_csv(inputs.path(STARTER_SEQUENCE_FLOW_ROWS)), "code", ["phase", "client_anchor", "expected_state"])
    starter_fight_rows = aggregate_simple(read_csv(inputs.path(STARTER_FIGHT_ROUTE_MATRIX)), "code", ["route_status", "next_fix", "objective_actor"])
    starter_probe_rows = aggregate_simple(read_csv(inputs.path(STARTER_RUNTIME_PROBE_CHECKLIST)), "code", ["check", "expected_anchor"])
    starter_detail_rows = aggregate_named_sources(
        inputs,
        (
            ("local_constant_rows", STARTER_LOCAL_CONSTANT_ROWS, "code"),
            ("client_method_body_extracts", STARTER_CLIENT_METHOD_BODIES, "code"),
            ("client_dialogue_rows", STARTER_CLIENT_DIALOGUE_ROWS, "code"),
            ("transition_action_rows", STARTER_TRANSITION_ACTION_ROWS, "code"),
            ("source_to_client_method_rows", STARTER_SOURCE_TO_CLIENT_METHOD_ROWS, "code"),
            ("source_delegate_call_rows", STARTER_SOURCE_DELEGATE_CALL_ROWS, "code"),
            ("flag_usage_rows", STARTER_FLAG_USAGE_ROWS, "code"),
            ("server_delegate_surface", STARTER_SERVER_DELEGATE_SURFACE, "code"),
            ("delegate_push_call_rows", STARTER_DELEGATE_PUSH_CALL_ROWS, "code"),
            ("dat_marker_rows", STARTER_DAT_MARKER_ROWS, "code"),
            ("actor_surface_rows", STARTER_ACTOR_SURFACE_ROWS, "code"),
            ("lifecycle_action_rows", STARTER_LIFECYCLE_ACTION_ROWS, "code"),
            ("function_skeleton_rows", STARTER_FUNCTION_SKELETON_ROWS, "code"),
            ("probe_commands", STARTER_PROBE_COMMANDS, "code"),
            ("local_marker_constants", STARTER_LOCAL_MARKER_CONSTANTS, "code"),
            ("content_spawn_rows", STARTER_CONTENT_SPAWN_ROWS, "code"),
            ("marker_condition_rows", STARTER_MARKER_CONDITION_ROWS, "code"),
            ("content_spawn_atlas_rows", STARTER_CONTENT_SPAWN_ATLAS_ROWS, "code"),
            ("replay_scene_rows", STARTER_REPLAY_SCENE_ROWS, "code"),
            ("choice_gate_rows", STARTER_CHOICE_GATE_ROWS, "code"),
            ("counter_usage_rows", STARTER_COUNTER_USAGE_ROWS, "code"),
            ("quest_summary", STARTER_QUEST_SUMMARY, "code"),
            ("objective_crosscheck_rows", STARTER_OBJECTIVE_CROSSCHECK_ROWS, "code"),
            ("reward_rows", STARTER_REWARD_ROWS, "code"),
        ),
    )
    execution_addendum_rows = aggregate_named_sources(
        inputs,
        (
            ("questdelegate_payload_execution_queue", QUEST_PAYLOAD_EXECUTION_QUEUE, "code"),
            ("after_warp_lifetime_payload_queue", QUEST_AFTER_WARP_LIFETIME_PAYLOAD_QUEUE, "code"),
            ("after_warp_push_queue", QUEST_AFTER_WARP_PUSH_QUEUE, "code"),
            ("content_launch_calls", QUEST_CONTENT_LAUNCH_CALLS, "script_code"),
            ("quest_cutscene_route_summary", QUEST_CUTSCENE_ROUTE_SUMMARY, "code"),
            ("quest_execution_priority_queue", QUEST_EXECUTION_PRIORITY_QUEUE, "code"),
            ("scaffold_cutscene_seed_queue", QUEST_SCAFFOLD_CUTSCENE_SEED_QUEUE, "script_code"),
            ("scaffold_owner_only_queue", QUEST_SAFE_PUSH_SCAFFOLD_OWNER_ONLY, "code"),
            ("blocked_owner_selector_attempt_matrix", QUEST_BLOCKED_OWNER_SELECTOR_MATRIX, "code"),
            ("current_class_scaffold_enrichment", QUEST_CLASS_SCAFFOLD_ENRICHMENT, "code"),
            ("push_probe_workqueue", QUEST_DEEP_PUSH_WORKQUEUE, "subject"),
            ("cutscene_call_templates", QUEST_DEEP_CUTSCENE_TEMPLATES, "code"),
            ("snpc_argument_probe_queue", QUEST_SNPC_ARGUMENT_PROBE_QUEUE, "code"),
            ("snpc_a8_branch_semantics_queue", QUEST_RUNTIME_SNPC_A8_SEMANTICS, "code"),
            ("snpc_payload_capture_queue", QUEST_SNPC_PAYLOAD_CAPTURE_QUEUE, "code"),
            ("fight_materialization_recipes", QUEST_FIGHT_MATERIALIZATION_RECIPES, "code"),
            ("quest_implementation_top25", QUEST_ROADMAP_TOP25, "code"),
            ("world_bnpc_materialization_candidates", QUEST_WORLD_BNPC_MATERIALIZATION, "code"),
            ("manual_recovery_queue", QUEST_SAFE_PUSH_MANUAL_RECOVERY, "code"),
            ("targeted_smoke_queue", QUEST_SAFE_PUSH_TARGETED_SMOKE, "code"),
            ("cutscene_alias_callsite_blueprints", QUEST_CUTSCENE_ALIAS_BLUEPRINTS, "code"),
            ("fight_priority_payload_seed_rows", QUEST_FIGHT_PRIORITY_PAYLOAD_SEED, "code"),
            ("retail_sequence_runtime_probe_plan", QUEST_RETAIL_SEQUENCE_RUNTIME_PLAN, "code"),
            ("dat_backed_applied_this_pass", QUEST_REWARD_DAT_APPLIED, "code"),
            ("local_content_area_launches", QUEST_LOCAL_CONTENT_AREA_LAUNCHES, "code"),
            ("after_warp_priority_seed_rows", QUEST_AFTER_WARP_PRIORITY_SEED, "code"),
            ("blocked_bnpc_actor_recovery_queue", QUEST_BLOCKED_BNPC_ACTOR_RECOVERY, "code"),
            ("after_warp_lifetime_seed_queue", QUEST_AFTER_WARP_LIFETIME_SEED, "code"),
            ("director_event_push_requirements", QUEST_DIRECTOR_EVENT_PUSH_REQUIREMENTS, "code"),
            ("scene_key_delegate_aliases", QUEST_SCENE_KEY_DELEGATE_ALIASES, "code"),
            ("alias_patch_plan", QUEST_ALIAS_PATCH_PLAN, "code"),
            ("sqb_private_mob_sql_blueprints", QUEST_SQB_PRIVATE_MOB_SQL_BLUEPRINTS, "code"),
            ("fight_helper_priority_seed_rows", QUEST_FIGHT_HELPER_PRIORITY_SEED, "code"),
            ("sqb_first_slice_queue", QUEST_SQB_FIRST_SLICE_QUEUE, "code"),
            ("sqbprivate_command_blueprints", QUEST_SQBPRIVATE_COMMAND_BLUEPRINTS, "code"),
            ("retail_blocker_blueprints", QUEST_RETAIL_BLOCKER_BLUEPRINTS, "code"),
            ("curated_blocker_reviews", QUEST_CURATED_BLOCKER_REVIEWS, "code"),
            ("job_metadata_enrichment_notes", QUEST_JOB_METADATA_ENRICHMENT, "code"),
            ("fight_content_lifecycle_join", QUEST_FIGHT_CONTENT_LIFECYCLE, "code"),
            ("sqb_materialization_gap_queue", QUEST_SQB_MATERIALIZATION_GAP, "code"),
            ("sqb_materialization_candidates", QUEST_SQB_MATERIALIZATION_CANDIDATES, "code"),
            ("non_en_scene_alias_payload_hazard_queue", QUEST_SCENE_ALIAS_PAYLOAD_HAZARD, "script_code"),
            ("scene_alias_patch_candidates", QUEST_SCENE_ALIAS_PATCH_CANDIDATES, "script_code"),
            ("blocked_owner_candidate_seed_rows", QUEST_BLOCKED_OWNER_CANDIDATE_SEED, "code"),
            ("owner_probe_addendum", QUEST_OWNER_PROBE_ADDENDUM, "code"),
            ("blocked_sqb_actor_recovery_queue", QUEST_BLOCKED_SQB_ACTOR_RECOVERY, "code"),
        ),
    )
    lpb_surface_rows = aggregate_named_sources(inputs, lpb_surface_sources())
    seasonal_item_rows = aggregate_simple(read_csv(inputs.path(SEASONAL_QUEST_ITEM_SURFACE)), "code", ["event_bucket", "related_item_ids"])
    seasonal_atlas_item_rows = aggregate_by_evidence_code(read_csv(inputs.path(SEASONAL_ITEM_ATLAS)), included, ["event_bucket", "item_id", "name", "unlock_state"])
    local_cutscene_delegates = aggregate_simple(read_csv(inputs.path(QUEST_LOCAL_CUTSCENE_DELEGATES)), "script_code", ["delegate_kind", "method_arg", "extra_args"])
    local_delegate_event_callers = aggregate_simple(read_csv(inputs.path(QUEST_LOCAL_DELEGATE_EVENT_CALLERS)), "script_code", ["event_method", "call_kind", "function"])
    recovered_cutscene_matrix = aggregate_simple(read_csv(inputs.path(QUEST_RECOVERED_CUTSCENE_PUSH_MATRIX)), "script_code", ["push_status", "scene_family", "recommended_probe"])
    cutscene_template_candidates = aggregate_simple(read_csv(inputs.path(QUEST_CUTSCENE_PUSH_TEMPLATE_CANDIDATES)), "script_code", ["template_class", "push_status", "candidate_push_template"])
    cutscene_gap_workqueue = aggregate_simple(read_csv(inputs.path(QUEST_CUTSCENE_IMPLEMENTATION_GAP_WORKQUEUE)), "script_code", ["push_status", "recommended_probe", "mutation_policy"])
    script_cutscene_gap = aggregate_simple(read_csv(inputs.path(QUEST_SCRIPT_CUTSCENE_GAP_SUMMARY)), "script_code", ["status_summary", "next_action", "method_samples"])
    scene_bearing_needing_push = aggregate_simple(read_csv(inputs.path(QUEST_SCENE_BEARING_EVENTS_NEEDING_LOCAL_PUSH)), "code", ["push_recipe", "risk_notes", "scene_keys"])
    after_warp_cutscene_events = aggregate_simple(read_csv(inputs.path(QUEST_AFTER_WARP_CUTSCENE_EVENTS)), "code", ["push_recipe", "risk_notes", "scene_keys"])
    blocker_method_focus = aggregate_simple(read_csv(inputs.path(QUEST_BLOCKER_METHOD_SPINE_FOCUS)), "script_code", ["blocker_type", "owner_hint", "method_name"])
    route_owner_patch_focus = aggregate_simple(read_csv(inputs.path(QUEST_ROUTE_OWNER_PATCH_FOCUS)), "code", ["route_owner_resolution_status", "recommended_patch_action", "blocker_notes"])
    local_mutators = aggregate_simple(read_csv(inputs.path(QUEST_LOCAL_MUTATOR_SCAN)), "code", ["direct_mutator_count", "has_direct_state_mutator", "template_mutators"])
    reward_display_sync = aggregate_simple(read_csv(inputs.path(QUEST_REWARD_DISPLAY_SYNC_SCAN)), "code", ["status", "recommended_next_step", "confidence"])
    reward_display_dat_patch = aggregate_simple(read_csv(inputs.path(QUEST_REWARD_DISPLAY_DAT_PATCH)), "code", ["status", "recommended_next_step", "confidence"])
    reward_display_wiki = aggregate_simple(read_csv(inputs.path(QUEST_REWARD_DISPLAY_WIKI_REVIEW)), "code", ["status", "recommended_next_step", "confidence"])
    addendum_enrichment = aggregate_simple(read_csv(inputs.path(QUEST_ADDENDUM_ENRICHMENT_QUEUE)), "code", ["recommended_lane", "recommended_next_step", "blockers"])
    addendum_reward_sync = aggregate_simple(read_csv(inputs.path(QUEST_ADDENDUM_REWARD_SYNC)), "code", ["patch_policy", "implementation_status", "reward_source"])
    addendum_existing_bnpc = aggregate_simple(read_csv(inputs.path(QUEST_ADDENDUM_EXISTING_BNPC)), "code", ["status", "safe_policy", "zone_summary"])
    addendum_private_bnpc = aggregate_simple(read_csv(inputs.path(QUEST_ADDENDUM_PRIVATE_BNPC)), "code", ["candidate_status", "suggested_spawn_surface", "safe_policy"])
    sqb_targets = aggregate_simple(read_csv(inputs.path(QUEST_SIMPLEQUESTBATTLE_TARGETS)), "code", ["director", "implementation_hint", "bnpc_actor_class_ids"])
    sqb_adapters = aggregate_simple(read_csv(inputs.path(QUEST_SQB_ADAPTER_ROWS)), "code", ["adapter_status", "recommended_next_step", "blockers"])
    fight_sqb_ops = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_SQB_PUSH_OPERATORS)), "code", ["operator_lane", "risk_class", "next_probe"])
    sqb_cutscene_deps = aggregate_simple(read_csv(inputs.path(QUEST_SQB_CUTSCENE_DEPENDENCIES)), "code", ["adapter_status", "missing_cutscene", "recommended_next_step"])
    sqb_reward_locked = aggregate_simple(read_csv(inputs.path(QUEST_SQB_REWARD_LOCKED)), "code", ["reward_lock_status", "safe_to_enable_rewards", "recommended_action"])
    fight_actor_mob_spawn = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_ACTOR_MOB_SPAWN)), "code", ["materialization_status", "next_fix", "zone_summary"])
    fight_payload_probe = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_PAYLOAD_PROBE)), "code", ["payload_status", "materialization_status", "next_fix"])
    fight_reward_lock_proof = aggregate_simple(read_csv(inputs.path(QUEST_FIGHT_REWARD_LOCK_PROOF)), "code", ["proof_status", "blockers", "reward_lock_capture"])
    recovered_directors = aggregate_simple(read_csv(inputs.path(RECOVERED_DIRECTORS)), "inferred_code", ["director", "variant", "function_count", "feature_flags"])
    local_directors = local_directors_by_code(read_csv(inputs.path(LOCAL_DIRECTORS)), included)
    replay_by_code, _replay_by_scene = replay_rows_by_code(read_csv(inputs.path(CUTREPLAY_ROWS)), included)

    titles_by_code = {norm_code(row.get("code", "")): clean(row.get("quest_name", "")) for row in dimension_rows}
    sql_battles = build_sql_battle_notes(inputs.path(BNPC_LOOT_SQL), titles_by_code)
    sql_battles_by_code = list_rows_by_code(sql_battles, "code")

    rows: list[dict[str, object]] = []
    by_code: dict[str, dict[str, object]] = {}
    for dim in sorted(dimension_rows, key=lambda item: (item.get("category", ""), item.get("code", ""))):
        code = norm_code(dim.get("code", ""))
        if not code:
            continue
        parity = parity_by_code.get(code, {})
        recovered = recovered_by_code.get(code, {})
        cutscene = cutscene_by_code.get(code, {})
        event = event_by_code.get(code, {})
        text = text_by_code.get(code, {})
        server = server_by_code.get(code, {})
        method_counter = method_counts.get(code, Counter())
        call_counter = call_counts.get(code, Counter())
        reward = rewards.get(code, {})
        marker = markers.get(code, {})
        actor = actors.get(code, {})
        bnpc_objective = bnpc_objectives.get(code, {})
        spawn_point = spawn_points.get(code, {})
        bnpc = bnpc_spawns.get(code, {})
        material = bnpc_material.get(code, {})
        execution_row = execution.get(code, {})
        scene_push_row = scene_push.get(code, {})
        runtime_row = runtime_workqueue.get(code, {})
        cutscene_runtime_row = cutscene_runtime.get(code, {})
        fight_runtime_row = fight_runtime.get(code, {})
        enablement_row = enablement_safety.get(code, {})
        safe_push_row = safe_push.get(code, {})
        roadmap_row = roadmap.get(code, {})
        push_op = push_ops.get(code, {})
        push_dep = push_deps.get(code, {})
        local_constant = local_constants.get(code, {})
        local_delegate = local_delegate_push.get(code, {})
        local_enpc_row = local_enpc.get(code, {})
        unmatched_delegate_row = unmatched_delegate.get(code, {})
        local_lifecycle_row = local_lifecycle.get(code, {})
        cutscene_arg = cutscene_arguments.get(code, {})
        route_owner = route_owners.get(code, {})
        payload_row = payload_atlas.get(code, {})
        payload_probe = payload_probes.get(code, {})
        eventupdate_proof = eventupdate_proofs.get(code, {})
        after_warp_proof = after_warp_proofs.get(code, {})
        blocked_owner_row = blocked_owner.get(code, {})
        fight_ready = fight_readiness.get(code, {})
        fight_return_row = fight_return.get(code, {})
        fight_kill_row = fight_kill.get(code, {})
        blueprint = blueprints.get(code, {})
        sequence_blueprint = sequence_blueprints.get(code, {})
        contract_row = contract_rows.get(code, {})
        scaffold_contract_row = scaffold_contract_rows.get(code, {})
        safe_patch_contract_row = safe_patch_contract_rows.get(code, {})
        snpc_contract_row = snpc_contract_rows.get(code, {})
        manual_contract_row = manual_contract_rows.get(code, {})
        director_notice_row = director_notice_rows.get(code, {})
        push_recipe_row = push_recipe_rows.get(code, {})
        push_impl_row = push_impl_rows.get(code, {})
        owner_probe_row = owner_probe_rows.get(code, {})
        method_probe_row = method_probe_rows.get(code, {})
        runtime_triage_row = runtime_triage_rows.get(code, {})
        runtime_scaffold_row = runtime_scaffold_rows.get(code, {})
        runtime_exact_row = runtime_exact_rows.get(code, {})
        runtime_snpc_a8_row = runtime_snpc_a8_rows.get(code, {})
        runtime_sqb_row = runtime_sqb_rows.get(code, {})
        runtime_world_row = runtime_world_rows.get(code, {})
        runtime_requested_row = runtime_requested_rows.get(code, {})
        runtime_wave2_row = runtime_wave2_rows.get(code, {})
        runtime_safe_smoke_row = runtime_safe_smoke_rows.get(code, {})
        runtime_extra_row = runtime_extra_rows.get(code, {})
        instance_local_row = instance_local_rows.get(code, {})
        instance_event_row = instance_event_rows.get(code, {})
        instance_scene_row = instance_scene_rows.get(code, {})
        instance_hint_row = instance_hint_rows.get(code, {})
        instance_text_row = instance_text_rows.get(code, {})
        instance_clue_row = instance_clue_rows.get(code, {})
        instance_runtime_row = instance_runtime_rows.get(code, {})
        starter_signal_row = starter_signal_rows.get(code, {})
        starter_method_row = starter_method_rows.get(code, {})
        starter_sequence_row = starter_sequence_rows.get(code, {})
        starter_fight_row = starter_fight_rows.get(code, {})
        starter_probe_row = starter_probe_rows.get(code, {})
        starter_detail_row = starter_detail_rows.get(code, {})
        execution_addendum_row = execution_addendum_rows.get(code, {})
        lpb_surface_row = lpb_surface_rows.get(code, {})
        seasonal_item_row = seasonal_item_rows.get(code, {})
        seasonal_atlas_item_row = seasonal_atlas_item_rows.get(code, {})
        local_cutscene_delegate_row = local_cutscene_delegates.get(code, {})
        local_delegate_event_caller_row = local_delegate_event_callers.get(code, {})
        recovered_cutscene_matrix_row = recovered_cutscene_matrix.get(code, {})
        cutscene_template_candidate_row = cutscene_template_candidates.get(code, {})
        cutscene_gap_workqueue_row = cutscene_gap_workqueue.get(code, {})
        script_cutscene_gap_row = script_cutscene_gap.get(code, {})
        scene_bearing_push_row = scene_bearing_needing_push.get(code, {})
        after_warp_cutscene_row = after_warp_cutscene_events.get(code, {})
        blocker_method_focus_row = blocker_method_focus.get(code, {})
        route_owner_patch_focus_row = route_owner_patch_focus.get(code, {})
        local_mutator_row = local_mutators.get(code, {})
        reward_display_sync_row = reward_display_sync.get(code, {})
        reward_display_dat_patch_row = reward_display_dat_patch.get(code, {})
        reward_display_wiki_row = reward_display_wiki.get(code, {})
        addendum_enrichment_row = addendum_enrichment.get(code, {})
        addendum_reward_sync_row = addendum_reward_sync.get(code, {})
        addendum_existing_bnpc_row = addendum_existing_bnpc.get(code, {})
        addendum_private_bnpc_row = addendum_private_bnpc.get(code, {})
        sqb_target_row = sqb_targets.get(code, {})
        sqb_adapter_row = sqb_adapters.get(code, {})
        fight_sqb_op_row = fight_sqb_ops.get(code, {})
        sqb_cutscene_dep_row = sqb_cutscene_deps.get(code, {})
        sqb_reward_locked_row = sqb_reward_locked.get(code, {})
        fight_actor_mob_spawn_row = fight_actor_mob_spawn.get(code, {})
        fight_payload_probe_row = fight_payload_probe.get(code, {})
        fight_reward_lock_proof_row = fight_reward_lock_proof.get(code, {})
        recovered_director = recovered_directors.get(code, {})
        local_status, local_line_count, local_flags = local_script_status(inputs.root, dim.get("local_script_path", ""))
        family = family_from_row(code, dim, parity)
        replay_rows = replay_by_code.get(code, [])
        sql_rows = sql_battles_by_code.get(code, [])

        battle_count = to_int(bnpc.get("row_count", "")) + to_int(material.get("row_count", "")) + len(sql_rows)
        method_rows = method_counter.get("method_rows", 0) or to_int(recovered.get("function_count", ""))
        row: dict[str, object] = {
            "code": code,
            "quest_id": dim.get("quest_id", ""),
            "quest_name": dim.get("quest_name", ""),
            "class_name": dim.get("class_name", ""),
            "category": dim.get("category", ""),
            "family": family,
            "min_level": dim.get("min_level", ""),
            "prerequisite": dim.get("prerequisite", ""),
            "parity_status": first_value(dim.get("parity_status", ""), parity.get("parity_status", "")),
            "local_status": local_status,
            "local_line_count": local_line_count,
            "local_flags": local_flags,
            "local_script_path": dim.get("local_script_path", ""),
            "recovered_script_path": first_value(dim.get("recovered_script_path", ""), parity.get("recovered_paths", "")),
            "recovered_line_count": recovered.get("line_count", ""),
            "method_rows": method_rows,
            "method_call_rows": call_counter.get("call_rows", 0),
            "after_warp_methods": method_counter.get("after_warp_methods", 0),
            "methods_with_cutscene_ids": method_counter.get("methods_with_cutscene_ids", 0),
            "methods_with_asks": method_counter.get("methods_with_asks", 0),
            "methods_with_mutations": method_counter.get("methods_with_mutations", 0),
            "recovered_features": first_value(recovered.get("feature_flags", ""), parity.get("recovered_features", "")),
            "local_features": parity.get("local_features", ""),
            "unique_scene_key_count": cutscene.get("unique_scene_key_count", dim.get("scene_event_rows", "")),
            "scene_launcher_rows": cutscene.get("scene_launcher_rows", ""),
            "scene_keys": cutscene.get("scene_keys", dim.get("scene_keys", "")),
            "fade_modes": cutscene.get("fade_modes", ""),
            "replay_row_count": len(replay_rows),
            "replay_ids": join_unique((row.get("replay_id", "") for row in replay_rows), limit=20),
            "replay_payload_shapes": join_unique((replay_payload_shape(row) for row in replay_rows), limit=20),
            "replay_placeholders": join_unique((replay_slot_hints(row) for row in replay_rows), limit=20),
            "event_call_rows": event.get("event_call_rows", ""),
            "dialogue_say_rows": event.get("dialogue_say_rows", ""),
            "dialogue_ask_rows": event.get("dialogue_ask_rows", ""),
            "npc_linkshell_rows": event.get("npc_linkshell_rows", ""),
            "reward_widget_rows": event.get("reward_widget_rows", ""),
            "quest_offer_widget_rows": event.get("quest_offer_widget_rows", ""),
            "content_join_prompt_rows": event.get("content_join_prompt_rows", ""),
            "widgets": event.get("widgets", ""),
            "joined_text_rows": text.get("joined_text_rows", ""),
            "text_refs": text.get("text_refs", ""),
            "english_samples": text.get("english_samples", ""),
            "server_flow_rows": server.get("server_flow_rows", ""),
            "complete_quest_rows": server.get("complete_quest_rows", ""),
            "accept_quest_rows": server.get("accept_quest_rows", ""),
            "delegate_rows": server.get("delegate_rows", ""),
            "run_event_rows": server.get("run_event_rows", ""),
            "event_warp_rows": server.get("event_warp_rows", ""),
            "reward_or_inventory_rows": server.get("reward_or_inventory_rows", ""),
            "top_server_calls": server.get("top_calls", ""),
            "marker_count": first_value(dim.get("marker_count", ""), marker.get("row_count", "")),
            "marker_ids": first_value(dim.get("marker_ids", ""), marker.get("marker_id", "")),
            "reward_count": first_value(dim.get("reward_count", ""), reward.get("row_count", "")),
            "reward_types": first_value(dim.get("reward_types", ""), reward.get("rewardType", "")),
            "reward_sources": reward.get("source", ""),
            "actor_surface_rows": actor.get("row_count", ""),
            "actor_class_ids": first_value(dim.get("actor_class_ids", ""), actor.get("actor_class_id", "")),
            "actor_surface_gaps": actor.get("actor_surface_gap", ""),
            "bnpc_objective_rows": bnpc_objective.get("row_count", ""),
            "bnpc_objective_constants": bnpc_objective.get("objective_constant", ""),
            "bnpc_objective_materialization_statuses": bnpc_objective.get("materialization_status", ""),
            "spawn_point_rows": spawn_point.get("row_count", ""),
            "spawn_point_zones": spawn_point.get("zone_name", ""),
            "spawn_point_surfaces": spawn_point.get("spawn_surface", ""),
            "bnpc_spawn_rows": bnpc.get("row_count", ""),
            "bnpc_actor_class_ids": first_value(dim.get("bnpc_actor_class_ids", ""), bnpc.get("actor_class_id", "")),
            "bnpc_statuses": first_value(dim.get("bnpc_statuses", ""), bnpc.get("status", "")),
            "bnpc_materialization_rows": material.get("row_count", ""),
            "sql_battle_note_rows": len(sql_rows),
            "sql_battle_notes": join_unique((row.get("note", "") for row in sql_rows), limit=10),
            "battle_candidate_count": battle_count,
            "execution_summary_rows": execution_row.get("row_count", ""),
            "execution_priority_reason": execution_row.get("priority_reason", ""),
            "scene_push_rows": scene_push_row.get("row_count", ""),
            "scene_push_risk_notes": scene_push_row.get("risk_notes", ""),
            "runtime_probe_rows": runtime_row.get("row_count", ""),
            "runtime_probe_lanes": runtime_row.get("runtime_lane", ""),
            "cutscene_runtime_probe_rows": cutscene_runtime_row.get("row_count", ""),
            "fight_runtime_probe_rows": fight_runtime_row.get("row_count", ""),
            "enablement_safety_class": enablement_row.get("safety_class", ""),
            "enablement_action": enablement_row.get("enablement_action", ""),
            "safe_push_class": safe_push_row.get("push_enablement_class", ""),
            "safe_push_action": safe_push_row.get("recommended_action", ""),
            "roadmap_rows": roadmap_row.get("row_count", ""),
            "roadmap_lanes": roadmap_row.get("lane", ""),
            "push_operator_rows": push_op.get("row_count", ""),
            "push_operator_lanes": push_op.get("operator_lane", ""),
            "push_dependency_rows": push_dep.get("row_count", ""),
            "push_next_step": push_dep.get("next_best_operator_step", ""),
            "local_constant_rows": local_constant.get("row_count", ""),
            "local_constants": local_constant.get("constant", ""),
            "local_delegate_push_rows": local_delegate.get("row_count", ""),
            "local_delegate_push_methods": local_delegate.get("event_method", ""),
            "local_enpc_binding_rows": local_enpc_row.get("row_count", ""),
            "unmatched_delegate_rows": unmatched_delegate_row.get("row_count", ""),
            "local_lifecycle_rows": local_lifecycle_row.get("row_count", ""),
            "local_lifecycle_actions": local_lifecycle_row.get("action", ""),
            "cutscene_argument_rows": cutscene_arg.get("row_count", ""),
            "cutscene_argument_shapes": cutscene_arg.get("argument_shape", ""),
            "route_owner_rows": route_owner.get("row_count", ""),
            "route_owner_statuses": route_owner.get("route_owner_resolution_status", ""),
            "payload_atlas_rows": payload_row.get("row_count", ""),
            "payload_statuses": payload_row.get("payload_status", ""),
            "payload_probe_rows": payload_probe.get("row_count", ""),
            "eventupdate_proof_rows": eventupdate_proof.get("row_count", ""),
            "after_warp_proof_rows": after_warp_proof.get("row_count", ""),
            "blocked_owner_rows": blocked_owner_row.get("row_count", ""),
            "fight_readiness_rows": fight_ready.get("row_count", ""),
            "fight_readiness_gaps": fight_ready.get("blocking_gaps", ""),
            "fight_return_reward_rows": fight_return_row.get("row_count", ""),
            "fight_reward_lock_statuses": fight_return_row.get("reward_lock_status", ""),
            "fight_kill_route_rows": fight_kill_row.get("row_count", ""),
            "fight_kill_route_statuses": fight_kill_row.get("route_status", ""),
            "blueprint_rows": blueprint.get("row_count", ""),
            "blueprint_lanes": blueprint.get("blueprint_lane", ""),
            "sequence_blueprint_rows": sequence_blueprint.get("row_count", ""),
            "sequence_blueprint_blockers": sequence_blueprint.get("blocker_type", ""),
            "cutscene_contract_rows": contract_row.get("row_count", ""),
            "cutscene_contract_classes": contract_row.get("contract_class", ""),
            "scaffold_contract_rows": scaffold_contract_row.get("row_count", ""),
            "safe_patch_contract_rows": safe_patch_contract_row.get("row_count", ""),
            "snpc_contract_rows": snpc_contract_row.get("row_count", ""),
            "manual_contract_rows": manual_contract_row.get("row_count", ""),
            "director_notice_rows": director_notice_row.get("row_count", ""),
            "push_recipe_rows": push_recipe_row.get("row_count", ""),
            "push_impl_rows": push_impl_row.get("row_count", ""),
            "owner_probe_rows": owner_probe_row.get("row_count", ""),
            "owner_probe_waves": owner_probe_row.get("probe_wave", ""),
            "method_probe_recipe_rows": method_probe_row.get("row_count", ""),
            "runtime_unlock_triage_rows": runtime_triage_row.get("row_count", ""),
            "runtime_unlock_scaffold_rows": runtime_scaffold_row.get("row_count", ""),
            "runtime_unlock_exact_hazard_rows": runtime_exact_row.get("row_count", ""),
            "runtime_unlock_snpc_a8_rows": runtime_snpc_a8_row.get("row_count", ""),
            "runtime_unlock_sqb_private_rows": runtime_sqb_row.get("row_count", ""),
            "runtime_unlock_world_bnpc_rows": runtime_world_row.get("row_count", ""),
            "runtime_unlock_requested_proof_rows": runtime_requested_row.get("row_count", ""),
            "runtime_unlock_wave2_rows": runtime_wave2_row.get("row_count", ""),
            "runtime_unlock_safe_smoke_rows": runtime_safe_smoke_row.get("row_count", ""),
            "runtime_unlock_extra_rows": runtime_extra_row.get("row_count", ""),
            "runtime_unlock_extra_sources": runtime_extra_row.get("sources", ""),
            "instance_local_sequence_rows": instance_local_row.get("row_count", ""),
            "instance_event_method_rows": instance_event_row.get("row_count", ""),
            "instance_owner_scene_rows": instance_scene_row.get("row_count", ""),
            "instance_owner_hint_rows": instance_hint_row.get("row_count", ""),
            "instance_method_text_rows": instance_text_row.get("row_count", ""),
            "instance_text_clue_rows": instance_clue_row.get("row_count", ""),
            "instance_runtime_rows": instance_runtime_row.get("row_count", ""),
            "instance_runtime_sources": instance_runtime_row.get("sources", ""),
            "starter_signal_rows": starter_signal_row.get("row_count", ""),
            "starter_method_rows": starter_method_row.get("row_count", ""),
            "starter_sequence_rows": starter_sequence_row.get("row_count", ""),
            "starter_fight_rows": starter_fight_row.get("row_count", ""),
            "starter_probe_rows": starter_probe_row.get("row_count", ""),
            "starter_detail_rows": starter_detail_row.get("row_count", ""),
            "starter_detail_sources": starter_detail_row.get("sources", ""),
            "execution_addendum_rows": execution_addendum_row.get("row_count", ""),
            "execution_addendum_sources": execution_addendum_row.get("sources", ""),
            "lpb_surface_rows": lpb_surface_row.get("row_count", ""),
            "lpb_surface_sources": lpb_surface_row.get("sources", ""),
            "seasonal_item_rows": to_int(seasonal_item_row.get("row_count", "")) + to_int(seasonal_atlas_item_row.get("row_count", "")),
            "seasonal_item_buckets": join_unique([seasonal_item_row.get("event_bucket", ""), seasonal_atlas_item_row.get("event_bucket", "")], limit=20),
            "cutscene_matrix_rows": to_int(recovered_cutscene_matrix_row.get("row_count", "")) + to_int(cutscene_gap_workqueue_row.get("row_count", "")),
            "cutscene_matrix_push_statuses": join_unique([recovered_cutscene_matrix_row.get("push_status", ""), cutscene_gap_workqueue_row.get("push_status", "")], limit=20),
            "local_cutscene_delegate_rows": local_cutscene_delegate_row.get("row_count", ""),
            "local_delegate_event_caller_rows": local_delegate_event_caller_row.get("row_count", ""),
            "cutscene_template_candidate_rows": cutscene_template_candidate_row.get("row_count", ""),
            "script_cutscene_gap_rows": script_cutscene_gap_row.get("row_count", ""),
            "scene_bearing_needs_push_rows": scene_bearing_push_row.get("row_count", ""),
            "after_warp_cutscene_event_rows": after_warp_cutscene_row.get("row_count", ""),
            "blocker_method_focus_rows": blocker_method_focus_row.get("row_count", ""),
            "route_owner_patch_focus_rows": route_owner_patch_focus_row.get("row_count", ""),
            "local_mutator_scan_rows": local_mutator_row.get("row_count", ""),
            "local_direct_mutator_count": local_mutator_row.get("direct_mutator_count", ""),
            "reward_display_sync_rows": reward_display_sync_row.get("row_count", ""),
            "reward_display_dat_patch_rows": reward_display_dat_patch_row.get("row_count", ""),
            "reward_display_wiki_rows": reward_display_wiki_row.get("row_count", ""),
            "addendum_enrichment_rows": addendum_enrichment_row.get("row_count", ""),
            "addendum_reward_sync_rows": addendum_reward_sync_row.get("row_count", ""),
            "addendum_existing_bnpc_rows": addendum_existing_bnpc_row.get("row_count", ""),
            "addendum_private_bnpc_rows": addendum_private_bnpc_row.get("row_count", ""),
            "sqb_target_rows": sqb_target_row.get("row_count", ""),
            "sqb_adapter_rows": sqb_adapter_row.get("row_count", ""),
            "fight_sqb_operator_rows": fight_sqb_op_row.get("row_count", ""),
            "sqb_cutscene_dependency_rows": sqb_cutscene_dep_row.get("row_count", ""),
            "sqb_reward_locked_rows": sqb_reward_locked_row.get("row_count", ""),
            "fight_actor_mob_spawn_rows": fight_actor_mob_spawn_row.get("row_count", ""),
            "fight_payload_probe_rows": fight_payload_probe_row.get("row_count", ""),
            "fight_reward_lock_proof_rows": fight_reward_lock_proof_row.get("row_count", ""),
            "recovered_director_rows": recovered_director.get("row_count", ""),
            "recovered_directors": recovered_director.get("director", ""),
            "local_director_rows": local_directors.get(code, {}).get("row_count", ""),
            "gap_score": dim.get("gap_score", ""),
            "implementation_gap_score": dim.get("implementation_gap_score", ""),
            "enablement_risk_score": dim.get("enablement_risk_score", ""),
            "priority_band": dim.get("priority_band", ""),
            "recommended_lane": dim.get("recommended_lane", ""),
            "gap_reasons": dim.get("gap_reasons", ""),
            "enablement_risk_reasons": dim.get("enablement_risk_reasons", ""),
        }
        classification, next_action, priority = classify_inventory(row)
        row["decomp_classification"] = classification
        row["next_action"] = next_action
        row["decomp_priority_score"] = priority
        rows.append(row)
        by_code[code] = row
    return rows, by_code


def build_method_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    method_rows = read_csv(inputs.path(METHOD_SPINE))
    _call_counts, method_calls = aggregate_method_calls(read_csv(inputs.path(METHOD_CALLS)), included)
    rows: list[dict[str, object]] = []
    for row in method_rows:
        code = norm_code(row.get("script_code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        calls = method_calls.get((code, clean(row.get("method_name", ""))), {})
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "class_name": row.get("class_name", ""),
                "method_order": row.get("method_order", ""),
                "method_name": row.get("method_name", ""),
                "method_family": row.get("method_family", ""),
                "route_token": row.get("route_token", ""),
                "line_start": row.get("line_start", ""),
                "line_end": row.get("line_end", ""),
                "arg_count": row.get("arg_count", ""),
                "after_warp": row.get("after_warp", ""),
                "cutscene_ids": first_value(row.get("cutscene_ids", ""), join_unique(calls.get("cutscene_ids", []), limit=20)),
                "ask_rows": first_value(row.get("ask_rows", ""), join_unique(calls.get("ask_rows", []), limit=20)),
                "mutation_families": first_value(row.get("mutation_families", ""), join_unique(calls.get("mutation_families", []), limit=20)),
                "call_count": calls.get("call_count", 0),
                "call_families": join_unique(calls.get("call_families", []), limit=20),
                "callees": join_unique(calls.get("callees", []), limit=30),
                "owner_hint": row.get("owner_hint", ""),
                "owner_hint_source": row.get("owner_hint_source", ""),
                "owner_confidence": row.get("owner_confidence", ""),
                "blocker_type": row.get("blocker_type", ""),
                "source_path": row.get("source_path", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["method_order"])))
    return rows


def build_scene_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    cutscene_calls = aggregate_cutscene_calls(read_csv(inputs.path(CUTSCENE_CALLS)), included)
    replay_by_code, replay_by_scene = replay_rows_by_code(read_csv(inputs.path(CUTREPLAY_ROWS)), included)
    rows: list[dict[str, object]] = []
    seen: set[tuple[str, str]] = set()

    for key, item in cutscene_calls.items():
        code, scene_lower = key
        inv = inventory_by_code[code]
        replay_rows = replay_by_scene.get(key, [])
        seen.add(key)
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "scene_key": item.get("scene_key", ""),
                "launcher_count": item.get("call_count", ""),
                "methods": join_unique(item.get("methods", []), limit=30),
                "launchers": join_unique(item.get("launchers", []), limit=20),
                "replay_row_count": len(replay_rows),
                "replay_ids": join_unique((row.get("replay_id", "") for row in replay_rows), limit=20),
                "replay_unlock_kinds": join_unique((row.get("unlock_kind", "") for row in replay_rows), limit=20),
                "replay_payload_shapes": join_unique((replay_payload_shape(row) for row in replay_rows), limit=20),
                "replay_placeholders": join_unique((replay_slot_hints(row) for row in replay_rows), limit=20),
                "source_files": join_unique(item.get("source_files", []), limit=5),
            }
        )

    for code, replay_rows in replay_by_code.items():
        inv = inventory_by_code.get(code)
        if inv is None:
            continue
        for replay in replay_rows:
            scene = clean(replay.get("scene_key", ""))
            key = (code, scene.lower())
            if not scene or key in seen:
                continue
            rows.append(
                {
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "scene_key": scene,
                    "launcher_count": "",
                    "methods": replay.get("functions", ""),
                    "launchers": "",
                    "replay_row_count": 1,
                    "replay_ids": replay.get("replay_id", ""),
                    "replay_unlock_kinds": replay.get("unlock_kind", ""),
                    "replay_payload_shapes": replay_payload_shape(replay),
                    "replay_placeholders": replay_slot_hints(replay),
                    "source_files": "",
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], item["scene_key"]))
    return rows


def build_replay_payload_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for replay in read_csv(inputs.path(CUTREPLAY_ROWS)):
        codes = [norm_code(code) for code in split_many(replay.get("quest_codes", ""))]
        for code in codes:
            if code not in included:
                continue
            inv = inventory_by_code[code]
            shape = replay_payload_shape(replay)
            row: dict[str, object] = {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "scene_key": replay.get("scene_key", ""),
                "sample_key": replay.get("sample_key", ""),
                "replay_id": replay.get("replay_id", ""),
                "unlock_kind": replay.get("unlock_kind", ""),
                "functions": replay.get("functions", ""),
                "fade_modes": replay.get("fade_modes", ""),
                "classifications": replay.get("classifications", ""),
                "payload_shape": shape,
                "helper_hint": replay_helper_hint(shape),
                "slot_hints": replay_slot_hints(replay),
            }
            for field in REPLAY_SLOT_FIELDS:
                row[field] = replay.get(field, "")
                row[f"{field}_hint"] = replay_placeholder_hint(replay.get(field, ""))
            rows.append(row)
    rows.sort(key=lambda item: (item["category"], item["code"], item["replay_id"], item["scene_key"]))
    return rows


def build_dialogue_text_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for text_row in read_csv(inputs.path(EVENT_TEXT_JOIN)):
        code = norm_code(text_row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "class_name": text_row.get("class_name", ""),
                "method": text_row.get("method", ""),
                "function_start_line": text_row.get("function_start_line", ""),
                "call_line": text_row.get("call_line", ""),
                "receiver": text_row.get("receiver", ""),
                "call": text_row.get("call", ""),
                "event_category": text_row.get("category", ""),
                "actor_id_or_expr": text_row.get("actor_id_or_expr", ""),
                "text_id_or_expr": text_row.get("text_id_or_expr", ""),
                "widget": text_row.get("widget", ""),
                "arg_count": text_row.get("arg_count", ""),
                "args_preview": text_row.get("args_preview", ""),
                "text_sheet_id": text_row.get("text_sheet_id", ""),
                "text_sheet_name": text_row.get("text_sheet_name", ""),
                "text_row_id": text_row.get("text_row_id", ""),
                "text_join_status": text_row.get("text_join_status", ""),
                "text_en": text_row.get("text_en", ""),
                "text_ja": text_row.get("text_ja", ""),
                "text_de": text_row.get("text_de", ""),
                "text_fr": text_row.get("text_fr", ""),
                "source_file": text_row.get("source_file", ""),
                "line_text": text_row.get("line_text", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["function_start_line"]), to_int(item["call_line"])))
    return rows


def dat_mining_text_rows(path: Path) -> list[dict[str, str]]:
    if not path.exists():
        return []
    rows: list[dict[str, str]] = []
    with path.open(newline="", encoding="utf-8-sig", errors="replace") as handle:
        reader = csv.reader(handle)
        for index, row in enumerate(reader):
            if index < 2 or not row:
                continue
            row_id = clean(row[0])
            if not row_id or not row_id.lstrip("-").isdigit():
                continue
            rows.append(
                {
                    "text_row_id": row_id,
                    "text_ja": row[1] if len(row) > 1 else "",
                    "text_en": row[2] if len(row) > 2 else "",
                    "text_de": row[3] if len(row) > 3 else "",
                    "text_fr": row[4] if len(row) > 4 else "",
                    "text_extra": row[5] if len(row) > 5 else "",
                }
            )
    return rows


def text_dynamic_tokens(*values: str) -> str:
    tokens: list[str] = []
    for value in values:
        tokens.extend(re.findall(r"\[@([A-Z0-9_]+)", value or ""))
        tokens.extend(re.findall(r"\$[A-Z0-9_]+", value or ""))
    return join_unique(tokens, limit=30)


def text_sheet_helper_hint(row: dict[str, object]) -> str:
    if clean(row.get("referenced_by_recovered_event", "")) == "true":
        if clean(row.get("event_categories", "")).startswith("dialogue_ask"):
            return "ask/choice text helper"
        return "recovered dialogue text helper"
    tokens = clean(row.get("dynamic_tokens", ""))
    if "SHEET" in tokens or "SHEETEN" in tokens or "SHEETFR" in tokens:
        return "dynamic item/sheet text helper"
    if not clean(row.get("text_en", "")):
        return "empty or non-English text row review"
    return "unreferenced quest text review"


def build_text_sheet_full_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    usage: dict[tuple[str, str], dict[str, list[str]]] = defaultdict(lambda: defaultdict(list))
    for row in read_csv(inputs.path(EVENT_TEXT_JOIN)):
        code = norm_code(row.get("code", ""))
        text_row_id = clean(row.get("text_row_id", ""))
        if code not in inventory_by_code or not text_row_id:
            continue
        item = usage[(code, text_row_id)]
        item["methods"].append(row.get("method", ""))
        item["calls"].append(row.get("call", ""))
        item["categories"].append(row.get("category", ""))
        item["source_lines"].append(row.get("call_line", ""))

    rows: list[dict[str, object]] = []
    for code, inv in inventory_by_code.items():
        path = inputs.path(DAT_MINING_DIR / f"{code}.csv")
        text_rows = dat_mining_text_rows(path)
        if not text_rows:
            rows.append(
                {
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "text_sheet_name": code,
                    "text_sheet_path": str(path.relative_to(inputs.root)) if path.exists() else str(DAT_MINING_DIR / f"{code}.csv"),
                    "text_row_id": "",
                    "referenced_by_recovered_event": "false",
                    "event_methods": "",
                    "event_calls": "",
                    "event_categories": "",
                    "event_source_lines": "",
                    "text_en": "",
                    "text_ja": "",
                    "text_de": "",
                    "text_fr": "",
                    "text_extra": "",
                    "dynamic_tokens": "",
                    "empty_languages": "sheet_missing",
                    "helper_hint": "missing dat-mining quest text sheet",
                }
            )
            continue
        for text_row in text_rows:
            row_id = clean(text_row.get("text_row_id", ""))
            used = usage.get((code, row_id), {})
            dynamic = text_dynamic_tokens(text_row.get("text_en", ""), text_row.get("text_ja", ""), text_row.get("text_de", ""), text_row.get("text_fr", ""))
            empty_languages = join_unique(
                lang
                for lang, field in (
                    ("en", "text_en"),
                    ("ja", "text_ja"),
                    ("de", "text_de"),
                    ("fr", "text_fr"),
                )
                if not clean(text_row.get(field, ""))
            )
            out = {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "text_sheet_name": code,
                "text_sheet_path": str(path.relative_to(inputs.root)),
                "text_row_id": row_id,
                "referenced_by_recovered_event": "true" if used else "false",
                "event_methods": join_unique(used.get("methods", []), limit=20),
                "event_calls": join_unique(used.get("calls", []), limit=20),
                "event_categories": join_unique(used.get("categories", []), limit=20),
                "event_source_lines": join_unique(used.get("source_lines", []), limit=20),
                "text_en": text_row.get("text_en", ""),
                "text_ja": text_row.get("text_ja", ""),
                "text_de": text_row.get("text_de", ""),
                "text_fr": text_row.get("text_fr", ""),
                "text_extra": text_row.get("text_extra", ""),
                "dynamic_tokens": dynamic,
                "empty_languages": empty_languages,
            }
            out["helper_hint"] = text_sheet_helper_hint(out)
            rows.append(out)

    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["text_row_id"])))
    return rows


def build_text_sheet_coverage_index(text_sheet_full_index: list[dict[str, object]]) -> list[dict[str, object]]:
    grouped: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in text_sheet_full_index:
        grouped[str(row.get("code", ""))].append(row)

    rows: list[dict[str, object]] = []
    for code, values in grouped.items():
        first = values[0]
        missing_sheet = any(clean(row.get("empty_languages", "")) == "sheet_missing" for row in values)
        referenced = [row for row in values if clean(row.get("referenced_by_recovered_event", "")) == "true"]
        unreferenced = [row for row in values if clean(row.get("referenced_by_recovered_event", "")) != "true" and not missing_sheet]
        dynamic = [row for row in values if clean(row.get("dynamic_tokens", ""))]
        empty_en = [row for row in values if "en" in split_many(row.get("empty_languages", ""))]
        rows.append(
            {
                "code": code,
                "quest_id": first.get("quest_id", ""),
                "quest_name": first.get("quest_name", ""),
                "category": first.get("category", ""),
                "local_status": first.get("local_status", ""),
                "text_sheet_name": first.get("text_sheet_name", ""),
                "text_sheet_path": first.get("text_sheet_path", ""),
                "sheet_status": "missing" if missing_sheet else "present",
                "total_text_rows": 0 if missing_sheet else len(values),
                "referenced_text_rows": len(referenced),
                "unreferenced_text_rows": len(unreferenced),
                "dynamic_text_rows": len(dynamic),
                "empty_en_rows": len(empty_en),
                "referenced_row_ids": join_unique((row.get("text_row_id", "") for row in referenced), limit=60),
                "unreferenced_row_ids_sample": join_unique((row.get("text_row_id", "") for row in unreferenced[:60]), limit=60),
                "dynamic_row_ids_sample": join_unique((row.get("text_row_id", "") for row in dynamic[:60]), limit=60),
                "coverage_classification": "missing_text_sheet" if missing_sheet else ("has_unreferenced_sheet_text" if unreferenced else "all_sheet_text_referenced"),
                "helper_hint": "full quest text sheet review" if unreferenced else ("missing text sheet recovery" if missing_sheet else "text sheet parity clear"),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def dat_mining_table_rows(path: Path) -> list[dict[str, object]]:
    if not path.exists():
        return []
    rows: list[dict[str, object]] = []
    header: list[str] = []
    type_row: list[str] = []
    with path.open(newline="", encoding="utf-8-sig", errors="replace") as handle:
        reader = csv.reader(handle)
        for index, csv_row in enumerate(reader):
            if index == 0:
                header = [clean(value) or str(position) for position, value in enumerate(csv_row[1:])]
                continue
            if index == 1:
                type_row = [clean(value) for value in csv_row[1:]]
                continue
            if not csv_row:
                continue
            row_id = clean(csv_row[0])
            if not row_id:
                continue
            values: dict[str, str] = {}
            types: dict[str, str] = {}
            for position, value in enumerate(csv_row[1:]):
                field = header[position] if position < len(header) and header[position] else str(position)
                values[field] = value
                types[field] = type_row[position] if position < len(type_row) else ""
            rows.append(
                {
                    "source_row": index + 1,
                    "row_id": row_id,
                    "values": values,
                    "types": types,
                }
            )
    return rows


def dat_row_snapshot(values: dict[str, str], limit: int = 16) -> str:
    pieces: list[str] = []
    for field in sorted(values, key=lambda item: to_int(item)):
        value = clean(values.get(field, ""))
        if not value:
            continue
        if len(value) > 140:
            value = value[:137] + "..."
        pieces.append(f"c{field}={value}")
        if len(pieces) >= limit:
            break
    return "; ".join(pieces)


def dat_text_signal(values: dict[str, str], limit: int = 8) -> str:
    pieces: list[str] = []
    for field in sorted(values, key=lambda item: to_int(item)):
        value = clean(values.get(field, ""))
        if not value or value.lower() in {"[en]", "[de]", "[fr]", "[jp]"}:
            continue
        if not re.search(r"[A-Za-z]|\[@", value):
            continue
        if len(value) > 180:
            value = value[:177] + "..."
        pieces.append(f"c{field}={value}")
        if len(pieces) >= limit:
            break
    return "; ".join(pieces)


def dat_sheet_refs(*values: object, limit: int = 30) -> str:
    refs: list[str] = []
    pattern = re.compile(r"\[@SHEET(?:EN|DE|FR)?\(([^,\)]+),\s*([^,\)]+)", flags=re.IGNORECASE)
    for value in values:
        for match in pattern.finditer(str(value or "")):
            refs.append(f"{clean(match.group(1))}:{clean(match.group(2))}")
    return join_unique(refs, limit=limit)


def item_refs_in_text(*values: object, limit: int | None = None) -> str:
    refs: list[str] = []
    pattern = re.compile(r"SHEET(?:EN|DE|FR)?\(xtx/itemName,\s*([^\)]*)", flags=re.IGNORECASE)
    for value in values:
        for match in pattern.finditer(str(value or "")):
            args = re.findall(r"-?\d+", match.group(1))
            plausible_item_ids = [arg for arg in args if abs(to_int(arg)) >= 100000]
            if plausible_item_ids:
                refs.append(plausible_item_ids[0])
    return join_unique(refs, limit=limit)


def dat_dynamic_tokens_from_values(values: dict[str, str]) -> str:
    return text_dynamic_tokens(*values.values())


def dat_table_match_quest_id(row_id: str, included_ids: set[str]) -> tuple[str, str]:
    if row_id in included_ids:
        return (row_id, "row_id_exact_quest")
    prefixes = [quest_id for quest_id in included_ids if row_id.startswith(quest_id) and len(row_id) > len(quest_id)]
    if prefixes:
        quest_id = max(prefixes, key=len)
        return (quest_id, "row_id_quest_prefixed")
    return ("", "")


def dat_table_kind(table_name: str) -> str:
    return {
        "quest.csv": "raw quest parameter row",
        "_quest.csv": "raw quest auxiliary row",
        "xtx_quest.csv": "localized journal/title row",
        "quest_marker.csv": "raw quest marker row",
        "quest_new_reward.csv": "raw dense reward payload row",
        "quest_reward.csv": "raw legacy reward slot row",
        "cutReplay.csv": "raw cutscene replay payload row",
        "xtx_cutReplay.csv": "localized cutscene replay title row",
        "xtx_questCompleteText.csv": "localized quest completion text row",
    }.get(table_name, "raw dat table row")


def dat_table_helper_hint(table_name: str) -> str:
    return {
        "quest.csv": "raw quest param helper",
        "_quest.csv": "raw quest auxiliary param helper",
        "xtx_quest.csv": "journal/objective text helper",
        "quest_marker.csv": "raw marker crosscheck helper",
        "quest_new_reward.csv": "new reward payload crosscheck helper",
        "quest_reward.csv": "legacy reward slot crosscheck helper",
        "cutReplay.csv": "cutscene replay payload helper",
        "xtx_cutReplay.csv": "cutscene replay title helper",
        "xtx_questCompleteText.csv": "completion text helper",
    }.get(table_name, "raw dat helper")


def build_dat_table_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    inventory_by_id = {clean(row.get("quest_id", "")): row for row in inventory_by_code.values() if clean(row.get("quest_id", ""))}
    included_ids = set(inventory_by_id)
    rows: list[dict[str, object]] = []

    for table_name in DAT_CORE_TABLES:
        path = inputs.path(DAT_MINING_DIR / table_name)
        source_file = str(path.relative_to(inputs.root)) if path.exists() else str(DAT_MINING_DIR / table_name)
        for raw in dat_mining_table_rows(path):
            row_id = clean(raw.get("row_id", ""))
            quest_id, match_kind = dat_table_match_quest_id(row_id, included_ids)
            if not quest_id:
                continue
            inv = inventory_by_id[quest_id]
            values = raw.get("values", {})
            if not isinstance(values, dict):
                values = {}
            suffix = row_id[len(quest_id):] if match_kind == "row_id_quest_prefixed" else ""
            rows.append(
                {
                    "source_table": table_name,
                    "source_file": source_file,
                    "source_row": raw.get("source_row", ""),
                    "match_kind": match_kind,
                    "code": inv.get("code", ""),
                    "quest_id": quest_id,
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "raw_row_id": row_id,
                    "raw_slot": suffix,
                    "data_kind": dat_table_kind(table_name),
                    "non_empty_field_count": sum(1 for value in values.values() if clean(value)),
                    "dynamic_tokens": dat_dynamic_tokens_from_values(values),
                    "sheet_refs": dat_sheet_refs(*values.values()),
                    "item_refs": item_refs_in_text(*values.values(), limit=30),
                    "text_signal": dat_text_signal(values),
                    "row_snapshot": dat_row_snapshot(values),
                    "helper_hint": dat_table_helper_hint(table_name),
                }
            )

    rows.sort(key=lambda item: (item["category"], item["code"], item["source_table"], to_int(item["raw_row_id"]), item["raw_slot"]))
    return rows


def journal_branch_states(*values: object) -> str:
    states: list[str] = []
    for value in values:
        text = str(value or "")
        states.extend(match.group(1) for match in re.finditer(r"\$E8\(1\),\s*(-?\d+)", text))
    return join_unique(states, limit=80)


def journal_title_status(inventory_title: object, raw_title: object) -> tuple[str, str]:
    inv = clean(inventory_title)
    raw = clean(raw_title)
    if not raw:
        return ("missing_raw_title", "no xtx_quest English title")
    if inv == raw:
        return ("exact", "")
    if inv.lower() == raw.lower():
        return ("case_only", f"inventory='{inv}' raw='{raw}'")
    return ("mismatch", f"inventory='{inv}' raw='{raw}'")


def dat_journal_helper_hint(row: dict[str, object]) -> str:
    status = clean(row.get("title_match_status", ""))
    if status == "mismatch":
        return "title mismatch review helper"
    if clean(row.get("item_refs", "")):
        return "journal item reference helper"
    if clean(row.get("branch_states", "")):
        return "journal branch expression helper"
    return "journal metadata helper"


def build_dat_journal_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    inventory_by_id = {clean(row.get("quest_id", "")): row for row in inventory_by_code.values() if clean(row.get("quest_id", ""))}
    rows: list[dict[str, object]] = []
    path = inputs.path(DAT_MINING_DIR / "xtx_quest.csv")

    for raw in dat_mining_table_rows(path):
        quest_id = clean(raw.get("row_id", ""))
        if quest_id not in inventory_by_id:
            continue
        inv = inventory_by_id[quest_id]
        values = raw.get("values", {})
        if not isinstance(values, dict):
            values = {}
        title_ja = values.get("1", "")
        title_en = values.get("2", "")
        title_de = values.get("3", "")
        title_fr = values.get("4", "")
        offer_summary_en = values.get("6", "")
        restriction_text_en = values.get("10", "")
        active_objective_expr_en = values.get("14", "")
        completion_objective_expr_en = values.get("19", "")
        reward_text_en = values.get("23", "")
        title_status, title_note = journal_title_status(inv.get("quest_name", ""), title_en)
        sheet_refs = dat_sheet_refs(active_objective_expr_en, completion_objective_expr_en, reward_text_en)
        item_refs = item_refs_in_text(*values.values(), limit=40)
        branch_states = journal_branch_states(active_objective_expr_en, completion_objective_expr_en)
        out = {
            "code": inv.get("code", ""),
            "quest_id": quest_id,
            "quest_name": inv.get("quest_name", ""),
            "category": inv.get("category", ""),
            "local_status": inv.get("local_status", ""),
            "raw_title_en": title_en,
            "raw_title_ja": title_ja,
            "raw_title_de": title_de,
            "raw_title_fr": title_fr,
            "title_match_status": title_status,
            "title_mismatch_note": title_note,
            "offer_summary_en": offer_summary_en,
            "restriction_text_en": restriction_text_en,
            "active_objective_expr_en": active_objective_expr_en,
            "completion_objective_expr_en": completion_objective_expr_en,
            "reward_text_en": reward_text_en,
            "branch_states": branch_states,
            "sheet_refs": sheet_refs,
            "item_refs": item_refs,
            "dynamic_tokens": dat_dynamic_tokens_from_values(values),
            "non_empty_field_count": sum(1 for value in values.values() if clean(value)),
            "row_snapshot": dat_row_snapshot(values, limit=18),
        }
        out["helper_hint"] = dat_journal_helper_hint(out)
        rows.append(out)

    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def build_dat_crosscheck_index(
    inventory: list[dict[str, object]],
    dat_table_index: list[dict[str, object]],
    dat_journal_index: list[dict[str, object]],
    marker_index: list[dict[str, object]],
    reward_index: list[dict[str, object]],
    replay_payload_index: list[dict[str, object]],
) -> list[dict[str, object]]:
    table_counts: dict[tuple[str, str], int] = Counter()
    for row in dat_table_index:
        table_counts[(clean(row.get("code", "")), clean(row.get("source_table", "")))] += 1

    marker_counts = Counter(clean(row.get("code", "")) for row in marker_index)
    reward_counts = Counter(clean(row.get("code", "")) for row in reward_index)
    replay_counts = Counter(clean(row.get("code", "")) for row in replay_payload_index)
    journal_by_code = {clean(row.get("code", "")): row for row in dat_journal_index}

    rows: list[dict[str, object]] = []
    for inv in inventory:
        code = clean(inv.get("code", ""))
        raw_quest_rows = table_counts[(code, "quest.csv")]
        raw_extra_rows = table_counts[(code, "_quest.csv")]
        raw_journal_rows = table_counts[(code, "xtx_quest.csv")]
        raw_marker_rows = table_counts[(code, "quest_marker.csv")]
        raw_new_reward_rows = table_counts[(code, "quest_new_reward.csv")]
        raw_legacy_reward_rows = table_counts[(code, "quest_reward.csv")]
        raw_cut_replay_rows = table_counts[(code, "cutReplay.csv")]
        raw_cut_replay_text_rows = table_counts[(code, "xtx_cutReplay.csv")]
        completion_text_rows = table_counts[(code, "xtx_questCompleteText.csv")]
        normalized_marker_rows = marker_counts[code]
        normalized_reward_rows = reward_counts[code]
        recovered_replay_rows = replay_counts[code]
        journal = journal_by_code.get(code, {})
        title_status = clean(journal.get("title_match_status", "")) or "missing_raw_journal"

        statuses: list[str] = []
        if raw_quest_rows != 1:
            statuses.append("raw_quest_row_count_review")
        if raw_journal_rows != 1:
            statuses.append("raw_journal_row_count_review")
        if title_status == "mismatch":
            statuses.append("journal_title_mismatch")
        elif title_status == "case_only":
            statuses.append("journal_title_case_only")
        marker_delta = raw_marker_rows - normalized_marker_rows
        if marker_delta:
            statuses.append("marker_raw_vs_normalized_delta")
        if normalized_reward_rows and not (raw_new_reward_rows or raw_legacy_reward_rows):
            statuses.append("normalized_reward_without_raw_reward")
        if not normalized_reward_rows and (raw_new_reward_rows or raw_legacy_reward_rows):
            statuses.append("raw_reward_without_normalized_reward")
        reward_delta = raw_new_reward_rows - normalized_reward_rows
        cut_replay_delta = raw_cut_replay_rows - recovered_replay_rows
        if raw_cut_replay_rows and raw_cut_replay_rows > recovered_replay_rows:
            statuses.append("raw_cutreplay_rows_exceed_recovered")
        elif recovered_replay_rows and recovered_replay_rows > raw_cut_replay_rows:
            statuses.append("recovered_replay_rows_exceed_raw")
        if raw_cut_replay_rows != raw_cut_replay_text_rows:
            statuses.append("cutreplay_payload_text_delta")
        if not statuses:
            statuses.append("dat_crosscheck_clear")

        if "journal_title_mismatch" in statuses or "journal_title_case_only" in statuses:
            helper_hint = "title/journal normalization helper"
        elif "marker_raw_vs_normalized_delta" in statuses:
            helper_hint = "marker parity helper"
        elif "raw_cutreplay_rows_exceed_recovered" in statuses or "recovered_replay_rows_exceed_raw" in statuses:
            helper_hint = "cutscene replay parity helper"
        elif "normalized_reward_without_raw_reward" in statuses or "raw_reward_without_normalized_reward" in statuses:
            helper_hint = "reward parity helper"
        else:
            helper_hint = "raw dat parity clear"

        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "raw_quest_rows": raw_quest_rows,
                "raw_extra_rows": raw_extra_rows,
                "raw_journal_rows": raw_journal_rows,
                "journal_title_status": title_status,
                "journal_title_note": journal.get("title_mismatch_note", ""),
                "raw_marker_rows": raw_marker_rows,
                "normalized_marker_rows": normalized_marker_rows,
                "marker_delta": marker_delta,
                "raw_new_reward_rows": raw_new_reward_rows,
                "normalized_reward_rows": normalized_reward_rows,
                "raw_legacy_reward_rows": raw_legacy_reward_rows,
                "reward_delta": reward_delta,
                "raw_cut_replay_rows": raw_cut_replay_rows,
                "raw_cut_replay_text_rows": raw_cut_replay_text_rows,
                "recovered_replay_rows": recovered_replay_rows,
                "cut_replay_delta": cut_replay_delta,
                "completion_text_rows": completion_text_rows,
                "crosscheck_status": join_unique(statuses, limit=12),
                "helper_hint": helper_hint,
            }
        )

    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def load_item_lookup(inputs: Inputs) -> dict[str, dict[str, str]]:
    lookup: dict[str, dict[str, str]] = {}

    item_name_path = inputs.path(DAT_MINING_DIR / "xtx_itemName.csv")
    for raw in dat_mining_table_rows(item_name_path):
        item_id = clean(raw.get("row_id", ""))
        values = raw.get("values", {})
        if not item_id or not isinstance(values, dict):
            continue
        entry = lookup.setdefault(item_id, {})
        entry.update(
            {
                "item_name_ja": values.get("4", ""),
                "item_name_en": values.get("5", ""),
                "item_name_de": values.get("11", ""),
                "item_name_fr": values.get("19", ""),
            }
        )

    item_path = inputs.path(DAT_MINING_DIR / "_item.csv")
    for raw in dat_mining_table_rows(item_path):
        item_id = clean(raw.get("row_id", ""))
        values = raw.get("values", {})
        if not item_id or not isinstance(values, dict):
            continue
        entry = lookup.setdefault(item_id, {})
        entry.update(
            {
                "item_path": values.get("0", ""),
                "max_stack": values.get("1", ""),
                "unique": values.get("2", ""),
                "untradeable": values.get("3", ""),
            }
        )

    return lookup


def item_reference_helper_hint(source: str, lookup_status: str) -> str:
    if lookup_status == "missing_item_lookup":
        return "missing item lookup helper"
    if source == "quest_reward_index":
        return "reward item/currency helper"
    if source == "quest_text_sheet_full_index":
        return "dialogue itemName text helper"
    if source == "quest_dat_journal_index":
        return "journal itemName text helper"
    if source == "quest_journal_reference_index":
        return "resolved journal itemName helper"
    return "item reference helper"


def build_item_reference_index(
    inputs: Inputs,
    reward_index: list[dict[str, object]],
    text_sheet_full_index: list[dict[str, object]],
    dat_journal_index: list[dict[str, object]],
    journal_reference_index: list[dict[str, object]],
) -> list[dict[str, object]]:
    lookup = load_item_lookup(inputs)
    buckets: dict[tuple[str, str, str, str], dict[str, object]] = {}

    def add_reference(source: str, row: dict[str, object], item_id: object, reference_kind: str, detail: object) -> None:
        item = clean(item_id)
        if not item or item in {"0", "-1"}:
            return
        code = clean(row.get("code", ""))
        key = (source, code, item, reference_kind)
        bucket = buckets.setdefault(
            key,
            {
                "source": source,
                "code": code,
                "quest_id": row.get("quest_id", ""),
                "quest_name": row.get("quest_name", ""),
                "category": row.get("category", ""),
                "local_status": row.get("local_status", ""),
                "item_id": item,
                "reference_kind": reference_kind,
                "details": [],
            },
        )
        details = bucket.setdefault("details", [])
        if isinstance(details, list):
            details.append(clean(detail))

    for row in reward_index:
        add_reference(
            "quest_reward_index",
            row,
            row.get("reward_id", ""),
            clean(row.get("reward_type", "")) or "reward",
            f"sort={row.get('sort_order', '')} qty={row.get('quantity', '')} source={row.get('source', '')}",
        )

    for row in text_sheet_full_index:
        refs = item_refs_in_text(row.get("text_en", ""), row.get("text_ja", ""), row.get("text_de", ""), row.get("text_fr", ""), row.get("text_extra", ""))
        for item_id in split_many(refs):
            add_reference(
                "quest_text_sheet_full_index",
                row,
                item_id,
                "text_sheet_itemName",
                f"text_row={row.get('text_row_id', '')} referenced={row.get('referenced_by_recovered_event', '')}",
            )

    for row in dat_journal_index:
        for item_id in split_many(row.get("item_refs", "")):
            add_reference(
                "quest_dat_journal_index",
                row,
                item_id,
                "journal_itemName",
                f"branch_states={row.get('branch_states', '')}",
            )

    for row in journal_reference_index:
        for item_id in split_many(row.get("item_refs", "")):
            add_reference(
                "quest_journal_reference_index",
                row,
                item_id,
                "resolved_journal_itemName",
                f"sheet={row.get('sheet_name', '')}:{row.get('sheet_row_id', '')} branch={row.get('branch_state', '')}",
            )

    rows: list[dict[str, object]] = []
    for bucket in buckets.values():
        item_id = clean(bucket.get("item_id", ""))
        item = lookup.get(item_id, {})
        lookup_status = "item_lookup_found" if item else "missing_item_lookup"
        source = clean(bucket.get("source", ""))
        details = bucket.get("details", [])
        if not isinstance(details, list):
            details = []
        rows.append(
            {
                "source": source,
                "code": bucket.get("code", ""),
                "quest_id": bucket.get("quest_id", ""),
                "quest_name": bucket.get("quest_name", ""),
                "category": bucket.get("category", ""),
                "local_status": bucket.get("local_status", ""),
                "item_id": item_id,
                "reference_kind": bucket.get("reference_kind", ""),
                "reference_count": len([detail for detail in details if clean(detail)]),
                "reference_details": join_unique(details, limit=30),
                "item_name_en": item.get("item_name_en", ""),
                "item_name_ja": item.get("item_name_ja", ""),
                "item_name_de": item.get("item_name_de", ""),
                "item_name_fr": item.get("item_name_fr", ""),
                "item_path": item.get("item_path", ""),
                "max_stack": item.get("max_stack", ""),
                "unique": item.get("unique", ""),
                "untradeable": item.get("untradeable", ""),
                "item_lookup_status": lookup_status,
                "helper_hint": item_reference_helper_hint(source, lookup_status),
            }
        )

    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], to_int(item["item_id"]), item["reference_kind"]))
    return rows


def journal_source_metadata(field: str) -> tuple[str, str]:
    metadata = {
        "13": ("active_objective_expr", "ja"),
        "14": ("active_objective_expr", "en"),
        "15": ("active_objective_expr", "de"),
        "16": ("active_objective_expr", "fr"),
        "18": ("completion_objective_expr", "ja"),
        "19": ("completion_objective_expr", "en"),
        "20": ("completion_objective_expr", "de"),
        "21": ("completion_objective_expr", "fr"),
        "22": ("reward_item_expr", "ja"),
        "23": ("reward_item_expr", "en"),
        "24": ("reward_item_expr", "de"),
        "25": ("reward_item_expr", "fr"),
        "28": ("flattened_objective_text", "ja"),
        "29": ("flattened_objective_text", "en"),
        "30": ("flattened_objective_text", "de"),
        "31": ("flattened_objective_text", "fr"),
    }
    return metadata.get(field, ("raw_journal_field", ""))


def load_journal_sheet_lookup(inputs: Inputs) -> dict[str, dict[str, dict[str, str]]]:
    lookup: dict[str, dict[str, dict[str, str]]] = {}
    dat_dir = inputs.path(DAT_MINING_DIR)
    for path in dat_dir.glob("xtx_journalxtx*.csv"):
        sheet_name = "xtx/" + path.stem.replace("xtx_", "")
        table: dict[str, dict[str, str]] = {}
        for raw in dat_mining_table_rows(path):
            row_id = clean(raw.get("row_id", ""))
            values = raw.get("values", {})
            if row_id and isinstance(values, dict):
                table[row_id] = values
        lookup[sheet_name] = table
    return lookup


def extract_journal_sheet_refs(field: str, value: object) -> list[dict[str, str]]:
    text = str(value or "")
    refs: list[dict[str, str]] = []
    pattern = re.compile(r"\[@SHEET(?:EN|DE|FR)?\((xtx/journalxtx[^,\)]+),\s*(-?\d+),\s*(-?\d+)", flags=re.IGNORECASE)
    for match in pattern.finditer(text):
        prefix = text[max(0, match.start() - 180):match.start()]
        branch_matches = list(re.finditer(r"\$E8\(1\),\s*(-?\d+)", prefix))
        source_kind, source_language = journal_source_metadata(field)
        refs.append(
            {
                "source_field": field,
                "source_field_kind": source_kind,
                "source_language": source_language,
                "branch_state": branch_matches[-1].group(1) if branch_matches else "",
                "sheet_name": clean(match.group(1)),
                "sheet_row_id": clean(match.group(2)),
                "sheet_language_column": clean(match.group(3)),
                "source_text_preview": clean(text[max(0, match.start() - 80):match.end() + 80]),
            }
        )
    return refs


def journal_reference_helper_hint(row: dict[str, object]) -> str:
    if clean(row.get("resolved_status", "")) != "resolved":
        return "journal ref missing lookup helper"
    if clean(row.get("item_refs", "")):
        return "journal ref item helper"
    if clean(row.get("branch_state", "")):
        return "journal branch text helper"
    return "journal resolved text helper"


def build_journal_reference_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    inventory_by_id = {clean(row.get("quest_id", "")): row for row in inventory_by_code.values() if clean(row.get("quest_id", ""))}
    lookup = load_journal_sheet_lookup(inputs)
    rows: list[dict[str, object]] = []
    path = inputs.path(DAT_MINING_DIR / "xtx_quest.csv")

    for raw in dat_mining_table_rows(path):
        quest_id = clean(raw.get("row_id", ""))
        if quest_id not in inventory_by_id:
            continue
        inv = inventory_by_id[quest_id]
        values = raw.get("values", {})
        if not isinstance(values, dict):
            continue
        for field, value in values.items():
            for ref in extract_journal_sheet_refs(field, value):
                sheet_name = clean(ref.get("sheet_name", ""))
                sheet_row_id = clean(ref.get("sheet_row_id", ""))
                sheet_language_column = clean(ref.get("sheet_language_column", ""))
                sheet_rows = lookup.get(sheet_name)
                resolved = sheet_rows.get(sheet_row_id) if sheet_rows else None
                resolved_status = "resolved" if resolved else ("missing_sheet" if sheet_rows is None else "missing_row")
                text_ja = resolved.get("0", "") if resolved else ""
                text_en = resolved.get("1", "") if resolved else ""
                text_de = resolved.get("2", "") if resolved else ""
                text_fr = resolved.get("3", "") if resolved else ""
                requested_text = resolved.get(sheet_language_column, "") if resolved else ""
                out = {
                    "code": inv.get("code", ""),
                    "quest_id": quest_id,
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "source_field": ref.get("source_field", ""),
                    "source_field_kind": ref.get("source_field_kind", ""),
                    "source_language": ref.get("source_language", ""),
                    "branch_state": ref.get("branch_state", ""),
                    "sheet_name": sheet_name,
                    "sheet_row_id": sheet_row_id,
                    "sheet_language_column": sheet_language_column,
                    "resolved_status": resolved_status,
                    "requested_text": requested_text,
                    "text_en": text_en,
                    "text_ja": text_ja,
                    "text_de": text_de,
                    "text_fr": text_fr,
                    "item_refs": item_refs_in_text(text_en, text_ja, text_de, text_fr, requested_text, ref.get("source_text_preview", ""), limit=20),
                    "dynamic_tokens": text_dynamic_tokens(text_en, text_ja, text_de, text_fr, requested_text),
                    "source_text_preview": ref.get("source_text_preview", ""),
                }
                out["helper_hint"] = journal_reference_helper_hint(out)
                rows.append(out)

    rows.sort(
        key=lambda item: (
            item["category"],
            item["code"],
            item["source_field_kind"],
            to_int(item["branch_state"]),
            item["sheet_name"],
            to_int(item["sheet_row_id"]),
            to_int(item["sheet_language_column"]),
        )
    )
    return rows


def build_journal_coverage_index(inventory: list[dict[str, object]], journal_reference_index: list[dict[str, object]]) -> list[dict[str, object]]:
    grouped: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in journal_reference_index:
        grouped[clean(row.get("code", ""))].append(row)

    rows: list[dict[str, object]] = []
    for inv in inventory:
        code = clean(inv.get("code", ""))
        refs = grouped.get(code, [])
        unresolved = [row for row in refs if clean(row.get("resolved_status", "")) != "resolved"]
        item_refs = split_many(join_unique((row.get("item_refs", "") for row in refs), limit=None))
        branch_states = split_many(join_unique((row.get("branch_state", "") for row in refs), limit=None))
        source_kinds = split_many(join_unique((row.get("source_field_kind", "") for row in refs), limit=None))
        if unresolved:
            classification = "unresolved_journal_refs"
            helper_hint = "journal lookup repair helper"
        elif item_refs:
            classification = "resolved_with_item_refs"
            helper_hint = "journal item objective helper"
        elif refs:
            classification = "resolved_journal_refs"
            helper_hint = "journal branch objective helper"
        else:
            classification = "no_journal_refs"
            helper_hint = "journal formula review helper"
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "journal_ref_rows": len(refs),
                "resolved_ref_rows": len(refs) - len(unresolved),
                "unresolved_ref_rows": len(unresolved),
                "source_field_kinds": join_unique(source_kinds, limit=20),
                "branch_states": join_unique(branch_states, limit=80),
                "sheet_names": join_unique((row.get("sheet_name", "") for row in refs), limit=12),
                "sheet_row_ids_sample": join_unique((row.get("sheet_row_id", "") for row in refs), limit=80),
                "item_refs": join_unique(item_refs, limit=80),
                "english_samples": join_unique((row.get("text_en", "") for row in refs if clean(row.get("text_en", ""))), limit=4),
                "coverage_classification": classification,
                "helper_hint": helper_hint,
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def load_cutreplay_title_lookup(inputs: Inputs) -> dict[str, dict[str, str]]:
    lookup: dict[str, dict[str, str]] = {}
    path = inputs.path(DAT_MINING_DIR / "xtx_cutReplay.csv")
    for raw in dat_mining_table_rows(path):
        replay_id = clean(raw.get("row_id", ""))
        values = raw.get("values", {})
        if replay_id and isinstance(values, dict):
            lookup[replay_id] = values
    return lookup


def dat_cutreplay_helper_hint(row: dict[str, object]) -> str:
    status = clean(row.get("match_status", ""))
    if status == "raw_only":
        return "raw cutReplay recovery helper"
    if status == "recovered_only":
        return "recovered replay without raw dat helper"
    return replay_helper_hint(clean(row.get("payload_shape", "")))


def build_dat_cutreplay_index(
    inputs: Inputs,
    inventory_by_code: dict[str, dict[str, object]],
    replay_payload_index: list[dict[str, object]],
) -> list[dict[str, object]]:
    inventory_by_id = {clean(row.get("quest_id", "")): row for row in inventory_by_code.values() if clean(row.get("quest_id", ""))}
    included_ids = set(inventory_by_id)
    titles = load_cutreplay_title_lookup(inputs)
    recovered_by_id = {clean(row.get("replay_id", "")): row for row in replay_payload_index if clean(row.get("replay_id", ""))}
    raw_seen: set[str] = set()
    rows: list[dict[str, object]] = []
    path = inputs.path(DAT_MINING_DIR / "cutReplay.csv")

    for raw in dat_mining_table_rows(path):
        replay_id = clean(raw.get("row_id", ""))
        quest_id, _match_kind = dat_table_match_quest_id(replay_id, included_ids)
        if not quest_id:
            continue
        raw_seen.add(replay_id)
        inv = inventory_by_id[quest_id]
        values = raw.get("values", {})
        if not isinstance(values, dict):
            values = {}
        recovered = recovered_by_id.get(replay_id, {})
        title = titles.get(replay_id, {})
        slot_values = {
            "slot9": values.get("8", ""),
            "slot10": values.get("9", ""),
            "slot11": values.get("10", ""),
            "slot12": values.get("11", ""),
            "slot13": values.get("12", ""),
            "slot14": values.get("13", ""),
            "slot15": values.get("14", ""),
        }
        payload_shape = clean(recovered.get("payload_shape", "")) or replay_payload_shape(slot_values)
        out = {
            "code": inv.get("code", ""),
            "quest_id": quest_id,
            "quest_name": inv.get("quest_name", ""),
            "category": inv.get("category", ""),
            "local_status": inv.get("local_status", ""),
            "replay_id": replay_id,
            "match_status": "raw_and_recovered" if recovered else "raw_only",
            "raw_scene_key": values.get("0", ""),
            "recovered_scene_key": recovered.get("scene_key", ""),
            "cutscene_title_en": title.get("2", ""),
            "cutscene_title_ja": title.get("1", ""),
            "cutscene_title_de": title.get("3", ""),
            "cutscene_title_fr": title.get("4", ""),
            "raw_gate_field": values.get("6", ""),
            "raw_unlock_kind": values.get("7", ""),
            "recovered_unlock_kind": recovered.get("unlock_kind", ""),
            "payload_shape": payload_shape,
            "slot_hints": replay_slot_hints(slot_values),
            "slot9": slot_values["slot9"],
            "slot10": slot_values["slot10"],
            "slot11": slot_values["slot11"],
            "slot12": slot_values["slot12"],
            "slot13": slot_values["slot13"],
            "slot14": slot_values["slot14"],
            "slot15": slot_values["slot15"],
            "slot16": values.get("15", ""),
            "source_row": raw.get("source_row", ""),
            "row_snapshot": dat_row_snapshot(values),
        }
        out["helper_hint"] = dat_cutreplay_helper_hint(out)
        rows.append(out)

    for replay_id, recovered in recovered_by_id.items():
        if replay_id in raw_seen:
            continue
        code = clean(recovered.get("code", ""))
        inv = inventory_by_code.get(code, {})
        title = titles.get(replay_id, {})
        out = {
            "code": code,
            "quest_id": recovered.get("quest_id", inv.get("quest_id", "")),
            "quest_name": recovered.get("quest_name", inv.get("quest_name", "")),
            "category": recovered.get("category", inv.get("category", "")),
            "local_status": inv.get("local_status", ""),
            "replay_id": replay_id,
            "match_status": "recovered_only",
            "raw_scene_key": "",
            "recovered_scene_key": recovered.get("scene_key", ""),
            "cutscene_title_en": title.get("2", ""),
            "cutscene_title_ja": title.get("1", ""),
            "cutscene_title_de": title.get("3", ""),
            "cutscene_title_fr": title.get("4", ""),
            "raw_gate_field": "",
            "raw_unlock_kind": "",
            "recovered_unlock_kind": recovered.get("unlock_kind", ""),
            "payload_shape": recovered.get("payload_shape", ""),
            "slot_hints": recovered.get("slot_hints", ""),
            "slot9": recovered.get("slot9", ""),
            "slot10": recovered.get("slot10", ""),
            "slot11": recovered.get("slot11", ""),
            "slot12": recovered.get("slot12", ""),
            "slot13": recovered.get("slot13", ""),
            "slot14": recovered.get("slot14", ""),
            "slot15": recovered.get("slot15", ""),
            "slot16": "",
            "source_row": "",
            "row_snapshot": "",
        }
        out["helper_hint"] = dat_cutreplay_helper_hint(out)
        rows.append(out)

    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["replay_id"]), item["match_status"]))
    return rows


def reward_helper_hint(row: dict[str, str], explicit_grant_rows: list[dict[str, str]]) -> tuple[str, str, str]:
    reward_type = clean(row.get("rewardType", ""))
    auto_grant = clean(row.get("autoGrant", ""))
    reward_id = clean(row.get("rewardId", ""))
    calls = {clean(call.get("call", "")) for call in explicit_grant_rows}
    args = [clean(call.get("args_preview", "")) for call in explicit_grant_rows]
    has_matching_grant = False

    if reward_type == "Exp":
        has_matching_grant = "AddExp" in calls
    elif reward_type == "Gil":
        has_matching_grant = "AddGil" in calls or any("1000001" in arg for arg in args)
    elif reward_type in {"Item", "Currency"} and reward_id:
        has_matching_grant = any(reward_id in arg for arg in args if arg)

    risk = ""
    note = ""

    if auto_grant == "1" and has_matching_grant:
        risk = "high"
        note = "quest has auto-grant data and a matching local explicit grant"
    elif auto_grant == "1" and explicit_grant_rows:
        risk = "medium"
        note = "quest has auto-grant data plus local grant calls; verify whether they target quest items or rewards"
    elif auto_grant == "1":
        risk = "medium"
        note = "auto-granted by quest completion data; avoid duplicate Lua grants"
    elif explicit_grant_rows:
        risk = "medium"
        note = "local script has explicit grant calls; verify exact ownership"
    else:
        risk = "low"
        note = "reward row is data evidence only"

    if reward_type in {"Gil", "Exp"}:
        helper = "CompleteQuest auto-grant / do not add explicit AddGil or AddExp without proof"
    elif reward_type in {"Item", "Currency"}:
        helper = "reward inventory audit / check duplicate item or currency grants"
    else:
        helper = "reward table review"
    return helper, risk, note


def marker_helper_hint(row: dict[str, str]) -> str:
    marker_class = clean(row.get("marker_class", ""))
    visible = clean(row.get("visible", ""))
    radius = to_int(row.get("radius", ""))
    if visible and visible.lower() != "visible":
        return "marker visibility gate audit"
    if marker_class == "MapMarkerQuest":
        return "quest sequence marker review / getSequenceMarkerList"
    if marker_class == "MapMarker" and radius == 0:
        return "point marker review / confirm sequence slot"
    return "marker table review"


def actor_surface_helper_hint(row: dict[str, str]) -> str:
    flag_expr = clean(row.get("flag_expr", ""))
    gap = clean(row.get("actor_surface_gap", ""))
    actor_expr = clean(row.get("actor_expr", ""))
    if gap:
        return "actor surface gap audit before enabling route"
    if flag_expr:
        return "SetENpc flag route review"
    if actor_expr.upper().startswith("BNPC_"):
        return "BNPC materialization/objective owner review"
    return "actor surface review"


def server_flow_helper_hint(row: dict[str, str]) -> tuple[str, str]:
    category = clean(row.get("category", ""))
    call = clean(row.get("call", ""))
    line_text = clean(row.get("line_text", "")).lower()

    if category == "quest_state":
        if call in {"CompleteQuest", "AcceptQuest", "StartSequence", "SetSequence"}:
            return ("quest state helper review", "confirm route order and duplicate completion behavior")
        if call == "SetENpc":
            return ("actor/marker helper review", "confirm actor flags per sequence")
        return ("quest state audit", "confirm quest state mutation semantics")
    if category == "client_event_dispatch":
        if "delegate" in line_text:
            return ("delegateEvent helper review", "confirm payload and return value handling")
        return ("client event helper review", "confirm event dispatch owner")
    if category == "reward_or_inventory":
        return ("completeQuestWithRewards / reward helper audit", "do not duplicate auto-granted rewards")
    if category in {"event_warp", "warp_or_zone"}:
        return ("warp/content owner audit", "verify destination and completion semantics")
    if category == "actor_or_marker":
        return ("actor/marker helper review", "confirm map and ENpc state ownership")
    if category == "npc_linkshell":
        return ("sendNpcLsMessagePack review", "confirm linkshell step/data changes")
    if category == "quest_data":
        return ("quest data helper review", "confirm persistent data key usage")
    if category == "event_end":
        return ("event completion route review", "confirm event-end advances the intended sequence")
    if category == "player_message":
        return ("player message helper review", "confirm feedback text and reward messaging")
    return ("manual flow review", "")


def build_reward_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    explicit_grants_by_code: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in read_csv(inputs.path(SERVER_FLOW_CALLS)):
        code = norm_code(row.get("code", ""))
        if code in included and clean(row.get("call", "")) in {"AddItem", "AddExp", "AddGil"}:
            explicit_grants_by_code[code].append(row)

    rows: list[dict[str, object]] = []
    for reward in read_csv(inputs.path(QUEST_REWARDS)):
        code = norm_code(reward.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        helper, risk, note = reward_helper_hint(reward, explicit_grants_by_code.get(code, []))
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "sort_order": reward.get("sortOrder", ""),
                "reward_type": reward.get("rewardType", ""),
                "reward_id": reward.get("rewardId", ""),
                "quantity": reward.get("quantity", ""),
                "class_job_id": reward.get("classJobId", ""),
                "source": reward.get("source", ""),
                "auto_grant": reward.get("autoGrant", ""),
                "duplicate_grant_risk": risk,
                "helper_hint": helper,
                "review_note": note,
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["sort_order"]), item["reward_type"]))
    return rows


def build_marker_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for marker in read_csv(inputs.path(QUEST_MARKERS)):
        code = norm_code(marker.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "marker_id": marker.get("marker_id", ""),
                "slot": marker.get("slot", ""),
                "unknown_flag": marker.get("unknown_flag", ""),
                "x": marker.get("x", ""),
                "z": marker.get("z", ""),
                "map_group": marker.get("map_group", ""),
                "map_id": marker.get("map_id", ""),
                "radius": marker.get("radius", ""),
                "marker_class": marker.get("marker_class", ""),
                "display_name_id": marker.get("display_name_id", ""),
                "icon": marker.get("icon", ""),
                "visible": marker.get("visible", ""),
                "text_ref": marker.get("text_ref", ""),
                "helper_hint": marker_helper_hint(marker),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["slot"]), to_int(item["marker_id"])))
    return rows


def build_actor_surface_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for actor in read_csv(inputs.path(QUEST_ACTORS)):
        code = infer_included_code(actor, "code", included, ("file",))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        gap = clean(actor.get("actor_surface_gap", ""))
        has_actor_id = clean(actor.get("has_actor_class_id", "")) == "yes"
        has_actor_path = clean(actor.get("has_actor_path", "")) == "yes"
        if gap:
            confidence = "needs_join_review"
        elif has_actor_id and has_actor_path:
            confidence = "high"
        elif has_actor_id:
            confidence = "medium"
        else:
            confidence = "low"
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "source_file": actor.get("file", ""),
                "source_line": actor.get("line", ""),
                "function": actor.get("function", ""),
                "sequence_expr": actor.get("sequence_expr", ""),
                "actor_expr": actor.get("actor_expr", ""),
                "actor_class_id": actor.get("actor_class_id", ""),
                "actor_class_path": actor.get("actor_class_path", ""),
                "display_name_id": actor.get("display_name_id", ""),
                "quest_flag": actor.get("flag_expr", ""),
                "raw_args": actor.get("raw_args", ""),
                "confidence": confidence,
                "gap_status": actor.get("actor_surface_gap", ""),
                "helper_hint": actor_surface_helper_hint(actor),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], clean(item["source_file"]), to_int(item["source_line"])))
    return rows


def localized_lookup_from_dat_rows(path: Path, en_field: str = "1", ja_field: str = "0", de_field: str = "6", fr_field: str = "13") -> dict[str, dict[str, str]]:
    lookup: dict[str, dict[str, str]] = {}
    for raw in dat_mining_table_rows(path):
        row_id = clean(raw.get("row_id", ""))
        values = raw.get("values", {})
        if not row_id or not isinstance(values, dict):
            continue
        lookup[row_id] = {
            "en": clean(values.get(en_field, "")),
            "ja": clean(values.get(ja_field, "")),
            "de": clean(values.get(de_field, "")),
            "fr": clean(values.get(fr_field, "")),
        }
    return lookup


def load_display_name_lookup(inputs: Inputs) -> dict[str, dict[str, str]]:
    return localized_lookup_from_dat_rows(inputs.path(DAT_MINING_DIR / "xtx_displayName.csv"), en_field="1", ja_field="0", de_field="6", fr_field="13")


def load_place_name_lookup(inputs: Inputs) -> dict[str, dict[str, str]]:
    return localized_lookup_from_dat_rows(inputs.path(DAT_MINING_DIR / "xtx_placeName.csv"), en_field="1", ja_field="0", de_field="4", fr_field="6")


def localized_name(lookup: dict[str, dict[str, str]], row_id: object, language: str = "en") -> str:
    item = lookup.get(clean(row_id), {})
    return clean(item.get(language, ""))


def placeholder_localized_name(value: object) -> bool:
    text = clean(value)
    return not text or text in {"???", "????", "[en]", "[de]", "[fr]", "[未翻訳]", "NONE"}


def load_map_data_lookup(inputs: Inputs, place_lookup: dict[str, dict[str, str]]) -> dict[tuple[str, str], dict[str, str]]:
    path = inputs.path(DAT_MINING_DIR / "2Dmap_data.csv")
    rows: dict[tuple[str, str], dict[str, str]] = {}
    for raw in dat_mining_table_rows(path):
        values = raw.get("values", {})
        if not isinstance(values, dict):
            continue
        map_group = clean(values.get("0", ""))
        map_id = clean(values.get("1", ""))
        if not map_group or not map_id:
            continue
        place_ids = [clean(values.get(field, "")) for field in ("12", "13", "14") if clean(values.get(field, ""))]
        raw_place_names = [localized_name(place_lookup, place_id) for place_id in place_ids]
        resolved_place_names = [name for name in raw_place_names if not placeholder_localized_name(name)]
        item = {
            "map_group": map_group,
            "map_id": map_id,
            "map_variant": clean(values.get("2", "")),
            "place_ids": join_unique(place_ids, limit=6),
            "place_names": join_unique(resolved_place_names, limit=6),
            "place_names_raw": join_unique(raw_place_names, limit=6),
            "source_row": clean(raw.get("source_row", "")),
            "row_snapshot": dat_row_snapshot(values, limit=10),
        }
        key = (map_group, map_id)
        if key not in rows or clean(values.get("2", "")) == "0":
            rows[key] = item
    return rows


def load_sql_actor_class_lookup(inputs: Inputs) -> dict[str, dict[str, str]]:
    path = inputs.path(GAMEDATA_ACTOR_CLASS_SQL)
    lookup: dict[str, dict[str, str]] = {}
    if not path.exists():
        return lookup
    for line_number, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), start=1):
        values = parse_sql_values(line)
        if len(values) < 5:
            continue
        actor_id = clean(values[0])
        if not actor_id or not actor_id.lstrip("-").isdigit():
            continue
        conditions = clean(values[4])
        lookup[actor_id] = {
            "actor_class_id": actor_id,
            "class_path": clean(values[1]),
            "display_name_id": clean(values[2]),
            "property_flags": clean(values[3]),
            "event_condition_names": join_unique(re.findall(r'"conditionName"\s*:\s*"([^"]+)"', conditions), limit=20),
            "source_line": str(line_number),
        }
    return lookup


def actor_classes_by_display_id(actor_lookup: dict[str, dict[str, str]]) -> dict[str, list[str]]:
    by_display: dict[str, list[str]] = defaultdict(list)
    for actor_id, row in actor_lookup.items():
        display_name_id = clean(row.get("display_name_id", ""))
        if display_name_id and display_name_id != "0":
            by_display[display_name_id].append(actor_id)
    for rows in by_display.values():
        rows.sort(key=lambda value: to_int(value))
    return by_display


def load_sql_actor_appearance_lookup(inputs: Inputs) -> dict[str, dict[str, str]]:
    path = inputs.path(GAMEDATA_ACTOR_APPEARANCE_SQL)
    lookup: dict[str, dict[str, str]] = {}
    if not path.exists():
        return lookup
    for line_number, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), start=1):
        values = parse_sql_values(line)
        if len(values) < 40:
            continue
        actor_id = clean(values[0])
        if not actor_id:
            continue
        equipment_parts = []
        for name, index in (
            ("mainHand", 20),
            ("offHand", 21),
            ("head", 28),
            ("body", 29),
            ("legs", 30),
            ("hands", 31),
            ("feet", 32),
        ):
            value = clean(values[index]) if len(values) > index else ""
            if value and value not in {"0", "1024"}:
                equipment_parts.append(f"{name}={value}")
        lookup[actor_id] = {
            "appearance_base": clean(values[1]),
            "appearance_size": clean(values[2]),
            "hair_style": clean(values[3]),
            "face_type": clean(values[6]),
            "hair_color": clean(values[16]),
            "skin_color": clean(values[17]),
            "eye_color": clean(values[18]),
            "main_hand": clean(values[20]),
            "off_hand": clean(values[21]),
            "head": clean(values[28]),
            "body": clean(values[29]),
            "legs": clean(values[30]),
            "hands": clean(values[31]),
            "feet": clean(values[32]),
            "equipment_summary": join_unique(equipment_parts, limit=10),
            "source_line": str(line_number),
        }
    return lookup


def load_spawn_lookup(inputs: Inputs) -> dict[str, list[dict[str, str]]]:
    path = inputs.path(SERVER_EVENTNPC_SPAWN_LOCATIONS_SQL)
    by_actor: dict[str, list[dict[str, str]]] = defaultdict(list)
    if not path.exists():
        return by_actor
    for line_number, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), start=1):
        values = parse_sql_values(line)
        if len(values) < 11:
            continue
        actor_id = clean(values[1])
        if not actor_id:
            continue
        private_area = clean(values[4])
        private_part = f" {private_area}:{clean(values[5])}" if private_area else ""
        sample = f"{clean(values[2])}@zone{clean(values[3])}{private_part} {clean(values[6])},{clean(values[7])},{clean(values[8])}"
        by_actor[actor_id].append(
            {
                "spawn_id": clean(values[0]),
                "actor_class_id": actor_id,
                "unique_id": clean(values[2]),
                "zone_id": clean(values[3]),
                "private_area": private_area,
                "private_area_level": clean(values[5]),
                "x": clean(values[6]),
                "y": clean(values[7]),
                "z": clean(values[8]),
                "rotation": clean(values[9]),
                "motion_pack": clean(values[10]),
                "sample": sample,
                "source_line": str(line_number),
            }
        )
    return by_actor


def load_actor_graphic_lookup(inputs: Inputs) -> dict[str, dict[str, str]]:
    path = inputs.path(DAT_MINING_DIR / "actorclass_graphic.csv")
    lookup: dict[str, dict[str, str]] = {}
    for raw in dat_mining_table_rows(path):
        actor_id = clean(raw.get("row_id", ""))
        values = raw.get("values", {})
        if not actor_id or not isinstance(values, dict):
            continue
        lookup[actor_id] = {
            "dat_graphic_base": clean(values.get("6", "")),
            "dat_graphic_size": clean(values.get("7", "")),
            "dat_graphic_snapshot": dat_row_snapshot(values, limit=14),
        }
    return lookup


def marker_resolution_helper_hint(row: dict[str, object]) -> str:
    display_name = clean(row.get("display_name_en", ""))
    marker_class = clean(row.get("marker_class", "")).lower()
    if not display_name or display_name in {"???", "????", "[en]", "[未翻訳]", "NONE"}:
        return "unknown marker display review"
    if to_int(row.get("actor_class_candidate_count", "")):
        return "marker display actor candidate helper"
    if "area" in marker_class or to_int(row.get("radius", "")) > 0:
        return "area marker route helper"
    return "marker display resolution helper"


def actor_resolution_helper_hint(row: dict[str, object]) -> str:
    if clean(row.get("gap_status", "")):
        return "actor surface gap audit before enabling route"
    if "path_mismatch_review" in split_many(row.get("resolution_status", "")):
        return "actor class path mismatch review"
    if "missing_sql_actor_class" in split_many(row.get("resolution_status", "")):
        return "actor SQL lookup gap helper"
    if to_int(row.get("spawn_count", "")):
        return "actor spawn route helper"
    if clean(row.get("quest_flag", "")):
        return "SetENpc flag route review"
    return "actor display/appearance helper"


def build_marker_resolution_index(inputs: Inputs, marker_index: list[dict[str, object]]) -> list[dict[str, object]]:
    display_lookup = load_display_name_lookup(inputs)
    place_lookup = load_place_name_lookup(inputs)
    map_lookup = load_map_data_lookup(inputs, place_lookup)
    actor_lookup = load_sql_actor_class_lookup(inputs)
    actor_by_display = actor_classes_by_display_id(actor_lookup)
    graphic_lookup = load_actor_graphic_lookup(inputs)
    rows: list[dict[str, object]] = []

    for marker in marker_index:
        display_name_id = clean(marker.get("display_name_id", ""))
        display = display_lookup.get(display_name_id, {})
        display_name_en = clean(display.get("en", ""))
        candidate_ids = actor_by_display.get(display_name_id, [])
        direct_actor = actor_lookup.get(display_name_id, {})
        direct_graphic = graphic_lookup.get(display_name_id, {})
        map_row = map_lookup.get((clean(marker.get("map_group", "")), clean(marker.get("map_id", ""))), {})
        candidate_names = []
        candidate_paths = []
        for actor_id in candidate_ids[:12]:
            actor = actor_lookup.get(actor_id, {})
            candidate_names.append(localized_name(display_lookup, actor.get("display_name_id", "")))
            candidate_paths.append(actor.get("class_path", ""))

        statuses: list[str] = []
        if not display_name_id or display_name_id == "0":
            statuses.append("missing_display_name_id")
        elif not display:
            statuses.append("missing_display_name_lookup")
        elif display_name_en in {"", "???", "????", "[en]", "[未翻訳]", "NONE"}:
            statuses.append("unknown_display_name")
        else:
            statuses.append("display_name_resolved")
        if candidate_ids:
            statuses.append("actor_candidates_by_display_name")
        if direct_actor:
            statuses.append("direct_actor_class_row")
        if clean(map_row.get("place_names", "")):
            statuses.append("map_place_resolved")
        elif clean(map_row.get("place_names_raw", "")):
            statuses.append("map_place_placeholder_only")
        else:
            statuses.append("map_place_missing")

        out = {
            **marker,
            "map_lookup_status": "map_data_found" if map_row else "missing_map_data",
            "map_variant": map_row.get("map_variant", ""),
            "map_place_ids": map_row.get("place_ids", ""),
            "map_place_names": map_row.get("place_names", ""),
            "map_place_raw_names": map_row.get("place_names_raw", ""),
            "map_data_source_row": map_row.get("source_row", ""),
            "display_name_en": display_name_en,
            "display_name_ja": display.get("ja", ""),
            "display_name_de": display.get("de", ""),
            "display_name_fr": display.get("fr", ""),
            "actor_class_candidate_count": len(candidate_ids),
            "actor_class_candidates": join_unique(candidate_ids, limit=12),
            "actor_candidate_names": join_unique(candidate_names, limit=12),
            "actor_candidate_paths": join_unique(candidate_paths, limit=12),
            "direct_actor_class_path": direct_actor.get("class_path", ""),
            "direct_actor_display_name_id": direct_actor.get("display_name_id", ""),
            "direct_actor_display_name_en": localized_name(display_lookup, direct_actor.get("display_name_id", "")),
            "direct_actor_property_flags": direct_actor.get("property_flags", ""),
            "dat_graphic_base": direct_graphic.get("dat_graphic_base", ""),
            "dat_graphic_size": direct_graphic.get("dat_graphic_size", ""),
            "dat_graphic_snapshot": direct_graphic.get("dat_graphic_snapshot", ""),
            "resolution_status": join_unique(statuses, limit=12),
        }
        out["helper_hint"] = marker_resolution_helper_hint(out)
        rows.append(out)

    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["slot"]), to_int(item["marker_id"])))
    return rows


def build_actor_resolution_index(inputs: Inputs, actor_surface_index: list[dict[str, object]]) -> list[dict[str, object]]:
    display_lookup = load_display_name_lookup(inputs)
    actor_lookup = load_sql_actor_class_lookup(inputs)
    appearance_lookup = load_sql_actor_appearance_lookup(inputs)
    graphic_lookup = load_actor_graphic_lookup(inputs)
    spawn_lookup = load_spawn_lookup(inputs)
    rows: list[dict[str, object]] = []

    for actor in actor_surface_index:
        actor_id = clean(actor.get("actor_class_id", ""))
        sql_actor = actor_lookup.get(actor_id, {})
        display_name_id = first_value(actor.get("display_name_id", ""), sql_actor.get("display_name_id", ""))
        display = display_lookup.get(display_name_id, {})
        appearance = appearance_lookup.get(actor_id, {})
        graphic = graphic_lookup.get(actor_id, {})
        spawns = spawn_lookup.get(actor_id, [])
        actor_path = clean(actor.get("actor_class_path", ""))
        sql_path = clean(sql_actor.get("class_path", ""))
        if actor_path and sql_path:
            path_match_status = "path_match" if actor_path == sql_path else "path_mismatch"
        elif actor_path or sql_path:
            path_match_status = "path_partial"
        else:
            path_match_status = "path_missing"

        statuses: list[str] = ["sql_actor_class_found" if sql_actor else "missing_sql_actor_class"]
        display_name_en = clean(display.get("en", ""))
        if display_name_id and display and display_name_en not in {"", "???", "????", "[en]", "[未翻訳]", "NONE"}:
            statuses.append("display_name_resolved")
        else:
            statuses.append("missing_display_name")
        statuses.append("appearance_found" if appearance else "appearance_missing")
        statuses.append("spawn_found" if spawns else "spawn_missing")
        if path_match_status == "path_mismatch":
            statuses.append("path_mismatch_review")

        out = {
            **actor,
            "sql_class_path": sql_path,
            "path_match_status": path_match_status,
            "display_name_id": display_name_id,
            "display_name_en": display_name_en,
            "display_name_ja": display.get("ja", ""),
            "display_name_de": display.get("de", ""),
            "display_name_fr": display.get("fr", ""),
            "property_flags": sql_actor.get("property_flags", ""),
            "event_condition_names": sql_actor.get("event_condition_names", ""),
            "appearance_status": "appearance_found" if appearance else "appearance_missing",
            "appearance_base": appearance.get("appearance_base", ""),
            "appearance_size": appearance.get("appearance_size", ""),
            "hair_style": appearance.get("hair_style", ""),
            "face_type": appearance.get("face_type", ""),
            "hair_color": appearance.get("hair_color", ""),
            "skin_color": appearance.get("skin_color", ""),
            "eye_color": appearance.get("eye_color", ""),
            "equipment_summary": appearance.get("equipment_summary", ""),
            "dat_graphic_base": graphic.get("dat_graphic_base", ""),
            "dat_graphic_size": graphic.get("dat_graphic_size", ""),
            "dat_graphic_snapshot": graphic.get("dat_graphic_snapshot", ""),
            "spawn_count": len(spawns),
            "spawn_samples": join_unique((row.get("sample", "") for row in spawns), limit=8),
            "resolution_status": join_unique(statuses, limit=12),
        }
        out["helper_hint"] = actor_resolution_helper_hint(out)
        rows.append(out)

    rows.sort(key=lambda item: (item["category"], item["code"], clean(item["source_file"]), to_int(item["source_line"])))
    return rows


def build_marker_actor_coverage_index(
    inventory: list[dict[str, object]],
    marker_resolution_index: list[dict[str, object]],
    actor_resolution_index: list[dict[str, object]],
) -> list[dict[str, object]]:
    markers_by_code: dict[str, list[dict[str, object]]] = defaultdict(list)
    actors_by_code: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in marker_resolution_index:
        markers_by_code[clean(row.get("code", ""))].append(row)
    for row in actor_resolution_index:
        actors_by_code[clean(row.get("code", ""))].append(row)

    rows: list[dict[str, object]] = []
    for inv in inventory:
        code = clean(inv.get("code", ""))
        markers = markers_by_code.get(code, [])
        actors = actors_by_code.get(code, [])
        unknown_marker_count = sum(
            1
            for row in markers
            if "unknown_display_name" in split_many(row.get("resolution_status", ""))
            or "missing_display_name_lookup" in split_many(row.get("resolution_status", ""))
            or "missing_display_name_id" in split_many(row.get("resolution_status", ""))
        )
        actor_missing_sql_count = sum(1 for row in actors if "missing_sql_actor_class" in split_many(row.get("resolution_status", "")))
        spawn_backed_actor_count = sum(1 for row in actors if to_int(row.get("spawn_count", "")) > 0)
        area_marker_count = sum(1 for row in markers if "area" in clean(row.get("marker_class", "")).lower() or to_int(row.get("radius", "")) > 0)

        if not markers and not actors:
            classification = "no_marker_actor_surface"
            helper = "no marker/actor surface in current data"
        elif unknown_marker_count or actor_missing_sql_count:
            classification = "marker_actor_gap_review"
            helper = "marker/actor lookup gap helper"
        elif spawn_backed_actor_count:
            classification = "spawn_backed_actor_routes"
            helper = "spawn-backed NPC route helper"
        else:
            classification = "marker_actor_resolved"
            helper = "resolved marker/actor evidence helper"

        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "marker_rows": len(markers),
                "actor_rows": len(actors),
                "unknown_marker_display_rows": unknown_marker_count,
                "actor_missing_sql_rows": actor_missing_sql_count,
                "spawn_backed_actor_rows": spawn_backed_actor_count,
                "area_marker_rows": area_marker_count,
                "marker_display_ids": join_unique((row.get("display_name_id", "") for row in markers), limit=30),
                "marker_display_names": join_unique((row.get("display_name_en", "") for row in markers), limit=30),
                "actor_class_ids": join_unique((row.get("actor_class_id", "") for row in actors), limit=30),
                "actor_display_names": join_unique((row.get("display_name_en", "") for row in actors), limit=30),
                "map_places": join_unique((row.get("map_place_names", "") for row in markers), limit=20),
                "spawn_samples": join_unique((row.get("spawn_samples", "") for row in actors), limit=12),
                "coverage_classification": classification,
                "helper_hint": helper,
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def build_server_flow_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for flow in read_csv(inputs.path(SERVER_FLOW_CALLS)):
        code = norm_code(flow.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        helper, risk = server_flow_helper_hint(flow)
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "server_script": flow.get("server_script", ""),
                "server_file": flow.get("server_file", ""),
                "line": flow.get("line", ""),
                "receiver": flow.get("receiver", ""),
                "call": flow.get("call", ""),
                "flow_category": flow.get("category", ""),
                "arg_count": flow.get("arg_count", ""),
                "args_preview": flow.get("args_preview", ""),
                "line_text": flow.get("line_text", ""),
                "helper_hint": helper,
                "risk_note": risk,
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], clean(item["server_script"]), to_int(item["line"])))
    return rows


def bnpc_objective_helper_hint(row: dict[str, str]) -> str:
    materialization = clean(row.get("materialization_status", ""))
    objective_item = clean(row.get("objective_item_id", ""))
    objective_count = clean(row.get("objective_count", ""))
    if materialization == "ambient_server_spawn":
        return "ambient BNPC objective / verify kill-drop callback"
    if materialization == "no_mob_type":
        return "BNPC materialization helper needed / actor-class to mob-type join"
    if objective_item and objective_count:
        return "drop/count objective helper review"
    if objective_item:
        return "drop item objective helper review"
    return "BNPC objective helper review"


def spawn_point_helper_hint(row: dict[str, str]) -> str:
    surface = clean(row.get("spawn_surface", ""))
    needs_capture = clean(row.get("needs_capture", ""))
    if surface == "ambient_server_spawn":
        return "existing ambient spawn / verify quest callback ownership"
    if needs_capture.lower() == "yes":
        return "spawn point capture/proof needed before materialization"
    if clean(row.get("private_area", "")):
        return "private-area spawn owner review"
    return "spawn point review"


def director_helper_hint(row: dict[str, str], source: str) -> str:
    flags = clean(row.get("feature_flags", "")).lower()
    parity = clean(row.get("parity_status", ""))
    if "kill_objective" in flags:
        return "quest director kill/objective helper review"
    if "zone_change" in flags:
        return "quest director zone-change helper review"
    if "delegate_event" in flags:
        return "quest director delegate-event helper review"
    if source == "recovered_director" and "missing_director" in parity:
        return "local director binding recovery candidate"
    if source == "local_director":
        return "local quest director audit"
    return "quest director review"


def build_bnpc_objective_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for objective in read_csv(inputs.path(QUEST_BNPC_OBJECTIVES)):
        code = norm_code(objective.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "sequence": objective.get("sequence", ""),
                "objective_constant": objective.get("objective_constant", ""),
                "actor_class_id": objective.get("actor_class_id", ""),
                "actor_class_path": objective.get("actor_class_path", ""),
                "objective_item_id": objective.get("objective_item_id", ""),
                "objective_count": objective.get("objective_count", ""),
                "bnpc_id": objective.get("bnpc_id", ""),
                "display_name": objective.get("display_name", ""),
                "min_level": objective.get("min_level", ""),
                "max_level": objective.get("max_level", ""),
                "materialization_status": objective.get("materialization_status", ""),
                "confidence": objective.get("confidence", ""),
                "helper_hint": bnpc_objective_helper_hint(objective),
                "next_action": objective.get("next_action", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], item["objective_constant"], item["actor_class_id"]))
    return rows


def build_spawn_point_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    seen: set[tuple[str, str]] = set()

    for spawn in read_csv(inputs.path(BNPC_SPAWN_POINTS)):
        code = norm_code(spawn.get("quest_code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        unique_id = clean(spawn.get("unique_id", ""))
        seen.add((code, unique_id))
        rows.append(
            {
                "source": "quest_bnpc_spawn_points",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "objective_constant": spawn.get("constant", ""),
                "actor_class_id": spawn.get("actor_class_id", ""),
                "bnpc_id": spawn.get("bnpc_type_id", ""),
                "display_name": spawn.get("mob_display_name", ""),
                "spawn_surface": "ambient_server_spawn",
                "spawn_id": spawn.get("spawn_id", ""),
                "unique_id": unique_id,
                "zone_id": spawn.get("zone_id", ""),
                "zone_name": spawn.get("zone_name", ""),
                "private_area": "",
                "x": spawn.get("pos_x", ""),
                "y": spawn.get("pos_y", ""),
                "z": spawn.get("pos_z", ""),
                "rot": spawn.get("rot", ""),
                "confidence": "high",
                "needs_capture": "yes",
                "source_ref": f"{spawn.get('script', '')}:{spawn.get('spawn_sql_line', '')}",
                "raw_sample": "",
                "helper_hint": spawn_point_helper_hint({"spawn_surface": "ambient_server_spawn", "needs_capture": "yes"}),
            }
        )

    for spawn in read_csv(inputs.path(QUEST_SPAWN_POINTS)):
        code = norm_code(spawn.get("code", ""))
        if code not in included:
            continue
        unique_id = clean(spawn.get("unique_id", ""))
        if (code, unique_id) in seen:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "quest_normalized_data_pack",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "objective_constant": "",
                "actor_class_id": spawn.get("actor_class_id", ""),
                "bnpc_id": spawn.get("bnpc_id", ""),
                "display_name": "",
                "spawn_surface": spawn.get("spawn_surface", ""),
                "spawn_id": spawn.get("spawn_id", ""),
                "unique_id": unique_id,
                "zone_id": spawn.get("zone_id", ""),
                "zone_name": spawn.get("zone_name", ""),
                "private_area": spawn.get("private_area", ""),
                "x": spawn.get("x", ""),
                "y": spawn.get("y", ""),
                "z": spawn.get("z", ""),
                "rot": spawn.get("rot", ""),
                "confidence": spawn.get("confidence", ""),
                "needs_capture": spawn.get("needs_capture", ""),
                "source_ref": spawn.get("source", ""),
                "raw_sample": spawn.get("raw_sample", ""),
                "helper_hint": spawn_point_helper_hint(spawn),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], item["zone_name"], to_int(item["spawn_id"]), item["unique_id"], item["source"]))
    return rows


def build_director_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []

    for director in read_csv(inputs.path(RECOVERED_DIRECTORS)):
        code = norm_code(director.get("inferred_code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "recovered_director",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "director": director.get("director", ""),
                "variant": director.get("variant", ""),
                "director_suffix": director.get("director_suffix", ""),
                "source_path": director.get("source_path", ""),
                "local_quest_paths": director.get("local_quest_paths", ""),
                "local_director_path": director.get("local_director_path", ""),
                "parity_status": director.get("parity_status", ""),
                "line_count": director.get("line_count", ""),
                "function_count": director.get("function_count", ""),
                "functions": director.get("functions", ""),
                "feature_flags": director.get("feature_flags", ""),
                "classes": director.get("classes", ""),
                "helper_hint": director_helper_hint(director, "recovered_director"),
            }
        )

    for director in read_csv(inputs.path(LOCAL_DIRECTORS)):
        code = infer_included_code(director, "code", included, ("director", "path"))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "local_director",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "director": director.get("director", ""),
                "variant": "local",
                "director_suffix": "",
                "source_path": director.get("path", ""),
                "local_quest_paths": inv.get("local_script_path", ""),
                "local_director_path": director.get("path", ""),
                "parity_status": "local_director_present",
                "line_count": director.get("line_count", ""),
                "function_count": director.get("function_count", ""),
                "functions": director.get("functions", ""),
                "feature_flags": director.get("feature_flags", ""),
                "classes": director.get("director", ""),
                "helper_hint": director_helper_hint(director, "local_director"),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], item["director"]))
    return rows


def execution_helper_hint(row: dict[str, str]) -> str:
    if to_int(row.get("missing_local_scene_event_rows", "")):
        return "scene push recovery candidate"
    if to_int(row.get("after_warp_scene_event_rows", "")):
        return "after-warp lifetime probe"
    if to_int(row.get("warp_or_content_event_rows", "")):
        return "content/warp ownership audit"
    if to_int(row.get("ask_event_rows", "")):
        return "ask/return-value route probe"
    return "execution evidence review"


def runtime_probe_helper_hint(lane: str, mutation_policy: str) -> str:
    lane_lower = lane.lower()
    policy_lower = mutation_policy.lower()
    if "fight" in lane_lower or "bnpc" in lane_lower or "sqb" in lane_lower:
        return "fight runtime proof before materialization"
    if "snpc" in lane_lower:
        return "SNPC payload capture before patch"
    if "cutscene" in lane_lower:
        return "cutscene delegate payload probe"
    if "probe_only" in policy_lower:
        return "probe-only runtime capture"
    return "runtime proof review"


def enablement_helper_hint(row: dict[str, str], push_row: dict[str, str]) -> str:
    safety_class = clean(row.get("safety_class", ""))
    push_class = clean(push_row.get("push_enablement_class", ""))
    if "blocked" in safety_class.lower() or "blocked" in push_class.lower():
        return "blocked enablement audit"
    if clean(row.get("reward_duplication_risk", "")) or clean(push_row.get("reward_lock_status", "")):
        return "reward lock/duplication audit"
    if clean(row.get("fight_or_content_risk", "")):
        return "fight/content risk audit"
    if push_class:
        return "safe-push enablement review"
    return "quest enablement safety review"


def roadmap_helper_hint(row: dict[str, str]) -> str:
    lane = clean(row.get("lane", "")).lower()
    status = clean(row.get("status", "")).lower()
    if "bnpc" in lane or "fight" in lane:
        return "fight/materialization roadmap item"
    if "cutscene" in lane or "push" in lane:
        return "cutscene push roadmap item"
    if "reward" in status:
        return "reward-locked roadmap item"
    return "implementation roadmap item"


def push_operator_helper_hint(row: dict[str, str]) -> str:
    lane = clean(first_value(row.get("operator_lane", ""), row.get("cutscene_operator_counts", ""))).lower()
    risk = clean(row.get("risk_class", "")).lower()
    if "fight" in lane:
        return "fight push/operator proof"
    if "cutscene" in lane:
        return "cutscene push/operator proof"
    if risk == "high":
        return "high-risk push dependency review"
    return "push/operator review"


def build_execution_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for execution in read_csv(inputs.path(QUEST_EXECUTION_SUMMARY)):
        code = norm_code(execution.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_rows": execution.get("event_rows", ""),
                "scene_event_rows": execution.get("scene_event_rows", ""),
                "scene_keys": execution.get("scene_keys", ""),
                "missing_local_scene_event_rows": execution.get("missing_local_scene_event_rows", ""),
                "after_warp_scene_event_rows": execution.get("after_warp_scene_event_rows", ""),
                "ask_event_rows": execution.get("ask_event_rows", ""),
                "warp_or_content_event_rows": execution.get("warp_or_content_event_rows", ""),
                "local_delegate_total": execution.get("local_delegate_total", ""),
                "priority_reason": execution.get("priority_reason", ""),
                "helper_hint": execution_helper_hint(execution),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def build_scene_push_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for push in read_csv(inputs.path(QUEST_SCENE_PUSH_MAP)):
        code = norm_code(push.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "function": push.get("function", ""),
                "event_method": push.get("event_method", ""),
                "function_line": push.get("function_line", ""),
                "arg_count": push.get("arg_count", ""),
                "extra_arg_count_guess": push.get("extra_arg_count_guess", ""),
                "scene_keys": push.get("scene_keys", ""),
                "scene_call_count": push.get("scene_call_count", ""),
                "scene_calls": push.get("scene_calls", ""),
                "cutreplay_rows": push.get("cutReplay_rows", ""),
                "fade_mode": push.get("fade_mode", ""),
                "has_fade_out": push.get("has_fade_out", ""),
                "ask_rows": push.get("ask_rows", ""),
                "has_warp_or_content": push.get("has_warp_or_content", ""),
                "local_delegate_count": push.get("local_delegate_count", ""),
                "local_delegate_callers": push.get("local_delegate_callers", ""),
                "push_recipe": push.get("push_recipe", ""),
                "risk_notes": push.get("risk_notes", ""),
                "helper_hint": execution_helper_hint(
                    {
                        "missing_local_scene_event_rows": "1" if not clean(push.get("local_delegate_count", "")) else "",
                        "after_warp_scene_event_rows": "1" if "after" in clean(push.get("risk_notes", "")).lower() else "",
                        "warp_or_content_event_rows": push.get("has_warp_or_content", ""),
                        "ask_event_rows": push.get("ask_rows", ""),
                    }
                ),
                "recovered_path": push.get("recovered_path", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["function_line"]), item["event_method"]))
    return rows


def build_runtime_probe_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []

    for probe in read_csv(inputs.path(QUEST_RUNTIME_WORKQUEUE)):
        code = norm_code(probe.get("subject", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        lane = probe.get("runtime_lane", "")
        policy = probe.get("mutation_policy", "")
        rows.append(
            {
                "source": "runtime_probe_workqueue",
                "priority": probe.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "lane": lane,
                "target": probe.get("target", ""),
                "event_method": "",
                "scene_keys": "",
                "actor_or_owner": "",
                "command": probe.get("first_command_or_probe", ""),
                "template": "",
                "expected_signal": probe.get("expected_signal", ""),
                "mutation_policy": policy,
                "capture_points": probe.get("capture_points", ""),
                "risk_notes": "",
                "helper_hint": runtime_probe_helper_hint(lane, policy),
                "source_csv": probe.get("source_csv", ""),
            }
        )

    for probe in read_csv(inputs.path(QUEST_CUTSCENE_RUNTIME_PLAN)):
        code = norm_code(probe.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        lane = probe.get("probe_lane", "")
        policy = probe.get("mutation_policy", "")
        rows.append(
            {
                "source": "cutscene_runtime_probe_plan",
                "priority": probe.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "lane": lane,
                "target": probe.get("actor_or_owner", ""),
                "event_method": probe.get("event_method", ""),
                "scene_keys": probe.get("scene_keys", ""),
                "actor_or_owner": probe.get("actor_or_owner", ""),
                "command": probe.get("candidate_command", ""),
                "template": probe.get("candidate_push_template", ""),
                "expected_signal": probe.get("expected_signal", ""),
                "mutation_policy": policy,
                "capture_points": join_unique([probe.get("payload_to_capture", ""), probe.get("wait_recipe", ""), probe.get("end_event_policy", "")], limit=10),
                "risk_notes": probe.get("blocker_notes", ""),
                "helper_hint": runtime_probe_helper_hint(lane, policy),
                "source_csv": probe.get("source_csv", ""),
            }
        )

    for probe in read_csv(inputs.path(QUEST_FIGHT_RUNTIME_PLAN)):
        code = norm_code(probe.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        lane = probe.get("fight_lane", "")
        policy = probe.get("mutation_policy", "")
        rows.append(
            {
                "source": "fight_runtime_probe_plan",
                "priority": probe.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "lane": lane,
                "target": probe.get("actor_class_id", ""),
                "event_method": "",
                "scene_keys": "",
                "actor_or_owner": probe.get("actor_class_path", ""),
                "command": first_value(probe.get("smoke_command", ""), probe.get("local_setup_commands", "")),
                "template": "",
                "expected_signal": probe.get("expected_signal", ""),
                "mutation_policy": policy,
                "capture_points": join_unique([probe.get("materialization_step", ""), probe.get("capture_points", "")], limit=10),
                "risk_notes": probe.get("risk_notes", ""),
                "helper_hint": runtime_probe_helper_hint(lane, policy),
                "source_csv": probe.get("source_csv", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["lane"]))
    return rows


def build_enablement_index(inputs: Inputs, inventory: list[dict[str, object]]) -> list[dict[str, object]]:
    safety_by_code = rows_by_code(read_csv(inputs.path(QUEST_ENABLEMENT_SAFETY)))
    push_by_code = rows_by_code(read_csv(inputs.path(QUEST_SAFE_PUSH_ENABLEMENT)))
    rows: list[dict[str, object]] = []
    for inv in inventory:
        code = norm_code(inv.get("code", ""))
        safety = safety_by_code.get(code, {})
        push = push_by_code.get(code, {})
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "parity_status": inv.get("parity_status", ""),
                "gate_key": first_value(safety.get("gate_key", ""), push.get("gate_key", "")),
                "gate_value": first_value(safety.get("gate_value", ""), push.get("gate_value", "")),
                "no_offer": first_value(safety.get("no_offer", ""), push.get("no_offer", "")),
                "effective_offerable": safety.get("effective_offerable", ""),
                "safety_class": first_value(safety.get("safety_class", ""), push.get("safety_class", "")),
                "enablement_action": first_value(safety.get("enablement_action", ""), push.get("enablement_action", "")),
                "push_enablement_class": push.get("push_enablement_class", ""),
                "recommended_action": push.get("recommended_action", ""),
                "owner_use_scope": push.get("owner_use_scope", ""),
                "retail_sequence_status": push.get("retail_sequence_status", ""),
                "reward_lock_status": push.get("reward_lock_status", ""),
                "safe_to_enable_rewards": push.get("safe_to_enable_rewards", ""),
                "reward_duplication_risk": safety.get("reward_duplication_risk", ""),
                "fight_or_content_risk": first_value(safety.get("fight_or_content_risk", ""), push.get("fight_or_content_risk", "")),
                "missing_scene_push_rows": first_value(safety.get("missing_scene_push_rows", ""), push.get("missing_scene_push_rows", "")),
                "after_warp_rows": first_value(safety.get("after_warp_rows", ""), push.get("after_warp_rows", "")),
                "bnpc_rows": first_value(safety.get("bnpc_rows", ""), push.get("bnpc_rows", "")),
                "reward_gap_rows": first_value(safety.get("reward_gap_rows", ""), push.get("reward_gap_rows", "")),
                "blocker_notes": push.get("blocker_notes", ""),
                "log_only": safety.get("log_only", ""),
                "log_only_reason": safety.get("log_only_reason", ""),
                "helper_hint": enablement_helper_hint(safety, push),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def build_implementation_roadmap_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for road in read_csv(inputs.path(QUEST_IMPLEMENTATION_ROADMAP)):
        code = norm_code(road.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "priority": road.get("priority", ""),
                "lane": road.get("lane", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "target": road.get("target", ""),
                "status": road.get("status", ""),
                "recommended_action": road.get("recommended_action", ""),
                "blocker": road.get("blocker", ""),
                "evidence": road.get("evidence", ""),
                "helper_hint": roadmap_helper_hint(road),
                "source_csv": road.get("source_csv", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["lane"], item["target"]))
    return rows


def build_push_operator_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for operator in read_csv(inputs.path(QUEST_PUSH_OPERATORS)):
        code = norm_code(operator.get("subject", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "quest_push_operator_rows",
                "priority": operator.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "operator_lane": operator.get("operator_lane", ""),
                "subject_type": operator.get("subject_type", ""),
                "target": operator.get("target", ""),
                "scene_key": operator.get("scene_key", ""),
                "current_status": operator.get("current_status", ""),
                "known_command": operator.get("known_command", ""),
                "missing_command": operator.get("missing_command", ""),
                "command_or_patch_template": operator.get("command_or_patch_template", ""),
                "safe_to_execute": operator.get("safe_to_execute", ""),
                "risk_class": operator.get("risk_class", ""),
                "gate_policy": operator.get("gate_policy", ""),
                "data_needed": operator.get("data_needed", ""),
                "next_best_operator_step": "",
                "helper_hint": push_operator_helper_hint(operator),
                "local_evidence": operator.get("local_evidence", ""),
                "source_csv": operator.get("source_csv", ""),
            }
        )
    for dep in read_csv(inputs.path(QUEST_PUSH_DEPENDENCIES)):
        code = norm_code(dep.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "quest_push_dependency_bundles",
                "priority": "",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "operator_lane": dep.get("cutscene_operator_counts", ""),
                "subject_type": "quest_bundle",
                "target": dep.get("quest_ids", ""),
                "scene_key": "",
                "current_status": "",
                "known_command": dep.get("known_commands", ""),
                "missing_command": dep.get("missing_commands", ""),
                "command_or_patch_template": "",
                "safe_to_execute": "",
                "risk_class": dep.get("risk_class", ""),
                "gate_policy": "",
                "data_needed": "",
                "next_best_operator_step": dep.get("next_best_operator_step", ""),
                "helper_hint": push_operator_helper_hint(dep),
                "local_evidence": "",
                "source_csv": "",
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], -to_int(item["priority"]), item["operator_lane"], item["target"]))
    return rows


def local_runtime_helper_hint(source: str, row: dict[str, str]) -> str:
    if source == "local_quest_constants":
        if clean(row.get("actor_class_path", "")):
            return "local actor constant binding"
        return "local constant inventory"
    if source == "local_quest_enpc_bindings":
        if clean(row.get("actor_class_id", "")):
            return "SetENpc actor-class binding proof"
        return "dynamic ENpc binding review"
    if source == "local_delegate_push_calls":
        if clean(row.get("match_kind", "")):
            return "matched local delegate push audit"
        return "local delegate push proof"
    if source == "unmatched_active_delegate_calls":
        return "unmatched delegate owner/method recovery"
    if source == "local_event_lifecycle_actions":
        action = clean(row.get("action", "")).lower()
        if "end" in action:
            return "event lifetime/end policy audit"
        return "event lifecycle action review"
    return "local runtime surface review"


def build_local_runtime_surface_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []

    for row in read_csv(inputs.path(QUEST_LOCAL_CONSTANTS)):
        code = pick_included_code(row, included, ("code",), ("file",))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "local_quest_constants",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "source_file": row.get("file", ""),
                "source_line": "",
                "function": "",
                "sequence_expr": "",
                "surface_kind": "constant",
                "name_or_action": row.get("constant", ""),
                "value_or_target": row.get("value", ""),
                "actor_class_id": "",
                "actor_class_path": row.get("actor_class_path", ""),
                "display_name_id": row.get("display_name_id", ""),
                "flag_expr": "",
                "event_method": "",
                "call_kind": "",
                "target_kind": "",
                "target_code": "",
                "extra_arg_count": "",
                "match_kind": "",
                "wait_recipe": "",
                "end_event_policy": "",
                "risk_notes": "",
                "helper_hint": local_runtime_helper_hint("local_quest_constants", row),
                "raw": f"{row.get('constant', '')}={row.get('value', '')}",
            }
        )

    for row in read_csv(inputs.path(QUEST_LOCAL_DELEGATE_PUSH_CALLS)):
        code = pick_included_code(row, included, ("target_code", "code"), ("file",))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "local_delegate_push_calls",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "source_file": row.get("file", ""),
                "source_line": row.get("line", ""),
                "function": row.get("function", ""),
                "sequence_expr": row.get("sequence_expr", ""),
                "surface_kind": "delegate_push",
                "name_or_action": row.get("event_method", ""),
                "value_or_target": first_value(row.get("target_expr", ""), row.get("target_code", "")),
                "actor_class_id": "",
                "actor_class_path": "",
                "display_name_id": "",
                "flag_expr": "",
                "event_method": row.get("event_method", ""),
                "call_kind": row.get("call_kind", ""),
                "target_kind": row.get("target_kind", ""),
                "target_code": row.get("target_code", ""),
                "extra_arg_count": row.get("extra_arg_count", ""),
                "match_kind": row.get("match_kind", ""),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "risk_notes": row.get("risk_notes", ""),
                "helper_hint": local_runtime_helper_hint("local_delegate_push_calls", row),
                "raw": row.get("raw_call", ""),
            }
        )

    for row in read_csv(inputs.path(QUEST_LOCAL_ENPC_BINDINGS)):
        code = pick_included_code(row, included, ("code",), ("file",))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "local_quest_enpc_bindings",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "source_file": row.get("file", ""),
                "source_line": row.get("line", ""),
                "function": row.get("function", ""),
                "sequence_expr": row.get("sequence_expr", ""),
                "surface_kind": "enpc_binding",
                "name_or_action": row.get("actor_expr", ""),
                "value_or_target": row.get("actor_class_id", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "actor_class_path": row.get("actor_class_path", ""),
                "display_name_id": row.get("display_name_id", ""),
                "flag_expr": row.get("flag_expr", ""),
                "event_method": "",
                "call_kind": "",
                "target_kind": "",
                "target_code": "",
                "extra_arg_count": "",
                "match_kind": "",
                "wait_recipe": "",
                "end_event_policy": "",
                "risk_notes": "",
                "helper_hint": local_runtime_helper_hint("local_quest_enpc_bindings", row),
                "raw": row.get("raw_args", ""),
            }
        )

    for row in read_csv(inputs.path(QUEST_UNMATCHED_DELEGATE_CALLS)):
        code = pick_included_code(row, included, ("target_code", "code"), ("file",))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "unmatched_active_delegate_calls",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "source_file": row.get("file", ""),
                "source_line": row.get("line", ""),
                "function": row.get("function", ""),
                "sequence_expr": row.get("sequence_expr", ""),
                "surface_kind": "unmatched_delegate_push",
                "name_or_action": row.get("event_method", ""),
                "value_or_target": first_value(row.get("target_expr", ""), row.get("target_code", "")),
                "actor_class_id": "",
                "actor_class_path": "",
                "display_name_id": "",
                "flag_expr": "",
                "event_method": row.get("event_method", ""),
                "call_kind": row.get("call_kind", ""),
                "target_kind": row.get("target_kind", ""),
                "target_code": row.get("target_code", ""),
                "extra_arg_count": row.get("extra_arg_count", ""),
                "match_kind": row.get("match_kind", ""),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "risk_notes": row.get("risk_notes", ""),
                "helper_hint": local_runtime_helper_hint("unmatched_active_delegate_calls", row),
                "raw": row.get("raw_call", ""),
            }
        )

    for row in read_csv(inputs.path(QUEST_LOCAL_EVENT_LIFECYCLE)):
        code = pick_included_code(row, included, ("code",), ("file",))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "local_event_lifecycle_actions",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "source_file": row.get("file", ""),
                "source_line": row.get("line", ""),
                "function": row.get("function", ""),
                "sequence_expr": row.get("sequence_expr", ""),
                "surface_kind": "lifecycle_action",
                "name_or_action": row.get("action", ""),
                "value_or_target": row.get("args", ""),
                "actor_class_id": "",
                "actor_class_path": "",
                "display_name_id": "",
                "flag_expr": "",
                "event_method": "",
                "call_kind": "",
                "target_kind": "",
                "target_code": "",
                "extra_arg_count": "",
                "match_kind": "",
                "wait_recipe": "",
                "end_event_policy": "",
                "risk_notes": "",
                "helper_hint": local_runtime_helper_hint("local_event_lifecycle_actions", row),
                "raw": row.get("raw_call", ""),
            }
        )

    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], clean(item["source_file"]), to_int(item["source_line"])))
    return rows


def cutscene_argument_helper_hint(row: dict[str, str]) -> str:
    shape = clean(row.get("argument_shape", "")).lower()
    required = clean(row.get("required_runtime_args", "")).lower()
    blocker = clean(row.get("blocker_notes", "")).lower()
    wait = clean(row.get("wait_recipe", "")).lower()
    if "snpc" in required or "snpc" in shape:
        return "SNPC runtime payload capture"
    if "after" in wait or "after_warp" in blocker:
        return "after-warp event lifetime proof"
    if blocker:
        return "argument blocker review"
    if clean(row.get("extra_arg_count_guess", "")):
        return "delegate extra-argument proof"
    return "cutscene argument shape review"


def build_cutscene_argument_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("cutscene_argument_requirements", QUEST_CUTSCENE_ARGUMENTS),
        ("after_warp_event_lifetime_queue", QUEST_AFTER_WARP_ARGUMENTS),
    )
    for source, path in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get("code", ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "priority": row.get("priority_score", ""),
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "function": row.get("function", ""),
                    "event_method": row.get("event_method", ""),
                    "delegate_method_to_call": row.get("delegate_method_to_call", ""),
                    "arg_count": row.get("arg_count", ""),
                    "injected_context_count": row.get("injected_context_count", ""),
                    "inferred_payload_count": row.get("inferred_payload_count", ""),
                    "extra_arg_count_guess": row.get("extra_arg_count_guess", ""),
                    "scene_keys": row.get("scene_keys", ""),
                    "scene_call_kind": row.get("scene_call_kind", ""),
                    "fade_mode": row.get("fade_mode", ""),
                    "route_status": row.get("route_status", ""),
                    "push_safety": row.get("push_safety", ""),
                    "active_owner_kind": row.get("active_owner_kind", ""),
                    "active_event_type_expected": row.get("active_event_type_expected", ""),
                    "wait_recipe": row.get("wait_recipe", ""),
                    "end_event_policy": row.get("end_event_policy", ""),
                    "route_owner_join_status": row.get("route_owner_join_status", ""),
                    "route_owner_actor_class_ids": row.get("route_owner_actor_class_ids", ""),
                    "argument_shape": row.get("argument_shape", ""),
                    "required_runtime_args": row.get("required_runtime_args", ""),
                    "patch_class": row.get("patch_class", ""),
                    "next_step": row.get("next_step", ""),
                    "blocker_notes": row.get("blocker_notes", ""),
                    "helper_hint": cutscene_argument_helper_hint(row),
                    "recovered_script_path": row.get("recovered_script_path", ""),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["event_method"]))
    return rows


def route_owner_helper_hint(row: dict[str, str]) -> str:
    status = clean(row.get("route_owner_resolution_status", "")).lower()
    confidence = clean(row.get("confidence_class", "")).lower()
    blocker = clean(row.get("blocker_notes", ""))
    if "missing" in status or "blocked" in status or blocker:
        return "route owner recovery needed"
    if "exact" in status:
        return "exact route owner candidate"
    if confidence and confidence not in {"high", "exact"}:
        return "route owner confidence proof"
    if truthy_text(row.get("after_warp_sensitive", "")):
        return "after-warp owner lifetime proof"
    return "route owner inference review"


def build_route_owner_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    for row in read_csv(inputs.path(QUEST_ROUTE_OWNERS)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_method": row.get("event_method", ""),
                "delegate_method_to_call": row.get("delegate_method_to_call", ""),
                "scene_keys": row.get("scene_keys", ""),
                "cutreplay_rows": row.get("cutReplay_rows", ""),
                "route_owner_resolution_status": row.get("route_owner_resolution_status", ""),
                "inferred_actor_expr": row.get("inferred_actor_expr", ""),
                "inferred_actor_class_id": row.get("inferred_actor_class_id", ""),
                "inferred_actor_class_path": row.get("inferred_actor_class_path", ""),
                "inferred_display_name_id": row.get("inferred_display_name_id", ""),
                "inferred_owner_kind": row.get("inferred_owner_kind", ""),
                "inferred_flag_expr": row.get("inferred_flag_expr", ""),
                "inferred_event_function": row.get("inferred_event_function", ""),
                "inferred_sequence_expr": row.get("inferred_sequence_expr", ""),
                "inferred_sequence_value": row.get("inferred_sequence_value", ""),
                "candidate_actor_exprs": row.get("candidate_actor_exprs", ""),
                "candidate_actor_class_ids": row.get("candidate_actor_class_ids", ""),
                "candidate_flags": row.get("candidate_flags", ""),
                "candidate_sequences": row.get("candidate_sequences", ""),
                "evidence_sources": row.get("evidence_sources", ""),
                "evidence_refs": row.get("evidence_refs", ""),
                "evidence_score": row.get("evidence_score", ""),
                "confidence_class": row.get("confidence_class", ""),
                "conflict_notes": row.get("conflict_notes", ""),
                "active_event_type_expected": row.get("active_event_type_expected", ""),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "after_warp_sensitive": row.get("after_warp_sensitive", ""),
                "extra_arg_count_guess": row.get("extra_arg_count_guess", ""),
                "extra_args_policy": row.get("extra_args_policy", ""),
                "push_safety": row.get("push_safety", ""),
                "original_route_status": row.get("original_route_status", ""),
                "original_route_owner_join_status": row.get("original_route_owner_join_status", ""),
                "suggested_insertion_function": row.get("suggested_insertion_function", ""),
                "suggested_insertion_ref": row.get("suggested_insertion_ref", ""),
                "recommended_patch_action": row.get("recommended_patch_action", ""),
                "blocker_notes": row.get("blocker_notes", ""),
                "helper_hint": route_owner_helper_hint(row),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["evidence_score"]), item["event_method"]))
    return rows


def payload_proof_helper_hint(source: str, row: dict[str, str]) -> str:
    source_lower = source.lower()
    payload = clean(first_value(row.get("payload_status", ""), row.get("payload_to_capture", ""), row.get("required_runtime_args", ""))).lower()
    proof = clean(row.get("proof_status", "")).lower()
    blocker = clean(row.get("blocker_notes", "")).lower()
    if "blocked_owner" in source_lower or "owner" in blocker:
        return "owner selector recovery proof"
    if "after_warp" in source_lower or truthy_text(row.get("after_warp_sensitive", "")):
        return "after-warp lifetime proof"
    if "snpc" in payload:
        return "SNPC payload capture proof"
    if proof == "live_required":
        return "live EventUpdate tuple proof"
    if clean(row.get("return_tuple_to_capture", "")) or clean(row.get("return_tuple_status", "")):
        return "return tuple proof"
    return "payload/proof queue review"


def build_payload_proof_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []

    for row in read_csv(inputs.path(QUEST_PAYLOAD_ATLAS)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        source = "owner_bound_cutscene_payload_atlas"
        rows.append(
            {
                "source": source,
                "priority": row.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_method": first_value(row.get("method_name", ""), row.get("delegate_method_to_call", "")),
                "scene_key": row.get("scene_key", ""),
                "lane_or_status": join_unique([row.get("payload_status", ""), row.get("probe_wave", "")], limit=2),
                "owner_actor_class_id": row.get("owner_actor_class_id", ""),
                "owner_selector": row.get("owner_actor_expr", ""),
                "argument_shape": row.get("argument_shape", ""),
                "payload_expression": row.get("payload_expression", ""),
                "payload_to_capture": first_value(row.get("must_capture_values", ""), row.get("payload_slots_normalized", "")),
                "return_tuple_to_capture": first_value(row.get("return_tuple_semantics", ""), row.get("return_tuple_status", "")),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "command": first_value(row.get("questdelegate_command", ""), row.get("render_probe_command", "")),
                "pass_condition": row.get("recommended_action", ""),
                "mutation_policy": row.get("mutation_policy", ""),
                "proof_status": row.get("return_tuple_status", ""),
                "probe_wave": row.get("probe_wave", ""),
                "patch_gate": row.get("patch_gate", ""),
                "blocker_notes": row.get("blocker_notes", ""),
                "source_refs": row.get("evidence_refs", ""),
                "helper_hint": payload_proof_helper_hint(source, row),
            }
        )

    for row in read_csv(inputs.path(QUEST_PAYLOAD_PROBE_QUEUE)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        source = "owner_bound_cutscene_payload_probe_queue"
        rows.append(
            {
                "source": source,
                "priority": row.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_method": row.get("event_method", ""),
                "scene_key": "",
                "lane_or_status": row.get("probe_lane", ""),
                "owner_actor_class_id": row.get("owner_actor_class_id", ""),
                "owner_selector": row.get("owner_selector", ""),
                "argument_shape": "",
                "payload_expression": "",
                "payload_to_capture": row.get("payload_to_capture", ""),
                "return_tuple_to_capture": row.get("return_tuple_to_capture", ""),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "command": row.get("delegate_call_template", ""),
                "pass_condition": row.get("pass_condition", ""),
                "mutation_policy": "",
                "proof_status": "",
                "probe_wave": row.get("probe_lane", ""),
                "patch_gate": "",
                "blocker_notes": row.get("blocker_notes", ""),
                "source_refs": "",
                "helper_hint": payload_proof_helper_hint(source, row),
            }
        )

    for row in read_csv(inputs.path(QUEST_EVENTUPDATE_PROOF_QUEUE)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        source = "eventupdate_return_tuple_decomp_queue"
        rows.append(
            {
                "source": source,
                "priority": row.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_method": row.get("event_method", ""),
                "scene_key": "",
                "lane_or_status": row.get("probe_lane", ""),
                "owner_actor_class_id": "",
                "owner_selector": "",
                "argument_shape": "",
                "payload_expression": row.get("static_tuple_hint", ""),
                "payload_to_capture": row.get("payload_to_capture", ""),
                "return_tuple_to_capture": join_unique([row.get("packet_fields_to_log", ""), row.get("active_event_fields_to_log", "")], limit=12),
                "wait_recipe": "",
                "end_event_policy": "",
                "command": row.get("delegate_call_template", ""),
                "pass_condition": row.get("tuple_pass_condition", ""),
                "mutation_policy": "",
                "proof_status": row.get("proof_status", ""),
                "probe_wave": row.get("probe_lane", ""),
                "patch_gate": "",
                "blocker_notes": "",
                "source_refs": row.get("source_refs", ""),
                "helper_hint": payload_proof_helper_hint(source, row),
            }
        )

    for row in read_csv(inputs.path(QUEST_AFTER_WARP_PROOF_QUEUE)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        source = "after_warp_lifetime_proof_queue"
        rows.append(
            {
                "source": source,
                "priority": row.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_method": row.get("event_method", ""),
                "scene_key": row.get("scene_key", ""),
                "lane_or_status": row.get("payload_status", ""),
                "owner_actor_class_id": row.get("owner_actor_class_id", ""),
                "owner_selector": "",
                "argument_shape": "",
                "payload_expression": "",
                "payload_to_capture": row.get("payload_status", ""),
                "return_tuple_to_capture": row.get("lifetime_probe_steps", ""),
                "wait_recipe": row.get("wait_recipe", ""),
                "end_event_policy": row.get("end_event_policy", ""),
                "command": row.get("questdelegate_command", ""),
                "pass_condition": row.get("pass_condition", ""),
                "mutation_policy": "",
                "proof_status": row.get("proof_status", ""),
                "probe_wave": "",
                "patch_gate": "",
                "blocker_notes": row.get("failure_signals", ""),
                "source_refs": row.get("source_refs", ""),
                "helper_hint": payload_proof_helper_hint(source, row),
            }
        )

    for row in read_csv(inputs.path(QUEST_BLOCKED_OWNER_QUEUE)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        source = "blocked_owner_resolution_decomp_queue"
        rows.append(
            {
                "source": source,
                "priority": row.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_method": row.get("event_method", ""),
                "scene_key": row.get("scene_key", ""),
                "lane_or_status": row.get("recoverability", ""),
                "owner_actor_class_id": first_value(row.get("inferred_actor_class_id", ""), row.get("candidate_actor_class_ids", "")),
                "owner_selector": first_value(row.get("candidate_owner_exprs", ""), row.get("inferred_owner_kind", "")),
                "argument_shape": "",
                "payload_expression": row.get("sequence_expr", ""),
                "payload_to_capture": row.get("proof_to_capture", ""),
                "return_tuple_to_capture": "",
                "wait_recipe": "",
                "end_event_policy": "",
                "command": row.get("safe_probe_command", ""),
                "pass_condition": row.get("proof_to_capture", ""),
                "mutation_policy": row.get("mutation_policy", ""),
                "proof_status": row.get("recoverability", ""),
                "probe_wave": "",
                "patch_gate": "",
                "blocker_notes": row.get("blocker_notes", ""),
                "source_refs": row.get("source_refs", ""),
                "helper_hint": payload_proof_helper_hint(source, row),
            }
        )

    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["event_method"]))
    return rows


def fight_readiness_helper_hint(row: dict[str, str]) -> str:
    gaps = clean(row.get("blocking_gaps", ""))
    reward_lock = clean(row.get("reward_lock_status", ""))
    route_status = clean(row.get("route_status", "")).lower()
    if gaps:
        return "fight readiness blocker audit"
    if reward_lock:
        return "fight reward-lock audit"
    if route_status and route_status != "ready":
        return "fight kill-route materialization"
    if clean(row.get("safe_to_enable_rewards", "")).lower() == "yes":
        return "fight return/reward route ready for guarded review"
    return "fight readiness review"


def build_fight_readiness_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []

    for row in read_csv(inputs.path(QUEST_FIGHT_READINESS)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "fight_readiness_by_quest",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "fight_lane": row.get("fight_lane", ""),
                "actor_class_ready": row.get("actor_class_ready", ""),
                "mob_type_ready": row.get("mob_type_ready", ""),
                "spawn_ready": row.get("spawn_ready", ""),
                "content_map_ready": row.get("content_map_ready", ""),
                "director_ready": row.get("director_ready", ""),
                "kill_route_present": row.get("kill_route_present", ""),
                "kill_route_reachable": row.get("kill_route_reachable", ""),
                "return_flow_ready": row.get("return_flow_ready", ""),
                "reward_lock_ready": row.get("reward_lock_ready", ""),
                "scaffold_mutation_risk": row.get("scaffold_mutation_risk", ""),
                "blocking_gaps": row.get("blocking_gaps", ""),
                "readiness_score_0_100": row.get("readiness_score_0_100", ""),
                "reward_lock_status": "",
                "safe_to_enable_rewards": "",
                "route_status": "",
                "next_fix": "",
                "implementation_hint": row.get("implementation_hint", ""),
                "helper_hint": fight_readiness_helper_hint(row),
            }
        )

    for row in read_csv(inputs.path(QUEST_FIGHT_RETURN_REWARD)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "fight_return_reward_lock_join",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "fight_lane": row.get("fight_lane", ""),
                "actor_class_ready": "",
                "mob_type_ready": "",
                "spawn_ready": "",
                "content_map_ready": "",
                "director_ready": "",
                "kill_route_present": "",
                "kill_route_reachable": row.get("strict_kill_route_reachable", ""),
                "return_flow_ready": row.get("return_flow_ready", ""),
                "reward_lock_ready": row.get("reward_lock_ready", ""),
                "scaffold_mutation_risk": row.get("scaffold_mutation_risk", ""),
                "blocking_gaps": "",
                "readiness_score_0_100": "",
                "reward_lock_status": row.get("reward_lock_status", ""),
                "safe_to_enable_rewards": row.get("safe_to_enable_rewards", ""),
                "route_status": "",
                "next_fix": row.get("next_fix", ""),
                "implementation_hint": join_unique([row.get("reward_types", ""), row.get("next_fix", "")], limit=6),
                "helper_hint": fight_readiness_helper_hint(row),
            }
        )

    for row in read_csv(inputs.path(QUEST_FIGHT_KILL_ROUTE)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "fight_kill_route_join",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "fight_lane": row.get("fight_lane", ""),
                "actor_class_ready": row.get("actor_materialization_statuses", ""),
                "mob_type_ready": "",
                "spawn_ready": "",
                "content_map_ready": row.get("content_launches", ""),
                "director_ready": first_value(row.get("director_script", ""), row.get("sqb_director", "")),
                "kill_route_present": row.get("existing_kill_route_present", ""),
                "kill_route_reachable": first_value(row.get("existing_kill_route_reachable", ""), row.get("strict_kill_route_reachable", "")),
                "return_flow_ready": "",
                "reward_lock_ready": "",
                "scaffold_mutation_risk": "",
                "blocking_gaps": "",
                "readiness_score_0_100": "",
                "reward_lock_status": "",
                "safe_to_enable_rewards": "",
                "route_status": row.get("route_status", ""),
                "next_fix": row.get("next_fix", ""),
                "implementation_hint": row.get("evidence_refs", ""),
                "helper_hint": fight_readiness_helper_hint(row),
            }
        )

    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], item["fight_lane"]))
    return rows


def blueprint_helper_hint(source: str, row: dict[str, str]) -> str:
    lane = clean(row.get("blueprint_lane", "")).lower()
    blocker = clean(row.get("blocker_type", "")).lower()
    if "sqb" in lane or "private_mob" in lane:
        return "SQB/private mob SQL blueprint"
    if "manual" in blocker or "route" in blocker:
        return "manual route owner/source recovery"
    if clean(row.get("no_mutation_probe", "")):
        return "no-mutation owner-source probe"
    if clean(row.get("implementation_step", "")):
        return "implementation blueprint step"
    return "blueprint review"


def build_blueprint_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []

    for row in read_csv(inputs.path(QUEST_BLUEPRINT_WORKQUEUE)):
        code = norm_code(row.get("subject", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        source = "implementation_blueprint_workqueue"
        rows.append(
            {
                "source": source,
                "priority": row.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "blueprint_lane": row.get("blueprint_lane", ""),
                "target": row.get("target", ""),
                "disposition": row.get("disposition", ""),
                "implementation_step": row.get("implementation_step", ""),
                "validation_step": row.get("validation_step", ""),
                "blocker_type": "",
                "recovered_order": "",
                "after_warp_methods": "",
                "likely_owner": "",
                "scaffold_lacks": "",
                "no_mutation_probe": "",
                "source_queue": row.get("source_queue", ""),
                "helper_hint": blueprint_helper_hint(source, row),
            }
        )

    for row in read_csv(inputs.path(QUEST_RETAIL_SEQUENCE_BLUEPRINTS)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        source = "retail_sequence_spine_blueprints"
        rows.append(
            {
                "source": source,
                "priority": row.get("priority", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "blueprint_lane": "",
                "target": "",
                "disposition": "",
                "implementation_step": "",
                "validation_step": "",
                "blocker_type": row.get("blocker_type", ""),
                "recovered_order": row.get("recovered_order", ""),
                "after_warp_methods": row.get("after_warp_methods", ""),
                "likely_owner": row.get("likely_owner", ""),
                "scaffold_lacks": row.get("scaffold_lacks", ""),
                "no_mutation_probe": row.get("no_mutation_probe", ""),
                "source_queue": "",
                "helper_hint": blueprint_helper_hint(source, row),
            }
        )

    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["blueprint_lane"]))
    return rows


def cutscene_contract_helper_hint(source: str, row: dict[str, str]) -> str:
    source_lower = source.lower()
    if "manual" in source_lower:
        return "manual route recovery contract"
    if "director" in source_lower:
        return "director notice/transport contract"
    if "snpc" in source_lower or "snpc" in clean(row.get("payload_policy", "")).lower():
        return "SNPC payload contract/probe"
    if clean(row.get("safe_to_execute", "")).lower() == "no_mutation_probe_only":
        return "no-mutation cutscene probe"
    if clean(row.get("contract_readiness", "")):
        return "cutscene push contract readiness review"
    if clean(row.get("implementation_recipe", "")):
        return "cutscene push recipe review"
    return "cutscene push contract review"


def build_cutscene_contract_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("cutscene_push_contracts", QUEST_CUTSCENE_PUSH_CONTRACTS, "code"),
        ("template_scaffold_push_contracts", QUEST_TEMPLATE_SCAFFOLD_PUSH_CONTRACTS, "code"),
        ("safe_cutscene_patch_contracts", QUEST_SAFE_CUTSCENE_PATCH_CONTRACTS, "code"),
        ("snpc_payload_probe_contracts", QUEST_SNPC_PAYLOAD_PROBE_CONTRACTS, "code"),
        ("manual_route_recovery_contracts", QUEST_MANUAL_ROUTE_RECOVERY_CONTRACTS, "code"),
        ("director_notice_contracts", QUEST_DIRECTOR_NOTICE_CONTRACTS, "code"),
        ("cutscene_push_recipes", QUEST_CUTSCENE_PUSH_RECIPES, "code"),
        ("push_implementation_queue", QUEST_PUSH_IMPLEMENTATION_QUEUE, "code"),
        ("questdelegate_owner_probe_queue", QUEST_OWNER_PROBE_QUEUE, "code"),
        ("cutscene_method_probe_recipes", QUEST_CUTSCENE_METHOD_PROBE_RECIPES, "script_code"),
    )

    for source, path, code_field in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get(code_field, ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "priority": first_value(row.get("priority", ""), row.get("priority_score", ""), row.get("template_priority", "")),
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "event_method": first_value(row.get("event_method", ""), row.get("method_name", "")),
                    "method_name": first_value(row.get("method_name", ""), row.get("event_method", "")),
                    "scene_key": first_value(row.get("scene_key", ""), row.get("scene_keys", "")),
                    "contract_class": first_value(row.get("contract_class", ""), row.get("template_class", "")),
                    "transport_kind": row.get("transport_kind", ""),
                    "transport_recipe": first_value(row.get("transport_recipe", ""), row.get("implementation_recipe", "")),
                    "owner_actor_class_id": first_value(row.get("inferred_actor_class_id", ""), row.get("owner_actor_class_id", "")),
                    "route_owner_status": first_value(row.get("route_owner_resolution_status", ""), row.get("owner_resolution_status", "")),
                    "confidence": first_value(row.get("route_owner_confidence", ""), row.get("confidence", "")),
                    "payload_status": first_value(row.get("payload_policy", ""), row.get("payload_status", ""), row.get("required_runtime_args", "")),
                    "argument_shape": row.get("argument_shape", ""),
                    "wait_recipe": row.get("wait_recipe", ""),
                    "end_event_policy": row.get("end_event_policy", ""),
                    "after_warp": first_value(row.get("after_warp_sensitive", ""), row.get("after_warp", "")),
                    "command_or_template": first_value(
                        row.get("transport_call_template", ""),
                        row.get("probe_command", ""),
                        row.get("render_probe_command", ""),
                        row.get("proposed_wrapper_probe", ""),
                        row.get("command_or_patch_template", ""),
                    ),
                    "safe_to_execute": row.get("safe_to_execute", ""),
                    "readiness": first_value(row.get("contract_readiness", ""), row.get("push_safety", "")),
                    "recommended_action": first_value(row.get("recommended_action", ""), row.get("recommended_next_step", "")),
                    "blocker_notes": first_value(row.get("blocker_notes", ""), row.get("data_needed", "")),
                    "source_ref": first_value(row.get("evidence_refs", ""), row.get("recovered_source_path", ""), row.get("recovered_script_path", "")),
                    "helper_hint": cutscene_contract_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["event_method"], item["scene_key"]))
    return rows


def runtime_unlock_helper_hint(source: str, row: dict[str, str]) -> str:
    source_lower = source.lower()
    if "sqb" in source_lower:
        return "SQB/private materialization runtime proof"
    if "bnpc" in source_lower:
        return "world BNPC callback proof"
    if "snpc" in source_lower or "a8" in source_lower:
        return "SNPC A8 payload/runtime capture"
    if "safe_smoke" in source_lower:
        return "safe smoke target"
    if "missing_recovered_delegate" in source_lower:
        return "missing recovered delegate runtime proof"
    if "exact_delegate_smoke" in source_lower:
        return "exact delegate smoke command"
    if "first_live" in source_lower or "eventupdate_tuple" in source_lower:
        return "EventUpdate tuple runtime capture"
    if "first_payload" in source_lower:
        return "payload execution probe wave"
    if "first_probe" in source_lower:
        return "command-surface probe wave"
    if "alias_unlock" in source_lower:
        return "cutscene alias unlock review"
    if "alias_deferred" in source_lower:
        return "deferred cutscene alias review"
    if "elevator" in source_lower:
        return "elevator/zone cutscene lifetime probe"
    if "world_bnpc_callback_deferred" in source_lower:
        return "deferred world BNPC callback proof"
    if "exact_hazard" in source_lower:
        return "exact delegate hazard smoke proof"
    if "scaffold" in source_lower:
        return "scaffold cutscene no-mutation probe"
    if clean(row.get("proof_status", "")):
        return "runtime proof queue"
    return "runtime unlock triage"


def build_runtime_unlock_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("non_en_completed_cutscene_triage", QUEST_RUNTIME_UNLOCK_TRIAGE, "script_code"),
        ("non_en_scaffold_cutscene_queue", QUEST_RUNTIME_UNLOCK_SCAFFOLD, "script_code"),
        ("non_en_exact_delegate_hazard_smoke_queue", QUEST_RUNTIME_UNLOCK_EXACT_HAZARD, "script_code"),
        ("snpc_a8_capture_queue", QUEST_RUNTIME_UNLOCK_SNPC_A8, "code"),
        ("sqb_private_materialization_queue", QUEST_RUNTIME_UNLOCK_SQB_PRIVATE, "code"),
        ("world_bnpc_callback_probe_queue", QUEST_RUNTIME_UNLOCK_WORLD_BNPC, "code"),
        ("requested_gap_runtime_proof_queue", QUEST_RUNTIME_UNLOCK_REQUESTED_PROOF, "code"),
        ("runtime_unlock_wave2", QUEST_RUNTIME_UNLOCK_WAVE2, "code"),
        ("safe_smoke_targets", QUEST_RUNTIME_UNLOCK_SAFE_SMOKE, "code"),
        ("non_en_missing_recovered_delegate_queue", QUEST_RUNTIME_UNLOCK_MISSING_DELEGATE, "script_code"),
        ("non_en_exact_delegate_smoke_queue", QUEST_RUNTIME_UNLOCK_EXACT_SMOKE, "script_code"),
        ("first_live_runtime_probe_wave", QUEST_RUNTIME_UNLOCK_FIRST_LIVE, "subject"),
        ("first_payload_probe_wave", QUEST_RUNTIME_UNLOCK_FIRST_PAYLOAD, "subject"),
        ("first_probe_wave", QUEST_RUNTIME_UNLOCK_FIRST_PROBE, "subject"),
        ("cutscene_alias_unlock_review", QUEST_RUNTIME_UNLOCK_ALIAS_UNLOCK, "code"),
        ("cutscene_alias_deferred_review", QUEST_RUNTIME_UNLOCK_ALIAS_DEFERRED, "code"),
        ("eventupdate_tuple_probe_queue", QUEST_RUNTIME_UNLOCK_EVENTUPDATE_TUPLE, "code"),
        ("elevator_cutscene_probe_queue", QUEST_RUNTIME_UNLOCK_ELEVATOR, "code"),
        ("world_bnpc_callback_deferred_queue", QUEST_RUNTIME_UNLOCK_WORLD_BNPC_DEFERRED, "code"),
    )
    for source, path, code_field in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get(code_field, ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "priority": first_value(row.get("priority", ""), row.get("request_order", ""), row.get("order", "")),
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "lane_or_status": first_value(
                        row.get("triage_status", ""),
                        row.get("probe_status", ""),
                        row.get("hazard_status", ""),
                        row.get("smoke_status", ""),
                        row.get("patch_disposition", ""),
                        row.get("gap_lane", ""),
                        row.get("lane", ""),
                        row.get("safety_class", ""),
                        row.get("safe_status", ""),
                    ),
                    "method_name": first_value(
                        row.get("method_name", ""),
                        row.get("event_method", ""),
                        row.get("replacement_method", ""),
                        row.get("current_method", ""),
                        row.get("target", ""),
                    ),
                    "scene_key": row.get("scene_key", ""),
                    "actor_or_owner": first_value(row.get("actor_class_id", ""), row.get("owner_actor_class_id", ""), row.get("owner_actor", ""), row.get("owner_hint", ""), row.get("callback_actor", "")),
                    "command": first_value(
                        row.get("runtime_command", ""),
                        row.get("required_runtime_command", ""),
                        row.get("probe_command", ""),
                        row.get("questevent_start_command", ""),
                        row.get("command", ""),
                        row.get("command_or_shape", ""),
                        row.get("safe_probe_now", ""),
                        row.get("smoke_command", ""),
                    ),
                    "secondary_command": first_value(row.get("secondary_probe_command", ""), row.get("diagnostic_render_probe_command", ""), row.get("render_probe_command", ""), row.get("questevent_stop_command", "")),
                    "expected_signal": row.get("expected_signal", ""),
                    "proof_to_capture": first_value(row.get("proof_to_capture", ""), row.get("required_runtime_fields", ""), row.get("capture", ""), row.get("lifetime_probe_steps", "")),
                    "payload_gate": first_value(row.get("payload_gate", ""), row.get("payload_to_capture", ""), row.get("payload_probe_args", ""), row.get("required_args", "")),
                    "safe_action": first_value(row.get("safe_action", ""), row.get("primary_next_action", ""), row.get("recommended_action", ""), row.get("validation_step", ""), row.get("next_step", "")),
                    "mutation_guard": first_value(row.get("mutation_guard", ""), row.get("mutation_policy", ""), row.get("guardrail", "")),
                    "blocker_notes": first_value(row.get("blockers", ""), row.get("hazard_reason", ""), row.get("guardrail", ""), row.get("gate_reason", ""), row.get("failure_signals", "")),
                    "source_csv": row.get("source_csv", ""),
                    "helper_hint": runtime_unlock_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["method_name"]))
    return rows


def instanced_owner_helper_hint(source: str, row: dict[str, str]) -> str:
    if source == "local_sequence_action_rows":
        if clean(row.get("immediate_mutations", "")):
            return "instanced sequence mutation audit"
        return "instanced sequence/action evidence"
    if source == "recovered_event_method_rows":
        return "instanced event adapter contract"
    if source == "recovered_owner_scene_rows":
        return "instanced owner scene route"
    if source == "recovered_owner_hint_rows":
        return "instanced owner hint resolution"
    if source == "recovered_method_text_rows":
        return "instanced method text/owner clues"
    return "instanced text clue evidence"


def build_instanced_owner_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("local_sequence_action_rows", QUEST_INSTANCE_LOCAL_SEQUENCE),
        ("recovered_event_method_rows", QUEST_INSTANCE_EVENT_METHODS),
        ("recovered_owner_scene_rows", QUEST_INSTANCE_OWNER_SCENES),
        ("recovered_owner_hint_rows", QUEST_INSTANCE_OWNER_HINTS),
        ("recovered_method_text_rows", QUEST_INSTANCE_METHOD_TEXT),
        ("quest_text_clue_rows", QUEST_INSTANCE_TEXT_CLUES),
    )
    for source, path in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get("code", ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "lane": row.get("lane", ""),
                    "handler_or_method": first_value(row.get("handler", ""), row.get("method", "")),
                    "role_or_action": first_value(row.get("method_role", ""), row.get("method_kind", ""), row.get("action_kind", "")),
                    "actor_or_owner": first_value(row.get("actor_class_id", ""), row.get("inferred_owner_hint", ""), row.get("owner_tokens", "")),
                    "sequence_context": first_value(row.get("sequence_context", ""), row.get("sequence_note", "")),
                    "scene_or_text_refs": first_value(row.get("nq_cutscenes", ""), row.get("nq_calls", ""), row.get("row_id", ""), row.get("say_rows", "")),
                    "text_snippets": first_value(row.get("text_snippets", ""), row.get("snippet", "")),
                    "branch_conditions": first_value(row.get("branch_conditions", ""), row.get("branch_hints", "")),
                    "fade_flags": row.get("fade_flags", ""),
                    "status": first_value(row.get("adapter_status", ""), row.get("owner_resolution_status", ""), row.get("risk_class", "")),
                    "risk_class": row.get("risk_class", ""),
                    "source_ref": first_value(row.get("source_ref", ""), row.get("source_refs", "")),
                    "helper_hint": instanced_owner_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], item["lane"], item["handler_or_method"]))
    return rows


def instanced_runtime_helper_hint(source: str, row: dict[str, str]) -> str:
    if source in {"local_delegate_payload_rows", "alias_payload_reconciliation_rows", "recovered_payload_branch_rows", "payload_smoke_matrix_rows"}:
        return "instanced payload branch contract"
    if source in {"per_callsite_runtime_probe_rows", "runtime_probe_playbook_rows", "per_quest_next_action_rows", "instanced_per_quest_action_queue", "recovered_focus_rows"}:
        return "instanced runtime probe/playbook"
    if source in {"cutscene_return_state_rows", "per_quest_event_contract_rows"}:
        return "instanced EventUpdate return-state contract"
    if source in {"local_actor_usage_rows", "scene_owner_reconciliation_rows", "sequence_owner_reconciliation_rows", "alias_actor_multiplicity_rows", "alias_reconciliation_rows", "event_owner_candidate_rows", "gc_recovered_owner_gap_rows"}:
        return "instanced actor/owner reconciliation"
    if source in {"owner_hazard_rows", "event_lifecycle_hazard_rows"}:
        return "instanced lifecycle hazard proof"
    if source in {"reward_boundary_rows", "local_handler_contract_rows", "adapter_gate_rows"}:
        return "instanced reward/adapter gate"
    if source in {"battle_adapter_quest_rows", "sqb_director_recovery_rows", "sqb_blocked_followup_rows", "sqb_shell_gap_rows", "sqb_spawn_probe_cases", "spawn_ready_probe_rows", "actor_data_blocker_rows"}:
        return "instanced SQB/battle adapter blueprint"
    if source in {"gc_tail_recovered_scenario_methods", "gc_tail_recovery_rows"}:
        return "Grand Company recovered method tail"
    if source in {"gc_target_hint_rows", "gc_tail_monster_hint_rows"}:
        return "Grand Company target/monster hint"
    if source == "totorak_quest_sequence_rows":
        return "Totorak quest sequence recovery"
    if source == "recovered_client_event_method_rows":
        return "recovered instanced client event method"
    if source == "totorak_cutscene_flow_rows":
        return "Totorak/instanced cutscene text flow"
    return "instanced local event/lifecycle row"


def build_instanced_runtime_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("totorak_cutscene_flow_rows", QUEST_INSTANCE_TOTORAK_FLOW),
        ("recovered_client_event_method_rows", QUEST_INSTANCE_RECOVERED_CLIENT_EVENTS),
        ("local_event_call_rows", QUEST_INSTANCE_LOCAL_EVENT_CALLS),
        ("local_delegate_payload_rows", QUEST_INSTANCE_LOCAL_DELEGATE_PAYLOAD),
        ("alias_payload_reconciliation_rows", QUEST_INSTANCE_ALIAS_PAYLOAD_RECONCILIATION),
        ("local_actor_usage_rows", QUEST_INSTANCE_LOCAL_ACTOR_USAGE),
        ("scene_owner_reconciliation_rows", QUEST_INSTANCE_SCENE_OWNER_RECONCILIATION),
        ("sequence_owner_reconciliation_rows", QUEST_INSTANCE_SEQUENCE_OWNER_RECONCILIATION),
        ("local_delegate_transition_rows", QUEST_INSTANCE_LOCAL_DELEGATE_TRANSITION),
        ("recovered_payload_branch_rows", QUEST_INSTANCE_RECOVERED_PAYLOAD_BRANCH),
        ("per_callsite_runtime_probe_rows", QUEST_INSTANCE_CALLSITE_RUNTIME_PROBE),
        ("cutscene_return_state_rows", QUEST_INSTANCE_CUTSCENE_RETURN_STATE),
        ("owner_hazard_rows", QUEST_INSTANCE_OWNER_HAZARD),
        ("event_lifecycle_hazard_rows", QUEST_INSTANCE_LIFECYCLE_HAZARD),
        ("gc_tail_recovered_scenario_methods", QUEST_INSTANCE_GC_TAIL_RECOVERED),
        ("runtime_probe_playbook_rows", QUEST_INSTANCE_RUNTIME_PLAYBOOK),
        ("per_quest_next_action_rows", QUEST_INSTANCE_NEXT_ACTION),
        ("per_quest_event_contract_rows", QUEST_INSTANCE_EVENT_CONTRACT),
        ("reward_boundary_rows", QUEST_INSTANCE_REWARD_BOUNDARY),
        ("local_handler_contract_rows", QUEST_INSTANCE_HANDLER_CONTRACT),
        ("adapter_gate_rows", QUEST_INSTANCE_ADAPTER_GATE),
        ("battle_adapter_quest_rows", QUEST_INSTANCE_BATTLE_ADAPTER),
        ("sqb_director_recovery_rows", QUEST_INSTANCE_SQB_DIRECTOR_RECOVERY),
        ("sqb_blocked_followup_rows", QUEST_INSTANCE_SQB_BLOCKED_FOLLOWUP),
        ("sqb_shell_gap_rows", QUEST_INSTANCE_SQB_SHELL_GAP),
        ("alias_actor_multiplicity_rows", QUEST_INSTANCE_ALIAS_ACTOR_MULTIPLICITY),
        ("alias_reconciliation_rows", QUEST_INSTANCE_ALIAS_RECONCILIATION),
        ("recovered_focus_rows", QUEST_INSTANCE_RECOVERED_FOCUS),
        ("event_owner_candidate_rows", QUEST_INSTANCE_EVENT_OWNER_CANDIDATE),
        ("gc_tail_recovery_rows", QUEST_INSTANCE_GC_TAIL_RECOVERY),
        ("gc_target_hint_rows", QUEST_INSTANCE_GC_TARGET_HINT),
        ("gc_recovered_owner_gap_rows", QUEST_INSTANCE_GC_RECOVERED_OWNER_GAP),
        ("payload_smoke_matrix_rows", QUEST_INSTANCE_PAYLOAD_SMOKE_MATRIX),
        ("totorak_quest_sequence_rows", QUEST_INSTANCE_TOTORAK_SEQUENCE),
        ("sqb_spawn_probe_cases", QUEST_INSTANCE_SQB_SPAWN_PROBE_CASES),
        ("spawn_ready_probe_rows", QUEST_INSTANCE_SPAWN_READY_PROBE),
        ("gc_tail_monster_hint_rows", QUEST_INSTANCE_GC_TAIL_MONSTER_HINT),
        ("actor_data_blocker_rows", QUEST_INSTANCE_ACTOR_DATA_BLOCKER),
        ("instanced_per_quest_action_queue", QUEST_INSTANCE_PER_QUEST_ACTION_QUEUE),
    )
    for source, path in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get("code", ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "lane": first_value(row.get("lane", ""), row.get("adapter_lane", "")),
                    "method_or_handler": first_value(row.get("method", ""), row.get("handler", ""), row.get("event_method", ""), row.get("alias", ""), row.get("matched_method", ""), row.get("director", "")),
                    "sequence_or_context": first_value(row.get("sequence_context", ""), row.get("sequence", ""), row.get("sequence_note", ""), row.get("route_contract", ""), row.get("sequence_flow", ""), row.get("sequence_guard", ""), row.get("sequences", ""), row.get("sequence_shape", ""), row.get("required_sequence", "")),
                    "actor_or_owner": first_value(row.get("actor_context", ""), row.get("actor_symbol", ""), row.get("local_actor_symbol", ""), row.get("local_owner", ""), row.get("actor_class_id", ""), row.get("local_actor_class_id", ""), row.get("bnpc_actor_class_ids", ""), row.get("actor_constants", ""), row.get("local_actor_symbols", ""), row.get("external_start_actor_id", ""), row.get("actor_candidates", ""), row.get("monster_class", "")),
                    "scene_or_helper": first_value(row.get("scene_or_helper", ""), row.get("nq_cutscenes", ""), row.get("nq_scene_keys", ""), row.get("matched_nq_calls", ""), row.get("nq_calls", ""), row.get("director", ""), row.get("nq_methods", "")),
                    "payload_or_contract": first_value(row.get("payload_contract", ""), row.get("expected_payload_refs", ""), row.get("payload_refs", ""), row.get("payload_conditions", ""), row.get("route_contract", ""), row.get("local_delegate_aliases", ""), row.get("command_or_shape", ""), row.get("probe_shape", ""), row.get("required_recovery", ""), row.get("cutscene_precondition", ""), row.get("callback_only_command", "")),
                    "probe_or_command": first_value(row.get("recommended_command", ""), row.get("command_or_recovery", ""), row.get("next_probe", ""), row.get("safe_probe_now", ""), row.get("stage_command", ""), row.get("spawn_command", ""), row.get("probe_recipe", ""), row.get("spawn_call_shape", ""), row.get("command_or_shape", "")),
                    "status_or_risk": first_value(row.get("payload_probe_status", ""), row.get("probe_status", ""), row.get("adapter_status", ""), row.get("owner_resolution_status", ""), row.get("lifecycle_status", ""), row.get("risk_class", ""), row.get("risk", ""), row.get("hazard", ""), row.get("materialization_status", ""), row.get("gap_class", ""), row.get("implementation_risk", ""), row.get("current_blocker", ""), row.get("blocker", ""), row.get("match_status", ""), row.get("owner_status", ""), row.get("gap_status", ""), row.get("current_template_risk", ""), row.get("local_use_status", "")),
                    "lifecycle_or_return": first_value(row.get("event_end_policy", ""), row.get("wait_kind", ""), row.get("close_policy", ""), row.get("resume_source", ""), row.get("post_return_mutation", ""), row.get("event_lifetime_flags", ""), row.get("after_warp_signal", ""), row.get("reward_boundary", "")),
                    "mutation_or_reward": first_value(row.get("post_call_mutations", ""), row.get("post_call_mutation_window", ""), row.get("mutations", ""), row.get("hazards", ""), row.get("reward_boundary", ""), row.get("safe_reward_condition", ""), row.get("completion_mutators", ""), row.get("reward_completion_policy", "")),
                    "expected_signal": first_value(row.get("pass_signal", ""), row.get("expected_signal", ""), row.get("safe_reward_condition", ""), row.get("success_sequence", "")),
                    "recommended_action": first_value(row.get("recommendation", ""), row.get("next_action", ""), row.get("next_step", ""), row.get("next_contract_step", ""), row.get("required_probe", ""), row.get("required_capture", ""), row.get("required_recovery", ""), row.get("next_recovery", ""), row.get("recovery_hint", ""), row.get("implementation_note", ""), row.get("notes", ""), row.get("why_not", "")),
                    "source_refs": first_value(row.get("source_refs", ""), row.get("source_ref", "")),
                    "helper_hint": instanced_runtime_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], item["lane"], item["method_or_handler"]))
    return rows


def starter_city_helper_hint(source: str, row: dict[str, str]) -> str:
    if source == "client_signal_rows":
        return "starter client signal/cutscene step"
    if source == "client_method_summary":
        return "starter client method spine"
    if source == "client_method_body_extracts":
        return "starter client method body extract"
    if source == "client_dialogue_rows":
        return "starter dialogue/text row"
    if source == "sequence_flow_rows":
        return "starter sequence flow anchor"
    if source == "fight_route_matrix":
        return "starter fight route/materialization"
    if source == "local_constant_rows":
        return "starter local constant/actor mapping"
    if source == "transition_action_rows":
        return "starter lifecycle transition action"
    if source == "source_to_client_method_rows":
        return "starter source-to-client method bridge"
    if source == "source_delegate_call_rows":
        return "starter delegate callsite"
    if source == "flag_usage_rows":
        return "starter flag/counter usage"
    if source == "server_delegate_surface":
        return "starter server delegate surface"
    if source == "delegate_push_call_rows":
        return "starter push call contract"
    if source == "dat_marker_rows":
        return "starter DAT marker row"
    if source == "actor_surface_rows":
        return "starter actor surface"
    if source == "lifecycle_action_rows":
        return "starter local lifecycle action"
    if source == "function_skeleton_rows":
        return "starter function skeleton"
    if source == "probe_commands":
        return "starter probe command"
    if source == "local_marker_constants":
        return "starter local marker constant"
    if source == "content_spawn_rows":
        return "starter content spawn row"
    if source == "marker_condition_rows":
        return "starter marker condition"
    if source == "content_spawn_atlas_rows":
        return "starter content spawn atlas"
    if source == "replay_scene_rows":
        return "starter replay scene row"
    if source == "choice_gate_rows":
        return "starter choice gate"
    if source == "counter_usage_rows":
        return "starter counter usage"
    if source == "quest_summary":
        return "starter quest summary"
    if source == "objective_crosscheck_rows":
        return "starter objective crosscheck"
    if source == "reward_rows":
        return "starter reward crosscheck"
    return "starter runtime probe checklist"


def build_starter_city_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("client_signal_rows", STARTER_CLIENT_SIGNAL_ROWS),
        ("client_method_summary", STARTER_CLIENT_METHOD_SUMMARY),
        ("sequence_flow_rows", STARTER_SEQUENCE_FLOW_ROWS),
        ("fight_route_matrix", STARTER_FIGHT_ROUTE_MATRIX),
        ("runtime_probe_checklist", STARTER_RUNTIME_PROBE_CHECKLIST),
        ("local_constant_rows", STARTER_LOCAL_CONSTANT_ROWS),
        ("client_method_body_extracts", STARTER_CLIENT_METHOD_BODIES),
        ("client_dialogue_rows", STARTER_CLIENT_DIALOGUE_ROWS),
        ("transition_action_rows", STARTER_TRANSITION_ACTION_ROWS),
        ("source_to_client_method_rows", STARTER_SOURCE_TO_CLIENT_METHOD_ROWS),
        ("source_delegate_call_rows", STARTER_SOURCE_DELEGATE_CALL_ROWS),
        ("flag_usage_rows", STARTER_FLAG_USAGE_ROWS),
        ("server_delegate_surface", STARTER_SERVER_DELEGATE_SURFACE),
        ("delegate_push_call_rows", STARTER_DELEGATE_PUSH_CALL_ROWS),
        ("dat_marker_rows", STARTER_DAT_MARKER_ROWS),
        ("actor_surface_rows", STARTER_ACTOR_SURFACE_ROWS),
        ("lifecycle_action_rows", STARTER_LIFECYCLE_ACTION_ROWS),
        ("function_skeleton_rows", STARTER_FUNCTION_SKELETON_ROWS),
        ("probe_commands", STARTER_PROBE_COMMANDS),
        ("local_marker_constants", STARTER_LOCAL_MARKER_CONSTANTS),
        ("content_spawn_rows", STARTER_CONTENT_SPAWN_ROWS),
        ("marker_condition_rows", STARTER_MARKER_CONDITION_ROWS),
        ("content_spawn_atlas_rows", STARTER_CONTENT_SPAWN_ATLAS_ROWS),
        ("replay_scene_rows", STARTER_REPLAY_SCENE_ROWS),
        ("choice_gate_rows", STARTER_CHOICE_GATE_ROWS),
        ("counter_usage_rows", STARTER_COUNTER_USAGE_ROWS),
        ("quest_summary", STARTER_QUEST_SUMMARY),
        ("objective_crosscheck_rows", STARTER_OBJECTIVE_CROSSCHECK_ROWS),
        ("reward_rows", STARTER_REWARD_ROWS),
    )
    for source, path in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get("code", ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "method": first_value(row.get("method", ""), row.get("function", ""), row.get("event_method", "")),
                    "line": first_value(row.get("call_line", ""), row.get("function_start_line", ""), row.get("check_order", ""), row.get("line", ""), row.get("start_line", ""), row.get("command_order", "")),
                    "sequence": first_value(row.get("sequence", ""), row.get("sequence_index", ""), row.get("sequence_expr", ""), row.get("dat_sequence_values", "")),
                    "signal_kind": first_value(row.get("signal_kind", ""), row.get("action", ""), row.get("operation", ""), row.get("call_kind", ""), row.get("spawn_kind", ""), row.get("role", ""), row.get("constant_kind", ""), row.get("reward_type", ""), row.get("choice_var", "")),
                    "call_or_action": first_value(row.get("call", ""), row.get("phase", ""), row.get("check", ""), row.get("handoff", ""), row.get("action", ""), row.get("operation", ""), row.get("event_method", ""), row.get("command", ""), row.get("raw_call", ""), row.get("line_text", ""), row.get("marker_constant", ""), row.get("constant", ""), row.get("counter_expr", ""), row.get("choice_var", ""), row.get("label", ""), row.get("reward_id", "")),
                    "scene_key": first_value(row.get("scene_key", ""), row.get("scene_keys", ""), row.get("sample_key", "")),
                    "widget": row.get("widget", ""),
                    "text_row_id": row.get("text_row_id", ""),
                    "text_en": first_value(row.get("text_en", ""), row.get("first_text_en", "")),
                    "content_area": first_value(row.get("content_area", ""), row.get("content_script", ""), row.get("source_file", ""), row.get("client_script", ""), row.get("server_file", ""), row.get("file", ""), row.get("local_script", "")),
                    "objective_actor": first_value(row.get("objective_actor", ""), row.get("actor_expr", ""), row.get("actor_class_id", ""), row.get("all_script_enemy_actor_ids", ""), row.get("owner_actor_id", ""), row.get("marker_id", ""), row.get("label", ""), row.get("reward_id", "")),
                    "route_status": first_value(row.get("route_status", ""), row.get("raw_client_method_present", ""), row.get("match_kind", ""), row.get("confidence", ""), row.get("duplicate_grant_risk", ""), row.get("objective_match_status", "")),
                    "lifecycle_status": first_value(row.get("lifecycle_status", ""), row.get("event_end_policy", ""), row.get("wait_recipe", ""), row.get("end_event_policy", "")),
                    "expected_anchor_or_state": first_value(row.get("expected_anchor", ""), row.get("expected_state", ""), row.get("condition_context", ""), row.get("placeholder_summary", ""), row.get("expected_value", ""), row.get("objective_count", "")),
                    "next_fix": first_value(row.get("next_fix", ""), row.get("purpose", ""), row.get("note", ""), row.get("notes", "")),
                    "evidence_refs": first_value(row.get("evidence_refs", ""), row.get("source_refs", ""), row.get("body_excerpt", ""), row.get("line_text", ""), row.get("raw_call", ""), row.get("raw_args", ""), row.get("ordered_anchor_sample", "")),
                    "helper_hint": starter_city_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], to_int(item["line"]), item["method"]))
    return rows


def execution_addendum_helper_hint(source: str, row: dict[str, str]) -> str:
    if "payload" in source:
        return "payload execution/proof addendum"
    if "after_warp" in source:
        return "after-warp lifetime/push addendum"
    if "scaffold" in source:
        return "scaffold enrichment/seed addendum"
    if "snpc" in source:
        return "SNPC payload/argument addendum"
    if "fight" in source or "bnpc" in source or "sqb" in source:
        return "fight/materialization addendum"
    if "job_metadata" in source:
        return "job metadata enrichment addendum"
    if "content_launch" in source or "content_area" in source:
        return "content launch addendum"
    if "owner" in source:
        return "owner selector/probe addendum"
    if "alias" in source:
        return "cutscene alias patch addendum"
    if "reward" in source or "dat_backed" in source:
        return "reward display sync addendum"
    if "runtime" in source or "probe" in source:
        return "runtime probe addendum"
    if "blocker" in source:
        return "blocker review addendum"
    return "quest execution addendum"


def build_execution_addendum_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("questdelegate_payload_execution_queue", QUEST_PAYLOAD_EXECUTION_QUEUE, "code"),
        ("after_warp_lifetime_payload_queue", QUEST_AFTER_WARP_LIFETIME_PAYLOAD_QUEUE, "code"),
        ("after_warp_push_queue", QUEST_AFTER_WARP_PUSH_QUEUE, "code"),
        ("content_launch_calls", QUEST_CONTENT_LAUNCH_CALLS, "script_code"),
        ("quest_cutscene_route_summary", QUEST_CUTSCENE_ROUTE_SUMMARY, "code"),
        ("quest_execution_priority_queue", QUEST_EXECUTION_PRIORITY_QUEUE, "code"),
        ("scaffold_cutscene_seed_queue", QUEST_SCAFFOLD_CUTSCENE_SEED_QUEUE, "script_code"),
        ("scaffold_owner_only_queue", QUEST_SAFE_PUSH_SCAFFOLD_OWNER_ONLY, "code"),
        ("blocked_owner_selector_attempt_matrix", QUEST_BLOCKED_OWNER_SELECTOR_MATRIX, "code"),
        ("current_class_scaffold_enrichment", QUEST_CLASS_SCAFFOLD_ENRICHMENT, "code"),
        ("push_probe_workqueue", QUEST_DEEP_PUSH_WORKQUEUE, "subject"),
        ("cutscene_call_templates", QUEST_DEEP_CUTSCENE_TEMPLATES, "code"),
        ("snpc_argument_probe_queue", QUEST_SNPC_ARGUMENT_PROBE_QUEUE, "code"),
        ("snpc_a8_branch_semantics_queue", QUEST_RUNTIME_SNPC_A8_SEMANTICS, "code"),
        ("snpc_payload_capture_queue", QUEST_SNPC_PAYLOAD_CAPTURE_QUEUE, "code"),
        ("fight_materialization_recipes", QUEST_FIGHT_MATERIALIZATION_RECIPES, "code"),
        ("quest_implementation_top25", QUEST_ROADMAP_TOP25, "code"),
        ("world_bnpc_materialization_candidates", QUEST_WORLD_BNPC_MATERIALIZATION, "code"),
        ("manual_recovery_queue", QUEST_SAFE_PUSH_MANUAL_RECOVERY, "code"),
        ("targeted_smoke_queue", QUEST_SAFE_PUSH_TARGETED_SMOKE, "code"),
        ("cutscene_alias_callsite_blueprints", QUEST_CUTSCENE_ALIAS_BLUEPRINTS, "code"),
        ("fight_priority_payload_seed_rows", QUEST_FIGHT_PRIORITY_PAYLOAD_SEED, "code"),
        ("retail_sequence_runtime_probe_plan", QUEST_RETAIL_SEQUENCE_RUNTIME_PLAN, "code"),
        ("dat_backed_applied_this_pass", QUEST_REWARD_DAT_APPLIED, "code"),
        ("local_content_area_launches", QUEST_LOCAL_CONTENT_AREA_LAUNCHES, "code"),
        ("after_warp_priority_seed_rows", QUEST_AFTER_WARP_PRIORITY_SEED, "code"),
        ("blocked_bnpc_actor_recovery_queue", QUEST_BLOCKED_BNPC_ACTOR_RECOVERY, "code"),
        ("after_warp_lifetime_seed_queue", QUEST_AFTER_WARP_LIFETIME_SEED, "code"),
        ("director_event_push_requirements", QUEST_DIRECTOR_EVENT_PUSH_REQUIREMENTS, "code"),
        ("scene_key_delegate_aliases", QUEST_SCENE_KEY_DELEGATE_ALIASES, "code"),
        ("alias_patch_plan", QUEST_ALIAS_PATCH_PLAN, "code"),
        ("sqb_private_mob_sql_blueprints", QUEST_SQB_PRIVATE_MOB_SQL_BLUEPRINTS, "code"),
        ("fight_helper_priority_seed_rows", QUEST_FIGHT_HELPER_PRIORITY_SEED, "code"),
        ("sqb_first_slice_queue", QUEST_SQB_FIRST_SLICE_QUEUE, "code"),
        ("sqbprivate_command_blueprints", QUEST_SQBPRIVATE_COMMAND_BLUEPRINTS, "code"),
        ("retail_blocker_blueprints", QUEST_RETAIL_BLOCKER_BLUEPRINTS, "code"),
        ("curated_blocker_reviews", QUEST_CURATED_BLOCKER_REVIEWS, "code"),
        ("job_metadata_enrichment_notes", QUEST_JOB_METADATA_ENRICHMENT, "code"),
        ("fight_content_lifecycle_join", QUEST_FIGHT_CONTENT_LIFECYCLE, "code"),
        ("sqb_materialization_gap_queue", QUEST_SQB_MATERIALIZATION_GAP, "code"),
        ("sqb_materialization_candidates", QUEST_SQB_MATERIALIZATION_CANDIDATES, "code"),
        ("non_en_scene_alias_payload_hazard_queue", QUEST_SCENE_ALIAS_PAYLOAD_HAZARD, "script_code"),
        ("scene_alias_patch_candidates", QUEST_SCENE_ALIAS_PATCH_CANDIDATES, "script_code"),
        ("blocked_owner_candidate_seed_rows", QUEST_BLOCKED_OWNER_CANDIDATE_SEED, "code"),
        ("owner_probe_addendum", QUEST_OWNER_PROBE_ADDENDUM, "code"),
        ("blocked_sqb_actor_recovery_queue", QUEST_BLOCKED_SQB_ACTOR_RECOVERY, "code"),
    )
    for source, path, code_field in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get(code_field, ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            source_ref = first_value(
                row.get("source_refs", ""),
                row.get("source_ref", ""),
                row.get("source_csv", ""),
                row.get("source", ""),
                row.get("evidence", ""),
                row.get("local_script_path", ""),
                row.get("local_quest_paths", ""),
                row.get("recovered_source_path", ""),
                row.get("recovered_script_path", ""),
                row.get("source_path", ""),
                row.get("file", ""),
            )
            rows.append(
                {
                    "source": source,
                    "priority": first_value(row.get("priority", ""), row.get("priority_score", ""), row.get("order", "")),
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "lane_or_status": first_value(row.get("payload_status", ""), row.get("probe_lane", ""), row.get("lane", ""), row.get("seed_class", ""), row.get("scaffold_family", ""), row.get("status", ""), row.get("metadata_status", ""), row.get("adapter_lane", ""), row.get("adapter_status", ""), row.get("parity_status", ""), row.get("safety_class", ""), row.get("probe_status", ""), row.get("blocker_type", ""), row.get("blocked_category", ""), row.get("probe_role", ""), row.get("fight_lane", ""), row.get("adapter_state", ""), row.get("push_enablement_class", "")),
                    "method_or_target": first_value(row.get("method_name", ""), row.get("delegate_method_to_call", ""), row.get("event_method", ""), row.get("function", ""), row.get("target", ""), row.get("cutscene_callee", ""), row.get("current_method", ""), row.get("replacement_method", ""), row.get("director", ""), row.get("scene_anchor", ""), row.get("content_route_candidate", "")),
                    "scene_key": first_value(row.get("scene_key", ""), row.get("scene_keys", ""), row.get("cutscene_id", "")),
                    "owner_or_actor": first_value(row.get("owner_actor_class_id", ""), row.get("owner_actor", ""), row.get("actor_class_id", ""), row.get("bnpc_actor_class_ids", ""), row.get("candidate_owner_selector", ""), row.get("callback_actor_or_symbol", ""), row.get("snpc", ""), row.get("template_actor_id", ""), row.get("objective_constant", ""), row.get("callback_actor", ""), row.get("display_hint", "")),
                    "command_or_recipe": first_value(row.get("questdelegate_command", ""), row.get("command", ""), row.get("candidate_command", ""), row.get("probe_command", ""), row.get("recovery_command", ""), row.get("gm_command_probe", ""), row.get("callback_smoke", ""), row.get("callback_probe", ""), row.get("recipe", ""), row.get("push_or_recipe", ""), row.get("implementation_recipe", ""), row.get("implementation_blueprint", ""), row.get("proposed_line", ""), row.get("spawn_policy", "")),
                    "payload_or_args": first_value(row.get("payload_expression", ""), row.get("payload_to_capture", ""), row.get("capture", ""), row.get("args", ""), row.get("required_args", ""), row.get("payload_slots_normalized", ""), row.get("argument_shape", ""), row.get("payload_probe_args", ""), row.get("recovered_cutscene_args", "")),
                    "wait_or_lifecycle": first_value(row.get("wait_recipe", ""), row.get("end_event_policy", ""), row.get("after_warp", ""), row.get("missing_piece", ""), row.get("active_event_type_expected", ""), row.get("event_type_expected", ""), row.get("proof_focus", ""), row.get("lifecycle_status", ""), row.get("content_finished_policy", "")),
                    "safety_or_risk": first_value(row.get("safety_gate", ""), row.get("safety_class", ""), row.get("safe_mutation_policy", ""), row.get("safe_policy", ""), row.get("mutation_guard", ""), row.get("mutation_policy", ""), row.get("risk", ""), row.get("risk_notes", ""), row.get("gate", ""), row.get("guardrail", ""), row.get("patch_disposition", ""), row.get("reward_lock_status", ""), row.get("no_offer", ""), row.get("runtime_offerable", "")),
                    "materialization_or_reward": first_value(row.get("materialization_status", ""), row.get("current_materialization_status", ""), row.get("actor_materialization_statuses", ""), row.get("materialization_or_analog", ""), row.get("candidate_status", ""), row.get("metadata_status", ""), row.get("reward_source", ""), row.get("actual_display_exp", ""), row.get("expected_display_exp", ""), row.get("mob_type_id", ""), row.get("actor_class_path", ""), row.get("area_class_path", ""), row.get("content_area_name", ""), row.get("content_script", ""), row.get("proposed_area_key", ""), row.get("action_id", "")),
                    "recommended_action": first_value(row.get("recommended_action", ""), row.get("recommended_next_step", ""), row.get("next_probe", ""), row.get("next_action", ""), row.get("next_fix", ""), row.get("validation_step", ""), row.get("spawn_policy", ""), row.get("safe_action", ""), row.get("enablement_action", ""), row.get("recovery_hint", "")),
                    "blockers": first_value(row.get("blocker", ""), row.get("blockers", ""), row.get("hold_reason", ""), row.get("data_needed", ""), row.get("hazard_reason", ""), row.get("exact_blocker", ""), row.get("blocked_field", ""), row.get("why", ""), row.get("missing_materialization_next_fix", "")),
                    "source_refs": source_ref,
                    "helper_hint": execution_addendum_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], -to_int(item["priority"]), item["method_or_target"]))
    return rows


def lpb_surface_helper_hint(source: str, row: dict[str, str]) -> str:
    if "server_delegate" in source:
        return "LPB server delegate/cutscene bridge surface"
    if "text_sheet" in source or "text_data" in source:
        return "LPB quest text sheet surface"
    if "scene_key" in source or "cutscene_key" in source or "asset_crosscheck" in source:
        return "LPB cutscene key/asset crosscheck surface"
    if "adapter_hardening" in source or "lane_execution" in source:
        return "instanced quest adapter/runtime hardening surface"
    if "probe_queue" in source or "gap_matrix" in source:
        return "LPB quest gap/probe queue surface"
    if "bridge" in source:
        return "LPB bridge/native call surface"
    if "event_protocol" in source or "event_entrypoints" in source:
        return "LPB event protocol/entrypoint surface"
    if "method" in source:
        return "LPB method/call surface"
    if "side_world" in source:
        return "LPB side-world quest parity surface"
    if "seasonal" in source:
        return "LPB seasonal quest surface"
    if "simplequestbattle" in source or "content_area" in source:
        return "LPB SQB/content director surface"
    if "scaffold" in source:
        return "LPB scaffold replacement surface"
    if "cutscene" in source:
        return "LPB cutscene hotspot surface"
    return "LPB quest decomp surface"


def build_lpb_surface_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    source_fields = (
        "logical_path",
        "source_file",
        "source_path",
        "path",
        "local_path",
        "recovered_path",
        "source_script",
        "local_director_path",
        "server_script",
        "server_file",
    )
    rows: list[dict[str, object]] = []
    for source, path, code_field in lpb_surface_sources():
        for row in read_csv(inputs.path(path)):
            codes = extract_included_codes(
                row,
                included,
                (
                    code_field,
                    "code",
                    "class_name",
                    "inferred_code",
                    "quest_code",
                    "inferred_target_code",
                    "quest_codes",
                    "sheet_name",
                    "key",
                    "sample_key",
                    "normalized_key",
                    "matched_codes",
                    "sample_codes",
                    "sample",
                    "source",
                    "scope",
                    "applies_to",
                ),
                source_fields,
            )
            if not codes:
                continue
            for code in codes:
                inv = inventory_by_code[code]
                rows.append(
                    {
                        "source": source,
                        "code": code,
                        "quest_id": inv.get("quest_id", ""),
                        "quest_name": inv.get("quest_name", ""),
                        "category": inv.get("category", ""),
                        "local_status": inv.get("local_status", ""),
                        "scope_or_family": first_value(row.get("scope", ""), row.get("family", ""), row.get("category", ""), row.get("batch", ""), row.get("class_kind", ""), row.get("event_family", ""), row.get("surface", ""), row.get("gap_type", ""), row.get("lane", "")),
                        "class_name": first_value(row.get("class_name", ""), row.get("quest_classes", ""), row.get("director", ""), row.get("server_script", ""), row.get("scripts", ""), row.get("sample_scripts", "")),
                        "base_class": row.get("base_class", ""),
                        "method_name": first_value(row.get("method", ""), row.get("method_name", ""), row.get("functions", ""), row.get("events", ""), row.get("sample_directors", "")),
                        "method_id": row.get("method_id", ""),
                        "line": first_value(row.get("call_line", ""), row.get("line", ""), row.get("function_start_line", ""), row.get("start_line", "")),
                        "call_or_event": first_value(row.get("call", ""), row.get("call_method", ""), row.get("event_family", ""), row.get("call_type", ""), row.get("method_arg", ""), row.get("delegate_events", ""), row.get("functions", ""), row.get("action", "")),
                        "receiver": row.get("receiver", ""),
                        "args_preview": first_value(row.get("args_preview", ""), row.get("args", ""), row.get("signature", ""), row.get("top_calls", ""), row.get("top_bridge_calls", ""), row.get("block_text", ""), row.get("scripts", ""), row.get("snippet", "")),
                        "tags_or_flags": first_value(row.get("tags", ""), row.get("top_tags", ""), row.get("feature_flags", ""), row.get("script_pattern", ""), row.get("base_class", ""), row.get("quest_parity_status", ""), row.get("parity_status", ""), row.get("local_status", ""), row.get("classification", ""), row.get("classifications", ""), row.get("status_counts", ""), row.get("bridge_status", ""), row.get("dat_csv_exists", "")),
                        "text_or_scene_refs": join_unique(
                            [
                                row.get("text_ids_seen", ""),
                                row.get("text_refs", ""),
                                row.get("scene_keys", ""),
                                row.get("joined_scene_keys", ""),
                                row.get("client_direct_scene_keys", ""),
                                row.get("sample_scene_keys", ""),
                                row.get("sample_key", ""),
                                row.get("normalized_key", ""),
                                row.get("key", ""),
                                row.get("sheet_name", ""),
                                row.get("quest_codes", ""),
                                row.get("widgets", ""),
                                row.get("dialogue_say_calls", ""),
                                row.get("nq_cutscene_calls", ""),
                                row.get("cutscene_call_rows", ""),
                                row.get("replay_ids", ""),
                            ],
                            limit=20,
                        ),
                        "source_path": first_value(row.get("logical_path", ""), row.get("source_file", ""), row.get("server_file", ""), row.get("source_path", ""), row.get("path", ""), row.get("local_path", ""), row.get("recovered_path", ""), row.get("source_script", "")),
                        "start_line": first_value(row.get("start_line", ""), row.get("function_start_line", "")),
                        "end_line": first_value(row.get("end_line", ""), row.get("function_end_line", "")),
                        "line_count": row.get("line_count", ""),
                        "call_count": first_value(row.get("call_count", ""), row.get("loads", ""), row.get("joined_rows", ""), row.get("total_rows", ""), row.get("lua_reference_count", "")),
                        "bridge_call_count": row.get("bridge_call_count", ""),
                        "status_or_risk": first_value(row.get("quest_parity_status", ""), row.get("parity_status", ""), row.get("recommended_next_step", ""), row.get("risk_note", ""), row.get("why_hot", ""), row.get("status", ""), row.get("classification", ""), row.get("bridge_status", ""), row.get("risk", ""), row.get("next_action", ""), row.get("reason", "")),
                        "helper_hint": lpb_surface_helper_hint(source, row),
                    }
                )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], item["class_name"], item["method_name"], to_int(item["line"])))
    return rows


def configured_csv_source_paths(inputs: Inputs) -> set[Path]:
    paths: set[Path] = set()
    for value in globals().values():
        if isinstance(value, Path) and value.suffix.lower() == ".csv":
            paths.add(inputs.path(value).resolve())
    return paths


def auxiliary_hit_helper_hint(path: Path) -> str:
    text = str(path).replace("\\", "/").lower()
    if "quest-normalized-data-pack" in text or "quest-master-gap-atlas" in text:
        return "duplicate/raw normalized quest export"
    if "decomp_further" in text or "decomp_more" in text or "decomp_correlation" in text:
        return "LPB broad decomp raw surface"
    if "content_systems" in text:
        return "LPB content-system auxiliary surface"
    if "missing_recovered_lua_surface" in text:
        return "LPB missing/recovered surface audit"
    if "source_term_hits" in text:
        return "LPB source-term evidence surface"
    if "probe" in text or "queue" in text:
        return "auxiliary probe/workqueue surface"
    if "cutscene" in text:
        return "auxiliary cutscene surface"
    return "auxiliary quest-code CSV evidence"


def auxiliary_row_snapshot(row: dict[str, str], matched_columns: Iterable[str]) -> str:
    snapshot_fields = [
        *matched_columns,
        "logical_path",
        "path",
        "source_path",
        "source_file",
        "server_file",
        "sample_source",
        "line",
        "method",
        "method_name",
        "function",
        "functions",
        "class_name",
        "classes",
        "args_preview",
        "line_text",
        "scene_key",
        "sample_key",
        "normalized_key",
        "quest_codes",
        "text_sheets",
        "status",
        "risk",
        "next_action",
        "reason",
    ]
    pieces: list[str] = []
    seen: set[str] = set()
    for field in snapshot_fields:
        if field in seen:
            continue
        seen.add(field)
        value = clean(row.get(field, ""))
        if not value:
            continue
        if len(value) > 220:
            value = value[:217] + "..."
        pieces.append(f"{field}={value}")
        if len(pieces) >= 10:
            break
    return "; ".join(pieces)


def build_auxiliary_csv_hit_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    configured = configured_csv_source_paths(inputs)
    output_dir = inputs.path(inputs.output).resolve()
    scan_roots = [inputs.root / "outputs", inputs.root / "tools" / "outputs"]
    rows: list[dict[str, object]] = []

    for scan_root in scan_roots:
        if not scan_root.exists():
            continue
        for path in scan_root.rglob("*.csv"):
            resolved = path.resolve()
            if resolved in configured:
                continue
            try:
                if resolved == output_dir or resolved.is_relative_to(output_dir):
                    continue
            except ValueError:
                pass

            source_rel = str(path.relative_to(inputs.root))
            source_family = path.parent.name
            helper_hint = auxiliary_hit_helper_hint(path)
            for row_number, row in enumerate(read_csv(path), start=2):
                field_codes: dict[str, list[str]] = {}
                for field, value in row.items():
                    if not value:
                        continue
                    codes = extract_included_codes({field: value}, included, (field,), ())
                    if codes:
                        field_codes[field] = codes
                if not field_codes:
                    continue
                codes_for_row = sorted({code for codes in field_codes.values() for code in codes})
                matched_columns = sorted(field_codes)
                matched_values = join_unique(
                    (
                        f"{field}:{'/'.join(field_codes[field])}"
                        for field in matched_columns
                    ),
                    limit=12,
                )
                for code in codes_for_row:
                    inv = inventory_by_code[code]
                    rows.append(
                        {
                            "source_file": source_rel,
                            "source_family": source_family,
                            "source_row": row_number,
                            "code": code,
                            "quest_id": inv.get("quest_id", ""),
                            "quest_name": inv.get("quest_name", ""),
                            "category": inv.get("category", ""),
                            "local_status": inv.get("local_status", ""),
                            "matched_columns": "; ".join(matched_columns),
                            "matched_values": matched_values,
                            "primary_path": first_value(row.get("logical_path", ""), row.get("path", ""), row.get("source_path", ""), row.get("source_file", ""), row.get("server_file", ""), row.get("sample_source", "")),
                            "line": first_value(row.get("line", ""), row.get("call_line", ""), row.get("start_line", ""), row.get("function_start_line", "")),
                            "function_or_method": first_value(row.get("method", ""), row.get("method_name", ""), row.get("function", ""), row.get("functions", ""), row.get("class_name", ""), row.get("classes", "")),
                            "scene_or_text_refs": join_unique(
                                [
                                    row.get("scene_key", ""),
                                    row.get("scene_keys", ""),
                                    row.get("sample_key", ""),
                                    row.get("normalized_key", ""),
                                    row.get("quest_codes", ""),
                                    row.get("text_sheets", ""),
                                    row.get("text_refs", ""),
                                ],
                                limit=12,
                            ),
                            "status_or_action": first_value(row.get("status", ""), row.get("risk", ""), row.get("next_action", ""), row.get("reason", ""), row.get("recommended_action", "")),
                            "row_snapshot": auxiliary_row_snapshot(row, matched_columns),
                            "helper_hint": helper_hint,
                        }
                    )

    rows.sort(key=lambda item: (item["category"], item["code"], item["source_file"], to_int(item["source_row"])))
    return rows


def lua_call_count(pattern: str, body: str) -> int:
    return len(re.findall(pattern, body, flags=re.IGNORECASE))


def lua_call_names(body: str) -> str:
    names = re.findall(r"[:.]([A-Za-z_][A-Za-z0-9_]*)\s*\(", body)
    return join_unique(names, limit=30)


def lua_scene_keys(code: str, body: str) -> str:
    keys = re.findall(rf"[\"']({re.escape(code)}[a-z0-9_]*\d[a-z0-9_]*)[\"']", body, flags=re.IGNORECASE)
    return join_unique((key.lower() for key in keys), limit=40)


def lua_text_ids(body: str) -> str:
    ids: list[str] = []
    for call in re.findall(r"[:.](?:say|ask|sayStatic|askStatic)\s*\(([^)]*)\)", body, flags=re.IGNORECASE):
        for value in re.findall(r"(?<![A-Za-z0-9_])(\d{1,5})(?![A-Za-z0-9_])", call):
            ids.append(value)
    return join_unique(ids, limit=40)


def lua_helper_hint(source: str, body: str, function_name: str, file_flags: str) -> str:
    lower = body.lower()
    if "initquestscaffold" in lower or "initclassquest" in lower or "initjobquest" in lower or "initquesttemplate" in lower:
        return "local template/scaffold wrapper"
    if "createcontentarea" in lower or "simplequestbattle" in lower or "questbattle" in lower:
        return "content/SQB script helper"
    if "startnqcutscene" in lower or "startfade" in lower:
        if "afterwarp" in lower:
            return "after-warp cutscene helper"
        return "cutscene push helper"
    if "delegateevent" in lower or "callclientfunction" in lower or "runclientfunction" in lower:
        return "delegate event helper"
    if re.search(r"[:.](say|ask|saystatic|askstatic)\s*\(", body, flags=re.IGNORECASE):
        return "dialogue/ask helper"
    if "completequest" in lower or "startsequence" in lower or "setquest" in lower:
        return "quest state transition helper"
    if "additem" in lower or "removeitem" in lower or "addgil" in lower or "addexp" in lower:
        return "reward/inventory helper"
    if not function_name or function_name == "<file>":
        if "template" in file_flags or "scaffold" in file_flags:
            return "local template/scaffold wrapper"
        return "script file summary helper"
    if source == "recovered_script":
        return "recovered route signature helper"
    return "local script signature helper"


def lua_risk_notes(body: str) -> str:
    notes: list[str] = []
    lower = body.lower()
    if "afterwarp" in lower:
        notes.append("after-warp lifetime/order")
    if "completequest" in lower and ("additem" in lower or "addgil" in lower or "addexp" in lower):
        notes.append("completion plus reward mutation")
    if "removeitem" in lower:
        notes.append("inventory removal")
    if "startnqcutscene" in lower and "startfadeout" not in lower:
        notes.append("cutscene without obvious fade-out wrapper")
    if "todo" in lower or "fixme" in lower:
        notes.append("local TODO/FIXME")
    if "initquestscaffold" in lower:
        notes.append("scaffold-only route")
    return "; ".join(notes)


def lua_file_flags(body: str) -> str:
    flags: list[str] = []
    lower = body.lower()
    if "initquestscaffold" in lower:
        flags.append("scaffold")
    if "initclassquest" in lower or "initjobquest" in lower or "initquesttemplate" in lower:
        flags.append("template")
    if "delegateevent" in lower or "callclientfunction" in lower or "runclientfunction" in lower:
        flags.append("client_event")
    if "startnqcutscene" in lower or "startfade" in lower:
        flags.append("cutscene")
    if "completequest" in lower or "startsequence" in lower or "setquest" in lower:
        flags.append("state")
    if "additem" in lower or "removeitem" in lower or "addgil" in lower or "addexp" in lower:
        flags.append("reward_or_inventory")
    if "createcontentarea" in lower or "simplequestbattle" in lower or "questbattle" in lower:
        flags.append("content_or_battle")
    if "todo" in lower or "fixme" in lower:
        flags.append("todo")
    return "; ".join(flags)


def lua_body_preview(body: str) -> str:
    preview_lines = [clean(line) for line in body.splitlines() if clean(line) and not clean(line).startswith("--")]
    preview = " | ".join(preview_lines[:4])
    return preview[:500]


def lua_script_rows_for_path(
    inputs: Inputs,
    inv: dict[str, object],
    source: str,
    script_path: str,
) -> list[dict[str, object]]:
    code = str(inv.get("code", ""))
    path = inputs.path(Path(script_path)) if script_path else Path("")
    exists = bool(script_path and path.exists())
    if not exists:
        return [
            {
                "source": source,
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "script_path": script_path,
                "file_exists": "false",
                "file_line_count": 0,
                "file_flags": "missing",
                "require_targets": "",
                "class_defs": "",
                "function_name": "<missing>",
                "function_line": "",
                "function_end_line": "",
                "function_arg_count": "",
                "function_body_lines": "",
                "scene_keys": "",
                "text_ids": "",
                "say_calls": 0,
                "ask_calls": 0,
                "delegate_calls": 0,
                "client_function_calls": 0,
                "cutscene_calls": 0,
                "fade_calls": 0,
                "quest_state_calls": 0,
                "reward_calls": 0,
                "inventory_calls": 0,
                "warp_or_zone_calls": 0,
                "content_or_battle_calls": 0,
                "call_names": "",
                "risk_notes": "missing script file",
                "helper_hint": "missing script recovery helper",
                "body_preview": "",
            }
        ]

    body = path.read_text(encoding="utf-8", errors="replace")
    lines = body.splitlines()
    flags = lua_file_flags(body)
    requires = join_unique(LUA_REQUIRE_RE.findall(body), limit=30)
    class_defs = join_unique((f"{name}:{base}" for name, base in LUA_DEFINE_CLASS_RE.findall(body)), limit=20)
    functions: list[tuple[int, str, str]] = []
    for index, line in enumerate(lines, start=1):
        match = LUA_FUNCTION_RE.match(line)
        if match:
            functions.append((index, match.group(1), match.group(2)))
    if not functions:
        functions = [(1, "<file>", "")]

    rows: list[dict[str, object]] = []
    for ordinal, (start_line, function_name, args) in enumerate(functions):
        next_start = functions[ordinal + 1][0] if ordinal + 1 < len(functions) else len(lines) + 1
        end_line = max(start_line, next_start - 1)
        function_body = "\n".join(lines[start_line - 1 : end_line])
        lower = function_body.lower()
        args_list = [arg.strip() for arg in args.split(",") if arg.strip()]
        rows.append(
            {
                "source": source,
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "script_path": script_path,
                "file_exists": "true",
                "file_line_count": len(lines),
                "file_flags": flags,
                "require_targets": requires,
                "class_defs": class_defs,
                "function_name": function_name,
                "function_line": start_line if function_name != "<file>" else "",
                "function_end_line": end_line if function_name != "<file>" else "",
                "function_arg_count": len(args_list) if function_name != "<file>" else "",
                "function_body_lines": len(function_body.splitlines()),
                "scene_keys": lua_scene_keys(code, function_body),
                "text_ids": lua_text_ids(function_body),
                "say_calls": lua_call_count(r"[:.]say(?:Static)?\s*\(", function_body),
                "ask_calls": lua_call_count(r"[:.]ask(?:Static)?\s*\(", function_body),
                "delegate_calls": lua_call_count(r"delegateEvent", function_body),
                "client_function_calls": lua_call_count(r"\b(?:callClientFunction|runClientFunction)\s*\(", function_body),
                "cutscene_calls": lua_call_count(r"startNQCutScene|startCutScene|startQuestCutScene", function_body),
                "fade_calls": lua_call_count(r"startFade(?:In|Out)", function_body),
                "quest_state_calls": lua_call_count(r"CompleteQuest|StartSequence|SetQuest|GetQuest|questSeq|QuestSeq", function_body),
                "reward_calls": lua_call_count(r"AddGil|AddExp|AddQuestReward|GenerateReward", function_body),
                "inventory_calls": lua_call_count(r"AddItem|RemoveItem|HasItem|GetItem", function_body),
                "warp_or_zone_calls": lua_call_count(r"Warp|warp|Zone|zone|eventWarp", function_body),
                "content_or_battle_calls": lua_call_count(r"CreateContentArea|QuestBattle|questBattle|SimpleQuestBattle|StartQuestBattle", function_body),
                "call_names": lua_call_names(function_body),
                "risk_notes": lua_risk_notes(function_body),
                "helper_hint": lua_helper_hint(source, function_body, function_name, flags),
                "body_preview": lua_body_preview(function_body if function_name != "<file>" else body),
            }
        )
    return rows


def build_script_signature_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for inv in inventory_by_code.values():
        rows.extend(lua_script_rows_for_path(inputs, inv, "local_script", str(inv.get("local_script_path", ""))))
        rows.extend(lua_script_rows_for_path(inputs, inv, "recovered_script", str(inv.get("recovered_script_path", ""))))
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], to_int(item["function_line"]), item["function_name"]))
    return rows


def build_script_delta_index(
    inventory: list[dict[str, object]],
    script_signature_index: list[dict[str, object]],
) -> list[dict[str, object]]:
    grouped: dict[tuple[str, str], list[dict[str, object]]] = defaultdict(list)
    for row in script_signature_index:
        grouped[(str(row.get("code", "")), str(row.get("source", "")))].append(row)

    rows: list[dict[str, object]] = []
    for inv in inventory:
        code = str(inv.get("code", ""))
        local_rows = grouped.get((code, "local_script"), [])
        recovered_rows = grouped.get((code, "recovered_script"), [])
        local_functions = [str(row.get("function_name", "")) for row in local_rows if str(row.get("function_name", "")) not in {"<file>", "<missing>"}]
        recovered_functions = [str(row.get("function_name", "")) for row in recovered_rows if str(row.get("function_name", "")) not in {"<file>", "<missing>"}]
        local_exists = any(str(row.get("file_exists", "")) == "true" for row in local_rows)
        recovered_exists = any(str(row.get("file_exists", "")) == "true" for row in recovered_rows)
        local_flags = join_unique((row.get("file_flags", "") for row in local_rows), limit=20)
        recovered_flags = join_unique((row.get("file_flags", "") for row in recovered_rows), limit=20)
        local_scenes = join_unique((row.get("scene_keys", "") for row in local_rows), limit=40)
        recovered_scenes = join_unique((row.get("scene_keys", "") for row in recovered_rows), limit=40)
        local_calls = sum(to_int(row.get("say_calls", "")) + to_int(row.get("ask_calls", "")) + to_int(row.get("cutscene_calls", "")) + to_int(row.get("quest_state_calls", "")) for row in local_rows)
        recovered_calls = sum(to_int(row.get("say_calls", "")) + to_int(row.get("ask_calls", "")) + to_int(row.get("cutscene_calls", "")) + to_int(row.get("quest_state_calls", "")) for row in recovered_rows)

        if not recovered_exists:
            classification = "missing_recovered_script"
            helper = "recover quest Lua before implementation"
        elif not local_exists:
            classification = "missing_local_script"
            helper = "create local quest wrapper from recovered route"
        elif "scaffold" in local_flags or "template" in local_flags:
            classification = "local_template_recovered_route"
            helper = "template replacement helper"
        elif recovered_calls > local_calls:
            classification = "local_under_recovered_call_surface"
            helper = "route parity helper"
        elif local_calls and recovered_calls:
            classification = "local_and_recovered_have_logic"
            helper = "manual parity review helper"
        else:
            classification = "low_signal_script_pair"
            helper = "script metadata review helper"

        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "local_script_exists": str(local_exists).lower(),
                "recovered_script_exists": str(recovered_exists).lower(),
                "local_function_count": len(local_functions),
                "recovered_function_count": len(recovered_functions),
                "local_file_flags": local_flags,
                "recovered_file_flags": recovered_flags,
                "local_scene_keys": local_scenes,
                "recovered_scene_keys": recovered_scenes,
                "local_call_signal": local_calls,
                "recovered_call_signal": recovered_calls,
                "missing_local_functions": join_unique((name for name in recovered_functions if name not in local_functions), limit=40),
                "local_only_functions": join_unique((name for name in local_functions if name not in recovered_functions), limit=40),
                "delta_classification": classification,
                "recommended_helper": helper,
                "risk_notes": join_unique((row.get("risk_notes", "") for row in [*local_rows, *recovered_rows]), limit=20),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def seasonal_item_helper_hint(source: str, row: dict[str, str]) -> str:
    if source == "seasonal_quest_item_surface":
        if clean(row.get("related_item_ids", "")):
            return "seasonal quest related item audit"
        return "seasonal quest item surface review"
    if clean(row.get("unlock_state", "")).lower() == "recovered_dialogue_or_display_only":
        return "seasonal display-only item evidence"
    return "seasonal item atlas review"


def build_seasonal_item_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    item_rows_by_bucket: dict[str, list[dict[str, str]]] = defaultdict(list)
    item_rows_by_code: dict[str, list[dict[str, str]]] = defaultdict(list)
    codes_by_length = sorted(included, key=len, reverse=True)
    for item in read_csv(inputs.path(SEASONAL_ITEM_ATLAS)):
        bucket = clean(item.get("event_bucket", ""))
        if bucket:
            item_rows_by_bucket[bucket].append(item)
        evidence = clean(item.get("evidence", "")).lower().replace("\\", "/")
        for code in codes_by_length:
            if f"/{code}.lua" in evidence:
                item_rows_by_code[code].append(item)
                break

    rows: list[dict[str, object]] = []
    seen: set[tuple[str, str, str]] = set()
    for surface in read_csv(inputs.path(SEASONAL_QUEST_ITEM_SURFACE)):
        code = norm_code(surface.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        seen.add(("seasonal_quest_item_surface", code, clean(surface.get("event_bucket", ""))))
        rows.append(
            {
                "source": "seasonal_quest_item_surface",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "event_bucket": surface.get("event_bucket", ""),
                "item_id": "",
                "item_name": "",
                "unlock_state": "",
                "source_tags": "",
                "related_item_ids": surface.get("related_item_ids", ""),
                "item_category": "",
                "is_rare": "",
                "is_exclusive": "",
                "evidence": first_value(surface.get("recovered_script", ""), surface.get("local_script", "")),
                "helper_hint": seasonal_item_helper_hint("seasonal_quest_item_surface", surface),
            }
        )
        for item in item_rows_by_bucket.get(clean(surface.get("event_bucket", "")), []) + item_rows_by_code.get(code, []):
            item_key = ("seasonal_item_atlas", code, clean(item.get("item_id", "")))
            if item_key in seen:
                continue
            seen.add(item_key)
            rows.append(
                {
                    "source": "seasonal_item_atlas",
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "event_bucket": item.get("event_bucket", ""),
                    "item_id": item.get("item_id", ""),
                    "item_name": item.get("name", ""),
                    "unlock_state": item.get("unlock_state", ""),
                    "source_tags": item.get("source_tags", ""),
                    "related_item_ids": surface.get("related_item_ids", ""),
                    "item_category": item.get("category", ""),
                    "is_rare": item.get("is_rare", ""),
                    "is_exclusive": item.get("is_exclusive", ""),
                    "evidence": item.get("evidence", ""),
                    "helper_hint": seasonal_item_helper_hint("seasonal_item_atlas", item),
                }
            )
    for code, items in item_rows_by_code.items():
        if code not in included:
            continue
        inv = inventory_by_code[code]
        for item in items:
            item_key = ("seasonal_item_atlas", code, clean(item.get("item_id", "")))
            if item_key in seen:
                continue
            seen.add(item_key)
            rows.append(
                {
                    "source": "seasonal_item_atlas",
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "event_bucket": item.get("event_bucket", ""),
                    "item_id": item.get("item_id", ""),
                    "item_name": item.get("name", ""),
                    "unlock_state": item.get("unlock_state", ""),
                    "source_tags": item.get("source_tags", ""),
                    "related_item_ids": "",
                    "item_category": item.get("category", ""),
                    "is_rare": item.get("is_rare", ""),
                    "is_exclusive": item.get("is_exclusive", ""),
                    "evidence": item.get("evidence", ""),
                    "helper_hint": seasonal_item_helper_hint("seasonal_item_atlas", item),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], item["event_bucket"], to_int(item["item_id"])))
    return rows


def cutscene_matrix_helper_hint(source: str, row: dict[str, str]) -> str:
    if source in {"local_cutscene_delegate_inventory", "local_delegate_event_callers"}:
        return "local delegate callsite audit"
    if source == "cutscene_push_template_candidates":
        return "candidate cutscene push template"
    if source == "script_cutscene_gap_summary":
        return "per-script cutscene gap summary"
    if source == "after_warp_cutscene_events":
        return "after-warp cutscene lifetime review"
    if source == "scene_bearing_events_needing_local_push":
        return "missing local scene push candidate"
    if source == "route_owner_patch_focus_queue":
        return "route-owner patch focus"
    if source == "blocker_method_spine_focus":
        return "blocker method spine focus"
    return "recovered cutscene push matrix"


def build_cutscene_matrix_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("local_cutscene_delegate_inventory", QUEST_LOCAL_CUTSCENE_DELEGATES, "script_code"),
        ("local_delegate_event_callers", QUEST_LOCAL_DELEGATE_EVENT_CALLERS, "script_code"),
        ("recovered_cutscene_push_matrix", QUEST_RECOVERED_CUTSCENE_PUSH_MATRIX, "script_code"),
        ("cutscene_push_template_candidates", QUEST_CUTSCENE_PUSH_TEMPLATE_CANDIDATES, "script_code"),
        ("cutscene_implementation_gap_workqueue", QUEST_CUTSCENE_IMPLEMENTATION_GAP_WORKQUEUE, "script_code"),
        ("script_cutscene_gap_summary", QUEST_SCRIPT_CUTSCENE_GAP_SUMMARY, "script_code"),
        ("scene_bearing_events_needing_local_push", QUEST_SCENE_BEARING_EVENTS_NEEDING_LOCAL_PUSH, "code"),
        ("after_warp_cutscene_events", QUEST_AFTER_WARP_CUTSCENE_EVENTS, "code"),
        ("blocker_method_spine_focus", QUEST_BLOCKER_METHOD_SPINE_FOCUS, "script_code"),
        ("route_owner_patch_focus_queue", QUEST_ROUTE_OWNER_PATCH_FOCUS, "code"),
    )
    for source, path, code_field in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get(code_field, ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "priority": first_value(row.get("priority", ""), row.get("template_priority", ""), row.get("priority_score", "")),
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "source_file": first_value(row.get("local_script_path", ""), row.get("file", ""), row.get("recovered_source_path", ""), row.get("recovered_path", ""), row.get("source_path", "")),
                    "line": first_value(row.get("line", ""), row.get("recovered_line", ""), row.get("function_line", ""), row.get("line_start", "")),
                    "method_name": first_value(row.get("method_name", ""), row.get("event_method", ""), row.get("method_arg", "")),
                    "scene_key": first_value(row.get("cutscene_id", ""), row.get("cutscene_id_norm", ""), row.get("scene_keys", "")),
                    "delegate_kind": first_value(row.get("delegate_kind", ""), row.get("call_kind", ""), row.get("cutscene_callee", ""), row.get("callee", "")),
                    "template_or_recipe": first_value(row.get("candidate_push_template", ""), row.get("push_recipe", ""), row.get("recommended_probe", "")),
                    "status": first_value(row.get("push_status", ""), row.get("status_summary", ""), row.get("route_owner_resolution_status", ""), row.get("blocker_type", "")),
                    "owner_hint": first_value(row.get("owner_hint", ""), row.get("inferred_actor_class_id", ""), row.get("route_owner_actor_class_ids", "")),
                    "payload_to_capture": row.get("payload_to_capture", ""),
                    "after_warp": row.get("after_warp", ""),
                    "mutation_policy": first_value(row.get("mutation_policy", ""), row.get("mutation_families", "")),
                    "local_evidence": join_unique(
                        [
                            row.get("local_exact_method_delegate_lines", ""),
                            row.get("local_scene_alias_lines", ""),
                            row.get("local_dynamic_delegate_lines", ""),
                            row.get("line_text", ""),
                            row.get("raw_line", ""),
                        ],
                        limit=12,
                    ),
                    "recommended_action": first_value(row.get("recommended_next_step", ""), row.get("next_action", ""), row.get("recommended_patch_action", "")),
                    "blocker_notes": first_value(row.get("blocker_notes", ""), row.get("risk_notes", ""), row.get("scaffold_mutation_notes", "")),
                    "source_csv": row.get("source_csv", ""),
                    "helper_hint": cutscene_matrix_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["method_name"], item["scene_key"]))
    return rows


def mutator_reward_sync_helper_hint(source: str, row: dict[str, str]) -> str:
    if source == "local_mutator_scan":
        if to_int(row.get("direct_mutator_count", "")):
            return "direct quest mutator audit"
        return "template mutator inheritance audit"
    if "reward_display" in source:
        if clean(row.get("status", "")).lower() == "hold_for_review":
            return "reward display sync review"
        return "reward display sync candidate"
    if "bnpc" in source:
        return "BNPC spawn/materialization enrichment"
    return "quest data enrichment queue"


def build_mutator_reward_sync_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("local_mutator_scan", QUEST_LOCAL_MUTATOR_SCAN, "code"),
        ("reward_display_sync_scan", QUEST_REWARD_DISPLAY_SYNC_SCAN, "code"),
        ("reward_display_dat_backed_patch_queue", QUEST_REWARD_DISPLAY_DAT_PATCH, "code"),
        ("reward_display_wiki_review_queue", QUEST_REWARD_DISPLAY_WIKI_REVIEW, "code"),
        ("addendum_current_quest_data_enrichment_queue", QUEST_ADDENDUM_ENRICHMENT_QUEUE, "code"),
        ("addendum_reward_display_sync_candidates", QUEST_ADDENDUM_REWARD_SYNC, "code"),
        ("addendum_existing_bnpc_spawn_enrichment_candidates", QUEST_ADDENDUM_EXISTING_BNPC, "code"),
        ("addendum_private_bnpc_materialization_candidate", QUEST_ADDENDUM_PRIVATE_BNPC, "code"),
    )
    for source, path, code_field in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get(code_field, ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "priority": first_value(row.get("priority", ""), row.get("gap_score", "")),
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "file_path": first_value(row.get("script_path", ""), row.get("file_path", ""), row.get("local_script_path", ""), row.get("script", "")),
                    "line": first_value(row.get("line", ""), row.get("line_hint", ""), row.get("script_line", "")),
                    "risk_or_status": first_value(row.get("status", ""), row.get("implementation_status", ""), row.get("candidate_status", ""), row.get("has_direct_state_mutator", "")),
                    "direct_mutator_count": row.get("direct_mutator_count", ""),
                    "template_mutators": row.get("template_mutators", ""),
                    "actual_display_exp": first_value(row.get("actual_display_exp", ""), row.get("old_display_exp", "")),
                    "expected_display_exp": row.get("expected_display_exp", ""),
                    "reward_source": row.get("reward_source", ""),
                    "reward_policy": first_value(row.get("patch_policy", ""), row.get("safe_policy", "")),
                    "bnpc_actor_class_id": row.get("actor_class_id", ""),
                    "bnpc_status": first_value(row.get("status", ""), row.get("candidate_status", "")),
                    "zone_or_spawn_summary": first_value(row.get("zone_summary", ""), row.get("suggested_spawn_surface", ""), row.get("sample_spawn_points", "")),
                    "recommended_action": first_value(row.get("recommended_next_step", ""), row.get("recommended_lane", ""), row.get("safe_policy", "")),
                    "blocker_notes": first_value(row.get("blockers", ""), row.get("safe_policy", "")),
                    "evidence": first_value(row.get("current_line", ""), row.get("reward_join_ref", ""), row.get("source_refs", "")),
                    "helper_hint": mutator_reward_sync_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["file_path"], to_int(item["line"])))
    return rows


def sqb_adapter_helper_hint(source: str, row: dict[str, str]) -> str:
    if source == "simplequestbattle_targets":
        return "SQB director target inventory"
    if "reward_locked" in source or clean(row.get("reward_lock_status", "")):
        return "SQB reward lock audit"
    if "payload" in source or "proof" in source:
        return "SQB fight payload/proof queue"
    if "actor_mob_spawn" in source:
        return "fight actor/mob/spawn materialization"
    if "cutscene_dependency" in source:
        return "SQB cutscene dependency review"
    return "SQB adapter review"


def build_sqb_adapter_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    included = set(inventory_by_code)
    rows: list[dict[str, object]] = []
    sources = (
        ("simplequestbattle_targets", QUEST_SIMPLEQUESTBATTLE_TARGETS, "code"),
        ("sqb_adapter_rows", QUEST_SQB_ADAPTER_ROWS, "code"),
        ("fight_sqb_push_operator_rows", QUEST_FIGHT_SQB_PUSH_OPERATORS, "code"),
        ("sqb_cutscene_dependency_queue", QUEST_SQB_CUTSCENE_DEPENDENCIES, "code"),
        ("sqb_reward_locked_queue", QUEST_SQB_REWARD_LOCKED, "code"),
        ("fight_actor_mob_spawn_join", QUEST_FIGHT_ACTOR_MOB_SPAWN, "code"),
        ("fight_payload_probe_queue", QUEST_FIGHT_PAYLOAD_PROBE, "code"),
        ("fight_materialization_reward_lock_proof_queue", QUEST_FIGHT_REWARD_LOCK_PROOF, "code"),
    )
    for source, path, code_field in sources:
        for row in read_csv(inputs.path(path)):
            code = norm_code(row.get(code_field, ""))
            if code not in included:
                continue
            inv = inventory_by_code[code]
            rows.append(
                {
                    "source": source,
                    "priority": row.get("priority", ""),
                    "code": code,
                    "quest_id": inv.get("quest_id", ""),
                    "quest_name": inv.get("quest_name", ""),
                    "category": inv.get("category", ""),
                    "local_status": inv.get("local_status", ""),
                    "director": row.get("director", ""),
                    "adapter_lane": first_value(row.get("adapter_lane", ""), row.get("operator_lane", ""), row.get("fight_lane", ""), row.get("lane", "")),
                    "adapter_status": first_value(row.get("adapter_status", ""), row.get("adapter_state", ""), row.get("proof_status", "")),
                    "content_area": first_value(row.get("content_area_class", ""), row.get("content_area_name", "")),
                    "content_script": first_value(row.get("proposed_content_script", ""), row.get("content_script", "")),
                    "callback_actor": first_value(row.get("callback_actor", ""), row.get("callback_actor_or_symbol", ""), row.get("actor_class_id", "")),
                    "materialization_status": first_value(row.get("materialization_status", ""), row.get("actor_materialization_statuses", ""), row.get("bnpc_status", "")),
                    "mob_or_spawn_status": join_unique([row.get("sql_mob_type_count", ""), row.get("sql_spawn_count", ""), row.get("ambient_spawn_count", "")], limit=6),
                    "known_command": first_value(row.get("known_command", ""), row.get("command_template", ""), row.get("callback_smoke", "")),
                    "missing_command": first_value(row.get("missing_command", ""), row.get("missing_materialization_next_fix", ""), row.get("next_fix", "")),
                    "expected_signal": first_value(row.get("expected_callback_result", ""), row.get("expected_success_signal", ""), row.get("success_signal", "")),
                    "reward_lock_status": row.get("reward_lock_status", ""),
                    "safe_to_enable_rewards": row.get("safe_to_enable_rewards", ""),
                    "risk_class": first_value(row.get("risk_class", ""), row.get("safe_enablement_class", "")),
                    "recommended_action": first_value(row.get("recommended_next_step", ""), row.get("recommended_action", ""), row.get("next_probe", ""), row.get("next_fix", "")),
                    "blocker_notes": first_value(row.get("blockers", ""), row.get("risk_notes", "")),
                    "evidence_refs": first_value(row.get("evidence_refs", ""), row.get("source_path", ""), row.get("source_refs", "")),
                    "helper_hint": sqb_adapter_helper_hint(source, row),
                }
            )
    rows.sort(key=lambda item: (item["category"], item["code"], -to_int(item["priority"]), item["source"], item["adapter_lane"], item["callback_actor"]))
    return rows


def build_battle_index(inputs: Inputs, inventory_by_code: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    included = set(inventory_by_code)

    for row in read_csv(inputs.path(BNPC_SPAWNS)):
        code = norm_code(row.get("quest_code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "quest_bnpc_spawn_summary",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "bnpc_or_mob_type_id": row.get("bnpc_type_ids", ""),
                "display_key": row.get("mob_display_names", ""),
                "objective_constant": row.get("constant", ""),
                "status": row.get("status", ""),
                "note": row.get("sample_spawn_points", ""),
                "recommended_next_action": "verify callback/objective and duplicate reward guard before gameplay enablement",
                "source_refs": f"{row.get('script', '')}:{row.get('script_line', '')}",
            }
        )

    for row in read_csv(inputs.path(BNPC_MATERIALIZATION)):
        code = norm_code(row.get("code", ""))
        if code not in included:
            continue
        inv = inventory_by_code[code]
        rows.append(
            {
                "source": "bnpc_materialization_candidates",
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "bnpc_or_mob_type_id": row.get("existing_bnpc_type_ids", ""),
                "display_key": first_value(row.get("proposed_display_name", ""), row.get("display_hint", "")),
                "objective_constant": row.get("objective_constant", ""),
                "status": first_value(row.get("candidate_status", ""), row.get("current_materialization_status", "")),
                "note": first_value(row.get("curated_zone_sequence_clue", ""), row.get("risk_notes", "")),
                "recommended_next_action": row.get("recommended_next_action", ""),
                "source_refs": row.get("source_refs", ""),
            }
        )

    titles_by_code = {code: str(row.get("quest_name", "")) for code, row in inventory_by_code.items()}
    for row in build_sql_battle_notes(inputs.path(BNPC_LOOT_SQL), titles_by_code):
        code = norm_code(row.get("code", ""))
        inv = inventory_by_code.get(code, {})
        rows.append(
            {
                "source": row.get("source", ""),
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "actor_class_id": row.get("actor_class_id", ""),
                "bnpc_or_mob_type_id": row.get("mob_type_id", ""),
                "display_key": row.get("display_key", ""),
                "objective_constant": "",
                "status": row.get("status", ""),
                "note": row.get("note", ""),
                "recommended_next_action": row.get("recommended_next_action", ""),
                "source_refs": row.get("source_refs", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], item["source"], item["actor_class_id"]))
    return rows


def method_scene_context(scene_index: list[dict[str, object]]) -> dict[tuple[str, str], list[dict[str, object]]]:
    by_method: dict[tuple[str, str], list[dict[str, object]]] = defaultdict(list)
    for row in scene_index:
        code = norm_code(row.get("code", ""))
        for method in split_many(row.get("methods", "")):
            if method:
                by_method[(code, method)].append(row)
    return by_method


def probe_hint_for_method(row: dict[str, object], scenes: list[dict[str, object]]) -> tuple[str, str, str, str, str]:
    method_name = clean(row.get("method_name", ""))
    method_family = clean(row.get("method_family", ""))
    call_families = clean(row.get("call_families", "")).lower()
    callees = clean(row.get("callees", ""))
    callee_lower = callees.lower()
    mutation = clean(row.get("mutation_families", ""))
    ask_rows = clean(row.get("ask_rows", ""))
    cutscene_ids = clean(row.get("cutscene_ids", ""))
    launchers = join_unique((scene.get("launchers", "") for scene in scenes), limit=10)
    replay_placeholders = join_unique((scene.get("replay_placeholders", "") for scene in scenes), limit=12)
    launcher_lower = launchers.lower()
    placeholder_lower = replay_placeholders.lower()

    if method_name == "initText" or method_family == "init_text":
        return ("skip_init_text", "", "", "none", "initial text loader; not useful as a runtime probe")

    if "mutation" in mutation.lower() or mutation or "reward" in call_families or "additem" in callee_lower or "completequest" in callee_lower:
        return (
            "reward_or_state_audit",
            "completeQuestWithRewards / quest data helpers only after proof",
            "",
            "high",
            "recovered method has reward, item, or quest-state mutation evidence",
        )

    if "linkshell" in call_families or "linkshell" in callee_lower:
        return (
            "npc_linkshell_probe",
            "sendNpcLsMessagePack / quest data step helpers",
            "",
            "medium",
            "NPC linkshell progression often needs quest data step tracking",
        )

    if "startsnpc" in launcher_lower or "-201" in placeholder_lower:
        payload = "@snpc5"
        helper = "delegateSnpcEvent / getSnpcDelegateArgList"
        risk = "medium"
        reason = "recovered quest method appears to consume the raw live SNPC tuple"
        if "-217" in placeholder_lower:
            helper = "delegateSnpcEvent plus sexuality-skin review"
            reason += "; replay row also uses sexuality-skin placeholder -217"
        return ("snpc_delegate_probe", helper, payload, risk, reason)

    if cutscene_ids or "cutscene" in call_families or "cutscene" in callee_lower:
        return (
            "cutscene_delegate_probe",
            "delegateEvent / delegateEventWithArgList",
            "",
            "medium",
            "recovered method launches one or more cutscenes",
        )

    content_or_warp_callees = (
        "contentsjoin",
        "pastareajoin",
        "instanceareajoin",
        "scheduleeventwarp",
        "warptoprivate",
        "warptopublic",
        "warptoposition",
        "dozonechange",
    )
    has_content_or_warp_call = "content" in call_families or any(token in callee_lower for token in content_or_warp_callees)
    if has_content_or_warp_call:
        return (
            "content_or_warp_probe",
            "delegateEvent plus content/warp owner audit",
            "",
            "high",
            "content join or warp semantics need runtime proof",
        )

    if ask_rows or "ask" in call_families or "ask" in callee_lower:
        return (
            "ask_widget_probe",
            "delegateEventAndAdvanceIfAccepted if accepted/declined route is proven",
            "",
            "medium",
            "ask/widget return values need accepted/declined handling",
        )

    if "talk" in call_families or "say" in callee_lower or method_name.startswith("processEvent"):
        return (
            "talk_delegate_probe",
            "delegateEvent",
            "",
            "low",
            "lightweight talk method; useful for dialogue row verification",
        )

    return ("manual_review_probe", "delegateEvent", "", "medium", "no specific helper family inferred")


def build_probe_commands(method_index: list[dict[str, object]], scene_index: list[dict[str, object]]) -> list[dict[str, object]]:
    scenes_by_method = method_scene_context(scene_index)
    rows: list[dict[str, object]] = []
    for method in method_index:
        code = norm_code(method.get("code", ""))
        method_name = clean(method.get("method_name", ""))
        scenes = scenes_by_method.get((code, method_name), [])
        probe_kind, helper_hint, payload_hint, risk, reason = probe_hint_for_method(method, scenes)
        if probe_kind == "skip_init_text":
            continue
        quest_id = clean(method.get("quest_id", ""))
        command = f"!questdelegate quest:{quest_id} {method_name}"
        if payload_hint:
            command += f" {payload_hint}"
        scene_keys = join_unique((scene.get("scene_key", "") for scene in scenes), limit=12)
        replay_ids = join_unique((scene.get("replay_ids", "") for scene in scenes), limit=12)
        rows.append(
            {
                "code": code,
                "quest_id": quest_id,
                "quest_name": method.get("quest_name", ""),
                "category": method.get("category", ""),
                "local_status": method.get("local_status", ""),
                "method_order": method.get("method_order", ""),
                "method_name": method_name,
                "probe_kind": probe_kind,
                "helper_hint": helper_hint,
                "payload_hint": payload_hint,
                "risk": risk,
                "command": command,
                "scene_keys": scene_keys,
                "replay_ids": replay_ids,
                "cutscene_ids": method.get("cutscene_ids", ""),
                "call_families": method.get("call_families", ""),
                "callees": method.get("callees", ""),
                "reason": reason,
                "source_path": method.get("source_path", ""),
                "line_start": method.get("line_start", ""),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"], to_int(item["method_order"]), item["method_name"]))
    return rows


def build_helper_recommendations(
    inventory: list[dict[str, object]],
    probe_commands: list[dict[str, object]],
    battle_index: list[dict[str, object]],
) -> list[dict[str, object]]:
    probes_by_code: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in probe_commands:
        probes_by_code[norm_code(row.get("code", ""))].append(row)

    battles_by_code: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in battle_index:
        battles_by_code[norm_code(row.get("code", ""))].append(row)

    rows: list[dict[str, object]] = []
    for inv in inventory:
        code = norm_code(inv.get("code", ""))
        probes = probes_by_code.get(code, [])
        probe_priority = {
            "snpc_delegate_probe": 0,
            "cutscene_delegate_probe": 1,
            "ask_widget_probe": 2,
            "reward_or_state_audit": 3,
            "content_or_warp_probe": 4,
            "npc_linkshell_probe": 5,
            "manual_review_probe": 6,
            "talk_delegate_probe": 7,
        }
        ordered_probes = sorted(
            probes,
            key=lambda probe: (
                probe_priority.get(clean(probe.get("probe_kind", "")), 99),
                to_int(probe.get("method_order", "")),
                clean(probe.get("method_name", "")),
            ),
        )
        helper_counts = Counter(clean(probe.get("helper_hint", "")) for probe in probes if clean(probe.get("helper_hint", "")))
        kind_counts = Counter(clean(probe.get("probe_kind", "")) for probe in probes if clean(probe.get("probe_kind", "")))
        risk_counts = Counter(clean(probe.get("risk", "")) for probe in probes if clean(probe.get("risk", "")))
        if to_int(inv.get("local_enpc_binding_rows", "")):
            helper_counts["local ENpc binding helpers"] += to_int(inv.get("local_enpc_binding_rows", ""))
            kind_counts["local_runtime_surface"] += to_int(inv.get("local_enpc_binding_rows", ""))
        if to_int(inv.get("local_delegate_push_rows", "")) or to_int(inv.get("unmatched_delegate_rows", "")):
            delegate_rows = to_int(inv.get("local_delegate_push_rows", "")) + to_int(inv.get("unmatched_delegate_rows", ""))
            helper_counts["local delegate push helpers"] += delegate_rows
            kind_counts["local_delegate_push"] += delegate_rows
        if to_int(inv.get("cutscene_argument_rows", "")):
            helper_counts["cutscene argument/runtime payload helpers"] += to_int(inv.get("cutscene_argument_rows", ""))
            kind_counts["cutscene_argument_shape"] += to_int(inv.get("cutscene_argument_rows", ""))
        if to_int(inv.get("route_owner_rows", "")):
            helper_counts["route owner inference helpers"] += to_int(inv.get("route_owner_rows", ""))
            kind_counts["route_owner_inference"] += to_int(inv.get("route_owner_rows", ""))
        proof_rows = (
            to_int(inv.get("payload_atlas_rows", ""))
            + to_int(inv.get("payload_probe_rows", ""))
            + to_int(inv.get("eventupdate_proof_rows", ""))
            + to_int(inv.get("after_warp_proof_rows", ""))
            + to_int(inv.get("blocked_owner_rows", ""))
        )
        if proof_rows:
            helper_counts["payload/EventUpdate proof helpers"] += proof_rows
            kind_counts["payload_proof_queue"] += proof_rows
        fight_rows = (
            to_int(inv.get("fight_readiness_rows", ""))
            + to_int(inv.get("fight_return_reward_rows", ""))
            + to_int(inv.get("fight_kill_route_rows", ""))
        )
        if fight_rows:
            helper_counts["fight readiness/materialization helpers"] += fight_rows
            kind_counts["fight_readiness"] += fight_rows
        if to_int(inv.get("blueprint_rows", "")) or to_int(inv.get("sequence_blueprint_rows", "")):
            blueprint_rows = to_int(inv.get("blueprint_rows", "")) + to_int(inv.get("sequence_blueprint_rows", ""))
            helper_counts["implementation blueprint helpers"] += blueprint_rows
            kind_counts["implementation_blueprint"] += blueprint_rows
        contract_total = (
            to_int(inv.get("cutscene_contract_rows", ""))
            + to_int(inv.get("scaffold_contract_rows", ""))
            + to_int(inv.get("safe_patch_contract_rows", ""))
            + to_int(inv.get("snpc_contract_rows", ""))
            + to_int(inv.get("manual_contract_rows", ""))
            + to_int(inv.get("director_notice_rows", ""))
            + to_int(inv.get("push_recipe_rows", ""))
            + to_int(inv.get("push_impl_rows", ""))
            + to_int(inv.get("owner_probe_rows", ""))
            + to_int(inv.get("method_probe_recipe_rows", ""))
        )
        if contract_total:
            helper_counts["cutscene contract/push recipe helpers"] += contract_total
            kind_counts["cutscene_contract"] += contract_total
        runtime_unlock_total = (
            to_int(inv.get("runtime_unlock_triage_rows", ""))
            + to_int(inv.get("runtime_unlock_scaffold_rows", ""))
            + to_int(inv.get("runtime_unlock_exact_hazard_rows", ""))
            + to_int(inv.get("runtime_unlock_snpc_a8_rows", ""))
            + to_int(inv.get("runtime_unlock_sqb_private_rows", ""))
            + to_int(inv.get("runtime_unlock_world_bnpc_rows", ""))
            + to_int(inv.get("runtime_unlock_requested_proof_rows", ""))
            + to_int(inv.get("runtime_unlock_wave2_rows", ""))
            + to_int(inv.get("runtime_unlock_safe_smoke_rows", ""))
            + to_int(inv.get("runtime_unlock_extra_rows", ""))
        )
        if runtime_unlock_total:
            helper_counts["runtime unlock/proof helpers"] += runtime_unlock_total
            kind_counts["runtime_unlock"] += runtime_unlock_total
        instanced_total = (
            to_int(inv.get("instance_local_sequence_rows", ""))
            + to_int(inv.get("instance_event_method_rows", ""))
            + to_int(inv.get("instance_owner_scene_rows", ""))
            + to_int(inv.get("instance_owner_hint_rows", ""))
            + to_int(inv.get("instance_method_text_rows", ""))
            + to_int(inv.get("instance_text_clue_rows", ""))
            + to_int(inv.get("instance_runtime_rows", ""))
        )
        if instanced_total:
            helper_counts["instanced owner/runtime helpers"] += instanced_total
            kind_counts["instanced_owner_runtime"] += instanced_total
        starter_total = (
            to_int(inv.get("starter_signal_rows", ""))
            + to_int(inv.get("starter_method_rows", ""))
            + to_int(inv.get("starter_sequence_rows", ""))
            + to_int(inv.get("starter_fight_rows", ""))
            + to_int(inv.get("starter_probe_rows", ""))
            + to_int(inv.get("starter_detail_rows", ""))
        )
        if starter_total:
            helper_counts["starter-city opening helpers"] += starter_total
            kind_counts["starter_city_opening"] += starter_total
        if to_int(inv.get("execution_addendum_rows", "")):
            helper_counts["execution addendum helpers"] += to_int(inv.get("execution_addendum_rows", ""))
            kind_counts["execution_addendum"] += to_int(inv.get("execution_addendum_rows", ""))
        if to_int(inv.get("lpb_surface_rows", "")):
            helper_counts["LPB method/call surface helpers"] += to_int(inv.get("lpb_surface_rows", ""))
            kind_counts["lpb_method_call_surface"] += to_int(inv.get("lpb_surface_rows", ""))
        if to_int(inv.get("seasonal_item_rows", "")):
            helper_counts["seasonal item helpers"] += to_int(inv.get("seasonal_item_rows", ""))
            kind_counts["seasonal_item_surface"] += to_int(inv.get("seasonal_item_rows", ""))
        cutscene_matrix_total = (
            to_int(inv.get("cutscene_matrix_rows", ""))
            + to_int(inv.get("local_cutscene_delegate_rows", ""))
            + to_int(inv.get("local_delegate_event_caller_rows", ""))
            + to_int(inv.get("cutscene_template_candidate_rows", ""))
            + to_int(inv.get("script_cutscene_gap_rows", ""))
            + to_int(inv.get("scene_bearing_needs_push_rows", ""))
            + to_int(inv.get("after_warp_cutscene_event_rows", ""))
            + to_int(inv.get("blocker_method_focus_rows", ""))
            + to_int(inv.get("route_owner_patch_focus_rows", ""))
        )
        if cutscene_matrix_total:
            helper_counts["cutscene matrix/local delegate helpers"] += cutscene_matrix_total
            kind_counts["cutscene_matrix"] += cutscene_matrix_total
        mutator_reward_total = (
            to_int(inv.get("local_mutator_scan_rows", ""))
            + to_int(inv.get("reward_display_sync_rows", ""))
            + to_int(inv.get("reward_display_dat_patch_rows", ""))
            + to_int(inv.get("reward_display_wiki_rows", ""))
            + to_int(inv.get("addendum_enrichment_rows", ""))
            + to_int(inv.get("addendum_reward_sync_rows", ""))
            + to_int(inv.get("addendum_existing_bnpc_rows", ""))
            + to_int(inv.get("addendum_private_bnpc_rows", ""))
        )
        if mutator_reward_total:
            helper_counts["mutator/reward sync helpers"] += mutator_reward_total
            kind_counts["mutator_reward_sync"] += mutator_reward_total
        sqb_adapter_total = (
            to_int(inv.get("sqb_target_rows", ""))
            + to_int(inv.get("sqb_adapter_rows", ""))
            + to_int(inv.get("fight_sqb_operator_rows", ""))
            + to_int(inv.get("sqb_cutscene_dependency_rows", ""))
            + to_int(inv.get("sqb_reward_locked_rows", ""))
            + to_int(inv.get("fight_actor_mob_spawn_rows", ""))
            + to_int(inv.get("fight_payload_probe_rows", ""))
            + to_int(inv.get("fight_reward_lock_proof_rows", ""))
        )
        if sqb_adapter_total:
            helper_counts["SQB adapter/materialization helpers"] += sqb_adapter_total
            kind_counts["sqb_adapter"] += sqb_adapter_total
        commands = [probe.get("command", "") for probe in ordered_probes if probe.get("command", "")]
        reasons: list[str] = []
        if to_int(inv.get("unique_scene_key_count", "")):
            reasons.append("recovered cutscene/replay rows")
        if kind_counts.get("snpc_delegate_probe", 0):
            reasons.append("SNPC replay/delegate payloads")
        if kind_counts.get("ask_widget_probe", 0):
            reasons.append("ask/widget return handling")
        if kind_counts.get("reward_or_state_audit", 0) or to_int(inv.get("reward_count", "")):
            reasons.append("reward or quest-state review")
        if battles_by_code.get(code):
            reasons.append("battle candidate breadcrumbs")
        if clean(inv.get("local_status", "")) in {"scaffold", "data_or_stub", "present_unknown"}:
            reasons.append("local script is not a full handwritten route")
        if to_int(inv.get("route_owner_rows", "")):
            reasons.append("route-owner inference evidence")
        if proof_rows:
            reasons.append("payload/EventUpdate proof queue")
        if fight_rows:
            reasons.append("fight readiness or reward-lock evidence")
        if to_int(inv.get("blueprint_rows", "")) or to_int(inv.get("sequence_blueprint_rows", "")):
            reasons.append("implementation blueprint row")
        if contract_total:
            reasons.append("cutscene contract/push recipe rows")
        if runtime_unlock_total:
            reasons.append("runtime unlock proof rows")
        if instanced_total:
            reasons.append("instanced owner/runtime rows")
        if starter_total:
            reasons.append("starter-city opening rows")
        if to_int(inv.get("execution_addendum_rows", "")):
            reasons.append("execution addendum rows")
        if to_int(inv.get("lpb_surface_rows", "")):
            reasons.append("LPB method/call surface rows")
        if to_int(inv.get("seasonal_item_rows", "")):
            reasons.append("seasonal item surface rows")
        if cutscene_matrix_total:
            reasons.append("cutscene matrix/local delegate rows")
        if mutator_reward_total:
            reasons.append("mutator or reward-sync rows")
        if sqb_adapter_total:
            reasons.append("SQB adapter/materialization rows")

        rows.append(
            {
                "code": code,
                "quest_id": inv.get("quest_id", ""),
                "quest_name": inv.get("quest_name", ""),
                "category": inv.get("category", ""),
                "local_status": inv.get("local_status", ""),
                "decomp_classification": inv.get("decomp_classification", ""),
                "recommended_helpers": join_unique((name for name, _count in helper_counts.most_common()), limit=12),
                "probe_kinds": join_unique((name for name, _count in kind_counts.most_common()), limit=12),
                "risk_mix": join_unique((f"{name}:{count}" for name, count in risk_counts.most_common()), limit=8),
                "battle_candidate_count": len(battles_by_code.get(code, [])),
                "sample_probe_commands": join_unique(commands[:8], limit=8),
                "reason": "; ".join(reasons),
            }
        )
    rows.sort(key=lambda item: (item["category"], item["code"]))
    return rows


def build_backlog(inventory: list[dict[str, object]]) -> list[dict[str, object]]:
    rows = []
    for row in inventory:
        local_status = str(row.get("local_status", ""))
        if (
            local_status in {"missing", "scaffold", "data_or_stub", "present_unknown"}
            or to_int(row.get("battle_candidate_count", "")) > 0
            or str(row.get("decomp_classification", "")).endswith("_risk")
        ):
            rows.append(
                {
                    "decomp_priority_score": row.get("decomp_priority_score", ""),
                    "code": row.get("code", ""),
                    "quest_id": row.get("quest_id", ""),
                    "quest_name": row.get("quest_name", ""),
                    "category": row.get("category", ""),
                    "local_status": row.get("local_status", ""),
                    "decomp_classification": row.get("decomp_classification", ""),
                    "next_action": row.get("next_action", ""),
                    "scene_keys": row.get("scene_keys", ""),
                    "battle_candidate_count": row.get("battle_candidate_count", ""),
                    "reward_types": row.get("reward_types", ""),
                    "gap_reasons": row.get("gap_reasons", ""),
                }
            )
    rows.sort(key=lambda item: (-to_int(item["decomp_priority_score"]), str(item["category"]), str(item["code"])))
    return rows


def build_family_summary(inventory: list[dict[str, object]]) -> list[dict[str, object]]:
    grouped: dict[tuple[str, str], list[dict[str, object]]] = defaultdict(list)
    for row in inventory:
        grouped[(str(row.get("category", "")), str(row.get("family", "")))].append(row)
    rows: list[dict[str, object]] = []
    for (category, family), values in sorted(grouped.items()):
        statuses = Counter(str(row.get("local_status", "")) for row in values)
        rows.append(
            {
                "category": category,
                "family": family,
                "quest_rows": len(values),
                "local_missing": statuses.get("missing", 0),
                "local_scaffold": statuses.get("scaffold", 0),
                "local_data_or_stub": statuses.get("data_or_stub", 0),
                "local_handwritten": statuses.get("handwritten_event_driver", 0) + statuses.get("handwritten_state_driver", 0),
                "method_rows": sum(to_int(row.get("method_rows", "")) for row in values),
                "scene_quest_rows": sum(1 for row in values if to_int(row.get("unique_scene_key_count", "")) > 0),
                "battle_candidate_rows": sum(1 for row in values if to_int(row.get("battle_candidate_count", "")) > 0),
                "bnpc_objective_rows": sum(to_int(row.get("bnpc_objective_rows", "")) for row in values),
                "spawn_point_rows": sum(to_int(row.get("spawn_point_rows", "")) for row in values),
                "reward_rows": sum(to_int(row.get("reward_count", "")) for row in values),
                "marker_rows": sum(to_int(row.get("marker_count", "")) for row in values),
                "director_rows": sum(to_int(row.get("recovered_director_rows", "")) + to_int(row.get("local_director_rows", "")) for row in values),
                "top_codes": join_unique((row.get("code", "") for row in sorted(values, key=lambda item: -to_int(item.get("decomp_priority_score", "")))[:8])),
            }
        )
    return rows


def build_doc(
    output_dir: Path,
    inventory: list[dict[str, object]],
    family_summary: list[dict[str, object]],
    backlog: list[dict[str, object]],
    scene_index: list[dict[str, object]],
    replay_payload_index: list[dict[str, object]],
    dialogue_text_index: list[dict[str, object]],
    text_sheet_full_index: list[dict[str, object]],
    text_sheet_coverage_index: list[dict[str, object]],
    dat_table_index: list[dict[str, object]],
    dat_journal_index: list[dict[str, object]],
    journal_reference_index: list[dict[str, object]],
    journal_coverage_index: list[dict[str, object]],
    dat_crosscheck_index: list[dict[str, object]],
    dat_cutreplay_index: list[dict[str, object]],
    item_reference_index: list[dict[str, object]],
    reward_index: list[dict[str, object]],
    marker_index: list[dict[str, object]],
    marker_resolution_index: list[dict[str, object]],
    actor_surface_index: list[dict[str, object]],
    actor_resolution_index: list[dict[str, object]],
    marker_actor_coverage_index: list[dict[str, object]],
    server_flow_index: list[dict[str, object]],
    bnpc_objective_index: list[dict[str, object]],
    spawn_point_index: list[dict[str, object]],
    director_index: list[dict[str, object]],
    execution_index: list[dict[str, object]],
    scene_push_index: list[dict[str, object]],
    runtime_probe_index: list[dict[str, object]],
    enablement_index: list[dict[str, object]],
    implementation_roadmap_index: list[dict[str, object]],
    push_operator_index: list[dict[str, object]],
    local_runtime_surface_index: list[dict[str, object]],
    cutscene_argument_index: list[dict[str, object]],
    route_owner_index: list[dict[str, object]],
    payload_proof_index: list[dict[str, object]],
    fight_readiness_index: list[dict[str, object]],
    blueprint_index: list[dict[str, object]],
    cutscene_contract_index: list[dict[str, object]],
    runtime_unlock_index: list[dict[str, object]],
    instanced_owner_index: list[dict[str, object]],
    instanced_runtime_index: list[dict[str, object]],
    starter_city_index: list[dict[str, object]],
    execution_addendum_index: list[dict[str, object]],
    lpb_surface_index: list[dict[str, object]],
    seasonal_item_index: list[dict[str, object]],
    cutscene_matrix_index: list[dict[str, object]],
    mutator_reward_sync_index: list[dict[str, object]],
    sqb_adapter_index: list[dict[str, object]],
    script_signature_index: list[dict[str, object]],
    script_delta_index: list[dict[str, object]],
    auxiliary_csv_hit_index: list[dict[str, object]],
    battle_index: list[dict[str, object]],
    helper_recommendations: list[dict[str, object]],
    probe_commands: list[dict[str, object]],
) -> str:
    dimension_rows = read_csv(Path.cwd() / QUEST_DIMENSION)
    marker_seed_backlog = read_csv(Path.cwd() / QUEST_MARKER_SEED_BACKLOG)
    included_quest_ids = {clean(row.get("quest_id", "")) for row in inventory}
    skipped_en = sum(1 for row in dimension_rows if clean(row.get("quest_id", "")) and clean(row.get("quest_name", "")) == "[en]")
    skipped_no_title = sum(1 for row in dimension_rows if not clean(row.get("quest_id", "")) or not clean(row.get("quest_name", "")))
    skipped_other = max(0, len(dimension_rows) - len(inventory) - skipped_en - skipped_no_title)
    marker_seed_in_scope = sum(1 for row in marker_seed_backlog if clean(row.get("quest_id", "")) in included_quest_ids)
    categories = Counter(str(row.get("category", "")) for row in inventory)
    local_statuses = Counter(str(row.get("local_status", "")) for row in inventory)
    classifications = Counter(str(row.get("decomp_classification", "")) for row in inventory)
    probe_kinds = Counter(str(row.get("probe_kind", "")) for row in probe_commands)
    text_sheet_helpers = Counter(str(row.get("helper_hint", "")) for row in text_sheet_full_index)
    text_sheet_coverage_classes = Counter(str(row.get("coverage_classification", "")) for row in text_sheet_coverage_index)
    dat_table_sources = Counter(str(row.get("source_table", "")) for row in dat_table_index)
    dat_table_helpers = Counter(str(row.get("helper_hint", "")) for row in dat_table_index)
    dat_journal_title_statuses = Counter(str(row.get("title_match_status", "")) for row in dat_journal_index)
    journal_reference_sheets = Counter(str(row.get("sheet_name", "")) for row in journal_reference_index)
    journal_reference_helpers = Counter(str(row.get("helper_hint", "")) for row in journal_reference_index)
    journal_coverage_classes = Counter(str(row.get("coverage_classification", "")) for row in journal_coverage_index)
    dat_crosscheck_statuses = Counter()
    for row in dat_crosscheck_index:
        for status in split_many(row.get("crosscheck_status", "")):
            dat_crosscheck_statuses[status] += 1
    dat_cutreplay_statuses = Counter(str(row.get("match_status", "")) for row in dat_cutreplay_index)
    dat_cutreplay_helpers = Counter(str(row.get("helper_hint", "")) for row in dat_cutreplay_index)
    item_reference_sources = Counter(str(row.get("source", "")) for row in item_reference_index)
    item_reference_helpers = Counter(str(row.get("helper_hint", "")) for row in item_reference_index)
    reward_risks = Counter(str(row.get("duplicate_grant_risk", "")) for row in reward_index)
    actor_confidences = Counter(str(row.get("confidence", "")) for row in actor_surface_index)
    marker_resolution_statuses = Counter()
    for row in marker_resolution_index:
        for status in split_many(row.get("resolution_status", "")):
            marker_resolution_statuses[status] += 1
    marker_resolution_helpers = Counter(str(row.get("helper_hint", "")) for row in marker_resolution_index)
    actor_resolution_statuses = Counter()
    for row in actor_resolution_index:
        for status in split_many(row.get("resolution_status", "")):
            actor_resolution_statuses[status] += 1
    actor_resolution_helpers = Counter(str(row.get("helper_hint", "")) for row in actor_resolution_index)
    marker_actor_coverage_classes = Counter(str(row.get("coverage_classification", "")) for row in marker_actor_coverage_index)
    server_flow_categories = Counter(str(row.get("flow_category", "")) for row in server_flow_index)
    objective_materialization = Counter(str(row.get("materialization_status", "")) for row in bnpc_objective_index)
    spawn_surfaces = Counter(str(row.get("spawn_surface", "")) for row in spawn_point_index)
    director_sources = Counter(str(row.get("source", "")) for row in director_index)
    execution_hints = Counter(str(row.get("helper_hint", "")) for row in execution_index)
    runtime_lanes = Counter(str(row.get("lane", "")) for row in runtime_probe_index)
    enablement_classes = Counter(str(row.get("safety_class", "")) for row in enablement_index)
    push_risks = Counter(str(row.get("risk_class", "")) for row in push_operator_index)
    roadmap_lanes = Counter(str(row.get("lane", "")) for row in implementation_roadmap_index)
    local_runtime_sources = Counter(str(row.get("source", "")) for row in local_runtime_surface_index)
    argument_shapes = Counter(str(row.get("argument_shape", "")) for row in cutscene_argument_index)
    route_owner_statuses = Counter(str(row.get("route_owner_resolution_status", "")) for row in route_owner_index)
    payload_sources = Counter(str(row.get("source", "")) for row in payload_proof_index)
    payload_statuses = Counter(str(row.get("lane_or_status", "")) for row in payload_proof_index)
    fight_sources = Counter(str(row.get("source", "")) for row in fight_readiness_index)
    blueprint_lanes = Counter(str(first_value(row.get("blueprint_lane", ""), row.get("blocker_type", ""))) for row in blueprint_index)
    cutscene_contract_sources = Counter(str(row.get("source", "")) for row in cutscene_contract_index)
    runtime_unlock_sources = Counter(str(row.get("source", "")) for row in runtime_unlock_index)
    instanced_owner_sources = Counter(str(row.get("source", "")) for row in instanced_owner_index)
    instanced_runtime_sources = Counter(str(row.get("source", "")) for row in instanced_runtime_index)
    starter_city_sources = Counter(str(row.get("source", "")) for row in starter_city_index)
    execution_addendum_sources = Counter(str(row.get("source", "")) for row in execution_addendum_index)
    lpb_surface_sources_counter = Counter(str(row.get("source", "")) for row in lpb_surface_index)
    seasonal_item_sources = Counter(str(row.get("source", "")) for row in seasonal_item_index)
    cutscene_matrix_sources = Counter(str(row.get("source", "")) for row in cutscene_matrix_index)
    mutator_reward_sources = Counter(str(row.get("source", "")) for row in mutator_reward_sync_index)
    sqb_adapter_sources = Counter(str(row.get("source", "")) for row in sqb_adapter_index)
    script_signature_sources = Counter(str(row.get("source", "")) for row in script_signature_index)
    script_signature_helpers = Counter(str(row.get("helper_hint", "")) for row in script_signature_index)
    script_delta_classes = Counter(str(row.get("delta_classification", "")) for row in script_delta_index)
    auxiliary_helpers = Counter(str(row.get("helper_hint", "")) for row in auxiliary_csv_hit_index)
    auxiliary_families = Counter(str(row.get("source_family", "")) for row in auxiliary_csv_hit_index)

    lines: list[str] = []
    lines.append("# All Normal Quest Decomp Pack")
    lines.append("")
    lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("")
    lines.append("## Scope")
    lines.append("")
    lines.append(f"- Included quest-code rows: {len(inventory)}")
    lines.append("- Filter: quest id present, real title present, title is not `[en]`.")
    lines.append("- Seasonal quests are included.")
    lines.append(f"- Output folder: `{output_dir}`")
    lines.append("")
    lines.append("This is a data-only decomp pass. It does not enable quests, add spawns, grant rewards, or mutate local quest routes.")
    lines.append("")
    lines.append("## Output Files")
    lines.append("")
    lines.append("- `quest_decomp_inventory.csv`: one row per included quest code.")
    lines.append("- `quest_method_index.csv`: one row per recovered method, joined to current quest/local status.")
    lines.append("- `quest_scene_index.csv`: recovered scene launchers and replay rows by quest scene.")
    lines.append("- `quest_replay_payload_index.csv`: corrected replay slot and payload helper hints.")
    lines.append("- `quest_dialogue_text_index.csv`: joined recovered event text rows and localized text.")
    lines.append("- `quest_text_sheet_full_index.csv`: full dat-mining quest text sheets, marked by recovered event usage.")
    lines.append("- `quest_text_sheet_coverage_index.csv`: per-quest text-sheet coverage and unreferenced text rollup.")
    lines.append("- `quest_dat_table_index.csv`: raw Dat Mining quest table rows joined by quest id and quest-id prefixes.")
    lines.append("- `quest_dat_journal_index.csv`: compact `xtx_quest` title, branch, sheet-ref, and item-ref metadata.")
    lines.append("- `quest_journal_reference_index.csv`: resolved journal objective refs into `xtx_journalxtx*` localized text rows.")
    lines.append("- `quest_journal_coverage_index.csv`: per-quest journal branch/text coverage rollup.")
    lines.append("- `quest_reward_index.csv`: reward rows with auto-grant and duplicate-grant review hints.")
    lines.append("- `quest_marker_index.csv`: map/quest marker rows by slot with sequence-helper hints.")
    lines.append("- `quest_marker_resolution_index.csv`: marker rows resolved to display names, map place hints, and actor-class candidates.")
    lines.append("- `quest_dat_crosscheck_index.csv`: raw-vs-normalized marker/reward/replay/title parity by quest.")
    lines.append("- `quest_dat_cutreplay_index.csv`: raw cutReplay payloads joined to localized replay titles and recovered rows.")
    lines.append("- `quest_item_reference_index.csv`: reward and text item references resolved through Dat Mining item sheets.")
    lines.append("- `quest_actor_surface_index.csv`: ENpc/BNpc actor surfaces and flag/gap hints.")
    lines.append("- `quest_actor_resolution_index.csv`: actor surfaces joined to SQL class, localized display, appearance, and spawn evidence.")
    lines.append("- `quest_marker_actor_coverage_index.csv`: per-quest marker/actor resolution coverage and helper classification.")
    lines.append("- `quest_server_flow_index.csv`: local server quest calls filtered to included quest codes.")
    lines.append("- `quest_bnpc_objective_index.csv`: normalized BNPC objective constants, item/count objectives, and materialization status.")
    lines.append("- `quest_spawn_point_index.csv`: recovered/normalized quest spawn point positions.")
    lines.append("- `quest_director_index.csv`: recovered and local quest director rows joined to included quest codes.")
    lines.append("- `quest_execution_index.csv`: execution summary rows by quest code.")
    lines.append("- `quest_scene_push_index.csv`: recovered scene-bearing event methods and push recipes.")
    lines.append("- `quest_runtime_probe_index.csv`: runtime probe workqueue rows for cutscene/fight proof.")
    lines.append("- `quest_enablement_index.csv`: safe enablement and safe-push queue status by quest.")
    lines.append("- `quest_implementation_roadmap_index.csv`: implementation roadmap rows filtered to included quests.")
    lines.append("- `quest_push_operator_index.csv`: push operator and dependency bundle rows.")
    lines.append("- `quest_local_runtime_surface_index.csv`: local constants, ENpc bindings, delegate push calls, and lifecycle actions.")
    lines.append("- `quest_cutscene_argument_index.csv`: cutscene/after-warp argument requirements and runtime payload hints.")
    lines.append("- `quest_route_owner_index.csv`: inferred route-owner actors, sequences, and confidence evidence.")
    lines.append("- `quest_payload_proof_index.csv`: owner-bound payload, EventUpdate tuple, after-warp, and blocked-owner proof queues.")
    lines.append("- `quest_fight_readiness_index.csv`: fight readiness, kill-route, return-flow, and reward-lock joins.")
    lines.append("- `quest_blueprint_index.csv`: implementation blueprint and retail sequence-spine workqueue rows.")
    lines.append("- `quest_cutscene_contract_index.csv`: push contracts, recipes, owner probes, and method probe recipes.")
    lines.append("- `quest_runtime_unlock_index.csv`: next-runtime-unlock triage, proof queues, and safe smoke targets.")
    lines.append("- `quest_instanced_owner_index.csv`: instanced event owner, sequence, and text-clue matrices.")
    lines.append("- `quest_instanced_runtime_index.csv`: instanced lifecycle, payload, return-state, SQB, and probe addenda.")
    lines.append("- `quest_starter_city_index.csv`: starter-city opening quest client/server/fight detail.")
    lines.append("- `quest_execution_addendum_index.csv`: extra execution, scaffold, payload, after-warp, content, and probe queues.")
    lines.append("- `quest_lpb_surface_index.csv`: LPB method, bridge-call, event protocol, side-world, seasonal, SQB, and scaffold surfaces.")
    lines.append("- `quest_seasonal_item_index.csv`: seasonal quest item surfaces and item-atlas joins.")
    lines.append("- `quest_cutscene_matrix_index.csv`: local delegate inventories and recovered cutscene push/gap matrices.")
    lines.append("- `quest_mutator_reward_sync_index.csv`: direct mutator scans, reward display sync, and addendum enrichment queues.")
    lines.append("- `quest_sqb_adapter_index.csv`: SQB adapter, fight materialization, and reward-lock proof rows.")
    lines.append("- `quest_script_signature_index.csv`: local/recovered Lua script signatures, function spans, calls, scenes, and helper hints.")
    lines.append("- `quest_script_delta_index.csv`: per-quest local-vs-recovered Lua comparison and replacement helper hint.")
    lines.append("- `quest_auxiliary_csv_hit_index.csv`: remaining quest-code hits from unconfigured CSV exports, with row snapshots.")
    lines.append("- `quest_battle_candidate_index.csv`: BNPC/objective candidates and SQL quest-title battle breadcrumbs.")
    lines.append("- `quest_probe_commands.csv`: static probe-command hints by recovered method.")
    lines.append("- `quest_helper_recommendations.csv`: per-quest helper families and sample probe commands.")
    lines.append("- `quest_family_summary.csv`: category/family rollup.")
    lines.append("- `implementation_backlog.csv`: sorted follow-up candidates.")
    lines.append("")
    lines.append("## Category Counts")
    lines.append("")
    for category, count in sorted(categories.items()):
        lines.append(f"- `{category}`: {count}")
    lines.append("")
    lines.append("## Local Status Counts")
    lines.append("")
    for status, count in sorted(local_statuses.items()):
        lines.append(f"- `{status}`: {count}")
    lines.append("")
    lines.append("## Classification Counts")
    lines.append("")
    for classification, count in sorted(classifications.items()):
        lines.append(f"- `{classification}`: {count}")
    lines.append("")
    lines.append("## High Priority Backlog")
    lines.append("")
    lines.append("| Score | Code | Quest | Category | Local | Classification | Next Action |")
    lines.append("| ---: | --- | --- | --- | --- | --- | --- |")
    for row in backlog[:25]:
        lines.append(
            "| {score} | `{code}` | {quest} | {category} | {local} | {classification} | {action} |".format(
                score=row.get("decomp_priority_score", ""),
                code=row.get("code", ""),
                quest=clean(row.get("quest_name", "")),
                category=row.get("category", ""),
                local=row.get("local_status", ""),
                classification=row.get("decomp_classification", ""),
                action=clean(row.get("next_action", "")),
            )
        )
    lines.append("")
    lines.append("## Dat Mining Layers")
    lines.append("")
    lines.append(f"- Raw Dat table rows: {len(dat_table_index)}")
    lines.append(f"- Dat journal rows: {len(dat_journal_index)}")
    lines.append(f"- Journal reference rows: {len(journal_reference_index)}")
    lines.append(f"- Journal coverage rows: {len(journal_coverage_index)}")
    lines.append(f"- Dat crosscheck rows: {len(dat_crosscheck_index)}")
    lines.append(f"- Dat cutReplay rows: {len(dat_cutreplay_index)}")
    lines.append(f"- Item reference rows: {len(item_reference_index)}")
    for source, count in sorted(dat_table_sources.items()):
        lines.append(f"- Raw Dat table `{source}`: {count}")
    for helper, count in sorted(dat_table_helpers.items()):
        lines.append(f"- Raw Dat helper `{helper}`: {count}")
    for status, count in sorted(dat_journal_title_statuses.items()):
        lines.append(f"- Dat journal title `{status}`: {count}")
    for sheet, count in sorted(journal_reference_sheets.items()):
        lines.append(f"- Journal reference sheet `{sheet}`: {count}")
    for helper, count in sorted(journal_reference_helpers.items()):
        lines.append(f"- Journal reference helper `{helper}`: {count}")
    for classification, count in sorted(journal_coverage_classes.items()):
        lines.append(f"- Journal coverage `{classification}`: {count}")
    for status, count in sorted(dat_crosscheck_statuses.items()):
        lines.append(f"- Dat crosscheck `{status}`: {count}")
    for status, count in sorted(dat_cutreplay_statuses.items()):
        lines.append(f"- Dat cutReplay `{status}`: {count}")
    for helper, count in sorted(dat_cutreplay_helpers.items()):
        lines.append(f"- Dat cutReplay helper `{helper}`: {count}")
    for source, count in sorted(item_reference_sources.items()):
        lines.append(f"- Item reference source `{source}`: {count}")
    for helper, count in sorted(item_reference_helpers.items()):
        lines.append(f"- Item reference helper `{helper}`: {count}")
    dat_title_reviews = [row for row in dat_journal_index if clean(row.get("title_match_status", "")) in {"mismatch", "case_only"}]
    if dat_title_reviews:
        lines.append("")
        lines.append("Dat title review samples:")
        for row in dat_title_reviews[:10]:
            lines.append(f"- `{row.get('code', '')}` {row.get('quest_name', '')}: {row.get('title_mismatch_note', '')}")
    lines.append("")
    lines.append("## Marker/Reward/Actor/Flow Layers")
    lines.append("")
    lines.append(f"- Reward rows: {len(reward_index)}")
    lines.append(f"- Marker rows: {len(marker_index)}")
    lines.append(f"- Marker resolution rows: {len(marker_resolution_index)}")
    lines.append(f"- Actor surface rows: {len(actor_surface_index)}")
    lines.append(f"- Actor resolution rows: {len(actor_resolution_index)}")
    lines.append(f"- Marker/actor coverage rows: {len(marker_actor_coverage_index)}")
    lines.append(f"- Server flow call rows: {len(server_flow_index)}")
    lines.append(f"- BNPC objective rows: {len(bnpc_objective_index)}")
    lines.append(f"- Spawn point rows: {len(spawn_point_index)}")
    lines.append(f"- Quest director rows: {len(director_index)}")
    for risk, count in sorted(reward_risks.items()):
        lines.append(f"- Reward duplicate-grant risk `{risk}`: {count}")
    for confidence, count in sorted(actor_confidences.items()):
        lines.append(f"- Actor surface confidence `{confidence}`: {count}")
    for status, count in sorted(marker_resolution_statuses.items()):
        lines.append(f"- Marker resolution `{status}`: {count}")
    for helper, count in sorted(marker_resolution_helpers.items()):
        lines.append(f"- Marker resolution helper `{helper}`: {count}")
    for status, count in sorted(actor_resolution_statuses.items()):
        lines.append(f"- Actor resolution `{status}`: {count}")
    for helper, count in sorted(actor_resolution_helpers.items()):
        lines.append(f"- Actor resolution helper `{helper}`: {count}")
    for classification, count in sorted(marker_actor_coverage_classes.items()):
        lines.append(f"- Marker/actor coverage `{classification}`: {count}")
    for flow_category, count in sorted(server_flow_categories.items()):
        lines.append(f"- Server flow `{flow_category}`: {count}")
    for materialization, count in sorted(objective_materialization.items()):
        lines.append(f"- Objective materialization `{materialization}`: {count}")
    for surface, count in sorted(spawn_surfaces.items()):
        lines.append(f"- Spawn surface `{surface}`: {count}")
    for source, count in sorted(director_sources.items()):
        lines.append(f"- Director source `{source}`: {count}")
    lines.append("")
    lines.append("## Execution/Probe/Enablement Layers")
    lines.append("")
    lines.append(f"- Execution summary rows: {len(execution_index)}")
    lines.append(f"- Scene push rows: {len(scene_push_index)}")
    lines.append(f"- Runtime probe rows: {len(runtime_probe_index)}")
    lines.append(f"- Enablement rows: {len(enablement_index)}")
    lines.append(f"- Implementation roadmap rows: {len(implementation_roadmap_index)}")
    lines.append(f"- Push operator/dependency rows: {len(push_operator_index)}")
    lines.append(f"- Execution addendum rows: {len(execution_addendum_index)}")
    lines.append(f"- LPB surface rows: {len(lpb_surface_index)}")
    for hint, count in sorted(execution_hints.items()):
        lines.append(f"- Execution hint `{hint}`: {count}")
    for lane, count in sorted(runtime_lanes.items()):
        lines.append(f"- Runtime lane `{lane}`: {count}")
    for safety_class, count in sorted(enablement_classes.items()):
        lines.append(f"- Enablement safety `{safety_class}`: {count}")
    for risk, count in sorted(push_risks.items()):
        lines.append(f"- Push risk `{risk}`: {count}")
    for lane, count in sorted(roadmap_lanes.items()):
        lines.append(f"- Roadmap lane `{lane}`: {count}")
    for source, count in sorted(execution_addendum_sources.items()):
        lines.append(f"- Execution addendum source `{source}`: {count}")
    for source, count in sorted(lpb_surface_sources_counter.items()):
        lines.append(f"- LPB surface source `{source}`: {count}")
    lines.append("")
    lines.append("## Runtime Deep/Proof/Blueprint Layers")
    lines.append("")
    lines.append(f"- Local runtime surface rows: {len(local_runtime_surface_index)}")
    lines.append(f"- Cutscene argument rows: {len(cutscene_argument_index)}")
    lines.append(f"- Route owner inference rows: {len(route_owner_index)}")
    lines.append(f"- Payload/proof queue rows: {len(payload_proof_index)}")
    lines.append(f"- Fight readiness/proof rows: {len(fight_readiness_index)}")
    lines.append(f"- Blueprint rows: {len(blueprint_index)}")
    for source, count in sorted(local_runtime_sources.items()):
        lines.append(f"- Local runtime source `{source}`: {count}")
    for shape, count in sorted(argument_shapes.items()):
        lines.append(f"- Cutscene argument shape `{shape}`: {count}")
    for status, count in sorted(route_owner_statuses.items()):
        lines.append(f"- Route owner status `{status}`: {count}")
    for source, count in sorted(payload_sources.items()):
        lines.append(f"- Payload proof source `{source}`: {count}")
    for status, count in sorted(payload_statuses.items()):
        lines.append(f"- Payload/proof status `{status}`: {count}")
    for source, count in sorted(fight_sources.items()):
        lines.append(f"- Fight proof source `{source}`: {count}")
    for lane, count in sorted(blueprint_lanes.items()):
        lines.append(f"- Blueprint lane/blocker `{lane}`: {count}")
    lines.append("")
    lines.append("## Contract/Unlock/Instanced Layers")
    lines.append("")
    lines.append(f"- Cutscene contract rows: {len(cutscene_contract_index)}")
    lines.append(f"- Runtime unlock rows: {len(runtime_unlock_index)}")
    lines.append(f"- Instanced owner/text rows: {len(instanced_owner_index)}")
    lines.append(f"- Instanced runtime addendum rows: {len(instanced_runtime_index)}")
    lines.append(f"- Starter-city rows: {len(starter_city_index)}")
    lines.append(f"- Seasonal item rows: {len(seasonal_item_index)}")
    for source, count in sorted(cutscene_contract_sources.items()):
        lines.append(f"- Cutscene contract source `{source}`: {count}")
    for source, count in sorted(runtime_unlock_sources.items()):
        lines.append(f"- Runtime unlock source `{source}`: {count}")
    for source, count in sorted(instanced_owner_sources.items()):
        lines.append(f"- Instanced owner source `{source}`: {count}")
    for source, count in sorted(instanced_runtime_sources.items()):
        lines.append(f"- Instanced runtime source `{source}`: {count}")
    for source, count in sorted(starter_city_sources.items()):
        lines.append(f"- Starter-city source `{source}`: {count}")
    for source, count in sorted(seasonal_item_sources.items()):
        lines.append(f"- Seasonal item source `{source}`: {count}")
    lines.append("")
    lines.append("## Matrix/Risk/SQB Layers")
    lines.append("")
    lines.append(f"- Cutscene matrix rows: {len(cutscene_matrix_index)}")
    lines.append(f"- Mutator/reward sync rows: {len(mutator_reward_sync_index)}")
    lines.append(f"- SQB adapter rows: {len(sqb_adapter_index)}")
    lines.append(f"- Lua script signature rows: {len(script_signature_index)}")
    lines.append(f"- Lua script delta rows: {len(script_delta_index)}")
    lines.append(f"- Auxiliary CSV hit rows: {len(auxiliary_csv_hit_index)}")
    for source, count in sorted(cutscene_matrix_sources.items()):
        lines.append(f"- Cutscene matrix source `{source}`: {count}")
    for source, count in sorted(mutator_reward_sources.items()):
        lines.append(f"- Mutator/reward source `{source}`: {count}")
    for source, count in sorted(sqb_adapter_sources.items()):
        lines.append(f"- SQB adapter source `{source}`: {count}")
    for source, count in sorted(script_signature_sources.items()):
        lines.append(f"- Lua signature source `{source}`: {count}")
    for helper, count in sorted(script_signature_helpers.items()):
        lines.append(f"- Lua signature helper `{helper}`: {count}")
    for classification, count in sorted(script_delta_classes.items()):
        lines.append(f"- Lua delta `{classification}`: {count}")
    for helper, count in sorted(auxiliary_helpers.items()):
        lines.append(f"- Auxiliary CSV helper `{helper}`: {count}")
    for family, count in sorted(auxiliary_families.items()):
        lines.append(f"- Auxiliary CSV source family `{family}`: {count}")
    lines.append("")
    lines.append("## Battle Breadcrumbs")
    lines.append("")
    lines.append(f"- Battle candidate rows: {len(battle_index)}")
    for row in battle_index[:20]:
        lines.append(
            f"- `{row.get('code', '')}` {row.get('quest_name', '')}: {row.get('display_key', '')} "
            f"actor `{row.get('actor_class_id', '')}` status `{row.get('status', '')}`"
        )
    lines.append("")
    lines.append("## Scene Coverage")
    lines.append("")
    lines.append(f"- Scene index rows: {len(scene_index)}")
    lines.append(f"- Replay payload rows: {len(replay_payload_index)}")
    lines.append(f"- Dialogue/text rows: {len(dialogue_text_index)}")
    lines.append(f"- Full quest text-sheet rows: {len(text_sheet_full_index)}")
    lines.append(f"- Quest text-sheet coverage rows: {len(text_sheet_coverage_index)}")
    scene_quests = {row.get("code", "") for row in scene_index}
    lines.append(f"- Quests with recovered scene/replay rows: {len(scene_quests)}")
    replay_shapes = Counter(str(row.get("payload_shape", "")) for row in replay_payload_index)
    for shape, count in sorted(replay_shapes.items()):
        lines.append(f"- Replay `{shape}`: {count}")
    for helper, count in sorted(text_sheet_helpers.items()):
        lines.append(f"- Text-sheet helper `{helper}`: {count}")
    for classification, count in sorted(text_sheet_coverage_classes.items()):
        lines.append(f"- Text-sheet coverage `{classification}`: {count}")
    lines.append("")
    lines.append("## Probe And Helper Layer")
    lines.append("")
    lines.append(f"- Probe command hint rows: {len(probe_commands)}")
    lines.append(f"- Helper recommendation rows: {len(helper_recommendations)}")
    lines.append("")
    for probe_kind, count in sorted(probe_kinds.items()):
        lines.append(f"- `{probe_kind}`: {count}")
    lines.append("")
    lines.append("Top helper recommendation samples:")
    lines.append("")
    lines.append("| Code | Quest | Helpers | Sample Commands |")
    lines.append("| --- | --- | --- | --- |")
    for row in helper_recommendations[:12]:
        lines.append(
            f"| `{row.get('code', '')}` | {clean(row.get('quest_name', ''))} | "
            f"{clean(row.get('recommended_helpers', ''))} | {clean(row.get('sample_probe_commands', ''))} |"
        )
    lines.append("")
    lines.append("## Family Summary")
    lines.append("")
    lines.append("| Category | Family | Quests | Missing | Scaffold | Stub | Handwritten | Scene Quests | Battle Rows | Objective Rows | Spawn Points | Director Rows |")
    lines.append("| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |")
    for row in family_summary:
        lines.append(
            f"| {row.get('category', '')} | `{row.get('family', '')}` | {row.get('quest_rows', '')} | "
            f"{row.get('local_missing', '')} | {row.get('local_scaffold', '')} | "
            f"{row.get('local_data_or_stub', '')} | {row.get('local_handwritten', '')} | "
            f"{row.get('scene_quest_rows', '')} | {row.get('battle_candidate_rows', '')} | "
            f"{row.get('bnpc_objective_rows', '')} | {row.get('spawn_point_rows', '')} | {row.get('director_rows', '')} |"
        )
    lines.append("")
    lines.append("## Notes")
    lines.append("")
    lines.append("- SQL battle-note matches are breadcrumbs only. They do not prove spawn trigger, director ownership, win condition, or cleanup.")
    lines.append("- Probe commands are static hints. Confirm payload shape and return values before adding live quest logic.")
    lines.append("- `quest_replay_payload_index.csv` uses corrected SNPC replay slot hints: `-201` nickname, `-202` raw skin, `-203` personality, `-204` coordinate, `-205` initial town.")
    lines.append("- Full text-sheet rows include unreferenced localized strings; treat those as branch/static text evidence, not proof of live route order.")
    lines.append("- Raw Dat Mining rows preserve numbered fields as evidence; decoded names are limited to high-confidence title, branch, item, marker, reward, and replay joins.")
    lines.append("- Journal reference rows resolve `xtx_quest` formulas into `xtx_journalxtx*` rows; branch-state ordering is inferred from nearby `$E8(1)` conditions.")
    lines.append("- Dat cutReplay rows compare raw replay payload/title rows with recovered replay rows; raw-only rows are recovery leads, not automatic enablement.")
    lines.append("- Dat crosscheck deltas flag mismatched data surfaces; they are review targets, not automatic script or SQL edits.")
    lines.append("- Item references resolve `xtx/itemName` and reward ids through Dat Mining item sheets; missing lookups need manual confirmation before use.")
    lines.append("- Reward rows are evidence for UI/auto-grant review, not permission to duplicate grants in Lua.")
    lines.append("- Marker and actor-surface rows are evidence for sequence/NPC setup; confirm live route ownership before enabling.")
    lines.append("- Marker/actor resolution rows join display names, map places, actor class candidates, appearances, and spawn samples; those joins are implementation clues, not ownership proof.")
    lines.append("- Server flow calls are filtered to included quest codes and exclude shared template rows.")
    lines.append("- BNPC objective and spawn point rows are implementation breadcrumbs; verify callbacks, lifetime, and cleanup before materialization.")
    lines.append("- Execution, probe, enablement, roadmap, and push-operator rows are planning evidence only; this pack does not change offerability gates.")
    lines.append("- Runtime deep/proof/blueprint rows are evidence and work queues only; they still require live payload/owner proof before patching quest behavior.")
    lines.append("- Contract, unlock, instanced, starter-city, and seasonal item rows are additional decomp evidence; they do not imply safe quest enablement by themselves.")
    lines.append("- Matrix, mutator/reward sync, and SQB adapter rows are audit/proof evidence; review live callbacks and reward locks before script or SQL changes.")
    lines.append("- Lua script signature and delta rows are static parse evidence only; confirm route order and event callback ownership before replacing local wrappers.")
    lines.append("- Auxiliary CSV hit rows are source-preservation evidence from raw exports; dedupe against named indices before implementing.")
    lines.append(f"- Normalized marker seed backlog rows outside this real-title scope: {len(marker_seed_backlog) - marker_seed_in_scope}.")
    lines.append("- Recovered method order is file order from the decompiled Lua, not guaranteed route order.")
    lines.append(f"- Raw quest dimension rows: {len(dimension_rows)}")
    lines.append(f"- Skipped `[en]` placeholder rows: {skipped_en}")
    lines.append(f"- Skipped rows with no quest id/title: {skipped_no_title}")
    lines.append(f"- Other skipped rows: {skipped_other}")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    root = Path.cwd()
    inputs = Inputs(root=root, output=args.output, doc=args.doc)
    output_dir = inputs.path(args.output)
    doc_path = inputs.path(args.doc)

    inventory, inventory_by_code = build_inventory(inputs)
    method_index = build_method_index(inputs, inventory_by_code)
    scene_index = build_scene_index(inputs, inventory_by_code)
    replay_payload_index = build_replay_payload_index(inputs, inventory_by_code)
    dialogue_text_index = build_dialogue_text_index(inputs, inventory_by_code)
    text_sheet_full_index = build_text_sheet_full_index(inputs, inventory_by_code)
    text_sheet_coverage_index = build_text_sheet_coverage_index(text_sheet_full_index)
    dat_table_index = build_dat_table_index(inputs, inventory_by_code)
    dat_journal_index = build_dat_journal_index(inputs, inventory_by_code)
    journal_reference_index = build_journal_reference_index(inputs, inventory_by_code)
    journal_coverage_index = build_journal_coverage_index(inventory, journal_reference_index)
    reward_index = build_reward_index(inputs, inventory_by_code)
    marker_index = build_marker_index(inputs, inventory_by_code)
    marker_resolution_index = build_marker_resolution_index(inputs, marker_index)
    dat_crosscheck_index = build_dat_crosscheck_index(inventory, dat_table_index, dat_journal_index, marker_index, reward_index, replay_payload_index)
    dat_cutreplay_index = build_dat_cutreplay_index(inputs, inventory_by_code, replay_payload_index)
    item_reference_index = build_item_reference_index(inputs, reward_index, text_sheet_full_index, dat_journal_index, journal_reference_index)
    actor_surface_index = build_actor_surface_index(inputs, inventory_by_code)
    actor_resolution_index = build_actor_resolution_index(inputs, actor_surface_index)
    marker_actor_coverage_index = build_marker_actor_coverage_index(inventory, marker_resolution_index, actor_resolution_index)
    server_flow_index = build_server_flow_index(inputs, inventory_by_code)
    bnpc_objective_index = build_bnpc_objective_index(inputs, inventory_by_code)
    spawn_point_index = build_spawn_point_index(inputs, inventory_by_code)
    director_index = build_director_index(inputs, inventory_by_code)
    execution_index = build_execution_index(inputs, inventory_by_code)
    scene_push_index = build_scene_push_index(inputs, inventory_by_code)
    runtime_probe_index = build_runtime_probe_index(inputs, inventory_by_code)
    enablement_index = build_enablement_index(inputs, inventory)
    implementation_roadmap_index = build_implementation_roadmap_index(inputs, inventory_by_code)
    push_operator_index = build_push_operator_index(inputs, inventory_by_code)
    local_runtime_surface_index = build_local_runtime_surface_index(inputs, inventory_by_code)
    cutscene_argument_index = build_cutscene_argument_index(inputs, inventory_by_code)
    route_owner_index = build_route_owner_index(inputs, inventory_by_code)
    payload_proof_index = build_payload_proof_index(inputs, inventory_by_code)
    fight_readiness_index = build_fight_readiness_index(inputs, inventory_by_code)
    blueprint_index = build_blueprint_index(inputs, inventory_by_code)
    cutscene_contract_index = build_cutscene_contract_index(inputs, inventory_by_code)
    runtime_unlock_index = build_runtime_unlock_index(inputs, inventory_by_code)
    instanced_owner_index = build_instanced_owner_index(inputs, inventory_by_code)
    instanced_runtime_index = build_instanced_runtime_index(inputs, inventory_by_code)
    starter_city_index = build_starter_city_index(inputs, inventory_by_code)
    execution_addendum_index = build_execution_addendum_index(inputs, inventory_by_code)
    lpb_surface_index = build_lpb_surface_index(inputs, inventory_by_code)
    seasonal_item_index = build_seasonal_item_index(inputs, inventory_by_code)
    cutscene_matrix_index = build_cutscene_matrix_index(inputs, inventory_by_code)
    mutator_reward_sync_index = build_mutator_reward_sync_index(inputs, inventory_by_code)
    sqb_adapter_index = build_sqb_adapter_index(inputs, inventory_by_code)
    script_signature_index = build_script_signature_index(inputs, inventory_by_code)
    script_delta_index = build_script_delta_index(inventory, script_signature_index)
    auxiliary_csv_hit_index = build_auxiliary_csv_hit_index(inputs, inventory_by_code)
    battle_index = build_battle_index(inputs, inventory_by_code)
    probe_commands = build_probe_commands(method_index, scene_index)
    helper_recommendations = build_helper_recommendations(inventory, probe_commands, battle_index)
    family_summary = build_family_summary(inventory)
    backlog = build_backlog(inventory)

    inventory_fields = [
        "decomp_priority_score",
        "code",
        "quest_id",
        "quest_name",
        "class_name",
        "category",
        "family",
        "min_level",
        "prerequisite",
        "parity_status",
        "local_status",
        "local_line_count",
        "local_flags",
        "local_script_path",
        "recovered_script_path",
        "recovered_line_count",
        "method_rows",
        "method_call_rows",
        "after_warp_methods",
        "methods_with_cutscene_ids",
        "methods_with_asks",
        "methods_with_mutations",
        "recovered_features",
        "local_features",
        "unique_scene_key_count",
        "scene_launcher_rows",
        "scene_keys",
        "fade_modes",
        "replay_row_count",
        "replay_ids",
        "replay_payload_shapes",
        "replay_placeholders",
        "event_call_rows",
        "dialogue_say_rows",
        "dialogue_ask_rows",
        "npc_linkshell_rows",
        "reward_widget_rows",
        "quest_offer_widget_rows",
        "content_join_prompt_rows",
        "widgets",
        "joined_text_rows",
        "text_refs",
        "english_samples",
        "server_flow_rows",
        "complete_quest_rows",
        "accept_quest_rows",
        "delegate_rows",
        "run_event_rows",
        "event_warp_rows",
        "reward_or_inventory_rows",
        "top_server_calls",
        "marker_count",
        "marker_ids",
        "reward_count",
        "reward_types",
        "reward_sources",
        "actor_surface_rows",
        "actor_class_ids",
        "actor_surface_gaps",
        "bnpc_objective_rows",
        "bnpc_objective_constants",
        "bnpc_objective_materialization_statuses",
        "spawn_point_rows",
        "spawn_point_zones",
        "spawn_point_surfaces",
        "bnpc_spawn_rows",
        "bnpc_actor_class_ids",
        "bnpc_statuses",
        "bnpc_materialization_rows",
        "sql_battle_note_rows",
        "sql_battle_notes",
        "battle_candidate_count",
        "execution_summary_rows",
        "execution_priority_reason",
        "scene_push_rows",
        "scene_push_risk_notes",
        "runtime_probe_rows",
        "runtime_probe_lanes",
        "cutscene_runtime_probe_rows",
        "fight_runtime_probe_rows",
        "enablement_safety_class",
        "enablement_action",
        "safe_push_class",
        "safe_push_action",
        "roadmap_rows",
        "roadmap_lanes",
        "push_operator_rows",
        "push_operator_lanes",
        "push_dependency_rows",
        "push_next_step",
        "local_constant_rows",
        "local_constants",
        "local_delegate_push_rows",
        "local_delegate_push_methods",
        "local_enpc_binding_rows",
        "unmatched_delegate_rows",
        "local_lifecycle_rows",
        "local_lifecycle_actions",
        "cutscene_argument_rows",
        "cutscene_argument_shapes",
        "route_owner_rows",
        "route_owner_statuses",
        "payload_atlas_rows",
        "payload_statuses",
        "payload_probe_rows",
        "eventupdate_proof_rows",
        "after_warp_proof_rows",
        "blocked_owner_rows",
        "fight_readiness_rows",
        "fight_readiness_gaps",
        "fight_return_reward_rows",
        "fight_reward_lock_statuses",
        "fight_kill_route_rows",
        "fight_kill_route_statuses",
        "blueprint_rows",
        "blueprint_lanes",
        "sequence_blueprint_rows",
        "sequence_blueprint_blockers",
        "cutscene_contract_rows",
        "cutscene_contract_classes",
        "scaffold_contract_rows",
        "safe_patch_contract_rows",
        "snpc_contract_rows",
        "manual_contract_rows",
        "director_notice_rows",
        "push_recipe_rows",
        "push_impl_rows",
        "owner_probe_rows",
        "owner_probe_waves",
        "method_probe_recipe_rows",
        "runtime_unlock_triage_rows",
        "runtime_unlock_scaffold_rows",
        "runtime_unlock_exact_hazard_rows",
        "runtime_unlock_snpc_a8_rows",
        "runtime_unlock_sqb_private_rows",
        "runtime_unlock_world_bnpc_rows",
        "runtime_unlock_requested_proof_rows",
        "runtime_unlock_wave2_rows",
        "runtime_unlock_safe_smoke_rows",
        "runtime_unlock_extra_rows",
        "runtime_unlock_extra_sources",
        "instance_local_sequence_rows",
        "instance_event_method_rows",
        "instance_owner_scene_rows",
        "instance_owner_hint_rows",
        "instance_method_text_rows",
        "instance_text_clue_rows",
        "instance_runtime_rows",
        "instance_runtime_sources",
        "starter_signal_rows",
        "starter_method_rows",
        "starter_sequence_rows",
        "starter_fight_rows",
        "starter_probe_rows",
        "starter_detail_rows",
        "starter_detail_sources",
        "execution_addendum_rows",
        "execution_addendum_sources",
        "lpb_surface_rows",
        "lpb_surface_sources",
        "seasonal_item_rows",
        "seasonal_item_buckets",
        "cutscene_matrix_rows",
        "cutscene_matrix_push_statuses",
        "local_cutscene_delegate_rows",
        "local_delegate_event_caller_rows",
        "cutscene_template_candidate_rows",
        "script_cutscene_gap_rows",
        "scene_bearing_needs_push_rows",
        "after_warp_cutscene_event_rows",
        "blocker_method_focus_rows",
        "route_owner_patch_focus_rows",
        "local_mutator_scan_rows",
        "local_direct_mutator_count",
        "reward_display_sync_rows",
        "reward_display_dat_patch_rows",
        "reward_display_wiki_rows",
        "addendum_enrichment_rows",
        "addendum_reward_sync_rows",
        "addendum_existing_bnpc_rows",
        "addendum_private_bnpc_rows",
        "sqb_target_rows",
        "sqb_adapter_rows",
        "fight_sqb_operator_rows",
        "sqb_cutscene_dependency_rows",
        "sqb_reward_locked_rows",
        "fight_actor_mob_spawn_rows",
        "fight_payload_probe_rows",
        "fight_reward_lock_proof_rows",
        "recovered_director_rows",
        "recovered_directors",
        "local_director_rows",
        "gap_score",
        "implementation_gap_score",
        "enablement_risk_score",
        "priority_band",
        "recommended_lane",
        "gap_reasons",
        "enablement_risk_reasons",
        "decomp_classification",
        "next_action",
    ]
    method_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "class_name",
        "method_order",
        "method_name",
        "method_family",
        "route_token",
        "line_start",
        "line_end",
        "arg_count",
        "after_warp",
        "cutscene_ids",
        "ask_rows",
        "mutation_families",
        "call_count",
        "call_families",
        "callees",
        "owner_hint",
        "owner_hint_source",
        "owner_confidence",
        "blocker_type",
        "source_path",
    ]
    scene_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "scene_key",
        "launcher_count",
        "methods",
        "launchers",
        "replay_row_count",
        "replay_ids",
        "replay_unlock_kinds",
        "replay_payload_shapes",
        "replay_placeholders",
        "source_files",
    ]
    replay_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "scene_key",
        "sample_key",
        "replay_id",
        "unlock_kind",
        "functions",
        "fade_modes",
        "classifications",
        "payload_shape",
        "helper_hint",
        "slot_hints",
        "slot9",
        "slot9_hint",
        "slot10",
        "slot10_hint",
        "slot11",
        "slot11_hint",
        "slot12",
        "slot12_hint",
        "slot13",
        "slot13_hint",
        "slot14",
        "slot14_hint",
        "slot15",
        "slot15_hint",
    ]
    dialogue_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "class_name",
        "method",
        "function_start_line",
        "call_line",
        "receiver",
        "call",
        "event_category",
        "actor_id_or_expr",
        "text_id_or_expr",
        "widget",
        "arg_count",
        "args_preview",
        "text_sheet_id",
        "text_sheet_name",
        "text_row_id",
        "text_join_status",
        "text_en",
        "text_ja",
        "text_de",
        "text_fr",
        "source_file",
        "line_text",
    ]
    text_sheet_full_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "text_sheet_name",
        "text_sheet_path",
        "text_row_id",
        "referenced_by_recovered_event",
        "event_methods",
        "event_calls",
        "event_categories",
        "event_source_lines",
        "text_en",
        "text_ja",
        "text_de",
        "text_fr",
        "text_extra",
        "dynamic_tokens",
        "empty_languages",
        "helper_hint",
    ]
    text_sheet_coverage_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "text_sheet_name",
        "text_sheet_path",
        "sheet_status",
        "total_text_rows",
        "referenced_text_rows",
        "unreferenced_text_rows",
        "dynamic_text_rows",
        "empty_en_rows",
        "referenced_row_ids",
        "unreferenced_row_ids_sample",
        "dynamic_row_ids_sample",
        "coverage_classification",
        "helper_hint",
    ]
    dat_table_fields = [
        "source_table",
        "source_file",
        "source_row",
        "match_kind",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "raw_row_id",
        "raw_slot",
        "data_kind",
        "non_empty_field_count",
        "dynamic_tokens",
        "sheet_refs",
        "item_refs",
        "text_signal",
        "row_snapshot",
        "helper_hint",
    ]
    dat_journal_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "raw_title_en",
        "raw_title_ja",
        "raw_title_de",
        "raw_title_fr",
        "title_match_status",
        "title_mismatch_note",
        "offer_summary_en",
        "restriction_text_en",
        "active_objective_expr_en",
        "completion_objective_expr_en",
        "reward_text_en",
        "branch_states",
        "sheet_refs",
        "item_refs",
        "dynamic_tokens",
        "non_empty_field_count",
        "row_snapshot",
        "helper_hint",
    ]
    journal_reference_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "source_field",
        "source_field_kind",
        "source_language",
        "branch_state",
        "sheet_name",
        "sheet_row_id",
        "sheet_language_column",
        "resolved_status",
        "requested_text",
        "text_en",
        "text_ja",
        "text_de",
        "text_fr",
        "item_refs",
        "dynamic_tokens",
        "source_text_preview",
        "helper_hint",
    ]
    journal_coverage_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "journal_ref_rows",
        "resolved_ref_rows",
        "unresolved_ref_rows",
        "source_field_kinds",
        "branch_states",
        "sheet_names",
        "sheet_row_ids_sample",
        "item_refs",
        "english_samples",
        "coverage_classification",
        "helper_hint",
    ]
    reward_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "sort_order",
        "reward_type",
        "reward_id",
        "quantity",
        "class_job_id",
        "source",
        "auto_grant",
        "duplicate_grant_risk",
        "helper_hint",
        "review_note",
    ]
    marker_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "marker_id",
        "slot",
        "unknown_flag",
        "x",
        "z",
        "map_group",
        "map_id",
        "radius",
        "marker_class",
        "display_name_id",
        "icon",
        "visible",
        "text_ref",
        "helper_hint",
    ]
    marker_resolution_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "marker_id",
        "slot",
        "unknown_flag",
        "x",
        "z",
        "map_group",
        "map_id",
        "radius",
        "marker_class",
        "display_name_id",
        "display_name_en",
        "display_name_ja",
        "display_name_de",
        "display_name_fr",
        "icon",
        "visible",
        "text_ref",
        "map_lookup_status",
        "map_variant",
        "map_place_ids",
        "map_place_names",
        "map_place_raw_names",
        "map_data_source_row",
        "actor_class_candidate_count",
        "actor_class_candidates",
        "actor_candidate_names",
        "actor_candidate_paths",
        "direct_actor_class_path",
        "direct_actor_display_name_id",
        "direct_actor_display_name_en",
        "direct_actor_property_flags",
        "dat_graphic_base",
        "dat_graphic_size",
        "dat_graphic_snapshot",
        "resolution_status",
        "helper_hint",
    ]
    dat_crosscheck_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "raw_quest_rows",
        "raw_extra_rows",
        "raw_journal_rows",
        "journal_title_status",
        "journal_title_note",
        "raw_marker_rows",
        "normalized_marker_rows",
        "marker_delta",
        "raw_new_reward_rows",
        "normalized_reward_rows",
        "raw_legacy_reward_rows",
        "reward_delta",
        "raw_cut_replay_rows",
        "raw_cut_replay_text_rows",
        "recovered_replay_rows",
        "cut_replay_delta",
        "completion_text_rows",
        "crosscheck_status",
        "helper_hint",
    ]
    dat_cutreplay_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "replay_id",
        "match_status",
        "raw_scene_key",
        "recovered_scene_key",
        "cutscene_title_en",
        "cutscene_title_ja",
        "cutscene_title_de",
        "cutscene_title_fr",
        "raw_gate_field",
        "raw_unlock_kind",
        "recovered_unlock_kind",
        "payload_shape",
        "slot_hints",
        "slot9",
        "slot10",
        "slot11",
        "slot12",
        "slot13",
        "slot14",
        "slot15",
        "slot16",
        "source_row",
        "row_snapshot",
        "helper_hint",
    ]
    item_reference_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "item_id",
        "reference_kind",
        "reference_count",
        "reference_details",
        "item_name_en",
        "item_name_ja",
        "item_name_de",
        "item_name_fr",
        "item_path",
        "max_stack",
        "unique",
        "untradeable",
        "item_lookup_status",
        "helper_hint",
    ]
    actor_surface_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "source_file",
        "source_line",
        "function",
        "sequence_expr",
        "actor_expr",
        "actor_class_id",
        "actor_class_path",
        "display_name_id",
        "quest_flag",
        "raw_args",
        "confidence",
        "gap_status",
        "helper_hint",
    ]
    actor_resolution_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "source_file",
        "source_line",
        "function",
        "sequence_expr",
        "actor_expr",
        "actor_class_id",
        "actor_class_path",
        "sql_class_path",
        "path_match_status",
        "display_name_id",
        "display_name_en",
        "display_name_ja",
        "display_name_de",
        "display_name_fr",
        "property_flags",
        "event_condition_names",
        "appearance_status",
        "appearance_base",
        "appearance_size",
        "hair_style",
        "face_type",
        "hair_color",
        "skin_color",
        "eye_color",
        "equipment_summary",
        "dat_graphic_base",
        "dat_graphic_size",
        "dat_graphic_snapshot",
        "spawn_count",
        "spawn_samples",
        "quest_flag",
        "raw_args",
        "confidence",
        "gap_status",
        "resolution_status",
        "helper_hint",
    ]
    marker_actor_coverage_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "marker_rows",
        "actor_rows",
        "unknown_marker_display_rows",
        "actor_missing_sql_rows",
        "spawn_backed_actor_rows",
        "area_marker_rows",
        "marker_display_ids",
        "marker_display_names",
        "actor_class_ids",
        "actor_display_names",
        "map_places",
        "spawn_samples",
        "coverage_classification",
        "helper_hint",
    ]
    server_flow_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "server_script",
        "server_file",
        "line",
        "receiver",
        "call",
        "flow_category",
        "arg_count",
        "args_preview",
        "line_text",
        "helper_hint",
        "risk_note",
    ]
    bnpc_objective_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "sequence",
        "objective_constant",
        "actor_class_id",
        "actor_class_path",
        "objective_item_id",
        "objective_count",
        "bnpc_id",
        "display_name",
        "min_level",
        "max_level",
        "materialization_status",
        "confidence",
        "helper_hint",
        "next_action",
    ]
    spawn_point_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "objective_constant",
        "actor_class_id",
        "bnpc_id",
        "display_name",
        "spawn_surface",
        "spawn_id",
        "unique_id",
        "zone_id",
        "zone_name",
        "private_area",
        "x",
        "y",
        "z",
        "rot",
        "confidence",
        "needs_capture",
        "source_ref",
        "raw_sample",
        "helper_hint",
    ]
    director_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "director",
        "variant",
        "director_suffix",
        "source_path",
        "local_quest_paths",
        "local_director_path",
        "parity_status",
        "line_count",
        "function_count",
        "functions",
        "feature_flags",
        "classes",
        "helper_hint",
    ]
    execution_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "event_rows",
        "scene_event_rows",
        "scene_keys",
        "missing_local_scene_event_rows",
        "after_warp_scene_event_rows",
        "ask_event_rows",
        "warp_or_content_event_rows",
        "local_delegate_total",
        "priority_reason",
        "helper_hint",
    ]
    scene_push_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "function",
        "event_method",
        "function_line",
        "arg_count",
        "extra_arg_count_guess",
        "scene_keys",
        "scene_call_count",
        "scene_calls",
        "cutreplay_rows",
        "fade_mode",
        "has_fade_out",
        "ask_rows",
        "has_warp_or_content",
        "local_delegate_count",
        "local_delegate_callers",
        "push_recipe",
        "risk_notes",
        "helper_hint",
        "recovered_path",
    ]
    runtime_probe_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "lane",
        "target",
        "event_method",
        "scene_keys",
        "actor_or_owner",
        "command",
        "template",
        "expected_signal",
        "mutation_policy",
        "capture_points",
        "risk_notes",
        "helper_hint",
        "source_csv",
    ]
    enablement_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "parity_status",
        "gate_key",
        "gate_value",
        "no_offer",
        "effective_offerable",
        "safety_class",
        "enablement_action",
        "push_enablement_class",
        "recommended_action",
        "owner_use_scope",
        "retail_sequence_status",
        "reward_lock_status",
        "safe_to_enable_rewards",
        "reward_duplication_risk",
        "fight_or_content_risk",
        "missing_scene_push_rows",
        "after_warp_rows",
        "bnpc_rows",
        "reward_gap_rows",
        "blocker_notes",
        "log_only",
        "log_only_reason",
        "helper_hint",
    ]
    roadmap_fields = [
        "priority",
        "lane",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "target",
        "status",
        "recommended_action",
        "blocker",
        "evidence",
        "helper_hint",
        "source_csv",
    ]
    push_operator_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "operator_lane",
        "subject_type",
        "target",
        "scene_key",
        "current_status",
        "known_command",
        "missing_command",
        "command_or_patch_template",
        "safe_to_execute",
        "risk_class",
        "gate_policy",
        "data_needed",
        "next_best_operator_step",
        "helper_hint",
        "local_evidence",
        "source_csv",
    ]
    local_runtime_surface_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "source_file",
        "source_line",
        "function",
        "sequence_expr",
        "surface_kind",
        "name_or_action",
        "value_or_target",
        "actor_class_id",
        "actor_class_path",
        "display_name_id",
        "flag_expr",
        "event_method",
        "call_kind",
        "target_kind",
        "target_code",
        "extra_arg_count",
        "match_kind",
        "wait_recipe",
        "end_event_policy",
        "risk_notes",
        "helper_hint",
        "raw",
    ]
    cutscene_argument_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "function",
        "event_method",
        "delegate_method_to_call",
        "arg_count",
        "injected_context_count",
        "inferred_payload_count",
        "extra_arg_count_guess",
        "scene_keys",
        "scene_call_kind",
        "fade_mode",
        "route_status",
        "push_safety",
        "active_owner_kind",
        "active_event_type_expected",
        "wait_recipe",
        "end_event_policy",
        "route_owner_join_status",
        "route_owner_actor_class_ids",
        "argument_shape",
        "required_runtime_args",
        "patch_class",
        "next_step",
        "blocker_notes",
        "helper_hint",
        "recovered_script_path",
    ]
    route_owner_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "event_method",
        "delegate_method_to_call",
        "scene_keys",
        "cutreplay_rows",
        "route_owner_resolution_status",
        "inferred_actor_expr",
        "inferred_actor_class_id",
        "inferred_actor_class_path",
        "inferred_display_name_id",
        "inferred_owner_kind",
        "inferred_flag_expr",
        "inferred_event_function",
        "inferred_sequence_expr",
        "inferred_sequence_value",
        "candidate_actor_exprs",
        "candidate_actor_class_ids",
        "candidate_flags",
        "candidate_sequences",
        "evidence_sources",
        "evidence_refs",
        "evidence_score",
        "confidence_class",
        "conflict_notes",
        "active_event_type_expected",
        "wait_recipe",
        "end_event_policy",
        "after_warp_sensitive",
        "extra_arg_count_guess",
        "extra_args_policy",
        "push_safety",
        "original_route_status",
        "original_route_owner_join_status",
        "suggested_insertion_function",
        "suggested_insertion_ref",
        "recommended_patch_action",
        "blocker_notes",
        "helper_hint",
    ]
    payload_proof_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "event_method",
        "scene_key",
        "lane_or_status",
        "owner_actor_class_id",
        "owner_selector",
        "argument_shape",
        "payload_expression",
        "payload_to_capture",
        "return_tuple_to_capture",
        "wait_recipe",
        "end_event_policy",
        "command",
        "pass_condition",
        "mutation_policy",
        "proof_status",
        "probe_wave",
        "patch_gate",
        "blocker_notes",
        "source_refs",
        "helper_hint",
    ]
    fight_readiness_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "fight_lane",
        "actor_class_ready",
        "mob_type_ready",
        "spawn_ready",
        "content_map_ready",
        "director_ready",
        "kill_route_present",
        "kill_route_reachable",
        "return_flow_ready",
        "reward_lock_ready",
        "scaffold_mutation_risk",
        "blocking_gaps",
        "readiness_score_0_100",
        "reward_lock_status",
        "safe_to_enable_rewards",
        "route_status",
        "next_fix",
        "implementation_hint",
        "helper_hint",
    ]
    blueprint_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "blueprint_lane",
        "target",
        "disposition",
        "implementation_step",
        "validation_step",
        "blocker_type",
        "recovered_order",
        "after_warp_methods",
        "likely_owner",
        "scaffold_lacks",
        "no_mutation_probe",
        "source_queue",
        "helper_hint",
    ]
    cutscene_contract_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "event_method",
        "method_name",
        "scene_key",
        "contract_class",
        "transport_kind",
        "transport_recipe",
        "owner_actor_class_id",
        "route_owner_status",
        "confidence",
        "payload_status",
        "argument_shape",
        "wait_recipe",
        "end_event_policy",
        "after_warp",
        "command_or_template",
        "safe_to_execute",
        "readiness",
        "recommended_action",
        "blocker_notes",
        "source_ref",
        "helper_hint",
    ]
    runtime_unlock_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "lane_or_status",
        "method_name",
        "scene_key",
        "actor_or_owner",
        "command",
        "secondary_command",
        "expected_signal",
        "proof_to_capture",
        "payload_gate",
        "safe_action",
        "mutation_guard",
        "blocker_notes",
        "source_csv",
        "helper_hint",
    ]
    instanced_owner_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "lane",
        "handler_or_method",
        "role_or_action",
        "actor_or_owner",
        "sequence_context",
        "scene_or_text_refs",
        "text_snippets",
        "branch_conditions",
        "fade_flags",
        "status",
        "risk_class",
        "source_ref",
        "helper_hint",
    ]
    instanced_runtime_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "lane",
        "method_or_handler",
        "sequence_or_context",
        "actor_or_owner",
        "scene_or_helper",
        "payload_or_contract",
        "probe_or_command",
        "status_or_risk",
        "lifecycle_or_return",
        "mutation_or_reward",
        "expected_signal",
        "recommended_action",
        "source_refs",
        "helper_hint",
    ]
    starter_city_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "method",
        "line",
        "sequence",
        "signal_kind",
        "call_or_action",
        "scene_key",
        "widget",
        "text_row_id",
        "text_en",
        "content_area",
        "objective_actor",
        "route_status",
        "lifecycle_status",
        "expected_anchor_or_state",
        "next_fix",
        "evidence_refs",
        "helper_hint",
    ]
    execution_addendum_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "lane_or_status",
        "method_or_target",
        "scene_key",
        "owner_or_actor",
        "command_or_recipe",
        "payload_or_args",
        "wait_or_lifecycle",
        "safety_or_risk",
        "materialization_or_reward",
        "recommended_action",
        "blockers",
        "source_refs",
        "helper_hint",
    ]
    lpb_surface_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "scope_or_family",
        "class_name",
        "base_class",
        "method_name",
        "method_id",
        "line",
        "call_or_event",
        "receiver",
        "args_preview",
        "tags_or_flags",
        "text_or_scene_refs",
        "source_path",
        "start_line",
        "end_line",
        "line_count",
        "call_count",
        "bridge_call_count",
        "status_or_risk",
        "helper_hint",
    ]
    seasonal_item_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "event_bucket",
        "item_id",
        "item_name",
        "unlock_state",
        "source_tags",
        "related_item_ids",
        "item_category",
        "is_rare",
        "is_exclusive",
        "evidence",
        "helper_hint",
    ]
    cutscene_matrix_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "source_file",
        "line",
        "method_name",
        "scene_key",
        "delegate_kind",
        "template_or_recipe",
        "status",
        "owner_hint",
        "payload_to_capture",
        "after_warp",
        "mutation_policy",
        "local_evidence",
        "recommended_action",
        "blocker_notes",
        "source_csv",
        "helper_hint",
    ]
    mutator_reward_sync_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "file_path",
        "line",
        "risk_or_status",
        "direct_mutator_count",
        "template_mutators",
        "actual_display_exp",
        "expected_display_exp",
        "reward_source",
        "reward_policy",
        "bnpc_actor_class_id",
        "bnpc_status",
        "zone_or_spawn_summary",
        "recommended_action",
        "blocker_notes",
        "evidence",
        "helper_hint",
    ]
    sqb_adapter_fields = [
        "source",
        "priority",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "director",
        "adapter_lane",
        "adapter_status",
        "content_area",
        "content_script",
        "callback_actor",
        "materialization_status",
        "mob_or_spawn_status",
        "known_command",
        "missing_command",
        "expected_signal",
        "reward_lock_status",
        "safe_to_enable_rewards",
        "risk_class",
        "recommended_action",
        "blocker_notes",
        "evidence_refs",
        "helper_hint",
    ]
    script_signature_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "script_path",
        "file_exists",
        "file_line_count",
        "file_flags",
        "require_targets",
        "class_defs",
        "function_name",
        "function_line",
        "function_end_line",
        "function_arg_count",
        "function_body_lines",
        "scene_keys",
        "text_ids",
        "say_calls",
        "ask_calls",
        "delegate_calls",
        "client_function_calls",
        "cutscene_calls",
        "fade_calls",
        "quest_state_calls",
        "reward_calls",
        "inventory_calls",
        "warp_or_zone_calls",
        "content_or_battle_calls",
        "call_names",
        "risk_notes",
        "helper_hint",
        "body_preview",
    ]
    script_delta_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "local_script_exists",
        "recovered_script_exists",
        "local_function_count",
        "recovered_function_count",
        "local_file_flags",
        "recovered_file_flags",
        "local_scene_keys",
        "recovered_scene_keys",
        "local_call_signal",
        "recovered_call_signal",
        "missing_local_functions",
        "local_only_functions",
        "delta_classification",
        "recommended_helper",
        "risk_notes",
    ]
    auxiliary_csv_hit_fields = [
        "source_file",
        "source_family",
        "source_row",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "matched_columns",
        "matched_values",
        "primary_path",
        "line",
        "function_or_method",
        "scene_or_text_refs",
        "status_or_action",
        "row_snapshot",
        "helper_hint",
    ]
    battle_fields = [
        "source",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "actor_class_id",
        "bnpc_or_mob_type_id",
        "display_key",
        "objective_constant",
        "status",
        "note",
        "recommended_next_action",
        "source_refs",
    ]
    probe_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "method_order",
        "method_name",
        "probe_kind",
        "helper_hint",
        "payload_hint",
        "risk",
        "command",
        "scene_keys",
        "replay_ids",
        "cutscene_ids",
        "call_families",
        "callees",
        "reason",
        "source_path",
        "line_start",
    ]
    helper_fields = [
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "decomp_classification",
        "recommended_helpers",
        "probe_kinds",
        "risk_mix",
        "battle_candidate_count",
        "sample_probe_commands",
        "reason",
    ]
    family_fields = [
        "category",
        "family",
        "quest_rows",
        "local_missing",
        "local_scaffold",
        "local_data_or_stub",
        "local_handwritten",
        "method_rows",
        "scene_quest_rows",
        "battle_candidate_rows",
        "bnpc_objective_rows",
        "spawn_point_rows",
        "reward_rows",
        "marker_rows",
        "director_rows",
        "top_codes",
    ]
    backlog_fields = [
        "decomp_priority_score",
        "code",
        "quest_id",
        "quest_name",
        "category",
        "local_status",
        "decomp_classification",
        "next_action",
        "scene_keys",
        "battle_candidate_count",
        "reward_types",
        "gap_reasons",
    ]

    counts = {
        "quest_decomp_inventory.csv": write_csv(output_dir / "quest_decomp_inventory.csv", inventory, inventory_fields),
        "quest_method_index.csv": write_csv(output_dir / "quest_method_index.csv", method_index, method_fields),
        "quest_scene_index.csv": write_csv(output_dir / "quest_scene_index.csv", scene_index, scene_fields),
        "quest_replay_payload_index.csv": write_csv(output_dir / "quest_replay_payload_index.csv", replay_payload_index, replay_fields),
        "quest_dialogue_text_index.csv": write_csv(output_dir / "quest_dialogue_text_index.csv", dialogue_text_index, dialogue_fields),
        "quest_text_sheet_full_index.csv": write_csv(output_dir / "quest_text_sheet_full_index.csv", text_sheet_full_index, text_sheet_full_fields),
        "quest_text_sheet_coverage_index.csv": write_csv(output_dir / "quest_text_sheet_coverage_index.csv", text_sheet_coverage_index, text_sheet_coverage_fields),
        "quest_dat_table_index.csv": write_csv(output_dir / "quest_dat_table_index.csv", dat_table_index, dat_table_fields),
        "quest_dat_journal_index.csv": write_csv(output_dir / "quest_dat_journal_index.csv", dat_journal_index, dat_journal_fields),
        "quest_journal_reference_index.csv": write_csv(output_dir / "quest_journal_reference_index.csv", journal_reference_index, journal_reference_fields),
        "quest_journal_coverage_index.csv": write_csv(output_dir / "quest_journal_coverage_index.csv", journal_coverage_index, journal_coverage_fields),
        "quest_reward_index.csv": write_csv(output_dir / "quest_reward_index.csv", reward_index, reward_fields),
        "quest_marker_index.csv": write_csv(output_dir / "quest_marker_index.csv", marker_index, marker_fields),
        "quest_marker_resolution_index.csv": write_csv(output_dir / "quest_marker_resolution_index.csv", marker_resolution_index, marker_resolution_fields),
        "quest_dat_crosscheck_index.csv": write_csv(output_dir / "quest_dat_crosscheck_index.csv", dat_crosscheck_index, dat_crosscheck_fields),
        "quest_dat_cutreplay_index.csv": write_csv(output_dir / "quest_dat_cutreplay_index.csv", dat_cutreplay_index, dat_cutreplay_fields),
        "quest_item_reference_index.csv": write_csv(output_dir / "quest_item_reference_index.csv", item_reference_index, item_reference_fields),
        "quest_actor_surface_index.csv": write_csv(output_dir / "quest_actor_surface_index.csv", actor_surface_index, actor_surface_fields),
        "quest_actor_resolution_index.csv": write_csv(output_dir / "quest_actor_resolution_index.csv", actor_resolution_index, actor_resolution_fields),
        "quest_marker_actor_coverage_index.csv": write_csv(output_dir / "quest_marker_actor_coverage_index.csv", marker_actor_coverage_index, marker_actor_coverage_fields),
        "quest_server_flow_index.csv": write_csv(output_dir / "quest_server_flow_index.csv", server_flow_index, server_flow_fields),
        "quest_bnpc_objective_index.csv": write_csv(output_dir / "quest_bnpc_objective_index.csv", bnpc_objective_index, bnpc_objective_fields),
        "quest_spawn_point_index.csv": write_csv(output_dir / "quest_spawn_point_index.csv", spawn_point_index, spawn_point_fields),
        "quest_director_index.csv": write_csv(output_dir / "quest_director_index.csv", director_index, director_fields),
        "quest_execution_index.csv": write_csv(output_dir / "quest_execution_index.csv", execution_index, execution_fields),
        "quest_scene_push_index.csv": write_csv(output_dir / "quest_scene_push_index.csv", scene_push_index, scene_push_fields),
        "quest_runtime_probe_index.csv": write_csv(output_dir / "quest_runtime_probe_index.csv", runtime_probe_index, runtime_probe_fields),
        "quest_enablement_index.csv": write_csv(output_dir / "quest_enablement_index.csv", enablement_index, enablement_fields),
        "quest_implementation_roadmap_index.csv": write_csv(output_dir / "quest_implementation_roadmap_index.csv", implementation_roadmap_index, roadmap_fields),
        "quest_push_operator_index.csv": write_csv(output_dir / "quest_push_operator_index.csv", push_operator_index, push_operator_fields),
        "quest_local_runtime_surface_index.csv": write_csv(output_dir / "quest_local_runtime_surface_index.csv", local_runtime_surface_index, local_runtime_surface_fields),
        "quest_cutscene_argument_index.csv": write_csv(output_dir / "quest_cutscene_argument_index.csv", cutscene_argument_index, cutscene_argument_fields),
        "quest_route_owner_index.csv": write_csv(output_dir / "quest_route_owner_index.csv", route_owner_index, route_owner_fields),
        "quest_payload_proof_index.csv": write_csv(output_dir / "quest_payload_proof_index.csv", payload_proof_index, payload_proof_fields),
        "quest_fight_readiness_index.csv": write_csv(output_dir / "quest_fight_readiness_index.csv", fight_readiness_index, fight_readiness_fields),
        "quest_blueprint_index.csv": write_csv(output_dir / "quest_blueprint_index.csv", blueprint_index, blueprint_fields),
        "quest_cutscene_contract_index.csv": write_csv(output_dir / "quest_cutscene_contract_index.csv", cutscene_contract_index, cutscene_contract_fields),
        "quest_runtime_unlock_index.csv": write_csv(output_dir / "quest_runtime_unlock_index.csv", runtime_unlock_index, runtime_unlock_fields),
        "quest_instanced_owner_index.csv": write_csv(output_dir / "quest_instanced_owner_index.csv", instanced_owner_index, instanced_owner_fields),
        "quest_instanced_runtime_index.csv": write_csv(output_dir / "quest_instanced_runtime_index.csv", instanced_runtime_index, instanced_runtime_fields),
        "quest_starter_city_index.csv": write_csv(output_dir / "quest_starter_city_index.csv", starter_city_index, starter_city_fields),
        "quest_execution_addendum_index.csv": write_csv(output_dir / "quest_execution_addendum_index.csv", execution_addendum_index, execution_addendum_fields),
        "quest_lpb_surface_index.csv": write_csv(output_dir / "quest_lpb_surface_index.csv", lpb_surface_index, lpb_surface_fields),
        "quest_seasonal_item_index.csv": write_csv(output_dir / "quest_seasonal_item_index.csv", seasonal_item_index, seasonal_item_fields),
        "quest_cutscene_matrix_index.csv": write_csv(output_dir / "quest_cutscene_matrix_index.csv", cutscene_matrix_index, cutscene_matrix_fields),
        "quest_mutator_reward_sync_index.csv": write_csv(output_dir / "quest_mutator_reward_sync_index.csv", mutator_reward_sync_index, mutator_reward_sync_fields),
        "quest_sqb_adapter_index.csv": write_csv(output_dir / "quest_sqb_adapter_index.csv", sqb_adapter_index, sqb_adapter_fields),
        "quest_script_signature_index.csv": write_csv(output_dir / "quest_script_signature_index.csv", script_signature_index, script_signature_fields),
        "quest_script_delta_index.csv": write_csv(output_dir / "quest_script_delta_index.csv", script_delta_index, script_delta_fields),
        "quest_auxiliary_csv_hit_index.csv": write_csv(output_dir / "quest_auxiliary_csv_hit_index.csv", auxiliary_csv_hit_index, auxiliary_csv_hit_fields),
        "quest_battle_candidate_index.csv": write_csv(output_dir / "quest_battle_candidate_index.csv", battle_index, battle_fields),
        "quest_probe_commands.csv": write_csv(output_dir / "quest_probe_commands.csv", probe_commands, probe_fields),
        "quest_helper_recommendations.csv": write_csv(output_dir / "quest_helper_recommendations.csv", helper_recommendations, helper_fields),
        "quest_family_summary.csv": write_csv(output_dir / "quest_family_summary.csv", family_summary, family_fields),
        "implementation_backlog.csv": write_csv(output_dir / "implementation_backlog.csv", backlog, backlog_fields),
    }

    doc = build_doc(
        output_dir,
        inventory,
        family_summary,
        backlog,
        scene_index,
        replay_payload_index,
        dialogue_text_index,
        text_sheet_full_index,
        text_sheet_coverage_index,
        dat_table_index,
        dat_journal_index,
        journal_reference_index,
        journal_coverage_index,
        dat_crosscheck_index,
        dat_cutreplay_index,
        item_reference_index,
        reward_index,
        marker_index,
        marker_resolution_index,
        actor_surface_index,
        actor_resolution_index,
        marker_actor_coverage_index,
        server_flow_index,
        bnpc_objective_index,
        spawn_point_index,
        director_index,
        execution_index,
        scene_push_index,
        runtime_probe_index,
        enablement_index,
        implementation_roadmap_index,
        push_operator_index,
        local_runtime_surface_index,
        cutscene_argument_index,
        route_owner_index,
        payload_proof_index,
        fight_readiness_index,
        blueprint_index,
        cutscene_contract_index,
        runtime_unlock_index,
        instanced_owner_index,
        instanced_runtime_index,
        starter_city_index,
        execution_addendum_index,
        lpb_surface_index,
        seasonal_item_index,
        cutscene_matrix_index,
        mutator_reward_sync_index,
        sqb_adapter_index,
        script_signature_index,
        script_delta_index,
        auxiliary_csv_hit_index,
        battle_index,
        helper_recommendations,
        probe_commands,
    )
    write_text(doc_path, doc)
    write_text(output_dir / "README.md", doc)

    print("All normal quest decomp pack written:")
    for name, count in counts.items():
        print(f"  {name}: {count}")
    print(f"  README.md: {output_dir / 'README.md'}")
    print(f"  doc: {doc_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
