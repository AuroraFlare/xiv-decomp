# Guildleve Missing Data Audit

Date: 2026-06-11

This is a practical audit of what is still missing or uncertain for guildleve
data, especially minimap markers, full-map `qtmap` markers, spawn/wave data,
and what the Garlemald Rust server can add.

## Short Version

Garlemald does not add new guildleve marker coordinates. It confirms the same
client-facing live marker shape we already use, but its guildleve scripts still
send the placeholder marker `59.0, 44.0, -163.0`.

Our local repo is ahead, but the local artifacts are not synchronized:

- `Data/sql/gamedata_guildleve_mapmarkers.sql` has 624 rows, but the review CSV
  marks only 38 as actual and 586 as placeholder.
- `Data/scripts/directors/Guildleve/Leves` has 48 per-leve scripts.
- `tools/outputs/guildleves/spawn_points/guildleve_spawn_point_summary.csv`
  covers 38 leves.
- `Data/sql/gamedata_guildleve_spawns.sql` covers 31 distinct leves.
- The spawn export script currently writes to `outputs/...`, while the checked
  review files live under `tools/outputs/...`.

That means some of what looks "missing" is real uncertainty, and some is stale
or split-source output.

## Garlemald Comparison

Checked against `swstegall/Garlemald-Server` `develop` at:

```text
f8e1ad7abb76ed174fa027a253fe067808db4d1c
2026-06-10 07:24:41 -0500
```

Useful:

- Has the same 624-row classic `gamedata_guildleves` seed.
- Has Rust work fields for three live guildleve markers:
  `guildleveWork.marker_x/y/z`.
- Exposes/director-routes `UpdateMarkers(index, x, y, z)`.

Not useful as new data:

- No `gamedata_guildleve_mapmarkers` table.
- No `guildleve_qtmap_markers` table/script.
- No `scripts/lua/directors/Guildleve/Leves/<id>.lua` directory.
- Its generic guildleve scripts have eleven placeholder calls to
  `UpdateMarkers(0, 59.0, 44.0, -163.0)`.
- Its newer `gamedata_regional_leves` scaffold has only six rough rows and is
  not a retail marker source.

Conclusion: keep Garlemald as API/flow corroboration, not as a data source.

## Current Local Coverage

### Catalog

- `docs/Dat Mining/guildleve.csv`: 624 rows.
- `docs/Dat Mining/guildleve_UI.csv`: 624 rows.
- `docs/Dat Mining/xtx_guildleve.csv`: 624 rows.
- `Data/sql/gamedata_guildleves.sql`: 624 inserts.

This catalog is broad, but it does not prove live objective positions.

### Live Minimap Markers

Runtime path:

```text
guildleveWork.markerX[index]
guildleveWork.markerY[index]
guildleveWork.markerZ[index]
```

Current generated review:

```text
tools/outputs/guildleves/minimap_marker_sources.csv
total rows: 624
actual: 38
placeholder: 586
actual sources:
  leve_script_marker: 27
  serverdata_capture_circle: 11
placeholder source:
  fallback_aetheryte_fallback: 586
```

If `tools/build_guildleve_minimap_markers.py` is run against the current script
directory, it would select 48 script markers and 576 fallback rows. That is not
automatically safe because several new scripts are explicitly provisional or
look copied.

### Encounter/Wave Spawn Data

Current generated review:

```text
tools/outputs/guildleves/spawn_points/guildleve_spawn_points.csv
primary rows: 374
covered leves: 38
point types:
  mob: 284
  circle: 60
  run_path: 20
  chest: 10
sources:
  leve_script: 227
  serverdata_capture: 147
```

Current script directory parse:

```text
Data/scripts/directors/Guildleve/Leves/*.lua
script files: 48
parseable rows: 429
parseable point types:
  mob: 348
  circle: 81
```

Current SQL spawn table:

```text
Data/sql/gamedata_guildleve_spawns.sql
rows: 219
distinct leve IDs: 31
```

So the source-of-truth picture is split:

- Lua scripts know about 48 leve IDs.
- The generated spawn review knows about 38 leve IDs.
- SQL spawn rows know about 31 leve IDs.

## Specific Gaps Found

### 1. Ten Lua Scripts Are Not In The Generated Spawn Review

These scripts parse, but are absent from
`tools/outputs/guildleves/spawn_points/guildleve_spawn_point_summary.csv`:

```text
10881 Annexing the Valley
10882 Colonizing the Valley
10883 Claws and Wings
10884 Burning Down the Houses
10885 The Swarm
10886 Send Them Packing
10887 Herbicide
10888 Jellyfish in a Barrel
11643 Where the Stone Floats
11645 Treasures of the Smallfolk
```

The parser sees these additional rows:

```text
10881 rows=11 circles=3 mobs=8
10882 rows=10 circles=2 mobs=8
10883 rows=5  circles=1 mobs=4
10884 rows=4  circles=1 mobs=3
10885 rows=11 circles=3 mobs=8
10886 rows=10 circles=2 mobs=8
10887 rows=9  circles=2 mobs=7
10888 rows=10 circles=2 mobs=8
11643 rows=10 circles=2 mobs=8
11645 rows=10 circles=2 mobs=8
```

Notes:

- `10883`, `10887`, and `10888` explicitly say their spawn points are
  provisional Skull Valley placements.
- `11643.lua` has a DAT title mismatch: DAT says `11643` is `Where the Stone
  Floats`, but the script comment says `Sucking Blood Again` and duplicates the
  `11642` setup.
- `12427.lua` also has a script comment/DAT title mismatch:
  `Stumbling Funguar` vs `Clearing the Forest`. This one is less alarming
  because the export tooling already normalizes `Stumbling Funguar` as an alias
  for `Clearing the Forest`, but it is still worth keeping in the audit trail.
- `11645` exists in SQL spawn rows but not the current generated spawn review.

### 2. Scripts Not Present In SQL Spawn Rows

These scripts are not represented in `gamedata_guildleve_spawns.sql`:

```text
10881, 10882, 10883, 10884, 10885, 10886, 10887, 10888,
11643,
12441, 12442, 12443, 12444, 12445, 12446, 12447, 12448
```

This may be fine if Lua scripts are the runtime source for those leve families,
but it should be intentional. Right now the docs/CSV/SQL do not agree.

### 3. Full-Map `qtmap` Coverage Is Mostly Camp-Level

The datamine bundle says:

```text
quest_marker.csv MapMarkerQuestArea rows: 120
yellow area m00029 rows: 98
strong-name-match guildleve rows: 135
strong-nearest-yellow rows: 96
candidate-nearest-yellow rows: 181
weak-region-nearest rows: 212
```

That gives 231 strong-looking full-map candidates, but the current runtime
lookup in `Data/scripts/guildleve_map_markers.lua` only wires:

- 9 aetheryte/camp marker mappings.
- 1 manual guildleve override: `11004 -> 11500601`.
- 8 wide-marker lists keyed by the broad camp markers.

The old datamine README mentions `Data/scripts/guildleve_qtmap_markers.lua`, but
the current generator writes only CSV/README outputs and that Lua file is not
present. Either the README is stale or a generation/export step is missing.

Important caveat: strong-looking `qtmap` rows are not automatically safe. The
`12447` Sapped Saplings test showed a broad Emerald Moss marker, not the actual
leve objective. Keep the existing warning in `docs/quest_full_map_markers.md`.

### 4. Minimap Placeholder Burden Is Still Large

Among titled, non-obvious-dummy rows, 338 still do not have actual/derived live
minimap coordinates in the current review.

By level:

```text
level 1:   31
level 5:   10
level 10:  28
level 20:  51
level 30:  90
level 40: 102
level 50:  20
```

Top aetheryte/place buckets still missing actual minimap coordinates:

```text
Camp Bearded Rock: 25
Treespeak: 22
Halatali: 21
Camp Bloodshore: 19
Camp Iron Lake: 18
Camp Tranquil: 17
Cedarwood: 17
Camp Skull Valley: 16
Nophica's Wells: 16
Camp Bald Knoll: 16
Camp Broken Water: 15
Camp Nine Ivies: 15
Camp Horizon: 15
Cassiopeia Hollow: 14
Humblehearth: 14
```

### 5. Reward Sources Still Have Known Gaps

`tools/outputs/guildleves/guildleve_reward_source_gaps.csv` has 51 rows:

```text
missing wiki page: 50
skipped CSV title: 1
```

This is separate from marker/spawn recovery, but it matters for end-to-end
guildleve completeness.

## Deeper Investigation Targets

1. Fix the output path split.

   `tools/build_guildleve_spawn_points.py` writes to `outputs/guildleves/...`,
   but the reviewed files live under `tools/outputs/guildleves/...`. Pick one
   path and make the docs/scripts agree before trusting coverage counts.

2. Add confidence handling for per-leve Lua markers.

   The minimap generator treats every `marker = {x,y,z}` in a leve script as
   `actual`. That would incorrectly upgrade provisional scripts such as
   `10883`, `10887`, and `10888`. The generator should detect script comments
   like `provisional` or accept an explicit confidence tag.

3. Audit the ten out-of-review scripts.

   Start with:

   - `11643`: fix or confirm the DAT title/script mismatch.
   - `11645`: decide why SQL has it but the generated spawn review does not.
   - `10881`, `10882`, `10884`, `10885`, `10886`: likely ready to promote if
     their coordinates came from captures or trusted reconstruction.
   - `10883`, `10887`, `10888`: keep provisional until captured or mined.

4. Reconcile SQL spawn rows with Lua scripts.

   Decide whether `gamedata_guildleve_spawns.sql` should be a fallback-only
   table, a generated artifact from scripts, or a separate runtime source. The
   current 31-vs-48 split makes coverage hard to reason about.

5. Rebuild or intentionally retire the generated `qtmap` Lua table.

   If runtime should use the 231 strong candidates, regenerate a Lua table from
   `guildleve_marker_candidates.csv` and wire it carefully behind the existing
   per-leve safety checks. If not, update the datamine README so it no longer
   claims that table is exported.

6. Capture priority.

   For minimap recovery, prioritize level 40 and level 30 rows first because
   they account for 192 titled missing rows. For place coverage, start with
   Camp Bearded Rock, Treespeak, Halatali, Bloodshore, and Iron Lake.

7. Keep full-map and minimap markers separate.

   Full-map `qtmap` uses baked client marker IDs from `quest_marker.csv`.
   Active minimap circles use live `guildleveWork.markerX/Y/Z`. A valid minimap
   coordinate does not imply a valid full-map `qtmap` marker, and a broad
   `qtmap` camp marker does not prove the live objective circle.

## Current Best Source List

- `tools/outputs/guildleves/minimap_marker_sources.csv`
- `tools/outputs/guildleves/spawn_points/guildleve_spawn_points.csv`
- `tools/outputs/guildleves/spawn_points/guildleve_spawn_point_summary.csv`
- `tools/outputs/guildleves/datamine/guildleve_marker_candidates.csv`
- `docs/Dat Mining/guildleve_map_markers_all.csv`
- `docs/Dat Mining/quest_marker.csv`
- `Data/scripts/directors/Guildleve/Leves/*.lua`
- `Data/sql/gamedata_guildleve_mapmarkers.sql`
- `Data/sql/gamedata_guildleve_spawns.sql`
- `docs/guildleve_minimap_markers.md`
- `docs/quest_full_map_markers.md`
