require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Cul200", "ScenarioBaseClass")
function Cul200.initText(A0_0)
  A0_0:_loadTextDataPermanently(106, "cul200")
end
function Cul200.processEventCharlysStart(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(A2_3, 2, A1_2)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 112, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 113, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 114, 0)
  L3_4 = A2_3.ask
  L3_4 = L3_4(A2_3, A0_1, 70, 2)
  if L3_4 == 1 then
    A2_3:_runCharaScheduler(354000896)
    A2_3:say(A0_1, 1, 0)
    A2_3:say(A0_1, 2, 0)
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    L3_4 = A0_1:showQuestInfomation()
    if L3_4 == 1 then
      A2_3:say(A0_1, 8, 0)
    else
      A2_3:say(A0_1, 7, 0)
    end
  else
    A2_3:say(A0_1, 126, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Cul200.processEvent005_2(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 9, 0)
  A2_7:finishCliantTalkTurn()
end
function Cul200.processEvent005_3(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 10, 0)
  A2_10:finishCliantTalkTurn()
end
function Cul200.processEvent005_4(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:say(A0_11, 11, 0)
  A2_13:finishCliantTalkTurn()
end
function Cul200.processEvent005_5(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:say(A0_14, 12, 0)
  A2_16:finishCliantTalkTurn()
end
function Cul200.processEvent005_6(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 13, 0)
  A2_19:finishCliantTalkTurn()
end
function Cul200.processEvent005_7(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 87, 0)
  A2_22:say(A0_20, 88, 0)
  A2_22:finishCliantTalkTurn()
end
function Cul200.processEvent010(A0_23, A1_24, A2_25)
  A0_23:startFadeOutCutSceneDefault(A1_24)
  A0_23:startNQCutScene("cul20010", 1)
  A0_23:startFadeInCutSceneDefault(A1_24)
end
function Cul200.processEvent010_2(A0_26, A1_27, A2_28, A3_29)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:say(A0_26, 89, 0, A3_29)
  A2_28:say(A0_26, 90, 0, A3_29)
  A2_28:finishCliantTalkTurn()
end
function Cul200.processEvent015(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:say(A0_30, 25, 0)
  if A2_32:ask(A0_30, 100, 2) == 1 then
    A2_32:say(A0_30, 103, 0)
  else
    A2_32:say(A0_30, 115, 0)
  end
  A2_32:finishCliantTalkTurn()
  return (A2_32:ask(A0_30, 100, 2))
end
function Cul200.processEvent015_2(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:say(A0_33, 109, 0)
  A2_35:finishCliantTalkTurn()
end
function Cul200.processEvent015_3(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:say(A0_36, 108, 0)
  A2_38:finishCliantTalkTurn()
end
function Cul200.processEvent015_4(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 110, 0)
  A2_41:finishCliantTalkTurn()
end
function Cul200.processEvent015_5(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 111, 0)
  A2_44:finishCliantTalkTurn()
end
function Cul200.processEvent017(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 26, 0)
  if A2_47:ask(A0_45, 104, 2) == 1 then
    A2_47:say(A0_45, 107, 0)
  else
    A2_47:say(A0_45, 116, 0)
  end
  A2_47:finishCliantTalkTurn()
  return (A2_47:ask(A0_45, 104, 2))
end
function Cul200.processEvent020(A0_48, A1_49, A2_50, A3_51)
  A0_48:startFadeOutCutSceneDefault(A1_49)
  A0_48:startNQCutScene("cul20020", 1, A3_51)
  A0_48:startFadeInCutSceneAfterWarp(A1_49)
end
function Cul200.processEvent020_2(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 117, 0)
  A2_54:finishCliantTalkTurn()
end
function Cul200.processEvent020_3(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 118, 0)
  A2_57:finishCliantTalkTurn()
end
function Cul200.processEvent020_4(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 119, 0)
  A2_60:say(A0_58, 120, 0)
  A2_60:finishCliantTalkTurn()
end
function Cul200.processEvent020_5(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 121, 0)
  A2_63:say(A0_61, 122, 0)
  A2_63:finishCliantTalkTurn()
end
function Cul200.processEvent020_6(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 123, 0)
  A2_66:say(A0_64, 124, 0)
  A2_66:finishCliantTalkTurn()
end
function Cul200.processEvent030(A0_67, A1_68, A2_69)
  A0_67:startFadeOutCutSceneDefault(A1_68)
  A0_67:startNQCutScene("cul20030", 1)
  A0_67:startFadeInCutSceneAfterWarp(A1_68)
end
function Cul200.processEvent030_2(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 37, 0)
  A2_72:say(A0_70, 38, 0)
  A2_72:finishCliantTalkTurn()
end
function Cul200.processEvent030_3(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 91, 0)
  A2_75:say(A0_73, 92, 0)
  A2_75:finishCliantTalkTurn()
end
function Cul200.processEvent030_4(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 93, 0)
  A2_78:finishCliantTalkTurn()
end
function Cul200.processEvent030_5(A0_79, A1_80, A2_81)
  A2_81:say(A0_79, 94, 0)
  A2_81:say(A0_79, 95, 0)
end
function Cul200.processEvent030_6(A0_82, A1_83, A2_84)
  A2_84:say(A0_82, 96, 0)
end
function Cul200.processEvent030_7(A0_85, A1_86, A2_87)
  A2_87:say(A0_85, 97, 0)
end
function Cul200.processEvent030_8(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 98, 0)
  A2_90:finishCliantTalkTurn()
end
function Cul200.processEvent030_9(A0_91, A1_92, A2_93)
  A2_93:say(A0_91, 99, 0)
end
function Cul200.processEvent1000_1(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 125, 0)
  A2_96:finishCliantTalkTurn()
end
