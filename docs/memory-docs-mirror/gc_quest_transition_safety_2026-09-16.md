# Shared job/Grand Company battle transition safety

This pass implements the shared entry/exit safeguards and explicit native scene
baselines for item 1 in the opening-GC work plan. It does not enable the 18 quests
or establish live cutscene acceptance.
Missing public NPCs, the two incomplete encounters, placements and rewards remain
in the [readiness audit](gc_opening_quests_readiness_2026-09-16.md).

## Implemented behavior

- `TryQueueQuestBattleEntry` returns explicit admission. Lua treats both false
  and exceptions as failures. A director separately waits for the exact entrant's
  confirmed landing and actor visibility; a queued call or changed server area
  is insufficient. A failed entry terminates promptly instead of waiting for the
  whole encounter timer. Replacement sessions cannot inherit an unfinished entry.
- Each admitted entry, exit or source recovery retains an exact Player/Session/
  connection claim. Source events also bind their type, actor-table generation,
  last event-close timestamp and area. Closing/reopening the same NPC event
  cannot inherit the old transfer. Pending claims protect content through asynchronous travel,
  even after its last player has left the server-side area.
- A source AfterWarp delegate that is interrupted or whose subsequent admission
  fails uses a staged same-area spawn-10 reload of its captured original position.
  Its scene owners remain until recovery completes. The abandoned-coroutine
  watchdog can request the same recovery without resuming dead Lua. Helpers with
  active events are rejected before and after the owner's movie.
- Only these leased quest transfers require the real destination `0x0007`
  acknowledgement. The existing 15-second timeout now fails them; ordinary
  transport keeps its existing fallback. Quest claims also wait up to 15 seconds
  for the post-landing visibility barrier to open. This barrier retains its
  existing `0x010A`/movement/bounded-fallback behavior.
- Exit failures before destructive mutation preserve the event and retry, with
  a 30-second deadline measured from the first attempt. Retries cannot extend it.
  This is an authored recovery deadline, not a recovered retail timeout.
  Scheduler refusal releases its weather reservation and lifecycle claim; a
  source-recovery refusal also releases the original failed entry's claim.
- After destructive map reset or mutation, an unconfirmed landing closes only
  the captured original connection. It does not unlock mismatched client/server
  maps. The player must reconnect in this exceptional case. Stale callbacks cannot
  close a replacement connection. Disconnected old actors cannot retain a loading
  flag forever.
- Quest exit preserves the persisted content return ticket until destination
  acknowledgement and saving the public location. General dungeon/transport
  exit policies remain unchanged.

## Familiar aftermath argument: native baseline and remaining fidelity work

The original delegates forward `(0, A3)` to NQ playback for `COM0l110`,
`COM0G110` and `COM0U110`. Their server configurations now explicitly pass
numeric **1 / 0 / 1**, respectively. These come from the initial NumberClip
values of each scene's register-1 destination. Selecting those existing values
as the server's baseline is a reconstruction choice, not recovery of the
original server's conditional argument producer.

The pinned executable is SHA-256
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.
Read-only native exports under `outputs/gc-transition-20260916/` trace:

1. Playback registration at `0074f810`, callback `006fb830`, and its typed
   argument conversion at `006eed90`.
2. `GetNumberRegisterClip` factory `00a4f860`, constructor `00dfae70`, and
   execution `00dfaec0`. The serialized `+0x10` short identifies its destination
   clip; `+0x12` identifies the number register read through virtual `+0x44`.
3. All three aftermath schedulers contain exactly one such read of **register 1**.
   Their destination NumberClip initial values are 1 / 0 / 1. The audit checks
   both the original target relationship and the matching current Lua payloads.
   These are serialized initial values, not an established missing-argument
   fallback of the native playback API.
4. Dialogue variants distinguish recognition: Limsa rows 34/58 differ in Japanese
   despite identical English; Gridania rows 34/62 and Ul'dah rows 32/58 also
   distinguish familiar and unfamiliar greetings. This supports a recognition
   interpretation, but does not establish every greeting branch or whether retail
   used starting city, completed quests, or another saved-state flag.

`RapturePreviewSetupClip` calls were also traced (`00638940`, `00813210`,
`008132d0`, `00813190`); they do not recover that server-side producer. The
recovered Lua facade forwards the argument, it does not calculate it.
The original familiarity predicate remains unimplemented. The explicit baseline
lets initial watched/skipped playback use a supported numeric scene state while
that fidelity question remains separate. No default is claimed as proven live
playback or the correct personalized greeting for every character.

Reproduce the pinned scene/CSV evidence:

```powershell
python -B tools/inspect_gc_transition_scenes.py check
```

Native export examples (existing local Ghidra project, read-only):

```powershell
& tools/decompile_gc_transition_native.ps1 -Targets @('0074f810','006eed90','00713030','0076d610') -OutputName 'play-dispatch.txt'
& tools/decompile_gc_transition_native.ps1 -Targets @('008132d0','00dfae60','00dfaec0') -OutputName 'scene-register-execution.txt'
```

## Validation and deployment

Build isolated from the running server:

```powershell
dotnet build 'Map Server/Map Server.csproj' -c Release -o .tmp/gc-transition-fix --no-restore
dotnet run --project tools/job-gc-lifecycle-tests/JobGcLifecycleTests.csproj -c Release --no-restore -- --server-assembly '.tmp/gc-transition-fix/Map Server.dll'
dotnet run --project tools/ferry-transport-tests/FerryTransportTests.csproj -c Release --no-restore -- --server-assembly '.tmp/gc-transition-fix/Map Server.dll'
dotnet run --project tools/grand-company-runtime-tests/GrandCompanyRuntimeTests.csproj -c Release --no-restore
python -B tools/test_gc_mission_decomp.py
python -B tools/validate_grand_company_quests.py
python -B tools/validate_quest_availability.py
```

The lifecycle suite exercises production Lua plus linked ownership/lifetime
state. Its compiled-server checks use in-memory actors and a loopback connection,
including the actual 15-second missing-ack timeout, delayed post-landing readiness,
stale/reopened event protection, bounded failed-exit retries and destructive-failure
disconnect. It does **not**
run the complete map/SQL pipeline or render the native client movies.

Initial transition-only offline results: Release build passed; all 18 requested wrappers loaded;
27 lifecycle cases / 452 Lua assertions; 48 lease, 31 transition-ownership and
35 compiled-server assertions; 199 existing GC runtime assertions; 1,139 ferry/
airship assertions; eight bytecode regressions; three pinned aftermath scene
audits. Grand Company static audit, availability validation and `git diff --check`
also passed. Build output retained the existing dependency advisory warnings;
the test project's vulnerability-feed lookup was unavailable.

Initial transition-only isolated `Map Server.dll` SHA-256 (superseded below):
`2D29D279A131267E9F029ECDF99419020746A466E583E601C9A61F383B676CD7`.

No live database changes, quest enablement or server restart were performed.
The running game client and Map Server were still active at the deployment check.
The updated Lua requires the matching new DLL; install/restart together before
testing these shared job/GC routes. Preserve the user's zone-209 nav capture.

Live acceptance remains: watched and skipped openings/aftermaths; return to the
captured public point with movement/interaction restored; party helpers;
disconnect/reconnect during entry and return; controlled rejected entry and lost
landing acknowledgement. Missing GC contact NPCs need separate restoration or a
scoped test harness before those specific quests can be played normally.

## Follow-up: reusable storyline scene guard

The user's follow-up authorized reusable storyline/cutscene reliability tools.
`story_scene.lua` now centralizes the recovered delegate call, packed arguments,
event tracking and optional native movie proof. The three familiar quests opt in
for both their opening and aftermath movies (six explicit bindings). Other
delegates retain lease-only behavior. See [the authoring guide](story_scene_authoring.md)
for configuration, native evidence, deadlines, logging and remaining live checks.

The guard binds the original connection, event lifetime and coroutine; tracks
invitation/start/playback/continuation separately; rejects unproved progress;
and defers interleaved generic dispatch rejection on the exact guarded wait.
Missing callbacks, client Lua errors and abandoned continuations end the original
connection without a premature EndEvent. This is bounded reconnect recovery,
not a claim that a timed-out native callback can be safely forced to return.
Source lease recovery also checks the captured socket so later cleanup cannot
adopt a replacement connection. Native playback owns its bounded watchdog before
the older shell deadline can drain it; proved completion gets 30 seconds to
publish entry, without reviving closed content.

Latest offline results: Release build passed (zero errors, four existing package
advisories); 51 lease, 31 transition ownership, 49 native scene contract,
61 compiled scene guard, and 35 compiled transition assertions. All 18 requested
quest wrappers loaded. The production Lua suite passes 30 cases / 526 assertions,
including guarded source/aftermath admission and unchanged packed arguments.
The 199 existing GC runtime checks, 1,139 ferry/airship checks, eight bytecode
regressions, three pinned scene audits, GC static/availability validators and
diff whitespace check pass. The Lua suite was rerun after the final change to
avoid a source reload when guard admission refuses before dispatch.

Latest isolated `Map Server.dll` SHA-256:
`0AB450FAEFAE51B347B1CF8419E5F717179BC71DAA3AF07D4B315A02AF9155CD`.

This supersedes the earlier isolated build. The latest deployment check still
found game client PID 3864 and Map Server PID 85628 running. No live binary
replacement, server restart, database change or quest enablement was performed.
Live rendering and recovery acceptance remain open; deploy the matching Lua/DLL
together at a safe restart before testing.
