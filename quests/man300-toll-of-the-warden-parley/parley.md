# Man300 Toll of the Warden — parley quest surface (normalized from parley pack)

Quest-side linkage for `outputs/parley-call-widget-decomp-20260708/`
(contracts) + `docs/parley_call_widget_decomp_2026-07-08.md` (human doc).
No new mining; this file only joins widget rows to the Man300 objective.

## Objective (VERIFIED: quest_surface_notes.csv rows 43/67/69/70/311/322)
Beast-tribe shamans at the van: weaken both sides in battle OR speak with
the shamans and best them at parley (tile minigame) so they lay down their
staves. Negotiation outcome feeds the narrative (row 322 follow-up text).

## Widget contract (VERIFIED: parley pack)
- Parley command 29497 (`server_battle_commands` player_ability row;
  DAT `AI Scripts/command.csv` + local `Data/command.csv`).
- Open 22009 / Quit 22901. Ready-command gate: `DesktopWidget.
  canTargetNegotiation` + `enableNegotiation` (target exists, not player,
  isNegotiatable). Toll of the Warden needs actors/director state that make
  shamans negotiatable; no direct widget calls from man300.
- Judge: `NegotiationJudge` (judge/negotiation/negotiationjudge.lua);
  `Data/scripts/commands/NegotiationCommand.lua` is probe/stub only.
- Minigame: `Ask/NegotiationWidget` — 12 topic buttons, 6 selected/history
  icons, negotiation/achievement/time gauges, 5 abilities; input returns
  tile ids 1-12, time-up 13, ability ids 15-19 (see
  `parley_update_codes.csv`, 18 rows; `widget_function_contracts.csv`, 82 rows).

## Implementation status: OPEN
No server-side turn/state model exists; the local command stub closes the
widget immediately. Man300 tile play is unimplementable until a Parley
subsystem lands (same blocker as the 9 HAND quests in
`../parley-blocked-hand/parley-blocks.csv`).
