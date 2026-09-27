# Guildleve Minimap Markers

This notes the active minimap marker path for guildleves.

The client reads the live minimap objective circle from the active guildleve work
values:

```text
guildleveWork.markerX[index]
guildleveWork.markerY[index]
guildleveWork.markerZ[index]
```

The server seeds those values from `gamedata_guildleve_mapmarkers` through
`GetGuildlevePositionSeed()` / `GetGuildleveMapMarker()` for the legacy slot-0
helper, and `Server.GetGuildleveMapMarkers()` for all configured slots.
`GuildleveDirector.LoadGuildleve()` now writes DB seeds into marker slots `0..2`
before the Lua `SyncAllInfo()` path runs, so the initial info sync is not
dependent on the later script-side `applyGuildleveMarker()` call. New/reference
SQL can store multiple rows per leve with `markerIndex` `0`, `1`, or `2`; older
tables without `markerIndex` are read as slot `0`. Initial marker sync also uses
the decompiled `guildleveWork/marker` tag; `infoVariable` is only for `aimNum`,
`aimNumNow`, and `uiState`. Runtime marker changes now follow the same split:
marker coordinates are synced through `guildleveWork/marker`, while progress/UI
changes continue through `guildleveWork/infoVariable`.

The decompiled client Lua reads the marker arrays as Lua slots `1..3`:

```text
GuildleveBaseClass.processMapOpenMessage()
GuildleveBaseClass.setMiniMapMarkerForGL()
  -> guildleveWork.markerX[1], markerY[1], markerZ[1]
```

The C# director keeps the same three marker slots internally as native packet
indexes `0..2`. Existing guildleve-like content (`Behest`, `HamletDefense`,
`ChocoboCaravan`) sends those packet hashes as `guildleveWork.markerX[0]`
through `[2]`; the client-side work bridge exposes that same array to Lua as
slots `1..3`.

Behest uses `/Director/Guildleve/PrivateGLBattleSweepNormal`, so it follows the
same client marker path. `BehestDirector` now adds itself to the content group
roster for full-map director resolution, syncs markers only through
`guildleveWork/marker`, and uses marker slots `0..2` for the current Behest wave
plus up to two upcoming configured wave/spawn-circle locations.

Behest uses a site-configured stock marker independently of ordinary Guildleve
marker sizing. Most sites use the small marker (`size 1`, radius `32`), while
Halatali uses the normal marker (`size 2`, radius `64`). Its three work slots remain
current pack plus up to two upcoming pack locations. Behest orders its encounter
areas into a nearest-next route starting at the Battlewarden or captured guide
destination, and it does not activate the next area until every pack in the
current area is defeated. The client can therefore show at most three smaller
circles at once; stage 4, stage 5, and any later areas appear progressively as
the party advances.

Marker size is chosen by client Lua, not by the marker coordinate work values.
The recovered `GuildleveBaseClass.setMapMarkerSize()` maps `"small"` to `1`,
`"normal"` to `2`, and `"large"` to `3`, while the stock
`processSetMapMarkerSize()` returns `"normal"` only when the guildleve init
place code is `6`. The server config key `guildleve_map_marker_size` defaults to
`large`; `normal` and `large` both make guildleve init use the stock client's
normal-size branch, while `retail` keeps the original aetheryte place code. A
true large marker still requires a client Lua/decomp patch that makes
`processSetMapMarkerSize()` return `"large"`.

This is separate from the full-map `qtmap` route. Full-map `qtmap` packets send
static marker ids, and the client gets the marker coordinates/text/style from
`quest_marker.csv`. Minimap and MapNavigation markers use the live
`guildleveWork.markerX/Y/Z` coordinates described here.

## What `!glmarker` Proves

`!glmarker` refreshes marker slot `0` on the active guildleve director by
default. In the current server it reads `GetGuildlevePositionSeed()`, which is
wired to `Server.GetGuildleveMapMarker()` and the first
`gamedata_guildleve_mapmarkers` row for that leve.

`!glmarker here [leveId] [markerIndex]` captures the player's current position,
updates the active director marker when one is active, appends the capture to
`C:\serverdata\guildleve_markers.csv`, and prints SQL/Lua snippets for quick
review. Use marker indexes `0`, `1`, and `2` while standing at each target circle
to collect multi-spot marker coordinates leve by leve.

That means `!glmarker` proves the live minimap marker path, but it does not by
itself prove that the coordinate came from a static client DAT row. Client-origin
claims need a separate source check, such as a decoded client script/DAT record
or grouped coordinate tuple hits from `tools/probe_client_guildleve_positions.py`.

June 2026 Sapped Saplings check: `12447` has an actual live seed near
`-1403.354, 30.710, -1794.062`, but `!glmarker 12447` did not make a full-map
marker appear even while the leve was active. The recovered client Lua path is:

```text
PlayerBaseClass.postMapOpen()
  -> each ContentGroupBaseClass in player:_getAllGroup()
  -> contentGroup:getDirector()
  -> GuildleveBaseClass.processMapOpenMessage()
```

That means full-map marker rendering depends on the content group's synced
director pointer, not just the guildleve marker coordinates. The server stores
that pointer in `contentGroupWork._globalTemp.director`. `ContentGroup` now
sends its init work immediately after the group header/member packets, so the
client does not have to win a `GroupCreated` request/response race before
opening the map.

The recovered `ContentGroupBaseClass` adds two important details:

- `_globalTemp.director` is declared as a nested `member`, and `getDirector()`
  calls `_isAlive()` on it. Native decomp maps the Lua `"member"` work type to
  `IndividualIndexInformation`: an eight-byte value is read from sync memory,
  zero means nil, and `_isAlive()` resolves the full key through the current
  runtime context. A pmeteor reference capture for content-group init writes the
  director actor id in the high 32 bits with a zero low word, so the server keeps
  the content-group director value as `directorId << 32`. The nonzero low words
  seen elsewhere are group-specific (`0xC17909` for relation/trade host,
  `0xB36F92` for party owner), not the captured content-group director shape.
- `Director.StartDirector()` re-sends the content group init values after the
  director actor spawn/init packets, so the client has a live actor to resolve.
  The same post-spawn re-send is required for late guildleve participants,
  because `AddMember()` sends content group packets before `SendDirectorPackets()`
  spawns the director actor to that joining player.
- Follow-up native decomp and repo-side content examples show that the director
  actor must also be present in the content roster before `getDirector()` can
  resolve as a live member. Guildleves were missing that roster entry, so
  `GuildleveDirector` now adds its director actor directly to the content group
  roster while leaving `GuildleveDirector.GetMembers()` unchanged for
  objective/combat logic.
- The bytecode-level `_tag` table is:

```lua
contentGroupWork._tag = {
  {"director", 1, {"_globalTemp", "director"}},
  {"property", 1, {"property"}}
}
```

The server now sends content group work three ways when the group is created or
re-sent: legacy `/_init`, exact `contentGroupWork/director`, and exact
`contentGroupWork/property`.

- Native/capture cross-check: after the client constructs the director-side
  group it sends inbound `0x0133` with `/_init` and a group key. That key can be
  the server content-group id or a legacy director-actor-id key. The server must
  answer with outbound `0x017A` using the same key in the packet body; otherwise
  the client's group state machine can still wait forever even if the server
  proactively sent the right work values earlier. `WorldManager.SendGroupInit()`
  now resolves those director-id/content-prefix echoes back to the active
  content group and sends the init work against the echoed key.

- The client calls `isPropertyEnabled(1)`, `isPropertyEnabled(2)`, and
  `isPropertyEnabled(3)`. Following the packet/native array convention, the
  server now sets/syncs `contentGroupWork.property[0]`, `[1]`, and `[2]`.

## Current Build Path

Run:

```powershell
python tools\build_guildleve_minimap_markers.py
```

Generated files:

- `Data/sql/gamedata_guildleve_mapmarkers.sql`
- `tools/outputs/guildleves/minimap_marker_sources.csv`

The SQL keeps one row for every DAT guildleve row so active markers never go
blank. The review CSV is the important audit file; it marks each row as either
`actual`, `derived`, `placeholder`, or `missing`.

## Source Priority

The generator applies the latest `C:\serverdata\guildleve_markers.csv`
`!glmarker here` capture to its exact slot first. Fieldcraft leves then receive
one static slot per required point from, in order, an existing enabled
Miner/Botanist point, an existing Fisher spearfishing coordinate used as a
nearby rod-fishing anchor, or a walkable quick-navmesh point beside the named
field area. The eLeMeN pages name the area but contain no per-leve world
coordinates, so these are stable server placements, not claimed retail
coordinates.

For non-fieldcraft rows, remaining priority is:

1. `Data/scripts/directors/Guildleve/Leves/<leveId>.lua` explicit marker
2. `C:\serverdata\mobspawns_gl_part1.csv` / `mobspawns_gl.csv` captured circle
3. `Data/sql/gamedata_guildleve_spawns.sql` first objective spawn
4. `docs/Dat Mining/guildleve_map_markers_all.csv` fallback

Only a `!glmarker`/circle capture or explicit sourced script marker should be
treated as an actual per-leve minimap coordinate. Existing gathering points and
navmesh points prove a usable static location, not the exact historical circle.

## Current Coverage

As of the latest generation:

- total marker rows: **814**
- `!glmarker` captures: **1**
- explicit leve-script markers: **48**
- static fieldcraft rows: **288** across all **99** unique fieldcraft leves
  - existing Miner/Botanist coordinates: **96**
  - existing Fisher-area spearfishing coordinates: **31**
  - named-area walkable navmesh: **144**
  - Iron Lake area fallback (unverified Y): **17**
- older non-fieldcraft fallback rows: **477**

Fieldcraft marker rows exactly match the captured objective counts: every
two-point objective has slots `0..1`, and every three-point objective has slots
`0..2`. At runtime the 198 Miner/Botanist rows are the actual director-owned
gathering actors, so their circles and usable points cannot drift apart. The 90
Fisher rows are data/audit anchors only. Runtime Fisher leves use marker zero to
identify the expected `FishingArea`, suppress every visible objective marker,
spawn no fishing actor, and override the ordinary catch table for a normal
free-water cast in that area.

Example actual rows:

- `10821` Mole Patrol: `80.455, 40.825, -20.387`
- `11646` Popotoes in Peril: `1159.237, 279.457, -526.473`
- `12446` Tricks of the Traders: `-1199.480, 19.553, -1724.968`

Example placeholder row:

- `10881` Annexing the Valley: `-991.880, 44.000, -1120.790`

That means `10881` is still not recovered as an actual retail minimap circle;
it is still using the old generated Skull Valley fallback until we capture or
mine a real circle row for it.
