require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Arc200", "ScenarioBaseClass")
function Arc200.initText(A0_0)
  A0_0:_loadTextDataPermanently(347, "arc200")
end
function Arc200.processEventNonolatoStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 77, 2) == 1 then
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:say(A0_1, 8, 0)
    else
      A2_3:say(A0_1, 7, 0)
      A2_3:finishCliantTalkTurn()
    end
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 80, 0)
  end
  A2_3:finishCliantTalkTurn()
end
function Arc200.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("arc20010", 1)
  A0_4:startFadeInCutSceneAfterWarp(A1_5)
end
function Arc200.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startFadeInCutSceneDefault(A1_8)
  return (A0_7:startNQCutScene("arc20020", 2))
end
function Arc200.processEvent030(A0_10, A1_11, A2_12)
  local L3_13
  L3_13 = A1_11.getNation
  L3_13 = L3_13(A1_11)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("arc20030", 1, true, L3_13)
  A0_10:startFadeInCutSceneAfterWarp(A1_11)
end
function Arc200.processEvent040(A0_14, A1_15, A2_16)
  A0_14:startFadeOutCutSceneDefault(A1_15)
  A0_14:startNQCutScene("arc20040", 1)
  A0_14:startFadeInCutSceneAfterWarp(A1_15)
end
function Arc200.processEvent050(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 35, 0)
  A2_19:say(A0_17, 36, 0)
  if A2_19:ask(A0_17, 51, 2) == 1 then
    A2_19:say(A0_17, 37, 0)
  else
    A2_19:say(A0_17, 38, 0)
  end
  A2_19:say(A0_17, 39, 0)
  A2_19:say(A0_17, 40, 0)
  A2_19:say(A0_17, 41, 0)
  A2_19:finishCliantTalkTurn()
end
function Arc200.processEvent005_2(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 54, 0)
  A2_22:say(A0_20, 55, 0)
  A2_22:finishCliantTalkTurn()
end
function Arc200.processEvent005_3(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 17, 0)
  A2_25:finishCliantTalkTurn()
end
function Arc200.processEvent005_4(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 19, 0)
  A2_28:say(A0_26, 56, 0)
  A2_28:finishCliantTalkTurn()
end
function Arc200.processEvent005_5(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 20, 0)
  A2_31:say(A0_29, 57, 0)
  A2_31:finishCliantTalkTurn()
end
function Arc200.processEvent005_6(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 21, 0)
  A2_34:say(A0_32, 22, 0)
  A2_34:finishCliantTalkTurn()
end
function Arc200.processEvent005_7(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 18, 0)
  A2_37:finishCliantTalkTurn()
end
function Arc200.processEvent005_8(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 58, 0)
  A2_40:finishCliantTalkTurn()
end
function Arc200.processEvent010_2(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 59, 0)
  A2_43:say(A0_41, 60, 0)
  A2_43:finishCliantTalkTurn()
end
function Arc200.processEvent010_3(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 61, 0)
  A2_46:finishCliantTalkTurn()
end
function Arc200.processEvent010_4(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 62, 0)
  A2_49:finishCliantTalkTurn()
end
function Arc200.processEvent010_5(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 63, 0)
  A2_52:say(A0_50, 64, 0)
  A2_52:finishCliantTalkTurn()
end
function Arc200.processEvent030_2(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 66, 0)
  A2_55:say(A0_53, 67, 0)
  A2_55:finishCliantTalkTurn()
end
function Arc200.processEvent030_3(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 68, 0)
  A2_58:finishCliantTalkTurn()
end
function Arc200.processEvent030_4(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 69, 0)
  A2_61:finishCliantTalkTurn()
end
function Arc200.processEvent040_2(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 70, 0)
  A2_64:finishCliantTalkTurn()
end
function Arc200.processEvent040_3(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 43, 0)
  A2_67:say(A0_65, 44, 0)
  A2_67:finishCliantTalkTurn()
end
function Arc200.processEvent040_4(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  A2_70:say(A0_68, 42, 0)
  A2_70:say(A0_68, 71, 0)
  A2_70:finishCliantTalkTurn()
end
