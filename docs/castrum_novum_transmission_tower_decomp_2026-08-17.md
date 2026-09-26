# Castrum Novum Transmission Tower decomp — 2026-08-17

## Result

The Tower is a small, separate duty layout, not the open-world Castrum Novum
layout. The recovered identity chain is:

```text
raidDungeon 13: Castrum Novum Transmission Tower
  -> server zones 251 / 264: Transmission Tower
  -> zoneParam 5014
  -> layout 511 (type 2)
  -> RegionResourceData child lak_l0_dun01
  -> client DAT 0x03E7000B
```

The Tower's recovered **special-event payload** is weather 8032, Dalamud
Thunder. Its misleading retail token is `wtr_xmas`, but the `lak_l0` payload at
`0x03E7000E` is not Starlight snow: it is the complete 8030 Dalamud lighting
grade plus a native thunder VFX group. Runtime capture shows that continuously
forcing it is not a faithful duty baseline; it settles into opaque gray fog.
Weather 8076 (`wtr_night`) makes that fog recede but visually suppresses the
Tower light bank. Clear 8001 also fails to restore the bank after it has been
replaced. The runnable shell therefore sends no content weather override and
suppresses the Tower instance's normal zone-in `SetWeather`, preserving layout
511's own initial render state.

A second live, hash-guarded memory probe now proves the client actually selected
the dungeon layout: its active spatial DrawEnv is `dwev_20`. Field layout 501
contains only `dwev_00` and `dwev_10`; `dwev_20` is unique to dungeon layout
511. The missing lights are therefore not a silent fallback to the field map.

The supplied 4.35-second runtime MP4 is now measured rather than described
subjectively. At 10 samples/second, its largest non-startup luma discontinuity
is at 2.0 seconds. Mean saturation falls from `9.991` immediately before the
handoff to `3.859` afterward, a `0.386` ratio. The contact sheet shows the scene
loses its cyan/red authored treatment while colored UI elements survive, ruling
out a video-wide grayscale edit. The observed handoff is 0.4 seconds from the
decompiled 2.4-second DrawEnv package duration; recording began after the zone
packet, so those timings are mutually consistent.

This result is deliberately split into two confidence levels:

- The zone, layout, object, lighting, scheduler, weather-resource, and FCurve
  findings below are direct client binary/table evidence.
- No static content-13 -> weather-8032 assignment survives in the recovered
  client Lua. Runtime evidence rejects a permanent assignment; any original use
  was transient or depended on unrecovered server/event-side state.

The repeatable artifact bundle is in
`outputs/castrum-novum-transmission-tower-decomp-20260817/` and is regenerated
with:

```powershell
python tools/build_castrum_novum_transmission_tower_decomp.py
```

## Identity and map selection

| Layer | Recovered value | Source |
|---|---|---|
| Instance content | ID 13, Castrum Novum Transmission Tower | `docs/Dat Mining/xtx_raidDungeon.csv` |
| Server zones | 251 and 264, `lak0Field01`, Transmission Tower | `Data/sql/server_zones.sql` |
| Zone parameter | both zones -> 5014 | `docs/Dat Mining/_zoneParam.csv` |
| Layout table | layout 511, type 2, parameter 5014 | `docs/Dat Mining/_layout.csv` |
| Region child | ID 511, `lak_l0_dun01`, key `0x03E7000B` | installed `03/C0/00/00.DAT` |
| Client layout identity | `lak_l0_dun01/Test`, `lak0Dungeon01` | installed `03/E7/00/0B.DAT` |

Layout 501 (`lak_l0_fld01`, `0x03E70001`) is the two-megabyte Mor Dhona/open
field package and supplies the open-world stronghold context. Layout 511 is the
22,512-byte isolated Tower room package selected by zone parameter 5014.

The two server zone rows probably represent retail entry/return variants. They
resolve to the same zone parameter, layout, region master, and internal zone
name, so there is no evidence for a second visual layout.

## Tower room composition

The duty DAT has 23 authored dependency rows (22 nonzero asset keys) and names
the following semantic layout pieces. Offsets are preserved in
`high_signal_strings.csv`.

### Spaces and markers

- `sgrp_room`
- `beacon_room`
- `sgrp_taihi_room` / `taihi_room` (retreat or safe room)
- `sgrp_shutter`
- `pomk_0001` and `pomk_0002`
- `lak0Dungeon01` and `lak0Dungeon01a` divide-map folders

The binary contains the `EnemyPathBaseObject` class descriptor, but its
serialized node count is **zero**. In other words, this payload supports that
object type at the schema level but does not author an enemy path in the Tower.
That negative result is recorded in `layout_type_inventory.csv`.

### Static geometry

- main floor, retreat-room floor, wall, end wall, pillars, gate, and shutter
  BG parts
- the texture references remain under
  `gra_rapture/shaderlib/bg_public/lak_l0/sourceimages/`
- the layout's own resource path is
  `gra_rapture/bg/public/lak_l0/dun/layout/lak_l0_dun01/lak_l0_dun01.reference.dst`

### Complete placement graph

The `SEDBlyb` body contains 141 declared nodes, 26 discovered class
descriptors, four divide-map folders, and **67 unique placed InstanceObjects**.
The divide-map pointer cells give direct ownership rather than relying on a
printable-name scan:

| Folder | Placed objects | Bounds, min X/Y/Z | Bounds, max X/Y/Z |
|---|---:|---|---|
| `Bk_resident` | 0 | `(0, 0, 0)` | `(0, 0, 0)` |
| `Bk_isgrp_000001` | 19 | `(-15.1434, 0, -15.1434)` | `(15.1434, 0.9972, 15.1434)` |
| `Bk_ibgpl_000001` | 16 | `(-24, ~0, -24)` | `(24, 0.002, 39)` |
| `Bk_isgrp_000011` | 32 | `(-13.5, -0.0432, 37.9721)` | `(13.5, 11.2066, 64.944)` |

The first room places a nine-fold ring of `sgrp_l0f0_q1_pilr1_h` groups at
40-degree intervals around the origin. Each group contains the pillar body,
the red `lght_0002` at local `(0, 7.4, 3.65)`, and the pillar end. The connector
occupies the strip from the main chamber toward Z=39 and owns the shutter group
at `(0, 0, 22.662)`. The retreat room is centered at approximately
`(0, 0, 51.444)` and owns the second wall/gate/shutter shell.

The exact instance node, pointer cell, GID, position, Euler rotation, scale,
reference node, and reference type for all 67 placements are in
`layout_instances.csv`. The 12 nested unit-tree members are in
`unit_tree_members.csv`; none of their transform fields are omitted.

### Gate/shutter timelines

The shutter is not a speculative server-only object. The client layout embeds
two complete `SEDBSCB` scheduler packages:

| Timeline | Scheduler effect | Client target |
|---|---|---|
| `time_bg_gate_open` | `gate_open` / `sdef_open` | shutter BG part |
| `time_bg_gate_close` | close scheduler / `sdef_close` | `l0f0_q1_shtr1_h` |

The open package has a 1.00-second active block. Its `LayTransformClip` starts
at 0.00s and its `LaySEClip` starts at 0.01s. The close package has a
0.25-second active block and starts both sound and transform at 0.00s. Actor
bindings, track IDs, clip GIDs, raw flags, and complete clip payload bytes are
preserved in `timeline_controlled_actors.csv` and `timeline_clip_entries.csv`.
The transform FCurves expose the actual vertical travel: open moves channel 1
from 0.0 at curve time 0 to 4.5 at time 100, with ten authored Hermite keys;
close moves it from 4.5 at time 0 back to 0.0 at time 25, with six keys and a
small `-0.01` overshoot at time 24. The exact tangents are retained in
`tower_fcurve_channel_records.csv`.

This agrees with the recovered Beacon map-object contract: the server should
change the object state and run the named background scheduler; it should not
invent a new animation.

### No separate Tower light scheduler

The complete layout-511 timeline inventory resolves the light-scheduler
hypothesis negatively. It contains exactly two timelines,
`time_bg_gate_open` and `time_bg_gate_close`, and both control only the shutter
and its sounds. No timeline, unit-tree alias, or controlled actor references
`lght_0001` through `lght_0005`, `ilght_000001` through `ilght_000004`, or the
repeated `lght_0002_002`.

This is now backed by a positive comparison rather than only a Tower name
search. The Mun-Tuy Cellars layout 311 contains explicit `time_pointlight_b`
and `time_pointlight_c` packages. Each contains a
`LayRapturePointLightClip`, controlling `PointLight_B_00` and
`PointLight_C_00`. The Tower contains zero clips of that class. The comparative
rows are in `light_scheduler_crosscheck.csv`.

The custom AuroraFlare weather 8076 imports Starlight's Gridania seasonal/event
layer unchanged. Its payload contains 14 weather timelines (`time_sky_00`,
`time_wtr_00`, the `time_dwev_*` family, and `time_sqnc_24`) plus 29 global
weather-light objects. Those timelines select sky and draw-environment states
and retain the embedded `sky0_star` night sequence, but the payload contains
none of the Tower light names. `!weather night` changes the atmosphere; it
cannot dispatch a Tower lights-on state.

The native boundary is now proven. `WeatherManager::RegistWeatherLayout` at
`0x007E7480` classifies names containing `dwev_0`, `dwev_1`, and `dwev_2`, sets
transition mode 1 or 2 when the current and next families differ, and submits
interpolated draw-environment state. `WeatherManager::OnUpdate` passes normalized
`0..1` transition progress to `WeatherManager::Leap`; Leap blends the oldest and
newest queued DrawEnv entries and removes the old entry at `1.0`. A separate
camera/player spatial query chooses the current layout object name to register.
This is automatic weather layout behavior; it does not go through a map-object
or BG scheduler. The observed missing lights under 8076 are consequently a
Starlight weather draw-environment/compositing result, not evidence of a missing
`_runBgScheduler` call. Exact native instruction ranges and the executable hash
are retained in `weather_drawenv_controller_abi.csv`. A hash-guarded, read-only
probe of the running client closes the suffix boundary: the observed Tower test
state registers `dwev_00`, with transition fraction `1.0`, mode `0`, and one
queued DrawEnv entry. The capture is in `live_weather_drawenv_probe.json` and
the non-injecting probe is `tools/probe_ffxiv_weather_drawenv.py`.

## Authored interior lighting and screen environment

The Tower has its own interior lighting layer inside `lak_l0_dun01`, in addition
to the weather draw-environment overlay:

- four instance lights: `ilght_000001` through `ilght_000004`;
- five named lights: `lght_0001` through `lght_0005`;
- the same `lght_0002_002` light instanced across groups `isgrp_000002` through
  `isgrp_000010`;
- two draw environments, `dwev_00` and `dwev_20`;
- `glare_0001`;
- `shadow_0001`;
- `ColorCorrection_0001`;
- `VolumetricLight_0001`;
- `Blur_0001`.

The deeper object-graph pass now recovers the exact authored light values:

| Light | RGB | Intensity | Radius fields | Placement role |
|---|---|---:|---:|---|
| `lght_0001` | `#A8FDF0` | 1.0 | 40.0 | main chamber at `(0, 6.5, 0)` |
| `lght_0002` | `#FC1603` | 1.0 | 6.0 | repeated in the nine-pillar ring |
| `lght_0003` | `#389AFC` | 3.0 | 20.0 | main chamber at `(0, 6.5, 0)` |
| `lght_0004` | `#FDA964` | 1.0 | 21.2 | retreat room at `(0, 6.5, 51.444)` |
| `lght_0005` | `#FFF9CA` | 1.5 | 11.0 | retreat room at `(0, 6.5, 51.444)` |

The capture visually validates the main-chamber half of this mapping before
the render-state handoff: the center floor is lit cyan/blue, matching colocated
`lght_0001` and intensity-3 `lght_0003`, while the perimeter/pillar treatment
is red, matching the nine instances of `lght_0002`. After the handoff those
specific scene colors disappear even though colored UI survives. The orange
and cream `lght_0004`/`0005` pair belongs to the separate retreat room at
`z=51.444` and is not visible from the capture's entry-facing camera.

All five serialize a cone angle of π/6, a zero penumbra angle, and a zero
`DecayRate`. The installed client's `LightBaseObject` property printer supplies
the exact labels and storage types: `Color` at `0x20..0x28`, `Intensity` at
`0x2C`, float `DecayRate` at `0x30`, `ConeAngle` at `0x34`,
`PenumbraAngle` at `0x38`, and byte `LightType` at `0x44`. The native getter
addresses and client executable hash are retained in `native_light_abi.csv`.

Named objects in comparison layout 311 directly establish the type values:
`DirectionalLight = 0`, `PointLight_A = 1`, and `AmbientLight = 3`. Every Tower
light has `LightType = 1`, so all five are point lights. The value at `0x44` is
not an enable flag and says nothing about dormant/active state. The same native
printer labels the getter-backed float at `0x3C` as `Radius`, confirming the
exact authored radii of 40, 6, 20, 21.2, and 11. The conditional float at
`0x48` repeats that value in every sampled point light, but its separate role
remains unproven and is retained as `radius_candidate_b`. The consistently
serialized integer `200` at `0x40` and the `0x4C` tail also remain explicitly
unknown rather than being mislabeled as decay.

The screen-environment root `scev_0001` directly links the five children at
relative offsets `0x428C`, `0x42D0`, `0x4334`, `0x43F0`, and `0x4380`. Every
four-byte field in those glare, shadow, color-correction, blur, and volumetric
objects is exported twice—as raw `uint32` and as `float32`—in
`screen_environment_raw_fields.csv`. The two draw-environment objects receive
the same lossless treatment in `draw_environment_raw_fields.csv`. This keeps
all values available without assigning attractive but unproven semantic names.

The native `ScreenEnvBaseObject` interface now resolves getters and storage for
45 component parameters in `screen_environment_parameters.csv`; 29 retain
native diagnostic labels and the 16 volumetric fields remain conservatively
numbered. In particular, the client reads the Tower payload as:

| Component | Enabled | Native-labeled authored values |
|---|---:|---|
| Glare | false | threshold 1.05, brightness 1.0, type 2, saturation 1.0, latitude 0.0–1.0 |
| Shadow | false | bias 0.005, direction `(0,1,0)`, color `(0.4,0.4,0.4,0.5)` |
| Color correction | false | HSV `(0,0,0)`, brightness/contrast/noise 0, noise offset 0.1, vignette exponent 5 |
| Blur | false | position `(0,0)`, scale 1, white color, alpha 0.5 |
| Volumetric light | false | three float3 vectors, ten float scalars, and two uint32 modes are getter-proven; retail labels remain unresolved |

So `scev_0001` is an authored parameter bank, but it is not serialized as five
always-on effects. A later render-state copy/override remains possible; the
payload itself does not support treating this bank as the missing lights-on
scheduler.

The complete volumetric block is no longer opaque. Native getters cover all of
its meaningful serialized range: vectors at `0x10..0x18`, `0x20..0x28`, and
`0x4C..0x54`; scalars at `0x1C`, `0x2C..0x48`, and `0x60`; integer modes at
`0x58` and `0x5C`; and the enabled bit at `0x64`. For the Tower those exact
values include vector 0 `(0.745,0.745,0.745)`, scalar values `1.0`, `0.5`,
`0.15`, `0.4`, `0.15`, `700`, `0.2`, `0.15`, `1.5`, and `1.0`, modes `4/0`,
and two zero vectors. `native_volumetric_light_abi.csv` records the getter for
every field. The fields are deliberately numbered because no trustworthy
retail diagnostic labels survive for them.

The adjacent native Cut-plugin class does preserve four property names:
`SunPosition`, `SunArea`, `SunColor`, and `VolumetricLight`. Their exact
executable offsets and virtual addresses are in
`native_volumetric_clip_properties.csv`. Those names belong to
`VolumetricLightClip`; they do not justify renaming the 16 serialized
`VolumetricLightObject` fields one-for-one. No Tower timeline, retail 8032
timeline, or installed 8076 timeline binds a `VolumetricLightClip`, so this is
a useful native semantic boundary rather than evidence of a hidden Tower
volumetric scheduler.

The two Tower DrawEnv objects are also identical through the final recovered
native getters. Both set feature-mask bit 2 at `0x0C`, return the conditional
flag at `0x2C` as true, return scalar `500.0` from `0x34`, and mode `0` from
`0x38`. Nearby client code names `UpdateWindParameter`, but the call edge is not
strong enough to rename these four serialized fields as wind controls.
`native_draw_environment_abi.csv` therefore preserves the exact getters and
values while keeping their purpose unlabeled.

The Tower also has two embedded FCurve resources with six properties and 36
serialized channel/key records. Their
property-level inventory is in `lighting_fcurve_inventory.csv`, while
`tower_fcurve_channel_records.csv` retains every constant/key record, raw word,
interpolation mode, value, and tangent.

That distinction matters: the dark room visible in period footage is not just
a weather tint. It is the product of the authored interior light/screen layer
above, with the region weather controller composited on top.

## Special-weather decomp

`lak_l0` exposes six ordinary weather children, one debug child, and three
event children:

| ID | Token | DAT key | Role |
|---:|---|---|---|
| 8001 | `wtr_fine` | `0x03E70003` | clear |
| 8002 | `wtr_suny` | `0x03E70004` | fair |
| 8003 | `wtr_clod` | `0x03E70005` | cloudy |
| 8004 | `wtr_mist` | `0x03E70006` | fog |
| 8007 | `wtr_rain` | `0x03E70007` | rain |
| 8017 | `wtr_fogd` | `0x03E70008` | Mor Dhona dust |
| 8065 | `wtr_h001` | `0x03E70009` | debug/test |
| 8031 | `wtr_chry` | `0x03E7000C` | aurora event atmosphere |
| 8030 | `wtr_comp` | `0x03E7000D` | Dalamud/cloud atmosphere |
| **8032** | **`wtr_xmas`** | **`0x03E7000E`** | **Dalamud Thunder** |

The event payload comparison is unusually strong:

| Payload | Size | Dependency rows | Embedded FCurve resources | FCurve properties |
|---|---:|---:|---:|---:|
| 8031 / Aurora | 102,336 | 41 | 54 | 276 |
| 8030 / Dalamud | 99,520 | 55 | 54 | 276 |
| **8032 / Dalamud Thunder** | **100,688** | **66** | **54** | **276** |

For 8030 and 8032, all 276 FCurve rows match exactly in property order, type,
channel count, interpolation/key counts, and hashes of every serialized float
value. Their authored lighting grade therefore has no recovered numeric
difference. It contains:

- sky main/sub-light direction and color curves;
- ambient and diffuse curves;
- top/middle/bottom sky-gradient colors;
- eight authored fog groups;
- 34 color controllers;
- 34 character-light bias controllers;
- 34 VFX-light bias controllers;
- glare curves and local draw-environment variants.

8032 then adds the `vfx_tunder1` group over that same Dalamud lighting grade:

| Group row | Type | Asset key |
|---|---|---|
| `vfx_tunder1` | group marker | none |
| `thdr0001s` | texture/VFX resource | `0x619F0051` |
| `thdr0001y` | model/VFX resource | `0x61A00049` |
| `thdr0002y` | model/VFX resource | `0x61A0004A` |
| `thdr0004y` | model/VFX resource | `0x61A0004B` |
| `tund_vx1y` | model/VFX resource | `0x61A0004C` |
| `tunder1` | effect resource | `0x61A30023` |

The remaining two rows in that group reuse the weather audio and leaf-instance
resources. This is why the old `wtr_xmas` token must not be interpreted from
its English-looking name: the actual dependency graph says thunder.

### What installed 8076 actually inherits

Weather 8076 is not a retail Tower payload. A direct comparison against its
restored Starlight source `0x29B00030` accounts for every changed byte in the
installed v16 overlay:

| Property | Restored Starlight | Installed 8076 |
|---|---:|---:|
| Payload bytes | 118,688 | 118,688 |
| Nonzero dependency rows | 35 | 30 |
| FCurve channel/key records | 2,565 | 2,565 |
| FCurve records changed | — | **0** |
| Changed bytes | — | **119** |

The 119 changed bytes are exclusively the nonzero bytes blanked from dependency
entries 25–29, the five `cam_xmas` snowfall rows. Timeline names, compiled-SCB
locations/sizes, the entire DrawEnv UnitTree graph, and all 2,565 FCurve records
are byte-for-byte identical. The current overlay builder contains a newer
midnight-retint path, but that code is not present in the installed v16 `32.DAT`
being debugged here. `weather_8076_derivation_summary.csv` records the complete
proof; `weather_8076_fcurve_changes.csv` intentionally has no data rows.

8076 still differs materially from retail Tower candidate 8032 because its
unchanged source is Starlight:

| Render graph | Tower layout 511 | Retail 8032 | Custom 8076 |
|---|---:|---:|---:|
| ScreenEnv roots / child links | 1 / 5 | 8 / 19 | 9 / 21 |
| Enabled screen components | 0 | 14 | 16 |
| DrawEnv objects | 2 | 9 | 10 |
| Timeline objects / compiled SCBs | 2 / 2 | 13 / 11 | 14 / 12 |
| `time_dwev_01` | absent | absent | **present** |
| Render clips | 4 | 73 | 118 |

The extra enabled components are exactly `glare_01` and `shadow_01`.
`glare_01` uses threshold `1.05`, brightness `1`, type `2`, saturation `1`,
latitude `0..1`, and no multi-direction latitude. `shadow_01` uses bias
`0.002`, direction `(0,0.7,0.7)`, black color with alpha `0.5`, and a non-fixed
direction. All overlapping 8032/8076 glare and shadow parameter rows are
otherwise identical.

Starlight's compiled `time_dwev_01`, inherited unchanged by 8076, is a
2.4-second package with
eight clips starting at time zero:

| Clip | Controlled actor |
|---|---|
| `LayRaptureDirectionalLightClip` | `sub_lght_01` |
| `LayRaptureDirectionalLightClip` | `main_lght_01` |
| `LayRaptureScreenEnvGlareClip` | `scev_01` |
| `LayEnvMapClip` | `envmap_01` |
| `LayRaptureFogParamClip` | `fog_01` |
| `LayRaptureSunMoonClip` | `main_lght_01` |
| `LayRaptureSunMoonClip` | `sub_lght_01` |
| `LayRaptureAmbientLightClip` | `amb_lght_01` |

That is a complete global render lane, not a decoration toggle. It is useful
provenance evidence, but the live client does not select it at the observed
Tower position. Starlight/8076
also carries material actors `diffuseColor_00`, `lightMapOcclusi`, `entmdl_00`,
`entmdl_20`, and `litclr_00` that do not occur in retail 8032's material actor
set. Exact package and clip rows are in `weather_timeline_packages.csv` and
`weather_timeline_render_bindings.csv`; all ScreenEnv values are in
`weather_screen_environment_parameters.csv`.

The native transition path is now substantially recovered.
`WeatherManager::OnUpdate` calls the routine at `0x007E2330`, which computes
elapsed/target weather-transition progress and clamps it to `0..1`. The nearby
86,400 remainder guard is part of that calculation, but does not make the
result a day-clock sample. OnUpdate passes the fraction directly to
`WeatherManager::Leap` at `0x007E78D0`. Leap selects the oldest and newest
12-byte queued DrawEnv entries, calls `0x007E6690` to blend their light,
environment-map, fog, ScreenEnv, shadow/material, and related renderer banks,
and removes the old entry when progress reaches `1.0`. Independently, the
spatial query at `0x007DB9C0` selects the current layout/draw-environment object
around the camera/player, and its caller at `0x007DCE8C` registers that object's
name with `WeatherManager::RegistWeatherLayout`. The registration function's
literal table at `0x00FEF4C0..0x00FEF4F8` contains only two repeated triplets of
`dwev_0`, `dwev_1`, and `dwev_2`; it never tests an exact second-suffix name
such as `dwev_01`. The caller at `0x007DCE65..0x007DCEA5` closes the handoff:
only when the selected spatial object pointer changes, it obtains that object's
exact name through virtual method `+0xA4`, calls `RegistWeatherLayout` with the
new and previous names, then caches the new name. A separate comparison against
literal `dwev_0` drives the manager's `+0x1A4` family-fade direction flag.

The Starlight FCurves use a `0..240` domain because serialized FCurve time is in
centiseconds. The Tower shutter independently establishes that encoding:
raw `0..100` compiles to 1.00 second and raw `0..25` compiles to 0.25 second.
Accordingly, both the active `time_dwev_00` and inherited `time_dwev_01` raw
`0..240` domains exactly match their compiled 2.4-second active durations. All
975 property/channel profiles across the ten compiled
`time_dwev_*` lanes are exported in
`weather_transition_timeline_profile.csv`. `sgrp_dwev_01` directly owns
`main_lght_01`, `sub_lght_01`, `amb_lght_01`, and alias `time_dwev_01`; the
full 48-member inherited graph is in `weather_drawenv_unit_tree_members.csv`.

The cross-wrapper census resolves what the inherited but inactive `_01`
represents. All nine
inspected Mor Dhona local wrappers—8001, 8002, 8003, 8004, 8007, 8017, 8030,
8031, and 8032—omit `dwev_01`. All six installed Gridania seasonal/event
wrappers 8027 through 8032 include it, each as `sgrp_dwev_01` with four members,
instantiated by `isgrp_000019` with serialized GID 942. Restored Starlight and
8076 inherit the same structure. The complete comparison is in
`weather_special_lane_census.csv`. This is direct evidence that `_01` is a
standardized Gridania seasonal/event overlay lane carried into Mor Dhona by the
universal 8076 payload—not a Tower light scheduler and not a night-clock lane.

The live result shifts the active failure analysis to `dwev_00`. Clear 8001 and
8076 both run a compiled 2.4-second `time_dwev_00` package. Clear has nine clips
covering the two directional lights, ambient light, fog, vertical fog,
environment map, glare, and two sun/moon bindings. 8076 retains those nine
roles and adds two `LayRaptureMaterial2Clip` actors:

| Extra active 8076 actor | Applied RGBA |
|---|---:|
| `diffuseColor_00` | `(0,0,0,0)` |
| `lightMapOcclusi` | `(1,1,1,1)` |

The renderer-side channel meaning is now native-proven. The runtime
`RaptureMaterial2Clip` vtable is at `0x01039E2C`; initialization at `0x00835250`
resolves the `Attr` FCurve and four channel handles. Application at `0x00835470`
samples those handles, appends literal suffixes `R`, `G`, `B`, and `A` to the
controlled actor name, and submits each resulting name/value pair to every
material entry in the active container (`+0x360` count, `+0x364` array,
`0x54`-byte stride). The four results are cached at clip offsets
`+0x40..+0x4C`. Consequently, 8076 really broadcasts zero RGBA for its active
diffuse-color override and one RGBA for its light-map-occlusion override; these
are not opaque flags. The exact vtables, functions, literals, and fields are in
`native_material2_clip_abi.csv`, while the complete clear/8032/8076 lane
comparison is in `weather_tower_lane_comparison.csv`.

The best-supported explanation of “visible for a second, then breaks” is that
layout 511 exposes its authored point-light/interior state during raw layout
initialization, after which the server's ordinary zone-in `SetWeather` makes
WeatherManager settle another DrawEnv render bank over it. This sequence is
supported by native queue/blend code, the exact payload graphs, the captured
timing, and two live registered-name probes. The second probe reports
`dwev_20`, proving the right dungeon layout is underneath the replacement.
8076 makes the failure stronger through its zero diffuse-color and full
light-map-occlusion broadcasts, but clear 8001 does not reconstruct an already
discarded Tower bank either. There is still no Tower point-light scheduler to
start afterward. The focused reconstruction test is therefore to omit the
initial weather packet entirely and leave layout 511's render state untouched.

## Script boundary and weather assignment

The recovered client class is only:

```lua
require("/Director/InstanceRaid/InstanceRaidBaseClass")
_defineClass("InstanceRaidBeaconBattle", "InstanceRaidBaseClass")
```

There is no `_setWeather` call in the Beacon subclass. This is meaningful
negative evidence because the separate Rivenroad subclass does contain a
cutscene-event parameter and calls `_setWeather(weatherId, 0)`. The two duties
must not be conflated.

Consequently, the exact retail server command or event parameter that selected
8032 has not been recovered. The reconstruction is nevertheless supported by:

1. 8032 being a native child of the exact `lak_l0` region parent;
2. its dependency graph being the complete Dalamud grade plus explicit thunder;
3. the mission's Tower/Dalamud context;
4. the period mission footage showing the battle in the same dark, high-contrast
   interior treatment; and
5. the absence of a competing Tower-specific weather payload in this region.

Period player reports also describe the same isolated interior encounter, its
central transmitter, three protection beams/generators, Magitek unit, and
imperial reinforcements ([official FFXIV forum thread](https://forum.square-enix.com/ffxiv/threads/47215-Castrum-Novum-battle-strategies-and-wins)).
The archival full mission recording inspected for the visual cross-check is
[RydiaMist's 1.22b United We Stand footage](https://www.youtube.com/watch?v=VGdz1gjQPrE).

## Reconstruction contract

When a real content script is added, the minimal faithful environment setup is:

```lua
function onZoneIn(player, contentArea)
    -- The instance manager suppresses zone-in weather; replay only server state.
    GetWorldManager():ReplayTransmissionTowerState(player)
end
```

Do not send either the ordinary zone-in weather bootstrap or a content weather
override after entry. Preserve the
`lak_l0_dun01` layout and its own
`dwev_00`/`dwev_20`, lights, glare, shadow, color correction, volumetric light,
and blur. The forced weather is an overlay, not a replacement for those authored
interior components.

Recommended server-facing identifiers:

```text
content id       13
zones            251, 264
zone parameter   5014
layout child     511 / lak_l0_dun01 / 0x03E7000B
runtime weather  none / layout-owned / zone-in SetWeather suppressed
probe payload    8032 / wtr_xmas / 0x03E7000E / Dalamud Thunder
```

## Runnable reconstruction

The recovered environment is now wired as a runnable content shell:

- `TransmissionTowerManager` creates a private copy of zone 251/region 105,
  lands players at the live private-copy transform `(0, -100, 0)`, and
  constrains movement to the union of the recovered divide-map bounds.
- `TransmissionTower.lua` does not force weather, and the dynamic Tower area
  disables its normal zone-in weather bootstrap. A captured 8032 test settled
  into opaque gray fog; 8076 made that fog recede but removed the lights; clear
  8001 did not restore a bank already lost to the settled weather render state.
- The manager publishes one `DoorServer` map-object controller bound to layout
  511, instance 12 (`isgrp_000012` / `sgrp_shutter`). The packet-facing ID is
  the numeric suffix of the instance name; serialized node GID 935 is a
  different identifier. Live state changes send
  the exact `open` or `clos` scheduler alias; replaying an already-open state
  uses the recovered five-second midstream settlement convention. Its server
  controller applies the same -100 Y runtime offset as the private-area floor.
- Geometry, the five lights, both draw environments, and `scev_0001`'s five
  post-processing children are not spawned by the server because they are
  already part of the client layout.

Use `!testtower` for a solo development entry, then `!testtower status`,
`!testtower open`, `!testtower close`, and `!testtower exit`. `!testtower
retail` applies the recovered 4–8 player, level-45, United We Stand eligibility
surface. The GM-only solo entry deliberately bypasses those eligibility checks
so lighting/layout tests do not depend on the character class currently under
development.

After a deployed run, verify the server/protocol half without relying on chat
text or memory:

```powershell
python tools/probe_ffxiv_weather_drawenv.py --pid <ffxivgame-pid> `
  --json "outputs/castrum-novum-transmission-tower-decomp-20260817/live_post_entry_drawenv_probe.json"

python tools/verify_transmission_tower_live_test.py `
  --server-log "Map Server/bin/Release/Logging/2026-08-19/map.log" `
  --windower-log "../Launcher Windower/New/FFXIV Meteor Launcher/bin/x86/Release/net48/Windower/Logs/Windower.log" `
  --drawenv-probe "outputs/castrum-novum-transmission-tower-decomp-20260817/live_post_entry_drawenv_probe.json" `
  --json "outputs/castrum-novum-transmission-tower-decomp-20260817/live_test_result.json"
```

Before the command is used, the verifier returns `pending`. A passing run must
show the new `weather=layout-owned/suppressed` entry contract, the executed
weather-bootstrap skip, a completed content zone-in, and the Windower-observed
region 105 / zone 251 handshake. When given the probe, it additionally requires
the settled client to report the dungeon-exclusive `dwev_20` in the exact same
post-entry run. Visual persistence of the authored cyan/red bank remains the
final client-facing assertion.

This is an environment and shutter reconstruction, not a claim that the absent
retail server script has been recovered. In particular, weather 8032 remains a
directly recovered `lak_l0` payload but is no longer forced as the runtime
baseline because capture disproved it as a stable duty-wide grade. The
30-minute shell duration and zone 251 as the primary runtime copy remain
explicitly reconstructed choices. The live entry transform `(0, -100, 0)` is
runtime-observed; the client-authored
layout/light/scheduler values themselves are direct binary evidence.
