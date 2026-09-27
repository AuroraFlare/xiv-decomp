# Dzemael retail reconstruction — active work

## Objective and scope

Latest user order (2026-09-15): combat mechanics first, then local-client
charging/scenes/effects/travel; individual placements, facing and patrols last
with the user's help. A new boss damage/interrupt audit is explicitly excluded.
Deepvoid's rear reaction is now implemented and passes offline checks. Continue
with the [client checklist](dzemael_client_verification_2026-09-15.md).
The user subsequently supplied individual standing XYZ and requested finalization;
the selected homes are applied below. A later clarification superseded eleven
unmatched ordinary homes left by the first additive pass. The live Release run
confirmed Approach publishing 14 mobs from that earlier 125-spawnable roster.
The corrected 114-spawnable roster is in the restarted Release server, and a
later user-supplied Bone Nix is built offline as a 115th spawnable point.
Three solo entries still produced
no opening scene/widget. The second established that deferred director publication
succeeded but the client did not start a setup event without a server kick. An
isolated build queues one guarded opening invitation after director readiness;
the third live run captured its request but never invited the client. Its trace
identified a parameterless native type-`0x50` occupancy handshake holding the
event slot. The root director Lua now ends only that handshake, allowing the
owned full-payload request to retry while ordinary setup events remain unchanged.
The production Lua probes and 2,333 encounter checks pass; live `rad0r100` and
widget acceptance remain open. That run also exposed an alias-containing
Eye route definition `Single` lookup; the isolated build resolves canonical
Eye/Soulgazer keys across sectors. Live patrol checks remain open. This ordering
supersedes next-step suggestions in the historical entries below.

The user supplied a strategy guide and asked to pursue retail accuracy. The
target is the original dungeon under the later 1.x rules used by this project
and its 1.23 client. Launch-era 1.18 observations remain valuable, but must not
silently replace later rules or directly observed later mob levels.

The full objective remains active. A passing build, plausible reconstruction,
or completed individual fix does not establish retail completion. Mob
home positions, hazard routes, encounter mechanics, progression, rewards and
an actual normal-party client run all remain within scope.

The user explicitly permits empirical position estimates using the substantial
nav recordings and other evidence. An original server coordinate dump is not a
prerequisite: calibrate the source landmarks, choose supported ground, and retain
the inference, confidence and independent checks. Do not describe an inferred
point as a recovered retail coordinate or a client-confirmed floor test. Current
changes mostly use whole recorded XYZ. The later Field IV formation explicitly
uses ten scoped local floor estimates; no general heightmap is assumed.

The new retail direction supersedes the earlier walking-only Eye preference
for this reconstruction. Restoring its retail patrol and casts requires
reviewed stops/sector transitions; enabling random attacks while keeping an
unrelated route would not satisfy that direction.

## Supplied guide and source reconciliation

### User placement capture, 2026-09-15

The user supplied 131 mob/device/coffer entries, preserved byte-for-byte in
`Data/raidroutes/evidence/dzemael-user-placements-20260915/user-placements.txt`.
The adjacent `intake.json` preserves exact XYZ, original labels and level fields,
line references, annotations, source hash and roster-count comparison. One line
contains two joined CSV records; the intake extracts both without changing values.
The user confirmed standing at intended spots in the client while matching
[Panny's 50-minute run](https://www.youtube.com/watch?v=SyIYAlxZmQ4).
These are user-recorded positions with visually reconstructed retail correspondence,
not recovered retail server coordinates. Level 52 remains tentative; `1-1` means
unspecified. Batraal's position and the All-seeing Eye escort/route are explicitly
not recorded yet. `tools/mobspawns/darkhold_user_placements.py plan|build|check|render`
now applies the constrained selections in
`Data/raidroutes/dzemael_user_placement_review.json` to the private runtime
manifest and generated C#. It moves 92 existing homes to user standing XYZ and
adds 34 observed ordinary mobs from the original capture. A later Bone Nix
screenshot adds one more upper-route mob at X 64.661, Y 183.059, Z 235.623.
The replacement correction removes eleven unmatched earlier ordinary mob
homes, yielding 175 static points. The nine Chain
Bearer outer formation homes also use the selected XYZ; their nine inner warp
endpoints remain frozen estimates. No shared SQL, boss profile, or patrol route
changes follow from this capture. The pre-capture 151-point baseline and Chain
formations are frozen beside the original text. Native calibrated previews are
in `docs/maps/dzemael-user-placements-20260915/`.

The user clarified nine Chain Bearers and one Imperial Primus Ordinarius. Nine
selected Chain points supply nine actors; isolated point 84 stays unassigned.
Nine selected Field IV warrior points update the ten-warrior wave, with the
tenth moved from its old authored home to nearby recorded primary node 1287.
That home is empirical and awaits a retail/client check. The five distinct Captain-room standing spots
are mapped to the existing one Captain and four guards. Point 130 supplies the
confirmed combined-name Captain. Point 129 was labelled `imperial_primus` in
the raw capture but provisionally supplies the existing Speculator; this is an
identity inference from the five-role roster and compact footage, pending a
client nameplate check. It removes the prior sub-yalm Captain/Speculator overlap
without inventing a second Captain. The user's exact XYZ remains visible in
the source and each selected manifest row. Six ambiguous observations, including
the Batraal summon center near the still-unrecorded boss home, remain unassigned.
Some recorded Field IV actors are under 1.5 yalms apart. Their homes have not
been artificially spread; live spawn, hitbox and facing acceptance remain open.
The older optional Stables Orobon group near the map-one (6,5) gate circle is
provisionally preserved as the user's exception. The unrecorded three objective
Drakes, Eye/Soulgazer patrol actors and Batraal/add encounter homes remain
separate provisional placements; none are represented as supplied user spots.
Door-crossing spawn and Dark Matter wording are scoped observations, not new
universal timing or reward rules. The static, coordinate, encounter and traversal
checks pass. The standard Release process still contains the 174-point roster
while the user's client is in an active run; the 175-point DLL awaits a safe
restart and client display/floor acceptance.

The [finalization source review](../Data/raidroutes/dzemael_finalization_evidence_20260915.json)
cross-checks the archived 1.x monster list and later Panny battle footage.
Ordinary listed species are level 52; Chain Bearer and Deepvoid are 55. The
archived page explicitly requires three north-room Lava Drakes for Warlock's
Buckler and places the Northwestern Orobon condition in the Stables. This
supports retaining those unrecorded objective actors while their individual
homes remain provisional. The walkthrough shows named Purgatory adds at 31:08
and again around another Batraal pull at 43:16–44:26; it is consistent with
one-time waves surviving a boss reset but does not recover exact timing or XYZ.
The newly appended live nav samples support floors around the final arena and
Drake room, without identifying retail mob spots or becoming part of the
separately frozen 1409-node capture. Boss/add nameplate markers that appear
to read 77 remain an unresolved numeric presentation check.

The original attachment is preserved byte-for-byte as
[user-strategy-guide.txt](../Data/raidroutes/evidence/dzemael-20260914/user-strategy-guide.txt).
SHA256: `955378d9f49611e263da2b05e6ecbf6cf89a1352b28be8916e14a43f287ba674`.
It is a supplied synthesis, not a recovered server script or coordinate dump.
Its diagrams explicitly identify themselves as topological, not calibrated maps.

| Supplied detail | Current decision |
| --- | --- |
| Eight players at launch, 4–8 after 1.19 | Retain the current later-1.x 4–8 admission and separate GM solo mode. |
| Ordinary enemies estimated rank 60 in a launch guide | Do not overwrite the level-52 later archive rows and video labels. |
| Rings described broadly as 2–7 players | Retain 2/6 and 2/2/4 as supported reconstruction choices; the 2011 source gives party assignments, not minimum-occupancy tests. Exact minima and later scaling remain unresolved. |
| Invulnerable Ahrimans patrol and stop to cast | Consistent with saved native profiles and period NM pages; full routes and stops still need reconstruction. |
| Deepvoid bogies disappear and reappear in different formations | Independently corroborated; the later applied Chain pass implements nine stationary combatants and two formations. Elevations, timer distribution and fade presentation remain provisional. |
| Batraal wave ordering near 80% and 40% | Consistent with the existing encounter; exact initial-wave trigger and numeric policies still need footage comparison. |
| Early theories about Captain/drake bonus blue chests | Do not overwrite more specific later reward-family evidence based on unresolved first-week theories. |
| No key-locked Dzemael chests | Keep the current keyless ordinary/objective/conditional coffer system. |
| Missing Deepvoid HP and individual spawn coordinates | Keep unknown HP distinct from authored combat policy. The user's later direction permits documented empirical position estimates. |

Primary period corroboration:

- [The Dzemael Darkhold — Tips and Tricks, July 23, 2011](https://forum.square-enix.com/ffxiv/threads/17439-The-Dzemael-Darkhold-Tips-and-Tricks?daysprune=-1)
  describes the perimeter bogies vanishing/reappearing closer to the boss and
  the resulting ramp movement. It supplies qualitative geometry, not XYZ or
  a trustworthy timer. Its author was unsure about the enrage threshold;
  retain the stronger existing 50% evidence.
- [August 2011 participant speed-run guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
  also describes ghosts teleporting into the inner circle. The linked
  [v1.18 full run](https://www.youtube.com/watch?v=SYWtisRBS-0) is a comparison
  source, with its patch identity preserved.

The [earlier audit](dzemael_status_and_accuracy_2026-09-14.md) records the
starting implementation inventory. It is historical where later changes below
supersede it.

## Changes implemented

### Supplied archive sources and Batraal correction

The user supplied the [April 2013 Gamer Escape snapshot](https://web.archive.org/web/20130424182226/http://ffxiv.gamerescape.com/wiki/Dzemael_Darkhold)
and [Elemen's dated raid guide](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/DzemaelDarkhold.html).
Both were read. Gamer Escape corroborates the later ordinary level-52 roster,
level-55 Deepvoid/Chain Bearers, the northwestern Orobon, all circles, 25-minute
clear and all-regular-coffer reward families. Most location cells remain blank.
Its [Chain Bearer page](https://web.archive.org/web/20130509211619/http://ffxiv.gamerescape.com/wiki/Chain_Bearer)
identifies the mid-boss encounter but supplies no XYZ or HP/MP values.

Elemen's HTML is saved byte-for-byte under
`Data/raidroutes/evidence/dzemael-20260914/elemen-dzemael-darkhold.html`, with a
UTF-8 text extraction beside it. The page discusses both patch 1.19 admission
and the later relic quest, so it is not treated as a launch-only account.
Its original `ff14_archives` image links redirect to the retired Plala home
page. The corresponding `ff14_dated_archives` image paths were retrieved and
verified as images; `elemen-downloads.json` pins their actual URLs and hashes.
The intact originals and lossless PNG renderings of the GIF diagrams are kept
separately. They must be registered before using image pixels as coordinates.

| Elemen evidence | Implementation consequence |
| --- | --- |
| Three Purgatory Knights at battle start | Initial wave now starts on actual AI engagement, even at 100% HP behind the barrier. Damaged scripted/GM probes retain their fallback. The one-shot claim is locked and ignores dead/finishing/cleaning encounters. |
| South terminal allows damage for one minute | Barrier-down duration changed from authored 25 seconds to 60 seconds. The existing terminal-owned Defense Down shares that window; its magnitude remains policy. |
| West terminal stops the ahrimans for 30 seconds | Stun duration changed from 60 to 30 seconds, including the displayed message. Its range, phase gating, repeat activation and patrol overlap remain unresolved. |
| Separate north terminal suppresses glowing hands | Initially missing; the later terminal pass below adds the north device and separates its effect from the south barrier. Its exact duration/visual remains unresolved. |
| Chain Bearers alternate outer/inner fixed positions every 60–90 seconds | Implemented in the later Chain pass with scoped floor estimates and an explicit timer policy; native fade presentation remains unresolved. |
| Four Purgatory Mages warp around Batraal's highest-hate player every 30 seconds | Later mage pass below implements target-relative relocation and stationary combat using recorded ground. Radius, fade presentation and initial homes remain provisional. Chain Bearers retain a separate unresolved formation mechanic. |
| Three optional field-III circles; four field-IV circles then ten independent warriors | The progression pass adds the missing terminals and separate branches; final barriers require ten distinct tracked warrior deaths. The later formation pass matches the eight-around-two diagram and all four small control variants. |
| Large terminals summon Deepvoid and Batraal; map-one transporter clears prior mobs | Separate summon and transporter controls are implemented below. Native transporter presentation remains unresolved. |
| Relic quest condition adds a further coffer | The later personal-coffer pass below implements the native claim contract and a documented fifteen-minute interpretation. Exact boundary, native quest predicate and original coffer-row placement remain unresolved. |

No placement XYZ, profile or SQL was changed in the Batraal trigger/timing step.
The source-backed durations replace earlier documented numeric policies; older
dated reports remain historical rather than being rewritten as if they always
used these values.

### Native-art registration and placement comparison

`tools/mobspawns/darkhold_elemen_review.py` registers both archived maps and
four encounter-diagram panels against their own native zone-231 artwork.
The results and matched-point residuals are saved in
`docs/maps/dzemael-elemen-20260914/registration.json`. Native/review PNGs have
their own `.frame.json`; no outdoor map transform was borrowed.

| Image | Matched inliers | RMS residual in native pixels |
| --- | ---: | ---: |
| Full map one | 722 | 1.110 |
| Full map two | 705 | 1.059 |
| Deepvoid outer panel | 91 | 0.243 |
| Deepvoid inner panel | 102 | 0.180 |
| Field-IV warrior formation | 223 | 0.175 |
| Batraal terminal diagram | 519 | 0.169 |

These are fitting residuals of shared artwork, **not retail coordinate error
bounds**. The small diagrams match native-sized crops, whereas the full maps
are quarter-size with a border. The initially downsampled reference provided
only seven accepted outer-panel matches, so that provisional fit was rejected.
Retaining full native detail for the small panels recovered the stronger fits
above without lowering the acceptance threshold.

The west-terminal symbol estimates X/Z `(46.756, -128.251)`, about **47.82**
yalms from its current placement. Complete recorded node **1120** is
`(45.96148, 149.50795, -128.65228)`, 0.89 yalms from the illustrated center.
The south damage-window symbol estimates `(77.504, -126.001)`, about **60.79**
yalms from the current shield terminal. Node **1161** is
`(77.28227, 149.75993, -126.2198)`, 0.31 yalms from that center. Neither
selection requires estimating Y, but these remain review candidates: node 1120
is also the current `wave.initial.2` spawn, and an 80% mage is 2.79 yalms from
node 1161. Terminal and add layout must be reconciled together. The north
terminal is absent; its illustrated center has a nearby node 1072 at 2.09 yalms.

The field-IV image has nine visible yellow symbols, with the text explicitly
assigning two warriors to its center symbol. The ten-actor composition is
therefore retained. Each Deepvoid panel has eleven visible pink symbols,
including two smaller fixed symbols; their identities are not individually
labeled. The tool retains all symbols and does not promote eleven symbols to
eleven Chain Bearers. The later Chain Bearer review below distinguishes nine
moving ghosts using original footage. The two fixed symbols remain unidentified;
the applied Chain layer later replaces the eight-actor baseline with nine.

This initial comparison did not move any actor. The subsequent terminal pass
below applies its reviewed positions; the comparison JSON/PNGs remain frozen
as evidence of the previous layout.

### Applied Batraal terminal layout and independent effects

The current manifest has **139 positions**, including **11 devices**. The old
138-position manifest is preserved byte-for-byte as
`Data/raidroutes/evidence/dzemael-20260914/positions-before-batraal-terminals.json`.
`Data/raidroutes/dzemael_batraal_terminal_review.json` pins its hash and all five
changes. Every other position, existing key and BNPC profile remains unchanged;
the three user-requested points and excluded nodes remain protected.

| Placement | Applied recorded node | Complete XYZ | Evidence status |
| --- | ---: | --- | --- |
| West hazard-stop terminal | 1120 | `45.96148, 149.50795, -128.65228` | 0.89 yalms from guide estimate |
| South damage-window terminal | 1161 | `77.28227, 149.75993, -126.2198` | 0.31 yalms from guide estimate |
| New north attack-suppression terminal | 1072 | `85.96202, 149.75551, -160.953` | 2.09 yalms from guide estimate |
| Initial wave's second knight | 1119 | `47.194546, 149.87285, -135.03403` | Authored 6.50-yalm spacing move from its previous point |
| 80% wave's second mage | 1206 | `70.52511, 149.93799, -126.36774` | Authored 5.12-yalm spacing move from its previous point |

The two add adjustments are the nearest complete recorded samples satisfying
the existing six-yalm separation from the boss, all potentially overlapping
waves and the three terminal points, while remaining within 1.5 yalms of the
old sample's elevation. The original home positions of these adds are still
unconfirmed; their revised points must not be described as recovered spawns.
The new current map previews are `docs/maps/dzemael-batraal-terminals-20260914/`.

The north `batraalenrage` device has its own activation branch. It suppresses
the empowered damage modifier and later restores it; south no longer suppresses
the sword and north no longer stops the eyes. North's **60-second duration is
provisional**, since the guide only specifies a temporary effect. This explicit
remaining timing gap is preferable to retaining the previous conflated,
indefinite suppression as if it were retail. Native glowing-hand presentation
and terminal model/occupancy still need verification.

West becomes available while Batraal lives, with the documented 30-second stop
window. North becomes available when the 80% wave's attack boost is active.
Both devices rearm after their effects expire and require another continuous
hold; untimed progression circles stay latched. North expiry does not touch
the independently timed south barrier and cannot restore damage on a dead or
finishing encounter. Clear cleanup retires the north timer too.

The [July 2011 linked kill video](https://www.youtube.com/watch?v=ywGn_2VBW_U)
was checked and is now private. The [October 2012 Batraal wiki snapshot](https://web.archive.org/web/20121015213504/http://ffxiv.gamerescape.com/wiki/Batraal)
was also read; it has no terminal timing or coordinate details. These checks do
not provide evidence for the provisional north timer. Existing accessible full
runs remain the next footage sources.

### Deepvoid field-clear withdrawal

Before this correction, `HandleBattleNpcDeath` published the lower-hall
population after Deepvoid died, but left surviving Feasting Hall stage mobs
active. `AdvanceRouteProgress` had the same omission. That could leave Chain
Bearers and approach enemies active after their field had cleared.

Both paths now retire surviving stage members before publishing the lower
halls. Membership is detached under the instance lock before calling the
existing actor despawn path. Repeated notifications find no surviving tracked
members to withdraw. This does not call `Die`, give kill credit, or alter the
normal dead-boss reward/fade pipeline. Other stages, unknown/untracked actors,
actors in other instances, and the existing Eye preservation rule are retained.

The direct visual evidence is
[Sylvarion’s original run at 9:00](https://www.youtube.com/watch?v=WmJxkVbowSI&t=540s):
the combat log records Deepvoid’s defeat; the general log records Level II
field deactivation and withdrawal/replacement of nearby creatures. This frame
was inspected during the preceding audit. The current stage is the existing
encounter ownership boundary; exact geographical retirement boundaries remain
part of the full route review.

Changes: `Map Server/DzemaelManager.cs` and a new production-code membership
harness in `tools/dzemael-encounter-tests`. No placement XYZ, profiles, main SQL
or live migration was changed in this step.

## Timing evidence from this pass

The Blue Garter [SR5C video](https://www.youtube.com/watch?v=WsaKqBbe4kY) was
opened and the Deepvoid segment inspected directly. At playback 6:40 the dungeon
countdown reads approximately 48:21; at 6:50 it reads approximately 48:03.
Consequently the sampled segment is not real-time footage. Do not use its
playback-second differences as encounter-second differences, or extrapolate
one constant speed across the entire recording without checking it.

Both sampled frames show Chain Bearer labels around the fight. They do not
identify a complete teleport cycle or every endpoint. Frame blending and
overlapping labels must not be counted as extra actors. A further seek to
6:30 occurred, but no additional endpoint/timing claim was made from it.

## Full completion requirements and remaining work

| Requirement | Evidence needed to establish completion | Current state |
| --- | --- | --- |
| Later-1.x admission, timer, reconnect and cleanup | Rules/source comparison plus normal-party client tests | Implemented baseline; final client proof missing |
| Native actors, levels, skills and loot identities | Existing native/archive joins and canonical SQL validation | Deepvoid's mistaken event actor join corrected in runtime, canonical SQL and current manifest; hidden numeric policy and presentation still need validation |
| Mob home positions/counts/facing across both maps | Calibrated guide/footage landmarks, empirical estimates with correct-floor ground support, confidence and independent comparison | Main-route room/species review exists; terminal geometry substantially improved. Captain's guide-compared anchor is retained, and four guards now use a compact empirical formation supported by idle-room footage and scoped floor triangles. Their exact offsets/facing and most other individual mob homes still need stronger evidence and live checks |
| Complete early Eye patrol, sectors and Death March stops | Original route sequence registered to native pages with stop/cast timing and recorded support | Eye now appears on the 112-point approach, then uses 30 Gullet, 83 Grand Hall and 107 corridor points before Batraal. Geometry, cast timing and sector triggers remain empirical; full retail/client validation remains incomplete |
| Soulgazer patrol, later relocation and Death Throes stops | Same evidence, with one persistent actor and progress changes | Authored 47-point Knights' Quarters circuit and five casts, then a separate Batraal patrol on the same actor. Exact retail paths, cadence and client behavior remain unverified; old final anchor stays inactive |
| Deepvoid Chain Bearer behavior | Complete original disappear/reappear cycles, both formations, proximity attacks, count and timing; reviewed ground estimates and runtime/client tests | Nine stationary combatants and alternating formations implemented. Current warp now traced to native hide/relocate/POP-7 and checked through the real packet path. Retail selector, hidden dwell, targeting and client acceptance remain open; ground, correspondence and timing retain their earlier scope |
| Deepvoid combat and enrage | Native commands plus footage for cadence, positioning and visible enrage | 50% behavior now requests recovered native bit-7 limb flames with action deferral and per-viewer replay. Hidden timing/HP policy and live effect acceptance remain unresolved |
| Batraal phases and terminals | Initial pull/add order, 80/40 waves, terminal visual/status effects, shield and Desolation cadence, hazard overlap | Three calibrated terminals and independent effects wired; native weapon aura now follows empowerment/north suppression/expiry. Mage targeting/30-second eligibility/recorded relocations implemented. North duration, live aura rendering/death cleanup, exact add homes and warp presentation remain incomplete |
| Rings, barriers and transporter | Every activation/count and native object transition, correct release sequence, both-map traversal | Guide-backed progression and twenty terminals implemented; small/large variants and native inter-map yes/no interaction wired. Empirical charging now removes the hard-six contradiction with a filmed four-player clear. Native rad0r102 is associated with Stables door 1406 and now dispatched through a one-use server invitation after earned unlock. Exact charging/minimum/reset rules, intermediate scene viewing conditions and missing scene triggers, travel presentation, endpoints and normal-party client acceptance remain incomplete |
| Coffers and reward conditions | Later-period chest identities/locations, exact conditional rewards and supported probability data | Four guide-based home corrections, native reward colors, personal relic resolver, zero-to-two red equipment count and filmed five-minute clear window implemented. Exact homes, gil, drop probabilities/combinations, complete relic quest and client acceptance remain unresolved |
| Regression and client acceptance | Area-specific tests, Release build, normal client route through clear/loot/exit without GM objective advancement | Offline step checks pass; complete client run not established |

Next work should validate/refine the applied empirical terminal charging policy
in `Data/raidroutes/dzemael_terminal_charge_review.json`, validate the Eye's
inferred first-map sectors, and compare remaining
mob/coffer homes against calibrated evidence, resolve terminal timing/presentation
and party-size rules, and validate the complete dungeon with a normal party.
Chain formations and early/final hazard patrols now have implementations, with
their specific evidence and remaining fidelity limits recorded below.

## Verification for field-clear correction

`tools/dzemael-encounter-tests/DzemaelEncounterTests.csproj` passed **22 checks**
against the production manager’s membership selection and production actor
death-state interpretation. It covers matching survivors, dead boss retention,
both membership indexes, other rooms/instances, untracked/null actors, repeat
notifications and retained Eye identity. It does not simulate packet delivery,
the whole death/reward flow, or a client clear.

The new harness and referenced Map Server built successfully in an isolated
output directory. Use serial MSBuild (`-m:1 -p:BuildInParallel=false`), matching
the existing production door harness procedure; the initial parallel build
returned a failed status without diagnostics. The first fixture run exposed a
wrong reflection namespace, corrected to `Meteor.Map.Actors.BattleNpc`, before
the successful run. No production workaround was added for either tooling issue.

```powershell
dotnet build tools/dzemael-encounter-tests/DzemaelEncounterTests.csproj -c Release --no-restore -m:1 -p:BuildInParallel=false -p:OutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.tmp/dzemael-retail-tests-20260914/
dotnet .tmp/dzemael-retail-tests-20260914/DzemaelEncounterTests.dll
```

After the source-backed Batraal correction, the harness passes **40 checks**,
including full-health engagement, waiting without consuming a wave, one-shot
dispatch under repeated/concurrent updates, direct-damage fallback, death and
cleanup guards. Release build passes with zero warnings/errors in the isolated
output. The full static validator passes, including five Lua parses and all
19 placement tests. These checks do not claim live packet/encounter acceptance.

The source/build changes have not been installed or exercised in a live client.

After the terminal layout/effect pass, **74 production encounter checks** pass,
covering real damage-modifier changes, independent barrier/suppression clocks,
expiry boundaries, repeat activation, fresh holds, preserved story-circle
latches and dead-actor guards. The isolated Release build passes. The static
validator passes including five Lua files and **20 placement tests**; **18
coordinate tests** also pass. The placement regression checks every unaffected
row against the frozen baseline, complete capture XYZ, guide snap distances,
all three terminal/add clearances and generated C# consistency. This is offline
evidence; live actor visibility, effect presentation and normal-party completion
remain unverified.

The last eight checks include the real `UpdateBatraal` dispatch with empty
player recipients: an expired south barrier leaves an ongoing north effect
intact, and an expired north effect leaves an ongoing south damage window
intact. The fixture supplies an empty NLog configuration because production
initializes its logger in server startup. No production logging workaround was
introduced. These checks cover state/effect dispatch, not actor packets.

The changed terminal points can be inspected using the user's command syntax:

```text
West:  !pos 231 45.961480 149.507950 -128.652280
South: !pos 231 77.282270 149.759930 -126.219800
North: !pos 231 85.962020 149.755510 -160.953000
```

These are complete recorded XYZ, not proposed elevations. A normal client
acceptance pass still needs to verify actor appearance, holds, effect expiry,
rearming and visibility after applying the staged build.

## Purgatory Mage movement correction

The frozen Elemen text explicitly says four mages join at about 80%, relocate
around the person with highest Batraal enmity every 30 seconds, and use their
specials/Absorb spells from stationary positions. That behavior is now wired
into the private encounter. It does not change a shared ghost profile.

The production manager:

- Applies NoMove, disables roaming and removes the old static-home leash for
  these mages only; their native skill list and accumulated threat survive.
- Starts the relocation clock 30 seconds after the existing 80% wave. It uses
  Batraal's positive enmity with native tie ordering, filtering dead, absent,
  foreign-area and cutscene-protected players.
- Selects whole recorded XYZ for every surviving tracked mage. It moves the
  existing actors through WarpToPosition and updates their home anchors;
  defeated/withdrawn actors are never recreated.
- Reserves a cycle once under the instance lock, skips missed-cycle bursts,
  and stops on disengagement, boss death, finishing or cleanup.

The new ground pool is separate from the static placement manifest:
`Data/raidroutes/dzemael_mage_warp_ground.json` contains **181** pinned samples
from the same frozen capture and native MapNavi 2902. The reviewed X/Z bounds
are 30<X<110 and -190<Z<-100; source-local IDs fall within 1020-1237.
Recorded elevations span approximately 149.00002-157.52356, covering the room's
sloping ground; no single arena elevation is assumed. The preview is
`docs/maps/dzemael-mage-warps-20260914/arena.png` and its exact crop transform is
in the adjacent `.frame.json`. It was visually inspected against native artwork.
No inferred edges, collision surface or retail ghost coordinates are claimed.

The source does **not** establish a radius. Current selection aims for six
horizontal yalms around the target, permits recorded samples at three to twelve
yalms, enforces four-yalm ghost separation and a 2.5-yalm target height tolerance.
Eight orientations are compared; the selected XYZ always remain untouched.
These are explicit reconstruction policies. A missing complete group of ground
points postpones the cycle. Native actions that cannot change state also defer
it; this preserves command cleanup but can make a visible interval longer than
30 seconds. Exact retail fade/interruption behavior still needs observation.
Initial wave points remain the prior authored homes, not recovered retail homes.

Additional footage inspected: the original [August 3, 2011 participant run](https://www.youtube.com/watch?v=SYWtisRBS-0), using samples around playback
17:41, 18:41 and 19:11. The Batraal segment shows Purgatory Mage labels and the
combat log names Grave Reel, Curse and Dark Cloud; it also records the two
Ahriman signature attacks. These sparse frames do not establish a complete
mage warp cycle, radius, or precise teleport endpoints. They were not used to
calibrate XYZ or to replace the guide's timer. Original footage remains useful
for the outstanding disappearance timing and independent geometry checks.

Validation after this change: isolated Release build succeeds with zero
warnings/errors; the production encounter harness passes **115 checks**,
including target changes/ties, actor membership, exact ground-object selection,
spacing, 30-second boundaries, dead/foreign actors, wrong floor, absent ground,
action deferral, disengagement and concurrent reservations. The independent
mage-ground suite passes **six tests** for complete XYZ, floor/source identity,
duplicate/missing nodes and generated output. These are offline checks; the new
warp packet path has not been accepted in a live client.

The full static validator also passes: five Lua files parse, all 20 original
placement regressions pass, and the six new ground regressions run as part of
the validator. All 18 shared coordinate tests pass. `git diff --check` reports
no whitespace errors. No server installation/restart was performed.

Commands:

```powershell
python -B tools/mobspawns/darkhold_mage_warps.py check
python -B tools/mobspawns/test_darkhold_mage_warps.py
```

No main SQL, optional migration or static placement row changed in this step.
The broader retail goal remains open, particularly Chain Bearer formations,
both complete Ahriman routes/casts, lower terminal/progression sequencing,
coffers, exact original mob homes and a normal-party client acceptance run.

## Independent branches, boss summons and Field IV progression

This later pass follows the preserved Elemen guide's full route sequence.
The Stables terminal is optional, and the Gullet terminal works independently.
The Gullet pair and Grand Hall trio retain their separate withdrawals. Completing
those five controls now opens the first-map end corridor; its own large terminal
withdraws that corridor's remaining foes and enables the inter-map transporter.
Deepvoid and Batraal each require their separate large summon terminal instead
of appearing automatically with the room population.

After Deepvoid, three optional Field III controls open the drake branch without
withdrawing the other lower foes. Four Field IV controls summon ten Hellsbound
Warriors with linking/assistance disabled and no forced shared attack. Only ten
distinct deaths from the actual tracked wave release both Field IV barriers.
Duplicate notifications, ordinary warriors, foreign actors and reused actor IDs
cannot count. That release withdraws surviving lower/Drake stage mobs, publishes
the Captain/final rooms, and exposes Batraal's summon. Skipping either optional
branch does not block the main route. Both Ahrimans survive stage withdrawal;
the Soulgazer's actual later route remains separate unfinished work.

Population completion is tracked per stage, independently of the highest stage
ever reached. Actor identities deduplicate publication, while partial mob/device/
coffer publication remains retryable. GM objective probes retain their explicit
stage/summon bypass; normal progression uses the source-backed prerequisites.

### Calibrated progression positions

`tools/mobspawns/darkhold_progression.py build|check|render` layers this work
over the frozen 139-point `positions-before-progression.json`. The new review
`Data/raidroutes/dzemael_progression_review.json` pins the baseline, capture,
registration and overlay hashes, estimated pixels/world XZ, exact selected XYZ,
and every before/after row. No prior layer is rewritten.

| Terminal | Map | Source-local node | Guide-to-ground horizontal distance |
| --- | ---: | ---: | ---: |
| Transporter | 1 | 592 | 2.34 yalms |
| Deepvoid summon | 2 | 624 | 6.92 yalms |
| Field III north / middle / south | 2 | 1312 / 1320 / 809 | 0.47 / 1.69 / 1.70 yalms |
| Field IV northwest / northeast / east / southwest | 2 | 1300 / 954 / 977 / 990 | 3.32 / 1.15 / 4.20 / 2.62 yalms |
| Batraal summon | 2 | 1116 | 4.00 yalms |

Nine devices are added and the old southwest seal device is moved. The existing
Granary Bone Nix occupied the new southern Field III terminal's exact node 809;
it moves to node 810, about 6.57 horizontal yalms along recorded corridor ground.
That is a clearance estimate, not a source claim about the Nix's retail home.
The other 137 prior points retain their exact fields/coordinates.

The main manifest and generated C# now contain **148 positions**: 90 mob records
(including the inactive relocation anchor), 22 wave homes, 20 devices, six regular
coffers, five reward coffers, two access points and three portals. All selected
ground points are complete samples from the frozen zone-231 capture, on their
own native map page; excluded warp nodes 599–613 and user-confirmed coordinates
are preserved. Both current noncombat maps under
`docs/maps/dzemael-progression-20260914` were visually inspected with their frame
transforms. The transporter shares the established return landing's node 592;
it is distinct from the travel trigger at node 598.

Confidence is high in the identity/relative arrangement of the drawn terminal
symbols. Their centers and ground snaps are empirical estimates; the 6.92-yalm
Deepvoid snap is the loosest. Registration fit and snap distance do not establish
retail actor-position error. Native prop appearance, floor contact and collision
still need client inspection. Route-coffer publication now follows the guide,
but physical coffer homes and warrior formation homes have not moved in this pass.

### Occupancy and reward scope

The manager counts living, connected, non-transitioning/non-cutscene players
within 3.75 horizontal yalms and three vertical yalms, held for 1.5 seconds.
Existing Gullet 2/6 and Grand Hall 2/2/4 settings are retained. Other settings
remain policy: six for gates/transporter/summons; two for Field III and three
new Field IV terminals; four for the existing southwest seal; one for each
combat terminal. Normal four-to-eight admission is retained, but the six-person
requirements still prevent normal four/five-player clears. Later-patch scaling
must be resolved; passing GM solo checks does not answer it.

Elemen's unqualified all-terminals reward now uses all twenty canonical controls,
including optional branches and the three reusable combat devices. Inclusion of
combat terminals is an explicit reading of that wording, awaiting comparison
with a full successful reward run. Successful activation history survives combat
effect expiry, and both eligibility and displayed progress use that history.
The denominator is the full twenty, even before later rooms publish. Unrelated
GM devices cannot substitute for missing controls.

No main SQL or live migration changes are needed: these are dynamically published
private-instance actors, with both canonical JSON and generated C# updated.
This pass is staged source work; no server installation or restart is performed.

Validation: the isolated Release build passes with zero warnings/errors; **181
production encounter checks** and **81 traversal checks** pass. The static
validator parses five Lua files and passes **21 placement** and **six mage-ground
tests**. All **18 shared coordinate tests** pass. The progression builder's check
matches the JSON/C# output and review layer; `git diff --check` reports no
whitespace errors. These exercise state, identity/provenance and release rules
offline; actor publication/packets and a normal-party client clear remain untested.

## Coffer landmark correction

The preserved Elemen map overlays contain five white coffer diamonds. Their
pixel centers were checked against the original RGBA pixels and matched to the
item/location text. The text places Warlock's Pattens north off the first fork,
Bladedancer's Jackboots at map one's northern dead end, Revolutionary's Bliaud
at map two's northern dead end, Warlock's Buckler southeast in the drake room,
and the Alpine War Jacket in the Captain's Quarters. Deepvoid's objective chest
is described as appearing after his death, without an exact white map marker.

Four homes now follow those calibrated estimates:

| Coffer | Old / new source-local node | Previous distance to guide marker | New distance |
| --- | --- | ---: | ---: |
| Warlock's Pattens | 235 / 198 | 99.27 yalms | 2.26 yalms |
| Bladedancer's Jackboots | 590 / 466 | 100.91 yalms | 0.63 yalms |
| Revolutionary's Bliaud | 765 / 671 | 71.34 yalms | 3.27 yalms |
| Warlock's Buckler | 827 / 874 | 11.66 yalms | 1.39 yalms |
| Alpine War Jacket | 1364 / 1364, unchanged | 8.29 yalms | 8.29 yalms |

These distances compare authored homes to the estimated marker center; they do
not measure unknown retail actor-position error. The first three replacements
are supported by both the named dead-end landmarks and nearby recorded ground.
Bladedancer's coffer now uses the northern recorded shelf at Y=164.32957 instead
of the Y=130.60393 transporter corridor. This supersedes the earlier accessible
substitute at node 590 while preserving the user's excluded eastern wall branch.
The first coffer is now physically outside the optional Stables door as well as
being published at entry.

For the Buckler, the marker is in the Granary's southeast interior. The selected
node 874 is recorded at Y=158.65785 inside the room; nearby approach samples
825–827 are around Y=163–164. The room-interior choice follows the map/text and
the recorded walk through the room, but the source does not prove the chest's
exact elevation. This is an empirical floor choice to compare with footage or
a client visit. Its XYZ are one complete sample, not interpolated height.
The Captain's existing point remains the nearest recorded sample and has the
widest residual. No closer arbitrary ground is invented. Deepvoid's chest and
all five final reward homes remain unchanged pending more specific evidence.

`positions-before-coffers.json` freezes the complete 148-point progression output.
`Data/raidroutes/dzemael_coffer_review.json` records all five comparisons with
before/after points, hashes, marker pixels, source registration, distances and
confidence. `tools/mobspawns/darkhold_coffers.py build|check|render` is the latest
builder. It verifies its baseline against the earlier progression builder and
writes the canonical JSON plus generated C#. The old progression CLI checks
its frozen output; it refuses a build that would erase the coffer layer.

The four coffer identities and all other 144 static records are preserved.
Publication conditions, items, probabilities, mob profiles/homes, portals,
door bindings, recorded nodes/edges and public SQL are unchanged in this step.
Both before/after native maps and the combined noncombat previews are saved in
`docs/maps/dzemael-coffers-20260914`, with exact adjacent crop frames. Both
comparison maps were visually inspected. White crosses show guide estimates,
green dots show selected ground, and red lines connect prior homes; those lines
are comparison graphics, not movement routes or nav edges.

Teleport review points, all zone 231 (use an existing private instance when
inspecting the dynamic actors):

```text
Warlock's Pattens:       !pos 231 -30.969162 180.112270 220.118240
Bladedancer's Jackboots: !pos 231 139.862240 164.329570 -50.247990
Revolutionary's Bliaud:  !pos 231 -182.862460 162.571200 -81.169170
Warlock's Buckler:       !pos 231 -104.396460 158.657850 -90.307700
```

No installation, restart, client floor confirmation or full retail completion
is implied by these generated placement changes.

Final verification for this layer: the regenerated Map Server and encounter
harness build in Release with zero warnings/errors. **181 production encounter
checks**, **81 traversal checks**, **22 placement tests**, **six mage-ground
tests** and **18 shared coordinate tests** pass. The static validator parses
all five Lua files. Both coffer/current and progression/historical builder checks
pass; whitespace checks pass for the tracked task files. No additional runtime
mechanics or reward probabilities were changed by the coffer pass.

## Batraal small/large circle correction

The user's question about small controls versus larger controls prompted a check
of the final arena. The route already selects native circle variants by player
count, but all three Batraal combat controls still used one-person actor 1200203
/ b936-e004, the generic transporter visual. Their separate gameplay effects
were implemented, but that common presentation did not match the guide.

Elemen explicitly calls both north and west small, and south large. The original
[August 2011 participant guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
describes gathering the party at the barrier circle after the initial skeletons.
Its linked [run at 16:18](https://www.youtube.com/watch?v=SYWtisRBS-0&t=978s)
and [16:22](https://www.youtube.com/watch?v=SYWtisRBS-0&t=982s) was inspected:
the southern control is a broad blue floor circle with multiple upright perimeter
glyphs and several party members. Camera/player/UI occlusion prevents treating
these frames alone as a precise minimum-occupancy test. This is explicitly a
version-1.18 recording. No playback-based timer change is inferred from it.

The July [Batraal participant account](https://forum.square-enix.com/ffxiv/threads/18175)
also distinguishes the western control as the smallest and assigns the sword
control to the skeleton group. This supports separating the controls' visual
roles, without establishing their exact later-patch numerical thresholds.

| Control | Previous configuration | Current scoped estimate |
| --- | --- | --- |
| South: damage window | One-person e004 terminal | Six-person circle, actor 1200204, b936-e005 |
| West: hazard stop | One-person e004 terminal | Two-person circle, actor 1200208, b936-e009 |
| North: attack suppression | One-person e004 terminal | Two-person circle, actor 1200208, b936-e009 |

These use the existing native small/large circle mappings and their corresponding
animation variants. The classification is source-backed; six/two/two occupancy
remains an explicit reconstruction estimate until a minimum-person activation
is observed. Normal instances enforce those counts through the existing player
filter and hold logic. GM solo mode retains each authored visual and lowers only
the activation requirement to one. All three remain reusable, with historical
reward credit and their existing independent south/west/north effect clocks.
No positions, source nodes, SQL, reward membership or other controls change.

### Admission does not establish terminal scaling

The official [English 1.19 notes](https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes?mode=hybrid)
change admission from eight to four–eight while saying raid battle balance was
unchanged. The [Japanese notes](https://forum.square-enix.com/ffxiv/threads/24908-patch1.19-1.19%E3%83%91%E3%83%83%E3%83%81%E3%83%8E%E3%83%BC%E3%83%88?mode=hybrid)
likewise retain the eight-player tuning assumption. This corrects the earlier
framing that admission by itself implies terminal downscaling must exist.
It proves neither automatic scaling nor that every control blocks fewer than
six participants. The later-patch behavior for undersized groups is still an
evidence question; no unobserved scaling formula has been added.

Verification for this circle correction: the staged Release build succeeds with
zero warnings/errors, all **181 production encounter checks** pass, and the static
validator passes with five Lua parses, **22 placement tests** and **six mage-ground
tests**. This pass changes three device configurations and their documentation;
it does not change ground, traversal or encounter timing. The updated build has
not been installed or tested in the live client.

## Field IV formation and fourth small control

Elemen's Field IV text explicitly specifies ten Hellsbound Warriors, with two
at the center of its diagram. The preserved 176×176 diagram shows eight yellow
perimeter symbols and one shared center symbol. Its already reviewed native-art
registration (223 inliers, 0.175 native-pixel fitting residual) places that compact
formation in the open northern part of Knights' Quarters. These are illustrated
positions, not a retail actor-coordinate dump; the fitting residual does not
establish spawn accuracy.

The previous ten homes were spread across the room, with a maximum pair distance
of **70.52 yalms**. The new eight-around-two formation spans **8.49 yalms** between
its most distant points. Eight homes follow the calibrated symbol centers. The
center pair is split west/east by **1.5 yalms**, an authored separation because
the diagram and text do not expose the two individual offsets. All ten existing
keys, BNPC 3138, actor class 2301901, independent-pull behavior and death-credit
rules remain intact. Facing remains authored.

### Explicit local ground estimates

The original 1,409-node recording has only a few samples inside this compact
footprint. The current recording was also inspected: it contains 1,677 samples,
but supplies no extra points within the inspected 12-yalm center neighborhood.
The documented supplemental snapshot does not contain zone 231. Those findings
do not authorize merging sources or manufacturing captured edges.

Under the user's explicit permission to estimate positions from empirical nav
data, this pass uses five reviewed local triangles whose vertices are original
recorded XYZ. Each new X/Z lies inside its selected triangle; Y is its barycentric
interpolation. The farthest support vertex is less than 17 yalms away and every
support edge is less than 20 yalms. Estimated Y ranges from **165.538 to 166.472**.
This is a small floor approximation, **not captured ground, collision geometry,
a general heightmap, or a client floor test**. Triangle outlines can cross map
details; they do not authorize traversal across those details. The selected actor
footprint itself was visually reviewed on the native map in the open room area.

| Warrior | Estimated XYZ | Frozen source-local support nodes |
| --- | --- | --- |
| 01 north | -40.754, 166.250, -132.760 | 946, 1286, 1287 |
| 02 northeast | -37.754, 165.538, -131.761 | 980, 1286, 1287 |
| 03 east | -36.753, 165.754, -128.760 | 980, 1286, 1287 |
| 04 southeast | -37.752, 165.980, -125.760 | 980, 1286, 1287 |
| 05 south | -40.753, 166.019, -124.759 | 980, 981, 1286 |
| 06 southwest | -43.753, 165.751, -125.759 | 934, 991, 1286 |
| 07 west | -44.754, 165.681, -128.759 | 934, 1285, 1286 |
| 08 northwest | -43.755, 166.472, -131.759 | 946, 1286, 1287 |
| 09 center west | -41.504, 165.780, -128.760 | 980, 1286, 1287 |
| 10 center east | -40.004, 165.771, -128.760 | 980, 1286, 1287 |

The new `darkhold_warriors.py build|check|render` layer consumes
`positions-before-warriors.json`, the frozen coffer output. Its review is
`Data/raidroutes/dzemael_warrior_review.json`, including original/current records,
source image and registration hashes, marker pixels, support vertices and
interpolation weights. The canonical manifest and generated C# retain **148**
points: **135 recorded, three user-supplied and ten estimated**. All other 138
records are unchanged. No SQL, native profile, recorded node, captured edge,
coffer, reward condition or timer changes are part of this pass.

The loader permits estimated ground only for these ten exact warrior keys and
their reproducible source-derived values. It rejects altered XYZ, other-map
points, changed support claims, mixed source labels and attempts to reuse the
exception for another actor. Ordinary placements still require complete recorded
or explicit user XYZ. Earlier coffer/progression builders check their frozen
outputs and refuse to overwrite the current formation. Both guarded build paths
were exercised and the current manifest hash remained unchanged.

Both complete native map previews and the focused formation view are in
`docs/maps/dzemael-warriors-20260914`. The focused PNG was visually inspected;
yellow marks estimated homes, red marks prior homes, and blue lines show floor
interpolation support only. Its `.frame.json` includes the exact crop and zoom
conversion. The comparison does not claim guide-pixel precision equals retail
spawn precision.

The same source calls **all four Field IV terminals small**. The southwest
`knightsseal` control therefore changes from the medium four-person variant to
the existing small two-person variant, matching the other three. The small
classification is source-backed; two-person activation uses the existing small
circle convention and remains unverified for later-patch minimum occupancy.

Verification: Release build succeeds with zero warnings/errors; **181 encounter
checks, 81 traversal checks, 26 placement tests, six mage-ground tests and 18
coordinate tests pass**, as do five Lua parses and the current/historical builder
checks. New placement coverage verifies source marker topology, central-pair
separation, identity preservation, interpolation containment and refusal to
extend the exception. These checks establish reproducibility and runtime data
integration, not in-client floor/model acceptance. The staged build has not been
installed or used for a normal-party clear. Chain Bearer formation cycling,
complete Eye routes/casts, remaining encounter/reward details and full client
verification keep the overall retail goal active.

## Chain Bearer formation and timing review

The original [kaeko1 v1.18 run](https://www.youtube.com/watch?v=SYWtisRBS-0)
now supplies a complete sampled outer/inner/outer cycle. Player times were
checked against the dungeon countdown; these samples advance in real time.

| Playback | Dungeon countdown | Observation |
| --- | --- | --- |
| 6:21 | 53:38 | Summon circle occupied; no ghost formation on the minimap. |
| 6:26 | 53:33 | Summon transition hides the minimap; no actor count inferred. |
| 6:32 | 53:27 | Chain Bearer nameplates appear after the summon. |
| 7:51 / 7:56 | 52:08 / 52:03 | Outer formation changes to inner between these samples. |
| 8:16 | 51:43 | Nine inner markers, separate from the displaced boss and party. |
| 9:06 / 9:11 | 50:53 / 50:48 | Inner formation changes back to outer. |
| 9:26 | 50:33 | Ordinary Chain Bearer attack visible. |

Those brackets bound the observed inner phase to **70–80 seconds**, consistent
with Elemen's 60–90-second range. They do not establish the initial delay, a
random distribution, an exact fixed period, later-patch timing or fade duration.
Elemen describes fixed positions between warps, with attacks and absorb magic.
The future encounter correction must preserve attacks and hate while preventing
ordinary pursuit. A 1.18 Siphon TP log is not sufficient to add that spell to the
later client profile.

Each diagram contains **nine moving marks and two smaller fixed marks**. The
inner nine match the observed formation; the attachment's approximately eight
was an estimate. No identities are assigned to the two fixed marks, and no
per-ghost correspondence between formations was observed.

`darkhold_chain_bearers.py plan|check|render` records this evidence in
`Data/raidroutes/dzemael_chain_bearer_review.json`. Both nine-point formations
retain their calibrated X/Z estimates and five nearest complete recorded XYZ
candidates per point. **Y and runtime identity assignment remain unset.** Both
focused native-map previews in `docs/maps/dzemael-chain-bearers-20260914` were
visually inspected: pink is a diagram estimate, cyan is a recorded sample and
grey is an unidentified fixed mark. Their frame files retain crop conversion.

The current 1,677-node recording was also checked within X -135..-90 and
Z -30..31: all 43 samples in that box already occur in the frozen capture.
Its SHA256 was `44dec85d12585d80c53d2b9b60e7e7d3950b58a99a7d6ba9deaa7f4e52094085`.
This scoped comparison creates no cross-recording links. Several inner and
western/southern outer positions lie between sampled paths; nearest-point Y
cannot automatically be copied to their diagram centers. Floor estimates need
their own reviewed support, especially around the raised perimeter.

The review builder passes `plan`, `check` and `render`. This pass changes no
runtime homes, roster, SQL, nav data or encounter behavior. The pending change
is nine stationary combatants summoned with Deepvoid, alternating between the
reviewed formations. Ground estimates, per-actor correspondence, timer policy,
warp presentation, lifecycle checks and client acceptance remain to implement.

## Applied Chain Bearer encounter

The source review above is historical. `darkhold_chain_placements.py
build|check|render` now applies nine outer homes and nine separate inner endpoints.
`positions-before-chain-bearers.json` freezes the preceding 148-point warrior
output. Existing ghost keys a–h survive and key i adds the ninth BNPC 3135 /
actor class 2304302. The other **140** static records are unchanged. The canonical
manifest now has **149 points: 127 recorded, three exact user positions, ten
warrior estimates and nine Chain estimates**. Inner endpoints are relocations,
not nine more actors. The main JSON and both generated C# position files come
from the same builder; the prior warrior build is guarded against overwriting it.

All eighteen Chain endpoints use calibrated diagram X/Z and **estimated Y**.
The inner floor is separated from the raised rim visible in the original run
at 8:22 (dungeon countdown 51:37). Its nine height estimates use only lower-tier
samples 624–627, yielding Y 158.093–158.936. Each outer point has three explicitly
chosen samples from its local perimeter segment, yielding Y 158.584–164.015.
Inverse-distance weighting is an authored approximation that extends beyond
sampled paths; it is not triangle containment or a recovered collision surface.
The maximum support distance used is 20.07 yalms. The western and southern
perimeter remain especially important floor-test targets. No captured edges or
recording files were changed. Both focused previews were visually checked and
retain frame conversion, source slot numbers and actor/estimated-height tables.

The source does not identify which individual ghost occupies which inner slot.
The saved one-to-one assignment is authored and explicitly labeled. The two
unidentified fixed diagram marks remain excluded. No shared profile, spell list,
HP, loot or SQL data is changed by this private encounter layer.

Runtime now withholds all nine ghosts until Deepvoid's summon terminal is
activated, including retryable partial publication. Each ghost holds its position
while retaining native combat and its own enmity. A 90-second initial delay is
chosen within the coarse first-dwell bracket; later completed cycles select an
integer duration uniformly from 60–90 seconds. The range is sourced, but the
initial value and random distribution are reconstruction policy.

Per-actor reservations allow ready ghosts to warp while a casting ghost waits
for its own command boundary. Overlapping ticks cannot reserve an in-flight key
twice. Failed moves retain that key for retry in the same formation. The next
timer starts after all surviving pending ghosts finish, so command deferral may
extend the visible dwell. Dead, foreign-area and withdrawn actors are excluded;
the manager never respawns a ghost to complete a formation. Boss death, field
completion and instance teardown disable further cycles. Movement uses the
existing actor warp packet; original disappear/reappear effects are still not
reconstructed. Ordinary encounter retirement continues to withdraw survivors.

Verification: Release build has zero warnings/errors; **222 production encounter
checks, 81 traversal checks, 29 placement tests, six mage-ground tests and 18
coordinate tests pass**, together with five Lua parses and current/historical
builder checks. New tests cover nine-actor summon membership, stationary attacks,
per-actor deferral, retry and overlapping reservations, return-to-home consistency,
death/withdrawal exclusion, exact preservation of unrelated records and separate
lower-floor support. These are offline integration checks. The staged build is
not installed and no client floor, animation or normal-party clear is claimed.
Full Eye/Soulgazer routes and casts, remaining encounter/reward evidence and
complete client acceptance keep the overall retail objective active.

## Hazard cast-stop admission repair

The existing hazard callback released a stop immediately after its first
`ForceScriptedMobSkill` attempt, even when that attempt returned false. A busy
actor could therefore skip its scheduled attack. The callback also bypassed
every Eye action and cleared the Eye's native skill list under the superseded
walking-only direction.

Both hazards now retain their reviewed native list, excluding the other
hazard's signature move, with director-controlled skills and no autonomous
auto-attacks. The reusable route controller exposes `StopWaiting` on later held
ticks. Dzemael uses it to retry an unsuccessful cast admission and to wait for
the native action to end before releasing the stop. A cast state serializes
dispatch and release; readiness is evaluated inside its lock. Minimum route
waits remain in force. Authored action stops must be explicitly held. Missing
holds cancel the route with a diagnostic; finishing instances and withdrawn
actors cannot continue casting through their callback.

Native SQL rows 23379/23380 both have main-target mask 31, recipient mask 17152,
and zero MP/TP cost. Production `BattleCommand.IsValidMainTarget` checks confirm
that each accepts its own living caster, without changing the enemy recipient
mask or introducing a player anchor. This verifies admission's self-target
contract; it does not claim a completed empty-room client animation or damage
test. No shared command rows, status effects or target-selection rules changed.

Additional original-run samples at 2:25 (57:34), 3:00 (56:59), 4:20 (55:39) and
16:58 (43:01) show Gullet, Grand Hall, later first-map corridor and Batraal room
context. They do **not** identify a complete named Eye/Soulgazer stop or cast
sequence. No new coordinate or timing measurement was inferred from them.

The current Eye route still contains the prior 83 recorded Grand Hall waypoints
with no action keys. Soulgazer still lacks its route JSON. No new active cast
stops or patrol sectors are claimed by this repair: that remains the next route
reconstruction work, including the two hazards' later presence during Batraal.

Verification: Release build passes with zero warnings/errors and **244
production encounter checks** pass. New checks cover failed admission, busy
deferral, overlapping updates, once-only release, native self-anchor masks and
the actual controller's waiting/suspended/cancelled callback behavior. The
separate scripted-route suite passes with its existing unavailable NuGet
vulnerability-feed warning. Full routes, casts in a populated client, floor
acceptance and the broader dungeon requirements remain unfinished.

## Batraal's two active hazard patrols

Elemen explicitly puts both All-seeing Eye and Soulgazer in the northern great
hall during Batraal. A new review of the original
[kaeko1 run](https://www.youtube.com/watch?v=SYWtisRBS-0&t=1123s) shows
`Soulgazer readies Death Throes` and `The All-seeing Eye's Death March misses`
in the log at 18:43 (41:16 remaining). At 18:48 the log shows Death Throes
missing. These observations corroborate both identities and signature moves
during the encounter. The minimap markers are not individually named, and the
sample does not measure a complete cast-to-cast interval or recover XYZ.

The new `Data/raidroutes/dzemael_hazard_routes.json` and
`tools/mobspawns/darkhold_hazard_routes.py build|check|render` preserve two
empirical routes through that northern hall:

| Actor | Frozen nodes, map 2 / MapNavi 2902 | Authored cast stops |
| --- | --- | --- |
| Existing All-seeing Eye | 1108–1120 | 1108, 1114, 1120 |
| Existing Soulgazer | 1131–1141 | 1131, 1135, 1141 |

All 24 points retain complete recorded XYZ. The manifest separates the recorded
edges from short inferred segments; it creates no runtime navmesh links.
The 13.52-yalm gap after node 1121 is excluded. The native-map preview was
inspected for the route's relationship to rocks and terminals. That map review
is not a collision check. The original static 149-point placement manifest,
inactive final_gazer anchor, earlier route JSON, nav recordings and SQL remain
unchanged by this route pass.

On Batraal engagement, the manager relocates the same two existing actors to
their validated route starts. Each follows its recorded samples in ping-pong
order and casts its own native signature move at three held stops. Cast holds
retain the admission retry from the previous repair. Their three-second minimum
wait is the native command preparation time; speed, chosen stops and resulting
cadence remain authored. Engagement as the transfer trigger is also authored:
the sources prove coexistence during battle, not the precise relocation event.

Transfer reservations exclude foreign, dead, withdrawn and currently busy
actors. Overlapping updates cannot claim the same identity twice. Failed
admission remains retryable, and a successful transfer is not repeated each
tick. Batraal retirement stops later transfers and withdraws the two hazards
with his remaining adds. No duplicate hazard is spawned.

The same Elemen section lists four Death Throes effects: Bind, weaponskill
prevention, ability prevention and Silence. `monster_tp.lua` previously omitted
Silence; it now includes it. The existing authored 30-second / 75% policy is
used for the added status. Native command costs, recipient masks and the other
three status settings are unchanged. A production Lua test exercises delivery
of all four effects to the recipient under forced-success rolls; it does not
claim original application probabilities or a live client effect check.

Early Soulgazer routing, early Eye casts/sector changes, retail validation of
these final-room paths/cadence, other encounter/reward gaps and a normal-party
client clear remain within the active objective.

Verification: Release build succeeds with zero warnings/errors. **268 production
encounter checks**, including real route deserialization and Lua status delivery,
**81 traversal checks**, four hazard-route tests, 29 static placement tests,
six mage-ground tests and 18 coordinate tests pass. The static validator and
current Chain formation builder check also pass. The staged build has not been
installed or exercised by a normal party in the client.

## Early Eye casts and Soulgazer circuit

The new `Data/raidroutes/dzemael_early_hazard_routes.json` and
`tools/mobspawns/darkhold_early_hazards.py build|check|render` provide the early
hazards with explicit cast schedules on recorded ground. This is a separate
layer; the two Batraal route files and their review manifest remain unchanged.

- Eye keeps all 83 consecutive Grand Hall nodes 294–376 and the same start,
  movement options and ping-pong order. Death March is now dispatched at nodes
  300, 314, 332, 350 and 363. The old walking-only JSON is preserved byte-for-byte
  as `evidence/dzemael-20260914/eye-walking-before-casts.json`, with its hash in
  the early-route manifest.
- Soulgazer starts at its existing node-975 home. Its circuit follows nodes
  975–991, then 933–959, then 998, 973, 974 and closes to 975. Death Throes is
  dispatched at 975, 985, 938, 949 and 958. All 47 XYZ retain recorded elevation.
  The cross-pass joins 991→933, 959→998 and 998→973 are respectively about
  3.03, 4.24 and 3.27 yalms in 3-D, and explicitly inferred. Other absent
  captured edges are also labeled inferred. The 9.96-yalm 972→973 and
  13.18-yalm 991→992 gaps are not used. Neither Field IV exit is crossed.

The existing room review is corroborated by a new direct view of
[the 15-minute original run](https://www.youtube.com/watch?v=WmJxkVbowSI&t=634s).
At 10:34, Soulgazer's name is visible in Knights' Quarters while the player
approaches a small terminal. At 10:39, an Ahriman passes close to the occupied
southern terminal; its identity as that same Soulgazer is inferred from the
nearby named observation. At 10:44, the party remains on the terminal and a
minimap marker is southeast of them. These observations support room coverage
and movement near the terminals. They do not provide a calibrated server point,
individual cast-stop location or complete timing cycle.

The native-map renderings under `docs/maps/dzemael-early-hazards-20260914/` were
inspected. Their frames remain map-specific (MapNavi 2900 and 2902). The user's
empirical-placement permission supports this reconstruction, but all ten cast
positions, Soulgazer's circuit and resulting cadence remain authored. The
native three-second command preparation is retained as a minimum hold; the
runtime still waits for the native action to finish and retries failed starts.
No random autonomous attack rotation was added.

These routes attach through the existing private actor setup, preserving one
Eye and one Soulgazer. Batraal's later transfer replaces their routes on those
same actors. All 149 static placements, native profiles, SQL, nav recordings,
the three exact user points and excluded nodes 599–613 remain unchanged.
Later first-map Eye sectors, exact retail path/cadence and populated-client
acceptance remain unfinished.

Verification: **274 production encounter checks**, **336 production Npc/Lua door
checks**, **81 traversal checks**, four early-route tests, 29 placement tests,
six mage-ground tests and 18 coordinate tests pass. The static validator and
unchanged Batraal/Chain builders also pass. All four hazard paths were stepped
through the production movement guard in both directions: Eye 6,142; Soulgazer
3,706 (including loop closure); Batraal Eye 994; Batraal Soulgazer 864 — **11,706
steps total**. These are movement-rule checks, not world collision or client
animation validation. The encounter Release build has zero warnings/errors;
the door integration build has its existing NU1900 vulnerability-feed warning.
No build installation or normal-party client test was performed.


## Eye's post-Field-I corridor sector

A direct view of [the original 15-minute run at 6:00](https://www.youtube.com/watch?v=WmJxkVbowSI&t=360s)
shows the named All-seeing Eye in front of the player beside the stone ramp at
the transporter approach. The visible log already records the terminal's
activation, withdrawal of nearby creatures and activation of the transporter.
This establishes that the Eye survives that withdrawal and occupies the later
first-map corridor. It does not establish exact XYZ, cast timing or the exact
trigger used to relocate it there. Earlier samples at 4:30 show Field I being
deactivated and the party entering the corridor; 5:00 and 5:30 do not provide
a named Eye observation.

`Data/raidroutes/dzemael_corridor_eye.json` and
`tools/mobspawns/darkhold_corridor_eye.py build|check|render` pin a separate
empirical corridor route using map one / native MapNavi 2900:

- 107 exact frozen XYZ: 390–392, 410–445, 500–510, 519–536, 542–564, 578–593.
- Seven authored Death March stops: 410, 435, 505, 526, 550, 580, 593. Each has
  native three-second minimum preparation and waits for action completion.
- 37 captured edges and 69 inferred short segments. The five cross-pass joins
  are 392→410 (3.003 yalms), 445→500 (4.577), 510→519 (1.943), 536→542 (2.137),
  and 564→578 (3.709). Their elevation differences are all below 0.9 yalms.
- The maximum segment is 7.886 yalms. The full one-way path is about 633 yalms.
  Upper and lower passages retain the recorded descent through the western
  gallery; overlapping X/Z never substitutes for that descent. Recorded side
  excursions and excluded warp nodes 599–613 are omitted.

The native-map preview `docs/maps/dzemael-corridor-eye-20260914/corridor.png`
was inspected. Its frame is specific to that crop; the screenshot was not used
as a pixel-to-world transform. No nav recording or runtime navmesh edge changed.

All five upper-circle activations now make the existing Eye eligible for this
sector. The manager defers busy actors, retries failed starts, and remembers a
successful relocation. Corridor and Batraal transfers share reservations. A
Batraal engagement between reservation and execution cancels the older sector's
claim; the same actor can then enter the arena. Death, withdrawal, cleanup and
instance finishing exclude transfer. The transporter terminal does not retire
the Eye. This trigger and ping-pong path remain an authored reconstruction,
not a recovered sequence of retail teleports.

All 149 static placements, earlier hazard routes, original source recording,
profile/SQL data and user-confirmed points remain unchanged by this pass.

Verification: **296 production encounter checks**, **336 production Npc/Lua door
checks**, **81 traversal checks**, three corridor-route tests, four early-route
tests, four final-hazard tests, 29 placement tests, six mage-ground tests and 18
coordinate tests pass. All five routes pass **20,262** production movement-step
checks in both directions, including **8,556** on the new corridor route. The
production loader caught a metadata type mismatch in the first export; the
exporter now supplies its required string while preserving structured evidence
in the separate manifest. The corrected loader and route checks pass.
Release build succeeds; the door harness reports only its existing unavailable
NuGet vulnerability-feed warning. The static validator parses five Lua files.
This is a staged build, not an installation or normal-party client acceptance.

The user also asked about small versus large terminals. Inspection confirms
native circle variants are selected from the configured requirement before the
GM solo override: small controls require two, Grand Hall's intermediate control
four, and large controls six. Normal occupancy enforces these counts; GM solo
requires one with unchanged visuals. The Gullet/Grand Hall party assignments
support these choices but do not independently prove minimum occupancy. No count
or visual was changed in this check. The later circle review below qualifies the
older source interpretation.


## Native inter-map transporter interaction

Direct examination of [the original run at 6:08](https://www.youtube.com/watch?v=WmJxkVbowSI&t=368s)
shows the selected `???` portal and the exact prompt `Activate the magitek
transporter?`, with Yes/No choices. The 6:05–6:07 views show the tall blue-white
portal at the end of the broken stone bridge, and 6:10 shows a travel camera
view. Elemen independently says to examine `????` after powering the device.

The recovered `RaidDungeonWarp` client script matches that prompt through text
group 6781 / `raidDungeonWarp`, row 2 and widget arguments `2, 2, 1, 2`. Its
activation scheduler is `67493888` (`0x0405E000`, e004 bank 0094). Source hashes,
video observations, implementation scope and remaining uncertainties are pinned
in `Data/raidroutes/dzemael_transporter_review.json`.

The two private inter-map actors now bind that client/server script before
publication. They reuse appearance 1200203 / b936-e004 with interactive powered
extra stat `0x81`, targetability and the unknown-name label. The short e004/0004
fizzle is no longer played on initial publication. This is a scoped private
binding based on the source match and prior e004 visual evidence; it does not
assert a recovered original world actor-class join. Shared SQL actor bindings,
Toto-Rak's actors, all static XYZ and nav recordings remain unchanged.

Inter-map standing holds are disabled in both the update selector and the
visit state machine. A player must examine the NPC and confirm the native
prompt. Server confirmation rechecks instance ownership, current event owner,
source-floor range, progression, session identity, death, transition and
cutscene state. A per-Player reservation prevents overlapping uses. The manager
ends the NPC event before the same-area move rebuilds visibility. The destination
is the existing pinned opposite-map landing; content membership, objectives,
time limit and return point stay intact. Darkhold dispatch now occurs before
the generic content-return/Toto-Rak fallback and fails closed if unbound.

No and cancel close the prompt without moving. A failed claim closes normally;
a handled Darkhold journey does not close the event twice. Generic non-Darkhold
Lua completion is retained. The separate five-second victory exit remains an
authored floor hold. Exact endpoint XYZ, travel cutscene playback and normal
stock-client acceptance are still incomplete, as is the broader retail goal.

Verification: **313 production encounter checks**, **83 traversal checks** and
**336 production Npc/Lua door checks** pass. The native client method contract
and changed server Lua are executed together for seven yes/no/cancel/disabled/
stale/non-Darkhold cases. Isolating each mock interaction in its own Lua function
resolved a failure in the test's reused loop-local mocks; the production prompt
did not require that change. All five hazard routes still pass **20,262** movement guards.
The static validator parses **six** Lua files; 29 placement tests, six mage-ground
tests and 18 shared coordinate tests pass. Release builds pass, with the door
harness's existing unavailable NuGet vulnerability-feed warning.

The full Toto-Rak validator was also attempted and fails at its earlier
`corridor mobs no longer retain private-duty pursuit after engaging` assertion.
The validator and `TotorakEncounter.lua` are unchanged against HEAD according
to `git diff --exit-code`; that in-memory assertion uses only those unchanged
sources and precedes transporter checks. It is recorded as an existing failure,
not a passing full Toto-Rak regression. The focused shared warp Lua tests pass.
No running server was installed or restarted, and no client travel is claimed.

## Transport loading versus an occupancy cutscene

Further inspection of the same original run shows a darkened portal and
`Loading` at 6:12, the second-map portal with the ordinary HUD restored at
6:13, and the named player running away at 6:15. These observations support
a short native travel transition. They do not establish a separate replay
cutscene or its event binding.

`Data/raidroutes/dzemael_transport_presentation_review.json` records the six
intermediate/final scene hashes and decoded actor dictionaries. `rad0r101`
contains the party and Ahriman; `rad0r102/103` bind the e005 circle;
`rad0r104` contains the ogre and ghosts; and `rad0r105/106` contain Batraal.
The standard setup parser finds no `setup` block in `rad0r103`; its actor
dictionary is still decoded, but no setup position is claimed. All other
reported roots remain scene-local. No Darkhold world transform is established,
and Toto-Rak's transform is not used.

The saved native arrival export admits spawn type 15 in `0x0058b2a0`, selects
its loading flag in `0x0058adc0`, and processes loading/fade through
`0x0058a090`. `UseTransporter` currently calls `DoPlayerMoveInZone` with that
default after ending the NPC event. Thus the current move already requests
native travel presentation. This does not recover retail's exact packet value
or verify the current experience in the client. Earlier references to a missing
"travel cutscene" should be read as unresolved **travel presentation**, with a
separate scene binding still unproven.

This pass changes evidence and documentation only. Source hashes and JSON
structure were checked; no runtime, SQL, position or recording changed.

## Eye presence before the first gates

The ordinary-mob review exposed an earlier hazard omission. In the original
[run at 1:55](https://www.youtube.com/watch?v=WmJxkVbowSI&t=115s), the battle
log records All-seeing Eye's Death March hitting the player for 1,107 damage
while the party occupies the large Gullet-opening terminal. Only the optional
Stables unlock has appeared in chat. At 2:25 Gullet is open and moles/toads
surround the inner large ring; at 3:00 the Grand Hall is unlocked. The earlier
runtime published the Eye only with Grand Hall, so it could not produce that
first-gate hazard. The pulled ordinary mobs in these frames do not establish
their spawn homes or exact full population.

The Eye now publishes in Approach. Its existing stable placement identity is
retained, while its birth XYZ comes from the validated approach route head
before actor creation. The same loaded definition configures its first route;
no intermediate Grand Hall publication or second file read is needed. The
unchanged static `mob.circlehall_eye` point remains the later Grand Hall
anchor. A failed initial load leaves the stable placement unpublished so the
normal progression tick can retry it; a successfully published identity is
never duplicated or resurrected by that retry.

`Data/raidroutes/dzemael_approach_eye.json` and
`tools/mobspawns/darkhold_approach_eye.py build|check|render` add two routes:

| Sector | Frozen node selection | Cast stops | Captured / inferred segments |
| --- | --- | --- | --- |
| Approach | 16–26, 31–131: 112 exact XYZ | 20, 42, 65, 90, 109, 128 | 100 / 11 |
| Gullet | 249–278: 30 exact XYZ | 255, 265, 276 | 20 / 9 |

The original 30→31 gap is about 10.62 yalms. The selected 26→31 connection is
about 4.72 yalms and has a captured edge in the frozen file; the builder rejects
loss of that provenance. All selected segments are at most eight yalms. Upper
and lower approach passages preserve the recorded descent instead of joining
overlapping X/Z. No recordings or runtime navmesh links are changed. The native
map preview at `docs/maps/dzemael-approach-eye-20260914/early-sectors.png` was
inspected; its adjacent frame records that crop's transform.

Gullet unlock selects the Gullet route. Both Gullet circles select the existing
Grand Hall route. All five upper circles give the later corridor priority, and
Batraal retains final priority. Transfers reuse the same living owned Eye,
defer active native actions, share reservations with the later sectors, retry
failed admission and reject stale completion after progression changes. Native
cast holds remain unchanged. The optional Stables terminal cannot advance the
Eye's sector.

The footage establishes early presence and a named attack. The initial point,
routes, nine cast stops, cadence and exact sector triggers are empirical
reconstructions using recorded ground, not recovered retail patrols or live
collision confirmation. All 149 static rows, previous routes, SQL and user
positions remain unchanged. Ordinary mob homes still need their separate pass.

Verification: **346 production encounter checks**, **83 traversal checks** and
**336 Npc/Lua door checks** pass. All seven routes pass **29,310** production
movement-step guards in both directions, including 6,828 approach and 2,220
Gullet steps. Three new route tests, the existing early/corridor/final route
suites, 29 placement tests, six mage-ground tests and 18 coordinate tests pass.
The static validator parses six Lua files and now runs the new route suite.
Its first attempt caught an obsolete exact call-site token after the prepared
route argument was introduced; its updated checks pass. Release builds succeed;
the door harness retains only its existing unavailable NuGet vulnerability-feed
warning. This is a staged build, not a server installation or client clear.

## Small and large circle evidence review

The current code has two-player small circles, a four-player Grand Hall control,
and six-player large circles, using their distinct native variants. GM solo mode
changes occupancy to one after selecting the normal visual. This review preserves
those settings and records them in
`Data/raidroutes/dzemael_circle_count_review.json`.

Re-reading the August 2011 participant guide establishes successful 2/6 and
2/2/4 party assignments, not tested minimum requirements. Earlier wording in the
asset findings and this tracker overstated that evidence and is corrected.
Elemen calls all three Grand Hall controls small, which does not alone establish
equal numeric requirements. The later footage at 3:05 shows a two-mark circle;
at 3:10 another circle has at least three unobscured marks with the remaining
side covered by mobs. This supports retaining a distinct intermediate control,
without claiming an independently verified four-player minimum.

The same footage's Grand Hall log shows two cool-wind activations followed by
gentle wind at 3:15, then Field I deactivation and withdrawal by 3:20. Native
worldMaster rows 52026 and 52028 match those messages; the earlier Gullet pair
shows cool and crisp (52029). The five native wind rows contain no count field,
so their order is not a numeric threshold mapping. Runtime activation text has
not been changed in this evidence-only review.

A named level-52 Lava Drake is visible among pulled Grand Hall mobs at 3:10 and
3:15, before Field I completion. The current room roster has no Drake. Its home,
total count and spawn trigger need investigation; this sighting does not locate
an idle spawn and must remain separate from the three second-map objective
Drakes. Ordinary placement work remains active.

Verification: the new JSON parses, all twenty saved requirements and three
visual bindings match the current source, and both local evidence hashes match.
No runtime, coordinate, SQL or nav changes were made; compiled suites were not
rerun for this documentation-only review. Normal-party client acceptance and
later undersized-party behavior remain open.

## Grand Hall Lava Drake roster correction

The subsequent pass adds the missing level-52 Lava Drake established by the
3:10–3:15 footage. A 2:55 frame shows the party at a small circle among Imperial
enemies, with the northern room partly obscured. The available views establish
at least one Drake before Field I completion, but not its idle home or total
retail room count. One ordinary actor is added as a documented reconstruction.

Its home is frozen source-local node **318**:
`!pos 231 15.803935 173.575730 93.284020`. All three coordinates are recorded.
The northern-room selection is authored; the closest existing control is 10.12
horizontal yalms away and the nearest ordinary mob is 13.00 away. The adjacent
318–319 edge is captured support, not a new runtime nav link. The focused native
map preview at `docs/maps/dzemael-grandhall-20260914/grandhall.png` was inspected
with its saved frame. This is not a recovered retail home or live floor test.

`tools/mobspawns/darkhold_grandhall.py build|check|render` owns the new layer and
`Data/raidroutes/dzemael_grandhall_review.json` records its observations and
selection. The byte-identical prior 149-row manifest is frozen as
`Data/raidroutes/evidence/dzemael-20260914/positions-before-grandhall-roster.json`
with SHA256 `0a90428572781e028413bda32e53aa58f8c7f408cb9d79a77446dfc06bb24a23`.
The Chain builder now checks that historical output and refuses to overwrite
the later layer. The refusal was exercised and all current outputs retained
their hashes.

The runtime reuses BNPC 3143 / actor 2302201 with its existing level 52 profile,
HP and combat tuning. The new actor appears with ordinary Grand Hall enemies
after the Gullet pair, an inferred population trigger. Field I completion
withdraws it with the other hall enemies. Its objective flag is false; the
three second-map northern Drakes retain their exact keys, homes and exclusive
coffer membership. All earlier static rows, user positions, route files,
profiles and nav recordings remain unchanged. These private runtime actors
require no main SQL or migration changes.

There are now **150 static points**, including **128 recorded points**, three
user positions and nineteen scoped floor estimates. The 92 mob records comprise
80 staged enemies, nine summoned Chain Bearers, two bosses and one inactive
relocation anchor: 91 spawnable actors over the complete duty progression.

Verification: **351 production encounter checks**, **83 traversal checks**,
**30 placement tests**, six mage-ground tests, three approach-route tests and
18 shared coordinate tests pass. The static validator parses six Lua files.
Its first run exposed an obsolete prose token (`83 consecutive` versus the
guide's `83-point Grand Hall`); that documentation check now uses the current
wording. The room-roster regression was updated to include the observed Drake.
The Release build succeeds with the existing unrelated Blowfish CS0675 warning.
The new and historical builders' checks and `git diff --check` pass. No server
installation, restart or normal-party client clear was performed. The full
retail reconstruction remains active.

## Grand Hall control alignment and type assignment

The registered Elemen overlay places the hall's three controls on a diagonal
through the room, at source pixels `(307,254)`, `(312,261)` and `(319,267)`.
The prior middle control was west of that line. Source-to-native registration
has 1.11 native-pixel RMS error, but the guide symbols themselves occupy several
pixels and do not encode exact actor centers. The northern, middle and southern
guide estimates are approximately `(24.256,94.227)`, `(34.254,108.227)` and
`(48.252,120.228)` in world X/Z.

The footage at 2:55/3:05 shows a small control south/east of the tall central
rock. At 3:10 the party has moved farther north to the distinct circle beside
the Drake; its activation gives gentle wind at 3:15. Together with the guide's
relative arrangement, this supports assigning the existing four-player
interpretation to the northern control, with two-player forms in the middle and
south. The native minimum remains inferred, not a controlled threshold test.
The stable keys remain: `circlehallnorth` is now four; `circlehalllarge` is the
legacy identity of the middle small control; `circlehallsouth` remains two.
Their reward/progression identities and GM solo override are unchanged.

The northern point remains frozen node 369. The middle and south now use whole
XYZ from newer nodes 1683 and 1680, respectively:

| Control | Current command | Distance to guide estimate, before → after |
| --- | --- | --- |
| North | `!pos 231 25.911636 173.680020 92.710740` | 2.25 → 2.25 yalms |
| Middle | `!pos 231 38.216003 173.114620 111.568360` | 21.09 → 5.18 yalms |
| South | `!pos 231 47.409008 174.000000 119.381650` | 11.85 → 1.19 yalms |

These are guide-alignment distances, not measured retail position error. The
middle's remaining offset is explicit. All mob centers remain outside the
authored control radius; the closest is the existing middle Myrmillo at 3.80
yalms. That clearance is between actor centers and does not prove collision.
Every mob, including the new Drake, retains its preceding home.

`tools/mobspawns/darkhold_grandhall_terminals.py build|check|render` owns the
layer. `Data/raidroutes/dzemael_grandhall_terminal_review.json` records the source
pixels, registration hashes, before/after rows, count interpretation and support.
The prior 150-point output is frozen in `positions-before-grandhall-terminals.json`
under the September 14 evidence folder, SHA256
`e728a47d95c9ebd8042b21190d20f1ef5dcaccbaab30650302474370ce4dff75`.
The roster builder checks that historical output and refuses to erase the new
control layer; the refusal was exercised without changing current output hashes.

The newer 1,677-node recording is frozen independently at
`Data/raidroutes/evidence/dzemael-20260914/grandhall-terminal-ground/zone_231.tsv`,
SHA256 `44dec85d12585d80c53d2b9b60e7e7d3950b58a99a7d6ba9deaa7f4e52094085`.
The canonical manifest explicitly associates only nodes 1680/1683 with this
source and map 1. The loader verifies its hash, approved nodes, map and XYZ;
missing/wrong source, altered elevation or mismatched map fails validation.
The four captured support edges remain source-local. No recordings are merged
and no runtime nav links are created. There remain 150 static records: 126
primary recorded points, two supplemental recorded points, three user positions
and nineteen scoped floor estimates. No SQL, profile or route files changed.

The native preview at `docs/maps/dzemael-grandhall-terminals-20260914/controls.png`
was visually inspected with its frame. **354 production encounter checks**,
**83 traversal checks**, **33 placement tests**, six mage-ground tests, three
approach-route tests and 18 coordinate tests pass. New regressions cover the
per-control count/visual assignments and separation of the two recordings.
The static validator parses six Lua files, both historical builders and the
new builder check pass, and the staged Release build has zero warnings/errors.
No server installation, restart or normal-party client acceptance occurred.


## Native circle geometry correction and separate occupancy

The user's small-versus-large terminal question prompted a closer check of the
native model geometry. The previous consecutive 2/3/4/5/6 interpretation was
incorrect. The first embedded VMDL has duplicated position vertices along
seams: raw triangle components cannot be counted as distinct arcs. Welding
only identical signed-short XYZ triples gives e009/e008/e007/e006/e005 exactly
**2/3/4/6/8 arcs**, with respectively 22/22/16/12/10 vertices per welded arc.
A numeric X/Z projection was visually inspected; it is not a native renderer,
world-coordinate transform or recovered occupancy rule.

`tools/inspect_magitek_circle_vmdl.py` now reports this welding result as well
as the original topology and source SHA256. The five installed resources and
results are pinned in `Data/raidroutes/dzemael_native_circle_review.json`.
The earlier circle-count review remains frozen and historical. The July asset
report now explicitly corrects its unsupported upper labels and screenshot
interpretation; the actor/appearance/animation joins themselves remain valid.

Runtime `CircleSegments` and `RequiredPlayers` are separate content fields.
The existing Gullet six-player reconstruction now uses e006 / actor 1200205 /
active 0x04006000 / transition 0x04060000, replacing the incorrect e005 visual.
The six other large controls preserve their e005 appearance and provisional
six-person requirement. Their eight-segment geometry alone does not prove
later-patch minimum occupancy; this deliberate discrepancy remains open.
Small controls still require two, the northern Grand Hall control four, and
GM solo instances still use one without changing the configured appearance.
GM circle probes now support exactly 2, 3, 4, 6 and 8 with a shared selector;
unsupported values no longer silently choose e005. The command help was updated.

No placement, profile, SQL, nav recording, activation timer, progression flag,
reward membership or combat-terminal effect changed in this correction.
Native activation messages remain separate unfinished work.

Verification: the staged Release build has zero warnings/errors; **371
production encounter checks**, **83 traversal checks**, **33 placement tests**,
six mage-ground tests, three approach-route tests and 18 coordinate tests pass.
The static validator parses six Lua files and passes after updating its old
single-field Batraal control token. No server restart, install or normal-party
client acceptance was performed. Full retail reconstruction remains active.


## Native terminal and progression feedback

The preceding goal turn made progress by correcting native circle geometry and
separating visual segments from provisional occupancy. This pass leaves those
requirements intact and replaces the internal device-key activation line with
localized native feedback. Seven stable control keys now use directly observed
wind messages; unreviewed controls use the native generic activation row.
No message is selected from headcount or model ordering.

Original footage was re-opened in the browser and inspected at 1:36, 2:26,
2:36 and 6:00. It confirms the Stables unlock/new-wave messages; soothing wind
before Gullet unlock; cool/crisp inner-circle activations before Grand Hall
unlock/replacement; and soothing wind, withdrawal, transporter activation in
that order. Earlier Grand Hall and Deepvoid frame reviews supply Field I/II
bindings. Field III/IV log pairing follows native names and actual runtime
population changes, but has not been directly observed. The first-week guide
still gives party allocations rather than controlled large-circle minima.
No further occupancy change is justified by the newly inspected evidence.

`Data/raidroutes/dzemael_native_message_review.json` preserves the source CSV
hash, native rows, video timestamps, explicit key bindings and unresolved scope.
`TakeProgressNotices` only claims an earned, fully published stage whose door
unlocks or first-map transporter actor are ready. Field IV waits for both
barriers and announces once. Partial publication remains retryable; explicit
GM prepublication alone cannot manufacture normal progression. Claims occur
under the private-instance lock, packet sends outside it. Cleanup, finishing,
unpublished duty and pending victory suppress notices without consuming them.
Ordinary progress logs are not replayed as new events to late joiners.

Native gate and field selectors are one-based, inferred from the shipped
photocell grammar's positive one-through-ten mapping. Actual packet delivery
uses the existing worldMaster GameMessage path. Current message recipients
are all players in the private area; historical proximity filtering, exact
latency and live localization rendering remain unverified. Other Batraal-effect
and reward-eligibility announcements remain authored, as do unresolved headcount
policies. There are no placement, SQL, profile, nav or encounter-effect changes.

Verification: **400 production encounter checks**, **83 traversal checks**,
**33 placement tests**, six mage-ground tests, three approach-route tests and
18 shared coordinate tests pass. The static validator parses six Lua files and
passes. The staged Release build has zero warnings/errors. No server restart,
installation or normal-party client acceptance was performed. The complete
retail reconstruction remains active, including the quest-specific relic coffer,
unresolved boss presentation/rules, detailed placement fidelity and full client
clear/loot/exit verification.


## Personal Enchiridion coffer

The additional relic coffer is now implemented independently from the five
ordinary reward families. `DzemaelRelicCoffer.cs` owns the immutable clear
eligibility and per-player claim reservations; `DzemaelManager` publishes the
actor and routes direct inventory grants through the existing native item.
The Lua event bridge recognizes its separate stable identity.

The compiled client review and `RaidDungeonTreasureBox` resolver establish
quest 110868, item 10011244, ownership/capacity checks, direct personal inventory,
empty message 60027, failed-add message 25262, and scheduler 0x040C9000. The
scheduler is sent only to the opener, including empty/full outcomes. The coffer
remains available to the other eligible players throughout the reward window.
Failed inventory operations release their reservation; a successful claim
cannot be repeated in that private instance even after discarding the item.

The [July 23, 2012 participant guide](https://archylte.blog.shinobi.jp/Entry/360/)
supports post-Alumina collection and a fifteen-minute/five-coffer condition.
The [August 30 diary](https://esuesu-lodestone.blog.jp/archives/25203459.html)
describes an August 8 success and a member missing the personal coffer. The
existing Elemen guide remains preserved, including its ambiguous sixteen-minute
wording and blue-coffer description; the diary calls the coffer copper.

Implementation choices are explicit: inclusive elapsed <= 900 seconds, all
five ordinary reward conditions earned, candidates present at Batraal death,
current scaffold sequences 4–6, and one successful claim per person per instance.
The local sequence join follows Alumina hand-in `processEvent040_2` and ends at
Rowena's `processEvent060_1` exchange. Stage and item ownership are rechecked on
open. This is not recovery of the missing native `isDropDzemael` implementation.
Publication retries use the captured conditions, and the sixth actor waits for
all five earned ordinary coffers to publish. Previously opened ordinary coffers
retain their publication identity and cannot block a later retry.

`darkhold_relic_coffer.py build|check|render` freezes the prior 150-point manifest
at SHA256 `dfd22526800c27e35a8dc9c34e25a6c3643025264ddec46c9c29b1ecc1c70f09`.
It adds only `reward.enchiridion`, primary node 1139:

`!pos 231 78.349190 149.472210 -145.209320`

The native-map preview was inspected. The point is between mapped pillars,
6.66 yalms from the nearest existing reward home. It retains whole recorded XYZ,
but **has no captured incident edges**. Nodes 1138 and 1140 are nearby samples,
not invented nav links. Its eastward location is an authored separate home,
not proof of the guide's camera-relative rightmost slot. All five earlier coffer
homes and every other placement remain unchanged. There are now 151 static
points: 129 recorded (127 primary, two supplemental), three user positions and
nineteen scoped floor estimates. Earlier builders check their frozen historical
layers and cannot erase the new coffer.

Evidence and limits are saved in
`Data/raidroutes/dzemael_relic_coffer_review.json`; the review image and pixel
frame are under `docs/maps/dzemael-relic-coffer-20260914`.
The existing main SQL already defines Enchiridion; this private runtime addition
requires no public spawn or item-table change.

A Relic Reborn remains a disabled incomplete quest scaffold. The precise drop
sheet/table IDs, original coffer actor and row placement, exact time boundary,
and normal-client personal open/loot flow remain unverified. No deployment,
server restart, normal-party clear or full relic-quest completion is claimed.

Verification: **434 production encounter checks**, **84 traversal checks**,
**34 placement tests**, six mage-ground tests, three approach-route tests and
**18 shared coordinate tests** pass. The static validator parses six Lua files.
Relic and historical terminal builders pass `check`; the current coffer preview
was visually inspected. Final Release build: zero warnings/errors. `git diff
--check` passes. The full retail reconstruction goal remains active.


## Native completion-coffer appearances (2026-09-15)

The prior turn implemented the personal Enchiridion claim; this turn corrects
the completion coffers' appearance. All six previously inherited the shared
guildleve coffer's b923/e003 presentation. The existing source ambiguity was
resolved by opening the actual image linked immediately beside the Enchiridion
receipt in the [August 2012 participant diary](https://esuesu-lodestone.blog.jp/archives/25203459.html).

The [original 1024-by-683 screenshot](https://livedoor.blogimg.jp/esu_esu_51/imgs/7/3/7314667f.jpg)
shows four closed blue/silver coffers, one closed red/gold coffer and a copper/black
coffer open beside the player at camera-right. Its red interior and Enchiridion
x1 receipt are visible. The diary's copper description agrees with that image.
Elemen separately identifies the fixed base reward as red and the four condition
rewards as blue; its blue description for the relic coffer remains a conflicting
textual source rather than overriding this direct visual observation.

Native model files explicitly reference their respective `o_v11_tbx01_ch`,
`02_ch` and `03_ch` textures. Those textures were decoded from the installed
PWIB shared pixel buffer and reviewed: e001 has copper trim/black panels/red
lining; e002 silver trim/blue panels/red lining; e003 gold trim/red panels/blue
lining. This supports the distinct variants rather than assigning colors from
map legend marks or treating scheduler 201 as an appearance selector.

`ConfigureTreasureCofferAppearance` runs in the private actor's
`configureBeforeAdd` callback, after construction and before publication:

| Reward | Native family | Body value |
| --- | --- | ---: |
| Fixed Batraal | b923/e003, red/gold | 3072 |
| Orobon, all circles, time, all regular coffers | b923/e002, blue/silver | 2048 |
| Personal Enchiridion | b923/e001, copper/black | 1024 |

Only these reward identities are changed. All 151 placements, source recordings,
loot pools, claim conditions, animations, personal claim reservations and
ordinary route/objective coffers remain unchanged. The actor class is still the
existing 1200161 substitute; no original retail numeric actor ID or server-owned
appearance/spawn join has been recovered. No shared SQL binding is altered.

`tools/inspect_dzemael_coffer_appearance.py build|check|render` pins both model
and texture hashes, verifies the representative appearance rows and model-to-color
resource references, and writes `Data/raidroutes/dzemael_coffer_appearance_review.json`.
The reviewed native texture comparison is
`docs/maps/dzemael-coffer-appearance-20260915/native-variants.png`.
These are unlit native textures; shader effects, pose and client lighting are not
recreated. The historical photo does not calibrate world positions or prove live
opening/retry/re-entry behavior in this implementation.

Verification: final Release build succeeds with zero warnings/errors; 434
production encounter checks, 84 traversal checks, 34 placement tests, six mage
checks, three approach-route checks and 18 shared coordinate tests pass. The
static validator parses six Lua files. The appearance inspector and unchanged
relic placement builder pass `check`. This is progress toward the active retail
goal, not a complete normal-party client acceptance.

Next reward audit: the same preserved Elemen reward section says the base red
coffer can contain zero to two equipment pieces; the current pool selects one
to two. It also lists gil, Grade 5 Dark Matter and Vampire Plant possibilities.
Those reward-table/probability gaps remain separate from this appearance fix.

## Coffer item rolls and filmed clear window — 2026-09-15

The preserved Elemen reward section, lines 355-373, specifies zero to two
equipment pieces in the fixed red Batraal coffer and one in each conditional
blue coffer. The manager previously forced one or two pieces in the red chest.
It now allows zero as well. Regular and zero-equipment red rolls can award
Grade 5 Dark Matter or Vampire Plant, both listed in Elemen and already present
in the main item SQL as 10013005 and 10009612. Existing equipment pools remain.

The original one-in-six regular equipment chance is retained. The uniform
zero/one/two count selection, equal common-item weights, one-unit quantity and
placement of common items in the fallback branch are authored. The source does
not give those probabilities or establish whether common items accompany
equipment. The four conditional blue rewards continue to select one equipment
piece. This corrects supported possibilities without claiming a recovered
retail drop table. No SQL data change is needed for these existing items.

The source and policy are recorded in
`Data/raidroutes/dzemael_coffer_loot_review.json`. Selection now passes through
`GetPendingCofferItems` so the production policy and persistent `RaidCofferRolls`
can be exercised together. The existing delivery protection was already sound:
full packs retain the initial roll, partial delivery retains only the undelivered
item, and the coffer records an open only after completion. Tests cover retries
where the new random branch would otherwise replace a common item with equipment
or replace a pending second equipment item with common loot. Shared roll code,
other dungeons and the personal Enchiridion path are unchanged. The runtime guide
also corrects obsolete statements that failed delivery consumed the coffer and
that dead players were excluded from the ordinary award candidates.

Direct browser inspection of Sylvarion Ryulong's
[original run at 14:13-14:18](https://www.youtube.com/watch?v=WmJxkVbowSI&t=853s)
found another actionable mismatch. After Batraal's defeat, the general log shows
the departure notice and **five minutes remaining**. `RewardCofferSeconds` is
now 300 rather than the previous authored 90. Both the server finish deadline
and the closing-scene end-time argument use this value. The manual exit remains
available during the window; the existing finish latch prevents a later timeout
from replacing the clear deadline.

At 14:08, the battle log already records the kill, while the general log retains
an earlier 523-gil award and a Grade 5 Dark Matter entry. At 14:13-14:18, a new
1,331-gil award for all party members appears among final equipment entries.
The recorder is dead until raised. These observations support a party gil award
but do not identify its exact coffer or establish a distribution/range. No fixed
gil value is introduced, and no remote source video was downloaded.

Validation: staged Release build succeeds with zero warnings/errors; **456
production encounter checks** and **84 traversal checks** pass. The static
validator passes six Lua parses, 34 placement tests, six mage-ground tests and
three approach-route tests. All 18 shared coordinate tests pass. The 151 static
positions, all source recordings and previous placement layers remain unchanged.
This was an offline implementation/verification pass, with no server restart or
normal-party client clear. The full retail goal remains active, including gil,
reward combinations/probabilities, exact remaining placement/encounter behavior,
the complete relic quest and live clear/loot/exit acceptance.

## Warrior-wave feedback and source-clock audit — 2026-09-15

The [Blue Garter original run](https://www.youtube.com/watch?v=WsaKqBbe4kY&t=580s)
retains a native new-wave announcement during the ten Hellsbound Warriors'
battle, after a terminal activation. The implementation had no corresponding
wave cue. `TakeProgressNotices` now claims native row 52033 once after Deepvoid
defeat, all four seal controls, lower-hall publication and all ten canonical
warrior registrations in the same private area. A reserved placement key does
not by itself establish a successful spawn. Partial publication remains
retryable, and completed objectives, teardown and pending victory suppress
stale announcements.

The warrior-death callback previously sent custom text claiming that Field IV
had fallen immediately after requesting the next population. That message is
removed. The existing native field-clear/replacement pair still waits for the
complete replacement population and both barrier unlocks. The source at 9:50
directly shows that pairing, with experience messages interleaved; at 8:00 it
also directly shows Field III followed by new-wave feedback. Both were formerly
marked inferred in `dzemael_native_message_review.json`. These early-1.x
observations corroborate the preserved guide and native rows without proving
later-patch packet timing or any particular terminal's minimum occupancy.

`Data/raidroutes/dzemael_video_clock_review.json` records eight observed
countdown samples. Over playback 7:30–10:00, 150 video seconds correspond to
270 dungeon seconds, with each adjacent sampled interval giving **1.8**.
Playback labels remain seek coordinates; use the dungeon countdown for timing.
This sampled acceleration is not a claim about every frame or an exact patch.
The visible Rank/Physical Level UI identifies an earlier era than the later
level-52 footage. The separate `SYWtisRBS-0` Chain Bearer review's countdowns
track its playback intervals; its timers are not rescaled. Frozen placements,
route evidence, nav recordings and earlier baselines remain unchanged.

The same review finds 419 party gil with Dark Matter after Deepvoid and a
visible dark coffer at 8:22 followed by 359 party gil and Warlock's Buckler.
The latter establishes an early-era equipment/gil combination, but neither
sample establishes a reward range. The coffer's lighting and resolution do not
resolve its native variant. An [August 2011 participant report](https://forum.square-enix.com/ffxiv/threads/22222/?page=2)
also conflicts with guaranteed equipment in every final coffer. The loot review
preserves that disagreement; the later Elemen-based policy is retained without
claiming it applies to every 1.x patch. No speculative probability or fixed gil
amount is added.

Verification: staged Release build has zero warnings/errors; **484 production
encounter checks**, **84 traversal checks**, **34 placement tests**, six mage
ground tests, three approach-route tests and **18 coordinate tests** pass.
The new checks exercise incomplete/foreign/wrong-class publication, every seal
control, stopped/defeated duties, a previously killed warrior, concurrent claims
and independence from barrier/objective completion. The static validator parses
six Lua files. This remains offline verification; the complete normal-party
client route and full retail reconstruction are not established.

## Captain's Quarters comparison — 2026-09-15

The [separate review](../Data/raidroutes/dzemael_captain_placement_review.json)
and [map preview](maps/dzemael-captain-review-20260915/captain-review.png)
compare the existing room with the preserved Elemen overlay. The orange marker
is centered approximately at original image pixel `(366.5, 302.5)`. The accepted
map-two registration maps it to X/Z `(-32.71995, -17.75175)`. The room/quest text
names Imperial Primus Ordinarius here after Field IV, but the overlay does not
explicitly identify its orange marker: interpreting that symbol as the captain
remains an inference.

The captain's existing node **1363**, XYZ `(-31.7318, 171.39915, -15.231469)`,
is the nearest primary map-two recorded point, **2.707 yalms** from the estimated
marker center. This supports retaining its current home. The approximate
3.5-source-pixel symbol radius corresponds to about seven yalms; it records
manual symbol-reading precision, not a bound on retail coordinate error. No
source Y is inferred. Artwork-registration RMS is likewise not a retail error
bound.

The two Myrmillo, one Speculator and one Veles homes remain authored. The guide
does not establish those four individual points, counts or facing. All five
homes retain their whole primary-recording XYZ. Captain node 1363, eastern
Myrmillo node 1361 and Veles node 1369 have **no captured incident edges**;
Myrmillo node 1365 and Speculator node 1367 each have one. The preview draws only
captured edges and keeps the existing Alpine War Jacket coffer as context.
The earlier coffer review and every placement layer remain unchanged.

Reproduce with `python -B tools/mobspawns/darkhold_captain_review.py
build|check|render`. `build` writes only the separate review; it does not write
canonical placement JSON, C#, nav data or SQL. Source images, HTML, registration,
native frame and primary capture are hash-pinned. `check` compares the five
current homes and retained coffer with the saved review. The preview's frame
covers only its left native-map plot and rejects the guide inset/margins.

Verification: the review and latest relic placement-layer checks pass, along
with **34 placement tests** and **18 shared coordinate tests**. The rendered
map was inspected. This comparison narrows the captain's location evidence;
it does not establish guard homes or live-client clearance, targeting, combat
or a complete dungeon clear.

## Deepvoid dungeon/event identity correction — 2026-09-15

The enrage investigation found an earlier identity error. The runtime and BNPC
3014 seed selected Atomos-event actor **2102507**, using its shared English name
to identify the dungeon boss. The native actor, graphic and localized-name sheets
preserve two distinct identities:

| Use | Actor class | Native name row | Japanese name | Size ordinal | Head / body |
| --- | --- | --- | --- | --- | --- |
| Atomos event family | 2102507 (also 2102508) | 3102507 | ディープヴォイド・スレイヴ | 7 | 5120 / 2048 |
| Darkhold boss | 2302501 | 3202503 | ディープヴォイドスレイヴ | 3 | 0 / 2048 |

The dungeon spelling matches the preserved Elemen guide. The event variant has
the same dotted family naming as the other Atomos Deepvoid actors, and its e005
head package is the persistent event aura reviewed in the existing September 7
asset extraction. It is not a trigger for the separately reported half-health
enrage. The suggestively named `OgreR0D1Raid01` script instead joins to Porus,
actor 2202504 / name 3202505; that candidate was rejected after checking the name
row. Script filenames and identical English names alone are insufficient joins.

`DzemaelManager`, the main `server_battlenpc_mob_types_loot.sql` and the optional
live BNPC seed now bind **3014 to 2302501**. Native actor/appearance tables and
Atomos actors are unchanged. The runtime continues to use level 55, authored
18,000 HP, damage 135 and skill list 34 with its existing eight commands. No
enrage cadence, reward, route, static coordinate or other profile is changed.

`tools/mobspawns/darkhold_deepvoid_identity.py build|check` reproduces the
[identity review](../Data/raidroutes/dzemael_deepvoid_identity_review.json) and
current canonical manifest. Its baseline preserves the previous 151-point relic
output byte-for-byte. All earlier manifests retain their historical actor field;
the loader permits that obsolete join only when a non-active file's entire hash
matches one of nine frozen snapshots. Edited history and the active manifest
reject it. The relic builder's check audits its historical output and its build
guard prevents it from erasing the correction. Generated C# ground data is
unchanged because every position and BNPC ID is preserved.

Verification: **486 production encounter checks**, **84 traversal checks**,
**37 placement tests**, six mage-ground tests, three approach-route tests and
**18 coordinate tests** pass. The Release build has zero warnings/errors; the
static validator parses six Lua files. Added checks compare native appearance
fields, enforce the production boss definition, preserve all earlier coordinates
and reject use of historical identity exceptions in current or modified files.
The new identity check and Captain comparison check also pass.

This closes the actor-selection error, not the whole enrage presentation. Native
size ordinal 3 is not a new measured client size. The half-health flames, hidden
combat timing and complete normal-party client clear/loot/exit remain open.
No live database import, server restart or client rendering test was performed.

## Deepvoid native half-health flame binding — 2026-09-15

The following layer implements the separate limb effect left open by the identity
correction. `tools/inspect_dzemael_deepvoid_flames.py build|check` reproduces
`Data/raidroutes/dzemael_deepvoid_flame_review.json` directly from the pinned native
ogre skeleton and BID packages. It writes no client assets or placement data.

Native CIBB `info_m037` has an ordinal split of four and a supported bit mask of
`0xF0`, placing bit 7 in the advertised bit-state partition. The recovered client
dispatcher maps that bit to `init_msb7_1` / `init_msb7_0`. The on scheduler's typed
ActionClip references `msb_7_1`; its ACB references VINS `1UGmYVvleafinst`. Four
typed leaf references and the attachment table identify left/right hands and
left/right feet. The leaf references VEFF `4leD72ogr_hokb6` and retains the native
authoring path `ogre_m037/berserk_loop/ogr_hokb6t.veffbin`. Both the off scheduler
and the native death scheduler explicitly cancel `init_msb7_1` at time zero.
The review stores source/resource hashes, typed reference offsets, raw metadata
and scheduler entries. Timing remains in raw SCB units.

The native resource binding matches the supplied historical synthesis's limb
flames, but does not recover a retail server trigger or packet capture. Runtime
keeps the existing inclusive half-health threshold and authored combat cadence.
`DzemaelDeepvoidFlames` is attached only to the live dungeon actor in its owned
private instance. It waits for the current AI action to permit a state change,
sets only mode bit `0x80`, and initializes each viewer through SubState followed
by the existing active-model X00/X01 envelope. This is the same explicit model
commit mechanism already used by Ifrit; it does not claim a retail Darkhold wire
capture or live visual confirmation.

Every new range binding queues a delayed replay against the current SubState,
with a neutral initial spawn state. Both queue and director update use UTC.
Generation-checked session batches reject unbound, superseded, transitioning or
removing actors and retry failed delivery. One viewer's delivery exception does
not strand the others. Existing viewers are not replayed when another enters
view. Death/cleanup discards pending work and restores the previous flame bit and
spawn deferral, preserving unrelated mode changes. No Active Mode packet is sent
to a corpse, foreign actor or retired lifetime. The native death scheduler owns
the visible loop cancellation.

Verification: **530 production encounter checks**, **84 traversal checks**, all
**57 Darkhold Python placement/route tests**, and **18 coordinate tests** pass.
The Release build has zero warnings/errors. The static validator parses six Lua
files and checks the runtime attachment, UTC spawn hook and cleanup binding.
The native flame review and identity checks pass; all 151 static XYZ remain
unchanged. New production checks inspect actual packet bytes and ordering,
half-health boundaries, action deferral, initial spawn state, per-viewer retries,
range re-entry, scope rejection, exception recovery, death and cleanup.

Remaining: live Darkhold flame rendering, exact visual onset and action overlap;
original combat timing; all other outstanding placement, hazard, terminal,
reward/relic and normal-party clear/loot/exit requirements in the full tracker.
This turn changes no SQL, client package, static coordinate or combat value,
and performs no server restart, live database import or client clear.

## Batraal native weapon aura and north-terminal control — 2026-09-15

`tools/inspect_dzemael_batraal_aura.py build|check` reproduces the new
`Data/raidroutes/dzemael_batraal_aura_review.json` from pinned native m054 skeleton
and BID packages. The actor graphic join confirms Batraal 2303501 uses model
10054, size 3, head 0 and body 1056. These native rows are unchanged.

CIBB `info_m054` advertises bits 4/5 with ordinal split four. `init_msb4_1` has
typed ActionClip references to `m054_aura_r` and `m054_aura_l`; each ACB references
a VINS/leaf branch reaching the same `gargoyle_054/weapon_aura` VEFF. Their native
attachment ports are `EID_SUBT_EFF2` and `EID_SUBT_EFF3`, respectively. The review
records typed reference offsets, resource hashes, metadata, native source paths
and raw scheduler entries. It does not independently map those ports to bones.
Elemen describes glowing hands as the attack boost and the small north terminal
as temporarily removing it. `init_msb4_0` explicitly cancels `init_msb4_1`. Bit 5
instead contains a separate motion/chant state, which this layer preserves.

The current 80-percent empowerment now requests the native aura. North-terminal
suppression requests off alongside its damage reduction; expiry requests on
again. Damage changes retain their existing immediate behavior while visual
changes wait for an AI action boundary. Pending requests coalesce to the latest
state. No 60-second duration or 125/165 damage claim is promoted to recovered
retail data. The empowerment latch is claimed under the instance lock; foreign,
dead, finishing and cleaning bosses cannot enter it or use north suppression.

The two native boss bindings share `DzemaelBossModelState` for state-bit ownership,
action deferral and packet delivery, preserving all earlier Deepvoid behavior.
The delivery pass is serialized, retains retries per viewer, initializes current
state on range re-entry and sends state changes to previously initialized
viewers. It preserves unrelated mode bits and uses UTC for the post-bind delay.
The active-model commit envelope is an authored integration with existing server
presentation code, not a recovered retail packet capture.

Batraal's `dead` SCB has no explicit aura-cancel clip. The scoped death hook
therefore restores the owned state bit and publishes passive SubState before
the existing `InternalDie` transition and normal DEAD commit. It injects no
separate Active Mode action. Death preparation and retirement are idempotent.
Live death-time effect cleanup, visual onset, lighting and action overlap remain
unverified; the offline packet test is not a client rendering test.

Verification: **567 production encounter checks**, **84 traversal checks**,
**18 coordinate tests**, and the Dzemael static validator pass; the latter
includes **37 placement**, six mage-ground and three approach-route tests, plus
six Lua parses. The Release build has zero warnings/errors. Both native boss
effect reviews reproduce successfully. The new tests cover the real empowerment
and north-terminal methods, actual on/off/on packet bytes, concurrent updates,
late entry while suppressed, newest-state replay, bit-5 preservation, ownership
rejection and death preparation. Existing Deepvoid checks remain green.

No SQL, placement, loot, combat numeric value or client asset changes in this
layer. The full reconstruction remains open: live boss effects and normal-party
clear/loot/exit, exact encounter timing, remaining placement evidence, hazard
routes/cadence, terminal minima/undersized parties, reward probabilities/gil and
the incomplete relic quest still require work.

## Chain Bearer native visibility source review — 2026-09-15

The formation-presentation investigation found native hide/show controls in
the installed Chain Bearer model, m505. The separate reproducible review is
`Data/raidroutes/dzemael_chain_visibility_review.json`, generated/checked by
`tools/inspect_dzemael_chain_visibility.py build|check`. Actor 2304302's native
graphic join confirms model 10505, size 3, head 0 and body 1056. Native CIBB
advertises mode bit 4; the corresponding BID schedulers contain a bind clip and
one `RaptureCharaColorFadeClip` each.

The recovered consumer changes the interpretation of these records. Native
`008262A0` reads **full-record +0x14 as transition duration**, which is zero in
both states. Full-record +0x18 is instead the component mask: `0x00000008` for
hide and `0x80000008` for show. `008422E0` uses bit 8 to select alpha and directly
assigns the target when duration is zero. Hide targets alpha zero; show targets
alpha one and forces the start value. Neither specifies an eight-frame fade.
The 40,000-unit SCB block length is also not the opacity-transition duration or
a hidden warp dwell. The review retains raw records, offsets, native consumer
references and hashes so the interpretation can be independently reproduced.

The original kaeko1 run, *Batraal v1.18 Speed Run in 23:36*, was revisited in the
browser at 7:50, 7:55, 9:05 and 9:10. Their displayed countdowns were 52:09,
52:04, 50:54 and 50:49; each timestamp/countdown sum is 3,599 seconds, consistent
with the earlier original-run timing. The minimap arrangements support the two
formation changes. The camera, off-screen bodies and combat effects do not
expose a single ghost continuously enough to time its disappearance/reappearance.
No Blue Garter acceleration is applied to this source.

This is a native capability/source review, not an applied visibility layer.
The current `WarpToPosition` presentation remains unchanged. Implementing the
correct hide/relocate/show sequence still requires validation of position-packet
mode, ordering and hidden interval, with per-actor action admission, late-viewer
initialization, targetability/nameplate behavior and cleanup. Material alpha
alone does not establish those other behaviors. Both nine-point formations,
all 151 static points, individual command deferral/reservations, retries and
existing dwell policy are preserved.

Verification: the new native review's **build and check both pass**. Native
model metadata, both complete color records, zero durations, channel masks and
target alpha values are asserted against pinned source bytes. No runtime, SQL,
coordinate, client package or combat value changed in this source-review pass.

## Chain position-packet presentation — 2026-09-15

The next native trace changes the integration decision: the existing Chain
`WarpToPosition` call already requests hide/relocate/reappear behavior. It sends
`0xCE` with arrival type 7 and zoning flag zero. `0058B2A0` enters the arrival
state machine; stage zero issues internal actor message `0x27 {0,type}`, which
the renderer handles with immediate alpha zero. For non-local actors, stage
three applies the destination and player-only loading/readiness work is skipped.
Stage fourteen issues `0x27 {2,type}` and the renderer selects the POP effect.
For type seven, `0065AAB0 -> 0065AAD0` requests category 15, character bank zero,
effect seven: `0x0F000007`. Internal `0x27` is not a network opcode.

The new reproducible review is `Data/raidroutes/dzemael_chain_warp_review.json`,
built and checked with `tools/inspect_dzemael_chain_warp.py`. It pins the native
executable, POP-7 package, existing position/arrival exports and the additional
renderer/color-adapter export. Reproduce the latter with
`tools/decompile_dzemael_chain_warp.ps1`; its Ghidra script verifies the imported
executable hash and opens the project read-only. The review also checks the
renderer selection instructions directly against executable bytes.

POP-7's main scheduler contains bind, sound, VFX ActionClip, color-fade and sync
clips. Its typed VFX references reach `pop7` through one ACB/VINS/leaf chain,
attached at `EID_BODY_STA`. Three color records initially set alpha zero, later
target alpha one with brighter RGB, and finally restore RGB to one. Their raw
start offsets are 0/160000/260000 and transition counts are 0/10/20. These are
different quantities. Neither the native stage count nor the scheduler block
length establishes a wall-clock hidden interval; ClipSync behavior also matters.

The added `0065EF60` trace resolves the interaction with the earlier model-state
review. Accepted SCB color selector zero is mapped to native color storage slot
one. Thus POP-7, the initial arrival hide and m505's hide/show controls all write
the same storage. They are not independent opacity layers. The existing warp is
retained, with a code comment explaining why an extra m505 sequence must not be
added without evidence. No authored hidden timer or combat-admission rule is
introduced by this pass.

The new test executes production `UpdateChainBearers`, `Actor.WarpToPosition`,
Area broadcasting and the Session lifetime gate. It captures eight immediate
packets and the ninth after its actor's command boundary. It checks native mode
7/flag zero, each exact reviewed destination, stationary spawn home, facing,
floating height, cleared walking updates, preserved model state and no duplicate
or additional model-commit packets. An unbound viewer receives none. The fixture
has connected/visibility-ready sessions and a spatial block; it is not a game
client or a substitute for a normal-party run.

Verification: **608 production encounter checks**, **84 traversal checks**,
**18 coordinate tests**, both Chain native review checks and the Dzemael static
validator pass. The static validator includes 37 placement, six mage-ground,
three approach-route tests and six Lua parses. Release builds have no warnings
or errors; the normal Git whitespace check passes.

This establishes the current packet's native binding, not the retail Chain
Bearer selector. Matching POP-7 against footage/live rendering, exact hidden
timing, target/nameplate/minimap behavior, action overlap and range-entry
initialization remain open. Both nine-point formations, all static positions,
cadence and earlier runtime behavior are unchanged. No SQL, server restart,
live import or client clear was performed. The full reconstruction requirements
above remain active.

## Four-player retail route contradiction — 2026-09-15

The next source review found a directly relevant later-period run:
[kaeko1's four-person five-chest clear](https://www.youtube.com/watch?v=0H-vgjk0saE).
The expanded participant description dates the run to March 31, 2012, shortly
after 1.21a; the page displays publication on April 2. The four named participants
are Kaeko Leta, Katsu Kobashi, Seiken Valk and Miko Neversleeps. The review is saved
in `Data/raidroutes/dzemael_light_party_review.json`, with the seek positions,
countdown readings, native message context and inference limits.

This changes the terminal investigation from missing confirmation to a known
implementation discrepancy. The large Stables circle contains all four named
players at 1:47 and 1:52; by 2:02 the gate is visibly open and its unlock/new-wave
messages are in the log. At the Gullet gate, all four bodies are visible within
the large artwork at 2:43, 2:47 and 2:57; activation/unlock are in the log by 3:02.
The inner Gullet pair is complete by 3:52, with the existing cool/crisp message
bindings and Grand Hall unlock/withdrawal/replacement. At 23:30 all five final
coffers and the same light-party roster are visible after Batraal's defeat.

Current production `UpdateDevices` cannot reproduce those early controls with
four players: each hard-six requirement resets qualification indefinitely. This
is a source contradiction even though the existing offline behavior tests pass.
It is not resolved by GM solo mode. A complete fix must cover the required and
reward-counted controls throughout a normal four-player route, not only admission
or the first gate.

The replacement rule is not recovered yet. The footage does not distinguish a
lower minimum, party-size scaling, accumulated occupation or a different charging
time. The sustained visible gate occupation also makes the universal 1.5-second
hold doubtful, but the samples do not prove a universal 15-second hold or exact
server radius. Next compare timed four/eight-player activations of the same
small, intermediate and large controls. Preserve each native appearance and
stable message binding while reconstructing that rule.

Two reward observations are retained separately. At 1:22 the log contains a
1353-gil party award and one Grade 5 Dark Matter fragment; the opening action was
not inspected. At 23:30 the departure notice grants **three minutes**, differing
from the later five-minute source already used by the current implementation.
Neither observation establishes a distribution or patch-change date. The coffer
loot review links both period observations and retains the later-period policy.

This pass changes source evidence and the active fidelity assessment. It does
not change runtime counts, hold times, SQL, any of the 151 XYZ, or the earlier
Chain/native-effect work. No normal-party client validation is claimed. The
complete reconstruction remains active, with the terminal contradiction now
prioritized ahead of further Chain appearance speculation.

The subsequent full-party comparison is saved in the same review. Sylvarion
Ryulong's `WmJxkVbowSI` shows the large Gullet gate occupied around 1:46–2:00,
activation around 2:01 and the unlock/new-wave log by 2:05. These are approximate
seek landmarks; approaching members, overlapping bodies and asynchronous player
state prevent a controlled qualification-time measurement. An eight-person
roster is not proof of eight continuous occupants. The recovered
`RaidDungeonRect` Lua contains empty event stubs and supplies no missing server
formula. Neither comparison justifies adopting a universal 15-second hold.
The known four-player blocker remains open; counts, visuals and timers are
unchanged by this additional evidence review.

## Empirical terminal charging correction — 2026-09-15

The normal route now accumulates occupation instead of rejecting any group below
six. `Data/raidroutes/dzemael_terminal_charge_review.json` records the additional
small-circle samples, candidate-rule limits and complete twenty-control table.
`DzemaelTerminalCharge` uses capacities 2/4/6/8 with ten seconds at full capacity:
four continuing players take twenty seconds on an eight-capacity gate, while two
take ten seconds on a small control. All twenty controls use this policy through
the same route publication path, including boss summons and reward-counted
controls. Explicit GM probes and GM-solo route checks retain their existing short
hold and remain separate from normal-party evidence.

The directly observed result is that four players can finish the retail route.
The linear charge law, contributor caps, ten-second full-capacity duration,
single-occupant extrapolation and reset policy are **authored reconstruction**.
They are compatible with the sampled waits and preserve useful small/large party
assignments, but the footage does not uniquely establish them. A fixed lower
minimum or nonlinear model remains possible. This removes a confirmed behavioral
contradiction without claiming that exact terminal fidelity has been achieved.

Only continuing eligible IDs receive elapsed credit. Death, disconnection,
zoning, protected combat scenes, other areas/floors and distance exclude a player.
Empty/unavailable/rearmed controls reset, as do unsampled intervals above two
seconds and complete occupant replacement. Duplicate/backward timestamps cannot
add charge. Existing stage gates, native notices, boss effect clocks and reward
history continue through their existing activation paths. The separate visual
arguments explicitly preserve every native appearance and all 151 static XYZ.
No SQL changes are needed for these private runtime control rules.

Verification: Release builds pass with zero warnings/errors; the encounter harness
passes **746 production checks**, including all twenty charge configurations with
four through eight occupants, actual large-gate activation with every party size
from four to eight, a two-player small circle, interruption/exclusion cases and
diagnostic behavior. Traversal passes **84 checks**; shared coordinates pass
**18 tests**; the static validator passes six Lua parses and 37 placement, six
mage-ground and three approach-route tests. This is offline validation. No server
restart, live import, client floor check or normal-party clear/loot/exit is claimed.


## Persistent terminal power and completion presentation — 2026-09-15

The prior runtime left extra-stat `0x80` set after terminal activation. It also
played the short completion effect at spawn, after a delayed activation callback,
on reconnect, and on timed rearming. That did not reproduce the filmed circle
extinguishing, and conflated the persistent v1 model effect with its short v2 LIB
counterpart.

`tools/inspect_dzemael_terminal_presentation.py build|check` now reproduces a
focused audit from pinned installed-client hashes. Its review JSON preserves all
conditional SCB blocks for e003-e009 and the six e004-e009 completion banks. The
seven initializers share the same reviewed `extrastat`/`0x80` conditional bytes;
the matching v1/v2 typed resource references remain distinct. Decoding the nested
blocks also corrects an older report: the clear branch has a chant-sync clip,
not an immediate KillClip. Effect-end and kill records are in the effect block.
This is a native resource audit, not a new decode of the conditional evaluator.

`DzemaelTerminalPresentation` now clears only `0x80` on earned activation and
restores it on rearm. A generation-checked viewer batch publishes extra stat
before the exact current private appearance, followed by the matching completion
bank once on activation. Spawn, idle updates, rearm and reconnect do not replay
that one-shot. Known viewers retry failed delivery independently. New session,
actor-table and range bindings invalidate pending completion effects; a rearm
coalesces undelivered work to the latest powered state. The scoped NPC spawn hook
uses an independent concurrent binding counter and does not acquire the
presentation lock while holding the session gate. Removed/foreign actors and
cleanup cannot publish. No delayed animation callback remains.

This keeps the twenty charging configurations, native visual variants, terminal
positions, all 151 static XYZ, SQL, progression/reward history, boss-effect clocks,
Toto-Rak and separate warp actors unchanged. The activation envelope is a
reconstruction using the established extra-stat/appearance pattern, separately
client-tested for Toto-Rak. That evidence does not prove exact Darkhold rendering,
retail completion-bank choice or packet timing.

Verification: Release build passes with zero warnings/errors; **820 production
encounter checks** pass, including every e004-e009 visual binding, current-state
packet ordering, single completion, unrelated-bit/appearance preservation,
reconnect/rearm, viewer retry and all invalidation paths. Traversal passes **84
checks**, shared coordinates **18 tests**, and the static validator passes its
six Lua parses plus 37 placement, six mage and three approach tests. The focused
native source check passes. Full normal-party client combat/loot/exit, floor and
visual acceptance remain open; the complete retail objective is still active.

## Gate-scene identity and playback boundary (2026-09-15)

`tools/inspect_dzemael_gate_scenes.py build|check` now produces
`Data/raidroutes/dzemael_gate_scene_review.json` directly from two pinned native
scene packages and the pinned Darkhold layout. It decodes their actor bindings,
all relevant blocks, indexed String resources, background-action references and
local staging; it also follows the layout UnitTree to its six door instances.
This is evidence recovery, not an applied runtime transition.

- `rad0r102` has two conditional background-action records explicitly naming
  `roc_r0_dun01` and `isgrp_001406`. That is the native Stables door instance.
  Its compact `Actor_swich` binding is actor index 5 / native actor 1200204.
- `rad0r103` also stages actor 1200204, using the standard `Gimic` record.
  Its circle is nearest to native Gullet instance 1408, but both background
  actions name `time_door_a1_open`. This is a shared timeline owned by six
  instances, so its string alone cannot identify one door. Gullet remains a
  spatially supported association, distinct from the explicit Stables join.
- The earlier named-`setup` parser failed on `rad0r103`. Its actual initial
  block nevertheless contains `RaptureBgSetupClip` and actor `SetPosClip`
  staging. The new decoder records those values without a world transform.
- The action records' trailing words are preserved as `[16,1]` and `[18,0]`.
  Their native dispatch semantics have not been decoded here.

The [four-player run](https://www.youtube.com/watch?v=0H-vgjk0saE&t=118s)
shows a black screen, the duty timer and a **Skip this event?** prompt near the
end of video second 118, immediately around the Stables unlock. This strengthens
the earlier observation of darkening at 117-118: an event prompt is visible.
It does not expose the scene ID or body. At the Gullet terminal, reviewed frames
at 180, 181 and 184 seconds show ordinary gameplay before activation, during
soothing-wind feedback and after the unlock. These samples do not prove that
no intervening event occurred or establish later-patch repeat-viewing behavior.
The [August 2011 participant guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
also describes two early skips, without identifying their scene IDs.

At the end of that evidence-only pass, runtime called only `rad0r100` and
`rad0r106`. The subsequent implementation below adds the Stables event. The next scene work
must resolve the Stables trigger/viewing conditions and Gullet's playback rule,
then integrate progression dispatch with player event ownership and cutscene
combat protection. Neither gate scene establishes a separate transporter scene.
No terminal, mob, coffer, route, charging rule, SQL row or static XYZ changes in
this audit. The complete normal-party route, combat, loot, exit and live-client
visual checks remain required for the retail objective.

Verification for this evidence-only pass: the focused `check` reproduces both
scene reviews, four background actions, both terminal actor bindings and all six
shared door instances from the installed native bytes. `git diff --check` passes.
The current manifest still contains 151 positions. No C#/Lua/SQL behavior changed,
so the previously recorded 820/84/18 runtime/traversal/coordinate results above
are prior results, not fresh live-client or runtime validation for these scenes.

## Applied Stables gate scene (2026-09-15)

The native Stables asset `rad0r102` now plays through the recovered occupancy
handler after the Stables terminal is earned, its room is fully published, and
traversal reports gate 1406 unlocked. `DzemaelGateScene` captures the current
living connected players once. It queues one `stablesGateScene` invitation per
player, before that traversal update's native progression notices. It waits for
busy events/cutscenes and director publication, retries failed packet admission,
and never resends a successfully queued invitation blindly.

The incoming Lua `noticeEvent` must obtain authorization and the original duty
deadline from `BeginDzemaelStablesGateScene`. The server checks the exact private
area, director object, current player/session, actor generation, event owner,
known director and active duty. Only a queued invitation can be consumed, once.
Client-provided scene, argument and timer values are ignored. The existing
combat-protection wrapper calls native `eventNoticeCutScene` with `rad0r102`,
argument zero and that original deadline, preserving its fade, native scene/skip
and widget flow. This does not start a new sixty-minute timer.

Departure, zoning, death, replaced/superseded sessions, changed actor generations,
timeout, pending victory and cleanup prevent stale playback. Late arrivals do
not receive earlier gate scenes. GM `nocs` and director-suppressed probes do not
queue this event. Gullet, Eye introduction, boss introductions, the existing
entrance/victory scenes and inter-map transport retain their preceding behavior.
The 151 placements, charging, boss/hazard state, rewards and SQL are unaffected.

The native instance reference and filmed Stables skip prompt support this
implementation. The once-per-run current-player audience, busy-player deferral,
argument zero and exact dispatch timing are explicit reconstruction choices;
the footage does not establish per-character first-view rules. Live rendering,
interaction with the native door animation/proximity controller, and normal-party
acceptance remain unverified. Remaining intermediate scenes are still required
work, alongside the full retail placement/combat/loot/exit objective.

Verification: serial Release builds pass with zero warnings/errors; **880
production encounter checks** pass, including real 0x012F packet construction,
four/eight-player audiences, deferred/retried dispatch, duplicate/concurrent
events, stale ownership, lifecycle invalidation and deadline preservation. The
Lua checks run the actual director script and protection wrapper against the
recovered native handler, asserting fade, scene and widget calls while protected.
The Lua authorization return and rendering calls are test doubles; production
C# authorization is exercised separately. This is not a live client. Traversal passes **84**
checks, coordinates **18** tests, and the static validator passes **seven** Lua
parses plus 37 placement, six mage and three approach tests. The native gate-scene
audit reproduces successfully. Full retail completion remains unproven.

## Applied Deepvoid introduction (2026-09-15)

The [August 2011 participant guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
describes buffing in the ogre circle and skipping its introduction before the
opening combat actions. Fresh inspection of its linked
[run at 6:25](https://www.youtube.com/watch?v=SYWtisRBS-0&t=385s) resolves an actual
skip-event Yes/No prompt with duty timer 53:34. Adjacent sampled frames show
black/dark world presentation and the returning party HUD. The event is skipped;
the footage exposes neither its cinematic body nor a numeric scene ID.

`tools/inspect_dzemael_deepvoid_scene.py build|check` now reproduces the separate
`Data/raidroutes/dzemael_deepvoid_scene_review.json` from pinned native bytes and
actor sheets. Native `rad0r104` has standard actor bindings for PC/seven party
members, Orga 6500031 and four Gost actors 6500036. Its ogre base 10037, size 3,
head 0 and body 2048 match the live dungeon actor 2302501. The cinematic ghosts
use the Forsaken Soul display name but the same reviewed appearance as Chain
Bearer. The schedule references `midboss01` and scene-specific motion assets.
Together with the observed summon event, this supports using `rad0r104` for the
Deepvoid introduction. The association remains an inference from complementary
evidence, not recovery of the original server trigger.

The director now sends `deepvoidIntroScene` after earned Deepvoid activation,
Feasting Hall publication and actual tracking of the boss plus all nine canonical
Chain Bearers. A reserved placement key cannot substitute for a published actor.
The original living connected audience receives one invitation each. Incoming
events check instance/director ownership, current player/session/generation,
event owner, duty deadline and live encounter before consuming their invitation.
The existing protected native handler supplies fade/skip/scene/widget behavior
using `rad0r104`, argument zero and the unchanged dungeon deadline.

The delivery helper now shares per-player invitation slots between Stables and
Deepvoid. This closes the gap between queuing a kick and the client returning its
event: two ready controllers cannot enqueue competing scene requests during
that interval. Consumption, failed packet admission and invalidation release
only that request's reservation. A running event or combat-protection marker
continues to defer the other scene. This works in either order, including an
optional Stables scene earned after the Deepvoid invitation. Busy players defer;
late/replacement viewers receive no historical scene. Boss death, retired
ownership, GM nocs, timeout, cleanup and pending victory suppress stale playback.

All 151 XYZ, the nine combat Chain Bearers, both formations, boss/hazard combat
rules, loot/relic and SQL stay unchanged. Four cinematic ghosts do not revise
the combat roster. Scene-local positions include airborne staging and are not
converted into spawn homes or floor evidence. The original per-character viewing
flags, argument selection, precise dispatch order and live rendering remain
unknown; the implemented per-run audience and dispatch policy are explicit
reconstruction choices.

Fresh validation: Release builds pass without warnings/errors; **1,385 production
encounter checks**, **84 traversal checks** and **18 shared coordinate tests**
pass. The encounter count includes existing actor-fixture assertions; the new
behavior coverage checks partial publication, owned actors, all four/eight-player
invitations, concurrency, both scene orders, one-use redemption, stale sessions,
failed queue admission and boss death. Lua runs the actual director and protected
wrapper against the recovered native handler, with assertions replacing client
rendering and authorization return values. Production C# authorization is tested
separately. The static validator passes seven Lua parses, 37 placement tests,
six mage tests and three approach tests. Both native scene audits and
`git diff --check` pass.

The next scene investigation is Batraal's missing introduction and its native
`rad0r105` candidate, including initial-wave publication and interaction with the
existing protected event flow. The full retail objective remains active: the
remaining scenes, placement/route uncertainty, terminal rules, loot/gil/relic
limitations and an actual normal-party clear, loot and exit still need resolution.

## Applied Batraal introduction and summon feedback (2026-09-15)

Fresh inspection of the [August 2011 run](https://www.youtube.com/watch?v=SYWtisRBS-0&t=882s)
shows the party occupying the large final-arena summon circle at 14:32, followed
by the soothing-wind activation at 14:42 / duty clock 45:17. At 14:44 the world
is black while the complete activation message remains readable. A frame late
in 14:45 / 45:14 shows the native skip-event Yes/No prompt. At 14:47 the world
and party HUD return and Batraal's magitek-field line appears in the log. These
samples establish a skippable summon event. They do not expose its cinematic
body, scene ID, exact duration or first-view rules.

`tools/inspect_dzemael_batraal_scene.py build|check` and
`Data/raidroutes/dzemael_batraal_scene_review.json` reproduce the native comparison.
`rad0r105` contains 15 standard actor bindings: the party, a gargoyle matching
Batraal's base 10054 / size 3 / head 0 / body 1056, four cinematic skeletons and
two Ahrimans. Its scheduler references `boss01` and scene-specific motions. The
separate existing `rad0r106` victory asset contains a GOAL actor. This comparison,
combined with the filmed final summon event, supports the introduction binding
by inference; list ordering or the gargoyle name alone would be insufficient.

The shared SCB reader now handles this asset's aligned String table: 47 valid
offsets occupy a 96-byte table whose last word is zero padding. Only trailing
zero words are ignored. Interior zeros still fail closed, and references cannot
resolve to padding. This permits decoding all 40 relevant staging clips from
the pinned Batraal schedule while preserving earlier gate/Deepvoid outputs.
Scene-local XYZ remain cinematic staging, not server coordinates or floor data.

`batraalIntroScene` is now queued after earned summon activation, completed Field
IV route, FinalChambers publication and actual tracking of the owned living boss.
It shares the existing invitation slots with Stables and Deepvoid, checks
player/session/generation and director ownership, and consumes each request
once. Lua supplies `rad0r105`, argument zero and the original duty deadline to
the protected native handler. Busy events defer; late arrivals, replaced
sessions, boss death, removed ownership, cleanup, timeout, pending victory and
GM nocs cannot replay an old introduction.

The initial three combat Purgatory Knights keep their existing engagement or
direct-damage fallback. The introduction can run before engagement and neither
waits for that wave nor creates it from a per-player scene callback. Four
cinematic skeletons do not alter the combat roster. Exact publication timing
between the skipped scene and the first combat wave remains a live comparison.
The summon also now selects native wind row 52030 by its stable `batraalsummon`
key, replacing the generic activation fallback. The observed message does not
establish any other terminal's feedback, charging rate or occupancy requirement.

Fresh verification: Release builds pass without warnings/errors; **1,519
production encounter checks**, **84 traversal checks** and **18 shared coordinate
tests** pass. New coverage exercises incomplete/foreign boss publication, earned
progress, one-use incoming events, four/eight-player audiences, shared slots in
either Stables/Batraal order, cancellation of an obsolete Deepvoid invitation,
retries, lifecycle invalidation and preservation of the initial-wave trigger.
The actual Lua director/protection wrapper/native handler are exercised with
client rendering replaced by assertions; forged scene/timer arguments cannot
change the call. The count includes preexisting actor-fixture assertions. The
static validator passes seven Lua parses plus 37 placement, six mage and three
approach tests. All three scene audits and `git diff --check` pass.

All 151 static XYZ, both Ahrimans and their routes, later boss waves, combat
parameters, coffers/relic and SQL remain unchanged in this pass. Per-run audience,
argument zero and exact dispatch timing remain reconstruction policy. Live
rendering, viewing flags and full party combat/loot/exit acceptance are unproven.
The active retail objective still includes the early Eye/Gullet scene sequence,
remaining placement/route uncertainty, terminal rules and unresolved loot/relic
details; adding both boss introductions does not complete that objective.

## Early Eye scene and native layout registration — 2026-09-15

The first twenty-five seconds of the [2011 participant run](https://www.youtube.com/watch?v=SYWtisRBS-0)
now establish two separate events. At 0:10 the entrance panorama shows a skip
prompt; at 0:15 and 0:20 the party is running down the entrance passage. A second
event fades in late at 0:21, shows the native Skip label at 0:22 and a Yes/No
skip prompt at 0:23. The world returns at 0:25; the first new-wave message is
visible by 0:30. This corroborates the participant guide's two early skips.
It does not expose the second scene's numeric ID or a measured trigger volume.

`tools/inspect_dzemael_eye_scene.py build|check|render` writes the pinned
`Data/raidroutes/dzemael_eye_scene_review.json`, generated
`Map Server/Dungeons/DzemaelEyeIntroTrigger.cs`, and the
[approach preview](maps/dzemael-eye-scene-20260915/approach-trigger.png).
Native rad0r101 contains PC, three cinematic party actors, an Ahriman whose
appearance matches All-seeing Eye, and the `enter01` resource. Its scene-local
root is `(-48.576,18.478,245.750)`.

The layout settings object `roc_r0_dun01` at relative `0x22680` has translation
`(-16,188,32)` at member `+0x40`, physical file offset `0x27110`. Applying that
translation to native instances 1410–1412 agrees with their unchanged canonical
SQL bindings within 0.0005 yalms (SQL's three-decimal precision). The later
corrected first three door actors are excluded from this comparison. This is
new native registration evidence, superseding the earlier lack of a Darkhold
scene/world registration; it is not a new heightmap or retail spawn recovery.

The translated scene root is `(-64.576,206.478,277.750)`. Its closest complete
recorded point is primary node 23 at `(-63.14275,206.89755,276.4752)`, 1.964
yalms away in 3D. The map render and its frame were inspected. This point now
anchors a separate authored eight-yalm horizontal, three-yalm vertical trigger.
The exact frozen recording, source-local node and incident edges are preserved.
Neither scene-local nor translated cinematic actors replace any of the 151
static positions; the entrance and all hazard routes remain unchanged.

`UpdateEyeIntroScene` waits for complete Approach publication and a tracked live
Eye in the owned instance, then earns the scene when a living connected player
reaches the volume. The current eligible audience receives one-use invitations
through the existing shared slot controller. `BeginDzemaelEyeIntroScene` validates
the exact session/director and returns the original duty deadline; the Lua
director calls the protected native handler with rad0r101 and argument zero.
Busy events defer. Replacement sessions/actors and late arrivals receive no
old event; Gullet progression, cleanup, expiry, victory and nocs invalidate or
suppress it. Scene completion does not spawn actors or advance objectives.

Fresh verification: Release builds pass with zero warnings/errors; **1,606
production encounter checks**, **84 traversal checks**, **18 coordinate tests**,
seven Lua parses, 37 placement tests, six mage tests and three approach tests
pass. All four native scene audits pass. New production coverage verifies the
entrance exclusion, radius/floor boundaries, invalid coordinates, publication
and ownership prerequisites, busy deferral, shared Stables invitation slots,
Gullet cancellation, duplicate and stale incoming requests, replacement Eye
rejection and the actual native Lua call with forged client parameters ignored.

The second-event/rad0r101 association, audience and trigger volume are explicit
reconstruction choices. Exact later-patch viewing rules, first-wave publication
order, normal-party scene rendering and client acceptance remain open. The
full goal still includes Gullet scene policy, placement/patrol refinement,
terminal timing, unresolved loot/relic details and normal-party clear/loot/exit.

## Gullet scene comparison and preserved terminal positions — 2026-09-15

The [launch participant run](https://www.youtube.com/watch?v=SYWtisRBS-0&t=113s)
now provides a direct Gullet event observation. At 1:53 the party occupies the
large terminal with Stoneskin effects. At 1:55 / clock 58:04 the presentation
is black with the native Skip label. A brief frame at 1:56 / 58:03 shows the
Yes/No skip prompt over a cinematic view of the blue terminal and gate steps.
At 1:58 / 58:01 the world/party HUD returns and the Gullet-unlocked/new-wave
messages are present. Whole-second player labels include multiple distinct
frames; the prompt and later black/HUD frame both occur within 1:56.

The [March 2012 four-player run](https://www.youtube.com/watch?v=0H-vgjk0saE&t=179s)
provides a different sampled sequence. The circle is occupied at 2:59; a late
3:00 frame has activation feedback and normal gameplay. Protect resolves in
the 3:01 sample; a late 3:02 frame already contains Gullet-unlocked/new-wave
messages. At 3:04 the player is casting Repose, and at 3:09 the party passes
through the doorway. No skip prompt appears in these reviewed frames. This is
not an exhaustive absence claim, evidence of removal by a named patch, or proof
of a party-size/first-view condition.

`tools/inspect_dzemael_gate_scenes.py` now shares `native_layout_registration`
with the Eye audit. It reads the pinned layout owner/translation and checks
the three unchanged canonical door bindings. Gate review schema v2 compares
the native cinematic circles against both current device rows and their
original separately scoped user observations:

| Scene / device | Translated cinematic XYZ | Saved user XYZ | Separation (3D) |
| --- | --- | --- | --- |
| rad0r102 / Stables | 65.820, 180.820, 201.950 | 65.563, 180.500, 199.840 | 2.150 yalms |
| rad0r103 / Gullet | 129.030, 180.180, 202.520 | 128.901, 180.046, 200.182 | 2.345 yalms |

These near matches strengthen the scene associations. The Gullet background
action still names a shared timeline instead of instance 1408 explicitly.
Neither comparison recovers a live terminal center: the user supplied player
XYZ for placement, and those observations explicitly leave floor/retail
confirmation open. All 151 static positions remain unchanged. The shared helper
also reproduces the existing Eye review and generated trigger exactly, without
rewriting either artifact.

Automatic Gullet scene dispatch remains unresolved and unimplemented. A later
eight-player unlock or direct native viewing-state evidence is the next useful
comparison. Do not invent an eight-only or first-view rule to explain the two
recordings. Existing Stables/Eye/boss scene behavior, routes, charging, combat,
coffers/relic and SQL are unchanged by this evidence pass.

Fresh verification: all four native scene audits pass; the shared coordinate
suite passes all **18 tests**; the static validator passes **seven Lua parses,
37 placement tests, six mage tests and three approach tests**. There is no new
production C#/Lua change or live-client test in this pass. The full retail goal
still requires viewing-policy resolution, remaining placement/hazard refinement,
terminal timing, unresolved loot/relic behavior and normal-party clear/loot/exit
acceptance.

## Later full-party Gullet and native coffer notices — 2026-09-15

The later [Sylvarion Ryulong full-party run](https://www.youtube.com/watch?v=WmJxkVbowSI&t=121s)
now provides the missing comparison with the March 2012 four-player footage.
At 2:01 the party occupies the active eight-arc terminal; a later sample shows
it fading. At 2:02 the circle is gone and the party begins to separate. At 2:03
Gullet-unlocked feedback appears as the player turns toward the steps, followed
by the new-wave message while climbing. Normal gameplay HUD remains visible at
2:04 and after passage through the door at 2:06. The gate stays physically closed
until approached, consistent with the existing unlocked proximity-door behavior.

These browser samples include six observations separated by fifteen frame-step
inputs around 2:01-2:03, not a frame-complete audit. No black fade or Skip is
observed in them. Visible Paladin/Holy Succor and Full Party HUD support later
1.x; the expanded page's August 14, 2013 upload date does not date the run. The
player overlay obscures the duty clock, so no new charging constant is inferred.
The gate builder and v3 review preserve the samples and these limits.

The same review now pins the native `cutscene_common.lua`, `cutscene_u.lua` and
OnceBeacon preface facade hashes. For the current call, `startCutScene` orders
desktop mode 61, shows Skip and invokes `_play`; the reviewed Lua body has no
explicit first-view or party-count query. `_play_cpp` and the original server
dispatch policy remain unrecovered. A class named OnceBeacon does not establish
a Darkhold first-view predicate. Keep Gullet without forced rad0r103 playback
as the later-1.x reconstruction supported by both later party sizes. Preserve
the launch event and translated staging as historical association evidence;
exact per-character and patch viewing rules remain open. No scene runtime or
placement adjustment is needed for this evidence update.

Successful party coffer delivery previously printed custom assignment text with
internal coffer names, followed by regular-coffer counters and a reward-eligibility
announcement. It now uses native worldMaster **25033**. The pinned source has
explicit quantity/item/quality parameters, unlike the similarly worded 25021's
implicit item context. The packet binds the actual recipient and passes 1,
item ID and NQ ordinal 0. This gives the client its own loot-list wording, item
formatting and Your/player-name grammar. Visible wording supports that choice;
footage does not expose the original numeric message ID or packet.

`tools/inspect_dzemael_coffer_messages.py build|check` reproduces
`Data/raidroutes/dzemael_coffer_message_review.json` from the pinned message bank.
Delivery is recorded before feedback. Failed items receive no success notice and
remain pending; the opener receives neutral unclaimed-treasure feedback instead
of incorrectly attributing every failure to full loot packs. Solo GM delivery
keeps neutral item-find text because it may enter normal inventory. Regular
coffer counters and all-six eligibility remain in server state/logging. Reward
rolls, partial retries, private appearances, personal relic behavior, all 151
static XYZ and SQL are unchanged. Gil and original drop-table work remain open.

Fresh verification: **1,612 production encounter checks**, including six native
coffer wire assertions; **84 production traversal checks**; **18 coordinate
tests**; the static validator's **seven Lua parses, 37 placement, six mage and
three approach tests**; all four native scene audits and the new message audit.
The encounter Release build succeeds with four existing dependency audit
warnings (DotNetZip and System.Security.Cryptography.Xml across two projects)
and no errors; the traversal harness build has no warnings or errors. The new
packet test was corrected to inspect the outgoing wire bytes independently;
the shared incoming Lua reader consumes a value beyond its terminator and is
not a suitable bounded decoder here. No shared parser change was made.

No deployment, database import or live-client clear was performed. Native
localized rendering, distant-party recipient names, original packet/animation
ordering, live loot transfer and retry, terminal timing and full normal-party
clear/loot/exit acceptance remain unfinished parts of the active retail goal.

## Captain guard formation refinement — 2026-09-15

The [later full-party run at 12:29-12:30](https://www.youtube.com/watch?v=WmJxkVbowSI&t=749s)
provides an idle-room view missing from the earlier guide comparison. After
Field IV deactivation and withdrawal/new-wave feedback, the player enters the
coffer pocket at 12:25 / 47:11 remaining. Turning away at 12:29 / 47:07 exposes
a compact standing group with yellow nameplates. The overlapping labels are
consistent with Primus, two Myrmillo, Speculator and Veles, and level-52 guard
labels are visible. The next sampled angle at 12:30 / 47:06 retains that group
as the player leaves. No attack/chase or red engaged label is observed in these
samples; at 12:31 the camera has turned out of the room. This is stronger home
formation evidence than positions during a pull, but does not recover exhaustive
counts, exact rank order, facing or individual coordinates.

The prior five actors spanned 24.88 yalms in X, with 25.67 yalms between the
farthest pair. The four guards now occupy an empirical **7.5-by-5.5-yalm** envelope
around the retained Captain. The resulting largest separation is 9.30 yalms.
These numerical dimensions and the assignment of roles to slots are authored
choices based on the compact filmed appearance. No uncalibrated video pixel is
converted to XYZ, and neither the image nor a native map establishes elevation.
The guide-compared Captain remains at node 1363 and the coffer at node 1364.

| Guard | New X, Y, Z | Containing triangle nodes | Horizontal move |
| --- | --- | --- | --- |
| Myrmillo A | -28.000, 172.058377, -20.500 | 1363, 1369, 1370 | 10.08 yalms |
| Myrmillo B | -35.500, 172.307031, -20.500 | 1364, 1368, 1369 | 9.47 yalms |
| Speculator | -35.500, 171.456072, -15.000 | 1363, 1364, 1368 | 11.08 yalms |
| Veles | -28.000, 171.572715, -15.500 | 1362, 1363, 1371 | 9.31 yalms |

Each Y uses barycentric interpolation inside its listed triangle in the frozen
primary map-two recording. All weights are positive and sum to one. The selected
support has less than two yalms of vertical range, longest triangle edge below
14 yalms and farthest sample below 12 yalms. These support bounds limit the
estimate; they are not collision polygons, captured movement edges or a general
heightmap. The validator accepts the exact four keys and their recomputed source
metadata, rejecting borrowed keys, wrong maps/recordings and modified XYZ/support.

The [new review](../Data/raidroutes/dzemael_captain_guard_review.json) and
[rendered comparison](maps/dzemael-captain-guards-20260915/formation.png) are
reproduced by `tools/mobspawns/darkhold_captain_guards.py build|check|render`.
The canonical private-placement JSON and generated C# include the correction.
All **147 other position rows** and all 151 stable identities remain unchanged,
as do BNPC profiles, rotations, progression, quest credit, coffer reward rules,
SQL, recordings and runtime routes. Current provenance is **125 recorded XYZ**
(123 primary and two separately recorded controls), **three user positions** and
**23 scoped estimates** (ten warriors, nine Chain homes, four Captain guards).

The complete preceding output is frozen at
`Data/raidroutes/evidence/dzemael-20260915/positions-before-captain-guards.json`,
SHA256 `6e648ff1b4e1c730d0e4dc9dd280fd387e8599124de64339ee674a90d3956862`.
The earlier Captain comparison now reads this historical input, preserving its
original evidence and preview. The Deepvoid identity check also audits that
frozen output; its existing build guard refuses to erase the later guard layer.

The formation preview was inspected. Calculated minimum horizontal actor spacing
is 3.74 yalms and coffer clearance 3.05; live model clearance, floor acceptance,
targeting, aggression/linking and quest-clear behavior remain unverified. The
full retail objective remains active, including other individual homes, complete
hazard behavior, terminal timing/presentation, unresolved loot/relic details and
normal-party clear/loot/exit acceptance.

Verification for the guard layer: **40 placement tests**, **18 shared coordinate
tests**, the static validator's **seven Lua parses, six mage and three approach
tests**, **1,612 production encounter checks** and **84 production traversal
checks** pass. The new layer, historical Captain review and historical Deepvoid
identity checks pass. The encounter Release build has no errors and the four
existing dependency audit warnings; the traversal harness builds without
warnings/errors. No SQL import, deployment, server restart or live-client run
was performed. The next focused guard review should compare facing/sight and
the filmed coffer approach before treating this reconstructed formation as
retail-accurate behavior.

## Captain coffer approach and shared facing correction

The follow-up examined the production sight path before changing the five
Captain rotations. At that time, the zero detection flag in their BNPC
profiles fell back to Sight and Darkhold used an authored 18-yalm range.
The later private aggression revision gives Imperials sight/true sight and
a 24-yalm initial radius; its current report reflects that revision. All five
initial rotations remain zero. The shared
facing calculation had two concrete defects: `Actor.IsFacing` converted its
degree argument into radians before passing it to a helper whose cone width
is a fraction of PI, and that helper's bearing returned zero for every
same-X target. The new production regression failed on the first case:
rotation zero, target directly along +Z, 40-degree width.

The corrected actor predicate uses `Atan2(deltaX, deltaZ)` and a wrapped angular
difference, consistent with the existing `LookAt`/server rotation convention.
It preserves the callers' numerical widths: 40 degrees for actor/sight, 90 for
the coordinate default, and 120 for the attack-state caller. These widths are
existing server choices; the fix does not establish retail cone width or range.
This is a shared actor correction, so ordinary sight and attack-facing users
outside Darkhold also receive it. The command-AoE helper, strict encounter AoEs,
independent gaze predicate, hitbox-overlap detection and line-of-sight policy
are unchanged.

The [production report](../Data/raidroutes/dzemael_captain_facing_review.json)
evaluates the current five homes/rotations against exact coffer node 1364.
Only `captain_myrmillo_b` contains the coffer anchor in its corrected sight cone.
This audits the facing predicate, not complete aggro or safe interaction:
the player's offset from the coffer, continuous approach, contact radii and
line of sight are still relevant. No new yaw, guard passivity or quest gating
is justified by this result. All 151 static position rows, combat profiles,
SQL, routes and prior frozen placement layers remain unchanged.

Reproduce the report after building `tools/dzemael-encounter-tests` in Release:

```powershell
dotnet .tmp/dzemael-retail-tests-20260914/DzemaelEncounterTests.dll --captain-facing-report Data/raidroutes/dzemael_captain_facing_review.json
```

The [later run](https://www.youtube.com/watch?v=WmJxkVbowSI&t=744s) was also
reviewed through the actual opening. At 12:24 (duty 47:12), the player approaches
the room edge beside the idle Imperial group. At 12:26-12:27 (47:10-47:09), the
coffer is targeted and the 523-gil message is absent. At 12:28 (47:08), its lid
is visibly open, the player turns away, and the all-party 523-gil line appears.
At 12:29 (47:07), the Grade 5 Dark Matter loot-list line follows. This strongly
supports assigning the previously unattributed sample to this coffer opening;
off-camera party actions prevent claiming packet-level causality. The new
`captain_coffer_opening_review` in the
[loot evidence](../Data/raidroutes/dzemael_coffer_loot_review.json) records each
sample. This is one reward outcome, not a fixed amount, distribution bound or
drop probability. Gil remains unimplemented. No pursuit or attack is seen in
these samples; yellow names by themselves do not establish passive behavior.
No player XYZ or guard yaw was recovered from the footage.

Verification: **1,880 production encounter checks** pass, including 268 new
facing/default-width/LookAt and current Captain-anchor checks. The earlier
version failed the added forward-axis regression before the correction.
**84 production traversal checks**, the static validator (**7 Lua parses,
40 placement tests, 6 mage tests, 3 approach tests**), **18 coordinate tests**,
shared mob aggro/hitbox contracts and end-of-patch combat contracts pass.
The guard-layer and native coffer-message checks pass. Builds succeeded;
encounter retains the four dependency audit warnings, the broader combat
harness has its existing vulnerability-feed/obsolete-API warnings, and
traversal builds without warnings. No deployment or live-client run occurred.
The full retail goal remains incomplete: exact guard yaw, whole coffer approach
and normal-party acceptance still need direct validation alongside the tracker’s
other encounter, reward and presentation gaps.

## Boss attack-shape correction

Following the actor-facing fix, the separate production command-targeting path
was checked using the existing Darkhold attack shapes. Three shared geometry
defects were reproduced:

- `Vector3.IsWithinCone` lost same-X bearings and mishandled wrapped negative
  rotations. Deepvoid's forward/rear cones could miss their own axes and admit
  some side targets. The helper now uses a wrapped `Atan2` bearing with the
  existing fraction-of-PI width contract; it also handles the cone origin.
- `TargetFind.IsWithinBox` left relative Y at zero. Desolation's shape test
  therefore ignored its configured vertical extent. Relative Y now comes from
  the target minus the resolved box origin.
- Ordinary `IsWithinCircle` measured vertical distance from the caster even
  when the circle was centered on another actor. Inferno Drop's height now uses
  its resolved target origin, matching its horizontal center.

These changes repair shared shape mathematics. They do not change SQL, attack
selection, command IDs, damage, cast time, the 40-percent Desolation gate,
cadence, floor-separation/eligibility filters, actor homes or patrol routes.
The correction also applies to other commands using these helpers. Garuda's
separate strict-geometry path and the independent gaze predicate retain their
existing behavior.

The reviewed main-SQL dimensions used by the new fixtures are:

| Command | Existing shape policy | Origin |
| --- | --- | --- |
| 23041 Double Smash | 12-yalm forward cone, width 0.25 PI / 45 degrees | Caster |
| 23042 Elbow Drop | 12-yalm cone, width 0.25 PI / 45 degrees, rotation offset 1 PI | Caster's rear |
| 23043 Inferno Drop | Eight-yalm circle | Selected target |
| 23590 Desolation | 20-yalm length, two-yalm width | Caster's forward line |

All four have the existing total height ten. The zero geometry fields in the
initial INSERT rows are superseded by the later canonical UPDATE statements;
the Batraal director preserves the resulting box dimensions in its execution
copy. These numerical sizes remain authored server policy, not recovered retail
hitboxes. The tests use those reviewed values as fixtures, not a database import.

The new `tools/dzemael-encounter-tests/TargetGeometryChecks.cs` exercises
`BattleCommand.ConfigureTargetFind`, production self/target origin resolution
and the actual cone/box/circle predicates. It checks cardinal and wrapped
rotations, forward versus rear, inside/outside angular/radius boundaries,
vertical boundaries and a resolved origin independent of subsequent caster
movement. Its focused command is:

```powershell
dotnet .tmp/dzemael-retail-tests-20260914/DzemaelEncounterTests.dll --target-geometry-only
```

Before the correction, **178 of 232 checks passed**, exposing **54 failures**.
Afterward, all **232 pass** and the full encounter harness passes **2,112
production checks**. The fresh traversal build passes **84 checks**. The static
validator passes **7 Lua parses, 40 placement, 6 mage and 3 approach tests**;
all **18 coordinate tests** pass. The Garuda cast/outcome/geometry suite passes
**368 checks** against the newly built Map Server assembly, and shared combat
and mob-aggro/hitbox contracts pass. The main build succeeds with the existing
dependency-audit warnings and `Blowfish.cs` sign-extension warning; Garuda and
traversal harness builds have no warnings/errors.

This is offline shape verification. It does not establish command admission,
collision, damage balance, native telegraph matching, exact retail dimensions
or a live dodge test. All 151 static placements remain intact, and no deployment,
SQL import, server restart or live-party run occurred. The full retail goal
remains active with those encounter measurements and client acceptance open.

## Private aggression and pursuit revision (2026-09-15)

The player's client review identified the former 24-yalm Darkhold spawn leash
as visibly short and estimated dungeon territory near 125 yalms. Private
ordinary mobs now return only after moving 125 X/Z yalms from their spawn home.
This does not make the initial pull radius 125. Bone Nix, Alpgrot Orobon and
Recluse Hippogryph use a 15-yalm initial radius; other hostile dungeon mobs use
24. The passive All-seeing Eye and Soulgazer remain at zero.

The local eLeMeN period family capture records Nix as sight, ghosts and wights
as hearing, drakes and moles as hearing, and Orobon/Hippogryph as smell. The
Darkhold policy combines the user's observation with that source: Nix uses
sight/true sight; Orobon and Hippogryph add scent; undead variants use
sound/scent. These combined senses, true-sight flags and numerical distances
are authored reconstruction values, not recovered native fields. Production
floor separation and line of sight still apply. The full evidence and policy
are in `Data/raidroutes/dzemael_aggression_review_20260915.json`.

The updated release build passes **2,333 production encounter checks**, the
static Darkhold validator, shared aggro-sense/hitbox semantics, the general
detection-range contract and end-of-patch combat contracts. The range fixture's
stale exact Spindiggle speed assertion now follows the canonical SQL value six;
no production speed or Darkhold behavior changed in that test-only correction.
No live Darkhold pull/return acceptance has been recorded for this revision.

## Eye Death March location area (2026-09-16)

The user identified the current Eye ability as too small: retail Death March is
a massive area attack based on the Eye's location. The archived All-seeing Eye
page independently says the invulnerable patrol pauses at particular locations
and casts even when no players are nearby. The early period run records Death
March damaging the player during the gate/Gullet sequence, while the eLeMeN
family entry classifies it as a damaging area-around-target move. These sources
establish the mechanic direction but do not expose a numeric retail radius.

The owned Darkhold Eye now receives a private command-23379 execution profile:
a 30-yalm circle centered on the caster at each held authored route stop. Thirty
yalms is an explicit reconstruction value from the user's large-area correction,
not a recovered command field. Existing total height ten retains same-floor
filtering. The route already waits for action completion before moving, so the
origin stays at the cast location. All route XYZ, stop keys, sector changes,
movement speed, cadence, damage data, animation and recipient masks remain
unchanged.

The general SQL row is deliberately unchanged. Ordinary Ahriman and Dodore keep
the shared eight-yalm target-centered Death March, and Soulgazer keeps Death
Throes. `MobSkillState` now executes the actor-owned command copy admitted by a
director-controlled NPC instead of discarding it for a fresh global lookup.
This is required for the Eye profile and makes the existing Batraal private-line
profile effective through the same isolated execution contract.

The evidence and policy are pinned in
`Data/raidroutes/dzemael_eye_death_march_review.json`. The focused production
harness checks the private 30-yalm/self profile, unchanged global command,
unchanged Soulgazer profile and actual `MobSkillState` execution. Exact radius,
visual reach, boundary damage and vertical presentation still require client
measurement.

## Eye minimap marker (2026-09-16)

The user's supplied crop records the same distinctive purple, ringed minimap
icon for the All-seeing Eye and Soulgazer. The slower original run independently
places named Soulgazer, a passing Ahriman and the southeast marker together at
10:34-10:44. This establishes the actor association and presentation shape; it
does not reveal a numeric marker ID by itself.

Recovered client Lua supplies the numeric route. `calcPotencial` converts
monster-base tier 2 into potential `-2`; `isNotoriousMonster` reports rank 12,
and `DepictionJudge` maps that rank to actor map marker type 7. The server had
both Eyes at ordinary notorious potential `-1`, which does not take that branch.
`SetTrackedHazardMapMarkerPresentation` now selects `-2` before actor publication
for exact identities 3038/2301701 and 3099/2301702. It leaves ordinary Ahrimans,
other notorious monsters and every combat/route field unchanged. The supplied
crop, native trace, scope and hashes are pinned in
`Data/raidroutes/dzemael_eye_minimap_marker_review.json`.

The isolated Release build succeeds without warnings or errors. The focused
hazard suite passes 47 checks, the full encounter suite passes 2,346, the
traversal suite passes 84 and the static validator passes. Standard Release Map
Server PID 56008 now runs the verified DLL with SHA-256
`024867FAA2BB672B02AC7EB0837AA7CDE1CF9ABCEC8DAA9F3A0254DB92C3A5C4`.
Live confirmation of type-7 rendering on both actors, initial spawn, range
re-entry and sector transfer is still open.
