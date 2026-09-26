# Court in the Sands Focused Coliseum Decomp - 2026-06-30

## Scope

Focused pass for the missing `Court in the Sands` coliseum fight in `man0u1` / quest `110010`.

This pass is specifically about:

- the fight entry and post-fight route around `SEQ_015`
- the post-fight cutscene immediately after the fight
- whether a Court-specific director exists
- how to materialize the `tourney gladiator`
- what runtime probes are still required before turning this into default quest progression

## Short Verdict

We can implement and probe Court now, but the recovered data does not contain a Court-specific retail fight director or kill-success callback.

Known with high confidence:

- The post-fight cutscene is `Man0u1.processEvent035`.
- The scene key is `man0u135`.
- The scene body is the normal fade-out, NQ cutscene, fade-in-after-warp shape.
- The current live server reaches it only through the `COL_TRIG` push skip path.
- `Court in the Sands` is not a guildleve, even though old wiki/location data labels the mob as `Guildleve: Court in the Sands`.

Still missing:

- retail kill callback
- Court-specific live director
- proven immediate post-kill event owner tuple
- live `tourney gladiator` spawn row
- reward-lock proof
- cleanup proof

## Live Quest Route

Live script:

- `Data/scripts/quests/man/man0u1.lua`
- quest id `110010`
- `SEQ_015` is the guild-visit phase that contains the Gladiators' Guild and Coliseum branch.

Relevant constants:

```lua
SEQ_015 = 15

CNTR_SEQ15_GSM = 0
CNTR_SEQ15_GLD = 1

UNDEFEATED_GLADIATOR       = 1001020
POORLY_OUTFITTED_GLADIATOR = 1000995
AGGRIEVED_GLADIATOR        = 1000997
DISHEARTENED_GLADIATOR     = 1000999

GLD_TRIG  = 1090283
COL_TRIG  = 1090141
GLD2_TRIG = 1090077
```

`SEQ_012` initializes both `CNTR_SEQ15_GSM` and `CNTR_SEQ15_GLD` to `0`.

`SEQ_015` registers the public/private Coliseum actors and always enables:

```lua
quest:SetENpc(GLD_TRIG, (subseqGLD >= 0 and subseqGLD <= 2) and QFLAG_PUSH or QFLAG_OFF, false, (subseqGLD >= 0 and subseqGLD <= 2))
quest:SetENpc(COL_TRIG, QFLAG_PUSH, false, true)
quest:SetENpc(GLD2_TRIG, QFLAG_PUSH, false, true)
```

Current `onPush` route:

| Owner | Condition | Current behavior |
| --- | --- | --- |
| `GLD_TRIG` | `subseqGLD == 0` | `processEvent030`, increment GLD to `1`, warp to Coliseum private area type `0` |
| `GLD_TRIG` | `subseqGLD == 1/2` | `processEvent040`, reset GLD to `1`, warp to type `0` |
| `COL_TRIG` | `subseqGLD == 1` | missing fight skip: `processEvent035`, increment GLD to `2`, warp to type `1` |
| `GLD2_TRIG` | `subseqGSM == 0` | `processEvent040`, increment GLD, warp public |
| `GLD2_TRIG` | `subseqGSM == 2` | `processEvent045`, increment GLD, NPC LS, start `SEQ_045`, warp public |

The `GLD2_TRIG` branch reads `CNTR_SEQ15_GSM` but increments `CNTR_SEQ15_GLD`. That may be branch logic for whether the Goldsmith visit is complete, not necessarily a typo. The exact counter transition still needs runtime proof.

Additional branch risks from the focused scan:

- `CNTR_SEQ15_GSM == 2` looks unreachable in the current live flow if GSM only initializes to `0` and increments once.
- If the player completes Goldsmith first and reaches `GLD2_TRIG` with `CNTR_SEQ15_GSM == 1`, neither current `GLD2_TRIG` branch fires.
- `GLD_TRIG` with `CNTR_SEQ15_GLD == 2` currently resets GLD back to `1`, which can regress the post-fight state.
- `onNpcLS` advances to `SEQ_045` only when `CNTR_SEQ15_GSM >= 1` and `CNTR_SEQ15_GLD >= 3`, so the post-Coliseum branch has to prove how GLD reaches `3`.

## Recovered Function Spine

Recovered file:

- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man0u1.lua`

Entry/Coliseum functions:

```lua
function Man0u1.processEvent030(A0_70, A1_71, A2_72)
  A0_70:startFadeOutCutSceneDefault(A1_71)
  A0_70:startNQCutScene("man0u130", 1)
  A0_70:startFadeInCutSceneAfterWarp(A1_71)
end

function Man0u1.processEvent035(A0_115, A1_116, A2_117)
  A0_115:startFadeOutCutSceneDefault(A1_116)
  A0_115:startNQCutScene("man0u135", 1)
  A0_115:startFadeInCutSceneAfterWarp(A1_116)
end

function Man0u1.processEvent040(A0_118, A1_119, A2_120)
  A0_118:startFadeOutCutSceneDefault(A1_119)
  A0_118:startNQCutScene("man0u140", 1)
  A0_118:startFadeInCutSceneAfterWarp(A1_119)
end

function Man0u1.processEvent045(A0_121, A1_122, A2_123)
  A0_121:startFadeOutCutSceneDefault(A1_122)
  A0_121:startNQCutScene("man0u140", 1)
  worldMaster:say(A0_121, 395)
  worldMaster:say(A0_121, 396)
  A0_121:startFadeInCutSceneAfterWarp(A1_122)
end

function Man0u1.processEvent1000_5(A0_335, A1_336, A2_337)
  return (A2_337:ask(worldMaster, 34112, 2))
end
```

Joined text proves `34112` is:

```text
Enter this instance?
```

No live `delegateEvent(..., "processEvent1000_5")` call was found for Court in this pass. The method exists in recovered data and is mentioned in live comments, but it is not wired into the current `SEQ_015` push route.

Cutscene atlas rows:

| Method | Scene | Replay row | Shape |
| --- | --- | --- | --- |
| `processEvent030` | `man0u130` | `11001004` | after-warp direct scene |
| `processEvent035` | `man0u135` | `11001005` | after-warp direct scene |
| `processEvent040` | `man0u140` | `11001006` | after-warp direct scene |
| `processEvent045` | `man0u140` | `11001006` | after-warp direct scene plus worldMaster lines |

Important: `processEvent035` is a quest-object method. It must be reached via an active owner that exposes `delegateEvent`; a raw native event-function call named `processEvent035` is not equivalent.

## Placement Data

Live trigger placements:

| Actor | Label | Zone | Private area | Type | Position |
| --- | --- | --- | --- | --- | --- |
| `1090283` | `Man0u1Seq15_gldtrigg` | `209` | public | `0` | `-185.26, 195, 179.74, -2.28` |
| `1090141` | `MAN0u1_COL_TRIGG` | `209` | `PrivateAreaMasterPast` | `0` | `-187.225, 190.15, 219.73, 0` |
| `1090077` | `MAN0u1_GLD2_Trigg` | `209` | `PrivateAreaMasterPast` | `1` | `-177.81, 192.56, 209.92, -0.47` |

Live marker logic maps the Gladiator branch like this:

| State | Marker |
| --- | --- |
| `CNTR_SEQ15_GLD == 0` | `11001006` |
| `CNTR_SEQ15_GLD == 1`, private area | `11001007` |
| `CNTR_SEQ15_GLD == 1`, public area fallback | `11001006` |
| `CNTR_SEQ15_GLD == 2`, private area | `11001008` |
| `CNTR_SEQ15_GLD == 2`, public area fallback | `11001006` |

Namespace trap: `11001005` is a Goldsmith-side marker in the quest marker table, but a replay/cutscene row for `man0u135` in `cutReplay`. Do not treat marker id `11001005` as the live post-fight Coliseum trigger.

Static Court NPC placements already exist in private area types `0` and `1` for:

- `1001020` undefeated gladiator
- `1000995` poorly outfitted gladiator
- `1000997` aggrieved gladiator
- `1000999` disheartened gladiator

No Court spawn row was found for actor `2280157`.

Actor `1099047` is shaped like a useful invisible `PopulaceStandard` push trigger, but its only live spawn found in this pass is `gridania_blocker1`, not Court.

## Director Data

Recovered director inventory maps these to `man0u1`:

- `QuestDirectorMan0u101`
- `QuestDirectorMan0u102`

But both recovered files are empty two-line subclasses of `QuestDirectorBaseClass`.

No live `Data/scripts/directors/Quest/QuestDirectorMan0u101.lua` or `QuestDirectorMan0u102.lua` exists.

The live Court script has no `onKillBNpc`.

Closest working comparator:

- `Data/scripts/directors/Quest/QuestDirectorMan0u001.lua`

That director belongs to `Flowers for All` / `man0u0`, not Court. It is still valuable because it proves the local kill-to-cutscene pattern:

1. kill callback runs
2. script waits for battle/tutorial cleanup
3. quest sequence is adjusted
4. `kickEventContinue(player, director, "noticeEvent", "noticeEvent")`
5. `callClientFunction(player, "delegateEvent", player, quest, "...")`
6. only then does the quest cutscene function run

The comment in that file is direct local evidence:

```lua
-- StartSequence AND kickEventContinue are needed here in order for processEvent020 to fire.
```

## Event Owner Rule

`Data/scripts/global.lua`:

```lua
function kickEventContinue(player, actor, trigger, ...)
  player:kickEvent(actor, trigger, ...)
  return coroutineYieldIfRunning("_WAIT_EVENT_START", player, actor, trigger)
end

function callClientFunction(player, functionName, ...)
  player:RunEventFunction(functionName, ...)
  return coroutineYieldIfRunning("_WAIT_EVENT", player)
end
```

`Player.RunEventFunction` sends through the player's current event tuple:

- `currentEventOwner`
- `currentEventName`
- `currentEventType`

Therefore, a fight kill callback should not call `delegateEvent(..., "processEvent035")` unless a valid event owner has just been established.

Safe direct post-kill lane:

```text
kill callback
-> battle cleanup delay
-> kickEventContinue(player, courtDirector, "noticeEvent", "noticeEvent")
-> callClientFunction(player, "delegateEvent", player, quest, "processEvent035")
-> advance/lock Court state only after the method returns
```

Unsafe lane:

```text
kill callback
-> raw callClientFunction/runClientFunction delegateEvent using stale battle/current owner
```

That unsafe lane can produce an immediate empty `EventUpdate` without ever reaching `Man0u1.processEvent035`.

## Fight Materialization Data

The likely target actor is:

| Field | Value |
| --- | --- |
| Actor class id | `2280157` |
| Display name id | `3280156` |
| English display | `tourney gladiator` |
| Actor class path | blank in `gamedata_actor_class` |
| Appearance row | present |
| Live spawn row | not found |

Fallback behavior:

- `Area.SpawnEnemy` calls `WorldManager.ResolveBattleNpcActorClass`.
- If the actor class has a blank path and no better mob type exists, the server falls back by job/display token.
- Passing display name `tourney gladiator` should select `/Chara/Npc/Monster/Fighter/FighterEnemyGladiatorStandard`.
- If no display name/job is passed, fallback can become `/Chara/Npc/Monster/Fighter/FighterEnemyPugilistStandard`.
- Do not use Pugilist skill list `86`; for a Court reconstruction the target should be Gladiator-shaped.

So the first probe should pass the display name explicitly.

Court-specific coordinate notes from the existing instance guide/backlog:

| Purpose | Position |
| --- | --- |
| Player fight-floor position | `-192.400, 174.890, 160.119` |
| Enemy spawn position | `-178.569, 174.893, 160.280` |
| Private area | zone `209`, `PrivateAreaMasterPast`, type `0` |

Recommended initial materialization:

```lua
local mob = player.CurrentArea:SpawnEnemy(
  2280157,
  "man0u1_tourney_gladiator",
  -178.569, 174.893, 160.280,
  -1.5,
  0,
  0,
  "tourney gladiator"
)

mob.Level = 3
mob:SetMod(Hp, 180)
mob:SetMod(Mp, 100)
mob:SetMod(Damage, 10)
mob:CalculateStats()
```

The exact stats are placeholders for probing. The important proof point is actor materialization, class path, model/appearance, kill callback, cleanup, and reward lock.

If we add a proper mob type first, the proposed shape is:

- actor id `2280157`
- unique/display label `tourney_gladiator`
- current job `3` / Gladiator
- level `3`
- hostile enabled
- no drop list, spell list, or special reward path for the first probe
- stats low enough for a level-3 solo story fight, with level-scaled fallbacks filling the rest

## Implementation Recommendation

Best first implementation is a guarded Court-specific fight controller, not a guildleve.

Use recovered/director names where possible:

- live script path: `Data/scripts/directors/Quest/QuestDirectorMan0u101.lua`
- optional simple content script only if static private-area spawning proves too fragile

Minimum viable Court lane:

1. `GLD_TRIG` gets player into private area type `0` as today.
2. `COL_TRIG` at `subseqGLD == 1` asks `processEvent1000_5`.
3. If accepted, spawn/materialize `2280157` as `tourney gladiator`.
4. Create/add/start a Court-owned director or controller.
5. Director owns player and fight target.
6. On kill of actor class `2280157`, cleanup combat state and open director `noticeEvent`.
7. While director `noticeEvent` is active, delegate to `Man0u1.processEvent035`.
8. After successful return, set `CNTR_SEQ15_GLD = 2`.
9. Warp to private area type `1` only after the scene/cutscene lane is stable.
10. Keep reward/progression locked if the cutscene dispatch fails.

Safer fallback lane:

1. On kill, set `CNTR_SEQ15_GLD = 2` and a pending post-fight-cutscene flag.
2. Cleanup fight and warp to the exit position.
3. Let a clean push owner, preferably `GLD2_TRIG` or a new Court-only `PopulaceStandard` trigger, run `processEvent035`.
4. Set a scene-done flag only after `processEvent035` returns.

The fallback lane is less retail-like but safer because the push owner naturally has a valid `delegateEvent` context.

## Runtime Probe Checklist

Required before enabling as normal quest progression:

- `KickEvent` owner id, event name, event type, params.
- Matching `EventStart` tuple.
- `RunEventFunction` tuple for `delegateEvent`.
- `EventUpdate` return tuple for `processEvent035`.
- Proof that `Man0u1.processEvent035` actually starts, not just that the client answers an event update.
- Spawn proof for `2280157`: model, display name, class path, job/class fallback.
- Kill callback proof for `QuestDirectorMan0u101`.
- Cleanup proof: mob removed, director closed, player not stranded in private type `0`.
- Counter proof: `CNTR_SEQ15_GLD` before fight, after kill, after cutscene, after warp.
- Branch proof for `GLD2_TRIG`: how `CNTR_SEQ15_GSM` chooses `processEvent040` vs `processEvent045`.
- Reward-lock proof: no gil/items/EXP/progression if kill succeeds but cutscene dispatch fails.

## Current Confidence

| Area | Confidence | Notes |
| --- | --- | --- |
| post-fight scene key | high | `processEvent035 -> man0u135` recovered and atlas-classified |
| post-fight event method body | high | recovered Lua is direct and short |
| current live skip route | high | live `COL_TRIG` branch directly calls `processEvent035` |
| Court-specific retail director | low | recovered mapped directors are empty; live scripts missing |
| `tourney gladiator` actor id | medium-high | actor/display/appearance exist; no live spawn row |
| immediate post-kill cutscene lane | medium | implementable via director `noticeEvent`, not retail-proven |
| reward/cleanup safety | low until probed | death/reward ordering needs live proof with this target |
