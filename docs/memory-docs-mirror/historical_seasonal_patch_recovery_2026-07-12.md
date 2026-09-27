# Historical seasonal patch recovery (2026-07-12)

## Breakthrough

**Complete-archive update:** the Internet Archive copy was subsequently range-recovered and all 24 missing late patches were CRC-verified. Full October 2011 All Saints, December 2011 Starlight, and the July 2012 repurposing timeline are decoded in `docs/late_seasonal_patch_timeline_2026-07-12.md`. The partial-archive analysis below remains the provenance record for the original local fragment.

The local partial archive contains **28 complete FFXIV 1.x patch files** through 16 August 2011. Its next patch, 4 October 2011, is truncated, but the completed entries can be independently inflated and their `0x91 + ZIPATCH` command streams decoded.

This recovers exact historical controls that the final 1.23b installation could not preserve:

| Event snapshot | Exact all-city weather binding | Patch-local layout evidence |
|---|---|---|
| Starlight, 13 Dec 2010 | `8032 / wtr_xmas`: Limsa `0x29D9001A`, Gridania `0x29B0001A`, Ul'dah `0x615A001D` | all three Xmas payloads are carried by the patch |
| Heavensturn candidate, 21 Dec 2010 | no binding-table or city-DAT target | negative control-surface probe only; the patch mainly carries obfuscated scripts |
| Valentione candidates, 1/10 Feb 2011 | no binding-table or city-DAT target | both patches carry the exact same 1,641 paths; payload hashes change, but no weather/city/model target is added |
| Little Ladies, 1 Mar 2011 | no new seasonal weather row | no city-root DAT was changed; b929-b932 had already been preloaded in Dec 2010 |
| Hatching-tide, 13 Apr 2011 | no new Hatching weather row | all three city DAT families changed and b972/b973 were added |
| Moonfire, 20 Jul 2011 | `8029 / wtr_smmr`: Limsa `0x29D9001E`, Gridania `0x29B0001D`, Ul'dah `0x615A0022` | all three city DAT families changed and b939/b942 were added |

## Partial October 2011 recovery

The incomplete October entry is still useful. Its surviving **54.7%** compressed prefix inflates to **370,389,291 bytes** and contains **5,097 complete file entries** before one truncated `ETRY` payload.

That prefix directly adds the `b976` `hlsw` Halloween-sweets model family. It also adds `b940/e001`, now identified from its native mesh and diffuse as the Halloween photo booth despite its `v11_snbl` shader stem, and modifies b901/b928 skeleton data. The prefix does not reach a binding table or city DAT, so it cannot answer the October weather/layout control question; absence from only 54.7% of the stream is inconclusive.

## What 8032 means

`8032` is now authenticated as the December 2010 all-city Starlight resource ID. This does **not** make it a safe Starlight command in the final client: the installed 1.23b DATs reuse those same three keys for the later `vfx_lastwtr` / `vfx_tunder1` Dalamud-thunder payload. The numeric slot's meaning changed across patches.

The byte comparison is decisive: all three 2010 payloads differ from their final files, lose `cbind_xmas`/`cam_xmas`, and gain the active thunder groups. By contrast, Gridania's July 2011 `8029` payload is byte-identical to final 1.23b, while the Limsa and Ul'dah summer payloads changed bytes but retain the same `wtr_smmr` identity.

Likewise, the final snapshot's asymmetric `8027` seasonal packs remain valid evidence about 1.23b, but they are no longer needed as a reconstruction of the December 2010 Starlight ID. Historical Starlight 2010 is directly proven as `8032`; `8027` concerns later/final seasonal state.

## Event-lane separation

The patch deltas sharpen the decorations-versus-weather split:

- Little Ladies' Day changed the binding table but added no city DAT target and no new seasonal weather row. Its b929-b932 models were already present three months earlier, consistent with preloaded decorations activated by event logic.
- The late-December Heavensturn candidate and both February Valentione candidates touch none of the binding-table, three city-DAT, or tracked seasonal-model paths. Their client scripts are obfuscated, so this narrows the control lane but does not prove the events lacked decoration placement.
- Hatching-tide changed city layouts across Limsa, Gridania, and Ul'dah and added its egg models, but introduced no Hatching-specific weather binding.
- Moonfire changed both lanes: all-city layout data plus exact all-city `8029 / wtr_smmr` bindings.

## Little Ladies and the 8031 lead

`8031 / wtr_chry` was already bound in all three cities in December 2010, so the March patch's lack of a new row cannot by itself prove that Little Ladies had no weather. The extracted 2010 payloads narrow the candidate: all three contain `cbind_chry`, `vfx_cam_chry`, and `sky0_star`, but contain zero `hina`, `peach`, `petal`, `sakura`, or `momo` tokens. This is a star/cloud/camera atmosphere family, not direct blossom-event identity. With no March binding or city-layout delta and no event script call tying 8031 to Little Ladies, it remains a weak reusable-atmosphere candidate rather than an authenticated Little Ladies weather control.

## Namespace correction

The same December 2010 patch already carries `v12`-named b929-b932 Little Ladies assets. Therefore `v11` and `v12` are parallel internal shader/asset namespaces, **not a trustworthy calendar ordering**. They remain useful lineage labels, but "older v11" and "later v12" must not be inferred from the names alone.

## Evidence outputs

- `outer_patch_entry_inventory.csv`: every recoverable local ZIP header, including completeness.
- `selected_patch_summary.csv`: command-stream and target counts for the seven event-anchor/candidate patches.
- `selected_patch_pathset_comparison.csv`: the exact February 1/10 path-set and destination-hash comparison.
- `historical_weather_bindings.csv`: decoded 8027/8029/8031/8032 RegionResourceData rows.
- `historical_payload_string_clues.csv`: exact Xmas/summer tokens counted in the extracted city payloads.
- `historical_chry_payload_audit.csv`: the all-city 8031 candidate's star/cloud evidence and absent blossom/Hina tokens.
- `historical_vs_final_payload_comparison.csv`: SHA-256 and token diffs proving the Starlight-to-thunder key reuse.
- `historical_city_patch_targets.csv`: binding-table, city-DAT, and seasonal-model ETRY targets.
- `historical_event_keyword_targets.csv`: event/special-script paths carried by the selected patches.
- `partial_october_patch_recovery_summary.csv`: how much of the truncated October 2011 patch command stream remains parseable.
- `partial_october_patch_targets.csv`: complete seasonal/city targets recovered before the truncated command.
- `partial_october_bgobj_family_summary.csv`: every BG-object family reached in the surviving October prefix.
- `historical_event_control_matrix.csv`: event-level weather/layout/model conclusion.
- `extracted/`: the historical binding tables and exact Starlight, chry/star, and Moonfire city payload DATs.

## Reproduction

```powershell
python tools/build_historical_seasonal_patch_recovery.py
```

The source archive is read-only. Generated evidence lives in `outputs/historical-seasonal-patch-recovery-20260712/`.
