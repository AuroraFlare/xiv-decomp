# 111265 Gearing Up — `blm0j5` (Phase 3 MAGIC)

- Class: BLM 26 | Level: 45 | SQL prereq: 0 | SQL code: `Blm0j5`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/blm/blm0j5.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Blm0j5

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
    Blm0j5 = {
        id = 111265, title = "Gearing Up", level = 45,
        baseClassId = 22, jobId = 26, secondaryClassId = 2, secondaryLevel = 15,
        actor = 1060038, prerequisite = 111264, exp = 5340,
        interactions = {
            -- Aurum Vale, Dusk Vigil, west of Camp Brittlebark, and south of
            -- Camp Broken Water. These are area/entrance markers, not proven
            -- coffer transforms or an ordinal marker-to-item binding.
            markers = {11223401, 11223402, 11223403, 11223404},
            event = "processEvent_getAF_info",
            documentedItems = {8051407, 8071407, 8081807, 8013507},
            documentedDestinations = {
                {marker = 11223401, zone = 147, mapRegion = 102, mapArea = 204, x = -368.989990, z = 1397.949951, location = "Aurum Vale"},
                {marker = 11223402, zone = 148, mapRegion = 102, mapArea = 205, x = -1838.300049, z = -703.929993, location = "Dusk Vigil"},
                {marker = 11223403, zone = 190, mapRegion = 105, mapArea = 501, x = 191.110001, z = 608.840027, location = "west of Camp Brittlebark"},
                {marker = 11223404, zone = 174, mapRegion = 104, mapArea = 405, x = 1761.810059, z = 1428.560059, location = "south of Camp Broken Water"},
            },
        },
        todo = "HOLD: Wizard's Tonban/Gloves/Crakows/Petasos, four X/Z destinations, processEvent_getAF_info, and fourth-acquisition completion are recovered. Exact coffer actor/unique IDs, Y/rotation transforms, push ownership, and marker-to-item alignment remain missing; the generic Guildleve coffer is not a legal substitute.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Blm0j5")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.