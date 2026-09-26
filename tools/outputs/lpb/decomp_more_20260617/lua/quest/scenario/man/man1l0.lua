require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man1l0", "ScenarioBaseClass")
function Man1l0.initText(A0_0)
  A0_0:_loadTextDataPermanently(98, "man1l0")
end
function Man1l0.processEvent200(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startNQCutScene("man1l200", 1)
  A0_1:startFadeInCutSceneAfterWarp(A1_2)
end
function Man1l0.processEvent200_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(354172928)
  A2_6:say(A0_4, 150, 0)
  A2_6:say(A0_4, 151, 0)
  A2_6:finishCliantTalkTurn()
end
function Man1l0.processEvent200_3(A0_7, A1_8, A2_9)
  A2_9:say(A0_7, 10, 0)
end
function Man1l0.processEvent200_4(A0_10, A1_11, A2_12)
  A2_12:say(A0_10, 11, 0)
end
function Man1l0.processEvent200_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 12, 0)
  A2_15:say(A0_13, 171, 0)
  A2_15:finishCliantTalkTurn()
end
function Man1l0.processEvent200_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 13, 0)
  A2_18:say(A0_16, 172, 0)
  A2_18:finishCliantTalkTurn()
end
function Man1l0.processEvent200_7(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(1, A1_20)
  A2_21:say(A0_19, 176, 0)
  A2_21:say(A0_19, 177, 0)
  A2_21:finishCliantTalkTurn()
end
function Man1l0.processEvent200_8(A0_22, A1_23, A2_24)
  A2_24:say(A0_22, 195, -1)
end
function Man1l0.processEvent210(A0_25, A1_26, A2_27)
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startNQCutScene("man1l210", 1)
  A0_25:startFadeInCutSceneDefault(A1_26)
end
function Man1l0.processEvent215(A0_28, A1_29, A2_30)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startNQCutScene("man1l215", 1)
  A0_28:startFadeInCutSceneAfterWarp(A1_29)
end
function Man1l0.processEvent215_2(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 178, 0)
  A2_33:say(A0_31, 179, 0)
  A2_33:finishCliantTalkTurn()
end
function Man1l0.processEvent400(A0_34, A1_35, A2_36)
  A0_34:startFadeOutCutSceneDefault(A1_35)
  A0_34:startNQCutScene("man1l400", 1)
  A0_34:startFadeInCutSceneAfterWarp(A1_35)
end
function Man1l0.processEvent400_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 152, 0)
  A2_39:finishCliantTalkTurn()
end
function Man1l0.processEvent400_3(A0_40, A1_41, A2_42)
  A2_42:say(A0_40, 153, 0)
end
function Man1l0.processEvent400_4(A0_43, A1_44, A2_45)
  A2_45:say(A0_43, 154, 0)
end
function Man1l0.processEvent400_5(A0_46, A1_47, A2_48)
  A2_48:say(A0_46, 155, 0)
end
function Man1l0.processEvent400_6(A0_49, A1_50, A2_51)
  A2_51:_runCharaScheduler(67805184)
  A2_51:say(A0_49, 156, 0)
end
function Man1l0.processEvent400_7(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 157, 0)
  A2_54:say(A0_52, 158, 0)
  A2_54:finishCliantTalkTurn()
end
function Man1l0.processEvent410(A0_55, A1_56, A2_57)
  A0_55:startFadeOutCutSceneDefault(A1_56)
  A0_55:startNQCutScene("man1l410", 1)
  A0_55:startFadeInCutSceneAfterWarp(A1_56)
end
function Man1l0.processEvent410_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 47, 0)
  A2_60:finishCliantTalkTurn()
end
function Man1l0.processEvent410_3(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 48, 0)
  A2_63:finishCliantTalkTurn()
end
function Man1l0.processEvent410_4(A0_64, A1_65, A2_66)
  A2_66:_runCharaScheduler(354172928)
  A2_66:say(A0_64, 180, 0)
end
function Man1l0.processEvent410_5(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 49, 0)
  A2_69:finishCliantTalkTurn()
end
function Man1l0.processEvent420(A0_70, A1_71, A2_72)
  A0_70:startFadeOutCutSceneDefault(A1_71)
  A0_70:startNQCutScene("man1l420", 1)
  A0_70:startFadeInCutSceneAfterWarp(A1_71)
end
function Man1l0.processEvent420_2(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(1, A1_74)
  A2_75:say(A0_73, 181, 0)
  A2_75:say(A0_73, 182, 0)
  A2_75:finishCliantTalkTurn()
end
function Man1l0.processEvent600(A0_76, A1_77, A2_78)
  A0_76:startFadeOutCutSceneDefault(A1_77)
  A0_76:startNQCutScene("man1l600", 1)
  A0_76:startFadeInCutSceneDefault(A1_77)
end
function Man1l0.processEvent600_2(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  if A0_79:isPlayerMale(A1_80) == true then
    A2_81:say(A0_79, 183, 0)
    A2_81:say(A0_79, 184, 0)
  else
    A2_81:say(A0_79, 185, 0)
    A2_81:say(A0_79, 186, 0)
  end
  A2_81:finishCliantTalkTurn()
end
function Man1l0.processEvent610(A0_82, A1_83, A2_84, A3_85)
  A0_82:startFadeOutCutSceneDefault(A1_83)
  A0_82:startNQCutScene("man1l610", 1, true, A3_85)
  A0_82:startFadeInCutSceneDefault(A1_83)
end
function Man1l0.processEvent610_2(A0_86, A1_87, A2_88)
  A2_88:startCliantTalkTurn(1, A1_87)
  A2_88:say(A0_86, 187, 0)
  A2_88:say(A0_86, 188, 0)
  A2_88:finishCliantTalkTurn()
end
function Man1l0.processEvent2000(A0_89, A1_90, A2_91)
  A0_89:startFadeOutCutSceneDefault(A1_90)
  A0_89:startNQCutScene("man2l000", 1, 0, 11000002)
  A0_89:startFadeInCutSceneAfterWarp(A1_90)
end
function Man1l0.processEvent2000_2(A0_92, A1_93, A2_94)
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:say(A0_92, 159, 0)
  A2_94:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_3(A0_95, A1_96, A2_97)
  A2_97:startCliantTalkTurn(2, A1_96)
  A2_97:say(A0_95, 160, 0)
  A2_97:say(A0_95, 161, 0)
  A2_97:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_4(A0_98, A1_99, A2_100)
  A2_100:startCliantTalkTurn(2, A1_99)
  A2_100:say(A0_98, 162, 0)
  A2_100:say(A0_98, 163, 0)
  A2_100:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_5(A0_101, A1_102, A2_103)
  A2_103:startCliantTalkTurn(2, A1_102)
  A2_103:say(A0_101, 164, 0)
  A2_103:say(A0_101, 165, 0)
  A2_103:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_6(A0_104, A1_105, A2_106)
  A2_106:startCliantTalkTurn(2, A1_105)
  A2_106:say(A0_104, 166, 0)
  A2_106:say(A0_104, 167, 0)
  A2_106:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_7(A0_107, A1_108, A2_109)
  A2_109:startCliantTalkTurn(2, A1_108)
  A2_109:say(A0_107, 168, 0)
  A2_109:say(A0_107, 169, 0)
  A2_109:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_8(A0_110, A1_111, A2_112)
  A2_112:startCliantTalkTurn(2, A1_111)
  A2_112:say(A0_110, 189, 0)
  A2_112:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_9(A0_113, A1_114, A2_115)
  A2_115:startCliantTalkTurn(2, A1_114)
  A2_115:say(A0_113, 190, 0)
  A2_115:say(A0_113, 191, 0)
  A2_115:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_10(A0_116, A1_117, A2_118)
  A2_118:startCliantTalkTurn(2, A1_117)
  A2_118:say(A0_116, 170, 0)
  A2_118:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_11(A0_119, A1_120, A2_121)
  A2_121:startCliantTalkTurn(2, A1_120)
  A2_121:say(A0_119, 170, 0)
  A2_121:finishCliantTalkTurn()
end
function Man1l0.processEvent2000_12(A0_122, A1_123, A2_124)
  A2_124:startCliantTalkTurn(2, A1_123)
  A2_124:say(A0_122, 193, 0)
  A2_124:finishCliantTalkTurn()
end
function Man1l0.processEvent2001(A0_125, A1_126, A2_127)
  A0_125:startFadeOutCutSceneDefault(A1_126)
  A0_125:startNQCutScene("man2l001", 1)
  A0_125:startFadeInCutSceneAfterWarp(A1_126)
end
function Man1l0.processEvent2002(A0_128, A1_129, A2_130)
  A0_128:startFadeOutCutSceneDefault(A1_129)
  A0_128:startNQCutScene("man2l002", 1)
  A0_128:startFadeInCutSceneAfterWarp(A1_129)
end
function Man1l0.processEvent2002_2(A0_131, A1_132, A2_133)
  A2_133:startCliantTalkTurn(2, A1_132)
  A2_133:say(A0_131, 199, 0)
  A2_133:say(A0_131, 200, 0)
  A2_133:finishCliantTalkTurn()
end
function Man1l0.processEventComplete(A0_134, A1_135, A2_136)
  A2_136:startCliantTalkTurn(2, A1_135)
  A2_136:say(A0_134, 142, 0)
  A2_136:say(A0_134, 192, 0)
  A2_136:say(A0_134, 198, 0)
  A2_136:say(A0_134, 143, 0)
  A2_136:finishCliantTalkTurn()
end
function Man1l0.processEvent1000_2(A0_137, A1_138, A2_139)
  A2_139:startCliantTalkTurn(2, A1_138)
  A2_139:say(A0_137, 194, 0)
  A2_139:finishCliantTalkTurn()
end
function Man1l0.processEvent1000_3(A0_140, A1_141, A2_142)
  A2_142:startCliantTalkTurn(2, A1_141)
  A2_142:say(A0_140, 196, 0)
  A2_142:finishCliantTalkTurn()
end
function Man1l0.processEvent1000_4(A0_143, A1_144, A2_145)
  A2_145:startCliantTalkTurn(2, A1_144)
  A2_145:say(A0_143, 197, 0)
  A2_145:finishCliantTalkTurn()
end
function Man1l0.processEventTalkMenuManCutPreview(A0_146, A1_147, A2_148, A3_149)
  local L4_150
  if A3_149 == 10003 then
    L4_150 = nil
    if L4_150 == 1 then
    elseif L4_150 == 2 then
      A0_146:startFadeOutCutSceneDefault(A1_147)
      A0_146:startNQCutScene("man1l200", 1)
      A0_146:startFadeInCutSceneDefault(A1_147)
    elseif L4_150 == 3 then
      A0_146:startFadeOutCutSceneDefault(A1_147)
      A0_146:startNQCutScene("man1l210", 1)
      A0_146:startFadeInCutSceneDefault(A1_147)
    elseif L4_150 == 4 then
      A0_146:startFadeOutCutSceneDefault(A1_147)
      A0_146:startNQCutScene("man1l400", 1)
      A0_146:startFadeInCutSceneDefault(A1_147)
    elseif L4_150 == 5 then
      A0_146:startFadeOutCutSceneDefault(A1_147)
      A0_146:startNQCutScene("man1l410", 1)
      A0_146:startFadeInCutSceneDefault(A1_147)
    elseif L4_150 == 6 then
      A0_146:startFadeOutCutSceneDefault(A1_147)
      A0_146:startNQCutScene("man1l600", 1)
      A0_146:startFadeInCutSceneDefault(A1_147)
    elseif L4_150 == 7 then
      A0_146:startFadeOutCutSceneDefault(A1_147)
      A0_146:startNQCutScene("man1l610", 1)
      A0_146:startFadeInCutSceneDefault(A1_147)
    end
  end
end
