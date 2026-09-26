require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Wld0l3", "ScenarioBaseClass")
function Wld0l3.initText(A0_0)
  A0_0:_loadTextDataPermanently(5283, "wld0l3")
end
function Wld0l3.processEventOffersStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(70799360)
    A2_3:say(A0_1, 5, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(354086912)
    A2_3:say(A0_1, 4, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Wld0l3.processEventClear(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 14, 0)
  A0_4:startFadeOut(A1_5, 1.5)
  A0_4:_wait(1)
  A0_4:_wait(0.5)
  A2_6:_runCharaScheduler(69193728)
  A0_4:startFadeIn(A1_5, 1.5)
  A0_4:_wait(0.5)
  A2_6:say(A0_4, 15, 0)
  A2_6:_runCharaScheduler(67809280)
  A2_6:say(A0_4, 16, 0)
  A2_6:_runCharaScheduler(354107392)
  A1_5:_runCharaScheduler(354111488)
  A2_6:say(A0_4, 17, 0)
  A2_6:finishCliantTalkTurn()
  return
end
function Wld0l3.processEventFree(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(353959936)
  A2_9:say(A0_7, 6, 0)
  A2_9:finishCliantTalkTurn()
  return
end
function Wld0l3.processlolojoEvent(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(353959936)
  A2_12:say(A0_10, 7, 0)
  A2_12:say(A0_10, 8, 0)
  A2_12:_runCharaScheduler(354172928)
  A2_12:say(A0_10, 9, 0)
  A2_12:say(A0_10, 10, 0)
  A2_12:_runCharaScheduler(353968128)
  A2_12:say(A0_10, 11, 0)
  A2_12:say(A0_10, 12, 0)
  A2_12:finishCliantTalkTurn()
  return
end
function Wld0l3.processlolojoEventFree(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(354172928)
  A2_15:say(A0_13, 13, 0)
  A2_15:finishCliantTalkTurn()
  return
end
