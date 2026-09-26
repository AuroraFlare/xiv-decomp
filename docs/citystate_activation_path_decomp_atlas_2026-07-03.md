# City-State Activation Path Decomp Atlas - 2026-07-03

Generated: 2026-07-03T02:17:53+00:00

## Inputs

- Raw city decor occurrences: `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_city_decor_occurrences.csv`
- Raw family scores: `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_decor_stem_family_scores.csv`
- Raw owner bridges: `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_isgrp_owner_bridge_extended.csv`
- Best probe queue: `outputs\citystate-decor-probe-bridge-atlas-20260703\best_decor_probe_queue.csv`
- SQL map-object bindings: `outputs\citystate-seasonal-furnishing-decomp-atlas-20260703\mapobj_binding_surfaces.csv`

## Summary

- Activation/runtime surface rows: 10
- Raw owner/family neighborhood windows: 38
- Neighborhood token sequence rows: 5231
- Probe batch rows: 7
- Probe batch command sequence rows: 79
- Raw-adjacent owner candidate rows: 16
- City readout rows: 3
- Neighborhood events: All Saints/Halloween city decor=29, City flag/decor=9
- Neighborhood confidence: medium=12, low-distance-only=12, high=11, fallback-host=3
- Probe batches by city: Ul'dah=3, Gridania=2, Limsa Lominsa=2
- Raw-adjacent candidates by SQL backing: no=16
- Raw-adjacent candidate events: City flag/decor=9, All Saints/Halloween city decor=7

## Readout

- I still do not see a recovered global switch that turns on every city-state seasonal furnishing group by event name.
- The furnishing evidence is stronger as grouped authored layout data than as per-position manual SQL. Each major city Halloween family has `sgrp_*` plus `time_bg_*_show` / `time_bg_*_hide` in the city DAT.
- The server-side/live bridge still needs a source actor. `!testbgschedulerlong` uses `RunEventFunctionPacket` to call `_runBgSchedulerFromMidstream` on a live map-object owner.
- `MapObjOnlyShowHide` and `BeaconFortGateGimmick` are the important script patterns: one is a fixed show/hide actor-class runner, the other can accept arbitrary scheduler names, but this pass did not find city SQL rows that already bind `BeaconFortGateGimmick` to the seasonal city furnishings.
- Ul'dah is the cleanest proof: `isgrp_004289` / spawn `2050` sits close to the `sgrp_w0t0_h0_hlw*` block and now covers `time_bg_hw0..9_show/hide`.
- Gridania is coherent but less tight: `gridania_shipport` / spawn `589` is the best owner for `time_bg_hlw1a..2b_show/hide`.
- Limsa has real `sgrp_bg_hw_obj1_h..8_h` and `time_bg_hw_obj*_show/hide`, but no tight SQL-backed owner emerged. Treat spawn `496` / `guild_msk` as a loose probe, not proof.
- Raw-adjacent owner probes fill that gap for investigation: Limsa has raw `isgrp_003215` 13 bytes before `sgrp_bg_hw_obj1_h`, and Gridania has raw `isgrp_003392` 13 bytes before `sgrp_f0t0_a0_hlw1a_h`; these are not SQL-backed placed rows, so they are lower safety/proof than `!spawnbgobj placed ...` but much closer to the authored DAT blocks.

## Output Files

- `outputs\citystate-activation-path-decomp-atlas-20260703\activation_surface_evidence.csv`
- `outputs\citystate-activation-path-decomp-atlas-20260703\best_owner_neighborhoods.csv`
- `outputs\citystate-activation-path-decomp-atlas-20260703\neighborhood_token_sequence.csv`
- `outputs\citystate-activation-path-decomp-atlas-20260703\city_family_probe_batches.csv`
- `outputs\citystate-activation-path-decomp-atlas-20260703\city_family_probe_batch_commands.csv`
- `outputs\citystate-activation-path-decomp-atlas-20260703\raw_adjacent_owner_probe_candidates.csv`
- `outputs\citystate-activation-path-decomp-atlas-20260703\city_activation_readout.csv`

## First Probe Batches

- Ul'dah Halloween: `!spawnbgobj placed 2050`, then run `time_bg_hw0..9_show/hide` against `man0u0_tutorial_mapobj1`.
- Gridania Halloween: `!spawnbgobj placed 589`, then run `time_bg_hlw1a..2b_show/hide` against `gridania_shipport`.
- Limsa Halloween: `!spawnbgobj placed 496`, then run `time_bg_hw_obj1_h..8_h_show/hide` against `guild_msk` as loose-distance evidence.
- Limsa raw-adjacent Halloween check: `!spawnbgobj 121 3215 5900001`, then `!testbgschedulerlong target time_bg_hw_obj1_h_show 0`.
- Gridania raw-adjacent Halloween check: `!spawnbgobj 321 3392 5900001`, then `!testbgschedulerlong target time_bg_hlw1a_show 0`.
