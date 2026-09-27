# Tanner class quests (Tan200/300/306) — staged 2026-09-26

Three HOLD-gated skeletons plus three exact recipe registrations.
None is offered: every route needs the Parley subsystem, unspawned
NPCs, or unowned content triggers. Structure, journal, markers,
scenes, items, recipes, and positioned legs are fully wired so each
unblock ticket flips one gate instead of writing new flow.

## Files

- `Data/scripts/quests/tan/tan_quest_helpers.lua` — snapshot-diff
  synthesis credit, quality-exact count/consume, verified grants,
  ask/Echo result gate. Gil + marks stay central (single class).
- `Data/scripts/quests/tan/tan200.lua` — The Silent Partners (110380).
- `Data/scripts/quests/tan/tan300.lua` — Designer Imposters (110381).
- `Data/scripts/quests/tan/tan306.lua` — Head of the Class (110382).
- `Data/sql/main_sql_edits/tanner_quests_main_sql.sql` — recipes
  5402/5403/5404 (exact recovered sets, TNR 'E', kind 'CC').
- `Data/sql/live migrations/tan_recipes.sql` — same, for live DBs.

## Per-quest state

Tan200 (0/5/10/15/17/18/20): Lalatta intro (damaged grant), briefing
(repaired baseline), Lalatta delivery (consume + first remnants),
Lefwyne top-up to the archived three sets + Hereward jacket probe
(consume remnants), showing (033), BODY-slot equip gate (037),
Hereward finale (consume jacket + 050, 1760 EXP). The stable trip
and Gylbart delivery are folded into Hereward talks (marked).

Tan300 (0/5/10/15-19/20-24/25): saddle grant, ambush scene, folded
Yuhelmeric delivery (consume + bag baseline), bag probe, Vielle
Parley (HOLD; flag 0 newly assigned) with a positioned ransom
handoff (consume + 040), Hereward reward (3420 EXP). Bag output
follows metadata + walkthrough over the journal's shoes text.

Tan306 (0/5/10/16/17/18/20/22/25/30): questions (unroutable),
assignment, discovery, novice Parley (unroutable; flag 0 reserved),
Beli-then-Maddeline boot grant, any-one-of-eight five-piece prep
(held count; bought pieces allowed), vintage repair probe, Hereward
showing (consume + 030), juggernaut talk (bare), Lalatta Echo (040
ask) + Hereward finale (050, 4720 EXP). Markers sequential
(range-only); 028 unmapped.

## Verification

- `C:\tmp\tan-verify\simulate_tan.py` — 3/3 Lua sims (offer gates,
  order gates, equip gate, holds, positioned legs, finales, cleanup).
- `mooncheck` — Tan helpers + all three scripts parse under MoonSharp
  with entry points present.
- Repo untouched; no availability rows (all gated).

## Unblock tickets

1. Parley subsystem + result hook (flags reserved on Tan300/306).
2. Public Lalatta / Vielle / student / novice spawns (or the
   instance owners) + Gylbart / stable-inspector / remnant-crate /
   ambush / hostage trigger owners.
3. Tan200 jacket recipe binding + remnant-count confirmation (archive
   says three, template says one); work-slot selector; Echo
   ownership; Linkpearl item id.
