# Quest Push Payload Execution Atlas - 2026-06-30

Generated with:

```powershell
python tools\build_quest_push_payload_execution_atlas.py --output outputs\quest-push-payload-execution-atlas-20260630
```

This pass goes one layer below the command blueprint atlas. It joins owner-bound quest cutscenes, recovered argument shapes, dungeon/instance bridge rows, fight materialization rows, and runtime probe contracts into concrete payload and logging queues.

## Output Bundle

| CSV | Rows | Use |
| --- | ---: | --- |
| `questdelegate_payload_execution_queue.csv` | 750 | Full owner-bound quest cutscene command rows, payload slots, return tuple gates, and safety notes. |
| `owner_bound_cutscene_payload_atlas.csv` | 750 | Same full cutscene rows with normalized payload and runtime capture columns for filtering. |
| `owner_bound_cutscene_payload_probe_queue.csv` | 571 | Compact first-pass owner/payload/wait/EndEvent/pass-condition queue. |
| `quest_payload_status_summary.csv` | 21 | Payload status rollup by argument shape. |
| `snpc_payload_capture_queue.csv` | 34 | SNPC tuple and A8/branch-value cutscene capture queue. |
| `after_warp_lifetime_payload_queue.csv` | 304 | Rows where the event lifetime must survive warp/close timing before patching. |
| `instance_scene_payload_queue.csv` | 90 | Dungeon, raid, Hamlet, and Rivenroad scene payload rows. |
| `instance_lifecycle_payload_seed_rows.csv` | 20 | Helper-ranked lifecycle seed rows, including blocked static/profile families. |
| `fight_payload_probe_queue.csv` | 94 | Fight, SQB, BNPC, callback, cleanup, and reward-lock probe rows. |
| `fight_priority_payload_seed_rows.csv` | 20 | Helper-ranked first fight/job/class payload seeds. |
| `runtime_payload_capture_matrix.csv` | 33 | Required logging fields by probe family. |
| `ai_helper_payload_findings.csv` | 4 | The helper findings folded into this atlas. |
| `first_payload_probe_wave.csv` | 81 | A cross-family first proof wave across quests, instances, and fights. |

## Quest Payload Status

| Status | Rows |
| --- | ---: |
| `capture_lifetime_before_patch` | 270 |
| `scaffold_no_mutation_payload_probe` | 205 |
| `no_extra_payload_known` | 107 |
| `blocked_owner_unrecovered` | 72 |
| `recover_or_confirm_extra_args` | 47 |
| `capture_snpc_payload` | 34 |
| `known_local_payload` | 15 |

## Payload Rules

- SNPC payloads are normalized as `@snpcNickname,@snpcSkin,@snpcPersonality,@snpcCoordinate,@initialTown`, with `@unknown:A8` when the recovered call carries an extra value.
- Runnable `!questdelegate` command strings compact the five-slot SNPC tuple to `@snpc5`; payload columns stay expanded for auditing.
- `@unknown:A8`, `@unknown:*`, `@nil`, `@const:*`, and `@result:tuple` are capture contracts. They are not patch-ready literals.
- `!questdelegate` expands SNPC helpers but rejects `@unknown:*`; replace those placeholders with captured typed values before running.
- The compact cutscene probe queue always asks for owner, payload, wait recipe, EndEvent policy, pass condition, and blocker notes together.
- After-warp rows stay blocked until the runtime proves the current event remains open through the recovered method return.
- Modern instance raids start with `scene=none`; replay scene keys are asset proof only until lifecycle start is proven.
- SQB/private fight rows stay reward-locked until materialization, kill callback, result tuple, cleanup, and `ContentFinished` are all captured.

## Helper Integration

- Dewey: expanded cutscene payload recovery into explicit SNPC slots, A8/branch unknowns, nil placeholders, and return tuple capture.
- Ohm: split instance work into legacy occupancy, modern `scene=none`, replay-only assets, Rivenroad dynamic weather scenes, hard-wrapper log-only, Hamlet, and blocked profile families.
- Volta: added 20 ranked fight/job/class seeds, including GC familiar routes, main scenario private probes, world BNPC SQL routes, and blocked job/class SQB rows.
- Gibbs: expanded runtime logging into event context, owner context, Lua payload, EventUpdate packets, quest state, visibility, selector, instance raid, and SQB-private lanes.

## First Proof Order

1. Run known-payload and known-local owner-bound cutscene smokes first.
2. Capture the 34 SNPC payload rows and their `@result:tuple` values before wiring any scene-key aliases.
3. Prove the 304 after-warp lifetime rows with current event owner/name/type and EndEvent timing.
4. For dungeons and raids, prove legacy occupancy and modern `scene=none` lifecycle before replay scene probes.
5. For fights, begin with the 20 seed rows, but keep rewards and quest completion mutation locked until callback and cleanup evidence exists.
