# 110161 The Foreboding Forest — `arc300` (Phase 3 MAGIC)

- Class: ARC 7 | Level: 30 | SQL prereq: 110160 | SQL code: `Arc300`
- Availability: **ENABLED** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/arc/arc300.lua` (324 lines, custom-script)
- Config: class_quest_template.lua:Arc300

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Sequence flow (VERIFIED: custom script + validator PASS; decomp scenario; DAT markers; wiki §30)
NonolatoStart → Keelty@Hold `010` (seq0) → Owl-gate push `arc300_owl_gate` `015` (seq5) → Vairemont 1000586 `020` (seq10) → Keelty@Owl `027` (seq15) → Keelty@Owl `030` (seq16) → ambush push `arc300_ambush_trigger` `040` (seq20) → internal battle seq21 → Keelty post-fight `050` Yes-gate nil/1 advances, explicit 0 holds (seq25) → Nonolato standard reward (seq30).
## Delegate events
Wired: NonolatoStart/010/015/020/027/030/040/050. Unbound: 025/025_2 Pascaleret interlude (no owner; story rides in 027/030).
## Actors/markers
Nonolato 1000463; Keelty 1000587 single class, 60-yalm proximity disambiguation (Hold 261.38,-1264.70 / Owl 2566.69,1313.25 / post -1588.56,-1913.51); Vairemont 1000586; triggers 1090199 with uniqueIds (SQL rows 3319/3322 present). Markers 11016101-08 live; 11016109-20 filler.
## Mob profiles + spawn evidence (VERIFIED SQL)
Bandit Pathfinder 2280165/32748 + Bandit Scout 2280164/32747 (Lv.30, skill 15), both must fall; 1800s cap (recovered 30-min). INFERRED: spawn offsets, party 3.
## Rewards
EXP 3420 script; gil 30000 + marks 1000106x3000 central; no item.
## Instance-battle surface
Needed: private North Shroud ambush duty (exists: QuestDirectorClassArc300). Existing: full.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x30000 (src wiki)
- Currency 1000106 x3000 (src dat-old)

## Mob profiles + spawn evidence
- mobType 32747: `(32747, 2280164, 'bandit_scout', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 30, 30, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 15, 0, 0),`
- mobType 32748: `(32748, 2280165, 'bandit_pathfinder', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 30, 30, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 15, 0, 0),`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Arc300 = {
        id = 110161,
        title = "The Foreboding Forest",
        level = 30,
        classId = 7,
        actor = 0,
        noOffer = true,
        marker = 11016101,
        exp = 0,
        documentedPrerequisite = 110160,
        documentedOfferCandidate = {actor = 1000463, event = "processEventNonolatoStart"},
        documentedRoute = {
            {marker = 11016101, displayId = 1100199, event = "processEvent010", scene = "arc30010", sceneArg = 1, mapRegion = 103, mapArea = 321, x = 261.380005, z = -1264.699951, afterWarp = true},
            {marker = 11016102, displayId = 4000257, event = "processEvent015", scene = "arc30015", sceneArg = 1, mapRegion = 102, mapArea = 203, x = 2463.370117, z = 1217.619995, afterWarp = true},
            {marker = 11016103, displayId = 1200019, event = "processEvent020", scene = "arc30020", sceneArg = 1, mapRegion = 102, mapArea = 203, x = 2565.750000, z = 1319.579956, afterWarp = true},
            {marker = 11016104, displayId = 1100199, event = "processEvent027", scene = "arc30025", sceneArg = 1, mapRegion = 102, mapArea = 203, x = 2566.689941, z = 1313.250000, afterWarp = true},
            {marker = 11016105, displayId = 1100199, event = "processEvent030", scene = "arc30030", sceneArg = 1, mapRegion = 102, mapArea = 203, x = 2566.689941, z = 1313.250000, afterWarp = true},
            {marker = 11016106, displayId = 4000257, event = "processEvent040", scene = "arc30040", sceneArg = 1, ask = 51030, requiredResult = 1, mapRegion = 103, mapArea = 303, x = -1602.119995, z = -1854.219971, afterWarp = true},
            {marker = 11016107, displayId = 1100199, event = "processEvent050", scene = "arc30050", sceneArg = 1, mapRegion = 103, mapArea = 303, x = -1588.560059, z = -1913.510010},
            {marker = 11016108, displayId = 1400007, mapRegion = 103, mapArea = 321, x = 232.880005, z = -1268.939941, rewardOwnerUnresolved = true},
        },
        documentedUnboundEvents = {"processEvent025", "processEvent025_2"},
        documentedBattle = {
            encounterOwnerUnresolved = true,
            targetActorsUnresolved = true,
            alliesUnresolved = true,
            countsUnresolved = true,
            profilesUnresolved = true,
            partyLimitUnresolved = true,
        },
        documentedRewardCandidates = {exp = 30000, centralGil = 30000, legacyGuildMarks = 3000, encodedRewardType = -13, encodedRewardValue = 11},
        documentedContaminatedMarkerRange = {11016109, 11016120},
        todo = "Implemented/enabled: Nonolato offer -> Keelty briefing -> Owl's Nest gate -> Vairemont delivery -> Keelty x2 -> North Shroud ambush duty (Bandit Pathfinder + Bandit Scout, 30-minute cap) -> Keelty Yes-gated report -> Nonolato reward. Custom script at Data/scripts/quests/arc/arc300.lua (outside the generic driver); same-class Keelty phases disambiguated by proximity. Owl gate/Keelty-post Y, spawn offsets, party cap 3, the 040 ask handling, and the unmapped final scene are documented reconstructions; 025/025_2 stay unbound. Markers 11016109-20 stay rejected filler.",
    }
```

## Lua header (verbatim)
```lua
require ("global")
require ("quest")
require ("private_quest_battle")

--[[

Quest Script

Name: 	The Foreboding Forest
Code: 	Arc300
Id: 	110161
Prereq: Level 30, Archer

Retail flow, from the decompiled client scenario
(tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/arc/arc300.lua),
the DAT quest markers, and the 1.0 walkthrough: Nonolato offer
(processEventNonolatoStart) -> Keelty briefing at the Quiver's Hold
(processEvent010) -> Owl's Nest gate cutscene (processEvent015) ->
Vairemont delivery (processEvent020) -> Keelty at Owl's Nest, twice
(processEvent027 then processEvent030) -> North Shroud road ambush
(processEvent040, then a private duty against one Bandit Pathfinder
and one Bandit Scout under a 30-minute cap) -> post-fight Keelty
report with a Yes gate (processEvent050) -> Nonolato reward. No
chocobo callback or actor is used anywhere in this quest.

Map Markers (DAT quest_marker rows; 11016109-11016120 are filler)
11016101,Keelty briefing,261.38,-1264.70,1100199,Gridania
11016102,Owl's Nest gate,2463.37,1217.62,4000257,Coerthas
11016103,Vairemont delivery,2565.75,1319.58,1200019,Coerthas
11016104,Keelty at Owl's Nest,2566.69,1313.25,1100199,Coerthas
11016105,Keelty at Owl's Nest again,2566.69,1313.25,1100199,Coerthas
11016106,Road ambush,-1602.12,-1854.22,4000257,Black Shroud
11016107,Post-fight Keelty,-1588.56,-1913.51,1100199,Black Shroud
11016108,Nonolato reward,232.88,-1268.94,1400007,Gridania

Keelty shares actor class 1000587 across the Quiver's Hold, Owl's Nest,
and post-fight phases, so every Keelty talk is disambiguated by player
proximity to the expected DAT marker; a same-class talk at the wrong
phase plays nothing. The processEvent025/025_2 Pascaleret interlude
talks have no recovered owner and stay unbound by design, like Exc300's
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.