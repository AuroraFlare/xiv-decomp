require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Hrv306", "ScenarioBaseClass")
function Hrv306.initText(A0_0)
  A0_0:_loadTextDataPermanently(375, "hrv306")
end
function Hrv306.processEventOpyltylStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:say(A0_1, 7, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Hrv306.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  if A0_4:startNQCutScene("hrv30610", 2) == 1 then
    A0_4:startFadeInCutSceneAfterWarp(A1_5)
  else
    A0_4:startFadeInCutSceneDefault(A1_5)
  end
  return (A0_4:startNQCutScene("hrv30610", 2))
end
function Hrv306.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("hrv30620", 1)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Hrv306.processEvent030(A0_10, A1_11, A2_12, A3_13)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("hrv30630", 1, A3_13)
  A0_10:startFadeInCutSceneAfterWarp(A1_11)
end
function Hrv306.processEvent032(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:say(A0_14, 20, 0)
  A2_16:say(A0_14, 21, 0)
  A2_16:say(A0_14, 22, 0)
  A2_16:say(A0_14, 23, 0)
  A2_16:finishCliantTalkTurn()
end
function Hrv306.processEvent034(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 88, 0)
  A2_19:say(A0_17, 89, 0)
  A2_19:say(A0_17, 90, 0)
  A2_19:say(A0_17, 91, 0)
  A2_19:say(A0_17, 92, 0)
  A2_19:say(A0_17, 93, 0)
  A2_19:finishCliantTalkTurn()
end
function Hrv306.processEvent036(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:finishCliantTalkTurn()
end
function Hrv306.processEvent038(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:say(A0_23, 102, 0)
  A2_25:say(A0_23, 103, 0)
  A2_25:say(A0_23, 104, 0)
  A2_25:say(A0_23, 105, 0)
  A2_25:finishCliantTalkTurn()
end
function Hrv306.processEvent040(A0_26, A1_27, A2_28)
  if worldMaster:ask(A0_26, worldMaster, 51030, 2) == 1 then
    A0_26:runCharaSchedulerPastAreaIn(A1_27)
    A0_26:startFadeOutCutSceneDefault(A1_27)
    A0_26:startNQCutScene("hrv30640", 1)
    A0_26:startFadeInCutSceneDefault(A1_27)
    A2_28:say(A0_26, 113, 0)
    A2_28:say(A0_26, 114, 0)
    A2_28:say(A0_26, 115, 0)
    return 1
  else
    return 0
  end
end
function Hrv306.processEvent045(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:say(A0_29, 117, 0)
  A2_31:say(A0_29, 118, 0)
  A2_31:finishCliantTalkTurn()
end
function Hrv306.processEvent050(A0_32, A1_33, A2_34)
  A0_32:startFadeOutCutSceneDefault(A1_33)
  A0_32:startNQCutScene("hrv30650", 1)
  A0_32:startFadeInCutSceneDefault(A1_33)
end
function Hrv306.processEvent060(A0_35, A1_36, A2_37)
  A0_35:startFadeOutCutSceneDefault(A1_36)
  A0_35:startNQCutScene("hrv30660", 1)
  A0_35:startFadeInCutSceneDefault(A1_36)
end
function Hrv306.processEvent070(A0_38, A1_39, A2_40)
  A0_38:startFadeOutCutSceneDefault(A1_39)
  A0_38:startNQCutScene("hrv30670", 1)
  A0_38:startFadeInCutSceneDefault(A1_39)
end
function Hrv306.processEvent005_2(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 66, 0)
  A2_43:say(A0_41, 67, 0)
  A2_43:finishCliantTalkTurn()
end
function Hrv306.processEvent005_3(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 68, 0)
  A2_46:say(A0_44, 69, 0)
  A2_46:finishCliantTalkTurn()
end
function Hrv306.processEvent005_4(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:say(A0_47, 70, 0)
  A2_49:say(A0_47, 71, 0)
  A2_49:finishCliantTalkTurn()
end
function Hrv306.processEvent005_5(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 72, 0)
  A2_52:say(A0_50, 73, 0)
  A2_52:finishCliantTalkTurn()
end
function Hrv306.processEvent005_6(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 74, 0)
  A2_55:say(A0_53, 75, 0)
  A2_55:finishCliantTalkTurn()
end
function Hrv306.processEvent010_2(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 76, 0)
  A2_58:say(A0_56, 77, 0)
  A2_58:finishCliantTalkTurn()
end
function Hrv306.processEvent010_3(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 78, 0)
  A2_61:say(A0_59, 79, 0)
  A2_61:finishCliantTalkTurn()
end
function Hrv306.processEvent020_2(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 80, 0)
  A2_64:finishCliantTalkTurn()
end
function Hrv306.processEvent030_2(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:say(A0_65, 120, 0)
  A2_67:finishCliantTalkTurn()
end
function Hrv306.processEvent032_2(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  A2_70:say(A0_68, 81, 0)
  A2_70:finishCliantTalkTurn()
end
function Hrv306.processEvent032_3(A0_71, A1_72, A2_73)
  A2_73:startCliantTalkTurn(2, A1_72)
  A2_73:say(A0_71, 82, 0)
  A2_73:say(A0_71, 83, 0)
  A2_73:finishCliantTalkTurn()
end
function Hrv306.processEvent032_4(A0_74, A1_75, A2_76)
  A2_76:startCliantTalkTurn(2, A1_75)
  A2_76:say(A0_74, 84, 0)
  A2_76:say(A0_74, 85, 0)
  A2_76:finishCliantTalkTurn()
end
function Hrv306.processEvent032_5(A0_77, A1_78, A2_79)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:say(A0_77, 86, 0)
  A2_79:say(A0_77, 87, 0)
  A2_79:finishCliantTalkTurn()
end
function Hrv306.processEvent034_2(A0_80, A1_81, A2_82)
  A2_82:startCliantTalkTurn(2, A1_81)
  A2_82:say(A0_80, 94, 0)
  A2_82:say(A0_80, 95, 0)
  A2_82:finishCliantTalkTurn()
end
function Hrv306.processEvent034_3(A0_83, A1_84, A2_85)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:say(A0_83, 96, 0)
  A2_85:say(A0_83, 97, 0)
  A2_85:finishCliantTalkTurn()
end
function Hrv306.processEvent034_4(A0_86, A1_87, A2_88)
  A2_88:startCliantTalkTurn(2, A1_87)
  A2_88:say(A0_86, 98, 0)
  A2_88:say(A0_86, 99, 0)
  A2_88:finishCliantTalkTurn()
end
function Hrv306.processEvent034_5(A0_89, A1_90, A2_91)
  A2_91:startCliantTalkTurn(2, A1_90)
  A2_91:say(A0_89, 100, 0)
  A2_91:say(A0_89, 101, 0)
  A2_91:finishCliantTalkTurn()
end
function Hrv306.processEvent038_2(A0_92, A1_93, A2_94)
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:say(A0_92, 106, 0)
  A2_94:finishCliantTalkTurn()
end
function Hrv306.processEvent040_2(A0_95, A1_96, A2_97)
  A2_97:startCliantTalkTurn(2, A1_96)
  A2_97:say(A0_95, 116, 0)
  A2_97:finishCliantTalkTurn()
end
function Hrv306.processEvent050_2(A0_98, A1_99, A2_100)
  A2_100:startCliantTalkTurn(2, A1_99)
  A2_100:say(A0_98, 108, 0)
  A2_100:say(A0_98, 109, 0)
  A2_100:say(A0_98, 110, 0)
  A2_100:finishCliantTalkTurn()
end
function Hrv306.processEvent050_3(A0_101, A1_102, A2_103)
  A2_103:startCliantTalkTurn(2, A1_102)
  A2_103:say(A0_101, 111, 0)
  A2_103:say(A0_101, 112, 0)
  A2_103:say(A0_101, 119, 0)
  A2_103:finishCliantTalkTurn()
end
