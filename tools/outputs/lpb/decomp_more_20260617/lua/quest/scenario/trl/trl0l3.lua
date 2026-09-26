require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Trl0l3", "ScenarioBaseClass")
function Trl0l3.initText(A0_0)
  A0_0:_loadTextDataPermanently(3293, "trl0l3")
end
function Trl0l3.processSnpcReselectEvent001(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(69271552)
  A2_3:_wait(1)
  A2_3:say(A0_1, 1, 0)
  A2_3:lookAtPosition(30, -20, 0, 0.5)
  A2_3:_wait(1.5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
end
function Trl0l3.processSnpcReselectEvent002(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 12, 0)
  A2_6:finishCliantTalkTurn()
end
function Trl0l3.processSnpcReName(A0_7, A1_8, A2_9)
  local L3_10
  L3_10 = A2_9.startCliantTalkTurn
  L3_10(A2_9, 2, A1_8)
  L3_10 = A2_9.say
  L3_10(A2_9, A0_7, 11, 0)
  L3_10 = 1070005
  return (A0_7:inputSnpcName(A1_8, A2_9, L3_10))
end
