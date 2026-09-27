# Quickstride configuration

Edit the `[General]` section of the root `Data/map_config.ini`:

```ini
quickstride_enabled = true
quickstride_speed_multiplier = 1.15
```

- `quickstride_enabled = false` hides the universal Quickstride action (27415),
  stops automatic grants, and rejects use from previously saved hotbar slots.
- `quickstride_speed_multiplier` multiplies current on-foot movement speed.
  `1.15` means +15%, `1.25` means +25%, and `1.50` means +50%.
- At the configured 6.0 player run speed, these examples give 6.9, 7.5, and 9.0
  running speed. Walking receives the same multiplier. Mount speed is unaffected.
- The minimum is `1.0` (no bonus). Missing or invalid strength values use `1.15`;
  a missing or invalid enable flag uses `true`. The existing movement cap applies.
- Quickstride still ends when damaged, including at strengths of 50% or higher.
  Expiry/removal reverses the multiplier captured when the effect was applied.
  The existing Flee damage behavior and separate GM `!sprint` are unchanged.

Deploy the rebuilt Map Server and updated Lua scripts, then restart Map Server.
Later configuration changes require a restart. The config resolver uses root
`Data/map_config.ini`; it does not use `Data/local` or build-output INI copies.

Focused checks:

```powershell
dotnet run --project "Fishing Tests/Fishing Tests.csproj" -- --quickstride-config-only
dotnet run --project "Fishing Tests/Fishing Tests.csproj" -- --action-menu-visibility-only
```
