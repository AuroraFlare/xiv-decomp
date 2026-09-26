require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Pgl306", "ScenarioBaseClass")
function Pgl306.initText(A0_0)
  A0_0:_loadTextDataPermanently(537, "pgl306")
end
function Pgl306.processEventGagarunaStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startFadeInCutSceneDefault(A1_2)
  return (A0_1:startNQCutScene("pgl30610", 2))
end
function Pgl306.processEvent020(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("pgl30620", 1)
  A0_4:startFadeInCutSceneAfterWarp(A1_5)
end
function Pgl306.processEvent030(A0_7, A1_8, A2_9)
  if worldMaster:ask(A0_7, worldMaster, 51030, 2) == 1 then
    A0_7:runCharaSchedulerPastAreaIn(A1_8)
    A0_7:startFadeOutCutSceneDefault(A1_8)
    A0_7:startNQCutScene("pgl30630", 1)
    A0_7:startFadeInCutSceneDefault(A1_8)
    return (worldMaster:ask(A0_7, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Pgl306.processEvent030_2(A0_10, A1_11, A2_12)
  if worldMaster:ask(A0_10, worldMaster, 51030, 2) == 1 then
    A0_10:runCharaSchedulerPastAreaIn(A1_11)
    A0_10:startFadeOutCutSceneDefault(A1_11)
    A0_10:startNQCutScene("pgl30630", 1)
    A0_10:startFadeInCutSceneAfterWarp(A1_11)
    return (worldMaster:ask(A0_10, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Pgl306.processEvent040(A0_13, A1_14, A2_15)
  if worldMaster:ask(A0_13, worldMaster, 51030, 2) == 1 then
    A0_13:runCharaSchedulerPastAreaIn(A1_14)
    A0_13:startFadeOutCutSceneDefault(A1_14)
    A0_13:startNQCutScene("pgl30640", 1)
    A0_13:startFadeInCutSceneDefault(A1_14)
    return (worldMaster:ask(A0_13, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Pgl306.processEvent040_2(A0_16, A1_17, A2_18)
  if worldMaster:ask(A0_16, worldMaster, 51030, 2) == 1 then
    A0_16:runCharaSchedulerPastAreaIn(A1_17)
    A0_16:startFadeOutCutSceneDefault(A1_17)
    A0_16:startNQCutScene("pgl30640", 1)
    A0_16:startFadeInCutSceneAfterWarp(A1_17)
    return (worldMaster:ask(A0_16, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Pgl306.processEvent050(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("pgl30650", 1)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Pgl306.processEvent060(A0_22, A1_23, A2_24)
  A0_22:startFadeOutCutSceneDefault(A1_23)
  A0_22:startNQCutScene("pgl30660", 1)
  A0_22:startFadeInCutSceneAfterWarp(A1_23)
end
function Pgl306.processEvent070(A0_25, A1_26, A2_27)
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startNQCutScene("pgl30670", 1)
  A0_25:startFadeInCutSceneAfterWarp(A1_26)
end
function Pgl306.processEvent080(A0_28, A1_29, A2_30)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startNQCutScene("pgl30680", 1)
  A0_28:startFadeInCutSceneDefault(A1_29)
end
function Pgl306.processEvent090(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 57, 0)
  A2_33:say(A0_31, 58, 0)
  A2_33:say(A0_31, 59, 0)
  A2_33:say(A0_31, 60, 0)
  A2_33:finishCliantTalkTurn()
end
function Pgl306.processEvent010_2(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 72, 0)
  A2_36:say(A0_34, 73, 0)
  A2_36:finishCliantTalkTurn()
end
function Pgl306.processEvent010_3(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 74, 0)
  A2_39:say(A0_37, 75, 0)
  A2_39:finishCliantTalkTurn()
end
function Pgl306.processEvent010_4(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 76, 0)
  A2_42:finishCliantTalkTurn()
end
function Pgl306.processEvent010_5(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 77, 0)
  A2_45:say(A0_43, 78, 0)
  A2_45:finishCliantTalkTurn()
end
function Pgl306.processEvent010_6(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 79, 0)
  A2_48:say(A0_46, 80, 0)
  A2_48:finishCliantTalkTurn()
end
function Pgl306.processEvent010_7(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 81, 0)
  A2_51:say(A0_49, 82, 0)
  A2_51:finishCliantTalkTurn()
end
function Pgl306.processEvent010_8(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 83, 0)
  A2_54:say(A0_52, 84, 0)
  A2_54:finishCliantTalkTurn()
end
function Pgl306.processEvent010_9(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 102, 0)
  A2_57:say(A0_55, 103, 0)
  A2_57:finishCliantTalkTurn()
end
function Pgl306.processEvent020_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 85, 0)
  A2_60:say(A0_58, 86, 0)
  A2_60:finishCliantTalkTurn()
end
function Pgl306.processEvent020_3(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 87, 0)
  A2_63:say(A0_61, 88, 0)
  A2_63:finishCliantTalkTurn()
end
function Pgl306.processEvent070_2(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 89, 0)
  A2_66:say(A0_64, 90, 0)
  A2_66:finishCliantTalkTurn()
end
function Pgl306.processEvent070_3(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 91, 0)
  A2_69:say(A0_67, 92, 0)
  A2_69:finishCliantTalkTurn()
end
function Pgl306.processEvent070_4(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 93, 0)
  A2_72:say(A0_70, 94, 0)
  A2_72:finishCliantTalkTurn()
end
function Pgl306.processEvent070_5(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 95, 0)
  A2_75:finishCliantTalkTurn()
end
function Pgl306.processEvent070_6(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 96, 0)
  A2_78:say(A0_76, 97, 0)
  A2_78:finishCliantTalkTurn()
end
function Pgl306.processEvent070_7(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 98, 0)
  A2_81:say(A0_79, 99, 0)
  A2_81:finishCliantTalkTurn()
end
function Pgl306.processEvent070_8(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 100, 0)
  A2_84:say(A0_82, 101, 0)
  A2_84:finishCliantTalkTurn()
end
