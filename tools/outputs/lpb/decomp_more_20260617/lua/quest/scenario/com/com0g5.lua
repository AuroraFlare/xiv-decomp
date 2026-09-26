require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0g5", "ScenarioBaseClass")
function Com0g5.initText(A0_0)
  A0_0:_loadTextDataPermanently(6016, "com0g5")
end
function Com0g5.processEventFulkeHint(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 85, 0)
  A2_3:say(A0_1, 86, 0)
  A2_3:say(A0_1, 87, 0)
  A2_3:say(A0_1, 88, 0)
  A2_3:say(A0_1, 89, 0)
  A2_3:finishCliantTalkTurn()
end
function Com0g5.processEventFulkeStart(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  if A2_6:doSalute(2, 33) == 0 then
    A2_6:_runCharaScheduler(353959936)
  end
  A0_4:_wait(1)
  A2_6:say(A0_4, 2, 0)
  A2_6:_runCharaScheduler(69193728)
  A2_6:say(A0_4, 3, 0)
  A2_6:say(A0_4, 4, 0)
  A2_6:_runCharaScheduler(353959936)
  A2_6:say(A0_4, 5, 0)
  if A0_4:showQuestInfomation() == 1 then
    A2_6:say(A0_4, 7, 0)
    A1_5:_runCharaScheduler(354111488)
    A2_6:_runCharaScheduler(354107392)
    A0_4:_wait(2.5)
    A2_6:say(A0_4, 8, 0)
    A2_6:finishCliantTalkTurn()
  else
    A2_6:_runCharaScheduler(354041856)
    A2_6:say(A0_4, 6, 0)
    A2_6:finishCliantTalkTurn()
  end
  return (A0_4:showQuestInfomation())
end
function Com0g5.followEvent005(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  if A2_9:doSalute(2, 33) == 0 then
    A2_9:_runCharaScheduler(353959936)
  end
  A0_7:_wait(1)
  A2_9:say(A0_7, 9, 0)
  A2_9:finishCliantTalkTurn()
  return
end
function Com0g5.processEvent005(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("com0g610", 1)
  A0_10:startFadeInCutSceneAfterWarp(A1_11)
  return
end
function Com0g5.processEvent010(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(354062336)
  A2_15:say(A0_13, 30, 0)
  A2_15:say(A0_13, 31, 0)
  A2_15:_runCharaScheduler(353959936)
  A2_15:say(A0_13, 32, 0)
  A2_15:say(A0_13, 33, 0)
  A2_15:say(A0_13, 34, 0)
  A2_15:_runCharaScheduler(354103296)
  A2_15:say(A0_13, 35, 0)
  A2_15:say(A0_13, 36, 0)
  A2_15:say(A0_13, 37, 0)
  A2_15:_runCharaScheduler(353964032)
  A2_15:say(A0_13, 38, 0)
  A2_15:say(A0_13, 39, 0)
  A2_15:say(A0_13, 80, 0)
  A2_15:say(A0_13, 40, 0)
  A1_14:_runCharaScheduler(354111488)
  A2_15:_runCharaScheduler(354107392)
  A0_13:_wait(2.5)
  A2_15:say(A0_13, 63, 0)
end
function Com0g5.processEvent011(A0_16, A1_17, A2_18)
  worldMaster:say(A0_16, 64, 1, 0)
  worldMaster:say(A0_16, 79, 1, 0)
end
function Com0g5.processEvent012(A0_19, A1_20, A2_21)
  A2_21:_runCharaScheduler(354062336)
  A2_21:say(A0_19, 81, 0)
  A2_21:finishCliantTalkTurn()
end
function Com0g5.processEvent010_1(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 69, 0)
  A2_24:_runCharaScheduler(354066432)
  A2_24:say(A0_22, 70, 0)
  A2_24:finishCliantTalkTurn()
end
function Com0g5.processEvent010_2(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:_runCharaScheduler(353959936)
  A2_27:say(A0_25, 71, 0)
  A2_27:say(A0_25, 72, 0)
  A2_27:finishCliantTalkTurn()
end
function Com0g5.processEvent010_3(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:_runCharaScheduler(354099200)
  A2_30:say(A0_28, 73, 0)
  A2_30:say(A0_28, 74, 0)
  A2_30:finishCliantTalkTurn()
end
function Com0g5.processEvent010_4(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:_runCharaScheduler(353964032)
  A2_33:say(A0_31, 75, 0)
  A2_33:say(A0_31, 76, 0)
  A2_33:finishCliantTalkTurn()
end
function Com0g5.processEvent010_5(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:_runCharaScheduler(354082816)
  A2_36:say(A0_34, 77, 0)
  A2_36:say(A0_34, 78, 0)
  A2_36:finishCliantTalkTurn()
end
function Com0g5.processEvent020(A0_37, A1_38, A2_39, A3_40)
  A2_39:startCliantTalkTurn(2, A1_38)
  if A3_40 == 0 then
    A2_39:_runCharaScheduler(353959936)
    A2_39:say(A0_37, 41, 0)
    A2_39:say(A0_37, 42, 0)
    A2_39:say(A0_37, 43, 0)
  elseif A3_40 == 1 then
    A2_39:say(A0_37, 44, 0)
    A2_39:_runCharaScheduler(354103296)
    A2_39:say(A0_37, 45, 0)
    A2_39:say(A0_37, 46, 0)
  else
    A2_39:_runCharaScheduler(354045952)
    A2_39:say(A0_37, 47, 0)
  end
  A2_39:finishCliantTalkTurn()
end
function Com0g5.processEvent030(A0_41, A1_42, A2_43, A3_44)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:_runCharaScheduler(83914752)
  A2_43:say(A0_41, 48, 0)
  A2_43:say(A0_41, 49, 0)
  A2_43:say(A0_41, 50, 0)
  A2_43:_runCharaScheduler(353968128)
  A2_43:say(A0_41, 51, 0)
  A2_43:say(A0_41, 52, 0)
  A2_43:_runCharaScheduler(354082816)
  A2_43:say(A0_41, 53, 0)
  A2_43:say(A0_41, 54, 0)
  A2_43:say(A0_41, 55, 0)
  A2_43:_runCharaScheduler(354103296)
  A2_43:say(A0_41, 56, 0)
  A2_43:say(A0_41, 57, 0)
  A2_43:_runCharaScheduler(353972224)
  A2_43:say(A0_41, 58, 0)
  A2_43:say(A0_41, 59, 0)
  if A3_44 == 0 then
    A2_43:_runCharaScheduler(353959936)
    A2_43:say(A0_41, 60, 0)
    A2_43:say(A0_41, 61, 0)
    A2_43:say(A0_41, 62, 0)
    break
  else
  end
  if A3_44 == 1 then
    A2_43:_runCharaScheduler(353964032)
    A2_43:say(A0_41, 82, 0)
    A2_43:say(A0_41, 83, 0)
    break
  else
  end
  A2_43:_runCharaScheduler(353959936)
  A2_43:say(A0_41, 60, 0)
  A2_43:say(A0_41, 61, 0)
  A2_43:say(A0_41, 62, 0)
  do break end
  A1_42:_runCharaScheduler(354111488)
  A2_43:_runCharaScheduler(354107392)
  A0_41:_wait(1.5)
  A2_43:say(A0_41, 84, 0)
  A2_43:finishCliantTalkTurn()
end
