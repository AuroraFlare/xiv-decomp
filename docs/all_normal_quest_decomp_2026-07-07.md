# All Normal Quest Decomp Pack

Generated: 2026-07-07 09:00:47

## Scope

- Included quest-code rows: 297
- Filter: quest id present, real title present, title is not `[en]`.
- Seasonal quests are included.
- Output folder: `C:\Users\drime\source\repos\AuroraFlare\FF14-Memory\outputs\all-normal-quest-decomp-20260707`

This is a data-only decomp pass. It does not enable quests, add spawns, grant rewards, or mutate local quest routes.

## Output Files

- `quest_decomp_inventory.csv`: one row per included quest code.
- `quest_method_index.csv`: one row per recovered method, joined to current quest/local status.
- `quest_scene_index.csv`: recovered scene launchers and replay rows by quest scene.
- `quest_replay_payload_index.csv`: corrected replay slot and payload helper hints.
- `quest_dialogue_text_index.csv`: joined recovered event text rows and localized text.
- `quest_text_sheet_full_index.csv`: full dat-mining quest text sheets, marked by recovered event usage.
- `quest_text_sheet_coverage_index.csv`: per-quest text-sheet coverage and unreferenced text rollup.
- `quest_dat_table_index.csv`: raw Dat Mining quest table rows joined by quest id and quest-id prefixes.
- `quest_dat_journal_index.csv`: compact `xtx_quest` title, branch, sheet-ref, and item-ref metadata.
- `quest_journal_reference_index.csv`: resolved journal objective refs into `xtx_journalxtx*` localized text rows.
- `quest_journal_coverage_index.csv`: per-quest journal branch/text coverage rollup.
- `quest_reward_index.csv`: reward rows with auto-grant and duplicate-grant review hints.
- `quest_marker_index.csv`: map/quest marker rows by slot with sequence-helper hints.
- `quest_marker_resolution_index.csv`: marker rows resolved to display names, map place hints, and actor-class candidates.
- `quest_dat_crosscheck_index.csv`: raw-vs-normalized marker/reward/replay/title parity by quest.
- `quest_dat_cutreplay_index.csv`: raw cutReplay payloads joined to localized replay titles and recovered rows.
- `quest_item_reference_index.csv`: reward and text item references resolved through Dat Mining item sheets.
- `quest_actor_surface_index.csv`: ENpc/BNpc actor surfaces and flag/gap hints.
- `quest_actor_resolution_index.csv`: actor surfaces joined to SQL class, localized display, appearance, and spawn evidence.
- `quest_marker_actor_coverage_index.csv`: per-quest marker/actor resolution coverage and helper classification.
- `quest_server_flow_index.csv`: local server quest calls filtered to included quest codes.
- `quest_bnpc_objective_index.csv`: normalized BNPC objective constants, item/count objectives, and materialization status.
- `quest_spawn_point_index.csv`: recovered/normalized quest spawn point positions.
- `quest_director_index.csv`: recovered and local quest director rows joined to included quest codes.
- `quest_execution_index.csv`: execution summary rows by quest code.
- `quest_scene_push_index.csv`: recovered scene-bearing event methods and push recipes.
- `quest_runtime_probe_index.csv`: runtime probe workqueue rows for cutscene/fight proof.
- `quest_enablement_index.csv`: safe enablement and safe-push queue status by quest.
- `quest_implementation_roadmap_index.csv`: implementation roadmap rows filtered to included quests.
- `quest_push_operator_index.csv`: push operator and dependency bundle rows.
- `quest_local_runtime_surface_index.csv`: local constants, ENpc bindings, delegate push calls, and lifecycle actions.
- `quest_cutscene_argument_index.csv`: cutscene/after-warp argument requirements and runtime payload hints.
- `quest_route_owner_index.csv`: inferred route-owner actors, sequences, and confidence evidence.
- `quest_payload_proof_index.csv`: owner-bound payload, EventUpdate tuple, after-warp, and blocked-owner proof queues.
- `quest_fight_readiness_index.csv`: fight readiness, kill-route, return-flow, and reward-lock joins.
- `quest_blueprint_index.csv`: implementation blueprint and retail sequence-spine workqueue rows.
- `quest_cutscene_contract_index.csv`: push contracts, recipes, owner probes, and method probe recipes.
- `quest_runtime_unlock_index.csv`: next-runtime-unlock triage, proof queues, and safe smoke targets.
- `quest_instanced_owner_index.csv`: instanced event owner, sequence, and text-clue matrices.
- `quest_instanced_runtime_index.csv`: instanced lifecycle, payload, return-state, SQB, and probe addenda.
- `quest_starter_city_index.csv`: starter-city opening quest client/server/fight detail.
- `quest_execution_addendum_index.csv`: extra execution, scaffold, payload, after-warp, content, and probe queues.
- `quest_lpb_surface_index.csv`: LPB method, bridge-call, event protocol, side-world, seasonal, SQB, and scaffold surfaces.
- `quest_seasonal_item_index.csv`: seasonal quest item surfaces and item-atlas joins.
- `quest_cutscene_matrix_index.csv`: local delegate inventories and recovered cutscene push/gap matrices.
- `quest_mutator_reward_sync_index.csv`: direct mutator scans, reward display sync, and addendum enrichment queues.
- `quest_sqb_adapter_index.csv`: SQB adapter, fight materialization, and reward-lock proof rows.
- `quest_script_signature_index.csv`: local/recovered Lua script signatures, function spans, calls, scenes, and helper hints.
- `quest_script_delta_index.csv`: per-quest local-vs-recovered Lua comparison and replacement helper hint.
- `quest_auxiliary_csv_hit_index.csv`: remaining quest-code hits from unconfigured CSV exports, with row snapshots.
- `quest_battle_candidate_index.csv`: BNPC/objective candidates and SQL quest-title battle breadcrumbs.
- `quest_probe_commands.csv`: static probe-command hints by recovered method.
- `quest_helper_recommendations.csv`: per-quest helper families and sample probe commands.
- `quest_family_summary.csv`: category/family rollup.
- `implementation_backlog.csv`: sorted follow-up candidates.

## Category Counts

- `class`: 51
- `default_talk`: 6
- `grand_company`: 69
- `job`: 42
- `main_scenario`: 19
- `primal`: 4
- `seasonal`: 14
- `side_special_misc`: 73
- `system`: 4
- `tutorial`: 3
- `world_sidequest`: 12

## Local Status Counts

- `data_or_stub`: 140
- `handwritten_event_driver`: 130
- `present_unknown`: 7
- `scaffold`: 20

## Classification Counts

- `battle_candidate_needs_director_probe`: 13
- `content_or_warp_flow_risk`: 18
- `cutscene_route_candidate`: 73
- `data_inventory`: 12
- `dialogue_or_talk_candidate`: 3
- `implemented_driver_audit`: 18
- `reward_or_item_flow_risk`: 158
- `seasonal_script_candidate`: 2

## High Priority Backlog

| Score | Code | Quest | Category | Local | Classification | Next Action |
| ---: | --- | --- | --- | --- | --- | --- |
| 282 | `gla200` | All Bark and No Bite | class | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 282 | `gla306` | Thrill of the Fight | class | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 282 | `mnk0j6` | Return of the King...of Ruin | job | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 282 | `pld0j5` | Parley on High Ground | job | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 282 | `man308` | Lord Errant | main_scenario | scaffold | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 272 | `whm0j6` | The Chorus of Cataclysm | job | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 270 | `gla300` | Unalienable Rights | class | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 270 | `pgl300` | Here There Be Pirates | class | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 270 | `pgl306` | Two Sides to Every Chip | class | data_or_stub | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 270 | `man406` | Futures Perfect | main_scenario | scaffold | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 262 | `sum6g0` | Taming the Tempest | primal | scaffold | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 262 | `sum6m0` | A Feast of Fools | primal | scaffold | battle_candidate_needs_director_probe | verify fight spawn/lifetime before Lua enablement |
| 252 | `alc300` | The Boy and the Dragon Gay | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `alc306` | Dream On, Dream Away | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `arc200` | Filling the Quiver | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `arc300` | The Foreboding Forest | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `arc306` | There Can Be Only One | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `bsm200` | An Ear for Quality | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `bsm300` | Song of the Sirens | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `bsm306` | The Sound of Silence | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `cnj300` | Good Knight, Sweet Dreams | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `cnj306` | The Call of Nature | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `cul200` | Showdown | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `cul300` | Mystery of the Gastronome Gone Home | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |
| 252 | `exc306` | Captain's Orders | class | data_or_stub | cutscene_route_candidate | probe recovered scene delegates and map safe helper payloads |

## Dat Mining Layers

- Raw Dat table rows: 5857
- Dat journal rows: 297
- Journal reference rows: 16087
- Journal coverage rows: 297
- Dat crosscheck rows: 297
- Dat cutReplay rows: 581
- Item reference rows: 1093
- Raw Dat table `_quest.csv`: 76
- Raw Dat table `cutReplay.csv`: 581
- Raw Dat table `quest.csv`: 297
- Raw Dat table `quest_marker.csv`: 2925
- Raw Dat table `quest_new_reward.csv`: 292
- Raw Dat table `quest_reward.csv`: 730
- Raw Dat table `xtx_cutReplay.csv`: 581
- Raw Dat table `xtx_quest.csv`: 297
- Raw Dat table `xtx_questCompleteText.csv`: 78
- Raw Dat helper `completion text helper`: 78
- Raw Dat helper `cutscene replay payload helper`: 581
- Raw Dat helper `cutscene replay title helper`: 581
- Raw Dat helper `journal/objective text helper`: 297
- Raw Dat helper `legacy reward slot crosscheck helper`: 730
- Raw Dat helper `new reward payload crosscheck helper`: 292
- Raw Dat helper `raw marker crosscheck helper`: 2925
- Raw Dat helper `raw quest auxiliary param helper`: 76
- Raw Dat helper `raw quest param helper`: 297
- Dat journal title `case_only`: 1
- Dat journal title `exact`: 295
- Dat journal title `mismatch`: 1
- Journal reference sheet `xtx/journalxtxFst`: 5835
- Journal reference sheet `xtx/journalxtxRoc`: 420
- Journal reference sheet `xtx/journalxtxSea`: 3852
- Journal reference sheet `xtx/journalxtxWil`: 5980
- Journal reference helper `journal branch text helper`: 7968
- Journal reference helper `journal ref item helper`: 3448
- Journal reference helper `journal resolved text helper`: 4671
- Journal coverage `no_journal_refs`: 16
- Journal coverage `resolved_journal_refs`: 159
- Journal coverage `resolved_with_item_refs`: 122
- Dat crosscheck `dat_crosscheck_clear`: 137
- Dat crosscheck `journal_title_case_only`: 1
- Dat crosscheck `journal_title_mismatch`: 1
- Dat crosscheck `raw_cutreplay_rows_exceed_recovered`: 27
- Dat crosscheck `raw_reward_without_normalized_reward`: 144
- Dat crosscheck `recovered_replay_rows_exceed_raw`: 5
- Dat cutReplay `raw_and_recovered`: 518
- Dat cutReplay `raw_only`: 63
- Dat cutReplay helper `delegateEvent / no dynamic replay payload`: 443
- Dat cutReplay helper `getSnpcDelegateArgListWithExtras(player, helpers.getInitialTown(player))`: 1
- Dat cutReplay helper `getSnpcReplayArgList / getSnpcDelegateArgList`: 33
- Dat cutReplay helper `getSnpcReplayArgListWithSexualitySkin`: 2
- Dat cutReplay helper `manual replay placeholder review`: 39
- Dat cutReplay helper `raw cutReplay recovery helper`: 63
- Item reference source `quest_dat_journal_index`: 302
- Item reference source `quest_journal_reference_index`: 284
- Item reference source `quest_reward_index`: 205
- Item reference source `quest_text_sheet_full_index`: 302
- Item reference helper `dialogue itemName text helper`: 302
- Item reference helper `journal itemName text helper`: 302
- Item reference helper `resolved journal itemName helper`: 284
- Item reference helper `reward item/currency helper`: 205

Dat title review samples:
- `tan300` Design Imposters: inventory='Design Imposters' raw='Designer Imposters'
- `etc2g4` To Deskunk A Beer: inventory='To Deskunk A Beer' raw='To Deskunk a Beer'

## Marker/Reward/Actor/Flow Layers

- Reward rows: 292
- Marker rows: 2925
- Marker resolution rows: 2925
- Actor surface rows: 1279
- Actor resolution rows: 1279
- Marker/actor coverage rows: 297
- Server flow call rows: 5006
- BNPC objective rows: 71
- Spawn point rows: 99
- Quest director rows: 163
- Reward duplicate-grant risk `medium`: 292
- Actor surface confidence `high`: 1156
- Actor surface confidence `low`: 14
- Actor surface confidence `needs_join_review`: 109
- Marker resolution `actor_candidates_by_display_name`: 2924
- Marker resolution `direct_actor_class_row`: 174
- Marker resolution `display_name_resolved`: 2631
- Marker resolution `map_place_missing`: 20
- Marker resolution `map_place_placeholder_only`: 549
- Marker resolution `map_place_resolved`: 2356
- Marker resolution `unknown_display_name`: 294
- Marker resolution helper `marker display actor candidate helper`: 2630
- Marker resolution helper `marker display resolution helper`: 1
- Marker resolution helper `unknown marker display review`: 294
- Actor resolution `appearance_found`: 1188
- Actor resolution `appearance_missing`: 91
- Actor resolution `display_name_resolved`: 1049
- Actor resolution `missing_display_name`: 230
- Actor resolution `missing_sql_actor_class`: 91
- Actor resolution `spawn_found`: 1114
- Actor resolution `spawn_missing`: 165
- Actor resolution `sql_actor_class_found`: 1188
- Actor resolution helper `SetENpc flag route review`: 6
- Actor resolution helper `actor SQL lookup gap helper`: 14
- Actor resolution helper `actor display/appearance helper`: 36
- Actor resolution helper `actor spawn route helper`: 1114
- Actor resolution helper `actor surface gap audit before enabling route`: 109
- Marker/actor coverage `marker_actor_gap_review`: 132
- Marker/actor coverage `marker_actor_resolved`: 18
- Marker/actor coverage `no_marker_actor_surface`: 94
- Marker/actor coverage `spawn_backed_actor_routes`: 53
- Server flow `actor_or_marker`: 22
- Server flow `chara_or_wait`: 31
- Server flow `client_event_dispatch`: 1287
- Server flow `event_end`: 415
- Server flow `music`: 5
- Server flow `npc_linkshell`: 56
- Server flow `player_message`: 221
- Server flow `quest_data`: 690
- Server flow `quest_state`: 1991
- Server flow `reward_or_inventory`: 110
- Server flow `warp_or_zone`: 178
- Objective materialization `actor_id_only_manual_recovery`: 7
- Objective materialization `actor_path_only`: 5
- Objective materialization `ambient_server_spawn`: 8
- Objective materialization `curated_sqb_private_mob_candidate`: 4
- Objective materialization `no_mob_type`: 33
- Objective materialization `same_family_fight_analog`: 7
- Objective materialization `sql_display_keyword_analog`: 7
- Spawn surface `ambient_server_spawn`: 99
- Director source `local_director`: 6
- Director source `recovered_director`: 157

## Execution/Probe/Enablement Layers

- Execution summary rows: 162
- Scene push rows: 707
- Runtime probe rows: 171
- Enablement rows: 297
- Implementation roadmap rows: 795
- Push operator/dependency rows: 819
- Execution addendum rows: 2648
- LPB surface rows: 165104
- Execution hint `after-warp lifetime probe`: 8
- Execution hint `ask/return-value route probe`: 39
- Execution hint `execution evidence review`: 9
- Execution hint `scene push recovery candidate`: 106
- Runtime lane `BNPC_objective`: 25
- Runtime lane `SQB`: 1
- Runtime lane `cutscene_existing_route_smoke`: 44
- Runtime lane `director_notice_transport`: 10
- Runtime lane `fight_materialization`: 26
- Runtime lane `retail_sequence_log_only`: 7
- Runtime lane `snpc_payload_probe`: 58
- Enablement safety `gated_disabled`: 12
- Enablement safety `log_only`: 266
- Enablement safety `targeted_smoke_candidate`: 17
- Enablement safety `visible_nonmutating_candidate`: 2
- Push risk `high`: 491
- Push risk `low`: 72
- Push risk `medium`: 256
- Roadmap lane `bnpc_materialization_candidate`: 25
- Roadmap lane `cutscene_after_warp_lifetime_probe`: 99
- Roadmap lane `cutscene_alias_patch`: 12
- Roadmap lane `cutscene_route_owner_inference`: 378
- Roadmap lane `cutscene_snpc_probe`: 37
- Roadmap lane `fight_materialization`: 30
- Roadmap lane `fight_strict_route_probe`: 14
- Roadmap lane `safe_push_enablement_guardrail`: 171
- Roadmap lane `safe_quest_smoke`: 19
- Roadmap lane `sqb_adapter`: 10
- Execution addendum source `after_warp_lifetime_payload_queue`: 299
- Execution addendum source `after_warp_lifetime_seed_queue`: 6
- Execution addendum source `after_warp_priority_seed_rows`: 6
- Execution addendum source `after_warp_push_queue`: 194
- Execution addendum source `alias_patch_plan`: 5
- Execution addendum source `blocked_bnpc_actor_recovery_queue`: 6
- Execution addendum source `blocked_owner_candidate_seed_rows`: 1
- Execution addendum source `blocked_owner_selector_attempt_matrix`: 64
- Execution addendum source `blocked_sqb_actor_recovery_queue`: 1
- Execution addendum source `content_launch_calls`: 192
- Execution addendum source `curated_blocker_reviews`: 10
- Execution addendum source `current_class_scaffold_enrichment`: 50
- Execution addendum source `cutscene_alias_callsite_blueprints`: 22
- Execution addendum source `cutscene_call_templates`: 34
- Execution addendum source `dat_backed_applied_this_pass`: 7
- Execution addendum source `director_event_push_requirements`: 5
- Execution addendum source `fight_content_lifecycle_join`: 6
- Execution addendum source `fight_helper_priority_seed_rows`: 14
- Execution addendum source `fight_materialization_recipes`: 26
- Execution addendum source `fight_priority_payload_seed_rows`: 20
- Execution addendum source `job_metadata_enrichment_notes`: 7
- Execution addendum source `local_content_area_launches`: 6
- Execution addendum source `manual_recovery_queue`: 22
- Execution addendum source `non_en_scene_alias_payload_hazard_queue`: 4
- Execution addendum source `owner_probe_addendum`: 1
- Execution addendum source `push_probe_workqueue`: 47
- Execution addendum source `quest_cutscene_route_summary`: 162
- Execution addendum source `quest_execution_priority_queue`: 114
- Execution addendum source `quest_implementation_top25`: 25
- Execution addendum source `questdelegate_payload_execution_queue`: 700
- Execution addendum source `retail_blocker_blueprints`: 10
- Execution addendum source `retail_sequence_runtime_probe_plan`: 7
- Execution addendum source `scaffold_cutscene_seed_queue`: 314
- Execution addendum source `scaffold_owner_only_queue`: 68
- Execution addendum source `scene_alias_patch_candidates`: 4
- Execution addendum source `scene_key_delegate_aliases`: 5
- Execution addendum source `snpc_a8_branch_semantics_queue`: 34
- Execution addendum source `snpc_argument_probe_queue`: 37
- Execution addendum source `snpc_payload_capture_queue`: 34
- Execution addendum source `sqb_first_slice_queue`: 10
- Execution addendum source `sqb_materialization_candidates`: 5
- Execution addendum source `sqb_materialization_gap_queue`: 5
- Execution addendum source `sqb_private_mob_sql_blueprints`: 5
- Execution addendum source `sqbprivate_command_blueprints`: 10
- Execution addendum source `targeted_smoke_queue`: 19
- Execution addendum source `world_bnpc_materialization_candidates`: 25
- LPB surface source `instanced_adapter_hardening_rows`: 15
- LPB surface source `instanced_lane_execution_order_rows`: 15
- LPB surface source `lpb_bridge_calls_by_method`: 13626
- LPB surface source `lpb_class_inheritance_graph`: 459
- LPB surface source `lpb_class_inventory`: 454
- LPB surface source `lpb_class_methods`: 5876
- LPB surface source `lpb_content_cutscene_key_inventory`: 487
- LPB surface source `lpb_cutscene_content_family_key_crosscheck`: 59
- LPB surface source `lpb_cutscene_key_crosscheck`: 69
- LPB surface source `lpb_event_protocol_candidates`: 4565
- LPB surface source `lpb_full_class_inventory`: 459
- LPB surface source `lpb_full_class_methods`: 5876
- LPB surface source `lpb_full_event_entrypoints`: 4555
- LPB surface source `lpb_full_text_data_loads`: 291
- LPB surface source `lpb_local_create_content_area_calls`: 6
- LPB surface source `lpb_local_quest_script_inventory`: 297
- LPB surface source `lpb_local_scaffold_behavior`: 1
- LPB surface source `lpb_local_side_world_inventory`: 85
- LPB surface source `lpb_loot_list_text_message_contract`: 2
- LPB surface source `lpb_method_call_edges`: 34164
- LPB surface source `lpb_method_ranges`: 5876
- LPB surface source `lpb_method_summaries`: 5876
- LPB surface source `lpb_quest_cutscene_functions`: 552
- LPB surface source `lpb_quest_cutscene_hotspots`: 30
- LPB surface source `lpb_quest_event_calls`: 21859
- LPB surface source `lpb_quest_method_context`: 5420
- LPB surface source `lpb_quest_method_timeline`: 23666
- LPB surface source `lpb_quest_scene_asset_crosscheck`: 523
- LPB surface source `lpb_quest_scene_dialogue_context`: 609
- LPB surface source `lpb_quest_scene_key_gap_contract`: 21
- LPB surface source `lpb_quest_scene_key_gaps`: 21
- LPB surface source `lpb_recovered_scaffold_scenario`: 1
- LPB surface source `lpb_recovered_side_world_inventory`: 85
- LPB surface source `lpb_scaffold_config_contract`: 4
- LPB surface source `lpb_scaffold_local_gap_matrix`: 2
- LPB surface source `lpb_scaffold_probe_queue`: 1
- LPB surface source `lpb_scaffold_replacement_plan`: 1
- LPB surface source `lpb_scaffold_replacement_targets`: 1
- LPB surface source `lpb_seasonal_replacement_candidates`: 15
- LPB surface source `lpb_seasonal_script_inventory`: 15
- LPB surface source `lpb_server_delegate_bridge_summary`: 33
- LPB surface source `lpb_server_delegate_flow_context`: 1308
- LPB surface source `lpb_server_delegate_method_context`: 1308
- LPB surface source `lpb_server_delegate_to_cutscene_join`: 1308
- LPB surface source `lpb_side_event_bridge_parity`: 1
- LPB surface source `lpb_side_world_code_parity`: 85
- LPB surface source `lpb_side_world_local_gap_matrix`: 18
- LPB surface source `lpb_side_world_probe_queue`: 18
- LPB surface source `lpb_simplequestbattle_client_overrides`: 3
- LPB surface source `lpb_simplequestbattle_director_inventory`: 55
- LPB surface source `lpb_simplequestbattle_family_coverage`: 51
- LPB surface source `lpb_simplequestbattle_probe_queue`: 37
- LPB surface source `lpb_target_system_bridge_calls`: 13626
- LPB surface source `lpb_target_system_event_protocols`: 4565
- LPB surface source `lpb_target_system_method_summaries`: 5876
- LPB surface source `lpb_target_system_text_sheets`: 291
- LPB surface source `lpb_text_data_loads`: 291
- LPB surface source `lpb_text_sheet_usage_join`: 291

## Runtime Deep/Proof/Blueprint Layers

- Local runtime surface rows: 7404
- Cutscene argument rows: 1006
- Route owner inference rows: 700
- Payload/proof queue rows: 2151
- Fight readiness/proof rows: 279
- Blueprint rows: 51
- Local runtime source `local_delegate_push_calls`: 1550
- Local runtime source `local_event_lifecycle_actions`: 1233
- Local runtime source `local_quest_constants`: 2074
- Local runtime source `local_quest_enpc_bindings`: 1282
- Local runtime source `unmatched_active_delegate_calls`: 1265
- Cutscene argument shape `alias_extra_args_required`: 8
- Cutscene argument shape `ctx_only_nq_hq`: 657
- Cutscene argument shape `local_exact_args_observed`: 23
- Cutscene argument shape `missing_route_before_args`: 124
- Cutscene argument shape `no_extra_args_required`: 32
- Cutscene argument shape `nq_hq_payload1_optional`: 70
- Cutscene argument shape `nq_hq_payload2_branch_constants`: 1
- Cutscene argument shape `recovered_formals_need_review`: 51
- Cutscene argument shape `snpc_tuple5`: 35
- Cutscene argument shape `snpc_tuple5_plus`: 5
- Route owner status `exact_delegate_sequence`: 255
- Route owner status `no_recoverable_owner`: 64
- Route owner status `template_scaffold_owner`: 381
- Payload proof source `after_warp_lifetime_proof_queue`: 299
- Payload proof source `blocked_owner_resolution_decomp_queue`: 64
- Payload proof source `eventupdate_return_tuple_decomp_queue`: 544
- Payload proof source `owner_bound_cutscene_payload_atlas`: 700
- Payload proof source `owner_bound_cutscene_payload_probe_queue`: 544
- Payload/proof status `blocked_owner_unrecovered`: 75
- Payload/proof status `capture_lifetime_before_patch`: 265
- Payload/proof status `capture_lifetime_before_patch; wave_03_after_warp_lifetime`: 265
- Payload/proof status `capture_snpc_payload`: 20
- Payload/proof status `capture_snpc_payload; wave_01_high_conf_alias_or_exact`: 5
- Payload/proof status `capture_snpc_payload; wave_02_scaffold_no_mutation`: 9
- Payload/proof status `capture_snpc_payload; wave_03_after_warp_lifetime`: 16
- Payload/proof status `capture_snpc_payload; wave_04_snpc_payload_capture`: 4
- Payload/proof status `decomp_owner_missing`: 64
- Payload/proof status `known_local_payload`: 3
- Payload/proof status `known_local_payload; wave_01_high_conf_alias_or_exact`: 9
- Payload/proof status `known_local_payload; wave_02_scaffold_no_mutation`: 2
- Payload/proof status `known_local_payload; wave_03_after_warp_lifetime`: 3
- Payload/proof status `no_extra_payload_known; wave_01_high_conf_alias_or_exact`: 92
- Payload/proof status `owner_bound`: 122
- Payload/proof status `owner_bound_after_warp`: 530
- Payload/proof status `owner_bound_log_only`: 368
- Payload/proof status `owner_bound_snpc`: 68
- Payload/proof status `recover_or_confirm_extra_args; wave_01_high_conf_alias_or_exact`: 26
- Payload/proof status `recover_or_confirm_extra_args; wave_02_scaffold_no_mutation`: 21
- Payload/proof status `scaffold_no_mutation_payload_probe; wave_02_scaffold_no_mutation`: 184
- Fight proof source `fight_kill_route_join`: 93
- Fight proof source `fight_readiness_by_quest`: 93
- Fight proof source `fight_return_reward_lock_join`: 93
- Blueprint lane/blocker `cutscene_alias_callsite_patch`: 22
- Blueprint lane/blocker `manual_route_recovery`: 3
- Blueprint lane/blocker `retail_blocker_blueprint`: 10
- Blueprint lane/blocker `retail_sequence_spine_blueprint`: 7
- Blueprint lane/blocker `sqb_private_mob_sql`: 5
- Blueprint lane/blocker `template_scaffold_intermediate`: 4

## Contract/Unlock/Instanced Layers

- Cutscene contract rows: 3892
- Runtime unlock rows: 1527
- Instanced owner/text rows: 1036
- Instanced runtime addendum rows: 973
- Starter-city rows: 1548
- Seasonal item rows: 61
- Cutscene contract source `cutscene_method_probe_recipes`: 612
- Cutscene contract source `cutscene_push_contracts`: 708
- Cutscene contract source `cutscene_push_recipes`: 707
- Cutscene contract source `director_notice_contracts`: 5
- Cutscene contract source `manual_route_recovery_contracts`: 64
- Cutscene contract source `push_implementation_queue`: 707
- Cutscene contract source `questdelegate_owner_probe_queue`: 700
- Cutscene contract source `snpc_payload_probe_contracts`: 29
- Cutscene contract source `template_scaffold_push_contracts`: 360
- Runtime unlock source `cutscene_alias_deferred_review`: 12
- Runtime unlock source `cutscene_alias_unlock_review`: 22
- Runtime unlock source `elevator_cutscene_probe_queue`: 11
- Runtime unlock source `eventupdate_tuple_probe_queue`: 12
- Runtime unlock source `first_live_runtime_probe_wave`: 64
- Runtime unlock source `first_payload_probe_wave`: 62
- Runtime unlock source `first_probe_wave`: 39
- Runtime unlock source `non_en_completed_cutscene_triage`: 569
- Runtime unlock source `non_en_exact_delegate_hazard_smoke_queue`: 116
- Runtime unlock source `non_en_exact_delegate_smoke_queue`: 67
- Runtime unlock source `non_en_missing_recovered_delegate_queue`: 68
- Runtime unlock source `non_en_scaffold_cutscene_queue`: 314
- Runtime unlock source `requested_gap_runtime_proof_queue`: 42
- Runtime unlock source `runtime_unlock_wave2`: 73
- Runtime unlock source `safe_smoke_targets`: 19
- Runtime unlock source `snpc_a8_capture_queue`: 5
- Runtime unlock source `sqb_private_materialization_queue`: 6
- Runtime unlock source `world_bnpc_callback_deferred_queue`: 7
- Runtime unlock source `world_bnpc_callback_probe_queue`: 19
- Instanced owner source `local_sequence_action_rows`: 236
- Instanced owner source `quest_text_clue_rows`: 126
- Instanced owner source `recovered_event_method_rows`: 187
- Instanced owner source `recovered_method_text_rows`: 117
- Instanced owner source `recovered_owner_hint_rows`: 185
- Instanced owner source `recovered_owner_scene_rows`: 185
- Instanced runtime source `actor_data_blocker_rows`: 1
- Instanced runtime source `adapter_gate_rows`: 18
- Instanced runtime source `alias_actor_multiplicity_rows`: 13
- Instanced runtime source `alias_payload_reconciliation_rows`: 41
- Instanced runtime source `alias_reconciliation_rows`: 44
- Instanced runtime source `battle_adapter_quest_rows`: 18
- Instanced runtime source `cutscene_return_state_rows`: 40
- Instanced runtime source `event_lifecycle_hazard_rows`: 37
- Instanced runtime source `event_owner_candidate_rows`: 10
- Instanced runtime source `gc_recovered_owner_gap_rows`: 6
- Instanced runtime source `gc_tail_monster_hint_rows`: 2
- Instanced runtime source `gc_tail_recovered_scenario_methods`: 36
- Instanced runtime source `gc_tail_recovery_rows`: 6
- Instanced runtime source `gc_target_hint_rows`: 6
- Instanced runtime source `instanced_per_quest_action_queue`: 18
- Instanced runtime source `local_actor_usage_rows`: 41
- Instanced runtime source `local_delegate_payload_rows`: 41
- Instanced runtime source `local_delegate_transition_rows`: 40
- Instanced runtime source `local_event_call_rows`: 42
- Instanced runtime source `local_handler_contract_rows`: 18
- Instanced runtime source `owner_hazard_rows`: 39
- Instanced runtime source `payload_smoke_matrix_rows`: 7
- Instanced runtime source `per_callsite_runtime_probe_rows`: 40
- Instanced runtime source `per_quest_event_contract_rows`: 18
- Instanced runtime source `per_quest_next_action_rows`: 18
- Instanced runtime source `recovered_client_event_method_rows`: 69
- Instanced runtime source `recovered_focus_rows`: 11
- Instanced runtime source `recovered_payload_branch_rows`: 40
- Instanced runtime source `reward_boundary_rows`: 18
- Instanced runtime source `runtime_probe_playbook_rows`: 18
- Instanced runtime source `scene_owner_reconciliation_rows`: 40
- Instanced runtime source `sequence_owner_reconciliation_rows`: 40
- Instanced runtime source `spawn_ready_probe_rows`: 4
- Instanced runtime source `sqb_blocked_followup_rows`: 14
- Instanced runtime source `sqb_director_recovery_rows`: 17
- Instanced runtime source `sqb_shell_gap_rows`: 13
- Instanced runtime source `sqb_spawn_probe_cases`: 4
- Instanced runtime source `totorak_cutscene_flow_rows`: 81
- Instanced runtime source `totorak_quest_sequence_rows`: 4
- Starter-city source `actor_surface_rows`: 59
- Starter-city source `choice_gate_rows`: 4
- Starter-city source `client_dialogue_rows`: 103
- Starter-city source `client_method_body_extracts`: 120
- Starter-city source `client_method_summary`: 120
- Starter-city source `client_signal_rows`: 258
- Starter-city source `content_spawn_atlas_rows`: 9
- Starter-city source `content_spawn_rows`: 15
- Starter-city source `counter_usage_rows`: 3
- Starter-city source `dat_marker_rows`: 60
- Starter-city source `delegate_push_call_rows`: 71
- Starter-city source `fight_route_matrix`: 3
- Starter-city source `flag_usage_rows`: 82
- Starter-city source `function_skeleton_rows`: 39
- Starter-city source `lifecycle_action_rows`: 41
- Starter-city source `local_constant_rows`: 135
- Starter-city source `local_marker_constants`: 15
- Starter-city source `marker_condition_rows`: 13
- Starter-city source `objective_crosscheck_rows`: 3
- Starter-city source `probe_commands`: 15
- Starter-city source `quest_summary`: 3
- Starter-city source `replay_scene_rows`: 7
- Starter-city source `reward_rows`: 5
- Starter-city source `runtime_probe_checklist`: 30
- Starter-city source `sequence_flow_rows`: 12
- Starter-city source `server_delegate_surface`: 71
- Starter-city source `source_delegate_call_rows`: 83
- Starter-city source `source_to_client_method_rows`: 83
- Starter-city source `transition_action_rows`: 86
- Seasonal item source `seasonal_item_atlas`: 47
- Seasonal item source `seasonal_quest_item_surface`: 14

## Matrix/Risk/SQB Layers

- Cutscene matrix rows: 6395
- Mutator/reward sync rows: 696
- SQB adapter rows: 481
- Lua script signature rows: 6974
- Lua script delta rows: 297
- Auxiliary CSV hit rows: 78170
- Cutscene matrix source `after_warp_cutscene_events`: 282
- Cutscene matrix source `blocker_method_spine_focus`: 433
- Cutscene matrix source `cutscene_implementation_gap_workqueue`: 540
- Cutscene matrix source `cutscene_push_template_candidates`: 612
- Cutscene matrix source `local_cutscene_delegate_inventory`: 1527
- Cutscene matrix source `local_delegate_event_callers`: 1519
- Cutscene matrix source `recovered_cutscene_push_matrix`: 612
- Cutscene matrix source `route_owner_patch_focus_queue`: 378
- Cutscene matrix source `scene_bearing_events_needing_local_push`: 367
- Cutscene matrix source `script_cutscene_gap_summary`: 125
- Mutator/reward source `addendum_current_quest_data_enrichment_queue`: 295
- Mutator/reward source `addendum_existing_bnpc_spawn_enrichment_candidates`: 8
- Mutator/reward source `addendum_private_bnpc_materialization_candidate`: 8
- Mutator/reward source `addendum_reward_display_sync_candidates`: 12
- Mutator/reward source `local_mutator_scan`: 297
- Mutator/reward source `reward_display_sync_scan`: 52
- Mutator/reward source `reward_display_wiki_review_queue`: 24
- SQB adapter source `fight_actor_mob_spawn_join`: 51
- SQB adapter source `fight_materialization_reward_lock_proof_queue`: 93
- SQB adapter source `fight_payload_probe_queue`: 93
- SQB adapter source `fight_sqb_push_operator_rows`: 55
- SQB adapter source `simplequestbattle_targets`: 55
- SQB adapter source `sqb_adapter_rows`: 55
- SQB adapter source `sqb_cutscene_dependency_queue`: 24
- SQB adapter source `sqb_reward_locked_queue`: 55
- Lua signature source `local_script`: 1190
- Lua signature source `recovered_script`: 5784
- Lua signature helper `after-warp cutscene helper`: 299
- Lua signature helper `content/SQB script helper`: 7
- Lua signature helper `cutscene push helper`: 392
- Lua signature helper `delegate event helper`: 204
- Lua signature helper `dialogue/ask helper`: 4593
- Lua signature helper `local script signature helper`: 606
- Lua signature helper `local template/scaffold wrapper`: 109
- Lua signature helper `quest state transition helper`: 186
- Lua signature helper `recovered route signature helper`: 500
- Lua signature helper `reward/inventory helper`: 24
- Lua signature helper `script file summary helper`: 54
- Lua delta `local_template_recovered_route`: 112
- Lua delta `local_under_recovered_call_surface`: 175
- Lua delta `low_signal_script_pair`: 10
- Auxiliary CSV helper `LPB broad decomp raw surface`: 59342
- Auxiliary CSV helper `LPB content-system auxiliary surface`: 5859
- Auxiliary CSV helper `LPB missing/recovered surface audit`: 750
- Auxiliary CSV helper `LPB source-term evidence surface`: 2897
- Auxiliary CSV helper `auxiliary cutscene surface`: 657
- Auxiliary CSV helper `auxiliary probe/workqueue surface`: 1580
- Auxiliary CSV helper `auxiliary quest-code CSV evidence`: 1582
- Auxiliary CSV helper `duplicate/raw normalized quest export`: 5503
- Auxiliary CSV source family `actions-traits-menu-decomp-20260705`: 38
- Auxiliary CSV source family `aetheryte_guildleve_travel_contract_20260619`: 1
- Auxiliary CSV source family `airship_ferry_transport_contract_20260619`: 50
- Auxiliary CSV source family `citystate-activation-path-decomp-atlas-20260703`: 43
- Auxiliary CSV source family `citystate-decor-probe-bridge-atlas-20260703`: 1366
- Auxiliary CSV source family `citystate-seasonal-furnishing-decomp-atlas-20260703`: 14
- Auxiliary CSV source family `citystate-seasonal-scheduler-decomp-atlas-20260703`: 4
- Auxiliary CSV source family `content_systems_20260612`: 1110
- Auxiliary CSV source family `content_systems_followup_20260615`: 4749
- Auxiliary CSV source family `custom_menu_widget_content_cutscene_decomp_20260618`: 33
- Auxiliary CSV source family `decomp_correlation_20260617`: 6408
- Auxiliary CSV source family `decomp_further_20260617`: 48994
- Auxiliary CSV source family `decomp_more_20260617`: 3940
- Auxiliary CSV source family `dungeon_exit_rect_adapter_contract_20260619`: 39
- Auxiliary CSV source family `dungeon_terminal_warp_contract_20260619`: 8
- Auxiliary CSV source family `event_surface_contract_deepdive_20260619`: 37
- Auxiliary CSV source family `hamlet_supply_noc002_contract_20260619`: 49
- Auxiliary CSV source family `instance_raid_director_base_contract_20260619`: 1
- Auxiliary CSV source family `loot_list_reward_surface_contract_20260619`: 7
- Auxiliary CSV source family `magitek_transporter_exit_adapter_contract_20260619`: 8
- Auxiliary CSV source family `map_layout_resource_data_20260621`: 1
- Auxiliary CSV source family `missing_event_surface_decomp_20260619`: 18
- Auxiliary CSV source family `missing_recovered_lua_surface_backlog_20260619`: 750
- Auxiliary CSV source family `native_boundary_scan_20260617`: 6
- Auxiliary CSV source family `private_area_base_content_contract_20260619`: 27
- Auxiliary CSV source family `quest-bnpc-materialization-candidate-atlas-20260630`: 26
- Auxiliary CSV source family `quest-cutscene-argument-atlas-20260630`: 44
- Auxiliary CSV source family `quest-cutscene-push-contract-atlas-20260630`: 27
- Auxiliary CSV source family `quest-cutscene-push-matrix-atlas-20260630`: 528
- Auxiliary CSV source family `quest-decomp-addendum-atlas-20260630`: 47
- Auxiliary CSV source family `quest-deep-push-probe-atlas-20260630`: 116
- Auxiliary CSV source family `quest-execution-atlas-20260630`: 527
- Auxiliary CSV source family `quest-implementation-roadmap-20260630`: 61
- Auxiliary CSV source family `quest-instance-bridge-atlas-20260630`: 1
- Auxiliary CSV source family `quest-instanced-cutscene-lifecycle-20260702`: 25
- Auxiliary CSV source family `quest-instanced-event-return-state-machine-20260702`: 26
- Auxiliary CSV source family `quest-instanced-event-text-owner-20260702`: 17
- Auxiliary CSV source family `quest-instanced-runtime-probe-packet-20260702`: 10
- Auxiliary CSV source family `quest-instanced-scene-payload-contract-20260702`: 10
- Auxiliary CSV source family `quest-instanced-sqb-probe-contract-20260702`: 17
- Auxiliary CSV source family `quest-instanced-unresolved-recovery-targets-20260702`: 16
- Auxiliary CSV source family `quest-master-gap-atlas-20260630`: 1008
- Auxiliary CSV source family `quest-next-runtime-unlock-atlas-20260630`: 131
- Auxiliary CSV source family `quest-normalized-data-pack-20260630`: 4495
- Auxiliary CSV source family `quest-push-command-blueprint-atlas-20260630`: 6
- Auxiliary CSV source family `quest-push-payload-execution-atlas-20260630`: 115
- Auxiliary CSV source family `quest-route-owner-inference-atlas-20260630`: 16
- Auxiliary CSV source family `quest-runtime-deep-atlas-20260630`: 2
- Auxiliary CSV source family `quest-runtime-probe-atlas-20260630`: 4
- Auxiliary CSV source family `quest-runtime-proof-gap-atlas-20260630`: 5
- Auxiliary CSV source family `quest-safe-push-enablement-atlas-20260630`: 67
- Auxiliary CSV source family `quest-sqb-adapter-atlas-20260630`: 34
- Auxiliary CSV source family `quest-universal-push-operator-atlas-20260630`: 5
- Auxiliary CSV source family `quest_content_widget_contract_20260619`: 12
- Auxiliary CSV source family `quest_cutscene_bridge_contract_20260619`: 6
- Auxiliary CSV source family `quest_scenario_parity_contract_20260619`: 1289
- Auxiliary CSV source family `raid_dungeon_warp_binding_contract_20260619`: 24
- Auxiliary CSV source family `relic_coffer_key_reward_contract_20260619`: 27
- Auxiliary CSV source family `retainer_market_search_20260617`: 9
- Auxiliary CSV source family `reward_inventory_chest_contract_20260619`: 3
- Auxiliary CSV source family `scaffold_quest_replacement_contract_20260619`: 5
- Auxiliary CSV source family `side_world_quest_gap_contract_20260619`: 1368
- Auxiliary CSV source family `simple_quest_battle_director_contract_20260619`: 192
- Auxiliary CSV source family `talk_command_terminal_entry_contract_20260619`: 140
- Auxiliary CSV source family `terminal_widget_command_bridge_contract_20260619`: 8

## Battle Breadcrumbs

- Battle candidate rows: 98
- `gla200` All Bark and No Bite: ala_mhigan_challenger actor `2289006` status `sql_note_quest_breadcrumb`
- `gla300` Unalienable Rights: j_moldva actor `2289009` status `sql_note_quest_breadcrumb`
- `gla306` Thrill of the Fight: ala_mhigan_challenger actor `2289007` status `sql_note_quest_breadcrumb`
- `gla306` Thrill of the Fight: ala_mhigan_bladedancer actor `2289010` status `sql_note_quest_breadcrumb`
- `pgl200` The House Always Wins: toothless_gladiator actor `2289013` status `sql_note_quest_breadcrumb`
- `pgl300` Here There Be Pirates: kraken_deckhand actor `2280217` status `sql_note_quest_breadcrumb`
- `pgl306` Two Sides to Every Chip: ossuary_almstaker actor `2289014` status `sql_note_quest_breadcrumb`
- `com0g1` Breaking the Seals: scalelizard_fire_quest_com0g1 actor `2202206` status `mob_type_ready_spawn_missing`
- `com0g1` Breaking the Seals:  actor `2202206` status `no_mob_type`
- `com0l1` The Price of Integrity: basilisk_lesser_quest_com0l1 actor `2200708` status `mob_type_ready_spawn_missing`
- `com0l1` The Price of Integrity:  actor `2200708` status `no_mob_type`
- `com0u1` Career Opportunities: raptor_forest_quest_com0u1 actor `2200205` status `mob_type_ready_spawn_missing`
- `com0u1` Career Opportunities:  actor `2200205` status `no_mob_type`
- `com0u4` Arms Race: wolf_standard_faction_emp1 actor `2109801` status `mob_type_ready_spawn_missing`
- `com0u4` Arms Race:  actor `2109801` status `no_mob_type`
- `com0u6` Know Your Enemy: charledore actor `2289025` status `actor_id_only_manual_recovery`
- `com0u6` Know Your Enemy:  actor `2289025` status `no_mob_type`
- `blm0j3` International Relations: ragged_hippocerf actor `2200406` status `sql_note_quest_breadcrumb`
- `blm0j3` International Relations: whitetalon actor `2200407` status `sql_note_quest_breadcrumb`
- `mnk0j6` Return of the King...of Ruin: widargelt_the_watcher actor `2289039` status `sql_note_quest_breadcrumb`

## Scene Coverage

- Scene index rows: 523
- Replay payload rows: 522
- Dialogue/text rows: 21500
- Full quest text-sheet rows: 23736
- Quest text-sheet coverage rows: 297
- Quests with recovered scene/replay rows: 125
- Replay `dynamic_placeholder_payload`: 41
- Replay `snpc_raw_tuple`: 33
- Replay `snpc_raw_tuple_plus_initial_town_extra`: 1
- Replay `snpc_raw_tuple_plus_sexuality_skin`: 2
- Replay `static_no_dynamic_payload`: 445
- Text-sheet helper `ask/choice text helper`: 99
- Text-sheet helper `dynamic item/sheet text helper`: 191
- Text-sheet helper `empty or non-English text row review`: 2
- Text-sheet helper `missing dat-mining quest text sheet`: 1
- Text-sheet helper `recovered dialogue text helper`: 14092
- Text-sheet helper `unreferenced quest text review`: 9351
- Text-sheet coverage `all_sheet_text_referenced`: 70
- Text-sheet coverage `has_unreferenced_sheet_text`: 226
- Text-sheet coverage `missing_text_sheet`: 1

## Probe And Helper Layer

- Probe command hint rows: 5487
- Helper recommendation rows: 297

- `ask_widget_probe`: 179
- `cutscene_delegate_probe`: 506
- `manual_review_probe`: 81
- `reward_or_state_audit`: 266
- `snpc_delegate_probe`: 37
- `talk_delegate_probe`: 4418

Top helper recommendation samples:

| Code | Quest | Helpers | Sample Commands |
| --- | --- | --- | --- |
| `alc200` | Sleep, Cousin of Death | LPB method/call surface helpers; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; delegateEvent; payload/EventUpdate proof helpers; execution addendum helpers; runtime unlock/proof helpers; cutscene argument/runtime payload helpers; route owner inference helpers; delegateEvent / delegateEventWithArgList; mutator/reward sync helpers; delegateEventAndAdvanceIfAccepted if accepted/declined route is proven | !questdelegate quest:110420 processEventNogeloixStart; !questdelegate quest:110420 processEvent020; !questdelegate quest:110420 processEvent030; !questdelegate quest:110420 processEvent015_6; !questdelegate quest:110420 processEvent010; !questdelegate quest:110420 processEvent015; !questdelegate quest:110420 processEvent005_2; !questdelegate quest:110420 processEvent005_3 |
| `alc300` | The Boy and the Dragon Gay | LPB method/call surface helpers; delegateEvent; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; payload/EventUpdate proof helpers; execution addendum helpers; runtime unlock/proof helpers; cutscene argument/runtime payload helpers; route owner inference helpers; delegateEvent / delegateEventWithArgList; delegateEventAndAdvanceIfAccepted if accepted/declined route is proven; mutator/reward sync helpers | !questdelegate quest:110421 processEvent010; !questdelegate quest:110421 processEvent020; !questdelegate quest:110421 processEvent008_3; !questdelegate quest:110421 processEvent008_5; !questdelegate quest:110421 processEventNogeloixStart; !questdelegate quest:110421 processEvent003; !questdelegate quest:110421 processEvent005; !questdelegate quest:110421 processEvent007 |
| `alc306` | Dream On, Dream Away | LPB method/call surface helpers; delegateEvent; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; execution addendum helpers; payload/EventUpdate proof helpers; runtime unlock/proof helpers; cutscene argument/runtime payload helpers; route owner inference helpers; delegateEvent / delegateEventWithArgList; mutator/reward sync helpers; completeQuestWithRewards / quest data helpers only after proof | !questdelegate quest:110422 processEvent010; !questdelegate quest:110422 processEvent030; !questdelegate quest:110422 processEvent005; !questdelegate quest:110422 processEventSlyhhiaStart; !questdelegate quest:110422 processEvent000; !questdelegate quest:110422 processEvent008; !questdelegate quest:110422 processEvent009; !questdelegate quest:110422 processEvent009_2 |
| `arc200` | Filling the Quiver | LPB method/call surface helpers; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; payload/EventUpdate proof helpers; execution addendum helpers; delegateEvent; runtime unlock/proof helpers; cutscene argument/runtime payload helpers; route owner inference helpers; delegateEvent / delegateEventWithArgList; mutator/reward sync helpers; completeQuestWithRewards / quest data helpers only after proof | !questdelegate quest:110160 processEvent010; !questdelegate quest:110160 processEvent020; !questdelegate quest:110160 processEvent030; !questdelegate quest:110160 processEvent040; !questdelegate quest:110160 processEvent050; !questdelegate quest:110160 processEventNonolatoStart; !questdelegate quest:110160 processEvent005_2; !questdelegate quest:110160 processEvent005_3 |
| `arc300` | The Foreboding Forest | LPB method/call surface helpers; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; execution addendum helpers; payload/EventUpdate proof helpers; delegateEvent; runtime unlock/proof helpers; delegateEvent / delegateEventWithArgList; cutscene argument/runtime payload helpers; route owner inference helpers; mutator/reward sync helpers; completeQuestWithRewards / quest data helpers only after proof | !questdelegate quest:110161 processEvent010; !questdelegate quest:110161 processEvent015; !questdelegate quest:110161 processEvent020; !questdelegate quest:110161 processEvent027; !questdelegate quest:110161 processEvent030; !questdelegate quest:110161 processEvent040; !questdelegate quest:110161 processEvent050; !questdelegate quest:110161 processEventNonolatoStart |
| `arc306` | There Can Be Only One | LPB method/call surface helpers; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; execution addendum helpers; payload/EventUpdate proof helpers; delegateEvent; runtime unlock/proof helpers; delegateEvent / delegateEventWithArgList; cutscene argument/runtime payload helpers; route owner inference helpers; mutator/reward sync helpers; completeQuestWithRewards / quest data helpers only after proof | !questdelegate quest:110162 processEvent010; !questdelegate quest:110162 processEvent020; !questdelegate quest:110162 processEvent030; !questdelegate quest:110162 processEvent040; !questdelegate quest:110162 processEvent050; !questdelegate quest:110162 processEventNonolatoStart; !questdelegate quest:110162 processEvent005_2; !questdelegate quest:110162 processEvent005_3 |
| `bsm200` | An Ear for Quality | LPB method/call surface helpers; delegateEvent; cutscene contract/push recipe helpers; execution addendum helpers; payload/EventUpdate proof helpers; cutscene matrix/local delegate helpers; cutscene argument/runtime payload helpers; route owner inference helpers; runtime unlock/proof helpers; delegateEvent / delegateEventWithArgList; mutator/reward sync helpers; completeQuestWithRewards / quest data helpers only after proof | !questdelegate quest:110320 processEvent005; !questdelegate quest:110320 processEvent010; !questdelegate quest:110320 processEvent020; !questdelegate quest:110320 processEventBodenolfStart; !questdelegate quest:110320 processEvent005_2; !questdelegate quest:110320 processEvent005_3; !questdelegate quest:110320 processEvent005_4; !questdelegate quest:110320 processEvent005_5 |
| `bsm300` | Song of the Sirens | LPB method/call surface helpers; delegateEvent; cutscene contract/push recipe helpers; payload/EventUpdate proof helpers; execution addendum helpers; cutscene matrix/local delegate helpers; cutscene argument/runtime payload helpers; route owner inference helpers; runtime unlock/proof helpers; delegateEvent / delegateEventWithArgList; mutator/reward sync helpers; completeQuestWithRewards / quest data helpers only after proof | !questdelegate quest:110321 processEvent010; !questdelegate quest:110321 processEvent015; !questdelegate quest:110321 processEvent020; !questdelegate quest:110321 processEvent030; !questdelegate quest:110321 processEvent040; !questdelegate quest:110321 processEventBodenolfStart; !questdelegate quest:110321 processEvent003; !questdelegate quest:110321 processEvent004 |
| `bsm306` | The Sound of Silence | LPB method/call surface helpers; cutscene matrix/local delegate helpers; cutscene contract/push recipe helpers; payload/EventUpdate proof helpers; delegateEvent; execution addendum helpers; cutscene argument/runtime payload helpers; route owner inference helpers; delegateEventAndAdvanceIfAccepted if accepted/declined route is proven; runtime unlock/proof helpers; delegateEvent / delegateEventWithArgList; implementation blueprint helpers | !questdelegate quest:110322 processEvent010; !questdelegate quest:110322 processEvent020; !questdelegate quest:110322 processEvent030; !questdelegate quest:110322 processEvent040; !questdelegate quest:110322 processFadeOut; !questdelegate quest:110322 processFadeIn; !questdelegate quest:110322 danceIsland_problem01; !questdelegate quest:110322 danceIsland_problem02 |
| `cnj200` | Dendrological Duties | LPB method/call surface helpers; delegateEvent; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; execution addendum helpers; payload/EventUpdate proof helpers; runtime unlock/proof helpers; delegateEvent / delegateEventWithArgList; cutscene argument/runtime payload helpers; route owner inference helpers; mutator/reward sync helpers | !questdelegate quest:110260 processEventSoileineStart; !questdelegate quest:110260 processEvent020; !questdelegate quest:110260 processEvent030; !questdelegate quest:110260 processEvent010_2; !questdelegate quest:110260 processEvent010_3; !questdelegate quest:110260 processEvent010_4; !questdelegate quest:110260 processEvent010_5; !questdelegate quest:110260 processEvent010_6 |
| `cnj300` | Good Knight, Sweet Dreams | LPB method/call surface helpers; cutscene contract/push recipe helpers; cutscene matrix/local delegate helpers; delegateEvent; payload/EventUpdate proof helpers; execution addendum helpers; runtime unlock/proof helpers; delegateEvent / delegateEventWithArgList; cutscene argument/runtime payload helpers; route owner inference helpers; mutator/reward sync helpers; completeQuestWithRewards / quest data helpers only after proof | !questdelegate quest:110261 processEvent010; !questdelegate quest:110261 processEvent020; !questdelegate quest:110261 processEvent030; !questdelegate quest:110261 processEvent040; !questdelegate quest:110261 processEvent050; !questdelegate quest:110261 processEvent060; !questdelegate quest:110261 processEvent070; !questdelegate quest:110261 processEventSoileineStart |
| `cnj306` | The Call of Nature | LPB method/call surface helpers; cutscene matrix/local delegate helpers; cutscene contract/push recipe helpers; payload/EventUpdate proof helpers; execution addendum helpers; delegateEvent; runtime unlock/proof helpers; cutscene argument/runtime payload helpers; route owner inference helpers; delegateEvent / delegateEventWithArgList; implementation blueprint helpers; delegateEventAndAdvanceIfAccepted if accepted/declined route is proven | !questdelegate quest:110262 processEvent010; !questdelegate quest:110262 processEvent020; !questdelegate quest:110262 processEvent030; !questdelegate quest:110262 processEvent040; !questdelegate quest:110262 processEvent050; !questdelegate quest:110262 processEvent060; !questdelegate quest:110262 processEvent070; !questdelegate quest:110262 processEvent080 |

## Family Summary

| Category | Family | Quests | Missing | Scaffold | Stub | Handwritten | Scene Quests | Battle Rows | Objective Rows | Spawn Points | Director Rows |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| class | `alc` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `arc` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 4 |
| class | `bsm` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `cnj` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 4 |
| class | `cul` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `exc` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 4 |
| class | `fsh` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `gla` | 3 | 0 | 0 | 3 | 0 | 3 | 3 | 0 | 0 | 4 |
| class | `gld` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `hrv` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 4 |
| class | `lnc` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `min` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `pgl` | 3 | 0 | 0 | 2 | 1 | 3 | 3 | 0 | 0 | 4 |
| class | `tan` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `thm` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 3 |
| class | `wdk` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 4 |
| class | `wvr` | 3 | 0 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | 4 |
| default_talk | `defaulttalk` | 6 | 0 | 0 | 0 | 5 | 0 | 0 | 0 | 0 | 0 |
| grand_company | `com` | 27 | 0 | 0 | 6 | 21 | 12 | 5 | 10 | 0 | 12 |
| grand_company | `gcg` | 14 | 0 | 0 | 14 | 0 | 2 | 0 | 0 | 0 | 8 |
| grand_company | `gcl` | 14 | 0 | 0 | 14 | 0 | 6 | 0 | 0 | 0 | 9 |
| grand_company | `gcu` | 14 | 0 | 0 | 14 | 0 | 2 | 0 | 0 | 0 | 9 |
| job | `blm` | 6 | 0 | 0 | 6 | 0 | 2 | 1 | 0 | 0 | 3 |
| job | `brd` | 6 | 0 | 0 | 6 | 0 | 2 | 0 | 0 | 0 | 3 |
| job | `drg` | 6 | 0 | 0 | 6 | 0 | 3 | 0 | 0 | 0 | 2 |
| job | `mnk` | 6 | 0 | 0 | 6 | 0 | 3 | 1 | 0 | 0 | 2 |
| job | `pld` | 6 | 0 | 0 | 6 | 0 | 3 | 1 | 0 | 0 | 3 |
| job | `war` | 6 | 0 | 0 | 6 | 0 | 2 | 0 | 0 | 0 | 3 |
| job | `whm` | 6 | 0 | 0 | 6 | 0 | 4 | 1 | 0 | 0 | 3 |
| main_scenario | `man` | 19 | 0 | 4 | 0 | 15 | 19 | 2 | 0 | 0 | 31 |
| primal | `sum` | 4 | 0 | 4 | 0 | 0 | 0 | 2 | 0 | 0 | 0 |
| seasonal | `spl` | 14 | 0 | 6 | 0 | 2 | 1 | 0 | 0 | 0 | 0 |
| side_special_misc | `etc` | 73 | 0 | 1 | 0 | 72 | 11 | 27 | 54 | 46 | 16 |
| system | `noc` | 4 | 0 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| tutorial | `trl` | 3 | 0 | 1 | 0 | 2 | 2 | 0 | 0 | 0 | 0 |
| world_sidequest | `wld` | 12 | 0 | 0 | 0 | 12 | 0 | 5 | 7 | 15 | 0 |

## Notes

- SQL battle-note matches are breadcrumbs only. They do not prove spawn trigger, director ownership, win condition, or cleanup.
- Probe commands are static hints. Confirm payload shape and return values before adding live quest logic.
- `quest_replay_payload_index.csv` uses corrected SNPC replay slot hints: `-201` nickname, `-202` raw skin, `-203` personality, `-204` coordinate, `-205` initial town.
- Full text-sheet rows include unreferenced localized strings; treat those as branch/static text evidence, not proof of live route order.
- Raw Dat Mining rows preserve numbered fields as evidence; decoded names are limited to high-confidence title, branch, item, marker, reward, and replay joins.
- Journal reference rows resolve `xtx_quest` formulas into `xtx_journalxtx*` rows; branch-state ordering is inferred from nearby `$E8(1)` conditions.
- Dat cutReplay rows compare raw replay payload/title rows with recovered replay rows; raw-only rows are recovery leads, not automatic enablement.
- Dat crosscheck deltas flag mismatched data surfaces; they are review targets, not automatic script or SQL edits.
- Item references resolve `xtx/itemName` and reward ids through Dat Mining item sheets; missing lookups need manual confirmation before use.
- Reward rows are evidence for UI/auto-grant review, not permission to duplicate grants in Lua.
- Marker and actor-surface rows are evidence for sequence/NPC setup; confirm live route ownership before enabling.
- Marker/actor resolution rows join display names, map places, actor class candidates, appearances, and spawn samples; those joins are implementation clues, not ownership proof.
- Server flow calls are filtered to included quest codes and exclude shared template rows.
- BNPC objective and spawn point rows are implementation breadcrumbs; verify callbacks, lifetime, and cleanup before materialization.
- Execution, probe, enablement, roadmap, and push-operator rows are planning evidence only; this pack does not change offerability gates.
- Runtime deep/proof/blueprint rows are evidence and work queues only; they still require live payload/owner proof before patching quest behavior.
- Contract, unlock, instanced, starter-city, and seasonal item rows are additional decomp evidence; they do not imply safe quest enablement by themselves.
- Matrix, mutator/reward sync, and SQB adapter rows are audit/proof evidence; review live callbacks and reward locks before script or SQL changes.
- Lua script signature and delta rows are static parse evidence only; confirm route order and event callback ownership before replacing local wrappers.
- Auxiliary CSV hit rows are source-preservation evidence from raw exports; dedupe against named indices before implementing.
- Normalized marker seed backlog rows outside this real-title scope: 366.
- Recovered method order is file order from the decompiled Lua, not guaranteed route order.
- Raw quest dimension rows: 628
- Skipped `[en]` placeholder rows: 223
- Skipped rows with no quest id/title: 108
- Other skipped rows: 0
