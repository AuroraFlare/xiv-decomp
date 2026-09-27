# Position Reconstruction TODO

This file is a working tracker for encounter-position reconstruction.

It is meant to answer three questions quickly:

- what is already solved
- what still needs coordinates
- what still needs stronger archival or in-game confirmation

For the fuller background and the current validated Broken Water reference set, see:

- [behest_guildleve_seed_notes.md](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/behest_guildleve_seed_notes.md:1>)
- [server_guildleve_position_seed.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_guildleve_position_seed.sql:1>)

## Current State

### Solved Enough To Reuse

- Guildleve horizontal reconstruction:
  - `worldX = navX - regionBaseX`
  - `worldZ = navY - regionBaseY`
- Broken Water guildleve encounter clusters:
  - validated in game
  - preserved in SQL
  - documented in notes

### Still Not Solved Globally

- A direct mined source for encounter `Y`
- A direct mined source for Behest encounter centers and radii
- A fully proven one-leve-to-one-point mapping for every validated guildleve cluster

## Completed So Far

### Guildleves

#### Broken Water, Zone 174

Validated drake/base cluster:

- `!pos 174 -635 282.36 -1797`
- `!pos 174 447 262.37 -2158`
- `!pos 174 -710 282.02 -2212`
- `!pos 174 -165 284.68 -1699`

Validated route/intercept cluster:

- `!pos 174 1249 263.54 -545`
- `!pos 174 1555 250 -233`
- `!pos 174 710 252.751 -493.724`
- `!pos 174 468.127 280 385.656`

Likely associated leves:

- drake/base cluster:
  - `1011` `Operation: Bloody Scales`
  - `1012` `Operation: Under Siege`
  - `1013` `Operation: Pulling Fangs`
- route/intercept cluster:
  - `1007` `Operation: Warm Welcome`
  - `1008` `Operation: Broken Thunder`
  - `1018` `Operation: Tailspin`

This cluster grouping is the current best fit, but the exact one-leve-to-one-point mapping is still interpretive.

### Behests

- battlewarden anchors are known for the currently wired sites
- level bands are seeded in server code
- exact encounter-center and mob-placement reconstruction is still pending

## Remaining Guildleve Work

The following camp families still need the same pass we used on Broken Water:

### Bloodshore / Zone 130

Needs:

- derive likely clusters from `mapNavi_data.csv`
- validate `!pos` points in game
- map recovered clusters to local leve family
- preserve confirmed points in SQL

Likely relevant leves from the current mob/name notes:

- `1002` `Operation: Kobold as Ice`
- `1004` `Operation: Supplication Denied`
- `1006` `Operation: Reaving Home`

Status:

- no preserved validated points yet

### Tranquil / Black Shroud Family

Needs:

- derive likely clusters
- validate in game
- separate sylph-side encounters from wolf/Ixal-side encounters

Likely relevant leves:

- `1003` `Operation: Sylph Stalkings`
- `1014` `Operation: Wolfsbane`
- `1015` `Operation: Up, Up, and Away`
- `1016` `Operation: Shuteye`

Status:

- no preserved validated points yet

### Dragonhead Family

Needs:

- derive likely clusters
- validate in game
- identify whether multiple Ixal assault leves share a cluster

Likely relevant leves:

- `1009` `Operation: Scar and Defeather`
- `1017` `Operation: Leaving the Nest`

Status:

- no preserved validated points yet

### Nine Ivies Family

Needs:

- derive likely clusters
- validate in game
- separate any overlap with other Black Shroud Ixal rows

Likely relevant leves:

- `1010` `Operation: Frame Work`

Status:

- no preserved validated points yet

### Upper La Noscea Family

Needs:

- derive likely clusters
- validate in game
- distinguish kobold-side and cyclops-side encounter areas

Likely relevant leves:

- `1019` `Operation: Deepground`
- `1020` `Operation: Crosseye`

Status:

- no preserved validated points yet

### Lower-Priority Early Leve Families

These are still worth preserving later, but they were not the first reconstruction target:

- `1001` `Operation: Reave-quest`
- `1005` `Operation: Bloody Side Up`

Status:

- mob/name recovery done
- position reconstruction not started

## Remaining Behest Work

The current server-side Behest scaffold needs per-site encounter areas and then mob placements.

### Behest Sites Still Needing Encounter Centers

- Bearded Rock, zone `128`
- Skull Valley, zone `129`
- Bloodshore, zone `130`
- Iron Lake, zone `135`
- Horizon's Edge, zone `172`
- Broken Water, zone `174`
- Nophica's Wells, zone `172`
- Tranquil, zone `154`

### Behest Sites With Known Battlewarden Anchors

- Bearded Rock: `(56.43, 45.34, -40.84)`
- Skull Valley: `(-1052.19, 42.76, -858.79)`
- Bloodshore: `(1110.33, 46.51, -925.96)`
- Iron Lake: `(-284.793, 77.866, -2277.5)`
- Horizon's Edge: `(-1308.15, 56.001, -159.49)`
- Broken Water: `(1700.14, 296, 984.321)`
- Nophica's Wells: `(-873.823, 89.404, 376.162)`
- Tranquil: `(740.8, -11.15, 1140.14)`

### Behest Sites With Preserved Mob Evidence

- Bloodshore:
  - `Lowland Billygoat`
  - `Downcast Hippocerf`
  - `Ice Elemental`
  - finisher: `Lightning Elemental`

### Behest Reconstruction Still Needed Per Site

For each Behest site, we still need:

- encounter center
- encounter radius
- optional secondary cluster centers
- per-mob placement or at least a practical spread around the center
- final mob roster where archival evidence is missing

## Extra Corrected Points Worth Revisiting Later

These were corrected during testing and may be useful when reconstructing neighboring clusters or verifying altitude bands, but they are not yet tied cleanly to a finished encounter set:

- `!pos 174 -1315 59.57 -147`
- `!pos 174 -866 93.18 376`
- `!pos 174 -1223 72.68 191`

Keep these as auxiliary reference points rather than final guildleve seeds until they are attached to a specific cluster or leve family.

## Recommended Workflow For The Next Pass

For guildleves:

1. pull the region block from `mapNavi_data.csv`
2. derive candidate `X/Z` from region base plus nav rows
3. test candidate points in game
4. correct `Y` and any final lane drift
5. preserve validated points in SQL and notes

For Behests:

1. capture encounter-center positions in game
2. capture radius or rough spread
3. capture mob placements if available
4. seed those into code and notes

## Paste Template For Future Capture

```text
Site:
Zone ID:
Leve ID:
Cluster Name:
Encounter Center:
Encounter Radius:
Mob 1:
Mob 1 XYZ:
Mob 2:
Mob 2 XYZ:
Mob 3:
Mob 3 XYZ:
Mob 4:
Mob 4 XYZ:
Notes:
```


## Crafting Leve Track (Separate)

Crafting leves are intentionally tracked separately from combat encounter reconstruction. See [crafting_leve_reconstruction_todo.md](/\\daniel-pc\C\Users\drime\source\repos\AuroraFlare\FF14-Memory\docs\crafting_leve_reconstruction_todo.md).

## Bloodshore Candidate MapNavi Points (Working)
Source: mapNavi_data.csv rows where ield[13] is 1002/1004, transformed with:
- worldX = navX (field[4]) - baseX (field[15])
- worldZ = navY (field[5]) - baseY (field[16])
- ield[14] is kept as an internal family variant marker.
- Current candidates are **low confidence** and horizontal-only; use !pos checks before seeding SQL.
  - 1002 candidates:
    - row 200: (1027, 1472) lt=1006
    - row 211: (1027, 2498) lt=1021
    - row 221: (1027, 1116) lt=1019
    - row 222: (1027, 3008) lt=1006
    - row 231: (1027, 2369) lt=1007
    - row 260: (1027, 3008) lt=1030 (duplicate (1027, 3008))
    - row 280: (1015, 2369) lt=1007
  - 1004 candidates:
    - row 400: (1027, 764) lt=1009
    - row 420: (1027, 605) lt=1027
    - row 430: (1027, 800) lt=1028
    - row 440: (1027, 1374) lt=1029
    - row 480: (1027, 764) lt=1009 (duplicate (1027, 764))
    - row 481: (1013, 764) lt=1009
    - row 482: (1012, 764) lt=1009
  - 1006: ield[13] rows not found in current filter.
- 2Dmap_marker.csv context (@5204/ aetheryte markers) — likely low-confidence visual cross-check:
  - @5204/i1002: (3116, 3007) mapId 1015
  - @5204/i1004: (2846, 3589) mapId 1017
  - @5204/i1006: (1892, 1721) mapId 1019
- Action: hold this as hypothesis-only until confirmed with in-game !pos and then move into server_guildleve_position_seed.sql if stable.

### Bloodshore / Zone 130 (Working Recon Pass)
Status: horizontal candidates recovered from mapNavi; awaiting !pos confirmation.

Current working clusters from `mapNavi_data.csv` rows where field[13] is 1002/1004:

- `bloodshore_130_family1002_cluster`
  - Points (world X/Z only):
    - 1027, 1116 (field14=1019)
    - 1027, 1472 (field14=1006)
    - 1027, 2369 (field14=1007)
    - 1015, 2369 (field14=1007)
    - 1027, 2498 (field14=1021)
    - 1027, 3008 (field14=1006)
    - 1027, 3008 duplicate (field14=1030)
  - Interpretation: likely two sub-positions plus duplicates; all are low confidence and unanchored in Y.

- `bloodshore_130_family1004_cluster`
  - Points (world X/Z only):
    - 1012, 764 (field14=1009)
    - 1013, 764 (field14=1009)
    - 1027, 605 (field14=1027)
    - 1027, 764 (field14=1009)
    - 1027, 764 duplicate (field14=1009)
    - 1027, 800 (field14=1028)
    - 1027, 1374 (field14=1009)
  - Interpretation: compact strip-like cluster; likely the second Bloodshore encounter family.

Per-Mob / Per-Leve Spot Hypothesis (in priority order to validate):

1. `Operation: Kobold as Ice` (1002)
   - Spot hypothesis: `bloodshore_130_family1002_cluster`
   - Single-mob operation -> any one verified point from this cluster likely enough, test center-first.
   - Candidate start point: (1027, 1472)

2. `Operation: Supplication Denied` (1004)
   - Spot hypothesis: `bloodshore_130_family1004_cluster`
   - Single primary point + nearby strip spread from duplicates.
   - Candidate start point: (1027, 764)

3. `Operation: Reaving Home` (1006)
   - Not directly present as a family-13 field match in current filtered set.
   - `field14=1006` appears on two family-1002 points (1027,1472 and 1027,3008), so this may be related but still hypothesis-only.
   - Hold as `unresolved` until an in-game or additional mapNavi corroboration appears.

Next in-game pass:
- verify two cluster centroids (`1027,1472` and `1027,764`) first,
- then expand to adjacent non-duplicate strip points,
- then promote surviving points with Y-corrected !pos values into `server_guildleve_position_seed.sql` as best-fit mappings.

