require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man0l1", "ScenarioBaseClass")
function Man0l1.initText(A0_0)
  A0_0:_loadTextDataPermanently(94, "man0l1")
end
function Man0l1.processEvent010(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startNQCutScene("man0l110", 1)
  A0_1:startFadeInCutSceneAfterWarp(A1_2)
end
function Man0l1.processEvent010_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 19, 0)
  A2_6:say(A0_4, 174, 0)
  A2_6:finishCliantTalkTurn()
end
function Man0l1.processEvent010_3(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 20, 0)
  A2_9:say(A0_7, 175, 0)
  A2_9:finishCliantTalkTurn()
end
function Man0l1.processEvent010_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 21, 0)
  A2_12:say(A0_10, 22, 0)
  A2_12:finishCliantTalkTurn()
end
function Man0l1.processEvent010_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 23, 0)
  A2_15:say(A0_13, 24, 0)
  A2_15:finishCliantTalkTurn()
end
function Man0l1.processEvent010_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 176, 0)
  A2_18:say(A0_16, 177, 0)
  A2_18:finishCliantTalkTurn()
end
function Man0l1.processEvent010_7(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 178, 0)
  A2_21:say(A0_19, 179, 0)
  A2_21:finishCliantTalkTurn()
end
function Man0l1.processEvent010_8(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 28, 0)
  A2_24:finishCliantTalkTurn()
end
function Man0l1.processEvent020(A0_25, A1_26, A2_27)
  if desktopWidget:isTutorialMode() == true then
    desktopWidget:cancelDesktopWidgetMode(16)
    desktopWidget:cancelTutorialMode()
    desktopWidget:orderDesktopWidgetMode(16)
  end
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startNQCutScene("man0l120", 1)
  worldMaster:say(A0_25, 329)
  worldMaster:say(A0_25, 330)
  worldMaster:say(A0_25, 331)
  worldMaster:say(A0_25, 332)
  A0_25:startFadeInCutSceneAfterWarp(A1_26)
end
function Man0l1.processEvent020_2(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 295, 0)
  A2_30:say(A0_28, 296, 0)
  A2_30:say(A0_28, 297, 0)
  A2_30:finishCliantTalkTurn()
end
function Man0l1.processEvent025(A0_31, A1_32, A2_33)
  A0_31:tellByNpcLinkshellChat(1000015, A0_31, 298)
  A0_31:_wait(2)
  A0_31:tellByNpcLinkshellChat(1000015, A0_31, 299)
  A0_31:_wait(2)
  A0_31:tellByNpcLinkshellChat(1000015, A0_31, 300)
  A0_31:_wait(2)
  A0_31:tellByNpcLinkshellChat(1000015, A0_31, 301)
  A0_31:_wait(2)
  A0_31:tellByNpcLinkshellChat(1000015, A0_31, 302)
end
function Man0l1.processEvent025_2(A0_34, A1_35, A2_36)
  A0_34:tellByNpcLinkshellChat(1000015, A0_34, 298)
  A0_34:_wait(2)
  A0_34:tellByNpcLinkshellChat(1000015, A0_34, 299)
  A0_34:_wait(2)
  A0_34:tellByNpcLinkshellChat(1000015, A0_34, 319)
end
function Man0l1.processEvent026(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 322, 0)
  A2_39:finishCliantTalkTurn()
end
function Man0l1.processEvent027(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(1, A1_41)
  A2_42:say(A0_40, 306, 0)
  A2_42:say(A0_40, 307, 0)
  A2_42:say(A0_40, 308, 0)
  A2_42:say(A0_40, 309, 0)
  A2_42:say(A0_40, 310, 0)
  A2_42:say(A0_40, 311, 0)
  A2_42:finishCliantTalkTurn()
end
function Man0l1.processEvent027_2(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(1, A1_44)
  A2_45:say(A0_43, 180, 0)
  A2_45:say(A0_43, 181, 0)
  A2_45:say(A0_43, 182, 0)
  A2_45:say(A0_43, 183, 0)
  A2_45:finishCliantTalkTurn()
end
function Man0l1.processEvent027_3(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(1, A1_47)
  A2_48:say(A0_46, 219, 0)
  A2_48:say(A0_46, 220, 0)
  A2_48:finishCliantTalkTurn()
end
function Man0l1.processEvent027_4(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(1, A1_50)
  A2_51:say(A0_49, 221, 0)
  A2_51:say(A0_49, 222, 0)
  A2_51:finishCliantTalkTurn()
end
function Man0l1.processEvent030(A0_52, A1_53, A2_54)
  A0_52:startFadeOutCutSceneDefault(A1_53)
  A0_52:startNQCutScene("man0l130", 1)
  A0_52:startFadeInCutSceneDefault(A1_53)
end
function Man0l1.processEvent033(A0_55, A1_56, A2_57)
  worldMaster:say(A0_55, 333)
  worldMaster:say(A0_55, 334)
end
function Man0l1.processEvent030_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 312, 0)
  A2_60:say(A0_58, 313, 0)
  A2_60:say(A0_58, 314, 0)
  A2_60:finishCliantTalkTurn()
end
function Man0l1.processEvent035(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 56, 0)
  A2_63:say(A0_61, 57, 0)
  A2_63:finishCliantTalkTurn()
end
function Man0l1.processEvent035_2(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 223, 0)
  A2_66:finishCliantTalkTurn()
end
function Man0l1.processEvent040(A0_67, A1_68, A2_69)
  A0_67:startFadeOutCutSceneDefault(A1_68)
  A0_67:startNQCutScene("man0l140", 1)
  A0_67:startFadeInCutSceneAfterWarp(A1_68)
end
function Man0l1.processEvent40_2(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 264, 0)
  A2_72:say(A0_70, 265, 0)
  A2_72:finishCliantTalkTurn()
end
function Man0l1.processEvent050(A0_73, A1_74, A2_75)
  A0_73:startFadeOutCutSceneDefault(A1_74)
  A0_73:startNQCutScene("man0l150", 1)
  A0_73:startFadeInCutSceneAfterWarp(A1_74)
end
function Man0l1.processEvent050_2(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 184, 0)
  A2_78:say(A0_76, 185, 0)
  A2_78:finishCliantTalkTurn()
end
function Man0l1.processEvent050_3(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 186, 0)
  A2_81:say(A0_79, 187, 0)
  A2_81:finishCliantTalkTurn()
end
function Man0l1.processEvent050_4(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 188, 0)
  A2_84:say(A0_82, 189, 0)
  A2_84:finishCliantTalkTurn()
end
function Man0l1.processEvent050_5(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 190, 0)
  A2_87:say(A0_85, 191, 0)
  A2_87:say(A0_85, 192, 0)
  A2_87:finishCliantTalkTurn()
end
function Man0l1.processEvent050_6(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:_runCharaScheduler(354168832)
  A2_90:say(A0_88, 202, 0)
  A2_90:say(A0_88, 203, 0)
  A2_90:finishCliantTalkTurn()
end
function Man0l1.processEvent050_7(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 204, 0)
  A2_93:say(A0_91, 205, 0)
  A2_93:finishCliantTalkTurn()
end
function Man0l1.processEvent050_8(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 206, 0)
  A2_96:say(A0_94, 207, 0)
  A2_96:finishCliantTalkTurn()
end
function Man0l1.processEvent050_9(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:_runCharaScheduler(354177024)
  A2_99:say(A0_97, 208, 0)
  A2_99:say(A0_97, 209, 0)
  A2_99:finishCliantTalkTurn()
end
function Man0l1.processEvent050_10(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 210, 0)
  A2_102:say(A0_100, 211, 0)
  A2_102:finishCliantTalkTurn()
end
function Man0l1.processEvent050_11(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 212, 0)
  A2_105:finishCliantTalkTurn()
end
function Man0l1.processEvent050_12(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 213, 0)
  A2_108:finishCliantTalkTurn()
end
function Man0l1.processEvent050_13(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 214, 0)
  A2_111:finishCliantTalkTurn()
end
function Man0l1.processEvent050_14(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 215, 0)
  A2_114:finishCliantTalkTurn()
end
function Man0l1.processEvent050_15(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 216, 0)
  A2_117:finishCliantTalkTurn()
end
function Man0l1.processEvent060(A0_118, A1_119, A2_120)
  A0_118:startFadeOutCutSceneDefault(A1_119)
  A0_118:startNQCutScene("man0l160", 1)
  A0_118:startFadeInCutSceneAfterWarp(A1_119)
end
function Man0l1.processEvent065(A0_121, A1_122, A2_123)
  A0_121:startFadeOutCutSceneDefault(A1_122)
  A0_121:startNQCutScene("man0l160", 1)
  worldMaster:say(A0_121, 333)
  worldMaster:say(A0_121, 334)
  A0_121:startFadeInCutSceneAfterWarp(A1_122)
end
function Man0l1.processEvent60_2(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:say(A0_124, 267, 0)
  A2_126:finishCliantTalkTurn()
end
function Man0l1.processEvent070_2(A0_127, A1_128, A2_129)
  A2_129:startCliantTalkTurn(1, A1_128)
  A2_129:say(A0_127, 237, 0)
  A2_129:say(A0_127, 238, 0)
  A2_129:say(A0_127, 239, 0)
  A2_129:finishCliantTalkTurn()
end
function Man0l1.processEvent600(A0_130, A1_131, A2_132)
  A0_130:startFadeOutCutSceneDefault(A1_131)
  A0_130:startNQCutScene("man0l600", 1)
  A0_130:startFadeInCutSceneAfterWarp(A1_131)
end
function Man0l1.processEvent600_2(A0_133, A1_134, A2_135)
  A2_135:startCliantTalkTurn(1, A1_134)
  A2_135:say(A0_133, 193, 0)
  A2_135:say(A0_133, 194, 0)
  A2_135:finishCliantTalkTurn()
end
function Man0l1.processEvent600_3(A0_136, A1_137, A2_138)
  A2_138:startCliantTalkTurn(1, A1_137)
  A2_138:say(A0_136, 195, 0)
  A2_138:finishCliantTalkTurn()
end
function Man0l1.processEvent600_4(A0_139, A1_140, A2_141)
  A2_141:startCliantTalkTurn(2, A1_140)
  A2_141:say(A0_139, 196, 0)
  A2_141:say(A0_139, 197, 0)
  A2_141:finishCliantTalkTurn()
end
function Man0l1.processEvent601_1(A0_142, A1_143, A2_144)
  A2_144:startCliantTalkTurn(1, A1_143)
  A2_144:waitCliantTalkTurn()
  A2_144:_runCharaScheduler(83906560)
  A2_144:say(A0_142, 275, 0)
  A2_144:_waitForCharaSchedulerFinished(83906560)
  A2_144:finishCliantTalkTurn()
end
function Man0l1.processEvent601_2(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(1, A1_146)
  A2_147:waitCliantTalkTurn()
  A2_147:_runCharaScheduler(83914752)
  A2_147:say(A0_145, 276, 0)
  A2_147:_waitForCharaSchedulerFinished(83914752)
  A2_147:finishCliantTalkTurn()
end
function Man0l1.processEvent601_3(A0_148, A1_149, A2_150)
  A2_150:startCliantTalkTurn(1, A1_149)
  A2_150:waitCliantTalkTurn()
  A2_150:_runCharaScheduler(84004864)
  A2_150:say(A0_148, 277, 0)
  A2_150:_waitForCharaSchedulerFinished(84004864)
  A2_150:finishCliantTalkTurn()
end
function Man0l1.processEvent601_4(A0_151, A1_152, A2_153)
  A2_153:startCliantTalkTurn(1, A1_152)
  A2_153:waitCliantTalkTurn()
  A2_153:_runCharaScheduler(84000768)
  A2_153:say(A0_151, 278, 0)
  A2_153:_waitForCharaSchedulerFinished(84000768)
  A2_153:finishCliantTalkTurn()
end
function Man0l1.processEvent601_5(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(1, A1_155)
  A2_156:waitCliantTalkTurn()
  A2_156:_runCharaScheduler(83959808)
  A2_156:say(A0_154, 279, 0)
  A2_156:_waitForCharaSchedulerFinished(83959808)
  A2_156:finishCliantTalkTurn()
end
function Man0l1.processEvent601_6(A0_157, A1_158, A2_159)
  A2_159:startCliantTalkTurn(1, A1_158)
  A2_159:waitCliantTalkTurn()
  A2_159:_runCharaScheduler(83951616)
  A2_159:say(A0_157, 280, 0)
  A2_159:_waitForCharaSchedulerFinished(83951616)
  A2_159:finishCliantTalkTurn()
end
function Man0l1.processEvent601_7(A0_160, A1_161, A2_162)
  A2_162:say(A0_160, 281, 0)
end
function Man0l1.processEvent601_8(A0_163, A1_164, A2_165)
  A2_165:say(A0_163, 282, 0)
end
function Man0l1.processEvent602(A0_166, A1_167, A2_168)
  A2_168:startCliantTalkTurn(2, A1_167)
  A2_168:say(A0_166, 101, 0)
  A2_168:say(A0_166, 102, 0)
  A2_168:finishCliantTalkTurn()
end
function Man0l1.processEvent602_2(A0_169, A1_170, A2_171)
  A2_171:startCliantTalkTurn(1, A1_170)
  A2_171:say(A0_169, 234, 0)
  A2_171:say(A0_169, 235, 0)
  A2_171:say(A0_169, 236, 0)
  A2_171:finishCliantTalkTurn()
end
function Man0l1.processEvent602_3(A0_172, A1_173, A2_174)
  A2_174:startCliantTalkTurn(1, A1_173)
  A2_174:say(A0_172, 241, 0)
  if A2_174:ask(A0_172, 242, 2) == 1 then
    A2_174:say(A0_172, 245, 0)
    A2_174:say(A0_172, 246, 0)
  else
    A2_174:say(A0_172, 247, 0)
  end
  A2_174:finishCliantTalkTurn()
end
function Man0l1.processEvent604(A0_175, A1_176, A2_177)
  A0_175:startFadeOutCutSceneDefault(A1_176)
  A0_175:startNQCutScene("man0l604", 1)
  A0_175:startFadeInCutSceneAfterWarp(A1_176)
end
function Man0l1.processEvent604_2(A0_178, A1_179, A2_180)
  A0_178:startFadeOutCutSceneDefault(A1_179)
end
function Man0l1.processEvent604_3(A0_181, A1_182, A2_183)
  A0_181:startFadeInCutSceneDefault(A1_182)
end
function Man0l1.processEvent604_4(A0_184, A1_185, A2_186)
  local L3_187
  return L3_187
end
function Man0l1.processEvent605(A0_188, A1_189, A2_190)
  A0_188:startFadeOutCutSceneDefault(A1_189)
  A0_188:startNQCutScene("man0l605", 1)
  A0_188:startFadeInCutSceneAfterWarp(A1_189)
end
function Man0l1.processEvent605_2(A0_191, A1_192, A2_193)
  A2_193:say(A0_191, 119, 0)
end
function Man0l1.processEvent610(A0_194, A1_195, A2_196)
  A0_194:startFadeOutCutSceneDefault(A1_195)
  A0_194:startNQCutScene("man0l610", 1)
  A0_194:startFadeInCutSceneDefault(A1_195)
end
function Man0l1.processEvent610_2(A0_197, A1_198, A2_199)
  worldMaster:say(A0_197, 328)
end
function Man0l1.processEvent615(A0_200, A1_201, A2_202)
  A0_200:startFadeOutCutSceneDefault(A1_201)
  A0_200:startNQCutScene("man0l615", 1)
  A0_200:startFadeInCutSceneAfterWarp(A1_201)
end
function Man0l1.processEvent615_2(A0_203, A1_204, A2_205)
  A2_205:startCliantTalkTurn(1, A1_204)
  A2_205:say(A0_203, 248, 0)
  A2_205:say(A0_203, 249, 0)
  A2_205:finishCliantTalkTurn()
end
function Man0l1.processEvent620(A0_206, A1_207, A2_208)
  A0_206:startFadeOutCutSceneDefault(A1_207)
  A0_206:startNQCutScene("man0l620", 1)
  A0_206:startFadeInCutSceneDefault(A1_207)
end
function Man0l1.processEvent625(A0_209, A1_210, A2_211)
  A0_209:tellByNpcLinkshellChat(1000015, A0_209, 131)
  A0_209:_wait(2)
  A0_209:tellByNpcLinkshellChat(1000015, A0_209, 132)
end
function Man0l1.processEvent625_2(A0_212, A1_213, A2_214)
  A2_214:startCliantTalkTurn(1, A1_213)
  A2_214:say(A0_212, 250, 0)
  A2_214:say(A0_212, 251, 0)
  A2_214:finishCliantTalkTurn()
end
function Man0l1.processEvent630(A0_215, A1_216, A2_217)
  A0_215:startFadeOutCutSceneDefault(A1_216)
  A0_215:startNQCutScene("man0l630", 1)
  A0_215:startFadeInCutSceneAfterWarp(A1_216)
end
function Man0l1.processEvent630_2(A0_218, A1_219, A2_220)
  A2_220:startCliantTalkTurn(2, A1_219)
  A2_220:say(A0_218, 252, 0)
  A2_220:say(A0_218, 253, 0)
  A2_220:finishCliantTalkTurn()
end
function Man0l1.processEvent630_3(A0_221, A1_222, A2_223)
  A2_223:startCliantTalkTurn(2, A1_222)
  A2_223:say(A0_221, 254, 0)
  A2_223:say(A0_221, 255, 0)
  A2_223:finishCliantTalkTurn()
end
function Man0l1.processEvent630_4(A0_224, A1_225, A2_226)
  A2_226:startCliantTalkTurn(2, A1_225)
  A2_226:say(A0_224, 256, 0)
  A2_226:finishCliantTalkTurn()
end
function Man0l1.processEvent630_5(A0_227, A1_228, A2_229)
  A2_229:say(A0_227, 257, 0)
  A2_229:say(A0_227, 258, 0)
end
function Man0l1.processEvent630_6(A0_230, A1_231, A2_232)
  A2_232:say(A0_230, 259, 0)
  A2_232:say(A0_230, 260, 0)
end
function Man0l1.processEvent630_7(A0_233, A1_234, A2_235)
  A2_235:startCliantTalkTurn(2, A1_234)
  A2_235:say(A0_233, 261, 0)
  A2_235:say(A0_233, 262, 0)
  A2_235:finishCliantTalkTurn()
end
function Man0l1.processEvent630_8(A0_236, A1_237, A2_238)
  A2_238:startCliantTalkTurn(2, A1_237)
  A2_238:say(A0_236, 156, 0)
  A2_238:say(A0_236, 157, 0)
  A2_238:finishCliantTalkTurn()
end
function Man0l1.processEvent630_9(A0_239, A1_240, A2_241)
  A2_241:startCliantTalkTurn(2, A1_240)
  A2_241:say(A0_239, 133, 0)
  A2_241:finishCliantTalkTurn()
end
function Man0l1.processEvent632(A0_242, A1_243, A2_244)
  A2_244:startCliantTalkTurn(2, A1_243)
  A2_244:_runCharaScheduler(69165056)
  A2_244:say(A0_242, 154, 0)
  A2_244:say(A0_242, 155, 0)
  A2_244:_runCharaScheduler(354041856)
  A2_244:say(A0_242, 198, 0)
  A2_244:say(A0_242, 199, 0)
  A2_244:finishCliantTalkTurn()
end
function Man0l1.processEvent632_2(A0_245, A1_246, A2_247)
  A2_247:startCliantTalkTurn(2, A1_246)
  A2_247:say(A0_245, 240, 0)
  A2_247:finishCliantTalkTurn()
end
function Man0l1.processEvent635(A0_248, A1_249, A2_250)
  A0_248:startFadeOutCutSceneDefault(A1_249)
  A0_248:startNQCutScene("man0l635", 1)
  A0_248:startFadeInCutSceneAfterWarp(A1_249)
end
function Man0l1.processEvent637(A0_251, A1_252, A2_253)
  A0_251:tellByNpcLinkshellChat(1000015, A0_251, 161)
  A0_251:_wait(2)
  A0_251:tellByNpcLinkshellChat(1000015, A0_251, 162)
  A0_251:_wait(2)
  A0_251:tellByNpcLinkshellChat(1000015, A0_251, 163)
  A0_251:_wait(2)
  A0_251:tellByNpcLinkshellChat(1000015, A0_251, 164)
  A0_251:_wait(2)
  A0_251:startFadeInCutSceneAfterWarp(A1_252)
end
function Man0l1.processEventComplete(A0_254, A1_255, A2_256)
  A2_256:startCliantTalkTurn(2, A1_255)
  A2_256:say(A0_254, 315, 0)
  A2_256:say(A0_254, 316, 0)
  A2_256:_runCharaScheduler(68378624)
  A2_256:say(A0_254, 317, 0)
  A2_256:say(A0_254, 318, 0)
  A2_256:say(A0_254, 340, 0)
  A2_256:say(A0_254, 341, 0)
  A2_256:finishCliantTalkTurn()
end
function Man0l1.processEvent1000_1(A0_257, A1_258, A2_259)
  A2_259:startCliantTalkTurn(2, A1_258)
  A2_259:say(A0_257, 37, 0)
  A2_259:finishCliantTalkTurn()
end
function Man0l1.processEvent1000_2(A0_260, A1_261, A2_262)
  A2_262:startCliantTalkTurn(2, A1_261)
  A2_262:say(A0_260, 263, 0)
  A2_262:finishCliantTalkTurn()
end
function Man0l1.processEvent1000_3(A0_263, A1_264, A2_265)
  A2_265:startCliantTalkTurn(2, A1_264)
  A2_265:say(A0_263, 266, 0)
  A2_265:finishCliantTalkTurn()
end
function Man0l1.processEvent1000_4(A0_266, A1_267, A2_268)
  A2_268:startCliantTalkTurn(2, A1_267)
  A2_268:say(A0_266, 268, 0)
  A2_268:finishCliantTalkTurn()
end
function Man0l1.processEvent1000_5(A0_269, A1_270, A2_271)
  A2_271:say(A0_269, 269, 0)
  A2_271:say(A0_269, 270, 0)
end
function Man0l1.processEvent1000_6(A0_272, A1_273, A2_274)
  A2_274:startCliantTalkTurn(2, A1_273)
  A2_274:say(A0_272, 271, 0)
  A2_274:finishCliantTalkTurn()
end
function Man0l1.processEvent1000_7(A0_275, A1_276, A2_277)
  if A2_277:ask(A0_275, 272, 2) == 1 then
    return (A2_277:ask(A0_275, 272, 2))
  end
end
function Man0l1.processEventFadeIn604(A0_278, A1_279, A2_280)
end
function Man0l1.processTtrBlkNml001(A0_281, A1_282, A2_283)
  local L3_284, L4_285, L5_286, L6_287, L7_288, L8_289
  L3_284 = desktopWidget
  L4_285 = L3_284
  L3_284 = L3_284.isTutorialMode
  L3_284 = L3_284(L4_285)
  if L3_284 == false then
    L3_284 = desktopWidget
    L4_285 = L3_284
    L3_284 = L3_284.orderTutorialMode
    L3_284(L4_285)
  end
  L3_284 = worldMaster
  L4_285 = L3_284
  L3_284 = L3_284._aimCameraTutorial
  L5_286 = 4000604
  L3_284(L4_285, L5_286)
  L3_284 = worldMaster
  L4_285 = L3_284
  L3_284 = L3_284._lookAtPlayerTutorial
  L5_286 = 4000604
  L3_284(L4_285, L5_286)
  L3_284 = worldMaster
  L4_285 = L3_284
  L3_284 = L3_284._runCharaSchedulerTutorial
  L5_286 = 4000604
  L6_287 = 353972224
  L3_284(L4_285, L5_286, L6_287)
  L3_284 = worldMaster
  L4_285 = L3_284
  L3_284 = L3_284._runCharaSchedulerTutorial
  L5_286 = 4000604
  L6_287 = 403087360
  L3_284(L4_285, L5_286, L6_287)
  L4_285 = A0_281
  L3_284 = A0_281.sayFreeDisplayName
  L5_286 = 4000604
  L6_287 = A0_281
  L7_288 = 337
  L3_284(L4_285, L5_286, L6_287, L7_288)
  L3_284 = worldMaster
  L4_285 = L3_284
  L3_284 = L3_284._cancelLookAtPlayerTutorial
  L5_286 = 4000604
  L3_284(L4_285, L5_286)
  L3_284 = false
  L4_285 = false
  L5_286 = false
  L6_287 = false
  L7_288 = false
  L8_289 = 3
  desktopWidget:setTutorialMask(L3_284, L4_285, L5_286, L6_287, L7_288, L8_289)
  worldMaster:_cancelAimCameraTutorial(4000604)
end
function Man0l1.processTtrBlkNml002(A0_290, A1_291, A2_292)
  local L3_293, L4_294, L5_295, L6_296, L7_297, L8_298
  L3_293 = desktopWidget
  L4_294 = L3_293
  L3_293 = L3_293.isTutorialMode
  L3_293 = L3_293(L4_294)
  if L3_293 == false then
    L3_293 = desktopWidget
    L4_294 = L3_293
    L3_293 = L3_293.orderTutorialMode
    L3_293(L4_294)
  end
  L3_293 = worldMaster
  L4_294 = L3_293
  L3_293 = L3_293._aimCameraTutorial
  L5_295 = 4000605
  L3_293(L4_294, L5_295)
  L3_293 = worldMaster
  L4_294 = L3_293
  L3_293 = L3_293._lookAtPlayerTutorial
  L5_295 = 4000605
  L3_293(L4_294, L5_295)
  L3_293 = worldMaster
  L4_294 = L3_293
  L3_293 = L3_293._runCharaSchedulerTutorial
  L5_295 = 4000605
  L6_296 = 353972224
  L3_293(L4_294, L5_295, L6_296)
  L3_293 = worldMaster
  L4_294 = L3_293
  L3_293 = L3_293._runCharaSchedulerTutorial
  L5_295 = 4000605
  L6_296 = 403087360
  L3_293(L4_294, L5_295, L6_296)
  L4_294 = A0_290
  L3_293 = A0_290.sayFreeDisplayName
  L5_295 = 4000605
  L6_296 = A0_290
  L7_297 = 338
  L3_293(L4_294, L5_295, L6_296, L7_297)
  L3_293 = worldMaster
  L4_294 = L3_293
  L3_293 = L3_293._cancelLookAtPlayerTutorial
  L5_295 = 4000605
  L3_293(L4_294, L5_295)
  L3_293 = false
  L4_294 = false
  L5_295 = false
  L6_296 = false
  L7_297 = false
  L8_298 = 3
  desktopWidget:setTutorialMask(L3_293, L4_294, L5_295, L6_296, L7_297, L8_298)
  worldMaster:_cancelAimCameraTutorial(4000605)
end
function Man0l1.processEtc001(A0_299, A1_300, A2_301)
  A2_301:startCliantTalkTurn(2, A1_300)
  A2_301:_runCharaScheduler(353959936)
  A2_301:say(A0_299, 335, 0)
  A2_301:_runCharaScheduler(84054016)
  A2_301:say(A0_299, 336, 0)
  A2_301:finishCliantTalkTurn()
end
function Man0l1.processEtc002(A0_302, A1_303, A2_304)
  A2_304:startCliantTalkTurn(2, A1_303)
  A2_304:_runCharaScheduler(67727360)
  A2_304:say(A0_302, 337, 0)
  A2_304:finishCliantTalkTurn()
end
function Man0l1.processEtc003(A0_305, A1_306, A2_307)
  A2_307:startCliantTalkTurn(2, A1_306)
  A2_307:_runCharaScheduler(353972224)
  A2_307:say(A0_305, 338, 0)
  A2_307:finishCliantTalkTurn()
end
function Man0l1.processEventTu_001(A0_308, A1_309, A2_310)
  local L3_311, L4_312, L5_313, L6_314, L7_315, L8_316, L9_317
  L3_311 = desktopWidget
  L4_312 = L3_311
  L3_311 = L3_311.isTutorialMode
  L3_311 = L3_311(L4_312)
  if L3_311 == false then
    L3_311 = desktopWidget
    L4_312 = L3_311
    L3_311 = L3_311.orderTutorialMode
    L3_311(L4_312)
  end
  L3_311 = desktopWidget
  L4_312 = L3_311
  L3_311 = L3_311.cancelDesktopWidgetMode
  L5_313 = 16
  L3_311(L4_312, L5_313)
  L3_311 = true
  L4_312 = true
  L5_313 = true
  L6_314 = true
  L7_315 = true
  L8_316 = 4
  L9_317 = desktopWidget
  L9_317 = L9_317.setTutorialMask
  L9_317(L9_317, L3_311, L4_312, L5_313, L6_314, L7_315, L8_316)
  L9_317 = 1
  desktopWidget:openTutorialWidget(L9_317, 15)
  if desktopWidget:isTutorialMode() == false then
    desktopWidget:orderTutorialMode()
  end
  L3_311 = true
  L4_312 = true
  L5_313 = true
  L6_314 = true
  L7_315 = true
  L8_316 = 2
  desktopWidget:setTutorialMask(L3_311, L4_312, L5_313, L6_314, L7_315, L8_316)
end
function Man0l1.processEventTalkMenuManCutPreview(A0_318, A1_319, A2_320, A3_321)
  local L4_322
  if A3_321 == 10002 then
    L4_322 = nil
    if L4_322 == 1 then
    elseif L4_322 == 2 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l110", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 3 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l120", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 4 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l130", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 5 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l140", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 6 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l150", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 7 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l420", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 8 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l600", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 9 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l604", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 10 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l605", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 11 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l610", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 12 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l615", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 13 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l620", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 14 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l630", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 15 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l635", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 16 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l640", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    elseif L4_322 == 17 then
      A0_318:startFadeOutCutSceneDefault(A1_319)
      A0_318:startNQCutScene("man0l650", 1)
      A0_318:startFadeInCutSceneDefault(A1_319)
    end
  end
end
