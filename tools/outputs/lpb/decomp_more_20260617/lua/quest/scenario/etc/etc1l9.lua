require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1l9", "ScenarioBaseClass")
function Etc1l9.initText(A0_0)
  A0_0:_loadTextDataPermanently(3423, "etc1l9")
end
function Etc1l9.processEventStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:_runCharaScheduler(354054144)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 18, 0)
  A2_3:say(A0_1, 6, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 9, 6)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 8, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc1l9.processEventClear(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(354054144)
  A2_6:say(A0_4, 12, 0)
  A2_6:say(A0_4, 13, 0)
  A2_6:say(A0_4, 14, 0)
  A2_6:say(A0_4, 15, 0)
  A2_6:_runCharaScheduler(68378624)
  A2_6:say(A0_4, 16, 0)
  A2_6:finishCliantTalkTurn()
  return
end
function Etc1l9.processEventFree(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(354054144)
  A2_9:say(A0_7, 10, 0)
  A2_9:say(A0_7, 11, 0)
  A2_9:finishCliantTalkTurn()
  return
end
function Etc1l9.shell(A0_10, A1_11, A2_12)
  A2_12:say(A0_10, 17, 0)
  return
end
