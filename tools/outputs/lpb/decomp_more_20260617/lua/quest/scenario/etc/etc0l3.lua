require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0l3", "ScenarioBaseClass")
function Etc0l3.initText(A0_0)
  A0_0:_loadTextDataPermanently(2925, "etc0l3")
end
function Etc0l3.processEventDidiwaiStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 3, 2) == 1 then
    A2_3:say(A0_1, 8, 0)
    A2_3:say(A0_1, 9, 0)
    A2_3:say(A0_1, 10, 0)
    A2_3:say(A0_1, 11, 0)
    A2_3:say(A0_1, 12, 0)
    A2_3:say(A0_1, 13, 0)
    A2_3:say(A0_1, 14, 0)
    A2_3:say(A0_1, 15, 0)
    A2_3:say(A0_1, 16, 0)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:say(A0_1, 18, 0)
      A2_3:say(A0_1, 19, 0)
    else
      A2_3:say(A0_1, 17, 0)
    end
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 6, 0)
    A2_3:finishCliantTalkTurn()
  end
end
function Etc0l3.processEventDidiwaiStart_no(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 1, 0)
  A2_6:say(A0_4, 2, 0)
  if A2_6:ask(A0_4, 3, 2) == 1 then
    A2_6:say(A0_4, 7, 0)
  else
    A2_6:say(A0_4, 6, 0)
  end
  A2_6:finishCliantTalkTurn()
end
function Etc0l3.processEvent000(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 20, 0)
  A2_9:say(A0_7, 21, 0)
  A2_9:finishCliantTalkTurn()
end
function Etc0l3.processEvent010(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 22, 0)
  A2_12:say(A0_10, 23, 0)
  A0_10:startFadeOut(A1_11, 1)
  A0_10:_wait(1)
  A0_10:startFadeIn(A1_11, 1)
  A2_12:say(A0_10, 24, 0)
  A2_12:say(A0_10, 25, 0)
  A2_12:say(A0_10, 26, 0)
  A2_12:say(A0_10, 27, 0)
  A2_12:say(A0_10, 28, 0)
  A2_12:say(A0_10, 29, 0)
  A2_12:say(A0_10, 30, 0)
  A2_12:finishCliantTalkTurn()
end
