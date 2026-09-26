# Gathering Minimap Marker Decomp - 2026-07-04

This pass separates three different surfaces that can all look like "minimap
icons" in game:

1. active guildleve objective circles, written into `MiniMapWidget` and
   `MapNavigationWidget` as coordinate/radius rows;
2. actor-attached map markers, chosen by `DepictionJudge` and the actor's
   client Lua class;
3. actor icon packets, which are server-sent `0x0145` values and are not the
   same as the actor-attached minimap marker type.

## Requested Data

| Requested thing | Recovered path | Data |
| --- | --- | --- |
| moving circle around an NPC | either live guildleve coordinate marker or actor range marker | guildleve marker sizes `1/2/3 -> 32/64/128`; actor range tuple seen as `_setMapMarker(nil, "exit", "caution")` |
| harvest minimap icon | `MiningPoint.getMapMarkerTypeForTalkable()` | actor class `1200055`, command `22007`, marker type `11` |
| spearfishing minimap icon | `MiningPoint.getMapMarkerTypeForTalkable()` | actor class `1200057`, command `22008`, marker type `12` |

## Guildleve Circle Path

Recovered client path:

```text
GuildleveBaseClass.setMiniMapMarkerForGL()
  -> desktopWidget:setMiniMapWidgetMarkerData(2, slot, size, x, y, z)
  -> MiniMapWidget.setMiniMapWidgetMarkerData()
  -> GLMakerData[slot].X/Y/Z/Radius
```

Full-map navigation uses the parallel path:

```text
GuildleveBaseClass.processMapOpenMessage()
  -> desktopWidget:setMapNavigationWidgetMarkerData(2, slot, size, x, y, z)
  -> MapNavigationWidget.setActiveGuildleveMarker()
  -> GLMakerData[slot].X/Y/Z/Radius
```

The coordinate data lives in `guildleveWork.markerX/Y/Z`, each as a 3-entry
float array. `GuildleveBaseClass.setMapMarkerSize()` converts string sizes to
the numeric argument, and both widgets convert that numeric argument to the
actual radius:

| size string | size arg | radius written |
| --- | ---: | ---: |
| `small` | `1` | `32` |
| `normal` | `2` | `64` |
| `large` | `3` | `128` |

This lane is coordinate based, not actor based. A circle can follow a moving NPC
only if the server keeps refreshing the relevant `guildleveWork.markerX/Y/Z`
slot to the NPC's current position and sends the marker work sync.

Native/UI asset breadcrumb for this lane:

```text
MapScreenControl ... group_marker_data ... Radius ... X ... Z ...
m00010 ... common/mapMarker.le.spk
```

That ties the coordinate/radius marker renderer to `common/mapMarker.le.spk`
and `m00010`, but it does not expose the actor-attached marker type texture
table.

## Actor-Attached Marker Path

Recovered client path:

```text
DepictionJudge.judgeNameplate(actor)
  -> actor:isMapMarkerVisibleForTalkable()
  -> actor:getMapMarkerTypeForTalkable()
  -> actor:_setMapMarker(type)
```

Base NPC defaults:

```lua
NpcBaseClass.isMapMarkerVisibleForTalkable() -> true
NpcBaseClass.getMapMarkerTypeForTalkable()   -> 6
```

There is also an actor-attached range branch:

```text
DepictionJudge.judgeNameplate(actor)
  -> actor:getMapMarkerRange()
  -> actor:_setMapMarker(nil, rangeType, rangeStyle)
```

Recovered non-empty range tuples:

| Client class | Range tuple |
| --- | --- |
| `OpeningStoperF0B1` | `"exit", "caution"` |
| `ContentPrivateAreaRange` | `"exit", "caution"` |
| `PrivateAreaPastExit` | `"exit", "caution"` |

`ObjectMapsafety` and `OpeningTownEventKeeper` also define
`getMapMarkerRange()`, but their return constants did not survive this Lua
decompile cleanly.

For a circle that stays attached to a moving actor, this is the best recovered
client-side API shape. The tuple values are known; the exact native visual
rendered by `_setMapMarker_cpp(nil, "exit", "caution")` still needs a runtime
visual probe.

## Actor Marker Type Inventory

These are the actor-attached marker type IDs recovered from `DepictionJudge`
and actor Lua overrides. This table is about `_setMapMarker(type)`, not the
static full-map `quest_marker.csv` / `2Dmap_marker.csv` asset row IDs.

| Type | Recovered meaning | Source/condition |
| ---: | --- | --- |
| `1` | party/ally member marker | player-party member or grouped non-player member |
| `2` | other player marker | non-party player |
| `3` | content-group battle member marker | current content group kind `30006`, actor is a member |
| `4` | party/claimed battle target marker | battle actor's occupancy group contains the player, non-NM type 13 |
| `5` | hostile/neutral battle target marker | hate type `1`/`2` or non-party battle actor, non-NM type 13 |
| `6` | generic talkable NPC/object marker | base `NpcBaseClass` default; also retainer fallback |
| `7` | notorious monster type 12 marker | `isNotoriousMonster() -> true, 12` override |
| `8` | notorious monster type 13 hostile/neutral marker | `isNotoriousMonster() -> true, 13`; also `BombEventSummer2012` when property `2` is enabled |
| `9` | notorious monster type 13 party/claimed marker | party/occupancy-owned NM type 13 |
| `10` | quarrying gathering marker | `MiningPoint`, actor class `1200053` |
| `11` | harvesting gathering marker | `MiningPoint`, actor class `1200055` |
| `12` | spearfishing gathering marker | `MiningPoint`, actor class `1200057` |
| `13` | Hamlet push-event type 3 marker | `PopulaceHamletPushEvent.work.type == 3` |
| `14` | Hamlet harvest type 1 marker | `PopulaceHamletPushEvent.work.type == 2`, `harvestType == 1` |
| `15` | Hamlet harvest type 2 marker | `PopulaceHamletPushEvent.work.type == 2`, `harvestType == 2` |
| `16` | Hamlet harvest type 3 marker | `PopulaceHamletPushEvent.work.type == 2`, `harvestType == 3` |
| `17` | Hamlet captain marker | `PopulaceHamletCaptain.getMapMarkerTypeForTalkable()` |
| `18` | Hamlet push-event type 1 marker | `PopulaceHamletPushEvent.work.type == 1` |

Types `10`, `11`, and `12` are the requested gathering icons. Types `13` through
`18` are nearby Hamlet DoL/DoH markers, not the plain gathering point icons.

## Gathering Point Details

Recovered `MiningPoint` logic:

```lua
function MiningPoint.isMapMarkerVisibleForTalkable(actor)
  if actor:getActorClassId() == 1200053 then
  elseif actor:getActorClassId() == 1200055 then
  else
  end
  if actor:getActorClassId() == 1200057 then
    return true
  else
  end
  return false
end

function MiningPoint.getMapMarkerTypeForTalkable(actor)
  if actor:getActorClassId() == 1200053 then
    return 10
  end
  if actor:getActorClassId() == 1200055 then
    return 11
  end
  if actor:getActorClassId() == 1200057 then
    return 12
  end
  return 6
end
```

| Actor class | Local meaning | Push command | Guildleve command | Marker type | Visibility confidence |
| ---: | --- | ---: | ---: | ---: | --- |
| `1200052` | mining | `20001` | `22002` | `6` fallback | no custom gathering type in `MiningPoint` |
| `1200053` | quarrying | `20005` | `22006` | `10` | medium; type is clear, visibility branch decompiled empty |
| `1200054` | logging/felling | `20002` | `22003` | `6` fallback | no custom gathering type in `MiningPoint` |
| `1200055` | harvesting | `20006` | `22007` | `11` | medium; type is clear, visibility branch decompiled empty |
| `1200056` | fishing | `20003` | `22004` | `6` fallback | no custom gathering type in `MiningPoint` |
| `1200057` | spearfishing | `20007` | `22008` | `12` | high; explicit `return true` survived |

The target-confirmation UI also special-cases actor classes
`1200052/1200054/1200053/1200055/1200057` and command variants
`20001/20002/20005/20006/20007`, then runs player system command `24301`.
That supports the same mining/logging/quarrying/harvesting/spearfishing class
family, but it is a target/action-menu path, not the minimap marker renderer.

## Local Server Implications

Current local code already maps the requested stock actor classes for land
guildleve gathering points:

```text
skill 39, alternate plate 20044 -> 1200053 / command 22006
skill 40, alternate plate 20044 -> 1200055 / command 22007
skill 41, alternate plate 20044 -> 1200057 / command 22008
```

`Data/scripts/commands/gm/addgatherpoint.lua` also captures:

```text
harvesting   -> actorClassId 1200055, commandId 22007
spearfishing -> actorClassId 1200057, commandId 22008
```

The local server sets `currentActorIcon = 1` for spawned guildleve gathering
points. That is the `SetActorIconPacket` lane (`0x0145`) and should not be
confused with the actor-attached minimap marker type chosen by client Lua.

If harvest or spearfishing does not show on the minimap, the next probe should
confirm that the client is instantiating `/Chara/Npc/Object/MiningPoint` with
actor class `1200055` or `1200057`, and that `DepictionJudge` reaches the
talkable marker branch. For harvest specifically, patching or logging
`MiningPoint.isMapMarkerVisibleForTalkable()` would settle the decompile gap.

## Asset Boundary

The DAT sheets `quest_marker.csv` and `2Dmap_marker.csv` use rows like
`common/mapMarker.le.spk,m00013` or `m00011`, but those are static full-map
marker rows. They are not the same namespace as `_setMapMarker(10)`,
`_setMapMarker(11)`, or `_setMapMarker(12)`.

Confirmed asset-side data:

| Lane | Asset evidence | Confidence |
| --- | --- | --- |
| live guildleve coordinate/radius marker | native strings show `MapScreenControl`, `group_marker_data`, `Radius`, `m00010`, `common/mapMarker.le.spk` | high |
| static quest/full-map markers | `quest_marker.csv` rows use `m00013` for quest/NPC marker and `m00029` for quest area/circle marker | high |
| actor-attached `_setMapMarker(type)` textures | no clean DAT/native table recovered in this pass | unknown |

## Source Pointers

- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/object/miningpoint.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass_event.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass_battle.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass_u.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/minimapwidget.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/object/openingstoperf0b1.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/object/objectmapsafety.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/object/openingtowneventkeeper.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/contentprivatearearange.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/privateareapastexit.lua`
- `tools/outputs/lpb/content_systems_20260612/content_systems_sqwt_native_string_probe.csv`
- `Map Server/Actors/Director/GuildleveDirector.cs`
- `Data/scripts/commands/gm/addgatherpoint.lua`
- `Data/sql/gamedata_actor_pushcommand.sql`
