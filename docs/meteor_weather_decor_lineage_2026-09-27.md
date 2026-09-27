# Project Meteor weather/decor lineage note

Staged: 2026-09-27. Answers "the old FF14-meteor should still have this".

## 1. Original URL status

`https://bitbucket.org/Ioncannon/project-meteor-server/src/develop/` returns an
empty/JS-gated page (verified 2026-09-27; Bitbucket retired Mercurial hosting).
Use these live mirrors of the same `develop` history instead:

- `https://github.com/chinasmooth/project-meteor-mirror` (GitHub mirror)
- `https://github.com/reiichi001/project-meteor-mirror` (GitHub mirror)
- `https://github.com/allboswe/ffxiv1.23b` (GitHub mirror)
- `https://git.arondeus.com/cassidy/project-meteor-server` (Forgejo mirror,
  synced 2025-05-20, 1,022 commits on `develop`, same tree: Common Class Lib,
  Data, Lobby Server, Map Server, World Server)

## 2. FF14-Memory IS the Meteor descendant (verified in-tree)

`Map Server/Packets/Send/SetWeatherPacket.cs` retains the original header:

- `Copyright (C) 2015-2019 Project Meteor Dev Team`, AGPL-3.0, `Meteor.Map`
  namespace — i.e. the Meteor weather packet implementation, evolved in place.

Original Meteor weather surface (verified 2026-09-27 by fetching the mirror
file `Map Server/Packets/Send/SetWeatherPacket.cs` raw from the Forgejo
mirror — 3,383 bytes, same AGPL header, same `Meteor.Map.packets.send`
namespace):

- 8001-8017 normal (clear..gloomy); 8014 marked Bowl of Embers weather.
- 8027 seasonal ("Snow in Black Shroud, nothing elsewhere"), 8028 primal
  ("Howling Eye and Thornmarch Weather"), 8029 seasonal fireworks ("Plays
  fireworks between 20:00 - 21:00 ET"), 8030/8031/8032 uncommented.
- 8065/8066 day/twilight skybox forces. Opcode `0x000D`, packet size `0x28`,
  payload `weatherId | (transition << 16)`.
- Original has NO 8036-8113 customs and no `IsLayoutBackedWeather` — all
  AuroraFlare additions. Original `Data/scripts/commands/gm/weather.lua`
  (1,089 bytes, also fetched raw) is numeric-only and calls
  `player:GetZone():ChangeWeather(weather, updateTime, player, zonewide)`;
  the local command adds the full alias table + family gating + probe scoping.

## 3. AuroraFlare custom-weather extensions (same file + registry)

- 8033-8064 color overlays; 8065/8066 day/twilight debug; 8036 all-night
  fireworks; 8037-8039 pink-fog/blue-haze/eclipse; 8040 legacy purple night.
- 8070 Halloween restored, 8071 Starlight restored (Windower DAT overlay).
- 8072-8075 primal variants, 8076 winter night, 8077 snowy2, 8078 dark
  clouds, 8079 full rain, 8080 Halloween atmosphere (decor-free).
- 8082-8113 retail-wrapper haze/fog/clear/purple family.
- `IsLayoutBackedWeather`: IDs 8027-8113 can create/retire layout objects and
  serialize against map replacement; 8001-8017 only interpolate environment.

## 4. Weather-to-decoration links (three lanes, all verified in-tree)

1. Client DAT selector masks: weather 8027 selects all 60 resident city
   Halloween scheduler groups with no second packet (60/60 `8027`-only masks).
   See `city_seasonal_weather_selector_datamine_2026-07-11.md`.
2. Server seasonal-decor spawn path: `WeatherManager.cs` `SeasonalDecorProfile`
   (`eventKey`, `layoutId`, `instanceId`, `schedulers[]`) +
   `SeasonalDecorPlayerState` drives controller actor 5900001 show/hide.
3. Fireworks/hanabi lane: `MapObjFireworks` controller 5900036, 9-second
   burst envelope, 20:00-06:00 window; weather 8029/8036 atmosphere +
   resident per-city hanabi banks (`vfx_hanabi1..9`, `time_bg_smmr` pairs in
   route layouts). Plus `!eventdecor` GM command owning decoration switches.

## 5. Delivery note

Delivered 2026-09-27 from `/tmp/ff14-staging/meteor-lineage/`.
Companion: `per_city_seasonal_weather_decor_matrix_2026-09-27.md` (§8 references
carry the mirror-URL table).
