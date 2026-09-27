# Copperbell Mines: recording recovery, zoning and ordinary mobs

This document describes the initial population and first repair. The current
population is **192 mobs** and the current repaired recording has **2,340 nodes**;
see [the later recording update](mistbeard_copperbell_update_2026-09-12.md).
Use `repair_copperbell_update.py check` for the current runtime files.
Two actors were subsequently moved inward in the lower round room with an
approved estimated height; see [the room correction](copperbell_room_relayout_2026-09-12.md).

The checkout now has **121 ordinary mobs**, split between the Mining Pits (52)
and Formicary (69), plus a repaired **zone-178 movement graph with 2,068 nodes
and 945 captured links**. See the [two floor overlays](maps/copperbell-mines-20260912/index.html).
The original recordings remain frozen; the runtime repair is reproducible.

## Incorrect seamless zoning and recovered data

`WorldManager.SeamlessCheck` previously tested every rectangle in the current
region without requiring the current zone to belong to that rectangle's zone
pair. `ResolveSeamlessZoneChain`, used for scripted destination resolution, had
the same omission. Both now require membership in the named pair before testing
positions. Height-aware bounds and swept movement checks are preserved.

Copperbell is zone **178**, region 104. Ul'dah is **175 / 209** in the same
region. Ul'dah boundary 24 overlaps Copperbell's eastern lower passages in X/Z:
its zone-175 rectangle spans X -243..-208, Z 82..107, without a height range.
Copperbell node 1103 at `-209.14978, 89.56665, 85.815674` was then recorded as
zone-175 node 126 at **exactly the same XYZ**. Later Ul'dah boundaries caused
further erroneous handoffs into 209 and back into 175.

| Frozen source | Copperbell samples recovered | City samples retained |
| --- | --- | --- |
| zone 178 | nodes 1–1103 | — |
| zone 175 | nodes 126–960 (835 samples) | nodes 1–125, 123 links |
| zone 209 | nodes 58–192 (135 samples) | nodes 1–57, 59 links |

The five exact shared XYZ handoffs are 178:1103 ↔ 175:126; 175:179 ↔ 209:58;
175:180 ↔ 209:76; 175:238 ↔ 209:77; and 175:239 ↔ 209:192. Only those exact
shared points are unified. No nearby-point links or consecutive-ID links were
invented. Every output edge has original source-zone and source-node endpoints
in [repair.json](../Data/quicknavmesh-evidence/copperbell-recovery-20260912/repair.json).
Original files and SHA-256 hashes are in the adjacent manifest. The repair
refuses to overwrite runtime recordings that changed after review.

The original city samples have Y 184.7–200; the recovered Copperbell runs have
Y 87.1–118.8. Height separation corroborates the handoffs and map review; it is
not a general rule for reassigning arbitrary recordings. Other cities' saved
recordings were inspected for similar large jumps, but no equally established
wrong-dungeon run was identified. They were not reassigned speculatively.

## Floor transition audit

The client zone/place table, native map rows and server-zone catalog agree:

| Dungeon | Server zone | Distinct native map pieces |
| --- | --- | --- |
| Mistbeard Cove | 131 | 1051 |
| Cassiopeia Hollow | 132 | 1056 |
| U'Ghamaro Mines | 137 | 1086 |
| Mun-Tuy Cellars | 157 | 1221 |
| Tam-Tara Deepcroft | 158 | 1226, 1231 |
| Nanawa Mines | 176 | 1126 |
| Copperbell Mines | 178 | 1131, 1136 |
| Shposhae | 235 | 1091, 1093, 1095, 1097, 1099 |

Multiple dungeon map pages do not introduce separate server-zone IDs. In
particular, Copperbell's Formicary remains 178, Tam-Tara's second ring remains
158, and Shposhae's lower pages remain 235. Walking downstairs should retain
these server zones. The client map-page display is a separate concern; no new
floor zone IDs or guessed transition rectangles were added.

Genuine city level pairs are Limsa **133 ↔ 230**, Gridania **155 ↔ 206** and
Ul'dah **175 ↔ 209**. The C# regression harness exercises both directions of
every city-pair boundary, rejects unrelated floors at all 43 catalog boundaries,
replays all 2,073 source Copperbell samples through both zoning paths, and
checks a lower-floor swept path underneath Copperbell's surface entrance.
All **2,485 scenarios pass**. This verifies server logic against saved data;
it is not an in-game verification of every staircase or automatic map-page switch.

## Mob evidence and scope

The user's [April 2013 Copperbell page](https://web.archive.org/web/20130430170657/http://ffxiv.gamerescape.com/wiki/Copperbell_Mines)
lists no notorious monsters. The ordinary roster below excludes Dapper Cadaver
(the Dressed to Be Killed quest target), Sprinting Spriggan (seasonal guildleve),
and the Bombs Away guildleve version of Gas Bomb. Ordinary Gas Bomb remains.
No existing quest, guildleve or NM rows were changed.

| Mob | Level | Count | Placement approach |
| --- | --- | ---: | --- |
| Antling Digger | 35–39 | 18 | Formicary western galleries |
| Friar's Lantern | 37–39 | 10 | Lower western workings |
| Gas Bomb | 45–49 | 19 | Southern Mining Pits and lower eastern chambers |
| Heliodor Doblyn | 40–44 | 15 | Mining Pits western galleries |
| Plain Pudding | 40–44 | 22 | Mining Pits chambers and eastern Formicary |
| Qiqirn Scrambler | 50–52 | 13 | Lower recesses and raised eastern spurs |
| Rotting Corpse | 45–49 | 12 | Lower northern/eastern tunnels |
| Sordes | 41–44 | 12 | Southern Mining Pits |

Missing main-page levels came from pre-ARR species pages:
[Antling Digger](https://web.archive.org/web/20130509212201/http://ffxiv.gamerescape.com/wiki/Antling_Digger),
[Plain Pudding](https://web.archive.org/web/20121017045549/http://ffxiv.gamerescape.com/wiki/Plain_Pudding),
and [Rotting Corpse](https://web.archive.org/web/20120218032129/http://ffxiv.gamerescape.com/wiki/Rotting_Corpse).
These are infobox ranges; their Copperbell rows omit a separate zone range.
The September 2013 ARR Rotting Corpse page was rejected as the wrong version.

Period footage inspected includes [Copperbell EXP party](https://www.youtube.com/watch?v=hOfOAR5OWOw)
at 0:00 (Antling Digger target), and [Thaumaturge + 2 vs Pudding](https://www.youtube.com/watch?v=XcEQFdwdfsw)
at 0:02 (Plain Pudding target with a nearby Heliodor Doblyn). These support
ordinary species and coexistence, not exact map coordinates. The
[2011 official-forum grind report](https://forum.square-enix.com/ffxiv/threads/18957-Grind-Camps?p=274252&viewfull=1)
specifically places Antling Diggers on Copperbell 2F. Its bracketed level range
describes the player party, not the monsters. The
[Speakers Network retrospective](https://www.youtube.com/watch?v=GHV4--oYbmQ)
at transcript 1:11 identifies the initial Mining Pit and second-part Formicary.
Later ARR footage in that video was not used as placement evidence.

Exact historical spawn coordinates and most species' floor distributions remain
unrecovered. These are authored habitats using the historical roster/grid cells,
native artwork and exact captured ground. Antling second-floor placement has
the stronger period floor evidence; the other floor assignments are explicitly
authored/inferred. The layout leaves dead ends, several side passages, the
entrance and ancient waterway open. Minimum same-elevation placement clearance
is 22 units, with habitat spacing 24–30, door/gate clearance 15 and entrance
clearance 55. Each mob has a short captured local movement edge; recordings do
not prove unrestricted collision-safe roaming beyond their captured coverage.

## Coordinate and combat provenance

MapNavi 1700 and 1720 use region 104, place 3112, offset X 1056 / Z 544 and
scale 2, with native 2560 × 2048 artwork. The previews are rendered at 1280 ×
1024; `X = pixelX - 1056`, `Z = pixelY - 544`. Companion frame files identify
the header area that covers artwork. Integer historical map references denote
100-unit cells, for example (3,4) covers X -756..-656 and Z -144..-44.
The outdoor calibration registry and user-confirmed tests were preserved.
No new live calibration confirmation is claimed for Copperbell.

Profiles 39300–39307 clone the exact reviewed ordinary donors pinned in the
[placement manifest](../Data/mobplacements/copperbell_mines.json). Same-name
profiles preserve their existing loot lists. Newly named Gas Bomb, Heliodor
Doblyn and Rotting Corpse use their named client actors and reviewed family
combat profiles, with loot list 0 pending a separate historical loot review.
The Rotting Corpse lancer donor's initialization script is byte-identical to
the named actor's shipped standard script; the builder checks that equivalence.
Existing combat skill/spell lists are reused, not reconstructed as new AI.

Plans retain full captured XYZ and source-local node IDs; canonical SQL uses
the workflow's three-decimal precision and stable `map_...` placement IDs.
The additive migration checks the complete profile identity before attaching
spawns, skips occupied IDs and preserves existing rows on rerun.

## Validation and use

```powershell
python -B tools/mobspawns/repair_copperbell_recordings.py check
python -B tools/mobspawns/copperbell_mines.py check
python -B -m unittest discover -s tools/mobspawns -p test_copperbell_mines.py
dotnet build tools/seamless-zone-tests/SeamlessZoneTests.csproj -c Release --no-restore -m:1 /p:UseSharedCompilation=false
dotnet tools/seamless-zone-tests/bin/Release/net10.0/SeamlessZoneTests.dll
```

Both map PNGs were visually inspected. Eight Python tests cover source/edge
preservation, exact handoff deduplication, XYZ/floor/level scope, spacing,
native coordinate conversion, generated outputs and additive SQL reruns/conflicts.
The Nanawa follow-up also corrected fractional profile comparisons in the
additive Copperbell SQL: tiny binary32 storage rounding no longer skips mobs
with floating offsets such as 0.8 or 1.2. A regression simulates those stored
values. Exact profile IDs and integer identity fields remain strict; neither
Copperbell positions nor population counts changed.

Changes are in this checkout. No live database was imported and no running
server was restarted. To activate them on the server, deploy the rebuilt Map
Server and corrected `Data/quicknavmesh/zone_175.tsv`, `zone_178.tsv` and
`zone_209.tsv`, and import only
[`copperbell_mines_20260912.sql`](../Data/sql/live%20migrations/copperbell_mines_20260912.sql)
into the intended server schema. Stop its recorder before replacing files;
the still-running old server can otherwise save mislabeled points again.
The untouched original copies in `D:/navmesh/quicknavmesh` are not the repaired
checkout files. Restart to clear any in-memory old graph.

For a character already stranded under an Ul'dah zone ID, two exact recorded
test destinations after deploying the fix are:

```text
!pos 178 -633.922 111.707 -78.259
!pos 178 -654.290 83.363 -177.296
```

These are sample-derived upper/lower positions, not newly user-confirmed tests.
