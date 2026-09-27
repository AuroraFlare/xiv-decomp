# Goldsmith class quests (Gld200/300/306) — staged 2026-09-26

Three HOLD-gated skeletons. None is offered: every route needs the
Parley subsystem, unspawned NPCs, or unregistered recipes. Structure,
journal, markers, scenes, items, and positioned legs are fully wired
so each unblock ticket flips one gate instead of writing new flow.

## Files

- `Data/scripts/quests/gld/gld_quest_helpers.lua` — snapshot-diff
  synthesis credit, quality-exact count/consume, verified grants,
  ask/Echo result gate. Gil + marks stay central (single class).
- `Data/scripts/quests/gld/gld200.lua` — She Walks in Beauty (110360).
- `Data/scripts/quests/gld/gld300.lua` — F'lhaminn's Flower (110361).
- `Data/scripts/quests/gld/gld306.lua` — Struck Through the Heart (110362).
- `Data/sql/main_sql_edits/goldsmith_quests_main_sql.sql` — prereq
  chain + Gld200 gil split (21,000 total preserved).
- `Data/sql/live migrations/gld_prereqs_gil.sql` — same, for live DBs.

## Per-quest state

Gld200 (0/5/10/15/17/18/20/25): briefing, Z'ssapa nuggets, pin
handoff + brooch baseline, miner Parleys (HOLD), synth probe,
delivery + 1,000 gil, F'lhaminn Echo (045 ask + 050), Elecotte
reward (1760 EXP). State 18 routes via Colbernoux: the archived
journal and walkthrough agree against the template's Z'ssapa
objective; flagged for DAT re-check. Linkpearl skipped (no item id).

Gld300 (0/5/10/15/20-24/25-32/33/35/40/48/50): commission, ordered
Opyltyl-then-V'korolon refusal, Juliembert escort prep (HOLD),
content-owned clearing, Moogle Parley ranges (HOLD, actor
unresolved), guild report, Colbernoux flower grant, F'lhaminn
delivery, Echo (078 ask), Colbernoux reward (3420 EXP).

Gld306 (0/1/2/3/4/5/10/15): assignment, Sence Parley (HOLD; 011
setup scene plays), materials approval (positioned: 3-for-baseline),
Elecotte verify (3) + consume/deliver (4, mid 020), Ossuary entry
ask (025), Echo gate (030), Colbernoux reward (4720 EXP). Top
gil/marks variant left central until the variant rule is recovered.

## Verification

- `C:\tmp\gld-verify\simulate_gld.py` — 3/3 Lua sims (offer gates,
  order gates, holds, positioned legs, finales, cleanup).
- `mooncheck` — Gld helpers + all three scripts parse under MoonSharp
  with entry points present.
- Repo untouched; no availability rows (all gated).

## Unblock tickets

1. Parley subsystem + result hook (flags 2/3/4 reserved on Gld200).
2. Public Colbernoux / miners / F'lhaminn / Sence spawns or the
   guild-instance private areas that own them.
3. Spriggan escort driver (cnj306 pattern) + Moogle actor + node
   and augite item-command owners.
4. Brooch / augite / replica recipe registration (material sets
   unrecovered — do not invent).
5. Gld306 reward-variant rule; Gld200 Linkpearl item id; DAT
   re-check of the state-18 objective owner.
