# Moving the prepared level-30 and level-40 guildleves

All 102 ordinary regional encounters have behavior, circles, spawn slots,
search points and the routes/destinations their mechanics need. The
[2026-09-08 ground pass](guildleve_grounded_placements_2026-09-08.md) implements
recorded-ground layouts for 94 leves in eleven camps, with frozen XYZ evidence
and reviewed map previews. Ten camps use captured route edges; Cassiopeia's
short inferred route links are identified separately and need live testing.
The other eight retain their previous offsets pending the user's recording of
Nanawa Mines (zone 176).
Live playtesting and tuning still remain: these
are encounter reconstructions, and uncaptured probabilities, cadence and
some source discrepancies are documented in the [implementation notes](guildleve_level_30_40_implementation_2026-09-07.md).

The [per-leve readiness inventory](regional_guildleve_position_readiness.tsv)
lists all 102 IDs, zones, three prepared area centers and counts of each
location kind. A zero-count area is unused by that encounter. Regenerate it
with `tools/validate_regional_guildleve_positions.ps1 -ExportManifest` after
placement changes.

## In-game placement workflow

Use a Map Server build containing the positions editor, with these scripts
and the supplemental enemy profiles installed. Enter the leve's zone, then:

```text
!glbuild edit 10841
!glbuild locations
```

`edit` loads the complete implemented encounter and its currently installed
spatial overlay. The list identifies each location by a stable path and a
short numeric index. It includes conditional enemy variants, later marker
changes, search points, flee waypoints and defense destinations.

Stand at the desired center and move a whole prepared circle:

```text
!glbuild translate 1
```

This translates every location assigned to that area by the same XYZ offset,
preserving the relative layout. Area membership comes from the authored
spawn slots, including when two original circles overlap. Circle numbers
describe the three prepared areas; the encounter decides when to display
them. This operation does not survey terrain: correct heights, obstructions
and connecting flee paths after the move.
Interior route waypoints without an authored area slot are assigned to the
nearest original center. Moving circles can therefore separate pieces of a
route; recapture its connecting waypoints on the chosen terrain.

To adjust one location, stand at its desired position and use its list index
or exact path. Spawn entries also capture your facing:

```text
!glbuild locations waves
!glbuild position <index-or-location-path>
!glbuild undo
!glbuild finish
```

Use the inventory to identify the existing wave and actor rather than adding
new mobs. Repeated conditional variants are separate entries; whole-circle
translation moves them together. `undo` reverses one whole edit, including
a whole-circle translation.

The editor writes:

```text
C:\serverdata\guildleve_authoring\<id>\<id>.positions.lua
C:\serverdata\guildleve_authoring\<id>\<id>.positions.json
```

Copy the exported Lua module to
`Data/scripts/directors/Guildleve/Leves/Positions/<id>.lua`, replacing only
that leve's spatial overlay. Resume an exported session with
`!glbuild edit <id> resume`. Run the position validator before deploying the
updated script, then start a fresh encounter after the server's script reload
or restart so cached configs cannot retain the previous layout.

The editor changes only coordinates and spawn rotations. A layout signature
rejects captures made against a different encounter structure. It validates
the leve, zone, location IDs and numbers before applying an edit set, and
copies the config so a same-camp sibling cannot move with it. It does not
write SQL or replace the numeric encounter script.

The existing `!glbuild start`/`resume` workflow authors a complete new
encounter. Use `edit` for these implemented leves: replacing their numeric
scripts with a newly captured encounter would discard their recovered logic.

## Terrain checklist

| Camp | Level | Leves | Current geometry source |
| --- | --- | --- | --- |
| Cedarwood | 30 | 8 | Frozen recorded XYZ and edges |
| Nophica's Wells | 30 | 8 | Frozen recorded XYZ and edges |
| Humblehearth | 30 | 8 | Frozen recorded XYZ and edges |
| Cassiopeia Hollow | 30 | 8 | Frozen recorded XYZ; inferred route links, live testing pending |
| Nanawa Mines | 30 | 8 | Unresolved legacy offsets; recording pending |
| The Mun-Tuy Cellars | 30 | 8 | Frozen recorded XYZ and edges |
| Bald Knoll | 40 | 9 | Frozen recorded XYZ and edges |
| Iron Lake | 40 | 9 | Frozen recorded XYZ and edges |
| Halatali | 40 | 9 | Frozen recorded XYZ and edges |
| Broken Water | 40 | 9 | Frozen recorded XYZ and edges |
| Nine Ivies | 40 | 9 | Frozen recorded XYZ and edges |
| Treespeak | 40 | 9 | Frozen recorded XYZ and edges |

Check mob and interaction heights, reachable paths and adequate spacing on
the target terrain. For a chase, check each route segment and its arrival
pack. For a defense, move the destination with its enemies. For a search or
Reveal, keep resource suppliers and simultaneous objectives visible when
their circles are separated.

Current defaults fit the native normal circle radius of 64 yalms. They are
prepared starting locations, not recovered retail coordinates or a live
terrain certification. Nanawa still needs ground recordings. See the ground-pass report for the 33
area-center teleport tests and the command that checks every runtime XYZ
against frozen evidence. The public-world `map_coordinates.py plan` SQL is
not used for these dynamically spawned encounters.

The recovered client mapping is in
`tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua`
(size 2 gives radius 64, then populates `GLMakerData.Radius`) and
`lua/director/guildleve/guildlevebaseclass.lua` beneath the same recovered
root (place 6 selects normal/size 2). The server's current `large` setting
also emits place 6 through `GuildleveCommon.lua`; its name does not imply
the native 128-yalm branch.

## Offline checks

```powershell
pwsh -NoProfile -File tools/validate_regional_guildleve_positions.ps1
python tools/validate_guildleves_level30.py
pwsh -NoProfile -File tools/validate_guildleves_level40.ps1
pwsh -NoProfile -File tools/validate_regional_guildleve_catalog.ps1
dotnet run --project tools/regional-guildleve-position-editor-tests/RegionalGuildlevePositionEditorTests.csproj -- '.codex-build/guildleve-level-30-40/Map Server.dll' 'Data/scripts'
```

Position checks cover all 102 overlays, structural invariance, isolation of
same-camp siblings, stale/invalid input and all supported geometry kinds.
Behavior checks additionally separate concurrent circles to exercise marker
retention, including resupply, page summons and surviving chase enemies.

The final geometry audit evaluated 1,479 spawn entries, 89 search/patrol
points, 21 flee endpoints and nine defense destinations; all current defaults
fit their normal 64-yalm circles. Exact spawn overlaps between page sources
and finales, arriving runners and reinforcements, and patrols with combat
reinforcements were removed using unused slots already inside their areas.
Circle spacing and linked-pack spread remain choices for the terrain pass.

The rebuilt server, SQL migration and live playtests have not been run on a
live server as part of this change.
