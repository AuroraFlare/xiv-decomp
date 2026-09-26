require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1l6", "ScenarioBaseClass")
function Etc1l6.initText(A0_0)
  A0_0:_loadTextDataPermanently(3407, "etc1l6")
end
function Etc1l6.processEventNanapiriStart(A0_1, A1_2, A2_3, A3_4)
  local L4_5, L5_6, L6_7
  L4_5 = 1
  L5_6 = 6
  L6_7 = 5
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0, 0, 0, 0, 0, A3_4)
  A2_3:say(A0_1, 20, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 9, 0, L4_5, 0, 0, 0, A3_4)
  else
    A2_3:say(A0_1, 7, 0)
    A2_3:finishCliantTalkTurn()
    return
  end
  A2_3:say(A0_1, 10, 0)
  A2_3:say(A0_1, 11, 0)
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc1l6.processEvent005_2(A0_8, A1_9, A2_10, A3_11)
  local L4_12, L5_13, L6_14
  L4_12 = 1
  L5_13 = 6
  L6_14 = 5
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 14, 0, L4_12, 0, 0, 0, A3_11)
  A2_10:say(A0_8, 15, 0)
  A2_10:finishCliantTalkTurn()
end
function Etc1l6.processEvent010(A0_15, A1_16, A2_17)
  A0_15:startFadeOut(A1_16, 1)
  A2_17:startCliantTalkTurn(1, A1_16)
  A0_15:_wait(1)
  A0_15:startFadeIn(A1_16, 1)
  A2_17:say(A0_15, 17, 0)
  A2_17:say(A0_15, 18, 0)
  A2_17:say(A0_15, 19, 0)
  A0_15:startFadeOut(A1_16, 1)
  A2_17:finishCliantTalkTurn()
  A0_15:_wait(1)
  A0_15:startFadeIn(A1_16, 1)
end
