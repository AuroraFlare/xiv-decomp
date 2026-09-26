require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0g4", "ScenarioBaseClass")
function Com0g4.initText(A0_0)
  A0_0:_loadTextDataPermanently(6000, "com0g4")
end
function Com0g4.processEventStart(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(A2_3, 7, A1_2)
  L3_4 = A2_3.doSalute
  L3_4 = L3_4(A2_3, 2, 33)
  if L3_4 == 0 then
    A2_3:_runCharaScheduler(354062336)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 23, 0)
  A2_3:say(A0_1, 24, 0)
  A2_3:say(A0_1, 25, 0)
  A2_3:say(A0_1, 59, 0)
  if L3_4 ~= 0 then
    A2_3:_waitForCharaSchedulerFinished(L3_4)
  end
  A2_3:_runCharaScheduler(353972224)
  A2_3:say(A0_1, 26, 0)
  A2_3:say(A0_1, 27, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353976320)
    A2_3:say(A0_1, 29, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(353964032)
    A2_3:say(A0_1, 28, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Com0g4.processEventStartAfter(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = A2_7.startCliantTalkTurn
  L3_8(A2_7, 7, A1_6)
  L3_8 = A2_7.doSalute
  L3_8 = L3_8(A2_7, 2, 33)
  if L3_8 == 0 then
    A2_7:_runCharaScheduler(353959936)
  end
  A0_5:_wait(1)
  A2_7:say(A0_5, 30, 0)
  A2_7:say(A0_5, 31, 0)
  if L3_8 ~= 0 then
    A2_7:_waitForCharaSchedulerFinished(L3_8)
  end
  A2_7:_runCharaScheduler(353976320)
  A2_7:say(A0_5, 32, 0)
  A2_7:finishCliantTalkTurn()
  return
end
function Com0g4.processEventFulke(A0_9, A1_10, A2_11)
  local L3_12
  L3_12 = A2_11.startCliantTalkTurn
  L3_12(A2_11, 7, A1_10)
  L3_12 = A2_11.doSalute
  L3_12 = L3_12(A2_11, 2, 33)
  if L3_12 == 0 then
    A2_11:_runCharaScheduler(353976320)
  end
  A0_9:_wait(1)
  A2_11:say(A0_9, 33, 0)
  A2_11:say(A0_9, 34, 0)
  if L3_12 ~= 0 then
    A2_11:_waitForCharaSchedulerFinished(L3_12)
  end
  A1_10:_runCharaScheduler(354107392)
  A2_11:_runCharaScheduler(354111488)
  A0_9:_wait(2.5)
  A2_11:say(A0_9, 35, 0)
  A0_9:startFadeOut(A1_10, 1.5)
  A0_9:_wait(1.5)
  A0_9:startFadeIn(A1_10, 1.5)
  A2_11:_runCharaScheduler(353972224)
  A2_11:say(A0_9, 36, 0)
  A2_11:say(A0_9, 60, 0)
  A2_11:say(A0_9, 37, 0)
  A2_11:_runCharaScheduler(353959936)
  A2_11:say(A0_9, 38, 0)
  A2_11:say(A0_9, 39, 0)
  A2_11:finishCliantTalkTurn()
  return
end
function Com0g4.processEventFulkeFree(A0_13, A1_14, A2_15)
  local L3_16
  L3_16 = A2_15.startCliantTalkTurn
  L3_16(A2_15, 7, A1_14)
  L3_16 = A2_15.doSalute
  L3_16 = L3_16(A2_15, 2, 33)
  if L3_16 == 0 then
    A2_15:_runCharaScheduler(353959936)
  end
  A0_13:_wait(1)
  A2_15:say(A0_13, 40, 0)
  A2_15:say(A0_13, 41, 0)
  if L3_16 ~= 0 then
    A2_15:_waitForCharaSchedulerFinished(L3_16)
  end
  A2_15:finishCliantTalkTurn()
  return
end
function Com0g4.processEventRadulf(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 42, 0)
  A1_18:_runCharaScheduler(354107392)
  A2_19:_runCharaScheduler(354111488)
  A0_17:_wait(2.5)
  A2_19:say(A0_17, 43, 0)
  A0_17:startFadeOut(A1_18, 1.5)
  A0_17:_wait(1.5)
  A0_17:startFadeIn(A1_18, 1.5)
  A2_19:say(A0_17, 44, 0)
  A2_19:say(A0_17, 45, 0)
  A2_19:_runCharaScheduler(353959936)
  A2_19:say(A0_17, 46, 0)
  A2_19:say(A0_17, 61, 0)
  A2_19:say(A0_17, 47, 0)
  A2_19:say(A0_17, 48, 0)
  A2_19:_runCharaScheduler(353964032)
  A2_19:say(A0_17, 49, 0)
  A2_19:say(A0_17, 50, 0)
  A1_18:_runCharaScheduler(354111488)
  A2_19:_runCharaScheduler(354107392)
  A0_17:_wait(2.5)
  A2_19:say(A0_17, 51, 0)
  A2_19:finishCliantTalkTurn()
  return
end
function Com0g4.processEventRadulfFree(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:_runCharaScheduler(353959936)
  A2_22:say(A0_20, 58, 0)
  A2_22:finishCliantTalkTurn()
  return
end
function Com0g4.processEventClear(A0_23, A1_24, A2_25, A3_26, A4_27)
  local L5_28
  L5_28 = A2_25.startCliantTalkTurn
  L5_28(A2_25, 7, A1_24)
  L5_28 = A2_25.doSalute
  L5_28 = L5_28(A2_25, 2, 33)
  if L5_28 == 0 then
    A2_25:_runCharaScheduler(353959936)
  end
  A0_23:_wait(1)
  A2_25:say(A0_23, 52, 0)
  if L5_28 ~= 0 then
    A2_25:_waitForCharaSchedulerFinished(L5_28)
  end
  if A3_26 == 0 and A4_27 == 0 then
    A0_23:startFadeOutCutSceneDefault(A1_24)
    A0_23:startNQCutScene("com0g410", 1)
    A0_23:startFadeInCutSceneDefault(A1_24)
  else
    A2_25:say(A0_23, 53, 0)
    A2_25:say(A0_23, 54, 0)
    A2_25:say(A0_23, 55, 0)
    A2_25:say(A0_23, 56, 0)
  end
  A2_25:finishCliantTalkTurn()
  return
end
