# Parley title resolutions — DAT xtx_negotiationTable.csv (62 rows) — 2026-09-27

Source: `FF14-Memory/docs/Dat Mining/xtx_negotiationTable.csv` (full read).
Fills the `t?` gaps in `parley/parley_decomp_2026-09-27.md` line 9 and clears
`negotiationTitleUnresolved` flags in `class_quest_template.lua` + HOLD files.
Text columns populated; numeric columns empty in export, so difficulty / turns /
turn-time remain unrecovered — engine defaults (3/12/20) stand, do not invent.

## Resolved titles (quest: title IDs)

- Min300 Little Saboteurs: **1201** (was t?)
- Cul300 Mystery of the Gastronome Gone Home: **3001** (was t?)
- Gld200 She Walks in Beauty: **4301, 4701, 4801** (3 miner parleys; was t?)
- Gld306 Struck Through the Heart: **5201** (was t?)
- Alc300 The Boy and the Dragon Gay: **1302, 1303, 1304** (3 variants; confirmed)
- Bsm300 Song of the Sirens: **4201, 4302, 4401, 4601, 4702, 4901** (6 miners)
- Wdk300 Hide and Seek Shenanigans: **2101, 2201, 2301, 2302** (4 variants; confirmed)
- Wvr300 Dance the Night Away: **2401, 2501, 2601, 2701, 2801, 2901** (confirmed)
- Cul306 Something in the Soup: **3101, 3201, 3301, 3401**
- Gld300 F'lhaminn's Flower: **3801** (confirmed) | Tan300 Designer Imposters: **1101** (confirmed)
- Tan306 Head of the Class: **5401** (confirmed) | Hrv300 Grass Always Greener: **1301** (live)
- Man300 Toll of the Warden: **5001, 5101** (= engine DEFAULT_TITLE_ID 5001, live)
- Man308 Lord Errant: **1401, 1501, 1601, 1701, 1801, 1901, 2001, 5301** (live: t1401 captive)

## Non-quest rows (do not bind to quests)

- Tutorials: 3501, 3511-3514, 3601, 3611-3613, 3701, 3711-3714
- Test: 1 (potion test), 3901, 4001, 4101, 4501 (simple potion tests)

## Implementation binding (Hrv300 pattern)

Intro talk stamps `negotiation.enabled=1` + `negotiation.title_id` + items +
difficulty/max_turns/turn_time on the NPC; `onNegotiationResult` accepts a win
only with (introduced flag + window seq + correct NPC + class/level + required
item in hand); clears `negotiation.enabled` after the win. Multi-title quests
bind one title per opponent/stage; order between same-quest variants is NOT in
the table and must come from scene/event or footage evidence.
