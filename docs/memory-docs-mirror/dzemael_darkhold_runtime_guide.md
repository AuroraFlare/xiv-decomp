# Dzemael Darkhold runtime and encounter guide

This is the implementation guide for the original 1.x Dzemael Darkhold runtime.
It explains which layer owns each behavior, how the SQL, C#, Lua, battle AI, and
client-facing actor flow fit together, and which historical details still need
evidence. The [2026-09-08 ground placement pass](dzemael_grounded_placements_2026-09-08.md)
uses the user's completed recording of both maps.

The [2026-09-14 status and accuracy audit](dzemael_status_and_accuracy_2026-09-14.md)
records fresh source/build checks, additional period footage, and the remaining
placement and encounter gaps, including the Chain Bearer relocation sequence.
The subsequent [retail reconstruction work](dzemael_retail_reconstruction_2026-09-14.md)
tracks the user's supplied guide, source conflicts, remaining completion
requirements, and corrections made toward retail fidelity.

The chronological reconstruction notes remain in
docs/dzemael_darkhold_implementation_2026-07-22.md. This file is the stable
developer-facing map of the current code.

The [early Eye scene review](../Data/raidroutes/dzemael_eye_scene_review.json)
registers native `rad0r101` to the entrance descent. Reproduce it with
`python -B tools/inspect_dzemael_eye_scene.py build|check|render`. The native
`roc_r0_dun01` layout settings carry translation `(-16,188,32)` at physical
`0x27110`; three unchanged door bindings independently match within their
three-decimal SQL precision. This is new registration evidence; earlier reports
that no Darkhold scene/world transform was established are historical.

The scene contains PC, three cinematic party actors and an Ahriman matching
the runtime Eye's appearance. Its translated root lies 1.964 yalms from frozen
primary node 23. `DzemaelEyeIntroTrigger` uses that complete recorded XYZ with
an authored eight-yalm radius and three-yalm vertical tolerance. This separate
trigger does not change the 151 static positions, entry point or hazard routes.
The 2011 run shows the initial panorama/skip at 0:10, movement at 0:15–0:20,
a second skip at 0:23 and the first new-wave notice by 0:30. The scene association
is inferred from complementary native and footage evidence, not an exposed ID.

`UpdateEyeIntroScene` requires complete Approach publication and the tracked,
owned live Eye before an eligible player reaches the volume. It captures the
current living connected audience once. `eyeIntroScene` consumes a session-bound
one-use invitation through `BeginDzemaelEyeIntroScene`, then calls the protected
native handler with `rad0r101`, argument zero and the unchanged duty deadline.
It shares invitation slots with Stables and both boss introductions. Busy events
defer; stale sessions, late arrivals and replacement Eye actors cannot replay it.
Gullet unlock, cleanup, expiry, victory and GM nocs cancel/suppress it. Exact
retail trigger/audience rules, first-wave publication order and live rendering
remain open. Cinematic actors and translated staging never become mob homes.

The [gate-scene native review](../Data/raidroutes/dzemael_gate_scene_review.json)
now associates `rad0r102` explicitly with Stables instance 1406. `rad0r103` is
a Gullet candidate from native staging and the launch-era unlock event; its background action names a timeline
shared by six doors. Reproduce with `python -B tools/inspect_dzemael_gate_scenes.py
check`. The manager now dispatches the Stables scene through `DzemaelGateScene`
after earned activation, complete room publication and gate 1406 unlock. The
filmed skip prompt establishes an intermediate event without exposing its scene
ID. Binding `rad0r102` here, once per run for current living connected players,
with argument 0 is explicit reconstruction policy. Busy players defer; late arrivals
and replacement sessions do not receive old invitations. Incoming `noticeEvent`
must consume its server invitation through `BeginDzemaelStablesGateScene` before
the existing protected wrapper runs the native scene with the original duty
deadline. GM `nocs`, cleanup, timeout and victory suppress it. Exact retail viewing
rules, native door interaction and live rendering remain unverified. In particular,
`rad0r103` has decoded staging in its first block even
though the older parser finds no block literally named `setup`.

The gate and Eye tools now share the verified native layout translation. Applied
to their cinematic circles, it gives `(65.820,180.820,201.950)` for Stables and
`(129.030,180.180,202.520)` for Gullet: 2.150 and 2.345 yalms respectively from
the user's saved device positions. The audit verifies both canonical positions
against their separately scoped `map_coordinate_validations.json` observations.
Those observations requested exact player XYZ; they did not confirm retail
centers or separately test the terminal floor. The cinematic coordinates are
comparison evidence only and never replace the user's XYZ.

The August 3, 2011 run shows a Gullet event at 1:55, a brief skip prompt over the
blue terminal at 1:56, and world/party HUD plus unlock feedback at 1:58. The
March 31, 2012 four-player run instead has ordinary gameplay in the reviewed
activation/unlock frames at 3:00–3:04 and passage through the door at 3:09.
The later full-party `WmJxkVbowSI` samples at 2:01-2:06 likewise retain ordinary
gameplay through circle disappearance, Gullet-unlocked/new-wave feedback and
passage. Its August 14, 2013 upload date is not the run date; visible Paladin and
Full Party HUD support later 1.x without identifying an exact patch. Keep Gullet
unlock without forced `rad0r103` playback as the later-1.x reconstruction.
These are sampled frames, not exhaustive proof of absence or recovered viewing
rules. Do not invent a first-view flag, party-size condition or patch-removal rule.
The gate audit also pins the native `startCutScene` Lua facade: this call orders
desktop mode 61, shows Skip and invokes `_play`, without an explicit first-view
or party-count query. `_play_cpp` and server dispatch remain outside that review;
the similarly named OnceBeacon facade does not recover a gate viewing predicate.

The [Deepvoid scene review](../Data/raidroutes/dzemael_deepvoid_scene_review.json)
adds `rad0r104` through the same protected occupancy handler. The August 2011
participant guide describes skipping the ogre opening, and its linked run shows
the skip-event prompt at 6:25 / duty clock 53:34. The native scene stages an ogre
whose base/size/head/body match the dungeon actor, alongside four cinematic
ghosts. This supports the scene association by inference; the skipped video
does not expose its ID or body. Reproduce the pinned native audit with
`python -B tools/inspect_dzemael_deepvoid_scene.py check`.

`UpdateDeepvoidIntroScene` waits for earned summon activation, Feasting Hall
publication and the boss plus all nine canonical Chain Bearers tracked in the
same instance. Reserved placement keys alone cannot dispatch it. The separate
`deepvoidIntroScene` invitation is consumed through `BeginDzemaelDeepvoidIntroScene`;
Lua supplies `rad0r104`, argument zero and the server's unchanged duty deadline.
The shared `DzemaelGateScene.InvitationSlots` permits only one outstanding scene
kick per player before acknowledgement, even if both scene controllers run
concurrently. After consumption, the event owner and combat-protection marker
continue to defer another scene. Failed admission, invalidation and cleanup
release only the owning request's reservation.

The original living, connected audience is captured once; late arrivals and
replacement sessions receive no old scene. Dead/retired Deepvoid, expired or
ending content and GM `nocs` suppress pending playback. Dispatch timing,
per-run audience and argument zero remain authored policy. The cinematic ghosts
and all local staging coordinates stay separate from the nine combatants and
their two existing formations. Native rendering, first-view conditions and the
normal-party transition into combat still need live-client validation.

The [Batraal scene review](../Data/raidroutes/dzemael_batraal_scene_review.json)
adds `rad0r105` after earned `batraalsummon` activation, completed Field IV route,
FinalChambers publication and actual tracking of the owned living Batraal. The
same period run shows soothing-wind activation at 14:42, black presentation at
14:44 and a skip-event Yes/No prompt late in 14:45 (duty clock 45:14). The native
gargoyle appearance matches Batraal; its cinematic skeletons and two Ahrimans
support the scene association, but the skipped footage exposes no scene ID.
Reproduce with `python -B tools/inspect_dzemael_batraal_scene.py check`.

The separate `batraalIntroScene` command consumes a one-use server invitation
through `BeginDzemaelBatraalIntroScene`, then runs the protected native handler
with argument zero and the original deadline. All three added scenes share the
existing invitation slots, busy deferral and session/generation checks. Death,
removed ownership, cleanup, timeout, victory and GM nocs suppress stale requests.
The initial three combat knights still spawn through their engagement/damage
fallback; no per-player cinematic callback creates them, and the scene does not
wait for combat to start. Four cinematic skeletons do not alter that roster.
The summon now uses observed native wind message 52030 by stable key. Exact
viewing conditions, scene/packet timing and live rendering remain unverified.

## Accuracy vocabulary

Every Darkhold value should be classified as one of these:

- Recovered data: a shipped actor, appearance, command, skill-list, director,
  scene, map-object, or text row exists locally.
- Period evidence: an original 1.x guide, patch note, archived page, or video
  establishes player-visible behavior.
- Runtime policy: the original behavior is known but a hidden numeric value did
  not survive, so the server uses a conservative explicit value.
- Recorded ground: exact player XYZ from an identified movement sample. It
  establishes a sampled floor point, not a retail enemy spawn or a heightmap.
- Placement reconstruction: an authored enemy location, count, rotation, or
  path. A position can use recorded ground while its encounter assignment
  remains reconstruction.
- Estimated ground: only the ten Field IV warriors currently use interpolated
  Y inside reviewed local recorded triangles. Their X/Z follow the guide diagram;
  neither those XYZ nor the triangles are captured actor positions or collision.

Do not move a runtime-policy or placement value into a retail SQL table merely
because it works. Static tables should contain only proven joins or coordinates.

## Source map

| Layer | Primary file | Responsibility |
| --- | --- | --- |
| Entry NPC | Data/scripts/quests/dft/DftRoc.lua | Routes Dyrstweitz actor 1001154 into the Darkhold entry helper. |
| Entry helper | Data/scripts/dzemael_entry.lua | Small Lua bridge into the C# manager; contains display constants but no encounter state. |
| Content Lua | Data/scripts/content/Dzemael.lua | Reapplies field and battle music on create and zone-in. |
| GM helper | Data/scripts/commands/gm/dzemael.lua | Solo entry, diagnostics, thresholds, actor probes, and per-door control. |
| World bridge | Map Server/WorldManager.cs | Exposes manager calls to Lua and forwards update, zone-in, death, and coffer events. |
| Runtime owner | Map Server/DzemaelManager.cs | Owns instance state, staged publication, objectives, bosses, rewards, cleanup, and diagnostics. |
| Ground selection | Data/raidroutes/dzemael_grounded_positions.json | Frozen recorded XYZ, explicit user XYZ, and ten separately identified local floor estimates; native map frames and exact BNPC profile IDs. |
| Runtime positions | Map Server/Dungeons/DzemaelGroundedPositions.cs | Generated ground points for private-instance mobs, devices, waves, coffers, and GM map access. |
| Traversal policy | Map Server/Dungeons/DzemaelTraversal.cs | Exact native door bindings, progression rules, portal destinations and cancelable visit state. |
| Placement exporter | tools/mobspawns/darkhold_placements.py | Validates provenance and profile joins, generates C#, and renders native map review images. |
| Death hook | Map Server/Actors/Chara/Npc/BattleNpc.cs | Calls HandleDzemaelBattleNpcDeath from the ordinary BNPC death path. |
| Coffer event bridge | Map Server/Lua/LuaEngine.cs | Recognizes DZEMAEL_ROUTE, DZEMAEL_OBJECTIVE, and DZEMAEL_REWARD actor IDs. |
| Door state machine | Map Server/Actors/Chara/Npc/Npc.cs | Owns automatic proximity open/close behavior and the per-door locked-closed override. |
| Mob profiles | Data/sql/server_battlenpc_mob_types_loot.sql | Canonical BNPC-to-actor, level, HP/MP, job, skill-list, and drop-list joins. |
| Live migration | Data/sql/live migrations/dzemael_bnpc_mob_types.sql | Idempotently adds all 18 profiles to an older live database. |
| Skill lists | Data/sql/server_battlenpc_skill_list.sql | Connects list IDs 2, 32, 34, 58, and 66 to recovered commands. |
| Command data | Data/sql/server_battle_commands.sql | Command costs, ranges, target shapes, status metadata, animations, and eLeMeN refinements. |
| Special command effects | Data/scripts/monster_tp.lua | Global multi-status or special behavior, including Death Throes. |
| Static validation | tools/validate_dzemael_darkhold.ps1 | Verifies the required source joins and runtime seams and parses the five entry, content, command, and door Lua files. |

## End-to-end runtime flow

The normal entry flow is:

~~~text
Dyrstweitz onTalk
  -> DzemaelTryStartFromNpc
  -> WorldManager.StartDzemaelInstance
  -> DzemaelManager.Start
  -> StartInternal
     -> validate party, level, quest, timer, and source area
     -> create private zone-231 content area
     -> bind and start Occupancy/RaidRoc0Dungeon01
     -> publish 12 explicitly bound native doors/barriers with instance-owned state
     -> publish the first population stage
     -> move all entrants with the content-aware zone transition
  -> client reports zone-in complete
  -> HandleClientZoneInComplete
  -> ReplayInstanceStateForPlayer
~~~

WorldManager calls DzemaelManager.Update from both supported server update paths.
The manager update owns timeout and empty-instance cleanup, device head counts,
route advancement, Deepvoid's threshold, Batraal's phases, the reward window,
and final teardown.

Initial entry places every party member (and every GM entry mode) at zone 231,
`X=-90.073, Y=222.002, Z=239.891`, facing `1.542`, with no sideways party offset.
These are the exact values in the user's 2026-09-08 `!mypos` screenshot from
private area `Dzemael`, type `1000000`. The user described it as the likely
shared spawn; a universal retail spawn and a separate floor test remain
unconfirmed. The screenshot and scoped observation are saved in
`Data/raidroutes/evidence/dzemael-20260908/entrance-mypos.png` and
`tools/mobspawns/map_coordinate_validations.json`. Recorded path nodes remain
unchanged. Inter-map landing points and saved reconnect positions are separate
from this initial entry point.

## Admission and quest-script boundaries

Dyrstweitz has two entry paths. Ordinary Roc-region dialogue calls
StartDzemaelInstance directly and treats a result beginning with "Entering
Dzemael Darkhold" as success. Grand Company quest dialogue first runs its
retail event and ask function, then calls the manager only when the client
returns 1. DzemaelAskEntry is therefore a client UI helper, not the admission
authority.

DzemaelManager validates one complete party snapshot and rechecks its roster,
leader and session identities before returning the entrants. The caller must be
the current leader; 4-8 distinct members must have connected, nonsuperseded
sessions bound to their exact registered player objects in the same public
source area. A retained disconnected object or replaced event caller cannot
satisfy admission. These are validation-time checks, not a transaction-wide
connection lock through allocation and zoning. Every
member must be level 45 or higher on a combat class, have quest access, be off
the retry timer, and not already belong to private content. The normal factory
creates a dynamically typed private area without a content group, runs its
onCreate callback, and only then completes registration and content binding.

The Grand Company quest's onKillBNpc callback is intentionally empty. Captain
clear proof, required-item removal, and sequence advancement are manager-owned.
The quest completion script separately awards 4,000 seals and 6,231 EXP, while
getJournalInformation projects the in-instance journal without rewriting the
retail quest sequence.

## Entry and private-area packet ordering

StartInternal creates a PrivateAreaContent for zone 231 with:

- area class /Area/PrivateArea/Occupancy/RaidDungeonSimple;
- content script Dzemael;
- director Occupancy/RaidRoc0Dungeon01;
- field music 5 and battle music 6;
- opening scene rad0r100 and closing scene rad0r106;
- a 60-minute expedition limit and five-minute retry timer;
- a five-minute reconnect ticket.

The director is assigned to the exact private area, added as its own member, and
started before destination actor publication. The explicitly bound native doors/barriers and the
initial route population are published before any entrant changes zone. This is
intentional: the 1.0 client expects destination actors and content references in
one coherent replacement snapshot.

The GM empty-instance path suppresses the occupancy-director client envelope and
publishes no route population. It exists for one-actor-at-a-time client probes.
It also disables re-entry and has a short cleanup grace. Do not use it to judge
normal director or progression behavior.

DoZoneChangeContentAsync uses a generation-scoped staged transition. It closes
the active event, removes the player from the source area, saves the return
point, sends teardown and map-bootstrap packets, publishes the destination
snapshot, and waits for the client's release stages. Populated entry now follows
the live Toto-Rak contract: each entrant owns RaidRoc0Dungeon01 before the zone
change, so the occupancy actor is sent in the final destination-director phase
with the raid-area binding. That phase is separated from SetMap and the other
scene actors by the transition's existing settle gates. The empty diagnostic
still suppresses the raid-area slot and does not attach the director to its
entrant. 0x0007, 0x0109, 0x010A, and the legacy -1 path are recognized; accepted
landing then repairs/records the director in the Session actor table, publishes
content-group and party state, and notifies World. The successful 2026-09-18
Toto-Rak run used the same post-landing repair: its log recorded
`alreadySpawned=False` and `sendPackets=True` immediately before the accepted
opening notice and `rad0f300` request.

The occupancy director dispatches initForEvent, eventNoticeCutScene, relogin,
processUIFinalize, widget open/close, and debug selection through
onEventStarted. Its widget profile uses display ID 4102, content ID 2, opening
scene rad0r100, and close scene rad0r106. Manager director calls use a protected
send with RunEventFunction fallback. The original entrant's opening request is
bound to its Player/Session before zone change. Successful deferred director
publication captures one `openingPresentation` invitation for that player;
`DzemaelGateScene` queues the native `noticeEvent` only when the director is
client-known and the session/generation/event slot remain current. Its incoming
claim runs `_setInstanceRaid`, then rad0r100 argument 1 or the `nocs`
relogin/widget path with the original duty deadline. Ordinary client setup
events remain setup-only. A replacement or duplicate event cannot replay it,
and cleanup invalidates pending entry presentation. The earlier fixed timers
raced director publication; the later setup-only attempt produced no entry event
after publication in a live solo test. The third solo run identified the next
gate: director publication first produced a parameterless native occupancy event
of type `0x50`, which occupied the player's event slot and prevented the queued
full-payload kick. The root Lua ends only that handshake and leaves ordinary
parameterless setup events open. The owned opening request then retries normally;
it is not consumed by the handshake. The guarded scene/widget branch, handshake
release and ordinary setup behavior pass the production Lua probe. Live scene
and widget rendering remain unverified.

The 2026-09-19 solo `!dzemael enter cs` run disconnected before client-ready,
immediately after the staged scene actors. Windows recorded `ffxivgame.exe`
access violation `0xC0000005` at offset `0x006BA0BE`. The dump resolves the
faulting native path to a stale/corrupt layout-instance
`EnvironmentTransformAction` child. It does not identify the server-side actor
that created that stale lifecycle. At the time, Darkhold advertised the
instance-raid area slot while deliberately omitting RaidRoc0Dungeon01 from the
destination snapshot; the successful Toto-Rak comparison publishes its matching
occupancy director in that phase. The runtime now aligns those entry envelopes
and logs both preparation and client-ready binding. The later successful entry
supports this protocol correction, but one run does not classify the stale
native child object or prove which server actor caused the original fault.
The frozen dump hash, registers, RTTI and inspection limits are recorded in
`docs/dzemael_entry_crash_2026-09-19.md`.

The next fresh solo entry at 12:12 reached the private area without a client
crash, so the aligned destination envelope has one successful live entry. The
opening scene and widget still did not appear. Its log showed a successful
client-ready director publication and captured cutscene request, followed by
`ownerKnown=False` while the same Session, player, area and actor-table
generation remained current. `Session.UpdateInstance` had treated every actor
absent from the spatial proximity list as stale. Directors are client actors but
are not spatial-list members, so that refresh removed the just-published
RaidRoc0Dungeon01 bookkeeping before `DzemaelGateScene` could dispatch its owned
invitation. Spatial refresh now retains an already-published director only while
the exact player owns it, the director still contains that player, both remain
in the same area and the director is not deleted. Foreign, one-sided, deleted
and prior-area directors still follow the ordinary removal path. The native
owner-known gate and original opening deadline remain unchanged. Cutscene and
widget rendering require another live client check on the rebuilt server.

On client-ready, replay republishes activated device animations, the current
timer/clear state, and coffer progress. Actor visibility must already exist
before group/content state references those actors.

## SQL to battle-AI data flow

The live migration performs an idempotent INSERT ... ON DUPLICATE KEY UPDATE
for all 18 profiles, including actor class, BNPC ID, aggression, stats, skill
list, and drop-list IDs. SpawnMobAt then calls
SpawnConfiguredEnemyWithMobType with both the recovered actor class and BNPC
ID. BattleNpc.ApplyMobType reads the WorldManager cache, resolves every command
in the skill list, defaults a missing dropListId to the BNPC ID, and disables
ordinary roaming for dynamically placed mobs. Matching actor-class and
appearance rows are prerequisites for dynamic construction.

DzemaelManager does not duplicate an entire skill list. It validates the loaded
list after every major encounter spawn and logs DzemaelBossProfile if a list ID
or command is missing. A mismatch is diagnostic-only and does not abort spawn.
The manager adds only encounter-specific overlays:

- Deepvoid's 50-percent frequency change;
- the Eye and Soulgazer's permanent invulnerability and actor-specific stop
  move;
- Batraal's barrier, add thresholds, sword state, and final Desolation
  scheduler.

The live migration must be imported while Map Server is stopped, followed by a
restart, because the BNPC profile cache is loaded at startup.

### Recovered Darkhold-specific monster Lua

The decompiled client script corpus contains Darkhold-specific class names:

- AhrimanNormalR0D1Raid01 inherits AhrimanPatrolBaseClass;
- AhrimanNormalR0D1Raid02 inherits AhrimanBaseClass;
- GargoyleNormalR0D1Raid01 inherits GargoyleBaseClass;
- PetitghostNormalR0D1Raid01 inherits PetitghostBaseClass;
- SkeletonNormalGlaR0D1Raid01 inherits SkeletonBaseClass;
- EmpireChiefRaidR0D4 inherits EmpireBaseClass.

These files are two-line inheritance stubs. They contain no recovered
thresholds, timers, commands, or spawn positions. The first Ahriman subclass is
useful corroboration that one Darkhold Ahriman variant used patrol behavior,
but the corpus does not provide the actor-class join or the patrol data itself.
The stubs therefore support the current architecture without supplying another
safe boss phase to implement.

## Route state machine

Normal publication is staged:

| Stage | Opens when | Published content | Retirement rule |
| --- | --- | --- | --- |
| Approach | Instance start | Hippogryph approach, Nix, the Eye, both independent gate terminals and first route coffer | Stables is optional; Gullet can open directly. |
| Stables | Stables terminal | Optional Stables orobons, including the isolated bonus Orobon, and nearby approach foes | Does not withdraw the existing approach foes. |
| FirstCircleRoom | Gullet gate unlocked | Gullet moles/toads and 2/6 circles; existing Eye transfers to its Gullet route | Both circles withdraw surviving early foes and unlock Grand Hall. |
| ThreeCircleRoom | Gullet pair complete | Grand Hall guards/orobons, one Lava Drake, northern four-player and middle/southern two-player circles; existing Eye transfers into the hall | All five upper circles withdraw ordinary hall enemies; the Eye persists. |
| TransporterRoom | All five upper circles complete | First-map corridor packs, second route coffer and transporter terminal | The transporter terminal withdraws corridor foes and enables travel. |
| FeastingHall | Upper circles and transporter terminal complete | Falls approach, third route coffer and Deepvoid's summon terminal | Its terminal summons Deepvoid and nine Chain Bearers together; boss death withdraws this stage and opens Field II. |
| LowerHalls | Deepvoid dies | Knights' recorded ghosts/Soulgazer, three Field III and four Field IV terminals | Field III is optional. All four Field IV terminals summon ten independent Hellsbound Warriors. |
| DrakeRoom | All three Field III terminals complete | Optional Granary/northern enemies, including three Lava Drakes | Opens Field III without withdrawing other lower-hall foes. |
| FinalChambers | All ten tracked seal warriors die | Captain's group, fourth route coffer and Batraal's four terminals | Opens both Field IV barriers and withdraws surviving lower/Drake stage foes. Batraal spawns only after its separate summon terminal. |

PublishedMobPlacements makes actor publication idempotent; PublishedPopulationStages
tracks each successfully published branch independently. Partial failures remain
retryable. SpawnedMobStages lets a section clear despawn surviving stage mobs
without awarding kill credit. Both Ahriman identities survive these withdrawals.
The total shown in diagnostics excludes relocation-only hazard anchors.

BuildMobPlacements, BuildDevicePlacements, and the coffer builders retain
encounter membership and obtain coordinates from DzemaelGroundedPositions.
There are 115 spawnable mob placements and one inactive Soulgazer relocation
anchor in the latest offline layer. The ten seal warriors are a separate terminal wave.
The 2026-09-15 user-capture layer is reproduced by
`tools/mobspawns/darkhold_user_placements.py plan|build|check|render` and
`Data/raidroutes/dzemael_user_placement_review.json`. It updates 92 existing
homes and adds 34 observed ordinary mobs under their same stage prefixes. The
later user mypos screenshot adds one upper-route Bone Nix at X 64.661,
Y 183.059, Z 235.623 without moving the separate Stables Nix. The
user's later replacement clarification removes eleven unmatched old ordinary
homes. Publication, partial retry and section withdrawal use the 175-point
static manifest. Nine selected user XYZ replace the Chain outer formation;
the nine inner endpoints remain separately estimated. The five Captain-room
spots retain one Captain and four guards, with point 129 provisionally assigned
to Speculator despite its `imperial_primus` supplied label. That identity, all
client facing, and closely spaced Field IV actors require live verification.
No final-boss or Purgatory-add home was captured in this user layer. The three
optional Stables Orobons are provisionally preserved as the (6,5) circle exception;
three objective Drakes and patrol/final actors await separate placement review.
Nine of the ten Field IV warriors use exact user standing XYZ. The unobserved
tenth uses nearby recorded primary node 1287, pending live actor placement.
Batraal's 12 adds use fixed recorded
arena points across the initial, 80%, and 40% waves;
they no longer inherit his current Y. The six regular and five possible reward
coffers also use fixed recorded points. All twenty devices and all three portal
markers use their source Y directly, with no added visual lift. GM circle and
terminal probes also use the player's exact XYZ. The first door-opening
device, `stablesgate`, uses the user's exact
2026-09-08 screenshot XYZ `(65.563, 180.500, 199.840)` with zero offset, replacing
node 106 and its elevated actor Y of `183.90937`. The original remaining devices
and three portal markers had their old `+2.63` lift removed; later additions
also use zero lift. All noncombat manifest entries require a zero offset;
the generator preserves the source float precision for props and landings.
The screenshot's rotation belongs to the player, so it
does not replace the device facing. The source image and scoped observation are
saved under `Data/raidroutes/evidence/dzemael-20260908/first-magitek-mypos.png`
and `tools/mobspawns/map_coordinate_validations.json`.
The second gate device, `gulletgate`, subsequently moved to the user's likely
position `(128.901, 180.046, 200.182)`, also with no height adjustment.
The complete coordinate audit and noncombat-only maps are in
[the noncombat placement review](dzemael_noncombat_placements_2026-09-08.md).
Exact retail offsets and in-game model clearance remain unverified beyond
the user's supplied points.
The September 14 progression pass adds nine terminals and moves the existing
Knights' southwest terminal using calibrated Elemen symbols and complete recorded
XYZ. One Bone Nix moves to the next reviewed corridor sample to clear a terminal.
`Data/raidroutes/dzemael_progression_review.json` preserves all eleven changes;
use `tools/mobspawns/darkhold_progression.py check|render`. That layer has
148 static manifest points. These are user-authorized empirical estimates,
with guide-to-ground distances preserved; they are not recovered retail XYZ.
The later coffer layer corrects the first three route coffers and the drake
objective coffer using the guide's white diamonds. Use
`tools/mobspawns/darkhold_coffers.py check|render` to inspect that historical layer;
`darkhold_progression.py check` audits its own historical output. The coffer
review preserves five comparisons and four changes, without altering actors,
rewards, doors or other points. See the active reconstruction report for distances
and the Granary floor choice. Deepvoid's objective coffer and the final reward
coffer homes still lack calibrated position evidence.
The warrior layer uses `tools/mobspawns/darkhold_warriors.py check|render`.
It changes only the ten seal-warrior homes, keeping their IDs/profiles and all
other 138 points. Its historical provenance totals are 135 recorded points, three
user-supplied points and ten estimated points. The guide shows eight perimeter
warriors around a central pair; their estimated footprint is about eight yalms
wide. The central pair's 1.5-yalm separation is authored. Each estimated Y uses
three identified recorded points and remains inside their horizontal triangle;
no extrapolated height, runtime nav edge or claimed client-floor confirmation
is introduced. `Data/raidroutes/dzemael_warrior_review.json` preserves each
before/after comparison, diagram pixel, support XYZ and interpolation weights.
The focused current preview is `docs/maps/dzemael-warriors-20260914/formation.png`.
The latest builder is `tools/mobspawns/darkhold_chain_placements.py build|check|render`.
It adds the ninth ghost and corrects all nine outer homes, preserving the other
140 records. That historical layer has 149 points. The later Grand Hall pass
adds one video-observed level-52 Lava Drake at recorded node 318, preserving
all earlier rows. Its northern-room home and room-entry trigger are authored;
the sighting is of an already pulled enemy. It withdraws with the ordinary hall
enemies and never participates in the three northern Drakes' coffer objective.
Use `tools/mobspawns/darkhold_grandhall.py build|check|render` and
`Data/raidroutes/dzemael_grandhall_review.json`. That layer has 150 static points.
The historical relic-coffer layer has 151: 129 recorded, three user positions,
ten warrior estimates and nine Chain estimates. The later Captain guard layer
retains all 151 identities with 125 recorded, three user and 23 estimated homes.
The later terminal correction moves only the middle/southern controls to nodes
1683/1680 in a separately frozen 1,677-node capture. The manifest's
`capture_source` identifies that recording; these IDs are not indexes into the
original 1,409-node capture. Its explicit map/node scope and source hash are
validated independently. No captures or runtime edges are merged. The middle
and southern guide snaps improve from 21.09/11.85 to 5.18/1.19 yalms.
Use `tools/mobspawns/darkhold_grandhall_terminals.py build|check|render` and its
`Data/raidroutes/dzemael_grandhall_terminal_review.json`. All mob homes stay fixed.
The latest builder is `tools/mobspawns/darkhold_relic_coffer.py build|check|render`.
It preserves those 150 rows and adds `reward.enchiridion` at primary node 1139:
`!pos 231 78.349190 149.472210 -145.209320`. This recorded XYZ has no captured
incident edges. Nearby points are context only, with no nav links generated.
Its home east of the current five coffers is authored; the original coffer row
and guide-relative rightmost orientation remain unresolved. See
`Data/raidroutes/dzemael_relic_coffer_review.json` and the reviewed preview
`docs/maps/dzemael-relic-coffer-20260914/coffer.png` with its native-map frame.
Nine inner relocation points
are separate, generated into `DzemaelChainFormations.cs`; they are not extra actors.
All Chain Y values use explicitly scoped local estimates, with only lower-tier
samples supporting the inner floor. These are not captured XYZ or collision proof.
The previously tested Grand Hall floor point is
preserved as historical evidence; the six-player circle now occupies the Gullet. None of these placements are public-zone spawn SQL.

Both map segments are zone 231. `!dzemael map 1` moves a GM solo-test player to
the recorded end of the first route; `!dzemael map 2` moves them to recorded
Dragonbreath Falls ground. This preserves the private instance and does not
advance objectives. Normal instances now have a two-way portal after the five
upper route circles and transporter terminal complete, plus a victory exit portal using the saved return
point. Inter-map actors now use the recovered `RaidDungeonWarp` prompt with
private b936/e004 script bindings; exact original world IDs, endpoints and
exact travel presentation remain unverified. See the traversal section below.

### Captain's Quarters placement comparison

The separate [Captain review](../Data/raidroutes/dzemael_captain_placement_review.json)
compares the five existing homes with Elemen's calibrated map-two orange marker.
Primus node 1363 is already the nearest recorded point, **2.707 yalms** from the
estimated marker center. Its identity is inferred from the room/quest text;
the guide does not explicitly label this individual marker. That comparison now
audits the frozen pre-guard-correction homes. The Captain remains unchanged.

Use `python -B tools/mobspawns/darkhold_captain_review.py build|check|render`.
This creates a review and [comparison map](maps/dzemael-captain-review-20260915/captain-review.png),
without modifying the canonical placements or generated runtime. Only the left
native-map plot is covered by its companion frame; the source inset is excluded.
The orange footprint shows approximate source-symbol size, not retail accuracy
or floor acceptance. The existing coffer comparison remains independent.

The later [Captain guard review](../Data/raidroutes/dzemael_captain_guard_review.json)
uses the idle-room footage at [12:29-12:30](https://www.youtube.com/watch?v=WmJxkVbowSI&t=749s).
The visible overlapping yellow nameplates and standing group support a compact
formation consistent with the current Captain, two Myrmillo, Speculator and
Veles roster. They do not recover individual XYZ, exhaustive counts, facing or
exact rank order. Four guards now use an empirical 7.5-by-5.5-yalm envelope around
the retained Captain; the former group spanned 24.88 yalms horizontally in X.
Role-to-slot mapping and numerical spacing remain authored. Each Y is
interpolated inside a triangle of pinned primary samples 1362-1371, scoped only
to those four keys. All 147 other position rows, coffer node 1364, profiles,
rotations, quest credit, SQL and captured nav edges are unchanged.

Use `python -B tools/mobspawns/darkhold_captain_guards.py build|check|render`.
Its [formation preview](maps/dzemael-captain-guards-20260915/formation.png) has a
separate calibrated native-map frame. Purple triangles are interpolation
supports, not captured edges or collision geometry. Minimum horizontal actor
spacing is 3.74 yalms and coffer clearance is 3.05; these calculated gaps do not
prove live model clearance, targeting or floor acceptance. The preceding
Deepvoid identity tool now audits its frozen output and refuses to erase this
later placement layer.

The subsequent facing review found a shared `Actor.IsFacing` unit error: the
degree argument was converted to radians, then multiplied by PI again by a
command-AoE helper. Its old `GetAngle` also returned zero for every same-X
target. The corrected actor predicate uses a wrapped bearing consistent with
`LookAt`, preserving the existing full-width defaults (40 degrees for the
actor/sight overload, 90 for coordinates, and the attack caller's 120). These
numeric settings remain server policy, not recovered retail sight angles.
Command-AoE geometry and the independent gaze predicate are unchanged.

[Production facing results](../Data/raidroutes/dzemael_captain_facing_review.json)
check all five unchanged Captain rotations against the exact coffer anchor.
Only `captain_myrmillo_b` contains that point in its corrected facing cone.
This is not a complete aggro or safe-route test: player interaction offset,
contact hitboxes, line of sight and the whole approach still matter. Reproduce
the report by running the compiled Dzemael encounter harness with
`--captain-facing-report Data/raidroutes/dzemael_captain_facing_review.json`.
The reviewed video opening at 12:27-12:29 now connects the 523-gil/Grade 5 Dark
Matter sample to this coffer with strong temporal support; see the separate
`captain_coffer_opening_review` in the loot review. No guard yaw, passivity,
quest-dependent aggression, exact player XYZ or fixed gil rule is inferred.

## All-seeing Eye and Soulgazer

These are route hazards, not killable bosses.

Recovered profile:

| Actor | BNPC / actor class | Profile | Actor-specific pause move |
| --- | --- | --- | --- |
| All-seeing Eye | 3038 / 2301701 | Level 55, 24,000 HP, Ahriman list 2 | Death March 23379 |
| Soulgazer | 3099 / 2301702 | Level 55, 24,000 HP, Ahriman list 2 | Death Throes 23380 |

List 2 contains Seismic Scream 23093, Level 5 Petrify 23094, Aural Vacuum
23095, Seismic Rift 23298, Death March 23379, and Death Throes 23380. The full
list is validated first; each hazard then removes only the other's pause move.
Both retain their native skill list with director-controlled dispatch and
disabled auto-attacks. Current routes contain held cast stops; this supersedes
the historical walking-only Eye route. The route geometry, cast locations and
sector transitions remain empirical, as detailed below.

The 2026-09-15 live feedback reported stop/start jitter and an Eye that was too
slow. The next offline build kept the same recorded XYZ and authored cast stops
but carried its running state straight through zero-wait transit samples.
`BattleNpcController` spends a bounded per-update distance across the dense
path. The 2026-09-19 client retest found the resulting twice-on-foot setting too
fast, so the owned Eye's movement modifier and client speed packet now use 1.5
times the configured on-foot run speed (9 yalms/second with this server's 1.2
player multiplier). An action, wait or facing stop still holds. This is a
user-requested presentation adjustment, not a recovered retail speed. Exact
retail cadence, smooth client rendering and route safety at that speed remain
live checks; Soulgazer's movement setting is unchanged.

The September 26 Eye planner now selects a complete reviewed native-mesh path,
then an exact edge from the original frozen recording, then the separately
frozen newer graph, then the reviewed ordered waypoint fallback. The final
680-leg audit selects 372 native paths, 208 original edges and 100 fallbacks;
the newer graph adds no selected legs. Source snapshots stay separate and a
directed leg keeps its selected provider through replans. Native interior
samples use polygon Y at their own X/Z, with authored same-X/Z endpoint
attachments of at most one yalm back to unchanged recorded stop XYZ. Actual
published native steps are ray-checked; unsafe smoothing stops at a safe path
corner and continues next tick. Exact endpoint arrival precedes held casts.
Stale resolver completion cannot install movement or alter the newer path's
immutable safety callback/provider binding. Route hashes, static homes, sector
transfers, authored Death March waits and the 1.5 speed multiplier remain
unchanged; different path lengths and corner handling can change elapsed travel.
The native attachment limits and door-anchor screen are authored policies,
not recovered retail collision clearances. See
`docs/dzemael_native_eye_navigation_2026-09-26.md` for source hashes, required and
optional files, coverage and open client checks. The earlier graph-only audit
remains frozen in `docs/dzemael_eye_navigation_2026-09-26.md`.

The user's 2026-09-15 test exposed a stop-admission failure: the passive,
invulnerable Eye had zero TP and repeatedly rejected Death March. Although its
SQL command has zero TP cost, `BattleCommand.CalculateTpCost` applies the shared
monster minimum. The held stop correctly refused to release, leaving the patrol
stalled. `PrepareDarkholdHazardStopResources` now supplies only the calculated
TP required for the owned Eye's 23379 or Soulgazer's 23380 immediately before
scheduled admission. It checks exact actor/BNPC identity, zone/area membership,
tracked ownership, current skill-list binding, director control, action readiness
and active lifetime. It preserves existing TP above the cost. Global command
costs, ordinary Ahriman economy, cast durations, held-stop retries and all route
coordinates remain unchanged. This is a director resource policy, not recovered
retail TP accounting.

The focused `--hazard-resources-only` production suite reproduces the zero-TP
rejection and checks successful startup after provisioning for both hazards,
including an empty room and a subsequent stop. Its 34 checks pass; the full
encounter suite now passes 2,288 checks. Static validation, route/provenance,
84 traversal checks and 18 coordinate tests pass. The fix is built under
`.tmp/dzemael-eye-route-tests`; the running client/server was not restarted or
patched. Movement after casting and the full sector sequence still need a live
retest using the rebuilt server.

The [early route preview](maps/dzemael-approach-eye-20260914/early-sectors.png)
shows cyan Approach and green Gullet routes, with yellow cast stops. Solid
links are captured edges and dashed links are inferred connections. It displays
the existing saved route; rendering it did not change waypoints.

The archived 1.x NM pages establish all of the following:

- both actors are invulnerable to all harm;
- each patrols a sector selected by party progress;
- each pauses at particular locations and casts even if no player is standing
  there;
- the Eye casts Death March and Soulgazer casts Death Throes.

The local pages are:

- docs/ffxiv-1.0-wiki/nm-pages/All-seeing_Eye.html
- docs/ffxiv-1.0-wiki/nm-pages/Soulgazer.html

The canonical and live-migration profiles mark both actors non-hostile with no
detection range. The manager repeats that invariant at runtime with
ApplyAggressionSettings(false, 0), sets DetectionRange to 0, and enforces
permanent battlefield.invulnerable state. They remain targetable for the later
patrol/stop director but do not automatically aggro as room pulls. The runtime
publishes at most one live actor of each identity. The Eye now appears with
Approach, since the original run records Death March hitting the party at the
first gate terminals at 1:55, before Gullet unlock. Its initial birth uses the
validated approach route head before actor publication: 112 recorded XYZ and
six authored cast stops. Opening Gullet moves that same Eye into a 30-point
route with three cast stops. Completing both inner circles selects the existing
83-point Grand Hall route with five stops. The historical `mob.circlehall_eye`
point remains that later hall's anchor; its static JSON/C# row is unchanged.
See `Data/raidroutes/dzemael_approach_eye.json` and
`tools/mobspawns/darkhold_approach_eye.py build|check|render`.

Ordinary private Darkhold enemies use the scoped aggression policy in
`DzemaelManager.ConfigureDarkholdAggression`. Their pursuit territory is an
authored 125 yalms from spawn. Nix, Orobon and Hippogryph start detection at
15 yalms; other hostile dungeon actors use 24. Period eLeMeN family records
support sight for Nix, hearing for ghosts, wights, drakes and moles, and smell
for Orobon/Hippogryph. The combined Darkhold senses, animal true-sight flags,
undead scent and exact distances follow the user's client observation and still
need a pull/leash test. Floor separation and line of sight remain enforced.
See `Data/raidroutes/dzemael_aggression_review_20260915.json`.

After all five upper circles, that same Eye relocates to a 107-point first-map
corridor patrol with seven authored cast stops. It stays active after the
transporter terminal clears ordinary enemies. The original 15-minute run at
6:00 directly shows the named Eye beside the transporter after its activation.
Soulgazer now follows a 47-point circuit through Knights' Quarters with five
cast stops. Its start is the unchanged node-975 static home. All cast positions
are authored. Three short Soulgazer joins connect recorded passes;
they remain inferred separately from the captured edges. On Batraal engagement,
the same Eye and Soulgazer move to two authored northern-hall patrols. Each uses
three held cast stops and complete recorded XYZ. `final_gazer` remains an inactive
RelocationAnchor; the final patrols do not publish another actor.

`Data/raidroutes/dzemael_hazard_routes.json` pins the two route selections and
distinguishes captured edges from inferred short segments. Use
`tools/mobspawns/darkhold_hazard_routes.py build|check|render`. The preview is
`docs/maps/dzemael-hazard-routes-20260914/arena.png`. Both hazards are described
in the northern hall by Elemen, and the original run's 18:43–18:48 combat log
shows their named moves. The exact route geometry, six cast locations and
engagement-based relocation are empirical reconstruction. The three-second
minimum hold follows native command preparation; overall cadence is not measured.

Transfer admission waits for native actions, excludes dead/foreign/withdrawn
actors, and reserves each identity once across overlapping updates. Failed
route loads/starts remain retryable. Instance retirement prevents further
transfers and retires both hazards along with Batraal's adds.

Death Throes now includes Silence alongside Bind, Pacification and Amnesia,
matching Elemen's four-effect account. Effect probabilities and durations remain
authored; the native command's zero cost and enemy recipient mask are unchanged.

Death March now has an Eye-only location profile recorded in
`Data/raidroutes/dzemael_eye_death_march_review.json`. The owned 3038 / 2301701
Eye executes a 30-yalm circle centered on itself while the route holds it at the
authored cast stop. The archived NM page establishes casts at particular patrol
locations without a nearby-player prerequisite, and the user's client knowledge
establishes a massive location-based area. The exact retail radius is not
recovered, so 30 yalms remains an explicit reconstruction value. The shared
command 23379 stays at its existing target-centered eight-yalm profile for
ordinary Ahriman and Dodore. Director-controlled command states now execute the
actor-owned profile admitted by their controller; this also makes existing
per-encounter command geometry effective without mutating the global cache.

Both Eyes now also publish the distinctive tracked-hazard minimap marker shown
in the user's period-footage crop. Native `CharaBaseClass.calcPotencial` maps
monster tier 2 to potential `-2`; `isNotoriousMonster` returns rank 12, and
`DepictionJudge` selects map marker type 7 for that rank. The runtime applies
this tier before publication only to 3038/2301701 and 3099/2301702. Initial
spawn and range re-entry therefore use the same `/_init` value. This does not
change `isNotorious`, targetability, nameplates, combat rules, routes or command
profiles. `SetActorIconPacket` is a separate extra-stat/icon surface and is not
used for this marker. See
`Data/raidroutes/dzemael_eye_minimap_marker_review.json`; exact live rendering
and marker persistence through every sector transfer remain client checks.

Still placement-bound:

- retail validation of the early Soulgazer circuit and Eye cast positions;
- retail validation of the Eye's inferred first-map corridor route and trigger;
- retail validation of the authored Batraal routes and sector-change trigger;
- pause positions and duration;
- the pause-to-cast cadence;
- exact Death March radius and live acceptance of its self-anchored enemy-only
  area effects.
  Both native main-target masks accept the living caster as the anchor; no
  nearby player or synthetic TP/MP is required by those recovered rows.

Do not add a vulnerability-release phase. That was an ARR mechanic and is not
supported for the original 1.x hazards.

### Reusable route controller

NPC and enemy patrol mechanics now have a dedicated reusable runtime; see
[Scripted actor routes](scripted_actor_routes.md). Like the escort tooling, it
loads authored data from JSON (`Data/actorroutes`), then uses the actor's real
`PathFind` with `PathFindFlags.Scripted`. It supports waits, explicit stop
holds, facing, action keys, and arrival/departure/completion callbacks without
importing escort ambush, leash, or quest-failure behavior.

The early Eye loads `Data/actorroutes/dzemael_all_seeing_eye.json` in
`recordedWaypoints` mode. Dense reviewed samples retain recorded elevations
inside the private instance. It casts Death March at five authored stops, then
loads `dzemael_corridor_eye.json` after all five upper circles. The latter uses
107 exact recorded XYZ, seven held casts, and five reviewed cross-pass joins.
Its separate source record and builder are `Data/raidroutes/dzemael_corridor_eye.json`
and `tools/mobspawns/darkhold_corridor_eye.py build|check|render`. The continuous
recorded descent preserves overlapping upper and lower floors. Native-map review
and server movement guards do not establish retail path accuracy or collision.
Corridor admission shares an in-flight reservation set with the arena transfer;
Batraal engagement takes priority even when it occurs after a corridor reservation.
Successful transfers are one-shot; failed starts retry without new actors.
Soulgazer loads
`dzemael_soulgazer.json`, with a closed Knights' Quarters circuit and five
Death Throes stops. Their separate review manifest and generator are
`Data/raidroutes/dzemael_early_hazard_routes.json` and
`tools/mobspawns/darkhold_early_hazards.py build|check|render`. The original
walking-only Eye JSON is frozen as historical evidence. Batraal then selects
`dzemael_batraal_eye.json` and `dzemael_batraal_soulgazer.json`, relocating each
existing actor to its route's validated start point. Both use the callback
described below. See [the video placement review](dzemael_video_placement_review_2026-09-08.md)
for source timestamps, authored counts and remaining evidence limits.

Every authored hazard action must set `holdUntilReleased`. `StopReached` creates
one pending cast; the new `StopWaiting` callback retries failed admission on later
ticks. Readiness is sampled under the cast's lock, preventing overlapping updates
from dispatching twice or releasing on a stale pre-cast readiness result. Once
started, the action must end before release; the stop's existing minimum wait
still applies. Native prevention statuses defer it. A missing hold cancels that
route with a diagnostic, and a finishing/cleaning instance or withdrawn actor
cannot continue dispatching. These checks do not supply missing route geometry.

## Deepvoid Slave

Elbow Drop's rear-hit reaction is implemented in `DzemaelDeepvoidReactions`.
See the [reaction review](../Data/raidroutes/dzemael_deepvoid_reaction_review.json)
and [client verification checklist](dzemael_client_verification_2026-09-15.md).
A positive landed hostile command with a rear impact snapshot queues the owned
boss's next eligible Elbow Drop. Normal TP, recast, SpecialDelay, skill-use chance
and action locks still apply. Elbow is self-origin so the boss keeps facing its
front instead of turning toward the rear attacker. Failed startup/admission
retains the trigger; successful admission consumes only its captured ticket.
Hits arriving afterward can queue a later response. Disengage/reset invalidates
pending tickets, and death/despawn permanently stops the binding.

The archive supports use when attacked from behind. Positive damage, the existing
90-degree rear impact quadrant, coalescing, priority and queue retention are
reconstruction choices. The independent damage cone keeps its existing dimensions.
`Vector3.GetAngle` also fixes same-X north/south impact bearings while preserving
the wire direction mapping. The focused rear suite passes 55 checks; the added
87 impact-direction checks bring `--target-geometry-only` to 319 checks. The full
production harness passes 2,254 checks. No boss damage/interrupt settings or
placements changed in this pass; live reaction animation remains unverified.

Recovered profile:

- BNPC 3014, actor class 2302501 / native display name 3202503;
- level 55, 18,000 runtime HP;
- ogre skill list 34;
- commands 23041-23046, 23074, and 23157.

The [native identity review](../Data/raidroutes/dzemael_deepvoid_identity_review.json)
corrects the earlier same-name join to Atomos actor 2102507. The dungeon actor
selects native size ordinal 3, head 0 and body 2048. The event actor instead
selects size 7 and head 5120, whose e005 package supplies a persistent event aura.
Both main `server_battlenpc_mob_types_loot.sql` and the optional live seed now
bind BNPC 3014 to the dungeon actor. Shared appearance rows remain unchanged.
The Japanese dungeon name matches Elemen without the event family's middle dot.
`OgreR0D1Raid01` is bound to Porus, so its filename cannot identify Deepvoid.

Use `tools/mobspawns/darkhold_deepvoid_identity.py build|check` for the current
manifest. All 151 XYZ positions and earlier snapshots remain intact; only the
boss's actor-class metadata changes. Frozen historical joins are accepted only
for exact pinned file hashes and never for the active manifest. The identity
correction is independent of the later native flame layer below; neither proves
client rendering.

Spawn behavior:

- the Feasting Hall's separate large terminal summons Deepvoid;
- the ordinary AI begins with a 12-second SpecialDelay floor;
- at 50 percent HP or lower, UpdateDeepvoid claims the enrage transition once;
- SpecialDelay changes to six seconds;
- Regain 100 is added;
- the instance records DeepvoidEnraged and emits DzemaelDeepvoid diagnostics.

The [native flame review](../Data/raidroutes/dzemael_deepvoid_flame_review.json),
reproduced by `tools/inspect_dzemael_deepvoid_flames.py build|check`, identifies
ogre mode bit 7 (`0x80`). Native CIBB advertises that bit; `init_msb7_1` references
an effect authored under `ogre_m037/berserk_loop`, attached to both hands and both
feet. `init_msb7_0` and the native death scheduler cancel the same loop.

`DzemaelDeepvoidFlames` now requests that presentation with enrage, waits for the
current AI action to permit a state change, then sends SubState and the existing
active-model commit envelope to each ready viewer. Range re-entry uses a neutral
spawn state followed by a delayed, targeted commit. Session generation/readiness
checks retain failed delivery for retry and avoid replaying to existing viewers.
Cleanup/death discards pending delivery and restores the previous bit and spawn
deferral while preserving unrelated mode changes. Only the owned live native
dungeon actor participates; the event ogres and Porus are excluded.

This is a recovered native effect binding with an authored runtime trigger and
delivery sequence. The Darkhold client presentation, exact onset, lighting and
interaction with every ogre action still require live validation. The resource
review keeps SCB timing in raw authored units, without an unsupported conversion.

The 50-percent threshold and more-frequent TP moves are period evidence. The
12/6-second delays and Regain amount are explicit runtime policy because the
hidden retail cadence did not survive. Deepvoid's death records the objective,
publishes the Solid Scale Mail objective coffer, retires surviving Feasting Hall
stage enemies without kill credit, and opens the lower stage. The dead boss
retains its ordinary death/reward pipeline.

The shared attack-shape calculation now preserves axial/wrapped cone bearings,
box height and circle height relative to the resolved AoE origin. This corrects
Deepvoid's forward Double Smash (23041), rear Elbow Drop (23042), target-centered
Inferno Drop (23043), and Batraal's Desolation (23590) without changing their
configured dimensions. The current SQL policies remain 12-yalm/45-degree ogre
cones, an eight-yalm Inferno Drop circle and a 20-by-2-yalm Desolation box, all
with total height ten. These are existing authored settings, not recovered
retail hitboxes. The separate actor-facing predicate uses degrees; command
cone width remains a fraction of PI, with rear offset one meaning 180 degrees.

`tools/dzemael-encounter-tests/TargetGeometryChecks.cs` tests the production
command configuration/origin/shape path with these fixture dimensions, including
the ordinary shared geometry branch. Run the compiled encounter harness with
`--target-geometry-only` for the focused suite. It reproduced 54 failures before
the correction and now passes 232 checks. This verifies shape mathematics,
not command admission, navigation collision, damage balance, client telegraphs
or live dodge timing. Existing floor/eligibility filters and exact placement
rows are preserved. Other users of the shared geometry receive the same fixes.

The user's 2026-09-15 live test reported that Chain Bearers need to float.
The canonical main mob SQL and matching Dzemael seed now set BNPC 3135 /
actor 2304302 / `chain_bearer` to `floatingHeight = 0.9`. This reuses the
existing m505 Revenant presentation offset (profiles 39411/39426), not a
recovered Chain-specific retail height. `BattleNpc.ApplyMobType` copies the
offset before publication; ordinary spawn/movement and formation warp packets
already carry it separately from ground Y. No ground point, formation endpoint,
model-state bit, animation selector or combat rule changes. Apply the updated
SQL and restart Map Server to reload its profile cache before judging the new
appearance. The configured database's one owned profile was subsequently
updated from zero to 0.9 and read back while Map Server was stopped. The
standard Release Map Server build is also updated; a later launched process
and client render still require verification. Hover height and floor clearance
need a client retest, including after teleporting between formations.

The later source review identifies nine moving Chain Bearers and brackets one
inner phase to 70–80 seconds, matching the guide's 60–90-second range. Both
diagram formations and recorded ground candidates are preserved by
`tools/mobspawns/darkhold_chain_bearers.py plan|check|render` in
`Data/raidroutes/dzemael_chain_bearer_review.json`. That historical source plan
is followed by the applied `dzemael_chain_placements.json` layer. Runtime now
summons nine ghosts with the boss, prevents roaming/pursuit while preserving
native attacks, and alternates outer/inner endpoints. The first delay is an
authored 90 seconds; subsequent complete cycles choose 60–90 seconds uniformly.
That distribution is policy, not recovered retail timing. Each busy ghost waits
for its own native command boundary; ready ghosts can move first. Reservations
prevent duplicate warps, failed moves retry, and dead/withdrawn actors stay out.
No actor is respawned and the warp path preserves its existing enmity. Endpoint
Y, identity correspondence, facing and native fade presentation need client or
stronger source verification. `DzemaelChainWarp` logs each applied formation. See the
[active reconstruction log](dzemael_retail_reconstruction_2026-09-14.md#chain-bearer-formation-and-timing-review).

More decomp is not required to identify Deepvoid or its command list. A clean
period combat capture would still be useful to replace the cadence policy.

The separate [native visibility review](../Data/raidroutes/dzemael_chain_visibility_review.json)
is reproduced with `tools/inspect_dzemael_chain_visibility.py build|check`.
Chain Bearer actor 2304302 uses m505. Its supported mode bit 4 selects alpha
zero (`init_msb4_1`) or alpha one (`init_msb4_0`). Both native color-fade records
have **zero transition duration**: their mask value 8 selects the alpha channel,
and is not a frame count. The SCB block length also is not a fade or hidden-warp
duration. The renderer consumer confirms immediate assignment when duration is
zero. The off record explicitly forces its opaque starting value.

The original run was rechecked at 7:50/7:55 and 9:05/9:10. Minimap arrangements
confirm the existing formation changes, but the camera and combat effects do not
show one ghost body continuously enough to establish its hidden interval.
The native capability is now known; its retail use, position-packet ordering,
targetability/nameplate behavior, hidden dwell and live client acceptance remain
open. The review does not change the current warp, either formation or cadence.

The subsequent [position-packet review](../Data/raidroutes/dzemael_chain_warp_review.json)
traces the existing `WarpToPosition` behavior into the native client. Reproduce
it with `tools/inspect_dzemael_chain_warp.py build|check`; the scoped renderer
export uses `tools/decompile_dzemael_chain_warp.ps1`. Wire `0xCE`, arrival type
7 and zoning flag zero already drive native hide, relocation and POP-7 arrival.
The renderer packs category 15 / character bank 0 / effect 7 (`0x0F000007`).
Its asset contains opacity/color changes, sound and body-attached VFX.

Native `0065EF60` routes accepted SCB color selector zero to color storage slot
one, the same storage used by the initial arrival hide. This also applies to
m505's hide/show clips. They are competing writes, so an extra model-state
sequence could overwrite the arrival effect. The current integration is kept.
POP-7 has three color records at raw scheduler offsets 0/160000/260000, with
transition counts 0/10/20. These are different quantities; the ClipSync wait,
native stage advancement and actual hidden interval remain unmeasured.

The encounter suite now executes the real Chain update, Area broadcast and
Session gate. It checks the nine actual position packets, individual cast
deferral, reviewed endpoints, facing/floating height, unchanged model state,
no extra model commits and rejection of viewers without those actor instances.
This proves the server envelope and native binding, not retail use of type 7
or live ghost rendering, targetability, minimap/nameplate behavior or range entry.

## Batraal

Recovered profile:

- BNPC 3005, actor class 2303501;
- level 65;
- 27,489 HP and 1,206 MP;
- recovered list 66;
- commands 23350, 23351, 23352, 23354, 23356, 23357, 23588, and 23590.

### Spawn setup

The separate large `batraalsummon` terminal becomes available after the ten
Field IV warriors are defeated. It summons Batraal; the southern damage-window
terminal does not summon him. GM objective probes retain their explicit bypass.
The earned summon also offers the native introduction described above, after
the boss is actually tracked. It does not consume or publish the initial wave.

When Batraal spawns, the manager:

- stores the actor in InstanceState.Batraal;
- validates list 66;
- copies command 23590 into a director-owned execution shape;
- preserves its 20-yalm range and configures a forward box/line;
- removes both Desolation rows from ordinary autonomous selection;
- shields Batraal if the batraalshield device exists.

The two Desolation IDs are not interchangeable:

- 23354 is the ordinary 1000-TP row;
- 23590 is the zero-TP director row.

Only 23590 returns at the final threshold.

### Phase table

| Trigger | State change | Adds | Director behavior |
| --- | --- | --- | --- |
| Spawn | Barrier active | None | Damage is blocked until batraalshield is held. |
| Combat engagement, including while shielded at full HP | No sword change | 3 Purgatory Knights | Initial encounter wave runs once; direct damage probes retain a fallback. |
| 80% or lower | Sword damage state rises from 125 to 165 and requests native weapon aura | 2 Purgatory Knights and 4 Purgatory Mages | The north batraalenrage terminal becomes available to suppress both the attack boost and aura. |
| 40% or lower | Final phase latched | 3 Purgatory Knights | Restore only 23590 and attempt a forward Desolation every 12 seconds. |
| Heals to 100% in the same encounter | Existing phase flags stay latched | Existing surviving adds remain | The initial, 80% and 40% waves do not summon again on a second HP descent. |
| Death | Encounter retired | Every tracked surviving add despawns | Barrier timer, Desolation timer, and terminal-owned Defense Down are retired before rewards publish. |

The wave composition and threshold ordering are period evidence. The healed-HP
add persistence and one-time threshold summons are the user's stated reset
behavior, now covered by an encounter-state regression; client observation and
the source of that statement remain to be recorded. The exact
damage values, Defense Down magnitude, recorded add selections, and
12-second Desolation interval are current server policy or placement tuning
unless a later capture promotes them.
The supplied Elemen guide now supports the combat-start trigger and the
60-second barrier / 30-second west-terminal durations; see the active
[reconstruction log](dzemael_retail_reconstruction_2026-09-14.md).

### Barrier terminal

batraalshield is available while Batraal is alive. Holding it:

- clears battlefield.invulnerable for 60 seconds;
- applies status 223038 Defense Down at magnitude 20 for the same window;
- schedules barrier restoration;
- resets the device when the barrier reforms.

Defense Down ownership is reference-safe. If a player effect replaces the
terminal-created object, barrier restoration does not delete the player's
effect.

### West terminal

batraalwest is available while Batraal lives. It applies status 223015 Stun for
30 seconds to living Eye/Soulgazer actors within 60 yalms. Its final
position now uses recorded node 1120, within 0.89 yalms of the calibrated guide
symbol. It rearms after the stop window and requires a fresh hold. Its radius
and which patrol segment overlaps it still require retail/client verification.

### North terminal

Elemen identifies a separate north terminal for suppression of the glowing-hand
attack boost. `batraalenrage` now exists at recorded node 1072, within 2.09 yalms
of the calibrated diagram symbol. It lowers the empowered damage modifier from
165 to 125, then restores it and rearms independently of the south barrier.
The effect duration is explicitly provisional at 60 seconds: Elemen describes
temporary suppression without giving its duration. Live glowing-hand rendering
and exact occupancy minima still need verification. The later visual
review replaces the generic transporter model with the two-player small-circle
variant, matching Elemen's small-north classification.

The [native aura review](../Data/raidroutes/dzemael_batraal_aura_review.json),
reproduced with `tools/inspect_dzemael_batraal_aura.py build|check`, now binds the
visual to m054 mode bit 4 (`0x10`). The native `m054_aura_l/r` actions reference
two `weapon_aura` effect branches through ports `EID_SUBT_EFF3/2`. The off
scheduler cancels the on scheduler; bit 5 is a separate motion state. Native
references establish these ports but do not independently map them to skeleton
bones. Elemen supplies the observation that both hands glow during the boost.

`DzemaelBatraalAura` and `DzemaelDeepvoidFlames` retain separate native bindings
and share `DzemaelBossModelState` for delivery. Batraal's 80-percent transition,
north suppression and expiry request the desired aura state. Rendering waits for
the current AI action to permit a state change and coalesces pending requests.
Already-bound viewers receive state changes; new viewers initialize the latest
state after binding, even if they enter during suppression. One viewer's retry
does not restart the effect for others.

Unlike the ogre, m054's native death scheduler has no explicit aura cancellation.
The Batraal death hook restores the owned mode bit and sends passive SubState
before `InternalDie`; the existing normal DEAD envelope then commits it. No
additional Active Mode action is issued. This ordering and the full on/off/on
presentation still require a live client check. Native assets do not recover the
server packet sequence, effect onset, north duration or damage multiplier.

The south terminal now uses node 1161, within 0.31 yalms of its guide symbol.
Two adjacent add spawns use nearby exact recorded samples to avoid overlap.
Those add adjustments remain authored; they do not establish original retail
spawn coordinates. The full before/after record is
`Data/raidroutes/dzemael_batraal_terminal_review.json`; current previews are in
`docs/maps/dzemael-batraal-terminals-20260914/`.

### Adds

Purgatory Knight uses wight list 58:

- 23244 Doomwave;
- 23245 Magicked Skull;
- 23246 Shadow Sickle;
- 23247 Minions of the Pit;
- 23346 Soul Eater.

Purgatory Mage uses ghost list 32:

- 23125 and 23173-23177 Forbidden Magicks variants;
- 23127 Dark Cloud;
- 23128 Curse;
- 23129 Grave Reel;
- 23130 Gate to Oblivion.

Purgatory Mages now remain stationary between director-owned relocations.
The first relocation becomes due 30 seconds after the 80-percent wave, and
subsequent successful cycles schedule another 30 seconds. The target is the
living, present, non-cutscene player with the most positive enmity on Batraal;
it is not the mage's attack target or the boss's possibly stale selected target.
Existing mage threat is retained. Dead or withdrawn mages are never respawned.
The cycle stops when Batraal disengages/dies or the instance finishes.

Elemen establishes targeting, the 30-second interval and stationary attacks.
`Data/raidroutes/dzemael_mage_warp_ground.json` pins 181 complete arena ground
samples from the existing frozen zone-231 recording. The separate generated
`DzemaelMageWarpGround.cs` does not modify the static placements, BNPC
profiles or public SQL. `tools/mobspawns/darkhold_mage_warps.py build|check|render`
validates/rebuilds that pool. Its native map preview is
`docs/maps/dzemael-mage-warps-20260914/arena.png` with a matching frame sidecar.

Warp geometry remains policy: aim for a six-yalm ring, choose only original
samples three to twelve yalms from the target, require at least four yalms
between ghosts and at most 2.5 yalms vertical difference from the target.
Eight ring orientations are compared deterministically. These thresholds are
not recovered retail measurements. A complete survivor group must fit recorded
ground; otherwise the pending cycle waits without inventing a floor. Pending
native actions also defer the group until they can change state. Thus 30 seconds
is the documented eligibility interval, not a claim of exact client-visible
cadence under action/ground deferral. Warps use the existing broadcast relocation
packet; retail disappear/reappear animations and exact initial homes are still
unverified. Chain Bearers are not changed by this Purgatory Mage policy.

Every Batraal wave actor ID is tracked in BatraalAddActorIds. The boss death
path despawns the surviving set immediately, preventing adds from attacking
during the reward window.

## Devices and circles

SpawnDeviceAt publishes a director member using the recovered magitek actor
variant, preloads its persistent VFX state, and instantiates it for players.
It does not play the short completion animation on spawn.

`DzemaelTerminalPresentation` clears only extra-stat `0x80` when the control
activates and restores that bit on timed rearming. For an existing viewer it
queues current extra stat, the actor's unchanged private appearance, then the
matching v2 completion bank once on activation. Reconnects replay current state
without that effect. Failed delivery retries independently for each viewer;
rearming supersedes pending completion. Session replacement, actor-table reset
and the scoped NPC range-bind hook invalidate obsolete one-shots. Fresh binds
already receive the authoritative extra stat before appearance. The old delayed
650-ms animation replay is removed. Separate warp actors are unaffected.

The native review is `Data/raidroutes/dzemael_terminal_presentation_review.json`,
reproduced by `tools/inspect_dzemael_terminal_presentation.py build|check`. All
seven e003-e009 initializers have identical reviewed `0x80` condition bytes.
e004-e009 v1 model effects are distinct from their short v2 LIB effects. The
older report's "kill block" shorthand is corrected: Block002 contains a
chant-sync clip, while effect-end/kill records occur in Block001. The delivery
envelope reuses the separately tested object-presentation pattern; exact
Darkhold visuals and retail packet timing remain unverified in a live client.

UpdateDevices counts unique living, connected, nonsuperseded participants with
the exact current Player/Session and area registration, outside zoning/combat-cutscene
protection, within a 3.75-yalm horizontal radius and three yalms vertically.
The owned device must also remain registered in the area; a stale CurrentArea
pointer after removal cannot keep charging it. Normal route controls use the empirical charging
policy in `Data/raidroutes/dzemael_terminal_charge_review.json`, implemented by
`DzemaelTerminalCharge`. Each control needs ten player-seconds per unit of its
capacity. Continuing occupants add charge up to that cap; fewer occupants can
finish by staying longer. For example, an eight-capacity gate takes twenty seconds
with four continuing players or ten with eight. A two-capacity small circle takes
ten seconds with two players. These are reconstructed timings, not recovered
retail server constants or controlled minimum-occupancy results.

Current charging capacities are:

- Gullet: 2 and 6;
- Grand Hall: north four, middle and south two each. The middle control keeps
  the stable legacy key `circlehalllarge`; the northern key is `circlehallnorth`.

- the two gate terminals, transporter and two boss summons: eight;
- three Field III terminals: two each;
- four Field IV terminals: two each (the guide calls all four small);
- Batraal's southern damage-window circle: eight; north/west circles: two each.

The grounded manifest and runtime roster contain the same twenty stand-on
devices: the two early gates; Gullet's small/large pair; Grand Hall's north,
middle and south controls; the transporter; Deepvoid's summon; three Field III
controls; four Field IV controls; Batraal's summon; and Batraal's south, west
and north combat controls. The encounter regression compares both complete key
sets, so a grounded device cannot silently disappear from the runtime builder.

Capacity limits the useful contribution rate; it is not a minimum party size.
Single-player contribution within an admitted normal party is an extrapolation.
Normal admission still requires four to eight players. Empty circles, lost
availability, timed rearming and unsampled gaps above two seconds clear partial
charge. Only occupants with the same Player, Session and actor-instance generation
in successive samples contribute that interval. A reconnect with the same character
ID starts a new contribution interval; unchanged occupants retain their earned charge.
Complete replacement of the occupant set resets continuous occupation even without
an intervening empty sample. The GM hold likewise requires its minimum number of
continuing lifetimes. Exact retail reset/decay behavior
remains unknown. The default GM-solo route controls retain a one-player
1.5-second hold; explicit GM probes retain their requested minimum and the same
short hold. `!dzemael enter cs normalcharge` or
`!dzemael enter nocs normalcharge` keeps solo admission while exercising the
normal player-seconds policy. With one tester, a capacity-two circle takes 20
continuous seconds and a capacity-eight circle takes 80; this diagnostic does
not turn those values into recovered retail constants.

The August 2011 guide records 2/6 and 2/2/4 party assignments, not controlled
minimum-occupancy tests. Later footage distinguishes the Grand Hall's third
circle from its other two, but its partially obscured marks do not independently
prove the four-player minimum. Elemen calls all three small; that adjective alone
does not establish identical counts. The current capacities remain reconstruction
choices. The earlier `Data/raidroutes/dzemael_circle_count_review.json`
is historical: its upper asset labels are superseded by
`Data/raidroutes/dzemael_native_circle_review.json`.
The later calibrated guide/footage review assigns the distinct intermediate form
to the northern control, correcting the earlier west-side assignment. Middle
and south are small. This placement/type association is an interpretation of
the route and landmarks, not a controlled minimum-occupancy test.
Other counts remain reconstruction policy. Batraal's south uses native 1200204 / b936-e005; north and west use
1200208 / b936-e009. These replace the prior identical one-person e004
transporter visuals. The original run at 16:18–16:22 visibly shows the large
blue southern circle, while Elemen identifies north and west as small. The
former six/two/two minima were scoped estimates. Charging replaces those minima;
all controls retain their separate effects and rearming clocks.

The native geometry review corrects the old consecutive 2/3/4/5/6 assumption:
e009/e008/e007/e006/e005 contain **2/3/4/6/8 geometric arcs**. Exact XYZ welding
joins duplicated seam vertices; it does not fill gaps or infer world geometry.
`CircleSegments` binds the visual independently of `ChargeCapacity`.
Gullet's six-capacity reconstruction uses e006 / actor 1200205, correcting its
previous e005 appearance. The gates, transporter, boss summons and Batraal's
south circle preserve e005's eight-segment appearance. Their eight-capacity charge
is a separate empirical choice; the mesh alone is not proof of a later-patch
minimum, charging rate or party scaling rule.
GM `circle` probes accept exactly 2, 3, 4, 6 or 8 and use the matching variant
and animation banks; unsupported counts no longer silently select e005.

Normal admission allows four to eight players. The previous six-person controls
blocked smaller admitted parties, a **confirmed retail-fidelity gap**:
`Data/raidroutes/dzemael_light_party_review.json` reviews kaeko1's March 31, 2012
four-person run, identified by its participant as shortly after 1.21a. The four
players open both early gates and the Gullet pair, and five completion coffers
are visible at 23:30. The large gate artwork remains present. Current hard-six
checks could not reproduce that run, irrespective of the duration of occupation.
The charging correction now permits that route in offline production checks.
Its exact formula remains provisional; neither the run nor the official 1.19
admission change uniquely establishes a charging or party-size-cap formula.
At 2:47 and 2:57 all four bodies are visible within the Gullet gate artwork before
activation appears by 3:02, so the universal 1.5-second hold also needs comparison.
Those sampled frames are not proof of the server radius or a universal 15-second
hold. The later small-circle samples at 3:17 and 3:22 likewise show a wait before
the cool-wind activation appears by 3:27. The separate charging review records
these observations and the implementation choices. GM solo behavior remains
separate and cannot establish normal-party behavior.

Activation feedback now uses the native localized worldMaster message bank.
Observed stable-key bindings are Gullet gate/transporter/Batraal summon to 52030 (soothing),
Gullet small and Grand Hall middle/south to 52026 (cool), Gullet large to 52029
(crisp), and Grand Hall north to 52028 (gentle). Other devices use the native
generic row 52069 pending a reviewed wind binding. Neither model segment count
nor headcount selects the message. The structured device log retains diagnostic
keys/counts; the ordinary activation line no longer exposes them to players.

`TakeProgressNotices` claims each earned and completely published stage once
under the instance lock. Its door unlocks must exist, or the map-one transporter
actor must be present in the same private area. Both Field IV barriers belong
to one field-clear event. Failed publication remains retryable, GM prepublication
alone is insufficient, and teardown/pending victory suppresses announcements.
Localized packets are sent after releasing the lock. Gates use 52015 selectors
1/2/3; fields use 52017 selectors 1/2/3/4. One-based selectors follow the native
photocell grammar in row 52024; a missing parameter is distinct from index zero.
New/replaced/withdrawn populations use 52033/52034/52032, respectively. The
transporter sends withdrawal before activation 52016, matching footage at 6:00.
The early-1.x Blue Garter run directly shows Field III/new-wave at 8:00 and
Field IV/withdrawal-replacement at 9:50. The latter includes experience messages
between the two notices; exact packet timing is not reproduced. Later-patch
client acceptance remains unverified.

The ten-warrior encounter has a separate native new-wave notice (52033),
observed in the 9:40 battle log. It waits for Deepvoid's defeat, all four seal
controls, the lower-hall population and all ten canonical warrior registrations
in this private area. Reserved spawn keys alone are insufficient. The instance
lock claims the notice once; failed publication remains retryable. An already
defeated wave, teardown or pending victory suppresses stale announcements.
The former custom warrior-death line no longer claims the field has fallen
before the replacement population and both barriers are ready.

`Data/raidroutes/dzemael_native_message_review.json` pins source rows/hash,
video times and these limits. Current recipients are players in the private
area; historical distance filtering, exact delays and live localization
rendering remain unverified. This does not change terminal occupancy, visuals,
activation/rearm clocks, effects or reward membership. Other reward/encounter
announcements still use authored text and remain separate retail work.

`Data/raidroutes/dzemael_video_clock_review.json` records the Blue Garter run's
sampled 1.8-times acceleration and its early Rank/Physical Level UI. Use its
countdown for timing; playback timestamps are seek positions. The separate
`SYWtisRBS-0` Chain Bearer observations track real elapsed seconds and retain
their existing timer policy.

The all-terminals reward now checks all twenty canonical terminal identities,
including optional branches and the three combat terminals. This follows
Elemen's unqualified all-terminals wording; combat-terminal inclusion remains
an interpretation to compare with a complete reward run. Activation history
persists when a reusable combat effect expires. Diagnostics report that history
against twenty, separately from current active device states; missing or unrelated
GM probes cannot substitute for a required terminal.

## Doors

`DzemaelTraversal.Doors` owns 12 exact layout-211 bindings. The Map Server log
from 2026-09-08 shows the user needed same-area warps at the three unspawned
ordinary doors and at blue barriers. These observations identify missing local
control; they do not establish original retail progression rules.

| Instances | Behavior in a fresh populated instance | Release condition |
| --- | --- | --- |
| 1406 | Stables door starts locked; opens and stays open after unlock | Approach terminal |
| 1408 | Gullet door starts locked; opens and stays open after unlock | Its own Gullet terminal; Stables is optional |
| 1409 | Grand Hall door starts locked; opens and stays open after unlock | Both Gullet circles |
| 1410, 1411, 1412, 1418 | Unused branches stay closed | No automatic release; GM override remains available |
| 1486 | Grand Hall blue barrier starts closed | All five route circles active |
| 1493 | Feasting Hall barrier starts closed | Deepvoid Slave defeated |
| 1494, 1495 | Both Field IV barriers start closed | All four Field IV terminals, then ten distinct tracked Hellsbound Warrior deaths |
| 1496 | Field III / Granary barrier starts closed | Deepvoid defeated and all three optional Field III terminals |

The progression sequence now follows Elemen's dated guide. The unused branch
closures remain authored, and native collision/animation acceptance still needs
a client run. Ordinary door classes remain 5900015; the five
blue barriers use 5900016. Native map-object XYZ and layout/instance IDs are
validated against the local SQL. Map-object Y is not a ground sample.

SpawnRouteDoors is atomic. Each object is constructed with its complete
binding before publication; no old public spawn rows are bulk-copied into the
private area. Failure cancels entry. The ordinary-door state machine remains
unchanged for other content. Darkhold's three earned route doors use a
private-instance-only open latch; they do not return to the shared proximity
close timer. The GM locked-closed override can still relock and release an
individual probe.

The manager explicitly enables instance-owned ordinary-door control before
publication. This opt-in is tied to the exact `PrivateAreaContent` object and
still respects Lua exclusions for progression objects. It is independent of
`open_world_doors_enabled` and the public zone toggles. The 18:32 entry failures
on 2026-09-08 exposed the earlier dependency: with the global switch disabled,
door 1410 rejected the branch lock and canceled entry. Public-door configuration
is preserved by the fix; no global switch needs to be enabled for Darkhold.

Barrier state is instance-owned and monotonic. The private manager overrides
the initial bind flag to false before publishing each exact route actor, keeping
actor 5900016 visible and closed. The public zone-specific scripts remain
unchanged; their definitions are not the private-area dispatch path.
`UpdateTraversal` releases only the configured gates, sending the native `hide`
animation to known viewers.
`DoorServer.onSpawn` calls the narrow `ReplayDzemaelRouteGate` bridge for zone
231; the manager verifies exact actor membership and replays an opened barrier
with settled `hide`. Earned ordinary doors replay their latched `open` state
through the shared instance-owned controller. This handles later streaming and
reconnect without sending commands to distant uninstantiated objects. In
particular, Feasting Hall barrier 1493 is published at its native layout binding,
stays closed through the Deepvoid/Chain Bearer battle and hides only after the
tracked Deepvoid Slave dies.

### Portals and chest access

After all five upper circles and the transporter terminal, two selectable
`???` transporters connect the end of the first route and Dragonbreath Falls.
Each source and landing remains an exact recorded point. Examine the actor,
then confirm the native `Activate the magitek transporter?` prompt. Walking or
standing on either inter-map actor never triggers travel automatically.

The original run at 6:05–6:08 shows the selected unknown-name actor and the exact
prompt, matching recovered `RaidDungeonWarp` text bank 6781, widget arguments
`2, 2, 1, 2` and scheduler `0x0405E000`. Private actors retain appearance 1200203
/ b936/e004, set the interactive powered extra stat `0x81` before appearance,
and override `classPath`/`className` to the recovered script before publication.
Shared SQL classes and Toto-Rak bindings remain untouched. The short e004/0004
fizzle is no longer played when these two powered portals first appear.

Server confirmation resolves the exact instance-owned actor, current event owner,
live session, progression and source-floor proximity again. Dead, disconnected,
replaced-session, transitioning and cutscene-protected players cannot travel.
Concurrent confirmations are reserved per Player object. The NPC event ends
before the same-area move rebuilds visibility. Fixed destinations preserve the
private instance, timer, objectives and saved entrance; zone 231 cannot fall
through to the generic raid exit or Toto-Rak fallback. No/cancel does not move.
The recorded route endpoints are still reconstructed. The current move uses
spawn type 15, which enters the native loading/fade state machine. Footage at
6:12–6:15 shows loading followed by arrival; it does not establish a separate
occupancy cutscene. See `Data/raidroutes/dzemael_transport_presentation_review.json`
before selecting a scene. Exact retail presentation and live-client acceptance
remain unverified.

After Batraal's clear, a separate portal appears on the southeast side of his
arena, away from reward coffers. A five-second cancelable hold invokes the
content-return helper and its normal departure/cleanup handling. A timeout
never enables this victory portal. Portal actors and visit state are retired
with the instance. `!dzemael diag portals` reports publication, availability,
and released gate IDs.

The user confirmed that the last first-map eastward dead-end was reached by
warping through a wall and asked us to ignore it. Nodes 599-613 and their eight
incident edges were removed from the active navmesh. The frozen capture keeps
them with an explicit exclusion that blocks future placement. Forward portal
node 598 and return landing node 592 remain before that wall. The second coffer
was previously moved to node 590 as an authored accessible substitute. The later
Elemen calibration now places it at node 466 in the northern dead end, matching
the guide's marker and text. This does not reopen the excluded eastern branch.
The first/third route coffers and drake coffer also follow calibrated guide
estimates; the Captain, Deepvoid and victory coffer homes remain unchanged.

See [traversal audit and maps](dzemael_traversal_2026-09-08.md). Native actor
publication, barrier collision changes, and stock-client portal travel still
need a fresh in-game smoke test.

## Lua and C# ownership

Lua is intentionally a thin integration layer for this dungeon:

- DftRoc.lua recognizes Dyrstweitz and invokes DzemaelTryStartFromNpc.
- dzemael_entry.lua calls WorldManager.StartDzemaelInstance. The C# manager,
  not Lua, revalidates party size, leadership, level, quest, timer, and area.
- Dzemael.lua reapplies music and does not own encounter state.
- commands/gm/dzemael.lua parses test commands and forwards them through
  WorldManager wrappers.
- dzemael_gc_quest.lua owns the three Into the Dark quest conversations,
  sequence flags, journals, and final company rewards. The manager advances
  only the recovered dungeon clear point.
- monster_tp.lua owns command-level special effects shared by all users of a
  command, such as the Death Throes status bundle.
- LuaEngine.cs intercepts the dynamic coffer prefixes because those actors do
  not have a permanent per-instance Lua file.

DzemaelManager owns every mutable dungeon rule: InstanceState, stage
publication, devices, hazards, bosses, objectives, eligibility snapshots,
reconnect replay, and cleanup. WorldManager is the stable Lua and engine event
facade. BattleNpc and Npc provide reusable actor behavior but contain no
Darkhold route state.

## BattleNpc death and reward ordering

The ordinary BattleNpc.Die pipeline is deliberately preserved. Duplicate death
calls are ignored, then the server records the kill and invokes dungeon-manager
callbacks, including HandleDzemaelBattleNpcDeath. Only after that callback does
the generic path distribute EXP, gil, SQL drop-list loot, BNPC kill credit, Lua
onDeath, and bonus EXP. Scripted one-shot mobs remain in the client death/fade
state before removal from both the area and director. Darkhold's coffer and
objective rules are therefore additive to normal BNPC rewards, not a
replacement for them.

The Darkhold callback is gated by private zone membership and recovered actor
class IDs. The clear candidate is class-based rather than relying only on the
manager's current object reference. The manager recognizes:

- northwestern Alpgrot Orobon;
- Deepvoid Slave;
- the three objective Lava Drakes;
- Imperial Primus Ordinarius;
- Batraal.

Captain/Primus completion advances the active Into the Dark city quest sequence.
Batraal's actor-class death also flows through the common quest BNPC kill
callback, so the manager does not grant duplicate quest credit.

Dynamic coffers use unique IDs:

~~~text
DZEMAEL_ROUTE|key|itemId|minimum|maximum
DZEMAEL_OBJECTIVE|key|itemId|minimum|maximum
DZEMAEL_REWARD|key|itemCsv|minimum|maximum
~~~

LuaEngine recognizes those prefixes and calls
WorldManager.OpenDzemaelTreasureCoffer. The manager provides duplicate-open
protection, animation, party loot assignment, objective bookkeeping, and
despawn. Unique ID, not a static map-object row, is the authoritative dynamic
coffer identity. Route and objective coffers deduplicate by logical key; reward
coffers deduplicate by full unique ID. Concurrent opens reserve an
OpeningCoffers key before animation or award processing.

Animations are sent only to current-area players. Award candidates must be admitted
participants with a connected, nonsuperseded session bound to the exact Player
still registered in the instance. Delivery rechecks the captured session under
its lifecycle gate before each grant; death alone does not exclude a player. Offline
participants do not receive a deferred persisted coffer award. `RaidCofferRolls`
preserves the first selection and tracks each delivered item. A failed or partial
delivery leaves the coffer available; a retry attempts only the pending items.
Only complete delivery records the open and schedules the display-delay despawn,
which removes the actor from the director without ending it. Manager replay has explicit activated
device and released-barrier state. Coffer-open state relies on the current
actor state and published actor set.

At Batraal's death, eligibility is frozen for:

- the fixed Batraal reward;
- northwestern Orobon;
- all twenty canonical Magitek terminals activated at least once;
- a clear within 25 minutes;
- all six regular coffers: four route plus two objective.

Earned reward coffers remain available during the **five-minute** clear window.
The [original run at 14:13-14:18](https://www.youtube.com/watch?v=WmJxkVbowSI&t=853s)
shows the post-Batraal departure notice followed by a five-minute countdown
announcement. `RewardCofferSeconds = 300` replaces the old authored 90-second
window for the server finish deadline and closing-scene end time. Manual exit
remains available earlier. The same frames show a 1,331-gil party award among
the equipment entries, but do not establish its coffer attribution or a range.
The [preserved Elemen guide](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/DzemaelDarkhold.html)
records zero to two equipment pieces in the fixed red Batraal coffer and one in
each conditional blue coffer. Runtime now permits those counts. Regular coffers
retain their authored one-in-six equipment chance. When a regular roll misses
equipment or the red coffer rolls zero equipment, its common pool contains
Grade 5 Dark Matter (10013005) and Vampire Plant (10009612). Both already exist in
the main item SQL. Count selection is uniform, the common items have equal weight
and each common award is one unit; these probabilities, quantities and fallback
combinations are reconstruction choices, not recovered drop-table values.
Gil is also listed by the guide but is not yet awarded by this coffer path;
amounts, distribution and simultaneous common/equipment rewards remain open.
The earlier Blue Garter run at 8:22–8:25 directly shows 359 party gil with
Warlock's Buckler following the drake coffer interaction. This establishes an
early-era equipment/gil combination, not later-patch per-coffer amounts or odds.
An August 2011 participant also reports all final coffers yielding Dark Matter;
the later Elemen-based blue-coffer equipment policy is therefore not a proven
guarantee for every 1.x patch. Both observations and the unresolved conflict
are retained in the loot review.
See `Data/raidroutes/dzemael_coffer_loot_review.json`.

Party item delivery now announces the native localized loot-list message through
worldMaster row **25033**, whose explicit parameters are quantity, item ID and
quality ordinal (currently 1/item/0 for one NQ item). The similarly worded 25021
reads implicit item context absent from the generic message packet. The actual
recipient is the message actor so the client can select Your or the player's
name. Successful delivery is recorded before notification; failed items stay
pending and receive no success notice. Solo GM delivery uses neutral item-find
text because it may enter normal inventory. Internal coffer names and regular
coffer progress counters remain in server state/logging instead of chat.
Reproduce the native evidence with `tools/inspect_dzemael_coffer_messages.py
build|check`; see `Data/raidroutes/dzemael_coffer_message_review.json`. The
production harness checks the serialized recipient, native row and three item
parameters. Localized rendering, distant-party name resolution, original packet
ordering and live loot transfer/retry remain unverified.

The exact original coffer actor class remains unrecovered; actor 1200161 is an
explicit substitute. The six completion coffers now select their native b923 appearances
privately before first publication: e003 red/gold for the base Batraal reward,
e002 blue/silver for the four condition rewards, and e001 copper/black for the
personal Enchiridion. These match the native color textures and the participant's
[August 2012 receipt screenshot](https://livedoor.blogimg.jp/esu_esu_51/imgs/7/3/7314667f.jpg).
The shared SQL class, ordinary route/objective chests and other content are
unchanged. Reproduce the evidence with
`tools/inspect_dzemael_coffer_appearance.py build|check|render` and read
`Data/raidroutes/dzemael_coffer_appearance_review.json`. The extracted textures
are unlit asset previews, not a live rendering or recovered actor-ID binding.

The separate personal Enchiridion coffer now follows the native
`processOpenDzemaelEpicQuestType` contract: quest 110868, item 10011244, direct
inventory grant per player, empty message 60027, failed-capacity message 25262,
and personal scheduler 0x040C9000 even for empty/full outcomes. It does not use
the normal party loot pool or disappear when another player claims it.

A [July 23, 2012 participant guide](https://archylte.blog.shinobi.jp/Entry/360/)
describes the post-Alumina stage and a fifteen-minute clear with all five other
reward coffers. An [August 2012 participant diary](https://esuesu-lodestone.blog.jp/archives/25203459.html)
corroborates a successful run and the need for each player to collect the book.
The implementation interprets this as elapsed time <= 900 seconds and all five
existing reward conditions earned. Clear-time quest participants are captured
at Batraal's death; publication waits for the five ordinary reward actors to
publish successfully. Late publication retries cannot change eligibility.

The current disabled `etc106.lua` scaffold maps the collection interval to
sequences 4–6: after the Alumina dialogue, before Rowena's exchange. This is
an explicit local mapping, not the missing native `isDropDzemael` body. Stage
and existing item ownership are checked again on open. A failed add remains
retryable; successful claims are once per player per instance, including after
discarding the book. Concurrent opens reserve that player's claim independently.

The exact 15:00 boundary, recipient snapshot and once-per-instance rule are
implementation choices. Elemen's time wording differs from the participant
accounts. Its blue relic-coffer description is superseded for the appearance
choice by the diary's direct copper-coffer receipt screenshot; the conflicting
text remains in the earlier evidence record. Exact actor-class and drop-sheet
joins remain unrecovered. Actor 1200161 remains the documented substitute.
A Relic Reborn is still disabled/incomplete, and no live
quest-coffer interaction or full quest chain is claimed. Item 10011244 already
exists in main SQL; the new private runtime actor needs no public spawn SQL.

## Re-entry, departure, and final cleanup

Before entry, the manager records every participant's public zone and exact
coordinates in memory and in the content re-entry table. Reconnect admission is
checked atomically against participant membership, ticket expiry,
content-finished state, and the area's current re-entry policy. Reconnected
players use the same deferred director binding as first entry.

After that bind, an admitted replacement session receives a separate one-use
`resumePresentation` invitation. Its native `relogin` restores active-duty UI
with the existing deadline; during the clear window it uses `FinishAtUtc` and
the native clear flag. It grants no opening or intermediate cutscene permission.
The shared scene slot defers busy players, and exact player/session, director,
actor generation, membership and lifecycle checks reject stale callbacks.
Native reconnect rendering remains a client acceptance check. See the
[2026-09-25 implementation gap review](dzemael_implementation_gaps_2026-09-25.md).

Leaving clears director/content-group references and combat claims and can
remove the database re-entry ticket. Voluntary exit uses
ExitCurrentContentToReturnPoint, which follows the generic DoZoneChange return
path rather than DoZoneChangeContent.

Update order is timeout, empty/reconnectable-participant checks, delayed finish,
then active mechanics. A finishing instance no longer advances devices or boss
state. Empty cleanup waits five seconds and applies only when no live player and
no reconnectable participant remains.

TryBeginFinish is the single finish latch. Clear starts the reward window;
timeout and manual GM cleanup can finish immediately. FinishInstance:

- marks cleanup once;
- snapshots and despawns mobs, devices, portals, route doors, and coffers;
- ends the director/content area;
- disables re-entry;
- returns remaining players through the saved content return path;
- removes the instance from the manager.

An empty normal instance is not destroyed while a participant still has a valid
reconnect ticket. Empty GM diagnostic shells use the short cleanup grace. The
manager update is reachable through both the global zone-system phase and the
legacy ZoneThreadLoop; InstanceState.Sync and the finish latch are the shared
synchronization boundary, so neither path may independently mutate encounter
state outside the manager.

## Diagnostics and test workflow

Recommended normal solo mechanics pass:

~~~text
!dzemael enter nocs normalcharge
!dzemael diag summary
!dzemael diag doors
!dzemael diag portals
!dzemael diag hazards
!dzemael diag devices
!dzemael diag objectives
!dzemael defeat deepvoid
!dzemael boss 99
!dzemael boss 80
!dzemael boss 40
!dzemael diag boss
!dzemael diag rewards
!dzemael cleanup
~~~

Recommended one-door client probes:

~~~text
!dzemael enterempty
!dzemael door 1406
!dzemael diag doors
!dzemael doorlock 1406 on
!dzemael doorlock 1406 off
~~~

Use a fresh empty instance for each tested ID: ordinary doors 1406, 1408, 1409,
1410, 1411, 1412 and 1418; barriers 1486 and 1493-1496. The doorlock override
applies only to ordinary doors. Capture any client exception and server
DzemaelDoor log together; populated instances exercise progression release.

Important log families:

- DzemaelBossProfile: SQL/list integrity;
- DzemaelHazard: actor identity, invulnerability, pause skill, duplicate count;
- DzemaelDeepvoid: 50-percent transition;
- DzemaelWave and DzemaelBatraal: phase and barrier behavior;
- DzemaelDoor: spawn, probe, lock, and state;
- DzemaelGate and DzemaelPortal: progression release and completed travel;
- DzemaelStage: population and section retirement;
- DzemaelCoffer, DzemaelObjective, and DzemaelClear: reward bookkeeping;
- DzemaelRelicCoffer: personal Enchiridion claim result;
- DzemaelReplay and DzemaelFinish: reconnect and teardown.

## What still needs evidence

The native tables and existing decomp cover actor appearances, command lists,
Batraal HP/MP, hazard moves, director scenes and ordinary door bindings. Individual
joins still require checking: the September 15 Deepvoid review corrected a
same-English-name dungeon/event mismatch in the earlier profile. Period evidence
supports the Deepvoid threshold and Batraal wave composition; the hidden policies
and presentation described below remain incomplete.
The Darkhold-specific monster Lua files add only inheritance names, while the
Dzemael-specific treasure-box branch now backs the separate personal relic
coffer; its native quest predicate, exact table/appearance join and client
acceptance remain unresolved.

Targeted evidence is still worthwhile for:

1. Eye and Soulgazer waypoints, sector transitions, pause duration, and exact
   special-move cadence.
2. Deepvoid's original normal/enraged TP timing and live validation of the newly
   bound half-health flame presentation.
3. Terminal occupancy and behavior for undersized later-patch parties, plus in-client
   acceptance of the guide-backed objective sequence and bound barriers.
4. Batraal terminal overlap with historical patrols, north suppression duration,
   live validation of the bound glowing-hand presentation and exact Desolation timing. South/west durations
   now follow Elemen; the three terminal ground points follow calibrated guide
   estimates. Exact add home positions remain unconfirmed.
5. The original Dzemael coffer actor and route/objective drop probabilities.
6. Mob, device and coffer positions/counts compared with calibrated source
   landmarks. The user permits empirical estimates from the nav data; preserve
   their evidence and uncertainty instead of requiring an original coordinate
   dump. The current static manifest has 125 recorded points (123 primary and
   two from the separate terminal recording), three exact user
   positions and 23 scoped floor estimates. A live populated
   run must still check model clearance, targeting and combat on those points.
7. Exact transporter travel presentation, retail endpoints and live-client acceptance
   of the recovered prompt/private visual binding.
   Functional portals now use reviewed ground and the existing magitek sigil.

More YouTube is not required to keep implementing non-placement boss logic.
It becomes useful when it is an uncut original 1.x run with a readable minimap,
visible hazard stops/casts, terminal activations, or door transitions. Video
alone should not override shipped actor IDs or command data.

For doors and client stability, a live 1.23 packet/client probe is stronger than
video. For exact positions, a player position capture registered to the period
minimap is stronger than visual guessing.

## Safe placement-pass procedure

When placement evidence arrives:

1. Record source, timestamp, map frame, player position, camera direction, and
   uncertainty.
2. For coordinates, add a reviewed layer over the current frozen manifest,
   retaining the source capture and prior layers. The latest builder is
   darkhold_chain_placements.py; it writes the main JSON and both generated C#
   position classes together. darkhold_chain_bearers.py preserves the earlier
   source/candidate review independently.
   Record calibrated source pixels, ground support and estimation confidence.
   Update manager arrays only when encounter membership changes.
3. For hazards, convert RelocationAnchor stops into an explicit single-actor
   relocation schedule; never publish a second Eye or Soulgazer.
4. Tie each hazard pause cast to a reviewed stop event, preserving the distinction
   between source observations and inferred stops/timing.
5. Bind door locks to a source-backed objective transition through the per-door API.
6. Run the static validator, Map Server build, door proximity test, and a stock
   client smoke test.
7. Keep uncertainty documented until the live route reproduces the capture.

### Publication retry hardening (2026-09-19)

Objective completion now records the Warlock's Buckler and Solid Scale Mail
coffers as earned before actor publication. A null publication retries the
missing coffer once per second through the active run and clear window; the
appearance notice is sent once only after `PublishedCoffers` records success.
Route, reward, item-roll and objective eligibility rules are unchanged.

Batraal's initial, 80-percent and 40-percent phase latches remain one-use across
healing, while each authored add placement has a separate in-flight/published
ledger. Null or partial wave publication retries only missing placements.
Successful identities are tracked immediately for death cleanup and stay pinned
after death, so a retry cannot revive them. Retries stop when Batraal dies,
leaves the owned instance, enters pending clear, or cleanup begins.

An isolated Map Server build and **2,364 production encounter checks** pass.
This is offline lifecycle coverage; no deployment, live database change or
client clear/loot/exit acceptance was performed.

## Validation

Run:

~~~powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate_dzemael_darkhold.ps1
python -B -m unittest discover -s tools/mobspawns -p test_darkhold_placements.py
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
dotnet run --project tools/scripted-actor-route-tests/ScriptedActorRouteTests.csproj --no-restore
dotnet build "Map Server/Map Server.csproj" --no-restore
dotnet run --project tools/world-door-proximity-tests/WorldDoorProximityTests.csproj --no-restore
dotnet run --project tools/dzemael-traversal-tests/DzemaelTraversalTests.csproj --no-restore
dotnet build tools/dzemael-door-integration-tests/DzemaelDoorIntegrationTests.csproj --no-restore -m:1 -p:BuildInParallel=false
dotnet run --project tools/dzemael-door-integration-tests/DzemaelDoorIntegrationTests.csproj --no-build --no-restore
git diff --check
~~~

Expected build warnings are the existing DotNetZip and
System.Security.Cryptography.Xml advisory warnings. New compile errors, Lua
parse failures, missing validation tokens, or door-state test failures are not
expected.
