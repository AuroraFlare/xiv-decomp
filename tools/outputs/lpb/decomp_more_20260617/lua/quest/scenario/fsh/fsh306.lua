require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Fsh306", "ScenarioBaseClass")
function Fsh306.initText(A0_0)
  A0_0:_loadTextDataPermanently(135, "fsh306")
end
function Fsh306.processEventNnmulikaStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 10, 0)
  else
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Fsh306.processEvent005_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 61, 0)
  A2_6:finishCliantTalkTurn()
end
function Fsh306.processEvent005_3(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 62, 0)
  A2_9:finishCliantTalkTurn()
end
function Fsh306.processEvent005_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 63, 0)
  A2_12:finishCliantTalkTurn()
end
function Fsh306.processEvent005_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 64, 0)
  A2_15:finishCliantTalkTurn()
end
function Fsh306.processEvent005_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 65, 0)
  A2_18:say(A0_16, 66, 0)
  A2_18:finishCliantTalkTurn()
end
function Fsh306.processEvent010(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("fsh30610", 1)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Fsh306.processEvent010_2(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 67, 0)
  A2_24:finishCliantTalkTurn()
end
function Fsh306.processEvent010_3(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 68, 0)
  A2_27:say(A0_25, 69, 0)
  A2_27:finishCliantTalkTurn()
end
function Fsh306.processEvent010_4(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 70, 0)
  A2_30:say(A0_28, 71, 0)
  A2_30:finishCliantTalkTurn()
end
function Fsh306.processEvent010_5(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 72, 0)
  A2_33:say(A0_31, 73, 0)
  A2_33:finishCliantTalkTurn()
end
function Fsh306.processEvent010_6(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 74, 0)
  A2_36:say(A0_34, 75, 0)
  A2_36:finishCliantTalkTurn()
end
function Fsh306.processEvent010_7(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 76, 0)
  A2_39:finishCliantTalkTurn()
end
function Fsh306.processEvent010_8(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 77, 0)
  A2_42:say(A0_40, 78, 0)
  A2_42:finishCliantTalkTurn()
end
function Fsh306.processEvent010_9(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 79, 0)
  A2_45:say(A0_43, 80, 0)
  A2_45:finishCliantTalkTurn()
end
function Fsh306.processEvent010_10(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 81, 0)
  A2_48:say(A0_46, 82, 0)
  A2_48:finishCliantTalkTurn()
end
function Fsh306.processEvent015(A0_49, A1_50, A2_51, A3_52)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 25, 0)
  A2_51:say(A0_49, 26, 0)
  A2_51:say(A0_49, 27, 0, A3_52)
  A2_51:finishCliantTalkTurn()
end
function Fsh306.processEvent015_2(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 102, 0)
  A2_55:finishCliantTalkTurn()
end
function Fsh306.processEvent015_3(A0_56, A1_57, A2_58, A3_59, A4_60)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 101, 0, A3_59, A4_60)
  A2_58:finishCliantTalkTurn()
end
function Fsh306.processEvent016(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 28, 0)
  A2_63:finishCliantTalkTurn()
end
function Fsh306.processEvent020(A0_64, A1_65, A2_66)
  A0_64:startFadeOutCutSceneDefault(A1_65)
  A0_64:startNQCutScene("fsh30620", 1)
  A0_64:startFadeInCutSceneAfterWarp(A1_65)
end
function Fsh306.processEvent020_2(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 83, 0)
  A2_69:finishCliantTalkTurn()
end
function Fsh306.processEvent020_3(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 84, 0)
  A2_72:finishCliantTalkTurn()
end
function Fsh306.processEvent020_4(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 85, 0)
  A2_75:say(A0_73, 86, 0)
  A2_75:finishCliantTalkTurn()
end
function Fsh306.processEvent020_5(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 87, 0)
  A2_78:say(A0_76, 88, 0)
  A2_78:finishCliantTalkTurn()
end
function Fsh306.processEvent020_6(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 89, 0)
  A2_81:say(A0_79, 90, 0)
  A2_81:finishCliantTalkTurn()
end
function Fsh306.processEvent020_7(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 91, 0)
  A2_84:say(A0_82, 100, 0)
  A2_84:finishCliantTalkTurn()
end
function Fsh306.processEvent020_8(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 92, 0)
  A2_87:say(A0_85, 93, 0)
  A2_87:finishCliantTalkTurn()
end
function Fsh306.processEvent020_9(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 94, 0)
  A2_90:say(A0_88, 95, 0)
  A2_90:finishCliantTalkTurn()
end
function Fsh306.processEvent020_10(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 96, 0)
  A2_93:say(A0_91, 97, 0)
  A2_93:finishCliantTalkTurn()
end
function Fsh306.processEvent030(A0_94, A1_95, A2_96)
  A0_94:startFadeOutCutSceneDefault(A1_95)
  A0_94:startNQCutScene("fsh30630", 1)
  A0_94:startFadeInCutSceneDefault(A1_95)
end
function Fsh306.processEvent040(A0_97, A1_98, A2_99)
  if worldMaster:ask(A0_97, worldMaster, 51030, 2) == 1 then
    A0_97:runCharaSchedulerPastAreaIn(A1_98)
    A0_97:startFadeOutCutSceneDefault(A1_98)
    A0_97:startNQCutScene("fsh30640", 1)
    A0_97:startFadeInCutSceneDefault(A1_98)
    A2_99:say(A0_97, 46, 0)
    return (worldMaster:ask(A0_97, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Fsh306.processEvent050(A0_100, A1_101, A2_102)
  if worldMaster:ask(A0_100, worldMaster, 51030, 2) == 1 then
    A0_100:runCharaSchedulerPastAreaIn(A1_101)
    A0_100:startFadeOutCutSceneDefault(A1_101)
    A0_100:startNQCutScene("fsh30650", 1)
    A0_100:startFadeInCutSceneDefault(A1_101)
    A2_102:say(A0_100, 52, 0)
    return (worldMaster:ask(A0_100, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Fsh306.processEvent050_2(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 99, 0)
  A2_105:finishCliantTalkTurn()
end
function Fsh306.processEvent060(A0_106, A1_107, A2_108)
  if worldMaster:ask(A0_106, worldMaster, 51030, 2) == 1 then
    A0_106:runCharaSchedulerPastAreaIn(A1_107)
    A0_106:startFadeOutCutSceneDefault(A1_107)
    A0_106:startNQCutScene("fsh30660", 1)
    A0_106:startFadeInCutSceneDefault(A1_107)
    A2_108:say(A0_106, 58, 0)
    return (worldMaster:ask(A0_106, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Fsh306.processEvent060_2(A0_109, A1_110, A2_111)
  A2_111:say(A0_109, 98, 0)
end
function Fsh306.processEvent070(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 59, 0)
  A2_114:say(A0_112, 60, 0)
  A2_114:finishCliantTalkTurn()
end
