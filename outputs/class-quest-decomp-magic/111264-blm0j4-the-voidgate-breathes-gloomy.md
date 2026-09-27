# 111264 The Voidgate Breathes Gloomy — `blm0j4` (Phase 3 MAGIC)

- Class: BLM 26 | Level: 45 | SQL prereq: 0 | SQL code: `Blm0j4`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/blm/blm0j4.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Blm0j4

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
    Blm0j4 = {
        completionOwner = "interaction",
        id = 111264, title = "The Voidgate Breathes Gloomy", level = 45,
        baseClassId = 22, jobId = 26, secondaryClassId = 2, secondaryLevel = 15,
        actor = 1060037, prerequisite = 111263, exp = 5340,
        actions = {{27317, 26}},
        interactions = {
            markers = {11223301},
            -- processEvent000_SEKIHI is the inactive moss-covered-stela
            -- description. processEvent005 is the actual Gem of Shatotto
            -- activation and inscription event.
            event = "processEvent005",
            documentedDestination = {
                marker = 11223301, zone = 153, mapRegion = 103, mapArea = 304,
                x = -1691.359985, z = 124.540001,
                inactiveEvent = "processEvent000_SEKIHI",
                location = "northwest of Turning Leaf, West Shroud",
            },
        },
        todo = "HOLD: Dozol Meloc -> marker 11223301 -> stone-stela processEvent005 -> completion widgets/action 27317 is recovered. Display 4000257 is ambiguous, and the stela actor class, unique ID, Y/rotation, public spawn, and push owner are missing; the interaction cannot be exposed safely.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Blm0j4")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.