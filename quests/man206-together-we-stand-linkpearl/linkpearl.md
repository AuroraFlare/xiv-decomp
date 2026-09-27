# Man206 Together We Stand — NPC linkpearl quest surface (normalized from parley pack)

Quest-side linkage for `outputs/parley-call-widget-decomp-20260708/`
(contracts) + `docs/parley_call_widget_decomp_2026-07-08.md` (human doc).

## Objective (VERIFIED: quest_surface_notes.csv rows 17/283/330-347)
SEQ_005: Minfilia orders the player to contact the Path companion via NPC
Linkpearl before quitting Ul'dah. NPCLS_MSGS pack rows 330-347 carry the
companion replies (sylph/Empire debate).

## Widget contract (VERIFIED: parley pack)
- Tray: `Button_QuestLinkPearl` -> `UILuaCommands.ShortCutActionQuestLSMenu`;
  icons 293 idle/hidden, 292 extra, 291 calling/animated; gate
  `DesktopWidget.getLinkpearlStatus`.
- Menu index 13 (`MainMenuWidget` -> `NpcLinkshellListWidget`; MainName 2124,
  help 75732). Selection executes system command 24213 ->
  `NpcLinkshellChatCommand.lua` -> `player:HandleNpcLs(id)`; canFire
  requires `player:isNpcLinkshellChatCalling(id)`.
- Quest state: NPC LS id 6. `Quest.NewNpcLsMsg(6)` -> `player.SetNpcLs` ->
  `HandleNpcLs` -> `onNpcLS` -> `StartSequenceForNpcLs(SEQ_010)`. Game
  message 25119 (glow emanates). Man206 already has the right local
  sequence shape; the UI surface is the NPC Linkpearl list.

## Implementation status
Local sequence shape VERIFIED present; quest code must set calling/extra
state before entries are usable (see `runtime_probe_checklist.csv`, 5 rows).
