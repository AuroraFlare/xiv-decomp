require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcg103", "ScenarioBaseClass")
function Gcg103.initText(A0_0)
  A0_0:_loadTextDataPermanently(8036, "gcg103")
end
function Gcg103.processEventStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(2, 33) == 0 then
    A2_3:_runCharaScheduler(353959936)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 9, 0)
  else
    A2_3:say(A0_1, 8, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Gcg103.processEventSenna(A0_4, A1_5, A2_6, A3_7, A4_8)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(79503360)
  A2_6:say(A0_4, 11, 0)
  if A3_7 == 1 and A4_8 == 1 then
    A2_6:say(A0_4, 75, 0)
  elseif A3_7 == 1 and A4_8 == 0 then
    A2_6:say(A0_4, 12, 0)
  elseif A3_7 == 0 and A4_8 == 1 then
    A2_6:say(A0_4, 13, 0)
  else
    A2_6:say(A0_4, 14, 0)
  end
  A2_6:say(A0_4, 15, 0)
  A2_6:_runCharaScheduler(364675072)
  A2_6:say(A0_4, 16, 0)
  A2_6:say(A0_4, 17, 0)
  A2_6:_runCharaScheduler(364687360)
  A2_6:say(A0_4, 18, 0)
  A2_6:say(A0_4, 19, 0)
  A2_6:_runCharaScheduler(364675072)
  A2_6:say(A0_4, 20, 0)
  if A2_6:askExtendWidget(A0_4, 76, 2, 0, 1) == 1 then
    A2_6:say(A0_4, 21, 0)
    A2_6:_runCharaScheduler(79482880)
    A2_6:say(A0_4, 22, 0)
    A2_6:say(A0_4, 23, 0)
    A2_6:_runCharaScheduler(364687360)
    A2_6:say(A0_4, 24, 0)
  else
    A2_6:_runCharaScheduler(79503360)
    A2_6:say(A0_4, 25, 0)
    A2_6:say(A0_4, 26, 0)
  end
  A2_6:_runCharaScheduler(364675072)
  A2_6:say(A0_4, 27, 0)
  A2_6:say(A0_4, 28, 0)
  A2_6:_runCharaScheduler(364679168)
  A2_6:say(A0_4, 29, 0)
  A2_6:say(A0_4, 30, 0)
  A2_6:_runCharaScheduler(79503360)
  A2_6:say(A0_4, 31, 0)
  A2_6:finishCliantTalkTurn()
end
function Gcg103.processEventPesi(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(353964032)
  A2_11:say(A0_9, 34, 0)
  A2_11:say(A0_9, 35, 0)
  A2_11:finishCliantTalkTurn()
end
function Gcg103.processEventSwethryk(A0_12, A1_13, A2_14)
  if A2_14:doSalute(2, 45) == 0 then
    A2_14:_runCharaScheduler(353959936)
  end
  A0_12:_wait(1)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:say(A0_12, 32, 0)
  A2_14:say(A0_12, 79, 0)
  A2_14:say(A0_12, 33, 0)
  A2_14:finishCliantTalkTurn()
end
function Gcg103.processEventStartAfter(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:say(A0_15, 10, 0)
  A2_17:finishCliantTalkTurn()
end
function Gcg103.processEventNQ01(A0_18, A1_19, A2_20, A3_21)
  A0_18:startFadeOutCutSceneDefault(A1_19)
  A0_18:startNQCutScene("gc01g310", 1)
  if A3_21 == true then
    A0_18:startFadeInCutSceneDefault(A1_19)
  else
    A0_18:startFadeInCutSceneDefault(A1_19)
  end
end
function Gcg103.processEventNQ02(A0_22, A1_23, A2_24)
  A0_22:startFadeOutCutSceneDefault(A1_23)
  A0_22:startNQCutScene("gc01g320", 1)
  A0_22:startFadeInCutSceneDefault(A1_23)
end
