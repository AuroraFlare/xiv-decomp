require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Cnj300", "ScenarioBaseClass")
function Cnj300.initText(A0_0)
  A0_0:_loadTextDataPermanently(483, "cnj300")
end
function Cnj300.processEventSoileineStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 57, 0)
  A2_3:say(A0_1, 6, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 8, 0)
    A2_3:say(A0_1, 9, 0)
  else
    A2_3:say(A0_1, 7, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Cnj300.processEvent005_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 61, 0)
  A2_6:say(A0_4, 62, 0)
  A2_6:finishCliantTalkTurn()
end
function Cnj300.processEvent005_3(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 63, 0)
  A2_9:finishCliantTalkTurn()
end
function Cnj300.processEvent005_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 64, 0)
  A2_12:say(A0_10, 65, 0)
  A2_12:finishCliantTalkTurn()
end
function Cnj300.processEvent005_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 66, 0)
  A2_15:say(A0_13, 67, 0)
  A2_15:finishCliantTalkTurn()
end
function Cnj300.processEvent005_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 68, 0)
  if A0_16:isPlayerMale(A1_17) == true then
    A2_18:say(A0_16, 69, 0)
    A2_18:say(A0_16, 70, 0)
  else
    A2_18:say(A0_16, 71, 0)
  end
  A2_18:finishCliantTalkTurn()
end
function Cnj300.processEvent005_7(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 72, 0)
  A2_21:say(A0_19, 73, 0)
  A2_21:finishCliantTalkTurn()
end
function Cnj300.processEvent005_8(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 74, 0)
  A2_24:say(A0_22, 75, 0)
  A2_24:finishCliantTalkTurn()
end
function Cnj300.processEvent005_9(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 76, 0)
  A2_27:say(A0_25, 77, 0)
  A2_27:finishCliantTalkTurn()
end
function Cnj300.processEvent005_10(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 78, 0)
  A2_30:say(A0_28, 79, 0)
  A2_30:finishCliantTalkTurn()
  A2_30:say(A0_28, 80, 0)
end
function Cnj300.processEvent005_11(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 81, 0)
  A2_33:say(A0_31, 82, 0)
  A2_33:finishCliantTalkTurn()
end
function Cnj300.processEvent010(A0_34, A1_35, A2_36)
  A0_34:startFadeOutCutSceneDefault(A1_35)
  A0_34:startNQCutScene("cnj30010", 1)
  A0_34:startFadeInCutSceneDefault(A1_35)
end
function Cnj300.processEvent010_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 110, 0)
  A2_39:say(A0_37, 111, 0)
  A2_39:finishCliantTalkTurn()
end
function Cnj300.processEvent015_1(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 120, 0)
  A2_42:say(A0_40, 121, 0)
  A2_42:say(A0_40, 122, 0)
  A2_42:finishCliantTalkTurn()
end
function Cnj300.processEvent020(A0_43, A1_44, A2_45)
  A0_43:startFadeOutCutSceneDefault(A1_44)
  A0_43:startNQCutScene("cnj30020", 1)
  A0_43:startFadeInCutSceneAfterWarp(A1_44)
end
function Cnj300.processEvent020_2(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 83, 0)
  A2_48:say(A0_46, 84, 0)
  A2_48:finishCliantTalkTurn()
end
function Cnj300.processEvent020_3(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 85, 0)
  A2_51:say(A0_49, 86, 0)
  A2_51:finishCliantTalkTurn()
end
function Cnj300.processEvent020_4(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 112, 0)
  A2_54:finishCliantTalkTurn()
end
function Cnj300.processEvent020_5(A0_55, A1_56, A2_57)
  A2_57:say(A0_55, 113, 0)
end
function Cnj300.processEvent020_6(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 117, 0)
  A2_60:finishCliantTalkTurn()
end
function Cnj300.processEvent030(A0_61, A1_62, A2_63)
  A0_61:startFadeOutCutSceneDefault(A1_62)
  A0_61:startNQCutScene("cnj30030", 1)
  A0_61:startFadeInCutSceneDefault(A1_62)
end
function Cnj300.processEvent030_2(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 87, 0)
  A2_66:say(A0_64, 88, 0)
  A2_66:say(A0_64, 89, 0)
  A2_66:finishCliantTalkTurn()
end
function Cnj300.processEvent030_3(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 90, 0)
  A2_69:say(A0_67, 91, 0)
  A2_69:finishCliantTalkTurn()
end
function Cnj300.processEvent030_4(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 92, 0)
  A2_72:say(A0_70, 93, 0)
  A2_72:finishCliantTalkTurn()
end
function Cnj300.processEvent030_5(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 94, 0)
  A2_75:say(A0_73, 95, 0)
  A2_75:finishCliantTalkTurn()
end
function Cnj300.processEvent030_6(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 96, 0)
  A2_78:say(A0_76, 97, 0)
  A2_78:finishCliantTalkTurn()
end
function Cnj300.processEvent030_7(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 98, 0)
  A2_81:say(A0_79, 99, 0)
  A2_81:finishCliantTalkTurn()
end
function Cnj300.processEvent030_8(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 100, 0)
  A2_84:say(A0_82, 101, 0)
  A2_84:finishCliantTalkTurn()
  A2_84:say(A0_82, 102, 0)
end
function Cnj300.processEvent040(A0_85, A1_86, A2_87)
  A0_85:startFadeOutCutSceneDefault(A1_86)
  A0_85:startNQCutScene("cnj30040", 1)
  A0_85:startFadeInCutSceneAfterWarp(A1_86)
end
function Cnj300.processEvent040_1(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 123, 0)
  A2_90:finishCliantTalkTurn()
end
function Cnj300.processEvent040_2(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 124, 0)
  A2_93:finishCliantTalkTurn()
end
function Cnj300.processEvent040_3(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 125, 0)
  A2_96:finishCliantTalkTurn()
end
function Cnj300.processEvent040_4(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 126, 0)
  A2_99:finishCliantTalkTurn()
end
function Cnj300.processEvent040_5(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 127, 0)
  A2_102:finishCliantTalkTurn()
end
function Cnj300.processEvent040_6(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 128, 0)
  A2_105:finishCliantTalkTurn()
end
function Cnj300.processEvent050(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 34, 0)
  if worldMaster:ask(A0_106, worldMaster, 51030, 2) == 1 then
    A0_106:runCharaSchedulerPastAreaIn(A1_107)
    A0_106:startFadeOutCutSceneDefault(A1_107)
    A0_106:startNQCutScene("cnj30050", 2)
    A0_106:startFadeInCutSceneDefault(A1_107)
    A2_108:finishCliantTalkTurn()
    return (worldMaster:ask(A0_106, worldMaster, 51030, 2))
  else
    A2_108:say(A0_106, 129, 0)
    A2_108:finishCliantTalkTurn()
    return 0
  end
end
function Cnj300.processEvent050_1(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 130, 0)
  A2_111:finishCliantTalkTurn()
end
function Cnj300.processEvent050_2(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 103, 0)
  A2_114:say(A0_112, 104, 0)
  A2_114:finishCliantTalkTurn()
end
function Cnj300.processEvent050_3(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 105, 0)
  A2_117:finishCliantTalkTurn()
end
function Cnj300.processEvent050_4(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 106, 0)
  A2_120:say(A0_118, 107, 0)
  A2_120:finishCliantTalkTurn()
end
function Cnj300.processEvent050_5(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:say(A0_121, 108, 0)
  A2_123:say(A0_121, 109, 0)
  A2_123:finishCliantTalkTurn()
end
function Cnj300.processEvent050_6(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:say(A0_124, 118, 0)
  A2_126:say(A0_124, 119, 0)
  A2_126:finishCliantTalkTurn()
end
function Cnj300.processEvent060(A0_127, A1_128, A2_129)
  A0_127:startFadeOutCutSceneDefault(A1_128)
  A0_127:startNQCutScene("cnj30060", 1)
  A0_127:startFadeInCutSceneDefault(A1_128)
end
function Cnj300.processEvent070(A0_130, A1_131, A2_132)
  A0_130:startFadeOutCutSceneDefault(A1_131)
  A0_130:startNQCutScene("cnj30070", 1)
  A0_130:startFadeInCutSceneDefault(A1_131)
end
