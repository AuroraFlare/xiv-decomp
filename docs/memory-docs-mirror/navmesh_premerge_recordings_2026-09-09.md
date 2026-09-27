# Supplemental quicknavmesh recordings — 2026-09-09

The user supplied `D:/navmesh/quicknavmesh-premerge-20260909`. Its 18 zone files
are preserved byte-for-byte in
[`Data/quicknavmesh-evidence/premerge-20260909/`](../Data/quicknavmesh-evidence/premerge-20260909/).
The [manifest](../Data/quicknavmesh-evidence/premerge-20260909/manifest.json)
records source paths, hashes, node/edge counts and the comparison with the
project recordings at import time.

The snapshot contains **76,868 recorded nodes**, including **13,305 exact XYZ
positions absent from the corresponding current project files** and **19,346
additional captured edges**, compared by endpoint XYZ. This is evidence for
future authoring, not a runtime navmesh merge or a change to existing leve
positions. Both sources usually contain exclusive samples; the backup is not
a safe wholesale replacement for the current recordings.

| Zone | Recording place name | Snapshot nodes | Additional exact XYZ |
| --- | --- | ---: | ---: |
| 128 | Lower La Noscea | 3,768 | 595 |
| 129 | Western La Noscea | 3,330 | 0 |
| 130 | Eastern La Noscea | 3,582 | 6 |
| 143 | Coerthas Central Highlands | 5,250 | 64 |
| 150 | Central Shroud | 8,589 | 4,519 |
| 151 | East Shroud | 3,578 | 226 |
| 152 | North Shroud | 4,542 | 73 |
| 154 | South Shroud | 3,036 | 1,435 |
| 155 | Gridania | 844 | 842 |
| 158 | The Tam-Tara Deepcroft | 938 | 5 |
| 170 | Central Thanalan | 7,670 | 1,300 |
| 171 | Eastern Thanalan | 11,085 | 511 |
| 172 | Western Thanalan | 8,834 | 281 |
| 174 | Southern Thanalan | 5,628 | 27 |
| 175 | Ul'dah | 829 | 729 |
| 190 | Mor Dhona | 2,682 | 25 |
| 206 | Gridania | 2,653 | 2,637 |
| 244 | Inn Room | 30 | 30 |

Names above come from recording headers. Zones 155 and 206 remain distinct;
their shared place name does not establish interchangeable positions or map
transforms. Use `map_coordinates.py maps --zone <id>` for the zone's own native
pages or explicit world-only status. The shared registry now covers cities and
dungeons; it does not make recordings interchangeable.

## Using this evidence

Check this source when the live recording does not cover a proposed placement.
Load a source independently, retain its exact XYZ, and record its path, hash
and node IDs in the authored placement's provenance. The existing Python API
accepts an explicit directory (with `tools` on the Python import path):

```python
from pathlib import Path
from mobspawns import map_coordinates

points = map_coordinates.recorded_points(
    154, Path("Data/quicknavmesh-evidence/premerge-20260909")
)
```

The map CLI continues to use `Data/quicknavmesh` by default. It does not
automatically union this snapshot into its coverage counts or placement plans.
Existing frozen guildleve evidence and confirmed test coordinates also remain
unchanged.

Node IDs are source-local and may identify different positions in another
recording. Do not concatenate these files, overwrite a current recording with
the backup, or infer traversal from consecutive IDs across sources. A future
merge must remap IDs, preserve each captured edge's provenance, and review
connections between sources. Nearby points and map artwork are not proof that
an unrecorded link is walkable. High-speed recording can save valid ground XYZ
while omitting traversal links.

## Validation

All 18 files passed the existing `recorded_points` parser: matching zone
headers, finite XYZ, unique node IDs and positive sample counts. Every captured
edge references nodes within its own file. Saved copies were checked against
the original bytes. Comparison uses exact parsed XYZ within the same zone and
unordered endpoint pairs for edges; it does not merge near-duplicate points.
These checks establish file integrity, not collision or in-game route safety.
