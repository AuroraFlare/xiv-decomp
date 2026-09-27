# Scaffold Quest Replacement Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\scaffold_quest_replacement_contract_20260619`.

## High-signal findings

- There are `1` scaffolded side/special quest rows that need replacement.
- Recovered event methods across those rows: `0`.
- Current local behavior is direct scaffold accept/reward: `1` rows still call `InitQuestScaffold`.
- `0` rows link to recovered SimpleQuestBattle directors and should wait for that adapter.
- Replacement type split: `{"dungeon_unlock_or_special": 1}`.

## What Is Still Missing

| Priority | Gap | Count | Next |
| --- | --- | ---: | --- |
| P1 | Scaffold rows complete without recovered delegateEvent flow | 1 | Replace one scaffold family at a time with explicit sequence scripts. |
| P1 | SimpleQuestBattle-linked scaffold rows need director adapter first | 0 | Implement SimpleQuestBattle adapter before migrating battle phases. |
| P1 | Relic/special long-chain scaffold is too large for direct replacement | 0 | Split into milestones and keep reward grants disabled until inventory/chest gates are proven. |
| P2 | Dungeon/special unlock scaffolds need content side-effect mapping | 1 | Map unlock flags, entrance actors, and journal markers before completion flow. |
| P2 | Dialogue/objective scaffolds can be replaced with sequence scripts | 0 | Use local handwritten ETC/WLD scripts as templates for ENPC flags, counters, and marker callbacks. |

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | Scaffold replacement template | Data/scripts/quests/etc |
| 2 | SimpleQuestBattle waitlist | SimpleQuestBattle-linked ETC rows |
| 3 | Relic/dungeon safeguards | etc106, etc200, etc201, etc202, etc304 |
| 4 | Journal marker payloads | getJournalMapMarkerList |

## Generated Files

- `source_inventory.csv` (3 rows)
- `scaffold_config_contract.csv` (4 rows)
- `recovered_scaffold_scenario_contract.csv` (1 rows)
- `recovered_scaffold_event_contract.csv` (0 rows)
- `local_scaffold_current_behavior.csv` (1 rows)
- `replacement_plan.csv` (1 rows)
- `local_gap_matrix.csv` (5 rows)
- `implementation_contract.csv` (4 rows)
- `probe_queue.csv` (5 rows)
- `source_term_hits.csv` (5 rows)
- `contract_summary.json`
- `README.md`
