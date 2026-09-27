# Quest Instanced Sequence Owner Matrix - 2026-07-02

This packet correlates local quest sequence actions with recovered scenario scene methods. It is deliberately sequence-first: the goal is to see what the local script mutates immediately around each cutscene/helper call.

## Findings

- Most COM cutscene calls are followed by an immediate local `StartSequence`, so payload proof must be paired with event return and sequence-delta capture.
- Toto-Rak entry calls are shared helper calls, not ordinary scenes. The helper advances the active entry quest to sequence 20 after successful start, while the caller still reaches its onTalk event tail.
- `etc2g3` has a clean split: push advances `SEQ_000 -> SEQ_001`; later O'Dhinek talk plays reward scenes, grants items/EXP, and completes.
- GC 301/302 tails are template-only locally. The template can advance or complete by officer talk without recovered battle metadata, so those remain offline-recovery locked.
- Recovered methods expose owner-class/method names, say ids, NQ aliases, payload branches, fade behavior, and `showQuestInfomation` returns for scene probes.
- Shared helpers matter: `callClientFunction` dispatches through `RunEventFunction`, while NQ cutscenes and fade timing live in `QuestBaseClass` helper methods.
- The local helper pass found no target case where `StartSequence` happens after `EndEvent`; the ordinary pattern is scene/helper call, local mutation, then event close.

## Generated Files

- `outputs\quest-instanced-sequence-owner-matrix-20260702\local_sequence_action_rows.csv`
- `outputs\quest-instanced-sequence-owner-matrix-20260702\local_delegate_transition_rows.csv`
- `outputs\quest-instanced-sequence-owner-matrix-20260702\recovered_owner_scene_rows.csv`
- `outputs\quest-instanced-sequence-owner-matrix-20260702\scene_helper_contract_rows.csv`
- `outputs\quest-instanced-sequence-owner-matrix-20260702\sequence_owner_reconciliation_rows.csv`
- `outputs\quest-instanced-sequence-owner-matrix-20260702\event_lifecycle_hazard_rows.csv`
