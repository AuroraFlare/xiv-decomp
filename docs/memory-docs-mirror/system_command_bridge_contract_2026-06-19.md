# System command bridge contract (2026-06-19)

## Executive findings

- Recovered client `DesktopWidget` calls a broad system-command id range, especially party, item, linkshell, bazaar, logout/teleport, and confirm commands.
- Local C# can dispatch generic system commands through static `Command` actors, and the configured static actor binary `Map Server/bin/Debug/staticactors.bin` lets this report decode exact 242xx id-to-name mappings when present.
- The C# fallback mapper only covers battle command types and the materia special-case ids 22014-22016; it is not a generic 242xx system-command registry.
- `PacketProcessor` now has a debug-only EventRouteProbe lane for resolved `/Command/System/` owners and missing known command owners. The focused missing-owner list covers chocobo ride `12014/12015`, `24101`, emote/continue/login `24102/24104/24105`, journal/replay `24211/24212/24241/24312`, `24228`, repair `24243/24244`, content/touch `24301/24302`, and confirm `24304/24306`; production synthetic actors remain gated by captures and scripts.
- Several high-value recovered commands still have no exact local script: `TalkCommand`, `ContentCommand`, `ItemSplitCommand`, `ItemStuffCommand`, `PartyJoinCommand`, repair commands, and raise/warp confirm commands; `WidgetOpenCommand` now exists locally as reject-only.
- Recovered native `canFire` functions give concrete validation contracts for item package checks, party membership, talk targeting, repair targeting, active-mode gates, and confirm flows.

## 2026-06-20 Producer-Side Command Variation Notes

- Recovered `PlayerBaseClass._onCommandEvent` handles `24105` locally before server dispatch, calls `_callServerOnCommand` for the normal path, and then special-cases `12014`: when static actor `320013` says the player is riding and the player is pushing out, it notifies row `26005` and executes static actor `12015`. Treat `12014/12015` as chocobo ride/dismount producer evidence, not generic content commands.
- Recovered `playerbaseclass_cliprog.lua` exposes the missing accessor contract: `getContentCommandVariation`, `getPlaceDrivenCommandVariation`, `getEmoteSitCommandVariation`, `getConfirmWarpCommandVariation`, and `getConfirmRaiseCommandVariation`. This reinforces that `ContentCommand`/`PlaceDrivenCommand` need work-sync first, then Lua guards.
- `ConfirmWarpCommand` enables only for pending variation `20000..29999`, requires the player to be living, rejects active mode and nonzero actor main state, and requires the submitted argument to match the pending variation. `ConfirmRaiseCommand` enables only for `40000..49999`, requires the player to be dead, and also requires the submitted argument to match.
- Both recovered confirm command `fire` bodies return `false`, so `24304`/`24306` should be treated as client-side intent/validation over server-owned pending state, not as authority to warp or raise by themselves.
- `24312` sit is triggered by `PlayerBaseClass._onMoveAtSit` through `desktopWidget:executePlayerSystemCommand(24312, nil, 1)`, while `24102` emote execution is desktop-local. Keep these in the system/UI lane unless EventRouteProbe proves an owner route needs server handling.

## 2026-06-20 Target Id Static Authority Addendum

- Static `/Command/System/*` or `/Command/Game/Prog/*` owner resolution is the authority for these probes, not local `Data/command.csv` names alone. `AI Scripts/command.csv` carries recovered DAT names where local rows are blank, but the static actor path decides the EventStart owner.
- Missing local scripts in the focused set are `24101` `TalkCommand`, `24104` `ContinueCommand`, `24243` `RepairOrderCommand`, `24244` `RepairEquipmentsCommand`, `24302` `ContentCommand`, `24304` `ConfirmWarpCommand`, and `24306` `ConfirmRaiseCommand`.
- Local scripts already exist for `12014/12015` `ChocoboRideCommand`, `24102` `EmoteStandardCommand`, `24105` `LoginEventCommand`, `24211` `RequestQuestJournalCommand`, `24212` `RequestInformationCommand`, `24228` reject-only `WidgetOpenCommand`, `24241` `JournalCommand`, `24301` `PlaceDrivenCommand`, and `24312` `EmoteSitCommand`.
- Caveats to preserve: `12014`, `12015`, and `24105` are raw/static/probe evidence even though they are absent from the DAT bridge matrix; `24241` is blank in DAT but resolves as `JournalCommand`; `24104` conflicts between DAT Home Point/Teleport naming and static `ContinueCommand` resolution.
- Probe stance: `24101`, `24228`, `24301`, and `24302` are production-blocking capture lanes. `12014/12015`, `24102`, `24104`, `24105`, `24211`, `24212`, `24241`, `24243/24244`, `24304/24306`, and `24312` stay logging-only until payloads and ownership are proven.

## 2026-06-20 TalkCommand Owner-Transfer Addendum

- `24101` is statically decoded as `0xA0F05E25` / `/Command/System/TalkCommand`, and `Data/scripts/commands/TalkCommand.lua` is absent. The next step is capture plus C# owner-transfer, not a Lua shim.
- The bridge belongs in `PacketProcessor` after strict static command-owner resolution and before `Player.StartEvent`: only when owner is `0xA0F05E25` / `24101` / `/Command/System/TalkCommand`.
- Capture first: raw `EventStart` params for close/far `PopulaceStandard`, `PopulaceTotorakEntrance`, and one read-only terminal target with `debug_event_route_probe=true`. Prove the target actor param slot and explicit nil placeholders before hardcoding any slot.
- Recovered desktop command execution suggests the talk target is command argument A6, but that is only a hypothesis until runtime `24101` logs include indexed/type-dumped params.
- Later implementation must resolve the target NPC/object from the captured command target slot, validate living/active-mode/talkable/range state, then transfer the event owner to the target and start `ETYPE_TALK` there.
- Preserve non-target params after stripping the target actor/id; terminal row payloads may depend on those remaining params.
- Capture normal/far `PopulaceStandard`, `PopulaceTotorakEntrance`, read-only `GimmickTerminal`, and Toto-Rak warp/light/barrier/poster objects before widening behavior. Far target should send row `25081`; Toto-Rak objects must keep their actual object scripts rather than being generic-terminal routed.
- A Lua-only `TalkCommand.lua` would leave `currentEventOwner` on the static command actor and break replies, so keep it out until the owner-transfer bridge exists.

## 2026-06-20 ContentCommand Work-Sync Addendum

- `24302` static authority remains `0xA0F05EEE` / `/Command/System/ContentCommand`; local `Data/scripts/commands/ContentCommand.lua` is still missing by design.
- `ContentCommand` is blocked on work sync, not Lua. Local `PlayerWork` has `isContentsCommand`, but lacks `variableCommandContent` / `variableCommandContentSub`; no base `DirectorWork` model exists; `SetActorPropetyPacket` does not allow `directorWork`.
- Local code refs for the blocker: `Map Server/Actors/Chara/Player/PlayerWork.cs:40`, `Map Server/Packets/Send/Actor/SetActorPropetyPacket.cs:167`, `Map Server/Packets/Receive/WorkSyncRequestPacket.cs:36`, and `Map Server/PacketProcessor.cs:533`.
- `WorkSyncRequestPacket.actorID` is parsed, but the current `0x012F` dispatch ignores it and routes through player `OnWorkSyncRequest`; director-targeted work-sync must be routed or at least logged by actor id first.
- Preferred routing order is payload player actor, owned director actor, area/static actor, then a missing-route diagnostic. Logs should include source player id, payload actor id, resolved route, property, from/to, bitfield, request value, and handled/missing status.
- Likely fields to prove are `directorWork.contentCommand`, `directorWork.contentCommandSub`, optional `directorWork.syncBuffer[n]`, then player mirrors `playerWork.variableCommandContent` / `playerWork.variableCommandContentSub`.
- Safe probe order: log `0x012F` actor/property/range -> add reflect-only `directorWork` support -> inject a targetless `10000/0` pair on one active test director -> verify MainMenu icon `24302` tuple `1102` / icon `246` / help `74633` -> capture the EventRouteProbe click -> validate target bands -> only then add a thin guarded Lua delegate.
- Clear content-command state before director removal, and clear or resync player mirror fields on director end, player remove, zone/logout cleanup, relog/re-entry, and failed probes to prevent stale `24302` buttons.
- Keep Hamlet/caravan widget probes, `WidgetOpen`, `commandContent`, and direct `RunEventFunction` probes separated in logs so UI success is not mistaken for `ContentCommand` success.

## 2026-06-20 Secondary Missing Command Addendum

- Static actor rows also cover `24204` `PartyJoinCommand`, `24209` `PartyAcceptCommand`, `24221` `ItemStuffCommand`, and `24224` `ItemSplitCommand`, but the current focused missing-owner list does not call them out separately. Add logging coverage before implementing those command scripts.
- 2026-06-21 audit correction: the current `EventRouteProbe` focused id set covers journal/info `24211/24212/24241`, repair `24243/24244`, and confirm `24304/24306`, but not `24204/24209/24221/24224`. Add those four ids to route logging before writing party or item command behavior.
- `ContinueCommand` (`24104`) is statically `/Command/System/ContinueCommand` despite DAT Home Point/Teleport wording. Recovered guard only checks `player:getHP() == 0` and recovered `fire` returns false, so route it through existing death/return state only after capture proves params.
- `ConfirmWarpCommand` and `ConfirmRaiseCommand` are pending-state validators, not warp/raise authority. Warp accepts pending `20000..29999` for living players; raise accepts pending `40000..49999` for dead players; both require the submitted arg to match the pending variation and should clear/refuse stale state.
- `RepairOrderCommand` and `RepairEquipmentsCommand` need idempotent repair state before currency mutation. Local `SetRepairRequest(type)` exists but has duplicate-charge risk and no fulfilled player-to-player repair backend was proven.
- `ItemSplitCommand` must partially split an owned stack after source-package/count validation; do not implement it as whole-reference `MoveItem`. `ItemStuffCommand` has an unconditional recovered `canFire`, so server-side ownership/package validation is mandatory.
- `PartyJoinCommand` and `PartyAcceptCommand` should delegate to existing pending party-invite validation rather than accepting a client target as authority; `PartyAcceptCommand` looks like an empty compatibility alias until a route capture proves distinct behavior.
- Linkshell/community actions follow the same rule: selector widgets and local manager menus are not authority. Route through world/group-owned pending context and validate target, rank, membership, and malformed packet state before create/invite/kick/current-LS writes.
- `JournalCommand` is implemented but mutation-capable: local retry/abandon paths can mutate quests and guildleves from client-supplied ids. Probe `24241` with cancel/subindex-zero first, then only disposable quest/guildleve state.
- `RequestQuestJournalCommand` and `RequestInformationCommand` are comparatively safe query lanes, but local implementations do not show the recovered request-rate limiter. Probe invalid and owned requests early, and treat content-timer cleanup as low-to-medium mutation risk.
- Loot-list command ids need the same route logging before behavior work: `24223` `ItemMovePackageCommand`, `24225` `ItemTransferCommand`, and `24226` `ItemWasteCommand`. These local scripts exist, but recovered loot UI sends package `5` while backend loot is package `4`; add logging and a scoped loot validator before touching claim/pass/drop mutation.
- 2026-06-21 item-route nuance: resolved static `/Command/System/` owners can still log through the generic path check, but the focused missing-owner list does not cover `24221`, `24223`, `24224`, `24225`, or `24226`. Also, current route probing continues into `StartEvent`; do not click valid claim/pass/drop or future split/stuff actions until a log-and-close/no-dispatch mode or strict validators are in place.
- `24301`/`30004` is a place/touch capture lane, not a transporter implementation yet. Recovered client scripts use `30003/30004` as variation payloads, while local C# also uses those values as content-group constants; treat them as context-sensitive fields and log owner/path/params before adding any `PlaceDrivenCommand` behavior.
- Crafting is the strongest local custom-command lane in this batch: `CraftCommand`/`CraftJudge` cover `22001` and recovered craft repair/materia hooks. Repair remains split: NPC repair is wired, but player repair commands `24243/24244` still need local scripts and fulfillment/payment/clear semantics.
- Materia attach/rate/materialize has local command coverage through `22014/22015/22016` and materialize-related command paths. Materia removal is UI-found/backend-missing: recovered `MateriaRemoveWidget` plus low-level `InventoryItem.ClearMateria` exist, but no safe Player-level preview/commit API or confirmed remove command was found.

## Dispatch boundary

- Client EventStart opcode: implemented. System command clicks arrive as event starts whose owner id must resolve to a Command actor.
- Static actor lookup: implemented. A static /Command/System entry is the likely generic bridge for recovered 242xx command ids.
- StaticActors binary loader: loader_implemented. If staticactors.bin contains /Command/System/ItemMovePackageCommand at low id 24223, EventStart owner 0xA0F05E9F can call that script.
- Static actor data file: decoded. Exact command id to command script mapping is decoded when the configured static actor binary is present.
- Postbuild static actor expectation: expected_runtime_asset. Runtime uses the copied static actor binary; docs decode the first available Data/Debug/Release copy.
- Battle command fallback: fallback_only. This fallback handles 0xA0Fxxxxx owner ids only when WorldManager has a BattleCommand or materia special case.

## Highest-priority gaps

1. Static command actor table decoded: Use the decoded matrix for command-owner probes and script-priority ordering.
2. DesktopWidget calls commands with no local script: Add or intentionally stub missing scripts for the DesktopWidget-called command ids.
3. Recovered /Command/System classes missing locally: Prioritize TalkCommand, ContentCommand, repair commands, confirm raise/warp, PartyJoin/Accept, ItemSplit/Stuff; keep WidgetOpenCommand reject-only until context gates are captured.
4. Local-only command scripts need preservation: Classify local-only scripts by recovered command/game counterpart before any cleanup.

## Missing-script hotspots

- Recovered-only command rows: 19
- Local-only top-level command scripts: 31
- DesktopWidget command calls without exact local scripts: 3
- `executePlayerItemSplit` -> `24224` / `ItemSplitCommand`
- `executePlayerItemStuff` -> `24221` / `ItemStuffCommand`
- `executePlayerPartyJoin` -> `24204` / `PartyJoinCommand`

## Bridge queue

1. Verify static command actor table: Decode the configured staticactors.bin copy and confirm each recovered DesktopWidget command id maps to /Command/System/<Name>. Success: static_actor_command_matrix.csv lists 24203, 24204, 24214-24216, 24221, 24223-24227, 24231-24236, 24240, 24303 with expected names.
2. Use EventRouteProbe for focused /Command/System dispatch: With `debug_event_route_probe` enabled, verify `[EventRouteProbe]` logs owner, commandId, ownerType, path, eventType, event, params, and scriptArgs for `/Command/System` owners. Focus production-blocking captures on `24101` TalkCommand, `24228` WidgetOpenCommand, `24301` PlaceDrivenCommand, and `24302` ContentCommand; additionally capture chocobo ride `12014/12015`, emote/continue/login `24102/24104/24105`, journal/replay `24211/24212/24241/24312`, repair `24243/24244`, confirm warp/raise `24304/24306`, and secondary party/item commands `24204/24209/24221/24224` as logging-only evidence before behavior wiring.
3. Add high-value bridges/scripts in the right order: `TalkCommand` needs a C# EventStart owner-transfer bridge before any Lua shim; `ContentCommand` needs `directorWork`/`playerWork` work-sync before a Lua guard/delegate; then add PartyJoinCommand, PartyAcceptCommand, ItemSplitCommand, ItemStuffCommand, RepairOrderCommand, and RepairEquipmentsCommand with native canFire-style guards. Keep WidgetOpenCommand reject-only until allowlist/context gates exist. Success: recovered DesktopWidget calls no longer fail or mutate through missing/unguarded script files.
4. Port native canFire guards: Use system_command_canfire_contract.csv to mirror client validation for item, party, repair, talk, confirm, trade, and linkshell commands. Success: Server rejects stale or forged command params with the same package/actor/target constraints as the client.
5. Resolve item package id policy before item script expansion: Apply the loot package bridge decision so package 5 client refs resolve to the intended backend loot package. Success: ItemMovePackage/Transfer/Waste/Split/Stuff all operate on the same package namespace the client displays.
6. Classify local-only scripts against command/game decomp: Map local Activate, ChangeJob, ChocoboRide, Craft, Equip, Materia, Negotiation, RequestInformation, RequestQuestJournal, Shot, and other scripts to recovered command/game or local-only surfaces. Success: Local-only rows are either linked to recovered command/game classes or documented as local server extensions.

## Generated artifacts

- `tools/outputs/lpb/system_command_bridge_contract_20260619/system_command_coverage.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/desktop_command_call_matrix.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/system_command_canfire_contract.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/local_dispatch_boundary.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/static_actor_command_matrix.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/gap_summary.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/bridge_queue.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/system_command_bridge_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 23 / 23
- Source term hits: 367
- Recovered system command rows: 57
- Coverage rows: 88
- Desktop command calls: 42
- canFire/fire contract rows: 49
- Static command actor rows decoded: 1661
- Gap rows: 6

## 2026-06-21 Route-Probe Guard Update

- Focused route probes still omit several mutation-prone commands such as `24204`, `24209`, `24221`, and `24224`; keep them out of broad dispatch until captured owner semantics exist.
- `24211` and `24212` can remain data/logging probes, but `24241` is journal mutation territory and must stay cancel/subindex-zero/disposable-state only.
- Repair commands `24243` and `24244` should remain logging-only until seek/fulfill/debit/retry semantics are proven.
- NPC repair is present, but debit and durability update need atomic/refund-safe handling. Player repair needs pending owner context plus duplicate-charge protection before local `RepairOrderCommand` or `RepairEquipmentsCommand` scripts are added.
- Command probes should stay log-and-close/no-dispatch while `EventStartPacket`, `EventUpdatePacket`, and current-event owner validation are incomplete.
