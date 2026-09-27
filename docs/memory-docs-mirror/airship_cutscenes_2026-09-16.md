# City airship departure and arrival repair — 2026-09-16

All six city routes now use an owned, blocking attendant event for the paired
native departure and arrival movies. Landing requires both movie lifecycles
and the original Lua RPC continuation. Live route-101 and route-104 results are
recorded below; the remaining routes still need client acceptance. The older
August observations do not validate this new event path.

## Native evidence

Reproduce the installed-client scene audit:

```powershell
python -B tools/decompile_airship_cutscene_setup.py --output-dir outputs/airship-scenes-20260916
```

All six source sizes and SHA-256 hashes match the pinned native assets. The
output contains 77 actor records and 74 cinematic placement records. These are
cutscene transforms, not world spawn coordinates. The recovered LPB call chain
and bytecode hashes are documented in
`tools/outputs/lpb/airship_decomp_20260824/README.md`.

The attendant calls `delegateEvent(player, DftSrt, "eventDeparture", departure,
arrival)`. The native delegate inserts the invoking owner. DftSrt fades out,
plays `startNQCutScene(departure, 1)`, plays the arrival scene the same way, and
requests fade-in after the world warp. Each scene has a nine-second authored
timeline, excluding fades and loading. The server must retain the event until
the native paired call returns.

| Route | Direction | Departure | Arrival |
| ---: | --- | --- | --- |
| 101 | Limsa → Gridania | zep0l000 | zep0g010 |
| 102 | Limsa → Ul'dah | zep0l000 | zep0u010 |
| 103 | Gridania → Limsa | zep0g000 | zep0l010 |
| 104 | Gridania → Ul'dah | zep0g000 | zep0u010 |
| 105 | Ul'dah → Limsa | zep0u000 | zep0l010 |
| 106 | Ul'dah → Gridania | zep0u000 | zep0g010 |

## Runtime changes

- Faezbroes 1500003/zone 133, Lionnellais 1500055/zone 155 and Stangyth
  1500208/zone 209 register `airshipTravel` with native NoticeBlock flags 0/0.
  Their existing generic SQL notice is nonblocking. The new condition belongs
  only to these public-area attendants; no database row changes are needed.
- The DftSrt binding and kick with leading `true` are queued together for the
  current session generation and a visible, initialized attendant. Authority
  is published before acknowledgement can arrive.
- `AirshipSceneTransition` binds the player, session, view generation, zone,
  owner, scene pair and single-use token. It requires ordered native 00CE
  departure-start/end and arrival-start/end, then the owned RPC continuation.
  The 40-byte decoder is shared with the live-captured ferry format. The
  airship packet fixtures are synthetic, not claimed airship captures.
- The generic empty 012E selector-1 rejection observed interleaved with the
  ferry RPC cannot consume an owned airship continuation. Normal replies still
  resume Lua. Applying that guard to airships is pending live validation.
- The former 60-second fallback and legacy static completion cannot authorize
  landing. A rejected zone admission retains the completed booking for retry
  without replaying the movies. Repeated booking/GM commands preserve an active
  transport event. Movie return values cannot be mistaken for paid bookings.
- A replaced session/view invalidates the old invitation and retains payment
  for a future departure. An owned early/error RPC closes its own event and
  reschedules. A 180-second watchdog reports a stalled accepted RPC without
  tearing down a live native event; reconnect is the recovery if it never
  returns. Airship bookings remain in memory, not persistent across restart.
- `!testairshipcs` now directs the GM to `!testairshiproute`; the old arbitrary
  nonblocking movie probe no longer sends packets.

The level-50 gate, 5,000-gil fare, consumable quest tickets and five-minute
vessel schedule are unchanged. Booking still waits for its staged loading
transaction before it becomes eligible for departure.

## Landing locations

After testing routes 101 and 104, the user requested arrival back at the dock
instead of inside the boarding area. All six route destinations now use the
existing public-side city-exit positions from `PopulaceFlyingShip.lua`.
Departure boarding pads remain unchanged. These are reused local exit points,
not newly recovered retail arrival XYZ; floor/facing acceptance remains open.

| City | Zone | X | Y | Z | Rotation |
| --- | ---: | ---: | ---: | ---: | ---: |
| Limsa | 133 | -459 | 91.5 | 183.8 | 2.75 |
| Gridania | 155 | 67.685 | -7 | -1204.824 | 3.125 |
| Ul'dah | 209 | -119.067 | 271.2 | 169.496 | 0.25 |

## Validation

The isolated Release build at `.tmp/airship-contract-build/` passes:

```powershell
dotnet '.tmp/airship-contract-build/Fishing Tests.dll' --airships-only
dotnet tools/ferry-transport-tests/bin/Release/net10.0/FerryTransportTests.dll --server-assembly '.tmp/airship-contract-build/Map Server.dll'
```

The city scheduler/six-route suite passes. The focused transport suite passes
**1,133 assertions**, including all six pairs, normal/skip terminal selectors,
yielding Lua wrappers, actual compiled event registration, scheduler timeouts,
stale generations, repeat commands, refused landing admission/retry, premature
RPCs, preserved destination pads, and the preceding ferry regressions. Existing
dependency and test-fixture obsolescence warnings remain; there are no build
errors. These checks do not establish client rendering or successful loading.

## Installed build

The game client was closed and zero sessions were verified before deployment.
Map Server and Meteor.Common DLL/PDB pairs match the tested isolated output;
the previous files are preserved in `.tmp/airship-before-deploy/`. The old
process acknowledged console shutdown and cleared its marker, but did not exit;
it was stopped after another zero-session check. PID **85628** started at
**18:52:25** using the repository's `Data/map_config.ini` and `Data/scripts`.
It reported ready on port 1989 at **18:52:52.915**. Startup reported no errors
or fatal messages, and the first transport diagnostic had zero sessions.

Installed Map Server DLL SHA-256:
`704A223A3B347BC9CF53E01A3D66F762FFDB22BD9B31C5AE0BBD3B207BCB5D8D`.

## Client acceptance

Start at the Limsa landing with `!pos 133 -472 92 194`, wait for loading and
the attendant to appear, then run `!testairshiproute 101`. Confirm both movies,
loading completion, movement and arrival on the public side of the Gridania dock.

A convenient complete circuit is 101 → 104 → 105 → 102 → 106 → 103. Each GM
command still uses normal payment and boarding, but requests immediate
departure. Run the next route only after arrival is complete. Also validate
an ordinary attendant booking against the visible timetable and at least one
skipped movie. Server diagnostics use `[AirshipCutsceneDispatch]`: invitation,
four lifecycle stages, then admitted destination transfer.

## First live acceptance: Limsa to Gridania

The user confirmed "airship CS works departing and landing" on route 101.
On the installed build above, `zep0l000` started at 18:56:10.767 and completed
at 18:56:26.649; `zep0g010` started at 18:56:27.002 and completed at
18:56:46.647. The owned RPC admitted destination transfer at 18:56:48.893.
The client acknowledged the Gridania destination snapshot at 18:56:55.403,
and the server saved zone 155 at `(54.5, -7, -1199)`, rotation 0.
`outputs/airship-scenes-20260916/live-route-101.log` preserves the focused
server evidence. This confirms both rendered movies by user report and the
loading handshake by server log. It does not confirm the other five routes
or a detailed floor/facing review of the Gridania pad. This run preceded the
requested public-dock arrival correction.

The user's initial test-position concern preceded boarding. The initial warp
logged Z=19 at 18:55:43.711; route boarding subsequently loaded the configured
Limsa pad at Z=194 at 18:56:06.773. The user then said it was fine. No route
coordinate was changed on the basis of that report, and no cause for the
initial differing coordinate is asserted.

## Route 104 acceptance and public-dock arrival correction

The user reported `!testairshiproute 104` worked too. On the same installed
build, `zep0g000` ran at 18:59:15.527–18:59:23.151 and `zep0u010` at
18:59:23.835–18:59:41.340. The owned RPC admitted Ul'dah at 18:59:43.736;
the client acknowledged its snapshot at 18:59:50.905, followed by accepted
movement at 18:59:51.280. The saved position was the old boarding pad
`(-126, 271.2, 156.3)`. `live-route-104.log` preserves the focused evidence.

The following arrival-only build uses the public dock coordinates above for
all six routes. It passes the city scheduler/six-route suite and **1,139**
focused assertions, including preserved boarding coordinates at each origin.
No SQL update is needed. Isolated build: `.tmp/airship-dock-arrival-fix/`.
Map Server DLL SHA-256:
`6D66BFE2F1E9C52F598480ACB9880B5948F243DC5E6C60606CDDDAE2B5225012`.
It is prepared for installation after the connected client closes; the active
process still has the earlier arrival targets. Corrected arrivals need retest.
