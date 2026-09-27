# 111246 The Chorus of Cataclysm — `whm0j6` (Phase 3 MAGIC)

- Class: WHM 27 | Level: 50 | SQL prereq: 0 | SQL code: `Whm0j6`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/whm/whm0j6.lua` (3 lines, job-driver-stub)
- Config: job_quest_template.lua:Whm0j6

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
- mobType 3020: NO ROW in server_battlenpc_mob_types.sql (UNRECOVERED)
- mobType 3055: NO ROW in server_battlenpc_mob_types.sql (UNRECOVERED)

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Whm0j6 = {
        id = 111246,
        title = "The Chorus of Cataclysm",
        level = 50,
        baseClassId = 23,
        jobId = 27,
        secondaryClassId = 3,
        secondaryLevel = 15,
        actor = 1001570,
        prerequisite = 111245,
        actions = {{27345, 27}},
        items = {{8032706, 1}},
        rewardMarkers = {11222502},
        battle = {
            markers = {11222501},
            -- The journal's recommendation is eight people total. This is
            -- retained as evidence only: the original encounter associates
            -- six elemental families with the quest and does not expose
            -- their multiplicities, wave order, or final kill condition.
            maxPartySize = 8,
            preEvent = "processEventCutSceneBeforeBattle",
            documentedTargets = {
                { actorClassId = 2204707, mobTypeId = 3055, displayName = "Icebound Wrath" },
                { actorClassId = 2204907, mobTypeId = 3020, displayName = "Earthbound Wrath" },
                { actorClassId = 2204610, displayId = 3204607, displayName = "Firebound Wrath" },
            },
            documentedFamilies = {
                "Earthbound Wrath", "Firebound Wrath", "Icebound Wrath",
                "Lightning-bound Wrath", "Water-bound Wrath", "Wind-bound Wrath",
            },
        },
        todo = "HOLD: processEventStart, whm0j605/whm0j610, eight-person recommendation, Icebound Wrath 2204707/3055, Earthbound Wrath 2204907/3020, Healer's Robe 8032706, and Benediction 27345 are recovered. Retail evidence associates six elemental families with the encounter; Firebound Wrath actor 2204610/display 3204607 is also exact; its mob profile and the remaining three actor/profile bindings, copies, waves, kill rules, marker placement, Raya-O-Senna spawn, and after-warp/content owner are unresolved. A one-Icebound generic shell would materially change the fight.",
    },
    -- Guano Gnat has a complete local combat identity, inc
```

## Lua header (verbatim)
```lua
require ("quests/job_quest_template")

InitJobQuest("Whm0j6")
```

## Open gaps (esp. instance-battle needs)
- Route/content owner unproven (HOLD rows) or private-adapter only where `offer = true`; unbound actors/markers/Y/rotations listed in config todo. Do NOT invent fights.