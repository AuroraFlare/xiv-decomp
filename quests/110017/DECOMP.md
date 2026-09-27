# 110017 Man308 — Lord Errant (Lv38, PARLEY live)
Src: man/man308.lua (378 lines). Prereq: 110016.
## Stages (5)
SEQ_000 Minfilia + market entrance 1090265 -> SEQ_005 Gold Court trigger 1090187 -> SEQ_010 Paglth'an gate/approach triggers 1090188/89 + companion talk -> SEQ_015 tempered-captive Parley (flag 0; ONE success releases group, starts 3-enemy Amalj'aa battle) -> SEQ_020 Minfilia reward (QUEST REWARD 32500; delegateQuestRewardWindow).
## Content
SimpleContentMan30801/man30801, zone 174; entry 995.17,309.15,982.12; battle entry 1000.71,308.57,985.78; public return 1217.65,311.71. Director QuestDirectorMan30801 owns temp actors.
## Flags/cutscenes
MAN308_FLAG_PARLEY_COMPLETE=0 persisted in quest data (retry/relog recovery; cleared at init, set on parley win). Cutscenes: gate approach, parley->battle chain, reward. Battle+parley in one content area.
## Verify
Reconstructed from client scenario+journal+markers+CS binaries+negotiation table+period footage (header); matches parley-recon (SEQ_015 flag0 captive, LIVE).
