# The Mun-Tuy Cellars guildleve placements — 2026-09-08

The user's recording supplies enough ground for all eight level-30 Mun-Tuy guildleves (`13021`–`13028`, zone **157**). These layouts are now implemented in the project. The complete level-30/40 set has **94 recorded-ground layouts**, with only Nanawa's eight remaining unresolved.

All 36 spawn slots, three centers, both chase routes, and slot access paths use exact recorded XYZ and captured movement links. The frozen evidence contains 76 nodes in `Data/guildleveplacements/evidence/zone_157.tsv`; its SHA-256, original recording hash, node IDs and paths are in `Data/guildleveplacements/regional_level30_40.json`. Live recording may continue without moving these placements.

## Map and layout review

![Mun-Tuy guildleve placement map](maps/guildleve-grounded-20260908/zone_157.png)

The preview uses Mun-Tuy's own client MapNavi row **2500**: region 103, layout 311, base X/Z **(1472,2688)**, scale **2**, piece **1221**, and native size **2560×2048**. The archived `mun-tuy-cellars-1x.png` is **2048×1638**, so each image axis is scaled separately. The native gate marker `(1566,1246)` converts to world X/Z `(-689,-2065)`, 1.52 yalms from the independently captured dungeon-side gate `(-687.916,-2063.94)`.

The reviewed layout follows an interior corridor north into a room. It uses a map-selected anchor at world X/Z `(-870,-2200)` after an initial draft placed too much of the encounter on the entrance ramp. Every chosen position and route segment was checked against the rendered artwork. This dungeon does not borrow the outdoor Black Shroud transform, and its displayed grid remains pending live confirmation. The PNG's `.frame.json` supports pixel conversion through `map_coordinates.frame_to_world`.

The two routes have 26 and 24 points. Their longest segment is 5.346 yalms and largest height step is 1.638 yalms. Slots have at least two horizontal yalms of separation and four yalms of clearance from catalog public actors; each lies within 42 yalms of its center. Native circles remain 64 yalms and overlap. Narrow approaches, circle transitions and the chases still need live playtesting; captured links and map artwork do not certify collision or encounter behavior.

## Area-center test positions

These positions retain recorded precision. They are new encounter test candidates, not user-confirmed placement tests. Use `!quicknavmeshoff` before teleporting; re-enable with `!quicknavmeshon` after reaching normal ground if recording further movement.

| Area | Predicted map square | Teleport command |
| --- | --- | --- |
| 1 | (5,4) | `!pos 157 -889.8753 -35.685112 -2225.085` |
| 2 | (5,4) | `!pos 157 -877.2634 -29.652615 -2284.2217` |
| 3 | (6,3) | `!pos 157 -856.1612 -23.647758 -2322.777` |

Prioritize Tracking the Pack (`13024`) and Crabs in the Cellar (`13025`) for chase testing. Use the existing `!glbuild edit <id>` workflow for individual corrections.

## Verification

- All 48 level-30 simulations pass, including chase stages and reinforcements.
- Fifteen ground-evidence tests and 18 map-coordinate tests pass. The dungeon-preview regression preserves both reviewed frames and rejects cross-zone pixel interpretation.
- The runtime export contains 140 Mun-Tuy location entries: 55 spawns, four points, 52 route entries and 29 markers, all matching frozen recorded XYZ.
- The full audit covers 2,613 spatial entries across all 102 encounters, with 2,497 entries on recorded ground across 94 encounters.

Only Mun-Tuy geometry and its eight empty overlay signatures changed in this placement extension; mob IDs, profiles, mechanics, rewards and other camps are preserved. The server was not restarted and live encounters have not been tested.

To reproduce a proposal from a later save, explicitly select this camp and review the resulting draft before integration:

```powershell
python -B tools/mobspawns/regional_guildleve_placements.py propose --zones 157 --anchor -870 -2200 --output-dir .tmp/mun-tuy-next-draft
python -B tools/mobspawns/regional_guildleve_placements.py render --manifest .tmp/mun-tuy-next-draft/regional_level30_40.json --output-dir .tmp/mun-tuy-next-draft/maps
```
