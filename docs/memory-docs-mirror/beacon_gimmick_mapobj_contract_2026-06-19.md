# Beacon Gimmick Map-Object Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\beacon_gimmick_mapobj_contract_20260619`.

## High-signal findings

- `BeaconFortGateGimmick` is a status-synced map-object actor, not a normal talk terminal.
- Its retail work contract is small: `status:int8` syncs through tag `mapStat`; status `1` uses `showSchedulerName`, and other statuses use `hideSchedulerName`.
- Initial state uses `_runBgSchedulerFromMidstream(name, 5)`, then later status changes use `_runBgScheduler(name)`.
- `PublicRaidBeaconFort`, `InstanceRaidBeaconBattle`, and `ObjectBeaconGcx105` are empty recovered subclasses, so the useful recovered behavior is in the gate/map-object actor lane.
- Local runtime already has map-object transport: layout/instance IDs on `Npc`, `SetActorBGPropertiesPacket` `0x00D8`, `PlayBGAnimation` `0x00D9`, and sample mapobj Lua scripts.
- Current local SQL does not expose named Beacon gate/gimmick bindings, so placement/state source remains the main blocker.
- 2026-06-21 correction: a local `BeaconFortGateGimmick.lua` file exists, but key status-sync/scheduler methods are still empty or identity-level. Treat it as a class-path shim until `mapStat`, show/hide scheduler names, midstream frame `5`, and status updates are live-proven.

## 2026-06-21 MapObj Gap Addendum

- `DoorStandard`, `DoorServer`, `MapObjTutorial`, and `MapObjOnlyShowHide` are local adapter stubs compared with recovered trigger/timer/scheduler behavior. They can prove class binding and simple BG animation, but not full retail map-object logic.
- `MapObjOneWayDoor` remains recovered-only and blocked for stock-client probes because prior actor-class `5900026` tests crashed. Do not use it as a fallback for normal dungeon doors.
- `MarketStand` and `Pray12Gods` are recovered map-object surfaces without local scripts. `Pray12Gods` has actor classes `1080123..1080136`, hidden marker/emote behavior, and should be tracked as recovered-only rather than inferred from generic map-object success.

## 2026-06-21 Scheduler / Placement Confirmation

- Recovered `BeaconFortGateGimmick` status is a map-object scheduler contract, not a talk terminal: `mapStat/status`, show/hide scheduler names, and `_runBgSchedulerFromMidstream(name, 5)` are the important pieces.
- Local `BeaconFortGateGimmick.lua` is currently a class-path shim. It does not prove map-object placement, status sync, or scheduler playback.
- The local map-object transport is real via SQL spawn/mapobj joins, `SetActorBGProperties`, and `PlayBGAnimation`; the missing piece is a Beacon-specific placement/state source.
- Keep `MapObjOneWayDoor 5900026..5900028` blocked. Its recovered `open/hide` behavior is not a safe fallback for standard dungeon doors, and prior forced binds could crash the stock client.

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | Locate or seed Beacon gate map-object placements | Data/sql/gamedata_actor_class.sql, server_eventnpc_spawn_locations.sql, server_eventnpc_mapobj.sql |
| 2 | Add local BeaconFortGateGimmick script/helper | Data/scripts/base/chara/npc/gimmick/GimmickMapObj/BeaconFortGateGimmick.lua or C# mapobj helper |
| 3 | Bridge status to BG animation | Npc.PlayMapObjAnimation / PlayBGAnimation 0x00D9 |
| 4 | Initial state/midstream probe | spawn/init path |
| 5 | Attach to public/instance raid state | future PublicRaidBeaconFort / InstanceRaidBeaconBattle server logic |

## Generated Files

- `beacon_gimmick_function_contracts.csv` (33 rows)
- `gimmick_mapobj_contract_matrix.csv` (6 rows)
- `local_mapobj_api_surface.csv` (17 rows)
- `actor_binding_probe.csv` (7 rows)
- `public_raid_context.csv` (2 rows)
- `local_gap_summary.csv` (4 rows)
- `bridge_queue.csv` (5 rows)
- `contract_summary.json`
- `README.md`
