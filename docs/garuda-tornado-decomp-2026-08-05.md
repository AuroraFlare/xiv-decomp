# Garuda tornado decomp and implementation audit (2026-08-05)

## Bottom line

The installed 1.x client separates Garuda's wind presentation into five layers:

1. Weather wtr_smmn supplies arena atmosphere and environmental wind.
2. The cinematic bundle sum6g000 has a separate torne_* VFX family.
3. Garuda m851 WSS5/WSS11 own boss-cast tornado components.
4. m999/e003 owns independently toggleable persistent tornado/typhoon states.
5. m999 WSS15/WSS18 own separate one-shot hazard combat packages.

The combat tornadoes therefore need effect-carrier actors. Garuda selects the
wind pattern, but the carrier at each whirlwind origin owns the loop state and
periodic damage action.

Players do not damage the wind circle by attacking it. The server sends the
wind action against players caught inside the active region. A separate
collision-on-entry trigger was not recovered. The exact retail tick cadence and
potency were not recovered; the implementation's six-second pulse remains an
explicit reconstruction choice.

Exact mob coordinates remain outside this pass. The implementation keeps the
encounter's existing four approximate South-wind points and 30-45 yalm
West-wind annulus. The supplied run explicitly calls South wind as a kite
mechanic, so fixed South carriers are only a visual/damage approximation until a
retail capture recovers target choice, movement path, speed, and retarget rules.

## Reference-footage cross-check

The supplied 1.0 recording is
[FFXIV: A Relic Reborn - Garuda (Hard)](https://www.youtube.com/watch?v=rzVsuAo30hs).

Visible/log evidence includes:

- 5:36: Garuda readies Aerial Blast and soars;
- 5:46: the log says Garuda summons the west winds, while party chat calls
  `West Wind >>> Go Middle`;
- 7:18: the log says Garuda summons the south winds, while party chat calls
  `South Wind >>> KITE`;
- 7:21: tall wind columns are visible as the party spreads and moves;
- 8:24: the log returns to west winds and the group again stays near the middle.

This proves distinct West/center-safe and South/kited behaviors. The recorded
player largely avoids the wind regions and does not provide repeat tornado-hit
samples, so the footage cannot establish exact radii, target choice, movement
speed, tick interval, or potency. A 1.0 fight description says the winds
reposition with the cardinal wind and randomly damage players standing on them:
[The Howling Eye (version 1.0)](https://finalfantasy.fandom.com/wiki/The_Howling_Eye_%28version_1.0%29).

## Reproduction

Run this from the repository root:

    python tools\build_garuda_tornado_decomp.py

The builder verifies these installed 1.x files first:

| Source | Bytes | SHA-256 | Role |
|---|---:|---|---|
| ffxivgame.exe | 15,996,808 | 9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9 | native scheduler, ActionClip, and VFX lifetime runtime |
| client/chara/mon/m851/act/emp_emp/wss/base/0005 | 470,832 | 6b70fcdb5dece7deb0999210594e4ae13fd6c82f43d78400c348ad8fe4737f99 | Garuda-owned `tatumaki` cast |
| client/chara/mon/m851/act/emp_emp/wss/base/0011 | 619,936 | e6c5014cb0f7ff131ef40a5e0e7724f3d5c5faa392edeba4957297be415d259e | Garuda-owned `tatumaki` loop cast |
| client/chara/mon/m999/act/emp_emp/wss/base/0015 | 429,520 | 16bcfd08dcfea38d040e7fa5faa9b939422032363908f4450bd3e1d9c8f62097 | one-shot tatumaki action |
| client/chara/mon/m999/act/emp_emp/wss/base/0018 | 513,776 | a6e52e63cd16673bf1d6633c639ca5aacdd6c88bd5739da9165f0a591d5e26fb | one-shot taihuu action |
| client/chara/mon/m999/equ/e003/met_mdl/0001 | 658,464 | 3dc782ca249deb86e914d5231829c99e48d3d2ecf6fc63c22579e1090feac501 | persistent state carrier |
| client/cut/sum6g000/sum6g000 | 10,626,512 | c0bdcb72ac50d712642e56d29df4ef00403717f433c3fdcd553e5de0eb071e74 | cinematic tornado family |
| data/28/D9/00/15.DAT | 87,024 | db13649451a75054235319e93bc9bfd3c236eb776bdd45c6df12e96e49e2a383 | weather wtr_smmn |

The expanded output has 923 live recursive payloads across seven verified data
sources plus the hash-locked executable. `sum6g000` still contributes 693 live
payloads; adding the two
type/ID records for each of its 48 parsed resource tables reconciles to the
earlier 789-row recursive table census.

The decoded scheduler graph has 156 timeline entries: 16 model-state entries
plus every SCB entry in m851 WSS5/WSS11 and m999 WSS15/WSS18.
The SCB `RIDT`/`RIDI` tables also resolve each `ActionClip` to a typed `bca`
resource rather than leaving it as an anonymous timeline entry:

| Graph | Caster/state ActionClip refs | Target ActionClip | Damage/end control |
|---|---|---|---|
| m999/e003 bit 4 on | `tatumaki` at 0.00 s | - | EffectEnd -> clip 2 at 0.09 s |
| m999/e003 bit 5 on | `taihu01m` at 0.00 s | - | EffectEnd -> clip 2 at 0.20 s |
| m851 WSS5 | `m851_05_ca1` at 0.20 s | `skl05_tar1` at 0.00 s | damage select at 0.03 s |
| m851 WSS11 | `skl11_cas1` at 0.00 s; `skl11_cas2` at 0.26 s | `skl11_tar1` at 0.00 s | damage select at 0.07 s |
| m999 WSS15 | `skl15_cas` at 0.00 s | `skl15_tar` at 0.00 s | damage select at 0.06 s |
| m999 WSS18 | `end` and `skl18_cas` at 0.00 s | `skl18_tar` at 0.00 s | damage select at 0.07 s |

## Persistent model states

| Breakage bit | Mask | Off scheduler | On scheduler | Authored effect | Scheduler envelope | EffectEnd signal |
|---:|---:|---|---|---|---:|---:|
| 4 | 0x10 | init_msb4_0 | init_msb4_1 | tatumaki_loop / tatumaki | off 0.10 s; on 2.01 s | 0.09 s -> timeline clip 2 (`ActionClip`) |
| 5 | 0x20 | init_msb5_0 | init_msb5_1 | taihu_loop / taihu01m; off taihu_end | off 0.79 s; on 2.25 s | 0.20 s -> timeline clip 2 (`ActionClip`) |

The linked `SEDBvins` leaf instances expose exact raw presentation values:

| State | Action words 0x9C / 0xA0 | Position Y 0x314 | Angle-control metadata 0x32C | Scale XYZ 0x330-0x338 | Scale-control metadata 0x33C | Lifetime words 0x360 / 0x364 |
|---|---|---:|---:|---|---|---:|
| small tornado on | 0xC0 / 0x101 | 0.00 | -5000 | 1.2 / 1.0 / 1.2 | 0x11100000 | 300000 / 150000 |
| large typhoon on | 0xC0 / 0x101 | 0.75 | 5000 | 1.2 / 1.1 / 1.2 | 0x10100000 | 300000 / 150000 |
| large typhoon off | 0x80 / 0x1 | 0.75 | -5000 | 1.2 / 1.0 / 1.2 | 0x10100000 | 300000 / 150000 |

The values and offsets are exact. Native defaults and updater order confirm position Y and scale XYZ; the adjacent control metadata remains deliberately unnamed, and none is server hitbox geometry.
The last three words are now structurally joined as `300000`, `150000`, lifetime
mode `1`; native mode 1 proves that `300000` is not the active visual cutoff and
uses an owning-effect boundary plus a native 150,000-us fade default. The builder
records the focused values in `persistent_leaf_parameters.csv` and the one-shot
comparison in `vfx_leaf_lifetime_comparison.csv`.

The 13-resource Garuda-local ACB matrix distinguishes the wind-state-on wrappers
from the decoded boss casts, combat hits, and typhoon end wrapper. All ten m851
boss-cast and m999 WSS15/WSS18 caster/target/end ActionClips use raw words
`0x80 / 0x1`; m999/e003 `tatumaki` and `taihu01m` use `0xC0 / 0x101`; and the
off-state `taihu_end` returns to `0x80 / 0x1`.

A wider installed-client census prevents over-naming those fields. Across 584
action-bank files and 1,336 ActionClip resources, the exact combinations are:

| Raw `@ACT` words | Occurrences |
|---|---:|
| `0x80 / 0x1` | 1,266 |
| `0xC0 / 0x101` | 43 |
| `0x80 / 0x101` | 19 |
| `0xC0 / 0x1` | 8 |

The added `0x40` and `0x100` bits therefore occur independently, and
`0xC0 / 0x101` is not exclusive to Garuda: it also appears in prop action VFX,
aura/state actions, and other banks. Native code now recovers the bit behavior,
though not Square Enix's original source-field names. The combined policy occurs
43 times: 26 monster resources and 17 background-object resources, mostly model-
state, resident, aura, or prop visuals. The 13 focused rows are in
`action_wrapper_flags.csv`; all 1,336 comparison rows are reproduced in
`installed_action_wrapper_census.csv`.

The loop and end names are authored. These are model-state transitions, not
ordinary skill results. Both on graphs contain six timeline entries:
`BindActorClip`, sound, `ActionClip`, chant sync, another sound, and
`RaptureEffectEndClip`. The small graph sends the EffectEnd signal at 90 ms;
the large graph sends it at 200 ms. Both target timeline clip 2, which the graph
resolves as `ActionClip`.

Native client code closes the semantic gap: `RaptureEffectEndClip` is registered
at `0x0063629B`; its activation override at `0x00821530` resolves each serialized
clip index, requires the target runtime type to be exactly `ActionClip`, and calls
that target's virtual method at `+0xC8`. The concrete ActionClip is constructed at
`0x0082FB30` with vtable `0x01033BEC`; its `+0xC8` implementation is
`0x0082FD20`. That method walks the ActionClip's live child clips, filters exact
`EffectClip` instances with an effect handle, and dispatches each handle to the
owner's effect-end handler. It does not directly delete the ActionClip, scheduler,
or model-state actor. The 90/200-ms values are therefore genuine effect-end
dispatch times, not the 2.01/2.25-second scheduler envelopes. They still do not
prove when already-emitted particles disappear: fade and particle-tail lifetime
remain authored by the VFX resource.

### Native lifetime and persistent-wrapper resolution

The carrier and one-shot leaves make the lifetime boundary unusually clear:

| Sample | Lifetime class | Serialized tuple | One-shot comparison |
|---|---|---|---|
| small tornado on | `LeafLifeEx` | 300000 / 150000 / mode 1 | WSS15 caster has the same tuple with base `LeafLife` |
| large typhoon on | `LeafLifeEx` | 300000 / 150000 / mode 1 | WSS18 caster has the same 1,012-byte layout; outside identifiers only position Y and scale XYZ differ |
| large typhoon off | `LeafLifeEx` | 300000 / 150000 / mode 1 | WSS18 `end` has the same layout; outside identifiers only scale Y differs |

`LeafLife` is class ID `0x387`, registered at `0x01300F6C`; its update,
value evaluator, initializer, and event handler are `0x00BA4370`,
`0x00BA42A0`, `0x00BA4440`, and `0x00BA45A0`. `LeafLifeEx` is class ID
`0x3C9`, registered at `0x0130F9CC`; it overrides update/evaluation at
`0x00D589F0`/`0x00D58910` and inherits the same initializer/event path.

The runtime fields are `+0x10` normalized leaf life, `+0x14` boundary/start tick,
`+0x18` fade interval, `+0x1C` mode, and `+0x1D` completion. In serialized
mode 1, the owner/effect boundary controls full life; the initializer supplies a
150,000-us fade default. `LeafLifeEx` couples that boundary to the owning effect.
Neither class regenerates particles or encodes an infinite loop.

The persistent distinction is one layer higher in ActionClip:

- `@ACT` word `0x9C`, extra bit `0x40`, is tested in `0x00A17A30` at
  `0x00A17BDE`. It sets the internal iteration target to exactly 1 and initializes
  ActionClip state through `0x00A210F0` with value 0.
- `@ACT` word `0xA0`, extra bit `0x100`, is consumed by `0x0082FC10` and
  `0x0082FCB0` through accessor `0x00A17E50`. It forces child-start state 2 and
  runs the `0x00A20F90` time/state accumulator before common ActionClip updating.
- `tatumaki` and `taihu01m` set both bits; `taihu_end`, WSS15, and WSS18 clear
  both. The branches implement a persistent-state ActionClip policy, but neither
  bit is by itself an “infinite loop” opcode.

So the defensible lifetime model is: the actor's selected model-state scheduler
owns/maintains the on effect, its ActionClip uses the special state policy, and
the explicit off graph cancels that scheduler (plus `taihu_end` for bit 5).
The short EffectEnd entry and the common `300000` word are not despawn timers.
`native_vfx_lifetime_semantics.csv`, `native_action_wrapper_semantics.csv`, and
the raw `native_*.cpp` exports preserve the proof. The reusable headless export
script is `tools/ghidra/DecompileGarudaTargets.java`.

The off graphs explicitly cancel `init_msb4_1` at 30 ms and `init_msb5_1` at
40 ms. The bit-5 off graph additionally owns the authored `taihu_end` VFX.

Opcode `0x0144` payload byte 4 (`SubState.mode`) supplies model-state bits 4 and
5, selecting `init_msb4` and `init_msb5`. Payload byte 0 is `breakage` and feeds
a different native queue; it cannot select these schedulers. The mode update is
queued until the battle/action event path commits it, so exact retail publish
and kick order remains capture-only.

The correct direct appearance is base model 10999 (`m999`), size 2, body gear
3072 (`e003`), and head gear 0. Database appearance **9114428** is the sole
base-10999 row with body gear 3072, proving the join. Its actor-class row has
no battle class path, so the encounter correctly uses 2209516 as a logical
battle class while overriding the direct appearance to 10999/body 3072.

## Garuda-owned tornado cast packages

The direct `m851` boss bank has two additional tornado-bearing actions. They
are not wrappers around the m999 hazard assets:

| Boss WSS | Motion | Motion duration | Caster / target SCB | Target damage-select | Authored evidence | Defensible interpretation |
|---:|---|---:|---:|---:|---|---|
| 5 | `cbbm_sp_b02` | 65 frames / 2.167 s | 1.20 s / 0.35 s | 0.03 s | `skl05cas01m`, `skl05tar01m`, `tatumaki`, `CameraShake` | Garuda-owned tornado cast; exact named mechanic unresolved |
| 11 | `cbbm_sp_b04` | 90 frames / 3.000 s | 1.60 s / 0.60 s | 0.07 s | three VFX packages, `tatumaki`, explicit `LOOP`, `SceneTexture`, camera/draw/filter controls | elaborate tornado cast and strongest Aerial Blast candidate; exact selector unresolved |

Each boss package shares only the generic `system/shoot_mon/main` payload with
m999 WSS15/WSS18 and shares nothing with m999/e003. This proves the boss cast
animation, persistent hazard visual, and periodic hazard hit are three separate
client layers. It does not justify assigning WSS5 to Great Whirlwind or WSS11 to
Aerial Blast as a recovered retail fact.

## Serialized VFX controls

`vfx_controls.csv` inventories the leaf VEFF class paths without double-counting
parent SEDBRES containers. The wind assets serialize root, local, world, pure-
world, and generated coordinate controls; root scale controls; particle
`GenerateMaster` controls; and draw/lifetime classes. Notable distinctions are:

- m851 WSS5 has `CameraShake`;
- m851 WSS11 adds `SceneTexture`, `ContinualPolygonNormal`, and multiple camera
  shake/filter paths;
- m999/e003 carries generated-root and world position/angle class dependencies plus root scale;
- m999 WSS15 includes camera shake, while WSS18 includes a draw filter.

These serialized class names prove authored coordinate spaces and presentation
features. None is trustworthy server collision radius or damage geometry.

### Native leaf transform resolution

The neighboring VLeafIns vectors are no longer anonymous. The exact client
registers `Position3D:CoordRoot` (class `0x191`, registry `0x01301794`),
`Angle3D:CoordRoot` (`0x3AE`, `0x01301ED4`), and `Scale3D:CoordRoot`
(`0x30F`, `0x01302614`). Their initializers establish `(0,0,0)`, `(0,0,0)`,
and `(1,1,1)` defaults respectively. Their update paths copy exactly three
serialized floats into runtime XYZ at `+0x10/+0x14/+0x18`, place homogeneous
one at `+0x1C`, and treat the neighboring word as optional-control metadata.
That native ordering, together with the serialized defaults, resolves the leaf
triplets as position, angle, and scale:

| Presentation leaf | Position XYZ | Angle XYZ | Scale XYZ |
|---|---:|---:|---:|
| Garuda WSS5 caster | 0 / 0 / 0 | 0 / 0 / 0 | 1.5 / 1.5 / 1.5 |
| Garuda WSS11 elevated caster | 0 / 7.5 / 0 | 0 / 0 / 0 | 2 / 2 / 2 |
| Garuda WSS11 root caster | 0 / 0 / 0 | 0 / 0 / 0 | 2 / 2 / 2 |
| m999 WSS15 caster | 0 / 0 / 0 | 0 / 0 / 0 | 0.9 / 1.2 / 0.9 |
| m999 WSS15 target hit | 0 / 0 / 0 | 0 / 0 / 0 | 2 / 2 / 2 |
| m999 WSS18 caster | 0 / 0 / 0 | 0 / 0 / 0 | 1 / 1 / 1 |
| m999 WSS18 end | 0 / 0.75 / 0 | 0 / 0 / 0 | 1.2 / 1.1 / 1.2 |
| m999/e003 small on | 0 / 0 / 0 | 0 / 0 / 0 | 1.2 / 1 / 1.2 |
| m999/e003 large on | 0 / 0.75 / 0 | 0 / 0 / 0 | 1.2 / 1.1 / 1.2 |
| m999/e003 large off | 0 / 0.75 / 0 | 0 / 0 / 0 | 1.2 / 1 / 1.2 |

The persistent large state is therefore authored 0.75 client units above its
leaf origin. Every audited leaf angle vector is exactly zero, but that alone
does not assign the visible swirl to a particular VEFF control. The signed
`+5000/-5000` words follow the angle triplet and are control metadata, not
degrees or a fourth coordinate.

The matched 1,012-byte leaves make the comparison exact. Outside resource IDs,
large persistent-on differs from the WSS18 caster only by position Y and scale
XYZ. Persistent-off differs from the WSS18 end only by scale Y (`1.0` versus
`1.1`). `vfx_leaf_transforms.csv`, `vfx_leaf_transform_diffs.csv`,
`native_vfx_transform_semantics.csv`, and the native decompiler exports preserve
the proof.

### VEFF rotation graph: dependencies are not instances

The repository-native VEFF allocation-table decoder was applied to all eight
m999 tornado presentation graphs, then each primary control record was joined
to its class metadata. This distinction matters because a serialized class
string may only be a dependency retained by the graph; it does not prove that
an instance of that control is allocated or evaluated.

| Presentation graph | Primary controls | Joined root angle | Joined world angle | Joined generated angle | Generated dependency strings |
|---|---:|---:|---:|---:|---:|
| WSS15 main `tatumaki` | 68 | 3 | 0 | 0 | 0 |
| WSS15 target hit `tn_hit01m` | 56 | 6 | 1 | 0 | 1 |
| WSS18 main `taihuu01` | 46 | 2 | 0 | 0 | 0 |
| WSS18 end `taihu_end` | 41 | 0 | 0 | 0 | 0 |
| WSS18 target hit `tm_hit01m` | 56 | 6 | 1 | 0 | 1 |
| m999/e003 persistent small | 59 | 0 | 0 | 0 | 0 |
| m999/e003 persistent large | 53 | 0 | 0 | 0 | 0 |
| m999/e003 persistent large end | 41 | 0 | 0 | 0 | 0 |

The result is zero joined `Angle3DGenerated` controls. Its two appearances are
dependency strings in the two target-hit graphs, not instances. The native
`Angle3DGenerated:GendNormal:CoordRoot` evaluator is nevertheless resolved
exactly as `angle + speed*t + 0.5*acceleration*t^2`, where
`t=accumulated_ticks/5000`; Garuda's tornado graphs do not invoke that curve.
The only joined `Angle3DWorld:CoordWorld` instances are in the two target-hit
graphs, and native code lazily composes the owner's world angle with a
serialized offset rather than producing autonomous angular motion.

Seventeen `Angle3D:CoordRoot` primary records have exact 16-byte allocations.
Some contain serialized links or flags, so `veff_angle_control_allocations.csv`
preserves their raw words and float overlays without falsely relabelling every
record as an XYZ vector. Consequently, the visible swirl cannot be assigned to
a root/generated angle curve from this evidence; it remains
particle/draw-resource/material presentation, and it proves neither a hazard
yaw nor a server hitbox. `veff_rotation_graph_summary.csv`,
`veff_rotation_class_usage.csv`, `veff_angle_control_allocations.csv`, and
`native_vfx_rotation_semantics.csv` preserve this boundary. Native proof is in
`native_vfx_rotation_targets.cpp`, `native_vfx_rotation_registry_records.txt`,
`native_vfx_rotation_property_names.txt`, and
`native_vfx_rotation_string_xrefs.cpp`.

### Particle translation, emission, and draw dispatch

The same primary-record join resolves the next presentation layer. Generated
position is genuinely instantiated, but only as root-coordinate translation:

| Presentation graph | Generated position | `GenerateMaster` | `DrawResource` |
|---|---:|---:|---:|
| WSS15 main `tatumaki` | 0 | 5 | 7 |
| WSS15 target hit | 0 | 3 | 2 |
| WSS18 main `taihuu01` | 2 | 0 | 3 |
| WSS18 end | 0 | 0 | 1 |
| WSS18 target hit | 0 | 3 | 2 |
| m999/e003 persistent small | 9 | 0 | 5 |
| m999/e003 persistent large | 0 | 0 | 1 |
| m999/e003 persistent large end | 0 | 0 | 1 |

All 11 joined generated-position instances are
`Position3DGenerated:GendNormal:CoordRoot`; the world, pure-world, and local
variants have zero joined instances. Native class `0x3B5` at registry
`0x01301B34` evaluates normal mode as
`anchor + base + direction*speed*t + 0.5*direction*acceleration*t^2`, with
`t=accumulated_ticks/5000`. Its alternate mode numerically integrates the same
translation and damps displacement. The evaluator contains no sine/cosine,
cross-axis orbit, or actor-yaw update. It can move particles along authored
vectors, but it cannot by itself make a tornado carrier pursue a player or
rotate the server hazard.

Native `GenerateMaster` class `0x175` at `0x0131254C` accumulates owner
displacement, interpolates emission points along the traveled segment, applies
authored randomized spacing/probability/count, and caps a single update at 101
generation iterations. Its 11 instances belong to WSS15 main and the two
one-shot target-hit graphs. This is a client particle-creation scheduler, not
a server movement controller. `DrawResource` class `0x36` at `0x013116CC` is
instantiated 22 times across all eight graphs and delegates serialized resources
to type-specific renderer paths; it does not evaluate a motion curve or damage
shape.

### Serialized particle parameters are link maps

The generated-position and emitter records do not expose a flat sequence of
position, speed, acceleration, or interval floats. All 22 joined controls are
now preserved at both primary and secondary record levels. Their primary slices
contain 165 mechanically decoded `<IHH>` relocation/link records: 111 on
persistent-small generated-position controls, 27 across WSS15 emitters, and 27
on the WSS18 target-hit emitters. WSS18's two main generated-position controls
and some emitter records have no populated primary slice.

The verified generic resolver at `0x00E3A0A0` defines a real evaluated-input
handle as signed `int16 node_index + int16 component_index`; a negative node
index selects the alternate node table, and the resolver returns the control's
normal output at `+0x20` or random-extension output at `+0x30`. The secondary
particle slices contain 38 four-byte words. Twenty-eight are structurally
compatible with that handle layout; ten are the distinct `0x10000000`
sentinel/flag form and are deliberately not decoded as the nonsensical handle
`node 0 / component 4096`.

The native consumer fields are now exact even though their authored resolved
values remain behind the serialized-loader join:

| Consumer | Input offset | Native meaning |
|---|---:|---|
| generated position | `+0x00..+0x08` | base position vector |
| generated position | `+0x10..+0x18` | direction vector |
| generated position | `+0x40` | speed scalar |
| generated position | `+0x44` | normal acceleration / alternate damping scalar |
| generated position | `+0x48 bit 0` | alternate integration mode |
| `GenerateMaster` | `+0x0C` | base emission probability, direct float |
| `GenerateMaster` | `+0x24` | child-generation resource specification |
| `GenerateMaster` | `+0x2C` | random probability width, direct float |
| `GenerateMaster` | `+0x30` | evaluated generation count, truncated to integer |
| `GenerateMaster` | `+0x34` | evaluated base travel spacing |
| `GenerateMaster` | `+0x38` | evaluated random travel-spacing width |

The emitter calculates its next spacing as base plus a randomized width and
clamps it to at least `0.0010000000474974513`. This is distance traveled by the
owning client effect, not a time interval or a server-AI movement command.

`veff_particle_control_serialization.csv` retains every record offset and raw
primary/secondary word vector. `veff_particle_control_links.csv` retains all
165 relocation/link records byte-for-byte, while
`veff_particle_dependency_handles.csv` preserves the 28 handle-layout
candidates and ten sentinels. `native_vfx_runtime_input_semantics.csv` locks
the consumer offsets and evaluator behavior. Exact coefficients still require
joining the serialized module loader to the runtime input block or observing
the resolved controls in a runtime capture; no raw word is promoted to a float
merely because its bit pattern looks plausible.

### Serialized parameter-tree modules and terminal words

The executable-side evaluator census is now explicit. The verified client
registers eight scalar `Float32` graph families:

| Distribution | Curve | Registry |
|---|---|---:|
| standard | immediate | `0x01304390` |
| standard | linear | `0x01304690` |
| standard | parabolical | `0x01304990` |
| standard | polynomial | `0x01304C90` |
| random | immediate | `0x01304F90` |
| random | linear | `0x01305290` |
| random | parabolical | `0x01305590` |
| random | polynomial | `0x01305890` |

`native_vfx_graph_module_registries.csv` hash-locks each scalar registry prefix.
The loader constructor also exposes two complete 64-slot tables: standard class
codes begin at `0x01304350`, random class codes at `0x01304F50`, and the maximum
type count is `0x40`. `native_vfx_graph_type_table.csv` preserves all 128 slots.
`FUN_00BD3F70` walks 56-byte group descriptors. The serialized allocation has
a 48-byte lead-in, so each native descriptor begins eight bytes before the
corresponding visible group-record boundary. Across these VEFFs that produces 74
logical descriptors. `FUN_00BD2660` reads standard pointer/count at descriptor
`+0x18/+0x1C` and random at `+0x20/+0x24`; those offsets mechanically land on
visible pair 2 and pair 3 respectively. It then indexes the selected table as
`base + uint16_type*0x30`. Thus pair 2 is standard, pair 3 is random, and the
low half of the serialized first DWORD is a proven native type index.
`veff_group_loader_bridge.csv` preserves every shifted descriptor and both list
joins byte-for-byte.

A guarded recursive walk of group-record pairs 2 and 3 now covers all eight
Garuda wind VEFFs. Tiny/zero child offsets are rejected as value pointers. The
result is 1,194 exact 12-byte records: 367 polynomial type records, 800 records
that point to bounded terminal DWORD slices, 23 inline native-type candidates,
and four unresolved inline records. Those terminal slices contain 1,068 DWORDs.
Every row retains the raw record or raw word, offset, integer overlays, float
overlay, traversal path, and child-slice hash. The observed polynomial indices
are `0x31`, `0x32`, `0x33`, `0x34`, and `0x36`; `0x35` (the native Float32X4
slot) is not used by these recursive Garuda records. In particular,
`0x00010033` splits into type index `0x0033`, graph-overflow ID byte `0x01`,
and reserved high byte `0x00`; it is not a distinct 32-bit module tag.
`FUN_00BE7D50` copies byte `+2` to runtime record `+0x24` and rejects values
above one with `graph overflow id error.` The exact behavior selected by IDs
zero and one is not yet resolved.

The raw overlay demonstrates why the distinction matters. Persistent-small
`4yET9Wtatumaki_` at `0x3F9C..0x3FB4` includes plausible floats
`0.0987065434`, `-0.0493532717`, `0.547825217`, and `0.528726816`, but the same
slice also includes packed word `0x00000401`. WSS18 main at
`0x3370..0x3390` similarly includes `0.566433549`, `-0.00699300691`,
`0.288684398`, `0.297359377`, and `0.192799896` beside another
`0x00000401`. These are exact terminal bit patterns, not yet named speed,
acceleration, direction, lifetime, or spacing fields.

`veff_parameter_graph_records.csv` preserves the complete structural walk;
`veff_group_loader_bridge.csv` proves the pair-2/standard and pair-3/random
mapping for all 74 logical descriptors;
`veff_polynomial_type_registry_join.csv` preserves the ten observed
distribution/type/overflow combinations and their single exact native match;
and `veff_parameter_terminal_words.csv` preserves all 1,068 leaves. What
remains is the graph-overflow behavior and the property/value join from terminal
descriptors to generated-position and `GenerateMaster` runtime input offsets.
Until that join is proved, the terminal values remain presentation data with
unknown property names and units and cannot justify a server pursuit speed,
damage cadence, radius, or helper yaw.

### Persistent-large material path

The one persistent-large `DrawResource` node resolves mechanically to VMDL
`37QyJuring03m`, the smoke/fire distortion ring:

| Authored field | Active ring value |
|---|---|
| shader | `TechCgfxShader2` |
| textures | `smok_a01m.dds`; `fire_u04m.dds` |
| `TextureDist_1_distortion_amount` | `0.200000003` |
| `vfxDistortionTex_UVScroll` | `(0,0,0)` |
| `vfxDistortionTex_UVScale` | `(1,1)` |

The preloaded `0hlYBUring01m` comparator has the same three material values.
Consequently the visible large-ring swirl is not an authored nonzero UV-scroll
curve. The static distortion path is real, but remaining apparent motion can
still be baked into mesh/texture content, arise from shader distortion, or be
supplied by a higher runtime uniform not serialized in this VMDL numeric buffer.
The VTex wrappers do not expose a separate animation-key surface, which does not
prove that their image content lacks an atlas or animated-looking pattern.
`persistent_large_draw_contract.csv` locks the graph-to-model join;
`persistent_large_material_properties.csv` preserves all 25 decoded material
descriptors and values for both rings.

The visual split is therefore concrete: small-tornado presentations use moving
or emitted particles, while the persistent large loop has only its draw resource
at this layer. Any apparent rotation in the persistent large loop must be baked
into its mesh/texture/material draw presentation or supplied above this graph,
not generated by an angle or position-orbit controller. Exact joined counts are
in `veff_particle_graph_summary.csv`; locked native behavior is in
`native_vfx_particle_semantics.csv`, with raw proof in
`native_vfx_particle_targets.cpp`, `native_vfx_particle_registry_records.txt`,
`native_vfx_particle_class_xrefs.cpp`.

### Visual bounds are not hitboxes

All 43 wind-package `SEDBvmdl` resources contain a recoverable local model
bounds record. The named WSS15 `tatumaki` core spans about 12.733 units across
X/Z and 4.828 vertically; WSS18 `taifu03m` spans about 123.550 across X/Z and
21.524 vertically, from Y 4.503 to 26.027. The persistent small-state `pl02m`
plane spans about 42.373 across X/Z and 8.281 vertically. Other members are
rings, planes, hit flashes, and particle-support meshes with very different
bounds.

The VEFF root record closes the tempting-but-wrong radius inference: small
`tatumaki`, large `taihuu01`, both persistent loops, and both end effects all
serialize the same `-20/-20/-20` to `20/20/20` envelope. The two target-hit
VEFFs serialize a zero envelope. These are render/culling envelopes, while VMDL
bounds are local mesh bounds before leaf scaling. Neither is server collision
geometry, and neither justifies changing the implemented 9-yalm circle or
30-to-45-yalm annulus. Exact rows are in `vfx_model_bounds.csv` and
`vfx_root_bounds.csv`.

## Full m999 WSS bank census

The builder now hash-locks every installed `m999` WSS bank from 1 through 20,
not just the two suspected wind actions. Across the complete bank, **only WSS15
and WSS18** contain authored wind-family names:

| WSS | Bytes | SHA-256 | Recovered classification |
|---:|---:|---|---|
| 1 | 275,472 | a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94 | non-wind; old Ifrit donor package |
| 2 | 788,688 | 495d76a562dbe2bebfb2698468dd114cd2aa024e6f22004b9fd0520ddd72cfc1 | non-wind generic action |
| 3 | 740,656 | 0ddecf22508dcd151e302c7484981932b52db02f8ca926c3a114c65168046ac6 | non-wind generic action |
| 4 | 3,280 | 769514e370b57a5024e1f646fbe7ab05563f802c615e2f32890c51895d7a9423 | scheduler stub |
| 5 | 3,280 | d5f262f0d06fe1fa8f1f990df3333cc8093a1c72fea22aedc507aba16baaec72 | scheduler stub |
| 6 | 490,912 | 4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b | non-wind action |
| 7 | 155,376 | 024bcb72f397b163599607ccec24e6f72c43e79c9aca0dd1a4745527e9f9e99a | non-wind action |
| 8 | 3,280 | 507375ca88078b648d50d852932dee3ff65b7b7e76778bc1437d0c7556c94eef | scheduler stub |
| 9 | 3,280 | 72f91f10ea757f3c3e1f7217e2246a55adf295819d42fdbb9339a2c3df36c379 | scheduler stub |
| 10 | 249,264 | afbdb40c52f52675efdc3be00b96feaa1a80d0407a0b8a4b8a94a69d6cdb939d | non-wind action |
| 11 | 227,840 | 337dbceffa415c7d1edb42ea9b719240186442f04665822bc3f5485370c6ecdd | non-wind action |
| 12 | 249,472 | c1e3bdc8ce80a80e9b56b6776a32422301fa8b07cf9ec755bbea610bc27587ee | non-wind action |
| 13 | 3,280 | 4f45f409fddc36574919c77967746d8ced160af288de619a03fdcd740b4a79a1 | scheduler stub |
| 14 | 3,280 | c25b6868e7f67e38be5c285f94ec962a581b9f5e3d31c5915d5340372fb79550 | scheduler stub |
| 15 | 429,520 | 16bcfd08dcfea38d040e7fa5faa9b939422032363908f4450bd3e1d9c8f62097 | `tatumaki`, `tn_hit01m`; small tornado action |
| 16 | 3,280 | 6a0445e82313ae3ff021113d42d11d329e00a32ceeb145143e11fca263925f0b | scheduler stub |
| 17 | 3,280 | c458104e4b2d4498e1526679be2e6189693af45ea04488308a8556e610be6f60 | scheduler stub |
| 18 | 513,776 | a6e52e63cd16673bf1d6633c639ca5aacdd6c88bd5739da9165f0a591d5e26fb | `taihuu01`, `taihu_end`, `tm_hit01m`; embedded `tatumaki` marker; large typhoon action |
| 19 | 358,800 | 2bda6b73c2c0f59a1abaa51fd01c267b1d07e304acca890284a0c24508f6d34b | non-wind action |
| 20 | 279,648 | 767db3b34ab40a8508168f0871f94eaf7bafabad3fed89121c5169d3d20e3825 | non-wind action |

This complete-bank negative evidence materially strengthens the WSS15/18 visual
mapping. It still does not turn the mapping into a recovered retail server
selector, because result packets carry animation and command identity
independently. `m999_wss_bank_census.csv` reproduces the hashes, recursive row
counts, token flags, and classification.

## Recovered Garuda Lua surfaces

Five retail/recovered Garuda-facing bytecode surfaces were verified against exact
hashes and their decompiled source:

| Class | Bytes | SHA-256 | Decompiled body |
|---|---:|---|---|
| `LentigoGarudaTyphoon` | 212 | 0fe6fb4a9f4015e67ec26964f556542732818e6baf221b455e39ccbf864ae700 | require base; define subclass |
| `GarudaOthers` | 203 | d4dc1af5445c6c56b39ce6c578db993709a2c3327df5889d3b47a8776872f3f2 | require base; define subclass |
| `GarudaAttackWeaponSkill` | 222 | c7a1782af189b59dbad096290e944783a0a47dd94d0b7858bf179c1dc5f12eaf | require base; define subclass |
| `GarudaBaseClass` | 203 | 6bc8abf51454910b9aaacd488cfa2ca326d2d3a860721b791b2aa20a88f79e8c | require base; define base subclass |
| `InstanceRaidNormalGaruda` | 222 | 4cd419cd806a6f43e89a1266fff994a40de4835768aebafa583e9b7a1b624660 | require base; define subclass |

Each decompiles to exactly two statements and **zero methods**. There is no
Garuda-specific client Lua tick, potency, collision, target-selection, or
movement implementation hidden in these classes; those behaviors are inherited
from generic/native code or supplied by the original server. The builder records
this negative result in `retail_lua_tornado_surfaces.csv`.

### Complete Lentigo inheritance trace

The Garuda specialization is not hiding a pursuit controller in its base class.
The complete recovered chain and four cross-content comparisons are:

| Surface | Base/owner | Methods | Movement methods | Only recovered behavior |
|---|---|---:|---:|---|
| `LentigoGarudaTyphoon` | `LentigoBaseClass` | 0 | 0 | identity only |
| `LentigoMoogleF0f4` | `LentigoBaseClass` | 0 | 0 | identity only |
| `LentigoWhiteGeneralMeteor` | `LentigoBaseClass` | 0 | 0 | identity only |
| `LentigoWhiteGeneralWS` | `LentigoBaseClass` | 0 | 0 | identity only |
| `LentigoQuicksandW0D5Raid1` | `LentigoBaseClass` | 0 | 0 | identity only |
| `LentigoBaseClass` | `MonsterBaseClass` | 1 | 0 | `isMapMarkerVisibleForTalkable` returns `false` |
| `MonsterBaseClass` | `NpcBaseClass` | 0 | 0 | identity only |
| `NpcBaseClass_battle` | `NpcBaseClass` | 5 | 0 | battle metadata initialization, parts accessors, and aggro accessor |

`LentigoBaseClass` is 303 bytes with SHA-256
`b2cde5f17ed2ef97bd339e68ad429e74f4e61dcdcc1cde61e0190bf7c3851a50`.
Its sole method suppresses the talk/map marker. `MonsterBaseClass` is another
two-statement identity base, and `NpcBaseClass_battle` contains no update, timer,
target, path, chase, speed, lifetime, or despawn method. The other Lentigo uses
being equally empty shows that "Lentigo" is a generic marker-suppressed helper
shell, not a Garuda-specific homing algorithm.

The protocol boundary agrees. Actor instantiate packet `0x00CC` carries the
server-supplied client `className` at payload offset `0x24`. Server-to-client
actor movement then uses endpoint packet `0x00CF` (X/Y/Z, rotation, move state,
and floating height), while `0x00D0` publishes the stop/walk/run/active speed
profile. The movement packets contain no target selector, path policy, retarget
rule, or lifetime. The client can render/interpolate the authored endpoint and
speed, but those packets do not let it decide whom a South-wind typhoon should
pursue.

The exact hash-locked `ffxivgame.exe` also contains zero ASCII matches for
`LentigoGarudaTyphoon`, `GarudaTyphoon`, `LentigoBaseClass`, or `/Lentigo/`.
That closes the obvious native class-name dispatch route, although it cannot
exclude a numeric actor-ID special case or generic native interpolation.

Therefore there is no defensible movement constant to copy from the recovered
client Lua. Exact target choice, destinations, speed, retargeting, and lifetime
must come from original server logic or a retail packet capture. The precise
capture recipe is: identify each helper through `0x00CC`
`className=LentigoGarudaTyphoon`, group later `0x00D0` and `0x00CF` packets by
that actor ID, and correlate its command-result packets with player coordinates.
The builder preserves the hash-locked proof in
`lentigo_inheritance_boundary.csv`, `native_lentigo_string_boundary.csv`, and
`movement_packet_authority.csv`.

## One-shot action packages

### WSS15

- caster: mon_main with nested skl15_cas, about 1.86 seconds;
- target: m999_0015 with skl15_tar, 0.50 seconds;
- VFX: tatumaki.veffbin and tn_hit01m.veffbin;
- target branch: RaptureActionSelectDamageMccClip at 0.06 seconds.

This is the strong semantic match for Great Whirlwind / the smaller tornado.

### WSS18

- caster: mon_main with nested skl18_cas, about 1.50 seconds;
- target: m999_0018 with skl18_tar, 0.50 seconds;
- VFX: taihuu01.veffbin, tm_hit01m.veffbin, and taihu_end.veffbin;
- target branch: RaptureActionSelectDamageMccClip at 0.07 seconds.

This is the strong semantic match for Eye of the Storm / arena typhoon.

The two m999 WSS packages share exactly one byte-identical resource: the generic
`system/shoot_mon/main` scheduler. Neither shares a payload with the persistent
m999/e003 package. The m851 boss tornado packages likewise share only that
generic scheduler with m999 combat data and no payload with m999/e003. This
directly proves separate boss-cast, persistent-loop, and combat-result layers.

The exact retail command-to-WSS selector did not survive. WSS15=Great
Whirlwind and WSS18=Eye of the Storm are strongly named and geometry-supported
inferences, not recovered selector edges.

The protocol explains why further client-only searching cannot recover that edge.
Every command-result packet variant (`0x0139`, `0x013A`, `0x013B`, and `0x013C`)
serializes a server-authored `UInt32 animationId` at result-payload offset `0x04`
and the `UInt16 commandId` separately at offset `0x24`. For model-bank results,
`0x1300F000` selects WSS15 and `0x13012000` selects WSS18. The installed command
DAT supplies the command identity and mechanics fields, but the client does not
need a command-to-WSS lookup to render these packets. The original retail mapping
therefore requires an original server table or a retail packet capture; it is not
latent in the installed command catalog. `command_selector_boundary.csv`
reproduces this packet/table boundary across all four result shapes.

## Command geometry and element data

| Command | ID | Raw range | Raw col. 67 | Recast col. 80 | Damage swing col. 97 | Property col. 109 | Element col. 111 |
|---|---:|---:|---:|---:|---:|---:|---:|
| Great Whirlwind | 23556 | 12 | 0 | 0 | 0 | 13 | 7 (`Wind`) |
| Eye of the Storm | 23559 | 44 | 12 | 0 | 0 | 13 | 7 (`Wind`) |

Column 111 is the client element field; both canonical commands explicitly use
`ActionProperty.Wind = 7`. Column 109 is a separate property field and does not
change that conclusion. The zero client recast and damage-swing fields do not
supply a hazard cadence or potency. The canonical and private server rows are
now corrected from Lightning (`9`) to Wind (`7`), and the private rows use the
recovered zero damage swing.

The private actions use helper-centered encounter geometry:

- Great Whirlwind: 9-yalm circle matching existing approximate South regions;
- Eye of the Storm: 30-45 yalm annulus.

Both are damage-only. Earlier Great Whirlwind knockback and Eye draw-in were
removed because neither the target schedulers nor the recovered 1.0
descriptions prove forced movement. South-wind carrier movement is a different
question: the footage proves players kite that pattern, but it does not recover
a knockback, draw-in, target rule, or movement profile.

## Cinematic and weather separation

sum6g000 contains torne_in, torne_lop, torne_rot, torne_st, gal_land,
gal_sonic, gal_sprl, and f0grd_wid. Recursive comparison finds zero
byte-identical resources shared with WSS15, WSS18, or m999/e003.

The weather layout contains wtr_smmn and wind_00_0000. Its FileSet resolves the
four wind_00_00 through wind_00_03 MTB dependencies documented in the broader
Garuda audit. This is environmental data, not a combat tornado scheduler.

## Implemented ownership

The encounter now:

- creates four invisible, untargetable, invulnerable m999/e003 carriers at the
  existing wind points; these are a static South-wind approximation, not a
  recovered retail movement profile;
- publishes each actor before changing its state bit;
- uses 0x20 on the center carrier for West-wind Eye of the Storm;
- uses 0x10 on active South-wind carriers;
- turns inactive Silk-pattern carriers off as outer regions step;
- turns all states off while wind is suppressed;
- lets each helper cast independently, avoiding the old Garuda FIFO backlog;
- resolves damage from the helper origin;
- maps private presentation IDs to canonical commands 23559 and 23556;
- stores Wind element `7` and the recovered zero damage swing on the canonical
  and private wind commands;
- forces m999 WSS18 and WSS15 for the private result packets;
- replays the current actor/substate spawn train for late-ready clients;
- clears state and despawns carriers during cleanup.

TargetFind now also discovers self-centered AoE recipients around the caster,
not around the selected main target. The old query could omit players on the
opposite edge of a circle or annulus even though its shape test was correct.

## Remaining evidence boundaries

These still require a live 1.23b capture:

- exact South-wind coordinates and radii;
- South-wind target selection, pursuit path, speed, retargeting, and lifetime;
- exact damage cadence and potency; the supplied run does not repeatedly enter
  a wind hazard, so video timing cannot close this gap;
- live confirmation that one retained state bit renders without a visible gap across scheduler-cycle boundaries;
- the unresolved graph-overflow behavior and property/value join from 1,068
  terminal DWORDs into exact generated-position/emitter inputs; plus any
  higher-runtime texture-matrix/distortion animation or battlefield-specific
  helper yaw override;
- the exact retail command-to-WSS15/WSS18 edge (requires original server data or a retail packet capture);
- any secondary status not visible in recovered scheduler strings.

This pass deliberately does not add targetable tornado mobs or claim exact mob
placement.

