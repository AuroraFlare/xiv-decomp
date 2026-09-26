# Court in the Sands Runtime Probe Decomp - 2026-06-30

## Scope

Focused runtime-proof pass for `Court in the Sands` (`man0u1`, quest `110010`) after the fight implementation decomp.

This note is not another route summary. It is the proof plan for the data we still do not have live:

- outgoing `RunEventFunction` owner/name/type/context for `delegateEvent`
- incoming `0x012E EventUpdate` tuples for `processEvent035`
- whether the coroutine wait was registered before the update arrived
- whether `Man0u1.processEvent035` actually ran
- whether after-warp scene/fade lifecycle stayed open through `man0u135`
- whether the spawned fight opponent materializes, dies, cleans up, and avoids reward leakage

## Verdict

The next Court probe patch should add narrow, Court-scoped logging before changing the quest's default behavior.

The three proof gates are:

| Gate | Passing evidence |
| --- | --- |
| Dispatch | `RunEventFunction(delegateEvent)` leaves with owner/event/type matching `COLISEUM_POST_TRIG`, `GLD2_TRIG`, or `QuestDirectorMan0u101 noticeEvent`; then `_callFunction` reaches `Man0u1.processEvent035`. |
| Wait/update | `LuaEngine` has a `_WAIT_EVENT` or `_WAIT_EVENT_START` registered before the client sends `0x012E`; the update resumes the expected coroutine instead of falling through silently. |
| Fight | actor `2280157` spawns as BNPC type `1362`, `ApplyMobType(1362)` ran, kill callback fires exactly once, cleanup removes transient actors/director, and reward deltas are known. |

If any gate fails, do not keep pushing scene data. The failure is in dispatch, wait timing, or fight lifecycle.

## Current Event Pipeline

Event start:

```text
PacketProcessor case 0x012D
-> EventStartPacket
-> resolve owner actor/static/area/director
-> LogEventRouteProbe(...)
-> Player.StartEvent(ownerActor, eventStart)
-> LuaEngine.EventStarted(...)
```

Relevant files:

- `Map Server/PacketProcessor.cs`
- `Map Server/Actors/Chara/Player/Player.cs`
- `Map Server/Lua/LuaEngine.cs`

`debug_event_route_probe` already logs useful `EventStart` rows for push/object/gimmick/system-command owners. It logs trigger, owner, command id, owner type, actor class, unique id, path, event type/name, push command fields, raw params, and synthesized script args.

Event function:

```text
global.lua callClientFunction(...)
-> Player.RunEventFunction(functionName, ...)
-> RunEventFunctionPacket.BuildPacket(player.Id, currentEventOwner, currentEventName, currentEventType, ...)
```

The important part is that `RunEventFunction` does not choose a fresh owner. It uses:

- `player.currentEventOwner`
- `player.currentEventName`
- `player.currentEventType`

Therefore Court needs an outgoing probe row at `Player.RunEventFunction` every time `functionName == "delegateEvent"` and the args include `processEvent035`, or whenever the active player is on `quest 110010` / `SEQ_015`.

Event update:

```text
PacketProcessor case 0x012E
-> EventUpdatePacket fields:
   triggerActorID
   serverCodes
   unknown1
   unknown2
   eventType
   luaParams
-> Player.UpdateEvent(eventUpdate)
-> LuaEngine.OnEventUpdate(player, luaParams)
```

`LuaEngine.OnEventUpdate` resumes only if `mSleepingOnPlayerEvent` has a wait for that player. If no wait exists, it returns without logging or ending the event. This is a major diagnostic boundary.

## Probe Patch Shape

Use the existing `debug_event_route_probe` switch as the parent switch, then add a Court-specific predicate instead of logging every event update in the game.

Suggested predicate:

```text
ShouldLogCourtProbe(player, ownerActor, eventName, functionName, params)
-> true if player.GetQuest(110010) exists and sequence == 15
-> true if owner actor class is 1090141, 1090077, or 1099047
-> true if owner/director class/name contains QuestDirectorMan0u101
-> true if functionName == "delegateEvent" and params contain "processEvent035"
```

Useful owner constants:

| Actor | Meaning |
| ---: | --- |
| `1090141` | `COL_TRIG`, entry door trigger in `PrivateAreaMasterPast` type `0` |
| `1099047` | proposed `COLISEUM_POST_TRIG`, invisible post-fight push |
| `1090077` | `GLD2_TRIG`, follow-up trigger in type `1` |
| dynamic director | `QuestDirectorMan0u101`, hidden Court fight controller |

Add probe rows at four places.

### 1. EventStart

Existing `LogEventRouteProbe` is almost enough. For Court, make sure it logs rows for:

- `COL_TRIG` / `1090141`
- `COLISEUM_POST_TRIG` / `1099047`
- `GLD2_TRIG` / `1090077`
- `QuestDirectorMan0u101 noticeEvent`

If the director row is missing, owner resolution failed or the player does not own the director.

### 2. RunEventFunction

Patch target:

- `Map Server/Actors/Chara/Player/Player.cs`
- method `RunEventFunction`

Log before `QueuePacket(spacket)`:

```text
[CourtEventFunction]
player=<name>
questSeq=<seq>
activeOwner=0x...
activeEvent=<name>
activeType=0x...
function=<functionName>
params=<DumpParams(lParams)>
```

For `delegateEvent`, the params must prove:

```text
player, quest object, "processEvent035", ...
```

Passing owner expectations:

| Path | Expected active owner |
| --- | --- |
| Safe fallback | `COLISEUM_POST_TRIG` or `GLD2_TRIG` push owner |
| Direct director proof | `QuestDirectorMan0u101` owner, event `noticeEvent`, type usually `0x05` |

Failing owner examples:

- `owner=0x00000000`
- empty event name
- hotbar/battle command owner
- stale `AttackMagic`/battle event owner
- `COL_TRIG` door owner when trying to auto-run the post-fight scene

### 3. EventUpdate

Patch target:

- `Map Server/PacketProcessor.cs`
- case `0x012E`

Hamlet already has a good log shape. Add Court's equivalent:

```text
[CourtEventUpdate]
player=<name>
questSeq=<seq>
activeOwner=0x...
activeEvent=<name>
activeType=0x...
trigger=0x...
eventType=0x...
serverCodes=0x...
unknown1=0x...
unknown2=0x...
invalid=<bool>
params=<DumpParams(luaParams)>
```

This row tells us what the client returned. It does not, by itself, tell us whether Lua resumed.

### 4. Lua Wait/Resume

Patch target:

- `Map Server/Lua/LuaEngine.cs`

Add Court probe logs at:

- `AddWaitEventCoroutine`
- `AddWaitEventStartCoroutine`
- `EventStarted` match path
- `EventStarted` stale-cancel path
- `OnEventUpdate` resume path
- `OnEventUpdate` no-wait return path

Minimum rows:

```text
[CourtLuaWait] add kind=event player=<name> activeOwner=0x... activeEvent=... activeType=0x...
[CourtLuaWait] add kind=eventStart expectedOwner=0x... expectedEvent=...
[CourtLuaWait] eventStart matched owner=0x... event=...
[CourtLuaWait] eventStart stale previousOwner=0x... newOwner=0x...
[CourtLuaWait] update resumed params=...
[CourtLuaWait] update droppedNoWait activeOwner=0x... activeEvent=... params=...
```

The `droppedNoWait` row is critical. Without it, an immediate empty update looks like a scene problem even when the real issue is wait ordering.

## Proving `Man0u1.processEvent035` Ran

`RunEventFunction(delegateEvent)` proves only that the packet was sent. The next patch also needs a Lua-side breadcrumb.

Minimal debug-only Lua row in `Data/scripts/quests/man/man0u1.lua`, inside the live wrapper that delegates or immediately around the `callClientFunction` that requests `processEvent035`:

```text
[CourtQuestProbe] before processEvent035 delegate owner=<classId> GLD=<counter> GSM=<counter>
[CourtQuestProbe] after processEvent035 delegate returns=<tuple>
```

If we add a live `processEvent035` wrapper in the quest script itself, log at the function entry too:

```text
[CourtQuestProbe] entered Man0u1.processEvent035 scene=man0u135
```

Passing evidence:

```text
CourtEventFunction delegateEvent -> CourtQuestProbe entered processEvent035 -> CourtEventUpdate tuples -> CourtLuaWait update resumed
```

Failing evidence:

```text
CourtEventFunction delegateEvent -> CourtEventUpdate empty/immediate -> no CourtQuestProbe entry
```

That means the dispatch did not reach the quest method.

## After-Warp Lifecycle Proof

Recovered `processEvent035` shape:

```lua
startFadeOutCutSceneDefault(player)
startNQCutScene("man0u135", 1)
startFadeInCutSceneAfterWarp(player)
```

The after-warp proof must show:

- fade-out request left through the active owner
- scene `man0u135` started
- `0x012E` updates are not dropped before `callClientFunction` registers `_WAIT_EVENT`
- the event remains open until fade-in-after-warp finalizes
- `player:EndEvent()` happens after the final update, not before
- any warp to public/type `1` happens after the scene call has returned or through the intended after-warp helper

Do not diagnose scene data until these are true. `man0u135` itself is already known from decomp and cutReplay.

## Fight Spawn/Reward Proof

The fight proof should use a C# helper rather than raw Lua-only `SpawnEnemy` if possible.

Why:

- `Area.SpawnEnemy` resolves the class path and attaches DPS AI.
- It does not apply mob type state by itself.
- `BattleNpcMobType` is an internal C# class and is not registered as Lua userdata.
- Existing working code applies mob type through `SpawnEnemy(... configureBeforeAdd: stagedMob => stagedMob.ApplyMobType(mobType))`.

Recommended helper:

```text
Area.SpawnEnemyWithMobType(uint actorClassId, uint bnpcId, string uniqueId, x, y, z, rot, string displayName)
-> GetMobType(bnpcId)
-> SpawnEnemy(actorClassId, uniqueId, x, y, z, rot, displayName, configureBeforeAdd)
-> stagedMob.Level = chosen proof level
-> stagedMob.ApplyMobType(mobType)
-> stagedMob.SetMobMod(IgnoreSpawnLeash, 1)
-> stagedMob.SetMobMod(DetectionRange, ...)
-> stagedMob.currentActorIcon = 1
-> after spawn: CalculateStats(), ApplyConfiguredSpawnTp(), HP=MaxHP
```

Court row:

```sql
(1362, 2280157, 'tourney_gladiator', 4, 0, 1, 0, 0, 10, 60, 4200, 0, 3, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 91, 0, 0)
```

Log at spawn:

```text
[CourtFightProbe] spawn actor=2280157 bnpc=1362 unique=... classPath=... display=... level=1 job=3 skillList=91 dropList=1362 applyMobType=true
```

The `dropList` may become `1362` even when the SQL row says `0`, because `ApplyMobType` maps `dropListId=0` to `mobType.bnpcId`.

## Kill/Cleanup/Reward Proof

Current kill order in `BattleNpc.Die`:

```text
resolve rewarded players
gear wear
spiritbond
gil
loot
player.HandleBNpcKill(actorClassId)
battle npc onDeath
EXP
guildleve director OnMobKill if any
signal mobkill
```

Implications:

- The Court director kill callback does not run before loot/gil/gear/spiritbond.
- EXP is after `HandleBNpcKill`, so logs must bracket both the callback and the final EXP call.
- A no-loot row alone does not mean no rewards; gear wear/spiritbond and base EXP can still happen.

Minimum reward logs:

```text
[CourtFightProbe] preDeath player gil=<...> exp=<...> lootCount=<...> gearWearSummary=<...> spiritbondSummary=<...>
[CourtFightProbe] killCallback questSeq=15 gld=1 actorClass=2280157 directorOwned=true
[CourtFightProbe] postDeath player gil=<...> exp=<...> lootCount=<...> gearWearSummary=<...> spiritbondSummary=<...>
```

If reward leakage is unacceptable, add a future explicit quest-only suppression flag or mob modifier. Until then, the proof run should only claim "known reward behavior," not "reward locked."

Cleanup proof:

- dynamic enemy is dead/despawned or not targetable
- director `EndDirector()` removes player ownership
- no stale fight-active flag remains after win/fail/relog
- no `ContentFinished()` call is made, because Court is static `PrivateAreaMasterPast`, not `PrivateAreaContent`
- player lands in the intended post-fight type `1` area before the post-cutscene push

## Direct vs Fallback Probe Order

Run in this order:

1. Fallback push proof:
   - kill sets `GLD=2`, post-CS flag unset
   - warp to type `1`
   - `COLISEUM_POST_TRIG` or `GLD2_TRIG` starts a clean push event
   - `callClientFunction(delegateEvent, quest, "processEvent035")`
   - log all three gates
2. Direct director proof:
   - after kill cleanup delay
   - `kickEventContinue(player, director, "noticeEvent", "noticeEvent")`
   - prove `EventStarted` matched expected owner/name
   - `callClientFunction(delegateEvent, quest, "processEvent035")`
   - compare update tuples and lifecycle against fallback
3. Only then consider removing the fallback as the default route.

## Expected Evidence Matrix

| Probe | Expected |
| --- | --- |
| `COL_TRIG` entry | EventStart owner actor class `1090141`, event is push/door-shaped, ask returns accept/cancel tuple. |
| Fight spawn | `ApplyMobType(1362)` ran before visible spawn; class path resolves to `FighterEnemyGladiatorStandard`. |
| Kill | `HandleBNpcKill(2280157)` reaches `QuestDirectorMan0u101` once. |
| Fallback `processEvent035` | active owner is `1099047` or `1090077`; `CourtQuestProbe entered processEvent035`; update resumes a wait. |
| Direct `processEvent035` | active owner is hidden director `noticeEvent`; `EventStarted` matched `_WAIT_EVENT_START`; update resumes a wait. |
| After-warp | no `droppedNoWait`; event ends after final fade/warp update; player can walk to `GLD2_TRIG`. |
| Reward | known deltas for gil/loot/EXP/gear/spiritbond; no unexpected loot table rows for `1362`. |

## Smallest Useful Patch

If we only add one instrumentation patch before implementing Court, make it this:

1. Add Court/EventRoute probe rows to `Player.RunEventFunction`.
2. Add Court `0x012E` rows to `PacketProcessor`.
3. Add Court wait/resume/drop rows to `LuaEngine`.
4. Add `CourtQuestProbe` breadcrumbs around the `processEvent035` delegate and entry.
5. Add C# `SpawnEnemyWithMobType` or equivalent helper for `2280157`/`1362`.

That patch gives us the missing live proof without committing to a permanent direct post-kill cutscene path.
