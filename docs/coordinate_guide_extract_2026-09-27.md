# Coordinate-guide extract — mob_map_coordinates.md (2026-09-27)

Source (read in full, 527 lines):
`C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/mob_map_coordinates.md`
Tool: `tools/mobspawns/map_coordinates.py` (+ `map_registry.py`); offline CLI + importable module, no game/DB needed; JSON on success, exit 2 on failure. Python 3.10+; Pillow only for rendering.

No game-client code reproduced here; formulas/fields below are original notes correlated to that open-source doc.

Delivered 2026-09-27 from `/tmp/ff14-staging/coordinate-guide/extract.md`
(swarm scope `coordinate-guide`). Not copied into FF14-Memory docs: that repo
already owns the full guide; this extract exists so decomp-side work can cite
placement rules without cross-repo reads.

## 1. Coordinate system

- Server/world space: horizontal `world X / world Z` + height `Y`. `Y` stays **unresolved** until a recorded XYZ with height is selected; tool never reuses a nearby sample's height at a requested center.
- Map space (continuous): 100-world-unit grid:
  - `world X = native_pixel_X / native_scale - base_X`
  - `world Z = native_pixel_Y / native_scale - base_Y`
  - `continuous_map_X = (world_X + base_X) / 100`
  - `continuous_map_Y = (world_Z + base_Z) / 100`
  - `integer_square = floor(continuous)`; e.g. zone 128 cell (32,38) = `672<=X<772`, `792<=Z<892`, center (722,842).
- North-up map; fractions measured across/down square. Confirmed example zone 128: three `!pos` points and fractions (0.89412,0.00743), (0.51876,0.49934), (0.03016,0.96239) — no axis flip.
- Native pixels vs legacy helper: use `MapPage.native_to_world` for native pixels; do not pass unscaled pixels into legacy `nav_to_world` offset helper. `MapTransform.width/height` = world extents after scale; `MapPage.native_size` = texture extent.
- Texture-size rule: use full **texture** dimensions (from `2Dmap_piece.csv`), not nav viewport width. Example: La Noscea viewport 4600 vs texture 4608; viewport introduces drift. Scaled archive images need explicit per-axis scaling to native texture.
- Pixel inputs: `--pixel` without frame/size assumes original full-image dims. Crops/render frames carry crop origin, scale, margins, zone, page identity; margin/other-zone pixels rejected; resized PNG must be mapped back to original dims first. `--image-size W H` required for differently sized full image; `maps` reports `default_full_image_size` + `archive_image`. No OCR/auto-identification of arbitrary maps/screenshots.
- Height args (`--height`, `--height-tolerance`, `--world ... --height`) **filter** nearby recorded nodes; they do not assign Y to requested X/Z. `locate` reports original sample XYZ, distance, `inside_selection`.
- Calibration anchors (horizontal checks; client nav rows + independent server positions): Widow Cliffs (966,833), Red Labyrinth (1797,1856), Burnt Lizard Creek (1185,1407), Alder Springs (-1567,-2593), Feather Gorge (960,-22), Camp Brittlebark (484,672). 100-unit grid checked vs patch 1.21 notes + repo positions: Zephyr Gate (25,31), Mistalle Bridges (34,28), Alberic (35,18), Curious Gorge (15,33). Mismatches (e.g. some old job-NPC rows) are investigated, never auto-applied to a transform.
- Rendering: prefers installed client's exact tiles selected by native texture resource (`--client-root` override); frame records texture source + digest of native tile manifest. Fallback: specifically bound archive; else visibly labeled coordinate grid without artwork. Partial/corrupt tile sets fail closed. PNG legend: yellow selected square, cyan recorded nodes, orange public mobs, white public NPCs.

## 2. Zone / map fields and registry rules

- Coverage model (2026-09-20 all-zone interface): **112 main-SQL zone entries**; **70 zones have 99 zone-specific native map pages**; remaining **42 entries are `world_only`** (world X/Z lookup, recorded-XYZ selection, grid rendering OK; map X/Y + unbound artwork unavailable). `get_map(zone)` returns None for world-only (no invented transform).
- `--page` = **MapNavi row ID**, not 1-based floor number. Map page selects image + horizontal transform, **not a floor**. Multi-page zones require explicit choice even if two pages share offsets; landmark rows sharing texture+transform are aliases (e.g. Copperbell 1714 -> 1720). Render frames/CLI plans retain page identity; CLI rejects crop/plan from different page/calibration.
- `map_registry.py` resolution: explicit server names, native `_zoneParam` place IDs, `_layout` nav ownership, MapNavi region/layout/place joins, texture dimensions. Never picks parent map from English name/region alone. Copies keep own zone ID + recording; identical horizontal metadata does not authorize borrowing another copy's ground. Unknown server IDs fail.
- Core per-page fields: zone ID(s), MapNavi row, base X/Z, native scale (1/2/4 frames), first/second-ring piece ID, texture resource / native size, world extents. `maps --zone <id>` is authoritative per-zone listing (live vs frozen `zone_ID.tsv` sources listed separately).
- Outdoor compatibility table (original calibrations unchanged; registry now picks each territory's own native row):

| Map | Zone IDs | MapNavi row | Base X/Z | Full texture |
|---|---|---:|---|---|
| La Noscea | 128,129,130,135 | 100 | 2528/3008 | 4608x4608 |
| Coerthas | 143,144,145,147,148 | 3000 | 3712/2144 | 6656x5120 |
| Black Shroud | 150,151,152,153,154 | 2000 | 3104/3808 | 6144x6144 |
| Thanalan | 170,171,172,173,174 | 1000 | 2687/3072 | 5632x5632 |
| Mor Dhona | 190 | 3500 | 1280/1344 | 2560x2560 |

- Dungeon/city native examples: Mistbeard/Cassiopeia/U'Ghamaro 131/132/137 -> 600/700/4900; Mun-Tuy/Nanawa 157/176 -> 2500/1600; Tam-Tara/Copperbell 158/178 -> 2600,2620 / 1700,1720; Darkhold 231 -> 2900 (piece 1321, scale 2, base 560,384), 2902 (piece 1331, scale 2, base 736,593); Shposhae 235 -> 5000,5002-5005; Aurum 245,252,253 -> 5500,5502,5503; Cutter's 246,254,255 -> 5400,5402-5404 + layout 415; cities/wards/offices/arenas/islands -> own scale-1/2/4 frames via `maps --zone`.
- Worked native derivations: Tam-Tara row 2600 base (384,608) scale 2: native (1394,874) -> (313,-171) matches gate anchor; Mistbeard row 600 base (2400,2176) scale 2, piece 1051, texture 2560x2048, archive 2048x1638 (scale axes separately): marker (1411,1284) -> (-1694.5,-1534) matches gate row 748. Darkhold second map holds Dragonbreath Falls / Feasting Hall (nav rows 2918/2919, place-name 4114/4115).
- Offsets/scale read from `docs/Dat Mining/mapNavi_data.csv`; texture dims from `docs/Dat Mining/2Dmap_piece.csv`; regional artwork under `tools/gatheringpoints/offline_maps/assets/maps`.
- Same grid numbers on different maps = different world coords. Parent regional map spans several server zones: conversion alone cannot prove zone membership.
- Recordings: `Data/quicknavmesh/zone_<id>.tsv` live by default (76,218 nodes at doc time; 135+148 empty; other zones partial); `--recording` selects exactly one file, checks zone header + node validity, records SHA-256; snapshots never auto-merged; node IDs local per source (no raw concat / cross-source consecutive-ID links). Pre-merge evidence in `Data/quicknavmesh-evidence/premerge-20260909/` must be consulted before declaring unrecorded. Filename/header is not proof of capture correctness (retain Copperbell repairs, Darkhold exclusions, content reviews). Do not apply accepted node ranges to a different recording by coinciding node numbers.
- `plan` in multi-page zones requires explicit height filter, but that still does not prove every filtered node belongs to that page — use content-approved assignments for final placements.
- Historical `load_maps()` keeps original 20 outdoor zones/names/transforms for frozen outputs; new work uses CLI / `get_map` / `load_registry`.
- Validation scope stated: 34 coordinate/interface tests; 50 texture resources decoded; Darkhold/Cutter/Market Wards previews inspected; broader suite 222 tests with 3 failures + 7 setup errors also reproducing on unchanged HEAD (snapshot/protected-content hashes, Copperbell line endings, Nanawa selection) — baselines preserved, not relabeled.

## 3. Mob-placement rules

- Ground truth: planner picks **complete recorded XYZ points inside selection**; never interpolates/invents XYZ; never expands a grid square (`--radius`, default 30, only applies to point inputs). If too few nodes satisfy constraints, command fails with no partial export.
- Separation: `--spacing` = candidate separation; `--clearance` (default 4) = clearance from catalog mobs/NPCs in same zone; `--height`/`--height-tolerance` filters nodes to a floor, never overrides Y. Inspect stacked/multilevel plans; without height filter all recorded floors eligible.
- Review profile first: `mobs <name>` lookup (e.g. BNPC 1063 = L13-16 dodo); never guess actor class/skills/behavior from name.
- Public `plan` exports: exact-point CSV (8-field capture format, count/distance zero = exact points not randomized flat pack) + additive SQL (existing BNPC ID, auto-increment spawn IDs, content-derived stable unique IDs independent of batch order/count, leaves profiles/placements intact). Do not run old counter-based converter on isolated CSV (name collisions). SQL skips inserts if BNPC profile missing. `plan.json` holds positions, source file/node, BNPC ID/levels/stable IDs, `!pos <zone> <X> <Y> <Z>` inspect commands. No CLI command imports SQL or restarts servers; after DB import restart Map Server; approved DB edits must also land in main SQL, not only live migrations.
- Private/content-owned zones: default **JSON-only candidate plan**, reject public SQL export. Examples: Darkhold candidates go through user-placement layers/builder, never overwrite 175-point manifest (dedicated `darkhold_placements.py` validates exact sample XYZ or zone+map+key-bound user observation, checks profile joins, emits `Map Server/Dungeons/DzemaelGroundedPositions.cs`; current manifest 138 entries, 135 exact samples + 3 user observations; noncombat device/chest/reward/portal/landing = zero visual Y offset; native doors keep client layout bindings). Aurum unresolved heights + Cutter frozen support keep existing evidence status. See per-zone `AGENTS.md`.
- Guildleve encounters (102 ordinary L30/40 regional): separate `regional_guildleve_placements.py` + frozen node/edge evidence; runtime geometry lives in leve scripts, not public spawn SQL. 12 camps covered; Nanawa per-leve frozen recording authoritative (short-gap inferred links only, undotted passages unavailable, old camp fallback unresolved); 10 camps use captured route edges; Cassiopeia map-reviewed from captured XYZ despite sparse links (speed), Mun-Tuy exact XYZ + captured links, each with own preview + pending grid/route checks. `propose --zones ...` extends only intended camps. Explicit `--point-cloud-zones` stores inferred short links separately, keeps route testing pending.
- Context limits: candidates are authoring aids from recorded movement; do not prove retail spawns, encounter membership, roam bounds, collision, connectivity. Plotted map is artwork, not collision mesh. Catalog overlays = literal public SQL rows, not live DB view (later UPDATE/DELETE + private runtime homes need owning tools); private-area rows excluded.
- Live-validation discipline: only tested points are validated (zone 128 three `!pos` points; Mistbeard A/B/C floor Y=-20; Tam-Tara three zone-158 points pending; Darkhold 613->1409/1394-node evidence with nodes 599-613 wall-excluded). Saved in `tools/mobspawns/map_coordinate_validations.json` (+ `Data/raidroutes/dzemael_grounded_positions.json` sample IDs/SHA); regression checks squares/command output; screenshot/fractions are context/calculated unless measured. Map-object probes (e.g. Darkhold `!pos 231 -95.198 164.884 -13.873`) are not floor positions — confirm landing, step to ground before recording, never import probe Y.
- Verify: `python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py` and `... test_map_registry.py`; SQL double-executed vs isolated SQLite (IDs/reuse/reruns/preservation) — not a substitute for live MySQL import or in-game collision check.
