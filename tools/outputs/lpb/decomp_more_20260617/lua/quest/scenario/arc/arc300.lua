require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Arc300", "ScenarioBaseClass")
function Arc300.initText(A0_0)
  A0_0:_loadTextDataPermanently(351, "arc300")
end
function Arc300.processEventNonolatoStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 55, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 7, 0)
  else
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Arc300.processEvent007(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 92, 0)
  A2_6:say(A0_4, 8, 0)
  A2_6:say(A0_4, 9, 0)
  A2_6:finishCliantTalkTurn()
end
function Arc300.processEvent010(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("arc30010", 1)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Arc300.processEvent015(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("arc30015", 1)
  A0_10:startFadeInCutSceneAfterWarp(A1_11)
end
function Arc300.processEvent020(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("arc30020", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Arc300.processEvent025(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(1, A1_17)
  A2_18:say(A0_16, 26, 0)
  A2_18:say(A0_16, 78, 0)
  A2_18:finishCliantTalkTurn()
end
function Arc300.processEvent025_2(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(1, A1_20)
  A2_21:say(A0_19, 79, 0)
  A2_21:say(A0_19, 80, 0)
  A2_21:finishCliantTalkTurn()
end
function Arc300.processEvent027(A0_22, A1_23, A2_24)
  A0_22:runCharaSchedulerPastAreaIn(A1_23)
  A0_22:startFadeOutCutSceneDefault(A1_23)
  A0_22:startNQCutScene("arc30025", 1)
  A0_22:startFadeInCutSceneAfterWarp(A1_23)
end
function Arc300.processEvent030(A0_25, A1_26, A2_27)
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startNQCutScene("arc30030", 1)
  A0_25:startFadeInCutSceneAfterWarp(A1_26)
end
function Arc300.processEvent040(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 90)
  A2_30:say(A0_28, 91)
  A2_30:finishCliantTalkTurn()
  if worldMaster:ask(A0_28, worldMaster, 51030, 2) == 1 then
    A0_28:runCharaSchedulerPastAreaIn(A1_29)
    A0_28:startFadeOutCutSceneDefault(A1_29)
    A0_28:startNQCutScene("arc30040", 1)
    A0_28:startFadeInCutSceneAfterWarp(A1_29)
    return (worldMaster:ask(A0_28, worldMaster, 51030, 2))
  else
    return 0
  end
end
function Arc300.processEvent050(A0_31, A1_32, A2_33)
  A0_31:startFadeOutCutSceneDefault(A1_32)
  A0_31:startNQCutScene("arc30050", 1)
  A0_31:startFadeInCutSceneDefault(A1_32)
end
function Arc300.processEvent003_2(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 56, 0)
  A2_36:say(A0_34, 57, 0)
  A2_36:finishCliantTalkTurn()
end
function Arc300.processEvent003_3(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 58, 0)
  A2_39:finishCliantTalkTurn()
end
function Arc300.processEvent003_4(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 59, 0)
  A2_42:say(A0_40, 60, 0)
  A2_42:finishCliantTalkTurn()
end
function Arc300.processEvent003_5(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 61, 0)
  A2_45:say(A0_43, 62, 0)
  A2_45:finishCliantTalkTurn()
end
function Arc300.processEvent003_6(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 63, 0)
  A2_48:finishCliantTalkTurn()
end
function Arc300.processEvent003_7(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 64, 0)
  A2_51:say(A0_49, 65, 0)
  A2_51:finishCliantTalkTurn()
end
function Arc300.processEvent003_8(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 66, 0)
  A2_54:say(A0_52, 67, 0)
  A2_54:finishCliantTalkTurn()
end
function Arc300.processEvent010_2(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 10, 0)
  A2_57:say(A0_55, 11, 0)
  A2_57:finishCliantTalkTurn()
end
function Arc300.processEvent010_3(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 68, 0)
  A2_60:finishCliantTalkTurn()
end
function Arc300.processEvent010_4(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 69, 0)
  A2_63:finishCliantTalkTurn()
end
function Arc300.processEvent010_5(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 96, 0)
  A2_66:finishCliantTalkTurn()
end
function Arc300.processEvent010_6(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 95, 0)
  A2_69:finishCliantTalkTurn()
end
function Arc300.processEvent010_7(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 97, 0)
  A2_72:finishCliantTalkTurn()
end
function Arc300.processEvent015_2(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 70, 0)
  A2_75:say(A0_73, 71, 0)
  A2_75:say(A0_73, 72, 0)
  A2_75:finishCliantTalkTurn()
end
function Arc300.processEvent015_3(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 73, 0)
  A2_78:finishCliantTalkTurn()
end
function Arc300.processEvent015_4(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 74, 0)
  A2_81:say(A0_79, 75, 0)
  A2_81:finishCliantTalkTurn()
end
function Arc300.processEvent015_5(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 50, 0)
  A2_84:say(A0_82, 76, 0)
  A2_84:finishCliantTalkTurn()
end
function Arc300.processEvent015_6(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 51, 0)
  A2_87:say(A0_85, 77, 0)
  A2_87:finishCliantTalkTurn()
end
function Arc300.processEvent015_7(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 98, 0)
  A2_90:finishCliantTalkTurn()
end
function Arc300.processEvent040_2(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 81, 0)
  A2_93:finishCliantTalkTurn()
end
function Arc300.processEvent040_3(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 82, 0)
  A2_96:say(A0_94, 83, 0)
  A2_96:finishCliantTalkTurn()
end
function Arc300.processEvent040_4(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 84, 0)
  A2_99:say(A0_97, 85, 0)
  A2_99:finishCliantTalkTurn()
end
function Arc300.processEvent040_5(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 86, 0)
  A2_102:say(A0_100, 87, 0)
  A2_102:finishCliantTalkTurn()
end
