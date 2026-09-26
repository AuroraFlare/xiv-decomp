require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0l6", "ScenarioBaseClass")
function Com0l6.initText(A0_0)
  A0_0:_loadTextDataPermanently(6176, "com0l6")
end
function Com0l6.processEventGUINCUMStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(1, 33) == 0 then
    A2_3:_runCharaScheduler(354062336)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 2, 0)
  A0_1:startFadeOut(A1_2, 1)
  A0_1:_wait(1)
  A2_3:_runCharaScheduler(354086912)
  A0_1:startFadeIn(A1_2, 1)
  A2_3:say(A0_1, 103, 0)
  A2_3:say(A0_1, 104, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 6, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 7, 0)
  if A3_4 == 1 then
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:say(A0_1, 11, 0)
  A2_3:_runCharaScheduler(353972224)
  A2_3:say(A0_1, 12, 0)
  A2_3:say(A0_1, 13, 0)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 14, 0)
  A2_3:say(A0_1, 94, 0)
  A2_3:say(A0_1, 15, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354066432)
    A2_3:say(A0_1, 18, 0)
    A2_3:say(A0_1, 19, 0)
  else
    A2_3:_runCharaScheduler(353968128)
    A2_3:say(A0_1, 16, 0)
    A2_3:say(A0_1, 17, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Com0l6.processEventGUINCUMHint(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  if A2_7:doSalute(1, 33) == 0 then
    A2_7:_runCharaScheduler(353959936)
  end
  A0_5:_wait(1)
  A2_7:say(A0_5, 98, 0)
  A2_7:say(A0_5, 99, 0)
  A2_7:say(A0_5, 100, 0)
  A2_7:_runCharaScheduler(353968128)
  A2_7:say(A0_5, 101, 0)
  A2_7:say(A0_5, 102, 0)
  A2_7:finishCliantTalkTurn()
end
function Com0l6.processEvent_000(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 20, 0)
  A2_10:say(A0_8, 21, 0)
  A2_10:finishCliantTalkTurn()
end
function Com0l6.processEvent_005_1(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(354066432)
  A2_13:say(A0_11, 22, 0)
  A2_13:say(A0_11, 23, 0)
  A2_13:finishCliantTalkTurn()
end
function Com0l6.processEvent_005_2(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:_runCharaScheduler(354234368)
  A2_16:say(A0_14, 24, 0)
  A2_16:finishCliantTalkTurn()
end
function Com0l6.processEvent_005_3(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:_runCharaScheduler(353959936)
  A2_19:say(A0_17, 96, 0)
  A2_19:finishCliantTalkTurn()
end
function Com0l6.processEvent_005_4(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 95, 0)
  A2_22:finishCliantTalkTurn()
end
function Com0l6.processEvent_005(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:_runCharaScheduler(354082816)
  A2_25:say(A0_23, 25, 0)
  A2_25:say(A0_23, 26, 0)
  A2_25:say(A0_23, 27, 0)
  A2_25:_runCharaScheduler(353959936)
  A2_25:say(A0_23, 28, 0)
  A2_25:say(A0_23, 29, 0)
  A2_25:finishCliantTalkTurn()
end
function Com0l6.processEvent_010(A0_26, A1_27, A2_28, A3_29)
  A0_26:startFadeOutCutSceneDefault(A1_27)
  A0_26:startNQCutScene("com0l510", 1, 0, A3_29)
  A0_26:startFadeInCutSceneDefault(A1_27)
end
function Com0l6.processEvent_015_1(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:_runCharaScheduler(353959936)
  A2_32:say(A0_30, 59, 0)
  A2_32:say(A0_30, 60, 0)
  A2_32:finishCliantTalkTurn()
end
function Com0l6.processEvent_015_2(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:say(A0_33, 61, 0)
  A2_35:_runCharaScheduler(84017152)
  A2_35:say(A0_33, 62, 0)
  A2_35:finishCliantTalkTurn()
end
function Com0l6.processEvent_015_3(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:_runCharaScheduler(83968000)
  A2_38:say(A0_36, 63, 0)
  A2_38:say(A0_36, 64, 0)
  A2_38:finishCliantTalkTurn()
end
function Com0l6.processEvent_015_4(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 89, 0)
  A2_41:_runCharaScheduler(353968128)
  A2_41:say(A0_39, 90, 0)
  A2_41:finishCliantTalkTurn()
end
function Com0l6.processEvent_015_5(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:_runCharaScheduler(353959936)
  A2_44:say(A0_42, 91, 0)
  A2_44:finishCliantTalkTurn()
end
function Com0l6.processEvent_015_6(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:_runCharaScheduler(353959936)
  A2_47:say(A0_45, 92, 0)
  A2_47:finishCliantTalkTurn()
end
function Com0l6.processEvent_015_7(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:_runCharaScheduler(353959936)
  A2_50:say(A0_48, 93, 0)
  A2_50:finishCliantTalkTurn()
end
function Com0l6.processEvent_015(A0_51, A1_52, A2_53, A3_54)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:_runCharaScheduler(354062336)
  if A3_54 == 3 then
    A2_53:say(A0_51, 65, 0)
  else
    A2_53:say(A0_51, 109, 0)
  end
  A2_53:say(A0_51, 66, 0)
  A2_53:_runCharaScheduler(353964032)
  A2_53:say(A0_51, 67, 0)
  A2_53:say(A0_51, 68, 0)
  if A3_54 == 1 then
    A2_53:_runCharaScheduler(354041856)
    A2_53:say(A0_51, 69, 0)
    break
  else
  end
  if A3_54 == 2 then
    A2_53:_runCharaScheduler(354041856)
    A2_53:say(A0_51, 69, 0)
    break
  else
  end
  if A3_54 == 3 then
    A2_53:_runCharaScheduler(354086912)
    A2_53:say(A0_51, 71, 0)
    break
  else
  end
  if A3_54 == 4 then
    A2_53:_runCharaScheduler(354082816)
    A2_53:say(A0_51, 70, 0)
    break
  else
  end
  A2_53:_runCharaScheduler(354086912)
  A2_53:say(A0_51, 71, 0)
  do break end
  A2_53:say(A0_51, 72, 0)
  A2_53:_runCharaScheduler(353976320)
  A2_53:say(A0_51, 73, 0)
  A2_53:say(A0_51, 74, 0)
  if A3_54 == 3 then
    A2_53:_runCharaScheduler(353968128)
    A2_53:say(A0_51, 76, 0)
  else
    A2_53:_runCharaScheduler(353964032)
    A2_53:say(A0_51, 75, 0)
  end
  A2_53:say(A0_51, 77, 0)
  A2_53:say(A0_51, 78, 0)
  A2_53:_runCharaScheduler(354082816)
  A2_53:say(A0_51, 97, 0)
  A0_51:_wait(1)
  A2_53:say(A0_51, 79, 0)
  if A3_54 == 3 then
    A2_53:_runCharaScheduler(353959936)
    A0_51:_wait(1)
    A2_53:say(A0_51, 82, 0)
    A2_53:say(A0_51, 83, 0)
  else
    A2_53:_runCharaScheduler(353959936)
    A0_51:_wait(1)
    A2_53:say(A0_51, 80, 0)
    A2_53:say(A0_51, 81, 0)
  end
  A2_53:say(A0_51, 84, 0)
  A2_53:say(A0_51, 85, 0)
  A2_53:_runCharaScheduler(353972224)
  A2_53:say(A0_51, 86, 0)
  A2_53:say(A0_51, 106, 0)
  A2_53:say(A0_51, 87, 0)
  A2_53:_runCharaScheduler(354086912)
  A0_51:_wait(2)
  A2_53:say(A0_51, 88, 0)
  A2_53:finishCliantTalkTurn()
end
function Com0l6.processEvent_elevator_nq1(A0_55, A1_56, A2_57)
  A0_55:startFadeOutCutSceneDefault(A1_56)
  A0_55:startNQCutScene("elv0l01a", 1, 0)
  A0_55:startFadeInCutSceneAfterWarp(A1_56)
  return
end
function Com0l6.processEvent_elevator_nq2(A0_58, A1_59, A2_60)
  A0_58:startFadeOutCutSceneDefault(A1_59)
  A0_58:startNQCutScene("elv0l02a", 1, 0)
  A0_58:startFadeInCutSceneAfterWarp(A1_59)
  return
end
