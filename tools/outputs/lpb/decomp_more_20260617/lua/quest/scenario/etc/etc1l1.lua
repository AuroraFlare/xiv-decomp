require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1l1", "ScenarioBaseClass")
function Etc1l1.initText(A0_0)
  A0_0:_loadTextDataPermanently(3385, "etc1l1")
end
function Etc1l1.processEventHihineStart(A0_1, A1_2, A2_3, A3_4)
  local L4_5, L5_6, L6_7
  L4_5 = 0
  L5_6 = 6
  L6_7 = 0
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 16, 0, L6_7, 0, 0, 0, A3_4)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 17, 0)
  else
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc1l1.processEvent005_2(A0_8, A1_9, A2_10, A3_11)
  local L4_12, L5_13, L6_14
  L4_12 = 0
  L5_13 = 6
  L6_14 = 0
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 9, 0)
  A2_10:say(A0_8, 19, 0, L6_14, 0, 0, 0, A3_11)
  A2_10:finishCliantTalkTurn()
end
function Etc1l1.processEvent010(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:say(A0_15, 12, 0)
  A2_17:say(A0_15, 13, 0)
  A2_17:say(A0_15, 14, 0)
  A2_17:say(A0_15, 15, 0)
  A2_17:say(A0_15, 20, 0)
  A2_17:finishCliantTalkTurn()
end
