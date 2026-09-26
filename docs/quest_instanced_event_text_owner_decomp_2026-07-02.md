# Quest Instanced Event Text/Owner Decomp - 2026-07-02

This pass joins recovered scenario Lua, localized event-text rows, default-talk owner mappings, wiki/category breadcrumbs, and SQL item/class hints. Dialogue is reduced to short snippets and tags on purpose; the point is evidence shape, not transcript recovery.

## Findings

- GC tail start owners are now separated from battle/content owners. Clifton, Hasthwab, Dyrstbrod, Dhemdaeg, Lefchild, and Galeren are useful entry-owner candidates, but none proves a `GC_BATTLES` row.
- `gcu301`/Prying Eyes is the caution flag: external/default-talk evidence says Lefchild, while recovered Lua names `processEventCLIFTONStart`. Keep it blocked until another source explains the mismatch.
- The best GC target hints are still hints: `gcl301` has `Dart Slug Anti-venom` plus `SlugLesserQuestGcl301`; `gcg302` has `Sketch of Challinie` plus `FlyLesserQuestGcg302`; `gcu301` has coblyn/item clues. None of those analogs is bound to a quest-safe actor/mob/callback row.
- Helper NPC candidates are now tracked for the unresolved tails: Hasthwab/Fyrilskyf/Albin/TGizzoh/Denston, Dhemdaeg/Challinie, Galeren/Cotter/Westin, and Lefchild. Several are empty-script or display-only clues, so they remain owner evidence, not wiring proof.
- Toto-Rak recovered methods now give concrete cutscene contracts: `com0l5` elevator asks row 79 then chains `elv0l110` -> `com0l610`; `com0g6` plays `COM0G510`; `com0u5` plays `com0u610`; `com0l6` plays `com0l510` and has elevator NQs.
- Cutscene wiring remains separate from completion/reward wiring. The local Toto-Rak entry/exit helpers can already zone-change and close events, so retail-like adapters need event-lifetime guards first.

## Generated Files

- `outputs\quest-instanced-event-text-owner-20260702\quest_text_clue_rows.csv`
- `outputs\quest-instanced-event-text-owner-20260702\recovered_method_text_rows.csv`
- `outputs\quest-instanced-event-text-owner-20260702\event_owner_candidate_rows.csv`
- `outputs\quest-instanced-event-text-owner-20260702\gc_target_hint_rows.csv`
- `outputs\quest-instanced-event-text-owner-20260702\totorak_cutscene_flow_rows.csv`
- `outputs\quest-instanced-event-text-owner-20260702\totorak_runtime_probe_rows.csv`
- `outputs\quest-instanced-event-text-owner-20260702\wiki_walkthrough_signal_rows.csv`
- `outputs\quest-instanced-event-text-owner-20260702\decomp_gate_rows.csv`
