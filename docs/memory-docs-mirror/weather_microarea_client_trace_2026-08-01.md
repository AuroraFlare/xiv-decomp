# 1.23 Weather and Micro-Area Source Trace

## Result

The September 2012 `ffxivgame.exe` does not contain an authoritative spatial
boundary table for weather micro-areas or the zone-name line. The client accepts
both values from the server:

- Weather packet `0x000D` contains a weather ID and transition byte only.
- Lua `_getZoneName` returns an `AreaBase` string populated through the area
  actor's server-supplied script-bind parameters.

The client does contain exact place-name IDs, aetheryte classifications, and
map-label anchors. Those can reconstruct a deterministic nearest-anchor
partition, but they cannot recover retail polygons that are absent from the
client.

## Native evidence

The analyzed executable is the installed 1.23 client dated 2012-09-20. Relevant
functions in the IDA export are:

| Address | Function | Observation |
|---|---|---|
| `0x004DC690` | packet dispatcher | Opcode `0x000D` dispatches an actor message to the current player. No area or coordinate field is decoded. |
| `0x0059CED0`, case `13` at `0x0059CF79` | Player weather packet reader | Extracts one `ushort` weather ID and one **unsigned** transition byte; stages them at player controller offsets `+0xB0/+0xB4`. |
| `0x006F3210` | `AreaBase` constructor | Constructs the string member at object offset `+0x64`. |
| `0x006F9700` | `_getZoneName` native binding | Returns the string at `AreaBase + 0x64`; it performs no coordinate lookup. |
| `0x00749B90` | `AreaBase` Lua registration | Registers `_getZoneName` as a getter and exposes no spatial resolver. |

The server's `Area.CreateScriptBindPacket` and `Zone.CreateScriptBindPacket`
pass `ZoneName` in the corresponding Lua parameter list. The server's
`SetWeatherPacket` likewise serializes only the weather ID and transition.

Correction verified against the installed executable on 2026-09-06:
`0x006E5FD0` is a music-related Lua bridge, not this weather packet reader.
The actual weather path applies the staged duration through `0x0059E1F0`,
world message `114`, and `WeatherManager +0x148`. The server serializes a
16-bit transition but the client consumes only its low unsigned byte.
See [the weather transition audit](weather_transition_audit_2026-09-06.md)
for timing, duplicate-resource behavior, and the separate spatial DrawEnv fade.

`MapLayoutResourceData` contains visual layout resources and culling AABBs. Raw
values equal to place IDs `2021` and `2022` occur inside East Shroud layout data,
but their records reference `attr_f0f0_jus1_*` geometry/material objects. There
is no code or resource link connecting those values to named-area ownership, so
they are not evidence of Nine Ivies or Larkscall polygons.

## Recoverable atlas

`tools/extract_microarea_atlas.py` joins four independent sources:

1. `aetheryte.csv`: actor ID, exact place-name ID, parent/child role, and client
   location type.
2. `xtx_placeName.csv`: exact localized English place names.
3. `aetheryte_2Dmap.csv` plus `mapNavi_data.csv`: map-label record and label
   center.
4. `server_eventnpc_spawn_locations.sql`: precise world-space actor position and
   zone assignment.

Client location type `6` identifies ordinary field camps and aetherial gates.
The join yields 79 operational field anchors. Type `7` identifies seamless
dungeon entrances, so the following actors are intentionally excluded from
weather-anchor ownership:

- `1280018` Mistbeard Cove
- `1280020` Cassiopeia Hollow
- `1280052` Nanawa Mines
- `1280054` Copperbell Mines
- `1280082` The Mun-Tuy Cellars
- `1280083` The Tam-Tara Deepcroft

Those names are resolved by the existing seamless zone-transition bounds.

Run the extractor and cross-repository validator from the repository root:

```powershell
python tools/extract_microarea_atlas.py `
  --windower-source '..\Launcher Windower\New\FFXIV Windower\AreaNameTracker.cs'
```

The generated atlas contains:

- `microarea_anchors.csv`: all 79 type-6 field anchors, exact names, server
  positions, and matching client map-label positions.
- `map_place_labels.csv`: all 126 named/placeholder map records on those field
  maps, including explicit `unplaced` and `placeholder` status.
- `anchor_pair_bisectors.csv`: 118 analytic equal-distance lines used to audit
  the reconstructed partition.
- `active_anchor_handoffs.csv`: every feasible Voronoi neighbor edge. The
  extractor finds a point in the edge interior and verifies that a small step
  to either side resolves to the expected anchor using the full zone set. This
  extraction contains 102 active edges.

## Boundary rule

Within a server zone, ownership is the anchor with minimum squared X/Z
distance. Equal distances are resolved by priority and then actor ID. There is
no previous-area retention band, so a coordinate produces the same result in
both travel directions.

For anchor A `(ax, az)` and B `(bx, bz)`, A owns a point when:

```text
2 * (bx - ax) * x + 2 * (bz - az) * z
    <= bx^2 + bz^2 - ax^2 - az^2
```

For Camp Nine Ivies `(1702, -862)` and Larkscall `(2297, -703)`, the candidate
handoff line is:

```text
1190*x + 318*z = 2130570
```

At `z=-554`, `(1938, -554)` belongs to Camp Nine Ivies and `(1939, -554)`
belongs to Larkscall.

## Limitation

The generated cells are a reconstruction, not recovered retail polygons. Exact
retail boundaries would require an authoritative legacy server implementation,
server-side scripts/data not shipped with the client, or systematic retail-era
position/name observations. The atlas makes that limitation explicit and keeps
all recoverable client facts separate from the derived ownership model.
