# 110241 Revelry in Rivalry — `thm300` (Phase 3 MAGIC)

- Class: THM 22 | Level: 30 | SQL prereq: 0 | SQL code: `Thm300`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/thm/thm300.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Thm300

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Driver route (VERIFIED: template row + validator PASS; wiki §36)
Yayake offer → [1] rival 1000607 @11024101 `020` → [2] Baderon 1000137 @11024102 `025` → [3] besieged-smith push 1001008 @11024103 (no talk event; recorded ground zone-128 node 821) → rescue duty → [20] Bodenolf 1000144 counterEvent (`028` smith-survived / `027` fallen) → [21] Bodenolf `030` Echo gate → [22] Yayake `035` → [23] rival `040` → reward `050`.
## Battle
QuestDirectorClassThm300: Ignis Fatuus 2201603/32740 Lv.30 + protected smith 2290023; scripted attrition records outcome (counter slot 2 = 5 survived). Bomb credit grants Writ of Access 11000030 once (guarded). Stale 8-Lemming metadata rejected (VERIFIED).
## Rewards
EXP 3420 script; gil 30000 + marks x3000 central. Markers 11024101-09 live; 10-20 filler.
## Status
Implemented via generic driver; DISABLED. No open-world kill surface.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x30000 (src wiki)
- Currency 1000110 x3000 (src dat-old)

## Mob profiles + spawn evidence
- mobType 32740: `(32740, 2201603, 'ignis_fatuus', 6, 0.8, 1, 0, 0, 10, 0, 4200, 0, 22, 30, 30, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1.25, 1, 1, 1, 0, 5010, 0, 0),`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Thm300 = {
        id = 110241,
        title = "Revelry in Rivalry",
        level = 30,
        classId = 22,
        actor = 1000846,
        offer = true,
        offerActor = 1000846,
        rewardActor = 1000846,
        marker = 11024101,
        rewardMarkers = {11024109},
        -- Post-1.20 level-30 maximum (Fandom/GamerEscape); 30,000 gil
        -- and 3,000 Thaumaturge marks stay in the central reward rows.
        exp = 3420,
        documentedGil = 30000,
        route = {
            [1] = {actor = 1000607, markers = {11024101}, event = "processEvent020"},
            [2] = {actor = 1000137, markers = {11024102}, event = "processEvent025"},
            -- The DAT rescue marker is display 4000257, but the trigger is
            -- the besieged smith herself (1001008/4000348) on exact
            -- recorded ground (zone-128 node 821). The decomp has no talk
            -- event here: pushing her opens the private rescue duty, the
            -- retail Duty-Calls prompt.
            [3] = {actor = 1001008, markers = {11024103}, push = true},
        },
        battle = {
            code = "thm300",
            directorScript = "Quest/QuestDirectorClassThm300",
            markers = {11024103},
            -- The protected smith (2290023 shares the bizarre-blacksmith
            -- display) spawns beside the bomb; the director tracks her
            -- scripted attrition and records the outcome for the report.
            actors = {
                {actorClassId = 2290023, uniqueId = "thm300_bizarre_blacksmith", offsetX = 6.0, offsetZ = 6.0},
            },
            targets = {
                {actorClassId = 2201603, mobTypeId = 32740, uniqueId = "thm300_ignis_fatuus", displayName = "Ignis Fatuus", offsetX = 0.0, offsetZ = -8.0},
            },
        },
        postBattleRoute = {
            -- The smith outcome selects the report: processEvent028 when
            -- she survives (counter 2 = 5, mirroring the DAT journal
            -- bra
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Thm300")
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.