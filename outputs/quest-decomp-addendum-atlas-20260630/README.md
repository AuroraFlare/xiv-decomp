# Quest Decomp Addendum Atlas - 2026-06-30

This atlas captures the next decomp additions after the runtime proof gap pass.
It intentionally separates safe hidden loaders from runtime-unproven gameplay.

## Outputs

- `safe_hidden_class_tail_additions.csv`: hidden/no-offer class-tail loaders that are safe only as probes.
- `new_quest_candidate_queue.csv`: missing-local-script rows sorted by safe add policy and priority.
- `current_quest_data_enrichment_queue.csv`: existing local scripts with marker, reward, cutscene, BNPC, or content gaps.
- `owner_probe_addendum.csv`: strong blocked-owner probe seeds that still require natural EventStart proof.
- `class_tail_cutscene_seed_rows.csv`: recovered class-tail cutscene methods and runtime argument contracts.
- `private_bnpc_materialization_candidate_addendum.csv`: private/SQB and data-only BNPC candidates; no SQL is generated.
- `reward_display_sync_candidates.csv`: sqrwa reward-window EXP values that can be aligned without duplicate grants.
- `safe_cutscene_alias_patch_candidates.csv`: recovered method-name swaps that still need route smoke testing.
- `existing_bnpc_spawn_enrichment_candidates.csv`: high-confidence existing ambient BNPC/objective joins.
- `job_metadata_enrichment_notes.csv`: level-40 job metadata details that should stay TODO/data-only for now.
- `normalized_quest_data_schema_recommendations.csv`: proposed small CSV schemas for future quest data.
- `ai_helper_decomp_addendum_findings.csv`: helper findings folded into this pass.
- `source_manifest.csv`: generator inputs.

## Counts

- `safe_hidden_class_tail_additions`: 4
- `new_quest_candidate_queue`: 142
- `current_quest_data_enrichment_queue`: 484
- `owner_probe_addendum`: 9
- `class_tail_cutscene_seed_rows`: 26
- `private_bnpc_materialization_candidate_addendum`: 8
- `reward_display_sync_candidates`: 12
- `safe_cutscene_alias_patch_candidates`: 0
- `existing_bnpc_spawn_enrichment_candidates`: 8
- `job_metadata_enrichment_notes`: 7
- `normalized_quest_data_schema_recommendations`: 5
- `ai_helper_decomp_addendum_findings`: 4
- `source_manifest`: 13
- `summary`: 12

## Safety Notes

- `bsm400`, `exc400`, and `fsh400` were added only as hidden/no-offer loader stubs.
- ACN rows are reference-only candidates because the local ACN quest template/data is not proven.
- BNPC/SQB rows are data candidates only. They require materialization, strict kill callback, cleanup, and reward-lock proof before gameplay enablement.
- Owner/cutscene rows still need live EventStart and EventUpdate capture.
- Reward display syncs do not grant rewards; normalized rewards are granted by `CompleteQuest`.
