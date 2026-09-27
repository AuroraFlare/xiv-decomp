# Quest 110015 Toll of the Warden (Man300, Lv.30) — instance decomp notes

MSQ instance work. Retail evidence: recovered client scenario
`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man300.lua`
(identical copy also under `content_systems_20260612`), cutscene binaries
`client/cut/man30000`–`man30060`, decoders
`tools/decompile_man300_cutscene_setup.py`, DAT sheets (`xtx_quest`,
`journalxtxWil`, `quest_marker`, `cutReplay`, `quest_new_reward`,
`xtx_npclslist`, `man300.csv`), recorded retail route/battle video, and
in-game `/mypos` captures in zone 171. Quest text row 67 (inspected in
`docs/Dat Mining/man300.csv`) states the dual solution: weaken both sides
without handing either victory, or parley the shamans.

Prior passes (superseded where they conflict): `docs/man300_toll_of_the_warden.md`
(`outputs/msq-decomp-man`), `docs/toll_of_the_warden_man300_decomp_2026-07-07.md`,
`docs/toll_of_the_warden_man300_decomp_2026-08-14.md` (authoritative route),
`docs/msq_110015_in-depth_decomp_2026-08-17.md`.

## Route (7 scenes, 7 journal sequences)

| # | Scene/method | Sequence effect |
|---|---|---|
| 1 | Minfilia `processEvent000`/`man30000` | Pre-offer briefing (temp flag) |
| 2 | Tataru `pEStart` | Accept → SEQ 0 |
| 3 | Market entrance `processEvent010`/`man30010` | → SEQ 10, warp to Peasants' Ward (zone 160) |
| 4 | Hedyn `pE20`/`man30020` | → SEQ 15, corridor reposition |
| 5 | Drybone trigger: counter 0 = 5, Path LS msgs 302+303 | → SEQ 20 |
| 6 | Mesa trigger `pE30`/`man30030` | → SEQ 25, enter 171/PrivateAreaMasterPast/1 |
| 7 | Auto `pE40`/`man30040` on landing | → SEQ 30 encounter |
| 8 | `pE50`/`man30050` (extra arg 10) | → SEQ 35, return to public zone |
| 9 | Hedyn `pE60`/`man30060` | Reward + CompleteQuest + corridor warp |

No `SEQ_040/045` epilogue (removed invented placeholder). Rewards: 90,000 gil
+ 19,000 EXP via `gamedata_quest_rewards.sql` auto-grant, Ashcrown Consortium
linkpearl via `AddNpcLs(7)`. Markers 11001501–11001507 per `quest_marker.csv`.

## Files in this folder

- `actors_positions_rot.md` — every actor, position/rotation, guide verification
- `triggers_cutscenes.md` — triggers, warps, fade/event-lifetime contracts
- `mob_ai_phases.md` — fight: single phase, mob AI, damage floor, parley route
- `fail_edges.md` — timeout/death/disconnect/abandon/chocobo/scaling/escort/SEQ gaps
