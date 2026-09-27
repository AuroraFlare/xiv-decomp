# Quest 110017 Lord Errant (Man308, Lv.38) — instance decomp notes

MSQ instance work. Retail evidence: recovered client scenario
`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man308.lua`
(384 lines, git-tracked), cutscene binaries `client/cut/man30800`–`man30900`
plus shared HQ scene `man40640`, decoder
`tools/decompile_man308_cutscene_setup.py` (exit 0 against the installed
client this pass), DAT sheets (`xtx_quest`, `xtx_journalxtxWil` rows 218–222,
`quest_marker` 11001701–08, `cutReplay` 11001701–09, `xtx_negotiationTable`
1401, `man308.csv` dialogue, `gamedata_quest_rewards` 114,000 gil + 32,500
EXP), and period footage (tJrl9bfP5A8, encounter at 6:38; retail accuracy
reviewed in prior passes).

Prior passes (superseded where they conflict): `quests/110017/DECOMP.md`
(route index), `docs/lord_errant_man308_decomp_2026-07-07.md` (scaffold),
`docs/lord_errant_man308_decomp_2026-08-14.md` (authoritative route),
`outputs/msq-decomp-man/man308_lord_errant.md` (delivery summary),
`docs/msq_110016_110017_110018_110019_in-depth_decomp_2026_08_17.md`.

## Route (5 sequences)

| SEQ | Journal | Objective | Advance |
|---|---|---|---|
| ACCEPT | — | Offer at the Gold Court | Market entrance 1090265 warps zone 209 Gold Court; court trigger 1090187 `pES` offer, accept via `isQuestInfoAccepted` |
| 0 | 218 | Reach the Paglth'an gate | Gate trigger 1090188 `pE01`/`man30800` → SEQ 5 |
| 5 | 219 | Reach the battlefield approach | Approach trigger 1090189 → `startMan308Content` (`pE10`/`man30810` after-warp fade) → SEQ 10 |
| 10 | 220 | Speak with the Path companion in content | Companion talk `pE20` + `pE30`/`man30830` → SEQ 15 + move to battle staging |
| 15 | 220/221 | Watch the ritual, Parley one captive (flag 0), defeat the three Amalj'aa (flag 1) | Director: `pE50` (`man40640`+`man30850`) + `pE60`; one Parley win → combat; 3/3 kills → `pE80` (`man30880`+`man30890`) → SEQ 20 + party warp to public return |
| 20 | 222 | Report to Minfilia | Minfilia 1000843 `pE90`/`man30900` + reward window 32500 + `CompleteQuest` + Waking Sands warp |

No escort exists (companion talk teleports to battle staging). No `pE00`
reminder or `processEvent090*` replay wiring: recovered but not on the normal
route (see `triggers_cutscenes.md`). `man30820` is an orphan asset with no
wrapper or cut-replay row. Rewards: 32,500 EXP + 114,000 gil via
`gamedata_quest_rewards.sql` auto-grant. Markers 11001701–11001708 per
`quest_marker.csv` (09–20 are filler rows).

## Files in this folder

- `actors_positions_rot.md` — every actor, position/rotation, guide verification
- `triggers_cutscenes.md` — triggers, warps, fade/event-lifetime contracts
- `mob_ai_phases.md` — fight: parley phase + single combat phase, mob AI, leash
- `fail_edges.md` — timeout/death/disconnect/abandon/chocobo/scaling/SEQ gaps
