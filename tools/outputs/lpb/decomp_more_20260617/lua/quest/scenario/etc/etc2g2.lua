require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc2g2", "ScenarioBaseClass")
function Etc2g2.initText(A0_0)
  A0_0:_loadTextDataPermanently(3475, "etc2g2")
end
function Etc2g2.processEventStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353968128)
    A2_3:say(A0_1, 6, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 5, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc2g2.processEventClear(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353968128)
  A2_6:say(A0_4, 8, 0)
  A2_6:say(A0_4, 9, 0)
  A0_4:startFadeOut(A1_5, 1.5)
  A0_4:_wait(1.5)
  A0_4:startFadeIn(A1_5, 1.5)
  A2_6:say(A0_4, 10, 0)
  A2_6:say(A0_4, 11, 0)
  A2_6:say(A0_4, 12, 0)
  A2_6:finishCliantTalkTurn()
  return
end
function Etc2g2.processEventFree(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(353959936)
  A2_9:say(A0_7, 7, 0)
  A2_9:finishCliantTalkTurn()
  return
end
