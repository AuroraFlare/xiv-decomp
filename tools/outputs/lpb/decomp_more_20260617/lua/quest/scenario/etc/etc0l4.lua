require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0l4", "ScenarioBaseClass")
function Etc0l4.initText(A0_0)
  A0_0:_loadTextDataPermanently(2941, "etc0l4")
end
function Etc0l4.processEventBaderonStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A1_2:getInitialTown() == 1 then
    A2_3:say(A0_1, 1, 0)
    A2_3:say(A0_1, 2, 0)
  elseif A1_2:getInitialTown() == 2 then
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
  elseif A1_2:getInitialTown() == 3 then
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 8, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 10, 0)
    A2_3:say(A0_1, 11, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc0l4.processEventBaderonStart01(A0_4, A1_5, A2_6, A3_7)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 12, 0)
  A2_6:say(A0_4, 13, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc0l4.processEvent005(A0_8, A1_9, A2_10, A3_11)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 14, 0)
  A2_10:say(A0_8, 15, 0)
  A2_10:say(A0_8, 16, 0)
  A2_10:say(A0_8, 17, 0)
  A2_10:say(A0_8, 18, 0, A3_11)
  A2_10:say(A0_8, 19, 0)
  A2_10:say(A0_8, 20, 0)
  A2_10:say(A0_8, 21, 0)
  A2_10:finishCliantTalkTurn()
end
function Etc0l4.processEvent005_1(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:say(A0_12, 14, 0)
  A2_14:say(A0_12, 15, 0)
  A2_14:say(A0_12, 16, 0)
  A2_14:say(A0_12, 17, 0)
  A2_14:say(A0_12, 22, 0)
  A2_14:say(A0_12, 23, 0)
  A2_14:say(A0_12, 24, 0)
  A2_14:say(A0_12, 25, 0)
  A2_14:finishCliantTalkTurn()
end
function Etc0l4.processEvent005_2(A0_15, A1_16, A2_17)
  A2_17:say(A0_15, 38, 0)
  A2_17:say(A0_15, 39, 0)
  A2_17:say(A0_15, 40, 0)
  A2_17:say(A0_15, 41, 0)
  A2_17:say(A0_15, 42, 0)
  A2_17:finishCliantTalkTurn()
end
function Etc0l4.processEvent005_3(A0_18, A1_19, A2_20)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:say(A0_18, 26, 0)
  if A2_20:ask(A0_18, 27, 2) == 1 then
    A2_20:say(A0_18, 30, 0)
    return
  else
    A2_20:say(A0_18, 31, 0)
  end
  A2_20:finishCliantTalkTurn()
end
function Etc0l4.processEvent005_4(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 32, 0)
  if A2_23:ask(A0_21, 33, 2) == 1 then
    A2_23:say(A0_21, 36, 0)
    A2_23:finishCliantTalkTurn()
    return
  else
    A2_23:say(A0_21, 37, 0)
  end
  A2_23:finishCliantTalkTurn()
end
function Etc0l4.processEvent005_5(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(2, A1_25)
  A2_26:say(A0_24, 43, 0)
  A2_26:say(A0_24, 44, 0)
  A2_26:finishCliantTalkTurn()
end
function Etc0l4.processEvent010(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(1, A1_28)
  A2_29:say(A0_27, 45, 0)
  A2_29:say(A0_27, 46, 0)
  A2_29:say(A0_27, 47, 0)
  A2_29:say(A0_27, 48, 0)
  A2_29:say(A0_27, 49, 0)
  A2_29:finishCliantTalkTurn()
end
