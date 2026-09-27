# 110018 Man402 — Of Men They Sing (Lv42)
Src: man/man402.lua (306 lines). Prereq: 110017.
## Stages (4)
SEQ_000 Tataru 1001046 distress call (pE + arg-list wrapper w/ route flag) -> SEQ_005 Camp Nine Ivies trigger 1090190 -> SEQ_015 solo private-area escort (own Path companion leads to injured Ala Mhigan scout + 2 Bloodhounds; escort/fight boundary persisted) -> SEQ_020 Tataru reward (39000; flag1-gated reward scene; marker 11001804).
## Content
SimpleContentMan40201/man40201, zone 151; entry 1690.88,20.17,-857.55; safe return 1712,20,-862; public return 1870.35,19.69,-1731.40. Director QuestDirectorMan40201.
## Flags/cutscenes
MAN402_FLAG_ESCORT_COMPLETE=0, MAN402_FLAG_REWARD_SCENE_STARTED=1 (both cleared at init; relog-safe restart). Cutscenes: camp scene, escort, reward. No parley.
## Verify
Route from recovered pE10 wrapper + client scenario (header); escort pattern matches man206 podling escort.
