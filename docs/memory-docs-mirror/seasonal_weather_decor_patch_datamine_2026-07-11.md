# Seasonal Weather and Decoration Patch Datamine - 2026-07-11

## Result

The retail observation is directly authenticated. Official patches prove all-city Moonfire `8029 / wtr_smmr` in July 2011, all-city All Saints `8027 / wtr_hall` in October 2011, and all-city Starlight `8032 / wtr_xmas` in December 2010 and 2011. `D2012.07.21.0000.patch` converts all three 8032 payloads to Dalamud thunder and replaces only Gridania's 8027 Halloween payload with Starlight, creating the final asymmetry.

`8029/wtr_smmr` is the stable all-three-city Sunbreeze/Moonfire atmosphere control. Decorations/fireworks are a separate layout and map-object layer.

`8032/wtr_xmas` is **not** a Starlight control in final 1.23b. Its active component tables contain `vfx_lastwtr` and `vfx_tunder1` in all three cities. Historical recovery proves that these same keys carried authentic Starlight payloads in December 2010 before being repurposed as Dalamud thunder.

## Authenticated historical bindings

| patch/event | Limsa | Gridania | Ul'dah | result |
| --- | --- | --- | --- | --- |
| 2010-12-13 Starlight | `8032 -> 0x29D9001A` | `8032 -> 0x29B0001A` | `8032 -> 0x615A001D` | all-city `wtr_xmas` |
| 2010-12-21 Heavensturn candidate | no binding/root target | no binding/root target | no binding/root target | negative control-surface probe; obfuscated scripts remain |
| 2011-02-01/10 Valentione candidates | no binding/root target | no binding/root target | no binding/root target | same 1,641 paths with revised payloads; no weather/city/model target |
| 2011-03-01 Little Ladies | no new row/root | no new row/root | no new row/root | preloaded-model/actor lane; existing 8031 is star/cloud themed but has no event binding |
| 2011-04-13 Hatching-tide | city layouts changed | city layouts changed | city layouts changed | all-city decor/layout lane, no Hatching weather row |
| 2011-07-20 Moonfire | `8029 -> 0x29D9001E` | `8029 -> 0x29B0001D` | `8029 -> 0x615A0022` | all-city `wtr_smmr` plus layout changes |
| 2011-10-04 All Saints | `8027 -> 0x29D9001F` | `8027 -> 0x29B00020` | `8027 -> 0x615A0023` | all-city `sdef_hallo_imp` payloads plus 36 city DAT targets |
| 2011-12-14 Starlight | `8032 -> 0x29D9001A` | `8032 -> 0x29B0001A` | `8032 -> 0x615A001D` | all-city Xmas payloads plus 25 city DAT targets |
| 2012-07-21 repurpose | 8032 becomes thunder | 8032 becomes thunder; 8027 becomes Starlight | 8032 becomes thunder | creates final 1.23b state |

## Active 1.23b weather payloads

| city | id | token | 1.23b payload | DAT |
| --- | --- | --- | --- | --- |
| Gridania | 8027 | wtr_hall | Starlight seasonal payload | 0x29B00020 |
| Gridania | 8029 | wtr_smmr | Sunbreeze/Moonfire atmosphere | 0x29B0001D |
| Gridania | 8032 | wtr_xmas | Dalamud thunder payload | 0x29B0001A |
| Limsa Lominsa | 8027 | wtr_hall | All Saints seasonal payload | 0x29D9001F |
| Limsa Lominsa | 8029 | wtr_smmr | Sunbreeze/Moonfire atmosphere | 0x29D9001E |
| Limsa Lominsa | 8032 | wtr_xmas | Dalamud thunder payload | 0x29D9001A |
| Ul'dah | 8027 | wtr_hall | All Saints seasonal payload | 0x615A0023 |
| Ul'dah | 8029 | wtr_smmr | Sunbreeze/Moonfire atmosphere | 0x615A0022 |
| Ul'dah | 8032 | wtr_xmas | Dalamud thunder payload | 0x615A001D |

The classifier uses the DAT component table, not broad printable-string hits. This removes false positives such as `xmas` appearing only in inherited/reference paths inside unrelated hidden, heat, primal, or thunder resources.

## Resident city decoration evidence

| city | event | paired_scheduler_count_in_1_23b | layouts | interpretation |
| --- | --- | --- | --- | --- |
| Limsa Lominsa | All Saints/Halloween | 22 | 121/sea_s0_twn01 / 131/sea_s0_ind01 | positive resident decoration evidence |
| Limsa Lominsa | Starlight | 2 | 131/sea_s0_ind01 | positive resident decoration evidence |
| Limsa Lominsa | Sunbreeze/Moonfire | 0 |  | not resident as a named city show/hide pair in this 1.23b snapshot |
| Gridania | All Saints/Halloween | 21 | 321/fst_f0_twn01 / 331/fst_f0_ind01 | positive resident decoration evidence |
| Gridania | Starlight | 1 | 331/fst_f0_ind01 | positive resident decoration evidence |
| Gridania | Sunbreeze/Moonfire | 0 |  | not resident as a named city show/hide pair in this 1.23b snapshot |
| Ul'dah | All Saints/Halloween | 17 | 421/wil_w0_twn01 / 431/wil_w0_ind01 | positive resident decoration evidence |
| Ul'dah | Starlight | 2 | 431/wil_w0_ind01 | positive resident decoration evidence |
| Ul'dah | Sunbreeze/Moonfire | 0 |  | not resident as a named city show/hide pair in this 1.23b snapshot |

Halloween is conclusively resident in all three public/interior city families. Historical patch diffs now authenticate all five resident interior Starlight pairs: Gridania `time_bg_crs1`, Limsa `time_bg_itm0_pstr1_h/3_h`, and Ul'dah `time_bg_xmas1/2`. Their five final empty masks are disabled residue; the exact December payloads bind the same five pairs to five `8032`-only masks. Summer has route/firework support but no named three-city show/hide family in the current city layouts; that remaining absence is a snapshot gap, not evidence against the retail observation.

## Reconstruction contract

1. Preserve the retail matrix as ground truth: all three cities had event atmosphere/weather and decorations for Starlight, All Saints, and Sunbreeze/Moonfire.
2. Treat numeric meanings as patch-dependent: 8032 means Starlight in December 2010 but Dalamud thunder in final 1.23b; 8027 describes later/final seasonal state.
3. Keep `8029` as the all-city summer atmosphere control.
4. Do not alias `8032` to Starlight on the final client; its active 1.23b payload is thunder/Dalamud.
5. Do not invent event-weather ownership for decoration-only events. Hatching-tide, Little Ladies' Day, Valentione, Foundation Day, and similar actor/quest surfaces still lack a positive event-specific weather binding or call; Little Ladies' pre-existing 8031 row remains only a weak candidate.
6. Full nine-cell restoration requires historical patch deltas or client-side resource reconstruction; the server packet alone cannot select an event DAT that the current `RegionResourceData` no longer binds.

## Complete historical patch recovery

The complete archived patch set is now range-recovered and CRC-verified. The table below remains as the original target manifest.

| event | probe_order | patch_file | size_bytes | crc32 |
| --- | --- | --- | --- | --- |
| Sunbreeze/Moonfire | 1 | D2011.07.20.0000.patch | 584926805 | 2EA149A9 |
| Sunbreeze/Moonfire | 2 | D2011.07.26.0000.patch | 7649141 | 5670BA07 |
| Sunbreeze/Moonfire | 3 | D2011.08.05.0000.patch | 152064532 | 0D9E9FD8 |
| Sunbreeze/Moonfire | 4 | D2011.08.09.0000.patch | 8573687 | 9B54551A |
| Sunbreeze/Moonfire | 5 | D2011.08.16.0000.patch | 6118907 | 75231C57 |
| All Saints/Halloween | 1 | D2011.10.04.0000.patch | 677633296 | 95C15318 |
| All Saints/Halloween | 2 | D2011.10.12.0001.patch | 28941655 | B37993E3 |
| All Saints/Halloween | 3 | D2011.10.27.0000.patch | 29179764 | 977480DC |
| Starlight | 1 | D2011.12.14.0000.patch | 374617428 | C6FE8FED |
| Starlight | 2 | D2011.12.23.0000.patch | 22363713 | 93137C93 |

The October and December 2011 deltas and July 2012 repurposing are decoded in `docs/late_seasonal_patch_timeline_2026-07-12.md`.
The exact city-layout scheduler, mask, dependency, instance-neighborhood, and compiled show/hide-body recovery is in `docs/historical_seasonal_layout_timeline_2026-07-12.md`.

## Generated evidence

- `outputs/seasonal-weather-decor-patch-atlas-20260711/active_city_weather_payloads.csv`
- `outputs/seasonal-weather-decor-patch-atlas-20260711/active_weather_component_entries.csv`
- `outputs/seasonal-weather-decor-patch-atlas-20260711/city_decoration_residency_matrix.csv`
- `outputs/seasonal-weather-decor-patch-atlas-20260711/patch_delta_probe_queue.csv`
- `outputs/seasonal-weather-decor-patch-atlas-20260711/contract_summary.json`
- `outputs/historical-seasonal-patch-recovery-20260712/historical_weather_bindings.csv`
- `outputs/historical-seasonal-patch-recovery-20260712/historical_city_patch_targets.csv`
- `outputs/historical-seasonal-layout-timeline-20260712/december_starlight_layout_delta.csv`
