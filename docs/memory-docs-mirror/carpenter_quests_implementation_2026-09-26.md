# Carpenter class quests (Wdk200/300/306) — staged 2026-09-26

Three HOLD-gated skeletons. None is offered: every route needs the
Parley subsystem, unspawned NPCs, or unowned content triggers. No
SQL data changes are needed (prerequisites already correct, no exact
recipes, rewards central). Structure, journal, markers, scenes,
items, and positioned legs are fully wired so each unblock ticket
flips one gate instead of writing new flow.

## Files

- `Data/scripts/quests/wdk/wdk_quest_helpers.lua` — snapshot-diff
  synthesis credit, quality-exact count/consume, verified grants,
  ask result gate. Gil + marks stay central (single class).
- `Data/scripts/quests/wdk/wdk200.lua` — The Mouths of Babes (110300).
- `Data/scripts/quests/wdk/wdk300.lua` — Hide and Seek Shenanigans (110301).
- `Data/scripts/quests/wdk/wdk306.lua` — Spanning the Spectrum (110302).
- `Data/sql/main_sql_edits/carpenter_quests_main_sql.sql` — audit
  note (no edits required).
- `Data/sql/live migrations/wdk_no_changes.sql` — empty mirror.

## Per-quest state

Wdk200 (0/5/10/12/15/20): arrow grant, bare delivery (splintered
grant), unroutable branch search, ask-85 Blooming repair (wrong bows
refused per the archive; discoveries into slots 2/3/4, outcome 1
into slot 5), showing (consume + 030), A'naidjaa finale (1760 EXP;
Marcelloix meeting scene-internal).

Wdk300 (0/5/10/14/15/20/25/30/35): watch, supervise, hide-and-seek
(HOLD on Willelda; flags 0-2 newly assigned; S003/2302 unmapped),
Aunillie reveal, blocks grant, blocks delivery, salve grant, Roost
ask-108 gate, V'korolon cure (consume + flag) + flagged A'naidjaa
finale (3420 EXP).

Wdk306 (0/5/10/12/13/14/15/20/25/28): prep (supply baselines),
ten-leaf/ten-fetish probe, Nonolato petition briefing, Wybir
rendezvous, arrow leg (HOLD: no ally-shooter driver), A'naidjaa
report, excursion, collapsed Ryd talks, ask-108 drawing gate,
Marcelloix artwork finale (4720 EXP; no artwork item documented).
Metadata-only: no journal/walkthrough archive was recoverable.

## Verification

- `C:\tmp\wdk-verify\simulate_wdk.py` — 3/3 Lua sims (offer gates,
  holds, positioned legs, finale flags, cleanup).
- `mooncheck` — Wdk helpers + all three scripts parse under MoonSharp
  with entry points present.
- Repo untouched; no availability rows (all gated).

## Unblock tickets

1. Parley subsystem + result hook (flags reserved on Wdk300).
2. Public Wybir / Marcelloix / youngling spawns (or the instance
   owners) + branch ??? / hide-spot / route trigger owners.
3. Ally-shooter driver (enemy roster, arrow recipe/delivery,
   failure callbacks); leaf/fetish gathering + recipe owners.
4. Wdk200 outcome value mapping; Wdk300 fourth Parley mapping;
   Wdk306 artwork item + archive recovery.
