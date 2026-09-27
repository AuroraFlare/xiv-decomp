# Darkhold noncombat placement correction - 2026-09-08

All ten magitek devices, three portal markers and GM circle/terminal probes now use their source Y directly. The first gate device also moves to the user-supplied `(65.563, 180.500, 199.840)`. The other nine devices and three portal markers lose the inherited `+2.63` lift. This supersedes the uninstalled first-device-only build.

All six regular/objective coffers and five victory coffers already pass their recorded XYZ directly to the actor spawner. Their points are retained after checking the generated coordinates and compiled route/objective builders. The two inter-map landings keep their full recorded XYZ and remain outside portal trigger rings. Small coordinate components now retain float32 precision when generating C# instead of being rounded to six decimal places.

All twelve native doors/barriers retain their exact layout-211 identities and object origins. Their Y coordinates belong to client-bound geometry, so the removed prop lift does not apply to them. Closed branches and progression rules are unchanged. Mob and wave placement entries, profiles and patrol data are unchanged.

## Coordinate inventory

The first two devices use user-supplied screenshot points; the second is described as a likely position. The other 24 entries use complete frozen movement samples. Source Y is the final actor/landing Y in every row. This verifies coordinate preservation, not retail placement precision or client model clearance.

| Placement | Map | Source | X | Y | Z | Result |
| --- | ---: | --- | ---: | ---: | ---: | --- |
| `device.stablesgate` | 1 | dzemael_first_magitek_device | 65.563000 | 180.500000 | 199.840000 | Exact screenshot XYZ; no lift |
| `device.gulletgate` | 1 | dzemael_second_magitek_device | 128.901000 | 180.046000 | 200.182000 | User's likely screenshot position; no lift |
| `device.gulletsmall` | 1 | recorded node 273 | 116.746735 | 173.700010 | 159.566760 | Removed +2.63 lift |
| `device.gulletlarge` | 1 | recorded node 265 | 102.576520 | 176.690930 | 148.706540 | Removed +2.63 lift |
| `device.circlehallnorth` | 1 | recorded node 369 | 25.911636 | 173.680020 | 92.710740 | Removed +2.63 lift |
| `device.circlehallsouth` | 1 | recorded node 357 | 40.512330 | 173.889830 | 129.205020 | Removed +2.63 lift |
| `device.circlehalllarge` | 1 | recorded node 324 | 13.173998 | 173.677140 | 107.445946 | Removed +2.63 lift |
| `device.knightsseal` | 2 | recorded node 974 | -8.398235 | 167.000020 | -135.947770 | Removed +2.63 lift |
| `device.batraalshield` | 2 | recorded node 1085 | 108.848564 | 156.168990 | -178.085140 | Removed +2.63 lift |
| `device.batraalwest` | 2 | recorded node 1105 | 50.153934 | 154.225430 | -175.951400 | Removed +2.63 lift |
| `coffer.warlocks_pattens` | 1 | recorded node 235 | 65.087555 | 180.959920 | 188.892910 | Recorded XYZ retained |
| `coffer.bladedancers_jackboots` | 1 | recorded node 590 | 225.354690 | 130.603930 | 4.474965 | Recorded XYZ retained |
| `coffer.revolutionarys_bliaud` | 2 | recorded node 765 | -222.207150 | 171.788020 | -21.463593 | Recorded XYZ retained |
| `coffer.alpine_war_jacket` | 2 | recorded node 1364 | -37.630463 | 171.250020 | -12.819730 | Recorded XYZ retained |
| `coffer.solid_scale_mail` | 2 | recorded node 621 | -126.326140 | 161.773570 | 16.803095 | Recorded XYZ retained |
| `coffer.warlocks_buckler` | 2 | recorded node 827 | -105.906910 | 163.863250 | -79.093070 | Recorded XYZ retained |
| `reward.batraal` | 2 | recorded node 1114 | 65.246430 | 149.000020 | -146.949980 | Recorded XYZ retained |
| `reward.northwestern_orobon` | 2 | recorded node 1117 | 58.613777 | 149.000020 | -140.219820 | Recorded XYZ retained |
| `reward.all_magitek_circles` | 2 | recorded node 1128 | 63.775146 | 149.004150 | -135.019330 | Recorded XYZ retained |
| `reward.under_25_minutes` | 2 | recorded node 1138 | 71.955360 | 150.146010 | -147.086800 | Recorded XYZ retained |
| `reward.all_regular_coffers` | 2 | recorded node 1136 | 65.915910 | 149.349690 | -158.336690 | Recorded XYZ retained |
| `access.map1` | 1 | recorded node 592 | 234.701810 | 130.742320 | -0.051891 | Recorded XYZ retained |
| `access.map2` | 2 | recorded node 739 | -271.254270 | 162.519760 | 2.855623 | Recorded XYZ retained |
| `portal.map1` | 1 | recorded node 598 | 239.754990 | 130.742320 | -6.893011 | Removed +2.63 lift |
| `portal.map2` | 2 | recorded node 738 | -283.124600 | 161.391360 | 8.891746 | Removed +2.63 lift |
| `portal.exit` | 2 | recorded node 1048 | 91.658910 | 150.939670 | -99.180160 | Removed +2.63 lift |

Table values are display-rounded; the manifest and runtime retain source float precision.

## Evidence and review maps

- Manifest: `Data/raidroutes/dzemael_grounded_positions.json`.
- Frozen capture: `Data/raidroutes/evidence/dzemael-20260908/zone_231.tsv`; all 1,409 source nodes preserved. User-excluded nodes 599-613 remain unavailable for placement.
- First-device screenshot: `Data/raidroutes/evidence/dzemael-20260908/first-magitek-mypos.png`; scoped observation in `tools/mobspawns/map_coordinate_validations.json`.
- Shared entrance remains the user-supplied `(-90.073, 222.002, 239.891)`, facing `1.542`. Saved reconnect/return positions retain their existing behavior.
- [First-map noncombat overlay](maps/dzemael-noncombat-20260908/map1.png) and [second-map noncombat overlay](maps/dzemael-noncombat-20260908/map2.png). Each has its own `.frame.json` and numbered legend, including native doors.

The height policy now rejects nonzero noncombat offsets in the authoring tool. Player screenshots do not supply a terrain heightmap; no new elevations or unrecorded lateral placements were inferred for the remaining objects.

## Validation and installation

Passed: 19 placement/provenance tests, 18 map-coordinate tests, 69 traversal
checks, 265 compiled placement/door checks, 6,142 Eye movement checks, and the
static validator with five Lua parses. The Release build has zero errors and
the existing package vulnerability/feed warnings.

Staging: `.tmp/dzemael-noncombat-build/`. DLL SHA256:
`2819C7D55821C8F1CA0262F83D68FF42BFA07959DAC3F6C34F4526AE9DE07864`.
During the subsequent upper-route Bone Nix correction, the Release DLL was
observed to match this exact tested hash, with Map Server running under a new
process. The noncombat build is therefore present in the Release installation;
this task did not perform that copy. The Nix follow-up is tracked in the
[video placement review](dzemael_video_placement_review_2026-09-08.md).
