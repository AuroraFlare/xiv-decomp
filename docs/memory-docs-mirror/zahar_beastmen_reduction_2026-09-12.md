# Zahar'ak ordinary beastmen reduction — 2026-09-12

The corrected request is **50% fewer ordinary beastmen, with no drake
reduction**. Six ordinary roles total 39 instead of 78. With 13 Battle Drakes
and the six protected encounter/key-bearing actors, Zahar'ak has **58 enemies**,
down from 97.

| Ordinary role | Before | After |
| --- | --- | --- |
| Chandler | 13 | 7 |
| Drubber | 13 | 6 |
| Halberdier | 13 | 7 |
| Illuminator | 13 | 6 |
| Ostiary | 13 | 7 |
| Sniper | 13 | 6 |

Battle Drakes, Flamefist, both linked Burned Brothers, Ranig'oh, Feretrar and
Scriniary keep their positions and IDs. All seven Zahar'ak coffers, eight
Natalan coffers, key sources, rewards and Natalan's 91 actors are unchanged.
Door 15834 remains closed and its southeast corridor remains empty.

The original manifest and recording are frozen. A separate
[reduction manifest](../Data/mobplacements/zahar_beastmen_reduction.json) pins
retained UIDs, all original rows and the 39 removed rows. Selection retains a
center anchor per role and spreads survivors using farthest-point selection.
Survivors do not move, change elevation or receive new IDs.

`tools/mobspawns/zahar_natalan.py build|check|render` exports the current 58.
`build(include_removed=True)` reconstructs the original 97 for audit. The
current preview is [Zahar'ak](maps/zahar-natalan-20260912/174/index.html).

For a database with the original population, use the
[separate half-density migration](../Data/sql/live%20migrations/zahar_beastmen_half_density_20260912.sql).
It deletes only matching original public rows, guarded by UID, profile, name,
zone, XYZ, private fields and groups. Moved or customized rows survive. The full
Zahar/Natalan migration also includes those removals; its insertion list now
contains only survivors. The placement-only additive export does not delete.

Ten focused tests cover existing encounters/coffers plus drake protection,
stable IDs, repeat imports and moved, linked or private row preservation.
No live database import or restart was performed.
