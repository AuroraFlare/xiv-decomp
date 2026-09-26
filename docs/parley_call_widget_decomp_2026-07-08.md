# Parley and NPC Linkpearl widget decomp (2026-07-08)

## Short version

- Parley is the recovered client Negotiation surface. The visible command is `29497` (`Parley`), MainMenu presents it with text `1104`, icon `30232`, and help `74619`, and DesktopWidget only exposes it when `canTargetNegotiation()` passes.
- Toll of the Warden text explicitly tells the player to play the tiles and best the shamans at parley, but the recovered/local Man300 quest script does not directly call `NegotiationJudge`. The likely missing piece is quest/director or actor state that makes the shaman targets negotiatable.
- The user-facing `call` note/menu icon in Together We Stand is the NPC Linkpearl path: tray `Button_QuestLinkPearl` or main menu opens `NpcLinkshellListWidget`, selection executes system command `24213`, and Man206 uses NPC LS id `6` to advance from `SEQ_005` to `SEQ_010`.

## Generated evidence

- Output README: `outputs/parley-call-widget-decomp-20260708/README.md`.
- Source inventory: `outputs/parley-call-widget-decomp-20260708/source_inventory.csv` (27 files).
- Command rows: `outputs/parley-call-widget-decomp-20260708/parley_command_rows.csv` (9 rows).
- Function contracts: `outputs/parley-call-widget-decomp-20260708/widget_function_contracts.csv` (82 rows: 40 Parley/Negotiation, 42 NPC Linkpearl/quest-linked).
- Parley update-code map: `outputs/parley-call-widget-decomp-20260708/parley_update_codes.csv`.
- Menu and runtime bridge map: `outputs/parley-call-widget-decomp-20260708/menu_bridge_contract.csv`.
- Quest text anchors: `outputs/parley-call-widget-decomp-20260708/quest_surface_notes.csv` (26 rows).
- Negotiation data-sheet samples: `outputs/parley-call-widget-decomp-20260708/negotiation_data_sheet_samples.csv` (21 rows).
- Probe checklist: `outputs/parley-call-widget-decomp-20260708/runtime_probe_checklist.csv`.
- JSON summary: `outputs/parley-call-widget-decomp-20260708/contract_summary.json`.

## Parley / Negotiation surface

| Surface | Recovered contract | Local/server anchor |
| --- | --- | --- |
| Command | `29497` is labelled `Parley`; `22009` is the lower-level/open negotiation command and `22901` is quit/cease negotiations. | `server_battle_commands.sql` has `29497, 'parley'` as `player_ability`; `Player.cs` seeds the command and enables `battleSave.negotiationFlag[0]`. |
| Menu icon | `MainMenuWidget.updateReadyCommand` checks `29497` and `desktopWidget:canTargetNegotiation()`, then calls `addReadyCommand(29497, 1104, 30232, slot)`. | Help id `74619` is selected for command `29497`. |
| Target gate | `DesktopWidget.canTargetNegotiation()` requires ready slot `16`, player `enableNegotiation()`, current target, non-player target, and target `isNegotiatable()`. | This points implementation toward actor/director state, not a raw quest text branch. |
| Minigame widgets | `NegotiationJudge` opens/selects/updates/closes `Ask/NegotiationListWidget`, `Ask/NegotiationAskWidget`, and `Ask/NegotiationWidget`. | Local `Data/scripts/commands/NegotiationCommand.lua` is a probe that shows call shape and sample update code use, then closes immediately. |
| Returns | Tile picks return `1-12`; time-up path selects `13`; ability list returns `15-19`; cancel paths return `-1`. | A real server implementation needs to own turns, score/gauge state, and outcome before changing quest state. |

Key Man300 text anchor:

> If it is in battle that you excel, join the fighting at the van, and try to weaken both sides into submission, taking care not to hand victory to either one. Yet if you abhor violence, as I do, speak with the shamans, and convince them to play the tiles. If you can best them at parley, they may lay down their staves.

That line is the strongest quest binding: the player can fight or speak with the shamans and convince them to play tiles. Since no recovered Man300 direct `openNegotiationWidget` call was found, the conservative implementation path is to make those shaman actors negotiatable during the relevant mesa objective and route command `29497` to the Parley state machine.

## Parley update codes

| Code | Meaning | Confidence |
| --- | --- | --- |
| `1-12` | topic slot update: Populates one of twelve grid tiles and increments visible topic count. | high |
| `13` | operation result/history: Displays a selected operation, plays player/enemy operation SFX, and can write a history icon. | medium |
| `14` | negotiation gauge: Sets the negotiation progress gauge maximum and current value. | high |
| `15` | achievement gauge: Sets the achievement/result progress gauge maximum and current value. | high |
| `16` | additional item 1: Toggles first additional reward/item indicator and can play add-item SFX. | medium |
| `17` | additional item 2: Toggles second additional reward/item indicator and can play add-item SFX. | medium |
| `18` | additional item 3: Toggles third additional reward/item indicator and can play add-item SFX. | medium |
| `19` | selected/history icon: Writes one of the six last-selected item icons. | high |
| `20` | ability availability: Updates which ability buttons are usable in the child ability list. | medium |
| `21` | phase/result visibility: Toggles a result/phase visibility group; exact meaning still needs a runtime probe. | low |
| `22` | clear timer: Clears/resets the time gauge. | high |
| `23` | player move SFX: Plays the player-side move sound. | high |
| `24` | opponent move SFX: Plays the opponent-side move sound. | high |
| `25` | time-up SFX: Plays time-up sound and closes ability selector if it is open. | high |
| `26` | move or merge topic tile: Moves/merges a topic from one grid tile to another, hides old slot, and updates count. | medium |
| `27` | double or halve values: Doubles or halves topic point values based on the supplied flag. | medium |
| `28` | pause timer: Pauses the Parley input timer. | high |
| `29` | resume timer: Resumes the Parley input timer. | high |

## Call / NPC Linkpearl surface

| Surface | Recovered contract | Local/server anchor |
| --- | --- | --- |
| Tray icon | `ConsoleIconTrayWidget` uses `Button_QuestLinkPearl`; clicking it sends `UILuaCommands.ShortCutActionQuestLSMenu`. | `DesktopWidget` opens `NpcLinkshellListWidget`. |
| Status icons | `getLinkpearlStatus()` maps no linkpearl to hidden/idle and active states to icons `293`, `292`, and animated `291`. | The recovered Lua duplicates `isNpcLinkshellChatCalling` in one branch; server flags show the intended split is calling plus extra. |
| Main menu | `MainMenuWidget` opens `NpcLinkshellListWidget`, with main text id `2124` and help id `75732`. | Patch 1.19 notes say clicking the linkpearl icon can directly bring up the NPC Linkpearl display. |
| List selection | `NpcLinkshellListWidget` stores NPC LS id in `IntData.Value0`, names rows through text id `3482`, and selection calls `executePlayerNPCLinkshellChat(id)`. | `DesktopWidget.executePlayerNPCLinkshellChat(id)` executes local command `24213`. |
| Command guard | Recovered `NpcLinkshellChatCommand.canFire(player, id)` returns `player:isNpcLinkshellChatCalling(id)`. | Local `NpcLinkshellChatCommand.lua` calls `player:HandleNpcLs(id)` and ends the event if no quest handles it. |
| Quest route | Man206 `SEQ_005` calls `quest:NewNpcLsMsg(6)`. `onNpcLS` sends rows `330-347` by companion personality and calls `StartSequenceForNpcLs(SEQ_010)` when complete. | Server `Quest.NewNpcLsMsg`, `ReadNpcLsMsg`, `EndOfNpcLsMsgs`, and `Player.SetNpcLs` drive the calling/extra flags. |

Key Man206 text anchor:

> You and your Path companion have been entrusted with a task of great import. Contact [@2B($EA(1))] using our linkpearl and make haste for Gridania.

This makes the `call` note a quest-linkpearl UI problem, not a separate notepad widget. For Together We Stand, the important runtime proof is that NPC LS id `6` becomes callable at `SEQ_005`, appears in `NpcLinkshellListWidget`, executes `24213`, and drains the Man206 `NPCLS_MSGS` pack into `SEQ_010`.

## Implementation notes

- Do not wire Man300 by directly opening `Ask/NegotiationWidget` from the quest script unless a capture proves that retail did so. The menu and target gate strongly suggest the Parley command is target-driven.
- Treat the local `NegotiationCommand.lua` as a call-shape probe. It is useful for arguments and update codes, but it is not gameplay complete.
- For Man300, first add logging or disposable target setup around the shaman targets: ready command slot, `enableNegotiation`, `isNegotiatable`, command `29497` payload, and the chosen negotiation table id.
- For Man206, keep using the existing NPC Linkpearl lifecycle. The user-facing missing piece is usually status visibility or command route, not a new widget family.
- When interpreting NPC Linkpearl icon state, prefer the server `SetNpcLs` mapping over the duplicated recovered `isNpcLinkshellChatCalling` branch: inactive is extra-only, active is calling-only, alert is calling plus extra.

## Highest-value next probes

1. Capture command `29497` on a manually negotiatable test NPC and confirm target/owner params before adding quest outcome logic.
2. Validate `Ask/NegotiationWidget` update codes `14`, `15`, `19`, `20`, `22`, `28`, and `29` in the local probe command.
3. At Man206 `SEQ_005`, verify NPC LS id `6` appears with the correct `291/292/293` icon and executes command `24213` into `onNpcLS`.
