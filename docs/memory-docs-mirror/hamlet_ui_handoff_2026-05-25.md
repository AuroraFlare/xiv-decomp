# Hamlet UI Handoff - 2026-05-25

## Workspace

- Repo: `C:\Users\drime\source\repos\AuroraFlare\FF14-Memory`
- Main logs for this work:
  - `Map Server\bin\Release\Logging\2026-05-25\map.log`
  - `Map Server\bin\Release\Logging\2026-05-26\map.log`
- Test character: `Digital Fizz`
- Test hamlet: Hyrstmill
- Most recent visible HUD before the latest patch: the safe guildleve-compatible fallback showed `Official Behest`, not the true Hamlet Defense UI.
- Latest client patch safety pass: all widget alias targets touched during testing are restored to stock. Details are in "Temporary loose-widget alias result".
- Latest live instrumentation pass: x32dbg fresh-create and Reset UI control testing on 2026-05-27 proved the client reaches the generic UI create/open path, but corrected an earlier assumption: `00694C70` returning `eax=0` and `00538A87` storing `0` are not automatically fatal, because visible Reset UI prompts can take the same zero-return path. Details are in "ProcMon and x32dbg live-client pass".

## Current Goal

Recover enough of the FFXIV 1.0 Hamlet Defense client UI path to open or populate the proper Hamlet score/window UI instead of the fallback Behest/guildleve HUD. We are also trying to identify useful opcodes, packet direction, payload shape, and client event calls.

## 2026-05-28 DAT Cutscene Lead

Local cutscene replay data does include Hamlet opening and ending scenes. The replay/catalog IDs and scene keys are:

```text
11082008 -> ham0s201 -> The Battle for Aleport (Opening)
11082009 -> ham0s202 -> The Battle for Aleport (Ending)
11082010 -> ham0f301 -> The Battle for Hyrstmill (Opening)
11082011 -> ham0f302 -> The Battle for Hyrstmill (Ending)
11082012 -> ham0w201 -> The Battle for the Golden Bazaar (Opening)
11082013 -> ham0w202 -> The Battle for the Golden Bazaar (Ending)
```

Sources: `docs\Dat Mining\cutReplay.csv` has the numeric id to `ham0*` scene-key mapping; `docs\Dat Mining\xtx_cutReplay.csv` has the localized display names. This is not yet the live startup trigger. Treat it as evidence that bare `noticeEvent` is incomplete and the retail entry path likely needs a cutscene/movie delegate using one of these `ham0*` keys before the title/HUD/result state gates line up.

Implementation experiment now wired:

- `HamletDefenseData` stores the mined opening/ending scene keys per hamlet.
- `!testhamlet retailstart <hamlet>` now runs the retail intro lifecycle in the current public Hamlet zone, kicks `noticeEvent` with an `opening` phase, and uses the hamlet opening scene key. It no longer enters a private content area by default because that transition can crash the stock client.
- `!testhamlet retailinstance <hamlet>` preserves the old private-content-area path as an explicit unsafe probe.
- `Data\scripts\directors\Hamlet\Defense.lua` resolves the cutscene replay quest actor `Etc202` and calls one selectable cutscene trigger before `StartHamletDefense()`.
- The intro auto-commence fallback is now 15 seconds so a real cutscene has time to answer before the duty starts anyway.

Live result from 2026-05-28: default `etcdelegate` did run for Hyrstmill and logged `scene=ham0f301 replayActor=Etc202`, but the client immediately answered the `noticeEvent` with `params=false` and no visible cutscene. `nq`, `nqdelegate`, and `directordelegate` then did the same thing: each logged the selected mode, received `noticeEvent params=false`, and proceeded straight into the duty with no visible cutscene. So the scene id is likely right, but the Hamlet director `noticeEvent` is probably the wrong owner/context for cut replay startup.

The DAT/SQL trail now points at the inn replay system instead of a direct duty-start movie call:

- `Data\sql\gamedata_quests.sql` maps replay category `110820` to static quest actor `Etc202`.
- `Data\sql\gamedata_actor_class.sql` has `1080120` as `/Chara/Npc/Populace/PopulaceCutScenePlayer`, display name `4010013`, The Unending Journey.
- `Data\sql\server_eventnpc_spawn_locations.sql` spawns that actor in inn zone `244` as `inn_grid_cutscene`, `inn_uld_cutscene`, and `inn_limsa_cutscene`.
- `Map Server\Packets\Send\Player\SetCutsceneBookPacket.cs` already sends an all-true cutscene book when the player is in an inn.
- `Data\scripts\base\chara\npc\populace\PopulaceCutscenePlayer.lua` is now a probe that calls the likely native `eventTalkStep0` menu and logs follow-up returns with `[CutsceneBookProbe]`.

Live inn replay result from 2026-05-28: the user selected and successfully played both `The Battle for Hyrstmill (Opening)` and `The Battle for Hyrstmill (Ending)` from The Unending Journey/journal. That confirms the local client can play `ham0f301` and `ham0f302`; the scene ids/assets are valid. The map log did not show `[CutsceneBookProbe]`, `eventTalkStep*`, `ham0f301`, `ham0f302`, or a replay-specific server callback when the journal row was selected, so the replay selection appears to be mostly client-side after `SetCutsceneBookPacket`.

Retail sequence note from the user: in live Hamlet Defense, the cutscene fades in, the gold non-cutscene `Duty Commenced` title graphic appears, that graphic fades out, then the live Hamlet widget appears at top-left. The `worldMaster` text id `50011` (`You are now bound by duty.`) attention probe rendered only the small blue generic bound-by-duty box and did not open the Hamlet widget. The start path now sends that id only as an `attention` data packet to avoid duplicate chat/log lines. This proves the generic attention route works, but the missing widget gate is still the retail duty-title/content bootstrap, likely involving `HamletDefenseTitleWidget1/2/3` before `HamletDefenseWidget`.

Latest public-zone result from 2026-05-28: `!testhamlet retailstart hyrstmill` no longer crashed, but it produced no cutscene and showed the Behest/guildleve HUD. The log showed `client=path=/Director/Guildleve/PrivateGLBattleSweepNormal, params=guildleve`, so the client was doing exactly what we asked: instantiating the guildleve-compatible fallback. The next `minimal` no-arg profile then produced client error `40000(4)` with `GuildleveBaseClass:init()` reporting `invalid argument: 1, integer`, so the guildleve class path requires an integer init payload. Follow-up `params=hamlet` and `params=raid` tests removed the literal `Official Behest` title but still rendered the guildleve widget family; the server sent the delayed Hamlet HUD bootstrap (`commandRequest`, generic `widgetCreate`, `macroRequest`, widget `0x1B`, `hamletDefScore`, `hamletDefScoreAll`, native score packet) and the client accepted the packets, but the shell did not become the true Hamlet widget. `params=guildleve` remains the explicit Behest control. Current conclusion: init params can alter the guildleve shell, but `/Director/Guildleve/PrivateGLBattleSweepNormal` cannot become the Hamlet UI; the remaining blocker is finding the real Hamlet director/content bootstrap route or an event path that opens `HamletDefenseTitleWidget*` / `HamletDefenseWidget`.

DAT mining follow-up from 2026-05-28: `/Chara/Npc/Populace/PopulaceHamletPushEvent` is now the best live-start owner candidate. Actor classes `1200360-1200362`, `1200372`, `1200381`, and `1500435-1500437` use that path, and `docs\Dat Mining\populaceHamletPushEvent.csv` contains the Hamlet Defense quartermaster/supply-cache text namespace. A new debug probe is wired:

```text
!testhamlet pushnotice hyrstmill
!testhamlet pushnotice 1500437
!testhamlet pushprobe hyrstmill
```

`pushnotice` spawns a HamletPushEvent actor and kicks its `noticeEvent`; `pushprobe` spawns the same temporary actor with a push circle. If the client returns `EventStart`, `Data\scripts\base\chara\npc\populace\PopulaceHamletPushEvent.lua` logs through `[HamletPushEventProbe]`, closes the probe event, and starts the public retail lifecycle after a short delay. This tests whether the missing retail sequence is specifically gated on a PopulaceHamletPushEvent owner before the director/duty start.

Live result from 2026-05-29: `!testhamlet pushnotice 1500437` did fire the temporary HamletPushEvent actor and returned through `pushDefault`; the probe script started the direct Hamlet lifecycle after the event closed. The stock client did not crash, but the top-left UI stayed in the `Official Behest`/guildleve family and never changed into the true Hamlet widget. This is useful negative evidence: `/Chara/Npc/Populace/PopulaceHamletPushEvent` is a valid retail owner/trigger candidate, but the push-event actor by itself does not select the Hamlet HUD family. The remaining widget gate is still the client director/content bootstrap, not only the event owner.

Tutorial instance/widget lead from 2026-05-29: the existing tutorial scripts are now a strong offline research target because they show both sides of the problem: a working forced-widget packet path and a working instance-style client director bootstrap. The widget helpers route through `Player.SendDataPacket(...)`, which builds player-sourced `GenericDataPacket` opcode `0x0133`; `Data\scripts\tutorial.lua` maps the tutorial widget helpers to these generic data payloads:

```text
showTutorialSuccessWidget(player, textId) -> player:SendDataPacket(2, nil, nil, textId)
openTutorialWidget(player, controllerType, widgetId) -> player:SendDataPacket(4, nil, nil, controllerType, widgetId)
closeTutorialWidget(player) -> player:SendDataPacket(5)
endTutorialMode(player) -> player:SendDataPacket(7)
startTutorialMode(player) -> player:SendDataPacket(9)
```

The city combat tutorial directors (`QuestDirectorMan0g001`, `QuestDirectorMan0l001`, `QuestDirectorMan0u001`) call `startTutorialMode`, `openTutorialWidget`, `closeTutorialWidget`, and `showTutorialSuccessWidget` inside tutorial instances while stepping `noticeEvent` forward with `kickEventContinue`. The tutorial guildleve script uses `/Director/Guildleve/PrivateGLBattleTutorial` with the same `0x4e25, glId, aetherytePlaceCode, markerX, markerY, markerZ` init shape as normal guildleves, then calls `StartGuildleve()` and `SyncAllInfo()`. That is the more useful Hamlet clue: the client director path plus init tuple selects the widget family before the later work-sync packets populate it.

Interpretation: the direct tutorial payload ids are tutorial-specific and should not be treated as a direct `Window_HamletDefenseWidget` opener. Keep them as a positive control for forced-widget delivery. The actionable comparison is whether Hamlet can be made to instantiate a non-sweep instance director profile cleanly; if the tutorial guildleve profile changes the HUD family inside the Hamlet lifecycle, the remaining Hamlet task is to recover the equivalent Hamlet director/init tuple and content-group state.

Implementation experiment now wired:

```text
!testhamlet uiprobe tutorialcontrol
!testhamlet uiprobe tutorialhamlet
!testhamlet uiprobe tutorialcombo
!testhamlet uiprobe tutorialclose
!testhamlet retailtutorial hyrstmill
!testhamlet uiprobe titleindex
!testhamlet uiprobe titlecontainer
!testhamlet uiprobe dutytitle
!testhamlet uiprobe titleform
```

`tutorialcontrol` sends the known tutorial `0x0133 GenericData` control path: `startTutorialMode` (`9`) plus `openTutorialWidget` (`4, nil, nil, keyboard, 18`). This should prove whether the normal forced tutorial widget can still open in the Hamlet test context. `tutorialhamlet` starts tutorial mode, then sends the existing Hamlet widget-index bootstrap (`0x0132 widgetCreate` index `0x1B`), Hamlet score requested-data packets, and native compact `0x01A8`. `tutorialcombo` combines the visible tutorial control widget with the Hamlet bootstrap/score sequence. `tutorialclose` sends `closeTutorialWidget` (`5`) and `endTutorialMode` (`7`) as the cleanup helper.

`retailtutorial` is the comparison probe for the user's intended tutorial lead. It runs the safe public Hamlet retail lifecycle, but instantiates the client director as `/Director/Guildleve/PrivateGLBattleTutorial` and returns the regional tutorial leve tuple: Aleport -> `10801, place 5`, Hyrstmill -> `12401, place 12`, Golden Bazaar -> `11601, place 6`, each with the matching `gamedata_guildleve_mapmarkers` marker. Expected result is not Hamlet UI; the useful signal is whether the stock client switches from the sweep/Behest shell to the tutorial guildleve family. If it does, the widget family gate is confirmed to live in the director path/init tuple. If it does not, the missing factor is likely private-content or content-group state around the director instantiate.

Live result from 2026-05-29: `!testhamlet retailtutorial hyrstmill` rendered the Gridania tutorial guildleve `Spore Spoor`/`Eliminate the target enemies` HUD while the server-side Hamlet lifecycle still spawned carts and sent Hamlet chat. That confirms the client consumed the tutorial director path/init tuple exactly; the failure is not tuple delivery. It is also negative evidence for more guildleve-shaped profiles: `/Director/Guildleve/PrivateGLBattleTutorial` remains in the GuildleveExecutionWidget family, not the Hamlet title/HUD family.

Static follow-up: `ffxivgame.exe` contains `Window_HamletDefenseWidget` in the global execution-widget table, but a binary string pass did not find `Window_HamletDefenseTutorialWidget`. The DAT asset `sqwt\widget\HamletDefenseTutorialWidget.form/.tpl` exists, so treat it as a real asset, but not yet as a known global widget-table target.

Title bootstrap follow-up: `HamletDefenseData.titleWidgetIndex` is `1/2/3` for Aleport/Hyrstmill/Golden Bazaar, while `raidDungeonId` is `8/9/10`. Safe probes now target that separate title selector. `!testhamlet uiprobe titleindex` sends the normal bootstrap, then `widgetCreate` with the current Hamlet `titleWidgetIndex`, followed by the same Hamlet score data. `!testhamlet uiprobe titlecontainer` tries the existing widget-container helper around the title selector using both `HamletDefenseTitleWidgetN` and `Window_HamletDefenseTitleWidgetN`, then sends the same score data. Live result from the user on 2026-05-29: both stayed in the `Official Behest`/guildleve HUD. The map log showed `titleindex` sent cleanly with no useful client response, while `titlecontainer` produced the already-known empty `0x012E EventUpdate` replies (`serverCodes=0x30400000`, step `0x5`, no params). That means the title index/name helper path is alive but still not enough to load the Hamlet title/widget.

Two follow-up probes remain in the same non-KickEvent safety class. `!testhamlet uiprobe dutytitle` tries the generic retail `DutyCommencedWidgetN` / `Window_DutyCommencedWidgetN` names in the widget-container helper, because the visible gold title may be the generic Duty Commenced widget using Hamlet art. `!testhamlet uiprobe titleform` calls `_loadForm` with the Hamlet title, Duty Commenced, and live Hamlet widget form-name candidates, then sends the same score data. If these also produce only empty `0x012E` replies or no visible file load, stop doing name/index probes and move to capture/IDA recovery of the actual Hamlet title bootstrap.

Live result from 2026-05-29: `tutorialcontrol` and `tutorialcombo` both showed only the normal `Defeat the Enemy` tutorial widget. `tutorialhamlet` showed nothing visible. The map log confirms `tutorialcombo` sent the tutorial generic-data opener, the existing `0x0132 widgetCreate` Hamlet index `0x1B`, Hamlet score requested-data packets, and native compact `0x01A8`; the Hamlet side still did not render. Conclusion: `0x0133` tutorial generic data is a good positive control for forced-widget delivery, but tutorial mode does not unlock the Hamlet widget/bootstrap path by itself. Keep `tutorialcontrol` around for validating ProcMon/logging, but do not treat the tutorial packet ids as the direct Hamlet fix.

Failed implementation note: `PrivateArea` internally constructs itself with `isInstanceRaid = true`, but its client instantiate params historically send the instance-raid slot as `false`. Flipping that slot to `true` globally made the stock client crash on private-area entry/teleport, so the default has been restored to `false`. Do not re-enable that as a blanket fix; future instance-raid probes need a narrower `_setInstanceRaid`/director-state path or a captured retail instantiate payload.

Latest crash boundary: after the flag rollback, `!testhamlet retailstart hyrstmill` still crashed the stock client when it entered the private Hamlet content area. The server log showed no server exception: it created the private content area, kicked the opening event, and later auto-commenced, with outgoing bursts including content-group/state packets. Default `retailstart` has therefore been changed to stay in public Hyrstmill and run only the intro/fallback lifecycle; the old private-area version is now `retailinstance` and should be treated as unsafe.

Useful client asset/function breadcrumbs from the installed client:

```text
sqwt\widget\DutyCommencedWidget1/2/3.form/.tpl
sqwt\widget\HamletDefenseTitleWidget1/2/3.form/.tpl
sqwt\widget\HamletDefenseTutorialWidget.form/.tpl
sqwt\common\DutyCommenced1/2/3.<lang>.le.spk/.gtex
sqwt\common\HamletDefenseTitle1/2/3.<lang>.le.spk/.gtex
ffxivgame.exe string: _setInstanceRaid
ffxivgame.exe string: Window_HamletDefenseWidget
ffxivgame.exe string: _countHamletDefenseScore / _getHamletDefenseScore / _getHamletDefenseScoreAll
ffxivgame.exe string: _countHamletSupplyRanking / _getHamletSupplyRanking
```

Interpretation: the DAT/client side clearly has separate start-title widgets and score/ranking receivers. `0x01A8 HamletDefenseScore` and `0x01A6 HamletSupplyRanking` are real, but they are not the gold start-title path by themselves.

Opcode and packet-data status, as of 2026-05-29:

- `0x01A8 HamletDefenseScore`: opcode confirmed, and the native compact score payload is good enough for safe testing. The client accepts the packet, including the current `payload=0x105`, `shape=native-compact`, `rating=2`, `victory=True`, and single-row test data. This is real score/result data, but it does not open the Hamlet widget or score window by itself.
- `0x01A6 HamletSupplyRanking`: opcode confirmed as the Hamlet supply-ranking path. A later IDA pass recovered the native fixed buffer shape as `20 * 0x4C = 0x5F0` bytes. The empty probe is still the only exposed safe command because the old guessed `0x60` byte sample crashes the stock client; validate the gated native-shape one-row probe before exposing non-empty ranking data.
- `0x0132 EventFunction`: known working transport for `commandRequest`, `widgetCreate`, `macroRequest`, and mined function-name probes such as `_waitForHamletDefenseScore`. These packets are accepted and can produce empty client replies, but no tested `widgetCreate` number or title/widget name has selected `HamletDefenseTitleWidget*` or `HamletDefenseWidget`.
- `0x0133 GenericData`: known working transport for tutorial widget payloads and `requestedData hamletDefScore` / `hamletDefScoreAll`. The tutorial path proves forced-widget generic data works, but it only opens the normal tutorial widget and does not unlock Hamlet.
- `0x012F`, `0x012D`, `0x012E`: KickEvent, EventStart, and EventUpdate are understood well enough to test event-flow hypotheses. Unsafe kick probes can start a real `noticeEvent`, but they can also trap the client in a bad event/UI state. Empty `0x012E` replies usually mean the function path ran but did not produce a useful widget/state transition.
- `0x0137 SynchMemory`: still useful for the visible guildleve-style duty counters and objective state, including carts, targets, and timer-style work values.

Current bottom line: we have several Hamlet-related opcodes and one accepted native score payload, but we do **not** yet have the retail Hamlet duty bootstrap. The missing piece is the packet/director/content-state sequence that makes the client choose `HamletDefenseTitleWidget*` and `HamletDefenseWidget` instead of `GuildleveExecutionWidget` / `Official Behest`. Until that gate is recovered, `0x01A8` score data and `0x0132`/`0x0133` widget/data probes are accepted payloads landing in the wrong UI family.

Cutscene trigger modes now available:

```text
!testhamlet cutmode etcdelegate
!testhamlet cutmode directordelegate
!testhamlet cutmode direct
!testhamlet cutmode nq
!testhamlet cutmode nqdelegate
!testhamlet cutmode off
```

After changing mode, cancel/restart the retail lifecycle test:

```text
!testhamlet cancel
!testhamlet cutmode nq
!testhamlet retailstart hyrstmill
```

If `retailstart` produces no new `[HamletCutscene]` marker, make sure the player is in public Hyrstmill and there is no active test director:

```text
!testhamlet cancel
!testhamlet goto hyrstmill
!testhamlet cutmode nqdelegate
!testhamlet retailstart hyrstmill
```

Only `direct` remains untested among the simple Hamlet-director modes, but confidence is low because every owner/delegate variant returned from the same `noticeEvent` context without opening a cutscene. Better next test: use the widened `!testhamlet uidebug on` / `!testhamlet uiraw on` instrumentation while in an inn, reselect the Hyrstmill replay rows, and compare any inn replay opcodes against the silent successful playback.

```text
!warp gridaniainn
!testhamlet uidebug on
!testhamlet uiraw on
```

## Important Safety Notes

Do not run these casually:

```text
!testhamlet uiprobe ranking
!testhamlet ranking sample
!testhamlet uiprobe scorekickunsafe
!testhamlet uiprobe scoreafterkickunsafe
!testhamlet uiprobe scorekickopenunsafe
```

Why:

- Non-empty guessed `0x01A6 HamletSupplyRanking` payloads crash the stock client. The recovered native parser expects a full `0x5F0` byte payload, so do not re-enable the old `0x60` byte sample.
- Kick-event probes using `noticeEvent` can put the client into a blocking event state where the mini menu disappears and movement/input is locked. Relogging or restarting the client clears it.
- The safe aliases `scorekick`, `scoreafterkick`, and `scorekickopen` have been changed to return warnings instead of sending packets. The unsafe suffix is now required to deliberately test that path.

Safe commands worth keeping:

```text
!testhamlet hyrstmill
!testhamlet cancel
!testhamlet freshcreate
!testhamlet status
!testhamlet uidebug on
!testhamlet uiraw on
!testhamlet cutmode nq
!testhamlet uiprobe score
!testhamlet uiprobe scorewait
!testhamlet uiprobe scorenative
!testhamlet uiprobe scorerun
!testhamlet uiprobe scoredelegate
!testhamlet uiprobe scoreopen
!testhamlet uiprobe scoreplayer
!testhamlet uiprobe scoredirector
!testhamlet uiprobe scorebootstrap
!testhamlet uiprobe commandbootstrap
!testhamlet uiprobe scorealldirector
!testhamlet uiprobe scoreallworld
!testhamlet uiprobe scoreend
!testhamlet scoremenu empty
!testhamlet scoremenu current
!testhamlet scoremenu single
!testhamlet scoremenu full
!testhamlet ranking empty
```

`!testhamlet uiprobe scoreend` and `!endevent` are recovery helpers, but they may not rescue a client that is already deeply locked in the unsafe kick path. `scoreend` now uses the safer zero-type close that behaved better during delayed-close testing. Relogging is still the reliable recovery.

`!testhamlet uiprobe commandbootstrap` is a safe post-alias experiment. It sends the fuller login-style `0x0132 EventFunction` bootstrap (`commandForced`, `commandDefault`, `commandWeak`, `commandContent`, `commandJudgeMode`, `commandRequest`, `widgetCreate`, `macroRequest`) followed by the safe score data path. It does not send `KickEvent`.

`!testhamlet freshcreate` is the safe x32dbg resume helper for the first-create trace. It enables Hamlet UI raw logging, resets the client director route to the stable guildleve-compatible profile, logs `[HamletUiFreshCreate]` pre-start/post-start/sync-start markers, and starts Hyrstmill if no test is active. If a Hamlet test is already active, it refuses to mask the warm-cache case and tells you to cancel plus reconnect/relog before retrying.

## Last Code State

Files actively touched during this UI/opcode work:

- `Map Server\Hamlets\HamletDefenseManager.cs`
  - Added `scoremenu` variants: `empty`, `current`, `single`, `full`.
  - Added `ranking empty` only; non-empty ranking is disabled.
  - Added many `uiprobe` modes for Hamlet UI experiments.
  - Added Hamlet UI debug/raw logging helpers.
  - Added `freshcreate` x32dbg helper that arms raw logging, resets the safe client route, and starts a clean Hamlet test only when no active test exists.
  - Added source-actor variation probes for `0x01A8`, `0x0132`, and `0x0133`.
  - Added safe `commandbootstrap` probe using the fuller login-style EventFunction sequence.
  - Added `0x0130 RunEventFunction` probes.
  - Added `0x012F KickEvent` probes, then disabled the safe aliases because they can lock the client.
  - Added `scoreend` event-close helper.
- `Data\scripts\commands\gm\testhamlet.lua`
  - Routes `freshcreate`, `uiprobe`, `scoremenu`, `ranking`, `uidebug`, `uiraw`, `uistatus`, `uipath`, `uiparams`, and `cutmode`.
  - Help text now omits the unsafe kick probes.
- `Data\scripts\commands\gm\endevent.lua`
  - Changed `player:endEvent()` to `player:EndEvent()`.
- `Data\scripts\directors\Hamlet\Defense.lua`
  - Hamlet director `onEventStarted(...)` now attempts the selected intro cutscene trigger, starts the duty, and zero-closes the event so client input does not remain locked after director/UI probes.
- `docs\hamlet_defense_framework.md`
  - Updated with packet/UI findings.
- `docs\opcodes\README.md`
  - Updated with Hamlet opcodes, probes, and crash/lock notes.
- Other already-dirty related files include:
  - `Map Server\Actors\Director\HamletDefenseDirector.cs`
  - `Map Server\ConfigConstants.cs`
  - `Map Server\PacketProcessor.cs`
  - `Map Server\Packets\Send\Actor\_0x132Packet.cs`
  - `Map Server\Packets\Send\Hamlet\HamletDefenseScorePacket.cs`
  - `Map Server\Packets\Send\Hamlet\HamletSupplyRankingPacket.cs`
  - `Map Server\WorldManager.cs`
  - `tools\mine_hamlet_ui_widgets.py`
  - `tools\outputs\hamlet_ui\`
  - `Data\map_config.ini` is also dirty; do not revert it without checking whether it contains user/local config changes.

## Build Command

Use this after pulling the current work into a new chat/session.

Important: use the throttled single-project build. Earlier broad/parallel build attempts destabilized the test PC.

```powershell
dotnet build "Map Server\Map Server.csproj" -c Release -m:1 -p:BuildInParallel=false
```

Last verification on 2026-05-26: this exact throttled Release build completed with 0 errors and 169 warnings. The warnings were existing environment/project warnings, mainly net6.0 end-of-support, NuGet vulnerability lookup unavailable, unresolved framework reference/conflict warnings, analyzer load warnings, and pre-existing compiler warnings.

Do not switch to a solution-wide or highly parallel build unless there is a specific reason.

## Packet Findings

### 0x01A8 HamletDefenseScore

- Public opcode notes name `0x01A8` as `HamletDefenseScore`.
- The experimental builder sends empty/current/single/full variants.
- The client accepts safe payloads, but no retail Hamlet score UI opens.
- Source actor variations were tested:
  - world-sourced
  - player-sourced
  - director-sourced
  - all packets sourced from world/director
- Result: accepted, no crash, no UI. Source actor is probably not the primary missing piece.

### 0x01A6 HamletSupplyRanking

- Public opcode notes name `0x01A6` as `HamletSupplyRanking`.
- Empty payload is safe.
- A guessed non-empty/sample payload crashed the stock client.
- Keep ranking sample disabled until a real retail layout is recovered.

### 0x0132 EventFunction

Tested with:

```text
commandRequest
widgetCreate
macroRequest
_waitForHamletDefenseScore
_countHamletDefenseScore
_getHamletDefenseScore
_getHamletDefenseScoreAll
```

Finding:

- Sends cleanly.
- Does not open the score UI.
- Looks more like registration/bootstrap than direct function invocation.

### 0x0130 RunEventFunction

Tested modes:

```text
!testhamlet uiprobe scorerun
!testhamlet uiprobe scoredelegate
!testhamlet uiprobe scoreopen
```

Findings:

- `scorerun` sent the native Hamlet score function names directly.
- `scoredelegate` sent them through `delegateCommand`.
- `scoreopen` added likely widget opener names:
  - `loadTextData`
  - `_waitForHamletDefenseScore`
  - `_countHamletDefenseScore`
  - `_getHamletDefenseScore`
  - `_getHamletDefenseScoreAll`
  - `operateUI`
  - `openHamletDefenseWidget`
  - `openHamletDefenseScoreWidget`
- Without a live kick event, the client sends empty `0x012E EventUpdate` replies.
- No score UI opens.

Typical empty `0x012E` reply fields:

```text
Source Actor: 0x1
Caller Actor/serverCodes: 0x30400000
Val1/unknown1: 0x1
Val2/unknown2: 0xCC6BD671
Step/eventType: 0x5
Params: blank
```

### 0x012F KickEvent and 0x012D EventStart

`scorekickopen` and the split `scorekick`/`scoreafterkick` path tested outgoing `0x012F KickEvent` for the Hamlet director event name `noticeEvent`.

Important finding:

- The client responds with a real `0x012D EventStart`.
- Example from the log:

```text
HamletUiEventStart
owner=0x64C00002
event=noticeEvent
eventType=0x05
serverCodes=0x30400000
unknown=0x1DD99EDD
```

But:

- After this event is active, the later `0x0130` score widget calls do not produce the usual `0x012E` replies.
- The client can become locked in the event state: no mini menu, no movement.
- Conclusion: forcing `noticeEvent` is not the right path for opening the Hamlet score widget, or it requires a response/close sequence we do not know.

### 0x0133 GenericData

Tested requested data names:

```text
requestedData hamletDefScore
requestedData hamletDefScoreAll
requestedData hamletSupplyRanking
```

Finding:

- The packets send and log cleanly.
- They do not open the score UI by themselves.

### 0x0137 SynchMemory / SetActorProperty

Still useful for the live duty HUD/fallback Behest style UI:

- cart counters
- enemy defeated counters
- timer/objective work values
- guildleve-compatible HUD state

This remains the likely path for the visible on-screen objective list until the true Hamlet widgets are recovered.

## Runtime Test Chronology

### Earlier safe score probes

`!testhamlet uiprobe score`

- Sent `widgetCreate`, `requestedData hamletDefScore`, `requestedData hamletDefScoreAll`, and a single-row `0x01A8`.
- No crash.
- No Hamlet score UI.

`!testhamlet uiprobe scorewait`

- Sent client-native Hamlet score wait function plus score data.
- No UI.

`!testhamlet uiprobe scorenative`

- Sent the mined native score function names through `0x0132`.
- No UI.

`!testhamlet uiprobe scorerun`

- Sent four `0x0130 RunEventFunction` calls.
- Client replied with four empty `0x012E EventUpdate` packets.
- No UI.

`!testhamlet uiprobe scoredelegate`

- Sent four `delegateCommand` score calls.
- Client replied with four empty `0x012E` packets.
- No UI.

`!testhamlet uiprobe scoreopen`

- Sent eight `delegateCommand` calls including opener candidates.
- Client replied with eight empty `0x012E` packets.
- No UI.

### Unsafe kick probes

`!testhamlet uiprobe scorekickopen`

- Sent bootstrap, `KickEvent noticeEvent`, opener calls, requested data, and `0x01A8`.
- Client sent `0x012D EventStart`.
- No normal `0x012E` replies after the opener sequence.
- No UI.

`!testhamlet uiprobe scorekick` then `!testhamlet uiprobe scoreafterkick`

- `scorekick` opened `noticeEvent`.
- `scoreafterkick` detected active event:

```text
owner=0x64C00002,event=noticeEvent,type=0x05
```

- It then sent eight `0x0130` calls, `0x0133` score data, and `0x01A8`.
- Client locked: mini menu disappeared and movement/input stopped.
- User reported `!endevent` and `scoreend` did not rescue the already locked state.
- Relog/restart is the recovery.

### Immediate close probe

`!testhamlet uiprobe scorekickcloseunsafe`

- Fixes `EndEventPacket` to write the active event owner actor id instead of zero.
- Sends only `KickEvent noticeEvent` followed immediately by explicit `EndEvent noticeEvent` for the Hamlet director.
- Purpose: validate whether the client event layer can be opened and closed without locking input before sending any score widget function calls inside the event.
- This is still warning-gated with the `unsafe` suffix because it deliberately touches `noticeEvent`.

### Delayed close probes

`!testhamlet uiprobe scorekickdelaycloseunsafe`
`!testhamlet uiprobe scorekickdelayclose0unsafe`

- Sends `KickEvent noticeEvent`, waits 750ms, then checks the player's active event state.
- If the client has reported active `noticeEvent`, sends `EndEvent` using either the active event type or forced type `0x00`.
- Purpose: test whether the immediate close failed only because it arrived before the client reported `EventStart`.
- These are still unsafe because they deliberately open the blocking `noticeEvent` path.

Observed 2026-05-25:

- Active-type delayed close (`type=0x05`) sent `EndEvent` after the client `EventStart`, but still produced late repeated `noticeEvent` starts for the same caller.
- Zero-type delayed close (`type=0x00`) sent after `EventStart` did not show the same late `Could not find actor ... noticeEvent` echo in the nearby log window.
- Neither path opened a visible Hamlet widget.

### Delayed open plus zero-close probe

`!testhamlet uiprobe scorekickdelayopen0unsafe`

- Sends `KickEvent noticeEvent`.
- Waits 650ms for the client to report active `noticeEvent`.
- Sends the Hamlet score widget delegate sequence while the event is actually active.
- Sends `EndEvent noticeEvent` after 1800ms, using forced event type `0x00`.
- Purpose: test whether prior delegate calls failed because they were sent before the client had acknowledged `noticeEvent`.
- This is still unsafe because it deliberately opens the blocking `noticeEvent` path.

Observed 2026-05-25:

- Client accepted `noticeEvent` and sent `EventStart`.
- The delayed Hamlet score widget sequence was sent while the event was active.
- The zero-type delayed close cleaned up without the late `Could not find actor ... noticeEvent` echo seen on active-type close.
- No visible Hamlet score UI opened, and no useful client follow-up packet was observed. Timing was not the missing piece for `noticeEvent`.

### CommandContent-hosted score probe

`!testhamlet uiprobe scorecommandcontentunsafe`

- Sends a real `KickEvent commandContent` using the known `TradeExecuteCommand` static actor.
- Waits 650ms for the client to report active `commandContent`.
- Sends the same Hamlet score widget delegate/data sequence while the command event is active.
- Sends `EndEvent commandContent` after 4000ms, using forced event type `0x00`.
- Purpose: test whether Hamlet score widgets need a command UI event host instead of the Hamlet director `noticeEvent` host.
- This is still unsafe because it deliberately opens a command event, but it avoids the confirmed-bad `noticeEvent` host.

## Client Assets and Mining

### Temporary loose-widget alias result

A reversible local-only shim was added and expanded:

```text
tools\hamlet\hamlet_ui_widget_alias.py
```

It aliases Hamlet widget `.form/.tpl` pairs over known client widget hosts with SHA-256 manifest backups under:

```text
%LOCALAPPDATA%\AuroraFlare\FF14-Memory\client-patch-backups\hamlet-ui\
```

The tool is dry-run by default. Writes require `--apply`. It warns if the client or launcher is running, refuses unknown patched target states unless forced, and supports restore/status per target.

Modes tested:

```text
hud
score
ranking
```

Targets supported by the tool:

```text
guildleve -> GuildleveExecutionWidget
trade -> TradeWidget
gear -> EquipWidget
craftstart -> CraftStartWidget
craftprogress -> CraftProgressWidget
craftrepair -> CraftRepairWidget
status -> StatusWidget
journal -> JournalListWidget
itemlist -> ItemListWidget
mapnav -> MapNavigationWidget
```

Validation:

- `python -m py_compile tools\hamlet\hamlet_ui_widget_alias.py` passed on 2026-05-26.
- Safety status pass on 2026-05-26 verified these touched targets are stock/restored:
  - `guildleve`
  - `trade`
  - `gear`
  - `craftstart`
  - `status`
  - `journal`
  - `itemlist`
  - `mapnav`
- `craftprogress` and `craftrepair` were stock/unmodified but have no backup baseline yet because they were not applied.

Per-target results:

- `guildleve`:
  - `hud`, `score`, and `ranking` alias modes were tested.
  - No Hamlet UI opened.
  - The safe server packet path still sent `guildleveWork/start`, `widgetCreate`, `hamletDefScore`, `hamletDefScoreAll`, and a full current `0x01A8` score payload.
  - The client map UI stopped working while a Hamlet widget was aliased over `GuildleveExecutionWidget`.
  - Restored and verified stock.
- `trade`:
  - Applied/restored during target exploration, but trade is awkward to exercise solo.
  - No useful Hamlet UI signal was found.
  - Restored and verified stock.
- `gear`:
  - `score` alias applied to `EquipWidget`.
  - No useful Hamlet UI signal was found when testing gear/equipment paths.
  - Restored and verified stock.
- `craftstart`:
  - `score` alias applied to `CraftStartWidget`.
  - Opening craft/start flow crashed or stopped the client.
  - Nearby logs showed `CraftCommand` through `commandJudgeMode` before the failure.
  - Treat `craftstart` as a failed/crashy host.
  - Restored and verified stock.
- `status`:
  - `score` alias applied to `StatusWidget`.
  - Score packet was sent, but no Hamlet UI opened.
  - Opening status triggered `RequestInformationCommand activegl` Lua nil-call errors and did not produce a useful Hamlet request.
  - Restored and verified stock.
- `journal`:
  - `score` alias applied to `JournalListWidget`.
  - `0x01A8 HamletDefenseScore` packets were sent at least twice.
  - No visible Hamlet UI and no useful client-side Hamlet/widget response.
  - Restored and verified stock.
- `itemlist`:
  - `score` alias applied to `ItemListWidget`.
  - Opening inventory/item list caused the flow to stop or close, but the client process stayed alive and attached.
  - `0x01A8` score packet was sent; no useful client-side Hamlet/widget response followed.
  - Restored and verified stock.
- `mapnav`:
  - `score` alias applied to `MapNavigationWidget`.
  - Multiple `0x01A8` score packets were sent.
  - No useful client-side Hamlet/widget response, map request, or event start appeared after the patched map/nav test.
  - Restored and verified stock.

Overall result:

- No Hamlet UI opened.
- Loose widget aliasing can disturb or crash host-specific UI flows, but it is not sufficient to bootstrap the Hamlet UI.
- The missing piece is likely a widget open/init packet, event owner, or content/director state gate, not merely the widget asset files.
- Do not continue random widget aliasing unless there is a new specific hypothesis.

Restore command pattern:

```text
python "tools\hamlet\hamlet_ui_widget_alias.py" restore --target <target> --apply
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target <target>
```

Known installed client widget files:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\GuildleveExecutionWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\GuildleveExecutionWidget.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\RaidDungeonExecutionWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\RaidDungeonExecutionWidget.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\ChocoboCaravanWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\ChocoboCaravanWidget.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseScoreWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseScoreWidget.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseRankingWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseRankingWidget.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseWidget.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefensePopupWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefensePopupWidget.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTitleWidget1.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTitleWidget1.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTitleWidget2.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTitleWidget2.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTitleWidget3.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTitleWidget3.tpl
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTutorialWidget.form
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\sqwt\widget\HamletDefenseTutorialWidget.tpl
```

Local mining output:

```text
tools\mine_hamlet_ui_widgets.py
tools\outputs\hamlet_ui\
tools\hamlet\hamlet_ui_asset_probe.py
tools\outputs\hamlet_ui_asset_probe\
```

`hamlet_ui_asset_probe.py` is read-only. The first run scanned `sqwt/widget`, `sqwt/widget_c`, `sqwt/system`, `sqwt/boot`, `sqwt/common`, and `script`; it saw 3,629 files, content-scanned 3,427 files, and found 58 Hamlet hits. All hits were filename hits, not plain ASCII/UTF-16 content hits. This suggests the client does not store the tested widget/event names as simple visible strings in the scanned UI/script assets.

Useful strings/functions already seen or tested:

```text
Window_HamletDefenseWidget
HamletDefenseScoreReceiver
HamletSupplyRankingReceiver
_waitForHamletDefenseScore
_countHamletDefenseScore
_getHamletDefenseScore
_getHamletDefenseScoreAll
hamletDefScore
hamletDefScoreAll
hamletSupplyRanking
```

### ProcMon and x32dbg live-client pass

Date: 2026-05-26

Purpose:

- Determine whether the private-server Hamlet test can make the stock client load the real Hamlet, Raid Dungeon, or Chocobo Caravan duty widget files.
- Determine whether the known widget-name pointer table can redirect the already-working Guildleve duty HUD path.
- Determine whether server-side director init path/profile changes can move the client off the Guildleve/Behest HUD path before widget creation.

Client widget-name table observed in x32dbg:

```text
table start: 0x012BA870
0x012BA89C -> 0x00FC1BCC -> Window_GuildleveExecutionWidget
0x012BA8D0 -> 0x00FC1D20 -> Window_RaidDungeonExecutionWidget
0x012BA8D4 -> 0x00FC1D44 -> Window_ChocoboCaravanWidget
0x012BA8DC -> 0x00FC1D80 -> Window_HamletDefenseWidget
```

Pointer patch tried:

```text
slot: 0x012BA89C
original bytes: CC 1B FC 00  ; Window_GuildleveExecutionWidget
test bytes:     80 1D FC 00  ; Window_HamletDefenseWidget
```

Notes:

- This is a RAM-only x32dbg patch. It disappears on client restart.
- The bytes must be edited as raw hex, not ASCII, Unicode, or UTF-8.
- Timing is a major limitation. If the client has already selected/created/cached the duty HUD, patching the slot afterward does not prove the redirect can or cannot work.
- Do not treat this as a safe production fix. It is only a live-client probe.

Late x32dbg call-chain trace:

```text
0066EF30..0066EFC3  generic widget-name table lookup/scanner
0066EF84             lea eax,[edi*4+012BA870]
0096ACD3             indirect call edx dispatches into 00538A68
00538A68             widget create/open routine for the active execution widget
00538A6A             call 0066EFD0
00538A6F             cmp [esi+27C],0
00538A76             jne 00538AD4
00538A87             mov [esi+27C],eax on the fresh-create path
00538AD4..00538AE7  reused-widget/cleanup return path
0096C237 / 0096ACD5 / 0096BF6D / 0096B0F1  generic callback/list plumbing
```

Live observations from the 2026-05-26 late trace:

- Breaks on the table lookup showed both the requested name and table entry resolving to `Window_GuildleveExecutionWidget`.
- `0096ACD3 call edx` resolved to `00538A68`, so `0096ACD3` is only a virtual/callback dispatch point.
- Inside `00538A68`, the active object/name annotations showed plain `GuildleveExecutionWidget`.
- The branch at `00538A76` was taken to `00538AD4`; `[esi+27C]` was already nonzero, so this trace was a reused/cached Guildleve widget instance, not a fresh creation.
- Returning upward from `00538A68` went through `0096C237`, `0096ACD5`, `0096BF6D`, and `0096B0F1`. Those frames appear to be generic callback/list plumbing. The call stack then degraded into heap/generated callback addresses, so continuing upward from there is not a good use of time.

Fresh-create x32dbg registry trace from 2026-05-27:

```text
00538A68             active execution-widget create/open routine
00538A6F             cmp [esi+27C],0
00538A76             jne 00538AD4
00538A79             call 0053CAA0
00538A7E             mov ecx,eax
00538A80             call 00694C70
00538A85             test eax,eax
00538A87             mov [esi+27C],eax
00538A8D             je 00538AD4
00694C70             helper that calls 008748E0 and returns the widget pointer or 0
008748E0             normalizes/dispatches the requested widget name
00874940             call 00874820
00874820             small string-to-registry-id lookup
```

Observed fresh-create path:

- After a full client restart and `!testhamlet freshcreate`, `[esi+27C]` was `0` at `00538A6F`, so `00538A76 jne 00538AD4` was **not** taken. This confirmed a real fresh-create pass rather than the reused-widget path.
- At `00538A79`, `0053CAA0` succeeded and returned a nonzero object pointer in `eax` (example observed: `01336A90`).
- At `00538A80`, `00694C70` was called with `ecx/eax` holding that object pointer. It returned `eax=0`.
- Therefore the failing half is not `0053CAA0`; it is the `00694C70 -> 008748E0 -> 00874820` registry lookup/create path.
- `008748E0` had `[esp+18] = "Window_GuildleveExecutionWidget"` and then normalized/compared the target as `"GuildleveExecutionWidget"`.
- `00874820` scanned a small registry table starting at `013506C8`, with entry stride `0x54` and total scanned span `0x2A0` (`8` entries).

Registry table dumped from `013506C8`:

```text
013506C8 -> None
0135071C -> Test
01350770 -> PcSearchSelectWidget
013507C4 -> PcSearchSelectWidget
01350818 -> PlayerInformationWidget
0135086C -> PcInformationWidget
013508C0 -> TargetParameterWidget
01350914 -> PlayerParameterWidget
```

Important interpretation:

- `GuildleveExecutionWidget`, `Window_GuildleveExecutionWidget`, `HamletDefenseWidget`, `RaidDungeonExecutionWidget`, and `ChocoboCaravanWidget` are **not** in this registry table.
- The earlier widget-name table at `012BA870` knows about duty execution widget names, but the fresh-create path is trying to resolve the selected execution widget through a common/player-widget registry context.
- Later Reset UI control tracing weakened the "wrong registry" conclusion: visible UI prompts can also miss this small table and still appear. Treat `013506C8` as a small special-case lookup/filter table, not as proven evidence of the main widget registry.
- The remaining useful question is no longer only "why did `00694C70` return `0`?" It is "what later/follow-up path makes normal UI appear after this zero-return path, and does the Hamlet execution widget fail to receive that follow-up?"

Reset UI control trace from 2026-05-27:

```text
00538A68             generic UI create/open routine hit by Configuration / Reset UI
00538A79             call 0053CAA0
00538A7E             mov ecx,eax
00538A80             call 00694C70
00538A85             test eax,eax
00538A87             mov [esi+27C],eax
00874940             call 00874820 during the inner lookup helper
008748A6             miss path from the small 013506C8 table
```

Observed Reset UI / Configuration control facts:

- Opening `Configuration` and clicking `Reset UI` both hit `00538A68`, proving this routine is generic UI plumbing and not Hamlet-specific.
- The visible reset confirmation prompt used `Window_CommonAskWidget`, normalized/compared as `CommonAskWidget`.
- `0053CAA0` returned a nonzero pointer for this control path (example observed: `eax=01336A90`).
- `00694C70` then returned `eax=0` at `00538A85`.
- `00538A87` stored `0` into `[esi+27C]`, and the branch toward `00538AD4` was taken.
- Despite that zero return/store path, the `CommonAskWidget` prompt was visible and usable in the client.
- Clicking `No` dismissed the prompt normally. Clicking `Yes` did not produce any obvious additional `00538A68` widget-create hit or make missing execution widgets appear.

Control interpretation:

- `eax=0` at `00538A85` / `00538A87` is not, by itself, proof that the UI action failed. It is normal for at least the visible Reset UI confirmation path.
- `00874820` and the `013506C8` table are probably not the decisive widget registry. `ConfigWidget` and `CommonAskWidget` also missed this table, yet those UI flows were visible.
- Do not spend more time manually stepping through every `013506C8` entry unless revalidating a dump. The table remains useful context, but it was a red herring as a primary failure explanation.
- Deep-stepping the fallback/helper path (`00445D20`, graphics/D3D/GDI/NVIDIA calls) can wander into driver code and destabilize or crash the client. Prefer breakpoints plus `F9`, `Alt+F9`, or `Ctrl+F9` to return to `ffxivgame.exe`.

Temporary breakpoint cleanup from the late trace:

```text
bc 00538A6F
bc 00538AAA
bc 00538AD4
```

Optional breakpoint to leave for future widget-create catches:

```text
bp 00538A68
```

ProcMon files checked:

```text
C:\Users\drime\Downloads\Logfile.CSV
C:\tmp\Logfile-filered.CSV
C:\tmp\hamlet-scoreopen-procmon.CSV
C:\tmp\hamlet-scoreopen-procmon-all.CSV
```

ProcMon filter used for the clean widget passes:

```text
Process Name is ffxivgame.exe
Path contains \sqwt\widget\
```

Observed widget loads:

- Baseline/safe Hamlet test, PID `38580`, around `7:30:02 PM`:
  - `GuildleveExecutionWidget.en.form` -> `NAME NOT FOUND`
  - `GuildleveExecutionWidget.form` -> `SUCCESS`
  - `GuildleveExecutionWidget.tpl` -> `SUCCESS`
  - No `HamletDefenseWidget`, `RaidDungeonExecutionWidget`, or `ChocoboCaravanWidget`.
- Cleaner baseline/safe Hamlet test, PID `11096`, around `7:52:35 PM`:
  - `GuildleveExecutionWidget.en.form` -> `NAME NOT FOUND`
  - `GuildleveExecutionWidget.form` -> `SUCCESS`
  - `GuildleveExecutionWidget.tpl` -> `SUCCESS`
  - No `HamletDefenseWidget`, `RaidDungeonExecutionWidget`, or `ChocoboCaravanWidget`.
- `/Director/DirectorBaseClass` plus `hamlet` params, PID `11932`, around `7:56:14 PM` to `7:56:18 PM`:
  - Normal UI/cutscene widgets loaded, such as `MainMenuWidget`, `ConsoleIconTrayWidget`, `LogWidget`, `PlayerParameterWidget`, `MiniMapWidget`, `CutSceneSkipWidget`, `ErrorDialogWidget`, `TutorialSuccessWidget`, `ChocoboRentalTimerWidget`, and `AchievementPopupWidget`.
  - No duty widget reached before the crash: no Guildleve, Hamlet, Raid Dungeon, or Chocobo Caravan execution widget open was captured.
- `/Director/DirectorBaseClass` plus `minimal` params, PID `40996`, around `8:04:06 PM`:
  - `GuildleveExecutionWidget.en.form` -> `NAME NOT FOUND`
  - `GuildleveExecutionWidget.form` -> `SUCCESS`
  - `GuildleveExecutionWidget.tpl` -> `SUCCESS`
  - No `HamletDefenseWidget`, `RaidDungeonExecutionWidget`, or `ChocoboCaravanWidget`.

x32dbg crash data:

```text
006E0184 C0000005 EXCEPTION_ACCESS_VIOLATION
caller: 007818A1
```

Observed twice:

- `/Director/DirectorBaseClass` plus `hamlet` params:
  - First-chance exception at `006E0184`.
  - Did not recover.
- `/Director/DirectorBaseClass` plus `minimal` params:
  - First-chance exception at `006E0184`.
  - Advanced to last-chance exception at the same address.
  - Did not recover.

Server-side command combinations tested:

```text
!testhamlet cancel
!testhamlet uipath /Director/DirectorBaseClass
!testhamlet uiparams hamlet
!testhamlet hyrstmill
```

Result:

- Hard client crash.
- No useful Hamlet/Raid/Caravan widget open was observed.
- This path/profile combination should be considered known-bad.

```text
!testhamlet cancel
!testhamlet uipath /Director/DirectorBaseClass
!testhamlet uiparams minimal
!testhamlet hyrstmill
```

Result:

- Hard client crash.
- ProcMon still observed `GuildleveExecutionWidget` and did not observe Hamlet/Raid/Caravan widgets.
- This confirms `/Director/DirectorBaseClass` is not a useful bootstrap path even with minimal args.

Worked:

- ProcMon can reliably show which `.form`/`.tpl` files the client loads when the duty HUD is created.
- x32dbg can attach to the 32-bit client and inspect the widget-name table.
- The safe Guildleve-compatible server path still creates a visible duty HUD and loads `GuildleveExecutionWidget`.
- The client files and static widget names for `RaidDungeonExecutionWidget`, `ChocoboCaravanWidget`, and `HamletDefenseWidget` are present and identifiable.

Did not work:

- No tested server-side path/profile caused the client to open `HamletDefenseWidget`.
- No tested server-side path/profile caused the client to open `RaidDungeonExecutionWidget`.
- No tested server-side path/profile caused the client to open `ChocoboCaravanWidget`.
- `/Director/DirectorBaseClass` crashed with both `hamlet` and `minimal` init profiles.
- Patching after the HUD begins building is timing-sensitive and did not prove a usable redirect path.

Current interpretation:

- The stock client still chooses the Guildleve/Behest execution HUD for the current private-server Hamlet flow.
- The real Hamlet, Raid Dungeon, and Chocobo Caravan widget assets exist locally, and their `Window_*` names exist in the client, but the tested server states did not make the client load them.
- `RaidDungeonExecutionWidget` and `ChocoboCaravanWidget` are useful landmarks because they sit next to `GuildleveExecutionWidget` and `HamletDefenseWidget` in the same widget-name table, but neither has been reached in live testing.
- The missing piece is upstream of widget file loading: likely a content/director state gate, instance/duty category, event owner, or widget-open/init call that differs from Guildleve.
- Do not keep probing `/Director/DirectorBaseClass`. Add it to the mental known-bad list unless code changes introduce a new safety wrapper or a more precise reason to retest.

Safe reset after any UI path/profile experiment:

```text
!testhamlet cancel
!testhamlet uipath default
!testhamlet uiparams guildleve
!testhamlet uistatus
```

Known-bad director class paths that triggered client error 40000:

```text
/Director/HamletDefense/HamletDefense
/Director/HamletDefense/HamletDefenseWidget
/Director/HamletDefense/Window_HamletDefenseWidget
```

Known-bad or non-useful director class paths that triggered hard crash:

```text
/Director/DirectorBaseClass
```

Do not ask the user to retest those paths unless something else has changed.

## About the PDF Research Report

The user supplied:

```text
C:\Users\drime\Downloads\Final Fantasy XIV 1.0 Research Report for Caravans, Behest, Dungeons, and Hamlet Defense.pdf
```

It is likely useful for:

- content flow
- objective wording
- Hamlet/Behest/Dungeon comparison
- score categories and system behavior

It is not expected to directly solve opcode payload layouts unless it includes packet captures or raw client/server logs. For packets, the most useful sources are still:

- `map.log`
- client widget DAT mining
- packet captures if available
- local code paths for working command/event UI

## Best Next Steps

1. Confirm no client alias is active before normal play or server testing.

```powershell
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target guildleve
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target trade
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target gear
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target craftstart
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target status
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target journal
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target itemlist
python "tools\hamlet\hamlet_ui_widget_alias.py" status --target mapnav
```

Expected:

- All touched targets should be `stock (verified from backup)`.
- As of the 2026-05-26 safety pass, all touched targets were restored to stock.

2. Build only the map server project with throttling.

```powershell
dotnet build "Map Server\Map Server.csproj" -c Release -m:1 -p:BuildInParallel=false
```

3. Verify safe probes still work and unsafe aliases are blocked by default:

```text
!testhamlet uiprobe score
!testhamlet uiprobe commandbootstrap
!testhamlet uiprobe scorekick
!testhamlet freshcreate
```

Expected:

- `score` sends the safe score sequence.
- `commandbootstrap` sends the fuller login-style command/UI bootstrap plus the safe score data path.
- `scorekick` returns a disabled warning and does not send `KickEvent`.
- `freshcreate` arms raw Hamlet UI logging, logs `[HamletUiFreshCreate]` markers, and either starts Hyrstmill or tells you the active widget cache is already warm.

4. Stop broad DAT/widget aliasing for now.

The loose-widget shim has tested the reasonable first hosts and did not produce a Hamlet UI. Further random host swapping is more likely to crash or disturb unrelated UI than to find the missing path.

5. Pivot to protocol/content-state discovery:

- Verify whether the client needs an explicit Hamlet widget open/init packet before it will consume `0x01A8`.
- Compare active Hamlet state against working Behest/Guildleve state:
  - `currentContentGroup`
  - director actor id/source actor
  - guildleve/content work values
  - active event owner/type
  - static command/judge actor used by known working widgets
- Try to make the instance advertise the exact content/director state the client expects before sending `0x01A8`.
- Do not over-focus on the `013506C8` registry/table. Reset UI controls proved visible UI can also miss this table and still work. The better target is the post-`00694C70 == 0` follow-up path that normal UI receives but Hamlet may not.

6. Mine or trace the correct widget/event path instead:

- Look for references around `HamletDefenseScoreReceiver`, `HamletDefenseWidget`, and `Window_HamletDefenseWidget`.
- Treat `HamletDefenseTitleWidget1/2/3` and `HamletDefenseTutorialWidget` as possible earlier bootstrap/title/tutorial flow pieces.
- Compare working UI command paths that use `commandContent` or `commandJudgeMode` instead of `noticeEvent`.
- Inspect how normal command widgets route:
  - `EventStartPacket`
  - `RunEventFunctionPacket`
  - `delegateCommand`
  - `EndEventPacket`
- Determine whether Hamlet score UI needs a static command/judge actor instead of the Hamlet director actor.

Fresh-create x32dbg resume plan:

- Start from a full client restart or clean reconnect/cancel/retrigger so the duty widget is not already cached.
- With x32dbg breakpoints already set, use `!testhamlet freshcreate` to reset the safe client route, enable raw Hamlet UI logging, and create the fresh Hyrstmill test.
- Watch the map log for `[HamletUiFreshCreate] phase=pre-start`, `phase=sync-start`, and `phase=post-start` to align the server trigger with the client break.
- Prefer comparing Hamlet's post-zero follow-up path against a known visible UI action such as Reset UI / `CommonAskWidget`.
- Useful first-pass breakpoints:

```text
bp 00538A68
bp 00538A85
bp 00538A87
bp 00538AD4
```

- If the `00538A76 jne 00538AD4` branch is taken, the widget already existed and the trace is a reuse path.
- If execution reaches `00538A87` with `eax=0`, record it but do **not** treat it as fatal by itself. Reset UI / `CommonAskWidget` can visibly work through the same zero-return/store path.
- Re-enable `00874940`, `008748A6`, and `008748C6` only when explicitly comparing lookup behavior. Dumping `013506C8 L 2A0` is faster than manually stepping every candidate, and this table is now known to be non-decisive for visible UI.
- Avoid `F7` into `00445D20`, GDI, D3D, NVIDIA, or generic driver/helper paths. Use `F8` for client calls and `Alt+F9` / `Ctrl+F9` to get back to `ffxivgame.exe` if the debugger falls into a DLL.
- Do not keep stepping through `0066EFD0`, `0096C237`, `0096ACD5`, `0096BF6D`, or `0096B0F1` unless a new reason appears; those were generic machinery during the late trace.

7. Keep unsafe paths warning-gated:

- Do not run `noticeEvent` kick probes unless deliberately isolating the lock.
- Keep non-empty ranking disabled until a real retail layout is recovered.
- Keep `craftstart` alias marked failed/crashy.

8. Continue treating `0x0137` guildleve work values as the live HUD path for now.

If the immediate goal is "make the UI look less wrong", use the guildleve-compatible HUD and tune objective/counter data. If the goal is "retail Hamlet score/ranking windows", continue reverse engineering widget/event bootstrap and content-state gating.

9. When starting a new chat, paste this file path first:

```text
C:\Users\drime\source\repos\AuroraFlare\FF14-Memory\docs\hamlet_ui_handoff_2026-05-25.md
```

Then ask the new chat to:

- read this handoff
- run `git status --short`
- inspect `Map Server\Hamlets\HamletDefenseManager.cs`
- rebuild
- continue from "Best Next Steps"
