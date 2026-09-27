# Chocobo Caravan Tail Contract - 2026-06-19

## Executive Summary

This pass closes the remaining Chocobo caravan backlog that was not covered by the core caravan director/NPC pass or the HUD adapter pass. The missing tail is mostly mount, rental, and identity glue rather than new caravan director behavior.

| metric | value |
| --- | --- |
| sources_present | 26/26 |
| tail_surfaces | 9 |
| covered_this_pass_backlog_rows | 7 |
| covered_prior_backlog_rows | 4 |
| function_contracts | 50 |
| local_gaps | 7 |
| probes | 11 |

## What This Found

- `ChocoboNamingWidget` is the canonical my-chocobo naming validator. It opens as `Ask/ChocoboNamingWidget`, confirms with text row `7015`, and returns the converted name only on positive confirmation.
- `ChocoboRideCommand` is stricter than the local event script: retail uses area master mount flags, an `_isWarpRideChocobo` exception, a `_isPushingOut` block, and `26002` for chocobo versus `26020` for goobbue.
- `ChocoboJudge` is the missing static actor `320013` contract. It classifies riding by main state `15`, uses riding grade `257` for goobbue, and owns the mounted error remap table.
- `ChocoboRentalTimerWidget` is already supportable from local packet data. `SetCurrentMountChocoboPacket` carries absolute `rentalExpireTime`; the missing piece is the DesktopWidget `processRentalChocobo(expiry)` bridge and hide-on-dismount update.
- `ChocoboStop`, `ChocoboSpeedDownStatus`, and `ChocoboBaseClass` are low-behavior identity/class-path surfaces. They matter because local SQL/backlog references can still instantiate or inherit them.
- Local name persistence/issuance exists, but non-ASCII names remain unsafe until packet and DB encoding are proven. The current path length-checks Unicode but sends/stores through ASCII/latin1-oriented pieces.

## Tail Surface Matrix

| surface | retail_class | local_candidate | coverage_status | remaining_gap |
| --- | --- | --- | --- | --- |
| widget/ask/chocobonamingwidget.lua | ChocoboNamingWidget : AskBaseClass | Data/scripts/base/chara/npc/populace/PopulaceChocoboLender.lua calls eventSetChocoboName indirectly | tail_contract | Need explicit local widget bridge/test for Ask/ChocoboNamingWidget and 1080101 actor dependency. |
| chara/npc/object/chocobostop.lua | ChocoboStop : NpcBaseClass | Data/sql/gamedata_actor_class.sql has 1090464 -> /Chara/Npc/Object/ChocoboStop | tail_contract | Local script file is absent; add no-op class so the SQL binding resolves cleanly. |
| command/game/prog/chocoboridecommand.lua | ChocoboRideCommand : ProgCommandBaseClass | Data/scripts/commands/ChocoboRideCommand.lua | tail_contract | Local command uses hardcoded city/dungeon lists and sends goobbue no-call row 26020 for chocobo too. |
| judge/chocobojudge.lua | ChocoboJudge : JudgeBaseClass | Player mountState has equivalent data, but no local static judge actor 320013 surface. | tail_contract | Need static actor or server helper that exposes grade 257 goobbue predicates and error remaps to command/UI paths. |
| widget/chocoborentaltimerwidget.lua | ChocoboRentalTimerWidget : WidgetBaseClass | Player.rentalExpireTime/rentalMinLeft and SetCurrentMountChocoboPacket carry timer data | tail_contract | Need packet/UI bridge that calls processRentalChocobo(expiry) and hides timer on dismount/status update. |
| status/chocobospeeddownstatus.lua | ChocoboSpeedDownStatus : StatusBaseClass | Local heavy/movement-speed systems exist, but no ChocoboSpeedDownStatus class binding found. | tail_contract | Add class identity/status metadata if the caravan slowdown status appears in status packets or status tables. |
| chara/npc/monster/chocobo/chocobobaseclass.lua | ChocoboBaseClass : MonsterBaseClass | Local ChocoboCaravanGuard script exists, but base class path is not mirrored as a script. | tail_contract | Add base script alias only if local Lua class resolution needs the retail inheritance path. |
| widget/desktopwidget_connector mount helpers | DesktopWidget bridge | No local DesktopWidget script; server packets and command calls provide partial behavior. | tail_contract | Need server-to-client command bridge awareness for rental timer, goobbue status, and riding error text remaps. |
| chara/npc/populace/populacechocobolender.lua tail | PopulaceChocoboLender | Data/scripts/base/chara/npc/populace/PopulaceChocoboLender.lua | tail_contract | Local note already captures 1080101 crash risk; keep actor spawns in Limsa/Gridania/Ul'dah in sync with lender flows. |

## Local Gaps

| priority | gap | implementation_contract |
| --- | --- | --- |
| P1 | ChocoboRideCommand retail gate mismatch | Move no-ride policy to area flags or mirror them in the command bridge; keep 26002 for chocobo and 26020 for goobbue. |
| P1 | Missing ChocoboJudge/static actor 320013 surface | Add a static judge helper/actor facade backed by Player state, hasChocobo, hasGoobbue, and grade 257 semantics. |
| P1 | Rental timer UI bridge missing | On rental mount/zone init, call or emulate processRentalChocobo(rentalExpireTime); hide on dismount/status update. |
| P2 | Naming widget validation not pinned by a local contract/test | Add tests/probes for non-Chinese length, row 7015 confirmation, converted-name persistence, cancel empty string, and keep non-ASCII/Chinese capture-only until encoding is proven. |
| P2 | ChocoboStop script missing despite SQL binding | Add a no-op NpcBaseClass object with dummy integer32 work and empty defTalk. |
| P2 | ChocoboSpeedDownStatus class identity missing | Add class metadata only if status table or packets reference the retail status name. |
| P3 | ChocoboBaseClass inheritance alias missing | Add a base class alias if the local Lua loader starts resolving retail inheritance names. |

## Implementation Contract

| step | area | action | acceptance |
| --- | --- | --- | --- |
| 1 | object_binding | Add/verify /Chara/Npc/Object/ChocoboStop script. | Actor class 1090464 can instantiate without missing-script errors and defTalk is inert. |
| 2 | mount_judge | Implement a ChocoboJudge-equivalent helper around Player mount state, hasChocobo, hasGoobbue, and goobbue grade 257. | canRide/isRide/chocobo/goobbue predicates and error remaps match ride_judge_contract.csv. |
| 3 | command_gate | Bring local ChocoboRideCommand can-fire policy in line with retail: command 12014, area flags, warp-ride exception, pushing-out guard, and message split. | Restricted chocobo call returns 26002; restricted goobbue call returns 26020; already riding and invalid dismount return 32501. |
| 4 | timer_bridge | Drive DesktopWidget.processRentalChocobo or equivalent from SetCurrentMountChocoboPacket.rentalExpireTime. | Rental timer shows from absolute expiry after rental mount and hides after dismount/expiry. |
| 5 | naming_widget | Pin ChocoboNamingWidget ask behavior with tests/probes and preserve actor 1080101 spawn dependency. | Valid names confirm through row 7015; cancel/close returns empty string; 1080101 spawns exist in three city instances. |
| 6 | status_base | Keep ChocoboSpeedDownStatus and ChocoboBaseClass as low-risk identity shims unless packet/status probes require behavior. | No missing class path errors when caravan status or guard inheritance surfaces are exercised. |

## Probe Queue

| probe | setup | expectation |
| --- | --- | --- |
| naming_non_chinese | Open Ask/ChocoboNamingWidget on non-Chinese client. | Alphabet-only names shorter than 3 keep Decide disabled; 3 to 10 letters enable Decide. |
| naming_chinese | Open Ask/ChocoboNamingWidget on Chinese client with accepted user-work chars. | Capture-only until local packet/DB encoding proves non-ASCII can round-trip safely; invalid first char disables Decide. |
| naming_confirm_cancel | Press Decide, then confirm and cancel CommonDialogWidget row 7015. | Confirm returns converted name; cancel/close returns empty string and local lender keeps cancel branch. |
| hidden_visual_actor | Start my-chocobo acquisition in Limsa/Gridania/Ul'dah. | Actor 1080101 exists and transform/camera calls do not crash the client. |
| ride_gate_chocobo | Attempt command 12014 in no-ride area as chocobo. | Blocked with text row 26002, not goobbue row 26020. |
| ride_gate_goobbue | Attempt command 12014 with goobbue arg in no-ride area. | Blocked with row 26020 and goobbue helper paths use grade 257 semantics. |
| ride_gate_pushing_out | Attempt mount while _isPushingOut equivalent is true. | Blocked with same selected 26002/26020 message. |
| goobbue_error_remaps | Trigger mounted Teleport/Return/follow restrictions while riding goobbue. | 26005/26010/26013/26014/32507 remap to 26022/26024/26029/26030/32508. |
| rental_timer | Rent chocobo for 10 minutes and zone once. | Timer shows from absolute expiry, minutes tick down, and widget hides on expiry/dismount. |
| chocobostop_binding | Spawn actor class 1090464. | No-op ChocoboStop binds with dummy work and empty talk. |
| speed_down_status | Apply caravan/chocobo slowdown status if status id is identified. | Client/server classify it as bad status. |

## Artifact Index

- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/README.md`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/contract_summary.json`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/source_inventory.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/function_contracts.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/tail_surface_matrix.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/recommended_backlog_closure.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/naming_widget_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/ride_command_judge_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/rental_timer_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/status_base_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/local_api_surface.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/local_gap_matrix.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/implementation_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/probe_queue.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/text_row_contract.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/class_binding_probe.csv`
- `tools/outputs/lpb/chocobo_caravan_tail_contract_20260619/source_term_hits.csv`

## Source Notes

- Prior caravan widget/director rows are marked `covered_prior`; this pass deliberately avoids redoing the full ChocoboCaravanWidget/CaravanGuardDirector contract.
- The local backend already has useful C# support for mount state, rental expiry, and packet emission. The most valuable next implementation work is the command/judge/UI bridge, not a replacement of that backend.
