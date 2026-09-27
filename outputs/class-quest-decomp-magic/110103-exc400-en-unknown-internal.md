# 110103 [en] (unknown/internal) — `exc400` (Phase 3 MAGIC)

- Class: MRD 4 | Level: 40 | SQL prereq: 0 | SQL code: `Exc400`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/exc/exc400.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Exc400

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
    Exc400 = { id = 110103, title = "Scenario: Exc400", level = 40, classId = 4, actor = 1000003, marker = 11010301, exp = 0, noOffer = true, todo = "Hidden decomp probe. Recovered client surface has processEventWaekbyrtStart and exc400 route/cutscene methods; server objectives, rewards, and owner route are unverified." }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Exc400")
```

## Open gaps (esp. instance-battle needs)
- initText-only client surface; owner/objective route/rewards/completion UNRECOVERED. Do NOT invent fights.