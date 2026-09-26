require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Cnj200", "ScenarioBaseClass")
function Cnj200.initText(A0_0)
  A0_0:_loadTextDataPermanently(479, "cnj200")
end
function Cnj200.processEventSoileineStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  if A2_3:ask(A0_1, 28, 2) == 1 then
    A0_1:startFadeOutCutSceneDefault(A1_2)
    A0_1:startFadeInCutSceneDefault(A1_2)
    return (A0_1:startNQCutScene("cnj20010", 2))
  else
    A2_3:say(A0_1, 96, 0)
    A2_3:finishCliantTalkTurn()
    return
  end
end
function Cnj200.processEvent010_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 37, 0)
  A2_6:say(A0_4, 38, 0)
  A2_6:finishCliantTalkTurn()
end
function Cnj200.processEvent010_3(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 39, 0)
  A2_9:finishCliantTalkTurn()
end
function Cnj200.processEvent010_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 40, 0)
  A2_12:say(A0_10, 41, 0)
  A2_12:finishCliantTalkTurn()
end
function Cnj200.processEvent010_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 42, 0)
  A2_15:say(A0_13, 43, 0)
  A2_15:finishCliantTalkTurn()
end
function Cnj200.processEvent010_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  if A0_16:isPlayerMale(A1_17) == true then
    A2_18:say(A0_16, 44, 0)
    A2_18:say(A0_16, 45, 0)
  else
    A2_18:say(A0_16, 46, 0)
  end
  A2_18:finishCliantTalkTurn()
end
function Cnj200.processEvent010_7(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 47, 0)
  A2_21:say(A0_19, 48, 0)
  A2_21:finishCliantTalkTurn()
end
function Cnj200.processEvent010_8(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 49, 0)
  A2_24:say(A0_22, 50, 0)
  A2_24:finishCliantTalkTurn()
end
function Cnj200.processEvent010_9(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 51, 0)
  A2_27:say(A0_25, 52, 0)
  A2_27:finishCliantTalkTurn()
end
function Cnj200.processEvent010_10(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 53, 0)
  A2_30:say(A0_28, 54, 0)
  A2_30:finishCliantTalkTurn()
end
function Cnj200.processEvent010_11(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 55, 0)
  A2_33:say(A0_31, 56, 0)
  A2_33:finishCliantTalkTurn()
end
function Cnj200.processEvent015(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(1, A1_35)
  A2_36:say(A0_34, 11, 0)
  A2_36:say(A0_34, 12, 0)
  A2_36:say(A0_34, 57, 0)
  A2_36:say(A0_34, 13, 0)
  A2_36:say(A0_34, 58, 0)
  A2_36:say(A0_34, 14, 0)
  A2_36:say(A0_34, 59, 0)
  A2_36:finishCliantTalkTurn()
end
function Cnj200.processEvent015_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 60, 0)
  A2_39:say(A0_37, 61, 0)
  A2_39:say(A0_37, 62, 0)
  A2_39:finishCliantTalkTurn()
end
function Cnj200.processEvent015_3(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 63, 0)
  A2_42:say(A0_40, 64, 0)
  A2_42:finishCliantTalkTurn()
end
function Cnj200.processEvent015_4(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 65, 0)
  A2_45:finishCliantTalkTurn()
end
function Cnj200.processEvent015_5(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 66, 0)
  A2_48:say(A0_46, 67, 0)
  A2_48:finishCliantTalkTurn()
end
function Cnj200.processEvent015_6(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 68, 0)
  A2_51:say(A0_49, 69, 0)
  A2_51:finishCliantTalkTurn()
end
function Cnj200.processEvent015_7(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 70, 0)
  A2_54:say(A0_52, 71, 0)
  A2_54:finishCliantTalkTurn()
end
function Cnj200.processEvent015_8(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 72, 0)
  A2_57:say(A0_55, 73, 0)
  A2_57:finishCliantTalkTurn()
end
function Cnj200.processEvent015_9(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 74, 0)
  A2_60:say(A0_58, 75, 0)
  A2_60:finishCliantTalkTurn()
end
function Cnj200.processEvent015_10(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 76, 0)
  A2_63:say(A0_61, 77, 0)
  A2_63:finishCliantTalkTurn()
end
function Cnj200.processEvent015_11(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 78, 0)
  A2_66:say(A0_64, 79, 0)
  A2_66:finishCliantTalkTurn()
end
function Cnj200.processEvent020(A0_67, A1_68, A2_69)
  A0_67:startFadeOutCutSceneDefault(A1_68)
  A0_67:startNQCutScene("cnj20020", 1)
  A0_67:startFadeInCutSceneAfterWarp(A1_68)
end
function Cnj200.processEvent020_2(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 80, 0)
  A2_72:say(A0_70, 81, 0)
  A2_72:finishCliantTalkTurn()
end
function Cnj200.processEvent020_3(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 82, 0)
  A2_75:finishCliantTalkTurn()
end
function Cnj200.processEvent020_4(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 83, 0)
  if A0_76:isPlayerMale(A1_77) == true then
    A2_78:say(A0_76, 84, 0)
  else
    A2_78:say(A0_76, 85, 0)
  end
  A2_78:finishCliantTalkTurn()
end
function Cnj200.processEvent020_5(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 86, 0)
  A2_81:say(A0_79, 87, 0)
  A2_81:finishCliantTalkTurn()
end
function Cnj200.processEvent020_6(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 88, 0)
  A2_84:say(A0_82, 89, 0)
  A2_84:finishCliantTalkTurn()
end
function Cnj200.processEvent020_7(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 90, 0)
  A2_87:say(A0_85, 91, 0)
  A2_87:say(A0_85, 92, 0)
  A2_87:finishCliantTalkTurn()
end
function Cnj200.processEvent030(A0_88, A1_89, A2_90)
  A0_88:startFadeOutCutSceneDefault(A1_89)
  A0_88:startNQCutScene("cnj20030", 1)
  A0_88:startFadeInCutSceneDefault(A1_89)
end
function Cnj200.processEvent030_2(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 94, 0)
  A2_93:say(A0_91, 95, 0)
  A2_93:finishCliantTalkTurn()
end
function Cnj200.processEvent040(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(1, A1_95)
  A2_96:say(A0_94, 24, 0)
  A2_96:say(A0_94, 25, 0)
  A2_96:say(A0_94, 26, 0)
  A2_96:say(A0_94, 27, 0)
  A2_96:say(A0_94, 93, 0)
  A2_96:finishCliantTalkTurn()
end
