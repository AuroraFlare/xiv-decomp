require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Exc300", "ScenarioBaseClass")
function Exc300.initText(A0_0)
  A0_0:_loadTextDataPermanently(117, "exc300")
end
function Exc300.processEventWaekbyrtStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  if A0_1:startNQCutScene("exc30010", 2) == 1 then
    A0_1:startFadeInCutSceneAfterWarp(A1_2)
  else
    A0_1:startFadeInCutSceneDefault(A1_2)
  end
  return (A0_1:startNQCutScene("exc30010", 2))
end
function Exc300.processEvent020(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  if A0_4:startNQCutScene("exc30020", 2) == 1 then
    A0_4:startFadeInCutSceneAfterWarp(A1_5)
  else
    A0_4:startFadeInCutSceneDefault(A1_5)
  end
  return (A0_4:startNQCutScene("exc30020", 2))
end
function Exc300.processEvent022(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 36, 0)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A1_8:_wait(3)
  A0_7:startFadeInCutSceneDefault(A1_8)
  A2_9:finishCliantTalkTurn()
  A2_9:say(A0_7, 37, 0)
  A2_9:say(A0_7, 38, 0)
  A2_9:say(A0_7, 39, 0)
end
function Exc300.processEvent025(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 40, 0)
  A2_12:_runCharaScheduler(68378624)
  A2_12:say(A0_10, 41, 0)
  A2_12:finishCliantTalkTurn()
end
function Exc300.processEvent030(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("exc30030", 1)
  A0_13:startFadeInCutSceneDefault(A1_14)
end
function Exc300.processEvent010_2(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 82, 0)
  A2_18:say(A0_16, 83, 0)
  A2_18:finishCliantTalkTurn()
end
function Exc300.processEvent010_3(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 84, 0)
  A2_21:finishCliantTalkTurn()
end
function Exc300.processEvent010_4(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 85, 0)
  A2_24:finishCliantTalkTurn()
end
function Exc300.processEvent010_5(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 86, 0)
  A2_27:say(A0_25, 87, 0)
  A2_27:finishCliantTalkTurn()
end
function Exc300.processEvent010_6(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 88, 0)
  A2_30:say(A0_28, 89, 0)
  A2_30:finishCliantTalkTurn()
end
function Exc300.processEvent010_7(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 90, 0)
  A2_33:say(A0_31, 91, 0)
  A2_33:say(A0_31, 92, 0)
  A2_33:finishCliantTalkTurn()
end
function Exc300.processEvent010_8(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 93, 0)
  A2_36:say(A0_34, 94, 0)
  A2_36:finishCliantTalkTurn()
end
function Exc300.processEvent010_9(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 95, 0)
  A2_39:say(A0_37, 96, 0)
  A2_39:finishCliantTalkTurn()
end
function Exc300.processEvent010_10(A0_40, A1_41, A2_42)
  A2_42:say(A0_40, 97, 0)
  A2_42:say(A0_40, 98, 0)
end
function Exc300.processEvent010_11(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 99, 0)
  A2_45:say(A0_43, 100, 0)
  A2_45:finishCliantTalkTurn()
end
function Exc300.processEvent010_12(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 101, 0)
  A2_48:say(A0_46, 102, 0)
  A2_48:finishCliantTalkTurn()
end
function Exc300.processEvent010_13(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 103, 0)
  A2_51:finishCliantTalkTurn()
end
function Exc300.processEvent010_14(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 104, 0)
  A2_54:finishCliantTalkTurn()
end
function Exc300.processEvent020_2(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 105, 0)
  A2_57:say(A0_55, 106, 0)
  A2_57:say(A0_55, 107, 0)
  A2_57:finishCliantTalkTurn()
end
function Exc300.processEvent020_3(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 108, 0)
  A2_60:say(A0_58, 109, 0)
  A2_60:finishCliantTalkTurn()
end
function Exc300.processEvent020_4(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 110, 0)
  A2_63:finishCliantTalkTurn()
end
function Exc300.processEvent020_5(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 111, 0)
  A2_66:say(A0_64, 112, 0)
  A2_66:finishCliantTalkTurn()
end
function Exc300.processEvent020_6(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 113, 0)
  A2_69:say(A0_67, 114, 0)
  A2_69:say(A0_67, 115, 0)
  A2_69:finishCliantTalkTurn()
end
function Exc300.processEvent020_7(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 116, 0)
  A2_72:say(A0_70, 117, 0)
  A2_72:finishCliantTalkTurn()
end
function Exc300.processEvent022_2(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 146, 0)
  A2_75:finishCliantTalkTurn()
end
function Exc300.processEvent022_3(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 120, 0)
  A2_78:say(A0_76, 121, 0)
  A2_78:finishCliantTalkTurn()
end
function Exc300.processEvent023_2(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 118, 0)
  A2_81:say(A0_79, 119, 0)
  A2_81:finishCliantTalkTurn()
end
function Exc300.processEvent023_3(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 122, 0)
  A2_84:finishCliantTalkTurn()
end
function Exc300.processEvent023_4(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 123, 0)
  A2_87:finishCliantTalkTurn()
end
function Exc300.processEvent023_5(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 124, 0)
  A2_90:say(A0_88, 125, 0)
  A2_90:finishCliantTalkTurn()
end
function Exc300.processEvent023_6(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 126, 0)
  A2_93:say(A0_91, 127, 0)
  A2_93:say(A0_91, 128, 0)
  A2_93:finishCliantTalkTurn()
end
function Exc300.processEvent023_7(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 129, 0)
  A2_96:say(A0_94, 130, 0)
  A2_96:finishCliantTalkTurn()
end
function Exc300.processEvent025_2(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 131, 0)
  A2_99:finishCliantTalkTurn()
end
function Exc300.processEvent025_3(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 132, 0)
  A2_102:finishCliantTalkTurn()
end
function Exc300.processEvent025_4(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 133, 0)
  A2_105:say(A0_103, 134, 0)
  A2_105:say(A0_103, 135, 0)
  A2_105:finishCliantTalkTurn()
end
function Exc300.processEvent025_5(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 136, 0)
  A2_108:say(A0_106, 137, 0)
  A2_108:finishCliantTalkTurn()
end
function Exc300.processEvent025_6(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 138, 0)
  A2_111:say(A0_109, 139, 0)
  A2_111:finishCliantTalkTurn()
end
function Exc300.processEvent025_7(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 140, 0)
  A2_114:say(A0_112, 141, 0)
  A2_114:finishCliantTalkTurn()
end
function Exc300.processEvent025_8(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 142, 0)
  A2_117:say(A0_115, 143, 0)
  A2_117:finishCliantTalkTurn()
end
function Exc300.processEvent025_9(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 144, 0)
  A2_120:say(A0_118, 145, 0)
  A2_120:finishCliantTalkTurn()
end
function Exc300.trialObject(A0_121, A1_122, A2_123, A3_124)
  if A3_124 == 1 then
    A2_123:say(A0_121, 147, 0)
    A2_123:say(A0_121, 148, 0)
  elseif A3_124 == 2 then
    A2_123:say(A0_121, 149, 0)
    A2_123:say(A0_121, 150, 0)
  elseif A3_124 == 3 then
    A2_123:say(A0_121, 151, 0)
    A2_123:say(A0_121, 152, 0)
  end
end
