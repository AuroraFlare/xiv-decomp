# Continuous mob path chasing (2026-09-13)

Aggro path movement used to publish one sampled waypoint per combat movement
update. Recorded paths contain short, uneven segments, so the client could
reach a sample before the next update and visibly stop. Path chasing also
ignored the speed-based step calculation used by direct pursuit.

`BattleNpcController.ChaseWithPath` now uses that same chase step calculation.
`PathFind.FollowChasePath` spends the step across multiple samples and
interpolates inside the next segment, then publishes one destination. It keeps
the submitted endpoint until the actor reaches it, including when collision
shortens or rejects the move. Cached paths are refreshed before their final
short segment would slow a mob that still needs to pursue its target.
Rejoining a recorded path between nodes also skips a local backward detour
when its next edge already passes through the mob's current XYZ.

Navigation remains optional. Existing SharpNav / recorded-route selection and
direct fallback still apply, including escape-chase feature settings. The
change does not add a requirement for a zone to have a mesh or recording.
Nearby bends may be rounded within one movement step; route heights are
interpolated, not treated as a complete terrain heightmap. Existing movement
distance, slope, object-collision, arena, and combat-state checks still apply.
Scripted routes, idle roaming, and return-to-spawn retain their existing follower.

Validation is in `tools/zone-mailbox-tests/QuickNavChaseTests.cs`, using the
production controller, path follower and actor position publication. Cases
cover uneven/duplicate samples, slopes, final arrival, rejected movement,
bounded-path renewal, moving targets, different speeds, recorded detours, and
pursuit without a graph. Run:

```powershell
dotnet build "Map Server/Map Server.csproj" --no-restore -m:1 -nr:false
dotnet run --project tools/zone-mailbox-tests/ZoneMailboxTests.csproj --no-restore -- --quick-nav-only
```

This is a server-side movement change. Rebuild and restart the map server to
try it in game; client-visible smoothness still needs an in-game check.
No SQL or recorded navigation data changes are required.
