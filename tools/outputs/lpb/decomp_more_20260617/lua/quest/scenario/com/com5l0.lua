require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com5l0", "ScenarioBaseClass")
function Com5l0.initText(A0_0)
  A0_0:_loadTextDataPermanently(6480, "com5l0")
end
function Com5l0.processEventGUINCUMStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  local L5_6
  L5_6 = 0
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(1, 33) == 0 then
    A2_3:_runCharaScheduler(354041856)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 2, 0, L5_6, L5_6, A3_4)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 6, 0)
  if A4_5 == 1 then
    A2_3:say(A0_1, 84, 0)
  else
    A2_3:say(A0_1, 7, 0)
  end
  A2_3:say(A0_1, 8, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 9, 0)
  A2_3:say(A0_1, 10, 0, L5_6, L5_6, A3_4)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 12, 0)
    A2_3:say(A0_1, 13, 0, L5_6, L5_6, A3_4)
  else
    A2_3:_runCharaScheduler(354099200)
    A2_3:say(A0_1, 11, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Com5l0.processEvent_000(A0_7, A1_8, A2_9, A3_10)
  local L4_11, L5_12
  L4_11 = 0
  L5_12 = A2_9.startCliantTalkTurn
  L5_12(A2_9, 2, A1_8)
  L5_12 = A2_9.doSalute
  L5_12 = L5_12(A2_9, 1, 33)
  if L5_12 == 0 then
    A2_9:_runCharaScheduler(354041856)
  end
  A0_7:_wait(1)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 14, 0)
  A2_9:say(A0_7, 15, 0, L4_11, L4_11, A3_10)
  if L5_12 ~= 0 then
    A2_9:_waitForCharaSchedulerFinished(L5_12)
  end
  A2_9:finishCliantTalkTurn()
end
function Com5l0.processEvent_005(A0_13, A1_14, A2_15, A3_16, A4_17)
  local L5_18
  L5_18 = 0
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(353959936)
  A2_15:say(A0_13, 16, 0)
  A1_14:_runCharaScheduler(354107392)
  A0_13:_wait(5)
  A0_13:startFadeOut(A1_14, 1)
  A0_13:_wait(1)
  A0_13:startFadeIn(A1_14, 1)
  A2_15:_runCharaScheduler(353959936)
  A2_15:say(A0_13, 17, 0)
  if A4_17 == 1 then
    A2_15:say(A0_13, 85, 0)
  else
    A2_15:say(A0_13, 18, 0)
  end
  A2_15:say(A0_13, 19, 0, 1, L5_18, A3_16)
  A2_15:say(A0_13, 20, 0)
  A2_15:say(A0_13, 21, 0)
  A2_15:say(A0_13, 22, 0)
  A2_15:_runCharaScheduler(354107392)
  A2_15:say(A0_13, 23, 0)
  A2_15:say(A0_13, 24, 0)
  A2_15:finishCliantTalkTurn()
end
function Com5l0.processEvent_005_01(A0_19, A1_20, A2_21, A3_22, A4_23)
  local L5_24
  L5_24 = 0
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(353959936)
  A2_21:say(A0_19, 25, 0)
  A2_21:say(A0_19, 26, 0, L5_24, L5_24, A3_22)
  worldMaster:say(A0_19, 80, 1, 0, A3_22, A4_23)
  A2_21:finishCliantTalkTurn()
end
function Com5l0.processEvent_010(A0_25, A1_26, A2_27, A3_28, A4_29)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:_runCharaScheduler(354168832)
  if A3_28 == 1 then
    A2_27:say(A0_25, 29, 0)
  else
    A2_27:say(A0_25, 30, 0)
  end
  A0_25:startFadeOut(A1_26, 1)
  A0_25:_wait(1)
  A0_25:startFadeIn(A1_26, 1)
  A2_27:_runCharaScheduler(70844416)
  A2_27:say(A0_25, 31, 0)
  A2_27:say(A0_25, 32, 0)
  A2_27:say(A0_25, 33, 0)
  A2_27:say(A0_25, 34, 0)
  A2_27:say(A0_25, 81, 0)
  worldMaster:say(A0_25, 35, 1, 0)
  A2_27:say(A0_25, 36, 0)
  worldMaster:say(A0_25, 37, 1, A4_29)
  A2_27:_runCharaScheduler(354168832)
  A2_27:say(A0_25, 38, 0)
  A2_27:say(A0_25, 39, 0)
  A2_27:say(A0_25, 40, 0)
  worldMaster:say(A0_25, 82, 1, 0)
  A2_27:_runCharaScheduler(70844416)
  A2_27:say(A0_25, 41, 0)
  A2_27:say(A0_25, 42, 0)
  A2_27:finishCliantTalkTurn()
  return
end
function Com5l0.processEvent_010_01(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:say(A0_30, 79, 0)
  if A2_32:ask(A0_30, 43, 2) == 1 then
  else
    A2_32:say(A0_30, 46, 0)
    A2_32:finishCliantTalkTurn()
  end
  return (A2_32:ask(A0_30, 43, 2))
end
function Com5l0.menberCountUnderRange(A0_33, A1_34, A2_35, A3_36, A4_37, A5_38)
  local L6_39
  L6_39 = A2_35.startCliantTalkTurn
  L6_39(A2_35, 2, A1_34)
  L6_39 = 0
  if A5_38 == 1 then
    A2_35:say(A0_33, 29, 0)
  else
    A2_35:say(A0_33, 30, 0)
  end
  A2_35:_runCharaScheduler(354168832)
  A2_35:say(A0_33, 27, 0, L6_39, L6_39, A4_37)
  worldMaster:say(A0_33, 28, 1, 0, A4_37, A3_36)
  A2_35:finishCliantTalkTurn()
end
function Com5l0.processEvent_015(A0_40, A1_41, A2_42, A3_43)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 48, 0)
  if A3_43 == 1 then
    A2_42:say(A0_40, 49, 0)
  else
    A2_42:say(A0_40, 50, 0)
  end
  A2_42:say(A0_40, 51, 0)
  A2_42:say(A0_40, 52, 0)
  A2_42:say(A0_40, 53, 0)
  A2_42:say(A0_40, 54, 0)
  A2_42:say(A0_40, 55, 0)
  A2_42:finishCliantTalkTurn()
end
function Com5l0.processEvent_015_1(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 56, 0)
  A2_46:say(A0_44, 57, 0)
  A2_46:finishCliantTalkTurn()
end
function Com5l0.processEvent_015_2(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 58, 0)
  A2_49:say(A0_47, 59, 0)
  A2_49:finishCliantTalkTurn()
end
function Com5l0.processEvent_020(A0_50, A1_51, A2_52, A3_53, A4_54)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:_runCharaScheduler(354168832)
  A2_52:say(A0_50, 60, 0)
  A0_50:startFadeOut(A1_51, 1)
  A0_50:_wait(1)
  A0_50:startFadeIn(A1_51, 1)
  if A3_53 == 1 then
    A2_52:say(A0_50, 61, 0)
    A2_52:say(A0_50, 62, 0)
  else
    A2_52:say(A0_50, 63, 0)
    A2_52:say(A0_50, 64, 0)
  end
  A2_52:_runCharaScheduler(70844416)
  A2_52:say(A0_50, 65, 0)
  A2_52:say(A0_50, 66, 0)
  A2_52:say(A0_50, 67, 0)
  if A4_54 == 1 then
    A2_52:say(A0_50, 86, 0)
  else
    A2_52:say(A0_50, 68, 0)
  end
  A2_52:finishCliantTalkTurn()
end
function Com5l0.processEvent_020_2(A0_55, A1_56, A2_57, A3_58)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:_runCharaScheduler(354168832)
  if A3_58 == 1 then
    A2_57:say(A0_55, 87, 0)
  else
    A2_57:say(A0_55, 83, 0)
  end
  A2_57:finishCliantTalkTurn()
end
function Com5l0.processEvent_020_1(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:_runCharaScheduler(353959936)
  A2_61:say(A0_59, 69, 0)
  A2_61:say(A0_59, 70, 0)
  A2_61:finishCliantTalkTurn()
end
function Com5l0.processEvent_025(A0_62, A1_63, A2_64, A3_65)
  A2_64:startCliantTalkTurn(2, A1_63)
  if A2_64:doSalute(1, 33) == 0 then
    A2_64:_runCharaScheduler(354041856)
  end
  A0_62:_wait(1)
  A2_64:say(A0_62, 71, 0)
  A1_63:_runCharaScheduler(354107392)
  A2_64:_runCharaScheduler(354086912)
  A2_64:say(A0_62, 72, 0)
  if A3_65 == 1 then
    A2_64:say(A0_62, 88, 0)
    A2_64:say(A0_62, 89, 0)
    A2_64:_runCharaScheduler(353964032)
    A2_64:say(A0_62, 90, 0)
    A2_64:say(A0_62, 91, 0)
    A2_64:say(A0_62, 92, 0)
    A2_64:say(A0_62, 93, 0)
  else
    A2_64:say(A0_62, 73, 0)
    A2_64:say(A0_62, 74, 0)
    A2_64:_runCharaScheduler(353964032)
    A2_64:say(A0_62, 75, 0)
    A2_64:say(A0_62, 76, 0)
    A2_64:say(A0_62, 77, 0)
    A2_64:say(A0_62, 78, 0)
  end
  A2_64:finishCliantTalkTurn()
end
