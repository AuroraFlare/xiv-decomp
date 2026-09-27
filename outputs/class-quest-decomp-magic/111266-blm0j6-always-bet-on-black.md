# 111266 Always Bet on Black — `blm0j6` (Phase 3 MAGIC)

- Class: BLM 26 | Level: 50 | SQL prereq: 0 | SQL code: `Blm0j6`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/blm/blm0j6.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Blm0j6

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
- mobType 3002: NO ROW in server_battlenpc_mob_types.sql (UNRECOVERED)

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Blm0j6 = {
        completionOwner = "content",
        id = 111266,
        title = "Always Bet on Black",
        level = 50,
        baseClassId = 22,
        jobId = 26,
        secondaryClassId = 2,
        secondaryLevel = 15,
        actor = 1060038,
        prerequisite = 111265,
        actions = {{27316, 26}},
        items = {{8032707, 1}},
        route = {
            steps = {
                {actor = 1060037, event = "processEventDozol01", markers = {11223501}},
                {actor = 1060036, event = "processEventKazagg02", markers = {11223502}},
                {actor = 1060035, event = "processEventLalai02", markers = {11223503}},
            },
        },
        battle = {
            markers = {11223504},
            maxPartySize = 8,
            documentedTargets = {{
                actorClassId = 2203503,
                displayId = 3203505,
                mobTypeId = 3002,
                skillListId = 10,
                displayName = "Barbatos",
                count = 1,
                profileCaveat = "Local profile has level 0 and no assigned spell list",
            }},
            -- Three Will-o'-the-Wisp actor classes exist, but the source says
            -- only "several" Void Lanterns and never maps those IDs to copies.
            documentedUnboundCandidates = {
                {actorClassId = 2209906, displayId = 3209907, displayName = "Void Lantern candidate"},
                {actorClassId = 2209907, displayId = 3209907, displayName = "Void Lantern candidate"},
                {actorClassId = 2209908, displayId = 3209907, displayName = "Void Lantern candidate"},
            },
            documentedLocation = {
                zoneId = 174,
                mapRegion = 104,
                mapArea = 405,
                x = 915.130005,
                z = 661.270020,
                description = "Nald's Reflection, Southern Thanalan",
            },
            documentedMechanic = {
                success = "Kill Bar
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Blm0j6")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.