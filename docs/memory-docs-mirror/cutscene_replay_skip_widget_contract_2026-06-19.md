# Cutscene replay/skip widget contract (2026-06-19)

This pass isolates cutscene-only widgets from the generic widget-open path. The short version: skip widgets are static desktop runtime widgets bound to a live CutScene actor, while replay selection is an inn/journal/cutReplay flow owned by PopulaceCutScenePlayer.

## Executive findings

- `CutSceneSkipWidget` and `CutSceneSkipWarningWidget` are static desktop slots `12` and `13`; they should not be opened through `WidgetOpenCommand`.
- Skip is only valid around a live `_play` cutscene with skip enabled: slot `12` gets `argActor`, confirmation text `1022/1023/1024` opens, and accept calls `argActor:_skip()`.
- Replay selection starts with `Ask/JournalListWidget` mode `7`, then opens `Ask/ReplayCutsceneSelectWidget` as a child; the child scans `cutReplay` keys `questId * 100 + 1` through `+30`.
- Recovered `PopulaceCutScenePlayer` performs the actual replay playback by resolving cutReplay column `0` and args `8..15`; local `PopulaceCutscenePlayer.lua` now delegates to the recovered client replay prompt/playback methods.
- Local `SetCutsceneBookPacket` exists and uses opcode `0x01A3`; Player now sends a 2048-bit clone of `playerWork.questScenarioComplete` in inns instead of marking every replay bit true.
- Actor class `1080120` binds `/Chara/Npc/Populace/PopulaceCutScenePlayer` and is the first Unending Journey actor to live-probe with the local bridge; inn spawns already exist in the local SQL.
- Local filename casing is brittle: the actor path uses `PopulaceCutScenePlayer`, while the local file is `PopulaceCutscenePlayer.lua`. This is fine on Windows but should get an exact-case alias or rename before case-sensitive hosting.
- Journal/replay command IDs are now in the logging-only EventRouteProbe list: recovered desktop flow invokes `24211`, `24212`, and `24241`, while `24312` remains replay-adjacent sit/emote evidence to compare during live validation.

## 2026-06-20 Source Status Addendum

- The generated replay CSV artifacts are stale relative to source: local `PopulaceCutscenePlayer.lua` now delegates to recovered client replay methods, and `SetCutsceneBookPacket` now serializes `playerWork.questScenarioComplete` instead of marking every replay bit true.
- New live-validation risk: `PopulaceCutscenePlayer.lua` ends the event immediately after starting/delegating replay, so actor `1080120` in inn zone `244` must prove playback, music restore, and clean return are not interrupted.
- Remaining replay blockers are exact-case `PopulaceCutScenePlayer.lua` resolution for case-sensitive hosting, no Lua/API refresh for replay book bits after quest completion changes inside an inn, and missing local recovered `LoginEventCommand` dream/cutscene branches.
- No discrete local or recovered `EventMovieCommand` / `EventCameraCommand` was found in this pass. Treat movie/camera behavior as native CutScene, WorldMaster, or key-config surface until captures prove a separate command lane.

## 2026-06-20 Replay / Travel Helper Addendum

- Replay owner path remains inn-only: inn cutscene book packet, `PopulaceCutscenePlayer`, recovered `JournalListWidget` mode `7`, child `ReplayCutsceneSelectWidget`, then cutReplay id scan. Do not open replay selectors through generic `WidgetOpenCommand`.
- Skip widgets remain runtime-only: static desktop slots `12/13` must bind to a live cutscene actor before `_skip()` is meaningful.
- Inn exit doors and company-supply/aetheryte edge scripts still contain lowercase `player:endEvent()` style calls in some paths; validate those before relying on the affected branches outside Windows/test runs.
- `JournalCommand` is abandon/retry mutation plumbing, not a journal display opener. Treat retry/abandon probes as disposable-state only.
- `ConfirmWarpCommand` and `ConfirmRaiseCommand` are still missing locally. Recovered versions are pending-state validators with `fire=false`; future local scripts should log/validate pending player work only and must not perform direct warp/raise from client args.
- `/countdown` packet rebroadcast exists, but still needs invalid-packet handling and a max-20 clamp before it is considered safe for public use.
- Any teleport/return probe can mutate location, content membership, guildleve preservation, retainer/transport state, and death state through `DoZoneChange`; use disposable characters and snapshots.

## 2026-06-21 Inn/Populace Replay Checkpoint

- Inn replay/cutscene book is partially implemented and should stay on `PopulaceCutscenePlayer` plus inn `SetCutsceneBookPacket` ownership. Playback, music restore, selected cutscene id, and clean return still need live validation.
- Replay is medium risk rather than a storage-style mutation risk, but it still depends on inn/cutReplay context. Do not inject `JournalListWidget` mode `7` or `ReplayCutsceneSelectWidget` directly through `WidgetOpenCommand`.
- Normal `CompleteQuest` updates and persists the quest-scenario completion bit array that feeds `SetCutsceneBookPacket`, but forced/GM completion paths can diverge if they only update `QuestStateManager`. Compare forced and normal completions before treating replay book visibility as authoritative.
- `SetCutsceneBookPacket` still is not Lua-registered, so scripts cannot refresh replay availability after an in-inn quest completion without a player/area packet refresh path.
- `JournalListWidget` mode `7` has a Hamlet `110820` direct-finish branch before normal replay child selection. Keep the parent journal selector excluded too, not only `ReplayCutsceneSelectWidget`.
- Adjacent inn storage is unrelated to replay safety and remains P0/fail-closed: `ObjectItemStorage` is catalog add/remove without persistent stored item ownership.
- `PopulaceMenuMan` cutscene-preview branches are debug-only and should not be used as evidence that replay/cutscene widgets are safe for retail NPCs.

## Skip Flow

| step | surface | evidence | contract |
| --- | --- | --- | --- |
| 1 | Static widget bootstrap | DesktopWidget creates static slot 12 CutSceneSkipWidget and slot 13 CutSceneSkipWarningWidget. | These widgets are desktop static runtime widgets, not WidgetOpenCommand allowlist targets. |
| 2 | Cutscene play hook | CutScene common shows skip only for _play mode when skip flag A3 == 1, then hides/clears it after playback. | Only a live cutscene actor should be bound to the skip widget. |
| 3 | Actor binding | DesktopWidget.showCutSceneSkip calls getStaticWidget(12):setArgActor(cutsceneActor). | Skip needs the current CutScene actor instance; opening the widget without argActor cannot skip anything safely. |
| 4 | Confirm ask | Button_CutSceneSkip opens CommonAskWidget with text 1022 and choices 1023/1024. | User confirmation is required before _skip is called. |
| 5 | Skip action | processAskResult result 1 calls argActor:_skip(), clears argActor, and hides. | Do not call _skip outside the bound cutscene actor lifecycle. |
| 6 | Warning overlay | Slot 13 warning uses text 1027, opacity 0.7, and hides on CompleteAnimated. | This is a warning overlay only, not the skip action path. |

## Replay Flow

| step | surface | evidence | contract |
| --- | --- | --- | --- |
| 1 | Inn sheet lifecycle | AreaBaseClass creates cutReplaySheet only in inns and deletes it on finalize. | Replay selection should run from an inn/replay context where cutReplaySheet exists. |
| 2 | Availability packet | Local Player queues SetCutsceneBookPacket opcode 0x01A3 in inns with `playerWork.questScenarioComplete` bits. | Replay availability is no longer placeholder-complete, but needs live comparison against JournalList/replay rows. |
| 3 | Replay journal | DesktopWidget.openCutSceneReplaySelectWidget opens Ask/JournalListWidget in mode 7. | Replay selection starts at JournalListWidget, not directly at ReplayCutsceneSelectWidget. |
| 4 | Replay child selector | JournalListWidget opens Ask/ReplayCutsceneSelectWidget for normal replay quest ids. | ReplayCutsceneSelectWidget requires a quest id from the journal parent. |
| 5 | cutReplay key scan | ReplayCutsceneSelectWidget scans questId * 100 + 1 through +30 and stores selected cutsceneId. | Do not feed arbitrary cutscene names into the selector; it returns cutReplay ids. |
| 6 | Replay execution | PopulaceCutScenePlayer resolves questId=floor(cutsceneId/100), cutscene name column 0, args columns 8..15, then starts NQ/HQ or SNPC cutscene. | Actual replay playback belongs in PopulaceCutScenePlayer or an equivalent cutReplay-aware owner. |
| 7 | Native replay path | CutScene common calls _replay(...) when play/replay mode is not 1; cutscene_u maps _replay_inl to _replay_cpp. | Replay is a native cutscene path, not a widget-only action. |

## Local Gaps

| gap | evidence | risk | next |
| --- | --- | --- | --- |
| PopulaceCutscenePlayer bridge needs live validation | Data/scripts/base/chara/npc/populace/PopulaceCutscenePlayer.lua delegates to recovered `processClientTalkEvent`/`processCutScenePlay`. | The bridge relies on the client inn/cutReplay context; wrong actor binding or missing inn sheet would make replay unavailable. | Test from an inn replay NPC, confirm JournalList mode 7 selection, selected cutscene id, playback, music reset, and clean return. |
| Replay availability is quest-completion-backed but unvalidated | Player.cs builds SetCutsceneBookPacket from a 2048-bit clone of `playerWork.questScenarioComplete`. | Replay book should no longer list every scene, but quest-completion bits still need comparison against actual cutReplay rows. | Compare completed and incomplete quest states in an inn and add refresh support if needed. |
| SetCutsceneBookPacket is not Lua-registered | LuaEngine.cs comments out UserData.RegisterType<SetCutsceneBookPacket>(). | Scripts cannot refresh replay availability directly if server state changes inside an inn. | Decide whether replay book state should stay in Player.cs login/area packet flow or be script-callable. |
| Cutscene skip must not become a generic widget-open target | Skip requires a live CutScene argActor and uses static slot 12 cleanup. | Opening CutSceneSkipWidget from WidgetOpenCommand can create stale actor references or no-op skip prompts. | Keep CutsceneSkipWidget, CutsceneSkipWarningWidget, and ReplayCutsceneSelectWidget tier-3/runtime gated. |
| Journal/replay command IDs need live validation | Recovered desktop flow invokes `24211`, `24212`, and `24241`; local EventRouteProbe now includes those plus replay-adjacent `24312`. | Route logging can still be misleading if replay selection is client-local after the book packet. | Use the normal inn replay actor flow and compare logs against selected JournalList mode `7` rows; do not directly inject replay widgets. |
| LoginEventCommand recovered branches missing | Local LoginEventCommand handles dream quest/warp flow, but recovered dream/opening cutscene branches are not localized yet. | Login/dream cutscene replay behavior may diverge from retail or be invisible in the current replay probes. | Capture dream code `20` and quest replay/login codes `1/2` separately before adding branches. |
| No standalone EventMovie/EventCamera command found | Search found native CutScene play/replay/skip, WorldMaster camera/tutorial/chocobo APIs, and DAT key-config camera commands instead. | Inventing a command script would create the wrong authority path for movie or camera behavior. | Keep movie/camera in native cutscene/worldMaster capture lanes until an EventStart owner proves otherwise. |
| PopulaceCutScenePlayer path casing mismatch | SQL actor path uses `PopulaceCutScenePlayer`; local file is `PopulaceCutscenePlayer.lua`. | Windows loads it, but case-sensitive hosts may fail to resolve the NPC script. | Add an exact-case alias/rename before Linux/server deployment. |

## Implementation Contract

| priority | component | contract | verification |
| --- | --- | --- | --- |
| 1 | PopulaceCutscenePlayer local script | Keep the local script as a narrow delegate into recovered client replay prompt/playback methods; cutReplay arg resolution and NQ/HQ/SNPC launch remain owned by `PopulaceCutScenePlayer.processCutScenePlay`. | Inn replay NPC can play a selected unlocked cutscene and return to music/state cleanly. |
| 2 | SetCutsceneBookPacket completion source | Use scenario/quest completion bits and validate them against replay rows. | Replay book only lists completed/unlocked scenes. |
| 3 | WidgetOpenCommand allowlist | Keep skip/warning/replay selector blocked from generic opens unless a cutscene/replay parent context owns them. | 24228 cannot open CutSceneSkipWidget or ReplayCutsceneSelectWidget directly. |
| 4 | Skip lifecycle probes | Verify show/hide/clear happens only around live cutscene _play with skip flag enabled. | Accepting skip calls _skip once and clears argActor; natural end also clears the widget. |

## Key Functions

| path | function | start_line | end_line | key_terms | contract_note |
| --- | --- | --- | --- | --- | --- |
| tools/outputs/lpb/content_systems_20260612/lua/widget/cutsceneskipwidget.lua | CutSceneSkipWidget.processUICommandOperate | 6 | 20 | CutSceneSkipWidget; CommonAskWidget; 1022; 1023; 1024 | Opens CommonAskWidget using text ids 1022, 1023, and 1024. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/cutsceneskipwidget.lua | CutSceneSkipWidget.processAskResult | 21 | 27 | CutSceneSkipWidget; _skip | Accept result 1 calls the bound cutscene actor _skip and clears it. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/cutsceneskipwidget.lua | CutSceneSkipWidget.clear | 31 | 40 | CutSceneSkipWidget; CommonAskWidget | Closes child CommonAskWidget, clears argActor, and hides. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/cutsceneskipwarningwidget.lua | CutSceneSkipWarningWidget.init | 3 | 6 | CutSceneSkipWarningWidget; 1027 | Sets warning text 1027 and animated-complete handling. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/ask/replaycutsceneselectwidget.lua | ReplayCutsceneSelectWidget.processUICommandSelection | 50 | 60 | ReplayCutsceneSelectWidget | Returns the selected cutsceneId to the parent JournalListWidget. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/ask/replaycutsceneselectwidget.lua | ReplayCutsceneSelectWidget.createList | 65 | 133 | ReplayCutsceneSelectWidget; cutReplaySheet | Scans cutReplay ids questId*100+1 through +30. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/ask/journallistwidget.lua | JournalListWidget.processUICommandOperate | 217 | 222 | JournalListWidget | Mode 7 opens ReplayCutsceneSelectWidget for normal replay quest ids. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.openCutSceneReplaySelectWidget | 5095 | 5099 | JournalListWidget; openCutSceneReplaySelectWidget | Opens Ask/JournalListWidget in mode 7. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.showCutSceneSkip | 5761 | 5765 | showCutSceneSkip | Binds static slot 12 to the current cutscene actor. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.hideCutSceneSkip | 5766 | 5770 | hideCutSceneSkip; clearCutSceneSkip | Clears static slot 12 after playback. |
| tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua | DesktopWidget.clearCutSceneSkip | 5771 | 5775 | clearCutSceneSkip | Calls CutSceneSkipWidget.clear on static slot 12. |
| tools/outputs/lpb/content_systems_20260612/lua/area/areabaseclass.lua | AreaBaseClass._onInit | 162 | 193 | cutReplaySheet | Creates cutReplaySheet when the area is an inn. |
| tools/outputs/lpb/content_systems_20260612/lua/area/areabaseclass.lua | AreaBaseClass._onFinalize | 215 | 220 | cutReplaySheet | Deletes cutReplaySheet when leaving an inn. |
| tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecutsceneplayer.lua | PopulaceCutScenePlayer.processCutScenePlay | 39 | 138 | PopulaceCutScenePlayer; cutReplaySheet; openCutSceneReplaySelectWidget; selectCutSceneReplaySelectWidget; closeCutSceneReplaySelectWidget; -202; -2... | Runs the cutReplay playback loop, resolves args, and starts NQ/HQ/SNPC replay cutscenes. |
| tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecutsceneplayer.lua | PopulaceCutScenePlayer.getCutName | 139 | 141 | PopulaceCutScenePlayer; cutReplaySheet | Reads cutReplay column 0 for the cutscene filename. |

## Probe Queue

| priority | probe | steps | success |
| --- | --- | --- | --- |
| 1 | Skip live actor binding | Start a skippable quest cutscene and inspect static widget 12 argActor/show/clear transitions. | argActor is set before _play, _skip fires only after confirm, and clear removes argActor after playback. |
| 2 | Replay NPC flow | Interact with actor class `1080120` in an inn, open JournalList mode 7, choose a replay row, and log selected cutsceneId. | Selected id follows questId*100+n and routes through the local PopulaceCutscenePlayer bridge into recovered playback. |
| 3 | SetCutsceneBook bits | Compare replay book entries with SetCutsceneBookPacket bool array for completed and incomplete quest states. | Availability bits hide incomplete scenes with the quest-completion-backed packet. |
| 4 | WidgetOpen rejection | Attempt 24228 opens for CutSceneSkipWidget, CutSceneSkipWarningWidget, and Ask/ReplayCutsceneSelectWidget outside runtime context. | All are rejected/logged by tier gate. |
| 5 | Journal route-probe IDs | With logging-only probes already covering `24211`, `24212`, `24241`, and `24312`, use the normal inn replay actor flow. | Logs show journal/replay ownership without direct widget injection or behavior changes. |
| 6 | Case-sensitive script lookup | Add/test exact-case `PopulaceCutScenePlayer.lua` alias or rename on a case-sensitive runtime. | Actor class `1080120` resolves its script without depending on Windows case-insensitivity. |

## 2026-06-21 Replay Packet Status Checkpoint

- `SetCutsceneBookPacket` is implemented as opcode `0x01A3` and is queued from `Player` using quest-completion-backed replay bits. It is not a missing packet anymore.
- The remaining gap is live validation: compare completed/incomplete quest states against `JournalListWidget` mode `7` and `ReplayCutsceneSelectWidget` rows in an inn.
- `SetCutsceneBookPacket` is still not Lua-registered, so scripts cannot refresh replay availability directly after in-inn state changes unless the packet flow is exposed or refreshed from C#.
- Local `PopulaceCutscenePlayer` starts/delegates playback and ends the event quickly; use the native inn owner path for validation rather than generic `WidgetOpenCommand`.

## Generated artifacts

- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/skip_widget_flow.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/replay_widget_flow.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/cutscene_replay_skip_widget_contract_20260619/contract_summary.json`

## Summary counts

- Sources present: 19 / 19
- Source term hits: 166
- Function contracts: 75
- Skip flow rows: 6
- Replay flow rows: 7
- Probe rows: 6 after 2026-06-20 hand update

## 2026-06-21 Source-Truth Refresh

- `SetCutsceneBookPacket` is implemented as opcode `0x01A3`, size `0x150`, with the recovered 2048-bit completion payload shape. Older "all true" notes are historical; current inn login builds replay bits from persisted quest completion state.
- `playerWork.questScenarioComplete` is persisted through DB load/save and feeds the inn replay book, but `QuestStateManager.ForceQuestCompleteFlag` can diverge because it updates the quest manager bitstream rather than that replay-book work field.
- Local `PopulaceCutscenePlayer.lua` is a bridge/probe: it maps replay triggers, calls client functions, logs `[CutsceneReplay]`, and ends the event. Retail replay selector behavior, `ReplayCutsceneSelectWidget`, journal mode `7`, and skip widgets are still recovered-only owner-bound surfaces.
- No distinct local `EventPlay` implementation was found. Current cutscene plumbing is `EventStart`/`EventUpdate` plus send-side `KickEventPacket`, `RunEventFunctionPacket`, and end-event flow.
- Do not expose raw replay/skip widgets through `WidgetOpenCommand`. Validate through inn zone `244`, actor `1080120`, completed/incomplete quest bits, playback/music cleanup, and clean event return.
- `24211`/`24212` are data-ish route probes, `24241` is mutation-capable journal command territory, and `24312` is not replay authority. Keep route probes logging-only.
