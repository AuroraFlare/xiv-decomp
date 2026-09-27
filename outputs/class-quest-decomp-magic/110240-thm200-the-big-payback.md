# 110240 The Big Payback — `thm200` (Phase 3 MAGIC)

- Class: THM 22 | Level: 20 | SQL prereq: 0 | SQL code: `Thm200`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/thm/thm200.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Thm200

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Driver route (VERIFIED: template row + validator PASS; wiki §35)
Yayake 1000846 offer → [1] I'loofii 1000847 @11024001 `020` → [2] vengeance-trigger push 1000174 @11024002 (no talk event; push opens duty) → duty returns straight to reward seq20, hook `030`.
## Battle
QuestDirectorClassThm200: wave1 4x Nannygoat 2102313/1046 (public profile); wave2 Nannygoat + Death-marked Billygoat 2202303/3126; wave3 Enraged Nannygoat 2202307/32741. Boss credit grants Twisted Aldgoat Horn 11000015 once (HasItem guard; never consumed).
## Rewards
EXP 1760 + item 5020210 (script); gil 20000 + marks 1000110x2000 central. Markers 11024001-03 live; 04-20 filler.
## Status
Implemented via generic driver; DISABLED in quest_availability (commented). No open-world kill surface (private duty).

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x20000 (src wiki)
- Currency 1000110 x2000 (src dat-old)

## Mob profiles + spawn evidence
- mobType 1046: `(1046, 2102313, 'nannygoat', 5, 0, 0, 0, 1, 10, 60, 4200, 0, 4, 12, 15, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1.25, 3, 5002, 0, 1046),`
- mobType 3126: `(3126, 2202303, 'death_marked_billygoat', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 15, 15, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1.25, 3, 5002, 0, 0);`
- mobType 32741: `(32741, 2202307, 'enraged_nannygoat', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 4, 20, 20, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1.25, 3, 5002, 0, 0),`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Thm200 = {
        id = 110240,
        title = "The Big Payback",
        level = 20,
        classId = 22,
        actor = 1000846,
        offer = true,
        offerActor = 1000846,
        rewardActor = 1000847,
        marker = 11024001,
        rewardMarkers = {11024003},
        -- Post-1.20 level-20 maximum; 20,000 gil and 2,000 Thaumaturge
        -- marks stay in the central reward rows.
        exp = 1760,
        items = {{5020210, 1}},
        documentedGil = 20000,
        route = {
            [1] = {actor = 1000847, markers = {11024001}, event = "processEvent020"},
            -- The DAT vengeance marker is display 4000257 (a location
            -- trigger, not a named NPC). Actor class 1000174 is the
            -- explicit server-side Duty-Calls trigger (PGL306/ARC200
            -- precedent); its Y stays a scaffold until a live capture at
            -- the marker. The decomp has no talk event here: pushing the
            -- trigger opens the private duty directly.
            [2] = {actor = 1000174, markers = {11024002}, push = true},
        },
        battle = {
            code = "thm200",
            directorScript = "Quest/QuestDirectorClassThm200",
            markers = {11024002},
            -- Wave 1 holds four of the five retail Nannygoats. The fifth
            -- spawns with the boss so the lure lands when one herd goat
            -- is left, as the walkthrough describes.
            targets = {
                {wave = 1, actorClassId = 2102313, mobTypeId = 1046, uniqueId = "thm200_nannygoat_1", displayName = "Nannygoat", offsetX = -6.0, offsetZ = -6.0},
                {wave = 1, actorClassId = 2102313, mobTypeId = 1046, uniqueId = "thm200_nannygoat_2", displayName = "Nannygoat", offsetX = 6.0, offsetZ = -6.0},
                {wave = 1, actorClassId = 2102313, mobTypeId = 1046, uniqueId = "thm200_nannygoat_3", displayName = "Nannygoat", offsetX = -6.0, offsetZ = 6.0},
                {wave = 1, actorClassId = 2102313, mobTypeId = 1046, uniqueId = "thm200_nannygoat_4", displayName = "Nannygoat", offsetX = 6.0, offsetZ = 6.0},
                {wave = 2, actorClassId = 2102313, mobTypeId = 1046, uniqueId = "thm200_nannygoat_5", displayName = "Nannygoat", offsetX = 0.0, offsetZ = 9.0},
                {wave = 2, actorClassId = 2202303, mobTypeId = 3126, uniqueId = "thm200_death_marked_billygoat", displayName = "Death-marked Billygoat", offsetX = 0.0, offsetZ = -9.0},
                -- Wave 3: the Enraged Nannygoat answers the boss kill.
                {wave = 3, actorClassId = 2202307, mobTypeId = 32741, uniqueId = "thm200_enraged_nannygoat", displayName = "Enraged Nannygoat", offsetX = 0.0, offsetZ = -8.0},
            },
        },
        todo = "Implemented/enabled: Yayake -> I'loofii briefing -> Western Thanalan Duty-Calls trigger -> private vengeance duty (5 Nannygoats across waves 1-2, Death-marked Billygoat with Twisted Aldgoat Horn proof, Enraged Nannygoat) -> I'loofii report/reward. Wave-2 lure composition, spawn offsets, party cap 3, and the ungrounded trigger Y are documented reconstructions; proof items are granted but not consumed.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Thm200")
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.