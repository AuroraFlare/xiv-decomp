require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man402", "ScenarioBaseClass")
function Man402.initText(A0_0)
  A0_0:_loadTextDataPermanently(1622, "man402")
end
function Man402.pES(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8)
  local L8_9, L9_10
  L9_10 = A2_3
  L8_9 = A2_3.startCliantTalkTurn
  L8_9(L9_10, 2, A1_2)
  L9_10 = A2_3
  L8_9 = A2_3.say
  L8_9(L9_10, A0_1, 249, 0)
  L9_10 = A0_1
  L8_9 = A0_1.showQuestInfomation
  L8_9 = L8_9(L9_10)
  if L8_9 == 1 then
    L9_10 = A0_1.getSnpcSexualityToSkin
    L9_10 = L9_10(A0_1, A5_6)
    A0_1:startFadeOutCutSceneDefault(A1_2)
    A0_1:startFadeInCutSceneDefault(A1_2)
    return (A0_1:startSnpcNQCutScene("man40200", 2, A3_4, A4_5, A5_6, A6_7, A7_8, L9_10))
  else
    L9_10 = A2_3.say
    L9_10(A2_3, A0_1, 250, 0)
    return L8_9
  end
  L9_10 = A2_3.finishCliantTalkTurn
  L9_10(A2_3)
end
function Man402.pE10(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17, A7_18, A8_19)
  A4_15 = A0_11:getSnpcActorClassID(A4_15)
  A0_11:startFadeOutCutSceneDefault(A1_12)
  A0_11:startSnpcNQCutScene("man40210", 1, A3_14, A4_15, A5_16, A6_17, A7_18, A8_19, A8_19)
  A0_11:startFadeInCutSceneDefault(A1_12)
end
function Man402.pE20(A0_20, A1_21, A2_22, A3_23, A4_24, A5_25, A6_26, A7_27)
  A4_24 = A0_20:getSnpcActorClassID(A4_24)
  A0_20:startFadeOutCutSceneDefault(A1_21)
  A0_20:startSnpcNQCutScene("man40220", 1, A3_23, A4_24, A5_25, A6_26, A7_27)
  A0_20:startFadeInCutSceneDefault(A1_21)
end
function Man402.pE30(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33, A6_34, A7_35)
  A4_32 = A0_28:getSnpcActorClassID(A4_32)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startSnpcNQCutScene("man40230", 1, A3_31, A4_32, A5_33, A6_34, A7_35)
  A0_28:startFadeInCutSceneAfterWarp(A1_29)
end
function Man402.processEvent000_1(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:say(A0_36, 108, 0)
  A2_38:say(A0_36, 109, 0)
  A2_38:finishCliantTalkTurn()
end
function Man402.processEvent000_2(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 110, 0)
  A2_41:say(A0_39, 111, 0)
  A2_41:finishCliantTalkTurn()
end
function Man402.pE03(A0_42, A1_43, A2_44, A3_45, A4_46, A5_47, A6_48, A7_49)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 112, 0, A3_45)
  A2_44:say(A0_42, 113, 0)
  A2_44:finishCliantTalkTurn()
end
function Man402.processEvent000_4(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 114, 0)
  A2_52:say(A0_50, 115, 0)
  A2_52:finishCliantTalkTurn()
end
function Man402.processEvent000_5(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 116, 0)
  A2_55:say(A0_53, 117, 0)
  A2_55:finishCliantTalkTurn()
end
function Man402.processEvent000_6(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 118, 0)
  A2_58:say(A0_56, 119, 0)
  A2_58:finishCliantTalkTurn()
end
function Man402.processEvent000_7(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 250, 0)
  A2_61:finishCliantTalkTurn()
end
function Man402.processEvent020_1(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 120, 0)
  A2_64:say(A0_62, 121, 0)
  A2_64:finishCliantTalkTurn()
end
function Man402.processEvent020_2(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 122, 0)
  A2_67:say(A0_65, 123, 0)
  A2_67:finishCliantTalkTurn()
end
function Man402.pE23(A0_68, A1_69, A2_70, A3_71, A4_72, A5_73, A6_74, A7_75)
  local L8_76
  L8_76 = A2_70.startCliantTalkTurn
  L8_76(A2_70, 2, A1_69)
  L8_76 = A0_68.getSnpcSexualityToSkin
  L8_76 = L8_76(A0_68, A5_73)
  A2_70:say(A0_68, 124, 0, A3_71, L8_76)
  A2_70:say(A0_68, 125, 0, L8_76)
  A2_70:finishCliantTalkTurn()
end
function Man402.processEvent020_4(A0_77, A1_78, A2_79)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:say(A0_77, 126, 0)
  A2_79:say(A0_77, 127, 0)
  A2_79:finishCliantTalkTurn()
end
function Man402.processEvent020_5(A0_80, A1_81, A2_82)
  A2_82:startCliantTalkTurn(2, A1_81)
  A2_82:say(A0_80, 128, 0)
  A2_82:say(A0_80, 129, 0)
  A2_82:finishCliantTalkTurn()
end
function Man402.processEvent020_6(A0_83, A1_84, A2_85)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:say(A0_83, 130, 0)
  A2_85:say(A0_83, 131, 0)
  A2_85:finishCliantTalkTurn()
end
