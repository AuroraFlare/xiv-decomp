# Supplemental quicknavmesh snapshot — 2026-09-24

The user supplied `D:/navmesh/quicknavmesh`. Its 51 zone files are preserved
byte-for-byte in
[`Data/quicknavmesh-evidence/quicknavmesh-20260924/`](../Data/quicknavmesh-evidence/quicknavmesh-20260924/).
The [manifest](../Data/quicknavmesh-evidence/quicknavmesh-20260924/manifest.json)
records source paths, hashes, node/edge counts and the comparison with the
project recordings at import time.

The snapshot contains **152,827 recorded nodes**, including **5,648 exact XYZ
positions absent from the corresponding current project files** and **6,888
additional captured edges**, compared by endpoint XYZ. Two zones are new to the
project (`193 Rhotano Sea`, `232 Maelstrom Command`). This is evidence for
future authoring, not a runtime navmesh merge or a change to existing
positions. Both sources contain exclusive samples in 11 zones; the backup is not
a safe wholesale replacement for the current recordings. Live
`Data/quicknavmesh/*.tsv` files are unchanged by this import.

| Zone | Recording place name | Snapshot nodes | Additional exact XYZ | Project-only exact XYZ |
| --- | --- | ---: | ---: | ---: |
| 128 | Lower La Noscea | 7,500 | 3,673 | 160 |
| 129 | Western La Noscea | 3,792 | 60 | 0 |
| 130 | Eastern La Noscea | 4,413 | 13 | 44 |
| 131 | Mistbeard Cove | 3,144 | 0 | 0 |
| 132 | Cassiopeia Hollow | 1,358 | 0 | 0 |
| 133 | Limsa Lominsa | 299 | 126 | 15 |
| 135 | Upper La Noscea | 2,079 | 0 | 0 |
| 137 | U'Ghamaro Mines | 487 | 0 | 0 |
| 143 | Coerthas Central Highlands | 10,166 | 0 | 0 |
| 144 | Coerthas Eastern Highlands | 5,814 | 0 | 0 |
| 145 | Coerthas Eastern Lowlands | 3,630 | 0 | 0 |
| 147 | Coerthas Central Lowlands | 7,226 | 0 | 0 |
| 148 | Coerthas Western Highlands | 7,902 | 0 | 0 |
| 150 | Central Shroud | 7,030 | 0 | 0 |
| 151 | East Shroud | 5,313 | 0 | 0 |
| 152 | North Shroud | 6,589 | 0 | 0 |
| 153 | West Shroud | 127 | 0 | 0 |
| 154 | South Shroud | 3,860 | 0 | 0 |
| 155 | Gridania | 660 | 3 | 3 |
| 157 | The Mun-Tuy Cellars | 1,535 | 0 | 0 |
| 158 | The Tam-Tara Deepcroft | 1,265 | 0 | 0 |
| 159 | The Thousand Maws of Toto-Rak | 287 | 0 | 0 |
| 166 | Central Shroud | 10 | 0 | 0 |
| 170 | Central Thanalan | 7,128 | 87 | 14 |
| 171 | Eastern Thanalan | 11,181 | 0 | 0 |
| 172 | Western Thanalan | 9,931 | 866 | 25 |
| 173 | Northern Thanalan | 4,613 | 0 | 0 |
| 174 | Southern Thanalan | 6,643 | 0 | 0 |
| 175 | Ul'dah | 125 | 0 | 0 |
| 176 | Nanawa Mines | 1,808 | 0 | 0 |
| 178 | Copperbell Mines | 2,660 | 0 | 0 |
| 181 | Merchants Ward | 49 | 0 | 0 |
| 184 | Ul'dah | 59 | 0 | 0 |
| 190 | Mor Dhona | 10,150 | 0 | 0 |
| 193 | Rhotano Sea | 28 | 28 | 0 |
| 200 | Strait of Merlthor | 178 | 88 | 31 |
| 206 | Gridania | 675 | 0 | 0 |
| 209 | Ul'dah | 110 | 0 | 0 |
| 230 | Limsa Lominsa | 765 | 628 | 79 |
| 231 | Dzemael Darkhold | 3,825 | 21 | 22 |
| 232 | Maelstrom Command | 43 | 43 | 0 |
| 234 | Adders' Nest | 50 | 0 | 0 |
| 235 | Shposhae | 2,980 | 0 | 0 |
| 237 | Turtleback Island | 349 | 0 | 0 |
| 238 | Thornmarch | 115 | 0 | 0 |
| 239 | The Howling Eye | 186 | 0 | 0 |
| 240 | The Bowl of Embers | 157 | 0 | 0 |
| 244 | Inn Room | 41 | 12 | 0 |
| 245 | The Aurum Vale | 1,603 | 0 | 0 |
| 246 | Cutter's Cry | 2,611 | 0 | 0 |
| 257 | Rivenroad | 278 | 0 | 0 |

Names above come from recording headers. Zones sharing a place name (for
example 155/206 Gridania, 175/184/209 Ul'dah, 150/166 Central Shroud) remain
distinct; their shared place name does not establish interchangeable positions
or map transforms. Use `map_coordinates.py maps --zone <id>` for the zone's own
native pages or explicit world-only status. New zones 193 (`ocn0Battle02`) and
232 (`sea0Office01`) have no project recording and no map-registry claim beyond
their headers; do not borrow another zone's map based on name or region.
Zones 193/232 are small captures (28/43 nodes); they are point evidence only,
not a walkability or collision claim.

## Using this evidence

Check this source when the live recording does not cover a proposed placement.
Load a source independently, retain its exact XYZ, and record its path, hash
and node IDs in the authored placement's provenance. The existing Python API
accepts an explicit directory (with `tools` on the Python import path):

```python
from pathlib import Path
from mobspawns import map_coordinates

points = map_coordinates.recorded_points(
    128, Path("Data/quicknavmesh-evidence/quicknavmesh-20260924")
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

All 51 files passed the existing `recorded_points` parser: matching zone
headers, finite XYZ, unique node IDs and positive sample counts. Every captured
edge references nodes within its own file. Saved copies were checked against
the original bytes (SHA-256). Comparison uses exact parsed XYZ within the same
zone and unordered endpoint pairs for edges; it does not merge near-duplicate
points. These checks establish file integrity, not collision or in-game route
safety.
