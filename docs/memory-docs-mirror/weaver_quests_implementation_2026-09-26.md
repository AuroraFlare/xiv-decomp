# Weaver class quests (Wvr200/300/306) — staged 2026-09-26

Three HOLD-gated skeletons plus two exact recipe registrations. None
is offered: every route needs the Parley subsystem, unspawned NPCs,
or unowned content triggers. Structure, journal, markers, scenes,
items, recipes, and positioned legs are fully wired so each unblock
ticket flips one gate instead of writing new flow.

## Files

- `Data/scripts/quests/wvr/wvr_quest_helpers.lua` — snapshot-diff
  synthesis credit, quality-exact count/consume, verified grants,
  ask/Echo result gate. Gil + marks stay central (single class).
- `Data/scripts/quests/wvr/wvr200.lua` — Hoodwinked (110400).
- `Data/scripts/quests/wvr/wvr300.lua` — Dance the Night Away (110401).
- `Data/scripts/quests/wvr/wvr306.lua` — A Fruitful Murder (110402).
- `Data/sql/main_sql_edits/weaver_quests_main_sql.sql` — prereq chain
  + recipes 5400/5401 (exact recovered sets, WVR 'F', kind 'CC').
- `Data/sql/live migrations/wvr_recipes_prereqs.sql` — same, for live DBs.

## Per-quest state

Wvr200 (0/5/6/8/10): Bazaar intro (Chuchumu grants the Ripped Hood),
Deaustie report (005_2 + hood baseline), Deaustie verify (bare),
Chuchumu delivery (consume + 020), Deaustie reward (EXP 0:
post-1.20 amount exists but is unreported; NO Brass Needle).

Wvr300 (0/5/10/15/19/20): assignment (bare), Soileine lead (012;
public spawn matches the marker exactly), Theldry bargain (015),
four Parleys (HOLD; flags 0-3 newly assigned) with a positioned
Theldry slipper grant (018) once all four win, Chuchumu delivery
(consume + 020), Deaustie reward (3420 EXP).

Wvr306 (0/5/10/15/20/25/30): order (010), briefing (bare + glove
baseline), Copperbell on-site probe (020 at ten gloves, else 008
progress response), freeing confirm (008_2 when short), glove
delivery to Deaustie (consume ten, bare), Gold Court (unroutable:
actors unresolved), return (030 + 3720 EXP — the stated maximum,
NOT the usual 4720). Non-combat: no spiders, no kills.

## Verification

- `C:\tmp\wvr-verify\simulate_wvr.py` — 3/3 Lua sims (offer gates,
  holds, positioned legs, multi-count probes, finales, cleanup).
- `mooncheck` — Wvr helpers + all three scripts parse under MoonSharp
  with entry points present.
- Repo untouched; no availability rows (all gated).

## Unblock tickets

1. Parley subsystem + result hook (flags 0-3 reserved on Wvr300).
2. Public Chuchumu / Theldry / Nesta spawns (or the instance copies;
   Cicely/Keelty/Miounne Parley copies sit away from their public
   spawns) + Bazaar/Copperbell/Gold Court trigger owners.
3. Silk-removal + beside-Chuchumu synthesis drivers and the
   non-combat SQB lifecycle; Gold Court actors; Echo ownership.
4. Wvr200 Linkpearl item id; Wvr200 EXP amount; 005/018/020 variant
   selection rules; the 030 scene-internal split.
