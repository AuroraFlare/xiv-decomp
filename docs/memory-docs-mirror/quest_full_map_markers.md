# Quest Full-Map Markers

These notes document how the 1.x client shows "where to go next" markers when
the player opens a quest or active guildleve map.

## Packet Flow

Normal quest journal map flow:

```text
client -> server
0x012D EventStartPacket
  RequestQuestJournalCommand, questId, mapCode

server -> client
0x0133 GenericDataPacket
  "requestedData", "qtmap", questId, markerId...
```

Active guildleve map flow verified in-game:

```text
client -> server
0x012D EventStartPacket
  RequestInformationCommand, "activegl", requestIndex

server -> client
0x0133 GenericDataPacket
  "requestedData", "activegl", activeLeveId, 0, 0, 0, 0, 0, 0, 0
  "requestedData", "qtmap", activeLeveId, markerId...
```

For active guildleves, the `qtmap` owner must be the active guildleve id. A
packet such as `"requestedData", "qtmap", 10881, 11500601` shows the Skull
Valley yellow area marker for active leve `10881`.

## Marker Lookup

`qtmap` does not carry custom coordinates, icon, radius, or label text. It only
sends marker ids. The client looks each id up in:

```text
docs/Dat Mining/quest_marker.csv
```

The row controls the visible marker:

```text
markerId, x, z, displayNameId, spk, icon, mapGroup, mapId, radius, markerClass, textRef, visible
```

Display text comes from the row's `displayNameId` / `textRef`, not from the
server packet. For example:

```text
11500601 -> x=-1087.730 z=-837.360, displayName=Skull Valley,
            icon=m00029, class=MapMarkerQuestArea

12003500 -> x=-990.780 z=-1131.110, displayName=E'ptolmi,
            icon=m00013, class=MapMarkerQuest
```

In testing, `12003500` appeared almost exactly at the active leve target, but it
showed the normal quest/NPC icon and the baked label `E'ptolmi`. `11500601`
showed the yellow area circle, but at its baked broad Skull Valley position and
with the baked label `Skull Valley`.

## Server Metadata Cache

The map server loads the optional `quest_marker.csv` metadata once during
startup into `QuestMapMarkerCatalog`, before zone updates begin. Lua requests
use `GetQuestMapMarkerLocation(markerId)` to read this shared, immutable lookup.
Do not parse the CSV or cache it in a Lua module: `LuaEngine.LoadScript` creates
a new interpreter for each event, so a module-local cache lasts only one request.

The existing repository/build-directory CSV search order is preserved. Without
the CSV, the filter still uses its embedded seasonal locations and retains
unknown marker ids. CSV rows override embedded locations when present. Marker
ordering and the remote-only objective fallback are unchanged.

Deploy the rebuilt map server and updated Lua filter together, then restart the
map server. Changes to CSV metadata take effect on the next restart.

Regression/benchmark command (from the repository root):

```text
dotnet run --project tools/quest-map-marker-tests/QuestMapMarkerTests.csproj -c Release
```

The harness checks fresh Lua requests, missing CSV fallback, concurrent catalog
reads, and the quest journal/regional guildleve packet payloads. An optional
`-- --compare-filter <saved-old-filter.lua>` compares map families for every DAT
row and reports before/after request times. These are isolated filter timings,
not measurements of an entire live server frame.

## Guildleve Qtmap Findings

`qtmap` works for guildleve full-map markers only when the marker id points to a
usable baked client row. The first explicit validation row is:

```text
10881 Annexing the Valley -> qtmap owner 10881, marker 11500601 Skull Valley
```

Do not treat generated `strong-name-match` / `strong-nearest-yellow` candidate
rows as runtime-safe without testing each leve. The Sapped Saplings pass proved
that a strong-looking candidate can still be the wrong in-game marker.

Negative result for `12447` Sapped Saplings:

```text
!getmarker gl 12447
  No reliable auto candidate. The broad generated candidate is unsafe.

!getmarker gl 12447 11500605
  Drew the broad Emerald Moss yellow area/camp marker, not the leve objective.

!getmarker gl 12447 11065901
  Drew a nearby same-map `???` marker with the wrong baked text/style.

!glmarker 12447
!glmarker 12447 all
  With an active leve, no visible full-map marker appeared from the live
  guildleveWork marker route during this test.
```

Useful facts for the next attempt:

- The actual captured/live objective seed is around `x=-1403.354 y=30.710 z=-1794.062`.
- `11500605` is at `x=-932.500 z=-2463.660`, so it is just the broad Emerald Moss DAT area marker.
- The nearby DAT row `11065901` is at `x=-1325.450 z=-1786.340`, but it displays as `???` and is not the desired marker.
- `_setMapMarker` was intentionally not used here because the decomp shows it is actor-scoped and only writes `object+0x270`.

Conclusion: for `12447`, the static `qtmap` path does not currently have a
clean baked client marker row. The next promising path is still the live
`GuildleveBaseClass.processMapOpenMessage()` / `setMiniMapMarkerForGL()` route,
but that needs deeper verification of the client content-group/director map-open
sync before wiring a server-side fix.

## Marker Styles

Useful patterns found so far:

```text
MapMarkerQuestArea + m00029 = yellow area/circle marker
MapMarkerQuest     + m00013 = normal quest/NPC marker
```

Rows with the right position but the wrong marker class/icon will draw the
wrong visual. Rows with the right class/icon but a broad area position will draw
the yellow circle in the broad DAT location.

## Quest Implementation

Quest scripts should return marker ids from `getJournalMapMarkerList`.

```lua
function getJournalMapMarkerList(player, quest)
    return { 11000101 };
end
```

Use an existing `quest_marker.csv` row when its baked position, text, and visual
style match the quest objective. If a quest needs a custom yellow circle at a
new coordinate, `qtmap` alone cannot express it; the client needs a matching DAT
marker row, or we need to identify a separate client path that accepts dynamic
full-map guildleve marker data.

## Separate Minimap Path

Guildleve live objective/minimap markers use actor work sync:

```text
0x0137 SetActorPropetyPacket
  guildleveWork.markerX[n]
  guildleveWork.markerY[n]
  guildleveWork.markerZ[n]
```

That path updates dynamic guildleve marker coordinates and can drive minimap
behavior, but it did not make the regular/full map show a custom yellow area
marker by itself during the May 2026 tests.

## Debug Commands

Useful probes:

```text
!activeglprobe qtmap <ownerId> <markerId>
!activeglprobe combo <ownerId> <markerId>
!getmarker gl <guildleveId> <markerId>
!getmarker <markerId|alias> [ownerId]
```

Known good active guildleve test:

```text
!activeglprobe qtmap 10881 11500601
!getmarker gl 10881 11500601
```

