# Quest Instanced Cutscene Lifecycle Decomp - 2026-07-02

This pass focuses on the event/cutscene half of the instanced quest set: local server event calls, recovered client scenario methods, Toto-Rak entry, SQB director shell recovery, and the gates that must be proven before automation.

## Findings

- Recovered scenario methods contain 20 NQ cutscene callers in the focused slice; 15 recovered methods use `startFadeInCutSceneAfterWarp`.
- `com0u4`, `com0g1`, `com0u1`, and `com0l1` remain the only spawn-ready SQB-private wave, but their post-kill/talk cutscenes still need owner and after-warp lifetime proof before reward automation.
- Toto-Rak quests `com0l5, com0g6, com0u5, com0l6` are an instance-entry lane: `TotorakTryStartFromNpc` advances sequence `10 -> 20` only after instance start succeeds.
- Toto-Rak entry callers guard successful starts with an immediate `return`, so the older caller-tail `EndEvent` hazard is mitigated on the success path; widget/no-start behavior still needs smoke.
- GC tails `gcu302, gcg301, gcu301, gcl302, gcl301, gcg302` are template wrappers plus recovered client scenario methods; they still lack safe `GC_BATTLES` metadata.
- `etc2g3` is a push-object lane, not an SQB lane; preserve `QFLAG_PUSH` and `onPush` behavior.
- Recovered SQB base has `eventContentGiveUp` via ask row `25230`, but no recovered `eventContentCancel`; cancel/return/despawn policy stays probe-only.

## Most Important Cutscene Hazards

| Quest | Hazard |
| --- | --- |
| `com0g1` / Breaking the Seals | processEventUrianger uses COM0G105; processEventUriangerMore uses COM0G110 and always after-warp fade-in. |
| `com0u1` / Career Opportunities | processEvent_020 uses COM0U105; processEvent_030 uses COM0U110 and always after-warp fade-in. |
| `com0l1` / The Price of Integrity | processEvent_020 uses COM0L105; processEvent_030 uses COM0l110 and always after-warp fade-in. |
| `com0l5` / An Officer and a Wise Man | processEvent_010 starts COM0l110 after warp; elevator methods ask row 79; processEventExit asks 51036. |
| `com0u5` / Burning Man | processEvent025 starts com0u610 after warp; local com0u510 post-instance talk remains unmapped to a same-name NQ in recovered Lua. |
| `com0l6` / Ceruleum Shock | processEvent_010 starts com0l510 with payload arg; elevator methods use after-warp fade-in. |
| `com0u6` / Know Your Enemy | processEvent_005_03 starts com0u510 with payload arg and after-warp fade-in; elevator methods also after-warp. |
| `com0g4` / The Mail Must Get Through | processEventClear starts NQ com0g410 only when both payload args are 0. |

## Local Event Shape

Local quest scripts call `callClientFunction(player, "delegateEvent", ...)`, mutate sequence/items after the call returns, and generally close with `player:EndEvent()` at handler tail. Because `callClientFunction` yields on `_WAIT_EVENT`, sequence updates are after-cutscene from the server's point of view, but after-warp client methods still need event-lifetime smoke before we automate close/return.

## Generated Files

- `outputs\quest-instanced-cutscene-lifecycle-20260702\local_event_call_rows.csv`
- `outputs\quest-instanced-cutscene-lifecycle-20260702\recovered_client_event_method_rows.csv`
- `outputs\quest-instanced-cutscene-lifecycle-20260702\sqb_director_recovery_rows.csv`
- `outputs\quest-instanced-cutscene-lifecycle-20260702\totorak_entry_contract_rows.csv`
- `outputs\quest-instanced-cutscene-lifecycle-20260702\implementation_gate_rows.csv`
