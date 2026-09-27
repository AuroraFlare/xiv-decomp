# Mistbeard and Copperbell: later recording update

**Current override:** the [September 13 reduction](population_reduction_2026-09-13.md)
leaves **116** Mistbeard actors. Copperbell remains at **192**; its positions
are unchanged. Counts below describe the preceding pass. Current previews and
exports apply this later reduction and keep Water Elementals absent.

The current maps also show the later
[Copperbell round-room correction](copperbell_room_relayout_2026-09-12.md):
one Plain Pudding and one Gas Bomb moved inward at user-approved **estimated
Y=92.0**. All counts below remain unchanged. That exception supersedes the
original recorded positions of those two actors only.

The later pass now contains **177 ordinary mobs**, preserving all **5,896** previously
present canonical spawn rows, including their IDs, profiles and XYZ.

| Dungeon / floor | Before | Added now | Current |
| --- | ---: | ---: | ---: |
| Mistbeard Cove, zone 131 | 0 | 154 | 154 |
| Copperbell Mining Pits, zone 178 / page 1700 | 69 | 12 | 81 |
| Copperbell Formicary, zone 178 / page 1720 | 100 | 11 | 111 |
| Copperbell total | 169 | 23 | 192 |

[Current three-map review](maps/mistbeard-copperbell-20260912/index.html)
distinguishes these additions from all earlier Copperbell mobs. Each map has
its own pixel/world frame. Both Copperbell floors remain server zone 178.


The user subsequently requested removing both Mistbeard Water Elementals and
leaving their spots empty. All other placement IDs and XYZ remain unchanged.
The removal is pinned in `Data/mobplacements/mistbeard_water_elemental_removal.json`.
For an existing database, apply
[the scoped removal migration](../Data/sql/live%20migrations/mistbeard_remove_water_elementals_20260912.sql).
The two population migrations also include the guarded removal. Private or
moved/customized rows are protected. This update has not been imported live.
The 24 expansion/removal and density tests pass. Broader U'Ghamaro, Mun-Tuy,
Shposhae and Copperbell room snapshot checks encounter pre-existing mismatches
also present in HEAD; this removal does not refresh their frozen evidence.
A direct comparison with HEAD confirms the canonical spawn catalog differs
only by the two requested row deletions.

The original expansion manifest and `dungeon_population_expansion/plans.json`
remain frozen for downstream evidence. Use `current_plans.json`, current CSV,
SQL and previews for the active 537 expansion placements (154 in Mistbeard).
`build(include_removed=True)` reconstructs the original plans for audit.

## Mistbeard population

The saved [pre-ARR Mistbeard roster](https://web.archive.org/web/20130425164018/http://ffxiv.gamerescape.com/wiki/Mistbeard_Cove)
provides these zone-specific levels, hostility and historical integer grid
cells. The local source is `docs/ffxiv-1.0-wiki/regions/Mistbeard_Cove.html`.
The quantities and habitat extensions are authored, not recovered retail
spawn counts or coordinates.

| Ordinary mob | Levels | Count |
| --- | --- | ---: |
| Anemone | 45–49 | 6 |
| Bigmouth Orobon | 40–44 | 6 |
| Blind Eft | 40–44 | 14 |
| Floating Eye | 40–44 | 9 |
| Gall Gnat | 48–49 | 7 |
| Hedgemole | 46–49 | 9 |
| Maidenbug | 28–30 | 6 |
| Mistbeard Buccaneer | 45–49 | 13 |
| Plain Pudding | 40–44 | 9 |
| Qiqirn Poacher | 45–49 | 8 |
| Revenant | 35–39 | 5 |
| Rock Crab | 40–44 | 6 |
| Rotting Corpse | 45–48 | 5 |
| Screaming Kalong | 40–44 | 11 |
| Sea Hare | 40–44 | 8 |
| Smoke Bomb | 40–44 | 6 |
| Water Elemental | 40–49 | 0 (removed) |
| Wight Warrior | 45–49 | 10 |
| Wild Jackal | 45–48 | 6 |
| Yarzon Scavenger | 40–44 | 10 |

Excluded: Serpent Reaver Claw/Eye/Fin from **Revenge on the Reavers**, and the
seasonal Sprinting Spriggan. Existing quest and faction definitions are
preserved. The archived roster lists no Mistbeard NMs. No leve, quest or NM
actors were added or multiplied. The outstanding Reaver quest remains separate
work, as recorded in `docs/etc1_quest_mob_placements_2026-09-11.md`.

The main caves have an 18-yalm minimum spawn separation, 15-yalm door buffers,
a 40-yalm gate buffer and a 35-yalm buffer around the staged northern quest
marker. The dock branch, its narrow approach, and portions of several rooms
remain open. The new clear/blue-fog weather split is unchanged. Water creatures
use captured ground beside the western pools; broad rooms and passages retain
spaces between groups. The two Water Elementals were subsequently removed at the user's request; their spots stay empty.

The source is an independent frozen copy of all **2,406 nodes / 1,021 captured
links** in the latest Mistbeard recording. MapNavi 600 uses offsets X=2400 and
Z=2176, scale 2, and native 2560×2048 artwork. The three earlier user-confirmed
positions at Y=-20 are preserved exactly in `map_coordinate_validations.json`;
that confirmation is not generalized to other positions.

Scoped profiles **39416–39435** reuse pinned ordinary combat donors and their
initializer scripts. The Mistbeard Buccaneer actor 2180202 had an empty server
class. Its native main/off-hand models match ordinary donor 1067 exactly, so
its binding now uses that donor's gladiator class. The update touches only
that previously empty class and retains native appearance/name IDs. Conflicting
custom class bindings are preserved and prevent the new buccaneer spawns.
Other variants have equivalent initializer text; family skills are reused.
New names have no inferred loot lists. This does not reconstruct every retail
spell, skill, loot table or behavior.

Period footage searches did not establish additional exact spawn positions.
The habitat selections therefore remain explicitly map-authored; no video
verification of these coordinates is claimed.

## Copperbell recording repair and placement evidence

The copied files again contained Copperbell ground under Ul'dah IDs 175/209.
The frozen update is `Data/quicknavmesh-evidence/copperbell-update-20260912`.
It retains the same five exact XYZ handoffs documented in the first repair.
Its older node IDs are intact, with 15 small XYZ averaging revisions and 257
appended IDs: 56 in source 178 and 201 in source 175. The appended 175 run is
inside the native Copperbell extent at dungeon elevations; no captured edge
crosses the reviewed city/dungeon split.

The updated repair preserves all 2,068 earlier runtime nodes and their IDs,
then adds all 272 new/revised XYZ as separate samples. Exact shared XYZ alone
can reuse an ID. The result is **2,340 nodes / 1,059 captured links**. Every link
records its original or updated snapshot, source zone and source-local
endpoints in `repair.json`. Nearby samples and consecutive IDs never generate
new edges. All 125 genuine zone-175 city nodes and 57 zone-209 city nodes remain
in their respective city files. Source snapshots themselves are unchanged.

The 23 new Copperbell mobs use newly appended nodes only, at their exact
captured heights. New upper-floor candidates use Y=105–125, new lower-floor
candidates Y=65–100; the transition range between those is unpopulated in this
pass. Existing explicitly assigned raised Formicary spurs remain unchanged.
Fourteen-yalm spacing and the existing entrance/door buffers are preserved.
The new central lower passage contains lanterns, puddings, bombs and corpses,
continuing authored neighboring habitats. Historical Antling floor evidence
and all eight reviewed Copperbell profiles remain unchanged.

For the original 179 additions, local support is a captured edge for 99 positions.
The other 80 have another sample within ten horizontal and three vertical
yalms in the same source point cloud. Those are explicitly inferred local
support, not captured edges or a collision-safe roaming guarantee.

## Rebuild, verification and activation

```powershell
python -B tools/mobspawns/repair_copperbell_update.py check
python -B tools/mobspawns/dungeon_population_expansion.py build
python -B tools/mobspawns/dungeon_population_expansion.py check
python -B tools/mobspawns/dungeon_population_expansion.py render
python -B tools/mobspawns/render_mistbeard_copperbell_update.py
```

The later repair's `apply` command preflights all three current files and
refuses to replace any recording newer than its reviewed inputs. The original
repair remains frozen for reproducibility; do not run its `apply` command over
the later recording.

**71 Python tests pass** across the coordinate, five initial dungeon,
expanded-population and updated-repair suites. They cover exact source XYZ,
floor scope, retained populations, all captured edges, city preservation,
repeat imports, FLOAT32 profile storage and custom profile/class conflicts.
The prior expansion's full plans are frozen and compared during every build.
All three new native-map PNGs were inspected. Live roaming and play density
still need normal in-game testing.

For an already populated server, import only
`Data/sql/live migrations/mistbeard_copperbell_update_20260912.sql` to add these
179 mobs. Existing Copperbell profile IDs must already be installed. The full
`dungeon_population_expansion_20260912.sql` also includes this update and remains
safe to import repeatedly. New canonical placement IDs are **960827–961005**.

Deploy the earlier rebuilt Map Server zoning fix and the corrected checkout
files `Data/quicknavmesh/zone_175.tsv`, `zone_178.tsv`, and `zone_209.tsv`, then
restart/reload the server. Stop its recorder before replacing those files, so
the old server cannot save mis-zoned data over them again. The external copies
in `D:/navmesh/quicknavmesh` remain the untouched source files.

Changes have been made in the checkout only: no live SQL import, server restart
or client teleport was performed.
