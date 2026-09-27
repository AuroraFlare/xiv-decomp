# 110260 Dendrological Duties — `cnj200` (Phase 3 MAGIC)

- Class: CNJ 23 | Level: 20 | SQL prereq: 0 | SQL code: `Cnj200`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/cnj/cnj200.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Cnj200

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Driver route (VERIFIED: template row; wiki §38)
Soileine 1000234 offer → [1] Telent 1000504 @11026001 `015` → duty (preEvent `020`) → [20] Telent @11026003 `030` → reward hook `040`.
## Battle
QuestDirectorClassCnj200: 4x Rabid Coywolf 2201408/3127 Lv.15 sequential waves 1-4 + Alpha 2201409/3128 Lv.17 wave 5. Morys post-kill appearance unbound (not spawned).
## Rewards
EXP 1760 + item 5030306; gil 20000 + marks 1000111x2000 central. Markers 11026001-04 live; 05-20 filler.
## Status
Implemented via generic driver; DISABLED. No open-world kill surface.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x20000 (src wiki)
- Currency 1000111 x2000 (src dat-old)

## Mob profiles + spawn evidence
- mobType 3127: `(3127, 2201408, 'rabid_coywolf', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 2, 15, 15, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 0.75, 4, 5062, 0, 0),`
- mobType 3128: `(3128, 2201409, 'alpha_coywolf', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 2, 17, 17, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 0.75, 4, 5062, 0, 0);`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Cnj200 = {
        id = 110260,
        title = "Dendrological Duties",
        level = 20,
        classId = 23,
        actor = 1000234,
        offer = true,
        offerActor = 1000234,
        rewardActor = 1000234,
        marker = 11026001,
        rewardMarkers = {11026004},
        -- Post-1.20 level-20 maximum (Gla200 precedent); 20,000 gil and
        -- 2,000 Conjurer marks stay in the central reward rows.
        exp = 1760,
        items = {{5030306, 1}},
        route = {
            [1] = {actor = 1000504, markers = {11026001}, event = "processEvent015"},
        },
        battle = {
            code = "cnj200",
            directorScript = "Quest/QuestDirectorClassCnj200",
            markers = {11026002},
            preEvent = "processEvent020",
            targets = {
                {wave = 1, actorClassId = 2201408, mobTypeId = 3127, uniqueId = "cnj200_rabid_coywolf_1", displayName = "Rabid Coywolf", offsetX = 0.0, offsetZ = -8.0},
                {wave = 2, actorClassId = 2201408, mobTypeId = 3127, uniqueId = "cnj200_rabid_coywolf_2", displayName = "Rabid Coywolf", offsetX = 0.0, offsetZ = -8.0},
                {wave = 3, actorClassId = 2201408, mobTypeId = 3127, uniqueId = "cnj200_rabid_coywolf_3", displayName = "Rabid Coywolf", offsetX = 0.0, offsetZ = -8.0},
                {wave = 4, actorClassId = 2201408, mobTypeId = 3127, uniqueId = "cnj200_rabid_coywolf_4", displayName = "Rabid Coywolf", offsetX = 0.0, offsetZ = -8.0},
                {wave = 5, actorClassId = 2201409, mobTypeId = 3128, uniqueId = "cnj200_alpha_coywolf", displayName = "Alpha Coywolf", offsetX = 0.0, offsetZ = -8.0},
            },
        },
        postBattleRoute = {
            [20] = {actor = 1000504, markers = {11026003}, event = "processEvent030"},
        },
        todo = "Implemented/enabled: Soileine -> Telent briefing -> private coywolf-culling fight (4 Rabid Coywolves in sequence + Alpha Coywolf) -> Telent report -> Soileine reward. Levels 15/17, five sequential waves, and party cap 3 are documented defaults; Morys's post-kill appearance stays unbound.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Cnj200")
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.