# 110102 Captain's Orders — `exc306` (Phase 3 MAGIC)

- Class: MRD 4 | Level: 36 | SQL prereq: 0 | SQL code: `Exc306`
- Availability: **ENABLED** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/exc/exc306.lua` (420 lines, custom-script)
- Config: class_quest_template.lua:Exc306

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Sequence flow (VERIFIED: custom script + validator PASS; wiki §28; pack reference implementation)
WaekbyrtStart → quarters-door push → survival duty seq1 (QuestDirectorClassExc306Survival, zone-230 private copy, Moenskaet 2289004/32743 Lv.40; survive 300s, early kill also advances; death/timeout/disconnect retry at door) → warehouse interlude seq2 (barrel spawns in-instance beside player — marker 11010202 has no Limsa ground; exc30620 grants Kraken Register 11000132 once; full inventory holds step) → Waekbyrt `035` → lounge trigger `040` → deck oath `050` (register kept) → Waekbyrt routing talk → rematch doors → rematch seq26 (2289005/32744 Lv.36 + hands 2280219/32745 + 2280220/32746 Lv.34, require-all; register consumed defensively; missing item never fails) → Rostnsthal `060` + Echo `070` (ask 51030; 0 holds, nil advances) → Waekbyrt `080`+EXP 4720.
## Delegate events
Wired: WaekbyrtStart/010/020/035/040/050/060/070/080. Unbound: 030/033/000/111/112.
## Actors/markers
Waekbyrt 1000003; Rostnsthal 1001652; triggers 1090199 uniqueIds (SQL rows 3317/3318 present). Markers 11010201-11 live (01/07 = upstairs-door exact match; 04 = push_mrd exact match; 10/11 downstairs-probable); 11010212-20 filler.
## Mob profiles + spawn evidence (VERIFIED SQL)
32743/2289004, 32744/2289005, 32745/2280219, 32746/2280220 (skill 15). INFERRED: warehouse geography, offsets, party 3, survival levels.
## Rewards
EXP 4720 script; gil 36000 + marks 1000103x3600 central.
## Instance-battle surface
Needed: survival + rematch duties (exist). Existing: full.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x36000 (src wiki)
- Currency 1000103 x3600 (src dat-old)

## Mob profiles + spawn evidence
- mobType 32744: `(32744, 2289005, 'moenskaet_rematch', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 36, 36, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 15, 0, 0),`
- mobType 32745: `(32745, 2280219, 'moenskaets_right_hand', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 34, 34, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 15, 0, 0),`
- mobType 32746: `(32746, 2280220, 'moenskaets_left_hand', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 34, 34, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 15, 0, 0),`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Exc306 = {
        id = 110102,
        title = "Captain's Orders",
        level = 36,
        classId = 4,
        actor = 1000003,
        offerActor = 1000003,
        rewardActor = 1000003,
        noOffer = true,
        marker = 11010201,
        rewardMarkers = {11010209},
        exp = 4720,
        documentedPrerequisite = 110101,
        documentedMarkerRoute = {
            {marker = 11010201, displayId = 4000257, mapRegion = 101, mapArea = 121, x = -779.199097, z = 386.500000, role = "captain's-quarters entry", waypointTrigger = "push_mrd_outside_upstairs_door (1090097, exact coordinate match)"},
            {marker = 11010202, displayId = 4000257, mapRegion = 101, mapArea = 121, x = 603.580017, z = 627.710022, role = "cargo-hold recovery"},
            {marker = 11010203, displayId = 1600150, actor = 1001652, mapRegion = 101, mapArea = 121, x = -784.809998, z = 386.609985},
            {marker = 11010204, displayId = 4000257, mapRegion = 101, mapArea = 121, x = -753.289978, z = 368.390015, role = "guild-door waypoint (pre-existing push_mrd trigger 1090026, exact coordinate match)"},
            {marker = 11010205, displayId = 1600217, actor = 1000003, mapRegion = 101, mapArea = 121, x = -752.530029, z = 382.140015},
            {marker = 11010206, displayId = 4000257, mapRegion = 101, mapArea = 121, x = -772.359985, z = 387.799988, role = "Astalicia lounge/deck transition"},
            {marker = 11010207, displayId = 4000257, mapRegion = 101, mapArea = 121, x = -779.199097, z = 386.500000, role = "captain's-quarters rematch entry", waypointTrigger = "push_mrd_outside_upstairs_door (1090097, exact coordinate match)"},
            {marker = 11010208, displayId = 1600150, actor = 1001652, mapRegion = 101, mapArea = 121, x = -784.809998, z = 386.609985},
            {marker = 11010209, displayId = 1600217, actor = 1000003, mapRegion = 101, mapArea = 121, x = -752.530029, z = 382.140015, reward = true},
            {marker = 11010210, displayId = 4000257, mapRegion = 101, mapArea = 121, x = -752.000000, z = 391.000000, roleUnresolved = true, proximityNote = "within 0.3m of push_mrd_downstairs_door1 (1090100); waypoint mapping probable but not exact"},
            {marker = 11010211, displayId = 4000257, mapRegion = 101, mapArea = 121, x = -752.000000, z = 382.000000, roleUnresolved = true, proximityNote = "within 0.3m of push_mrd_downstairs_door2 (1090101); waypoint mapping probable but not exact"},
        },
        documentedSceneFlow = {
            {event = "processEvent010", scene = "exc30610", sceneArg = 1, afterWarp = true, role = "unwinnable first attack and forced relocation"},
            {event = "processEvent020", scene = "exc30620", sceneArg = 1, afterWarp = true, role = "cargo-hold/Rostnsthal recovery"},
            {event = "processEvent030", scene = "exc30630", sceneArg = 1, afterWarp = true},
            {event = "processEvent033", role = "Rostnsthal tells the player to return"},
            {event = "processEvent035", role = "Waekbyrt warns the captain is still looking"},
            {event = "processEvent040", scene = "exc30640", sceneArg = 1, afterWarp = true, role = "lounge confrontation"},
            {event = "processEvent050", scene = "exc30650", sceneArg = 1, conditionalAfterWarpArgument = true, role = "deck oath and register handoff"},
            {event = "processEvent060", scene = "exc30660", sceneArg = 1, afterWarp = true, role = "post-rematch/Rostnsthal report"},
            {event = "processEvent070", scene = "exc30670", sceneArg = 1, ask = 51030, requiredResult = 1, role = "Echo into Rostnsthal's past"},
            {event = "processEvent080", role = "Waekbyrt final report/reward"},
        },
        documentedItemObjective = {
            itemId = 11000132,
            displayName = "Kraken Register",
            count = 1,
            visibleStates = {40, 50},
            grantOwnerUnresolved = true,
            battleDropOrConsumeOwnerUnresolved = true,
        },
        documentedBattle = {
            journalBoss = "Moenskaet the Honorbound",
            journalAdds = "his men",
            bossActorCandidates = {2289004, 2289005},
            rightHandCandidate = 2280219,
            leftHandCandidate = 2280220,
            sceneActorCandidates = {1000489, 1000885, 1000886},
            exactBossActorUnresolved = true,
            addCountUnresolved = true,
            profilesUnresolved = true,
            skillsUnresolved = true,
            wavesUnresolved = true,
            partyLimitUnresolved = true,
            firstLossStateMachineUnresolved = true,
        },
        documentedUnboundEvents = {"processEvent000", "processEvent111", "processEvent112"},
        documentedGil = 36000,
        documentedLegacyGuildMarks = {item = 1000103, count = 3600},
        documentedRewardAlternates = {{gil = 28800, marks = 2880}, {gil = 25200, marks = 2520}, {encodedRewardType = -13, encodedRewardValue = 8}},
        documentedContaminatedMarkerRange = {11010212, 11010220},
        todo = "Implemented/enabled: Waekbyrt offer -> quarters door -> survival duty (Moenskaet, 300s) -> warehouse barrel interlude (Kraken Register grant) -> Waekbyrt warning -> lounge confrontation -> deck oath -> rematch duty (Moenskaet + both hands, register consumed) -> Rostnsthal report + Echo -> Waekbyrt reward. Custom script at Data/scripts/quests/exc/exc306.lua (outside the generic driver). Warehouse geography, spawn offsets, party cap 3, levels/skills, and the 030/033/000/111/112 owners are documented reconstructions. Markers 11010212-20 stay rejected filler.",
    }
```

## Lua header (verbatim)
```lua
require ("global")
require ("quest")
require ("private_quest_battle")

--[[

Quest Script

Name: 	Captain's Orders
Code: 	Exc306
Id: 	110102
Prereq: Level 36, Marauder

Retail flow, from the decompiled client scenario
(tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/exc/exc306.lua),
the DAT quest markers, and the 1.0 walkthrough: Waekbyrt offer
(processEventWaekbyrtStart) -> captain's-quarters door -> unwinnable
first attack against Moenskaet the Honorbound (survive 300s, not a
kill race; death retries at the door) -> cargo-hold recovery (rum
barrel, Rostnsthal, Kraken Register grant) -> Waekbyrt warning
(processEvent035) -> lounge confrontation (processEvent040) -> deck
oath and register handoff (processEvent050) -> Waekbyrt routing talk ->
rematch doors -> winning rematch against Moenskaet and his right/left
hands (all three must fall; the carried register falls out of the pack
and is consumed) -> Rostnsthal report (processEvent060) and Echo into
his past (processEvent070, ask 51030 result gate) -> Waekbyrt reward
(processEvent080). No chocobo callback or actor is used anywhere in
this quest.

Map Markers (DAT quest_marker rows; 11010212-11010220 are filler)
11010201,Captain's-quarters entry,-779.20,386.50,4000257,Limsa Lominsa
11010202,Cargo-hold recovery,603.58,627.71,4000257,Limsa Lominsa
11010203,Rostnsthal deck talk,-784.81,386.61,1600150,Limsa Lominsa
11010204,Guild-door waypoint,-753.29,368.39,4000257,Limsa Lominsa
11010205,Waekbyrt talks,-752.53,382.14,1600217,Limsa Lominsa
11010206,Lounge trigger,-772.36,387.80,4000257,Limsa Lominsa
11010207,Rematch entry,-779.20,386.50,4000257,Limsa Lominsa
11010208,Rostnsthal report,-784.81,386.61,1600150,Limsa Lominsa
11010209,Waekbyrt reward,-752.53,382.14,1600217,Limsa Lominsa
11010210,Downstairs-waypoint candidate,-752.00,391.00,4000257,Limsa Lominsa
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.