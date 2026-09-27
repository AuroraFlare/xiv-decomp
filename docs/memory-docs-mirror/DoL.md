# Disciple of the Land Data and SQL Guide

This document describes the current Miner, Botanist, and Fisher gathering-point pipeline: capturing coordinates, generating SQL, assigning Quarry and Truth nodes, loading item pools, selecting visible nodes, and deploying the data.

The short version is:

1. Capture coordinates into `C:\ServerData\gathering_points.csv` with `!addgp`.
2. Keep the recovered item lists in `Data/gather.csv`.
3. Generate the item-pool SQL.
4. Generate the point SQL. By default, this deterministically converts about 35% of captured mining coordinates to quarrying and about 10% of all captures to hidden Truth points.
5. Import the schema and generated SQL in the documented order.
6. Restart after code changes, or use `!reloadgatheringpoints` after SQL-only changes.

Do not hand-edit `Data/sql/server_gathering_points_import.sql` or `Data/sql/server_gathering_item_pools_import.sql`. They are generated files and will be replaced the next time their tools run.

## What the randomizers do

The system has four independent selection stages:

| Stage | Default | When it runs | Behavior |
| --- | ---: | --- | --- |
| Mining-to-Quarry assignment | `35%` | Point SQL generation | Each captured `mining` row receives a deterministic SHA-256 roll. A roll below `0.35` makes that candidate `quarrying`. |
| Hidden/Truth assignment | `10%` | Point SQL generation | Every capture receives a separate deterministic SHA-256 roll. A roll below `0.10` sets both `hidden=1` and `requiresTruth=1`. |
| Active-coordinate selection | Up to `48` per player | First instance sync after server start/data reload, owner depletion replacement, and bounded small-camp recycling | The server mixes the player ID and capture IDs, interleaves candidate pools, and accepts only positions at least 20 horizontal yalms from every other gathering node visible to that player in the zone. Fieldcraft uses those existing player-private actors; an empty objective circle follows an available same-camp/job/grade node at its exact XYZ, without synthetic points or automatic progress. Active minigames freeze circle reassignment; completed circles stay cleared. |
| Gathered item selection | Relative SQL weights | Each validated gathering attempt | The server randomly chooses an enabled entry from the node's item pool using its `weight`. |

The 35% Quarry setting is not a runtime chance and does not mean that a mining node sometimes behaves as Quarry. It permanently classifies that generated candidate as Quarry until the CSV row or ratio changes and the SQL is regenerated.

The importer calculates its stable roll from:

```text
zone | placeId | x | y | z | rot | type | label
```

The same row therefore receives the same Quarry and Truth results on every run. Changing any key field can change both results. The Quarry and Truth rolls use different prefixes, so changing one ratio does not disturb the other decision.

Because the algorithm compares each row independently against a threshold, `35%` is an expected proportion rather than an exact count. For example, 100 captured mining rows will usually produce roughly 35 Quarry rows, but not necessarily exactly 35. Explicitly captured `quarrying` rows remain Quarry and are not part of the mining conversion calculation.

Use different ratios when generating SQL if required:

```powershell
python tools\gatheringpoints\import_gathering_points.py `
  --input C:\ServerData\gathering_points.csv `
  --output Data\sql\server_gathering_points_import.sql `
  --quarry-ratio 0.35 `
  --truth-ratio 0.10 `
  --replace
```

Valid ratios range from `0.0` through `1.0`.

## Gathering types and IDs

The actor class controls interaction behavior and minimap presentation. Runtime
nodes retain that stock actor class while selected location visuals use an
appearance override where needed.

| Type | DoL class | Ready command | Place variation | Actor class | Pool suffix | Runtime visual |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Mining | Miner `39` | `22002` | `20001` | `1200052` | `1` | `b966 e001` (`1200029`) |
| Quarrying | Miner `39` | `22006` | `20005` | `1200053` | `2` | `b966 e001` (`1200029`) |
| Logging | Botanist `40` | `22003` | `20002` | `1200054` | `3` | `b968 e001` (`1200002`) |
| Harvesting | Botanist `40` | `22007` | `20006` | `1200055` | `4` | `b966 e002` (`1200053`) |
| Fishing | Fisher `41` | `22004` | `20003` | `1200056` | Fishing pool suffix `1` | Stock fishing appearance |
| Spearfishing | Fisher `41` | `22008` | `20007` | `1200057` | Fishing pool suffix `2` | `b969 e001` (`1200003`) |

The recovered source actions in `Data/gather.csv` use different IDs:

| Type | Recovered data action |
| --- | ---: |
| Mining | `20001` |
| Quarrying | `20005` |
| Logging | `20002` |
| Harvesting | `20006` |
| Fishing | `20003` |
| Spearfishing | `20007` |

Keep the `220xx` ready command in the SQL/CSV `commandId`. At spawn time, the
server writes the paired `200xx` place variation to `npcWork.pushCommand`; the
client uses that value to render the localized interaction label and maps it
back to the ready command when the interaction fires. Writing `220xx` directly
to `npcWork.pushCommand` produces the generic question-mark icon and a blank
interaction label because those IDs do not exist in `xtx/command_place`.

## Capturing coordinates with `!addgp`

Stand where the resource should appear and use either command name:

```text
!addgatherpoint <type> [grade|area] [radius] [label] [flags]
!addgp <type> [grade|area] [radius] [label] [flags]
```

Examples:

```text
!addgp mining
!addgp mining 3
!addgp quarrying bentbranch
!addgp logging 2 4 oak
!addgp harvesting bentbranch 4 moko_grass
!addgp harvestinglow 1 4 moko_grass
```

The area argument is optional. The command compares the player's X/Z position
with the recovered 1.23b client `mapNavi_data`/`2Dmap_marker` sub-area anchors
and automatically selects the nearest gathering area in the current zone. For
example, `!addgp mining` near Bearded Rock records Bearded Rock/`1005`/G1 even
though Lower La Noscea also contains Cedarwood. A camp name remains an explicit
override, so `!addgp mining bentbranch` always records Bentbranch/`2012`/G1.
Numeric grades, area aliases, and `placeId` values are also accepted. The
canonical definitions live in
`Data/scripts/commands/gm/addgatherpoint.lua`.

Useful placement flags are:

```text
up=<yalms> forward=<yalms> side=<yalms> rot=<absoluteRotation>
preview=off map=off model=b966 variant=e002 appearance=<id>
```

The adjusted preview position—not the player's feet position—is saved. Current defaults are:

| Capture type | Preview | Up | Forward | Side |
| --- | --- | ---: | ---: | ---: |
| Mining | `b966 e001` | `1.0` | `1.0` | `0.0` |
| Quarrying | `b966 e001` | `3.0` | `0.3` | `0.0` |
| Logging | `b968 e001` | `1.0` | `1.0` | `0.0` |
| Harvesting | `b966 e002` | `0.5` | `0.0` | `0.0` |
| Harvesting low | `b966 e001` | `1.0` | `0.0` | `0.0` |
| Spearfishing | `b969 e001` | `0.0` | `0.0` | `0.0` |
| Fishing | No default preview | `0.0` | `0.0` | `0.0` |

`harvestinglow` is a capture convenience with a lower red-light preview. It is stored as the normal `harvesting` gathering type, so imported runtime nodes use the normal `b966 e002` Harvest appearance.

Undo the last capture made by that player with any of:

```text
!addgp dl
!addgp undo
!addgp delete-last
```

This removes the matching CSV row and despawns its recorded preview when that preview still exists in the current area.

## Capture CSV format

Captures are appended to:

```text
C:\ServerData\gathering_points.csv
```

The required header is:

```csv
x,y,z,rot,zone,placeId,placeName,type,classId,commandId,grade,gradeSource,radius,actorClassId,label
```

Example:

```csv
422.849,7.800,-381.578,0.390,150,2012,Bentbranch,mining,39,22002,1,camp:Bentbranch,4.0,1200052,mining
```

Important rules:

- Keep exactly 15 columns.
- Use canonical `placeId`, `placeName`, grade, zone, type, class, command, and actor-class combinations. During import, a recognized camp name overrides stale place-ID/grade fields.
- Do not add separator lines, Markdown formatting, or command text to labels.
- Do not duplicate coordinates.
- A point is useful only when the final place/type has a supported reward table.
- All captures are checked against the known aetheryte/location anchors. Locations without legacy grade-node data, including `Cactus Basin` and `Four Sisters`, are omitted rather than inheriting a nearby camp's grade.
- Captures whose nearest known location is graded retain their authored place metadata because some 1.x map transitions are not spatially intuitive.

## Generating land item pools

`Data/gather.csv` is the recovered place/action/item source for Mine, Quarry, Log, and Harvest. `Data/gather_aim.csv` supplies signed `-5..+5` targets for Mine and Log. Generate the SQL with:

```powershell
python tools\gatheringpoints\generate_gathering_item_pools.py `
  --input Data\gather.csv `
  --aims Data\gather_aim.csv `
  --output Data\sql\server_gathering_item_pools_import.sql
```

The stable land pool ID is:

```text
itemPoolId = (placeId * 10) + type suffix
```

For Bentbranch (`placeId 2012`), that produces:

| Type | Pool ID |
| --- | ---: |
| Mining | `20121` |
| Quarrying | `20122` |
| Logging | `20123` |
| Harvesting | `20124` |

The current recovered data lists items but does not contain defensible retail drop percentages or quantities. The generator therefore writes every entry with:

```text
weight=100, minQuantity=1, maxQuantity=1
```

Mine and Log entries also receive their recovered signed `sweetSpot`. Quarry and Harvest are one-shot secondary-tool actions without the targeting widget, so their value remains SQL `NULL`. A `NULL` value is deliberately aim-neutral and keeps an item obtainable when the source target is unknown.

Weights are relative. Two entries weighted `100` and `100` are equally likely; entries weighted `70` and `30` have a 70/30 split; `100` and `50` produce a 2:1 split. If reliable wiki or client evidence is added later, preserve it in the generator/source pipeline rather than editing only the generated SQL, or regeneration will erase it.

Fishing and spearfishing rewards are maintained by the fishing SQL/data path rather than the land-pool generator. Rod-fishing sweet spots use the same aim source through `tools/gatheringpoints/apply_fishing_sweet_spots.py`; spearfishing remains depth-neutral.

## Generating gathering-point SQL

After reviewing the CSV, generate the point candidates:

```powershell
python tools\gatheringpoints\import_gathering_points.py `
  --input C:\ServerData\gathering_points.csv `
  --output Data\sql\server_gathering_points_import.sql `
  --replace
```

For a reviewed frozen capture, pass it as an additional `--supplement` rather
than replacing the primary capture. The current Humblehearth and Treespeak
supplements are
`Data\guildleveplacements\evidence\humblehearth-gathering-points-20260714.csv`
and `Data\guildleveplacements\evidence\treespeak-gathering-points-20260714.csv`;
their source scopes and hashes are recorded in
`docs\fieldcraft_gathering_point_gap_audit_2026-09-25.md`.

`--replace` makes the generated SQL delete the previous candidate rows inside the transaction before inserting the regenerated set. Omitting it creates insert-only SQL and can duplicate candidates when a full file is imported more than once.

During generation, the importer:

1. Reads and validates each CSV type.
2. Rejects locations without legacy grade-node data.
3. Performs the deterministic 35% mining-to-Quarry roll.
4. Rejects final place/type combinations without recovered rewards in `Data/gather.csv`.
5. Performs the independent 10% Truth roll.
6. Assigns the correct class, ready command, actor class, pool ID, and runtime flags.
7. Writes transactional SQL in batches.

Always review the command output. A line such as `Skipped unsupported points` means those coordinates were intentionally excluded because they would have spawned unusable actors or minimap icons.

## Adding a row directly to SQL

The generated CSV path is preferred because it is repeatable and validated. If a temporary point must be authored directly, its shape is:

```sql
INSERT INTO server_gathering_points
  (zoneId, placeId, placeName, gatheringType, classId, commandId,
   grade, minLevel, posX, posY, posZ, rot, radius, actorClassId,
   itemPoolId, label, hidden, requiresTruth, enabled, notes)
VALUES
  (150, 2012, 'Bentbranch', 'mining', 39, 22002,
   1, 0, 100.000, 10.000, -100.000, 0.000, 4.0, 1200052,
   20121, 'mining', 0, 0, 1, 'Manual example');
```

Replace the example coordinate with a verified location and first ensure that it is not already present. A normal visible point uses `hidden=0, requiresTruth=0`. A Truth-only point should use both `hidden=1` and `requiresTruth=1`.

Manual rows are still checked at runtime. A missing pool, empty pool, wrong place/type/action relationship, unsupported class, or disabled row prevents the point from consuming a visible slot.

## Visible nodes, spacing, and depletion

The SQL table stores a dense candidate population. The server does not necessarily spawn every row.

- It independently selects up to 48 normal visible nodes for each player and zone/area/type/grade pool.
- Different players can receive different active coordinates. Every runtime actor has `privateViewerId` ownership, so one player's spawn, marker, or despawn is never broadcast to another player.
- Every node visible to one player must be at least 20 horizontal yalms from every other node in that player's zone subset, across types, classes, areas, and grades.
- The number is intentionally below 48 whenever fewer valid candidates exist or accepting another candidate would violate that spacing.
- Player IDs and candidate IDs are avalanche-mixed with a new resolver seed, so sequential `!addgp` captures do not preserve their path order and players can receive different subsets.
- Pools are interleaved round-robin with a rotating first pool so dense Mine or Harvest captures do not automatically starve smaller Quarry or Log pools.
- Hidden/Truth candidates never consume the normal visible 48-node population.
- A terminal success or normal failure disables that exact actor immediately to block replay. The actor remains visible through the final animation, then only its owner loses it and receives a valid same-pool replacement when available.

Each player's initial visible subset is reshuffled when a new resolver is created, such as on server startup or `!reloadgatheringpoints`. Ordinary nodes do not all despawn merely because a ten-minute clock boundary passes. When a small authored pool has no unused same-pool candidate left, the resolver waits for two distinct completed depletions and then reactivates the oldest eligible depleted point, preserving the universal spacing rule. This is a bounded 1.x reconstruction guard for the observed point-cycle behavior; it is not a claim that an unrecovered native timer or exact internal counter has been decoded.

## Hidden Truth and HQ points

Generated Truth rows use:

```text
hidden=1
requiresTruth=1
```

They are excluded from ordinary player spawning. A matching Truth ability selects from a separate player-specific hidden pool and materializes the chosen actor only for that player. The private reveal lasts up to ten minutes. Depleted hidden nodes are tracked separately for each player and become eligible again after the player's ten-minute selection bucket advances.

Truth-only land points set the gathering session's forced-HQ flag, producing quality `4`. Ordinary nodes use Perception and active quality effects for their HQ roll.

## Grades and DoL rank

Generated legacy data uses retail-style soft progression: `minLevel` is `0`, so a lower-rank DoL class is not hard-blocked from attempting a higher-grade node. Grade instead changes success chance and Remainder pressure.

Current recommended-rank anchors are:

| Grade | Recommended rank |
| ---: | ---: |
| 1 | 1 |
| 2 | 8 |
| 3 | 18 |
| 4 | 28 |
| 5 | 38 |
| 6 | 48 |
| 7 | 58 |
| 8 | 68 |
| 9 | 78 |
| 10 | 88 |

The known legacy area table currently covers grades 1 through 5. The balance code supports higher grades for future data.

Mine and Log are main-hand actions with two to five attempts depending on Output. Quarry and Harvest are one-shot secondary-tool actions. Being below the recommended rank reduces success and increases Remainder cost; it does not make the node disappear.

Mine and Log transition from the place menu into the recovered
`MiningInputWidget` and `FellingInputWidget`. That handoff must use event type
`0` for `commandJudgeMode`; event type `5` becomes `0x50` client-side and causes
`openEventModeWidgetYield` to fail. The server also synthesizes all four land
ready-command routes (`22002`, `22003`, `22006`, and `22007`) as
`DummyCommand`, so the behavior does not depend on a particular
`staticactors.bin` revision.

## Job, tool, visibility, and minimap behavior

Each player's gathering actors and minimap presentation remain visible when that player changes jobs. Their proximity interaction is filtered: the server disables the node's push trigger for every non-matching class, so approaching it produces no interaction-menu entry. The trigger is refreshed immediately when the player changes class.

Truth-reveal expiry runs after the zone update releases `zoneList`. Player-private
node materialization resolves Areas while holding the gathering registry, so
taking the gathering registry from inside `zoneList` creates an immediate
first-login deadlock and prevents the queued `/_init` batch from flushing.

Once the correct class's trigger is active, interaction remains server-authoritative:

- Mine and Quarry require Miner and a valid Miner main-hand tool.
- Log and Harvest require Botanist and a valid Botanist main-hand tool.
- Quarry and Harvest additionally require the matching off-hand tool.
- Fishing and Spearfishing use Fisher-specific validation.

The live actors retain their stock gathering actor class and place-driven
variation so the client interaction and minimap-marker paths remain intact. The
place-driven command validates the source and then selects the matching ready
command. Runtime model overrides deliberately match the `!addgp` previews:
Mining and Quarry use red `b966 e001`, Logging uses `b968 e001`, Harvest uses
`b966 e002`, and Spearfishing uses `b969 e001`. Fishing has no default capture
preview and retains its stock appearance.

## Ability behavior and map-marker lanes

The January 2013 class pages list 26 actions apiece, but the recovered 1.23b
`ActionSettingWidget` and command data contain 31 Miner, 31 Botanist, and 31
Fisher commands. The server keeps that larger retail-client roster. It also
supports the six shared DoL actions (Fingerprints of the Gods, Wrist Flick, and
Stealth I-IV) and the remaining DoH-learned Eluders through the same discipline
utility path.

The implemented effect families are:

| Family | Runtime behavior |
| --- | --- |
| Earthen Favor / Stroke of Luck / Nature's Bounty | Raises the effective weight of rarer pool entries. |
| Sharp Vision / Field Mastery / Veteran Trade | Expands the successful approach/strike range in the authoritative gathering calculation. |
| Way of Plenty / King's Yield / Sweat of Brow | Adds Remainder, item yield, or gathering experience respectively. |
| Stone Resolve / Green Mind / Clever Arc | Slows Remainder loss; Fisher receives additional wait/jig opportunities. |
| Master of Rock / Timber / Fish | Raises the HQ calculation through the matching expert status. |
| Truth of Mountains / Forests / Seas | Applies aim/breadth/shard effects and reveals the nearest matching player-private Truth actor. |
| Elemental Wards | Rolls the matching bonus shard after a successful gather. |
| Deep Vigor / Brunt Force / Deft Grasp | Adds the ability magnitude to Miner's Vitality, Botanist's Strength, or Fisher's Dexterity in the authoritative gathering calculation. |
| Solid Reason / Ageless Words / Tidal Faith | Adds the ability magnitude to Miner's Mind, Botanist's Intelligence, or Fisher's Piety in the authoritative gathering calculation. |
| Lay of the Land / Arbor Call / Gulleye | Reports and points toward the exact requested grade. Miner/Botanist use their active actor subsets; Gulleye uses populated rod-fishing area anchors. |
| Prospect / Triangulate / Dowse | Tracks sources up to the requested grade and grants the far-distance movement bonus; Dowse uses rod-fishing area anchors and movement packets remove or restore the bonus as distance changes. |
| Fingerprints of the Gods | Allows catalyst entries that normal pool selection filters out. |
| Wrist Flick + Stone Throw | Consumes Wrist Flick to apply the crowd-control-adjusted stun. |
| Eluders / Stealth | Suppresses matching-kindred aggro or level-capped DoL aggro. Stealth applies its movement penalty, nullifies Quick/DoL tracking speed, and ends on combat/aggro, zoning, logout, class change, death, or manual reuse. |

Miner, Botanist, and Fisher visible hotbars are repaired from their class-level
data on login and class change. The former Fisher-wide crash guard was traced to
generated command `29918`: it duplicates canonical Llymlaen's Ward (`29733`)
but has no `gameCommandBasic` row in the stock client. The server now rejects
that one metadata-less command and exposes client-backed Fisher actions such as
Gulleye normally. Fish and Spearfish remain dedicated hidden menu commands in
slots 20 and 21.

Ordinary survey and tracking abilities do not borrow
`guildleveWork.markerX/Y/Z`. Those three coordinate slots belong to the active
guildleve director, and reusing them would overwrite real leve objectives.
Instead, Miner/Botanist abilities resolve only the current player's active
gathering actors, while Gulleye and Dowse resolve populated rod-fishing areas
from `server_fishing_areas`. The visible `b969` sparkle is a Spearfishing actor
and is deliberately excluded from those rod-fishing searches. Stock actor
classes drive the native talkable/minimap presentation while the server reports
count, direction, grade, and distance. Truth uses the separate private-actor
lane, so revealing a hidden point does not consume an ordinary visible slot or
a guildleve marker slot.

## SQL deployment order

Apply these files in order:

```text
Data/sql/server_gathering_points.sql
Data/sql/server_gathering_item_pools.sql
Data/sql/server_gathering_item_pools_import.sql
Data/sql/server_gathering_points_import.sql
```

The first two create the tables and normally need to be applied only when setting up the schema or after a schema change. The generated import files replace the reward and point data.

After SQL-only changes on a running, updated server, use:

```text
!reloadgatheringpoints
```

This reloads reward pools and point candidates, removes the old player-owned actors, and rebuilds a new private subset for every connected player. C# changes still require rebuilding and restarting the Map Server before the reload command can use the new code.

## Useful verification queries

Count candidates by type and visibility:

```sql
SELECT gatheringType, hidden, requiresTruth, COUNT(*) AS candidates
FROM server_gathering_points
WHERE enabled = 1
GROUP BY gatheringType, hidden, requiresTruth
ORDER BY gatheringType, hidden;
```

Check one area's candidate counts:

```sql
SELECT zoneId, placeId, placeName, grade, gatheringType, COUNT(*) AS candidates
FROM server_gathering_points
WHERE enabled = 1 AND placeId = 2012
GROUP BY zoneId, placeId, placeName, grade, gatheringType
ORDER BY zoneId, grade, gatheringType;
```

Find land points with no enabled pool or no enabled entries:

```sql
SELECT gp.id, gp.placeName, gp.gatheringType, gp.itemPoolId
FROM server_gathering_points AS gp
LEFT JOIN server_gathering_item_pools AS p
  ON p.id = gp.itemPoolId AND p.enabled = 1
LEFT JOIN server_gathering_item_pool_entries AS e
  ON e.poolId = gp.itemPoolId AND e.enabled = 1
WHERE gp.enabled = 1
  AND gp.classId IN (39, 40)
GROUP BY gp.id, gp.placeName, gp.gatheringType, gp.itemPoolId, p.id
HAVING p.id IS NULL OR COUNT(e.itemId) = 0;
```

The last query should return no rows.

## Deterministic test suite

Run the gathering and fishing coverage tests after changing the importer, SQL, resolver, visuals, grades, rewards, or DoL abilities:

```powershell
dotnet run --project "Fishing Tests\Fishing Tests.csproj" --configuration Debug --no-restore
```

The successful final line is:

```text
Fishing deterministic tests passed.
```

## Implementation map

- `Data/scripts/commands/gm/addgatherpoint.lua`: capture commands, canonical areas, preview visuals, offsets, and CSV output.
- `tools/gatheringpoints/import_gathering_points.py`: deterministic Quarry/Truth assignment and point SQL generation.
- `tools/gatheringpoints/generate_gathering_item_pools.py`: recovered land item lists and pool SQL generation.
- `Data/gather.csv`: recovered place/action/item data.
- `Data/sql/server_gathering_points.sql`: point table schema.
- `Data/sql/server_gathering_item_pools.sql`: land pool and entry schemas.
- `Map Server/DataObjects/GatheringPointResolver.cs`: per-player active subsets, spacing, Truth pools, and owner-only replacement rotation.
- `Map Server/DataObjects/LandGatheringData.cs`: weighted rewards, grade balance, attempts, Remainder, success, and HQ.
- `Map Server/WorldManager.cs`: player-private runtime actors, location appearance overrides, Truth reveals, and animation-safe depletion replacement.
- `Data/scripts/commands/gm/reloadgatheringpoints.lua`: live SQL data reload command.
- `Fishing Tests/Program.cs`: deterministic integration and data-coverage tests.
