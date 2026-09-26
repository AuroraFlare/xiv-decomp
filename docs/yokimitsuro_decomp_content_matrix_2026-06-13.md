# Yokimitsuro Decomp Content Matrix - 2026-06-13

Companion to `docs/yokimitsuro_decomp_cutscene_bridge_2026-06-13.md`.
This is the wider pass after mining both Yokimitsuro repos against the
local server and the existing content/cutscene audits.

## Source Snapshots

- `FFXIVLegacyClientStructs`: https://github.com/Yokimitsuro/FFXIVLegacyClientStructs at `6e68d2875278ea82b3b27a7636e8d968aeaa70ea`
- `ffxivDecomp`: https://github.com/Yokimitsuro/ffxivDecomp at `bc485d8d4de79d80c23eb8feddbfcebfbb6daab5`
- Local baseline: `docs/content_systems_decomp_audit_2026-06-12.md`
- Existing quick bridge: `docs/yokimitsuro_decomp_cutscene_bridge_2026-06-13.md`

Key external files used:

- `FFXIVLegacyClientStructs/ffxiv_1.0_rtti.txt`
- `FFXIVLegacyClientStructs/FFXIVClientStructs/FFXIV/Application/Network/PacketOpcodes.cs`
- `FFXIVLegacyClientStructs/FFXIVClientStructs/FFXIV/Application/Scene/Cut/CutScene.cs`
- `FFXIVLegacyClientStructs/FFXIVClientStructs/SQEX/CDev/Engine/Cut/Scheduler/Scheduler.cs`
- `ffxivDecomp/docs/re/exe/finding_zone_inbound_opcodes_COVERAGE_COMPLETE.md`
- `ffxivDecomp/docs/re/exe/finding_zone_outbound_opcode_roster.md`
- `ffxivDecomp/docs/re/exe/finding_command_checksum_is_standard_crc32.md`
- `ffxivDecomp/docs/re/exe/finding_server_notify_family_and_notice_authorization.md`
- `ffxivDecomp/docs/re/exe/finding_outbound_rpc_0x12e_format_plus_resumechecker_count_correction.md`
- `ffxivDecomp/docs/re/exe/finding_worksync_inbound_wire_to_record_bridge_FULL_CHAIN.md`
- `ffxivDecomp/docs/re/exe/finding_group_typed_packets_remaining_opcodes_0x187_0x18b.md`
- `ffxivDecomp/docs/re/exe/finding_linkshell_wire_opcodes_0x188_0x189_CLOSED.md`
- `ffxivDecomp/docs/re/exe/finding_opcode_0x18d_session_batch_multi_record_state_push.md`
- `ffxivDecomp/docs/re/exe/finding_misc_game_opcodes_0x186_0x18a_0x191_0x196_0x198_characterized.md`
- `ffxivDecomp/docs/re/exe/finding_cutscene_block_complete_opcodes_4_to_18.md`
- `ffxivDecomp/docs/re/exe/finding_actor_work_schemas.md`
- `ffxivDecomp/docs/re/exe/finding_event_and_battle_sync_schemas.md`
- `ffxivDecomp/docs/re/lua/finding_instance_raid_system.md`
- `ffxivDecomp/docs/re/lua/finding_directorbaseclass_content_orchestration_model.md`
- `ffxivDecomp/docs/re/lua/finding_director_state_machine_concrete_patterns.md`
- `ffxivDecomp/docs/re/correlation/finding_director_judge_purely_lua_no_exe_bridge.md`
- `ffxivDecomp/docs/re/lua/finding_worldmaster_and_actor_packet_flow.md`
- `ffxivDecomp/docs/re/lua/finding_desktopwidget_packet_dispatch.md`
- `ffxivDecomp/docs/re/lua/finding_content_group_baseclass.md`
- `ffxivDecomp/docs/re/lua/finding_playerbaseclass_command_flow_and_player_module.md`
- `ffxivDecomp/docs/re/lua/finding_system_commands_and_command_id_ranges.md`
- `ffxivDecomp/docs/re/lua/finding_areabaseclass_zone_bootstrap_sequence.md`
- `ffxivDecomp/docs/re/lua/finding_judge_family_19_classes_and_craft_id_space.md`
- `ffxivDecomp/docs/re/lua/finding_depiction_judge_nameplate.md`
- `ffxivDecomp/docs/re/lua/finding_hamlet_and_retainer.md`
- `ffxivDecomp/docs/re/lua/finding_caravan_guard_event.md`
- `ffxivDecomp/docs/re/lua/finding_playerbase_lua_bindings_99_complete.md`
- `ffxivDecomp/docs/re/lua/finding_widget_ask_patterns_8_widgets_sampled.md`
- `ffxivDecomp/docs/re/lua/finding_remaining_native_bindings_sweep.md`
- `ffxivDecomp/docs/re/lua/finding_remaining_small_native_bindings.md`
- `ffxivDecomp/docs/re/correlation/finding_csv_complete_correlation_132_of_164_critical_mapped.md`
- `ffxivDecomp/docs/re/correlation/finding_csv_remaining_32_are_engine_internal_not_unmapped.md`
- `ffxivDecomp/docs/data/ffxivtool_table_catalog.csv`
- `ffxivDecomp/docs/re/lua/catalog.md`

## Bottom Line

The external repos are very useful for connecting missing local data to
cutscenes and duty-style content. They close most of the architecture:

- Event/notice transport is known.
- WorkSync and actor/property sync are known well enough to implement.
- The `0x012D` `executeCommand` checksum is known: standard CRC32.
- The native cutscene subhandler block is known.
- InstanceRaid, Hamlet Defense, Chocobo Caravan, Area, Director, and
  ContentGroup client shapes are known.
- Player/Actor packet-to-UI dispatch, InstanceRaid director data-packet
  enums, and generic content widget routing are known.
- Directors and Judges are pure Lua actors. There is no hidden native
  Director/Judge packet family to find.
- The Lua-accessible critical CSV map is complete: 132/132 mapped. The
  remaining 32 critical CSVs are engine-internal/client-local consumers, not a
  Lua-loader gap.

The remaining gaps are mostly values and payload details, not architecture:

- Exact retail dynamic scene args for Aurum Vale, Cutter's Cry, Beacon/Castrum,
  and live Hamlet duty-start context.
- Hamlet score/ranking native payload shape and timing.
- Retail Chocobo Caravan route/status data to feed the three-chocobo model.
- Exact SQWT/widget gating fields for the Hamlet UI shell.

## Direction Vocabulary

Yokimitsuro notes use the client point of view:

- External "Zone outbound" = client to server = local `Map Server/Packets/Receive`.
- External "Zone inbound" = server to client = local `Map Server/Packets/Send`.
- Direction matters because some numeric opcodes are reused by opposite
  packet families. For example, local receive `0x012F` is a WorkSync request,
  while local send `0x012F` is `KickEventPacket`.

## Corrected Packet Model

Several older uncertainties are resolved by the external notes:

- `callServerOnCommand`, `callServerOnTalk`, `callServerOnEmote`, and
  `callServerOnPush` use the simple `0x012D` server-notify path and suspend
  on `ClientOrderEventWaitingResumeChecker`.
- `executeCommand` also uses `0x012D`, but through the checksummed tagged
  command variant. The checksum is standard reflected CRC32/zlib/PKZIP:
  packet `+0x24` stores the CRC32 over the 128-byte command payload at
  `+0x49`, with init `0xFFFFFFFF`, poly `0xEDB88320`, and final xor
  `0xFFFFFFFF`. The 32 bytes at `+0x29` are command hash/id data, not the
  checksum.
- `0x012E` is a 104-byte RPC/resume style packet, not the primary command path.
- WorkSync is not one packet shape. The external chain maps actor/director
  `_updateWork` to `0x012F`, item variants to `0x0132`, and group variants to
  `0x0133` on the client-to-server side.
- Server-to-client state should normally be expressed as local property/event
  packets, not by hand-emitting the native cutscene sub-opcode sequence.
- Client-side command gates such as `commandBurstBlocker`, the 50-character
  combined string limit, `canFire(...)`, and context command variations are
  advisory. The CRC32 is transport integrity only; the server must still
  authorize command id, actor, target, content state, and timing.

## Local Packet Bridge

| Direction | Opcode | Local class | External meaning | Content use |
|---|---:|---|---|---|
| Client to server | `0x012D` | `EventStartPacket` | event/notice start, simple notify, checksummed command container | notice authorization, talk/push/command starts |
| Client to server | `0x012E` | `EventUpdatePacket` | event update / RPC resume params | advance active event coroutine |
| Client to server | `0x012F` | `WorkSyncRequestPacket` | actor/director `_updateWork` request | client asks for synced fields |
| Server to client | `0x012F` | `KickEventPacket` | force/kick an event on client | open a client event context |
| Server to client | `0x0130` | `RunEventFunctionPacket` | invoke Lua function on active event owner | call `startEvent`, `cutSceneEvent`, `exitCutScene`, `_onReceiveDataPacket`, delegate helpers |
| Server to client | `0x0131` | `EndEventPacket` | close active client event | release notice/cutscene wait state |
| Server to client | `0x0133` | local GenericData paths | desktop/widget/requestedData dispatch | tutorial controls, requested data, UI bootstrap probes |
| Server to client | `0x0137` | `SetActorPropetyPacket` | work/property update | sync actor, group, guildleve, director-like fields |
| Server to client | `0x0187` | no local packet class yet; old catalog calls it group-related | `WorkSyncUpdater` typed state batch | candidate retail state replication path beyond local `0x0137` |
| Server to client | `0x0188/0x0189` | no local packet class yet | `EntryLinkShellBuilder` single/batch | linkshell entry updates; not a duty launcher, but part of the complete Group packet family |
| Server to client | `0x018B` | no local packet class yet; old catalog calls it member update x1 | `MemberInfoUpdater` typed member info | party/linkshell/content member metadata candidate |
| Server to client | `0x018D` | no local packet class yet; old catalog calls it member update x16 | session-gated multi-record batch, up to 255 x 40-byte records | roster/list/state batch candidate; capture before naming |
| Server to client | `0x01A3` | external `SetCutsceneBook` name | cutscene book / replay related | replay book state and cutscene availability |
| Server to client | `0x01A8` | local Hamlet score experiments | Hamlet score/ranking family candidate | still needs native payload confirmation |

The local classes already cover the main transport surfaces. The next useful
work is typed wrappers and retail-shaped state, not discovering new opcodes.
For high-fidelity Director/ContentGroup replication, however, keep
`0x0187`/`0x018B`/`0x018D` in packet captures. `0x0188/0x0189` complete the
external Group-family map as linkshell entry packets, but they are not content
launchers. The local `SetActorPropetyPacket` path has already proven
`directorWork.contentCommand` can reach the client, but the Yokimitsuro packet
docs show separate group and member batch paths that may be required for roster,
`syncBuffer[128]`, or content-member fidelity. Nearby state/UI opcodes
`0x0186`, `0x018A`, `0x0191`, `0x0196`, and `0x0198` were checked too; they
are useful protocol plumbing, but not content or cutscene launchers.

## Opcode Layer Cautions

There are two different opcode layers in the external notes:

- Top-level Zone opcodes such as local send/receive `0x012D..0x01A8`.
- A second-level client receive dispatch table with small sub-opcodes `0..60`;
  this is where the native cutscene block `4..14` and cancel handlers `17/18`
  live.

Do not flatten these into one namespace.

There are also semantic-name conflicts between sources. `FFXIVLegacyClientStructs`
and the local server name `0x0148..0x0156` as inventory/list-style packets,
while newer Ghidra notes characterize that same numeric range as a per-actor
action/status/id matrix. Similar caution applies around `0x01A4..0x01A8`,
where local Hamlet score experiments and Legacy names are ahead of the
decomp's mapped/fallback labels. Treat the local packet classes and live stock
client behavior as implementation truth until a packet capture proves a rename.

## Native/Lua Proof Points

The RTTI and native-binding sweeps independently confirm the pieces the local
server has been probing:

- `Application::Lua::Script::Client::Control::CutScene`
- `CutScene::PlayingResumeChecker`
- `Application::Scene::Cut::Scheduler::*`
- `Application::Lua::Script::Client::Control::DirectorBase`
- `Application::Lua::Script::Client::Group::WorkSync`
- `Application::Lua::Script::Client::Group::WorkSyncUpdater`
- `Application::Lua::Script::Client::Event::Notice`, `NoticeBlock`, `NoticeNonBlock`
- `ExecutionClientSideBlockEvent::ClientOrderEventWaitingResumeChecker`
- `Network::HamletDefenseScoreReceiver`
- `Network::HamletSupplyRankingReceiver`
- `Network::SetNoticeEventConditionReceiver`

Director native bindings are small and important:

- `_getPos()`
- `_breakNotice()`
- `_getGroupByDisplayName(name)`
- `_getExtendedTemporaryGroupByDisplayName(name)`
- `_updateWork(...)`
- `_waitForHamletDefenseScore()`

Area native bindings add the zone/content bridge:

- `_setInstanceRaid(...)`
- `_countHamletSupplyRanking()`
- `_getHamletSupplyRanking(idx)`
- zone capability queries such as chocobo, stealth, inn, region, and zone name

Actor and data bindings add the universal data surface:

- `_bindWork(...)` and `_bindWorkNestingArray(...)` register synced fields.
- `_loadTextDataPermanently(classId, csvName)` loads per-class data.
- GameData `CutScene` has `_setFilename`, `_loadCutScene`, `_play`, `_replay`,
  and `_skip`.

## Raw Lua Catalog Inventory

The `ffxivDecomp` repo does not carry raw decompiled Lua sources, but
`docs/re/lua/catalog.md` maps ciphered file names to logical Lua paths and
sizes. The useful content roster for this pass is:

| Logical Lua path | Size | Why it matters |
|---|---:|---|
| `director/instanceraid/instanceraidbaseclass` | 15768 | shared raid cutscene/event entrypoints |
| `director/instanceraid/instanceraidhamletdefense` | 17379 | retail Hamlet director shape |
| `director/instanceraid/instanceraidaurumvale` | 210 | Aurum subclass identity |
| `director/instanceraid/instanceraidcutterscry` | 211 | Cutter subclass identity |
| `director/instanceraid/instanceraidlesserifrit` | 581 | `GC010105` source |
| `director/instanceraid/instanceraidlesserwhitegeneral` | 1338 | `gc010715` source |
| `director/instanceraid/instanceraidbeaconbattle` | 213 | Beacon/Castrum director identity |
| `director/caravanguard/caravanguarddirector` | 19245 | retail caravan state machine |
| `area/privatearea/occupancy/raiddungeonsimple` | 227 | occupancy dungeon wrapper |
| `area/zone/zonemasteroccupancy` | 180 | occupancy zone master |
| `group/relationgroup/occupancyplayersrelationgroup` | 218 | occupancy player group |
| `judge/preface/cutsceneoncebeaconprefacejudge` | 1029 | Beacon preface cutscene gate |
| `chara/npc/gimmick/gimmickmapobj/beaconfortgategimmick` | 2803 | Beacon fort gate object behavior |
| `widget/ask/hamletdefensescorewidget` | 3007 | Hamlet score UI consumer |
| `widget/ask/hamletdefenserankingwidget` | 9298 | Hamlet ranking UI consumer |
| `widget/ask/hamletdefensetutorialwidget` | 15583 | Hamlet tutorial/help shell |

## Runtime Glue Dispatch

`PlayerBaseClass:_onReceiveDataPacket(packetType, ...)` is the main
server-pushed data-to-UI fanout for the local player:

| `packetType` | Client handler | Known sub-routing |
|---|---|---|
| `"requestedData"` | `desktopWidget:processRecievedRequestedDataForWidget(...)` | subKeys `"qtdata"`, `"qtmap"`, `"activegl"`, `"glHist"` |
| `"attention"` | `desktopWidget:processUpdatePublicInformationDialog(...)` | public information dialog |
| number | `desktopWidget:processUpdateGeneralNotificationDialog(...)` | notification ids `1..10`; id `8` closes `RaidDungeonExecutionWidget` |
| `"data"` | `CharaBaseClass:processReceiveData(...)` | generic subclass data blob |

The known general-notification ids:

| ID | Meaning |
|---:|---|
| `1` | caution dialog |
| `2` | tutorial success popup |
| `3` | public effect overlay |
| `4` | tutorial widget open |
| `5` | tutorial widget close |
| `7` | cancel tutorial mode |
| `8` | close raid dungeon execution widget |
| `9` | order tutorial mode and mask |
| `10` | public inform long dialog |

`DesktopWidget:processUpdateContentsInformation(actor, action, payload)`
is generic only for two content widget families:

| `actor:getKindContentsInformation()` | Widget |
|---:|---|
| `1` | `GuildleveExecutionWidget` |
| `2` | `ChocoboCaravanWidget` |

The action strings are `"start"`, `"update"`, `"cancel"`, and reserved
`"finish"`. Raid dungeon and Hamlet widgets use dedicated connector methods
such as `openRaidDungeonExecutionWidget(...)`,
`closeRaidDungeonExecutionWidget()`, `openHamletExecutionWidget()`,
`askHamletDefenseRankingWidget(...)`, and
`askHamletDefenseScoreWidget(contentID)`. This is why guildleve-shaped
content-info probes can render a visible HUD while still missing the retail
Hamlet shell.

Important static service actors and commands from this layer:

| ID | Role |
|---:|---|
| `310001` | `WorldMaster` service actor |
| `24301` | Instance Raid service actor |
| `30004` | Instance Raid timing/service command |
| `320013` | Chocobo Rider service |
| `12015` | push-out-from-chocobo internal command |
| `320001` | Judge/JudgeMaster-side system singleton candidate |

While inside an instance raid, player timing packet type `5` makes the
client fetch static actor `24301` and auto-execute command `30004` with
mode `1` for success or `2` for failure. That follow-up goes through the
same `_executeCommand` / `0x012D` path as ordinary commands.

## Native Cutscene Lifecycle

The external small sub-opcode table is the native client clip lifecycle:

| Sub-opcode | Hook |
|---:|---|
| `4` | `_onTargetChanged` |
| `5` | `_onTargetDecided` |
| `7` | `_onInitializationClip("PreviewSetupClip", ...)` |
| `8` | `_onInitializationClip("Personage", ...)` |
| `9` | `_onShowUIClip` |
| `10` | `_onHideUIClip` |
| `11` | `_onShowWidgetClip` |
| `12` | `_onHideWidgetClip` |
| `13` | `_onOpenUIClip` |
| `14` | `_onFinalizeClip` |
| `17` | `_onPreCutSceneCancel` |
| `18` | `_onPostCutSceneCancel` |

This proves the native engine side, but it should not be the normal server
entrypoint. The safer path is:

1. Accept or kick the active event/notice context.
2. Send `RunEventFunctionPacket`.
3. Call the correct director/client Lua function with the scene key and args.
4. Let `worldMaster:createCutScene(...):startCutScene(...)` drive native clips.

`FFXIVLegacyClientStructs` also exposes the native cutscene scheduler,
resource, clip, camera, character, and proxy-actor types. Those confirm the
engine timeline/rendering layer, but they do not contain a content-to-scene-key
map or replace the Lua director/preface launch paths above.

## Director Notice / Readiness Gate

The next failure boundary is not another scene key. The local decomp notes and
current server paths show a director-side event readiness risk:

- `SetNoticeEventCondition` uses local opcode `0x016B`. Native receiver notes
  say it stores notice conditions on `DirectorBase[+0x60]` only when the target
  already casts as `DirectorBase`; otherwise the fallback is ActorBase-side
  storage.
- `SetEventStatus` uses local opcode `0x0136`; notice conditions use type `5`.
- Local `Director.GetSpawnPackets(...)` sends `AddActor`, then notice
  conditions, then script bind / instantiate. Local owned-director send paths
  then queue `GetInitPackets()` but do not generally queue
  `GetSetEventStatusPackets()`.
- NPC/content helper paths commonly send spawn, init, then
  `GetSetEventStatusPackets()`, so directors are the suspicious outlier.
- The likely probe order for Toto-Rak/Hamlet/Caravan director starts is:
  spawn director, send init, re-send director event conditions, enable notice
  status with `GetSetEventStatusPackets(noticeEnabled: true)`, then kick
  `noticeEvent` and wait for client `0x012D EventStart` before sending
  `0x0130` run-function calls.

Separately, the Yokimitsuro spawn pipeline shows server-pushed actor/director
spawns drain asynchronously and emit client acknowledgements: two `0x0130`
list-object ACKs during spawn orchestration and `0x0133` WorkSync/init ACK when
the actor finishes `_onInit`. Exact local opcode names conflict with the
external high-opcode table, but the behavioral point matters: arbitrary sleeps
are weaker than waiting for the client to show the director is event-ready.

## InstanceRaid Shape

External `InstanceRaidBaseClass` fields:

- `startTime`
- `finishTime`
- `contentID`
- `eventType`
- `countdownStatus`
- `clearFlag`
- `initFlag`
- child/temp reserve bytes

Entry points:

- `startEvent(cutsceneName, owner, modeFlag, contentID, startTime, finishTime, eventType, ...)`
- `cutSceneEvent(cutsceneName, ...)`
- `exitCutScene(cutsceneName, owner, modeFlag)`

Director data packet enum:

| `InstanceRaidBaseClass:_onReceiveDataPacket` type | Meaning |
|---:|---|
| `1` | instance clear with countdown timer; closes information widget |
| `2` | instance clear instant/no countdown; closes information widget |
| `3` | user message, forwarded to `processUserMessage(...)` |

These paths do not hide extra scene-key launchers. Scene-bearing playback
still comes through `startEvent`, `cutSceneEvent`, `exitCutScene`, or the
occupancy/preface wrappers.

`executeCutScene` normalizes those into:

```text
worldMaster:createCutScene(cutsceneName, owner):startCutScene(1, 63, mode, ...)
```

Occupancy dungeon directors use a different wrapper:

```text
worldMaster:createCutScene(cutsceneName, self):startCutScene(1, 61, 1, 0, arg)
```

The recovered occupancy wrappers hard-code their raid widget display ids while
still passing the normal content ids:

- `RaidFst0Dungeon03` / Toto-Rak opens
  `openRaidDungeonExecutionWidget(2123, 1, finishTime)`.
- `RaidRoc0Dungeon01` / Dzemael opens
  `openRaidDungeonExecutionWidget(4102, 2, finishTime)`.

The required `RaidPlayers` companion is a marker class:
`RaidPlayers -> OccupancyPlayersBaseClass -> DirectorBaseClass`, while
`OccupancyPlayersRelationGroup` is a thin `RelationGroupBaseClass` subclass.
No hidden Lua state machine was found there; the server requirement is to bind
the correct roster/group actors so occupancy, party, nameplate, and timer
consumers have a valid group to query.

PlayerBase exposes `_getOccupancyContentsTime(contentId)`, and ordinary widgets
use it. `PcMatchingEditWidget` queries raid ids `1`, `2`, `6`, `7`, and `13`,
trial/foray ids `3`, `4`, `5`, `11`, `12`, `14`, `15`, and `16`, and Hamlet ids
`8`, `9`, `10`. `StatusWidget` also reads the same timer API, then remaps Hamlet
content ids `8 -> 2`, `9 -> 1`, and `10 -> 3` for its Hamlet-defence begin-time
display. This is separate from starting a duty, but it affects duty
availability/timer UI and should be fed from the same server-side content timer
source.

The local `PrivateAreaContent.clientInstanceRaid` path lines up with the
external AreaBase `_setInstanceRaid` bridge. Area setup and director/runtime
event flow are separate things: setting the instance flag is necessary, but it
does not itself play the raid cutscene or open the retail HUD.

## Scene-Key Status

| Content | Known keys | Evidence status | Remaining gap |
|---|---|---|---|
| Toto-Rak occupancy | `rad0f300..rad0f308` | direct occupancy director literals, replay rows, assets | server should drive occupancy `eventNoticeCutScene` path and widget timing |
| Dzemael occupancy | `rad0r100..rad0r106` | direct occupancy director literals, replay rows, assets | same occupancy wrapper as Toto-Rak |
| Lesser Ifrit | `GC010105` | direct instance subclass literal | exact launch sequence/timing still worth logging |
| Rivenroad / WhiteGeneral | `gc010715` | direct instance subclass literal | exact launch sequence/timing still worth logging |
| Aurum Vale | `rad0r400..rad0r403`, replay `11082301..11082304` | assets/replay identity strong | exact live server arg is not proven |
| Cutter's Cry | `rad0w500..rad0w503`, replay `11082401..11082404` | assets/replay identity strong | exact live server arg is not proven |
| Hamlet Defense | Aleport `ham0s201/ham0s202`, Hyrstmill `ham0f301/ham0f302`, Golden Bazaar `ham0w201/ham0w202` | replay/assets valid, user verified replay playback | live duty trigger context still missing |
| Beacon/Castrum | `bcn0l*` family | preface helper and replay/assets indicated by local audit | `CutSceneOnceBeaconPrefaceJudge.processEvent` plays event arg 2 via `startCutScene(1, 61, 1)`; exact retail `bcn0l*` arg still missing |

## Hamlet Defense Matrix

External client shape:

- Content IDs `8`, `9`, `10` map to Hamlet IDs `1`, `2`, `3`.
- `InstanceRaidHamletDefense` extends `InstanceRaidBaseClass`.
- Temp fields include `hamletRank`, `hamletID`, `cargoTarget`, `battleValue`,
  `bossFlag`, `harvest[3]`, `line[3]`, `goods[4]`, and `fieldBuff[6]`.
- `_onReceiveDataPacket(A1=3, eventType, ...)` dispatches 28 Hamlet events.
- Popup-style Hamlet events are in the `21..28` range.
- Hamlet master NPC ids: `1600146`, `1200220`, `1000062`.

Score/ranking shape:

- DirectorBase exposes `_waitForHamletDefenseScore()`.
- Player bindings include count/get/all Hamlet score readers.
- AreaBase exposes Hamlet supply ranking count/get readers.
- RTTI confirms separate `HamletDefenseScoreReceiver` and
  `HamletSupplyRankingReceiver`.
- FFXIVTool has both score tables and text localization:
  `hamletDefScore`, `hamletDefScore(2)`, and `xtx_hamletDefScore`.
- `HamletDefenseScoreWidget` is read-driven. On initialization it calls
  `_countHamletDefenseScore()`, loops `_getHamletDefenseScore(i)`, then calls
  `_getHamletDefenseScoreAll()` before refreshing its list properties.
- The practical blocker is a ready native/player score cache in the active
  Hamlet director context, not just sending an `openHamletExecutionWidget`
  command.
- Retail Hamlet execution UI is reached through dedicated DesktopWidget
  methods such as `openHamletExecutionWidget`, `getHamletExecutionWidget`,
  `getHamletPopupWidget`, `askHamletDefenseRankingWidget`, and
  `askHamletDefenseScoreWidget`. It is not part of the generic
  `processUpdateContentsInformation` Guildleve/Caravan switch.

Local state:

- `HamletDefenseDirector` already has the right general instincts:
  active-event probes, Hamlet score data packets, native score packet builders,
  score rows, intro/end cutscene keys, and live-safe controls.
- The current guildleve-compatible director path is a useful bootstrap but
  remains a guildleve/Behest HUD family wall.
- The next retail path should create or bind the real
  `InstanceRaidHamletDefense` director context, then drive `startEvent(...)`
  and targeted `_onReceiveDataPacket(3, eventType, ...)` calls from that
  context.

Likely Hamlet implementation targets:

1. Add a first-class server model for the Hamlet temp fields above.
2. Load/import or mirror the `InstanceRaidHamletDefense` table, and treat
   `hamletDefScore` tables as client-local/UI references unless a server-side
   mirror is useful for validation.
3. Implement a score-ready state and player score cache that can satisfy
   `_waitForHamletDefenseScore` and the three Hamlet score reader bindings.
4. Keep `0x01A8` / score receiver probing, but treat non-empty ranking payloads
   as unsafe until the native shape is clean.
5. Prefer active director/event context over forced widget open commands.

## Chocobo Caravan Matrix

External `CaravanGuardDirector` shape:

- Init args: `town`, `placeStart`, `placeEnd`, `name1`, `name2`, `name3`.
- Three caravan/chocobo entities are tracked in parallel.
- Work fields include `step`, `progressPer`, `finishTime`,
  `chocoboStatus[3]`, `chocoboHPStatus[3]`, and `markerX/Y/Z[3]`.
- Sync tags split updates into `step`, `progress`, `status`, and `hp`.
- `step < 40` is transit; `step >= 40` fires arrival effects `14`, `15`, or `16`.

Local state:

- `ChocoboCaravanDirector` currently spawns one companion actor and drives a
  guildleve-style progress objective/marker.
- That is a good functional scaffold, but it is not the retail client shape.

Implementation targets:

1. Import `chocoboCaravanGuard.csv`, `facility.csv`, and the caravan populace
   tables.
2. Replace or augment the single-companion model with three tracked caravan
   actors.
3. Add retail fields for step/progress/finish/status/hp/markers.
4. Send tag-style sync groups instead of only `guildleveWork.aimNumNow`.
5. Use arrival effects `14..16` when `step >= 40`.

## Critical Data Tables

Relevant FFXIVTool catalog rows from the external decomp:

| Table | Rows | Category | Priority |
|---|---:|---|---|
| `cutReplay` | 614 | player_meta | critical |
| `beaconFortGateGimmick` | 8 | event_object | critical |
| `occupancyGuideStandard` | 57 | event_object | critical |
| `gimmickExitRect` | 6 | event_object | critical |
| `gimmickPoisonCure` | 6 | event_object | critical |
| `gimmickTerminal` | 2 | event_object | critical |
| `gimmickWarp` | 9 | event_object | critical |
| `facility` | 6 | facility | critical |
| `chocoboCaravanGuard` | 11 | facility | critical |
| `hamletDefScore` | 75 | hamlet | critical |
| `hamletDefScore(2)` | 78 | hamlet | critical |
| `itemHamletSupply` | 33 | item | critical |
| `InstanceRaidHamletDefense` | 28 | instance_content | critical |
| `instanceRaidGuideAurumVale` | 20 | instance_content | critical |
| `instanceRaidGuideCuttersCry` | 30 | instance_content | critical |
| `raidDungeonBarrier` | 4 | instance_content | critical |
| `raidDungeonExit` | 9 | instance_content | critical |
| `raidDungeonLight` | 3 | instance_content | critical |
| `raidDungeonPoster` | 10 | instance_content | critical |
| `raidDungeonWarp` | 4 | instance_content | critical |
| `raidFst0Dungeon03` | 7 | instance_content | critical |
| `raidFst0Dungeon03Guide` | 60 | instance_content | critical |
| `raidRoc0Dungeon01Guide` | 60 | instance_content | critical |
| `populaceCaravanAdviser` | 17 | npc_populace | critical |
| `populaceCaravanGuide` | 43 | npc_populace | critical |
| `populaceCaravanManager` | 64 | npc_populace | critical |
| `populaceHamletBreeder` | 22 | npc_populace | critical |
| `PopulaceHamletCaptain` | 39 | npc_populace | critical |
| `populaceHamletPushEvent` | 51 | npc_populace | critical |
| `populaceHamletSupply` | 2 | npc_populace | critical |
| `xtx_cutReplay` | 614 | text_localization | useful |
| `xtx_facility` | 25 | text_localization | useful |
| `xtx_hamletDefScore` | 75 | text_localization | useful |
| `xtx_raidDungeon` | 16 | text_localization | useful |

A later correlation note corrects the earlier "132 of 164 mapped" framing.
The useful split is:

- 132/132 Lua-accessible critical CSVs are mapped to consumers.
- 32 critical CSVs are engine-internal/client-local C++ consumers by design.

The engine-internal group includes UI/map/cutscene support tables such as
`2Dmap_actor_data`, `2Dmap_data`, `2Dmap_marker`, `2Dmap_piece`,
`aetheryte`, `quest_marker`, `questcategory`, `itemColor`, and `equipSet`;
aliases such as `_item`, `_quest`, `_zoneParam`, `actorclass_graphic`,
`actorclass_mapObj`, and `raidFst0Dungeon03`; and system/UI tables such as
`regionParam`, `zoneGroupParam`, `facility`, `request`, `hamletDefScore`,
and `hamletDefScore(2)`.

Server-push-required critical data is therefore the 132 Lua-accessible tables,
plus any local server mirrors needed for validation or rewards. Hamlet score
display data is a good example: the client has C++/UI table consumers, while
Lua sees score state through native PlayerBase reader bindings.

## Local Grounding Pass

After the external pass, the local LPB/DAT/server sweep was checked again
against the same topics. No newer Yokimitsuro commits were found; remote HEADs
still match the snapshots above.

High-signal local files checked in this pass:

- `docs/Dat Mining/cutReplay.csv` and `xtx_cutReplay.csv`
- `docs/Dat Mining/xtx_raidDungeon.csv`
- `docs/Dat Mining/InstanceRaidHamletDefense.csv`
- `docs/Dat Mining/hamletDefScore.csv`, `itemHamletSupply.csv`
- `docs/Dat Mining/chocoboCaravanGuard.csv`, `facility.csv`
- `docs/Dat Mining/beaconFortGateGimmick.csv`
- `tools/outputs/lpb/content_systems_20260612/lua/director/instanceraid/*`
- `tools/outputs/lpb/content_systems_20260612/lua/director/instanceraid/occupancyplayers/*`
- `tools/outputs/lpb/content_systems_20260612/lua/director/occupancy/*`
- `tools/outputs/lpb/content_systems_20260612/lua/group/relationgroup/occupancyplayersrelationgroup.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/judge/preface/cutsceneoncebeaconprefacejudge.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/gcl/gcl106.lua`
- `tools/outputs/lpb/caravan_guildleve/lua/CaravanGuardDirector.lua`
- `tools/outputs/lpb/caravan_guildleve/lua/ChocoboCaravanWidget.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/instanceraidguide/*`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeon*.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/treasurebox/instanceraidtreasurebox.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacehamletcaptain.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacehamletpushevent.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecaravan*.lua`
- `Map Server/Hamlets/HamletDefenseManager.cs`
- `Map Server/DataObjects/HamletDefenseData.cs`
- `Map Server/Packets/Send/Events/RunEventFunctionPacket.cs`
- `Map Server/Packets/Send/Hamlet/HamletDefenseScorePacket.cs`
- `Map Server/Packets/Send/Hamlet/HamletSupplyRankingPacket.cs`
- `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecutsceneplayer.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/ask/replaycutsceneselectwidget.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/gamedata/cutscene_common.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/pcmatchingeditwidget.lua`
- `tools/outputs/lpb/content_systems_20260612/lua/widget/statuswidget.lua`
- `docs/instance_cutscene_decomp_findings_2026-06-10.md`
- `Map Server/Actors/Director/Director.cs`
- `Map Server/Actors/Chara/Player/Player.cs`

Concrete content and replay rows now pinned locally:

| Content / family | Content id or replay rows | Scene keys / names |
|---|---|---|
| Toto-Rak | content `1`; replay `11082101..11082109` | `rad0f300..rad0f308`; `xtx_raidDungeon` = Thousand Maws of Toto-Rak |
| Dzemael | content `2`; replay `11082201..11082207` | `rad0r100..rad0r106`; `xtx_raidDungeon` = Dzemael Darkhold |
| Aurum Vale | content `6`; replay `11082301..11082304` | `rad0r400..rad0r403`; `xtx_raidDungeon` = Aurum Vale |
| Cutter's Cry | content `7`; replay `11082401..11082404` | `rad0w500..rad0w503`; `xtx_raidDungeon` = Cutter's Cry |
| Hamlet Aleport | content `8`; replay `11082008/11082009` | `ham0s201/ham0s202`; Opening/Ending labels present |
| Hamlet Hyrstmill | content `9`; replay `11082010/11082011` | `ham0f301/ham0f302`; Opening/Ending labels present |
| Hamlet Golden Bazaar | content `10`; replay `11082012/11082013` | `ham0w201/ham0w202`; Opening/Ending labels present |
| Castrum Novum base | content `13`; replay `11082004` | `bcn0l000`; `xtx_cutReplay` = Castrum Novum |
| Beacon/Castrum story buckets | replay `11143201..03`, `11163201..03`, `11183201..03` | repeated `bcn0l001`, `bcn0l010`, `bcn0l020` |
| Ifrit story/trial buckets | replay `11141601`, `11161601`, `11181601` | repeated `gc010105` |
| Rivenroad/WhiteGeneral buckets | replay `11143304`, `11163304`, `11183304` | repeated `gc010715` |

The `xtx_raidDungeon.csv` content-name list pins the full modern raid/duty id
range `1..16`: Toto-Rak, Dzemael, Bowl hard/non-hard, Thornmarch, Aurum,
Cutter, the three Hamlets, Garuda hard/non-hard, Castrum Novum Transmission
Tower, Bowl Extreme, and Rivenroad normal/hard.

Local InstanceRaid subclass check:

- `InstanceRaidAurumVale`, `InstanceRaidCuttersCry`, and
  `InstanceRaidBeaconBattle` are empty subclasses of `InstanceRaidBaseClass`.
- Most other modern instance subclasses are empty wrappers too.
- The static exceptions remain `InstanceRaidLesserIfrit.processStartEvent`
  with `GC010105` and `InstanceRaidLesserWhiteGeneral.processStartEvent` with
  `gc010715`.
- Therefore Aurum, Cutter, Beacon, Garuda, Moogle, normal Ifrit, hyper Ifrit,
  and several later duty scene selections are intentionally server/event args,
  not hidden Lua literals.

Local raid object / reward grounding:

| Object script | Grounded client-side surface |
|---|---|
| `RaidDungeonExit` | Text group `6736`, `raidDungeonExit`; exit prompts use `askExtendWidget` rows `1`, `4`, and `7`. |
| `RaidDungeonWarp` | Text group `6781`, `raidDungeonWarp`; active warp scheduler `67493888`; yes/no row `2`. |
| `RaidDungeonBarrier` | Disables ground marker, text group `6829`, `raidDungeonBarrier`; talk text row `5`; yes/no row `2`. |
| `RaidDungeonLight` | Disables ground marker, text group `6813`, `raidDungeonLight`; hides talkable map marker; yes/no row `1`. |
| `RaidDungeonPoster` | Disables ground marker, text group `6753`, `raidDungeonPoster`; local say rows `1..7`, world say rows `14..16`. |
| `RaidDungeonHeadCount` | Empty event marker in the recovered Lua. |
| `RaidDungeonTreasureBox` | Main raid reward resolver: Dzemael quest `110868`, item gate `10011244`, no-reward system message `60027`, scheduler `67932160`, and runtime `dropSheet` / `dropTableSheet` / `dropQualitySheet` reads. |
| `InstanceRaidTreasureBox` | Thin `TreasureBoxBaseClass` subclass only; no recovered raid reward state machine here. |

Those object scripts are useful for dungeon interaction and reward wiring, but
they are not a hidden execution-widget or cutscene launcher. Exact chest rewards
still require the runtime drop sheets and chest timing, not more Lua class
searching.

Local Hamlet seed data:

| Local key | Zone | Captain / quartermaster | Title index | Raid id | Cutscenes |
|---|---:|---|---:|---:|---|
| `aleport` | `129` | Rhotblaet / B'davzzi | `1` | `8` | `ham0s201`, `ham0s202` |
| `hyrstmill` | `152` | Rontremont / Dhebi Polaali | `2` | `9` | `ham0f301`, `ham0f302` |
| `goldenbazaar` | `171` | Carmine / P'lhabgo | `3` | `10` | `ham0w201`, `ham0w202` |

Those rows are local emulator seed data in `HamletDefenseManager`, not proof of
the original retail live trigger. They are still valuable because they match the
client replay rows, Hamlet content IDs, and title-widget index split.

Local Hamlet text/event data:

- `InstanceRaidHamletDefense.csv` rows `11..20` name the live battle warning
  stream: target change, gate breach, leader joined, three defense-line
  breaches, and four supply-store raid debuffs.
- Rows `21..28` name the support-effect popup stream: enemy attack down,
  enemy HP down, sleep, order/enmity reset, militia defense/evasion up,
  militia archer attack up, militia laborer Regen, and a second order/enmity
  reset variant.
- `hamletDefScore.csv` contains 75 score rows with score id, point value, and
  count/boolean flag. Local row `12015` is `5000` points for Errant Soul
  defeated.
- `itemHamletSupply.csv` maps supply rows to item ids and counts; the client UI
  still consumes this as data/table context rather than the live score payload.
- `PopulaceHamletCaptain` loads text sheet `10160`, maps actor classes
  `1500340/1500342/1500341` to Aleport/Hyrstmill/Golden Bazaar text functions,
  and exposes in-content leave, after-content reward, and after-content exit
  prompts. It is an event surface, not the duty creator by itself.
- `PopulaceHamletPushEvent` loads text sheet `10176` and maps actor classes to
  support types: `1500436` = type `1`, `1200360/1200361/1200362` = harvest
  support type `2` with harvest types `1/2/3`, `1200381` = type `3`, and
  `1200372` = type `4` with hidden talk marker. Marker ids are `18` for type
  `1`, `14/15/16` for the harvest variants, `13` for type `3`, and default `6`.
- Hamlet support item ids are tied to local text/UI: humours
  `10011216..10011218`, placed support items `10011219..10011230`, and
  craftable support parts/philters `10011231..10011242`. The previous content
  audit already names the craft matrix; use it when wiring support delivery.
- Local `HamletDefenseScorePacket` has a compact native probe shape:
  opcode `0x01A8`, payload `0x105`, score codes at `0x05`, counts at `0x85`,
  header = `raidDungeonId` when present, then `supplyRating`.
- Local `HamletSupplyRankingPacket` has an experimental native-style probe:
  opcode `0x01A6`, payload `0x5F0`, 20 rows of `0x4C`, fixed 32-byte strings.
  Field semantics are still explicitly unvalidated.

Local Chocobo Caravan grounding:

- `CaravanGuardDirector` reaches the retail widget through generic content kind
  `2`, which maps to `ChocoboCaravanWidget`.
- `chocoboCaravanGuard.csv` rows `1..11` are the direct guard interaction text:
  calm, feed, call back, cancel, feed prompt, item-name display, and
  unable-to-interact text.
- `facility.csv` rows `10001..10005` provide small numeric facility modifiers;
  keep it as client/local facility data unless a route/reward rule needs a
  server mirror.
- Caravan NPC event surfaces are split across `PopulaceCaravanManager`
  (text sheet `7520`, entry/question/join/cancel flows),
  `PopulaceCaravanGuide` (text sheet `7552`, cancel/reward/failure/thanks
  flows), and `PopulaceCaravanAdviser` (text sheet `7536`, advice and sales).
  `PopulaceCaravanAdviser` and reward/failure text reference item `3011317`,
  which local `xtx_itemName.csv` names as Gysahl Greens.
- Current local `ChocoboCaravanDirector` remains a one-companion route
  scaffold. The retail client wants three status/hp/marker lanes.

Local Beacon/Castrum grounding:

- `beaconFortGateGimmick.csv` rows `1..8` are gate open/close messages for
  main gate and sectors I/II/III.
- `BeaconFortGateGimmick` only syncs a `status` byte and runs the supplied
  show/hide scheduler name. It is not a cutscene launcher.
- `PublicRaidBeaconFort` and `ObjectBeaconGcx105` are empty wrappers.
- `Gcl106` opens and closes `CastrumNovumMapWidget` in story dialogue, but does
  not supply the live `bcn0l*` preface key.
- `CutSceneOnceBeaconPrefaceJudge` remains the only recovered Beacon preface
  cutscene path, and it receives the scene key dynamically as event arg `2`.

## Exhaustive Missed-Hook Addendum

Broad missed-hook searches did not find additional static scene keys or hidden
Director/Judge launchers for instanced dungeons, Hamlet, Beacon/Castrum, or
Chocobo Caravan. The useful additions are runtime plumbing details:

- `cutReplaySheet` is created only in inn areas and destroyed on inn finalize.
  It is replay availability/data, not a live duty-launch channel.
- `ReplayCutsceneSelectWidget` scans exactly `questId * 100 + 1` through
  `questId * 100 + 30`, which matches the recovered replay buckets such as
  `110821..110824` for Toto-Rak, Dzemael, Aurum, and Cutter.
- `PopulaceCutScenePlayer` loads the selected cutReplay row temporarily, reads
  the cutscene name from column `0`, and feeds columns `8..15` as replay args.
  Sentinel args include `-202` for the SNPC actor-class-id path, `-206` for
  current main skill `41`, and `-207` for the player's initial town. Column `6`
  switches the NQ/HQ replay path.
- Cutscene clip markers drive title/effect widgets through
  `desktopWidget:openCutSceneEffectWidget(...)`, not through generic content
  packets. `2DEffectLocation1/2` map to raid title widgets `1/2`,
  `2DEffectLocation6/7` to raid title widgets `3/4`,
  `2DEffectLocation8/9/10` to Hamlet title widgets `1/2/3`,
  `2DEffectLocation11` to `CastrumNovumTitleWidget`, and
  `2DEffectContentsSuccess` / `2DEffectDutySuccess1..3` to success/complete
  widgets.
- Generic public effects are separate: `openPublicEffectWidget(1)` is
  `RaidDungeonStartWidget`, `2` is `RaidDungeonSuccessWidget2`, `3` is
  `RaidDungeonFailureWidget`, `13` is `DutyAbandonedWidget`, `14..16` are
  `DutyCommencedWidget1..3`, `17..19` are `DutyCompleteWidget1..3`, and `20`
  is `DutyFailedWidget`. InstanceRaid and Caravan directors use this live
  effect channel directly.
- `InstanceRaidGuideBaseClass.askEnterInstanceRaid(raidId)` is a normal
  event-mode confirmation: prompt `52045`, choices `52046/52047`, and the
  `raidId` as argument. Aurum Vale and Cutter's Cry use guide subclasses that
  load text sheets `9920` / `9936` and select entry through local guide text,
  not through a hidden native dungeon-entry packet.
- External `0x0187` `WorkSyncUpdater`, `0x018B` `MemberInfoUpdater`, and
  `0x018D` multi-record batch docs are real state/roster paths. They do not add
  new scene keys, but they are the next packets to validate if local `0x0137`
  property sync proves insufficient for retail Director/ContentGroup behavior.
- Second-pass packet triage checked `0x0186`, `0x018A`, `0x0191`, `0x0196`,
  and `0x0198`: multi-actor state set, bulk pair registry, actor ping,
  bit-packed player status panel, and string update. These matter for protocol
  coverage and UI fidelity, but there is no evidence they launch content,
  directors, judges, or cutscenes.
- `PropertyUpdater` is not a packet to search for. The external decomp pins it
  as `EntryLinkShellBuilder` vtable slot `12`; for server work, look at state
  replication packets and property/work updates instead.

## Actor/Data Sync Notes

The content bridge also depends on normal actor work being retail-shaped:

- `charaWork._sync` includes `commandAcquired[4096]`, `command[64]`,
  `commandCategory[64]`, `commandBorder`, `statusShownTime[20]`,
  `parameterSave`, `parameterTemp`, `eventSave`, `eventTemp`, `battleSave`,
  `battleTemp`, `property[32]`, `additionalCommandAcquired[36]`,
  `currentContentGroup`, and `depictionJudge`.
- `npcWork._sync` includes `pushCommand`, `pushCommandSub`,
  `pushCommandPriority`, `hateType`, and `_assignForChild[16]`.
- Command acquisition indices are rebased: actual command id is array index
  plus `26000`, so the 4096-bit acquisition range covers `26000..30095`.
- `actorclass.csv` maps actor class id to display-name id. Appearance is in
  `actorclass_graphic.csv`, and object params are in `actorclass_mapObj.csv`.
  The client resolves names/appearance locally; the server should spawn by
  class id/state, not by sending model/name blobs.
- `populace.csv` is the master NPC list. Typed `populaceXxx` tables are mostly
  client-local text/presentation, while things like shop inventory and prices
  remain server data.

## ContentGroup / Director / Area Implications

ContentGroup:

- ContentGroup is the roster/controller attached to a Director.
- `contentGroupWork._globalTemp.director` is the back-pointer to the
  active Director.
- Group kind values include ordinary group kinds and content group variants
  `30001..30006` in the external notes.
- Local `Map Server/Actors/Group/Group.cs` already names a wider content-group
  range `30001..30018`: guildleve = `30001`, public-pop = `30002`, simple
  content variants include `30003..30007`, retainer access = `30008`, and
  additional simple-capacity variants through `30018`.
- Current local group selection is concrete: `GLContentGroup` returns `30001`,
  `PublicPopContentGroup` returns `30002`, and base `ContentGroup` returns
  `30006`. `HamletDefenseDirector` currently requests PublicPop (`30002`),
  while `ChocoboCaravanDirector` uses the default simple group (`30006`).
- Group work `property` is a bitmap-like content restriction/UI surface.
- Updates to `contentGroupWork.property` call
  `desktopWidget:processUpdateMyPlayerRestrictionByContents()`.
- `_onUpdateMember` and `_onUpdateMemberInformation` refresh roster/nameplate
  state.
- Kinds `30001` and `30006` show the "left content" notice `50012` on
  finalize. Other content kinds appear to finalize silently.

Director:

- Directors and Judges are pure Lua actors. External Ghidra notes found zero
  EXE functions named for `Director`, `Judge`, `directorId`, or
  `contentCommand`; the server should focus on actor creation, WorkSync, and
  event invocation instead of looking for a hidden native Director channel.
- External `DirectorBaseClass` notes frame the server role as trigger/authority:
  spawn the director, receive `_sync` WorkSync updates, accept or reject
  `noticeEvent` transitions, grant outcomes, and despawn the director on end.
- External `directorWork._temp` includes `directorId` and a 240-byte child
  reserve.
- External `directorWork._sync` includes `contentCommand`,
  `contentCommandSub`, `syncBuffer[128]`, and a 64-byte child reserve.
- `_onUpdateWork("_init")` handles content-command UI init when the player has
  the quest/content command permit flag. Updates to
  `"directorWork"+"contentCommand"` refresh content variation, `"work"` drives
  UI refresh, and other fields dispatch to subclass-specific handlers.
- Concrete directors commonly expose `UiStep`, `UiState[]`, aim counters,
  start time, time limit, and calls such as
  `desktopWidget:processUpdateContentsInformation(self, "start")`.
- Local `Director` currently handles actor membership, ContentGroup creation,
  event conditions, spawn/init, and Lua coroutine startup, but does not model
  a standalone retail `directorWork` object or `syncBuffer[128]`.
- Add that model only when implementing a client path that reads it, but expect
  Hamlet, retail instance HUDs, and content-command variation to need it.

Area:

- `AreaBaseClass:create(_, isInstanceRaid, isEntranceDesion)` records both
  flags, calls `_setInstanceRaid(isInstanceRaid)`, then sets loop interval
  `1`.
- `areaWork._temp` includes `actorNumber`, `isInstanceRaid`,
  `isEntranceDesion`, and `_assignForChild[64]`.
- Zone and area CSVs are loaded client-side from local data during area init.
  The server's job is zone handoff, actor population, state sync, and dynamic
  event/cutscene arguments.
- Inn zones create `cutReplaySheet`; replay availability is local/static plus
  player completion state, not a duty launcher.
- Area setup has `isInstanceRaid` and an `_setInstanceRaid(...)` native bridge.
- Local private-area `clientInstanceRaid` is the right flag-level bridge.
- Zone bootstrapping is not enough by itself. The active Director and
  ContentGroup still need to exist and sync their work.

## Implementation Map

Highest-confidence next work:

1. Add typed server helpers around `RunEventFunctionPacket`:
   `CallEventFunction`, `CallDirectorFunction`, `CallDirectorDelegate`, and
   `EndClientEvent`.
2. Add optional CRC32 validation/building for the `0x012D` tagged
   `executeCommand` path. Semantic authorization still matters more than the
   checksum, but the wire algorithm is now known.
3. Register or model static service actors used by these paths, especially
   `310001` WorldMaster, `24301` Instance Raid service, and any local
   equivalents for `320013` Chocobo Rider / `320001` judge bootstrap.
4. Add instance helpers:
   `StartInstanceRaidEvent`, `PlayInstanceRaidCutscene`,
   `ExitInstanceRaidCutscene`, and `SendInstanceRaidDataPacket`.
5. Add helper support for InstanceRaid data-packet types `1`, `2`, and `3`
   so clear/countdown/user-message paths do not get confused with cutscene
   launch paths.
6. Create a content scene registry seeded with known keys and explicit
   confidence levels. Keep Aurum/Cutter/Beacon/Hamlet live dynamic args marked
   unproven.
7. Import the Lua-accessible critical data tables listed above or generate
   local equivalents from the existing DAT-mined CSVs where already present.
   Treat engine-internal CSVs as client-local unless the server needs a mirror.
8. Model retail `directorWork._sync` with `contentCommand`,
   `contentCommandSub`, and `syncBuffer[128]`.
9. Model `ContentGroup`'s director back-pointer and property bitmap so
   restriction refreshes and nameplate/depiction refreshes run naturally.
10. Treat content-group kind as a first-class probe variable. Local Hamlet is
   currently PublicPop (`30002`) while local simple content is `30006`; if the
   HUD family is wrong, test kind selection before inventing another widget or
   cutscene packet.
11. For Toto-Rak and Dzemael, implement the occupancy director wrapper path
   before inventing new instance subclasses.
12. For Hamlet, pivot from guildleve-compatible HUD probes to a real
   `InstanceRaidHamletDefense` context plus score wait/player-score-cache
   support.
13. For Chocobo Caravan, migrate from one escort actor to the three-actor
   status/hp/progress/marker model.
14. Keep packet logging around `0x012D`, `0x012E`, `0x012F`, `0x0130`,
   `0x0131`, `0x0133`, `0x0137`, `0x0187`, `0x0188`, `0x0189`, `0x018B`,
   `0x018D`, `0x01A3`, and `0x01A8` during any live duty probe.
15. If `directorWork.contentCommand` works but content roster, nameplate,
   restriction, or `syncBuffer[128]` state still does not, implement/log the
   `0x0187` WorkSyncUpdater and `0x018B`/`0x018D` member batch family before
   adding more ad-hoc widget pokes.
16. During instance timing probes, also watch timing packet type `5` and the
   follow-up client command `30004` through static actor `24301`.
17. For director-owned notice/cutscene probes, send director spawn and init,
    re-send event conditions, enable notice `SetEventStatus` type `5`, then wait
    for client `0x012D EventStart` before `0x0130` run-function calls.
18. Feed `_getOccupancyContentsTime(contentId)` from the same server-side
    content timer source used for duty roster/status state, at least for
    content ids `1..16` and Hamlet ids `8..10`; remember the `StatusWidget`
    Hamlet display remap `8 -> 2`, `9 -> 1`, `10 -> 3`.
19. Recover or capture `dropSheet`, `dropTableSheet`, and `dropQualitySheet`
    before claiming exact raid chest rewards; the current Lua gives resolver
    mechanics, not preserved reward rows.
20. Do not rename or reshuffle local `0x0148..0x0156` packet classes from
    static notes alone; capture first because source names currently conflict.

## Boundaries Still Not Closed

Things these repos do not fully give us:

- Exact retail dynamic scene args for Aurum Vale, Cutter's Cry, Beacon/Castrum,
  and live Hamlet duty intro/end triggers.
- A clean, proven non-empty Hamlet score/ranking payload.
- The exact active director/content/widget bootstrap state that allows
  `openHamletExecutionWidget` and the Hamlet score/ranking widgets to bind to
  the retail Hamlet shell. This may include SQWT/layout state, but the generic
  Guildleve/Caravan content-info switch is known not to be that path.
- The exact retail content-group kind for Hamlet, Caravan, Beacon, and modern
  instance variants. Local group-kind constants are broader than the external
  note's abbreviated `30001..30006` set, and current local Hamlet/Caravan choices
  may be emulator scaffolding rather than retail truth.
- Whether retail Hamlet/bootstrap roster state expects `0x0187`/`0x018B`/`0x018D`
  in addition to the locally proven `0x0137` `directorWork` property channel.
- Final semantic reconciliation for conflicting `0x0148..0x0156` and
  `0x01A4..0x01A8` packet names.
- Retail reward/drop/score policy beyond the imported table data, especially
  `dropSheet`, `dropTableSheet`, `dropQualitySheet`, and raid chest spawn/open
  timing.
- Server authorization rules. Client decomp shows what the client expects, but
  the server still has to decide which transitions are legal.

This is probably the useful boundary for the current Yokimitsuro pass: we have
the transport, client runtime, content class shape, and data table targets. The
remaining work should be implementation and targeted live/capture validation,
not more broad searching.
