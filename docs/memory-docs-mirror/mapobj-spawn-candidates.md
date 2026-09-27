# Map Object Spawn Candidates

Use these with the GM map-object preview command:

```text
!spawnbgobj <layoutId> <instanceId> [actorClassId] [animation] [forceMissingScriptBind]
!spawnbgobj list [zoneId]
!spawnbgobj placed <spawnLocationId> [actorClassId] [animation] [here|force]
!spawnbgobj row <actorClassIdFromActorclassMapObj> [actorClassId] [animation] [forceMissingScriptBind]
!spawnbgobj actorclass <actorClassIdFromActorclassMapObj> [animation] [forceMissingScriptBind]
```

For visual testing, prefer `list` and `placed` first. These are backed by the server's placed map-object rows and are zone checked:

```text
!spawnbgobj list
!spawnbgobj list 230
!spawnbgobj placed 497 open
!spawnbgobj placed 497 open here
```

`placed` mode uses rows joined from `server_eventnpc_spawn_locations.sql` and `server_eventnpc_mapobj.sql`. If you are in the wrong zone, the command refuses the spawn and prints a `!pos <zoneId> <x> <y> <z>` hint. Use the optional `here` flag only when you deliberately want to bind the object controller at your current position instead of its recovered placement.

`row` mode is speculative. It looks up the DAT `actorclass_mapObj` layout/instance pair and spawns it with the default map-object actor class `5900001`, unless an actor class override is supplied. These layout/instance pairs are not portable model IDs, so they may spawn an invisible controller unless the current zone has the matching baked layout object loaded. `actorclass` mode uses the DAT actor class itself, which is useful when the server has that actor class and its script behavior matters.

## What This Covers

`actorclass_mapObj.csv` has 158 rows. Of those, 106 rows carry a nonzero `layoutId`/`instanceId` pair that the client can try to bind through `SetActorBGProperties`.

The server placed-object join currently gives 209 zone-aware rows. These are the best candidates for immediate in-game testing because each row has an actor class, zone, position, layout ID, and instance ID.

This is not the full open-world building/prop inventory. Big static buildings, terrain pieces, and many world boxes/fixtures are likely in zone layout/model DAT chunks, not in `chara/bgobj` and not fully represented by `actorclass_mapObj.csv`. Recovering those needs a zone layout DAT extractor or a format-aware index pass over `data/**/*.DAT`.

## Placed Row Examples

| Zone | Spawn rows | Notes |
| --- | --- | --- |
| `133` | `2722`, `3034` | Limsa intro blocker, airship ship port |
| `155` | `589`, `590`, `871` | Gridania ship port and gate |
| `175` | `143..146`, `2893..2894` | Ul'dah adventurers' guild and quest doors |
| `181` | `2166..2169` | Merchant ward doors/deco/flag |
| `206` | `552`, `564`, `621..627`, `1126`, `1152`, `1167`, `2317` | Gridania guild/shop doors |
| `209` | `279..287`, `630`, `2047` | Ul'dah guild doors/ship port |
| `230` | `468..500`, `2031..2032` | Limsa guild/shop/market doors and ship port |

In game, `!spawnbgobj list` is safer than reading this table because it uses your current zone.

## Known DAT Rows

| Source actorClassId(s) | Server class path | Layout/instance signal | Test command |
| --- | --- | --- | --- |
| `1080078` | `/Chara/Npc/MapObj/MapObjStandard` | `layoutId=303`, `instanceId=10405` | `!spawnbgobj row 1080078` |
| `1080079` | `/Chara/Npc/MapObj/MapObjStandard` | `layoutId=301`, `instanceId=12386` | `!spawnbgobj row 1080079` |
| `1080080` | `/Chara/Npc/MapObj/MapObjStandard` | `layoutId=301`, `instanceId=12391` | `!spawnbgobj row 1080080` |
| `5000001..5000010` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5001`, `instanceId=464..473` | `!spawnbgobj row 5000001` |
| `5000011..5000020` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5011`, `instanceId=36..45` | `!spawnbgobj row 5000011` |
| `5000021..5000030` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5021`, `instanceId=220..229` | `!spawnbgobj row 5000021` |
| `5000031..5000040` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5007`, `instanceId=36..45` | `!spawnbgobj row 5000031` |
| `5000041..5000050` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5008`, `instanceId=220..229` | `!spawnbgobj row 5000041` |
| `5000051..5000060` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5016`, `instanceId=464..473` | `!spawnbgobj row 5000051` |
| `5000061..5000070` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5017`, `instanceId=220..229` | `!spawnbgobj row 5000061` |
| `5000071..5000080` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5025`, `instanceId=464..473` | `!spawnbgobj row 5000071` |
| `5000081..5000090` | `/Chara/Npc/MapObj/MarketStand` | `layoutId=5026`, `instanceId=36..45` | `!spawnbgobj row 5000081` |
| `5000101` | Not present in current server actor-class SQL | `layoutId=171`, `instanceId=1` | `!spawnbgobj row 5000101` |
| `5000106` | `/Chara/Npc/MapObj/CompanyShip` | `layoutId=1201`, `instanceId=1` | `!spawnbgobj row 5000106` |
| `5000107` | `/Chara/Npc/MapObj/CompanyShip` | `layoutId=1202`, `instanceId=1` | `!spawnbgobj row 5000107` |
| `5000108` | `/Chara/Npc/MapObj/CompanyShip` | `layoutId=1202`, `instanceId=2` | `!spawnbgobj row 5000108` |
| `5000109` | `/Chara/Npc/MapObj/CompanyShip` | `layoutId=1203`, `instanceId=1` | `!spawnbgobj row 5000109` |
| `5000116..5000121` | Not present in current server actor-class SQL | `layoutId=1301`, `instanceId=1..6` | `!spawnbgobj row 5000116` |
| `9112101..9112102` | Not present in current server actor-class SQL | `layoutId=101`, `instanceId=949` | `!spawnbgobj row 9112101` |

## Notes

- `row` mode is intentionally conservative: it uses the known layout/instance pair, but keeps the spawn actor class at `5900001` unless you override it.
- `actorclass` mode is better for behavior testing, but rows not present in `gamedata_actor_class.sql` will not spawn as their source actor class.
- The existing `server_eventnpc_mapobj.sql` table is a server-side placed-object map. It already contains recovered doors, guild signs, market doors, dungeon doors, Toto-Rak barriers, and similar objects, but it is still not a complete world prop/building inventory.
- The installed loose client tree exposes `chara/bgobj`, but not loose world `bg` files. More buildings/boxes are probably recoverable from raw zone DAT layout data.
