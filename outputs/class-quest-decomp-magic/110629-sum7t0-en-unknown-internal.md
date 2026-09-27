# 110629 [en] (unknown/internal) — `sum7t0` (Phase 3 MAGIC)

- Class: primal | Level: 0 | SQL prereq: 0 | SQL code: `Sum7t0`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/sum/sum7t0.lua` (3 lines, scaffold)
- Config: generic_quest_scaffold.lua:Sum7t0

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Implementation state
SCAFFOLD: thin file calls InitQuestScaffold with a reference-only row (`noOffer`, no owner/objective/director/reward proof unless noted). The quest cannot be offered. See config block below.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- (none in gamedata_quest_rewards.sql)

## Mob profiles + spawn evidence
- No mobType bindings in config (no kill objective in this implementation).

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
Sum7t0 = { id = 110629, title = "Scenario: Sum7t0", group = "primal", noOffer = true, markers = {}, todo = "Reference-only initText loader. No owner, director, battle clear, reward, or attunement proof." },
```

## Lua header (verbatim)
```lua
require ("quests/generic_quest_scaffold")

InitQuestScaffold("Sum7t0")
```

## Open gaps (esp. instance-battle needs)
- No owner/objective/director/reward proof; primal instance + attunement flow entirely UNRECOVERED. Do NOT invent fights.