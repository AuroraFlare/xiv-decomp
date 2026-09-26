# Man0u1 Post-Kill Cutscene Decomp Notes

Scope: `Court in the Sands` / `man0u1` / quest id `110010`, focused on when the Coliseum post-fight CS `man0u135` actually starts.

## Direct Cutscene Start

Recovered quest scenario code confirms that `Man0u1.processEvent035` is the only `man0u135` launcher found in the decompiled Lua:

```lua
function Man0u1.processEvent035(A0_115, A1_116, A2_117)
  A0_115:startFadeOutCutSceneDefault(A1_116)
  A0_115:startNQCutScene("man0u135", 1)
  A0_115:startFadeInCutSceneAfterWarp(A1_116)
end
```

That means the actual CS starts only after event dispatch reaches the quest object method. The next layer down is `QuestBaseClass.startNQCutScene`, which calls:

```lua
worldMaster:createCutScene(sceneName, quest):startCutScene(1, 61, mode, ...)
```

For `processEvent035`, that resolves to:

```lua
worldMaster:createCutScene("man0u135", Man0u1):startCutScene(1, 61, 1, ...)
```

So the direct start boundary is not the `cutReplay` row and not the quest marker. It is successful delegated execution of `Man0u1.processEvent035`, followed by `startNQCutScene("man0u135", 1)`.

## Dispatch Requirement

`processEvent035` is a quest-object method. The recovered NPC and director delegate paths both tail-call the target actor:

```lua
target:_callFunction(method, player, owner, ...)
```

This makes the active event owner important. A clean NPC or director event owner that exposes `delegateEvent` can dispatch to the quest object. `PlayerBaseClass` exposes `delegateCommand`, not `delegateEvent`, so a player-owned battle command context is the wrong shape for this call.

This matches the observed local failure mode: a raw `RunEventFunction("processEvent035")` or a `delegateEvent` sent while the current owner/event tuple is blank, player-owned, or otherwise stale can complete as an empty event update without ever running the fade or cutscene call.

## DAT/Quest State Timing

The DAT rows identify `man0u135` as replay id `11001005`, but that row only proves the scene key exists and is replayable. It does not define the live trigger.

Relevant marker rows:

| Marker | Position Meaning | Actor field |
| --- | --- | --- |
| `11001006` | Gladiators' Guild intro marker | `4000257` |
| `11001007` | Coliseum door/fight-entry marker | `4000257` |
| `11001008` | Post-Coliseum/follow-up marker near `GLD2_TRIG` | `4000257` |

The server quest marker logic maps `SEQ_015` like this:

| `CNTR_SEQ15_GLD` | Private-area marker | Intended state |
| ---: | --- | --- |
| `0` | `MRKR_GLADIATOR` / `11001006` | Gladiators' Guild intro |
| `1` | `MRKR_GLADIATOR2` / `11001007` | Coliseum fight entry |
| `2` | `MRKR_GLADIATOR3` / `11001008` | Post-fight follow-up |

Therefore the post-kill CS belongs at the transition out of `CNTR_SEQ15_GLD == 1`. If it is run directly, it must run before or during the update to `CNTR_SEQ15_GLD = 2`, from a valid NPC/director event owner. Once the state is already `2`, the static data points the player at the post-fight/follow-up trigger position rather than proving a direct battle-context launch.

## Actor/Trigger Evidence

Known trigger classes:

| Actor class | Local name | Class path | Relevant use |
| ---: | --- | --- | --- |
| `1090141` | `COL_TRIG` / `MAN0u1_COL_TRIGG` | `/Chara/Npc/Object/ObjectEventDoor` | Door/fight-entry push |
| `1090077` | `GLD2_TRIG` / `MAN0u1_GLD2_Trigg` | `/Chara/Npc/Populace/PopulaceStandard` | Post-fight/follow-up push |
| `1099047` | local experimental post trigger | `/Chara/Npc/Populace/PopulaceStandard` | Good shape for a clean invisible push, but not original `man0u1` DAT placement |

The data supports a clean `PopulaceStandard` push owner for post-fight quest dispatch. It does not show a separate recovered retail `onKillBNpc` Lua method for `man0u1`; both recovered `QuestDirectorMan0u101` and `QuestDirectorMan0u102` are empty subclasses of `QuestDirectorBaseClass`.

## Second-Pass Evidence

The `11001005` id should not be treated as a single global trigger key. In `cutReplay.csv`, `11001005` is the replay row for `man0u135`. In `quest_marker.csv`, `11001005` is the Goldsmith-side marker, while the Coliseum-side markers are `11001006` through `11001008`. The repeated number family is useful for grouping quest data, but it is not a live "marker starts replay scene" chain.

The `man0u1.csv` text around rows `70` through `73` is an immediate post-match return beat: Greinfarr praises the match, comments on the result, and points the player toward gladiator training. That lines up with `processEvent035` being the scene immediately after the arena fight, before the player advances into the later `GLD2_TRIG` follow-up.

The local live quest script has one direct `processEvent035` call today: the `COL_TRIG` skip path in `Data/scripts/quests/man/man0u1.lua` dispatches `delegateEvent(..., quest, "processEvent035")`, increments `CNTR_SEQ15_GLD`, warps to `PrivateAreaMasterPast` type `1`, then ends the event. That is a push-event envelope, not a battle/director kill envelope.

The recovered client C output did not contain a raw `man0u135` string hit. The scene key is therefore script/data driven in the recovered material we have, not a client hardcoded "on monster death, play scene" hook.

`global.lua` also explains the failure mode:

```lua
kickEventContinue(player, actor, trigger, ...)
  -> player:kickEvent(actor, trigger, ...)
  -> yield "_WAIT_EVENT_START" for that owner/event

callClientFunction(player, functionName, ...)
  -> player:RunEventFunction(functionName, ...)
  -> yield "_WAIT_EVENT" on the already-current event
```

So `callClientFunction(player, "delegateEvent", ...)` does not choose a fresh owner. It reuses the player's current event tuple. If that tuple is still the battle command, blank, player-owned, or otherwise stale, the client can answer with an empty update without reaching `Man0u1.processEvent035`.

The strongest in-tree post-kill comparator is the level-1 intro battle directors (`QuestDirectorMan0u001`, `QuestDirectorMan0l001`, `QuestDirectorMan0g001`). They do not launch their quest cutscene from a naked kill context. They first continue a director `noticeEvent` with `kickEventContinue`, then call blocking `callClientFunction(player, "delegateEvent", player, quest, "...")`, then end the event and warp/finish content.

`ObjectEventDoor` is a good shape for the fight-entry door because its local base class first runs `eventDoorMoveAsk` and then forwards into `chosenQuest:OnPush(...)`. For a post-kill scene owner, that extra door/widget envelope is noise. `PopulaceStandard` or a director `noticeEvent` is cleaner.

One imported seed comparison is worth keeping in mind: the alternate Garlemald seed has actor class `1090077` as `PopulaceStandard` with property flags `19`, closer to the local experimental invisible trigger `1099047`. The local repo currently has `1090077` as property flags `1` with disabled push-circle metadata. That difference may explain why a DB-only `GLD2_TRIG` can fail to behave like the intended invisible post trigger until actor-class data is aligned.

## Third-Pass Evidence

The quest script itself proves a small id namespace trap: `MRKR_GOLDSMITH = 11001005`, while `cutReplay.csv` also uses `11001005` for `man0u135`. Those are separate data tables. The Coliseum marker chain in the script is `11001006`, `11001007`, and `11001008`; the post-fight marker is `11001008`, not replay row `11001005`.

The GLD counter shape now looks like this:

| Counter state | Evidence | Meaning |
| ---: | --- | --- |
| `CNTR_SEQ15_GLD == 0` | `GLD_TRIG` runs `processEvent030` / `man0u130`, then increments | Gladiators' Guild intro and warp into private area |
| `CNTR_SEQ15_GLD == 1` | private marker becomes `11001007`; `COL_TRIG` skip path runs `processEvent035` / `man0u135`, then increments | Coliseum fight entry and immediate post-fight CS |
| `CNTR_SEQ15_GLD == 2` | private marker becomes `11001008`; `GLD2_TRIG` runs `processEvent040` or `045` / `man0u140`, then increments | post-fight follow-up/exit beat |
| `CNTR_SEQ15_GLD >= 3` | NpcLs gate can advance to `SEQ_045` if `CNTR_SEQ15_GSM >= 1` | GLD branch complete enough to join the shared quest path |

This makes the current `GLD2_TRIG` branch suspicious: it checks `subseqGSM == 0` and `subseqGSM == 2`, but it increments `CNTR_SEQ15_GLD` and sits on the GLD marker path. Static data and the NpcLs gate both suggest this is really a GLD follow-up transition. Treat that as an inference, but it is a strong local bug candidate.

The private-area SQL lines up with that counter split. `server_zones_privateareas.sql` has two explicit `MAN0u1 S015 GLD` rows for zone `209`: `PrivateAreaMasterPast` type `0` and type `1`. The trigger placements then split cleanly: `COL_TRIG` / `MAN0u1_COL_TRIGG` is in type `0`, while `GLD2_TRIG` / `MAN0u1_GLD2_Trigg` is in type `1`. The Coliseum NPC cast is duplicated across both types, and the private-area exit also exists in both. So type `0` can remain the fight/fight-entry area; type `1` is the post-fight follow-up surface where a clean `GLD2_TRIG` push owner makes sense.

The generated cutscene analysis agrees with the recovered Lua:

- `quest_cutscene_functions.csv` classifies `Man0u1.processEvent035` as `man0u135`, `after_warp`, `direct_scene_after_warp`.
- `quest_cutscene_calls.csv` breaks it into exactly three calls: `startFadeOutCutSceneDefault`, `startNQCutScene("man0u135", 1)`, `startFadeInCutSceneAfterWarp`.
- `server_delegate_to_cutscene_join.csv` only joins the local server-side `processEvent035` dispatch at `Data/scripts/quests/man/man0u1.lua:847`, i.e. the current `COL_TRIG` skip path.
- `quest_cutreplay_rows_joined.csv` joins `man0u135` to cut replay `11001005`, but the replay row coordinates are all default placeholders. It does not contribute live trigger placement.

The fade helpers also explain why ordering matters. `startFadeOutCutSceneDefault` fades out and waits. `startNQCutScene` calls `CutScene.startCutScene`; for screen mode `61` and mode `1`, `CutScene.startCutScene` plays the scene and waits for map load on success. Then `startFadeInCutSceneAfterWarp` calls player `_fadeInAfterWarp()` unless the area is the test zone. So `processEvent035` already contains a client-side post-warp/fade expectation; an extra server warp before the delegated function has returned is more likely to confuse the event than to help it.

On the server side, the owner-tuple theory is concrete:

- `Player.StartEvent` latches `currentEventOwner`, `currentEventName`, and `currentEventType` from the incoming `EventStartPacket`.
- `Player.RunEventFunction` builds the packet from exactly those current values.
- `Player.EndEventWithType` sends the close packet and immediately clears those values to `0`, empty string, and `0`.
- `_WAIT_EVENT_START` waits for a matching owner/name start; `_WAIT_EVENT` resumes on the next event update for that player, without proving that the update came from the intended owner.

That means a wrong or already-cleared owner tuple can make the Lua coroutine resume on an empty or unrelated client update. In that failure mode, the script may appear to have "run" while `Man0u1.processEvent035` never actually reached the client-side quest method.

I also checked the obvious hidden-hook places again. Recovered `QuestDirectorMan0u101` and `QuestDirectorMan0u102` are empty `QuestDirectorBaseClass` subclasses, and recovered `SimpleQuestBattleBaseClass` only implements give-up/client-quest-id helpers. No recovered Lua success callback starts `processEvent035` for us.

## Fourth-Pass Evidence

The generated runtime probe notes independently call out this exact quest as the local repro for the risky path: Coliseum-style `Man0u1.processEvent035`, `processEvent040`, and `processEvent045` are classified as quest fade-after-warp probes. The expected order in that probe pack is a clean event context, fade out, mode `61` quest-owned cutscene, event-owned warp/fade-after-warp completion, and then a normal event close. It also says an immediate empty update from `processEvent035` should be treated first as a dispatch/context no-op, not as missing scene data.

The generated flow-context row for `Data/scripts/quests/man/man0u1.lua:847` gives the local server order around the only live `processEvent035` dispatch:

```text
callClientFunction(player, "delegateEvent", player, quest, "processEvent035")
  -> IncCounter(CNTR_SEQ15_GLD)
  -> WarpToPrivateArea("PrivateAreaMasterPast", 1, -177.893, 189.953, 218.754, 3.135)
  -> EndEvent()
```

The joined client timeline for that call is:

```text
startFadeOutCutSceneDefault
  -> startNQCutScene(man0u135)
  -> startFadeInCutSceneAfterWarp
```

So the local skip path does not advance the GLD counter or warp to type `1` before the scene dispatch. It dispatches the quest method first, then uses the post-update server side to move the player to the post-fight surface.

The GM staging helper now encodes the same boundary in runnable checkpoints. `!questcomplete man0u1 coliseum` stages quest `110010` at sequence `15`, GSM counter `0`, GLD counter `1`, and `PrivateAreaMasterPast` type `0` at the `COL_TRIG` location. `!questcomplete man0u1 postcoliseum` stages the same quest at GLD counter `2` and `PrivateAreaMasterPast` type `1` at the `GLD2_TRIG` location. That is a strong local convention for "fight entry" versus "post-fight follow-up".

The asset crosscheck rules out the obvious data-missing explanation for `man0u135`: the scene key is present in Lua refs, `cutReplay`, and client cut assets. The crosscheck reports one Lua reference, one `cutReplay` row, four asset files, and three dataset files. The replay row still has default placeholder coordinates, so it proves replayability, not live trigger placement.

The server event-update path explains why some failed direct attempts look deceptively successful. Packet `0x012E` logs `triggerActorID`, `serverCodes`, two unknowns, `Step`, and Lua params, but `Player.UpdateEvent` passes only Lua params to `LuaEngine.OnEventUpdate`. `OnEventUpdate` resumes the coroutine only if `_WAIT_EVENT` is already registered. Therefore a quick empty event update can be real packet traffic while still proving only "the client replied", not "the quest method reached `startNQCutScene`".

The outgoing packet shape gives a concrete trace target. `RunEventFunctionPacket` is opcode `0x0130` and writes `triggerActorID`, `ownerActorID`, `eventType`, `eventName`, `functionName`, and Lua params. For the safe path, that packet should show a real NPC/director owner and `functionName = delegateEvent`, with params targeting the `Man0u1` quest object and method `processEvent035`. A raw `functionName = processEvent035` on the player/current owner tuple is the wrong dispatch layer.

The wait code is asymmetric in a useful way. `_WAIT_EVENT_START` stores and checks the expected owner actor and event name, while plain `_WAIT_EVENT` only waits for the next event update from the player. So the direct fight-success probe should establish the clean owner with `kickEventContinue` or equivalent first, then send the blocking `delegateEvent` call while that owner tuple is current.

One corpus-level signal is also useful, but should be treated as probe-snapshot evidence: the generated probe pack found `1348` blocking `callClientFunction(..., "delegateEvent", ...)` calls and only `5` fire-and-forget delegate calls, all in `man0u1`. In the current checkout, `Data/scripts/global.lua` only exposes the blocking `kickEventContinue` / `callClientFunction` helpers for this path. For this branch, the blocking delegate shape is the baseline to trust.

The client cutscene call stack gives the earliest positive proof point. `QuestBaseClass.startNQCutScene` calls `worldMaster:createCutScene(scene, quest):startCutScene(1, 61, mode, ...)`. `CutScene.startCutScene` then fades to now-loading, calls `_loadCutScene`, orders desktop mode `61`, shows skip UI for mode `1`, calls `_play(...)`, cancels desktop mode on success, and waits for map load. Seeing only an event update is not enough; seeing that mode-61 load/play path begin is the proof that `man0u135` actually started.

## Fifth-Pass Evidence

The older implementation guide is useful as experiment history, not as live quest data. It describes a post-fight trigger named `COLISEUM_POST_TRIG = 1099047`, a pending flag named `FLAG_SEQ15_POST_COLISEUM_CS_DONE`, and a test actor `TOURNEY_GLADIATOR = 2280157`. In this checkout, none of those names exist in the live `Data/scripts/quests/man/man0u1.lua`; the current live flow only has `GLD_TRIG`, `COL_TRIG`, and `GLD2_TRIG`.

Actor `1099047` is still interesting because its actor class is the right shape for an invisible clean owner: `/Chara/Npc/Populace/PopulaceStandard`, property flags `19`, `noticeEvent`, and `pushDefault` radius `6.0`. But the only live spawn row for `1099047` in this repo is `gridania_blocker1` in zone `155`, `PrivateAreaMasterPast` type `1`. There is no current Coliseum spawn row for `MAN0u1_POST_COLISEUM_TRIGG`. So using `1099047` for `processEvent035` would be an emulator-side workaround that needs an explicit spawn/script state, not something proven by the current `man0u1` placement data.

Actor `2280157` is also real data, not a live placement. It has display name `3280156` (`tourney gladiator`) and appearance rows, and wiki/mining outputs associate that name with `Court in the Sands`; however, I found no current live spawn row for actor `2280157`. That keeps the fight opponent in the dynamic/server-created bucket unless a separate spawn source turns up.

The current helper surface also corrected the fire-and-forget theory. `Data/scripts/global.lua` defines `kickEventContinue` as `player:kickEvent(...)` followed by `_WAIT_EVENT_START`, and `callClientFunction` as `player:RunEventFunction(...)` followed immediately by `_WAIT_EVENT`. I found no live `runClientFunction`, `waitClientFunction`, `ScheduleEventWarp`, or `WarpToPositionForEvent` definitions in current `Data/scripts` / `Map Server`. If a repro still uses those names, it belongs to older probe code or a local branch outside this checkout.

The packet sources give a sharper "when did it directly start?" boundary. Outbound `RunEventFunctionPacket` opcode `0x0130` writes `triggerActorID`, `ownerActorID`, `eventType`, `eventName`, `functionName`, and Lua params. Inbound `EventStartPacket` opcode `0x012D` includes both trigger and owner plus event name/type, while inbound `EventUpdatePacket` opcode `0x012E` only carries `triggerActorID`, server/update fields, a one-byte event type/step, and Lua params. Therefore, after the owner-start proof, the first server-visible "direct CS start" proof is the `0x0130` packet with the clean owner tuple and `functionName = delegateEvent`; the first client-side proof is still mode-`61` `man0u135` load/play, not the mere arrival of `0x012E`.

## Sixth-Pass CSV Crosscheck

The generated CSVs pin the start point tightly. `quest_cutscene_functions.csv` has `Man0u1.processEvent035` at recovered scenario lines `242` through `246`, with exactly one direct scene key: `man0u135`, launcher `startNQCutScene`, fade mode `after_warp`, classification `direct_scene_after_warp`.

`quest_cutscene_calls.csv` breaks those recovered lines down as:

```text
243 startFadeOutCutSceneDefault(A1_116)
244 startNQCutScene("man0u135", 1)
245 startFadeInCutSceneAfterWarp(A1_116)
```

`server_delegate_flow_context.csv` has the only live server dispatch at `Data/scripts/quests/man/man0u1.lua:847`: `callClientFunction(player, "delegateEvent", player, quest, "processEvent035")`. Its next server operations are `848:IncCounter(CNTR_SEQ15_GLD)` and `849:WarpToPrivateArea(... type 1, -177.893, 189.953, 218.754, 3.135)`. So in the live skip-path model, the scene is launched before the GLD increment and before the type-`1` post-fight warp.

`quest_cutreplay_rows_joined.csv` maps `man0u135` to replay id `11001005`, but all coordinate slots are `-200` placeholders. That keeps `11001005` useful as "this replay scene exists" evidence, not as a live spatial trigger.

## Seventh-Pass Owner Wrapper Evidence

The recovered owner wrappers are small enough to make the dispatch contract explicit. `NpcBaseClass.delegateEvent` and `DirectorBaseClass.delegateEvent` both call the target actor's native resolver:

```text
target:_callFunction(method, player, owner, ...)
```

So the wrapper call is not just a function-name relay. It passes the active NPC/director owner into the quest method after resolving the target actor. If the active owner is blank, player-owned, a battle-command actor, or a director that the client does not accept for this event lane, the failure can happen before visible Lua reaches `Man0u1.processEvent035`.

`PlayerBaseClass` is the negative shape: it exposes `delegateCommand`, not `delegateEvent`, and calls `target:_callFunction(method, player, ...)`. That supports treating player/current-command ownership as the wrong namespace for quest event methods.

The server event-start path explains why `kickEventContinue` is the right proving step. `EventStartPacket` `0x012D` resolves `ownerActorID` by checking static actors, area actors, battle-command event actors, and owned directors. Then `Player.StartEvent` latches that owner/name/type tuple. `LuaEngine.PlayerEventWait.MatchesEventStart` checks only the expected owner id and event name, while later `_WAIT_EVENT` still resumes on the next event update without owner proof. The safe trace therefore has to show:

```text
kickEventContinue expected owner/name matched
  -> currentEventOwner/currentEventName/currentEventType are now clean
  -> RunEventFunction(delegateEvent, player, quest, "processEvent035")
```

## Eighth-Pass Replay and Comparator Evidence

Recovered `PopulaceCutScenePlayer` is a useful negative control for replay ids. Its replay flow opens the cutscene replay selector, receives a selected replay id, computes `questId = floor(replayId / 100)`, resolves the quest actor with `_getQuestActorForCutSceneReplay`, reads the scene key from `cutReplaySheet` column `0`, reads args from columns `8..15`, and then calls `startNQCutScene`/`startHQCutScene` or SNPC variants. That is a replay UI owner path, not a live quest-progress trigger. It reinforces that `11001005` is replay-row evidence for `man0u135`, not the post-kill start source.

The local kill-to-cutscene comparator remains the city tutorial directors (`QuestDirectorMan0u001`, `QuestDirectorMan0l001`, `QuestDirectorMan0g001`). Their kill hooks all delay through battle cleanup, close tutorial widgets, send the defeated attention message, silently set the next quest sequence, run `kickEventContinue(player, director, "noticeEvent", "noticeEvent")`, and only then call `delegateEvent` into the quest cutscene. They also explicitly end the event before zone/content cleanup. Ordinary quest `onKillBNpc` hooks in the checked scripts mostly increment counters or start sequences; I did not find another live local quest hook that directly launches a fade-after-warp quest scene from a kill callback.

## Ninth-Pass SQB and Asset Boundary

The generated SimpleQuestBattle contract is another negative result for hidden post-kill logic. It reports recovered SimpleQuestBattle inventory as recovered-only locally: no local `SimpleQuestBattleBaseClass` adapter, no local recovered child director scripts, and current quest-battle evidence is bespoke `Man*` content wiring. The recovered base behavior is limited to `eventContentGiveUp` and client quest-id helpers. For `man0u1` specifically, `QuestDirectorMan0u101` and `QuestDirectorMan0u102` are two-line empty subclasses of `QuestDirectorBaseClass`, so there is still no recovered success method that would call `processEvent035`.

The asset crosscheck adds one more clean namespace split. `cutscene_key_crosscheck.csv` has `man0u1` as a Lua reference only, with no `cutReplay` row and no client cut asset. By contrast, `man0u135` is present in Lua refs, `cutReplay`, and physical cut assets. `cutscene_asset_directory_inventory.csv` gives `client/cut/man0u135`, `file_count = 4`, `dataset_file_count = 3`, `total_bytes = 33977`, and `has_main_file = True`. So the quest owner is `man0u1`, while the playable scene asset is `man0u135`; the direct launch must bridge from owner method to scene key through `startNQCutScene`.

## Tenth-Pass CutScene Start Boundary

The recovered client Lua gives one deeper boundary below `startNQCutScene`. `QuestBaseClass.startNQCutScene` calls `worldMaster:createCutScene(sceneKey, quest):startCutScene(1, 61, mode, ...)`, then deletes the cutscene actor on success and returns the native result value. `WorldMaster.createCutScene` is just `_createActor(nil, "CutScene", false, sceneKey, owner)`.

`CutScene._onInit(sceneKey, owner)` then binds both halves explicitly: it calls `_setFilename(sceneKey)`, creates the `actorclass` spreadsheet, and stores `work.textOwner = owner`. Since `cutscene_u.lua` maps `_setFilename` to native `_setFilename_cpp`, the filename binding for `man0u135` happens at cutscene actor initialization, before `CutScene.startCutScene` reaches `_loadCutScene` or `_play`.

Inside `CutScene.startCutScene`, the order is:

```text
player:_fadeInNowLoadingForNoticeEventJustInArea()
cutscene:_loadCutScene()
desktopWidget:orderDesktopWidgetMode(61)
desktopWidget:showCutSceneSkip(cutscene)      -- for play mode 1
cutscene:_play(...)
desktopWidget:cancelDesktopWidgetMode(61)     -- on successful play
player:_waitForMapLoaded(nil)                 -- on successful play
```

`cutscene_u.lua` maps `_play` to native `_play_cpp`; `_loadCutScene` is present as the Lua-side load boundary. The earliest proof visible from server instrumentation is still the outbound `RunEventFunctionPacket` for `delegateEvent` with a clean owner tuple. The earliest client-side proof is `CutScene._onInit` / `_setFilename_cpp("man0u135")`; reaching mode-`61` `_loadCutScene` and `_play(...)` is the stronger proof that playback setup actually began. After `_play_cpp`, the remaining behavior is client native.

This also explains why `processEvent035` should be allowed to return before the server applies the type-`1` warp in the emulator flow. The quest method already does `startFadeOutCutSceneDefault`, then `startNQCutScene`, then `startFadeInCutSceneAfterWarp`; those helpers call native `_fadeOut_cpp`, `_waitForFading_cpp`, `_fadeInAfterWarp_cpp`, and the cutscene wrapper waits for map load on successful play. Injecting an extra server warp before the delegated method completes can overlap the client-side fade/cutscene/map-load state machine.

## Eleventh-Pass Local Runtime Bridge

The local runtime bridge makes the owner requirement measurable. `kickEventContinue(player, actor, trigger, ...)` queues `player:kickEvent(actor, trigger, ...)` and yields `_WAIT_EVENT_START` with the expected actor and event name. `LuaEngine.PlayerEventWait.MatchesEventStart` then requires the inbound `EventStartPacket` owner actor id and event name to match exactly before the script resumes. So a clean direct test should first prove a matching `0x012D` event start for the intended director/NPC owner.

`callClientFunction(player, functionName, ...)` is thinner: it calls `player:RunEventFunction(functionName, ...)` and then yields `_WAIT_EVENT`. `Player.RunEventFunction` does not repair or choose an owner; it builds `RunEventFunctionPacket 0x0130` directly from `currentEventOwner`, `currentEventName`, and `currentEventType`. That packet writes trigger actor id, owner actor id, event type, event name, function name, and Lua params. For `processEvent035`, the correct packet is therefore not `functionName = processEvent035`; it is `functionName = delegateEvent`, with params `(player, quest, "processEvent035")`, sent while the current tuple still points at the clean owner proven by the event start.

Plain `EventUpdatePacket 0x012E` is not owner-validated by the Lua wait. The packet parser reads trigger id, server/update fields, a one-byte step/event type, and Lua params; `Player.UpdateEvent` forwards only the Lua params to `LuaEngine.OnEventUpdate`. If no `_WAIT_EVENT` is registered for that player, `OnEventUpdate` returns and the update is lost. So the two likely direct-launch failure classes are now separable:

- Wrong owner tuple: `0x0130` goes out with blank/player/battle-command owner data, so the client never reaches the quest `delegateEvent` wrapper.
- Lost/empty update: `0x012E` arrives without a registered `_WAIT_EVENT`, or with no meaningful Lua params, so the server script resumes incorrectly or not at all.

The bridge contract agrees with this shape. Its `local_runtime_bridge.csv` marks `0x0130` as present but risky because owner actor/event type must match the active event or client methods can silently no-op. Its top `bridge_queue.csv` item is a standardized NQ/HQ `delegateEvent` launch wrapper that supplies the quest actor owner, correct event type/name, and closes the event only when the client flow expects it. That is the general form of the `processEvent035` fix.

The level-1 battle director comparator gives the same ordering in hand-authored script comments. `QuestDirectorMan0u001` says `StartSequence` and `kickEventContinue` are needed for `processEvent020` to fire, and that moving state/music changes above that point breaks the flow or replays the intro. Then it calls `delegateEvent` into the quest method, ends the event, and only afterward finishes content/warps. That is strong local evidence that the direct post-kill `man0u135` path should be staged as an event-lane handoff first, not as a naked kill-context client call.

## Twelfth-Pass DAT and Timeline Sweep

The generated method timeline pins `processEvent035` to exactly three client-side steps and no dialogue/widget/control extras:

```text
1. startFadeOutCutSceneDefault(A1_116)
2. startNQCutScene("man0u135", 1)
3. startFadeInCutSceneAfterWarp(A1_116)
```

`quest_method_context.csv` reports `timeline_step_count = 3`, `scene_launcher_count = 1`, `direct_scene_keys = man0u135`, `fade_mode = after_warp`, `classification = direct_scene_after_warp`, and `server_delegate_count = 1`. So there is no hidden text branch or extra client method in `processEvent035` that would decide when the scene starts. The scene start is the middle step of the method.

The wider DAT sweep did not find another `man0u135` live-trigger table in this checkout. Exact scene-key hits are the recovered Lua call, cutReplay row/text, generated crosschecks, and asset inventories. `quest_scene_asset_crosscheck.csv` gives one Lua reference, one function (`man0u1.processEvent035`), one replay row (`11001005`), four asset files, and three dataset files. `quest_cutreplay_rows_joined.csv` gives unlock kind `1` and all actor/argument slots as `-200` default placeholders, so replay metadata still does not provide a live position or trigger.

One more namespace warning: `quest_reward.csv` also has `11001005` through `11001019` reward rows for this quest family. For example, `11001005` is a reward row with item/value fields, while `cutReplay.csv` uses `11001005` for `man0u135`, and `quest_marker.csv` uses `11001005` for the Goldsmith marker. That strengthens the rule: never infer a live Coliseum trigger from the numeric id alone; table context is mandatory.

## Thirteenth-Pass Init, Clearer, and Skip Widget

The cutscene actor initialization gives an even earlier client-side boundary than `_loadCutScene`:

```text
worldMaster:createCutScene("man0u135", Man0u1)
  -> _createActor(nil, "CutScene", false, "man0u135", Man0u1)
  -> CutScene._onInit("man0u135", Man0u1)
  -> _setFilename_cpp("man0u135")
  -> work.textOwner = Man0u1
```

So if instrumentation can observe `CutScene._onInit` or `_setFilename_cpp`, that is the first client-side proof that the correct scene actor exists. `_loadCutScene` and `_play_cpp` are later proof points.

`CutScene.startCutScene` also begins by calling `player:_fadeInNowLoadingForNoticeEventJustInArea()` before `_loadCutScene`. Existing native notes identify that helper as more than a visual fade: it clears the player kick-target fields at `+0x128/+0x12c` back to the sentinel after calling native helpers. If a failed direct launch produces an immediate empty update and never clears those fields, that points back to event dispatch/owner failure before the cutscene body.

The desktop skip path gives another visible signal for mode `1` NQ scenes. Desktop static widget `12` is `CutSceneSkipWidget`, and static widget `13` is `CutSceneSkipWarningWidget`. `CutScene.startCutScene` calls `desktopWidget:showCutSceneSkip(cutscene)` for skippable play; the recovered desktop connector sets static widget `12`'s arg actor to that cutscene. If the user confirms skip, `CutSceneSkipWidget.processAskResult` calls `getArgActor():_skip()` and clears/hides the widget. Therefore, seeing widget `12` receive the `man0u135` cutscene actor is another proof that playback setup got past dispatch and into `CutScene.startCutScene`.

## Direct Test Shape

If we try the direct post-kill launch again, the test should prove the owner tuple before blaming the scene:

```text
fight won while SEQ_015 + CNTR_SEQ15_GLD == 1
  -> let the battle command/attack event settle, or explicitly close it
  -> do not warp yet
  -> kick/continue a real owner:
       director noticeEvent, matching the level-1 intro director pattern
       or an actual PopulaceStandard trigger event
  -> while current owner/name/type point at that clean owner:
       callClientFunction(player, "delegateEvent", player, quest, "processEvent035")
  -> after the event function returns:
       advance CNTR_SEQ15_GLD to 2
       warp to the type-1 post-fight exit position
       end the event/content group
```

Two negative controls matter:

- Do not raw `RunEventFunction("processEvent035")`; that does not select the `Man0u1` quest object.
- Do not use fire-and-forget `runClientFunction` before registering a wait; an empty or fast update can race the wait and look like a scene failure.

Minimum useful trace fields for the next run:

- Outbound `KickEvent` / event start: owner actor id, event name, event type, and whether `_WAIT_EVENT_START` matched the intended owner.
- Outbound `RunEventFunction` `0x0130`: trigger actor id, owner actor id, event name/type, function name, and Lua params.
- Inbound `EventUpdate` `0x012E`: trigger actor id, server codes, unknowns, `Step`, Lua param count, and whether `_WAIT_EVENT` existed before resume.
- Client-side cutscene side effects: `_fadeOut`, `CutScene._onInit`, `_setFilename_cpp("man0u135")`, `_loadCutScene`, desktop mode `61`, skip widget `12` arg actor, `_play`, `_waitForMapLoaded`, and `_fadeInAfterWarp`.

Expected direct-launch packet spine:

```text
0x012F KickEvent(player -> clean owner, "noticeEvent", type 5)
0x012D EventStart(owner == clean owner, event == "noticeEvent", type 5)
0x0130 RunEventFunction(owner == clean owner, event == "noticeEvent", type 5,
                        function == "delegateEvent",
                        params include player, Man0u1 quest actor, "processEvent035")
0x012E EventUpdate(reply while _WAIT_EVENT is registered)
0x0131 EndEvent(after cutscene/fade path returns)
```

## Fourteenth-Pass Risky Cutscene Runner

The broader decomp shows this is a reusable event-lane problem, not only a `man0u135` problem. In the generated client data, there are `287` recovered quest methods classified as `direct_scene_after_warp`. In the current server scripts, `144` delegate sites point at those methods across `13` scripts and `89` unique script/method pairs. `137` of the `144` also sit near a server warp or zone call, and `143` have nearby follow-up flow that changes event, quest, warp, sequence, counter, or flags.

That does not mean all `144` are broken. It means they all rely on the same invariant:

```text
clean owner event lane
  -> delegateEvent(player, quest, sceneMethod)
  -> wait for EventUpdate while _WAIT_EVENT is already registered
  -> then apply quest state / warp / EndEvent follow-up
```

The highest-risk shapes are:

- `callClientFunction(player, "delegateEvent", player, quest, method)` sent while the current event owner is a battle command, player, stale director, or empty actor.
- Direct `RunEventFunction(method)` calls that skip `NpcBaseClass.delegateEvent` / `DirectorBaseClass.delegateEvent` and never select the quest object.
- Fire-and-forget `runClientFunction` or native battle/director launch paths that let the client send an early/empty `0x012E` before the Lua `_WAIT_EVENT` exists.
- Server state changes, `EndEvent`, or warps that occur before the delegated scene method returns.

The smoother runner should therefore be boring and strict:

```text
1. Ensure a real event owner:
     PopulaceStandard/NpcBaseClass trigger, or DirectorBaseClass notice event.
     Do not use PlayerBaseClass/battle command as the owner for quest delegateEvent.

2. Prove the event lane:
     send KickEvent to that owner
     wait for matching EventStart owner id + event name + event type

3. Delegate, do not direct-call:
     RunEventFunction("delegateEvent",
                      player, questActor, "processEvent035")
     using the active clean owner tuple.

4. Block until the client answers:
     _WAIT_EVENT must be registered before accepting 0x012E.
     Empty or missing update should be logged as dispatch failure, not scene success.

5. Only after return:
     update counters/sequences/flags
     warp or zone
     EndEvent / finish content
```

For `Court in the Sands`, the exact risky row is `quests/man/man0u1.lua:847`: `processEvent035 -> man0u135`, followed by `IncCounter(CNTR_SEQ15_GLD)`, `WarpToPrivateArea(..., type 1, -177.893, 189.953, 218.754, 3.135)`, and `EndEvent`. The direct launch should make the client prove it entered `processEvent035` and reached `CutScene._onInit("man0u135", Man0u1)` before that follow-up runs.

The top live scripts with this pattern are:

```text
quests/man/man0u1.lua  30 delegate sites
quests/man/man2g0.lua  18
quests/man/man0g1.lua  17
quests/man/man0l1.lua  17
quests/man/man1u0.lua  16
quests/man/man1l0.lua  14
quests/man/man1g0.lua  10
quests/man/man2u0.lua   8
```

So yes: we know how to run this class more correctly now. The risky events still need to run, but they need to run inside a fresh event owner context. The current workaround is doing that by letting the real post-fight `PopulaceStandard` trigger own the event. A direct post-kill runner can be made equivalent if it recreates that owner lane before delegating the quest scene.

## Fifteenth-Pass Decomp Priority

More risky-event decomp is worth doing, but it should stay targeted. A simple scoring pass over the `144` live after-warp delegate sites gives:

```text
Tier A  92  after-warp scene + nearby warp/zone + EndEvent/state follow-up
Tier B  46  after-warp scene + partial follow-up risk
Tier C   6  after-warp scene with little immediate warp/state pressure
```

Tier A is the set most likely to expose the same failure as `processEvent035` if launched from a battle director, content script, or synthetic trigger instead of a normal NPC event. The heaviest scripts are:

```text
quests/man/man0u1.lua  30 sites, 13 unique methods, 13 scene keys
quests/man/man2g0.lua  18 sites,  9 unique methods, 12 scene keys
quests/man/man0g1.lua  17 sites, 14 unique methods, 13 scene keys
quests/man/man0l1.lua  17 sites, 12 unique methods, 11 scene keys
quests/man/man1u0.lua  16 sites,  9 unique methods,  9 scene keys
quests/man/man1l0.lua  14 sites,  8 unique methods,  8 scene keys
```

The next useful decomp buckets are:

- `man0u1` lines `829-860`: same Gladiator private-area chain as `processEvent035`, with `man0u130`, `man0u140`, `man0u135`, and post-fight/public-area handoff.
- `man0g1` and `man0l1`: the other starter-city chains have the same after-warp cutscene plus private-area/public-area transition shape.
- `man2g0`, `man1u0`, and `man1l0`: high site counts, likely later quest chains with the same runner requirement.
- Director comparator scripts, especially `QuestDirectorMan0u001`, `QuestDirectorMan0g001`, and `QuestDirectorMan0l001`, because they already prove `kickEventContinue` + `delegateEvent` + delayed state changes.
- Experimental cutscene probes: `Debug/CutsceneProbe.lua` now keeps only the clean delegated probe lane. The old raw scene-key and direct NQ probe modes were removed after the owner-lane decomp passes below.

The most valuable implementation-side decomp is still the runner boundary:

```text
kickEventContinue / EventStart match
  -> currentEventOwner/currentEventName/currentEventType
  -> RunEventFunctionPacket(delegateEvent)
  -> _WAIT_EVENT registration
  -> EventUpdate resume
  -> EndEvent/warp sequencing
```

Once that runner is solid, the individual quest decomp mostly becomes data validation: method name, scene key, expected owner class, and what state/warp should happen after the client returns.

## Sixteenth-Pass Narrowed Risk Map

The risky set narrows a lot once "data-pattern risky" is separated from "actually risky in current server code."

Green bucket, likely already good:

- Normal quest-script `delegateEvent` rows in `Data/scripts/quests/...`. These account for the `144` live after-warp delegate sites, but they usually run inside an existing NPC event lane and `callClientFunction` waits on `_WAIT_EVENT`. They are not automatically broken.
- The level-1 tutorial quest directors `QuestDirectorMan0u001`, `QuestDirectorMan0g001`, and `QuestDirectorMan0l001`. Their post-kill flows already do the important thing: `kickEventContinue(player, director, "noticeEvent", "noticeEvent")` before `callClientFunction(..., "delegateEvent", player, quest, method)`, then state/warp cleanup afterward.
- `processEvent035` when launched by the real `GLD2_TRIG`/`PopulaceStandard` push context. That is the current safe workaround because the event owner is clean before the quest method is delegated.

Yellow bucket, probably okay but should get proof logs before being trusted as a template:

- `QuestDirectorMan2g001.lua`: `onEventStarted` calls `man2g0.processEvent010`, then `EndEvent`, sequence, and `DoZoneChange`. Because it starts from a director event, the owner lane should be clean, and the old bad `npc:GetActorClassId()` reference in the director callback has been removed. It still wants a live trace before becoming a reusable template because it lacks the explicit `kickEventContinue` proof used by the tutorial directors.
- `PopulaceFlyingShip.lua`: transport departure sends `player:RunEventFunction("startNQCutScene", cutsceneName, 1)` and immediately ends the event, but `WorldManager.TriggerTransportDepartureEvent` first finds a real attendant NPC and kicks that NPC's `noticeEvent`. This is green for transport, but still not a reusable quest-scene template.

Red bucket, not a normal production path:

- Hamlet cutscene/widget probes in `Data/scripts/directors/Hamlet/Defense.lua` and `HamletDefenseManager.cs`: disabled unless `hamlet_defense_enabled=true`; the default is now the recovered `startEvent(...)` instance lifecycle; the old replay-delegate and raw direct/NQ cutmodes have been removed.
- `Debug/CutsceneProbe.lua`: useful for experiments, but it now exposes only the delegated debug path; raw NQ/direct probes have been removed.

Confidence split:

```text
100% static confidence:
  RunEventFunction uses the current owner/name/type tuple exactly.
  PlayerBaseClass has delegateCommand, not delegateEvent.
  NpcBaseClass and DirectorBaseClass provide delegateEvent.
  kickEventContinue proves owner id + event name before resuming.
  callClientFunction registers _WAIT_EVENT after sending 0x0130.

99% operational confidence for quest cutscenes if:
  owner is a live NpcBaseClass/DirectorBaseClass event owner,
  EventStart has matched that owner/event,
  functionName is delegateEvent,
  params are player, quest actor, method,
  the server waits for EventUpdate before state/warp/EndEvent,
  and the target method is a recovered quest method.

Not 99%:
  command/player owner,
  raw scene-key function calls,
  raw startNQCutScene from server code,
  director-source 0x0130 without EventStart proof,
  or fire-and-forget scene launch followed by warp/end.
```

So the narrowed answer is: the quest data is mostly good; the risky surface is now the small set of nonstandard launchers. For `Court in the Sands`, a direct post-kill launch becomes 99% confidence once it follows the same green pattern as the tutorial directors: create/prove a director or NPC owner event lane, delegate `processEvent035`, wait, then mutate `CNTR_SEQ15_GLD` and warp.

Remaining exact launcher sites after hardening:

```text
Map Server/WorldManager.cs:3014
  Toto-Rak legacy duty cutscene now kicks director noticeEvent first.

Data/scripts/occupancy_dungeon_widget.lua:129
  OccupancyDungeonKickEventNoticeCutScene now kicks noticeEvent; old direct
  eventNoticeCutScene sender and opening startNQ fallback are gone.

Data/scripts/directors/Debug/CutsceneProbe.lua:67-71
  Debug delegated probe only; raw NQ/direct variants have been removed.

Data/scripts/directors/InstanceRaid/InstanceRaidBaseClass.lua:30-121
  Raw instance-raid RunEventFunction helpers. Legitimate for recovered director UI functions, but they should not be copied into quest cutscene launch code.

Data/scripts/base/chara/npc/populace/PopulaceFlyingShip.lua:182
  Fire-and-close transport cutscene. Intentional transport flow with real NPC
  noticeEvent owner; not a quest-scene template.
```

Everything outside that list that uses quest `delegateEvent` should be judged by one question: did it come from a clean NPC/director EventStart, or did it synthesize the call? Clean EventStart plus `_WAIT_EVENT` is the good path; synthetic/raw call is the path to keep decomping or wrap.

## Seventeenth-Pass Production Reachability

The remaining red list narrows again when checked for production reachability.

For quest cutscenes, confidence is now high:

```text
99% good for quest CS launch:
  normal NPC/director event owner
  -> delegateEvent(player, quest, method)
  -> _WAIT_EVENT
  -> state/warp/end after return
```

The `144` scary quest rows are mostly green under that rule. They are data-pattern risky only if someone reuses them from a synthetic owner. The Court in the Sands workaround is also green because the post-fight trigger gives the client a real `PopulaceStandard` owner before delegating `processEvent035`.

Current production/default reachability:

```text
GREEN
  Normal quest NPC flows.
  Tutorial director post-kill flows that explicitly use kickEventContinue first.
  Court in the Sands GLD2_TRIG/PopulaceStandard workaround.
  Toto-Rak NPC entry with current defaults:
    TOTORAK_NPC_ENTRY_WIDGET_ENABLED = false
    TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED = true

  Toto-Rak debug content director:
    Instance/Totorak now only closes its event; the old entry quest cutscene
    replay and _setInstanceRaid call were removed.

GREEN
  PopulaceFlyingShip transportDeparture:
    fire-and-close startNQCutScene + EndEvent, but WorldManager first kicks a
    real attendant NPC noticeEvent and transport timing owns completion. Not a
    quest-template runner.

  InstanceRaidBaseClass raw RunEventFunction helpers:
    used for recovered director UI functions, not quest actor cutscenes.

  QuestDirectorMan2g001:
    director EventStart shape should be okay, but the script should still be
    traced because it lacks the explicit kickEventContinue proof. The bad
    npc:GetActorClassId() reference in the director callback was removed.

SAFETY-GATED / CURRENTLY DISABLED
  Toto-Rak legacy occupancy cutscene bridge:
    The recovered rad0f300-rad0f308 mappings remain documented, but a live
    csprobe wedged the client during the pre-zone occupancy-director bind.
    Normal entry now forces the widget-only path. GM scene probes, terminal
    scenes, and boss-death scenes all refuse dispatch until an owner-matched,
    post-zone-ready noticeEvent handshake is captured and reproduced.

DEBUG / DOES NOT BLOCK NORMAL QUEST CONFIDENCE
  !totorak cutscene now routes to the safer Bloisirant NPC click path.
  Debug/CutsceneProbe delegated probe mode.
  Hamlet cutscene experiments no longer include raw direct/NQ cutmodes.
```

So the practical confidence answer is:

```text
Quest cutscene runner rule: 99% now.
Court in the Sands workaround: 99% now.
Whole repo known normal cutscene-like things: 99% static after the Toto-Rak
legacy duty CS bridge patch.
100% is not a realistic static claim until at least one live packet trace proves
EventStart -> delegate/run -> EventUpdate -> map/fade completion on each class
of runner.
```

The next single best proof target is no longer another static decomp pass. It is a live trace of Toto-Rak or airship showing `KickEvent -> EventStart -> RunEventFunction -> EventUpdate -> EndEvent` with the expected owner tuple.

## Eighteenth-Pass Toto-Rak Occupancy Bridge

The Toto-Rak bridge is now narrowed enough that the risky part is specific.
The recovered client method proves the cutscene payload shape:

```lua
function RaidFst0Dungeon03.eventNoticeCutScene(director, player, sceneKey, cutsceneArg, finishTime)
  if sceneKey ~= "rad0f300" then
    player:_fadeOut(1)
    if sceneKey == "rad0f306" or sceneKey == "rad0f307" or sceneKey == "rad0f308" then
      desktopWidget:closeRaidDungeonExecutionWidget()
    end
    player:_waitForFading()
  end

  worldMaster:createCutScene(sceneKey, director):startCutScene(1, 61, 1, 0, cutsceneArg)
  worldMaster:createCutScene(sceneKey, director):_delete()
  player:_fadeIn(1)
  desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
end
```

So the server-side argument order is correct:

```text
eventNoticeCutScene(player, sceneKey, cutsceneArg, finishTime)
Toto-Rak content id: 1
Toto-Rak widget display id: 2123
opening scene: rad0f300
ending/close-before-scene keys: rad0f306, rad0f307, rad0f308
```

The current direct bridge sends the right function with the right parameters:

```text
SendTotorakLegacyDutyCutscene
  -> QueueTotorakLegacyDutyRunFunction(
       event = noticeEvent,
       type = 5,
       function = eventNoticeCutScene,
       params = player, sceneKey, cutsceneArg, finishTime)
```

But it still skips the strongest safety property:

```text
0x012F KickEvent(director, "noticeEvent", "eventNoticeCutScene", ...)
0x012D EventStart(owner == director, event == "noticeEvent")
currentEventOwner/currentEventName prove active noticeEvent
0x0130 RunEventFunction(owner == current director, event == noticeEvent,
                        function == eventNoticeCutScene)
0x012E EventUpdate while _WAIT_EVENT exists
0x0131 EndEvent after the client path returns
```

That matters because the local helpers do not repair ownership:

```text
Player.RunEventFunction:
  uses currentEventOwner/currentEventName/currentEventType exactly.

Director.SendDirectorEventFunction:
  hardcodes director + noticeEvent + type 5, but does not create EventStart.

QueueTotorakLegacyDutyRunFunction:
  hardcodes director + noticeEvent + caller-provided type, but does not create
  EventStart.
```

The bridge already has a safer pattern nearby. Widget open does this:

```text
KickTotorakLegacyDutyEvent(..., "relogin", ...)
  -> wait until IsTotorakLegacyNoticeEventActive(player, director)
  -> QueueTotorakLegacyDutyRunFunction(..., player.currentEventType, "relogin", ...)
  -> optional explicit type-5 retry while the active event still exists
  -> EndEvent
```

The cutscene path should follow that same lane. The high-confidence version is:

```text
KickTotorakLegacyDutyEvent(..., "eventNoticeCutScene",
                           sceneKey, cutsceneArg, finishTime)
  -> wait for IsTotorakLegacyNoticeEventActive(player, director)
  -> send eventNoticeCutScene with player.currentEventType
  -> keep the event open until the client returns or until a guarded timeout
  -> EndEvent
```

There was one Lua-side trap in the fallback path:

```text
OccupancyDungeonCallCurrentEventNoticeCutScene
  -> callCurrentEventFunction("eventNoticeCutScene", ...)
  -> previously callOpeningFallback(...)
     -> callClientFunction("startNQCutScene", sceneKey, arg)
     -> callClientFunction("relogin", player, finishTime, false)
```

That fallback was useful for experiments, but it was not a production 99% path.
It has been removed from the normal `eventNoticeCutScene` command path, so a
successful occupancy cutscene is no longer followed by a second direct
`startNQCutScene` call.

The server bridge has also been changed:

```text
before:
  SendTotorakLegacyDutyCutscene
    -> QueueTotorakLegacyDutyRunFunction(type 5, "eventNoticeCutScene", ...)

after:
  SendTotorakLegacyDutyCutscene
    -> KickTotorakLegacyDutyEvent("eventNoticeCutScene",
                                  sceneKey, cutsceneArg, finishTime)
    -> client EventStart for director noticeEvent
    -> RaidFst0Dungeon03.onEventStarted
    -> OccupancyDungeonCallCurrentEventNoticeCutScene
    -> callClientFunction("eventNoticeCutScene",
                          player, sceneKey, cutsceneArg, finishTime)
```

The Toto-Rak GM probes were aligned with the same rule too:

```text
!totorak dutycs:
  now kicks RaidFst0Dungeon03 noticeEvent with command eventNoticeCutScene
  instead of calling OccupancyDungeonSendEventNoticeCutScene directly.

!totorak livecs:
  now calls the live bridge without the old unsafe/crash guard wording.
```

The reusable occupancy helper was also renamed/reworked from a direct sender to
`OccupancyDungeonKickEventNoticeCutScene`, and both recovered occupancy director
stubs now use it:

```text
RaidFst0Dungeon03.eventNoticeCutScene -> KickEvent noticeEvent
RaidRoc0Dungeon01.eventNoticeCutScene -> KickEvent noticeEvent
```

Confidence after this pass:

```text
Payload/signature: 97% from recovered RaidFst0Dungeon03 client code and the
  legacy occupancy protocol table.

Event owner risk: no known normal Toto-Rak direct cutscene bridge remains.
  The production path now asks the client to start a director noticeEvent first.

Quest cutscenes: 99% with clean NPC/director owner + delegateEvent + wait.

Whole-repo cutscene-like paths: 99% static confidence for the known normal
  quest/Toto-Rak paths after this patch. 100% still needs a live packet trace.
```

## Nineteenth-Pass Remaining Direct Cutscene Surfaces

After the Toto-Rak bridge patch, the remaining static `startNQCutScene` script
hits are no longer normal quest/occupancy paths:

```text
PopulaceFlyingShip transportDeparture:
  GREEN. WorldManager finds a real airship attendant NPC and sends
  KickEvent(owner, "noticeEvent", "transportDeparture", cutsceneName, ...).
  The script then uses Player.RunEventFunction inside that active noticeEvent
  and immediately EndEvent()s because the transport timer owns completion.

Debug/CutsceneProbe:
  DEBUG ONLY. The GM command now only accepts the delegated probe mode. Direct
  NQ and raw scene-key probe modes were removed.

Hamlet Defense:
  NO RAW/NQ CUTSCENE START REMAINS. InstanceRaidHamletDefense inherits
  InstanceRaidBaseClass, whose retail cutscene path is executeCutScene(...)
  -> createCutScene(scene, owner):startCutScene(1, 63, mode, ...).
  QuestBaseClass.startNQCutScene uses startCutScene(1, 61, ...), so the old
  Hamlet unsafe-nq / unsafe-direct / unsafe-nqdelegate probes were removed.
  The follow-up delegate probe pass also removed etcdelegate/directordelegate;
  Hamlet now starts through the recovered director method startEvent(...).

Comment-only man0g1 startNQCutScene note:
  NO RUNTIME RISK.
```

Current confidence:

```text
Known normal quest cutscene paths: 99%.
Court in the Sands workaround: 99%.
Toto-Rak / Dzemael occupancy cutscene helper shape: 99% static.
Airship transport departure: 99% static for owner/event lane.

No known normal or GM cutscene command path still exposes raw direct/NQ starts.
100% still requires live packet traces for each active class of runner.
```

## Twentieth-Pass Hamlet Unsafe Cutmode Removal

Recovered Hamlet client data gives a cleaner answer than the old probes did:

```text
InstanceRaidHamletDefense
  -> inherits InstanceRaidBaseClass
  -> startEvent(...)
  -> executeCutScene(scene, owner, clearFlag, ...)
  -> createCutScene(scene, owner):startCutScene(1, 63, mode, ...)
```

By contrast, `QuestBaseClass.startNQCutScene` is the quest cutscene helper:

```text
QuestBaseClass.startNQCutScene(scene, mode, ...)
  -> createCutScene(scene, quest):startCutScene(1, 61, mode, ...)
```

So `!testhamlet cutmode unsafe-nq` was not an alternate Hamlet retail path; it
forced a quest cutscene protocol onto an instance-raid director. The raw
`unsafe-direct` path was even weaker because the recovered Hamlet director has
no per-scene Lua functions named like `ham0f301`.

One more delegate pass closes the old "safe but inert" probes:

```text
DirectorBaseClass.delegateEvent(player, target, method, ...)
  -> target:_callFunction(method, player, eventOwner, ...)

Etc202
  -> ScenarioBaseClass
  -> no ham0f301 / ham0f302 methods

InstanceRaidHamletDefense
  -> InstanceRaidBaseClass
  -> no ham0f301 / ham0f302 methods
  -> does have cutSceneEvent(scene, ...)
```

That means `etcdelegate` and `directordelegate` were clean-owner tests, but they
were not real Hamlet cutscene launchers. They delegated to missing scene-key
methods and matched the old live result: `noticeEvent params=false`, no visible
scene. The remaining Hamlet cutmodes are now only:

```text
instance
off
```

The next lifecycle pass tightens `instance` again. `cutSceneEvent(scene, ...)`
is recovered and valid, but it is a mid-duty hook: it fades out, calls
`executeCutScene`, fades back in, and returns. It does not set
`instanceRaidWork.contentID`, does not open `HamletDefenseWidget`, and does not
set `instanceRaidWork.initFlag`. The recovered opening initializer is
`startEvent(...)`.

`instance` now calls the recovered current-owner initializer:

```text
noticeEvent("opening", "ham0f301")
  -> Data/scripts/directors/Hamlet/Defense.lua
  -> player:RunEventFunction("_setInstanceRaid", true)
  -> callClientFunction(player, "startEvent",
       "ham0f301", director, true, raidDungeonId, startTime, finishTime, 1)
  -> InstanceRaidBaseClass.startEvent
  -> processLogin(false)
  -> processStartEvent(...)
  -> executeCutScene("ham0f301", director, true)
  -> createCutScene("ham0f301", director):startCutScene(1, 63, 1, ...)
  -> processStartEffect()
  -> InstanceRaidHamletDefense.openInformationWidget()
  -> instanceRaidWork.initFlag = true
```

Because `startEvent(...)` owns `openInformationWidget()` and sets `initFlag`, the
intro handler no longer follows it with the older manual Lua widget-open burst.
`openHamletDefenseWidget` remains only for explicit widget probes, not for the
normal Hamlet start path.

`!testhamlet cutmode off` now still enters `startEvent("none", ...)`; it only
skips the opening scene asset. That keeps the client lifecycle initialized for
widget and user-message testing.

That leaves Hamlet investigation focused on the real instance/director event
lane instead of carrying direct scene-key, replay-delegate, or NQ quest-helper
probes forward.

## Twenty-First-Pass Legacy Toto-Rak / Man2g Cleanup

The remaining nonstandard Toto-Rak entry cutscene surfaces were old debug paths,
not recovered retail launchers:

```text
!totorak cutscene
  before: prepared quest, then delegated the quest cutscene from GM command context
  after:  prepares quest and rebinds Bloisirant; the player must click the real NPC

Data/scripts/totorak_entry.lua
  before: contained a disabled-but-reenableable direct entry cutscene toggle
  after:  no runtime path calls the entry quest cutscene from Bloisirant

Data/scripts/directors/Instance/Totorak.lua
  before: debug content director sent _setInstanceRaid and replayed entry quest CS
  after:  debug content director only closes its event
```

That removes the last known command/debug Toto-Rak entry cutscene replay from the
static risk map. The normal/live Toto-Rak cutscene bridge remains the recovered
occupancy `noticeEvent -> eventNoticeCutScene` path.

`QuestDirectorMan2g001` was also cleaned up. Its director callback used to read
`npc:GetActorClassId()` even though the callback owner is a director, not an NPC.
That could abort the event before `man2g0.processEvent010` ran. The callback now
uses the director event context, guards a missing `Man2g0` quest, then delegates
the recovered quest method and only afterwards ends the event, advances sequence,
finishes content, and zones the player.

## Working Conclusion

The direct CS start is:

```text
valid NPC/director event owner
  -> delegateEvent(player, quest, "processEvent035")
  -> Man0u1.processEvent035
  -> startNQCutScene("man0u135", 1)
  -> createCutScene("man0u135", quest)
  -> CutScene._onInit("man0u135", quest)
  -> _setFilename_cpp("man0u135")
  -> startCutScene(1, 61, 1, ...)
  -> _loadCutScene()
  -> _play_cpp(...)
```

The state timing is:

```text
SEQ_015 + CNTR_SEQ15_GLD == 1 + fight won
  -> run processEvent035 from clean owner if possible
  -> then CNTR_SEQ15_GLD becomes 2 / post-fight marker 11001008
```

If the battle/kill context cannot guarantee a valid event owner, the safer workaround remains data-consistent: mark the fight won, move to the post-fight state/position, and let a real `PopulaceStandard` push owner, such as a custom post trigger or adjusted `GLD2_TRIG` fallback, run `processEvent035`.
