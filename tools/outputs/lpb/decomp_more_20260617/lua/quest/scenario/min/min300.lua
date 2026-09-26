require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Min300", "ScenarioBaseClass")
function Min300.initText(A0_0)
  A0_0:_loadTextDataPermanently(1674, "min300")
end
function Min300.processEventLinetteStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
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
function Min300.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("min30010", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Min300.processEvent013(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(1, A1_8)
  A2_9:say(A0_7, 19, 0)
  A2_9:say(A0_7, 20, 0)
  A2_9:say(A0_7, 21, 0)
  A2_9:finishCliantTalkTurn()
end
function Min300.processEvent017(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(1, A1_11)
  A2_12:finishCliantTalkTurn()
end
function Min300.processEvent020(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("min30020", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Min300.processEvent025(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 33, 0)
  A2_18:say(A0_16, 34, 0)
  A2_18:finishCliantTalkTurn()
end
function Min300.processEvent030(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("min30030", 1)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Min300.processEvent040(A0_22, A1_23, A2_24)
  A0_22:startFadeOutCutSceneDefault(A1_23)
  A0_22:startNQCutScene("min30040", 1)
  A0_22:startFadeInCutSceneAfterWarp(A1_23)
end
function Min300.processEvent050(A0_25, A1_26, A2_27)
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startNQCutScene("min30050", 1)
  A0_25:startFadeInCutSceneAfterWarp(A1_26)
end
function Min300.processEvent060(A0_28, A1_29, A2_30, A3_31)
  if worldMaster:ask(A0_28, worldMaster, 51030, 2) == 1 then
    A0_28:runCharaSchedulerPastAreaIn(A1_29)
    A0_28:startFadeOutCutSceneDefault(A1_29)
    A0_28:startNQCutScene("min30060", 1)
    if A3_31 == 0 then
      A0_28:startFadeInCutSceneDefault(A1_29)
    else
      A0_28:startFadeInCutSceneAfterWarp(A1_29)
    end
    return 1
  else
    return 0
  end
end
function Min300.processEvent070(A0_32, A1_33, A2_34, A3_35)
  if worldMaster:ask(A0_32, worldMaster, 51030, 2) == 1 then
    A0_32:runCharaSchedulerPastAreaIn(A1_33)
    A0_32:startFadeOutCutSceneDefault(A1_33)
    A0_32:startNQCutScene("min30070", 1)
    if A3_35 == 0 then
      A0_32:startFadeInCutSceneDefault(A1_33)
    else
      A0_32:startFadeInCutSceneAfterWarp(A1_33)
    end
    return 1
  else
    return 0
  end
end
function Min300.processEvent005_2(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:say(A0_36, 113, 0)
  A2_38:say(A0_36, 114, 0)
  A2_38:finishCliantTalkTurn()
end
function Min300.processEvent005_3(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 115, 0)
  A2_41:say(A0_39, 116, 0)
  A2_41:finishCliantTalkTurn()
end
function Min300.processEvent005_4(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 117, 0)
  A2_44:say(A0_42, 118, 0)
  A2_44:finishCliantTalkTurn()
end
function Min300.processEvent005_5(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 119, 0)
  A2_47:say(A0_45, 120, 0)
  A2_47:finishCliantTalkTurn()
end
function Min300.processEvent005_6(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:say(A0_48, 121, 0)
  A2_50:say(A0_48, 122, 0)
  A2_50:finishCliantTalkTurn()
end
function Min300.processEvent005_7(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:say(A0_51, 123, 0)
  A2_53:say(A0_51, 124, 0)
  A2_53:finishCliantTalkTurn()
end
function Min300.processEvent005_8(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(2, A1_55)
  A2_56:say(A0_54, 125, 0)
  A2_56:say(A0_54, 126, 0)
  A2_56:finishCliantTalkTurn()
end
function Min300.processEvent010_2(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:say(A0_57, 127, 0)
  A2_59:say(A0_57, 128, 0)
  A2_59:finishCliantTalkTurn()
end
function Min300.processEvent010_3(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:say(A0_60, 129, 0)
  A2_62:say(A0_60, 130, 0)
  A2_62:finishCliantTalkTurn()
end
function Min300.processEvent010_4(A0_63, A1_64, A2_65)
  A2_65:startCliantTalkTurn(2, A1_64)
  A2_65:say(A0_63, 131, 0)
  A2_65:say(A0_63, 132, 0)
  A2_65:finishCliantTalkTurn()
end
function Min300.processEvent010_5(A0_66, A1_67, A2_68)
  A2_68:startCliantTalkTurn(2, A1_67)
  A2_68:say(A0_66, 133, 0)
  A2_68:say(A0_66, 134, 0)
  A2_68:finishCliantTalkTurn()
end
function Min300.processEvent010_6(A0_69, A1_70, A2_71)
  A2_71:startCliantTalkTurn(2, A1_70)
  A2_71:say(A0_69, 154, 0)
  A2_71:finishCliantTalkTurn()
end
function Min300.processEvent010_7(A0_72, A1_73, A2_74)
  A2_74:startCliantTalkTurn(2, A1_73)
  A2_74:say(A0_72, 163, 0)
  A2_74:finishCliantTalkTurn()
end
function Min300.processEvent010_8(A0_75, A1_76, A2_77)
  A2_77:startCliantTalkTurn(2, A1_76)
  A2_77:say(A0_75, 158, 0)
  A2_77:finishCliantTalkTurn()
end
function Min300.processEvent013_2(A0_78, A1_79, A2_80)
  A2_80:startCliantTalkTurn(2, A1_79)
  A2_80:say(A0_78, 159, 0)
  A2_80:say(A0_78, 160, 0)
  A2_80:finishCliantTalkTurn()
end
function Min300.processEvent017_2(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(2, A1_82)
  A2_83:say(A0_81, 29, 0)
  A2_83:finishCliantTalkTurn()
end
function Min300.processEvent017_3(A0_84, A1_85, A2_86)
  A2_86:startCliantTalkTurn(2, A1_85)
  A2_86:say(A0_84, 30, 0)
  A2_86:finishCliantTalkTurn()
end
function Min300.processEvent020_2(A0_87, A1_88, A2_89)
  A2_89:startCliantTalkTurn(2, A1_88)
  A2_89:say(A0_87, 135, 0)
  A2_89:say(A0_87, 136, 0)
  A2_89:finishCliantTalkTurn()
end
function Min300.processEvent020_3(A0_90, A1_91, A2_92)
  A2_92:startCliantTalkTurn(2, A1_91)
  A2_92:say(A0_90, 137, 0)
  A2_92:say(A0_90, 138, 0)
  A2_92:finishCliantTalkTurn()
end
function Min300.processEvent025_2(A0_93, A1_94, A2_95)
  A2_95:startCliantTalkTurn(2, A1_94)
  A2_95:say(A0_93, 139, 0)
  A2_95:say(A0_93, 140, 0)
  A2_95:finishCliantTalkTurn()
end
function Min300.processEvent040_2(A0_96, A1_97, A2_98)
  A2_98:startCliantTalkTurn(2, A1_97)
  A2_98:say(A0_96, 142, 0)
  A2_98:say(A0_96, 143, 0)
  A2_98:finishCliantTalkTurn()
end
function Min300.processEvent040_3(A0_99, A1_100, A2_101)
  A2_101:startCliantTalkTurn(2, A1_100)
  A2_101:say(A0_99, 144, 0)
  A2_101:finishCliantTalkTurn()
end
function Min300.processEvent040_4(A0_102, A1_103, A2_104)
  A2_104:startCliantTalkTurn(2, A1_103)
  A2_104:say(A0_102, 145, 0)
  A2_104:say(A0_102, 146, 0)
  A2_104:finishCliantTalkTurn()
end
function Min300.processEvent040_5(A0_105, A1_106, A2_107)
  A2_107:startCliantTalkTurn(2, A1_106)
  A2_107:say(A0_105, 147, 0)
  A2_107:say(A0_105, 148, 0)
  A2_107:finishCliantTalkTurn()
end
function Min300.processEvent040_6(A0_108, A1_109, A2_110)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:say(A0_108, 149, 0)
  A2_110:say(A0_108, 150, 0)
  A2_110:finishCliantTalkTurn()
end
function Min300.processEvent040_7(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 151, 0)
  A2_113:say(A0_111, 152, 0)
  A2_113:finishCliantTalkTurn()
end
function Min300.processEvent050_2(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:say(A0_114, 63, 0)
  A2_116:finishCliantTalkTurn()
end
function Min300.processEvent050_3(A0_117, A1_118, A2_119)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:say(A0_117, 83, 0)
  A2_119:finishCliantTalkTurn()
end
function Min300.processEvent050_4(A0_120, A1_121, A2_122)
  A2_122:startCliantTalkTurn(2, A1_121)
  A2_122:say(A0_120, 161, 0)
  A2_122:say(A0_120, 162, 0)
  A2_122:finishCliantTalkTurn()
end
