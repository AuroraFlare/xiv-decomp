require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Bsm306", "ScenarioBaseClass")
function Bsm306.initText(A0_0)
  A0_0:_loadTextDataPermanently(249, "bsm306")
end
function Bsm306.processEventBodenolfStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 8, 0)
    A0_1:startFadeOutCutSceneDefault(A1_2)
    A0_1:startFadeInCutSceneAfterWarp(A1_2)
  else
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Bsm306.processEvent005(A0_4, A1_5, A2_6, A3_7)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 10, 0)
  A2_6:say(A0_4, 11, 0)
  A2_6:say(A0_4, 12, 0)
  A2_6:say(A0_4, 13, 0, A3_7)
  A2_6:finishCliantTalkTurn()
end
function Bsm306.processEvent005_2(A0_8, A1_9, A2_10, A3_11)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 58, 0)
  A2_10:say(A0_8, 59, 0, A3_11)
  A2_10:finishCliantTalkTurn()
end
function Bsm306.processEvent005_3(A0_12, A1_13, A2_14, A3_15)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:say(A0_12, 15, 0, A3_15)
  A2_14:say(A0_12, 60, 0, A3_15)
  A2_14:finishCliantTalkTurn()
end
function Bsm306.processEvent005_4(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 14, 0)
  A2_18:say(A0_16, 61, 0)
  A2_18:finishCliantTalkTurn()
end
function Bsm306.processEvent005_5(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 62, 0)
  A2_21:say(A0_19, 63, 0)
  A2_21:finishCliantTalkTurn()
end
function Bsm306.processEvent005_6(A0_22, A1_23, A2_24, A3_25)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 135, 0, A3_25)
  A2_24:finishCliantTalkTurn()
end
function Bsm306.processEvent010(A0_26, A1_27, A2_28, A3_29)
  A0_26:startFadeOutCutSceneDefault(A1_27)
  A0_26:startNQCutScene("bsm30610", 1, true, A3_29)
  A0_26:startFadeInCutSceneAfterWarp(A1_27)
end
function Bsm306.processEvent020(A0_30, A1_31, A2_32)
  A0_30:startFadeOutCutSceneDefault(A1_31)
  A0_30:startNQCutScene("bsm30620", 1)
end
function Bsm306.processEvent030(A0_33, A1_34, A2_35)
  A0_33:_wait(4)
  A0_33:startNQCutScene("bsm30630", 1)
  A0_33:startFadeInCutSceneAfterWarp(A1_34)
end
function Bsm306.processEvent040(A0_36, A1_37, A2_38)
  A0_36:startFadeOutCutSceneDefault(A1_37)
  A0_36:startNQCutScene("bsm30640", 1)
  A0_36:startFadeInCutSceneAfterWarp(A1_37)
end
function Bsm306.processEvent003_2(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 37, 0)
  A2_41:say(A0_39, 38, 0)
  A2_41:say(A0_39, 39, 0)
  A2_41:finishCliantTalkTurn()
end
function Bsm306.processEvent003_3(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 40, 0)
  A2_44:finishCliantTalkTurn()
end
function Bsm306.processEvent003_4(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 41, 0)
  A2_47:finishCliantTalkTurn()
end
function Bsm306.processEvent003_5_1(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:say(A0_48, 42, 0)
  A2_50:say(A0_48, 43, 0)
  A2_50:finishCliantTalkTurn()
end
function Bsm306.processEvent003_5_2(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:say(A0_51, 42, 0)
  A2_53:say(A0_51, 44, 0)
  A2_53:finishCliantTalkTurn()
end
function Bsm306.processEvent003_6(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(2, A1_55)
  A2_56:say(A0_54, 45, 0)
  A2_56:say(A0_54, 46, 0)
  A2_56:finishCliantTalkTurn()
end
function Bsm306.processEvent003_7_1(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:say(A0_57, 47, 0)
  A2_59:say(A0_57, 48, 0)
  A2_59:finishCliantTalkTurn()
end
function Bsm306.processEvent003_7_2(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:say(A0_60, 47, 0)
  A2_62:say(A0_60, 49, 0)
  A2_62:finishCliantTalkTurn()
end
function Bsm306.processEvent003_8(A0_63, A1_64, A2_65)
  A2_65:startCliantTalkTurn(2, A1_64)
  A2_65:say(A0_63, 50, 0)
  A2_65:say(A0_63, 51, 0)
  A2_65:finishCliantTalkTurn()
end
function Bsm306.processEvent003_9(A0_66, A1_67, A2_68)
  A2_68:startCliantTalkTurn(2, A1_67)
  A2_68:say(A0_66, 52, 0)
  A2_68:say(A0_66, 53, 0)
  A2_68:finishCliantTalkTurn()
end
function Bsm306.processEvent003_10(A0_69, A1_70, A2_71)
  A2_71:startCliantTalkTurn(2, A1_70)
  A2_71:say(A0_69, 54, 0)
  A2_71:say(A0_69, 55, 0)
  A2_71:finishCliantTalkTurn()
end
function Bsm306.processEvent003_11(A0_72, A1_73, A2_74)
  A2_74:startCliantTalkTurn(2, A1_73)
  A2_74:say(A0_72, 56, 0)
  A2_74:say(A0_72, 57, 0)
  A2_74:finishCliantTalkTurn()
end
function Bsm306.processEvent030_2(A0_75, A1_76, A2_77)
  A2_77:startCliantTalkTurn(2, A1_76)
  A2_77:say(A0_75, 67, 0)
  A2_77:say(A0_75, 68, 0)
  A2_77:finishCliantTalkTurn()
end
function Bsm306.processEvent030_3(A0_78, A1_79, A2_80)
  A2_80:startCliantTalkTurn(2, A1_79)
  A2_80:say(A0_78, 69, 0)
  A2_80:finishCliantTalkTurn()
end
function Bsm306.processEvent030_4(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(2, A1_82)
  A2_83:say(A0_81, 70, 0)
  A2_83:finishCliantTalkTurn()
end
function Bsm306.processEvent030_5(A0_84, A1_85, A2_86)
  A2_86:startCliantTalkTurn(2, A1_85)
  A2_86:say(A0_84, 71, 0)
  A2_86:say(A0_84, 72, 0)
  A2_86:finishCliantTalkTurn()
end
function Bsm306.processEvent030_6(A0_87, A1_88, A2_89)
  A2_89:startCliantTalkTurn(2, A1_88)
  A2_89:say(A0_87, 73, 0)
  A2_89:say(A0_87, 74, 0)
  A2_89:finishCliantTalkTurn()
end
function Bsm306.processEvent030_7(A0_90, A1_91, A2_92)
  A2_92:startCliantTalkTurn(2, A1_91)
  A2_92:say(A0_90, 75, 0)
  A2_92:say(A0_90, 76, 0)
  A2_92:finishCliantTalkTurn()
end
function Bsm306.processEvent030_8(A0_93, A1_94, A2_95)
  A2_95:startCliantTalkTurn(2, A1_94)
  A2_95:say(A0_93, 77, 0)
  A2_95:say(A0_93, 78, 0)
  A2_95:finishCliantTalkTurn()
end
function Bsm306.processEvent030_9(A0_96, A1_97, A2_98)
  A2_98:startCliantTalkTurn(2, A1_97)
  A2_98:say(A0_96, 79, 0)
  A2_98:say(A0_96, 80, 0)
  A2_98:finishCliantTalkTurn()
end
function Bsm306.processEvent030_10(A0_99, A1_100, A2_101)
  A2_101:startCliantTalkTurn(2, A1_100)
  A2_101:say(A0_99, 81, 0)
  A2_101:say(A0_99, 82, 0)
  A2_101:finishCliantTalkTurn()
end
function Bsm306.processEvent030_11(A0_102, A1_103, A2_104)
  A2_104:startCliantTalkTurn(2, A1_103)
  A2_104:say(A0_102, 83, 0)
  A2_104:say(A0_102, 84, 0)
  A2_104:finishCliantTalkTurn()
end
function Bsm306.danceIsland_problem01(A0_105, A1_106, A2_107, A3_108)
  local L4_109
  L4_109 = A2_107.startCliantTalkTurn
  L4_109(A2_107, 2, A1_106)
  L4_109 = 2
  if A3_108 == true then
    worldMaster:say(A0_105, 95, 1, 0)
    worldMaster:say(A0_105, 94, 1, 1)
    L4_109 = A2_107:ask(A0_105, 109, 2)
    if L4_109 == 1 then
      worldMaster:say(A0_105, 112)
    else
    end
  else
    A2_107:say(A0_105, 96, 0)
  end
  A2_107:finishCliantTalkTurn()
  return L4_109
end
function Bsm306.danceIsland_problem02(A0_110, A1_111, A2_112, A3_113)
  local L4_114
  L4_114 = A2_112.startCliantTalkTurn
  L4_114(A2_112, 2, A1_111)
  L4_114 = 2
  if A3_113 == true then
    worldMaster:say(A0_110, 95, 1, 0)
    worldMaster:say(A0_110, 94, 1, 1)
    L4_114 = A2_112:ask(A0_110, 109, 2)
    if L4_114 == 1 then
      worldMaster:say(A0_110, 112)
    else
    end
  else
    A2_112:say(A0_110, 97, 0)
  end
  A2_112:finishCliantTalkTurn()
  return L4_114
end
function Bsm306.danceIsland_problem03(A0_115, A1_116, A2_117, A3_118)
  local L4_119
  L4_119 = A2_117.startCliantTalkTurn
  L4_119(A2_117, 2, A1_116)
  L4_119 = 2
  if A3_118 == true then
    worldMaster:say(A0_115, 98, 1, 0)
    worldMaster:say(A0_115, 94, 1, 1)
    L4_119 = A2_117:ask(A0_115, 109, 2)
    if L4_119 == 1 then
      worldMaster:say(A0_115, 112)
    else
    end
  else
    A2_117:say(A0_115, 99, 0)
  end
  A2_117:finishCliantTalkTurn()
  return L4_119
end
function Bsm306.danceIsland_problem04(A0_120, A1_121, A2_122, A3_123)
  local L4_124
  L4_124 = A2_122.startCliantTalkTurn
  L4_124(A2_122, 2, A1_121)
  L4_124 = 2
  if A3_123 == true then
    worldMaster:say(A0_120, 98, 1, 0)
    worldMaster:say(A0_120, 94, 1, 1)
    L4_124 = A2_122:ask(A0_120, 109, 2)
    if L4_124 == 1 then
      worldMaster:say(A0_120, 112)
    else
    end
  else
    A2_122:say(A0_120, 100, 0)
  end
  A2_122:finishCliantTalkTurn()
  return L4_124
end
function Bsm306.danceIsland_problem05(A0_125, A1_126, A2_127, A3_128)
  local L4_129
  L4_129 = A2_127.startCliantTalkTurn
  L4_129(A2_127, 2, A1_126)
  L4_129 = 2
  if A3_128 == true then
    worldMaster:say(A0_125, 101, 1, 0)
    worldMaster:say(A0_125, 94, 1, 2)
    L4_129 = A2_127:ask(A0_125, 109, 2)
    if L4_129 == 1 then
      worldMaster:say(A0_125, 112)
    else
    end
  else
    A2_127:say(A0_125, 102, 0)
  end
  A2_127:finishCliantTalkTurn()
  return L4_129
end
function Bsm306.danceIsland_problem06(A0_130, A1_131, A2_132, A3_133)
  local L4_134
  L4_134 = A2_132.startCliantTalkTurn
  L4_134(A2_132, 2, A1_131)
  L4_134 = 2
  if A3_133 == true then
    worldMaster:say(A0_130, 101, 1, 0)
    worldMaster:say(A0_130, 94, 1, 2)
    L4_134 = A2_132:ask(A0_130, 109, 2)
    if L4_134 == 1 then
      worldMaster:say(A0_130, 112)
    else
    end
  else
    A2_132:say(A0_130, 103, 0)
  end
  A2_132:finishCliantTalkTurn()
  return L4_134
end
function Bsm306.danceIsland_problem07(A0_135, A1_136, A2_137, A3_138)
  local L4_139
  L4_139 = A2_137.startCliantTalkTurn
  L4_139(A2_137, 2, A1_136)
  L4_139 = 2
  if A3_138 == true then
    worldMaster:say(A0_135, 104, 1, 0)
    worldMaster:say(A0_135, 94, 1, 1)
    L4_139 = A2_137:ask(A0_135, 109, 2)
    if L4_139 == 1 then
      worldMaster:say(A0_135, 112)
    else
    end
  else
    A2_137:say(A0_135, 105, 0)
    A2_137:say(A0_135, 106, 0)
  end
  A2_137:finishCliantTalkTurn()
  return L4_139
end
function Bsm306.danceIsland_problem08(A0_140, A1_141, A2_142, A3_143)
  local L4_144
  L4_144 = A2_142.startCliantTalkTurn
  L4_144(A2_142, 2, A1_141)
  L4_144 = 2
  if A3_143 == true then
    worldMaster:say(A0_140, 104, 1, 0)
    worldMaster:say(A0_140, 94, 1, 1)
    L4_144 = A2_142:ask(A0_140, 109, 2)
    if L4_144 == 1 then
      worldMaster:say(A0_140, 112)
    else
    end
  else
    A2_142:say(A0_140, 107, 0)
    A2_142:say(A0_140, 108, 0)
  end
  A2_142:finishCliantTalkTurn()
  return L4_144
end
function Bsm306.danceIsland_picked01(A0_145, A1_146, A2_147)
  return (A2_147:ask(A0_145, 126, 2))
end
function Bsm306.danceIsland_changeItem(A0_148, A1_149, A2_150, A3_151)
  worldMaster:say(A0_148, 122, 1, 0)
  return (A2_150:ask(A0_148, 123, 2))
end
function Bsm306.danceIsland_solve01(A0_152, A1_153, A2_154)
  worldMaster:say(A0_152, 129, 2)
end
function Bsm306.danceIsland_solve02(A0_155, A1_156, A2_157)
  worldMaster:say(A0_155, 129, 2)
end
function Bsm306.danceIsland_solve03(A0_158, A1_159, A2_160)
  worldMaster:say(A0_158, 129, 1)
end
function Bsm306.danceIsland_solve04(A0_161, A1_162, A2_163)
  worldMaster:say(A0_161, 129, 1)
end
function Bsm306.danceIsland_solve05(A0_164, A1_165, A2_166)
  worldMaster:say(A0_164, 129, 2)
end
function Bsm306.danceIsland_solve06(A0_167, A1_168, A2_169)
  worldMaster:say(A0_167, 129, 2)
end
function Bsm306.danceIsland_solve07(A0_170, A1_171, A2_172)
  worldMaster:say(A0_170, 129, 1)
end
function Bsm306.danceIsland_solve08(A0_173, A1_174, A2_175)
  worldMaster:say(A0_173, 129, 1)
end
function Bsm306.processFadeOut(A0_176, A1_177, A2_178)
  A0_176:startFadeOutCutSceneDefault(A1_177)
end
function Bsm306.processFadeIn(A0_179, A1_180, A2_181)
  A0_179:startFadeInCutSceneDefault(A1_180)
end
