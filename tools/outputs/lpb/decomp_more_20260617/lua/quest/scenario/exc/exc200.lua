require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Exc200", "ScenarioBaseClass")
function Exc200.initText(A0_0)
  A0_0:_loadTextDataPermanently(11, "exc200")
end
function Exc200.processEventWaekbyrtStart(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(A2_3, 2, A1_2)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 1, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 2, 0)
  L3_4 = A2_3.ask
  L3_4 = L3_4(A2_3, A0_1, 26, 2)
  if L3_4 == 1 then
    A0_1:startFadeOutCutSceneDefault(A1_2)
    L3_4 = A0_1:startNQCutScene("exc20010", 2)
    A0_1:startFadeInCutSceneDefault(A1_2)
  else
    A2_3:say(A0_1, 12, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Exc200.processEvent015(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 14, 0)
  A2_7:say(A0_5, 15, 0)
  A2_7:say(A0_5, 16, 0)
  A2_7:say(A0_5, 17, 0)
  if A2_7:ask(A0_5, 32, 2) == 1 then
    A2_7:say(A0_5, 18, 0)
    A2_7:say(A0_5, 19, 0)
    A2_7:say(A0_5, 20, 0)
  else
    A2_7:say(A0_5, 92, 0)
  end
  A2_7:finishCliantTalkTurn()
  return (A2_7:ask(A0_5, 32, 2))
end
function Exc200.processEvent020(A0_8, A1_9, A2_10)
  A0_8:startFadeOutCutSceneDefault(A1_9)
  A0_8:startNQCutScene("exc20020", 1)
  A0_8:startFadeInCutSceneAfterWarp(A1_9)
end
function Exc200.processEvent030(A0_11, A1_12, A2_13)
  A0_11:startFadeOutCutSceneDefault(A1_12)
  A0_11:startNQCutScene("exc20030", 1)
  A0_11:startFadeInCutSceneDefault(A1_12)
end
function Exc200.processEvent040(A0_14, A1_15, A2_16)
  A0_14:startFadeOutCutSceneDefault(A1_15)
  A0_14:startNQCutScene("exc20040", 1)
  A0_14:startFadeInCutSceneDefault(A1_15)
end
function Exc200.processEvent050(A0_17, A1_18, A2_19)
  A0_17:startFadeOutCutSceneDefault(A1_18)
  A0_17:startNQCutScene("exc20050", 1)
  A0_17:startFadeInCutSceneDefault(A1_18)
end
function Exc200.processEvent010_2(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 50, 0)
  A2_22:say(A0_20, 51, 0)
  A2_22:finishCliantTalkTurn()
end
function Exc200.processEvent010_3(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 52, 0)
  A2_25:say(A0_23, 53, 0)
  A2_25:finishCliantTalkTurn()
end
function Exc200.processEvent010_4(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 54, 0)
  A2_28:say(A0_26, 55, 0)
  A2_28:finishCliantTalkTurn()
end
function Exc200.processEvent010_5(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 56, 0)
  A2_31:say(A0_29, 57, 0)
  A2_31:finishCliantTalkTurn()
end
function Exc200.processEvent010_6(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 58, 0)
  A2_34:say(A0_32, 59, 0)
  A2_34:say(A0_32, 60, 0)
  A2_34:finishCliantTalkTurn()
end
function Exc200.processEvent010_7(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 61, 0)
  A2_37:say(A0_35, 62, 0)
  A2_37:finishCliantTalkTurn()
end
function Exc200.processEvent010_8(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 63, 0)
  A2_40:say(A0_38, 64, 0)
  A2_40:finishCliantTalkTurn()
end
function Exc200.processEvent010_9(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 65, 0)
  A2_43:say(A0_41, 66, 0)
  A2_43:finishCliantTalkTurn()
end
function Exc200.processEvent010_10(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 67, 0)
  A2_46:say(A0_44, 68, 0)
  A2_46:finishCliantTalkTurn()
end
function Exc200.processEvent010_11(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 69, 0)
  A2_49:say(A0_47, 70, 0)
  A2_49:finishCliantTalkTurn()
end
function Exc200.processEvent010_12(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 71, 0)
  A2_52:say(A0_50, 72, 0)
  A2_52:finishCliantTalkTurn()
end
function Exc200.processEvent010_13(A0_53, A1_54, A2_55)
  A2_55:say(A0_53, 73, 0)
  A2_55:say(A0_53, 74, 0)
end
function Exc200.processEvent010_14(A0_56, A1_57, A2_58)
  A2_58:say(A0_56, 75, 0)
  A2_58:say(A0_56, 76, 0)
end
function Exc200.processEvent010_15(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 77, 0)
  A2_61:say(A0_59, 78, 0)
  A2_61:finishCliantTalkTurn()
end
function Exc200.processEvent010_16(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 79, 0)
  A2_64:finishCliantTalkTurn()
end
function Exc200.processEvent010_17(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 80, 0)
  A2_67:finishCliantTalkTurn()
end
function Exc200.processEvent010_18(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  A2_70:say(A0_68, 81, 0)
  A2_70:finishCliantTalkTurn()
end
function Exc200.processEvent015_2(A0_71, A1_72, A2_73)
  A2_73:startCliantTalkTurn(2, A1_72)
  A2_73:say(A0_71, 85, 0)
  A2_73:say(A0_71, 86, 0)
  A2_73:finishCliantTalkTurn()
end
function Exc200.processEvent015_3(A0_74, A1_75, A2_76)
  A2_76:startCliantTalkTurn(2, A1_75)
  A2_76:say(A0_74, 82, 0)
  A2_76:say(A0_74, 83, 0)
  A2_76:say(A0_74, 84, 0)
  A2_76:finishCliantTalkTurn()
end
function Exc200.processEvent040_2(A0_77, A1_78, A2_79)
  A2_79:say(A0_77, 87, 0)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:say(A0_77, 88, 0)
  A2_79:say(A0_77, 89, 0)
  A2_79:finishCliantTalkTurn()
end
function Exc200.processEvent040_3(A0_80, A1_81, A2_82)
  A2_82:startCliantTalkTurn(2, A1_81)
  A2_82:say(A0_80, 90, 0)
  A2_82:say(A0_80, 91, 0)
  A2_82:finishCliantTalkTurn()
end
function Exc200.processEventQuestMan(A0_83, A1_84, A2_85)
  A2_85:startCliantTalkTurn(1, A1_84)
  if nil == 1 then
    A2_85:finishCliantTalkTurn()
    return nil
  end
end
