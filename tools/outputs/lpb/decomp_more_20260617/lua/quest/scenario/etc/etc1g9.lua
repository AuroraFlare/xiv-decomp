require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1g9", "ScenarioBaseClass")
function Etc1g9.initText(A0_0)
  A0_0:_loadTextDataPermanently(3455, "etc1g9")
end
function Etc1g9.processEventLonsyggStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(84062208)
    A2_3:say(A0_1, 9, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(84033536)
    A2_3:say(A0_1, 8, 0)
    A2_3:finishCliantTalkTurn()
    return
  end
end
function Etc1g9.processEvent005_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 10, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc1g9.processEvent010(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(353964032)
  A2_9:say(A0_7, 11, 0)
  A2_9:say(A0_7, 12, 0)
  A2_9:say(A0_7, 14, 0)
  A2_9:_runCharaScheduler(68378624)
  A2_9:say(A0_7, 13, 0)
  A2_9:finishCliantTalkTurn()
end
