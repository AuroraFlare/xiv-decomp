# Alchemist class quests (Alc200 / Alc300 / Alc306) implementation

Date: 2026-09-26. Status: all three fully implemented but HOLD-gated
(not offered). No retail client decomp was performed; all routes come
from the repo's own recovered `CLASS_QUESTS` metadata, engine APIs were
read from repo sources, and dialogue is the client's own `processEvent*`
scenes (server fires them, never scripts retail text).

## What changed

Staged under `/tmp/alc-quests/`, mirroring repo paths. Copy each file
over its repo counterpart:

| Staged file | Target | Effect |
|---|---|---|
| `Data/scripts/quests/alc/alc_quest_helpers.lua` | new file | Shared credit/consume/ask helpers |
| `Data/scripts/quests/alc/alc200.lua` | replaces stub | Full Alc200, offer-gated |
| `Data/scripts/quests/alc/alc300.lua` | replaces stub | Full Alc300, offer-gated |
| `Data/scripts/quests/alc/alc306.lua` | replaces stub | Full Alc306, offer-gated |
| `Data/sql/main_sql_edits/alchemist_quests_main_sql.sql` | instructions + statement | Prereq ruling + recipe registration |
| `Data/sql/live migrations/alc200_recipe_and_prereq.sql` | new migration | Live mirror of the SQL edits |

No allowlist change (all three stay disabled) and no C# changes (no new
engine callbacks needed: synthesis credit is snapshot-based, asks gate on
the delegateEvent result like the fisher Echo gates).
`CLASS_QUESTS` Alc entries are left untouched as the recovered record;
they are inert once the stubs are replaced.

## Alc200: gated on S'lyhhia's spawn

Flow: Nogeloix offer (ALC20 + Man200) -> Nomomo Mole grant -> synthesize
Potent Medication -> Nogeloix inspection (item kept, work slot 2 = 1) ->
S'lyhhia handoff ask -> ward scene -> Nogeloix report (1760 EXP max).

* Prerequisite ruled for the archive: 110013 (Man200 is implemented and
  enabled). SQL updated 0 -> 110013.
* Recipe registered (id 5385, server-assigned): Mole + Eye Drops -> Potent
  Medication, ALC 20, no crystals (unrecovered; 1000+ precedent rows),
  finished good. Synthesis matching is server-side by material hash, so
  the row makes the objective craftable. No material-set collision.
* Ward is client-scene-only (recovered director is empty, no ward area
  identified): handoff ask and ward entry play across two S'lyhhia talks.
* Mole re-grant on total loss only (authored recovery). Iron Alembic NOT
  granted (reward era unresolved); Linkpearl skipped (id unresolved).

## Alc300: gated on NPCs + Parley

Full 7-state route (Damielliot, children, funds briefing, Penelope,
Parley HOLD, grass delivery, ward finale). Offer needs: Damielliot spawn
(any of 3 candidates accepted, documented), sickly-child spawn, S'lyhhia
spawn, and a Parley subsystem (none exists server-side). Memos are never
granted (payment/memo source unresolved); state-30 trigger is S'lyhhia
(narrative giver; exact actor unresolved). EXP 3420 max.

## Alc306: gated on NPCs + recipe + past area

Full 6-state route (sickroom, Echo HOLD, find, on-site synth, delivery,
report). Offer needs: S'lyhhia spawn, Damielliot spawn, the complete
salve recipe (additional materials unresolved: nothing registered rather
than guessing), and the Echo past area identity (no server warp).
EXP 4720 max.

## Verification performed (isolated /tmp copies; repo untouched)

* Lua logic simulation (`/tmp/alc-verify/simulate_alc.py`, 3/3 cases
  pass): full Alc200 walk including recovery; Alc300 to the Parley HOLD
  plus positioned finish and all three Damielliot candidates; Alc306 to
  the Echo HOLD plus positioned finish. Journal, markers, inventory, EXP,
  gates, and abandon cleanup asserted throughout.
* MoonSharp 2.0 (the server's interpreter): all four files parse, load,
  and expose every entry point (`/tmp/mooncheck`, all pass alongside the
  fisher files).
* Not performed: in-game client play (no client automation here) and the
  missing-spawn/Parley/past-area subsystems, which are the documented
  unblock criteria.

## Next classes

Offer-NPC spot check (all spawn publicly): Bsm Bodenolf 1000144, Cul
Charlys 1000138, Gld Prudentia 1000168 / Elecotte 1000950. Tan/Wvr/Wdk
offers still to survey. Proposed order: Cul -> Bsm -> Gld -> Tan/Wvr/Wdk
by NPC coverage.
