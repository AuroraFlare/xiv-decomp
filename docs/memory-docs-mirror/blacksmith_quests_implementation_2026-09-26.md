# Blacksmith class quests (Bsm200 / Bsm300 / Bsm306) implementation

Date: 2026-09-26. Status: all three fully implemented but HOLD-gated
(not offered). This line is DUAL-CLASS (Blacksmith 30 / Armorer 31):
branches lock at accept and select recipes and guild marks. No retail
client decomp was performed; all routes come from the repo's own
recovered `CLASS_QUESTS` metadata, and dialogue is the client's own
`processEvent*` scenes (server fires them, never scripts retail text).

## What changed

Staged under `/tmp/bsm-quests/`, mirroring repo paths. Copy each file
over its repo counterpart:

| Staged file | Target | Effect |
|---|---|---|
| `Data/scripts/quests/bsm/bsm_quest_helpers.lua` | new file | Shared credit/consume/marks helpers |
| `Data/scripts/quests/bsm/bsm200.lua` | replaces stub | Full Bsm200, offer-gated |
| `Data/scripts/quests/bsm/bsm300.lua` | replaces stub | Bsm300 skeleton, offer-gated |
| `Data/scripts/quests/bsm/bsm306.lua` | replaces stub | Full Bsm306 minus puzzle, offer-gated |
| `Data/sql/main_sql_edits/blacksmith_quests_main_sql.sql` | instructions + statements | Prereqs + marks autoGrant + 10 recipes |
| `Data/sql/live migrations/bsm_recipes_prereqs_marks.sql` | new migration | Live mirror of the SQL edits |

No allowlist change (all three stay disabled) and no C# changes.
`CLASS_QUESTS` Bsm entries are left untouched as the recovered record;
they are inert once the stubs are replaced.

## Bsm200: gated only on Mimidoa's public spawn

Flow: Bodenolf offer (BSM/ARM 20, branch locks) -> forge the four
branch parts -> Bodenolf stage talks (005 handoff, 010 instrument test)
-> Mimidoa final verifies and consumes all four -> 2000 EXP max +
branch marks (2000).

* All eight exact recipes registered (ids 5390-5397, BSM 'B' / ARM 'C',
  no crystals, cases CC / parts BB). No collisions.
* Rolling snapshot-diff credit (one baseline slot reused; four counters
  only). Parts kept until the finale (commission delivery). Class
  switching mid-quest refuses talks until resumed on the locked branch.
* Unblock lead: Mimidoa's only spawn is a man0l1 private copy at zone
  230 (-483.67, 44.5, 404.51) - verify, do not blind-copy.
* Tools NOT granted (era unresolved); gil central (20000, lowest of the
  unresolved variants).

## Bsm300: gated skeleton (Parley + miners + recipe)

Offer/prereq/markers/journal/positioned Mimidoa finale implemented;
states 5-40 route nothing (six miners unidentified, no Parley subsystem,
material-choice mechanic and windwheel recipe unrecovered).
Prereq SQL set to 110320. Marks follow current class; EXP 3000 max.

## Bsm306: gated on combine + puzzle + Mimidoa

Offer/branch/component/equip-gate (EARS slot 17) implemented; mold and
casing recipes registered (ids 5398/5399). Blocked: the earplug COMBINE
recipe (unrecovered, nothing guessed), all eight island victims + clue
mapping + island placement, public Mimidoa. The eight-flag puzzle
machine with one-clue enforcement is coded and sim-tested, unwired.
Prereq SQL set to 110321. Marks follow locked branch; EXP is 0 (the
post-1.20 amount is UNREPORTED - inferring 4720 would be guessing).

## Branch marks fix (applies to all three)

The central grant cannot branch: with both Currency rows auto-granted,
every Blacksmith would also receive Armorer marks and vice versa. The
six Currency rows for 110320/110321/110322 are autoGrant-disabled (data
kept as the recovered record) and the scripts grant the branch-correct
marks instead. Verified: `LoadQuestRewards` honors `autoGrant`, and
Money items route to the currency package via `AddItem`.

## Verification performed (isolated /tmp copies; repo untouched)

* Lua logic simulation (`/tmp/bsm-verify/simulate_bsm.py`, 3/3 cases
  pass): full Bsm200 walks on BOTH branches (lock, stages, four-piece
  finale, branch marks), class-switch refusal, pre-forged denial;
  Bsm300 holds + positioned finale on both classes; Bsm306 component
  flow, equip gate, puzzle scaffold incl. two-clue refusal, positioned
  finale with EXP 0. The sim caught one test bug (missing GM-accept);
  no quest bugs.
* MoonSharp 2.0: all four files parse, load, and expose every entry
  point plus the marks map and victimTalk scaffold (`/tmp/mooncheck`,
  all pass alongside fsh + alc + cul).
* Not performed: in-game client play (no client automation here).
