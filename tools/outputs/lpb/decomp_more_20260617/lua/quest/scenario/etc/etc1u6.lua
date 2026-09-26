require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1u6", "ScenarioBaseClass")
function Etc1u6.initText(A0_0)
  A0_0:_loadTextDataPermanently(3427, "etc1u6")
end
function Etc1u6.processEventMohtfrydStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0, 0, 0, 0, 0, A4_5)
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
function Etc1u6.processEventAfter(A0_6, A1_7, A2_8, A3_9, A4_10)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:say(A0_6, 19, 0)
  A2_8:say(A0_6, 20, 0)
  A2_8:say(A0_6, 22, 0)
  A2_8:say(A0_6, 23, 0)
  A2_8:say(A0_6, 24, 0)
  A2_8:say(A0_6, 25, 0)
  A2_8:finishCliantTalkTurn()
  return
end
function Etc1u6.processEventFree(A0_11, A1_12, A2_13, A3_14, A4_15)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:say(A0_11, 15, 0)
  A2_13:say(A0_11, 16, 0, 0, 0, 0, 0, A4_15)
  A2_13:finishCliantTalkTurn()
  return
end
