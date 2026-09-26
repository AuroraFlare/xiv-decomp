require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Wdk200", "ScenarioBaseClass")
function Wdk200.initText(A0_0)
  A0_0:_loadTextDataPermanently(431, "wdk200")
end
function Wdk200.processEventANaidjaaStart(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(A2_3, 2, A1_2)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 1, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 2, 0)
  L3_4 = A2_3.ask
  L3_4 = L3_4(A2_3, A0_1, 44, 2)
  if L3_4 == 1 then
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    L3_4 = A0_1:showQuestInfomation()
    if L3_4 == 1 then
      A2_3:say(A0_1, 96, 0)
    else
      A2_3:say(A0_1, 8, 0)
    end
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Wdk200.processEvent010(A0_5, A1_6, A2_7)
  A0_5:startFadeOutCutSceneDefault(A1_6)
  A0_5:startNQCutScene("wdk20010", 1)
  A0_5:startFadeInCutSceneAfterWarp(A1_6)
end
function Wdk200.processEvent020(A0_8, A1_9, A2_10)
  A0_8:startFadeOutCutSceneDefault(A1_9)
  A0_8:startNQCutScene("wdk20020", 1)
  A0_8:startFadeInCutSceneAfterWarp(A1_9)
end
function Wdk200.processEvent025(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:say(A0_11, 19, 0)
  A2_13:say(A0_11, 20, 0)
  A2_13:say(A0_11, 21, 0)
  A2_13:finishCliantTalkTurn()
  A0_11:startFadeOutCutSceneDefault(A1_12)
  A0_11:startFadeInCutSceneAfterWarp(A1_12)
end
function Wdk200.processEvent030(A0_14, A1_15, A2_16)
  A0_14:startFadeOutCutSceneDefault(A1_15)
  A0_14:startNQCutScene("wdk20030", 1)
  A0_14:startFadeInCutSceneDefault(A1_15)
end
function Wdk200.processEvent040(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 39, 0)
  A2_19:say(A0_17, 40, 0)
  A2_19:say(A0_17, 41, 0)
  A2_19:say(A0_17, 42, 0)
  A2_19:finishCliantTalkTurn()
end
function Wdk200.processEvent005_2(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 50, 0)
  A2_22:say(A0_20, 51, 0)
  A2_22:finishCliantTalkTurn()
end
function Wdk200.processEvent005_3(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 52, 0)
  A2_25:finishCliantTalkTurn()
end
function Wdk200.processEvent005_4(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 53, 0)
  A2_28:say(A0_26, 54, 0)
  A2_28:finishCliantTalkTurn()
end
function Wdk200.processEvent005_5(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 55, 0)
  A2_31:say(A0_29, 56, 0)
  A2_31:finishCliantTalkTurn()
end
function Wdk200.processEvent005_6(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 57, 0)
  A2_34:say(A0_32, 58, 0)
  A2_34:finishCliantTalkTurn()
end
function Wdk200.processEvent005_7(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 59, 0)
  A2_37:say(A0_35, 60, 0)
  A2_37:finishCliantTalkTurn()
end
function Wdk200.processEvent010_2(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 61, 0)
  A2_40:say(A0_38, 62, 0)
  A2_40:finishCliantTalkTurn()
end
function Wdk200.processEvent010_3(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 78, 0)
  A2_43:finishCliantTalkTurn()
end
function Wdk200.processEvent010_4(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 79, 0)
  A2_46:finishCliantTalkTurn()
end
function Wdk200.processEvent010_5(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 80, 0)
  A2_49:finishCliantTalkTurn()
end
function Wdk200.processEvent010_6(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 81, 0)
  A2_52:finishCliantTalkTurn()
end
function Wdk200.processEvent010_7(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 82, 0)
  A2_55:finishCliantTalkTurn()
end
function Wdk200.processEvent010_8(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 97, 0)
  A2_58:finishCliantTalkTurn()
end
function Wdk200.processEvent020_2(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 76, 0)
  A2_61:say(A0_59, 83, 0)
  A2_61:finishCliantTalkTurn()
end
function Wdk200.processEvent020_3(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  if A2_64:ask(A0_62, 85, 2) == 1 then
  else
  end
  A2_64:finishCliantTalkTurn()
  return (A2_64:ask(A0_62, 85, 2))
end
function Wdk200.processEvent020_3_2(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 84, 0)
  A2_67:finishCliantTalkTurn()
end
function Wdk200.processEvent020_4(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  if A2_70:ask(A0_68, 85, 2) == 1 then
  else
  end
  A2_70:finishCliantTalkTurn()
  return (A2_70:ask(A0_68, 85, 2))
end
function Wdk200.processEvent020_4_2(A0_71, A1_72, A2_73)
  A2_73:startCliantTalkTurn(2, A1_72)
  A2_73:say(A0_71, 88, 0)
  A2_73:finishCliantTalkTurn()
end
function Wdk200.processEvent020_5(A0_74, A1_75, A2_76)
  A2_76:startCliantTalkTurn(2, A1_75)
  if A2_76:ask(A0_74, 85, 2) == 1 then
  else
  end
  A2_76:finishCliantTalkTurn()
  return (A2_76:ask(A0_74, 85, 2))
end
function Wdk200.processEvent020_5_2(A0_77, A1_78, A2_79)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:say(A0_77, 89, 0)
  A2_79:finishCliantTalkTurn()
end
function Wdk200.processEvent020_6(A0_80, A1_81, A2_82)
  A2_82:startCliantTalkTurn(2, A1_81)
  A2_82:say(A0_80, 90, 0)
  A2_82:say(A0_80, 91, 0)
  A2_82:finishCliantTalkTurn()
end
function Wdk200.processEvent020_7(A0_83, A1_84, A2_85)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:say(A0_83, 92, 0)
  A2_85:say(A0_83, 93, 0)
  A2_85:say(A0_83, 94, 0)
  A2_85:finishCliantTalkTurn()
end
function Wdk200.processEvent025_2(A0_86, A1_87, A2_88)
  A2_88:startCliantTalkTurn(2, A1_87)
  A2_88:say(A0_86, 63, 0)
  A2_88:say(A0_86, 64, 0)
  A2_88:finishCliantTalkTurn()
end
function Wdk200.processEvent025_3(A0_89, A1_90, A2_91)
  A2_91:startCliantTalkTurn(2, A1_90)
  A2_91:say(A0_89, 77, 0)
  A2_91:say(A0_89, 95, 0)
  A2_91:finishCliantTalkTurn()
end
function Wdk200.processEvent030_2(A0_92, A1_93, A2_94)
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:say(A0_92, 65, 0)
  A2_94:finishCliantTalkTurn()
end
function Wdk200.processEvent030_3(A0_95, A1_96, A2_97)
  A2_97:startCliantTalkTurn(2, A1_96)
  A2_97:say(A0_95, 66, 0)
  A2_97:say(A0_95, 67, 0)
  A2_97:finishCliantTalkTurn()
end
function Wdk200.processEvent030_4(A0_98, A1_99, A2_100)
  A2_100:startCliantTalkTurn(2, A1_99)
  A2_100:say(A0_98, 68, 0)
  A2_100:say(A0_98, 69, 0)
  A2_100:say(A0_98, 70, 0)
  A2_100:finishCliantTalkTurn()
end
function Wdk200.processEvent030_5(A0_101, A1_102, A2_103)
  A2_103:startCliantTalkTurn(2, A1_102)
  A2_103:say(A0_101, 71, 0)
  A2_103:say(A0_101, 72, 0)
  A2_103:finishCliantTalkTurn()
end
function Wdk200.processEvent030_6(A0_104, A1_105, A2_106)
  A2_106:startCliantTalkTurn(2, A1_105)
  A2_106:say(A0_104, 73, 0)
  A2_106:say(A0_104, 74, 0)
  A2_106:finishCliantTalkTurn()
end
function Wdk200.processEvent030_7(A0_107, A1_108, A2_109)
  A2_109:say(A0_107, 98, 0)
end
