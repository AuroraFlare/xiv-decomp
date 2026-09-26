require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Wdk300", "ScenarioBaseClass")
function Wdk300.initText(A0_0)
  A0_0:_loadTextDataPermanently(435, "wdk300")
end
function Wdk300.processEventANaidjaaStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:say(A0_1, 5, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Wdk300.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("wdk30010", 1)
  A0_4:startFadeInCutSceneAfterWarp(A1_5)
end
function Wdk300.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("wdk30020", 1)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Wdk300.processEvent025_2(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 163, 0)
  A2_12:finishCliantTalkTurn()
end
function Wdk300.processEvent030(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("wdk30030", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Wdk300.processEvent040(A0_16, A1_17, A2_18)
  A0_16:startFadeOutCutSceneDefault(A1_17)
  A0_16:startNQCutScene("wdk30040", 1)
  A0_16:startFadeInCutSceneDefault(A1_17)
end
function Wdk300.processEvent050(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("wdk30050", 1)
  A0_19:startFadeInCutSceneDefault(A1_20)
end
function Wdk300.processEvent055(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 37, 0)
  A2_24:say(A0_22, 38, 0)
  A2_24:say(A0_22, 39, 0)
  A2_24:say(A0_22, 40, 0)
  A2_24:say(A0_22, 41, 0)
  if A2_24:ask(A0_22, 108, 2) == 1 then
    A2_24:say(A0_22, 42, 0)
    A2_24:say(A0_22, 43, 0)
    A2_24:say(A0_22, 44, 0)
    A2_24:say(A0_22, 45, 0)
  else
    A2_24:say(A0_22, 44, 0)
    A2_24:say(A0_22, 45, 0)
  end
  A2_24:finishCliantTalkTurn()
  return (A2_24:ask(A0_22, 108, 2))
end
function Wdk300.processEvent060(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 103, 0)
  A2_27:say(A0_25, 104, 0)
  A2_27:finishCliantTalkTurn()
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startNQCutScene("wdk30060", 1)
  A0_25:startFadeInCutSceneDefault(A1_26)
end
function Wdk300.processEvent070(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 58, 0)
  A2_30:say(A0_28, 59, 0)
  A2_30:say(A0_28, 60, 0)
  A2_30:say(A0_28, 61, 0)
  A2_30:finishCliantTalkTurn()
end
function Wdk300.processEvent005_2(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 64, 0)
  A2_33:say(A0_31, 65, 0)
  A2_33:finishCliantTalkTurn()
end
function Wdk300.processEvent005_3(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 66, 0)
  A2_36:say(A0_34, 67, 0)
  A2_36:finishCliantTalkTurn()
end
function Wdk300.processEvent005_4(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 68, 0)
  A2_39:say(A0_37, 69, 0)
  A2_39:finishCliantTalkTurn()
end
function Wdk300.processEvent005_5(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 70, 0)
  A2_42:say(A0_40, 71, 0)
  A2_42:finishCliantTalkTurn()
end
function Wdk300.processEvent005_6(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 72, 0)
  A2_45:finishCliantTalkTurn()
end
function Wdk300.processEvent005_7(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 73, 0)
  A2_48:say(A0_46, 74, 0)
  A2_48:finishCliantTalkTurn()
end
function Wdk300.processEvent005_8(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 75, 0)
  A2_51:finishCliantTalkTurn()
end
function Wdk300.processEvent005_9(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 76, 0)
  A2_54:finishCliantTalkTurn()
end
function Wdk300.processEvent005_10(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 77, 0)
  A2_57:finishCliantTalkTurn()
end
function Wdk300.processEvent005_11(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 78, 0)
  A2_60:finishCliantTalkTurn()
end
function Wdk300.processEvent005_12(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 13, 0)
  A2_63:finishCliantTalkTurn()
end
function Wdk300.processEvent005_13(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 14, 0)
  A2_66:finishCliantTalkTurn()
end
function Wdk300.processEvent040_2(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 79, 0)
  A2_69:say(A0_67, 80, 0)
  A2_69:say(A0_67, 81, 0)
  A2_69:finishCliantTalkTurn()
end
function Wdk300.processEvent040_3(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 82, 0)
  A2_72:say(A0_70, 83, 0)
  A2_72:finishCliantTalkTurn()
end
function Wdk300.processEvent040_4(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 84, 0)
  A2_75:say(A0_73, 85, 0)
  A2_75:finishCliantTalkTurn()
end
function Wdk300.processEvent040_5(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 86, 0)
  A2_78:say(A0_76, 87, 0)
  A2_78:finishCliantTalkTurn()
end
function Wdk300.processEvent040_6(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 88, 0)
  A2_81:say(A0_79, 89, 0)
  A2_81:finishCliantTalkTurn()
end
function Wdk300.processEvent040_7(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 90, 0)
  A2_84:say(A0_82, 91, 0)
  A2_84:finishCliantTalkTurn()
end
function Wdk300.processEvent050_7(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 35, 0)
  A2_87:say(A0_85, 36, 0)
  A2_87:finishCliantTalkTurn()
end
function Wdk300.processEvent050_2(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 92, 0)
  A2_90:say(A0_88, 93, 0)
  A2_90:finishCliantTalkTurn()
end
function Wdk300.processEvent050_3(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 94, 0)
  A2_93:say(A0_91, 95, 0)
  A2_93:finishCliantTalkTurn()
end
function Wdk300.processEvent050_4(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 96, 0)
  A2_96:finishCliantTalkTurn()
end
function Wdk300.processEvent050_5(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 97, 0)
  A2_99:say(A0_97, 98, 0)
  A2_99:finishCliantTalkTurn()
end
function Wdk300.processEvent050_6(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 99, 0)
  A2_102:say(A0_100, 100, 0)
  A2_102:finishCliantTalkTurn()
end
function Wdk300.processEvent055_2(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 101, 0)
  A2_105:say(A0_103, 102, 0)
  A2_105:finishCliantTalkTurn()
end
function Wdk300.processEventS000_0(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 111, 0)
  A2_108:say(A0_106, 112, 0)
  A2_108:finishCliantTalkTurn()
end
function Wdk300.processEventS000_1(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 113, 0)
  A2_111:finishCliantTalkTurn()
end
function Wdk300.processEventS000_2(A0_112, A1_113, A2_114)
  A2_114:say(A0_112, 114)
end
function Wdk300.processEventS000_3(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 115, 0)
  A2_117:say(A0_115, 116, 0)
  A2_117:finishCliantTalkTurn()
end
function Wdk300.processEventS000_4(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 117, 0)
  A2_120:finishCliantTalkTurn()
end
function Wdk300.processEventS000_5(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:say(A0_121, 118, 0)
  A2_123:finishCliantTalkTurn()
end
function Wdk300.processEventS000_6(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:say(A0_124, 119, 0)
  A2_126:finishCliantTalkTurn()
end
function Wdk300.processEventS001_1(A0_127, A1_128, A2_129)
  A2_129:startCliantTalkTurn(2, A1_128)
  A2_129:say(A0_127, 120, 0)
  A2_129:say(A0_127, 121, 0)
  A2_129:finishCliantTalkTurn()
end
function Wdk300.processEventS001_2(A0_130, A1_131, A2_132)
  A2_132:say(A0_130, 122, 0)
end
function Wdk300.processEventS001_3(A0_133, A1_134, A2_135)
  A2_135:startCliantTalkTurn(2, A1_134)
  A2_135:say(A0_133, 123, 0)
  A2_135:say(A0_133, 124, 0)
  A2_135:say(A0_133, 125, 0)
  A2_135:finishCliantTalkTurn()
end
function Wdk300.processEventS001_4(A0_136, A1_137, A2_138)
  A2_138:startCliantTalkTurn(2, A1_137)
  A2_138:say(A0_136, 126, 0)
  A2_138:say(A0_136, 127, 0)
  A2_138:finishCliantTalkTurn()
end
function Wdk300.processEventS001_5(A0_139, A1_140, A2_141)
  A2_141:startCliantTalkTurn(2, A1_140)
  A2_141:say(A0_139, 128, 0)
  if A2_141:ask(A0_139, 129, 2) == 1 then
    A2_141:say(A0_139, 128, 0)
    if A2_141:ask(A0_139, 132, 2) == 1 then
      A2_141:say(A0_139, 128, 0)
      if A2_141:ask(A0_139, 135, 2) == 1 then
        A2_141:say(A0_139, 138, 0)
        A2_141:say(A0_139, 139, 0)
        A2_141:say(A0_139, 140, 0)
        A2_141:say(A0_139, 141, 0)
        return (A2_141:ask(A0_139, 135, 2))
      else
        A2_141:say(A0_139, 128, 0)
      end
    else
      A2_141:say(A0_139, 128, 0)
    end
  else
    A2_141:say(A0_139, 128, 0)
  end
  A2_141:finishCliantTalkTurn()
end
function Wdk300.processEventS002_1(A0_142, A1_143, A2_144)
  A2_144:startCliantTalkTurn(2, A1_143)
  A2_144:say(A0_142, 142, 0)
  A2_144:finishCliantTalkTurn()
end
function Wdk300.processEventS002_2(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(2, A1_146)
  A2_147:say(A0_145, 143, 0)
  A2_147:finishCliantTalkTurn()
end
function Wdk300.processEventS002_3(A0_148, A1_149, A2_150)
  A2_150:startCliantTalkTurn(2, A1_149)
  A2_150:say(A0_148, 144, 0)
  A2_150:finishCliantTalkTurn()
end
function Wdk300.processEventS002_4(A0_151, A1_152, A2_153)
  A2_153:startCliantTalkTurn(2, A1_152)
  A2_153:say(A0_151, 145, 0)
  A2_153:finishCliantTalkTurn()
end
function Wdk300.processEventS002_5(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(2, A1_155)
  A2_156:say(A0_154, 146, 0)
  A2_156:say(A0_154, 147, 0)
  A2_156:finishCliantTalkTurn()
end
function Wdk300.processEventS002_6(A0_157, A1_158, A2_159)
  A2_159:startCliantTalkTurn(2, A1_158)
  A2_159:say(A0_157, 148, 0)
  A2_159:say(A0_157, 149, 0)
  A2_159:finishCliantTalkTurn()
end
function Wdk300.processEventS003_1(A0_160, A1_161, A2_162)
  A2_162:startCliantTalkTurn(2, A1_161)
  A2_162:say(A0_160, 150, 0)
  A2_162:say(A0_160, 151, 0)
  A2_162:finishCliantTalkTurn()
end
function Wdk300.processEventS003_2(A0_163, A1_164, A2_165)
  A2_165:say(A0_163, 152, 0)
end
function Wdk300.processEventS003_3(A0_166, A1_167, A2_168)
  A2_168:startCliantTalkTurn(2, A1_167)
  A2_168:say(A0_166, 153, 0)
  A2_168:say(A0_166, 154, 0)
  A2_168:say(A0_166, 155, 0)
  A2_168:finishCliantTalkTurn()
end
function Wdk300.processEventS003_4(A0_169, A1_170, A2_171)
  A2_171:startCliantTalkTurn(2, A1_170)
  A2_171:say(A0_169, 156, 0)
  A2_171:finishCliantTalkTurn()
end
function Wdk300.processEventS003_5(A0_172, A1_173, A2_174)
  A2_174:startCliantTalkTurn(2, A1_173)
  A2_174:say(A0_172, 157, 0)
  A2_174:say(A0_172, 158, 0)
  A2_174:finishCliantTalkTurn()
end
function Wdk300.processEventS003_6(A0_175, A1_176, A2_177)
  A2_177:startCliantTalkTurn(2, A1_176)
  A2_177:say(A0_175, 159, 0)
  A2_177:say(A0_175, 160, 0)
  A2_177:say(A0_175, 161, 0)
  A2_177:_runCharaScheduler(68378624)
  A2_177:say(A0_175, 162, 0)
  A2_177:finishCliantTalkTurn()
end
