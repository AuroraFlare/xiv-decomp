# 111244 The Wheel of Disaster — `whm0j4` (Phase 3 MAGIC)

- Class: WHM 27 | Level: 45 | SQL prereq: 0 | SQL code: `Whm0j4`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/whm/whm0j4.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Whm0j4

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
    Whm0j4 = {
        id = 111244,
        title = "The Wheel of Disaster",
        level = 45,
        baseClassId = 23,
        jobId = 27,
        secondaryClassId = 3,
        secondaryLevel = 15,
        actor = 1001570,
        prerequisite = 111243,
        exp = 5340,
        actions = {{27359, 27}},
        rewardMarkers = {11222302},
        battle = {
            markers = {11222301},
            maxPartySize = 8,
            documentedLocation = {
                zoneId = 128,
                mapRegion = 101,
                mapArea = 101,
                x = 222.649994,
                z = 441.820007,
                description = "South of Camp Bearded Rock",
            },
            documentedObjective = "Defeat/free a bandit and his minions; Oha-Sok then leaves",
            -- These four named actor classes exist next to the recovered job
            -- roster, but no source joins them to Whm0j4. Keep them explicitly
            -- unbound: they are research leads, not legal target definitions.
            documentedUnboundCandidates = {
                {actorClassId = 2289031, displayId = 3280313, displayName = "bandit butcher"},
                {actorClassId = 2289032, displayId = 3280314, displayName = "bandit lancer"},
                {actorClassId = 2289033, displayId = 3280315, displayName = "bandit grappler"},
                {actorClassId = 2289034, displayId = 3280316, displayName = "bandit archer"},
            },
            documentedSceneFlow = {
                activeDialogue = "processEventRyaoAfter",
                aftermath = "processEventNQ",
                aftermathScene = "whm0j410",
                linkpearlVariants = {"processEventLS", "processEventLS2"},
                reward = "processEventClear",
            },
        },
        todo = "HOLD: Raya-O-Senna -> eight-person bandit/minions objective south of Camp Bearded Rock -> processEventNQ/whm0j410 -> Raya marker 11222302/processEventClear/Holy 27359 is recovered. The four nearby bandit actor classes 2289031-34 are unbound research candidates, not proven Whm0j4 targets; all lack profiles/skills/counts/waves/transforms. Marker 11222301 has no actor/Y/rotation, Oha-Sok is not a proven ally, linkpearl sequence ownership is unknown, and empty QuestDirectorWhm0j401 supplies no lifecycle.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Whm0j4")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.