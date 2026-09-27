# Programmatic map reading and mob placement

`tools/mobspawns/map_coordinates.py` gives agents a reusable way to read the
legacy maps, locate a grid square or image pixel in server space, find recorded
XYZ positions, and generate public or private placement candidates. It is an offline
command-line tool and importable Python module. It does not need a running game
or database connection. Commands return JSON; failed commands return exit code 2.

Python 3.10+ is sufficient for coordinates and authoring. Rendering also needs
Pillow (`python -m pip install Pillow` if it is not already installed).

## All-zone interface — 2026-09-20

Use this workflow for every zone, including cities, dungeons, strongholds,
raids, islands and arenas. `maps` inventories all **112 main-SQL zone entries**;
**70 zones have 99 zone-specific native map pages**. The remaining 42 entries
(including placeholders and special interiors/copies) are explicitly
`world_only`: world X/Z lookup, recorded XYZ selection and coordinate-grid
rendering work, while map X/Y and unbound artwork remain unavailable. This is
not a claim of complete ground coverage or live calibration in every zone.

`map_registry.py` checks explicit server names, native `_zoneParam` place IDs,
`_layout` navigation ownership, MapNavi region/layout/place joins and texture
dimensions. It never chooses a parent map from an English name or region alone.
Copies retain their own zone ID and recording; identical horizontal metadata
does not authorize borrowing another copy's ground. Unknown server IDs fail.

```powershell
python -B tools/mobspawns/map_coordinates.py maps --zone 231
python -B tools/mobspawns/map_coordinates.py locate --zone 231 --page 2900 --cell 6 5
python -B tools/mobspawns/map_coordinates.py locate --zone 246 --page 5400 --world -1110 -1645 --height 252 --recording Data/raidroutes/evidence/cutters-ground-20260918/zone_246.tsv
python -B tools/mobspawns/map_coordinates.py render --zone 231 --page 2900 --world 64.661 235.623 --height 183.059 --span 180 --output .tmp/darkhold-map.png
python -B tools/mobspawns/map_coordinates.py locate --zone 231 --page 2900 --pixel 500 500 --frame .tmp/darkhold-map.frame.json
python -B tools/mobspawns/map_coordinates.py locate --zone 244 --world 150 150
```

The height arguments above filter nearby evidence; they do not assign a height
to the requested X/Z. A map page selects an image and horizontal transform,
**not a floor**. `plan` requires an explicit height filter in multi-page zones.
That still does not establish that every filtered node belongs to that map page;
use the content-specific approved assignments for final placements. `locate`
keeps center Y unresolved and reports the original sample XYZ, distance and
whether each sample falls inside the requested area.

| Area | Zone examples | Native pages |
| --- | --- | --- |
| Mistbeard / Cassiopeia / U'Ghamaro | 131 / 132 / 137 | 600 / 700 / 4900 |
| Mun-Tuy / Nanawa | 157 / 176 | 2500 / 1600 |
| Tam-Tara / Copperbell | 158 / 178 | 2600, 2620 / 1700, 1720 |
| Darkhold | 231 | 2900, 2902 |
| Shposhae | 235 | 5000, 5002, 5003, 5004, 5005 |
| Aurum Vale and copies | 245, 252, 253 | 5500, 5502, 5503 |
| Cutter's Cry and copies | 246, 254, 255 | 5400, 5402, 5403, 5404; layout 415 |
| Cities, wards, offices, arenas, islands | See `maps --zone <id>` | Their own scale-1/2/4 native frames |

`--page` takes a MapNavi row ID, not a one-based floor number. Landmark rows
with the same texture and transform are aliases of one page; e.g. Copperbell
1714 resolves to 1720. Multi-page zones require a choice even where two pages
share offsets. Render frames and CLI plans retain that page identity, and the
CLI rejects a crop or plan belonging to a different page or calibration.

Rendering prefers the installed client's exact tiles, selected by the native
texture resource. `--client-root` overrides the default legacy client folder.
The frame records the texture source and a digest of the native tile manifest.
If the client is absent, a specifically bound archive can be used; without
either, the image is visibly labeled a coordinate grid without map artwork.
Partial/corrupt native tile sets fail instead of creating misleading terrain.
For full-image `--pixel` inputs, `maps` gives `default_full_image_size` and
`archive_image`; supply `--image-size WIDTH HEIGHT` for a differently sized full
image, including a native texture when the default is a resized archive.

`maps --zone` lists live and frozen `zone_ID.tsv` sources separately. Counts
use only the live recording by default. `--recording` selects exactly one file,
checks its zone header and node validity, and records its SHA-256. Snapshots
are not automatically merged. A filename/header is not proof of historic
capture correctness: retain the Copperbell repairs, Darkhold exclusions and
other content-specific evidence reviews. Do not apply accepted node ranges to
a different recording merely because node numbers coincide.

Public `plan` exports retain the existing exact-point CSV and additive SQL.
Private/content-owned zones default to a **JSON-only candidate plan** and reject
public SQL export. For example, a Darkhold candidate must still go through its
own user-placement layers and builder; this interface does not overwrite the
175-point manifest. Aurum's unresolved heights and Cutter's frozen support keep
their existing evidence status. See each zone's specialized instructions in
`AGENTS.md`. No CLI command applies a database change; approved DB edits must
also be incorporated into main SQL, not delivered only as live migrations.
Catalog overlays are literal public SQL rows, not a live database view: later
UPDATE/DELETE overlays and private runtime homes require their owning tools.

For Python callers:

```python
from tools.mobspawns.map_coordinates import get_map
from tools.mobspawns.map_registry import load_registry, resolve_page

page = resolve_page(231, 2902)
transform = get_map(231, 2902)
x, z = transform.map_to_world(6.5, 5.5)
assert (x, z) == (-86, -43)
assert page.native_to_world(1300, 1100) == (-86, -43)
assert get_map(244) is None  # world-only; not an invented map transform
```

The historical `load_maps()` function keeps its original 20 outdoor zones,
names and transforms so frozen authored outputs regenerate unchanged. The CLI,
`get_map` and `load_registry` are the general entry points for new work.
`MapTransform.width`/`height` are world extents after scale; `MapPage.native_size`
is the texture extent. Use `native_to_world` for native pixels rather than
passing unscaled pixels into the legacy `nav_to_world` offset helper.

Validation for this expansion: 34 coordinate/interface tests pass. All 50
distinct registered texture resources decoded from the installed client, and
Darkhold, Cutter and Market Wards previews were inspected. The broader placement
suite ran 222 tests with three failures and seven setup errors involving existing
snapshot/protected-content hashes, Copperbell line endings and the Nanawa saved
selection. Each of those ten issues also reproduced with the unchanged HEAD
coordinate module. This pass preserves those baselines and does not relabel them
as passing or rebuild accepted populations to satisfy old hashes.

## Agent workflow

List the supported zones and their recorded coverage, then locate an area:

```powershell
python -B tools/mobspawns/map_coordinates.py maps
python -B tools/mobspawns/map_coordinates.py locate --zone 128 --cell 32 38
```

For Lower La Noscea, integer grid square `(32,38)` resolves to:

- World X: `672 <= X < 772`
- World Z: `792 <= Z < 892`
- Center: `X=722, Z=842`
- Y: unresolved until a position with a recorded height is selected.

The current zone-128 recording has no nodes inside this particular square. The
tool reports nearby samples with their distances and `inside_selection=false`;
it does not reuse their heights at the requested center. The same grid numbers
on another map have different world coordinates. A parent regional map also
contains several server zones: a conversion alone cannot prove zone membership.

Render the map area with recorded paths, existing mobs and NPCs:

```powershell
python -B tools/mobspawns/map_coordinates.py render --zone 128 --cell 32 38 --span 500 --output .tmp/placement-map.png
```

The PNG shows a yellow selected square, cyan recorded nodes, orange existing
public mobs and white public NPCs. An agent can inspect the terrain and choose
pixels in this image, then convert those pixels using its companion frame:

```powershell
python -B tools/mobspawns/map_coordinates.py locate --zone 128 --pixel 500 500 --frame .tmp/placement-map.frame.json
```

The frame includes the crop origin, scale, margins and zone. Pixels in the
margin or from a different zone are rejected. If the PNG is resized after
rendering, convert the chosen pixel back to its original dimensions first.

Other input forms:

```powershell
# Deliberately precise map coordinates, rather than an integer grid square.
python -B tools/mobspawns/map_coordinates.py locate --zone 128 --map 32.5 35.5
# Existing server horizontal coordinates.
python -B tools/mobspawns/map_coordinates.py locate --zone 128 --world 966 833
# Pixels on the complete archived map, resized to a known size.
python -B tools/mobspawns/map_coordinates.py locate --zone 128 --pixel 873.5 960.25 --image-size 1152 1152
```

`--pixel` without a frame or size uses the original full image's dimensions.
Do not use this shortcut for screenshots, arbitrary crops, or a different map
edition: establish its mapping against known landmarks first. The tool does
not perform OCR or identify arbitrary maps automatically.

## Generate placements

For the 102 ordinary level-30/40 regional guildleves, use the separate
[encounter placement workflow](guildleve_grounded_placements_2026-09-08.md)
and `tools/mobspawns/regional_guildleve_placements.py`. It preserves existing
encounter mechanics and uses frozen node/edge evidence. Its runtime geometry
belongs in the leve scripts, not public-world spawn SQL. The currently covered
12 camps have 102 recorded-ground layouts. Nanawa's eight per-leve layouts now
use a frozen movement recording; see [Nanawa authoring notes](guildleve_nanawa_authored_2026-09-09.md).
Its inferred links join only short gaps between consecutive saved nodes, and
undotted passages are unavailable for authoring. Its older camp fallback remains
unresolved; the per-leve lookup is authoritative for these encounters.
Ten camps use captured route edges. For Cassiopeia, the user authorized
map-reviewed placement from captured XYZ despite sparse links caused by
increased movement speed. Its dedicated preview uses the dungeon's own client
map inputs; the live grid check remains pending. Explicit `--point-cloud-zones`
authoring stores inferred short links separately from captured edges and keeps
route testing pending. It never interpolates or invents ground XYZ. See the
[Cassiopeia report](cassiopeia_guildleve_placements_2026-09-08.md).
Mun-Tuy now uses exact recorded XYZ and captured links, with a dedicated preview
from its own MapNavi row 2500; its displayed grid check remains pending. See the
[Mun-Tuy report](mun_tuy_guildleve_placements_2026-09-08.md).
Use `propose --zones ...` to extend only the intended camps without moving the
completed layouts when live recordings change.

Find a reviewed mob profile. This avoids guessing actor classes, skills or
behavior from a name:

```powershell
python -B tools/mobspawns/map_coordinates.py mobs dodo
```

For example, BNPC `1063` is the existing level 13–16 dodo. Preview four placements
inside a square with recorded ground coverage:

```powershell
python -B tools/mobspawns/map_coordinates.py plan --zone 128 --cell 32 35 --bnpc-id 1063 --count 4 --spacing 12
```

The planner chooses complete recorded XYZ points inside the selection and keeps
them apart horizontally. It keeps a default 4-unit clearance from catalog mobs
and NPCs in the same zone. `--spacing` controls separation; `--clearance` controls
existing-actor clearance. For point inputs, `--radius` is the allowed search
distance (default 30 world units); it never expands a selected grid square.

`--height 45 --height-tolerance 3` restricts candidates to a desired floor. It
filters recorded nodes instead of overriding their Y. Inspect plans in stacked
or multilevel areas; without a height filter, all recorded floors are eligible.
If too few nodes satisfy the constraints, the command fails without exporting
partial placements or making up additional points.

To save a reviewed draft and show its placements on the map:

```powershell
python -B tools/mobspawns/map_coordinates.py plan --zone 128 --cell 32 35 --bnpc-id 1063 --count 4 --spacing 12 --output-dir .tmp/dodo-placement
python -B tools/mobspawns/map_coordinates.py render --zone 128 --cell 32 35 --placements .tmp/dodo-placement/plan.json --output .tmp/dodo-placement/map.png
```

The directory contains:

- `plan.json`: positions, source file/node, exact BNPC ID, levels, stable IDs and
  `!pos <zoneId> <X> <Y> <Z>` commands for in-game inspection, for example
  `!pos 128 723.876 45.493 541.934`.
- `mobspawns.csv`: the existing eight-field capture format, with count/distance
  both zero so these are exact points rather than a randomized flat-height pack.
- `placements_append_only.sql`: additive inserts using the existing BNPC ID.
  It leaves existing placements and mob profiles intact and allocates spawn IDs
  through the table's auto-increment. Repeated identical points have the same
  content-derived unique ID, independent of batch ordering or count.

Use this SQL for a direct import into the intended server schema; do not run the
old counter-based converter on this isolated CSV, since its names can collide
with previously imported batches. The CSV remains useful for the existing
capture/master workflow after deliberate integration. SQL references an already
installed BNPC profile; if the profile is missing, its inserts are skipped.
Restart Map Server after a database import to load changed static placements.
The tool never imports SQL or restarts servers itself.

These are authoring candidates based on recorded movement. They do not prove
retail spawn locations, encounter membership, roaming bounds, terrain collision,
or connectivity. The plotted map is artwork, not a collision mesh. Existing mob
and NPC positions provide context only, and private-area rows are excluded.

## Calibration and evidence

The original outdoor calibrations remain unchanged. This table describes the
compatibility API; the all-zone registry additionally selects each territory's
own native row rather than a shared regional representative:

| Map | Zone IDs | MapNavi row | Base X / Z | Full texture size |
| --- | --- | ---: | --- | --- |
| La Noscea | 128, 129, 130, 135 | 100 | 2528 / 3008 | 4608 × 4608 |
| Coerthas | 143, 144, 145, 147, 148 | 3000 | 3712 / 2144 | 6656 × 5120 |
| Black Shroud | 150, 151, 152, 153, 154 | 2000 | 3104 / 3808 | 6144 × 6144 |
| Thanalan | 170, 171, 172, 173, 174 | 1000 | 2687 / 3072 | 5632 × 5632 |
| Mor Dhona | 190 | 3500 | 1280 / 1344 | 2560 × 2560 |

The tool reads the offsets and scale from `docs/Dat Mining/mapNavi_data.csv`,
and full texture dimensions from `docs/Dat Mining/2Dmap_piece.csv`. It uses the
existing full regional artwork under `tools/gatheringpoints/offline_maps/assets/maps`.
Scaled archive images have explicit dimensions. La Noscea's navigation viewport
width is 4600, but its actual texture is 4608: using the viewport for image
scaling introduces drift. The tool uses the texture dimensions.

For every registered native map:

```text
world X = native map pixel X / native scale - base X
world Z = native map pixel Y / native scale - base Z
continuous map X = (world X + base X) / 100
continuous map Y = (world Z + base Z) / 100
integer map square = floor(continuous map coordinates)
```

Horizontal anchor checks use client navigation rows and independent server
positions: Widow Cliffs `(966,833)`, Red Labyrinth `(1797,1856)`, Burnt Lizard
Creek `(1185,1407)`, Alder Springs `(-1567,-2593)`, Feather Gorge `(960,-22)`, and
Camp Brittlebark `(484,672)`. See [the earlier reconstruction method](zone_position_reconstruction_method.md).

The 100-unit outdoor grid interpretation is checked against the official
[patch 1.21 coordinates](https://forum.square-enix.com/ffxiv/threads/39024-patch1.21-Patch-1.21-Notes)
and repository positions for Zephyr Gate `(25,31)`, Mistalle Bridges `(34,28)`,
Alberic `(35,18)` and Curious Gorge `(15,33)`. This is a calibration from those
matches, not a claim that every old NPC seed or every archived hint is exact.
Known mismatches, such as some other old job-NPC rows, should be investigated
rather than used to alter a map's transform automatically.

Recorded heights come from `Data/quicknavmesh/zone_<id>.tsv`. At implementation
time, the supported zones contain 76,218 nodes; zone 135 and 148 have no such
recording, and coverage in other zones is partial. Run `maps` for current counts.
Use the server's `!quicknavmesh start`, `!quicknavmesh sample`, `!quicknavmesh stop`
and `!quicknavmesh save` commands to capture more ground when needed. Bring saved
recordings back into this checkout before using them in the offline tool.

Additional source coverage is preserved in
`Data/quicknavmesh-evidence/premerge-20260909/`. See the
[snapshot inventory and usage](navmesh_premerge_recordings_2026-09-09.md) before
declaring a location unrecorded. The CLI still reads `Data/quicknavmesh` by
default; this evidence has not been merged into the live recordings. Node IDs
are local to each source, so raw concatenation or cross-source consecutive-ID
links are invalid.

City, dungeon, instance and alternate-zone transforms use explicit native
bindings. Extend missing bindings only with evidence for scale, offsets, map
image alignment and zone ownership. Live observations remain scoped to their
exact points even when native table geometry is available for the whole page.

## Live validation — 2026-09-08

The user tested these three teleport commands and confirmed all three were
correct after being asked to check map square `(32,35)` and ground height in
Lower La Noscea (zone 128):

```text
!pos 128 723.876 45.493 541.934
!pos 128 675.016 44.462 588.239
!pos 128 761.412 45.226 492.743
```

The exact tested coordinates and original recording node IDs are saved in
[`map_coordinate_validations.json`](../tools/mobspawns/map_coordinate_validations.json).
These remain stable references if movement recording later updates the nodes.
The regression suite checks their confirmed map squares and command output;
ground-height confirmation is the user's in-game observation. This validates
these three points, not every point or another regional map.

The user's follow-up identified the `761.412 / 492.743` point at the top-right
end and `723.876 / 541.934` close to the middle. The `675.016 / 588.239` point
was initially described as top-left, then clarified as **below the middle** on
the north-up map. That agrees with the calculated bottom-left position. The
calculated fractions across/down the square are respectively `(0.89412,0.00743)`,
`(0.51876,0.49934)` and `(0.03016,0.96239)`. No map-axis change was needed.

A [cropped screenshot](maps/mob-coordinate-validation-2026-09-08.png) is retained
as visual context. It does not show grid labels or identify its exact test
command, so the fractions above remain calculated values rather than measured
pixel positions from that image.

## Pending dungeon calibration — Tam-Tara Deepcroft

The next user test set uses actual recorded movement XYZ in zone 158. These are
pending live confirmation. Both native map pages are now available in the
shared registry; that does not turn these test points into live confirmations:

| Command | Expected map square | Recording node |
| --- | --- | ---: |
| `!pos 158 258.900 -11.464 -270.359` | `(6,3)` | 1 |
| `!pos 158 314.903 -54.998 -22.229` | `(6,5)` | 79 |
| `!pos 158 277.291 -64.128 -109.626` | `(6,4)` | 937 |

Source: `Data/quicknavmesh/zone_158.tsv`. The samples span different elevations;
their Y values are recorded, not extrapolated from a neighboring point.

The candidate dungeon mapping comes from its own `mapNavi_data.csv` row 2600:
base X/Z `(384,608)`, image scale `2`, first-ring piece 1226. Row 2620 uses
second-ring piece 1231 with the same offsets and scale. The marker at native
pixel `(1394,874)` converts by `pixel / 2 - base` to `(313,-171)`, matching the
existing Tam-Tara gate anchor (event-NPC row 797). Candidate map-grid values use
`(world + base) / 100`, predicting the squares above. Do not apply the Black
Shroud outdoor transform or assume first/second-ring selection from region ID.
The user's displayed map numbers, active ring and ground-height observations
are needed before promoting this dungeon calibration.

## Live test without recorded navmesh — Mistbeard Cove

At the user's request, the next test deliberately uses zone 131, which has no
`Data/quicknavmesh/zone_131.tsv` in this checkout. The repository's only `.snb`
found during this check is `Map Server/navmesh/wil0Field01.snb`, for another map.
These are map-selected test points, not recorded ground positions or approved
mob placements. User feedback on the horizontal positions and confirmed floor
height at these three exact spots is recorded below.

Mistbeard uses its own navigation row 600: base X/Z `(2400,2176)`, scale `2`,
piece 1051 with native texture dimensions `2560 x 2048`. Its full archived
artwork `mistbeard-cove-1x.jpg` is `2048 x 1638`; scale each image axis separately
to the native texture before applying `native pixel / 2 - base`. The navigation
marker `(1411,1284)` yields `(-1694.5,-1534)`, matching gate row 748 in
`Data/sql/server_eventnpc_spawn_locations.sql`.

Points were selected visually on the pale chamber/corridor areas, avoiding the
drawn green rectangular features. Exact grid readings have not been supplied.
All three points are at least 30 world units from a grid edge:

| Point | Command | Candidate continuous map X/Y | Expected square |
| --- | --- | --- | --- |
| A | `!pos 131 -1950.000 -20.000 -1616.000` | `(4.50,5.60)` | `(4,5)` |
| B | `!pos 131 -2035.000 -20.000 -1616.000` | `(3.65,5.60)` | `(3,5)` |
| C | `!pos 131 -1960.000 -20.000 -1546.000` | `(4.40,6.30)` | `(4,6)` |

On 2026-09-08, the assistant clarified that A was centered horizontally and
slightly below the middle, B right and below center, and C left and above
center on the north-up map. The user replied, "yes :) so is there refinement
you need made or nah?" This supports the predicted horizontal arrangement
qualitatively; it is not a measured error bound, a report of exact displayed
coordinates, or a ground-height confirmation. No offset or scale adjustment
is justified by this feedback alone.

**The user subsequently confirmed all three points landed on the floor at
Y = -20.** The initial height estimate came from nearby door objects 3621–3627
(event-NPC SQL rows 3157–3163); the ground-height evidence now comes from the
explicit in-game response, "All three were on the floor." The exact commands
and scoped evidence are saved under `dungeon_test_batches` in
[`map_coordinate_validations.json`](../tools/mobspawns/map_coordinate_validations.json).
No offset, scale or height adjustment was indicated by this test.

This confirms the three test spots only. Exact displayed grid readings, the
rest of the dungeon, and traversability between points remain unverified.
A temporary annotated preview is `.tmp/mistbeard-coordinate-test/map.png`;
its grid labels show predictions. Mistbeard is now available in the shared
registry. Automatic candidates use the explicitly selected recording; these
three historic observations are not a general heightmap.

## Darkhold recording and second-map access — 2026-09-08

At the first checkpoint the user reported completing the first map. The saved
`Data/quicknavmesh/zone_231.tsv` contained 613 movement nodes at that checkpoint,
covering X `-97.19539..308.58432`, Y `128.40527..228`, and Z
`-50.540104..307.91452`. This is recorded route coverage, not a complete
heightmap or confirmation of the existing reconstructed monster placements.

Both Darkhold maps belong to zone 231. Their own navigation rows differ:
row 2900 uses piece 1321, scale 2 and base X/Z `(560,384)`; row 2902 uses
piece 1331, scale 2 and base X/Z `(736,593)`. Both are now registered in the general
coordinate tool. The second map includes Dragonbreath Falls and Feasting Hall
(navigation rows 2918/2919, place-name IDs 4114/4115).

The original route uses a transporter between sections. `DzemaelManager` now
publishes functional two-way portals after all five circles, using recorded
source/landing points and the existing magitek sigil. The original transporter
visual/event binding remains unresolved. The generic `UseRaidDungeonWarp`
helper returns a participant to their saved entrance; it must not be wired in
as the next-map destination.

For a **manual access probe only**, the exact shipped Feasting Hall barrier
anchor (event-NPC SQL row 905) is:

```text
!quicknavmesh stop
!pos 231 -95.198 164.884 -13.873
```

This is a map-object position, **not a recorded player floor position**.
Confirm the visible map and landing, then step onto ordinary ground before
restarting recording. Do not import this probe into ground validations or use
its Y for surrounding mobs without a player confirmation/capture. The same-zone
`!pos` path preserves the current private instance.

The user subsequently completed both maps and the requested additional
Captain's Quarters and northern crystal-arena coverage. The final frozen
snapshot contains 1,409 nodes at
`Data/raidroutes/evidence/dzemael-20260908/zone_231.tsv`. Its exact sample IDs and
SHA-256 are retained in `Data/raidroutes/dzemael_grounded_positions.json`.
This is separate from the mutable quicknavmesh recording.

The user confirmed that the first-map dead-end after the 17:16:45 warp was
behind a wall and should be ignored. Nodes 599-613 are explicitly excluded in
the manifest and rejected by validation. The active navmesh retains 1,394 nodes
after removing those 15 nodes and their eight incident edges; raw evidence is
preserved. The affected coffer, outgoing portal and return landing use nodes
590, 598 and 592 respectively, before the wall.

Use the dedicated private-instance workflow for this reviewed selection:

```powershell
python -B tools/mobspawns/darkhold_placements.py
python -B tools/mobspawns/darkhold_placements.py --write-csharp
python -B tools/mobspawns/darkhold_placements.py --render docs/maps/dzemael-grounded-20260908
python -B -m unittest discover -s tools/mobspawns -p test_darkhold_placements.py
```

The helper validates exact sample XYZ or an explicit user placement observation
bound to the same zone, map and placement key, checks reviewed profile joins, and generates
`Map Server/Dungeons/DzemaelGroundedPositions.cs`, and can render both native
client maps with a crop frame and numbered legend. It does not create public
spawn SQL. The current video-reviewed manifest has 138 entries: 135 use exact
captured samples. The first gate device uses the user's supplied
`(65.563, 180.500, 199.840)` with no visual height offset, and the upper-route
Bone Nix uses `(62.911, 184.359, 240.074)`. The second gate device uses the
user's likely position `(128.901, 180.046, 200.182)`. These observations are
saved in `map_coordinate_validations.json`; the historically tested Grand Hall
large-circle floor point remains preserved separately. All noncombat entries
explicitly require zero visual offset: device, chest, reward, portal and landing
XYZ reach the runtime without an added Y lift. Native doors keep their exact
client layout bindings, whose model origins are separate from floor points.
Use `--render-noncombat docs/maps/dzemael-noncombat-20260908` to review every
noncombat object together. See the [complete audit](dzemael_noncombat_placements_2026-09-08.md).
See the [placement report](dzemael_grounded_placements_2026-09-08.md) and the
reviewed [first map](maps/dzemael-grounded-20260908/map1.png) and
[second map](maps/dzemael-grounded-20260908/map2.png).
Use `--render-access docs/maps/dzemael-traversal-20260908` for the door, portal,
chest and exclusion overlay; see the [traversal audit](dzemael_traversal_2026-09-08.md).

After rebuilding the Map Server, GM solo-test instances support
`!dzemael map 1` and `!dzemael map 2` to reach recorded access ground. These do
not advance objectives and are not the original route transporter. The earlier
map-object probe remains unconfirmed as a floor point; the user completing a
recording did not confirm that probe's precise XYZ.

## Verification

```powershell
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
python -B -m unittest discover -s tools/mobspawns -p test_map_registry.py
```

Tests exercise the five-map anchor conversion, official and user-confirmed grid examples,
image/coordinate round trips, invalid inputs, recorded-floor selection, spacing,
missing coverage, CSV compatibility, and rendered crop frames. Additive SQL is
executed twice against an isolated SQLite schema to verify IDs, profile reuse,
reruns and preservation of existing rows; this does not substitute for a live
MySQL import or in-game collision check.
