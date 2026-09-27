# ContentCommand variation registry contract (2026-06-19)

This pass narrows the earlier content-command survey to the `24302` ContentCommand variation lane: who should set `contentCommand/contentCommandSub`, how the client mirrors it into `playerWork.variableCommandContent/Sub`, and what remains missing before Hamlet, caravan, dungeon, or behest actions can rely on the retail menu button path.

## Executive findings

- `24302` maps to recovered `ContentCommand` with expected owner actor `0xA0F05EEE`; local `Data/scripts/commands/ContentCommand.lua` is still missing.
- The client workflow is clear: directorWork `contentCommand/contentCommandSub` -> `PlayerBaseClass.setContentCommandVariation` -> playerWork `variableCommandContent/Sub` -> desktop refresh -> MainMenu command `24302` -> `DesktopWidget.executePlayerSystemCommand(24302)` -> `ContentCommand.canFire/fire`.
- Static Lua search found no concrete `contentCommand =` or `contentCommandSub =` producer assignments, so feature-specific values probably need runtime director-work capture.
- Target semantics are encoded by value range: `10000` none, `20000` all, `30000` PC, `40000` NPC, `50000` party.
- Recovered `ContentCommand.fire` returns `false`; do not invent action bodies until C# work-sync renders 24302 and EventRouteProbe captures the command host contract.

## Command Id

| source | command_id | owner_actor_id_expected | class_hypothesis | local_script_present | local_script_path | bridge_note |
| --- | --- | --- | --- | --- | --- | --- |
| tools/outputs/lpb/system_command_dat_id_bridge_20260619/dat_command_id_matrix.csv | 24302 | 0xA0F05EEE | ContentCommand | False | Data/scripts/commands/ContentCommand.lua | DAT/recovered command likely needs a local script or confirmed client-only treatment. |
| Data/command.csv | 24302 |  | ContentCommand | False | Data/scripts/commands/ContentCommand.lua | Local command.csv row at line 821: 24302,,,,,,,,,,,,,,,,,,,,,,,,,,,false,,false,4,true,false,false,false,false |

## Workflow

| step | surface | client_evidence | local_status | contract |
| --- | --- | --- | --- | --- |
| 1 | DAT/static actor id | DAT bridge maps command 24302 to ContentCommand and expected owner actor 0xA0F05EEE. | Data/scripts/commands/ContentCommand.lua is absent. | Treat 24302 as a recovered-only system command until local command host behavior is confirmed. |
| 2 | Director work schema | DirectorBaseClass._onInit syncs contentCommand/contentCommandSub and tags contentCommand with contentCommandSub. | No matching local director work API/packet helper found. | Producer values should be emitted through directorWork contentCommand/contentCommandSub, not ad hoc widget opens. |
| 3 | Director work update | _init and directorWork.contentCommand updates call player:setContentCommandVariation when permitted/enabled. | Local code only has commandContent event names and probes. | A server bridge must cause the client DirectorBaseClass._onUpdateWork path to run. |
| 4 | Player mirror | setContentCommandVariation nil-coerces to 0 and writes playerWork.variableCommandContent/Sub. | No local variableCommandContent/Sub mirror found. | Nil clears; non-zero variation plus subvariation should refresh the desktop menu. |
| 5 | Player getter | cliprog getContentCommandVariation returns nil when variableCommandContent is 0, otherwise variation and sub. | Server-side getter not present. | Do not show 24302 unless variation is non-zero. |
| 6 | Desktop refresh | processUpdateContentCommandVariation calls updateMainMenuWidget in intended decompiled flow. | No local desktop refresh command needed if work-sync path is correct. | Refresh should be an effect of setContentCommandVariation, not a direct local packet hack. |
| 7 | MainMenu render | MainMenuWidget adds command 24302 with text tuple 1102, icon 246, variation as command info, and help row 74633. | Data/command.csv is sparse and does not name ContentCommand. | Menu text/icon come from client resources; server only needs correct variation/subvariation. |
| 8 | Subtarget selection | MainMenu and ConsoleIconTray request/select subtargets before calling executePlayerSystemCommand(24302). | No local content target-band registry found. | Variation band must match required target semantics before exposing the command. |
| 9 | Command execution | DesktopWidget.executePlayerSystemCommand(24302) pulls getContentCommandVariation before executing the system command actor. | PacketProcessor observes commandContent/commandJudgeMode EventUpdate but no ContentCommand script exists. | Execution should enter the commandContent lane with the current variation/subvariation intact. |
| 10 | Eligibility/fire | ContentCommand.canFire enforces variation match and target band; recovered fire returns false. | Action body is still under-proven and may be native/event-driven. | Implement/register only after runtime EventStart/EventUpdate captures show how the action resolves. |
| 11 | Finalize/clear | DirectorBaseClass._onFinalize clears player content command variation when directorWork.contentCommand is non-zero. | No local cleanup bridge for contentCommand was found. | Clear the variation on director end to avoid stale content buttons. |

## Target Bands

| band | range | method | required_target | client_rule | implementation_note |
| --- | --- | --- | --- | --- | --- |
| none | 10000-19999 | ContentCommand.isNoneTarget | nil | canFire requires A6 target to be nil. | Use for content actions that execute immediately from the menu. |
| all | 20000-29999 | ContentCommand.isAllTarget | any/optional | canFire returns true after variation match. | Use sparingly; runtime must confirm how target is passed when no selector is needed. |
| pc | 30000-39999 | ContentCommand.isPcTarget | player actor | canFire requires non-nil target and target:isPlayer(). | Use for player-selected assistance/interaction content commands. |
| npc | 40000-49999 | ContentCommand.isNpcTarget | non-player actor | canFire requires non-nil target and not target:isPlayer(). | Use for NPC/object-target content commands; verify selector target type. |
| party | 50000-59999 | ContentCommand.isPartyTarget | party member | canFire requires non-nil target and getPlayerParty():_isMember(target). | Use only after party membership sync is known correct. |

## Local Gaps

| gap | evidence | risk | next |
| --- | --- | --- | --- |
| Missing local ContentCommand script | DAT bridge expects 24302/0xA0F05EEE ContentCommand, but Data/scripts/commands/ContentCommand.lua is absent. | Client can render a content button while local command execution has no matching script host. | Capture runtime commandContent EventStart/EventUpdate before writing the script body. |
| No local contentCommand/contentCommandSub work-sync bridge | Static search finds only DirectorBaseClass recovered sync schema; local `Director` lacks `DirectorWork`, local `PlayerWork` lacks `variableCommandContent/Sub`, and `SetActorPropetyPacket` does not allow `directorWork`. | Hamlet/dungeon/caravan content commands may be tested through widget probes while the retail menu command path remains absent. | Add a server helper that updates `directorWork.contentCommand/contentCommandSub` together, allows the packet reflector path, and verify MainMenu shows 24302. |
| No concrete producer registry recovered in Lua | No direct contentCommand = or contentCommandSub = assignments appeared in current recovered/local script sets. | Specific command values for Hamlet, caravan, behest, or dungeon actions cannot be assigned safely from static Lua alone. | Capture director work updates at runtime and build a value registry from observed variation/subvariation pairs. |
| Target bands are unnamed locally | ContentCommand defines 10000..59999 ranges, but local code has no constants or validation for those bands. | Wrong band creates bad target selection behavior or canFire rejection. | Create named constants once runtime values identify which content feature uses which range. |
| commandContent probes can mask missing retail flow | HamletDefenseManager contains commandContent-hosted widget probe warnings and unsafe score widget paths. | A widget may appear in testing while content command variation/work sync is still broken. | Keep commandContent, widgetCreate, macroRequest, WidgetOpenCommand, and direct RunEventFunction probes separate in logs. |
| Static direct producer assignment count | Found 0 lines matching direct 'contentCommand =' or 'contentCommandSub =' patterns. | If zero, feature-specific values are probably native/work data rather than Lua literals in this snapshot. | Use runtime director work capture to populate concrete registry rows. |

## 2026-06-20 C# Work-Sync Contract

- Add a base `DirectorWork` with `directorId` temp, synced `contentCommand`, synced `contentCommandSub`, and `syncBuffer[128]`; add `Director.directorWork` plus `SetContentCommandVariation(command, sub)` / `ClearContentCommandVariation()` helpers.
- Send `directorWork.contentCommand` and `directorWork.contentCommandSub` together under the `directorWork/contentCommand` update path so recovered `_onUpdateWork` sees `A1 == "directorWork"` and `A2 == "contentCommand"`.
- Add `PlayerWork.variableCommandContent` and `PlayerWork.variableCommandContentSub` as mirrors only. They are useful for server/debug/relogin visibility, but the retail client path should be the director work update causing client-side `setContentCommandVariation`.
- Route `0x012F` work-sync requests by payload `actorID` before falling back to player-only handling: player actor, owned director actor, area/static actor, then missing-route log. The current parse keeps `actorID`, but the dispatch path drops it before `Player.OnWorkSyncRequest`.
- Log source player id, payload actor id, resolved route, property, from/to, bitfield, request value, and handled/missing status in a dedicated `directorWork` probe lane.
- Clear nonzero content commands on director end/finalize before director removal so stale `24302` buttons disappear.
- Also clear or resync the player mirror on player remove, zone/logout cleanup, relog/re-entry, and failed probe paths; stale `playerWork.variableCommandContent` can leave a phantom content button even after the director is gone.
- Only after the work-sync path renders `24302`, add `Data/scripts/commands/ContentCommand.lua` as a thin guard/delegate: validate the player's current variation/subvariation, enforce `10000..59999` target bands, then delegate to the active director. Do not put Hamlet/caravan/raid behavior directly in the command script.

## Key Functions

| path | function | start_line | end_line | key_terms | contract_note |
| --- | --- | --- | --- | --- | --- |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.canFire | 3 | 20 | ContentCommand; contentCommand; getContentCommandVariation | Checks variation/subvariation match and target band eligibility; decompile ambiguity remains around the second getter result. |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.fire | 21 | 25 | ContentCommand; contentCommand | Recovered stub returns false; action body likely lives in event/native flow. |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.isEnabled | 26 | 28 | ContentCommand; contentCommand; getContentCommandVariation | Enabled when player content variation is non-nil. |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.isNoneTarget | 29 | 31 | ContentCommand; contentCommand; getContentCommandVariation; 10000 | 10000-19999 targetless band. |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.isAllTarget | 32 | 34 | ContentCommand; contentCommand; getContentCommandVariation; 20000 | 20000-29999 all-target band. |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.isPcTarget | 35 | 37 | ContentCommand; contentCommand; getContentCommandVariation; 30000 | 30000-39999 player-target band. |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.isNpcTarget | 38 | 40 | ContentCommand; contentCommand; getContentCommandVariation; 40000 | 40000-49999 NPC/non-player-target band. |
| tools/outputs/lpb/decomp_further_20260617/lua/command/system/contentcommand.lua | ContentCommand.isPartyTarget | 41 | 43 | ContentCommand; contentCommand; getContentCommandVariation; 50000 | 50000-59999 party-member-target band. |
| tools/outputs/lpb/content_systems_20260612/lua/director/directorbaseclass.lua | DirectorBaseClass.getContentCommandVariation | 23 | 27 | ContentCommand; contentCommand; contentCommandSub; getContentCommandVariation | Returns the directorWork contentCommand/contentCommandSub pair. |
| tools/outputs/lpb/content_systems_20260612/lua/director/directorbaseclass.lua | DirectorBaseClass._onInit | 28 | 74 | ContentCommand; contentCommand; contentCommandSub | Defines contentCommand/contentCommandSub sync fields and the contentCommand tag group. |
| tools/outputs/lpb/content_systems_20260612/lua/director/directorbaseclass.lua | DirectorBaseClass._onFinalize | 79 | 89 | ContentCommand; contentCommand; setContentCommandVariation | Clears player content command variation when the director's contentCommand is non-zero. |
| tools/outputs/lpb/content_systems_20260612/lua/director/directorbaseclass.lua | DirectorBaseClass._onUpdateWork | 151 | 171 | ContentCommand; contentCommand; contentCommandSub; setContentCommandVariation | Mirrors directorWork.contentCommand changes into player:setContentCommandVariation when permitted. |
| tools/outputs/lpb/content_systems_20260612/lua/director/directorbaseclass.lua | DirectorBaseClass.getUseContentsCommand | 200 | 205 |  | Default gate is true, so most directors use the content command mirror unless overridden. |
| tools/outputs/lpb/content_systems_20260612/lua/chara/player/playerbaseclass.lua | PlayerBaseClass.setContentCommandVariation | 1051 | 1061 | ContentCommand; contentCommand; variableCommandContent; variableCommandContentSub; setContentCommandVariation; processUpdateContentCommandVariation... | Writes playerWork.variableCommandContent/Sub and refreshes the desktop menu. |
| tools/outputs/lpb/decomp_further_20260617/lua/chara/player/playerbaseclass_cliprog.lua | PlayerBaseClass.getContentCommandVariation | 63 | 76 | ContentCommand; contentCommand; variableCommandContent; variableCommandContentSub; getContentCommandVariation; commandContent | Returns nil when variableCommandContent is 0, otherwise variation and subvariation. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/mainmenuwidget.lua | MainMenuWidget.processSubTargetDecided | 398 | 403 | executePlayerSystemCommand | Completes target selection for a pending 24302 command. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/mainmenuwidget.lua | MainMenuWidget.updateSystemCommand | 526 | 685 | PlaceDrivenCommand; 24301; 24302 | Adds system command 24302 when content variation exists. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/mainmenuwidget.lua | MainMenuWidget.addSystemCommand | 983 | 1166 | 24301; 24302 | Renders 24302 with content-command command info, icon/help, and subtarget data. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.processUpdateContentCommandVariation | 3537 | 3543 | ContentCommand; contentCommand; processUpdateContentCommandVariation | Refreshes MainMenu after the player content variation changes. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.getPlayerContentCommandVariation | 3544 | 3548 | ContentCommand; contentCommand; getContentCommandVariation; getPlayerContentCommandVariation | Desktop getter for the player content variation pair. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.executePlayerSystemCommand | 7369 | 7492 | ContentCommand; contentCommand; getContentCommandVariation; PlaceDrivenCommand; 24301; 24302 | For 24302, pulls getContentCommandVariation before executing the system command actor. |
| tools/outputs/lpb/decomp_further_20260617/lua/widget/consoleicontraywidget.lua | ConsoleIconTrayWidget.getContentSubTargetType | 972 | 987 | 24302 | Controller/icon tray target-selection path for 24302. |
| tools/outputs/lpb/decomp_further_20260617/lua/widget/consoleicontraywidget.lua | ConsoleIconTrayWidget.processSubTargetDecided | 1085 | 1089 | executePlayerSystemCommand; 24302 | Controller/icon tray executes 24302 after a target is selected. |

## Probe Queue

| priority | probe | steps | success |
| --- | --- | --- | --- |
| 1 | Work-sync reflector capture | Allow/log `directorWork/contentCommand`, `directorWork.contentCommandSub`, and `playerWork.variableCommandContent/Sub` during Hamlet, caravan, behest, and dungeon interactions. | The packet path does not drop `directorWork`, and observed variation/subvariation pairs can be mapped to owning director/content feature. |
| 2 | C# smoke/menu render | Set `playerWork.isContentsCommand = true`, inject/sync `directorWork.contentCommand = 10000` and `contentCommandSub = 0`, then inspect MainMenu. | MainMenu shows command `24302` with tuple `1102`, icon `246`, and help row `74633`; `0x012F` logs resolve by director actor id rather than player-only fallback. |
| 3 | CommandContent owner capture | Click 24302 with debug_event_route_probe enabled and log EventRouteProbe/EventStart/EventUpdate owner actor, command args, target, and selected sub... | EventRouteProbe logs owner=0xA0F05EEE commandId=24302 path=/Command/System/ContentCommand, or runtime reveals a different stable host. |
| 4 | Target-band matrix | Test representative 10000, 20000, 30000, 40000, and 50000 values against nil/player/NPC/party targets. | canFire accept/reject behavior matches recovered target-band methods. |
| 5 | Finalize cleanup | End or unload the owning director after 24302 appears. | Player content variation clears and stale 24302 disappears from MainMenu/icon tray. |

## 2026-06-21 Local Missing Mirror Update

- Local `ContentCommand.lua` is still absent. Recovered `ContentCommand.fire` is a stub-like false return, so the useful work is the director/player work sync and target-band gating, not a broad Lua action body.
- Recovered `DirectorBaseClass` mirrors `directorWork.contentCommand/contentCommandSub` into `playerWork.variableCommandContent/Sub`, and desktop/main-menu code renders command `24302` from that player mirror. Local C# still needs a real `directorWork` packet/update path plus player mirror exposure before any production command can be enabled.
- There is no proven local producer registry for `contentCommand/contentCommandSub` yet. Hamlet/caravan/dungeon/content directors should be captured one at a time so command `24302` does not become a generic menu escape hatch.
- EventRouteProbe should log the command host for `24302` as owner `0xA0F05EEE` only after the player mirror appears; if the live client chooses another stable host, update the owner contract before adding any command script.
- `ContentCommand` remains separate from QCI/GuildleveExecutionWidget. Seeing a quest/Hamlet/caravan overlay does not prove command-content work sync or target-band behavior.
- 2026-06-21 bridge safety sweep: `WorkSyncRequestPacket` parses `actorID`, but local dispatch currently drops it and syncs by property name. Route future content-command work sync by actor/director id before trusting any producer.
- `SetActorPropetyPacket` currently allows `work`, `charaWork`, `playerWork`, `npcWork`, `guildleveWork`, and `behestWork`, but not `directorWork`. The recovered `directorWork.contentCommand/contentCommandSub` mirror therefore needs an explicit local packet/root strategy before command `24302` can be considered live.

## Generated artifacts

- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/command_id_contract.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/variation_workflow_matrix.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/target_band_contract.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/producer_assignment_scan.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/content_command_variation_registry_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 19 / 20
- Source term hits: 255
- Function contracts: 82
- Producer scan rows: 83
- Direct assignment hits: 0
- Probe rows: 5
