# Quest Instanced Actor Owner Resolution - 2026-07-02

This pass resolves local actor symbols/ids against recovered scenario method-owner hints. It is about who owns a scene/helper, not whether the scene text itself is correct.

## Findings

- The familiar trio reuse the same local alias across different actors (`*105` for officer/contact, `*110` for Urianger/contact), so owner capture must be per callsite.
- Toto-Rak entry is owned operationally by Bloisirant plus the shared entry helper, while recovered methods also include elevator and exit object owners.
- `com0l5` and `com0u5` have the highest alias-owner mismatch risk: local aliases do not directly match recovered NQ owner keys.
- `com0g6` is the low-risk Toto-Rak alias case: local `com0g510` aligns with recovered `COM0G510`, but it still needs event owner/return capture.
- GC 301/302 local files are template-only, so recovered GC owner scenes must not be collapsed into the officer-talk template path.
- GC external owner hints mostly line up with recovered owner names, except `gcu301`, where recovered `CLIFTONStart` conflicts with external `Lefchild`.

## Generated Files

- `outputs\quest-instanced-actor-owner-resolution-20260702\local_actor_usage_rows.csv`
- `outputs\quest-instanced-actor-owner-resolution-20260702\recovered_owner_hint_rows.csv`
- `outputs\quest-instanced-actor-owner-resolution-20260702\scene_owner_reconciliation_rows.csv`
- `outputs\quest-instanced-actor-owner-resolution-20260702\alias_actor_multiplicity_rows.csv`
- `outputs\quest-instanced-actor-owner-resolution-20260702\gc_recovered_owner_gap_rows.csv`
- `outputs\quest-instanced-actor-owner-resolution-20260702\owner_hazard_rows.csv`
