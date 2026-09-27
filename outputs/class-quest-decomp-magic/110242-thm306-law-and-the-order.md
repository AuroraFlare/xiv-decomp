# 110242 Law and the Order — `thm306` (Phase 3 MAGIC)

- Class: THM 22 | Level: 36 | SQL prereq: 0 | SQL code: `Thm306`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/thm/thm306.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Thm306

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Driver route (VERIFIED: template row + validator PASS; wiki §37)
Yayake offer → [1] I'loofii `020` → [2] wreck-site rival `030` → [3] rival `035` Echo gate (markers 02/03 share wreck home, zone-172 node 8267) → duel (preEvent `040`) returns straight to reward seq20, hook `060`.
## Battle
QuestDirectorClassThm306: Overweening Thaumaturge 2289015/32742 Lv.36 skill 14; nonlethal yield at ≤25% HP (kill fallback); aftermath `050` in-instance.
## Rewards
EXP 4720 script; gil 36000 + marks x3600 central. Markers 01/02/03/05 live; 04/06-20 filler.
## Status
Implemented via generic driver; DISABLED. No open-world kill surface.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x36000 (src wiki)
- Currency 1000110 x3600 (src dat-old)

## Mob profiles + spawn evidence
- mobType 32742: `(32742, 2289015, 'overweening_thaumaturge', 6, 0, 1, 0, 0, 10, 0, 4200, 0, 22, 36, 36, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 14, 0, 0);`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Thm306 = {
        id = 110242,
        title = "Law and the Order",
        level = 36,
        classId = 22,
        actor = 1000846,
        offer = true,
        offerActor = 1000846,
        rewardActor = 1000847,
        marker = 11024201,
        rewardMarkers = {11024205},
        -- Post-1.20 level-36 maximum (Fandom/GamerEscape); 36,000 gil
        -- and 3,600 Thaumaturge marks stay in the central reward rows.
        exp = 4720,
        documentedGil = 36000,
        route = {
            [1] = {actor = 1000847, markers = {11024201}, event = "processEvent020"},
            -- Markers 11024202/11024203 share the wreck-site rival home
            -- on exact recorded ground (zone-172 node 8267): talk to her,
            -- then talk again for the Echo.
            [2] = {actor = 1000607, markers = {11024202}, event = "processEvent030"},
            -- processEvent035 is the worldMaster:ask(51030, 2) Echo gate.
            -- A result of 0 leaves the player on this same step.
            [3] = {actor = 1000607, markers = {11024203}, event = "processEvent035", requiredResult = 1},
        },
        battle = {
            code = "thm306",
            directorScript = "Quest/QuestDirectorClassThm306",
            markers = {11024203},
            -- processEvent040 (thm30640) is the recovered battle-handoff
            -- scene and runs as the battle preEvent (ARC200 precedent).
            preEvent = "processEvent040",
            targets = {
                {actorClassId = 2289015, mobTypeId = 32742, uniqueId = "thm306_overweening_thaumaturge", displayName = "Overweening Thaumaturge", offsetX = 0.0, offsetZ = -8.0},
            },
        },
        todo = "Implemented/enabled: Yayake -> I'loofii briefing -> wreck-site rival talk -> Echo -> private nonlethal duel (yield threshold with kill fallback, thm30650 aftermath) -> I'loofii report/reward. Yield threshold, rival level/skills, spawn offset, party cap 3, and the unbound Ossuary chatter are documented reconstructions. Markers 11024204/11024206-20 stay rejected filler.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Thm306")
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.