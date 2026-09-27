# Quest Next Runtime Unlock Atlas - 2026-06-30

Generated output directory: `outputs\quest-next-runtime-unlock-atlas-20260630`

## Why This Exists

The previous pass added private SQB mob-type SQL for four Grand Company fights. This atlas turns that new static state into the next live proof queue, while keeping open-world BNPCs, cutscene exact-delegate routes, and reward behavior locked behind runtime evidence.

## Output Counts

- `eventupdate_tuple_probe_queue`: 12
- `snpc_a8_capture_queue`: 5
- `after_warp_lifetime_seed_queue`: 6
- `elevator_cutscene_probe_queue`: 11
- `instance_scene_none_lifecycle_queue`: 11
- `occupancy_unknown_role_scene_probe_queue`: 10
- `instanced_per_quest_action_queue`: 18
- `sqb_private_materialization_queue`: 6
- `applied_private_sqb_mob_proof_queue`: 0
- `blocked_sqb_actor_recovery_queue`: 1
- `blocked_bnpc_actor_recovery_queue`: 6
- `world_bnpc_callback_probe_queue`: 19
- `world_bnpc_callback_deferred_queue`: 7
- `cutscene_alias_unlock_review`: 22
- `cutscene_alias_deferred_review`: 12
- `non_en_scene_alias_payload_hazard_queue`: 4
- `non_en_exact_delegate_hazard_smoke_queue`: 116
- `non_en_exact_delegate_smoke_queue`: 67
- `non_en_missing_recovered_delegate_queue`: 68
- `hidden_class_tail_loaders`: 51
- `current_class_scaffold_enrichment`: 101
- `non_en_scaffold_cutscene_queue`: 314
- `non_en_completed_cutscene_triage`: 569
- `requested_quest_decomp_rollup`: 126
- `requested_gap_runtime_proof_queue`: 42
- `safe_smoke_targets`: 20
- `runtime_unlock_wave2`: 136
- `source_manifest`: 36
- `summary`: 101

## Summary

- `rows:eventupdate_tuple_probe_queue`: 12
- `rows:snpc_a8_capture_queue`: 5
- `rows:after_warp_lifetime_seed_queue`: 6
- `rows:elevator_cutscene_probe_queue`: 11
- `rows:instance_scene_none_lifecycle_queue`: 11
- `rows:occupancy_unknown_role_scene_probe_queue`: 10
- `rows:instanced_per_quest_action_queue`: 18
- `rows:sqb_private_materialization_queue`: 6
- `rows:applied_private_sqb_mob_proof_queue`: 0
- `rows:blocked_sqb_actor_recovery_queue`: 1
- `rows:blocked_bnpc_actor_recovery_queue`: 6
- `rows:world_bnpc_callback_probe_queue`: 19
- `rows:world_bnpc_callback_deferred_queue`: 7
- `rows:cutscene_alias_unlock_review`: 22
- `rows:cutscene_alias_deferred_review`: 12
- `rows:non_en_scene_alias_payload_hazard_queue`: 4
- `rows:non_en_exact_delegate_hazard_smoke_queue`: 116
- `rows:non_en_exact_delegate_smoke_queue`: 67
- `rows:non_en_missing_recovered_delegate_queue`: 68
- `rows:hidden_class_tail_loaders`: 51
- `rows:current_class_scaffold_enrichment`: 101
- `rows:non_en_scaffold_cutscene_queue`: 314
- `rows:non_en_completed_cutscene_triage`: 569
- `rows:requested_quest_decomp_rollup`: 126
- `rows:requested_gap_runtime_proof_queue`: 42
- `rows:safe_smoke_targets`: 20
- `rows:runtime_unlock_wave2`: 136
- `rows:source_manifest`: 36
- `eventupdate_tuple_seed_rows`: 12 typed EventUpdate return tuple capture required before push widening
- `snpc_a8_targeted_seed_rows`: 5 A8/branch meanings are static inferences until live capture
- `after_warp_seed:first`: 5 event lifetime proof before after-warp alias patching
- `after_warp_seed:hold`: 1 SNPC-heavy after-warp rows held until SNPC/A8 logging exists
- `elevator_cutscene_probe:ready`: 6 owner-resolved elevator cutscenes ready for lifetime proof
- `elevator_cutscene_probe:owner_resolution_required`: 5 placeholder owner-selector rows must capture natural EventStart owner first
- `instance_lifecycle_seed_rows`: 11 scene=none, Toto-Rak/Dzemael legacy occupancy, Hamlet, and Rivenroad hard log-only probes
- `occupancy_unknown_role_scene_probe:rows`: 10 queue-only raw scene-key probes; role and side effects unknown
- `occupancy_unknown_role_scene_probe:totorak`: 5 rad0f301-rad0f305 after known Toto-Rak occupancy lifecycle proof
- `occupancy_unknown_role_scene_probe:dzemael`: 5 rad0r101-rad0r105 after known Dzemael occupancy lifecycle proof
- `instanced_per_quest_action:rows`: 18 per-quest dungeon/trial/GC-tail action rows from the instanced runtime packet
- `instanced_per_quest_action:runnable`: 11 listed commands exist but still require event tuple/lifetime capture
- `instanced_per_quest_action:recovery_only`: 7 blocked actor-data or GC-tail owner recovery rows
- `instanced_per_quest_action:gc_tail_owner_recovery`: 6 GC template tails need real owner scene route before Lua/template changes
- `instanced_per_quest_action:gc_tail_enriched_context`: 6 GC-tail rows joined to recovered scenario methods and monster hints
- `instanced_per_quest_action:requested_overlap`: 18 instanced action rows that overlap the user's named quest batch
- `sqb_private:positive_control`: 1 man0u0 lifecycle smoke before GC SQB escalation
- `sqb_private:sql_present_live_required`: 0 static SQL exists but private materialization/reward-lock proof is missing
- `sqb_private:check_only_blocked_actor_path`: 1 com0u6 remains actor-path recovery only
- `sql_status:present_private_mob_type_only`: 0 static SQL present; live materialization still missing
- `blocked_bnpc_actor_path_recovery`: 6 BNPC objective actor ids with blank recovered actor paths; no SQL/spawn proposal
- `cutscene_unlock_gate:after_warp_lifetime_probe_first`: 0 do not patch before event lifetime proof
- `cutscene_unlock_gate:owner_resolution_probe_first`: 0 natural EventStart owner required
- `cutscene_unlock_gate:existing_exact_delegate_smoke`: 22 local Lua already calls recovered methods; smoke route/lifetime, do not patch
- `world_bnpc_probe_before_sql_or_spawn`: 19 actor path exists but callback/zone proof is live-only
- `world_bnpc_deferred_after_first_slice`: 7 not in first 12 wave rows but preserved for follow-up
- `cutscene_alias_deferred_after_first_slice`: 12 not in first 10 wave rows but preserved for follow-up
- `non_en_scene_alias_payload_hazard:rows`: 4 real-named local scene-key delegates whose recovered wrappers need payload/lifetime proof
- `non_en_scene_alias_payload_hazard:snpc_payload`: 4 SNPC tuple or extra args required before replacing local scene-key delegate
- `non_en_scene_alias_payload_hazard:after_warp`: 4 after-warp lifetime must stay open through the recovered wrapper
- `non_en_exact_delegate_hazard:rows`: 116 real-named exact delegates with after-warp or mutation-boundary hazards
- `non_en_exact_delegate_hazard:after_warp`: 116 existing recovered delegates that need after-warp lifetime smoke
- `non_en_exact_delegate_hazard:mutation_boundary`: 0 existing recovered delegates that need mutation/reward-boundary logging
- `non_en_exact_delegate_smoke:rows`: 67 real-named recovered methods already delegated by local Lua
- `non_en_exact_delegate_smoke:visible_or_targeted`: 5 safe-enable atlas marks these as visible or targeted smoke candidates
- `non_en_exact_delegate_smoke:after_warp`: 0 natural route already delegates recovered method and needs warp/fade lifetime capture
- `non_en_exact_delegate_smoke:log_only`: 58 keep route hidden/log-only while smoking owner/result timing
- `non_en_missing_recovered_delegate:rows`: 68 unique real-named handwritten cutscene delegates missing from local Lua
- `non_en_missing_recovered_delegate:direct`: 46 concrete no-mutation questevent + questdelegate probe targets
- `non_en_missing_recovered_delegate:local_route_missing`: 68 local Lua lacks an exact recovered delegate callsite; GM direct probe is not route proof
- `non_en_missing_recovered_delegate:gm_direct_probe_only`: 63 can test recovered client method directly while normal Lua wiring remains unproven
- `non_en_missing_recovered_delegate:after_warp`: 12 requires event lifetime proof through warp/fade before Lua patching
- `non_en_missing_recovered_delegate:owner_unresolved`: 5 no-mutation probe exists but natural owner must be captured
- `non_en_missing_recovered_delegate:payload_gated`: 5 SNPC or typed payload arguments must be captured before replay
- `hidden_class_tail_loader:inittext_only`: 47 no recovered route surface; noOffer loader/reference only
- `hidden_class_tail_loader:route_probe`: 4 has recovered route/cutscene surface but still log-only
- `current_class_scaffold:offerable`: 0 requires explicit offer=true and noOffer!=true
- `current_class_scaffold:no_offer`: 51 hidden/log-only rows only
- `current_class_scaffold:hidden_by_offer_gate`: 50 loaded metadata but no quest flags/journal/accept/reward without offer=true
- `non_en_scaffold_cutscene:rows`: 314 real-named scaffold cutscene seeds excluding [en] placeholders
- `non_en_scaffold_cutscene:direct_no_mutation_probe`: 278 concrete questevent + questdelegate quest:<id> command is present
- `non_en_scaffold_cutscene:payload_gated`: 36 SNPC tuple or extra args must be captured before delegate replay
- `non_en_scaffold_cutscene:after_warp_direct`: 144 direct commands still require event lifetime capture through warp/fade
- `non_en_completed_cutscene_triage:rows`: 569 combined real-named non-[en] cutscene triage rows
- `non_en_completed_cutscene_triage:implemented_different_alias`: 4 local scene-key route differs from recovered delegate wrapper
- `non_en_completed_cutscene_triage:missing_recovered_delegate`: 68 recovered cutscene method is missing from local Lua route surface
- `non_en_completed_cutscene_triage:payload_gated`: 45 payload/SNPC tuple capture is required before replay or replacement
- `non_en_completed_cutscene_triage:requested_overlap`: 402 triage rows that overlap the user's named quest batch
- `requested_quest_rollup:rows`: 126 one row per user-requested quest title
- `requested_quest_rollup:matched`: 126 title matched at least one current atlas row
- `requested_quest_rollup:unmatched`: 0 title not found in current generated atlases; manual title/data review
- `requested_quest_rollup:scaffold_direct`: 32 best next action is a concrete no-mutation scaffold delegate probe
- `requested_quest_rollup:scene_alias_payload_hazard`: 1 best next action is payload/lifetime capture for local scene-key alias hazards
- `requested_quest_rollup:exact_delegate_hazard`: 20 best next action is smoke/logging of existing exact delegate hazards
- `requested_quest_rollup:exact_delegate_smoke`: 8 best next action is natural-route smoke of a local recovered delegate
- `requested_quest_rollup:runtime_wave2`: 14 best next action is already in the ordered wave2 runtime queue
- `requested_quest_rollup:instanced_per_quest_probe`: 1 best next action is a per-quest instanced probe with event logging
- `requested_quest_rollup:instanced_per_quest_recovery`: 6 best next action is GC-tail/actor-data recovery before Lua/template changes
- `requested_gap_runtime_proof:rows`: 42 gap-only requested quests resolved to the safest proof route available
- `requested_gap_runtime_proof:status_or_cutscene_command_ready`: 19 rows with a concrete GM/status/probe command
- `requested_gap_runtime_proof:gc_battle_metadata_status_probe`: 0 missing GC_BATTLES rows now status-only blocked probes
- `requested_gap_runtime_proof:preserve_local_push`: 0 local QFLAG_PUSH/onPush route must be preserved before SQB comparison
- `requested_gap_runtime_proof:missing_delegate_cutscene`: 1 missing recovered delegate has a no-mutation questdelegate probe

## Next Best Live Pass

1. Start with `eventupdate_tuple_probe_queue.csv`; typed EventUpdate return tuples are the common dependency for cutscenes, SNPC/A8, and after-warp proof.
2. Run `snpc_a8_capture_queue.csv` before escalating SNPC-heavy after-warp rows; A8 meanings remain inferred until logged, and `@unknown:*` placeholders must be replaced with captured typed values before execution.
3. Use `after_warp_lifetime_seed_queue.csv`, `elevator_cutscene_probe_queue.csv`, and `instance_scene_none_lifecycle_queue.csv` to prove event/content lifecycle before patching replay or alias rows.
4. After the Toto-Rak/Dzemael lifecycle rows pass, use `occupancy_unknown_role_scene_probe_queue.csv` only as raw scene-key transport proof; do not promote unknown scenes to aliases or lifecycle roles from render success.
5. Use `instanced_per_quest_action_queue.csv` for per-quest dungeon/trial/GC-tail routes; runnable rows still need event logging, while GC-tail rows remain recovery-only and now carry recovered scenario methods plus monster-hint caveats.
6. Run `sqb_private_materialization_queue.csv`; treat `man0u0` as the positive control, SQL-present GC rows as live-required, and `com0u6` as check-only/blocked actor-path recovery.
7. Keep `blocked_sqb_actor_recovery_queue.csv` and `blocked_bnpc_actor_recovery_queue.csv` log-only; do not add SQL/spawn rows from blank actor paths.
8. Use `world_bnpc_callback_probe_queue.csv` and `cutscene_alias_unlock_review.csv` first slices before their deferred queues.
9. Keep `hidden_class_tail_loaders.csv` no-offer/log-only; initText-only rows are references, not gameplay.
10. Use `non_en_scene_alias_payload_hazard_queue.csv` for real-named routes that still call a scene key where recovery found an SNPC/after-warp wrapper; capture payload and lifetime before replacing Lua.
11. Use `non_en_exact_delegate_hazard_smoke_queue.csv` for real-named routes that already call recovered methods but still need after-warp/mutation-boundary logging.
12. Use `non_en_scaffold_cutscene_queue.csv` for real-named scaffold quests only after the higher-risk owner/lifetime queues; direct rows have concrete `!questevent` + `!questdelegate quest:<id>` commands, while SNPC/extra-arg rows remain payload-gated.
13. Use `non_en_exact_delegate_smoke_queue.csv` to regression-smoke already-implemented recovered delegates such as side/tutorial routes; these are natural-route captures, not Lua patch requests.
14. Use `non_en_missing_recovered_delegate_queue.csv` for completed real-named handwritten quests whose recovered cutscene delegates are still missing locally; direct rows are GM direct no-mutation probes, not proof that the normal Lua route is wired or patch permission.
15. Use `non_en_completed_cutscene_triage.csv` as the broad completed/non-[en] cutscene routing index; it highlights implemented-different aliases, missing recovered delegates, and scaffold payload gates without overriding source queue guardrails.
16. Use `requested_quest_decomp_rollup.csv` as the top-level checklist for the named quest batch; gap-only rows now include proof statuses and first runtime/status commands from `requested_gap_runtime_proof_queue.csv`.
17. Use `requested_gap_runtime_proof_queue.csv` for those guarded gap-only requested rows; it separates status-only SQB/GC blockers, preserved local push routes, BNPC recovery probes, and missing recovered-delegate GM direct probes that still need natural-route proof.
