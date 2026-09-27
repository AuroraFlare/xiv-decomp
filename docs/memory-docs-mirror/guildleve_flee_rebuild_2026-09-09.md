# Guildleve fleeing: shared movement rebuild

The user reported slow, unnatural turns and asked for purposeful shortest
escape courses around obstacles, without replaying exploratory recording
walks. They also described an arrival pack close to the survivor, with the
survivor and additions linked together.

## What changed

- `GuildleveFirstSet` submits the complete escape polyline to the director.
  Server ticks advance it by distance and elapsed time. The old minimum
  half-second move plus Lua padding/settling at every waypoint no longer
  slows current-server after-battle chases according to recording density.
- Before movement starts, `GuildleveFleeRoute` selects the shortest forward
  subsequence of the supplied course under its corridor and height constraints.
  Skipping a waypoint requires samples at most one yalm apart to stay within
  four horizontal yalms and 0.75 elevation of that course. Existing object
  collisions and real polygon-navmesh raycasts veto blocked shortcuts when
  available. Required detours and elevation bends remain. Selected waypoints
  retain exact XYZ; the optimizer does not synthesize ground positions.
- Reviewed corner points can be marked `required = true`. The optimizer cannot
  skip those points. The frozen manifest stores their IDs in
  `required_route_nodes`, which the Lua generator preserves through the
  encounter builder and coordinate overlays into the director's route queue.
- The selected survivor owns movement through arrival; ordinary combat,
  ambient animation and roaming cannot replace its escape. The Lua stage
  waits for explicit arrival before spawning additions. A failed start or
  lost route fails the leve; cancellation cannot advance to a later wave
  or teleport the runner to an unvisited endpoint.
- The survivor joins the nearest linked party in the arriving wave before
  protection is released. Three actors therefore form a three-member party
  when that wave adds two linked enemies. Other waves/parties remain separate.
  Original spawn-group IDs remain intact for chest rules. Counts, objectives,
  rewards and HP thresholds are unchanged. A stage can opt out with
  `linkRunnerToReinforcements=false`, or the encounter with
  `afterBattleLinkRunnerToReinforcements=false`.
- Level-30/40 arrival waves choose the nearest unused authored ground slots
  to the route endpoint, preserving the survivor's occupied position. For
  **13024 Tracking the Pack**, the two additions are about **7.6 and 11.2
  yalms** from the survivor, instead of starting with the broadest-spaced
  slots in that area. Manual refinement can bring the pack closer where
  actual ground captures support it.

This changes the shared **after-battle survivor chase** used by regional leves
at multiple levels. Separate tagged-actor movement, patrols and escort
controllers keep their existing behavior. The prior segmented API remains
available for those callers and older test fixtures. Current playback needs
the rebuilt Map Server and matching Lua files; `!reloadguildleves` reloads
database markers only and does not install this engine.

## Reviewed route corrections

The [before/after gallery](maps/guildleve-flee-routes-20260909/index.html) covers
all **32 configured survivor chases, 40 escape legs**: 15 level-30/40 encounters
and 17 older encounters. The [low-level repair follow-up](guildleve_low_level_repairs_2026-09-09.md)
added five missing Skull Valley chases and the second Drybone retreat, using
frozen recorded terrain. Its [audit](guildleve_flee_route_audit_2026-09-09.json)
embeds the previous courses, selected new courses, exact XYZ, node IDs and
inferred edges. The previews execute the actual C# optimizer, rather than a
second implementation. They omit the live combat approach and runtime
collision vetoes, which can retain additional bends.

The frozen manifest also replaces source courses for **10904, 10924, 11684,
11704, 11724, 12524, 13024 and 13025**. Dijkstra search considers all
points in each leve's frozen evidence, captured edges and explicitly inferred
links of at most eight horizontal and three vertical yalms. This connects
nearby recordings without making every turn in a particular recorded walk
mandatory. The selected candidates were compared against calibrated native
map art. That initial course-only pass kept circles, spawn slots and escape
endpoints unchanged; the later Treespeak placement follow-up below supersedes
12524's old areas.
Position-overlay signatures and the generated Lua were refreshed for these
courses; no captured overlay was replaced. The first pass also shortened
12484, but the user's subsequent review restored its original course.

| Leve / escape leg | Previous course | Current preview | Waypoints before → after |
| --- | ---: | ---: | ---: |
| 10924 Mutton over Mongrels / 1 | 314.6 yalms | 219.2 yalms | 83 → 13 |
| 10924 Mutton over Mongrels / 2 | 164.0 yalms | 105.5 yalms | 44 → 8 |
| 13024 Tracking the Pack | 434.5 yalms | 333.2 yalms | 98 → 15 |
| 13025 Crabs in the Cellar | 434.4 yalms | 313.8 yalms | 96 → 27 |
| 12484 The Root of the Problem | 82.5 yalms | 82.5 yalms | 18 → 18 |

The [user's corner review](maps/guildleve-flee-routes-20260909/13025-user-review.png) identified four clipping risks on the 13025 preview:
the shoulder near the start, the northeast corner, the middle descending bend,
and the entrance to the western corridor. Seventeen existing recorded points
are now required, including node 287 reinserted into the middle bend. Nine more
points survive playback than in the previous 18-point preview, while the large
exploration loop remains removed. The original 18 points of 12484 are all
required, so its restored course cannot be shortened again. Yellow rings in
the gallery identify required points. This is a map review, not confirmation
of live collision; the recorded heights and endpoints are unchanged.
The audit's region pixels refer to the matching native 1432×846 image and its
`13025-1.after.frame.json`, with the dungeon's own calibrated transform.

This is the shortest supported course under the available graph/corridor
constraints, not a claim of a globally optimal route through a complete
terrain mesh. Recorded points and map art do not prove intervening collision.
The original adjacent course edges remain the fallback when a shortcut is
vetoed. New inferred edges and runtime string-pulling still need live checks,
especially Cassiopeia's shore crossings and narrow dungeon passages. Broken
Water's sparse frozen coverage retains a broad bend. Nanawa's two chases now use
[nearby retreats along the new recorded trails](guildleve_nanawa_authored_2026-09-09.md).
Their intermediate connections remain inferred. A runner's connection
from wherever combat leaves it to the authored course also needs live testing.

The current `!glbuild edit <id>` editor can move existing waypoint and spawn
locations (`!glbuild locations flee`, `!glbuild locations routes`, and
`!glbuild position <index-or-id>`). It **cannot replace a 98-point route with
an arbitrary-length new route**. A route-capture/editor extension is still
needed for that convenient workflow; do not replace an implemented numeric
leve with a fresh `!glbuild start` export and lose its encounter mechanics.

The later Nanawa and Treespeak placement follow-ups bring the current runtime inventory to **2,732 locations**, all at exact recorded movement XYZ. Verification counts below describe the original fleeing pass.

Treespeak's **12524 — Do Toads Dream** now uses three areas on newly captured
ground, with centers 171–345 yalms from camp. Its two consecutive escape legs
share only the middle endpoint. Each captured course is about 121 yalms;
production simplification yields 107.23 and 119.27 yalms with required corridor
bends retained. The new route audit retains the earlier layout under
`previous_placement`. See the [Treespeak follow-up](guildleve_individual_placements_2026-09-09.md#treespeak-recording-follow-up)
for source hashes, exact nodes and validation. Live collision/playthrough
testing remains.

## Verification

- Production route tests: removal of overshoot loops and jitter, obstacle
  detours, separate floors, preserved XYZ/endpoints, collision vetoes,
  sampling-density independent travel time, variable ticks and exact arrival.
- Lua encounter tests: all 48 level-30 and 54 level-40 encounters, plus explicit
  asynchronous arrival, cancellation, lost-runner and rejected-start cases.
- Compiled director tests: survivor transfer into an actual three-member
  MonsterParty, isolation, chest-group preservation and movement ownership;
  actual MoonSharp route submission, exact endpoint arrival, speed restoration
  and cancellation without a destination teleport. An actual object collision
  retains a required bend; removing it permits the same route to shorten.
- Position overlays: 102 encounters, **2,662 spatial leaves**, of which
  **2,546** match exact frozen recorded XYZ. The reduction from 2,888 comes
  from fewer route samples; counts, spawn slots and destinations are preserved.
- 25 frozen-placement/provenance regressions and 18 map-calibration tests.
- Required bends tested through the actual Lua handoff and compiled director;
  restored-route equality, four-corner coverage and duplicate required points
  are covered by regression tests.
- Build succeeded with existing dependency/Blowfish warnings and no errors.

Build output: `.codex-build/guildleve-flee/Map Server.dll`. No live server
restart, database import or recording overwrite was performed. Client
animation, packet continuity and live terrain still require in-game testing.

```powershell
dotnet run --project tools/guildleve-flee-tests/GuildleveFleeTests.csproj
dotnet run --project tools/regional-guildleve-tests/RegionalGuildleveTests.csproj -- '.codex-build/guildleve-flee/Map Server.dll'
python -B tools/validate_guildleves_level30.py
powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate_guildleves_level40.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate_regional_guildleve_positions.ps1
```

To review future changes, collect into a new file with
`python -B tools/mobspawns/flee_routes.py collect .tmp/new-flee-courses.json`.
Add `--reroute` only to draft alternative connections from frozen ground;
courses with required bends are retained.
Run `dotnet run --project tools/guildleve-flee-tests/GuildleveFleeTests.csproj -- --review .tmp/new-flee-courses.json .tmp/new-flee-audit.json`,
then `python -B tools/mobspawns/flee_routes.py render .tmp/new-flee-audit.json .tmp/new-flee-maps`.
Collection/rendering do not install changes. Preserve the historical before
coordinates in the saved audit rather than replacing it with a new baseline.
