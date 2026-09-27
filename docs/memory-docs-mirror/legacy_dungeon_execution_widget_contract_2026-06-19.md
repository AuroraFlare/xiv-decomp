# Legacy dungeon execution widget contract (2026-06-19)

This pass isolates the old dungeon occupancy lane that sits between quest cutscenes and full instance-raid widgets. The recovered client contract is small but specific: play the old dungeon cutscene in mode 61, close the execution widget for ending scenes, then reopen it with a display/content ID and an absolute finish time.

## Headline contract

- Toto-Rak uses `RaidFst0Dungeon03`: `openRaidDungeonExecutionWidget(2123, 1, finishTime)`, opening scene `rad0f300`, close scenes `rad0f306`, `rad0f307`, and `rad0f308`.
- Dzemael uses `RaidRoc0Dungeon01`: `openRaidDungeonExecutionWidget(4102, 2, finishTime)`, opening scene `rad0r100`, close scene `rad0r106`.
- Outside that old occupancy lane, Aurum Vale and Cutter's Cry are `InstanceRaidBaseClass` identities, while Copperbell and Tam-Tara currently classify as gate/door work rather than recovered execution-widget content.
- `RaidDungeonExecutionWidget.setTimer` computes remaining time as `finishTime - worldMaster._getServerTime()` and configures warning/max thresholds `120`/`300`.
- Local occupancy director shims and `!totorak dutywidget` probes now exist; live Toto-Rak entry/rejoin/login-reconnect schedule the recovered occupancy relogin callback, timeout/public exit/configured warp/raid warp/GM leave send widgetSetOff, `!totorak livecs` drives the live eventNoticeCutScene bridge, `!totorak spawnboss` can spawn recovered BNPC probes, and Shaula death now owns the recovered `rad0f306` clear scene when actor class `2301104` dies inside active content.

## 2026-06-20 Runtime Split Addendum

- Dungeon/raid runtime split is clearer: Toto-Rak is partially live through the legacy `RaidFst0Dungeon03` occupancy lane, while AV/Cutter/trials remain `InstanceRaidBaseClass` identity/probe surfaces without production start/relogin/clear/fail bridge.
- Local exit coverage exists for `InstanceRaidExit`, `RaidDungeonExit`, `GimmickExitRect`, `RaidDungeonWarp`, `PrivateAreaPastExit`, and marker-only `ContentPrivateAreaRange`, but `RaidDungeonExit`/`InstanceRaidExit` placement and runtime return cleanup still need live validation before binding.
- `ContentCommand` remains a work-sync blocker, not a Lua-only task: add `DirectorWork.contentCommand/contentCommandSub`, `PlayerWork.variableCommandContent/Sub`, `directorWork` packet allowlisting, and runtime command-host capture before adding a local command script.
- `QuestContentInformationDirector` covers kind-1 content-info overlays (`GuildleveExecutionWidget`) for GC701/NMRush-style probes; it is not the raid/dungeon execution timer lane.
- Toto-Rak clear scene ownership starts through Shaula actor class `2301104`, but post-clear `ContentFinished`, rewards/coffers, success return, offline participant success, fail/end scenes, and duty-exit loot policy remain gated.
- Keep `WidgetOpenCommand` reject-only and keep raid/trial reward UI blocked until scoped loot package `5` -> backend `LOOT = 4` validation is in place.

## 2026-06-20 Modern Entry Bridge Addendum

- `askEnterInstanceRaid` is confirmed as the entrance confirmation surface only. Recovered guides return true after choice `1`, but do not create private content or send `InstanceRaidBaseClass.startEvent`.
- Local `InstanceRaidGuide.lua` Rivenroad comments still reference `askEnterInstanceRaid(15/16)`, but the active path delegates default talk and has no launch bridge.
- Modern AV/Cutter/trial/Rivenroad content IDs are confirmed for naming/eligibility (`6/7`, `4/3/14`, `5`, `12/11`, `15/16`), but they are not enough to synthesize lifecycle packets.
- Missing bridge chain: capture guide acceptance, resolve content/director, create/start `PrivateAreaContent`, zone entrants, bind the modern InstanceRaid director, send setup plus `startEvent` or `reloginEvent`, then handle clear/fail/exit/reward paths.
- Local helper APIs for setup/start/relogin/clear/fail exist in `Data/scripts/directors/InstanceRaid/InstanceRaidBaseClass.lua`, but no caller bridges AV/Cutter/trial/Rivenroad guide acceptance into them.
- Verified local bind split: `PrivateAreaContent.CreateScriptBindPacket` still sends the bind-time instance-raid flags as false, while the local `InstanceRaidBaseClass` shell calls `_setInstanceRaid(true)` after bind. Any bind-param change must remain narrow and GM-probed.
- Safest first modern lifecycle probe is AV content id `6` with `InstanceRaid/InstanceRaidAurumVale`, `cutsceneName="none"`, `eventType=0`, one player, and a short timer. Send `startEvent` through director-owned `noticeEvent`, then clean up with a GM return helper rather than `InstanceRaidExit`.
- `GetCurrentContentRaidDungeonId` is Toto-Rak-only today, returning `1` for active Toto-Rak and `0` for other private content. Add a content-area/director/content-id registry before validating modern `InstanceRaidExit`, otherwise exit prompts can display raid id `0`.
- Keep legacy occupancy widgets (`RaidFst0Dungeon03`, `RaidRoc0Dungeon01`) separate from modern `InstanceRaidBaseClass` execution widgets.

## 2026-06-20 Reward / Exit Safety Addendum

- Recovered `RaidDungeonTreasureBox` has real drop-table, quality, quantity, and inventory-add logic, but local `RaidDungeonTreasureBox.lua`, `RaidDungeonHeadCount.lua`, and `treasurebox/InstanceRaidTreasureBox.lua` are still absent. Keep raid/trial treasure and headcount objects disabled until owner/event/package behavior is captured.
- Loot package command semantics must be solved before any raid reward UI work: recovered persistent loot uses client package `5`, while local backend `ItemPackage.LOOT = 4` and `MELDREQUEST = 5` cannot be globally aliased.
- Return-point and exit validation must not rely on Toto-Rak fallback behavior alone. `UseRaidDungeonWarp` can fall back to the public entrance, so `RaidDungeonWarp`, `InstanceRaidExit`, and duty-exit flows need captured return state before transporter behavior is broadened.
- Toto-Rak timeout and Shaula clear remain UX-partial: timeout direct-warps after closing widgets, and Shaula death starts the clear scene without recovered `clearEvent`, `ContentFinished`, reward/coffer finalization, or offline participant success.

## Dungeon scope

| dungeon | lane | client_evidence | local_status | missing |
| --- | --- | --- | --- | --- |
| Toto-Rak | legacy occupancy execution widget | RaidFst0Dungeon03 eventNoticeCutScene/relogin; cutReplay rad0f300 and rad0f306-rad0f308; widget 2123/1. | Live entry/rejoin/reconnect and clear-scene bridge are partially wired; GM BNPC probe exists. | Client validation, natural battle placement, clear rewards/teardown, and fail/exit owners. |
| Dzemael Darkhold | legacy occupancy execution widget | RaidRoc0Dungeon01 eventNoticeCutScene/relogin; cutReplay rad0r100 and rad0r106; widget 4102/2. | Local occupancy shim/profile exists. | No live WorldManager content lifecycle or bridge yet. |
| Aurum Vale | InstanceRaidBaseClass | cutReplay rad0r400-rad0r403 and InstanceRaidAurumVale identity. | Identity script and some hazard/status support exist. | No local instance start/relogin/clear/fail bridge; not an old occupancy-widget contract. |
| Cutter's Cry | InstanceRaidBaseClass | cutReplay rad0w500-rad0w503 and InstanceRaidCuttersCry identity. | Identity script exists. | No local content lifecycle bridge; not an old occupancy-widget contract. |
| Copperbell Mines | gate and door scripts | No old occupancy/cutReplay execution-widget lane found in the current inventory. | AetheryteChild gate actor 1280054 and door scripts/rows are present. | Door-position polish and object behavior, not recovered duty UI. |
| Tam-Tara Deepcroft | gate and door scripts | No old occupancy/cutReplay execution-widget lane found in the current inventory. | AetheryteChild gate actor 1280083 and interior door scripts/rows are staged. | Door-position/object behavior, not recovered duty UI. |

## Local bridge gap

| gap | evidence | risk | next |
| --- | --- | --- | --- |
| Live Toto-Rak director class mismatch | Local Occupancy/RaidFst0Dungeon03 exists for probes, but Data/scripts/directors/Instance/Totorak.lua still returns /Director/OpeningDirector. | The client methods that own RaidDungeonExecutionWidget are still not naturally attached to the live Toto-Rak content director. | Validate the probe director, then either switch the live director path or send occupancy callbacks from a deliberate adapter. |
| RaidDungeonExecutionWidget open is live-wired but client validation is pending | Normal entry/rejoin now schedule the recovered relogin callback using the saved finishTime; !totorak dutywidget remains available as a direct probe. | If the client rejects the delayed occupancy director or method owner, players may still see only the system timer message. | Validate in-client on fresh entry and party rejoin, then tune the delay/owner if needed. |
| Finish time bridge needs client timer parity validation | WorldManager.StartTotorakInstance stores expiresAtUnix and ScheduleTotorakLegacyDutyWidgetOpen passes it to relogin after zone-in. | The widget can open with a wrong remaining time if server Unix time does not match worldMaster._getServerTime. | Compare the displayed timer with the server remaining time on fresh entry/rejoin. |
| Login reconnect UI refresh needs client validation | DoZoneIn now calls ScheduleTotorakLegacyDutyWidgetOpenForPlayer on login, reusing the live occupancy relogin bridge after Database reattaches valid content. | A reconnecting player should get the timer widget again, but packet order and client owner acceptance still need live-client confirmation. | Disconnect/reconnect inside active Toto-Rak and compare the reopened widget timer with server remaining time. |
| Clear scene is boss-owned, but full clear state is still partial | BattleNpc.Die now calls WorldManager.HandleTotorakBattleNpcDeath once after the death record, and actor class 2301104/Shaula sends rad0f306 once through Play... | The recovered clear cutscene can now fire naturally, but it still does not visibly call InstanceRaidBaseClass.clearEvent, ContentFinished, exit/return, reward/loot finalization, or offline participant success handling. | Validate Shaula death in-client, then recover the post-clear reward/teardown path before marking Toto-Rak complete. |
| Failure and exit ending-scene ownership is still bridge/probe-only | Recovered processUIFinalize/widgetSetOff close the widget, and PlayTotorakLegacyDutyCutsceneForPlayer can drive rad0f307/rad0f308 from the live occupancy dir... | Failure and exit endings are still manually probeable but not naturally owned by recovered content outcomes; local timeout still mostly sends chat, closes legacy widget, and direct-warps rather than recovered fail UX/messages/effects. | Validate !totorak livecs fail/end in-client, then bind each scene to the recovered failure/exit condition when those dungeon result states are implemented. |
| Toto-Rak battle population in private content is probeable, but natural placement is still missing | Shaula/Sargas/Antares are present as recovered mob types 3095/3093/3001 with actor classes 2301104/2301103/2301102, and !totorak spawnboss can spawn them at ... | The Shaula death bridge can be validated manually, but normal content still will not own retail battle placement until coordinates or a scripted seed path ar... | Use the probe to validate actor class 2301104 death in active PrivateAreaContent, then recover retail coordinates or add an explicitly documented scripted co... |
| Entry NPC path is still separate from the live duty-widget bridge | Data/scripts/totorak_entry.lua controls entrance cutscene/widget prompts; the recovered in-duty widget now opens from WorldManager after content zone-in. | NPC tests can bypass the exact retail flow unless toggles are set intentionally. | Keep the test toggles, use !totorak dutywidget for direct validation, and tune the live zone-in bridge separately. |
| Dzemael content is not represented locally | Recovered RaidRoc0Dungeon01 provides display/content 4102/2 and now has a local shim, but current live content implementation work is Toto-Rak-specific. | A hard-coded Toto-Rak fix will not scale to the second recovered old-dungeon contract. | Make the adapter accept displayId/contentId/openingScene/closeScenes so Dzemael can plug in later. |

## Implementation order

| priority | surface | target | implementation_note | verification |
| --- | --- | --- | --- | --- |
| 1 | Validate the seeded legacy occupancy adapter | Data/scripts/directors/Occupancy/RaidFst0Dungeon03.lua and !totorak dutywidget/dutyclose/dutycs | Use the probe director to exercise eventNoticeCutScene(sceneKey, cutsceneArg, finishTime), relogin(finishTime, clearFlag), and widgetSetOff/processUIFinalize... | GM command invokes rad0f300/rad0f306 or relogin with a fake finishTime and observes widget open/close order. |
| 2 | Validate live finishTime bridge | WorldManager.StartTotorakInstance, TryJoinActiveTotorakInstance, PrivateAreaContent.GetReentryExpiryUnix | Live entry/rejoin now pass the saved Unix expiry through the occupancy relogin callback; confirm the scalar matches the client time base. | Widget timer starts near 60:00 on fresh entry and near remaining time on party rejoin. |
| 3 | Tune the live execution widget after zone-in | WorldManager.ScheduleTotorakLegacyDutyWidgetOpen | The bridge currently binds a secondary Occupancy/RaidFst0Dungeon03 director and sends relogin after a short delay. | Fresh entry shows the legacy duty name/timer instead of only a system message; adjust delay if packet order is early. |
| 4 | Relogin/rejoin refresh | WorldManager.DoZoneIn and ScheduleTotorakLegacyDutyWidgetOpenForPlayer | Login DoZoneIn now detects active Toto-Rak content and reuses the occupancy relogin bridge after zone-in. | Disconnect/reconnect inside Toto-Rak reopens the timer widget with correct remaining time. |
| 5 | Shaula clear-scene owner | BattleNpc.Die plus WorldManager.HandleTotorakBattleNpcDeath | The BNPC death path now calls a guarded Toto-Rak bridge once after the death record; actor class 2301104/Shaula sends rad0f306 once per active instance witho... | Spawn/kill Shaula inside active Toto-Rak content and observe one recovered clear cutscene for all online members; duplicate death/reward attribution must not... |
| 6 | Recovered Toto-Rak BNPC probe | WorldManager.SpawnTotorakBattleProbeForPlayer plus !totorak spawnboss | GM-only probe spawns recovered Shaula/Sargas/Antares BNPC IDs using their mob-type rows at the GM's active-content position; this is validation glue, not rec... | !totorak spawnboss shaula creates actor class 2301104 in active Toto-Rak content; killing it sends exactly one rad0f306 clear scene. |
| 7 | Toto-Rak battle population | server_battlenpc spawn data and content-area BNPC seeding | Mob type data identifies Shaula/Sargas/Antares, and the GM probe can validate behavior, but named retail spawn rows were not found in the current static spaw... | Normal active PrivateAreaContent contains actor class 2301104 without using the GM probe before calling battle population recovered. |
| 8 | Ending-scene close rules | WorldManager.PlayTotorakLegacyDutyCutsceneForPlayer plus eventNoticeCutScene close-scenes table | Timeout/public exit/configured warp/raid warp/GM leave now send widgetSetOff; !totorak livecs can drive the live rad0f307/rad0f308 occupancy scenes before th... | Exits close the timer widget, Shaula death owns clear, and livecs fail/end reproduce the recovered close-cutscene-reopen order. |
| 9 | General notification parity | eventNoticeCutScene post-play callback | After cutscene playback, call processUpdateGeneralNotificationDialog(3, nil, nil, 1) if the local client-call wrapper supports it. | Post-cutscene notification appears without blocking the widget. |
| 10 | Keep entry widget separate | TotorakAskEntry / askEnterInstanceRaid | Do not treat the entrance confirmation widget as the in-duty execution widget; they have different IDs and lifecycle. | Turning entry widget probes on/off does not affect in-duty timer widget behavior after entry. |
| 11 | Make Dzemael data-driven | future Dzemael content implementation | Parameterize display/content IDs and scene tables so RaidRoc0Dungeon01 uses 4102/2 and rad0r100/rad0r106 without a second hard-coded bridge. | A dry-run Dzemael adapter emits the recovered open/close contract from data alone. |

## Key function evidence

| path | function | start_line | end_line | key_terms | contract_note |
| --- | --- | --- | --- | --- | --- |
| tools\outputs\lpb\content_systems_20260612\lua\director\occupancy\raidfst0dungeon03.lua | RaidFst0Dungeon03.eventNoticeCutScene | 9 | 27 | RaidFst0Dungeon03; RaidDungeonExecutionWidget; eventNoticeCutScene; openRaidDungeonExecutionWidget; closeRaidDungeonExecutionWidget; processUpdateGeneralNoti... | Toto-Rak mode-61 occupancy cutscene wrapper; closes widget for rad0f306/rad0f307/rad0f308 and reopens display/content 2123/1 with finishTime. |
| tools\outputs\lpb\content_systems_20260612\lua\director\occupancy\raidfst0dungeon03.lua | RaidFst0Dungeon03.relogin | 28 | 33 | RaidFst0Dungeon03; RaidDungeonExecutionWidget; relogin; openRaidDungeonExecutionWidget | Rejoin callback; fades in from notice-event loading and opens RaidDungeonExecutionWidget when clearFlag is false. |
| tools\outputs\lpb\content_systems_20260612\lua\director\occupancy\raidroc0dungeon01.lua | RaidRoc0Dungeon01.eventNoticeCutScene | 9 | 27 | RaidRoc0Dungeon01; RaidDungeonExecutionWidget; eventNoticeCutScene; openRaidDungeonExecutionWidget; closeRaidDungeonExecutionWidget; processUpdateGeneralNoti... | Dzemael mode-61 occupancy cutscene wrapper; closes widget for rad0r106 and reopens display/content 4102/2 with finishTime. |
| tools\outputs\lpb\content_systems_20260612\lua\director\occupancy\raidroc0dungeon01.lua | RaidRoc0Dungeon01.relogin | 28 | 33 | RaidRoc0Dungeon01; RaidDungeonExecutionWidget; relogin; openRaidDungeonExecutionWidget | Rejoin callback; fades in from notice-event loading and opens RaidDungeonExecutionWidget when clearFlag is false. |
| tools\outputs\lpb\content_systems_20260612\lua\widget\raiddungeonexecutionwidget.lua | RaidDungeonExecutionWidget.setTimer | 10 | 25 | RaidDungeonExecutionWidget | Computes remaining timer from finishTime minus worldMaster._getServerTime and configures warning/max timer properties. |
| Data\scripts\directors\Instance\Totorak.lua | sendInstanceUi | 17 | 21 | _setInstanceRaid; _loadTextDataPermanently | Local partial instance UI shim; sends _setInstanceRaid and _loadTextDataPermanently but not the recovered execution widget. |
| Data\scripts\content\Totorak.lua | onCreate | 10 | 13 | applyTotorakMusic | Runtime Toto-Rak content hook; applies field/battle music when the content area is created. |
| Data\scripts\content\Totorak.lua | onZoneIn | 14 | 17 | applyTotorakMusic; ChangeMusic | Runtime Toto-Rak content hook; reapplies field/battle music and switches the entering player to Toto-Rak field music. |
| Data\scripts\commands\gm\totorak.lua | spawnBattleProbe | 380 | 397 | SpawnTotorakBattleProbeForPlayer; shaula | GM command surface for spawning recovered Toto-Rak BNPC probes in active content. |
| Map Server\WorldManager.cs | StartTotorakInstance | 1883 | 1962 | TotorakLegacyDutyWidget; StartTotorakInstance; DoZoneChangeContent; SetReentryExpiryUtc | Local normal Toto-Rak lifecycle; creates Instance/Totorak, sets expiry, starts director, zones party, and sends a plain timer message. |
| Map Server\WorldManager.cs | TryJoinActiveTotorakInstance | 1964 | 2019 | TotorakLegacyDutyWidget; DoZoneChangeContent | Local party rejoin path; refreshes the recovered execution widget with remaining-time data. |
| Map Server\WorldManager.cs | PlayTotorakLegacyDutyCutsceneForPlayer | 2246 | 2286 | TotorakLegacyDutyWidget; SendDirectorEventFunction; FindTotorakInstanceByArea; PlayTotorakLegacyDutyCutsceneForPlayer |  |
| Map Server\WorldManager.cs | SpawnTotorakBattleProbeForPlayer | 2288 | 2397 | FindTotorakInstanceByArea; SpawnTotorakBattleProbeForPlayer; TotorakBattleProbeDefinition; TotorakShaulaActorClassId; totorak_probe; antares; sargas; shaula | GM-only recovered BNPC validation bridge; spawns Shaula/Sargas/Antares probes in active Toto-Rak content from mob-type data, not retail placement. |
| Map Server\WorldManager.cs | HandleTotorakBattleNpcDeath | 2399 | 2445 | FindTotorakInstanceByArea; PlayTotorakLegacyDutyCutsceneForPlayer; HandleTotorakBattleNpcDeath; TotorakShaulaActorClassId; ClearSceneSent; shaula-death; shaula | Shaula clear-scene owner; actor class 2301104 sends the recovered rad0f306 occupancy cutscene once per active Toto-Rak instance. Bridge-only: does not award,... |
| Map Server\WorldManager.cs | DoZoneChangeContent | 3563 | 3646 | DoZoneChangeContent; SaveContentAreaReentry | Local content zone-transfer path; persists return-point/re-entry data and calls onZoneIn after packets. |
| Map Server\Actors\Chara\Npc\BattleNpc.cs | Die | 914 | 1145 | HandleTotorakBattleNpcDeath | BNPC death path; invokes Toto-Rak Shaula clear bridge once after death recording and before rewarded-player Lua onDeath. |

## Generated artifacts

- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\README.md`: 1 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\bridge_queue.csv`: 11 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\client_class_bindings.csv`: 4 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\contract_summary.json`: 1 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\dungeon_scope.csv`: 6 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\legacy_dungeon_function_contracts.csv`: 101 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\local_entry_surface.csv`: 13 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\local_totorak_gap_summary.csv`: 9 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\occupancy_widget_contract_matrix.csv`: 8 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\open_widget_call_contract.csv`: 4 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\source_term_hits.csv`: 589 rows
- `tools\outputs\lpb\legacy_dungeon_execution_widget_contract_20260619\widget_property_contract.csv`: 7 rows

## Notes

- Keep `askEnterInstanceRaid` separate from `RaidDungeonExecutionWidget`; the first is an entrance confirmation flow, while the second is the in-duty timer/name widget.
- The local server now passes the saved timed-content expiry as widget `finishTime` for entry/rejoin/login-reconnect, closes the live widget on the main exit paths, gives Shaula death a natural clear-scene bridge, and exposes a GM-only recovered-BNPC spawn probe; remaining work is client validation, natural Toto-Rak battle population, full success teardown/rewards, natural fail/exit state ownership, and tying duty-exit loot transfer/discard to validated content finalization rather than periodic auto-claim.

## 2026-06-21 Dungeon Status Matrix

| Surface | Current local status | Keep blocked |
| --- | --- | --- |
| Toto-Rak | Active partial launch/entry/rejoin/widget/exit/fail lane. | Natural population, complete reward teardown, and duty-exit loot transfer/discard. |
| Dzemael | Occupancy/content hints and object rows, but not a full local production launch lane. | Treasure/headcount, clear/fail/reward, and validated admission. |
| Aurum Vale | Identity/director script and door/barrier placement evidence only. | Lifecycle bridge, admission, reward, and local door behavior parity. |
| Cutter's Cry | Identity/director evidence only; no local door/object row comparable to Toto-Rak/AV found in the sweep. | Lifecycle bridge, admission, reward, and object scripting. |
| Primal/trial raids | Ifrit/Garuda/Moogle scripts are identity stubs. | Trial admission, clear/fail, cutscene hooks, and reward windows. |
| Treasure/headcount | Recovered-only scripts; absent locally. | Any local fake until owner/event/package behavior is captured. |
