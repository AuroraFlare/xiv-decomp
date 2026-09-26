# Castrum Novum Transmission Tower decomp

Generated from the installed FFXIV 1.23b client by:

```powershell
python tools/build_castrum_novum_transmission_tower_decomp.py
```

The bundle separates direct binary/table evidence from reconstruction:

- `zone_content_identity.csv`: content/zone/zoneParam/layout chain.
- `region_resource_chain.csv`: every `lak_l0` region child and weather row.
- `resource_inventory.csv`: hashes and structural counts for field, duty, and event-weather DATs.
- `resource_dependencies.csv`: decoded MapLayoutResourceData dependency rows.
- `high_signal_strings.csv`: tower gimmick, lighting, draw-environment, scheduler, and weather strings with byte offsets.
- `printable_strings.csv`: complete printable-string dump for the five target DATs.
- `lighting_fcurve_inventory.csv`: every embedded FCurve property, type, channel count, animation count, and value range.
- `tower_fcurve_channel_records.csv`: every Tower FCurve constant/key record, including raw words and tangents.
- `layout_type_inventory.csv` and `layout_named_nodes.csv`: the complete serialized class/node inventory.
- `divide_map_folders.csv` and `layout_instances.csv`: all 67 owned placements, transforms, and references.
- `unit_tree_members.csv`: all 12 nested room, pillar/light-ring, and shutter members.
- `light_parameters.csv`: exact point-light colors, intensities, decay, angles, and preserved ambiguous tail fields.
- `native_light_abi.csv` and `light_type_crosscheck.csv`: client getter/property labels and cross-layout proof that Tower LightType 1 means point light.
- `light_scheduler_crosscheck.csv`: Tower's zero point-light clips beside a dungeon that authors explicit point-light tracks.
- `screen_environment_links.csv`, `screen_environment_parameters.csv`, and `screen_environment_raw_fields.csv`: post-processing graph, getter-backed values/enabled bits, and lossless serialized words.
- `native_volumetric_light_abi.csv`: exact getter/storage map for the complete volumetric-light block; unlabeled fields remain conservatively numbered.
- `native_volumetric_clip_properties.csv`: native Cut clip names (`SunPosition`, `SunArea`, `SunColor`, `VolumetricLight`) and the explicit no-binding boundary.
- `draw_environment_raw_fields.csv` and `native_draw_environment_abi.csv`: lossless words plus the final feature/flag/scalar/mode getters; unresolved retail names remain conservative.
- `timeline_packages.csv`, `timeline_controlled_actors.csv`, and `timeline_clip_entries.csv`: decoded shutter scheduler packages and clip timing.
- `weather_render_state_comparison.csv` and `weather_screen_environment_parameters.csv`: Tower-owned state beside retail 8032 and custom 8076.
- `weather_timeline_packages.csv` and `weather_timeline_render_bindings.csv`: every weather draw-environment timeline and controlled render actor.
- `weather_drawenv_controller_abi.csv`: native WeatherManager evidence for automatic `dwev_0`/`dwev_1`/`dwev_2` lane registration and interpolation.
- `weather_special_lane_census.csv`: nine Mor Dhona wrappers beside six Gridania seasonal/event wrappers, proving that `_01` is standardized city-event state imported by 8076 rather than a native Tower lane.
- `weather_tower_lane_comparison.csv`: clear 8001, retail 8032, and custom 8076 compared lane-by-lane; the live-selected `_00` lane exposes 8076's two extra material overrides.
- `native_material2_clip_abi.csv`: RTTI/vtables and native proof that Material2 `Attr` channels are broadcast as named R/G/B/A material parameters.
- `live_weather_drawenv_probe.json`: hash-guarded read-only capture of the active WeatherManager name and transition/queue state; regenerate with `tools/probe_ffxiv_weather_drawenv.py`.
- `live_layout_drawenv_probe.json`: separate live capture proving the Tower client selected dungeon-only `dwev_20`, not field layout 501.
- `runtime_capture_analysis.json`, `runtime_capture_signalstats.csv`, and `runtime_capture_contact_sheet.png`: reproducible 10 Hz measurement and visual sequence of the colored Tower state collapsing at the DrawEnv handoff.
- `tools/verify_transmission_tower_live_test.py`: post-deployment verifier for the layout-owned entry contract, weather-bootstrap omission, completed region-105/zone-251 handoff, and an optional read-only post-entry `dwev_20` client-probe gate.
- `weather_8076_derivation_summary.csv` and `weather_8076_fcurve_changes.csv`: byte-for-byte restored-Starlight provenance; the latter intentionally contains only its header because this installed 8076 changes no FCurve record.
- `weather_transition_timeline_profile.csv`: all 975 property/channel profiles across the ten compiled `time_dwev_*` lanes; serialized curve time is centiseconds, so raw 0-240 is a 2.4-second transition.
- `weather_drawenv_unit_tree_members.csv`: all 48 members of the eleven Starlight draw-environment UnitTrees inherited unchanged by 8076.
- `tower_layout_topdown.svg`: top-down reconstruction generated directly from the placement records.
- `evidence_matrix.csv`: direct findings, negative findings, and the inferred reconstruction boundary.
- `summary.json`: machine-readable result.

Important boundary: `8032` is directly proven to be a native `lak_l0` Dalamud
Thunder payload with thunder VFX. The original recovered client Lua does not
contain a static content-13 -> weather-8032 assignment, and runtime capture
rejects forcing it continuously because it settles into opaque gray fog. Its
original use was transient or depended on unrecovered server/event-side state.

The runnable reconstruction lives in:

- `Map Server/CastrumNovum/TransmissionTowerManager.cs`
- `Data/scripts/content/TransmissionTower.lua`
- `Data/scripts/commands/gm/testtower.lua`

It deliberately publishes only layout 511's shutter controller (instance 12,
from `isgrp_000012`; serialized node GID 935 is a different identifier).
Geometry, lights, draw environments, and screen effects remain client-owned.
Runtime capture showed forced 8032 settling into opaque gray fog, while 8076
removed the fog but visually suppressed the Tower light bank. Byte comparison
now proves that 8076 did not author or retint that lighting behavior: it inherits
the complete restored-Starlight graph and all 2,565 FCurve records unchanged,
zeroing only five snowfall dependency entries (119 changed bytes). Starlight's
`time_dwev_01` lane binds fog, ambient/directional light, sun/moon, environment
map, glare and shadow, but a read-only live WeatherManager probe during the
Tower test resolves the selected name to `dwev_00`, not `_01`. The active 8076
`time_dwev_00` package has eleven clips and adds two Material2 actors absent
from clear 8001's corresponding lane: `diffuseColor_00` with `Attr=0` and
`lightMapOcclusi` with `Attr=1`. Native `RaptureMaterial2Clip` code proves that
`Attr` is RGBA: it appends `R`, `G`, `B`, and `A` to the actor name and
broadcasts the four sampled values across the active material container. Thus
the selected lane applies diffuse color `(0,0,0,0)` and light-map occlusion
`(1,1,1,1)`. Its raw FCurve span of 0-240 uses the same
centisecond encoding as the Tower shutter and exactly matches the compiled
2.4-second package duration. WeatherManager blends the oldest and newest queued DrawEnv
renderer states with normalized transition progress, removes the old entry at
1.0, and spatially registers the active draw-environment name. All nine
inspected Mor Dhona wrappers omit `_01`; all six Gridania seasonal/event
wrappers instantiate it identically. Thus 8076 imports a standardized Gridania
event graph into the Tower region, but `_01` is inactive at the observed Tower
position. Layout 511 has no
light-control timeline: all five authored lights are LightType 1 point lights,
and its only two timelines are the shutter open/close pair. The runnable shell sends
no content override and suppresses the Tower's normal zone-in SetWeather so
layout 511 keeps its initial authored render state.
Validate that boundary with
`python tools/validate_castrum_novum_transmission_tower_rebuild.py`.
