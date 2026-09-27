# Darkhold doors, portals and chest access - 2026-09-08

> Historical first pass: counts, room assignments and the first three door unlocks
> are superseded by [the video correction](dzemael_video_placement_review_2026-09-08.md).
> The maps in this directory now show the corrected manifest. Ground provenance
> and the explicitly excluded wall branch remain unchanged.

The recorded placement pass now includes normal inter-map travel, a victory
exit, and explicit control of all 12 recovered doors/barriers in private zone
231. The first map's wall-warp dead-end is excluded from navigation and future
placements. These changes require a fresh populated instance on the rebuilt
Map Server; client collision and animation acceptance remain to be checked.

## Evidence and limits

The Map Server log contains 19 same-area warp observations during the recording.
The Stables, Gullet and Grand Hall transitions used warps while those named
doors were absent from the previous four-door publication. The log also shows
warps at the blue barriers. These observations identify route-control gaps;
they do not establish successful walking through a door or original retail
unlock conditions.

All 12 actor classes, native world positions and layout-211 instance bindings
match `server_eventnpc_spawn_locations.sql` and `server_eventnpc_mapobj.sql`.
The recovered timeline data supplies native `open`/`clos` animations. Native
map-object Y positions are bindings, not floor evidence. No SQL rows were
changed or copied into the public zone.

The [access audit](maps/dzemael-traversal-20260908/access-audit.json) preserves
the relevant log timestamps/line references, native bindings, chest points and
user exclusion without player names or session details. Placement ground comes
from the frozen capture and historically confirmed point described in the
[ground placement report](dzemael_grounded_placements_2026-09-08.md).

## Door policy

| Instance IDs | Objects | Current release policy |
| --- | --- | --- |
| 1406, 1408, 1409 | Stables, Gullet, Grand Hall doors | Open/close on player approach from entry |
| 1410, 1411, 1412, 1418 | Unused branch doors | Stay closed; retain the GM lock override |
| 1486 | Grand Hall blue barrier | Opens when all five route circles are active |
| 1493 | Feasting Hall blue barrier | Opens after Deepvoid Slave |
| 1494, 1495, 1496 | Knights', Captain's and Granary blue barriers | Open after Deepvoid Slave |

Branch closures and the lower-hall release grouping are authored route policy.
They combine the native map, recorded access and existing encounter stages;
they are not claimed as recovered retail triggers. Ordinary doors use actor
5900015; blue barriers use 5900016. Publication is atomic with complete bindings.
Released barriers replay their settled native open state when streamed back to
a participant. State stays with the private instance.

The user's first populated test failed before zone-in at 18:32:05 and 18:32:54:
the global `open_world_doors_enabled=false` setting made the old ordinary-door
lock call reject instance 1410. The corrected manager opts each ordinary door
into control owned by that exact private instance, before publication. Global
and per-zone public-door settings remain unchanged. Lua progression exclusions
still apply; the five barriers remain under the dungeon's progression control.

## Portals

Two floor sigils become available after all five circles. Hold within the sigil
for two seconds to travel between the end of map 1 and Dragonbreath Falls.
Each source and landing uses exact captured XYZ. Inter-map travel preserves
the current private instance and saved entrance. Landings are outside every
portal trigger. Leaving cancels the hold; another journey requires a fresh
approach and cooldown. Disconnected, dead, replaced-session, event-busy and
transitioning players cannot activate travel.

A third sigil appears southeast of Batraal's arena only after a clear. It uses
a five-second cancelable hold to return through the normal saved-content exit.
It is more than 12 horizontal units from every victory coffer and never opens
on a timeout. Portal actors and player visit state are cleaned up with the
instance.

| Portal | Source node | Landing |
| --- | ---: | --- |
| Map 1 to map 2 | 598 | Node 739 at Dragonbreath Falls |
| Map 2 to map 1 | 738 | Node 592 before the excluded wall |
| Victory exit | 1048 | Each participant's saved content return point |

These portals reuse the existing magitek sigil actor 1200203 at the exact
recorded source Y. The later [noncombat correction](dzemael_noncombat_placements_2026-09-08.md)
removes the old +2.63 visual lift. The original transporter visual/event binding remains
unresolved. The generic raid-warp helper returns to the entrance and is not
used for travel between maps.

## Excluded branch and chest locations

At log line 2395 (17:16:45), a warp moved beyond the first map's final wall.
The user confirmed: "yes ignore that in the navmesh data". Raw nodes 599-613
remain in the frozen 1,409-node capture for provenance, but the manifest rejects
them as placement sources. The active navmesh has 1,394 nodes after removing
those 15 nodes and their eight incident edges. Remaining IDs are preserved.

The Bladedancer's Jackboots coffer moves to node 590 on the accessible approach.
The nearby outgoing portal uses node 598 and return landing node 592, all before
the wall. Other reviewed chest samples remain fixed. In particular, victory
coffers use arena ground instead of offsets from wherever Batraal dies.

| Coffer family | Recorded node | Map |
| --- | ---: | ---: |
| Warlock's Pattens | 235 | 1 |
| Bladedancer's Jackboots | 590 | 1 |
| Revolutionary's Bliaud | 765 | 2 |
| Alpine War Jacket | 1364 | 2 |
| Solid Scale Mail objective | 621 | 2 |
| Warlock's Buckler objective | 827 | 2 |
| Batraal reward | 1114 | 2 |
| Northwestern Orobon reward | 1117 | 2 |
| All circles reward | 1128 | 2 |
| Under 25 minutes reward | 1138 | 2 |
| All regular coffers reward | 1136 | 2 |

Existing item rolls, objective bookkeeping and reward eligibility are retained.
Exact recorded floor does not prove original retail chest positions or model
clearance.

## Map review and validation

- [First map access overlay](maps/dzemael-traversal-20260908/map1.png),
  [legend](maps/dzemael-traversal-20260908/map1-legend.txt),
  [crop frame](maps/dzemael-traversal-20260908/map1.frame.json).
- [Second map access overlay](maps/dzemael-traversal-20260908/map2.png),
  [legend](maps/dzemael-traversal-20260908/map2-legend.txt),
  [crop frame](maps/dzemael-traversal-20260908/map2.frame.json).

Green rectangles are proximity doors, blue rectangles are progression gates,
and gray rectangles are closed branches. Gray crosses show the excluded raw
branch. Both maps use their own native client navigation row and crop frame.

```powershell
python -B tools/mobspawns/darkhold_placements.py --render-access docs/maps/dzemael-traversal-20260908
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate_dzemael_darkhold.ps1
dotnet run --project tools/dzemael-traversal-tests/DzemaelTraversalTests.csproj --no-restore
dotnet run --project tools/world-door-proximity-tests/WorldDoorProximityTests.csproj --no-restore
python -B -m unittest discover -s tools/mobspawns -p test_map_coordinates.py
dotnet build "Map Server/Map Server.csproj" -c Release --no-restore
```

Validation: 14 placement regressions, 64 traversal checks, existing door
proximity checks, 18 coordinate tests and five Lua parses passed. The placement
tests compare all 12 bindings against SQL and reject the excluded branch.
Traversal checks cover progression, trigger height/distance, independent visits,
cancel/retry/cooldown, landing separation and victory-exit eligibility.
Both access overlays were visually reviewed.

The entry-failure regression also passes 100 checks against the production
`Npc` controller and real DoorServer Lua. It covers all 12 definitions with the
global system off and with zone 231 locked, branch lock/release, unchanged public
behavior, excluded progression doors, unbound actors and instance isolation.
Run `tools/dzemael-door-integration-tests/DzemaelDoorIntegrationTests.csproj` for
these checks. A separate Release rebuild of this fix also passed with zero errors.

After the user stopped Map Server, the corrected DLL and matching PDB were
installed into `Map Server/bin/Release` and verified against the staged build
hashes. Previous binaries are retained in `.tmp/dzemael-door-fix-previous-build`.
The next launch uses the fix; successful in-client entry still needs confirmation.

The Release build succeeded with zero errors and five existing warnings
(four package advisories and the Blowfish sign-extension warning). The updated
binary is `Map Server/bin/Release/Map Server.dll`. No server was running at
build time, and this work did not start or restart one.

For a fresh client smoke test, start the rebuilt server and use
`!dzemael enter nocs`. Check `!dzemael diag doors` and
`!dzemael diag portals`, walk the circle progression, use both map portals,
defeat Deepvoid, and check lower-hall access, coffers and the victory exit.
`!dzemael map 1` / `!dzemael map 2` remain GM access helpers; they do not activate
objectives. No live populated run has confirmed the new bindings and portals
yet. Historical Eye/Soulgazer patrol timing also remains unresolved.
