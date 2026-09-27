# Private-Area Base/Content/Occupancy Contract - 2026-06-19

## Executive Summary

This pass closes the private-area backlog bucket at the contract level: area base state, static private-area masters, runtime content masters, occupancy private areas, zone-master identity leaves, and the content range marker.

| metric | value |
| --- | --- |
| sources_present | 37/37 |
| backlog_surfaces | 43 |
| function_contracts | 74 |
| static_private_area_rows | 59 |
| canExitArea_true | 12 |
| zone_identity_surfaces | 26 |
| local_gaps | 7 |
| probes | 10 |

## What This Found

- `AreaBaseClass` is the important recovered base: it stores `actorNumber`, `isInstanceRaid`, and `isEntranceDesion`, calls `_setInstanceRaid`, preloads common spreadsheets, and creates `cutReplaySheet` for inns.
- `PrivateAreaBaseClass`, runtime content masters, occupancy base, `RaidDungeonSimple`, and most `ZoneMaster*` files are thin identity/work-init surfaces. They still matter because local SQL and scripts use those class paths.
- Local C# already has strong static and runtime private-area plumbing: static `PrivateArea`, dynamic `PrivateAreaContent`, return points, re-entry tickets, and Toto-Rak runtime content creation.
- The dangerous gap is not raw content creation; it is client-facing bind/state parity. Static/runtime private areas currently send `isInstanceRaid=false` in bind params even though recovered `AreaBaseClass` knows how to call `_setInstanceRaid`.
- `ContentPrivateAreaRange` confirms marker names `exit` and `caution`; local marker/exit scripts and return-point helpers now exist, but live content-exit cleanup still needs validation.

## Top Backlog Rows

| normalized | priority | family | status | classes |
| --- | --- | --- | --- | --- |
| area/privatearea/privateareamastertest.lua | 81 | static_private_area | covered_this_pass | PrivateAreaMasterTest |
| area/areabaseclass.lua | 75 | area_base | covered_this_pass |  |
| area/privatearea/privateareamasterbranch.lua | 74 | static_private_area | covered_this_pass | PrivateAreaMasterBranch |
| area/privatearea/privateareamastermarket.lua | 74 | static_private_area | covered_this_pass | PrivateAreaMasterMarket |
| area/privatearea/content/privateareacontentbaseclass.lua | 73 | runtime_content | covered_this_pass | PrivateAreaContentBaseClass |
| area/privatearea/content/privateareamasterbattlefield.lua | 73 | runtime_content | covered_this_pass | PrivateAreaMasterBattleField |
| area/privatearea/content/privateareamasterrestrictarea.lua | 73 | runtime_content | covered_this_pass | PrivateAreaMasterRestrictArea |
| area/privatearea/content/privateareamastersimplecontent.lua | 73 | runtime_content | covered_this_pass | PrivateAreaMasterSimpleContent |
| area/privatearea/occupancy/privateareaoccupancybaseclass.lua | 66 | occupancy_private_area | covered_this_pass | PrivateAreaOccupancyBaseClass |
| area/privatearea/privateareabaseclass.lua | 66 | static_private_area | covered_this_pass |  |
| area/privatearea/privateareabaseclass_u.lua | 66 | static_private_area | covered_this_pass |  |
| area/privatearea/privateareamastercottage.lua | 66 | static_private_area | covered_this_pass | PrivateAreaMasterCottage |
| area/privatearea/privateareamastercruise.lua | 66 | static_private_area | covered_this_pass | PrivateAreaMasterCruise |
| area/privatearea/privateareamasterpast.lua | 66 | static_private_area | covered_this_pass | PrivateAreaMasterPast |
| chara/npc/object/contentprivatearearange.lua | 66 | object_range | covered_prior_plus_this_pass | ContentPrivateAreaRange |
| area/areabaseclass_u.lua | 61 | area_base | covered_this_pass |  |

## 2026-06-20 Runtime Split Addendum

- Dungeon/raid runtime split is clearer: Toto-Rak is partially live through the legacy `RaidFst0Dungeon03` occupancy lane, while AV/Cutter/trials remain `InstanceRaidBaseClass` identity/probe surfaces without production start/relogin/clear/fail bridge.
- Local exit coverage exists for `InstanceRaidExit`, `RaidDungeonExit`, `GimmickExitRect`, `RaidDungeonWarp`, `PrivateAreaPastExit`, and marker-only `ContentPrivateAreaRange`, but `RaidDungeonExit`/`InstanceRaidExit` placement and runtime return cleanup still need live validation before binding.
- `ContentCommand` remains a work-sync blocker, not a Lua-only task: add `DirectorWork.contentCommand/contentCommandSub`, `PlayerWork.variableCommandContent/Sub`, `directorWork` packet allowlisting, and runtime command-host capture before adding a local command script.
- `QuestContentInformationDirector` covers kind-1 content-info overlays (`GuildleveExecutionWidget`) for GC701/NMRush-style probes; it is not the raid/dungeon execution timer lane.
- Toto-Rak clear scene ownership starts through Shaula actor class `2301104`, but post-clear `ContentFinished`, rewards/coffers, success return, offline participant success, fail/end scenes, and duty-exit loot policy remain gated.
- Keep `WidgetOpenCommand` reject-only and keep raid/trial reward UI blocked until scoped loot package `5` -> backend `LOOT = 4` validation is in place.

## 2026-06-20 Area / Occupancy Helper Addendum

- Local C# runtime content is strong: `Zone.CreateContentArea` creates dynamic private content, director/content group state, return points, re-entry expiry, and participant tracking. That does not mean recovered Lua class-path parity is complete.
- Recovered area/private-area class paths are contract-covered but still missing local Lua shims: `AreaBaseClass`, `PrivateAreaBaseClass`, `PrivateAreaContentBaseClass`, `PrivateAreaMasterSimpleContent`, `PrivateAreaOccupancyBaseClass`, and `RaidDungeonSimple`.
- Toto-Rak is legacy partial-live, not modern `InstanceRaidBaseClass`: it uses `PrivateAreaMasterSimpleContent` plus a secondary legacy occupancy director/widget path.
- `OccupancyPlayersBaseClass` and `RaidPlayers` are thin recovered Lua, but they likely represent native/group wiring required by `InstanceRaidBaseClass`. The local generic `ContentGroup` is useful but not proven equivalent.
- Do not use broad `IsPrivate()` as active-raid proof. `CanUseRaidDungeonWarp` has Toto-Rak fallback behavior; prefer captured return points plus active instance state before broadening warp/exit logic.
- Safe order: verify class-path shims with bind flags unchanged, probe `PrivateAreaMasterSimpleContent` via `DoZoneChangeContent`, validate legacy `RaidFst0Dungeon03` owner/timer, then probe `_setInstanceRaid(true)` as a director-owned run-event after zone-in.

## 2026-06-21 Runtime/Parity Status

- Private-area runtime is locally implemented in C#: static private areas carry name/type and runtime `PrivateAreaContent` tracks participants, return points, re-entry, and expiry. The missing part is still recovered Lua class-path parity and narrow client instance-raid opt-in.
- `RaidDungeonSimple` is recovered as a thin identity leaf over `PrivateAreaOccupancyBaseClass`; no local shim exists. Add only minimal identity shims first, and keep private-area bind `isInstanceRaid=false` until a narrow GM probe proves the client path.
- `OccupancyPlayersBaseClass` and `RaidPlayers` are recovered thin group identities. Local `ContentGroup` is adjacent and useful, but not proven equivalent to recovered occupancy/player group wiring.
- `RaidDungeonHeadCount` is recovered-only and empty. Keep it absent until an object owner/spawn/EventStart context is captured; do not route it through generic terminal or WidgetOpen paths.
- Probe order remains static private entry/exit, runtime `PrivateAreaMasterSimpleContent` entry/exit/relog expiry, Toto-Rak legacy finish-time widget, then one GM-only modern AV `InstanceRaidBaseClass` lifecycle probe.

## Bind Param Contract

| owner | param | local_value | note |
| --- | --- | --- | --- |
| Zone.CreateScriptBindPacket | classPath | classPath | Public zone class path such as /Area/Zone/ZoneMasterSeaS0. |
| Zone.CreateScriptBindPacket | zoneName | ZoneName | AreaBaseClass.isNormalZone parses this. |
| Zone.CreateScriptBindPacket | privateAreaName | empty string | Public zone has no private area name. |
| Zone.CreateScriptBindPacket | privateAreaType | -1 | Recovered AreaBaseClass accepts this through _onInit/area native state. |
| Zone.CreateScriptBindPacket | canRideChocobo | canRideChocobo ? 1 : 0 | Also feeds recovered ChocoboRideCommand area gate. |
| Zone.CreateScriptBindPacket | isInstanceRaid | isInstanceRaid | Public zone value; not the same as static PrivateArea internal C# flag. |
| PrivateArea.CreateScriptBindPacket | privateAreaName | PrivateAreaName | Static private areas from server_zones_privateareas. |
| PrivateArea.CreateScriptBindPacket | privateAreaType | PrivateAreaType | Quest static instances use this heavily. |
| PrivateArea.CreateScriptBindPacket | isInstanceRaid | false in bind params | C# constructor passes true internally, but bind packet currently sends false to avoid client crash. |
| PrivateAreaContent.CreateScriptBindPacket | privateAreaType | dynamic type >= 100000 | Local addition lets concurrent instances/re-entry distinguish exact content area. |
| PrivateAreaContent.CreateScriptBindPacket | isInstanceRaid | false in bind params | InstanceRaidBaseClass lifecycle still needs separate opt-in director/state path. |

## Local Runtime Contract

| area | local_surface | behavior | retail_relation |
| --- | --- | --- | --- |
| static_private_area | PrivateArea | Stores parent zone, privateAreaName, privateAreaType, canExitArea, class path, music, and static spawns. | Backs PrivateAreaBaseClass and PrivateAreaMasterPast/Branch/Market/etc. |
| runtime_content | PrivateAreaContent | Extends PrivateArea with attached Director, re-entry policy, participants, return points, expiry, finish/destroy. | Backs PrivateAreaContentBaseClass and InstanceRaidBaseClass integration. |
| zone_registry | Zone.privateAreas/contentAreas | Keeps static private areas by name/type and runtime content areas by name plus dynamic type. | Client privateAreaType must identify the correct area. |
| content_creation | Zone.CreateContentArea | Creates director, allocates dynamic privateAreaType >= 100000, creates PrivateAreaContent. | Local runtime content is stronger than recovered Lua identity leaf. |
| static_warp | WorldManager.WarpToPrivateArea | Uses current zone and static privateAreaName/type through DoZoneChange. | Quest scripts depend on static PrivateAreaMasterPast types. |
| public_exit | WorldManager.WarpToPublicArea | Returns from private area to public area at supplied/current position. | PrivateAreaPastExit now calls this on allowed `exit` after sending 34110. |
| content_entry | WorldManager.DoZoneChangeContent | Registers return point, saves DB re-entry, sends 34108 instance message, zone-in packets, onZoneIn. | Needed for runtime content exits/relogin. |
| totorak | WorldManager.StartTotorakInstance | Creates PrivateAreaMasterSimpleContent runtime area, copies public spawns, starts director/content group, sets timed re-entry expiry. | Uses recovered content-area class path but not InstanceRaidBaseClass lifecycle yet. |
| exit_range | PrivateAreaPastExit.lua | Sends 34109 on caution and 34110 on exit when CanExitPrivateArea; allowed exit calls WarpToPublicArea, while disallowed repel remains TODO/commented. | ContentPrivateAreaRange confirms marker names exit/caution. |

## SQL Summary

| metric | value | detail |
| --- | --- | --- |
| static_private_area_rows | 59 | Rows in Data/sql/server_zones_privateareas.sql |
| canExitArea_true | 12 | Rows where PrivateAreaPastExit may leave to public area. |
| canExitArea_false | 47 | Rows where exit should warn/repel. |
| className_counts | /Area/PrivateArea/PrivateAreaMasterBranch:1; /Area/PrivateArea/PrivateAreaMasterPast:58 | Static private-area class path distribution. |
| privateAreaName_counts | PrivateAreaMasterMarket:1; PrivateAreaMasterPast:58 | Static private-area logical name distribution. |

## Local Gaps

| priority | gap | implementation_contract |
| --- | --- | --- |
| P1 | PrivateArea/PrivateAreaContent bind params still send isInstanceRaid=false | Do not blanket flip the flag. Add a narrow opt-in path only for content with captured retail director/instance state. |
| P1 | Static PrivateAreaPastExit allowed movement exists but disallowed repel remains incomplete | Validate the CanExitPrivateArea guarded public warp, then restore explicit warn/repel behavior for blocked exits. |
| P1 | Runtime content exit helper exists but live cleanup is unvalidated | Validate return-point exit, participant unregister, DB re-entry cleanup, cancel/yes prompt behavior, and unbound RaidDungeonExit/InstanceRaidExit placement before production binding. |
| P2 | Local recovered Lua class paths missing for PrivateAreaBaseClass and content/occupancy leaves | Add minimal class-path shims before switching more scripts to recovered paths. |
| P2 | Branch/Market cueAttentionOnClient UI not mirrored | Bridge or intentionally skip public information dialog on private office/market entry. |
| P2 | ZoneBaseClass/ZoneMaster identity leaves absent | Add identity shims when using retail zone class paths or scripts that rely on zoneWork. |
| P3 | Common spreadsheet preload parity is implicit | Keep server/client sheet availability probes around inn, quest private areas, and content entry. |

## Implementation Contract

| step | area | action | acceptance |
| --- | --- | --- | --- |
| 1 | class_shims | Add minimal AreaBaseClass/PrivateAreaBaseClass/ZoneBaseClass class-path shims if the local Lua loader needs retail paths. | Static private areas and public zones instantiate without missing-class errors. |
| 2 | static_exit | Validate PrivateAreaPastExit movement with CanExitPrivateArea guard and finish disallowed repel. | canExitArea=1 rows send 34110 and leave; canExitArea=0 rows warn/repel without public warp. |
| 3 | content_exit | Validate ContentPrivateAreaRange/InstanceRaidExit/RaidDungeonExit return-point exit helpers for PrivateAreaContent, but bind RaidDungeonExit/InstanceRaidExit only with DAT/spawn evidence or controlled test objects. | Runtime content exit returns to saved public/static area, unregisters participant, and clears re-entry ticket. |
| 4 | instance_flag | Probe narrow _setInstanceRaid true path only with matching director/content lifecycle. | No client crash; InstanceRaidBaseClass information widget path receives correct state. |
| 5 | ui_attention | Bridge Branch/Market cueAttentionOnClient or document intentional omission. | Office/market entry can display the same 60003 public info dialog rows when enabled. |
| 6 | runtime_content | Use PrivateAreaContent dynamic type/re-entry expiry for quest and dungeon content consistently. | Relog/rejoin and zone-out cleanup follow the same return-point policy for Toto-Rak and quest content. |

## Probe Queue

| probe | setup | expectation |
| --- | --- | --- |
| static_private_area_entry | Warp to several server_zones_privateareas rows. | Bind params carry privateAreaName/type and area enters with 34108 message. |
| static_exit_allowed | Trigger PrivateAreaPastExit exit in canExitArea=1 area. | 34110 sends and player returns to public area. |
| static_exit_blocked | Trigger exit in canExitArea=0 area. | Player is warned/repelled, not stranded or silently warped. |
| content_entry_return_point | Create PrivateAreaMasterSimpleContent and enter through DoZoneChangeContent. | Return point and DB re-entry row are saved before zone-in. |
| content_exit_return_point | Exit runtime content through ContentPrivateAreaRange/InstanceRaidExit helper. | TryGetReturnPoint destination is used, participant unregistered, re-entry cleared. |
| content_expiry_relog | Disconnect inside timed Toto-Rak content and let it expire. | Login recovers to saved return point rather than dead runtime area. |
| private_area_instance_flag | Opt-in _setInstanceRaid true only for a controlled content area. | No client crash and recovered in-duty UI can read instance state. |
| market_attention | Enter PrivateAreaMasterMarket rows by city/area type. | 60003 dialog uses city base plus area type offset. |
| branch_attention | Enter PrivateAreaMasterBranch in region 202/204/205. | 60003 dialog uses 1519/2534/3533 respectively. |
| inn_cut_replay_sheet | Enter and leave an inn zone. | cutReplaySheet exists only while in the inn and is deleted on finalize. |

## Artifact Index

- `tools/outputs/lpb/private_area_base_content_contract_20260619/README.md`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/contract_summary.json`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/private_area_backlog_closure.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/area_bind_param_contract.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/private_area_class_contract.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/zone_master_identity_contract.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/local_runtime_contract.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/static_private_area_rows.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/static_private_area_summary.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/private_area_base_content_contract_20260619/source_term_hits.csv`
