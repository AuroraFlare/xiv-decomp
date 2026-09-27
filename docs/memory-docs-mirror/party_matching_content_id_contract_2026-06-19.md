# Party matching content-ID contract (2026-06-19)

This pass pulls `PcMatchingEditWidget` out as a validator for content IDs and party-matching visibility. It should help keep the other contracts honest: Toto-Rak is ID `1`, Dzemael is `2`, Hamlet is `8/9/10`, and Caravan route/place pairs are explicit.

## Boundary

- Party Matching uses `_getOccupancyContentsTime(id)` to decide whether many content rows are visible.
- It formats names and stores selected IDs, but it does not start the duty, open the duty widget, or prove the `InstanceRaidBaseClass.startEvent` owner.
- Use this contract to validate constants and eligibility; use the dungeon/Hamlet/Caravan contracts for lifecycle and widget behavior.

## Focused crosswalk

| family | id_or_key | name_or_meaning | pc_matching_evidence | local_status | implementation_use |
| --- | --- | --- | --- | --- | --- |
| raid_dungeon | 1 | the Thousand Maws of Toto-Rak | _getOccupancyContentsTime(1) -> setGLComboBoxData(..., 1, 0, 0) | local_present_totorak | WorldManager.GetTotorakRaidDungeonId returns 1; normal StartTotorakInstance exists. |
| raid_dungeon | 2 | Dzemael Darkhold | _getOccupancyContentsTime(2) -> setGLComboBoxData(..., 2, 0, 0) | local_missing_or_unwired | No comparable Dzemael/Aurum/Cutter/Castrum local start path was found in this pass. |
| raid_dungeon | 6 | Aurum Vale | _getOccupancyContentsTime(6) -> setGLComboBoxData(..., 6, 0, 0) | local_missing_or_unwired | No comparable Dzemael/Aurum/Cutter/Castrum local start path was found in this pass. |
| raid_dungeon | 7 | Cutter's Cry | _getOccupancyContentsTime(7) -> setGLComboBoxData(..., 7, 0, 0) | local_missing_or_unwired | No comparable Dzemael/Aurum/Cutter/Castrum local start path was found in this pass. |
| raid_dungeon | 13 | Castrum Novum Transmission Tower | _getOccupancyContentsTime(13) -> setGLComboBoxData(..., 13, 0, 0) | local_missing_or_unwired | No comparable Dzemael/Aurum/Cutter/Castrum local start path was found in this pass. |
| primal_trial | 4, 3, 14 | the Bowl of Embers normal, hard, extreme | _getOccupancyContentsTime(4/3/14) gates Ifrit rows | client_authority_only | Use as content ID/display validation; local startEvent/relogin lifecycle still needs capture or separate implementation. |
| primal_trial | 5 | Thornmarch | _getOccupancyContentsTime(5) gates Thornmarch row | client_authority_only | Use as content ID/display validation; local startEvent/relogin lifecycle still needs capture or separate implementation. |
| primal_trial | 12, 11 | the Howling Eye normal, hard | _getOccupancyContentsTime(12/11) gates Garuda rows | client_authority_only | Use as content ID/display validation; local startEvent/relogin lifecycle still needs capture or separate implementation. |
| rivenroad | 15, 16 | Rivenroad normal and hard | _getOccupancyContentsTime(15/16); display rows use GC/story IDs 111433/111633/111833 and 110870 | client_authority_only | Use as content ID/display validation; local startEvent/relogin lifecycle still needs capture or separate implementation. |
| hamlet | 8, 9, 10 | Battle for Aleport, Hyrstmill, Golden Bazaar | _getOccupancyContentsTime(8/9/10) -> setGLComboBoxData slots 1/2/3 | local_present_hamlet_ids | HamletDefenseData constructor rows carry raidDungeonId 8/9/10 for Aleport/Hyrstmill/Golden Bazaar. |
| caravan_route | 1280005 -> 1031 | caravan route/place pair | setGLComboBoxData(1, 1280005, 1031, 0) | local_backend_present_metadata_missing | ChocoboCaravanRoute has DisplayGuildleveId and movement metadata, but no route/place pair fields matching this PcMatching row. |
| caravan_route | 1280003 -> 1030 | caravan route/place pair | setGLComboBoxData(2, 1280003, 1030, 0) | local_backend_present_metadata_missing | ChocoboCaravanRoute has DisplayGuildleveId and movement metadata, but no route/place pair fields matching this PcMatching row. |
| caravan_route | 1280066 -> 2004 | caravan route/place pair | setGLComboBoxData(3, 1280066, 2004, 0) | local_backend_present_metadata_missing | ChocoboCaravanRoute has DisplayGuildleveId and movement metadata, but no route/place pair fields matching this PcMatching row. |
| caravan_route | 1280073 -> 2003 | caravan route/place pair | setGLComboBoxData(4, 1280073, 2003, 0) | local_backend_present_metadata_missing | ChocoboCaravanRoute has DisplayGuildleveId and movement metadata, but no route/place pair fields matching this PcMatching row. |
| caravan_route | 1280034 -> 3043 | caravan route/place pair | setGLComboBoxData(5, 1280034, 3043, 0) | local_backend_present_metadata_missing | ChocoboCaravanRoute has DisplayGuildleveId and movement metadata, but no route/place pair fields matching this PcMatching row. |
| caravan_route | 1280033 -> 3044 | caravan route/place pair | setGLComboBoxData(6, 1280033, 3044, 0) | local_backend_present_metadata_missing | ChocoboCaravanRoute has DisplayGuildleveId and movement metadata, but no route/place pair fields matching this PcMatching row. |

## Visibility and formatting

| surface | function | ids_or_pairs | pcmatching_rule | implementation_meaning |
| --- | --- | --- | --- | --- |
| Raid dungeon list | makeRaidList | 1, 2, 6, 7, 13 | Each row appears only when player:_getOccupancyContentsTime(id) > 0; otherwise its combo item is hidden. | Party matching exposes the client's eligible old/modern raid-dungeon IDs; it does not start the dungeon. |
| Primal/Rivenroad list | makeBanshinList | 4, 3, 14, 5, 12, 11, 15, 16 | Rows are gated by _getOccupancyContentsTime; Ifrit/Garuda/Thornmarch rows can mask specific place IDs; Rivenroad 15/16 use story/GC display rows. | Use these IDs as the content-ID authority, but lifecycle still needs InstanceRaidBaseClass/capture evidence. |
| Hamlet list | makeHamletList | 8, 9, 10 | Aleport/Hyrstmill/Golden Bazaar appear only when _getOccupancyContentsTime(8/9/10) is positive. | Local HamletDefenseData already carries raidDungeonId 8/9/10; keep this aligned with widget/probe payloads. |
| Chocobo Caravan list | makeChocoboList | 1280005->1031, 1280003->1030, 1280066->2004, 1280073->2003, 1280034->3043, 1280033->3044 | The six route/place pairs are listed directly; no _getOccupancyContentsTime gate is visible in this function. | Local caravan route metadata needs route/place IDs if it wants party-matching parity. |
| Rush list | makeRushList | 51143, 51144 | Two fixed rows are inserted directly. | Matches the NMRush content-widget contract; keep as display/timer widget validation, not instance lifecycle. |
| NM list | makeNMList | 3107616, 3102012, 3100801, ... | Large fixed NM row list is inserted directly after resetGLList. | Useful for future party-matching UI parity, out of scope for dungeon/widget lifecycle. |
| Party capacity | numberOfPeopleRemain | n/a | Returns 7 when countPartyMember() == 0, otherwise 8 - countPartyMember(). | Party matching assumes an eight-person ceiling and reserves space around the current party. |
| Recruit operation guard | processUICommandOperate | 10001, 10002 | Blocks/notify 30507 when player confirm group command variation is 10001/10002, and has an additional multi-member party guard branch. | Do not use this widget as a server content-entry validator; it only guards recruitment UI state. |

## Local gaps

| gap | evidence | risk | next |
| --- | --- | --- | --- |
| No local _getOccupancyContentsTime provider | Search found content timers and requestedData/contentTimers, but no local method named _getOccupancyContentsTime. | Party Matching visibility cannot mirror retail eligibility until a content-availability provider exists. | Map each content ID to an availability/remaining-time source before exposing the matching list. |
| Toto-Rak is the only raid dungeon ID wired locally | WorldManager.GetTotorakRaidDungeonId returns 1 and StartTotorakInstance exists. | IDs 2/6/7/13 can be visible in client taxonomy but have no local lifecycle target. | Keep unimplemented IDs hidden or clearly non-startable until corresponding content exists. |
| Hamlet raid IDs and display IDs are easy to mix | HamletDefenseData stores displayGuildleveId, titleWidgetIndex, and raidDungeonId separately; PcMatching uses raidDungeonId 8/9/10. | Score/ranking/widget probes can pass a display row where the client expects the raid/content ID. | Name the parameters explicitly in probes and packet builders. |
| Caravan route/place pairs are absent from local route metadata | PcMatching lists six route/place pairs, while local ChocoboCaravanRoute has DisplayGuildleveId and waypoints only. | Retail signup/party matching cannot identify routes with the same IDs the client lists. | Add routeDisplayId/placeId metadata to caravan route definitions. |
| Trial/Rivenroad IDs still need lifecycle evidence | PcMatching validates IDs 3/4/5/11/12/14/15/16, but content-system confidence still marks live startEvent capture as required. | Starting trials from ID evidence alone can pick the wrong owner/eventType/cutscene args. | Use the IDs for names/availability only until InstanceRaidBaseClass start/relogin packets are captured or emulated. |

## Bridge queue

| priority | surface | target | implementation_note | verification |
| --- | --- | --- | --- | --- |
| 1 | Content ID registry | shared constants or data table for content IDs | Centralize raid dungeon, trial, Hamlet, Rivenroad, rush, and caravan route/place IDs using the PcMatching crosswalk as validation data. | A debug command prints the registry and matches the focused crosswalk rows. |
| 2 | Occupancy availability provider | player/content timer or future occupancy eligibility API | Expose the equivalent of _getOccupancyContentsTime(id) for IDs that should appear in party matching; do not conflate cooldown timers with active du... | Toto-Rak ID 1 appears only when eligible/available according to the selected policy. |
| 3 | Toto-Rak/Dzemael ID sanity | legacy dungeon widget and start paths | Keep content ID 1 for Toto-Rak and 2 for Dzemael across Party Matching, RaidDungeonExecutionWidget, and server entry checks. | Legacy dungeon contract and party-matching contract agree on IDs 1/2. |
| 4 | Hamlet ID alignment | HamletDefenseData/HamletDefenseDirector/HamletDefenseManager probes | Keep raidDungeonId 8/9/10 aligned with Aleport/Hyrstmill/Golden Bazaar; separately audit displayGuildleveId/titleWidgetIndex usage. | Hamlet score/ranking/requestedData probes use the same raidDungeonId values surfaced by Party Matching. |
| 5 | Caravan route/place metadata | ChocoboCaravanRoute and signup route data | Add route display ID and place ID fields for the six Party Matching route/place pairs instead of relying only on DisplayGuildleveId 10826. | A route can be rendered as the same pair PcMatchingEditWidget lists. |
| 6 | Trial and Rivenroad lifecycle boundary | future InstanceRaidBaseClass start/relogin capture work | Use PcMatching IDs 3/4/5/11/12/14/15/16 for names/eligibility, but require startEvent/cutscene capture before driving lifecycle. | No server start path is added from Party Matching evidence alone. |
| 7 | Party matching UI probe | GM/debug requestedData or client widget observation | Probe which IDs become visible when content timers/eligibility are toggled; log _getOccupancyContentsTime-equivalent values if exposed. | Visibility in PcMatchingEditWidget changes with the same IDs recorded in the report. |

## Key functions

| function | start_line | end_line | key_terms | contract_note |
| --- | --- | --- | --- | --- |
| PcMatchingEditWidget.makePurposeList | 129 | 150 | PcMatchingEditWidget; setPurposeList; countPartyMember | Builds the top-level party-matching purpose modes; content modes 15/16/17/19/34/20/18/32 are the important validators. |
| PcMatchingEditWidget.makeRaidList | 176 | 212 | PcMatchingEditWidget; makeRaidList; setGLComboBoxData; _getOccupancyContentsTime | Gates raid dungeon IDs 1/2/6/7/13 through _getOccupancyContentsTime and fills content-name rows. |
| PcMatchingEditWidget.makeBanshinList | 213 | 330 | PcMatchingEditWidget; makeBanshinList; setGLComboBoxData; _getOccupancyContentsTime; maskPlaceList; getBelongGrandCompany | Gates primal and Rivenroad IDs; masks place IDs for some trials and uses GC/story display rows for Rivenroad. |
| PcMatchingEditWidget.makeBanzokuList | 331 | 338 | PcMatchingEditWidget; setGLComboBoxData |  |
| PcMatchingEditWidget.makeHamletList | 339 | 357 | PcMatchingEditWidget; makeHamletList; setGLComboBoxData; _getOccupancyContentsTime | Gates Hamlet Defense IDs 8/9/10 through _getOccupancyContentsTime. |
| PcMatchingEditWidget.makeChocoboList | 358 | 366 | PcMatchingEditWidget; makeChocoboList; setGLComboBoxData | Lists six caravan route/place pairs directly; no occupancy-time gate in this function. |
| PcMatchingEditWidget.makeRushList | 367 | 372 | PcMatchingEditWidget; makeRushList; setGLComboBoxData | Lists NMRush display rows 51143 and 51144. |
| PcMatchingEditWidget.makeNMList | 373 | 415 | PcMatchingEditWidget; makeNMList; setGLComboBoxData | Large fixed NM matching list; useful later but not a duty lifecycle source. |
| PcMatchingEditWidget.makeLevelingList | 416 | 420 | PcMatchingEditWidget; makeLevelingList; setGLComboBoxData | Fixed leveling row 2965 with stored value 102. |
| PcMatchingEditWidget.setGLComboBoxData | 421 | 472 | PcMatchingEditWidget; setGLComboBoxData | Formats list text based on purpose mode and stores the selected ID into ComboBoxItem_GLName user work. |
| PcMatchingEditWidget.makePlaceList | 473 | 586 | PcMatchingEditWidget |  |
| PcMatchingEditWidget.maskPlaceList | 603 | 613 | PcMatchingEditWidget; maskPlaceList |  |

## Generated artifacts

- `tools\outputs\lpb\party_matching_content_id_contract_20260619\README.md`: 1 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\bridge_queue.csv`: 7 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\content_id_crosswalk_focused.csv`: 16 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\contract_summary.json`: 1 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\local_content_id_hits.csv`: 91 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\local_gap_summary.csv`: 5 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\occupancy_visibility_gates.csv`: 3 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\pcmatching_combo_literals.csv`: 57 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\pcmatching_function_contracts.csv`: 19 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\pcmatching_gating_contract.csv`: 8 rows
- `tools\outputs\lpb\party_matching_content_id_contract_20260619\purpose_mode_matrix.csv`: 16 rows
