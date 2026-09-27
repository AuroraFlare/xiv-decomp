# Terminal/widget command bridge contract (2026-06-19)

## Executive findings

- The corrected command split matters for every widget/terminal follow-up: `24301` is place/touch, `24302` is director content, `24228` is widget-open, and `24101` is generic talk.
- `WidgetOpenCommand` is high leverage but dangerous if copied literally; the local script is now reject-only, with real opens deferred to a C# context gate.
- `PacketProcessor` now logs resolved `/Command/System/` owners and missing known command owners (`24101`, `24228`, `24301`, `24302`) behind `debug_event_route_probe`; this is instrumentation, not execution.
- Generic `GimmickTerminal` is only a read-only text surface, and local GimmickTerminal/RaidDungeonWarp scripts now exist; TalkCommand routing plus actor/spawn binding remain the proof gaps.
- Recovered `24301` is confirmed as the place/touch lane: instance-raid touch kind `5` executes static actor `24301`, command `30004`, state `1/2`. Local `PlaceDrivenCommand.lua` still behaves as a gathering/push bridge, so magitek/touch behavior needs captured params before implementation.
- Toto-Rak photocell/barrier/poster objects and the magitek transporter keep separate object contracts.
- Hamlet and caravan HUD probes should stay separated from `commandContent` probes, because a direct widget open can succeed while the retail content-command lane is still missing.

## Consumer surfaces

- `Main menu content action` -> `ContentCommand` DAT `24302` (ContentCommand:P1): Dungeon/Hamlet/behest action icons can appear or be probed while the real commandContent lane is still inert.
- `Place/touch command action` -> `PlaceDrivenCommand` DAT `24301`: Magitek service prompts may be misrouted through talk or noticeEvent instead of touch command flow. Recovered instance-raid touch uses command `30004`; local handling for that branch is not proven.
- `Safe widget open command` -> `WidgetOpenCommand` DAT `24228`: A generic implementation would become an unrestricted client require surface.
- `Generic read-only terminal` -> `TalkCommand` DAT `24101` (TalkCommand:P1): Read-only quest terminals can look dead if TalkCommand or generic terminal binding is missing.
- `Toto-Rak photocell/barrier/poster terminals` -> `TalkCommand` DAT `24101` (TalkCommand:P1): Conflating these with GimmickTerminal would lose photocell count, barrier state, and poster index semantics.
- `Magitek transporter / dungeon warp` -> `TalkCommand; PlaceDrivenCommand` DAT `24101; 24301` (TalkCommand:P1): Dungeon exit/warp terminals remain inert even if other Toto-Rak devices work.
- `Hamlet Defense HUD and score widgets` -> `ContentCommand; WidgetOpenCommand` DAT `24302; 24228` (ContentCommand:P1): Probe packets can open forms while the retail content-command path remains absent.
- `Chocobo Caravan HUD` -> `ContentCommand; WidgetOpenCommand` DAT `24302; 24228` (ContentCommand:P1): Caravan movement can run while client HUD/action commands are not retail-shaped.
- `Quest cutscene and quest ask widgets` -> `TalkCommand; WidgetOpenCommand` DAT `24101; 24228` (TalkCommand:P1): Quest cutscenes can be implemented but still unreachable from the client interaction menu.

## First implementation/probe queue

1. EventRouteProbe system-command owner capture: Logs show resolved or missingOwner EventRouteProbe rows with commandId 24101/24228/24301/24302 and raw EventStart params.
2. ContentCommand 24302 work-sync instrumentation: MainMenu renders 24302 from a non-zero variation and EventRouteProbe captures the command host on click.
3. WidgetOpenCommand reject-only smoke: EventRouteProbe logs owner=0xA0F05EA4 commandId=24228 path=/Command/System/WidgetOpenCommand; each value is rejected/logged, the event closes cleanly, and no arbitrary /Widget/ require/load occurs.
4. TalkCommand target capture: Target actor id/param slot and event type are known before implementing strict TalkCommand routing.
5. Generic GimmickTerminal read row: TalkCommand starts eventTalkTerminal and says the requested 10096/gimmickTerminal row.
6. RaidDungeonWarp magitek transporter: Scheduler 67493888 and askExtendWidget behavior are observed without seeding unresolved actor-class rows.
7. Keep Toto-Rak object terminals object-specific: Light/Barrier/Poster still hit their local scripts and preserve photocell/barrier/poster state.
8. Hamlet and caravan command path separation: HUD/widget opening is distinguishable from content command execution in logs.

## Local gaps

- ContentCommand 24302 needs C# work-sync before Lua script work: First expose/sync contentCommand/contentCommandSub so MainMenu shows 24302, then implement/register ContentCommand.lua only after EventRouteProbe captures the commandContent owner/params.
- WidgetOpenCommand 24228 has reject-only local script; allowlist implementation still needed: Keep the reject-only WidgetOpenCommand smoke while logging empty/pathy/unknown names via EventRouteProbe; defer allowed opens until C# context gates exist.
- TalkCommand 24101 blocks generic terminal and quest NPC entry: Capture TalkCommand target params with EventRouteProbe, then implement strict range/living/active-mode target resolution.
- Generic GimmickTerminal actor binding is unresolved: Bind local GimmickTerminal only to proven read-only devices after TalkCommand routing is validated.
- RaidDungeonWarp actor binding and destination are unresolved: Bind actor classes 1200373/1200374/1200375 only after placement is confirmed, then validate the return/destination behavior.
- PlaceDrivenCommand cleanup is still needed after capture: remove the debug print/lowercase `player:endEvent()` risk and add any `30004` handling as a narrow captured branch, not a broad terminal fallback.
- Widget probes and commandContent probes are currently interleaved: Keep commandContent, widgetCreate, and direct RunEventFunction probes separate in runtime logging.

## Generated artifacts

- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/surface_command_consumers.csv`
- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/widget_open_allowlist_candidates.csv`
- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/terminal_widget_command_bridge_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 41 / 43
- Source term hits: 509
- Function contracts: 66
- Surface consumers: 9
- Widget allowlist candidates: 10
- Local gaps: 6
- Probe rows: 8
