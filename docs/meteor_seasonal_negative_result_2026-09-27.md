# Upstream Meteor seasonal negative result — 2026-09-27

Method: full-text search over a complete upstream Meteor source mirror
(cloned from the Forgejo mirror by swarm scope `meteor-decor` into
`/tmp/ff14-staging/meteor-decor/src/`; control query `SetWeatherPacket`
hits 6 locations, proving the search covers the tree).

## Result: upstream Meteor has NO seasonal weather/decor/event system

Zero hits tree-wide for (case-insensitive):

- `halloween`, `starlight`, `all saints`, `moonfire`, `SpecialEvent`
- `seasonal`, `SpecialEventWork`, `eventdecor`, `WEATHER_HALLOWEEN`, `WEATHER_XMAS`

Upstream GM commands (`Data/scripts/commands/gm/`, 48 files): `weather.lua`
exists (numeric-only, verified raw earlier); **`eventdecor.lua` does not exist**.

## What this proves

The user's premise is exactly right: "most of the weather is custom."
Upstream Meteor contributes ONLY:

- `SetWeatherPacket` constants 8001–8017, 8027–8032, 8065/8066 + opcode
  `0x000D` wire format;
- `Area.ChangeWeather` + the numeric `!weather <id>` GM command.

Everything seasonal is AuroraFlare-custom: 8070/8071/8080 + the full custom
overlay ranges, the `!eventdecor` command, the `SpecialEventWork[9]` event-mode
lane, the 8027-selector-mask restoration research, the Windower DAT overlay,
and the per-city weather/decor matrices. No upstream seasonal behavior was
overwritten — there was none to overwrite.
