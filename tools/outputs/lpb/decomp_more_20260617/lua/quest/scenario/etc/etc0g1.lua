require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0g1", "ScenarioBaseClass")
function Etc0g1.initText(A0_0)
  A0_0:_loadTextDataPermanently(2749, "etc0g1")
end
function Etc0g1.processEventMiounneStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A1_2:getInitialTown() == 1 then
    A2_3:say(A0_1, 2, 0)
    A2_3:say(A0_1, 3, 0)
  elseif A1_2:getInitialTown() == 2 then
    A2_3:say(A0_1, 1, 0)
  else
    A2_3:say(A0_1, 21, 0)
    A2_3:say(A0_1, 22, 0)
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
function Etc0g1.processEvent010(A0_4, A1_5, A2_6, A3_7)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 11, 0)
  A2_6:say(A0_4, 12, 0)
  A2_6:say(A0_4, 13, 0)
  A2_6:say(A0_4, 14, 0)
  if A1_5:getMainSkillCategory() == 1 or A1_5:getMainSkillCategory() == 21 then
    if A3_7 == 6 then
      A2_6:say(A0_4, 23, 0)
      A2_6:say(A0_4, 24, 0)
    elseif A3_7 == 7 then
      A2_6:say(A0_4, 25, 0)
      A2_6:say(A0_4, 26, 0)
    else
      A2_6:say(A0_4, 17, 0, A3_7)
      A2_6:say(A0_4, 18, 0, A3_7)
    end
  else
    A2_6:say(A0_4, 15, 0, A3_7)
    A2_6:say(A0_4, 16, 0)
  end
  A2_6:say(A0_4, 19, 0)
  A2_6:say(A0_4, 20, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc0g1.processEvent000_2(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 9, 0)
  A2_10:say(A0_8, 10, 0)
  A2_10:finishCliantTalkTurn()
end
