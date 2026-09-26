# Decomp Correlation Pack

Generated: 2026-06-17

This is a third-pass analysis artifact over the full decompiled client Lua corpus. It does not modify runtime/server/source code.

## Inputs

- Prior focused Lua: `tools/outputs/lpb/decomp_more_20260617/lua`
- Full delta Lua: `tools/outputs/lpb/decomp_further_20260617/lua`
- SQL actor classes: `Data/sql/gamedata_actor_class.sql`
- DAT CSV directory: `docs/Dat Mining`

## What This Adds

The previous pass made file-level and global call indexes. This pass attaches calls to enclosing methods and joins Lua back to actor classes and DAT text sheets.

## Files

- `method_ranges.csv` - every recovered method with start/end line range.
- `method_summaries.csv` - per-method call counts, bridge-call counts, text IDs, scheduler IDs, cutscene keys, and protocol flags.
- `method_call_edges.csv` - every `receiver:method(...)` call with enclosing class/method context.
- `bridge_calls_by_method.csv` - filtered bridge/API calls with method context and source line text.
- `bridge_call_matrix.csv` - aggregate receiver/method counts, file counts, method counts, and sample methods.
- `event_protocol_candidates.csv` - event/process/delegate/init-style methods with protocol hints.
- `require_graph_resolved.csv` - `require(...)` edges normalized to logical script paths with availability.
- `class_inheritance_graph.csv` - class/base-class relationships, with base class file resolution where available.
- `text_sheet_usage_join.csv` - `_loadTextData*` sheet IDs/names joined to DAT CSV existence and row counts.
- `actor_class_to_script.csv` - actor-class SQL rows joined to decompiled script, classes, text sheets, and event conditions.
- `actor_script_summary.csv` - actor-class counts grouped by script path.
- `system_protocol_matrix.csv` - protocol/bridge summary grouped by broad system tag.
- `correlation_summary.json` - machine-readable aggregate summary.

## Counts

- Files seen: 2517
- Methods ranged: 11823
- Method call edges: 55715
- Bridge/API calls with method context: 23846
- Event protocol candidates: 6213
- Resolved `require(...)` edges: 2451
- Text sheet loads joined: 455
- Actor-class SQL rows joined: 4422
- Actor script summaries: 356



## Target System Slices

These are filtered for `instance`, `quest`, `cutscene`, `retainer`, and `linkshell` tags:

- `target_system_method_summaries.csv`
- `target_system_event_protocols.csv`
- `target_system_bridge_calls.csv`
- `target_system_actor_scripts.csv`
- `target_system_text_sheets.csv`

## Audit Lists

- `actor_class_sql_audit.csv` - SQL actor-class row-shape counts, including empty script paths that cannot join to Lua.
- `unresolved_actor_scripts.csv` - non-empty SQL actor script paths that did not resolve to a decompiled Lua file.
- `unresolved_requires.csv` - `require(...)` paths that did not resolve to a decompiled Lua file.

## Fastest Starting Points

- For dynamic behavior: start with `event_protocol_candidates.csv`.
- For native/client bridge work: start with `bridge_calls_by_method.csv` or `bridge_call_matrix.csv`.
- For NPC/object mapping: start with `actor_class_to_script.csv` or `actor_script_summary.csv`.
- For dialogue/text routing: start with `text_sheet_usage_join.csv` plus `method_summaries.csv`.
- For dependency tracing: start with `require_graph_resolved.csv` and `class_inheritance_graph.csv`.
