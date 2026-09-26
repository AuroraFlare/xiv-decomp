# Bowl of Embers battlefield, Eruption, and Radiant Plume

## Result

The installed Bowl layout now has a recovered, byte-level fire-ring scheduler
surface: group `sgrp_vfx_ifring`, layout instance candidate `isgrp_016280`,
show/hide/VFX timelines, collision, and dependencies. The server still has no
recovered live map-object owner/call that addresses that layout group, so its
runtime initial state and trigger order remain open. Full offsets, hashes, and
dependency closure are in
[EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md](EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md).

That persistent boundary ring is separate from Eruption and Radiant Plume. At
Lua SHA `f868e997...`, Hard now has explicit class-`2207310` helper
choreography for Eruption and Plume, while Normal and Extreme retain their
ordinary command queues. This closes the current server-side helper owner and
cleanup path for Hard, but not the visible target-ground resource join: the
current helpers cast private commands through their canonical WSS donors rather
than selecting the strongest decoded candidates. Those candidates remain Ifrit
WSS banks 10 and 12-14, with effect/helper banks 21-22 as secondary probes.
They are candidates, not safe numeric substitutions.

## Battlefield identity and live construction

| Evidence | Recovered/current value |
|---|---|
| Zone rows | zones 240 and 265, region 104, internal layout wil0Field05a, display The Bowl of Embers |
| Zone used by the manager | 240 only; loaded region must equal 104 |
| Private-area class | /Area/PrivateArea/Occupancy/RaidDungeonSimple |
| Private-area name | BowlOfEmbers |
| Bootstrap shell | Instance/CircularArena128 |
| Music | 23 in the zone rows, manager, and content script |
| Weather | 8074, applied on zone-in by BowlOfEmbers.lua |
| Boundary | center X/Z (2527.994, 2208.178), radius 22.0 |
| Entry | (2513.976, 247.161, 2201.567), rotation 1.208 |

IfritManager creates PrivateAreaContent without a content group, sets music and
the circular server boundary, creates the selected
Ifrit raid director, changes its CurrentArea to the private battlefield,
replaces the bootstrap shell director, and ends the shell. The replacement
director remains registered to the parent zone so normal teardown still works.

This establishes battlefield ownership, but not a layout-floor-VFX owner. The
current Ifrit manager/director/content scripts contain no PlayBGAnimation,
PlayMapObjAnimation, or equivalent Bowl map-object call. Static spawn tables
contain no Ifrit-family B/NPC rows keyed to zones 240/265, and
server_eventnpc_mapobj.sql has no zone-aware Ifrit binding. Bosses, clones,
Nails, Hard mechanic helpers, and attack geometry are created by the encounter
director; those actor helpers are separate from the installed ring layout.

The captured center, Nail positions, Cyclone lanes, and 22-yalm boundary are
server reconstruction coordinates. No decoded client row was found that anchors
Eruption or Plume art to those coordinates.

## Actor/helper family

Appearance base 10852 is client model m852, 10524 is Nail model m524, and 1255
is the helper/invisible base.

| Actor class IDs | Current class | Display class | Appearance/model |
|---|---|---:|---|
| 2207301 | IfritNormal | 3207301 | 10852 / m852 |
| 2207302, 2207303 | IfritNormal | 3207302 | 10852 / m852 |
| 2207304, 2207305 | IfritDummy | 3207302 | 1255 / helper |
| 2207306, 2207307 | IfritAnchor | 3207303 | 10524 / m524 |
| 2207308, 2207309 | IfritNormal | 3207302 | 10852 / m852 |
| 2207310 | IfritHotAir | 3207302 | 1255 / helper |
| 2207311 | IfritNormal | 3207304 | 10852 / m852 |
| 2207312 | IfritDummy | 3207304 | 1255 / helper |
| 2207313, 2207315 | IfritAnchor | 3207303 | 10524 / m524 |
| 2207314 | **IfritDummy** | 3207304 | **10852 / m852** |

The unusual 2207314 combination matters: its current class is IfritDummy, but it
renders with the full m852 appearance. Conversely, 2207310 IfritHotAir uses
helper base 1255. Current Hard combat now proves that `2207310` is the chosen
server caster for its placed Plumes and any second Eruption train. That does not
prove retail ownership, prove that appearance base 1255 resolves to `m999`, or
show which actor-bound resource the 1.23b client ultimately renders.

## Command IDs and current server banks

The English 1.x command sheet identifies the canonical names. “Bank” below is
the current SQL modelAnimation/battleAnimation pairing, not a decoded retail
command-to-WSS lookup. B1 through B4 mean 0x13001000 through 0x13004000.

| Command ID(s) | Recovered name | Current bank |
|---|---|---|
| 23360 | Attack | B1 |
| 23361 | Sear | B1 |
| 23362 | Vulcan Burst | B1 |
| 23363 | Incinerate | B1 |
| 23364 | Eruption | B2 |
| 23365 | Crimson Cyclone | B1 |
| 23366 | hidden/control | B1 |
| 23367 | Radiant Plume | B1 |
| 23368 | Hellfire | B1 |
| 23369-23373 | hidden/control | B1 |
| 23374 | Eruption | B1 |
| 23375 | Eruption | B2 |
| 23376 | Radiant Plume | B3 |
| 23377-23378 | hidden/control | B1 |
| 23404 | Radiant Plume | B1 |
| 23408 | Hellfire | B1 |
| 23409 | Hellfire | B2 |
| 23577 | Sear | B1 |
| 23578 | Vulcan Burst | B1 |
| 23579 | Incinerate | B1 |
| 23580 | Crimson Cyclone | B1 |
| 23581 | Hellfire | B1 |
| 23582 | Eruption | B1 |
| 23583 | Radiant Plume | B2 |
| 23592 | Eruption | B1 |
| 23593 | Radiant Plume | B2 |
| 23594 | Eruption | B3 |
| 23595 | Radiant Plume | B4 |

The local private command family is complete and intentionally separate:

| Private ID | Name | Server geometry | Current bank |
|---:|---|---|---|
| 23980 | ifrit_sear | circle, radius 8 | B1 |
| 23981 | ifrit_vulcan_burst | circle, radius 16 | B1 |
| 23982 | ifrit_incinerate | cone, range 10, angle 1.5708 | B1 |
| 23983 | ifrit_eruption | circle, radius 8, selected ground/target | B1 |
| 23984 | ifrit_crimson_cyclone | line, range 44; burn 223148 | B1 |
| 23985 | ifrit_radiant_plume | circle, radius 16 | B2 |
| 23986 | ifrit_hellfire | circle, radius 50 | B1 |
| 23987 | ifrit_radiant_plume_center | circle, radius 16 | B2 |
| 23988 | ifrit_radiant_plume_outer | donut, outer 22 / inner 8 | B2 |

These private rows prove the default damage shapes, not their floor art. They
contain no Eruption/Plume coordinate array or helper-actor/VFX resource
identifier; the current Hard encounter supplies its helper placement and one
owner-scoped final-Plume geometry override separately.

The `Current bank` column above is the private SQL row's stored animation
field. Before the action result is sent, the presentation resolver maps the
Normal/Hard private IDs to canonical public donors: `23983 -> 23364/WSS2`,
`23987 -> 23376/WSS3`, and `23988 -> 23404/WSS1`. Those resolved donors are
what the current-helper discussion below means by WSS2/WSS3/WSS1.

## Current Hard helper choreography

This section is current at Lua SHA `f868e997...` and
`monster_tp.lua` SHA `c242cc16...`:

- `spawnMechanicHelper` creates actor class/appearance `2207310`
  (`IfritHotAir`) at an authored point, makes it inert, invulnerable,
  untargetable, and hidden from encounter combat presentation, publishes it to
  ready players, and tracks it for cleanup. The presentation flag suppresses
  combat UI; it does not hide the model. Because the helper calls it with
  `broadcast=false` before first instantiation, it also does not emit the
  newer blank actor-name packet. Runtime capture must therefore check both
  helper-model visibility and any residual grey base name.
- Every Eruption train has three pulses. The first train casts private `23983`
  from the real Ifrit. Post-Hellfire Hard can run a second simultaneous train
  from a `2207310` helper at arena center. Initial targets are shuffled from
  alive players with the top-hate target excluded when possible. Each pulse
  snapshots that train target's current position at cast start.
- The damage engine resolves Eruption at that snapshot, but the action result
  still carries source and target actors rather than an arbitrary ground
  coordinate. Current presentation therefore remains the private-command
  canonical donor, WSS2; WSS4, WSS10, WSS21, and WSS22 are not selected.
- Center and outer Plumes cast from a `2207310` helper at arena center. The
  post-Hellfire final Plume casts from a helper at Ifrit's current position.
  Center uses private `23987` and canonical WSS3; outer/final use private
  `23988` and canonical WSS1.
- The final helper sets `ifrit.plume.full_floor`. The owner-scoped execution
  copy in `monster_tp.lua` changes only that cast to outer radius 50, inner
  safe radius 8, producing a full-arena donut around the helper without
  mutating the ordinary 22/8 command definition.
- Helper state is updated in the main combat loop and cleaned after command
  completion, failure, or encounter teardown. Normal and Extreme do not use
  this managed helper path.

## Client WSS candidates

Logical source root:
client/chara/mon/m852/act/emp_emp/wss/base

| WSS | Decoded content | Assessment |
|---|---|---|
| 0004 | sp_a02, 80 frames / 2.667 s; explicit m852_0004_fire; motion-emission controls | Eruption/fire-helper candidate, **medium** |
| 0010 | abl_3, 70 frames / 2.333 s; unique rock_u04 plus fire, glow, and distortion | Strongest content-based Eruption candidate, **medium-high** |
| 0012 | sp_b03, 130 frames / 4.333 s; first distinct large fire layout | Plume-pattern candidate, **medium** |
| 0013 | sp_b03, 130 frames / 4.333 s; second distinct large fire layout | Plume-pattern candidate, **medium** |
| 0014 | sp_b03, 130 frames / 4.333 s; third distinct large fire layout | Plume-pattern candidate, **medium** |
| 0021 | no outer Ifrit MTB; kuroko_999/skill02-03 helper VFX with fire/rock | Invisible-proxy ground-AoE candidate, **medium-low** |
| 0022 | no outer Ifrit MTB; kuroko_999/skill02-03 helper VFX with fire/rock | Invisible-proxy ground-AoE candidate, **medium-low** |

WSS 12-14 share a motion whose Y curve rises to about 9.329, so they may instead
be Hellfire variants. Similar fire/rock vocabulary cannot establish identity.
The unresolved SCB layer prevents an exact command/event/effect graph.

## Retail capture observations

| Reviewed sequence | Visible result | Limit |
|---|---|---|
| hardcyclone_254..272 | perimeter fade/glow/copies, then bright fiery dash and impact | Strong presentation reference; not an Eruption/Plume link |
| hardlong_416..428 | Nail starts as ember/thin rise, becomes a tall burning spike, then persists/pulses | Strong Nail activation/persistence reference |
| normal_245, hyper_152, hyper_154 | tall glowing Nail | Corroborates state, not an exact packet/bank |
| hyper_212, hyper_214 | several lava/fire patches on the ground | Ground fire is visible; Eruption-versus-Plume attribution is only **medium** confidence |

## Scheduler transport boundary

Map-object animation opcode `0x00D9` has an eight-byte body. The sender writes
at most eight ASCII characters, and `Npc.PlayMapObjAnimation` simply queues it.
Long WSS paths, `m852_0004_fire`, and cinematic effect names cannot be sent
through that opcode. Bytes 4-7 must not be invented as an offset: all eight
bytes belong to its scheduler-name contract.

The later server audit recovered a second transport:
`Npc.RunMapObjScheduler` uses `RunEventFunctionPacket` opcode `0x0130` and
`_runBgSchedulerFromMidstream(scheduler, offsetSeconds)`, accepting 1-64
printable ASCII characters plus an offset from 0 to 3600 seconds. It can carry
the long Bowl timeline names. Both transports still require a proven live
server `Npc` map-object owner instantiated for the receiving player; that owner
has not been recovered. See
[EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md](EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md).

## Recovered scene and cinematic clues

Recovered InstanceRaidLesserIfrit.processStartEvent conditionally calls
executeCutScene("GC010105", owner, true, 0, arg). The current encounter's initial
replay passes scene "none", so the Lesser opening is not currently used. That is
a scene-parity gap, not proof of combat WSS ownership.

Supplemental roots include client/cut/man30850/man30850,
client/cut/man30880/man30880, client/cut/man40640/man40640, and
client/cut/sum6a000/sum6a000. man30850/man30880 reference wil_w0_fld05,
cinematic m852 motion such as skl_m852b001, and effects c18_chrge, c20_breth,
c16_breth, c07_ifsmk, c08_ifsmk, c21_fire1, c01_breth, and c01_chrge. These
prove visual vocabulary and battlefield/model association only. They must not
be relabeled as combat Eruption, Plume, Nail, dash, or jump effects without
runtime linkage.

## Audit conclusion

The current Hard helper path is real and fully wired, but it does not select the
decoded banks most strongly associated with ground Eruption and Plume layouts.
Runtime probes should distinguish the current canonical donors from WSS10,
WSS12-14, and helper/effect-only WSS21-22, and should record whether class
`2207310` is actually invisible while its action effect renders. No WSS,
cinematic effect, map-object scheduler, or appearance-to-`m999` mapping is
treated as retail-proven until a client trace or decoded SCB/event edge supplies
the missing join.
