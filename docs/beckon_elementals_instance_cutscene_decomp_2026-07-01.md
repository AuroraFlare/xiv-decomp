# Beckon of the Elementals Instance Cutscene Decomp - 2026-07-01

Scope: `Beckon of the Elementals` / `man2g0` / quest id `110008`, focused on the cutscenes around the Spirit of the Wood instance and the later post-instance Echo chain.

## Short Verdict

The recovered quest scenario does not create the instance inside the cutscene method. The pre-fight scene method only asks, fades, plays `man2g000`, fades back in, and returns the answer. The server-side Lua must then create and zone into the content area.

The likely "CS ends but instance does not load" boundary is therefore after `processEvent007_2` returns `1`, inside `doSEQ004CombatInstance`.

Current local script update: `doSEQ004CombatInstance` now uses `BECKON_COMBAT_ZONE = 153` and resolves the source area with `GetWorldManager():GetArea(BECKON_COMBAT_ZONE)`. That removes the older suspected bridge bug where dynamic content could be created from the player's current Archer's Guild parent zone `206`.

If the instance still does not load after `man2g000`, the active suspects are now: the prompt result never resumes as `1`, `GetArea(153)` returns nil, `CreateContentArea(...)` returns nil or errors during `SimpleContentMan2g01.onCreate`, or `DoZoneChangeContent` fails to move the player into the created content area.

## Source Files

- Live quest script: `Data/scripts/quests/man/man2g0.lua`
- Recovered quest scenario: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man2g0.lua`
- Local content script: `Data/scripts/content/SimpleContentMan2g01.lua`
- Local quest director: `Data/scripts/directors/Quest/QuestDirectorMan2g001.lua`
- Recovered quest director: `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectorman2g001.lua`
- Mined text/options: `docs/Dat Mining/man2g0.csv`
- Static private areas: `Data/sql/server_zones_privateareas.sql`
- Static spawn rows: `Data/sql/server_eventnpc_spawn_locations.sql`

## Sequence Map

Relevant quest sequence constants in the live script:

| Sequence | Meaning |
| ---: | --- |
| `SEQ_003` | Archer's Guild cutscene and O-App-Pesi escort prompt |
| `SEQ_004` | Spirit of the Wood combat instance |
| `SEQ_005` | Post-fight return to A'naidjaa / Oak Atrium |
| `SEQ_040` | Mih Khetto's Amphitheatre private area |
| `SEQ_045` | Echo/private-area beat after the amphitheatre cutscene |
| `SEQ_060` | Quest turn-in at Miounne |

## Recovered Cutscene Spine

### Pre-Fight Prompt and Scene

Recovered method: `Man2g0.processEvent007_2`

Shape:

```lua
say(246)
if ask(240, 2) == 1 then
  startFadeOutCutSceneDefault(...)
  startHQCutScene("man2g000", 1)
  startFadeInCutSceneAfterWarp(...)
end
return ask(240, 2)
```

Live route:

```lua
local result = callClientFunction(player, "delegateEvent", player, quest, "processEvent007_2")
if (result == 1) then
  player:EndEvent()
  doSEQ004CombatInstance(player, quest)
  return
end
```

Important: `processEvent007_2` does not itself load the instance. It only returns the yes/no result that lets the server start the bridge.

### Immediate Post-Fight Cutscene

Recovered method: `Man2g0.processEvent010`

Shape:

```lua
startFadeOutCutSceneDefault(...)
startNQCutScene("man2g010", 1)
startFadeInCutSceneAfterWarp(...)
```

Live local route in `QuestDirectorMan2g001.lua`:

```lua
callClientFunction(player, "delegateEvent", player, quest, "processEvent010")
player:EndEvent()
quest:StartSequence(SEQ_005)
quest:UpdateENPCs()
player.CurrentArea:ContentFinished()
GetWorldManager():DoZoneChange(player, 206, nil, 0, 15, 220.416, 10.750, -1248.641, -0.061)
```

So the post-fight scene belongs to the director kill-success path, not the entry prompt path.

## Instance Bridge

Current `doSEQ004CombatInstance`:

```lua
if (quest:getSequence() ~= SEQ_004) then
  quest:StartSequence(SEQ_004)
end

local sourceArea = GetWorldManager():GetArea(BECKON_COMBAT_ZONE)

if (sourceArea == nil) then
  player:SendMessage(0x1D, "[beckon] ", "Unable to find combat instance source zone.")
  return false
end

local contentArea = sourceArea:CreateContentArea(
  player,
  "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent",
  "man2g01",
  "SimpleContentMan2g01",
  "Quest/QuestDirectorMan2g001"
)

if (contentArea == nil) then
  player:SendMessage(0x1D, "[beckon] ", "Unable to create combat instance.")
  return false
end

director = contentArea:GetContentDirector()
player:AddDirector(director)
director:StartDirector(false)
player:SetLoginDirector(director)
GetWorldManager():DoZoneChangeContent(player, contentArea, -2011.420, -11.679, -916.309, -2.815, 16)
return true
```

Static DB says:

| Static data | Zone | Private area | Type |
| --- | ---: | --- | ---: |
| `server_zones_privateareas.sql` combat row | `153` | `PrivateAreaMasterPast` | `1` |
| `man2g0_seq004_*` actor placements | `153` | `PrivateAreaMasterPast` | `1` |
| `man2g0_seq003_oapppesi` prompt area | `206` | `PrivateAreaMasterPast` | `9` |

Current inference: the active bridge now aligns with static combat zone `153`; the old current-area/zone-`206` mismatch is only visible in the commented experimental block near the bottom of the live script.

## Director and Content Data

Recovered `QuestDirectorMan2g001` is only:

```lua
require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorMan2g001", "QuestDirectorBaseClass")
```

No recovered retail kill callback or instance lifecycle method was found in that director. The live `QuestDirectorMan2g001.lua` is emulator bridge code.

Local content script currently spawns:

| Actor | Kind | Notes |
| --- | --- | --- |
| `2290015` | ally | Grinnaux |
| `2290016` | ally | Handeloup |
| `2290017` | ally | T'kebbe |
| `1000033` | event actor | O-App-Pesi |
| `2105201` / BNPC `1364` | enemy | Spirit of the Wood |

The Spirit uses `SpawnEnemyWithMobType(..., 1364, "man2g0_spirit_of_the_wood", ...)`. The mob type row is present in `Data/sql/server_battlenpc_mob_types.sql`, with a duplicate manual patch in `Data/sql/manual patches/beckon_spirit_of_the_wood.sql`.

## Later Echo/Post-Instance Chain

This is a separate later chain after the amphitheatre sequence, but it is also "around an instance" in `man2g0`.

### `processEvent070`

Recovered:

```lua
startFadeOutCutSceneDefault(...)
startNQCutScene("man2g070", 1)
startFadeInCutSceneAfterWarp(...)
```

Live route:

```lua
callClientFunction(player, "delegateEvent", player, quest, "processEvent070")
quest:StartSequence(SEQ_045)
player:EndEvent()
GetWorldManager():DoZoneChange(player, 153, "PrivateAreaMasterPast", 2, 15, -1939.459, 0.147, -891.202, -1.867)
```

This moves into the Echo private area after the scene.

### `processEvent080`

Recovered:

```lua
startFadeOutCutSceneDefault(...)
startNQCutScene("man2g080", 1)
startHQCutScene("MAN2G090", 1)
startNQCutScene("man2g095", 1)
startNQCutScene("man2g100", 1)
startFadeInCutSceneAfterWarp(...)
```

Live route:

```lua
callClientFunction(player, "delegateEvent", player, quest, "processEvent080")
GetWorldManager():DoZoneChange(player, 155, "", 0, 15, 59.413, 4, -1219.275, 0.880)
quest:StartSequence(SEQ_060)
player:EndEvent()
```

This chain exits to the Roost/turn-in leg. It is not the Spirit of the Wood fight entry.

### `processEvent080_01`

Recovered:

```lua
if level >= 18 then
  worldMaster:say(279)
else
  worldMaster:say(280)
end
```

Live route calls it at `SEQ_060` reward/complete time, then runs `sqrwa`, completes the quest, awards gil, and grants EXP.

## Replay Rows

Generated cutscene join rows map these scene keys:

| Scene | Method | Replay id |
| --- | --- | ---: |
| `man2g000` | `processEvent007_2` | `11000802` |
| `man2g010` | `processEvent010` | `11000803` |
| `man2g070` | `processEvent070` | `11000809` |
| `man2g080` | `processEvent080` | `11000810` |
| `MAN2G090` | `processEvent080` | `11000811` |
| `man2g095` | `processEvent080` | `11000812` |
| `man2g100` | `processEvent080` | `11000813` |

The replay rows prove the cutscene keys exist. They do not create the live combat instance.

## Failure Boundary Checklist

If the instance does not load after `man2g000`, verify these in order:

1. `processEvent007_2` returns `1` to the server.
2. `doSEQ004CombatInstance` starts and sets `SEQ_004`.
3. `GetWorldManager():GetArea(BECKON_COMBAT_ZONE)` resolves zone `153`.
4. `CreateContentArea(...)` returns a non-nil dynamic content area.
5. `QuestDirectorMan2g001` is added, started, and set as login director. The current live bridge does not kick an entry `noticeEvent`; only the old commented experiment does that.
6. `DoZoneChangeContent` sends the player into the created content area.
7. `SimpleContentMan2g01.onCreate` spawns the allies and Spirit of the Wood.

The decomp says the cutscene side is present. The suspect area is the server bridge from the returned yes prompt into the dynamic content area.

## Whole Quest Decomp Pass

This section widens the scope from the Spirit of the Wood instance to the whole `man2g0` quest.

### Quest Record

| Field | Value | Source |
| --- | --- | --- |
| Quest id | `110008` | `Data/sql/gamedata_quests.sql:40` |
| Name | `Beckon of the Elementals` | `Data/sql/gamedata_quests.sql:40` |
| Class/code | `Man2g0` / `man2g0` | `Data/sql/gamedata_quests.sql:40` |
| Prerequisite | `110007` / `Whispers in the Wood` | `Data/sql/gamedata_quests.sql:40` |
| Minimum level | `13` | `Data/sql/gamedata_quests.sql:40` |
| Follow-up dependency | `110013` depends on `110008` | `Data/sql/gamedata_quests.sql:592` |
| Achievement mapping | `110008 -> 1002` | `Map Server/DataObjects/AchievementUtils.cs:144` |
| Text sheet | `403`, `man2g0` | `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man2g0.lua:4` |

`MarketEntrance.lua` also gates the Ul'dah Merchants Ward/Waking Sands route on level `>= 18` plus completion of one starter-city quest including `110008`; see `Data/scripts/base/chara/npc/object/MarketEntrance.lua:113`.

### Retail Class Shape

Recovered scenario:

```lua
require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man2g0", "ScenarioBaseClass")
```

Recovered quest object:

```lua
require("/Chara/Npc/NpcBaseClass")
_defineClass("QuestObjectMan2g0", "NpcBaseClass")
```

Recovered quest director:

```lua
require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorMan2g001", "QuestDirectorBaseClass")
```

So the recovered retail client script supplies cutscene/dialogue methods only. The live server-side route, sequence changes, private-area warps, content creation, reward, and fight completion are all local emulator glue.

### Full Sequence Route

| Sequence | Player-facing beat | Live route | Retail/decomp calls |
| ---: | --- | --- | --- |
| Accept | Miounne starts the quest | `onTalk` accepts quest, then `onStart` starts `SEQ_000` | `processEventMiounneStart` says text ids `1,2,3` |
| `SEQ_000` | Go to Quiver's Hold / Nonolato | Nonolato calls `processEvent007`, starts `SEQ_003`, warps to `PrivateAreaMasterPast` type `9` at Archer's Guild coords | `processEvent007` says `192,193`, plays `man1g900` |
| `SEQ_003` | O-App-Pesi asks to set forth | O-App-Pesi calls `processEvent007_2`; if result `1`, `doSEQ004CombatInstance` starts | `processEvent007_2` says `246`, asks `240`, plays HQ `man2g000` on yes, returns ask result |
| `SEQ_004` | Spirit of the Wood fight | `doSEQ004CombatInstance` creates dynamic content and zones in; director kill callback plays post-fight scene, starts `SEQ_005`, warps to zone `206` | `processEvent010` plays `man2g010` |
| `SEQ_005` | Return to A'naidjaa / Oak Atrium | A'naidjaa calls `processEvent020`, starts `SEQ_010`, starts NPC linkshell pack 1 | `processEvent020` plays `man2g020`; Miounne optional `processEvent010_2` says `278` |
| `SEQ_010` | Linkpearl from Miounne | `onNpcLS` sends text ids `65,66,67`, then `StartSequenceForNpcLs(SEQ_015)` | Server-side only |
| `SEQ_015` | Go to Stillglade Fane / Soileine | Soileine calls `processEvent030`, starts `SEQ_020`, warps to `PrivateAreaMasterPast` type `10` | `processEvent030` says `201,202`, plays `man2g030`; Miounne optional `processEvent020_2` says `198,199,200` |
| `SEQ_020` | Stillglade Fane private area | NPC ambient dialogue; push `PSHCJGUILD` calls `processEvent040`, starts `SEQ_025`, warps to type `11` | `processEvent030_2` through `030_9` are NPC barks; `processEvent040` plays `man2g040` |
| `SEQ_025` | Fye at Stillglade Fane entrance | First Fye talk calls `processEvent045` and sets `FLAG_SEQ025_FYE`; O-App before flag says `processEvent040_4`; O-App after flag calls `processEvent050`, starts `SEQ_030`, starts LS pack 2, warps public | `processEvent045` says `182,183,184`; `processEvent050` plays `man2g050` |
| `SEQ_030` | Linkpearl about Mih Khetto | `onNpcLS` sends text ids `112,113,114,115`, then `StartSequenceForNpcLs(SEQ_035)` | Server-side only |
| `SEQ_035` | Go to Mih Khetto's Amphitheatre | Push `PSHAMPHITHEATRE` calls `processEvent060`, starts `SEQ_040`, warps to type `12` | `processEvent060` plays `man2g060`; Miounne optional `processEvent050_2` says `213,214` |
| `SEQ_040` | Amphitheatre festival tableau | Fye calls `processEvent070`, starts `SEQ_045`, zones to `153`, `PrivateAreaMasterPast`, type `2`; many festival NPC barks are active | `processEvent070` plays `man2g070`; `processEvent060_2` through `060_26` are festival barks |
| `SEQ_045` | Echo forest beat | Yda/Papalymo have barks; push `PSHSEQ045` calls `processEvent080`, zones to `155`, starts `SEQ_060` | `processEvent080` chains `man2g080`, HQ `MAN2G090`, `man2g095`, `man2g100` |
| `SEQ_050` / `SEQ_055` | Journal-only Echo/back-at-festival beats | Live script has state/push fallback for these, but no visible local `StartSequence(SEQ_050/SEQ_055)` route. Current live route jumps from `SEQ_045` push to `SEQ_060` | Covered inside `processEvent080` cutscene chain |
| `SEQ_060` | Turn in to Miounne | Miounne calls `processEvent080_01`, `sqrwa`, completes quest, awards gil/EXP | `processEvent080_01` says id `279` if level arg `>= 18`, else `280` |

### Cutscene Spine

| Method | Scene key(s) | Fade mode | Replay id(s) | Notes |
| --- | --- | --- | --- | --- |
| `processEvent007` | `man1g900` | after-warp | `11000801` | Archer's Guild lead-in |
| `processEvent007_2` | `man2g000` | after-warp | `11000802` | Pre-fight HQ scene; returns O-App prompt result |
| `processEvent010` | `man2g010` | after-warp | `11000803` | Immediate post-fight scene |
| `processEvent020` | `man2g020` | default fade-in | `11000804` | A'naidjaa/Oak Atrium handoff |
| `processEvent030` | `man2g030` | after-warp | `11000805` | Stillglade Fane entry |
| `processEvent040` | `man2g040` | after-warp | `11000806` | Stillglade Fane push scene |
| `processEvent050` | `man2g050` | after-warp | `11000807` | O-App refuses Fye/Khrimm visit, sends to festival |
| `processEvent060` | `man2g060` | after-warp | `11000808` | Amphitheatre entry/festival |
| `processEvent070` | `man2g070` | after-warp | `11000809` | Fye talk before Echo |
| `processEvent080` | `man2g080`, `MAN2G090`, `man2g095`, `man2g100` | after-warp | `11000810` to `11000813` | Four-scene finale chain |

Asset crosscheck rows show every `man2g0xx` scene above exists in Lua refs, replay rows, and client cut assets. `MAN2G090` is referenced uppercase in Lua but normalized as `man2g090` in the asset inventory.

One generated atlas (`outputs/quest-master-gap-atlas`) omits the `MAN2G090` replay join, but the decompiled quest source and the fuller cutscene inventory both include replay `11000811`. Treat that atlas gap as a tooling/index artifact unless the replay UI specifically fails on `MAN2G090`.

### Recovered-Only and Unused Methods

The recovered `Man2g0` class contains more method stubs than the live server route currently calls:

- `processEvent005_2`
- `processEvent007_2_2`
- `processEvent007_3`
- `processEvent020_3`
- `processEvent040_5`
- `processEvent040_6`
- `processEvent1000_1`
- `processEvent1000_2`
- `processEventTrial001`
- `processEventTrial002`

The current live script does not normally enter those methods. `SEQ_050` and `SEQ_055` are also declared and have some fallback handling, but the live happy path jumps from `SEQ_045` to `SEQ_060` after `processEvent080`.

Recovered `processEvent007_2` and `processEvent007_2_2` each show two `ask()` calls. That may be real client behavior or a decomp artifact, but it matters because the live server only creates the instance when the final returned result is `1`.

Quest flag constants used by the route come from `Data/scripts/quest.lua`: `QFLAG_NONE/QFLAG_OFF = 0`, `QFLAG_OFF_HIDE = 1`, `QFLAG_TALK = 2`, `QFLAG_PUSH = 3`, `QFLAG_REWARD = 4`, `QFLAG_MAPONLY = 5`, and `SEQ_ACCEPT = 65535`.

### Private Area Map

| Quest beat | Zone | Private area | Type | Live entry point | Static support |
| --- | ---: | --- | ---: | --- | --- |
| `SEQ_003` Archer's Guild | `206` | `PrivateAreaMasterPast` | `9` | `WarpToPrivateArea(..., 9, 228.307, 12.010, -1257.005, 0)` | Area row `server_zones_privateareas.sql:76`; O-App/exit spawns `server_eventnpc_spawn_locations.sql:1158-1159` |
| `SEQ_004` Spirit fight | `153` | `PrivateAreaMasterPast` | dynamic content, static type `1` | Current bridge resolves `BECKON_COMBAT_ZONE = 153`, creates runtime content, then `DoZoneChangeContent(... -2011.420, -11.679, -916.309, -2.815, 16)` | Area row `server_zones_privateareas.sql:77`; ally/O-App spawns `1160-1163`; exit `1219` |
| `SEQ_020` Stillglade Fane interior | `206` | `PrivateAreaMasterPast` | `10` | `WarpToPrivateArea(..., 10, -239.329, 19.495, -1646.319, 3.316)` | Spawns `server_eventnpc_spawn_locations.sql:1164-1180` |
| `SEQ_025` Stillglade Fane entrance | `206` | `PrivateAreaMasterPast` | `11` | `WarpToPrivateArea(..., 11, -322.202, 8, -1666.206, 0.775)` | Spawns `1181-1187`; exit `1220` |
| `SEQ_035` amphitheatre public push | `206` | public | `0` | Push actor `PSHAMPHITHEATRE` | Spawn `1188` |
| `SEQ_040` amphitheatre private | `206` | `PrivateAreaMasterPast` | `12` | `WarpToPrivateArea(..., 12, -96.219, 10.356, -1632.551, 3.118)` | Spawns `1189-1214`; exit `1221` |
| `SEQ_045` Echo forest | `153` | `PrivateAreaMasterPast` | `2` | `DoZoneChange(player, 153, "PrivateAreaMasterPast", 2, ... -1939.459, 0.147, -891.202, -1.867)` | Area row `server_zones_privateareas.sql:81`; Yda/Papalymo/push spawns `1215-1217`; exit `1222` |
| `SEQ_060` turn-in | `155` | public | `0` | `DoZoneChange(player, 155, "", 0, 15, 59.413, 4, -1219.275, 0.880)` | Completion push spawn `server_eventnpc_spawn_locations.sql:1218` |

The important topology split is: Gridania city/private scenes are mostly zone `206`, while the Spirit fight and Echo forest use zone `153`. The current live bridge already selects zone `153` explicitly; if an older build creates combat content from the player's current Archer's Guild parent area, that older build is still suspicious.

### Instance Runtime Notes

`doSEQ004CombatInstance` in the live quest does this:

```lua
if (quest:getSequence() ~= SEQ_004) then
  quest:StartSequence(SEQ_004)
end

local sourceArea = GetWorldManager():GetArea(BECKON_COMBAT_ZONE)

if (sourceArea == nil) then
  player:SendMessage(0x1D, "[beckon] ", "Unable to find combat instance source zone.")
  return false
end

local contentArea = sourceArea:CreateContentArea(
  player,
  "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent",
  "man2g01",
  "SimpleContentMan2g01",
  "Quest/QuestDirectorMan2g001"
)

if (contentArea == nil) then
  player:SendMessage(0x1D, "[beckon] ", "Unable to create combat instance.")
  return false
end
```

Runtime implication from C#:

- `Zone.CreateContentArea` allocates a dynamic private-area type and creates `PrivateAreaContent(this, areaClassPath, areaName, privateAreaType, director, starterPlayer)`.
- `PrivateArea` inherits the parent zone id/name/region, so this content area should now inherit zone `153`.
- `PrivateAreaContent` calls the Lua `onCreate` hook, which is where `SimpleContentMan2g01` spawns allies and the Spirit.
- `WorldManager.DoZoneChangeContent` is the actual packet/area transition boundary after the content area exists.

That means the load failure should be debugged as a server transition problem, not as a missing `man2g000` cutscene.

### Client Resume Boundary

The first hard gate after `man2g000` is still inside the current event coroutine:

```lua
local result = callClientFunction(player, "delegateEvent", player, quest, "processEvent007_2")
if result == 1 then
  doSEQ004CombatInstance(player, quest)
else
  player:EndEvent()
end
```

`callClientFunction` calls `player:RunEventFunction(...)` and then yields `_WAIT_EVENT`. `Player.RunEventFunction` builds the outgoing function packet from `currentEventOwner`, `currentEventName`, and `currentEventType`, so a stale or missing current event owner can leave the server waiting on a result that never arrives. `LuaEngine.OnEventUpdate` resumes the waiting coroutine; if there is no wait registered, the update is dropped and the quest never reaches `CreateContentArea`.

This makes the highest-value log point the returned `result` from `processEvent007_2`. If it is nil, missing, or anything other than `1`, the instance code is never reached.

Content loading has one more naming trap: `CreateContentArea` receives both `"man2g01"` and `"SimpleContentMan2g01"`, but the Lua loader uses the private area name for `/content/{privateAreaName}.lua`. In this route, that means `Data/scripts/content/SimpleContentMan2g01.lua` is the required content script.

### Content Script Mismatches

`SimpleContentMan2g01.lua` spawns:

| Runtime actor | Actor class / BNPC | Notes |
| --- | --- | --- |
| Grinnaux | `2290015` | Ally, tank-style local stats |
| Handeloup | `2290016` | Ally, DPS-style local stats |
| T'kebbe | `2290017` | Ally, healer-style local stats |
| O-App-Pesi | `1000033` | Runtime script uses base `OAPPPESI` |
| Spirit of the Wood | actor `2105201`, mob type `1364`, unique `man2g0_spirit_of_the_wood` | Enemy |

Static SQL for `SEQ_004` has O-App-Pesi as actor class `1000235` (`OAPPPESI_SEQ004`) at the same fight coords. The current runtime content script spawns actor class `1000033` instead. That does not explain the instance failing to load after `man2g000`, but it is a real local-vs-static mismatch to keep in mind after the zone/load issue is fixed.

The Spirit mob type is present in `Data/sql/server_battlenpc_mob_types.sql:611`; the manual patch file duplicates it at `Data/sql/manual patches/beckon_spirit_of_the_wood.sql:7`.

### Director Flow

Recovered retail `QuestDirectorMan2g001` is empty beyond its base class. Local `Data/scripts/directors/Quest/QuestDirectorMan2g001.lua` supplies emulator fight behavior:

- `main` waits up to `600` seconds, finds `man2g0_spirit_of_the_wood`, waits for the player to be quest-fight ready, then requests forced engagement after `10` seconds.
- `onKillBNpc` checks for `SPIRIT_OF_THE_WOOD`, waits `2` seconds, kicks `noticeEvent` on the director, calls `processEvent010`, starts `SEQ_005`, finishes content, and warps to zone `206` at `220.416, 10.750, -1248.641, -0.061`.
- `onEventStarted` currently logs and closes stray director events.

This is useful local bridge code, but it is not recovered retail lifecycle logic.

The kill id check is sane: `BattleNpc.Die` calls `player.HandleBNpcKill(GetActorClassId())`, and `Player.HandleBNpcKill` fans that same actor class id into quest/director `onKillBNpc`. For this fight, the runtime Spirit uses actor class `2105201` and mob type `1364`, so comparing `bnpc` to `SPIRIT_OF_THE_WOOD = 2105201` is correct in the current server.

The spawn id check is still worth logging after the instance loads. `SpawnEnemyWithMobType` has a fallback for missing Beckon mob type data, but it still returns null if actor class `2105201` is missing. In that case, the content area can exist, but the director waits for `man2g0_spirit_of_the_wood` until timeout.

### Reward and Completion

At `SEQ_060`, Miounne completion currently does:

```lua
callClientFunction(player, "delegateEvent", player, quest, "processEvent080_01", 1)
callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2)
player:CompleteQuest(quest)
player:AddItem(1000001, 30000)
player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 30000)
player:AddExp(50000, player:GetCurrentClassOrJobId(), 0)
```

Recovered `processEvent080_01` checks its passed level arg:

```lua
if A3_185 >= 18 then
  worldMaster:say(279)
else
  worldMaster:say(280)
end
```

Live code passes literal `1`, so it will always choose recovered text id `280`, the below-18 branch, unless the delegate layer injects/rewrites that argument elsewhere. That is a separate whole-quest correctness issue from the instance-load bug.

### High-Signal Fix Leads

For the current "cutscene ends, instance does not load" report:

1. Log the return value from `processEvent007_2` at `Data/scripts/quests/man/man2g0.lua:349` and the retry path at `Data/scripts/quests/man/man2g0.lua:372`.
2. Log `BECKON_COMBAT_ZONE` and whether `GetWorldManager():GetArea(153)` returns a zone.
3. Log the created `contentArea` zone/name/type and parent immediately after `CreateContentArea`.
4. Log whether `PrivateAreaContent` loads `/content/SimpleContentMan2g01.lua` and enters `onCreate`.
5. Log every `SimpleContentMan2g01.onCreate` spawn result, especially `man2g0_spirit_of_the_wood`.
6. Log director ownership after `AddDirector`, `StartDirector`, and `SetLoginDirector`.
7. Log `DoZoneChangeContent` entry and whether it hits the `contentArea == null` branch.
8. After the load works, decide whether `SimpleContentMan2g01` should spawn `OAPPPESI_SEQ004` (`1000235`) instead of `OAPPPESI` (`1000033`).

For whole-quest cleanup after the instance:

1. Review whether `SEQ_050` and `SEQ_055` should be explicit server sequences or only journal labels inside the `processEvent080` finale chain.
2. Pass the real player level into `processEvent080_01` instead of literal `1`, unless another layer intentionally supplies the level.
3. Keep the Waking Sands/Merchants Ward unlock behavior tied to `110008` completion and level `18`, as seen in `MarketEntrance.lua`.

## Deep Appendix

### Live State Matrix

Key live-script ranges: actor constants are in `Data/scripts/quests/man/man2g0.lua:115`, marker constants in `Data/scripts/quests/man/man2g0.lua:173`, `onStateChange` in `Data/scripts/quests/man/man2g0.lua:198`, `onTalk` in `Data/scripts/quests/man/man2g0.lua:327`, `onPush` in `Data/scripts/quests/man/man2g0.lua:541`, `onNpcLS` in `Data/scripts/quests/man/man2g0.lua:599`, and `getJournalMapMarkerList` in `Data/scripts/quests/man/man2g0.lua:663`.

| Sequence | Enabled ENPCs / triggers | Transition behavior | Marker behavior |
| ---: | --- | --- | --- |
| Accept | Miounne `QFLAG_TALK` | `processEventMiounneStart`, accept quest, `onStart -> SEQ_000` | none local |
| `000` | Nonolato `QFLAG_TALK` | `processEvent007`, `SEQ_003`, warp to Archer's Guild private type `9` | Nonolato |
| `003` | Nonolato `TALK`, O-App-Pesi `TALK`, Eldid ambient | O-App `processEvent007_2`; result `1` enters `doSEQ004CombatInstance`; Nonolato replays Archer's Guild private entry | private: O-App-Pesi; public: Nonolato |
| `004` | Eldid ambient, Nonolato `TALK`, O-App-Pesi `TALK`, `OAPPPESI_SEQ004` `TALK` | O-App or `OAPPPESI_SEQ004` can retry `doSEQ004CombatInstance`; Nonolato returns to Archer's Guild private type `9` | public only: Nonolato |
| `005` | A'naidjaa `TALK`, Miounne ambient | A'naidjaa `processEvent020`, `SEQ_010`, starts NPC linkshell pack `1`; Miounne optional `processEvent010_2` | A'naidjaa |
| `010` | no ENPC state branch | `onNpcLS` sends `65,66,67`, then `SEQ_015` | none local |
| `015` | Soileine `TALK`, Miounne ambient | Soileine `processEvent030`, `SEQ_020`, warp Stillglade Fane private type `10`; Miounne optional `processEvent020_2` | Soileine |
| `020` | Soileine `TALK`; eight Stillglade ambient actors; `PSHCJGUILD` `QFLAG_PUSH`; Cecily ambient | Push `processEvent040`, `SEQ_025`, warp private type `11`; Soileine can re-enter type `10` | private: CNJ push; public: Soileine |
| `025` | Soileine `TALK`; Fye `TALK` before `FLAG_SEQ025_FYE`; O-App-Pesi `TALK` after that flag; several ambient Fane actors | Fye sets `FLAG_SEQ025_FYE`; O-App before flag says `processEvent040_4`; O-App after flag plays `processEvent050`, starts `SEQ_030`, starts LS pack `2`, warps public | private before flag: Fye; private after flag: CNJ O-App; public: Soileine |
| `030` | no ENPC state branch | `onNpcLS` sends `112,113,114,115`, then `SEQ_035` | none local |
| `035` | `PSHAMPHITHEATRE` `QFLAG_PUSH` | Push `processEvent060`, `SEQ_040`, warp amphitheatre private type `12` | Amphitheatre |
| `040` | Fye `TALK`; festival NPC ambience; `PSHAMPHITHEATRE` `QFLAG_PUSH` | Fye `processEvent070`, `SEQ_045`, zone `153` private type `2`; push re-enters amphitheatre type `12` | private: Fye2; public: Amphitheatre |
| `045` | Yda ambient, Papalymo ambient, `PSHSEQ045` `QFLAG_PUSH`, `PSHAMPHITHEATRE` `QFLAG_PUSH`, V'korolon ambient | `PSHSEQ045` plays `processEvent080`, zones to `155`, starts `SEQ_060`; amphitheatre push returns to type `12` | private: finale push; public: Amphitheatre |
| `050` / `055` | `PSHAMPHITHEATRE` `QFLAG_PUSH`, V'korolon ambient | fallback push returns to `SEQ_040` amphitheatre type `12`; no normal happy-path starter found | none local |
| `060` | Miounne `QFLAG_REWARD` | `processEvent080_01`, `sqrwa`, complete quest, 30,000 gil, 50,000 EXP | none local |

### Marker Constants

| Marker | Live constant | Used for |
| ---: | --- | --- |
| `11000801` | `MRKR_NONOLATO` | `SEQ_000`, public fallback for `SEQ_003`, public fallback for `SEQ_004` |
| `11000802` | `MRKR_SEQ003OAPPPESI` | private `SEQ_003` O-App prompt |
| `11000803` | `MRKR_ANAIDJAA` | `SEQ_005` |
| `11000804` | `MRKR_SOILEINE` | `SEQ_015`, public `SEQ_020`, public `SEQ_025` |
| `11000805` | `MRKR_PSHCNJGUILD` | private `SEQ_020` push |
| `11000806` | `MRKR_FYE` | private `SEQ_025` before Fye flag |
| `11000807` | `MRKR_CNJOAPPPESI` | private `SEQ_025` after Fye flag |
| `11000808` | `MRKR_AMPHITHEATRE` | `SEQ_035`, public `SEQ_040`, public `SEQ_045` |
| `11000809` | `MRKR_FYE2` | private `SEQ_040` |
| `11000810` | `MRKR_PSHCUTSCENE` | private `SEQ_045` finale push |

### Recovered Event Method Index

Recovered client methods are in `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man2g0.lua`.

| Method | Recovered payload | Live caller status |
| --- | --- | --- |
| `processEventMiounneStart` | text ids `1,2,3` | Accept/Miounne |
| `processEvent005_2` | text ids `238,239` | unused locally |
| `processEvent007` | text ids `192,193`, cutscene `man1g900` | Nonolato Archer's Guild entry/re-entry |
| `processEvent007_2` | text `246`, `ask(240,2)` with `241 = Yes`, `242 = No`, HQ cutscene `man2g000`, returns `ask(240,2)` | O-App pre-fight prompt; instance only starts if returned result is `1` |
| `processEvent007_2_2` | text `246`, `ask(240,2)` with `241 = Yes`, `242 = No`, fade out/in but no cutscene key | unused locally |
| `processEvent007_3` | text ids `243,244` | unused locally |
| `processEvent010` | cutscene `man2g010` | director kill-success path |
| `processEvent010_2` | text id `278` | optional Miounne in `SEQ_005` |
| `processEvent020` | cutscene `man2g020` | A'naidjaa in `SEQ_005` |
| `processEvent020_2` | text ids `198,199,200` | optional Miounne in `SEQ_015` |
| `processEvent020_3` | text id `274` | unused locally |
| `processEvent030` | text ids `201,202`, cutscene `man2g030` | Soileine Stillglade entry/re-entry |
| `processEvent030_2` through `030_9` | text ids `203,204,205,206,207,208,209,247,248` | Stillglade Fane ambient NPCs |
| `processEvent040` | cutscene `man2g040` | `PSHCJGUILD` push |
| `processEvent040_2` / `040_3` / `040_4` | text ids `211`, `212`, `275` | Fane entrance blockers and O-App before Fye flag |
| `processEvent040_5` / `040_6` | text ids `276`, `277` | unused locally |
| `processEvent045` / `045_2` | text ids `182,183,184` | Fye before/after repeat at Fane entrance |
| `processEvent050` | cutscene `man2g050` | O-App after Fye flag, starts `SEQ_030` |
| `processEvent050_2` | text ids `213,214` | optional Miounne branch in live `onTalk`, but Miounne is not enabled by `SEQ_035` state |
| `processEvent060` | cutscene `man2g060` | Amphitheatre entry/re-entry push |
| `processEvent060_2` through `060_26` | festival bark text ids `249,250,251,252,253,254,255,256,257,216,217,218,219,258,220,259,260,261,262,263,215,221,222,223,224,225,226,227` | amphitheatre private ambience |
| `processEvent070` | cutscene `man2g070` | Fye in amphitheatre private |
| `processEvent070_2` / `070_3` | text ids `138`, `139` | Yda/Papalymo in `SEQ_045` |
| `processEvent080` | cutscenes `man2g080`, `MAN2G090`, `man2g095`, `man2g100` | `PSHSEQ045` finale push; live jumps to `SEQ_060` afterward |
| `processEvent080_01` | says `279` if passed arg `>= 18`, else `280` | Miounne turn-in currently passes literal `1`, so it selects text id `280` |
| `processEvent1000_1` / `1000_2` | text ids `245`, `210` | unused locally |
| `processEventTrial001` / `Trial002` | text ids `267` or `269`, `ask(270,3)` with `271 = Wind`, `272 = Earth`, `273 = Water`, then `268` | unused locally; likely prototype for O-App ward mechanic |

### Data Crosswalk Addenda

| Data slice | Row(s) | Notes |
| --- | --- | --- |
| Quest master | `Data/sql/gamedata_quests.sql:40` | `110008`, `Beckon of the Elementals`, class `Man2g0`, prereq `110007`, level `13` |
| Follow-up dependency | `Data/sql/gamedata_quests.sql:592` | quest `110013` can depend on `110008` |
| Archer's Guild prompt area | `Data/sql/server_zones_privateareas.sql:76`, `Data/sql/server_zones.sql:112` | zone `206`, `PrivateAreaMasterPast`, type `9` |
| Spirit fight area | `Data/sql/server_zones_privateareas.sql:77`, `Data/sql/server_zones.sql:68` | zone `153` / West Shroud, `PrivateAreaMasterPast`, type `1`; current live bridge uses this zone id through `BECKON_COMBAT_ZONE` |
| Later Stillglade/amphitheatre private areas | `Data/sql/server_zones_privateareas.sql:78-80` | zone `206`, types `10`, `11`, `12` |
| Echo forest private area | `Data/sql/server_zones_privateareas.sql:81` | zone `153`, type `2` |
| `SEQ_003` static prompt spawn | `Data/sql/server_eventnpc_spawn_locations.sql:1158-1159` | O-App-Pesi `1000033` in zone `206`, type `9`, plus exit |
| `SEQ_004` static support spawns | `Data/sql/server_eventnpc_spawn_locations.sql:1160-1163`, `1219` | Grinnaux `2290015`, Handeloup `2290016`, T'kebbe `2290017`, O-App variant `1000235`, plus exit |
| Later `man2g0` static groups | `Data/sql/server_eventnpc_spawn_locations.sql:1164-1222` | `SEQ_020`, `SEQ_025`, `SEQ_040`, `SEQ_045` groups and exits |
| Spirit actor class | `Data/sql/gamedata_actor_class.sql:4885` | actor `2105201` -> `/Chara/Npc/Monster/Elemental/ElementalScenarioGridaniaLv20` |
| Spirit mob type | `Data/sql/server_battlenpc_mob_types.sql:611` | BNPC/mob type `1364`, actor `2105201`, display `spirit_of_the_wood`, level `28`, skill list `67` |
| Spirit manual patch | `Data/sql/manual patches/beckon_spirit_of_the_wood.sql:7` | duplicates/supports the mob type row |
| Spirit runtime spawn | `Data/scripts/content/SimpleContentMan2g01.lua:44` and fallback at `:47` | no static `server_battlenpc_spawn_locations` row; content script spawns it dynamically |
| Replay joins | `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutreplay_rows_joined.csv:77-84` | includes `man2g000`, `man2g010`, `man2g070`, `man2g080`, `MAN2G090`, `man2g095`, `man2g100` |
| Asset crosscheck | `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_scene_asset_crosscheck.csv:349-358` | scenes exist in Lua refs, cutReplay, and client cut assets; `MAN2G090` normalizes to `man2g090` |

Remaining static-vs-runtime mismatch: static `SEQ_004` support data uses `OAPPPESI_SEQ004 = 1000235`, but `SimpleContentMan2g01.lua` currently spawns base `OAPPPESI = 1000033`. That should not block the content area from loading, but it can matter for post-load presentation or event routing.

### Runtime Probe Map

The current instance entry chain is:

```text
O-App onTalk -> processEvent007_2 -> returned result == 1
  -> doSEQ004CombatInstance
  -> GetArea(153)
  -> CreateContentArea(..., "SimpleContentMan2g01", "Quest/QuestDirectorMan2g001")
  -> PrivateAreaContent constructor calls SimpleContentMan2g01.onCreate
  -> AddDirector / StartDirector / SetLoginDirector
  -> DoZoneChangeContent
```

The content success chain is:

```text
SimpleContentMan2g01.onCreate
  -> boundary line
  -> SpawnAlly 2290015 / 2290016 / 2290017
  -> SpawnActor O-App 1000033
  -> SpawnEnemyWithMobType actor 2105201, mob type 1364, unique man2g0_spirit_of_the_wood
  -> add player/director/NPCs/enemy as director members
  -> StartContentGroup
```

The fight completion chain is:

```text
BattleNpc.Die -> player.HandleBNpcKill(GetActorClassId())
  -> director onKillBNpc receives 2105201
  -> kickEventContinue(director, "noticeEvent")
  -> processEvent010 / man2g010
  -> StartSequence(SEQ_005)
  -> ContentFinished()
  -> DoZoneChange zone 206 post-fight coords
```
