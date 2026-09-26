require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0g3", "ScenarioBaseClass")
function Etc0g3.initText(A0_0)
  A0_0:_loadTextDataPermanently(2781, "etc0g3")
end
function Etc0g3.processEventManine00Start(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 3, 2) == 1 then
    return (A2_3:ask(A0_1, 3, 2))
  else
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
end
function Etc0g3.processEventManine01Start(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 7, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc0g3.processEventManine02Start(A0_7, A1_8, A2_9)
  A2_9:say(A0_7, 8, 0)
  A2_9:say(A0_7, 9, 0)
  A2_9:say(A0_7, 10, 0)
  A2_9:say(A0_7, 11, 0)
  if A0_7:showQuestInfomation() == 1 then
    A2_9:say(A0_7, 13, 0)
    A2_9:say(A0_7, 14, 0)
    A2_9:say(A0_7, 15, 0)
    A2_9:finishCliantTalkTurn()
    return (A0_7:showQuestInfomation())
  else
    A2_9:say(A0_7, 12, 0)
  end
  A2_9:finishCliantTalkTurn()
  return (A0_7:showQuestInfomation())
end
function Etc0g3.processEventManine2ndStart(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 16, 0)
  A2_12:say(A0_10, 17, 0)
  A2_12:finishCliantTalkTurn()
end
function Etc0g3.processEventOWYNEStart(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 18, 0)
  A2_15:say(A0_13, 19, 0)
  A2_15:say(A0_13, 20, 0)
  A2_15:say(A0_13, 21, 0)
  A2_15:say(A0_13, 22, 0)
  A2_15:say(A0_13, 23, 0)
  A2_15:say(A0_13, 24, 0)
  A2_15:finishCliantTalkTurn()
end
