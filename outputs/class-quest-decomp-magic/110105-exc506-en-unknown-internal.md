# 110105 [en] (unknown/internal) — `exc506` (Phase 3 MAGIC)

- Class: MRD 4 | Level: 56 | SQL prereq: 0 | SQL code: `Exc506`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/exc/exc506.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Exc506

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
    Exc506 = { id = 110105, title = "Scenario: Exc506", level = 56, classId = 4, actor = 0, marker = 11010501, exp = 0, noOffer = true, todo = "Hidden class-tail reference probe. Recovered client surface is initText-only for exc506; owner, objective route, rewards, and completion are unverified." }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Exc506")
```

## Open gaps (esp. instance-battle needs)
- initText-only client surface; owner/objective route/rewards/completion UNRECOVERED. Do NOT invent fights.