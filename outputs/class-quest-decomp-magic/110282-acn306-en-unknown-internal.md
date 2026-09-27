# 110282 [en] (unknown/internal) — `acn306` (Phase 3 MAGIC)

- Class: ACN 24 | Level: 36 | SQL prereq: 0 | SQL code: `Acn306`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/acn/acn306.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Acn306

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Implementation state
STUB: thin file calls its template driver with no live route. Template row is a hidden decomp probe (`noOffer`, `actor = 0`, initText-only client surface). No sequences, events, markers-live rows, mobs, or rewards beyond the inert config. See config block below; do NOT treat `todo` prose as wired behavior.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x72000 (src dat-old)

## Mob profiles + spawn evidence
- No mobType bindings in config (no kill objective in this implementation).

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Acn306 = { id = 110282, title = "Scenario: Acn306", level = 36, classId = 24, actor = 0, marker = 11028201, exp = 0, noOffer = true, todo = "Hidden ACN reference probe. Recovered client surface is initText-only for acn306; local ACN objectives, owner route, rewards, and completion are unverified." }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Acn306")
```

## Open gaps (esp. instance-battle needs)
- initText-only client surface; owner/objective route/rewards/completion UNRECOVERED. Do NOT invent fights.