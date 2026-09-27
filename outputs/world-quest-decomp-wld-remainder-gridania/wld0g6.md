# Wld0g6 — quest 110767 — decomp note (Phase 1: Wld-G remainder)

Status: **UNRECOVERED content / VERIFIED wiring.** No quest content exists to implement.

## Verified facts (server repo + decomp atlas)

- Stub: `Data/scripts/quests/wld/wld0g6.lua` (3 lines, read directly):
  `require ("quests/generic_quest_scaffold")` + `InitQuestScaffold("Wld0g6")`.
- Scaffold key `Wld0g6` exists at `Data/scripts/quests/generic_quest_scaffold.lua:166`
  (`id = 110767`, `group = "side"`, `noOffer = true`, `markers = {}`).
- SQL: `Data/sql/gamedata_quests.sql:335` → `(110767, '[en]', 'Wld0g6', 0, 0)` =
  name `[en]`, prerequisite 0, minLevel 0. Lv.0 internal stub.
- Rewards: **zero matches** for `110767` in `Data/sql/gamedata_quest_rewards.sql`.
- Availability: `Data/scripts/quests/quest_availability.lua:468`, commented-out under
  `patch_unknown_or_internal`:
  `-- 110767, -- English name unavailable in gamedata [Lv. 0] - Not implemented - unknown/internal (Wld0g6)`.
  Untouched per work order.
- No NPC/mob binding: **zero matches** for `110767` in `Data/scripts` (outside the
  comment + scaffold row) and in `Data/sql/server_battlenpc_spawn_locations.sql`.
- Wiki archive: **zero matches** for `110767` / `Wld0g6` in
  `meteor-wiki-quests/quests-archive.md`.
- NOTE — atlas false-positive guard: `job-gc-decomp-20260907/scene-blocks.csv:503`
  and `scenes/drg0j620.json:1883` contain the digit run `1107676` (a 7-digit scene
  offset `0x10E6DC`), NOT quest 110767. No scene evidence for Wld0g6.

## Decomp atlas evidence (FF14-Decomp, negative)

- Class inventory: `quest/scenario/wld/wld0g6` = class `Wld0g6 : ScenarioBaseClass`
  (`class_inventory.csv:939`, `full_class_inventory.csv:939`).
- Methods: exactly one method, `Wld0g6.initText` (`class_methods.csv:6625`,
  `method_summaries.csv:6625`: counts `3,5,3,0,0` — identical shape to the
  directly-read empty `wld0g5.lua` body; g6 body characterized by inventory parity).
- Flow/event/cutscene/text summaries
  (`quest_cutscene_decomp_20260618`: flow `:490`, text `:496`, event `:497`,
  cutscene `:488`): all-zero rows — 0 journal lines, 0 markers, 0 events, 0 cutscenes.
- Enrichment queue (`current_quest_data_enrichment_queue.csv:370`): `world_sidequest`,
  `manual review`, `generate_or_recover_script_before_enablement`;
  notes: `no local MRKR constants; no DAT marker rows; no normalized reward rows`.

## Unrecovered (explicit)

Journal text, quest owner/NPC, objectives, markers, mobs/NMs, rewards (gil/exp/items),
cutscenes, offer/availability route. Nothing above may be invented for a Lv.0
`[en]` internal row.

## Verified (explicit)

Stub name matches scaffold key exactly; scaffold entry is `noOffer` with empty
markers; quest is commented out of availability; no reward rows; no spawn rows;
decomp class is an `initText`-only shell. Scaffold safety: inert (see summary).
No stub fix required.
