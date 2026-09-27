# Quest 110015 (man300.lua)
Source: FF14-Memory/Data/scripts/quests/man/man300.lua (529 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0
SEQ_010 = 10
SEQ_015 = 15
SEQ_020 = 20
SEQ_025 = 25
SEQ_030 = 30
SEQ_035 = 35
```

## NPCs/Actors
```
MINFILIA = 1000843
TATARU = 1001046
HEDYN = 1001047
SHANGA_MESHANGA = 1001048
TROXIA = 1001049
NANANOBY = 1001050
ALMXIO = 1001085
ZOXIO = 1001086
CLIAUX = 1001381
CENMIN = 1001382
MEMEZOFU = 1001384
DILUXIO = 1001178
LANXIO = 1001179
ZEXIA = 1001387
GRIDANIA_MARKET_ENTRANCE = 1090264
DRYBONE_LINKPEARL_TRIGGER = 1090241
DRYBONE_MESA_TRIGGER = 1090178
```

## Markers
```
local MRKR_GRIDANIA_MARKET = 11001501
local MRKR_HEDYN = 11001502
local MRKR_CAMP_DRYBONE = 11001503
local MRKR_PATH_LINKPEARL = 11001504
local MRKR_MESA_ENTRANCE = 11001505
local MRKR_NANANOBY = 11001506
local MRKR_HEDYN_REPORT = 11001507
```

## Flags/Counters
```
local CNTR_DRYBONE_LINKPEARL = 0
```

## Dialog branches / handlers
```
function startMan300Content(player, quest)
function startMan300ContentTest(player, quest)
function startMan300BattleTest(player, quest)
function startMan300ParleyTest(player, quest)
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function onPush(player, quest, npc)
function onNpcLS(player, quest, from, msgStep)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
--   Cliaux   -> processEvent010_5 / processEvent050_6
--   Cenmin   -> processEvent010_4 / processEvent050_5
--   Memezofu -> processEvent010_2 / processEvent050_3
--   Diluxio  -> processEvent020_3 / processEvent050_8
--   Lanxio   -> processEvent020_4 / processEvent050_9
--   Zexia    -> processEvent020_7 / processEvent050_12
-- route incorrectly delegated Zexia's processEvent020_7 from Troxia and
scenarioHelpers.delegateEvent(player, quest, "processEvent000")
local accepted = scenarioHelpers.delegateEvent(
scenarioHelpers.delegateEvent(
"processEvent005_8",
scenarioHelpers.delegateEvent(player, quest, "processEvent010_2")
scenarioHelpers.delegateEvent(player, quest, "processEvent010_4")
scenarioHelpers.delegateEvent(player, quest, "processEvent010_5")
scenarioHelpers.delegateEvent(player, quest, "processEvent022_1")
-- The archive explicitly names Shanga Meshanga as processEvent020_2's
scenarioHelpers.delegateEvent(player, quest, "processEvent020_2")
scenarioHelpers.delegateEvent(player, quest, "processEvent020_3") -- Wants to return to the Grove.
scenarioHelpers.delegateEvent(player, quest, "processEvent020_4") -- Marvels at the walking ones' grove.
scenarioHelpers.delegateEvent(player, quest, "processEvent020_7")
scenarioHelpers.delegateEvent(player, quest, "processEvent040_2")
scenarioHelpers.delegateEvent(player, quest, "processEvent050_3")
scenarioHelpers.delegateEvent(player, quest, "processEvent050_5")
scenarioHelpers.delegateEvent(player, quest, "processEvent050_6")
scenarioHelpers.delegateEvent(player, quest, "processEvent050_8")
scenarioHelpers.delegateEvent(player, quest, "processEvent050_9")
scenarioHelpers.delegateEvent(player, quest, "processEvent050_12")
scenarioHelpers.delegateEvent(player, quest, "processEvent010")
```

## Items / rewards
```
quest:SetENpc(HEDYN, QFLAG_REWARD)
```

## Instance entry/exit
```
MAN300_CONTENT_DIRECTOR = "Quest/QuestDirectorMan30001"
MAN300_CONTENT_ZONE = 171
MAN300_PRIVATE_AREA = "PrivateAreaMasterPast"
MAN300_ENTRY_X = 1001.755
MAN300_ENTRY_Y = 252.750
MAN300_ENTRY_Z = -280.197
MAN300_RETURN_X = 1034.830
MAN300_RETURN_Y = 251.660
MAN300_RETURN_Z = -269.040
MAN300_HEDYN_RETURN_ZONE = 160
MAN300_HEDYN_RETURN_X = -143.258
MAN300_HEDYN_RETURN_Y = 1.015
MAN300_HEDYN_RETURN_Z = -160.029
local targetArea = GetWorldManager():GetArea(MAN300_CONTENT_ZONE, MAN300_PRIVATE_AREA, MAN300_PRIVATE_TYPE)
return false, "Missing Toll of the Warden private area 171/PrivateAreaMasterPast/1. Reload the private-area SQL and restart the map server."
local director = targetArea:TryCreateExclusiveQuestDirector(player, MAN300_CONTENT_DIRECTOR, (coroutine.running()))
MAN300_CONTENT_ZONE,
MAN300_ENTRY_X + ((index - 1) * 1.5),
MAN300_ENTRY_Y,
MAN300_ENTRY_Z + ((index - 1) * 1.0),
MAN300_HEDYN_RETURN_ZONE,
MAN300_HEDYN_RETURN_X,
MAN300_HEDYN_RETURN_Y,
MAN300_HEDYN_RETURN_Z,
MAN300_HEDYN_RETURN_ZONE,
MAN300_HEDYN_RETURN_X,
MAN300_HEDYN_RETURN_Y,
MAN300_HEDYN_RETURN_Z,
```

## Parley
```
HP, retreats briefly, and despawns instead of dying. The alternative Parley
-- Disciples of the Hand and Land to use Parley instead of the combat route.
function startMan300ParleyTest(player, quest)
-- Parley and combat are two solutions to the same SEQ_030 encounter. This
-- to each peaceful representative before selecting the Parley command.
-- Criticizes the player's failed negotiations and lack of language study.
-- Wonders whether peaceful negotiations should continue.
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110015, 'Toll of the Warden', 'Man300', 110014, 30)
REWARDS:
(110015, 1, 'Gil', 1000001, 90000, 0, 'dat-new', 1),
(110015, 2, 'Exp', 0, 19000, 0, 'wiki', 1),
```


