# Ferry scene decompilation and server correction — 2026-09-16

Both installed 1.23b vessel movies have been decoded, and the server now uses
the recovered notice-event and travel-wrapper contracts for both directions.
The user has confirmed both departure cutscenes work. Logs record successful
movie completion and boarding for route 201 at 18:01 and route 204 at 18:11.
The next correction moves disembarkation inside both docks and passes 641
offline checks; deployment and arrival acceptance are recorded below. Skipping
and reconnection still need live acceptance. Maintenance restarts and temporary
native tracing are recorded below; all trace breakpoints were restored on detach.

## Reproduce

```powershell
python -B tools/decompile_ferry_scenes.py build
python -B tools/decompile_ferry_scenes.py check
powershell -NoProfile -ExecutionPolicy Bypass -File tools/decompile_ferry_native.ps1
dotnet build 'Map Server/Map Server.csproj' -c Release --no-restore -p:OutputPath="$PWD/.tmp/ferry-build/" -v:q
dotnet run --project tools/ferry-transport-tests/FerryTransportTests.csproj --no-restore -p:OutputPath="$PWD/.tmp/ferry-review-tests/" -- --server-assembly '.tmp/ferry-build/Map Server.dll'
```

The audit is in `outputs/ferry-scenes-20260916/`. The Python tool freshly reads
and hash-checks both installed PWIB assets, recursively inventories their
resources, and decodes the contained SEDBSCB blocks. It disassembles the previously
recovered Lua bytecode using the existing source manifest and records its hashes.
The separate Ghidra export freshly decompiles nine native functions from the
read-only imported executable, SHA-256
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.

The older detailed native research remains at
`C:/Users/drime/.codex/visualizations/2026/08/27/01a040c7-1262-7e41-893f-9a8281eb12f9/AIRSHIP_FERRY_CUTSCENE_DECOMP.md`,
especially sections 22, 23, and 29. Its original immediate-zoning proposal and
payload-blind observer are superseded by the implementation here.

## Both movies

| Route | Native scene | Character dictionary records | Timeline clips | Native backgrounds |
| --- | --- | ---: | ---: | --- |
| 201, Limsa docks → Western Thanalan | `vsl0l010` | 15 | 173 | `sea_s0_twn01`, `sea_s0_lin01` |
| 204, Western Thanalan → Limsa docks | `vsl0u010` | 16 | 181 | `wil_w0_fld03`, `wil_w0_lin01` |

Both contain ship actor class `1200091`, the player binding, boarding/deck
extras, cameras, fades, motions, and native background actions targeting
`isgrp_000456`. Limsa explicitly labels its timeline sections `board`, `deck`,
`send off`, and `voyage`. Thanalan has setup and four camera sections; its
origin mapping is corroborated by its Thanalan background resources. These
assets are origin-side departure sequences. The installed `vsl*` inventory is
exactly these two assets; it supplies no independent ferry-arrival movie.
Arrival retains a fade into the destination, not playback of the opposite
direction's boarding movie.

The JSON includes every clip's opcode class, actor index, start units, length,
and raw body, plus decoded scene positions and background bindings where the
record layout is known. Resource tables preserve camera/motion references.
Block time values are retained as raw SCB units; the 9,000,000-unit root block
is not evidence of the playable voyage duration. Unknown selector words remain
raw. SCB classes are resolved inside the scheduler payload: scanning the whole
PWIB would incorrectly insert an unrelated `EffectClip` and shift class indices.
Cinematic positions are not applied to SQL or persistent NPC homes.

Source SHA-256:

- `vsl0l010`, 514,224 bytes: `6df2130a46e3683e94b1522b4d1bce4399464b7fca28698d1e1e90c4f5ccf083`
- `vsl0u010`, 517,936 bytes: `fef60bfdfa00ca8c26d697569cdcaefdb1192d66858f1f7ab0d35a369bd06b80`

## What was wrong

1. Movies were disabled by `FerryDepartureCutscenesEnabled = false`.
2. Experimental notice kicks omitted the leading Boolean `true`.
   `KickClientOrderEventReceiver` at `0x0089F180` decodes this Boolean through
   `0x0078F840`; a true wire tag (`3`) invokes `0x0089E200`, arming receiver
   `+0x80`. `0x0089E450` uses it for the queued notice path. This is a concrete
   discrepancy with the native contract, not proof that every historical live
   failure had only this cause.
3. The observer accepted any incoming `0x00CE` and immediately zoned. It ignored
   payload length, selector, scene, event owner, and session generation. This
   could wipe the active scene/owner before the native completion path ran.
4. The experimental `RaidFst0Dungeon03.eventNoticeCutScene` launcher appended a
   Toto-Rak widget and extra playback arguments. It has been removed from the
   ferry path, including the unused experimental director script.
5. A 15-second fade timeout was also being used for full movies, and voyages
   were persisted before successful boarding.

## Implemented transaction

```text
scheduled castoff
  → original ready session + visible Gert/Sylviel + idle event slot
  → bind DftSrt and KickEvent(attendant, ferryTravel, true)
  → actual matching client EventStart, claimed once
  → NpcBaseClass.delegateEvent(player, DftSrt, eventDeparture, scene, nil)
  → DftSrt: fade out → startNQCutScene(scene, 1) → fade in after warp
  → matching native start and terminal notices; keep the scene alive
  → blocking client RPC returns
  → EndEvent → persist admitted voyage → staged transfer to zone 200
  → existing voyage timer and directional announcements
  → steersman-owned notice → delegated arrival fade → destination
```

The recovered delegate supplies `(player, invokingOwner, departure, arrival)`
to `DftSrt.eventDeparture`; the two scene arguments occupy A3/A4. Only one movie
is supplied for the ferry. No numeric scene argument, scene name, destination,
or deadline from an incoming event is trusted.

Client-to-server `0x00CE` has exactly **40 body bytes**: little-endian selector at
0, a zero-terminated 32-byte ASCII scene field at 4, and four opaque trailing
bytes at 36. The prior 24-byte interpretation subtracted the transport header
twice; the live 17:40 capture disproved it. The trailing word is nonzero in both
captured messages and is not treated as a success flag. Selector 0 is emitted by
`0x006FB830 → 0x0076D610`; selectors 1/2 by
`0x006FBC50 → 0x00763DC0`. Terminal selectors encode lifecycle/mode, **not** the
native callback success Boolean. They establish ordering, not visible rendering.
An empty `0x012E` can be the native generic RPC rejection; it never proves a
movie ran. `FerrySceneTransition` requires accepted ownership, the expected
scene's start followed by terminal notice, and the original RPC continuation.
No notification handler performs zoning.

Invitations bind the original Player, Session, actor-table generation, source
zone, event owner, and a unique server-side continuation token. Replacement sessions, actor wipes, foreign owners,
duplicate starts/ends, malformed packets, terminal-before-start, and other
scenes cannot authorize boarding. The 180-second movie timeout is an authored
failure bound; it cancels the reservation without zoning. Cleanup ends only
the owned event. Arrival retains a 15-second fallback when its fade/steersman
is unavailable, deferred while another event, coroutine, protected cutscene or
zone transition is active, or the session is not ready. Failed arrival RPCs
and rejected zone admission retain the voyage for retry.

The ten-minute scenery cycle, existing 540-second arrival deadline measured
from castoff, captured deck and destination XYZ, door animations, and departure
announcements remain unchanged. Thus watching the movie uses part of the voyage
clock. Legacy onboard routes 202/203 do not replay an origin-dock movie.
Only admitted boarding is newly persisted; an interrupted pending movie is
not restored as a departed voyage. Existing departed-voyage restoration remains.
No SQL changes are required.

## Dock registration loading-screen correction

The 14:51:37 live report is an earlier step than the departure movie: Gert's
confirmation moves the player to the zone-230 waiting point and queues route
201 with 503 seconds until castoff. The log continues to receive movement in
zone 230 while the user reports a black Now Loading screen.

`MovePlayerToTransportWaitingPosition` called `WarpToPosition`, which sends
`0x00E2` and rebuilds the actor view. Neither the Gert/Sylviel confirmation menu
nor the recovered `MapObjPortDoor.eventIn` owns an after-warp loading completion.
The first correction reused the existing position-only
`DoPlayerMoveInZoneAfterCutscene` rebase (spawn type zero, no E2 or actor-table
reset), preserving the confirmation event for its normal `EndEvent`. It clears
an older reservation before moving and registers the sailing only when the
move succeeds. Both docks retain their exact waiting coordinates and schedules;
departure and arrival zone changes are separate. No SQL change is needed.

`WaitingPositionChecks` guards this packet-producing call chain and executes
both attendant adapters and both entrance-door routes for acceptance and
cancellation. A client retest after loading the corrected DLL is still needed;
the source diagnosis and offline checks do not establish live visual acceptance.

The user subsequently reported that this position-only arrival visibly clips and
that NPC travel should retain Now Loading. That first correction is superseded
by the full NPC loading transaction described in
[`npc_travel_loading_2026-09-16.md`](npc_travel_loading_2026-09-16.md).
The current registration path uses native arrival type 10 with staged map,
weather, actor snapshot and client-ready completion, including local moves.
The paid reservation survives its exact boarding transaction and becomes
departure-ready only after loading completes. The deployment below is the
historical first correction, not the new build's activation record.

The isolated Release build in `.tmp/ferry-waiting-fix/` passed the ferry harness
with `--server-assembly` (**330 assertions**). Compilation had no errors and
four existing NuGet dependency advisory warnings. The tested DLL was installed
in the standard Release directory after the old server reported zero attached
sessions; the previous DLL/PDB are retained in
`.tmp/ferry-waiting-fix-before-deploy/`. Active Map Server PID **8820** started at
15:03:44 local and logged ready on port 1989 at **15:04:12.971** on 2026-09-16.
Its DLL SHA-256 is
`FEFF0F0FD74F258524547B26C2D6662D385596A95A26050AE81BB47BAC9EE70D`.
The first launch attempt used the repository working directory and failed to
find `staticactors.bin`; the active process uses `Map Server/bin/Release` and
the unchanged root `Data/map_config.ini`. Registration's live client retest
remains open.

## Validation and remaining client check

Follow-up review result: **334 ferry assertions pass**, including the compiled
WorldManager entry points and the separate waiting-position regression checks;
both source audits match. The isolated Release build succeeds with **0 errors**
and **4 existing NuGet vulnerability warnings** (DotNetZip and
System.Security.Cryptography.Xml, repeated across the two projects).

The ferry harness executes the production transition class and real Lua
adapter, including real coroutine suspension across `pcall`, the two native
terminal selectors, rejection/replay cases, delegate argument order, RPC failures,
and session invalidation. Compiled-server checks construct in-memory actors and
reservations without starting a server, opening sockets, or accessing a database.
They exercise both routes' admission, stale completion, replacement booking,
early arrival, rejected arrival transfer, GM repetition and fallback readiness.
The harness retains
the existing schedule, persistence, coordinates, door and dialogue regressions.
The full Map Server Release build is compiled into `.tmp/ferry-build/` to avoid
overwriting the running server's DLL.

The follow-up review corrected these additional issues:

- A static DftSrt notice could still replay the ferry movie aboard the cruise
  and use generic completion to bypass the remaining voyage. Both entry points
  now exclude ferry routes, while the airship path remains covered by Lua tests.
- Repeating `!testferryroute` could reset an already-started voyage. It now
  requires the correct origin dock and a reservation whose departure has not begun.
  The redundant Lua command was removed; the existing C# GM command is retained.
- An old RPC continuation from the same NPC could reject or finish a newer
  invitation. Completion now requires its original unique token. Cancellation,
  transfer and deferred timeout work also retain the original booking identity.
- A departure invitation was being treated as boarded for cruise-zone cleanup.
  Only admitted boarding preserves the reservation, enables announcements and
  permits arrival; an onboard passenger is excluded from departure retries.
- Arrival fallback checked only the event owner and zone-change flag. It now
  also respects a running coroutine, combat-cutscene protection and current,
  ready session ownership.
- A refused zone transfer could discard the voyage. Arrival remains pending
  until zone admission succeeds. Departure cancels if persistence or zone
  admission fails instead of reporting a successful boarding.

These are offline behavioral and source checks. Persistence I/O, asynchronous
zone execution and visible client playback remain outside this harness.

After a safe server restart with this build:

1. At Limsa ferry docks (zone 230), use `!testferryroute 201`. Watch the complete
   `vsl0l010`, verify no raid widget, then confirm arrival on the correct zone-200
   deck. Logs should order invitation, native started, native completed, and
   departure fade completed. There must be no zone wipe between native notices.
2. Let the existing arrival deadline expire; verify the Western Thanalan fade
   and the inside-dock arrival pad. Normal Gert registration must work at scheduled castoff too.
3. At Western Thanalan docks (zone 172), repeat with `!testferryroute 204` and
   verify `vsl0u010`, the other deck, and Limsa arrival. Repeat normal Sylviel
   registration independently of the debug command.
4. Repeat both directions using Skip, then test reconnect during the playable
   voyage. Disconnect during a pending movie must not replay it or grant a
   destination warp. A movie failure must leave the passenger docked.

The GM command triggers the ordinary route immediately; it does not shorten
the voyage or force a scene completion. If playback still rejects, capture the
existing native tracer's active-block and FunctionKick predicates using the
new leading-true kick. Offline tests do not establish live visual acceptance.

## Live pickup failure: nonblocking notice (17:01 retest)

The 16:50 scheduled departure and 16:55/17:01 GM reproductions all reached the
correct Gert owner (`0x47300073`) and received actual notice EventStart. They
returned empty `0x012E` (`0xCC6BD671`) without a native `0x00CE` scene start.
The server correctly refused boarding, but its invitation selected the wrong
native condition. See `live-pickup-failure.log` and `live-nonblocking-notice.log`
under `outputs/ferry-scenes-20260916`.

The 17:01:56 native capture identifies the exact cause. Kick selected
`NoticeNonBlock` vtable `0x01056E40`; its blocking virtual returned zero at
`0x00895D39`. Manager `0x48FF9C90` had no active or pending block. Gert was
resolved and initialized, but `0x00896FE0` then rejected the movie RPC because
manager `+8` was null. Leading True arms the queue but cannot turn a nonblocking
condition into a blocking one. Both tracer runs detached and restored original
client instructions.

`SetNoticeEventCondition`'s **second** byte selects the native class. In the
audited client, the receiver supplies `unknown2` as the factory's third argument;
`006f2e80` compares it with runtime byte `0134c3fe` (captured as zero). Zero
constructs `NoticeBlock` via `00892770`, while one constructs `NoticeNonBlock`
via `008927f0`. The block vtable `01056e0c` has virtual `+1c` at `00b73290`
(`b0 01 c3`, true), versus `005c5c80` (`32 c0 c3`, false) for nonblock. The
first byte is carried as the block's priority field, not this class selector.
This corrects the earlier research note's interpretation of the two flags.
Read-only Ghidra exports are `native-event-block.txt` and
`native-notice-condition.txt`, reproducible with
`tools/decompile_ferry_native.ps1 -Section event-block|notice-condition`.

The correction registers a separate `ferryTravel` notice with flags `(0,0)` in
the full NPC spawn packet train. It is scoped to public Gert 1500004 / zone 230,
Sylviel 1500109 / zone 172 and steersman 1001291 / zone 200. The existing SQL
generic notice remains unchanged. Dedicated registration happens once per actor
publication, including reconnect/range rebinding, rather than appending another
condition at each departure. Dispatch, Lua acceptance and timeout ownership now
use this name. Both original movies, arrival fades, original-session invitation
authority and native-start/completion requirements remain in place.

The isolated `.tmp/ferry-pickup-fix/Map Server.dll` builds with zero errors and
the same four existing dependency warnings. SHA-256:
`B9EFFEB4800FEBBD6BD26C4C2BF1A81E55D944AED69DD02167FBC48C91816410`.
The current ferry harness passes **602 assertions**, including the separate NPC
loading changes, compiled native-condition bytes/scope, rejection of generic
notices and both routes' existing lifecycle tests. Tests use in-memory actors
and a local loopback socket for suppressed packet checks; they do not start a
game server or access the database. Both scene/Lua source audits pass. Native
visible playback and pickup still require a retest after deployment.

## Live post-cutscene loading failure (17:40 retest)

The next live process, PID 86800, started at 17:32:29 with the tested pickup-fix
DLL `B9EFFEB4800FEBBD6BD26C4C2BF1A81E55D944AED69DD02167FBC48C91816410`.
At 17:40, the scheduled route-201 `ferryTravel` invitation played `vsl0l010`;
the user confirmed the movie displayed. The client sent start at 17:40:02.705,
terminal selector 2 at 17:40:25.092, and the delegated RPC return at
17:40:25.440. Boarding was then rejected because the decoder incorrectly
required a 24-byte payload. No boarding zone transfer was attempted. The native
after-warp fade had already prepared loading, leaving the user on Now Loading.

`live-post-cutscene-loading.log` pins these exact messages. The native senders
in `native-dispatch.txt` set message size `0x38`, including the **16-byte game
message header**, and copy the complete 32-byte scene buffer. The 16-byte outer
transport header is added separately. The body is therefore `0x28`, matching
the observed 40 bytes. The decoder now checks exactly that size, the bounded
zero-terminated ASCII scene field and its zero padding, while ignoring only
the four opaque bytes after it. Selector, scene, owner, original-session and
start-before-completion checks remain required. No zoning occurs on a native
notification alone; the original blocking RPC still authorizes the handoff.

Both exact captured packets are executable fixtures. The compiled WorldManager
observer accepts their lifecycle and leaves boarding for the original RPC;
route 204 uses a clearly derived envelope with its own scene name. Truncated,
oversized, unterminated, non-ASCII and malformed-field payloads remain rejected.
The isolated `.tmp/ferry-loading-fix/Map Server.dll` passes **618 ferry checks**,
builds with zero errors and the existing four dependency warnings, and hashes to
`43E83E279D0837F433E58CECB8B65E12C92A35CE9F0008F4825FA4AD11976407`.
The Limsa movie is now live-confirmed; corrected boarding, the voyage/arrival,
reverse-direction movie and skip behavior still require client retesting.

After the user closed the client and the log confirmed zero sessions, the tested
Map Server and Meteor.Common DLL/PDB pairs were installed in the standard
Release directory. Previous files are preserved in `.tmp/ferry-loading-before-deploy/`.
PID **78060** started at **17:46:00** and logged listening on port 1989 at
**17:46:25.928**. The installed Map Server hash matches the isolated build above.
The first copy attempt encountered a briefly retained file lock after stopping
the idle process; replacement succeeded after it exited. The startup's unclean
shutdown marker records this maintenance stop, not a client-triggered crash.

## Premature event-close crash during the immediate retest (17:48)

The 17:48 GM attempt reached the dedicated event but received an empty generic
native dispatch rejection (`unknown1=1`, CRC `CC6BD671`) before any scene start.
The server resumed the blocked Lua call and sent EventFinish at 17:48:55.210.
At 17:48:59 the client crashed. Dump `ffxivgame.exe.74152.dmp` records an access
violation at `00892550`, reading address 4 with ECX zero. Its immediate caller,
`00894AB0`, had just loaded the manager's active event at `+8` to construct the
outstanding Lua call's real continuation. The dump does not capture that heap
object, so it cannot establish the upstream reason for the generic rejection.
The exception registers, dump hash and bounded stack candidates are pinned in
`client-crash-174859.json`; the related log is `live-premature-event-close.log`.

The fresh `native-rpc-continuation.txt` export traces the generic dispatcher
failure separately from the normal `00894AB0` continuation. Both use `00894090`
and `0075E670`, but their result selector differs. Scoped ferry handling now
defers the empty selector-1 rejection before it can consume the original Lua
wait. It retains the owned client event, booking and existing deadline. The
normal result still resumes the original continuation, which still requires
the matching movie lifecycle before boarding. Other event types, owners,
sessions and generic notices are unaffected. This guards the observed premature
teardown; the upstream dispatch rejection remains under live investigation.

The guard passes **637 assertions**. Isolated output `.tmp/ferry-reply-fix/`
and the installed Release DLL share SHA-256
`71598F656A22A47B8756E78E28D3BD718A796A55729B964907F45BFF28F24BC8`.
The user had closed the client, and zero sessions were verified before the
maintenance restart. PID **68800** started at **17:58:05**, listening at
**17:58:32.440**. Previous DLL/PDB pairs are in `.tmp/ferry-reply-before-deploy/`.
The focused tracer now records the real continuation and active-event cleanup
in addition to the original dispatch predicates. Acceptance follows below.

## Successful boarding and crash reproduction avoided (18:00 retest)

The user ran `!testferryroute 201` with client PID 82028 against the deployed
637-check build above and reported **"it worked"**. The native trace proves
that the ferry RPC was admitted at 18:00:44.936. A separate dispatch at
18:00:45.005 could not resolve its owner and emitted the generic selector-1
reply through caller `00897230`. Its requested owner identity was not captured.
The server deferred that reply at 18:00:45.359, preserving the original event.
This establishes an interleaved rejection, rather than rejection of the
successfully admitted ferry movie call.

Native movie start reached the server at 18:00:46.396 and terminal selector 2
at 18:01:08.411. The real continuation at 18:01:08.684 still had active event
`4B5CA5D0` in manager `468D68C0`; its reply came from caller `00894B6A`.
The server accepted that return at 18:01:08.749 and boarded the player at
18:01:08.760. Native event cleanup followed at 18:01:08.797. The client
acknowledged the ferry-zone snapshot at 18:01:15.400 and sent changed movement
coordinates on deck afterward. The observed cutscene/loading/crash sequence
is fixed in this run; this does not establish arrival or reverse-route acceptance.

`live-ferry-rpc-interleave.log` preserves the unedited native capture, and
`live-boarding-success.log` contains the focused server lines. The tracer's old
fallback label also appeared on normal replies: ignore that inferred label for
caller `00894B6A`; the raw caller addresses and event-state observations are
the evidence. The tool now distinguishes these callers. It detached normally
and reported `Detached; original client bytes restored.` No restart was needed
after this successful run. `reply-fix-validation.json` pins this validation and
the installed build and capture hashes.

## Both movies accepted; move arrivals inside both docks

The user confirmed both cutscenes work after the return-direction retest.
Route 201 completed its arrival fade at 18:09:43.911 and loaded zone 172 at
18:09:54.397. Route 204 then started `vsl0u010` at 18:10:37.100, completed it
at 18:11:00.940, boarded at 18:11:01.456 and acknowledged the opposite deck's
snapshot at 18:11:05.856. These observations use the prior 637-check build.
`live-both-directions.log` pins the corresponding server lines.

The user requested disembarkation inside the docks at both destinations. The
old route destinations reused exterior exit points: Limsa
`(-759.331, 12.000, 239.413)` and Thanalan
`(-2181.066, 14.600, -415.158)`. Arrival now reuses each existing boarding pad:

| Destination | Zone | X | Y | Z | Rotation |
| --- | ---: | ---: | ---: | ---: | ---: |
| Limsa ferry dock | 230 | -812.644 | 8.000 | 234.744 | -1.545 |
| Western Thanalan ferry dock | 172 | -2187.191 | 14.600 | -400.850 | -0.047 |

These are the existing captured boarding transforms exercised before the two
successful movies, selected as arrival positions to satisfy the user's request.
They are not newly recovered retail disembarkation coordinates. All four ferry
route definitions (201–204), their normal/fallback/offline completions and the
cruise-map manual exit use the inside-dock destination. A gate exit invoked
while already ashore retains its exterior transform; separate exit constants
prevent arrival edits from changing that action. Departure movies, deck
positions, voyage duration and Lua handling are unchanged. No SQL change is
needed because these destination transforms belong to the runtime route table.

The isolated `.tmp/ferry-dock-arrival-fix/Map Server.dll` builds with zero errors
and four existing dependency warnings. SHA-256:
`07AFC9F5304B8007C21FC3845F9F2C8C1F2F158879FCA8914968C5A3D407E8A7`.
All **641 ferry checks** pass, including compiled destination checks for each
of the four routes and the existing arrival/departure lifecycle checks.
After the user closed the client, zero attached sessions were verified and the
tested Map Server and Meteor.Common DLL/PDB pairs were installed. Previous
files are preserved in `.tmp/ferry-dock-arrival-before-deploy/`. PID **65480**
started at **18:17:29**, listening on port 1989 at **18:17:55.178**. Installed
files match the isolated build. Corrected arrival rendering still needs a live
retest; the successful earlier movie tests are not arrival-position acceptance.
