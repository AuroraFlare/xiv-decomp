# Mun-Tuy Cellars ordinary population — 2026-09-12

Prepared **53 ordinary mobs across ten types in zone 157**, retaining all 12
existing quest-support mobs: **65 static mobs total**. The recorded northern,
western, central and southern passages are populated with clear space around
doors, the gate and two authored NM pockets. Unrecorded branches remain empty.
No guildleve mobs or NMs were added. Four roster entries remain unresolved.
The repository SQL is ready; **no live database import or server reload was performed**.

## Roster and level evidence

The [May 11, 2013 Mun-Tuy roster](https://web.archive.org/web/20130511052949/http://ffxiv.gamerescape.com/wiki/The_Mun-Tuy_Cellars)
separates ordinary, guildleve and NM entries. It provides four of the ten added
level ranges directly. Six use **legacy species ranges from subpages**: those
ranges are provisional for this dungeon, whose individual row has no level.
Redirected ARR-only pages were rejected.

| Ordinary mob | Level | Added | BNPC | Actor | Donor | Level evidence |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| Cellar Puk | 28–34 | 4 | 39360 | 2100109 | 39321 | Legacy species range |
| Dreadwolf | 25–29 | 3 | 39361 | 2101403 | 1117 | Legacy species range |
| Goblin Thug | 29–30 | 6 | 39362 | 2110301 | 1202 | Mun-Tuy roster |
| Kalong | 35–39 | 6 | 39363 | 2104106 | 1195 | Legacy species range |
| Magicked Bones | 30–34 | 8 | 39364 | 2101901 | 1233 | Mun-Tuy roster |
| Marshlight | 25–29 | 5 | 39365 | 2109902 | 1191 | Explicitly extinct 1.0 species page |
| Molting Miteling | 30 | 6 | 39366 | 2101111 | 1050 | Mun-Tuy roster |
| Mun-Tuy Squirrel | 30–34 | 3 | 39367 | 2104007 | 1211 | Legacy species range |
| Toad Poacher | 34–39 | 7 | 39368 | 2180116 | 1183 | Mun-Tuy roster |
| Will-o'-the Wykes | 29–34 | 5 | 39369 | 2109903 | 39329 | Explicitly extinct 1.0 species page |

Subpages consulted:
[Cellar Puk](https://web.archive.org/web/20130511052949/http://ffxiv.gamerescape.com/wiki/Cellar_Puk),
[Dreadwolf](https://web.archive.org/web/20130511052949/http://ffxiv.gamerescape.com/wiki/Dreadwolf),
[Kalong](https://web.archive.org/web/20130511052949/http://ffxiv.gamerescape.com/wiki/Kalong),
[Marshlight](https://web.archive.org/web/20170414083613/http://ffxiv.gamerescape.com/wiki/Marshlight),
[Mun-Tuy Squirrel](https://web.archive.org/web/20130511052949/http://ffxiv.gamerescape.com/wiki/Mun-Tuy_Squirrel),
[Will-o'-the Wykes](https://web.archive.org/web/20130511052949/http://ffxiv.gamerescape.com/wiki/Will-o%27-the_Wykes).
Some requested timestamps redirect to later captures. Puk and Dreadwolf retain
the explicit pre-ARR/out-of-date banner; Kalong and Squirrel retain legacy page
content. Marshlight redirects to a 2017 capture explicitly identifying an extinct
original-release mob, not an ARR enemy. The Wykes page has the same extinct-1.0
classification. Capture date alone was not treated as proof of legacy content.

| Pending entry | Reason not placed |
| --- | --- |
| Darkeye Devilet | Global legacy 40–68 range spans leve/behest entries. Mun-Tuy's level and ordinary/event status remain unresolved. |
| Giant Bat | Retrieved subpages redirect to ARR Patch 2.0 level 33; unsuitable for this legacy population. |
| Opo-opo | Period video confirms ordinary packs, but no enemy level was readable. Retrieved subpages describe ARR level 2–9. |
| Vulture Poacher | Legacy subpage leaves level blank. Female Archer description also conflicts with the candidate client Pugilist binding. |

The [Archer R29 Mun-Tuy farming video, 0:22](https://www.youtube.com/watch?v=6Z5KteLBWH0&t=22s)
shows Opo-opo packs with the native map open and an approximate displayed
position of 5,5. At 0:50–0:55, the Opo-opo target is visible, but its level is not
readable. The player's rank is not the enemy's level. This is qualitative pack
evidence; no screenshot calibration or server XYZ was derived from the footage.

Alux (42, cell 5,5), Prince of Pestilence (47, cell 6,3), and Guano Gnat
(guildleve/NM entry) are excluded. So are all listed leve-only species:
Bog Yarzon, Crapulous Canine, Croft Kalong, Darkwing Devilet, Deepground Puk,
Delta Crab, Downcast Hippocerf, Drunken Dormouse, Dusty Devilet, Earth Elemental,
Figgy Pudding, Mummers' Lantern, Salt Hare, Skulking Wolf, Sotted Simian,
Spriggan Bezzler, Vile Gnat and Wicked Soul.

## Ground and authored habitats

The frozen source already saved for quest placement is reused without editing:
`Data/mobplacements/etc1-quest-evidence-20260911/zone_157.tsv`.

- SHA-256: `645f6d9b1425f197d9f8588bc426766080ebe00bd1c9ad7f4877c7c4ea96793f`.
- **940 XYZ nodes and 999 captured links**. Current live `zone_157.tsv` is
  byte-identical at authoring time. The older 76-node and 794-node guildleve
  snapshots were also checked. They contain 8 and 71 source-exclusive XYZ,
  respectively, all within 0.78 units in 3D of the selected source. They do not
  extend coverage into the missing branches and were not merged. Supplemental
  premerge recordings contain no 157. Full inventories and hashes are saved in
  the manifest.
- Bounds: X −1041.9473 to −654.4291; Y −37.185837 to 12.2100315;
  Z −2394.377 to −1959.6434. Elevations are retained per selected point.
- Every new spawn has a captured local edge of 0.75–8 horizontal units with at
  most 3 vertical units of difference. No inferred edges or source merges.
- Native **MapNavi 2500**, region 103, layout 311, piece 1221, place 2101;
  `_zoneParam[157]` also binds place 2101. Base X/Z is **1472/2688**, scale 2,
  native texture 2560×2048. No parent Shroud transform was used.
- Native map gate pixel 1566,1246 converts to X −689 / Z −2065, about 1.52
  units from the existing gate. Saved user coordinate validations were read;
  none confirms Mun-Tuy. Live map-grid verification remains pending.
- Every **new** mob is at least 21 horizontal units from other new or retained
  mobs. Within each habitat the minimum is 24–26 units. Existing quest mobs
  keep their original, sometimes tighter spacing. Door/object clearance is 13.
- Gate/battlewarden clearance is 55 units; outer entrance clearance is 33.
  Two 27-unit authored open pockets lie within the archived Alux and Prince
  cells. These centers are spacing constraints, not recovered NM coordinates.

Historical references are grid squares, not exact spawn points. The roster puts
Dreadwolves in 5,6, Marshlights in 5,4, Cellar Puks in 5,7, Kalong in 6,7,
Squirrels in 6,8, and Wykes/Opo-opo in 4,7. Several of those cells have **no
recorded ground in this native frame**. Their original coordinates remain
unresolved. Puks, Kalong, Squirrels and Wykes use explicitly authored habitats
on the reviewed recorded passages instead; the transform was not shifted to
force the archive cells onto known ground. Most eastern branches remain empty.

The [detail overlay](maps/mun-tuy-cellars-20260912/detail.png) shows all 53 new
mobs, 12 retained quest mobs, doors, clear pockets and captured navigation.
The [full overlay](maps/mun-tuy-cellars-20260912/overview.png) preserves the
whole native map. Each image has its own `.frame.json`. In the detail image,
only pixels 20,80 through 940,1120 are map content:
`X=(pixelX−20)/2−1072`, `Z=(pixelY−80)/2−2438`.

Recorded ground proves sampled positions, not complete collision coverage or
safe random roaming. Density and species habitats are authored, not a claim
that every retail spawn or every branch has been recovered.

## Preserved content and combat profiles

All six level-35 Wandering Wights (39206) and six Gnawing Gnats (39207) retain
their exact IDs, profiles, XYZ, rotation and non-roaming behavior. Existing
guildleve layouts, NPCs, doors, coffers and quest-support scripts are unchanged.
Alux (3000) and Prince of Pestilence (3081) have staged profiles in the loot SQL
but no static spawn in the current repository. This pass preserves that absence;
it also leaves any custom live NM rows untouched.

Exact donor IDs and full donor rows are frozen in the manifest. Eight target
actors match their donor's class. Dreadwolf uses HyaenaStandard with the reviewed
WolfStandard donor; Squirrel uses NuteaterStandard with the reviewed
GlirulusStandard donor. The paired init functions return identical values
(Wolf differs only in whitespace); all four script hashes and both class paths
are pinned. These are working same-family combat defaults, not recovered
retail per-species tuning. No classes or shared outdoor profiles are edited.

Same-named donor drops are retained. New named variants use `dropListId=0` until
their loot is reviewed; no unrelated donor loot or invented rates are assigned.

## Outputs and validation

Manifest: `Data/mobplacements/mun_tuy_cellars.json`. Generated full-precision
plans, exact-point CSV and append-only SQL: `Data/mobplacements/mun_tuy_cellars/`.
Canonical SQL adds profiles **39360–39369** and spawn rows **960265–960317**.
Existing databases should use the scoped migration
`Data/sql/live migrations/mun_tuy_cellars_20260912.sql`, which preserves existing
rows, requires matching complete profiles, and uses stable placement IDs.
The CSV is an inspection/capture artifact; do not use the old counter converter.

```powershell
python -B tools/mobspawns/mun_tuy_cellars.py build
python -B tools/mobspawns/mun_tuy_cellars.py check
python -B tools/mobspawns/mun_tuy_cellars.py render
python -B -m unittest discover -s tools/mobspawns -p test_mun_tuy_cellars.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
```

Eight Mun-Tuy tests and all 18 map-coordinate tests pass. Checks cover exact
recorded heights, source-local links, spacing, excluded/pending species,
cross-class review hashes, native-map calibration, repeat imports, profile-ID
conflicts, FLOAT32 profile comparisons, and preservation of the 12 real quest
rows plus custom NM/outdoor rows. The native map overlay was visually reviewed.
SQLite exercises migration semantics; a live MySQL import and in-game traversal
remain pending. Reload the Map Server after importing the migration.
