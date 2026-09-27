# 110816 A Feast of Fools — `sum6m0` (Phase 3 MAGIC)

- Class: primal | Level: 45 | SQL prereq: 0 | SQL code: `Sum6m0`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/sum/sum6m0.lua` (22 lines, scaffold-extended)
- Config: generic_quest_scaffold.lua:Sum6m0

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Implementation state
SCAFFOLD: thin file calls InitQuestScaffold with a reference-only row (`noOffer`, no owner/objective/director/reward proof unless noted). The quest cannot be offered. See config block below.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Exp 0 x5340 (src wiki)

## Mob profiles + spawn evidence
- No mobType bindings in config (no kill objective in this implementation).

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
Sum6m0 = { id = 110816, title = "A Feast of Fools", group = "primal", actor = 2700013, markers = {}, todo = "Missing Good King Moggle Mog instance/director, battle completion, loot, and attunement flow." },
```

## Lua header (verbatim)
```lua
require ("quests/generic_quest_scaffold")

InitQuestScaffold("Sum6m0")

-- Thornmarch owns the battle result, while the quest remains responsible for
-- its later reward/completion conversation. The recovered content-exit scene
-- needs the missing Fretful Moogle actor, so record the notice without forcing
-- the entire scaffold quest complete.
-- The persisted quest flag field is an unsigned 24-bit value; keep this
-- authored local marker in its highest valid bit rather than the wider client
-- API-only range.
local FLAG_THORNMARCH_CLEAR = 23

function onNotice(player, quest, triggerName)
    if triggerName ~= "thornmarchClear" then
        return
    end

    quest:GetData():SetFlag(FLAG_THORNMARCH_CLEAR)
    quest:UpdateENPCs()
    player:SetTempVar("moogle.quest.clear", 1)
end
```

## Open gaps (esp. instance-battle needs)
- No owner/objective/director/reward proof; primal instance + attunement flow entirely UNRECOVERED. Do NOT invent fights.