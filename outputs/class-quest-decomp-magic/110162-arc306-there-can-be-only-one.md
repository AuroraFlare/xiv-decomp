# 110162 There Can Be Only One — `arc306` (Phase 3 MAGIC)

- Class: ARC 7 | Level: 36 | SQL prereq: 110161 | SQL code: `Arc306`
- Availability: **ENABLED** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/arc/arc306.lua` (356 lines, custom-script)
- Config: class_quest_template.lua:Arc306

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Sequence flow (VERIFIED: custom script + validator PASS; wiki §31)
NonolatoStart → ask phase seq0: 6 optional informant hints (005_2-005_7; 005_8 unbound) + Sorrel Haven Keelty find `010` (escape choice cutscene-internal, no gate) → escape duty seq6 → return seq7 → duel-trigger push `020` → duel seq8 → aftermath push `030` (seq10) → Keelty@Hold `040` (seq15) → Nonolato `050`+EXP (seq20).
## Delegate events
Wired: NonolatoStart/005_2-005_7/010/020/030/040/050. Unbound: 005_8, 010_2, 040_2-040_8.
## Actors/markers
Proximity-disambiguated Keelty; triggers 1090199 uniqueIds (SQL rows 3325/3326 present). Markers 11016201-06 live; 11016207-20 filler.
## Mob profiles + spawn evidence (VERIFIED SQL)
Escape: 4x Yarzon Stalker 2205506/3140 Lv.36 (kills never win: requireAllTargets=false/requiredKills=999; either exit wins). Duel: Siward 2289016/32749 Lv.36 sole target; 3 optional Yarzons outside kill ledger. Battle-ally candidate 2290032 never spawned (INFERRED omission, walkthrough-backed).
## Rewards
EXP 4720 script; gil 36000 + marks x3600 central; no item.
## Instance-battle surface
Needed: escape + duel duties (exist: QuestDirectorClassArc306Escape/Duel). Existing: full. INFERRED: exit transforms, Yarzon counts, boundary 200.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x36000 (src wiki)
- Currency 1000106 x3600 (src dat-old)

## Mob profiles + spawn evidence
- mobType 3140: `(3140, 2205506, 'yarzon_stalker', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 8, 36, 36, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1, 1, 1, 1, 5063, 0, 0),`
- mobType 32749: `(32749, 2289016, 'siward', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 36, 36, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 15, 0, 0);`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Arc306 = {
        id = 110162,
        title = "There Can Be Only One",
        level = 36,
        classId = 7,
        actor = 1000463,
        offerActor = 1000463,
        rewardActor = 1000463,
        noOffer = true,
        marker = 11016201,
        rewardMarkers = {11016205},
        exp = 0,
        documentedPrerequisite = 110161,
        documentedJournalStates = {
            {sequence = 0, objective = "question the Archer Guild about missing Keelty"},
            {sequence = 5, objective = "find Keelty near Sorrel Haven; flee and keep silent"},
            {sequence = 7, objective = "escape past feral beasts, then return for Keelty"},
            {sequence = 10, objective = "defeat Keelty's assassin"},
            {sequence = 15, objective = "leave Keelty with the conjurer and return to Quiver's Hold"},
            {sequence = 20, objective = "speak with Keelty, then report to Nonolato"},
        },
        documentedOffer = {actor = 1000463, displayId = 1400007, event = "processEventNonolatoStart", duplicateRecoveredQuestInformationCall = true},
        documentedRoute = {
            {marker = 11016201, displayId = 4000257, event = "processEvent010", scene = "arc30610", sceneArg = 1, afterWarp = true, mapRegion = 103, mapArea = 301, x = -412.367004, z = -445.510010, role = "Keelty/Sorrel Haven discovery and escape choice", triggerActorUnresolved = true},
            {marker = 11016202, displayId = 4000257, event = "processEvent020", scene = "arc30620", sceneArg = 1, afterWarp = true, mapRegion = 103, mapArea = 301, x = -412.367004, z = -445.510010, role = "post-escape return to Keelty", triggerActorUnresolved = true},
            {marker = 11016203, displayId = 4000257, event = "processEvent030", scene = "arc30630", sceneArg = 1, afterWarp = true, mapRegion = 103, mapArea = 321, x = 226.949997, z = -1265.000000, role = "Siward-fight aftermath", triggerActorUnresolved = true},
            {actor = 1000587, marker = 11016204, displayId = 1100199, event = "processEvent040", scene = "arc30640", sceneArg = 1, afterWarp = true, mapRegion = 103, mapArea = 321, x = 261.380005, z = -1264.699951, role = "Keelty confession"},
            {actor = 1000463, marker = 11016205, displayId = 1400007, event = "processEvent050", scene = "arc30650", sceneArg = 1, mapRegion = 103, mapArea = 321, x = 232.880005, z = -1268.939941, role = "Nonolato final report/reward", reward = true},
            {marker = 11016206, displayId = 4000257, mapRegion = 103, mapArea = 301, x = -383.130005, z = -542.289978, role = "escape/encounter geography", exactRoleUnresolved = true},
        },
        documentedArcherInformantCandidates = {1000625, 1000626, 1000829, 1000830, 1000831, 1000832},
        documentedUnboundTalkEvents = {
            "processEvent005_2", "processEvent005_3", "processEvent005_4", "processEvent005_5", "processEvent005_6", "processEvent005_7", "processEvent005_8",
            "processEvent010_2", "processEvent040_2", "processEvent040_3", "processEvent040_4", "processEvent040_5", "processEvent040_6", "processEvent040_7", "processEvent040_8",
        },
        documentedAsk = {scene = "arc30610", textId = 51, optionTextIds = {52, 53}, cutsceneInternal = true, noRequiredResult = true},
        documentedBattle = {
            directorClasses = {"QuestDirectorArc30601", "QuestDirectorArc30602"},
            first = {
                narrativeMechanic = "escape the Yarzons toward Gridania or Sorrel Haven",
                markerCandidate = 11016206,
                killingYarzonsIsNotRequired = true,
                targetActorsUnresolved = true,
                exactCountUnresolved = true,
                endpointAndFailureUnresolved = true,
            },
            second = {
                targetName = "Siward",
                cinematicActorClass = 1000588,
                candidateBattleActorClasses = {2289016, 2289017, 2289018},
                primaryTargetCount = 1,
                victoryRequiresSiwardDefeat = true,
                yarzonsSpawnOutsideAggroRange = true,
                yarzonsNotRequiredForVictory = true,
                yarzonsMayAttackSiward = true,
                exactActorSelectionUnresolved = true,
            },
            keeltyActor = 1000587,
            keeltyBattleAllyCandidate = 2290032,
            aftermathConjurerActor = 1000594,
            cinematicYarzonProxy = 1001266,
            mobTypesUnresolved = true,
            levelsUnresolved = true,
            skillsUnresolved = true,
            wavesUnresolved = true,
            partyLimitUnresolved = true,
            failureRetryCleanupUnresolved = true,
            recoveredDirectorsEmpty = true,
        },
        documentedRewardCandidates = {
            gil = 36000,
            expAtLevel36Maximum = 4720,
            legacyGuildMarks = {item = 1000106, count = 3600, supersededByPatch120 = true},
            encodedReward = {type = -13, value = 8, classId = 7},
            staleJournalGil = 400,
            noItemRewardProven = true,
        },
        documentedContaminatedMarkerRange = {11016207, 11016220},
        todo = "Implemented/enabled: Nonolato offer -> optional informant hints + Sorrel Haven find -> Yarzon escape duty (either exit wins, kills never win) -> return CS -> Siward duel (Siward only, Yarzons optional) -> Hold aftermath -> Keelty confession -> Nonolato reward. Custom script at Data/scripts/quests/arc/arc306.lua (outside the generic driver). Escape exits/Y, Yarzon counts, spawn offsets, party cap 3, Sorrel/duel Y, and the 005_8/010_2/040_2-8 owners are documented reconstructions; the battle-ally candidate stays unspawned. Markers 11016207-20 stay rejected filler.",
    }
```

## Lua header (verbatim)
```lua
require ("global")
require ("quest")
require ("private_quest_battle")

--[[

Quest Script

Name: 	There Can Be Only One
Code: 	Arc306
Id: 	110162
Prereq: Level 36, Archer

Retail flow, from the decompiled client scenario
(tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/arc/arc306.lua),
the DAT quest markers, and the 1.0 walkthrough: Nonolato offer
(processEventNonolatoStart) -> optional archer-informant hints
(processEvent005_2..005_7) and the Sorrel Haven find
(processEvent010, whose escape choice is cutscene-internal with no
result gate) -> Yarzon escape duty toward Gridania or Sorrel Haven
(no kills required; reaching either exit wins) -> return to 26-33
(processEvent020) -> Siward duel (only Siward's defeat ends the
fight; nearby Yarzons are optional and may turn on him) -> Quiver's
Hold aftermath (processEvent030) -> Keelty confession
(processEvent040) -> Nonolato reward (processEvent050). No chocobo
callback or actor is used anywhere in this quest.

Map Markers (DAT quest_marker rows; 11016207-11016220 are filler)
11016201,Sorrel Haven find,-412.37,-445.51,4000257,Central Shroud
11016202,Post-escape return,-412.37,-445.51,4000257,Central Shroud
11016203,Aftermath,226.95,-1265.00,4000257,Gridania
11016204,Keelty confession,261.38,-1264.70,1100199,Gridania
11016205,Nonolato reward,232.88,-1268.94,1400007,Gridania
11016206,Escape/duel geography,-383.13,-542.29,4000257,Central Shroud

The duel trigger sits on marker 11016206 in the same 26-33 cell as the
find; the escape exits are documented reconstructions (south toward
Gridania, north-east toward Sorrel Haven). The Sorrel/duel Y follows
the nearest catalog floor and is flagged until a live capture lands.
Keelty shares actor class 1000587 between the field find and the
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.