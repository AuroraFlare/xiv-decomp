# Dzemael Eye movement and navigation audit, 2026-09-19

The user reported that the All-seeing Eye moves too fast and requested actual
navigation following. Its previous configuration uses twice configured player
run speed. The proposed 1.5 multiplier is a 25% reduction: with `DEFAULT_RUN=5`,
the Eye changes from `10 × player_speed_multiplier` to
`7.5 × player_speed_multiplier` (12 to 9 if that setting is 1.2). This is an
authored response to that feedback, not recovered retail speed.

## Existing path behavior

All five active Eye route files use `recordedWaypoints`. That mode sets both
`IgnoreNav` and `RecordedNav`, then interpolates each ordered waypoint segment
through `RecordedRouteSegment.Build`. It does not query a navmesh. All 345
waypoints use exact positions from the frozen September 8 recording, but their
ordering includes reconstructed links that are not captured graph edges.
The separate held Death March stops, route sector changes and waypoint XYZ must
remain intact when changing movement policy.

Changing only the JSON mode to `navmeshRequired` is insufficient: the existing
controller calls `PreparePath` with its default `allowDirectFallback=true`.
Furthermore, `PathFind` enables quick-nav only for public areas. Private Darkhold
would therefore need an explicit navigation policy that cannot silently fall
back to a raw direct segment. No zone-231 SharpNav mesh was found in the supplied
`Map Server/navmesh` directory; the only `.snb` there is `wil0Field01.snb`.

## Production graph audit

[The machine-readable report](dzemael_eye_navigation_2026-09-19.json) contains
source hashes and every failed or partial leg's keys and exact XYZ. It calls
the production `QuickNavmeshUtils.GetPath`, including both directions of each
ping-pong route, using each route's step size, 128-point limit and arrival
tolerances. It checks returned endpoints, then retries partial paths up to a
bounded limit, rejecting cycles or missing continuations.

The mutable recording was read without edits at SHA-256
`7d5cea696f4916a382ba569f96d8bdad947793629a76aecea7674110b71b029b`.
This snapshot contains 3,794 nodes and 4,816 edges. It is separately identified
from the frozen September 8 source
`8d59e4f2fb9643abb6720d4416788eb054a2060fb122f66fcaf9e03d14a408ce`
(1,409 nodes and 799 edges); no mutable samples were merged into that source.

| Route | Directed legs | Complete first query | Missing | Partial |
| --- | ---: | ---: | ---: | ---: |
| Approach | 222 | 222 | 0 | 0 |
| Gullet | 58 | 52 | 6 | 0 |
| Grand Hall | 164 | 142 | 20 | 2 |
| Corridor | 212 | 122 | 88 | 2 |
| Batraal | 24 | 18 | 6 | 0 |

Grand Hall `347↔348` and Corridor `578→579` reach the original target on their
second query. Corridor `579→578` returns a partial path whose continuation is
unrouteable; a nonnull initial result is therefore not proof of route completion.
The production quick-nav densifier clamps step size to at least 0.5, despite
these JSON files requesting 0.15. Partial paths are kept separate from complete
ones in the report.

The quick-nav graph includes recorded walking edges and bounded endpoint
attachments; it is not a collision mesh. Neither these queries nor exact
recorded waypoint coordinates demonstrate live client collision, rendering,
retail patrol geometry or numeric retail speed. Strict graph-only movement
would stall in several sectors with this recording. A mixed policy must name
and retain any reviewed authored segment as a fallback explicitly, rather than
describe it as a captured edge or navmesh-confirmed path.

## Reproduce

Run from the repository root, pointing at an isolated build:

```powershell
dotnet run --project tools/dzemael-eye-navigation-audit/DzemaelEyeNavigationAudit.csproj -c Release -- '.codex-build/dzemael-director-retention-review-20260919/Map Server.dll' '.tmp/dzemael-eye-navigation-audit.json'
```

The audit rejects a recording or route that changes during the run. Its only
data-file write is the requested report. New recording content may legitimately
produce different counts, so compare the graph hash before comparing results.
