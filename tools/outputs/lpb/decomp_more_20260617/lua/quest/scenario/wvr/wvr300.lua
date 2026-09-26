require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Wvr300", "ScenarioBaseClass")
function Wvr300.initText(A0_0)
  A0_0:_loadTextDataPermanently(1258, "wvr300")
end
function Wvr300.processEventDeaustieStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  if A0_1:startNQCutScene("wvr30010", 2) == 1 then
    A0_1:startFadeInCutSceneAfterWarp(A1_2)
  else
    A0_1:startFadeInCutSceneDefault(A1_2)
  end
  return (A0_1:startNQCutScene("wvr30010", 2))
end
function Wvr300.processEvent012(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(1, A1_5)
  A2_6:say(A0_4, 17, 0)
  A2_6:say(A0_4, 18, 0)
  A2_6:say(A0_4, 19, 0)
  A2_6:say(A0_4, 20, 0)
  A2_6:say(A0_4, 21, 0)
  A2_6:say(A0_4, 22, 0)
  A2_6:say(A0_4, 23, 0)
  A2_6:finishCliantTalkTurn()
end
function Wvr300.processEvent015(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(1, A1_8)
  A2_9:say(A0_7, 24, 0)
  A2_9:say(A0_7, 25, 0)
  A2_9:say(A0_7, 26, 0)
  A2_9:say(A0_7, 55, 0)
  A2_9:finishCliantTalkTurn()
end
function Wvr300.processEvent015_1(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(1, A1_11)
  A2_12:say(A0_10, 54, 0)
  A2_12:say(A0_10, 25, 0)
  A2_12:say(A0_10, 26, 0)
  A2_12:say(A0_10, 55, 0)
  A2_12:finishCliantTalkTurn()
end
function Wvr300.processEvent018(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(84021248)
  A2_15:say(A0_13, 27, 0)
  A2_15:say(A0_13, 28, 0)
  A2_15:_runCharaScheduler(67727360)
  A2_15:say(A0_13, 69, 0)
  A2_15:finishCliantTalkTurn()
end
function Wvr300.processEvent018_2(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:_runCharaScheduler(67727360)
  A2_18:say(A0_16, 69, 0)
  A2_18:finishCliantTalkTurn()
end
function Wvr300.processEvent019(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 99, 0)
  A2_21:_runCharaScheduler(69193728)
  A2_21:say(A0_19, 100, 0)
  A2_21:say(A0_19, 101, 0)
  A2_21:finishCliantTalkTurn()
  A0_19:_wait(1)
end
function Wvr300.processEvent020(A0_22, A1_23, A2_24)
  A0_22:startFadeOutCutSceneDefault(A1_23)
  A0_22:startNQCutScene("wvr30020", 1)
  A0_22:startFadeInCutSceneAfterWarp(A1_23)
end
function Wvr300.processEvent030(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 33, 0)
  A2_27:say(A0_25, 34, 0)
  A2_27:say(A0_25, 35, 0)
  A2_27:finishCliantTalkTurn()
end
function Wvr300.processEvent010_2(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 39, 0)
  A2_30:say(A0_28, 40, 0)
  A2_30:finishCliantTalkTurn()
end
function Wvr300.processEvent010_3(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 41, 0)
  A2_33:finishCliantTalkTurn()
end
function Wvr300.processEvent010_4(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 42, 0)
  A2_36:say(A0_34, 43, 0)
  A2_36:finishCliantTalkTurn()
end
function Wvr300.processEvent010_5(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 44, 0)
  A2_39:say(A0_37, 45, 0)
  A2_39:finishCliantTalkTurn()
end
function Wvr300.processEvent010_6(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 46, 0)
  A2_42:say(A0_40, 47, 0)
  A2_42:finishCliantTalkTurn()
end
function Wvr300.processEvent010_7(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 48, 0)
  A2_45:say(A0_43, 49, 0)
  A2_45:finishCliantTalkTurn()
end
function Wvr300.processEvent010_8(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 50, 0)
  A2_48:say(A0_46, 51, 0)
  A2_48:finishCliantTalkTurn()
end
function Wvr300.processEvent012_1(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 102, 0)
  A2_51:finishCliantTalkTurn()
end
function Wvr300.processEvent012_2(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 52, 0)
  A2_54:say(A0_52, 53, 0)
  A2_54:finishCliantTalkTurn()
end
function Wvr300.processEvent015_2(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 56, 0)
  A2_57:say(A0_55, 57, 0)
  A2_57:finishCliantTalkTurn()
end
function Wvr300.processEvent015_3(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 58, 0)
  A2_60:finishCliantTalkTurn()
end
function Wvr300.processEvent015_4(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 59, 0)
  A2_63:say(A0_61, 60, 0)
  A2_63:finishCliantTalkTurn()
end
function Wvr300.processEvent015_5(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 61, 0)
  A2_66:say(A0_64, 62, 0)
  A2_66:finishCliantTalkTurn()
end
function Wvr300.processEvent015_6(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 63, 0)
  A2_69:say(A0_67, 64, 0)
  A2_69:finishCliantTalkTurn()
end
function Wvr300.processEvent015_7(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 65, 0)
  A2_72:say(A0_70, 66, 0)
  A2_72:finishCliantTalkTurn()
end
function Wvr300.processEvent015_8(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 67, 0)
  A2_75:say(A0_73, 68, 0)
  A2_75:finishCliantTalkTurn()
end
function Wvr300.processEventS001_1(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 75, 0)
  if A2_78:ask(A0_76, 70, 4) == 1 then
    A2_78:say(A0_76, 76, 0)
  elseif A2_78:ask(A0_76, 70, 4) == 2 then
    A2_78:_runCharaScheduler(354054144)
    A2_78:say(A0_76, 77, 0)
  elseif A2_78:ask(A0_76, 70, 4) == 3 then
    A2_78:_runCharaScheduler(84045824)
    A2_78:say(A0_76, 78, 0)
  else
    if A2_78:ask(A0_76, 70, 4) == 4 then
      A2_78:say(A0_76, 79, 0)
    else
    end
  end
  A2_78:finishCliantTalkTurn()
  return (A2_78:ask(A0_76, 70, 4))
end
function Wvr300.processEventS002_1(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:_runCharaScheduler(67727360)
  A2_81:say(A0_79, 80, 0)
  A2_81:finishCliantTalkTurn()
end
function Wvr300.processEventS003_1(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:_runCharaScheduler(84045824)
  A2_84:say(A0_82, 78, 0)
  A2_84:finishCliantTalkTurn()
end
function Wvr300.processEventS004_1(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 75, 0)
  A2_87:finishCliantTalkTurn()
end
function Wvr300.processEventS001_2(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 81, 0)
  if A2_90:ask(A0_88, 70, 4) == 1 then
    A2_90:_runCharaScheduler(83959808)
    A2_90:say(A0_88, 82, 0)
  elseif A2_90:ask(A0_88, 70, 4) == 2 then
    A2_90:say(A0_88, 83, 0)
  elseif A2_90:ask(A0_88, 70, 4) == 3 then
    A2_90:_runCharaScheduler(84045824)
    A2_90:say(A0_88, 84, 0)
  else
    if A2_90:ask(A0_88, 70, 4) == 4 then
      A2_90:say(A0_88, 85, 0)
    else
    end
  end
  A2_90:finishCliantTalkTurn()
  return (A2_90:ask(A0_88, 70, 4))
end
function Wvr300.processEventS002_2(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:_runCharaScheduler(83980288)
  A2_93:say(A0_91, 86, 0)
  A2_93:finishCliantTalkTurn()
end
function Wvr300.processEventS003_2(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:_runCharaScheduler(84045824)
  A2_96:say(A0_94, 84, 0)
  A2_96:finishCliantTalkTurn()
end
function Wvr300.processEventS004_2(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 81, 0)
  A2_99:finishCliantTalkTurn()
end
function Wvr300.processEventS001_3(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 87, 0)
  if A2_102:ask(A0_100, 70, 4) == 1 then
    A2_102:_runCharaScheduler(84045824)
    A2_102:say(A0_100, 88, 0)
  elseif A2_102:ask(A0_100, 70, 4) == 2 then
    A2_102:_runCharaScheduler(67723264)
    A2_102:say(A0_100, 89, 0)
  elseif A2_102:ask(A0_100, 70, 4) == 3 then
    A2_102:say(A0_100, 90, 0)
  else
    if A2_102:ask(A0_100, 70, 4) == 4 then
      A2_102:_runCharaScheduler(83890176)
      A2_102:say(A0_100, 91, 0)
    else
    end
  end
  A2_102:finishCliantTalkTurn()
  return (A2_102:ask(A0_100, 70, 4))
end
function Wvr300.processEventS002_3(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:_runCharaScheduler(69246976)
  A2_105:say(A0_103, 92, 0)
  A2_105:finishCliantTalkTurn()
end
function Wvr300.processEventS003_3(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:_runCharaScheduler(84045824)
  A2_108:say(A0_106, 88, 0)
  A2_108:finishCliantTalkTurn()
end
function Wvr300.processEventS004_3(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 87, 0)
  A2_111:finishCliantTalkTurn()
end
function Wvr300.processEventS001_4(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:_runCharaScheduler(84021248)
  A2_114:say(A0_112, 93, 0)
  if A2_114:ask(A0_112, 70, 4) == 1 then
    A2_114:_runCharaScheduler(83959808)
    A2_114:say(A0_112, 94, 0)
  elseif A2_114:ask(A0_112, 70, 4) == 2 then
    A2_114:_runCharaScheduler(84045824)
    A2_114:say(A0_112, 95, 0)
  elseif A2_114:ask(A0_112, 70, 4) == 3 then
    A2_114:say(A0_112, 96, 0)
  else
    if A2_114:ask(A0_112, 70, 4) == 4 then
      A2_114:say(A0_112, 97, 0)
    else
    end
  end
  A2_114:finishCliantTalkTurn()
  return (A2_114:ask(A0_112, 70, 4))
end
function Wvr300.processEventS002_4(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:_runCharaScheduler(84058112)
  A2_117:say(A0_115, 98, 0)
  A2_117:finishCliantTalkTurn()
end
function Wvr300.processEventS003_4(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:_runCharaScheduler(69210112)
  A2_120:say(A0_118, 95, 0)
  A2_120:finishCliantTalkTurn()
end
function Wvr300.processEventS004_4(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:_runCharaScheduler(84021248)
  A2_123:say(A0_121, 93, 0)
  A2_123:finishCliantTalkTurn()
end
