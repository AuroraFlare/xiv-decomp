require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1l0", "ScenarioBaseClass")
function Etc1l0.initText(A0_0)
  A0_0:_loadTextDataPermanently(3369, "etc1l0")
end
function Etc1l0.processEventHaldberkStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(0, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 19, 0, 0, 0, 0, 0, A3_4)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc1l0.processEvent000(A0_5, A1_6, A2_7, A3_8, A4_9)
  A2_7:startCliantTalkTurn(1, A1_6)
  A2_7:_runCharaScheduler(353959936)
  A2_7:say(A0_5, 9, 0)
  if A3_8 == 1 then
    A2_7:say(A0_5, 10, 0)
  else
    A2_7:say(A0_5, 11, 0, 0, 0, 0, 0, A4_9)
  end
  A2_7:finishCliantTalkTurn()
end
function Etc1l0.processEvent010(A0_10, A1_11, A2_12, A3_13)
  A2_12:startCliantTalkTurn(1, A1_11)
  A2_12:_runCharaScheduler(353959936)
  A2_12:say(A0_10, 12, 0, A3_13)
  A2_12:say(A0_10, 13, 0)
  A2_12:_runCharaScheduler(354107392)
  A2_12:say(A0_10, 14, 0)
  A2_12:finishCliantTalkTurn()
end
function Etc1l0.processEvent020(A0_14, A1_15, A2_16, A3_17)
end
