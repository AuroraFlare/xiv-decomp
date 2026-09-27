# Decoration-only Hatching-tide datamine (2026-07-12)

## Result

Hatching-tide is the first all-three-city seasonal visual lane in this snapshot
that can be positively classified as **scheduler-driven without weather**.
Each capital root layout contains five `vfx_egg_001..005` groups and fifteen
`time_vfx_egg_*` scheduler tokens (left/center/right, variants 1-5):
**15** groups, **45**
schedulers, and **300** serialized component
entries across the three cities.

The packs are intentionally firework-like: each city has 30 egg-named entries
and 55 reused `hana/hanabi` support entries. They are nevertheless identified as
Hatching-tide by the `egg` group/scheduler names, `Spl101`'s explicit
`EASTER_*_G/L/U` methods, the `ObjectEggPod` class, and Hatching-tide quest text.

## Activation bridge

Recovered `MapObjFireworks` generates `v_l1..v_l5`, `v_c1..v_c5`, and
`v_r1..v_r5` and sends them through `_runBgScheduler` at Hydaelyn night. All
**45** city scheduler rows end in exactly one
of those tokens. The actor script contains no weather API and no
`SpecialEventWork` access.

This corrects the earlier Moonfire inference: in the installed root layouts,
the `v_l#/v_c#/v_r#` family resolves to `time_vfx_egg_*`. Separate Limsa/Ul'dah
`hanabi` groups use `vtp1..vtp5`; their runtime controller remains unresolved.
`MapObjFireworks` is therefore positive Hatching-tide visual evidence here, not
positive evidence that weather `8029` launches city fireworks.

The complementary Moonfire scan confirms that all three roots do retain nine
`vfx_hanabi1..9` groups, but their activation family is `vtp1..5`, not the
tokens emitted by `MapObjFireworks`. See
`docs/moonfire_hanabi_residue_datamine_2026-07-12.md`.

## Weather exclusion

The three root layouts contain **10** sparse
weather masks, all for the shared `8030+8032` late-weather infrastructure state.
There are zero `8027` and zero `8029` masks in these roots. The egg groups have
animation schedulers rather than show/hide selector pairs, and `Spl101` contains
no weather call.

This validates the user's retail model: at least Hatching-tide supplied an
all-city authored seasonal visual/decorative effect without a seasonal weather
control.

## Reproduction

```powershell
python tools/build_decoration_only_hatching_tide_atlas.py
```

Outputs:

- `outputs/decoration-only-hatching-tide-atlas-20260712/hatching_tide_city_root_summary.csv`
- `outputs/decoration-only-hatching-tide-atlas-20260712/hatching_tide_scheduler_tokens.csv`
- `outputs/decoration-only-hatching-tide-atlas-20260712/hatching_tide_component_entries.csv`
- `outputs/decoration-only-hatching-tide-atlas-20260712/mapobj_fireworks_hatching_bridge.csv`
- `outputs/decoration-only-hatching-tide-atlas-20260712/hatching_tide_control_plane.csv`
- `outputs/decoration-only-hatching-tide-atlas-20260712/seasonal_activation_lane_corrections.csv`
- `outputs/decoration-only-hatching-tide-atlas-20260712/contract_summary.json`
