# Ifrit Bowl arena-tile exhaustive instance decomp

Audit date: 2026-08-05

## Result

The installed Bowl of Embers layout does **not** contain a hidden placed
Radiant Plume pattern, an Eruption target-placement rig, or Infernal Nail spawn
points under an unrelated name.

The scan is structural rather than keyword-based. It discovers every
`RefObjects/InstanceObject` from the layout's runtime class descriptor, decodes
its world transform and referenced node, and selects every instance inside the
exact 64-by-64 divide-map bounds of the Bowl floor tile:

```text
X 2496.0 .. 2560.0
Z 2176.0 .. 2240.0
tile center (2528.0, 248.0, 2208.0)
```

The complete `wil_w0_fld05` layout contains 225 decoded instance objects. Only
six fall inside those bounds:

1. the ordinary `w0f0` floor and collision group;
2. the Bowl-specific `w0f5` floor chip;
3. the one placed Ifrit boundary-ring group;
4. one named `w0f5_bbr1_Boss` position marker;
5. one light 77.85 units below the floor;
6. one ordinary bridge-lamp group at the outer corner of the tile.

The only mechanic-looking placed VFX in the arena proper is the already known
single boundary ring. There is no repeated group that could form the Plume
circle/donut, no stationary helper array, and no placed Nail set. Consequently:

- Eruption's target-snapshot warning remains the actor/helper-owned
  `m999/e001` state-5 package with its own `Position3DMapBind` graph.
- Radiant Plume remains one localized `m999/e001` state-4 package per stationary
  owner/origin. The encounter must create the desired pattern through multiple
  owners or an unrecovered server placement list; the battlefield layout does
  not supply that list.
- Infernal Nails remain separate `m524/e002` actors. Their spawn and defeat
  presentation does not come from placed Bowl map objects.

This closes the most useful battlefield branch: continuing to hunt the arena
layout for the three combat visuals is now lower value than making the exact
model-state/helper chains render.

## Source and reproducibility

| Field | Value |
|---|---|
| Installed resource | `data/61/5A/00/08.DAT` |
| Resource identity | `MapLayoutResourceData`, `wil_w0_fld05` |
| Bytes | 1,245,056 |
| SHA-256 | `56b24e6aca53911810848baf7be254a2c20038d8c127bcc0c8603ba6b0614e7c` |
| Layout base, physical | `0x5450` |
| Layout size | `0x12AB60` |
| Declared node count | 7,526 |
| Decoded instance count | 225 |

The reproducible extractor is
`tools/extract_ifrit_bowl_layout_neighborhood.py`. It verifies the source hash,
discovers the class descriptors, enumerates instance nodes, follows their
references, expands every UnitTree in the arena tile, and parses the embedded
ring scheduler records.

Generated evidence:

- `tools/outputs/ifrit-bowl-layout-neighborhood-20260805/arena_tile_instances.csv`
- `tools/outputs/ifrit-bowl-layout-neighborhood-20260805/arena_tile_unit_members.csv`
- `tools/outputs/ifrit-bowl-layout-neighborhood-20260805/ring_scheduler_clips.csv`
- `tools/outputs/ifrit-bowl-layout-neighborhood-20260805/summary.json`

## Every instance in the Bowl tile

| Instance | Position | Distance from tile center | Referenced object | Exact contents | Classification |
|---|---|---:|---|---|---|
| `isgrp_000396` | `(2528.000, 248.000, 2208.000)` | 0.000 | `sgrp_w0f0_def0_fl0_h` | one BG chip, one attribute | ordinary regional floor/collision |
| `isgrp_016281` | `(2528.000, 248.000, 2208.000)` | 0.000 | `sgrp_w0f5_def0_fl0_h` | one BG chip | Bowl-specific floor chip |
| `isgrp_016280` | `(2526.597, 248.343, 2208.061)` | 1.404 | `sgrp_vfx_ifring` | one VFX, five timelines, two attributes, one sound | persistent Bowl boundary ring |
| `w0f5_bbr1_Boss` | `(2516.000, 246.919, 2212.000)` | 12.649 | `pomk_0006` | PositionMarker | sole placed marker in the tile |
| `isgrp_007349` | `(2520.917, 170.147, 2225.860)` | 19.213 | `sgrp_lght_pointA` | one light | underground lighting, 77.853 below floor |
| `isgrp_007144` | `(2551.625, 247.880, 2236.699)` | 37.172 | `sgrp_w0f0_br_lmp1_h` | bridge part, collision, two generic fire VFX, sound, light, one fade timeline | ordinary edge lamp |

`w0f5_bbr1_Boss` is a confirmed exact marker name and position, and it is the
only PositionMarker instance in the tile. The word `Boss` makes its intended
role a strong semantic candidate, but no recovered server selector proves that
retail spawned Ifrit from it. It must not be silently substituted for a
captured server spawn point.

The edge lamp is not a concealed combat effect. Its group is the reusable
`sgrp_w0f0_br_lmp1_h`, and its named members are bridge geometry, ordinary
collision, `vfx_fire002`, `vfx_fire0f2`, `sdef_0006`, a bridge light, and the
fade timeline `time_vfx_fire_vtp1`. It appears once at the tile's outer corner,
not in a radial pattern.

## Boundary-ring scheduler values now decoded

The earlier battlefield audit directly connected the five aliases in
`sgrp_vfx_ifring` to their embedded SCBs but left the `show`/`hide` polarity
undecoded. The active clip records close that gap.

| Alias | Timeline | Duration | Active clip | Track | Serialized value | Confirmed operation |
|---|---|---:|---|---:|---:|---|
| `show` | `time_vfx_if_ring_a_show` | 0.600 s | `LayCollisionOnOffClip` | 4 | `1` | turn A collision on |
| `hide` | `time_vfx_if_ring_a_hide` | 0.600 s | `LayCollisionOnOffClip` | 4 | `0` | turn A collision off |
| `vtp1` | `time_vfx_if_ring_vtp1` | 0.600 s | `LaySEClip`, `LayVFXClip` | 6, 4 | n/a | start the ring sound and VFX tracks |
| `sho1` | `time_vfx_if_ring_b_show` | 9.000 s | `LayCollisionOnOffClip` | 3 | `1` | turn B attribute/collision track on |
| `hid1` | `time_vfx_if_ring_b_hide` | 9.000 s | `LayCollisionOnOffClip` | 3 | `0` | turn B attribute/collision track off |

The on/off values are not inferred from the aliases. They are the final little-
endian `u32` in otherwise byte-identical `LayCollisionOnOffClip` bodies:

```text
show: 04 00 A0 00 00 00 00 00 01 00 00 00
hide: 04 00 A0 00 00 00 00 00 00 00 00 00

sho1: 03 00 A0 00 00 00 00 00 01 00 00 00
hid1: 03 00 A0 00 00 00 00 00 00 00 00 00
```

The exact SCB hashes remain:

| Timeline | SHA-256 |
|---|---|
| `time_vfx_if_ring_a_show` | `a69ae40e20691ebfa882a2ade184241ae2365a7d0c05274354bd17db40ed3f96` |
| `time_vfx_if_ring_a_hide` | `2fef1d2a2fde43848c0c3397e987bb2f2e75e49f9049fd4f5b3400a70572fd05` |
| `time_vfx_if_ring_vtp1` | `f2e96b1463fe9cbbc5e8ee0477a1ebb26ea3f3df1538bf40b82e9e67883552b1` |
| `time_vfx_if_ring_b_show` | `166489c34a706ab412012a4689bd76b037e7f036fae0ab5bf21cd2f66a937341` |
| `time_vfx_if_ring_b_hide` | `8654871ea8f48f13c4f2813fb7f8440b0c6e3513ee2ffe1062a58db987a2fc24` |

This makes the ring itself more implementable once a live map-object owner is
found: `vtp1` starts its visual/sound package, `show`/`hide` control track 4,
and `sho1`/`hid1` control track 3. The owner, initial state, exact retail call
order, and late-join replay behavior remain runtime questions.

## Consequences for the three requested visuals

### Eruption

The battlefield contains no per-player ground instance or point array. The
confirmed execution candidate therefore stays:

```text
snapshot the selected player's XYZ
-> create and instantiate exact m999/e001 at that frozen coordinate
-> mode 0x20
-> real m999 WSS4 / command 23595 SubStatusKick
-> init_msb5_1 -> map-bound pre-impact formation
-> after approximately three seconds, mode 0 plus another kick
-> native m999 WSS3 / command 23594 impact at the same coordinate
```

State 5 owns its own terrain binding. That is exactly what the absence of a
placed battlefield target rig predicts.

### Radiant Plume

Only one boundary-ring instance exists. It cannot be the several simultaneous
localized Plume eruptions seen in combat, and its UnitTree/SCBs are collision,
boundary VFX, and sound—not the `m999/e001` state-4 VEFF graph.

Use one stationary exact `m999/e001` owner at each desired Plume origin:

```text
mode 0x10
-> real m999 WSS4 / command 23595 SubStatusKick
-> init_msb4_1 / msb4 localized Plume package
```

The exact retail origin list is still server/capture data. It is not embedded
as placed objects in `wil_w0_fld05`.

### Infernal Nail

There is no Nail marker set in the Bowl tile. `w0f5_bbr1_Boss` is the only
marker. Nail positions therefore must arrive from the encounter/server path,
while the visible lifecycle remains model-native:

```text
m524/e002 actor at server-selected position
-> dormant publication
-> mode 0x10 before the WSS1 SubStatusKick
-> command 23366 / m524 WSS1 rise and ignition
-> on defeat, opcode 0x0134 DEAD
-> m524/e002 native dead scheduler/collapse and retained corpse timing
```

## Confirmed versus remaining runtime boundary

Confirmed here:

- complete structural enumeration of every placed instance inside the exact
  Bowl floor tile;
- one and only one ring group;
- one and only one PositionMarker in the tile;
- no placed Plume array, Eruption target rig, or Nail marker set;
- exact ring UnitTree members;
- exact active durations and clip records for all five ring aliases;
- exact `1`/`0` on/off values for both ring control pairs.

Still requires live confirmation:

- the server/network owner that exposes `isgrp_016280` as an addressable map
  object;
- the ring's initial state and retail timeline call order;
- the retail Plume-origin list;
- the exact helper create/state/action/delete packet sequence for Eruption and
  Plume;
- one visibly successful corrected `m999/e001 mode + WSS4` invocation;
- Nail spawn positions and exact defeat cleanup timing from a retail capture.

The visibility-first implementation target is unchanged, but the search space
is smaller: do not spend another probe on the Bowl terrain for Eruption,
Plumes, or Nails. Exercise their exact actor-owned state packages.
