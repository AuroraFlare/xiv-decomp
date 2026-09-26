require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Bsm300", "ScenarioBaseClass")
function Bsm300.initText(A0_0)
  A0_0:_loadTextDataPermanently(229, "bsm300")
end
function Bsm300.processEventBodenolfStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 55, 0, A3_4)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 6, 0)
    A0_1:startFadeOutCutSceneDefault(A1_2)
    A0_1:startFadeInCutSceneAfterWarp(A1_2)
  else
    A2_3:say(A0_1, 7, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Bsm300.processEvent003(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 8, 0)
  A2_7:say(A0_5, 9, 0)
  A2_7:say(A0_5, 10, 0)
  A2_7:say(A0_5, 11, 0)
  A2_7:finishCliantTalkTurn()
end
function Bsm300.processEvent004(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 151, 0)
  A2_10:say(A0_8, 89, 0)
  A2_10:say(A0_8, 16, 0)
  A2_10:say(A0_8, 90, 0)
  A2_10:finishCliantTalkTurn()
end
function Bsm300.processEvent004_1(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:say(A0_11, 15, 0)
  A2_13:say(A0_11, 89, 0)
  A2_13:say(A0_11, 16, 0)
  A2_13:say(A0_11, 90, 0)
  A2_13:finishCliantTalkTurn()
end
function Bsm300.processEvent006(A0_14, A1_15, A2_16, A3_17)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:say(A0_14, 17, 0)
  A2_16:say(A0_14, 18, 0, A3_17)
  A2_16:say(A0_14, 19, 0)
  A2_16:say(A0_14, 20, 0, A3_17)
  A2_16:say(A0_14, 21, 0)
  A2_16:finishCliantTalkTurn()
end
function Bsm300.processEvent007(A0_18, A1_19, A2_20)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:say(A0_18, 22, 0)
  A2_20:say(A0_18, 23, 0)
  A2_20:finishCliantTalkTurn()
  A0_18:_wait(2)
end
function Bsm300.processEvent009(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 24, 0)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 25, 0)
  A2_23:say(A0_21, 45, 0)
  A2_23:finishCliantTalkTurn()
end
function Bsm300.processEvent010(A0_24, A1_25, A2_26)
  A0_24:startFadeOutCutSceneDefault(A1_25)
  A0_24:startNQCutScene("bsm30010", 1)
  A0_24:startFadeInCutSceneAfterWarp(A1_25)
end
function Bsm300.processEvent015(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:say(A0_27, 27, 0)
  A2_29:say(A0_27, 28, 0)
  A2_29:say(A0_27, 29, 0)
  A2_29:finishCliantTalkTurn()
  A0_27:_wait(1)
  A0_27:startFadeOutCutSceneDefault(A1_28)
  A0_27:startFadeInCutSceneAfterWarp(A1_28)
end
function Bsm300.processEvent020(A0_30, A1_31, A2_32)
  A0_30:startFadeOutCutSceneDefault(A1_31)
  A0_30:startNQCutScene("bsm30020", 1)
  A0_30:startFadeInCutSceneAfterWarp(A1_31)
end
function Bsm300.processEvent030(A0_33, A1_34, A2_35)
  A0_33:startFadeOutCutSceneDefault(A1_34)
  A0_33:startNQCutScene("bsm30030", 1)
  A0_33:startFadeInCutSceneAfterWarp(A1_34)
end
function Bsm300.processEvent040(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:say(A0_36, 40, 0)
  A2_38:say(A0_36, 41, 0)
  A2_38:say(A0_36, 42, 0)
  while true do
    while true do
      while true do
        while true do
          while true do
            if A2_38:ask(A0_36, 152, 3) == 1 then
              A1_37:_runCharaScheduler(67111905)
              A0_36:_wait(1)
              if A2_38:ask(A0_36, 156, 2) == 1 then
                A2_38:say(A0_36, 44, 0)
                do break end
                if A2_38:ask(A0_36, 152, 3) == 2 then
                  A1_37:_runCharaScheduler(67111904)
                  A0_36:_wait(1)
                  if A2_38:ask(A0_36, 156, 2) == 1 then
                    A2_38:say(A0_36, 44, 0)
                    do break end
                    if A2_38:ask(A0_36, 152, 3) == 3 then
                      A1_37:_runCharaScheduler(67111903)
                      A0_36:_wait(1)
                      if A2_38:ask(A0_36, 156, 2) == 1 then
                        A2_38:say(A0_36, 43, 0)
                        break
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  A0_36:_wait(3)
  A2_38:finishCliantTalkTurn()
end
function Bsm300.processEvent001_2(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 56, 0)
  A2_41:say(A0_39, 57, 0)
  A2_41:finishCliantTalkTurn()
end
function Bsm300.processEvent001_3(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 58, 0)
  A2_44:say(A0_42, 59, 0)
  A2_44:finishCliantTalkTurn()
end
function Bsm300.processEvent001_4(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 12, 0)
  A2_47:finishCliantTalkTurn()
end
function Bsm300.processEvent001_5(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:say(A0_48, 60, 0)
  A2_50:say(A0_48, 61, 0)
  A2_50:finishCliantTalkTurn()
end
function Bsm300.processEvent001_6(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:say(A0_51, 62, 0)
  A2_53:say(A0_51, 63, 0)
  A2_53:finishCliantTalkTurn()
end
function Bsm300.processEvent001_7_1(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(2, A1_55)
  A2_56:say(A0_54, 64, 0)
  A2_56:say(A0_54, 65, 0)
  A2_56:finishCliantTalkTurn()
end
function Bsm300.processEvent001_7_2(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:say(A0_57, 64, 0)
  A2_59:say(A0_57, 66, 0)
  A2_59:finishCliantTalkTurn()
end
function Bsm300.processEvent001_8(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:say(A0_60, 67, 0)
  A2_62:say(A0_60, 68, 0)
  A2_62:finishCliantTalkTurn()
end
function Bsm300.processEvent001_9(A0_63, A1_64, A2_65)
  A2_65:startCliantTalkTurn(2, A1_64)
  A2_65:say(A0_63, 69, 0)
  A2_65:say(A0_63, 70, 0)
  A2_65:finishCliantTalkTurn()
end
function Bsm300.processEvent001_10(A0_66, A1_67, A2_68)
  A2_68:startCliantTalkTurn(2, A1_67)
  A2_68:say(A0_66, 71, 0)
  A2_68:say(A0_66, 72, 0)
  A2_68:finishCliantTalkTurn()
end
function Bsm300.processEvent001_11(A0_69, A1_70, A2_71)
  A2_71:startCliantTalkTurn(2, A1_70)
  A2_71:say(A0_69, 73, 0)
  A2_71:say(A0_69, 74, 0)
  A2_71:finishCliantTalkTurn()
end
function Bsm300.processEvent003_2(A0_72, A1_73, A2_74)
  A2_74:startCliantTalkTurn(2, A1_73)
  A2_74:say(A0_72, 75, 0)
  A2_74:say(A0_72, 76, 0)
  A2_74:finishCliantTalkTurn()
end
function Bsm300.processEvent003_3(A0_75, A1_76, A2_77)
  A2_77:startCliantTalkTurn(2, A1_76)
  A2_77:say(A0_75, 77, 0)
  A2_77:say(A0_75, 78, 0)
  A2_77:finishCliantTalkTurn()
end
function Bsm300.processEvent003_4(A0_78, A1_79, A2_80)
  A2_80:startCliantTalkTurn(2, A1_79)
  A2_80:say(A0_78, 79, 0)
  A2_80:finishCliantTalkTurn()
end
function Bsm300.processEvent003_5(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(2, A1_82)
  A2_83:say(A0_81, 80, 0)
  A2_83:say(A0_81, 14, 0)
  A2_83:finishCliantTalkTurn()
end
function Bsm300.processEvent003_6(A0_84, A1_85, A2_86)
  A2_86:startCliantTalkTurn(2, A1_85)
  A2_86:say(A0_84, 81, 0)
  A2_86:say(A0_84, 82, 0)
  A2_86:finishCliantTalkTurn()
end
function Bsm300.processEvent003_7(A0_87, A1_88, A2_89)
  A2_89:startCliantTalkTurn(2, A1_88)
  A2_89:say(A0_87, 83, 0)
  A2_89:say(A0_87, 84, 0)
  A2_89:finishCliantTalkTurn()
end
function Bsm300.processEvent003_8(A0_90, A1_91, A2_92)
  A2_92:startCliantTalkTurn(2, A1_91)
  A2_92:say(A0_90, 85, 0)
  A2_92:say(A0_90, 86, 0)
  A2_92:finishCliantTalkTurn()
end
function Bsm300.processEvent003_9(A0_93, A1_94, A2_95)
  A2_95:startCliantTalkTurn(2, A1_94)
  A2_95:say(A0_93, 87, 0)
  A2_95:say(A0_93, 88, 0)
  A2_95:finishCliantTalkTurn()
end
function Bsm300.processEvent003_10(A0_96, A1_97, A2_98)
  A2_98:startCliantTalkTurn(2, A1_97)
  A2_98:say(A0_96, 10, 0)
  A2_98:finishCliantTalkTurn()
end
function Bsm300.processEvent004_2(A0_99, A1_100, A2_101)
  A2_101:startCliantTalkTurn(2, A1_100)
  A2_101:say(A0_99, 91, 0)
  A2_101:say(A0_99, 92, 0)
  A2_101:finishCliantTalkTurn()
end
function Bsm300.processEvent010_2(A0_102, A1_103, A2_104)
  A2_104:startCliantTalkTurn(2, A1_103)
  A2_104:say(A0_102, 93, 0)
  A2_104:say(A0_102, 94, 0)
  A2_104:finishCliantTalkTurn()
end
function Bsm300.processEvent010_3(A0_105, A1_106, A2_107)
  A2_107:startCliantTalkTurn(2, A1_106)
  A2_107:say(A0_105, 95, 0)
  A2_107:finishCliantTalkTurn()
end
function Bsm300.processEvent010_4(A0_108, A1_109, A2_110)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:say(A0_108, 96, 0)
  A2_110:finishCliantTalkTurn()
end
function Bsm300.processEvent010_5(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 97, 0)
  A2_113:say(A0_111, 98, 0)
  A2_113:finishCliantTalkTurn()
end
function Bsm300.processEvent015_2(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:say(A0_114, 99, 0)
  A2_116:finishCliantTalkTurn()
end
function Bsm300.processEvent015_3(A0_117, A1_118, A2_119)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:say(A0_117, 100, 0)
  A2_119:finishCliantTalkTurn()
end
function Bsm300.processEvent015_4(A0_120, A1_121, A2_122)
  A2_122:startCliantTalkTurn(2, A1_121)
  A2_122:say(A0_120, 101, 0)
  A2_122:finishCliantTalkTurn()
end
function Bsm300.processEvent015_5(A0_123, A1_124, A2_125)
  A2_125:startCliantTalkTurn(2, A1_124)
  A2_125:say(A0_123, 102, 0)
  A2_125:say(A0_123, 103, 0)
  A2_125:finishCliantTalkTurn()
end
function Bsm300.processEvent015_6(A0_126, A1_127, A2_128)
  A2_128:startCliantTalkTurn(2, A1_127)
  A2_128:say(A0_126, 104, 0)
  A2_128:say(A0_126, 105, 0)
  A2_128:finishCliantTalkTurn()
end
function Bsm300.processEvent015_7(A0_129, A1_130, A2_131)
  A2_131:startCliantTalkTurn(2, A1_130)
  A2_131:say(A0_129, 106, 0)
  A2_131:say(A0_129, 107, 0)
  A2_131:finishCliantTalkTurn()
end
function Bsm300.processEvent015_8(A0_132, A1_133, A2_134)
  A2_134:startCliantTalkTurn(2, A1_133)
  A2_134:say(A0_132, 108, 0)
  A2_134:say(A0_132, 109, 0)
  A2_134:finishCliantTalkTurn()
end
function Bsm300.processEvent015_9(A0_135, A1_136, A2_137)
  A2_137:startCliantTalkTurn(2, A1_136)
  A2_137:say(A0_135, 110, 0)
  A2_137:say(A0_135, 111, 0)
  A2_137:finishCliantTalkTurn()
end
function Bsm300.processEvent015_10(A0_138, A1_139, A2_140)
  A2_140:startCliantTalkTurn(2, A1_139)
  A2_140:say(A0_138, 112, 0)
  A2_140:say(A0_138, 113, 0)
  A2_140:finishCliantTalkTurn()
end
function Bsm300.processEvent015_11(A0_141, A1_142, A2_143)
  A2_143:startCliantTalkTurn(2, A1_142)
  A2_143:say(A0_141, 114, 0)
  A2_143:say(A0_141, 115, 0)
  A2_143:finishCliantTalkTurn()
end
function Bsm300.processEvent030_2(A0_144, A1_145, A2_146)
  A2_146:startCliantTalkTurn(2, A1_145)
  A2_146:say(A0_144, 116, 0)
  A2_146:say(A0_144, 117, 0)
  A2_146:finishCliantTalkTurn()
end
function Bsm300.processEvent030_3(A0_147, A1_148, A2_149)
  A2_149:startCliantTalkTurn(2, A1_148)
  A2_149:say(A0_147, 118, 0)
  A2_149:say(A0_147, 13, 0)
  A2_149:finishCliantTalkTurn()
end
function Bsm300.processEvent030_4(A0_150, A1_151, A2_152)
  A2_152:startCliantTalkTurn(2, A1_151)
  A2_152:say(A0_150, 119, 0)
  A2_152:finishCliantTalkTurn()
end
function Bsm300.processEvent030_5(A0_153, A1_154, A2_155)
  A2_155:startCliantTalkTurn(2, A1_154)
  A2_155:say(A0_153, 120, 0)
  A2_155:say(A0_153, 121, 0)
  A2_155:finishCliantTalkTurn()
end
function Bsm300.processEvent030_5_2(A0_156, A1_157, A2_158)
  A2_158:startCliantTalkTurn(2, A1_157)
  A2_158:say(A0_156, 120, 0)
  A2_158:say(A0_156, 159, 0)
  A2_158:finishCliantTalkTurn()
end
function Bsm300.processEvent030_6(A0_159, A1_160, A2_161)
  A2_161:startCliantTalkTurn(2, A1_160)
  A2_161:say(A0_159, 122, 0)
  A2_161:say(A0_159, 123, 0)
  A2_161:finishCliantTalkTurn()
end
function Bsm300.processEvent030_7(A0_162, A1_163, A2_164)
  A2_164:startCliantTalkTurn(2, A1_163)
  A2_164:say(A0_162, 124, 0)
  A2_164:finishCliantTalkTurn()
end
function Bsm300.processEvent030_8(A0_165, A1_166, A2_167)
  A2_167:startCliantTalkTurn(2, A1_166)
  A2_167:say(A0_165, 125, 0)
  A2_167:finishCliantTalkTurn()
end
function Bsm300.processEvent030_9(A0_168, A1_169, A2_170)
  A2_170:startCliantTalkTurn(2, A1_169)
  A2_170:say(A0_168, 126, 0)
  A2_170:say(A0_168, 127, 0)
  A2_170:finishCliantTalkTurn()
end
function Bsm300.processEventS001_1(A0_171, A1_172, A2_173)
  A2_173:say(A0_171, 128, 0)
end
function Bsm300.processEventS002_1(A0_174, A1_175, A2_176)
  A2_176:say(A0_174, 129, 0)
end
function Bsm300.processEventS003_1(A0_177, A1_178, A2_179)
  A2_179:startCliantTalkTurn(2, A1_178)
  A2_179:say(A0_177, 130, 0)
  A2_179:finishCliantTalkTurn()
end
function Bsm300.processEventS001_2(A0_180, A1_181, A2_182)
  A2_182:say(A0_180, 131, 0)
end
function Bsm300.processEventS002_2(A0_183, A1_184, A2_185)
  A2_185:say(A0_183, 132, 0)
end
function Bsm300.processEventS003_2(A0_186, A1_187, A2_188)
  A2_188:startCliantTalkTurn(2, A1_187)
  A2_188:say(A0_186, 133, 0)
  A2_188:finishCliantTalkTurn()
end
function Bsm300.processEventS001_3(A0_189, A1_190, A2_191)
  A2_191:say(A0_189, 134, 0)
end
function Bsm300.processEventS002_3(A0_192, A1_193, A2_194)
  A2_194:say(A0_192, 135, 0)
end
function Bsm300.processEventS003_3(A0_195, A1_196, A2_197)
  A2_197:startCliantTalkTurn(2, A1_196)
  A2_197:say(A0_195, 136, 0)
  A2_197:finishCliantTalkTurn()
end
function Bsm300.processEventS001_4(A0_198, A1_199, A2_200)
  A2_200:say(A0_198, 137, 0)
end
function Bsm300.processEventS002_4(A0_201, A1_202, A2_203)
  A2_203:say(A0_201, 138, 0)
end
function Bsm300.processEventS003_4(A0_204, A1_205, A2_206)
  A2_206:startCliantTalkTurn(2, A1_205)
  A2_206:say(A0_204, 139, 0)
  A2_206:finishCliantTalkTurn()
end
function Bsm300.processEventS001_5(A0_207, A1_208, A2_209)
  A2_209:say(A0_207, 140, 0)
end
function Bsm300.processEventS002_5(A0_210, A1_211, A2_212)
  A2_212:say(A0_210, 141, 0)
end
function Bsm300.processEventS003_5(A0_213, A1_214, A2_215)
  A2_215:startCliantTalkTurn(2, A1_214)
  A2_215:say(A0_213, 142, 0)
  A2_215:finishCliantTalkTurn()
end
function Bsm300.processEventS001_6(A0_216, A1_217, A2_218)
  A2_218:say(A0_216, 143, 0)
end
function Bsm300.processEventS002_6(A0_219, A1_220, A2_221)
  A2_221:say(A0_219, 144, 0)
end
function Bsm300.processEventS003_6(A0_222, A1_223, A2_224)
  A2_224:say(A0_222, 145, 0)
end
function Bsm300.processEventS001_7(A0_225, A1_226, A2_227)
  A2_227:startCliantTalkTurn(2, A1_226)
  A2_227:say(A0_225, 146, 0)
  A2_227:finishCliantTalkTurn()
end
function Bsm300.processEventS001_8(A0_228, A1_229, A2_230)
  A2_230:startCliantTalkTurn(2, A1_229)
  A2_230:say(A0_228, 147, 0)
  A2_230:finishCliantTalkTurn()
end
function Bsm300.processEventS001_9(A0_231, A1_232, A2_233)
  A2_233:startCliantTalkTurn(2, A1_232)
  A2_233:say(A0_231, 148, 0)
  A2_233:finishCliantTalkTurn()
end
function Bsm300.processEventS001_10(A0_234, A1_235, A2_236)
  A2_236:startCliantTalkTurn(2, A1_235)
  A2_236:say(A0_234, 149, 0)
  A2_236:finishCliantTalkTurn()
end
function Bsm300.processEventS001_11(A0_237, A1_238, A2_239)
  A2_239:startCliantTalkTurn(2, A1_238)
  A2_239:say(A0_237, 150, 0)
  A2_239:finishCliantTalkTurn()
end
function Bsm300.processEventS001_12(A0_240, A1_241, A2_242)
  A2_242:say(A0_240, 24, 0)
end
function Bsm300.processEventS001_13(A0_243, A1_244, A2_245)
  A2_245:startCliantTalkTurn(2, A1_244)
  A2_245:say(A0_243, 25, 0)
  A2_245:say(A0_243, 45, 0)
  A2_245:finishCliantTalkTurn()
end
