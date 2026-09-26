require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Cnj306", "ScenarioBaseClass")
function Cnj306.initText(A0_0)
  A0_0:_loadTextDataPermanently(487, "cnj306")
end
function Cnj306.processEventSoileineStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
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
function Cnj306.processEvent005_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 53, 0)
  A2_6:say(A0_4, 54, 0)
  A2_6:finishCliantTalkTurn()
end
function Cnj306.processEvent005_3(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 55, 0)
  A2_9:finishCliantTalkTurn()
end
function Cnj306.processEvent005_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 56, 0)
  A2_12:say(A0_10, 57, 0)
  A2_12:finishCliantTalkTurn()
end
function Cnj306.processEvent005_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 58, 0)
  A2_15:say(A0_13, 59, 0)
  A2_15:finishCliantTalkTurn()
end
function Cnj306.processEvent005_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 60, 0)
  if A0_16:isPlayerMale(A1_17) == true then
    A2_18:say(A0_16, 61, 0)
  else
    A2_18:say(A0_16, 62, 0)
  end
  A2_18:finishCliantTalkTurn()
end
function Cnj306.processEvent005_7(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 63, 0)
  A2_21:say(A0_19, 64, 0)
  A2_21:finishCliantTalkTurn()
end
function Cnj306.processEvent005_8(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 65, 0)
  A2_24:say(A0_22, 66, 0)
  A2_24:finishCliantTalkTurn()
end
function Cnj306.processEvent005_9(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 67, 0)
  A2_27:say(A0_25, 68, 0)
  A2_27:finishCliantTalkTurn()
end
function Cnj306.processEvent005_10(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 69, 0)
  A2_30:say(A0_28, 70, 0)
  A2_30:finishCliantTalkTurn()
end
function Cnj306.processEvent005_11(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 71, 0)
  A2_33:say(A0_31, 72, 0)
  A2_33:finishCliantTalkTurn()
end
function Cnj306.processEvent005_12(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 15, 0)
  A2_36:say(A0_34, 73, 0)
  A2_36:finishCliantTalkTurn()
end
function Cnj306.processEvent010(A0_37, A1_38, A2_39)
  A0_37:startFadeOutCutSceneDefault(A1_38)
  A0_37:startNQCutScene("cnj30610", 1)
  A0_37:startFadeInCutSceneDefault(A1_38)
end
function Cnj306.processEvent010_2(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 74, 0)
  A2_42:say(A0_40, 75, 0)
  A2_42:say(A0_40, 76, 0)
  A2_42:finishCliantTalkTurn()
end
function Cnj306.processEvent010_3(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 77, 0)
  A2_45:say(A0_43, 78, 0)
  A2_45:finishCliantTalkTurn()
end
function Cnj306.processEvent010_4(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 16, 0)
  A2_48:say(A0_46, 79, 0)
  A2_48:finishCliantTalkTurn()
end
function Cnj306.processEvent020(A0_49, A1_50, A2_51)
  A0_49:startFadeOutCutSceneDefault(A1_50)
  A0_49:startNQCutScene("cnj30620", 1)
  A0_49:startFadeInCutSceneDefault(A1_50)
end
function Cnj306.processEvent025(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 21, 0)
  if A2_54:ask(A0_52, 50, 2) == 1 then
    A2_54:say(A0_52, 22, 0)
  else
    A2_54:say(A0_52, 101, 0)
  end
  A2_54:finishCliantTalkTurn()
  return (A2_54:ask(A0_52, 50, 2))
end
function Cnj306.processEvent030(A0_55, A1_56, A2_57)
  A0_55:startFadeOutCutSceneDefault(A1_56)
  A0_55:startNQCutScene("cnj30630", 1)
  A0_55:startFadeInCutSceneDefault(A1_56)
end
function Cnj306.processEvent030_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 80, 0)
  A2_60:say(A0_58, 81, 0)
  A2_60:finishCliantTalkTurn()
end
function Cnj306.processEvent030_3(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 82, 0)
  A2_63:say(A0_61, 83, 0)
  A2_63:finishCliantTalkTurn()
end
function Cnj306.processEvent040(A0_64, A1_65, A2_66)
  A0_64:startFadeOutCutSceneDefault(A1_65)
  A0_64:startNQCutScene("cnj30640", 1)
  A0_64:startFadeInCutSceneAfterWarp(A1_65)
end
function Cnj306.processEvent045(A0_67, A1_68, A2_69)
  if worldMaster:ask(A0_67, worldMaster, 51030, 2) == 1 then
    A0_67:runCharaSchedulerPastAreaIn(A1_68)
    return (worldMaster:ask(A0_67, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Cnj306.processEvent050(A0_70, A1_71, A2_72)
  A0_70:startFadeOutCutSceneDefault(A1_71)
  A0_70:startNQCutScene("cnj30650", 1)
  A0_70:startFadeInCutSceneAfterWarp(A1_71)
end
function Cnj306.processEvent060(A0_73, A1_74, A2_75)
  A0_73:startFadeOutCutSceneDefault(A1_74)
  A0_73:startNQCutScene("cnj30660", 1)
  A0_73:startFadeInCutSceneAfterWarp(A1_74)
end
function Cnj306.processEvent070(A0_76, A1_77, A2_78)
  A0_76:startFadeOutCutSceneDefault(A1_77)
  A0_76:startNQCutScene("cnj30670", 1)
  A0_76:startFadeInCutSceneAfterWarp(A1_77)
end
function Cnj306.processEvent070_2(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 84, 0)
  A2_81:finishCliantTalkTurn()
end
function Cnj306.processEvent070_3(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 85, 0)
  A2_84:say(A0_82, 86, 0)
  A2_84:finishCliantTalkTurn()
end
function Cnj306.processEvent070_4(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 87, 0)
  A2_87:say(A0_85, 88, 0)
  A2_87:finishCliantTalkTurn()
end
function Cnj306.processEvent070_5(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 89, 0)
  A2_90:say(A0_88, 90, 0)
  A2_90:finishCliantTalkTurn()
end
function Cnj306.processEvent070_6(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 91, 0)
  A2_93:say(A0_91, 92, 0)
  A2_93:finishCliantTalkTurn()
end
function Cnj306.processEvent070_7(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 93, 0)
  A2_96:say(A0_94, 94, 0)
  A2_96:finishCliantTalkTurn()
end
function Cnj306.processEvent070_8(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 95, 0)
  A2_99:say(A0_97, 96, 0)
  A2_99:finishCliantTalkTurn()
end
function Cnj306.processEvent070_9(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 97, 0)
  A2_102:say(A0_100, 98, 0)
  A2_102:finishCliantTalkTurn()
end
function Cnj306.processEvent070_10(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 99, 0)
  A2_105:say(A0_103, 100, 0)
  A2_105:finishCliantTalkTurn()
end
function Cnj306.processEvent080(A0_106, A1_107, A2_108)
  A0_106:startFadeOutCutSceneDefault(A1_107)
  A0_106:startNQCutScene("cnj30680", 1)
  A0_106:startFadeInCutSceneDefault(A1_107)
end
function Cnj306.processEvent090(A0_109, A1_110, A2_111)
  A0_109:startFadeOutCutSceneDefault(A1_110)
  A0_109:startNQCutScene("cnj30690", 1)
  A0_109:startFadeInCutSceneAfterWarp(A1_110)
end
function Cnj306.processEvent095(A0_112, A1_113, A2_114)
  A0_112:startFadeOutCutSceneDefault(A1_113)
  A0_112:startNQCutScene("cnj30690", 1)
  A0_112:startFadeInCutSceneDefault(A1_113)
end
