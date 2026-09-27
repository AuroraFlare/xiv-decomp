# U'Ghamaro Mines ordinary population — 2026-09-12

Prepared **30 ordinary mobs across eight types in zone 137**. They follow the
recorded entrance descent, central passages, Dome 2605 and Dome 2610 branches.
The entrance landing, door thresholds and a pocket in the large boss chamber
remain open. No guildleve mobs, quest targets, NMs or NM bodyguards were added.
The SQL is prepared in the repository; no live database import or server reload
was performed.

## Roster and evidence

The [requested archive URL](https://web.archive.org/web/20130425164018/http://ffxiv.gamerescape.com/wiki/U%27Ghamaro_Mines)
redirected to the [May 11, 2013 capture](https://web.archive.org/web/20130511052859/http://ffxiv.gamerescape.com/wiki/U%27Ghamaro_Mines).
Its pre-ARR table lists these eight ordinary types and one separately marked NM.
All eight level ranges are present on the main page. The Ashman and Gurneyman
subpage requests returned “not archived”; no later ARR data was substituted.

| Ordinary mob | Level | Archive grid square | Added | BNPC | Client actor | Reviewed combat donor |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| Alchemist's Tinder | 50 | 6,5 | 3 | 39340 | 2109908 | 1191 |
| Kobold Prelate | 50–53 | 6,4 | 4 | 39341 | 2106604 | 39015 |
| U'Ghamaro Ashman | 55 | 6,5 | 3 | 39342 | 2106650 | 39013 |
| U'Ghamaro Gateman | 56–57 | 6,4 | 2 | 39343 | 2106655 | 39013 |
| U'Ghamaro Gurneyman | 52–57 | Unspecified | 12 | 39344 | 2106643 | 39013 |
| U'Ghamaro Junkman | 53–56 | 6,4 | 2 | 39345 | 2106656 | 39016 |
| U'Ghamaro Overman | 55 | 5,3 | 2 | 39346 | 2106651 | 39013 |
| U'Ghamaro Underman | 50 | 5,3 | 2 | 39347 | 2106645 | 39013 |

Grid references are **100-unit squares**, not exact spawn coordinates. Core
packs use their documented squares. Ashmen also occupy the western furnace
branch and the descent, and Gurneymen fill connecting passages: these are
authored habitats. The archived references do not prove species were confined
to those squares, nor do they recover exact retail density.

Period footage reviewed:

- [WotgAshiee, Exploring U'Ghamaro Mines, 7:07](https://www.youtube.com/watch?v=6APCNGyOPQw&t=427s):
  a level-50 Kobold Prelate target, several prelates, Alchemist's Tinder and a
  Gurneyman name around the opening Primary Blast Door. The battle log reports
  reinforcements; the observed combat crowd is not treated as a static spawn count.
- [The same exploration, 15:05](https://www.youtube.com/watch?v=6APCNGyOPQw&t=905s):
  a level-52 Prelate target and Tinder in the combat log corroborate the mixed
  ordinary population. No exact grid location is claimed from these frames.
- [Jonathan Jenkins, U'Ghamaro Mines, 1:53](https://www.youtube.com/watch?v=NGWw4cYpcEg&t=113s):
  Zu Ga and a named cup bearer belong to the NM encounter and were excluded.

U'Ghamaro Potman exists in client data but is absent from the supplied ordinary
roster; it was not added without further ecology evidence. Zu Ga's cup, sword
and pick bearers are also excluded.

## Ground, calibration and spacing

The live `Data/quicknavmesh/zone_137.tsv` was frozen byte-for-byte at
`Data/mobplacements/ughamaro_mines/evidence/zone_137.tsv`:

- SHA-256: `31a6c367bbc60e3852b8d662d0dcef9d9b43585f786f186de12227a4a867418d`.
- 487 recorded XYZ samples, 499 captured edges. Every selected point has a
  captured local neighbor within 0.75–8 horizontal units and 3 vertical units.
- Recording bounds: X −21.379 to 212.997, Y −14.576 to 51.780,
  Z −3154.294 to −2789.629. The entrance descends substantially; Y is never flattened.
- Only this source existed under `Data` before freezing. The required September 9
  supplemental snapshot has no zone-137 recording. No recordings or edges were merged.
- Native MapNavi **4900**, region 101, layout 116, piece **1086**, place **1125**;
  `_zoneParam[137]` independently binds place 1125. Native scale is 2, base X/Z
  is **542/3488**, texture is 2560×2048. No parent-region transform was borrowed.
- Adjacent mobs are at least **18 horizontal units** apart; within each habitat,
  spacing is 20–24. Existing door/object clearance is at least 10 units.
- Entrance clearance is 40 units around the first recorded sample. A 29-unit
  authored open pocket at X=190/Z=−2925 lies within the archived NM square 7,5.
  This pocket center is **not a recovered Zu Ga coordinate** and has no assigned Y.

The reviewed [detail overlay](maps/ughamaro-mines-20260912/detail.png) and
[full native-map overlay](maps/ughamaro-mines-20260912/overview.png) each have their
own `.frame.json`. The detail crop's map rectangle is pixels 20,80 to 640,920:
`X=(pixelX−20)/2−60`, `Z=(pixelY−80)/2−3190`. The legend is outside that rectangle.
Confirmed live coordinate tests in `map_coordinate_validations.json` were read;
none confirms U'Ghamaro. Native calibration and exact recorded ground are the
current evidence, not an in-game traversal test or a collision heightmap.

## Scope and runtime limits

No public static mob rows existed in zone 137 before this pass. Zu Ga is staged
as BNPC 3107 in `server_battlenpc_mob_types_loot.sql`, but has **no static spawn**
in the current repository. That existing gap is preserved, not counted as a
completed NM. A live server may contain custom rows; additive SQL leaves those intact.

New profiles retain reviewed donor combat settings and use exact named client
actor IDs with matching base classes. Full donor rows are pinned in the manifest.
These are representative working profiles, not recovery of every retail job or
weapon variant. Each new named variant has `dropListId=0`; no invented coffer-key
or currency rates were added. Existing NM loot, coffer definitions, doors, quest
objects and guildleve layouts are unchanged. Stronghold gate/reinforcement/NM
mechanics are outside this static population pass.

## Generated files and validation

The manifest is `Data/mobplacements/ughamaro_mines.json`; plans, exact-point CSV
and append-only SQL are in the adjacent `ughamaro_mines` directory. Canonical
SQL adds profiles **39340–39347** and spawn rows **960235–960264**, using stable
content-derived placement IDs.

```powershell
python -B tools/mobspawns/ughamaro_mines.py build
python -B tools/mobspawns/ughamaro_mines.py check
python -B tools/mobspawns/ughamaro_mines.py render
python -B -m unittest discover -s tools/mobspawns -p test_ughamaro_mines.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
```

The scoped live migration is
[`Data/sql/live migrations/ughamaro_mines_20260912.sql`](../Data/sql/live%20migrations/ughamaro_mines_20260912.sql).
It adds missing profiles, requires their full reviewed identity before spawning,
and skips existing stable placement IDs. FLOAT identity comparisons tolerate
MySQL binary32 storage. Tests exercise repeat imports, conflicting profile IDs,
existing/custom NM preservation, FLOAT behavior, exact source nodes, spacing,
exclusions, native coordinates and missing captured-edge rejection.

Validation completed: **7 U'Ghamaro tests and 18 map-coordinate tests passed**.
U'Ghamaro, Nanawa and Copperbell output-consistency checks also passed, and
`git diff --check` reported no whitespace errors. No runtime C# or navigation
recordings were changed in this pass.

After importing that migration into the intended server schema, reload/restart
Map Server to load the static placements. Suggested inspection commands:

```text
!pos 137 48.312 33.889 -2833.219
!pos 137 120.368 -13.870 -3048.944
!pos 137 -9.385 -13.373 -3116.015
```

These are exact authored mob positions from the recording, not user-confirmed
teleport tests. Live aggro, roaming and doorway traversal still need observation.
