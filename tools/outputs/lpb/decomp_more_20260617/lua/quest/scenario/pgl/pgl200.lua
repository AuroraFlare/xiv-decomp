require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Pgl200", "ScenarioBaseClass")
function Pgl200.initText(A0_0)
  A0_0:_loadTextDataPermanently(529, "pgl200")
end
function Pgl200.processEventGagarunaStart(A0_1, A1_2, A2_3)
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
  L3_4 = L3_4(A2_3, A0_1, 69, 2)
  if L3_4 == 1 then
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 8, 0)
    L3_4 = A0_1:showQuestInfomation()
    if L3_4 == 1 then
      A2_3:say(A0_1, 10)
    else
      A2_3:say(A0_1, 9, 0)
    end
  else
    A2_3:say(A0_1, 4, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Pgl200.processEvent010(A0_5, A1_6, A2_7)
  A0_5:startFadeOutCutSceneDefault(A1_6)
  A0_5:startNQCutScene("pgl20010", 1)
  A0_5:startFadeInCutSceneDefault(A1_6)
end
function Pgl200.processEvent013(A0_8, A1_9, A2_10)
end
function Pgl200.processEvent017(A0_11, A1_12, A2_13)
end
function Pgl200.processEvent020(A0_14, A1_15, A2_16)
  A0_14:startFadeOutCutSceneDefault(A1_15)
  A0_14:startNQCutScene("pgl20020", 1)
  A0_14:startFadeInCutSceneDefault(A1_15)
end
function Pgl200.processEvent030(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A0_17:startFadeOutCutSceneDefault(A1_18)
  A0_17:startNQCutScene("pgl20030", 1)
  A0_17:startFadeInCutSceneAfterWarp(A1_18)
  A2_19:finishCliantTalkTurn()
end
function Pgl200.processEvent035(A0_20, A1_21, A2_22)
end
function Pgl200.processEvent040(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 34)
  if A2_25:ask(A0_23, 65, 2) == 1 then
    A0_23:startFadeOutCutSceneDefault(A1_24)
    A0_23:startNQCutScene("pgl20040", 1)
    A0_23:startFadeInCutSceneDefault(A1_24)
    return (A2_25:ask(A0_23, 65, 2))
  else
    A2_25:say(A0_23, 119)
  end
  A2_25:finishCliantTalkTurn()
end
function Pgl200.processEvent050(A0_26, A1_27, A2_28)
  A0_26:startFadeOutCutSceneDefault(A1_27)
  A0_26:startNQCutScene("pgl20050", 1)
  A0_26:startFadeInCutSceneDefault(A1_27)
end
function Pgl200.processEvent060(A0_29, A1_30, A2_31)
  A0_29:startFadeOutCutSceneDefault(A1_30)
  A0_29:startNQCutScene("pgl20060", 1)
  A0_29:startFadeInCutSceneAfterWarp(A1_30)
end
function Pgl200.processEvent070(A0_32, A1_33, A2_34)
  A0_32:startFadeOutCutSceneDefault(A1_33)
  A0_32:startNQCutScene("pgl20070", 1)
  A0_32:startFadeInCutSceneDefault(A1_33)
end
function Pgl200.processEvent005_2(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 72, 0)
  A2_37:say(A0_35, 73, 0)
  A2_37:finishCliantTalkTurn()
end
function Pgl200.processEvent005_3(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 74, 0)
  A2_40:say(A0_38, 75, 0)
  A2_40:finishCliantTalkTurn()
end
function Pgl200.processEvent005_4(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 76, 0)
  A2_43:say(A0_41, 77, 0)
  A2_43:say(A0_41, 78, 0)
  A2_43:finishCliantTalkTurn()
end
function Pgl200.processEvent005_5(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 79, 0)
  A2_46:say(A0_44, 80, 0)
  A2_46:finishCliantTalkTurn()
end
function Pgl200.processEvent005_6(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 81, 0)
  A2_49:say(A0_47, 82, 0)
  A2_49:finishCliantTalkTurn()
end
function Pgl200.processEvent005_7(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 83, 0)
  A2_52:say(A0_50, 84, 0)
  A2_52:finishCliantTalkTurn()
end
function Pgl200.processEvent005_8(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 85, 0)
  A2_55:say(A0_53, 86, 0)
  A2_55:finishCliantTalkTurn()
end
function Pgl200.processEvent010_2(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 87, 0)
  A2_58:say(A0_56, 88, 0)
  A2_58:say(A0_56, 89, 0)
  A2_58:finishCliantTalkTurn()
end
function Pgl200.processEvent010_3(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 90, 0)
  A2_61:say(A0_59, 91, 0)
  A2_61:finishCliantTalkTurn()
end
function Pgl200.processEvent010_4(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 125, 0)
  A2_64:finishCliantTalkTurn()
end
function Pgl200.processEvent010_5(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 126, 0)
  A2_67:finishCliantTalkTurn()
end
function Pgl200.processEvent020_2(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  A2_70:say(A0_68, 29, 0)
  A2_70:finishCliantTalkTurn()
end
function Pgl200.processEvent020_3(A0_71, A1_72, A2_73)
  A2_73:startCliantTalkTurn(2, A1_72)
  A2_73:say(A0_71, 30, 0)
  A2_73:finishCliantTalkTurn()
end
function Pgl200.processEvent020_4(A0_74, A1_75, A2_76)
  A2_76:startCliantTalkTurn(2, A1_75)
  A2_76:say(A0_74, 31, 0)
  A2_76:finishCliantTalkTurn()
end
function Pgl200.processEvent030_2(A0_77, A1_78, A2_79)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:say(A0_77, 92, 0)
  A2_79:say(A0_77, 93, 0)
  A2_79:finishCliantTalkTurn()
end
function Pgl200.processEvent030_3(A0_80, A1_81, A2_82)
  A2_82:startCliantTalkTurn(2, A1_81)
  A2_82:say(A0_80, 94, 0)
  A2_82:say(A0_80, 95, 0)
  A2_82:finishCliantTalkTurn()
end
function Pgl200.processEvent040_2(A0_83, A1_84, A2_85)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:say(A0_83, 96, 0)
  A2_85:say(A0_83, 43, 0)
  A2_85:say(A0_83, 44, 0)
  A2_85:finishCliantTalkTurn()
end
function Pgl200.processEvent040_3(A0_86, A1_87, A2_88)
  A2_88:startCliantTalkTurn(2, A1_87)
  A2_88:say(A0_86, 97, 0)
  A2_88:say(A0_86, 98, 0)
  A2_88:finishCliantTalkTurn()
end
function Pgl200.processEvent050_2(A0_89, A1_90, A2_91)
  A2_91:startCliantTalkTurn(2, A1_90)
  A2_91:say(A0_89, 99, 0)
  A2_91:say(A0_89, 100, 0)
  A2_91:finishCliantTalkTurn()
end
function Pgl200.processEvent050_3(A0_92, A1_93, A2_94)
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:say(A0_92, 101, 0)
  A2_94:say(A0_92, 102, 0)
  A2_94:say(A0_92, 120, 0)
  A2_94:finishCliantTalkTurn()
end
function Pgl200.processEvent050_4(A0_95, A1_96, A2_97)
  A2_97:startCliantTalkTurn(2, A1_96)
  A2_97:say(A0_95, 121, 0)
  if A2_97:ask(A0_95, 122, 2) == 1 then
  else
  end
  A2_97:finishCliantTalkTurn()
  return (A2_97:ask(A0_95, 122, 2))
end
function Pgl200.processEvent060_2(A0_98, A1_99, A2_100)
  A2_100:startCliantTalkTurn(2, A1_99)
  A2_100:say(A0_98, 103, 0)
  A2_100:say(A0_98, 104, 0)
  A2_100:finishCliantTalkTurn()
end
function Pgl200.processEvent060_3(A0_101, A1_102, A2_103)
  A2_103:startCliantTalkTurn(2, A1_102)
  A2_103:say(A0_101, 105, 0)
  A2_103:say(A0_101, 106, 0)
  A2_103:finishCliantTalkTurn()
end
function Pgl200.processEvent060_4(A0_104, A1_105, A2_106)
  A2_106:startCliantTalkTurn(2, A1_105)
  A2_106:say(A0_104, 107, 0)
  A2_106:say(A0_104, 108, 0)
  A2_106:finishCliantTalkTurn()
end
function Pgl200.processEvent060_5(A0_107, A1_108, A2_109)
  A2_109:startCliantTalkTurn(2, A1_108)
  A2_109:say(A0_107, 109, 0)
  A2_109:say(A0_107, 110, 0)
  A2_109:finishCliantTalkTurn()
end
function Pgl200.processEvent060_6(A0_110, A1_111, A2_112)
  A2_112:startCliantTalkTurn(2, A1_111)
  A2_112:say(A0_110, 111, 0)
  A2_112:say(A0_110, 112, 0)
  A2_112:finishCliantTalkTurn()
end
function Pgl200.processEvent060_7(A0_113, A1_114, A2_115)
  A2_115:startCliantTalkTurn(2, A1_114)
  A2_115:say(A0_113, 113, 0)
  A2_115:say(A0_113, 114, 0)
  A2_115:finishCliantTalkTurn()
end
function Pgl200.processEvent060_8(A0_116, A1_117, A2_118)
  A2_118:startCliantTalkTurn(2, A1_117)
  A2_118:say(A0_116, 115, 0)
  A2_118:say(A0_116, 116, 0)
  A2_118:finishCliantTalkTurn()
end
