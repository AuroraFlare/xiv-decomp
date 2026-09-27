# Aurum Vale and Cutter's Cry mechanics completion audit

## Journal process and filesystem regression

The independent `--journal-self-test` passes ten checks without a database.
An owned child flushes all six markers and acknowledges completion; the parent
terminates it and restores the exact set through a fresh journal instance.
Other database/character identities see no credit. Exclusive file locks make
record/deletion fail visibly while retaining the marker; releasing the lock
allows successful retirement. A regular file blocking directory creation also
fails visibly. The build passes with zero warnings/errors.

This closes the separate-process-after-flush and selected filesystem-error
coverage gaps described below. It does not simulate power loss, disk exhaustion,
loss of the pending directory during deployment, or a full server login after
termination. The existing database replay checks remain separate evidence for
exactly-once points. No production behavior or SQL changed in this test pass.

## Durable pending achievement markers

LegacyRaidAchievementJournal records one empty marker per eligible character and
achievement before attempting database completion. Files are opened with
WriteThrough and flushed to disk; only the six exact achievement filenames are
loaded. A SHA-256 directory scope covers database host, port, name and world ID
without storing credentials. Pending markers live in `pending-raid-achievements`
beside the executable and must be preserved across deployment. This introduces
no database schema change; all existing main-SQL data remains canonical.

Player retry lazily restores markers, retaining five-second backoff for read or
write failures. Completion deletes a marker only after the database reports
success or an already-completed award. Failed deletion remains retryable. Memory
continues to hold pending attempts if a journal write fails; that case is not
durable until storage becomes writable. Initial category gating is unchanged.

The isolated integration passes 2,510 checks with the existing error gate. All
six failed achievement transactions retain markers, another character cannot
load them, a replacement Player restores each award and exact points, and replay
of a marker after DB commit adds no points. The fixture supplies an initialized
replacement Player with loaded points, not an actual login. Forced process-kill,
filesystem fault and database-scope separation tests remain further validation;
timer writes during a sustained outage remain a separate persistence limitation.

## Accumulated-fix integration checkpoint

After the Gold Lung/Goldbile, authored circle, sand-notice and reward-cleanup
changes, the production integration assembly was rebuilt with zero warnings or
errors. Its isolated canonical database run passes 2,480 checks and the runtime
error gate (exactly the two timer and six achievement failure injections, no
unexpected errors). The disposable database stopped successfully. The tested
Map Server DLL SHA-256 is
`9C98DB4B8BCBFB582DB16E4B38BAD915A9810C428B182DDC077EEB7EB0ED7B77`.
This is an isolated output, not a deployed server identity.

The client checklist now reflects the implemented in-session persistence retries.
Sustained-outage/logout/crash durability remains an implementation gap. Normal
party entry, complete autonomous fights, successful connected route transfers,
native scenes/widget/effects and floor acceptance remain unverified; the passing
fixtures do not reduce the remaining goal to mob Y coordinates alone.

## Reward coffer cleanup failure isolation

Both boss-reward cleanup callbacks now use the shared RetireCoffer helper.
Despawn failure no longer skips director-member removal. The route coffer path
uses the same helper after its existing opened/area/identity checks. Manager
callbacks preserve their previous behavior for a moved coffer: remove the old
director membership without despawning it in another area. Null actors are ignored.
Award ledgers, item rolls, delay and cleanup guards are unchanged.

The production regression retains its forced-despawn-failure case and adds moved
actor membership cleanup plus null-actor isolation. Delayed scheduler availability,
successful native chest disappearance and a retry after an actual actor-removal
failure remain distinct from these checks; this change does not claim guaranteed
physical removal after an exception.

## Authored circle barrier commit and presentation isolation

The authored route previously recorded circle activation before its animation
and barrier callback. An animation exception could permanently skip the barrier
callback because later updates saw an already-activated circle. Activation now
commits the barrier first; a callback failure leaves the circle unconsumed for
retry. It then records activation, invalidates per-viewer replay and attempts the
transition animation with failure isolation. Native 52069 notices use isolated
delivery. Aurum's barrier callback likewise isolates each entrant's hide effect
and notice after recording the barrier state.

Four new manager checks exercise failed barrier commit, successful retry despite
a missing animation publication area, the unchanged authored barrier key and
one-use callback completion. The suite passes 769 checks. These tests exercise
the production activation helper; existing charging tests remain separate. They
do not establish successful native circle/field rendering or callback effects in
a live party. Charge timing, progression conditions and all homes remain unchanged.

## Authored sand arrival notice isolation

The authored route Warp method now uses per-recipient isolated delivery for
native arrival message 34270, matching the manual sand path. A successful
TryWarpToPosition therefore still returns true when this optional notice fails;
the exception cannot abort later route entries or replay work. Rejected warps
still return false before notification, allowing the route to release cooldown.
No destination, radius, cooldown, packet payload or placement changed.

Existing manager regressions exercise rejected transfers, missing destinations
and cooldown release. Shared delivery regressions inject message transport
failures. These separately support the correction; successful connected sand
transfer and native arrival rendering are not newly validated by this pass.

## Gold Lung isolates entrant status failures

The Gold Lung loop now uses the existing per-entrant delivery helper around each
player's complete environmental update. Previously an exception from a status
lookup, removal or application escaped the loop and skipped later entrants and
the remaining manager work. Membership, participation checks, pulse deadlines,
Veil magnitudes and nested notice isolation remain unchanged. A failed player's
already-admitted pulse retains its ordinary three-second retry cadence.

The manager suite passes 765 checks. The new scenario inserts an eligible entrant
with a deliberately unavailable status container before an initialized player.
It confirms the failing entrant reaches pulse admission, then verifies the next
player receives the real Gold Lung status, its 16-point damage modifier and the
next pulse deadline. This verifies failure isolation, not successful repair of a
broken status container or native client rendering. No SQL or placement changed.

## Goldbile enemy recovery survives notification failures

Goldbile's entry/exit notice previously broadcast directly before AddHP. If any
recipient threw, the manager had already advanced the healing deadline, but the
current heal and later enemies' processing were skipped. Those notices now use
the existing per-entrant isolated delivery helper, preserving message IDs and
the one-percent, three-second healing rule while excluding unrelated visitors.

Seven new production manager checks use real HP mutation, the configured Goldbile
volume and native message packet construction. The first entrant's transport
throws; the second receives both entry and exit notices. Healing still applies,
does not repeat before the deadline, repeats at the deadline, and stops with its
pending deadline removed after moving above the volume. The manager suite passes
752 checks. Fixture actors have initialized combat/status containers; this does
not claim native rendering or live shoreline acceptance. No SQL or homes changed.

Ten additional lifecycle checks pass, bringing the manager suite to 762. Pool
reentry starts a fresh deadline and heals only once when two owned dictionary
keys reference the same actor. Healing clamps to maximum HP and remains capped
on the next pulse. Dead and transferred actors neither heal nor retain recovery
membership/deadlines; an actor made live in the owned area can resume. These
checks invoke the production recovery method with controlled actor states and
timestamps, not full resurrection or zone-transfer workflows. No further runtime
change was needed for these cases.

## Loaded dungeon command geometry audit

The isolated canonical import passes 2,480 checks. All 109 command/category
bindings across the 33 dungeon definitions now check finite, nonnegative target
range, minimum target range, AoE range, minimum AoE range, height and width.
All 25 cone bindings additionally require a positive fraction-of-PI angle no
greater than two. These checks inspect the loaded commands after all SQL updates,
so later overrides cannot silently restore Coincounter's invalid angle units.

No additional invalid dimensions were found in the current dungeon kits. The
other 2.0944-angle Switch Swipe rows belong to treant lists outside these rosters
and were left unchanged in this pass. The audit checks valid input domains, not
retail dimensions, target eligibility, collision, movement or every attack's
damage boundary. The runtime error guard also passed; the disposable database
stopped successfully. Native presentation and full encounter acceptance remain open.

## Coincounter normal AI admission and swipe cone units

The isolated suite passes 1,801 checks. Eight offensive Coincounter commands now
exercise ordinary TP-move selection, startup, damage and cleanup. The connected
Animal Instinct follow-up and miss/topple recovery scenarios also begin through
normal AI admission. The fixture supplies injury, TP, targets and candidate choice;
it does not establish natural movement or encounter cadence. The Coincounter kit
has a legitimate zero-TP Animal Instinct candidate, so its scenarios do not assert
that the entire kit rejects empty TP.

This exposed three invalid main-SQL cone angles: commands 23476, 23480 and 23629
stored 2.0944 radians where the runtime expects fractions of PI and rejects values
above two. Their angles now use 0.6666682, preserving the authored approximately
120-degree width. The optional Aurum runtime migration carries the same update.
No shared geometry code, other command fields or placements changed.

The canonical SQL import and production attacks pass with no unexpected runtime
errors. Full legacy validation passes, including 745 manager and 376 route checks.
The optional migration was inspected for consistency; no live database was changed.
Native cutscene/widget rendering and full client encounter acceptance remain open.

## Miser and Chimera normal AI admission

The isolated suite passes 1,749 checks. All six Miser attacks and all six Chimera
head attacks now use TryUseMobTpMove, including readiness filtering, selection,
target resolution and normal admission, before their existing startup, damage,
mode and cleanup assertions. Zero TP rejects admission. The fixture supplies
injured bosses, resources and a controlled random choice for each candidate.

Targets stand two yalms away except Voice of the Dragon, whose target stands
3.5 yalms away inside its configured 3/8-yalm damage ring. Close-range rejection
of that move was observed during development and is consistent with its safe
inner area. A five-yalm Miser attempt also did not admit; these close-range tests
do not claim coverage of chase movement or long-range selection behavior.

All twelve commands pass without bypassing the normal decision method, and the
runtime error guard passes. No production correction was required. Natural TP
generation, random distribution, autonomous movement and full encounter cadence
still require separate evidence.

## Princess and Marshal normal AI admission

The isolated suite passes 1,713 checks. All nine Princess/Marshal actor-command
cases now enter through BattleNpcController.TryUseMobTpMove instead of forced
scripted admission. Zero TP rejects the move. With supplied TP, the ordinary
readiness filter includes each command and the normal decision path starts it.
The fixture controls the random candidate index and restores the RNG immediately
after admission; attack damage, healing, cleansing and AI cleanup still execute
through the production command path.

Formic Pheromones is selected with an opposing combat target, and the normal
controller redirects it to the caster. Its HP/status assertions still pass,
proving that self-targeting does not depend on a forced self target. No production
change was required, and the runtime error gate passes. Natural TP generation,
random selection distribution, movement/chase, cadence and player-driven full
fights remain separate requirements.

## Formic Pheromones cleanse correction

Production status integration exposed a real failure in both Formic Pheromones
IDs, 23229/23560. Their native heal finisher restores HP without setting an
offensive hit result. The archive handler's ActionLanded gate therefore returned
before cleanseSelf, leaving Poison active after a successful heal.

The archive helper now exempts its explicitly configured heals from that offensive
hit gate. Damage and status-only actions retain the existing gate; heal potency,
targeting and Esuna-removable status selection are unchanged. All four actor/move
cases (Princess and Marshal, both IDs) now apply canonical Poison and Protect,
execute the full command, and verify healing, Poison removal and Protect retention.
This corrects the shared Formic handler for other users of these same commands too.

The isolated suite passes 1,686 checks with no unexpected runtime errors. Full
legacy validation passes 745 manager and 376 route checks plus presentation/Miser
contracts. Other removable ailments, normal AI cadence and client status rendering
remain outside these particular scenarios. No SQL or placement changes were needed.

## Unexpected runtime errors now fail integration

The production integration harness now captures Error/Fatal NLog entries in a
synchronous memory target before loading dungeon data. Its final gate requires
exactly the two intentional timer rejections and six intentional achievement
points rejections, recognized by their explicit injection messages. Any other
runtime error fails the run even when HP/state assertions pass. Missing or extra
expected injections also fail, so a disconnected logger cannot silently pass.

The standalone `--error-guard-self-test` emits an unexpected synthetic Lua error
and verifies rejection. The normal isolated database run passes all 1,674 checks
and the new error gate, then stops its server. This closes the false-green risk
observed when Lua logged an exception after partial damage application; it does
not add evidence of native-client acceptance or full encounter sequencing.

## Princess and Marshal production commands

The isolated suite passes 1,674 checks. Princess's four configured commands and
Marshal's five execute through their real AI skill state and production Lua.
Trap Jaws and Marshal's Mandible Bite reduce the opposing target's HP. Both
Formic Pheromones IDs restore the injured caster's HP without changing enemy HP.
Stridulation completes without changing either actor's HP, consistent with the
saved Antling archive's non-damaging designation; that source does not specify
another effect. Completed casts leave the AI stack.

Each fixture encounter is removed from the area afterward so later AoEs cannot
hit its leftover targets. The clean rerun has only the eight intentional database
failure logs. TP, target and caster injury are supplied. This does not establish
autonomous attack selection/cadence, cleanse effectiveness, an unrecovered
Stridulation effect, normal player combat or native presentation. No production
correction was required.

## Scoped achievement retry implementation

`LegacyRaidAchievementDelivery` now receives all six AV/CC achievement awards.
It admits only IDs 1305–1310 whose categories are unlocked at the earned event,
retains unsuccessful attempts with the original Player object, and retries every
five seconds from Player.Update. Player cleanup makes a final immediate attempt.
Successful completion or an already-persisted completion removes the pending
entry; post-commit packet exceptions cannot cause points to be granted twice.
Five-coffer notices no longer claim an unlock unconditionally. The existing native
achievement packet remains tied to successful completion in Database.

The isolated suite passes 1,620 checks, including all six rejected points writes
followed by the real scheduled-retry helper, backoff, locked-category exclusion
and exact-once points. Full legacy validation passes 745 manager and 376 route
checks plus presentation and Miser contracts. Expected SQL errors remain the two
timer and six achievement rejection injections. No live database was changed.

This resolves active-player transient retries, not durable delivery across player
replacement/logout or a process crash during a continuing outage. The weak-keyed
queue intentionally does not retain retired Player objects. Full lifecycle/outage
recovery and native notification acceptance remain open; the broader goal is not
complete. The preceding transaction audit below records the pre-fix finding.

## Achievement transaction persistence and remaining retry gap

The isolated suite passes 1,608 checks after importing canonical achievement data
and only the schema for character/achievement tables. Fictional character rows
exercise all six dungeon IDs, 1305–1310, through the actual player/Database API.
Locked categories reject completion. With the category enabled, a trigger rejects
the character-points update after the achievement row has been inserted. The
transaction rolls that row back and leaves in-memory points unchanged.

After removing the trigger, an explicit retry persists completion and the five
canonical points; repeating it adds no points. Both database and player memory
match after all three achievements per dungeon. The eight expected error entries
are two timer rejections and six achievement-points rejections.

Automatic recovery is still missing: dungeon callers ignore UnlockAchievement's
false result, which conflates locked categories, prior completion and failed SQL.
These tests prove transaction safety and explicit retry, not automatic retry after
a clear, delivery to disconnected entrants or durability during a server crash.
Do not treat this gap as a placement-only task or bypass category gating to fix it.

## Sand Pillar impact-time movement and cleanup gate

The isolated suite passes 1,558 checks. Additional real casts begin with Chimera
inside or outside the footprint, then change its coordinates before completion.
Leaving horizontally or changing floor prevents damage; moving into the footprint
allows damage. Setting the instance cleanup flag after startup leaves the boss
unharmed at completion, with no fallback target damage, hate or premature clear.
The subsequent lethal scenario still reaches reward publication.

This verifies impact-time selection and the cleanup flag's effect on an active
command. Coordinates are assigned directly; no client movement packet or navigation
path is simulated. The cleanup flag is fixture-controlled, so this does not prove
the complete teardown sequence or a real concurrent cleanup race. No production
correction was required; only intentional timer rejection errors were logged.

## Sand Pillar nonlethal footprint and allegiance isolation

The isolated suite passes 1,526 checks. Before the lethal scenario, the same
production worm casts three complete Sand Pillars: Chimera is ten yalms away
horizontally, four yalms above the origin, then at the origin. The first two
leave boss HP unchanged; the third damages but does not kill it. A separately
owned scavenger standing at the origin and the worm itself retain their HP in
every case. Chimera's hate list stays empty and no nonlethal clear is queued.
Each completed cast leaves the AI stack before the next admission.

This executes the real impact-selection and Lua damage paths with empty and
nonempty scoped target sets, followed by the previously connected lethal clear.
Positions and TP are supplied by the fixture. Movement during a cast, actual
player targets, geometry boundary precision and native telegraphs remain outside
this scenario. No production change was required.

## Connected Sand Pillar lethal command and reward publication

The isolated suite passes 1,502 checks. A production tunnel worm admits command
23501 at a fixed fixture origin containing the owned Chimera. Its real AI cast
and Lua finish path reduce the one-HP boss to zero and enter the production death
state. The shared death callback queues Chimera's clear; advancing to its fallback
deadline enters the reward window and publishes exactly the earned base coffer.
No player attack or manually invoked death callback completes this scenario.

The fixture initializes the area kill-history store and an empty Darkhold manager
because the normal shared death path visits both. No production correction was
needed. The final run logs only the two intentional timer-save rejection errors
and shuts down its isolated database successfully.

TP, cast origin and boss HP are fixture inputs. This does not establish ordinary
trap scheduling, player movement/avoidance, full-health kill timing, native effects
or reward claiming in the same scenario; those remain separately covered or open.

## Multi-player reward allocation

The isolated suite passes 1,494 checks. Each dungeon receives three fictional
party members in its area: two original entrants with full Loot packages and a
non-entrant with room. The actual award routine leaves the reward pending and
persists no item to any of them. Opening space for the second original entrant
allows retry to deliver exactly once to that entrant, while the first remains
full and the non-entrant receives nothing.

The fixture discovers the eligible recipient order and controls the random start
to force the full entrant's attempt before capacity fallback. It restores the
ordinary seeded RNG afterward. SQL reload verifies each destination; a repeated
completed award leaves the global item-instance count unchanged. Separate actor
ID ranges isolate the two dungeons. No production correction was required.

This verifies the implemented random-assignment policy's eligibility and fallback,
not its retail provenance, fairness distribution, shared-lot behavior, network
disconnect races or native client presentation.

## Assigned loot claiming and party destination

The isolated suite passes 1,476 checks. For each dungeon, the actual player claim
handler rejects an overflow claim while inventory is full and retains its SQL
Loot row. After inventory capacity becomes available, the client package aliases
(Loot 5, inventory 1) successfully move the same unique item instance into normal
inventory. Foreign-source and already-consumed-slot requests are rejected.

A constructed party containing the fixture recipient switches the manager's next
reward to Loot despite free normal inventory space. Reload verifies that
destination, then a claim using backend package IDs 4/0 persists the reward in
inventory and clears Loot. The final server-item count remains exact, with no
new duplicate/orphan instances. No production correction was needed.

This covers assigned-item claims and party-mode destination selection, not a
multi-player allocation/pass/lot scenario, network packet handling or native UI.
The canonical database fixture stopped cleanly; its only logged errors were the
two deliberately rejected timer saves used by the existing recovery tests.

## Partial reward delivery and overflow retry

The isolated suite passes 1,456 checks. Each dungeon's actual award routine is
given two distinct rewards and a fictional solo recipient with one inventory
slot and no loot slots. Exactly one item persists; the coffer remains incomplete
with the other original item pending. Repeating the attempt while full neither
completes the coffer nor duplicates the first reward.

After one loot slot becomes available, retry completes the original two-item
roll even when the caller supplies a different pool and count. Database reload
confirms the pending item entered Loot, and the global item count rejects
duplicate/orphan instances after another completed retry. No production change
was required. These checks cover capacity rejection and persistent overflow
delivery, not SQL-write failure recovery, party claiming or native loot UI.

## Boss death through reward publication

The isolated suite passes 1,440 checks. All 16 objective combinations for each
dungeon now enter the real boss death state and invoke the owned death callback,
then complete the queued clear through its fallback deadline. The clear routine
derives and freezes eligibility from fixture-seeded objective flags, ordinary
coffer records and elapsed time rather than preassigned reward eligibility.

Checks verify the exact earned coffer keys, actor/director registration, private
appearance, released publication reservations, the configured 90-second reward
window, rejection of a second clear and stable actors on publication retry.
The disposable database stopped successfully. Only the two deliberate timer-save
rejection errors appeared; no production correction was needed for this pass.

These areas contain no entrants, so achievement/message delivery and native
clear presentation are not established. Objectives are seeded rather than earned
through full encounters. The test uses GM test mode to bypass the clear routine's
live-session cooldown lookup; timer persistence retains its separate SQL checks.
Client scene/widget rendering, party acceptance and floor validation remain open.

## Miser production command execution

The isolated suite passes 1,280 checks. Sour Breath, Vine Probe, Sweeping Lash,
Tendril Tremor, Bad Breath and Sweet Breath each run on a freshly constructed
Miser against a fresh opposing NPC. The real AI admits each command, its skill
state starts without interruption, completion lowers target HP, and completed
state cleanup empties the AI stack. Canonical command/status data and production
Lua handlers are used; no handler or damage-result stub is substituted.

This complements the earlier six-script effect tests. TP and a target are supplied
by the fixture; it does not establish autonomous selection, player status landing
rates, exact knockback movement, full boss sequencing or client acceptance.

## Roster-wide startup audit and Speculator spell routing

The audit now checks all 109 distinct command/category bindings for the prepare
and start hooks called by their execution path. It exposed three spells stranded
in Imperial Speculator BNPC 3141's skill list 89: Blizzard, Fire and Thunder.
The mob-skill selector rejects magic commands, and the profile had no spell list.

Scoped lists 7311 preserve the existing kit: Dark Seal/Resonance remain abilities;
Blizzard/Fire/Thunder now populate the spell list. The canonical main skill,
spell and mob-profile SQL carries the complete correction. The optional Dzemael
seed matches because Aurum and Darkhold share this profile. Other users of list
89 remain unchanged. This enables already configured commands; it does not claim
new retail evidence for that authored kit or change stats, loot or positions.

The isolated suite passes 1,256 checks. It verifies the loaded three-spell set,
successful ordinary spell selection against an opposing actor, and real
MagicState startup/completion with HP damage for each spell. All 109 startup
bindings pass. Full legacy validation also passes 745 boss and 376 route checks.
Player targets, normal encounter cadence and native rendering remain separate.

## Chimera attack startup correction and execution

Breath of the Dragon, Breath of the Ram and Voice of the Dragon are canonical
weapon-skill commands, but their specific Lua scripts only exposed ability
prepare/start hooks. Added weapon-skill aliases while retaining those original
hooks; damage/status handlers and SQL geometry are unchanged.

The isolated suite now imports canonical status-effect data and passes 1,247
checks. All six Chimera head attacks enter the actual AI skill state without
startup interruption, set the expected head mode, complete with target HP loss
and leave the AI state stack. Each scenario registers its owned boss with the
real manager and uses an opposing NPC target with supplied TP. Only the two
intentional timer-save rejection errors appear in the run log. The full legacy
suite also passes 745 boss and 376 route checks plus presentation/Miser contracts.

This proves execution for these targets and seeds, not status landing rates,
all geometric boundaries, ordinary player aggro, client head colors or full
fight acceptance. No live service, SQL data or placement was changed.

## Chimera four-part transition integration

The isolated suite passes 1,211 checks. A canonical, fully constructed Chimera is
registered with its manager; eligible player damage notifications are applied to
Lion, Ram, Dragon and Legs. For each part, `FlushPendingTransitions` publishes
partial damage then a threshold break. Assertions inspect the actor's actual
part-HP array, breakage bits, action suppression and all six head-skill gates.
Legs suppress every head skill, while each head suppresses only its own pair.

Recovery collection is empty immediately before each deadline and yields one
transition at the deadline. Applying it restores part HP, clears broken/pending
state and suppression, and preserves an unrelated breakage bit. All queued damage
transitions are consumed. This verifies the manager-to-actor publication path;
damage notifications are supplied by the fixture, so player weapon-skill execution,
client part bars/effects, physical positioning and full fight acceptance remain open.

## Connected topple recovery and ability-dispatch audit

The isolated suite passes 1,154 checks. After the Animal Instinct sequence, the
owned Coincounter executes command 23482 through its real skill state. Its
completion callback enters the topple state and suppresses actions; a tick before
the recorded deadline retains the topple, and the deadline tick clears it and
releases suppression through the existing WSS8 recovery publication path.
This connects command completion to recovery instead of manually seeding flags.

Across all 33 dungeon definitions, six distinct commands are typed as abilities:
Animal Instinct, Flash, Dark Seal, Resonance, Raging Strike and Light Shot. All
resolve to dedicated Lua files and expose `onAbilityPrepare`/`onAbilityStart` as
well as the already-checked finish handler. No further generic-ability handler
mismatch was found in this roster. This checks dispatch availability, not full
effect execution for each of those six abilities or native client rendering.

## Animal Instinct execution and combat continuity correction

The real completion test exposed that command 23484 is an ability: its generic
ability finish handler never executed the `monster_tp.lua` enmity-reset entry.
A dedicated `ability/animal_instinct.lua` now emits a non-damaging action and
resets threat on successful execution. `ResetEnmityKeepingCombatants` clears both
threat values and positive/claim ordering while preserving active participants
and their existing tie order. The archive fallback uses the same operation.
Ordinary `ClearHate` remains unchanged. Preserving zero-threat membership avoids
the shared controller treating the wipe as disengagement before the follow-up;
the exact retail tie selection remains unrecovered.

The isolated SQL suite passes 1,143 checks. It seeds positive cumulative and
volatile threat, executes Animal Instinct through its real ability state, checks
the reset and `TryDeaggro` rejection, observes the manager's completion callback,
and executes the queued Eye/Swing at its deadline through HP damage. This is a
connected command sequence using opposing NPC fixtures, not a full player fight.
The complete legacy suite also passes 745 boss and 376 route checks, including
the native scene/widget contracts and Miser Lua scenarios. Native rendering and
normal-party acceptance remain open; no live service or data was changed.
Shared end-of-patch combat/weapon-draw, aggro semantics, detection range and the
244-check dungeon aggro suite also pass on the rebuilt assembly.

## Coincounter follow-up damage and cleanup

The isolated suite passes 1,133 checks. The Eye/Swing scenarios now advance each
real `MobSkillState` beyond its cast duration, require completion without an
interrupt, verify target HP decreases, and invoke `CheckCompletedStates` to
verify the completed attack leaves the AI stack. Full production Lua registration
supplies the finish-handler argument types and signal engine. The run contains
no unexpected logged exceptions; its two timer-save errors are injected tests.

Targets remain initialized NPCs with opposing allegiance, and TP is supplied by
the fixture. This does not establish ordinary player aggro, TP generation,
continuous encounter sequencing, live hit presentation or native animations.

## Coincounter recovery and follow-up admission

The isolated production suite passes 1,125 checks. A fully constructed Coincounter
stays suppressed before its topple deadline, recovers at the deadline, clears the
deadline and only the topple mode bit, and completes its area broadcast/action
publication without throwing. A later update leaves recovery complete.

Both queued follow-ups (23478 Eye of the Beholder and 23481 100-tonze Swing) enter
the real AI `MobSkillState` with their canonical SQL/Lua commands and no startup
interrupt, then clear the pending follow-up. The fixture supplies 3,000 TP and
an opposing, fully initialized NPC target. It registers the Lua argument types
normally supplied at server startup. This proves successful command admission,
not normal player targeting, TP generation, damage completion or live animation.

## Production retry-timer database checks

The isolated suite passes 1,112 checks. Each manager's `ApplyPlayerRetryTimer`
persists a five-minute absolute deadline through the real player setter and
database routine. SQL readback confirms the deadline and an unrelated content
timer. An existing longer deadline is preserved in memory and SQL. A temporary
scratch-server trigger rejects an update; the setter retains its in-memory value,
and a subsequent `SavePlayerTimers` call persists that exact original value after
the trigger is removed. No live database or saved character rows are involved.

This exercises the save routine used by cleanup, not full logout/login. It does
not establish crash durability while all writes fail, or add automatic retry to
the setter. Those limitations from the earlier source trace remain open.

## Production coffer inventory persistence

The isolated database suite now passes 1,097 checks. All 28 Aurum and 27 Cutter
distinct pool items are awarded through each production manager to fictional solo
recipients. Each write is reloaded through `Database.GetItemPackage` and checked
for quantity, quality and, where applicable, original equipment durability.
Repeating the completed award preserves the inventory and creates no additional
server-item rows. Only canonical inventory table definitions were imported; no
saved player data was copied. The disposable server stopped cleanly.

This proves successful solo writes/reloads and same-instance retry protection.
It does not prove SQL failure recovery, party claim resolution, full encounters
or native rendering. Cutscene/widget acceptance remains pending a client run.

## Production coffer item catalog loading

The isolated fixture imports all eight canonical item-data tables and executes
`Database.GetItemGamedata`. Its count must equal the SQL catalog count, preventing
the loader's catch-and-return behavior from disguising a partial import. Every
distinct item in both managers' ordinary pools and completion normal/rare pools
resolves to a loaded named item with positive stack capacity. The suite passes
818 checks, retaining its real actor, command-list, wave and coffer coverage.

The delivery source trace is `AwardCofferItems` → `AddGeneratedLootItem` →
`AddLootReward` → `AddGeneratedItemToPackage`; persistence also requires the
inventory and equipment-instance tables. Those writes and reload are not proven
by catalog availability. No player data was imported and the disposable database
stopped cleanly after this run.

## Real reward coffer construction and publication

The isolated integration suite passes 707 checks. All 16 combinations of the
four conditional rewards are exercised for each dungeon in separate fixture
areas, with the mandatory boss coffer always included. The production managers
construct the coffers using canonical actor/appearance data. Assertions compare
the exact earned reward keys, actor and director membership, nonzero model,
released publication reservations and actor identity across a second call.
Repeated publication reuses the existing coffers without duplicate membership.

This closes the full constructor/publication/retry path for completion coffers
under supplied eligibility flags. It does not by itself prove those flags were
earned during a complete run, ordinary route-coffer construction, inventory
delivery/persistence or native chest rendering. The database was disposable and
shut down cleanly; the live server and database were not touched.

## Production skill and spell loading

The disposable database fixture now also imports the complete main battle-command,
BNPC skill-list and spell-list SQL. Production `LoadBattleCommands`,
`LoadBattleNpcSkillLists` and `LoadBattleNpcSpellLists` populate the world before
the real spawn tests. All 33 definitions retain exactly the configured command
IDs from SQL; every nonzero list has rows, and every attached command exposes a
Lua `onSkillFinish` function. Checking merely for a nonnull script was insufficient
because the production loader retains that object even after a script-load error.

The isolated integration run passes 515 checks, including the prior successful
wave tests. This closes command-list attachment and finish-handler availability,
not command admission, targeting, damage, status execution or client animation.
The disposable server stopped cleanly and live data remained untouched.

## Successful Princess and Chimera wave publication

The isolated production spawn harness now passes 317 checks. Its twenty new
checks execute Princess's initial ten-soldier wave, the 30-second boundary, and
the 60-second third wave plus one Marshal and guard. Successful Marshal admission
clears its pending flag; the following update creates no duplicate actors.

Chimera's three configured thresholds each publish nine actual scavengers and
retire their pending slot ledgers. One actual hidden tunnel-worm actor is retained
throughout. Healing to full and descending again does not recreate completed
waves. Both encounter groups have unique actor IDs and all tracked actors are
present in the area's actor table. These are database-backed constructor and
manager-update checks, not simulated spawn callbacks. Skill execution, party
aggro, live publication and physical homes remain separate requirements. The
disposable database shut down cleanly after the run.

## Production constructor and spawn publication integration

The new `tools/legacy-spawn-tests` harness passes 297 checks across all 33 manager
mob definitions using the verified disposable MySQL server. It runs production
actor-class/profile loading, both managers' `SpawnMobAt`, the actual NPC and
BattleNpc constructors, appearance queries, stat initialization, configured spawn
path and area publication. Every returned actor is registered in the area and
tracked by its manager, with positive HP and an AI container. Loaded base model,
size, body and head match the canonical SQL row, including zero-size ant variants.

This closes the constructor/database-appearance/publication gap for individual
mob definitions. The fixture has no clients, uses an isolated minimal area grid,
and leaves unrelated gamedata caches empty. It does not establish full skill-list
loading, successful wave orchestration, live actor visibility or full fights.
Build/run instructions are in `tools/legacy-spawn-tests/README.md`. The isolated
server stopped cleanly; no live configuration, services or data were changed.

## Canonical database imports and dungeon appearance joins

`tools/validate_legacy_raid_database.ps1` successfully imports the full main actor
class, appearance, push-command, mob-type, guildleve mob-type and consolidated
loot SQL into the disposable server. The guildleve table is required by the
consolidated loot SQL; no failing statements are skipped. The canonical files
retain their schema declarations inside this separate server.

All 33 distinct manager mob definitions resolve their requested BNPC profile,
actor class and nonzero base-model appearance. Actor IDs are read from the
manager definitions, including named constants and the deliberate slug-family
profile reuse. Soldier, Drone and Scavenger retain canonical appearance size 0;
the fixture does not invent a positive-size constraint absent from the loader.
The server stopped cleanly after validation. This proves canonical SQL import
and required join availability, not constructor execution, AI attachment,
area publication or client visuals. Those remain the next integration layer.

## Isolated database fixture available

The Wamp installation contains MySQL 8.4.7 and MariaDB 11.4.9 binaries outside
PATH. `tools/legacy-raid-db-sandbox.ps1` now initializes a new GUID-scoped data
directory under `.codex-build/legacy-raid-db`, starts only its own hidden child
process on a selected loopback port with `--no-defaults`, and verifies `@@datadir`
before creating `legacy_raid_test`. It disables MySQL X, named pipes and shared
memory. Its `finally` shuts down the verified server or terminates only the
captured child; diagnostic files remain available. No live configuration or
database credentials are read, and no installed service is stopped or changed.

The smoke run passed and stopped cleanly. A test script block can receive the
client executable, explicit isolated client arguments, port and sandbox path;
it must throw on failed assertions or nonzero native command exit codes. The
default run proves isolation, startup, schema creation and shutdown only.
Canonical appearance imports and the production spawn integration harness are
still required before claiming successful dungeon actor construction.

## Successful spawn integration: database boundary

The successful production path is `CuttersCryManager.SpawnMobAt` →
`Area.SpawnConfiguredEnemyWithMobType` → `SpawnEnemyWithMobTypeCore` →
`new BattleNpc` → the `Npc` constructor → `LoadNpcAppearance` /
`TryLoadNpcAppearance`. That last method opens MySQL using the configured database
settings. Supplying in-memory mob-type and actor-class dictionaries alone does
not make successful spawn construction an offline test. An unavailable database
or a swallowed appearance-load failure would not prove correct actor appearance.

The existing Fishing test harness constructs real actors, but its setup is not a
drop-in isolated fixture: it constructs `WorldManager`, whose constructor calls
`RestorePersistedFerryPassengers`, and NPC construction still follows the database
appearance path. The current shell resolves none of `mysql`, `mysqld`, `mariadbd`
or `docker` on PATH; this does not establish that no installation exists elsewhere.
No database connection or service start was attempted during this trace.

Full successful add-publication proof therefore needs a deliberately isolated
database populated from the canonical SQL, or a reviewed data-loading seam that
retains the production appearance behavior. Do not count bare actors registered
through `CompleteSpawnedMob`, missing-service retry tests, or successful area-table
insertion as proof of this full path. Continue independent offline mechanics work
while this integration fixture remains open; the user's offline-only preference
does not authorize silently using the live database.

## Delayed manual-circle animation ownership

The delayed active animation now captures its instance, circle and actor, then
revalidates them on the area work queue. Finishing/cleanup, disarmed or removed
circles, actor replacement, departure and loss of exact actor-table ownership
cancel playback. The original 650-ms delay and animation selection are unchanged.

The five charge-continuity scenarios each exercise seven stale callback states
and one valid callback that reaches animation dispatch. Full validation passes
with 745 boss/runtime checks, 376 route checks and scene/widget and Miser Lua
contracts. The positive callback deliberately reaches an unavailable broadcast
grid; it proves admission, not successful native playback. This closes the
delayed-animation lifetime review noted below without claiming live rendering
or durable presentation retries.

## Manual circle presentation failure isolation

The Aurum manager's manually placed charged circles now isolate their transition
animation and delayed-animation scheduling from barrier presentation. Barrier
hide, native notice and diagnostic notice are independently delivered to original
entrants. Previously a failed animation skipped all barrier work after committing
the opened state, and a failed player delivery skipped later entrants.

The five existing continuity scenarios now require activation to return normally
despite a missing animation broadcast grid, and five new assertions observe the
subsequent entrant notice reaching packet transport. Full validation passes with
705 boss/runtime checks, 376 route checks and native scene/widget and Miser Lua
contracts. This covers failure continuation for manually authored circles, not
successful native barrier rendering, durable packet retry, or the separate
route-control presentation path. Delayed-animation lifetime remains a separate
review item.

## Gold Lung entry and exit notification isolation

Gas entry/exit notices now use isolated entrant delivery. A failed entry notice
previously prevented the same update from applying Gold Lung; either notice
could also stop processing later players. Occupancy and pulse state now proceed
independently of message transport. Three production checks exercise first entry
with unavailable notice transport, exit with no new pulse, and rapid reentry
without bypassing the existing cooldown. Full validation passes with 700
boss/runtime checks, 376 route checks and scene/widget and Miser Lua contracts.
This verifies authored gas-trigger behavior; it does not validate the physical
gas boundaries or native notice rendering.

## Sand resource effects and message failure isolation

Cutter's HP/MP sand notices and the successful-warp notice now use isolated
entrant delivery. A failed notification after an applied effect no longer exits
the player-processing loop. Resource mutation, transfer admission and cooldown
handling retain their existing ordering and values.

Eight production-manager checks execute actual HP/MP loss, confirm the configured
400–1700 HP and 1000–1600 MP ranges, reject repeat damage just before four seconds,
and permit it at the inclusive cooldown boundary with unavailable notice transport.
Full validation passes with 697 boss/runtime checks, 376 route checks, and native
scene/widget and Miser Lua contracts. These checks do not establish lethal-sand
death dispatch, live resource display, successful client transfer, or retail
accuracy of the authored tuning. The static validator follows the isolated warp
notice call.

## Princess-first surviving-add ownership

Six additional production-manager checks register Princess, Marshal and a soldier
through `CompleteSpawnedMob`, then invoke the death handler after marking Princess
dead. The Marshal remains alive in the same area and both adds remain tracked;
the defeated Princess cannot admit more summons. A different Marshal actor cannot
record credit, while the owned Marshal's subsequent death records the objective
without setting the final-clear flags. This covers manager ownership and death
ordering, not full combat death dispatch, spawn publication or live achievement
delivery. The user requested continued offline work; client rendering remains
pending rather than inferred from these checks.

## Chimera trap spawn failure isolation

`UpdateChimera` now catches a failed hidden tunnel-worm spawn locally. Previously
that exception skipped every earned scavenger wave for the update; repeated trap
failure could indefinitely prevent those independent waves. Trap ownership is
still recorded by the existing publication path, and a missing trap remains due
for retry. No trap coordinates, command timing or wave thresholds changed.

Seven production-manager checks force missing spawn services on two successive
updates below all three scavenger thresholds. Each update attempts the trap and
all 27 scavenger slots, retains the three pending waves without marking them
complete, and preserves the 250-ms cast-admission retry while the trap is absent.
Full validation passes: 683 boss/runtime checks, 376 route checks and native Lua
scene/widget and Miser contracts. Successful full-wave publication and live
encounter acceptance remain separate requirements.

## Protection expiry and combined environmental damage

Sixteen further production checks bring the boss/runtime suite to 676 passing
checks. The status-container update expires both Veil variants; the next Gold
Lung pulse restores the unprotected modifier and HP loss. Goldbile application
and refresh run through `EnvironmentalHazardManager`, the real status container,
stat recalculation and production Lua. Existing Goldbile is refreshed by actual
fruit/root consumption. Both hazards together produce the configured combined
damage of 36 unprotected, 7 with fruit and 23 with root after integer conversion.
Root expiry restores both modifiers on refresh, and expiration of both hazard
statuses removes their damage modifiers completely.

This fixture supplies an empty broadcast grid and suppressed packet transport;
it does not prove client visuals. It invokes the Goldbile application/refresh
path directly, so poison-volume geometry and contact-delay/pulse admission remain
separate verification requirements. No live server or database was changed.

## Actual Aurum protection application and periodic damage

The production boss harness now executes fruit → root → fruit through
`ConsumeProtection`, the real status container, stat recalculation and the
production status Lua scripts. Twenty-one additional checks verify successful
application, mutually exclusive Veil/Veil II, durations of 315/165 seconds,
Gold Lung magnitude changes, replacement of the `RegenDown` modifier without
stacking, and actual periodic HP loss (10/3 after integer conversion).

The boss/runtime suite passes 660 checks. This extends the earlier continuation-
only tests below; the fixture supplies base HP and movement state so successful
stat recalculation is required. World-message transport remains deliberately
unavailable and isolated. This does not prove Goldbile contact refresh, expiration,
live client status icons, floor placement or native cutscene/widget rendering.

## Retry-timer persistence source trace

The current managers use `Player.SetContentTimer` after comparing the existing
absolute deadline. That setter updates the in-memory timer first, then calls
`Database.SavePlayerTimers`. The database routine upserts all timer columns and
logs save failures, but returns no success status. Calling the setter again with
the same value does not retry the write.

`Player.CleanupAndSave` calls `Database.SavePlayerTimers` again. Therefore an
initial write failure is not necessarily permanent: ordinary player cleanup
provides another write attempt using the in-memory deadline. This is source
evidence, not an executed database outage/reconnect test. If both writes fail or
the process stops before a successful save, the inspected path provides no
durable pending-write record. The separate boolean-returning
`Database.SetCharacterContentTimer` exists, but these managers do not use it.

Remaining persistence proof must distinguish: successful first save and reload;
failed first save followed by successful cleanup and reload; and both saves
failing across session/process loss. Retrying must preserve the original absolute
deadline, never extend the cooldown on every retry. A database-only retry must
also respect later in-memory timer changes rather than overwriting a newer
deadline with an old queued value. No database writes, server restart or new
retry mechanism were performed in this source audit.

Goal: implement and verify fights, chest data, and progression so that physical
placement acceptance is the remaining task. Completion is not yet proven.

## Evidence inspected

- `AurumValeManager.cs`, `CuttersCryManager.cs`, `LegacyRaidRuntime.cs`,
  `LegacyRaidRoute.cs`, both implementation guides, and the populated-route guide.
- The current route suite links production route/progression and coffer-roll code.
  It does **not** execute the boss managers or the runtime's player/actor integration.
- Latest combined validator: 745 production manager checks, 376 route checks,
  static validation, native scene/widget and Miser Lua checks passed.
- Live acceptance is tracked by
  [the client checklist](legacy_raid_client_verification_2026-09-18.md). No live
  passes are recorded for this implementation pass. The checklist separates
  solo smoke tests, normal-party acceptance, persistence, and floor placement.

## Requirement status

| Requirement | Current evidence | Remaining proof/work |
| --- | --- | --- |
| Route dependencies and six ordinary chests per dungeon | Production progression tests pass | Live physical reachability and interaction |
| Stable chest rolls and partial delivery | Isolated SQL verifies all 55 reward-item writes/reloads and durability, full-pack/partial retries, original-roll preservation, multi-player entrant filtering and capacity fallback, assigned Loot claims with both package conventions, and death-to-reward publication for all 16 objective combinations per dungeon | SQL item-write failure recovery, transport-loss races, passing/shared lots and earning every reward condition through full encounters |
| Aurum terminals | Fixed stale holds surviving unavailable players; continuous hold, reset, clock reversal and update-gap tests pass | Runtime occupancy and native barrier/circle acceptance |
| Coincounter, Miser | Actual Animal Instinct resets threat while preserving combat, queues a damaging follow-up, and reaches timed topple recovery; both offensive follow-ups and all six Miser commands execute through real startup, damage and AI cleanup; effect-specific Lua tests also pass | Full encounter sequencing, normal player aggro/TP economy, displacement execution, status rates and native presentation |
| Princess/Marshal | Timing, failed-summon retry, objective snapshot and partial-wave ledgers pass; isolated SQL constructs and publishes all three soldier waves plus Guard/Marshal | Full fights with player AI/aggro and live reward acceptance |
| Chimera | Actual four-part damage/transition publication, suppression and recovery pass; all six head attacks execute with mode changes and damage; all 27 scavengers and the hidden worm construct successfully without repeated summons after healing; lethal Sand Pillar reaches base coffer publication | Full fights, normal AI/TP cadence, actual player part-damage commands, network transition delivery and native acceptance |
| Hazards, protection, travel | Sand Pillar startup, impact selection, damage and trap hate suppression checked; isolated command execution now connects real Lua damage to lethal death, clear fallback and base reward publication; authored policies documented | Reward delivery in the same trap-kill scenario, resource updates, repeated contacts, interrupted transfers and live acceptance remain |
| Entry, wipe, expiry, reconnect, withdrawal | Integration checks pass; withdrawal callback confirmed in completed-transfer path | Production lifecycle scenarios and live acceptance |
| Presentation | Native bindings plus substitute fruit/root visuals documented | Resolve substitute visuals and verify stock-client rendering; not solely a Y-placement issue |
| Floor placement | 92 Aurum and 54 Cutter entries explicitly unresolved | User ground captures/nav data and floor acceptance |

## Corrections in this audit

Terminal holds now reset when no eligible players remain or occupancy falls below
the requirement. Unavailable controls reset as well. A backward clock or a gap over
two seconds restarts the hold; that continuity guard is authored server policy.
The 1.5-second completion duration remains unchanged. No route XYZ or SQL changed.

The Cutter withdrawal validator now accepts the actual null-safe manager call.
Its callback is still invoked after the content exit transfer completes.

Next work: extend production encounter coverage rather than treating static
source tokens or the route tests as proof that the boss managers work end to end.

## Summon retry correction

The Princess soldier and Chimera scavenger handlers previously accepted any
positive spawn count as a completed wave. A partial publication permanently lost
the remaining adds. Both now retain a production `RaidSpawnWave` slot ledger;
retries attempt only failed slots with the original wave's angular slot geometry.
Successful slots remain consumed even if those adds die before a retry. Princess
capacity checks account for only the unfilled slots. Chimera keeps admitted waves
pending independently of subsequent healing across their HP thresholds (the
existing full-health encounter pause is unchanged). Boss replacement clears the
pending ledgers, and existing dead-boss guards prevent further publication.

The behavioral suite exercises every possible single-slot failure in both wave
sizes, repeated failures, eventual completion, no replay after completion, and a
throwing spawn callback after an earlier success. This verifies the production
ledger; full manager/combat integration remains an open requirement above.

## Cutscenes and widget contract

Cutscenes and the native dungeon timer/widget are explicit completion requirements.
Both managers now send `startEvent` with their environment panorama (`rad0r400`
or `rad0w500`) after publishing the director; reconnect sends `reloginEvent` with
the original start/deadline and clear state. The entry association is reconstructed
from scene contents, not recovered retail server dispatch.

The presentation regression now executes the production server Lua facade and
the recovered client start/relogin/clear/failure/scene/widget functions for content
6 and 7. It verifies setup before dispatch, the original deadline, reconnect
without a scene, no reopened widget after a cleared reconnect, closure on clear
and failure, and widget opening after the manager-selected scene. Engine calls are mocked;
the unrelated malformed packet-handler decompilation is excluded, and the
countdown-warning status query is stubbed. This is not a packet-delivery, native
rendering, countdown-warning, or manager session-lifecycle test.

The existing client audit `docs/content_systems_decomp_audit_2026-06-12.md`
identifies Aurum replay assets `rad0r400..403` and Cutter `rad0w500..503` but
explicitly leaves live server scene selection/conditions unrecovered. The new
`tools/inspect_legacy_raid_scenes.py build|check` pins all eight native assets in
`Data/raidroutes/legacy_raid_scene_review.json`. Environment-only panoramas are
distinct from the boss casts and final victory/Tool scenes. Repeated actor labels
in Aurum's panorama remain separate offset-addressed records. Entry delivery/session retries and live
rendering remain unverified. Scene staging does not change combat populations.
The route/loot suite now passes 376 checks plus these presentation scenarios.

## Production boss-manager coverage and ownership correction

`tools/validate_legacy_bosses.ps1` builds a separate output and executes the actual
Cutter manager using isolated in-memory actors/instance state. The pre-fix run
produced 15 failures: an untracked same-class Chimera inherited broken-part skill
suppression and its death queued a dungeon clear. Damage, skill-start and death
hooks now require the exact tracked Chimera; Princess and Marshal death objectives
likewise require their tracked actors. Route death recording retains its own
membership checks. No class IDs, skill assignments, damage thresholds or SQL change.

Coverage includes four-part initialization, all assigned weapon-skill/direction
combinations, head versus leg suppression, foreign-actor rejection, recovery
deadline/admission deduplication, and owned/duplicate Chimera death queueing.
The fixture executes manager methods rather than copying their rules. It does not
execute recovery packet delivery, the final inventory/achievement pipeline, a full
fight, or client rendering; those remain outstanding.

The same production harness then reproduced Aurum's duplicate-Miser clear bug
(two failing assertions). Aurum death/skill hooks now require the tracked Miser,
Coincounter or Primus instead of accepting actor-class lookalikes. Tests cover
foreign death rejection, retained owned/duplicate Miser clear behavior, and foreign
Coincounter topple/followup rejection. Chimera coverage now also executes actual
damage accumulation, wrong-facing rejection, threshold crossing/capping, ignored
hits after break, and resulting head-skill suppression. The logger is initialized
in the fixture; damage and pending-transition code is the production manager.

## Recovery failure and stale actor isolation

Production recovery tests exposed three failures: a stale actor's transition
reached publication and consumed the current part state, and a throwing leg
recovery publication left `encounterActionSuppressed` true after clearing Broken.
Recovery admission and presentation now require the tracked Chimera and reject
cleanup. Head-mode presentation has the same ownership guard. Leg recovery clears
action suppression with the gameplay state commit, before packet/action delivery,
so a publication exception cannot permanently freeze a recovered boss.

The fixture deliberately omits area broadcast infrastructure to exercise a real
publication exception after recovery state mutation. This validates gameplay
consistency, not successful packet delivery or per-viewer visual retry. Those
presentation requirements remain open. The current production boss suite passes
172 checks, alongside the route/loot and presentation-contract suites.

## Consumed reward publication

Aurum's once-per-second reward retry could find an opened coffer's animation actor
gone, remove its published marker and spawn another physical chest. Existing claim
and roll ledgers blocked another item payout, but the duplicate chest was misleading.
Both managers now reject opened reward keys before looking up or publishing actors,
while preserving the published history used by the five-coffer achievement.
The production harness exercises all ten reward definitions through this early
return, preserving history and taking no publication reservation.

## Real item-delivery integration

Both managers' `AwardCofferItems` now run through the actual
`Player.AddGeneratedLootItem` and `ItemPackage.AddItem` in the production harness.
Two full packages reject delivery; freeing one inventory stack permits only one
of two rolled rewards; freeing the second stack completes the original roll even
if the caller passes different candidates/count on retry. Repeated completion
does not deliver again. Full normal inventory also correctly falls back to Loot
when its existing stack has space.

The fixture uses temporary packages with existing stacks, so no database writes
or new item allocation occur. Outgoing session packets are suppressed. This proves
the manager/delivery/ledger interaction for stack rewards, not equipment instance
creation, database persistence, multi-player allocation or rendered loot UI.
The production suite passes 220 checks.

## Reward capture boundary

Cutter's explicit objective-recording hook previously accepted updates while a
Chimera clear was pending or the run was finishing, unlike its regular-coffer
hook and Aurum's objective hook. It now rejects both phases as well as an already
captured snapshot. Production tests reproduce both former failures and preserve
pre-clear admission for both dungeons. This correction concerns the explicit
objective/GM bridge; it does not change route kill ordering.

Cutter's production capture helper is also tested immediately below, exactly at,
and immediately above 25 minutes, with five and six regular coffers. Repeated
capture after objective/count/time changes retains the original speed, objective
and regular-coffer eligibility. This preserves the configured strict speed rule;
it is not new evidence of retail timing. Current production suite: 258 checks.

## Victory scene delivery

Aurum `rad0r403` and Cutter `rad0w503` are now dispatched after earned clear using
the existing `DzemaelGateScene` invitation mechanism with explicit zone 245/246.
The original constructor and zone-231 default remain unchanged for Darkhold.
The audience is captured once on the first post-clear update: eligible living,
non-zoning current players only. Dead/zoning entrants and later arrivals do not
receive a new capture. This viewing policy is reconstructed, not recovered retail.

Requests retain player/session/actor-table generation and director ownership,
defer while another event is busy, consume once on the incoming notice event,
and invalidate on cleanup or the existing reward deadline. Scene names come from
the manager claim, never client parameters. The native `cutSceneEvent` runs under
generation-bound combat protection; Lua failure releases protection and the event.
Clear/rewards remain independent of viewing, and victory never reopens the duty
widget or extends the exit deadline. No placements or loot tables changed.

Presentation tests execute the recovered client function with both scene keys,
reject foreign event names/replay claims, ignore forged scene parameters, retain
the closed widget, and exercise native-call failure cleanup. Native rendering,
exact viewing policy, and whole-client packet ordering still require acceptance.

## Boss introduction delivery

`LegacyRaidBossScenes` connects Coincounter/Miser to `rad0r401/402` and
Princess/Chimera to `rad0w501/502`, using the audited native casts. Each waits for
the tracked live boss and a player whose client knows that actor, then captures
eligible viewers through the existing session/generation-bound invitation lane.
Boss and victory invitations share slots, so two queued scenes cannot claim the
same viewer concurrently. Director ownership and one-use claims still select the
scene on the server; client scene strings are ignored.

The viewing policy is authored: a first-visible, unengaged boss may introduce
itself once; engagement, boss replacement/death, pending clear, finishing, expiry
or cleanup cancels undelivered requests without rearming on a combat reset. Scenes
do not spawn monsters, change homes, reset hate or control fight progression.
Native `cutSceneEvent` retains the existing widget and duty deadline; combat
protection is scoped to playback and released on Lua/native-call failure.

Production tests cover missing bosses, audited role mappings, uninvited claims,
combat cancellation/no replay and replacement invalidation in both zones. Lua tests
exercise all four native scene keys and reject replay/forged scene parameters.
Actual visibility-to-invitation timing, whole-party viewing and rendering remain
client acceptance work; this is not evidence that the viewing policy matches retail.

## Opening protection and combined validation

The newly connected Aurum/Cutter opening scenes now hold generation-bound combat
protection through the blocking native `startEvent`. Success releases it; a native
failure releases protection and ends the event before surfacing the error. The
scope is the exact content-6/rad0r400 and content-7/rad0w500 pairs. Other start
calls retain their existing unprotected path, and all native trailing arguments,
including nil slots, are preserved. Tests assert protection during scene creation
and cleanup after both successful and failing playback.

`tools/validate_legacy_raids.ps1` now runs the production manager suite as part of
its normal build path via `validate_legacy_bosses.ps1`. That project also builds
the server into isolated `.codex-build` output instead of replacing standard
server binaries. `-SkipBuild` continues to run only static/Lua and route checks;
it must not be described as executing production manager coverage.

## Coincounter recovery and Princess deadline

The production tests reproduced Coincounter's equivalent recovery failure: the
topple flag cleared before packet publication, but action suppression was released
only afterward. Suppression now clears with the gameplay recovery commit, so a
publication exception cannot leave a recovered Coincounter unable to act. The
same deadline and native recovery action remain unchanged; visual retry is separate.

Princess's full-health early return also postponed the first 60-second Marshal
check. If she healed to full at that deadline and dropped below 80% later, the old
code could qualify her then. Full health now still closes an already-started
Marshal window when due, while continuing to pause summon execution. Tests cover
59/60/61 seconds at 79/80/100% HP and a later descent to 50%, preserving the
configured strict-below-80% and one-check rules. These five pre-fix failures are
covered by the 307-check production suite.

## Marshal spawn exception retry

A production test with an absent spawn service reproduced the Marshal's in-flight
flag remaining set after an exception. The next update then skipped the summon
forever. A `finally` now releases that flag, preserving earned eligibility and any
successful owned-Marshal registration performed before later publication work.
Two successive failing updates exercise actual `UpdatePrincess`/spawn admission
and prove retry remains possible without marking the Marshal spawned. This is a
pre-creation failure test; recovery from a partially published actor remains a
separate integration concern. Current manager suite: 313 checks.

## Hazard and interaction participation

`LegacyRaidRuntime.CanParticipate` now gates route circles, sand/resource hazards,
coffer/fruit/root/portal interactions, Aurum's manually registered circles and
Gold Lung applications, and Cutter's manually registered sand triggers. Players
must be in the same area with a session, alive, not transferring, and outside
protected cutscene playback. Existing participant-ID and client-readiness checks
remain in place. Unavailable players no longer charge controls or take new direct
sand/resource effects while viewing the newly connected scenes.

The production helper tests exercise disconnected, local, transferring, protected,
expired-protection, dead and foreign-area states. Existing Gold Lung status ticks
are a separate status-system concern: this change pauses new applications/refreshes
and does not claim to remove or suspend previously applied status effects.
Warp completion/failure and actual player-resource packets remain integration work.

The follow-up trace confirms `effects/gold_lung.lua` adds `RegenDown` until
`onLose`; `StatusEffectContainer.RegenTick` applies that combined modifier through
`DelHP` without consulting combat-cutscene protection. Previously applied Gold
Lung could therefore still tick during a protected scene. The periodic-damage
correction below closes this gap independently of the participation guard above.
The initial trace also found that `WorldManager.WarpToPosition` returned void and
could return before relocation when session/batch admission or actor reindexing
failed. Route sand cooldowns were set before that call, so a refused transfer
consumed the four-second retry interval. The rejection correction below addresses
that finding. Offline presentation tests alone do not prove client transfer or
damage protection.

## Protected-scene periodic damage

`StatusEffectContainer.RegenTick` now skips the damaging branch for players with
active combat-cutscene protection. This applies to the combined periodic damage
modifier, including Gold Lung and Goldbile, rather than deleting their statuses.
Regeneration and the surrounding status-expiration update remain unchanged;
missed damage is not queued for later. This shared protection also leaves
Stoneskin untouched during the skipped tick. It is server protection policy,
not a recovered retail damage-timing rule or live scene acceptance.

Six production-path regressions check actual HP and combat results before,
during and after protection, with regeneration and a Stoneskin balance. The
manager suite now passes 326 checks. Route/presentation validation (376 route
checks), shared combat, TP-loss, detection-range and aggro semantics checks pass.
The isolated server build has no warnings/errors; the shared contract harness
retains three existing obsolete-serialization warnings.
The freshly rebuilt Darkhold encounter harness also passes all 2,346 production
checks after this shared status-path change.

## Rejected sand transfers

`WorldManager.TryWarpToPosition` exposes the existing same-area transfer's early
rejections as `false`; its old void entry point remains a compatibility wrapper.
Route sand triggers and manually registered Cutter sand triggers release their
cooldown on that explicit rejection. Missing manual anchors also release the
cooldown. Sand success text is sent only after the transfer method completes.
The route portal path uses the same result-aware method and remains reusable.

The cooldown is still reserved before attempting a move. Exceptions retain that
reservation because they may follow an already-applied relocation; they are not
treated as proof that retrying is safe. A true result describes completion of
the existing server path, not client acknowledgement. Successful packet delivery,
location persistence and recovery after partial relocation still need integration
validation. Destination geometry and authored warp pairings are unchanged.

Ten additional production checks cover null/sessionless/area-less players,
unavailable packet transport, unchanged rejected position, manual sand retry and
missing-anchor handling, and rejection propagation through route sand/portals.
The complete legacy validator passes with 336 manager checks and 376 route checks,
plus the native presentation scenarios and static/Lua/Python checks.
The freshly built shared seamless-zone suite also passes 2,485 scenarios; this
is regression coverage for shared transitions, not a live dungeon warp test.

## Coincounter lifecycle callbacks

Coincounter's topple preparation/completion and Animal Instinct completion now
reject cleanup, finishing and dead-actor callbacks. His scheduled update also
requires the tracked living actor to remain in the instance area, matching the
existing add-spawn guard. A refused follow-up is requeued only while that actor
and lifecycle still match, without overwriting a newer pending move.

Seventeen production regressions cover finishing, cleanup, death and foreign-area
topple callbacks/recovery/follow-up dispatch, plus the ordinary refused-admission
retry at 250 milliseconds. The production manager suite passes 353 checks.
This does not prove successful native topple playback or recover admission after
an exception with unknown partial execution; full fight/client tests remain open.

## Bad Breath functional status potency

The production Bad Breath script supplied zero magnitude for Poison and Blind.
Their actual `onGain` handlers use that number directly, so the displayed debuffs
provided neither periodic damage nor an accuracy penalty. The purpose-built
Bad Breath status set and archive fallback now specify Poison 10 and Blind 20,
matching the repository's base player Poison/Blind tuning. These are authored
server values, not recovered Miser-specific retail potency. The shared Morbol
command receives this fix; durations, chances and the other four statuses remain
unchanged. The mechanics generator carries the same command-specific magnitude
policy if it emits these status rules.

`MiserEffectChecks` executes the production command, shared status applicator,
and Poison/Blind gain/loss scripts with mocked engine effect storage. It verifies
all six statuses on successful rolls, nonzero damage/accuracy modifiers, exact
modifier reversal, and no applications on misses or resisted rolls. Both the
purpose-built command and archive fallback are exercised. This supplements the
production C# periodic-damage checks; it does not simulate a complete Miser fight.
Legacy static/Lua/Python, 376 route checks and native presentation scenarios pass,
as does a read-only generator build covering 366 manifest entries.

## Miser remaining attack scripts

The same Lua harness now invokes Sour Breath and Sweet Breath's real command
finishers and the default command finisher used by Vine Probe, Sweeping Lash and
Tendril Tremor. Successful deterministic rolls verify the exact configured status
identities; misses verify that none apply. Each attack resolves its base action
once. Only landed Tendril Tremor queues the existing Level-1/four-yalm knockback,
with the original caster/target. This is the configured server policy, not a new
claim about retail displacement distance.

All six effect-bearing command scenarios pass alongside the 376 route checks and
native presentation scenarios. Engine action resolution and displacement delivery
are mocked here; this does not prove collision handling, AI selection, damage
balance, or a complete live Miser encounter. The requirement table above now
distinguishes this evidence from the remaining integration work.

## Party chest recipient ownership

Both managers now restrict the coffer recipient snapshot to `InitialPlayers`
membership in addition to the existing area and session checks. An unrelated
player present in the private area cannot receive an entrant's reward. Membership
is by player ID so a legitimate returning entrant can use its replacement actor.

Twelve new production checks exercise both managers with two player objects and
real temporary ItemPackages: an outsider with free Loot space is excluded, a
sessionless entrant leaves the rolled item pending, restoring the session permits
fallback from the full member to the available member, and repeated completion
does not duplicate the item. Party rewards use Loot instead of ordinary inventory.
The manager suite passes 365 checks with a clean isolated build. These stack-based
tests do not create persisted equipment or simulate a socket disconnect during
delivery; those remain separate requirements.

## Entry publication retry and busy-event deferral

Both managers revisit attached entrants during updates. Previously a failed
director publication removed the session from the replay ledger but there was no
manager retry, leaving its scene/widget absent. Entry presentation now defers
while transferring, while another event owns/runs on the player, or during combat
cutscene protection. These deferrals happen before claiming the replay ledger.
Cleanup, expired duties and nonparticipants cannot acquire a replay claim.
A delayed original session after victory selects the cleared reconnect path,
rather than replaying an opening scene and reopening the active-duty widget.

Six production helper checks cover idle, busy, transferring, protected, expired
protection and dead reconnect states; dead entrants may restore their widget.
The complete validator passes with 371 manager checks, 376 route checks, combat
Lua and native presentation scenarios. Client acknowledgement, a transport drop
after the replay claim, and the gap between queuing an opening event and owning
the shared scene slot remain open. This change does not claim the opening path
has the full invitation/acknowledgement guarantees of the boss-scene path.

## Shared entry-scene invitation

The subsequent `LegacyRaidEntryPresentation` replaces the direct opening/relogin
kick with a `legacyRaidEntry` invitation. It reserves the same per-player slot
used by boss and victory scenes inside the session's generation-checked packet
batch. Incoming Lua claims the exact player/session/generation/director request
once, and receives a registered, server-owned `LegacyRaidEntryData` containing
the scene, content, original start/deadline and reconnect/clear mode. Client event
extras are ignored. The slot remains reserved until claim or invalidation.

Stale session, actor-table generation, area/director ownership, expiry and cleanup
invalidate requests. Pruned sessions are removed from replay bookkeeping so an
eligible entrant can retry; a stopped dispatcher cannot restart. Dead entrants
remain eligible to restore their widget. A clear occurring before claim converts
the canonical payload to cleared reconnect mode. Initialization is serialized
across entrants. Failed packet admission releases the slot and replay claim.

The production manager suite now passes 398 checks, including actual suppressed
packet-batch admission, competing slot acquisition, one-use acknowledgement and
stale/stop release. Native Lua tests cover the canonical entry scene/deadline,
foreign event rejection and replay refusal for both contents. Route/combat Lua,
static and presentation validation also pass. This closes the previously noted
queued-opening/scene-slot gap; actual client acknowledgement/rendering and native
failure recovery still require live testing. No duty time or placement changed.

## Route death actor ownership

`LegacyRaidRuntime.RecordDeath` now requires the exact actor reference held for
the route row and its original area, as well as the numeric ID lookup. Previously
an unrelated or stale actor with the same numeric ID could credit a published
route row. Null, departed and stopped-route callbacks are rejected. The existing
progression ledger still rejects duplicate deaths, unavailable rows and rows
that were not published.

Production runtime regressions exercise each rejected case, valid owned credit
and duplicate valid callbacks. They use the real runtime and progression ledger;
no route entries, coffer dependencies or objective timing policies were changed.
The isolated build and 404 manager/runtime checks pass, alongside the 376 route
checks, combat Lua, native presentation and static validation suites.

## Cleanup continuation and exit retry

Route cleanup now isolates each despawn and director-member removal, then clears
its actor-ID ownership index. One failed actor no longer prevents processing the
remaining actors. Both managers isolate route cleanup, widget closure, each
player exit attempt, director teardown, content completion and destruction checks.
A failed widget packet cannot prevent the same player's exit attempt.

Cleanup retains the manager instance while players remain in its area, including
rejected or asynchronously unfinished exits. Attempts are limited to once per
second; reward-coffer publication stops once cleanup begins. Final teardown and
manager removal happen after the area is empty. This prevents an early rejected
exit from permanently losing the manager's retry path. A persistently missing
return point still requires repair; this does not invent a fallback destination.

Fourteen production checks exercise failing actor despawns, continued member
removal, repeated cleanup, rejected exits retaining the instance, retry pacing,
and eventual empty-area finalization despite director/destruction exceptions.
The harness deliberately logs those injected fixture failures. Full validation
passes with 418 manager/runtime checks, 376 route checks, combat Lua and native
presentation scenarios. Actual networked departure remains live validation work.

## Combat shutdown before fallible removal

The route stop and both managers' remaining-mob stop now use a common retirement
operation. It first sets encounter action suppression (which disables autoattack,
clears AI states and stops movement), then independently attempts despawn and
director-member removal. Failures are logged per operation and cannot abort the
remaining combatant loop. Runtime stop ignores actors that left its area.

Three production checks verify suppression and director retirement despite an
injected despawn failure, including continuation to the next actor. This closes
the failure where the first despawn exception could interrupt clear/wipe handling
before the rest of the enemies were processed. Retry-timer persistence and
per-player failure/clear announcement delivery remain separate lifecycle checks.
Full validation passes with 421 manager/runtime checks and 376 route checks,
plus combat Lua, scene/widget and static suites. Logged removal errors in this
run are the deliberately injected failure fixtures.

## Entrant clear and failure delivery isolation

Both managers now deliver achievements, clear/failure messages and director events
only to registered entrants still present with a session. Each delivery step and
recipient is isolated: one achievement or packet exception cannot prevent the
remaining steps or other entrants from receiving their results. Area/session
presence is checked again before each step.

Four production regressions cover exception continuation, later delivery steps,
outsider/sessionless exclusion and a recipient leaving during delivery. Full
validation passes with 425 manager/runtime checks, 376 route checks and the combat
Lua, native scene/widget and static suites. The injected delivery error is expected.
This isolates exceptions; it does not retry failed deliveries or establish database
persistence or live client acknowledgement. Retry-timer persistence remains open.

## Entrant-only wipe detection

Both managers now evaluate defeat using registered entrants whose current area is
still the instance. A living outsider or stale departed actor cannot hold a wiped
party open. A living entrant still prevents defeat even without a session; this
does not introduce a disconnect-as-death rule. An empty area or an area containing
only outsiders is not classified as a wipe.

Ten production manager regressions cover these cases across both dungeons.
Full validation passes: 435 manager/runtime checks, 376 route checks, combat Lua
and native scene/widget scenarios; the isolated build has no warnings or errors.
The persistence trace also confirms that `Database.SavePlayerTimers` catches and
logs database failures without returning a result, while `Player.SetContentTimer`
updates memory before saving. Durable cooldown recovery after a failed save is
therefore still unresolved; no database-failure recovery is claimed by this pass.

## Chimera Sand Pillar admission and audience

The hidden worm's Sand Pillar now selects only registered, living entrants with a
session in the same area, excluding transfers and protected cutscenes. Dispatch
also requires the tracked Chimera and worm to be alive in that area and the
instance to be neither finishing nor cleaning up. Chimera's update rejects a
departed boss before any summon or recovery processing.

A false cast-admission result or absence of eligible targets schedules a 250-ms
retry instead of consuming the full 15-second interval. This retry delay is
authored policy. Successful admission retains the existing interval; an exception
does not reset it because partial admission would be ambiguous. Skill identity,
damage, TP preparation, positioning and SQL are unchanged.

Production tests exercise thirteen eligibility/lifecycle states through dispatch,
then the actual manager update and its retry deadline. The isolated controller
intentionally rejects admission; successful command execution, native Sand Pillar
rendering and a complete Chimera fight remain acceptance work.
The isolated build and 463 manager/runtime checks pass. The combined run's static,
376 route, combat Lua and scene/widget suites also passed before fixture repair;
only the affected manager suite was rerun after that test-only correction.

## Configure raid actors before area publication

Both managers now install one-shot lifecycle ownership through the area's existing
`configureBeforeAdd` callback. Cutter additionally applies director-only skill
control and the hidden worm's targetability/nameplate flags in that callback,
before `AddActorToZone` and AI attachment. These settings previously followed
publication. The hidden actor's explicit post-publication property/name packets
remain necessary for the client and are retained.

Twenty production helper checks cover all hidden/director-controlled combinations,
the exact lifecycle owner and three presentation properties. Their fixture has no
broadcast infrastructure, verifying that preparation sends no premature packets.
These checks do not prove atomic actor publication: the shared area path still
adds an actor before attaching AI, and later manager bookkeeping can fail after
publication. End-to-end partial-publication recovery remains open; no duplicate-free
spawn transaction or live hidden-worm rendering is claimed.
Full validation passes with 483 manager/runtime checks, 376 route checks, combat
Lua and scene/widget scenarios. The isolated build has zero warnings and errors.

## Preserve completed spawns across presentation failures

Cutter's completion path now records the returned actor in the owned roster and
its encounter role before issuing presentation updates. The worm's targetability
and nameplate updates are independently guarded; failure of either no longer
loses the tracked worm or converts an accepted spawn into a retry. Chimera's
part-HP and substate broadcasts are similarly isolated after ownership and part
state initialization. The manager returns the accepted actor to its wave/route
caller even when those presentation sends fail.

Production completion tests use an area without broadcast infrastructure to
exercise actual packet-path failures. They check retained worm/Chimera ownership,
all four initialized part-HP slots, soldier membership and Marshal one-use state.
These tests cover failures after the area spawn call returns. Failures within
`AddActorToZone`/AI attachment remain a separate shared publication issue, and
failed presentation delivery still needs client replay/acceptance verification.
The isolated build and 497 manager/runtime checks pass. Static, 376 route, combat
Lua and scene/widget validation also passed; the manager suite was rerun after
correcting a test fixture's HashSet membership cast. Injected publication errors
in the harness are expected.

## Sand Pillar successful AI admission

The production manager harness now connects the owned worm to a real
`BattleNpcController` and `AIContainer`, with a connected player session and an
isolated command cache. Its manager update enters a non-interrupted `MobSkillState`
and retains the 15-second accepted-cast interval. The skill state copies the chosen
player's ground position; moving that player afterward does not change the copy.

This is an instant command fixture with stubbed prepare/start Lua. It verifies
manager-to-controller admission and the actual state's ground snapshot, not the
canonical Sand Pillar's cast duration, damage resolution, targeting dimensions,
native animation or full encounter. The earlier rejected-cast tests remain.
No production code, SQL or placements change in this coverage pass.
The isolated build succeeds without warnings/errors and all 505 manager/runtime
checks pass. Existing route/Lua/presentation suites were not rerun for this test-only
addition; their prior results retain their original verification scope.

## Canonical Sand Pillar admission data

The admission fixture now reads command 23501's targeting masks, command type,
resource costs and every tested range/shape field from the main
`server_battle_commands.sql` table, matching column names to its row. It no longer
substitutes a 10-yalm range or an eight-yalm circle. The shipped row specifies a
2-yalm range and no area shape. Cast time remains instant in this admission-only
fixture, and prepare/start Lua remains stubbed.

Consequently, the copied ground target does not by itself prove an avoidable
ground-area attack: the shipped no-area shape and full impact path still need
evaluation against the encounter evidence. No geometry, range or radius is
invented from the earlier simplified fixture. This supersedes that fixture's
geometry evidence while retaining its narrowly scoped startup assertions.
The isolated build and all 505 manager/runtime checks pass with these SQL-derived
values. This is a test-data correction; no production or SQL changes were made.

## Period-source correction: Chimera arena traps

`Data/raidroutes/cutters_sand_pillar_review.json` records a material gap found by
rechecking the period sources. Erwald's March 2012 guide describes plural arena
traps and a strategy that avoids them. In the March 13 discussion, KiraAmane
confirms a strategy that keeps sand traps hitting Chimera. The quoted 2500 damage
is an observation, not a recovered fixed-damage rule.

The current single carrier's random-entrant ground dispatch is therefore an
incomplete substitute. Its passing startup test cannot establish this mechanic.
The next implementation must include scoped Chimera impact eligibility and
trap-based activation/impact behavior, with explicit uncertainty for count,
geometry, timing, damage and homes. Merely enlarging command 23501's radius would
not satisfy these requirements. See the review for primary source links and
the required impact/death/reward validation. No live or shared SQL state changed.

## Scoped Sand Pillar impact recipients

The production `MobSkillState` impact path now gives the Cutter manager the actual
mutable target list and frozen ground origin for command 23501. Only the exact
instance-owned worm claims the override. It replaces that command's recipients
with connected, eligible entrants and the exact tracked living Chimera inside a
2.5-yalm horizontal radius and three-yalm vertical tolerance. Both values are
authored provisional geometry, not measurements recovered from the period sources.
Movement outside the footprint before impact avoids selection. Cleanup, finishing,
dead/foreign-area actors and missing origins cannot select recipients. Unrelated
worms and action variants retain their ordinary target handling.

The shared SQL profile is unchanged: this exception is encounter-owned impact
selection, not global monster friendly fire. Dispatch still selects a player's
ground point rather than fixed arena traps; that substitute still needs replacing.
The tests exercise the production selector, including boundaries, movement,
cutscenes, transfers, disconnection and ownership. They do not yet prove native
damage execution, trap-caused boss death/rewards, damage tuning or visual delivery.
The isolated build and 519 manager/runtime checks pass. The combined run's static,
376 route, combat Lua and scene/widget checks passed; only the affected manager
suite was rerun after the cutscene-protection fixture correction.

## Fixed first-pass arena trap dispatch

Random player-ground selection has been removed. Chimera publication freezes four
provisional trap sites at cardinal eight-yalm offsets from its initial home, using
the same unresolved floor height. One hidden actor supplies these separate ground
casts in east/south/west/north order. Accepted casts advance the index; rejected
admission retries the same site. Boss movement, healing and player movement do not
move the homes or reset the cycle. Boss replacement creates a new set of homes.

The carrier itself is the command anchor, so admitting a trap does not depend on
a player standing within the shared command's short range. The impact hook still
selects recipients from their positions at impact. Dispatch pauses without an
eligible entrant. Four sites, their offsets/order, the 15-second global cast
interval (60 seconds per site) and the existing impact footprint are authored
first-pass settings. They are not recovered retail counts, XYZ or scheduling.
The 70-entry route and its native anchors remain unchanged.

Full validation passes with 526 manager/runtime checks, 376 route checks and
combat Lua/scene/widget scenarios. Actual AI admission covers a full site cycle
and wraparound. Impact damage, trap-caused boss death/rewards, native cast visuals
and floor acceptance remain required; this is not an end-to-end fight result.

## Preserve an empty trap impact through damage dispatch

The damage dispatcher had a legacy fallback that reacquires a mob's combat target
when a no-shape imported command has no resolved recipients. That must not undo
an encounter's deliberate empty impact footprint. Owned Sand Pillar resolution
now marks its per-use command as encounter-resolved, and `DoBattleCommand` preserves
that target list even when empty. Ordinary legacy commands retain their fallback.
The execution copy preserves the marker; the shared command cache stays unchanged.

Five production resolver checks cover ordinary fallback, an intentionally empty
footprint, execution-copy preservation, cache isolation and a nonempty owned list.
They do not execute HP damage or prove the trap death/reward path. The remaining
damage investigation includes the hidden worm's authored zero Damage setting and
the canonical finish handler; do not infer damage tuning from target selection.
The isolated build and 531 manager/runtime checks pass, as do 368 shared Garuda
cast/geometry checks against that production DLL. Static, 376 route, combat Lua
and scene/widget checks passed in the combined run; the manager suite was rerun
after correcting its refreshed TargetFind reference in the fallback fixture.

## Sand Pillar physical damage application

The command fixture now imports the canonical SQL action type, property, potency,
hit count and ranged flag. Three additional production checks confirm that the
shared physical formula produces positive damage with the worm's zero weapon
Damage stat, that `DamageTarget` subtracts the calculated amount from a monster,
and that the victim retains the worm as its last attacker. All 534 manager/runtime
checks pass. The fixture initializes normal claim bookkeeping with no viewers;
it does not establish client presentation or combat target behavior.

This exercises calculation and nonlethal application directly, not the complete
Lua finish pipeline. Trap-caused boss death/rewards, resulting hate/retaliation,
native visuals and floor acceptance remain open. The period 2,500-damage report
is not used as a fixed damage rule.

## Trap damage and combat hate

The real damage application test exposed an unwanted hate entry: Chimera could
select the hidden environmental worm as its combat target. An owned Sand Pillar
impact now marks only its per-use command to suppress NPC-to-NPC damage enmity.
Ordinary monster damage retains its existing behavior. Damage and last-attacker
attribution are preserved, and player recipients still use their normal path.
The marker is enabled only when the Cutter manager accepts the exact owned trap.

Five additional checks exercise ordinary damage hate, environmental HP loss,
absence of a combat target or dormant hate entry, and retained attribution.
All 539 boss/runtime checks and 368 shared Garuda cast/geometry checks pass.
The combined validator also passes 376 route checks and native scene/widget
contracts. A fresh isolated serial build passes the shared end-of-patch combat
and aggro-sense/hitbox contracts.
This does not prove lethal trap completion or native rendering; those remain open.

## Lethal trap clear fallback

The production fixture now runs lethal `DamageTarget` through `BattleNpc.Die`,
the real death AI state, WorldManager and Cutter's owned death callback. It
verifies zero HP, the exact pending boss and a zero player-source ID. The manager
rejects completion before the fallback deadline and from an unrelated player's
command, accepts the inclusive deadline, captures reward eligibility, enters the
reward window and rejects a second completion. All 548 boss/runtime checks pass.

The fixture uses no viewers for death and removes entrants before completion to
avoid database writes. It has no director, so reward actors are not published.
These checks prove the server's lethal-trap clear transition, not coffer creation,
achievement persistence, native widget delivery or the full Lua attack finish.
The uninitialized fixture's quest-pair sentinel was corrected to the constructor's
normal invalid actor ID; its earlier one-HP protection failure was test setup,
not a production Chimera damage floor.

## Reward coffer publication retry

Both managers now isolate reward publication exceptions per coffer, preserving
the remaining clear delivery and other earned coffer attempts. A retry first
looks up its exact unique actor ID: if the area accepted the actor before
director membership or client publication failed, it finishes that actor rather
than spawning a duplicate. The reservation always releases on failure. Cutter
also retires stale publication bookkeeping for an unopened, absent reward,
matching Aurum's recovery; consumed rewards remain permanently excluded.

Ten production manager checks cover a director-publication failure, reservation
release, successful reuse of the same actor, a single director member, and
idempotent completed publication in both dungeons. The fixture supplies an
already-added actor and no viewers, so constructor/area-add failures and client
transport still require separate coverage. Full validation passes with 558
boss/runtime checks, 376 route checks and native Lua scene/widget contracts.

## Coffer consumption versus presentation

Both managers now commit a fully delivered reward's opened state before attempting
its animation or notices. Those deliveries and the all-five-coffers achievement
use the registered-entrant helper, isolating each recipient and each operation.
An animation failure therefore cannot leave completed loot unconsumed, skip the
remaining recipients, or award the achievement to an unrelated area occupant.
Per-item notices also use isolated delivery after recording successful inventory
delivery, so a failed notice cannot interrupt processing the remaining roll.

Ten interaction checks exercise both real manager entry points with an already
delivered roll and deliberately broken session actor-table state. They verify
handled interaction, consumed state, released reservation, repeat handling and
unchanged inventory. The expected animation exceptions are logged by the helper.
Full validation passes with 568 boss/runtime checks, 376 route checks and native
Lua scene/widget contracts. Achievement persistence and successful client-visible
animation remain separate acceptance requirements; isolation does not persist or
retry a failed achievement write.

## Completion chest interaction eligibility

Both manager interaction entry points now reject cleanup, unregistered visitors
and unavailable entrants using the route's existing participation predicate.
After ordinary route interactions are handled, completion rewards additionally
require an earned clear, an unexpired reward window, a published reward key and
the exact actor currently registered under that actor ID. Stale actor references
cannot open a replacement, and merely sharing the instance area is insufficient.

Sixteen production checks cover outsider, cleanup, uncleared, expired, unpublished,
replaced-actor, dead and zoning cases across both dungeons. Valid and repeated
consumed interactions still pass. Full validation passes with 584 boss/runtime
checks, 376 route checks and native Lua scene/widget contracts. This verifies
admission at the interaction boundary, not transaction races after admission or
successful live-client loot presentation.

## Ordinary route coffer presentation and retirement

Ordinary route coffers now isolate open animations per registered entrant, so
a failed animation cannot prevent scheduling the consumed actor's removal. The
delayed callback checks the opened key, exact current route ownership and area
before acting. Actor despawn and director-member removal are isolated from one
another; a failed despawn cannot suppress membership cleanup. Route cleanup's
ownership removal invalidates pending callbacks, while normal combat shutdown
still allows a previously opened coffer to finish its display interval.

Five production callback checks cover unopened, replaced, departed, owned with
despawn failure, and removed-ownership cases. Full validation passes with 589
boss/runtime checks, 376 route checks and native Lua scene/widget contracts.
The callback tests do not prove successful native despawn or scheduler timing.

## Princess summon lifecycle admission

Princess's update now matches Chimera's lifetime guards: finishing instances,
cleanup, dead bosses and a boss no longer in its owning area return before any
summon admission or timer work. Four production checks use an eligible Marshal
and an unavailable spawn service to verify those paths cannot reach publication.
The existing active-instance failure/retry checks still reach that service and
release the Marshal reservation. Full validation passes with 593 boss/runtime
checks, 376 route checks and native Lua scene/widget contracts.

Full successful add publication and surviving-add encounter sequencing remain
open. In particular, an exception inside area spawn/AI attachment occurs before
the manager records ownership; recovering partial publication there needs an
explicit actor-identity strategy, not an unconditional retry that can duplicate
an actor already added to the area.

## Area publication ordering

`Area.AddActorToZone` now resolves and validates its spatial bucket before adding
the actor to the main table. Previously a missing or invalid grid could throw
after table insertion, leaving an untracked actor for the caller's spawn retry
to duplicate. The configured mob-type spawn path now also applies its local DPS
AI preset before area publication. Inspection confirms this preset only sets
AI-local preset and damage-hate fields; it requires no published actor.

Four production checks force missing grid/bucket failures, verify no table entry
is left behind, then repair the grid and verify successful and repeated
publication produce exactly one table and spatial entry. Full dungeon validation
passes with 597 boss/runtime checks, 376 route checks and scene/widget contracts.

The broader ZoneMailboxTests run passes quick-nav checks but stops at the public
guest-visibility assertion (expected two players, got zero). The identical failure
occurs against the earlier `.codex-build/legacy-trap-combat/Map Server.dll` from
before this change. This is a recorded shared-suite limitation, not a passing
mailbox suite. Logs are `legacy-area-validation-latest.log` and
`legacy-area-baseline-latest.log` under `.codex-build`. Full successful encounter
spawn construction and client publication remain separate coverage gaps.

## Independent summon failure handling

Cutter's encounter-wave callback now catches and logs failed spawn operations
per slot. An unavailable Marshal spawn no longer aborts the rest of Princess's
already-admitted guard/soldier work. Failed guard and soldier publication resets
their due times through the existing retry branches, while unfilled soldier
slots remain pending and completed slots retain the existing one-use ledger.
This follows the area-publication ordering correction above; the callback does
not alter spawn counts, homes, successful summon cadence or Marshal eligibility.

The production manager regression forces all spawn operations to fail and
verifies two consecutive updates each attempt the Marshal, guard and ten soldier
slots, retain ten unfilled slots, keep the wave count at zero, and leave both
retry timers due. Lifecycle checks now also assert no spawn serial is allocated
under their exclusion conditions. Full validation passes with 603 boss/runtime
checks, 376 route checks and native Lua scene/widget contracts. Successful full
wave publication and native-client acceptance remain open.

## Environmental hazard entrant admission

Gold Lung and the manager's manually placed shifting-sands hooks now require a
registered entrant in addition to the existing live/session/zone-change/cutscene
checks. Both updates return during finishing or cleanup. This aligns them with
the route's participant-scoped controls without changing damage, pulse timing,
Veil magnitudes or authored trigger geometry.

Ten manager checks verify that outsider, finishing, cleanup, dead and zoning
cases cannot consume a hazard pulse/cooldown. The earlier sand-warp fixture now
explicitly registers its entrant; rejected transfers and missing destinations
still release cooldowns. All 613 boss/runtime checks pass after that fixture
correction. Static, 376 route, native scene/widget and Miser Lua checks passed in
the combined run. Successful status application and live environmental effects
remain separate acceptance work.

## Manual magitek-circle continuity

The manually placed Aurum circle path now uses `LegacyRaidCircleHold`, matching
the route controls' 1.5-second continuous hold and authored two-second update-gap
guard. Missing/departed circle actors, finishing and cleanup reset pending holds;
insufficient occupants reset through the shared helper. Radius and player counts
are unchanged. This removes the separate timestamp implementation that could
bank time while a circle was unavailable or the loop stalled.

Fifteen production manager checks cover missing actors, stalls, finishing,
cleanup and empty occupancy, then verify a fresh hold stays incomplete at 1,499
milliseconds and activates at 1,500. The fixture intentionally stops at the
missing broadcast-grid exception after activation and checks the barrier state;
it is not native presentation coverage. All 628 boss/runtime checks pass. Static,
376 route, native scene/widget and Miser Lua checks passed in the combined run;
the manager suite was rerun after correcting the fixture's expected exception.

## Encounter announcements cannot abort mechanics

Both managers' `SendToInstance` helpers now use per-entrant isolated delivery.
Cutter's native encounter-world-message helper uses the same path. A failed
recipient no longer interrupts later recipients or the remaining caller work,
such as guard/soldier admission following the Marshal notice. Unregistered area
visitors do not receive these instance announcements.

Two production manager tests install real suppressed-packet observers, force
the first entrant's packet delivery to throw, and verify the second entrant is
still reached while an outsider is excluded. Full validation passes with 630
boss/runtime checks, 376 route checks and native Lua scene/widget contracts.
This proves failure isolation, not successful live transport or native text
rendering. Failed notices are logged; they are not durably replayed.

## Aurum protection consumption ordering

Successful Veil application now records morbol-part consumption and resets the
Gold Lung pulse deadline before the Goldbile refresh or notices. Previously a
follow-up exception could leave an applied buff without recording its use for
the no-parts achievement. The refresh and both notices are isolated so one
failure cannot skip the others. Consumption also rejects unregistered or
unavailable players and finishing/cleanup instances.

Nine new production checks cover five denied interaction states and successful-
application continuation for both fruit/root modes with deliberately failing
status/world services. They verify the consumer record and pulse reset survive;
they do not execute initial status application or prove the live effect. Full
validation passes with 639 boss/runtime checks, 376 route checks and native Lua
scene/widget contracts. The static mitigation-call assertion follows the new
per-entrant continuation.
