# SimpleQuestBattle Director Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\simple_quest_battle_director_contract_20260619`.

## High-signal findings

- Recovered SimpleQuestBattle inventory has `61` Lua files: `60` child directors plus the base class.
- Local quest director coverage for this family is effectively absent: `0` recovered child directors have exact local director files.
- `55` recovered child directors point at quest codes that do have local quest scripts, but those scripts currently bypass the recovered simple-battle director layer.
- `3` child directors override `getOwnClientQuestIdAsSimple`; those literal ids must be preserved in any adapter table.
- Local runtime has usable building blocks: `CreateContentArea`, `PrivateAreaContent`, `DoZoneChangeContent`, `StartContentGroup`, `HandleBNpcKill`, and director `OnKillBNpc` dispatch.
- Local content maps are much narrower: `8` content scripts versus `60` recovered battle directors.
- The safest smoke candidate is `Man0u0`/`SimpleContent30079`: local quest/director/content scripts already create a simple content area, spawn target class `2203301`, finish after one kill, and zone the player back out.
- `Man2g` is not a good first probe because the combat/content-area path is explicitly WIP/commented.
- Existing QCI (`!qciprobe`) can help as a debug overlay for limit time/direct/point sync, but it should not be treated as the SimpleQuestBattle adapter.

## 2026-06-20 Probe Specifics Addendum

- First probe tuple: quest `110009`, area class `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`, private/content key `SimpleContent30079`, director `Quest/QuestDirectorMan0u001`, target BNPC `2203301`.
- Mirror the local `Man0u0` entry path only for GM/test characters in the expected quest state: `CreateContentArea`, `StartDirector(false)`, `noticeEvent`, `SetLoginDirector`, and `DoZoneChangeContent(..., spawnType 16)`.
- Validation target is exactly one completion path: kill spawned goobbue `2203301`, then verify `Player.HandleBNpcKill -> owned director -> ContentFinished -> return warp` once.
- Preserve recovered explicit quest-id overrides before generating broad shims: `QuestDirectorCom0l601 -> 111406`, `QuestDirectorCom0u501 -> 111805`, and `QuestDirectorEtc3g201 -> 110736`.
- Broad migration stays blocked on `QuestDirectorWork` sync, give-up/cancel ask row `25230`, `ContentCommand` director-work sync, and proven content-area/director lifecycle ordering.

## 2026-06-20 Battle Helper Addendum

- `SimpleQuestBattleBaseClass` exists only in recovered decomp output locally. No local `SimpleQuestBattleBaseClass` adapter or recovered child director scripts are present.
- Local quest battle execution is bespoke `Man*` private/simple content, not the recovered SimpleQuestBattle layer. Known local creators include `man0g0`, `man0l0`, `man0l1`, `man0u0`, `man200`, and `man2g0`.
- No dedicated recovered `QuestBattleWidget` or quest-battle packet was found. Recovered quest/director HUD routing uses contents-info kind `1` and `GuildleveExecutionWidget`.
- The recovered base exposes `eventContentGiveUp` and quest-id helpers; local work still needs a centralized give-up/cancel flow around ask row `25230` before recovered children can be enabled.

## 2026-06-21 QCI Adjacency Note

- QCI/GC701/NMRush kind `1` overlays prove the content-information HUD lane only. They do not provide SimpleQuestBattle ownership, kill tracking, give-up semantics, or return-point handling.
- `SimpleQuestBattleBaseClass` adds no recovered work fields; its meaningful recovered behavior is `eventContentGiveUp` asking row `25230` with mode `2` and the owning client quest id.
- Preserve explicit recovered client quest id overrides in any table adapter: `Com0l601 -> 111406`, `Com0u501 -> 111805`, and `Etc3g201 -> 110736`.
- Keep the first ownership smoke on `Man0u0` / `SimpleContent30079`: verify exactly one `HandleBNpcKill -> owned director -> ContentFinished -> return zone` path before adding generated child directors.

## Family Coverage

| Family | Category | Directors | Local Quest Scripts | Explicit IDs | Sample Codes |
| --- | --- | ---: | ---: | ---: | --- |
| etc | side_special_misc | 16 | 16 | 1 | etc1u7; etc1u8; etc1u9; etc2g3; etc2g4; etc2g5; etc2i2; etc2l1; etc2u0; etc2u5; etc3g1; etc3g2 |
| com | grand_company | 11 | 11 | 2 | com0g1; com0g4; com0g6; com0l1; com0l4; com0l5; com0l6; com0u1; com0u4; com0u5; com0u6 |
| gcg | grand_company | 5 | 5 | 0 | gcg103; gcg301; gcg302; gcg303; gcg305 |
| gcl | grand_company | 5 | 5 | 0 | gcl103; gcl301; gcl302; gcl303; gcl305 |
| gcu | grand_company | 5 | 5 | 0 | gcu103; gcu301; gcu302; gcu303; gcu305 |
| sim | unknown_or_test | 5 | 0 | 0 | sim000; sim000; sim000; sim000; sim000 |
| brd | job | 2 | 2 | 0 | brd0j1; brd0j4 |
| drg | job | 2 | 2 | 0 | drg0j1; drg0j6 |
| pld | job | 2 | 2 | 0 | pld0j1; pld0j5 |
| war | job | 2 | 2 | 0 | war0j1; war0j3 |
| whm | job | 2 | 2 | 0 | whm0j1; whm0j4 |
| blm | job | 1 | 1 | 0 | blm0j1 |
| mnk | job | 1 | 1 | 0 | mnk0j1 |
| wvr | class | 1 | 1 | 0 | wvr306 |

## What Is Still Missing

| Priority | Gap | Count | Next |
| --- | --- | ---: | --- |
| P1 | No local SimpleQuestBattleBaseClass adapter | 1 | Create a GM-only local adapter/probe before adding individual simple-battle directors. Start against `Man0u0`/`SimpleContent30079` and local `PrivateAreaMasterSimpleContent`. |
| P1 | Recovered simple quest battle directors have no local director scripts | 60 | Generate table-driven director shims that bind a quest code, content script, give-up policy, and kill-complete callback. |
| P1 | Local quest scripts exist but bypass the recovered simple-battle director layer | 55 | Convert exactly one local script into a GM-only smoke test first; do not broad-enable recovered children. |
| P1 | Local simple content maps are far fewer than recovered battle directors | 52 | Separate director parity from map/spawn parity: first add director contract, then add content maps per quest. |
| P2 | Recovered explicit client quest id overrides must be preserved | 3 | Store explicit id overrides in a table and prefer them over class-name inference. |
| P2 | Recovered simple/test directors do not map to local quest scripts | 5 | Keep SIM/test directors as validation fixtures; do not expose them as player content. |
| P2 | Give-up/cancel semantics are not locally centralized | 1 | Add a standard give-up flow that abandons/returns from content without corrupting quest state. |
| P3 | Only a small set of quest scripts currently creates PrivateAreaMasterSimpleContent | 6 | Use these as local runtime smoke tests before creating new simple battle content maps. |

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | GM-only SimpleQuestBattle adapter/probe | Data/scripts/directors/Quest or shared director helper; first target `Man0u0`/`SimpleContent30079` |
| 2 | Director registry table | new local table or generated Lua shims |
| 3 | Give-up flow | quest/director event handling |
| 4 | Content map templates | Data/scripts/content |
| 5 | Quest script handoff | Data/scripts/quests |

## Generated Files

- `source_inventory.csv` (5 rows)
- `simplequestbattle_director_inventory.csv` (61 rows)
- `simplequestbattle_family_coverage.csv` (14 rows)
- `simplequestbattle_client_quest_id_overrides.csv` (3 rows)
- `local_content_script_surface.csv` (8 rows)
- `local_create_content_area_calls.csv` (6 rows)
- `local_backend_surface.csv` (15 rows)
- `local_gap_matrix.csv` (8 rows)
- `implementation_contract.csv` (5 rows)
- `probe_queue.csv` (5 rows)

## Safe Probe Sequence

1. Keep all recovered SimpleQuestBattle children disabled.
2. Add a GM-only `sqbprobe` using existing `PrivateAreaMasterSimpleContent` plumbing and `SimpleContent30079` first.
3. Let the probe expose the recovered client class path, but keep server behavior local: kill count, `ContentFinished`, `EndDirector`, and return/zone-out handling.
4. Use QCI only as a separate optional debug overlay for timer/direct/point sync.
5. Block broad migration until `QuestDirectorWork`, give-up/cancel ask row `25230`, content-command behavior, and lifecycle order are proven.
- `source_term_hits.csv` (335 rows)
- `contract_summary.json`
- `README.md`

## 2026-06-21 Local Launch Boundary

- Current local quest-battle evidence is bespoke Man* simple-content wiring, not recovered `SimpleQuestBattleBaseClass` parity. The strongest local anchors are `man0u0.lua`, `SimpleContent30079.lua`, and `QuestDirectorMan0u001.lua`.
- Recovered `SimpleQuestBattleBaseClass` and its 61 child files remain recovered-only for local purposes. Do not migrate child directors until a GM-only adapter proves setup, give-up/cancel, death/fail, completion, return, and cleanup order.
- QCI/quest content information can be used as a debug overlay only. It does not prove SQB execution, ContentCommand routing, or quest-director lifecycle ownership.
- Dense class-tail probes such as `wvr306` that have recovered SQB children should stay scene/log-only until the base adapter exists.
