# Darkhold native Eye navigation, 2026-09-26

The Eye now uses the dungeon's native navigation mesh for 372 of its 680 directed
patrol legs. Another 208 select exact edges in the original frozen walking
recording; 100 keep the reviewed ordered waypoint fallback. This is an offline
implementation and movement audit. Client wall, floor, gate, smoothness and cast
acceptance remain open.

## Sources and reconstruction policy

`Data/navmesh/roc0Dungeon01.nav` is the zone-231 XIVNAV asset, SHA-256
`cfbfd06044f4127ecc53644d165f74c01ef283f5db94516316e0e3187c0ae459`.
The supplied pack manifest identifies Final Fantasy XIV 1.23b, native layout
resource `0x28D90006`, and builder `BahamutXIV/bahamut-navmesh` at commit
`a3e1d5bf8d75beb4669eea37fe127ddd9cf53290`. The mesh has 252 tiles and 6,697
polygons. The exact source manifest hash, target, geometry-manifest hash and zone
binding are retained in the pinned `ledger.json`; checking it does not require
the original temporary extraction directory. The earlier absence of a SharpNav
file did not establish absence of this separately supported XIVNAV asset.

The ledger contains 388 candidates with measured endpoint polygon heights and
path samples. Sixteen fail runtime's stricter exact-X/Z interior support check,
so 372 are usable. Their rejection records are pinned separately. Opening every
stage gate produces the same selected paths in the production regression;
closed-door screening is not what rejects those sixteen candidates.

Endpoint attachment permits a unique native floor within one yalm of unchanged
recorded XYZ, at the same X/Z. This is a new authored policy, not a recovered
retail clearance or a mesh error bound. The numerical X/Z tolerance is 0.0001;
adjacent polygon heights within 0.05 are treated as one floor, while competing
floors outside that tolerance in the window fail closed. Every installed native
interior sample receives polygon Y at its own X/Z. Movement still interpolates
between those samples, and explicitly attaches vertically back to the original
endpoint. No neighboring recording's Y is transplanted onto native X/Z.

The original recording is
`Data/raidroutes/evidence/dzemael-20260908/zone_231.tsv`, SHA-256
`8d59e4f2fb9643abb6720d4416788eb054a2060fb122f66fcaf9e03d14a408ce`.
The separate newer snapshot is
`Data/raidroutes/evidence/dzemael-eye-navigation-20260926/zone_231.tsv`, SHA-256
`0586bf768690d3a271752335cb657190487f6a3992e161587ee5a71bdf4d9184`.
Their source-local node IDs, edges and XYZ are never merged. A source cross-check
finds 440 exact original edges among the 680 legs, including all 132 legs that
the older newer-graph-only planner selected. Therefore the newer provider adds
zero selected legs once original-edge support is available.

## Runtime behavior

Each leg selects one complete provider before movement. Failed native candidates
fall through to the independent recorded sources; a failed mid-leg replan retains
its provider and holds, rather than splicing in another source. Rejoining a native
path requires proximity to its approved polyline and native support; arbitrary
off-route connectors are not generated. Both required recordings and route bytes
must validate before Eye attachment. A missing or changed optional native mesh or
ledger disables native support until process restart. Loaded sources and prepared
paths are immutable process snapshots; rejected prepared legs are cached. The
existing retry behavior for required recordings remains separate.

The native mesh is content-owned, with all mutable Detour queries serialized.
Its exact-byte loader hashes the same bytes it loads. Stage gate state is read
before the native query gate. The authored door-anchor proximity screen reuses
the existing three-yalm horizontal and eight-yalm vertical observation windows;
it is not a dynamic door collider. The source's door/off-mesh annotation sections
do not recover such a collider.

The first candidate passed its planned-segment ray checks but failed 22 actual
movement assertions because `FollowChasePath` combines short samples into a
published chord. The correction validates the actual native movement chord and
retains the furthest safe consumed corner when necessary. The remaining path
continues on the next normal tick. Other callers retain their existing defaults.
Arrival uses the movement routine's 0.001 three-dimensional numerical threshold,
so the original endpoint is applied before a held cast begins.

Resolved paths carry copied points and an immutable, provider-specific movement
validator. Controller lifecycle changes invalidate outstanding calculations.
Result installation and provider-pin commitment share a short controller gate;
expensive resolution happens outside it. Cancelled, paused, restarted or replaced
work cannot clear/install a newer path, alter its safety callback, or reset its
committed provider. Clearing the path clears its callback.

All five route files, all 175 accepted static homes, sector transfers, authored
cast waits and the configured 1.5 speed multiplier remain unchanged. Native path
lengths and safe corner handling can change elapsed traversal time; this does
not establish the exact retail lap cadence or remove the need for client review.

## Coverage and reproduction

| Route | Native | Original edge | Reviewed fallback | Total |
| --- | ---: | ---: | ---: | ---: |
| Approach | 136 | 72 | 14 | 222 |
| Gullet | 32 | 21 | 5 | 58 |
| Grand Hall | 89 | 65 | 10 | 164 |
| Corridor | 95 | 48 | 69 | 212 |
| Batraal | 20 | 2 | 2 | 24 |
| Total | 372 | 208 | 100 | 680 |

The production focused suite passes **5,520 checks**. It exercises actual
Resolve → controller → PathFind → Actor.PostUpdate movement for every directed
leg, including **18,796 tested movement ticks** in the pinned report. These are
loop attempts, not a claim that each iteration published a movement packet.
Checks cover unsafe chords, original endpoint arrival, held stops, native-interior
resumption, source failure, provider pinning, all-open versus closed gate state,
and synchronous/concurrent stale resolver completion. The tested isolated DLL
SHA-256 is `E2EDD480D771C09A37AF1F7CAAA3B9CF4FE21B7AF8E232522B83690EE798486F`.
Combined encounter/shared-regression results are recorded in
`docs/dzemael_implementation_gaps_2026-09-25.md`.

```powershell
dotnet <isolated-encounter-harness.dll> --eye-navigation-only --eye-navigation-report <report.json>
py -3.11 -B tools/inspect_dzemael_native_eye_navigation.py check
py -3.11 -B tools/inspect_dzemael_native_eye_navigation.py render
```

The Python tool checks pinned evidence and route equality independently of the
runtime harness. `build` regenerates the review from already pinned, inspected
inputs; it does not create new placements or silently accept changed inputs.
Raw hashes for the ledger, selected paths and rejection report are in the tool
and review, with `-text` Git attributes preserving their bytes.

## Map review and live acceptance

The shared workflow was rerun with `maps --zone 231`. Rendering uses the zone's
own native pages 2900 and 2902 and the original frozen recording. Batraal's route
uses page 2902; the four earlier route sectors use page 2900, retaining existing
content assignments. Page selection and the broad recorded-point height filter
do not infer floor membership. Both native-client render outputs were inspected.

- [Map one paths](maps/dzemael-native-eye-navigation-20260926/page-2900-paths.png)
- [Map two paths](maps/dzemael-native-eye-navigation-20260926/page-2902-paths.png)

Each base PNG has a `.frame.json` carrying native tile provenance, map calibration,
world crop, original-recording hash and pixel transform. Overlays use the same
plot pixels and append a separate legend below the base image. Solid cyan paths
are native; cyan dots are original recorded samples. The artwork is not collision
or live floor proof. The historical graph-only renders remain unchanged.

No server deployment or restart was performed for this pass. Use the September
26 section of `docs/dzemael_client_verification_2026-09-15.md` after deployment,
recording the actual DLL hash. Observe endpoint height transitions, tight bends,
gates, cast arrival/resumption and all sector transfers before claiming client
acceptance.
