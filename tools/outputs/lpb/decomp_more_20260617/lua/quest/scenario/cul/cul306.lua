require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Cul306", "ScenarioBaseClass")
function Cul306.initText(A0_0)
  A0_0:_loadTextDataPermanently(253, "cul306")
end
function Cul306.processEvent000_2(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:finishCliantTalkTurn()
end
function Cul306.processEventPrudentiaStart(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  if A0_4:startNQCutScene("cul30610", 2) == 1 then
    A0_4:startFadeInCutSceneAfterWarp(A1_5)
  else
    A0_4:startFadeInCutSceneDefault(A1_5)
  end
  return (A0_4:startNQCutScene("cul30610", 2))
end
function Cul306.processEvent010_2(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 15, 0)
  A2_9:finishCliantTalkTurn()
end
function Cul306.processEvent010_3(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 103, 0)
  A2_12:say(A0_10, 104, 0)
  A2_12:finishCliantTalkTurn()
end
function Cul306.processEvent010_4(A0_13, A1_14, A2_15)
  A2_15:say(A0_13, 105, 0)
end
function Cul306.processEvent010_5(A0_16, A1_17, A2_18)
  A2_18:say(A0_16, 106, 0)
end
function Cul306.processEvent010_6(A0_19, A1_20, A2_21)
  A2_21:say(A0_19, 107, 0)
end
function Cul306.processEvent010_7(A0_22, A1_23, A2_24)
  A2_24:say(A0_22, 108, 0)
end
function Cul306.processEvent020(A0_25, A1_26, A2_27)
  A2_27:say(A0_25, 15, 0)
  if worldMaster:ask(A0_25, worldMaster, 51030, 2) == 1 then
    A0_25:runCharaSchedulerPastAreaIn(A1_26)
    A0_25:startNQCutScene("cul30620", 1)
    A0_25:startFadeInCutSceneDefault(A1_26)
    return (worldMaster:ask(A0_25, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Cul306.processEvent030(A0_28, A1_29, A2_30)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startNQCutScene("cul30630", 1)
  A0_28:startFadeInCutSceneAfterWarp(A1_29)
end
function Cul306.processEvent030_2(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 89, 0)
  A2_33:say(A0_31, 90, 0)
  A2_33:finishCliantTalkTurn()
end
function Cul306.processEvent030_3(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 91, 0)
  A2_36:finishCliantTalkTurn()
end
function Cul306.processEvent030_4(A0_37, A1_38, A2_39)
  A2_39:say(A0_37, 92, 0)
end
function Cul306.processEvent030_5(A0_40, A1_41, A2_42)
  A2_42:say(A0_40, 93, 0)
end
function Cul306.processEvent030_6(A0_43, A1_44, A2_45)
  A2_45:say(A0_43, 94, 0)
end
function Cul306.processEvent030_7(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 95, 0)
  A2_48:finishCliantTalkTurn()
end
function Cul306.processEvent030_8(A0_49, A1_50, A2_51)
  A2_51:say(A0_49, 96, 0)
end
function Cul306.processEvent040(A0_52, A1_53, A2_54)
  A0_52:startFadeOutCutSceneDefault(A1_53)
  A0_52:startNQCutScene("cul30640", 1)
  A0_52:startFadeInCutSceneDefault(A1_53)
end
function Cul306.processEvent040_2(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 97, 0)
  A2_57:finishCliantTalkTurn()
end
function Cul306.processEvent050(A0_58, A1_59, A2_60)
  A2_60:say(A0_58, 97, 0)
  if worldMaster:ask(A0_58, worldMaster, 51030, 2) == 1 then
    A0_58:startFadeOutCutSceneDefault(A1_59)
    A0_58:startNQCutScene("cul30650", 1)
    A0_58:startFadeInCutSceneDefault(A1_59)
    A2_60:startCliantTalkTurn(2, A1_59)
    A0_58:_wait(1)
    A2_60:say(A0_58, 32, 0)
    A2_60:say(A0_58, 33, 0)
    A2_60:say(A0_58, 34, 0)
    A2_60:say(A0_58, 35, 0)
    A0_58:_wait(2)
    A0_58:startFadeOutCutSceneDefault(A1_59)
    A0_58:startFadeInCutSceneAfterWarp(A1_59)
  end
  return (worldMaster:ask(A0_58, worldMaster, 51030, 2))
end
function Cul306.processEvent050_2(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 112, 0)
  A2_63:say(A0_61, 113, 0)
  A2_63:finishCliantTalkTurn()
  return
end
function Cul306.processEvent050_3(A0_64, A1_65, A2_66)
  A2_66:say(A0_64, 114, 0)
  return
end
function Cul306.processEvent050_4(A0_67, A1_68, A2_69)
  A2_69:say(A0_67, 115, 0)
  return
end
function Cul306.processEvent050_5(A0_70, A1_71, A2_72)
  A2_72:say(A0_70, 116, 0)
  A2_72:say(A0_70, 117, 0)
  return
end
function Cul306.processEvent050_6(A0_73, A1_74, A2_75)
  A2_75:say(A0_73, 118, 0)
  return
end
function Cul306.processEvent050_7(A0_76, A1_77, A2_78)
  A2_78:say(A0_76, 119, 0)
  return
end
function Cul306.processEvent050_8(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 120, 0)
  A2_81:finishCliantTalkTurn()
  return
end
function Cul306.processEvent060(A0_82, A1_83, A2_84)
  A0_82:startFadeOutCutSceneDefault(A1_83)
  A0_82:startNQCutScene("cul30660", 1)
  A0_82:startFadeInCutSceneAfterWarp(A1_83)
end
function Cul306.processEvent065(A0_85, A1_86, A2_87)
  A0_85:startFadeOutCutSceneDefault(A1_86)
  A0_85:startNQCutScene("cul30665", 1)
  A0_85:startFadeInCutSceneDefault(A1_86)
end
function Cul306.processEvent065_2(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 98, 0)
  A2_90:say(A0_88, 99, 0)
  A2_90:finishCliantTalkTurn()
end
function Cul306.processEvent065_3(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 100, 0)
  A2_93:say(A0_91, 101, 0)
  A2_93:finishCliantTalkTurn()
end
function Cul306.processEvent065_4(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 76, 0)
  A2_96:finishCliantTalkTurn()
end
function Cul306.processEvent065_5(A0_97, A1_98, A2_99)
  A2_99:say(A0_97, 77, 0)
end
function Cul306.processEvent065_6(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 78, 0)
  A2_102:finishCliantTalkTurn()
end
function Cul306.processEvent065_7(A0_103, A1_104, A2_105)
  A2_105:say(A0_103, 79, 0)
end
function Cul306.processEvent065_8(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 80, 0)
  A2_108:finishCliantTalkTurn()
end
function Cul306.processEvent065_9(A0_109, A1_110, A2_111)
  A2_111:say(A0_109, 102, 0)
end
function Cul306.processEvent070(A0_112, A1_113, A2_114)
  A0_112:startFadeOutCutSceneDefault(A1_113)
  A0_112:startNQCutScene("cul30670", 1)
  A0_112:startFadeInCutSceneAfterWarp(A1_113)
end
