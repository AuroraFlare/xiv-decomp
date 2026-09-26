require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Alc306", "ScenarioBaseClass")
function Alc306.initText(A0_0)
  A0_0:_loadTextDataPermanently(1396, "alc306")
end
function Alc306.processEventSlyhhiaStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 6, 0)
  else
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 52, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Alc306.processEvent000(A0_4, A1_5, A2_6)
  A2_6:say(A0_4, 70, 0)
end
function Alc306.processEvent005(A0_7, A1_8, A2_9)
  if worldMaster:ask(A0_7, worldMaster, 51030, 2) == 1 then
    A2_9:say(A0_7, 12, 0)
    A0_7:runCharaSchedulerPastAreaIn(A1_8)
  else
  end
  return (worldMaster:ask(A0_7, worldMaster, 51030, 2))
end
function Alc306.processEvent008(A0_10, A1_11, A2_12)
  A2_12:say(A0_10, 13, 0)
  A2_12:say(A0_10, 14, 0)
end
function Alc306.processEvent009(A0_13, A1_14, A2_15)
  A2_15:say(A0_13, 68, 0)
end
function Alc306.processEvent009_2(A0_16, A1_17, A2_18)
  A2_18:say(A0_16, 61, 0)
end
function Alc306.processEvent010(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("alc30610", 1)
  A0_19:startNQCutScene("alc30620", 1)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Alc306.processEvent030(A0_22, A1_23, A2_24)
  A0_22:startFadeOutCutSceneDefault(A1_23)
  A0_22:startNQCutScene("alc30630", 1)
  A0_22:startFadeInCutSceneDefault(A1_23)
end
function Alc306.processEvent002_2(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 53, 0)
  A2_27:say(A0_25, 54, 0)
  A2_27:finishCliantTalkTurn()
end
function Alc306.processEvent002_3(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 55, 0)
  A2_30:say(A0_28, 56, 0)
  A2_30:finishCliantTalkTurn()
end
function Alc306.processEvent002_4(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 57, 0)
  A2_33:say(A0_31, 58, 0)
  A2_33:finishCliantTalkTurn()
end
function Alc306.processEvent002_5(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 59, 0)
  A2_36:say(A0_34, 60, 0)
  A2_36:finishCliantTalkTurn()
end
function Alc306.processEvent002_6(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 7, 0)
  A2_39:finishCliantTalkTurn()
end
function Alc306.processEvent002_7(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 8, 0)
  A2_42:finishCliantTalkTurn()
end
function Alc306.processEvent002_8(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 9, 0)
  A2_45:finishCliantTalkTurn()
end
function Alc306.processEvent002_9(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 10, 0)
  A2_48:finishCliantTalkTurn()
end
function Alc306.processEvent002_10(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 11, 0)
  A2_51:finishCliantTalkTurn()
end
function Alc306.processEvent002_11(A0_52, A1_53, A2_54)
  A2_54:say(A0_52, 12, 0)
end
function Alc306.processEvent002_12(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 6, 0)
  A2_57:finishCliantTalkTurn()
end
function Alc306.processEvent020_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 32, 0)
  A2_60:finishCliantTalkTurn()
end
function Alc306.processEvent020_3(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 33, 0)
  A2_63:finishCliantTalkTurn()
end
function Alc306.processEvent020_4(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 34, 0)
  A2_66:finishCliantTalkTurn()
end
function Alc306.processEvent020_5(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 35, 0)
  A2_69:finishCliantTalkTurn()
end
function Alc306.processEvent020_6(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 36, 0)
  A2_72:finishCliantTalkTurn()
end
function Alc306.processEvent020_7(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 62, 0)
  A2_75:say(A0_73, 63, 0)
  A2_75:finishCliantTalkTurn()
end
function Alc306.processEvent020_8(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 64, 0)
  A2_78:say(A0_76, 65, 0)
  A2_78:finishCliantTalkTurn()
end
function Alc306.processEvent020_9(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 66, 0)
  A2_81:say(A0_79, 67, 0)
  A2_81:finishCliantTalkTurn()
end
function Alc306.processEvent020_10(A0_82, A1_83, A2_84)
  A2_84:say(A0_82, 29, 0)
  A2_84:say(A0_82, 30, 0)
  A2_84:say(A0_82, 31, 0)
end
