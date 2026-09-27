# Quest Instanced Event Adapter Contract - 2026-07-02

This pass turns the decomp evidence into adapter contracts: local quest handlers, recovered client event methods, scene-key reconciliation, reward boundaries, and hardening gates.

## Findings

- Matching a local scene alias to a recovered `startNQCutScene` is useful, but it is not reward permission. The fight/content callback and return owner still need proof.
- `etc2g3` remains a push-object quest in local code. Its recovered SQB row is a callback-recovery backlog item, not a reason to replace `QFLAG_PUSH`/`onPush`.
- Toto-Rak now has a clearer adapter split: quest scene aliases, raid-guide ask rows, elevator object scenes, live occupancy cutscenes, and boss-clear probes are separate contracts.
- `com0u5` is the loud alias mismatch: local `com0u510` is suspicious, while recovered Burning Man uses `com0u610` and Know Your Enemy uses `com0u510`.
- Spawn-ready rows (`com0u4`, `com0g1`, `com0u1`, `com0l1`) are probe contracts only: private mob metadata exists, but reward policy stays locked until cleanup/give-up/return are proven.
- GC tails remain template/wrapper contracts only until exact `GC_BATTLES` launch and kill metadata is recovered.

## Generated Files

- `outputs\quest-instanced-event-adapter-contract-20260702\local_handler_contract_rows.csv`
- `outputs\quest-instanced-event-adapter-contract-20260702\recovered_event_method_rows.csv`
- `outputs\quest-instanced-event-adapter-contract-20260702\alias_reconciliation_rows.csv`
- `outputs\quest-instanced-event-adapter-contract-20260702\reward_boundary_rows.csv`
- `outputs\quest-instanced-event-adapter-contract-20260702\adapter_gate_rows.csv`
- `outputs\quest-instanced-event-adapter-contract-20260702\adapter_hardening_rows.csv`
