require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceNMRushGuide", "NpcBaseClass")
function PopulaceNMRushGuide.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(10608, "populaceNMRushGuide")
  A0_0:_setGroundOn(false)
end
function PopulaceNMRushGuide.processWarpAsk(A0_1, A1_2)
  local L2_3
  L2_3 = A0_1.startCliantTalkTurn
  L2_3(A0_1, 2, A1_2)
  L2_3 = A0_1._runCharaScheduler
  L2_3(A0_1, 354066432)
  L2_3 = A0_1.say
  L2_3(A0_1, A0_1, 19, 0)
  L2_3 = A0_1.say
  L2_3(A0_1, A0_1, 20, 0)
  L2_3 = worldMaster
  L2_3 = L2_3.say
  L2_3(L2_3, A0_1, 3, 45, 4)
  L2_3 = worldMaster
  L2_3 = L2_3.say
  L2_3(L2_3, A0_1, 51)
  L2_3 = {
    22,
    23,
    24
  }
  A0_1:finishCliantTalkTurn()
  return (A0_1:askForCustomizeOption(A0_1, 1, false, true, 21, L2_3))
end
function PopulaceNMRushGuide.processNotWarp(A0_4, A1_5)
  A0_4:startCliantTalkTurn(2, A1_5)
  A0_4:_runCharaScheduler(354066432)
  A0_4:say(A0_4, 25, 0)
  A0_4:say(A0_4, 26, 0)
  worldMaster:say(A0_4, 27)
  worldMaster:say(A0_4, 28, 45, 4)
  A0_4:finishCliantTalkTurn()
end
function PopulaceNMRushGuide.processBattleAsk(A0_6, A1_7)
  local L2_8
  L2_8 = A0_6.startCliantTalkTurn
  L2_8(A0_6, 2, A1_7)
  L2_8 = A0_6._runCharaScheduler
  L2_8(A0_6, 354103296)
  L2_8 = A0_6.say
  L2_8(A0_6, A0_6, 29, 0)
  L2_8 = A0_6.say
  L2_8(A0_6, A0_6, 30, 0)
  L2_8 = A0_6.say
  L2_8(A0_6, A0_6, 31, 0)
  L2_8 = {
    33,
    34,
    35
  }
  A0_6:finishCliantTalkTurn()
  return (A0_6:askForCustomizeOption(A0_6, 1, false, true, 32, L2_8))
end
function PopulaceNMRushGuide.processNotBattle(A0_9, A1_10)
  local L2_11
  L2_11 = A0_9.startCliantTalkTurn
  L2_11(A0_9, 2, A1_10)
  L2_11 = A0_9._runCharaScheduler
  L2_11(A0_9, 354103296)
  L2_11 = A0_9.say
  L2_11(A0_9, A0_9, 29, 0)
  L2_11 = A0_9.say
  L2_11(A0_9, A0_9, 30, 0)
  L2_11 = A0_9.say
  L2_11(A0_9, A0_9, 31, 0)
  L2_11 = worldMaster
  L2_11 = L2_11.say
  L2_11(L2_11, A0_9, 52)
  L2_11 = {34, 35}
  A0_9:finishCliantTalkTurn()
  return (A0_9:askForCustomizeOption(A0_9, 1, false, true, 32, L2_11))
end
function PopulaceNMRushGuide.processReturnAsk(A0_12, A1_13)
  local L2_14
  L2_14 = A0_12._runCharaScheduler
  L2_14(A0_12, 69165056)
  L2_14 = A0_12.say
  L2_14(A0_12, A0_12, 53, 0)
  L2_14 = A0_12.say
  L2_14(A0_12, A0_12, 54, 0)
  L2_14 = {38, 39}
  A0_12:finishCliantTalkTurn()
  return (A0_12:askForCustomizeOption(A0_12, 2, false, true, 37, L2_14))
end
function PopulaceNMRushGuide.processContentEndAsk(A0_15, A1_16)
  local L2_17
  L2_17 = A0_15.startCliantTalkTurn
  L2_17(A0_15, 1, A1_16)
  L2_17 = A0_15._runCharaScheduler
  L2_17(A0_15, 69165056)
  L2_17 = A0_15.say
  L2_17(A0_15, A0_15, 46, 0)
  L2_17 = A0_15.say
  L2_17(A0_15, A0_15, 47, 0)
  L2_17 = {49, 50}
  A0_15:finishCliantTalkTurn()
  return (A0_15:askForCustomizeOption(A0_15, 2, false, true, 48, L2_17))
end
function PopulaceNMRushGuide.processBattleEnd(A0_18, A1_19)
  A0_18:startCliantTalkTurn(1, A1_19)
  A0_18:_runCharaScheduler(70828032)
  A0_18:say(A0_18, 44, 0)
  A0_18:finishCliantTalkTurn()
end
