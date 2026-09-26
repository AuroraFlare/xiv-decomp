# Weather Command Decomp Atlas - 2026-07-08

Generated: 2026-07-11T00:59:07+00:00

## Inputs

- Region/resource rows: `tools\outputs\lpb\airship_ferry_region_resource_data_20260621\region_resource_all_rows.csv`
- Weather overlay string scan: `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\weather_overlay_scheduler_strings.csv`
- Recovered WeatherDirector: `tools\outputs\lpb\decomp_further_20260617\lua\director\weather\weatherdirectorbaseclass.lua`
- GM command: `Data\scripts\commands\gm\weather.lua`
- GM warp command: `Data\scripts\commands\gm\warp.lua`
- Server weather packet/constants: `Map Server\Packets\Send\SetWeatherPacket.cs`
- Runtime weather manager: `Map Server\WeatherManager.cs`

## Readout

- `!weather` only needs a weather id plus transition. The client decomp shows `WeatherDirectorBaseClass` syncing `weatherId` and calling `_setWeather(weatherId, 15)`.
- `8027` / `wtr_hall` is a combined environment/decor pack, not weather-only. `!weather` blocks its aliases and raw numeric id; Limsa/Ul'dah route to `!eventdecor halloween`, while Gridania routes to `!eventdecor starlight`.
- `8028` / `wtr_smmn` is runtime-confirmed as primal/summon weather: `warp.lua` forces it after Garuda, Ifrit, King Moggle Mog, and Nael/Rivenroad warps.
- `8032` is authenticated as all-city Starlight in both December 2010 and December 2011. `D2012.07.21.0000.patch` replaces all three payloads with Dalamud Thunder. Do not use `starlight`, `xmas`, or `christmas` as friendly aliases for the final client.
- `8031 / wtr_chry` was already all-city in December 2010. Its extracted payloads are star/cloud/camera resources with no Hina, peach, petal, sakura, or momo token, and no March 2011 event call has been recovered; it is not authenticated Little Ladies weather.
- The remaining seasonal-looking weather overlay with a clear event label is Moonfire/fireworks: `8029` / `wtr_smmr`.
- The executable weather-only special range is `8028`-`8032`; any future live-confirmed combined pack must move to the eventdecor denylist.
- Debug rows `8065`-`8069` and `8081` require `!weather probe` and an authored current-area mapping.
- In game, use `!weather list` for current-area normal/special/debug coverage and `!eventdecor list` for seasonal furnishings.

## Special Weather Matrix

| id | token | readout | aliases | decor | observed | rows | confidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 8027 | wtr_hall | Area-specific combined seasonal environment/decor pack | seasonal / wtr_hall / halloween / hallow / hallows / hall / allsaints / allsaintswake / starlight / xmas / christmas | combined resource; not executable through weather-only command | Live-confirmed combined pack: Limsa/Ul'dah Halloween decorations; Gridania Starlight/Xmas assets. | 17 | high |
| 8028 | wtr_smmn | Primal / summon weather overlay | primal / summon / smmn / wtr_smmn | runtime trial weather plus asset refs | Runtime-confirmed as trial/summon weather by warp.lua; still worth visual screenshots per arena. | 21 | high |
| 8029 | wtr_smmr | Moonfire / summer fireworks weather overlay | fireworks / moonfire / summer / smmr / wtr_smmr | overlay plus scheduler leads | Needs per-zone visual confirmation. | 18 | high |
| 8030 | wtr_comp | Dalamud / comet weather overlay | dalamud / dalamud1 / comet / comp / wtr_comp | asset refs, needs visual probe | Needs visual confirmation. | 29 | medium |
| 8031 | wtr_chry | Aurora / cherry / hanabi / star weather overlay | aurora / chry / cherry / hanabi / star / stars / wtr_chry | asset refs, needs visual probe | Needs visual confirmation. | 29 | medium |
| 8032 | wtr_xmas | Dalamud Thunder special overlay | dalamudthunder / dalamud2 / wtr_xmas | not a final-client Starlight candidate; historical resource was wtr_xmas | Final 1.23b: user-confirmed Dalamud Thunder; Dec 2010 patch: authenticated Starlight. | 29 | high |

## Furnishing / Decor Signals

| id | token | cmd | signal | observed | propRefs | assetRefs | stillNeeded |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 8027 | wtr_hall | blocked in !weather; use area-specific !eventdecor | combined resource; not executable through weather-only command | Live-confirmed combined pack: Limsa/Ul'dah Halloween decorations; Gridania Starlight/Xmas assets. | 3 | 13 | A true client-native sub-layer selector; recovered _setWeather accepts only one weather id and transition. |
| 8028 | wtr_smmn | !weather primal 0 1 | runtime trial weather plus asset refs | Runtime-confirmed as trial/summon weather by warp.lua; still worth visual screenshots per arena. | 4 | 15 | Whether any non-primal furnished props appear outside trial/summon weather VFX. |
| 8029 | wtr_smmr | !weather fireworks 0 1 | overlay plus scheduler leads | Needs per-zone visual confirmation. | 4 | 8 | Exact Moonfire furnishing/layout owners; support resources expose time_bg_smmr_show/hide and fireworks scheduler clues. |
| 8030 | wtr_comp | !weather dalamud 0 1 | asset refs, needs visual probe | Needs visual confirmation. | 8 | 16 | Whether comet/Dalamud is VFX-only in most areas or also brings visible props in some city/layout families. |
| 8031 | wtr_chry | !weather aurora 0 1 | asset refs, needs visual probe | Needs visual confirmation. | 8 | 47 | Whether star/hanabi assets are only sky/VFX or visible placed scene objects in some layouts. |
| 8032 | wtr_xmas | !weather dalamudthunder 0 1 | not a final-client Starlight candidate; historical resource was wtr_xmas | Final 1.23b: user-confirmed Dalamud Thunder; Dec 2010 patch: authenticated Starlight. | 8 | 16 | Later Starlight-year bindings; 8032 must not be used as the snow alias on final 1.23b. |

## City Event Probe Matrix

| city | event | status | primary_command | secondary_command | evidence | next_check |
| --- | --- | --- | --- | --- | --- | --- |
| Limsa Lominsa | Halloween / pumpkins | proven combined event pack | !eventdecor halloween show | !eventdecor halloween hide | Limsa 8027 DAT contains sdef_hallo_imp; raw layout 121/3215 owns hw_obj*_h show/hide scheduler families. | Do not expose 8027 through !weather; raw schedulers remain explicit probes only. |
| Gridania | Snow / Starlight-like weather | proven combined event pack | !eventdecor starlight show | !eventdecor starlight hide | Gridania 8027 DAT contains vfx_cam_xmas, cbind_xmas, wtr_xmas paths, and time_xmas_se. | Keep 8027 blocked from !weather and owned by eventdecor. |
| Ul'dah | Halloween / All Saints | proven combined event pack | !eventdecor halloween show | !eventdecor halloween hide | Ul'dah 8027 DAT contains sdef_hallo_imp; raw layouts 421/4313 and 421/4326 own hw0..9 show/hide families. | Do not expose 8027 through !weather; raw schedulers remain explicit probes only. |
| Gridania | Halloween / All Saints | scheduler candidate | !eventdecor halloween probe-show | !eventdecor halloween probe-hide | Raw layout 321/3392 owns Gridania hlw1a..2b scheduler families; no mapped Gridania Halloween atmosphere DAT was found. | Normal show/hide must refuse until a live-backed activation path is recovered. |
| Ul'dah | Snow / Starlight-like weather | needs discovery | !weather snow 0 1; !weather wintry 0 1 | !weather probe unknown1 0 1; !weather probe unknown2 0 1; !weather probe unknown3 0 1 | User reports 8027/seasonal is not Ul'dah snow; 8032 is Dalamud Thunder; deep DAT rows include wil_w0 hidden 8067/8068/8069 resources. | Probe normal snow ids first, then hidden 8067/8068/8069 variants in Ul'dah. |
| Limsa Lominsa | Snow / Starlight-like weather | needs discovery | !weather snow 0 1; !weather wintry 0 1 | No sea_s0 rows for unknown1-3; inspect quest/actor scheduler clues if snow/wintry fail. | User-confirmed 8027/seasonal is pumpkins in Limsa; 8032 is Dalamud Thunder; deep DAT rows only show sea_s0 hidden 8065/8066 resources. | Do not treat unknown1-3 as dat-backed in Limsa; follow spl0i4/seasonal actor scheduler leads if normal snow ids fail. |
| All areas | Dalamud Thunder | confirmed special weather id | !weather dalamudthunder 0 1 | !weather 8032 0 1 | User-confirmed 8032 is Dalamud Thunder despite the raw wtr_xmas resource token. | Do not use starlight/xmas/christmas aliases for this id. |

## Best Probe Order

1. `!weather list` to print weather-only and debug-probe coverage for the current area.
2. Confirm `!weather 8027 0 1`, `seasonal`, `halloween`, and `starlight` are blocked without sending a packet.
3. Use `!eventdecor halloween show|hide` in Limsa/Ul'dah or `!eventdecor starlight show|hide` in Gridania.
4. If Ul'dah snow is still being researched, use `!weather probe unknown1|unknown2|unknown3 0 1`; those hidden IDs have `wil_w0` DAT rows.
5. Do not treat `unknown1`-`unknown3` as dat-backed Limsa snow probes; the sea_s0 family only showed hidden `8065`/`8066` rows in the deeper scan.
6. `!weather dalamudthunder 0 1` verifies final-client `8032`; its December 2010 meaning must not be applied to 1.23b.
7. If weather visuals appear but city decor does not, continue with the city BG scheduler probe queues from `docs\citystate_decor_probe_bridge_atlas_2026-07-03.md`.

## Still To Discover

- Exact per-zone weather-only matrix; combined `8027` is intentionally excluded from `!weather` regardless of its city visual.
- Exact object lists: what `wtr_hall`, `wtr_smmr`, `wtr_chry`, `wtr_comp`, and `wtr_xmas`/Dalamud Thunder visibly add in each area.
- True client-native sub-layer selection for combined packs; the recovered weather API has only weather id and transition.
- High/unknown weather ids `8067`, `8068`, and `8069`; they are dat-backed for Ul'dah/Gridania but still need visual proof. `8081` appears outside the city families in the deeper scan.

## Output Files

- `outputs\weather-command-decomp-atlas-20260708\weather_special_resource_summary.csv`
- `outputs\weather-command-decomp-atlas-20260708\weather_command_aliases.csv`
- `outputs\weather-command-decomp-atlas-20260708\weather_furnishing_signal_matrix.csv`
- `outputs\weather-command-decomp-atlas-20260708\weather_city_event_probe_matrix.csv`
- `outputs\weather-command-decomp-atlas-20260708\source_evidence_index.csv`
- `outputs\weather-command-decomp-atlas-20260708\contract_summary.json`

## Cautions

- Treat `8032` as Dalamud Thunder in the final-client command surface. Its historical Starlight identity is evidence of patch-dependent ID reuse, not a safe friendly snow alias.
- Use `zonewide=1` only in a disposable test session.
- `seasonal_quests_enabled` and `fireworks_enabled` are config gates for different systems; they do not replace the manual weather probes.
