# Wld0g5 — quest 110766 — decomp note (Phase 1: Wld-G remainder)

Status: **UNRECOVERED content / VERIFIED wiring.** No quest content exists to implement.

## Verified facts (server repo + decomp atlas)

- Stub: `Data/scripts/quests/wld/wld0g5.lua` (3 lines, read directly):
  `require ("quests/generic_quest_scaffold")` + `InitQuestScaffold("Wld0g5")`.
- Scaffold key `Wld0g5` exists at `Data/scripts/quests/generic_quest_scaffold.lua:165`
  (`id = 110766`, `group = "side"`, `noOffer = true`, `markers = {}`).
- SQL: `Data/sql/gamedata_quests.sql:334` → `(110766, '[en]', 'Wld0g5', 0, 0)` =
  name `[en]`, prerequisite 0, minLevel 0. Lv.0 internal stub by schema definition
  (`id, questName, className, prerequisite, minLevel` per lines 20-26).
- Rewards: **zero matches** for `110766` in `Data/sql/gamedata_quest_rewards.sql`
  (verified by search; 0 rows).
- Availability: `Data/scripts/quests/quest_availability.lua:467`, commented-out under
  `patch_unknown_or_internal`:
  `-- 110766, -- English name unavailable in gamedata [Lv. 0] - Not implemented - unknown/internal (Wld0g5)`.
  Commented = never offered. Untouched per work order.
- No NPC/mob binding: **zero matches** for `110766` in `Data/scripts` (outside the
  comment + scaffold row) and in `Data/sql/server_battlenpc_spawn_locations.sql`.
- Wiki archive: **zero matches** for `110766` / `Wld0g5` in
  `meteor-wiki-quests/quests-archive.md`.
- Context (verified, not evidence for this quest): neighbouring rows
  `gamedata_quests.sql:330-333` are real named Gridania quests
  (Wld0g1..g4: In the Name of Science / Hearing Confession / A Bitter Oil to
  Swallow / Spores on the Brain). Wld0g5 follows the named run and is empty.

## Decomp atlas evidence (FF14-Decomp, negative)

- Class inventory: `quest/scenario/wld/wld0g5` = class `Wld0g5 : ScenarioBaseClass`
  (`class_inventory.csv:938`, `full_class_inventory.csv:938`).
- Methods: exactly one method, `Wld0g5.initText` (`class_methods.csv:6624`,
  `method_summaries.csv:6624`: counts `3,5,3,0,0` = no events, no params beyond
  self/arg, no recovered body ops).
- Body (direct read of `decomp_more_20260617/lua/quest/scenario/wld/wld0g5.lua`):
  `function Wld0g5.initText(A0_0) local L1_1 end` — **empty**.
- Flow/event/cutscene/text summaries
  (`quest_cutscene_decomp_20260618`: `server_quest_flow_summary_by_quest.csv:489`,
  `quest_text_summary_by_quest.csv:495`, `quest_event_summary_by_quest.csv:496`,
  `quest_cutscene_summary_by_quest.csv:487`): all-zero rows — 0 journal lines,
  0 markers, 0 events, 0 cutscenes.
- Enrichment queue (`quest-decomp-addendum-atlas-20260630`,
  `current_quest_data_enrichment_queue.csv:369`): `world_sidequest`, `manual review`,
  `generate_or_recover_script_before_enablement`;
  notes: `no local MRKR constants; no DAT marker rows; no normalized reward rows`.

## Unrecovered (explicit)

Journal text, quest owner/NPC, objectives, markers, mobs/NMs, rewards (gil/exp/items),
cutscenes, offer/availability route. Nothing above may be invented for a Lv.0
`[en]` internal row.

## Verified (explicit)

Stub name matches scaffold key exactly; scaffold entry is `noOffer` with empty
markers; quest is commented out of availability; no reward rows; no spawn rows;
decomp class is an empty `initText` shell. Scaffold safety: inert (see summary).
No stub fix required.
