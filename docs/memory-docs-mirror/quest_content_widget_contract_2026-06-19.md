# Quest Content-Information Widget Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\quest_content_widget_contract_20260619`.

## High-signal findings

- The recovered quest content-info lane is a kind `1` content widget path, so it opens `GuildleveExecutionWidget`, not a bespoke quest widget.
- `QuestDirectorGcg70101`, `QuestDirectorGcl70101`, and `QuestDirectorGcu70101` are Grand Company scoring widgets with `directNumber`, `point`, and `limitTime` work sync.
- The GC variants differ mainly by public effect IDs and title/article keys: Gridania uses title `51112` and article key `11000425`; Limsa uses `51113`/`11000426`; Ul'dah uses `51114`/`11000427`.
- `QuestDirectorNMRush01` and `QuestDirectorNMRush02` are timer-only content-info widgets. They start once on `directNumber` `1` or `2`, cancel on `3`, and use titles `51143`/`51144` with instruction `51145`.
- Local runtime has a reusable bridge via `QuestContentInformationDirector`, `QuestContentInformationWork`, `!qciprobe`, `!qcifinish`, and the GC701 quest template; NMRush/live encounter ownership is still missing.
- Separate from content-info HUDs, recovered quest ask/detail/reward/delivery widgets are UI payload/result surfaces. Server quest lifecycle and reward grants should remain owned by `AcceptQuest`/`CompleteQuest` or verified script transactions, not client-returned widget tuples.
- `QuestDeliveryWidget` is the highest-risk quest widget: returned package/item/count/catalog/name/materia-ish values need server re-resolution against owned inventory, HQ/materia/equipped state, and destination capacity before any remove/grant.

## Local Safety Notes

- Reuse the stock content-group/director path; do not directly force-create the widget before the director object and kind `1` methods are in place.
- Add a pending quest-widget context before trusting quest ask/detail/reward/delivery return params: expected quest id, actor, sequence, widget/function name, and allowed result shape.
- Keep the GC701 bridge table-driven by company variant so the public effect/title/article key cannot cross wires.
- For NMRush, start with a timer-only visual probe because `getMaxIndexNumberOnGuildleveInfo` returns `0` and there are no article rows to validate.

## 2026-06-21 QCI/QuestDirector Details

- `QuestDirectorBaseClass` is a thin director-work shell: temp child reserve `16`, sync child reserve `32`, `initAsQuestDirector(...)`, and a content-command permit gate delegated to the player. Its recovered `getOwnClientQuestId` and `processFinalize` bodies are placeholders.
- GC701 directors have exact work fields: `_sync.directNumber` int8, `_sync.point` int16, and `_sync.limitTime` int32. The direct tag groups `directNumber + point`, and the time tag groups `limitTime`.
- GC701 direct semantics: init opens public effect `15/14/16` for Gridania/Limsa/Ul'dah; `directNumber == 20` opens success effect `18/17/19`; `directNumber == -1` opens failure effect `20`; finalizing with `directNumber == 0` cancels content information and opens neutral effect `13`.
- GC701 info payload is kind `1`, guildleve id `0`, max index `1`, instruction `51115`, point cap `1000`, row `33621`, and article item/icon ids `11000425/11000426/11000427` for Gridania/Limsa/Ul'dah. Titles are `51112/51113/51114`.
- Local `QuestContentInformationDirector` mirrors the field bag and can set point/direct/time, but the GC template currently uses `CancelProbe()` for unsuccessful finish and then ends the director. That follows recovered cancel/finalize behavior, not recovered failure effect `20`; use `FinishProbe(false)` only when a real failure effect is intended.
- `QuestDirectorNMRush01` is timer-only: `_temp.timer`, `_sync.directNumber`, `_sync.limitTime`, direct `1/2` starts once, direct `3` cancels, and finalize cancels. It returns kind `1`, title `51143`, max index `0`, and instruction `51145`.
- `DesktopWidget.processUpdateContentsInformation` dispatch is exact: kind `1` opens `GuildleveExecutionWidget`, kind `2` opens `ChocoboCaravanWidget`. QCI proves the quest content-info overlay lane; it does not prove `ContentCommand` or SimpleQuestBattle execution.
- `!qciprobe` is currently low-permission and starts/updates; `!qcifinish` is GM-only and sends success/fail/cancel through `FinishProbe` or `CancelProbe` before ending the director. Verify `FinishProbe/CancelProbe -> EndDirector -> RemoveActorPacket` clears ownership before wider testing.

## 2026-06-20 Widget Result Authority Addendum

- Generic `callClientFunction` / `_WAIT_EVENT` resume is display-safe but authority-loose: EventUpdate resumes Lua with raw params and does not bind trigger actor, event type, owner identity, widget/function name, nonce/TTL, or tuple schema to the awaited result.
- `_WAIT_EVENT_START` can match an expected owner/event name, but `_WAIT_EVENT` is keyed only by player. Mutation-capable widgets need a typed pending context containing widget id/function, source actor, quest/content id, expected result schema, TTL/nonce, and the only server mutation handler allowed to consume it.
- The pending context shape should be server-owned and per player/blocking ask: `nonce`, `createdAt`, `expiresAt`, `playerId`, `ownerActorId`, `eventName`, `eventType`, `functionName`, `widgetLoadArg`, `sourceActorId` or `directorId`, optional `questId` / `contentId`, `schemaId`, `mutationPolicy`, `handlerId`, and `idempotencyKey`.
- Create the context before `RunEventFunction`, bind it to current `currentEventOwner/currentEventName/currentEventType`, and do not append a nonce to retail widget args unless a recovered wrapper is proven to echo it.
- On `0x012E` EventUpdate, validate packet shape, unexpired/unconsumed context, active event owner/name/type, allowed trigger actor, exact widget/function binding, and exact result tuple schema before resuming any mutation-capable handler.
- Consume the context before running the handler. Late, duplicate, expired, owner-mismatched, or schema-mismatched updates should be logged rejects and must not mutate state.
- TTL defaults: 30 seconds for simple display/ack widgets, 60-120 seconds for quest/content asks, and 120 seconds for delivery/edit-style widgets. Clear on `EndEvent`, logout, zone change, owner mismatch, or replacement wait.
- Quest accept/complete scripts that branch on a delegated client boolean should be treated as legacy display gates until the server revalidates NPC/source/proximity/prereqs/objectives and pending ask context. `AcceptQuest` and `CompleteQuest` are server sinks, not proof that the widget result was authoritative.
- `QuestRewardWidget` cannot authorize a grant: mode `1` confirm and cancel both return `1`, and mode `2` is timer/display-only. Schema is acknowledgement-only; treat it as acknowledgement, not accept/decline or reward selection.
- `ContentRewardWidget` schema is `{ result = 1 | -1 }`; it may gate a claim, but grant still needs server capacity, eligibility, one-claim, and reward-provider checks. Local guildleve reward currently grants immediately after opening the widget, so decide the retail cancel policy before relying on that result path.
- `QuestDeliveryWidget` remains the highest-risk payload. Schema is selected-item context like `{ package, slot, count, nameIndex, catalogId, materiaCount, status }`, with cancel/empty as no-op. Re-resolve every field server-side against owned inventory, package mapping, HQ/quality, equipped state, attached materia, capacity, price/anima/unit, and allowed delivery target before mutation.
- Widget package ids are context-local. Quest delivery can expose client package ids like `1`, `100`, `8`, and `5`; bridge code must map per widget/provider and must not pass package ids through globally.
- Inventory grants/removes are immediate DB mutations in the current backend. Reward and delivery handlers should prevalidate all grants/removes/caps first or be made idempotent/rollbackable before widening mutation-capable widgets.

## 2026-06-21 Widget Result Semantics Refresh

- `QuestAskWidget` returns approve/refuse style control and still needs server-side NPC/source/prereq/objective revalidation before `AcceptQuest`.
- `QuestRewardWidget` is acknowledgement-only and cannot authorize a grant. It should only close or acknowledge a server-owned reward path.
- `RewardSelectWidget` returns a selected index plus one or `-1`; never trust that index as an item id. Re-resolve it against a server-owned reward provider and consume a pending context before mutation.
- `QuestDeliveryWidget` remains the highest-risk quest/custom-menu selector. Returned package/slot/count/catalog/name/materia-ish fields must be re-read from server inventory, with per-widget package mapping and stale-slot rejection.
- `ContentRewardWidget` can gate a claim, but the reward provider still needs one-claim/idempotency state, full-inventory behavior, eligibility checks, and remove-before-grant or rollback semantics.
- `EventStart`/`EventUpdate` malformed-packet guards are part of this contract. Packet parse failure must stop before any pending widget context is resumed.
- `callClientFunction`/`_WAIT_EVENT` and `LuaEngine.OnEventUpdate` need owner/name/type/trigger/widget/schema validation before any mutation-capable result is trusted. This applies to quest delivery, content reward, GC701/QCI-adjacent widgets, and recovered custom menus.
- GC701 QCI proves kind-1 HUD/content-information routing only. It does not prove `ContentCommand`, SimpleQuestBattle, enlistment/status/rank/seal mutation, or reward authority.

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | Validate reusable quest content-info adapter | Map Server/Actors/Director/QuestContentInformationDirector.cs plus Data/scripts/commands/gm/qciprobe.lua and qcifinish.lua |
| 2 | GCG/GCL/GCU 70101 quest-owned scoring bridge | Data/scripts/quests/com/gc_quest_template.lua plus QuestContentInformationDirector |
| 3 | Score/direct lifecycle | Quest objective state updates |
| 4 | NMRush timer widgets | QuestDirectorNMRush01/02 equivalents |
| 5 | NMRush/live encounter binding handoff | Quest/company/encounter ownership path |

## Generated Files

- `quest_content_widget_function_contracts.csv` (96 rows)
- `quest_director_content_matrix.csv` (5 rows)
- `contents_information_protocol.csv` (5 rows)
- `local_probe_surface.csv` (5 rows)
- `local_gap_summary.csv` (4 rows)
- `bridge_queue.csv` (5 rows)
- `contract_summary.json`
- `README.md`
