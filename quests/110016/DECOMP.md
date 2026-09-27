# 110016 Man304 — Forever Taken (Lv34)
Src: man/man304.lua (381 lines). Prereq: 110015. No mechanic parley (negotiate = journal text only).
## Stages (5)
SEQ_000 Hedyn 1001047 briefing (pE001_2 Hedyn, pE001_6 Cliaux, pE001_5) -> SEQ_005 five Silvertear soil points (triggers 1090181-85, flags 0-4, markers 11001607-11; each consumes 1 Lightning Crystal, advances Unaspected Crystal counter; item Exclusive/stack-1 so counter is the ledger) -> SEQ_010 Gridania market entrance 1090264 turn-in (pE005_1/_2) -> SEQ_020 Waking Sands hall trigger 1090186 + companion talk (content SimpleContent30081/man30401, entry -193.46,-2,-181, zone 181; return -126.2) -> SEQ_025 Minfilia 1000843 reward (QFLAG_REWARD; pE30 opens reward window).
## NPCs
Hedyn, Minfilia, Cliaux 1001381, Cenmin 1001382, Memezofu 1001384, Path companion; market entrances 1090264/1090265.
## Flags/cutscenes
Flags 0-4 = soil points (cleared at init); counter-gated seq. Cutscenes: briefing, turn-in, hall content, reward. Dynamic private area w/ director QuestDirectorEventMan30401.
## Verify
Full route from client scenario+journal+markers+dialog+4 CS packages (header). Fandom "Forever Taken" page exists (fetch 403, title confirmed via search).
