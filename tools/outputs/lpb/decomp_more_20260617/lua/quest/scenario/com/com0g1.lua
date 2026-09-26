require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0g1", "ScenarioBaseClass")
function Com0g1.initText(A0_0)
  A0_0:_loadTextDataPermanently(5952, "com0g1")
end
function Com0g1.processEventStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354062336)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 52, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 53, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 54, 0)
  A2_3:say(A0_1, 8, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 10, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 9, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Com0g1.processEventStartAfter(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353959936)
  A2_6:say(A0_4, 49, 0)
  A2_6:finishCliantTalkTurn()
  return
end
function Com0g1.processEventAilithShiren(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(67805184)
  A2_9:say(A0_7, 11, 0)
  A2_9:say(A0_7, 55, 0)
  A2_9:say(A0_7, 12, 0)
  A2_9:say(A0_7, 13, 0)
  A2_9:_runCharaScheduler(354041856)
  A2_9:say(A0_7, 14, 0)
  A2_9:say(A0_7, 15, 0)
  A2_9:say(A0_7, 16, 0)
  A2_9:_runCharaScheduler(353959936)
  A2_9:say(A0_7, 17, 0)
  A2_9:say(A0_7, 57, 0)
  A2_9:say(A0_7, 18, 0)
  A2_9:finishCliantTalkTurn()
  return
end
function Com0g1.processEventAilithShirenFree(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(353964032)
  A2_12:say(A0_10, 19, 0)
  A2_12:say(A0_10, 20, 0)
  A2_12:say(A0_10, 56, 0)
  A2_12:finishCliantTalkTurn()
  return
end
function Com0g1.processEventUrianger(A0_13, A1_14, A2_15, A3_16)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("COM0G105", 2)
  if A3_16 == true then
    A0_13:startFadeInCutSceneDefault(A1_14)
  else
    A0_13:startFadeInCutSceneAfterWarp(A1_14)
  end
  return
end
function Com0g1.processEventUriangerMore(A0_17, A1_18, A2_19, A3_20)
  A0_17:startFadeOutCutSceneDefault(A1_18)
  A0_17:startNQCutScene("COM0G110", 1, 0, A3_20)
  A0_17:startFadeInCutSceneAfterWarp(A1_18)
  return
end
function Com0g1.processEventAilith(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:_runCharaScheduler(353959936)
  A2_23:say(A0_21, 41, 0)
  A0_21:startFadeOut(A1_22, 1.5)
  A0_21:_wait(1.5)
  A0_21:startFadeIn(A1_22, 1.5)
  A2_23:_runCharaScheduler(354086912)
  A2_23:say(A0_21, 42, 0)
  A2_23:say(A0_21, 43, 0)
  A2_23:say(A0_21, 44, 0)
  A2_23:say(A0_21, 58, 0)
  A1_22:_runCharaScheduler(354111488)
  A2_23:_runCharaScheduler(354107392)
  A0_21:_wait(2.5)
  A2_23:say(A0_21, 45, 0)
  A2_23:finishCliantTalkTurn()
  return
end
function Com0g1.processEventAilithFree(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(2, A1_25)
  A2_26:_runCharaScheduler(67727360)
  A2_26:say(A0_24, 50, 0)
  A2_26:finishCliantTalkTurn()
  return
end
function Com0g1.processEventClear(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:_runCharaScheduler(353964032)
  A2_29:say(A0_27, 46, 0)
  A0_27:startFadeOut(A1_28, 1.5)
  A0_27:_wait(1.5)
  A0_27:startFadeIn(A1_28, 1.5)
  A2_29:say(A0_27, 47, 0)
  A2_29:say(A0_27, 48, 0)
  A2_29:finishCliantTalkTurn()
  return
end
