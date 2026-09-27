# Per-city seasonal weather × decoration matrix

Staged: 2026-09-27. Lawful consolidation of already-inspected FF14-Memory
evidence (no game bytes, no verbatim decomp). Sources named per table.

## 1. Requested answer: does seasonal weather differ per city-state?

Yes for atmosphere payloads, no for weather IDs. In every retail event and in
the final 1.23b snapshot, all three cities share the SAME weather ID per event,
but each city loads its OWN DAT payload key (different bytes, city-tuned sky,
snow, fireworks). The one exception is final-snapshot Gridania `8027`, which
carries a Starlight payload while Limsa/Ul'dah `8027` carry Halloween payloads
(authenticated by `D2012.07.21.0000.patch`).

## 2. Final 1.23b active payloads per city

Source: `docs/seasonal_weather_decor_patch_datamine_2026-07-11.md`
(active-DAT component-table classification).

| City | ID | Token | 1.23b payload | DAT key |
| --- | ---: | --- | --- | --- |
| Gridania | 8027 | wtr_hall | Starlight seasonal | 0x29B00020 |
| Gridania | 8029 | wtr_smmr | Sunbreeze/Moonfire | 0x29B0001D |
| Gridania | 8032 | wtr_xmas | Dalamud thunder | 0x29B0001A |
| Limsa | 8027 | wtr_hall | All Saints seasonal | 0x29D9001F |
| Limsa | 8029 | wtr_smmr | Sunbreeze/Moonfire | 0x29D9001E |
| Limsa | 8032 | wtr_xmas | Dalamud thunder | 0x29D9001A |
| Ul'dah | 8027 | wtr_hall | All Saints seasonal | 0x615A0023 |
| Ul'dah | 8029 | wtr_smmr | Sunbreeze/Moonfire | 0x615A0022 |
| Ul'dah | 8032 | wtr_xmas | Dalamud thunder | 0x615A001D |

## 3. Retail history: same IDs, city-specific keys

Source: same doc, CRC-verified patch deltas.

| Event patch | Limsa | Gridania | Ul'dah |
| --- | --- | --- | --- |
| Starlight Dec 2010 | 8032 -> 0x29D9001A | 8032 -> 0x29B0001A | 8032 -> 0x615A001D |
| Moonfire Jul 2011 | 8029 -> 0x29D9001E | 8029 -> 0x29B0001D | 8029 -> 0x615A0022 |
| All Saints Oct 2011 | 8027 -> 0x29D9001F | 8027 -> 0x29B00020 | 8027 -> 0x615A0023 |
| Starlight Dec 2011 | 8032 -> 0x29D9001A | 8032 -> 0x29B0001A | 8032 -> 0x615A001D |
| Repurpose Jul 2012 | 8032 -> thunder | 8032 -> thunder, 8027 -> Starlight | 8032 -> thunder |

Heavensturn, Valentione, Little Ladies, Hatching-tide: NO weather row in any
city in the probed patches (negative control-surface result, same doc).
Hatching-tide changed all-city layouts with no weather ID.

## 4. Resident decoration schedulers per city (final snapshot)

Sources: `docs/weather_decoration_inventory_2026-07-10.md`,
`docs/city_seasonal_weather_selector_datamine_2026-07-11.md`.

| City | Scope | Halloween pairs | Starlight pairs | Scheduler name family |
| --- | --- | ---: | ---: | --- |
| Gridania | public 321 | 11 | 0 | time_bg_hlw1a..1i, hlw2a..2b |
| Gridania | interior 331 | 10 | 1 (time_bg_crs1) | time_bg_hwa1, hwf1..2, hws1..4, hww1..3 |
| Limsa | public 121 | 8 | 0 | time_bg_hw_obj1_h..8_h |
| Limsa | interior 131 | 14 | 2 (pstr1_h/3_h) | time_bg_hw_aq1_h, ast_h, f1..f3_h, ... |
| Ul'dah | public 421 | 10 | 0 | time_bg_hw0..9 |
| Ul'dah | interior 431 | 7 | 2 (xmas1/2) | time_bg_hwa1, hwe1..2, hwf1..3, hwg1 |

Weather-to-decor link: all 60 Halloween families reconcile 1:1 with `8027`-only
sparse selector masks (60/60), so setting weather 8027 selects the resident
Halloween groups with no second packet. The 5 interior Starlight pairs
reconcile with EMPTY masks in the final snapshot (dormant residue); the exact
Dec 2011 payloads bind the same 5 pairs to five `8032`-only masks. No sparse
mask in the 287-layout corpus contains 8029: Moonfire decor lives in route
layouts (`time_bg_smmr` show/hide in srt_o0_lin01/02) and map-object
fireworks (`vfx_hanabi1..9`), not city scheduler masks.

## 5. Additive overlay: uniform all-city restoration (no client edit)

Source: `docs/windower_additive_seasonal_weather_overlay_2026-07-12.md`.

| ID | Alias | Effect, all 3 cities |
| ---: | --- | --- |
| 8070 | halloween | Restored Oct-2011 All Saints atmosphere (city DATs 0x29D90031, 0x29B00031, 0x615A0031) |
| 8071 | starlight | Restored Dec-2011 Starlight atmosphere + private VINS controllers (city DATs 0x29D90030, 0x29B00030, 0x615A0030) |

Original 8027/8029/8032 rows untouched. IDs 8070/8071 chosen because the
client's authored weather range ends at 8081 (8101/8102 experimentally failed).

## 6. Full weather-ID index (condensed)

Source: `Data/scripts/weather_registry.lua` (inspected) + registry aliases.

- 8001-8017: normal weather (clear, fine, cloudy, foggy, windy, blustery,
  rain, showers, thunder, storm, dusty, sandy, hot, blistering, snow,
  wintry, gloomy). Snow/wintry enabled in all 3 city families for seasonal snow.
- 8027: combined seasonal pack (city scheduler selector; Gridania asymmetric).
- 8028: primal/summon overlay. 8029: Moonfire/fireworks. 8030: Dalamud/comet.
  8031: aurora/cherry/hanabi. 8032: Dalamud thunder (retail Starlight pre-Jul-2012).
- 8033-8064 + 8109/8110/8112: color palette overlays (dark-blue ... maroon).
- 8065-8069, 8081: debug rows (`!weather probe` only, authored families only).
- 8070: Halloween decor atmosphere (overlay). 8071: Starlight/Christmas (overlay).
- 8072-8075: Garuda/Moogle/Ifrit/Rivenroad primal variants. 8076: night/winter
  sky. 8077: snowy2. 8078: dark clouds. 8079: full rain. 8080: Halloween weather.
- 8082-8113: clear/fog/haze color variants (incl. eclipse 8039, purple fog 8111).
- 8114-8183: gloomy-soft colors + twilight colors (70 IDs).
- 8184-8212: full-color fogs. 8213-8241: full-color clears. 8242-8276: full-color fairs.
- 8277-8280: blue sparkles + red precip; 8281-8382: full color-precipitation
  matrix (thunderstorms/rain/showers × 35 colors).
- 8383+: extended custom ranges (neon families etc.); 8609/8610 deep black
  clears; 8861 tower-night test; 8862/8863 bright whites. See registry for exact
  per-ID aliases (several hundred `!weather` aliases total).

## 7. Runtime control lanes (protocol separation)

Source: `docs/seasonal_control_plane_decomp_2026-07-11.md` (cited by city
selector doc) + `docs/seasonal_profiles_2026-09-26.md`.

- Weather = opcode 0x000D. Event mode = opcode 0x0196 (`SpecialEventWork[9]`).
- SpecialEventWork[9]: Moonfire 2012 = 18, Foundation Day = 11, Seventh Umbral
  = 20, else 0. Mode 18 does NOT itself launch fireworks or change weather.
- `!weather` owns atmosphere; `!eventdecor` owns decoration switches; named
  seasonal aliases are blocked from `!weather` and routed to `!eventdecor`.
- Micro-weather: `server_weather_areas` + `server_weather_area_rates` give
  per-landmark timed pools (91 client sub-area anchors); city seasonal weather
  rides the same zone/region pool mechanism.

## 8. Delivery note

Delivered 2026-09-27 from `/tmp/ff14-staging/city-weather-decor-matrix/`.
Companion: `meteor_weather_decor_lineage_2026-09-27.md` (FF14-Decomp docs).
Live Meteor mirrors (bitbucket dead): `github.com/chinasmooth/project-meteor-mirror`,
`github.com/reiichi001/project-meteor-mirror`, `github.com/allboswe/ffxiv1.23b`,
`git.arondeus.com/cassidy/project-meteor-server` (Forgejo, 1,022 commits).
Placement evidence: `FF14-Memory/docs/maps/city-spriggan-placements-20260927/`.
