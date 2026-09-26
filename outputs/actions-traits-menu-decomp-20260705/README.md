# Actions, Traits, Classes, Jobs, and Menus Decomp Atlas

Generated: 2026-07-05

This output joins the client command DAT extract, server battle command/trait SQL,
local custom class overlays, and recovered UI/widget Lua for the action and trait
menu surfaces.

## Files

- `command_client_server_join.csv` - client command rows joined to server command and trait rows.
- `class_job_matrix.csv` - class/job ids, storage columns, class-to-job pairs, and row counts.
- `unreleased_class_anchors.csv` - known unreleased/custom class action anchors and custom server rows.
- `menu_widget_hooks.csv` - the main menu/widget/runtime surfaces for action setting, hotbar use, casts, rewards, job change, and equip action.
- `client_ui_text_rows.csv` - DAT UI text rows that name Actions & Traits, Ability, Trait, and Job Change.
- `job_ability_widget_calls.csv` - recovered job quest scripts that call `showGetJobAbilityWidget`.

## Counts

- Client command rows: 1661
- Server battle command rows after overlays: 1440
- Server battle trait rows: 88
- Joined rows: 1714
- Unreleased/custom anchor rows: 30
- Job ability popup calls: 38
