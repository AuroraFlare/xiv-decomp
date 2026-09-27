# 111243 Lost in Rage — `whm0j3` (Phase 3 MAGIC)

- Class: WHM 27 | Level: 40 | SQL prereq: 0 | SQL code: `Whm0j3`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/whm/whm0j3.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Whm0j3

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Implementation state
STUB: thin file calls its template driver with no live route. Template row is a hidden decomp probe (`noOffer`, `actor = 0`, initText-only client surface). No sequences, events, markers-live rows, mobs, or rewards beyond the inert config. See config block below; do NOT treat `todo` prose as wired behavior.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- (none in gamedata_quest_rewards.sql)

## Mob profiles + spawn evidence
- mobType 3009: `(3009, 2100910, 'cactuar_jack', 5, 0, 1, 1, 0, 10, 60, 4200, 0, 8, 47, 47, 26449, 851, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 0.75, 4, 6006, 0, 3009),`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Whm0j3 = {
        id = 111243,
        title = "Lost in Rage",
        level = 40,
        baseClassId = 23,
        jobId = 27,
        secondaryClassId = 3,
        secondaryLevel = 15,
        actor = 1001570,
        offer = true,
        prerequisite = 111242,
        exp = 4260,
        actions = {{27357, 27}},
        rewardMarkers = {11222202},
        battle = {
            markers = {11222201},
            directorScript = "Quest/QuestDirectorJobWhm0j3",
            maxPartySize = 4,
            requireAllTargets = true,
            targets = {{
                actorClassId = 2100910,
                mobTypeId = 3009,
                uniqueId = "whm0j3_cactuar_jack",
                displayName = "Cactuar Jack",
            }},
        },
        todo = "Implemented exact private adapter: Raya-O-Senna/processEventRAYAOSENNAStart -> Cactuar Jack actor 2100910/mob 3009/skill list 6006 -> processEvent005 and Esuna 27357. The ambient nm_cactuar_jack_172_1 spawn is evidence only and cannot advance the private quest.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Whm0j3")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.