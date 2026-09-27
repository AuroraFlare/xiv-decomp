# 110261 Good Knight, Sweet Dreams — `cnj300` (Phase 3 MAGIC)

- Class: CNJ 23 | Level: 30 | SQL prereq: 110260 | SQL code: `Cnj300`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/cnj/cnj300.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Cnj300

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Driver route (VERIFIED: template row; wiki §39)
Soileine offer → [1] Lifemend Morys `010` + afterEvent `010_2` → [2] Amberscale push `015_1` preEvent → six aspect elementals (2204601/3134 fire, 2204701/3135 ice, 2204801/3136 wind, 2204901/3137 earth, 2205001/3138 lightning, 2205101/3139 water, Lv.25) + staged Morys 2290023 + knight 1000573 → [20] Soileine `030` → [21] Yuhelmeric `040` → [22] knight `050` Echo gate → [23] Morys `060` → reward `070`.
## Rewards
EXP 3420 script; gil 30000 + marks x3000 central. Markers 11026101-07 live; 08-20 filler.
## Status
Implemented via generic driver; DISABLED. Retail aspect strengths unrecovered (neutral resists); seq-15 branch linearized (documented approximation).

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x30000 (src wiki)
- Currency 1000111 x3000 (src dat-old)

## Mob profiles + spawn evidence
- mobType 3134: `(3134, 2204601, 'cnj300_fire_elemental', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 23, 25, 25, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5021, 0, 0),`
- mobType 3135: `(3135, 2204701, 'cnj300_ice_elemental', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 23, 25, 25, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5021, 0, 0),`
- mobType 3136: `(3136, 2204801, 'cnj300_wind_elemental', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 23, 25, 25, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5021, 0, 0),`
- mobType 3137: `(3137, 2204901, 'cnj300_earth_elemental', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 23, 25, 25, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5021, 0, 0),`
- mobType 3138: `(3138, 2205001, 'cnj300_lightning_elemental', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 23, 25, 25, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5021, 0, 0),`
- mobType 3139: `(3139, 2205101, 'cnj300_water_elemental', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 23, 25, 25, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5021, 0, 0);`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Cnj300 = {
        id = 110261,
        title = "Good Knight, Sweet Dreams",
        level = 30,
        classId = 23,
        actor = 1000234,
        offerActor = 1000234,
        rewardActor = 1000234,
        offer = true,
        marker = 11026101,
        rewardMarkers = {11026107},
        exp = 3420,
        route = {
            [1] = {actor = 1000505, markers = {11026101}, event = "processEvent010", afterEvents = {"processEvent010_2"}},
            [2] = {actor = 1000174, markers = {11026102}, push = true},
        },
        battle = {
            code = "cnj300",
            directorScript = "Quest/QuestDirectorClassCnj300",
            markers = {11026102},
            preEvent = "processEvent015_1",
            actors = {
                {actorClassId = 2290033, uniqueId = "cnj300_duty_morys", displayName = "Morys", offsetX = 4.0, offsetZ = 4.0},
                {actorClassId = 1000573, uniqueId = "cnj300_duty_knight", displayName = "Newly Outfitted Knight", offsetX = -4.0, offsetZ = -2.0},
            },
            targets = {
                {wave = 1, actorClassId = 2204601, mobTypeId = 3134, uniqueId = "cnj300_fire_elemental", displayName = "Fire Elemental", offsetX = -6.0, offsetZ = -8.0},
                {wave = 1, actorClassId = 2204701, mobTypeId = 3135, uniqueId = "cnj300_ice_elemental", displayName = "Ice Elemental", offsetX = -3.5, offsetZ = -9.5},
                {wave = 1, actorClassId = 2204801, mobTypeId = 3136, uniqueId = "cnj300_wind_elemental", displayName = "Wind Elemental", offsetX = -1.0, offsetZ = -10.0},
                {wave = 1, actorClassId = 2204901, mobTypeId = 3137, uniqueId = "cnj300_earth_elemental", displayName = "Earth Elemental", offsetX = 1.0, offsetZ = -10.0},
                {wave = 1, actorClassId = 2205001, mobTypeId = 3138, uniqueId = "cnj300_lightning_elemental", displayName = "Lightning Elemental", offsetX = 3.5, offsetZ = -9.5},
                {wave = 1, actorClassId = 2205101, mobTypeId = 3139, uniqueId = "cnj300_water_elemental", displayName = "Water Elemental", offsetX = 6.0, offsetZ = -8.0},
            },
            requireAllTargets = true,
        },
        postBattleRoute = {
            [20] = {actor = 1000234, markers = {11026103}, event = "processEvent030"},
            [21] = {actor = 1000370, markers = {11026104}, event = "processEvent040"},
            [22] = {actor = 1000573, markers = {11026105}, event = "processEvent050", requiredResult = 1},
            [23] = {actor = 1000505, markers = {11026106}, event = "processEvent060"},
        },
        todo = "Implemented/enabled: Soileine -> Lifemend Morys (+ linkpearl follow-up) -> Amberscale duty (six aspect elementals, single group; Morys present, knight aftermath) -> Soileine -> Owl's Nest Yuhelmeric -> rescued-knight Echo gate -> forest-border Morys -> Soileine reward. Level 25, single wave, party cap 3, and the 010_2 afterEvent fold are documented defaults; retail aspect strengths/weaknesses stay unrecovered and are not enforced.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Cnj300")
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.