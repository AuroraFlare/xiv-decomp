# Instance Raid Director Base Contract

Generated: 2026-06-19T19:43:45

## Summary

- `InstanceRaidBaseClass` is the recovered generic client lifecycle for timed instance raids: start/relogin/clear/fail/cutscene, countdown notifications, public effects, and the in-duty information widget.
- Local `Director` now has generic instance-raid data-packet helpers and a local `InstanceRaidBaseClass` Lua shell exists for probe wiring.
- Local Toto-Rak has solid server-side content state in `WorldManager` and `PrivateAreaContent`, but its live Lua director still uses an `OpeningDirector` shim until the recovered widget path is validated.
- Old Toto-Rak/Dzemael occupancy directors are a sibling lane that also opens `RaidDungeonExecutionWidget`; share finish-time plumbing, but do not collapse that lane into `InstanceRaidBaseClass`.
- Hamlet is a derived `InstanceRaidBaseClass` client script, but local Hamlet already has a specialized adapter. Treat it as a regression surface, not the generic solution.

## 2026-06-20 Modern Entry Bridge Notes

- Modern raid entry needs two bridges: an accepted guide prompt must resolve a content profile, and a server lifecycle bridge must create/bind/start the private content before sending `InstanceRaidBaseClass.startEvent`.
- Recovered Rivenroad guides use `askEnterInstanceRaid(15/16)` as a yes/no gate; AV/Cutter guide explanation flows accept entry from selection `3`. None of those recovered guide methods create content by themselves.
- Verified local bind split: `PrivateAreaContent.CreateScriptBindPacket` still passes the bind-time instance-raid flags as false, while the local `InstanceRaidBaseClass` shell later calls `_setInstanceRaid(true)`. Keep any area bind-param change narrow and GM-probed.
- Required bridge chain: guide acceptance -> content/director/content-area registry lookup -> `Zone.CreateContentArea(...)` -> start director/content group -> add participants -> `DoZoneChangeContent` -> director-owned `noticeEvent` `startEvent` / `reloginEvent` -> clear/fail/exit/reward cleanup.
- Use `Director.SendDirectorEventFunction` for probes so `noticeEvent` is owned by the director, not a raw player function call.
- `WorldManager.GetCurrentContentRaidDungeonId` currently returns only Toto-Rak id `1`; modern `InstanceRaidExit.askExit(raidDungeonId)` will prompt with `0` until content-area-to-raid-id mapping exists.
- Recovered `OccupancyPlayersBaseClass` / `RaidPlayers` are thin Lua identities, but they are still part of the recovered instance-raid group lane. Local generic `ContentGroup` is not yet proven equivalent, so keep participant/group semantics in the probe checklist before production bridge work.

## 2026-06-21 Private-Area/Raid Status

- Modern `InstanceRaidBaseClass` has local probe shell coverage and thin derived identities, but AV/Cutter/trials are not production-wired. Guide acceptance, content profile lookup, content creation, director-owned `startEvent/reloginEvent`, clear/fail/exit, and reward cleanup are still the missing bridge.
- Toto-Rak remains legacy occupancy partial-live. Keep `RaidFst0Dungeon03` and old execution-widget timing separate from modern `InstanceRaidBaseClass`, sharing only finish-time and return-point plumbing where proven.
- `RaidDungeonHeadCount`, `RaidDungeonTreasureBox`, and `InstanceRaidTreasureBox` remain owner/spawn/package-capture tasks, not generic widget or terminal tasks.
- The first modern lifecycle probe should stay AV content id `6`, `InstanceRaid/InstanceRaidAurumVale`, no cutscene, event type `0`, one player, short timer, director-owned `noticeEvent/startEvent`, and cleanup through a GM return helper before validating `InstanceRaidExit`.

## 2026-06-21 Guide/Launcher Update

- `askEnterInstanceRaid(raidId)` is an entrance confirmation only: it opens row `52045` with choices `52046/52047` and returns true on choice `1`. It does not create content, start a director, zone the player, or launch the duty by itself.
- AV/Cutter guide scripts accept entry from selection `3` in their explanation flows, but no local guide acceptance bridge currently calls `CreateContentArea`, `DoZoneChangeContent`, or director-owned `startEvent`.
- Rivenroad guide actors are locally bound/spawned. The default talk route still delegates only default dialogue, but `!gcrivenroad acceptprobe` now opens `askEnterInstanceRaid(15/16)` on the visible guide owner for confirmation-only proof. Treat Rivenroad and Hard Rivenroad as guide-probe-only until the modern AV bridge is proven.
- Guide accept is not a launcher. No AV/Cutter/primal/Rivenroad production entry should be enabled until acceptance maps to a content profile, creates `PrivateAreaContent`, zones entrants, binds the intended director, sends director-owned `startEvent/reloginEvent`, and wires clear/fail/exit/reward cleanup.
- Useful duty cutscene ids found in recovered/local scripts: AV `rad0r400..rad0r403`, Cutter `rad0w500..rad0w503`, Ifrit `GC010105/gc010110`, Rivenroad `gc010710/gc010714/gc010715/gc010720/gc010730/gc010740/gc010750`, and Rivenroad Hard `sum6w010/sum6w020`. Locally implemented subclass literals were only found for `GC010105` and `gc010715`.
- Probe order: capture guide/terminal command routes (`24101`, `24301`, `24302`, `24228`), run GM-only AV content id `6` with no cutscene and one player, validate relog/data packets/exit registry, then test non-launching guide accept flows. Trial and Rivenroad cutscenes stay gated behind captured args and director ownership.

## 2026-06-20 Content Id / Director Map

| Content ID | Content | Director path |
| ---: | --- | --- |
| 3 | Bowl of Embers Hard | `InstanceRaid/InstanceRaidNormalIfrit` |
| 4 | Bowl of Embers | `InstanceRaid/InstanceRaidLesserIfrit` |
| 5 | Thornmarch | `InstanceRaid/InstanceRaidDarkMoogle` |
| 6 | Aurum Vale | `InstanceRaid/InstanceRaidAurumVale` |
| 7 | Cutter's Cry | `InstanceRaid/InstanceRaidCuttersCry` |
| 11 | Howling Eye Hard | `InstanceRaid/InstanceRaidNormalGaruda` |
| 12 | Howling Eye | `InstanceRaid/InstanceRaidLesserGaruda` |
| 14 | Bowl of Embers Extreme | `InstanceRaid/InstanceRaidHyperIfrit` |
| 15 | Rivenroad | `InstanceRaid/InstanceRaidLesserWhiteGeneral` |
| 16 | Rivenroad Hard | `InstanceRaid/InstanceRaidNormalWhiteGeneral` |

Start with AV (`contentId=6`, `InstanceRaid/InstanceRaidAurumVale`, `cutsceneName="none"`, `eventType=0`, one player, short timer) for the first GM-only lifecycle probe. Its derived class is thin, so it avoids Rivenroad weather/cutscene branching and trial-specific scene args while validating the base widget/timer route.

## Recovered Base Lifecycle

| Surface | Trigger | Client contract | Server bridge |
| --- | --- | --- | --- |
| init | director script bind/init | Creates instanceRaidWork temp fields: startTime, finishTime, contentID, eventType, countdownStatus, clearFlag, initFlag, plus 192 bytes for child assignment. Sets loop interval to 1 second and calls processInitialize(). | Local Director.StartDirector can now host an InstanceRaidBaseClass shell, but Toto-Rak still returns OpeningDirector pending live widget probes. |
| startEvent(cutscene, owner, modeFlag, contentID, startTime, finishTime, eventType, ...) | content start | Stores contentID/eventType, clears clearFlag, sets countdown timer, processLogin(false), processStartEvent(...), optional executeCutScene, fade-in, optional start effect, opens information widget, then marks initFlag. | WorldManager.StartTotorakInstance has start/finish data and party membership, but sends chat text instead of this lifecycle. |
| reloginEvent(contentID, startTime, finishTime, eventType, clearFlag) | reconnect/rejoin | Restores contentID/eventType/clearFlag, refreshes countdown if startTime > 0, processLogin(true), fade-in from notice loading, opens information widget if content is not clear, then marks initFlag. | PrivateAreaContent has live/DB return points and WorldManager.TryJoinActiveTotorakInstance has remaining time, but no recovered reloginEvent call. |
| clearEvent() | content clear | Stops countdown, orders desktop mode 126, closes information widget, and notifies worldMaster row 52021 with contentID. | Local content completion uses ContentFinished/CheckDestroy and some quest directors call ContentFinished; no shared instance-raid clear client event is visible. |
| failedEvent(failureType) | content failure/timeout/party defeat | Stops countdown, waits while desktop mode is 127, orders mode 126, closes widget, notifies one of 52065/52054/52010/52093, optionally opens failure effect and fades out/in after warp. | WorldManager.ExpireTotorakInstance returns players and applies lockout, but uses chat messages and a direct zone change. |
| _onReceiveDataPacket(subtype, ...) | server data packet after initFlag | Subtype 1 marks clearFlag true, refreshes countdown from two args, closes widget. Subtype 2 marks clearFlag true, stops countdown, closes widget. Subtype 3 dispatches processUserMessage(...). | Local Director now exposes generic InstanceRaid data senders for subtypes 1/2/3; content clear/failure flows are not wired to them yet. |

## Data Packet Protocol

| Subtype | Args | Client effect | Local status |
| ---: | --- | --- | --- |
| 1 | startTime, finishTime | clearFlag = true; setCountDownTimer(startTime, finishTime, false); closeInformationWidget() | Generic Director.SendInstanceRaidClearTimer is seeded; content outcome wiring pending. |
| 2 | none observed | clearFlag = true; countdownStatus = 0; closeInformationWidget() | Generic Director.SendInstanceRaidClose is seeded; content outcome wiring pending. |
| 3 | derived-director payload | processUserMessage(...) | Generic Director.SendInstanceRaidUserMessage is seeded; Hamlet still keeps its specialized adapter. |

## Derived Class Matrix

| Class | Base | Local script | Functions | Contract note |
| --- | --- | --- | --- | --- |
| InstanceRaidAurumVale | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidAurumVale.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidBaseClass | DirectorBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidBaseClass.lua | InstanceRaidBaseClass.init; InstanceRaidBaseClass.processUIFinalize; InstanceRaidBaseClass._onEventCancel; InstanceRaidBaseClass._onLoop; InstanceRaidBaseClass.getRestTimeStatus; InstanceRaidBaseClass.getHalfTime; InstanceRaidBaseClass.setCountDownTimer; InstanceRaidBaseClass.startEvent; InstanceRaidBaseClass.reloginEvent; InstanceRaidBaseClass.clearEvent; InstanceRaidBaseClass.failedEvent; InstanceRaidBaseClass.exitCutScene; InstanceRaidBaseClass.cutSceneEvent; InstanceRaidBaseClass._onReceiveDataPacket; InstanceRaidBaseClass.getContentID; InstanceRaidBaseClass.getFinishTime; InstanceRaidBaseClass.executeCutScene; InstanceRaidBaseClass.processInitialize; InstanceRaidBaseClass.processLogin; InstanceRaidBaseClass.processStartEvent; InstanceRaidBaseClass.processStartEffect; InstanceRaidBaseClass.processFailedEffect; InstanceRaidBaseClass.openInformationWidget; InstanceRaidBaseClass.closeInformationWidget; InstanceRaidBaseClass.processUserMessage | Core lifecycle owner; must be implemented before thin derived classes are useful. |
| InstanceRaidBeaconBattle | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidBeaconBattle.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidCuttersCry | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidCuttersCry.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidDarkMoogle | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidDarkMoogle.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidHamletDefense | InstanceRaidBaseClass | specialized via Data/scripts/directors/Hamlet/Defense.lua | InstanceRaidHamletDefense.setHamletID; InstanceRaidHamletDefense.getGathererBuffTbl; InstanceRaidHamletDefense.getCrafterBuffTbl; InstanceRaidHamletDefense.processInitialize; InstanceRaidHamletDefense.processLogin; InstanceRaidHamletDefense.processStartEffect; InstanceRaidHamletDefense.processFailedEffect; InstanceRaidHamletDefense.localClearEvent; InstanceRaidHamletDefense.openInformationWidget; InstanceRaidHamletDefense.processUserMessage; InstanceRaidHamletDefense.dispInformation; InstanceRaidHamletDefense.printNPCSay; InstanceRaidHamletDefense.getLocalText | Specialized override; keep on Hamlet adapter path. |
| InstanceRaidHyperIfrit | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidHyperIfrit.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidLesserGaruda | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidLesserGaruda.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidLesserIfrit | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidLesserIfrit.lua | InstanceRaidLesserIfrit.processStartEvent | Derived class with content-specific override(s). |
| InstanceRaidLesserWhiteGeneral | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidLesserWhiteGeneral.lua | InstanceRaidLesserWhiteGeneral.processStartEvent; InstanceRaidLesserWhiteGeneral.processCutSceneEvent; InstanceRaidLesserWhiteGeneral.processDummy | Derived class with content-specific override(s). |
| InstanceRaidNormalGaruda | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidNormalGaruda.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidNormalIfrit | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidNormalIfrit.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| InstanceRaidNormalWhiteGeneral | InstanceRaidBaseClass | present: Data/scripts/directors/InstanceRaid/InstanceRaidNormalWhiteGeneral.lua |  | Thin identity-only derived class that inherits base lifecycle. |
| OccupancyPlayersBaseClass | DirectorBaseClass | sibling occupancy lane; tracked separately | OccupancyPlayersBaseClass._onInit | Derived class with content-specific override(s). |
| OccupancyPlayersTest | DirectorBaseClass | sibling occupancy lane; tracked separately | OccupancyPlayersTest._onInit; OccupancyPlayersTest.clientFunc | Derived class with content-specific override(s). |
| RaidPlayers | OccupancyPlayersBaseClass | sibling occupancy lane; tracked separately |  | Thin identity-only derived class that inherits base lifecycle. |

## Local Gap Matrix

| Gap | Impact | Next |
| --- | --- | --- |
| Toto-Rak still uses OpeningDirector instead of InstanceRaidBaseClass | Toto-Rak/Dzemael-style timed content still cannot naturally run recovered start/relogin/clear/fail/cutscene lifecycle. | Probe the shell in a test director, then switch or supplement Toto-Rak entry/rejoin once the recovered widget path is verified. |
| In-duty information widget lifecycle is seeded but not wired | Players do not yet get retail in-duty name/timer UI and relog refresh in active content. | Pass PrivateAreaContent.GetReentryExpiryUnix into startEvent/reloginEvent after zone-in once the widget probe confirms the time base. |
| Generic clear/failure data packet bridge is seeded but not called | Server-side clear/failure still will not drive recovered client state until content completion/timeout paths call the bridge. | Wire clear, timeout, explicit exit, and disconnect cleanup to SendInstanceRaidClearTimer/SendInstanceRaidClose after live subtype probes. |
| Recovered countdown worldMaster notifications are not wired | Timer warnings differ from retail and are not localized/parameterized by raidDungeon content ID. | Replace or supplement chat timer text with worldMaster notification rows using contentID and threshold values. |
| Derived raid directors are identity shims only | Content can bind the recovered class names, but no local content entry points select those paths yet. | Map content IDs/director paths for Ifrit, Garuda, Aurum Vale, Cutter's Cry, Moogle, and Beacon Battle and bind them intentionally. |
| Guide acceptance has no launcher | Recovered guide prompts can return accepted choices, but local guide scripts do not create private content or call `startEvent`. | Add a GM-only accepted-guide bridge after the AV lifecycle probe proves content creation, director ownership, and `startEvent` timing. |
| Modern exit id lookup is Toto-Rak-only | `GetCurrentContentRaidDungeonId` returns `1` for active Toto-Rak and `0` for other `PrivateAreaContent`. | Add content-area/director/content-id registry before validating `InstanceRaidExit`, otherwise modern exits can display raid id `0`. |
| Old occupancy director lane is a sibling, not the same base | Toto-Rak can need both old occupancy widget compatibility and newer InstanceRaidBase semantics depending on content path. | Keep the legacy dungeon execution widget adapter separate from InstanceRaidBaseClass, but share finishTime plumbing. |

## 2026-06-21 Helper Wave Launcher Boundary

- AV `6`, Cutter `7`, Ifrit `3/4/14`, Moogle `5`, Garuda `11/12`, and Rivenroad `15/16` are anchored content/client taxonomy, and thin local director identity scripts exist for the tracked `InstanceRaid/*` names.
- Those identities are not production launchers. There is still no accepted guide bridge that creates a content area, zones entrants, binds the director, sends owner-owned `startEvent`/`reloginEvent`, and owns clear/fail/exit cleanup.
- Recovered AV/Cutter guide scripts and local Rivenroad guide prompts prove prompt text/choice adjacency only. They should stay prompt/log-only until the lifecycle probe proves content creation and director ownership.
- Toto-Rak remains the only real local dungeon start lane. It can share finish-time plumbing later, but do not treat Toto-Rak fallback/occupancy behavior as proof that modern instance-raid guides are wired.
- `RaidDungeonWarp`, `RaidDungeonExit`, and `InstanceRaidExit` all depend on a content-area/director/content-id registry before AV/Cutter/primal/Rivenroad exits can display correct raid ids or finalize loot/duty state.

## Implementation Order

| Order | Task | Acceptance | Risk |
| ---: | --- | --- | --- |
| 1 | Validate content finishTime as the recovered absolute server-time scalar | Lua/C# client-call bridge passes the same value stored by PrivateAreaContent.GetReentryExpiryUnix and the widget remaining time matches. | Low-medium: time base must match worldMaster._getServerTime. |
| 2 | Probe the seeded local InstanceRaidBaseClass-compatible director shell | startEvent/reloginEvent/openInformationWidget/closeInformationWidget are invoked safely in a test instance. | Medium: local Lua inheritance and client packet bridge may not support every recovered API directly. |
| 3 | GM-only AV lifecycle probe | Create content id `6`, bind `InstanceRaid/InstanceRaidAurumVale`, zone one player, then send director-owned `startEvent("none", director, true, 6, now, now+60, 0)`. | Medium: proves modern base lifecycle without Rivenroad/trial cutscene args. |
| 4 | Bridge Toto-Rak entry/rejoin to startEvent or reloginEvent | Fresh entry and active party rejoin open the recovered information widget with contentID 1 and correct finishTime. | Medium: must not break current safe entry/cutscene probes. |
| 5 | Add generic clear/fail/exit client close helpers | Timer widget closes on timeout, explicit exit, content clear, and disconnect cleanup. | Medium-high: failures involve fade/warp sequencing. |
| 6 | Bind seeded thin derived instance raid class shims to real content paths | Normal/Hyper/Lesser Ifrit, Garuda, WhiteGeneral, Aurum, Cutter, Moogle, BeaconBattle are selected by the correct server content entry points. | Low once base shell is stable. |
| 7 | Keep Hamlet on its specialized adapter | Generic base work does not regress Hamlet-specific score/ranking/HUD bridges. | Medium: shared InstanceRaidBase changes could collide with Hamlet director profiles. |

## Key WorldMaster Rows

| Row | English | Contract use |
| ---: | --- | --- |
| 52009 | Time remaining: [@VALUE($E8(2))] [@IF($E4($E8(2),1),minute,minutes)] (Earth time). | Remaining-time countdown threshold notify. |
| 52010 | Your party can no longer remain in [@SHEET(xtx/raidDungeon,$E8(1),26)]. Teleportation magicks now taking effect. | Failure/timeout message variant used by failedEvent. |
| 52021 | Now leaving [@SHEET(xtx/raidDungeon,$E8(1),26)]. | Clear/normal content end notify used by clearEvent. |
| 52038 | [@2B([@SHEET(xtx/raidDungeon,$E8(1),26)])] has a [@VALUE($E8(2))]-minute time limit. (Earth time). | Time-limit informational entry row. |
| 52042 | End your duty in [@SHEET(xtx/raidDungeon,$E8(1),26)]? | Duty exit prompt used by InstanceRaidExit/GimmickNpcBaseClass. |
| 52054 | Your party is defeated. Exiting [@SHEET(xtx/raidDungeon,$E8(1),26)]... | Party defeated failure notify used by failedEvent type 2. |
| 52065 | Now leaving [@SHEET(xtx/raidDungeon,$E8(1),26)]. | Now leaving notify used by failedEvent type 1. |
| 52087 | Abandon your duty in [@SHEET(xtx/raidDungeon,$E8(1),26)]? (Items that cannot be obtained will be discarded.) | Abandon duty prompt with loot discard warning. |
| 52092 | Time remaining: [@VALUE($E8(2))] [@IF($E4($E8(2),1),minute,minutes)] (Earth time). | Half-time countdown notify. |
| 52093 | Objectives failed. Exiting [@SHEET(xtx/raidDungeon,$E8(1),26)]... | Failure message variant used by failedEvent type 4. |

## Local Script Identity Status

Present:
- `Data/scripts/directors/InstanceRaid/InstanceRaidBaseClass.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidAurumVale.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidBeaconBattle.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidCuttersCry.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidDarkMoogle.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidHyperIfrit.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidLesserGaruda.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidLesserIfrit.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidLesserWhiteGeneral.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidNormalGaruda.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidNormalIfrit.lua`
- `Data/scripts/directors/InstanceRaid/InstanceRaidNormalWhiteGeneral.lua`

Missing:
- None for tracked generic instance-raid identities; Hamlet remains on its specialized local director.

## Output Files

- `source_inventory.csv` - consulted sources.
- `source_term_hits.csv` - targeted term hits across recovered/local sources.
- `function_index.csv` - recovered/local lifecycle functions with snippets.
- `class_binding_matrix.csv` - recovered class/base/function identity matrix.
- `base_lifecycle_contract.csv` - generic base lifecycle surface contracts.
- `data_packet_protocol.csv` - `_onReceiveDataPacket` subtype meanings.
- `worldmaster_countdown_rows.csv` - localizable rows used by countdown/clear/fail flows.
- `local_architecture_matrix.csv` - local C#/Lua capabilities vs gaps.
- `local_gap_matrix.csv` - adapter gaps found in this pass.
- `implementation_contract.csv` - recommended implementation sequence.
- `probe_queue.csv` - targeted live/decomp probes.
- `contract_summary.json` - machine-readable summary.

## 2026-06-21 Trial/Launcher Reality Check

- Local Ifrit, Garuda, and Moogle trial scripts are identity stubs, not admission launchers. The recovered subclasses extend a richer `InstanceRaidBaseClass`, but local scripts do not create content, admit parties, or own reward/clear/fail authority for those trials.
- Local `InstanceRaidBaseClass.lua` is an adapter/probe surface: it can call `_setInstanceRaid`, `startEvent`, `failedEvent`, and `openInformationWidget`, but it does not create or place players into content.
- Toto-Rak remains the only convincing production launch lane: `totorak_entry.lua` asks entry, then local C# creates `PrivateAreaContent`, starts the director/content group, zones players, and opens the execution widget.
- AV, Cutter, Beacon, and primal scripts should stay identity/probe-only until a content creation/admission bridge exists. `InstanceRaidGuide` still has only commented Rivenroad asks and no live trial admission path.
- Exit/fail is only partially local through Toto-Rak return-point exit and timeout/fail cleanup. Trial reward/grant flow is not locally proven.
- Recovered custom windows such as `RaidDungeonExecutionWidget`, `DutyFailedWidget`, `RaidDungeonFailureWidget`, `QuestRewardWidget`, and `ContentRewardWidget` remain owner/director surfaces, not generic `WidgetOpen` targets.
