require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc0g4", "ScenarioBaseClass")
function Etc0g4.initText(A0_0)
  A0_0:_loadTextDataPermanently(2797, "etc0g4")
end
function Etc0g4.processEventMiounneStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A1_2:getInitialTown() == 1 then
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
  elseif A1_2:getInitialTown() == 2 then
    A2_3:say(A0_1, 1, 0)
    A2_3:say(A0_1, 2, 0)
  else
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 9, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 11, 0)
    A2_3:say(A0_1, 12, 0)
    A2_3:say(A0_1, 13, 0)
  else
    A2_3:say(A0_1, 10, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc0g4.processEvent000_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 14, 0)
  A2_6:say(A0_4, 15, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc0g4.processEvent010_A(A0_7, A1_8, A2_9, A3_10)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(354062336)
  A2_9:say(A0_7, 16, 0)
  A2_9:_runCharaScheduler(354054144)
  A2_9:say(A0_7, 17, 0)
  A2_9:say(A0_7, 18, 0)
  A0_7:startFadeOut(A1_8, 1)
  A0_7:startFadeIn(A1_8, 1)
  A2_9:_runCharaScheduler(354082816)
  A2_9:say(A0_7, 19, 0)
  A2_9:say(A0_7, 20, 0, A3_10)
  A2_9:_runCharaScheduler(68378624)
  A2_9:say(A0_7, 21, 0)
  A2_9:say(A0_7, 22, 0)
  A2_9:say(A0_7, 23, 0)
  return A2_9:finishCliantTalkTurn()
end
function Etc0g4.processEvent010_B(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(354062336)
  A2_13:say(A0_11, 16, 0)
  A2_13:_runCharaScheduler(354054144)
  A2_13:say(A0_11, 17, 0)
  A2_13:say(A0_11, 18, 0)
  A0_11:startFadeOut(A1_12, 1)
  A0_11:startFadeIn(A1_12, 1)
  A2_13:say(A0_11, 18, 0)
  A2_13:say(A0_11, 24, 0)
  A2_13:_runCharaScheduler(354086912)
  A2_13:say(A0_11, 25, 0)
  A2_13:_runCharaScheduler(68378624)
  A2_13:say(A0_11, 26, 0)
  A2_13:say(A0_11, 27, 0)
  A2_13:say(A0_11, 28, 0)
  A2_13:_runCharaScheduler(83898368)
  A2_13:say(A0_11, 29, 0)
  A2_13:finishCliantTalkTurn()
end
function Etc0g4.processEvent10_2_A_1(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:say(A0_14, 30, 0)
  if A2_16:ask(A0_14, 31, 2) == 1 then
    A2_16:say(A0_14, 34, 0)
  else
    A2_16:say(A0_14, 35, 0)
  end
  A2_16:finishCliantTalkTurn()
end
function Etc0g4.processEvent10_2_A_2(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 36, 0)
  if A2_19:ask(A0_17, 31, 2) == 1 then
    A2_19:say(A0_17, 40, 0)
  else
    A2_19:say(A0_17, 41, 0)
  end
  A2_19:finishCliantTalkTurn()
end
function Etc0g4.processEvent10_2_B_1(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 42, 0)
  if A2_22:ask(A0_20, 31, 2) == 1 then
    A2_22:say(A0_20, 46, 0)
  else
    A2_22:say(A0_20, 47, 0)
  end
  A2_22:finishCliantTalkTurn()
end
function Etc0g4.processEvent10_2_B_2(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 48, 0)
  if A2_25:ask(A0_23, 31, 2) == 1 then
    A2_25:say(A0_23, 52, 0)
  else
    A2_25:say(A0_23, 53, 0)
  end
  A2_25:finishCliantTalkTurn()
end
function Etc0g4.processEvent30(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 54, 0)
  A2_28:_runCharaScheduler(68419584)
  A2_28:say(A0_26, 55, 0)
  A2_28:_runCharaScheduler(354000896)
  A2_28:say(A0_26, 56, 0)
  A2_28:say(A0_26, 57, 0)
  A2_28:_runCharaScheduler(69173248)
  A2_28:say(A0_26, 58, 0)
  A0_26:startFadeOut(A1_27, 1)
  A0_26:startFadeIn(A1_27, 1)
  A2_28:say(A0_26, 59, 0)
  A2_28:_runCharaScheduler(354086912)
  A2_28:say(A0_26, 60, 0)
  A2_28:say(A0_26, 61, 0)
  A2_28:_runCharaScheduler(68390912)
  A2_28:say(A0_26, 62, 0)
  A2_28:say(A0_26, 63, 0)
  A2_28:_runCharaScheduler(67727360)
  A2_28:say(A0_26, 64, 0)
  A2_28:finishCliantTalkTurn()
end
function Etc0g4.processEvent30_2(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 65, 0)
  A2_31:_runCharaScheduler(354086912)
  A2_31:say(A0_29, 66, 0)
  A2_31:say(A0_29, 67, 0)
  A2_31:finishCliantTalkTurn()
end
function Etc0g4.processEvent40(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 68, 0)
  A2_34:say(A0_32, 69, 0)
  A2_34:say(A0_32, 70, 0)
  A2_34:say(A0_32, 71, 0)
  A2_34:say(A0_32, 72, 0)
  A2_34:say(A0_32, 73, 0)
  A2_34:say(A0_32, 74, 0)
  A2_34:finishCliantTalkTurn()
end
