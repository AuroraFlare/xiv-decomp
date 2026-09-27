# Historical seasonal city-layout timeline (2026-07-12)

## Result

The exact October and December 2011 retail patch payloads expose both sides of
the city-decoration control contract, not merely the weather resources.

### All Saints' Wake 2011

The October patch replaces all six public/interior capital layouts. They contain
**60 Halloween show/hide scheduler
pairs** and exactly **60 `8027`-only visibility
masks**. The reconciliation is exact across Gridania (21), Limsa Lominsa (22),
and Ul'dah (17). This proves that Halloween weather `8027` selected resident
decor groups in both the public and interior city layouts.

### Starlight Celebration 2011

The December patch changes each capital's interior layout. Against the exact
October predecessor, it adds **5
show/hide scheduler pairs** and exactly **5
new `8032`-only selectors**:

| City | New scheduler controls | New `8032` masks | Serialized groups |
|---|---:|---:|---|
| Gridania | `time_bg_crs1` | 1 | `sgrp_w_itm0_pstr1_h` |
| Limsa Lominsa | `time_bg_itm0_pstr1_h`, `time_bg_itm0_pstr3_h` | 2 | post variants 1 and 3 |
| Ul'dah | `time_bg_xmas1`, `time_bg_xmas2` | 2 | post variants 1 and 2 |

Gridania and Limsa's names had previously been left unclassified. Their exact
appearance in the Starlight patch, simultaneous winter-post dependencies, and
one-for-one `8032` reconciliation authenticate them as Starlight controls.

The five pairs compile to **10
`SEDBSCB` bodies**. Each body is 816 bytes and targets a
`LayUnitMemberActor` through `ShowHideClip`. Within each show/hide pair the two
bodies differ at exactly one byte: chunk offset `+0x1F0` is `1` for show and
`0` for hide. This is the first exact low-level activation flag recovered for
the retail Starlight decoration layer.

Gridania's `crs1` show/hide bodies are byte-identical to Limsa's `pstr1`
show/hide bodies, including SHA-256. The different authored scheduler names drive
the same compiled shared-post control primitive.

All three layouts add the shared `w_itm0_pstr1_h` render resource and texture.
Limsa additionally adds `w_itm0_pstr3_h`; Ul'dah adds `w_itm0_pstr2_h`.
The serialized group neighborhoods expose **11
candidate instance names** in total (3 Gridania, 4 Limsa, 4 Ul'dah). Those names
are structural placement membership, but the interior payload's transform
encoding is not yet decoded, so the CSV deliberately does not claim XYZ values.

The patch also adds four Gridania-local render/collision dependencies beside
the winter post. They are retained as same-patch evidence, not assigned
exclusively to Starlight without a stronger owner bridge.

## Exact artifacts

- `patch_city_layout_inventory.csv`: every changed capital DAT in both patches.
- `historical_event_scheduler_pairs.csv`: 60 Halloween and 5 Starlight controls.
- `historical_event_weather_selectors.csv`: exact `8027` and new `8032` masks.
- `december_starlight_layout_delta.csv`: October-to-December per-city diff.
- `december_starlight_added_dependencies.csv`: newly referenced post/render data.
- `december_starlight_group_neighborhoods.csv`: serialized `sgrp`/`isgrp` owners.
- `december_starlight_compiled_scheduler_chunks.csv`: exact show/hide bodies and activation byte.
- `extracted/`: all 61 decoded city DAT payloads from the two CRC-verified retail patch entries.

Source patch archive: https://archive.org/details/ffxiv_patches
