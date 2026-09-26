# NPC Escort Minimap Circle Decomp - 2026-07-04

## Short answer

For the recovered escort/follow/caravan content, the moving NPC circle data is director-fed, not encoded as a normal NPC map icon. The client draws those circles through the same active guildleve marker path used by other minimap circles:

```lua
desktopWidget:setMiniMapWidgetMarkerData(2, slot, size, x, y, z)
desktopWidget:setMapNavigationWidgetMarkerData(2, slot, size, x, y, z)
```

Marker group `2` is the active guildleve marker group. The widget stores each marker in `GLMakerData` with integer `X/Y/Z` and `Radius`.

Size values:

| Size arg | Radius property |
| --- | ---: |
| `1` | `32` |
| `2` | `64` |
| `3` | `128` |

All recovered `CaravanGuardDirector` escort marker writes use size `1`, so the retail caravan/escort circle radius is `32`.

There is also a separate actor-attached range marker path through `getMapMarkerRange()` and `_setMapMarker_cpp`. That path is real, but the recovered uses are exit/caution-style private-area or stopper ranges, not escort/follow/caravan NPCs. The recovered `ChocoboCaravanGuard` actor-class rows have empty `pushWithCircleEventConditions`, so they do not provide the actor range circle data.

Compact audit artifacts:

- `tools/outputs/lpb/npc_escort_circle_20260704/mechanism_matrix.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/lua_circle_callsite_inventory.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/treasures_current_route_circle_matrix.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/man0l1_static_marker_sequence.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/requested_data_fan_in.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/widget_property_storage.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/wire_property_contract.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/packet_layout_contract.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/server_marker_producer_inventory.csv`
- `tools/outputs/lpb/npc_escort_circle_20260704/actor_source_dispatch_matrix.csv`

## Widget backing

`MiniMapWidget.setMiniMapWidgetMarkerData(group, slot, size, x, y, z)`:

- clears all active guildleve markers when `slot == -1`;
- rejects marker slots outside `0..8`;
- maps `size` to `Radius` as `1 -> 32`, `2 -> 64`, `3 -> 128`;
- floors `x/y/z`;
- writes `GLMakerData[slot].X/Y/Z/Radius`.

`MapNavigationWidget.setMapNavigationWidgetMarkerData(group, slot, size, x, y, z)` routes group `2` into the same active guildleve marker list for the full map.

Sources:

- `tools/outputs/lpb/decomp_further_20260617/lua/widget/minimapwidget.lua:14`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/minimapwidget.lua:39`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/minimapwidget.lua:55`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua:570`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua:652`

## Complete group-2 circle call-site inventory

The recovered Lua tree only has these director/widget paths writing active guildleve/caravan circle markers:

| File | Function | Circle writer |
| --- | --- | --- |
| `director/caravanguard/caravanguarddirector.lua` | `CaravanGuardDirector.processUIInit` | minimap group `2`, slot `0`, size `1`, `work.marker[1]` |
| `director/caravanguard/caravanguarddirector.lua` | `CaravanGuardDirector.processUIUpdate` | minimap group `2`, size `1`, `work.marker[i]`; active step `70` gated by `chocoboStatus[i] == 4` |
| `director/caravanguard/caravanguarddirector.lua` | `CaravanGuardDirector.processUIFinalize` | minimap group `2`, clear `slot == -1` |
| `director/caravanguard/caravanguarddirector.lua` | `CaravanGuardDirector.processMapOpenMessage` | full-map group `2`, size `1`, `work.marker[i]`; active step `70` gated by `chocoboStatus[i] == 4` |
| `director/guildleve/guildlevebaseclass.lua` | `GuildleveBaseClass.processMapOpenMessage` | full-map group `2`, running slot, `guildleveWork.marker[1..3]` |
| `director/guildleve/guildlevebaseclass.lua` | `GuildleveBaseClass.processMapOpenMessageForAchieve` | full-map group `2`, slot `0`, size `1`, `guildleveWork.marker[1]` |
| `director/guildleve/guildlevebaseclass.lua` | `GuildleveBaseClass.setMiniMapMarkerForGL` | minimap group `2`, running slot, `guildleveWork.marker[1..3]` |
| `director/guildleve/guildlevebaseclass.lua` | `GuildleveBaseClass.processSetMiniMapMarkerForGLAchieve` | minimap group `2`, slot `0`, size `1`, `guildleveWork.marker[1]` |
| `director/guildleve/privateglfreegathertown.lua` | gather-town overrides | gathering-specific direct group `2` calls, not an NPC escort/follow path |

No recovered escort/follow/caravan actor class writes an actor-attached range circle. Actor-attached range markers exist, but they are a different `getMapMarkerRange()` path covered below.

## Server producer completeness pass

The local server has several producers for the same `guildleveWork.markerX/Y/Z` infrastructure. Only some are escort-relevant:

| Producer | Target tag | Coordinates | Escort-circle relevance |
| --- | --- | --- | --- |
| `GuildleveDirector.UpdateMarkers()` | `guildleveWork/marker` | caller-provided live marker slot | cleanest current path for a generic moving escort ring |
| `GuildleveDirector.BuildGuildleveMarkerPackets()` | `guildleveWork/marker` | existing `guildleveWork.markerX/Y/Z[0..2]` | full-sync path for nonzero markers |
| `ChocoboCaravanDirector.SyncDestinationMarker()` | `guildleveWork/marker` | route destination | destination/static marker, not the moving ring by itself |
| `ChocoboCaravanDirector.SyncRetailStatus()` | `work/status` | `work.markerX/Y/Z[0..2]` plus `work.chocoboStatus[0..2]` | retail caravan path; client draws only `status == 4` at step `70` |
| `ChocoboCaravanDirector.SetRetailMarker()` | none by itself | local `work.markerX/Y/Z[index]` mutation | must be followed by `SyncRetailStatus()` to reach the client |
| `BehestDirector.UpdateGuildleveMarker()` | `guildleveWork/marker` | behest wave circles / encounter location | non-escort reuse of the same marker system |
| `HamletDefenseDirector.SyncMarkers()` | `guildleveWork/marker` | hamlet supply cart points | non-escort reuse of the same marker system |
| `EscortRouteDirector.MoveEscortTo()` | none | `escortNpc.SetPos()` and `UpdateActorPosition()` | current generic route movement, but no circle-driving packet |

This means the recovered data set is internally consistent: every source-backed minimap circle that looks like the escort ring flows through either `guildleveWork/marker` or caravan `work/status`, and the current generic escort route does not emit either one.

Sources:

- `Map Server/Actors/Director/GuildleveDirector.cs:2608`
- `Map Server/Actors/Director/GuildleveDirector.cs:2654`
- `Map Server/Actors/Director/GuildleveDirector.cs:2660`
- `Map Server/Actors/Director/GuildleveDirector.cs:2779`
- `Map Server/Actors/Director/GuildleveDirector.cs:2790`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:644`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:650`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:659`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:671`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:810`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:843`
- `Map Server/Actors/Director/BehestDirector.cs:518`
- `Map Server/Actors/Director/BehestDirector.cs:545`
- `Map Server/Actors/Director/BehestDirector.cs:565`
- `Map Server/Actors/Director/BehestDirector.cs:571`
- `Map Server/Actors/Director/HamletDefenseDirector.cs:2809`
- `Map Server/Actors/Director/HamletDefenseDirector.cs:2825`
- `Map Server/Actors/Director/HamletDefenseDirector.cs:2834`
- `Map Server/Actors/Director/HamletDefenseDirector.cs:2846`
- `Map Server/Actors/Director/EscortRouteDirector.cs:261`
- `Map Server/Actors/Director/EscortRouteDirector.cs:265`
- `Map Server/Actors/Director/EscortRouteDirector.cs:266`

Map-open refresh path:

1. `MapNavigationWidget` receives `UILuaCommands.Activated`.
2. It calls `desktopWidget:postMapOpen()`.
3. `DesktopWidget.postMapOpen()` calls `worldMaster:_getMyPlayer():postMapOpen()`.
4. `PlayerBaseClass.postMapOpen()` iterates the player's content groups and calls each director's `processMapOpenMessage()`.
5. Guildleve/caravan directors rebuild the full-map `GLMakerData` list from current work arrays.

Sources:

- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua:129`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:5003`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass.lua:1171`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:675`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:372`

## Actor-attached range marker path

This is the other circle-like mechanism recovered from the Lua. `DepictionJudge.judgeNameplate(actor)` owns the actor map marker calls:

- Talkable NPCs call `actor:_setMapMarker(actor:getMapMarkerTypeForTalkable())` when their map marker is visible.
- Monster/target-style actors call `actor:_setMapMarker(markerType)` after deriving a marker type from hate, party, or notorious-monster state.
- Non-talkable actors with a range marker call `actor:getMapMarkerRange()`; when it returns values, the judge calls the native map-marker bridge with no normal icon type and with the range names returned by the actor.

The native bridge is:

```lua
actor:_setMapMarker(...) -> actor:_setMapMarker_cpp(...)
```

Recovered `getMapMarkerRange()` overrides:

| Class | Source tree | Return / behavior |
| --- | --- | --- |
| `NpcBaseClass` | `decomp_further_20260617` | default `nil` |
| `OpeningStoperF0B1` | `decomp_further_20260617` | returns `"exit", "caution"` |
| `ObjectMapsafety` | `decomp_further_20260617` | decompiled empty/nil |
| `OpeningTownEventKeeper` | `decomp_further_20260617` | decompiled empty/nil |
| `ContentPrivateAreaRange` | `content_systems_20260612` / `decomp_more_20260617` | returns `"exit", "caution"` |
| `PrivateAreaPastExit` | `content_systems_20260612` / `decomp_more_20260617` | returns `"exit", "caution"` |

The actor range marker does not pass a numeric radius through Lua. The radius names map back to actor-class `pushWithCircleEventConditions` entries such as `exit` and `caution`.

Known recovered actor-class range radii:

| Actor class | Class path | Range data |
| ---: | --- | --- |
| `1090373` | `/Chara/Npc/Object/OpeningStoperW0B1` | `exit` radius `4.0`, `caution` radius `5.0`, `outwards=false` |
| `1090384` | `/Chara/Npc/Object/OpeningStoperF0B1` | `exit` radius `40.0`, `caution` radius `30.0`, `outwards=true` |
| `1090385` | `/Chara/Npc/Object/OpeningStoperW0B1` | `exit` radius `40.0`, `caution` radius `30.0`, `outwards=true` |
| `1290001` | `/Chara/Npc/Object/PrivateAreaPastExit` | `exit` radius `30.0`, `caution` radius `20.0`, `outwards=true` |
| `1290002` | `/Chara/Npc/Object/PrivateAreaPastExit` | `exit` radius `40.0`, `caution` radius `30.0`, `outwards=true` |
| `1290003` | `/Chara/Npc/Object/PrivateAreaPastExit` | `exit` radius `50.0`, `caution` radius `40.0`, `outwards=true` |
| `1290004` | `/Chara/Npc/Object/PrivateAreaPastExit` | `exit` radius `60.0`, `caution` radius `50.0`, `outwards=true` |

Important conclusion: this actor-attached range path would be the natural path for a circle that follows an actor because it is set on the actor itself. That is an inference from the call shape and actor-class condition binding. However, the recovered data does not show escort/follow/caravan NPCs using it:

- `ChocoboCaravanGuard` actor-class rows have `pushWithCircleEventConditions: []`.
- The recovered `ChocoboCaravanGuard` Lua path does not override `getMapMarkerRange()`.
- The recovered guildleve escort/follow/rescue classes use `guildleveWork.markerX/Y/Z`.
- The recovered caravan director uses `work.markerX/Y/Z` and `work.chocoboStatus`.

So for stock escort circle reproduction, the source-backed path remains the director marker arrays. The actor-attached range path is a possible custom implementation path, but it is not proven as the retail escort/follow circle path.

Sources:

- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:448`
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:574`
- `tools/outputs/lpb/decomp_further_20260617/lua/judge/depictionjudge.lua:658`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass_u.lua:523`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/npcbaseclass.lua:165`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/object/openingstoperf0b1.lua:6`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/contentprivatearearange.lua:3`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/privateareapastexit.lua:6`
- `tools/outputs/lpb/dungeon_exit_rect_adapter_contract_20260619/actor_class_exit_radii.csv:2`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/class_binding_probe.csv:4`

## CaravanGuardDirector data

The strongest escort-specific hit is `CaravanGuardDirector`. Its synced work contains:

```lua
work.step          -- integer8
work.progressPer   -- integer8
work.finishTime    -- integer32
work.chocoboStatus -- integer8[3]
work.chocoboHPStatus -- integer8[3]
work.markerX       -- float[3]
work.markerY       -- float[3]
work.markerZ       -- float[3]
```

Its tag contract is:

| Tag | Synced fields |
| --- | --- |
| `step` | `work.step`, `work.finishTime` |
| `progress` | `work.progressPer` |
| `status` | `work.chocoboStatus`, `work.markerX`, `work.markerY`, `work.markerZ` |
| `hp` | `work.chocoboHPStatus` |

Lua indexes these arrays as `1..3`. The C# server-side arrays are `0..2`; `work.markerX[0]` in C# corresponds to `work.markerX[1]` in Lua.

Sources:

- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:18`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:74`
- `Map Server/Actors/Director/Work/ChocoboCaravanWork.cs:14`

## Caravan minimap behavior

`CaravanGuardDirector.processUIInit`:

- when `work.step < 40`, writes one circle:

```lua
setMiniMapWidgetMarkerData(2, 0, 1, work.markerX[1], work.markerY[1], work.markerZ[1])
```

`CaravanGuardDirector.processUIUpdate`:

- step `30`: clears group `2`, then writes slot `0`, size `1`, `work.marker[1]`;
- step `70`: on initial UI start, clears group `2`;
- step `70` with tag `status`: updates the caravan info widget, clears group `2`, then loops `i = 1..3`; for every `work.chocoboStatus[i] == 4`, it writes:

```lua
setMiniMapWidgetMarkerData(2, slotCounter, 1, work.markerX[i], work.markerY[i], work.markerZ[i])
```

- step `80`: marks finished, clears group `2`, then writes slot `0`, size `1`, `work.marker[1]`;
- step `90`: marks finished, clears group `2`, then writes slot `0`, size `1`, `work.marker[1]`;
- finalize: clears group `2`.

`CaravanGuardDirector.processMapOpenMessage`:

- step `90`: writes full-map group `2`, slot `0`, size `1`, `work.marker[1]`;
- step `70`: loops `i = 1..3`, and for every `work.chocoboStatus[i] == 4`, writes a full-map marker with size `1` and `work.marker[i]`.

Important: the active moving caravan/escort marker is gated by `chocoboStatus == 4`. The client status labels recovered from `ChocoboCaravanWidget` are:

| Status | Widget command |
| ---: | --- |
| `1` | `UILuaCommands.ChocoboWalk` |
| `2` | `UILuaCommands.ChocoboStop` |
| `3` | `UILuaCommands.ChocoboFlight` |
| `4` | `UILuaCommands.ChocoboEscaped` |
| `5` | `UILuaCommands.ChocoboReturn` |

So stock caravan step `70` does not draw the active circle for status `1` walking; it draws it for status `4` escaped.

Sources:

- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:108`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:126`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:168`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:191`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:217`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:266`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:318`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:372`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/chocobocaravanwidget.lua:89`

## Guildleve escort/follow/rescue data

The NPC-ish guildleve classes recovered in this pass are:

- `PrivateGLBattleSweepEscort`
- `PrivateGLBattleSweepEpicEscort`
- `PrivateGLFreeFollowNormal`
- `CompanyleveRescueNormal`

All extend `GuildleveBaseClass` and use the base `guildleveWork.markerX/Y/Z[3]` circle path. The sweep escort classes and rescue class sync `work.npcHP` on their own `work/info` tag; `PrivateGLFreeFollowNormal` has no custom sync fields in its decompiled `initAsGuildleve()`.

The escort/follow marker hooks are empty on the sweep/follow classes:

```lua
processMapOpenMessageForAchieve()
processSetMiniMapMarkerForGLAchieve()
```

That means they fall through to the base marker loop for ordinary live markers, and only use the base achieve shortcut when they do not override it.

They inherit the base guildleve marker arrays:

```lua
guildleveWork.markerX -- float[3]
guildleveWork.markerY -- float[3]
guildleveWork.markerZ -- float[3]
```

The base guildleve class draws every non-zero, non-nil marker through group `2`:

```lua
setMiniMapWidgetMarkerData(2, slotCounter, setMapMarkerSize(i), guildleveWork.markerX[i], guildleveWork.markerY[i], guildleveWork.markerZ[i])
setMapNavigationWidgetMarkerData(2, slotCounter, setMapMarkerSize(i), guildleveWork.markerX[i], guildleveWork.markerY[i], guildleveWork.markerZ[i])
```

Guildleve escort size override:

```lua
if markerIndex == 1 then
  return "small" -- size 1 / radius 32
end

if getAetheryteLocation() == 6 then
  return "normal" -- size 2 / radius 64
end

return "small" -- size 1 / radius 32
```

This override is shared by:

- `PrivateGLBattleSweepEscort`
- `PrivateGLBattleSweepEpicEscort`
- `PrivateGLFreeFollowNormal`

`CompanyleveRescueNormal` is simpler:

```lua
return "small" -- every marker is size 1 / radius 32
```

NPC-ish guildleve article/widget notes:

| Class | Article rows / status | Marker-size behavior |
| --- | --- | --- |
| `PrivateGLFreeFollowNormal` | one number row, item text, `get` condition | marker 1 small; later markers normal only at aetheryte location `6` |
| `PrivateGLBattleSweepEscort` | row 3 enemy progress, row 4 NPC HP guard row | marker 1 small; later markers normal only at aetheryte location `6` |
| `PrivateGLBattleSweepEpicEscort` | same sweep escort shape | marker 1 small; later markers normal only at aetheryte location `6` |
| `CompanyleveRescueNormal` | one NPC HP/protection bar, `guard` condition | all markers small |

Sources:

- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:151`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:190`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:686`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:725`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:778`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglbattlesweepescort.lua:1`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglbattlesweepescort.lua:21`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglbattlesweepescort.lua:27`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglbattlesweepepicescort.lua:1`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglbattlesweepepicescort.lua:25`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglbattlesweepepicescort.lua:31`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglfreefollownormal.lua:1`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglfreefollownormal.lua:43`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/privateglfreefollownormal.lua:49`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/companyleverescuenormal.lua:1`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/companyleverescuenormal.lua:61`
- `tools/outputs/lpb/guildleve_content_widget_article_contract_deeper_20260618/guildleve_subclass_article_matrix.csv:9`
- `tools/outputs/lpb/guildleve_content_widget_article_contract_deeper_20260618/guildleve_subclass_article_matrix.csv:10`
- `tools/outputs/lpb/guildleve_content_widget_article_contract_deeper_20260618/guildleve_subclass_article_matrix.csv:16`

## Current local server state

`ChocoboCaravanDirector` already has the right retail work shape and packet tags:

- `work/step` sends `work.step`, `work.finishTime`;
- `work/progress` sends `work.progressPer`;
- `work/status` sends all `work.chocoboStatus[i]` plus all `work.markerX/Y/Z[i]`;
- `work/hp` sends all `work.chocoboHPStatus[i]`.

Current implementation gap for the moving escort circle:

- `SyncDestinationMarker()` sets `guildleveWork.marker[markerIndex]` and `work.marker[0]` to the route destination.
- `SetRetailMarker()` only mutates local `work.markerX/Y/Z`; it does not send `work/status` by itself.
- `MoveCaravanTo()` moves the NPC actor and updates actor position, but does not update `work.markerX/Y/Z` or send `work/status`.
- Start/encounter code sets all caravan statuses to walking `1` or stopped `2`; it never sets status `4`, which is the only status drawn as an active step `70` caravan circle by the retail client.

So the local server currently has the plumbing to send the retail circle data, but it is not driving an active moving ring around the NPC.

For the generic guildleve path, `GuildleveDirector` already has the live marker sender:

```csharp
UpdateMarkers(markerIndex, x, y, z)
```

It writes `guildleveWork.markerX/Y/Z[markerIndex]`, then sends `guildleveWork/marker` packets for both:

- the director actor (`new ActorPropertyPacketUtil("guildleveWork/marker", this)`);
- the player actor (`new ActorPropertyPacketUtil("guildleveWork/marker", player)`).

This path is already documented in-code as driving live minimap updates and being read again by full-map open through `PlayerBaseClass.postMapOpen()`.

### Current quest escort route data

The local `treasures_of_the_main` route currently uses the debug/generic `EscortRouteDirector`, not the retail `ChocoboCaravanDirector`.

Route facts:

| Field | Value |
| --- | --- |
| route file | `Data/escortnavmesh/treasures_of_the_main.json` |
| route key/type | `treasures_of_the_main` / `escort` |
| zone | `128` |
| escort actor class | `1000001` |
| display guildleve id | `10826` |
| move speed | `4.0` |
| update interval | `0.75` seconds |
| progress marker index | `0` |
| destination marker index | `0` |
| waypoint count | `656` |
| route start | `-48.703213, 36.460697, 162.03383` |
| route destination | `116.45992, 61.84969, 1274.4138` |
| encounter stops | `5` stops at waypoint indices `33`, `216`, `353`, `406`, `636` |

Actor-class row `1000001` is:

```text
/Chara/Npc/Populace/PopulaceStandard
talkEventConditions: talkDefault
noticeEventConditions: noticeEvent
pushWithCircleEventConditions: []
```

That means the current escort NPC cannot produce an actor-attached range marker from its actor-class data as-is. `SpawnPathCompanion()` does load actor-class event conditions onto the NPC, and `SendEscortActorsToPlayers()` sends event status packets, but there are no push-circle conditions on this actor class to send.

`EscortRouteDirector` currently does this:

- spawns the route NPC with `SpawnPathCompanion(route.CaravanActorClassId, ...)`;
- sends the NPC spawn/init/event-status packets to members;
- moves the NPC with `escortNpc.SetPos(...)` and `CurrentArea.UpdateActorPosition(escortNpc)`;
- never writes `guildleveWork.markerX/Y/Z`;
- never writes caravan `work.markerX/Y/Z`;
- never sends caravan `work/status`;
- never creates or enables an actor-class push-circle range.

So the current local quest escort has movement data but no minimap-circle data source yet.

The concrete current route movement data is usable for a moving ring: it has `656` waypoints from `-48.703213, 36.460697, 162.03383` to `116.45992, 61.84969, 1274.4138`, with encounter pauses at `stop1@33`, `stop2@216`, `stop3@353`, `stop4@406`, and `stop5@636`. The missing piece is not position data; it is copying the current NPC position into one of the recovered marker packet paths.

Sources:

- `Data/escortnavmesh/treasures_of_the_main.json:3`
- `Data/escortnavmesh/treasures_of_the_main.json:7`
- `Data/escortnavmesh/treasures_of_the_main.json:9`
- `Data/escortnavmesh/treasures_of_the_main.json:11`
- `Data/escortnavmesh/treasures_of_the_main.json:12`
- `Data/escortnavmesh/treasures_of_the_main.json:13`
- `Data/escortnavmesh/treasures_of_the_main.json:32`
- `Data/escortnavmesh/treasures_of_the_main.json:3319`
- `Data/sql/gamedata_actor_class.sql:35`
- `Map Server/Actors/Area/Area.cs:1368`
- `Map Server/Actors/Area/Area.cs:1379`
- `Map Server/Actors/Area/Area.cs:1872`
- `Map Server/Actors/Director/EscortRouteDirector.cs:66`
- `Map Server/Actors/Director/EscortRouteDirector.cs:157`
- `Map Server/Actors/Director/EscortRouteDirector.cs:252`
- `Map Server/Actors/Director/EscortRouteDirector.cs:261`
- `Map Server/Actors/Director/EscortRouteDirector.cs:265`
- `Map Server/Actors/Director/EscortRouteDirector.cs:426`

### Actor push-circle packets are not the minimap circle

The local server has packet support for actor event push circles:

| Packet / data | Purpose |
| --- | --- |
| `EventList.PushCircleEventCondition` | condition name, radius, `outwards`, `silent`, `isEnabled` |
| `SetPushEventConditionWithCircle` | opcode `0x016F`; sends radius/outwards/silent/name for an actor trigger circle |
| `SetEventStatusPacket` | opcode `0x0136`; enables/disables event conditions; push-circle status uses type `2` |
| `Actor.GetEventConditionPackets()` | includes `SetPushEventConditionWithCircle` packets when actor-class event data has push circles |
| `Actor.GetSetEventStatusPackets()` | sends enabled state for push circles when they exist |

This is separate from the minimap/full-map circle path. Actor push circles are event-condition geometry. The minimap escort circle recovered from `CaravanGuardDirector` and `GuildleveBaseClass` is `GLMakerData` group `2`, fed by director work arrays.

`Npc.SetNpcTargetMarker(hateType, depictionJudge)` is also separate. It sends `npcWork/hate` with `charaWork.depictionJudge` and `npcWork.hateType`; that can affect actor marker/nameplate presentation, but it does not write `GLMakerData`, `guildleveWork.markerX/Y/Z`, or caravan `work.markerX/Y/Z`.

Sources:

- `Map Server/Actors/EventList.cs:64`
- `Map Server/Packets/Send/Actor/Events/SetPushEventConditionWithCircle.cs:33`
- `Map Server/Packets/Send/Actor/Events/SetPushEventConditionWithCircle.cs:44`
- `Map Server/Packets/Send/Actor/Events/SetPushEventConditionWithCircle.cs:51`
- `Map Server/Packets/Send/Actor/Events/SetEventStatusPacket.cs:32`
- `Map Server/Packets/Send/Actor/Events/SetEventStatusPacket.cs:35`
- `Map Server/Actors/Actor.cs:244`
- `Map Server/Actors/Actor.cs:270`
- `Map Server/Actors/Actor.cs:291`
- `Map Server/Actors/Actor.cs:317`
- `Map Server/Actors/Chara/Npc/Npc.cs:370`
- `Map Server/Actors/Chara/Npc/Npc.cs:378`

### Static quest/journal markers are not the moving escort circle

The quest/full-map `qtmap` path is another false positive. It sends marker IDs, not live XYZ coordinates. The client resolves those IDs through static marker data such as `docs/Dat Mining/quest_marker.csv`.

Local quest journal flow:

```lua
quest:GetJournalMapMarkerList()
player:SendDataPacket("requestedData", "qtmap", questId, unpack(mapMarkers))
```

Regional guildleve journal/full-map flow is similar:

```lua
guildleveMapMarkers.getGuildleveMapMarkerList(glId)
player:SendDataPacket("requestedData", "qtmap", glId, unpack(mapMarkers))
```

For `man0l1` / Treasures of the Main, the escort-relevant static marker IDs are:

| Quest sequence | Marker | Static row | Position X/Z | Meaning |
| --- | --- | ---: | --- | --- |
| `SEQ_048` | `MRKR_ESCORTSTART` | `11000111` | `-22, 147` | start of escort |
| `SEQ_050` | `MRKR_LIGHTHOUSE` | `11000112` | `117, 1274` | destination/lighthouse |
| `SEQ_055` private | `MRKR_CORPSE` | `11000113` | `150.970001, 1312.800049` | corpse search |
| `SEQ_055` public | `MRKR_ESCORTSTART` | `11000111` | `-22, 147` | escort-start fallback |
| `SEQ_060` private | `MRKR_SISIPU2` | `11000114` | `136, 1324` | Sisipu after escort |
| `SEQ_060` public | `MRKR_ESCORTSTART` | `11000111` | `-22, 147` | escort-start fallback |

These can draw full-map quest markers, but they cannot create the moving circle around Sisipu because they do not send live actor coordinates and do not write `GLMakerData`.

### Requested-data and widget storage closure

The packet/widget fan-in closes the remaining false-positive paths:

| Path | Client ingress | Final widget/native property | Live XYZ? | Escort-circle status |
| --- | --- | --- | --- | --- |
| `requestedData`, `qtmap` | `PlayerBaseClass._onReceiveDataPacket()` -> `DesktopWidget.processRecievedRequestedDataForWidget()` | `ssd_marker_data.Row` and `CustomControl_MapNavigation.QuestMapIndex` | no; marker IDs resolve through static rows | not the moving escort circle |
| `requestedData`, `activegl` | same requested-data fan-in | journal/detail widget update | no live circle XYZ | not the moving escort circle |
| direct full-map active marker | `DesktopWidget.setMapNavigationWidgetMarkerData()` | `MapNavigationWidget.GLMakerData.X/Y/Z/Radius` | yes | full-map active guildleve/caravan circle |
| direct minimap active marker | `DesktopWidget.setMiniMapWidgetMarkerData()` | `MiniMapWidget.GLMakerData.X/Y/Z/Radius` | yes | minimap active guildleve/caravan circle |
| content coordinate marker | `MapNavigationWidget.setContentsMarker()` | `CustomControl_MapNavigation.Marker` | coordinate pairs, no recovered radius | recovered method, no escort Lua caller found |
| actor push circle | actor event condition packets | `SetPushEventConditionWithCircle` / event status type `2` | actor event geometry | not `GLMakerData` |

The damaged `DesktopWidget.processRecievedRequestedDataForWidget()` decompile is supported by the older `map_navigation_qtmap_contract_deeper_20260618` bytecode/constants pass: `qtmap` opens/fills a marker menu and calls `setQuestMarker()` / `dispMarker()`, while active guildleve/caravan markers bypass `requestedData` and call the explicit marker bridge methods that write `GLMakerData`.

Sources:

- `Map Server/Actors/Chara/Player/Player.cs:6903`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass.lua:631`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:3446`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:5008`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua:5058`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua:580`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua:652`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua:703`
- `tools/outputs/lpb/decomp_further_20260617/lua/widget/mapnavigationwidget.lua:706`
- `tools/outputs/lpb/map_navigation_qtmap_contract_deeper_20260618/qtmap_requested_data_bridge.csv:3`
- `tools/outputs/lpb/map_navigation_qtmap_contract_deeper_20260618/map_marker_properties.csv:10`
- `Map Server/Actors/Quest/Quest.cs:275`
- `Data/scripts/commands/RequestQuestJournalCommand.lua:76`
- `Data/scripts/commands/RequestInformationCommand.lua:88`
- `Data/scripts/quests/man/man0l1.lua:131`
- `Data/scripts/quests/man/man0l1.lua:141`
- `Data/scripts/quests/man/man0l1.lua:142`
- `Data/scripts/quests/man/man0l1.lua:882`
- `Data/scripts/quests/man/man0l1.lua:919`
- `Data/scripts/quests/man/man0l1.lua:921`
- `docs/Dat Mining/quest_marker.csv:18`
- `docs/Dat Mining/quest_marker.csv:19`

Current-server sender sources:

- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:361`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:439`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:564`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:576`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:634`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:766`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:785`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:793`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:810`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:835`
- `Map Server/Actors/Director/ChocoboCaravanDirector.cs:843`
- `Map Server/Actors/Director/GuildleveDirector.cs:2608`
- `Map Server/Actors/Director/GuildleveDirector.cs:2643`
- `Map Server/Actors/Director/GuildleveDirector.cs:2779`
- `Map Server/Actors/Director/Work/GuildleveWork.cs:25`
- `Map Server/Actors/Chara/Player/Player.cs:470`

### Wire-level property packet closure

The live circle coordinates arrive as actor-property updates, not `requestedData`. The local server builds those updates with `ActorPropertyPacketUtil`, which emits `SetActorPropetyPacket` opcode `0x0137`.

Packet facts:

| Field | Value |
| --- | --- |
| opcode | `0x0137` |
| fixed packet size | `0xA8` |
| data payload budget before split | `0x7D` bytes |
| target/tag encoding | raw ASCII target string, e.g. `guildleveWork/marker` or `work/status` |
| final target prefix byte | `0x82 + targetLength`; `guildleveWork/marker` length `20` -> `0x96`, `work/status` length `11` -> `0x8D` |
| split target prefix byte | `0x60 + targetLength` while `isMore == true` |
| property id | `Utils.MurmurHash2(propertyName, 0)` |
| float property record | `0x04`, uint32 hash, 4-byte `BitConverter.GetBytes(float)` value; 9 bytes before the target suffix |
| status property record | `0x01`, uint32 hash, one-byte `sbyte` / `byte` value; 6 bytes before the target suffix |

Capture-visible packet layouts:

| Path | Target | Source actor | Records | Data bytes | First data byte | Split? | Circle effect |
| --- | --- | --- | --- | ---: | --- | --- | --- |
| guildleve single marker | `guildleveWork/marker` | director actor | `3` floats | `48` | `0x30` | no | repaints through `GuildleveBaseClass.processUpdateWork("marker")` |
| guildleve player echo | `guildleveWork/marker` | player actor | `3` floats | `48` | `0x30` | no | updates player-side work fields; no recovered player repaint branch |
| guildleve all three markers | `guildleveWork/marker` | director or player actor | `9` floats | `102` | `0x66` | no | same tag, up to three active ring slots |
| guildleve marker info echo | `guildleveWork/infoVariable` | director or player actor | `3` floats | `54` | `0x36` | no | extra local echo in caravan/hamlet code; not the recovered repaint tag |
| retail caravan status | `work/status` | director actor | `3` statuses + `9` floats | `111` | `0x6F` | no | repaints caravan step `70` slots where status is `4` |

Actor-source dispatch matters. `ActorPropertyPacketUtil.Done()` builds the packet with `forActor.Id` as source actor id. The local marker sync helpers often send two copies: one sourced from the director actor and one sourced from the player actor. The director-sourced `guildleveWork/marker` packet reaches `DirectorBaseClass._onUpdateWork()` and then the guildleve/caravan director logic. The player-sourced copy reaches `PlayerBaseClass._onUpdateWork()`, which has no recovered `guildleveWork` marker repaint branch and falls through to `CharaBaseClass._onUpdateWork()`. So in packet logs, duplicate marker hashes can be normal; the content-director source is the repaint path.

Guildleve-style moving circle packet:

1. Server writes `guildleveWork.markerX/Y/Z[n]`.
2. Server sends target `guildleveWork/marker` with the three changed float properties.
3. Client director update dispatch reaches `GuildleveBaseClass.processUpdateWork("guildleveWork", "marker")`.
4. The `marker` branch calls `setMiniMapMarkerForGL()`.
5. `setMiniMapMarkerForGL()` clears minimap group `2`, loops `guildleveWork.markerX/Y/Z[1..3]`, and writes every nonzero marker to `MiniMapWidget.GLMakerData`.

Caravan moving circle packet:

1. Server sends target `work/status`.
2. Packet includes `work.chocoboStatus[0..2]` and `work.markerX/Y/Z[0..2]`.
3. Client director update dispatch calls `CaravanGuardDirector.processUIUpdate("status")`.
4. At caravan step `70`, the `status` branch clears minimap group `2`.
5. It writes a circle only for each slot where `work.chocoboStatus[i] == 4`.

Wire ids for the circle-driving fields:

| Target | C# property | C# index | Lua index | Type | Hash dec | Hash hex |
| --- | --- | ---: | ---: | --- | ---: | --- |
| `guildleveWork/marker` | `guildleveWork.markerX[0]` | `0` | `1` | float | `342333742` | `0x1467992E` |
| `guildleveWork/marker` | `guildleveWork.markerY[0]` | `0` | `1` | float | `3494548004` | `0xD04A9224` |
| `guildleveWork/marker` | `guildleveWork.markerZ[0]` | `0` | `1` | float | `1525450550` | `0x5AEC8736` |
| `guildleveWork/marker` | `guildleveWork.markerX[1]` | `1` | `2` | float | `3457711611` | `0xCE187DFB` |
| `guildleveWork/marker` | `guildleveWork.markerY[1]` | `1` | `2` | float | `1157875907` | `0x4503C8C3` |
| `guildleveWork/marker` | `guildleveWork.markerZ[1]` | `1` | `2` | float | `3747761481` | `0xDF624D49` |
| `guildleveWork/marker` | `guildleveWork.markerX[2]` | `2` | `3` | float | `1442738209` | `0x55FE7021` |
| `guildleveWork/marker` | `guildleveWork.markerY[2]` | `2` | `3` | float | `1619126410` | `0x6081E88A` |
| `guildleveWork/marker` | `guildleveWork.markerZ[2]` | `2` | `3` | float | `456263139` | `0x1B3205E3` |
| `work/status` | `work.chocoboStatus[0]` | `0` | `1` | sbyte | `4285948032` | `0xFF766080` |
| `work/status` | `work.chocoboStatus[1]` | `1` | `2` | sbyte | `279272419` | `0x10A55BE3` |
| `work/status` | `work.chocoboStatus[2]` | `2` | `3` | sbyte | `1333078088` | `0x4F752848` |
| `work/status` | `work.markerX[0]` | `0` | `1` | float | `1634597320` | `0x616DF9C8` |
| `work/status` | `work.markerY[0]` | `0` | `1` | float | `1983841243` | `0x763F03DB` |
| `work/status` | `work.markerZ[0]` | `0` | `1` | float | `1922955137` | `0x729DF781` |
| `work/status` | `work.markerX[1]` | `1` | `2` | float | `599572818` | `0x23BCC152` |
| `work/status` | `work.markerY[1]` | `1` | `2` | float | `433901155` | `0x19DCCE63` |
| `work/status` | `work.markerZ[1]` | `1` | `2` | float | `780195099` | `0x2E80D51B` |
| `work/status` | `work.markerX[2]` | `2` | `3` | float | `2650137210` | `0x9DF5E27A` |
| `work/status` | `work.markerY[2]` | `2` | `3` | float | `2544296813` | `0x97A6E36D` |
| `work/status` | `work.markerZ[2]` | `2` | `3` | float | `3703828835` | `0xDCC3F163` |

Sources:

- `Map Server/Utils/ActorPropertyPacketUtil.cs:37`
- `Map Server/Utils/ActorPropertyPacketUtil.cs:51`
- `Map Server/Utils/ActorPropertyPacketUtil.cs:70`
- `Map Server/Utils/ActorPropertyPacketUtil.cs:74`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:35`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:36`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:38`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:83`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:137`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:162`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:208`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:225`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:253`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:283`
- `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:290`
- `Common Class Lib/Utils.cs:211`
- `Common Class Lib/Utils.cs:216`
- `Common Class Lib/Utils.cs:229`
- `Common Class Lib/Utils.cs:272`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua:151`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua:158`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua:159`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua:165`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/directorbaseclass.lua:167`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass.lua:597`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass.lua:614`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass.lua:628`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/charabaseclass.lua:403`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:209`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:312`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:725`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/guildleve/guildlevebaseclass.lua:759`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:89`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:191`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:200`
- `tools/outputs/lpb/decomp_further_20260617/lua/director/caravanguard/caravanguarddirector.lua:201`
- `Map Server/Actors/Director/Work/GuildleveWork.cs:31`
- `Map Server/Actors/Director/Work/GuildleveWork.cs:32`
- `Map Server/Actors/Director/Work/GuildleveWork.cs:33`
- `Map Server/Actors/Director/Work/ChocoboCaravanWork.cs:17`
- `Map Server/Actors/Director/Work/ChocoboCaravanWork.cs:19`
- `Map Server/Actors/Director/Work/ChocoboCaravanWork.cs:20`
- `Map Server/Actors/Director/Work/ChocoboCaravanWork.cs:21`

## Implementation recipes

### Retail caravan circle recipe

To reproduce the recovered caravan circle path:

1. Keep `work.step == 70`.
2. Put the NPC/world position into one retail marker slot, e.g. C# `work.markerX[0]`, `work.markerY[0]`, `work.markerZ[0]`.
3. Set the corresponding C# `work.chocoboStatus[0]` to `4`.
4. Send the `work/status` property packet containing `work.chocoboStatus[0..2]` and `work.markerX/Y/Z[0..2]`.

The client will clear group `2` and draw slot `0`, size `1`, radius `32`, at that marker coordinate.

If this is meant to be a normal walking escort and not the retail escaped-chocobo state, this is still the exact stock client gate. Use it knowingly, because the content info widget will also label that slot as `ChocoboEscaped`.

### Guildleve-style escort circle recipe

To draw the same kind of minimap circle without the caravan status gate:

1. Update `guildleveWork.markerX/Y/Z[n]` to the escort NPC position.
2. Send the `guildleveWork/marker` tag to the player/director actor as the existing code does for destination markers.
3. Let `GuildleveBaseClass.setMiniMapMarkerForGL()` draw group `2`.

For `PrivateGLBattleSweepEscort` and `PrivateGLBattleSweepEpicEscort`, marker index `1` is always small (`size 1`, `radius 32`). Other marker indices are normal (`size 2`, `radius 64`) only when `aetheryteLocation == 6`; otherwise they are small.

Same size rule applies to `PrivateGLFreeFollowNormal`. `CompanyleveRescueNormal` forces every marker small.

### Actor-attached range recipe

To intentionally create an actor-following range marker instead of a `GLMakerData` director marker:

1. Bind the moving NPC to an actor class whose event data has `pushWithCircleEventConditions` entries with stable names, e.g. `escort` or the recovered `exit` / `caution` style.
2. Give the actor script a `getMapMarkerRange()` override that returns those condition names.
3. Make sure the actor is in the non-talkable branch where `DepictionJudge` checks `getMapMarkerRange()`.
4. Let `DepictionJudge` call `_setMapMarker_cpp` for the actor.

This should follow the actor's own position if the native marker bridge treats the range marker like the recovered exit/caution range actors. That last part still needs a runtime probe before calling it retail-verified for escorts.

## Open questions / next trace targets

- The recovered caravan code tells us how the minimap circle is drawn, but retail traces would still be useful to confirm when status `4` is set during a live escort/caravan flow.
- If the desired in-game behavior is a circle around a walking NPC without the `ChocoboEscaped` label, the guildleve marker path is cleaner than forcing caravan status `4`.
- If the desired behavior is a ring physically attached to an arbitrary moving NPC, the actor range path is the next runtime probe: attach named `pushWithCircleEventConditions`, return those names from `getMapMarkerRange()`, and verify whether the native map marker follows the actor.
- `EscortRouteDirector` currently moves an NPC actor directly and does not write caravan retail marker arrays, guildleve marker arrays, or actor range marker data, so it has no recovered minimap-circle driver yet.
