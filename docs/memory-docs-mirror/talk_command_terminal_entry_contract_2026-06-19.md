# TalkCommand terminal entry contract (2026-06-19)

## Executive findings

- DAT `24101` maps to `TalkCommand` / `Talk`, and the local script is still absent at `Data/scripts/commands/TalkCommand.lua`.
- Recovered `TalkCommand` is a gate/router: active-mode/living/NPC checks, target talk eligibility, distance alert `25081`, then `_executeTalk(target)`.
- Local `PopulaceStandard` and `PopulaceTotorakEntrance` already contain the quest/default-talk selection logic; `TalkCommand` should enter those flows rather than duplicate them.
- Local `GimmickTerminal` and `RaidDungeonWarp` scripts now exist; TalkCommand routing plus actor/spawn binding still need proof, while Toto-Rak Light/Barrier/Poster remain object-specific scripts that should not be replaced by a generic terminal.
- The safe implementation is a C# EventStart bridge, not a Lua-only `TalkCommand.lua` shim: the owner must move from static command actor `0xA0F05E25` / low id `24101` to the resolved NPC/object target before `Player.StartEvent`, otherwise `currentEventOwner` and event replies stay attached to the command actor.
- `PacketProcessor` now logs resolved or missing known system-command owners behind `debug_event_route_probe`, so command `24101` target capture has a concrete lane before implementation is made strict.
- Recovered desktop command execution suggests the target is passed in the sixth command argument position, but no checked-in `24101` runtime capture proves that slot yet. Treat A6 as a hypothesis until EventRouteProbe logs raw indexed params.

## 2026-06-21 Helper Confirmation

- The recovered Lua is consistent: both `TalkCommand.canFire` and `TalkCommand.fire` consume the target NPC/object as the sixth command argument (`A6` in the decompile). The server bridge still must prove which raw `EventStart`/`luaParams` slot becomes that sixth command argument before hardcoding a packet parser.
- Recovered range behavior is target-defined: normal NPCs default to distance `7`, gimmick NPCs can override with `talkRange`, and range failure sends world-master alert `25081` without starting an event.
- The owner-transfer requirement is still the central blocker. `EventStartPacket` carries trigger and owner actor ids separately, `Player.StartEvent` stores `currentEventOwner` from the owner id, and later `RunEventFunction` replies reuse that stored owner. Letting `0xA0F05E25` stay owner would strand target-owned NPC/object scripts behind the static command actor.
- Keep object-specific dungeon scripts out of generic terminal routing: `GimmickTerminal` is a read-only text candidate only after target capture; `RaidDungeonLight`, `RaidDungeonBarrier`, `RaidDungeonPoster`, and `RaidDungeonWarp` remain their own owner scripts.

## Talk surfaces

- `Recovered TalkCommand.canFire`: Mirror the gates before starting talkDefault/eventTalk, but use debug_event_route_probe capture to prove the exact target param layout first.
- `Recovered TalkCommand.fire`: Use local distance helpers if present or add a small C# helper; do not bypass the too-far alert.
- `Native client talk helpers`: Treat these as client-native helpers that must be approximated server-side with target, distance, and event status checks.
- `Generic NPC/default talk router`: TalkCommand should enter this existing onEventStarted flow rather than duplicate quest selection.
- `Dungeon entrance talk router`: TalkCommand should preserve ETYPE_TALK so this fallback remains reachable.
- `Read-only terminal`: Bind only read-only terminal actors after TalkCommand can start talk events reliably.
- `Toto-Rak stateful objects`: Regression-test these after TalkCommand so generic terminal work does not steal their actor bindings.
- `Magitek transporter`: Validate after the talk path and actor bindings for 1200373/1200374/1200375 are confirmed.

## Implementation contract

1. `PacketProcessor` / EventStart bridge: Detect only the strict TalkCommand owner `24101` / `0xA0F05E25` / `/Command/System/TalkCommand`. Preserve the client trigger actor, resolve the target from the recovered command target slot first, then current/locked target only if the packet omitted the slot. Transfer `ownerActorID` to the resolved target before `Player.StartEvent`.
2. Target gates: Accept only visible in-area `Npc` targets. Reject null, stale, player, non-NPC command/static owners, dead/non-living players, combat active mode until `_isActorMainStatMode(2)` is locally mapped, and non-talkable targets.
3. Range and event shape: Use `getLimitedDistanceForTalk()` semantics where possible: base NPC `7`, aetheryte parent `10`, gimmick configured `talkRange` when present. If distance is `>= limit`, send alert row `25081` from world master and do not start the event. On success, synthesize `ETYPE_TALK = 1` with the target's enabled talk event name, normally `talkDefault`.
4. Script args: Call scripts as `player, npc, eventType, eventName, ...remainingArgs`. Strip the resolved target actor/id parameter because `npc` is already the owner argument; preserve non-target params such as the optional `GimmickTerminal` row.
5. `GimmickTerminal.lua`: For read-only terminals only, keep the local `eventTalkTerminal(row)` bridge and bind only proven read-only terminal actors.
6. `RaidDungeonWarp.lua`: Keep recovered object-owned `activateWarpDevice`/`askYesNo` behavior and route yes choice through the explicit content return helper. Do not generic-terminal-route `RaidDungeonWarp`, `RaidDungeonLight`, `RaidDungeonBarrier`, `RaidDungeonPoster`, or similar object-owned dungeon scripts.

## Probe queue

1. Capture close-range `PopulaceStandard`: EventRouteProbe logs commandId=24101, target actor id/param slot, event type/name, and script args without guessing. If `DumpParams` lacks indexes/types, add a temporary probe-only indexed/type dump before hardcoding target-slot logic.
2. Capture far-range `PopulaceStandard`: expected result is no event start plus retail alert row `25081`.
3. Quest NPC and Toto-Rak entrance: Confirm target-owned `ETYPE_TALK` reaches `PopulaceStandard`/`PopulaceTotorakEntrance` and does not leave `currentEventOwner` on `0xA0F05E25`.
4. Generic `GimmickTerminal`: Probe with and without a row param; the terminal says the expected `10096`/`gimmickTerminal` row and closes.
5. Toto-Rak object capture set: warp, photocell light, barrier, and poster should each transfer to their actual object script, not a generic terminal owner.
6. Stateful dungeon object regression: Object-specific scripts still own their state and ask/read widgets; warps/lights/barriers/posters are not captured by generic terminal routing.
7. Negative states: Too far sends row `25081`; combat/dead/mounted or invalid target states do not start events.
8. Expand only after owner proof: Enable one known populace target first, then terminals, then dungeon object cases after owner/param logs match.

## 2026-06-21 Command Owner / Packet Guard Addendum

- Current local status is still no `Data/scripts/commands/TalkCommand.lua`; recovered `TalkCommand` is a target gate/router, not an owner script that should remain on static actor `0xA0F05E25`.
- `PacketProcessor` resolves the static command actor and then `Player.StartEvent` stores that actor as `currentEventOwner`. Until the bridge rewrites the owner to the clicked NPC/object, later `RunEventFunction` replies will be routed to the command actor instead of the target.
- `EventStartPacket` and `EventUpdatePacket` both track parse failure, but dispatcher-side invalid-packet rejection still needs to be explicit before widening command/widget routing.
- Packet lane names are stable for future probes: client `EventStart 0x012D`, client `EventUpdate 0x012E`, server `KickEvent 0x012F`, server `RunEventFunction 0x0130`, and server `EndEvent 0x0131`.
- Keep `GimmickTerminal` as read-only terminal text only. `RaidDungeonWarp`, `RaidDungeonLight`, `RaidDungeonBarrier`, and `RaidDungeonPoster` are object-owned dungeon scripts and should not be collapsed into a generic terminal talk path.
- 2026-06-21 bridge safety sweep: `TalkCommand` should remain disabled until `EventStart` transfers ownership from static command actor `0xA0F05E25` to the clicked NPC/object before `Player.StartEvent`; otherwise later replies use `currentEventOwner` and strand target-owned scripts.
- Dispatcher guards are part of the bridge, not optional polish: malformed `EventStartPacket`/`EventUpdatePacket` must return before owner resolution or waiter resume, and far/invalid targets should reject with retail row `25081` where applicable.

## Generated artifacts
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/talk_surface_matrix.csv`
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/local_talk_inventory.csv`
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/talk_command_terminal_entry_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 24 / 25
- Source term hits: 114
- Function contracts: 40
- Talk surfaces: 8
- Local talk inventory rows: 185
- Implementation rows: 4
- Probe rows: 5
