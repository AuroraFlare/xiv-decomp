# Dungeon gate and Battlewarden zone ownership (2026-09-13)

## Symptom

At Tam-Tara, interacting near the Battlewarden/aetherial node could leave the
player at approximately `(307.413, -36.000, -178.645)` in zone `150`, followed
by a seamless zone change. Talking to the interior node also transferred the
player out immediately instead of allowing normal child-aetheryte use.

That reported position is only about `2.83` yalms in 3D from the authored
Warden position `(307.500, -35.000, -176.000)`. It supports retaining the
Warden's placement while correcting its Area/zone ownership; it does not
justify moving the NPC to an unrelated recorded dungeon point.

The visible `PopulaceStandard` error for actor `1001581` is Yayatu, not actor
`1500043` (the Tam-Tara Battlewarden). It appeared after the bad zone-150
handoff and is not used as evidence for the Warden's actor class.

## Correct ownership

| Site | Exterior gate | Interior gate | Battlewarden |
| --- | --- | --- | --- |
| Nanawa Mines | actor `1280052`, zone `170`, row `770` | actor `1280052`, zone `176`, row `2920` | actor `1500031`, zone `176`, row `2901` |
| Copperbell Mines | actor `1280054`, zone `172`, row `771` | actor `1280054`, zone `178`, row `2923` | none configured |
| Mun-Tuy Cellars | actor `1280082`, zone `152`, row `796` | actor `1280082`, zone `157`, row `2921` | actor `1500042`, zone `157`, row `2907` |
| Tam-Tara Deepcroft | actor `1280083`, zone `150`, row `797` | actor `1280083`, zone `158`, row `2924` | actor `1500043`, zone `158`, row `2932` |

The exterior and interior copies intentionally share an actor class. Their
spawn row and owning Area distinguish the two sides. The Warden's configured
Behest zone, SQL zone, and loaded NPC Area must all agree.

## Runtime behavior

- Talking to an exterior gate immediately enters its dungeon.
- Talking to an interior gate asks the stock **Leave this place?** question.
- Yes exits to the paired field zone.
- No opens the normal child-aetheryte menu. Nanawa and Mun-Tuy retain their
  regional guildleve options; Copperbell and Tam-Tara remain usable for normal
  node functions without an accidental exit.
- A Battlewarden loaded in an Area other than its configured Behest site is
  rejected. This prevents an old field-zone row from operating a dungeon
  Behest.

## Main SQL and runtime files

The corrected spawn rows are in the main database seed:

```text
Data/sql/server_eventnpc_spawn_locations.sql
```

Use the normal main SQL import workflow with Map Server stopped, then restart
Map Server. Event NPCs are loaded at startup and `!reloadzone` does not
reconstruct them from SQL. Stable spawn IDs and reviewed positions are preserved.
The exit confirmation lives in `AetheryteChild.lua`, teleport destinations in
`Data/scripts/aetheryte.lua`, and the Warden ownership guard in
`Map Server/Behests/BehestManager.cs`. No separate migration is required.

## Validation

Run:

```powershell
tools/validate_regional_guildleve_gates.ps1
dotnet run --project tools/behest-tests/BehestTests.csproj
```

The gate harness checks all four exterior entries, all four confirmed interior
exits, cancellation, remaining at the node, teleport/homepoint menu paths, and
the 24 underground regional guildleve starts. The Behest harness checks the
configured-Area ownership guard.
