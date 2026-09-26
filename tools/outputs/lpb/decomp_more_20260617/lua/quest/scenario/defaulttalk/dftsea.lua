require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("DftSea", "ScenarioBaseClass")
function DftSea.initText(A0_0)
  A0_0:_loadTextDataPermanently(311, "dftSea")
end
function DftSea.defaultTalkStartMan(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:finishCliantTalkTurn()
end
function DftSea.defaultTalkOiSAM(A0_4, A1_5, A2_6)
end
function DftSea.defaultTalkMLinhbo(A0_7, A1_8, A2_9)
end
function DftSea.defaultTalkWithMytesyn_001(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 2, 0)
  A2_12:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithUrsulie_001(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(354168832)
  A2_15:say(A0_13, 3, 0)
  A2_15:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAshakkal_001(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(1, A1_17)
  A2_18:_runCharaScheduler(354086912)
  A2_18:say(A0_16, 254, 0)
  A2_18:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithPiralnaut_001(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(354086912)
  A2_21:say(A0_19, 4, 0)
  A2_21:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBaderon_001(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 5, 0)
  A2_24:say(A0_22, 6, 0)
  A2_24:say(A0_22, 7, 0)
  A2_24:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithCharlys_001(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:_runCharaScheduler(69246976)
  A2_27:say(A0_25, 8, 0)
  A2_27:say(A0_25, 9, 0)
  A2_27:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNoline_001(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 11, 0)
  A2_30:say(A0_28, 12, 0)
  A2_30:say(A0_28, 13, 0)
  A2_30:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithJossy_001(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:_runCharaScheduler(354172928)
  A2_33:say(A0_31, 14, 0)
  A2_33:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithPrudentia_001(A0_34, A1_35, A2_36)
  A2_36:_runCharaScheduler(354086912)
  A2_36:say(A0_34, 15, 0)
  A2_36:say(A0_34, 16, 0)
end
function DftSea.defaultTalkWithPulmia_001(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:_runCharaScheduler(353976320)
  A2_39:say(A0_37, 17, 0)
  A2_39:say(A0_37, 18, 0)
  A2_39:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAentfoet_001(A0_40, A1_41, A2_42)
  A2_42:say(A0_40, 19, 0)
end
function DftSea.defaultTalkWithKikichua_001(A0_43, A1_44, A2_45)
  A2_45:say(A0_43, 20, 0)
end
function DftSea.defaultTalkWithGerulf_001(A0_46, A1_47, A2_48)
  A2_48:say(A0_46, 21, 0)
end
function DftSea.defaultTalkWithHobriaut_001(A0_49, A1_50, A2_51)
  A2_51:say(A0_49, 22, 0)
end
function DftSea.defaultTalkWithRsushmo_001(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(1, A1_53)
  A2_54:_runCharaScheduler(67731456)
  A2_54:say(A0_52, 23, 0)
  A2_54:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFrailoise_001(A0_55, A1_56, A2_57)
  A2_57:say(A0_55, 260, 0)
end
function DftSea.defaultTalkWithIsaudorel_001(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:_runCharaScheduler(354226176)
  A2_60:say(A0_58, 24, 0)
  A2_60:say(A0_58, 624, 0)
  A2_60:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTotoruto_001(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:_runCharaScheduler(354234368)
  A2_63:say(A0_61, 25, 0)
  A2_63:say(A0_61, 26, 0)
  A2_63:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithChaunollet_001(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:_runCharaScheduler(354000896)
  A2_66:say(A0_64, 27, 0)
  A2_66:say(A0_64, 28, 0)
  A2_66:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithRaragun_001(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:_runCharaScheduler(354177024)
  A2_69:say(A0_67, 29, 0)
  A2_69:say(A0_67, 30, 0)
  A2_69:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMynadaeg_001(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:_runCharaScheduler(354177024)
  A2_72:say(A0_70, 31, 0)
  A2_72:say(A0_70, 32, 0)
  A2_72:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTefhmoshroca_001(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:_runCharaScheduler(354177024)
  A2_75:say(A0_73, 33, 0)
  A2_75:say(A0_73, 34, 0)
  A2_75:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGinnade_001(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:_runCharaScheduler(354226176)
  A2_78:say(A0_76, 35, 0)
  A2_78:say(A0_76, 36, 0)
  A2_78:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithArthurioux_001(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:_runCharaScheduler(354226176)
  A2_81:say(A0_79, 37, 0)
  A2_81:say(A0_79, 38, 0)
  A2_81:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBodenolf_001(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 75, 0)
  A2_84:say(A0_82, 76, 0)
  A2_84:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBodenolf_002(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 509, 0)
  A2_87:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithQhaschalahko_001(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:_runCharaScheduler(354000896)
  A2_90:say(A0_88, 77, 0)
  A2_90:say(A0_88, 78, 0)
  A2_90:say(A0_88, 79, 0)
  A2_90:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithJoellaut_001(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:_runCharaScheduler(354172928)
  A2_93:say(A0_91, 80, 0)
  A2_93:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithIofa_001(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 81, 0)
  A2_96:say(A0_94, 82, 0)
  A2_96:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSyngsmyd_001(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:_runCharaScheduler(354177024)
  A2_99:say(A0_97, 83, 0)
  A2_99:say(A0_97, 84, 0)
  A2_99:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMartiallais_001(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:_runCharaScheduler(353968128)
  A2_102:say(A0_100, 85, 0)
  A2_102:say(A0_100, 86, 0)
  A2_102:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFaucillien_001(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:_runCharaScheduler(354168832)
  A2_105:say(A0_103, 39, 0)
  A2_105:say(A0_103, 40, 0)
  A2_105:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNnmulika_001(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 41, 0)
  A2_108:say(A0_106, 42, 0)
  A2_108:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithLouviaune_001(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:_runCharaScheduler(353964032)
  A2_111:say(A0_109, 43, 0)
  A2_111:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithClifton_001(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:_runCharaScheduler(354177024)
  A2_114:say(A0_112, 44, 0)
  A2_114:say(A0_112, 45, 0)
  A2_114:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithUndsatz_001(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:_runCharaScheduler(354177024)
  A2_117:say(A0_115, 46, 0)
  A2_117:say(A0_115, 47, 0)
  A2_117:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithRerenasu_001(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(1, A1_119)
  A2_120:_runCharaScheduler(70836224)
  A2_120:say(A0_118, 48, 0)
  A2_120:say(A0_118, 49, 0)
  A2_120:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithDacajinjahl_001(A0_121, A1_122, A2_123)
  A2_123:say(A0_121, 50, 0)
end
function DftSea.defaultTalkWithBloemerl_001(A0_124, A1_125, A2_126)
  A2_126:say(A0_124, 51, 0)
end
function DftSea.defaultTalkWithXavalien_001(A0_127, A1_128, A2_129)
  A2_129:startCliantTalkTurn(2, A1_128)
  A2_129:_runCharaScheduler(354082816)
  A2_129:say(A0_127, 52, 0)
  A2_129:say(A0_127, 53, 0)
  A2_129:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAstrid_001(A0_130, A1_131, A2_132)
  A2_132:_runCharaScheduler(354086912)
  A2_132:say(A0_130, 54, 0)
  A2_132:say(A0_130, 55, 0)
end
function DftSea.defaultTalkWithWaekbyrt_001(A0_133, A1_134, A2_135)
  A2_135:startCliantTalkTurn(2, A1_134)
  A2_135:say(A0_133, 56, 0)
  A2_135:say(A0_133, 57, 0)
  A2_135:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithWaekbyrt_002(A0_136, A1_137, A2_138)
  A2_138:say(A0_136, 539, 0)
end
function DftSea.defaultTalkWithNunuba_001(A0_139, A1_140, A2_141)
  A2_141:startCliantTalkTurn(2, A1_140)
  A2_141:_runCharaScheduler(354041856)
  A2_141:say(A0_139, 58, 0)
  A2_141:say(A0_139, 59, 0)
  A2_141:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSraemha_001(A0_142, A1_143, A2_144)
  A2_144:startCliantTalkTurn(2, A1_143)
  A2_144:say(A0_142, 60, 0)
  A2_144:say(A0_142, 61, 0)
  A2_144:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithOsitha_001(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(2, A1_146)
  A2_147:say(A0_145, 62, 0)
  A2_147:say(A0_145, 63, 0)
  A2_147:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNeale_001(A0_148, A1_149, A2_150)
  A2_150:startCliantTalkTurn(2, A1_149)
  A2_150:_runCharaScheduler(354234368)
  A2_150:say(A0_148, 64, 0)
  A2_150:say(A0_148, 65, 0)
  A2_150:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBayard_001(A0_151, A1_152, A2_153)
  A2_153:startCliantTalkTurn(2, A1_152)
  A2_153:_runCharaScheduler(354226176)
  A2_153:say(A0_151, 66, 0)
  A2_153:say(A0_151, 67, 0)
  A2_153:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTriaine_001(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(2, A1_155)
  A2_156:_runCharaScheduler(354226176)
  A2_156:say(A0_154, 68, 0)
  A2_156:say(A0_154, 69, 0)
  A2_156:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithWyrakhamazom_001(A0_157, A1_158, A2_159)
  A2_159:startCliantTalkTurn(2, A1_158)
  A2_159:_runCharaScheduler(354234368)
  A2_159:say(A0_157, 70, 0)
  A2_159:say(A0_157, 71, 0)
  A2_159:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithDhemsunn_001(A0_160, A1_161, A2_162)
  A2_162:startCliantTalkTurn(2, A1_161)
  A2_162:_runCharaScheduler(354172928)
  A2_162:say(A0_160, 72, 0)
  A2_162:say(A0_160, 73, 0)
  A2_162:say(A0_160, 74, 0)
  A2_162:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNanapiri_001(A0_163, A1_164, A2_165)
  A2_165:startCliantTalkTurn(2, A1_164)
  A2_165:say(A0_163, 105, 0)
  A2_165:say(A0_163, 106, 0)
  A2_165:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMharelak_001(A0_166, A1_167, A2_168)
  A2_168:startCliantTalkTurn(2, A1_167)
  A2_168:_runCharaScheduler(354226176)
  A2_168:say(A0_166, 364, 0)
  A2_168:say(A0_166, 365, 0)
  A2_168:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithHasthwab_001(A0_169, A1_170, A2_171)
  A2_171:startCliantTalkTurn(2, A1_170)
  A2_171:_runCharaScheduler(354177024)
  A2_171:say(A0_169, 366, 0)
  A2_171:say(A0_169, 367, 0)
  A2_171:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithIghiimoui_001(A0_172, A1_173, A2_174)
  A2_174:startCliantTalkTurn(1, A1_173)
  A2_174:say(A0_172, 368, 0)
  A2_174:say(A0_172, 369, 0)
  A2_174:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMimiroon_001(A0_175, A1_176, A2_177)
  A2_177:startCliantTalkTurn(2, A1_176)
  A2_177:say(A0_175, 370, 0)
  A2_177:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithJojoroon_001(A0_178, A1_179, A2_180)
  A2_180:startCliantTalkTurn(2, A1_179)
  A2_180:say(A0_178, 371, 0)
  A2_180:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithChichiroon_001(A0_181, A1_182, A2_183)
  A2_183:say(A0_181, 372, 0)
end
function DftSea.defaultTalkWithBuburoon_001(A0_184, A1_185, A2_186)
  A2_186:startCliantTalkTurn(2, A1_185)
  A2_186:say(A0_184, 375, 0)
  A2_186:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithHaldberk_001(A0_187, A1_188, A2_189)
  A2_189:startCliantTalkTurn(2, A1_188)
  A2_189:say(A0_187, 87, 0)
  A2_189:say(A0_187, 88, 0)
  A2_189:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithP_tahjha_001(A0_190, A1_191, A2_192)
  A2_192:startCliantTalkTurn(2, A1_191)
  A2_192:_runCharaScheduler(354168832)
  A2_192:say(A0_190, 89, 0)
  A2_192:say(A0_190, 90, 0)
  A2_192:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithElilwaen_001(A0_193, A1_194, A2_195)
  A2_195:startCliantTalkTurn(2, A1_194)
  A2_195:_runCharaScheduler(354168832)
  A2_195:say(A0_193, 91, 0)
  A2_195:say(A0_193, 92, 0)
  A2_195:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithDodoroba_001(A0_196, A1_197, A2_198)
  A2_198:_runCharaScheduler(354086912)
  A2_198:say(A0_196, 93, 0)
  A2_198:say(A0_196, 94, 0)
end
function DftSea.defaultTalkWithIvan_001(A0_199, A1_200, A2_201)
  A2_201:startCliantTalkTurn(2, A1_200)
  A2_201:_runCharaScheduler(67727360)
  A2_201:say(A0_199, 95, 0)
  A2_201:say(A0_199, 96, 0)
  A2_201:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithLilina_001(A0_202, A1_203, A2_204)
  A2_204:startCliantTalkTurn(2, A1_203)
  A2_204:say(A0_202, 97, 0)
  A2_204:say(A0_202, 98, 0)
  A2_204:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithThosinbaen_001(A0_205, A1_206, A2_207)
  A2_207:_runCharaScheduler(354086912)
  A2_207:say(A0_205, 99, 0)
  A2_207:say(A0_205, 100, 0)
end
function DftSea.defaultTalkWithRubh_epocan_001(A0_208, A1_209, A2_210)
  A2_210:say(A0_208, 101, 0)
  A2_210:say(A0_208, 102, 0)
end
function DftSea.defaultTalkWithRubh_hob_001(A0_211, A1_212, A2_213)
  A2_213:startCliantTalkTurn(2, A1_212)
  A2_213:_runCharaScheduler(353972224)
  A2_213:say(A0_211, 103, 0)
  A2_213:say(A0_211, 104, 0)
  A2_213:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMaunie_001(A0_214, A1_215, A2_216)
  A2_216:startCliantTalkTurn(2, A1_215)
  A2_216:_runCharaScheduler(354234368)
  A2_216:say(A0_214, 107, 0)
  A2_216:say(A0_214, 120, 0)
  A2_216:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMaunie_002(A0_217, A1_218, A2_219)
  A2_219:startCliantTalkTurn(2, A1_218)
  A2_219:_runCharaScheduler(354226176)
  A2_219:say(A0_217, 121, 0)
  A2_219:say(A0_217, 122, 0)
  A2_219:say(A0_217, 123, 0)
  A2_219:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMaunie_003(A0_220, A1_221, A2_222)
  A2_222:startCliantTalkTurn(2, A1_221)
  A2_222:_runCharaScheduler(354226176)
  A2_222:say(A0_220, 124, 0)
  A2_222:say(A0_220, 125, 0)
  A2_222:say(A0_220, 126, 0)
  A2_222:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGigirya_001(A0_223, A1_224, A2_225)
  A2_225:startCliantTalkTurn(2, A1_224)
  A2_225:_runCharaScheduler(354234368)
  A2_225:say(A0_223, 108, 0)
  A2_225:say(A0_223, 127, 0)
  A2_225:say(A0_223, 128, 0)
  A2_225:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGigirya_002(A0_226, A1_227, A2_228)
  A2_228:startCliantTalkTurn(2, A1_227)
  A2_228:_runCharaScheduler(354234368)
  A2_228:say(A0_226, 129, 0)
  A2_228:say(A0_226, 130, 0)
  A2_228:say(A0_226, 131, 0)
  A2_228:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGigirya_003(A0_229, A1_230, A2_231)
  A2_231:startCliantTalkTurn(2, A1_230)
  A2_231:_runCharaScheduler(354234368)
  A2_231:say(A0_229, 132, 0)
  A2_231:say(A0_229, 133, 0)
  A2_231:say(A0_229, 134, 0)
  A2_231:say(A0_229, 135, 0)
  A2_231:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKokoto_001(A0_232, A1_233, A2_234)
  A2_234:startCliantTalkTurn(2, A1_233)
  A2_234:_runCharaScheduler(354226176)
  A2_234:say(A0_232, 109, 0)
  A2_234:say(A0_232, 136, 0)
  A2_234:say(A0_232, 623, 0)
  A2_234:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKokoto_002(A0_235, A1_236, A2_237)
  A2_237:startCliantTalkTurn(2, A1_236)
  A2_237:_runCharaScheduler(354226176)
  A2_237:say(A0_235, 137, 0)
  A2_237:say(A0_235, 138, 0)
  A2_237:say(A0_235, 139, 0)
  A2_237:say(A0_235, 140, 0)
  A2_237:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKokoto_003(A0_238, A1_239, A2_240)
  A2_240:startCliantTalkTurn(2, A1_239)
  A2_240:_runCharaScheduler(354226176)
  A2_240:say(A0_238, 141, 0)
  A2_240:say(A0_238, 142, 0)
  A2_240:say(A0_238, 143, 0)
  A2_240:say(A0_238, 144, 0)
  A2_240:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTirauland_001(A0_241, A1_242, A2_243)
  A2_243:startCliantTalkTurn(2, A1_242)
  A2_243:say(A0_241, 110, 0)
  A2_243:say(A0_241, 145, 0)
  A2_243:say(A0_241, 146, 0)
  A2_243:say(A0_241, 147, 0)
  A2_243:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTirauland_010(A0_244, A1_245, A2_246)
  A2_246:startCliantTalkTurn(2, A1_245)
  A2_246:say(A0_244, 110, 0)
  A2_246:say(A0_244, 145, 0)
  A2_246:say(A0_244, 148, 0)
  A2_246:say(A0_244, 149, 0)
  A2_246:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTirauland_002(A0_247, A1_248, A2_249)
  A2_249:startCliantTalkTurn(2, A1_248)
  A2_249:say(A0_247, 150, 0)
  A2_249:say(A0_247, 151, 0)
  A2_249:say(A0_247, 152, 0)
  A2_249:say(A0_247, 411, 0)
  A2_249:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTirauland_003(A0_250, A1_251, A2_252)
  A2_252:startCliantTalkTurn(2, A1_251)
  A2_252:say(A0_250, 153, 0)
  A2_252:say(A0_250, 154, 0)
  A2_252:say(A0_250, 155, 0)
  A2_252:say(A0_250, 156, 0)
  A2_252:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithEstrilda_001(A0_253, A1_254, A2_255)
  A2_255:startCliantTalkTurn(2, A1_254)
  A2_255:_runCharaScheduler(354234368)
  A2_255:say(A0_253, 111, 0)
  A2_255:say(A0_253, 157, 0)
  A2_255:say(A0_253, 158, 0)
  A2_255:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithEstrilda_002(A0_256, A1_257, A2_258)
  A2_258:startCliantTalkTurn(2, A1_257)
  A2_258:_runCharaScheduler(354234368)
  A2_258:say(A0_256, 159, 0)
  A2_258:say(A0_256, 160, 0)
  A2_258:say(A0_256, 161, 0)
  A2_258:say(A0_256, 162, 0)
  A2_258:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithEstrilda_003(A0_259, A1_260, A2_261)
  A2_261:startCliantTalkTurn(2, A1_260)
  A2_261:_runCharaScheduler(354234368)
  A2_261:say(A0_259, 163, 0)
  A2_261:say(A0_259, 164, 0)
  A2_261:say(A0_259, 165, 0)
  A2_261:say(A0_259, 166, 0)
  A2_261:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGregory_001(A0_262, A1_263, A2_264)
  A2_264:startCliantTalkTurn(2, A1_263)
  A2_264:_runCharaScheduler(354226176)
  A2_264:say(A0_262, 112, 0)
  A2_264:say(A0_262, 167, 0)
  A2_264:say(A0_262, 168, 0)
  A2_264:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGregory_002(A0_265, A1_266, A2_267)
  A2_267:startCliantTalkTurn(2, A1_266)
  A2_267:_runCharaScheduler(354226176)
  A2_267:say(A0_265, 169, 0)
  A2_267:say(A0_265, 170, 0)
  A2_267:say(A0_265, 171, 0)
  A2_267:say(A0_265, 172, 0)
  A2_267:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGregory_003(A0_268, A1_269, A2_270)
  A2_270:startCliantTalkTurn(2, A1_269)
  A2_270:_runCharaScheduler(354226176)
  A2_270:say(A0_268, 173, 0)
  A2_270:say(A0_268, 174, 0)
  A2_270:say(A0_268, 175, 0)
  A2_270:say(A0_268, 176, 0)
  A2_270:say(A0_268, 177, 0)
  A2_270:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithChantine_001(A0_271, A1_272, A2_273)
  A2_273:startCliantTalkTurn(2, A1_272)
  A2_273:_runCharaScheduler(354234368)
  A2_273:say(A0_271, 113, 0)
  A2_273:say(A0_271, 178, 0)
  A2_273:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithChantine_002(A0_274, A1_275, A2_276)
  A2_276:startCliantTalkTurn(2, A1_275)
  A2_276:_runCharaScheduler(354234368)
  A2_276:say(A0_274, 179, 0)
  A2_276:say(A0_274, 180, 0)
  A2_276:say(A0_274, 181, 0)
  A2_276:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithChantine_003(A0_277, A1_278, A2_279)
  A2_279:startCliantTalkTurn(2, A1_278)
  A2_279:_runCharaScheduler(354234368)
  A2_279:say(A0_277, 182, 0)
  A2_279:say(A0_277, 183, 0)
  A2_279:say(A0_277, 184, 0)
  A2_279:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNanaka_001(A0_280, A1_281, A2_282)
  A2_282:startCliantTalkTurn(2, A1_281)
  A2_282:say(A0_280, 114, 0)
  A2_282:say(A0_280, 185, 0)
  A2_282:say(A0_280, 186, 0)
  A2_282:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNanaka_002(A0_283, A1_284, A2_285)
  A2_285:startCliantTalkTurn(2, A1_284)
  A2_285:say(A0_283, 187, 0)
  A2_285:say(A0_283, 188, 0)
  A2_285:say(A0_283, 189, 0)
  A2_285:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNanaka_003(A0_286, A1_287, A2_288)
  A2_288:startCliantTalkTurn(2, A1_287)
  A2_288:say(A0_286, 190, 0)
  A2_288:say(A0_286, 191, 0)
  A2_288:say(A0_286, 192, 0)
  A2_288:say(A0_286, 193, 0)
  A2_288:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKakamehi_001(A0_289, A1_290, A2_291)
  A2_291:startCliantTalkTurn(2, A1_290)
  A2_291:_runCharaScheduler(354226176)
  A2_291:say(A0_289, 115, 0)
  A2_291:say(A0_289, 194, 0)
  A2_291:say(A0_289, 195, 0)
  A2_291:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKakamehi_002(A0_292, A1_293, A2_294)
  A2_294:startCliantTalkTurn(2, A1_293)
  A2_294:_runCharaScheduler(354226176)
  A2_294:say(A0_292, 196, 0)
  A2_294:say(A0_292, 197, 0)
  A2_294:say(A0_292, 198, 0)
  A2_294:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKakamehi_003(A0_295, A1_296, A2_297)
  A2_297:startCliantTalkTurn(2, A1_296)
  A2_297:_runCharaScheduler(354226176)
  A2_297:say(A0_295, 199, 0)
  A2_297:say(A0_295, 200, 0)
  A2_297:say(A0_295, 201, 0)
  A2_297:say(A0_295, 202, 0)
  A2_297:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithStephannot_001(A0_298, A1_299, A2_300)
  A2_300:startCliantTalkTurn(2, A1_299)
  A2_300:say(A0_298, 116, 0)
  A2_300:say(A0_298, 203, 0)
  A2_300:say(A0_298, 204, 0)
  A2_300:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithStephannot_002(A0_301, A1_302, A2_303)
  A2_303:startCliantTalkTurn(2, A1_302)
  A2_303:say(A0_301, 205, 0)
  A2_303:say(A0_301, 206, 0)
  A2_303:say(A0_301, 207, 0)
  A2_303:say(A0_301, 208, 0)
  A2_303:say(A0_301, 412, 0)
  A2_303:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithStephannot_003(A0_304, A1_305, A2_306)
  A2_306:startCliantTalkTurn(2, A1_305)
  A2_306:say(A0_304, 209, 0)
  A2_306:say(A0_304, 210, 0)
  A2_306:say(A0_304, 211, 0)
  A2_306:say(A0_304, 212, 0)
  A2_306:say(A0_304, 213, 0)
  A2_306:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithJosias_001(A0_307, A1_308, A2_309)
  A2_309:startCliantTalkTurn(2, A1_308)
  A2_309:_runCharaScheduler(354234368)
  A2_309:say(A0_307, 117, 0)
  A2_309:say(A0_307, 214, 0)
  A2_309:say(A0_307, 215, 0)
  A2_309:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithJosias_002(A0_310, A1_311, A2_312)
  A2_312:startCliantTalkTurn(2, A1_311)
  A2_312:_runCharaScheduler(354234368)
  A2_312:say(A0_310, 216, 0)
  A2_312:say(A0_310, 217, 0)
  A2_312:say(A0_310, 218, 0)
  A2_312:say(A0_310, 413, 0)
  A2_312:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithJosias_003(A0_313, A1_314, A2_315)
  A2_315:startCliantTalkTurn(2, A1_314)
  A2_315:_runCharaScheduler(354234368)
  A2_315:say(A0_313, 219, 0)
  A2_315:say(A0_313, 220, 0)
  A2_315:say(A0_313, 221, 0)
  A2_315:say(A0_313, 222, 0)
  A2_315:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFrithuric_001(A0_316, A1_317, A2_318)
  A2_318:startCliantTalkTurn(2, A1_317)
  A2_318:_runCharaScheduler(69197824)
  A2_318:say(A0_316, 118, 0)
  A2_318:say(A0_316, 223, 0)
  A2_318:say(A0_316, 224, 0)
  A2_318:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFrithuric_002(A0_319, A1_320, A2_321)
  A2_321:startCliantTalkTurn(2, A1_320)
  A2_321:_runCharaScheduler(69197824)
  A2_321:say(A0_319, 225, 0)
  A2_321:say(A0_319, 226, 0)
  A2_321:say(A0_319, 227, 0)
  A2_321:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFrithuric_003(A0_322, A1_323, A2_324)
  A2_324:startCliantTalkTurn(2, A1_323)
  A2_324:_runCharaScheduler(69197824)
  A2_324:say(A0_322, 228, 0)
  A2_324:say(A0_322, 229, 0)
  A2_324:say(A0_322, 230, 0)
  A2_324:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithLauda_001(A0_325, A1_326, A2_327)
  A2_327:startCliantTalkTurn(2, A1_326)
  A2_327:_runCharaScheduler(354168832)
  A2_327:say(A0_325, 119, 0)
  A2_327:say(A0_325, 231, 0)
  A2_327:say(A0_325, 232, 0)
  A2_327:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithLauda_002(A0_328, A1_329, A2_330)
  A2_330:startCliantTalkTurn(2, A1_329)
  A2_330:_runCharaScheduler(354168832)
  A2_330:say(A0_328, 233, 0)
  A2_330:say(A0_328, 234, 0)
  A2_330:say(A0_328, 235, 0)
  A2_330:say(A0_328, 414, 0)
  A2_330:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithLauda_003(A0_331, A1_332, A2_333)
  A2_333:startCliantTalkTurn(2, A1_332)
  A2_333:_runCharaScheduler(354168832)
  A2_333:say(A0_331, 236, 0)
  A2_333:say(A0_331, 237, 0)
  A2_333:say(A0_331, 238, 0)
  A2_333:say(A0_331, 239, 0)
  A2_333:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithH_lahono_001(A0_334, A1_335, A2_336)
  A2_336:startCliantTalkTurn(2, A1_335)
  A2_336:_runCharaScheduler(354050048)
  A2_336:say(A0_334, 240, 0)
  A2_336:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithWyrstmann_001(A0_337, A1_338, A2_339)
  A2_339:say(A0_337, 241, 0)
  A2_339:say(A0_337, 242, 0)
  A2_339:say(A0_337, 243, 0)
end
function DftSea.defaultTalkWithTraveler030_001(A0_340, A1_341, A2_342)
  A2_342:startCliantTalkTurn(2, A1_341)
  A2_342:_runCharaScheduler(354226176)
  A2_342:say(A0_340, 244, 0)
  A2_342:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTraveler031_001(A0_343, A1_344, A2_345)
  A2_345:_runCharaScheduler(354226176)
  A2_345:say(A0_343, 245, 0)
  A2_345:say(A0_343, 525, 0)
end
function DftSea.defaultTalkWithTraveler032_001(A0_346, A1_347, A2_348)
  A2_348:startCliantTalkTurn(2, A1_347)
  A2_348:_runCharaScheduler(354226176)
  A2_348:say(A0_346, 246, 0)
  A2_348:say(A0_346, 247, 0)
  A2_348:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithYouty001_001(A0_349, A1_350, A2_351)
  A2_351:startCliantTalkTurn(2, A1_350)
  A2_351:say(A0_349, 248, 0)
  A2_351:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMerchant002_001(A0_352, A1_353, A2_354)
  A2_354:startCliantTalkTurn(2, A1_353)
  A2_354:say(A0_352, 249, 0)
  A2_354:say(A0_352, 250, 0)
  A2_354:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithPirate030_001(A0_355, A1_356, A2_357)
  A2_357:say(A0_355, 251, 0)
  A2_357:say(A0_355, 252, 0)
end
function DftSea.defaultTalkWithLady002_001(A0_358, A1_359, A2_360)
  A2_360:say(A0_358, 253, 0)
end
function DftSea.defaultTalkWithSlaiboli_001(A0_361, A1_362, A2_363)
  A2_363:say(A0_361, 261, 0)
end
function DftSea.defaultTalkWithSyhrdaeg_001(A0_364, A1_365, A2_366)
  A2_366:startCliantTalkTurn(2, A1_365)
  A2_366:say(A0_364, 262, 0)
  A2_366:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithPfynhaemr_001(A0_367, A1_368, A2_369)
  A2_369:say(A0_367, 263, 0)
end
function DftSea.defaultTalkWithMzimzizi_001(A0_370, A1_371, A2_372)
  A2_372:say(A0_370, 264, 0)
  A2_372:say(A0_370, 265, 0)
end
function DftSea.defaultTalkWithCarrilaut_001(A0_373, A1_374, A2_375)
  A2_375:say(A0_373, 266, 0)
end
function DftSea.defaultTalkWithGautzelin_001(A0_376, A1_377, A2_378)
  A2_378:say(A0_376, 267, 0)
end
function DftSea.defaultTalkWithZonggo_001(A0_379, A1_380, A2_381)
  A2_381:say(A0_379, 268, 0)
  A2_381:say(A0_379, 269, 0)
end
function DftSea.defaultTalkWithAdventurer032_001(A0_382, A1_383, A2_384)
  A2_384:say(A0_382, 270, -1)
end
function DftSea.defaultTalkWithKob031_001(A0_385, A1_386, A2_387)
  A2_387:say(A0_385, 271, 0)
  A2_387:say(A0_385, 272, 0)
end
function DftSea.defaultTalkWithJainelette_001(A0_388, A1_389, A2_390)
  A2_390:say(A0_388, 273, 0)
end
function DftSea.defaultTalkWithBrictt_001(A0_391, A1_392, A2_393)
  A2_393:say(A0_391, 274, 0)
  A2_393:say(A0_391, 275, 0)
end
function DftSea.defaultTalkWithLiautroix_001(A0_394, A1_395, A2_396)
  A2_396:say(A0_394, 276, 0)
  A2_396:say(A0_394, 277, 0)
end
function DftSea.defaultTalkWithLaniaitte_001(A0_397, A1_398, A2_399)
  A2_399:say(A0_397, 278, 0)
end
function DftSea.defaultTalkWithNyaalamo_001(A0_400, A1_401, A2_402)
  A2_402:startCliantTalkTurn(2, A1_401)
  A2_402:_runCharaScheduler(353959936)
  A2_402:say(A0_400, 279, 0)
  A2_402:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFaezbroes_001(A0_403, A1_404, A2_405)
  A2_405:startCliantTalkTurn(2, A1_404)
  A2_405:_runCharaScheduler(353959936)
  A2_405:say(A0_403, 280, 0)
  A2_405:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithIsleen_001(A0_406, A1_407, A2_408)
  A2_408:startCliantTalkTurn(2, A1_407)
  A2_408:say(A0_406, 281, 0)
  A2_408:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSundhimal_001(A0_409, A1_410, A2_411)
  A2_411:startCliantTalkTurn(2, A1_410)
  A2_411:say(A0_409, 282, 0)
  A2_411:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithEugennoix_001(A0_412, A1_413, A2_414)
  A2_414:startCliantTalkTurn(2, A1_413)
  A2_414:say(A0_412, 283, 0)
  A2_414:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithRyssfloh_001(A0_415, A1_416, A2_417, A3_418)
  A2_417:startCliantTalkTurn(2, A1_416)
  if A3_418 == 20 then
    A2_417:say(A0_415, 628, 0)
  else
    A2_417:say(A0_415, 284, 0)
  end
  A2_417:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKihtgamduhla_001(A0_419, A1_420, A2_421, A3_422)
  A2_421:startCliantTalkTurn(2, A1_420)
  if A3_422 == 20 then
    A2_421:say(A0_419, 629, 0)
  else
    A2_421:say(A0_419, 285, 0)
  end
  A2_421:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFabodji_001(A0_423, A1_424, A2_425)
  A2_425:say(A0_423, 286, 0)
end
function DftSea.defaultTalkWithRobairlain_001(A0_426, A1_427, A2_428)
  A2_428:say(A0_426, 287, 0)
end
function DftSea.defaultTalkWithNorman_001(A0_429, A1_430, A2_431)
  A2_431:startCliantTalkTurn(2, A1_430)
  A2_431:_runCharaScheduler(353964032)
  A2_431:say(A0_429, 288, 0)
  A2_431:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBaenskylt_001(A0_432, A1_433, A2_434)
  A2_434:startCliantTalkTurn(2, A1_433)
  A2_434:_runCharaScheduler(353959936)
  A2_434:say(A0_432, 289, 0)
  A2_434:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAimiliens_001(A0_435, A1_436, A2_437)
  A2_437:startCliantTalkTurn(2, A1_436)
  A2_437:_runCharaScheduler(353959936)
  A2_437:say(A0_435, 290, 0)
  A2_437:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFongho_001(A0_438, A1_439, A2_440, A3_441)
  A2_440:startCliantTalkTurn(2, A1_439)
  if A3_441 == false then
    A2_440:_runCharaScheduler(353984512)
    A2_440:say(A0_438, 553, 0)
    A2_440:say(A0_438, 554, 0)
    A2_440:say(A0_438, 555, 0)
  end
  A2_440:say(A0_438, 556, 0)
  A2_440:_runCharaScheduler(354041856)
  A2_440:say(A0_438, 557, 0)
  while true do
    if A2_440:askExtendWidget(A0_438, 558, 5, 1, 1) == 1 then
      A2_440:say(A0_438, 564, 0)
      A2_440:say(A0_438, 565, 0)
      A2_440:_runCharaScheduler(353959936)
      A2_440:say(A0_438, 566, 0)
      A2_440:say(A0_438, 567, 0)
    elseif A2_440:askExtendWidget(A0_438, 558, 5, 1, 1) == 2 then
      A2_440:say(A0_438, 568, 0)
      A2_440:_runCharaScheduler(354078720)
      A2_440:say(A0_438, 569, 0)
      A2_440:say(A0_438, 570, 0)
      A2_440:_runCharaScheduler(354054144)
      A2_440:say(A0_438, 571, 0)
      A2_440:say(A0_438, 572, 0)
      A2_440:say(A0_438, 588, 0)
      worldMaster:say(A0_438, 573, 0)
      worldMaster:say(A0_438, 589, 0)
    elseif A2_440:askExtendWidget(A0_438, 558, 5, 1, 1) == 3 then
      A2_440:_runCharaScheduler(353964032)
      A2_440:say(A0_438, 574, 0)
      A2_440:say(A0_438, 575, 0)
      A2_440:say(A0_438, 576, 0)
    elseif A2_440:askExtendWidget(A0_438, 558, 5, 1, 1) == 4 then
      A2_440:_runCharaScheduler(354078720)
      A2_440:say(A0_438, 577, 0)
      A2_440:say(A0_438, 578, 0)
      A2_440:say(A0_438, 579, 0)
      A2_440:say(A0_438, 580, 0)
      A2_440:_runCharaScheduler(354086912)
      A2_440:say(A0_438, 581, 0)
    elseif A2_440:askExtendWidget(A0_438, 558, 5, 1, 1) == 5 then
      A2_440:_runCharaScheduler(353984512)
      A2_440:say(A0_438, 582, 0)
      break
    elseif A2_440:askExtendWidget(A0_438, 558, 5, 1, 1) == -3 then
      break
    end
  end
  A2_440:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBaenryss_001(A0_442, A1_443, A2_444)
  A2_444:startCliantTalkTurn(2, A1_443)
  A2_444:_runCharaScheduler(354066432)
  A2_444:say(A0_442, 583, 0)
  A2_444:say(A0_442, 584, 0)
  A2_444:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithChachapi_001(A0_445, A1_446, A2_447)
  A2_447:startCliantTalkTurn(2, A1_446)
  A2_447:_runCharaScheduler(354226176)
  A2_447:say(A0_445, 585, 0)
  A2_447:say(A0_445, 586, 0)
  A2_447:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithForchetaix_001(A0_448, A1_449, A2_450)
  A2_450:startCliantTalkTurn(2, A1_449)
  A2_450:_runCharaScheduler(354000896)
  A2_450:say(A0_448, 587, 0)
  A2_450:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSosoze_001(A0_451, A1_452, A2_453)
  A2_453:startCliantTalkTurn(2, A1_452)
  A2_453:_runCharaScheduler(354168832)
  A2_453:say(A0_451, 292, 0)
  A2_453:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithColson_001(A0_454, A1_455, A2_456)
  A2_456:startCliantTalkTurn(2, A1_455)
  A2_456:say(A0_454, 293, 0)
  A2_456:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithHihine_001(A0_457, A1_458, A2_459)
  A2_459:startCliantTalkTurn(2, A1_458)
  A2_459:say(A0_457, 294, 0)
  A2_459:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTrinne_001(A0_460, A1_461, A2_462)
  A2_462:startCliantTalkTurn(2, A1_461)
  A2_462:_runCharaScheduler(354177024)
  A2_462:say(A0_460, 295, 0)
  A2_462:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSailor031_001(A0_463, A1_464, A2_465)
  A2_465:say(A0_463, 296, 0)
end
function DftSea.defaultTalkWithPorter001_001(A0_466, A1_467, A2_468)
  A2_468:say(A0_466, 297, 0)
end
function DftSea.defaultTalkWithAdventurer030_001(A0_469, A1_470, A2_471)
  A2_471:say(A0_469, 298, 0)
end
function DftSea.defaultTalkWithPirate031_001(A0_472, A1_473, A2_474)
  A2_474:say(A0_472, 299, 0)
end
function DftSea.defaultTalkWithLady001_001(A0_475, A1_476, A2_477)
  A2_477:_runCharaScheduler(354177024)
  A2_477:say(A0_475, 300, 0)
  A2_477:say(A0_475, 301, 0)
end
function DftSea.defaultTalkWithAdventurer031_001(A0_478, A1_479, A2_480)
  A2_480:say(A0_478, 302, 0)
end
function DftSea.defaultTalkWithSolelle_001(A0_481, A1_482, A2_483)
  A2_483:startCliantTalkTurn(2, A1_482)
  A2_483:_runCharaScheduler(354172928)
  A2_483:say(A0_481, 305, 0)
  A2_483:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithZanthael_001(A0_484, A1_485, A2_486)
  A2_486:startCliantTalkTurn(2, A1_485)
  A2_486:say(A0_484, 303, 0)
  A2_486:say(A0_484, 304, 0)
  A2_486:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithJghonako_001(A0_487, A1_488, A2_489)
  A2_489:startCliantTalkTurn(2, A1_488)
  A2_489:say(A0_487, 306, 0)
  A2_489:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAhldskyff_001(A0_490, A1_491, A2_492)
  A2_492:startCliantTalkTurn(2, A1_491)
  A2_492:_runCharaScheduler(353972224)
  A2_492:say(A0_490, 307, 0)
  A2_492:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSkarnwaen_001(A0_493, A1_494, A2_495)
  A2_495:say(A0_493, 630, 0)
  A2_495:say(A0_493, 631, 0)
end
function DftSea.defaultTalkWithGnibnpha_001(A0_496, A1_497, A2_498)
  A2_498:startCliantTalkTurn(2, A1_497)
  A2_498:_runCharaScheduler(353964032)
  A2_498:say(A0_496, 309, 0)
  A2_498:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAudaine_001(A0_499, A1_500, A2_501)
  A2_501:startCliantTalkTurn(2, A1_500)
  A2_501:_runCharaScheduler(353959936)
  A2_501:say(A0_499, 310, 0)
  A2_501:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithCeadda_001(A0_502, A1_503, A2_504)
  A2_504:startCliantTalkTurn(2, A1_503)
  A2_504:_runCharaScheduler(354041856)
  A2_504:say(A0_502, 311, 0)
  A2_504:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithZehrymm_001(A0_505, A1_506, A2_507)
  A2_507:say(A0_505, 632, 0)
  A2_507:say(A0_505, 633, 0)
end
function DftSea.defaultTalkWithTatasako_001(A0_508, A1_509, A2_510)
  A2_510:startCliantTalkTurn(2, A1_509)
  A2_510:_runCharaScheduler(354078720)
  A2_510:say(A0_508, 314, 0)
  A2_510:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithDympna_001(A0_511, A1_512, A2_513)
  A2_513:_runCharaScheduler(354004992)
  A2_513:say(A0_511, 315, 0)
end
function DftSea.defaultTalkWithBmallpa_001(A0_514, A1_515, A2_516)
  A2_516:say(A0_514, 634, 0)
  A2_516:say(A0_514, 635, 0)
end
function DftSea.defaultTalkWithFerdillaix_001(A0_517, A1_518, A2_519)
  A2_519:startCliantTalkTurn(2, A1_518)
  A2_519:say(A0_517, 318, 0)
  A2_519:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFufuna_001(A0_520, A1_521, A2_522)
  A2_522:startCliantTalkTurn(2, A1_521)
  A2_522:_runCharaScheduler(67727360)
  A2_522:say(A0_520, 319, 0)
  A2_522:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithDavyd_001(A0_523, A1_524, A2_525)
  A2_525:startCliantTalkTurn(2, A1_524)
  A2_525:_runCharaScheduler(354177024)
  A2_525:say(A0_523, 320, 0)
  A2_525:say(A0_523, 415, 0)
  A2_525:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithOrtolf_001(A0_526, A1_527, A2_528)
  A2_528:say(A0_526, 636, 0)
end
function DftSea.defaultTalkWithMaetistym_001(A0_529, A1_530, A2_531)
  A2_531:startCliantTalkTurn(2, A1_530)
  A2_531:_runCharaScheduler(354000896)
  A2_531:say(A0_529, 322, 0)
  A2_531:say(A0_529, 323, 0)
  A2_531:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFzhumii_001(A0_532, A1_533, A2_534)
  A2_534:startCliantTalkTurn(2, A1_533)
  A2_534:_runCharaScheduler(354082816)
  A2_534:say(A0_532, 324, 0)
  A2_534:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithShoshoma_001(A0_535, A1_536, A2_537)
  A2_537:startCliantTalkTurn(2, A1_536)
  A2_537:_runCharaScheduler(353972224)
  A2_537:say(A0_535, 325, 0)
  A2_537:say(A0_535, 326, 0)
  A2_537:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithArnegis_001(A0_538, A1_539, A2_540)
  A2_540:startCliantTalkTurn(1, A1_539)
  A2_540:_runCharaScheduler(69197824)
  A2_540:say(A0_538, 327, 0)
  A2_540:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithRbaharra_001(A0_541, A1_542, A2_543)
  A2_543:say(A0_541, 328, 0)
end
function DftSea.defaultTalkWithAergwynt_001(A0_544, A1_545, A2_546)
  A2_546:startCliantTalkTurn(2, A1_545)
  A2_546:_runCharaScheduler(69271552)
  A2_546:say(A0_544, 329, 0)
  A2_546:say(A0_544, 330, 0)
  A2_546:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKakalan_001(A0_547, A1_548, A2_549)
  A2_549:startCliantTalkTurn(2, A1_548)
  A2_549:_runCharaScheduler(354041856)
  A2_549:say(A0_547, 331, 0)
  A2_549:say(A0_547, 332, 0)
  A2_549:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSathzant_001(A0_550, A1_551, A2_552)
  A2_552:startCliantTalkTurn(2, A1_551)
  A2_552:say(A0_550, 333, 0)
  A2_552:say(A0_550, 334, 0)
  A2_552:say(A0_550, 526, 0)
  A2_552:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNnagali_001(A0_553, A1_554, A2_555)
  A2_555:startCliantTalkTurn(2, A1_554)
  A2_555:_runCharaScheduler(354168832)
  A2_555:say(A0_553, 335, 0)
  A2_555:say(A0_553, 336, 0)
  A2_555:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithVhynho_001(A0_556, A1_557, A2_558)
  A2_558:say(A0_556, 338, 0)
end
function DftSea.defaultTalkWithZuzule_001(A0_559, A1_560, A2_561)
  A2_561:startCliantTalkTurn(1, A1_560)
  A2_561:_runCharaScheduler(67805184)
  A2_561:say(A0_559, 339, 0)
  A2_561:say(A0_559, 340, 0)
  A2_561:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFuzakanzak_001(A0_562, A1_563, A2_564)
  A2_564:startCliantTalkTurn(2, A1_563)
  A2_564:_runCharaScheduler(354168832)
  A2_564:say(A0_562, 341, 0)
  A2_564:say(A0_562, 342, 0)
  A2_564:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBnhapla_001(A0_565, A1_566, A2_567)
  A2_567:startCliantTalkTurn(2, A1_566)
  A2_567:say(A0_565, 343, 0)
  A2_567:say(A0_565, 344, 0)
  A2_567:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMerlzirn_001(A0_568, A1_569, A2_570)
  A2_570:startCliantTalkTurn(2, A1_569)
  A2_570:say(A0_568, 345, 0)
  A2_570:say(A0_568, 346, 0)
  A2_570:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMerlzirn_002(A0_571, A1_572, A2_573)
  A2_573:startCliantTalkTurn(2, A1_572)
  A2_573:say(A0_571, 345, 0)
  A2_573:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNinianne_001(A0_574, A1_575, A2_576)
  A2_576:startCliantTalkTurn(2, A1_575)
  A2_576:_runCharaScheduler(354172928)
  A2_576:say(A0_574, 347, 0)
  A2_576:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNheujawantal_001(A0_577, A1_578, A2_579)
  A2_579:startCliantTalkTurn(2, A1_578)
  A2_579:_runCharaScheduler(354234368)
  A2_579:say(A0_577, 350, 0)
  A2_579:say(A0_577, 351, 0)
  A2_579:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMaisie_001(A0_580, A1_581, A2_582)
  A2_582:startCliantTalkTurn(2, A1_581)
  A2_582:say(A0_580, 348, 0)
  A2_582:say(A0_580, 349, 0)
  A2_582:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithWhahtoa_001(A0_583, A1_584, A2_585)
  A2_585:say(A0_583, 352, 0)
  A2_585:say(A0_583, 353, 0)
end
function DftSea.defaultTalkWithGnanghal_001(A0_586, A1_587, A2_588)
  A2_588:say(A0_586, 354, 0)
  A2_588:say(A0_586, 355, 0)
end
function DftSea.defaultTalkWithKehdamujuuk_001(A0_589, A1_590, A2_591)
  A2_591:startCliantTalkTurn(2, A1_590)
  A2_591:_runCharaScheduler(354177024)
  A2_591:say(A0_589, 356, 0)
  A2_591:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGert_001(A0_592, A1_593, A2_594)
  A2_594:startCliantTalkTurn(2, A1_593)
  A2_594:say(A0_592, 357, 0)
  A2_594:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithLorhzant_001(A0_595, A1_596, A2_597)
  A2_597:startCliantTalkTurn(2, A1_596)
  A2_597:_runCharaScheduler(354177024)
  A2_597:say(A0_595, 358, 0)
  A2_597:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithNahctahr_001(A0_598, A1_599, A2_600)
  A2_600:startCliantTalkTurn(2, A1_599)
  A2_600:_runCharaScheduler(353959936)
  A2_600:say(A0_598, 359, 0)
  A2_600:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKokomui_001(A0_601, A1_602, A2_603)
  A2_603:startCliantTalkTurn(2, A1_602)
  A2_603:_runCharaScheduler(353959936)
  A2_603:say(A0_601, 360, 0)
  A2_603:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithEptolmi_001(A0_604, A1_605, A2_606)
  A2_606:startCliantTalkTurn(2, A1_605)
  A2_606:_runCharaScheduler(353959936)
  A2_606:say(A0_604, 361, 0)
  A2_606:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithZabinie_001(A0_607, A1_608, A2_609)
  A2_609:startCliantTalkTurn(2, A1_608)
  A2_609:_runCharaScheduler(353959936)
  A2_609:say(A0_607, 362, 0)
  A2_609:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithDeladomadalado_001(A0_610, A1_611, A2_612)
  A2_612:say(A0_610, 373, 0)
end
function DftSea.defaultTalkWithSkoefmynd_001(A0_613, A1_614, A2_615)
  A2_615:say(A0_613, 374, 0)
end
function DftSea.defaultTalkWithBubusha_001(A0_616, A1_617, A2_618)
  A2_618:say(A0_616, 637, 0)
  A2_618:say(A0_616, 638, 0)
end
function DftSea.defaultTalkWithFupepe_001(A0_619, A1_620, A2_621)
  A2_621:startCliantTalkTurn(2, A1_620)
  A2_621:_runCharaScheduler(353959936)
  A2_621:say(A0_619, 378, 0)
  A2_621:say(A0_619, 379, 0)
  A2_621:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithOadebh_001(A0_622, A1_623, A2_624)
  A2_624:say(A0_622, 639, 0)
end
function DftSea.defaultTalkWithMyndeidin_001(A0_625, A1_626, A2_627)
  A2_627:startCliantTalkTurn(2, A1_626)
  A2_627:_runCharaScheduler(353959936)
  A2_627:say(A0_625, 381, 0)
  A2_627:say(A0_625, 382, 0)
  A2_627:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithModestmouse_001(A0_628, A1_629, A2_630)
  A2_630:startCliantTalkTurn(2, A1_629)
  A2_630:_runCharaScheduler(353959936)
  A2_630:say(A0_628, 383, 0)
  A2_630:say(A0_628, 384, 0)
  A2_630:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithDuchesnelt_001(A0_631, A1_632, A2_633)
  A2_633:startCliantTalkTurn(2, A1_632)
  A2_633:_runCharaScheduler(353959936)
  A2_633:say(A0_631, 385, 0)
  A2_633:say(A0_631, 386, 0)
  A2_633:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSkribskoef_001(A0_634, A1_635, A2_636)
  A2_636:startCliantTalkTurn(2, A1_635)
  A2_636:_runCharaScheduler(353959936)
  A2_636:say(A0_634, 387, 0)
  A2_636:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithYalabali_001(A0_637, A1_638, A2_639)
  A2_639:startCliantTalkTurn(2, A1_638)
  A2_639:_runCharaScheduler(353959936)
  A2_639:say(A0_637, 388, 0)
  A2_639:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSyzfrusk_001(A0_640, A1_641, A2_642)
  A2_642:startCliantTalkTurn(2, A1_641)
  A2_642:_runCharaScheduler(353959936)
  A2_642:say(A0_640, 389, 0)
  A2_642:say(A0_640, 390, 0)
  A2_642:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithInairoh_001(A0_643, A1_644, A2_645)
  A2_645:startCliantTalkTurn(2, A1_644)
  A2_645:_runCharaScheduler(353959936)
  A2_645:say(A0_643, 391, 0)
  A2_645:say(A0_643, 392, 0)
  A2_645:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMagaswyn_001(A0_646, A1_647, A2_648)
  A2_648:startCliantTalkTurn(2, A1_647)
  A2_648:_runCharaScheduler(353959936)
  A2_648:say(A0_646, 393, 0)
  A2_648:say(A0_646, 394, 0)
  A2_648:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSenahchalahko_001(A0_649, A1_650, A2_651)
  A2_651:startCliantTalkTurn(2, A1_650)
  A2_651:_runCharaScheduler(353959936)
  A2_651:say(A0_649, 395, 0)
  A2_651:say(A0_649, 396, 0)
  A2_651:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithWaldibert_001(A0_652, A1_653, A2_654)
  A2_654:startCliantTalkTurn(2, A1_653)
  A2_654:_runCharaScheduler(353959936)
  A2_654:say(A0_652, 397, 0)
  A2_654:say(A0_652, 398, 0)
  A2_654:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithEbandala_001(A0_655, A1_656, A2_657)
  A2_657:startCliantTalkTurn(2, A1_656)
  A2_657:_runCharaScheduler(353959936)
  A2_657:say(A0_655, 399, 0)
  A2_657:say(A0_655, 400, 0)
  A2_657:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithGuidingstar_001(A0_658, A1_659, A2_660)
  A2_660:startCliantTalkTurn(2, A1_659)
  A2_660:_runCharaScheduler(353959936)
  A2_660:say(A0_658, 401, 0)
  A2_660:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithHundredeyes_001(A0_661, A1_662, A2_663)
  A2_663:startCliantTalkTurn(2, A1_662)
  A2_663:_runCharaScheduler(353959936)
  A2_663:say(A0_661, 402, 0)
  A2_663:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSizhaepocan_001(A0_664, A1_665, A2_666)
  A2_666:startCliantTalkTurn(2, A1_665)
  A2_666:_runCharaScheduler(353959936)
  A2_666:say(A0_664, 597, 0)
  A2_666:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMareillie_001(A0_667, A1_668, A2_669)
  A2_669:startCliantTalkTurn(2, A1_668)
  A2_669:_runCharaScheduler(353959936)
  A2_669:say(A0_667, 403, 0)
  A2_669:say(A0_667, 404, 0)
  A2_669:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAngryriver_001(A0_670, A1_671, A2_672)
  A2_672:startCliantTalkTurn(2, A1_671)
  A2_672:_runCharaScheduler(353959936)
  A2_672:say(A0_670, 405, 0)
  A2_672:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSyntberk_001(A0_673, A1_674, A2_675)
  A2_675:startCliantTalkTurn(2, A1_674)
  A2_675:_runCharaScheduler(353959936)
  A2_675:say(A0_673, 406, 0)
  A2_675:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBibiraka_001(A0_676, A1_677, A2_678)
  A2_678:startCliantTalkTurn(2, A1_677)
  A2_678:_runCharaScheduler(353959936)
  A2_678:say(A0_676, 407, 0)
  A2_678:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithThatakhamazom_001(A0_679, A1_680, A2_681)
  A2_681:startCliantTalkTurn(2, A1_680)
  A2_681:_runCharaScheduler(353959936)
  A2_681:say(A0_679, 408, 0)
  A2_681:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithRoostingcrow_001(A0_682, A1_683, A2_684)
  A2_684:startCliantTalkTurn(2, A1_683)
  A2_684:_runCharaScheduler(353959936)
  A2_684:say(A0_682, 409, 0)
  A2_684:say(A0_682, 410, 0)
  A2_684:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithZentsa_001(A0_685, A1_686, A2_687)
  A2_687:startCliantTalkTurn(2, A1_686)
  A2_687:say(A0_685, 542, 0)
  A2_687:say(A0_685, 543, 0)
  A2_687:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAldyet_001(A0_688, A1_689, A2_690)
  A2_690:startCliantTalkTurn(2, A1_689)
  A2_690:say(A0_688, 544, 0)
  A2_690:say(A0_688, 545, 0)
  A2_690:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAjinZukajin_001(A0_691, A1_692, A2_693)
  A2_693:startCliantTalkTurn(2, A1_692)
  A2_693:say(A0_691, 546, 0)
  A2_693:say(A0_691, 547, 0)
  A2_693:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithRaplulu_001(A0_694, A1_695, A2_696)
  A2_696:startCliantTalkTurn(2, A1_695)
  A2_696:say(A0_694, 548, 0)
  A2_696:say(A0_694, 549, 0)
  A2_696:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithMurlskylt_001(A0_697, A1_698, A2_699)
  A2_699:startCliantTalkTurn(2, A1_698)
  A2_699:say(A0_697, 550, 0)
  A2_699:finishCliantTalkTurn()
end
function DftSea.defaultTalkWith_Aenore001(A0_700, A1_701, A2_702)
  A2_702:startCliantTalkTurn(2, A1_701)
  A2_702:say(A0_700, 551, 0)
  A2_702:say(A0_700, 552, 0)
  A2_702:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithANSGOR_100(A0_703, A1_704, A2_705)
  A2_705:startCliantTalkTurn(2, A1_704)
  A2_705:_runCharaScheduler(353959936)
  A2_705:say(A0_703, 416, 0)
  A2_705:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithImania_001(A0_706, A1_707, A2_708)
  A2_708:startCliantTalkTurn(2, A1_707)
  A2_708:say(A0_706, 510, 0)
  A2_708:say(A0_706, 511, 0)
  A2_708:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithSweetnix_001(A0_709, A1_710, A2_711)
  A2_711:startCliantTalkTurn(2, A1_710)
  A2_711:say(A0_709, 513, 0)
  A2_711:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithLolojo_001(A0_712, A1_713, A2_714)
  A2_714:startCliantTalkTurn(2, A1_713)
  A2_714:_runCharaScheduler(354172928)
  A2_714:say(A0_712, 514, 0)
  A2_714:say(A0_712, 528, 0)
  A2_714:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithQmolosi_001(A0_715, A1_716, A2_717)
  A2_717:startCliantTalkTurn(2, A1_716)
  A2_717:_runCharaScheduler(353959936)
  A2_717:say(A0_715, 515, 0)
  A2_717:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBran_001(A0_718, A1_719, A2_720)
  A2_720:startCliantTalkTurn(2, A1_719)
  A2_720:_runCharaScheduler(353964032)
  A2_720:say(A0_718, 516, 0)
  A2_720:say(A0_718, 532, 0)
  A2_720:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithTutumoko_001(A0_721, A1_722, A2_723)
  A2_723:startCliantTalkTurn(2, A1_722)
  A2_723:_runCharaScheduler(353964032)
  A2_723:say(A0_721, 529, 0)
  A2_723:say(A0_721, 530, 0)
  A2_723:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithBrianna_001(A0_724, A1_725, A2_726)
  A2_726:startCliantTalkTurn(2, A1_725)
  A2_726:_runCharaScheduler(353959936)
  A2_726:say(A0_724, 518, 0)
  A2_726:say(A0_724, 531, 0)
  A2_726:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithFaine_001(A0_727, A1_728, A2_729)
  A2_729:startCliantTalkTurn(2, A1_728)
  A2_729:_runCharaScheduler(353959936)
  A2_729:say(A0_727, 519, 0)
  A2_729:say(A0_727, 533, 0)
  A2_729:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAerghaemr_001(A0_730, A1_731, A2_732)
  A2_732:startCliantTalkTurn(2, A1_731)
  A2_732:_runCharaScheduler(353959936)
  A2_732:say(A0_730, 520, 0)
  A2_732:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithWalcher_001(A0_733, A1_734, A2_735)
  A2_735:startCliantTalkTurn(2, A1_734)
  A2_735:_runCharaScheduler(354082816)
  A2_735:say(A0_733, 527, 0)
  A2_735:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithKurtz_001(A0_736, A1_737, A2_738)
  A2_738:startCliantTalkTurn(2, A1_737)
  if A2_738:doSalute(1, 27) == 0 then
    A2_738:_runCharaScheduler(353959936)
  end
  A0_736:_wait(1)
  if A2_738:isUpperRank(1, 27) == true then
    A2_738:say(A0_736, 540, 0)
    A2_738:say(A0_736, 541, 0)
  else
    A2_738:say(A0_736, 619, 0)
    A2_738:say(A0_736, 620, 0)
  end
  A2_738:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithAlain_001(A0_739, A1_740, A2_741)
  A2_741:startCliantTalkTurn(2, A1_740)
  A0_739:_wait(1)
  if A2_741:isUpperRank(1, 23) == true then
    A2_741:finishCliantTalkTurn()
    A0_739:_wait(1)
    A2_741:_runCharaScheduler(84041728)
    A2_741:say(A0_739, 599, 0)
  else
    A2_741:say(A0_739, 621, 0)
    A2_741:finishCliantTalkTurn()
  end
end
function DftSea.defaultTalkCaravanChocoboLim_001(A0_742, A1_743, A2_744)
  A2_744:_runCharaScheduler(70017024)
  A0_742:_wait(0.5)
  A1_743:_runCharaScheduler(67111908)
end
function DftSea.downTownTalk(A0_745, A1_746, A2_747, A3_748, A4_749, A5_750)
  local L6_751
  if A5_750 == true then
    L6_751 = A2_747.say
    L6_751(A2_747, A0_745, 427, 0)
  else
    L6_751 = A2_747.startCliantTalkTurn
    L6_751(A2_747, 2, A1_746)
    L6_751 = A2_747.say
    L6_751(A2_747, A0_745, 419, 0)
  end
  while true do
    L6_751 = nil
    L6_751 = worldMaster:askRestrictChoices(A2_747, A0_745, 500, true, true, true, true, true, false, false, true)
    if L6_751 == nil or L6_751 == 8 then
      break
    elseif L6_751 == 1 then
      A2_747:say(A0_745, 428, 0)
      A2_747:say(A0_745, 600, 0)
    elseif L6_751 == 2 then
      A2_747:say(A0_745, 429, 0)
      A2_747:say(A0_745, 601, 0)
    elseif L6_751 == 3 then
      A2_747:say(A0_745, 430, 0)
      A2_747:say(A0_745, 602, 0)
    elseif L6_751 == 4 then
      A2_747:say(A0_745, 538, 0)
      A2_747:say(A0_745, 603, 0)
    elseif L6_751 == 5 then
      A2_747:say(A0_745, 431, 0)
      A2_747:say(A0_745, 604, 0)
      A2_747:say(A0_745, 432, 0)
    elseif L6_751 == 6 then
      if A3_748 == true then
        desktopWidget:askItemSearchWidget()
        return -2
      else
        A2_747:say(A0_745, 433, 0)
      end
    elseif L6_751 == 7 then
      return -1
    end
    A2_747:say(A0_745, 427, 0)
  end
  L6_751 = A2_747.finishCliantTalkTurn
  L6_751(A2_747)
end
function DftSea.tribeTalk(A0_752, A1_753, A2_754)
  A2_754:startCliantTalkTurn(2, A1_753)
  A2_754:say(A0_752, 434, 0)
  while true do
    if worldMaster:ask(A2_754, A0_752, 435, 3) == nil or worldMaster:ask(A2_754, A0_752, 435, 3) == 3 then
      break
    elseif worldMaster:ask(A2_754, A0_752, 435, 3) == 1 then
      if worldMaster:ask(A2_754, A0_752, 440, 5) == nil or worldMaster:ask(A2_754, A0_752, 440, 5) == 5 then
        break
      elseif worldMaster:ask(A2_754, A0_752, 440, 5) == 1 then
        A2_754:say(A0_752, 446, 0)
        A2_754:say(A0_752, 590, 0)
        A2_754:say(A0_752, 447, 0)
      elseif worldMaster:ask(A2_754, A0_752, 440, 5) == 2 then
        A2_754:say(A0_752, 448, 0)
        A2_754:say(A0_752, 449, 0)
        A2_754:say(A0_752, 591, 0)
      elseif worldMaster:ask(A2_754, A0_752, 440, 5) == 3 then
        A2_754:say(A0_752, 450, 0)
        A2_754:say(A0_752, 592, 0)
        A2_754:say(A0_752, 451, 0)
        A2_754:say(A0_752, 593, 0)
      end
    elseif worldMaster:ask(A2_754, A0_752, 435, 3) == 2 then
      if worldMaster:ask(A2_754, A0_752, 452, 5) == nil or worldMaster:ask(A2_754, A0_752, 452, 5) == 5 then
        break
      elseif worldMaster:ask(A2_754, A0_752, 452, 5) == 1 then
        A2_754:say(A0_752, 458, 0)
        A2_754:say(A0_752, 594, 0)
        A2_754:say(A0_752, 459, 0)
      elseif worldMaster:ask(A2_754, A0_752, 452, 5) == 2 then
        A2_754:say(A0_752, 460, 0)
        A2_754:say(A0_752, 595, 0)
        A2_754:say(A0_752, 461, 0)
      elseif worldMaster:ask(A2_754, A0_752, 452, 5) == 3 then
        A2_754:say(A0_752, 462, 0)
        A2_754:say(A0_752, 498, 0)
        A2_754:say(A0_752, 596, 0)
      end
    end
    A2_754:say(A0_752, 439, 0)
  end
  A2_754:finishCliantTalkTurn()
end
function DftSea.talkIdayCap(A0_755, A1_756, A2_757)
  A2_757:startCliantTalkTurnNoWait(1, A1_756)
  A2_757:say(A0_755, 521, 0)
  A2_757:finishCliantTalkTurn()
end
function DftSea.talkIday1(A0_758, A1_759, A2_760)
  A2_760:startCliantTalkTurnNoWait(1, A1_759)
  A2_760:say(A0_758, 522, 0)
  A2_760:say(A0_758, 523, 0)
  A2_760:finishCliantTalkTurn()
end
function DftSea.talkIday2(A0_761, A1_762, A2_763)
  A2_763:startCliantTalkTurnNoWait(1, A1_762)
  A2_763:say(A0_761, 524, 0)
  A2_763:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithInn_Desk(A0_764, A1_765, A2_766)
  A2_766:startCliantTalkTurn(2, A1_765)
  A2_766:_runCharaScheduler(353959936)
  A2_766:say(A0_764, 605, 0)
  while true do
    while true do
      while true do
        while true do
          while true do
            if A2_766:askExtendWidget(A0_764, 606, 5, 1, 1) == 5 or A2_766:askExtendWidget(A0_764, 606, 5, 1, 1) == -3 or A2_766:askExtendWidget(A0_764, 606, 5, 1, 1) == nil then
              break
            end
            if A2_766:askExtendWidget(A0_764, 606, 5, 1, 1) == 1 then
              A2_766:say(A0_764, 612, 0)
              return (A2_766:askExtendWidget(A0_764, 606, 5, 1, 1))
            end
          end
          if A2_766:askExtendWidget(A0_764, 606, 5, 1, 1) == 2 then
            A2_766:say(A0_764, 613, 0)
            worldMaster:say(A0_764, 614)
            worldMaster:say(A0_764, 615)
            worldMaster:say(A0_764, 618)
          end
        end
        if A2_766:askExtendWidget(A0_764, 606, 5, 1, 1) == 3 then
          A2_766:say(A0_764, 616, 0)
          worldMaster:say(A0_764, 617)
        end
      end
      if A2_766:askExtendWidget(A0_764, 606, 5, 1, 1) == 4 then
        A2_766:say(A0_764, 625, 0)
        worldMaster:say(A0_764, 622)
        if A2_766:askExtendWidget(worldMaster, 60016, 2, 1, 1) == 1 then
          A2_766:finishCliantTalkTurn()
          return 2
        end
      end
    end
  end
  A2_766:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithInn_ExitDoor(A0_767, A1_768, A2_769)
  if A2_769:askExtendWidget(worldMaster, 60013, 2, 1, 1) == 1 then
    return (A2_769:askExtendWidget(worldMaster, 60013, 2, 1, 1))
  else
  end
end
function DftSea.defaultTalkWithExit01(A0_770, A1_771, A2_772)
  if A2_772:askExtendWidget(worldMaster, 51036, 2, 1, 1) == 1 then
    return (A2_772:askExtendWidget(worldMaster, 51036, 2, 1, 1))
  else
  end
end
function DftSea.defaultTalkWithMarketNpc(A0_773, A1_774, A2_775)
  A2_775:startCliantTalkTurn(2, A1_774)
  A2_775:say(A0_773, 626, 0)
  A2_775:finishCliantTalkTurn()
end
function DftSea.defaultTalkWithHamletGuardLim_001(A0_776, A1_777, A2_778)
  A2_778:startCliantTalkTurn(2, A1_777)
  A2_778:_runCharaScheduler(354103296)
  A2_778:say(A0_776, 627, 0)
  A2_778:finishCliantTalkTurn()
end
