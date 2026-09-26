require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gla306", "ScenarioBaseClass")
function Gla306.initText(A0_0)
  A0_0:_loadTextDataPermanently(521, "gla306")
end
function Gla306.processEventLulutsuStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 6, 0)
  else
    A2_3:say(A0_1, 5, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Gla306.processEvent003(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 7, 0)
  A2_6:say(A0_4, 8, 0)
  A2_6:say(A0_4, 9, 0)
  A2_6:say(A0_4, 10, 0)
  A2_6:finishCliantTalkTurn()
end
function Gla306.processEvent005(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 19, 0)
  if A2_9:ask(A0_7, 113, 2) == 1 then
    A2_9:say(A0_7, 20, 0)
    A2_9:say(A0_7, 21, 0)
    A2_9:finishCliantTalkTurn()
  else
  end
  A2_9:finishCliantTalkTurn()
  return (A2_9:ask(A0_7, 113, 2))
end
function Gla306.processEvent010(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("gla30610", 1)
  A0_10:startFadeInCutSceneAfterWarp(A1_11)
end
function Gla306.processEvent020(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("gla30620", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Gla306.processEvent020_999(A0_16, A1_17, A2_18)
  A0_16:startFadeOutCutSceneDefault(A1_17)
  A0_16:startNQCutScene("gla30615", 1)
  A0_16:startFadeInCutSceneAfterWarp(A1_17)
end
function Gla306.processEvent023(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 25, 0)
  A0_19:_wait(1)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 26, 0)
  A2_21:say(A0_19, 27, 0)
  A2_21:say(A0_19, 28, 0)
  A2_21:finishCliantTalkTurn()
end
function Gla306.processEvent024(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 119, 0)
  if worldMaster:ask(A0_22, worldMaster, 51030, 2) == 1 then
    A0_22:runCharaSchedulerPastAreaIn(A1_23)
  else
  end
  A2_24:finishCliantTalkTurn()
  return (worldMaster:ask(A0_22, worldMaster, 51030, 2))
end
function Gla306.processEvent025(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:finishCliantTalkTurn()
end
function Gla306.processEvent030(A0_28, A1_29, A2_30)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startNQCutScene("gla30630", 1)
  A0_28:startFadeInCutSceneAfterWarp(A1_29)
end
function Gla306.processEvent040(A0_31, A1_32, A2_33)
  A0_31:startFadeOutCutSceneDefault(A1_32)
  A0_31:startNQCutScene("gla30640", 1)
  A0_31:startFadeInCutSceneAfterWarp(A1_32)
end
function Gla306.processEvent045(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 40, 0)
  A2_36:say(A0_34, 41, 0)
  A2_36:finishCliantTalkTurn()
  if worldMaster:ask(A0_34, worldMaster, 51030, 2) == 1 then
    A0_34:runCharaSchedulerPastAreaIn(A1_35)
    A0_34:_wait(2)
    A0_34:startFadeOutCutSceneDefault(A1_35)
    A0_34:startFadeInCutSceneAfterWarp(A1_35)
  else
  end
  A2_36:finishCliantTalkTurn()
  return (worldMaster:ask(A0_34, worldMaster, 51030, 2))
end
function Gla306.processEvent050(A0_37, A1_38, A2_39)
  A0_37:startFadeOutCutSceneDefault(A1_38)
  A0_37:startNQCutScene("gla30650", 1)
  A0_37:startFadeInCutSceneAfterWarp(A1_38)
end
function Gla306.processEvent055(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 61, 0)
  A2_42:say(A0_40, 62, 0)
  A2_42:say(A0_40, 63, 0)
  A2_42:say(A0_40, 64, 0)
  A2_42:finishCliantTalkTurn()
end
function Gla306.processEvent000_1(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 69, 0)
  A2_45:say(A0_43, 70, 0)
  A2_45:finishCliantTalkTurn()
end
function Gla306.processEvent003_2(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 71, 0)
  A2_48:say(A0_46, 72, 0)
  A2_48:finishCliantTalkTurn()
end
function Gla306.processEvent003_3(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 13, 0)
  A2_51:say(A0_49, 73, 0)
  A2_51:finishCliantTalkTurn()
end
function Gla306.processEvent003_4(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 11, 0)
  A2_54:say(A0_52, 12, 0)
  A2_54:_runCharaScheduler(84008960)
  A2_54:finishCliantTalkTurn()
end
function Gla306.processEvent003_5(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 15, 0)
  A2_57:say(A0_55, 74, 0)
  A2_57:finishCliantTalkTurn()
end
function Gla306.processEvent003_6(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:_runCharaScheduler(83931136)
  A2_60:say(A0_58, 75, 0)
  A2_60:finishCliantTalkTurn()
end
function Gla306.processEvent003_7(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 16, 0)
  A2_63:say(A0_61, 76, 0)
  A2_63:finishCliantTalkTurn()
end
function Gla306.processEvent003_8(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 17, 0)
  A2_66:say(A0_64, 18, 0)
  A2_66:say(A0_64, 77, 0)
  A2_66:finishCliantTalkTurn()
end
function Gla306.processEvent003_9(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(1, A1_68)
  A2_69:_runCharaScheduler(83951616)
  A2_69:say(A0_67, 78, 0)
  A2_69:finishCliantTalkTurn()
end
function Gla306.processEvent003_10(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 14, 0)
  A2_72:say(A0_70, 79, 0)
  A2_72:finishCliantTalkTurn()
end
function Gla306.processEvent003_11(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 80, 0)
  A2_75:finishCliantTalkTurn()
end
function Gla306.processEvent003_12(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 81, 0)
  A2_78:finishCliantTalkTurn()
end
function Gla306.processEvent020_2(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 29, 0)
  A2_81:finishCliantTalkTurn()
end
function Gla306.processEvent020_3(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 30, 0)
  A2_84:finishCliantTalkTurn()
end
function Gla306.processEvent020_4(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 31, 0)
  A2_87:say(A0_85, 32, 0)
  A2_87:finishCliantTalkTurn()
end
function Gla306.processEvent023_2(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 120, 0)
  A2_90:say(A0_88, 121, 0)
  A2_90:finishCliantTalkTurn()
end
function Gla306.processEvent040_2(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 37, 0)
  A2_93:say(A0_91, 38, 0)
  A2_93:say(A0_91, 39, 0)
  A2_93:finishCliantTalkTurn()
end
function Gla306.processEvent045_2(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 42, 0)
  A2_96:finishCliantTalkTurn()
end
function Gla306.processEvent045_3(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 43, 0)
  A2_99:finishCliantTalkTurn()
end
function Gla306.processEvent045_4(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 44, 0)
  A2_102:finishCliantTalkTurn()
end
function Gla306.processEvent045_5(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 45, 0)
  A2_105:finishCliantTalkTurn()
end
function Gla306.processEvent045_6(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 46, 0)
  A2_108:finishCliantTalkTurn()
end
function Gla306.processEvent050_3(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 82, 0)
  A2_111:say(A0_109, 83, 0)
  A2_111:finishCliantTalkTurn()
end
function Gla306.processEvent050_4(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 84, 0)
  A2_114:say(A0_112, 85, 0)
  A2_114:finishCliantTalkTurn()
end
function Gla306.processEvent050_5(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 86, 0)
  A2_117:say(A0_115, 87, 0)
  A2_117:finishCliantTalkTurn()
end
function Gla306.processEvent050_6(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 88, 0)
  A2_120:say(A0_118, 89, 0)
  A2_120:finishCliantTalkTurn()
end
function Gla306.processEvent050_7(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:say(A0_121, 90, 0)
  A2_123:say(A0_121, 91, 0)
  A2_123:finishCliantTalkTurn()
end
function Gla306.processEvent050_8(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:say(A0_124, 92, 0)
  A2_126:say(A0_124, 93, 0)
  A2_126:finishCliantTalkTurn()
end
function Gla306.processEvent050_9(A0_127, A1_128, A2_129)
  A2_129:startCliantTalkTurn(2, A1_128)
  A2_129:say(A0_127, 94, 0)
  A2_129:say(A0_127, 95, 0)
  A2_129:finishCliantTalkTurn()
end
function Gla306.processEvent050_10(A0_130, A1_131, A2_132)
  A2_132:startCliantTalkTurn(2, A1_131)
  A2_132:say(A0_130, 96, 0)
  A2_132:say(A0_130, 97, 0)
  A2_132:finishCliantTalkTurn()
end
