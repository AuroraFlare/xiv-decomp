# City-State Decor Probe Bridge Atlas - 2026-07-03

Generated: 2026-07-03T02:09:17+00:00

## Inputs

- City scheduler strings: `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\city_layout_scheduler_strings.csv`
- Script scheduler calls: `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\script_scheduler_calls.csv`
- City map-object bindings: `outputs\citystate-seasonal-furnishing-decomp-atlas-20260703\mapobj_binding_surfaces.csv`
- Decor controller candidates: `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\mapobj_decor_controller_candidates.csv`

## Summary

- Scheduler/decor pair candidates: 180
- Probe host candidates: 30
- Direct short scheduler probes: 117
- Long scheduler probe plan rows: 180
- Time-scheduler turn-on/off command rows: 76
- Near ISGRP owner bridge candidates: 54
- Extended ISGRP owner bridge candidates: 1008
- Owner-derived scheduler command rows: 1208
- Decor stem family score rows: 43
- Raw non-deduped city DAT occurrences: 7438
- Raw decor cluster rows: 43
- Raw near ISGRP owner bridge candidates: 54
- Raw extended ISGRP owner bridge candidates: 1277
- Raw owner-derived scheduler command rows: 1356
- Raw decor stem family score rows: 43
- Best decor probe queue rows: 72
- Event matrix rows: 9
- Layout/instance bridge candidates: 6
- Pair events: City flag/decor=88, All Saints/Halloween city decor=58, Grand Company/Foundation flag=27, City gate/flag group=6, Dalamud/comet=1
- Probe status: direct_testbgschedulerlong_ok=180
- Long scheduler probes by city: Ul'dah=74, Gridania=66, Limsa Lominsa=40
- ISGRP bridge events: City flag/decor=36, All Saints/Halloween city decor=8, Grand Company/Foundation flag=8, City gate/flag group=2
- Extended ISGRP bridge events: All Saints/Halloween city decor=480, City flag/decor=384, Grand Company/Foundation flag=96, City gate/flag group=48
- Owner-derived commands by city: Limsa Lominsa=638, Ul'dah=378, Gridania=192
- Top stem family events: All Saints/Halloween city decor=29, City flag/decor=9, Grand Company/Foundation flag=5
- Raw occurrence events: All Saints/Halloween city decor=269, City flag/decor=128, Grand Company/Foundation flag=30, City prop/tree=12, Aurora/star=9, Dalamud/comet=2, All Saints=1
- Raw cluster events: All Saints/Halloween city decor=29, City flag/decor=9, Grand Company/Foundation flag=5
- Raw extended ISGRP bridge events: All Saints/Halloween city decor=554, City flag/decor=531, Grand Company/Foundation flag=144, City gate/flag group=48
- Raw owner-derived commands by city: Limsa Lominsa=638, Ul'dah=454, Gridania=264
- Raw top stem family events: All Saints/Halloween city decor=29, City flag/decor=9, Grand Company/Foundation flag=5
- Best probe queue by city: Gridania=26, Ul'dah=24, Limsa Lominsa=22

## Readout

- The current `!testbgscheduler` path remains short-name only: 1-8 printable ASCII chars.
- `!testbgschedulerlong` is available for authored city DAT scheduler names up to 64 printable ASCII chars.
- That means `show`, `hide`, `open`, `clos`, `stt0`, `end0`, `spot`, `spin`, and `v_l1`-style fireworks schedulers are directly testable with `!testbgscheduler`, while longer names like `time_bg_flag1_show`, `time_bg_hlw1a_show`, and `time_bg_hw_obj1_h_show` are directly testable with `!testbgschedulerlong`.
- Strongest city furnishing lead is still All Saints/Halloween: Gridania has `time_bg_hlw*`, Limsa has `time_bg_hw_obj*`, and Ul'dah has `time_bg_hw0..9` paired show/hide sets.
- Strongest owner bridge found so far is Ul'dah `isgrp_004289` -> SQL instance `4289` / spawn `2050`, near the `sgrp_w0t0_h0_hlw*` block; derive `time_bg_hw0..9_show` / `time_bg_hw0..9_hide` for the live probe queue.
- The extended owner bridge adds weaker-but-useful city-state leads that were hidden by closer flag strings, including Gridania `isgrp_003294` / `gridania_shipport` near `sgrp_f0t0_a0_hlw1a_h`; derive `time_bg_hlw1a_show` / `time_bg_hlw1a_hide`.
- Limsa still has no tight Halloween owner bridge in this string pass. Its concrete `isgrp` matches are strongest for flag groups (`sgrp_s0t0_z0_flg*`, `sgrp_bg_flg*`); the nearest `sgrp_bg_hw_obj*` bridge is around 10 KB away and should be treated as loose/fallback confidence.
- The raw occurrence pass re-scans the DAT bytes without string dedupe. Use it to tell whether an event family is one isolated string, a repeated block, or a dense neighborhood around `isgrp_######` owner references.
- `best_decor_probe_queue.csv` collapses the raw family scores to the command rows worth running first.
- A helper Lua/config pass did not find a recovered global switch that flips all city seasonal furnishings by `hlw`/`hw_obj`/`gcflag` name. `MapObjOnlyShowHide` actor classes `5900006`/`5900007` run `show`/`hide`; later full-root reconciliation proves `MapObjFireworks` actor classes `5900036`/`5900037`/`5900038` target Hatching-tide `time_vfx_egg_*` schedulers.
- Weather/resource overlays are separate from city furnishings: Moonfire has `8029/wtr_smmr` plus route `time_bg_smmr_show/hide`; its separate `hanabi` schedulers use `vtp1..5`. The `v_l#`/`v_c#`/`v_r#` family must not be counted as Moonfire evidence.
- Best existing host probes are city map objects already bound through `server_eventnpc_mapobj`; use `!spawnbgobj placed <spawnId>` to get a live owner, then direct scheduler probes for short names.

## Output Files

- `outputs\citystate-decor-probe-bridge-atlas-20260703\scheduler_pair_candidates.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\city_mapobj_probe_hosts.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\direct_short_scheduler_probes.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\long_scheduler_probe_plan.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\city_event_long_probe_commands.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\isgrp_owner_bridge_candidates.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\isgrp_owner_bridge_extended.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\owner_derived_probe_commands.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\decor_stem_family_scores.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_city_decor_occurrences.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_decor_cluster_windows.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_isgrp_owner_bridge_candidates.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_isgrp_owner_bridge_extended.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_owner_derived_probe_commands.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\raw_decor_stem_family_scores.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\best_decor_probe_queue.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\long_scheduler_bridge_backlog.csv` (compatibility alias)
- `outputs\citystate-decor-probe-bridge-atlas-20260703\city_decor_event_matrix.csv`
- `outputs\citystate-decor-probe-bridge-atlas-20260703\layout_instance_bridge_candidates.csv`

## Practical Next Step

Probe existing hosts first:

- Gridania: `!spawnbgobj placed 871`, then short probes like `!testbgscheduler man0g0_closed_gridania_gate open 0`.
- Limsa: `!spawnbgobj placed 471`, then `!testbgscheduler seventhsage_south open 0`.
- Ul'dah: `!spawnbgobj placed 628`, then `!testbgscheduler man0u0_door1_closed open 0`.

Then probe the actual city-event decor groups with the long scheduler helper:

- Ul'dah strongest owner bridge: `!spawnbgobj placed 2050`, then `!testbgschedulerlong man0u0_tutorial_mapobj1 time_bg_hw1_show 0`; continue through `time_bg_hw0..9_show` / `time_bg_hw0..9_hide`.
- Ul'dah flag/decor bridge: `!spawnbgobj placed 143`, then `!testbgschedulerlong guild_pug time_bg_flag1_show 0`.
- Gridania extended All Saints bridge: `!spawnbgobj placed 589`, then `!testbgschedulerlong gridania_shipport time_bg_hlw1a_show 0`.
- Gridania fallback host: `!spawnbgobj placed 871`, then `!testbgschedulerlong man0g0_closed_gridania_gate time_bg_hlw1a_show 0`.
- Limsa flag bridge: `!spawnbgobj placed 471`, then `!testbgschedulerlong seventhsage_south time_bg_flg1_show 0`.
- Limsa loose All Saints bridge: `!spawnbgobj placed 496`, then `!testbgschedulerlong guild_msk time_bg_hw_obj1_h_show 0`.
- Limsa fallback host: `!spawnbgobj placed 471`, then `!testbgschedulerlong seventhsage_south time_bg_hw_obj1_h_show 0`.

The best concrete layout/instance source remains the SQL map-object binding rows; raw `301/302` style hits are lower confidence.
