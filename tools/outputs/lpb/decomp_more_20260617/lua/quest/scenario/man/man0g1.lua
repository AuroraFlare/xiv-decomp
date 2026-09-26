require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man0g1", "ScenarioBaseClass")
function Man0g1.initText(A0_0)
  A0_0:_loadTextDataPermanently(395, "man0g1")
end
function Man0g1.processEvent100(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startNQCutScene("man0g100", 1)
  A0_1:startFadeInCutSceneAfterWarp(A1_2)
end
function Man0g1.processEvent100_1(A0_4, A1_5, A2_6)
  worldMaster:say(A0_4, 353, 1, 0)
  worldMaster:say(A0_4, 354, 1, 0)
end
function Man0g1.processEvent100_2(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 28, 0)
  A2_9:say(A0_7, 29, 0)
  A2_9:finishCliantTalkTurn()
end
function Man0g1.processEvent100_3(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 30, 0)
  A2_12:say(A0_10, 31, 0)
  A2_12:finishCliantTalkTurn()
end
function Man0g1.processEvent100_4(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 32, 0)
  A2_15:say(A0_13, 300, 0)
  A2_15:finishCliantTalkTurn()
end
function Man0g1.processEvent100_5(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 34, 0)
  A2_18:say(A0_16, 35, 0)
  A2_18:finishCliantTalkTurn()
end
function Man0g1.processEvent100_6(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 36, 0)
  A2_21:say(A0_19, 37, 0)
  A2_21:finishCliantTalkTurn()
end
function Man0g1.processEvent100_7(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 38, 0)
  A2_24:say(A0_22, 39, 0)
  A2_24:finishCliantTalkTurn()
end
function Man0g1.processEvent100_8(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 33, 0)
  A2_27:say(A0_25, 301, 0)
  A2_27:finishCliantTalkTurn()
end
function Man0g1.processEvent100_9(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 392, 0)
  A2_30:finishCliantTalkTurn()
end
function Man0g1.processEvent110(A0_31, A1_32, A2_33)
  if desktopWidget:isTutorialMode() == true then
    desktopWidget:cancelDesktopWidgetMode(16)
    desktopWidget:cancelTutorialMode()
    desktopWidget:orderDesktopWidgetMode(16)
  end
  A0_31:startFadeOutCutSceneDefault(A1_32)
  A0_31:startNQCutScene("man0g110", 1)
  worldMaster:say(A0_31, 385)
  worldMaster:say(A0_31, 386)
  worldMaster:say(A0_31, 387)
  worldMaster:say(A0_31, 388)
  A0_31:startFadeInCutSceneAfterWarp(A1_32)
end
function Man0g1.processEvent110_2(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 263, 0)
  A2_36:say(A0_34, 264, 0)
  A2_36:say(A0_34, 265, 0)
  A2_36:finishCliantTalkTurn()
end
function Man0g1.processEvent013(A0_37, A1_38, A2_39)
  A0_37:tellByNpcLinkshellChat(1300018, A0_37, 266)
  A0_37:_wait(2)
  A0_37:tellByNpcLinkshellChat(1300018, A0_37, 267)
  A0_37:_wait(2)
  A0_37:tellByNpcLinkshellChat(1300018, A0_37, 268)
  A0_37:_wait(2)
  A0_37:tellByNpcLinkshellChat(1300018, A0_37, 269)
  A0_37:_wait(2)
  A0_37:tellByNpcLinkshellChat(1300018, A0_37, 270)
end
function Man0g1.processEvent013_2(A0_40, A1_41, A2_42)
  A0_40:tellByNpcLinkshellChat(1300018, A0_40, 266)
  A0_40:_wait(2)
  A0_40:tellByNpcLinkshellChat(1300018, A0_40, 267)
  A0_40:_wait(2)
  A0_40:tellByNpcLinkshellChat(1300018, A0_40, 335)
end
function Man0g1.processEvent114(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 375, 0)
  A2_45:say(A0_43, 376, 0)
  A2_45:finishCliantTalkTurn()
end
function Man0g1.processEvent115(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 271, 0)
  A2_48:say(A0_46, 272, 0)
  A2_48:say(A0_46, 273, 0)
  A2_48:say(A0_46, 274, 0)
  A2_48:say(A0_46, 275, 0)
  A2_48:finishCliantTalkTurn()
end
function Man0g1.processEvent115_2(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 276, 0)
  A2_51:say(A0_49, 277, 0)
  A2_51:say(A0_49, 278, 0)
  A2_51:finishCliantTalkTurn()
end
function Man0g1.processEvent120(A0_52, A1_53, A2_54)
  A0_52:startFadeOutCutSceneDefault(A1_53)
  A0_52:startNQCutScene("man0g120", 1)
  A0_52:startFadeInCutSceneDefault(A1_53)
end
function Man0g1.processEvent123(A0_55, A1_56, A2_57)
  worldMaster:say(A0_55, 389)
  worldMaster:say(A0_55, 390)
end
function Man0g1.processEvent120_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 355, 0)
  A2_60:say(A0_58, 356, 0)
  A2_60:finishCliantTalkTurn()
end
function Man0g1.processEvent125(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 82, 0)
  A2_63:say(A0_61, 83, 0)
  A2_63:say(A0_61, 84, 0)
  A2_63:say(A0_61, 85, 0)
  A2_63:finishCliantTalkTurn()
end
function Man0g1.processEvent125_2(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 357, 0)
  A2_66:finishCliantTalkTurn()
end
function Man0g1.processEvent130(A0_67, A1_68, A2_69)
  A0_67:startFadeOutCutSceneDefault(A1_68)
  A0_67:startNQCutScene("man0g130", 1)
  A0_67:startFadeInCutSceneAfterWarp(A1_68)
end
function Man0g1.processEvent130_2(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 280, 0)
  A2_72:say(A0_70, 281, 0)
  A2_72:finishCliantTalkTurn()
end
function Man0g1.processEvent130_3(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 282, 0)
  A2_75:finishCliantTalkTurn()
end
function Man0g1.processEvent130_4(A0_76, A1_77, A2_78)
  A2_78:say(A0_76, 283, 0)
end
function Man0g1.processEvent130_5(A0_79, A1_80, A2_81)
  A2_81:say(A0_79, 284, 0)
end
function Man0g1.processEvent130_6(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 302, 0)
  A2_84:say(A0_82, 303, 0)
  A2_84:finishCliantTalkTurn()
end
function Man0g1.processEvent130_7(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 304, 0)
  A2_87:say(A0_85, 305, 0)
  A2_87:finishCliantTalkTurn()
end
function Man0g1.processEvent130_8(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 306, 0)
  A2_90:say(A0_88, 307, 0)
  A2_90:finishCliantTalkTurn()
end
function Man0g1.processEvent130_9(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 308, 0)
  A2_93:say(A0_91, 309, 0)
  A2_93:finishCliantTalkTurn()
end
function Man0g1.processEvent130_10(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 310, 0)
  A2_96:say(A0_94, 311, 0)
  A2_96:finishCliantTalkTurn()
end
function Man0g1.processEvent135(A0_97, A1_98, A2_99)
  A0_97:startFadeOutCutSceneDefault(A1_98)
  A0_97:startNQCutScene("man0g135", 1)
  A0_97:startFadeInCutSceneAfterWarp(A1_98)
end
function Man0g1.processEvent136(A0_100, A1_101, A2_102)
  A0_100:startFadeOutCutSceneDefault(A1_101)
  A0_100:startNQCutScene("man0g135", 1)
  worldMaster:say(A0_100, 389)
  worldMaster:say(A0_100, 390)
  A0_100:startFadeInCutSceneAfterWarp(A1_101)
end
function Man0g1.processEvent135_2(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 358, 0)
  A2_105:say(A0_103, 359, 0)
  A2_105:finishCliantTalkTurn()
end
function Man0g1.processEvent137_2(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(1, A1_107)
  A2_108:say(A0_106, 285, 0)
  A2_108:say(A0_106, 286, 0)
  A2_108:say(A0_106, 287, 0)
  A2_108:finishCliantTalkTurn()
end
function Man0g1.processEvent140(A0_109, A1_110, A2_111)
  A0_109:startFadeOutCutSceneDefault(A1_110)
  A0_109:startNQCutScene("man0g140", 1)
  A0_109:startFadeInCutSceneAfterWarp(A1_110)
end
function Man0g1.processEvent140_10(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 294, 0)
  A2_114:finishCliantTalkTurn()
end
function Man0g1.processEvent140_1(A0_115, A1_116, A2_117)
  A2_117:_runCharaScheduler(69595136)
  A2_117:say(A0_115, 288, 0)
end
function Man0g1.processEvent141_1(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 329, 0)
  A2_120:finishCliantTalkTurn()
end
function Man0g1.processEvent142_1(A0_121, A1_122, A2_123)
  A2_123:_runCharaScheduler(69595136)
  A2_123:say(A0_121, 347, 0)
end
function Man0g1.processEvent140_2(A0_124, A1_125, A2_126)
  A2_126:_runCharaScheduler(69595136)
  A2_126:say(A0_124, 289, 0)
end
function Man0g1.processEvent141_2(A0_127, A1_128, A2_129)
  A2_129:startCliantTalkTurn(2, A1_128)
  A2_129:say(A0_127, 144, 0)
  A2_129:finishCliantTalkTurn()
end
function Man0g1.processEvent142_2(A0_130, A1_131, A2_132)
  A2_132:_runCharaScheduler(69595136)
  A2_132:say(A0_130, 348, 0)
end
function Man0g1.processEvent140_3(A0_133, A1_134, A2_135)
  A2_135:_runCharaScheduler(69595136)
  A2_135:say(A0_133, 290, 0)
end
function Man0g1.processEvent141_3(A0_136, A1_137, A2_138)
  A2_138:startCliantTalkTurn(2, A1_137)
  A2_138:say(A0_136, 145, 0)
  A2_138:finishCliantTalkTurn()
end
function Man0g1.processEvent142_3(A0_139, A1_140, A2_141)
  A2_141:_runCharaScheduler(69595136)
  A2_141:say(A0_139, 349, 0)
end
function Man0g1.processEvent140_4(A0_142, A1_143, A2_144)
  A2_144:_runCharaScheduler(69595136)
  A2_144:say(A0_142, 291, 0)
end
function Man0g1.processEvent141_4(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(2, A1_146)
  A2_147:say(A0_145, 146, 0)
  A2_147:finishCliantTalkTurn()
end
function Man0g1.processEvent142_4(A0_148, A1_149, A2_150)
  A2_150:_runCharaScheduler(69595136)
  A2_150:say(A0_148, 350, 0)
end
function Man0g1.processEvent140_5(A0_151, A1_152, A2_153)
  A2_153:_runCharaScheduler(69595136)
  A2_153:say(A0_151, 292, 0)
end
function Man0g1.processEvent141_5(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(2, A1_155)
  A2_156:say(A0_154, 147, 0)
  A2_156:finishCliantTalkTurn()
end
function Man0g1.processEvent142_5(A0_157, A1_158, A2_159)
  A2_159:_runCharaScheduler(69595136)
  A2_159:say(A0_157, 351, 0)
end
function Man0g1.processEvent140_6(A0_160, A1_161, A2_162)
  A2_162:_runCharaScheduler(69595136)
  A2_162:say(A0_160, 293, 0)
end
function Man0g1.processEvent141_6(A0_163, A1_164, A2_165)
  A2_165:startCliantTalkTurn(2, A1_164)
  A2_165:say(A0_163, 142, 0)
  A2_165:say(A0_163, 143, 0)
  A2_165:finishCliantTalkTurn()
end
function Man0g1.processEvent142_6(A0_166, A1_167, A2_168)
  A2_168:_runCharaScheduler(69595136)
  A2_168:say(A0_166, 352, 0)
end
function Man0g1.processEvent150(A0_169, A1_170, A2_171)
  A0_169:startFadeOutCutSceneDefault(A1_170)
  A0_169:startNQCutScene("man0g150", 1)
  A0_169:startFadeInCutSceneAfterWarp(A1_170)
end
function Man0g1.processEvent150_2(A0_172, A1_173, A2_174)
  A2_174:startCliantTalkTurn(2, A1_173)
  A2_174:say(A0_172, 156, 0)
  A2_174:say(A0_172, 157, 0)
  A2_174:finishCliantTalkTurn()
end
function Man0g1.processEvent150_3(A0_175, A1_176, A2_177)
  A2_177:say(A0_175, 384, 0)
end
function Man0g1.processEvent150_4(A0_178, A1_179, A2_180)
  A2_180:say(A0_178, 383, 0)
end
function Man0g1.processEvent160(A0_181, A1_182, A2_183)
  A0_181:startFadeOutCutSceneDefault(A1_182)
  A0_181:startNQCutScene("man0g160", 1)
  A0_181:startFadeInCutSceneAfterWarp(A1_182)
end
function Man0g1.processEvent170(A0_184, A1_185, A2_186)
  A0_184:startFadeOutCutSceneDefault(A1_185)
  A0_184:startNQCutScene("man0g170", 1)
  A0_184:startFadeInCutSceneAfterWarp(A1_185)
end
function Man0g1.processEvent180(A0_187, A1_188, A2_189)
  A0_187:startFadeOutCutSceneDefault(A1_188)
  A0_187:startNQCutScene("man0g180", 1)
  A0_187:startFadeInCutSceneAfterWarp(A1_188)
end
function Man0g1.processEvent180_2(A0_190, A1_191, A2_192)
  A2_192:startCliantTalkTurn(2, A1_191)
  A2_192:say(A0_190, 339, 0)
  A2_192:finishCliantTalkTurn()
end
function Man0g1.processEvent181(A0_193, A1_194, A2_195)
  A0_193:startFadeOutCutSceneDefault(A1_194)
  A0_193:startNQCutScene("man0g181", 1)
  A0_193:startFadeInCutSceneDefault(A1_194)
end
function Man0g1.processEvent182(A0_196, A1_197, A2_198)
  A0_196:startFadeOutCutSceneDefault(A1_197)
  A0_196:startNQCutScene("man0g182", 1)
  A0_196:startFadeInCutSceneAfterWarp(A1_197)
end
function Man0g1.processEvent182_2(A0_199, A1_200, A2_201)
  A2_201:startCliantTalkTurn(2, A1_200)
  A2_201:say(A0_199, 381, 0)
  A2_201:say(A0_199, 382, 0)
  A2_201:finishCliantTalkTurn()
end
function Man0g1.processEvent185(A0_202, A1_203, A2_204)
  A0_202:startFadeOutCutSceneDefault(A1_203)
  A0_202:startNQCutScene("man0g185", 1)
  A0_202:startFadeInCutSceneDefault(A1_203)
end
function Man0g1.processEvent185_2(A0_205, A1_206, A2_207)
  A2_207:startCliantTalkTurn(2, A1_206)
  A2_207:say(A0_205, 317, 0)
  A2_207:say(A0_205, 318, 0)
  A2_207:say(A0_205, 319, 0)
  A2_207:finishCliantTalkTurn()
end
function Man0g1.processEvent190(A0_208, A1_209, A2_210)
  A0_208:startFadeOutCutSceneDefault(A1_209)
  A0_208:startNQCutScene("man0g190", 1)
  A0_208:startFadeInCutSceneDefault(A1_209)
end
function Man0g1.processEvent190_2(A0_211, A1_212, A2_213)
  A2_213:startCliantTalkTurn(2, A1_212)
  A2_213:say(A0_211, 360, 0)
  A2_213:finishCliantTalkTurn()
end
function Man0g1.processEvent200(A0_214, A1_215, A2_216)
  A0_214:startFadeOutCutSceneDefault(A1_215)
  A0_214:startNQCutScene("man0g200", 1)
  A0_214:startFadeInCutSceneAfterWarp(A1_215)
end
function Man0g1.processEvent200_2(A0_217, A1_218, A2_219)
  A2_219:startCliantTalkTurn(2, A1_218)
  A2_219:say(A0_217, 295, 0)
  A2_219:finishCliantTalkTurn()
end
function Man0g1.processEvent200_3(A0_220, A1_221, A2_222)
  A2_222:startCliantTalkTurn(2, A1_221)
  A2_222:say(A0_220, 296, 0)
  A2_222:finishCliantTalkTurn()
end
function Man0g1.processEvent200_4(A0_223, A1_224, A2_225)
  A2_225:say(A0_223, 297, 0)
end
function Man0g1.processEvent200_5(A0_226, A1_227, A2_228)
  A2_228:startCliantTalkTurn(2, A1_227)
  A2_228:say(A0_226, 298, 0)
  A2_228:finishCliantTalkTurn()
end
function Man0g1.processEvent200_6(A0_229, A1_230, A2_231)
  A2_231:startCliantTalkTurn(2, A1_230)
  A2_231:say(A0_229, 299, 0)
  A2_231:finishCliantTalkTurn()
end
function Man0g1.processEvent200_7(A0_232, A1_233, A2_234)
  A2_234:say(A0_232, 340, 0)
end
function Man0g1.processEvent200_8(A0_235, A1_236, A2_237)
  A2_237:say(A0_235, 341, 0)
end
function Man0g1.processEvent200_9(A0_238, A1_239, A2_240)
  A2_240:say(A0_238, 342, 0)
end
function Man0g1.processEvent200_10(A0_241, A1_242, A2_243)
  A2_243:say(A0_241, 343, 0)
end
function Man0g1.processEvent200_11(A0_244, A1_245, A2_246)
  A2_246:say(A0_244, 246, 0)
  A2_246:say(A0_244, 247, 0)
end
function Man0g1.processEvent210(A0_247, A1_248, A2_249)
  A0_247:startFadeOutCutSceneDefault(A1_248)
  A0_247:startNQCutScene("man0g210", 1)
  A0_247:startFadeInCutSceneAfterWarp(A1_248)
end
function Man0g1.processEvent210_2(A0_250, A1_251, A2_252)
  A2_252:startCliantTalkTurn(2, A1_251)
  A2_252:say(A0_250, 344, 0)
  A2_252:finishCliantTalkTurn()
end
function Man0g1.processEvent220(A0_253, A1_254, A2_255)
  A0_253:startFadeOutCutSceneDefault(A1_254)
  A0_253:startNQCutScene("man0g220", 1)
  A0_253:startFadeInCutSceneAfterWarp(A1_254)
end
function Man0g1.processEvent220_2(A0_256, A1_257, A2_258)
  A2_258:startCliantTalkTurn(2, A1_257)
  A2_258:say(A0_256, 345, 0)
  A2_258:say(A0_256, 346, 0)
  A2_258:finishCliantTalkTurn()
end
function Man0g1.processEvent220_3(A0_259, A1_260, A2_261)
  A2_261:startCliantTalkTurn(2, A1_260)
  A2_261:say(A0_259, 361, 0)
  A2_261:finishCliantTalkTurn()
end
function Man0g1.processEventComplete(A0_262, A1_263, A2_264)
  A2_264:startCliantTalkTurn(2, A1_263)
  A2_264:say(A0_262, 325, 0)
  A2_264:say(A0_262, 326, 0)
  A2_264:say(A0_262, 327, 0)
  A2_264:say(A0_262, 328, 0)
  A2_264:say(A0_262, 393, 0)
  A2_264:say(A0_262, 394, 0)
  A2_264:finishCliantTalkTurn()
end
function Man0g1.processEvent1000_2(A0_265, A1_266, A2_267)
  A2_267:startCliantTalkTurn(2, A1_266)
  A2_267:say(A0_265, 279, 0)
  A2_267:finishCliantTalkTurn()
end
function Man0g1.processEvent1000_3(A0_268, A1_269, A2_270)
  A2_270:startCliantTalkTurn(2, A1_269)
  A2_270:say(A0_268, 391, 0)
  A2_270:finishCliantTalkTurn()
end
function Man0g1.processEvent1000_5(A0_271, A1_272, A2_273)
  A2_273:startCliantTalkTurn(2, A1_272)
  A2_273:say(A0_271, 320, 0)
  A2_273:say(A0_271, 321, 0)
  A2_273:finishCliantTalkTurn()
end
function Man0g1.processTtrBlkNml001(A0_274, A1_275, A2_276)
  local L3_277, L4_278, L5_279, L6_280, L7_281, L8_282
  L3_277 = desktopWidget
  L4_278 = L3_277
  L3_277 = L3_277.isTutorialMode
  L3_277 = L3_277(L4_278)
  if L3_277 == false then
    L3_277 = desktopWidget
    L4_278 = L3_277
    L3_277 = L3_277.orderTutorialMode
    L3_277(L4_278)
  end
  L3_277 = worldMaster
  L4_278 = L3_277
  L3_277 = L3_277._aimCameraTutorial
  L5_279 = 4000611
  L3_277(L4_278, L5_279)
  L3_277 = worldMaster
  L4_278 = L3_277
  L3_277 = L3_277._lookAtPlayerTutorial
  L5_279 = 4000611
  L3_277(L4_278, L5_279)
  L3_277 = worldMaster
  L4_278 = L3_277
  L3_277 = L3_277._runCharaSchedulerTutorial
  L5_279 = 4000611
  L6_280 = 353972224
  L3_277(L4_278, L5_279, L6_280)
  L3_277 = worldMaster
  L4_278 = L3_277
  L3_277 = L3_277._runCharaSchedulerTutorial
  L5_279 = 4000611
  L6_280 = 403087360
  L3_277(L4_278, L5_279, L6_280)
  L4_278 = A0_274
  L3_277 = A0_274.sayFreeDisplayName
  L5_279 = 4000611
  L6_280 = A0_274
  L7_281 = 392
  L3_277(L4_278, L5_279, L6_280, L7_281)
  L3_277 = worldMaster
  L4_278 = L3_277
  L3_277 = L3_277._cancelLookAtPlayerTutorial
  L5_279 = 4000611
  L3_277(L4_278, L5_279)
  L3_277 = false
  L4_278 = false
  L5_279 = false
  L6_280 = false
  L7_281 = false
  L8_282 = 3
  desktopWidget:setTutorialMask(L3_277, L4_278, L5_279, L6_280, L7_281, L8_282)
  worldMaster:_cancelAimCameraTutorial(4000611)
end
function Man0g1.processEventTu_001(A0_283, A1_284, A2_285)
  local L3_286, L4_287, L5_288, L6_289, L7_290, L8_291, L9_292
  L3_286 = desktopWidget
  L4_287 = L3_286
  L3_286 = L3_286.isTutorialMode
  L3_286 = L3_286(L4_287)
  if L3_286 == false then
    L3_286 = desktopWidget
    L4_287 = L3_286
    L3_286 = L3_286.orderTutorialMode
    L3_286(L4_287)
  end
  L3_286 = desktopWidget
  L4_287 = L3_286
  L3_286 = L3_286.cancelDesktopWidgetMode
  L5_288 = 16
  L3_286(L4_287, L5_288)
  L3_286 = true
  L4_287 = true
  L5_288 = true
  L6_289 = true
  L7_290 = true
  L8_291 = 4
  L9_292 = desktopWidget
  L9_292 = L9_292.setTutorialMask
  L9_292(L9_292, L3_286, L4_287, L5_288, L6_289, L7_290, L8_291)
  L9_292 = 1
  desktopWidget:openTutorialWidget(L9_292, 15)
  if desktopWidget:isTutorialMode() == false then
    desktopWidget:orderTutorialMode()
  end
  L3_286 = true
  L4_287 = true
  L5_288 = true
  L6_289 = true
  L7_290 = true
  L8_291 = 2
  desktopWidget:setTutorialMask(L3_286, L4_287, L5_288, L6_289, L7_290, L8_291)
end
