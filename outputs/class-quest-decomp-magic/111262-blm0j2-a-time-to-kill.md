# 111262 A Time to Kill — `blm0j2` (Phase 3 MAGIC)

- Class: BLM 26 | Level: 35 | SQL prereq: 0 | SQL code: `Blm0j2`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/blm/blm0j2.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Blm0j2

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
- mobType 3013: `(3013, 2105513, 'daddy_longlegs', 5, 0, 1, 1, 0, 10, 60, 4200, 0, 8, 42, 42, 27489, 773, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1, 1, 1, 1, 6008, 0, 3013),`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Blm0j2 = {
        id = 111262,
        title = "A Time to Kill",
        level = 35,
        baseClassId = 22,
        jobId = 26,
        secondaryClassId = 2,
        secondaryLevel = 15,
        actor = 1060035,
        offer = true,
        prerequisite = 111261,
        exp = 3360,
        actions = {{27319, 26}},
        battle = {
            markers = {11223101},
            directorScript = "Quest/QuestDirectorJobBlm0j2",
            maxPartySize = 4,
            partySizeEvidence = {kind = "recommendation", total = 4},
            requireAllTargets = true,
            targets = {{
                actorClassId = 2105513,
                mobTypeId = 3013,
                uniqueId = "blm0j2_daddy_longlegs",
                displayName = "Daddy Longlegs",
            }},
        },
        todo = "Implemented private open-world adapter: Lalai/processEventLALAIStart -> exact public Daddy Longlegs profile in a private shell -> Lalai completion hooks (51121/3105515/2000207, action 27319, linkshell actor 1400197 event 78). Western Thanalan placement, public trigger owner, and any retail phase/party timing remain live-verification follow-ups; processEvent000_* reminder variants are intentionally not treated as route steps.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Blm0j2")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.