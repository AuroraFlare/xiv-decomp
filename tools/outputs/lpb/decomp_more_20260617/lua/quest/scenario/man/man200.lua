require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man200", "ScenarioBaseClass")
function Man200.initText(A0_0)
  A0_0:_loadTextDataPermanently(1557, "man200")
end
function Man200.pE00(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A3_4 = "???"
  A4_5 = 1
  A5_6 = 1
  A6_7 = 1
  A0_1:startSnpcNQCutScene("man20100", 1, A3_4, A4_5, A5_6, A6_7, A7_8)
  A0_1:startFadeInCutSceneAfterWarp(A1_2)
end
function Man200.processEvent000_2(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:say(A0_9, 74, 0)
  A2_11:say(A0_9, 75, 0)
  A2_11:say(A0_9, 76, 0)
  A2_11:finishCliantTalkTurn()
end
function Man200.processEvent000_3(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:_runCharaScheduler(354172928)
  A2_14:say(A0_12, 215, 0)
  A2_14:finishCliantTalkTurn()
end
function Man200.processEvent000_4(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:_runCharaScheduler(354168832)
  A2_17:say(A0_15, 216, 0)
  A2_17:say(A0_15, 217, 0)
  A2_17:finishCliantTalkTurn()
end
function Man200.processEvent000_5(A0_18, A1_19, A2_20)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:_runCharaScheduler(354177024)
  A2_20:say(A0_18, 218, 0)
  A2_20:say(A0_18, 219, 0)
  A2_20:finishCliantTalkTurn()
end
function Man200.processEvent000_6(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 220, 0)
  A2_23:say(A0_21, 221, 0)
  A2_23:finishCliantTalkTurn()
end
function Man200.processEvent000_7(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(2, A1_25)
  A2_26:_runCharaScheduler(354168832)
  A2_26:say(A0_24, 222, 0)
  A2_26:finishCliantTalkTurn()
end
function Man200.processEvent000_8(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(1, A1_28)
  A2_29:_runCharaScheduler(67727360)
  A2_29:say(A0_27, 223, 0)
  A2_29:say(A0_27, 224, 0)
  A2_29:finishCliantTalkTurn()
end
function Man200.processEvent000_9(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:_runCharaScheduler(67723264)
  A2_32:say(A0_30, 225, 0)
  A2_32:say(A0_30, 226, 0)
  A2_32:finishCliantTalkTurn()
end
function Man200.processEvent000_10(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:say(A0_33, 227, 0)
  A2_35:say(A0_33, 228, 0)
  A2_35:finishCliantTalkTurn()
end
function Man200.processEvent000_11(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:_runCharaScheduler(354177024)
  A2_38:say(A0_36, 229, 0)
  A2_38:say(A0_36, 230, 0)
  A2_38:finishCliantTalkTurn()
end
function Man200.processEvent000_12(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(1, A1_40)
  A2_41:_runCharaScheduler(354168832)
  A2_41:say(A0_39, 231, 0)
  A2_41:finishCliantTalkTurn()
end
function Man200.processEvent000_13(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:_runCharaScheduler(354172928)
  A2_44:say(A0_42, 232, 0)
  A2_44:say(A0_42, 233, 0)
  A2_44:finishCliantTalkTurn()
end
function Man200.processEvent000_14(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 234, 0)
  A2_47:finishCliantTalkTurn()
end
function Man200.processEvent000_15(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:_runCharaScheduler(67723264)
  A2_50:say(A0_48, 235, 0)
  A2_50:finishCliantTalkTurn()
end
function Man200.processEvent000_16(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:_runCharaScheduler(354086912)
  A2_53:say(A0_51, 236, 0)
  A2_53:finishCliantTalkTurn()
end
function Man200.processEvent000_17(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(2, A1_55)
  A2_56:_runCharaScheduler(354168832)
  A2_56:say(A0_54, 70, 0)
  A2_56:finishCliantTalkTurn()
end
function Man200.processEvent000_18(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:say(A0_57, 237, 0)
  A2_59:finishCliantTalkTurn()
end
function Man200.processEvent000_19(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:_runCharaScheduler(354172928)
  A2_62:say(A0_60, 238, 0)
  A2_62:finishCliantTalkTurn()
end
function Man200.processEvent000_20(A0_63, A1_64, A2_65)
  A2_65:startCliantTalkTurn(2, A1_64)
  A2_65:say(A0_63, 239, 0)
  A2_65:finishCliantTalkTurn()
end
function Man200.pE10(A0_66, A1_67, A2_68, A3_69, A4_70, A5_71, A6_72, A7_73)
  A0_66:startFadeOutCutSceneDefault(A1_67)
  A3_69 = "???"
  A4_70 = 1
  A5_71 = 1
  A6_72 = 1
  A0_66:startSnpcNQCutScene("man20110", 1, A3_69, A4_70, A5_71, A6_72, A7_73)
  A0_66:startFadeInCutSceneAfterWarp(A1_67)
end
function Man200.pE20(A0_74, A1_75, A2_76, A3_77, A4_78, A5_79, A6_80, A7_81)
  if worldMaster:ask(A0_74, worldMaster, 51030, 2) == 1 then
    A0_74:runCharaSchedulerPastAreaIn(A1_75)
    A0_74:startFadeOutCutSceneDefault(A1_75)
    A3_77 = "???"
    A4_78 = 1
    A5_79 = 1
    A6_80 = 1
    A0_74:startSnpcNQCutScene("man20120", 1, A3_77, A4_78, A5_79, A6_80, A7_81)
    A0_74:startFadeInCutSceneDefault(A1_75)
    return (worldMaster:ask(A0_74, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Man200.processEvent020_2(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 240, 0)
  A2_84:say(A0_82, 241, 0)
  A2_84:say(A0_82, 242, 0)
  A2_84:finishCliantTalkTurn()
end
function Man200.processEvent020_3(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 243, 0)
  A2_87:say(A0_85, 244, 0)
  A2_87:finishCliantTalkTurn()
end
function Man200.processEvent020_4(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 245, 0)
  A2_90:say(A0_88, 246, 0)
  A2_90:finishCliantTalkTurn()
end
function Man200.processEvent020_5(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 72, 0)
  A2_93:say(A0_91, 247, 0)
  A2_93:finishCliantTalkTurn()
end
function Man200.processEvent020_6(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 248, 0)
  A2_96:say(A0_94, 249, 0)
  A2_96:finishCliantTalkTurn()
end
function Man200.processEvent020_7(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 71, 0)
  A2_99:say(A0_97, 250, 0)
  A2_99:finishCliantTalkTurn()
end
function Man200.processEvent020_8(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 73, 0)
  A2_102:say(A0_100, 251, 0)
  A2_102:finishCliantTalkTurn()
end
function Man200.processEvent020_9(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 252, 0)
  A2_105:say(A0_103, 253, 0)
  A2_105:finishCliantTalkTurn()
end
function Man200.processEvent020_10(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 254, 0)
  A2_108:say(A0_106, 255, 0)
  A2_108:finishCliantTalkTurn()
end
function Man200.processEvent020_11(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 256, 0)
  A2_111:say(A0_109, 257, 0)
  A2_111:finishCliantTalkTurn()
end
function Man200.processEvent020_12(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 258, 0)
  A2_114:say(A0_112, 259, 0)
  A2_114:finishCliantTalkTurn()
end
function Man200.processEvent020_13(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 260, 0)
  A2_117:say(A0_115, 261, 0)
  A2_117:finishCliantTalkTurn()
end
function Man200.processEvent020_14(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 262, 0)
  A2_120:say(A0_118, 263, 0)
  A2_120:finishCliantTalkTurn()
end
function Man200.pE25(A0_121, A1_122, A2_123, A3_124, A4_125, A5_126, A6_127, A7_128)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:say(A0_121, 28, 0)
  if A2_123:ask(A0_121, 430, 2) == 1 then
    A0_121:startFadeOutCutSceneDefault(A1_122)
    A0_121:startSnpcNQCutScene("man20130", 1, "???", A4_125, A5_126, A6_127, A7_128)
    A0_121:startFadeInCutSceneAfterWarp(A1_122)
  else
    A2_123:say(A0_121, 29, 0)
    A2_123:say(A0_121, 30, 0)
  end
  A2_123:finishCliantTalkTurn()
  return (A2_123:ask(A0_121, 430, 2))
end
function Man200.processEvent040_2(A0_129, A1_130, A2_131)
  A2_131:startCliantTalkTurn(2, A1_130)
  A2_131:say(A0_129, 434, 0)
  A2_131:finishCliantTalkTurn()
end
function Man200.pE050(A0_132, A1_133, A2_134, A3_135, A4_136, A5_137, A6_138, A7_139)
  A4_136 = A0_132:getSnpcActorClassID(A4_136)
  A2_134:startCliantTalkTurn(2, A1_133)
  A2_134:say(A0_132, 436, 0)
  A0_132:startFadeOutCutSceneDefault(A1_133)
  A0_132:startSnpcNQCutScene("man20150", 1, "???", A4_136, A5_137, A6_138, A7_139)
  A0_132:startFadeInCutSceneAfterWarp(A1_133)
end
function Man200.pE055(A0_140, A1_141, A2_142, A3_143, A4_144, A5_145, A6_146, A7_147)
  if A5_145 == 1 then
    A2_142:say(A0_140, 292, 0)
    break
  else
  end
  if A5_145 == 2 then
    A2_142:say(A0_140, 293, 0)
    break
  else
  end
  if A5_145 == 3 then
    A2_142:say(A0_140, 294, 0)
    break
  else
  end
  if A5_145 == 4 then
    A2_142:say(A0_140, 295, 0)
    break
  else
  end
  if A5_145 == 5 then
    A2_142:say(A0_140, 296, 0)
    break
  else
  end
  if A5_145 == 6 then
    A2_142:say(A0_140, 297, 0)
    break
  else
  end
  if A5_145 == 7 then
    A2_142:say(A0_140, 299, 0)
    break
  else
  end
  if A5_145 == 8 then
    A2_142:say(A0_140, 298, 0)
    break
  else
  end
  if A5_145 == 9 then
    A2_142:say(A0_140, 300, 0)
    break
  else
  end
  A4_144 = A0_140:getSnpcActorClassID(A4_144)
  A0_140:startFadeOutCutSceneDefault(A1_141)
  A0_140:startSnpcNQCutScene("man20155", 1, A3_143, A4_144, A5_145, A6_146, A7_147, A3_143)
  A0_140:startFadeInCutSceneDefault(A1_141)
end
function Man200.pE050_2(A0_148, A1_149, A2_150, A3_151, A4_152, A5_153, A6_154, A7_155)
  local L8_156
  L8_156 = A0_148.getSnpcSexualityToSkin
  L8_156 = L8_156(A0_148, A5_153)
  A2_150:startCliantTalkTurn(2, A1_149)
  A2_150:say(A0_148, 437, 0)
  A2_150:say(A0_148, 438, 0, L8_156)
  A2_150:finishCliantTalkTurn()
end
function Man200.pE060(A0_157, A1_158, A2_159, A3_160, A4_161, A5_162, A6_163, A7_164)
  A4_161 = A0_157:getSnpcActorClassID(A4_161)
  A0_157:startFadeOutCutSceneDefault(A1_158)
  A0_157:startSnpcNQCutScene("man20160", 1, A3_160, A4_161, A5_162, A6_163, A7_164)
  A0_157:startFadeInCutSceneDefault(A1_158)
end
function Man200.processSnpcSelect(A0_165, A1_166, A2_167)
  local L3_168, L4_169, L5_170, L6_171, L7_172, L8_173, L9_174, L10_175, L11_176, L12_177, L13_178, L14_179, L15_180, L16_181, L17_182, L18_183
  L9_174 = false
  L10_175, L11_176, L12_177 = nil, nil, nil
  L13_178 = 0
  L15_180 = A2_167
  L14_179 = A2_167.startCliantTalkTurn
  L16_181 = 2
  L17_182 = A1_166
  L14_179(L15_180, L16_181, L17_182)
  L15_180 = A2_167
  L14_179 = A2_167._runCharaScheduler
  L16_181 = 353959936
  L14_179(L15_180, L16_181)
  L15_180 = A2_167
  L14_179 = A2_167.say
  L16_181 = A0_165
  L17_182 = 43
  L18_183 = 0
  L14_179(L15_180, L16_181, L17_182, L18_183)
  L15_180 = A2_167
  L14_179 = A2_167.say
  L16_181 = A0_165
  L17_182 = 44
  L18_183 = 0
  L14_179(L15_180, L16_181, L17_182, L18_183)
  L15_180 = A2_167
  L14_179 = A2_167.say
  L16_181 = A0_165
  L17_182 = 45
  L18_183 = 0
  L14_179(L15_180, L16_181, L17_182, L18_183)
  L15_180 = A2_167
  L14_179 = A2_167.say
  L16_181 = A0_165
  L17_182 = 46
  L18_183 = 0
  L14_179(L15_180, L16_181, L17_182, L18_183)
  while true do
    if L13_178 == 0 then
      L15_180 = A2_167
      L14_179 = A2_167.say
      L16_181 = A0_165
      L17_182 = 47
      L18_183 = 0
      L14_179(L15_180, L16_181, L17_182, L18_183)
      L13_178 = 1
    else
      L15_180 = A2_167
      L14_179 = A2_167.say
      L16_181 = A0_165
      L17_182 = 415
      L18_183 = 0
      L14_179(L15_180, L16_181, L17_182, L18_183)
    end
    L15_180 = A2_167
    L14_179 = A2_167.ask
    L16_181 = A0_165
    L17_182 = 77
    L18_183 = 6
    L14_179 = L14_179(L15_180, L16_181, L17_182, L18_183)
    L12_177 = L14_179
    if L12_177 == 1 then
      L11_176 = 1
    elseif L12_177 == 2 then
      L11_176 = 17
    elseif L12_177 == 3 then
      L11_176 = 33
    elseif L12_177 == 4 then
      L11_176 = 49
    elseif L12_177 == 5 then
      L11_176 = 65
    else
      L14_179 = -1
      L15_180 = -1
      return L14_179, L15_180
    end
    L10_175 = 1070000 + L11_176
    L15_180 = A0_165
    L14_179 = A0_165.getSnpcCandidacyNumber
    L16_181 = L10_175
    L18_183 = L14_179(L15_180, L16_181)
    A0_165:startFadeOutCutSceneDefault(A1_166)
    A0_165:startFadeInCutSceneDefault(A1_166)
    if A0_165:startNQCutScene("man20140", 2, L14_179, L15_180, L16_181, L17_182, L18_183, 1, L12_177) == 1 then
      L5_170 = L15_180
    elseif A0_165:startNQCutScene("man20140", 2, L14_179, L15_180, L16_181, L17_182, L18_183, 1, L12_177) == 2 then
      L5_170 = L16_181
    elseif A0_165:startNQCutScene("man20140", 2, L14_179, L15_180, L16_181, L17_182, L18_183, 1, L12_177) == 3 then
      L5_170 = L17_182
    elseif A0_165:startNQCutScene("man20140", 2, L14_179, L15_180, L16_181, L17_182, L18_183, 1, L12_177) == 4 then
      L5_170 = L18_183
    elseif A0_165:startNQCutScene("man20140", 2, L14_179, L15_180, L16_181, L17_182, L18_183, 1, L12_177) == 5 then
      L5_170 = L18_183
    elseif A0_165:startNQCutScene("man20140", 2, L14_179, L15_180, L16_181, L17_182, L18_183, 1, L12_177) == -1 then
      L5_170 = -1
      L12_177 = -1
    end
    if true == true then
      break
    end
  end
  if L5_170 ~= -1 then
    L15_180 = A2_167
    L14_179 = A2_167.say
    L16_181 = A0_165
    L17_182 = 449
    L18_183 = 0
    L14_179(L15_180, L16_181, L17_182, L18_183)
    L15_180 = A2_167
    L14_179 = A2_167.ask
    L16_181 = A0_165
    L17_182 = 450
    L18_183 = 2
    L14_179 = L14_179(L15_180, L16_181, L17_182, L18_183)
    if L14_179 == 2 then
      L16_181 = A2_167
      L15_180 = A2_167.say
      L17_182 = A0_165
      L18_183 = 453
      L15_180(L16_181, L17_182, L18_183, 0)
      L5_170 = -1
      L12_177 = -1
    else
      L16_181 = A2_167
      L15_180 = A2_167.say
      L17_182 = A0_165
      L18_183 = 454
      L15_180(L16_181, L17_182, L18_183, 0)
      L16_181 = A2_167
      L15_180 = A2_167.say
      L17_182 = A0_165
      L18_183 = 455
      L15_180(L16_181, L17_182, L18_183, 0)
    end
  end
  L15_180 = A2_167
  L14_179 = A2_167.finishCliantTalkTurn
  L14_179(L15_180)
  L14_179 = L5_170
  L15_180 = L12_177
  return L14_179, L15_180
end
function Man200.processSnpcReselect(A0_184, A1_185, A2_186)
  local L3_187, L4_188, L5_189, L6_190, L7_191, L8_192, L9_193, L10_194, L11_195, L12_196, L13_197, L14_198, L15_199, L16_200, L17_201, L18_202
  L4_188 = A2_186
  L3_187 = A2_186.startCliantTalkTurn
  L5_189 = 2
  L6_190 = A1_185
  L3_187(L4_188, L5_189, L6_190)
  L3_187, L4_188, L5_189, L6_190, L7_191, L8_192 = nil, nil, nil, nil, nil, nil
  L9_193 = false
  L10_194, L11_195, L12_196 = nil, nil, nil
  L13_197 = 0
  while true do
    if L13_197 == 0 then
      L13_197 = 1
    else
      L15_199 = A2_186
      L14_198 = A2_186.say
      L16_200 = A0_184
      L17_201 = 415
      L18_202 = 0
      L14_198(L15_199, L16_200, L17_201, L18_202)
    end
    L15_199 = A2_186
    L14_198 = A2_186.ask
    L16_200 = A0_184
    L17_201 = 77
    L18_202 = 6
    L14_198 = L14_198(L15_199, L16_200, L17_201, L18_202)
    L12_196 = L14_198
    if L12_196 == 1 then
      L11_195 = 1
    elseif L12_196 == 2 then
      L11_195 = 17
    elseif L12_196 == 3 then
      L11_195 = 33
    elseif L12_196 == 4 then
      L11_195 = 49
    elseif L12_196 == 5 then
      L11_195 = 65
    else
      L14_198 = -1
      L15_199 = -1
      return L14_198, L15_199
    end
    L10_194 = 1070000 + L11_195
    L15_199 = A0_184
    L14_198 = A0_184.getSnpcCandidacyNumber
    L16_200 = L10_194
    L18_202 = L14_198(L15_199, L16_200)
    A0_184:startFadeOutCutSceneDefault(A1_185)
    A0_184:startFadeInCutSceneDefault(A1_185)
    if A0_184:startNQCutScene("man20140", 2, L14_198, L15_199, L16_200, L17_201, L18_202, 1, L12_196) == 1 then
      L5_189 = L15_199
    elseif A0_184:startNQCutScene("man20140", 2, L14_198, L15_199, L16_200, L17_201, L18_202, 1, L12_196) == 2 then
      L5_189 = L16_200
    elseif A0_184:startNQCutScene("man20140", 2, L14_198, L15_199, L16_200, L17_201, L18_202, 1, L12_196) == 3 then
      L5_189 = L17_201
    elseif A0_184:startNQCutScene("man20140", 2, L14_198, L15_199, L16_200, L17_201, L18_202, 1, L12_196) == 4 then
      L5_189 = L18_202
    elseif A0_184:startNQCutScene("man20140", 2, L14_198, L15_199, L16_200, L17_201, L18_202, 1, L12_196) == 5 then
      L5_189 = L18_202
    elseif A0_184:startNQCutScene("man20140", 2, L14_198, L15_199, L16_200, L17_201, L18_202, 1, L12_196) == -1 then
      L5_189 = -1
      L12_196 = -1
    end
    if true == true then
      break
    end
  end
  if L5_189 ~= -1 then
    L15_199 = A2_186
    L14_198 = A2_186.say
    L16_200 = A0_184
    L17_201 = 449
    L18_202 = 0
    L14_198(L15_199, L16_200, L17_201, L18_202)
    L15_199 = A2_186
    L14_198 = A2_186.ask
    L16_200 = A0_184
    L17_201 = 450
    L18_202 = 2
    L14_198 = L14_198(L15_199, L16_200, L17_201, L18_202)
    if L14_198 == 2 then
      L16_200 = A2_186
      L15_199 = A2_186.say
      L17_201 = A0_184
      L18_202 = 453
      L15_199(L16_200, L17_201, L18_202, 0)
      L5_189 = -1
      L12_196 = -1
    end
  else
  end
  L14_198 = L5_189
  L15_199 = L12_196
  return L14_198, L15_199
end
function Man200.pEN(A0_203, A1_204, A2_205, A3_206)
  local L4_207
  L4_207 = A2_205.startCliantTalkTurn
  L4_207(A2_205, 2, A1_204)
  L4_207 = A3_206
  if L4_207 == 1 then
    A2_205:say(A0_203, 283, 0)
    break
  else
  end
  if L4_207 == 2 then
    A2_205:say(A0_203, 284, 0)
    break
  else
  end
  if L4_207 == 3 then
    A2_205:say(A0_203, 285, 0)
    break
  else
  end
  if L4_207 == 4 then
    A2_205:say(A0_203, 286, 0)
    break
  else
  end
  if L4_207 == 5 then
    A2_205:say(A0_203, 287, 0)
    break
  else
  end
  if L4_207 == 6 then
    A2_205:say(A0_203, 288, 0)
    break
  else
  end
  if L4_207 == 7 then
    A2_205:say(A0_203, 290, 0)
    break
  else
  end
  if L4_207 == 8 then
    A2_205:say(A0_203, 289, 0)
    break
  else
  end
  if L4_207 == 9 then
    A2_205:say(A0_203, 291, 0)
    break
  else
  end
  L4_207 = 1070005
  return (A0_203:inputSnpcName(A1_204, A2_205, L4_207))
end
