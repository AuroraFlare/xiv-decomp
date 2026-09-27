# NPC travel loading correction — 2026-09-16

The original Gert report at 14:51:37 was a local move to the Limsa waiting
point, before the ferry departure movie. `WarpToPosition` published E2 and
arrival type 15 without a matching native after-warp scene to finish loading.
The first correction used a type-zero position update. The user then reported
visible clipping and clarified that even local NPC travel should show loading.

Plain travel now uses native NPC arrival type 10 through the existing staged
zone-change pipeline. Equal source/destination area identity cannot take the
position-only shortcut. EventFinish settles before the loading curtain; map,
weather and actor construction retain their existing barriers, followed by
client zone-in completion. No new arbitrary fade delay is added.

## Audited callers

| Callers | Behavior |
| --- | --- |
| Faezbroes, Lionnellais, Stangyth; all six airship routes | Full loading into the boarding area |
| Hida, Wineburg, Lunnie | Full loading to the existing city exit coordinates |
| Gert and Sylviel; both ferry entrance doors | Full loading to the exact existing dock waiting point |
| Lorhzant; both ferry gate exits | Full loading for same-dock exits; existing cross-area cruise exits retained |
| `man200` / `man206` office east door and west door without a scene | Full loading; preserve the existing recently-closed-event settling |
| OpeningStoper F0B1 / W0B1 boundary pushbacks | Authoritative local correction without opening loading; F0B1 also uses the actual event-type/name signature |
| Company aethernet, rental chocobo, teleport/Return, guildleve camp returns | Existing staged travel retained |
| Elevator and main-story movie-owned after-warp paths | Existing native scene/fade completion retained |

`MovePlayerForNpcTravel` preserves the current area's public/private identity.
Ordinary generic `WarpToPosition` and `DoPlayerMoveInZone` remain available to
the scene-owned callers; forcing a second loading owner there would break their
native completion contract. Boundary/post-cutscene corrections share
`InZonePositionCorrection`, which rejects invalid/stale ownership, keeps area
membership, clears queued movement, and publishes only the position packet.

## Paid boarding lifecycle

Airship/ferry bookings are retained across only their own boarding transaction.
`AwaitingBoarding` prevents scheduled departure before client readiness.
Completion is bound to the original booking and player/session; failed or stale
completion cannot activate a newer booking. An admission failure keeps the paid
booking retryable in the current session, with no second fare or ticket charge.
Airship payment display also recognizes that existing booking. A repeated
confirmation after successful boarding closes normally without charging again.
Disconnect/restart persistence of an unboarded reservation is unchanged.

Normal departure time is recalculated from actual readiness, so loading cannot
leave a passenger eligible for a sailing already missed. GM immediate-departure
requests wait for readiness and then run immediately; the full voyage duration
and existing departure/arrival scenes, schedules and coordinates are preserved.
No SQL change is required.

## Offline validation

- Isolated Release server build: successful.
- Ferry/airship harness: **584 assertions**, including actual Lua branches,
  original compiled ferry-scene checks, boarding completion/retry identity, and
  real correction packet/spatial behavior over a suppressed loopback transport.
- Company warp: **260 assertions**.
- Guildleve completion: **58 checks**.
- Shared teleport handoff/private-scene retirement: pass.
- Chocobo lender/arrival/rental/mount regression: pass.
- Futures Perfect scenario validation: pass.
- Favored destination/gil-mode checks: pass. The camp-registration fixture now
  declines the independent `LocalGuildleveNpcs` dispatch explicitly; its old
  no-op `require` mock left that helper nil. Runtime camp behavior is unchanged.

Builds are isolated under `.tmp/npc-travel-fix` and
`.tmp/npc-travel-regressions`; the final camp fixture was built under
`.tmp/npc-travel-finalchecks`. The broad regression project needed `-m:1` in
this environment. The main build initially reported the existing NuGet advisory
warnings and a Common-library signed-bitwise warning; no compilation errors.

## Client acceptance

After activation, retest Gert/Sylviel and the entrance/exit doors at both docks;
test each airship city's entry and exit. Loading should be visible and finish
at the waiting/exit point, with no visible snap or permanent black screen.
Logs should include `ZoneTravelStage` with spawn type 10 and `Boarding ready`
only after client zone-in. Cancellation must stay put without charging.
Test ordinary scheduled departure and the GM immediate-departure path after
boarding. Existing ferry movie/skip/cruise/reconnect checks remain in the
separate ferry-cutscene document. Offline checks do not establish visible
native-client acceptance.

Activated in the standard Release directory with zero attached sessions.
Map Server PID **62188** started at **16:35:21** local on 2026-09-16 and logged
ready on port 1989 at **16:35:46.177**. The tested DLL SHA-256 is
`C39E123763CBAB200B19BB7907D692BBF5CE033BDCA5A2D9ED8860A8EC3ED2D9`.
The matching `Meteor.Common.dll` was installed with it; the prior DLL/PDB pairs
are retained in `.tmp/npc-travel-before-deploy`. The old idle process was stopped
for replacement, so its startup marker correctly reports an unclean stop; this
is not evidence of a client-triggered crash. Visible client acceptance remains
pending.
