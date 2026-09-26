require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcl303", "ScenarioBaseClass")
function Gcl303.initText(A0_0)
  A0_0:_loadTextDataPermanently(7024, "gcl303")
end
function Gcl303.processEventStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A3_4 == 2 then
    A2_3:say(A0_1, 3, 0)
  else
    A2_3:say(A0_1, 2, 0)
  end
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 35, 0)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 9, 0)
  A2_3:say(A0_1, 10, 0)
  A2_3:say(A0_1, 11, 0)
  A2_3:say(A0_1, 13, 0)
  A2_3:say(A0_1, 14, 0)
  A2_3:say(A0_1, 15, 0)
  A2_3:say(A0_1, 17, 0)
  A2_3:say(A0_1, 34, 0, A3_4)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 19, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 18, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Gcl303.processEventStartAfter(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 20, 0)
  A2_7:say(A0_5, 21, 0)
  A2_7:finishCliantTalkTurn()
  return
end
function Gcl303.processEventQiqirn(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 23, 0)
  A2_10:finishCliantTalkTurn()
  return
end
function Gcl303.processEventClear(A0_11, A1_12, A2_13, A3_14)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:say(A0_11, 24, 0)
  A2_13:say(A0_11, 25, 0)
  if A3_14 == 0 then
    A2_13:say(A0_11, 26, 0)
  end
  A2_13:say(A0_11, 27, 0)
  A2_13:say(A0_11, 28, 0)
  A2_13:say(A0_11, 29, 0)
  A2_13:say(A0_11, 31, 0)
  A2_13:say(A0_11, 33, 0)
  A2_13:finishCliantTalkTurn()
  return
end
