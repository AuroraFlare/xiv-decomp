# Quest Cutscene Decomp Extraction

- Created: 2026-06-17T20:43:35
- Source decomp: `tools\outputs\lpb\decomp_more_20260617`
- Quest Lua files scanned: 861
- Function rows with cutscene/fade behavior: 595
- Cutscene/fade call rows: 1960
- Quest dialogue/widget/control call rows: 22679
- Quest text rows joined to dat-mined sheets: 15887
- Quest method timeline rows: 24639
- Direct scene dialogue context rows: 627
- Server delegate/event rows: 1337
- Server quest-flow rows: 5072
- Server delegate flow-context rows: 1337
- Joined quest cutReplay rows: 518

## Practical Read

- Quest NQ scenes route through `QuestBaseClass.startNQCutScene` and desktop mode `61`.
- Quest HQ scenes route through `QuestBaseClass.startHQCutScene` and desktop mode `62`.
- Instance raid scenes route through `InstanceRaidBaseClass.executeCutScene` and desktop mode `63`.
- SNPC wrappers are argument packers around NQ/HQ quest scenes.
- Replay scenes are selected through `cutReplaySheet`, then replayed through the same NQ/HQ/SNPC wrappers.
- Quest methods that call `startFadeInCutSceneAfterWarp` need the server/runtime warp finalizer path to be correct.

## Generated Files

- `quest_cutscene_calls.csv` - every recovered quest-family cutscene/fade call line.
- `quest_cutscene_functions.csv` - method-level scene keys, launchers, and fade/warp classification.
- `quest_cutscene_summary_by_quest.csv` - per-code rollup joined to `gamedata_quests.sql`.
- `server_delegate_to_cutscene_join.csv` - local server `delegateEvent`/event callsites joined back to decompiled quest methods when possible.
- `quest_event_calls.csv` - dialogue, ask, reward widget, linkshell, music, scheduler, and content prompt calls in client quest Lua.
- `quest_event_text_join.csv` - quest event calls joined to dat-mined localized text rows where a numeric text id is present.
- `quest_event_summary_by_quest.csv` - per-code rollup of those client quest event surfaces.
- `quest_text_summary_by_quest.csv` - per-code rollup of text join coverage and sample English lines.
- `quest_method_timeline.csv` - ordered per-method sequence of localized dialogue, asks, music/control calls, scene launches, and fades.
- `quest_method_context.csv` - method-level timeline rollup with dialogue samples, scene keys, fade modes, and server delegate counts.
- `quest_scene_dialogue_context.csv` - each direct scene key with nearby previous/next localized dialogue from the same method.
- `server_delegate_method_context.csv` - server delegate rows enriched with joined client timeline/context summaries.
- `server_delegate_flow_context.csv` - server delegate rows with nearby quest-state, counter, warp/zone, message, and linkpearl operations.
- `server_quest_flow_calls.csv` - local server quest state, reward, dispatch, marker, and warp operation callsites.
- `server_quest_flow_summary_by_quest.csv` - per-code rollup of local server quest-flow operations.
- `cutscene_type_protocols.csv` - compact explanation of the recovered cutscene launch families.
- `quest_scene_asset_crosscheck.csv` - direct quest scene keys joined to physical cut assets and cutReplay rows.
- `quest_scene_key_gaps.csv` - the direct scene keys missing a physical cut asset or cutReplay row.
- `quest_cutreplay_rows_joined.csv` - replay rows for direct quest scenes with decoded placeholder meanings.
- `cutreplay_placeholder_meanings.csv` - recovered meanings for `-200..-223` replay placeholders.
- `summary.json` - aggregate counts.
