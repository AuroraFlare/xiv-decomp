require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man0u1", "ScenarioBaseClass")
function Man0u1.initText(A0_0)
  A0_0:_loadTextDataPermanently(1359, "man0u1")
end
function Man0u1.processEventMomodiStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startNQCutScene("man0u100", 1, 0, 11000069)
  A0_1:startFadeInCutSceneAfterWarp(A1_2)
end
function Man0u1.processEvent000_1(A0_4, A1_5, A2_6)
  worldMaster:say(A0_4, 329, 1, 0)
  worldMaster:say(A0_4, 330, 1, 0)
end
function Man0u1.processEvent000_2(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 18, 0)
  A2_9:say(A0_7, 258, 0)
  A2_9:finishCliantTalkTurn()
end
function Man0u1.processEvent000_3(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 20, 0)
  A2_12:finishCliantTalkTurn()
end
function Man0u1.processEvent000_4(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 19, 0)
  A2_15:say(A0_13, 259, 0)
  A2_15:finishCliantTalkTurn()
end
function Man0u1.processEvent000_5(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 21, 0)
  A2_18:say(A0_16, 260, 0)
  A2_18:finishCliantTalkTurn()
end
function Man0u1.processEvent000_6(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 261, 0)
  A2_21:say(A0_19, 262, 0)
  A2_21:finishCliantTalkTurn()
end
function Man0u1.processEvent000_7(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 263, 0)
  A2_24:say(A0_22, 264, 0)
  A2_24:finishCliantTalkTurn()
end
function Man0u1.processEvent000_8(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 265, 0)
  A2_27:say(A0_25, 266, 0)
  A2_27:finishCliantTalkTurn()
end
function Man0u1.processEvent000_9(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 267, 0)
  A2_30:say(A0_28, 268, 0)
  A2_30:finishCliantTalkTurn()
end
function Man0u1.processEvent000_10(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 269, 0)
  A2_33:say(A0_31, 270, 0)
  A2_33:finishCliantTalkTurn()
end
function Man0u1.processEvent010(A0_34, A1_35, A2_36)
  if desktopWidget:isTutorialMode() == true then
    desktopWidget:cancelDesktopWidgetMode(16)
    desktopWidget:cancelTutorialMode()
    desktopWidget:orderDesktopWidgetMode(16)
  end
  A0_34:startFadeOutCutSceneDefault(A1_35)
  A0_34:startNQCutScene("man0u110", 1)
  worldMaster:say(A0_34, 391)
  worldMaster:say(A0_34, 392)
  worldMaster:say(A0_34, 393)
  worldMaster:say(A0_34, 394)
  A0_34:startFadeInCutSceneAfterWarp(A1_35)
end
function Man0u1.processEvent010_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 239, 0)
  A2_39:say(A0_37, 240, 0)
  A2_39:say(A0_37, 241, 0)
  A2_39:finishCliantTalkTurn()
end
function Man0u1.processEvent013(A0_40, A1_41, A2_42)
  A0_40:tellByNpcLinkshellChat(1500014, A0_40, 242)
  A0_40:_wait(2)
  A0_40:tellByNpcLinkshellChat(1500014, A0_40, 243)
  A0_40:_wait(2)
  A0_40:tellByNpcLinkshellChat(1500014, A0_40, 244)
  A0_40:_wait(2)
  A0_40:tellByNpcLinkshellChat(1500014, A0_40, 245)
  A0_40:_wait(2)
  A0_40:tellByNpcLinkshellChat(1500014, A0_40, 246)
end
function Man0u1.processEvent013_2(A0_43, A1_44, A2_45)
  A0_43:tellByNpcLinkshellChat(1500014, A0_43, 242)
  A0_43:_wait(2)
  A0_43:tellByNpcLinkshellChat(1500014, A0_43, 243)
  A0_43:_wait(2)
  A0_43:tellByNpcLinkshellChat(1500014, A0_43, 322)
end
function Man0u1.processEvent015(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 378, 0)
  A2_48:say(A0_46, 379, 0)
  A2_48:finishCliantTalkTurn()
end
function Man0u1.processEvent017(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(1, A1_50)
  A2_51:say(A0_49, 247, 0)
  A2_51:say(A0_49, 248, 0)
  A2_51:say(A0_49, 249, 0)
  A2_51:say(A0_49, 250, 0)
  A2_51:say(A0_49, 251, 0)
  A2_51:say(A0_49, 252, 0)
  A2_51:finishCliantTalkTurn()
end
function Man0u1.processEvent017_2(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 293, 0)
  A2_54:say(A0_52, 294, 0)
  A2_54:say(A0_52, 295, 0)
  A2_54:say(A0_52, 296, 0)
  A2_54:finishCliantTalkTurn()
end
function Man0u1.processEvent017_3(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 297, 0)
  A2_57:say(A0_55, 298, 0)
  A2_57:finishCliantTalkTurn()
end
function Man0u1.processEvent017_4(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 299, 0)
  A2_60:say(A0_58, 300, 0)
  A2_60:finishCliantTalkTurn()
end
function Man0u1.processEvent020(A0_61, A1_62, A2_63)
  A0_61:startFadeOutCutSceneDefault(A1_62)
  A0_61:startNQCutScene("man0u120", 1)
  A0_61:startFadeInCutSceneDefault(A1_62)
end
function Man0u1.processEvent025(A0_64, A1_65, A2_66)
  worldMaster:say(A0_64, 395)
  worldMaster:say(A0_64, 396)
end
function Man0u1.processEvent020_2(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 384, 0)
  A2_69:say(A0_67, 385, 0)
  A2_69:finishCliantTalkTurn()
end
function Man0u1.processEvent030(A0_70, A1_71, A2_72)
  A0_70:startFadeOutCutSceneDefault(A1_71)
  A0_70:startNQCutScene("man0u130", 1)
  A0_70:startFadeInCutSceneAfterWarp(A1_71)
end
function Man0u1.processEvent030_2(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 56, 0)
  A2_75:say(A0_73, 57, 0)
  A2_75:say(A0_73, 58, 0)
  A2_75:finishCliantTalkTurn()
end
function Man0u1.processEvent030_3(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 280, 0)
  A2_78:say(A0_76, 281, 0)
  A2_78:finishCliantTalkTurn()
end
function Man0u1.processEvent030_4(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 277, 0)
  A2_81:say(A0_79, 278, 0)
  A2_81:finishCliantTalkTurn()
end
function Man0u1.processEvent030_5(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 279, 0)
  A2_84:finishCliantTalkTurn()
end
function Man0u1.processEvent030_6(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 282, 0)
  A2_87:finishCliantTalkTurn()
end
function Man0u1.processEvent030_7(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 289, 0)
  A2_90:finishCliantTalkTurn()
end
function Man0u1.processEvent030_8(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 77, 0)
  A2_93:say(A0_91, 78, 0)
  A2_93:finishCliantTalkTurn()
end
function Man0u1.processEvent030_9(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 79, 0)
  A2_96:say(A0_94, 272, 0)
  A2_96:finishCliantTalkTurn()
end
function Man0u1.processEvent030_10(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 273, 0)
  A2_99:say(A0_97, 274, 0)
  A2_99:finishCliantTalkTurn()
end
function Man0u1.processEvent030_11(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 275, 0)
  A2_102:say(A0_100, 276, 0)
  A2_102:finishCliantTalkTurn()
end
function Man0u1.processEvent030_12(A0_103, A1_104, A2_105)
  worldMaster:say(worldMaster, 51048)
end
function Man0u1.processEvent032_2(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 283, 0)
  A2_108:say(A0_106, 284, 0)
  A2_108:finishCliantTalkTurn()
end
function Man0u1.processEvent032_3(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 285, 0)
  A2_111:say(A0_109, 286, 0)
  A2_111:finishCliantTalkTurn()
end
function Man0u1.processEvent032_4(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 287, 0)
  A2_114:say(A0_112, 288, 0)
  A2_114:finishCliantTalkTurn()
end
function Man0u1.processEvent035(A0_115, A1_116, A2_117)
  A0_115:startFadeOutCutSceneDefault(A1_116)
  A0_115:startNQCutScene("man0u135", 1)
  A0_115:startFadeInCutSceneAfterWarp(A1_116)
end
function Man0u1.processEvent040(A0_118, A1_119, A2_120)
  A0_118:startFadeOutCutSceneDefault(A1_119)
  A0_118:startNQCutScene("man0u140", 1)
  A0_118:startFadeInCutSceneAfterWarp(A1_119)
end
function Man0u1.processEvent045(A0_121, A1_122, A2_123)
  A0_121:startFadeOutCutSceneDefault(A1_122)
  A0_121:startNQCutScene("man0u140", 1)
  worldMaster:say(A0_121, 395)
  worldMaster:say(A0_121, 396)
  A0_121:startFadeInCutSceneAfterWarp(A1_122)
end
function Man0u1.processEvent040_2(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:say(A0_124, 301, 0)
  A2_126:say(A0_124, 302, 0)
  A2_126:say(A0_124, 303, 0)
  A2_126:finishCliantTalkTurn()
end
function Man0u1.processEvent050(A0_127, A1_128, A2_129)
  A0_127:startFadeOutCutSceneDefault(A1_128)
  A0_127:startNQCutScene("man0u150", 1)
  A0_127:startFadeInCutSceneAfterWarp(A1_128)
end
function Man0u1.processEvent050_2(A0_130, A1_131, A2_132)
  A2_132:startCliantTalkTurn(2, A1_131)
  A2_132:say(A0_130, 331, 0)
  A2_132:finishCliantTalkTurn()
end
function Man0u1.processEvent050_3(A0_133, A1_134, A2_135)
  A2_135:startCliantTalkTurn(2, A1_134)
  A2_135:say(A0_133, 332, 0)
  A2_135:finishCliantTalkTurn()
end
function Man0u1.processEvent050_4(A0_136, A1_137, A2_138)
  A2_138:say(A0_136, 333, 0)
end
function Man0u1.processEvent050_5(A0_139, A1_140, A2_141)
  A2_141:startCliantTalkTurn(2, A1_140)
  A2_141:say(A0_139, 334, 0)
  A2_141:finishCliantTalkTurn()
end
function Man0u1.processEvent050_6(A0_142, A1_143, A2_144)
  A2_144:startCliantTalkTurn(2, A1_143)
  A2_144:say(A0_142, 335, 0)
  A2_144:finishCliantTalkTurn()
end
function Man0u1.processEvent050_7(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(2, A1_146)
  A2_147:say(A0_145, 336, 0)
  A2_147:finishCliantTalkTurn()
end
function Man0u1.processEvent050_8(A0_148, A1_149, A2_150)
  A2_150:startCliantTalkTurn(2, A1_149)
  A2_150:say(A0_148, 337, 0)
  A2_150:finishCliantTalkTurn()
end
function Man0u1.processEvent050_9(A0_151, A1_152, A2_153)
  A2_153:say(A0_151, 338, 0)
end
function Man0u1.processEvent050_10(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(2, A1_155)
  A2_156:say(A0_154, 339, 0)
  A2_156:finishCliantTalkTurn()
end
function Man0u1.processEvent050_11(A0_157, A1_158, A2_159)
  A2_159:say(A0_157, 340, 0)
end
function Man0u1.processEvent050_12(A0_160, A1_161, A2_162)
  A2_162:startCliantTalkTurn(2, A1_161)
  A2_162:say(A0_160, 341, 0)
  A2_162:finishCliantTalkTurn()
end
function Man0u1.processEvent050_13(A0_163, A1_164, A2_165)
  A2_165:say(A0_163, 342, 0)
end
function Man0u1.processEvent050_14(A0_166, A1_167, A2_168)
  A2_168:say(A0_166, 343, 0)
end
function Man0u1.processEvent051_1(A0_169, A1_170, A2_171)
  A2_171:startCliantTalkTurn(1, A1_170)
  A2_171:waitCliantTalkTurn()
  A2_171:_runCharaScheduler(83898368)
  A2_171:say(A0_169, 344, 0)
  A2_171:_waitForCharaSchedulerFinished(83898368)
  A2_171:finishCliantTalkTurn()
end
function Man0u1.processEvent051_2(A0_172, A1_173, A2_174)
  A2_174:startCliantTalkTurn(1, A1_173)
  A2_174:waitCliantTalkTurn()
  A2_174:_runCharaScheduler(83918848)
  A2_174:say(A0_172, 345, 0)
  A2_174:_waitForCharaSchedulerFinished(83918848)
  A2_174:finishCliantTalkTurn()
end
function Man0u1.processEvent051_3(A0_175, A1_176, A2_177)
  A2_177:startCliantTalkTurn(1, A1_176)
  A2_177:waitCliantTalkTurn()
  A2_177:_runCharaScheduler(83972096)
  A2_177:say(A0_175, 346, 0)
  A2_177:_waitForCharaSchedulerFinished(83972096)
  A2_177:finishCliantTalkTurn()
end
function Man0u1.processEvent051_4(A0_178, A1_179, A2_180)
  A2_180:startCliantTalkTurn(1, A1_179)
  A2_180:waitCliantTalkTurn()
  A2_180:_runCharaScheduler(83988480)
  A2_180:say(A0_178, 347, 0)
  A2_180:_waitForCharaSchedulerFinished(83988480)
  A2_180:finishCliantTalkTurn()
end
function Man0u1.processEvent051_5(A0_181, A1_182, A2_183)
  A2_183:startCliantTalkTurn(1, A1_182)
  A2_183:waitCliantTalkTurn()
  A2_183:_runCharaScheduler(84049920)
  A2_183:say(A0_181, 348, 0)
  A2_183:_waitForCharaSchedulerFinished(84049920)
  A2_183:finishCliantTalkTurn()
end
function Man0u1.processEvent051_6(A0_184, A1_185, A2_186)
  A2_186:startCliantTalkTurn(1, A1_185)
  A2_186:waitCliantTalkTurn()
  A2_186:_runCharaScheduler(84029440)
  A2_186:say(A0_184, 349, 0)
  A2_186:_waitForCharaSchedulerFinished(84029440)
  A2_186:finishCliantTalkTurn()
end
function Man0u1.processEvent051_7(A0_187, A1_188, A2_189, A3_190)
  A2_189:startCliantTalkTurn(1, A1_188)
  A2_189:waitCliantTalkTurn()
  A2_189:say(A0_187, 351, 0)
  if A3_190 == 51 then
    A2_189:_runCharaScheduler(83898368)
    A2_189:_waitForCharaSchedulerFinished(83898368)
  elseif A3_190 == 52 then
    A2_189:_runCharaScheduler(83918848)
    A2_189:_waitForCharaSchedulerFinished(83918848)
  elseif A3_190 == 53 then
    A2_189:_runCharaScheduler(83972096)
    A2_189:_waitForCharaSchedulerFinished(83972096)
  elseif A3_190 == 54 then
    A2_189:_runCharaScheduler(83988480)
    A2_189:_waitForCharaSchedulerFinished(83988480)
  elseif A3_190 == 55 then
    A2_189:_runCharaScheduler(84049920)
    A2_189:_waitForCharaSchedulerFinished(84049920)
  elseif A3_190 == 56 then
    A2_189:_runCharaScheduler(84029440)
    A2_189:_waitForCharaSchedulerFinished(84029440)
  end
  A2_189:finishCliantTalkTurn()
end
function Man0u1.processEvent051_8(A0_191, A1_192, A2_193)
  A2_193:startCliantTalkTurn(2, A1_192)
  A2_193:say(A0_191, 350, 0)
  A2_193:finishCliantTalkTurn()
end
function Man0u1.processEvent055_1(A0_194, A1_195, A2_196)
  A2_196:startCliantTalkTurn(2, A1_195)
  A2_196:say(A0_194, 352, 0)
  A2_196:finishCliantTalkTurn()
end
function Man0u1.processEvent055_2(A0_197, A1_198, A2_199)
  A2_199:startCliantTalkTurn(2, A1_198)
  A2_199:say(A0_197, 354, 0)
  A2_199:finishCliantTalkTurn()
end
function Man0u1.processEvent055_3(A0_200, A1_201, A2_202)
  A2_202:startCliantTalkTurn(2, A1_201)
  A2_202:say(A0_200, 356, 0)
  A2_202:finishCliantTalkTurn()
end
function Man0u1.processEvent056_1(A0_203, A1_204, A2_205)
  A2_205:startCliantTalkTurn(2, A1_204)
  A2_205:say(A0_203, 353, 0)
  A2_205:finishCliantTalkTurn()
end
function Man0u1.processEvent056_2(A0_206, A1_207, A2_208)
  A2_208:startCliantTalkTurn(2, A1_207)
  A2_208:say(A0_206, 355, 0)
  A2_208:finishCliantTalkTurn()
end
function Man0u1.processEvent056_3(A0_209, A1_210, A2_211)
  A2_211:startCliantTalkTurn(2, A1_210)
  A2_211:say(A0_209, 357, 0)
  A2_211:finishCliantTalkTurn()
end
function Man0u1.processEvent060(A0_212, A1_213, A2_214)
  A0_212:startFadeOutCutSceneDefault(A1_213)
  A0_212:startNQCutScene("man0u160", 1)
  A0_212:startFadeInCutSceneAfterWarp(A1_213)
end
function Man0u1.processEvent060_2(A0_215, A1_216, A2_217)
  A2_217:startCliantTalkTurn(2, A1_216)
  A2_217:say(A0_215, 114, 0)
  A2_217:finishCliantTalkTurn()
end
function Man0u1.processEvent060_3(A0_218, A1_219, A2_220)
  A2_220:startCliantTalkTurn(2, A1_219)
  A2_220:say(A0_218, 115, 0)
  A2_220:finishCliantTalkTurn()
end
function Man0u1.processEvent060_4(A0_221, A1_222, A2_223)
  A2_223:startCliantTalkTurn(2, A1_222)
  A2_223:say(A0_221, 116, 0)
  A2_223:finishCliantTalkTurn()
end
function Man0u1.processEvent060_5(A0_224, A1_225, A2_226)
  A2_226:startCliantTalkTurn(2, A1_225)
  A2_226:say(A0_224, 117, 0)
  A2_226:finishCliantTalkTurn()
end
function Man0u1.processEvent060_6(A0_227, A1_228, A2_229)
  A2_229:startCliantTalkTurn(2, A1_228)
  A2_229:say(A0_227, 118, 0)
  A2_229:finishCliantTalkTurn()
end
function Man0u1.processEvent060_7(A0_230, A1_231, A2_232)
  A2_232:startCliantTalkTurn(2, A1_231)
  A2_232:say(A0_230, 136, 0)
  A2_232:finishCliantTalkTurn()
end
function Man0u1.processEvent070(A0_233, A1_234, A2_235)
  A0_233:startFadeOutCutSceneDefault(A1_234)
  A0_233:startNQCutScene("man0u170", 1)
  A0_233:startFadeInCutSceneAfterWarp(A1_234)
end
function Man0u1.processEvent075(A0_236, A1_237, A2_238)
  A0_236:startFadeOutCutSceneDefault(A1_237)
  A0_236:startNQCutScene("man0u175", 1)
  A0_236:startFadeInCutSceneAfterWarp(A1_237)
end
function Man0u1.processEvent080(A0_239, A1_240, A2_241)
  A0_239:startFadeOutCutSceneDefault(A1_240)
  A0_239:startNQCutScene("man0u180", 1)
  A0_239:startFadeInCutSceneAfterWarp(A1_240)
end
function Man0u1.processEvent080_2(A0_242, A1_243, A2_244)
  A2_244:startCliantTalkTurn(2, A1_243)
  A2_244:say(A0_242, 160, 0)
  A2_244:finishCliantTalkTurn()
end
function Man0u1.processEvent080_3(A0_245, A1_246, A2_247)
  A2_247:startCliantTalkTurn(2, A1_246)
  A2_247:say(A0_245, 161, 0)
  A2_247:finishCliantTalkTurn()
end
function Man0u1.processEvent080_4(A0_248, A1_249, A2_250)
  A2_250:startCliantTalkTurn(2, A1_249)
  A2_250:say(A0_248, 162, 0)
  A2_250:finishCliantTalkTurn()
end
function Man0u1.processEvent080_5(A0_251, A1_252, A2_253)
  A2_253:startCliantTalkTurn(2, A1_252)
  A2_253:say(A0_251, 163, 0)
  A2_253:finishCliantTalkTurn()
end
function Man0u1.processEvent080_6(A0_254, A1_255, A2_256)
  A2_256:startCliantTalkTurn(2, A1_255)
  A2_256:say(A0_254, 358, 0)
  A2_256:finishCliantTalkTurn()
end
function Man0u1.processEvent080_7(A0_257, A1_258, A2_259)
  A2_259:startCliantTalkTurn(2, A1_258)
  A2_259:say(A0_257, 359, 0)
  A2_259:finishCliantTalkTurn()
end
function Man0u1.processEvent080_8(A0_260, A1_261, A2_262)
  A2_262:startCliantTalkTurn(2, A1_261)
  A2_262:say(A0_260, 360, 0)
  A2_262:finishCliantTalkTurn()
end
function Man0u1.processEvent080_9(A0_263, A1_264, A2_265)
  A2_265:startCliantTalkTurn(2, A1_264)
  A2_265:say(A0_263, 361, 0)
  A2_265:say(A0_263, 362, 0)
  A2_265:finishCliantTalkTurn()
end
function Man0u1.processEvent080_10(A0_266, A1_267, A2_268)
  A2_268:startCliantTalkTurn(2, A1_267)
  A2_268:say(A0_266, 363, 0)
  A2_268:finishCliantTalkTurn()
end
function Man0u1.processEvent080_11(A0_269, A1_270, A2_271)
  A2_271:startCliantTalkTurn(2, A1_270)
  A2_271:say(A0_269, 364, 0)
  A2_271:finishCliantTalkTurn()
end
function Man0u1.processEvent080_12(A0_272, A1_273, A2_274)
  A2_274:say(A0_272, 377, 0)
end
function Man0u1.processEvent090(A0_275, A1_276, A2_277)
  A0_275:startFadeOutCutSceneDefault(A1_276)
  A0_275:startNQCutScene("man0u190", 1)
  A0_275:startFadeOutCutSceneDefault(A1_276)
  A0_275:startNQCutScene("man0u200", 1)
  A0_275:startFadeInCutSceneAfterWarp(A1_276)
end
function Man0u1.processEvent200(A0_278, A1_279, A2_280)
  A0_278:startFadeOutCutSceneDefault(A1_279)
  A0_278:startNQCutScene("man0u200", 1)
  A0_278:startFadeInCutSceneDefault(A1_279)
end
function Man0u1.processEvent200_2(A0_281, A1_282, A2_283)
  A2_283:startCliantTalkTurn(2, A1_282)
  A2_283:say(A0_281, 389, 0)
  A2_283:say(A0_281, 390, 0)
  A2_283:finishCliantTalkTurn()
end
function Man0u1.processEvent205(A0_284, A1_285, A2_286)
  A0_284:startFadeOutCutSceneDefault(A1_285)
  A0_284:startNQCutScene("man0u205", 1)
  A0_284:startFadeInCutSceneDefault(A1_285)
end
function Man0u1.processEvent205_2(A0_287, A1_288, A2_289)
  A2_289:startCliantTalkTurn(2, A1_288)
  A2_289:say(A0_287, 304, 0)
  A2_289:say(A0_287, 305, 0)
  A2_289:finishCliantTalkTurn()
end
function Man0u1.processEvent207(A0_290, A1_291, A2_292)
  A2_292:startCliantTalkTurn(1, A1_291)
  A2_292:say(A0_290, 184, 0)
  A2_292:say(A0_290, 185, 0)
  A2_292:say(A0_290, 186, 0)
  A2_292:finishCliantTalkTurn()
end
function Man0u1.processEvent210(A0_293, A1_294, A2_295)
  A0_293:startFadeOutCutSceneDefault(A1_294)
  A0_293:startNQCutScene("man0u210", 1)
  A0_293:startFadeInCutSceneDefault(A1_294)
end
function Man0u1.processEvent210_2(A0_296, A1_297, A2_298)
  A2_298:startCliantTalkTurn(2, A1_297)
  A2_298:say(A0_296, 327, 0)
  A2_298:say(A0_296, 328, 0)
  A2_298:finishCliantTalkTurn()
end
function Man0u1.processEvent210_3(A0_299, A1_300, A2_301)
  A2_301:startCliantTalkTurn(2, A1_300)
  A2_301:say(A0_299, 386, 0)
  A2_301:finishCliantTalkTurn()
end
function Man0u1.processEvent210_4(A0_302, A1_303, A2_304)
  A2_304:startCliantTalkTurn(2, A1_303)
  A2_304:say(A0_302, 387, 0)
  A2_304:finishCliantTalkTurn()
end
function Man0u1.processEvent210_5(A0_305, A1_306, A2_307)
  A2_307:startCliantTalkTurn(2, A1_306)
  A2_307:say(A0_305, 388, 0)
  A2_307:finishCliantTalkTurn()
end
function Man0u1.processEvent210_6(A0_308, A1_309, A2_310)
  A2_310:startCliantTalkTurn(2, A1_309)
  A2_310:say(A0_308, 198, 0)
  A2_310:finishCliantTalkTurn()
end
function Man0u1.processEvent210_7(A0_311, A1_312, A2_313)
  A2_313:startCliantTalkTurn(2, A1_312)
  A2_313:say(A0_311, 199, 0)
  A2_313:finishCliantTalkTurn()
end
function Man0u1.processEvent210_8(A0_314, A1_315, A2_316)
  A2_316:startCliantTalkTurn(2, A1_315)
  A2_316:say(A0_314, 200, 0)
  A2_316:finishCliantTalkTurn()
end
function Man0u1.processEvent220(A0_317, A1_318, A2_319)
  A0_317:startFadeOutCutSceneDefault(A1_318)
  A0_317:startNQCutScene("man0u220", 1)
  A0_317:startFadeInCutSceneAfterWarp(A1_318)
end
function Man0u1.processEvent230(A0_320, A1_321, A2_322)
  A0_320:startFadeOutCutSceneDefault(A1_321)
  A0_320:startNQCutScene("man0u230", 1)
  A0_320:startFadeInCutSceneDefault(A1_321)
end
function Man0u1.processEventComplete(A0_323, A1_324, A2_325)
  A2_325:startCliantTalkTurn(2, A1_324)
  A2_325:say(A0_323, 309, 0)
  A2_325:say(A0_323, 314, 0)
  A2_325:say(A0_323, 315, 0)
  A2_325:say(A0_323, 316, 0)
  A2_325:say(A0_323, 397, 0)
  A2_325:say(A0_323, 398, 0)
  A2_325:finishCliantTalkTurn()
end
function Man0u1.processEvent1000_1(A0_326, A1_327, A2_328)
  A2_328:startCliantTalkTurn(1, A1_327)
  A2_328:say(A0_326, 271, 0)
  A2_328:finishCliantTalkTurn()
end
function Man0u1.processEvent1000_2(A0_329, A1_330, A2_331)
  A2_331:startCliantTalkTurn(1, A1_330)
  A2_331:say(A0_329, 271, 0)
  A2_331:finishCliantTalkTurn()
end
function Man0u1.processEvent1000_3(A0_332, A1_333, A2_334)
  A2_334:startCliantTalkTurn(2, A1_333)
  A2_334:say(A0_332, 290, 0)
  A2_334:say(A0_332, 291, 0)
  A2_334:say(A0_332, 292, 0)
  A2_334:finishCliantTalkTurn()
end
function Man0u1.processEvent1000_5(A0_335, A1_336, A2_337)
  return (A2_337:ask(worldMaster, 34112, 2))
end
function Man0u1.processEventTu_001(A0_338, A1_339, A2_340)
  local L3_341, L4_342, L5_343, L6_344, L7_345, L8_346, L9_347
  L3_341 = desktopWidget
  L4_342 = L3_341
  L3_341 = L3_341.isTutorialMode
  L3_341 = L3_341(L4_342)
  if L3_341 == false then
    L3_341 = desktopWidget
    L4_342 = L3_341
    L3_341 = L3_341.orderTutorialMode
    L3_341(L4_342)
  end
  L3_341 = desktopWidget
  L4_342 = L3_341
  L3_341 = L3_341.cancelDesktopWidgetMode
  L5_343 = 16
  L3_341(L4_342, L5_343)
  L3_341 = true
  L4_342 = true
  L5_343 = true
  L6_344 = true
  L7_345 = true
  L8_346 = 4
  L9_347 = desktopWidget
  L9_347 = L9_347.setTutorialMask
  L9_347(L9_347, L3_341, L4_342, L5_343, L6_344, L7_345, L8_346)
  L9_347 = 1
  desktopWidget:openTutorialWidget(L9_347, 15)
  if desktopWidget:isTutorialMode() == false then
    desktopWidget:orderTutorialMode()
  end
  L3_341 = true
  L4_342 = true
  L5_343 = true
  L6_344 = true
  L7_345 = true
  L8_346 = 2
  desktopWidget:setTutorialMask(L3_341, L4_342, L5_343, L6_344, L7_345, L8_346)
end
