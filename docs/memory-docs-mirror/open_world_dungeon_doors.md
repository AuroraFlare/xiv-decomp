# Open World Dungeon Doors

This document captures the working door pattern for open-world dungeon entrances and the process for bringing the remaining closed dungeons online.

## Rule Of Thumb

Limsa-style map-object doors work only when both halves are correct:

- a row in `server_eventnpc_spawn_locations`
- a matching row in `server_eventnpc_mapobj`
- a real client BG object binding sent as `SetActorBGProperties(instanceId, layoutId)`
- the correct client actor class for the intended behavior

Ordinary dungeon and stronghold doors use their proven `5900015 / DoorServer`
binding. The client script's final initialization flag is forced to `false`, so
the bound model starts closed; the shared Lua proximity policy then sends the
same `open`/`clos` animation commands that succeeded during Castrum probing.
Limsa's `DoorStandard` reaction contract does not transfer to these layouts.

The SQL `uniqueId` is only a server-side script label. The client-side door identity is the `(layoutId, instanceId)` pair.

Do not use the old forced-open Nanawa experiments as a coordinate baseline. The
complete door family and placements are now recovered directly from the client
layout, as documented below.

## 2026-06-21 Map Object Gap Note

- Recovered `MapObjOneWayDoor` evidence does not have a safe local script/binding path yet, and prior one-way probes could crash the stock client. Do not force-bind it for normal dungeon doors.
- `DoorStandard`'s recovered reaction contract is specific to layouts with authored reaction volumes. Dungeon and stronghold placements retain `DoorServer`. Keep each promoted door tied to a visible `(layoutId, instanceId)` success.
- `MarketStand` and `Pray12Gods` are still missing local scripts and should not be inferred from generic map-object success.
- `MapObjTutorial` and `MapObjOnlyShowHide` remain low-behavior shims until a concrete actor class, map-object row, and animation/state probe proves their live role.

## Actor Classes

| Actor class | Script class | Use |
| --- | --- | --- |
| `5900001` | `DoorStandard` | Limsa-style doors whose layouts supply the expected reaction-volume contract. |
| `5900006`, `5900007` | `MapObjOnlyShowHide` | Alternate map-object class for show/hide or collision-state objects. Untested for Tam-Tara at the time these notes were written. |
| `5900015` | `DoorServer` | Proven ordinary dungeon/stronghold door binding; automatic doors start closed and receive proximity-driven `open`/`clos`. |
| `5900016` | `DoorServer` | Dungeon barriers or alternate server-controlled door objects. |
| `5900026..5900028` | `MapObjOneWayDoor` | Alternate one-way map-object door class. Rejected for map-object probing: the normal map-object tuple crashes the stock client, even one candidate at a time. |
| `1090097..1090162` | `ObjectEventDoor` | Invisible/trigger-like event doors using appearance `10999`. These can create door targets/push events, but do not animate a BG panel and are not needed by the DoorStandard reaction bridge. |
| `1200200..1200208` | `RaidDungeonBarrier` | Photocell props from `b936`; rejected for the Tam-Tara wooden door. Do not use these for Tam-Tara row `2931`. |
| `1200373..1200375` | placeholder `~~~magitek???~~~` | `b988` magic barrier variants. Rejected as the next Tam-Tara door path unless a separate magic barrier is being tested. |

The unique Lua script path depends on the actor class path. For example, a SQL row with actor class `5900015` looks for:

```text
Data/scripts/unique/<zoneName>/DoorServer/<uniqueId>.lua
```

If the script is placed under `DoorStandard` while the SQL row uses `5900015`, the live door can bind but the unique script will not run.

## Dungeon Internal Names

Reference table captured during Tam-Tara door testing. Treat this as a client/content naming aid; the server's active zone rows may still use separate numeric zone IDs and local implementation names.

| Dungeon name | Internal name | Region ID | Entrance coordinate | Real coordinate | Type |
| --- | --- | ---: | --- | --- | --- |
| Mistbeard Cove | `sea0Dungeon01` | `101` | `-1748, 19, -1426` | Same | Dungeon |
| Unknown Limsa Dungeon | `sea0Dungeon02` | `101` | `-1901, 20, -943` | Same | Unreleased |
| Cassiopeia Hollow | `sea0Dungeon03` | `101` | `1135, 19, -722` | Same | Dungeon |
| Shposhae | `sea0Dungeon04` | `101` | `270, 19, 275` | Same | Dungeon |
| Unknown Limsa Dungeon | `sea0Dungeon05` | `101` | `410, 44, -847` | Same | Unreleased |
| U'Ghamaro Mines | `sea0Dungeon06` | `101` | `76, 48, -2798` | Same | Dungeon |
| The Mun-Tuy Cellars | `fst0Dungeon01` | `103` | `850, -10, 645 (24-18)`; `-1025, 5, -2425 (20-13)` | Same | Dungeon |
| Tam Tara Deepcroft | `fst0Dungeon02` | `103` | `315, 5, -250` | Same | Dungeon |
| The Thousand Maws of Toto-Rak | `fst0Dungeon03` | `103` | `850, -10, 645` | Same | Raid |
| Unknown Shroud Dungeon | `fst0Dungeon04` | `103` | `1584, 18, -376` |  | Unreleased |
| Peacegarden | `fst0Dungeon05` | `103` | `-559, 2, -3085` | Same | Unreleased |
| Unknown Shroud Dungeon | `fst0Dungeon06` | `103` | `-1392, -38, 123` |  | Unreleased |
| Unknown Thanalan Dungeon | `wil0Dungeon01` | `104` | `1810, 242, 533` |  | Unreleased |
| Nanawa Mines | `wil0Dungeon02` | `104` |  |  | Dungeon |
| Unknown Thanalan Dungeon | `wil0Dungeon03` | `104` | `1873, 227, -60` |  | Unreleased |
| Copperbell Mines | `wil0Dungeon04` | `104` |  |  | Dungeon |
| Cutter's Cry | `wil0Dungeon05` | `104` | `-912, 255, -1524` |  | Raid |
| Red Ant Nest | `wil0Dungeon06` | `104` | `1645, 224, 1613` |  | Unreleased |
| Dzemael Darkhold | `roc0Dungeon01` | `102` | `-84, 220, 240` | verify | Raid |
| Hengr's Crucible | `roc0Dungeon02` | `102` | `1575, 340, -2050` |  | Unreleased |
| The Aeryie | `roc0Dungeon03` | `102` | `-2735, 316, -1168` |  | Unreleased |
| Aurum Vale | `roc0Dungeon04` | `102` | `-1216, 260, 1405` | verify | Raid |
| Unknown Coerthas Dungeon | `roc0Dungeon05` | `102` | `-2095, 300, -1198` |  | Unreleased |
| The Fesse | `roc0Dungeon06` | `102` | `1760, 180, 180` |  | Unreleased |

## Recovered Ordinary Door Coverage

| Dungeon | Outside zone | Inside zone | Zone name | Actor class | Layout | Instance | Status |
| --- | ---: | ---: | --- | ---: | ---: | ---: | --- |
| Mistbeard Cove | n/a | `131` | `sea0Dungeon01` | `5900015` | `111` | `3616`, `3617`, `3619..3627` | Complete 11-object compiled open/close timeline family. The separate retail-sealed entrance gate actor remains untouched. |
| Shposhae | n/a | `235` | `sea0Dungeon02` | `5900015` | `112` | `3679..3690` | Complete 12-object compiled open/close timeline family. |
| Nanawa Mines | `170` | `176` | `wil0Dungeon02` | `5900015` | `412` | `2717..2731` | Complete client-layout door family promoted; `2720` was previously confirmed in game. |
| Mun-Tuy Cellars | `152` | `157` | `fst0Dungeon01` | `5900016` | `311` | `3156..3173`, `3225`, `3226` | Complete 20-object compiled open/close timeline family with exact layout-settings world positions. |
| Copperbell Mines | `172` | `178` | `wil0Dungeon04` | `5900015` | `414` | `2645`, `2652..2661` | Complete 11-object ordinary open/close family. The separate show/hide barrier remains content-owned. |
| Tam-Tara Deepcroft | `150` | `158` | `fst0Dungeon02` | `5900015` | `312` | `3598..3609`, `3649` | Complete 13-object table and client-layout family; live-confirmed. |
| Dzemael Darkhold | n/a | `231` | `roc0Dungeon01` | `5900015`/`5900016` | `211` | `1406`, `1408..1412`, `1418`, `1486`, `1493..1496` | All 12 compiled door placements are bound. Seven ordinary doors use proximity; five named barriers retain encounter ownership. |
| The Aurum Vale | n/a | `245` | `roc0Dungeon04` | `5900015` | `214` | `1292`, `1293` | Both ordinary open/close panels are bound; the five existing barriers remain content-owned. |

Cassiopeia Hollow layout `113` has no compiled ordinary door timeline. Cutter's Cry layout `413` contains five show/hide encounter barriers but no ordinary open/close door family. No automatic rows are fabricated for either zone.

Nanawa `2720` was confirmed with:

```text
!testmapobj open 412 2720 2720 5900015
```

## Nanawa Client-Layout Recovery

The installed 1.x client resource rooted at `wil_w0_dun02` exposes the same
door-instance pattern that matches Tam-Tara's published table: three door
resource groups followed by `isgrp_002717` through `isgrp_002731`. The layout
settings object supplies the world origin `(128, 168, -1376)`, which converts
the stored local transforms into these world placements:

| Instance | X | Y | Z |
| ---: | ---: | ---: | ---: |
| `2717` | `-64.000` | `167.000` | `-1328.000` |
| `2718` | `-80.000` | `167.000` | `-1344.000` |
| `2719` | `-96.000` | `167.000` | `-1328.000` |
| `2720` | `64.000` | `167.000` | `-1264.000` |
| `2721` | `110.699` | `167.500` | `-1167.105` |
| `2722` | `128.000` | `167.000` | `-1232.000` |
| `2723` | `112.000` | `167.000` | `-1280.000` |
| `2724` | `112.000` | `167.000` | `-1312.000` |
| `2725` | `96.000` | `167.000` | `-1328.000` |
| `2726` | `128.000` | `167.000` | `-1328.000` |
| `2727` | `256.000` | `167.000` | `-1232.000` |
| `2728` | `272.000` | `167.000` | `-1248.000` |
| `2729` | `304.000` | `167.000` | `-1312.000` |
| `2730` | `288.000` | `167.000` | `-1328.000` |
| `2731` | `320.000` | `167.000` | `-1328.000` |

This replaces the old `2720` actor position near the entrance/aetheryte with
the physical panel's client-layout position. SQL row `2915` remains assigned
to `2720`; rows `3043..3056` cover the other 14 panels.

The original confirmed binding was:

```sql
REPLACE INTO server_eventnpc_spawn_locations
(id, actorClassId, uniqueId, zoneId, privateAreaName, privateAreaType, x, y, z, rot, motionPack)
VALUES
(2915, 5900015, 'nanawa_mines_door_entrance_2720', 176, '', 0, 64.000, 167.000, -1264.000, 0, 0);

REPLACE INTO server_eventnpc_mapobj
(id, layoutId, instanceId)
VALUES
(2915, 412, 2720);
```

And the matching script is:

```text
Data/scripts/unique/wil0Dungeon02/DoorServer/nanawa_mines_door_entrance_2720.lua
```

That script returns `412, 2720, true` from `init` and plays `open` in `onSpawn`.

## Script-Backed Bindings

These dungeon rows already had `server_eventnpc_spawn_locations` entries and matching unique scripts that return exact BG object IDs from `init`. The missing piece was the `server_eventnpc_mapobj` rows.

| Zone/script group | Spawn rows | Layout | Instance IDs | Status |
| --- | --- | ---: | --- | --- |
| U'Ghamaro Mines, `sea0Dungeon06/DoorServer/seadun6_*` plus recovered layout doors | `891..898`, `3128..3141` | `116` | `487`, `488`, `490`, `492..501`, `1095`, `1114`, `1116`, `1124`, `1132`, `1280`, `1315`, `1333`, `1585` | Complete 22-object `sgrp_bg_d6_door_a1/b1/c1` family. The original eight were reported visually open; the remaining fourteen are exact client-layout recoveries awaiting a live traversal smoke test. |
| Dzemael Darkhold, ordinary and encounter-owned doors | `901..908`, `3187..3190` | `211` | `1406`, `1408..1412`, `1418`, `1486`, `1493..1496` | Complete compiled family. The five `barrier` rows remain excluded from proximity behavior. |
| The Aurum Vale, ordinary doors and `rocdun4_*` barriers | `910..914`, `3191..3192` | `214` | ordinary `1292..1293`; barriers `1479..1483` | Ordinary panels are automatic; barriers remain excluded. |
| The Thousand Maws of Toto-Rak, `fst0Dungeon03/DoorServer/fstdun3_*` | `915..925` | `313` | `3579`, `3444`, `3466`, `3487`, `3580`, `3583`, `3585`, `3587`, `3589`, `3591`, `3593` | Added mapobj bindings. |
| `wil0Dungeon02/DoorServer` Nanawa door family | `2915`, `3043..3056` | `412` | `2717..2731` | Complete client-layout family; all rows are bound as `5900015`, with `2720` previously confirmed in game. |
| Mistbeard Cove ordinary doors | `3153..3163` | `111` | `3616`, `3617`, `3619..3627` | Complete compiled open/close family with settings-origin world transforms. |
| Shposhae ordinary doors | `3164..3175` | `112` | `3679..3690` | Complete compiled open/close family with settings-origin world transforms. |
| `fst0Dungeon01/DoorServer/muntuy_cellars_door_*` | `2919`, `2922`, `2933..2944`, `3176..3181` | `311` | `3156..3173`, `3225`, `3226` | Complete 20-object family; all earlier provisional positions were replaced by exact layout-settings transforms. |
| Copperbell ordinary doors | `2925..2930`, `3182..3186` | `414` | `2645`, `2652..2661` | Complete 11-object open/close family with exact world positions. |
| Tam-Tara Deepcroft confirmed interior table doors | `2931`, then `2945+` for additional promoted rows | `312` | `3598..3609`, `3649` | Promoted with `5900015`, matching Lua scripts, and folded into `Data/sql/server_eventnpc_spawn_locations.sql` plus `Data/sql/server_eventnpc_mapobj.sql`. |

Cutter's Cry uses `wil0Dungeon05` (layout 415); its compiled timeline owns
encounter `show`/`hide` doors and objects rather than ordinary `open`/`clos`
doors. Those remain encounter content instead of being converted into proximity
doors. The September 16 route review superseded the old layout-413 server join.

## Stronghold Door Coverage

The four strongholds were recovered directly from their installed client layout DATs. A door is included only when an instance placement is structurally owned by a compiled timeline containing door open/close animation and collision tracks. Object IDs come from the placement instance names, not lexical proximity guesses.

| Stronghold | Zone | Layout | Exact timeline owner | Bound object IDs | Count |
| --- | ---: | ---: | --- | --- | ---: |
| Natalan | `143` | `201` | `sgrp_bg_gate_ixal` | `4001..4009` | 9 |
| Zahar'ak | `174` | `405` | `sgrp_w0f0_br_dor1_h`, `sgrp_w0f0_br_dor2_h` | `5841..5843`, `15834..15840` | 10 |
| U'Ghamaro Mines | `137` | `116` | `sgrp_bg_d6_door_a1`, `sgrp_bg_d6_door_b1`, `sgrp_bg_d6_door_c1` | `487`, `488`, `490`, `492..501`, `1095`, `1114`, `1116`, `1124`, `1132`, `1280`, `1315`, `1333`, `1585` | 22 |
| Castrum Novum | `190` | `501` | `sgrp_teikokutobira_A` | `19111`, `19269..19272` | 5 |

All 46 objects have matching spawn and `server_eventnpc_mapobj` rows. Zones `143`, `174`, and `190` are included in `ConfigConstants.IsAutomaticWorldDoorZone`; U'Ghamaro zone `137` is already in the open-world dungeon set.

Rebuild the evidence with `python tools/build_stronghold_door_inventory.py`. The generated audit lives under `outputs/stronghold-door-inventory-20260816/`; `python tools/validate_world_door_coverage.py` checks 213 bindings: 83 ordinary doors from seven additional open-world layouts, 46 stronghold doors, 13 Tam-Tara doors, and the 71 published Toto-Rak door/barrier bindings. The validator writes `outputs/world-door-coverage-20260816/`.

## Automatic Door Proximity

Ordinary doors in configured dungeon, open-world dungeon, and stronghold zones use `5900015 / DoorServer`. This is the actor class under which the recovered Castrum bindings visibly responded to `open`. The earlier conversion to Limsa's `5900001 / DoorStandard` was reverted because Castrum remained closed under that class.

`open_world_doors_enabled = true` in `Data/map_config.ini` is the master switch. Fourteen individual `open_world_door_<zone>_enabled` switches control Mistbeard, Cassiopeia, U'Ghamaro, Natalan, Mun-Tuy, Tam-Tara, Zahar'ak, Nanawa, Copperbell, Castrum, Dzemael, Shposhae, Aurum Vale, and Cutter's Cry independently. Aurum Vale and Cutter's Cry each group their public and private zone-ID variants under the named-zone switch. With the master enabled, an individual zone set to `false` initializes its ordinary doors closed and suppresses proximity opening, providing a staging lock until that zone is ready. Setting the zone to `true` enables automatic proximity open/close. Passage logging works independently of these switches. Disabling the master bypasses managed-door behavior and leaves ordinary doors on their native always-open behavior, except for the explicit permanent locks below.

### Mistbeard permanent door locks (2026-09-12)

Three public Mistbeard Cove doors (zone `131`, layout `111`) have unique `DoorServer`
scripts that return the explicit boolean `startOpen=false`, opt out of proximity
control, and do nothing on spawn. They stay closed with either master setting and
either Mistbeard zone setting. Other doors retain their existing policy.

| Door | Door XYZ | User's nearest logged XYZ | Evidence |
| --- | --- | --- | --- |
| `mistbeard_cove_door_3625` | `-1968.000, -20.000, -1632.000` | `-1969.854, -19.819, -1634.224` | Last movement checkpoint in first supplied log, `17:20:44.208`; about 2.9 yalms from the door. |
| `mistbeard_cove_door_3621` | `-1936.000, -20.000, -1660.000` | `-1935.800, -20.000, -1650.651` | Second supplied log, `17:21:27.774`; about 9.4 yalms from the door. |
| `mistbeard_cove_door_3624` | `-1919.800, -20.000, -1552.000` | `-1909.872, -19.252, -1547.348` | Third supplied log, `17:22:13.395`; about 11.0 yalms from the door. |

These selections use the nearest existing SQL bindings to the logged positions;
client collision at the closed panels still needs an in-game check. Scripts live
under `Data/scripts/unique/sea0Dungeon01/DoorServer/`. Restart Map Server and
re-enter the zone to clear cached eligibility and rebind doors already visible.
No database migration or C# rebuild is required.

### Zahar'ak permanent door lock (2026-09-12)

`zaharak_door_15834` uses the same permanent-lock mechanism: its unique script
returns `startOpen=false`, opts out of automatic proximity control, and leaves
the closed frame unchanged on spawn. The exact binding is **zone 174, layout
405, instance 15834**, SQL spawn row `3121`, at
`(2383.500, 299.090, 1040.750)`, matching the user's `21:37:33.616` passage log.
This door stays closed regardless of the master or Zahar'ak zone door switches.

The script is
`Data/scripts/unique/wil0Field05/DoorServer/zaharak_door_15834.lua`.
Restart Map Server and re-enter the zone so the new unique script is loaded and
the existing actor is rebound. No SQL migration or C# rebuild is required.
Closed-panel collision still needs an in-game check; passage logging remains
independent of the door's open/closed state.

### Shared runtime behavior

`WorldManager.LoadENPCs` also normalizes legacy `5900001` door/gate rows in these zones to `5900015` before constructing actors. This runtime guard keeps an older live database from silently selecting the non-working Limsa route; barriers and Toto-Rak remain excluded.

The dungeon scope includes Dzemael Darkhold (`231`), the Aurum Vale zone variants (`245`, `252`, `253`), and the Cutter's Cry zone variants (`246`, `254`, `255`). Dzemael contributes seven automatic ordinary doors plus five encounter-owned barriers. Aurum Vale contributes two automatic ordinary panels plus five encounter-owned barriers. Cutter's Cry has no ordinary open/close timeline, so its show/hide barriers remain encounter-owned. The private variants stay registered so ordinary bindings inherit the same policy without another C# scope change.

Apply `Data/sql/live migrations/native_dungeon_stronghold_doors.sql` to an existing database while Map Server is stopped, then restart. The migration restores legacy ordinary door/gate rows to `5900015`, corrects the old provisional Mun-Tuy and Copperbell positions, and inserts the 40 newly recovered bindings. The full spawn SQL seeds the same data for clean databases. Rows containing `barrier` remain content owned.

Some unique DoorServer scripts still return the recovered `startOpen=true` flag. The Map Server overrides that script-bind argument to `false` for eligible automatic doors, so even unique scripts initialize closed without sending a visible close animation during streaming.

- Enter 7 yalms: send `open` once through the proven DoorServer BG animation path.
- Remain within 10 yalms: hold the shared state open without repeating the callback.
- Clear 10 yalms for 2.5 seconds: send `clos` once.
- Scan cadence: 250 milliseconds. A late-joining client receives `open` only when the shared door is already open; a closed door keeps its script-bind initial frame.

Toto-Rak zone `159` remains outside this automatic-door and passage-reporting scope. Encounter barriers retain their director logic.

Live test after rebuilding and restarting the Map Server:

```text
1. Approach a converted door normally. Confirm it starts closed and opens within 7 yalms.
2. Walk beyond 10 yalms. Confirm it closes after about 2.5 seconds.
3. Repeat with another player; the shared state must remain open until everyone clears 10 yalms.
```

Run `dotnet run --project tools/world-door-proximity-tests/WorldDoorProximityTests.csproj` for the state-machine and Lua-load contract.

### Door Passage Logging

The 1.x client does not send a dedicated "walked through door" event. After an accepted movement update passes boundary and object-collision checks, `Session` therefore infers a traversal from the authoritative previous/current player coordinates and the exact SQL door position.

Passage logging runs in the supported door zones regardless of the world-door
master or per-zone opening switches. Bound `DoorServer` and legacy `DoorStandard`
door/gate actors are observed, including the three explicit Mistbeard locks;
unbound actors and encounter barriers are excluded. This does not change whether
a door opens or whether movement through it is allowed.

A passage is logged only when the route:

- enters a 5.5-yalm observation volume,
- comes within 3 yalms of the door center corridor,
- exits on the opposite side within 12 seconds, and
- does not contain a movement segment longer than 20 yalms.

Approaching and backing away, walking alongside the doorway, vertical overlap on another floor, and teleport-sized movement do not count. Each player/door pair has a two-second log debounce. Passage detection is independent of animation transport and does not claim the client's panel state. Toto-Rak remains outside this scope.

Example `map.log`/Map Server console entry:

```text
[door] CROSSED door=3624 code=131:111:3624 player=Example Player unique=mistbeard_cove_door_3624 actor=0x44180008 at=(-1919.800,-20.000,-1552.000) from=(-1919.800,-20.000,-1558.000) to=(-1919.800,-20.000,-1546.000)
```

`door` is the client instance number. `code` is `zone:layout:instance`, so it
identifies the binding even when another map reuses the door number. `at` is the
door's stored XYZ; `from` and `to` are the accepted movement segment. Search the
Map Server log for `[door]`, and paste that line when requesting another lock.
This diagnostic change requires rebuilding and restarting Map Server.

## Intentional Exclusions and Entrance Gates

Entrance aetheryte gates and encounter barriers are separate from ordinary interior doors. They are not converted to player-proximity behavior.

| Dungeon | Gate actor | Gate rows | Outside zone | Inside zone | Layout | Client evidence | Status |
| --- | ---: | --- | ---: | ---: | ---: | --- | --- |
| Copperbell Mines | `1280054` | `771`, `2923` | `172` | `178` | `414` | Eleven ordinary open/close placements plus a separate show/hide barrier family. | All eleven ordinary doors are bound. Keep the aetheryte gates and show/hide barrier content-owned. |
| Tam-Tara Deepcroft | `1280083` | `797`, `2924` | `150` | `158` | `312` | Thirteen live-confirmed interior open/close objects. | All thirteen ordinary doors are bound; the entrance aetheryte gates remain untouched. |
| U'Ghamaro Mines | none | none | n/a | `137` | `116` | Complete 22-object compiled family. | All 22 are bound and automatic. |
| Shposhae | none | none | n/a | `235` | `112` | Complete 12-object compiled open/close family. | All 12 are bound and automatic. |
| Mistbeard Cove | `1280018` | `748` | unknown | `131` | `111` | Eleven interior open/close placements plus a separate retail-sealed instance boundary. | Interior doors are automatic; the sealed entrance boundary remains untouched. |
| Cassiopeia Hollow | `1280020` | `749` | unknown | `132` | `113` | No compiled ordinary door timeline; shell/ball prop animation only. | No automatic door rows are created. |
| Cutter's Cry | n/a | n/a | n/a | `246` | `413` | Five show/hide barrier placements; no ordinary open/close timeline. | Barriers remain encounter-owned. |

Future additions must be owned by a compiled door open/close timeline or be confirmed against the exact doorway in game.

## Probe Commands

Single candidate:

```text
!spawnbgobj <layoutId> <instanceId> <actorClassId> open
```

Candidate range:

```text
!testmapobj open <layoutId> <firstInstanceId> <lastInstanceId> <actorClassId> [delaySeconds]
```

Matrix probe for a sparse candidate list or range:

```text
!testmapobjmatrix <layoutId> <instanceIdsOrRanges> <actorClassIds> <animations> [delaySeconds]
```

Tam-Tara interior probe branches:

```text
!testtamtaradoors tableopen 0.25
!testtamtaradoors tableboth 0.25
!testtamtaratriggers eventtable open
!clearpinmapobj
!testtamtaradoors forestrootopen 0.25
!testtamtaradoors foreststatic 0.25
!testtamtaradoors forestrootchildrenopen 0.1
!testtamtaradoors forest 0.25
!testtamtaradoors forestopen 0.25
!testtamtaradoors forestchildren 0.25
!testtamtaradoors forestchildrenopen 0.25
!testtamtaradoors copied 0.25
!testtamtaradoors direct 0.25
!testtamtaratriggers push
!testtamtaratriggers event
!testtamtaratriggers forest open
!testtamtaratriggers copied open
!testtamtaratriggers direct hide
!testtamtaratriggers eventforest open
!testtamtaratriggers eventcopied open
!testtamtaratriggers eventdirect hide
!testtamtaratriggers single 2815 5900015 open
!testtamtaratriggers single 2815 5900015 1bJVzT
!testtamtaratriggers single 2819 5900015 1BzYi6
!testtamtaratriggers cleanup
```

State/substate probe for a bound candidate that does not respond to normal BG animations:

```text
!testmapobjstate <layoutId> <instanceIdsOrRanges> <actorClassIds> <mainStates> <subModes> <motionPacks> [animation] [delaySeconds]
```

Use `none` for the animation argument when the state/substate change itself is the test.

Push-box probe for a baked event trigger box:

```text
!testpushbox <layoutId> <instanceIdsOrRanges> [actorClassId] [conditionName] [reactName] [silent] [outwards]
```

Raw actor-class visual probe:

```text
!testactorclass <startActorClassId> [endActorClassId] [spacing] [columns]
```

`PlayBGAnimation` currently sends the first 8 ASCII bytes of the animation name. Long DAT asset script names are useful clues for locating door groups, but the packet cannot currently send those full names. For groups that only expose long SCI names, also test the DAT `#file` short key and its 8-byte prefix, such as `2a5WDH` and `2a5WDH_c`.

Suggested sweeps:

```text
!testmapobj open 311 3160 3173 5900016
!testmapobj open 414 2653 2653 5900015
!testmapobj open 414 2655 2655 5900015
!testmapobj open 414 2656 2656 5900015
!testmapobj open 414 2657 2657 5900015
!testmapobj open 414 2659 2660 5900015
!testmapobj open 414 2652 2652 5900015
!testmapobj open 414 2654 2654 5900015
!testmapobj open 414 2657 2660 5900015
!testtamtaradoors tableopen 0.25
!testtamtaradoors tableboth 0.25
!testtamtaratriggers eventtable open
!testtamtaradoors forestrootopen 0.25
!testtamtaradoors foreststatic 0.25
!testtamtaradoors forestrootchildrenopen 0.1
!testtamtaradoors forest 0.25
!testtamtaradoors forestopen 0.25
!testtamtaradoors forestchildren 0.25
!testtamtaradoors forestchildrenopen 0.25
!testtamtaratriggers eventforest open
!testmapobj stt0 312 16668 16674 5900001 1
!testmapobj end0 312 16668 16674 5900001 1
!testmapobj stt0 312 9346001 9346003 5900001 1
!testmapobj end0 312 9346001 9346003 5900001 1
!testmapobjlist open 312 2815006,2814004,2835005,2818003,3313001,2693001,2837002,2816007,2856002,3327002,3332002,3324002 5900015 1
!testmapobjlist open 312 2815006,2814004,2835005,2818003,3313001,2693001,2837002,2816007,2856002,3327002,3332002,3324002 5900001 1
!testmapobj open 116 488 488 5900015
!testmapobj open 116 494 494 5900015
!testmapobj open 116 487 487 5900015
!testmapobj open 116 501 501 5900015
!testmapobj open 116 1095 1095 5900015
!testmapobj open 116 1315 1315 5900015
!testmapobj open 116 1333 1333 5900015
!testmapobj open 116 1585 1585 5900015
```

Watch for the printed instance line that matches the visible door movement.

Tam-Tara test notes:

- `1280083` is the aetherial node/gate zone-change actor. It should stay wired for `150 <-> 158`, but it is separate from the wooden physical door panels.
- Before letting other players into a zone used for door probing, run `!clearpinmapobj` or `!testtamtaratriggers cleanup` in that zone. These commands end the current event and despawn pinned/test BG objects, Tam-Tara trigger probes, generic map-object probes, push/event-door probes, and raw actor-class probes from the current area. A map-server restart also clears all runtime probe actors.
- `fst0Dungeon02` is the Tam-Tara Deepcroft inside zone script root. The inside zone is `158`, and `_layout.csv` maps Tam-Tara place `2113` to layout `312`.
- The map-object table has live-confirmed exact layout `312` Door objects:
  `3598`, `3599`, `3600`, `3601`, `3602`, `3603`, `3604`, `3605`, `3606`, `3607`, `3608`, `3609`, and `3649`.
  `data\29\B0\00\09.DAT` places those ids beside `sgrp_bg_d2_door_a1`, `sgrp_bg_d2_door_b1`, `sgrp_bg_d2_door_c1`, `sgrp_bg_d2_door_a2`, and literal `open`/`clos` tokens.
- Confirmed exact-table probes:
  `!testtamtaradoors tableopen 0.25`
  `!testtamtaradoors tableboth 0.25`
  persistent visual check: `!pinmapobj 312 3598-3609,3649 5900015 open false`
  alternate actor classes if needed: rerun the persistent check with `5900016` and then `5900001`.
  cleanup persistent pins between attempts with `!clearpinmapobj`.
  event-driven check: `!testtamtaratriggers eventtable open`.
- Promotion rule: keep the existing main entrance/aetherial-node rows untouched. Use row `2931` for the first permanent Tam-Tara interior door and safe new row IDs `2945+` for the remaining confirmed table doors. For each row, use inside zone `158`, layout `312`, the confirmed instance ID, and the script folder implied by the successful actor class.
- Important DAT correction: `data\29\D9\00\09.DAT` is rooted as `sea_s0_dun02`, so the old `3324`/`3679..3690` candidates were plausible-looking but wrong for Tam-Tara. The current forest candidate is `data\29\AB\00\04.DAT`, which references `../vins/fst_f0_dun05.win32.vinsbin`.
- Historical root-layout forest probe: `!testtamtaradoors forestrootopen 0.25` tests the door-bearing groups placed by `data\29\B0\00\0C.DAT` root `fst_f0_dun05`: `2815`, `2817`, `2819`, `2821`, `2824`, `2826`, `2834`, `2836`, `2838`, `2846`, `2848`, `2850`, `2853`, `2855`, `2857`, `2861`, `2931`, `2934`, and `2955`.
- If revisiting the forest lead, try `!testtamtaradoors foreststatic 0.25` for the static-looking `f0d0_ba_dor2` groups (`2848`, `2861`, `2955`), then `!testtamtaradoors forestrootchildrenopen 0.1` for the exact copied children the root layout places.
- The older `forestopen` / `forestchildrenopen` modes only covered the first narrow `2815`/`2819` resource lead and failed in live testing.
- Earlier partial tests against `312 / 3598`, `312 / 3599`, and `312 / 3649` with `5900015` were inconclusive/failed before the full table pass. The live-confirmed result for `3598..3609` and `3649` supersedes that older note.
- `8002 / 27029..27031` with `5900015` using `open` and `hide`: failed in game.
- `312 / 2600..2699` with `5900015` using `open`: failed in game.
- `8002 / 16668..16674` and `8002 / 16765..16797` with `5900001` using `open`: failed in game.
- `312 / 3679..3690` with `5900015` using `open`: failed in game.
- `312 / 3692..3696` with `5900015`/`5900001` using `open`: failed in game.
- `8002 / 16668..16674` and `8002 / 16765..16797` with `5900015` and `5900016` using `open`: failed in game.
- `8002 / 16668..16674` and `8002 / 9346001..9346003` with `5900001` using `stt0` and `end0`: failed in game.
- `312 / 3679..3690` with `5900001` and `5900016` using `open`: failed in game.
- The sparse copied-ref list `2815006,2814004,2835005,2818003,3313001,2693001,2837002,2816007,2856002,3327002,3332002,3324002` with layout `312` and actor classes `5900015`/`5900001` using `open`: failed in game.
- `!testactorclass 1200200 1200208 3 3` spawned photocells in front of the door; rejected for Tam-Tara.
- `312 / 16668..16674` with `5900006` using `open`, `stt0`, and `end0`: failed in game.
- `ObjectEventDoor` actor classes `1090097..1090101`: failed in game, nothing targetable/usable.
- `ObjectEventDoor` actor classes `1090114..1090123`: spawned `1090114`, `1090118`, `1090119`, `1090120`, `1090121`, and `1090123`; no useful Tam-Tara door result reported.
- Retail-behavior clue: players likely walked up and used a menu action labeled `Door`. Added `!testeventdoor` to spawn ObjectEventDoor actors with talk/notice/push conditions explicitly enabled, because raw `!testactorclass` can leave the interaction disabled. After rebuilding/restarting the map server, test `!testeventdoor 1090098,1090099,1090114,1090118-1090121,1090131,1090145,1090159,1090162 2 1.5 4 pushDefault`, then try targeting the spawned actors and walking into the door area.
- The screenshot door is a normal wooden door, so `5900001` / `DoorStandard` remains worth testing alongside the dungeon `DoorServer` classes.
- `8002` is probably not the correct layout for this door. The aetheryte sheet row `1280083,2113,...` and `_layout.csv` row `312,,2,2600,2113` point back to layout `312`.
- Fresh DAT clue: `data\29\B0\00\07.DAT` root `fst_f0_fld05` has `sgrp_bg_door_air1`, `sgrp_bg_door_air2`, local token `stt0`, `LayCollisionOnOffClip`, `LayTransformClip`, direct `isgrp_016668..016674`, and copied refs `Bk_isgrp_009346-002/-003`.
- Rejected inside-DAT clue: `data\29\D9\00\09.DAT` has `sgrp_bg_d2_door_b1`, `sgrp_bg_d2_door_c0`, `sgrp_bg_d2_door_c1`, `open`/`clos`, `LayCollisionOnOffClip`, `LayTransformClip`, direct `isgrp_003679..003690`, and immediate pre-`door_b1` copied refs, but its root is `sea_s0_dun02`; keep it as failed-history only.
- Current forest DAT clue: `data\29\AB\00\04.DAT` has `Bk_isgrp_002815` with `f0d0_bc_dor1b_h`/`f0d0_bc_dor1a_h` and SCI keys `1bJVzT`/`3SgOYM`, plus `Bk_isgrp_002819` with `f0d0_bc_dor3b_h`/`f0d0_bc_dor3a_h` and SCI keys `1BzYi6`/`4l3mD2`.
- In-zone proximity clue: tester found the pictured Tam-Tara door opens by walking close to it, not by the nearby teleporter. The live-confirmed table IDs above are the separate BG map-object binding for the physical interior doors; the aetherial node remains only the zone-change owner.
- Normal `3324` controller-style probes failed in game at the pictured inside door: `312 / 3324` with `5900001` and `5900016` using `open`, plus copied `312 / 3324001` and `3324002` with `5900015` using `open`. The former staged row `2931` used `5900015 / 312 / 3324 / open`; `!checkdoor2931` proved the actor spawned/bound/replayed open, but the visible door still did not move or clear collision. Row `2931` is now inactive until promoted with one of the confirmed table IDs.
- Rejected sea_s0_dun02 DAT mine found copied `Bk_isgrp_003324-001` through `Bk_isgrp_003324-010`, not only `-001/-002`; those `3324001..3324010` copied children did not move the Tam-Tara door and should stay failed-history.
- Rejected sea_s0_dun02 DAT mine found trigger copied refs `Bk_isgrp_002834-001` through `Bk_isgrp_002834-014`; keep them only as context for the failed trigger-box branch.
- `time_door_b1_open`, `time_door_c0_open`, and `time_door_c1_open` are long timeline asset names with `LayTransformClip` and `LayCollisionOnOffClip`. Current `PlayBGAnimation` only sends 8 bytes, so treat those as ownership clues unless the BG animation packet is expanded later.
- Client safety note: after missing-script map objects were allowed to bind with a default map-object tuple, `5900026` / `MapObjOneWayDoor` crashed the client in both broad matrix and single forced-bind probes. Do not use map-object binds for `5900026..5900028`; the GM map-object probe commands now refuse those actor classes.
- Historical outside layout-corrected animation/copied-ref probes: `!testmapobj stt0 312 16668 16674 5900001 1`, `!testmapobj end0 312 16668 16674 5900001 1`, `!testmapobj stt0 312 9346001 9346003 5900001 1`, then `!testmapobj end0 312 9346001 9346003 5900001 1`.
- `!testtamtaradoors copied 0.25` and `!testtamtaradoors direct 0.25` both failed in game and are now known to be Sea dungeon probes. The confirmed interior path is the layout `312` table IDs `3598..3609` and `3649`.
- `Map Server/Actors/Actor.cs` now exposes the missing Lua helpers used by `!testpushbox` and `!testeventdoor`: `BindPushBoxEventCondition(...)` and `BindDoorInteractionEventConditions(...)`.
- `!testtamtaratriggers event` with the original stock `ObjectEventDoor` script produced the wrong client prompt: `Move from this area?`. That proves the event condition can fire, but it is not the door-open behavior. The command now uses unique `test_tamtara_triggerdoor.lua` scripts under both `fst0Dungeon02/ObjectEventDoor/` and `fst0Field01/ObjectEventDoor/` so trigger events report, replay linked BG animations when present, and end without `eventDoorMoveAsk`.
- If `Move from this area?` still appears, run `!testtamtaratriggers cleanup` first; earlier probe actors used unique IDs like `test_tamtara_eventdoor_*` and can steal targeting from the newer fixed script actors.
- `!testtamtaratriggers push`, `copied open`, and `direct hide` bind successfully but still do not fire the copied `2834001..2834014` trigger boxes in game.
- Historical inside Deepcroft event fallback: use the known-firing ObjectEventDoor interaction as the trigger owner and link it to the forest BG candidates with `!testtamtaratriggers eventforest open`; if needed, try `!testtamtaratriggers single 2815 5900015 1bJVzT` and `!testtamtaratriggers single 2819 5900015 1BzYi6`.
- If broad linked probes make the player unable to move, run `!testtamtaratriggers cleanup`. The linked probe now spawns temporary BG targets off to the side, but single-target probes are still better for follow-up checks.
- Cross-zone DAT/repo comparison does not support treating Tam-Tara as a special door system. Tam-Tara, Copperbell, Nanawa, Mun-Tuy, Toto-Rak, U'Ghamaro, and Aurum Vale expose the same broad DAT ingredients: `sgrp_bg_*door*`, `time_*door*`, `Bk_isgrp_*` copied groups, `LayTransformClip`, and `LayCollisionOnOffClip`; Dzemael uses the same server-row/map-object binding pattern in this repo. Copperbell also has copied-looking DAT children, but the confirmed live rows use direct shorter instance IDs. The Tam-Tara result matches that pattern: the correct tuple came from the direct layout `312` door table, not from a special packet path.
- The previous `312 / 2697..2699` lead came from `data\29\DF\00\01.DAT` root `sea_s0_dun02` and should not be treated as the Tam-Tara entrance door.
- Row `2931` is reserved inactive with `zoneId = 0` for the first permanent Tam-Tara interior door. Fill it with the confirmed actor class, one of the table instance IDs, map-object binding, script filename, and script tuple; use `2945+` for additional confirmed interior doors because `2932+` are already occupied.

Mun-Tuy test notes:

- `311 / 3160`, `3161`, `3164..3169`, `3172`, and `3173` with `5900016`: directly confirmed in game as Mun-Tuy doors.
- `311 / 3162`, `3163`, `3170`, and `3171` with `5900016`: staged as inferred members of the same contiguous `3160..3173` door family.
- Old staged candidates `311 / 3156` and `311 / 3225` with `5900015` did not work and were replaced.
- Rows `2919`, `2922`, and `2933..2944` currently use provisional server actor positions. Replace them with local `!mypos` captures at each confirmed doorway when available.

Mistbeard test notes:

- `data\29\DF\00\00.DAT` is the Mistbeard root candidate; it references `../vins/sea_s0_dun01.win32.vinsbin`.
- DAT door-related groups:
  - `Bk_isgrp_000901`, `000934`, `000935`: `s0d1_pris_dor_h`, `_coastrouya_open/_close` (`_coastro` packet token).
  - `Bk_isgrp_000944`, `000953`: `s0d1_p_door1_h`, `_coasttokushu_open/_close` (`_coastto` packet token).
  - `Bk_isgrp_000945`, `001052`: `s0d1_p_door3_h`, `_coasttsuuro_open/_close` (`_coastts` packet token).
  - `Bk_isgrp_000968`: `s0d1_pt_dor_h`, `_coastminato_saku_open/_close` (`_coastmi` packet token).
  - `Bk_isgrp_001120`, `001121`: `s0d1_p_door4_h`, `_coastseisan_open/_close` (`_coastse` packet token); `001120` also includes `s0d1_p_door1_h` with `_coasttokushu`.
- Initial Mistbeard probe pass against layout `111` and the `944`/`945`/`999` clue path found no door movement.
- `111 / 944`, `945`, and `999` with `5900015`/`5900016` using `hide`: failed in game.
- Copied-group probes `111 / 944001..944010`, `945001..945010`, and `999001..999010` with `5900015` using `hide`: failed in game at the large Mistbeard double gate.
- Zone/layout sanity confirmed at the large double gate: player was in zone `131`, and Mistbeard layout is still `111`.
- DAT script-token probes against the direct groups produced no movement at the large double gate. Screenshot-confirmed failures include `_coastmi 111 / 968 / 5900001` and direct-group token probes with `5900015` against `944`, `953`, `1120`, `945`, `1052`, `1121`, `901`, `934`, `935`, and `968`; tester reported still nothing.
- Normal packet animation/actor-class matrix against the strongest direct binding failed: `!testmapobjmatrix 111 968 5900001,5900015,5900016,5900006,5900007,5900026 open,hide,show 2`.
- Normal packet animation/actor-class matrix against the other direct door-like groups failed: `!testmapobjmatrix 111 901,934,935,944,945,953,1052,1120,1121 5900001,5900015,5900016 open,hide,show 1`.
- Deeper copied/high-group sanity pass failed in game with no movement:
  - `!testmapobjmatrix 111 1122-1151 5900001,5900015,5900016 open,hide,show 0.25`
  - `!testmapobjmatrix 111 2479-2498 5900001,5900015,5900016 open,hide,show 0.25`
  - `!testmapobjmatrix 111 3599-3605,3629,3631,3633,3635,3639,3765 5900001,5900015,5900016 open,hide,show 0.25`
- State/substate probes against the strongest DAT group failed in game:
  - `!testmapobjstate 111 968 5900001,5900015,5900016 0 0-5 0-10 none 0.25`
  - `!testmapobjstate 111 968 5900006,5900007,5900026 0 0-5 0-10 none 0.25`
  - `!testmapobjstate 111 968 5900015 1-3 0-3 0-10 none 0.25`
- DAT `#file` short-key animation probes also failed at the large double gate. Copperbell worked with plain `open`, but Mistbeard and Tam-Tara expose long SCI names; this branch tested the short hash key/prefix and still produced no movement:
  - `!testmapobjmatrix 111 968,3639 5900001,5900015,5900016,5900006,5900007,5900026 2a5WDH,2a5WDH_c,0lffsg,0lffsg_c,3ORKAW,3ORKAW_c,1xvEtP,1xvEtP_c,49yMfw,49yMfw_c,1zzT6W,1zzT6W_c 0.5`
  - `!testmapobjmatrix 111 901,934,935 5900001,5900015,5900016 3Y2Uxy,3Y2Uxy_c,0FR5SO,0FR5SO_c 0.5`
  - `!testmapobjmatrix 111 944,945,953,1052,1120,1121 5900001,5900015,5900016 0Ox7D4,0Ox7D4_c,1ATbGh,1ATbGh_c,4prNRr,4prNRr_c,0zlLek,0zlLek_c,4b8IZ2,4b8IZ2_c,3eGcX1,3eGcX1_c 0.5`
- User clarification: the visible Mistbeard large gate never opened in the original game context; it stayed sealed and separated an open-world area from a closed/other instance. Treat this as an intentional sealed instance boundary rather than a missing normal door binding.
- `data\29\DF\00\00.DAT` still contains `Bk_itgbx_000004`, a baked trigger box near the `003639` minato lever/floor block, but this is no longer a live-test priority for the current door pass.
- Initial event test `!testpushbox 111 4 1090098` did not fire at the large gate.
- Paused event tests:
  - `!testpushbox 111 1-20 1090098 pushDefault - false false`
  - `!testpushbox 111 1-20 1090098 in dtwi false false`
  - Walk through/around the large gate after spawning the range and watch the map-server console for `Event START`, or for any client prompt.
- Mistbeard is paused as of 2026-06-04. Do not spend more live-testing time here for normal open-world door binding unless a separate, visibly openable door is found.
- Keep Mistbeard at zero confirmed door bindings unless a separate, visibly openable door is found and confirmed to move or clear collision.

Copperbell test notes:

- `414 / 281` with `5900015` and `5900001`: no movement.
- `414 / 2643..2645` with `5900015`, `5900001`, and `5900016`: no movement with `open` or plain `hide` at the Copperbell closed door around `X=-44.475, Y=107.607, Z=143.020`.
- `414 / 2652..2654` with `5900015`: user reported one of the three opened the door during the sweep.
- `414 / 2653` with `5900015`: confirmed in game as the Copperbell entrance door.
- `414 / 2655` with `5900015`: confirmed in game as another Copperbell door.
- `414 / 2656` with `5900015`: confirmed in game as another Copperbell door.
- `414 / 2657` with `5900015`: confirmed in game as another Copperbell door.
- `414 / 2659..2660` with `5900015`: confirmed in game as a paired Copperbell doorway.
- `414 / 2661` with `5900015`: initially suspected, then rejected by tester; do not promote unless re-confirmed one-by-one.
- `0C.DAT` shows real door resources `sgrp_bg_d4_door_a1`, `a2`, `a3`, `b1`, and `c1`; `isgrp_002653`, `isgrp_002655`, `isgrp_002656`, `isgrp_002657`, `isgrp_002659`, and `isgrp_002660` are confirmed door bindings. The `c1` resource has `show`/`hide` tracks and likely maps to `Bk_isgrp_002643` or `isgrp_002645`.
- Remaining Copperbell door candidates should be tested at each closed doorway: `2652`, `2654`, and `2658` with `5900015`; retry with `5900016` only if a visible door/barrier does not respond.
- Rows `2926..2930` currently use the Copperbell inside-gate position as provisional server actor positions. Replace them with local `!mypos` captures at each confirmed doorway when available.
- The `c1` string table contains copied groups `Bk_isgrp_002643-001..010`; the next Copperbell copied-group sanity check should use suffix-encoded instance IDs:

```text
!testmapobj hide 414 2643001 2643010 5900015
!testmapobj hide 414 2643001 2643010 5900001
!testmapobj hide 414 2643001 2643010 5900016
```

## Implementation Checklist

1. Stand at the target doorway and capture `!mypos`.
2. Mine the client DAT for door labels and nearby `isgrp_######` names.
3. Probe candidates with `!testmapobj`, `!spawnbgobj`, or `!testactorclass`.
4. Confirm the exact actor class and instance by watching the real door move or collision clear.
5. Add one spawn row per confirmed door object.
6. Add one matching `server_eventnpc_mapobj` row per spawn row only for confirmed map-object doors; actor-class object/barrier rows are spawn-only until a map-object binding is proven.
7. Put the unique Lua script under the actor class folder that matches the SQL class.
8. Return the confirmed `(layoutId, instanceId, true)` from `init`.
9. Use `PlayMapObjAnimation(player, "open")` only after correct binding.
10. Apply the SQL to the live database and restart the map server. `!reloadzone` does not reload NPCs from DB.

Current automated coverage contract: run `python tools/validate_world_door_coverage.py`. It must report `130` complete bindings and zero failures before door SQL changes are handed off.

## Gate Zone Changes

The aetherial gate zone change and the physical door are separate pieces.

Nanawa, Copperbell, Mun-Tuy, and Tam-Tara are wired through `AetheryteChild.lua` using the gate actor class as the key. Exterior interaction enters the dungeon immediately. Interior interaction first asks the native **Leave this place?** question; answering No retains the usable child-aetheryte menu instead of ejecting the player merely for talking to the node:

| Gate actor | Outside -> inside | Inside -> outside |
| ---: | --- | --- |
| `1280052` | `170 -> 176` | `176 -> 170` |
| `1280054` | `172 -> 178` | `178 -> 172` |
| `1280082` | `152 -> 157` | `157 -> 152` |
| `1280083` | `150 -> 158` | `158 -> 150` |

The old Copperbell and Tam-Tara gate rows were disabled with `zoneId = 0`. They are now enabled as outside rows, with matching inside exit rows:

```sql
(771, 1280054, 'copperbellmines_aetherytegate', 172, '', 0, -621, 112, -118, 0, 0)
(2923, 1280054, 'copperbellmines_aetherytegate_exit', 178, '', 0, -620.374, 110.429, -113.903, 0, 0)
(2925, 5900015, 'copperbell_mines_door_entrance_2653', 178, '', 0, -620.374, 110.429, -113.903, 0, 0)
(2926, 5900015, 'copperbell_mines_door_2655', 178, '', 0, -620.374, 110.429, -113.903, 0, 0)
(2927, 5900015, 'copperbell_mines_door_2656', 178, '', 0, -620.374, 110.429, -113.903, 0, 0)
(2928, 5900015, 'copperbell_mines_door_2659', 178, '', 0, -620.374, 110.429, -113.903, 0, 0)
(2929, 5900015, 'copperbell_mines_door_2660', 178, '', 0, -620.374, 110.429, -113.903, 0, 0)
(2930, 5900015, 'copperbell_mines_door_2657', 178, '', 0, -620.374, 110.429, -113.903, 0, 0)
(797, 1280083, 'tamtaradeeprcroft_aetherytegate', 150, '', 0, 313, -35, -171, 0, 0)
(2924, 1280083, 'tamtaradeeprcroft_aetherytegate_exit', 158, '', 0, 314.801, -36.2, -167.843, 0, 0)
(2931, 5900015, 'tam_tara_deepcroft_door_reserved', 0, '', 0, 304.139, -36, -185.967, 3.054, 0)
(2932, 1500043, 'tam_tara_battlewarden', 158, '', 0, 307.5, -35, -176, 0.75, 0)
```

The main `Data/sql/server_eventnpc_spawn_locations.sql` contains all four
exterior/interior gate pairs and the corrected Nanawa, Mun-Tuy, and Tam-Tara
Battlewarden zone ownership with their stable spawn IDs. Use the normal main
SQL import workflow, then restart Map Server to reload event NPCs.

Mistbeard Cove and Cassiopeia Hollow already have inside gate rows (`748`, `749`) and aetheryte-child table entries. They do not yet have confirmed outside physical gate positions in SQL.

## Battlewarden Coverage

The battlewarden spawn list is driven by the C# `BehestManager` site table. Every battlewarden actor class currently registered there has a matching SQL spawn row.

Dungeon-adjacent battlewarden sites currently known to the server:

| Site | Actor class | Zone | Spawn row |
| --- | ---: | ---: | ---: |
| Cassiopeia Hollow | `1500021` | `132` | `2897` |
| Nanawa Mines | `1500031` | `176` | `2901` |
| Mun-Tuy Cellars | `1500042` | `157` | `2907` |
| Tam-Tara Deepcroft | `1500043` | `158` | `2932` |
| Halatali | `1500028` | `171` | `2900` |
| Nophica's Wells | `1500029` | `172` | `2440` |
| Horizon's Edge | `1500025` | `172` | `2400` |
| Bentbranch | `1500034` | `150` | `2902` |
| Tranquil | `1500038` | `154` | `980` |

Tam-Tara now has a dedicated `BehestManager` site using actor `1500043` and a narrow locality/quest-derived Sabletooth Spriggan pool. Copperbell still has no dedicated battlewarden site in `BehestManager`.

## Live DB Patch Notes

Editing the SQL files is not enough for a running server. The map server loads event NPCs from MySQL at startup:

```text
server_eventnpc_spawn_locations
LEFT JOIN server_eventnpc_mapobj
```

After changing door rows, apply the SQL to the live `ffxiv_server` database and restart the map server. The current `ReloadZone` implementation does not call `LoadNPCs`, so it will not pick up new door rows by itself.

## 2026-06-21 Active vs Recovered Parity

| Family | Local evidence | Recovered parity status |
| --- | --- | --- |
| Dungeon doors/barriers | Spawn rows and BG-bound map objects exist for U'Ghamaro, Dzemael, AV, and Toto-Rak. | Treat as simple BG-bound placement/animation until recovered `DoorStandard` reaction/timer and `DoorServer` scheduler behavior is mirrored. |
| Toto-Rak lights/barriers/posters | Local scripts drive visible object state and tie into Toto-Rak instance/HUD plumbing. | Strongest local dungeon-object lane, but still not proof for unrelated dungeon doors. |
| `GimmickTerminal`/`GimmickWarp` family | Local prompt scripts exist. | Meaningful only after actor binding/config route is proven; do not infer transporter parity from file presence. |
| `BeaconFortGateGimmick` | Local file exists. | Status/scheduler methods are shell-level; recovered scheduler remains missing locally. |
| `MapObjOneWayDoor` | Local GM helpers refuse unsafe forced binds. | Recovered-only and locally blocked because forced binds can crash the client. |
| Lifts | Active city-travel object scripts and spawn rows. | Not dungeon-door proof. |
