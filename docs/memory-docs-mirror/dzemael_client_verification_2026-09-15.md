# Dzemael client verification — 2026-09-15

Status: **three historical solo entry tests failed to show the opening scene or
duty widget; the diagnosed type-`0x50` handshake correction is deployed and the
fourth client test is pending**. The third run captured the owned request but a
parameterless native occupancy event held its event slot. Root Lua now closes
only that handshake so the guarded full-payload invitation can retry. Standard
Release Map Server PID 30908 started at 06:36:17 on 2026-09-16 with zero sessions.
The current standard Release Map Server DLL has SHA-256
`5A983FFDF1525AE8D1BBB31786AE9A4AAE5782196DF49C4029E399BA0DFBB973`.
Map Server PID 76920 started at 21:54:17 and logged
`Map Server has started @ 0.0.0.0:1989` at 21:54:50.646. At the switch it had
zero attached client sessions. The later roster correction removes eleven
unmatched ordinary homes and relocates the unrecorded tenth seal warrior to
primary nav node 1287. Its 174-point manifest and runtime source passed 42 static,
18 coordinate, 2,314 production encounter and 84 traversal checks, plus Debug
and isolated Release Map Server builds. The server switch loaded this Release
assembly; it published the corrected roster in the user's third solo run.
A later screenshot adds a separate upper Bone Nix, bringing the offline manifest
to 175 static points and 115 spawnable mobs. Its placement and the Eye's smoother,
faster route are built and tested but await a safe live-server restart.
The old 185-point DLL is backed up under `.tmp/dzemael-user-replacement-release/`.
The replacement build preserves the guarded director-ready opening event and
Eye transfer fix that still await a user-operated client retest.
The configured
database's one owned Chain Bearer profile was
updated from hover zero to 0.9 and read back at 0.899999976. These disk/DB
checks do not prove a later process has loaded the assembly, or that the client
renders the opening scene, widget or floating ghosts. The earlier hash table
below records a prior Release build.
The user confirmed that the client/server setup is on this computer and reported
no cutscene or duty widget after `!dzemael enter cs`. The earlier setup check
found no running processes; the live test now has Release servers running. The
original combat-test build is under `.tmp/dzemael-retail-tests-20260914`.
The subsequent normal `Meteor.sln` Release build succeeded (zero errors,
47 existing dependency, legacy reference, analyzer and compiler warnings).
Current executables are `Map Server/bin/Release/Map Server.exe`,
`World Server/bin/Release/World Server.exe` and
`Lobby Server/bin/Release/Lobby Server.exe`. Confirm the usual launcher uses
these outputs; a Debug build or another installation can still be stale.
The user operates the game window; this task has no native game-control tool.

The normal-output encounter harness also passes all 2,254 checks. Its copied
Map Server and common assemblies match the Release files byte-for-byte:

| Release file | SHA-256 |
| --- | --- |
| `Map Server/bin/Release/Map Server.dll` | `14FD2A5075F5F0244DEFBCF36F39ADF985BEFC6A135EDFC1F94844AEE3728B9E` |
| `Map Server/bin/Release/Meteor.Common.dll` | `B1F6FB33824EF9FBF82DD084090656568010EA434BF9EEC4DAFCD978052B0EEA` |

Build log: `.tmp/dzemael-client-release-build.log`. For this Map Server output,
native server logging writes `Map Server/bin/Release/Logging/YYYY-MM-DD/map.log`.
No server was started and no database/configuration changes were made by this
build. Rebuilds can change these hashes; compare against the actual tested copy.

Work order: combat mechanics, terminal/presentation/travel acceptance, then
placements and patrols with the user. This pass does not request a new boss
damage or interruption audit. Record observed behavior separately from expected
runtime policy and retail evidence. The current requirement-by-requirement state
is pinned in `Data/raidroutes/dzemael_completion_audit_20260916.json`.

## Entry and evidence

For a normal 4–8 eligible-player run, use `!dzemael goto`, then `!dzemael start`.
For an initial solo presentation smoke test, use `!dzemael enter cs` (scenes are
also the default). Solo mode uses a separate 1.5-second control hold and cannot
prove normal charging. Do not use `nocs` for scene acceptance.

Capture `!dzemael status` and the relevant `!dzemael diag devices`, `boss`,
`doors`, `portals` or `lifecycle` output at a failure. Record party size, control
key, approximate duty-clock time, action and visible result. Keep Map Server
logs for the same time window. A command bypass such as `defeat`, `boss`, `map`
or a spawned `circle` must be marked as a GM probe, not ordinary progression.

## Combat mechanics

1. Earn the Deepvoid summon and observe its introduction and nine Chain Bearers.
   Keep the tank in front and use another attacker behind the boss. Establish a
   front/side-only baseline, then land a rear hit. Elbow Drop should become the
   next eligible reaction while preserving the boss's facing. It can wait for
   TP, recast, the existing delay, skill selection and the current action.
   It is not specified as an immediate counter. A solo fight cannot reliably
   maintain this front/rear setup.
2. After one accepted reaction, stop rear attacks and check that the same hit
   does not repeatedly trigger it. A new rear hit during a cast may queue another
   response. Disengage and re-engage to check that old pending hits are cleared.
3. Cross Deepvoid's 50-percent threshold once: check flame appearance and that
   the encounter continues; observe Chain formation changes and cast deferral.
   Do not infer an exact special-move interval from the six-second delay floor.
4. For Batraal, observe the initial engagement wave, the 80/40-percent waves,
   late Desolation availability and terminal mechanics. Check sword aura on
   empowerment, off for the north terminal and back after its existing deadline.
   Check visual cleanup on death. Existing thresholds/timing policies remain
   unchanged; this is a mechanics/presentation run.
5. Check that the All-seeing Eye and Soulgazer use the supplied purple, ringed
   minimap icon instead of the ordinary enemy dot. Confirm it on first entry,
   after leaving and re-entering actor range, and after a sector transfer. This
   is native marker type 7 through potential tier `-2`; routes, nameplates and
   targeting should otherwise behave as before.

## Charging, scenes and effects

| Check | Expected current implementation | Evidence still needed |
| --- | --- | --- |
| Normal-party controls | Capacities 2/4/6/8; ten seconds at full capacity, proportional slower charging below capacity. Four eligible players on an eight-capacity control should take about twenty seconds. | Live timing and eligibility; these values are authored, not a recovered retail formula. |
| Empty control | Leaving it empty resets progress; a later arrival gets no time from before arrival. | Observe an interrupted charge and fresh attempt. |
| Small/large circles | Circle artwork is separate from charge capacity; native variants have 2/3/4/6/8 arcs. | Small/large appearance, placement on the floor and disappearance at completion. |
| Completion effect | Unused/rearmed control keeps extra-stat bit 0x80; completion clears it and publishes the matching short effect once. | Visible one-shot; no stale effect on reconnect/range re-entry; rearm appearance. |
| Eye/Stables/Deepvoid/Batraal scenes | Earned progression and published actors precede eligible invitations; accepting invokes the owned native scene once. | Native rendering, skip/return, no duplicate invitation or duty-clock extension. |
| Busy events | Pending scene does not interrupt another event; cleanup or boss death cancels invalid pending playback. | Acceptance after busy event and cancellation behavior. |
| Gullet | Later-1.x policy does not force rad0r103 playback. | Ordinary unlock/traversal; no invented universal retail viewing rule. |

GM help now distinguishes Batraal controls: the north
`batraalenrage` control suppresses the sword aura; `batraalshield` controls the
barrier, and `batraalwest` controls the roaming eyes. Use the actual device key
from diagnostics when reporting a failure.

## Travel and completion

After earning the upper route, interact with the published inter-map transporter.
Check that the native yes/no prompt appears, No leaves the player in place, and
Yes ends the event before travel/loading/fade to the recorded destination. Test
the return transporter too. Standing on either transporter should not cause
an automatic inter-map warp. Avoid `!dzemael map` for this acceptance check.

After victory, check reward/coffer presentation and the five-minute reward
window. The separate victory exit retains its five-second standing hold.
Observe cleanup and a fresh entry for stale scene/effect/control state.

## Offline completion record

Deepvoid reaction: 55 focused checks; impact direction: 87 checks (14 reproduced
failures before the bearing correction). Combined geometry/direction: 319 checks.
Full encounter: 2,254 checks; traversal: 84; Garuda regression: 368; coordinates:
18 tests. Static validator: 7 Lua parses, 40 placement, 6 mage and 3 approach
tests. Shared combat and mob-aggro/hitbox contracts pass. Release builds succeed
with existing dependency-audit/feed and obsolete-API warnings where applicable.

The reaction review is
`Data/raidroutes/dzemael_deepvoid_reaction_review.json`. No SQL, positions, damage
or interruption settings changed in the reaction pass. No server deployment,
SQL import, restart or live-client acceptance is represented by these results.

## Live results

2026-09-15, first user-operated solo test:

- User command: `!dzemael enter cs`; user reports entering without a cutscene or
  widget and continuing to test. Entry presentation is a **failed** acceptance
  check; other checklist rows remain pending.
- All three servers run from the standard Release folders. Observed Map Server
  PID: 55176. The on-disk Map Server DLL hashes to
  `93F1CD935DC9687A3DA6902B1BFB63D996209AD26159EE0E4EDA1287F620C26A`,
  which differs from the earlier offline-tested fingerprint. This does not by
  itself establish the loaded process's assembly version or why it differs.
- `Map Server/bin/Release/Logging/2026-09-15/map.log` records `gm-test`, one
  player, zone 231 at 16:19:01.067; deferred director publication occurs at
  16:19:09.799 after accepted landing movement. The client sends `noticeEvent`
  with `params=false` at 16:19:09.821, selecting the setup-only Lua branch.
- Source at the time of this first test scheduled `eventNoticeCutScene` after
  2,200 ms from entry,
  independently of deferred director publication. The callback only checks
  current area and finishing state. The observed late publication makes early
  dispatch a plausible cause; the log does not prove the precise drop point or
  establish that this is the only defect. Do not fix it by merely lengthening a
  fixed timeout. Investigate publication/readiness and event ownership together.
- The same log contains repeated rejected Eye skill 23379 dispatches with zero
  TP/MP. This is a separate observed issue; its cause and visible consequences
  have not been established.

No code, live scripts or running processes were changed during this initial
observation. Leave untested rows pending; solo success does not complete
normal-party acceptance. Append later results with entry mode, party size and
matching timestamps.

First entry correction, after that observation: all three logged solo starts at
16:19, 16:40 and 19:00 show deferred director publication 6–9 seconds after
entry, followed by the client's own `noticeEvent` with `params=false`. The old
2.2-second `eventNoticeCutScene` and 5-second `relogin` timers ran before that
actor was ready. The original entrant now carries a one-use player/Session
request, marked ready only after successful deferred director publication.
The setup-event attempt called `_setInstanceRaid` and then depended on the
client producing its own `noticeEvent` to reach native `rad0r100` or the `nocs`
relogin/widget branch. The original `ExpiresAtUtc` deadline and one-use
session binding were retained. The standard Release assembly and root
`Data/scripts` contained this correction. Its production harness passed
**2,298** checks, but the live retest below exposed a missing event kick.

Second user-operated solo test, 21:02:50 local: `!dzemael enter cs` again
entered without scene or widget. Map Server PID 42940 started at 21:00:58 from
the standard Release path. The log shows Approach publishing 14 mobs with a
125-spawnable roster, confirming this process loaded the user placement layer.
Client movement at 21:02:56.296 released deferred actor publication; the
director was client-ready by 21:02:56.316. No later `noticeEvent params=false`
or `[DzemaelOpening]` accepted setup claim appears for this test. The original
timed kick had generated the earlier setup event; removing it left this entry
without an opening invitation. Director readiness alone did not start the scene.

Follow-up correction in isolated build: after the director actor is successfully
published, the original entrant's `OpeningPresentationRequest` captures a
`DzemaelGateScene` delivery with event command `openingPresentation`. The
production packet queue waits for client-known ownership, current session and
actor-table generation, a free shared scene invitation slot and no active event
or protected cutscene. Its incoming event consumes the one-use queued request,
calls `_setInstanceRaid` and invokes native `rad0r100` argument 1, or native
`relogin`/widget for `nocs`, with the unchanged original deadline. Cleanup,
timeout, replacement sessions and stale generations cannot replay it. Ordinary
setup events remain setup-only. The isolated production harness passes **2,301**
checks, including the queued packet, busy deferral, admission and Lua/widget
behavior. PID 42940 was the earlier failed process; the correction is now
installed in PID 41780, but client rendering remains unverified.

Eye route finding from the same live test: from 21:13:45 onward the log repeatedly
throws `Sequence contains more than one matching element` in `UpdateEarlyEye`.
The source searched `MobDefinitions.Values.Single` by pause skill, but the
definition dictionary includes aliases (`allseeingeye`/`eye` and
`soulgazer`/`gazer`) that repeat the same object. This is a route-profile
selection defect, not a coordinate or extra-Eye observation. Early, corridor
and Batraal transfers now resolve the exact canonical hazard definition by
actor class. The isolated build passes **2,306** encounter checks and the static
validator, including canonical/alias identity checks; the current process
contains the correction. The Eye's sector change still needs live retest.
The opening delivery also retries audience capture if the original session is
still zoning at director publication; a replacement session cannot acquire that
request. The transient-zone fixture now proves later capture and packet delivery.
The user additionally described a Batraal reset to 100% HP with surviving adds
left in place and no repeat 80/40-percent summons. The existing encounter state
already has those one-use flags and retires adds only on death/cleanup. The 40%
claim is now independently testable without changing runtime timing; a production
fixture exercises a healed full-health tick with a tracked knight and a second
80/40-percent descent. The isolated encounter suite passes **2,314** checks.
This is offline behavior; the user's observation source and a new-build client
reset run remain open. The restart recovered one character from the previous
Darkhold content ticket to zone 158; reconnect may be required. World and Lobby
servers remained running. No post-restart Darkhold entry result has been recorded.

Follow-up user finding: **Chain Bearers need to float**. The canonical main
`server_battlenpc_mob_types_loot.sql` and optional `dzemael_bnpc_mob_types.sql`
seed now set only BNPC 3135 / actor 2304302 / `chain_bearer` floating height to
0.9. This is an authored starting height borrowed from existing m505 Revenants,
not a recovered retail measurement. Position/warp packets already support the
separate offset. The initial hover correction kept the then-current 151 static
points and both formations unchanged. The later user placement layer changed
nine selected outer homes separately. At the time of the first test, no live
database update or server restart occurred. The configured database's one owned
profile has since been updated and verified at 0.9 while Map Server was stopped;
its next process must load the profile before spawn/formation hovering can be
judged in the client.
The isolated build passes 2,254 encounter checks, including formation packets
with the 0.9 offset; 84 traversal checks, static validation and 18 coordinate
tests pass. Both SQL corrections match and pass repeated/scoped application in
an isolated SQL fixture. This is not a live MySQL import or visual acceptance.

Eye route follow-up: the log's repeated 23379 rejections at zero TP exposed a
patrol stall. The source now provisions the shared monster minimum TP only for
each owned hazard's scheduled stop cast, preserving the held stop until actual
admission and action completion. The focused production test reproduces the
zero-TP rejection and passes 34 checks after provisioning; full encounter checks
are now 2,288. Traversal, route/provenance, static and coordinate suites pass.
Build: `.tmp/dzemael-eye-route-tests`; not applied to the currently running Map
Server. After rebuilding/restarting, observe the Eye cast and depart each stop,
then switch sectors as progression advances. Existing route geometry is unchanged.

Third user-operated solo test, 22:10:50 local, corrected 174-point Release Map
Server PID 76920: `!dzemael enter cs` entered the private area but again showed
neither the opening scene nor the duty widget. The Map Server log confirms 14
Approach mobs and one player. Accepted landing movement released deferred director
publication at 22:10:59.418; the owned opening request was captured with cutscene
enabled and actor-table generation 3. Subsequent player movement reached several
rooms, but no `[DzemaelOpening] invited` or `accepted event` line appeared. This
establishes a delivery failure after capture, not a failed instance admission.
The old process remains active with a client session while the next build is
prepared. `DzemaelGateScene` now emits a five-second scoped gate snapshot and
permits the original Player/Session to be recaptured after an unqueued transient
loss; stale/replacement sessions and already queued invitations still cannot
replay it. These changes have 2,317 offline encounter checks, 84 traversal,
42 static and 18 coordinate checks; they do not yet establish the live cause.

The user also reports that the All-seeing Eye visibly stops and starts at dense
waypoints and should move smoothly at about twice player speed. The isolated
build passes zero-wait transit samples without a stopped pose and spends a
bounded movement budget across the recorded points. The Eye uses 12 yalms per
second with this server's 1.2 on-foot multiplier; cast holds retain Death March.
The sampled user mypos screenshot adds a distinct upper Bone Nix at
`64.661,183.059,235.623`. Both need a later live client run before claiming
visual acceptance or retail cadence.

Darkhold aggression follow-up, deployed 2026-09-16 at 06:27 local: private
ordinary mobs now use a 125-yalm horizontal spawn territory. Nix, Orobon and
Hippogryph initially detect at 15 yalms; the other hostile private actors use
24. Nix uses sight/true sight, Orobon and Hippogryph use sight/scent/true sight,
undead variants use sound/scent, and passive Eye hazards remain zero-range.
The standard Release Map Server is PID 7400 with DLL SHA-256
`5A983FFDF1525AE8D1BBB31786AE9A4AAE5782196DF49C4029E399BA0DFBB973`.
It reached ready state at 06:27:30 with no client attached. In the next client
run, test a frontal and rear animal approach near 15 yalms, running versus
standing near an undead mob, and a retreat beyond the former 24-yalm leash.
Exact distances and mixed senses remain reconstruction values until observed.

Opening follow-up, deployed 2026-09-16 at 06:36 local: the 22:10:50 trace also
contains a stale presentation discard immediately before director capture. The
client had opened the director's parameterless native occupancy handshake as
event type `0x50`; that long-lived event kept `currentEventOwner` nonzero, so the
owned `openingPresentation` invitation correctly waited forever. The director
Lua now ends only that parameterless type-`0x50` handshake. It does not consume
the owned request, extend the deadline or change ordinary parameterless setup
events. On the next manager update the same session can receive the guarded full
payload, which selects native `rad0r100` argument 1 for `cs` or the relogin/widget
path for `nocs`. The static validator, **2,333** production encounter checks and
**84** traversal checks pass, including six direct opening-Lua probes. Standard
Release Map Server PID 30908 started at 06:36:17 with DLL SHA-256
`5A983FFDF1525AE8D1BBB31786AE9A4AAE5782196DF49C4029E399BA0DFBB973`
and the corrected root script; it had zero sessions. Run `!dzemael enter cs`
once to determine live scene and widget acceptance.

Death March follow-up, deployed 2026-09-16 at 11:11 local: the user corrected
the Eye's move as a massive area attack based on its location. The Darkhold Eye
now uses an actor-owned 30-yalm circle centered on itself at each held patrol
stop. The number is authored because the archived fixed-location description
and period video do not expose an exact radius. Ordinary Ahriman/Dodore retain
the shared eight-yalm target-centered command, and Soulgazer is unchanged.
Director-controlled command execution now retains the actor-owned profile the
controller admitted. The focused suite passes **41** checks, the full encounter
suite passes **2,340**, and traversal, scripted-route, Garuda geometry, static
and shared 1.23 combat/aggro contracts pass. Standard Release Map Server PID
75316 runs DLL SHA-256
`1D1C2980BADFF876AAB1F13BCB1B9866110D56BFB3BFA996B8FE9A5E28B3933E`
with no client attached at deployment. In the next route run, confirm Death
March damages a same-floor player well beyond the former eight-yalm boundary,
then use closer/farther observations to replace the authored 30-yalm value.

Eye minimap follow-up, offline 2026-09-16: the user's crop and the 10:34-10:44
Soulgazer sequence identify the distinctive purple, ringed marker used by both
Eyes. Native client Lua selects marker type 7 from potential `-2` / NM rank 12.
The server now sets that presentation before publication only for 3038/2301701
and 3099/2301702. The isolated build succeeds; 47 focused hazard checks and
2,346 full encounter checks pass. The static validator and all 84 traversal
checks also pass. Standard Release Map Server PID 56008 started successfully at
11:30:09 local with DLL SHA-256
`024867FAA2BB672B02AC7EB0837AA7CDE1CF9ABCEC8DAA9F3A0254DB92C3A5C4`
and zero attached sessions. Live client rendering remains unverified.

## September 26 offline follow-up: client checks after deployment

The September 25–26 implementation pass has not deployed or restarted the
server. The historical process IDs and builds above do not identify a build
containing this pass. Record the actual deployed DLL hash before interpreting
these results; offline regression results are in
`docs/dzemael_implementation_gaps_2026-09-25.md`.

- Enter with a normal eligible party and verify the original entrance scene and
  duty deadline. A disconnected or replaced party member must not count toward
  entry while its old actor awaits cleanup. GM solo entry does not validate the
  normal four-to-eight-member gate.
- Reconnect during an active run. Confirm the duty widget resumes with the
  original remaining time and without replaying the opening or earlier scenes.
  Reconnect again during the clear-reward window and confirm the existing clear
  state and reward deadline are retained.
- Charge a terminal with a normal party, then replace one occupant's session
  while other occupants remain. Existing occupants should retain their earned
  progress; a replacement must not inherit the old session's unsampled time.
  Replacing every occupant should require a fresh charge.
- Observe the Eye through all five route sectors, including the return legs.
  Check native-path bends and endpoint height transitions, continuous transit,
  arrival before each held Death March, resumption after the cast, and stage
  transfer. Record any wall intersection, vertical jump, premature cast or
  persistent hold together with the server route/stop log. Original route stops,
  accepted homes, authored cast waits and configured speed are unchanged; path
  length and safe corner handling can change elapsed traversal time.
- Open an ordinary coffer with connected party members while a disconnected
  actor remains in the area. Confirm successful recipients and preserved retry
  behavior, including an eligible dead player. A retained stale actor must not
  consume a recipient's pending reward.

The main SQL profile overlay must be included when rebuilding the database.
These checks do not establish a gil payout policy or an AF coffer binding; both
remain evidence-limited in the implementation report.
