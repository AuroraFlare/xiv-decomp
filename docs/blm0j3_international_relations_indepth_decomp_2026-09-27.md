# Blm0j3 International Relations (111263) indepth decomp - 2026-09-27 (JOB BLM)

Lv40. Lalai -> Kazagg Chah (cave west of Camp Horizon) -> Whitetalon + two
Ragged Hippocerfs (minions first) -> Kazagg. Status: ENABLED (pre-existing
adapter, verified + hardened with a level floor this pass).

## Client scenario (contract from hook table + audit; chunk decomp absent)

- Offer `processEventLALAIStart`.
- `processEvent005` is the real Kazagg introduction: R3 race payload into
  `say(quest,14,0,arg1)` (English text 14 switches Hyur/Elezen/Lalafell/
  Miqo'te/Roegadyn); conversational fade (out 1s, wait 2, in 1s); NO NQ scene
  or warp. Texts 15-19/42: minions-first order + return-after-victory.
- `processEvent000` is Lalai's reminder (find Kazagg); `processEvent005_1`
  repeats the battle order; suffixed methods are secondary reminders.
- `processEvent010`: Kazagg return dialogue (finish/restart boundaries at
  texts 30-33). `processEventClear`: wait 3, ability `(27318,2)`, wait 6.
- `QuestDirectorBlm0j301` is an empty shell: no waves/coords/return.

## Stages / markers / positions

- Sequences: 0 Lalai offer -> 0 Kazagg route step (processEvent005 + race
  arg) -> 5 battle -> 10 Kazagg reward.
- Marker 11223201 (Kazagg): m00013/104/403, -1506.540039/-233.970001.
- Marker 11223202 (battle): m00013/101/102, -2048.120117/-1101.030029.
- Journal: three companions (4 total, stated as maximum).

## NPCs / mobs

- Lalai 1060035 (zone 209). Kazagg Chah 1060036, spawn row 2458, zone 172
  (-1366.8, 18.27, -164.106).
- Ragged Hippocerf x2: actor 2200406, mob 3089 (43-44), wave 1.
- Whitetalon: actor 2200407, mob 3114 (46/46), wave 2 (after both minions).

## Rewards

- EXP 4260; action 27318; 010/Clear presentation.

## Adapter (verified this pass)

- Template route replays 005 exactly once with the player's race index
  (unknown tribe blocks advancement); director stages wave 1 -> wave 2.
- Added `minimumLevel = 40` (launcher-enforced). Cap 4, timeout 600.
