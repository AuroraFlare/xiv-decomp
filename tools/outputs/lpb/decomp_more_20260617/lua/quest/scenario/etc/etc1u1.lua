require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1u1", "ScenarioBaseClass")
function Etc1u1.initText(A0_0)
  A0_0:_loadTextDataPermanently(3373, "etc1u1")
end
function Etc1u1.processEventKukusiStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354082816)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 15, 0, 0, 0, 0, 0, A4_5)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 4, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc1u1.processEvent000_2(A0_6, A1_7, A2_8, A3_9)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(353959936)
  A2_8:say(A0_6, 11, 0)
  A2_8:say(A0_6, 12, 0)
  A2_8:say(A0_6, 13, 0)
  if A3_9 == 1 then
  else
    A2_8:say(A0_6, 14, 0)
  end
  A2_8:finishCliantTalkTurn()
  return
end
function Etc1u1.processEvent000_3(A0_10, A1_11, A2_12, A3_13, A4_14)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(354082816)
  A2_12:say(A0_10, 18, 0)
  A2_12:say(A0_10, 20, 0, 0, 0, 0, 0, A4_14)
  A2_12:say(A0_10, 19, 0)
  A2_12:finishCliantTalkTurn()
  return
end
