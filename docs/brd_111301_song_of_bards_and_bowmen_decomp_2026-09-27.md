# Brd0j1 deep decomp: A Song of Bards and Bowmen (111301, Lv30)

JOB BRD, 2026-09-27. Instance quest (private SQB battle, no NQ cutscene).

## Sources

- `job_blm_pld_brd_drg_decomp_2026-09-07.md` (Bard/111301 section)
- `marker-evidence.json`: 11225001/02/03/04 (only real markers; 05-10 default)
- `docs/Dat Mining/brd0j1.csv`, `quest_marker.csv`, `xtx_journalxtxFst.csv`
- `class_job_quest_implementation_2026-08-23.md` (Brd0j1 held contract)
- Empty client `QuestDirectorBrd0j101` (SQB family shell, no callbacks)

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Georjeaux 1000830 (`processEventGEORJEAUXStart`) | NPC, Gridania (spawned, id 701) |
| 0 | Jehantel 1060039, marker 11225001 (`processEvent000`) | NPC |
| 1 | Pukno Poki 1001936, marker 11225002 (`processEvent005`) | NPC |
| 5 | Four Qiqirn Shirrer at 11225003 | Private SQB battle |
| 10 | Jehantel reward, marker 11225004 (`processEvent015` + `processEventJob`) | NPC |

Reminders `000_GEORJEAUX`/`005_JEHANTEL`/`010_PUKNOPOKI` are not stages.
Journal selectors (job_quest_journal): 0->0, 1->1, 5->2, 10->3 (Fst 434-437).
No persisted flags/counters used (route + battle only).

## NPCs and positions

| NPC | Actor | Marker | X/Z | Zone/Y (map_coordinates) |
| --- | --- | --- | --- | --- |
| Georjeaux | 1000830 | offer | Gridania spawn | 206, spawned |
| Jehantel | 1060039 | 11225001/11225004 | 737.49/1025.73 | 154 South Shroud, Y 0.13 (node 575, ~48u) |
| Pukno Poki | 1001936 | 11225002 | 1139.02/1012.67 | 154, Y -0.2 (node 3171, ~70u) |
| Battle | - | 11225003 | 1540.31/1018.76 | 154, ground ~0.1 (node 3805) |

Jehantel/Pukno had no public spawns and unusable actor-class rows (empty
path, NULL conditions); both are fixed by the BRD migration (new spawns
3260/3261, PopulaceStandard + talkDefault, appearances kept).

## Mobs

4x Qiqirn Shirrer, actor 2206306. No retail mob profile exists; adapter
mob 32750: job 2, Lv34, skill list 5048 (Kibosh/Sandspray/Misdirection),
speed/detection cloned from public `qiqirn_shirrer` 1227. Level follows
the Drg0j1 pack precedent (+4 over quest level), not the Lv46-48 public
row. Single wave, all four required.

## Triggers, cutscenes, rewards

- No NQ scene anywhere; scheduler calls inside talks are presentation.
- Accept EQ at pc83/0x43F; offer text switch `arg1 == numeric1`.
- Rewards: EXP 2661, Soul of the Bard 2000205, The Keeper's Hymn 3020410,
  Ballad of Magi 27237 (widget `(27237,2)` in `processEventJob`).

## Implementation

Standalone quest `Data/scripts/quests/brd/brd0j1.lua` + director
`QuestDirectorJobBrd0j1.lua` (cap 4, timeout 900). Shared template row
stays HOLD (untouched: parallel-worker surface).
