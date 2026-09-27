# 110100 Bloody Baptism — `exc200` (Phase 3 MAGIC)

- Class: MRD 4 | Level: 20 | SQL prereq: 0 | SQL code: `Exc200`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/exc/exc200.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Exc200

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Driver route (VERIFIED: template row + validator PASS; wiki §26)
Waekbyrt offer → [1] Nunuba 1000004 `015` (requiredResult 1) → duty (preEvent `020`) → [20] Nunuba `030`+afterEvent `040` → reward `050`.
## Battle
QuestDirectorClassExc200: 7x Tower Lemming 2204003/3129 Lv.15 + Lord of Swiftperch 2204004/3130 Lv.20, single wave, require-all. Trident Map + Waekbyrt 040_2 lines unbound.
## Rewards
EXP 1760 + item 4040405; gil 20000 + marks 1000103x2000 central. Markers 11010001-03 live; 04-20 filler.
## Status
Implemented via generic driver; DISABLED. No open-world kill surface.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x20000 (src wiki)
- Currency 1000103 x2000 (src dat-old)

## Mob profiles + spawn evidence
- mobType 3129: `(3129, 2204003, 'tower_lemming', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 2, 15, 15, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1.25, 3, 5039, 0, 0),`
- mobType 3130: `(3130, 2204004, 'lord_of_swiftperch', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 2, 20, 20, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1.25, 3, 5039, 0, 0);`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Exc200 = {
        id = 110100,
        title = "Bloody Baptism",
        level = 20,
        classId = 4,
        actor = 1000003,
        offer = true,
        offerActor = 1000003,
        rewardActor = 1000004,
        marker = 11010001,
        rewardMarkers = {11010003},
        -- Post-1.20 level-20 maximum (Gla200 precedent); 20,000 gil and
        -- 2,000 Marauder marks stay in the central reward rows.
        exp = 1760,
        items = {{4040405, 1}},
        route = {
            [1] = {actor = 1000004, markers = {11010001}, event = "processEvent015", requiredResult = 1},
        },
        battle = {
            code = "exc200",
            directorScript = "Quest/QuestDirectorClassExc200",
            markers = {11010002},
            preEvent = "processEvent020",
            targets = {
                {actorClassId = 2204003, mobTypeId = 3129, uniqueId = "exc200_tower_lemming_1", displayName = "Tower Lemming", offsetX = -6.0, offsetZ = -6.0},
                {actorClassId = 2204003, mobTypeId = 3129, uniqueId = "exc200_tower_lemming_2", displayName = "Tower Lemming", offsetX = 6.0, offsetZ = -6.0},
                {actorClassId = 2204003, mobTypeId = 3129, uniqueId = "exc200_tower_lemming_3", displayName = "Tower Lemming", offsetX = -6.0, offsetZ = 6.0},
                {actorClassId = 2204003, mobTypeId = 3129, uniqueId = "exc200_tower_lemming_4", displayName = "Tower Lemming", offsetX = 6.0, offsetZ = 6.0},
                {actorClassId = 2204003, mobTypeId = 3129, uniqueId = "exc200_tower_lemming_5", displayName = "Tower Lemming", offsetX = -9.0, offsetZ = 0.0},
                {actorClassId = 2204003, mobTypeId = 3129, uniqueId = "exc200_tower_lemming_6", displayName = "Tower Lemming", offsetX = 9.0, offsetZ = 0.0},
                {actorClassId = 2204003, mobTypeId = 3129, uniqueId = "exc200_tower_lemming_7", displayName = "Tower Lemming", offsetX = 0.0, offsetZ = 9.0},
                {actorClassId = 2204004, mobTypeId = 3130, uniqueId = "exc200_lord_of_swiftperch", displayName = "Lord of Swiftperch", offsetX = 0.0, offsetZ = -12.0},
            },
        },
        postBattleRoute = {
            -- processEvent030/040 are the recovered post-fight scenes in
            -- numeric order; the final reward hook stays processEvent050.
            [20] = {actor = 1000004, markers = {11010003}, event = "processEvent030", afterEvents = {"processEvent040"}},
        },
        documentedContaminatedMarkerRange = {11010004, 11010020},
        todo = "Implemented/enabled: Waekbyrt -> Nunuba briefing -> private Swiftperch Tower fight (7 Tower Lemmings + Lord of Swiftperch) -> Nunuba report/reward. Single-wave composition and party cap 3 are documented defaults; Waekbyrt's 040_2 lines and the Trident Map handoff stay unbound.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Exc200")
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.