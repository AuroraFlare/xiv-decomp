# Quest Runtime Proof Gap Atlas - 2026-06-30

Generated with:

```powershell
python tools\build_quest_runtime_proof_gap_atlas.py --output outputs\quest-runtime-proof-gap-atlas-20260630
```

This pass turns the remaining live-runtime unknowns into concrete proof contracts. It does not claim those values are captured yet; it defines exactly what the runtime logger/probe commands must record before quest pushes can be patched safely.

## Output Bundle

| CSV | Rows | Use |
| --- | ---: | --- |
| `live_runtime_proof_gap_matrix.csv` | 6 | Top-level proof families and live-missing counts. |
| `eventupdate_return_tuple_decomp_queue.csv` | 551 | Owner-bound cutscene rows requiring typed EventUpdate return tuple capture. |
| `snpc_a8_branch_semantics_queue.csv` | 34 | SNPC tuple, A8, branch, fade/warp, and cutscene return proof rows. |
| `blocked_owner_resolution_decomp_queue.csv` | 93 | Blocked owner rows converted into log-only selector recovery probes. |
| `blocked_owner_candidate_seed_rows.csv` | 9 | Helper-ranked owner candidates for class/default/system/GC rows. |
| `blocked_owner_selector_attempt_matrix.csv` | 93 | Blocked owner rows joined to exact/family selector attempts where static hints exist. |
| `after_warp_lifetime_proof_queue.csv` | 304 | Rows that must prove event lifetime through warp/fade/close timing. |
| `after_warp_priority_seed_rows.csv` | 6 | Safest first after-warp probes plus SNPC-heavy rows to hold back. |
| `instance_scene_none_lifecycle_proof_queue.csv` | 20 | Instance lifecycle rows with `scene=none`, replay, Hamlet, and blocked profiles split. |
| `instance_priority_seed_rows.csv` | 4 | First modern instance/Rivenroad probes. |
| `fight_materialization_reward_lock_proof_queue.csv` | 94 | Fight materialization, kill callback, cleanup, and reward-lock proof rows. |
| `fight_helper_priority_seed_rows.csv` | 14 | Helper-ranked fight/private-content smoke rows and negative controls. |
| `runtime_proof_capture_schema.csv` | 39 | Required typed logging fields per proof family. |
| `runtime_live_capture_record_schema.csv` | 45 | Canonical schema for storing actual live probe captures later. |
| `runtime_probe_checkpoint_matrix.csv` | 13 | Phase-by-phase runtime hook/checkpoint matrix for logger implementation. |
| `fight_reward_lock_snapshot_schema.csv` | 7 | Required before/during/after state snapshots for fight reward-lock proof. |
| `ai_helper_runtime_proof_findings.csv` | 4 | Helper findings folded into this atlas. |
| `first_live_runtime_probe_wave.csv` | 67 | Ordered first live proof wave across all categories. |

## Live-Missing Matrix

| Proof family | Static rows | Live missing | Static status |
| --- | ---: | ---: | --- |
| `eventupdate_return_tuple` | 750 | 750 | Packet/coroutine plumbing known; per-method tuple values live-only. |
| `snpc_tuple_a8_branch` | 34 | 34 | SNPC tuple source known; several A8 branch meanings inferred. |
| `blocked_owner_resolution` | 93 | 93 | Blocked rows isolated; candidate selectors are not patch-ready. |
| `after_warp_lifetime` | 304 | 304 | EndEvent clears active owner; after-warp rows must prove event survival. |
| `modern_instance_scene_none_lifecycle` | 20 | 13 | `scene=none` start contract known; replay scenes are not launch proof. |
| `fight_materialization_reward_lock` | 94 | 94 | Kill dispatch order known; materialization and reward silence are live-only. |

## Key Decomp Findings

- EventUpdate return tuples are the typed Lua params from `EventUpdatePacket`; packet metadata is context, not the Lua return value.
- Native cutscene wrappers can return branch/result values, which then come back through EventUpdate params.
- SNPC tuple order is `nickname, skin, personality, coordinate, initialTown`, but the actual values are per-player runtime state.
- A8 is not uniform: for some rows it is a fade selector, for others it is forwarded into the scene payload.
- The 93 blocked owners split into GC, class, default-talk, test, and system rows; candidate selectors stay log-only until natural EventStart confirms them.
- `blocked_owner_selector_attempt_matrix.csv` now separates exact owner/method seeds from broader code/family selector sweeps, so the first live wave starts with the safest owner probes.
- `DoZoneChange*` active-event auto-close is a known after-warp hazard and must be logged explicitly.
- Fight proof must cover content creation, materialization, `BattleNpc.Die`, `HandleBNpcKill`, quest/director callbacks, `ContentFinished`, return cleanup, and reward silence.

## First Live Proof Order

1. EventUpdate logger: capture typed params plus active owner/name/type around simple known-payload rows.
2. SNPC/A8: run the 34 SNPC rows only after outbound payload slot logging exists.
3. Blocked owners: start with exact seeded owner/method rows for `bsm400`, `exc400`, `fsh400`, `dftfst`, `dftwil`, `gcl105`, and `noc000`, then run broader code/family selector sweeps.
4. After-warp: start with `com0u6`, `com0u1`, `com0l1`, `com0g1`, and non-SNPC-heavy `man300` rows.
5. Instances: prove content 6 and 7 with `scene=none`, then Rivenroad normal accept/scene-none, and keep Rivenroad hard log-only.
6. Fights: start with `man0u0`, then `man0g0`/`man0l0`, then GC SQB rows; keep `man200` and `man2g0` as negative controls.

## Safety Notes

- A rendered cutscene is not proof. Every row needs event context and quest state before/after.
- Owner candidates are never patch-ready until runtime owner/event/type matches the natural client route.
- Reward-lock probes must verify inventory, gil, EXP, actions, completion bit, quest removal, and duplicate replay behavior.
- Modern replay scene keys such as `rad0r400`, `rad0w500`, and Rivenroad weather scenes remain blocked until lifecycle start succeeds.
