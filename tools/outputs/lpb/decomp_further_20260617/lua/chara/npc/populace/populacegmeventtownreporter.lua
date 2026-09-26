require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGMEventTownReporter", "NpcBaseClass")
function PopulaceGMEventTownReporter.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7904, "populaceGMEventTownReporter")
end
function PopulaceGMEventTownReporter.trTalkEvent01_01(A0_1, A1_2)
  local L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1.startCliantTalkTurn
  L2_3(L3_4, 2, A1_2)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 2, 0)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 3, 0)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 4, 0)
  L3_4 = A0_1
  L2_3 = A0_1.askExtendWidget
  L2_3 = L2_3(L3_4, A0_1, 5, 2, 1, 2)
  L3_4 = L2_3
  if L3_4 == 1 then
    A0_1:say(A0_1, 9, 0)
    A0_1:say(A0_1, 10, 0)
    break
  else
  end
  if L3_4 == 2 then
    A0_1:say(A0_1, 8, 0)
    break
  else
  end
  L3_4 = A0_1.finishCliantTalkTurn
  L3_4(A0_1)
  return L2_3
end
function PopulaceGMEventTownReporter.trTalkEvent01_02(A0_5, A1_6)
  A0_5:startCliantTalkTurn(2, A1_6)
  A0_5:say(A0_5, 2, 0)
  A0_5:say(A0_5, 3, 0)
  A0_5:say(A0_5, 4, 0)
  A0_5:finishCliantTalkTurn()
end
function PopulaceGMEventTownReporter.trTalkEvent02_01(A0_7, A1_8)
  local L2_9, L3_10
  L3_10 = A0_7
  L2_9 = A0_7.startCliantTalkTurn
  L2_9(L3_10, 2, A1_8)
  L3_10 = A0_7
  L2_9 = A0_7.say
  L2_9(L3_10, A0_7, 12, 0)
  L3_10 = A0_7
  L2_9 = A0_7.say
  L2_9(L3_10, A0_7, 13, 0)
  L3_10 = A0_7
  L2_9 = A0_7.say
  L2_9(L3_10, A0_7, 14, 0)
  L3_10 = A0_7
  L2_9 = A0_7.askExtendWidget
  L2_9 = L2_9(L3_10, A0_7, 5, 2, 1, 2)
  L3_10 = L2_9
  if L3_10 == 1 then
    A0_7:say(A0_7, 16, 0)
    A0_7:say(A0_7, 17, 0)
    break
  else
  end
  if L3_10 == 2 then
    A0_7:say(A0_7, 15, 0)
    break
  else
  end
  L3_10 = A0_7.finishCliantTalkTurn
  L3_10(A0_7)
  return L2_9
end
function PopulaceGMEventTownReporter.trTalkEvent02_02(A0_11, A1_12)
  A0_11:startCliantTalkTurn(2, A1_12)
  A0_11:say(A0_11, 12, 0)
  A0_11:say(A0_11, 13, 0)
  A0_11:say(A0_11, 14, 0)
  A0_11:finishCliantTalkTurn()
end
function PopulaceGMEventTownReporter.trTalkEvent03_01(A0_13, A1_14)
  local L2_15, L3_16
  L3_16 = A0_13
  L2_15 = A0_13.startCliantTalkTurn
  L2_15(L3_16, 2, A1_14)
  L3_16 = A0_13
  L2_15 = A0_13.say
  L2_15(L3_16, A0_13, 19, 0)
  L3_16 = A0_13
  L2_15 = A0_13.say
  L2_15(L3_16, A0_13, 20, 0)
  L3_16 = A0_13
  L2_15 = A0_13.say
  L2_15(L3_16, A0_13, 21, 0)
  L3_16 = A0_13
  L2_15 = A0_13.askExtendWidget
  L2_15 = L2_15(L3_16, A0_13, 5, 2, 1, 2)
  L3_16 = L2_15
  if L3_16 == 1 then
    A0_13:say(A0_13, 23, 0)
    A0_13:say(A0_13, 24, 0)
    break
  else
  end
  if L3_16 == 2 then
    A0_13:say(A0_13, 22, 0)
    break
  else
  end
  L3_16 = A0_13.finishCliantTalkTurn
  L3_16(A0_13)
  return L2_15
end
function PopulaceGMEventTownReporter.trTalkEvent03_02(A0_17, A1_18)
  A0_17:startCliantTalkTurn(2, A1_18)
  A0_17:say(A0_17, 19, 0)
  A0_17:say(A0_17, 20, 0)
  A0_17:say(A0_17, 21, 0)
  A0_17:finishCliantTalkTurn()
end
