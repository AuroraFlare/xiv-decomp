require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0u4", "ScenarioBaseClass")
function Etc0u4.initText(A0_0)
  A0_0:_loadTextDataPermanently(3085, "etc0u4")
end
function Etc0u4.processEventMomodiStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A3_4 == 1 then
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
  elseif A3_4 == 2 then
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
  elseif A3_4 == 3 then
    A2_3:say(A0_1, 1, 0)
    A2_3:say(A0_1, 2, 0)
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
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc0u4.processEvent000(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 12, 0)
  A2_7:say(A0_5, 13, 0)
  A2_7:finishCliantTalkTurn()
end
function Etc0u4.processEvent005_1(A0_8, A1_9, A2_10, A3_11)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 14, 0)
  A2_10:say(A0_8, 15, 0)
  A2_10:say(A0_8, 16, 0)
  A2_10:say(A0_8, 17, 0)
  A2_10:say(A0_8, 18, 0)
  A2_10:say(A0_8, 19, 0, A3_11)
  A2_10:_runCharaScheduler(68378624)
  A2_10:say(A0_8, 20, 0)
  A2_10:say(A0_8, 21, 0)
  A2_10:finishCliantTalkTurn()
end
function Etc0u4.processEvent005_2(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:say(A0_12, 14, 0)
  A2_14:say(A0_12, 15, 0)
  A2_14:say(A0_12, 16, 0)
  A2_14:say(A0_12, 17, 0)
  A2_14:say(A0_12, 18, 0)
  A2_14:_runCharaScheduler(68378624)
  A2_14:say(A0_12, 22, 0)
  A2_14:say(A0_12, 23, 0)
  A2_14:say(A0_12, 24, 0)
  A2_14:say(A0_12, 25, 0)
  A2_14:finishCliantTalkTurn()
end
function Etc0u4.processEvent010(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:say(A0_15, 40, 0)
  A2_17:say(A0_15, 41, 0)
  A2_17:say(A0_15, 42, 0)
  A2_17:say(A0_15, 43, 0)
  A2_17:say(A0_15, 44, 0)
  A2_17:finishCliantTalkTurn()
end
function Etc0u4.processEvent010_1(A0_18, A1_19, A2_20)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:say(A0_18, 26, 0)
  if A2_20:ask(A0_18, 27, 2) == 1 then
    A2_20:_runCharaScheduler(67727360)
    A2_20:say(A0_18, 30, 0)
    A2_20:say(A0_18, 31, 0)
    A2_20:finishCliantTalkTurn()
    return
  else
    A2_20:say(A0_18, 31, 0)
    A2_20:finishCliantTalkTurn()
    return
  end
end
function Etc0u4.processEvent010_2(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 33, 0)
  if A2_23:ask(A0_21, 34, 2) == 1 then
    A2_23:_runCharaScheduler(67727360)
    A2_23:say(A0_21, 37, 0)
    A2_23:say(A0_21, 38, 0)
    A2_23:finishCliantTalkTurn()
    return
  else
    A2_23:say(A0_21, 38, 0)
    A2_23:finishCliantTalkTurn()
    return
  end
end
function Etc0u4.processEvent015_1(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(2, A1_25)
  A2_26:say(A0_24, 45, 0)
  A2_26:say(A0_24, 46, 0)
  A2_26:say(A0_24, 47, 0)
  A2_26:finishCliantTalkTurn()
end
function Etc0u4.processEvent015(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:say(A0_27, 48, 0)
  A2_29:say(A0_27, 49, 0)
  A2_29:say(A0_27, 50, 0)
  A2_29:say(A0_27, 51, 0)
  A2_29:say(A0_27, 52, 0)
  A2_29:say(A0_27, 53, 0)
  A2_29:say(A0_27, 54, 0)
  A2_29:finishCliantTalkTurn()
end
