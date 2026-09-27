# Mistbeard weather boundary — 2026-09-12

Zone 131 now has an authored clear/blue-fog split. The dock and water side is
blue fog (`8087`); the main caves use clear weather (`8001`) throughout the day.
Crossing back into the caves selects clear again. The nightly aurora roll no
longer replaces either Mistbeard weather pool. Explicit GM weather overrides
still work.

## Boundary evidence

The user's supplied position is exactly:

```text
!pos 131 -1996.657 4.552 -1482.811
Rotation: 2.063
```

The boundary passes through that X/Z and is perpendicular to the supplied
facing direction `(sin(2.063), cos(2.063))`. Dock-side fog is an interpretation
of the requested direction, supported by the native map and recorded passage;
it has not yet been confirmed in-game. Server Y remains recorded context and
does not determine weather ownership.

Two equal-priority nearest anchors partition the zone across that line:

| Area ID | Weather | Anchor X | Anchor Z |
| --- | --- | --- | --- |
| 1310001 | Clear, 8001 | -1968.455604 | -1497.933212 |
| 1310002 | Blue fog, 8087 | -2024.858396 | -1467.688788 |

These are weather ownership anchors, not actor positions or claims of ground
coverage. Nearest-anchor mode selects the new side immediately on crossing;
the existing micro-weather fade is 180 seconds. Teleport and seamless zoning
retain their existing transition timing.

The preview uses native MapNavi page 600, with offsets X=2400/Z=2176 and scale
2. It classifies the current 2,406 recorded points as 306 dock-side points and
2,100 clear-side points. The recorded dock branch lies at Y=3.431158 through
12.952419. Nearby western cave rooms remain on the clear side. This is map and
recording evidence, not an in-game weather or collision validation.

See [the rendered boundary](maps/mistbeard-weather-20260912/index.html) and
[its coordinate frame/source hashes](maps/mistbeard-weather-20260912/boundary.frame.json).
Regenerate with `python -B tools/mobspawns/render_mistbeard_weather.py`.

## Activation

The canonical seed includes the new rows. Existing databases should import
only `Data/sql/live migrations/mistbeard_dock_weather_20260912.sql`, then run the
rebuilt Map Server. The transaction replaces only zone 131 weather definitions
and can be imported repeatedly. `micro_weather_enabled` must remain enabled,
as it is in `Data/map_config.ini`.

The migration has not been applied to a running database, and no server has
been restarted by this change. The C# aurora exception requires the rebuilt
server, in addition to the SQL import.

## Verification

- The test project builds successfully with the repository's serial build
  approach (`-m:1 -nodeReuse:false`; `UseAppHost=false` for this test build).
- `dotnet "Fishing Tests/bin/Debug/net10.0/Fishing Tests.dll"
  --mistbeard-weather-only` passes: actual boundary selection in both
  directions, dock/cave separation, zone isolation, all 24 hours with and
  without aurora, and explicit GM override handling. It also compares the
  canonical SQL block with the scoped migration.
- `python -B tools/test_mistbeard_weather_sql.py` passes: repeat import and
  preservation of another zone in an isolated SQLite fixture. This is not a
  live MySQL integration test.
- The broader `--micro-weather-only` suite still fails its existing combined
  configuration contract. It requires scheduled=180/seamless=35 in the INI,
  while the repository uses 20/20. This predates this change and is documented
  in `docs/weather_transition_audit_2026-09-06.md`; those settings were preserved.
- The native-map PNG was inspected to verify that the marked line crosses the
  supplied point and keeps the main cave passages outside the blue overlay.
