# Quest Decomp Addendum Atlas - 2026-06-30

Generated output directory: `outputs\quest-decomp-addendum-atlas-20260630`

## What Changed

- Added hidden/no-offer class-tail probes for `bsm400`, `exc400`, and `fsh400`.
- Kept `cul400` as the existing comparison row.
- Promoted ACN, private BNPC/SQB, side BNPC, job metadata, reward-display, and static main-scenario rows into explicit queues instead of enabling them.

## Output Counts

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

## Highest Confidence Adds

`safe_hidden_class_tail_additions.csv` is the only list that corresponds to code stubs added in this pass.
Every row is still `noOffer` and should be used for owner/cutscene probing only.

## Runtime Proof Still Missing

- EventUpdate return tuples and typed branch values.
- Real SNPC tuple values per scene.
- A8/branch semantics by method family.
- Natural owner resolution for blocked owner rows.
- After-warp event lifetime proof.
- Modern scene=none instance lifecycle proof.
- Fight materialization, strict kill callback, cleanup, and reward-lock proof.

## Safe Patch Lane

`reward_display_sync_candidates.csv` is display-only: it aligns the `sqrwa` reward widget value with normalized reward data and does not add duplicate `AddExp`, `AddGil`, or `AddItem` calls.
