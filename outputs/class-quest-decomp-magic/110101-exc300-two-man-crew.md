# 110101 Two-man Crew — `exc300` (Phase 3 MAGIC)

- Class: MRD 4 | Level: 30 | SQL prereq: 0 | SQL code: `Exc300`
- Availability: **hidden** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/exc/exc300.lua` (404 lines, custom-script)
- Config: none

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Sequence flow (VERIFIED: custom script + validator PASS; journal-ladder design; wiki §27)
WaekbyrtStart (nil/1 accepts) → Rostnsthal `020` briefing (`==1` gates) → 5 distinct valuables via 1090199 triggers exc300_valuable_1..5 (zone 230; states 7/8/9/10/11; state 11 transient → 12 same push) → Rostnsthal `022` report (pure say, no gate) → Rorojaru `025` sale (consumes held loot; grants Ship Funds 11000131 once) → Waekbyrt `030` reward (consumes funds; sqrwa+AddExp 3420; no central Exp row).
## Delegate events
Wired: WaekbyrtStart/020/022/025/030 + trialObject variants. Unbound ambient: 010_2-010_14/020_2-020_7/022_2-023_7/025_2-025_9.
## Actors/markers/flags
Waekbyrt 1000003; Rostnsthal 1001652 (SQL row 3311 present); Rorojaru 1000374; valuables 1090199 (SQL rows 3312-3316 present). Identity flags 0-4 stop re-farm; spent actors despawned. Markers 11010101-06 live (11010103 = push_mrd waypoint, not objective); 11010107-20 filler.
## Mob profiles
None — no battle (stale 8-Lemming xtx metadata rejected, VERIFIED absence).
## Rewards
EXP 3420 script; gil 24000 + marks 1000103x2400 central; Ship Funds transient.
## Instance-battle surface
None needed, none exists. No open-world kill surface.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x24000 (src wiki)
- Currency 1000103 x2400 (src dat-old)

## Mob profiles + spawn evidence
- No mobType bindings in config (no kill objective in this implementation).

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
(no config row found)
```

## Lua header (verbatim)
```lua
require ("global")
require ("quest")

--[[

Quest Script

Name: 	Two-man Crew
Code: 	Exc300
Id: 	110101
Prereq: Level 30, Marauder

Retail flow, from the decompiled client scenario
(tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/exc/exc300.lua),
the DAT quest markers, the 1.0 walkthrough, and the recovered journal
branch ladder (outputs/all-normal-quest-decomp-20260707
/quest_journal_reference_index.csv): Waekbyrt offer
(processEventWaekbyrtStart / exc30010) -> Rostnsthal briefing
(processEvent020 / exc30020) -> steal five distinct valuables from the
Krakens' den (collection states 7-11) -> Rostnsthal report
(processEvent022) -> Rorojaru sale for the Pirate Ship Funds
(processEvent025) -> Waekbyrt reward (processEvent030 / exc30030).
No chocobo callback or actor is used anywhere in this quest.
No battle or private duty exists in the recovered scenario.

Server sequences mirror the retail journal states exactly (Pgl200
precedent), because the client keys journal text off the sequence:
  0  journal row 35: find the scurvy dogs in the lounge (Rostnsthal)
  5  journal row 36: break into the Kraken's Arms' lair and steal loot
  7-11  journal row 37: collect the valuables (one state per pickup)
  12 journal row 37: return to the Astalicia, report to Rostnsthal
  15 journal row 38: sell the loot to the Ul'dah merchant (Rorojaru)
  16 journal row 39: return to the Astalicia (Waekbyrt reward scene;
     the text names Rostnsthal as awaiting because both are present
     below decks; no second Rostnsthal event exists in the decomp)
State 11 is the transient all-collected instant: the fifth pickup
passes through it to the return state 12 in the same interaction.
State 16 is the minimal post-sale state showing row 39 (the recovered
branch shows row 39 for every sequence >= 16).

```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.