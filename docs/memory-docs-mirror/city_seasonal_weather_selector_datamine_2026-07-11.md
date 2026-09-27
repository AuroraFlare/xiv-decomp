# City Seasonal Weather Selector Datamine - 2026-07-11

Scope: installed `2012.09.19.0001` / `1.23b` client snapshot.

## Result

The city layout DATs contain a direct weather-to-decoration control layer. Each
public/interior layout has repeated selector vectors for weather IDs `8001-8017`
and `8027-8032`. Sparse all-`ff` masks reconcile with named show/hide scheduler
families; dense vectors are their complementary states.

Every recovered Halloween scheduler family has exactly one `8027`-only sparse
mask: **60 of 60** across six layouts.

- Gridania: 21 Halloween pairs and 21 `8027`-only masks.
- Limsa Lominsa: 22 Halloween pairs and 22 `8027`-only masks.
- Ul'dah: 17 Halloween pairs and 17 `8027`-only masks.

This makes the runtime path much clearer: setting weather `8027` is sufficient
for the client layout scheduler to select the resident Halloween decoration
groups. A second server-side decoration-placement packet is not required for
those authored groups.

## Layout reconciliation

| City | Scope | Halloween pairs | 8027-only masks | Starlight pairs | 8029 masks | 8030+8032 masks | No-weather masks |
|---|---:|---:|---:|---:|---:|---:|---:|
| Gridania | public | 11 | 11 | 0 | 0 | 4 | 0 |
| Gridania | interior | 10 | 10 | 1 | 0 | 0 | 1 |
| Limsa Lominsa | public | 8 | 8 | 0 | 0 | 8 | 0 |
| Limsa Lominsa | interior | 14 | 14 | 2 | 0 | 0 | 2 |
| Ul'dah | public | 10 | 10 | 0 | 0 | 3 | 0 |
| Ul'dah | interior | 7 | 7 | 2 | 0 | 0 | 2 |

## Additional conclusions

- No sparse city scheduler mask contains `8029`. In this snapshot the
  Sunbreeze/Moonfire weather/fireworks atmosphere is separate from named city
  decoration schedulers; retail decorations must have lived in a different
  resource layer or patch-era layout payload.
- Five resident interior Starlight pairs reconcile with five empty sparse masks:
  Gridania `time_bg_crs1`, Limsa `time_bg_itm0_pstr1_h/3_h`, and Ul'dah
  `time_bg_xmas1/2`. Exact December 2011 patch payloads show that these same
  five pairs originally reconciled with five `8032`-only masks. They are forced
  off in the final snapshot after `8032` was repurposed for late/Dalamud weather.
- `8030` and `8032` repeatedly share the same sparse masks on city collision,
  flag, lamp, and `comp`-like scheduler groups. This independently supports the
  live result that current `8032` belongs to the late/Dalamud weather family,
  not the Starlight switch.
- `SpecialEventWork[9]` remains a separate event-mode lane used by shops,
  dialogue, teleport, and an emote in recovered Lua. The DAT selector vectors
  provide the concrete weather/decor link; no evidence currently requires
  `SpecialEventWork[9]` to activate these 60 Halloween groups. Native packet
  proof is in `docs/seasonal_control_plane_decomp_2026-07-11.md`: event work is
  opcode `0x0196`, while weather is opcode `0x000D`.

## Whole mapped-layout corpus

The same vector scan was run across every DAT referenced by the recovered
`RegionResourceData` rows: **287** mapped
`MapLayoutResourceData` files. Only **11**
contain validated selector vectors, yielding **97**
sparse masks.

| Selected weather IDs | Masks | Interpretation |
|---|---:|---|
| 8027 | 60 | seasonal/Halloween city visibility |
| 8030 | 8032 | 25 | shared Dalamud/late-weather visibility |
| (empty) | 5 | empty/dormant show mask |
| 8028 | 3 | primal/trial visibility |
| 8014 | 8028 | 2 | blistering+primal trial visibility |
| 8014 | 1 | blistering trial visibility |
| 8001 | 8002 | 1 | clear+fair normal-weather visibility |

The trial-area `8014/8028` masks and the repeated `8030/8032` masks establish
that this is a general weather-conditioned visibility system, not a coincidental
city byte pattern. No sparse mask in the complete mapped-layout corpus contains
`8029`; summer decorations/fireworks use another layer or patch-era payload.

## Historical boundary

This proves how the final 1.23b layout activates its resident groups. It does
not prove that `8027` represented every seasonal event in every retail patch.
The exact all-city retail history still requires delta extraction from the
2011 Sunbreeze, All Saints, and Starlight patches. The absence of an `8029` or
Starlight mask here is therefore snapshot evidence, not evidence that retail
lacked those decorations.

## Reproduction

```powershell
python tools/build_city_seasonal_weather_selector_atlas.py
```

Outputs:

- `outputs\city-seasonal-weather-selector-atlas-20260711\layout_weather_selector_summary.csv`
- `outputs\city-seasonal-weather-selector-atlas-20260711\sparse_weather_selector_masks.csv`
- `outputs\city-seasonal-weather-selector-atlas-20260711\seasonal_scheduler_weather_bindings.csv`
- `outputs\city-seasonal-weather-selector-atlas-20260711\region_layout_weather_selector_inventory.csv`
- `outputs\city-seasonal-weather-selector-atlas-20260711\global_selector_signature_summary.csv`
- `outputs\city-seasonal-weather-selector-atlas-20260711\contract_summary.json`
