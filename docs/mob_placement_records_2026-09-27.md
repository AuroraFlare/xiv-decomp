# Mob placement records — city-state zones (lawful structure notes + worked candidates)

Delivered 2026-09-27 from `/tmp/ff14-staging/mob-placement/placements.md`
(swarm scope `mob-placement`) to both repos (this is the FF14-Decomp copy;
memory twin: `FF14-Memory/docs/mob_placement_records_2026-09-27.md`).
Complements the 2-point tool-generated bundles in
`FF14-Memory/docs/maps/city-spriggan-placements-20260927/` (zones 133/155/175)
with the record-field contract plus 6 worked candidates per city-state on the
complementary zone variants (230/206/175), with weather/seasonal gating.

Parent note on §8: the "Meteor upstream fetch timed out this run" line is
stale — sibling scope `meteor-weather` + parent DID fetch upstream raw
(`SetWeatherPacket.cs`, `weather.lua`, `Area.cs`, `Zone.cs`,
`server_zones.sql`) via Bitbucket REST + Forgejo/GitHub mirrors. See
`docs/meteor_weather_sweep_2026-09-27.md`.

Scope: `mob-placement`. Read-only analysis of the FFXIV install; all staging
under `/tmp/ff14-staging/mob-placement/`. No game file was modified. No
decompiled code is reproduced. Coordinates below are original candidate
mappings derived from the repo's own coordinate tool and movement recordings,
not retail spawn claims.

## 1. Sources inspected (evidence, not search hits)

- `docs/mob_map_coordinates.md` — full coordinate/placement workflow: `maps`,
  `locate`, `render`, `plan`; exact-point CSV + additive SQL; plan.json with
  positions, source file/node, BNPC ID, levels, stable IDs, `!pos` commands;
  "authoring candidates based on recorded movement. They do not prove retail
  spawn locations."
- `tools/mobspawns/map_coordinates.py` (parser + plan/render branches read) —
  `--page` is a MapNavi row ID; `--height` filters nodes, never assigns Y;
  `--spacing`/`--clearance`/`--radius`; public plans export
  `mobspawns.csv` + `placements_append_only.sql`, private plans JSON-only.
- `tools/mobspawns/convert_to_sql.py` lines 1–160 — 8-field capture row
  `SpawnRow(x,y,z,zone_id,level_range,distance,count,raw_name)`; name suffixes
  `_agro/_aggro/_aggressive/_nm`; dedupe key; CSV line format.
- `tools/mobspawns/mobspawns_simple.csv` — 78-row capture-format sample
  (`x,y,z,zone,level,count/distance,name`); exact-point rows use `0,0`.
- `tools/mobspawns/README.md` — `!addms` exact point vs `!addmobspawn` cluster;
  `generated_append_only.sql` (additive, auto-increment IDs) vs rebuild
  fragments; suffix → `isHostile`/`isNotorious` mapping.
- `Data/sql/server_battlenpc_spawn_locations.sql` lines 1–100 — live table
  schema (see §3) + star_marmot/forest_funguar row shape.
- `Data/sql/server_battlenpc_mob_types.sql` lines 1–80 — mob-type schema
  (`bnpcId, actorId, displayName, isHostile, isNotorious, min/max_lvl,
  skillListId, spellListId, dropListId, respawnTime, ...`).
- `Data/sql/server_battlenpc_spawn_conditions.sql` (whole file) — optional
  gating table: `targetType` (spawnGroup/uniqueId/bnpcId), `requiredWeatherIds`,
  Eorzea hour range, day mask, kill trigger, `despawnOnConditionLoss`; live
  rows e.g. Dodore BNPC 3017/3018 gated on weather `8017` Gloom, Elder
  Mosshorn BNPC 3021 daytime 08:00–20:00, Uraeus BNPC 3110 night 20:00–08:00.
- `Data/sql/server_seasonal_battlenpc_spawn_locations.sql` (whole file) —
  seasonal battle layer keyed `(profile, uniqueId)`: Hatching 2011/2012
  spriggans 62000–62007 + Hunter's Moon 2011 mice 62010–62012 with zone/XYZ/rot.
- `Data/sql/server_seasonal_eventnpc_spawn_locations.sql` (whole file) — 74-home
  seasonal actor layer keyed `(profile, uniqueId)`; city homes cluster at
  Limsa-230 ≈ (-443.8,40.0,285.8), Gridania-206 ≈ (28.5,9.5,-1294.0),
  Ul'dah-175 ≈ (-170.4,192.0,33.6)-type walkway nodes (rotation 0 authored).
- `docs/seasonal_profiles_2026-09-26.md` — profile switches default false;
  `SpecialEventWork[9]` values (Moonfire-2012 18, Foundation 11, Seventh-Umbral
  20, else 0); conflicting profiles rejected; seasonal SQL is the only source
  (no live-migration fallback); all 58 new homes use complete frozen XYZ, Y
  never transferred.
- `docs/seasonal_weather_event_controls_2026-07-10.md`,
  `docs/weather_decoration_inventory_2026-07-10.md`,
  `docs/seasonal_weather_decor_patch_datamine_2026-07-11.md`,
  `docs/city_seasonal_weather_selector_datamine_2026-07-11.md`,
  `docs/decoration_only_event_matrix_datamine_2026-07-12.md` — per-city
  weather/decor matrices (§5), 60/60 Halloween scheduler→8027-mask binding,
  opcode split weather `0x000D` vs `SpecialEventWork` `0x0196`.
- `docs/all_saints_wake_2011_implementation.md` — Halloween runtime
  (`halloween_event_enabled`, weather 8070 overlay vs 8027 stock; music 75;
  disguises 19:00–05:00 Eorzea; quest 110800 gate; booth XYZ on pages
  914/2800/1800).
- `docs/hunters_moon_2011_runtime_2026-09-26.md` — Hunter's Moon mice
  2204022–24 / items 9030020, 3011420/3011419; full-moon rule explicitly open;
  60 s respawn + drop rates authored.
- `docs/zone_implementation_status.md` — city zone IDs: Limsa 133/230,
  Gridania 155/206, Ul'dah 175/209 (+ Ul'dah battle copies 184–188).
- Live CLI evidence (this session, `tools/mobspawns/map_coordinates.py`):
  `maps --zone` for 133/230/155/206/175/209 (pages, bases, scales, layouts,
  recording counts/SHAs); `locate` for 230/914/(7,6), 206/2800/(6,5),
  175/1800/(5,3) with 8 nearest recorded nodes each, plus mirror checks
  133/850/(7,6) (0 inside), 155/2700/(6,5) (88 inside),
  209/1900/(5,3) (0 inside); `mobs` queries for spriggan/dodo/mouse/imp
  (BNPC IDs used below).

## 2. City-state zones and native pages (from `maps --zone`)

| City | Zone | Page(s) | Layout | Base X/Z, scale | Recording (live nodes / SHA-8) |
| --- | ---: | --- | ---: | --- | --- |
| Limsa Lower | 133 | 800 Lower, 850 Upper | 121 | 1216/320, s2 | 188, cf00a46f |
| Limsa Upper | 230 | 900 Lower, 914 Upper, 926 Airship s4 | 131 | 1216/320 s2; 656/-64 s4 | 216, 300ab7ad |
| Gridania | 155 | 2700 town, 2799 Lotus Stand | 321 | 608/1824 s2; 352/2400 s2 | 660, 3e8c2164 |
| Gridania | 206 | 2800 town | 331 | 608/1824, s2 | 675, 688b482a |
| Ul'dah | 175 | 1800 Merchant, 1850 Hustings | 421 | 736/352, s2 | 125, 1bfcd152 |
| Ul'dah | 209 | 1900 Merchant, 1922 Hustings, 1932 Airship s4 | 431 | 736/352 s2; 316/-28 s4 | 110, b8a85216 |

Rules from the guide + registry behavior observed:

```text
world X = native_pixel_X / scale - base_X
world Z = native_pixel_Y / scale - base_Y
continuous map = (world + base) / 100 ; cell = floor(continuous)
```

- `--page` selects image + horizontal transform, never a floor. Multi-page
  zones require it; copies keep their own zone ID/recording — identical
  horizontal metadata never authorizes borrowing another copy's ground.
- Center Y is always unresolved; a height filter only selects nearby recorded
  nodes, never moves a Y onto a different X/Z.
- Worked cells in §4: Limsa-230/914 (7,6) → X -516..-416, Z 280..380,
  center (-466,330); Gridania-206/2800 (6,5) → X -8..92, Z -1324..-1224,
  center (42,-1274); Ul'dah-175/1800 (5,3) → X -236..-136, Z -52..48,
  center (-186,-2).

## 3. Placement record / field contract

### 3a. Capture CSV (8 fields) → mob type + spawn rows

`x, y, z, zoneId, levelRange, distance, count, "raw_name"`:

- Exact point: `distance=0, count=0` (all §4 candidates).
- Cluster: `count` mobs spread within `distance` (field use; not used for
  city walkway candidates).
- `raw_name` suffixes: `_agro/_aggro/_aggressive/_agressive/_gressive` →
  `isHostile=1`; `_nm` → `isNotorious=1`; suffixes stripped from display name.
- `levelRange` like `13-16` or single `40`; parsed to `min_lvl/max_lvl`.

### 3b. `plan.json` (tool output, `legacy-mob-plan-v1`)

Positions, source file + node ID + recording SHA-256, exact reused BNPC ID,
levels, content-derived stable unique IDs (same point → same ID regardless of
batch order), `!pos <zone> <X> <Y> <Z>` inspection commands, map page identity,
spacing/clearance used, integration note (approved DB changes must also land
in main SQL, never as live migrations alone).

### 3c. `server_battlenpc_spawn_locations` (ordinary layer)

`id` (auto-inc), `bnpcId`, `uniqueId`, `mobName`, `zoneId`, `posX/Y/Z`, `rot`,
`privateArea`/`privateAreaLevel`, vitals (`hp/hpMax/hpp/mp/mpMax/mpp/tpp`),
`actorState`, `animId`, `roams` (0/1), `roamDelay` (default 23 s),
`modelSize` (default 1), `immunity`, `spawnGroup`, `linkGroup`.
Additive imports allocate `id` after current max; `uniqueId` is the stable
content key (e.g. `star_marmot_150_1`).

### 3d. `server_battlenpc_mob_types` (profile, reused — never invented per point)

`bnpcId`, `actorId` (appearance), `displayName`, `speed`, `isHostile`,
`isNotorious`, `detectionType/Range`, `respawnTime`, `currentJob`,
`min_lvl/max_lvl`, stats, resists, `element`, `skillListId/spellListId/
dropListId`. §4 reuses only existing IDs returned by `mobs` (below); no new
profile is created here.

BNPC IDs reused in §4 (all from live `mobs` output / seasonal SQL):
dodo 1063 (L13–16, passive), dormouse 1160 (L38–42, passive),
shuffling_spriggan 62000 (L10), scrambling_spriggan 62001 (L20),
scurrying_spriggan 62002 (L30), moon_eyed_mouse 62010 (L15),
moon_eared_mouse 62011 (L25), moon_toothed_mouse 62012 (L35),
dodore 3017 (L60 NM, structural weather-gate demo only).

### 3e. `server_battlenpc_spawn_conditions` (weather/time/kill gating)

Optional rows; absent = always eligible. `targetType/targetKey` → one
`spawnGroup`, `uniqueId`, or `bnpcId`. `requiredWeatherIds` = CSV of
`SetWeatherPacket` IDs. `eorzeaStartHour` inclusive → `eorzeaEndHour`
exclusive (18→6 wraps overnight). `eorzeaDayMask` Sun1/Mon2/…/Sat64, 0 = any
day. Kill trigger: `requiredKillBnpcId` or `requiredKillUniqueId` ×
`requiredKillCount` within `killWindowSeconds` (0 = banked until consumed).
`despawnOnConditionLoss` + grace removes idle NMs when weather/time/day stops
matching. `enabled`, `note`.

### 3f. Seasonal layers (event gating, separate from weather)

- `server_seasonal_battlenpc_spawn_locations(profile,bnpcId,uniqueId,zoneId,
  positionX/Y/Z,rotation)`, PK `(profile,uniqueId)` — e.g.
  `('hatching_tide_2011',62000,'hatching_2011_shuffling_152',...)`.
  Runtime (`WorldManager.Seasonal`) loads only enabled profiles after the
  ordinary population; no code-fallback positions.
- `server_seasonal_eventnpc_spawn_locations(profile,actorClassId,uniqueId,
  zoneId,positionX/Y/Z,rotation)` — city human/cadet/bell layer (§1 for
  cluster centers).
- Switches default false; quest allowlist + per-script checks gate offers
  independently (e.g. Halloween quest 110800 only). Weather and décor stay
  separate protocol lanes from the `SpecialEventWork[9]` mode word.

## 4. Worked examples — 6 candidates per city-state

Conventions for every row: XYZ is one complete recorded node (Y never moved);
`rot 0` is authored (faces +Z-ish default, needs live facing check);
CSV is exact-point (`0,0`); SQL sketch follows the
`placements_append_only.sql` additive pattern (auto-inc `id`, stable
`uniqueId`); `!pos` is the in-game inspection command. All are candidates —
the guide's own caveat applies: recorded ground + map art prove neither
retail spawns, roaming bounds, collision, nor connectivity.

Unique-ID pattern used here: `<mob>_<zone>_<cellX>x<cellY>_<n>`
(e.g. `dodo_230_7x6_1`). For gated rows the same string is the
`spawn_conditions.targetKey` (`targetType='uniqueId'`) or the seasonal
`uniqueId` with its `profile`.

### 4a. Limsa Lominsa — zone 230, page 914 (Upper Decks), cell (7,6)

Recording: `Data/quicknavmesh/zone_230.tsv`, 216 nodes,
SHA-256 `300ab7ad4751a858dcb84bcd59970bb92b9d325c4b92ba228a933e9ed3d6a833`.
20 recorded points inside the cell; 0 existing battle mobs in selection.

| # | BNPC / use | Recorded XYZ (node) | Map cont. | `!pos` / CSV | Gate |
| --- | --- | --- | --- | --- | --- |
| L1 | 1063 dodo L13–16, passive demo | -436.18842, 43.0, 317.0697 (n1) | 7.798, 6.371 | `!pos 230 -436.188 43.000 317.070` / `-436.188,43.000,317.070,230,13-16,0,0,"dodo"` | none (ordinary) |
| L2 | 1160 dormouse L38–42, passive demo | -437.3199, 43.0, 311.30167 (n2) | 7.787, 6.313 | `!pos 230 -437.320 43.000 311.302` / `-437.320,43.000,311.302,230,38-42,0,0,"dormouse"` | none |
| L3 | 62000 shuffling_spriggan L10, Hatching demo | -430.50674, 43.000004, 326.38538 (n28) | 7.855, 6.464 | `!pos 230 -430.507 43.000 326.385` / seasonal row profile `hatching_tide_2011`, uniqueId `hatching_demo_shuffling_230_1` | profile switch only |
| L4 | 62010 moon_eyed_mouse L15, Hunter's Moon demo | -427.07, 43.000004, 328.66522 (n27) | 7.889, 6.487 | `!pos 230 -427.070 43.000 328.665` / seasonal row profile `hunters_moon_2011`, uniqueId `hunters_moon_demo_eyed_230_1` | `hunters_moon_2011_enabled` |
| L5 | 3017 dodore L60 NM, weather-gate pattern demo | -432.45877, 43.0, 306.99576 (n3) | 7.835, 6.270 | `!pos 230 -432.459 43.000 306.996` + condition (`uniqueId`, `requiredWeatherIds='8017'`, despawn-on-loss 1, grace 60) | Gloom-only; EXPECTED-OFF in cities (8017 not in sea_s0 city pool) — proves the negative path |
| L6 | 1231 firestarter_imp L13–17, Halloween-night pattern demo | -423.26804, 43.000004, 328.75165 (n26) | 7.927, 6.488 | `!pos 230 -423.268 43.000 328.752` + condition (`uniqueId`, 19→5 Eorzea, note `halloween_event_enabled` scope) | night window + event switch; retail Halloween city mobs are disguised event NPCs, so this battlenpc row is structural only |

Example additive-SQL sketch for L1 (IDs illustrative; real import uses
auto-increment after current max):

```sql
INSERT INTO `server_battlenpc_spawn_locations`
(`bnpcId`,`uniqueId`,`mobName`,`zoneId`,`posX`,`posY`,`posZ`,`rot`,
 `roams`,`roamDelay`,`modelSize`)
VALUES (1063,'dodo_230_7x6_1','dodo',230,-436.188,43.000,317.070,0,1,23,1);
```

Example condition sketch for L5:

```sql
INSERT INTO `server_battlenpc_spawn_conditions`
(`targetType`,`targetKey`,`requiredWeatherIds`,`despawnOnConditionLoss`,
 `conditionLossDespawnGraceSeconds`,`note`)
VALUES ('uniqueId','dodore_demo_230_7x6_5','8017',1,60,
 'Pattern demo: Gloom-only; cities lack 8017 so this stays despawned.');
```

Mirror-variant note: same cell on zone 133/page 850 has 0 recorded points
inside; nearest node 38 is ~98 yalms away in cell (7,5)
(`!pos 133 -447.807 40.000 233.495`). Do not copy 230 ground into 133 —
sibling bundle correctly planned 133/(7,5) instead.

### 4b. Gridania — zone 206, page 2800, cell (6,5)

Recording: `Data/quicknavmesh/zone_206.tsv`, 675 nodes,
SHA-256 `688b482a9073389de26f7a32adce3f8bbe7b4c660e640bedc7c01aa7314eb63b`.
394 recorded points inside the cell; 0 existing battle mobs in selection.
This is the dense seasonal-hub cell (runners/booths/markers nearby).

| # | BNPC / use | Recorded XYZ (node) | Map cont. | `!pos` / CSV | Gate |
| --- | --- | --- | --- | --- | --- |
| G1 | 1063 dodo L13–16, passive demo | 42.189537, 10.339439, -1273.5297 (n397) | 6.502, 5.505 | `!pos 206 42.190 10.339 -1273.530` / `42.190,10.339,-1273.530,206,13-16,0,0,"dodo"` | none |
| G2 | 1160 dormouse L38–42, passive demo | 42.303463, 10.385783, -1275.4125 (n564) | 6.503, 5.486 | `!pos 206 42.303 10.386 -1275.412` / `42.303,10.386,-1275.412,206,38-42,0,0,"dormouse"` | none |
| G3 | 62001 scrambling_spriggan L20, Hatching demo | 40.664696, 10.219748, -1273.0526 (n672) | 6.487, 5.509 | `!pos 206 40.665 10.220 -1273.053` / seasonal row profile `hatching_tide_2011`, uniqueId `hatching_demo_scrambling_206_1` | profile switch only |
| G4 | 62011 moon_eared_mouse L25, Hunter's Moon demo | 43.75634, 10.4815235, -1273.7521 (n144) | 6.518, 5.502 | `!pos 206 43.756 10.482 -1273.752` / seasonal row profile `hunters_moon_2011`, uniqueId `hunters_moon_demo_eared_206_1` | `hunters_moon_2011_enabled` |
| G5 | 3017 dodore L60 NM, weather-gate pattern demo | 40.818825, 10.233742, -1275.8916 (n629) | 6.488, 5.481 | `!pos 206 40.819 10.234 -1275.892` + condition (`uniqueId`, `requiredWeatherIds='8017'`) | Gloom-only; EXPECTED-OFF in fst_f0 city pool — negative-path proof |
| G6 | 1231 firestarter_imp L13–17, Halloween-night pattern demo | 41.552364, 10.3058, -1271.3231 (n295) | 6.496, 5.527 | `!pos 206 41.552 10.306 -1271.323` + condition (`uniqueId`, 19→5 Eorzea) | night window + `halloween_event_enabled`; structural only (retail uses disguise actors 1001792–1001800 + quest 110800) |

Spacing warning: G1–G6 sit within ~3 yalms of the cell center (dense hub).
A real `plan --count 6 --spacing 12` would spread across the 394 inside nodes
instead of clustering here; these rows are field-format worked examples, not
a spaced plan. Clearance default is 4 yalms from catalog mobs/NPCs.

Mirror-variant note: same cell on zone 155/page 2700 has 88 inside nodes,
nearest `!pos 155 41.254 10.266 -1274.814` (n581) — same transform
(base 608/1824 s2) but a separate recording; sibling bundle planned there.
Keep 155 and 206 candidates separate.

### 4c. Ul'dah — zone 175, page 1800 (Merchant Strip), cell (5,3)

Recording: `Data/quicknavmesh/zone_175.tsv`, 125 nodes,
SHA-256 `1bfcd152001155204c9853bd690e254a9c9adf5e52fd462c9f56bcd0d9d4f317`.
28 recorded points inside the cell; 0 existing battle mobs in selection.

| # | BNPC / use | Recorded XYZ (node) | Map cont. | `!pos` / CSV | Gate |
| --- | --- | --- | --- | --- | --- |
| U1 | 1063 dodo L13–16, passive demo | -206.26201, 190.00002, 23.906862 (n18) | 5.297, 3.759 | `!pos 175 -206.262 190.000 23.907` / `-206.262,190.000,23.907,175,13-16,0,0,"dodo"` | none |
| U2 | 1160 dormouse L38–42, passive demo | -202.66068, 190.00002, 27.139538 (n19) | 5.333, 3.791 | `!pos 175 -202.661 190.000 27.140` / `-202.661,190.000,27.140,175,38-42,0,0,"dormouse"` | none |
| U3 | 62002 scurrying_spriggan L30, Hatching demo | -210.57768, 190.00002, 20.92228 (n17) | 5.254, 3.729 | `!pos 175 -210.578 190.000 20.922` / seasonal row profile `hatching_tide_2011`, uniqueId `hatching_demo_scurrying_175_1` | profile switch only |
| U4 | 62012 moon_toothed_mouse L35, Hunter's Moon demo | -175.57895, 192.00002, 33.30406 (n27) | 5.604, 3.853 | `!pos 175 -175.579 192.000 33.304` / seasonal row profile `hunters_moon_2011`, uniqueId `hunters_moon_demo_toothed_175_1` | `hunters_moon_2011_enabled` |
| U5 | 3017 dodore L60 NM, weather-gate pattern demo | -215.82391, 190.02446, 19.727722 (n16) | 5.202, 3.717 | `!pos 175 -215.824 190.024 19.728` + condition (`uniqueId`, `requiredWeatherIds='8017'`) | Gloom-only; EXPECTED-OFF in wil_w0 city pool — negative-path proof |
| U6 | 1231 firestarter_imp L13–17, Halloween-night pattern demo | -180.23717, 192.00002, 34.957928 (n26) | 5.558, 3.870 | `!pos 175 -180.237 192.000 34.958` + condition (`uniqueId`, 19→5 Eorzea) | night window + `halloween_event_enabled`; structural only |

Note U4/U6 sit on the upper-plaza floor (Y 192) vs U1–U3/U5 on Y≈190 —
a `--height 192 --height-tolerance 3` vs `--height 190` split, exactly the
guide's floor-filter pattern. Never average the two floors.

Mirror-variant note: same cell on zone 209/page 1900 has 0 inside nodes;
nearest (n57) is ~117 yalms away in cell (5,4)
(`!pos 209 -226.033 196.000 107.492`). Do not substitute 175 ground into 209.

## 5. How weather and seasonal flags gate spawns

### 5a. Three separate lanes (do not conflate)

1. **Weather lane** — opcode `0x000D`, `SetWeatherPacket` IDs. Drives sky/VFX
   atmosphere and, for the 60 resident Halloween groups, the client layout
   scheduler via `8027`-only show masks (21 Gridania + 22 Limsa + 17 Ul'dah).
   `server_battlenpc_spawn_conditions.requiredWeatherIds` reads this same ID
   space, so a mob row can require e.g. Gloom `8017`.
2. **Event-mode lane** — opcode `0x0196`, `SpecialEventWork[9]` single word:
   Moonfire-2012 = 18, Foundation = 11, Seventh-Umbral = 20, else 0. Gates
   emote/shop/teleport/dialogue consumers — it does not itself change weather
   or spawn fireworks.
3. **Population lane** — which SQL rows the server loads: ordinary
   `server_battlenpc_spawn_locations` (always) vs seasonal
   `server_seasonal_*` (only enabled `profile`s) vs quest/runtime actors
   (Halloween disguises 19:00–05:00 Eorzea + quest 110800 state; Hunter's
   Moon town criers alternating `_01/_02` direction variants).

### 5b. Per-city seasonal weather matrix (final 1.23b vs retail history)

Final snapshot (`2012.09.19.0001`): Limsa-8027 = Halloween, Ul'dah-8027 =
Halloween, Gridania-8027 = Starlight (July-2012 repurpose); all-city 8029 =
Moonfire atmosphere, all-city 8032 = Dalamud thunder (not Starlight);
overlay restores all-city Halloween 8070 + Starlight 8071; snow 8015 /
wintry 8016 enabled in all three city families for testing. Retail history:
all-city 8027 Halloween (Oct 2011), all-city 8032 Starlight (Dec 2010 + Dec
2011), all-city 8029 Moonfire (Jul 2011) — each with city DAT payloads and
layout targets. Numeric meanings are patch-dependent: never alias final-8032
to Starlight.

| Event | Limsa (sea_s0) | Gridania (fst_f0) | Ul'dah (wil_w0) | Mob-spawn implication |
| --- | --- | --- | --- | --- |
| Halloween | 8027 (final+retail); 8070 overlay | 8027 = Starlight in final → use 8070 overlay or scheduler path; retail-2011 8027 | 8027 (final+retail); 8070 overlay | Gate city battlenpc candidates on profile/`halloween_event_enabled` + optional 19→5 condition; never on bare 8027 in Gridania-final |
| Starlight/Xmas | retail 8032; final: interior pairs dormant (empty masks), no safe named switch | 8027 in final (DAT Xmas pack); retail 8032 | retail 8032; final: probe-only `xmas1/2` | Same: profile switch, not weather ID, is the spawn gate |
| Moonfire | 8029 atmosphere; no 8029 decor mask in final | 8029 atmosphere; compiled hanabi banks without expanded labels | 8029 atmosphere; 6 bank-owner candidates | Atmosphere via `!weather moonfire`; mobs via Moonfire profile rows |
| Gloom NM pattern | 8017 NOT in city pool → gated demo stays off | same | same | Use for negative-path tests (L5/G5/U5) |
| Hatching / Little Ladies / Valentione / Foundation / Heavensturn | no event weather row (Hatching: layout lane only) | same | same | Population-lane only (seasonal profiles); inventing a weather ID is forbidden |

### 5c. Decision checklist per candidate

- Ordinary city demo (L1/L2, G1/G2, U1/U2): ordinary spawn row, no condition.
- Seasonal battlenpc (L3/L4, G3/G4, U3/U4): seasonal row + profile switch;
  add a `spawn_conditions` row only if a weather/time sub-gate is also wanted.
- Weather NM (L5/G5/U5): ordinary or seasonal row + `requiredWeatherIds`;
  set `despawnOnConditionLoss=1` + grace so it leaves when weather flips.
- Night event mob (L6/G6/U6): ordinary or seasonal row + 19→5 Eorzea window;
  keep the event profile as the outer switch so the window alone cannot leak
  the mob outside the event.
- Decoration-only events: no weather condition exists — a weather-gated spawn
  for Hatching-tide/Little Ladies/Valentione/Foundation/Heavensturn would be
  fabrication; use the profile lane.

## 6. Reproduce / verify

```powershell
# Maps + pages (evidence for §2)
python -B tools/mobspawns/map_coordinates.py maps --zone 230
python -B tools/mobspawns/map_coordinates.py maps --zone 206
python -B tools/mobspawns/map_coordinates.py maps --zone 175
# Candidate ground (evidence for §4; read-only)
python -B tools/mobspawns/map_coordinates.py locate --zone 230 --page 914 --cell 7 6 --limit 8
python -B tools/mobspawns/map_coordinates.py locate --zone 206 --page 2800 --cell 6 5 --limit 8
python -B tools/mobspawns/map_coordinates.py locate --zone 175 --page 1800 --cell 5 3 --limit 8
# Mirror-variant guards
python -B tools/mobspawns/map_coordinates.py locate --zone 133 --page 850 --cell 7 6 --limit 5
python -B tools/mobspawns/map_coordinates.py locate --zone 209 --page 1900 --cell 5 3 --limit 5
# Profiles reused (no new mob type needed)
python -B tools/mobspawns/map_coordinates.py mobs dodo
python -B tools/mobspawns/map_coordinates.py mobs spriggan
python -B tools/mobspawns/map_coordinates.py mobs mouse
```

Live acceptance (in game, after any import + Map Server restart): visit each
`!pos`, confirm floor contact, clearance from neighboring NPCs, facing, and
— for gated rows — that the mob appears only under its weather/time/profile
and despawns (or never appears) otherwise.

## 7. Delivery note

Delivered 2026-09-27 via file-tool route (verified). Staging source:
`/tmp/ff14-staging/mob-placement/placements.md`.

## 8. Fidelity boundaries + unresolved

- Candidates are original mappings on recorded ground, not recovered retail
  city spawns. Cities show 0 existing battle mobs in all three worked cells;
  hostile city rows (imp/Dodore patterns) are structural gating demos only.
- Rotations are authored 0; floor contact, clearance, facing, and gated
  appear/despawn behavior all need live `!pos` checks.
- Seasonal drop/level/respawn values cited (Hatching fancy-egg guarantees,
  Hunter's Moon 50%/5%/60 s) are the repo's explicit authored reconstructions,
  not recovered retail probabilities.
- Unresolved: Ul'dah-209 cell (5,3) and Limsa-133 cell (7,6) have no inside
  recording — their 5+ worked sets would need different cells or new
  `!quicknavmesh` captures. (The original "Meteor upstream fetch timed out"
  line is corrected by the parent note at top: upstream raws were fetched by
  sibling scope + parent.)
