# Castrum Novum Instance Design

Working design notes captured on 2026-08-17. Zone selection is intentionally
out of scope for now; coordinates are recorded in world-space order as supplied.

## Player Start

- Position: `(-514.108, -3.596, -122.485)`
- Rotation: `1.712182`

## Initial Route / Encounter Points

These are the first supplied points after the player start. The final point is
confirmed as a Magitek enemy; the remaining enemy roles and names are not final.

| # | X | Y | Z | Rotation | Note |
| ---: | ---: | ---: | ---: | ---: | --- |
| 1 | -438.604 | -3.684 | -88.043 | -3.055 | Initial point |
| 2 | -449.374 | -5.335 | -88.665 | 2.994 | Initial point |
| 3 | -448.670 | -3.596 | -58.394 | 2.816 | Initial point |
| 4 | -465.318 | -3.445 | -51.157 | 2.444 | Initial point |
| 5 | -471.439 | -3.905 | -41.998 | 2.414 | Magitek enemy |

## First-Clear Map Marker

After the first set of mobs is defeated, display a guildleve-style circle on
both the minimap and the main map at:

- Position: `(-527.721, -3.205, -12.250)`
- Rotation: `0.774`

## Second Imperial Encounter

All actors in this group are Imperials. Names are working content names and may
be changed without moving their placements.

| # | Working name | X | Y | Z | Rotation |
| ---: | --- | ---: | ---: | ---: | ---: |
| 1 | IVth Cohort Secutor | -528.554 | -2.593 | -5.994 | 0.654 |
| 2 | IVth Cohort Signifer | -524.967 | -3.286 | -13.225 | 0.626 |
| 3 | IVth Cohort Sagittarius | -516.790 | -2.241 | -9.727 | 2.197 |
| 4 | IVth Cohort Hoplomachus | -516.517 | -3.670 | 2.379 | 1.810 |
| 5 | IVth Cohort Secutor | -503.788 | -2.540 | -4.555 | 2.195 |
| 6 | IVth Cohort Sagittarius | -502.404 | -3.059 | -14.434 | 1.776 |

## Imperial Gate Encounter

All actors in this group are Imperials. Every member of this designated gate
encounter must be defeated before the gate is eligible to open.

| # | Working name | X | Y | Z | Rotation |
| ---: | --- | ---: | ---: | ---: | ---: |
| 1 | IVth Cohort Secutor | -588.912 | -3.558 | -59.721 | 0.924 |
| 2 | IVth Cohort Sagittarius | -581.545 | -3.738 | -66.950 | 0.876 |
| 3 | IVth Cohort Hoplomachus | -576.876 | -3.520 | -56.560 | 0.796 |
| 4 | IVth Cohort Laquearius | -585.177 | -2.301 | -47.318 | 0.778 |
| 5 | IVth Cohort Secutor | -573.919 | -2.422 | -47.670 | 0.825 |
| 6 | IVth Cohort Signifer | -562.786 | -3.478 | -46.301 | 0.790 |
| 7 | IVth Cohort Sagittarius | -553.698 | -1.853 | -56.827 | 0.809 |
| 8 | IVth Cohort Medicus | -560.520 | -2.557 | -68.209 | 0.854 |
| 9 | IVth Cohort Eques | -590.325 | -3.560 | -76.508 | 0.790 |
| 10 | IVth Cohort Decurion | -592.519 | -3.575 | -74.093 | 0.790 |

## Gate Identity

- Server unique ID: `castrum_novum_gate_19111`
- Position: `(-592.432, -3.580, -76.252)`
- Map-object layout ID: `501`
- Map-object instance ID: `19111`
- Actor class: `5900015` (`DoorServer`)
- Observed runtime actor ID: `0x45F0008F` (`1173356687`)
- Observed animation evidence: outbound opcode `0x00D9` (`PlayBGAnimation`)

The runtime actor ID is session-specific and must not be persisted as the gate's
identity. Instance logic should resolve the gate by its unique ID or its stable
`(layoutId, instanceId)` pair.

## Gate Unlock Contract

The gate may open only when both conditions are true:

1. Every mob in the designated Imperial Gate Encounter is defeated.
2. At least 80% of all eligible mobs successfully spawned and tracked by this
   instance have been defeated.

Use an integer comparison so the threshold has no floating-point or rounding
ambiguity:

```text
eligibleSpawnCount > 0
and defeatedCount * 100 >= eligibleSpawnCount * 80
```

Equivalently, the required defeated count is
`ceil(eligibleSpawnCount * 0.80)`. Only genuine defeat/death completion counts;
ordinary despawns, unloads, failed spawns, and administrative removals do not.
The counts are private to the instance and must not include public-zone mobs or
mobs belonging to another instance.

Once both conditions are satisfied, latch the gate open for the remainder of
that instance. Later spawns must not close it again.

## Post-Gate Map Marker

When the first gate, `castrum_novum_gate_19111`, transitions to its latched-open
state, display the next guildleve-style objective circle on both the minimap and
the main map at:

- Position: `(-672.059, -7.300, -37.886)`
- Rotation: `2.753`
- Appearance trigger: first gate successfully opens
- Disappearance trigger: second gate `castrum_novum_gate_19269` successfully
  opens
- Scope: players belonging to this instance only

This marker is distinct from the earlier First-Clear Map Marker. Whether the
earlier marker is removed at this transition or remains visible is not yet
specified.

## Southern Out-of-Bounds Boundary

Create an invisible east-west boundary line through the supplied point:

- Reference position: `(-516.414, -4.488, 117.397)`
- Reference facing: south, rotation `-0.138`
- Boundary plane in X/Z space: `Z = 117.397` (unbounded east-west)
- Allowed instance side: north of the line, `Z <= 117.397`
- Blocked side: south of the line, `Z > 117.397`
- Valid-side normal: `(0.0, -1.0)`

The content-area configuration is:

```lua
contentArea:SetBoundaryLine(-516.414, 117.397, 0.0, -1.0)
```

When a player attempts to cross south of the line, reject that movement and
return the player to their previous valid position. The existing instance-line
boundary handler supplies this server-authoritative correction and the standard
`You cannot pass this boundary.` message. This boundary is instance-local and
must not affect players in the corresponding public area.

## Ogre Patrol

Spawn one ogre on a slow back-and-forth patrol along these ordered points:

| # | X | Y | Z | Rotation |
| ---: | ---: | ---: | ---: | ---: |
| 1 | -633.530 | -2.902 | -75.154 | 1.741 |
| 2 | -628.268 | -3.483 | -76.056 | 1.741 |
| 3 | -617.601 | -3.861 | -77.884 | 1.741 |

Patrol mode is ping-pong: `1 -> 2 -> 3 -> 2 -> 1`, repeating for as long as
the ogre is alive and not engaged. It should walk rather than run and resume its
patrol after combat reset.

The ogre has both true sight and true sound. Its aggro check must therefore
ignore player concealment effects that normally defeat sight or sound detection;
stealth must not allow a player to bypass this patrol. Exact detection radius,
walking speed, endpoint pause, combat level, and final enemy name remain to be
selected.

## Dual Magitek Circuit Patrol

Spawn two Magitek enemies at different points on one shared closed circuit.
Both follow the ordered route `1 -> 2 -> ... -> 9 -> 1` continuously while idle.

| # | X | Y | Z | Rotation |
| ---: | ---: | ---: | ---: | ---: |
| 1 | -713.312 | -5.105 | -41.114 | 0.027 |
| 2 | -713.012 | -4.626 | -30.722 | 0.029 |
| 3 | -717.501 | -3.281 | -17.753 | -0.678 |
| 4 | -718.968 | -2.184 | -5.278 | 0.243 |
| 5 | -706.109 | -3.784 | -2.902 | 2.937 |
| 6 | -704.589 | -4.334 | -11.794 | -3.050 |
| 7 | -710.154 | -4.010 | -23.392 | -2.560 |
| 8 | -712.722 | -4.131 | -26.994 | -2.981 |
| 9 | -714.569 | -5.191 | -38.649 | -2.984 |

- Magitek A starts at point 1: `(-713.312, -5.105, -41.114)`.
- Magitek B starts at point 5: `(-706.109, -3.784, -2.902)`.
- Both initially travel in the same numbered direction around the circuit.
- Each resumes its circuit after an ordinary combat reset.
- Each Magitek is an eligible spawned mob and counts separately toward the
  instance-wide 80% gate-unlock threshold.

Patrol speed, endpoint dwell behavior, detection type/radius, combat level, and
final Magitek variants remain to be selected.

## Imperial Mage Patrol

Spawn one **IVth Cohort Signifer** as a roaming Imperial mage. It walks slowly
back and forth along this ordered route:

| # | X | Y | Z | Rotation |
| ---: | ---: | ---: | ---: | ---: |
| 1 | -642.794 | -4.254 | -28.142 | -0.029 |
| 2 | -642.614 | -4.216 | -34.441 | 3.113 |
| 3 | -642.316 | -4.322 | -44.842 | 3.113 |
| 4 | -642.031 | -4.175 | -54.784 | 3.113 |
| 5 | -641.730 | -3.725 | -65.302 | 3.113 |

Patrol mode is ping-pong: `1 -> 2 -> 3 -> 4 -> 5 -> 4 -> 3 -> 2 -> 1`,
repeating while the Signifer is alive and idle. It walks rather than runs and
resumes the route after an ordinary combat reset.

The Signifer has true sight, so sight-concealment and stealth effects must not
prevent its visual aggro. It does not have true sound unless that trait is added
later. This enemy counts toward the instance-wide 80% gate-unlock threshold.
Exact detection radius, endpoint pause, combat level, and spell kit remain to be
selected.

## Imperial Secutor Patrol

Spawn one **IVth Cohort Secutor** as a non-caster melee patrol. It walks slowly
back and forth along these points:

| # | X | Y | Z | Rotation |
| ---: | ---: | ---: | ---: | ---: |
| 1 | -637.945 | -2.926 | -71.625 | -0.029 |
| 2 | -638.118 | -3.725 | -65.552 | -0.029 |
| 3 | -638.310 | -3.987 | -58.816 | -0.029 |

Patrol mode is ping-pong: `1 -> 2 -> 3 -> 2 -> 1`, repeating while the
Secutor is alive and idle. It walks rather than runs and resumes the route after
an ordinary combat reset.

The Secutor has true sight, so sight-concealment and stealth effects must not
prevent its visual aggro. It does not have true sound unless that trait is added
later. This enemy counts toward the instance-wide 80% gate-unlock threshold.
Exact detection radius, endpoint pause, combat level, and weapon kit remain to
be selected.

## Stationary Magitek

Spawn one stationary Magitek enemy at:

- Position: `(-611.143, -3.646, -81.170)`
- Rotation: `-1.177`
- Patrol: none

This Magitek holds its authored position while idle, uses ordinary combat chase
and reset behavior, and returns to this spawn point after a reset. It counts
toward the instance-wide 80% gate-unlock threshold. Its exact variant, combat
level, and detection configuration remain to be selected.

## First Boss: Imperial Juggernaut

After every eligible pre-boss mob successfully spawned by the instance has been
defeated, spawn the first boss. The trigger is stricter than the first gate's
80% unlock threshold:

```text
eligiblePreBossSpawnCount > 0
and defeatedPreBossCount == eligiblePreBossSpawnCount
```

The boss is the Magitek enemy used by the mission **Futures Perfect**:

- Name: **Imperial Juggernaut**
- Battle-NPC mob type ID: `3058` (`imperial_juggernaut`)
- Actor class ID: `2202401`
- Source version: the level-50 Futures Perfect encounter actor
- Boss spawn position and rotation: not yet supplied

The boss must spawn only once per encounter generation. Imperial adds created
by the boss are encounter-owned mobs and are not part of the completed pre-boss
roster; they cannot retrigger the boss spawn or change the already-latched first
gate state.

### TODO: Missile Circles

- At intervals, target multiple living party members with visible missile-impact
  circles.
- Telegraph each selected impact location before damage resolves so players can
  move out of it while continuing the boss fight.
- Target selection should be random among valid living encounter participants.
- When fewer players are available than the configured target count, cap the
  number of distinct targets at the number of valid players.
- Circle radius, telegraph duration, number of simultaneous targets, damage,
  cadence, animation/effect IDs, and whether later phases create repeated circles
  on the same player remain to be selected and implemented.

### TODO: Random Imperial Adds

- During combat, randomly spawn Imperial reinforcements that immediately join
  the encounter and attack valid party members.
- Adds must be private to this instance and linked to the boss encounter.
- Clean up living adds when the encounter resets or the instance is destroyed.
- Add roster, count per wave, spawn positions, spawn cadence, randomization
  weights, simultaneous-add cap, and boss-health phase rules remain to be
  selected and implemented.

Boss reset behavior, pre-boss-clear persistence after a party wipe, boss level
scaling, and rewards remain to be specified.

## First-Boss Completion: Second Gate

After the Imperial Juggernaut is defeated, perform one atomic instance
progression transition:

1. Open the second gate and latch it open for the remainder of the instance.
2. Remove the Post-Gate Map Marker at `(-672.059, -7.300, -37.886)` from both
   the minimap and the main map for every player in the instance.

Second-gate identity:

- Server unique ID: `castrum_novum_gate_19269`
- Position: `(-708.343, -5.439, -87.934)`
- Map-object layout ID: `501`
- Map-object instance ID: `19269`
- Actor class: `5900015` (`DoorServer`)
- Observed runtime actor ID: `0x45F00090` (`1173356688`)

The runtime actor ID is valid only for the observed server session. Resolve the
gate by unique ID or stable `(layoutId, instanceId)` in instance logic.

The supplied capture shows the player moving from the marker location toward
this gate and actor `0x45F00090` receiving its lifecycle, property, and
`SetActorBGProperties` (`0x00D8`) presentation packets. The excerpt does not
contain the separate `PlayBGAnimation` (`0x00D9`) packet, so it identifies the
gate binding but does not independently capture the exact open animation name.

## Post-Second-Gate Map Markers

When `castrum_novum_gate_19269` opens, display two guildleve-style objective
circles simultaneously on both the minimap and the main map:

| Marker | X | Y | Z | Rotation |
| ---: | ---: | ---: | ---: | ---: |
| 1 | -747.329 | -4.364 | -135.631 | -0.320 |
| 2 | -764.154 | -3.003 | -193.374 | -2.573 |

- Appearance trigger: second gate successfully opens after the Imperial
  Juggernaut is defeated.
- Scope: players belonging to this instance only.
- Both markers appear as part of the same progression transition in which the
  previous marker at `(-672.059, -7.300, -37.886)` is removed.
- The objective represented by each marker and its disappearance condition
  remain to be specified.

## Short-Route Ahriman

Spawn one **Ahriman** at the supplied position and give it a short patrol in the
direction it initially faces:

- Start: `(-733.733, -4.353, -111.488)`
- Initial rotation: `1.746`
- Forward distance: `8.0` yalms
- Calculated endpoint: `(-725.855, -4.353, -112.882)`

The endpoint uses the server's facing convention:

```text
endX = startX + sin(rotation) * 8
endZ = startZ + cos(rotation) * 8
```

Patrol mode is a slow walking ping-pong route from the start to the endpoint and
back. The runtime pathfinder should ground the endpoint Y to the local terrain
rather than blindly retaining `-4.353` if the walkable surface differs. The
Ahriman resumes this short route after an ordinary combat reset. Detection type,
combat level, exact Ahriman variant, endpoint pause, and relationship to the two
post-second-gate objectives remain to be specified.

## Second Short-Route Ahriman

Spawn a second **Ahriman** with its own short patrol in the direction it
initially faces:

- Start: `(-712.896, -4.051, -132.374)`
- Initial rotation: `-2.170`
- Forward distance: `7.0` yalms
- Calculated endpoint: `(-718.676, -4.051, -136.322)`

Patrol mode is a slow walking ping-pong route from the start to the endpoint and
back. As with the first Ahriman, ground the calculated endpoint Y to the local
walkable terrain at runtime and resume the route after an ordinary combat reset.
Detection type, combat level, exact Ahriman variant, endpoint pause, and
objective relationship remain to be specified.

## Five Short-Route Imperial Patrols

Spawn five different Imperial classes. Each walks forward `5.0` yalms from its
authored start and then walks back, repeating that individual ping-pong route
while alive and idle. All five use initial rotation `0.319`, which produces the
shared X/Z offset `(1.568, 4.748)`.

| # | Imperial class | Start X | Start Y | Start Z | Endpoint X | Endpoint Y | Endpoint Z |
| ---: | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 1 | IVth Cohort Secutor | -750.477 | -0.751 | -169.520 | -748.909 | -0.751 | -164.772 |
| 2 | IVth Cohort Sagittarius | -755.241 | -1.648 | -183.967 | -753.673 | -1.648 | -179.219 |
| 3 | IVth Cohort Hoplomachus | -759.023 | -2.756 | -195.438 | -757.455 | -2.756 | -190.690 |
| 4 | IVth Cohort Laquearius | -764.100 | -3.584 | -201.767 | -762.532 | -3.584 | -197.019 |
| 5 | IVth Cohort Eques | -764.047 | -5.788 | -220.043 | -762.479 | -5.788 | -215.295 |

Each patrol should use a walking pace, ground its calculated endpoint Y to the
local walkable terrain, and resume after an ordinary combat reset.

All five Imperials have true sight. Sight-concealment and stealth effects must
not prevent their visual aggro; they do not have true sound unless added later.
These are post-second-gate mobs and are not part of the already-completed
pre-boss roster or its Imperial Juggernaut spawn condition. Exact detection
radius, endpoint pause, combat levels, and weapon/ability kits remain to be
selected.

## Stationary Post-Gate Ogre

Spawn one stationary ogre at:

- Position: `(-792.890, 1.365, -179.023)`
- Rotation: `1.847`
- Patrol: none

The ogre holds its authored position while idle, may chase normally after
entering combat, and returns to this position after an ordinary combat reset.
It is a post-second-gate mob and is not part of the pre-boss roster or Imperial
Juggernaut spawn condition. Detection type/radius, combat level, exact ogre
variant, and ability kit remain to be selected.

## Post-Second-Gate Clear: Third Gate

The third gate opens only after every eligible mob in the post-second-gate phase
has been defeated:

```text
eligiblePostSecondGateSpawnCount > 0
and defeatedPostSecondGateCount == eligiblePostSecondGateSpawnCount
```

The currently documented phase roster contains eight mobs: two Ahrimans, five
short-route Imperials, and one stationary ogre. The implementation should track
the successfully spawned eligible roster instead of hard-coding `8`, so later
authored mobs are included automatically. Ordinary despawns, unloads, failed
spawns, and administrative removals do not count as defeats.

Third-gate identity:

- Server unique ID: `castrum_novum_gate_19270`
- Position: `(-772.664, -4.959, -236.065)`
- Map-object layout ID: `501`
- Map-object instance ID: `19270`
- Actor class: `5900015` (`DoorServer`)
- Observed runtime actor ID: `0x45F00091` (`1173356689`)

Before the phase reaches 100% defeated, keep this gate closed in the instance
even if the shared public-zone door policy would normally open it by proximity.
When the clear condition becomes true, open the gate once and latch it open for
the remainder of the instance.

The supplied capture directly confirms the binding: `WorldDoorPassage` reports
`castrum_novum_gate_19270`, layout `501`, instance `19270`, actor `0x45F00091`,
and state `open`; the following transport diagnostic records `0x00D9` from
`1173356689`. The runtime actor ID remains session-specific, so instance logic
must resolve the stable unique ID or `(layoutId, instanceId)` pair.

The disappearance behavior of the two post-second-gate map markers when this
gate opens remains to be specified.

## TODO: Special Mobs and Bonus Chests

When the second gate, `castrum_novum_gate_19269`, opens after the Imperial
Juggernaut is defeated, spawn or enable two optional, very high-level special
mobs in the newly available phase.

### Special Mob 1: High-Level Ogre

- Position: `(-875.540, -6.578, -175.911)`
- Rotation: `0.843`
- Patrol: none unless specified later
- Defeat flag: `optionalOgreDefeated`
- Reward: adds one bonus chest

### Special Mob 2: High-Level Ahriman

- Position: `(-810.049, -6.581, -45.850)`
- Rotation: `1.012`
- Patrol: none unless specified later
- Defeat flag: `optionalAhrimanDefeated`
- Reward: adds one bonus chest

Both special mobs are deliberately excluded from every mandatory mob
denominator and clear check. Players do not need to defeat either one to open
the third gate or continue the instance. Neither actor is included in
`eligiblePostSecondGateSpawnCount`.

Each defeat flag is instance-local and persists through later party wipes and
ordinary encounter resets. At the instance's normal reward transition, compute
the cumulative chest count as:

```text
rewardChestCount = 1
    + (optionalOgreDefeated ? 1 : 0)
    + (optionalAhrimanDefeated ? 1 : 0)
```

Reward outcomes are therefore:

| Special mobs defeated | Total chests |
| ---: | ---: |
| 0 | 1 |
| 1 | 2 |
| 2 | 3 |

Each special-mob victory adds a separate chest; it does not replace or upgrade
the normal chest. Spawn the final chest set only once per instance, including
under repeated completion callbacks or player reconnects.

TODO: select both mobs' exact levels, names/variants, detection types, ability
kits, activation presentation, leash/reset behavior, chest positions, and loot
tables. We will return to the complete special-mob encounter and reward design
later.

## TODO: Stat-Derived Level-Difference Scaling

Evaluate a Castrum Novum-specific effective-power adjustment for level-difference
combat scaling. All participants remain displayed as level 50 and the admission
requirement remains level 50, but the scaling calculation should consider the
player's equipped combat stats as an item-level-like measure of gear strength.

The evaluation should determine whether a very well-geared player may partially
offset the damage and accuracy penalties imposed by enemies above level 50, and
whether a well-geared tank may partially reduce the corresponding incoming
damage bonus. Derive the adjustment from relevant active stats rather than from
an invented visible item level. Use role-appropriate inputs such as defense,
HP/VIT, block or parry for tanks; accuracy, attack, and offensive potency for
physical jobs; magic accuracy and potency for casters; and healing potency and
MP for healers.

Any resulting effective-level contribution must be capped, must not double-count
stats already used by the normal damage and accuracy formulas, and must never
allow gear to negate avoidable mechanics, missile circles, or encounter-scripted
lethal damage. Mandatory encounters should be tuned for strong level-50 dungeon
gear, while the optional special mobs may assume near-best-in-slot equipment.
No scaling implementation or final coefficients are selected yet.

## Final Encounter Set Anchor

Use the following point immediately beyond the third gate as the anchor for the
final required encounter set:

- Position: `(-773.883, -4.722, -240.104)`
- Rotation: `-2.033`
- Availability: after `castrum_novum_gate_19270` opens

The final set's mob composition, individual placements, patrols, detection
rules, spawn presentation, clear condition, and completion transition remain to
be supplied. This anchor alone does not create an additional map marker or
boundary.
