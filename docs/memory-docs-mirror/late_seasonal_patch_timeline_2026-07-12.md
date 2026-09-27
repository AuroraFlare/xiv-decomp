# Late seasonal patch timeline (2026-07-12)

## Result

The complete archived patch set closes the historical control gap. **All Saints' Wake 2011 and Starlight 2011 are now exact all-city bindings**, not reconstructions:

| Retail snapshot | Limsa | Gridania | Ul'dah | Payload proof |
|---|---|---|---|---|
| 4 Oct 2011 All Saints | `8027 -> 0x29D9001F` | `8027 -> 0x29B00020` | `8027 -> 0x615A0023` | every payload contains `sdef_hallo_imp`; Limsa/Ul'dah add `coasthall`/`wildshall` |
| 14 Dec 2011 Starlight | `8032 -> 0x29D9001A` | `8032 -> 0x29B0001A` | `8032 -> 0x615A001D` | every payload contains `cbind_xmas`, `vfx_cam_xmas`, and `time_xmas_se` |
| 20 Jul 2011 Moonfire | `8029 -> 0x29D9001E` | `8029 -> 0x29B0001D` | `8029 -> 0x615A0022` | all three extracted payloads contain `wtr_smmr` |

The corresponding event patches also modify city layouts across all three capitals and carry their decoration models. This matches the retail observation exactly.

## Exact repurposing date

`D2012.07.21.0000.patch` creates the strange final-client state in one coordinated delta:

- all three `8032 / wtr_xmas` files are replaced by `vfx_lastwtr` / `vfx_tunder1` Dalamud-thunder payloads;
- all three `8031 / wtr_chry` files are replaced by `cbind_stars` / `vfx_stars0001` payloads;
- Gridania's `8027 / wtr_hall` file loses Halloween and becomes a Starlight/Xmas payload;
- Limsa and Ul'dah `8027` are untouched, so their October 2011 Halloween files survive byte-identically into final 1.23b.

December 2011 refreshes Gridania's 8027 Halloween file, but it still contains `sdef_hallo_imp` and no active Xmas tokens. Its authenticated all-city Starlight weather is 8032. July 2012 performs the actual Gridania slot replacement and converts 8032 to thunder.

## Decoration-only events

- **Heavensturn:** b901 kadomatsu assets are preloaded by the December 2011 patch. No January seasonal weather payload changes.
- **Valentione:** b981/b982 are preloaded December 14, revised December 23, and carried/revised through the January patches. No seasonal weather payload changes.
- **Little Ladies:** b929-b932 were already preloaded in December 2010. March 2011 changes no city DAT and adds no row; 8031 remains only an unauthenticated star/cloud candidate.
- **Hatching-tide:** April 2011 changes all three city layout families with b972/b973; March 2012 repeats the pattern with b972/b984 and later b984 fixes. Neither event delta changes a seasonal weather payload key.
- **Foundation Day:** the event/shop/NPC contract is real, but no portable family, all-city visual owner, or weather binding is authenticated.

## Cross-event preloading

Patch membership is not event ownership by itself. October 2011 adds Halloween b976 sweets and b940 photo booth. December 2011 adds Starlight b978-b980, Heavensturn/Starlight b901 variants, and future Valentione b981/b982. This also confirms that `v11`/`v12` names are parallel asset namespaces rather than calendar ordering; b940's `snbl` stem alone did not identify its event.

## Reproduction

```powershell
python -B tools/fetch_ffxiv_patch_archive_entries.py --patch D2011.10.04.0000.patch --patch D2011.12.14.0000.patch
python -B tools/build_late_seasonal_patch_timeline.py
```

The recovered, CRC-verified patches are cached outside the repository at `C:\Users\drime\Downloads\FF14 1.0\recovered patches`. Generated evidence lives in `outputs\late-seasonal-patch-timeline-20260712`.
