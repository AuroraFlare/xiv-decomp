require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gla200", "ScenarioBaseClass")
function Gla200.initText(A0_0)
  A0_0:_loadTextDataPermanently(513, "gla200")
end
function Gla200.processEventLulutsuStart(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(A2_3, 1, A1_2)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 1, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 2, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 3, 0)
  L3_4 = A2_3.ask
  L3_4 = L3_4(A2_3, A0_1, 65, 2)
  if L3_4 == 1 then
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 29, 0)
    A2_3:say(A0_1, 8, 0)
    L3_4 = A0_1:showQuestInfomation()
    if L3_4 == 1 then
      A2_3:say(A0_1, 11, 0)
    else
      A2_3:say(A0_1, 9, 0)
      A2_3:say(A0_1, 10, 0)
    end
  else
    A2_3:say(A0_1, 69, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Gla200.processEvent010(A0_5, A1_6, A2_7)
  A0_5:startFadeOutCutSceneDefault(A1_6)
  A0_5:startNQCutScene("gla20010", 1)
  A0_5:startFadeInCutSceneAfterWarp(A1_6)
end
function Gla200.processEvent020(A0_8, A1_9, A2_10)
  A0_8:startFadeOutCutSceneDefault(A1_9)
  A0_8:startNQCutScene("gla20020", 1)
  A0_8:startFadeInCutSceneAfterWarp(A1_9)
end
function Gla200.processEvent030(A0_11, A1_12, A2_13)
  A0_11:startFadeOutCutSceneDefault(A1_12)
  A0_11:startNQCutScene("gla20030", 1)
  A0_11:startFadeInCutSceneDefault(A1_12)
end
function Gla200.processEvent005_2(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:say(A0_14, 30, 0)
  A2_16:say(A0_14, 31, 0)
  A2_16:say(A0_14, 32, 0)
  A2_16:finishCliantTalkTurn()
end
function Gla200.processEvent005_3(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 33, 0)
  A2_19:say(A0_17, 34, 0)
  A2_19:finishCliantTalkTurn()
end
function Gla200.processEvent005_4(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 35, 0)
  A2_22:say(A0_20, 36, 0)
  A2_22:finishCliantTalkTurn()
end
function Gla200.processEvent005_5(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 37, 0)
  A2_25:say(A0_23, 38, 0)
  A2_25:finishCliantTalkTurn()
end
function Gla200.processEvent005_6(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 39, 0)
  A2_28:say(A0_26, 40, 0)
  A2_28:finishCliantTalkTurn()
end
function Gla200.processEvent005_7(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 41, 0)
  A2_31:say(A0_29, 42, 0)
  A2_31:finishCliantTalkTurn()
end
function Gla200.processEvent005_8(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 43, 0)
  A2_34:say(A0_32, 44, 0)
  A2_34:finishCliantTalkTurn()
end
function Gla200.processEvent005_9(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 45, 0)
  A2_37:say(A0_35, 46, 0)
  A2_37:finishCliantTalkTurn()
end
function Gla200.processEvent005_10(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 47, 0)
  A2_40:say(A0_38, 48, 0)
  A2_40:finishCliantTalkTurn()
end
function Gla200.processEvent020_2(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 19, 0)
  A2_43:finishCliantTalkTurn()
end
function Gla200.processEvent020_3(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 49, 0)
  A2_46:say(A0_44, 50, 0)
  A2_46:finishCliantTalkTurn()
end
function Gla200.processEvent020_4(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 51, 0)
  A2_49:say(A0_47, 52, 0)
  A2_49:finishCliantTalkTurn()
end
function Gla200.processEvent020_5(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 53, 0)
  A2_52:say(A0_50, 54, 0)
  A2_52:finishCliantTalkTurn()
end
function Gla200.processEvent020_6(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 55, 0)
  A2_55:say(A0_53, 56, 0)
  A2_55:finishCliantTalkTurn()
end
function Gla200.processEvent020_7(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 57, 0)
  A2_58:say(A0_56, 58, 0)
  A2_58:finishCliantTalkTurn()
end
function Gla200.processEvent020_8(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 59, 0)
  A2_61:say(A0_59, 60, 0)
  A2_61:finishCliantTalkTurn()
end
function Gla200.processEvent020_9(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 61, 0)
  A2_64:say(A0_62, 62, 0)
  A2_64:finishCliantTalkTurn()
end
function Gla200.processEvent020_10(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 63, 0)
  A2_67:say(A0_65, 64, 0)
  A2_67:finishCliantTalkTurn()
end
