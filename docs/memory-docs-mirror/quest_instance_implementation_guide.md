# Quest Instance Implementation Guide

This guide is for building quest-only private areas and runtime content instances in the current server. The codebase uses "instance" for a few related ideas, so this document uses "quest instance" as the umbrella term and splits the implementation into two paths:

- Static private areas: predeclared child areas of a zone, usually `PrivateAreaMasterPast`.
- Dynamic content areas: runtime `PrivateAreaContent` objects with a content script and director.

Use this as a builder checklist. It is not a complete reverse-engineering report.

## Current Shape

The server already has the core plumbing:

- `Map Server/Actors/Area/Zone.cs` owns static `privateAreas` and runtime `contentAreas`.
- `Map Server/Actors/Area/PrivateArea.cs` models static private areas.
- `Map Server/Actors/Area/PrivateAreaContent.cs` models runtime content areas and cleanup.
- `Map Server/WorldManager.cs` provides `WarpToPrivateArea`, `WarpToPublicArea`, `DoZoneChange`, `DoZoneChangeContent`, and the Toto-Rak runtime dungeon path.
- `Map Server/DataObjects/Session.cs` rebuilds the per-player actor instance list and enforces runtime boundaries.
- Quest scripts under `Data/scripts/quests` drive entry, exit, sequence changes, and cutscenes.

As of this repo pass:

- `Data/sql/server_zones_privateareas.sql` declares 59 static private areas.
- Quest scripts use private/content-area APIs in 20 quest records.
- Six quest scripts create dynamic content areas directly: `Man0l0`, `Man0g0`, `Man0u0`, `Man0l1`, `Man200`, and `Man2g0`.
- Toto-Rak has a separate runtime dungeon flow with party checks, copied dungeon spawns, timer state, re-entry checks, and disconnect recovery.
- GC, primal, and high-end raid scripts are mostly placeholders or missing. Do not copy those as complete examples.

## Choosing A Path

Use a static private area when:

- The same staged space can be reused from SQL.
- The scene is mostly NPC placement, cutscenes, dialogue, or simple quest state.
- It is acceptable that the area is a long-lived zone child rather than a fresh per-run copy.
- You need to place many fixed ENPCs with `server_eventnpc_spawn_locations.sql`.

Use a dynamic content area when:

- The quest needs isolated per-run state.
- You need to spawn temporary allies, enemies, triggers, or path companions.
- Completion should destroy or retire the spawned actors.
- The content needs a director, content group, kill callbacks, tutorial mode, or party/runtime behavior.

For a real combat duty or dungeon, prefer dynamic content. For Echo rooms, staged guild scenes, and story-private NPC layouts, static private areas are usually enough.

## Fight Quest Field Notes

Before changing C# area plumbing or inventing a new director, verify the quest's physical staging. A wrong position can look exactly like a broken instance: the player enters a private area, sees the instance message, but lands behind collision, outside the intended arena, or near the wrong trigger.

For every quest battle, capture these positions first:

- Entry trigger position and private area type.
- Player fight start position.
- Enemy spawn position.
- Win/fail exit position.
- Follow-up trigger position after the fight.
- Public fallback position if the quest exits the private area entirely.

Use GM tools while testing:

```text
!where
!questcomplete list
!questcomplete <profile> <checkpoint>
!questcomplete <questId> <sequence> [counter0] [counter1] [counter2] [counter3]
```

Recommended implementation order for quest fights:

1. Stage the quest to the entry checkpoint.
2. Warp to the exact entry trigger, not the guessed battlefield.
3. Verify `!where` before and after entry.
4. Spawn the enemy at the known retail/static position.
5. Confirm the fight works with no cutscene or director bootstrap.
6. Add fight start messages, timers, and aggro delay.
7. Add kill counter updates.
8. Add post-kill cutscene and exit after the fight is stable.

Keep kill callbacks narrow. They should update quest data and send simple messages. Avoid warping, spawning triggers, or starting cutscenes directly from a kill callback while the client may still be resolving an active battle command event. If a spell or attack event is still active, warping at the same moment can leave the client in loading/error state. Use a delayed controller loop or director step to wait, close the active event, then move the player or kick a cutscene.

Trigger actor class matters:

- `ObjectEventDoor` actors show the client "move to this area" prompt before quest `onPush` runs. They are good for doors and explicit entry prompts.
- `PopulaceStandard` push triggers route directly through quest `onPush` and are better for invisible cutscene volumes.
- If an actor appears around the player's current position, the client may not fire the push until the player exits and re-enters the volume. For automatic post-fight cutscenes, either place the player just outside the trigger and move them in, or server-kick the event after the trigger actor exists and the current battle event is closed.

## Cutscene Lifecycle Decomp Notes

The local decomp points at lifecycle/context as the main risk, not missing scene keys. In `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario`, quest scripts call `startNQCutScene` 567 times across 129 files, `startFadeOutCutSceneDefault` 631 times across 131 files, and `startFadeInCutSceneAfterWarp` 304 times across 93 files. That makes fade-after-warp a normal quest pattern, not an exceptional one.

A wider function-level pass found 399 cutscene-bearing quest scenario functions. Of those, 362 are `processEvent*` methods, 214 include `startFadeInCutSceneAfterWarp`, 33 call multiple cutscenes, and 21 contain both default-fade and after-warp fade paths. So yes, the lifecycle pattern is common across many cutscenes; the fragile part is launching the correct quest/director method from the correct active owner context.

A focused after-warp classifier gives the cleaner cut: 304 quest scenario functions call `startFadeInCutSceneAfterWarp`; 291 also contain a direct scene call in the same body (`startNQCutScene`, `startHQCutScene`, or `startSnpc...CutScene`), while 13 are fade/warp/talk cleanup helpers with no direct scene call. Almost all after-warp functions still fade out first: 302 of 304 contain `startFadeOutCutSceneDefault`. That makes the Man0u1 shape common, but it also explains why "after-warp" alone is not proof that a scene body should run.

A stricter scene-call parser found 320 direct scene calls inside after-warp functions. The dominant shape is `startNQCutScene(scene, 1)` with 265 calls; `startNQCutScene(scene, 2)` appears 22 times, SNPC NQ mode `1` appears 20 times, HQ mode `1` appears 6 times, SNPC NQ mode `2` appears 5 times, and SNPC HQ mode `1` appears 2 times. All Man0u1 post-Coliseum scenes in scope (`processEvent035`, `040`, `045`, `050`, `090`, `220`) use mode `1`.

Observed cutscene families:

| Family | Entry point | Client cutscene call | Fade/warp shape | Notes |
| --- | --- | --- | --- | --- |
| Quest NQ | `QuestBaseClass.startNQCutScene` | `createCutScene(scene, quest):startCutScene(1, 61, mode, ...)` | Usually `fadeOut -> startNQCutScene -> fadeInAfterWarp` for warp cases | `startCutScene` itself waits for map load when mode is not `64`; the normal fade-in wrapper also waits before `_fadeIn`. |
| Quest HQ | `QuestBaseClass.startHQCutScene` | `startCutScene(1, 62, mode, ...)` | Same wrapper style as NQ | Less relevant to the current dungeon/Coliseum issues but confirms mode `62` is its own family. |
| Legacy occupancy dungeon | `RaidFst0Dungeon03.eventNoticeCutScene` | `createCutScene(scene, director):startCutScene(1, 61, 1, 0, arg)` | Opening Toto-Rak scene `rad0f300` skips the pre-fade; later scenes fade out first and may close the raid widget | Opens `openRaidDungeonExecutionWidget(2123, 1, finishTime)` after the scene. Dzemael uses the same shape with `4102, 2`. |
| Modern InstanceRaid | `InstanceRaidBaseClass.startEvent` | `executeCutScene -> startCutScene(1, 63, mode, ...)` | Scene `"none"` uses `_fadeInNowLoadingForNoticeEventJustInArea`; real scenes use mode `63`, then fade in and open the widget | `initFlag` is set only after fade/widget startup. `_onReceiveDataPacket` ignores clear/timer/message packets before that. |
| Login/system | `LoginEventCommand` and object helpers | Mostly mode `61` | Often ends with `_fadeInAfterWarp()` | Useful as examples, but they are not dungeon lifecycle owners. |

Practical implications for local fixes:

- Keep the active event context alive while a client cutscene function is running. For quest fade-after-warp cases, the decomp shape expects the quest or director event to own `fadeOut -> cutscene -> fadeInAfterWarp`.
- Treat an immediate empty `EventUpdate` after `delegateEvent(..., quest, "processEvent035", ...)` as a dispatch/context miss until proven otherwise, not as a stuck `man0u135` playback. The client has answered; the missing evidence is that the quest method actually ran.
- In the local packet path, `0x012E EventUpdate` parses as `triggerActorID`, `serverCodes`, `unknown1`, `unknown2`, one byte logged as `Step`, then Lua params. `LuaEngine.OnEventUpdate` resumes waiting Lua with only the Lua params. So an empty `Step=0x4D` update is evidence that the client returned an update envelope, not evidence that `0x4D` was returned to the quest script.
- `callClientFunction` sends `RunEventFunction` and immediately yields `_WAIT_EVENT`; `runClientFunction` does not. Any `runClientFunction -> warp/delay -> waitClientFunction` probe must distinguish a true client no-op from a fast empty update that arrived before the wait was registered.
- The normal local script shape is overwhelmingly blocking: `Data/scripts` currently has 1348 `callClientFunction(..., "delegateEvent", ...)` callsites, but only 5 `runClientFunction(..., "delegateEvent", ...)` callsites, all in `man0u1`. The quest cutscene wrapper is common; fire-and-forget delegate plus immediate same-area warp is the outlier to prove.
- Some cutscene wrappers choose `startFadeInCutSceneAfterWarp` versus `startFadeInCutSceneDefault` from scene return values or function args. A server-side warp before proving which branch ran can double-handle or race the client's own finish path.
- `RunEventFunctionWithType` only overrides the event type byte. The outgoing packet still carries `currentEventOwner` and `currentEventName`, so a blank/stale owner can make `delegateEvent` no-op even when the forced type is `ETYPE_PUSH`.
- Treat event-owned warp helpers as the safer shape when a same-zone or public/private warp is part of a cutscene. Warping directly from a kill callback can collide with a still-active battle command event.
- Do not assume `_setInstanceRaid(true)` starts the modern `InstanceRaidBaseClass.startEvent` lane. The decomp only shows `AreaBaseClass._onInit` mirroring an area flag into `_setInstanceRaid`; it does not show it as the event lifecycle trigger.
- Do not use raw native cutscene sub-ops or warp sub-ops as a substitute for the recovered Lua choreography. The high-level Lua paths are still the better evidence.
- Keep owner-field `EndEvent` experimental. Normal NPC/talk close behavior still appears to want the standard close shape, and dungeon probes should not change ordinary talk/push close behavior globally.

Additional lifecycle anchors from the wider decomp pass:

- `CutScene.startCutScene` begins by calling `_fadeInNowLoadingForNoticeEventJustInArea()`, then `_loadCutScene()`, hides static widget `14`, may order desktop widget mode `61`, `62`, or `63`, plays or replays the scene, hides the skip widget if shown, cancels the desktop mode on successful non-held playback, and waits for map load when the desktop mode is not `64`.
- For the common quest mode `startCutScene(1, 61, 1, ...)`, the decompiled body orders desktop mode `61`, shows the cutscene skip widget, calls `_play(...)`, hides the skip widget, cancels desktop mode `61` on successful playback, and then waits for map load. An immediate empty update with no skip/static-widget/fade side effects is therefore below the real scene-play path.
- The cutscene/fade leaves in this path are native bindings, not Lua fallback code. The recovered inline stubs map `CutScene._setFilename_inl` to `_setFilename_cpp`, `_play_inl` to `_play_cpp`, `_replay_inl` to `_replay_cpp`, `_skip_inl` to `_skip_cpp`, and player fade/load waits to `_fadeIn_cpp`, `_fadeOut_cpp`, `_fadeInAfterWarp_cpp`, `_waitForFading_cpp`, `_fadeInNowLoadingForNoticeEventJustInArea_cpp`, and `_waitForMapLoaded_cpp`. If the dispatch never reaches the quest/cutscene body, no Lua-side recovery path will manufacture those effects.
- `QuestBaseClass.startFadeInCutSceneAfterWarp` is only a zone guard plus native player call: outside the `"test"` zone it calls `player:_fadeInAfterWarp()` directly. By contrast, `startFadeInCutSceneDefault` explicitly waits for map load, fades in, and waits for fading. After-warp cases therefore depend on the native warp-finalize path being armed correctly.
- Static scan update: `startFadeInCutSceneAfterWarp` appears 304 times across 93 quest scenario files, while `startFadeInCutSceneDefault` appears 375 times across 121 quest scenario files. Direct native `_fadeInAfterWarp()` appears only 9 times in recovered Lua and otherwise funnels through quest, instance-raid, or object helper wrappers.
- Second-pass after-warp scan: of the 304 quest scenario functions with `startFadeInCutSceneAfterWarp`, 291 contain a direct cutscene call in the same function and 13 do not. The no-direct-scene group includes talk/ask/fade cleanup shapes such as `Thm300.processEvent035`; the direct-scene group includes `Man0u1.processEvent035`, `processEvent040`, `processEvent045`, and many ordinary class/job quest wrappers.
- The exact no-direct-scene after-warp bucket is small and mundane: `Bsm200.processEventBodenolfStart`, `Bsm200.processEvent005`, `Bsm300.processEventBodenolfStart`, `Bsm300.processEvent015`, `Bsm306.processEventBodenolfStart`, `Cul300.processEvent025`, `Gla306.processEvent045`, `Man0l1.processEvent637`, `Man2g0.processEvent007_2_2`, `Thm300.processEvent035`, `Wdk200.processEvent025`, `Wdk306.processEventMarcelloixStart`, and `Wdk306.processEvent025`. These are mostly talk/ask/wait/fade transition helpers, so they are good negative controls but should not be used to explain away a direct-scene target like `Man0u1.processEvent035`.
- Direct `_fadeInAfterWarp()` callsites are few and purposeful: login events, chocobo ride/lender flows, elevator cutscenes, and `InstanceRaidBaseClass.failedEvent`/`exitCutScene`. They all follow an owned sequence such as fade out, wait for fading, finish/close talk if relevant, cutscene or warp-producing action, then `_fadeInAfterWarp()`.
- Native warp finalization has a separate DesktopWidget gate. The inbound sub-index `20` `_onPreWarp` pairs with sub-index `21` `_onPostWarp`, and ffxivDecomp notes say `_onPostWarp` silently no-ops unless `_onPreWarp` armed `DesktopWidget+0x7b`. The recovered Lua `_onPreWarp` orders desktop mode `127` and clears target state; `_onPostWarp` cancels warp modes and runs area/raid notifications. Same-area event-warp traces must prove this pre/post pair, not just that `_fadeInAfterWarp()` was requested.
- Local server-code comparison: `WarpToPositionForEvent` keeps the current event alive and calls `WarpToPosition(..., false, false)`, whose same-area branch queues `_0xE2Packet(0x10)`, a `SetActorPositionPacket` through `CreateSpawnTeleportPacket`, `SendInstanceUpdate`, and nearby-player sync. `DoZoneChangeContent` similarly queues delete-all, `_0xE2Packet(0x10)`, zone-in packets, and instance update. No explicit CommandUpdater sub-index `20`/`21` sender was found in these local paths, so if dispatch is proven and `_fadeInAfterWarp()` still misbehaves, the next suspect is warp-finalizer arming rather than scene data.
- Native decomp notes identify `_fadeInNowLoadingForNoticeEventJustInArea` as the MyPlayer slot-66 clearer for the kick target fields at `+0x128/+0x12c`. `CutScene.startCutScene`, `InstanceRaidBaseClass.startEvent`, occupancy relogin, and tutorial quest flows use this clearer before cinematic or loading-state work.
- Legacy occupancy dungeon cutscenes are not the same after-warp shape as Man0u1. `RaidFst0Dungeon03.eventNoticeCutScene` and `RaidRoc0Dungeon01.eventNoticeCutScene` use `startCutScene(1, 61, 1, 0, arg)` and then call plain `_fadeIn(1)` before opening the raid execution widget. The opening scenes (`rad0f300` and `rad0r100`) skip the pre-fade; later/ending scenes fade out first and may close the widget.
- `PlayerBaseClass.isEventPlaying` includes `noticeEvent`, so a forced dungeon/cutscene notice event is part of the same active-event gate as ordinary talk, push, and emote events.
- Native receiver decomp adds a second gate after KickEvent: `RunEventFunction` goes through `StartServerOrderEventFunctionReceiver` and a registry/placeholder queue, then checks a `+0x7d` event-dispatch-ready byte on a lazy per-actor sub-object reached from `actor[+4]`, not plain `ActorBase`. `LuaControl` ctor zeros `actor[+4]`, and the generic `+0x7d=1` setter exists as `FUN_0043b530`, but the bind/create site for this sub-object is still unidentified. That means an actor id can be present and still reject/no-op the function body because the event/script context is not bound yet.
- The RunEventFunction pending vector drains from the back and stops at the first dispatch-ready failure. A received packet can therefore populate or leave queue state without proving that the delegated quest method actually ran; trace side effects such as fade out, cutscene load, or `_fadeInAfterWarp()`.
- The `+0x5c` KickEvent gate is set only after the `+0x7d` RunEventFunction-ready path is satisfied. A trace that proves the kick/start lane does not automatically prove the later `delegateEvent` body can run.
- Fade/map/cutscene waits are separate native resume-checker paths: `s_FadeResumeChecker`, `s_MapLoadResumeChecker`, and `PlayingResumeChecker`, while notice authorization uses `ClientOrderEventWaitingResumeChecker`. An immediate empty update before fade or widget side effects is more consistent with dispatch miss/no-op than with any of those normal waits.
- The wider `event_widget_deps` and focused decomp recovered `NpcBaseClass.delegateEvent(player, target, method, ...) -> target:_callFunction(method, player, npcOwner, ...)`, matching `DirectorBaseClass.delegateEvent`. It also shows real client talk/push starts enter native `_callServerOnTalk/_callServerOnPush` or `_doServerOnTalk/_doServerOnPush` first. A server-originated delegate call can reuse a valid owner lane, but it does not create the native client-started push/talk lane by itself.
- `delegateEvent` is not the same dispatch namespace as a raw event-function packet. The recovered Director/NPC bodies both `return target:_callFunction(method, player, owner, ...)`, so delegated Lua method return values can come back when the target actor resolves. A raw `RunEventFunction("processEvent035")` asks the native event-function receiver for a callable named `processEvent035`; it does not automatically resolve `Man0u1.processEvent035` on the quest object.
- Older Hamlet live notes are a useful negative control: `delegateEvent` to static/quest actors in the `0xA...` id range can play a cutscene, while `delegateEvent` to dynamically spawned director actors in the `0x6...` range accepted the packet and no-op'd. An immediate empty update can therefore be a target resolver miss even when the function name is real.
- Kick receiver native notes make `noticeEvent` special: a KickEvent type byte of `0x05` sets the receiver notice flag at `+0x80`, while non-`0x05` fresh kicks can silently fall through. That applies to starting cinematic notice events; it does not make a forced push-type delegate equivalent to a real client push owner.
- Inside an instance-raid area, `PlayerBaseClass._onTouch(touchKind, enter)` handles `touchKind == 5` by resolving static actor `24301` and executing command `30004` with state `1` on enter and `2` on leave. The normal `22004` touch prompt path is explicitly gated off while `currentAreaMaster:isInstanceRaid()` is true.
- `ContentGroupBaseClass` syncs `_globalTemp.director`, member/nameplate state, and content restrictions, and `PlayerBaseClass.postMapOpen` can call `director:processMapOpenMessage()`. It does not show a client Lua path that calls `InstanceRaidBaseClass.startEvent` by itself.
- Aurum Vale and Cutter's Cry guide scripts load text and return true from an entry selection branch, but the guide path only asks/accepts. Their `InstanceRaidAurumVale` and `InstanceRaidCuttersCry` subclasses are empty, so exact live scene args still need server/capture evidence.

Director/content-command layer:

- `DirectorBaseClass._onInit` defines `directorWork._sync` with `contentCommand`, `contentCommandSub`, `syncBuffer[128]`, and a child reserve. It also tags `contentCommand` so the content command, subcommand, and sync buffer travel together.
- On director `_init`, `DirectorBaseClass._onUpdateWork` calls `setContentCommandVariation(contentCommand, contentCommandSub)` only if `directorWork.contentCommand ~= 0` and `player:getQuestContentsCommandPermitFlag()` is true. It also refreshes that variation when `directorWork.contentCommand` changes and the director allows content commands.
- `PlayerBaseClass.setContentCommandVariation` writes `playerWork.variableCommandContent` and `playerWork.variableCommandContentSub`, then calls `desktopWidget:processUpdateContentCommandVariation()`.
- Prior local Hamlet notes report that syncing `directorWork.contentCommand = 1` produced a visible paper/scroll content-command icon. That proves director work-sync reaches client Lua and can engage content-command mode; it does not prove the correct instance-raid start command value or the final `startEvent` trigger.
- `MainMenuWidget` turns nonzero content-command variation into system command `24302` (`addSystemCommand(24302, 1102, 246, contentCommand, ...)`). Place-driven commands use the adjacent static actor `24301` path instead (`addSystemCommand(24301, 1101, 265, placeCommand)`), so the content icon and instance touch service are related plumbing but separate triggers.
- Selecting `24302` goes through `DesktopWidget.executePlayerSystemCommand(24302)`, which reads `player:getContentCommandVariation()` and then calls `player:canCommand(...) -> player:command(...) -> _executeCommand(...)`. The content-command repro therefore needs command-lifecycle trace evidence, not only director work-sync evidence.
- `PlayerBaseClass.command` applies the normal command gates: combined string args must stay under 50 bytes, `canCommand` checks `_canExecuteCommand(commandName)` and `command:canFire(...)`, and a successful command sets `playerWork.commandBurstBlocker`. For `commandContent`/`commandJudgeMode`, `_onPreCommand` locks player/lockon/target-cursor control and orders desktop mode `32`; `_onPostCommand` cancels mode `32`, closes event-mode widgets, and unlocks controls.
- Do not kick `"startEvent"` as an event name. The event modes recovered from player/event code are the fixed talk/emote/push/`noticeEvent` family, and the adjacent command lifecycle includes `commandContent`; `startEvent` is a director method reached by a higher-level content lifecycle, not a standalone event mode.
- `InstanceRaidBaseClass` requires `/Director/InstanceRaid/OccupancyPlayers/RaidPlayers`, but `RaidPlayers`, `OccupancyPlayersBaseClass`, and `OccupancyPlayersRelationGroup` are thin marker/wiring classes in recovered Lua. Treat their group kind, membership, and native/work-sync behavior as important even though their Lua bodies are small.
- Occupancy and instance guide/exit/warp scripts are prompt layers. `RaidFst0Dungeon03Guide.askMainMenu`, `InstanceRaidExit.askExit`, and `RaidDungeonWarp.askYesNo` ask or return choices; they do not launch the director cutscene lifecycle by themselves.
- `InstanceRaidBaseClass.failedEvent` and `exitCutScene` finish with `_fadeInAfterWarp()`, while `cutSceneEvent` fades back in-place with `_fadeIn(1)`. Keep those as separate local assertions when tracing same-zone cutscenes versus post-duty exits.

## Combat Instance Entry Invariant

Every quest combat instance MUST reject Disciples of the Hand/Land before the entry prompt or opening cutscene. The preflight must also run before changing quest sequence/counters/flags, creating an area or director, spawning enemies, or starting a zone transfer.

Use the shared Lua guard at the first entry callback:

```lua
local allowed = guardCombatInstanceEntry(player);
if (not allowed) then
    return;
end

-- Only now show the join prompt or entry cutscene.
```

The rejection is a server-authored system line with an empty sender. Do not use a quest/NPC prefix, `MESSAGE_TYPE_SYSTEM_ERROR`, or alternate wording. The player-facing text must be exactly:

> Change to a combat job or Disciple of War or Magic class before entering this instance.

Keep a second, non-notifying `checkCombatInstanceEntry(player)` inside reusable start helpers so GM/direct/test callers cannot bypass the policy. The C# content factory and `WorldManager` transfer validation remain authoritative backstops. Add every static combat battlefield to `Database.IsPartyLockedStaticInstanceArea`; do not classify ordinary inns, markets, or cutscene-only private areas as combat.

Noncombat instances are explicit exceptions. Use `CreateContentAreaForNonCombatClass` for a specific DoH/DoL class or `CreateContentAreaForAllDisciplinesWithoutContentGroup` for intentionally mixed-discipline content instead of weakening or skipping the combat guard.

Validation must prove both sides: a DoH/DoL attempt receives the exact system message before any prompt/cutscene and leaves quest/director/area state unchanged, while a DoW/DoM class or combat job proceeds normally.

## Static Private Area Recipe

Static private areas are loaded from `Data/sql/server_zones_privateareas.sql` at map server startup. A row is keyed by parent zone, private area name, and private area type.

### 1. Add The Area Row

Add or update a row in `server_zones_privateareas.sql`.

```sql
REPLACE INTO `server_zones_privateareas`
(`id`, `parentZoneId`, `className`, `privateAreaName`, `privateAreaType`, `canExitArea`, `music`) VALUES
    (9001, 209, '/Area/PrivateArea/PrivateAreaMasterPast', 'PrivateAreaMasterPast', 12, 0, 40);
```

Fields:

- `id`: unique SQL row id.
- `parentZoneId`: public zone that owns the private area.
- `className`: usually `/Area/PrivateArea/PrivateAreaMasterPast`.
- `privateAreaName`: usually `PrivateAreaMasterPast`.
- `privateAreaType`: the per-zone private area number used by scripts.
- `canExitArea`: read by `PrivateAreaPastExit.lua`, but see the exit warning below.
- `music`: day/night/battle music used by the private area.

Restart or reload the map server after SQL changes, because private areas are loaded into `Zone.privateAreas`.

### 2. Place Private-Area ENPCs

Place NPCs in `Data/sql/server_eventnpc_spawn_locations.sql` with matching `zoneId`, `privateAreaName`, and `privateAreaLevel`.

```sql
REPLACE INTO `server_eventnpc_spawn_locations`
(`id`, `actorClassId`, `uniqueId`, `zoneId`, `privateAreaName`, `privateAreaLevel`, `positionX`, `positionY`, `positionZ`, `rotation`, `motionPack`) VALUES
    (990001, 1000033, 'myquest_oappesi', 209, 'PrivateAreaMasterPast', 12, -2013.375, -11.986, -926.686, -2.953, 0);
```

For static battle NPC placement, use `Data/sql/server_battlenpc_spawn_locations.sql` with `privateArea` and `privateAreaLevel`. Most current quest combat examples spawn dynamic enemies from content scripts instead.

### 3. Enter From A Quest Script

Use `WarpToPrivateArea` when the destination is inside the player's current zone.

```lua
local allowed = guardCombatInstanceEntry(player);
if (not allowed) then
    return;
end

GetWorldManager():WarpToPrivateArea(
    player,
    "PrivateAreaMasterPast",
    12,
    -2013.375,
    -11.986,
    -926.686,
    -2.953
);
```

Use `DoZoneChange` when entering a private area in another zone.

```lua
GetWorldManager():DoZoneChange(
    player,
    209,
    "PrivateAreaMasterPast",
    12,
    15,
    -2013.375,
    -11.986,
    -926.686,
    -2.953
);
```

When the destination area is a `PrivateArea`, `WorldManager.DoZoneChange` sends the "entered an instance" system message and clears/rebuilds the client actor list.

### 4. Exit Explicitly

Do not rely on `Data/scripts/base/chara/npc/object/PrivateAreaPastExit.lua` to perform the actual exit warp yet. It sends caution/leave messages, but the `WarpToPublicArea` call is currently commented out.

Use an explicit quest-script exit.

```lua
GetWorldManager():WarpToPublicArea(player, publicX, publicY, publicZ, publicRot);
```

Or, when returning to a different public zone:

```lua
GetWorldManager():DoZoneChange(player, 206, nil, 0, 15, 221.580, 10.750, -1249.183, -0.471);
```

### 5. Static Private Area Checklist

- Add the SQL area row.
- Add ENPC or BNPC placement rows with matching area name/type.
- Add quest sequence logic that warps in.
- Ensure `quest:SetENpc(...)` state hides unavailable/public quest actors while inside the private area.
- Add an explicit exit path with `WarpToPublicArea` or public `DoZoneChange`.
- Test relogging in the private area. Static private areas can be restored from `characters.currentPrivateArea` and `currentPrivateAreaType`.

Good current examples:

- `Data/scripts/quests/man/man0u1.lua`
- `Data/scripts/quests/man/man0g1.lua`
- `Data/scripts/quests/man/man2g0.lua`

### Court In The Sands Static Fight Notes

`Court in the Sands` (`man0u1`, quest id `110010`) currently proves that a quest fight can work in a static private area when the positions and trigger actor classes are correct. The battlefield itself can stay in `PrivateAreaMasterPast` type `0`. The difficult part is the post-kill cutscene: running `processEvent035` directly from the battle command or director kill context can inherit a blank/wrong event owner and either skip the scene or crash the client. The current safer workaround marks the fight as won, warps out, and lets the real `GLD2_TRIG` push event run the cutscene from a clean `PopulaceStandard` event context.

Quest state used by the current test command:

```text
!questcomplete court coliseum
!questcomplete man0u1 coliseum
!questcomplete 110010 15 0 1
```

Meaning:

- Quest id `110010`.
- Sequence `15`.
- Counter `CNTR_SEQ15_GSM` / counter index `0` = `0`.
- Counter `CNTR_SEQ15_GLD` / counter index `1` = `1`.
- The player has completed the Gladiators' Guild intro and should use the coliseum entry trigger.

Known coordinates:

| Purpose | Zone | Private area | Type | X | Y | Z | Rot |
| --- | ---: | --- | ---: | ---: | ---: | ---: | ---: |
| Coliseum entry trigger `MAN0u1_COL_TRIGG` / `COL_TRIG` | 209 | `PrivateAreaMasterPast` | 0 | -187.225 | 190.150 | 219.730 | 0.000 |
| Fight start/player entry | 209 | `PrivateAreaMasterPast` | 0 | -192.400 | 174.890 | 160.119 | 1.576 |
| Enemy spawn | 209 | `PrivateAreaMasterPast` | 0 | -178.569 | 174.893 | 160.280 | -1.580 |
| Win/fail return near coliseum door | 209 | `PrivateAreaMasterPast` | 0 or 1 depending on flow | -177.650 | 189.950 | 216.801 | -3.112 |
| Post-fight cutscene trigger `MAN0u1_POST_COLISEUM_TRIGG` / `COLISEUM_POST_TRIG` | 209 | `PrivateAreaMasterPast` | 1 | -177.650 | 189.950 | 216.801 | -3.112 |
| Follow-up trigger `MAN0u1_GLD2_Trigg` / `GLD2_TRIG` | 209 | `PrivateAreaMasterPast` | 1 | -177.810 | 192.560 | 209.920 | -0.470 |

Current actor/function findings:

- `COL_TRIG = 1090141` is an `/Chara/Npc/Object/ObjectEventDoor` and should remain the explicit door/entry trigger.
- `COLISEUM_POST_TRIG = 1099047` is an invisible `PopulaceStandard` push trigger placed at the warp-out position for `processEvent035` only.
- `GLD2_TRIG = 1090077` is `/Chara/Npc/Populace/PopulaceStandard` and is a better shape for invisible post-fight push volumes.
- Tourney gladiator test actor: `TOURNEY_GLADIATOR = 2280157`.
- Tourney gladiator display id used by defeated attention message: `3280156`.
- Post-fight cutscene: `processEvent035` (`man0u135`).
- Next upstairs/follow-up cutscenes: `processEvent040` / `processEvent045` (`man0u140` variants).

Decomp-specific cutscene evidence:

- `processEvent035`, `processEvent040`, and `processEvent045` all use the same lifecycle shape: `startFadeOutCutSceneDefault(player)`, `startNQCutScene(scene, 1)`, then `startFadeInCutSceneAfterWarp(player)`.
- `processEvent090` chains two cutscenes (`man0u190`, then `man0u200`) before a single fade-after-warp, so chained quest scenes are supported when they stay inside one clean event function.
- `QuestBaseClass.startFadeInCutSceneAfterWarp` calls `_fadeInAfterWarp()` outside the `"test"` zone case, so the warp clear/loading clear is part of the client-side quest cutscene finish path.
- The safest local reproduction remains a clean `PopulaceStandard` push or director event context. Running this sequence from an attack/kill event context is what local testing has shown to be brittle.

Immediate empty-update diagnosis:

- `Man0u1.processEvent035` is a quest-object method, not a native event function. The recovered dispatch shape is `delegateEvent(player, quest, "processEvent035", ...)` from an active owner that implements `delegateEvent`, usually `NpcBaseClass`/`DirectorBaseClass`.
- The confirmed `DirectorBaseClass.delegateEvent` shape tail-calls `target:_callFunction(method, player, owner, ...)`, and older event-widget notes report the same signature for NPC owners. That means two things must be right at once: the active owner must expose `delegateEvent`, and the target actor must resolve to the quest object that owns `processEvent035`.
- The broad `content_systems_20260612` LPB output directly confirms `DirectorBaseClass.delegateEvent` and `PlayerBaseClass.delegateCommand`; the older `event_widget_deps`/focused outputs also recover `NpcBaseClass.delegateEvent`. For a `PopulaceStandard` push owner, the wrapper shape is therefore strong, but the trace still must prove the active owner is that NPC event and that the target is the quest object.
- No Lua definition for `_callFunction` turned up in the LPB outputs; it only appears as the target called by `delegateEvent`/`delegateCommand`. Treat it as a native actor/class resolver boundary. A bad target can fail below visible Lua before `Man0u1.processEvent035` starts.
- `PlayerBaseClass` exposes `delegateCommand`, not `delegateEvent`, so a player-owned or otherwise non-NPC/non-director event context is a bad candidate for quest-method dispatch.
- The client-origin event lanes are also native-gated: `_callServerOnTalk`, `_doServerOnPush`, and `_callServerOnCommand` resolve to C++ inline bindings. A server-originated `RunEventFunction(delegateEvent, ...)` is therefore not the same thing as a client-started talk/push/command lane, and a same-area warp does not synthesize the missing event context.
- Do not treat the suffix `processEvent035` as meaning "cutscene" by itself. A cross-quest scan found other `processEvent035` methods that only do talk turns, ask prompts, scheduler calls, or nothing. The important evidence is that the target object is specifically `Man0u1`, whose `processEvent035` body is the `man0u135` fade/cutscene/fade-after-warp sequence.
- A focused `processEvent035` family scan found 22 recovered methods: 17 are talk/say paths, 2 are ask/widget-like, 1 is empty, and 2 contain fade/cutscene-after-warp machinery. Only `Man0u1.processEvent035` is the `man0u135` NQ-cutscene path; `Thm300.processEvent035` has fade/after-warp handling but no scene call in that body. The pattern is common at the wrapper level, but this suffix is not a semantic key.
- A raw `RunEventFunction("processEvent035")`, or a `delegateEvent` sent while the active owner/name pair points at the wrong actor/event, can return an immediate empty update without running `startFadeOutCutSceneDefault`, `startNQCutScene`, or `_fadeInAfterWarp`.
- This is likely a general failure mode for quest cutscenes, not a `man0u135`-only bug. The scan found 362 cutscene-bearing `processEvent*` functions, plus 28 `pE*` cutscene functions; they all depend on dispatch reaching the right quest object before any scene key matters.
- A successful `processEvent035` should not be instant. `startFadeOutCutSceneDefault` waits for fading, `startNQCutScene` enters `CutScene.startCutScene`, and `startCutScene` plays the scene and waits for map load on non-`64` desktop modes.
- `CutScene.startCutScene` itself runs `_fadeInNowLoadingForNoticeEventJustInArea()`, `_loadCutScene`, desktop mode handling, `_play_cpp`, skip-widget handling, desktop-mode cleanup, and `_waitForMapLoaded(nil)`. An immediate empty response gives no evidence that this cutscene actor path was reached.
- The modern instance no-cutscene comparator is also not instant: `InstanceRaidBaseClass.startEvent("none", ...)` still calls `_fadeInNowLoadingForNoticeEventJustInArea()`, `_fadeIn(1)`, waits, optionally plays start effects, opens the widget, and only then sets `initFlag`. A truly immediate empty reply is therefore a short-circuit pattern, not the normal "none" lifecycle.
- Reject/cancel decomp points the same way. Director/NPC notice reject handlers are empty, while cancel/post paths do visible cleanup such as `_resetFade()`, `closeAllOwnedContentWidget`, desktop mode `16`/`32` cleanup, or cutscene-cancel mode `127`. Empty response plus no fade/widget side effect is more consistent with reject/no-op dispatch than with a running cutscene.
- The current same-area warp repro should therefore be classified below cutscene playback until dispatch is proven. If the server sends `delegateEvent` and then immediately sends `WarpToPositionForEvent` before waiting, the warp can also race the client method's fade/cutscene setup.
- `runClientFunction` and `runClientFunctionTyped` are fire-and-forget. If the client rejects the function quickly, the empty update can arrive before a later `waitClientFunction` has registered its `_WAIT_EVENT`, so logs can show an immediate client response while the script still waits on a later/stale event.
- The current `Man0u1` experiment uses the same risky split: `runClientFunction(player, "delegateEvent", player, quest, "processEvent035")`, then an event warp, then `waitClientFunction(player)`. Compare against a blocking `callClientFunction` baseline before treating the same-area warp as the root cause.
- The delayed local event-warp helper adds another diagnostic edge: `ScheduleEventWarp` captures the active owner/name/type and cancels if that event changed or `LuaEngine.HasEventUpdateWait(player)` is false when the delay expires. `LuaEngine.OnEventUpdate` removes the wait when an update arrives and drops updates if no wait exists. So a fast empty update can either cancel the delayed warp or be missed by the later wait, depending on timing; neither case proves the cutscene body ran.
- Local `PacketProcessor` does not buffer event updates for later. It parses `0x012E`, logs the fields, then calls `Player.UpdateEvent`; `LuaEngine.OnEventUpdate` resumes only if `mSleepingOnPlayerEvent` already contains a wait for that player, otherwise it returns. That makes wait-registration order a hard diagnostic boundary.
- Local packet parsing names the incoming packet `0x012E EventUpdate` and logs its one-byte `eventType` field as `Step`. The project constants only define event types `0`, `1`, `2`, `3`, and `5`; there is no local `ETYPE_0x4D`. `Player.UpdateEvent` passes only `luaParams` to `LuaEngine.OnEventUpdate`, so that byte is not used to route coroutine waits. Treat the observed empty `0x4D` marker as an opaque client/capture/update marker until a raw packet decode proves which field it is.
- First evidence to check is the outgoing `[EventFunction]` owner/event/type/contextType tuple. It should line up with the `COLISEUM_POST_TRIG` or `GLD2_TRIG` push context, or another proven event owner with `delegateEvent`, before `man0u135` scene data is blamed.
- If the same-area warp follows immediately after a fire-and-forget delegate, split the diagnosis into two separate gates: first, did `_callFunction` reach `Man0u1.processEvent035`; second, did the warp path arm the native pre/post-warp and `_fadeInAfterWarp` finalizers. The first failure gives an immediate empty update; the second can leave loading/fade state dirty even after a valid scene.
- The city tutorial quests are a positive comparator for cinematic prep. `man0u0`, `man0g0`, and `man0l0` call `_fadeInNowLoadingForNoticeEventJustInArea()`, then fade out, run mode-`3` tutorial cutscenes, explicitly `_waitForMapLoaded(nil)`, fade in, and cancel desktop mode `61`. Retail quest scripts deliberately clear/load-gate before sensitive cinematic transitions.

Observed retail-like flow:

1. The player uses the coliseum door/entry trigger.
2. The quest asks the entry prompt (`processEvent1000_5`).
3. The player warps to the fight floor at type `0`, around `-192.400, 174.890, 160.119`.
4. The gladiator spawns around `-178.569, 174.893, 160.280`.
5. After about 5 seconds, the fight starts and the client shows "There are 5 minutes remaining."
6. On kill, the client shows the defeated attention message.
7. The win counter becomes `CNTR_SEQ15_GLD = 2`.
8. Retail appears to continue into `processEvent035` before the final return.
9. In the emulator workaround, the server delays briefly for battle cleanup, ends the server-side fight director, warps to the coliseum exit position, and leaves `CNTR_SEQ15_GLD = 2` as "post-fight cutscene pending."
10. The `COLISEUM_POST_TRIG` push event at the warp-out position runs `processEvent035`, then sets `FLAG_SEQ15_POST_COLISEUM_CS_DONE` while leaving `CNTR_SEQ15_GLD = 2`.
11. The player walks forward/upstairs into `GLD2_TRIG`.
12. The `GLD2_TRIG` push runs `processEvent040`/`processEvent045`, kicks the public warp while that fade-after-warp cutscene is active, then advances `CNTR_SEQ15_GLD` to `3`.

Implementation notes from testing:

- The original "wrong door/wrong area" behavior was mostly a position problem, not proof that static private areas were broken.
- Do not route this fight through tutorial `noticeEvent` / login-director bootstrap at entry. That pattern is required for tutorial combat but caused bad loading/error behavior when copied directly into this fight.
- The safe entry shape is: door prompt -> warp to the static arena -> create a server-side Court fight director without a content group -> add the director to the player's owned directors -> start combat.
- Do not call `StartDirector(true)` or put the player/gladiator in a director `ContentGroup` during entry for this static fight. Testing showed that client-visible director/content-group setup at entry reopened the blank owner `0x2` / trigger `0x0` and `0x1` event starts and caused a client error while entering the arena.
- Do not send the Court director spawn/init packets after the kill either unless deliberately probing director event behavior. Testing showed that even delayed director advertisement after an `AttackMagic` kill reopened the blank owner `0x2` / trigger `0x0` and `0x1` event starts and froze the client.
- The current safe fallback is to avoid any post-kill `RunEventFunction`, blocking `callClientFunction`, or `kickEventContinue` from the battle/director kill context. Set `CNTR_SEQ15_GLD = 2`, wait a fixed recovery window, end the active battle command event, end the server-side director, and warp out.
- Treat `CNTR_SEQ15_GLD = 2` plus unset `FLAG_SEQ15_POST_COLISEUM_CS_DONE` as a pending post-fight cutscene state. `COLISEUM_POST_TRIG` handles this at the warp-out position if the spawn row exists in the live DB. `GLD2_TRIG` also has a fallback for this state, because live testing showed the DB-only trigger can be missing until the spawn table is imported. Run `processEvent035` with blocking `callClientFunction`, set the flag, update ENPCs, save, end the event, and if the fallback trigger was used, warp back to the exit position so the player can walk into `GLD2_TRIG` again for the follow-up scene.
- Treat `CNTR_SEQ15_GLD = 2` plus set `FLAG_SEQ15_POST_COLISEUM_CS_DONE` as the follow-up trigger state. `GLD2_TRIG` handles this after the player walks farther in. `processEvent040` and `processEvent045` both decompile to `startFadeInCutSceneAfterWarp`, so avoid launching them from the same trigger that ran `processEvent035`. Send the delegate with `RunEventFunction`, wait briefly, warp to public at the coliseum exit position, then advance `CNTR_SEQ15_GLD` to `3`.
- Quest-level kill callbacks fire before director kill callbacks. If the director exists, the quest `onKillBNpc` must back off so the director owns the defeated message, counter update, cutscene, duty/group end, and exit warp.
- The entry `COL_TRIG` can stay an `ObjectEventDoor`, but a temporary automatic win trigger should not use `COL_TRIG`, because it causes the client to ask "move to this area."
- Avoid fake automatic win triggers for the post-kill cutscene unless you are explicitly testing trigger behavior. A trigger spawned around the player can require exit/re-entry before firing, and a door-shaped trigger can show a movement prompt.
- Delay post-kill event continuation until the active attack/spell event is closed. Crash logs showed kill completion colliding with an `AttackMagic` event when warping or kicking a new event immediately.
- Do not force a same-area private warp/rebuild after a spell kill just to make a temporary trigger visible. That can crash the client while battle command cleanup is still in progress.
- For cutscene functions that decompile to `startFadeInCutSceneAfterWarp`, prefer the tutorial-style director flow: kick/continue the director `noticeEvent`, run the client cutscene function, end the event, end the director/content group, then warp to the post-duty position.

## Dynamic Content Area Recipe

Dynamic content areas are created at runtime from a loaded public `Zone`. They are best for quest battles and one-off scenes with temporary actors.

The standard Lua shape is:

```lua
local allowed = guardCombatInstanceEntry(player);
if (not allowed) then
    return;
end

local contentArea = player.CurrentArea:CreateContentArea(
    player,
    "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent",
    "myquest01",
    "SimpleContentMyQuest01",
    "Quest/QuestDirectorMyQuest001"
);

if (contentArea == nil) then
    player:SendMessage(0x20, "[Quest] ", "Could not create the quest instance.");
    return;
end

GetWorldManager():DoZoneChangeContent(player, contentArea, entryX, entryY, entryZ, entryRot, 16);
```

Parameters:

- `player`: the starter player.
- `areaClassPath`: usually `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`.
- `contentScript`: legacy/client content key.
- `areaName`: runtime private area name. This is also the local content script key loaded from `Data/scripts/content/<areaName>.lua`, so keep it unique enough to recognize in logs.
- `directorName`: loaded from `Data/scripts/directors/<directorName>.lua`.
- extra args: optional director args after `directorName`.

`Zone.CreateContentArea` allocates a dynamic private area type for each runtime content area. The object itself is unique even when the area name is reused, but login recovery cannot reconstruct expired runtime state from DB fields alone.

### 1. Add The Quest Entry Snippet

Put this in the quest script at the sequence where the instance starts.

```lua
local contentArea = player.CurrentArea:CreateContentArea(
    player,
    "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent",
    "myquest01",
    "SimpleContentMyQuest01",
    "Quest/QuestDirectorMyQuest001"
);

if (contentArea == nil) then
    player:SendMessage(0x20, "[MyQuest] ", "Unable to create the quest instance.");
    return;
end

GetWorldManager():DoZoneChangeContent(player, contentArea, -10.0, 0.0, 20.0, 1.57, 16);
```

### 2. Add The Content Script

Create `Data/scripts/content/SimpleContentMyQuest01.lua`.

```lua
require("global")

function onCreate(player, contentArea, director)
    local ally = contentArea:SpawnAlly(2290001, "myquest_ally", -8.0, 0.0, 18.0, 2.0);
    ally.Level = 1;
    ally:SetMod(Hp, 500);
    ally:SetMod(Mp, 500);
    ally:CalculateStats();

    local enemy = contentArea:SpawnEnemy(2201407, "myquest_enemy", -12.0, 0.0, 24.0, -1.0);
    enemy.Level = 1;
    enemy:SetMod(Hp, 150);
    enemy:SetMod(Mp, 100);
    enemy:CalculateStats();

    director:AddMember(player);
    director:AddMember(director);
    director:AddMember(ally);
    director:AddMember(enemy);

    director:StartContentGroup();
end

function onZoneIn(player, contentArea)
end

function onPlayerLeft(player, contentArea, reason)
    local quest = player:GetQuest(110000);
    if (quest ~= nil and quest:getSequence() == 5) then
        quest:StartSequence(4);
        quest:UpdateENPCs();
    end
end

function onDestroy()
end
```

Notes:

- `SpawnAlly`, `SpawnEnemy`, `SpawnActor`, and `SpawnPathCompanion` are used by existing content scripts.
- If you add NPC allies to the player's party, follow the tutorial examples carefully and disband/clear mods at the end.
- If you need a boundary, call `contentArea:SetBoundaryCircle(...)`, `SetBoundarySquare(...)`, or `SetBoundaryLine(...)`. Movement clamping is handled in `Session.UpdatePlayerActorPosition`.
- `onPlayerLeft` is required for solo quest content with a retry/abandon state. Generic cleanup will destroy an empty solo quest instance on intentional exit, but this hook is what resets the journal back to the retry step instead of leaving it mid-duty.

### 3. Add The Director Script

Create `Data/scripts/directors/Quest/QuestDirectorMyQuest001.lua`.

```lua
require("global")
require("quests/man/myquest")

function init()
    return "/Director/Quest/QuestDirectorMyQuest001";
end

local TARGET_BNPC = 2201407;
local COUNTER_KILLS = 0;

function onKillBNpc(player, director, bnpc)
    local quest = player:GetQuest("MyQuest");
    if (quest == nil) then
        return;
    end

    if (bnpc == TARGET_BNPC) then
        local kills = quest:GetData():IncCounter(COUNTER_KILLS);
        if (kills >= 1) then
            quest:StartSequence(10);
            player.CurrentArea:ContentFinished();
            GetWorldManager():DoZoneChange(player, 206, nil, 0, 15, 221.580, 10.750, -1249.183, -0.471);
            player:EndEvent();
        end
    end
end

function onEventStarted(player, director, triggerName)
    player:EndEvent();
end

function main()
end
```

Keep the director responsible for completion-sensitive state: kill counters, sequence changes, tutorial widgets, event continuation, and moving the player back out.

### 4. Finish And Clean Up

At completion:

```lua
player.CurrentArea:ContentFinished();
GetWorldManager():DoZoneChange(player, returnZone, nil, 0, 15, returnX, returnY, returnZ, returnRot);
```

`ContentFinished()` only marks the content as finished. The area is deleted by `CheckDestroy()` once no players remain. `DoZoneChange` and content-group cleanup paths call that check when players leave.

For one-player tutorial-style content, also clean up any temporary state:

```lua
player:PartyDisband();
player:ClearMods();
```

### 5. Dynamic Content Area Checklist

- Add a quest entry branch that calls `CreateContentArea`.
- Add a content script under `Data/scripts/content`.
- Add a director under `Data/scripts/directors/Quest`.
- Spawn temporary actors in `onCreate`.
- Add all relevant actors to the director/content group.
- Call `DoZoneChangeContent` after creation.
- On completion, call `ContentFinished()` and move the player out.
- Add `onPlayerLeft` in the content script and reset the quest to its retry/entry sequence when the player exits early. If this hook is missing, Map Server logs `[SoloQuestContent] Missing onPlayerLeft hook...` on early exit.
- Clear temporary parties, minimum HP locks, tutorial mode, or custom mods.
- Decide what happens on disconnect. Generic runtime content cannot be reconstructed on login. Add explicit recovery if the content should return players to an entrance instead of homepoint.

Good current examples:

- `Data/scripts/quests/man/man0l0.lua` with `SimpleContent30002.lua` and `QuestDirectorMan0l001.lua`.
- `Data/scripts/quests/man/man0g0.lua` with `SimpleContent30010.lua` and `QuestDirectorMan0g001.lua`.
- `Data/scripts/quests/man/man0u0.lua` with `SimpleContent30079.lua` and `QuestDirectorMan0u001.lua`.
- `Data/scripts/quests/man/man200.lua` with `SimpleContent30080.lua` and `QuestDirectorEventMan20001.lua`.

### Tutorial Combat Content Notes

The starter tutorial fights use dynamic content plus quest directors. These are the safest current references when the fight genuinely needs tutorial widgets, tutorial mode, party allies, and a director-driven cutscene chain.

Known tutorial combat setups:

| Quest | Quest id | Content script | Director | Targets | Completion |
| --- | ---: | --- | --- | --- | --- |
| Limsa intro | 110001 | `SimpleContent30002.lua` | `Quest/QuestDirectorMan0l001` | 3 jellyfish, allies Y'shtola and Sthalmann | `processEvent000_3`, sequence 10, warp to zone 230 `PrivateAreaMasterPast` type 1 |
| Gridania intro | 110005 | `SimpleContent30010.lua` | `Quest/QuestDirectorMan0g001` | 3 wolves, allies Yda and Papalymo | `processEvent020_1`, sequence 10, warp to zone 155 `PrivateAreaMasterPast` type 1 |
| Ul'dah intro | 110009 | `SimpleContent30079.lua` | `Quest/QuestDirectorMan0u001` | 1 goobbue, allies Thancred and Niellefresne | `processEvent020`, sequence 10, warp to zone 175 `PrivateAreaMasterPast` type 3 |

Shared tutorial flow:

- Content script spawns temporary allies/enemies.
- Content script adds player, director, allies, and enemies to the content group.
- Content script adds temporary allies to the player's party.
- Director sets `MinimumHpLock`, starts tutorial mode, and walks the client through tutorial widgets.
- `kickEventContinue(player, director, "noticeEvent", "noticeEvent")` is used between tutorial steps.
- On kill completion, the director closes tutorial widgets, sends an attention message, waits, silently starts sequence `0`, kicks the director notice event, runs the post-fight cutscene, then starts sequence `10`.
- Cleanup includes `endTutorialMode`, `ContentFinished`, explicit zone/private-area warp, `PartyDisband`, and `ClearMods`.

Do not copy this flow into ordinary quest fights just because a fight has a cutscene. It is useful when the director is the tutorial owner. For non-tutorial fights, prefer a simpler quest script controller or static push trigger unless the content truly needs a runtime content group.

## Toto-Rak And Runtime Dungeon Notes

Toto-Rak is the best current example for party/runtime dungeon behavior. See:

- `Map Server/WorldManager.cs`, `StartTotorakInstance`.
- `Data/scripts/totorak_entry.lua`.
- `Data/scripts/content/Totorak.lua`.
- `Data/scripts/directors/Instance/Totorak.lua`.
- `Data/scripts/base/chara/npc/object/RaidDungeonLight.lua`.
- `Data/scripts/base/chara/npc/object/RaidDungeonBarrier.lua`.

Important behaviors to copy for real dungeons:

- Validate party leader, party size, online members, location, level, and re-entry timers before creating the content area.
- Create the content area from the dungeon's source zone, not from the entrance zone.
- Copy public dungeon spawns into the content area with `sourceZone.CopyPublicSpawnLocationsTo(contentArea)`.
- Start the director and content group before or during entry.
- Track active instance state outside Lua when party rejoin, expiry, or disconnect recovery matters.
- Expire the instance by marking `ContentFinished()`, moving players out, setting re-entry timers, and checking destroy.

Do not assume this is already generalized for Dzemael, Aurum Vale, Cutter's Cry, Ifrit, Garuda, Moogle, or Rivenroad. Several related GC/primal scripts currently use placeholders and still need real launch, director, battle, loot, and recovery work.

Decomp-specific Toto-Rak notes:

- The recovered legacy class is `/Director/Occupancy/RaidFst0Dungeon03`, not the modern `InstanceRaidBaseClass` path.
- Its entry cutscene function is `eventNoticeCutScene(player, cutsceneName, arg, finishTime)`. For the opening path, `cutsceneName` is `rad0f300`; that scene intentionally does not fade out before starting.
- The function starts the cutscene with the occupancy director as owner: `startCutScene(1, 61, 1, 0, arg)`, then deletes the cutscene actor, fades in, opens `openRaidDungeonExecutionWidget(2123, 1, finishTime)`, and updates the general notification dialog.
- `DesktopWidget.openRaidDungeonExecutionWidget(unused, contentID, finishTime)` ignores its first argument and calls `openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, contentID, finishTime)`. `RaidDungeonExecutionWidget.init` only sets the content text from `contentID` and the timer from `finishTime`; `closeRaidDungeonExecutionWidget()` closes widget slots `15` and `16`.
- Re-entry uses `relogin(player, finishTime, clearFlag)`, calls `_fadeInNowLoadingForNoticeEventJustInArea()`, and opens the same widget if the clear flag is false.
- A local dungeon flow that only sets the class path or scene key but never drives `noticeEvent -> eventNoticeCutScene(...)` from a valid event context is probably missing runtime choreography, not scene data.

## Quest Actor Visibility

Quest ENPC visibility is per player and layered on top of area membership.

- Quest scripts call `quest:SetENpc(...)` and related state helpers.
- `QuestStateManager` hides not-started available quests while inside private areas.
- `Player.SendInstanceUpdate()` gathers actors from the current area, adds visible quest marker actors, and updates `Session.actorInstanceList`.
- `Session.UpdateInstance(...)` sends spawn/remove packets and quest graphics/event status.

When a private area looks empty:

- Confirm the SQL row exists and loaded.
- Confirm actors are placed in the matching `zoneId`, `privateAreaName`, and `privateAreaLevel`.
- Confirm the quest sequence calls `SetENpc` for the private-area actors.
- Confirm the actor class exists in `gamedata_actor_class.sql`.
- Confirm the player actually entered the expected private area type.

## Position And Flow Validation

Add this validation pass before marking any quest instance complete:

1. Use `!questcomplete <profile> <checkpoint>` to stage the quest.
2. Use `!where` immediately after staging to confirm the expected public/private state.
3. Trigger the entry normally instead of warping directly to the battlefield.
4. Use `!where` after entry and compare it to the intended fight start coordinates.
5. Confirm the enemy is on the same floor and not behind collision.
6. Confirm aggro delay and fight timer/message.
7. Kill the target using normal combat.
8. Watch map logs for active battle-command events during completion, especially `AttackMagic` or hotbar command events.
9. Confirm the kill callback only updates state and does not immediately warp during active combat.
10. Confirm the post-kill cutscene runs.
11. Confirm the exit warp lands in the intended area and private area type.
12. Confirm the next trigger/cutscene works after exit.
13. Relog from entry, fight, and post-fight states if the quest uses dynamic content or transient private state.

If the player lands in a black void, clipped hallway, or unrelated room:

- Trust `!where` over visual assumptions.
- Compare against SQL spawn rows and captured retail/current-client coordinates.
- Check `privateAreaType` first; the same named private area can have several unrelated layouts.
- Verify actor class path. A door actor can be visually invisible but still behave like a door prompt.
- Fix coordinates before changing `WorldManager`, `Zone`, or `PrivateAreaContent`.

## Implementation Checklist

1. Identify the quest sequence and event that should enter the instance.
2. Choose static private area or dynamic content area.
3. Add `guardCombatInstanceEntry(player)` before every entry prompt/cutscene and before any state mutation.
4. Add `checkCombatInstanceEntry(player)` inside reusable start helpers and retain authoritative C# entry validation.
5. For static combat, add the battlefield to `Database.IsPartyLockedStaticInstanceArea`.
6. For static, add or reuse a `server_zones_privateareas.sql` row.
7. For static, add ENPC or BNPC placement with matching private area fields.
8. For dynamic, add the quest `CreateContentArea` call.
9. For dynamic, add `Data/scripts/content/<ContentName>.lua`.
10. For dynamic, add `Data/scripts/directors/Quest/<DirectorName>.lua`.
11. Wire quest `SetENpc`, journal, map marker, and sequence state.
12. Add entry cutscene, prompt, or trigger handling after the guard.
13. Add completion logic and move the player out.
14. Add failure/abort handling if combat can be lost or canceled.
15. Add disconnect/relog recovery if the content is dynamic.
16. Test DoH/DoL rejection before all UI/cutscenes, then test DoW/DoM entry, actor visibility, quest flags, combat/objective progress, completion, exit, relog, and repeated entry.

## Common Pitfalls

- Adding an SQL private area but forgetting private-area actor placement.
- Using `WarpToPrivateArea` for a different parent zone. Use `DoZoneChange` instead.
- Relying on `PrivateAreaPastExit.lua` for the actual exit warp. Add an explicit exit.
- Creating a dynamic content area but not adding actors to the director/content group.
- Calling `ContentFinished()` without moving the player out.
- Forgetting that dynamic content area DB state is not enough to reconstruct the runtime instance on login.
- Copying GC/primal placeholder scripts as if they were complete instance implementations.
- Leaving temporary party members, stat mods, tutorial mode, or minimum HP locks on the player after content ends.
- Assuming an instance is broken before checking exact position, private area type, and trigger actor class.
- Starting cutscenes or warps directly from a kill callback while the client is still resolving a combat command.
- Showing the combat-class restriction after an entry cutscene or after mutating quest/director/area state.
- Prefixing the restriction with a quest/NPC name or sending it as `MESSAGE_TYPE_SYSTEM_ERROR`; it must be an unprefixed `MESSAGE_TYPE_SYSTEM` line with the exact shared text.
