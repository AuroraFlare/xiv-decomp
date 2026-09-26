require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("DftWil", "ScenarioBaseClass")
function DftWil.initText(A0_0)
  A0_0:_loadTextDataPermanently(315, "dftWil")
end
function DftWil.defaultTalkWithOtopapottopa_001(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354177024)
  A2_3:say(A0_1, 1, 0)
  A2_3:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithThaisie_001(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 2, 0)
  A2_6:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMomodi_001(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 3, 0)
  A2_9:say(A0_7, 4, 0)
  A2_9:say(A0_7, 5, 0)
  A2_9:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKiora_001(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(354234368)
  A2_12:say(A0_10, 6, 0)
  A2_12:say(A0_10, 7, 0)
  A2_12:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKiora_002(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(354234368)
  A2_15:say(A0_13, 8, 0)
  A2_15:say(A0_13, 9, 0)
  A2_15:say(A0_13, 10, 0)
  A2_15:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKiora_003(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:_runCharaScheduler(354234368)
  A2_18:say(A0_16, 11, 0)
  A2_18:say(A0_16, 12, 0)
  A2_18:say(A0_16, 13, 0)
  A2_18:say(A0_16, 110, 0)
  A2_18:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithOpondhao_001(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(354226176)
  A2_21:say(A0_19, 14, 0)
  A2_21:say(A0_19, 15, 0)
  A2_21:say(A0_19, 16, 0)
  A2_21:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithOpondhao_002(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:_runCharaScheduler(354226176)
  A2_24:say(A0_22, 17, 0)
  A2_24:say(A0_22, 18, 0)
  A2_24:say(A0_22, 19, 0)
  A2_24:say(A0_22, 111, 0)
  A2_24:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithOpondhao_003(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:_runCharaScheduler(354226176)
  A2_27:say(A0_25, 20, 0)
  A2_27:say(A0_25, 21, 0)
  A2_27:say(A0_25, 22, 0)
  A2_27:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBertram_001(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:_runCharaScheduler(354234368)
  A2_30:say(A0_28, 24, 0)
  A2_30:say(A0_28, 25, 0)
  A2_30:say(A0_28, 112, 0)
  A2_30:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBertram_002(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:_runCharaScheduler(354234368)
  A2_33:say(A0_31, 26, 0)
  A2_33:say(A0_31, 27, 0)
  A2_33:say(A0_31, 28, 0)
  A2_33:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBertram_003(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:_runCharaScheduler(354234368)
  A2_36:say(A0_34, 30, 0)
  A2_36:say(A0_34, 31, 0)
  A2_36:say(A0_34, 32, 0)
  A2_36:say(A0_34, 33, 0)
  A2_36:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMinerva_001(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:_runCharaScheduler(354168832)
  A2_39:say(A0_37, 34, 0)
  A2_39:say(A0_37, 35, 0)
  A2_39:say(A0_37, 36, 0)
  A2_39:say(A0_37, 37, 0)
  A2_39:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMinerva_002(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:_runCharaScheduler(354168832)
  A2_42:say(A0_40, 40, 0)
  A2_42:say(A0_40, 41, 0)
  A2_42:say(A0_40, 42, 0)
  A2_42:say(A0_40, 113, 0)
  A2_42:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMinerva_003(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:_runCharaScheduler(354168832)
  A2_45:say(A0_43, 43, 0)
  A2_45:say(A0_43, 44, 0)
  A2_45:say(A0_43, 45, 0)
  A2_45:say(A0_43, 46, 0)
  A2_45:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMinerva_004(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:_runCharaScheduler(354168832)
  A2_48:say(A0_46, 34, 0)
  A2_48:say(A0_46, 35, 0)
  A2_48:say(A0_46, 38, 0)
  A2_48:say(A0_46, 39, 0)
  A2_48:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithZoengterbin_001(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:_runCharaScheduler(354177024)
  A2_51:say(A0_49, 47, 0)
  A2_51:say(A0_49, 48, 0)
  A2_51:say(A0_49, 49, 0)
  A2_51:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithZoengterbin_002(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:_runCharaScheduler(354177024)
  A2_54:say(A0_52, 50, 0)
  A2_54:say(A0_52, 51, 0)
  A2_54:say(A0_52, 52, 0)
  A2_54:say(A0_52, 53, 0)
  A2_54:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithZoengterbin_003(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:_runCharaScheduler(354177024)
  A2_57:say(A0_55, 54, 0)
  A2_57:say(A0_55, 55, 0)
  A2_57:say(A0_55, 56, 0)
  A2_57:say(A0_55, 57, 0)
  A2_57:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithStyrmoeya_001(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 58, 0)
  A2_60:say(A0_58, 59, 0)
  A2_60:say(A0_58, 60, 0)
  A2_60:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithStyrmoeya_002(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:_runCharaScheduler(354226176)
  A2_63:say(A0_61, 61, 0)
  A2_63:say(A0_61, 62, 0)
  A2_63:say(A0_61, 63, 0)
  A2_63:say(A0_61, 64, 0)
  A2_63:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithStyrmoeya_003(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:_runCharaScheduler(354226176)
  A2_66:say(A0_64, 65, 0)
  A2_66:say(A0_64, 66, 0)
  A2_66:say(A0_64, 67, 0)
  A2_66:say(A0_64, 68, 0)
  A2_66:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithYhahamariyo_001(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:_runCharaScheduler(354177024)
  A2_69:say(A0_67, 70, 0)
  A2_69:say(A0_67, 71, 0)
  A2_69:say(A0_67, 114, 0)
  A2_69:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithYhahamariyo_002(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:_runCharaScheduler(354177024)
  A2_72:say(A0_70, 72, 0)
  A2_72:say(A0_70, 73, 0)
  A2_72:say(A0_70, 74, 0)
  A2_72:say(A0_70, 115, 0)
  A2_72:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithYhahamariyo_003(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:_runCharaScheduler(354177024)
  A2_75:say(A0_73, 75, 0)
  A2_75:say(A0_73, 76, 0)
  A2_75:say(A0_73, 77, 0)
  A2_75:say(A0_73, 116, 0)
  A2_75:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHildie_001(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:_runCharaScheduler(354226176)
  A2_78:say(A0_76, 78, 0)
  A2_78:say(A0_76, 79, 0)
  A2_78:say(A0_76, 80, 0)
  A2_78:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHildie_002(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:_runCharaScheduler(354226176)
  A2_81:say(A0_79, 81, 0)
  A2_81:say(A0_79, 82, 0)
  A2_81:say(A0_79, 83, 0)
  A2_81:say(A0_79, 117, 0)
  A2_81:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHildie_003(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:_runCharaScheduler(354226176)
  A2_84:say(A0_82, 84, 0)
  A2_84:say(A0_82, 85, 0)
  A2_84:say(A0_82, 86, 0)
  A2_84:say(A0_82, 87, 0)
  A2_84:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLettice_001(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:_runCharaScheduler(353964032)
  A2_87:say(A0_85, 88, 0)
  A2_87:say(A0_85, 89, 0)
  A2_87:say(A0_85, 90, 0)
  A2_87:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLettice_002(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:_runCharaScheduler(353964032)
  A2_90:say(A0_88, 91, 0)
  A2_90:say(A0_88, 92, 0)
  A2_90:say(A0_88, 93, 0)
  A2_90:say(A0_88, 118, 0)
  A2_90:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLettice_003(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:_runCharaScheduler(353964032)
  A2_93:say(A0_91, 94, 0)
  A2_93:say(A0_91, 95, 0)
  A2_93:say(A0_91, 96, 0)
  A2_93:say(A0_91, 97, 0)
  A2_93:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTyon_001(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:_runCharaScheduler(353964032)
  A2_96:say(A0_94, 98, 0)
  A2_96:say(A0_94, 99, 0)
  A2_96:say(A0_94, 100, 0)
  A2_96:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTyon_002(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:_runCharaScheduler(353964032)
  A2_99:say(A0_97, 101, 0)
  A2_99:say(A0_97, 102, 0)
  A2_99:say(A0_97, 103, 0)
  A2_99:say(A0_97, 104, 0)
  A2_99:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTyon_003(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:_runCharaScheduler(353964032)
  A2_102:say(A0_100, 105, 0)
  A2_102:say(A0_100, 106, 0)
  A2_102:say(A0_100, 107, 0)
  A2_102:say(A0_100, 108, 0)
  A2_102:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSingleton_001(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:_runCharaScheduler(354172928)
  A2_105:say(A0_103, 348, 0)
  A2_105:say(A0_103, 349, 0)
  A2_105:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLulutsu_001(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:_runCharaScheduler(69337088)
  A2_108:say(A0_106, 119, 0)
  A2_108:say(A0_106, 120, 0)
  A2_108:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithPapawa_001(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:_runCharaScheduler(67727360)
  A2_111:say(A0_109, 121, 0)
  A2_111:say(A0_109, 122, 0)
  A2_111:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithFhruybolg_001(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:_runCharaScheduler(354172928)
  A2_114:say(A0_112, 123, 0)
  A2_114:say(A0_112, 124, 0)
  A2_114:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAbylgohamylgo_001(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:_runCharaScheduler(353964032)
  A2_117:say(A0_115, 125, 0)
  A2_117:say(A0_115, 126, 0)
  A2_117:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSwerdahrm_001(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 127, 0)
  A2_120:say(A0_118, 128, 0)
  A2_120:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWannore_001(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:_runCharaScheduler(354177024)
  A2_123:say(A0_121, 129, 0)
  A2_123:say(A0_121, 130, 0)
  A2_123:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGaleren_001(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:_runCharaScheduler(354168832)
  A2_126:say(A0_124, 131, 0)
  A2_126:say(A0_124, 132, 0)
  A2_126:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithFinecoromanecco_001(A0_127, A1_128, A2_129)
  A2_129:startCliantTalkTurn(2, A1_128)
  A2_129:_runCharaScheduler(354078720)
  A2_129:say(A0_127, 133, 0)
  A2_129:say(A0_127, 134, 0)
  A2_129:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithQmhalawi_001(A0_130, A1_131, A2_132)
  A2_132:startCliantTalkTurn(2, A1_131)
  A2_132:_runCharaScheduler(353964032)
  A2_132:say(A0_130, 135, 0)
  A2_132:say(A0_130, 136, 0)
  A2_132:say(A0_130, 637, 0)
  A2_132:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTitinin_001(A0_133, A1_134, A2_135)
  A2_135:startCliantTalkTurn(2, A1_134)
  A2_135:_runCharaScheduler(353959936)
  A2_135:say(A0_133, 350, 0)
  A2_135:say(A0_133, 351, 0)
  A2_135:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGagaruna_001(A0_136, A1_137, A2_138)
  A2_138:startCliantTalkTurn(2, A1_137)
  A2_138:_runCharaScheduler(354177024)
  A2_138:say(A0_136, 137, 0)
  A2_138:say(A0_136, 138, 0)
  A2_138:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKlamahni_001(A0_139, A1_140, A2_141)
  A2_141:startCliantTalkTurn(2, A1_140)
  A2_141:_runCharaScheduler(353959936)
  A2_141:say(A0_139, 139, 0)
  A2_141:say(A0_139, 140, 0)
  A2_141:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHalstein_001(A0_142, A1_143, A2_144)
  A2_144:startCliantTalkTurn(2, A1_143)
  A2_144:_runCharaScheduler(354168832)
  A2_144:say(A0_142, 141, 0)
  A2_144:say(A0_142, 142, 0)
  A2_144:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMelisie_001(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(2, A1_146)
  A2_147:_runCharaScheduler(353959936)
  A2_147:say(A0_145, 143, 0)
  A2_147:say(A0_145, 144, 0)
  A2_147:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithOrisic_001(A0_148, A1_149, A2_150)
  A2_150:startCliantTalkTurn(2, A1_149)
  A2_150:_runCharaScheduler(353959936)
  A2_150:say(A0_148, 145, 0)
  A2_150:say(A0_148, 146, 0)
  A2_150:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMaginfred_001(A0_151, A1_152, A2_153)
  A2_153:startCliantTalkTurn(2, A1_152)
  A2_153:_runCharaScheduler(353959936)
  A2_153:say(A0_151, 147, 0)
  A2_153:say(A0_151, 148, 0)
  A2_153:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithShamanilohmani_001(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(2, A1_155)
  A2_156:_runCharaScheduler(354168832)
  A2_156:say(A0_154, 149, 0)
  A2_156:say(A0_154, 150, 0)
  A2_156:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithIllofii_001(A0_157, A1_158, A2_159)
  A2_159:startCliantTalkTurn(2, A1_158)
  A2_159:_runCharaScheduler(353959936)
  A2_159:say(A0_157, 352, 0)
  A2_159:say(A0_157, 353, 0)
  A2_159:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithYayake_001(A0_160, A1_161, A2_162)
  A2_162:startCliantTalkTurn(2, A1_161)
  A2_162:_runCharaScheduler(353964032)
  A2_162:say(A0_160, 151, 0)
  A2_162:say(A0_160, 152, 0)
  A2_162:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithYayake_002(A0_163, A1_164, A2_165)
  A2_165:startCliantTalkTurn(2, A1_164)
  A2_165:_runCharaScheduler(353964032)
  A2_165:say(A0_163, 643, 0)
  A2_165:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTutubuki_001(A0_166, A1_167, A2_168)
  A2_168:startCliantTalkTurn(2, A1_167)
  A2_168:_runCharaScheduler(353964032)
  A2_168:say(A0_166, 153, 0)
  A2_168:say(A0_166, 154, 0)
  A2_168:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKamlitohalito_001(A0_169, A1_170, A2_171)
  A2_171:startCliantTalkTurn(1, A1_170)
  A2_171:_runCharaScheduler(353968128)
  A2_171:say(A0_169, 155, 0)
  A2_171:say(A0_169, 156, 0)
  A2_171:say(A0_169, 157, 0)
  A2_171:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTotono_001(A0_172, A1_173, A2_174)
  A2_174:startCliantTalkTurn(1, A1_173)
  A2_174:_runCharaScheduler(67727360)
  A2_174:say(A0_172, 158, 0)
  A2_174:say(A0_172, 159, 0)
  A2_174:say(A0_172, 631, 0)
  A2_174:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithFyrilsunn_001(A0_175, A1_176, A2_177)
  A2_177:_runCharaScheduler(353964032)
  A2_177:say(A0_175, 160, 0)
  A2_177:say(A0_175, 161, 0)
end
function DftWil.defaultTalkWithSinette_001(A0_178, A1_179, A2_180)
  A2_180:startCliantTalkTurn(2, A1_179)
  A2_180:_runCharaScheduler(353964032)
  A2_180:say(A0_178, 162, 0)
  A2_180:say(A0_178, 163, 0)
  A2_180:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDeaustie_001(A0_181, A1_182, A2_183)
  A2_183:startCliantTalkTurn(2, A1_182)
  A2_183:_runCharaScheduler(353964032)
  A2_183:say(A0_181, 164, 0)
  A2_183:say(A0_181, 165, 0)
  A2_183:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDeaustie_002(A0_184, A1_185, A2_186)
  A2_186:startCliantTalkTurn(2, A1_185)
  A2_186:_runCharaScheduler(353964032)
  A2_186:say(A0_184, 644, 0)
  A2_186:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJannie_001(A0_187, A1_188, A2_189)
  A2_189:startCliantTalkTurn(2, A1_188)
  A2_189:_runCharaScheduler(354172928)
  A2_189:say(A0_187, 166, 0)
  A2_189:say(A0_187, 167, 0)
  A2_189:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDylise_001(A0_190, A1_191, A2_192)
  A2_192:startCliantTalkTurn(1, A1_191)
  A2_192:_runCharaScheduler(354078720)
  A2_192:say(A0_190, 168, 0)
  A2_192:say(A0_190, 169, 0)
  A2_192:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBarnabaix_001(A0_193, A1_194, A2_195)
  A2_195:startCliantTalkTurn(1, A1_194)
  A2_195:_runCharaScheduler(353972224)
  A2_195:say(A0_193, 170, 0)
  A2_195:say(A0_193, 171, 0)
  A2_195:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAspipi_001(A0_196, A1_197, A2_198)
  A2_198:startCliantTalkTurn(1, A1_197)
  A2_198:_runCharaScheduler(67727360)
  A2_198:say(A0_196, 172, 0)
  A2_198:say(A0_196, 173, 0)
  A2_198:say(A0_196, 174, 0)
  A2_198:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGloiucen_001(A0_199, A1_200, A2_201)
  A2_201:startCliantTalkTurn(2, A1_200)
  A2_201:_runCharaScheduler(354172928)
  A2_201:say(A0_199, 175, 0)
  A2_201:say(A0_199, 176, 0)
  A2_201:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithCahernaut_001(A0_202, A1_203, A2_204)
  A2_204:startCliantTalkTurn(1, A1_203)
  A2_204:_runCharaScheduler(67723264)
  A2_204:say(A0_202, 177, 0)
  A2_204:say(A0_202, 178, 0)
  A2_204:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithElecotte_001(A0_205, A1_206, A2_207)
  A2_207:startCliantTalkTurn(2, A1_206)
  A2_207:_runCharaScheduler(354177024)
  A2_207:say(A0_205, 179, 0)
  A2_207:say(A0_205, 180, 0)
  A2_207:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBouchard_001(A0_208, A1_209, A2_210)
  A2_210:startCliantTalkTurn(2, A1_209)
  A2_210:_runCharaScheduler(354172928)
  A2_210:say(A0_208, 181, 0)
  A2_210:say(A0_208, 182, 0)
  A2_210:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSungikelungi_001(A0_211, A1_212, A2_213)
  A2_213:startCliantTalkTurn(2, A1_212)
  A2_213:_runCharaScheduler(353964032)
  A2_213:say(A0_211, 183, 0)
  A2_213:say(A0_211, 184, 0)
  A2_213:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHolbubu_001(A0_214, A1_215, A2_216)
  A2_216:startCliantTalkTurn(1, A1_215)
  A2_216:_runCharaScheduler(67727360)
  A2_216:say(A0_214, 185, 0)
  A2_216:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLefchild_001(A0_217, A1_218, A2_219)
  A2_219:startCliantTalkTurn(2, A1_218)
  A2_219:_runCharaScheduler(354177024)
  A2_219:say(A0_217, 186, 0)
  A2_219:say(A0_217, 187, 0)
  A2_219:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHnaufrid_001(A0_220, A1_221, A2_222)
  A2_222:startCliantTalkTurn(2, A1_221)
  A2_222:_runCharaScheduler(354168832)
  A2_222:say(A0_220, 188, 0)
  A2_222:say(A0_220, 189, 0)
  A2_222:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithNogeloix_001(A0_223, A1_224, A2_225)
  A2_225:startCliantTalkTurn(2, A1_224)
  A2_225:_runCharaScheduler(354172928)
  A2_225:say(A0_223, 190, 0)
  A2_225:say(A0_223, 191, 0)
  A2_225:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKukusi_001(A0_226, A1_227, A2_228)
  A2_228:startCliantTalkTurn(2, A1_227)
  A2_228:_runCharaScheduler(354082816)
  A2_228:say(A0_226, 192, 0)
  A2_228:say(A0_226, 193, 0)
  A2_228:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithObilitambili_001(A0_229, A1_230, A2_231)
  A2_231:startCliantTalkTurn(2, A1_230)
  A2_231:_runCharaScheduler(354177024)
  A2_231:say(A0_229, 194, 0)
  A2_231:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMiyaya_001(A0_232, A1_233, A2_234)
  A2_234:startCliantTalkTurn(1, A1_233)
  A2_234:_runCharaScheduler(67887104)
  A2_234:say(A0_232, 195, 0)
  A2_234:say(A0_232, 196, 0)
  A2_234:say(A0_232, 635, 0)
  A2_234:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithNomomo_001(A0_235, A1_236, A2_237, A3_238)
  A2_237:startCliantTalkTurn(2, A1_236)
  A2_237:_runCharaScheduler(353964032)
  if A3_238 == true then
    A2_237:say(A0_235, 650, 0)
  else
    A2_237:say(A0_235, 336, 0)
  end
  A2_237:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBerthar_001(A0_239, A1_240, A2_241)
  A2_241:startCliantTalkTurn(2, A1_240)
  A2_241:_runCharaScheduler(354078720)
  A2_241:say(A0_239, 337, 0)
  A2_241:say(A0_239, 338, 0)
  A2_241:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLinette_001(A0_242, A1_243, A2_244)
  A2_244:startCliantTalkTurn(2, A1_243)
  A2_244:_runCharaScheduler(353964032)
  A2_244:say(A0_242, 197, 0)
  A2_244:say(A0_242, 198, 0)
  A2_244:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMumukiya_001(A0_245, A1_246, A2_247)
  A2_247:startCliantTalkTurn(2, A1_246)
  A2_247:_runCharaScheduler(354168832)
  A2_247:say(A0_245, 199, 0)
  A2_247:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMohtfryd_001(A0_248, A1_249, A2_250)
  A2_250:say(A0_248, 200, 0)
  A2_250:say(A0_248, 201, 0)
end
function DftWil.defaultTalkWithYuyubesu_001(A0_251, A1_252, A2_253)
  A2_253:startCliantTalkTurn(1, A1_252)
  A2_253:_runCharaScheduler(67735552)
  A2_253:say(A0_251, 202, 0)
  A2_253:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithChachai_001(A0_254, A1_255, A2_256)
  A2_256:startCliantTalkTurn(2, A1_255)
  A2_256:_runCharaScheduler(354041856)
  A2_256:say(A0_254, 203, 0)
  A2_256:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithFifilo_001(A0_257, A1_258, A2_259)
  A2_259:startCliantTalkTurn(2, A1_258)
  A2_259:_runCharaScheduler(353964032)
  A2_259:say(A0_257, 204, 0)
  A2_259:say(A0_257, 486, 0)
  A2_259:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithPierriquet_001(A0_260, A1_261, A2_262)
  A2_262:startCliantTalkTurn(2, A1_261)
  A2_262:_runCharaScheduler(353959936)
  A2_262:say(A0_260, 205, 0)
  A2_262:say(A0_260, 206, 0)
  A2_262:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHawazizowazi_001(A0_263, A1_264, A2_265)
  A2_265:say(A0_263, 217, 0)
end
function DftWil.defaultTalkWithIsabella_001(A0_266, A1_267, A2_268)
  A2_268:say(A0_266, 218, 0)
end
function DftWil.defaultTalkWithCiceroix_001(A0_269, A1_270, A2_271)
  A2_271:say(A0_269, 219, 0)
end
function DftWil.defaultTalkWithXaunbolo_001(A0_272, A1_273, A2_274)
  A2_274:say(A0_272, 220, 0)
end
function DftWil.defaultTalkWithOefyrblaet_001(A0_275, A1_276, A2_277)
  A2_277:say(A0_275, 221, 0)
end
function DftWil.defaultTalkWithBabaki_001(A0_278, A1_279, A2_280)
  A2_280:say(A0_278, 222, 0)
end
function DftWil.defaultTalkWithLohwaeb_001(A0_281, A1_282, A2_283)
  A2_283:say(A0_281, 214, 0)
end
function DftWil.defaultTalkWithMargarete_001(A0_284, A1_285, A2_286)
  A2_286:say(A0_284, 215, 0)
end
function DftWil.defaultTalkWithRinhmaimhov_001(A0_287, A1_288, A2_289)
  A2_289:say(A0_287, 216, 0)
end
function DftWil.defaultTalkWithKukumuko_001(A0_290, A1_291, A2_292)
  A2_292:say(A0_290, 207, 0)
end
function DftWil.defaultTalkWithPopori_001(A0_293, A1_294, A2_295)
  A2_295:say(A0_293, 208, 0)
end
function DftWil.defaultTalkWithRururaji_001(A0_296, A1_297, A2_298)
  A2_298:startCliantTalkTurn(2, A1_297)
  A2_298:_runCharaScheduler(354177024)
  A2_298:say(A0_296, 252, 0)
  A2_298:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBlandhem_001(A0_299, A1_300, A2_301)
  A2_301:startCliantTalkTurn(2, A1_300)
  A2_301:say(A0_299, 253, 0)
  A2_301:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithChechedoba_001(A0_302, A1_303, A2_304)
  A2_304:startCliantTalkTurn(2, A1_303)
  A2_304:say(A0_302, 254, 0)
  A2_304:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithZllayan_001(A0_305, A1_306, A2_307)
  A2_307:startCliantTalkTurn(2, A1_306)
  A2_307:say(A0_305, 255, 0)
  A2_307:say(A0_305, 630, 0)
  A2_307:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithZirnbyrt_001(A0_308, A1_309, A2_310)
  A2_310:startCliantTalkTurn(2, A1_309)
  A2_310:_runCharaScheduler(354177024)
  A2_310:say(A0_308, 256, 0)
  A2_310:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithVhasotayuun_001(A0_311, A1_312, A2_313)
  A2_313:startCliantTalkTurn(2, A1_312)
  A2_313:_runCharaScheduler(353964032)
  A2_313:say(A0_311, 257, 0)
  A2_313:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithChamberlain_001(A0_314, A1_315, A2_316)
  A2_316:startCliantTalkTurn(2, A1_315)
  A2_316:_runCharaScheduler(354172928)
  A2_316:say(A0_314, 258, 0)
  A2_316:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWyntkelt_001(A0_317, A1_318, A2_319)
  A2_319:startCliantTalkTurn(2, A1_318)
  A2_319:_runCharaScheduler(354172928)
  A2_319:say(A0_317, 259, 0)
  A2_319:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLdhakya_001(A0_320, A1_321, A2_322)
  A2_322:startCliantTalkTurn(2, A1_321)
  A2_322:say(A0_320, 260, 0)
  A2_322:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithPulbeiyalbei_001(A0_323, A1_324, A2_325)
  A2_325:startCliantTalkTurn(2, A1_324)
  A2_325:_runCharaScheduler(354168832)
  A2_325:say(A0_323, 261, 0)
  A2_325:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAudrye_001(A0_326, A1_327, A2_328)
  A2_328:startCliantTalkTurn(2, A1_327)
  A2_328:_runCharaScheduler(354177024)
  A2_328:say(A0_326, 262, 0)
  A2_328:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGembert_001(A0_329, A1_330, A2_331)
  A2_331:startCliantTalkTurn(2, A1_330)
  A2_331:_runCharaScheduler(354168832)
  A2_331:say(A0_329, 263, 0)
  A2_331:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWawaton_001(A0_332, A1_333, A2_334)
  A2_334:say(A0_332, 209, 0)
end
function DftWil.defaultTalkWithDyalwann_001(A0_335, A1_336, A2_337)
end
function DftWil.defaultTalkWithSedemode_001(A0_338, A1_339, A2_340)
end
function DftWil.defaultTalkWithGogofu_001(A0_341, A1_342, A2_343)
  A2_343:say(A0_341, 212, 0)
  A2_343:say(A0_341, 632, 0)
end
function DftWil.defaultTalkWithHahayo_001(A0_344, A1_345, A2_346)
  A2_346:say(A0_344, 213, 0)
end
function DftWil.defaultTalkWithMamaza_001(A0_347, A1_348, A2_349)
  A2_349:say(A0_347, 223, 0)
end
function DftWil.defaultTalkWithNhagiamariyo_001(A0_350, A1_351, A2_352)
  A2_352:say(A0_350, 224, 0)
end
function DftWil.defaultTalkWithNaidazamaida_001(A0_353, A1_354, A2_355)
  A2_355:startCliantTalkTurn(2, A1_354)
  A2_355:_runCharaScheduler(353964032)
  A2_355:say(A0_353, 229, 0)
  A2_355:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJudithe_001(A0_356, A1_357, A2_358)
  A2_358:startCliantTalkTurn(1, A1_357)
  A2_358:_runCharaScheduler(353959936)
  A2_358:say(A0_356, 225, 0)
  A2_358:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithRobyn_001(A0_359, A1_360, A2_361)
  A2_361:startCliantTalkTurn(2, A1_360)
  A2_361:_runCharaScheduler(354168832)
  A2_361:say(A0_359, 226, 0)
  A2_361:say(A0_359, 227, 0)
  A2_361:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithQaruru_001(A0_362, A1_363, A2_364)
  A2_364:startCliantTalkTurn(2, A1_363)
  A2_364:_runCharaScheduler(354177024)
  A2_364:say(A0_362, 228, 0)
  A2_364:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWracwulf_001(A0_365, A1_366, A2_367)
  A2_367:say(A0_365, 230, 0)
  A2_367:say(A0_365, 231, 0)
end
function DftWil.defaultTalkWithWenefreda_001(A0_368, A1_369, A2_370)
  A2_370:startCliantTalkTurn(2, A1_369)
  A2_370:_runCharaScheduler(353959936)
  A2_370:say(A0_368, 232, 0)
  A2_370:say(A0_368, 233, 0)
  A2_370:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithNokksushanksu_001(A0_371, A1_372, A2_373)
  A2_373:startCliantTalkTurn(2, A1_372)
  A2_373:_runCharaScheduler(354226176)
  A2_373:say(A0_371, 234, 0)
  A2_373:say(A0_371, 235, 0)
  A2_373:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithThimm_001(A0_374, A1_375, A2_376)
  A2_376:startCliantTalkTurn(2, A1_375)
  A2_376:_runCharaScheduler(354168832)
  A2_376:say(A0_374, 236, 0)
  A2_376:say(A0_374, 237, 0)
  A2_376:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGairbert_001(A0_377, A1_378, A2_379)
  A2_379:say(A0_377, 238, 0)
  A2_379:say(A0_377, 656, 0)
end
function DftWil.defaultTalkWithDrew_001(A0_380, A1_381, A2_382)
  A2_382:say(A0_380, 240, 0)
  A2_382:say(A0_380, 241, 0)
end
function DftWil.defaultTalkWithMilgogo_001(A0_383, A1_384, A2_385)
  A2_385:startCliantTalkTurn(1, A1_384)
  A2_385:_runCharaScheduler(67735552)
  A2_385:say(A0_383, 242, 0)
  A2_385:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMumutano_001(A0_386, A1_387, A2_388)
  A2_388:startCliantTalkTurn(2, A1_387)
  A2_388:_runCharaScheduler(354168832)
  A2_388:say(A0_386, 243, 0)
  A2_388:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGegeissa_001(A0_389, A1_390, A2_391)
  A2_391:startCliantTalkTurn(1, A1_390)
  A2_391:_runCharaScheduler(67731456)
  A2_391:say(A0_389, 244, 0)
  A2_391:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGdatnan_001(A0_392, A1_393, A2_394)
  A2_394:startCliantTalkTurn(1, A1_393)
  A2_394:_runCharaScheduler(67731456)
  A2_394:say(A0_392, 245, 0)
  A2_394:say(A0_392, 627, 0)
  A2_394:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHehena_001(A0_395, A1_396, A2_397)
  A2_397:startCliantTalkTurn(1, A1_396)
  A2_397:_runCharaScheduler(67731456)
  A2_397:say(A0_395, 246, 0)
  A2_397:say(A0_395, 628, 0)
  A2_397:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGuillaunaux_001(A0_398, A1_399, A2_400)
  A2_400:startCliantTalkTurn(1, A1_399)
  A2_400:_runCharaScheduler(67731456)
  A2_400:say(A0_398, 247, 0)
  A2_400:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJeger_001(A0_401, A1_402, A2_403)
  A2_403:say(A0_401, 248, 0)
  A2_403:say(A0_401, 629, 0)
end
function DftWil.defaultTalkWithMartine_001(A0_404, A1_405, A2_406)
  A2_406:say(A0_404, 249, 0)
end
function DftWil.defaultTalkWithJajanzo_001(A0_407, A1_408, A2_409)
  A2_409:say(A0_407, 250, 0)
end
function DftWil.defaultTalkWithUbokhn_001(A0_410, A1_411, A2_412)
  A2_412:say(A0_410, 251, 0)
end
function DftWil.defaultTalkWithBellinda_001(A0_413, A1_414, A2_415)
  A2_415:startCliantTalkTurn(2, A1_414)
  A2_415:_runCharaScheduler(354168832)
  A2_415:say(A0_413, 264, 0)
  A2_415:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithRonthfohc_001(A0_416, A1_417, A2_418)
  A2_418:startCliantTalkTurn(2, A1_417)
  A2_418:_runCharaScheduler(353964032)
  A2_418:say(A0_416, 265, 0)
  A2_418:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBerahthraben_001(A0_419, A1_420, A2_421)
  A2_421:startCliantTalkTurn(2, A1_420)
  A2_421:_runCharaScheduler(353964032)
  A2_421:say(A0_419, 266, 0)
  A2_421:say(A0_419, 267, 0)
  A2_421:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithOtho_001(A0_422, A1_423, A2_424)
  A2_424:startCliantTalkTurn(2, A1_423)
  A2_424:_runCharaScheduler(354172928)
  A2_424:say(A0_422, 268, 0)
  A2_424:say(A0_422, 269, 0)
  A2_424:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithRadulf_001(A0_425, A1_426, A2_427)
  A2_427:startCliantTalkTurn(2, A1_426)
  A2_427:_runCharaScheduler(354066432)
  A2_427:say(A0_425, 270, 0)
  A2_427:say(A0_425, 271, 0)
  A2_427:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHonmeme_001(A0_428, A1_429, A2_430)
  A2_430:startCliantTalkTurn(2, A1_429)
  A2_430:_runCharaScheduler(354086912)
  A2_430:say(A0_428, 272, 0)
  A2_430:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGrifiud_001(A0_431, A1_432, A2_433)
  A2_433:startCliantTalkTurn(2, A1_432)
  A2_433:_runCharaScheduler(354168832)
  A2_433:_runCharaScheduler(70815744)
  A2_433:say(A0_431, 273, 0)
  A2_433:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithCatriona_001(A0_434, A1_435, A2_436)
  A2_436:startCliantTalkTurn(1, A1_435)
  A2_436:_runCharaScheduler(353959936)
  A2_436:say(A0_434, 274, 0)
  A2_436:say(A0_434, 275, 0)
  A2_436:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLyngwaek_001(A0_437, A1_438, A2_439)
  A2_439:say(A0_437, 276, 0)
end
function DftWil.defaultTalkWithTatasha_001(A0_440, A1_441, A2_442)
  A2_442:startCliantTalkTurn(2, A1_441)
  A2_442:_runCharaScheduler(353964032)
  A2_442:say(A0_440, 290, 0)
  A2_442:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithXdhilogo_001(A0_443, A1_444, A2_445)
  A2_445:say(A0_443, 291, 0)
end
function DftWil.defaultTalkWithVannes_001(A0_446, A1_447, A2_448)
  A2_448:say(A0_446, 292, 0)
end
function DftWil.defaultTalkWithDiriaine_001(A0_449, A1_450, A2_451)
  A2_451:startCliantTalkTurn(2, A1_450)
  A2_451:_runCharaScheduler(354168832)
  A2_451:say(A0_449, 285, 0)
  A2_451:say(A0_449, 286, 0)
  A2_451:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithCrhabye_001(A0_452, A1_453, A2_454)
  A2_454:startCliantTalkTurn(2, A1_453)
  A2_454:_runCharaScheduler(354078720)
  A2_454:say(A0_452, 287, 0)
  A2_454:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithQhotanbolo_001(A0_455, A1_456, A2_457)
  A2_457:say(A0_455, 288, 0)
end
function DftWil.defaultTalkWithTyagomoui_001(A0_458, A1_459, A2_460)
  A2_460:startCliantTalkTurn(2, A1_459)
  A2_460:_runCharaScheduler(354177024)
  A2_460:say(A0_458, 289, 0)
  A2_460:say(A0_458, 636, 0)
  A2_460:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithQatanelhah_001(A0_461, A1_462, A2_463)
  A2_463:startCliantTalkTurn(2, A1_462)
  A2_463:_runCharaScheduler(67731456)
  A2_463:say(A0_461, 293, 0)
  A2_463:say(A0_461, 294, 0)
  A2_463:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDoll005_001(A0_464, A1_465, A2_466)
  A2_466:startCliantTalkTurn(1, A1_465)
  A2_466:say(A0_464, 295, 0)
  A2_466:say(A0_464, 296, 0)
  A2_466:say(A0_464, 297, 0)
  A2_466:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDoll004_001(A0_467, A1_468, A2_469)
  A2_469:startCliantTalkTurn(1, A1_468)
  A2_469:say(A0_467, 282, 0)
  A2_469:say(A0_467, 283, 0)
  A2_469:say(A0_467, 284, 0)
  A2_469:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDoll001_001(A0_470, A1_471, A2_472)
  A2_472:startCliantTalkTurn(1, A1_471)
  A2_472:say(A0_470, 278, 0)
  A2_472:say(A0_470, 279, 0)
  A2_472:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDoll002_001(A0_473, A1_474, A2_475)
  A2_475:startCliantTalkTurn(1, A1_474)
  A2_475:say(A0_473, 280, 0)
  A2_475:say(A0_473, 281, 0)
  A2_475:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDoll003_001(A0_476, A1_477, A2_478)
  A2_478:startCliantTalkTurn(1, A1_477)
  A2_478:say(A0_476, 277, 0)
  A2_478:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKikinori_001(A0_479, A1_480, A2_481)
  A2_481:startCliantTalkTurn(2, A1_480)
  A2_481:_runCharaScheduler(354168832)
  A2_481:say(A0_479, 311, 0)
  A2_481:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithCelie_001(A0_482, A1_483, A2_484)
  A2_484:startCliantTalkTurn(2, A1_483)
  A2_484:_runCharaScheduler(353964032)
  A2_484:say(A0_482, 312, 0)
  A2_484:say(A0_482, 313, 0)
  A2_484:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAgzurungzu_001(A0_485, A1_486, A2_487)
  A2_487:say(A0_485, 314, 0)
end
function DftWil.defaultTalkWithDarimbeh_001(A0_488, A1_489, A2_490)
  A2_490:startCliantTalkTurn(1, A1_489)
  A2_490:_runCharaScheduler(67825664)
  A2_490:say(A0_488, 315, 0)
  A2_490:say(A0_488, 316, 0)
  A2_490:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithIudprost_001(A0_491, A1_492, A2_493)
  A2_493:startCliantTalkTurn(1, A1_492)
  A2_493:_runCharaScheduler(353964032)
  A2_493:say(A0_491, 317, 0)
  A2_493:say(A0_491, 318, 0)
  A2_493:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTatafu_001(A0_494, A1_495, A2_496)
  A2_496:startCliantTalkTurn(2, A1_495)
  A2_496:_runCharaScheduler(353964032)
  A2_496:say(A0_494, 319, 0)
  A2_496:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAthalwolf_001(A0_497, A1_498, A2_499)
  A2_499:startCliantTalkTurn(2, A1_498)
  A2_499:say(A0_497, 320, 0)
  A2_499:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithPadakusondaku_001(A0_500, A1_501, A2_502)
  A2_502:startCliantTalkTurn(2, A1_501)
  A2_502:_runCharaScheduler(354168832)
  A2_502:say(A0_500, 321, 0)
  A2_502:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithFromelaut_001(A0_503, A1_504, A2_505)
  A2_505:startCliantTalkTurn(2, A1_504)
  A2_505:_runCharaScheduler(353959936)
  A2_505:say(A0_503, 298, 0)
  A2_505:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithZilili_001(A0_506, A1_507, A2_508)
  A2_508:say(A0_506, 658, 0)
  A2_508:say(A0_506, 659, 0)
end
function DftWil.defaultTalkWithPapala_001(A0_509, A1_510, A2_511)
  A2_511:startCliantTalkTurn(2, A1_510)
  A2_511:_runCharaScheduler(354234368)
  A2_511:say(A0_509, 301, 0)
  A2_511:say(A0_509, 302, 0)
  A2_511:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSasapano_001(A0_512, A1_513, A2_514)
  A2_514:startCliantTalkTurn(2, A1_513)
  A2_514:_runCharaScheduler(354041856)
  A2_514:say(A0_512, 303, 0)
  A2_514:say(A0_512, 304, 0)
  A2_514:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBibiroku_001(A0_515, A1_516, A2_517)
  A2_517:say(A0_515, 660, 0)
  A2_517:say(A0_515, 661, 0)
end
function DftWil.defaultTalkWithBernier_001(A0_518, A1_519, A2_520)
  A2_520:startCliantTalkTurn(2, A1_519)
  A2_520:_runCharaScheduler(353964032)
  A2_520:say(A0_518, 307, 0)
  A2_520:say(A0_518, 308, 0)
  A2_520:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJajaba_001(A0_521, A1_522, A2_523)
  A2_523:startCliantTalkTurn(2, A1_522)
  A2_523:_runCharaScheduler(354168832)
  A2_523:say(A0_521, 309, 0)
  A2_523:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJujuya_001(A0_524, A1_525, A2_526)
  A2_526:startCliantTalkTurn(2, A1_525)
  A2_526:say(A0_524, 310, 0)
  A2_526:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAnthoinette_001(A0_527, A1_528, A2_529)
  A2_529:startCliantTalkTurn(2, A1_528)
  A2_529:_runCharaScheduler(354172928)
  A2_529:say(A0_527, 324, 0)
  A2_529:say(A0_527, 633, 0)
  A2_529:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWisemoon_001(A0_530, A1_531, A2_532)
  A2_532:startCliantTalkTurn(2, A1_531)
  A2_532:_runCharaScheduler(353964032)
  A2_532:say(A0_530, 325, 0)
  A2_532:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithApachonaccho_001(A0_533, A1_534, A2_535)
  A2_535:say(A0_533, 653, 0)
end
function DftWil.defaultTalkWithWyznguld_001(A0_536, A1_537, A2_538)
  A2_538:startCliantTalkTurn(2, A1_537)
  A2_538:_runCharaScheduler(354177024)
  A2_538:say(A0_536, 327, 0)
  A2_538:say(A0_536, 328, 0)
  A2_538:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithNeymumu_001(A0_539, A1_540, A2_541)
  A2_541:startCliantTalkTurn(2, A1_540)
  A2_541:_runCharaScheduler(354177024)
  A2_541:say(A0_539, 329, 0)
  A2_541:say(A0_539, 330, 0)
  A2_541:say(A0_539, 634, 0)
  A2_541:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSafufu_001(A0_542, A1_543, A2_544)
  A2_544:say(A0_542, 654, 0)
  A2_544:say(A0_542, 655, 0)
end
function DftWil.defaultTalkWithPenelizuneli_001(A0_545, A1_546, A2_547)
  A2_547:startCliantTalkTurn(2, A1_546)
  A2_547:_runCharaScheduler(354000896)
  A2_547:say(A0_545, 333, 0)
  A2_547:say(A0_545, 334, 0)
  A2_547:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithZssapa_001(A0_548, A1_549, A2_550)
  A2_550:startCliantTalkTurn(2, A1_549)
  A2_550:_runCharaScheduler(354177024)
  A2_550:say(A0_548, 335, 0)
  A2_550:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithOcoco_001(A0_551, A1_552, A2_553)
  A2_553:say(A0_551, 322, 0)
end
function DftWil.defaultTalkWithRosalind_001(A0_554, A1_555, A2_556)
  A2_556:say(A0_554, 323, 0)
  A2_556:say(A0_554, 487, 0)
end
function DftWil.defaultTalkWithFiachre_001(A0_557, A1_558, A2_559)
  A2_559:startCliantTalkTurn(2, A1_558)
  A2_559:_runCharaScheduler(354078720)
  A2_559:say(A0_557, 339, 0)
  A2_559:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithTaylor_001(A0_560, A1_561, A2_562)
  A2_562:startCliantTalkTurn(2, A1_561)
  A2_562:_runCharaScheduler(353964032)
  A2_562:say(A0_560, 340, 0)
  A2_562:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWalhbert_001(A0_563, A1_564, A2_565)
  A2_565:startCliantTalkTurn(2, A1_564)
  A2_565:_runCharaScheduler(354041856)
  A2_565:_runCharaScheduler(70815744)
  A2_565:say(A0_563, 341, 0)
  A2_565:say(A0_563, 342, 0)
  A2_565:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSpiralingpath_001(A0_566, A1_567, A2_568)
  A2_568:say(A0_566, 343, 0)
end
function DftWil.defaultTalkWithSasapiku_001(A0_569, A1_570, A2_571)
  A2_571:startCliantTalkTurn(2, A1_570)
  A2_571:_runCharaScheduler(354177024)
  A2_571:say(A0_569, 344, 0)
  A2_571:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSylviel_001(A0_572, A1_573, A2_574)
  A2_574:startCliantTalkTurn(2, A1_573)
  A2_574:_runCharaScheduler(353959936)
  A2_574:say(A0_572, 345, 0)
  A2_574:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSamigamduhla_001(A0_575, A1_576, A2_577)
  A2_577:startCliantTalkTurn(2, A1_576)
  A2_577:_runCharaScheduler(353959936)
  A2_577:say(A0_575, 346, 0)
  A2_577:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithYuyuhase_001(A0_578, A1_579, A2_580)
  A2_580:startCliantTalkTurn(2, A1_579)
  A2_580:_runCharaScheduler(353959936)
  A2_580:say(A0_578, 354, 0)
  A2_580:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLulumo_001(A0_581, A1_582, A2_583)
  A2_583:startCliantTalkTurn(2, A1_582)
  A2_583:say(A0_581, 355, 0)
  A2_583:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMimishu_001(A0_584, A1_585, A2_586)
  A2_586:startCliantTalkTurn(2, A1_585)
  A2_586:_runCharaScheduler(354177024)
  A2_586:say(A0_584, 356, 0)
  A2_586:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGerland_001(A0_587, A1_588, A2_589)
  A2_589:startCliantTalkTurn(2, A1_588)
  A2_589:say(A0_587, 368, 0)
  A2_589:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithYayatoki_001(A0_590, A1_591, A2_592)
  A2_592:say(A0_590, 657, 0)
end
function DftWil.defaultTalkWithGuildleveClientU_001(A0_593, A1_594, A2_595)
  A2_595:say(A0_593, 370, 0)
  A2_595:startCliantTalkTurn(2, A1_594)
  A2_595:say(A0_593, 371, 0)
  A2_595:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGuildleveClientU_002(A0_596, A1_597, A2_598)
  A2_598:say(A0_596, 372, 0)
  A2_598:startCliantTalkTurn(2, A1_597)
  A2_598:say(A0_596, 373, 0)
  A2_598:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGuildleveClientU_003(A0_599, A1_600, A2_601)
  A2_601:startCliantTalkTurn(2, A1_600)
  A2_601:say(A0_599, 374, 0)
  A2_601:say(A0_599, 375, 0)
  A2_601:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBATERICH_100(A0_602, A1_603, A2_604)
  A2_604:startCliantTalkTurn(2, A1_603)
  A2_604:say(A0_602, 377, 0)
  A2_604:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithRorojaru_001(A0_605, A1_606, A2_607)
  A2_607:startCliantTalkTurn(2, A1_606)
  A2_607:say(A0_605, 462, 0)
  A2_607:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithEleanor_001(A0_608, A1_609, A2_610)
  A2_610:startCliantTalkTurn(2, A1_609)
  A2_610:say(A0_608, 497, 0)
  A2_610:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGuillestet_001(A0_611, A1_612, A2_613)
  A2_613:startCliantTalkTurn(2, A1_612)
  A2_613:say(A0_611, 500, 0)
  A2_613:say(A0_611, 501, 0)
  A2_613:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHCidjaa_001(A0_614, A1_615, A2_616)
  A2_616:startCliantTalkTurn(2, A1_615)
  A2_616:say(A0_614, 502, 0)
  A2_616:_runCharaScheduler(67723264)
  A2_616:say(A0_614, 503, 0)
  A2_616:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAutgar_001(A0_617, A1_618, A2_619)
  A2_619:startCliantTalkTurn(2, A1_618)
  A2_619:say(A0_617, 504, 0)
  A2_619:say(A0_617, 505, 0)
  A2_619:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAhldbyrt_001(A0_620, A1_621, A2_622)
  A2_622:startCliantTalkTurn(2, A1_621)
  A2_622:say(A0_620, 506, 0)
  A2_622:say(A0_620, 507, 0)
  A2_622:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithNeymiFunomi_001(A0_623, A1_624, A2_625)
  A2_625:startCliantTalkTurn(2, A1_624)
  A2_625:say(A0_623, 508, 0)
  A2_625:_runCharaScheduler(354041856)
  A2_625:say(A0_623, 509, 0)
  A2_625:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithGoodife_001(A0_626, A1_627, A2_628)
  A2_628:startCliantTalkTurn(2, A1_627)
  A2_628:say(A0_626, 510, 0)
  A2_628:say(A0_626, 511, 0)
  A2_628:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithPelhiEpocan_001(A0_629, A1_630, A2_631)
  A2_631:startCliantTalkTurn(2, A1_630)
  A2_631:_runCharaScheduler(68460544)
  A2_631:say(A0_629, 512, 0)
  A2_631:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithViolenne_001(A0_632, A1_633, A2_634)
  A2_634:startCliantTalkTurn(2, A1_633)
  A2_634:say(A0_632, 513, 0)
  A2_634:_runCharaScheduler(354054144)
  A2_634:say(A0_632, 514, 0)
  A2_634:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithEara_001(A0_635, A1_636, A2_637)
  A2_637:startCliantTalkTurn(2, A1_636)
  A2_637:_runCharaScheduler(83906560)
  A2_637:say(A0_635, 516, 0)
  A2_637:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLiaime_001(A0_638, A1_639, A2_640)
  A2_640:startCliantTalkTurn(2, A1_639)
  A2_640:_runCharaScheduler(83906560)
  A2_640:say(A0_638, 517, 0)
  A2_640:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAbelard_001(A0_641, A1_642, A2_643)
  A2_643:startCliantTalkTurn(2, A1_642)
  A2_643:_runCharaScheduler(353959936)
  A2_643:say(A0_641, 472, 0)
  A2_643:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHaipoeipo_001(A0_644, A1_645, A2_646)
  A2_646:startCliantTalkTurn(2, A1_645)
  A2_646:_runCharaScheduler(353959936)
  A2_646:say(A0_644, 473, 0)
  A2_646:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBartholomew_001(A0_647, A1_648, A2_649)
  A2_649:startCliantTalkTurn(2, A1_648)
  A2_649:_runCharaScheduler(353959936)
  A2_649:say(A0_647, 474, 0)
  A2_649:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKokofubu_001(A0_650, A1_651, A2_652)
  A2_652:startCliantTalkTurn(2, A1_651)
  A2_652:_runCharaScheduler(353968128)
  A2_652:say(A0_650, 475, 0)
  A2_652:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBertouaint_001(A0_653, A1_654, A2_655)
  A2_655:startCliantTalkTurn(2, A1_654)
  A2_655:_runCharaScheduler(354205696)
  A2_655:say(A0_653, 476, 0)
  A2_655:say(A0_653, 477, 0)
  A2_655:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAldebrand_001(A0_656, A1_657, A2_658)
  A2_658:startCliantTalkTurn(2, A1_657)
  A2_658:_runCharaScheduler(353959936)
  A2_658:say(A0_656, 478, 0)
  A2_658:say(A0_656, 479, 0)
  A2_658:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithPyhajawantal_001(A0_659, A1_660, A2_661)
  A2_661:startCliantTalkTurn(2, A1_660)
  A2_661:_runCharaScheduler(353959936)
  A2_661:say(A0_659, 480, 0)
  A2_661:say(A0_659, 481, 0)
  A2_661:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithChocobo_001(A0_662, A1_663, A2_664)
  A1_663:_runCharaScheduler(67111908)
  A2_664:_runCharaScheduler(70017024)
end
function DftWil.defaultTalkCaravanChocoboUld_001(A0_665, A1_666, A2_667)
  A2_667:_runCharaScheduler(70017024)
  A0_665:_wait(0.5)
  A1_666:_runCharaScheduler(67111908)
end
function DftWil.downTownTalk(A0_668, A1_669, A2_670, A3_671, A4_672, A5_673)
  local L6_674
  if A5_673 == true then
    L6_674 = A2_670.say
    L6_674(A2_670, A0_668, 386, 0)
  else
    L6_674 = A2_670.startCliantTalkTurn
    L6_674(A2_670, 2, A1_669)
    L6_674 = A2_670.say
    L6_674(A2_670, A0_668, 378, 0)
  end
  while true do
    L6_674 = nil
    L6_674 = worldMaster:askRestrictChoices(A2_670, A0_668, 463, true, true, true, true, true, false, false, true)
    if L6_674 == nil or L6_674 == 8 then
      break
    elseif L6_674 == 1 then
      A2_670:say(A0_668, 387, 0)
    elseif L6_674 == 2 then
      A2_670:say(A0_668, 388, 0)
    elseif L6_674 == 3 then
      A2_670:say(A0_668, 390, 0)
      A2_670:say(A0_668, 579, 0)
    elseif L6_674 == 4 then
      A2_670:say(A0_668, 496, 0)
      A2_670:say(A0_668, 580, 0)
    elseif L6_674 == 5 then
      A2_670:say(A0_668, 391, 0)
      A2_670:say(A0_668, 581, 0)
      A2_670:say(A0_668, 582, 0)
    elseif L6_674 == 6 then
      if A3_671 == true then
        desktopWidget:askItemSearchWidget()
        return -2
      else
        A2_670:say(A0_668, 392, 0)
      end
    elseif L6_674 == 7 then
      return -1
    end
    A2_670:say(A0_668, 386, 0)
  end
  L6_674 = A2_670.finishCliantTalkTurn
  L6_674(A2_670)
end
function DftWil.tribeTalk(A0_675, A1_676, A2_677)
  A2_677:startCliantTalkTurn(2, A1_676)
  A2_677:say(A0_675, 393, 0)
  A2_677:say(A0_675, 518, 0)
  while true do
    if worldMaster:ask(A2_677, A0_675, 394, 3) == nil or worldMaster:ask(A2_677, A0_675, 394, 3) == 3 then
      break
    elseif worldMaster:ask(A2_677, A0_675, 394, 3) == 1 then
      if worldMaster:ask(A2_677, A0_675, 399, 6) == nil or worldMaster:ask(A2_677, A0_675, 399, 6) == 6 then
        break
      elseif worldMaster:ask(A2_677, A0_675, 399, 6) == 1 then
        A2_677:say(A0_675, 406, 0)
        A2_677:say(A0_675, 407, 0)
      elseif worldMaster:ask(A2_677, A0_675, 399, 6) == 2 then
        A2_677:say(A0_675, 408, 0)
        A2_677:say(A0_675, 519, 0)
        A2_677:say(A0_675, 409, 0)
      elseif worldMaster:ask(A2_677, A0_675, 399, 6) == 3 then
        A2_677:say(A0_675, 410, 0)
        A2_677:say(A0_675, 520, 0)
        A2_677:say(A0_675, 411, 0)
      elseif worldMaster:ask(A2_677, A0_675, 399, 6) == 4 then
        A2_677:say(A0_675, 412, 0)
        A2_677:say(A0_675, 521, 0)
        A2_677:say(A0_675, 413, 0)
        A2_677:say(A0_675, 522, 0)
      end
    elseif worldMaster:ask(A2_677, A0_675, 394, 3) == 2 then
      if worldMaster:ask(A2_677, A0_675, 414, 5) == nil or worldMaster:ask(A2_677, A0_675, 414, 5) == 5 then
        break
      elseif worldMaster:ask(A2_677, A0_675, 414, 5) == 1 then
        A2_677:say(A0_675, 420, 0)
        A2_677:say(A0_675, 523, 0)
        A2_677:say(A0_675, 421, 0)
      elseif worldMaster:ask(A2_677, A0_675, 414, 5) == 2 then
        A2_677:say(A0_675, 422, 0)
        A2_677:say(A0_675, 423, 0)
        A2_677:say(A0_675, 524, 0)
      elseif worldMaster:ask(A2_677, A0_675, 414, 5) == 3 then
        A2_677:say(A0_675, 424, 0)
        A2_677:say(A0_675, 425, 0)
      end
    end
    A2_677:say(A0_675, 398, 0)
  end
  A2_677:finishCliantTalkTurn()
end
function DftWil.bookTalk(A0_678, A1_679, A2_680)
  worldMaster:say(A0_678, 426)
  while true do
    if worldMaster:ask(A2_680, A0_678, 427, 3) == nil or worldMaster:ask(A2_680, A0_678, 427, 3) == 3 then
      return
    elseif worldMaster:ask(A2_680, A0_678, 427, 3) == 1 then
      worldMaster:say(A0_678, 431)
      while true do
        if worldMaster:ask(A2_680, A0_678, 432, 7) == nil or worldMaster:ask(A2_680, A0_678, 432, 7) == 7 then
          break
        elseif worldMaster:ask(A2_680, A0_678, 432, 7) == 1 then
          worldMaster:say(A0_678, 440)
          worldMaster:say(A0_678, 583)
        elseif worldMaster:ask(A2_680, A0_678, 432, 7) == 2 then
          worldMaster:say(A0_678, 441)
        elseif worldMaster:ask(A2_680, A0_678, 432, 7) == 3 then
          worldMaster:say(A0_678, 442)
          worldMaster:say(A0_678, 584)
        elseif worldMaster:ask(A2_680, A0_678, 432, 7) == 4 then
          worldMaster:say(A0_678, 443)
          worldMaster:say(A0_678, 444)
          worldMaster:say(A0_678, 585)
          worldMaster:say(A0_678, 445)
        elseif worldMaster:ask(A2_680, A0_678, 432, 7) == 5 then
          worldMaster:say(A0_678, 446)
          worldMaster:say(A0_678, 461)
        elseif worldMaster:ask(A2_680, A0_678, 432, 7) == 6 then
          worldMaster:say(A0_678, 447)
          worldMaster:say(A0_678, 586)
          worldMaster:say(A0_678, 448)
          worldMaster:say(A0_678, 449)
        end
      end
    elseif worldMaster:ask(A2_680, A0_678, 427, 3) == 2 then
      worldMaster:say(A0_678, 450)
      while true do
        if worldMaster:ask(A2_680, A0_678, 451, 5) == nil or worldMaster:ask(A2_680, A0_678, 451, 5) == 5 then
          break
        elseif worldMaster:ask(A2_680, A0_678, 451, 5) == 1 then
          worldMaster:say(A0_678, 457)
        elseif worldMaster:ask(A2_680, A0_678, 451, 5) == 2 then
          worldMaster:say(A0_678, 458)
        elseif worldMaster:ask(A2_680, A0_678, 451, 5) == 3 then
          worldMaster:say(A0_678, 459)
        elseif worldMaster:ask(A2_680, A0_678, 451, 5) == 4 then
          worldMaster:say(A0_678, 460)
        end
      end
    end
  end
end
function DftWil.talkIdayCap(A0_681, A1_682, A2_683)
  A2_683:startCliantTalkTurnNoWait(1, A1_682)
  A2_683:say(A0_681, 482, 0)
  A2_683:finishCliantTalkTurn()
end
function DftWil.talkIday1(A0_684, A1_685, A2_686)
  A2_686:startCliantTalkTurnNoWait(1, A1_685)
  A2_686:say(A0_684, 483, 0)
  A2_686:say(A0_684, 484, 0)
  A2_686:finishCliantTalkTurn()
end
function DftWil.talkIday2(A0_687, A1_688, A2_689)
  A2_689:startCliantTalkTurnNoWait(1, A1_688)
  A2_689:say(A0_687, 485, 0)
  A2_689:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAdalbert_001(A0_690, A1_691, A2_692)
  A2_692:startCliantTalkTurn(2, A1_691)
  if A2_692:doSalute(3, 21) == 0 then
    A2_692:_runCharaScheduler(353968128)
  end
  A0_690:_wait(1)
  if A2_692:isUpperRank(3, 21) == true then
    A2_692:say(A0_690, 492, 0)
  else
    A2_692:say(A0_690, 525, 0)
  end
  A2_692:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJandonaut_001(A0_693, A1_694, A2_695)
  A2_695:startCliantTalkTurn(2, A1_694)
  if A2_695:doSalute(3, 23) == 0 then
    A2_695:_runCharaScheduler(353959936)
  end
  if A2_695:isUpperRank(3, 23) == true then
    A2_695:say(A0_693, 493, 0)
  else
    A2_695:say(A0_693, 526, 0)
  end
  A2_695:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithAistan_001(A0_696, A1_697, A2_698)
  A2_698:startCliantTalkTurn(2, A1_697)
  A2_698:say(A0_696, 494, 0)
  A2_698:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithMateria_001(A0_699, A1_700, A2_701)
  A2_701:startCliantTalkTurn(2, A1_700)
  A2_701:say(A0_699, 495, 0)
  A2_701:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKokosamu_001(A0_702, A1_703, A2_704)
  A2_704:startCliantTalkTurn(2, A1_703)
  A2_704:say(A0_702, 498, 0)
  A2_704:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithF_HOBHAS_001(A0_705, A1_706, A2_707)
  A2_707:startCliantTalkTurn(2, A1_706)
  A2_707:say(A0_705, 499, 0)
  A2_707:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSWYNBROES_001(A0_708, A1_709, A2_710)
  A2_710:startCliantTalkTurn(2, A1_709)
  A2_710:say(A0_708, 515, 0)
  A2_710:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLUDOLD_001(A0_711, A1_712, A2_713)
  A2_713:startCliantTalkTurn(2, A1_712)
  if A2_713:doSalute(3, 43) == 0 then
    A2_713:_runCharaScheduler(353959936)
  end
  A2_713:say(A0_711, 527, 0)
  A2_713:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSIBOLD_001(A0_714, A1_715, A2_716)
  A2_716:startCliantTalkTurn(2, A1_715)
  A2_716:say(A0_714, 529, 0)
  A2_716:say(A0_714, 530, 0)
  A2_716:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithPAHJAZHWAN_001(A0_717, A1_718, A2_719)
  A2_719:startCliantTalkTurn(2, A1_718)
  A2_719:_runCharaScheduler(353959936)
  A2_719:say(A0_717, 528, 0)
  A2_719:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithCURIOUS_001(A0_720, A1_721, A2_722)
  A2_722:startCliantTalkTurn(2, A1_721)
  A2_722:_runCharaScheduler(353959936)
  A2_722:say(A0_720, 535, 0)
  A2_722:say(A0_720, 536, 0)
  A2_722:say(A0_720, 607, 0)
  A2_722:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithCURIOUS_002(A0_723, A1_724, A2_725)
  A2_725:startCliantTalkTurn(2, A1_724)
  A2_725:_runCharaScheduler(353959936)
  A2_725:say(A0_723, 533, 0)
  A2_725:say(A0_723, 534, 0)
  A2_725:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSarra_001(A0_726, A1_727, A2_728)
  A2_728:startCliantTalkTurn(2, A1_727)
  A2_728:_runCharaScheduler(353964032)
  A2_728:say(A0_726, 608, 0)
  A2_728:say(A0_726, 609, 0)
  A2_728:say(A0_726, 618, 0)
  A2_728:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSarra_002(A0_729, A1_730, A2_731)
  A2_731:startCliantTalkTurn(2, A1_730)
  A2_731:_runCharaScheduler(353959936)
  A2_731:say(A0_729, 610, 0)
  A2_731:say(A0_729, 611, 0)
  A2_731:_runCharaScheduler(353964032)
  A2_731:say(A0_729, 612, 0)
  A2_731:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithSarra_003(A0_732, A1_733, A2_734)
  A2_734:startCliantTalkTurn(2, A1_733)
  A2_734:_runCharaScheduler(353968128)
  A2_734:say(A0_732, 613, 0)
  A2_734:say(A0_732, 614, 0)
  A2_734:_runCharaScheduler(353964032)
  A2_734:say(A0_732, 615, 0)
  A2_734:say(A0_732, 619, 0)
  A2_734:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_001(A0_735, A1_736, A2_737)
  A2_737:startCliantTalkTurn(2, A1_736)
  A2_737:_runCharaScheduler(353959936)
  A2_737:say(A0_735, 539, 0)
  A2_737:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_101(A0_738, A1_739, A2_740)
  A2_740:startCliantTalkTurn(2, A1_739)
  A2_740:_runCharaScheduler(353959936)
  A2_740:say(A0_738, 565, 0)
  A2_740:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_002(A0_741, A1_742, A2_743)
  A2_743:startCliantTalkTurn(2, A1_742)
  A2_743:_runCharaScheduler(353959936)
  A2_743:say(A0_741, 566, 0)
  A2_743:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_003(A0_744, A1_745, A2_746)
  A2_746:startCliantTalkTurn(2, A1_745)
  A2_746:_runCharaScheduler(353959936)
  A2_746:say(A0_744, 567, 0)
  A2_746:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_004(A0_747, A1_748, A2_749)
  A2_749:startCliantTalkTurn(2, A1_748)
  A2_749:_runCharaScheduler(353959936)
  A2_749:say(A0_747, 568, 0)
  A2_749:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_005(A0_750, A1_751, A2_752)
  A2_752:startCliantTalkTurn(2, A1_751)
  A2_752:_runCharaScheduler(353959936)
  A2_752:say(A0_750, 569, 0)
  A2_752:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_006(A0_753, A1_754, A2_755)
  A2_755:startCliantTalkTurn(2, A1_754)
  A2_755:_runCharaScheduler(353959936)
  A2_755:say(A0_753, 570, 0)
  A2_755:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLalai_007(A0_756, A1_757, A2_758)
  A2_758:startCliantTalkTurn(2, A1_757)
  A2_758:_runCharaScheduler(353959936)
  A2_758:say(A0_756, 571, 0)
  A2_758:say(A0_756, 572, 0)
  A2_758:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKazagg_001(A0_759, A1_760, A2_761)
  A2_761:startCliantTalkTurn(2, A1_760)
  A2_761:_runCharaScheduler(70017024)
  A2_761:say(A0_759, 540, 0)
  A2_761:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKazagg_002(A0_762, A1_763, A2_764)
  A2_764:startCliantTalkTurn(2, A1_763)
  A2_764:_runCharaScheduler(70017024)
  A2_764:say(A0_762, 541, 0)
  A2_764:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKazagg_003(A0_765, A1_766, A2_767)
  A2_767:startCliantTalkTurn(2, A1_766)
  A2_767:_runCharaScheduler(70017024)
  A2_767:say(A0_765, 542, 0)
  A2_767:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKazagg_004(A0_768, A1_769, A2_770)
  A2_770:startCliantTalkTurn(2, A1_769)
  A2_770:_runCharaScheduler(70017024)
  A2_770:say(A0_768, 543, 0)
  A2_770:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKazagg_005(A0_771, A1_772, A2_773)
  A2_773:startCliantTalkTurn(2, A1_772)
  A2_773:_runCharaScheduler(70017024)
  A2_773:say(A0_771, 544, 0)
  A2_773:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKazagg_006(A0_774, A1_775, A2_776)
  A2_776:startCliantTalkTurn(2, A1_775)
  A2_776:_runCharaScheduler(70017024)
  A2_776:say(A0_774, 545, 0)
  A2_776:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithKazagg_007(A0_777, A1_778, A2_779)
  A2_779:startCliantTalkTurn(2, A1_778)
  A2_779:_runCharaScheduler(70017024)
  A2_779:say(A0_777, 546, 0)
  A2_779:say(A0_777, 547, 0)
  A2_779:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHateli_001(A0_780, A1_781, A2_782)
  A2_782:startCliantTalkTurn(2, A1_781)
  A2_782:_runCharaScheduler(70017024)
  A2_782:say(A0_780, 548, 0)
  A2_782:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHateli_002(A0_783, A1_784, A2_785)
  A2_785:startCliantTalkTurn(2, A1_784)
  A2_785:_runCharaScheduler(70017024)
  A2_785:say(A0_783, 549, 0)
  A2_785:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHateli_003(A0_786, A1_787, A2_788)
  A2_788:startCliantTalkTurn(2, A1_787)
  A2_788:_runCharaScheduler(70017024)
  A2_788:say(A0_786, 550, 0)
  A2_788:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHateli_004(A0_789, A1_790, A2_791)
  A2_791:startCliantTalkTurn(2, A1_790)
  A2_791:_runCharaScheduler(70017024)
  A2_791:say(A0_789, 551, 0)
  A2_791:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHateli_005(A0_792, A1_793, A2_794)
  A2_794:startCliantTalkTurn(2, A1_793)
  A2_794:_runCharaScheduler(70017024)
  A2_794:say(A0_792, 552, 0)
  A2_794:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHateli_006(A0_795, A1_796, A2_797)
  A2_797:startCliantTalkTurn(2, A1_796)
  A2_797:_runCharaScheduler(70017024)
  A2_797:say(A0_795, 553, 0)
  A2_797:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHateli_007(A0_798, A1_799, A2_800)
  A2_800:startCliantTalkTurn(2, A1_799)
  A2_800:_runCharaScheduler(70017024)
  A2_800:say(A0_798, 554, 0)
  A2_800:say(A0_798, 555, 0)
  A2_800:say(A0_798, 556, 0)
  A2_800:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDaza_001(A0_801, A1_802, A2_803)
  A2_803:startCliantTalkTurn(2, A1_802)
  A2_803:_runCharaScheduler(70017024)
  A2_803:say(A0_801, 557, 0)
  A2_803:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDaza_002(A0_804, A1_805, A2_806)
  A2_806:startCliantTalkTurn(2, A1_805)
  A2_806:_runCharaScheduler(70017024)
  A2_806:say(A0_804, 558, 0)
  A2_806:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDaza_003(A0_807, A1_808, A2_809)
  A2_809:startCliantTalkTurn(2, A1_808)
  A2_809:_runCharaScheduler(70017024)
  A2_809:say(A0_807, 559, 0)
  A2_809:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDaza_004(A0_810, A1_811, A2_812)
  A2_812:startCliantTalkTurn(2, A1_811)
  A2_812:_runCharaScheduler(70017024)
  A2_812:say(A0_810, 560, 0)
  A2_812:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDaza_005(A0_813, A1_814, A2_815)
  A2_815:startCliantTalkTurn(2, A1_814)
  A2_815:_runCharaScheduler(70017024)
  A2_815:say(A0_813, 561, 0)
  A2_815:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDaza_006(A0_816, A1_817, A2_818)
  A2_818:startCliantTalkTurn(2, A1_817)
  A2_818:_runCharaScheduler(70017024)
  A2_818:say(A0_816, 562, 0)
  A2_818:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDaza_007(A0_819, A1_820, A2_821)
  A2_821:startCliantTalkTurn(2, A1_820)
  A2_821:_runCharaScheduler(70017024)
  A2_821:say(A0_819, 563, 0)
  A2_821:say(A0_819, 564, 0)
  A2_821:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithErik_001(A0_822, A1_823, A2_824)
  A2_824:startCliantTalkTurn(2, A1_823)
  A2_824:_runCharaScheduler(353959936)
  A2_824:say(A0_822, 600, 0)
  A2_824:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithErik_002(A0_825, A1_826, A2_827)
  A2_827:startCliantTalkTurn(2, A1_826)
  A2_827:_runCharaScheduler(354041856)
  A2_827:say(A0_825, 601, 0)
  A2_827:say(A0_825, 602, 0)
  A2_827:say(A0_825, 620, 0)
  A2_827:_runCharaScheduler(353980416)
  A2_827:say(A0_825, 621, 0)
  A2_827:_runCharaScheduler(70795264)
  A2_827:say(A0_825, 622, 0)
  A2_827:_runCharaScheduler(354103296)
  A0_825:_wait(0.5)
  A2_827:say(A0_825, 623, 0)
  A2_827:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWidargeli_001(A0_828, A1_829, A2_830)
  A2_830:startCliantTalkTurn(2, A1_829)
  A2_830:_runCharaScheduler(353959936)
  A2_830:say(A0_828, 603, 0)
  A2_830:say(A0_828, 604, 0)
  A2_830:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithWidargeli_002(A0_831, A1_832, A2_833)
  A2_833:startCliantTalkTurn(2, A1_832)
  A2_833:_runCharaScheduler(70815744)
  A2_833:say(A0_831, 605, 0)
  A2_833:_runCharaScheduler(354095104)
  A2_833:say(A0_831, 606, 0)
  A2_833:say(A0_831, 624, 0)
  A2_833:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJenlyns_001(A0_834, A1_835, A2_836)
  A2_836:startCliantTalkTurn(2, A1_835)
  A2_836:_runCharaScheduler(354082816)
  A2_836:say(A0_834, 537, 0)
  A2_836:say(A0_834, 538, 0)
  A2_836:say(A0_834, 617, 0)
  A2_836:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithJenlyns_002(A0_837, A1_838, A2_839)
  A2_839:startCliantTalkTurn(2, A1_838)
  A2_839:_runCharaScheduler(354082816)
  A2_839:say(A0_837, 531, 0)
  A2_839:say(A0_837, 532, 0)
  A2_839:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithLolomaya_001(A0_840, A1_841, A2_842, A3_843)
  A2_842:startCliantTalkTurn(2, A1_841)
  A2_842:_runCharaScheduler(353959936)
  A2_842:say(A0_840, 651, 0)
  A2_842:say(A0_840, 652, 0)
  A2_842:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHortwann_001(A0_844, A1_845, A2_846)
  A2_846:startCliantTalkTurn(2, A1_845)
  if A2_846:doSalute(3, 11) == 0 then
    A2_846:_runCharaScheduler(353964032)
  end
  A0_844:_wait(1)
  if A2_846:isUpperRank(3, 11) == true then
    A2_846:say(A0_844, 578, 0)
    A2_846:finishCliantTalkTurn()
  else
    A2_846:say(A0_844, 647, 0)
    A2_846:finishCliantTalkTurn()
  end
end
function DftWil.defaultTalkWithDonner_001(A0_847, A1_848, A2_849)
  A2_849:startCliantTalkTurn(2, A1_848)
  if A2_849:doSalute(3, 11) == 0 then
    A2_849:_runCharaScheduler(354041856)
  end
  A0_847:_wait(1)
  if A2_849:isUpperRank(3, 11) == true then
    A2_849:say(A0_847, 577, 0)
  else
    A2_849:say(A0_847, 625, 0)
  end
  A2_849:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithBerndan_001(A0_850, A1_851, A2_852)
  A2_852:startCliantTalkTurn(2, A1_851)
  A2_852:say(A0_850, 573, 0)
  A2_852:_runCharaScheduler(354103296)
  A2_852:say(A0_850, 574, 0)
  A2_852:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithDuraltharal_001(A0_853, A1_854, A2_855)
  A2_855:startCliantTalkTurn(2, A1_854)
  A2_855:say(A0_853, 662, 0)
  A2_855:_runCharaScheduler(354103296)
  A2_855:say(A0_853, 663, 0)
  A2_855:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithInn_Desk(A0_856, A1_857, A2_858)
  A2_858:startCliantTalkTurn(2, A1_857)
  A2_858:_runCharaScheduler(353959936)
  A2_858:say(A0_856, 638, 0)
  A2_858:say(A0_856, 639, 0)
  while true do
    if worldMaster:askRestrictChoices(A0_856, A0_856, 588, false, true, true, false, true) == 5 or worldMaster:askRestrictChoices(A0_856, A0_856, 588, false, true, true, false, true) == nil then
      break
    elseif worldMaster:askRestrictChoices(A0_856, A0_856, 588, false, true, true, false, true) == 2 then
      A2_858:say(A0_856, 595, 0)
      worldMaster:say(A0_856, 596)
      worldMaster:say(A0_856, 597)
      worldMaster:say(A0_856, 616)
    elseif worldMaster:askRestrictChoices(A0_856, A0_856, 588, false, true, true, false, true) == 3 then
      A2_858:say(A0_856, 598, 0)
      worldMaster:say(A0_856, 599)
    end
  end
  A2_858:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithInn_ExitDoor(A0_859, A1_860, A2_861)
  if A2_861:askExtendWidget(worldMaster, 60013, 2, 1, 1) == 1 then
    return (A2_861:askExtendWidget(worldMaster, 60013, 2, 1, 1))
  else
  end
end
function DftWil.defaultTalkWithKopuruFupuru_001(A0_862, A1_863, A2_864)
  A2_864:startCliantTalkTurn(2, A1_863)
  A2_864:_runCharaScheduler(354103296)
  A2_864:say(A0_862, 640, 0)
  A2_864:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithInn_Desk_2(A0_865, A1_866, A2_867)
  A2_867:startCliantTalkTurn(2, A1_866)
  A2_867:_runCharaScheduler(353959936)
  A2_867:say(A0_865, 641, 0)
  while true do
    while true do
      while true do
        while true do
          while true do
            if A2_867:askExtendWidget(A0_865, 588, 5, 1, 1) == 5 or A2_867:askExtendWidget(A0_865, 588, 5, 1, 1) == -3 or A2_867:askExtendWidget(A0_865, 588, 5, 1, 1) == nil then
              break
            end
            if A2_867:askExtendWidget(A0_865, 588, 5, 1, 1) == 1 then
              A2_867:say(A0_865, 648, 0)
              return (A2_867:askExtendWidget(A0_865, 588, 5, 1, 1))
            end
          end
          if A2_867:askExtendWidget(A0_865, 588, 5, 1, 1) == 2 then
            worldMaster:say(A0_865, 596)
            worldMaster:say(A0_865, 597)
            worldMaster:say(A0_865, 616)
          end
        end
        if A2_867:askExtendWidget(A0_865, 588, 5, 1, 1) == 3 then
          worldMaster:say(A0_865, 599)
        end
      end
      if A2_867:askExtendWidget(A0_865, 588, 5, 1, 1) == 4 then
        A2_867:say(A0_865, 642, 0)
        worldMaster:say(A0_865, 626)
        if A2_867:askExtendWidget(worldMaster, 60016, 2, 1, 1) == 1 then
          A2_867:finishCliantTalkTurn()
          return 2
        end
      end
    end
  end
  A2_867:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithExit01(A0_868, A1_869, A2_870)
  if A2_870:askExtendWidget(worldMaster, 51036, 2, 1, 1) == 1 then
    return (A2_870:askExtendWidget(worldMaster, 51036, 2, 1, 1))
  else
  end
end
function DftWil.defaultTalkWithMarketNpc(A0_871, A1_872, A2_873)
  A2_873:startCliantTalkTurn(2, A1_872)
  A2_873:say(A0_871, 646, 0)
  A2_873:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHamletGuardUld_001(A0_874, A1_875, A2_876)
  A2_876:startCliantTalkTurn(2, A1_875)
  A2_876:_runCharaScheduler(354066432)
  A2_876:say(A0_874, 649, 0)
  A2_876:finishCliantTalkTurn()
end
function DftWil.defaultTalkWithHAVAK_ALVAK_001(A0_877, A1_878, A2_879)
  local L3_880, L4_881
  L3_880 = 0
  L4_881 = 0
  A2_879:startCliantTalkTurn(2, A1_878)
  A2_879:_runCharaScheduler(354086912)
  A2_879:say(A0_877, 664, 0)
  while true do
    if L3_880 ~= 4 then
      L3_880 = A2_879:askExtendWidget(A0_877, 665, 4, 1, 1)
      if L3_880 == 1 then
        A2_879:_runCharaScheduler(353959936)
        A2_879:say(A0_877, 670, 0)
      elseif L3_880 == 2 then
        A2_879:_runCharaScheduler(353968128)
        A2_879:say(A0_877, 671, 0)
        A2_879:say(A0_877, 672, 0)
        A2_879:say(A0_877, 673, 0)
        A2_879:_runCharaScheduler(354082816)
        A2_879:say(A0_877, 674, 0)
      elseif L3_880 == 3 then
        A2_879:_runCharaScheduler(353959936)
        A2_879:say(A0_877, 675, 0)
        if A2_879:askExtendWidget(A0_877, 676, 2, 1, 2) == 1 then
          A2_879:_runCharaScheduler(353968128)
          A2_879:say(A0_877, 679, 0)
          A2_879:say(A0_877, 680, 0)
          A2_879:say(A0_877, 681, 0)
          A2_879:_runCharaScheduler(353972224)
          A2_879:say(A0_877, 682, 0)
          A2_879:say(A0_877, 683, 0)
          A2_879:say(A0_877, 684, 0)
          A2_879:_runCharaScheduler(353968128)
          A2_879:say(A0_877, 685, 0)
          A2_879:say(A0_877, 686, 0)
          A2_879:say(A0_877, 687, 0)
          A2_879:_runCharaScheduler(353959936)
          A2_879:say(A0_877, 688, 0)
          A2_879:say(A0_877, 689, 0)
          A2_879:say(A0_877, 690, 0)
          A2_879:_runCharaScheduler(353972224)
          A2_879:say(A0_877, 691, 0)
          A2_879:say(A0_877, 692, 0)
        end
      else
      end
      if L3_880 == 4 then
      end
      L3_880 = 4
    end
  end
  A2_879:finishCliantTalkTurn()
end
