# Dzemael Eye navigation implementation, 2026-09-26

The exact owned All-seeing Eye now queries a separate immutable recorded graph
before moving between its unchanged ordered waypoints. **132 of 680 directed
legs use recorded-graph support within reviewed segments; 548 retain an explicit
reviewed-waypoint fallback.** This is mixed navigation with limited graph
coverage. It is not full navmesh following or live floor/collision acceptance.

This implements the scoped follow-up to the September 19 navigation audit.
The five route JSON files, all waypoint XYZ, held Death March stops, sector
transfers, static placements and the authoritative **1.5 speed multiplier** remain
unchanged. Soulgazers and unrelated scripted routes retain their existing policy.

## Separate source and complete planning

The snapshot is
`Data/raidroutes/evidence/dzemael-eye-navigation-20260926/zone_231.tsv`, SHA-256
`0586bf768690d3a271752335cb657190487f6a3992e161587ee5a71bdf4d9184`:
3,826 nodes and 4,918 edges. The loader hashes the actual bytes it loads and
keeps the resulting graph immutable and separate from the mutable recorder.
It never merges this source with the original September 8 recording, SHA-256
`8d59e4f2fb9643abb6720d4416788eb054a2060fb122f66fcaf9e03d14a408ce`.
Node IDs remain local to their source.

The snapshot and all five accepted route files have explicit Git `-text`
attributes because runtime provenance uses exact byte hashes. The two frozen
production path reports are likewise byte-preserved. Their hashes and all route
hashes appear in the [machine-readable review](../Data/raidroutes/dzemael_eye_navigation_review_20260926.json).
Missing or changed inputs fail attachment; restoring the exact pinned snapshot
allows retry without caching an initialization failure. A successfully loaded
snapshot remains immutable for the process lifetime.

All bounded continuation queries finish before a path is installed. Cycles,
missing continuations, nonfinite coordinates, excessive point counts or sample
jumps and incomplete endpoints fail closed. A planner exception holds the actor
and permits a later retry. Exact spawn and sector-transfer heads advance through
the initial stop before planning the next leg, including held stops and reverse
traversal.

## Why complete graph paths still need review

Endpoint-only planning found 559 complete graph candidates and 121 incomplete
legs. Several complete candidates make large excursions between nearby stops:

| Route and directed leg | Complete candidate length | Direct reviewed length | Ratio |
| --- | ---: | ---: | ---: |
| Corridor `578→579` | 118.676 | 5.311 | 22.346 |
| Grand Hall `347→348` and reverse | 109.177 | 7.083 | 15.413 |
| Grand Hall `372→373` and reverse | 42.304 | 3.342 | 12.660 |

The first candidate also demonstrates that bounded repeated queries can reach
the final target while taking a substantial loop. Completing a query does not
prove an acceptable patrol path. These full candidate paths remain frozen in
`complete-graph-candidates.json`; `selected-paths.json` records every final plan.

The new authored safeguard requires every graph sample and the actor's current
position to remain within **0.1 horizontal / 0.25 vertical yalms** of the exact
reviewed segment. These values reuse existing stop tolerances, but using them
as path-deviation bounds is a **new reconstruction choice**, not recovered retail
clearance or a previously proven corridor width. The independent review also
checks connecting-segment midpoints.

| Route | Directed legs | Selected graph | Reviewed fallback |
| --- | ---: | ---: | ---: |
| Approach | 222 | 18 | 204 |
| Gullet | 58 | 10 | 48 |
| Grand Hall | 164 | 66 | 98 |
| Corridor | 212 | 34 | 178 |
| Batraal | 24 | 4 | 20 |
| Total | 680 | 132 | 548 |

Of the 548 fallbacks, 121 have incomplete graph paths and 427 reject a complete
graph excursion. Fallback permission applies only to the exact adjacent reviewed
segment while the actor is within its tolerance envelope. Unexpected displacement
holds rather than inventing a connector. Logs distinguish `recorded_graph`,
`reviewed_waypoint_fallback` and `held_no_approved_path`, include provenance, and
identify incomplete graph versus rejected-excursion reasons. Fallback segments
are not represented as captured edges or navmesh-confirmed movement.

The longest selected graph leg is 7.316 yalms (`Grand Hall 352→353`).
The largest selected graph length/direct ratio is 1.03539 (`Approach 94↔95`).
The longest selected path of either kind is 7.885 yalms (`Corridor 560↔561`).

Existing native door identities and `DzemaelTraversal.GateIsOpen` stage rules
remain authoritative. They expose anchors and predicates, not collision polygons.
This pass adds no invented door collider or ground triangle. The conservative
segment-preservation guard prevents the new graph planner from selecting the
observed cross-route excursions; it does not establish collision safety of the
previously reviewed segments themselves.

## Map evidence and verification

The shared coordinate workflow inventoried zone 231 and rendered its own native
pages 2900 and 2902 with the pinned recording. Both calibrated images and their
frame metadata are under `docs/maps/dzemael-eye-navigation-20260926/`. The path
overlays were read visually: yellow shows the unchanged reviewed segments, cyan
the selected graph support, and pink the rejected graph excursions. The map
page provides horizontal calibration, not floor membership or a collision mesh.

- [Map one path review](maps/dzemael-eye-navigation-20260926/page-2900-paths.png)
- [Map two path review](maps/dzemael-eye-navigation-20260926/page-2902-paths.png)

The isolated final runtime passed **2,778 focused navigation checks** and **5,283
full encounter checks**, plus the existing traversal and shared movement suites.
Focused checks install all 680 plans through the actual `PathFind` boundary;
they cover initial/transfer heads, reverse movement, complete-but-long detours,
partial continuation, malformed input, source mismatch, blocked retry and planner
exceptions. Final isolated runtime SHA-256:
`803FD1042C6F1C94C898DE1710536CDBB2DCF055D2A9F895D3D5F014F136E7F1`.
No standard Release deployment or live client acceptance is recorded for this pass.

Reproduce the production path report with the isolated encounter harness built
against the isolated runtime (its output directory contains the referenced
`Map Server.dll`):

```powershell
dotnet <isolated-encounter-harness.dll> --eye-navigation-only --eye-navigation-report .tmp/eye-paths.json
python -B tools/inspect_dzemael_eye_navigation_paths.py check
python -B tools/inspect_dzemael_eye_navigation_paths.py render
```

The independent check is deterministic and validates all pinned sources. Render
requires Pillow and the available native client tiles. Broader graph coverage,
actual client floor/collision behavior, native gate passage, stop/cast flow and
the user's speed impression remain live acceptance work.
