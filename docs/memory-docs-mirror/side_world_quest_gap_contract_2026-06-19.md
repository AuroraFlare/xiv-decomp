# Side/World Quest Gap Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\side_world_quest_gap_contract_20260619`.

## High-signal findings

- Recovered `etc/wld` scenario inventory has `235` files: `195` ETC and `40` WLD.
- Local `etc/wld` script inventory has `98` files: `86` ETC and `12` WLD.
- Missing local scripts remain the big gap: `137` total, split across ETC and WLD in the family table below.
- `1` local rows are present only as `InitQuestScaffold` consumers, so they intentionally skip recovered objective/dialogue flow.
- Existing local scripts call `552` recovered event methods, but `2` recovered event methods are still not bridged by local delegateEvent calls.
- `16` side/world rows are linked to recovered SimpleQuestBattle directors and should wait for that adapter before battle-phase parity.

## Family Summary

| Family | Recovered | Missing Scripts | Scaffolds | Handwritten | Gamedata Present | Matched Events | Missing Events |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| etc | 195 | 109 | 1 | 85 | 167 | 487 | 2 |
| wld | 40 | 28 | 0 | 12 | 36 | 65 | 0 |

## What Is Still Missing

| Priority | Gap | Count | Next |
| --- | --- | ---: | --- |
| P1 | ETC side/special recovered scripts missing locally | 109 | Start with gamedata-present rows that have recovered quest-offer and event methods. |
| P1 | WLD world sidequest recovered scripts missing locally | 28 | Use existing wld0* handwritten scripts as the template for missing wld0* rows. |
| P1 | Generic scaffolds need recovered event bridge replacement | 1 | Replace scaffold rows with sequence scripts that call recovered offer/progress/reward methods. |
| P1 | Local handwritten scripts do not cover all recovered event methods | 1 | Backfill follow-up/free/alternate branch calls only when local quest state can reach them. |
| P2 | Local scripts exist but call none of the recovered event methods | 0 | Audit these manually before assuming they are real parity. |
| P2 | SimpleQuestBattle-linked side quests lack director handoff | 16 | Use the SimpleQuestBattle adapter contract before replacing these battle phases. |
| P3 | Recovered rows with no local gamedata | 31 | Keep these behind data validation; do not add player-facing scripts until quest ids/names are verified. |

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | Missing script generator | Data/scripts/quests/etc and Data/scripts/quests/wld |
| 2 | Scaffold replacement | generic_quest_scaffold.lua consumers |
| 3 | Event parity audit | Existing handwritten etc/wld scripts |
| 4 | Battle objective handoff | SimpleQuestBattle-linked side quests |
| 5 | Journal/map marker validation | RequestQuestJournalCommand + getJournalMapMarkerList |

## Generated Files

- `source_inventory.csv` (6 rows)
- `recovered_side_world_inventory.csv` (235 rows)
- `local_side_world_inventory.csv` (98 rows)
- `side_world_code_parity.csv` (235 rows)
- `side_world_family_summary.csv` (2 rows)
- `missing_script_priority.csv` (137 rows)
- `scaffold_replacement_targets.csv` (1 rows)
- `event_bridge_parity.csv` (1 rows)
- `local_backend_surface.csv` (8 rows)
- `local_gap_matrix.csv` (7 rows)
- `implementation_contract.csv` (5 rows)
- `probe_queue.csv` (5 rows)
- `source_term_hits.csv` (1583 rows)
- `contract_summary.json`
- `README.md`
