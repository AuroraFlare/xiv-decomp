# Culinarian class quests (Cul200 / Cul300 / Cul306) implementation

Date: 2026-09-26. Status: Cul200 playable; Cul300 gated; Cul306 gated
skeleton. No retail client decomp was performed; all routes come from
the repo's own recovered `CLASS_QUESTS` metadata, engine APIs were read
from repo sources, and dialogue is the client's own `processEvent*`
scenes (server fires them, never scripts retail text).

## What changed

Staged under `/tmp/cul-quests/`, mirroring repo paths. Copy each file
over its repo counterpart (or `git apply` the allowlist patch):

| Staged file | Target | Effect |
|---|---|---|
| `Data/scripts/quests/cul/cul_quest_helpers.lua` | new file | Shared credit/consume/ask helpers |
| `Data/scripts/quests/cul/cul200.lua` | replaces stub | Playable Cul200 |
| `Data/scripts/quests/cul/cul300.lua` | replaces stub | Full Cul300, offer-gated |
| `Data/scripts/quests/cul/cul306.lua` | replaces stub | Cul306 skeleton, offer-gated |
| `Data/sql/main_sql_edits/culinarian_quests_main_sql.sql` | instructions + statements | Prereqs + 4 recipe registrations |
| `Data/sql/live migrations/cul_recipes_and_prereqs.sql` | new migration | Live mirror of the SQL edits |
| `quest_availability_cul200.patch` | `git apply` | Enables offer 110440 only |

No C# changes (snapshot credit + ask gating need no new callbacks).
`CLASS_QUESTS` Cul entries are left untouched as the recovered record;
they are inert once the stubs are replaced.

## Cul200: playable

Flow: Charlys offer (CUL20, no prereq asserted) -> cook the Pie Crust
for Prudentia and the Pate for Pulmia -> deliver each dish, hear each
verdict -> Charlys final (processEvent030) -> 1760 EXP max. All NPCs
spawn publicly in Limsa (zone 230); both recipes registered (ids
5386/5387, exact five-material sets, CUL 20, no crystals); all ten
materials obtainable in-game (Tiger Cod in pools, Spinach harvested,
rest normal trade goods); no material-set collisions.

Authored: snapshot-diff cooking credit (traded dishes credit); branch
counters 5 challenged / 10 delivered / 15 verdict (the recovered values
with their natural reading); scene packing per customer (delivery then
verdict: 010/017 Prudentia, 015/020 Pulmia, numeric-order best effort);
marker mapping from the range (01 offer, 02-07 branches, 08 final).
Iron Frypan NOT granted (reward era conflict); gil/marks central.

## Cul300: gated (Parley + route actors)

Full 9-state machine; only documented owners route talks (Charlys 0/35/
40, thickset accept-any HOLD at 15). States 5/10/20/25/30 set no ENPC
(their owners are unrecovered; stale talks are safe no-ops). Blockers:
no Parley subsystem, no thickset-opponent spawn, five unowned states.
Prereq SQL set to 110440 (documented). EXP 3420 max.

## Cul306: gated skeleton (grant bindings unknown)

Offer/prereq/baselines/journal/markers/final-Charlys-reward implemented;
states 5/10/15/20/25 route nothing (which specialist grants the meat,
spice, and recipe is unrecovered; Devilshroom source unresolved; Echo
trigger NPCs unknown). Both meatball recipes still registered (ids
5388/5389, exact sets incl. x2 Devilshroom via repeated slot) so
synthesis works the moment grants resolve. Work-counter map, Rsushmo /
Frailoise accept-any variants, and the second-Echo flag machine are in
place as the precise completion template. Prereq SQL set to 110441.
EXP 4720 max.

## Verification performed (isolated /tmp copies; repo untouched)

* Lua logic simulation (`/tmp/cul-verify/simulate_cul.py`, 3/3 cases
  pass): full Cul200 walk (both branches, HQ delivery, pre-cooked
  denial, early-final refusal, gates, cleanup); Cul300 to the Parley
  HOLD plus positioned finish; Cul306 holds plus positioned finale.
  The sim caught two test bugs (cumulative scene log, ENPC accumulation
  semantics); no quest bugs.
* MoonSharp 2.0: all four files parse, load, and expose every entry
  point (`/tmp/mooncheck`, all pass alongside fsh + alc).
* Not performed: in-game client play (no client automation here).
