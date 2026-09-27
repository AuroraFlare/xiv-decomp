# 111261 Hearing Voices — `blm0j1` (Phase 3 MAGIC)

- Class: BLM 26 (THM 22 + PUG 15) | Level: 30 | SQL prereq: 0 | SQL code: `Blm0j1`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/blm/blm0j1.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Blm0j1

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
- mobType 3050: NO ROW in server_battlenpc_mob_types.sql (UNRECOVERED)

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Blm0j1 = {
        id = 111261,
        title = "Hearing Voices",
        level = 30,
        baseClassId = 22,
        jobId = 26,
        secondaryClassId = 2,
        secondaryLevel = 15,
        actor = 1000846,
        exp = 2661,
        actions = {{27305, 26}},
        keyItems = {{2000207, 1}},
        items = {{3020410, 1}},
        battle = {
            markers = {11223002},
            maxPartySize = 4,
            documentedTargets = {{
                actorClassId = 2200610,
                mobTypeId = 3050,
                skillListId = 94,
                displayName = "Guano Gnat",
            }},
        },
        todo = "HOLD: Guano Gnat actor 2200610/mob 3050/skill list 94 (Brundleflight 23064), Western Thanalan marker, four-person recommendation, Gem of Shatotto 11000556, and blm0j110/blm0j120 scene methods are exact. The required count behind journal wording 'several' and the director-owned sequence/warp transitions are not recovered.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Blm0j1")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.