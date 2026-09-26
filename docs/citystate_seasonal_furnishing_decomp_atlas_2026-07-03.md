# City-State Seasonal Furnishing Decomp Atlas - 2026-07-03

> **2026-07-12 correction:** `MapObjFireworks` generates `v_l#`/`v_c#`/`v_r#`,
> which the complete city-root layouts map to Hatching-tide `time_vfx_egg_*`.
> It must not be treated as positive Moonfire/8029 evidence.

Generated: 2026-07-03T01:27:32+00:00

## Inputs

- Region/resource rows: `tools\outputs\lpb\airship_ferry_region_resource_data_20260621\region_resource_all_rows.csv`
- Map-object spawn SQL: `Data\sql\server_eventnpc_spawn_locations.sql` + `Data\sql\server_eventnpc_mapobj.sql`
- Actor class SQL: `Data\sql\gamedata_actor_class.sql`
- Weather constants/GM command: `Map Server\Packets\Send\SetWeatherPacket.cs` / `Data\scripts\commands\gm\weather.lua`
- Temporary map-object GM command: `Data\scripts\commands\gm\spawnbgobj.lua`
- Recovered MapObjFireworks script: `tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\mapobj\mapobjfireworks.lua`

## Summary

- Special weather resource rows inventoried: 35
- Special weather IDs seen: 8027, 8028, 8029, 8030, 8031, 8032
- City town layout rows inventoried: 7
- City map-object bindings surfaced: 72
- MapObjFireworks actor classes without local spawn rows: 3
- Weather token counts: wtr_comp=8, wtr_chry=8, wtr_xmas=8, wtr_smmn=4, wtr_smmr=4, wtr_hall=3
- Town layout flag/scheduler counts: fst_f0_twn01=2, sea_s0_twn01=2, wil_w0_twn01=2, wil_w0_twn02=1

## Readout

- Your hunch looks right for a big slice of this: several event city visuals are exposed as region/weather resources, not manually placed furnishing items.
- `wtr_smmr` is the cleanest existing path. RegionResourceData maps it to weather `8029`, and the local server already has `fireworks_enabled` plus `!weather fireworks`.
- `wtr_xmas` is the spicy one. RegionResourceData repeatedly maps Xmas/Starlight resources to weather `8032`, while the current server constant calls `8032` Dalamud Thunder. That should be tested visually before renaming or wiring it.
- `wtr_hall`, `wtr_chry`, `wtr_comp`, and `wtr_smmn` sit in the same special-weather range. Their token names and embedded strings suggest All Saints, star/hanabi/aurora, comet/Dalamud, and primal/summon surfaces.
- The city-town DATs also expose scheduler/flag strings, especially Gridania and Ul'dah. That means some decor groups are probably authored in the city-state layout and toggled by BG scheduler state.
- `MapObjFireworks` actor classes `5900036`, `5900037`, and `5900038` exist and have recovered script behavior, but there are no local spawn rows for them. They need a layout/instance/controller probe rather than item grants.

## Best Next Probes

1. In a test session, use `!weather fireworks 0 1` in each city and confirm `wtr_smmr` behavior.
2. Probe `!weather 8032 0 1` in Limsa/Gridania/Ul'dah and compare against Starlight/Xmas resource loading.
3. Probe `!weather seasonal 0 1` for `wtr_hall`/seasonal-overlay behavior.
4. Use `!spawnbgobj list <zoneId>` and `!spawnbgobj placed <spawnLocationId>` to inspect current city layout/instance handles.
5. For fireworks controllers, test temporary `!spawnbgobj <layoutId> <instanceId> 5900036` only after finding likely retail layout/instance pairs.

## Output Files

- `outputs\citystate-seasonal-furnishing-decomp-atlas-20260703\weather_resource_surfaces.csv`
- `outputs\citystate-seasonal-furnishing-decomp-atlas-20260703\city_town_layout_surfaces.csv`
- `outputs\citystate-seasonal-furnishing-decomp-atlas-20260703\mapobj_binding_surfaces.csv`
- `outputs\citystate-seasonal-furnishing-decomp-atlas-20260703\activation_candidates.csv`

## Cautions

- Weather IDs are resource evidence plus local constant names; they are not a complete retail semantics claim until visually tested.
- `seasonal_quests_enabled` is an NPC/quest gate. It does not appear to be the main city furnishing/decor switch.
- Do not permanently add MapObjFireworks spawn rows until the layout/instance pair is confirmed. Temporary GM spawning is the safer probe.
