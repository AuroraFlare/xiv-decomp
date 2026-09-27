# Cutter's Cry position-free 1.x implementation

Historical baseline: the [2026-09-07 populated-route pass](legacy_raid_routes_2026-09-07.md)
adds default rooms, native sand bindings, coffers, automatic objectives, and route authoring.
Its current scope and reconstruction limits supersede this document's placement omissions.

This pass restores the original 1.x Cutter's Cry systems that can be supported
without inventing permanent enemy, coffer, quicksand, patrol, or event-object
coordinates. It intentionally adds no Cutter's Cry rows to
`server_battlenpc_spawn_locations.sql`.

## Implemented contract

- Private zone 246 / region 104 / content 7 with the recovered
  `InstanceRaid/InstanceRaidCuttersCry` director, field/battle music 5/6, and a
  60-minute time limit.
- The contract is intentionally pinned to Cutter's Cry's launch-era patch 1.21;
  patch 1.22 later relaxed the party-size rule. Normal Hortwann entry requires
  exactly eight level-45-or-higher Disciples of
  War or Magic. The retry timer is applied at the outcome, not at entry: 15
  minutes after a clear or voluntary withdrawal and 5 minutes after timeout or
  full-party defeat. The GM solo path suppresses retry timers and the
  party-continuity achievement.
- Hortwann currently launches after server-side validation without relying on
  the recovered `askEnterInstanceRaid(7)` confirmation return. The client
  widget helper remains available, but its event response is not reliable in
  this server's current Lua bridge; this UI workaround is not claimed as an
  exact retail interaction.
- A 15-profile position-free roster: Myrmidon Princess, Soldier, Drone, Guard,
  Sentry, Marshal, and Scavenger; Quicksand Peiste and Basilisk; Sand Bat;
  Sandstorm; Sabotender Desertor; Schorl Doblyn; Chimera; and the hidden tunnel
  worm. The five newly completed profiles are also in the idempotent live
  migration `Data/sql/live migrations/cutters_cry_bnpc_mob_types.sql`.
- The Chimera's recovered m047 presentation commands are seeded in
  `server_battle_commands.sql` and mirrored by the idempotent live migration
  `Data/sql/live migrations/cutters_cry_chimera_animation_contract.sql`.
  `AI Scripts/generate_monster_sql.ps1` is the reproducible source for the
  internal WSS10-WSS20 rows.
- Runtime hooks for all three period shifting-sands outcomes: 400-1700 HP loss,
  1000-1600 MP loss, or a warp to a recorded destination. These hooks store
  runtime coordinates only.

## Myrmidon Princess

The implementation follows the March 2012 1.x behavior:

- Engagement starts when the Princess first takes damage. A Soldier wave is
  due immediately, subsequent reconstructed Soldier waves contain ten adds on
  a 30-second cadence, and one Guard arrives each minute beginning at +60s.
- The Marshal check occurs once, at the first 60-second colony tick. It summons
  the Marshal only if the Princess is then strictly below 80%; crossing 80%
  earlier does not summon it early, and missing that check locks it out for the
  rest of the attempt.
- Marshal death is tracked for achievement 1310. The manager does not invent a
  proximity tether or periodic Princess heal; Formic Pheromones remains in the
  native ant action family.
- Princess death halts future summons. The implementation leaves surviving
  adds in the chamber, especially the Marshal, so the tracked Marshal objective
  remains completable after Princess falls. Surviving evidence does not recover
  the original mass-despawn policy conclusively, so this is an explicit
  achievement-preserving implementation boundary rather than an exact claim.

## Chimera

- The existing nine-command 1.x action family (23456-23464) remains intact.
  Lion/dragon/ram Breath actions announce red eyes and Voice actions blue eyes.
  No post-1.x encounter rules are imported.
- Three encounter-relative waves of nine Myrmidon Scavengers arrive while the
  Chimera passes through its documented 60-70% add phase. The 1.x guide proves
  three groups of 8-10 and the video proves at least twenty adds; the exact
  70/65/60 trigger split is an explicit reconstruction.
- A hidden, immobile tunnel worm supplies Sand Pillar during the fight. Its
  presence and attack are video-proven; the selected action variant 23501 and
  15-second cadence are reconstruction because exact scheduling did not
  survive.
  **2026-09-18 correction:** this single player-targeting carrier is an incomplete
  substitute. Period sources describe arena traps and confirm that they can hit
  Chimera. The current first pass now cycles four fixed cardinal sites, eight
  yalms from the initial boss home, with encounter-scoped impact eligibility for
  Chimera and nearby entrants. Count, offsets, floor, footprint and cadence are
  provisional authoring. See `Data/raidroutes/cutters_sand_pillar_review.json`;
  damage/death/reward execution and native visual/floor acceptance remain open.
- Chimera death captures all reward conditions once, sends the clear event,
  applies the 15-minute retry timer, and leaves the arena/reward actors open for
  90 seconds. Period video proves loot occurs after the kill; 90 seconds is a
  safe server window rather than a claimed exact retail constant.
- The lethal player's command-result, HP, and deferred death presentation are
  queued before clear UI, achievements, and completion coffers. A 250 ms
  manager fallback handles scripted/non-player kills that have no player command
  flush; that fallback is a server-safety value, not a retail timing claim.

### Recovered 1.x presentation and incapacitation contract

The following portion is recovered from the 1.x client/decompilation and period
data, not inferred from later versions of the encounter. Where the client does
not serialize a direct join, the boundary is called out explicitly:

- `KhimairaNormalStandard.lua` advertises body 1, legs 4, lion head 5, ram head
  6, and dragon head 7. Body 1 remains the ordinary actor HP slot; parts 4-7
  receive independent HP slots. The server enables the client's part surface
  through `charaWork.property[3]`.
- The native PB resolver proves bit N selects PB(N+1). Combined with the m047
  part resources and recovered command meanings, the supported breakage masks
  are legs `0x08`, lion `0x10`, ram `0x20`, and dragon `0x40`. Independent head
  mode resources support lion `0x10`, dragon `0x20`, and ram `0x40`.
- The sequential internal command meanings and sequential m047 banks support a
  high-confidence 23465-23475 to WSS10-WSS20 mapping: lion, dragon, and ram head
  return (WSS10-12); the two lion, dragon, and ram mode transitions (WSS13-18);
  leg destruction/topple (WSS19); and recovery (WSS20). The client data does
  not contain a direct serialized command-to-bank join, so this ordered mapping
  is not overstated as independently exact. These remain presentation
  transitions, never additions to the random offensive skill list.
- The period 1.21 incapacitation table supplies the eligible weapon skills and
  facing: lion/front accepts Concussive Blow `27111`, Skull Sunder `27191`, or
  Bloodletter `27235`; ram/right accepts Flat Blade `27151` or Godsbane `27195`;
  dragon/left accepts Gloom Arrow `27234` or Impulse Drive `27275`; and legs
  accept Demolish `27115` or Leaden Arrow `27229` from any facing.
- While a head is incapacitated, only its corresponding Breath/Voice pair is
  suppressed: lion 23456/23457, dragon 23458/23459, and ram 23460/23461. A head
  recovery restores its pair; leg topple halts Chimera's actions and movement
  until it rises. Head incapacitation is a combat mechanic, not achievement
  1308's condition; the exact 1.x achievement text requires only defeating the
  Chimera in Cutter's Cry.

The damage hook observes actual HP lost after `DelHP`, then queues the part
update. The command result and normal HP/resource packets are sent first; only
the post-command flush publishes part HP, breakage/mode substate, and the WSS
transition. Queues are correlated to the attacking player, so another party
member's concurrent command cannot flush the transition early. This ordering
prevents a break animation from preceding the weapon skill that earned it.

### Named reconstruction boundary

The original server's part HP budget, recovery clocks, and head-break kick
carrier did not survive. They are therefore isolated as named reconstruction,
not described as exact retail constants:

- each part currently breaks after eligible attacks accumulate actual HP loss
  equal to 10% of Chimera's maximum HP;
- an incapacitated head recovers after 45 seconds, while toppled legs recover
  after 8 seconds; and
- WSS10 is used as the control-only head-break `SubStatusKick` carrier. WSS10's
  client presentation is recovered, but this particular initial-break carrier
  choice is not.

The receive protocol does not carry a separate anatomical target id. The
server therefore derives the intended part from the recovered weapon-skill id
and `CommandResult.param` facing, rather than inventing a new packet field.

## Treasure and achievements

Six regular coffers are recorded independently with their observed period item
pools. Each can substitute Vampire Plant; the local one-in-six chance is
reconstruction because the retail probability is unrecovered.

At Chimera death, one base completion coffer always appears and up to four
bonus coffers appear for:

1. clearing in under 25 minutes;
2. completing the first-room Drone/Sentry last-and-nearly-simultaneous
   condition;
3. opening all six regular coffers; and
4. defeating the final two Sabotender Desertors.

The first-room and final-Cactuar conditions have explicit position-free hooks.
They are not inferred from arbitrary Drone, Sentry, or Cactuar deaths because
their route identity cannot be proven without placement data. Final coffers use
generic coffer actor 1200161 as a visual substitute and are placed relative to
the dead Chimera, not in permanent world data.

Period observations recover the six regular pools, five completion pools, and
rare Darklight drops. They do not recover the original condition-to-left/right
physical coffer association or probabilities. The manager preserves every
observed pool in stable documented associations and uses a one-in-twenty rare
roll as an explicit reconstruction. Heavy Darklight Flanchard is item 8051501;
it is not Darklight Breeches.

- Achievement 1308 unlocks when Chimera is defeated, matching the exact 1.x
  achievement text.
- Achievement 1309 unlocks only after all five earned completion coffers exist
  and all five are opened.
- Achievement 1310 unlocks on clear only if the Marshal died and the original
  eight-player party remained intact. Party integrity is re-sampled at the
  clear edge rather than relying on the last manager update.

Failed dynamic Marshal, Guard, Soldier, Scavenger, and completion-coffer spawns
do not silently consume their mechanic. The encounter retries failed waves or
missing earned coffers, while per-key publication reservations prevent duplicate
reward actors. Failure UI receives a three-second presentation grace before the
return transition; that grace is an implementation safety value rather than a
recovered retail constant.

No Alumina Salts (10011212) are awarded. The relic evidence proves their Cutter's
Cry destination and quantity, but not their coffer/event trigger.

## Runtime controls

```text
!cutters goto
!cutters start
!cutters enter
!cutters status
!cutters roster
!cutters mob <key> [count]
!cutters princess
!cutters marshal
!cutters chimera
!cutters anchor <destination-key>
!cutters sand <destination-key> [trigger-key]
!cutters sandhp [trigger-key]
!cutters sandmp [trigger-key]
!cutters sands
!cutters sandclear
!cutters coffer <1-6>
!cutters objective dronesentry
!cutters objective finalcactuars
!cutters leave
```

All placement uses the caller's current position or a small formation relative
to an encounter actor. For example, stand at a destination and run
`!cutters anchor lower`, then stand at its source and run
`!cutters sand lower slide1`.

## Period evidence and remaining boundary

Primary period sources used for behavior are:

- [Official patch 1.21 notes](https://forum.square-enix.com/ffxiv/threads/39024-patch1.21-Patch-1.21-Notes)
  for level, party, duration, outcome retry rules, and the period weapon-skill
  set used by incapacitation.
- [March 2012 Cutter's Cry guide](https://forum.square-enix.com/ffxiv/threads/40090-Le-Gouffre-Hurlant-Soluce-Tips-attention-Spoil)
  for sand outcomes, Princess timing, room objectives, and Chimera add phase.
- [Official forum thread linking the two original 1.x videos](https://forum.square-enix.com/ffxiv/threads/39927-New-Video-up-on-youtube-%28Cutter-s-Cry%29)
  for direct Princess and Chimera encounter observations.
- [Five-coffer condition report](https://forum.square-enix.com/ffxiv/threads/39150-Aurum-Vale-Duty-Complete%21?p=582767&viewfull=1)
  and [March 20 observed loot table](https://forum.square-enix.com/ffxiv/showthread.php?p=597814).

Local `worldMaster`, command, achievement, item, archived eLeMeN, actor-class,
and skill-list data corroborate identities, messages, actions, effects, and item
IDs. Recovered m047 Lua plus PB/WSS/substate decompilation supplies the part
ids, presentation flags, native PB bit contract, and ordered WSS bank evidence.
The original
1.x videos corroborate damageable heads, temporary incapacitation/regrowth, and
leg topple/recovery; the March guide corroborates the Princess schedule,
shifting sands, objectives, and the Chimera's scavenger phase. No behavior is
derived from the later relaunched encounter.

Still absent are permanent placements, exact route topology, original coffer
ownership/drop sheets, exact probabilities, a proven Alumina Salts trigger,
the original server's Chimera part-HP formula and recovery timings, and its
exact head-break transition carrier.

Run `tools/validate_cutters_cry.ps1` after changes, then build the Map Server.
The validator protects both the restored systems and the deliberate
no-guessed-placement/no-unproven-relic-reward boundary.
