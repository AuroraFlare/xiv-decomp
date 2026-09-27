# Seamless zone stall, 2026-09-26

## Incident evidence

The supplied client capture enters the Lower La Noscea / Eastern La Noscea
seamless merge strip immediately before gameplay replies stop. This identifies
a reproducible boundary to exercise; the original process was not available
for a thread dump, so the exact two blocked thread stacks remain unknown.

Source files were read as diagnostic data, not instructions:

- `packetlogger.csv`, supplied from the user's Downloads directory, SHA-256
  `6896D775BD30A0A32FA492723D1BFF889FA5E20C7A742F3A68F982A819E8EAB9`.
- Supplied `Pasted text.txt`, SHA-256
  `416CE7E754A1865A126CFFBBA619D2115D4E9D1E7C4DE10D2F768F9882775B88`.

The CSV uses UTC; the pasted server log uses EDT (UTC minus four hours).
Each CSV record can contain multiple base packets and subpackets. Decode their
lengths and counts before interpreting movement: the CSV's `opcode_hex` alone
does not describe every enclosed message. Production layouts are defined by
`Common Class Lib/BasePacket.cs`, `Common Class Lib/SubPacket.cs`, and
`Map Server/Packets/Receive/UpdatePlayerPositionPacket.cs`.

| EDT time | Evidence |
| --- | --- |
| 02:32:46.010 | Transport diagnostics report an empty outgoing queue and a healthy attached socket. |
| 02:32:48.295 | An outgoing movement sample reaches XYZ `(890.946, 57.772, -305.895)`. |
| 02:32:48.532 | Last incoming gameplay data before the gap. |
| 02:32:54.919 | First persistent `frame is still waiting pendingMailboxes=2` warning. |
| 02:38:40.594 | Last supplied warning still reports the same pending count. |

Main SQL boundary row 5 joins zones 128 and 130 and defines a merge rectangle
with X from 887 to 901 and Z from -332 to -304, without a height constraint.
The movement sample above lies inside that rectangle. This comparison reads
existing runtime boundary data; it does not change or infer any placement or
map calibration. The client continues sending movement after gameplay replies
stop, consistent with the user's report of local movement during a disconnect.

## Confirmed code defect

Before the correction, `WorldManager.MergeZones` inserted the same `Player`
object into both public zones' actor tables, while `CurrentArea` still denoted
only the primary zone. `Area.Update` held its area actor-table monitor and
called `Update` on every listed actor. Independent zone workers could therefore
advance the same player's AI, status effects, and other mutable state at once.
Cross-zone membership operations also ran within one zone's mailbox.

`FixedStepMailboxScheduler` waits for all owners before running global systems
and issuing the next frame. A blocked owner consequently stalls the simulation.
The incident timing strongly implicates the seamless merge, but neither the
packet capture nor the pending count alone proves a particular lock cycle.

A solo-compatible lock inversion exists in the pre-fix production call graph:

1. The neighboring zone B holds B's actor-table monitor while updating the
   visibility-only player alias.
2. `Player.Update` calls `CombatClaims.Pulse`, which holds the session's
   client-state monitor during its packet batch.
3. `BattleNpc.ShouldPresentCombatClaimTo` builds claim members and resolves the
   player through its primary area A, requiring A's actor-table monitor.
4. Meanwhile, A can hold its actor-table monitor while a mob broadcast checks
   `Session.IsActorKnownToClient` / `HasPendingBattleNpcRemoval`, requiring the
   same session monitor.

This does not require a multiplayer party. The supplied log records active
Longlegs enmity before the boundary crossing, making this a relevant candidate
for the incident. It remains a demonstrated possible call-chain inversion,
not a recovered thread dump from that run.

The correction must preserve neighboring actor visibility, give each actor a
single simulation owner, coordinate operations that cross ownership boundaries,
and retain parallel execution for independent zones. Skipping the frame barrier
after a timeout would not satisfy these requirements.

## Correction

- `Area.Update` copies its cached actor snapshot under the collection lock, then
  releases that lock before invoking actor callbacks. It rechecks exact object
  registration and primary `CurrentArea` ownership for each update. A weakly
  held per-actor tick claim permits at most one update for a frame timestamp
  across an ownership handoff; it does not promise a tick in both transfer
  orderings or add catch-up work.
- Secondary seamless membership uses dedicated visibility add/remove paths.
  It does not reset player temporary state or invoke owned departure cleanup.
  The secondary spatial bucket follows accepted movement.
- An inbound packet's execution-time preflight checks current ownership and
  session identity, the movement's swept boundary path, and existing seamless
  visibility state. Operations requiring cross-zone ownership release the
  reader lease before taking the existing exclusive writer lease. The source
  mailbox and ordered receive call remain occupied until the operation finishes.
- Direct `SendInstanceUpdate` calls use the same boundary check. When called
  within an owner callback, their cross-zone pass is deferred until that callback
  releases its reader lease, then runs before mailbox/frame completion. Session
  lifecycle guards reject obsolete deferred work.
- Combat selection and aggro reject actors belonging to another area even when
  those actors are visible through the neighboring zone. Generic visibility is
  preserved. Attack dimensions, range settings, SQL, and placements are untouched.
- A future stuck-frame warning includes outstanding zone names/IDs in addition
  to the count. The scheduler retains its frame barrier and independent-zone
  parallelism.

Existing hard-zone asynchronous sequences retain their exclusive continuation
context. This change does not migrate arbitrary Lua coroutines captured against
an old area or claim to make every cross-area script safe.

## Verification

The baseline at commit `7d0c3d987` was built into
`.codex-build/seamless-ownership-20260926/baseline` before editing production
code (zero errors; five pre-existing warnings). A disposable harness called
the real `Zone.Update` for zones 128 and 130 with the same actor in both
visibility tables, `CurrentArea` set to 128, and the same frame timestamp.
It exited with failure:

```text
One frame, one actor, two visibility memberships: updates=2; expected=1
```

That reproduces the duplicate update through production code, independently of
whether a particular run hits a lock inversion. Against the first corrected
host build, the same unchanged probe reports `updates=1; expected=1` and exits
successfully. Permanent regression results are recorded below after review.

- Shared map-coordinate and map-registry suites: **34 tests passed** with
  `python -B -m unittest tools.mobspawns.test_map_coordinates tools.mobspawns.test_map_registry`.
  The initial sandbox run failed to access Python-created temporary directories;
  the unchanged suites passed outside that sandbox. No coordinate bindings or
  placement data were modified.
- The final Release host passes the Garuda reflection-based suite: **368
  checks**, covering cast outcomes, displacement, geometry, command metadata,
  and wind readiness.
- The broader `tools/validate_dzemael_darkhold.ps1` source and seven Lua parse
  checks reach the data-placement suite, which has **15 errors in 42 tests**.
  These reject historical frozen floor records such as `mob.feasting_chain_c`
  and `wave.knights.01`. Those Python validators and placement inputs are
  unchanged by this fix. A rerun outside the sandbox removes temporary-file
  errors but retains these historical-data failures. They are not claimed as
  passing, and no placement is changed to suppress them.
- Standalone Dzemael traversal suite: **84 checks passed**.
- Final Release host: **8,038 Dzemael production encounter checks passed**.
- Shared resource-packet, weapon-draw and end-of-patch 1.23 combat contracts:
  **passed**.
- Shared detection-range and aggro/hitbox contracts: **passed**, including
  **244 dungeon-aggro checks across all 16 dungeon zones and outdoor boundaries**.
- Focused seamless ownership regressions and the complete zone-mailbox suite:
  **passed**, including actual captured-boundary classification, stale dispatch,
  primary-owner updates, same-frame handoff, obsolete snapshot rejection,
  observer visibility/state preservation, parallel ordinary work, ordered
  writer fallback, deferred completion, and exclusive continuation after await.
  Existing navmesh, QuickNav chase/territory return, inn privacy, inn login,
  private/content-area affinity, and scheduler tests also pass.
- Existing seamless-zone suite: **2,485 scenarios passed**, plus actor lifecycle,
  peer arrival/readiness, party login/Return and full-map marker regressions.
- The two data suites normally run after the failing historical placement gate
  were run separately: **six mage-warp tests and three Approach-Eye tests passed**.

The final Release host used by these runtime checks is
`.codex-build/seamless-ownership-20260926/final/Map Server.dll`, SHA-256
`7D7266700668C55BD272C0B3D894D5E30906CC927E8E21055E675938AF6B2F10`.
This integration build includes the concurrent workspace's mob-lifecycle edits,
which this task did not author or revert. The final build has zero warnings or
errors. All 547 recorded C#/project inputs remained unchanged through building
and runtime verification; both isolated ownership/seamless harnesses loaded the
same DLL hash. The full runtime suites above were rerun against this final host.

Implementation used `gpt-5.6-sol` at max reasoning effort, with design and final
review by `gpt-6-astra` at max effort. The final review found no blocking issues.

No running server was restarted or replaced. Live acceptance should cross the
128/130 merge strip in both directions while a mob is pursuing the player,
linger/reverse in the strip, and confirm continued movement acknowledgements,
combat eligibility, neighboring actor visibility, and advancing server frames.
The offline regressions are not a live-client acceptance claim.

## Repeating the focused checks

Run from the repository root in PowerShell. The five-level test output preserves
the existing full mailbox harness's relative fixture paths.

```powershell
$mapOutput = (Resolve-Path '.codex-build/seamless-ownership-20260926/final').Path
dotnet build tools/zone-mailbox-tests/ZoneMailboxTests.csproj -c Release -m:1 -p:UseSharedCompilation=false "-p:MapServerBuildDir=$mapOutput" "-p:MeteorCommonBuildDir=$mapOutput" -o .codex-build/seamless-ownership-20260926/tests/zone-mailbox/net10.0
dotnet .codex-build/seamless-ownership-20260926/tests/zone-mailbox/net10.0/ZoneMailboxTests.dll --seamless-ownership-only
dotnet .codex-build/seamless-ownership-20260926/tests/zone-mailbox/net10.0/ZoneMailboxTests.dll
dotnet build tools/seamless-zone-tests/SeamlessZoneTests.csproj -c Release -m:1 -p:UseSharedCompilation=false -p:UsePrebuiltMapServer=true "-p:MapServerBuildDir=$mapOutput" "-p:MeteorCommonBuildDir=$mapOutput" -o .codex-build/seamless-ownership-20260926/tests/seamless-zone/net10.0
dotnet .codex-build/seamless-ownership-20260926/tests/seamless-zone/net10.0/SeamlessZoneTests.dll
```

The optional prebuilt assembly paths affect only these test harnesses. Their
normal default build/reference behavior remains available.
