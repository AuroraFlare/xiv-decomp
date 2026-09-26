# City-State Scheduler Decomp Atlas - 2026-07-03

Generated: 2026-07-12T18:42:22+00:00

## Inputs

- Region/resource rows: `tools\outputs\lpb\airship_ferry_region_resource_data_20260621\region_resource_all_rows.csv`
- Client DAT targets: city public-town, interior, transit/airship layouts and special weather resources
- Existing map-layout resource dumps: `tools\outputs\lpb\map_layout_resource_data_20260621`
- Lua roots: `Data/scripts, tools/outputs/lpb/decomp_further_20260617/lua, tools/outputs/lpb/decomp_more_20260617/lua`
- Map-object SQL: `Data\sql\server_eventnpc_spawn_locations.sql` / `Data\sql\server_eventnpc_mapobj.sql` / `Data\sql\gamedata_actor_class.sql`

## Summary

- City layout scheduler/decor strings: 10191
- Complete city layout show/hide pairs: 89
- Weather overlay scheduler/decor strings: 4421
- Supporting region scheduler strings: 72
- Script scheduler calls: 61
- Map-object decor/controller candidates: 7
- Probe candidates: 11
- City string event hints: All Saints/Halloween city decor=292, City flag/decor=38, Grand Company/Foundation flag=27, City prop/tree=17, Aurora/star=9, City gate/flag group=6, Starlight/Xmas=4, Dalamud/comet=2
- Weather string event hints: Aurora/star=73, Starlight/Xmas=43, Dalamud/comet=36, City prop/tree=35, Primal/summon=31, Aurora/star/hanabi=30, All Saints=24, Moonfire/summer=15
- Script scheduler hints: Hatching-tide egg/fireworks controller=20, Dalamud/comet=19, door/gate scheduler=10, transport/shipport scheduler=6, market stand show/hide/customization=4, generic show/hide decor controller=2
- MapObjOnlyShowHide show rows: 4

## Readout

- The city-state public and interior DATs contain exact flag/decor scheduler names, not only generic resource references. `city_layout_paired_schedulers.csv` is the concise complete-pair inventory.
- Halloween pairs exist in all three city families. Exact October-to-December retail-patch diffs additionally authenticate five interior Starlight pairs: Gridania `time_bg_crs1`, Limsa `time_bg_itm0_pstr1_h/3_h`, and Ul'dah `time_bg_xmas1/2`.
- A string pair proves that the client authored a visibility scheduler. It does not by itself prove the owning instance or visible result, so the runtime command keeps unverified paths labeled experimental.
- The script side is mostly generic controllers. `MapObjOnlyShowHide` is important: actor class `5900006` runs scheduler `show`; actor class `5900007` runs `hide`.
- Existing SQL already has visible decor-shaped candidates: `merchward_mapobj_deco` and `merchward_mapobj_flag`, both actor class `5900006`, layout `5013`, instances `408` and `161`.
- `MapObjFireworks` is a different controller style. It dynamically runs `v_l#`, `v_c#`, and `v_r#` schedulers at Hydaelyn night, but local SQL still has no spawn rows for actor classes `5900036`-`5900038`.
- Supporting resource dumps expose explicit summer/fireworks scheduler names such as `time_bg_smmr_show`, `time_bg_smmr_hide`, and `sgrp_vfx_hanabi` outside the town-layout rows. Those are good layout-instance hunting clues.

## Output Files

- `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\city_layout_scheduler_strings.csv`
- `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\city_layout_paired_schedulers.csv`
- `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\weather_overlay_scheduler_strings.csv`
- `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\support_resource_scheduler_strings.csv`
- `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\script_scheduler_calls.csv`
- `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\mapobj_decor_controller_candidates.csv`
- `outputs\citystate-seasonal-scheduler-decomp-atlas-20260703\decor_probe_plan.csv`

## Safest Next Test Order

1. Use `!eventdecor list` in the destination city and start with the recovered public-town Halloween scheduler batch.
2. Restore every tested batch with the opposite action; packet delivery is not visual confirmation.
3. Probe interior layout pairs only after recovering their owning instance; a layout ID alone is insufficient.
4. Use `!spawnbgmodel b933`-style previews only for model identification; they do not prove city layout activation.
5. Probe weather-only overlays through `!weather list`; combined resource 8027 is blocked from `!weather` and owned by `!eventdecor`.

## Safety Notes

- `!weather ... 0 0` is not fully private: the immediate packet is player-limited, but `Area.weatherNormal` still changes.
- `fireworks_enabled=true` is broad: the current `WeatherManager` applies weather `8029` to all loaded zones during the Eorzea night window.
- `!spawnbgobj` is reversible in the sense that it avoids DB edits, but it still creates a live actor in the current area.
- Weather DATs are for weather/VFX overlays; city layout DATs are where layout/instance and scheduler group clues live.
