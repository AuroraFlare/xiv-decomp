# Scripted actor routes

`ScriptedActorRouteController` is the reusable JSON-backed path-and-stop runtime
for server NPCs and enemies. It deliberately does not inherit escort behavior.
A caller supplies an existing `Npc` or `BattleNpc`, a route key, and
encounter-specific callbacks; the JSON supplies movement/timing data and the
controller supplies movement ownership.

## Responsibilities

The route controller owns:

- navmesh path creation through the actor's existing `PathFind`;
- ordered stop selection;
- arrival distance and vertical-tolerance checks;
- timed waits and explicit holds;
- once, loop, and ping-pong traversal;
- pause, resume, jump-to-stop, cancellation, and blocked-path retries;
- safe stop/departure/completion callbacks;
- movement arbitration with `BattleNpcController`.

It does not own:

- spawning the routed actor or encounter mobs;
- party/escort leashes or quest failure;
- aggro, invulnerability, damage, or target selection;
- which dungeon-progress event selects a route;
- the skill, scene, animation, or message executed at a stop.

Those rules remain with the encounter manager. This separation prevents an NM
patrol from accidentally acquiring caravan ambush, escort-failure, map-marker,
or reward behavior.

## Files

- `Map Server/Actors/Chara/Ai/Helpers/ScriptedRouteModel.cs` contains the pure
  stop model, options, traversal enums, and tested route cursor.
- `Map Server/Actors/Chara/Ai/Helpers/ScriptedActorRouteController.cs` adapts
  the cursor to `Character.aiContainer.pathFind`.
- `Map Server/DataObjects/ScriptedActorRouteDefinition.cs` validates and
  converts the JSON-facing route schema.
- `Map Server/Utils/ScriptedActorRouteLoader.cs` safely loads matching files
  from `Data/actorroutes` and rejects unknown JSON fields.
- `Map Server/Actors/Chara/Character.cs` exposes configuration, diagnostics,
  and cleanup methods.
- `Npc.Update` and `BattleNpc.Update` advance an attached route before their
  normal AI update, allowing that same tick to follow a newly prepared path.

## Stop lifecycle

Each `ScriptedRouteStop` has a stable key, position, arrival radius, minimum
wait, optional explicit hold, and optional final facing rotation.

The lifecycle is:

~~~text
Moving
  -> actor reaches arrival radius
  -> Waiting or Held
  -> StopReached callback
  -> minimum wait elapses
  -> explicit ReleaseCurrentStop if held
  -> StopDeparted callback
  -> next Moving target
  -> Completed, loop wrap, or ping-pong reversal
~~~

`StopWaiting` runs on later waiting/held updates, before the cursor tries to
advance. It does not manufacture a second arrival and does not run while the
route is suspended, cancelled or complete. An encounter can use it to retry a
held action whose first dispatch failed because the actor was busy. The caller
still owns once-only dispatch and release; ordinary routes without a subscriber
retain their existing wait behavior.

An explicit hold and a timed wait are cumulative. Releasing a cast stop early
does not bypass its minimum wait; a wait expiring does not bypass an unreleased
hold. This supports asynchronous scenes and skills without turning timing into
a polling race.

## Navigation modes

- `NavmeshRequired` is the safe default. If no path is available, the actor
  remains stopped under scripted movement ownership and retries after the
  configured delay.
- `NavmeshThenDirect` tries the navmesh first and then explicitly falls back to
  one direct segment. Use only where collision and floor continuity are known.
- `Direct` is an authored straight-line route and does not query the navmesh.
- `RecordedWaypoints` (`recordedWaypoints` in JSON) follows dense reviewed ground
  samples with small interpolated 3-D steps, preserving recorded Y in private
  instances. Adjacent samples must be within eight yalms (including loop wrap),
  with arrivalDistance at most 0.5. A distant live start/relocation fails closed.
  This mode retains the normal object-collision and movement-step checks.
  It requires external capture provenance; valid JSON alone is not walkability evidence.

Prepared paths carry `PathFindFlags.Scripted`. `BattleNpcController` gives that
flag priority over ordinary roam/chase movement even when the actor's ordinary
`Roams` modifier is disabled. While waiting, the controller keeps an empty
scripted ownership marker so normal AI cannot make the actor wander away from
its stop. Hostile route actors suppress proximity detection while actively
moving and can detect normally at a stop.

By default, an engaged `BattleNpc` temporarily yields movement ownership to
combat AI. Timed waits are suspended for the same interval; when combat ends,
the route replans from the actor's live position or resumes the remaining wait.
Set `PauseWhileEngaged` to false only for a route hazard that must continue its
director-owned path during combat.

## JSON format

Routes use the same data-first approach as the escort route builder, but live in
their own `Data/actorroutes` directory because they do not carry caravan actors,
leashes, rewards, or encounter-spawn tables.

~~~json
{
  "version": 1,
  "routeKey": "example_patrol",
  "zoneId": 231,
  "traversal": "pingPong",
  "navigationMode": "navmeshRequired",
  "pauseWhileEngaged": false,
  "startStopKey": "hall_entry",
  "evidence": "Describe the capture, video timestamp, or reconstruction here.",
  "waypoints": [
    {
      "key": "hall_entry",
      "x": 10.0,
      "y": 2.0,
      "z": 30.0
    },
    {
      "key": "special_cast",
      "x": 24.0,
      "y": 2.0,
      "z": 42.0,
      "waitSeconds": 2.0,
      "holdUntilReleased": true,
      "facingRotation": 1.5,
      "actionKey": "example_action"
    }
  ]
}
~~~

The complete inert schema example is
`Data/actorroutes/_example_patrol.json`. Its zone is deliberately `0`, which
the runtime rejects, so it cannot be attached accidentally.

The loader requires explicit `version`, `routeKey`, `zoneId`, `traversal`,
`navigationMode`, and `waypoints` properties and rejects unknown properties.
Route files are capped at 1 MiB/4,096 waypoints; authored waits are capped at
one day and repath delays at five minutes.

## Loading and actions

~~~csharp
if (!mob.TryConfigureScriptedActorRouteFromJson(
    "example_patrol",
    out ScriptedActorRouteController route,
    out string error))
{
    Program.Log.Warn("Route unavailable: {0}", error);
    return;
}

route.StopReached += (controller, stop, index) =>
{
    if (stop.ActionKey == "example_action")
    {
        // Start the encounter-owned skill, scene, spawn, or door transition.
        // If this stop is explicitly held, release it from the corresponding
        // encounter completion callback.
    }
};

route.Start(Program.Tick);
// Later: route.ReleaseCurrentStop(Program.Tick);
~~~

Subscribe before `Start`: if the actor is already inside the first stop's
arrival radius, `Start` can deliver that arrival immediately.

## Darkhold usage

All-seeing Eye and Soulgazer are the first intended consumers. Their future
configuration should:

1. publish exactly one actor of each identity;
2. select a sector route from dungeon progress;
3. use `NavmeshRequired` and a loop or progress-directed jump;
4. set `PauseWhileEngaged = false` because the actors are passive hazards;
5. hold at evidence-backed cast stops;
6. execute Death March `23379` or Death Throes `23380` from `StopReached`;
7. release after the action completes and any proven pause expires;
8. pause naturally while the west terminal's movement-preventing status is
   active, without replacing its route.

The manager looks for early `dzemael_all_seeing_eye.json` and
`dzemael_soulgazer.json`, then selects `dzemael_batraal_eye.json` and
`dzemael_batraal_soulgazer.json` on Batraal engagement. It recognizes
`death_march` and `death_throes` as the respective actor's action keys and
attempts the recovered skills against the hazard's self-origin. Other action
keys are rejected and logged.

For Darkhold casts, `holdUntilReleased` is mandatory. `StopReached` creates a
pending cast and `StopWaiting` retries admission while the actor is busy. A
successful start remains held until the native action ends; minimum
`waitSeconds` remains in force. The manager serializes readiness, dispatch and
release to prevent overlapping updates from duplicating or skipping a cast.
Generic non-Darkhold users retain fully explicit hold/release control.

The early Eye retains its 83 recorded waypoints and adds five held cast stops.
Soulgazer has a 47-point recorded-ground loop with five held cast stops; its
loop closure and three short cross-pass joins are explicitly reviewed in
`Data/raidroutes/dzemael_early_hazard_routes.json`. The two Batraal routes ship with 24 recorded
XYZ and six empirically chosen cast stops. The user permits these documented
estimates. Captured edges and inferred short segments remain separate in
`Data/raidroutes/dzemael_hazard_routes.json`; exact retail paths/cadence and live
collision remain unverified. Sector changes relocate existing actors rather
than spawning duplicates. `!dzemael diag hazards` reports the active route and
structured logs name route-loading failures or arena transfers.

The route controller also does not spawn Darkhold packs. Existing escort
directors support stop-based ambush spawning, but Darkhold pack publication is
already owned by `DzemaelManager` progression stages. Combining both would
publish duplicates.

## Validation

Run:

~~~powershell
dotnet run --project tools/scripted-actor-route-tests/ScriptedActorRouteTests.csproj --no-restore
dotnet build "Map Server/Map Server.csproj" --no-restore
~~~

The focused tests cover once, loop, and ping-pong ordering, timed and explicit
holds, suspension-adjusted waits, jumps, cancellation, duplicate keys, actual
Newtonsoft JSON deserialization, required/unknown fields, unsafe timing values,
and data-directory discovery from the test build output.
