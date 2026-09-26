require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man206", "ScenarioBaseClass")
function Man206.initText(A0_0)
  A0_0:_loadTextDataPermanently(1570, "man206")
end
function Man206.processEventUdowntownrectStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startNQCutScene("man20600", 1)
  A0_1:startFadeInCutSceneAfterWarp(A1_2)
end
function Man206.processEvent000_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 270, 0)
  A2_6:say(A0_4, 271, 0)
  A2_6:finishCliantTalkTurn()
end
function Man206.processEvent000_3(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 272, 0)
  A2_9:say(A0_7, 273, 0)
  A2_9:finishCliantTalkTurn()
end
function Man206.processEvent000_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 274, 0)
  A2_12:finishCliantTalkTurn()
end
function Man206.processEvent000_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 275, 0)
  A2_15:say(A0_13, 276, 0)
  A2_15:finishCliantTalkTurn()
end
function Man206.processEvent000_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 277, 0)
  A2_18:finishCliantTalkTurn()
end
function Man206.processEvent000_7(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 278, 0)
  A2_21:finishCliantTalkTurn()
end
function Man206.processEvent000_8(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 279, 0)
  A2_24:finishCliantTalkTurn()
end
function Man206.processEvent000_9(A0_25, A1_26, A2_27)
  A2_27:say(A0_25, 280, 0)
end
function Man206.processEvent000_10(A0_28, A1_29, A2_30)
  A2_30:say(A0_28, 281, 0)
end
function Man206.processEvent000_11(A0_31, A1_32, A2_33)
  A2_33:say(A0_31, 329, 0)
end
function Man206.processEvent001(A0_34, A1_35, A2_36)
  A0_34:startFadeOutCutSceneDefault(A1_35)
  if A0_34:startNQCutScene("man20601", 2) == 1 then
    A0_34:startFadeInCutSceneAfterWarp(A1_35)
  else
    A0_34:startFadeInCutSceneDefault(A1_35)
  end
  return (A0_34:startNQCutScene("man20601", 2))
end
function Man206.processEvent001_2(A0_37, A1_38, A2_39, A3_40, A4_41)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 282, 0)
  A2_39:say(A0_37, 283, 0, A3_40, A4_41)
  A2_39:finishCliantTalkTurn()
end
function Man206.processEvent001_3(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 284, 0)
  A2_44:say(A0_42, 285, 0)
  A2_44:finishCliantTalkTurn()
end
function Man206.processEvent001_4(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 286, 0)
  A2_47:say(A0_45, 287, 0)
  A2_47:finishCliantTalkTurn()
end
function Man206.processEvent001_5(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:say(A0_48, 288, 0)
  A2_50:say(A0_48, 289, 0)
  A2_50:finishCliantTalkTurn()
end
function Man206.processEvent001_6(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:say(A0_51, 290, 0)
  A2_53:say(A0_51, 291, 0)
  A2_53:finishCliantTalkTurn()
end
function Man206.processEvent001_7(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(2, A1_55)
  A2_56:say(A0_54, 292, 0)
  A2_56:say(A0_54, 293, 0)
  A2_56:finishCliantTalkTurn()
end
function Man206.processEvent001_8(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:say(A0_57, 22, 0)
  A2_59:say(A0_57, 294, 0)
  A2_59:finishCliantTalkTurn()
end
function Man206.processEvent001_9(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:say(A0_60, 23, 0)
  A2_62:finishCliantTalkTurn()
end
function Man206.processEvent001_10(A0_63, A1_64, A2_65)
  A2_65:startCliantTalkTurn(2, A1_64)
  A2_65:say(A0_63, 24, 0)
  A2_65:say(A0_63, 295, 0)
  A2_65:finishCliantTalkTurn()
end
function Man206.processEvent001_11(A0_66, A1_67, A2_68)
  A2_68:startCliantTalkTurn(2, A1_67)
  A2_68:say(A0_66, 25, 0)
  A2_68:say(A0_66, 296, 0)
  A2_68:say(A0_66, 297, 0)
  A2_68:finishCliantTalkTurn()
end
function Man206.processEvent010_2(A0_69, A1_70, A2_71, A3_72, A4_73)
  A2_71:startCliantTalkTurn(2, A1_70)
  A2_71:say(A0_69, 305, 0, A3_72, A4_73)
  A2_71:say(A0_69, 306, 0)
  A2_71:finishCliantTalkTurn()
end
function Man206.pE12(A0_74, A1_75, A2_76, A3_77, A4_78, A5_79, A6_80, A7_81)
  A4_78 = A0_74:getSnpcActorClassID(A4_78)
  A0_74:startFadeOutCutSceneDefault(A1_75)
  A0_74:startSnpcNQCutScene("man20602", 1, A3_77, A4_78, A5_79, A6_80, A7_81)
  A0_74:startFadeInCutSceneDefault(A1_75)
end
function Man206.processEvent012_2(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 528, 0)
  A2_84:say(A0_82, 529, 0)
  A2_84:say(A0_82, 26, 0)
  A2_84:finishCliantTalkTurn()
end
function Man206.processEvent012_3(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 298, 0)
  A2_87:say(A0_85, 299, 0)
  A2_87:finishCliantTalkTurn()
end
function Man206.processEvent012_4(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 300, 0)
  A2_90:say(A0_88, 301, 0)
  A2_90:finishCliantTalkTurn()
end
function Man206.processEvent012_5(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 302, 0)
  A2_93:finishCliantTalkTurn()
end
function Man206.processEvent012_6(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 303, 0)
  A2_96:finishCliantTalkTurn()
end
function Man206.processEvent012_7(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 304, 0)
  A2_99:finishCliantTalkTurn()
end
function Man206.pE13(A0_100, A1_101, A2_102, A3_103, A4_104, A5_105, A6_106, A7_107)
  A4_104 = A0_100:getSnpcActorClassID(A4_104)
  A0_100:startFadeOutCutSceneDefault(A1_101)
  if A0_100:startSnpcNQCutScene("man20603", 2, A3_103, A4_104, A5_105, A6_106, A7_107) == 1 then
    A0_100:startFadeInCutSceneAfterWarp(A1_101)
    return (A0_100:startSnpcNQCutScene("man20603", 2, A3_103, A4_104, A5_105, A6_106, A7_107))
  else
    A0_100:startFadeInCutSceneDefault(A1_101)
    return (A0_100:startSnpcNQCutScene("man20603", 2, A3_103, A4_104, A5_105, A6_106, A7_107))
  end
end
function Man206.processEvent016(A0_108, A1_109, A2_110)
  A0_108:startFadeOutCutSceneDefault(A1_109)
  A0_108:startHQCutScene("MAN20610", 1)
  A0_108:startFadeInCutSceneDefault(A1_109)
end
function Man206.processEvent016_1(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 539, 0)
  A2_113:finishCliantTalkTurn()
end
function Man206.processEvent016_2(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:say(A0_114, 540, 0)
  A2_116:finishCliantTalkTurn()
end
function Man206.processEvent016_3(A0_117, A1_118, A2_119)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:say(A0_117, 541, 0)
  A2_119:finishCliantTalkTurn()
end
function Man206.pE20(A0_120, A1_121, A2_122, A3_123, A4_124, A5_125, A6_126, A7_127)
  A4_124 = A0_120:getSnpcActorClassID(A4_124)
  A0_120:startFadeOutCutSceneDefault(A1_121)
  A0_120:startSnpcNQCutScene("man20620", 1, A3_123, A4_124, A5_125, A6_126, A7_127)
  A0_120:startFadeInCutSceneDefault(A1_121)
end
function Man206.processEvent020_2(A0_128, A1_129, A2_130)
  A2_130:startCliantTalkTurn(2, A1_129)
  A2_130:say(A0_128, 571, 0)
  A2_130:finishCliantTalkTurn()
end
function Man206.pE30(A0_131, A1_132, A2_133, A3_134, A4_135, A5_136, A6_137, A7_138)
  A4_135 = A0_131:getSnpcActorClassID(A4_135)
  A0_131:startFadeOutCutSceneDefault(A1_132)
  A0_131:startSnpcNQCutScene("man20630", 1, A3_134, A4_135, A5_136, A6_137, A7_138)
  A0_131:startFadeInCutSceneAfterWarp(A1_132)
end
function Man206.processEvent030_2(A0_139, A1_140, A2_141)
  A2_141:startCliantTalkTurn(2, A1_140)
  A2_141:say(A0_139, 308, 0)
  A2_141:finishCliantTalkTurn()
end
function Man206.processEvent030_3(A0_142, A1_143, A2_144)
  A2_144:startCliantTalkTurn(2, A1_143)
  A2_144:say(A0_142, 309, 0)
  A2_144:say(A0_142, 310, 0)
  A2_144:finishCliantTalkTurn()
end
function Man206.processEvent030_4(A0_145, A1_146, A2_147)
  A2_147:startCliantTalkTurn(2, A1_146)
  A2_147:say(A0_145, 311, 0)
  A2_147:say(A0_145, 312, 0)
  A2_147:finishCliantTalkTurn()
end
function Man206.processEvent030_5(A0_148, A1_149, A2_150)
  A2_150:startCliantTalkTurn(2, A1_149)
  A2_150:say(A0_148, 313, 0)
  A2_150:say(A0_148, 314, 0)
  A2_150:finishCliantTalkTurn()
end
function Man206.processEvent030_6(A0_151, A1_152, A2_153)
  A2_153:startCliantTalkTurn(2, A1_152)
  A2_153:say(A0_151, 315, 0)
  A2_153:say(A0_151, 316, 0)
  A2_153:finishCliantTalkTurn()
end
function Man206.processEvent030_7(A0_154, A1_155, A2_156)
  A2_156:startCliantTalkTurn(2, A1_155)
  A2_156:say(A0_154, 317, 0)
  A2_156:say(A0_154, 318, 0)
  A2_156:finishCliantTalkTurn()
end
function Man206.processEvent030_8(A0_157, A1_158, A2_159)
  A2_159:startCliantTalkTurn(2, A1_158)
  A2_159:say(A0_157, 319, 0)
  A2_159:say(A0_157, 320, 0)
  A2_159:finishCliantTalkTurn()
end
function Man206.processEvent040(A0_160, A1_161, A2_162)
  A0_160:startFadeOutCutSceneDefault(A1_161)
  A0_160:startNQCutScene("man20640", 1)
  A0_160:startFadeInCutSceneAfterWarp(A1_161)
end
