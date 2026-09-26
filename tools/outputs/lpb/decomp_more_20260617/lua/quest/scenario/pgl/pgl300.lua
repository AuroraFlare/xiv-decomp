require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Pgl300", "ScenarioBaseClass")
function Pgl300.initText(A0_0)
  A0_0:_loadTextDataPermanently(533, "pgl300")
end
function Pgl300.processEventGagarunaStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startFadeInCutSceneDefault(A1_2)
  return (A0_1:startNQCutScene("pgl30010", 2))
end
function Pgl300.processEvent020(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("pgl30020", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Pgl300.processEvent025(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(1, A1_8)
  A2_9:finishCliantTalkTurn()
end
function Pgl300.processEvent030(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("pgl30030", 1)
  A0_10:startFadeInCutSceneDefault(A1_11)
end
function Pgl300.processEvent040(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("pgl30040", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Pgl300.processEvent050(A0_16, A1_17, A2_18)
  A0_16:startFadeOutCutSceneDefault(A1_17)
  A0_16:startNQCutScene("pgl30050", 1)
  A0_16:startFadeInCutSceneAfterWarp(A1_17)
end
function Pgl300.processEvent060(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 50)
  A2_21:say(A0_19, 51)
  A2_21:finishCliantTalkTurn()
  if worldMaster:ask(A0_19, worldMaster, 51030, 2) == 1 then
    A0_19:runCharaSchedulerPastAreaIn(A1_20)
    A0_19:startFadeOutCutSceneDefault(A1_20)
    A0_19:startNQCutScene("pgl30060", 1)
    A0_19:startFadeInCutSceneDefault(A1_20)
    return (worldMaster:ask(A0_19, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Pgl300.processEvent070(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 56)
  A2_24:finishCliantTalkTurn()
  if worldMaster:ask(A0_22, worldMaster, 51030, 2) == 1 then
    A0_22:runCharaSchedulerPastAreaIn(A1_23)
    A0_22:startFadeOutCutSceneDefault(A1_23)
    A0_22:startNQCutScene("pgl30070", 1)
    A0_22:startFadeInCutSceneDefault(A1_23)
    return (worldMaster:ask(A0_22, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Pgl300.processEvent080(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 59)
  A2_27:finishCliantTalkTurn()
  if worldMaster:ask(A0_25, worldMaster, 51030, 2) == 1 then
    A0_25:runCharaSchedulerPastAreaIn(A1_26)
    A0_25:startFadeOutCutSceneDefault(A1_26)
    A0_25:startNQCutScene("pgl30080", 1)
    A0_25:startFadeInCutSceneDefault(A1_26)
    return (worldMaster:ask(A0_25, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Pgl300.processEvent090(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(1, A1_29)
  A2_30:say(A0_28, 65)
  A2_30:finishCliantTalkTurn()
end
function Pgl300.processEvent010_2(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 80, 0)
  A2_33:say(A0_31, 81, 0)
  A2_33:say(A0_31, 82, 0)
  A2_33:finishCliantTalkTurn()
end
function Pgl300.processEvent010_3(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 83, 0)
  A2_36:say(A0_34, 84, 0)
  A2_36:finishCliantTalkTurn()
end
function Pgl300.processEvent010_4(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 85, 0)
  A2_39:say(A0_37, 86, 0)
  A2_39:finishCliantTalkTurn()
end
function Pgl300.processEvent010_5(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 87, 0)
  A2_42:say(A0_40, 88, 0)
  A2_42:finishCliantTalkTurn()
end
function Pgl300.processEvent010_6(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 89, 0)
  A2_45:say(A0_43, 90, 0)
  A2_45:finishCliantTalkTurn()
end
function Pgl300.processEvent010_7(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 91, 0)
  A2_48:say(A0_46, 92, 0)
  A2_48:finishCliantTalkTurn()
end
function Pgl300.processEvent010_8(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 93, 0)
  A2_51:say(A0_49, 94, 0)
  A2_51:finishCliantTalkTurn()
end
function Pgl300.processEvent010_9(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 108, 0)
  A2_54:say(A0_52, 109, 0)
  A2_54:finishCliantTalkTurn()
end
function Pgl300.processEvent020_2(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 23, 0)
  A2_57:say(A0_55, 95, 0)
  A2_57:finishCliantTalkTurn()
end
function Pgl300.processEvent020_3(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 96, 0)
  A2_60:finishCliantTalkTurn()
end
function Pgl300.processEvent020_4(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 97, 0)
  A2_63:finishCliantTalkTurn()
end
function Pgl300.processEvent020_5(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 98, 0)
  A2_66:finishCliantTalkTurn()
end
function Pgl300.processEvent020_6(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 99, 0)
  A2_69:finishCliantTalkTurn()
end
function Pgl300.processEvent050_2(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 47, 0)
  A2_72:say(A0_70, 48, 0)
  A2_72:say(A0_70, 49, 0)
  A2_72:finishCliantTalkTurn()
end
function Pgl300.processEvent050_3(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 100, 0)
  A2_75:say(A0_73, 101, 0)
  A2_75:finishCliantTalkTurn()
end
function Pgl300.processEvent050_4(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 102, 0)
  A2_78:say(A0_76, 103, 0)
  A2_78:finishCliantTalkTurn()
end
function Pgl300.processEvent050_5(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 104, 0)
  A2_81:say(A0_79, 105, 0)
  A2_81:finishCliantTalkTurn()
end
function Pgl300.processEvent050_6(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 106, 0)
  A2_84:say(A0_82, 107, 0)
  A2_84:finishCliantTalkTurn()
end
function Pgl300.processEvent050_7(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 56, 0)
  A2_87:finishCliantTalkTurn()
end
function Pgl300.processEvent050_8(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 59, 0)
  A2_90:finishCliantTalkTurn()
end
function Pgl300.processEvent050_9(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 50, 0)
  A2_93:say(A0_91, 51, 0)
  A2_93:finishCliantTalkTurn()
end
function Pgl300.processEvent050_10(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 110, 0)
  A2_96:finishCliantTalkTurn()
end
function Pgl300.processEvent060_2(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 56, 0)
  A2_99:finishCliantTalkTurn()
end
function Pgl300.processEvent070_2(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 59, 0)
  A2_102:finishCliantTalkTurn()
end
function Pgl300.processEvent080_2(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 111, 0)
  A2_105:say(A0_103, 112, 0)
  A2_105:finishCliantTalkTurn()
end
