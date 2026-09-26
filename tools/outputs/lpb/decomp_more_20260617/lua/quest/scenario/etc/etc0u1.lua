require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0u1", "ScenarioBaseClass")
function Etc0u1.initText(A0_0)
  A0_0:_loadTextDataPermanently(3037, "etc0u1")
end
function Etc0u1.processEventMomodiStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A1_2:getInitialTown() == 3 then
    A2_3:say(A0_1, 1, 0)
  elseif A1_2:getInitialTown() == 2 then
    A2_3:say(A0_1, 2, 0)
    A2_3:say(A0_1, 19, 0)
  else
    A2_3:say(A0_1, 20, 0)
    A2_3:say(A0_1, 3, 0)
  end
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc0u1.processEvent000_Momodi(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 9, 0)
  A2_6:say(A0_4, 10, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc0u1.processEvent010(A0_7, A1_8, A2_9, A3_10, A4_11)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 11, 0)
  A2_9:say(A0_7, 12, 0)
  A2_9:say(A0_7, 13, 0)
  A2_9:say(A0_7, 14, 0)
  if A3_10 == 1 then
    A2_9:say(A0_7, 16, 0, A4_11)
  elseif A3_10 == 2 then
    A2_9:say(A0_7, 21, 0, A4_11)
  else
    A2_9:say(A0_7, 15, 0, A4_11)
    A2_9:say(A0_7, 22, 0, A4_11)
  end
  A2_9:say(A0_7, 17, 0)
  A2_9:say(A0_7, 18, 0)
  A2_9:finishCliantTalkTurn()
end
