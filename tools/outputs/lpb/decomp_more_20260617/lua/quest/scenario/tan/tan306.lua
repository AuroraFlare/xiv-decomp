require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Tan306", "ScenarioBaseClass")
function Tan306.initText(A0_0)
  A0_0:_loadTextDataPermanently(415, "tan306")
end
function Tan306.processEventHerewardStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 3, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 131, 0)
  else
    A2_3:say(A0_1, 130, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Tan306.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("tan30610", 1)
  A0_4:startFadeInCutSceneAfterWarp(A1_5)
end
function Tan306.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("tan30620", 1)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
function Tan306.processEvent023(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 24, 0)
  A2_12:say(A0_10, 25, 0)
  A2_12:finishCliantTalkTurn()
end
function Tan306.processEvent025(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 26, 0)
  A2_15:finishCliantTalkTurn()
end
function Tan306.processEvent027(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 137, 0)
  A2_18:finishCliantTalkTurn()
end
function Tan306.processEvent030(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("tan30630", 1)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Tan306.processEvent040(A0_22, A1_23, A2_24)
  A2_24:say(A0_22, 45, 0)
  if worldMaster:ask(A0_22, worldMaster, 51030, 2) == 1 then
    A0_22:runCharaSchedulerPastAreaIn(A1_23)
    A0_22:startFadeOutCutSceneDefault(A1_23)
    A0_22:startNQCutScene("tan30640", 1)
    A0_22:startFadeInCutSceneAfterWarp(A1_23)
  else
    return 0
  end
  return (worldMaster:ask(A0_22, worldMaster, 51030, 2))
end
function Tan306.processEvent050(A0_25, A1_26, A2_27)
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startFadeInCutSceneDefault(A1_26)
end
function Tan306.processEvent005_2(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 79, 0)
  A2_30:finishCliantTalkTurn()
end
function Tan306.processEvent005_3(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 80, 0)
  A2_33:finishCliantTalkTurn()
end
function Tan306.processEvent005_4(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 81, 0)
  A2_36:finishCliantTalkTurn()
end
function Tan306.processEvent005_5(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 82, 0)
  A2_39:finishCliantTalkTurn()
end
function Tan306.processEvent005_6(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 83, 0)
  A2_42:say(A0_40, 84, 0)
  A2_42:finishCliantTalkTurn()
end
function Tan306.processEvent005_7(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 4, 0)
  A2_45:say(A0_43, 5, 0)
  A2_45:finishCliantTalkTurn()
end
function Tan306.processEvent005_8(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 6, 0)
  A2_48:say(A0_46, 7, 0)
  A2_48:finishCliantTalkTurn()
end
function Tan306.processEvent005_9(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 8, 0)
  A2_51:say(A0_49, 9, 0)
  A2_51:finishCliantTalkTurn()
end
function Tan306.processEvent010_2(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 85, 0)
  A2_54:say(A0_52, 86, 0)
  A2_54:say(A0_52, 87, 0)
  A2_54:finishCliantTalkTurn()
end
function Tan306.processEvent010_3(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 88, 0)
  A2_57:finishCliantTalkTurn()
end
function Tan306.processEvent010_4(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 89, 0)
  A2_60:say(A0_58, 90, 0)
  A2_60:finishCliantTalkTurn()
end
function Tan306.processEvent010_5(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 91, 0)
  A2_63:say(A0_61, 92, 0)
  A2_63:finishCliantTalkTurn()
end
function Tan306.processEvent010_6(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 93, 0)
  A2_66:say(A0_64, 94, 0)
  A2_66:finishCliantTalkTurn()
end
function Tan306.processEvent010_7(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 95, 0)
  A2_69:say(A0_67, 96, 0)
  A2_69:finishCliantTalkTurn()
end
function Tan306.processEvent010_8(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 97, 0)
  A2_72:say(A0_70, 98, 0)
  A2_72:finishCliantTalkTurn()
end
function Tan306.processEvent020_2(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 102, 0)
  A2_75:say(A0_73, 103, 0)
  A2_75:finishCliantTalkTurn()
end
function Tan306.processEvent020_3(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 104, 0)
  A2_78:finishCliantTalkTurn()
end
function Tan306.processEvent020_4(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 105, 0)
  A2_81:say(A0_79, 106, 0)
  A2_81:finishCliantTalkTurn()
end
function Tan306.processEvent020_5(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 107, 0)
  A2_84:say(A0_82, 108, 0)
  A2_84:finishCliantTalkTurn()
end
function Tan306.processEvent020_6(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 109, 0)
  A2_87:say(A0_85, 110, 0)
  A2_87:finishCliantTalkTurn()
end
function Tan306.processEvent020_7(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 99, 0)
  A2_90:finishCliantTalkTurn()
end
function Tan306.processEvent020_8(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 100, 0)
  A2_93:say(A0_91, 101, 0)
  A2_93:finishCliantTalkTurn()
end
function Tan306.processEvent027_2(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 111, 0)
  A2_96:say(A0_94, 112, 0)
  A2_96:finishCliantTalkTurn()
end
function Tan306.processEvent027_3(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 113, 0)
  A2_99:finishCliantTalkTurn()
end
function Tan306.processEvent027_4(A0_100, A1_101, A2_102, A3_103, A4_104)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 132, 0)
  A2_102:say(A0_100, 133, 0, A3_103, A4_104)
  A2_102:finishCliantTalkTurn()
end
function Tan306.processEvent027_5(A0_105, A1_106, A2_107)
  A2_107:startCliantTalkTurn(2, A1_106)
  A2_107:say(A0_105, 114, 0)
  A2_107:finishCliantTalkTurn()
end
function Tan306.processEvent027_6(A0_108, A1_109, A2_110)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:say(A0_108, 115, 0)
  A2_110:say(A0_108, 116, 0)
  A2_110:finishCliantTalkTurn()
end
function Tan306.processEvent027_7(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 117, 0)
  A2_113:say(A0_111, 118, 0)
  A2_113:finishCliantTalkTurn()
end
function Tan306.processEvent027_8(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:say(A0_114, 119, 0)
  A2_116:finishCliantTalkTurn()
end
function Tan306.processEvent027_9(A0_117, A1_118, A2_119, A3_120, A4_121)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:say(A0_117, 136, 0, A3_120, A4_121)
  A2_119:finishCliantTalkTurn()
end
function Tan306.processEvent027_10(A0_122, A1_123, A2_124)
  A2_124:startCliantTalkTurn(2, A1_123)
  A2_124:say(A0_122, 138, 0)
  A2_124:finishCliantTalkTurn()
end
function Tan306.processEvent028(A0_125, A1_126, A2_127)
  A2_127:startCliantTalkTurn(2, A1_126)
  A2_127:say(A0_125, 139, 0)
  A2_127:finishCliantTalkTurn()
end
function Tan306.processEvent030_2(A0_128, A1_129, A2_130)
  A2_130:say(A0_128, 43, 0)
  A2_130:say(A0_128, 44, 0)
end
function Tan306.processEvent030_3(A0_131, A1_132, A2_133)
  A2_133:startCliantTalkTurn(2, A1_132)
  A2_133:say(A0_131, 140, 0)
  A2_133:finishCliantTalkTurn()
end
function Tan306.processEvent030_4(A0_134, A1_135, A2_136)
  A2_136:startCliantTalkTurn(2, A1_135)
  A2_136:say(A0_134, 141, 0)
  A2_136:finishCliantTalkTurn()
end
function Tan306.processEvent030_5(A0_137, A1_138, A2_139)
  A2_139:startCliantTalkTurn(2, A1_138)
  A2_139:say(A0_137, 142, 0)
  A2_139:finishCliantTalkTurn()
end
function Tan306.processEvent040_3(A0_140, A1_141, A2_142)
  A2_142:startCliantTalkTurn(2, A1_141)
  A2_142:say(A0_140, 120, 0)
  A2_142:say(A0_140, 121, 0)
  A2_142:finishCliantTalkTurn()
end
function Tan306.processEvent040_4(A0_143, A1_144, A2_145)
  A2_145:startCliantTalkTurn(2, A1_144)
  A2_145:say(A0_143, 134, 0)
  A2_145:say(A0_143, 135, 0)
  A2_145:finishCliantTalkTurn()
end
function Tan306.processEvent040_5(A0_146, A1_147, A2_148)
  A2_148:startCliantTalkTurn(2, A1_147)
  A2_148:say(A0_146, 122, 0)
  A2_148:say(A0_146, 123, 0)
  A2_148:finishCliantTalkTurn()
end
function Tan306.processEvent040_6(A0_149, A1_150, A2_151)
  A2_151:startCliantTalkTurn(2, A1_150)
  A2_151:say(A0_149, 124, 0)
  A2_151:say(A0_149, 125, 0)
  A2_151:finishCliantTalkTurn()
end
function Tan306.processEvent040_7(A0_152, A1_153, A2_154)
  A2_154:startCliantTalkTurn(2, A1_153)
  A2_154:say(A0_152, 126, 0)
  A2_154:say(A0_152, 127, 0)
  A2_154:finishCliantTalkTurn()
end
function Tan306.processEvent040_8(A0_155, A1_156, A2_157)
  A2_157:startCliantTalkTurn(2, A1_156)
  A2_157:say(A0_155, 128, 0)
  A2_157:say(A0_155, 129, 0)
  A2_157:finishCliantTalkTurn()
end
