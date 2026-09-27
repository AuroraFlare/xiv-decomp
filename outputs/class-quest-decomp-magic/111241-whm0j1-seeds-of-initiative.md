# 111241 Seeds of Initiative — `whm0j1` (Phase 3 MAGIC)

- Class: WHM 27 (CNJ 23 + GLA 15) | Level: 30 | SQL prereq: 0 | SQL code: `Whm0j1`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/whm/whm0j1.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Whm0j1

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
- No mobType bindings in config (no kill objective in this implementation).

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Whm0j1 = {
        id = 111241,
        title = "Seeds of Initiative",
        level = 30,
        baseClassId = 23,
        jobId = 27,
        secondaryClassId = 3,
        secondaryLevel = 15,
        actor = 1000234,
        exp = 2661,
        actions = {{27344, 27}},
        keyItems = {{2000206, 1}},
        items = {{3020410, 1}},
        route = {
            steps = {{actor = 1001570, event = "processEventRayao", markers = {11222001}}},
            rewardActor = 1001570,
            rewardMarkers = {11222003},
            documentedActors = {
                {actor = 1001937, displayName = "Pukni Pakk", events = {"processEventMoogleA00", "processEventMoogleA01", "processEventMoogleA02"}},
                {actor = 1001938, displayName = "Kupcha Kupa", events = {"processEventMoogleB00", "processEventMoogleB01", "processEventMoogleB02"}},
            },
        },
        battle = {
            markers = {11222002},
            maxPartySize = 4,
            -- The archived walkthrough proves one adult plus three young,
            -- but not their wave timing or formation.
            documentedTargets = {
                {actorClassId = 2201115, displayId = 3201122, displayName = "Diremite Straggler", count = 1},
                {actorClassId = 2201114, displayId = 3201121, displayName = "Miteling Straggler", count = 3},
            },
            documentedLocation = {
                zoneId = 157,
                mapRegion = 103,
                mapArea = 311,
                x = -1008.960022,
                z = -2091.47998,
                description = "Mun-Tuy Cellars",
            },
            documentedSceneFlow = {
                rewardDialogue = "processEventClear",
                aftermath = "processEventClearNQ",
                aftermathScene = "whm0j110",
                jobItemPresentation = "processEventJob",
                actionPresentation = "processEventKokuti",
            },
        },
        documentedObjectiveItem = {item = 11000551, itemName = "Nirvana", transition = "Unrecovered"},
        todo = "HOLD: Soileine -> Raya-O-Senna -> Mun-Tuy marker 11222002 -> one Diremite Straggler 2201115 plus three Miteling Stragglers 2201114 -> Raya/processEventClear/processEventClearNQ/whm0j110 and job/action widgets is recovered with a four-person cap. Neither enemy has an exact profile; wave/formation and Nirvana 11000551 transition are unknown; the marker has no entry actor/full transform; Raya and the moogles have no public spawn contracts; the generic route would incorrectly launch at Raya instead of Mun-Tuy.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Whm0j1")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.