require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0u3", "ScenarioBaseClass")
function Etc0u3.initText(A0_0)
  A0_0:_loadTextDataPermanently(3069, "etc0u3")
end
function Etc0u3.processEventLudovraintStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 3, 2) == 1 then
    if A3_4 == true then
      A2_3:say(A0_1, 8, 0)
      A2_3:say(A0_1, 9, 0)
      A2_3:say(A0_1, 10, 0)
      A2_3:say(A0_1, 11, 0)
      A2_3:say(A0_1, 12, 0)
    else
      A2_3:say(A0_1, 7, 0)
    end
  else
    A2_3:say(A0_1, 6, 0)
    A2_3:finishCliantTalkTurn()
    return (A2_3:ask(A0_1, 3, 2))
  end
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 14, 0)
    A2_3:say(A0_1, 15, 0)
    A2_3:say(A0_1, 16, 0)
  else
    A2_3:say(A0_1, 13, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc0u3.processEvent000Ludovraint(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 17, 0)
  A2_7:say(A0_5, 18, 0)
  A2_7:finishCliantTalkTurn()
end
function Etc0u3.processEvent010(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 19, 0)
  A2_10:say(A0_8, 20, 0)
  A2_10:say(A0_8, 21, 0)
  A2_10:say(A0_8, 22, 0)
  A2_10:say(A0_8, 23, 0)
  A2_10:say(A0_8, 24, 0)
  A2_10:say(A0_8, 25, 0)
  A2_10:say(A0_8, 26, 0)
  A2_10:say(A0_8, 27, 0)
  A2_10:say(A0_8, 28, 0)
  A2_10:say(A0_8, 29, 0)
  A2_10:finishCliantTalkTurn()
end
