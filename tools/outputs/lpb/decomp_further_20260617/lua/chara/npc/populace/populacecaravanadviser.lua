require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCaravanAdviser", "NpcBaseClass")
function PopulaceCaravanAdviser.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(7536, "populaceCaravanAdviser")
  A0_0:_setGroundOn(false)
end
function PopulaceCaravanAdviser.adviserDeffault(A0_1)
  local L1_2
  L1_2 = worldMaster
  L1_2 = L1_2._getMyPlayer
  L1_2 = L1_2(L1_2)
  A0_1:startCliantTalkTurn(2, L1_2)
  A0_1:say(A0_1, 1, 0)
  A0_1:_runCharaScheduler(353964032)
  A0_1:say(A0_1, 2, 0, 3011317)
  A0_1:finishCliantTalkTurn()
end
function PopulaceCaravanAdviser.adviserAsk(A0_3)
  local L1_4, L2_5
  L1_4 = worldMaster
  L2_5 = L1_4
  L1_4 = L1_4._getMyPlayer
  L1_4 = L1_4(L2_5)
  L2_5 = A0_3.startCliantTalkTurn
  L2_5(A0_3, 2, L1_4)
  L2_5 = A0_3._runCharaScheduler
  L2_5(A0_3, 353964032)
  L2_5 = A0_3.say
  L2_5(A0_3, A0_3, 3, 0)
  L2_5 = 0
  L2_5 = worldMaster:askMultipleTextMacro(A0_3, A0_3, 1, 4, 3, 1, true, true, true, 3011317, 1, 3011317, 1, 3011317, 1)
  if L2_5 == nil then
    A0_3:_runCharaScheduler(354041856)
    A0_3:finishCliantTalkTurn()
  end
  return L2_5
end
function PopulaceCaravanAdviser.adviserAdvise(A0_6)
  A0_6:say(A0_6, 8, 0)
  A0_6:_runCharaScheduler(354086912)
  A0_6:say(A0_6, 9, 0, 3011317)
  A0_6:say(A0_6, 10, 0)
  A0_6:say(A0_6, 11, 0)
  A0_6:_runCharaScheduler(354103296)
  A0_6:say(A0_6, 12, 0)
  A0_6:finishCliantTalkTurn()
end
function PopulaceCaravanAdviser.adviserSales(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12
  L2_9 = worldMaster
  L3_10 = L2_9
  L2_9 = L2_9._getMyPlayer
  L2_9 = L2_9(L3_10)
  L4_11 = L2_9
  L3_10 = L2_9.getMoneyOnHand
  L5_12 = 1000001
  L3_10 = L3_10(L4_11, L5_12)
  L4_11 = 0
  L5_12 = A0_7._runCharaScheduler
  L5_12(A0_7, 354099200)
  L5_12 = A0_7.say
  L5_12(A0_7, A0_7, 13, 0, A1_8)
  L5_12 = worldMaster
  L5_12 = L5_12.say
  L5_12(L5_12, worldMaster, 53013, L3_10)
  L5_12 = 0
  L5_12 = A0_7:askExtendWidget(A0_7, 14, 2, 1, 2, 3011317)
  if L5_12 == nil then
    A0_7:_runCharaScheduler(354041856)
    A0_7:finishCliantTalkTurn()
  end
  return L5_12
end
function PopulaceCaravanAdviser.adviserBuy(A0_13)
  A0_13:_runCharaScheduler(354107392)
  A0_13:say(A0_13, 17, 0)
  A0_13:finishCliantTalkTurn()
end
function PopulaceCaravanAdviser.adviserBuyNG(A0_14)
  A0_14:_runCharaScheduler(354041856)
  A0_14:_wait(1)
  A0_14:finishCliantTalkTurn()
end
