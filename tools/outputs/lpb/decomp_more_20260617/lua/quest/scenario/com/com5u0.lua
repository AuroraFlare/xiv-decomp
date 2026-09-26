require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com5u0", "ScenarioBaseClass")
function Com5u0.initText(A0_0)
  A0_0:_loadTextDataPermanently(6576, "com5u0")
end
function Com5u0.processEventAUBREYStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(3, 33) == 0 then
    A2_3:_runCharaScheduler(354041856)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  if A3_4 == 1 then
    A2_3:say(A0_1, 76, 0)
  else
    A2_3:say(A0_1, 5, 0)
  end
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 6, 0)
  if A3_4 == 1 then
    A2_3:say(A0_1, 77, 0)
  else
    A2_3:say(A0_1, 7, 0)
  end
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(70828032)
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Com5u0.processEvent_000(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = A2_7.startCliantTalkTurn
  L3_8(A2_7, 2, A1_6)
  L3_8 = A2_7.doSalute
  L3_8 = L3_8(A2_7, 3, 33)
  if L3_8 == 0 then
    A2_7:_runCharaScheduler(354041856)
  end
  A0_5:_wait(1)
  A2_7:say(A0_5, 10, 0)
  if L3_8 ~= 0 then
    A2_7:_waitForCharaSchedulerFinished(L3_8)
  end
  A2_7:finishCliantTalkTurn()
end
function Com5u0.processEvent_005(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  local L6_15
  L6_15 = 0
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(353980416)
  A2_11:say(A0_9, 11, 0)
  if A5_14 == 1 then
    A2_11:say(A0_9, 78, 0)
    A2_11:say(A0_9, 79, 0)
    A2_11:say(A0_9, 80, 0)
    A2_11:_runCharaScheduler(353984512)
    A2_11:say(A0_9, 81, 0, L6_15, L6_15, A4_13)
  else
    A2_11:say(A0_9, 12, 0)
    A2_11:say(A0_9, 74, 0)
    A2_11:say(A0_9, 13, 0)
    A2_11:_runCharaScheduler(353984512)
    A2_11:say(A0_9, 14, 0, L6_15, L6_15, A4_13)
  end
  worldMaster:say(A0_9, 69, 1, 0, A4_13, A3_12)
  A2_11:say(A0_9, 15, 0)
  A2_11:finishCliantTalkTurn()
end
function Com5u0.processEvent_005_1(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21)
  local L6_22
  L6_22 = 0
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:_runCharaScheduler(353959936)
  if A5_21 == 1 then
    A2_18:say(A0_16, 82, 0, L6_22, L6_22, A4_20)
  else
    A2_18:say(A0_16, 16, 0, L6_22, L6_22, A4_20)
  end
  worldMaster:say(A0_16, 70, 1, 0, A4_20, A3_19)
  A2_18:say(A0_16, 17, 0)
  A2_18:finishCliantTalkTurn()
end
function Com5u0.processEvent_010(A0_23, A1_24, A2_25, A3_26)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:_runCharaScheduler(354168832)
  A2_25:say(A0_23, 20, 0)
  A2_25:_runCharaScheduler(70844416)
  A2_25:say(A0_23, 21, 0)
  A2_25:say(A0_23, 22, 0)
  A2_25:say(A0_23, 23, 0)
  A2_25:_runCharaScheduler(354168832)
  A2_25:say(A0_23, 24, 0)
  A2_25:say(A0_23, 25, 0)
  A2_25:say(A0_23, 26, 0)
  worldMaster:say(A0_23, 27, 1, 0)
  A2_25:say(A0_23, 28, 0)
  worldMaster:say(A0_23, 29, 0, A3_26)
  A2_25:_runCharaScheduler(354168832)
  A2_25:say(A0_23, 30, 0)
  A2_25:say(A0_23, 31, 0)
  A2_25:say(A0_23, 32, 0)
  worldMaster:say(A0_23, 75, 1, 0)
  A2_25:say(A0_23, 33, 0)
  A2_25:say(A0_23, 34, 0)
  A2_25:finishCliantTalkTurn()
end
function Com5u0.processEvent_010_01(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:say(A0_27, 68, 0)
  if A2_29:ask(A0_27, 35, 2) == 1 then
  else
    A2_29:_runCharaScheduler(70795264)
    A2_29:say(A0_27, 72, 0)
    A2_29:finishCliantTalkTurn()
  end
  return (A2_29:ask(A0_27, 35, 2))
end
function Com5u0.processEvent_015(A0_30, A1_31, A2_32, A3_33)
  A2_32:startCliantTalkTurn(2, A1_31)
  if A3_33 == 1 then
    A2_32:say(A0_30, 73, 0)
  else
    A2_32:say(A0_30, 39, 0)
  end
  A2_32:say(A0_30, 40, 0)
  desktopWidget:openPublicInformDialogWidget(worldMaster, 25117, 11000261)
  worldMaster:notify(worldMaster, 25117, 11000261)
  A0_30:_wait(3)
  A2_32:say(A0_30, 41, 0)
  A2_32:say(A0_30, 42, 0)
  A2_32:say(A0_30, 43, 0)
  A2_32:say(A0_30, 44, 0)
  A2_32:say(A0_30, 47, 0)
  A2_32:say(A0_30, 48, 0)
  A2_32:finishCliantTalkTurn()
end
function Com5u0.processEvent_015_1(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 49, 0)
  A2_36:finishCliantTalkTurn()
end
function Com5u0.processEvent_015_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 50, 0)
  A2_39:say(A0_37, 51, 0)
  A2_39:say(A0_37, 52, 0)
  A2_39:finishCliantTalkTurn()
end
function Com5u0.processEvent_020(A0_40, A1_41, A2_42, A3_43)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:_runCharaScheduler(354168832)
  A2_42:say(A0_40, 53, 0)
  A0_40:startFadeOut(A1_41, 1)
  A0_40:_wait(1)
  A0_40:_wait(1)
  A2_42:_runCharaScheduler(70881280)
  A0_40:startFadeIn(A1_41, 1)
  if A3_43 == 1 then
    A2_42:say(A0_40, 83, 0)
  else
    A2_42:say(A0_40, 54, 0)
  end
  if A3_43 == 1 then
    A2_42:say(A0_40, 84, 0)
    A2_42:_runCharaScheduler(354168832)
    A2_42:say(A0_40, 85, 0)
  else
    A2_42:say(A0_40, 56, 0)
    A2_42:_runCharaScheduler(354168832)
    A2_42:say(A0_40, 57, 0)
  end
  A2_42:say(A0_40, 58, 0)
  A2_42:finishCliantTalkTurn()
end
function Com5u0.processEvent_020_1(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:_runCharaScheduler(354168832)
  A2_46:say(A0_44, 59, 0)
  A2_46:finishCliantTalkTurn()
end
function Com5u0.processEvent_025(A0_47, A1_48, A2_49, A3_50)
  A2_49:startCliantTalkTurn(2, A1_48)
  if A2_49:doSalute(3, 33) == 0 then
    A2_49:_runCharaScheduler(354041856)
  end
  A0_47:_wait(1)
  A2_49:say(A0_47, 60, 0)
  A0_47:startFadeOut(A1_48, 1)
  A0_47:_wait(1)
  A0_47:_wait(1)
  A2_49:_runCharaScheduler(354086912)
  A0_47:startFadeIn(A1_48, 1)
  A2_49:say(A0_47, 61, 0)
  A2_49:say(A0_47, 62, 0)
  if A3_50 == 1 then
    A2_49:say(A0_47, 86, 0)
  else
    A2_49:say(A0_47, 63, 0)
  end
  A2_49:say(A0_47, 64, 0)
  A2_49:say(A0_47, 65, 0)
  A2_49:say(A0_47, 66, 0)
  A2_49:_runCharaScheduler(354107392)
  A2_49:say(A0_47, 67, 0)
  A2_49:finishCliantTalkTurn()
end
function Com5u0.menberCountUnderRange(A0_51, A1_52, A2_53, A3_54, A4_55)
  local L5_56
  L5_56 = 0
  A2_53:startCliantTalkTurn(0, A1_52)
  A2_53:_runCharaScheduler(354168832)
  A2_53:say(A0_51, 20, 0)
  A2_53:say(A0_51, 18, 0, L5_56, L5_56, A4_55)
  worldMaster:say(A0_51, 71, 1, 0, A4_55, A3_54)
  A2_53:finishCliantTalkTurn()
end
