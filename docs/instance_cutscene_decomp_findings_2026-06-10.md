# Instance, Content HUD, and Cutscene Decomp Findings - 2026-06-10

This note consolidates the instance/content/cutscene trail across:

- `C:\Users\drime\source\repos\AuroraFlare\meteor-decomp-0.1.4`
- `C:\Users\drime\source\repos\AuroraFlare\ida free`
- the current `FF14-Memory` server, scripts, and docs

The current `tools/outputs/lpb` dump now includes decoded 1.0
`InstanceRaidBaseClass` and `InstanceRaidHamletDefense` scripts. The older
native/IDA notes still identify the lower C++ gates, but the script-level raid
and Hamlet HUD contracts are no longer missing.

## Short Version

The missing data does not look like another blind widget name or another
`_loadForm` / `_createWidgetInWidgetContainer` packet. The client already has
the retail execution-widget names for raid, caravan, and Hamlet. The missing
piece is the state that makes the client naturally select those execution
widget indexes, plus the instance-entry/cutscene lifecycle events that clear
loading or notice-event state.

High-value suspects:

1. The execution-widget selected-index source that feeds `sub_5387F0`.
2. The `DesktopWidget` pre/post warp pair, because `_onPostWarp` no-ops unless
   `_onPreWarp` armed `DesktopWidget+0x7b`.
3. The content-instance entry path in `InstanceRaidBaseClass.startEvent`, now
   decoded locally: it sets `instanceRaidWork`, runs login/start hooks, clears
   loading or plays a cutscene, and opens the raid execution widget.
4. The active event close path and category values that drive the client
   EndEvent dispatcher.
5. The `instanceRaidWork` / `areaWork` work arrays, which are listed in the
   meteor indexes but currently have 100 percent unknown field coverage.

### 2026-06-16 Lifecycle Read

The later cutscene lifecycle pass makes one correction to the priority order:
scene-key mining is no longer the first suspect for Toto-Rak, Coliseum-style
quest fades, or modern no-cutscene instance starts. The client-side scene
assets and most wrappers are present; the fragile surface is the runtime
choreography around owner/event context, fade/warp order, and close timing.

New anchors to carry forward:

- `CutScene.startCutScene` calls `_fadeInNowLoadingForNoticeEventJustInArea()`,
  loads the cutscene, manages desktop modes `61`/`62`/`63`, then waits for map
  load after successful playback unless the desktop mode is `64`.
- The visible cutscene/fade leaves are native bindings: `CutScene._play_inl`,
  `_replay_inl`, `_skip_inl`, and `_setFilename_inl` map to `_play_cpp`,
  `_replay_cpp`, `_skip_cpp`, and `_setFilename_cpp`; player fade/load stubs map
  to `_fadeIn_cpp`, `_fadeOut_cpp`, `_fadeInAfterWarp_cpp`,
  `_waitForFading_cpp`, `_fadeInNowLoadingForNoticeEventJustInArea_cpp`, and
  `_waitForMapLoaded_cpp`. That keeps immediate-empty responses below the
  cutscene/fade playback layer unless one of these side effects is observed.
- Quest fade-after-warp is normal, not rare: `startFadeInCutSceneAfterWarp`
  appears 304 times across 93 quest scenario files in the local LPB corpus.
  `startFadeInCutSceneDefault` appears 375 times across 121 quest scenario
  files, so both fade branches are common and need separate trace labels.
- A function-level quest scenario pass found 399 cutscene-bearing functions:
  362 `processEvent*` methods, 214 with after-warp fade, 33 with multiple
  cutscene calls, and 21 with both default and after-warp fade paths. This
  makes the pattern common across many cutscenes, not unique to `man0u135`.
- A focused after-warp classifier found 304 quest scenario functions with
  `startFadeInCutSceneAfterWarp`; 291 also contain a direct scene call in the
  same function (`startNQCutScene`, `startHQCutScene`, or
  `startSnpc...CutScene`), while 13 are cleanup/fade/talk helpers with no
  direct scene call. `Man0u1.processEvent035` is in the direct-scene bucket;
  `Thm300.processEvent035` is the useful same-suffix no-scene comparator.
- The full no-direct-scene after-warp bucket is only 13 functions:
  `Bsm200.processEventBodenolfStart`, `Bsm200.processEvent005`,
  `Bsm300.processEventBodenolfStart`, `Bsm300.processEvent015`,
  `Bsm306.processEventBodenolfStart`, `Cul300.processEvent025`,
  `Gla306.processEvent045`, `Man0l1.processEvent637`,
  `Man2g0.processEvent007_2_2`, `Thm300.processEvent035`,
  `Wdk200.processEvent025`, `Wdk306.processEventMarcelloixStart`, and
  `Wdk306.processEvent025`. They are mostly talk/ask/wait/fade transitions,
  not hidden same-area cutscene bodies.
- A stricter direct-call scan found 320 scene calls inside after-warp functions.
  The dominant call is `startNQCutScene(scene, 1)` with 265 hits; Man0u1's
  relevant post-Coliseum wrappers are all mode `1`. In `CutScene.startCutScene`,
  mode `1` on desktop mode `61` orders the mode, shows skip UI, plays, hides
  skip UI, cancels mode `61` on success, and waits for map load.
- The local invocation shape is the suspicious part: `Data/scripts` has 1348
  blocking `callClientFunction(..., "delegateEvent", ...)` callsites versus
  only 5 fire-and-forget `runClientFunction(..., "delegateEvent", ...)`
  callsites, all in `man0u1`.
- Toto-Rak has a shipped legacy occupancy director,
  `/Director/Occupancy/RaidFst0Dungeon03`; its opening path is
  `eventNoticeCutScene(player, "rad0f300", arg, finishTime)`, mode `61`, then
  `openRaidDungeonExecutionWidget(2123, 1, finishTime)`.
- `DesktopWidget.openRaidDungeonExecutionWidget` ignores its first argument and
  opens slot `15` with `"RaidDungeonExecutionWidget"`, passing only `contentID`
  and `finishTime`; close hits slots `15` and `16`. The widget init then sets
  content text from `contentID` and timer data from `finishTime`.
- Modern `InstanceRaidBaseClass.startEvent("none", ...)` is the no-cutscene
  loading-clear path. It fades in, opens the widget, and only then sets
  `initFlag = true`; `GenericData` before that is ignored by the decompiled
  `_onReceiveDataPacket`.
- For the Coliseum repro, an immediate empty update after
  `delegateEvent(..., quest, "processEvent035", ...)` should be classified as a
  dispatch/owner-context failure until proven otherwise. The decompiled body
  should first fade out, run `startNQCutScene("man0u135", 1)`, then call
  `_fadeInAfterWarp()`. If the client answers immediately with no params, there
  is no evidence that body ran.
- Local packet parsing makes the `0x4D` observation narrower: incoming
  `0x012E EventUpdate` reads four dwords, then a one-byte field debug labels
  `Step`, then Lua params. `LuaEngine.OnEventUpdate` resumes scripts with only
  those Lua params, so an empty `Step=0x4D` update is a client update envelope
  with no script payload, not a Lua return value.
- The `RunEventFunction` receiver has its own native gate after KickEvent. It
  drains a pending registry/placeholder queue and checks a `+0x7d`
  dispatch-ready byte on a lazy per-actor sub-object reached through
  `actor[+4]`. This explains a "known actor, empty reply" shape: the id can be
  present while the callable event/script context is still not bound.
- The `actor[+4]` event/script context is lazy. `LuaControl` ctor zeros that
  pointer, and the known `+0x7d=1` setter (`FUN_0043b530`) is generic rather
  than actor-specific. The actual bind/create site remains a trace target.
- RunEventFunction's pending vector drains LIFO and stops at the first
  dispatch-ready failure. Receiver acceptance or queue mutation is therefore
  not enough evidence that the delegated Lua method ran.
- The `+0x5c` KickEvent-ready flag is set only after the `+0x7d` path is ready,
  so traces must prove both event start and function dispatch readiness.
- Same-area warp has a separate native DesktopWidget gate: sub-index `20`
  `_onPreWarp` must arm `DesktopWidget+0x7b` before sub-index `21`
  `_onPostWarp` will do post-warp work. If `_fadeInAfterWarp()` is requested
  without that pre/post pair, the failure belongs to warp finalization rather
  than scene-key selection.
- Local server-code comparison did not find an explicit CommandUpdater
  sub-index `20`/`21` sender in the current same-area event-warp path.
  `WarpToPositionForEvent` preserves active event state, then queues
  `_0xE2Packet(0x10)`, a `SetActorPositionPacket` from
  `CreateSpawnTeleportPacket`, instance update, and nearby-player sync.
  `DoZoneChangeContent` likewise queues delete-all, `_0xE2Packet(0x10)`,
  zone-in packets, and instance update. Treat this as local implementation
  evidence, not recovered retail packet proof.
- Normal fade/map/cutscene waits use separate resume checkers
  (`s_FadeResumeChecker`, `s_MapLoadResumeChecker`, `PlayingResumeChecker`);
  notice authorization uses `ClientOrderEventWaitingResumeChecker`. An
  immediate empty update with no fade/widget side effects is therefore below
  those wait paths and should be treated as dispatch miss/no-op first.
- The numeric suffix is not enough evidence by itself. In the wider quest corpus
  `processEvent035` can be a simple talk turn, an ask/scheduler helper, or even
  an empty method. The `Man0u1` target is what makes this one a cutscene path.
- A focused `processEvent035` scan found 22 methods: 17 talk/say, 2
  ask/widget, 1 empty, and 2 with fade/cutscene-after-warp machinery. Only
  `Man0u1.processEvent035` is the `man0u135` NQ-cutscene path; the other
  after-warp member is `Thm300.processEvent035`, which has fade/after-warp
  handling without a scene call in that body. The broad risk is the quest
  cutscene lifecycle, not the literal suffix.
- The confirmed `DirectorBaseClass.delegateEvent` shape calls
  `target:_callFunction(method, player, owner, ...)`, and prior event-widget
  notes report the same signature for NPC owners. A valid trace therefore needs
  the active owner to expose `delegateEvent` and the target actor to be the
  quest object that owns `processEvent035`.
- The recovered Director/NPC delegate wrappers both return the result of
  `target:_callFunction(...)`, so delegated actor-method return values are real
  when the target resolves. That is different from a raw
  `RunEventFunction("processEvent035")`, which asks the native event-function
  receiver for a callable name and does not by itself select the `Man0u1` quest
  object.
- The broad `content_systems_20260612` LPB pass directly confirms
  `DirectorBaseClass.delegateEvent` and `PlayerBaseClass.delegateCommand`; the
  older `event_widget_deps`/focused dumps also recover
  `NpcBaseClass.delegateEvent` with the same `_callFunction` tail-call. This
  makes a real NPC push owner a plausible delegate host, but owner class/id
  still has to be proven in trace.
- No Lua-defined `_callFunction` body was found in the LPB outputs; the visible
  Lua only calls into it from `delegateEvent`/`delegateCommand`. Treat this as a
  native resolver boundary where a bad target can no-op before any quest Lua
  body begins.
- `PlayerBaseClass` has `delegateCommand`, not `delegateEvent`, so a player-owned
  active context should not be treated as equivalent to a push NPC or director
  context.
- The client-origin talk/push/command event lanes are native C++ inline bindings
  such as `_callServerOnPush_cpp`, `_doServerOnPush_cpp`,
  `_callServerOnCommand_cpp`, and `_doServerOnCommand_cpp`. Server-originated
  `RunEventFunction(delegateEvent, ...)` reuses an existing event lane; it does
  not create the missing client-started push/talk/command context by itself.
- `RunEventFunctionWithType` only changes the event-type byte; the packet still
  uses the player's current owner id and event name. A stale or blank owner/name
  can make `delegateEvent` no-op even with a forced push type.
- `callClientFunction` sends and immediately yields `_WAIT_EVENT`, while
  `runClientFunction` sends without registering the wait. A
  `runClientFunction -> same-area warp/delay -> waitClientFunction` probe must
  separate a true no-op response from a fast empty update that arrived before
  the coroutine wait existed.
- The local delayed event-warp helper can turn that race into a visible false
  lead: it captures owner/name/type and cancels if the active event changed or
  `LuaEngine.HasEventUpdateWait(player)` is false when the delay expires. A
  fast empty update can remove the wait before the delayed warp fires, so a
  canceled warp may be the consequence of dispatch no-op timing rather than the
  original cause.
- Some quest wrappers branch between `startFadeInCutSceneAfterWarp` and
  `startFadeInCutSceneDefault` based on a cutscene return value or function
  argument. The server should prove which branch ran before adding its own
  same-area warp.
- `QuestBaseClass.startFadeInCutSceneAfterWarp` is not a full wait wrapper.
  Outside the `"test"` zone it directly calls `player:_fadeInAfterWarp()`;
  default fade is the path that waits for map load and fading in Lua.
- Direct `_fadeInAfterWarp()` use is narrow: login events, chocobo ride/lender
  flows, elevator cutscenes, and InstanceRaid fail/exit. Those callers all run
  an owned fade/wait/talk-close/cutscene-or-warp sequence before the native
  after-warp fade.
- `_fadeInNowLoadingForNoticeEventJustInArea` is the MyPlayer slot-66 clearer
  identified in the native notes; it clears the kick target fields at
  `+0x128/+0x12c`. `CutScene.startCutScene` calls it before `_loadCutScene`,
  and the tutorial city quests call it before fade-out/tutorial cutscene setup.
- The recovered NPC event body shows real NPC talk/push starts first enter
  native `_callServerOnTalk/_callServerOnPush` or
  `_doServerOnTalk/_doServerOnPush`; `delegateEvent` is a separate wrapper that
  tail-calls the target's native `_callFunction`. A delegated quest method
  should therefore be tied to a proven NPC/director event owner, not just a
  player or blank owner.
- Prior Hamlet tests are a negative control for immediate empty updates:
  `delegateEvent` to static/quest actors in the `0xA...` range can play a
  cutscene, while `delegateEvent` to dynamically spawned directors in the
  `0x6...` range accepted the packet and no-op'd. That is the same symptom
  class as a bad `processEvent035` target.
- Native KickReceiver notes make `noticeEvent` special: KickEvent type byte
  `0x05` sets the receiver notice flag, while non-`0x05` fresh kicks can fall
  through silently. Use that for cinematic notice-event startup checks, but do
  not confuse it with proving a real push owner for quest delegate calls.
- The same-area warp/fade problem should be split in traces. Dispatch failure
  produces an immediate empty update before any cutscene body runs; warp-finalize
  failure happens later, when `_fadeInAfterWarp()` or the DesktopWidget pre/post
  warp gate was not naturally armed.
- Local event updates are not buffered for late waits. `PacketProcessor` parses
  `0x012E` and immediately calls `Player.UpdateEvent`; `LuaEngine.OnEventUpdate`
  resumes only when the player's event-wait coroutine is already registered, and
  otherwise returns. This makes `runClientFunction -> waitClientFunction` order
  a first-class trace concern.
- Reject/cancel decomp matches the no-op hypothesis. Director/NPC notice reject
  handlers are empty, while cancel/post paths are where `_resetFade()`,
  owned-widget closes, desktop mode `16`/`32` cleanup, and cutscene-cancel mode
  `127` appear. A fast empty update without fade/widget side effects is not
  evidence that the cutscene player is stuck.
- The observed empty `0x4D` update should remain an opaque client/capture marker
  until raw bytes prove the field. Locally, incoming event results are opcode
  `0x012E EventUpdate`; the parser reads one byte as `eventType`, while debug
  output labels that field `Step`. The local event constants only define
  command/talk/push/emote/notice as `0`, `1`, `2`, `3`, and `5`.
- Guide scripts for Aurum Vale/Cutter's Cry only ask and return true from the
  entry selection. Their raid subclasses are empty, so exact live scene args
  still belong in the server-argument/capture bucket.
- `ContentGroupBaseClass` provides director/member/restriction sync and
  `getDirector()`, but no recovered client Lua call from content-group sync
  directly invokes `startEvent`.
- `DirectorBaseClass._onInit` syncs `directorWork.contentCommand`,
  `contentCommandSub`, and `syncBuffer[128]`; `_onUpdateWork` maps `_init`
  and later `directorWork.contentCommand` changes to
  `player:setContentCommandVariation(...)`. The local `contentCommand = 1`
  paper/scroll icon proves this work-sync path is alive, but not that the
  InstanceRaid `startEvent` caller has been found.
- `PlayerBaseClass.postMapOpen` reaches directors through content groups by
  resolving `group:getDirector():processMapOpenMessage()`. That is useful
  evidence for director access, not a launch trigger by itself.
- Cross-corpus event evidence keeps the literal name `"startEvent"` out of the
  kickable event set. `noticeEvent`, `pushCommand`, and `commandContent` are
  real event/command lanes; `startEvent` is a director method that still needs
  a proven content-group or occupancy caller.
- Modern InstanceRaid cutscene cleanup is split: `failedEvent` and
  `exitCutScene` end with `_fadeInAfterWarp()`, while `cutSceneEvent` returns
  in-place with `_fadeIn(1)`.

Practical result: probe and document the full lane
`area/content-group/occupancy sync -> contentCommand/syncBuffer evidence ->
recognized event or command lane -> RunEventFunction only for proven callable
methods -> EventUpdate -> EndEvent -> zone-in/load clear`, and keep raw
cutscene/warp sub-op playback out of normal fixes until trace evidence says
otherwise.

## Execution Widget Selection

IDA confirms the global execution-widget name table at `.data:012BA870`:

| Index | Address | Widget name |
| --- | --- | --- |
| `0x0B` / 11 | `012BA89C` | `Window_GuildleveExecutionWidget` |
| `0x18` / 24 | `012BA8D0` | `Window_RaidDungeonExecutionWidget` |
| `0x19` / 25 | `012BA8D4` | `Window_ChocoboCaravanWidget` |
| `0x1A` / 26 | `012BA8D8` | `Window_ChocoboRentalTimerWidget` |
| `0x1B` / 27 | `012BA8DC` | `Window_HamletDefenseWidget` |

The important code path is:

```text
sub_5387F0
  -> sub_535690(selectedIndex)
  -> selected entry + 0x2C
  -> sub_66EE60(this + 0x250, this->field_7C, nameOwner)
  -> sub_66EFD0(this + 0x250)
```

`sub_66EE60` scans `off_12BA870`, compares the requested widget name, and
writes the matching table index to `this+0x10`. This means the problem is
upstream: the client must be made to choose selected index `0x18`, `0x19`, or
`0x1B` naturally before the HUD path will look retail.

The meteor docs point to this selected-index source:

- Pending widget/form records live around `this+0x1F8`.
- `sub_538760(object, key)` updates the current selected widget.
- The key appears to come from the current `Sqwt` framework element or a parent:
  object `+0x298`, with parent walking through `+0x240`.
- `this+0x98` is later used as the selected index consumed by `sub_535690`.

Result: direct calls such as `_loadForm`, `_addItem`, `_createWidgetInWidgetContainer`,
and raw `widgetCreate(0x1B)` are valid client paths, but they are downstream or
side paths. They do not prove the retail content HUD selector has been satisfied.

## Instance Raid State

Known server-side entry points:

- `Data/scripts/base/chara/npc/populace/instanceraidguide/InstanceRaidGuide.lua`
  documents `askEnterInstanceRaid(arg1)`.
- Rivenroad uses `askEnterInstanceRaid(15)`.
- Rivenroad Hard uses `askEnterInstanceRaid(16)`.
- `Data/scripts/totorak_entry.lua` calls `askEnterInstanceRaid(raidId)`.
- `Data/scripts/directors/Instance/Totorak.lua` calls `_setInstanceRaid(true)`
  and `_loadTextDataPermanently` when the director event starts.

IDA clarification: `0072E5F0` is only the Lua binding registrar for
`_setInstanceRaid`; it is not the runtime setter or the HUD selector. The
assembly builds the string `_setInstanceRaid` and passes it to `sub_CCCAD0`.

The current server `DoZoneChangeContent` flow:

```text
LockUpdates(true)
remove from old area
assign content area and position
AddActorToZone
send "You have entered an instance"
DeleteAllActors
0xE2
ClearInstance
SendZoneInPackets
SendInstanceUpdate(true)
EndEvent() if there was an active event
LockUpdates(false)
SyncArrivingPlayerToNearbyPlayers
contentArea.onZoneIn
```

That may be missing a faithful client-side content-enter directive or a paired
pre/post warp notification. The meteor docs specifically call out
`InstanceRaidBaseClass.startEvent` as an entry-path clearer source, but the raw
LPB needed to recover its exact inbound directive was not present.

## Cutscene and Loading State

IDA confirms `006E32F0` as the body behind
`MyPlayer::_fadeInNowLoadingForNoticeEventJustInArea`:

```text
if MyPlayer+0x128 or MyPlayer+0x12c differ from dword_130C778:
  call sub_CC7510
  call sub_75B510
  MyPlayer+0x128 = dword_130C778
  MyPlayer+0x12c = dword_130C778
```

This is a state clearer, not just a visual fade. The meteor notes connect it to
the SEQ-005 notice-event hang: synthetic notice events can arm a waiting gate
but never reach the script path that calls this clearer.

Known call contexts from the meteor docs:

- Quest/content reward or exit paths can call it through
  `showQuestRewardAsClientCall`.
- `InstanceRaidBaseClass.startEvent` is documented as calling it on content
  instance entry after `processLogin(true)`.
- EndEvent dispatch can eventually run Lua end scripts that call it, but only
  if the right event category/gate is reached.

## Cutscene Finalize Pump

IDA confirms `006FB9C0` as `CutScene_invokeLua_onFinalizeClip`.

Behavior:

- It is gated by `this+0xC2`.
- If clip setup data exists at `[this+0x68]+0x14`, it builds
  `PreviewSetupClip` data and invokes `_onFinalizeClip`.
- It then builds `Personage` data from `[this+0x68]+0x04` and invokes
  `_onFinalizeClip` again.
- It releases `[this+0x68]`, clears that pointer, then calls `sub_76A7E0(0)`
  through the player/root object path.

The inbound opcode docs map this to client sub-opcode 14:

```text
14 -> _onFinalizeClip -> CutScene -> dual-pass PreviewSetupClip + Personage
```

For same-zone instance entry or live Hamlet intro tests, log whether opcode 14
actually arrives and whether `_onFinalizeClip` fires. If it never fires, the
cutscene block is not completing through the retail path.

## Pre/Post Warp Gate

IDA confirms the `DesktopWidget` gate:

```text
006FEDE0 DesktopWidget_invokeLua_onPreWarp:
  invoke _onPreWarp
  byte ptr [this+0x7b] = 1

006FEF10 DesktopWidget_invokeLua_onPostWarp:
  if byte ptr [this+0x7b] == 0:
    return
  invoke _onPostWarp
  byte ptr [this+0x7b] = 0
```

The meteor inbound opcode map names:

```text
20 -> _onPreWarp
21 -> _onPostWarp
```

The current server does not have an obvious named send-side pre/post-warp
packet builder. `Player.SendZoneInPackets` sends the normal zone bundle, while
`PacketProcessor` only has a receive-side `0x0007 ZoneInCompletePacket` that
fires when the client finishes zoning.

This is a strong explanation for a same-zone content-entry stall: if the server
sends or triggers post-warp without a prior pre-warp, the client silently skips
the post-warp Lua call and any state machine tied to it.

## EndEvent Dispatch

IDA confirms `008A13A0` as the EndEvent dispatcher target from
`EndClientOrderEventReceiver`.

It switches on the first byte of the event-close payload:

- Cases `0..5` load `[arg+0x18]` and route to `loc_8A09E0`.
- Cases `50..55` call `sub_8A10C0`.
- Cases `6..49`, `56..101`, and out-of-range values return immediately.

Current server packet state:

- `EndEventPacket.OPCODE = 0x0131`.
- The current packet writes:
  - source player actor id
  - zero for the second u32 field
  - event type byte
  - event name
- The inline comment says retail expects the second field to stay zero and
  echoing the owner can leave NPC talk events waiting forever.

Do not blindly change this packet back to echo the owner. The older notes and
the current implementation disagree, so the field needs validation with live
captures or a focused client trace.

## Hamlet-Specific Data

Useful recovered data:

- `0x01A8 HamletDefenseScore` is a native score-data packet.
- The parser path is documented as:
  - receiver `0089E420`
  - state setup `006F2210`
  - parser `006F1480`
- Compact payload shape:
  - `+0x00`: u32 header / hamlet id style value
  - `+0x04`: u8 supply rating
  - `+0x05`: up to 128 row codes
  - `+0x85`: up to 128 counts
- Row code `0x18` has been observed mapping to score id `12003`.
- The unresolved table is `dword_134B76C`; dump it before expanding the score
  builder.

Hamlet replay assets are valid but are not the live trigger:

| Replay id | Scene key | Meaning |
| --- | --- | --- |
| `11082008` | `ham0s201` | Aleport Opening |
| `11082009` | `ham0s202` | Aleport Ending |
| `11082010` | `ham0f301` | Hyrstmill Opening |
| `11082011` | `ham0f302` | Hyrstmill Ending |
| `11082012` | `ham0w201` | Golden Bazaar Opening |
| `11082013` | `ham0w202` | Golden Bazaar Ending |

Live Hamlet tests have already proved that the client accepts many packets:

- `0x0130` event function calls in safe player-trigger/director-owner shapes.
- `0x0133` requested data.
- Native `0x01A8` score data.
- `0x0137` guildleve-work marker/info-variable updates.
- Widget-container calls that can produce visible red `Undefined` tiles.

Those are not enough to open the retail Hamlet HUD. That supports the same
conclusion as the execution-widget decomp: the missing piece is the natural
director/content state gate, not the literal widget name.

## Work Fields Still Missing

`meteor-decomp-0.1.4/docs/work_field_*` originally listed these native
coverage gaps:

| Work array | Known count | Covered fields | Meaning |
| --- | ---: | ---: | --- |
| `instanceRaidWork` | 9 | 0 | Instance-raid state; Lua script fields are now decoded, native/work-sync coverage is still missing |
| `areaWork` | 4 | 0 | Area state: actorNumber, isInstanceRaid, isEntranceDesion, floor |

These are probably more useful than another round of widget-name probing. The
client selector may depend on one of these values being synchronized before the
content HUD update runs.

## Recommended Next Probes

1. Trace the execution-widget selected index.
   - Compare a working guildleve/behest against Hamlet, caravan, and Toto-Rak.
   - Watch the source around `sub_538760`, object `+0x298`, parent `+0x240`,
     `this+0x98`, and final `sub_66EE60` index.

2. Verify pre/post warp delivery in `DoZoneChangeContent`.
   - Confirm whether the server currently sends or triggers inbound sub-opcode
     20 before 21 during same-zone content entry.
   - If not, add a narrow experimental path for content entry only and watch
     whether `_onPostWarp` starts firing.

3. Probe `InstanceRaidBaseClass.startEvent` live.
   - The raw LPB corpus is now decoded locally under
     `tools/outputs/lpb/InstanceRaid`.
   - Test a real active-event path that runs
     `startEvent("none", nil, true, contentId, startTime, finishTime,
     eventType)`.
   - Identify the inbound directive and field selector that drive
     `processLogin(true)` and the entry-path clearer.

4. Validate EndEvent categories instead of changing fields blindly.
   - Log the active event type used by real working closes.
   - Test whether category `0..5` or `50..55` reaches the expected client
     close path for notice-event driven content entry.

5. Dump `dword_134B76C`.
   - This completes the `0x01A8` row-code map for Hamlet score rows.
   - It should not be expected to open the score/result window by itself.

6. Stop spending time on blind Hamlet widget names until a new gate is found.
   - The table already proves `Window_HamletDefenseWidget` is present at index
     `0x1B`.
   - The failed probes prove packets can reach the client but are not changing
     the natural HUD selector.

## Source Pointers

- `meteor-decomp-0.1.4/docs/content_widget_guildleve_marker_decomp.md`
- `meteor-decomp-0.1.4/docs/seq005_kick_gate_analysis.md`
- `meteor-decomp-0.1.4/docs/ffxivdecomp_inbound_opcodes.md`
- `meteor-decomp-0.1.4/docs/ffxivdecomp_opcode_binding_map.md`
- `meteor-decomp-0.1.4/docs/work_field_inventory_index.md`
- `meteor-decomp-0.1.4/docs/work_field_coverage_index.md`
- `ida free/ffxivgame.exe_20260527205729.asm`
- `ida free/string values.txt`
- `FF14-Memory/docs/hamlet_defense_framework.md`
- `FF14-Memory/docs/hamlet_score_ui_handoff.md`
- `FF14-Memory/docs/opcodes/hamlet_score_packet_reverse.md`
- `FF14-Memory/Map Server/WorldManager.cs`
- `FF14-Memory/Map Server/Packets/Send/Events/EndEventPacket.cs`
- `FF14-Memory/Data/scripts/directors/Instance/Totorak.lua`

## Instance/Cutscene Deep Dive Addendum

This pass narrowed the scope to instance entry and cutscenes in instances,
especially Toto-Rak.

### Instance Area Flag Mismatch

`PrivateArea` is internally constructed as an instance raid:

```text
PrivateArea(...): base(..., isInstanceRaid: true)
```

But both private-area bind packets still advertise the final instance-related
slots as false:

- `Map Server/Actors/Area/PrivateArea.cs`
- `Map Server/Actors/Area/PrivateAreaContent.cs`

`Zone.CreateScriptBindPacket` does pass the real `isInstanceRaid` value, so
public zone binds and private/content area binds diverge. This matters because
the decompiled `PlayerBase._onTouch` instance-raid-service branch is gated on
`areaMaster:isInstanceRaid()`.

Do not flip this globally. Existing project notes say that globally sending the
private-area instance slot as true crashed the stock client on private-area
entry/teleport. The safer experiment is narrow: log the outgoing
`PrivateAreaContent` instantiate params for Toto-Rak, then test an opt-in
content-only flag once the surrounding event/content state is present.

### Player Instance-Raid Service Command

The client-side instance-service command is not a normal NPC click. Decompiled
`PlayerBase._onTouch(self, touchKind, touchEnter)` shows:

```text
touchKind 5 = instance-raid service
requires areaMaster:isInstanceRaid()
enter -> _executeCommand(cmdName, _getStaticActor(24301), 30004, 5, 1)
leave -> _executeCommand(cmdName, _getStaticActor(24301), 30004, 5, 2)
```

The state behind this lives in four-slot `playerWork` arrays:

```text
variableCommandPlaceDriven[4]
variableCommandPlaceDrivenSub[4]
variableCommandPlaceDrivenTarget[4]
variableCommandPlaceDrivenPriority[4]
```

The current server initializes and syncs `playerWork.isContentsCommand`, but
`PlayerWork.cs` does not expose the place-driven arrays. That is probably why
manual widget probes can reach the client while the natural raid/content command
bar state is still absent.

### Director and Content-Group State

The server does create content groups for instances. `ContentGroup` sends:

```text
contentGroupWork._globalTemp.director
contentGroupWork.property[0]
```

and `Character.SetCurrentContentGroup` syncs:

```text
charaWork.currentContentGroup = group.GetTypeId()
```

For Toto-Rak, the generic content group currently reports
`ContentGroup_SimpleContentGroup24B` (`30006`). The decomp notes separately
identify `directorWork.contentCommand` and `directorWork.contentCommandSub` as
the director-side content command pair, but the current generic `Director`
implementation does not sync a `directorWork` object at all. Treat that as a
distinct instance gap from the area flag.

### Local Toto-Rak Entry Status

Current local scripts have both the retail-ish path and a safe bypass:

- `Data/scripts/totorak_entry.lua`
  - `TotorakAskEntry(player)` calls `askEnterInstanceRaid(raidId)`.
  - `TOTORAK_NPC_ENTRY_CUTSCENE_ENABLED = false` because direct playback can
    crash the current client.
  - `TOTORAK_NPC_ENTRY_WIDGET_ENABLED = false` because the entry widget can
    leave the client waiting on this server.
  - `TotorakStartDebugInstance` creates a private content area and zones the
    player directly.
- `Data/scripts/directors/Instance/Totorak.lua`
  - `init()` returns `/Director/OpeningDirector`.
  - `sendInstanceUi` runs `_setInstanceRaid(true)` and
    `_loadTextDataPermanently`.
  - entry cutscene candidates are `com0l610`, `com0l510`, `com0g610`,
    `com0g510`, and `com0u610`.

The replay table confirms these names as Toto-Rak replay scenes:

| Quest | Replay id | Scene |
| ---: | ---: | --- |
| `111405` | `11140501` | `com0l610` |
| `111406` | `11140601` | `com0l510` |
| `111605` | `11160501` | `com0g610` |
| `111606` | `11160601` | `com0g510` |
| `111805` | `11180501` | `com0u610` |
| `111806` | `11180601` | `com0u510` |

So the issue is unlikely to be "wrong cutscene key" for the listed entry scenes.
It is more likely missing instance/event lifecycle state around the scene.

### Cutscene Packet Path to Watch

The client cutscene subtable is clear:

```text
7  -> CutScene._onInitializationClip(PreviewSetupClip)
8  -> CutScene._onInitializationClip(Personage)
9  -> CutScene._onShowUIClip
10 -> CutScene._onHideUIClip
11 -> CutScene._onShowWidgetClip
12 -> CutScene._onHideWidgetClip
13 -> CutScene._onOpenUIClip
14 -> CutScene._onFinalizeClip
17 -> System._onPreCutSceneCancel
18 -> System._onPostCutSceneCancel
20 -> DesktopWidget._onPreWarp
21 -> DesktopWidget._onPostWarp
38 -> _onReceiveDataPacket
```

These are CommandUpdater sub-opcodes, not raw wire opcodes. The server needs the
correct wrapper/route before sending them directly would mean anything.

For instance cutscene hangs, the most useful live trace is:

```text
client sends 0x012D EventStart
server sends 0x0130 RunEventFunction delegateEvent or instance directive
CutScene sub-opcode 8 initializes Personage
optional 9-13 UI/widget clip events
CutScene sub-opcode 14 finalizes
DesktopWidget 20/21 wrap the warp
server sends EndEvent with the active event category
client sends 0x0007 ZoneInComplete
```

The current server's receive-side `0x0007 ZoneInCompletePacket` only reopens
movement. It does not currently use that callback to finish an
`InstanceRaidBaseClass.startEvent`-style entry sequence.

### Generic Data InstanceRaid Lead

`GenericDataPacket` is just a Lua-param wrapper over opcode `0x0133`; local uses
cover `requestedData` keys such as quest map markers, guildleve history, Hamlet
score probes, and `contentTimers`.

ffxivDecomp's entry-38 receiver notes say `_onReceiveDataPacket` also fans out
to an `InstanceRaid` numeric branch with values `1`, `2`, and `3`. No local typed
helper currently builds those forms. That makes `0x0133` another candidate for
missing instance state, but it should be probed as a typed experiment rather
than by mixing more `requestedData` strings into the path.

### Tight Next Experiments

1. Add debug logging around Toto-Rak `PrivateAreaContent.CreateScriptBindPacket`
   to print the Lua params and verify exactly what the client sees for
   `isInstanceRaid`.
2. Add a guarded Toto-Rak-only experiment that advertises instance raid only
   after director/content group state is in place; do not blanket-flip all
   private areas.
3. Implement or probe `playerWork.variableCommandPlaceDriven*` sync for the
   static raid-service actor `24301` and command `30004`.
4. Add a typed `GenericDataPacket` probe for the `InstanceRaid` numeric
   `1/2/3` branch and log whether `_onReceiveDataPacket` reaches an instance
   handler.
5. Use the real client logs to check whether sub-opcodes `8`, `14`, `20`, and
   `21` fire during `!totorak cutscene`, NPC entry, and direct debug entry.
6. Recover the missing raw `/Director/InstanceRaid/InstanceRaidBaseClass` LPB
   from a full client data corpus; the local search only found
   `tools/decode_lpb.py`, not the LPB itself.

### Native Registrar Follow-up

A lower-level pass through the IDA export found very few literal
`InstanceRaid` strings. That is useful by itself: several tempting names are
not the missing instance-entry gate.

- `askEnterInstanceRaid`: no literal was found in the IDA string/ASM export;
  it only appears in Lua/docs in this workspace. Treat it as script/client UI
  vocabulary, not a native Lua binding currently recoverable from this export.
- `_setInstanceRaid`: registrar `0072E5F0` binds handler `006E3C10`. The
  handler parses one bool-ish argument through `sub_71BA00` and writes the byte
  to `this+0xBB`. This confirms `_setInstanceRaid(true)` is a local
  area/script-object flag, not the selected HUD widget or a content work-sync
  update by itself.
- `_getInstanceName`: registrar `007367E0` is tagged in the imported map as
  `Debug_registerLua_getInstanceName_internal`. Handler `006DC6F0` flows into
  `sub_78C550`, which reads one script arg, calls `sub_CC7520`, and returns the
  resulting string. Treat it as a debug/tracing helper, not an instance-entry
  mechanism.
- `_loadCutScene`: Sequence registrar `00736000` registers `_loadCutScene` to
  `nullsub_434` in this export. That makes it a weak lead for live instance
  entry. The live path should stay focused on `delegateEvent`/`createCutScene`
  and the CutScene sub-opcode stream.
- `0x0133` data packet: handler `00759E50` copies a `0xC0` payload and calls
  `008A0190`. `008A0190` marshals the payload, raises `[servererror]` on parse
  failure, otherwise invokes Lua `_onReceiveDataPacket` through `sub_CC7A90`.
  No native `InstanceRaid` branch appears in that C++ wrapper; the
  `InstanceRaid` numeric `1/2/3` split is probably Lua-side.

### Command/Proximity Follow-up

The raid-service command path is now firmer than the execution HUD path.

- `sub_753F90` registers the general command methods. `_executeCommand`
  (`0073F080`) installs handler `006DE650`, which is only a vtable thunk to
  target slot `+0xA8`. `_callServerOnCommand` and `_doServerOnCommand` use the
  same descriptor shape through `sub_73D1E0` and dispatch through slots
  `+0xB4` and `+0xB8`.
- `_getStaticActor` is `00741A30 -> 006DCDF0 -> 0078CC30`; it resolves an
  existing actor wrapper or creates a static actor wrapper. `_getStaticActorID`
  is `007498F0 -> 006F9690` and returns `actor+0x0C & 0xFFFFF`.
- `xtx_command.csv` row `24301` is the generic place-dependent command with a
  variable name. `xtx_command_place.csv` row `30004` is the special attribute
  lane, and the server constant is `ContentGroup_SimpleContentGroup32A`.
- Proximity begin is `00759820 -> 008A3DE0 -> 006E11E0 -> 00898D20`.
  Proximity end is `007598A0 -> 008A3E20 -> 006E1200 -> 00898EB0`.
  The two final handlers construct `_onTouch(touchKind, true)` and
  `_onTouch(touchKind, false)`.
- The native proximity handlers only suppress touch kind `1` while in an inn.
  Touch kind `5` reaches PlayerBase script, where the instance-raid service
  branch checks `areaMaster:isInstanceRaid()` and executes the 24301/30004
  command.

Implementation implication: the next server-side probe should drive or observe
the proximity/touch-kind `5` path and the
`playerWork.variableCommandPlaceDriven*` state. That is distinct from, and not
yet a replacement for, the missing execution-widget selected-index gate.

### Dat-Sheet Instance Evidence

The local DAT mining files add stronger evidence that instance entry is a
parameterized raid workflow, not just a cutscene key plus warp.

- `xtx_raidDungeon.csv` names the raid ids: `1` Toto-Rak, `2` Dzemael, `6`
  Aurum Vale, `7` Cutter's Cry, `8`-`10` Hamlet battles, `15` Rivenroad, and
  `16` Rivenroad Hard.
- `raidFst0Dungeon03Guide.csv` is the Toto-Rak guide text. It uses
  `xtx/raidDungeon,$E8(1)` for the dungeon name, `$E8(2)` for minutes, and
  `$E8(4)` for required level. The guide text hard-codes the expected party
  range as `2`-`4`.
- `raidRoc0Dungeon01Guide.csv` is the Dzemael guide text. It follows the same
  state-machine vocabulary, but with party range `4`-`8`.
- `instanceRaidGuideAurumVale.csv` and `instanceRaidGuideCuttersCry.csv` are
  the same guide family for raid ids `6` and `7`.
- `raidDungeonExit.csv` expects place-name ids in `$E8(1)`/`$E8(3)` and warns
  about the re-entry cooldown. Exit is therefore also a scripted
  instance/notice UI path, not just a coordinate warp.
- `worldMaster.csv` has a dense instance-raid message block around ids
  `52049`-`52095`: cooldown, party-size/level failure, too-far failure,
  bad-status failure, party defeated, loot warning, leaving, half-time warning,
  objective failure, active-mode failure, and busy/action failure. These all
  key their text through `xtx/raidDungeon,$E8(1)` plus the same level/party/time
  `$E8` values.

Current Toto-Rak constants line up with these sheets (`raidDungeon` id `1`,
level `25`, party `2`-`4`, duration `60`). The missing part is probably the
client-facing state that populates the guide/raid UI and `Status -> Timers ->
Content`, then tears it down on exit. The current server only uses generic
world message `34108` ("entered an instance") in the content-zone path, not the
raid-specific `520xx` lifecycle messages.

### Re-Ranked Missing State Stack

1. `Area` / `PrivateAreaContent` has to advertise the private area as instance
   raid at the right time. The C# object is internally marked as instance raid,
   but the Lua bind packet still hard-codes the relevant tail flags false.
2. `Director` / `ContentGroup` needs the active content identity, including
   `directorWork.contentCommand` and `contentCommandSub`, not just an attached
   group object.
3. `playerWork.variableCommandPlaceDriven*` probably needs to mark the
   instance-raid service command path for static actor `24301` and command
   `30004`.
4. A typed `0x0133` / `_onReceiveDataPacket` `InstanceRaid` numeric payload
   likely fills in the runtime raid state (`1/2/3` branch), while the existing
   local `contentTimers` string path only covers one visible timer use.
5. Cutscene clip setup/finalize and DesktopWidget pre/post-warp remain the
   cutscene lifecycle closure. They look downstream of the missing instance
   state rather than the first thing to spoof.

### Server Work-Sync Surface Gap

The local server cannot currently express several of the work roots that the
client-side corpus says matter for instances:

- `SetActorPropetyPacket.AddProperty` only accepts roots `work`, `charaWork`,
  `playerWork`, `npcWork`, `guildleveWork`, and `behestWork`.
- `SynchGroupWorkValuesPacket.addProperty` only accepts roots `work`,
  `partyGroupWork`, and `contentGroupWork`.
- There is no local generic `DirectorWork` class. `Director.GetInitPackets`
  only sends `/_init`, and `ContentGroup.SendInitWorkValues` only sends
  `contentGroupWork._globalTemp.director` and `contentGroupWork.property[0]`.
- Local `PlayerWork` does not contain the
  `variableCommandPlaceDriven*` arrays that `PlayerBase._onTouch` uses for the
  instance-raid service command.

This means a naive call such as `AddProperty("directorWork.contentCommand")` or
`AddProperty("areaWork.isInstanceRaid")` would be rejected before it ever hit
the wire. The missing data is not only unset; the current generic property
helpers have no route for those roots.

The static SQL zone table strengthens that conclusion. `server_zones.sql` has
an `isInstanceRaid` column, but a parse of the 97 local rows found zero rows
with `isInstanceRaid = 1`, including Toto-Rak's public zone row. So the instance
identity must come from the dynamic private/content area bind path, director
state, work-sync, or generic data, not from the base zone record.

### Hamlet as a Control Case

Hamlet Defense is the richest local comparison path because it uses the same
instance-raid vocabulary but has many more probes wired than Toto-Rak.

`Data/scripts/directors/Hamlet/Defense.lua` can initialize the client director
with several tuple shapes:

- guildleve-compatible: class path, `0x4e25`, display guildleve id, and
  guildleve-style metadata.
- raid profile: class path, `0x4e25`, raid dungeon id, supply rating, and
  zeroed extra fields.
- hamlet profile: class path, `0x4e25`, raid dungeon id, supply rating, title
  widget index, time limit, and one extra zero.

Its runtime bootstrap calls:

```text
_setInstanceRaid(true)
_loadTextDataPermanently()
_waitForHamletDefenseScore(raidDungeonId, supplyRating)
_countHamletDefenseScore(raidDungeonId, supplyRating)
_getHamletDefenseScore(raidDungeonId, supplyRating)
_getHamletDefenseScoreAll(raidDungeonId, supplyRating)
requestedData, hamletDefScore / hamletDefScoreAll
0x01A8 HamletDefenseScore native compact payload
0x0132 commandRequest / widgetCreate / macroRequest
_reserveWidgetContainer / _getWidgetFromWidgetContainer
_createWidgetInWidgetContainer(0x1B, Window_HamletDefenseWidget)
```

It also has configurable cutscene dispatch modes:

- `etcdelegate`: `delegateEvent` through replay quest actor `Etc202`
- `directordelegate`: `delegateEvent` on the director
- `direct`: call the scene function directly
- `nq` / `nqdelegate`: use `startNQCutScene`
- `off`: skip the scene

The important negative evidence is that all of this can still fail to open the
retail Hamlet HUD. That makes Hamlet a useful warning for Toto-Rak: sending
`_setInstanceRaid`, `_loadTextDataPermanently`, a widget create, or even valid
data packets is not the same as satisfying the upstream director/content HUD
selector.

Toto-Rak's current director script is much thinner by comparison:

```text
_setInstanceRaid(true)
_loadTextDataPermanently()
delegateEvent(player, quest, com0* entry scene)
EndEvent()
```

That should stay as a minimal baseline, but it probably lacks at least one of
the Hamlet-style state layers: director init tuple, work-sync, typed generic
data, event close timing/category, or the selected-widget source.

### Toto-Rak Probe Surface and In-Dungeon Data

The local `!totorak` GM helper is already a useful test matrix:

- `!totorak start`: normal instance start with party, level, and timer checks.
- `!totorak enter` / `force`: debug solo private dungeon copy with no entry
  widget or cutscene.
- `!totorak prep`, `prepenter`, `demo`, and `cutscene`: force the story quest
  sequence and replay known entry scenes.
- `!totorak timerdata`: sends `requestedData`, `contentTimers`, and the full
  local content timer list.
- `!totorak status`, `settimer`, and `cleartimer`: inspect or alter the
  re-entry timer side.

That gives clean A/B paths for tracing:

```text
real entry widget/start  vs.  direct private copy
entry cutscene replay    vs.  no cutscene
content timer data       vs.  no timer data
```

The in-dungeon object layer is also not blank. DAT files and scripts cover
Toto-Rak-specific magitek mechanics:

- `raidDungeonLight.csv` and `RaidDungeonLight.lua`: photocell pickup.
- `raidDungeonBarrier.csv` and `RaidDungeonBarrier.lua`: terminal asks whether
  to insert four photocells, then plays map-object animation `hide`.
- `raidDungeonWarp.csv`: magitek transporter ask/failure strings.
- `raidDungeonPoster.csv` and `raidFst0Dungeon03.csv`: expedition notes and
  dungeon flavor/object text.

Local object scripts use world messages `52023`, `52024`, and `52025` for
photocell obtained/count/inserted, and persist per-player state by unique map
object id. So "instances period" is partly implemented already: the missing
slice is mostly entry, live content state, HUD selection, and cutscene/loading
lifecycle, not every in-dungeon interaction.

### Toto-Rak Director Ownership and Lifecycle Split

The local Toto-Rak flow has a second, more concrete gap than the missing
`InstanceRaidBaseClass` asset: the real content director is probably attached
to the wrong area layer.

`Zone.CreateContentArea(...)` creates the requested director before the
`PrivateAreaContent` exists:

```text
Zone.CreateContentArea(...)
  -> CreateDirector(directorName, true, args)
  -> new PrivateAreaContent(..., director, ...)
```

That means Toto-Rak's `Instance/Totorak` director has `CurrentArea` set to the
parent public zone, not to the private content area. `director.AddMember(player)`
does still attach the director to the player's `ownedDirectors`, and
`Player.SendZoneInPackets(...)` does send all owned directors after the player
zones. So the director actor is not simply absent from the client. The smell is
ownership and lifecycle: cleanup paths such as `ClearContentAreaDirectors()` only
remove directors whose `CurrentArea is PrivateAreaContent`, and content-group
cleanup looks up members through `director.CurrentArea`.

Hamlet's private-instance test path is different and probably more faithful:

```text
zone.CreateContentArea(...)             -- shell content area/director
DoZoneChangeContent(player, contentArea)
contentArea.CreateHamletDefenseDirector(...)
director.AddMember(player)
director.StartDirector(true)
```

That creates the active Hamlet director on the `PrivateAreaContent` itself after
zoning. Toto-Rak currently does not have an equivalent `contentArea.Create...`
step; it only reuses the shell director returned by `GetContentDirector()`.

There is also a lifecycle split between the two local Toto-Rak entry paths:

- `GetWorldManager():StartTotorakInstance(...)`: starts the director/content
  group before zoning the party.
- `TotorakStartDebugInstance(...)`: zones the player first, then calls
  `director:StartDirector(true)` and `director:StartContentGroup()`.

Those are useful A/B probes, but they are not testing the same client sequence.
If one path reaches a different hang/crash, timing may be the cause rather than
the cutscene or widget data itself.

The local `Data/scripts/content/Totorak.lua` is intentionally tiny: it only sets
field/battle music on `onCreate` and `onZoneIn`. No hidden instance lifecycle,
HUD, or cutscene logic is present there.

### Content Timers Are Separate From Live Instance State

The local player model already has a 20-slot content timer array. The indices
line up with the `xtx_raidDungeon.csv` order minus one:

```text
timer[0]  = Toto-Rak / raidDungeon 1
timer[1]  = Dzemael / raidDungeon 2
...
timer[15] = Rivenroad Hard / raidDungeon 16
timer[16] = Behest
timer[19] = Skirmish
```

`RequestInformationCommand.lua` treats `raid`, `raids`, `raidtimer`,
`contentTimers`, and related aliases as requests for this profile/timer list and
sends:

```text
requestedData, contentTimers-or-requestType, count, timer[0..19]
```

So the profile `Content/Timers` widget is probably not the missing live dungeon
HUD. It can prove the timer data path, but it does not identify the current
instance, selected execution widget, objective state, or entry loading/cutscene
lifecycle.

### Local Opcode Reality Check

The local packet classes clarify a common trap in the decomp notes:

| Local packet | Direction here | Opcode | Meaning |
|---|---:|---:|---|
| `KickEventPacket` | server to client | `0x012F` | start/kick an event |
| `WorkSyncRequestPacket` | client to server | `0x012F` | string work-path request/write |
| `RunEventFunctionPacket` | server to client | `0x0130` | call a client event function |
| `EndEventPacket` | server to client | `0x0131` | close current event |
| `GenericDataPacket` | server to client | `0x0133` | Lua param data packet |
| `SetActorPropetyPacket` | server to client | `0x0137` | actor work/property sync |
| `SynchGroupWorkValuesPacket` | server to client | `0x017A` | group work/property sync |

That does not invalidate the ffxivDecomp WorkSync model, but it means the note
that compact S-to-C WorkSync candidates are `0x130`/`0x131` must be treated as a
different table/context until byte-pinned against this client/server packet
layout. In this local implementation, `0x0130` and `0x0131` are already the
event-function and end-event packets used heavily by cutscene flows.

The ffxivDecomp group-system docs also identify `0x187` as a
`WorkSyncUpdater` batch that fires Lua `_onUpdateWork`, but FF14-Memory has no
local `0x0187` sender class. The currently implemented server sync surfaces are
the string-path actor/group property packets above, plus the C-to-S
`WorkSyncRequestPacket` handler.

### Instance WorkSync Request Blind Spot

`PacketProcessor` currently logs special WorkSync request categories for hotbar,
Behest, and Hamlet UI testing. It does not have an instance-raid/Toto-Rak filter.

Useful properties to log during `!totorak start`, `enter`, `cutscene`, and
`timerdata` tests:

```text
areaWork
directorWork
instanceRaidWork
contentGroupWork
playerWork/variableCommandPlaceDriven
playerWork.variableCommandPlaceDriven
```

`Player.OnWorkSyncRequest(...)` currently only handles:

```text
charaWork/battleParameter
charaWork/exp
charaWork/parameterSave
charaWork/bonusPoint
work/achieveAetheryte
playerWork/questCompleteS
```

So even if the client asks for instance-related work paths, the server will log
almost nothing and send no matching data today. That makes a Toto-Rak-specific
WorkSync request logger a high-value next probe before inventing new packets.

### InstanceRaidBaseClass Asset Search

The decomp notes repeatedly point to
`/Director/InstanceRaid/InstanceRaidBaseClass.startEvent` as the faithful entry
path. That script reportedly calls `processLogin(true)` and then
`_fadeInNowLoadingForNoticeEventJustInArea` on content-instance entry.

I rechecked all three local roots:

- `meteor-decomp-0.1.4`
- `FF14-Memory`
- `ida free`

No raw `.lpb`, `.prog`, `.lua`, or decoded `InstanceRaidBaseClass` script asset
was found. The local evidence is therefore enough to prioritize the path, but
not enough to recover the exact `startEvent` directive. The next recovery step
is either a fuller client script corpus or a live capture/trace that shows the
inbound directive and field selector reaching `InstanceRaidBaseClass.startEvent`.

### Updated Probe Priority

1. Add logging for failed `SetActorPropetyPacket.AddProperty` and
   `SynchGroupWorkValuesPacket.addProperty` roots during Toto-Rak/Hamlet tests.
   This will prove when the server is attempting to sync roots it cannot send.
2. Pin the real S-to-C compact WorkSync opcode for binding-id updates before
   adding new work roots. Do not blindly reuse the older `0x130`/`0x131`
   candidate note: this local server already uses `0x0130` for
   `RunEventFunction` and `0x0131` for `EndEvent`.
3. Build the first `InstanceRaid` generic-data probe as a typed `0x0133`
   experiment, separate from `requestedData`, because the C++ wrapper only
   invokes Lua `_onReceiveDataPacket`; the `InstanceRaid` `1/2/3` split appears
   to be Lua-side.
4. Compare Hamlet's raid-profile director init tuple against Toto-Rak's
   `/Director/OpeningDirector` init. If Toto-Rak needs the instance-raid base
   class, `OpeningDirector` may be the wrong client-side class for live entry.
5. Compare parent-zone shell director ownership against Hamlet's
   content-area-owned active director path. Toto-Rak may need a
   `PrivateAreaContent`-owned instance director rather than only the shell
   director created by `Zone.CreateContentArea(...)`.
6. Add a Toto-Rak/instance WorkSync request logger for `areaWork`,
   `directorWork`, `instanceRaidWork`, `contentGroupWork`, and
   `playerWork.variableCommandPlaceDriven*`.
7. Use the existing `!totorak start`, `enter`, `cutscene`, and `timerdata`
   modes as the trace matrix before adding new commands.
8. Treat cutscene playback failures as lifecycle symptoms until the instance
   state stack is present. Valid replay keys and `delegateEvent` calls are
   already confirmed.

### Event Receiver Gates Explain The Cutscene Dead End

The event receiver decomp changes how to read the Toto-Rak cutscene failure.
The confirmed receiver gates are:

```text
0x012F KickEvent          target actor must pass actor[+0x5c] / event-receive gate
0x0130 RunEventFunction   target actor must pass actor[+0x7d] / event-dispatch gate
0x0131 EndEvent           cleanup dispatcher; not a simple actor-missing silent drop
```

So the entry cutscene cannot be debugged as only "send the right replay key."
The client first needs a valid active event on the right owner actor. Only after
that should `_setInstanceRaid`, `_loadTextDataPermanently`, and `delegateEvent`
be expected to land.

Local server flow matches that:

- inbound client `EventStart` (`0x012D`) sets
  `player.currentEventOwner/currentEventName/currentEventType`;
- `LuaEngine.EventStarted(...)` then calls the owner's `onEventStarted`;
- `Player.RunEventFunction(...)` builds `0x0130` from those current-event
  fields;
- `Player.EndEvent(...)` builds `0x0131` and clears those fields.

That means any attempt to call the Toto-Rak entry sequence before a successful
Kick/EventStart pair is working against either empty event state or stale event
state.

### Toto-Rak Currently Has Entry Logic But No Starter Kick

This is the strongest local gap found in this pass.

`Data/scripts/directors/Instance/Totorak.lua` has an empty `main()` and places
all of the useful entry work in `onEventStarted(...)`:

```text
_setInstanceRaid(true)
_loadTextDataPermanently()
delegateEvent(player, quest, com0* entry cutscene)
EndEvent()
```

But the local Toto-Rak startup path in `WorldManager.StartTotorakInstance(...)`
creates the content area, starts the director, adds players, starts the content
group, and zones the party. I did not find a corresponding `player.KickEvent(...)`
for the Toto-Rak director after zone-in.

That differs from known working or experimental director lifecycles:

- opening login scripts create/add/start an `OpeningDirector` and then call
  `player:KickEvent(director, "noticeEvent", true)`;
- `HamletDefenseDirector.BeginHamletDefenseIntro()` explicitly calls
  `player.KickEvent(this, "noticeEvent", "opening", openingCutsceneName)`;
- Toto-Rak has no equivalent kick in `WorldManager`, `Totorak.lua`, or
  `content/Totorak.lua`.

Practical interpretation: the client may never enter
`Instance/Totorak.lua:onEventStarted`, so the confirmed cutscene replay keys can
be correct while still never loading. The first proof should be logging whether
any Toto-Rak `0x012D EventStart` arrives after `DoZoneChangeContent`.

### EventStart Owner Lookup Is Another Toto-Rak Probe Point

`PacketProcessor` resolves inbound `0x012D EventStart` owners in this order:

```text
static actors
current spawned retainer
CurrentArea.FindActorInArea(ownerActorID)
battle command pseudo actor
player.GetDirector(ownerActorID)
```

If none match, it logs "Could not find actor" and breaks out. The Hamlet debug
path can force-close the event, but this is not currently a Toto-Rak-specific
diagnostic.

For Toto-Rak, `player.GetDirector(ownerActorID)` should work only if the content
director is present in the player's `ownedDirectors` list and the client reports
the same actor id as the server-side director. Because the content-area director
ownership/current-area split is already suspicious, add a targeted EventStart
log before changing packets:

```text
player
current area name/id/private area flag
eventStart.triggerActorID
eventStart.ownerActorID
eventStart.eventName
eventStart.eventType
which owner lookup branch matched
owned director ids/script paths/current areas
```

If no EventStart arrives, the missing kick is the lead. If it arrives but owner
lookup fails, the director identity/ownership path is the lead. If it arrives
and owner lookup succeeds, then the next gate is `RunEventFunction` dispatch.

### Content Warp May Miss The DesktopWidget Pre/Post Gate

The ffxivDecomp integration notes identify a separate warp UI gate:
DesktopWidget `_onPostWarp` (sub-index 21) silently no-ops unless `_onPreWarp`
(sub-index 20) first set DesktopWidget `+0x7b`.

Local `DoZoneChangeContent(...)` currently sends:

```text
DeleteAllActors
_0xE2Packet(0x10)
ClearInstance()
SendZoneInPackets(...)
SendInstanceUpdate(true)
contentArea.onZoneIn(...)
```

`_0xE2Packet` is documented locally as a map-change/show-hide-UI helper, but I
did not find an explicit server-side DesktopWidget pre/post warp sender in the
content warp path. If retail instance entry relies on the pre/post warp
sub-events, the client can complete the actor reset but still fail the UI/cutscene
loading state machine.

Probe priority: capture/log the actual client-visible sequence around
`DoZoneChangeContent` and check whether the sub-index 20 event precedes any
sub-index 21 or cutscene finalize traffic. Do not assume `_0xE2(0x10)` covers
that gate until it is byte-pinned.

### Selected Raid Widget Gate Is Not WidgetCreate

The raid execution HUD anchor is known:

```text
Window_RaidDungeonExecutionWidget
global execution-widget index 0x18 / 24
assets sqwt/widget/RaidDungeonExecutionWidget.form/.tpl
```

But the UI decomp says the selected execution widget comes from the UI manager's
selected index/current Sqwt element path, especially the current/focused element
and its parent chain exposing a key at `+0x298`. Blind widget-container calls can
create/query widgets without making `Window_RaidDungeonExecutionWidget` the
selected content widget.

Also, `_setInstanceRaid(true)` is now pinned as a script-object bool write to
`this+0xBB`; it does not select the raid widget. Treat it as a necessary-looking
instance flag, not the HUD opener.

### Ghidra C Dump Status

`FF14-Memory/Client Sourcecode Decomp/ffxivgame.exe.c` exists and includes the
nearby receiver/vtable cluster (`UNK_01057348`, `UNK_010574c8`, and related
constructors/destructors). However, the exact bodies needed for this pass
(`FUN_0089f430`, `FUN_0089e8e0`, `FUN_008a13a0`, `_setInstanceRaid`, and
`_onReceiveDataPacket`) were not emitted under those exact names in this dump.

So for the receiver gates, the meteor-decomp docs remain the cleaner source.
The C dump is still useful as a local cross-check surface, but it did not recover
`InstanceRaidBaseClass` or add a new direct Toto-Rak native handler in this pass.

### New Highest-Value Toto-Rak Tests

1. Log every `0x012D EventStart` while the player is in Toto-Rak content,
   including owner lookup branch and owned director ids.
2. After `DoZoneChangeContent` finishes and the director spawn/init packets have
   been sent, run a guarded `player.KickEvent(director, "noticeEvent", "opening")`
   or equivalent probe for the content director. Watch for client lockups, but
   this is now the direct missing-lifecycle test.
3. Log all Toto-Rak `RunEventFunction` sends with current event owner/name/type.
   Warn if owner is zero or not the content director when `_setInstanceRaid`,
   `_loadTextDataPermanently`, or `delegateEvent` are queued.
4. Capture the content warp packet sequence and identify whether DesktopWidget
   pre/post warp sub-events are present. This is separate from Kick/EventStart.
5. Keep the raid widget probe focused on the selected-index/current-element gate,
   not just `widgetCreate(0x18)`.

### Event Coroutine Bridge and Acknowledgement Semantics

The local Lua bridge has an important split:

```lua
function kickEventContinue(player, actor, trigger, ...)
    player:kickEvent(actor, trigger, ...);
    return coroutineYieldIfRunning("_WAIT_EVENT_START", player, actor, trigger);
end

function callClientFunction(player, functionName, ...)
    player:RunEventFunction(functionName, ...);
    return coroutineYieldIfRunning("_WAIT_EVENT", player);
end
```

`callClientFunction(...)` is not just a convenience wrapper. It sends
`RunEventFunction` and then waits for a client `0x012E EventUpdate`.
Plain `player:RunEventFunction(...)` is fire-and-forget.

The same distinction matters for the current `processEvent035` repro. A helper
that sends `RunEventFunction`, performs a same-area event warp, and waits
afterward has not proven that the client ran the quest method. An immediate
empty update in that shape is stronger evidence for a function dispatch no-op
or owner/event mismatch than for a cutscene playback hang.

This is not contradicted by the modern no-cutscene instance path. Decomp of
`InstanceRaidBaseClass.startEvent("none", ...)` still clears notice-event
loading, fades in, waits, optionally plays start effects, opens the information
widget, and only then sets `initFlag`. A no-cutscene lifecycle is still visible
work, not an instant empty update.

It also creates a wait-registration race. `runClientFunctionTyped` is
fire-and-forget, so a fast empty update can arrive before the later
`waitClientFunction` has yielded on `_WAIT_EVENT`. That explains the mixed
symptom where the client clearly answered, but the server-side script can still
look stuck or out of phase after the same-area warp.

`LuaEngine.OnEventUpdate(...)` currently returns when there is no registered
wait for the player. So an early no-op update is not buffered for the later
`waitClientFunction`; it is dropped as a resume signal.

Local routing also ignores the parsed update type byte. `EventUpdatePacket`
reads `eventType`, but `Player.UpdateEvent(...)` calls
`LuaEngine.OnEventUpdate(this, update.luaParams)`. The coroutine wait therefore
resumes from the Lua params only, and an empty update resumes as empty values if
the wait is registered at that moment.

`LuaEngine.ResolveResume(...)` maps `_WAIT_EVENT` to
`AddWaitEventCoroutine(...)` and `_WAIT_EVENT_START` to
`AddWaitEventStartCoroutine(...)`. `LuaEngine.OnEventUpdate(...)` resumes the
single coroutine waiting for that player. The received `EventUpdatePacket` has
trigger actor id, server codes, unknown bytes, event type, and Lua params, but
does not carry a clean owner/event name pair. So any event update for that
player can be enough to resume the wait.

`LuaEngine.EventStarted(...)` is stricter. It resumes `_WAIT_EVENT_START` only
when the expected owner id and event name match the incoming `0x012D
EventStart`. If a different EventStart arrives while a coroutine is waiting, the
engine logs recovery information and cancels the stale wait.

That gives Toto-Rak a concrete sequencing mismatch. `Instance/Totorak.lua`
currently sends:

```lua
player:RunEventFunction("_setInstanceRaid", true);
player:RunEventFunction("_loadTextDataPermanently", player, nil, "item", "gilshop", "instanceContent", "raidTotorak", "raidCommon");
wait(1.0);
callClientFunction(player, "delegateEvent", player, instanceDirector, openingFunc);
```

So Toto-Rak does not wait for `_setInstanceRaid` or
`_loadTextDataPermanently` acknowledgements. Hamlet Defense, by contrast, uses
`callClientFunction(...)` around `_setInstanceRaid`,
`_loadTextDataPermanently`, score setup, and widget bootstrap functions.

This can fail in either direction:

- If `_setInstanceRaid` and `_loadTextDataPermanently` produce EventUpdate
  responses, Toto-Rak may race ahead to `delegateEvent`.
- If either function does not produce EventUpdate, changing them blindly to
  `callClientFunction` can hang the Lua coroutine.

Probe before changing behavior: log every `0x012E EventUpdate` after
`_setInstanceRaid`, `_loadTextDataPermanently`, and `delegateEvent` in Toto-Rak.
That tells us which calls are safe to sequence with `callClientFunction` and
which need a timed delay or a different start event.

### KickEvent Notice Byte Is Load-Bearing

The meteor-decomp Kick receiver map pins a small but critical byte:
`receiver[+0x80]` is set only when the incoming `KickEvent` event type byte is
`0x05`, the client-side `noticeEvent` type.

The packet parse path stores the packet body event type at receiver offset
`+0x68` and compares it to the global notice-event byte. If the value is not
`5`, the receiver's Branch B1 can silently no-op instead of starting the event.

Local `Player.KickEvent(...)` already uses the right value:

```csharp
KickEventPacket.BuildPacket(Id, actor.Id, eventName, 5, lParams)
```

So the next Toto-Rak test should use the existing `Player.KickEvent` or Lua
`kickEventContinue(...)` path, not a handcrafted subpacket. If instrumentation
is added, log the emitted `KickEventPacket` event type byte beside trigger actor
id, owner actor id, and event name.

### Toto-Rak Entry Starts Content But Not The Content Event

The NPC entrance path still has no confirmed retail-style content event kick.
`PopulaceTotorakEntrance.lua` calls `TotorakTryStartFromNpc(player)` and then
`player:EndEvent()`.

`TotorakTryStartFromNpc(...)` can:

- optionally play a disabled entry cutscene,
- optionally call the disabled entry widget path,
- start the debug solo instance path, or
- call `WorldManager.StartTotorakInstance(...)`.

The normal server path creates the content area, creates or retrieves the
director, starts director/content state, then zones the party. The debug path
zones first and then calls `startDebugDirector(...)`, which adds the player to
the director and sends director spawn/init after the zone packets. Both paths
can get the player into the private content area, but neither path performs an
obvious post-spawn `KickEvent` to begin the director notice event.

The final `player:EndEvent()` only closes the old Bloisirant talk event. It
does not prove that the content director's `noticeEvent` has begun.

This is now the sharpest Toto-Rak hypothesis:

```text
content area exists
director exists
director spawn/init reaches client
old talk event is ended
but no content director EventStart is kicked
```

If that is true, `delegateEvent` is being sent into a client that never entered
the corresponding content/director event context.

### InstanceRaidBaseClass Payload Recovered

The local LPB output now includes decoded 1.0 instance raid scripts under
`tools/outputs/lpb/InstanceRaid`. The old "payload missing" note is obsolete.

`InstanceRaidBaseClass` defines `instanceRaidWork` with:

```text
startTime i32
finishTime i32
contentID i16
eventType i8
countdownStatus i8
clearFlag bool
initFlag bool
_assignForChild 192
```

Its entry function is:

```text
startEvent(cutsceneName, cutsceneOwner, cutsceneModeFlag,
           contentID, startTime, finishTime, eventType, ...)
```

The flow is:

```text
set content/timer/event fields
processLogin(false)
processStartEvent(...)
run cutscene, or fadeInNowLoadingForNoticeEventJustInArea when cutsceneName == "none"
fadeIn(1)
if eventType ~= 0, run processStartEffect() and wait
openInformationWidget()
initFlag = true
```

The generic information widget is also explicit:

```lua
desktopWidget:openRaidDungeonExecutionWidget(nil, contentID, finishTime)
desktopWidget:closeRaidDungeonExecutionWidget()
```

`_onReceiveDataPacket` is Lua-side fan-out after `initFlag`:

| Type | Behavior |
|---:|---|
| `1` | mark clear, reset timer from args 1/2, close raid widget |
| `2` | mark clear, zero countdown, close raid widget |
| `3` | call `processUserMessage(...)` |

This gives Toto-Rak a sharper target than the current local
`/Director/OpeningDirector` placeholder. A faithful probe should spawn/bind an
instance raid director class, kick its `noticeEvent`, then run `startEvent` with
content id, server start/finish times, and an event type instead of manually
calling `_setInstanceRaid` and `_loadTextDataPermanently`.

The decoded trial-style subclasses do not expose a separate `TrialWidget`.
Ifrit, Garuda, Moogle, White-General, Aurum Vale, Cutter's Cry, and related
classes inherit the same raid HUD; only Lesser Ifrit and Lesser White-General
add cutscene/weather hooks.

### Hamlet Script Payload Recovered

`InstanceRaidHamletDefense` overrides the information widget:

```lua
desktopWidget:openHamletExecutionWidget()
```

It maps content ids `8/9/10` to Hamlet ids `1/2/3`, loads text group `10208`,
and keeps local work for rank, cargo target, battle value, boss flag, harvest
counts, defense-line state, goods state, and six field buffs.

The bytecode strings recover the Hamlet execution widget command surface:

```text
getHamletExecutionWidget
getHamletPopupWidget
cmdSetTitle
cmdSetTimer
cmdSetDefenseLineStatus
cmdSetGoodsStatus
cmdSetTargetGoods
cmdResetGatheringItem
cmdSetGatheringItem
cmdSetArmyBuff
cmdSetEnemyBuff
cmdSetBossStatus
cmdSetWarPotentialValue
cmdShow
```

`GenericDataPacket` type `3` feeds `processUserMessage(messageType, ...)`;
that function branches on message types `1..10`, with type `10` routing to
`dispInformation`. `dispInformation` uses message ids `11..28`; ids `21..28`
include item ids `1019`, `1091`, `1022`, `1063`, `1013`, `1018`, `1017`, and
`1063`.

So Hamlet HUD work should pivot away from direct `_loadForm`/container probes
and toward the recovered script path: `openHamletExecutionWidget()` plus
typed GenericData updates. The next native decomp target is the desktopWidget
binding registrar for these method names.

### Updated Toto-Rak Probe Shape

1. Add Toto-Rak-only diagnostics for all `0x012D EventStart` and `0x012E
   EventUpdate` packets while the player is in zone 159/private Toto-Rak
   content.
2. After the director spawn/init is definitely sent, send a guarded content
   director `KickEvent` with event type `5`, event name `noticeEvent`, and log
   whether the client returns a matching `0x012D EventStart`.
3. Prefer testing the coroutine path first:
   `kickEventContinue(player, director, "noticeEvent", ...)` from a coroutine,
   then let the director's `onEventStarted` perform `_setInstanceRaid`,
   `_loadTextDataPermanently`, and opening `delegateEvent`.
4. If the KickEvent succeeds but `delegateEvent` still fails, check the
   `RunEventFunction` owner/name/type fields against the active event context.
5. Only after EventStart is proven should `_setInstanceRaid` and
   `_loadTextDataPermanently` be converted from fire-and-forget to
   `callClientFunction`, and only if packet logs show the client emits
   EventUpdate for those functions.

### Director Notice Conditions Are Sent Before Script Bind

Meteor-decomp has a receiver-level explanation for another possible silent
failure: `0x016B SetNoticeEventCondition` targets `DirectorBase`.

The native receiver performs:

```text
dynamic_cast<DirectorBase>(dispatch_ctx)
if success: store notice condition in DirectorBase[+0x60]
if fail:    store notice condition in ActorBase[+0x118]
```

That fallback is not a hard packet drop, but it can silently place notice
conditions where the later director notice evaluator may not look. The older
meteor docs call this the "orphaned conditions" hypothesis.

Local FF14-Memory sends director notice conditions before script bind:

```text
Director.GetSpawnPackets(...)
  AddActor(0)
  SetNoticeEventCondition x3
  SetActorSpeed
  SetActorPosition
  SetActorName
  SetActorState
  SetActorIsZoning(false)
  ActorInstantiate / script bind
```

Base `Actor.GetSpawnPackets(...)` and `Npc.GetSpawnPackets(...)` follow the
same event-condition-before-`ActorInstantiate` pattern. For directors, the
default conditions are created in the `Director` constructor:

```text
noticeEvent     unknown1=0x0e unknown2=0
noticeRequest   unknown1=0x00 unknown2=1
reqForChild     unknown1=0x00 unknown2=1
```

Local `SetNoticeEventCondition` is implemented and uses opcode `0x016B`. The
packet body is two bytes followed by the condition name. `SetEventStatus` is
also implemented as opcode `0x0136`; for notice conditions, local code uses
type `5`.

The immediate Toto-Rak probe should therefore test condition timing directly:
after the content director has been spawned, script-bound, and sent its
`/_init` packet, re-send:

```text
director.GetEventConditionPackets()
director.GetSetEventStatusPackets(noticeEnabled: true)
```

Then send the guarded director `KickEvent`. If `0x012D EventStart` begins to
arrive only after this post-bind re-send, the cutscene failure is not primarily
an asset/load issue; it is the notice-condition/actor-readiness ordering.

There is an even more direct local gap: owned directors do not appear to receive
the post-init `SetEventStatus` enable packet at all.

Local NPC patterns often do:

```text
npc.GetSpawnPackets(...)
npc.GetInitPackets()
npc.GetSetEventStatusPackets(...)
```

Examples include Guildleve, Behest return nodes, Chocobo Caravan NPCs, and
session spawn handling. But owned director paths currently do:

```text
director.GetSpawnPackets()
director.GetInitPackets()
```

This applies both in `Player.SendZoneInPackets(...)` for `ownedDirectors` and
in `Player.SendDirectorPackets(...)`. `Director.StartDirector(...)` likewise
queues only spawn and init. I did not find a generic director-side call to
`GetSetEventStatusPackets()`.

So the stronger hypothesis is:

```text
Director defines noticeEvent/noticeRequest/reqForChild with 0x016B
Director never enables those conditions with 0x0136
KickEvent noticeEvent is sent to a director whose condition exists but is not active
Client never sends 0x012D EventStart
```

Probe priority: for Toto-Rak only, queue `director.GetSetEventStatusPackets()`
after `director.GetInitPackets()` and before the KickEvent. This is lower-risk
than globally changing director spawn behavior because it targets the failing
instance path first.

### Kick Gate Depends On Run-Event Readiness

The `+0x5c` kick gate has been resolved in meteor-decomp. The writer is
`FUN_00766f00` (RVA `0x366f00`). It looks up the actor using the same
`ActorRegistry::lookup_actor` helper used by the Kick receiver, checks the
actor's `+0x7d` run-event readiness through `FUN_00cc72a0`, and only then sets
`actor[+0x5c] = 1`.

Effective lifecycle:

```text
ActorBase ctor zeros +0x5c
some upstream bind/readiness code sets +0x7d
FUN_00766f00 sees +0x7d == 1
FUN_00766f00 sets +0x5c = 1
KickEvent can now pass the receiver gate
```

So a Toto-Rak KickEvent probe can still fail even if the director actor exists:
the actor may not yet be run-event ready, meaning `+0x7d` is false and the
per-frame writer has not raised `+0x5c`.

The current decomp says `+0x7d` is probably not on `ActorBase` directly. The
read goes through an alias resolver (`FUN_00cd7a30`) and may read a per-actor
event-context object at `actor[+4]`. The direct `+0x7d` writer is still not
fully identified, though a tiny generic setter `FUN_0043b530` exists.

Probe implication: the server-side log should distinguish three states when a
Toto-Rak director kick is attempted:

```text
director was spawned/sent
director returned EventStart
director accepted RunEventFunction/delegateEvent after EventStart
```

If KickEvent is sent immediately after packet queueing, it may race the
client's async spawn pipeline. Meteor-decomp's spawn-ring note says server-pushed
spawns are drained at about two actor slots per tick, actor allocation runs
`_onInit`, and the client ACKs spawn-state later. Waiting one arbitrary second
may hide this sometimes, but it is not the same as waiting for the director to
be event-ready.

### Toto-Rak Text Load Is Currently Empty

Current `Data/scripts/directors/Instance/Totorak.lua` has:

```lua
local function sendInstanceUi(player)
    player:RunEventFunction("_setInstanceRaid", true);
    player:RunEventFunction("_loadTextDataPermanently");
end
```

Earlier notes assumed the script was passing categories like `item`,
`gilshop`, `instanceContent`, `raidTotorak`, and `raidCommon`, but the checked-in
file now calls `_loadTextDataPermanently` with no arguments.

Hamlet Defense also calls `_loadTextDataPermanently` with no args, so no-arg
loading is not automatically wrong. But for Toto-Rak cutscene debugging it is
another thing to pin:

- If entry cutscene strings, raid UI strings, or cutscene preload state depend
  on `raidTotorak` / `raidCommon`, the current call may be too sparse.
- If the client treats no-arg `_loadTextDataPermanently` as "load default
  permanent text for this director", then it is fine and the real failure stays
  with event readiness/notice start.

Probe: once EventStart is proven, compare `0x012E EventUpdate` responses for
`_loadTextDataPermanently` no-arg versus explicit category args. Do not conflate
this with the missing EventStart gate; text load cannot explain a total lack of
director `EventStart`.

### Stronger Toto-Rak Experiment Order

1. Spawn/init the content director and log the exact packet order, including
   `0x016B`, `0x00CC`, `/_init`, and any `0x0136` sends.
2. After `ActorInstantiate` and `/_init`, re-send director notice conditions and
   notice `SetEventStatus`.
3. Wait for a client-visible readiness signal if available. If not, use a small
   delayed probe, but log the delay explicitly.
4. Send `Player.KickEvent(director, "noticeEvent", ...)` with event type `5`.
5. If `0x012D EventStart` arrives, run the Toto-Rak director `onEventStarted`
   path and then compare no-arg versus explicit `_loadTextDataPermanently`.
6. If no `EventStart` arrives, the next decomp target is still the `+0x7d`
   readiness writer / actor event-context binding, not cutscene playback.

### Focused Client LPB Batch Decoded

The installed 1.x client script tree uses a simple reversible filename cipher:

```text
a b c d e f g h i j -> 9 8 7 6 5 4 3 2 1 0
k l m n o p q r s t -> z y x w v u t s r q
u v w x y z           -> p o n m l k
0 1 2 3 4 5 6 7 8 9 -> j i h g f e d c b a
```

The LPB payload wrapper is also simple for the decoded files checked here:
strip the 13-byte `rle...` header, then XOR each remaining byte with `0x73`.
The resulting Lua 5.1 bytecode decompiles with the existing
`unluac_2015_06_13.jar`.

New focused outputs were written under:

```text
tools/outputs/lpb/focused
```

The high-value decoded client classes are:

```text
area/privatearea/privateareabaseclass
area/privatearea/content/privateareacontentbaseclass
area/privatearea/content/privateareamastersimplecontent
area/privatearea/content/privateareamasterbattlefield
area/privatearea/content/privateareamasterrestrictarea
area/privatearea/occupancy/privateareaoccupancybaseclass
area/privatearea/occupancy/raiddungeonsimple
director/directorbaseclass
director/occupancy/occupancydirectorbaseclass
director/occupancy/raidfst0dungeon03
director/occupancy/raidroc0dungeon01
widget/desktopwidget
widget/desktopwidget_connector
widget/raiddungeonexecutionwidget
chara/npc/npcbaseclass
chara/npc/npcbaseclass_event
chara/npc/object/instanceraidexit
chara/npc/object/raiddungeonexit
chara/npc/object/raiddungeonbarrier
chara/npc/object/raiddungeonwarp
chara/npc/object/raiddungeonposter
chara/npc/object/raiddungeonlight
chara/npc/object/raiddungeonheadcount
chara/npc/object/raiddungeontreasurebox
chara/npc/populace/instanceraidguide/instanceraidguide
chara/npc/populace/instanceraidguide/instanceraidguidebaseclass
chara/npc/populace/instanceraidguide/noquestguidebaseclass
judge/instanceraidguidejudge
```

Some base-class output has `unluac` damage around structured control flow
(`do break`, early `do return`). Treat those fragments carefully. The stable
evidence is the class names, work layouts, method names, and surviving
call sites.

### Raid Dungeon Widget Call Is Now Concrete

`DesktopWidget_connector.openRaidDungeonExecutionWidget` ignores its first
argument:

```lua
openWidgetYield(15, "RaidDungeonExecutionWidget",
                nil, nil, true, contentID, finishTime)
```

`closeRaidDungeonExecutionWidget` closes widget slots `15` and `16`:

```lua
closeWidget(15, nil)
closeWidget(16, nil)
```

`RaidDungeonExecutionWidget.init(contentID, finishTime)` does exactly two
things:

```lua
setContents(contentID)
setTimer(finishTime)
```

`setContents` sets `TextBlock_ContentsName` from text sheet/key group `10051`
using the content id. `setTimer` computes:

```text
remainingSeconds = finishTime - worldMaster:_getServerTime()
```

and writes the timer custom-control properties. It sets warning thresholds
`300` and `120`.

Implication: old two-number calls such as:

```lua
desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
desktopWidget:openRaidDungeonExecutionWidget(4102, 2, finishTime)
```

only feed `1` or `2` to the actual raid HUD. The first number is ignored by
this Lua wrapper. For Toto-Rak, local `WorldManager.GetTotorakRaidDungeonId()`
returning `1` is consistent with the content-name id expected by the widget.

### Occupancy Raid Directors Use A Different Cutscene Wrapper

The older occupancy raid directors are not `InstanceRaidBaseClass` subclasses.
They inherit `OccupancyDirectorBaseClass`, which is currently only:

```lua
require("/Director/DirectorBaseClass")
_defineBaseClass("OccupancyDirectorBaseClass", "DirectorBaseClass")
```

The two recovered occupancy raid directors use the same shape:

```text
RaidFst0Dungeon03.eventNoticeCutScene(player, cutsceneName, arg, finishTime)
RaidRoc0Dungeon01.eventNoticeCutScene(player, cutsceneName, arg, finishTime)
```

Flow:

```text
fade out unless this is the opening cutscene
close raid widget for specific late cutscenes
createCutScene(cutsceneName, director):startCutScene(1, 61, 1, 0, arg)
delete cutscene actor
fade in
open raid dungeon widget
processUpdateGeneralNotificationDialog(3, nil, nil, 1)
```

Specific constants recovered:

| Class | Opening cutscene | Close-widget cutscenes | Widget content id |
|---|---|---|---:|
| `RaidFst0Dungeon03` | `rad0f300` | `rad0f306`, `rad0f307`, `rad0f308` | `1` |
| `RaidRoc0Dungeon01` | `rad0r100` | `rad0r106` | `2` |

Their `relogin(player, finishTime, clearFlag)` path calls:

```lua
player:_fadeInNowLoadingForNoticeEventJustInArea()
if clearFlag == false then
    desktopWidget:openRaidDungeonExecutionWidget(..., contentID, finishTime)
end
```

This gives two useful retail patterns:

- `InstanceRaidBaseClass.startEvent(...)` is the modern generic instance-raid
  wrapper.
- `OccupancyDirectorBaseClass` raids can instead use `eventNoticeCutScene(...)`
  and manually reopen the raid widget after the cutscene.

Toto-Rak has no decoded `InstanceRaidTotorak` or `Raid...Totorak` class in the
client script path list so far, so the best current guess remains: use generic
`InstanceRaidBaseClass` first, then test whether a simple subclass wrapper is
needed because the base class is declared with `_defineBaseClass`.

### Guide And Object Event Scripts

The recovered guide base proves `askEnterInstanceRaid` is Lua-side, not a
native executable literal:

```lua
desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true,
                              52045, {52046, 52047}, raidId)
```

It returns true only when the first choice is selected. `InstanceRaidExit` uses
the same event-mode family for the exit prompt:

```lua
desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true,
                              52042, {52043, 52044}, arg)
```

The decoded in-dungeon object scripts are normal event/text/widget prompts, not
additional raid HUD openers:

| Script | Stable recovered behavior |
|---|---|
| `RaidDungeonExit` | Loads `raidDungeonExit` text group `6736`; branches into `askExtendWidget` variants `1`, `4`, and `7`. |
| `RaidDungeonBarrier` | Loads `raidDungeonBarrier` `6829`; talk text `5`; yes/no uses `askExtendWidget(..., 2, 2, 1, 1)`. |
| `RaidDungeonWarp` | Loads `raidDungeonWarp` `6781`; active warp scheduler `67493888`; yes/no uses `askExtendWidget(..., 2, 2, 1, 2)`. |
| `RaidDungeonLight` | Loads `raidDungeonLight` `6813`; hides the talkable map marker; yes/no uses `askExtendWidget(..., 1, 2, 1, 1)`. |
| `RaidDungeonPoster` | Loads `raidDungeonPoster` `6753`; routes poster ids `1..10` to local/world say rows. |
| `RaidDungeonTreasureBox` | Drop-table and loot-add logic with `mapMarkerVisible`; no execution-widget path. |

### Private Area Client Classes Are Thin Shells

The private-area classes used by local content creation are nearly empty:

```text
PrivateAreaContentBaseClass -> PrivateAreaBaseClass
PrivateAreaMasterSimpleContent -> PrivateAreaContentBaseClass
PrivateAreaMasterBattleField -> PrivateAreaContentBaseClass
PrivateAreaMasterRestrictArea -> PrivateAreaContentBaseClass
RaidDungeonSimple -> PrivateAreaOccupancyBaseClass
```

`PrivateAreaBaseClass._onInit` calls the superclass, defines
`privateAreaWork`, then calls:

```lua
init(self:_getZoneName())
```

So the content-area master class is not where the raid entry HUD/cutscene flow
lives. The content director event remains the important missing piece.

### DirectorBaseClass Confirms Director Work Shape

The recovered `DirectorBaseClass._onInit(directorId, ...)` sets:

```text
directorWork._temp:
  directorId i32
  _assignForChild 240

directorWork._sync:
  contentCommand i32
  contentCommandSub i32
  syncBuffer[128] bool
  _assignForChild 64

directorWork._tag:
  contentCommand -> contentCommand, contentCommandSub, syncBuffer
```

It stores the server-provided director id and then calls subclass `init(...)`.
`DirectorBaseClass.delegateEvent` has the same shape reported by the prior
NPC-delegate notes: it invokes the target actor function with:

```text
target:_callFunction(functionName, player, owner, ...)
```

`_onEventCancel` closes all content widgets owned by the director and resets
fade for `noticeEvent`.

This supports the server-side owner-context concern: `delegateEvent` is not a
free global cutscene call. It is meant to run inside an active event context
whose owner/name/type match the director notice event.

### Raid Object Scripts Recover Text Groups And Prompts

Recovered object scripts:

| Client class | Text load / behavior |
|---|---|
| `RaidDungeonExit` | `_loadTextDataPermanently(6736, "raidDungeonExit")`; `askYesNo(...)` uses `askExtendWidget` |
| `InstanceRaidExit` | `_setGroundOn(false)`; `askExit(arg)` uses `desktopWidget:askForEventMode(..., 52042, {52043, 52044}, arg)` |
| `RaidDungeonBarrier` | `_setGroundOn(false)`, `_loadTextDataPermanently(6829, "raidDungeonBarrier")`, `eventTalkRead` says message `5`, `askYesNo()` asks choices from base `2` |
| `RaidDungeonWarp` | `_loadTextDataPermanently(6781, "raidDungeonWarp")`, `activateWarpDevice` runs scheduler `67493888`, `askYesNo(true)` asks base `2`, otherwise says message `1` |
| `RaidDungeonPoster` | `_setGroundOn(false)`, `_loadTextDataPermanently(6753, "raidDungeonPoster")`, local messages `1..7`, world messages `14..16` |
| `RaidDungeonLight` | `_setGroundOn(false)`, `_loadTextDataPermanently(6813, "raidDungeonLight")`, hidden map marker, `askYesNo()` asks base `1` |
| `RaidDungeonHeadCount` | empty `initForEvent` |
| `RaidDungeonTreasureBox` | drop-table client helper plus temp `mapMarkerVisible` work |

`NpcBaseClass_event.askExtendWidget(...)` is just a wrapper over
`desktopWidget:askForEventMode(...)`. Therefore these object scripts mostly
drive local prompts/text/schedulers; the actual exit, warp, barrier, and loot
side effects still need the server to interpret the event result.

### Entry Guide Prompt Is Confirmed

`InstanceRaidGuideBaseClass.askEnterInstanceRaid(raidId)` is now recovered:

```lua
local choices = {52046, 52047}
if desktopWidget:askForEventMode(nil, nil, worldMaster,
        1, false, true, 52045, choices, raidId) == 1 then
    return true
end
return false
```

This confirms the local `Data/scripts/totorak_entry.lua` call shape:

```lua
callClientFunction(player, "askEnterInstanceRaid", raidId)
```

The entry prompt only asks the player whether to enter. It does not create the
content area, bind the content director, open the raid HUD, or run the entry
cutscene. Those still happen after the server receives the prompt result and
starts the content flow.

### Updated Toto-Rak Hypothesis After Focused Decode

The strongest implementation hypothesis is now:

```text
1. Local private content area creation is plausible.
2. Local content director class binding is probably too weak:
   Totorak.lua returns /Director/OpeningDirector, whose decoded class is empty.
3. The retail raid HUD/cutscene flow is director-driven, not area-master-driven.
4. The raid HUD opens through DesktopWidget slot 15 only after a director event
   function such as startEvent/reloginEvent/eventNoticeCutScene runs.
5. Current Toto-Rak code runs _setInstanceRaid and _loadTextDataPermanently only
   inside onEventStarted, so no director EventStart means none of that can
   happen.
```

Next concrete probe:

```text
Bind Toto-Rak to a real raid director class path.
Spawn/init the director.
Send director SetEventStatus/notice state after init.
Kick noticeEvent with event type 5.
Wait for EventStart.
Run startEvent("none", nil/director, true, 1, startUnix, finishUnix, eventType).
Verify RaidDungeonExecutionWidget slot 15 opens with content id 1.
```

If direct binding to `/Director/InstanceRaid/InstanceRaidBaseClass` fails
because it is a base class, create/test the smallest possible client-visible
subclass path that only inherits `InstanceRaidBaseClass`. There is still no
client-shipped `InstanceRaidTotorak` name in the decoded script tree.

### Deeper Instance/Cutscene LPB Batch

Decoded another focused client-script batch into:

```text
tools/outputs/lpb/deeper/
tools/outputs/lpb/extra_instance_cutscene/
```

The second batch added 28 clean decompiles: private-area content/occupancy
classes, generic instance-raid guide variants, cutscene replay widgets, quest
cutscene base wrappers, and nearby debug/test cutscene scripts. The useful
result is not just more code, but a sharper split between three flows:

```text
1. Area/native instance-raid state.
2. Director-driven raid runtime/HUD/cutscene events.
3. Quest/replay cutscene helpers.
```

### AreaBaseClass Owns Native Instance-Raid State

`AreaBaseClass` now proves that `isInstanceRaid` is an area constructor/init
property, not something owned by the raid director:

```lua
function AreaBaseClass.isInstanceRaid(self)
  return self.areaWork.isInstanceRaid
end

function AreaBaseClass._onInit(self, arg1, isInstanceRaid, isEntranceDesion)
  ...
  self.areaWork.isInstanceRaid = isInstanceRaid
  self.areaWork.isEntranceDesion = isEntranceDesion
  self:_setInstanceRaid(isInstanceRaid)
  ...
end
```

The user-side bridge confirms `_setInstanceRaid` goes native:

```text
AreaBaseClass._setInstanceRaid_inl -> _setInstanceRaid_cpp
```

Decoded refs:

```text
tools/outputs/lpb/deeper/area/areabaseclass.lua:44
tools/outputs/lpb/deeper/area/areabaseclass.lua:170
tools/outputs/lpb/deeper/area/areabaseclass.lua:182
tools/outputs/lpb/deeper/area/areabaseclass.lua:184
tools/outputs/lpb/deeper/area/areabaseclass_u.lua:61
```

Implication for Toto-Rak: setting `_setInstanceRaid` only inside a later
director/client event is probably too late to reproduce retail area setup. The
retail area actor receives the instance flag during `_onInit`, stores it in
`areaWork`, and immediately mirrors it to native code.

### Private-Area Content Classes Are Still Shells

The newly decoded private-area content and occupancy scripts are almost pure
inheritance:

```text
PrivateAreaContentBaseClass -> PrivateAreaBaseClass
PrivateAreaMasterBattleField -> PrivateAreaContentBaseClass
PrivateAreaMasterRestrictArea -> PrivateAreaContentBaseClass
PrivateAreaMasterSimpleContent -> PrivateAreaContentBaseClass
PrivateAreaOccupancyBaseClass -> PrivateAreaBaseClass
RaidDungeonSimple -> PrivateAreaOccupancyBaseClass
```

`PrivateAreaBaseClass._onInit` only calls the area superclass, creates
`privateAreaWork`, then runs `init(self:_getZoneName())`.

This keeps pointing away from private-area Lua as the missing Toto-Rak behavior.
Area creation must pass the right init flag, but the runtime raid HUD/cutscene
flow is not implemented in these private-area classes.

### CutScene Actor Lifecycle Is Now Concrete

`WorldMaster.createCutScene` creates a normal script actor:

```lua
return _createActor(nil, "CutScene", false, cutsceneName, owner)
```

`CutScene._onInit(cutsceneName, owner)` stores the owner as `work.textOwner`,
sets the filename, and creates an `actorclass` sheet helper. The common cutscene
wrapper then drives playback:

```text
CutScene.startCutScene(playOrReplay, desktopWidgetMode, cutsceneMode, ...)
  myPlayer:_fadeInNowLoadingForNoticeEventJustInArea()
  self:_loadCutScene()
  desktopWidget:getStaticWidget(14):display(false)
  desktopWidget:orderDesktopWidgetMode(desktopWidgetMode)   when appropriate
  desktopWidget:showCutSceneSkip(self)                      for skippable play
  self:_play(...)                                           when playOrReplay == 1
  self:_replay(...)                                         otherwise
  desktopWidget:hideCutSceneSkip(self)
  desktopWidget:cancelDesktopWidgetMode(desktopWidgetMode)  on successful play
  myPlayer:_waitForMapLoaded(nil)                           except mode 64
```

The native bridges visible from the decoded scripts line up with this:

```text
CutScene._play_inl   -> _play_cpp
CutScene._replay_inl -> _replay_cpp
CutScene._skip_inl   -> _skip_cpp
PlayerBaseClass._fadeInNowLoadingForNoticeEventJustInArea_inl
  -> _fadeInNowLoadingForNoticeEventJustInArea_cpp
```

Decoded refs:

```text
tools/outputs/lpb/deeper/world/worldmaster.lua:61
tools/outputs/lpb/deeper/gamedata/cutscene.lua:2
tools/outputs/lpb/deeper/gamedata/cutscene_common.lua:737
tools/outputs/lpb/deeper/gamedata/cutscene_common.lua:912
tools/outputs/lpb/deeper/chara/player/playerbaseclass_u.lua:278
```

This explains the earlier instance calls:

```lua
worldMaster:createCutScene(name, owner):startCutScene(1, 61, mode, ...)
worldMaster:createCutScene(name, owner):startCutScene(1, 63, mode, ...)
```

The second numeric argument is the desktop widget mode. `61` is the common NQ
event mode; `62` is used by HQ quest cutscenes; `63` appears in the recovered
instance-raid base path.

### Quest/Replay Cutscene Wrappers Are Separate From Raid Entry

`QuestBaseClass_common` wraps the same `CutScene` actor API:

```lua
startNQCutScene(name, mode, ...)
  worldMaster:createCutScene(name, self):startCutScene(1, 61, mode, ...)

startHQCutScene(name, mode, ...)
  worldMaster:createCutScene(name, self):startCutScene(1, 62, mode, ...)

replayNQCutScene(name, mode, ...)
  worldMaster:_getPendingCutSceneActor():startCutScene(2, 61, mode, ...)
```

The replay NPC path is also recovered:

```text
ReplayCutsceneSelectWidget:
  scans cutReplaySheet keys questId*100+1 through questId*100+30
  stores selected list property "cutsceneId"

PopulaceCutScenePlayer:
  opens ReplayCutsceneSelectWidget
  resolves _getQuestActorForCutSceneReplay(questId)
  pulls getCutSceneReplayData(...)
  calls startNQ/HQ/Snpc cutscene wrappers
```

Decoded refs:

```text
tools/outputs/lpb/extra_instance_cutscene/quest/questbaseclass_common.lua:21
tools/outputs/lpb/extra_instance_cutscene/quest/questbaseclass_common.lua:40
tools/outputs/lpb/extra_instance_cutscene/quest/questbaseclass.lua:91
tools/outputs/lpb/extra_instance_cutscene/widget/ask/replaycutsceneselectwidget.lua:3
tools/outputs/lpb/deeper/chara/npc/populace/populacecutsceneplayer.lua:123
```

So quest replay cutscenes and instance entry cutscenes share the same low-level
`CutScene` actor, but not the same owner/source flow. Replay uses quest actors
and `cutReplaySheet`; instance entry uses the raid/content director event.

### Instance And Content Ask Helpers

Two independent ask families are now visible:

```text
InstanceRaidGuideBaseClass.askEnterInstanceRaid(raidId)
  prompt 52045, choices 52046/52047, passes raidId

QuestBaseClass_common.instanceAreaJoinAskInBasaClass(...)
  ask(worldMaster, 34112, 2)

QuestBaseClass_common.contentsJoinAskInBasaClass(...)
  ask(worldMaster, 25015, 2, questId)
```

`NoQuestGuideBaseClass.askExplainInstanceRaid` builds the explanation menu with
`desktopWidget:askForEventMode(...)` and delegates menu handling to
`createExplainSelection_` / `processExplainSelected_`. The generic
`InstanceRaidGuide`, `HasQuestGuideBaseClass`, and `InstanceRaidGuideJudge`
decode as shells.

Decoded refs:

```text
tools/outputs/lpb/extra_instance_cutscene/chara/npc/populace/instanceraidguide/noquestguidebaseclass.lua:3
tools/outputs/lpb/extra_instance_cutscene/quest/questbaseclass_common.lua:280
tools/outputs/lpb/extra_instance_cutscene/quest/questbaseclass_common.lua:290
```

This matters because the entry prompt only asks. It does not create/bind the
raid director and does not open `RaidDungeonExecutionWidget`.

### Player-Side Instance-Raid Behavior

`PlayerBaseClass.isEventPlaying` includes `noticeEvent`, matching the event
receiver work:

```lua
return ... or self:_isEventPlaying("noticeEvent")
```

The player touch flow also changes inside an instance raid:

```text
On normal command updates:
  command 22004 touch prompt is allowed only when
  currentAreaMaster:isInstanceRaid() == false

On touch event:
  if currentAreaMaster:isInstanceRaid() and touch type == 5:
    static actor 24301 is used
    command variation 30004 is executed with state 1/2
```

Decoded refs:

```text
tools/outputs/lpb/deeper/chara/player/playerbaseclass.lua:31
tools/outputs/lpb/deeper/chara/player/playerbaseclass.lua:619
tools/outputs/lpb/deeper/chara/player/playerbaseclass.lua:658
```

This is a strong client-side sign that the `areaWork.isInstanceRaid` flag is not
cosmetic. It changes player command behavior and probably needs to be correct
before dungeon objects are interacted with.

### Native Workspace Cross-Check

The IDA string dump in `C:\Users\drime\source\repos\AuroraFlare\ida free`
contains the native names used by the decoded Lua:

```text
Window_RaidDungeonExecutionWidget
_setInstanceRaid
_fadeInNowLoadingForNoticeEventJustInArea
_loadCutScene
_getPendingCutSceneActor
_getQuestActorForCutSceneReplay
_getOccupancyGroup
```

Representative refs:

```text
C:\Users\drime\source\repos\AuroraFlare\ida free\string values.txt:7404
C:\Users\drime\source\repos\AuroraFlare\ida free\string values.txt:8652
C:\Users\drime\source\repos\AuroraFlare\ida free\string values.txt:8700
C:\Users\drime\source\repos\AuroraFlare\ida free\string values.txt:8745
C:\Users\drime\source\repos\AuroraFlare\ida free\string values.txt:8975
C:\Users\drime\source\repos\AuroraFlare\ida free\string values.txt:8984
C:\Users\drime\source\repos\AuroraFlare\ida free\string values.txt:9009
```

The meteor-decomp workspace also already tracks the same concepts in its
symbol/doc inventory, including `AreaMaster_registerLua_setInstanceRaid`,
`PlayerBase_registerLua_fadeInNowLoadingForNoticeEventJustInArea`,
cutscene replay player bindings, occupancy group bindings, and the
notice-event receiver gate notes.

### Updated Implementation Read

The most likely Toto-Rak gap is now two-part:

```text
1. Area creation/init needs to pass the retail instance-raid flag early enough
   for AreaBaseClass._onInit to set areaWork.isInstanceRaid and call
   _setInstanceRaid_cpp.

2. The content/raid director still needs a real noticeEvent lifecycle. The
   retail HUD/cutscene flow is driven by a director event wrapper such as
   InstanceRaidBaseClass.startEvent(...) or occupancy eventNoticeCutScene(...),
   not by PrivateArea Lua or the entry guide prompt.
```

Concrete next probe:

```text
Create/log Toto-Rak private area with the area init instance flag set.
Verify currentAreaMaster:isInstanceRaid() is true immediately after zone-in.
Verify player touch type 5 goes through static actor 24301 / command 30004.
Bind a real raid/content director, not /Director/OpeningDirector.
Send SetEventStatus/SetNoticeEventCondition after director script bind.
Kick noticeEvent with event type 5.
Run the director startEvent path and check:
  - _fadeInNowLoadingForNoticeEventJustInArea runs
  - CutScene.startCutScene gets the retail cutscene name or "none"
  - RaidDungeonExecutionWidget opens in slot 15 with raidDungeon id 1
  - a matching EndEvent closes the synthetic noticeEvent
```

This also explains why manually opening only the area or only the guide prompt
can look "almost there" but still miss the retail instance behavior: the area
flag, event owner, director event, cutscene actor, and raid HUD are separate
pieces that retail stitches together in order.

### Broad Raid Keyword Batch

Decoded every client script whose logical path contains one of:

```text
raid
dungeon
occupancy
privatearea
instanceraid
```

Output:

```text
tools/outputs/lpb/raid_keyword_all/
```

All 116 files decompiled cleanly. This surfaced the missing client-shipped
director family:

```text
director/instanceraid/*
director/occupancy/*
director/publicraid/*
director/raidgimmick/*
```

### Toto-Rak Has A Shipped Occupancy Director

The most important new finding: Toto-Rak does have a concrete shipped client
director, but it is not named `InstanceRaidTotorak`.

```text
/Director/Occupancy/RaidFst0Dungeon03
```

Decoded class:

```lua
require("/Director/Occupancy/OccupancyDirectorBaseClass")
_defineClass("RaidFst0Dungeon03", "OccupancyDirectorBaseClass")
```

Key behavior:

```lua
function RaidFst0Dungeon03.eventNoticeCutScene(self, player, cutsceneName, arg, finishTime)
  local fade = 1
  if cutsceneName == "rad0f300" then
    -- no pre-fade branch
  else
    player:_fadeOut(fade)
    if cutsceneName == "rad0f306"
        or cutsceneName == "rad0f307"
        or cutsceneName == "rad0f308" then
      desktopWidget:closeRaidDungeonExecutionWidget()
    end
    player:_waitForFading()
  end

  worldMaster:createCutScene(cutsceneName, self):startCutScene(1, 61, 1, 0, arg)
  worldMaster:createCutScene(cutsceneName, self):_delete()
  player:_fadeIn(fade)
  desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
end
```

Relogin behavior:

```lua
function RaidFst0Dungeon03.relogin(self, player, finishTime, clearFlag)
  player:_fadeInNowLoadingForNoticeEventJustInArea()
  if clearFlag == false then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, finishTime)
  end
end
```

Widget finalization:

```lua
processUIFinalize() -> desktopWidget:closeRaidDungeonExecutionWidget()
widgetSetOff()      -> desktopWidget:closeRaidDungeonExecutionWidget()
```

Decoded refs:

```text
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidfst0dungeon03.lua:1
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidfst0dungeon03.lua:9
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidfst0dungeon03.lua:20
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidfst0dungeon03.lua:24
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidfst0dungeon03.lua:28
```

Dzemael has the same shape:

```text
/Director/Occupancy/RaidRoc0Dungeon01
cutscene open: rad0r100
widget-close cutscene: rad0r106
openRaidDungeonExecutionWidget(4102, 2, finishTime)
```

Decoded refs:

```text
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidroc0dungeon01.lua:9
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidroc0dungeon01.lua:20
tools/outputs/lpb/raid_keyword_all/director/occupancy/raidroc0dungeon01.lua:24
```

Because `DesktopWidget_connector.openRaidDungeonExecutionWidget(...)` ignores
the first explicit argument and passes only the second/third arguments into
`RaidDungeonExecutionWidget`, the effective Toto-Rak HUD payload is:

```text
contentID = 1
finishTime = finishTime
```

The `2123` argument is still a useful retail constant, but it is not what the
execution widget consumes.

### InstanceRaid Subclasses Are Mostly Empty

The client also ships these instance-raid director classes:

```text
InstanceRaidAurumVale
InstanceRaidBeaconBattle
InstanceRaidCuttersCry
InstanceRaidDarkMoogle
InstanceRaidHamletDefense
InstanceRaidHyperIfrit
InstanceRaidLesserGaruda
InstanceRaidLesserIfrit
InstanceRaidLesserWhiteGeneral
InstanceRaidNormalGaruda
InstanceRaidNormalIfrit
InstanceRaidNormalWhiteGeneral
```

Most are two-line shells over `InstanceRaidBaseClass`. The non-empty overrides:

```text
InstanceRaidLesserIfrit.processStartEvent(...)
  executeCutScene("GC010105", owner, true, 0, arg)

InstanceRaidLesserWhiteGeneral.processStartEvent(...)
  executeCutScene("gc010715", owner, true)

InstanceRaidLesserWhiteGeneral.processCutSceneEvent(...)
  fade out, set weather, execute cutscene, fade in

InstanceRaidHamletDefense
  replaces the raid HUD with HamletExecutionWidget
  loads text group 10208 "InstanceRaidHamletDefense"
  maps content ids 8/9/10 to hamlet ids 1/2/3
  uses public effect widgets 14/15/16 for start and 20 for failure
```

Decoded refs:

```text
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidlesserifrit.lua:3
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidlesserwhitegeneral.lua:3
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidhamletdefense.lua:46
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidhamletdefense.lua:84
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidhamletdefense.lua:123
```

This changes the earlier "create a tiny Toto-Rak subclass" idea. A tiny
subclass is plausible for newer raids, but Toto-Rak already has the occupancy
director name the retail client expects:

```text
/Director/Occupancy/RaidFst0Dungeon03
```

### InstanceRaidBaseClass Packet And Timer Details

The broad decode reconfirmed the full shared instance-raid base with line refs:

```text
init:
  instanceRaidWork.startTime
  instanceRaidWork.finishTime
  instanceRaidWork.contentID
  instanceRaidWork.eventType
  instanceRaidWork.countdownStatus
  instanceRaidWork.clearFlag
  instanceRaidWork.initFlag

startEvent(cutsceneName, cutsceneOwner, cutsceneModeFlag,
           contentID, startTime, finishTime, eventType, ...)

reloginEvent(contentID, startTime, finishTime, eventType, clearFlag)

clearEvent()
failedEvent(reason)
exitCutScene(cutsceneName, owner, modeFlag)
cutSceneEvent(cutsceneName, ...)
```

`executeCutScene(...)` is:

```lua
local mode = 1
if cutsceneModeFlag == false then
  mode = 2
end
if owner == nil then
  owner = self
end
worldMaster:createCutScene(cutsceneName, owner):startCutScene(1, 63, mode, ...)
```

`_onReceiveDataPacket` only acts after `initFlag`:

```text
packet type 1:
  clearFlag = true
  setCountDownTimer(startTime, finishTime, false)
  closeInformationWidget()

packet type 2:
  clearFlag = true
  countdownStatus = 0
  closeInformationWidget()

packet type 3:
  processUserMessage(...)
```

Timer notifications:

```text
52092 at half time
52009 at remaining 1/3/5/10/20/30 minutes
52021 on clear
52065/52054/52010/52093 on failure reasons 1..4
```

Decoded refs:

```text
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:4
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:35
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:127
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:148
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:166
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:172
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:200
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:208
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:215
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:262
tools/outputs/lpb/raid_keyword_all/director/instanceraid/instanceraidbaseclass.lua:287
```

### Raid Monsters And Gimmicks Are Not The Missing Flow

The raid monster scripts from the broad batch are almost all two-line class
wrappers over their monster base class. Example pattern:

```lua
require("/Chara/Npc/Monster/Slug/SlugBaseClass")
_defineClass("SlugNormalRaidR0D4", "SlugBaseClass")
```

The only non-trivial monster in this keyword batch is:

```lua
IfritHyperAid.isMapMarkerVisibleForTalkable() -> false
```

The `director/raidgimmick/*` scripts are also inheritance shells. So the missing
Toto-Rak startup/HUD/cutscene behavior is not hiding in raid monster or gimmick
Lua.

### Updated Toto-Rak Target After Broad Decode

The highest-value Toto-Rak experiment is now:

```text
1. Bind the content director as /Director/Occupancy/RaidFst0Dungeon03.
2. Ensure area init marks the area as instance raid before player/object touch.
3. Start a noticeEvent owned by that director.
4. Call eventNoticeCutScene(player, "rad0f300", arg, finishTime) for opening.
5. Confirm RaidDungeonExecutionWidget opens with content id 1.
6. For later/ending beats, test rad0f306/rad0f307/rad0f308 and verify the
   widget closes before the cutscene and reopens after playback.
7. On relogin, call relogin(player, finishTime, clearFlag).
```

This supersedes the older `/Director/OpeningDirector` path. `OpeningDirector`
is still empty, and the retail client already supplies the Toto-Rak occupancy
director with exact cutscene names and widget timing.

### Event Widget Dependency Pass

Decoded an additional event/widget dependency batch under:

```text
tools/outputs/lpb/event_widget_deps/
```

This batch closes the meaning of the post-cutscene notification call used by
both recovered occupancy directors:

```lua
desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
```

`DesktopWidget_connector.processUpdateGeneralNotificationDialog` dispatches by
type:

```text
type 1 -> openCautionInformDialogWidget(...)
type 2 -> openTutorialSuccessWidget(...)
type 3 -> openPublicEffectWidget(effectId)
type 4 -> openTutorialWidget(...)
type 5 -> closeTutorialWidget()
type 7 -> close/cancel tutorial mode when active
type 8 -> closeRaidDungeonExecutionWidget()
type 9 -> orderTutorialMode() + setTutorialMask(...)
```

So the raid occupancy call is not a text dialog. It opens public splash effect
`1`, which maps to `RaidDungeonStartWidget`.

`openPublicEffectWidget(id)` opens widget slot 13 as `SplashEffectWidget`:

```text
1  -> RaidDungeonStartWidget
2  -> RaidDungeonSuccessWidget2
3  -> RaidDungeonFailureWidget
4  -> GrandCompanyRecruitWidget1, resource/style 2130706533
5  -> GrandCompanyRecruitWidget2, resource/style 2130706533
6  -> GrandCompanyRecruitWidget3, resource/style 2130706533
13 -> DutyAbandonedWidget
14 -> DutyCommencedWidget1
15 -> DutyCommencedWidget2
16 -> DutyCommencedWidget3
17 -> DutyCompleteWidget1
18 -> DutyCompleteWidget2
19 -> DutyCompleteWidget3
20 -> DutyFailedWidget
```

`openCutSceneEffectWidget(id)` is a separate slot-14 path, also via
`SplashEffectWidget`:

```text
1,2,7,8 -> RaidDungeonTitleWidget1/2/3/4
3       -> RaidDungeonSuccessWidget, resource/style 2130706534
4,5,6   -> LocationTitleWidget1/2/3
9,10,11 -> DutyCompleteWidget4/5/6
12,13,14 -> HamletDefenseTitleWidget1/2/3
15      -> CastrumNovumTitleWidget
```

This matches `CutScene._onShowWidgetClip`: cutscene clip labels such as
`2DEffectLocation1..11`, `2DEffectContentsSuccess`, and
`2DEffectDutySuccess1..3` open those slot-14 effects, while hiding the widget
clip closes them. By contrast, the occupancy director's completion of
`eventNoticeCutScene` opens the public slot-13 raid-start splash.

Static widget setup also matters:

```text
static 12 -> CutSceneSkipWidget
static 13 -> CutSceneSkipWarningWidget
static 14 -> NpcSayWidget
static 16 -> StatusEffectWidget
```

`CutScene.startCutScene` hides static widget 14 before playback, shows static
widget 12 for skippable play mode, and hides it afterward.

### Raid Execution Widget Payload

`DesktopWidget_connector.openRaidDungeonExecutionWidget` ignores the first
explicit argument and passes only content ID plus finish time to widget slot 15:

```lua
function DesktopWidget.openRaidDungeonExecutionWidget(self, unused, contentID, finishTime)
  self:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true,
                       contentID, finishTime)
end
```

`closeRaidDungeonExecutionWidget()` closes slots 15 and 16.

`RaidDungeonExecutionWidget.init(contentID, finishTime)` then does:

```lua
self:setContents(contentID)
self:setTimer(finishTime)
```

`setContents` calls:

```lua
self:setText("TextBlock_ContentsName", 10051, contentID)
```

`docs/Dat Mining/xtx__text_ui.csv` row `10051` resolves to
`xtx/raidDungeon`, so the execution-widget content ID is the
`xtx_raidDungeon.csv` key, not a raw text row.

Relevant `xtx_raidDungeon.csv` IDs:

```text
1  -> the Thousand Maws of Toto-Rak
2  -> Dzemael Darkhold
3  -> the Bowl of Embers (Hard)
4  -> the Bowl of Embers
5  -> Thornmarch
6  -> Aurum Vale
7  -> Cutter's Cry
8  -> the Battle for Aleport
9  -> the Battle for Hyrstmill
10 -> the Battle for the Golden Bazaar
11 -> the Howling Eye (Hard)
12 -> the Howling Eye
13 -> Castrum Novum Transmission Tower
14 -> the Bowl of Embers (Extreme)
15 -> Rivenroad
16 -> Rivenroad (Hard)
```

This lines up with the local server constant:

```text
Map Server/WorldManager.cs:
  private const uint TotorakRaidDungeonId = 1;
  GetTotorakRaidDungeonId() -> 1
```

### Entry And Exit Prompt Path

`InstanceRaidGuideBaseClass.askEnterInstanceRaid(raidId)` is fully Lua-side:

```lua
local choices = {52046, 52047}
if desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true,
                                 52045, choices, raidId) == 1 then
  return true
end
return false
```

`worldMaster.csv` rows:

```text
52045 -> Begin your duty in [xtx/raidDungeon id]?
52046 -> Yes.
52047 -> No.
```

So `askEnterInstanceRaid(1)` is the exact Toto-Rak client prompt path.

The matching exit prompt is `InstanceRaidExit.askExit(raidId)`:

```lua
local choices = {52043, 52044}
if desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true,
                                 52042, choices, raidId) == 1 then
  return true
end
return false
```

`worldMaster.csv` rows:

```text
52042 -> End your duty in [xtx/raidDungeon id]?
52043 -> Yes.
52044 -> No.
```

`Data/scripts/totorak_entry.lua` already calls the recovered client method:

```lua
local raidId = GetWorldManager():GetTotorakRaidDungeonId()
callClientFunction(player, "askEnterInstanceRaid", raidId)
```

### Guide Scripts And Manifest Boundary

The LPB manifest shows only two occupancy guide scripts:

```text
chara/npc/populace/occupancyguide/raidfst0dungeon03guide
chara/npc/populace/occupancyguide/raidroc0dungeon01guide
```

They are structurally identical and load different text groups:

```text
RaidFst0Dungeon03Guide -> text group 6704 "raidFst0Dungeon03Guide"
RaidRoc0Dungeon01Guide -> text group 6720 "raidRoc0Dungeon01Guide"
```

Their `askMainMenu(...)` presents a four-choice extended widget, drives NPC and
worldMaster explanatory text, and returns the selected menu index. Their
`tellErrorMessage(...)` maps server-side denial/error codes to local text rows.

Aurum Vale and Cutter's Cry use the `InstanceRaidGuide` branch instead:

```text
InstanceRaidGuideAurumVale:
  _setGroundOn(false)
  _loadTextDataPermanently(9920, "instanceRaidGuideAurumVale")
  choices {4,5,6,7}
  selection 3 says row 22 and returns true

InstanceRaidGuideCuttersCry:
  _setGroundOn(false)
  _loadTextDataPermanently(9936, "instanceRaidGuideCuttersCry")
  does a salute/rank variant via isUpperRank(3,17)
  choices {4,5,6,7}
  selection 3 says row 19/31 and returns true
```

Important manifest boundary: only these two occupancy notice-cutscene directors
ship in the client script corpus:

```text
director/occupancy/raidfst0dungeon03
director/occupancy/raidroc0dungeon01
```

No `director/occupancy` LPB exists for Aurum Vale or Cutter's Cry in the
manifest. Those dungeons do ship as:

```text
director/instanceraid/instanceraidaurumvale
director/instanceraid/instanceraidcutterscry
```

but both are inheritance shells over `InstanceRaidBaseClass`. That means the
Aurum/Cutter cutscene resources exist, but the client-side occupancy
`eventNoticeCutScene` path appears recovered only for Toto-Rak and Dzemael.

### Cut Replay Resource Expansion

The cutReplay tables now cover four raid-dungeon quest buckets:

```text
11082101-11082109 -> rad0f300..rad0f308 -> Toto-Rak
11082201-11082207 -> rad0r100..rad0r106 -> Dzemael
11082301-11082304 -> rad0r400..rad0r403 -> Aurum Vale
11082401-11082404 -> rad0w500..rad0w503 -> Cutter's Cry
```

`xtx_quest.csv` names the parent quest IDs:

```text
110821 -> the Thousand Maws of Toto-Rak
110822 -> Dzemael Darkhold
110823 -> Aurum Vale
110824 -> Cutter's Cry
```

`xtx_cutReplay.csv` labels all of these entries generically as `Cutscene 1`,
`Cutscene 2`, etc.

Installed client resource check:

```text
rad0f300   74704  PWIB / SEDBRES
rad0f301  237680  PWIB / SEDBRES
rad0f302  222048  PWIB / SEDBRES
rad0f303  274080  PWIB / SEDBRES
rad0f304  237584  PWIB / SEDBRES
rad0f305  316080  PWIB / SEDBRES
rad0f306  310576  PWIB / SEDBRES
rad0f307  305264  PWIB / SEDBRES
rad0f308  310880  PWIB / SEDBRES
rad0r100  186128  PWIB / SEDBRES
rad0r101   21120  PWIB / SEDBRES
rad0r102  241408  PWIB / SEDBRES
rad0r103  241104  PWIB / SEDBRES
rad0r104   87792  PWIB / SEDBRES
rad0r105  529632  PWIB / SEDBRES
rad0r106  566704  PWIB / SEDBRES
rad0r400  312704  PWIB / SEDBRES
rad0r401  233232  PWIB / SEDBRES
rad0r402  820640  PWIB / SEDBRES
rad0r403  566944  PWIB / SEDBRES
rad0w500  250288  PWIB / SEDBRES
rad0w501  344528  PWIB / SEDBRES
rad0w502 1115312  PWIB / SEDBRES
rad0w503  572624  PWIB / SEDBRES
```

All were found under:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\cut\<name>\<name>
```

### Extra LPB Decompile Pass

Decoded 16 more nearby scripts under:

```text
tools/outputs/lpb/instance_cutscene_more/
```

Targets:

```text
area/privatearea/content/privateareacontentbaseclass
area/privatearea/content/privateareamasterbattlefield
area/privatearea/content/privateareamasterrestrictarea
area/privatearea/content/privateareamastersimplecontent
area/privatearea/occupancy/privateareaoccupancybaseclass
area/privatearea/occupancy/raiddungeonsimple
area/privatearea/privateareabaseclass
area/privatearea/privateareabaseclass_u
director/instanceraid/occupancyplayers/occupancyplayersbaseclass
director/instanceraid/occupancyplayers/occupancyplayerstest
director/instanceraid/occupancyplayers/raidplayers
chara/npc/object/treasurebox/instanceraidtreasurebox
status/dotaurumstatus
widget/cutsceneskipwidget
widget/cutsceneskipwarningwidget
widget/ask/contentrewardwidget
```

Findings:

```text
Private-area content/occupancy scripts are mostly inheritance shells.
RaidDungeonSimple is just PrivateAreaOccupancyBaseClass.
InstanceRaidTreasureBox is just a treasure-box inheritance shell.
OccupancyPlayersTest.clientFunc(player) fades in and calls
  _fadeInNowLoadingForNoticeEventJustInArea().
DotAurumStatus survives death removal and can start on dead actors:
  isRemovedFromDeath() -> false
  canStartOnDead() -> true
```

Cutscene skip widgets:

```text
CutSceneSkipWidget.init:
  setConfirmCondition("Button_CutSceneSkip")

Button_CutSceneSkip:
  opens child CommonAskWidget with text IDs 1022, 1023, 1024

processAskResult(1):
  getArgActor():_skip()
  setArgActor(nil)
  hide()

skipDirect:
  sendControlCommand("Button_CutSceneSkip", "UILuaCommands.Operate")

clear:
  closes child CommonAskWidget if present, clears arg actor, hides
```

`CutSceneSkipWarningWidget` sets `TextBlock_WarningText` to text ID `1027`,
sets opacity to `0.7` before show, and hides after animation completion.

`ContentRewardWidget` is generic content reward UI. It consumes methods on the
content actor such as:

```text
getContentRewardButtonText()
getContentRewardMainTitle()
getContentRewardItem(group, row, side)
getGuildleveId() when reward mode is guildleve
```

and returns ask result `1` on confirm or `-1` on cancel. Nothing recovered here
is raid-specific, but it explains the generic reward surface if raid completion
later needs a reward dialog.

### Native/IDA Anchors

IDA string data and `meteor-decomp` symbol maps agree with the Lua-side model:

```text
Window_RaidDungeonExecutionWidget
_setInstanceRaid
_loadCutScene
_skip
_getPlayingCutSceneActor
_getPendingCutSceneActor
_getQuestActorForCutSceneReplay
/GameData/CutScene.prog
/GameData/CutScene
SEDBRES
```

The native cutscene resource layer exposes strings for:

```text
SQEX::CDev::Engine::Cut::CutScenePlayer::CutScenePlayer::MakeCutResourceNodeList
SQEX::CDev::Engine::Cut::CutScenePlayer::CutScenePlayer::RealizeVfxBinary
SQEX::CDev::Engine::Cut::CutScenePlayer::CutScenePlayer::ExistVfxBinary
SQEX::CDev::Engine::Cut::CutScenePlayer::CutScenePlayer::VaporizeVfxBinary
SQEX::CDev::Engine::Cut::CutScenePlayer::CutScenePlayer::RealizeCutBinary
SQEX::CDev::Engine::Cut::CutScenePlayer::CutScenePlayer::ExistCutBinary
SQEX::CDev::Engine::Cut::CutScenePlayer::CutScenePlayer::VaporizeCutBinary
CutSceneResourceNode
```

`meteor-decomp/config/ffxivgame.ffxivdecomp_symbols.json` also has named
cutscene packet/dispatch handlers:

```text
ZoneIn_handler_opcode_7_CutScene_onInitializationClip_Preview
ZoneIn_handler_opcode_8_CutScene_onInitializationClip
ZoneIn_handler_opcode_9_CutScene_onShowUIClip
ZoneIn_handler_opcode_10_CutScene_onHideUIClip
ZoneIn_handler_opcode_11_CutScene_onShowWidgetClip
ZoneIn_handler_opcode_12_CutScene_onHideWidgetClip
ZoneIn_handler_opcode_13_CutScene_onOpenUIClip
ZoneIn_handler_opcode_14_CutScene_setActiveAndFinalize
ZoneIn_handler_opcode_17_onPreCutSceneCancel
ZoneIn_handler_opcode_18_onPostCutSceneCancel
```

Receiver docs add the event-lifecycle side:

```text
0x012F Kick             -> LuaActorImpl slot 56, KickClientOrderEventReceiver
0x0130 RunEventFunction -> LuaActorImpl slot 57, StartServerOrderEventFunctionReceiver
0x0131 EndEvent         -> LuaActorImpl slot 58, EndClientOrderEventReceiver
0x0136 SetEventStatus   -> LuaActorImpl slot 48, SetEventStatusReceiver
0x016B SetNoticeEventCondition -> SetNoticeEventConditionReceiver,
                                  event-handler owned, DirectorBase fallback
```

This reinforces the implementation rule for synthetic instance notice events:
starting a `noticeEvent` and running `eventNoticeCutScene` is only half of the
flow. The client also needs the correct end-event/teardown path, otherwise it
can remain in event/cutscene mode even after the cutscene resource finishes.

### Current Implementation Delta

Local Toto-Rak still diverges from the recovered retail path:

```text
Data/scripts/directors/Instance/Totorak.lua:
  init() returns /Director/OpeningDirector
  manually calls _setInstanceRaid and _loadTextDataPermanently
  uses quest-style cutscene names:
    com0l610, com0l510, com0g610, com0g510, com0u610
```

Recovered retail client path:

```text
/Director/Occupancy/RaidFst0Dungeon03
eventNoticeCutScene(player, "rad0f300", arg, finishTime)
openRaidDungeonExecutionWidget(unused, 1, finishTime)
processUpdateGeneralNotificationDialog(3, nil, nil, 1)
```

For Toto-Rak fidelity, the next implementation experiment should drive the
occupancy director and `rad0f300..rad0f308` notice-event path rather than the
current `OpeningDirector` plus `com0*` quest-cutscene path.
