# Seasonal component-residue datamine (2026-07-12)

## Result

The 287-layout direct-dependency graph contains
**94** structured seasonal component DATs.
All **39** Halloween components have a current
layout owner. Starlight is different: of
**55** Starlight-named components,
**39** are directly owned and
**16** have no direct owner anywhere
in the installed layout corpus.

The 55 Starlight-named components partition without ambiguity:
**7** belong to Gridania's
active `8027` Starlight payload,
**32** are currently owned by
legacy-path cloud/last-weather/thunder groups, and the remaining
**16** are the orphan historical
atmosphere set.

Those 16 orphans are coherent historical atmosphere chains rather than random
strings: **4** Gridania,
**6** Limsa, and
**6** Ul'dah components. They
include camera/cloud leaves, cloud and snow-particle VEFFs, and the Limsa/Ul'dah
snow-particle model/texture pairs. Exact hashed identifiers join leaf -> effect
-> model -> texture across the DATs.

Following the cloud VEFF identifiers into city-local resource banks adds
**9** non-Xmas-named orphan
support DATs: two Limsa cloud models plus two Ul'dah cloud models and five
Ul'dah cloud textures. Five Limsa cloud textures are not orphaned; the active
thunder pack reuses them. The recoverable historical Starlight atmosphere pool
is therefore **25**
components, not just the 16 explicitly Xmas-named files.

This recovers city-specific Starlight **weather/atmosphere component sets**. It
does not recover decoration placement: the city layout wrapper, selector masks,
and placed-prop transforms for Limsa and Ul'dah remain absent.

## Gridania rebinding proof

Two orphan Gridania `wtr_xmas` VEFF DATs are byte-for-byte SHA-256 duplicates of
the VEFF DATs directly owned by Gridania's active `8027/wtr_hall` Starlight pack.
The payload was preserved under new dependency keys when the active seasonal
wrapper moved/rebound; this is concrete evidence for patch-era resource rebinding.

## Ul'dah hidden-weather lead closed

Ul'dah `8069/wtr_h005`, `8028/wtr_smmn`, and `8014/wtr_heat` contain printable
Xmas source paths, but their serialized active groups are `vfx_cam_fire` and
`vfx_sun00001y`. None has an active Xmas-named dependency. They are fire/heat
payloads, not dormant Starlight controls. `8032/wtr_xmas` remains the active
cloud/last-weather/thunder payload, while `8027/wtr_hall` is Halloween.

Therefore no currently mapped Ul'dah weather ID selects the recovered orphan
Starlight chain in final 1.23b. The December 2010 historical patch now supplies
the missing binding directly: `8032 / wtr_xmas -> 0x615A001D`, alongside the
corresponding Limsa and Gridania rows. That historical payload is not
byte-identical to the final thunder payload stored under the same key.

## Remaining wrapper gap

The client contains **203** `SEDBvins` instance
controllers. None references any of the six orphan historical Xmas leaf DATs;
Gridania's two active replacement leaves do resolve to its current controller.
Limsa and Ul'dah thus retain most low-level atmosphere assets, but still need a
rebuilt VINS controller plus a MapLayout wrapper and weather binding. Exact
historical transforms or controller parameters cannot be claimed from this
snapshot.

However, Gridania's active Starlight controller is not a unique city-positioned
format. It is one of **29** installed
1,632-byte four-leaf/two-group VINS templates, and all
**29** share its
exact `0x04E0-0x05BF` transform block. A synthetic controller can therefore be
constructed from a proven generic template by replacing leaf identifiers and
instance indices. That is a technically grounded reconstruction path, not proof
of the exact deleted historical controller bytes.

The inferred Limsa/Ul'dah wrapper manifest now contains
**26** exact surviving asset
keys. Component edges are proven by internal identifiers; the proposed
`vfx_cam_xmas` and `vfx_cloud` grouping is inherited from Gridania's active
schema and remains an explicit reconstruction inference.

## Reproduction

```powershell
python tools/build_seasonal_component_residue_atlas.py
```

Outputs:

- `outputs/seasonal-component-residue-atlas-20260712/seasonal_component_ownership.csv`
- `outputs/seasonal-component-residue-atlas-20260712/seasonal_component_owner_edges.csv`
- `outputs/seasonal-component-residue-atlas-20260712/orphan_starlight_components.csv`
- `outputs/seasonal-component-residue-atlas-20260712/starlight_resource_identifier_edges.csv`
- `outputs/seasonal-component-residue-atlas-20260712/uldah_hidden_weather_active_groups.csv`
- `outputs/seasonal-component-residue-atlas-20260712/gridania_starlight_duplicate_pairs.csv`
- `outputs/seasonal-component-residue-atlas-20260712/starlight_cloud_support_ownership.csv`
- `outputs/seasonal-component-residue-atlas-20260712/starlight_vins_controller_scan.csv`
- `outputs/seasonal-component-residue-atlas-20260712/starlight_wrapper_reconstruction_matrix.csv`
- `outputs/seasonal-component-residue-atlas-20260712/vins_starlight_template_equivalence.csv`
- `outputs/seasonal-component-residue-atlas-20260712/starlight_reconstructed_wrapper_dependencies.csv`
- `outputs/seasonal-component-residue-atlas-20260712/contract_summary.json`

Related: [orphan layout scan](seasonal_orphan_layout_datamine_2026-07-12.md) and
[weather/decor synthesis](seasonal_weather_decor_patch_datamine_2026-07-11.md).
