# 111263 International Relations — `blm0j3` (Phase 3 MAGIC)

- Class: BLM 26 | Level: 40 | SQL prereq: 0 | SQL code: `Blm0j3`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/blm/blm0j3.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Blm0j3

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
- mobType 3089: NO ROW in server_battlenpc_mob_types.sql (UNRECOVERED)
- mobType 3114: NO ROW in server_battlenpc_mob_types.sql (UNRECOVERED)

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Blm0j3 = {
        id = 111263,
        title = "International Relations",
        level = 40,
        baseClassId = 22,
        jobId = 26,
        secondaryClassId = 2,
        secondaryLevel = 15,
        actor = 1060035,
        offer = true,
        prerequisite = 111262,
        exp = 4260,
        actions = {{27318, 26}},
        route = { steps = {{actor = 1060036, event = "processEvent005", args = getPlayerRaceArgument, markers = {11223201}}}, rewardActor = 1060036 },
        battle = {
            markers = {11223202},
            directorScript = "Quest/QuestDirectorJobBlm0j3",
            maxPartySize = 4,
            partySizeEvidence = {kind = "maximum", total = 4},
            requireAllTargets = true,
            -- Kazagg's processEvent005 already runs at the route interaction.
            -- The local mob source note says
            -- Whitetalon appears after two Ragged Hippocerfs, so repeated
            -- actor classes use distinct private IDs and are counted by the
            -- shared director as separate targets.
            targets = {
                { actorClassId = 2200406, mobTypeId = 3089, uniqueId = "blm0j3_ragged_hippocerf_1", displayName = "Ragged Hippocerf", offsetX = -4.0, wave = 1 },
                { actorClassId = 2200406, mobTypeId = 3089, uniqueId = "blm0j3_ragged_hippocerf_2", displayName = "Ragged Hippocerf", offsetX = 4.0, wave = 1 },
                { actorClassId = 2200407, mobTypeId = 3114, uniqueId = "blm0j3_whitetalon", displayName = "Whitetalon", offsetX = 0.0, wave = 2 },
            },
        },
        todo = "Implemented slice: Lalai/processEventLALAIStart -> Kazagg/processEvent005 with the player's race argument -> two Ragged Hippocerfs then Whitetalon in private content -> Kazagg/processEvent010/processEventClear reward. Public route coordinates remain source-backed placement scaffolds.",
    },
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
    },
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
    },
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
            -- only "several" Void Lanterns and 
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Blm0j3")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.