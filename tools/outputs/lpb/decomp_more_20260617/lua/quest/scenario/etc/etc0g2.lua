require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0g2", "ScenarioBaseClass")
function Etc0g2.initText(A0_0)
  A0_0:_loadTextDataPermanently(2765, "etc0g2")
end
function Etc0g2.processEventLefwyneStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:_runCharaScheduler(67727360)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  while true do
    if A2_3:ask(A0_1, 5, 4) == nil then
      break
    elseif A2_3:ask(A0_1, 5, 4) == 4 then
      A2_3:_runCharaScheduler(354041856)
      A2_3:say(A0_1, 18, 0)
      break
    elseif A2_3:ask(A0_1, 5, 4) == 1 then
      A2_3:say(A0_1, 10, 0)
      A2_3:say(A0_1, 11, 0)
      A2_3:say(A0_1, 12, 0)
    elseif A2_3:ask(A0_1, 5, 4) == 2 then
      A2_3:say(A0_1, 13, 0)
      A2_3:_runCharaScheduler(67809280)
      A2_3:say(A0_1, 14, 0)
    else
      A2_3:say(A0_1, 19, 0)
      if A0_1:showQuestInfomation() == 1 then
        A2_3:_runCharaScheduler(67731456)
        A2_3:say(A0_1, 21, 0)
        A2_3:say(A0_1, 22, 0)
        A2_3:say(A0_1, 23, 0)
        A2_3:say(A0_1, 24, 0)
        A2_3:_runCharaScheduler(68378624)
        A2_3:say(A0_1, 25, 0)
        A2_3:say(A0_1, 26, 0)
      else
        A2_3:_runCharaScheduler(354041856)
        A2_3:say(A0_1, 20, 0)
      end
      return (A0_1:showQuestInfomation())
    end
  end
  A2_3:finishCliantTalkTurn()
end
function Etc0g2.processEvent000_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 27, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc0g2.processEvent010(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(68419584)
  A2_9:say(A0_7, 28, 0)
  A2_9:say(A0_7, 29, 0)
  A2_9:say(A0_7, 30, 0)
  A2_9:say(A0_7, 31, 0)
  A2_9:_runCharaScheduler(67727360)
  A2_9:say(A0_7, 32, 0)
  A2_9:finishCliantTalkTurn()
end
