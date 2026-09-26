require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Exc306", "ScenarioBaseClass")
function Exc306.initText(A0_0)
  A0_0:_loadTextDataPermanently(121, "exc306")
end
function Exc306.processEventWaekbyrtStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:say(A0_1, 7, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Exc306.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("exc30610", 1)
  A0_4:startFadeInCutSceneAfterWarp(A1_5)
end
function Exc306.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("exc30620", 1)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Exc306.processEvent030(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("exc30630", 1)
  A0_10:startFadeInCutSceneAfterWarp(A1_11)
end
function Exc306.processEvent033(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 32, 0)
  A2_15:say(A0_13, 33, 0)
  A2_15:finishCliantTalkTurn()
end
function Exc306.processEvent035(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 34, 0)
  A2_18:say(A0_16, 35, 0)
  A2_18:finishCliantTalkTurn()
end
function Exc306.processEvent040(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("exc30640", 1)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Exc306.processEvent050(A0_22, A1_23, A2_24, A3_25)
  A0_22:startFadeOutCutSceneDefault(A1_23)
  A0_22:startNQCutScene("exc30650", 1)
  if A3_25 == 0 then
    A0_22:startFadeInCutSceneDefault(A1_23)
  else
    A0_22:startFadeInCutSceneAfterWarp(A1_23)
  end
end
function Exc306.processEvent060(A0_26, A1_27, A2_28)
  A0_26:startFadeOutCutSceneDefault(A1_27)
  A0_26:startNQCutScene("exc30660", 1)
  A0_26:startFadeInCutSceneAfterWarp(A1_27)
end
function Exc306.processEvent070(A0_29, A1_30, A2_31)
  if worldMaster:ask(A0_29, worldMaster, 51030, 2) == 1 then
    A0_29:runCharaSchedulerPastAreaIn(A1_30)
    A0_29:startFadeOutCutSceneDefault(A1_30)
    A0_29:startNQCutScene("exc30670", 1)
    A0_29:startFadeInCutSceneDefault(A1_30)
    return (worldMaster:ask(A0_29, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Exc306.processEvent080(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 82, 0)
  A2_34:say(A0_32, 83, 0)
  A2_34:say(A0_32, 84, 0)
  A2_34:finishCliantTalkTurn()
end
function Exc306.processEvent000(A0_35, A1_36, A2_37)
  if A2_37:ask(A0_35, 64, 2) == 1 then
  end
end
function Exc306.processEvent111(A0_38, A1_39, A2_40)
end
function Exc306.processEvent112(A0_41, A1_42, A2_43)
end
function Exc306.processEvent001_2(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 86, 0)
  A2_46:say(A0_44, 87, 0)
  A2_46:finishCliantTalkTurn()
end
function Exc306.processEvent001_3(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 88, 0)
  A2_49:say(A0_47, 89, 0)
  A2_49:finishCliantTalkTurn()
end
function Exc306.processEvent001_4(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 90, 0)
  A2_52:say(A0_50, 91, 0)
  A2_52:finishCliantTalkTurn()
end
function Exc306.processEvent001_5(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 92, 0)
  A2_55:say(A0_53, 93, 0)
  A2_55:finishCliantTalkTurn()
end
function Exc306.processEvent001_6(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 94, 0)
  A2_58:say(A0_56, 95, 0)
  A2_58:finishCliantTalkTurn()
end
function Exc306.processEvent001_7(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 96, 0)
  A2_61:say(A0_59, 97, 0)
  A2_61:say(A0_59, 98, 0)
  A2_61:finishCliantTalkTurn()
end
function Exc306.processEvent001_8(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 99, 0)
  A2_64:say(A0_62, 100, 0)
  A2_64:finishCliantTalkTurn()
end
function Exc306.processEvent001_9(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 101, 0)
  A2_67:say(A0_65, 102, 0)
  A2_67:finishCliantTalkTurn()
end
function Exc306.processEvent001_10(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  A2_70:say(A0_68, 103, 0)
  A2_70:say(A0_68, 104, 0)
  A2_70:finishCliantTalkTurn()
end
function Exc306.processEvent001_11(A0_71, A1_72, A2_73)
  A2_73:startCliantTalkTurn(2, A1_72)
  A2_73:say(A0_71, 105, 0)
  A2_73:say(A0_71, 106, 0)
  A2_73:finishCliantTalkTurn()
end
function Exc306.processEvent001_12(A0_74, A1_75, A2_76)
  A2_76:startCliantTalkTurn(2, A1_75)
  A2_76:say(A0_74, 107, 0)
  A2_76:say(A0_74, 108, 0)
  A2_76:finishCliantTalkTurn()
end
function Exc306.processEvent001_13(A0_77, A1_78, A2_79)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:say(A0_77, 109, 0)
  A2_79:say(A0_77, 110, 0)
  A2_79:finishCliantTalkTurn()
end
function Exc306.processEvent001_14(A0_80, A1_81, A2_82)
  A2_82:say(A0_80, 111, 0)
  A2_82:say(A0_80, 112, 0)
end
function Exc306.processEvent001_15(A0_83, A1_84, A2_85)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:say(A0_83, 113, 0)
  A2_85:say(A0_83, 114, 0)
  A2_85:finishCliantTalkTurn()
end
function Exc306.processEvent001_16(A0_86, A1_87, A2_88)
  A2_88:startCliantTalkTurn(2, A1_87)
  A2_88:say(A0_86, 115, 0)
  A2_88:say(A0_86, 116, 0)
  A2_88:finishCliantTalkTurn()
end
function Exc306.processEvent001_17(A0_89, A1_90, A2_91)
  A2_91:startCliantTalkTurn(2, A1_90)
  A2_91:say(A0_89, 117, 0)
  A2_91:finishCliantTalkTurn()
end
function Exc306.processEvent001_18(A0_92, A1_93, A2_94)
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:say(A0_92, 118, 0)
  A2_94:finishCliantTalkTurn()
end
function Exc306.processEvent020_2(A0_95, A1_96, A2_97)
  A2_97:startCliantTalkTurn(2, A1_96)
  A2_97:say(A0_95, 119, 0)
  A2_97:say(A0_95, 120, 0)
  A2_97:finishCliantTalkTurn()
end
function Exc306.processEvent030_2(A0_98, A1_99, A2_100)
  A2_100:startCliantTalkTurn(2, A1_99)
  A2_100:say(A0_98, 27, 0)
  A2_100:say(A0_98, 28, 0)
  A2_100:finishCliantTalkTurn()
end
function Exc306.processEvent030_3(A0_101, A1_102, A2_103)
  A2_103:startCliantTalkTurn(2, A1_102)
  A2_103:say(A0_101, 29, 0)
  A2_103:say(A0_101, 30, 0)
  A2_103:finishCliantTalkTurn()
end
function Exc306.processEvent030_4(A0_104, A1_105, A2_106)
  A2_106:startCliantTalkTurn(2, A1_105)
  A2_106:say(A0_104, 121, 0)
  A2_106:say(A0_104, 122, 0)
  A2_106:say(A0_104, 123, 0)
  A2_106:finishCliantTalkTurn()
end
function Exc306.processEvent030_5(A0_107, A1_108, A2_109)
  A2_109:startCliantTalkTurn(2, A1_108)
  A2_109:say(A0_107, 124, 0)
  A2_109:finishCliantTalkTurn()
end
function Exc306.processEvent030_6(A0_110, A1_111, A2_112)
  A2_112:startCliantTalkTurn(2, A1_111)
  A2_112:say(A0_110, 125, 0)
  A2_112:finishCliantTalkTurn()
end
function Exc306.processEvent030_7(A0_113, A1_114, A2_115)
  A2_115:startCliantTalkTurn(2, A1_114)
  A2_115:say(A0_113, 126, 0)
  A2_115:say(A0_113, 127, 0)
  A2_115:finishCliantTalkTurn()
end
function Exc306.processEvent030_8(A0_116, A1_117, A2_118)
  A2_118:startCliantTalkTurn(2, A1_117)
  A2_118:say(A0_116, 128, 0)
  A2_118:say(A0_116, 129, 0)
  A2_118:finishCliantTalkTurn()
end
function Exc306.processEvent030_9(A0_119, A1_120, A2_121)
  A2_121:startCliantTalkTurn(2, A1_120)
  A2_121:say(A0_119, 130, 0)
  A2_121:say(A0_119, 131, 0)
  A2_121:finishCliantTalkTurn()
end
function Exc306.processEvent030_10(A0_122, A1_123, A2_124)
  A2_124:startCliantTalkTurn(2, A1_123)
  A2_124:say(A0_122, 132, 0)
  A2_124:say(A0_122, 133, 0)
  A2_124:finishCliantTalkTurn()
end
function Exc306.processEvent030_11(A0_125, A1_126, A2_127)
  A2_127:startCliantTalkTurn(2, A1_126)
  A2_127:say(A0_125, 134, 0)
  A2_127:say(A0_125, 135, 0)
  A2_127:finishCliantTalkTurn()
end
function Exc306.processEvent030_12(A0_128, A1_129, A2_130)
  A2_130:startCliantTalkTurn(2, A1_129)
  A2_130:say(A0_128, 31, 0)
  A2_130:finishCliantTalkTurn()
end
function Exc306.processEvent050_2(A0_131, A1_132, A2_133)
  A2_133:startCliantTalkTurn(2, A1_132)
  A2_133:say(A0_131, 136, 0)
  A2_133:say(A0_131, 137, 0)
  A2_133:finishCliantTalkTurn()
end
function Exc306.processEvent050_3(A0_134, A1_135, A2_136)
  A2_136:startCliantTalkTurn(2, A1_135)
  A2_136:say(A0_134, 138, 0)
  A2_136:finishCliantTalkTurn()
end
function Exc306.processEvent050_4(A0_137, A1_138, A2_139)
  A2_139:startCliantTalkTurn(2, A1_138)
  A2_139:say(A0_137, 139, 0)
  A2_139:say(A0_137, 140, 0)
  A2_139:finishCliantTalkTurn()
end
function Exc306.processEvent050_5(A0_140, A1_141, A2_142)
  A2_142:startCliantTalkTurn(2, A1_141)
  A2_142:say(A0_140, 141, 0)
  A2_142:say(A0_140, 142, 0)
  A2_142:finishCliantTalkTurn()
end
function Exc306.processEvent050_6(A0_143, A1_144, A2_145)
  A2_145:startCliantTalkTurn(2, A1_144)
  A2_145:say(A0_143, 143, 0)
  A2_145:say(A0_143, 144, 0)
  A2_145:finishCliantTalkTurn()
end
function Exc306.processEvent060_2(A0_146, A1_147, A2_148)
  A2_148:startCliantTalkTurn(2, A1_147)
  A2_148:say(A0_146, 145, 0)
  A2_148:say(A0_146, 146, 0)
  A2_148:say(A0_146, 147, 0)
  A2_148:finishCliantTalkTurn()
end
function Exc306.processEvent060_3(A0_149, A1_150, A2_151)
  A2_151:startCliantTalkTurn(2, A1_150)
  A2_151:say(A0_149, 148, 0)
  A2_151:finishCliantTalkTurn()
end
function Exc306.processEvent060_4(A0_152, A1_153, A2_154)
  A2_154:startCliantTalkTurn(2, A1_153)
  A2_154:say(A0_152, 149, 0)
  A2_154:say(A0_152, 150, 0)
  A2_154:say(A0_152, 151, 0)
  A2_154:finishCliantTalkTurn()
end
function Exc306.processEvent060_5(A0_155, A1_156, A2_157)
  A2_157:startCliantTalkTurn(2, A1_156)
  A2_157:say(A0_155, 152, 0)
  A2_157:say(A0_155, 153, 0)
  A2_157:finishCliantTalkTurn()
end
function Exc306.processEvent060_6(A0_158, A1_159, A2_160)
  A2_160:startCliantTalkTurn(2, A1_159)
  A2_160:say(A0_158, 154, 0)
  A2_160:say(A0_158, 155, 0)
  A2_160:finishCliantTalkTurn()
end
function Exc306.processEvent070_2(A0_161, A1_162, A2_163)
  A2_163:startCliantTalkTurn(2, A1_162)
  A2_163:say(A0_161, 165, 0)
  A2_163:finishCliantTalkTurn()
end
