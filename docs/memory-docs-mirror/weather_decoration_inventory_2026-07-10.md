# Weather and Decoration Inventory - 2026-07-10

## Additive overlay update - 2026-07-12

The optional AuroraFlare Windower overlay adds restored all-city Halloween
weather as `8070` and Starlight weather as `8071`, while preserving final-client
`8027`, `8029`, and `8032`. Consequently, the named-alias blocking described
below applies to the unmodified final snapshot and is superseded in overlay
mode. The new bindings restore atmosphere resources only; decoration scheduler
groups remain a separate control layer. Full implementation and validation
details are in
`docs/windower_additive_seasonal_weather_overlay_2026-07-12.md`.

## Historical scope correction

This inventory separates final `2012.09.19.0001` / `1.23b` controls from authenticated retail history. Official patches directly prove all-city Moonfire `8029` in July 2011, all-city Halloween `8027` in October 2011, and all-city Starlight `8032` in December 2010 and 2011. The 21 July 2012 patch repurposes all three 8032 files to Dalamud thunder and only Gridania's 8027 file to Starlight, creating the final asymmetric state.

| historical event snapshot | Limsa | Gridania | Ul'dah | weather conclusion |
| --- | --- | --- | --- | --- |
| Starlight, 2010-12-13 | `8032 -> 0x29D9001A` | `8032 -> 0x29B0001A` | `8032 -> 0x615A001D` | exact all-city `wtr_xmas` binding |
| Heavensturn candidate, 2010-12-21 | no binding/root target | no binding/root target | no binding/root target | negative weather/city-layout probe; obfuscated scripts remain |
| Valentione candidates, 2011-02-01/10 | no binding/root target | no binding/root target | no binding/root target | same 1,641 paths with 1,346 revised payload hashes; no weather/city-layout lane |
| Little Ladies, 2011-03-01 | no new row | no new row | no new row | models preloaded; existing all-city 8031 is star/cloud themed but lacks an event binding |
| Hatching-tide, 2011-04-13 | no new row | no new row | no new row | all-city layout/model changes, no Hatching weather row |
| Moonfire, 2011-07-20 | `8029 -> 0x29D9001E` | `8029 -> 0x29B0001D` | `8029 -> 0x615A0022` | exact all-city `wtr_smmr` binding plus layout changes |
| All Saints, 2011-10-04 | `8027 -> 0x29D9001F` | `8027 -> 0x29B00020` | `8027 -> 0x615A0023` | exact all-city Halloween payloads and 36 city DAT targets |
| Starlight, 2011-12-14 | `8032 -> 0x29D9001A` | `8032 -> 0x29B0001A` | `8032 -> 0x615A001D` | exact all-city Xmas payloads and 25 city DAT targets |
| Dalamud transition, 2012-07-21 | 8032 becomes thunder | 8032 becomes thunder; 8027 becomes Starlight | 8032 becomes thunder | exact origin of the final asymmetry |

The later selector-table decode in `docs/city_seasonal_weather_selector_datamine_2026-07-11.md` proves the final snapshot's decoration activation mechanism: all 60 resident Halloween scheduler families reconcile one-for-one with `8027`-only show masks. In Gridania this sits beside a Starlight-classified `8027` atmosphere payload, demonstrating that one weather ID can select different atmosphere and layout sublayers in the same snapshot.

## Classification boundary

- Named seasonal aliases are blocked from `!weather` and routed to `!eventdecor`. Raw numeric `8027` is retained as an explicit combined-resource discovery command and may load decorations.
- `!eventdecor` owns decoration controls and combined event resources. In the final layout tables, `8027` selects every resident Halloween family in all three cities; Gridania's separately mapped `8027` atmosphere payload is Starlight-classified, so its final-snapshot combination is historically asymmetric.
- Debug rows are executable only through `!weather probe` and only in an authored family.
- A DAT-authored show/hide scheduler pair is evidence that a visibility group exists, not proof that it is seasonal or that the recovered temporary controller owns it.

## Weather IDs

| ID | name/classification |
| ---: | --- |
| 8001-8004 | clear, fine, cloudy, foggy |
| 8005-8010 | windy, blustery, rain, showers, thunder, storm |
| 8011-8017 | dusty, sandy, hot, blistering, snow, wintry, gloomy |
| 8027 | combined seasonal pack; named aliases blocked, raw numeric discovery enabled in mapped city families |
| 8028 | primal/summon weather-only overlay |
| 8029 | Moonfire/fireworks weather-only overlay |
| 8030 | Dalamud/comet weather-only overlay |
| 8031 | aurora/cherry/hanabi weather-only overlay |
| 8032 | Dalamud thunder weather-only overlay |
| 8065-8069, 8081 | authored debug rows; `!weather probe` only |

## Area-family matrix

The rows below are positive installed-client `RegionResourceData` mappings. Runtime also permits normal weather from the exact server zone/region pool. `8027` is shown only in the event column because it is not executable through `!weather`.

| family / representative areas | weather-only authored IDs | debug probe IDs | combined event |
| --- | --- | --- | --- |
| `sea_s0`: Limsa 133/230; La Noscea 128-135, 141, 204-205 | 8001, 8002, 8003, 8004, 8006, 8007, 8015, 8016, 8029, 8030, 8031, 8032 | 8065, 8066 | 8027 Halloween |
| `sea_s1`: Locke's Lie/Turtleback 236-237, 270 | 8001, 8002, 8003, 8004, 8007, 8030, 8031, 8032 | none | none |
| `fst_f0`: Gridania 155/206; Shroud 150-154, 162, 207-208 | 8001, 8002, 8003, 8004, 8007, 8010, 8015, 8016, 8028, 8029, 8030, 8031, 8032 | 8065-8068 | 8027 Starlight/Xmas |
| `wil_w0`: Ul'dah 175/209; Thanalan 170-174 | 8001, 8002, 8003, 8004, 8007, 8012, 8014, 8015, 8016, 8028, 8029, 8030, 8031, 8032 | 8065-8069 | 8027 Halloween |
| `roc_r0`: Coerthas 143-148 | 8001, 8002, 8003, 8004, 8006, 8007, 8028, 8030, 8031, 8032 | 8065 | none |
| `roc_r1`: Rivenroad 257, 267-268 | 8001, 8002, 8028 | none | none |
| `lak_l0`: Mor Dhona 190/266; tower 251/264 | 8001, 8002, 8003, 8004, 8007, 8017, 8030, 8031, 8032 | 8065 | none |
| `ocn_o0`: Rhotano Sea family | 8010 | 8065, 8066 | none |
| `ocn_o1`: Rhotano Sea family | 8001, 8002, 8003, 8004, 8010, 8030, 8031, 8032 | none | none |
| `ocn_o2`: ocean family | 8001, 8002, 8003, 8004, 8006, 8007, 8010, 8017 | 8081 | none |
| `srt_o0`: route/ferry family | 8001, 8002, 8003, 8004, 8010, 8029, 8030, 8031, 8032 | none | none |
| `prv_00` | 8001, 8007 | none | none |
| `prv_f0`, `prv_i0`, `prv_s0`, `prv_w0` | 8001 | none | none |
| `art_f0` | 8001, 8002, 8003, 8004, 8007, 8010 | none | none |
| `art_r0`, `art_s0` | 8001, 8002, 8003, 8004, 8006, 8007 | none | none |
| `art_w0` | 8001, 8002, 8003, 8004, 8007, 8012 | none | none |

Coerthas natural pools authorize `8015` snow and `8016` wintry (and region-authored `8017` gloomy where applicable). Because `8015`/`8016` are also explicit original protocol constants, they are now enabled in the three primary city families for all-city seasonal snowfall.

The connected character was observed in zone 135, Upper La Noscea. Its exact natural zone pool is `8001, 8002, 8003, 8004, 8005, 8007, 8008, 8009`; the `sea_s0` family adds authored `8006` and the supported special overlays.

## All paired city-layout visibility schedulers

The expanded installed-client scan covers public-town, interior, line/airship, and secondary-town resources. It recovers 89 complete `_show`/`_hide` pairs, not the 46 from the original town-only pass. The concise machine-readable inventory is `outputs/citystate-seasonal-scheduler-decomp-atlas-20260703/city_layout_paired_schedulers.csv`.

| city/layout | seasonal paired families | count | interpretation |
| --- | --- | ---: | --- |
| Gridania public 321 | `time_bg_hlw1a..1i`, `time_bg_hlw2a..2b` | 11 | Halloween/All Saints decorations; close owner candidate 3392 recovered |
| Gridania interior 331 | `time_bg_hwa1`, `hwf1..2`, `hws1..4`, `hww1..3` | 10 | additional Halloween interior groups; owner not yet recovered |
| Gridania interior 331 | `time_bg_crs1` | 1 | exact December diff authenticates Starlight; `sgrp_w_itm0_pstr1_h`, instances 5414-5416 |
| Limsa public 121 | `time_bg_hw_obj1_h..8_h` | 8 | Halloween/All Saints decorations; close owner candidate 3215 recovered |
| Limsa interior 131 | `time_bg_hw_aq1_h`, `ast_h`, `f1_h..f3_h`, `hjt_h`, `kos_h`, `main_h`, `obj8_h`, `sp1_h..sp2_h`, `tik_h`, `ws1_h..ws2_h` | 14 | additional Halloween interior groups; owner not yet recovered |
| Limsa interior 131 | `time_bg_itm0_pstr1_h`, `time_bg_itm0_pstr3_h` | 2 | exact December diff authenticates Starlight post variants 1/3; instances 7238-7240 and 7242 |
| Ul'dah public 421 | `time_bg_hw0..9` | 10 | Halloween/All Saints decorations; owner candidates 4313/4326 recovered |
| Ul'dah interior 431 | `time_bg_hwa1`, `hwe1..2`, `hwf1..3`, `hwg1` | 7 | additional Halloween interior groups; owner not yet recovered |
| Ul'dah interior 431 | `time_bg_xmas1..2` | 2 | exact December Starlight groups; post variants 1/2 share instance neighborhood 3545-3548 |

This is conclusive authored support for Halloween decorations in all three city-state families. It is not proof that every support-layout group is loaded in every public zone or that the nearest `isgrp_*` string is its true controller.

The remaining 27 public/interior/transit pairs cover flags, collision, lamps, posters, walls, transport, and other unclassified infrastructure. Gridania also has `time_bg_comp`. Route resources `srt_o0_lin01` and `srt_o0_lin02` contain `time_bg_smmr_show/hide`, while firework support assets expose `sgrp_vfx_hanabi` and `vfx_hanabi5..9`.

## Seasonal event layers across the city-states

| event | all-city evidence | recovered decoration switch |
| --- | --- | --- |
| Halloween / All Saints' Wake | the full Oct 2011 patch proves all-city 8027 Halloween payloads, 36 city DAT targets, and `b976` `v11_hlsw` sweets | retail 2011: all-city 8027; final 1.23b: Limsa/Ul'dah retain it while Gridania was replaced in July 2012 |
| Starlight Celebration | Dec 2010 and Dec 2011 both prove all-city `8032 / wtr_xmas`; Dec 2011 adds five interior show/hide pairs, five `8032` masks, ten compiled bodies, and shared winter-post resources | retail: all-city 8032 plus 1/2/2 city scheduler families; final masks are disabled residue after 8032 became thunder, while Gridania weather moved to 8027 |
| Moonfire Faire | all-city quest flow, `PopulaceSumFes`, Bombard actors, route summer schedulers, weather 8029, nine `vfx_hanabi1..9` groups, and eight compiled scheduler bodies per city root | `!weather moonfire` controls atmosphere; six symmetric bank-owner candidates survive (`103/41,62`, `101/199,222`, `104/251,265`); four occur directly in 82 transform records, but no retail actor spawn survives; Gridania retains both compiled banks despite missing expanded timeline labels |
| Hatching-tide | all three city root layouts contain five `vfx_egg` groups and 15 `time_vfx_egg_*` schedulers; 23 portable variants include `b984`'s three repeated five-shape shrine blocks; `spl101` has EASTER/egg-pod functions for all cities | `MapObjFireworks` generates the matching `v_l#`/`v_c#`/`v_r#` scheduler tokens at night; no weather selector or weather API |
| Little Ladies' Day | nine exact city/role actors and methods; dialogue describes the cities' peach blossoms; `b929` retains direct `hina` scenery and `b930..b932` retain six blossom tree/arch variants; pre-existing all-city 8031 has star/cloud, not direct blossom/Hina, payload identity | actor flow and portable models are proven; retail city coordinates/owner and an event call for 8031 or any other weather ID are not recovered |
| Valentione's Day | nine `PopulaceValentMaster` actors form three roles in each city; `b981` retains three identity copies of one arch and `b982` three brazier geometries × three identity slots; the February 2011 candidate patches touch no binding table or city DAT | actor flow and portable models are proven; the model slots structurally align with city types 1/2/3, but retail coordinates/owner and weather call are not recovered |
| Foundation Day | `SpecialEventWork` modes 8/11, nine `spl000` methods, 12 actor-class leads, eight spawns, and seven event items cover all three Grand Companies | event/shop/NPC flow is proven; the 30-row Gridania `gcflag` bank has no `time_bg`, show/hide, mode-11, Limsa, or Ul'dah bridge and is excluded as decoration proof; no weather call is recovered |

Heavensturn itself is directly proven by the Japanese `spl0i4` quest title, Dragon Kabuto reward, three all-city Black Rabbit representative branches, and an orphan all-city marker spine. Three `b901` variants retain direct `kado`/kadomatsu shaders. Its English narrative intentionally continues Starlight/Winter's Knell. The 21 December 2010 candidate patch touches no binding table, city DAT, or tracked seasonal model path; portable models are proven in the final client, but retail city coordinates, owner, and weather control are not.

The portable-model lineage is in `docs/seasonal_bgobj_lineage_datamine_2026-07-12.md`: 73 unique seasonal variants, byte-level Valentione copy groups, Hatching's three five-shape shrine blocks, and the identification of `b940/e001` as the Halloween photo booth from its native mesh and diffuse texture despite a misleading `v11_snbl` stem. The full October patch adds b940 and b976 together; December adds b978-b982. The Foundation exclusion audit is in `docs/foundation_visual_owner_audit_2026-07-12.md`.

The reproducible cross-event audit is in `docs/decoration_only_event_matrix_datamine_2026-07-12.md`. It records 14 Hatching-tide word-hit layouts (three authenticated city roots), five unrelated Little Ladies word hits, four Foundation hits (one audited-unbound `gcflag` bank), and zero Valentione/Heavensturn layout hits.

The eight Moonfire primitives share exact timing choreography across all three
cities: a nine-second envelope, six-second active block, and entry-count
fingerprint `3/5/5/6/7/7/8/7`. Four primitives per bank versus five `vtp` keys
means the missing higher timeline layer performs selection or composition.

## Proven and experimental controls

| location | normal command | result/status |
| --- | --- | --- |
| Limsa 133/230 | `!eventdecor halloween show` / `hide` | proven combined 8027/8001 resource switch |
| Ul'dah 175/184/209 | `!eventdecor halloween show` / `hide` | proven combined 8027/8001 resource switch |
| Gridania 155/206 | `!eventdecor starlight show` / `hide` | DAT-confirmed Xmas pack through combined 8027/8001 switch |
| Gridania | `!eventdecor halloween show` / `hide` | recovered 11-family public scheduler control; packet delivery is still distinguished from visual confirmation |
| Limsa/Ul'dah | `!eventdecor halloween probe-show` / `probe-hide` | retained experimental scheduler batches; the combined resource is the proven path |
| Ul'dah | `!eventdecor starlight probe-show` / `probe-hide` | two explicit layout-431 pairs; exact historical group neighborhood is 3545-3548, but XYZ/host binding remains experimental |

Valentione, Little Ladies' Day, Hatching-tide, Moonfire, and Foundation Day are listed by `!eventdecor list` as real seasonal actor/quest surfaces. `show|hide` refuses where no recoverable decoration switch exists; the command does not invent an ID from event content alone.

## Live acceptance sequence

In each destination, run `!weather reset 0 1`, then `!weather list`. Probe only IDs printed for that family, restoring with `!weather reset 0 1` after every visual check. Event decorations must be restored with the matching `!eventdecor ... hide`; do not use weather aliases for them.

The current desktop-control session can capture the 1.x client and read Map Server logs, but the elevated legacy DirectInput chat layer did not accept automated chat focus. No synthetic live result is recorded for an unexecuted command. The server remained healthy and no attempted string reached the GM command parser.
