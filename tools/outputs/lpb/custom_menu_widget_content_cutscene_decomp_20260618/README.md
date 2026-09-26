# Custom Menu, Content Widget, and Cutscene Widget Decomp - 2026-06-18

Scope: artifact-only follow-up pass for custom menu decomp plus content/cutscene/widget contracts. No runtime/source code was changed.

Primary source packs:
- `tools/outputs/lpb/decomp_further_20260617`
- `tools/outputs/lpb/decomp_more_20260617`
- `tools/outputs/lpb/decomp_correlation_20260617`

Key findings:
- `PopulaceMenuMan` is a broad debug/custom menu NPC covering cutscene preview, warps, quest starts, NPC/effect tests, load tests, scheduler tests, appearance, past-area work, music/weather, item ops, debug display, region warp, mouth/lip-sync, achievement unlock, and tutorial widgets.
- The fixed main menu has a complete index-to-widget map in `main_menu_root_map.csv`; dynamic system rows are in `main_menu_dynamic_system_commands.csv`.
- Generic live content widgets are slot-owned by actor identity: content slots 1..4 map to widget layers 6..9. Kind `1` opens `GuildleveExecutionWidget`; kind `2` opens `ChocoboCaravanWidget`.
- Cutscene replay is layered: `DesktopWidget.openCutSceneReplaySelectWidget()` opens `Ask/JournalListWidget` mode `7`; that opens `Ask/ReplayCutsceneSelectWidget`; selected cutscene IDs feed `PopulaceCutScenePlayer`, which resolves `cutReplaySheet` args and starts normal/SNPC NQ/HQ cutscene paths.
- Hamlet defense is command/director driven, not part of the generic live-content slot flow.

Files in this pack:
- `manifest_focus.csv`
- `custom_menu_decoded_strings.csv`
- `custom_menu_branch_summary.csv`
- `main_menu_root_map.csv`
- `main_menu_dynamic_system_commands.csv`
- `desktop_widget_static_slots.csv`
- `desktop_mode_cutscene_layers.csv`
- `desktop_content_update_flow.csv`
- `cutscene_replay_and_skip_flow.csv`
- `journal_widget_modes.csv`
- `content_widget_contracts.csv`
- `hamlet_defense_message_flow.csv`
- `bridge_hotspots.csv`
- `next_decomp_targets.csv`

Decompiler caveats:
- Several functions contain impossible `do break` / early `do return` artifacts. Where this pack says "intended" or "inferred", constants and adjacent loop bodies expose the original behavior, but the Lua output itself is not runnable as-is.
- `DesktopWidget.setDesktopModeDetail` needs a bytecode-level or improved decompiler pass to recover exact method names for every visibility flag write.
