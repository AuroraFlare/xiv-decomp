# 111242 When Sheep Attack — `whm0j2` (Phase 3 MAGIC)

- Class: WHM 27 | Level: 35 | SQL prereq: 0 | SQL code: `Whm0j2`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/whm/whm0j2.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Whm0j2

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
- mobType 3019: NO ROW in server_battlenpc_mob_types.sql (UNRECOVERED)

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Whm0j2 = {
        id = 111242,
        title = "When Sheep Attack",
        level = 35,
        baseClassId = 23,
        jobId = 27,
        secondaryClassId = 3,
        secondaryLevel = 15,
        actor = 1001570,
        offer = true,
        prerequisite = 111241,
        exp = 3360,
        actions = {{27358, 27}},
        rewardMarkers = {11222102},
        battle = {
            markers = {11222101},
            directorScript = "Quest/QuestDirectorJobWhm0j2",
            maxPartySize = 4,
            requireAllTargets = true,
            targets = {{
                actorClassId = 2106017,
                mobTypeId = 3019,
                uniqueId = "whm0j2_downy_dunstan",
                displayName = "Downy Dunstan",
            }},
        },
        todo = "Implemented exact private adapter: Raya-O-Senna/processEventRAYAOSENNAStart -> Downy Dunstan actor 2106017/mob 3019/skill list 6010 -> processEvent005 and Regen 27358. Camp Glory remains the source-backed public destination; Raya-O-Senna's public spawn still needs live reachability verification.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Whm0j2")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.