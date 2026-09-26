# Further LPB Decomp: Full Client Delta And Combined Index

Generated: 2026-06-17

This is an analysis-only artifact set. It does not modify runtime/server/source code.

## Scope

- Previous focused pass: 1,010 scripts in `tools/outputs/lpb/decomp_more_20260617`.
- New further delta: 1507 previously uncovered scripts in this folder.
- New delta decompile failures: 0.
- Combined indexed coverage: 2517 / 2517 client scripts from `client_script_manifest.tsv`.

## New Delta Contents

- `lua/` - decompiled Lua for scripts not covered by the prior focused pass.
- `luac/` - decoded Lua bytecode for those scripts.
- `target_manifest.csv` - the 1,507 scripts selected for this delta pass.
- `decompile_manifest.csv` - decode/decompile result for each delta script.
- `combined_client_manifest.csv` - combined map across the prior focused pass and this delta pass.

## Full Combined Indexes

- `full_file_summary.csv` - file-level summary for all 2,517 scripts.
- `full_class_inventory.csv` - all `_defineClass` / `_defineBaseClass` declarations.
- `full_class_methods.csv` - all recovered class methods.
- `full_event_entrypoints.csv` - event/process/delegate/init-style methods.
- `full_require_edges.csv` - script dependency edges from `require(...)`.
- `full_text_data_loads.csv` - text sheet IDs and names loaded by scripts.
- `full_call_edges.csv` - all recovered `receiver:method(...)` call sites.
- `full_high_signal_calls.csv` - filtered high-signal bridge/API call sites.
- `call_counts.csv` - aggregate receiver/method call counts.
- `widget_command_surfaces.csv` - widget and command surface summary.
- `status_item_surfaces.csv` - status/item/trade/craft/shop surface summary.
- `monster_species_summary.csv` - monster script grouping by species path.
- `npc_subtype_summary.csv` - NPC subtype grouping for monster/populace/object/mapobj/etc.
- `top_level_system_counts.csv` and `tag_counts.csv` - broad system distribution.
- `full_analysis_summary.json` - aggregate machine-readable summary.

## High-Level Shape

- Classes: 2423
- Methods: 11823
- Event/process/delegate/init-style entrypoints: 6192
- `require(...)` edges: 2451
- Text data loads: 455
- Colon-call sites: 55715
- High-signal bridge/API calls: 23706
- Monster species buckets: 82
- NPC subtype buckets: 15

## Delta Coverage Notes

The new pass fills the non-focused client surface around the prior instance/quest/cutscene/retainer/linkshell work:

- `chara/npc/monster` is now decompiled broadly, with species-level summaries in `monster_species_summary.csv`.
- Non-monster NPC/object/mapobj/populace/save/debug scripts are now included in `npc_subtype_summary.csv`.
- `widget` and `command` coverage now includes general UI, party/search/config/log/trade/shop/craft/materia/achievement surfaces.
- `status` and `item` script families are now indexed for status effects, item actions, trade, repair, crafting, shop, and materia behavior.
- `full_require_edges.csv` is the fastest way to trace script dependencies across old and new passes.
- `full_high_signal_calls.csv` is the fastest way to search client/native bridge points such as `desktopWidget`, `worldMaster`, event delegation, packets, widgets, inventory, trade, and content calls.

## Remaining Gaps

- This is client Lua bytecode decompilation. Native behavior behind bridge objects remains outside Lua.
- Variable names are still decompiler temporaries in many bodies.
- The combined index references Lua in two folders: the prior focused folder for 1,010 scripts and this delta folder for the 1,507 newly decompiled scripts.
