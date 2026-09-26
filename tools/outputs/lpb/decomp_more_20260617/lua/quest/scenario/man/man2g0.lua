require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man2g0", "ScenarioBaseClass")
function Man2g0.initText(A0_0)
  A0_0:_loadTextDataPermanently(403, "man2g0")
end
function Man2g0.processEventMiounneStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:finishCliantTalkTurn()
end
function Man2g0.processEvent005_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 238, 0)
  A2_6:say(A0_4, 239, 0)
  A2_6:finishCliantTalkTurn()
end
function Man2g0.processEvent007(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 192, 0)
  A2_9:say(A0_7, 193, 0)
  A2_9:finishCliantTalkTurn()
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("man1g900", 1)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Man2g0.processEvent007_2(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 246, 0)
  if A2_12:ask(A0_10, 240, 2) == 1 then
    A0_10:startFadeOutCutSceneDefault(A1_11)
    A0_10:startHQCutScene("man2g000", 1)
    A0_10:startFadeInCutSceneAfterWarp(A1_11)
  end
  A2_12:finishCliantTalkTurn()
  return (A2_12:ask(A0_10, 240, 2))
end
function Man2g0.processEvent007_2_2(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 246, 0)
  if A2_15:ask(A0_13, 240, 2) == 1 then
    A0_13:startFadeOutCutSceneDefault(A1_14)
    A0_13:startFadeInCutSceneAfterWarp(A1_14)
  end
  A2_15:finishCliantTalkTurn()
  return (A2_15:ask(A0_13, 240, 2))
end
function Man2g0.processEvent007_3(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 243, 0)
  A2_18:say(A0_16, 244, 0)
  A2_18:finishCliantTalkTurn()
end
function Man2g0.processEvent010(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("man2g010", 1)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Man2g0.processEvent010_2(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 278, 0)
  A2_24:finishCliantTalkTurn()
end
function Man2g0.processEvent020(A0_25, A1_26, A2_27)
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startNQCutScene("man2g020", 1)
  A0_25:startFadeInCutSceneDefault(A1_26)
end
function Man2g0.processEvent020_2(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 198, 0)
  A2_30:say(A0_28, 199, 0)
  A2_30:say(A0_28, 200, 0)
  A2_30:finishCliantTalkTurn()
end
function Man2g0.processEvent020_3(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 274, 0)
  A2_33:finishCliantTalkTurn()
end
function Man2g0.processEvent030(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 201, 0)
  A2_36:say(A0_34, 202, 0)
  A2_36:finishCliantTalkTurn()
  A0_34:startFadeOutCutSceneDefault(A1_35)
  A0_34:startNQCutScene("man2g030", 1)
  A0_34:startFadeInCutSceneAfterWarp(A1_35)
end
function Man2g0.processEvent030_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 203, 0)
  A2_39:say(A0_37, 204, 0)
  A2_39:finishCliantTalkTurn()
end
function Man2g0.processEvent030_3(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 205, 0)
  A2_42:finishCliantTalkTurn()
end
function Man2g0.processEvent030_4(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 206, 0)
  A2_45:finishCliantTalkTurn()
end
function Man2g0.processEvent030_5(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 207, 0)
  A2_48:finishCliantTalkTurn()
end
function Man2g0.processEvent030_6(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 208, 0)
  A2_51:finishCliantTalkTurn()
end
function Man2g0.processEvent030_7(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 209, 0)
  A2_54:finishCliantTalkTurn()
end
function Man2g0.processEvent030_8(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 247, 0)
  A2_57:finishCliantTalkTurn()
end
function Man2g0.processEvent030_9(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 248, 0)
  A2_60:finishCliantTalkTurn()
end
function Man2g0.processEvent040(A0_61, A1_62, A2_63)
  A0_61:startFadeOutCutSceneDefault(A1_62)
  A0_61:startNQCutScene("man2g040", 1)
  A0_61:startFadeInCutSceneAfterWarp(A1_62)
end
function Man2g0.processEvent040_2(A0_64, A1_65, A2_66)
  A2_66:say(A0_64, 211, 0)
end
function Man2g0.processEvent040_3(A0_67, A1_68, A2_69)
  A2_69:say(A0_67, 212, 0)
end
function Man2g0.processEvent040_4(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 275, 0)
  A2_72:finishCliantTalkTurn()
end
function Man2g0.processEvent040_5(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 276, 0)
  A2_75:finishCliantTalkTurn()
end
function Man2g0.processEvent040_6(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 277, 0)
  A2_78:finishCliantTalkTurn()
end
function Man2g0.processEvent045(A0_79, A1_80, A2_81)
  A2_81:say(A0_79, 182, 0)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 183, 0)
  A2_81:say(A0_79, 184, 0)
  A2_81:finishCliantTalkTurn()
end
function Man2g0.processEvent045_2(A0_82, A1_83, A2_84)
  A2_84:say(A0_82, 182, 0)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 183, 0)
  A2_84:say(A0_82, 184, 0)
  A2_84:finishCliantTalkTurn()
end
function Man2g0.processEvent050(A0_85, A1_86, A2_87)
  A0_85:startFadeOutCutSceneDefault(A1_86)
  A0_85:startNQCutScene("man2g050", 1)
  A0_85:startFadeInCutSceneAfterWarp(A1_86)
end
function Man2g0.processEvent050_2(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 213, 0)
  A2_90:say(A0_88, 214, 0)
  A2_90:finishCliantTalkTurn()
end
function Man2g0.processEvent060(A0_91, A1_92, A2_93)
  A0_91:startFadeOutCutSceneDefault(A1_92)
  A0_91:startNQCutScene("man2g060", 1)
  A0_91:startFadeInCutSceneAfterWarp(A1_92)
end
function Man2g0.processEvent060_2(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 249, 0)
  A2_96:finishCliantTalkTurn()
end
function Man2g0.processEvent060_3(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 250, 0)
  A2_99:finishCliantTalkTurn()
end
function Man2g0.processEvent060_4(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 251, 0)
  A2_102:say(A0_100, 252, 0)
  A2_102:finishCliantTalkTurn()
end
function Man2g0.processEvent060_5(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 253, 0)
  A2_105:say(A0_103, 254, 0)
  A2_105:finishCliantTalkTurn()
end
function Man2g0.processEvent060_6(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 255, 0)
  A2_108:say(A0_106, 256, 0)
  A2_108:finishCliantTalkTurn()
end
function Man2g0.processEvent060_7(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 257, 0)
  A2_111:finishCliantTalkTurn()
end
function Man2g0.processEvent060_8(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 216, 0)
  A2_114:finishCliantTalkTurn()
end
function Man2g0.processEvent060_9(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 217, 0)
  A2_117:finishCliantTalkTurn()
end
function Man2g0.processEvent060_10(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 218, 0)
  A2_120:finishCliantTalkTurn()
end
function Man2g0.processEvent060_11(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:say(A0_121, 219, 0)
  A2_123:finishCliantTalkTurn()
end
function Man2g0.processEvent060_12(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:say(A0_124, 258, 0)
  A2_126:finishCliantTalkTurn()
end
function Man2g0.processEvent060_13(A0_127, A1_128, A2_129)
  A2_129:startCliantTalkTurn(2, A1_128)
  A2_129:say(A0_127, 220, 0)
  A2_129:finishCliantTalkTurn()
end
function Man2g0.processEvent060_14(A0_130, A1_131, A2_132)
  A2_132:startCliantTalkTurn(2, A1_131)
  A2_132:say(A0_130, 259, 0)
  A2_132:finishCliantTalkTurn()
end
function Man2g0.processEvent060_15(A0_133, A1_134, A2_135)
  A2_135:startCliantTalkTurn(2, A1_134)
  A2_135:say(A0_133, 260, 0)
  A2_135:finishCliantTalkTurn()
end
function Man2g0.processEvent060_16(A0_136, A1_137, A2_138)
  A2_138:startCliantTalkTurn(2, A1_137)
  A2_138:say(A0_136, 261, 0)
  A2_138:finishCliantTalkTurn()
end
function Man2g0.processEvent060_17(A0_139, A1_140, A2_141)
  A2_141:startCliantTalkTurn(2, A1_140)
  A2_141:say(A0_139, 262, 0)
  A2_141:finishCliantTalkTurn()
end
function Man2g0.processEvent060_18(A0_142, A1_143, A2_144)
  A2_144:startCliantTalkTurn(2, A1_143)
  A2_144:say(A0_142, 263, 0)
  A2_144:finishCliantTalkTurn()
end
function Man2g0.processEvent060_19(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(2, A1_146)
  A2_147:say(A0_145, 215, 0)
  A2_147:finishCliantTalkTurn()
end
function Man2g0.processEvent060_20(A0_148, A1_149, A2_150)
  A2_150:startCliantTalkTurn(2, A1_149)
  A2_150:say(A0_148, 221, 0)
  A2_150:finishCliantTalkTurn()
end
function Man2g0.processEvent060_21(A0_151, A1_152, A2_153)
  A2_153:startCliantTalkTurn(2, A1_152)
  A2_153:say(A0_151, 222, 0)
  A2_153:finishCliantTalkTurn()
end
function Man2g0.processEvent060_22(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(2, A1_155)
  A2_156:say(A0_154, 223, 0)
  A2_156:finishCliantTalkTurn()
end
function Man2g0.processEvent060_23(A0_157, A1_158, A2_159)
  A2_159:startCliantTalkTurn(2, A1_158)
  A2_159:say(A0_157, 224, 0)
  A2_159:finishCliantTalkTurn()
end
function Man2g0.processEvent060_24(A0_160, A1_161, A2_162)
  A2_162:startCliantTalkTurn(2, A1_161)
  A2_162:say(A0_160, 225, 0)
  A2_162:finishCliantTalkTurn()
end
function Man2g0.processEvent060_25(A0_163, A1_164, A2_165)
  A2_165:startCliantTalkTurn(2, A1_164)
  A2_165:say(A0_163, 226, 0)
  A2_165:finishCliantTalkTurn()
end
function Man2g0.processEvent060_26(A0_166, A1_167, A2_168)
  A2_168:startCliantTalkTurn(2, A1_167)
  A2_168:say(A0_166, 227, 0)
  A2_168:finishCliantTalkTurn()
end
function Man2g0.processEvent070(A0_169, A1_170, A2_171)
  A0_169:startFadeOutCutSceneDefault(A1_170)
  A0_169:startNQCutScene("man2g070", 1)
  A0_169:startFadeInCutSceneAfterWarp(A1_170)
end
function Man2g0.processEvent070_2(A0_172, A1_173, A2_174)
  A2_174:startCliantTalkTurn(2, A1_173)
  A2_174:say(A0_172, 138, 0)
  A2_174:finishCliantTalkTurn()
end
function Man2g0.processEvent070_3(A0_175, A1_176, A2_177)
  A2_177:startCliantTalkTurn(2, A1_176)
  A2_177:say(A0_175, 139, 0)
  A2_177:finishCliantTalkTurn()
end
function Man2g0.processEvent080(A0_178, A1_179, A2_180, A3_181)
  A0_178:startFadeOutCutSceneDefault(A1_179)
  A0_178:startNQCutScene("man2g080", 1)
  A0_178:startHQCutScene("MAN2G090", 1)
  A0_178:startNQCutScene("man2g095", 1)
  A0_178:startNQCutScene("man2g100", 1)
  A0_178:startFadeInCutSceneAfterWarp(A1_179)
end
function Man2g0.processEvent080_01(A0_182, A1_183, A2_184, A3_185)
  if A3_185 >= 18 then
    worldMaster:say(A0_182, 279)
  else
    worldMaster:say(A0_182, 280)
  end
end
function Man2g0.processEvent1000_1(A0_186, A1_187, A2_188)
  A2_188:startCliantTalkTurn(2, A1_187)
  A2_188:say(A0_186, 245, 0)
  A2_188:finishCliantTalkTurn()
end
function Man2g0.processEvent1000_2(A0_189, A1_190, A2_191)
  A2_191:startCliantTalkTurn(2, A1_190)
  A2_191:say(A0_189, 210, 0)
  A2_191:finishCliantTalkTurn()
end
function Man2g0.processEventTrial001(A0_192, A1_193, A2_194, A3_195)
  if A3_195 == 1 then
    A2_194:say(A0_192, 267, 0)
  elseif A3_195 == 2 then
    A2_194:say(A0_192, 269, 0)
  end
  return (A2_194:ask(A0_192, 270, 3))
end
function Man2g0.processEventTrial002(A0_196, A1_197, A2_198, A3_199)
  A2_198:say(A0_196, 268, 0)
end
