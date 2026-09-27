# Meteor Weather Sweep (lawful metadata only)

Delivered 2026-09-27 from `/tmp/ff14-staging/meteor-weather/weather.md`
(swarm scope `meteor-weather`). No game files modified. No decompiled code
reproduced. Tables are factual ID/name mappings paraphrased from open-source
repos (Meteor AGPL-3.0; FFXIVWeather MIT). Raw fetch log
(`SetWeatherPacket.cs`, `Area.cs`, `Zone.cs`, `weather.lua`,
`server_zones.sql`, FFXIVWeather JSONs) stays in `/tmp` staging by the
findings-only policy — this doc carries the findings. Memory-side twin:
`FF14-Memory/docs/meteor_weather_sweep_2026-09-27.md`.

## 1. Sources (all inspected as file bodies)

| # | Source | How fetched | Local raw copy |
|---|--------|-------------|----------------|
| S1 | `https://bitbucket.org/Ioncannon/project-meteor-server/src/develop/` (repo root) | Bitbucket REST API `2.0/repositories/Ioncannon/project-meteor-server/src/develop/` (HTML page fetch timed out; API worked) | n/a (listing) |
| S2 | `Map Server/Packets/Send/SetWeatherPacket.cs` (Meteor, FFXIV 1.x era) | `.../raw/develop/Map%20Server/Packets/Send/SetWeatherPacket.cs` | `raw/SetWeatherPacket.cs` |
| S3 | `Map Server/Actors/Area/Area.cs` (base zone class, `ChangeWeather`) | `.../raw/develop/Map%20Server/Actors/Area/Area.cs` | `raw/Area.cs` |
| S4 | `Map Server/Actors/Area/Zone.cs` (zone subclass) | `.../raw/develop/Map%20Server/Actors/Area/Zone.cs` | `raw/Zone.cs` |
| S5 | `Data/scripts/commands/gm/weather.lua` (GM `!weather` command) | `.../raw/develop/Data/scripts/commands/gm/weather.lua` | `raw/weather.lua` |
| S6 | `Data/sql/server_zones.sql` (zone id/name/region table) | `.../raw/develop/Data/sql/server_zones.sql` | `raw/server_zones.sql` |
| S7 | karashiiro/FFXIVWeather (modern forecast lib): `FFXIVWeatherService.cs`, `Data/weatherKinds.json` (188 entries), `Data/weatherRateIndices.json` (169 indices), `Data/terriTypes.json` (1016 zones) | GitHub API + `raw.githubusercontent.com/.../master/...` | `raw/FFXIVWeatherService.cs`, `raw/weatherKinds.json`, `raw/weatherRateIndices.json`, `raw/terriTypes.json` |

Negative results (checked, nothing found): `Data/scripts/directors/` contains only
`OpeningDirector.lua` + Guildleve/Quest subdirs (no weather director script); Meteor
`server_zones` table carries no weather columns (only music/flags); no other
`*eather*` files in the Meteor tree besides S2/S5 and the `Area.ChangeWeather` method.

## 2. Meteor (1.x) weather-ID table (from S2 constants)

Packet: opcode `0x000D`, size `0x28`; payload packs `weatherId` (low u16) +
`transitionTime` (high u16) into one u64 (paraphrase of `BuildPacket`).

| ID | Name | Note in source |
|----|------|----------------|
| 8001 | CLEAR | — |
| 8002 | FAIR | — |
| 8003 | CLOUDY | — |
| 8004 | FOGGY | — |
| 8005 | WINDY | — |
| 8006 | BLUSTERY | — |
| 8007 | RAINY | — |
| 8008 | SHOWERY | — |
| 8009 | THUNDERY | — |
| 8010 | STORMY | — |
| 8011 | DUSTY | — |
| 8012 | SANDY | — |
| 8013 | HOT | — |
| 8014 | BLISTERING | Bowl of Embers weather |
| 8015 | SNOWY | — |
| 8016 | WINTRY | — |
| 8017 | GLOOMY | — |
| 8027 | SEASONAL | Snow in Black Shroud, nothing elsewhere |
| 8028 | PRIMAL | Howling Eye + Thornmarch weather |
| 8029 | SEASONAL_FIREWORKS | Fireworks 20:00–21:00 ET |
| 8030 | DALAMUD | — |
| 8031 | AURORA | — |
| 8032 | DALAMUD_THUNDER | — |
| 8065 | DAY | Force day skybox + Fair regardless of ET |
| 8066 | TWILIGHT | Force twilight skybox + Clear regardless of ET |

Seasonal-per-city-state relevance (followup): Meteor models seasonal weather as two
global IDs (8027 snow-only-in-Shroud, 8029 fireworks window) plus comments tying
8014/8028 to specific primal arenas — i.e. per-zone gating exists but is hardcoded in
comments/client behavior, not in a per-city matrix table. A per-city
Halloween/Christmas matrix must therefore be built from modern observation/memory,
not from Meteor.

## 3. Meteor zone-weather wiring (paraphrase of S3/S5, no verbatim code)

- `Area` holds three weather slots (`weatherNormal`, `weatherCommon`, `weatherRare`)
  and a `mWeatherDirector` slot; `ChangeWeather(id, transition, player, zoneWide)`
  stores the ID and queues a `SetWeatherPacket` either to one player or to every
  player in the zone actor list (S3 lines ~40, ~54, ~577–599).
- GM command `!weather <id> [<transition>] [<zonewide>]` calls
  `player:GetZone():ChangeWeather(...)` and echoes a confirmation chat message (S5).
- `server_zones.sql` (S6): zone rows keyed by numeric id (e.g. 133 Limsa Lominsa,
  155 Gridania, 175 Ul'dah, 128–130 La Noscea fields, 150–154 Shroud fields,
  170–174 Thanalan fields, 190 Mor Dhona) with region ids 101–112; no weather
  columns — weather is purely runtime/director-driven in Meteor.

## 4. Modern (ARR+) correlation: FFXIVWeather open-source data (S7)

Modern scheme differs from Meteor: weather kinds are small ints (1–188), each zone
(TerriType) points at a `weather_rate` index, and each index lists cumulative
`<weatherId>:<cumulativeChance>` thresholds over a 0–99 target derived from time
(`CalculateTarget` in `FFXIVWeatherService.cs`; period 23m20s, Eorzea 8h blocks).

Weather kinds 1–17 line up 1:1 with Meteor 8001–8017 by name order:
1 Clear Skies, 2 Fair Skies, 3 Clouds, 4 Fog, 5 Wind, 6 Gales, 7 Rain, 8 Showers,
9 Thunder, 10 Thunderstorms, 11 Dust Storms, 12 Sandstorms, 13 Hot Spells,
14 Heat Waves, 15 Snow, 16 Blizzards, 17 Gloom. Higher modern IDs (18 Auroras …
66 Dragonstorms … 188 Ominous Clouds, 188 total) have no Meteor equivalent.

Per-city-state zone → rate-index matrices (ARR zone IDs; `weather_rate` from
`terriTypes.json`, thresholds resolved against `weatherRateIndices.json` +
`weatherKinds.json`):

| TerriType | Zone | Rate idx | Weather chances (id=name@cumulative%) |
|-----------|------|----------|---------------------------------------|
| 128 | Limsa Lominsa Upper Decks | 14 | Clouds@20, Clear@50, Fair@80, Fog@90, Rain@100 |
| 129 | Limsa Lominsa Lower Decks | 15 | Clouds@20, Clear@50, Fair@80, Fog@90, Rain@100 |
| 134 | Middle La Noscea | 16 | Clouds@20, Clear@50, Fair@70, Wind@80, Fog@90, Rain@100 |
| 135 | Lower La Noscea | 17 | Clouds@20, Clear@50, Fair@70, Wind@80, Fog@90, Rain@100 |
| 137 | Eastern La Noscea | 18 | Fog@5, Clear@50, Fair@80, Clouds@90, Rain@95, Showers@100 |
| 138 | Western La Noscea | 19 | Fog@10, Clear@40, Fair@60, Clouds@80, Wind@90, Gales@100 |
| 139 | Upper La Noscea | 20 | Clear@30, Fair@50, Clouds@70, Fog@80, Thunder@90, Thunderstorms@100 |
| 130 | Ul'dah - Steps of Nald | 7 | Clear@40, Fair@60, Clouds@85, Fog@95, Rain@100 |
| 131 | Ul'dah - Steps of Thal | 8 | Clear@40, Fair@60, Clouds@85, Fog@95, Rain@100 |
| 140 | Western Thanalan | 9 | Clear@40, Fair@60, Clouds@85, Fog@95, Rain@100 |
| 141 | Central Thanalan | 10 | Dust Storms@15, Clear@55, Fair@75, Clouds@85, Fog@95, Rain@100 |
| 145 | Eastern Thanalan | 11 | Clear@40, Fair@60, Clouds@70, Fog@80, Rain@85, Showers@100 |
| 146 | Southern Thanalan | 12 | Heat Waves@20, Clear@60, Fair@80, Clouds@90, Fog@100 |
| 147 | Northern Thanalan | 13 | Clear@5, Fair@20, Clouds@50, Fog@100 |
| 132 | New Gridania | 1 | Rain@5/20, Fog@30, Clouds@40, Fair@55, Clear@85, Fair@100 |
| 133 | Old Gridania | 2 | Rain@5/20, Fog@30, Clouds@40, Fair@55, Clear@85, Fair@100 |
| 148 | Central Shroud | 3 | Thunder@5, Rain@20, Fog@30, Clouds@40, Fair@55, Clear@85, Fair@100 |
| 152 | East Shroud | 4 | Thunder@5, Rain@20, Fog@30, Clouds@40, Fair@55, Clear@85, Fair@100 |
| 153 | South Shroud | 5 | Fog@5, Thunderstorms@10, Thunder@25, Fog@30, Clouds@40, Fair@70, Clear@100 |
| 154 | North Shroud | 6 | Fog@5, Showers@10, Rain@25, Fog@30, Clouds@40, Fair@70, Clear@100 |

## 5. Unresolved / needs other scopes

- Bitbucket HTML page fetch timed out (API worked); if the owner needs the exact
  HTML tree snapshot, retry `https://bitbucket.org/Ioncannon/project-meteor-server/src/develop/`
  from an unproxied host.
- Per-city *seasonal event* (Halloween/Christmas) weather matrices: not present in
  Meteor (only global 8027/8029 IDs) — needs live-client/memory observation scope.
  (Parent note: the 1.x DAT/patch evidence in `per_city_seasonal_weather_decor_matrix_2026-09-27.md`
  now covers this from the client side: same IDs all cities, city-specific DAT
  payloads, 8027 selector masks, 8070/8071 overlay.)
- `fragmenterworks` classic wiki Weather page: connection refused at fetch time;
  would be a third correlation source if reachable later.
