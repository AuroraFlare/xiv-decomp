require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("DftFst", "ScenarioBaseClass")
function DftFst.initText(A0_0)
  A0_0:_loadTextDataPermanently(307, "dftFst")
end
function DftFst.defaultTalkWithVkorolon_001(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 1, 0)
  A2_3:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPenelope_001(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 174, 0)
  A2_6:say(A0_4, 175, 0)
  A2_6:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMiounne_001(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 3, 0)
  A2_9:say(A0_7, 4, 0)
  A2_9:say(A0_7, 5, 0)
  A2_9:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAnene_001(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(354226176)
  A2_12:say(A0_10, 6, 0)
  A2_12:say(A0_10, 7, 0)
  A2_12:say(A0_10, 544, 0)
  A2_12:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAnene_002(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(354226176)
  A2_15:say(A0_13, 8, 0)
  A2_15:say(A0_13, 9, 0)
  A2_15:say(A0_13, 10, 0)
  A2_15:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAnene_003(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:_runCharaScheduler(354226176)
  A2_18:say(A0_16, 11, 0)
  A2_18:say(A0_16, 12, 0)
  A2_18:say(A0_16, 13, 0)
  A2_18:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSylbyrt_001(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(354172928)
  A2_21:say(A0_19, 14, 0)
  A2_21:say(A0_19, 15, 0)
  A2_21:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSylbyrt_002(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:_runCharaScheduler(354226176)
  A2_24:say(A0_22, 16, 0)
  A2_24:say(A0_22, 17, 0)
  A2_24:say(A0_22, 18, 0)
  A2_24:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSylbyrt_003(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:_runCharaScheduler(354226176)
  A2_27:say(A0_25, 19, 0)
  A2_27:say(A0_25, 20, 0)
  A2_27:say(A0_25, 21, 0)
  A2_27:say(A0_25, 22, 0)
  A2_27:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHongavunga_001(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:_runCharaScheduler(354234368)
  A2_30:say(A0_28, 23, 0)
  A2_30:say(A0_28, 24, 0)
  A2_30:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHongavunga_002(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:_runCharaScheduler(354234368)
  A2_33:say(A0_31, 25, 0)
  A2_33:say(A0_31, 26, 0)
  A2_33:say(A0_31, 27, 0)
  A2_33:say(A0_31, 28, 0)
  A2_33:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHongavunga_003(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:_runCharaScheduler(354234368)
  A2_36:say(A0_34, 29, 0)
  A2_36:say(A0_34, 30, 0)
  A2_36:say(A0_34, 31, 0)
  A2_36:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNoncomananco_001(A0_37, A1_38, A2_39, A3_40)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:_runCharaScheduler(354205696)
  A2_39:say(A0_37, 32, 0)
  A2_39:say(A0_37, 33, 0)
  if A3_40 == 1 or A3_40 == 21 then
    A2_39:say(A0_37, 34, 0)
    A2_39:say(A0_37, 35, 0)
  else
    A2_39:say(A0_37, 36, 0)
    A2_39:say(A0_37, 37, 0)
  end
  A2_39:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNoncomananco_002(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:_runCharaScheduler(354205696)
  A2_43:say(A0_41, 38, 0)
  A2_43:say(A0_41, 39, 0)
  A2_43:say(A0_41, 40, 0)
  A2_43:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNoncomananco_003(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:_runCharaScheduler(354205696)
  A2_46:say(A0_44, 41, 0)
  A2_46:say(A0_44, 42, 0)
  A2_46:say(A0_44, 43, 0)
  A2_46:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSeikfrae_001(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:_runCharaScheduler(354226176)
  A2_49:say(A0_47, 94, 0)
  A2_49:say(A0_47, 95, 0)
  A2_49:say(A0_47, 96, 0)
  A2_49:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSeikfrae_002(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:_runCharaScheduler(354226176)
  A2_52:say(A0_50, 97, 0)
  A2_52:say(A0_50, 98, 0)
  A2_52:say(A0_50, 99, 0)
  A2_52:say(A0_50, 100, 0)
  A2_52:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSeikfrae_003(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:_runCharaScheduler(354226176)
  A2_55:say(A0_53, 101, 0)
  A2_55:say(A0_53, 102, 0)
  A2_55:say(A0_53, 103, 0)
  A2_55:say(A0_53, 104, 0)
  A2_55:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBasewin_001(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:_runCharaScheduler(353976320)
  A2_58:say(A0_56, 84, 0)
  A2_58:say(A0_56, 85, 0)
  A2_58:say(A0_56, 86, 0)
  A2_58:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBasewin_002(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:_runCharaScheduler(353976320)
  A2_61:say(A0_59, 87, 0)
  A2_61:say(A0_59, 88, 0)
  A2_61:say(A0_59, 89, 0)
  A2_61:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBasewin_003(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:_runCharaScheduler(353976320)
  A2_64:say(A0_62, 90, 0)
  A2_64:say(A0_62, 91, 0)
  A2_64:say(A0_62, 92, 0)
  A2_64:say(A0_62, 93, 0)
  A2_64:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithEdasshym_001(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:_runCharaScheduler(354226176)
  A2_67:say(A0_65, 105, 0)
  A2_67:say(A0_65, 106, 0)
  A2_67:say(A0_65, 107, 0)
  A2_67:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithEdasshym_002(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  A2_70:_runCharaScheduler(354226176)
  A2_70:say(A0_68, 108, 0)
  A2_70:say(A0_68, 109, 0)
  A2_70:say(A0_68, 110, 0)
  A2_70:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithEdasshym_003(A0_71, A1_72, A2_73)
  A2_73:startCliantTalkTurn(2, A1_72)
  A2_73:_runCharaScheduler(354226176)
  A2_73:say(A0_71, 111, 0)
  A2_73:say(A0_71, 112, 0)
  A2_73:say(A0_71, 113, 0)
  A2_73:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLtandhaa_001(A0_74, A1_75, A2_76)
  A2_76:startCliantTalkTurn(2, A1_75)
  A2_76:_runCharaScheduler(354234368)
  A2_76:say(A0_74, 44, 0)
  A2_76:say(A0_74, 45, 0)
  A2_76:say(A0_74, 46, 0)
  A2_76:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLtandhaa_002(A0_77, A1_78, A2_79)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:_runCharaScheduler(354234368)
  A2_79:say(A0_77, 47, 0)
  A2_79:say(A0_77, 48, 0)
  A2_79:say(A0_77, 49, 0)
  A2_79:say(A0_77, 50, 0)
  A2_79:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLtandhaa_003(A0_80, A1_81, A2_82)
  A2_82:startCliantTalkTurn(2, A1_81)
  A2_82:_runCharaScheduler(354234368)
  A2_82:say(A0_80, 51, 0)
  A2_82:say(A0_80, 52, 0)
  A2_82:say(A0_80, 53, 0)
  A2_82:say(A0_80, 54, 0)
  A2_82:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPofufu_001(A0_83, A1_84, A2_85)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:_runCharaScheduler(354234368)
  A2_85:say(A0_83, 55, 0)
  A2_85:say(A0_83, 56, 0)
  A2_85:say(A0_83, 57, 0)
  A2_85:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPofufu_002(A0_86, A1_87, A2_88)
  A2_88:startCliantTalkTurn(2, A1_87)
  A2_88:_runCharaScheduler(354234368)
  A2_88:say(A0_86, 58, 0)
  A2_88:say(A0_86, 59, 0)
  A2_88:say(A0_86, 60, 0)
  A2_88:say(A0_86, 61, 0)
  A2_88:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPofufu_003(A0_89, A1_90, A2_91)
  A2_91:startCliantTalkTurn(2, A1_90)
  A2_91:_runCharaScheduler(354234368)
  A2_91:say(A0_89, 62, 0)
  A2_91:say(A0_89, 63, 0)
  A2_91:say(A0_89, 64, 0)
  A2_91:say(A0_89, 65, 0)
  A2_91:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithDrividot_001(A0_92, A1_93, A2_94)
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:_runCharaScheduler(354168832)
  A2_94:say(A0_92, 66, 0)
  A2_94:say(A0_92, 67, 0)
  A2_94:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithDrividot_002(A0_95, A1_96, A2_97)
  A2_97:startCliantTalkTurn(2, A1_96)
  A2_97:_runCharaScheduler(354234368)
  A2_97:say(A0_95, 68, 0)
  A2_97:say(A0_95, 69, 0)
  A2_97:say(A0_95, 70, 0)
  A2_97:say(A0_95, 176, 0)
  A2_97:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithDrividot_003(A0_98, A1_99, A2_100)
  A2_100:startCliantTalkTurn(2, A1_99)
  A2_100:_runCharaScheduler(354234368)
  A2_100:say(A0_98, 71, 0)
  A2_100:say(A0_98, 72, 0)
  A2_100:say(A0_98, 73, 0)
  A2_100:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithOdilie_001(A0_101, A1_102, A2_103)
  A2_103:startCliantTalkTurn(2, A1_102)
  A2_103:_runCharaScheduler(354226176)
  A2_103:say(A0_101, 74, 0)
  A2_103:say(A0_101, 75, 0)
  A2_103:say(A0_101, 76, 0)
  A2_103:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithOdilie_002(A0_104, A1_105, A2_106)
  A2_106:startCliantTalkTurn(2, A1_105)
  A2_106:_runCharaScheduler(354226176)
  A2_106:say(A0_104, 77, 0)
  A2_106:say(A0_104, 78, 0)
  A2_106:say(A0_104, 79, 0)
  A2_106:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithOdilie_003(A0_107, A1_108, A2_109)
  A2_109:startCliantTalkTurn(2, A1_108)
  A2_109:_runCharaScheduler(354226176)
  A2_109:say(A0_107, 80, 0)
  A2_109:say(A0_107, 81, 0)
  A2_109:say(A0_107, 82, 0)
  A2_109:say(A0_107, 83, 0)
  A2_109:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithFlavielle_001(A0_110, A1_111, A2_112)
  A2_112:startCliantTalkTurn(2, A1_111)
  A2_112:_runCharaScheduler(353959936)
  A2_112:say(A0_110, 281, 0)
  A2_112:say(A0_110, 282, 0)
  A2_112:say(A0_110, 283, 0)
  A2_112:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithFlavielle_002(A0_113, A1_114, A2_115)
  A2_115:startCliantTalkTurn(2, A1_114)
  A2_115:_runCharaScheduler(353959936)
  A2_115:say(A0_113, 284, 0)
  A2_115:say(A0_113, 285, 0)
  A2_115:say(A0_113, 286, 0)
  A2_115:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithFlavielle_003(A0_116, A1_117, A2_118)
  A2_118:startCliantTalkTurn(2, A1_117)
  A2_118:_runCharaScheduler(353959936)
  A2_118:say(A0_116, 287, 0)
  A2_118:say(A0_116, 288, 0)
  A2_118:say(A0_116, 289, 0)
  A2_118:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHereward_001(A0_119, A1_120, A2_121)
  A2_121:startCliantTalkTurn(2, A1_120)
  A2_121:_runCharaScheduler(353959936)
  A2_121:say(A0_119, 188, 0)
  A2_121:say(A0_119, 189, 0)
  A2_121:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBeli_001(A0_122, A1_123, A2_124)
  A2_124:startCliantTalkTurn(2, A1_123)
  A2_124:_runCharaScheduler(353964032)
  A2_124:say(A0_122, 114, 0)
  A2_124:say(A0_122, 115, 0)
  A2_124:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMaddeline_001(A0_125, A1_126, A2_127)
  A2_127:startCliantTalkTurn(2, A1_126)
  A2_127:_runCharaScheduler(354168832)
  A2_127:say(A0_125, 116, 0)
  A2_127:say(A0_125, 117, 0)
  A2_127:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithDyrstbrod_001(A0_128, A1_129, A2_130)
  A2_130:startCliantTalkTurn(2, A1_129)
  A2_130:_runCharaScheduler(353964032)
  A2_130:say(A0_128, 118, 0)
  A2_130:say(A0_128, 119, 0)
  A2_130:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTatagoi_001(A0_131, A1_132, A2_133)
  A2_133:startCliantTalkTurn(1, A1_132)
  A2_133:_runCharaScheduler(67727360)
  A2_133:say(A0_131, 120, 0)
  A2_133:say(A0_131, 121, 0)
  A2_133:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithKhumamoshroca_001(A0_134, A1_135, A2_136)
  A2_136:startCliantTalkTurn(2, A1_135)
  A2_136:_runCharaScheduler(353964032)
  A2_136:say(A0_134, 122, 0)
  A2_136:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLuilda_001(A0_137, A1_138, A2_139)
  A2_139:startCliantTalkTurn(2, A1_138)
  A2_139:say(A0_137, 123, 0)
  A2_139:say(A0_137, 124, 0)
  A2_139:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAlixe_001(A0_140, A1_141, A2_142)
  A2_142:say(A0_140, 211, 0)
end
function DftFst.defaultTalkWithDadalo_001(A0_143, A1_144, A2_145)
  A2_145:say(A0_143, 212, 0)
end
function DftFst.defaultTalkWithKain_001(A0_146, A1_147, A2_148)
  A2_148:say(A0_146, 213, 0)
end
function DftFst.defaultTalkWithAnaidjaa_001(A0_149, A1_150, A2_151)
  A2_151:startCliantTalkTurn(2, A1_150)
  A2_151:_runCharaScheduler(354168832)
  A2_151:say(A0_149, 190, 0)
  A2_151:say(A0_149, 191, 0)
  A2_151:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithZuzupoja_001(A0_152, A1_153, A2_154)
  A2_154:startCliantTalkTurn(2, A1_153)
  A2_154:_runCharaScheduler(354177024)
  A2_154:say(A0_152, 125, 0)
  A2_154:say(A0_152, 126, 0)
  A2_154:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNellaure_001(A0_155, A1_156, A2_157)
  A2_157:startCliantTalkTurn(2, A1_156)
  A2_157:_runCharaScheduler(353964032)
  A2_157:say(A0_155, 127, 0)
  A2_157:say(A0_155, 128, 0)
  A2_157:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithCaplan_001(A0_158, A1_159, A2_160)
  A2_160:startCliantTalkTurn(2, A1_159)
  A2_160:_runCharaScheduler(354082816)
  A2_160:say(A0_158, 129, 0)
  A2_160:say(A0_158, 130, 0)
  A2_160:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithUlmhylt_001(A0_161, A1_162, A2_163)
  A2_163:startCliantTalkTurn(2, A1_162)
  A2_163:_runCharaScheduler(353959936)
  A2_163:say(A0_161, 131, 0)
  A2_163:say(A0_161, 132, 0)
  A2_163:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHabreham_001(A0_164, A1_165, A2_166)
  A2_166:say(A0_164, 214, 0)
end
function DftFst.defaultTalkWithDecima_001(A0_167, A1_168, A2_169)
  A2_169:say(A0_167, 215, 0)
end
function DftFst.defaultTalkWithChalyotamlyo_001(A0_170, A1_171, A2_172)
  A2_172:say(A0_170, 216, 0)
end
function DftFst.defaultTalkWithPowle_001(A0_173, A1_174, A2_175)
  A2_175:say(A0_173, 205, 0)
end
function DftFst.defaultTalkWithSansa_001(A0_176, A1_177, A2_178)
  A2_178:startCliantTalkTurn(2, A1_177)
  A2_178:_runCharaScheduler(67731456)
  A2_178:say(A0_176, 206, 0)
  A2_178:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNicoliaux_001(A0_179, A1_180, A2_181)
  A2_181:startCliantTalkTurn(2, A1_180)
  A2_181:_runCharaScheduler(354054144)
  A2_181:say(A0_179, 207, 0)
  A2_181:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAunillie_001(A0_182, A1_183, A2_184)
  A2_184:say(A0_182, 208, 0)
end
function DftFst.defaultTalkWithElyn_001(A0_185, A1_186, A2_187)
  A2_187:startCliantTalkTurn(2, A1_186)
  A2_187:_runCharaScheduler(354226176)
  A2_187:say(A0_185, 209, 0)
  A2_187:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRyd_001(A0_188, A1_189, A2_190)
  A2_190:startCliantTalkTurn(2, A1_189)
  A2_190:_runCharaScheduler(353959936)
  A2_190:say(A0_188, 210, 0)
  A2_190:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithWillelda_001(A0_191, A1_192, A2_193)
  A2_193:startCliantTalkTurn(2, A1_192)
  A2_193:_runCharaScheduler(354177024)
  A2_193:say(A0_191, 192, 0)
  A2_193:say(A0_191, 193, 0)
  A2_193:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithWillelda_002(A0_194, A1_195, A2_196)
  A2_196:startCliantTalkTurn(2, A1_195)
  A2_196:_runCharaScheduler(354177024)
  A2_196:say(A0_194, 451, 0)
  A2_196:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBurchard_001(A0_197, A1_198, A2_199)
  A2_199:startCliantTalkTurn(2, A1_198)
  A2_199:say(A0_197, 203, 0)
  A2_199:say(A0_197, 204, 0)
  A2_199:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithCeinguled_001(A0_200, A1_201, A2_202)
  A2_202:startCliantTalkTurn(2, A1_201)
  A2_202:_runCharaScheduler(354062336)
  A2_202:say(A0_200, 133, 0)
  A2_202:say(A0_200, 134, 0)
  A2_202:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithFrancis_001(A0_203, A1_204, A2_205, A3_206)
  A2_205:startCliantTalkTurn(2, A1_204)
  A2_205:_runCharaScheduler(353964032)
  if A3_206 == 1 then
    A2_205:say(A0_203, 136, 0)
  else
    A2_205:say(A0_203, 135, 0)
  end
  A2_205:say(A0_203, 137, 0)
  A2_205:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithDhemdaeg_001(A0_207, A1_208, A2_209)
  A2_209:startCliantTalkTurn(2, A1_208)
  A2_209:_runCharaScheduler(354177024)
  A2_209:say(A0_207, 138, 0)
  A2_209:say(A0_207, 139, 0)
  A2_209:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLuitfrid_001(A0_210, A1_211, A2_212)
  A2_212:startCliantTalkTurn(2, A1_211)
  A2_212:_runCharaScheduler(353964032)
  A2_212:say(A0_210, 140, 0)
  A2_212:say(A0_210, 141, 0)
  A2_212:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHaurtefert_001(A0_213, A1_214, A2_215)
  A2_215:startCliantTalkTurn(2, A1_214)
  A2_215:_runCharaScheduler(353964032)
  A2_215:say(A0_213, 142, 0)
  A2_215:say(A0_213, 143, 0)
  A2_215:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithZpahtalo_001(A0_216, A1_217, A2_218)
  A2_218:startCliantTalkTurn(2, A1_217)
  A2_218:_runCharaScheduler(353964032)
  A2_218:say(A0_216, 144, 0)
  A2_218:say(A0_216, 145, 0)
  A2_218:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithJmoldva_001(A0_219, A1_220, A2_221)
  A2_221:startCliantTalkTurn(2, A1_220)
  A2_221:_runCharaScheduler(353964032)
  A2_221:say(A0_219, 217, 0)
  A2_221:say(A0_219, 218, 0)
  A2_221:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNuala_001(A0_222, A1_223, A2_224)
  A2_224:startCliantTalkTurn(2, A1_223)
  A2_224:_runCharaScheduler(354177024)
  A2_224:say(A0_222, 219, 0)
  A2_224:say(A0_222, 220, 0)
  A2_224:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithJolline_001(A0_225, A1_226, A2_227)
  A2_227:say(A0_225, 221, 0)
end
function DftFst.defaultTalkWithAerstsyn_001(A0_228, A1_229, A2_230)
  A2_230:say(A0_228, 222, 0)
end
function DftFst.defaultTalkWithNonolato_001(A0_231, A1_232, A2_233)
  A2_233:startCliantTalkTurn(2, A1_232)
  A2_233:_runCharaScheduler(354168832)
  A2_233:say(A0_231, 194, 0)
  A2_233:say(A0_231, 539, 0)
  A2_233:say(A0_231, 195, 0)
  A2_233:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithOdhinek_001(A0_234, A1_235, A2_236)
  A2_236:startCliantTalkTurn(2, A1_235)
  A2_236:_runCharaScheduler(353964032)
  A2_236:say(A0_234, 146, 0)
  A2_236:say(A0_234, 147, 0)
  A2_236:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGeorjeaux_001(A0_237, A1_238, A2_239)
  A2_239:startCliantTalkTurn(2, A1_238)
  A2_239:_runCharaScheduler(354172928)
  A2_239:say(A0_237, 148, 0)
  A2_239:say(A0_237, 540, 0)
  A2_239:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGeorjeaux_002(A0_240, A1_241, A2_242)
  A2_242:startCliantTalkTurn(2, A1_241)
  A2_242:_runCharaScheduler(354172928)
  A2_242:say(A0_240, 524, 0)
  A2_242:say(A0_240, 540, 0)
  A2_242:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAlaire_001(A0_243, A1_244, A2_245)
  A2_245:startCliantTalkTurn(2, A1_244)
  A2_245:_runCharaScheduler(353972224)
  A2_245:say(A0_243, 149, 0)
  A2_245:say(A0_243, 150, 0)
  A2_245:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithChloe_001(A0_246, A1_247, A2_248)
  A2_248:startCliantTalkTurn(2, A1_247)
  A2_248:_runCharaScheduler(353964032)
  A2_248:say(A0_246, 177, 0)
  A2_248:say(A0_246, 178, 0)
  A2_248:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMianne_001(A0_249, A1_250, A2_251)
  A2_251:startCliantTalkTurn(2, A1_250)
  A2_251:_runCharaScheduler(353959936)
  A2_251:say(A0_249, 151, 0)
  A2_251:say(A0_249, 152, 0)
  A2_251:say(A0_249, 541, 0)
  A2_251:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBubuku_001(A0_252, A1_253, A2_254)
  A2_254:say(A0_252, 223, 0)
end
function DftFst.defaultTalkWithPiers_001(A0_255, A1_256, A2_257)
  A2_257:say(A0_255, 224, 0)
end
function DftFst.defaultTalkWithSolieine_001(A0_258, A1_259, A2_260)
  A2_260:startCliantTalkTurn(2, A1_259)
  A2_260:_runCharaScheduler(354168832)
  A2_260:say(A0_258, 179, 0)
  A2_260:say(A0_258, 180, 0)
  A2_260:say(A0_258, 536, 0)
  A2_260:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHetzkin_001(A0_261, A1_262, A2_263)
  A2_263:startCliantTalkTurn(2, A1_262)
  A2_263:say(A0_261, 181, 0)
  A2_263:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTelent_001(A0_264, A1_265, A2_266)
  A2_266:startCliantTalkTurn(2, A1_265)
  A2_266:_runCharaScheduler(353964032)
  A2_266:say(A0_264, 182, 0)
  A2_266:say(A0_264, 183, 0)
  A2_266:say(A0_264, 537, 0)
  A2_266:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithKhujazhwan_001(A0_267, A1_268, A2_269)
  A2_269:startCliantTalkTurn(2, A1_268)
  A2_269:_runCharaScheduler(354050048)
  A2_269:say(A0_267, 153, 0)
  A2_269:say(A0_267, 538, 0)
  A2_269:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithZerig_001(A0_270, A1_271, A2_272)
  A2_272:startCliantTalkTurn(1, A1_271)
  A2_272:_runCharaScheduler(353959936)
  A2_272:say(A0_270, 154, 0)
  A2_272:say(A0_270, 155, 0)
  A2_272:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithYonariumnari_001(A0_273, A1_274, A2_275)
  A2_275:startCliantTalkTurn(2, A1_274)
  A2_275:_runCharaScheduler(353959936)
  A2_275:say(A0_273, 156, 0)
  A2_275:say(A0_273, 157, 0)
  A2_275:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGugula_001(A0_276, A1_277, A2_278)
  A2_278:startCliantTalkTurn(2, A1_277)
  A2_278:_runCharaScheduler(353964032)
  A2_278:say(A0_276, 158, 0)
  A2_278:say(A0_276, 196, 0)
  A2_278:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRdjongo_001(A0_279, A1_280, A2_281)
  A2_281:startCliantTalkTurn(2, A1_280)
  A2_281:_runCharaScheduler(354177024)
  A2_281:say(A0_279, 159, 0)
  A2_281:say(A0_279, 160, 0)
  A2_281:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAstrelle_001(A0_282, A1_283, A2_284)
  A2_284:startCliantTalkTurn(2, A1_283)
  A2_284:_runCharaScheduler(353959936)
  A2_284:say(A0_282, 161, 0)
  A2_284:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBiddy_001(A0_285, A1_286, A2_287)
  A2_287:startCliantTalkTurn(2, A1_286)
  A2_287:_runCharaScheduler(354168832)
  A2_287:say(A0_285, 162, 0)
  A2_287:say(A0_285, 163, 0)
  A2_287:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithConcessa_001(A0_288, A1_289, A2_290)
  A2_290:startCliantTalkTurn(2, A1_289)
  A2_290:_runCharaScheduler(84017152)
  A2_290:say(A0_288, 164, 0)
  A2_290:say(A0_288, 184, 0)
  A2_290:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMaroile_001(A0_291, A1_292, A2_293)
  A2_293:startCliantTalkTurn(2, A1_292)
  A2_293:_runCharaScheduler(354172928)
  A2_293:say(A0_291, 165, 0)
  A2_293:say(A0_291, 166, 0)
  A2_293:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithKinborow_001(A0_294, A1_295, A2_296)
  A2_296:startCliantTalkTurn(2, A1_295)
  A2_296:_runCharaScheduler(354000896)
  A2_296:say(A0_294, 167, 0)
  A2_296:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTnbulea_001(A0_297, A1_298, A2_299)
  A2_299:startCliantTalkTurn(2, A1_298)
  A2_299:_runCharaScheduler(353964032)
  A2_299:say(A0_297, 185, 0)
  A2_299:say(A0_297, 197, 0)
  A2_299:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithFoforyo_001(A0_300, A1_301, A2_302)
  A2_302:startCliantTalkTurn(2, A1_301)
  A2_302:_runCharaScheduler(353964032)
  A2_302:say(A0_300, 186, 0)
  A2_302:say(A0_300, 198, 0)
  A2_302:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithOpyltyl_001(A0_303, A1_304, A2_305)
  A2_305:startCliantTalkTurn(2, A1_304)
  A2_305:_runCharaScheduler(354177024)
  A2_305:say(A0_303, 199, 0)
  A2_305:say(A0_303, 200, 0)
  A2_305:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithCicely_001(A0_306, A1_307, A2_308)
  A2_308:startCliantTalkTurn(2, A1_307)
  A2_308:_runCharaScheduler(353972224)
  A2_308:say(A0_306, 201, 0)
  A2_308:say(A0_306, 202, 0)
  A2_308:say(A0_306, 542, 0)
  A2_308:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithVnabyano_001(A0_309, A1_310, A2_311)
  A2_311:startCliantTalkTurn(2, A1_310)
  A2_311:_runCharaScheduler(353968128)
  A2_311:say(A0_309, 168, 0)
  A2_311:say(A0_309, 169, 0)
  A2_311:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSandre_001(A0_312, A1_313, A2_314)
  A2_314:startCliantTalkTurn(2, A1_313)
  A2_314:_runCharaScheduler(353964032)
  A2_314:say(A0_312, 170, 0)
  A2_314:say(A0_312, 171, 0)
  A2_314:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMestonnaux_001(A0_315, A1_316, A2_317)
  A2_317:startCliantTalkTurn(2, A1_316)
  A2_317:_runCharaScheduler(354168832)
  A2_317:say(A0_315, 172, 0)
  A2_317:say(A0_315, 173, 0)
  A2_317:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithEburhart_001(A0_318, A1_319, A2_320)
  A2_320:say(A0_318, 225, 0)
end
function DftFst.defaultTalkWithOnguen_001(A0_321, A1_322, A2_323)
  A2_323:say(A0_321, 226, 0)
end
function DftFst.defaultTalkEnie_001(A0_324, A1_325, A2_326)
  A2_326:startCliantTalkTurn(2, A1_325)
  A2_326:_runCharaScheduler(353959936)
  A2_326:say(A0_324, 478, 0)
  A2_326:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLionnellais_001(A0_327, A1_328, A2_329)
  A2_329:startCliantTalkTurn(2, A1_328)
  A2_329:_runCharaScheduler(353959936)
  A2_329:say(A0_327, 228, 0)
  A2_329:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHida_001(A0_330, A1_331, A2_332)
  A2_332:startCliantTalkTurn(2, A1_331)
  A2_332:_runCharaScheduler(354168832)
  A2_332:say(A0_330, 229, 0)
  A2_332:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNoes_001(A0_333, A1_334, A2_335)
  A2_335:say(A0_333, 227, 0)
end
function DftFst.defaultTalkWithFhrudhem_001(A0_336, A1_337, A2_338)
  A2_338:startCliantTalkTurn(2, A1_337)
  A2_338:say(A0_336, 230, 0)
  A2_338:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBertennant_001(A0_339, A1_340, A2_341)
  A2_341:say(A0_339, 231, 0)
end
function DftFst.defaultTalkWithUlta_001(A0_342, A1_343, A2_344)
  A2_344:say(A0_342, 545, 0)
  A2_344:startCliantTalkTurn(2, A1_343)
  A2_344:_runCharaScheduler(354168832)
  A2_344:say(A0_342, 232, 0)
  A2_344:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMathye_001(A0_345, A1_346, A2_347)
  A2_347:startCliantTalkTurn(2, A1_346)
  A2_347:_runCharaScheduler(353964032)
  A2_347:say(A0_345, 233, 0)
  A2_347:say(A0_345, 234, 0)
  A2_347:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMitainie_001(A0_348, A1_349, A2_350)
  A2_350:say(A0_348, 235, 0)
end
function DftFst.defaultTalkWithNicia_001(A0_351, A1_352, A2_353)
  A2_353:startCliantTalkTurn(2, A1_352)
  A2_353:_runCharaScheduler(354177024)
  A2_353:say(A0_351, 546, 0)
  A2_353:say(A0_351, 236, 0)
  A2_353:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBlandie_001(A0_354, A1_355, A2_356)
  A2_356:say(A0_354, 237, 0)
  A2_356:say(A0_354, 592, 0)
end
function DftFst.defaultTalkWithKinnison_001(A0_357, A1_358, A2_359, A3_360, A4_361)
  A2_359:startCliantTalkTurn(2, A1_358)
  A2_359:_runCharaScheduler(354168832)
  A2_359:say(A0_357, 239, 0)
  if A3_360 >= 0 or A4_361 >= 0 then
    A2_359:say(A0_357, 554, 0)
  else
    A2_359:say(A0_357, 240, 0)
  end
  A2_359:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGenna_001(A0_362, A1_363, A2_364)
  A2_364:say(A0_362, 593, 0)
end
function DftFst.defaultTalkWithOwyne_001(A0_365, A1_366, A2_367)
  A2_367:startCliantTalkTurn(2, A1_366)
  A2_367:say(A0_365, 242, 0)
  A2_367:say(A0_365, 405, 0)
  A2_367:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSybell_001(A0_368, A1_369, A2_370)
  A2_370:startCliantTalkTurn(2, A1_369)
  A2_370:_runCharaScheduler(354086912)
  A2_370:say(A0_368, 243, 0)
  A2_370:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLivith_001(A0_371, A1_372, A2_373)
  A2_373:startCliantTalkTurn(2, A1_372)
  A2_373:_runCharaScheduler(353964032)
  A2_373:say(A0_371, 244, 0)
  A2_373:say(A0_371, 245, 0)
  A2_373:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithProscen_001(A0_374, A1_375, A2_376)
  A2_376:startCliantTalkTurn(1, A1_375)
  A2_376:_runCharaScheduler(354058240)
  A2_376:say(A0_374, 246, 0)
  A2_376:say(A0_374, 247, 0)
  A2_376:say(A0_374, 533, 0)
  A2_376:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTanguistl_001(A0_377, A1_378, A2_379)
  A2_379:startCliantTalkTurn(2, A1_378)
  A2_379:_runCharaScheduler(353959936)
  A2_379:say(A0_377, 248, 0)
  A2_379:say(A0_377, 249, 0)
  A2_379:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithComoere_001(A0_380, A1_381, A2_382)
  A2_382:say(A0_380, 598, 0)
  A2_382:say(A0_380, 599, 0)
end
function DftFst.defaultTalkWithLougblaet_001(A0_383, A1_384, A2_385)
  A2_385:startCliantTalkTurn(2, A1_384)
  A2_385:_runCharaScheduler(353964032)
  A2_385:say(A0_383, 252, 0)
  A2_385:say(A0_383, 534, 0)
  A2_385:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithFamushidumushi_001(A0_386, A1_387, A2_388)
  A2_388:say(A0_386, 600, 0)
  A2_388:say(A0_386, 601, 0)
end
function DftFst.defaultTalkWithDrystan_001(A0_389, A1_390, A2_391)
  A2_391:startCliantTalkTurn(2, A1_390)
  A2_391:_runCharaScheduler(354000896)
  A2_391:say(A0_389, 255, 0)
  A2_391:say(A0_389, 535, 0)
  A2_391:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithEadbert_001(A0_392, A1_393, A2_394)
  A2_394:startCliantTalkTurn(2, A1_393)
  A2_394:say(A0_392, 256, 0)
  A2_394:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithWybir_001(A0_395, A1_396, A2_397)
  A2_397:startCliantTalkTurn(2, A1_396)
  A2_397:_runCharaScheduler(353959936)
  A2_397:say(A0_395, 187, 0)
  A2_397:say(A0_395, 257, 0)
  A2_397:say(A0_395, 528, 0)
  A2_397:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithKeketo_001(A0_398, A1_399, A2_400)
  A2_400:startCliantTalkTurn(2, A1_399)
  A2_400:_runCharaScheduler(353964032)
  A2_400:say(A0_398, 258, 0)
  A2_400:say(A0_398, 259, 0)
  A2_400:say(A0_398, 527, 0)
  A2_400:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRadianttear_001(A0_401, A1_402, A2_403)
  A2_403:startCliantTalkTurn(2, A1_402)
  A2_403:_runCharaScheduler(354177024)
  A2_403:say(A0_401, 260, 0)
  A2_403:say(A0_401, 261, 0)
  A2_403:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMyles_001(A0_404, A1_405, A2_406)
  A2_406:startCliantTalkTurn(1, A1_405)
  A2_406:_runCharaScheduler(353959936)
  A2_406:say(A0_404, 262, 0)
  A2_406:say(A0_404, 263, 0)
  A2_406:say(A0_404, 526, 0)
  A2_406:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithNathaniel_001(A0_407, A1_408, A2_409)
  A2_409:startCliantTalkTurn(1, A1_408)
  A2_409:_runCharaScheduler(353959936)
  A2_409:say(A0_407, 264, 0)
  A2_409:say(A0_407, 265, 0)
  A2_409:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithEvrardoux_001(A0_410, A1_411, A2_412)
  A2_412:startCliantTalkTurn(2, A1_411)
  A2_412:_runCharaScheduler(353968128)
  A2_412:say(A0_410, 266, 0)
  A2_412:say(A0_410, 267, 0)
  A2_412:say(A0_410, 529, 0)
  A2_412:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTsehpanipahr_001(A0_413, A1_414, A2_415)
  A2_415:startCliantTalkTurn(2, A1_414)
  A2_415:_runCharaScheduler(353964032)
  A2_415:say(A0_413, 268, 0)
  A2_415:say(A0_413, 269, 0)
  A2_415:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithEthelinda_001(A0_416, A1_417, A2_418)
  A2_418:startCliantTalkTurn(2, A1_417)
  A2_418:say(A0_416, 530, 0)
  A2_418:say(A0_416, 270, 0)
  A2_418:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHedheue_001(A0_419, A1_420, A2_421)
  A2_421:startCliantTalkTurn(2, A1_420)
  A2_421:_runCharaScheduler(354177024)
  A2_421:say(A0_419, 271, 0)
  A2_421:say(A0_419, 531, 0)
  A2_421:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithJajajbygo_001(A0_422, A1_423, A2_424, A3_425, A4_426)
  A2_424:startCliantTalkTurn(2, A1_423)
  if A3_425 == 20 then
    A2_424:say(A0_422, 589, 0)
  else
    A2_424:say(A0_422, 272, 0)
  end
  A2_424:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPepeli_001(A0_427, A1_428, A2_429, A3_430)
  A2_429:startCliantTalkTurn(2, A1_428)
  if A3_430 == 20 then
    A2_429:say(A0_427, 590, 0)
  else
    A2_429:say(A0_427, 273, 0)
  end
  A2_429:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBidelia_001(A0_431, A1_432, A2_433)
  A2_433:startCliantTalkTurn(2, A1_432)
  A2_433:say(A0_431, 275, 0)
  A2_433:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMiraudont_001(A0_434, A1_435, A2_436, A3_437)
  A2_436:startCliantTalkTurn(2, A1_435)
  if A3_437 == true then
    A2_436:say(A0_434, 591, 0)
  else
    A2_436:say(A0_434, 276, 0)
  end
  A2_436:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRimomo_001(A0_438, A1_439, A2_440)
  A2_440:startCliantTalkTurn(2, A1_439)
  A2_440:_runCharaScheduler(354177024)
  A2_440:say(A0_438, 277, 0)
  A2_440:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithDadaneja_001(A0_441, A1_442, A2_443)
  A2_443:startCliantTalkTurn(2, A1_442)
  A2_443:_runCharaScheduler(354168832)
  A2_443:say(A0_441, 278, 0)
  A2_443:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithIolaine_001(A0_444, A1_445, A2_446)
  A2_446:startCliantTalkTurn(2, A1_445)
  A2_446:_runCharaScheduler(354168832)
  A2_446:say(A0_444, 279, 0)
  A2_446:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBloisirant_001(A0_447, A1_448, A2_449)
  A2_449:startCliantTalkTurn(2, A1_448)
  A2_449:_runCharaScheduler(354168832)
  A2_449:say(A0_447, 280, 0)
  A2_449:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGylbart_001(A0_450, A1_451, A2_452)
  A2_452:startCliantTalkTurn(2, A1_451)
  A2_452:_runCharaScheduler(353959936)
  A2_452:say(A0_450, 291, 0)
  A2_452:say(A0_450, 532, 0)
  A2_452:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHonoroit_001(A0_453, A1_454, A2_455)
  A2_455:startCliantTalkTurn(2, A1_454)
  A2_455:say(A0_453, 274, 0)
  A2_455:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithYlessa_001(A0_456, A1_457, A2_458)
  A2_458:startCliantTalkTurn(2, A1_457)
  A2_458:_runCharaScheduler(353959936)
  A2_458:say(A0_456, 290, 0)
  A2_458:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLonsygg_001(A0_459, A1_460, A2_461)
  A2_461:startCliantTalkTurn(2, A1_460)
  A2_461:_runCharaScheduler(353959936)
  A2_461:say(A0_459, 292, 0)
  A2_461:say(A0_459, 293, 0)
  A2_461:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLefwyne_001(A0_462, A1_463, A2_464)
  A2_464:startCliantTalkTurn(2, A1_463)
  A2_464:say(A0_462, 378, 0)
  A2_464:say(A0_462, 543, 0)
  A2_464:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSwaenhylt_001(A0_465, A1_466, A2_467)
  A2_467:startCliantTalkTurn(2, A1_466)
  A2_467:_runCharaScheduler(353976320)
  A2_467:say(A0_465, 391, 0)
  A2_467:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMarcette_001(A0_468, A1_469, A2_470)
  A2_470:startCliantTalkTurn(2, A1_469)
  A2_470:_runCharaScheduler(354082816)
  A2_470:say(A0_468, 392, 0)
  A2_470:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGuildleveClientG_001(A0_471, A1_472, A2_473)
  A2_473:startCliantTalkTurn(2, A1_472)
  A2_473:say(A0_471, 294, 0)
  A2_473:say(A0_471, 295, 0)
  A2_473:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGuildleveClientG_002(A0_474, A1_475, A2_476)
  A2_476:say(A0_474, 296, 0)
  A2_476:startCliantTalkTurn(2, A1_475)
  A2_476:say(A0_474, 297, 0)
  A2_476:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithGuildleveClientG_003(A0_477, A1_478, A2_479)
  A2_479:startCliantTalkTurn(2, A1_478)
  A2_479:say(A0_477, 298, 0)
  A2_479:say(A0_477, 299, 0)
  A2_479:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAUBRENARD_100(A0_480, A1_481, A2_482)
  A2_482:startCliantTalkTurn(2, A1_481)
  A2_482:say(A0_480, 300, 0)
  A2_482:finishCliantTalkTurn()
end
function DftFst.defQuest1g0_Bush(A0_483, A1_484, A2_485)
end
function DftFst.defQuest1g1_Bush(A0_486, A1_487, A2_488)
end
function DftFst.defaultTalkWithChamberliaux_001(A0_489, A1_490, A2_491)
  A2_491:startCliantTalkTurn(2, A1_490)
  A2_491:_runCharaScheduler(353959936)
  A2_491:say(A0_489, 393, 0)
  A2_491:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithFraemhar_001(A0_492, A1_493, A2_494)
  A2_494:startCliantTalkTurn(2, A1_493)
  A2_494:_runCharaScheduler(354205696)
  A2_494:say(A0_492, 394, 0)
  A2_494:say(A0_492, 395, 0)
  A2_494:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithXbhowaqi_001(A0_495, A1_496, A2_497)
  A2_497:startCliantTalkTurn(2, A1_496)
  A2_497:say(A0_495, 396, 0)
  A2_497:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLora_001(A0_498, A1_499, A2_500)
  A2_500:startCliantTalkTurn(2, A1_499)
  A2_500:_runCharaScheduler(353959936)
  A2_500:say(A0_498, 397, 0)
  A2_500:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithWawaramu_001(A0_501, A1_502, A2_503)
  A2_503:startCliantTalkTurn(2, A1_502)
  A2_503:_runCharaScheduler(353959936)
  A2_503:say(A0_501, 398, 0)
  A2_503:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithArnott_001(A0_504, A1_505, A2_506)
  A2_506:startCliantTalkTurn(2, A1_505)
  A2_506:_runCharaScheduler(353968128)
  A2_506:say(A0_504, 399, 0)
  A2_506:say(A0_504, 400, 0)
  A2_506:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithLhomujuuk_001(A0_507, A1_508, A2_509)
  A2_509:startCliantTalkTurn(2, A1_508)
  A2_509:say(A0_507, 407, 0)
  A2_509:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithSholnoralno_001(A0_510, A1_511, A2_512)
  A2_512:startCliantTalkTurn(2, A1_511)
  A2_512:_runCharaScheduler(353959936)
  A2_512:say(A0_510, 408, 0)
  A2_512:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTuatkk_001(A0_513, A1_514, A2_515)
  A2_515:startCliantTalkTurn(2, A1_514)
  A2_515:_runCharaScheduler(353959936)
  A2_515:say(A0_513, 409, 0)
  A2_515:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAruhnsenna_001(A0_516, A1_517, A2_518)
  A2_518:startCliantTalkTurn(2, A1_517)
  A2_518:_runCharaScheduler(353959936)
  A2_518:say(A0_516, 410, 0)
  A2_518:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMoogle010_001(A0_519, A1_520, A2_521)
  A2_521:startCliantTalkTurn(2, A1_520)
  A2_521:say(A0_519, 411, 0)
  A2_521:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMoogle002_001(A0_522, A1_523, A2_524)
  A2_524:startCliantTalkTurn(2, A1_523)
  A2_524:say(A0_522, 412, 0)
  A2_524:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAilith_001(A0_525, A1_526, A2_527)
  A2_527:startCliantTalkTurn(2, A1_526)
  A2_527:_runCharaScheduler(354041856)
  A2_527:say(A0_525, 406, 0)
  A2_527:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMemama_001(A0_528, A1_529, A2_530)
  A2_530:startCliantTalkTurn(2, A1_529)
  A2_530:say(A0_528, 453, 0)
  A2_530:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPfarahr_001(A0_531, A1_532, A2_533)
  A2_533:startCliantTalkTurn(2, A1_532)
  A2_533:say(A0_531, 454, 0)
  A2_533:say(A0_531, 455, 0)
  A2_533:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithBeaudonet_001(A0_534, A1_535, A2_536)
  A2_536:say(A0_534, 594, 0)
  A2_536:say(A0_534, 595, 0)
end
function DftFst.defaultTalkWithFryswyde_001(A0_537, A1_538, A2_539)
  A2_539:say(A0_537, 596, 0)
  A2_539:say(A0_537, 597, 0)
end
function DftFst.defaultTalkWithWillielmus_001(A0_540, A1_541, A2_542)
  A2_542:startCliantTalkTurn(2, A1_541)
  A2_542:say(A0_540, 460, 0)
  A2_542:say(A0_540, 547, 0)
  A2_542:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithQZamqo_001(A0_543, A1_544, A2_545)
  A2_545:startCliantTalkTurn(2, A1_544)
  A2_545:say(A0_543, 461, 0)
  if A2_545:ask(A0_543, 462, 2) == 1 then
    A2_545:say(A0_543, 465, 0)
  else
    A2_545:say(A0_543, 466, 0)
  end
  A2_545:finishCliantTalkTurn()
end
function DftFst.defaultTalkLouisoix_001(A0_546, A1_547, A2_548)
  A2_548:startCliantTalkTurn(2, A1_547)
  A2_548:_runCharaScheduler(353959936)
  A2_548:say(A0_546, 467, 0)
  A2_548:say(A0_546, 468, 0)
  A2_548:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRonanKognan_001(A0_549, A1_550, A2_551)
  A2_551:_runCharaScheduler(83927040)
  A2_551:say(A0_549, 413, 0)
  A0_549:_wait(1.5)
  A2_551:startCliantTalkTurn(1, A1_550)
  A2_551:say(A0_549, 428, 0)
  A2_551:say(A0_549, 429, 0)
  A2_551:_runCharaScheduler(67727360)
  A0_549:_wait(1.5)
  A2_551:say(A0_549, 430, 0)
  A2_551:say(A0_549, 431, 0)
  A2_551:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRonanKognan_002(A0_552, A1_553, A2_554, A3_555, A4_556)
  local L5_557
  L5_557 = A2_554._runCharaScheduler
  L5_557(A2_554, 83927040)
  L5_557 = A2_554.say
  L5_557(A2_554, A0_552, 413, 0)
  L5_557 = A0_552._wait
  L5_557(A0_552, 1)
  L5_557 = A2_554.say
  L5_557(A2_554, A0_552, 414, 0)
  L5_557 = A2_554.startCliantTalkTurn
  L5_557(A2_554, 1, A1_553)
  L5_557 = A0_552._wait
  L5_557(A0_552, 1.5)
  L5_557 = A2_554.say
  L5_557(A2_554, A0_552, 415, 0)
  L5_557 = A2_554._runCharaScheduler
  L5_557(A2_554, 67727360)
  repeat
    L5_557 = 0
    L5_557 = A2_554:askExtendWidget(A0_552, 441, 8, 1, 1)
    if L5_557 == 1 then
      if A2_554:askExtendWidget(A0_552, 417, 2, 1, 2) == 1 then
        return L5_557
      else
        L5_557 = 0
      end
    elseif L5_557 == 2 then
      if A2_554:askExtendWidget(A0_552, 417, 2, 1, 2) == 1 then
        return L5_557
      else
        L5_557 = 0
      end
    elseif L5_557 == 3 then
      if A2_554:askExtendWidget(A0_552, 417, 2, 1, 2) == 1 then
        return L5_557
      else
        L5_557 = 0
      end
    elseif L5_557 == 4 then
      if A2_554:askExtendWidget(A0_552, 417, 2, 1, 2) == 1 then
        return L5_557
      else
        L5_557 = 0
      end
    elseif L5_557 == 5 then
      if A2_554:askExtendWidget(A0_552, 417, 2, 1, 2) == 1 then
        return L5_557
      else
        L5_557 = 0
      end
    elseif L5_557 == 6 then
      if A2_554:askExtendWidget(A0_552, 417, 2, 1, 2) == 1 then
        return L5_557
      else
        L5_557 = 0
      end
    elseif L5_557 == 7 then
      if A2_554:askExtendWidget(A0_552, 417, 2, 1, 2) == 1 then
        if A3_555 == true then
          if A4_556 == true then
            A2_554:_runCharaScheduler(354041856)
            A2_554:say(A0_552, 432, 0)
            A0_552:_wait(1.5)
            A2_554:finishCliantTalkTurn()
            L5_557 = 10
            return L5_557
          else
            return L5_557
          end
        else
          A2_554:_runCharaScheduler(354041856)
          A2_554:say(A0_552, 420, 0, L5_557)
          A0_552:_wait(1.5)
          A2_554:finishCliantTalkTurn()
          L5_557 = 10
          return L5_557
        end
      else
        L5_557 = 0
      end
    elseif L5_557 == 8 then
      A2_554:_runCharaScheduler(354058240)
      A2_554:say(A0_552, 416, 0)
      A0_552:_wait(1.5)
      A2_554:finishCliantTalkTurn()
      L5_557 = 10
      return L5_557
    else
      A0_552:_wait(1.5)
      A2_554:finishCliantTalkTurn()
      L5_557 = 10
      return L5_557
    end
  until L5_557 ~= 0
  L5_557 = A2_554.finishCliantTalkTurn
  L5_557(A2_554)
end
function DftFst.defaultTalkWithRonanKognan_Hint_00(A0_558, A1_559, A2_560, A3_561)
  A2_560:startCliantTalkTurn(2, A1_559)
  A2_560:_runCharaScheduler(354115584)
  A2_560:say(A0_558, 438, 0)
  A2_560:say(A0_558, 439, 0)
  A2_560:_runCharaScheduler(354082816)
  A2_560:say(A0_558, 440, 0)
  A2_560:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRonanKognan_Hint_01(A0_562, A1_563, A2_564, A3_565)
  A2_564:startCliantTalkTurn(2, A1_563)
  A2_564:_runCharaScheduler(354115584)
  A2_564:say(A0_562, 421, 0)
  A2_564:say(A0_562, 422, 0)
  A2_564:_runCharaScheduler(354041856)
  A2_564:say(A0_562, 423, 0)
  A2_564:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRonanKognan_Hint_02(A0_566, A1_567, A2_568, A3_569)
  A2_568:startCliantTalkTurn(2, A1_567)
  A2_568:_runCharaScheduler(353964032)
  A2_568:say(A0_566, 424, 0)
  A2_568:say(A0_566, 425, 0)
  A2_568:_runCharaScheduler(354082816)
  A2_568:say(A0_566, 433, 0)
  A2_568:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRonanKognan_Hint_03(A0_570, A1_571, A2_572, A3_573)
  A2_572:startCliantTalkTurn(2, A1_571)
  A2_572:_runCharaScheduler(353968128)
  A2_572:say(A0_570, 426, 0)
  A2_572:say(A0_570, 427, 0)
  A2_572:_runCharaScheduler(354086912)
  A2_572:say(A0_570, 434, 0)
  A2_572:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRonanKognan_Hint_04(A0_574, A1_575, A2_576, A3_577)
  A2_576:_runCharaScheduler(83959808)
  A2_576:say(A0_574, 435, 0)
  A2_576:startCliantTalkTurn(2, A1_575)
  A2_576:say(A0_574, 436, 0)
  A2_576:_runCharaScheduler(353968128)
  A2_576:say(A0_574, 437, 0)
  A2_576:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithVorsaile_001(A0_578, A1_579, A2_580, A3_581)
  A2_580:startCliantTalkTurn(2, A1_579)
  A2_580:_runCharaScheduler(353959936)
  A2_580:say(A0_578, 482, 0)
  A2_580:finishCliantTalkTurn()
end
function DftFst.defaultTalkCaravanChocoboGri_001(A0_582, A1_583, A2_584)
  A2_584:_runCharaScheduler(70017024)
  A0_582:_wait(0.5)
  A1_583:_runCharaScheduler(67111908)
end
function DftFst.downTownTalk(A0_585, A1_586, A2_587, A3_588, A4_589, A5_590)
  local L6_591
  if A5_590 == true then
    L6_591 = A2_587.say
    L6_591(A2_587, A0_585, 309, 0)
  else
    L6_591 = A2_587.startCliantTalkTurn
    L6_591(A2_587, 2, A1_586)
    L6_591 = A2_587.say
    L6_591(A2_587, A0_585, 301, 0)
  end
  while true do
    L6_591 = nil
    L6_591 = worldMaster:askRestrictChoices(A2_587, A0_585, 380, true, true, true, true, true, false, false, true)
    if L6_591 == nil or L6_591 == 8 then
      break
    elseif L6_591 == 1 then
      A2_587:say(A0_585, 310, 0)
    elseif L6_591 == 2 then
      A2_587:say(A0_585, 311, 0)
      A2_587:say(A0_585, 500, 0)
    elseif L6_591 == 3 then
      A2_587:say(A0_585, 312, 0)
      A2_587:say(A0_585, 501, 0)
    elseif L6_591 == 4 then
      A2_587:say(A0_585, 452, 0)
      A2_587:say(A0_585, 502, 0)
    elseif L6_591 == 5 then
      A2_587:say(A0_585, 313, 0)
      A2_587:say(A0_585, 503, 0)
      A2_587:say(A0_585, 314, 0)
      A2_587:say(A0_585, 504, 0)
    elseif L6_591 == 6 then
      if A3_588 == true then
        desktopWidget:askItemSearchWidget()
        return -2
      else
        A2_587:say(A0_585, 315, 0)
      end
    elseif L6_591 == 7 then
      return -1
    end
    A2_587:say(A0_585, 309, 0)
  end
  L6_591 = A2_587.finishCliantTalkTurn
  L6_591(A2_587)
end
function DftFst.tribeTalk(A0_592, A1_593, A2_594)
  A2_594:startCliantTalkTurn(2, A1_593)
  A2_594:say(A0_592, 316, 0)
  while true do
    if worldMaster:ask(A2_594, A0_592, 317, 3) == nil or worldMaster:ask(A2_594, A0_592, 317, 3) == 3 then
      break
    elseif worldMaster:ask(A2_594, A0_592, 317, 3) == 1 then
      if worldMaster:ask(A2_594, A0_592, 322, 5) == nil or worldMaster:ask(A2_594, A0_592, 322, 5) == 5 then
        break
      elseif worldMaster:ask(A2_594, A0_592, 322, 5) == 1 then
        A2_594:say(A0_592, 328, 0)
        A2_594:say(A0_592, 469, 0)
        A2_594:say(A0_592, 329, 0)
      elseif worldMaster:ask(A2_594, A0_592, 322, 5) == 2 then
        A2_594:say(A0_592, 330, 0)
        A2_594:say(A0_592, 470, 0)
        A2_594:say(A0_592, 331, 0)
        A2_594:say(A0_592, 471, 0)
      elseif worldMaster:ask(A2_594, A0_592, 322, 5) == 3 then
        A2_594:say(A0_592, 332, 0)
        A2_594:say(A0_592, 472, 0)
        A2_594:say(A0_592, 333, 0)
        A2_594:say(A0_592, 473, 0)
      end
    elseif worldMaster:ask(A2_594, A0_592, 317, 3) == 2 then
      if worldMaster:ask(A2_594, A0_592, 334, 4) == nil or worldMaster:ask(A2_594, A0_592, 334, 4) == 4 then
        break
      elseif worldMaster:ask(A2_594, A0_592, 334, 4) == 1 then
        A2_594:say(A0_592, 339, 0)
        A2_594:say(A0_592, 474, 0)
        A2_594:say(A0_592, 340, 0)
        A2_594:say(A0_592, 475, 0)
      elseif worldMaster:ask(A2_594, A0_592, 334, 4) == 2 then
        A2_594:say(A0_592, 341, 0)
        A2_594:say(A0_592, 342, 0)
        A2_594:say(A0_592, 476, 0)
      end
    end
    A2_594:say(A0_592, 321, 0)
  end
  A2_594:finishCliantTalkTurn()
end
function DftFst.bookTalk(A0_595, A1_596, A2_597)
  worldMaster:say(A0_595, 343)
  while true do
    if worldMaster:ask(A2_597, A0_595, 344, 3) == nil or worldMaster:ask(A2_597, A0_595, 344, 3) == 3 then
      return
    elseif worldMaster:ask(A2_597, A0_595, 344, 3) == 1 then
      worldMaster:say(A0_595, 348)
      while true do
        if worldMaster:ask(A2_597, A0_595, 349, 7) == nil or worldMaster:ask(A2_597, A0_595, 349, 7) == 7 then
          break
        elseif worldMaster:ask(A2_597, A0_595, 349, 7) == 1 then
          worldMaster:say(A0_595, 357)
          worldMaster:say(A0_595, 505)
        elseif worldMaster:ask(A2_597, A0_595, 349, 7) == 2 then
          worldMaster:say(A0_595, 358)
        elseif worldMaster:ask(A2_597, A0_595, 349, 7) == 3 then
          worldMaster:say(A0_595, 359)
          worldMaster:say(A0_595, 508)
        elseif worldMaster:ask(A2_597, A0_595, 349, 7) == 4 then
          worldMaster:say(A0_595, 360)
          worldMaster:say(A0_595, 361)
          worldMaster:say(A0_595, 506)
          worldMaster:say(A0_595, 362)
        elseif worldMaster:ask(A2_597, A0_595, 349, 7) == 5 then
          worldMaster:say(A0_595, 363)
          worldMaster:say(A0_595, 379)
        elseif worldMaster:ask(A2_597, A0_595, 349, 7) == 6 then
          worldMaster:say(A0_595, 364)
          worldMaster:say(A0_595, 507)
          worldMaster:say(A0_595, 365)
          worldMaster:say(A0_595, 366)
        end
      end
    elseif worldMaster:ask(A2_597, A0_595, 344, 3) == 2 then
      worldMaster:say(A0_595, 367)
      while true do
        if worldMaster:ask(A2_597, A0_595, 368, 5) == nil or worldMaster:ask(A2_597, A0_595, 368, 5) == 5 then
          break
        elseif worldMaster:ask(A2_597, A0_595, 368, 5) == 1 then
          worldMaster:say(A0_595, 374)
        elseif worldMaster:ask(A2_597, A0_595, 368, 5) == 2 then
          worldMaster:say(A0_595, 375)
        elseif worldMaster:ask(A2_597, A0_595, 368, 5) == 3 then
          worldMaster:say(A0_595, 376)
        elseif worldMaster:ask(A2_597, A0_595, 368, 5) == 4 then
          worldMaster:say(A0_595, 377)
        end
      end
    end
  end
end
function DftFst.talkIdayCap(A0_598, A1_599, A2_600)
  A2_600:startCliantTalkTurnNoWait(1, A1_599)
  A2_600:say(A0_598, 401, 0)
  A2_600:finishCliantTalkTurn()
end
function DftFst.talkIday1(A0_601, A1_602, A2_603)
  A2_603:startCliantTalkTurnNoWait(1, A1_602)
  A2_603:say(A0_601, 402, 0)
  A2_603:say(A0_601, 403, 0)
  A2_603:finishCliantTalkTurn()
end
function DftFst.talkIday2(A0_604, A1_605, A2_606)
  A2_606:startCliantTalkTurnNoWait(1, A1_605)
  A2_606:say(A0_604, 404, 0)
  A2_606:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPukwapika_001(A0_607, A1_608, A2_609)
  A2_609:startCliantTalkTurnNoWait(1, A1_608)
  A2_609:_runCharaScheduler(70086656)
  A2_609:say(A0_607, 479, 0)
  A2_609:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPurumoogle_001(A0_610, A1_611, A2_612)
  A2_612:startCliantTalkTurnNoWait(1, A1_611)
  A2_612:_runCharaScheduler(70197248)
  A2_612:say(A0_610, 480, 0)
  A2_612:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPirimoogle_001(A0_613, A1_614, A2_615)
  A2_615:startCliantTalkTurnNoWait(1, A1_614)
  A2_615:_runCharaScheduler(70098944)
  A2_615:say(A0_613, 481, 0)
  A2_615:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPukumoogle_001(A0_616, A1_617, A2_618)
  A2_618:startCliantTalkTurnNoWait(1, A1_617)
  A2_618:_runCharaScheduler(70184960)
  A2_618:say(A0_616, 522, 0)
  A2_618:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithJehantel_001(A0_619, A1_620, A2_621)
  A2_621:startCliantTalkTurn(2, A1_620)
  A2_621:say(A0_619, 487, 0)
  A2_621:say(A0_619, 488, 0)
  A2_621:finishCliantTalkTurn()
  A2_621:_runCharaScheduler(69521408)
  A0_619:_wait(1.5)
  A1_620:_runCharaScheduler(67111909)
  A0_619:_wait(2)
end
function DftFst.defaultTalkWithJehantel_002(A0_622, A1_623, A2_624)
  A2_624:startCliantTalkTurn(2, A1_623)
  A2_624:say(A0_622, 483, 0)
  A2_624:finishCliantTalkTurn()
  A2_624:_runCharaScheduler(69521408)
  A0_622:_wait(1.5)
  A1_623:_runCharaScheduler(67111909)
  A0_622:_wait(2)
end
function DftFst.defaultTalkWithPukno_001(A0_625, A1_626, A2_627)
  A2_627:startCliantTalkTurn(1, A1_626)
  A2_627:_runCharaScheduler(70098944)
  A2_627:say(A0_625, 497, 0)
  A2_627:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithPukno_002(A0_628, A1_629, A2_630)
  A2_630:startCliantTalkTurn(1, A1_629)
  A2_630:_runCharaScheduler(70078464)
  A2_630:say(A0_628, 485, 0)
  A2_630:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRayao_001(A0_631, A1_632, A2_633)
  A2_633:startCliantTalkTurn(2, A1_632)
  A2_633:_runCharaScheduler(79597568)
  A2_633:say(A0_631, 489, 0)
  A2_633:say(A0_631, 490, 0)
  A2_633:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithRayao_002(A0_634, A1_635, A2_636)
  A2_636:startCliantTalkTurn(2, A1_635)
  A2_636:_runCharaScheduler(353964032)
  A2_636:say(A0_634, 491, 0)
  A2_636:say(A0_634, 492, 0)
  A2_636:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMoogleA_001(A0_637, A1_638, A2_639)
  A2_639:startCliantTalkTurnNoWait(1, A1_638)
  A2_639:_runCharaScheduler(70086656)
  A2_639:say(A0_637, 493, 0)
  A2_639:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMoogleA_002(A0_640, A1_641, A2_642)
  A2_642:startCliantTalkTurnNoWait(1, A1_641)
  A2_642:_runCharaScheduler(70021120)
  A2_642:say(A0_640, 494, 0)
  A2_642:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMppgleB_001(A0_643, A1_644, A2_645)
  A2_645:startCliantTalkTurnNoWait(1, A1_644)
  A2_645:_runCharaScheduler(70078464)
  A2_645:say(A0_643, 495, 0)
  A2_645:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithMppgleB_002(A0_646, A1_647, A2_648)
  A2_648:startCliantTalkTurnNoWait(1, A1_647)
  A2_648:_runCharaScheduler(70197248)
  A2_648:say(A0_646, 496, 0)
  A2_648:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithAnselm_001(A0_649, A1_650, A2_651)
  A2_651:startCliantTalkTurn(2, A1_650)
  A2_651:say(A0_649, 498, 0)
  A2_651:_runCharaScheduler(354066432)
  A2_651:say(A0_649, 499, 0)
  A2_651:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithStewart_001(A0_652, A1_653, A2_654)
  A2_654:startCliantTalkTurn(2, A1_653)
  A2_654:_runCharaScheduler(353968128)
  A2_654:say(A0_652, 563, 0)
  A2_654:say(A0_652, 564, 0)
  A2_654:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithStewart_002(A0_655, A1_656, A2_657)
  A2_657:startCliantTalkTurn(2, A1_656)
  if A2_657:doSalute(2, 11) == 0 then
    A2_657:_runCharaScheduler(353964032)
  end
  A0_655:_wait(1)
  A2_657:say(A0_655, 572, 0)
  A2_657:say(A0_655, 573, 0)
  A2_657:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTrisselle_001(A0_658, A1_659, A2_660)
  A2_660:startCliantTalkTurn(2, A1_659)
  A2_660:_runCharaScheduler(353959936)
  A2_660:say(A0_658, 587, 0)
  A2_660:say(A0_658, 588, 0)
  A2_660:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithTrisselle_002(A0_661, A1_662, A2_663)
  A2_663:startCliantTalkTurn(2, A1_662)
  A2_663:_runCharaScheduler(353959936)
  A2_663:say(A0_661, 602, 0)
  A2_663:say(A0_661, 603, 0)
  A2_663:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithInn_Desk(A0_664, A1_665, A2_666)
  A2_666:startCliantTalkTurn(2, A1_665)
  A2_666:_runCharaScheduler(353959936)
  A2_666:say(A0_664, 509, 0)
  while true do
    while true do
      while true do
        while true do
          while true do
            if A2_666:askExtendWidget(A0_664, 510, 5, 1, 1) == 5 or A2_666:askExtendWidget(A0_664, 510, 5, 1, 1) == -3 or A2_666:askExtendWidget(A0_664, 510, 5, 1, 1) == nil then
              break
            end
            if A2_666:askExtendWidget(A0_664, 510, 5, 1, 1) == 1 then
              A2_666:say(A0_664, 516, 0)
              return (A2_666:askExtendWidget(A0_664, 510, 5, 1, 1))
            end
          end
          if A2_666:askExtendWidget(A0_664, 510, 5, 1, 1) == 2 then
            A2_666:say(A0_664, 517, 0)
            worldMaster:say(A0_664, 518)
            worldMaster:say(A0_664, 519)
            worldMaster:say(A0_664, 523)
          end
        end
        if A2_666:askExtendWidget(A0_664, 510, 5, 1, 1) == 3 then
          A2_666:say(A0_664, 520, 0)
          worldMaster:say(A0_664, 521)
        end
      end
      if A2_666:askExtendWidget(A0_664, 510, 5, 1, 1) == 4 then
        A2_666:say(A0_664, 548, 0)
        worldMaster:say(A0_664, 525)
        if A2_666:askExtendWidget(worldMaster, 60016, 2, 1, 1) == 1 then
          A2_666:finishCliantTalkTurn()
          return 2
        end
      end
    end
  end
  A2_666:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithInn_ExitDoor(A0_667, A1_668, A2_669)
  if A2_669:askExtendWidget(worldMaster, 60013, 2, 1, 1) == 1 then
    return (A2_669:askExtendWidget(worldMaster, 60013, 2, 1, 1))
  else
  end
end
function DftFst.defaultTalkWithExit01(A0_670, A1_671, A2_672)
  if A2_672:askExtendWidget(worldMaster, 51036, 2, 1, 1) == 1 then
    return (A2_672:askExtendWidget(worldMaster, 51036, 2, 1, 1))
  else
  end
end
function DftFst.defaultTalkWithLegendBsm_001(A0_673, A1_674, A2_675, A3_676)
  local L4_677
  L4_677 = A3_676
  if L4_677 == 0 then
    A2_675:say(A0_673, 552, 0)
    break
  else
  end
  if L4_677 == 1 then
    A2_675:say(A0_673, 556, 0)
    break
  else
  end
  if L4_677 == 2 then
    A2_675:say(A0_673, 558, 0)
    break
  else
  end
  if L4_677 == 3 then
    A2_675:say(A0_673, 557, 0)
    break
  else
  end
  if L4_677 == 4 then
    A2_675:say(A0_673, 559, 0)
    break
  else
  end
  if L4_677 == 5 then
    A2_675:say(A0_673, 560, 0)
    break
  else
  end
  if L4_677 == 6 then
    A2_675:say(A0_673, 561, 0)
    break
  else
  end
  if L4_677 == 7 then
    A2_675:say(A0_673, 562, 0)
    break
  else
  end
  if L4_677 == 8 then
    A2_675:say(A0_673, 555, 0)
    break
  else
  end
end
function DftFst.defaultTalkWithMarketNpc(A0_678, A1_679, A2_680)
  A2_680:startCliantTalkTurn(2, A1_679)
  A2_680:say(A0_678, 551, 0)
  A2_680:finishCliantTalkTurn()
end
function DftFst.defaultTalkWithHamletGuardGri_001(A0_681, A1_682, A2_683)
  A2_683:startCliantTalkTurn(2, A1_682)
  A2_683:_runCharaScheduler(353984512)
  A2_683:say(A0_681, 553, 0)
  A2_683:finishCliantTalkTurn()
end
