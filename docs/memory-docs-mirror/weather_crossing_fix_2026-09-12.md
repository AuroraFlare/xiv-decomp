# Weather boundary packet correction — 2026-09-12

This implements the server correction identified in
[the September 6 audit](weather_transition_audit_2026-09-06.md). Repeated
weather IDs could replace a running micro-area fade's duration without
resetting the client's elapsed counter. For example, a seamless boundary
could change a 180-second fade to 20 seconds and complete it abruptly.

## Runtime behavior

- Movement and ordinary scheduler updates suppress unchanged weather packets.
  The comparison uses the last packet admitted for that player/session, so
  explicit GM/script overrides are accounted for.
- Micro-area ownership, boundary hysteresis, and exit-duration metadata still
  advance when an unchanged packet is suppressed. Rejected sends remain
  retryable and do not commit new ownership.
- Seamless movement uses the micro duration when entering, changing, or
  leaving a micro-area, including across server-zone boundaries. Pure broad-zone
  changes retain the seamless duration. Area-specific overrides still apply.
- Hard zone-in weather always sends its explicit bootstrap packet, even for
  an unchanged ID. Teleport/Return do not wait for the visible fade. Their
  existing seven-second weather stage and map/actor ordering remain intact.
- Explicit GM/script sends and forced seasonal refreshes retain the ability
  to resend an unchanged ID. Weather admission remains serialized against
  reserved zoning and requires a connected delivery session.

The requested micro-area fade is now **35 seconds** in the checked-in config,
source default and missing-key fallback. Scheduled=20, seamless=20 and
hard-zone-in=7 seconds remain unchanged in the checked-in config. The old
source-contract assertions for checked-in scheduled=180/seamless=35 were
corrected to match the existing settings.

The Lower La Noscea clear circle previously pinned 180 seconds in SQL. Its
fresh-install row now pins 35 seconds, and
`Data/sql/live migrations/micro_weather_transition_35_seconds_20260912.sql`
updates that one row on existing databases when it still has the old value.
Apply that migration along with the updated config/server; custom operator
overrides remain supported. Weather selection and boundary data are unchanged.

## Validation

- Release build of `Fishing Tests/Fishing Tests.csproj`: passed (existing
  NuGet vulnerability-feed and obsolete-API warnings).
- `--weather-transitions-only`: checks both 35- and 180-second configured fades
  with actual weather packet assertions for
  micro entry/exit, duplicate suppression, destination state, seamless timing,
  repeated hard bootstraps, explicit overrides, zoning reservations,
  disconnected/unattached delivery and replacement sessions.
- `--micro-weather-only`: passed, including the new packet tests and the
  existing Mistbeard boundary/scheduler tests.
- `--teleport-handoff-only`: passed.
- `tools/seamless-zone-tests`: passed, 2,485 scenarios.
- `--client-crash-regression-only`: stopped at the unrelated Sirocco SQL
  contract (`Sirocco remains passive with sight metadata and a five-minute
  respawn...`). This broad suite did not pass; its later assertions were not
  reached. No Sirocco data was changed for this weather task.

## Live evidence and remaining visual validation

A ten-second read-only sample of the already-running client is saved in
`tmp/weather-crossing-before-20260912.jsonl` (local, unstaged output).
The executable hash matched the audited client. Every sample reported a
180-second target, a completed blend, and one queued resource. There was no
captured crossing or active fade, so this is evidence of a valid timer value,
not a reproduction or visual verification of the fix.

The Release server was rebuilt; the running game/server session was not
restarted. Deployment and an in-game crossing are still needed to confirm the
reported visual outcome. This server correction does not alter the client's
separate spatial DrawEnv blend or reconstruct rapid A→B→A resource-queue
reversal while the original resource is still present. Those remain distinct
cases for a live crossing capture if the snap persists.
