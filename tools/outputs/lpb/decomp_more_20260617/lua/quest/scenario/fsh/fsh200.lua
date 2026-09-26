require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Fsh200", "ScenarioBaseClass")
function Fsh200.initText(A0_0)
  A0_0:_loadTextDataPermanently(131, "fsh200")
end
function Fsh200.processEventNnmulikaStart(A0_1, A1_2, A2_3)
  local L3_4, L4_5
  L4_5 = A2_3
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(L4_5, 1, A1_2)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 1, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 59, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 2, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 60, 0)
  L4_5 = A2_3
  L3_4 = A2_3.ask
  L3_4 = L3_4(L4_5, A0_1, 3, 2)
  L4_5 = nil
  if L3_4 == 1 then
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 8, 0)
    A2_3:say(A0_1, 11, 0)
    A2_3:say(A0_1, 61, 0)
    L4_5 = A0_1:showQuestInfomation()
    if L4_5 == 1 then
      A2_3:say(A0_1, 16, 0)
    else
      A2_3:say(A0_1, 15, 0)
    end
  else
    A2_3:say(A0_1, 15, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L4_5
end
function Fsh200.processEvent010(A0_6, A1_7, A2_8)
  A0_6:startFadeOutCutSceneDefault(A1_7)
  A0_6:startNQCutScene("fsh20010", 1)
  A0_6:startFadeInCutSceneDefault(A1_7)
end
function Fsh200.processEvent020(A0_9, A1_10, A2_11)
  A0_9:startFadeOutCutSceneDefault(A1_10)
  A0_9:startNQCutScene("fsh20020", 1)
  A0_9:startFadeInCutSceneDefault(A1_10)
end
function Fsh200.processEvent005_2(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:say(A0_12, 35, 0)
  A2_14:say(A0_12, 36, 0)
  A2_14:finishCliantTalkTurn()
end
function Fsh200.processEvent010_2(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:say(A0_15, 39, 0)
  A2_17:say(A0_15, 40, 0)
  A2_17:finishCliantTalkTurn()
end
function Fsh200.processEvent010_3(A0_18, A1_19, A2_20)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:say(A0_18, 41, 0)
  A2_20:say(A0_18, 42, 0)
  A2_20:finishCliantTalkTurn()
end
function Fsh200.processEvent010_4(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 43, 0)
  A2_23:say(A0_21, 44, 0)
  A2_23:finishCliantTalkTurn()
end
function Fsh200.processEvent010_5(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(1, A1_25)
  A2_26:_runCharaScheduler(70836224)
  A2_26:say(A0_24, 45, 0)
  A2_26:say(A0_24, 46, 0)
  A2_26:finishCliantTalkTurn()
end
function Fsh200.processEvent010_6(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:say(A0_27, 47, 0)
  A2_29:finishCliantTalkTurn()
end
function Fsh200.processEvent010_7(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:say(A0_30, 48, 0)
  A2_32:finishCliantTalkTurn()
end
function Fsh200.processEvent010_8(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:say(A0_33, 49, 0)
  A2_35:say(A0_33, 50, 0)
  A2_35:say(A0_33, 51, 0)
  A2_35:finishCliantTalkTurn()
end
function Fsh200.processEvent010_9(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:say(A0_36, 37, 0)
  A2_38:say(A0_36, 38, 0, 5)
  A2_38:finishCliantTalkTurn()
end
function Fsh200.processEvent010_10(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 54, 0)
  A2_41:say(A0_39, 55, 0)
  A2_41:say(A0_39, 56, 0)
  A2_41:finishCliantTalkTurn()
end
function Fsh200.processEvent010_11(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 52, 0)
  A2_44:say(A0_42, 53, 0)
  A2_44:finishCliantTalkTurn()
end
function Fsh200.processEvent010_12(A0_45, A1_46, A2_47, A3_48)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 57, 0)
  A2_47:say(A0_45, 58, 0, A3_48)
  A2_47:finishCliantTalkTurn()
end
