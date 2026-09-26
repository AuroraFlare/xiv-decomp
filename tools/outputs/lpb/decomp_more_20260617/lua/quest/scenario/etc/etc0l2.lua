require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0l2", "ScenarioBaseClass")
function Etc0l2.initText(A0_0)
  A0_0:_loadTextDataPermanently(2909, "etc0l2")
end
function Etc0l2.processEventAudaineStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  while true do
    if A2_3:ask(A0_1, 3, 4) == 1 then
      A2_3:say(A0_1, 8, 0)
      A2_3:say(A0_1, 9, 0)
      A2_3:say(A0_1, 10, 0)
    elseif A2_3:ask(A0_1, 3, 4) == 2 then
      A2_3:say(A0_1, 11, 0)
      A2_3:say(A0_1, 12, 0)
    else
      if A2_3:ask(A0_1, 3, 4) == 3 then
        A2_3:say(A0_1, 17, 0)
        A2_3:say(A0_1, 18, 0)
        A2_3:say(A0_1, 19, 0)
        if A0_1:showQuestInfomation() == 1 then
          A2_3:say(A0_1, 21, 0)
          A2_3:say(A0_1, 22, 0)
        else
          A2_3:say(A0_1, 20, 0)
        end
        A2_3:finishCliantTalkTurn()
        do return (A0_1:showQuestInfomation()) end
        break
      end
      A2_3:say(A0_1, 16, 0)
      A2_3:finishCliantTalkTurn()
      break
    end
  end
end
function Etc0l2.processEvent000(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 23, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc0l2.processEvent010(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(1, A1_8)
  A2_9:say(A0_7, 24, 0)
  A2_9:say(A0_7, 25, 0)
  A2_9:say(A0_7, 26, 0)
  A2_9:say(A0_7, 27, 0)
  A2_9:say(A0_7, 28, 0)
  A2_9:finishCliantTalkTurn()
end
