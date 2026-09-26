require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceRequestWarden", "NpcBaseClass")
function PopulaceRequestWarden.initForEvent(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = {}
  L4_4 = {
    {"speechType", "integer8"},
    {"townType", "integer8"}
  }
  A0_0:initWork(L3_3, L4_4)
  A0_0:_setGroundOn(true)
  A0_0:setTempWork("speechType", A1_1)
  A0_0:setTempWork("townType", A2_2)
  A0_0:_loadTextDataPermanently(1355, "populaceRequestWarden")
end
function PopulaceRequestWarden.eventTalkRequestJoin(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10)
  local L6_11, L7_12, L8_13
  L6_11 = worldMaster
  L7_12 = L6_11
  L6_11 = L6_11._getMyPlayer
  L6_11 = L6_11(L7_12)
  L8_13 = A0_5
  L7_12 = A0_5.startCliantTalkTurn
  L7_12(L8_13, 1, L6_11)
  L7_12 = 3
  L8_13 = _math
  L8_13 = L8_13.floor
  L8_13 = L8_13(A1_6 / 60 + 0.5)
  A0_5:_runCharaScheduler(354062336)
  A0_5:say(A0_5, 1 + A0_5:getTempWork("speechType"), 0, A0_5:getTempWork("townType"))
  if A5_10 == 0 then
    A0_5:say(A0_5, 5 + A0_5:getTempWork("speechType"), 0, L8_13)
  else
    A0_5:say(A0_5, 143 + 2 * A0_5:getTempWork("speechType"), 0)
    A0_5:say(A0_5, 144 + 2 * A0_5:getTempWork("speechType"), 0, L8_13)
  end
  worldMaster:say(A0_5, 157, A3_8, A4_9)
  while L7_12 == 3 do
    L7_12 = A0_5:askExtendWidget(A0_5, 111, 3, 1, 1)
    if L7_12 == 3 then
      A0_5:_runCharaScheduler(354004992)
      A0_5:say(A0_5, 115 + A0_5:getTempWork("speechType"), 0)
      A0_5:say(A0_5, 119 + A0_5:getTempWork("speechType"), 0)
      A0_5:_runCharaScheduler(70799360)
      A0_5:say(A0_5, 123 + A0_5:getTempWork("speechType"), 0, 8)
      A0_5:say(A0_5, 127 + A0_5:getTempWork("speechType"), 0)
    end
  end
  return L7_12
end
function PopulaceRequestWarden.eventTalkStep01(A0_14)
  A0_14:_runCharaScheduler(84013056)
  A0_14:say(A0_14, 12 + A0_14:getTempWork("speechType"), 0)
  A0_14:say(A0_14, 16 + A0_14:getTempWork("speechType"), 0)
  A0_14:say(A0_14, 106 + A0_14:getTempWork("speechType"), 0)
  A0_14:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep02(A0_15)
  A0_15:_runCharaScheduler(354041856)
  A0_15:say(A0_15, 20 + A0_15:getTempWork("speechType"), 0)
  A0_15:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep03(A0_16)
  A0_16:_runCharaScheduler(354041856)
  A0_16:say(A0_16, 24 + A0_16:getTempWork("speechType"), 0)
  A0_16:say(A0_16, 28 + A0_16:getTempWork("speechType"), 0)
  A0_16:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep04(A0_17)
  A0_17:_runCharaScheduler(354041856)
  A0_17:say(A0_17, 32 + A0_17:getTempWork("speechType"), 0)
  A0_17:say(A0_17, 28 + A0_17:getTempWork("speechType"), 0)
  A0_17:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep05(A0_18)
  A0_18:_runCharaScheduler(354041856)
  A0_18:say(A0_18, 1 + A0_18:getTempWork("speechType"), 0, A0_18:getTempWork("townType"))
  A0_18:say(A0_18, 36 + A0_18:getTempWork("speechType"), 0)
  A0_18:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStopForTimer(A0_19)
  worldMaster:say(A0_19, 155)
  worldMaster:say(A0_19, 156)
end
function PopulaceRequestWarden.eventTalkRequestCancel(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  L2_22 = worldMaster
  L3_23 = L2_22
  L2_22 = L2_22._getMyPlayer
  L2_22 = L2_22(L3_23)
  L4_24 = A0_20
  L3_23 = A0_20.startCliantTalkTurn
  L3_23(L4_24, 1, L2_22)
  L3_23 = 3
  L4_24 = _math
  L4_24 = L4_24.floor
  L4_24 = L4_24(A1_21 / 60 + 0.5)
  A0_20:_runCharaScheduler(84013056)
  A0_20:say(A0_20, 40 + A0_20:getTempWork("speechType"), 0, L4_24)
  while L3_23 == 3 do
    L3_23 = A0_20:askExtendWidget(A0_20, 131, 3, 1, 1)
    if L3_23 == 3 then
      A0_20:_runCharaScheduler(354004992)
      A0_20:say(A0_20, 115 + A0_20:getTempWork("speechType"), 0)
      A0_20:say(A0_20, 119 + A0_20:getTempWork("speechType"), 0)
      A0_20:_runCharaScheduler(70799360)
      A0_20:say(A0_20, 123 + A0_20:getTempWork("speechType"), 0, 8)
      A0_20:say(A0_20, 127 + A0_20:getTempWork("speechType"), 0)
    end
  end
  return L3_23
end
function PopulaceRequestWarden.eventTalkStep06(A0_25)
  A0_25:_runCharaScheduler(354004992)
  A0_25:say(A0_25, 16 + A0_25:getTempWork("speechType"), 0)
  A0_25:say(A0_25, 106 + A0_25:getTempWork("speechType"), 0)
  A0_25:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep07(A0_26)
  A0_26:_runCharaScheduler(354041856)
  A0_26:say(A0_26, 47 + A0_26:getTempWork("speechType"), 0)
  A0_26:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep10(A0_27)
  A0_27:_runCharaScheduler(354000896)
  A0_27:say(A0_27, 55 + A0_27:getTempWork("speechType"), 0)
  A0_27:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkRequestGiveUp(A0_28)
  local L1_29, L2_30
  L1_29 = worldMaster
  L2_30 = L1_29
  L1_29 = L1_29._getMyPlayer
  L1_29 = L1_29(L2_30)
  L2_30 = A0_28.startCliantTalkTurn
  L2_30(A0_28, 2, L1_29)
  L2_30 = 0
  A0_28:_runCharaScheduler(84013056)
  A0_28:say(A0_28, 59 + A0_28:getTempWork("speechType"), 0)
  L2_30 = A0_28:askExtendWidget(A0_28, 63, 2, 1, 2)
  A0_28:finishCliantTalkTurn()
  return L2_30
end
function PopulaceRequestWarden.eventTalkStep12(A0_31)
  A0_31:_runCharaScheduler(354041856)
  A0_31:say(A0_31, 66 + A0_31:getTempWork("speechType"), 0)
  A0_31:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep13(A0_32)
  A0_32:_runCharaScheduler(354041856)
  A0_32:say(A0_32, 70 + A0_32:getTempWork("speechType"), 0)
  A0_32:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkStep14(A0_33)
  local L1_34
  L1_34 = worldMaster
  L1_34 = L1_34._getMyPlayer
  L1_34 = L1_34(L1_34)
  A0_33:startCliantTalkTurn(2, L1_34)
  A0_33:_runCharaScheduler(70799360)
  A0_33:say(A0_33, 1 + A0_33:getTempWork("speechType"), 0, A0_33:getTempWork("townType"))
  A0_33:say(A0_33, 74 + A0_33:getTempWork("speechType"), 0)
  A0_33:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkRequestEnd(A0_35, A1_36, A2_37)
  local L3_38, L4_39
  L3_38 = worldMaster
  L4_39 = L3_38
  L3_38 = L3_38._getMyPlayer
  L3_38 = L3_38(L4_39)
  L4_39 = A0_35.startCliantTalkTurn
  L4_39(A0_35, 1, L3_38)
  L4_39 = 0
  A0_35:_runCharaScheduler(84013056)
  A0_35:say(A0_35, 90 + A0_35:getTempWork("speechType"), 0, A1_36, A2_37)
  L4_39 = A0_35:askExtendWidget(A0_35, 94, 3, 1, 1)
  if L4_39 ~= 1 then
    A0_35:finishCliantTalkTurn()
  end
  return L4_39
end
function PopulaceRequestWarden.eventTalkStep22(A0_40)
  local L1_41
  L1_41 = worldMaster
  L1_41 = L1_41._getMyPlayer
  L1_41 = L1_41(L1_41)
  A0_40:startCliantTalkTurn(1, L1_41)
  A0_40:_runCharaScheduler(84004864)
  A0_40:say(A0_40, 86 + A0_40:getTempWork("speechType"), 0)
  return
end
function PopulaceRequestWarden.eventTalkStep24(A0_42)
  local L1_43
  L1_43 = worldMaster
  L1_43 = L1_43._getMyPlayer
  L1_43 = L1_43(L1_43)
  A0_42:startCliantTalkTurn(2, L1_43)
  A0_42:_runCharaScheduler(354062336)
  A0_42:say(A0_42, 98 + A0_42:getTempWork("speechType"), 0, A0_42:getTempWork("townType"))
  A0_42:finishCliantTalkTurn()
  return
end
function PopulaceRequestWarden.eventTalkCancel(A0_44)
  A0_44:finishCliantTalkTurn()
  return
end
