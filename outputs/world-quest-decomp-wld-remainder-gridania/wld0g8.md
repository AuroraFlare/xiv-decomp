# Wld0g8 — quest 110769 — decomp note (Phase 1: Wld-G remainder)

Status: **UNRECOVERED content / VERIFIED wiring.** No quest content exists to implement.

## Verified facts (server repo + decomp atlas)

- Stub: `Data/scripts/quests/wld/wld0g8.lua` (3 lines, read directly):
  `require ("quests/generic_quest_scaffold")` + `InitQuestScaffold("Wld0g8")`.
- Scaffold key `Wld0g8` exists at `Data/scripts/quests/generic_quest_scaffold.lua:168`
  (`id = 110769`, `group = "side"`, `noOffer = true`, `markers = {}`).
- SQL: `Data/sql/gamedata_quests.sql:337` → `(110769, '[en]', 'Wld0g8', 0, 0)` =
  name `[en]`, prerequisite 0, minLevel 0. Lv.0 internal stub.
- Rewards: **zero matches** for `110769` in `Data/sql/gamedata_quest_rewards.sql`.
- Availability: `Data/scripts/quests/quest_availability.lua:470`, commented-out under
  `patch_unknown_or_internal`:
  `-- 110769, -- English name unavailable in gamedata [Lv. 0] - Not implemented - unknown/internal (Wld0g8)`.
  Untouched per work order.
- No NPC/mob binding: **zero matches** for `110769` in `Data/scripts` (outside the
  comment + scaffold row) and in `Data/sql/server_battlenpc_spawn_locations.sql`.
- Wiki archive: **zero matches** for `110769` / `Wld0g8` in
  `meteor-wiki-quests/quests-archive.md`.

## Decomp atlas evidence (FF14-Decomp, negative)

- Class inventory: `quest/scenario/wld/wld0g8` = class `Wld0g8 : ScenarioBaseClass`
  (`class_inventory.csv:941`, `full_class_inventory.csv:941`).
- Methods: exactly one method, `Wld0g8.initText` (`class_methods.csv:6627`,
  `method_summaries.csv:6627`: counts `3,5,3,0,0` — identical shape to the
  directly-read empty `wld0g5.lua` body; g8 body characterized by inventory parity).
- Flow/event/cutscene/text summaries
  (`quest_cutscene_decomp_20260618`: flow `:492`, text `:498`, event `:499`,
  cutscene `:490`): all-zero rows — 0 journal lines, 0 markers, 0 events, 0 cutscenes.
- Enrichment queue (`current_quest_data_enrichment_queue.csv:372`): `world_sidequest`,
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
