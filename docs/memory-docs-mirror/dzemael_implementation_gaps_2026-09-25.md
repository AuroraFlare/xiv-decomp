# Darkhold implementation gaps, 2026-09-25

The current code already implements the encounter, routes, devices, scenes,
transporters, rewards and accepted 175-point placement layer. A parallel review
against the runtime guide and completion audit found three additional gaps.
The first pass implements them without changing placements or authoring new boss
damage, interruption, loot probability or retail timing policy.

The September 26 work additionally corrects terminal contributor eligibility,
charging continuity and normal-party entry. Eye navigation first gained frozen
recorded-graph support, followed by the native-mesh integration described below.
Each verification section identifies its own build; earlier hashes and counts
remain historical.

## Reconnect presentation

Director publication was repaired on reconnect, but the opening request belonged
only to the original entrant's Player/Session. After that request was consumed,
no reconnect path invoked native `relogin`, leaving the duty widget unrestored.

The new `resumePresentation` invitation is separate from the original opening.
Only an admitted current Player/Session can consume it, once, after the owned
director is published and the shared event slot is available. Active runs keep
`ExpiresAtUtc`; reconnects during the reward window keep `FinishAtUtc` and the
native clear flag. The latter preserves the client's cleared-state behavior,
which does not display the active-duty widget. Neither path replays a cutscene
or extends a deadline. Cleanup, stale generations, foreign actors and replaced
sessions invalidate the request.

`ReconnectPresentationChecks.cs` exercises production invitation delivery and
claims plus the actual root director Lua. Native UI rendering remains untested.

## Coffer recipients

Disconnect marks a Session disconnected before removing its Player from the
area. The previous nonnull-session filter could therefore award and persist loot
to that disconnected actor while its outgoing notification was dropped.

Ordinary coffer delivery now requires a connected, nonsuperseded session, exact
session/Player/area registration, and admitted participant membership. Each item
grant rechecks that snapshot under the session lifecycle gate. Dead connected
participants remain eligible. Recipient rejection keeps the original pending
roll; successful items keep their existing delivery ledger. The separate personal
Enchiridion resolver is unchanged.

`CofferRecipientChecks.cs` exercises actual disconnect state and the production
recipient gate, pending-roll retention, and dead-player eligibility.

## Main SQL parity

The optional `dzemael_bnpc_mob_types.sql` seed contained full authored profiles
that the main loot SQL did not fully reproduce. For example, main SQL left
Deepvoid's HP at zero and the Eye profiles' levels unset, relying on runtime
fallbacks, while the optional seed supplied their existing runtime values.

Main `server_battlenpc_mob_types_loot.sql` now includes the same 18-profile upsert
after earlier enrichment. It writes only the fields already supplied by the
optional seed and preserves other columns, including native resistances and
ranged overlays. The existing scoped Chain Bearer and Forsaken Soul hover
corrections remain after it. No live database was changed.

A bounded read-only log review also found repeated September 20 spawn failures
for profiles `3144/2300401`, `3134/2303101` and `3038/2301701`; all three are
included in the canonical overlay. A later September 20 run published its
Approach population and accepted its opening invitation. Those historical
logs do not verify the current database or client presentation.

The three `test_darkhold_profile_sql.py` tests failed before the main overlay
was added and pass afterward. They compare main/optional profile statements and
execute the upsert in an isolated SQLite fixture with only MySQL upsert spelling
translated, covering repair, repeat application and unrelated-field preservation.
This is not a live MySQL import test.

## Offline verification

The final production harness passes **2,480 encounter checks**, including the
new reconnect cases and **16 focused coffer-recipient checks**. Traversal passes
84 checks. Production door/Lua integration passes 432 checks, and its seven
route ground guards complete 29,310 steps. Scripted-route and world-door
proximity suites also pass.

The Python Darkhold suites pass **68 tests**, including the three main-SQL
parity checks. The static validator passes seven Lua parses, 42 placement tests,
six mage-ground tests and three Approach Eye tests. All **11 native asset audits**
and **18 current or frozen placement-layer checks** pass. The coordinate and
registry baseline passes 19 and 15 tests respectively; neither shared map module
was changed.

Build output and intermediate files are isolated under
`.tmp/dzemael-audit-20260925/`, preserving the standard server binaries. The build
has the existing dependency advisory and Blowfish warnings.
The tested `runtime/Map Server.dll` SHA-256 is
`18A1456CF29EF4007F5F547C0D89A98F582F023541ECE5642B0897858B85A155`.

## September 26 follow-up

Terminal charging previously accepted a superseded session until cleanup and
could continue after the terminal was removed, because removal retains its old
CurrentArea pointer. The current gate requires the admitted, registered Player
and exact live Session, plus the exact registered terminal actor. The new
production cases exercise actual supersession, disconnect and actor removal.

Character IDs also survive reconnect. Per-device continuity now tracks the
Player, Session and actor-instance generation, so a replacement cannot inherit
the preceding session's unsampled interval. Continuing occupants retain their
earned charge; replacing the whole group resets charge even without an empty
tick. The GM diagnostic hold likewise needs its minimum set of continuing
lifetimes. Existing capacities, radius, height tolerance and charging formula
are unchanged.

The Eye previously interpolated all ordered route segments directly. Its scoped
planner now tries a separate frozen recorded graph and validates the entire leg
before moving, including bounded continuation of partial query results. The
initial audit found long complete graph detours, including 118.68 yalms for a
5.31-yalm original segment. A new authored guard permits graph paths only within
the original segment's narrow envelope, using the existing stop arrival and
height tolerances as deviation bounds. These are not recovered collision
clearances. Missing or rejected graph coverage can use only the original
reviewed ordered segment while the Eye remains on it. Off-segment failures hold.
This supplies partial graph support; broader navigation remains unresolved.
The original five route
files, their waypoint source, cast stops, sector transfers and speed remain
unchanged; the new source is not merged into the older placement recording.
See `docs/dzemael_eye_navigation_2026-09-26.md` for the coverage and evidence audit.

### Follow-up verification

The final isolated build passes **5,283 encounter checks**, including **2,778
focused Eye navigation checks** and **25 terminal eligibility/continuity checks**.
The terminal cases fail 20 assertions against the preserved September 25 DLL
(`18A1456C...` above) and pass all 25 against this build. These are production
runtime regressions, not only source-text assertions.

Traversal passes **84 checks**; production door/Lua integration passes **432**,
with **29,310 route ground-guard steps**. Shared scripted-route, world-door,
QuickNav chase/territory-return, detection-range, aggro/hitbox and combat-contract
suites pass, alongside **368 Garuda cast/geometry checks** against the same DLL.
The final static validator passes seven Lua parses, 42 placement,
six mage-ground and three Approach checks. The Python baseline also passes
68 Darkhold, 19 coordinate and 15 registry tests.

The final audit selects **132 recorded-graph legs and 548 reviewed fallbacks**
from exact original route stops. Every selected path installs successfully and
stays within the new segment bound. This does not prove client collision safety,
and runtime positions can affect which permitted source is selected.

That build's DLL is preserved at
`.tmp/dzemael-audit-20260925/before-entry-runtime/Map Server.dll`, SHA-256
`803FD1042C6F1C94C898DE1710536CDBB2DCF055D2A9F895D3D5F014F136E7F1`.
All Darkhold, shared-navigation and harness sources stayed unchanged through
the final build and tests. The 588-file input audit detected one concurrent
unrelated change to `Player.LittleLadies2012.cs`; the DLL hash identifies the
artifact actually tested. Standard server binaries were not replaced.

Exact `.gitattributes` entries preserve the six hashed runtime input files across
Git line-ending conversion. Filtered and unfiltered Git hashes match for all six.

## Later September 26 follow-up

The later September 26 [normal-entry correction](dzemael_entry_eligibility_2026-09-26.md)
rejects retained disconnected/superseded party actors and stale identity bindings
before content creation. Its 13 production checks reproduce eight failures in
the previous tested DLL and pass after correction. The earlier build hashes
and verification counts above remain historical.

### Native Eye navigation

The detailed source, movement and map audit is
`docs/dzemael_native_eye_navigation_2026-09-26.md`; reproduce its saved evidence
with `tools/inspect_dzemael_native_eye_navigation.py check|render`.

The installed `roc0Dungeon01.nav` has an explicit zone-231/layout binding and
1.23b source manifest. The earlier absence of a SharpNav file did not establish
the absence of native navigation: this asset uses the supported XIVNAV format.
The new planner selects a reviewed native corridor first, then an exact edge
from the original frozen recording, then the separately frozen newer graph,
then the original reviewed waypoint fallback. Each leg chooses a whole source
before moving. Local node IDs and heights are not merged between recordings.

The native ledger contains 388 candidate directed legs with measured endpoint
floor differences. Runtime's stricter interior checks accept 372: sixteen
candidates lack exact-X/Z polygon support at an interior sample and fall back
before movement. Its one-yalm endpoint attachment window is a new authored
policy. It is not a recovered retail clearance or an error bound for the mesh.
Interior heights come from native polygons at their own X/Z; original route
stops retain their exact XYZ. Door-anchor screening preserves the current stage
gates but does not provide dynamic door collision geometry.

Route attachment still requires both hash-validated frozen recordings. The
native mesh and ledger are optional as a pair: their failure permits the
recorded providers, and that native load failure is cached until process
restart. Successfully loaded sources are immutable process snapshots. This is
distinct from the existing retry behavior for required recording files.

The first native movement candidate exposed a smoothing defect: the shared
movement routine can collapse several short samples into one chord across a
bend. The production movement harness found 22 unsafe-chord assertions even
though all original endpoints and held stops were reached. That candidate is
preserved under `.tmp/dzemael-audit-20260925/before-native-chord-fix-runtime/`,
with Map Server DLL SHA-256
`96CC96AB6AAF0CB6CDFFF1764AB64DE610F44EC34AB5FA6A9BE0CF038E55EE8B`.
It was never deployed.

The Eye now validates each published native movement step. If smoothing would
cut an unsafe corner, it advances only to a safe consumed path point and keeps
the remaining path for the next normal tick. Exact endpoint arrival precedes
the held cast; a replan retains its selected provider for that directed leg.
Other movement callers keep their existing defaults.

The resolver also has a lifecycle commit guard. Cancellation or route replacement
while a calculation is running invalidates its result, including the failure
path, so old work cannot clear or overwrite replacement movement. Expensive
resolution runs outside the controller's commit gate.

The client checks for this pass are appended to
`docs/dzemael_client_verification_2026-09-15.md`. All original route files and
the accepted 175-point placement manifest remain unchanged.

### Final integration verification

The final isolated build passes **8,038 production encounter checks**, including
**5,520 Eye navigation checks** and **13 normal-entry checks**. The navigation
report covers all 680 directed legs and 18,796 tested movement ticks, with no
unsafe published native chords, incorrect endpoint arrivals or lost held stops.
The same report bytes reproduce the selected-path audit and both inspected
native-map overlays.

The same DLL passes 84 traversal checks, 432 door/Lua checks and 29,310 door-route
ground-guard steps. Shared scripted-route, world-door, native-provider, QuickNav,
detection-range and combat-contract suites pass, along with 244 aggro-semantics
and 368 Garuda checks. Data-only validation passes 68 Darkhold Python tests,
19 coordinate tests, 15 registry tests, all eleven native asset audits and all
eighteen current/frozen placement-layer audits. Static validation passes seven
Lua parses, 42 placement tests, six mage-ground tests and three Approach tests.
The new native path audit also passes independently. No shared map binding or
accepted placement was changed.

The final artifact is `.tmp/dzemael-audit-20260925/runtime/Map Server.dll`, SHA-256
`E2EDD480D771C09A37AF1F7CAAA3B9CF4FE21B7AF8E232522B83690EE798486F`.
The encounter harness SHA-256 is
`A7E22C42D60DE42B76C9BB308546B2658421498FD1B4D3261747F1A11441667F`.
The incremental build has zero errors and four existing dependency advisory
warnings. Logs and source/result JSONs use the `integrated-final-` prefix under
the isolated audit directory. The preceding tested `B754E9A8...` build is
preserved in `before-concurrent-integration-runtime/`.

The 622-input snapshot confirms Darkhold and shared native-route sources stayed
unchanged through final testing. Other chats subsequently changed
`AurumValeManager.cs` and `Dungeons/AurumValeRoute.cs` and added
`Dungeons/AurumValeCoincounterAdds.cs`. Those later Aurum changes are not part of
this tested binary; no claim is made that the entire concurrently edited
checkout is frozen. The prior Cutter shared-AI changes were included in this
final build and passed the shared regressions. Standard server binaries and
the live database were not changed.

## Evidence-limited gaps

The native coffer message identifies an integer gil amount parameter, but the
review did not recover a payout range or a party allocation rule. Individual
video amounts are observations, not enough to implement that policy. Gil
rewards remain unresolved.
The [gil follow-up](dzemael_gil_evidence_followup_2026-09-26.md) preserves a new
period eight-player, v1.18a gold-coffer observation of 2,265 gil without turning
the observed amount into a payout bound or party-scaling rule.

The Monk and White Mage AF quests still lack exact physical coffer/objective
bindings and a supported ordinary-loot fallback. The available client acquisition
event receives the server's chosen item and does not recover that selection
logic. `docs/dzemael_af_coffer_eligibility_2026-09-19.md` retains those constraints;
this pass does not enable unfinished quests or change the separate Enchiridion
resolver.
The [AF binding follow-up](dzemael_af_coffer_binding_followup_2026-09-26.md)
adds period primary testimony for Healer's Culottes in the Darkhold Drake room,
but does not recover the physical event-owner binding or ordinary fallback.

## Acceptance still open

No server deployment or restart is part of this pass. The existing client
checklist remains authoritative for fresh-entry scene/widget rendering, normal
party charging, effects, patrols, travel, loot and floor acceptance. Also retest
disconnect/reconnect during an active run and during its reward window, checking
that the original deadline is retained and no earlier cutscene repeats.
