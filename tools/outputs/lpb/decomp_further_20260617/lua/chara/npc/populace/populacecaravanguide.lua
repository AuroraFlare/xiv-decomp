require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCaravanGuide", "NpcBaseClass")
function PopulaceCaravanGuide.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(7552, "populaceCaravanGuide")
  A0_0:_setGroundOn(true)
end
function PopulaceCaravanGuide.caravanGuardCancel(A0_1)
  local L1_2
  L1_2 = worldMaster
  L1_2 = L1_2._getMyPlayer
  L1_2 = L1_2(L1_2)
  A0_1:startCliantTalkTurn(1, L1_2)
  A0_1:say(A0_1, 7, 0)
  if A0_1:askExtendWidget(A0_1, 8, 2, 1, 2) == 1 then
    A0_1:say(A0_1, 11, 0)
  end
  A0_1:finishCliantTalkTurn()
  return (A0_1:askExtendWidget(A0_1, 8, 2, 1, 2))
end
function PopulaceCaravanGuide.caravanGuardReward(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9)
  local L7_10
  L7_10 = worldMaster
  L7_10 = L7_10._getMyPlayer
  L7_10 = L7_10(L7_10)
  A0_3:startCliantTalkTurn(1, L7_10)
  if A1_4 == 9 then
    A0_3:_runCharaScheduler(84062208)
    A0_3:say(A0_3, 16, 0, A3_6 + A6_9)
  elseif A1_4 == 0 then
    A0_3:_runCharaScheduler(83927040)
    A0_3:say(A0_3, 13, 0)
  elseif A1_4 > 0 and A1_4 <= 5 then
    A0_3:_runCharaScheduler(84058112)
    A0_3:say(A0_3, 14, 0)
  else
    A0_3:_runCharaScheduler(83959808)
    A0_3:say(A0_3, 15, 0, A3_6 + A6_9)
  end
  if A5_8 >= 50 then
    A0_3:say(A0_3, 32, 0)
  else
    if A5_8 < 50 and A5_8 >= 40 then
      A0_3:say(A0_3, 31, 0, 0, A1_4)
    else
    end
  end
  A0_3:say(A0_3, 17, 0)
  if A3_6 ~= A4_7 then
    A0_3:say(A0_3, 38, 0, A4_7, A3_6)
  end
  A0_3:_runCharaScheduler(354107392)
  A0_3:_waitForCharaSchedulerFinished(354107392)
  A0_3:say(A0_3, 29, 0, A3_6 + A6_9)
  if A0_3:askExtendWidget(A0_3, 33, 2, 1, 1, A3_6 + A6_9) == 1 then
    A0_3:say(A0_3, 36, 0)
  else
  end
  A0_3:finishCliantTalkTurn()
  return (A0_3:askExtendWidget(A0_3, 33, 2, 1, 1, A3_6 + A6_9))
end
function PopulaceCaravanGuide.caravanGuardNotReward(A0_11)
  worldMaster:say(A0_11, 46)
end
function PopulaceCaravanGuide.caravanGuardFailReward(A0_12, A1_13, A2_14)
  local L3_15
  L3_15 = worldMaster
  L3_15 = L3_15._getMyPlayer
  L3_15 = L3_15(L3_15)
  A0_12:startCliantTalkTurn(1, L3_15)
  A0_12:say(A0_12, 20, 0, A1_13 + A2_14)
  A0_12:_runCharaScheduler(354107392)
  A0_12:say(A0_12, 21, 0, 3011317)
  A0_12:_waitForCharaSchedulerFinished(354107392)
  A0_12:say(A0_12, 29, 0, A1_13 + A2_14)
  if A0_12:askExtendWidget(A0_12, 33, 2, 1, 1, A1_13 + A2_14) == 1 then
    A0_12:say(A0_12, 36, 0)
  else
  end
  A0_12:finishCliantTalkTurn()
  return (A0_12:askExtendWidget(A0_12, 33, 2, 1, 1, A1_13 + A2_14))
end
function PopulaceCaravanGuide.caravanGuardThanks(A0_16, A1_17, A2_18, A3_19)
  local L4_20
  L4_20 = worldMaster
  L4_20 = L4_20._getMyPlayer
  L4_20 = L4_20(L4_20)
  A0_16:startCliantTalkTurn(1, L4_20)
  A0_16:_runCharaScheduler(354004992)
  A0_16:say(A0_16, 4, 0, A1_17, A2_18, A3_19)
  A0_16:say(A0_16, 5, 0)
  A0_16:say(A0_16, 30, 0)
  if A0_16:askExtendWidget(A0_16, 8, 2, 1, 2) == 1 then
    A0_16:say(A0_16, 11, 0)
  end
  A0_16:finishCliantTalkTurn()
  return (A0_16:askExtendWidget(A0_16, 8, 2, 1, 2))
end
function PopulaceCaravanGuide.caravanGuardOffer(A0_21, A1_22, A2_23, A3_24)
  local L4_25
  L4_25 = worldMaster
  L4_25 = L4_25._getMyPlayer
  L4_25 = L4_25(L4_25)
  A0_21:startCliantTalkTurn(1, L4_25)
  A0_21:say(A0_21, 1, 0, A1_22 + A2_23)
  A0_21:_runCharaScheduler(354103296)
  A0_21:say(A0_21, 2, 0, A3_24, A1_22 + A2_23)
  A0_21:finishCliantTalkTurn()
end
function PopulaceCaravanGuide.caravanGuardAmple(A0_26, A1_27, A2_28)
  local L3_29
  L3_29 = worldMaster
  L3_29 = L3_29._getMyPlayer
  L3_29 = L3_29(L3_29)
  A0_26:startCliantTalkTurn(1, L3_29)
  A0_26:_runCharaScheduler(84037632)
  A0_26:say(A0_26, 3, 0, A1_27 + A2_28)
  A0_26:finishCliantTalkTurn()
end
function PopulaceCaravanGuide.caravanGuardSuccess(A0_30)
  local L1_31
  L1_31 = worldMaster
  L1_31 = L1_31._getMyPlayer
  L1_31 = L1_31(L1_31)
  A0_30:startCliantTalkTurn(1, L1_31)
  A0_30:_runCharaScheduler(354082816)
  A0_30:say(A0_30, 18, 0)
  A0_30:finishCliantTalkTurn()
end
function PopulaceCaravanGuide.caravanGuardFailure(A0_32, A1_33, A2_34)
  local L3_35
  L3_35 = worldMaster
  L3_35 = L3_35._getMyPlayer
  L3_35 = L3_35(L3_35)
  A0_32:startCliantTalkTurn(1, L3_35)
  A0_32:_runCharaScheduler(84049920)
  A0_32:say(A0_32, 22, 0, A1_33 + A2_34)
  A0_32:finishCliantTalkTurn()
end
function PopulaceCaravanGuide.caravanGuardIgnore(A0_36)
  local L1_37
  L1_37 = worldMaster
  L1_37 = L1_37._getMyPlayer
  L1_37 = L1_37(L1_37)
  A0_36:startCliantTalkTurn(2, L1_37)
  A0_36:finishCliantTalkTurn()
end
function PopulaceCaravanGuide.caravanGuardBonusReward(A0_38, A1_39, A2_40)
  A0_38:_runCharaScheduler(354107392)
  if A2_40 == true then
    A0_38:say(A0_38, 39, 0)
  else
    A0_38:say(A0_38, 40, 0)
  end
  A0_38:_waitForCharaSchedulerFinished(354107392)
  A0_38:finishCliantTalkTurn()
end
function PopulaceCaravanGuide.caravanGuardNotBonusReward(A0_41)
  A0_41:_runCharaScheduler(354041856)
  A0_41:say(A0_41, 41, 0)
  A0_41:finishCliantTalkTurn()
end
