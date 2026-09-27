# Wld0g9 — quest 110770 — decomp note (Phase 1: Wld-G remainder)

Status: **UNRECOVERED content / VERIFIED wiring.** No quest content exists to implement.

## Verified facts (server repo + decomp atlas)

- Stub: `Data/scripts/quests/wld/wld0g9.lua` (3 lines, read directly):
  `require ("quests/generic_quest_scaffold")` + `InitQuestScaffold("Wld0g9")`.
- Scaffold key `Wld0g9` exists at `Data/scripts/quests/generic_quest_scaffold.lua:169`
  (`id = 110770`, `group = "side"`, `noOffer = true`, `markers = {}`).
- SQL: `Data/sql/gamedata_quests.sql:338` → `(110770, '[en]', 'Wld0g9', 0, 0)` =
  name `[en]`, prerequisite 0, minLevel 0. Lv.0 internal stub.
- Rewards: **zero matches** for `110770` in `Data/sql/gamedata_quest_rewards.sql`.
- Availability: `Data/scripts/quests/quest_availability.lua:471`, commented-out under
  `patch_unknown_or_internal`:
  `-- 110770, -- English name unavailable in gamedata [Lv. 0] - Not implemented - unknown/internal (Wld0g9)`.
  Untouched per work order.
- No NPC/mob binding: **zero matches** for `110770` in `Data/scripts` (outside the
  comment + scaffold row) and in `Data/sql/server_battlenpc_spawn_locations.sql`.
- Wiki archive: **zero matches** for `110770` / `Wld0g9` in
  `meteor-wiki-quests/quests-archive.md`.

## Decomp atlas evidence (FF14-Decomp, negative)

- Class inventory: `quest/scenario/wld/wld0g9` = class `Wld0g9 : ScenarioBaseClass`
  (`class_inventory.csv:942`, `full_class_inventory.csv:942`).
- Methods: exactly one method, `Wld0g9.initText` (`class_methods.csv:6628`,
  `method_summaries.csv:6628`: counts `3,5,3,0,0` — identical shape to the
  directly-read empty `wld0g5.lua` body; g9 body characterized by inventory parity).
- Flow/event/cutscene/text summaries
  (`quest_cutscene_decomp_20260618`: flow `:493`, text `:499`, event `:500`,
  cutscene `:491`): all-zero rows — 0 journal lines, 0 markers, 0 events, 0 cutscenes.
- Enrichment queue (`current_quest_data_enrichment_queue.csv:373`): `world_sidequest`,
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
