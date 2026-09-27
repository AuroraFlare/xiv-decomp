# Quest Instanced Scene Payload Contract - 2026-07-02

This pass digs below alias matching into payload branches, NQ argument forwarding, fade behavior, and safe runtime probes.

## Findings

- Several recovered scene methods branch on `A3`/`A4` or forward payload args into `startNQCutScene`, while local Lua generally calls `delegateEvent` without explicit extra args. That is a probe requirement, not an automatic bug claim.
- `com0g4` is the clearest branch contract: recovered `processEventClear` plays `com0g410` only when `A3 == 0 and A4 == 0`; otherwise it falls back to dialogue.
- The first familiar fights and Arms Race have private spawn probe metadata, but every probe row still forbids reward mutation during the probe.
- `etc2g3` remains push-object first: recovered talk methods are payload-light, while the SQB/push atlas remains callback-recovery backlog.
- Toto-Rak payloads are split between quest NQs, raid-guide asks, elevator object scenes, exit asks, and live occupancy probes. Keep those contracts separate.
- The GC 301/302 tails remain offline-recovery only: local wrappers have no delegate routes, and the generic template must not be used as retail instance proof.

## Highest-Risk Smoke Calls

- `com0g4`: smoke `processEventClear(0, 0)` because that exact payload controls the `com0g410` NQ branch.
- `com0l6` and `com0u6`: probe forwarded `A3` payloads before replacing local no-arg aliases.
- `com0u5`: block local `com0u510` as a Burning Man NQ; recovered Burning Man points at `com0u610`.
- GC tails: restrict runtime work to `!quest info` until battle owner/target/delegate sequence is recovered offline.

## Generated Files

- `outputs\quest-instanced-scene-payload-contract-20260702\local_delegate_payload_rows.csv`
- `outputs\quest-instanced-scene-payload-contract-20260702\recovered_payload_branch_rows.csv`
- `outputs\quest-instanced-scene-payload-contract-20260702\alias_payload_reconciliation_rows.csv`
- `outputs\quest-instanced-scene-payload-contract-20260702\payload_smoke_matrix_rows.csv`
- `outputs\quest-instanced-scene-payload-contract-20260702\runtime_probe_playbook_rows.csv`
- `outputs\quest-instanced-scene-payload-contract-20260702\scene_payload_gate_rows.csv`
