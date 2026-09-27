# Storyline scenes and private battle transitions

Status: implemented and tested offline on 2026-09-16. The matching DLL has not
been installed in the running server, and these six scene guards have no live
client acceptance yet. This layer does not enable quests or repair their NPCs,
encounters, placements, rewards, or missing dialogue.

## Reuse the shared path

`Data/scripts/private_quest_battle.lua` adapts the shared GC launcher for other
storylines. Allocate the private area, actors and director before playing the
source movie. Keep the recovered client director class separate from the
server's Lua filename. The launcher captures the public return position before
entry, checks explicit transfer admission, and retains scene owners until the
client has acknowledged its destination and actor visibility is ready.

For a recovered delegate that plays **one native movie**, add `preScene` beside
the existing source delegate, or `successScene` beside its aftermath delegate.
The name is case-sensitive. The shared runtime automatically uses
`Data/scripts/story_scene.lua`; it also guards the director invitation before
the aftermath's `kickEventContinue` yields.

Actual Com0l1 bindings:

```lua
-- Source quest launcher config
preEvent = "processEvent_020",
preEventArgs = {false},
preEventAfterWarp = true,
preScene = "COM0L105",

-- Private director runtime config
successEvent = "processEvent_030",
successEventArgs = {1},
successScene = "COM0l110", -- lowercase l is intentional
```

Preserve recovered delegate names, argument positions and types. Packed argument
tables can supply `n` to retain interior/trailing nils; no arguments remains no
arguments. The aftermath value above is the explicitly documented native
NumberClip baseline, not a recovered retail familiarity predicate.

Existing dialogue or compound delegates omit `preScene`/`successScene` and retain
the existing lease-only behavior. Do not add a movie guard to an unexamined
delegate, a menu, or a branch that may play zero or several movies. A custom
aftermath may call `story_scene.play(area, player, quest, delegate, args, scene,
afterWarpSource, director)` once per recovered single-movie operation, checking
its Boolean result before sequence changes/rewards. Omit `director` when already
inside the appropriate owned event. The optional invitation is for that area's
own content director. This first adapter is for leased private quest content;
it is not a global replacement for ordinary event handling.

On a successful launch, return from the quest script without `EndEvent`.
On an aftermath return, keep the director/NPC and event until the shared return
transition completes. Do not replace an AfterWarp recovery with a position-only
packet or an invented fade call. Do not grant rewards before a yielding movie
and assume a retry cannot repeat them; reward idempotency belongs to the quest.

For an ordinary opening GC quest dialogue, capture its data and sequence before
the native call, then check `CanContinueGrandCompanyQuestDialogue` after the yield
and before giving/consuming items, progressing or completing. Accepted stages
use `CanContinueQuestBattleQuest` for the current connected Player and exact
accepted Quest/Data references. Unaccepted stages instead require the exact
current published offer, its unstarted sequence and no accepted journal copy.
On a stale continuation return without ending a
replacement event. Capture afresh for each yield, since acceptance or a previous
handoff may have changed the stage. Com0[lgu]1–4 demonstrate this pattern and
have 41 accepted dialogue boundaries plus their offer dialogues covered by
interruption regressions. The server acceptance entry point separately rechecks
offer identity for all eighteen requested quests before writing a journal.
The adapter is not an event-generation
lease for a replacement conversation about an unchanged quest and stage.
The shared Toto-Rak and Darkhold quest helpers return the native result plus a
continuation-valid Boolean. Their callers check that Boolean before another
dialogue, entry or mutation; Toto-Rak propagates stale handling through its outer
onTalk rather than performing its ordinary final EndEvent. Their 51 dialogue
paths have the same interruption coverage. Do not interpret a failed continuation
as a declined Yes/No answer and then close whichever event is currently active.

## What the guard establishes

| Stage | Evidence / deadline |
| --- | --- |
| Director invitation | Exact invited owner and `noticeEvent`; 45 seconds |
| Movie start | Matching 40-byte native `0x00CE`, selector 0; 45 seconds |
| Playback | Matching terminal selector 1 or 2; up to 15 minutes including dialogue reading |
| Continuation | Original blocking Lua delegate returns; 15 seconds after terminal |
| Entry/return | Existing scoped transition waits for `0x0007` and post-landing visibility |

These deadlines are server recovery policy, not recovered retail timing.
Duplicates and unrelated packets cannot extend them. A movie that outlasts the
older area staging deadline gets 30 seconds to publish entry only after its
native terminal and original RPC are both proved. A closed area cannot revive.

The native terminal selectors do **not** encode the callback's success Boolean.
Their trailing four bytes are opaque. An empty RPC alone is not movie proof.
A generic empty dispatch rejection is deferred on the exact guarded Lua waiter,
preserving the original callback until it arrives or the stage expires.

Each guard binds the exact Player, Session, connection, area, actor generation,
event tuple, last event-close stamp, Lua coroutine and one-use token. Reopened
events, newer sockets and replacement logins cannot inherit it. Cleanup cancels
the exact old coroutine. A continuation missing from all wait registries gets
a ten-second handoff grace before abandonment recovery.

If native callback completion cannot be established, the guard disconnects the
captured connection without sending `EndEvent` or a forced warp. This deliberately
uses reconnect recovery: the ferry investigation showed that clearing a native
event while its callback still owns it can crash the client. The existing content
lease then drains the abandoned encounter; persisted return points handle private
content on reconnect. Earlier safe transfer failures still use the staged source
reload and bounded return retries described in
`gc_quest_transition_safety_2026-09-16.md`.

## Current adoption and evidence

| Quest | Before battle | After battle |
| --- | --- | --- |
| Com0l1 / 111401 | `COM0L105` | `COM0l110` |
| Com0g1 / 111601 | `COM0G105` | `COM0G110` |
| Com0u1 / 111801 | `COM0U105` | `COM0U110` |

These names are recovered in `outputs/job-gc-decomp-20260907/bytecode/com0l1.txt`,
`com0g1.txt`, and `com0u1.txt`, also recorded in
`outputs/gc-mission-decomp-20260904/event-traces.json`.
`tools/inspect_gc_transition_scenes.py check` verifies the pinned aftermath
resources and chosen native defaults. Scene completion remains client-reported
evidence, not proof that every frame rendered correctly. All 18 requested GC
quests remain disabled pending their separate readiness work.

## Diagnose and verify

`[StoryScene]` logs carry a unique `token`, player ID, private area, scene, phase,
event owner and actor generation. Follow one token from `begin` through
`event-accepted` when invited, two `native` state changes, and `rpc-complete`.
Failures identify `timeout-invitation`, `timeout-start`, `timeout-playing`,
`timeout-continuation`, `continuation-abandoned`, `client-lua-error`,
`unproven-continuation` or `ownership-changed`. After successful playback, follow
`[QuestBattleTransition]` for the same player to verify actual map landing.

Build outside the active server output, then run:

```powershell
dotnet build 'Map Server/Map Server.csproj' -c Release -o .tmp/gc-transition-fix --no-restore
dotnet run --project tools/job-gc-lifecycle-tests/JobGcLifecycleTests.csproj -c Release --no-restore -- --server-assembly '.tmp/gc-transition-fix/Map Server.dll'
dotnet run --project tools/ferry-transport-tests/FerryTransportTests.csproj -c Release --no-restore -- --server-assembly '.tmp/gc-transition-fix/Map Server.dll'
dotnet run --project tools/grand-company-runtime-tests/GrandCompanyRuntimeTests.csproj -c Release --no-restore
python -B tools/inspect_gc_transition_scenes.py check
python -B tools/test_gc_mission_decomp.py
python -B tools/validate_grand_company_quests.py
python -B tools/validate_quest_availability.py
```

The scene checks cover both native terminals, malformed/wrong/duplicate packets,
early or late RPCs, all four deadlines, rejected invitation/dispatch, client Lua
errors, cancelled continuations, reopened events and replacement connections.
Production checks load the actual server assembly with in-memory actors; Lua
checks use the real helper and shared runtime. They do not run the full SQL/map
pipeline or the game renderer.

Before accepting a newly authored route, watch and skip both movies in the
client, verify quest advancement only once, test movement/NPC interaction after
return, and check retry/reconnect plus party helpers. Install Lua and its matching
DLL together at a safe restart before testing; older running DLLs do not expose
the new APIs.
