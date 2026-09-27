# Meteor decor/prop lineage — primitives upstream, system custom — 2026-09-27

Method: full-text search + file reads over the complete upstream Meteor source
mirror (`/tmp/ff14-staging/meteor-decor/src/`, 1,681 files, cloned from the
Forgejo mirror). Control queries hit; negatives below are real absences.

## What upstream Meteor HAS (decor primitives)

- `Area.SpawnActor(classId, uniqueId, x, y, z, regionId, layoutId)` — generic
  actor spawn with region + layout binding (`Map Server/Actors/Area/Area.cs`
  ~L526-542). "mapobj" is just a uniqueId string passed to this primitive;
  the C# side has NO map-object-specific code (only hit for `mapobj`
  tree-wide is the Lua test command below).
- `testmapobj.lua` GM command — iterates a layoutId range and spawns
  `zone:SpawnActor(actorClassId, "mapobj", x, y, z, regionId, layoutId)`
  per layout, echoing `Layout ID: N`. A manual probe tool, not a system.
- `PopulaceSpecialEventCryer.lua` — the ONE upstream event script: Foundation
  Day 2011/2012 GC-representative dialogue + over-aspected crystal/cluster
  exchange (hardcoded actor IDs 1001619–1002113, `eventMode` flag, item IDs
  3020537/3020413, seals 1000201–1000203). No weather coupling, no decor
  coupling, no event-mode word — pure dialogue + inventory exchange.
- AddActor spawn packets + `regionId` zone/region model (generic wiring).

## What upstream LACKS (all AuroraFlare-custom or client-DAT research)

Zero tree-wide hits for: `seasonal`, `halloween`, `starlight`, `moonfire`,
`SpecialEvent`, `SpecialEventWork`, `eventdecor`, `firework`, `hanabi`,
`WEATHER_HALLOWEEN`, `WEATHER_XMAS`, `SeasonalDecor`, `MapObjFireworks`.
No `eventdecor.lua` (48 upstream GM commands inventoried).

So the full seasonal decor stack is custom-built on the primitives above:
60 resident city scheduler groups + `8027`-only DAT selector masks,
`SeasonalDecorProfile`/`SeasonalDecorPlayerState` spawn state machine,
`MapObjFireworks` controller 5900036 (9s bursts, 20:00–06:00), `vfx_hanabi1..9`
banks + `time_bg_smmr` route pairs, the `!eventdecor` command, the
`SpecialEventWork[9]` mode word (opcode `0x0196`), and the 8070/8071 Windower
overlay restores. See `per_city_seasonal_weather_decor_matrix_2026-09-27.md`.

## Disposition

No upstream decor behavior was replaced — upstream never had any. The
`testmapobj.lua` layout-iterator pattern is the direct ancestor of the
layoutId/instanceId/schedulers spawn path: same `SpawnActor` call, now
driven by datamined scheduler tables instead of a GM's keyboard.
