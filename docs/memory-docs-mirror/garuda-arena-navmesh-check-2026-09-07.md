# Garuda: recorded-route and spawn check, 2026-09-07

## Scope and decisive limitation

The user provided `Data/quicknavmesh/zone_239.tsv` and captured boss/player starts
for **both Normal and Hard**. The user then explicitly clarified that the outer
recorded loop was walked **inside the arena, not against its wall/perimeter**.

Accordingly this report does **not** identify the physical arena boundary or
replace `CENTER=(1492,302,-245)` / `ARENA_RADIUS=45`. A route's fitted center is
not evidence that the real arena is centered there. No navmesh or production
file was edited by this analysis.

The useful immediate result is that both captured start positions agree very
closely with recorded ground paths in the same connected component.

## What this file actually stores

[QuickNavmeshUtils.cs](../Map%20Server/Utils/QuickNavmeshUtils.cs) defines the
format and recorder behavior:

- `n <id> <x> <y> <z> <sample_count>` records a player-position sample, possibly
  averaged with nearby samples. The final column is **not a terrain or boundary
  classification**.
- `e <id_a> <id_b>` is an undirected recorded movement adjacency. These are not
  polygon edges surrounding a walkable surface.
- The recorder merges nodes within 1.25 horizontal units / 1.25 height units,
  and accepts recorded edges using distance, height-delta and movement-speed
  plausibility checks. It does not thereby establish collision-triangle coverage.
- The server's default 12-unit graph attachment radius and 3-unit height tolerance
  are path attachment heuristics, not proof of ground at every attached point.

The inspected source contains **105 nodes**, **117 edges**, and **135 accumulated
samples**. Components are nodes 7–105 (99 nodes), nodes 1–5 (five nodes), and
isolated node 6. The disconnected records include heights around 299–304;
they are excluded from the seed for the main route fit. Disconnection alone
does not prove that terrain is inaccessible or that a recorded point is invalid.

Source SHA-256:
`90202dbf09b04137f59325d919df46a705fbbe71b31702b088c307f033491a72`.

## Captured starts versus recorded ground

Coordinates are the user-supplied capture transcription from this task, not
values recovered from the 2012 videos. Distances below are world-coordinate
units. Each nearest-edge height is a linear interpolation of recorded endpoints,
not a native collision raycast.

| Start shared by Normal/Hard | User-supplied X, Y, Z, rotation | Nearest recorded node | Horizontal distance to node | Closest recorded edge / horizontal distance | Captured Y minus interpolated edge Y |
|---|---|---|---:|---|---:|
| Garuda | `1524.131, 301.768, -252.296, -1.552` | 65: `1524.0977, 301.7671, -252.04774` | 0.25048 | 64–65 / **0.00858** | **+0.00117** |
| Players | `1492.302, 302.113, -259.210, 1.601` | 74: `1492.3495, 302.12183, -259.21173` | 0.04753 | 74–75 / **0.00028** | **−0.00827** |

Interpolated recorded Y is 301.76683 for Garuda and 302.12127 for players. This
strongly supports ground/path plausibility for the supplied starts. It does not
prove encounter role, original retail placement, orientation semantics or
collision clearance; those are separate evidence. Captured rotations are
preserved verbatim, not inferred from the graph.

## Describing the walked loop without calling it the wall

The near-circular recorded route can be characterized reproducibly. The analysis
first selects the largest component and uses its two-core hull to generate
candidate circles, excluding entry tails from the seed. It then fits radial
consensus samples, rather than treating dense interior wandering as a boundary.

| Property of the recorded route only | Result |
|---|---:|
| Fitted route center X, Z | `1503.99407, -255.99174` |
| Fitted route radius | `20.39891` |
| Selected samples | 46 |
| Radial root-mean-square residual | 0.09110 |
| Angular coverage | All twelve 30-degree sectors; largest gap 15.78 degrees |
| Fitted radius under 0.3–1.0 consensus tolerance | 20.38422–20.41374 |
| Equal-angle representative fit | Center `1504.01273, -256.02155`; radius `20.39897` |
| Recorded loop X extent | 1483.62990–1524.42130 (40.79140 span) |
| Recorded loop Z extent | −276.46512–−235.55925 (40.90587 span) |
| Recorded loop Y range / median | 301.76358–302.16565 / 302.01926 |

This establishes the *sampled walked extent*, a lower bound on how far the
usable area reaches at those samples. It does not establish a 20.4-unit arena,
guarantee the whole enclosed disk is walkable, locate unrecorded walls, or exclude
rocks/holes/obstructions within the loop.

The existing script center is 16.26887 units from the fitted **route** center.
All recorded nodes remain within the existing 45-unit script circle: the largest
observed radius from the script center is 36.65070. The complete fitted route
circle also fits within that script circle with approximately 8.33 units of
remaining margin. These are geometric comparisons only; they neither validate
nor falsify the original arena center/radius.

Likewise, generated boss/helper/tower positions outside this interior route
must not be labelled off-mesh solely for that reason. The JSON records such
comparisons for inspection but intentionally provides no physical walkability
verdict. Wind collision radii, annuli and VFX geometry require their own command,
native geometry and gameplay evidence.

## Artifacts and verification

- [Comparison diagram, PNG](../outputs/garuda-arena-navmesh-check-20260907/recorded-route-comparison.png)
  and [editable SVG](../outputs/garuda-arena-navmesh-check-20260907/recorded-route-comparison.svg).
  Both explicitly label the loop as an interior walk, not the terrain boundary.
- [Machine-readable analysis](../outputs/garuda-arena-navmesh-check-20260907/analysis.json):
  node IDs, graph components, fitting sensitivity, sampled heights and exact
  spawn-to-edge calculations.
- [Reproduction instructions](../tools/garuda-arena-navmesh-check/README.md) and
  synthetic tests cover known-circle recovery, dense-interior bias, straight-trace
  rejection, graph-tail pruning and height interpolation.

The PNG was visually checked for label clipping and for the crucial provenance
warning. The navmesh source hash is recorded so subsequent user recordings can
be analyzed without silently mixing datasets.

## Native boundary follow-up

**No authoritative native floor/wall boundary was recovered by this bounded
follow-up.** The existing zone and Garuda resource findings were checked for an
exact resource join; no full-client scan or production geometry change was made.

The concrete join already established in
[the client/battlefield decomp](garuda-moogle-coffer-animation-decomp-2026-08-02/GARUDA_CLIENT_AND_BATTLEFIELD_FINDINGS.md)
is a **weather/environment** join, not a floor/collision join:

- Native weather 8028, token `wtr_smmn`, maps to resource key `0x28D90015`:
  `client/data/28/D9/00/15.DAT`, a `MapLayoutResourceData 1.1.0` layout.
- That layout is 87,024 bytes, with SHA-256
  `db13649451a75054235319e93bc9bfd3c236eb776bdd45c6df12e96e49e2a383`.
  Its 209 node pointers and 30 active dependency records describe the known
  wind, lighting/sky/fog timelines, ambience, summon VFX and camera binding.
- Textual FileSet `client/data/28/DD/00/14.DAT` names the Garuda sound and
  `vfx_smn01` packages. The documented dependencies include environment textures,
  wind MTB files, sound containers and VFX models; they do not establish a
  transformed arena-floor collision mesh.
- Ordinary `roc_r0_fld02` weather 202 instead maps to `0x28D90002`. Neither a
  weather selector nor a VFX model's dimensions identifies the walkable wall.
- Zone239/`roc0Field02a` and the current `(1492,302,-245)` / radius45 remain
  known **server configuration**, not newly recovered native boundary evidence.

A defensible physical boundary still requires a verified zone239/`roc0Field02a`
join to the actual background scene and native floor/collision resources, their
world placement transforms, and a ground/wall boundary extraction. A whole-scene
bounding box may include scenery or other subareas and would not by itself
supply that result. Until that missing join and geometry are recovered, retain
the current arena geometry as unverified rather than replacing it with the
user's interior route or the atmospheric layout.
