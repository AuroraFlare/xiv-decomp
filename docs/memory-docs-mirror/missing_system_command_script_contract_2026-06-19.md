# Missing system command script contract (2026-06-19)

## Executive findings

- The recovered-only command set is not random: the highest-value missing scripts are quest/content glue (`TalkCommand`, `ContentCommand`), direct DesktopWidget commands (`PartyJoinCommand`, `ItemSplitCommand`, `ItemStuffCommand`), and repair/confirm flows; `WidgetOpenCommand` now exists locally as reject-only with allowlist work still pending.
- Local C# already has useful analogs for several missing commands: `SetRepairRequest`, NPC repair helpers, confirm result dispatch patterns, `delegateCommand` UI loops, and Hamlet widget bootstrap code.
- `TalkCommand` and `ContentCommand` likely need C# state/API support, not just Lua stubs: recovered client code expects `_executeTalk`, `_canExecuteTalk`, and player content-command variation fields.
- `MacroCommand`, `NetStatUserSwitchCommand`, and `ReserveInputOperationCommand` should stay low priority until runtime logging proves they reach the server.

## First implementation targets

- P1 `ContentCommand` DAT `24302`: Read the player's content command variation/subvariation, require both args to match, enforce target class by 10000-59999 range, and delegate to the active director/content owner.
- P1 `TalkCommand` DAT `24101`: Resolve the target NPC from the command params, mirror active-mode/living/NpcBaseClass checks, enforce talk range, send retail alert 25081 when too far, then route to the same talkDefault/push talk event path used by quest NPCs.
- P2 `ItemSplitCommand` DAT `24224` direct `24224`: Use the item ref, split count, and source package; require my player, source package present, item package equals source, count >= 1, and count < stack size; create a new stack in the same package or validated destination behavior.
- P2 `ItemStuffCommand` DAT `24221` direct `24221`: Recover the intended retail behavior from item UI callers before implementation; native canFire returns true, so server script must still validate item ref and package ownership.
- P2 `PartyAcceptCommand` DAT `24209`: Provide the empty recovered class as an alias or thin wrapper around PartyJoin/ConfirmGroup acceptance if static actor data references it.
- P2 `PartyJoinCommand` DAT `24204` direct `24204`: Mirror canFire: player must not already be in a multi-member party, target may be actor or name, and duplicates are rejected; then accept/join the pending party invitation.
- P2 `RepairEquipmentsCommand` DAT `24244`: Mirror target-player canFire and drive player-to-player equipment repair request/fulfillment using existing repair order state.
- P2 `RepairOrderCommand` DAT `24243`: Mirror canFire for my living player and repair type 0-3; call Player.SetRepairRequest(type) and protect against duplicate charging/request replay.

## 2026-06-20 Focused Command Probe Addendum

- `TalkCommand 24101` needs a C# EventStart owner-transfer bridge to the resolved NPC/object target; a Lua-only shim leaves ownership on the command actor and cannot safely route target-owned replies.
- `ContentCommand 24302` is director work-sync first: recover `contentCommand`/`contentCommandSub`, mirror them onto player work, refresh MainMenu/Desktop state, and only then add Lua guard/delegate behavior.
- `WidgetOpenCommand` must remain fail-closed: exact allowlist only, no unchecked `/Widget/<arg>` requires, and no desktop/system/edit/transaction widgets.
- `PlaceDrivenCommand 24301` is a place/touch lane, separate from `TalkCommand` and `ContentCommand`; capture `30004`/touch params before widening behavior.
- `24304/24306` confirm warp/raise are intent/validation lanes over pending server state, not direct warp/raise commands.
- Missing command scripts to keep visible in the backlog: `ContinueCommand`, `RepairOrderCommand`, `RepairEquipmentsCommand`, `ConfirmWarpCommand`, `ConfirmRaiseCommand`, `PartyJoinCommand`, `PartyAcceptCommand`, `ItemSplitCommand`, and `ItemStuffCommand`, plus `TalkCommand`/`ContentCommand` C# prerequisites. Add logging/ownership capture for the party and item commands before Lua behavior wiring.

## 2026-06-21 Secondary Command Audit

- Current EventRouteProbe coverage includes `24211`, `24212`, `24241`, `24243`, `24244`, `24304`, and `24306`, but not `24204`, `24209`, `24221`, or `24224`. Add those four ids to logging before party or item command behavior is attempted.
- `ConfirmWarpCommand` and `ConfirmRaiseCommand` stay logging/pending-state only. Recovered guards validate pending `playerWork` variation bands (`20000..29999` for warp, `40000..49999` for raise), argument match, and player alive/dead state; recovered `fire` still returns false.
- `PartyJoinCommand` should compare route captures against the existing pending invite and `ConfirmGroupCommand` flow. `PartyAcceptCommand` is an empty recovered compatibility class until runtime proves a distinct owner path.
- `ItemSplitCommand` has a real guard: my-player item ref, owned source package, source package match, and count `>= 1` and `< stack`. Do not implement split by reusing whole-item `MoveItem`. `ItemStuffCommand` has unconditional recovered `canFire`, so server package/ownership validation is mandatory before any mutation.
- `JournalCommand` is implemented but mutation-capable: local retry/abandon paths can alter quests and guildleves from client-supplied ids. Probe cancel/no-op first, then disposable quest/guildleve states only.
- `RequestQuestJournalCommand` and `RequestInformationCommand` are comparatively safe query lanes, but no local recovered-style rate limiter was found. Use invalid/owned request probes early, and treat content-timer cleanup as a low-to-medium mutation risk.

## 2026-06-21 Craft/Repair/Materia/Item Update

- Craft command route is comparatively concrete: recovered and local `CraftCommand` cover `22001`, recipe select/confirm, start/progress widget flow, and completion. Keep probes to known-recipe open/select/confirm/cancel until ingredient-consuming completion is intentionally tested.
- Recovered `CraftJudge` also has craft-side repair/materia hooks (`startRepair`, `askJoinMateria`, `displayRate`, `askJoinResult`), but these are owner-routed craft surfaces, not generic widget opens.
- Repair local split: NPC repair is wired through `PopulaceItemRepairer` and `Player` repair helpers, while player-to-player `RepairOrderCommand.lua` (`24243`) and `RepairEquipmentsCommand.lua` (`24244`) are still missing locally. Route-log only until fulfillment, payment, retry, and clear semantics exist.
- Materia attach/rate/materialize has local command coverage through `MateriaMeldCommand`, `MateriaMeldRateCommand`, `ItemMaterializeCommand`, and C# player helpers. Probe `22015` rate-only and attach/materialize cancel paths before any commit on disposable items.
- Materia removal remains UI-found/backend-missing: recovered `MateriaRemoveWidget` exists and low-level `InventoryItem.ClearMateria` exists, but no confirmed local remove command or safe Player-level preview/commit API was found.
- Item package scripts exist for `24223`/`24225`/`24226`, but `ItemSplitCommand.lua` (`24224`) and `ItemStuffCommand.lua` (`24221`) are still missing. Split/stuff stay route logging only; move/transfer/waste require disposable items plus package validators before mutation.

## Routing risks

- NPC talk / quest entry: High: quest NPCs and terminals can appear interactable but fail to enter the right event. TalkCommand.
- Director content action: High: dungeon/Hamlet/behest action icons can be visible without a working command bridge. ContentCommand.
- Widget loading/opening: High: arbitrary widget loading remains blocked until exact allowlist and context gates exist. WidgetOpenCommand allowlist/context gates.
- Party invitation acceptance: Medium: invites can be sent but client-side join command may be missing. PartyJoinCommand; PartyAcceptCommand.
- Inventory stack operations: Medium: item UI can expose operations that fail or mutate the wrong package. ItemSplitCommand; ItemStuffCommand; ItemArrangementCommand.

## Probe queue

1. Command actor id/name resolution: Verify/decode the configured staticactors.bin copy or add temporary EventStart logging for owner ids 0xA0F05E8B-0xA0F05EF0. Success: Each missing script row has a known owner id, actor name, and eventName.
2. TalkCommand terminal/NPC path: Interact with normal NPC, quest NPC, Hamlet captain, and dungeon terminal while logging owner actor and params. Success: TalkCommand routes to expected talkDefault/push/quest event without client crash.
3. ContentCommand director path: Enter content with directorWork.contentCommand and trigger the content command icon. Success: Variation/subvariation match recovered ranges and reach active director handler.
4. WidgetOpen allowlist: First smoke-test rejected values through the local reject-only script; only then design context-gated Hamlet score/defense, magitek terminal, and dungeon result/exit opens. Success: Rejected inputs close cleanly, and future widget load/open uses allowlisted names with context ownership.
5. Item split/stuff after package bridge: Split normal stack, try split on loot package item, capture itemRef package/slot/count. Success: Invalid package/count is rejected; valid split creates expected stack.
6. Repair order request replay: Open repair request UI, set the same repair type repeatedly, then switch types. Success: No duplicate charge; charaWork.eventSave.repairType matches client state.

## Generated artifacts

- `tools/outputs/lpb/missing_system_command_script_contract_20260619/missing_command_implementation_matrix.csv`
- `tools/outputs/lpb/missing_system_command_script_contract_20260619/recovered_missing_function_contracts.csv`
- `tools/outputs/lpb/missing_system_command_script_contract_20260619/local_analog_contracts.csv`
- `tools/outputs/lpb/missing_system_command_script_contract_20260619/event_surface_routing.csv`
- `tools/outputs/lpb/missing_system_command_script_contract_20260619/regression_probe_queue.csv`
- `tools/outputs/lpb/missing_system_command_script_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/missing_system_command_script_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/missing_system_command_script_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 19 / 19
- Source term hits: 164
- Missing command rows: 16
- Recovered function rows: 33
- Local analog rows: 12
- Event routing rows: 8
- Probe rows: 6
