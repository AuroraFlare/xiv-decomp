# Court in the Sands Fight Probe Implementation Decomp - 2026-06-30

## Scope

Second focused pass for `Court in the Sands` (`man0u1`, quest `110010`) after the cutscene/route decomp.

This note is intentionally implementation-shaped. It answers:

- what the next probe patch should add
- which owner should push `processEvent035`
- how to materialize the `tourney gladiator`
- what data must be logged before making the fight default quest progression
- which earlier Court paths are known-bad or still unproven

## Verdict

The next patch should be a hidden static-arena fight controller plus the clean post-fight push fallback.

Recommended first probe:

```text
COL_TRIG door prompt
-> ask processEvent1000_5 / "Enter this instance?"
-> warp to static fight floor in PrivateAreaMasterPast type 0
-> create hidden Court fight director with StartDirector(false)
-> AddMember(player) so HandleBNpcKill reaches director on kill
-> spawn actor 2280157 with mob type 1362 applied as a Gladiator-class BNPC
-> on kill: wait for battle cleanup, set GLD=2, mark post-CS pending, end event/director, warp to exit
-> COLISEUM_POST_TRIG or GLD2 fallback runs processEvent035 from a clean push owner
```

Do not make direct post-kill `processEvent035` the default path yet. It is the important proof target, but previous local notes show this exact fight can inherit blank/wrong event owner state if cutscene work is started from the battle/director kill context too early.

## Patch Surface

Likely files for the first probe patch:

| File | Change |
| --- | --- |
| `Data/scripts/quests/man/man0u1.lua` | Replace the `COL_TRIG` skip with entry prompt, static arena warp, hidden fight-controller start, and post-fight pending/fallback states. |
| `Data/scripts/directors/Quest/QuestDirectorMan0u101.lua` | New hidden Court controller. Recovered inventory names this director, but no live script exists. |
| `Data/sql/server_battlenpc_mob_types.sql` | Deterministic mob type for actor `2280157`, `displayName='tourney_gladiator'`, `currentJob=3`, `skillListId=91`. |
| `Data/sql/server_eventnpc_spawn_locations.sql` | Optional `COLISEUM_POST_TRIG` row using actor `1099047` at the post-fight exit. |
| `Map Server/Actors/Area/Area.cs` or `Map Server/WorldManager.cs` | Optional tiny helper if Lua cannot fetch/pass `BattleNpcMobType` cleanly. Plain `SpawnEnemy` is only a visual fallback. |

Avoid touching unrelated quest scaffolds in this patch. The Court state machine is already fragile around `CNTR_SEQ15_GLD`, `CNTR_SEQ15_GSM`, and marker routing.

## Known Retail/Recovered Route

Current live `man0u1.lua` skip:

```text
GLD_TRIG, GLD=0 -> processEvent030 -> GLD=1 -> warp to PrivateAreaMasterPast type 0
COL_TRIG, GLD=1 -> processEvent035 -> GLD=2 -> warp to PrivateAreaMasterPast type 1
GLD2_TRIG       -> processEvent040/045 -> GLD++ -> public warp
```

Recovered post-fight cutscene body:

```lua
function Man0u1.processEvent035(A0_115, A1_116, A2_117)
  A0_115:startFadeOutCutSceneDefault(A1_116)
  A0_115:startNQCutScene("man0u135", 1)
  A0_115:startFadeInCutSceneAfterWarp(A1_116)
end
```

Recovered entry prompt exists:

```lua
function Man0u1.processEvent1000_5(A0_335, A1_336, A2_337)
  return (A2_337:ask(worldMaster, 34112, 2))
end
```

Text `34112` is `Enter this instance?`. No live Court call to `processEvent1000_5` exists yet.

## Coordinates

Use the already-documented static Court coordinates:

| Purpose | Zone | Private area | Type | X | Y | Z | Rot |
| --- | ---: | --- | ---: | ---: | ---: | ---: | ---: |
| Entry trigger `COL_TRIG` / `1090141` | 209 | `PrivateAreaMasterPast` | 0 | -187.225 | 190.150 | 219.730 | 0.000 |
| Player fight start | 209 | `PrivateAreaMasterPast` | 0 | -192.400 | 174.890 | 160.119 | 1.576 |
| Enemy spawn | 209 | `PrivateAreaMasterPast` | 0 | -178.569 | 174.893 | 160.280 | -1.580 |
| Win/fail exit | 209 | `PrivateAreaMasterPast` | 1 preferred for post-CS lane | -177.650 | 189.950 | 216.801 | -3.112 |
| Optional post-fight trigger `1099047` | 209 | `PrivateAreaMasterPast` | 1 | -177.650 | 189.950 | 216.801 | -3.112 |
| Follow-up trigger `GLD2_TRIG` / `1090077` | 209 | `PrivateAreaMasterPast` | 1 | -177.810 | 192.560 | 209.920 | -0.470 |

## Why A Hidden Director

The engine already has the pieces needed for a server-side controller that does not advertise a client-visible content group.

Relevant runtime facts:

- `Area:CreateDirector("Quest/QuestDirectorMan0u101", false)` loads `Data/scripts/directors/Quest/QuestDirectorMan0u101.lua`.
- The director `init()` return should follow the local pattern and return `/Director/Quest/QuestDirectorMan0u101`.
- `director:AddMember(player)` calls `Player.AddDirector(this)` even when there is no content group.
- `Player.HandleBNpcKill(classId)` calls quest scripts first, then each owned director's `OnKillBNpc`.
- `Director.OnKillBNpc` dispatches Lua `onKillBNpc(player, director, classId)`.
- `director:StartDirector(false)` runs Lua `init`/`main` without sending director spawn/init packets.

This is exactly the lane we need for a static arena fight:

```text
server-side director exists
player owns the director for kill callback routing
client does not receive visible director/content setup at entry
```

Known-bad or high-risk lane:

```text
StartDirector(true)
or content-group setup at entry
or director advertisement after kill
```

Prior Court notes say those reopened blank owner `0x2` / trigger `0x0` and `0x1` event starts and could freeze/error the client. Keep the first probe hidden.

## Fight Controller Shape

Proposed new script: `Data/scripts/directors/Quest/QuestDirectorMan0u101.lua`.

Suggested constants:

```lua
local TOURNEY_GLADIATOR = 2280157
local BNPC_TOURNEY_GLADIATOR = 1362 -- if a mob type row is added
local FIGHT_TIME_SECONDS = 300
```

Suggested controller lifecycle:

```text
init(director)
-> return a QuestDirector class path/name only if needed; hidden StartDirector(false) does not need visible packets

main(director)
-> wait for spawn/aggro delay
-> optionally show "There are 5 minutes remaining."
-> keep a TTL/fail timer
-> on timeout, cleanup and warp back to the entry/exit lane without advancing GLD

onKillBNpc(player, director, classId)
-> ignore unless classId == 2280157
-> prevent double-completion
-> send defeated attention message
-> wait long enough for battle command cleanup
-> set CNTR_SEQ15_GLD = 2
-> mark post-coliseum cutscene pending
-> EndEvent if the player still has a battle event open
-> remove/despawn spawned enemy if still present
-> EndDirector
-> warp to the post-fight exit / post-trigger area
```

The direct post-kill cutscene probe can be a separate debug mode later:

```text
kill
-> wait cleanup
-> kickEventContinue(player, director, "noticeEvent", "noticeEvent")
-> callClientFunction(player, "delegateEvent", player, quest, "processEvent035")
-> only advance state after the function returns
```

Keep that opt-in until owner tuples prove stable.

## Mob Materialization

Actor evidence:

| Field | Value |
| --- | --- |
| Actor id | `2280157` |
| Display id | `3280156` |
| Display name | `tourney gladiator` |
| Actor class path | blank in `gamedata_actor_class` |
| Live spawn row | none found |
| Live mob type row | none found |

Runtime fallback helps the visual smoke test:

- `WorldManager.ResolveBattleNpcActorClass` fills an empty class path for BNPC actors.
- `currentJob == Character.CLASSID_GLA` or display name token `gladiator` selects `/Chara/Npc/Monster/Fighter/FighterEnemyGladiatorStandard`.
- `Area.SpawnEnemy(..., displayName)` passes that display name into class-path resolution.
- `Area.SpawnEnemy` attaches `DPS` AI after adding the actor.

But plain `Area.SpawnEnemy` does not apply mob-type state. It does not set `bnpcId`, `currentJob`, level, aggro fields, stat fallbacks, skill list, spell list, or drop list. A display-name-only spawn is acceptable only to prove the actor/model appears.

Best deterministic SQL row:

```sql
-- Next observed mob type id is 1362. No ambient spawn row should use this.
-- No loot row should be added for this id during the first Court probe.
(1362, 2280157, 'tourney_gladiator',
 4, 0, 1, 0, 0, 10, 60, 4200, 0,
 3, 1, 1,
 0, 0,
 1, 1, 1, 1, 1, 1,
 40, 1, 1, 1,
 1, 1, 1, 1,
 1, 1, 1, 1, 1, 1,
 0, 91, 0, 0)
```

Notes:

- `currentJob=3` forces Gladiator.
- `min_lvl=max_lvl=1` keeps the first proof fight trivial; tune only after the retail/live feel is captured.
- `skillListId=91` is the local Gladiator fallback list: flash, fast blade, flat blade, savage blade, riot blade, shield bash, phalanx.
- Do not use `skillListId=86`; that is the pugilist fallback.
- `dropListId=0` is not a perfect no-reward signal. `BattleNpc.ApplyMobType` remaps `0` to `mobType.bnpcId`, and kill loot lookup also falls back to BNPC id. Therefore the proof run must confirm no `server_battlenpc_mob_types_loot` rows for `1362` and log EXP/gil/item deltas.

The controller should spawn the actor, set level, and apply the mob type before the actor enters the visibility grid. Existing C# probe/director code uses the `SpawnEnemy(..., configureBeforeAdd: stagedMob => stagedMob.ApplyMobType(mobType))` pattern. If Lua cannot fetch `GetWorldManager():GetMobType(1362)` and pass the internal `BattleNpcMobType` object into `enemy:ApplyMobType(...)`, add a tiny C# helper such as `SpawnEnemyWithMobType(...)` instead of relying on display-name-only spawning.

The important invariant is that actor `2280157` materializes as a real Gladiator BNPC with job, level, skills, aggro, stats, and reward behavior visible in logs, not just the visual fallback path and not the low-confidence pugilist fallback from the old inferred CSV.

## Quest State Rules

Current branch risks to fix or guard during the probe:

- `GLD_TRIG` with `CNTR_SEQ15_GLD == 2` currently resets GLD back to `1`. That can regress post-fight state.
- `GLD2_TRIG` branches on `CNTR_SEQ15_GSM == 0` or `2`, but live Goldsmith flow may only reach `1`.
- `onNpcLS` advances from `SEQ_015` only when `CNTR_SEQ15_GSM >= 1` and `CNTR_SEQ15_GLD >= 3`.
- `COL_TRIG` is an `ObjectEventDoor`; it is fine for entry but not for an invisible post-fight auto-win/cutscene volume.

The first safe implementation should split state like this:

| State | Meaning | Allowed owner |
| --- | --- | --- |
| `GLD=1`, no fight-active flag | Player is at Coliseum entry. `COL_TRIG` asks and starts fight. | `COL_TRIG` |
| fight-active flag | Hidden controller owns fight. Entry triggers should ignore/reject. | hidden director |
| `GLD=2`, post-CS flag unset | Fight won; `processEvent035` still pending. | `COLISEUM_POST_TRIG` preferred, `GLD2_TRIG` fallback |
| `GLD=2`, post-CS flag set | Player can walk into follow-up `processEvent040/045`. | `GLD2_TRIG` |
| `GLD=3` | Gladiator branch done enough for `onNpcLS` with Goldsmith completion. | normal quest route |

Use a new flag for `FLAG_SEQ15_POST_COLISEUM_CS_DONE` if not already present in the implementation branch. If flag space is tight, document the chosen bit beside the existing `FLAG_MANIC_EMOTE` / `FLAG_MADDENED_EMOTE` definitions.

## Cutscene Owner Proof

`processEvent035` is a quest-object function and must be reached through an active event owner that exposes `delegateEvent`.

Known-safe shape for push-context cutscene:

```text
Push owner starts event
-> callClientFunction(player, "delegateEvent", player, quest, "processEvent035")
-> wait for return
-> mark post-CS done
-> EndEvent
```

Unproven direct post-kill shape:

```text
kill callback
-> cleanup delay
-> kickEventContinue(player, director, "noticeEvent", "noticeEvent")
-> delegate to quest processEvent035
```

Known-risk shape:

```text
kill callback
-> raw RunEventFunction/delegateEvent without first establishing a valid owner
```

This can produce an empty update or never reach `Man0u1.processEvent035`.

## Probe Logging Checklist

Capture these before enabling the fight by default:

| Probe | Required proof |
| --- | --- |
| Entry ask | `processEvent1000_5` return tuple and which value means accept/cancel. |
| Director creation | `CreateDirector`, `AddMember`, `StartDirector(false)` all succeed; no client-visible blank owner packets. |
| Spawn | actor id, display name, resolved class path, currentJob, level, BNPC id, skillListId, dropListId, and whether `ApplyMobType(1362)` actually ran. |
| Fight start | aggro delay, timer/message, hostile targeting, same-floor position. |
| Kill callback | order of quest `onKillBNpc` vs director `onKillBNpc`, exactly one completion path. |
| Rewards | EXP/gil/item/crystal/gear-durability deltas for the spawned gladiator. |
| Cleanup | enemy despawn, director removed from player-owned directors, no stale fight-active flag after win/fail/relog. |
| Post-fight warp | player lands at `PrivateAreaMasterPast` type `1`, near `-177.650, 189.950, 216.801`. |
| `processEvent035` push | outgoing EventFunction owner/event/type/context tuple, EventUpdate tuple, and proof `_callFunction` reached `Man0u1.processEvent035`. |
| After-warp scene | `man0u135` starts, fade-in-after-warp finalizes, event remains open until scene completion. |
| Follow-up trigger | `processEvent040` or `processEvent045` runs after `processEvent035`, GLD reaches `3`, `onNpcLS` can progress when GSM is done. |

## Do Not Ship Yet Until

- direct or fallback `processEvent035` owner tuple is proven live
- `EventUpdate` return tuple for `processEvent035` is logged
- `tourney gladiator` resolves to the Gladiator model/class path in the live client
- kill callback fires exactly once
- no reward leakage is observed from the quest-only BNPC row
- after-warp cutscene finalization is clean
- failure/relog cleanup leaves no hidden director or active fight flag

## Practical Next Patch

The lowest-risk next code patch is:

1. Add `QuestDirectorMan0u101.lua` as a hidden server-side fight controller.
2. Add or stage BNPC type `1362` for actor `2280157` with Gladiator job/list, no loot row.
3. Expose/use a spawn path that applies mob type `1362`; do not rely on plain `Area.SpawnEnemy` except for a visual-only smoke test.
4. Add a guarded `COL_TRIG` branch for `GLD=1`:
   - call recovered `processEvent1000_5`
   - on accept, warp to fight floor
   - create hidden director with `CreateDirector("Quest/QuestDirectorMan0u101", false)`
   - `director:AddMember(player)` so the player owns the kill callback route
   - spawn the gladiator and optionally add the mob to the director for cleanup
   - call `director:StartDirector(false)`
   - end the entry event cleanly
5. Add post-fight pending handling:
   - preferred `COLISEUM_POST_TRIG = 1099047` push at type `1`
   - `GLD2_TRIG` fallback if DB-only trigger is absent
6. Log every probe point above.
7. Only after that, try the direct director `noticeEvent -> processEvent035` probe.

This gets Court off the pure skip path without betting the whole quest on the still-unproven live post-kill cutscene owner.

Do not call `ContentFinished()` in the static Court lane. That belongs to `PrivateAreaContent` flows, while this probe stays in static `PrivateAreaMasterPast`.
