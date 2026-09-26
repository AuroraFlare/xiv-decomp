require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Bsm200", "ScenarioBaseClass")
function Bsm200.initText(A0_0)
  A0_0:_loadTextDataPermanently(102, "bsm200")
end
function Bsm200.processEventBodenolfStart(A0_1, A1_2, A2_3, A3_4)
  local L4_5
  L4_5 = A2_3.startCliantTalkTurn
  L4_5(A2_3, 2, A1_2)
  L4_5 = A2_3.say
  L4_5(A2_3, A0_1, 1, 0)
  L4_5 = A2_3.say
  L4_5(A2_3, A0_1, 2, 0, A3_4)
  L4_5 = A2_3.say
  L4_5(A2_3, A0_1, 3, 0, A3_4)
  L4_5 = A2_3.ask
  L4_5 = L4_5(A2_3, A0_1, 30, 2, A3_4)
  if L4_5 == 1 then
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    L4_5 = A0_1:showQuestInfomation()
    if L4_5 == 1 then
      A2_3:say(A0_1, 7, 0)
      A0_1:startFadeOutCutSceneDefault(A1_2)
      A0_1:startFadeInCutSceneAfterWarp(A1_2)
    else
      A2_3:say(A0_1, 6, 0)
    end
  else
    A2_3:say(A0_1, 4, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L4_5
end
function Bsm200.processEvent005(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(1, A1_7)
  A2_8:say(A0_6, 1, 0)
  A2_8:say(A0_6, 2, 0)
  A2_8:say(A0_6, 3, 0)
  A2_8:say(A0_6, 4, 0)
  A2_8:say(A0_6, 5, 0)
  if A2_8:ask(A0_6, 33, 2) == 1 then
    A2_8:say(A0_6, 7, 0)
    A0_6:startFadeOutCutSceneDefault(A1_7)
    A0_6:startFadeInCutSceneAfterWarp(A1_7)
  else
    A2_8:say(A0_6, 6, 0)
  end
  A2_8:finishCliantTalkTurn()
  return (A2_8:ask(A0_6, 33, 2))
end
function Bsm200.processEvent010(A0_9, A1_10, A2_11, A3_12)
  A0_9:startFadeOutCutSceneDefault(A1_10)
  A0_9:startNQCutScene("bsm20010", 1, true, A3_12)
  A0_9:startFadeInCutSceneDefault(A1_10)
end
function Bsm200.processEvent020(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("bsm20020", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Bsm200.processEvent005_2(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 37, 0)
  A2_18:say(A0_16, 38, 0)
  A2_18:finishCliantTalkTurn()
end
function Bsm200.processEvent005_3(A0_19, A1_20, A2_21, A3_22)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 39, 0, A3_22)
  A2_21:finishCliantTalkTurn()
end
function Bsm200.processEvent005_4(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 40, 0)
  A2_25:finishCliantTalkTurn()
end
function Bsm200.processEvent005_5(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 41, 0)
  A2_28:say(A0_26, 42, 0)
  A2_28:finishCliantTalkTurn()
end
function Bsm200.processEvent005_6(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 43, 0)
  A2_31:say(A0_29, 44, 0)
  A2_31:finishCliantTalkTurn()
end
function Bsm200.processEvent005_7(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 45, 0)
  A2_34:say(A0_32, 46, 0)
  A2_34:finishCliantTalkTurn()
end
function Bsm200.processEvent005_8(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 47, 0)
  A2_37:say(A0_35, 48, 0)
  A2_37:finishCliantTalkTurn()
end
function Bsm200.processEvent005_9(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 49, 0)
  A2_40:say(A0_38, 50, 0)
  A2_40:finishCliantTalkTurn()
end
function Bsm200.processEvent005_10(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 51, 0)
  A2_43:say(A0_41, 52, 0)
  A2_43:finishCliantTalkTurn()
end
function Bsm200.processEvent005_11(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 53, 0)
  A2_46:say(A0_44, 54, 0)
  A2_46:finishCliantTalkTurn()
end
function Bsm200.processEvent007_2(A0_47, A1_48, A2_49, A3_50)
  A2_49:say(A0_47, 61, 0, A3_50)
end
function Bsm200.processEvent010_2(A0_51, A1_52, A2_53, A3_54)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:say(A0_51, 55, 0, A3_54)
  A2_53:say(A0_51, 56, 0, A3_54)
  A2_53:finishCliantTalkTurn()
end
function Bsm200.processEvent010_3(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 19, 0)
  A2_57:finishCliantTalkTurn()
end
function Bsm200.processEvent010_4(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 20, 0)
  A2_60:say(A0_58, 57, 0)
  A2_60:finishCliantTalkTurn()
end
function Bsm200.processEvent010_5(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 17, 0)
  A2_63:say(A0_61, 58, 0)
  A2_63:finishCliantTalkTurn()
end
function Bsm200.processEvent010_6(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 15, 0)
  A2_66:say(A0_64, 16, 0)
  A2_66:finishCliantTalkTurn()
end
function Bsm200.processEvent010_7(A0_67, A1_68, A2_69, A3_70)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 59, 0)
  A2_69:say(A0_67, 60, 0, A3_70)
  A2_69:finishCliantTalkTurn()
end
function Bsm200.processEventS010_1(A0_71, A1_72, A2_73)
  A2_73:say(A0_71, 62, 0)
  A2_73:say(A0_71, 63, 0)
  A2_73:say(A0_71, 64, 0)
end
function Bsm200.processEventS010_2(A0_74, A1_75, A2_76)
  A2_76:say(A0_74, 65, 0)
  A2_76:say(A0_74, 66, 0)
end
function Bsm200.processEventS010_3(A0_77, A1_78, A2_79)
  A2_79:say(A0_77, 67, 0)
  A2_79:say(A0_77, 68, 0)
end
function Bsm200.processEventS010_4(A0_80, A1_81, A2_82)
  A2_82:say(A0_80, 69, 0)
  A2_82:say(A0_80, 70, 0)
  A2_82:say(A0_80, 71, 0)
end
function Bsm200.processEventS010_5(A0_83, A1_84, A2_85)
  A2_85:say(A0_83, 72, 0)
  A2_85:say(A0_83, 73, 0)
end
function Bsm200.processEventS010_6(A0_86, A1_87, A2_88)
  A2_88:say(A0_86, 74, 0)
  A2_88:say(A0_86, 75, 0)
end
function Bsm200.processEventS010_7(A0_89, A1_90, A2_91)
  A2_91:say(A0_89, 76, 0)
end
function Bsm200.processEventS013_2(A0_92, A1_93, A2_94, A3_95)
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:say(A0_92, 89, 0, A3_95)
  A2_94:finishCliantTalkTurn()
end
function Bsm200.processEventS015_1(A0_96, A1_97, A2_98)
  A2_98:startCliantTalkTurn(2, A1_97)
  A2_98:say(A0_96, 77, 0)
  A2_98:say(A0_96, 78, 0)
  A2_98:finishCliantTalkTurn()
end
function Bsm200.processEventS015_2(A0_99, A1_100, A2_101)
  A2_101:startCliantTalkTurn(2, A1_100)
  A2_101:say(A0_99, 79, 0)
  A2_101:say(A0_99, 80, 0)
  A2_101:finishCliantTalkTurn()
end
function Bsm200.processEventS015_3(A0_102, A1_103, A2_104)
  A2_104:startCliantTalkTurn(2, A1_103)
  A2_104:say(A0_102, 81, 0)
  A2_104:say(A0_102, 82, 0)
  A2_104:finishCliantTalkTurn()
end
function Bsm200.processEventS015_4(A0_105, A1_106, A2_107)
  A2_107:startCliantTalkTurn(2, A1_106)
  A2_107:say(A0_105, 83, 0)
  A2_107:say(A0_105, 84, 0)
  A2_107:finishCliantTalkTurn()
end
function Bsm200.processEventS015_5(A0_108, A1_109, A2_110)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:say(A0_108, 85, 0)
  A2_110:say(A0_108, 86, 0)
  A2_110:finishCliantTalkTurn()
end
function Bsm200.processEventS015_6(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 87, 0)
  A2_113:say(A0_111, 88, 0)
  A2_113:finishCliantTalkTurn()
end
function Bsm200.processEvent018_1(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:say(A0_114, 77, 0)
  A2_116:finishCliantTalkTurn()
end
function Bsm200.processEvent018_2(A0_117, A1_118, A2_119)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:say(A0_117, 80, 0)
  A2_119:finishCliantTalkTurn()
end
function Bsm200.processEvent018_3(A0_120, A1_121, A2_122)
  A2_122:startCliantTalkTurn(2, A1_121)
  A2_122:say(A0_120, 81, 0)
  A2_122:finishCliantTalkTurn()
end
function Bsm200.processEvent018_4(A0_123, A1_124, A2_125)
  A2_125:startCliantTalkTurn(2, A1_124)
  A2_125:say(A0_123, 83, 0)
  A2_125:finishCliantTalkTurn()
end
function Bsm200.processEvent018_5(A0_126, A1_127, A2_128)
  A2_128:startCliantTalkTurn(2, A1_127)
  A2_128:say(A0_126, 85, 0)
  A2_128:finishCliantTalkTurn()
end
function Bsm200.processEvent018_6(A0_129, A1_130, A2_131)
  A2_131:startCliantTalkTurn(2, A1_130)
  A2_131:say(A0_129, 87, 0)
  A2_131:finishCliantTalkTurn()
end
