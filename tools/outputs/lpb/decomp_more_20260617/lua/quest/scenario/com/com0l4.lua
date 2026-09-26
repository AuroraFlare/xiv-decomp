require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0l4", "ScenarioBaseClass")
function Com0l4.initText(A0_0)
  A0_0:_loadTextDataPermanently(6144, "com0l4")
end
function Com0l4.processEventGUINCUMStart(A0_1, A1_2, A2_3, A3_4)
  local L4_5
  L4_5 = A2_3.startCliantTalkTurn
  L4_5(A2_3, 2, A1_2)
  L4_5 = A2_3.doSalute
  L4_5 = L4_5(A2_3, 1, 33)
  if L4_5 == 0 then
    A2_3:_runCharaScheduler(354041856)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 23, 0)
  A2_3:say(A0_1, 24, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 25, 0)
  A2_3:say(A0_1, 58, 0)
  A2_3:say(A0_1, 59, 0)
  A2_3:say(A0_1, 26, 0)
  A2_3:say(A0_1, 27, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 29, 0)
    A2_3:say(A0_1, 30, 0)
  else
    A2_3:_runCharaScheduler(354099200)
    A2_3:say(A0_1, 28, 0)
  end
  if L4_5 ~= 0 then
    A2_3:_waitForCharaSchedulerFinished(L4_5)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Com0l4.processEvent_000_1(A0_6, A1_7, A2_8, A3_9)
  local L4_10
  L4_10 = A2_8.startCliantTalkTurn
  L4_10(A2_8, 2, A1_7)
  L4_10 = A2_8.doSalute
  L4_10 = L4_10(A2_8, 1, 15)
  if L4_10 == 0 then
    A2_8:_runCharaScheduler(354041856)
  end
  A0_6:_wait(1)
  A2_8:say(A0_6, 31, 0)
  A2_8:say(A0_6, 60, 0)
  A2_8:say(A0_6, 32, 0)
  if L4_10 ~= 0 then
    A2_8:_waitForCharaSchedulerFinished(L4_10)
  end
  A2_8:finishCliantTalkTurn()
end
function Com0l4.processEvent_010(A0_11, A1_12, A2_13)
  local L3_14
  L3_14 = A2_13.startCliantTalkTurn
  L3_14(A2_13, 2, A1_12)
  L3_14 = A2_13.doSalute
  L3_14 = L3_14(A2_13, 1, 15)
  if L3_14 == 0 then
    A2_13:_runCharaScheduler(354041856)
  end
  A0_11:_wait(1)
  A2_13:say(A0_11, 33, 0)
  if L3_14 ~= 0 then
    A2_13:_waitForCharaSchedulerFinished(L3_14)
  end
  A2_13:say(A0_11, 34, 0)
  A2_13:_runCharaScheduler(354123776)
  A0_11:_wait(2)
  A2_13:say(A0_11, 35, 0)
  A0_11:startFadeOut(A1_12, 1)
  A2_13:startCliantTalkTurn(1, A1_12)
  A0_11:_wait(2)
  A0_11:startFadeIn(A1_12, 1)
  A2_13:_runCharaScheduler(353959936)
  A2_13:say(A0_11, 36, 0)
  A2_13:say(A0_11, 37, 0)
  A2_13:say(A0_11, 38, 0)
  A2_13:say(A0_11, 63, 0)
  A2_13:finishCliantTalkTurn()
end
function Com0l4.processEvent_010_1(A0_15, A1_16, A2_17, A3_18)
  local L4_19
  L4_19 = A2_17.startCliantTalkTurn
  L4_19(A2_17, 2, A1_16)
  L4_19 = A2_17.doSalute
  L4_19 = L4_19(A2_17, 1, 15)
  if L4_19 == 0 then
    A2_17:_runCharaScheduler(354041856)
  end
  A0_15:_wait(1)
  A2_17:say(A0_15, 39, 0)
  A2_17:say(A0_15, 40, 0)
  A2_17:say(A0_15, 64, 0)
  if L4_19 ~= 0 then
    A2_17:_waitForCharaSchedulerFinished(L4_19)
  end
  A2_17:finishCliantTalkTurn()
end
function Com0l4.processEvent_015(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 41, 0)
  A2_22:_runCharaScheduler(354115584)
  A2_22:say(A0_20, 42, 0)
  A0_20:startFadeOut(A1_21, 1)
  A2_22:startCliantTalkTurn(1, A1_21)
  A2_22:_runCharaScheduler(354082816)
  A0_20:_wait(1)
  A0_20:startFadeIn(A1_21, 1)
  A2_22:say(A0_20, 43, 0)
  A2_22:say(A0_20, 62, 0)
  A0_20:startFadeOut(A1_21, 1)
  A2_22:finishCliantTalkTurn()
  A0_20:_wait(1)
  A0_20:startFadeIn(A1_21, 1)
  return
end
function Com0l4.processEventNymiene(A0_23, A1_24, A2_25, A3_26)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:_runCharaScheduler(353980416)
  if A3_26 == 1 then
    A2_25:say(A0_23, 44, 0)
  else
    A2_25:say(A0_23, 45, 0)
  end
  A2_25:say(A0_23, 46, 0)
  A2_25:say(A0_23, 47, 0)
  A2_25:finishCliantTalkTurn()
  return
end
function Com0l4.processEventNymiene_01(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:_runCharaScheduler(353980416)
  A2_29:say(A0_27, 57, 0)
  A2_29:finishCliantTalkTurn()
  return
end
function Com0l4.processEventAergfloh(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:_runCharaScheduler(353980416)
  A2_32:say(A0_30, 48, 0)
  A2_32:say(A0_30, 49, 0)
  A2_32:finishCliantTalkTurn()
  return
end
function Com0l4.processEventAergfloh_01(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:_runCharaScheduler(353980416)
  A2_35:say(A0_33, 50, 0)
  A2_35:finishCliantTalkTurn()
  return
end
function Com0l4.processEvent_020(A0_36, A1_37, A2_38, A3_39)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:_runCharaScheduler(354123776)
  A2_38:say(A0_36, 51, 0)
  if A3_39 == 1 then
    A2_38:say(A0_36, 52, 0)
    A2_38:say(A0_36, 53, 0)
    A2_38:say(A0_36, 54, 0)
    A2_38:say(A0_36, 55, 0)
    A2_38:finishCliantTalkTurn()
    return
  else
    A0_36:startFadeOutCutSceneDefault(A1_37)
    A0_36:startNQCutScene("com0l410", 1)
    A0_36:startFadeInCutSceneDefault(A1_37)
  end
  A2_38:finishCliantTalkTurn()
  return
end
