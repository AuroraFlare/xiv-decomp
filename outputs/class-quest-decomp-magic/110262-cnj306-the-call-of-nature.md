# 110262 The Call of Nature — `cnj306` (Phase 3 MAGIC)

- Class: CNJ 23 | Level: 36 | SQL prereq: 110261 | SQL code: `Cnj306`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/cnj/cnj306.lua` (339 lines, custom-script)
- Config: class_quest_template.lua:Cnj306

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Sequence flow (VERIFIED: custom script; wiki §40 event list matches 010/020/025/030/040/045/050/060/070/080/090/095)
SoileineStart → Ingram 1000372 `010` + Mysterious Leather Bag 11000101 grant-once (seq0→5) → Amberscale Morys `020` + ask `025` result-1 advances (seq5→15) → Emerald Moss Morys `030` opens escort duty (seq15→16) → escort aftermath `040` (seq25) → unconscious-Morys Echo `045` gate + `050` warp (seq25→30) → cave-edge trigger push opens Echo defense seq31 (preEvent `060`) → Ingram `080` + bag return consume (seq40→45) → Soileine `095`+EXP (seq45).
## Delegate events
Wired set above; unbound: 005_2-005_12, 010_2-010_4, 030_2-030_3, 070_2-070_10 (no owners).
## Actors/markers
Soileine 1000234; Ingram 1000372; Morys 1000505 / young 1000506 / content 2290033; cave trigger 1000174; SQL trigger rows 3302-3306 present. Markers 11026201-08 live; 11026209-20 filler.
## Mob profiles + spawn evidence (VERIFIED SQL)
Echo defense: exactly 3x Hungry Dreadwolf 2201412/3145 Lv.36 (2201423 same-name alternate unresolved). Escort: Yarzon Stalker ambushes + Furline Mosstrooper clearing; Morys HP-0/distance fails (native route semantics, 69 authored nodes).
## Rewards
EXP 4720 script; gil 36000 + marks 1000111x3600 central; no gear.
## Instance-battle surface
Needed: escort duty (exists: QuestDirectorCnj306Escort + SimpleContentCnj306Escort) + Echo defense (exists: QuestDirectorCnj306Echo). Existing: full. INFERRED: escort path/copies, Dreadwolf actor choice.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x36000 (src wiki)
- Currency 1000111 x3600 (src dat-old)

## Mob profiles + spawn evidence
- mobType 3145: `(3145, 2201412, 'hungry_dreadwolf', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 2, 36, 36, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 0.75, 4, 5062, 0, 0);`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Cnj306 = {
        id = 110262,
        title = "The Call of Nature",
        level = 36,
        classId = 23,
        actor = 1000234,
        offerActor = 1000234,
        rewardActor = 1000234,
        noOffer = true,
        marker = 11026201,
        rewardMarkers = {11026208},
        exp = 4720,
        documentedPrerequisite = 110261,
        documentedOffer = {actor = 1000234, displayId = 1300064, event = "processEventSoileineStart", duplicateRecoveredQuestInformationCall = true},
        documentedJournalStates = {
            {sequence = 0, objective = "speak with Ingram and learn to hear the elementals"},
            {sequence = 5, objective = "carry the Mysterious Leather Bag to the former elemental-voice site"},
            {sequence = 15, objective = "meet Morys at Camp Emerald Moss for the Ishgard journey"},
            {sequence = 20, objective = "search for Morys after the forest voice makes him vanish"},
            {sequence = 25, objective = "use the Echo on unconscious Morys beside three elementals"},
            {sequence = 30, objective = "follow the Hungry Dreadwolf pack into the cave after the burst of fire"},
            {sequence = 35, objective = "defeat every Hungry Dreadwolf and save the child"},
            {sequence = 40, objective = "report Morys's wildling past to Ingram"},
            {sequence = 45, objective = "return the bag and report to Soileine"},
        },
        documentedMarkerRoute = {
            {sequence = 0, actor = 1000372, marker = 11026201, displayId = 1000141, event = "processEvent010", scene = "cnj30610", sceneArg = 1, mapRegion = 103, mapArea = 321, x = -346.000000, z = -1705.000000, role = "Ingram briefing/item grant"},
            {sequence = 5, actorCandidates = {1000505, 1000506, 2290033}, marker = 11026202, displayId = 4000257, event = "processEvent020", scene = "cnj30620", sceneArg = 1, followupEvent = "processEvent025", ask = 50, requiredResult = 1, repeatedRecoveredAskCall = true, mapRegion = 103, mapArea = 301, x = -543.789978, z = -511.350006, role = "Amberscale Rock/Morys escort request"},
            {sequence = 15, actorCandidates = {1000505, 1000506, 2290033}, marker = 11026203, displayId = 4000257, event = "processEvent030", scene = "cnj30630", sceneArg = 1, mapRegion = 103, mapArea = 303, x = -1067.000000, z = -1765.000000, role = "Camp Emerald Moss escort launch"},
            {sequence = 20, actorCandidates = {1000505, 1000506, 2290033}, marker = 11026204, displayId = 4000257, event = "processEvent040", scene = "cnj30640", sceneArg = 1, afterWarp = true, mapRegion = 103, mapArea = 301, x = -543.789978, z = -511.350006, role = "escort aftermath/Morys disappearance"},
            {sequence = 25, actorCandidates = {1000505, 1000506, 2290033}, marker = 11026205, displayId = 1000175, event = "processEvent045", ask = 51030, requiredResult = 1, repeatedRecoveredAskCall = true, followupEvent = "processEvent050", followupScene = "cnj30650", followupSceneArg = 1, followupAfterWarp = true, mapRegion = 103, mapArea = 301, x = -583.000000, z = -440.000000, role = "unconscious Morys/Echo gate"},
            {sequence = 30, marker = 11026206, displayId = 4000257, event = "processEvent060", scene = "cnj30660", sceneArg = 1, afterWarp = true, battleAftermathEvent = "processEvent070", battleAftermathScene = "cnj30670", battleAftermathAfterWarp = true, mapRegion = 103, mapArea = 301, x = -580.000000, z = -444.000000, role = "Echo cave/three-Dreadwolf battle"},
            {sequence = 40, actor = 1000372, marker = 11026207, displayId = 1000141, event = "processEvent080", scene = "cnj30680", sceneArg = 1, mapRegion = 103, mapArea = 321, x = -346.000000, z = -1705.000000, role = "Ingram report/bag return"},
            {sequence = 45, actor = 1000234, marker = 11026208, displayId = 1300064, eventVariants = {"processEvent090", "processEvent095"}, scene = "cnj30690", sceneArg = 1, afterWarpVariant = "processEvent090", defaultFadeRewardVariant = "processEvent095", mapRegion = 103, mapArea = 321, x = -331.000000, z = -1683.000000, role = "Soileine final report/reward", reward = true},
        },
        documentedQuestItem = {
            itemId = 11000101,
            displayName = "Mysterious Leather Bag",
            grantedBy = 1000372,
            grantSequence = 5,
            journalVisibleThroughSequence = 45,
            returnedTo = 1000372,
            grantConsumeOwnerUnresolved = true,
        },
        documentedBattle = {
            directorClasses = {"QuestDirectorCnj30601", "QuestDirectorCnj30602"},
            escort = {
                protectedName = "Morys",
                protectedActorCandidates = {1000505, 1000506, 2290033},
                battleAllyCandidate = 2290033,
                yarzonStalkerActorCandidate = 2205506,
                furlineMosstrooperActorCandidates = {2280158, 2280159, 2280160, 2280161, 2280162, 2280163},
                yarzonCopiesUnresolved = true,
                furlineCopiesUnresolved = true,
                furlineGroupSpawnsTogetherAtClearing = true,
                morysHpZeroFailsDuty = true,
                excessiveDistanceFromMorysFailsDuty = true,
                successRequiresReachingClearingAndDefeatingFurlineGroup = true,
                pathAndEndpointUnresolved = true,
            },
            echoDefense = {
                protectedName = "Morys/young Morys",
                exactProtectedActorUnresolved = true,
                targetName = "Hungry Dreadwolf",
                primaryTargetCount = 3,
                strongestActorCandidate = 2201412,
                alternateSameNameActor = 2201423,
                exactActorSelectionUnresolved = true,
                candidateGuildleveMobType = 9201412,
                candidateWolfSkillList = 69,
                guildleveProfileIsNotQuestProfile = true,
                aoeCanDrawAggroFromMorys = true,
            },
            preEchoElementalCount = 3,
            spiritOfTheWoodActorCandidate = 2205201,

```

## Lua header (verbatim)
```lua
require ("global")
require ("quest")
require ("private_quest_battle")

--[[

Quest Script

Name: 	The Call of Nature
Code: 	Cnj306
Id: 	110262
Prereq: Good Knight, Sweet Dreams (Cnj300 - 110261, documented only; the
        server does not gate class-quest offers on prerequisites)

The generic class driver has neither an escort state nor a second battle
node, so this quest is a custom script.  Retail flow, from the decompiled
client scenario plus the 1.0 walkthrough: Soileine offer -> Ingram
briefing and Mysterious Leather Bag grant -> Amberscale Morys escort
request (ask gate) -> Camp Emerald Moss escort duty (Yarzon Stalker
ambushes plus a Furline Mosstrooper clearing; Morys HP-0 or excessive
distance fails) -> Amberscale aftermath -> unconscious-Morys Echo gate ->
Echo-cave defense against exactly three Hungry Dreadwolves -> Ingram
report and bag return -> Soileine reward.  No chocobo callback or actor
is used anywhere in this quest.

Map Markers (DAT quest_marker rows; 11026209-11026220 are filler)
11026201,Soileine/Ingram briefing,-346,-1705,1000141,Stillglade Fane
11026202,Amberscale escort request,-543.79,-511.35,4000257,Central Shroud
11026203,Camp Emerald Moss launch,-1067,-1765,4000257,North Shroud
11026204,Amberscale aftermath,-543.79,-511.35,4000257,Central Shroud
11026205,Unconscious Morys/Echo,-583,-440,1000175,Central Shroud
11026206,Echo cave edge,-580,-444,4000257,Central Shroud
11026207,Ingram report,-346,-1705,1000141,Stillglade Fane
11026208,Soileine reward,-331,-1683,1300064,Stillglade Fane

]]

-- Sequence Numbers (retail journal states; 16/31 are internal duty states)
CNJ306_SEQ_BRIEF = 0;   -- Speak with Ingram, take the leather bag
CNJ306_SEQ_REQUEST = 5; -- Morys escort request at Amberscale Rock
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.