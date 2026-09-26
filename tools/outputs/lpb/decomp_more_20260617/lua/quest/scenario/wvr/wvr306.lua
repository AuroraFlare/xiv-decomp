require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Wvr306", "ScenarioBaseClass")
function Wvr306.initText(A0_0)
  A0_0:_loadTextDataPermanently(1268, "wvr306")
end
function Wvr306.processEventDeaustieStart(A0_1, A1_2, A2_3)
  local L3_4, L4_5
  L4_5 = A2_3
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(L4_5, 1, A1_2)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 3, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 4, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 5, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 6, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 7, 0)
  L4_5 = A2_3
  L3_4 = A2_3.say
  L3_4(L4_5, A0_1, 8, 0)
  L4_5 = A0_1
  L3_4 = A0_1.showQuestInfomation
  L3_4 = L3_4(L4_5)
  if L3_4 == 1 then
    L4_5 = 10
    A2_3:say(A0_1, 10, 0, L4_5)
  else
    L4_5 = A2_3.say
    L4_5(A2_3, A0_1, 9, 0)
  end
  L4_5 = A2_3.finishCliantTalkTurn
  L4_5(A2_3)
  return L3_4
end
function Wvr306.processEvent008(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(1, A1_7)
  A2_8:say(A0_6, 84, 0)
  A2_8:say(A0_6, 85, 0)
  A2_8:finishCliantTalkTurn()
end
function Wvr306.processEvent008_2(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(1, A1_10)
  A2_11:say(A0_9, 84, 0)
  A2_11:say(A0_9, 85, 0)
  A2_11:finishCliantTalkTurn()
end
function Wvr306.processEvent010(A0_12, A1_13, A2_14)
  A0_12:startFadeOutCutSceneDefault(A1_13)
  A0_12:startNQCutScene("wvr30610", 1)
  A0_12:startFadeInCutSceneDefault(A1_13)
end
function Wvr306.processEvent020(A0_15, A1_16, A2_17)
  A0_15:startFadeOutCutSceneDefault(A1_16)
  A0_15:startNQCutScene("wvr30620", 1)
  A0_15:startFadeInCutSceneDefault(A1_16)
end
function Wvr306.processEvent030(A0_18, A1_19, A2_20)
  A0_18:startFadeOutCutSceneDefault(A1_19)
  A0_18:startNQCutScene("wvr30630", 1)
  A0_18:startFadeInCutSceneDefault(A1_19)
end
function Wvr306.processEvent005_2(A0_21, A1_22, A2_23)
  local L3_24
  L3_24 = A2_23.startCliantTalkTurn
  L3_24(A2_23, 2, A1_22)
  L3_24 = A2_23.say
  L3_24(A2_23, A0_21, 54, 0)
  L3_24 = A2_23.say
  L3_24(A2_23, A0_21, 55, 0)
  L3_24 = 10
  A2_23:say(A0_21, 56, 0, L3_24)
  A2_23:finishCliantTalkTurn()
end
function Wvr306.processEvent005_3(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 57, 0)
  A2_27:finishCliantTalkTurn()
end
function Wvr306.processEvent005_4(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 58, 0)
  A2_30:finishCliantTalkTurn()
end
function Wvr306.processEvent005_5(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 59, 0)
  A2_33:say(A0_31, 60, 0)
  A2_33:finishCliantTalkTurn()
end
function Wvr306.processEvent005_6(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 61, 0)
  A2_36:say(A0_34, 62, 0)
  A2_36:finishCliantTalkTurn()
end
function Wvr306.processEvent005_7(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 63, 0)
  A2_39:say(A0_37, 64, 0)
  A2_39:finishCliantTalkTurn()
end
function Wvr306.processEvent005_8(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 65, 0)
  A2_42:say(A0_40, 66, 0)
  A2_42:finishCliantTalkTurn()
end
function Wvr306.processEvent010_2(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 67, 0)
  A2_45:say(A0_43, 68, 0)
  A2_45:say(A0_43, 69, 0)
  A2_45:finishCliantTalkTurn()
end
function Wvr306.processEvent010_3(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 70, 0)
  A2_48:finishCliantTalkTurn()
end
function Wvr306.processEvent010_4(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 71, 0)
  A2_51:finishCliantTalkTurn()
end
function Wvr306.processEvent010_5(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 72, 0)
  A2_54:say(A0_52, 73, 0)
  A2_54:finishCliantTalkTurn()
end
function Wvr306.processEvent010_6(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 74, 0)
  A2_57:say(A0_55, 83, 0)
  A2_57:finishCliantTalkTurn()
end
function Wvr306.processEvent010_7(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 75, 0)
  A2_60:say(A0_58, 76, 0)
  A2_60:finishCliantTalkTurn()
end
function Wvr306.processEvent010_8(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 77, 0)
  A2_63:say(A0_61, 78, 0)
  A2_63:finishCliantTalkTurn()
end
function Wvr306.processEvent020_2(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 79, 0)
  A2_66:say(A0_64, 80, 0)
  A2_66:finishCliantTalkTurn()
end
function Wvr306.processEventS001_1(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 81, 0)
  A2_69:finishCliantTalkTurn()
  A0_67:_wait(1)
end
function Wvr306.processEventS002_1(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 86, 0)
  A2_72:say(A0_70, 87, 0)
  A2_72:say(A0_70, 88, 0)
  A2_72:finishCliantTalkTurn()
end
function Wvr306.processEventS003_1(A0_73, A1_74, A2_75)
  A2_75:say(A0_73, 90, 0)
end
function Wvr306.processEventS004_1(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 89, 0)
  A2_78:say(A0_76, 91, 0)
  A2_78:finishCliantTalkTurn()
end
function Wvr306.processEventS005_1(A0_79, A1_80, A2_81)
  A2_81:say(A0_79, 93, 0)
end
