require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Fsh300", "ScenarioBaseClass")
function Fsh300.initText(A0_0)
  A0_0:_loadTextDataPermanently(90, "fsh300")
end
function Fsh300.processEventNnmulikaStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 6, 0)
  else
    A2_3:say(A0_1, 5, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Fsh300.processEvent005(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 43, 0)
  A2_6:finishCliantTalkTurn()
end
function Fsh300.processEvent010(A0_7, A1_8, A2_9, A3_10)
  local L4_11
  if A3_10 == 1 then
    L4_11 = 1
  else
    L4_11 = 2
  end
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("fsh30010", 1, L4_11)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
function Fsh300.processEvent010_2(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:say(A0_12, 44, 0)
  A2_14:say(A0_12, 45, 0)
  A2_14:finishCliantTalkTurn()
end
function Fsh300.processEvent10_3(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:say(A0_15, 59, 0)
  A2_17:say(A0_15, 60, 0)
  A2_17:finishCliantTalkTurn()
end
function Fsh300.processEvent10_4(A0_18, A1_19, A2_20)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:say(A0_18, 61, 0)
  A2_20:say(A0_18, 62, 0)
  A2_20:finishCliantTalkTurn()
end
function Fsh300.processEvent10_5(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 63, 0)
  A2_23:finishCliantTalkTurn()
end
function Fsh300.processEvent10_6(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(2, A1_25)
  A2_26:say(A0_24, 64, 0)
  A2_26:finishCliantTalkTurn()
end
function Fsh300.processEvent10_7(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:say(A0_27, 65, 0)
  A2_29:finishCliantTalkTurn()
end
function Fsh300.processEvent10_8(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:say(A0_30, 66, 0)
  A2_32:say(A0_30, 67, 0)
  A2_32:finishCliantTalkTurn()
end
function Fsh300.processEvent10_9(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:say(A0_33, 68, 0)
  A2_35:say(A0_33, 69, 0)
  A2_35:finishCliantTalkTurn()
end
function Fsh300.processEvent10_10(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:say(A0_36, 70, 0)
  A2_38:say(A0_36, 71, 0)
  A2_38:finishCliantTalkTurn()
end
function Fsh300.processEvent020(A0_39, A1_40, A2_41)
  A0_39:startFadeOutCutSceneDefault(A1_40)
  A0_39:startNQCutScene("fsh30020", 1)
  A0_39:startFadeInCutSceneAfterWarp(A1_40)
end
function Fsh300.processEvent020_2(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 46, 0)
  A2_44:say(A0_42, 47, 0)
  A2_44:finishCliantTalkTurn()
end
function Fsh300.processEvent025(A0_45, A1_46, A2_47)
  A0_45:startFadeOutCutSceneDefault(A1_46)
  A0_45:startNQCutScene("fsh30025", 1)
  A0_45:startFadeInCutSceneAfterWarp(A1_46)
end
function Fsh300.processEvent025_2(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:say(A0_48, 48, 0)
  A2_50:say(A0_48, 49, 0)
  A2_50:finishCliantTalkTurn()
end
function Fsh300.processEvent025_3(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:say(A0_51, 72, 0)
  A2_53:say(A0_51, 73, 0)
  A2_53:finishCliantTalkTurn()
end
function Fsh300.processEvent025_4(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(2, A1_55)
  A2_56:say(A0_54, 74, 0)
  A2_56:say(A0_54, 75, 0)
  A2_56:finishCliantTalkTurn()
end
function Fsh300.processEvent025_5(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:say(A0_57, 76, 0)
  A2_59:finishCliantTalkTurn()
end
function Fsh300.processEvent025_6(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:say(A0_60, 77, 0)
  A2_62:say(A0_60, 78, 0)
  A2_62:finishCliantTalkTurn()
end
function Fsh300.processEvent025_7(A0_63, A1_64, A2_65)
  A2_65:startCliantTalkTurn(2, A1_64)
  A2_65:say(A0_63, 79, 0)
  A2_65:say(A0_63, 80, 0)
  A2_65:finishCliantTalkTurn()
end
function Fsh300.processEvent028(A0_66, A1_67, A2_68)
  A2_68:startCliantTalkTurn(1, A1_67)
  A2_68:say(A0_66, 19, 0)
  A2_68:say(A0_66, 20, 0)
  A2_68:finishCliantTalkTurn()
end
function Fsh300.processEvent028_3(A0_69, A1_70, A2_71)
  A2_71:startCliantTalkTurn(2, A1_70)
  A2_71:say(A0_69, 50, 0)
  A2_71:say(A0_69, 51, 0)
  A2_71:finishCliantTalkTurn()
end
function Fsh300.processEvent028_4(A0_72, A1_73, A2_74)
  A2_74:startCliantTalkTurn(2, A1_73)
  A2_74:say(A0_72, 81, 0)
  A2_74:say(A0_72, 82, 0)
  A2_74:finishCliantTalkTurn()
end
function Fsh300.processEvent028_5(A0_75, A1_76, A2_77)
  A2_77:startCliantTalkTurn(2, A1_76)
  A2_77:say(A0_75, 83, 0)
  A2_77:say(A0_75, 84, 0)
  A2_77:finishCliantTalkTurn()
end
function Fsh300.processEvent028_6(A0_78, A1_79, A2_80)
  A2_80:startCliantTalkTurn(2, A1_79)
  A2_80:say(A0_78, 85, 0)
  A2_80:finishCliantTalkTurn()
end
function Fsh300.processEvent028_7(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(2, A1_82)
  A2_83:say(A0_81, 86, 0)
  A2_83:say(A0_81, 87, 0)
  A2_83:finishCliantTalkTurn()
end
function Fsh300.processEvent028_8(A0_84, A1_85, A2_86)
  A2_86:startCliantTalkTurn(2, A1_85)
  A2_86:say(A0_84, 88, 0)
  A2_86:say(A0_84, 89, 0)
  A2_86:finishCliantTalkTurn()
end
function Fsh300.processEvent028_9(A0_87, A1_88, A2_89)
  A2_89:startCliantTalkTurn(2, A1_88)
  A2_89:say(A0_87, 90, 0)
  A2_89:say(A0_87, 91, 0)
  A2_89:finishCliantTalkTurn()
end
function Fsh300.processEvent029(A0_90, A1_91, A2_92)
  A2_92:startCliantTalkTurn(2, A1_91)
  A2_92:say(A0_90, 21, 0)
  A2_92:finishCliantTalkTurn()
end
function Fsh300.processEvent029_2(A0_93, A1_94, A2_95)
  A2_95:startCliantTalkTurn(2, A1_94)
  A2_95:say(A0_93, 21, 0)
  A2_95:finishCliantTalkTurn()
end
function Fsh300.processEvent030(A0_96, A1_97, A2_98)
  A0_96:startFadeOutCutSceneDefault(A1_97)
  A0_96:startNQCutScene("fsh30030", 1)
  A0_96:startFadeInCutSceneDefault(A1_97)
end
function Fsh300.processEvent030_2(A0_99, A1_100, A2_101)
  A2_101:startCliantTalkTurn(2, A1_100)
  A2_101:say(A0_99, 52, 0)
  A2_101:say(A0_99, 53, 0)
  A2_101:finishCliantTalkTurn()
end
function Fsh300.processEvent040(A0_102, A1_103, A2_104)
  A0_102:startFadeOutCutSceneDefault(A1_103)
  A0_102:startNQCutScene("fsh30040", 1)
  A0_102:startFadeInCutSceneAfterWarp(A1_103)
end
function Fsh300.processEvent050(A0_105, A1_106, A2_107)
  A0_105:startFadeOutCutSceneDefault(A1_106)
  A0_105:startNQCutScene("fsh30050", 1)
  A0_105:startFadeInCutSceneAfterWarp(A1_106)
end
function Fsh300.processEvent050_2(A0_108, A1_109, A2_110)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:say(A0_108, 92, 0)
  A2_110:finishCliantTalkTurn()
end
function Fsh300.processEvent050_3(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 93, 0)
  A2_113:say(A0_111, 94, 0)
  A2_113:finishCliantTalkTurn()
end
function Fsh300.processEvent050_4(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:say(A0_114, 95, 0)
  A2_116:finishCliantTalkTurn()
end
function Fsh300.processEvent050_5(A0_117, A1_118, A2_119)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:say(A0_117, 96, 0)
  A2_119:finishCliantTalkTurn()
end
function Fsh300.processEvent050_6(A0_120, A1_121, A2_122)
  A2_122:startCliantTalkTurn(2, A1_121)
  A2_122:say(A0_120, 97, 0)
  A2_122:finishCliantTalkTurn()
end
function Fsh300.processEvent050_7(A0_123, A1_124, A2_125)
  A2_125:startCliantTalkTurn(2, A1_124)
  A2_125:say(A0_123, 98, 0)
  A2_125:finishCliantTalkTurn()
end
function Fsh300.processEvent050_8(A0_126, A1_127, A2_128)
  A2_128:startCliantTalkTurn(2, A1_127)
  A2_128:say(A0_126, 99, 0)
  A2_128:say(A0_126, 100, 0)
  A2_128:finishCliantTalkTurn()
end
function Fsh300.processEvent050_9(A0_129, A1_130, A2_131)
  A2_131:startCliantTalkTurn(2, A1_130)
  A2_131:say(A0_129, 101, 0)
  A2_131:finishCliantTalkTurn()
end
function Fsh300.processEvent060(A0_132, A1_133, A2_134)
  A0_132:startFadeOutCutSceneDefault(A1_133)
  A0_132:startNQCutScene("fsh30060", 1)
  A0_132:startFadeInCutSceneDefault(A1_133)
end
function Fsh300.processEvent070(A0_135, A1_136, A2_137)
  if worldMaster:ask(A0_135, worldMaster, 51030, 2) == 1 then
    A0_135:runCharaSchedulerPastAreaIn(A1_136)
    A0_135:startNQCutScene("fsh30070", 1)
    A0_135:startFadeInCutSceneDefault(A1_136)
    return (worldMaster:ask(A0_135, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Fsh300.processEvent070_2(A0_138, A1_139, A2_140)
  A2_140:say(A0_138, 54, 0)
  A2_140:say(A0_138, 55, 0)
end
function Fsh300.processEvent075(A0_141, A1_142, A2_143)
  A2_143:startCliantTalkTurn(1, A1_142)
  A2_143:say(A0_141, 56, 0)
  A2_143:say(A0_141, 103, 0)
  A2_143:say(A0_141, 57, 0)
  A2_143:say(A0_141, 58, 0)
  A2_143:finishCliantTalkTurn()
end
function Fsh300.processEvent010_1000(A0_144, A1_145, A2_146)
  A2_146:startCliantTalkTurn(2, A1_145)
  A2_146:say(A0_144, 102, 0)
  A2_146:finishCliantTalkTurn()
end
function Fsh300.processEvent010_1001(A0_147, A1_148, A2_149)
  A2_149:startCliantTalkTurn(1, A1_148)
  A2_149:say(A0_147, 105, 0)
  if A2_149:ask(A0_147, 106, 2) == 1 then
  end
  A2_149:finishCliantTalkTurn()
  return (A2_149:ask(A0_147, 106, 2))
end
function Fsh300.processEvent010_1002(A0_150, A1_151, A2_152)
  A2_152:startCliantTalkTurn(1, A1_151)
  A2_152:say(A0_150, 115, 0)
  if A2_152:ask(A0_150, 116, 2) == 1 then
  end
  A2_152:finishCliantTalkTurn()
  return (A2_152:ask(A0_150, 116, 2))
end
