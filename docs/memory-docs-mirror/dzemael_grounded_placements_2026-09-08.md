# Dzemael Darkhold ground placement pass - 2026-09-08

> Historical first pass: counts, room assignments and the first three door unlocks
> are superseded by [the video correction](dzemael_video_placement_review_2026-09-08.md).
> The maps in this directory now show the corrected manifest. Ground provenance
> and the explicitly excluded wall branch remain unchanged.

The completed movement recording supplies 1,409 samples across both original
zone-231 maps, including the additional Captain's Quarters and northern crystal
arena coverage requested from the user. Its frozen copy is
[zone_231.tsv](../Data/raidroutes/evidence/dzemael-20260908/zone_231.tsv).
The [placement manifest](../Data/raidroutes/dzemael_grounded_positions.json)
stores the capture hash, individual node IDs, exact XYZ, and reviewed BNPC IDs.
The user's mutable quicknavmesh save is not a build dependency.

The subsequent [traversal pass](dzemael_traversal_2026-09-08.md) excludes nodes
599-613 after the user confirmed a wall warp into the final first-map dead-end.
The frozen capture retains the raw evidence; active navigation has 1,394 nodes.
The manifest rejects excluded samples and contains 85 entries: 84 exact capture
points plus the previously confirmed Grand Hall floor point.

## Implemented placement changes

| Content | Count | Ground source |
| --- | ---: | --- |
| Staged mobs, including Deepvoid Slave and Batraal | 48 | Exact movement samples |
| Additional Eye/Soulgazer relocation anchors | 2 | Exact movement samples; no duplicate actors |
| Batraal adds across three phases | 12 | Fixed arena samples, independent of boss movement |
| Magitek circles and terminals | 7 | Six samples plus the previously confirmed Grand Hall floor point |
| Route and objective coffers | 6 | Exact movement samples |
| Conditional victory coffers | 5 | Fixed arena samples, independent of where Batraal dies |
| GM map access anchors | 2 | Exact movement samples |
| Inter-map and victory portals | 3 | Exact movement samples; independent landing points |

All 18 reviewed mob profiles are represented by static spawns or boss waves.
The existing roster, stage conditions, boss thresholds, reward eligibility,
and idempotent publication remain in `DzemaelManager`. The manifest generates
[DzemaelGroundedPositions.cs](../Map%20Server/Dungeons/DzemaelGroundedPositions.cs).
Runtime mobs and waves verify that their selected BNPC IDs match their profiles.

Batraal is now in the crystal arena instead of Knights' Quarters, and the
Captain's group is inside Captain's Quarters. Boss wave samples have more than
six horizontal units of separation from one another, Batraal's starting point,
and both terminals, including across different phases. This avoids initial
overlap even when several thresholds are crossed quickly; it is not a promise
about where combat AI subsequently moves actors.

Device coordinates in the manifest describe floor Y. Runtime device actors add
the existing +2.63 visual offset. The historical tested Grand Hall large circle
remains at floor `(69.994, 178.620, 142.770)`, actor Y `181.250`.

## Map review

These renders use each dungeon map's own client navigation row and native GTEX
tiles. First map: row 2900, piece 1321, texture resource 39304, scale 2, base
`(560,384)`. Second map: row 2902, piece 1331, resource 39305, scale 2, base
`(736,593)`. Native pixel coordinates are `2 * (world + base)` before cropping.
The general outdoor grid tool has not gained dungeon grid-label calibration.

- [First map](maps/dzemael-grounded-20260908/map1.png),
  [legend](maps/dzemael-grounded-20260908/map1-legend.txt),
  [pixel frame](maps/dzemael-grounded-20260908/map1.frame.json).
- [Second map](maps/dzemael-grounded-20260908/map2.png),
  [legend](maps/dzemael-grounded-20260908/map2-legend.txt),
  [pixel frame](maps/dzemael-grounded-20260908/map2.frame.json).

Cyan points are recorded movement; red is mobs/anchors, orange is boss adds,
blue is devices, magenta is coffers, and green is GM access/portal diamonds. Labels span the
whole manifest. Different encounter stages and conditional rewards are shown
together for review; they are not all published together at entry.

The GTEX extractor's DDS header had one extra integer, preventing tile decoding.
That packing error is corrected and covered with DXT1 and DXT5 decode tests.

## Regenerate and validate

```powershell
python -B tools/mobspawns/darkhold_placements.py
python -B tools/mobspawns/darkhold_placements.py --write-csharp
python -B tools/mobspawns/darkhold_placements.py --render docs/maps/dzemael-grounded-20260908
python -B -m unittest discover -s tools/mobspawns -p test_darkhold_placements.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate_dzemael_darkhold.ps1
dotnet build "Map Server/Map Server.csproj" --no-restore -o .tmp/dzemael-grounded-build
```

Rendering reads a locally installed 1.x client; use `--client-root` if its path
differs. Validation and C# generation use repository evidence only. The helper
generates no SQL. All placements remain private-instance runtime data.

Validation completed: 14 placement regressions, 64 traversal checks and 18
existing coordinate tests passed; the Darkhold static validator and all five
Lua parses passed. Map Server builds succeeded with zero errors and existing
warnings. Both placement and access map renders were inspected. The traversal
report describes the latest door, portal and chest-access changes. No server
was restarted during this work.

## In-client verification and remaining evidence

Deploy the rebuilt Map Server and start a fresh `!dzemael enter nocs` instance.
The already running server and its current instance do not reload compiled
placements. Walk the normal circles and encounter stages, checking model
clearance and targeting. Use `!dzemael diag` to inspect the stage and counts.

For map access in a GM solo instance:

```text
!dzemael map 1
!dzemael map 2
```

These select recorded access points at the first route's far end and
Dragonbreath Falls respectively. They preserve the private instance and do not
complete objectives or publish later stages. Existing `!dzemael defeat deepvoid`
can drive the objective for a later-stage smoke test; use `!dzemael boss 99`,
`80`, and `40` after Batraal is published to inspect his waves.

Enemy assignments, pack counts, facing, and terminal placement remain authored
reconstruction. Exact recorded ground does not prove retail spawns, continuous
walkability, or clearance for every monster model. No populated in-client run
has been completed for these new placements yet.

Functional inter-map and victory portals are implemented using the existing
magitek sigil. The original transporter visual/event binding and historical
Eye/Soulgazer patrol sequences, sector changes, and pause/cast timing remain
unresolved. The hazards
retain their existing passive/invulnerable behavior and single-actor identity;
this pass does not invent patrol recordings. The manual Feasting Hall map-object
access probe was never promoted to confirmed ground evidence.
