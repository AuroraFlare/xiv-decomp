# Chocobo Caravan Framework

The map server now has a reusable `ChocoboCaravanDirector` for escort-style caravan content.

## Server API

Create a `ChocoboCaravanRoute`, add at least two waypoints, then create and start the director from an `Area`.

```lua
local route = CreateChocoboCaravanRoute(1500228, "skull_valley_caravan_01", "Caravan Chocobo")
route.MoveSpeed = 6.0
route.ArrivalDistance = 2.0
route.DisplayGuildleveId = 10826
route:AddWaypoint(startX, startY, startZ)
route:AddWaypoint(midX, midY, midZ)
route:AddWaypoint(destX, destY, destZ)

local director = player.CurrentArea:CreateChocoboCaravanDirector(route, player)
director:AddMember(player)
director:StartDirector(true)
```

## GUI Behavior
 primary caravan HUD path is the recovered `CaravanGuardDirector` / `ChocoboCaravanWidget` content-information kind `2` flow.

- `work.step` drives the retail start/update/finish phases.
- `work.progressPer` updates as the caravan gets closer to the destination.
- `work.finishTime`, `work.town`, `work.placeStart`, `work.placeEnd`, and `work.name1/2/3` seed the open payload.
- `work.chocoboStatus[3]`, `work.chocoboHPStatus[3]`, and `work.markerX/Y/Z[3]` seed status, HP, and marker updates.

`guildleveWork` objective and marker packets remain compatibility fallback plumbing while the retail HUD path is validated.

## Test Command

`!testcaravan [actorClassId] [distance] [speed]`

Defaults:

- `actorClassId`: `2210501`
- `distance`: `60`
- `speed`: `6`

The test route starts at the player and moves forward in the player's facing direction.
