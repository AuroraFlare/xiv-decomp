# Walking after company warp: server evidence

Kronk's supplied server trace shows a company warp from zone 230 to 133 at
18:02:38.946 on September 25. The destination snapshot completes at 18:02:44.134.
Accepted movement releases actor visibility at 18:02:44.444. Deferred mass actor
cleanup commits at 18:02:46.015 with 16 kept actors. The session is removed at
18:02:54.078. These are server log times; the actual native fault time is unknown.

The client was on another player's PC and its crash files are unavailable. The
local morning crash records do not belong to this incident. Multiple `/_init`
packets are normal for each NPC, and the 60-packet queue seen at 18:02:48.720
drains by 18:02:53.709. The scheduler overruns establish server stalls, not a
specific native fault. No root cause or client fix is established by this log.

## Diagnostics for the next reproduction

`Session.ActorLifecycleTrace.cs` retains the latest 128 actor lifecycle records
per Session, with bounded single-line entries. Ordinary proximity construction
and removal record actor ID, class, script, unique ID, native map-object binding,
actor/viewer zones and positions, actor-table generation and UTC timestamp.
Actor-table resets, visibility release and the exact mass-cleanup keep IDs are
also recorded. Routine position/property updates do not fill the history.

At the beginning of player session cleanup, before teardown adds removals, the
history prints once under `[ActorLifecycleTrace]` in the normal server log. This
also happens on an ordinary logout; the presence of a report does not prove a
crash. Sequence gaps at the start mean older records fell out of the bounded
history. Entries describe server publication, not receipt or execution by the
client. They do not cover every direct actor-packet publication outside the
Session proximity path, and cannot substitute for a native stack trace.

Once the rebuilt Map Server is deployed, reproduce the same company warp and
walk. Retain the log from the warp through the complete `ActorLifecycleTrace`
report and session removal. No files from the remote PC are required for this
capture. Packet ordering, cleanup policy, SQL and movement are unchanged.

## Verification

The seamless-zone harness exercises bounded concurrent history, detached
snapshots, line/length limits, one-time reporting, actual Session construction
and removal, suppression of duplicate/rejected spawns, complete multi-chunk
keep IDs, NPC metadata and zero packets emitted by diagnostics. Existing peer
arrival and seamless-boundary checks run alongside these cases. This is a
diagnostic change awaiting a new reproduction, not a verified crash repair.

The isolated Release build passed. The 14 new diagnostic checks, existing peer
checks and 2,485 seamless scenarios passed, as did `--teleport-handoff-only`
(including 20 consecutive company warp callbacks) and `--post-landing-ready-only`.
The build retains existing package-advisory and obsolete-fixture warnings.
Output is under `.codex-build/walking-crash-diagnostics/`; no running server was
replaced or restarted. The diagnostics require deploying the rebuilt server
before a subsequent incident can produce this history.
