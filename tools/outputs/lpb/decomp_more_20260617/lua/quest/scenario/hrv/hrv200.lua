require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Hrv200", "ScenarioBaseClass")
function Hrv200.initText(A0_0)
  A0_0:_loadTextDataPermanently(245, "hrv200")
end
function Hrv200.processEventOpyltylStart(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(A2_3, 2, A1_2)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 1, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 2, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 3, 0)
  L3_4 = A2_3.ask
  L3_4 = L3_4(A2_3, A0_1, 35, 2)
  if L3_4 == 1 then
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    L3_4 = A0_1:showQuestInfomation()
    if L3_4 == 1 then
      A2_3:say(A0_1, 9, 0)
      A2_3:say(A0_1, 10, 0)
    else
      A2_3:say(A0_1, 8, 0)
    end
  else
    A2_3:say(A0_1, 8, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Hrv200.processEvent010(A0_5, A1_6, A2_7)
  A0_5:startFadeOutCutSceneDefault(A1_6)
  A0_5:startNQCutScene("hrv20010", 1)
  A0_5:startFadeInCutSceneDefault(A1_6)
end
function Hrv200.processEvent020(A0_8, A1_9, A2_10)
  A0_8:startFadeOutCutSceneDefault(A1_9)
  A0_8:startNQCutScene("hrv20020", 1)
  A0_8:startFadeInCutSceneAfterWarp(A1_9)
end
function Hrv200.processEvent020_1(A0_11, A1_12, A2_13)
  A0_11:startFadeOutCutSceneDefault(A1_12)
  A0_11:startNQCutScene("hrv20020", 1)
  A0_11:startFadeInCutSceneDefault(A1_12)
end
function Hrv200.processEvent030(A0_14, A1_15, A2_16)
  A0_14:startFadeOutCutSceneDefault(A1_15)
  A0_14:startNQCutScene("hrv20030", 1)
  A0_14:startFadeInCutSceneAfterWarp(A1_15)
end
function Hrv200.processEvent005_2(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 46, 0)
  A2_19:say(A0_17, 47, 0)
  A2_19:finishCliantTalkTurn()
end
function Hrv200.processEvent005_3(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 48, 0)
  A2_22:say(A0_20, 49, 0)
  A2_22:finishCliantTalkTurn()
end
function Hrv200.processEvent005_4(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 50, 0)
  A2_25:say(A0_23, 51, 0)
  A2_25:finishCliantTalkTurn()
end
function Hrv200.processEvent005_5(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 52, 0)
  A2_28:say(A0_26, 53, 0)
  A2_28:finishCliantTalkTurn()
end
function Hrv200.processEvent010_2(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 54, 0)
  A2_31:say(A0_29, 55, 0)
  A2_31:finishCliantTalkTurn()
end
function Hrv200.processEvent010_3(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 56, 0)
  A2_34:say(A0_32, 57, 0)
  A2_34:finishCliantTalkTurn()
end
function Hrv200.processEvent020_2(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 58, 0)
  A2_37:say(A0_35, 59, 0)
  A2_37:finishCliantTalkTurn()
end
function Hrv200.processEvent020_3(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 60, 0)
  A2_40:say(A0_38, 61, 0)
  A2_40:say(A0_38, 62, 0)
  A2_40:finishCliantTalkTurn()
end
function Hrv200.processEvent020_4(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 63, 0)
  A2_43:say(A0_41, 64, 0)
  A2_43:finishCliantTalkTurn()
end
