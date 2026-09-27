# Seasonal orphan-layout datamine (2026-07-12)

## Result

The final 1.23b install contains **287**
`MapLayoutResourceData` DATs. All **287** are referenced by the recovered
`RegionResourceData` table; **0** are orphaned.
The broader seasonal-token filter found **40** layout DATs,
again with **0** unmapped files.

This closes the orphan-layout hypothesis for this install. The five resident
Starlight pairs are mapped interior-layout data, while the missing city summer
decoration layouts are not sitting in an unreferenced layout DAT.

## Exact scheduler residue

The exact `time_bg_*_(show|hide)` seasonal scan finds
**154** strings in
**8** files:

- Halloween: **6** files, the known six city public/interior layouts.
- Starlight: **3** files, one interior per city; their five resident pairs have empty/dormant final weather show masks but exact December 2011 payloads bind them to five `8032` masks.
- Summer: **2** files, the two ferry-route layouts only.

There is therefore no resident city summer scheduler family. The formerly
anonymous Gridania `crs1` and Limsa `itm0_pstr*` families are now authenticated
as Starlight by exact October-to-December patch diffs.

## Non-layout seasonal residue

To reject chance ASCII matches inside opaque binary data, this scan accepts only
lowercase path/name tokens containing `xmas|smmr|summer|hlw|hallo` plus `/` or
`_`. It finds **145**
matching resources in
**10** header
classes. Only **30** are
layouts; **115** are
scene, resource,
effect, texture, model, or other binary classes.

This is positive evidence that substantial seasonal-labeled component residue
survives outside the layout layer. It does not recover the missing city decor:
many hits are dependency/reference path strings, and a model or effect DAT does
not say where it was placed or which historical weather/event state activated
it. The class and per-file inventories preserve this pool for a later dependency-
graph pass without treating every token hit as an active seasonal payload.

The event split is asymmetric. Summer appears in only
**7** structured-token DATs:
the region table plus six layouts (three city weather payloads, one route weather
payload, and two ferry show/hide layouts). Excluding that binding table and the
layouts, **0**
summer-named components remain. There is no separately summer-named
model/effect/resource pool in this install.
Starlight and Halloween do retain structured named residue across non-layout
effect/resource classes, but placement and historical activation are still lost.

## Dangling Git-object probe

The launcher-derived seasonal probe queue contains
**10** prioritized patch files with known
byte sizes and CRC32 values. Git contains
**12575** unreachable blobs, but
**0** have an exact probe patch-file size.
No complete historical patch payload is recoverable from dangling Git objects by
exact size; a size match would only have been a candidate pending CRC verification.

## Interpretation boundary

This is strong negative evidence about the installed 1.23b corpus, not proof that
the older retail decorations never existed. Retail observations and historical
patch notes remain compatible with those assets being present in earlier patch
states. Recovering their exact object lists and activation bindings still requires
an authentic historical client or patch delta.

## Reproduction and outputs

Run:

```powershell
python tools/build_seasonal_orphan_layout_atlas.py
```

Outputs:

- `outputs/seasonal-orphan-layout-atlas-20260712/installed_layout_inventory.csv`
- `outputs/seasonal-orphan-layout-atlas-20260712/exact_seasonal_scheduler_strings.csv`
- `outputs/seasonal-orphan-layout-atlas-20260712/focus_layout_dat_summary.csv`
- `outputs/seasonal-orphan-layout-atlas-20260712/dangling_patch_size_matches.csv`
- `outputs/seasonal-orphan-layout-atlas-20260712/seasonal_resource_token_inventory.csv`
- `outputs/seasonal-orphan-layout-atlas-20260712/seasonal_resource_class_summary.csv`
- `outputs/seasonal-orphan-layout-atlas-20260712/contract_summary.json`

Related findings:

- [city selector atlas](city_seasonal_weather_selector_datamine_2026-07-11.md)
- [native seasonal control plane](seasonal_control_plane_decomp_2026-07-11.md)
- [historical patch probe](seasonal_weather_decor_patch_datamine_2026-07-11.md)
