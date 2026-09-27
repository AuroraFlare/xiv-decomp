# Cassiopeia Hollow guildleve placements — 2026-09-08

Implemented ground placements for all eight level-30 Cassiopeia Hollow guildleves (`11421`–`11428`, zone **132**). Together with the subsequent Iron Lake and Mun-Tuy additions, the ordinary level-30/40 catalog now has **94 leves using recorded ground**, with eight still using unresolved legacy offsets in Nanawa Mines. See the [complete placement report](guildleve_grounded_placements_2026-09-08.md) for current coverage.

The user recorded much of the cave at increased movement speed and clarified that the map and captured heights should be used for placement. The earlier automatic planner required recorded connecting edges for every slot; that was a restriction of the planner, not proof that the captured ground was unusable. The movement recorder saves positions separately from its speed-limited edge recording.

## Ground and route evidence

All 36 slots and three centers use complete recorded XYZ. There is no interpolation of heights from neighbors. The selected points are frozen in `Data/guildleveplacements/evidence/zone_132.tsv`, with the full source recording hash, node IDs, and paths in the main manifest. The subset contains 81 nodes. It preserves only actually recorded edges in the TSV.

The route draft contains **65 separately identified inferred links**, including slot access paths, between captured points at most eight horizontal yalms and three vertical yalms apart. Inferred links are stored under `inferred_edges`; they are not inserted into the recorded quicknavmesh or labeled captured edges. Runtime placement provenance is `recorded_ground_inferred_routes`. Both 18-point chase routes require live testing, especially Spooring Spores (`11424`) and Crabs in a Barrel (`11425`). The other six encounters do not use these chase routes.

The points are spaced at least two horizontal yalms apart, including between areas, with four yalms of clearance from catalog public actors. Each slot lies within 42 yalms of its center; marker circles remain 64 yalms. The three centers are at least 70 yalms apart.

## Reviewed map

![Cassiopeia recorded placements](maps/guildleve-grounded-20260908/zone_132.png)

The preview uses Cassiopeia’s own navigation row **700**, base X/Z **(-640,1408)**, scale **2**, and native map piece **1056 (2560×2048)**. Its preserved image is **2048×1638**, with each image axis scaled independently. The client gate marker converts to `(1344.5,-869)` in world X/Z, within 2.1 yalms of the independent server gate `(1343.5,-870.84)`. The three areas and drafted routes were visually reviewed against this artwork. The general outdoor transform registry was not extended or borrowed.

The companion `.frame.json` maps pixels in this exact crop back to world X/Z through `map_coordinates.frame_to_world`. The frame records the candidate dungeon alignment and the pending live grid check. Map art and short inferred links do not establish collision or walkability.

## Area-center test points

These are recorded positions to test, not positions already confirmed by the user. Before teleporting, use `!quicknavmeshoff`; reset boosted movement with `!speed` and re-enable recording with `!quicknavmeshon` when walking a test route.

| Area | Predicted map square | Command |
| --- | --- | --- |
| 1 | (8,5) | `!pos 132 1479.165400 -69.336690 -855.165400` |
| 2 | (8,6) | `!pos 132 1533.229500 -70.417656 -778.923460` |
| 3 | (9,6) | `!pos 132 1602.869100 -70.535070 -801.735100` |

## Verification

- All 48 level-30 encounter simulations pass, including the two Cassiopeia chases and their reinforcements.
- All 102 overlay geometry tests pass; the runtime inventory contains 184 Cassiopeia locations (78 spawns, three points, 72 route entries and 31 markers), all matching frozen recorded XYZ.
- The all-camp runtime audit checks 2,497 recorded-ground entries across 94 leves; the full 102-leve inventory contains 2,613 entries.
- Ground-evidence tests cover bounded inferred links, preservation of actual XYZ, and rejection of inferred routes mislabeled as recorded routes. Existing map-coordinate tests and the 102-leve actor/profile catalog pass.

The Cassiopeia extension changes its camp geometry and eight empty overlay signatures; the complete report also covers the nine Iron Lake layouts added afterward. Existing mob IDs, mechanics and rewards are preserved. No live server restart or in-game encounter test was performed.

To reauthor a similarly recorded camp deliberately, opt into point-cloud route drafts:

```powershell
python -B tools/mobspawns/regional_guildleve_placements.py propose --zones 132 --point-cloud-zones 132 --anchor 1480 -830 --output-dir .tmp/cassiopeia-new-draft
```

This writes a draft for map review; it does not install the draft or alter the captured movement graph. Ordinary proposals continue to require captured route edges. Completed camps are preserved unless explicitly selected.
