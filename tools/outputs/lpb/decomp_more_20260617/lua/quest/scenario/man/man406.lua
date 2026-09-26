require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man406", "ScenarioBaseClass")
function Man406.initText(A0_0)
  A0_0:_loadTextDataPermanently(1635, "man406")
end
function Man406.pES(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8)
  A4_5 = A0_1:getSnpcActorClassID(A4_5)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  if A0_1:startSnpcNQCutScene("man40600", 2, A3_4, A4_5, A5_6, A6_7, A7_8) == 1 then
    A0_1:startFadeInCutSceneAfterWarp(A1_2)
  else
    A0_1:startFadeInCutSceneDefault(A1_2)
  end
  return (A0_1:startSnpcNQCutScene("man40600", 2, A3_4, A4_5, A5_6, A6_7, A7_8))
end
function Man406.pE01(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14, A6_15, A7_16)
  A2_11:startCliantTalkTurn(1, A1_10)
  if A5_14 == 1 then
    A2_11:say(A0_9, 361, 0)
    break
  else
  end
  if A5_14 == 2 then
    A2_11:say(A0_9, 362, 0)
    break
  else
  end
  if A5_14 == 3 then
    A2_11:say(A0_9, 363, 0)
    break
  else
  end
  if A5_14 == 4 then
    A2_11:say(A0_9, 364, 0)
    break
  else
  end
  if A5_14 == 5 then
    A2_11:say(A0_9, 365, 0)
    break
  else
  end
  if A5_14 == 6 then
    A2_11:say(A0_9, 366, 0)
    break
  else
  end
  if A5_14 == 7 then
    A2_11:say(A0_9, 368, 0)
    break
  else
  end
  if A5_14 == 8 then
    A2_11:say(A0_9, 367, 0)
    break
  else
  end
  if A5_14 == 9 then
    A2_11:say(A0_9, 369, 0)
    break
  else
  end
  A2_11:finishCliantTalkTurn()
end
function Man406.processEvent000_1(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 240)
  A2_19:say(A0_17, 241)
  A2_19:finishCliantTalkTurn()
end
function Man406.processEvent000_2(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 242)
  A2_22:finishCliantTalkTurn()
end
function Man406.processEvent000_3(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 243)
  A2_25:say(A0_23, 244)
  A2_25:finishCliantTalkTurn()
end
function Man406.processEvent000_4(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 245)
  A2_28:say(A0_26, 246)
  A2_28:finishCliantTalkTurn()
end
function Man406.processEvent000_5(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 247)
  A2_31:say(A0_29, 248)
  A2_31:finishCliantTalkTurn()
end
function Man406.processEvent000_6(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 249)
  A2_34:say(A0_32, 250)
  A2_34:finishCliantTalkTurn()
end
function Man406.processEvent000_7(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 251)
  A2_37:finishCliantTalkTurn()
end
function Man406.pE10(A0_38, A1_39, A2_40, A3_41, A4_42, A5_43, A6_44, A7_45)
  A4_42 = A0_38:getSnpcActorClassID(A4_42)
  A0_38:startFadeOutCutSceneDefault(A1_39)
  A0_38:startSnpcNQCutScene("man40610", 1, A3_41, A4_42, A5_43, A6_44, A7_45)
  A0_38:startFadeInCutSceneDefault(A1_39)
end
function Man406.processEvent010_1(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 19)
  A2_48:say(A0_46, 20)
  A2_48:finishCliantTalkTurn()
end
function Man406.processEvent010_2(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 21)
  A2_51:finishCliantTalkTurn()
end
function Man406.processEvent010_3(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 22)
  A2_54:finishCliantTalkTurn()
end
function Man406.processEvent010_4(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 252)
  A2_57:say(A0_55, 253)
  A2_57:finishCliantTalkTurn()
end
function Man406.processEvent010_5(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 254)
  A2_60:say(A0_58, 255)
  A2_60:finishCliantTalkTurn()
end
function Man406.processEvent010_6(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 256)
  A2_63:say(A0_61, 257)
  A2_63:finishCliantTalkTurn()
end
function Man406.processEvent010_7(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 356)
  A2_66:finishCliantTalkTurn()
end
function Man406.processEvent010_8(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 370)
  A2_69:say(A0_67, 371)
  A2_69:finishCliantTalkTurn()
end
function Man406.processEvent010_9(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 357)
  A2_72:finishCliantTalkTurn()
end
function Man406.pE15(A0_73, A1_74, A2_75, A3_76, A4_77, A5_78, A6_79, A7_80)
  A4_77 = A0_73:getSnpcActorClassID(A4_77)
  A0_73:startFadeOutCutSceneDefault(A1_74)
  A0_73:startSnpcNQCutScene("man40615", 1, A3_76, A4_77, A5_78, A6_79, A7_80)
  A0_73:startFadeInCutSceneAfterWarp(A1_74)
end
function Man406.pE16(A0_81, A1_82, A2_83, A3_84, A4_85, A5_86, A6_87, A7_88)
  local L8_89
  L8_89 = A0_81.getSnpcSexualityToSkin
  L8_89 = L8_89(A0_81, A5_86)
  A2_83:startCliantTalkTurn(2, A1_82)
  A2_83:say(A0_81, 33, 0)
  A2_83:say(A0_81, 34, 0, A3_84, L8_89)
  A2_83:finishCliantTalkTurn()
end
function Man406.pE17(A0_90, A1_91, A2_92, A3_93, A4_94, A5_95, A6_96, A7_97)
  A2_92:startCliantTalkTurn(2, A1_91)
  A2_92:say(A0_90, 35, 0, A3_93)
  A2_92:finishCliantTalkTurn()
end
function Man406.pE18(A0_98, A1_99, A2_100, A3_101, A4_102, A5_103, A6_104, A7_105)
  local L8_106
  L8_106 = A0_98.getSnpcSexualityToSkin
  L8_106 = L8_106(A0_98, A5_103)
  A2_100:startCliantTalkTurn(2, A1_99)
  A2_100:say(A0_98, 258, 0)
  A2_100:say(A0_98, 259, 0, L8_106)
  A2_100:finishCliantTalkTurn()
end
function Man406.processEvent015_4(A0_107, A1_108, A2_109)
  A2_109:startCliantTalkTurn(2, A1_108)
  A2_109:say(A0_107, 260, 0)
  A2_109:say(A0_107, 261, 0)
  A2_109:finishCliantTalkTurn()
end
function Man406.processEvent015_5(A0_110, A1_111, A2_112)
  A2_112:startCliantTalkTurn(2, A1_111)
  A2_112:say(A0_110, 33, 0)
  A2_112:say(A0_110, 34, 0)
  A2_112:finishCliantTalkTurn()
end
function Man406.processEvent020(A0_113, A1_114, A2_115, A3_116)
  A0_113:startFadeOutCutSceneDefault(A1_114)
  A0_113:startNQCutScene("man40620", 1)
  if A3_116 == true then
    A0_113:startFadeInCutSceneDefault(A1_114)
  else
    A0_113:startFadeInCutSceneAfterWarp(A1_114)
  end
end
function Man406.processEvent025(A0_117, A1_118, A2_119)
  A0_117:startFadeOutCutSceneDefault(A1_118)
  A0_117:startHQCutScene("MAN40625", 1)
  A0_117:startFadeInCutSceneDefault(A1_118)
end
function Man406.pE30(A0_120, A1_121, A2_122, A3_123, A4_124, A5_125, A6_126, A7_127)
  A4_124 = A0_120:getSnpcActorClassID(A4_124)
  A0_120:startFadeOutCutSceneDefault(A1_121)
  A0_120:startSnpcNQCutScene("man40630", 1, A3_123, A4_124, A5_125, A6_126, A7_127)
  A0_120:startSnpcHQCutScene("man40635", 1, A3_123, A4_124, A5_125, A6_126, A7_127)
  A0_120:startNQCutScene("man40645", 1)
  A0_120:startFadeInCutSceneAfterWarp(A1_121)
end
function Man406.processEvent045_1(A0_128, A1_129, A2_130)
  A2_130:startCliantTalkTurn(2, A1_129)
  A2_130:say(A0_128, 38, 0)
  A2_130:finishCliantTalkTurn()
end
function Man406.processEvent045_2(A0_131, A1_132, A2_133)
  A2_133:startCliantTalkTurn(2, A1_132)
  A2_133:say(A0_131, 39, 0)
  A2_133:finishCliantTalkTurn()
end
function Man406.processEvent045_3(A0_134, A1_135, A2_136)
  A2_136:startCliantTalkTurn(2, A1_135)
  A2_136:say(A0_134, 40, 0)
  A2_136:finishCliantTalkTurn()
end
function Man406.processEvent045_4(A0_137, A1_138, A2_139)
  A2_139:startCliantTalkTurn(2, A1_138)
  A2_139:say(A0_137, 41, 0)
  A2_139:finishCliantTalkTurn()
end
function Man406.processEvent045_5(A0_140, A1_141, A2_142)
  A2_142:startCliantTalkTurn(2, A1_141)
  A2_142:say(A0_140, 42, 0)
  A2_142:finishCliantTalkTurn()
end
function Man406.pE50(A0_143, A1_144, A2_145, A3_146, A4_147, A5_148, A6_149, A7_150)
  A4_147 = A0_143:getSnpcActorClassID(A4_147)
  A0_143:startFadeOutCutSceneDefault(A1_144)
  A0_143:startSnpcNQCutScene("man40650", 1, A3_146, A4_147, A5_148, A6_149, A7_150, A7_150)
  A0_143:startFadeInCutSceneAfterWarp(A1_144)
end
function Man406.pE52(A0_151, A1_152, A2_153, A3_154, A4_155, A5_156, A6_157, A7_158)
  A2_153:startCliantTalkTurn(1, A1_152)
  if A5_156 == 1 then
    A2_153:say(A0_151, 347, 0)
    break
  else
  end
  if A5_156 == 2 then
    A2_153:say(A0_151, 348, 0)
    break
  else
  end
  if A5_156 == 3 then
    A2_153:say(A0_151, 349, 0)
    break
  else
  end
  if A5_156 == 4 then
    A2_153:say(A0_151, 350, 0)
    break
  else
  end
  if A5_156 == 5 then
    A2_153:say(A0_151, 351, 0)
    break
  else
  end
  if A5_156 == 6 then
    A2_153:say(A0_151, 352, 0)
    break
  else
  end
  if A5_156 == 7 then
    A2_153:say(A0_151, 354, 0)
    break
  else
  end
  if A5_156 == 8 then
    A2_153:say(A0_151, 353, 0)
    break
  else
  end
  if A5_156 == 9 then
    A2_153:say(A0_151, 355, 0)
    break
  else
  end
  A2_153:finishCliantTalkTurn()
end
function Man406.pE60(A0_159, A1_160, A2_161, A3_162, A4_163, A5_164, A6_165, A7_166)
  local L8_167
  L8_167 = A0_159.getSnpcSexualityToSkin
  L8_167 = L8_167(A0_159, A5_164)
  A0_159:startFadeOutCutSceneDefault(A1_160)
  A0_159:startSnpcNQCutScene("man40660", 1, A3_162, A4_163, A5_164, A6_165, A7_166, L8_167)
  A0_159:startFadeInCutSceneAfterWarp(A1_160)
end
function Man406.pE61(A0_168, A1_169, A2_170, A3_171, A4_172, A5_173, A6_174, A7_175)
  local L8_176
  L8_176 = A0_168.getSnpcSexualityToSkin
  L8_176 = L8_176(A0_168, A5_173)
  A2_170:startCliantTalkTurn(2, A1_169)
  A2_170:say(A0_168, 271, 0, L8_176)
  A2_170:say(A0_168, 272, 0)
  A2_170:finishCliantTalkTurn()
end
function Man406.processEvent060_2(A0_177, A1_178, A2_179)
  A2_179:startCliantTalkTurn(2, A1_178)
  A2_179:say(A0_177, 273, 0)
  A2_179:say(A0_177, 274, 0)
  A2_179:finishCliantTalkTurn()
end
function Man406.processEvent060_3(A0_180, A1_181, A2_182)
  A2_182:startCliantTalkTurn(2, A1_181)
  A2_182:say(A0_180, 275, 0)
  A2_182:finishCliantTalkTurn()
end
function Man406.processEvent060_4(A0_183, A1_184, A2_185)
  A2_185:startCliantTalkTurn(2, A1_184)
  A2_185:say(A0_183, 276, 0)
  A2_185:say(A0_183, 277, 0)
  A2_185:finishCliantTalkTurn()
end
function Man406.processEvent060_5(A0_186, A1_187, A2_188)
  A2_188:startCliantTalkTurn(2, A1_187)
  A2_188:say(A0_186, 278, 0)
  A2_188:say(A0_186, 279, 0)
  A2_188:finishCliantTalkTurn()
end
function Man406.processEvent060_6(A0_189, A1_190, A2_191)
  A2_191:startCliantTalkTurn(2, A1_190)
  A2_191:say(A0_189, 280, 0)
  A2_191:say(A0_189, 281, 0)
  A2_191:finishCliantTalkTurn()
end
