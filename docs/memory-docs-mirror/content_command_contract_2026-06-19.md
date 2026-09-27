# Content command contract (2026-06-19)

This pass maps the client command lane that is adjacent to, but separate from, quest cutscenes and widget opens. The big boundary: `24302` is the director-driven content command button; `24301` is the place/touch command path, including instance-raid touch command `30004`.

## Contract Matrix

| surface | client_entry | contract | local_status | implementation_note |
| --- | --- | --- | --- | --- |
| Director content-command work sync | DirectorBaseClass._onInit/_onUpdateWork/getContentCommandVariation | directorWork sync fields contentCommand/contentCommandSub are tagged together; _init and contentCommand work updates call player:setContentCommandV... | No focused local content-command director API yet; Hamlet has probe scaffolding for commandContent/widgetCreate. | Expose contentCommand/contentCommandSub as director work rather than direct RunEventFunction calls. |
| Player mirrored command variation | PlayerBaseClass.setContentCommandVariation | Nil command/sub become 0; values write playerWork.variableCommandContent/Sub; desktopWidget.processUpdateContentCommandVariation refreshes the menu. | Player 0x132 bootstrap includes commandContent and commandJudgeMode, but no local setter for this client work pair is obvious. | Add a work-sync helper or director work path that causes the client playerWork mirror to refresh. |
| MainMenu system command 24302 | MainMenuWidget.updateSystemCommand/addSystemCommand/process command | When content command variation exists, MainMenu adds system command 24302 with text/icon tuple 1102/246 and command info from the variation; help r... | Data/command.csv contains row 24302. | Use 24302 for director-driven content commands, not for place/touch commands. |
| Place/instance touch system command 24301 | MainMenuWidget.addSystemCommand and PlayerBaseClass._onTouch | Place-driven commands render as 24301 with text/icon 1101/265. In instance raids, touch kind 5 executes static actor 24301 command 30004 with state... | Data/command.csv contains row 24301; local place-driven sample uses commandJudgeMode. | Probe static actor 24301/command 30004 separately from 24302 content-command variation. |
| Desktop command execution | DesktopWidget.executePlayerSystemCommand | For command 24301 it pulls getPlaceDrivenCommandVariation; for 24302 it pulls getContentCommandVariation before executing the resolved system comma... | Local packet processor logs commandContent/commandJudgeMode EventUpdate and inventory requests. | Command execution should preserve current command event mode and target selection, not bypass through noticeEvent. |
| ContentCommand target bands | ContentCommand.isNoneTarget/isAllTarget/isPcTarget/isNpcTarget/isPartyTarget | Variation ranges define targeting: 10000-19999 none, 20000-29999 all, 30000-39999 PC, 40000-49999 NPC, 50000-59999 party. | No local registry of these bands was found. | Choose contentCommand values by target semantics, then store detail in contentCommandSub. |
| Command event modes | PlayerBaseClass._onPreCommand/_onPostCommand/_onCommandCancel | commandContent and commandJudgeMode lock player/lockon/target cursor, order desktop mode 32, and close event-mode widgets on post/cancel. | Player.Create0x132Packets registers commandContent 0x8 and commandJudgeMode 0x6. | Treat commandContent as a command event lane; preserve mode 32 cleanup. |

## Local Gaps

| gap | evidence | risk | next |
| --- | --- | --- | --- |
| No reusable local content-command variation bridge | Local sources expose commandContent/bootstrap and probes, but no obvious server API that syncs directorWork.contentCommand/contentCommandSub to the... | Instance/Hamlet commands may be forced through noticeEvent or widget probes instead of the menu command path. | Add a director work-sync helper for contentCommand/contentCommandSub and verify MainMenu shows 24302. |
| Instance touch command 24301/30004 is unprobed locally | Recovered PlayerBaseClass._onTouch handles isInstanceRaid + touch kind 5 via static actor 24301 command 30004 state 1/2. | Dungeon service prompts can be mistaken for NPC talk or cutscene events. | Log/probe touch kind 5 inside an isInstanceRaid area and capture EventStart/EventUpdate owners. |
| Command target ranges are not named in local code | ContentCommand uses 10000..59999 ranges, while local code currently has no central content command registry. | Wrong variation range can make the client ask for an invalid target or reject canFire. | Define named constants for none/all/PC/NPC/party-target content command bands. |
| commandContent and noticeEvent can be crossed accidentally | Local Hamlet probes include commandContent, widgetCreate, macroRequest, and notice-event widget calls in close proximity. | A widget may open in a probe while the real command lifecycle remains broken. | Keep commandContent tests separate from RunEventFunction/widgetCreate probes in logs and docs. |

## Bridge Queue

| priority | surface | target | implementation_note | verification |
| --- | --- | --- | --- | --- |
| 1 | Director content-command work sync | Director work packet/API | Expose contentCommand/contentCommandSub updates so DirectorBaseClass._onUpdateWork drives player:setContentCommandVariation. | MainMenuWidget displays command 24302 with the expected command info/subtarget. |
| 2 | Command value registry | shared constants/data | Name the 10000/20000/30000/40000/50000 target bands and reserve content-specific IDs. | ContentCommand.canFire accepts/rejects targets according to the selected band. |
| 3 | Instance touch service probe | isInstanceRaid areas and touch kind 5 | Capture static actor 24301 command 30004 with state 1/2 separately from normal NPC events. | EventStart/EventUpdate owner and params match the recovered _onTouch path. |
| 4 | Menu command execution logging | PacketProcessor commandContent/commandJudgeMode EventUpdate path | Keep explicit logs for commandContent, commandJudgeMode, package requests, and EndEvent ordering. | A content command click produces command event logs and mode-32 cleanup, not a noticeEvent-only trace. |
| 5 | Hamlet/instance command separation | HamletDefenseDirector/Manager probes | Separate commandContent-hosted probes from widgetCreate/RunEventFunction probes so lifecycle bugs stay visible. | Each probe name reports whether it used commandContent, widgetCreate, macroRequest, or noticeEvent. |

## Key Functions

| path | function | start_line | end_line | key_terms | contract_note |
| --- | --- | --- | --- | --- | --- |
| tools\outputs\lpb\content_systems_20260612\lua\chara\player\playerbaseclass.lua | PlayerBaseClass._onTouch | 658 | 710 | 24301; 30004; _onTouch; isInstanceRaid | Instance-raid touch kind 5 executes static actor 24301 command 30004 with state 1/2. |
| tools\outputs\lpb\content_systems_20260612\lua\chara\player\playerbaseclass.lua | PlayerBaseClass.setContentCommandVariation | 1051 | 1061 | variableCommandContent; variableCommandContentSub; setContentCommandVariation; processUpdateContentCommandVariation; ContentCommand | Writes playerWork.variableCommandContent/Sub and refreshes desktop content-command UI. |
| tools\outputs\lpb\content_systems_20260612\lua\widget\mainmenuwidget.lua | MainMenuWidget.updateSystemCommand | 526 | 685 | 24301; 24302; getPlaceDrivenCommandVariation | Adds 24302 for content command variation and 24301 for place-driven command variation. |
| tools\outputs\lpb\content_systems_20260612\lua\widget\mainmenuwidget.lua | MainMenuWidget.addSystemCommand | 983 | 1166 | 24301; 24302 | Renders command IDs, icons, command info, subtarget, and help rows including 24301/24302. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.canFire | 3 | 20 | getContentCommandVariation; ContentCommand | System command target/eligibility rule for content-command variation. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.fire | 21 | 25 | ContentCommand | System command target/eligibility rule for content-command variation. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.isEnabled | 26 | 28 | getContentCommandVariation; ContentCommand | System command target/eligibility rule for content-command variation. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.isNoneTarget | 29 | 31 | getContentCommandVariation; ContentCommand | System command target/eligibility rule for content-command variation. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.isAllTarget | 32 | 34 | getContentCommandVariation; ContentCommand | System command target/eligibility rule for content-command variation. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.isPcTarget | 35 | 37 | getContentCommandVariation; ContentCommand | System command target/eligibility rule for content-command variation. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.isNpcTarget | 38 | 40 | getContentCommandVariation; ContentCommand | System command target/eligibility rule for content-command variation. |
| tools\outputs\lpb\decomp_further_20260617\lua\command\system\contentcommand.lua | ContentCommand.isPartyTarget | 41 | 43 | getContentCommandVariation; ContentCommand | System command target/eligibility rule for content-command variation. |

## Generated Artifacts

- `tools\outputs\lpb\content_command_contract_20260619\README.md`: 1 rows
- `tools\outputs\lpb\content_command_contract_20260619\bridge_queue.csv`: 5 rows
- `tools\outputs\lpb\content_command_contract_20260619\command_csv_rows.csv`: 2 rows
- `tools\outputs\lpb\content_command_contract_20260619\command_surface_matrix.csv`: 7 rows
- `tools\outputs\lpb\content_command_contract_20260619\content_command_function_contracts.csv`: 40 rows
- `tools\outputs\lpb\content_command_contract_20260619\contract_summary.json`: 1 rows
- `tools\outputs\lpb\content_command_contract_20260619\local_gap_summary.csv`: 4 rows
- `tools\outputs\lpb\content_command_contract_20260619\source_term_hits.csv`: 154 rows
