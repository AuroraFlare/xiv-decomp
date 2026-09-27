# 110776 — Wld0l6 (unknown/internal stub)

- Stub VERIFIED (`Data/scripts/quests/wld/wld0l6.lua`, 3 lines): `require ("quests/generic_quest_scaffold")` + `InitQuestScaffold("Wld0l6")`. Name matches scaffold key exactly (case-sensitive) — CORRECT, no fix needed.
- SQL VERIFIED (`Data/sql/gamedata_quests.sql`): `(110776, '[en]', 'Wld0l6', 0, 0)` — placeholder name, prerequisite 0, minLevel 0. Schema: (`id`, `questName`, `className`, `prerequisite`, `minLevel`).
- Rewards VERIFIED ABSENT (`Data/sql/gamedata_quest_rewards.sql`): zero rows for 110776.
- Availability VERIFIED (`Data/scripts/quests/quest_availability.lua:473`): commented out — `110776, English name unavailable in gamedata [Lv. 0] - Not implemented - unknown/internal (Wld0l6)`. Not offered; untouched per scope.
- Journal text UNRECOVERED: zero hits for 110776 in `quest_dat_journal_index.csv`, `quest_journal_coverage_index.csv`, `quest_journal_reference_index.csv`, `quest_text_sheet_coverage_index.csv` (`outputs/all-normal-quest-decomp-20260707/`). Sibling Wld0l1–l4 all resolve to `xtx/journalxtxSea`; this quest has no sheet/row.
- Markers UNRECOVERED: scaffold entry has `markers = {}` (`generic_quest_scaffold.lua:180`); zero hits in `quest_marker_actor_coverage_index.csv`. No marker IDs exist to verify.
- NPCs/mobs UNRECOVERED: scaffold entry has no `actor`; zero hits in `server_eventnpc_spawn_locations.sql`, `server_seasonal_eventnpc_spawn_locations.sql`, `server_battlenpc_spawn_locations.sql`. Scaffold defines no kill handler, so no combat bindings exist.
- Wiki UNRECOVERED: `meteor-wiki-quests/quests-archive.md` (553 lines) contains one `Wld0` hit only (Wld0u2 Sanguine Studies); zero hits for Wld0l6/110776.
- Atlas UNRECOVERED: recursive scan of `FF14-Decomp/outputs` (`*.md`, `*.json`) for `Wld0l[5-9]`/`11077[5-9]` returns zero hits outside this new dir.
- Runtime effect VERIFIED SAFE: scaffold `noOffer = true` forces `isEligible` false (`generic_quest_scaffold.lua:265-268`); all paths no-op (see `110776` row in `quest_flow.csv` and summary verdict). No offer, no journal entry, no rewards, no crash path.

## Open gaps

- Real name, giver, objectives, scenes, rewards: none recovered. No implementation attempted (Lv.0 internal — inventing content explicitly out of scope).
