require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gld200", "ScenarioBaseClass")
function Gld200.initText(A0_0)
  A0_0:_loadTextDataPermanently(1816, "gld200")
end
function Gld200.processEventElecotteStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 51, 0)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 52, 2) == 1 then
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:say(A0_1, 8, 0)
    else
      A2_3:say(A0_1, 90, 0)
      A2_3:say(A0_1, 91, 0)
    end
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 90, 0)
    A2_3:say(A0_1, 91, 0)
  end
end
function Gld200.processEvent013(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(1, A1_5)
  A2_6:say(A0_4, 9, 0)
  A2_6:say(A0_4, 10, 0)
  A2_6:say(A0_4, 11, 0)
  A2_6:say(A0_4, 12, 0)
  A2_6:say(A0_4, 13, 0)
  A2_6:finishCliantTalkTurn()
end
function Gld200.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("gld20020", 1)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
function Gld200.processEvent030(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("gld20030", 1)
  A0_10:startFadeInCutSceneDefault(A1_11)
end
function Gld200.processEvent040(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("gld20040", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Gld200.processEvent045(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 94, 0)
  if worldMaster:ask(A0_16, worldMaster, 51030, 2) == 1 then
    A0_16:runCharaSchedulerPastAreaIn(A1_17)
  else
    A2_18:say(A0_16, 95, 0)
  end
  A2_18:finishCliantTalkTurn()
  return (worldMaster:ask(A0_16, worldMaster, 51030, 2))
end
function Gld200.processEvent050(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("gld20050", 1)
  A0_19:startFadeInCutSceneDefault(A1_20)
end
function Gld200.processEvent060(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 47, 0)
  A2_24:say(A0_22, 48, 0)
  A2_24:say(A0_22, 49, 0)
  A2_24:say(A0_22, 50, 0)
  A2_24:finishCliantTalkTurn()
end
function Gld200.processEvent007_2(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 28, 0)
  A2_27:say(A0_25, 58, 0)
  A2_27:finishCliantTalkTurn()
end
function Gld200.processEvent007_3(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 31, 0)
  A2_30:say(A0_28, 59, 0)
  A2_30:finishCliantTalkTurn()
end
function Gld200.processEvent007_4(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 30, 0)
  A2_33:finishCliantTalkTurn()
end
function Gld200.processEvent007_5(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 29, 0)
  A2_36:say(A0_34, 60, 0)
  A2_36:finishCliantTalkTurn()
end
function Gld200.processEvent007_6(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 61, 0)
  A2_39:finishCliantTalkTurn()
end
function Gld200.processEvent007_7(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 62, 0)
  A2_42:say(A0_40, 63, 0)
  A2_42:finishCliantTalkTurn()
end
function Gld200.processEvent013_2(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 64, 0)
  A2_45:say(A0_43, 65, 0)
  A2_45:finishCliantTalkTurn()
end
function Gld200.processEvent020_2(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 66, 0)
  A2_48:say(A0_46, 67, 0)
  A2_48:finishCliantTalkTurn()
end
function Gld200.processEvent030_2(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 25, 0)
  A2_51:say(A0_49, 26, 0)
  A2_51:say(A0_49, 27, 0)
  A2_51:say(A0_49, 96, 0)
  A2_51:finishCliantTalkTurn()
end
function Gld200.processEvent030_3(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 68, 0)
  A2_54:say(A0_52, 69, 0)
  A2_54:finishCliantTalkTurn()
end
function Gld200.processEvent030_4(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 70, 0)
  A2_57:say(A0_55, 71, 0)
  A2_57:finishCliantTalkTurn()
end
function Gld200.processEvent030_5(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 72, 0)
  A2_60:say(A0_58, 73, 0)
  A2_60:finishCliantTalkTurn()
end
function Gld200.processEvent030_6(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 74, 0)
  A2_63:say(A0_61, 75, 0)
  A2_63:finishCliantTalkTurn()
end
function Gld200.processEvent030_7(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 32, 0)
  A2_66:say(A0_64, 76, 0)
  A2_66:finishCliantTalkTurn()
end
function Gld200.processEvent030_8(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 77, 0)
  A2_69:say(A0_67, 78, 0)
  A2_69:finishCliantTalkTurn()
end
function Gld200.processEvent030_9(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 97, 0)
  A2_72:finishCliantTalkTurn()
end
function Gld200.processEvent030_10(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 98, 0)
  A2_75:finishCliantTalkTurn()
end
function Gld200.processEvent030_11(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 99, 0)
  A2_78:finishCliantTalkTurn()
end
function Gld200.processEvent032_2(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:say(A0_79, 100, 0)
  A2_81:finishCliantTalkTurn()
end
function Gld200.processEvent032_3(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 101, 0)
  A2_84:finishCliantTalkTurn()
end
function Gld200.processEvent032_4(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 102, 0)
  A2_87:finishCliantTalkTurn()
end
function Gld200.processEvent040_2(A0_88, A1_89, A2_90)
  A2_90:startCliantTalkTurn(2, A1_89)
  A2_90:say(A0_88, 79, 0)
  A2_90:finishCliantTalkTurn()
end
function Gld200.processEvent040_3(A0_91, A1_92, A2_93)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:say(A0_91, 92, 0)
  A2_93:finishCliantTalkTurn()
end
function Gld200.processEvent040_4(A0_94, A1_95, A2_96)
  A2_96:startCliantTalkTurn(2, A1_95)
  A2_96:say(A0_94, 93, 0)
  A2_96:finishCliantTalkTurn()
end
function Gld200.processEvent050_2(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 80, 0)
  A2_99:finishCliantTalkTurn()
end
