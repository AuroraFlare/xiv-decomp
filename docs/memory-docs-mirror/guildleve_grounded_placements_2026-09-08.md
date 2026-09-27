# Recorded-ground guildleve layouts — 2026-09-08

Implemented new layouts for **94 ordinary regional battlecraft guildleves**: 40 at level 30 and all 54 at level 40. All eleven covered camps use 36 distinct recorded spawn slots and three area centers. Ten camps have paths following captured graph edges; Cassiopeia uses explicitly inferred short links between recorded XYZ, following the user's map-and-points authoring preference. The other **eight guildleves** retain their prior unresolved offsets pending Nanawa Mines ground recordings.

The actual Lua runtime export contains **2,497 grounded location entries**: 1,404 spawns, 85 search/patrol points, nine defense destinations, 494 route waypoints, and 505 marker entries. These reuse 840 frozen movement nodes across 396 camp slots and their paths. Entries are counted across encounters and conditional waves, not simultaneous actors.

## Evidence and runtime integration

The reviewed source is [`regional_level30_40.json`](../Data/guildleveplacements/regional_level30_40.json), with zone-checked, hashed snapshots under `Data/guildleveplacements/evidence`. Every grounded XYZ retains the recorded precision. Spawn slots have at least two yalms of horizontal spacing across all three areas, four yalms of clearance from catalog public actors, and lie within 42 yalms of their center. The native marker circle remains 64 yalms. In the ten camps with captured edges, chase segments are at most 6.641 yalms with a maximum recorded vertical step of 2.086 yalms. Cassiopeia's inferred links are limited to eight horizontal and three vertical yalms; see its [evidence and live-test notes](cassiopeia_guildleve_placements_2026-09-08.md).

`tools/build_regional_guildleve_placements.py` now generates `_regional_placements.lua` from this frozen manifest. Subsequent movement recordings cannot silently relocate these encounters. The 94 affected empty per-leve overlay signatures were refreshed for the changed provenance and route structures. Existing encounter mechanics, mob IDs, combat profiles, rewards, and the other eight layouts remain intact. This encounter workflow writes no public-world spawn SQL.

The saved map guide and confirmed coordinate tests were loaded before selecting points. Those confirmations remain scoped to their original exact points; they do not validate these new encounters. All eleven rendered maps were inspected. Cassiopeia and Mun-Tuy use their own MapNavi rows 700 and 2500 with independent gate-anchor checks; displayed grid confirmation remains pending for both. These are recorded-ground reconstructions, **not recovered retail positions or live terrain certification**. Circle overlap, narrow approaches, camp proximity, enemy roaming and runner movement from combat positions still need live playtesting.

## Covered camps

| Camp | Level | Zone | Guildleve IDs | Map review |
| --- | ---: | ---: | --- | --- |
| Cedarwood | 30 | 128 | 10841–10848 | [Map](maps/guildleve-grounded-20260908/zone_128.png) |
| Nophica's Wells | 30 | 172 | 11681–11688 | [Map](maps/guildleve-grounded-20260908/zone_172.png) |
| Humblehearth | 30 | 150 | 12481–12488 | [Map](maps/guildleve-grounded-20260908/zone_150.png) |
| Cassiopeia Hollow | 30 | 132 | 11421–11428 | [Map and evidence](cassiopeia_guildleve_placements_2026-09-08.md) |
| The Mun-Tuy Cellars | 30 | 157 | 13021–13028 | [Map and evidence](mun_tuy_guildleve_placements_2026-09-08.md) |
| Bald Knoll | 40 | 129 | 10901–10909 | [Map](maps/guildleve-grounded-20260908/zone_129.png) |
| Iron Lake | 40 | 135 | 10921–10929 | [Map](maps/guildleve-grounded-20260908/zone_135.png) |
| Halatali | 40 | 171 | 11701–11709 | [Map](maps/guildleve-grounded-20260908/zone_171.png) |
| Broken Water | 40 | 174 | 11721–11729 | [Map](maps/guildleve-grounded-20260908/zone_174.png) |
| Nine Ivies | 40 | 151 | 12501–12509 | [Map](maps/guildleve-grounded-20260908/zone_151.png) |
| Treespeak | 40 | 152 | 12521–12529 | [Map](maps/guildleve-grounded-20260908/zone_152.png) |

The PNG companions include `.frame.json` files for converting pixels in those specific crops. No dungeon has borrowed an outdoor transform.

- **Cedarwood:** Three pockets along the recorded trail south of Cedarwood; circles two and three overlap.
- **Nophica's Wells:** Recorded northern spur about 418–521 yalms from the coarse camp anchor. Nearby components were too short for 36 distinct slots. First and third circles overlap.
- **Humblehearth:** Recorded northern corridor leading east into the clearing; map art shows narrow approaches.
- **Cassiopeia Hollow:** Three pockets around the eastern chamber, using exact captured XYZ. The two chase routes follow short inferred links and need live testing.
- **The Mun-Tuy Cellars:** Three interior slot groups along the corridor leading north into a room. All paths follow captured movement links. Circles overlap, and the approaches are narrow; live chase and circle-transition checks remain pending.
- **Bald Knoll:** Northbound recorded trail toward the Old Knoll clearing, with three distinct groups of slots.
- **Iron Lake:** Three pockets along the east-west trail by camp, with captured paths around the drawn rock outcrop. Centers are at least 76.9 yalms apart; adjacent marker circles overlap. Its frozen evidence contains 95 nodes, including 29- and 30-point routes. Camp proximity and circle transitions need live playtesting. The user subsequently reported finishing the recording; the checked save contains 2,079 ground points and 2,091 recorded links. All 95 frozen XYZ positions remain present, and rerunning selection produces the same centers, slots and routes.
- **Halatali:** Recorded diagonal trail west of Halatali; later circles overlap and the final route doubles back.
- **Broken Water:** Compact recorded loop beside Broken Water; all three circles overlap. More surrounding coverage would allow a broader layout.
- **Nine Ivies:** Recorded Nine Ivies loop and its northeast exit. First and second circles overlap near camp.
- **Treespeak:** Recorded northbound corridor into the clearing; final route returns along part of the same path.

## Live test positions

These are the three authored area centers for each camp. Commands retain recorded precision; they are new test candidates. Check floor height and the displayed square, then start a fresh encounter to check all active mobs, searches, defenses and chases. Use the leve IDs above with the existing `!glbuild edit <id>` workflow for point corrections.

| Camp | Area | Predicted map square | Teleport command |
| --- | ---: | --- | --- |
| Cedarwood | 1 | (29,33) | `!pos 128 435.820920000 46.385445000 319.809230000` |
| Cedarwood | 2 | (30,34) | `!pos 128 513.516600000 46.497177000 393.199700000` |
| Cedarwood | 3 | (30,34) | `!pos 128 569.954000000 45.490620000 436.000550000` |
| Nophica's Wells | 1 | (17,30) | `!pos 172 -897.634500000 95.587470000 -40.927547000` |
| Nophica's Wells | 2 | (17,29) | `!pos 172 -904.785460000 88.097660000 -143.259410000` |
| Nophica's Wells | 3 | (18,30) | `!pos 172 -884.328500000 89.928710000 -66.734920000` |
| Humblehearth | 1 | (30,30) | `!pos 150 -81.556786000 6.687696500 -758.494600000` |
| Humblehearth | 2 | (31,30) | `!pos 150 10.009234000 20.511076000 -756.086700000` |
| Humblehearth | 3 | (31,31) | `!pos 150 61.019573000 20.186869000 -705.249400000` |
| Cassiopeia Hollow | 1 | (8,5), pending grid check | `!pos 132 1479.165400 -69.336690 -855.165400` |
| Cassiopeia Hollow | 2 | (8,6), pending grid check | `!pos 132 1533.229500 -70.417656 -778.923460` |
| Cassiopeia Hollow | 3 | (9,6), pending grid check | `!pos 132 1602.869100 -70.535070 -801.735100` |
| The Mun-Tuy Cellars | 1 | (5,4), pending grid check | `!pos 157 -889.8753 -35.685112 -2225.085` |
| The Mun-Tuy Cellars | 2 | (5,4), pending grid check | `!pos 157 -877.2634 -29.652615 -2284.2217` |
| The Mun-Tuy Cellars | 3 | (6,3), pending grid check | `!pos 157 -856.1612 -23.647758 -2322.777` |
| Bald Knoll | 1 | (7,14) | `!pos 129 -1803.038500000 54.543670000 -1530.649700000` |
| Bald Knoll | 2 | (6,14) | `!pos 129 -1856.781100000 46.533380000 -1607.718600000` |
| Bald Knoll | 3 | (6,13) | `!pos 129 -1849.923300000 46.298466000 -1666.668000000` |
| Iron Lake | 1 | (22,7) | `!pos 135 -275.09787 77.71 -2264.9675` |
| Iron Lake | 2 | (21,7) | `!pos 135 -357.52747 75.7705 -2296.3303` |
| Iron Lake | 3 | (20,7) | `!pos 135 -432.45142 71.69439 -2278.853` |
| Halatali | 1 | (41,29) | `!pos 171 1423.689500000 258.484950000 -171.966500000` |
| Halatali | 2 | (40,28) | `!pos 171 1359.105700000 256.749730000 -262.935240000` |
| Halatali | 3 | (40,28) | `!pos 171 1374.555500000 256.221600000 -242.215770000` |
| Broken Water | 1 | (43,40) | `!pos 174 1683.045500000 296.000850000 988.135700000` |
| Broken Water | 2 | (43,40) | `!pos 174 1689.600000000 296.349100000 1027.223800000` |
| Broken Water | 3 | (43,40) | `!pos 174 1702.144000000 296.014500000 1006.247440000` |
| Nine Ivies | 1 | (48,29) | `!pos 151 1707.148600000 20.223394000 -864.156250000` |
| Nine Ivies | 2 | (48,29) | `!pos 151 1719.816000000 23.459015000 -836.698060000` |
| Nine Ivies | 3 | (48,29) | `!pos 151 1753.031900000 20.408436000 -897.971440000` |
| Treespeak | 1 | (22,15) | `!pos 152 -832.408500000 5.922986000 -2260.333500000` |
| Treespeak | 2 | (22,14) | `!pos 152 -810.119000000 4.398731000 -2344.191200000` |
| Treespeak | 3 | (22,15) | `!pos 152 -838.281400000 4.725198700 -2284.836000000` |

## Remaining ground captures

| Camp | Zone | Level | Guildleve IDs |
| --- | ---: | ---: | --- |
| Nanawa Mines | 176 | 30 | 12221–12228 |

Nanawa is the remaining zone. Record three roomy pockets and walk the connecting routes. Capture broad sweeps inside each pocket; 12 distinct slots per area need actual coverage. Use `!quicknavmeshoff` before teleporting and `!quicknavmeshon` after reaching ordinary ground. Unlike `!quicknavmesh stop`, the `off` command also opts out of automatic recording. Save with `!quicknavmesh save` and sync each `zone_<id>.tsv` into `Data/quicknavmesh`. Do not reuse the old offsets as height samples. Ordinary-speed connections improve route evidence, but increased-speed point captures can still supply exact ground XYZ for map-reviewed placement drafts.

The [coverage audit](regional_guildleve_ground_coverage.json) reports a snapshot
of available ground and captured graph connections. Earlier Cassiopeia snapshots
had too few connected nodes for the default route planner. After the user
confirmed increased movement speed and requested using the map and captured
heights, Cassiopeia was implemented with exact XYZ and separately identified
inferred links. Captured-edge coverage is a route-evidence distinction, not a
requirement that makes otherwise recorded ground unusable. Recordings may keep
growing after an audit checkpoint.

For better layouts in the already covered camps, prioritize more connected
coverage close to Nophica's Wells and around Broken Water. Nophica's nearer
recordings are fragmented; Broken Water's selected circles overlap tightly.
Cedarwood also has no samples within 200 yalms of the coarse camp anchor,
and Humblehearth has only 17 there. Those two currently use farther recorded
ground. These are layout-quality improvements; they do not invalidate the
existing recorded XYZ or establish official leve boundaries.

Nanawa also needs its own map alignment before producing a dungeon preview.
Cassiopeia and Mun-Tuy have dedicated previews using their own client navigation
data; their live grid checks remain pending. The general map registry still
covers the original outdoor maps only. Exact recorded XYZ is usable without
inventing a regional transform. All
102 encounter configs and all 86 referenced combat actors resolve in the
current catalog; no additional missing actor/profile dependency was found.

The current movement recorder creates automatic links only for successive
samples within 8 horizontal yalms, 3 vertical yalms, and an observed speed
at most 18 yalms/second (`QuickNavmeshUtils.RecordPlayerMovement`). Walking
connections at ordinary speed supplies captured links. A cloud of recorded
points alone does not prove a connected chase path; the opt-in inferred-route
workflow keeps that limitation explicit without discarding the ground points.

As those recordings arrive, propose only the unfinished camps. The default also preserves already recorded layouts. Explicit `--zones` is required to reauthor a completed camp:

```powershell
python -B tools/mobspawns/regional_guildleve_placements.py propose --zones 176 --output-dir .tmp/guildleve-next-ground
python -B tools/mobspawns/regional_guildleve_placements.py render --manifest .tmp/guildleve-next-ground/regional_level30_40.json --output-dir .tmp/guildleve-next-ground/maps
```

Review the manifest, frozen evidence and available map previews before replacing the installed manifest/evidence. Dungeon previews require their own map alignment; exact recorded dungeon XYZ and graph edges do not require borrowing a regional transform. The default authoring search is bounded to 600 yalms from the coarse camp anchor for the first center and 700 for later centers, with routes capped at 200 yalms each. Default proposals require captured edges. For map-reviewed drafting from disconnected captures, deliberately opt in with `--point-cloud-zones <zone>` and optionally select one world X/Z `--anchor`; see the Cassiopeia report for an example. This records inferred links separately and still refuses to invent ground positions.

After deliberate integration, regenerate the Lua and refresh empty overlay signatures. The validator refuses to overwrite nonempty captures; reconcile a captured leve against its new layout in that case.

## Validation and deployment

```powershell
python -B tools/build_regional_guildleve_placements.py --check
python -B -m unittest discover -s tools/mobspawns -p test_regional_guildleve_placements.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
pwsh -NoProfile -File tools/validate_regional_guildleve_positions.ps1 -ExportManifest -ExportLocations .tmp/guildleve-runtime-locations.tsv
python -B tools/mobspawns/regional_guildleve_placements.py check --locations .tmp/guildleve-runtime-locations.tsv
python -B tools/validate_guildleves_level30.py
pwsh -NoProfile -File tools/validate_guildleves_level40.ps1
pwsh -NoProfile -File tools/validate_regional_guildleve_catalog.ps1
```

All 102 position overlays pass structural isolation, invalid-edit rejection and capture round trips. All 48 level-30 encounters pass; all 54 level-40 encounters pass 324 complete simulations, nine unattended defenses and 12 separated-circle regressions. Catalog checks resolve all 86 referenced combat actors. Ground-evidence and map-coordinate regression tests pass.

These edits are installed in the project scripts. No live server restart, database import or in-game test was performed. On a server already running the level-30/40 implementation, deploy the updated Lua files together and reload scripts or restart before beginning a fresh leve; active cached encounters retain their previous layout. The earlier supplemental-profile migration is still needed on servers that have not installed the underlying level-30/40 implementation.
