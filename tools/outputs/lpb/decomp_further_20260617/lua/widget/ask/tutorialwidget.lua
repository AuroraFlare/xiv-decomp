require("/Widget/Ask/AskBaseClass")
_defineClass("TutorialWidget", "AskBaseClass")
function TutorialWidget.initAsk(A0_0, A1_1, A2_2)
  A0_0.work._temp = {
    {"infoID", "integer8"},
    {"autoAnim", "boolean"}
  }
  A0_0.work.infoID = A2_2
  A0_0.work.autoAnim = false
  A0_0:setModal(false)
  A0_0:setProperty("IsHitTestVisible", false)
  A0_0:setDrag(false)
  A0_0:setUICommandCondition("UILuaCommands.Shown")
  if A1_1 == 2 then
    A0_0:setTextPad(A2_2)
    break
  else
  end
  if A1_1 == 1 then
    A0_0:setTextKeyboard(A2_2)
    do break end
    break
  else
  end
  A0_0:setVisibility("TextBlock_Text_2", false)
end
function TutorialWidget.processUICommandOperate(A0_3, A1_4, A2_5, A3_6, A4_7)
  A0_3:setModal(false)
  A0_3:disableButtonGrid()
  A0_3:sendCommand("UILuaCommands.AnimationStart")
  A0_3:setProperty("Focusable", false)
  A0_3:setBaseAskResult(1)
end
function TutorialWidget.processUICommandDefault(A0_8, A1_9, A2_10, A3_11, A4_12, A5_13)
  if A3_11 == "UILuaCommands.Shown" and A0_8.work.autoAnim then
    A0_8:sendCommand("UILuaCommands.AnimationStart")
    do break end
    break
  else
  end
end
function TutorialWidget.setTextPad(A0_14, A1_15)
  local L2_16
  L2_16 = A1_15
  if L2_16 == 1 then
    A0_14:setTextPad1()
    break
  else
  end
  if L2_16 == 2 then
    A0_14:setTextPad2()
    break
  else
  end
  if L2_16 == 3 then
    A0_14:setTextPad3()
    break
  else
  end
  if L2_16 == 4 then
    A0_14:setTextPad4()
    break
  else
  end
  if L2_16 == 5 then
    A0_14:setTextPad5()
    break
  else
  end
  if L2_16 == 6 then
    A0_14:setTextPad6()
    break
  else
  end
  if L2_16 == 7 then
    A0_14:setTextPad7()
    break
  else
  end
  if L2_16 == 8 then
    A0_14:setTextPad8()
    break
  else
  end
  if L2_16 == 9 then
    A0_14:setTextPad9()
    break
  else
  end
  if L2_16 == 10 then
    A0_14:setTextPad10()
    break
  else
  end
  if L2_16 == 11 then
    A0_14:setTextPad11()
    break
  else
  end
  if L2_16 == 12 then
    A0_14:setTextPad12()
    break
  else
  end
  if L2_16 == 13 then
    A0_14:setTextPad13()
    break
  else
  end
  if L2_16 == 14 then
    A0_14:setTextPad14()
    break
  else
  end
  if L2_16 == 15 then
    A0_14:setTextPad15()
    break
  else
  end
  if L2_16 == 16 then
    A0_14:setTextPad16()
    break
  else
  end
  if L2_16 == 17 then
    A0_14:setTextPad17()
    break
  else
  end
  if L2_16 == 18 then
    A0_14:setTextPad18()
    do break end
    break
  else
  end
end
function TutorialWidget.setTextKeyboard(A0_17, A1_18)
  local L2_19
  L2_19 = A1_18
  if L2_19 == 1 then
    A0_17:setTextKeyboard1()
    break
  else
  end
  if L2_19 == 2 then
    A0_17:setTextKeyboard2()
    break
  else
  end
  if L2_19 == 3 then
    A0_17:setTextKeyboard3()
    break
  else
  end
  if L2_19 == 4 then
    A0_17:setTextKeyboard4()
    break
  else
  end
  if L2_19 == 5 then
    A0_17:setTextKeyboard5()
    break
  else
  end
  if L2_19 == 6 then
    A0_17:setTextKeyboard6()
    break
  else
  end
  if L2_19 == 7 then
    A0_17:setTextKeyboard7()
    break
  else
  end
  if L2_19 == 8 then
    A0_17:setTextKeyboard8()
    break
  else
  end
  if L2_19 == 9 then
    A0_17:setTextKeyboard9()
    break
  else
  end
  if L2_19 == 10 then
    A0_17:setTextKeyboard10()
    break
  else
  end
  if L2_19 == 11 then
    A0_17:setTextKeyboard11()
    break
  else
  end
  if L2_19 == 12 then
    A0_17:setTextKeyboard12()
    break
  else
  end
  if L2_19 == 13 then
    A0_17:setTextKeyboard13()
    break
  else
  end
  if L2_19 == 14 then
    A0_17:setTextKeyboard14()
    break
  else
  end
  if L2_19 == 15 then
    A0_17:setTextKeyboard15()
    break
  else
  end
  if L2_19 == 16 then
    A0_17:setTextKeyboard16()
    break
  else
  end
  if L2_19 == 17 then
    A0_17:setTextKeyboard17()
    break
  else
  end
  if L2_19 == 18 then
    A0_17:setTextKeyboard18()
    do break end
    break
  else
  end
end
function TutorialWidget.setTextPad1(A0_20)
  A0_20:setText("TextBlock_Title", 9001)
  A0_20:setText("TextBlock_Text_1", 9003)
  A0_20:initWidgetWithButton()
end
function TutorialWidget.setTextPad2(A0_21)
  local L1_22, L2_23, L3_24, L4_25
  L1_22 = worldMaster
  L2_23 = L1_22
  L1_22 = L1_22._getMyPlayer
  L1_22 = L1_22(L2_23)
  L2_23 = L1_22
  L1_22 = L1_22.getInitialTown
  L1_22 = L1_22(L2_23)
  L3_24 = A0_21
  L2_23 = A0_21.getTutorial2TownNPC
  L4_25 = L1_22
  L4_25 = L2_23(L3_24, L4_25)
  A0_21:setText("TextBlock_Title", 9006)
  A0_21:setText("TextBlock_Text_1", 9008, L2_23, L3_24, L4_25)
  A0_21:initWidgetWithButton()
end
function TutorialWidget.setTextPad3(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  L1_27 = worldMaster
  L2_28 = L1_27
  L1_27 = L1_27._getMyPlayer
  L1_27 = L1_27(L2_28)
  L2_28 = L1_27
  L1_27 = L1_27.getInitialTown
  L1_27 = L1_27(L2_28)
  L3_29 = A0_26
  L2_28 = A0_26.getTutorial2TownNPC
  L4_30 = L1_27
  L4_30 = L2_28(L3_29, L4_30)
  A0_26:setText("TextBlock_Title", 9011, L2_28, L3_29, L4_30)
  A0_26:setText("TextBlock_Text_1", 9013, L2_28, L3_29, L4_30)
  A0_26:initWidgetWithButton()
end
function TutorialWidget.setTextPad4(A0_31)
  local L1_32, L2_33, L3_34, L4_35
  L1_32 = worldMaster
  L2_33 = L1_32
  L1_32 = L1_32._getMyPlayer
  L1_32 = L1_32(L2_33)
  L2_33 = L1_32
  L1_32 = L1_32.getInitialTown
  L1_32 = L1_32(L2_33)
  L3_34 = A0_31
  L2_33 = A0_31.getTutorial2TownNPC
  L4_35 = L1_32
  L4_35 = L2_33(L3_34, L4_35)
  A0_31:setText("TextBlock_Title", 9016, L2_33, L3_34, L4_35)
  A0_31:setText("TextBlock_Text_1", 9018, L2_33, L3_34, L4_35)
  A0_31:initWidgetWithButton()
end
function TutorialWidget.setTextPad5(A0_36)
  A0_36:setText("TextBlock_Title", 9021)
  A0_36:setText("TextBlock_Text_1", 9023)
  A0_36:initWidgetWithButton()
end
function TutorialWidget.setTextPad6(A0_37)
  A0_37:setText("TextBlock_Title", 9026)
  A0_37:setText("TextBlock_Text_1", 9028)
  A0_37:initWidgetWithButton()
end
function TutorialWidget.setTextPad7(A0_38)
  local L1_39, L2_40, L3_41, L4_42
  L1_39 = worldMaster
  L2_40 = L1_39
  L1_39 = L1_39._getMyPlayer
  L1_39 = L1_39(L2_40)
  L2_40 = L1_39
  L1_39 = L1_39.getInitialTown
  L1_39 = L1_39(L2_40)
  L3_41 = A0_38
  L2_40 = A0_38.getTutorial7TownMob
  L4_42 = L1_39
  L4_42 = L2_40(L3_41, L4_42)
  A0_38:setText("TextBlock_Title", 9031, L2_40, L3_41, L4_42)
  A0_38:setText("TextBlock_Text_1", 9033, L2_40, L3_41, L4_42)
  A0_38:initWidgetWithButton()
end
function TutorialWidget.setTextPad8(A0_43)
  local L1_44, L2_45, L3_46, L4_47
  L1_44 = worldMaster
  L2_45 = L1_44
  L1_44 = L1_44._getMyPlayer
  L1_44 = L1_44(L2_45)
  L2_45 = L1_44
  L1_44 = L1_44.getInitialTown
  L1_44 = L1_44(L2_45)
  L3_46 = A0_43
  L2_45 = A0_43.getTutorial7TownMob
  L4_47 = L1_44
  L4_47 = L2_45(L3_46, L4_47)
  A0_43:setText("TextBlock_Title", 9036)
  A0_43:setText("TextBlock_Text_1", 9038, L2_45, L3_46, L4_47)
  A0_43:initWidgetNoButton()
end
function TutorialWidget.setTextPad9(A0_48)
  A0_48:setText("TextBlock_Title", 9041)
  A0_48:setText("TextBlock_Text_1", 9043)
  A0_48:initWidgetNoButton()
end
function TutorialWidget.setTextPad10(A0_49)
  local L1_50, L2_51
  L1_50 = worldMaster
  L2_51 = L1_50
  L1_50 = L1_50._getMyPlayer
  L1_50 = L1_50(L2_51)
  L2_51 = L1_50
  L1_50 = L1_50.getStateMainSkill
  L1_50 = L1_50(L2_51)
  L2_51 = A0_49.getTutorial10SkillIcon
  L2_51 = L2_51(A0_49, L1_50)
  A0_49:setText("TextBlock_Title", 9046)
  A0_49:setText("TextBlock_Text_1", 9048)
  A0_49:setIcon("IconControl_2", L2_51)
  A0_49:initWidgetWithButton()
end
function TutorialWidget.setTextPad11(A0_52)
  local L1_53, L2_54
  L1_53 = worldMaster
  L2_54 = L1_53
  L1_53 = L1_53._getMyPlayer
  L1_53 = L1_53(L2_54)
  L2_54 = L1_53
  L1_53 = L1_53.getStateMainSkill
  L1_53 = L1_53(L2_54)
  L2_54 = A0_52.getTutorial11SkillIcon
  L2_54 = L2_54(A0_52, L1_53)
  A0_52:setText("TextBlock_Title", 9051)
  A0_52:setText("TextBlock_Text_1", 9053)
  A0_52:setIcon("IconControl_2", L2_54)
  A0_52:setVisibility("Button_OK", false)
  A0_52:initWidgetNoButton()
end
function TutorialWidget.setTextPad12(A0_55)
  A0_55:setText("TextBlock_Title", 9056)
  A0_55:setText("TextBlock_Text_1", 9058)
  A0_55:initWidgetNoButton()
end
function TutorialWidget.setTextPad13(A0_56)
  local L1_57, L2_58
  L1_57 = worldMaster
  L2_58 = L1_57
  L1_57 = L1_57._getMyPlayer
  L1_57 = L1_57(L2_58)
  L2_58 = L1_57
  L1_57 = L1_57.getStateMainSkill
  L1_57 = L1_57(L2_58)
  L2_58 = A0_56.getTutorial13SkillIcon
  L2_58 = L2_58(A0_56, L1_57)
  A0_56:setText("TextBlock_Title", 9061)
  A0_56:setText("TextBlock_Text_1", 9063)
  A0_56:setIcon("IconControl_2", L2_58)
  A0_56:initWidgetNoButton()
end
function TutorialWidget.setTextPad14(A0_59)
  local L1_60, L2_61
  L1_60 = worldMaster
  L2_61 = L1_60
  L1_60 = L1_60._getMyPlayer
  L1_60 = L1_60(L2_61)
  L2_61 = L1_60
  L1_60 = L1_60.getInitialTown
  L1_60 = L1_60(L2_61)
  L2_61 = A0_59.getTutorial14Icon
  L2_61 = L2_61(A0_59, L1_60)
  A0_59:setIcon("IconControl_1", L2_61)
  A0_59:setText("TextBlock_Title", 9071)
  A0_59:setText("TextBlock_Text_1", 9073)
  A0_59:initWidgetNoButton()
end
function TutorialWidget.setTextPad15(A0_62)
  local L1_63, L2_64, L3_65, L4_66
  L1_63 = worldMaster
  L2_64 = L1_63
  L1_63 = L1_63._getMyPlayer
  L1_63 = L1_63(L2_64)
  L2_64 = L1_63
  L1_63 = L1_63.getInitialTown
  L1_63 = L1_63(L2_64)
  L3_65 = A0_62
  L2_64 = A0_62.getTutorial15TownNPC
  L4_66 = L1_63
  L4_66 = L2_64(L3_65, L4_66)
  A0_62:setText("TextBlock_Title", 9076)
  A0_62:setText("TextBlock_Text_1", 9078, L2_64, L3_65, L4_66)
  A0_62:initWidgetWithButton()
end
function TutorialWidget.setTextPad16(A0_67)
  local L1_68, L2_69
  L1_68 = worldMaster
  L2_69 = L1_68
  L1_68 = L1_68._getMyPlayer
  L1_68 = L1_68(L2_69)
  L2_69 = L1_68
  L1_68 = L1_68.getInitialTown
  L1_68 = L1_68(L2_69)
  L2_69 = A0_67.getTutorial16Icon
  L2_69 = L2_69(A0_67, L1_68)
  A0_67:setControlUserWorkInt(1, "CustomControl_1", L2_69)
  A0_67:setText("TextBlock_Title", 9081)
  A0_67:setText("TextBlock_Text_1", 9083)
  A0_67:initWidgetNoButton()
end
function TutorialWidget.setTextPad17(A0_70)
  local L1_71, L2_72, L3_73, L4_74
  L1_71 = worldMaster
  L2_72 = L1_71
  L1_71 = L1_71._getMyPlayer
  L1_71 = L1_71(L2_72)
  L2_72 = L1_71
  L1_71 = L1_71.getInitialTown
  L1_71 = L1_71(L2_72)
  L3_73 = A0_70
  L2_72 = A0_70.getTutorial2TownNPC
  L4_74 = L1_71
  L4_74 = L2_72(L3_73, L4_74)
  A0_70:setText("TextBlock_Title", 9006)
  A0_70:setText("TextBlock_Text_1", 9008, L2_72, L3_73, L4_74)
  A0_70:initWidgetNoButton()
end
function TutorialWidget.setTextPad18(A0_75)
  A0_75:setText("TextBlock_Title", 9086)
  A0_75:setText("TextBlock_Text_1", 9088)
  A0_75:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard1(A0_76)
  A0_76:setText("TextBlock_Title", 9001)
  A0_76:setText("TextBlock_Text_1", 9004)
  A0_76:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard2(A0_77)
  local L1_78, L2_79, L3_80, L4_81
  L1_78 = worldMaster
  L2_79 = L1_78
  L1_78 = L1_78._getMyPlayer
  L1_78 = L1_78(L2_79)
  L2_79 = L1_78
  L1_78 = L1_78.getInitialTown
  L1_78 = L1_78(L2_79)
  L3_80 = A0_77
  L2_79 = A0_77.getTutorial2TownNPC
  L4_81 = L1_78
  L4_81 = L2_79(L3_80, L4_81)
  A0_77:setText("TextBlock_Title", 9006)
  A0_77:setText("TextBlock_Text_1", 9009, L2_79, L3_80, L4_81)
  A0_77:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard3(A0_82)
  local L1_83, L2_84, L3_85, L4_86
  L1_83 = worldMaster
  L2_84 = L1_83
  L1_83 = L1_83._getMyPlayer
  L1_83 = L1_83(L2_84)
  L2_84 = L1_83
  L1_83 = L1_83.getInitialTown
  L1_83 = L1_83(L2_84)
  L3_85 = A0_82
  L2_84 = A0_82.getTutorial2TownNPC
  L4_86 = L1_83
  L4_86 = L2_84(L3_85, L4_86)
  A0_82:setText("TextBlock_Title", 9011, L2_84, L3_85, L4_86)
  A0_82:setText("TextBlock_Text_1", 9014, L2_84, L3_85, L4_86)
  A0_82:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard4(A0_87)
  local L1_88, L2_89, L3_90, L4_91
  L1_88 = worldMaster
  L2_89 = L1_88
  L1_88 = L1_88._getMyPlayer
  L1_88 = L1_88(L2_89)
  L2_89 = L1_88
  L1_88 = L1_88.getInitialTown
  L1_88 = L1_88(L2_89)
  L3_90 = A0_87
  L2_89 = A0_87.getTutorial2TownNPC
  L4_91 = L1_88
  L4_91 = L2_89(L3_90, L4_91)
  A0_87:setText("TextBlock_Title", 9016, L2_89, L3_90, L4_91)
  A0_87:setText("TextBlock_Text_1", 9019, L2_89, L3_90, L4_91)
  A0_87:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard5(A0_92)
  A0_92:setText("TextBlock_Title", 9021)
  A0_92:setText("TextBlock_Text_1", 9024)
  A0_92:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard6(A0_93)
  A0_93:setText("TextBlock_Title", 9026)
  A0_93:setText("TextBlock_Text_1", 9029)
  A0_93:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard7(A0_94)
  local L1_95, L2_96, L3_97, L4_98
  L1_95 = worldMaster
  L2_96 = L1_95
  L1_95 = L1_95._getMyPlayer
  L1_95 = L1_95(L2_96)
  L2_96 = L1_95
  L1_95 = L1_95.getInitialTown
  L1_95 = L1_95(L2_96)
  L3_97 = A0_94
  L2_96 = A0_94.getTutorial7TownMob
  L4_98 = L1_95
  L4_98 = L2_96(L3_97, L4_98)
  A0_94:setText("TextBlock_Title", 9031, L2_96, L3_97, L4_98)
  A0_94:setText("TextBlock_Text_1", 9034, L2_96, L3_97, L4_98)
  A0_94:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard8(A0_99)
  local L1_100, L2_101, L3_102, L4_103
  L1_100 = worldMaster
  L2_101 = L1_100
  L1_100 = L1_100._getMyPlayer
  L1_100 = L1_100(L2_101)
  L2_101 = L1_100
  L1_100 = L1_100.getInitialTown
  L1_100 = L1_100(L2_101)
  L3_102 = A0_99
  L2_101 = A0_99.getTutorial7TownMob
  L4_103 = L1_100
  L4_103 = L2_101(L3_102, L4_103)
  A0_99:setText("TextBlock_Title", 9036)
  A0_99:setText("TextBlock_Text_1", 9039, L2_101, L3_102, L4_103)
  A0_99:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard9(A0_104)
  A0_104:setText("TextBlock_Title", 9041)
  A0_104:setText("TextBlock_Text_1", 9044)
  A0_104:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard10(A0_105)
  local L1_106, L2_107
  L1_106 = worldMaster
  L2_107 = L1_106
  L1_106 = L1_106._getMyPlayer
  L1_106 = L1_106(L2_107)
  L2_107 = L1_106
  L1_106 = L1_106.getStateMainSkill
  L1_106 = L1_106(L2_107)
  L2_107 = A0_105.getTutorial10SkillIcon
  L2_107 = L2_107(A0_105, L1_106)
  A0_105:setText("TextBlock_Title", 9046)
  A0_105:setText("TextBlock_Text_1", 9049)
  A0_105:setIcon("IconControl_2", L2_107)
  A0_105:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard11(A0_108)
  local L1_109, L2_110
  L1_109 = worldMaster
  L2_110 = L1_109
  L1_109 = L1_109._getMyPlayer
  L1_109 = L1_109(L2_110)
  L2_110 = L1_109
  L1_109 = L1_109.getStateMainSkill
  L1_109 = L1_109(L2_110)
  L2_110 = A0_108.getTutorial11SkillIcon
  L2_110 = L2_110(A0_108, L1_109)
  A0_108:setText("TextBlock_Title", 9051)
  A0_108:setText("TextBlock_Text_1", 9054)
  A0_108:setIcon("IconControl_2", L2_110)
  A0_108:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard12(A0_111)
  A0_111:setText("TextBlock_Title", 9056)
  A0_111:setText("TextBlock_Text_1", 9059)
  A0_111:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard13(A0_112)
  local L1_113, L2_114
  L1_113 = worldMaster
  L2_114 = L1_113
  L1_113 = L1_113._getMyPlayer
  L1_113 = L1_113(L2_114)
  L2_114 = L1_113
  L1_113 = L1_113.getStateMainSkill
  L1_113 = L1_113(L2_114)
  L2_114 = A0_112.getTutorial13SkillIcon
  L2_114 = L2_114(A0_112, L1_113)
  A0_112:setText("TextBlock_Title", 9061)
  A0_112:setText("TextBlock_Text_1", 9064)
  A0_112:setIcon("IconControl_2", L2_114)
  A0_112:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard14(A0_115)
  local L1_116, L2_117
  L1_116 = worldMaster
  L2_117 = L1_116
  L1_116 = L1_116._getMyPlayer
  L1_116 = L1_116(L2_117)
  L2_117 = L1_116
  L1_116 = L1_116.getInitialTown
  L1_116 = L1_116(L2_117)
  L2_117 = A0_115.getTutorial14Icon
  L2_117 = L2_117(A0_115, L1_116)
  A0_115:setIcon("IconControl_1", L2_117)
  A0_115:setText("TextBlock_Title", 9071)
  A0_115:setText("TextBlock_Text_1", 9074)
  A0_115:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard15(A0_118)
  local L1_119, L2_120, L3_121, L4_122
  L1_119 = worldMaster
  L2_120 = L1_119
  L1_119 = L1_119._getMyPlayer
  L1_119 = L1_119(L2_120)
  L2_120 = L1_119
  L1_119 = L1_119.getInitialTown
  L1_119 = L1_119(L2_120)
  L3_121 = A0_118
  L2_120 = A0_118.getTutorial15TownNPC
  L4_122 = L1_119
  L4_122 = L2_120(L3_121, L4_122)
  A0_118:setText("TextBlock_Title", 9076)
  A0_118:setText("TextBlock_Text_1", 9079, L2_120, L3_121, L4_122)
  A0_118:initWidgetWithButton()
end
function TutorialWidget.setTextKeyboard16(A0_123)
  local L1_124, L2_125
  L1_124 = worldMaster
  L2_125 = L1_124
  L1_124 = L1_124._getMyPlayer
  L1_124 = L1_124(L2_125)
  L2_125 = L1_124
  L1_124 = L1_124.getInitialTown
  L1_124 = L1_124(L2_125)
  L2_125 = A0_123.getTutorial16Icon
  L2_125 = L2_125(A0_123, L1_124)
  A0_123:setControlUserWorkInt(1, "CustomControl_1", L2_125)
  A0_123:setText("TextBlock_Title", 9081)
  A0_123:setText("TextBlock_Text_1", 9084)
  A0_123:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard17(A0_126)
  local L1_127, L2_128, L3_129, L4_130
  L1_127 = worldMaster
  L2_128 = L1_127
  L1_127 = L1_127._getMyPlayer
  L1_127 = L1_127(L2_128)
  L2_128 = L1_127
  L1_127 = L1_127.getInitialTown
  L1_127 = L1_127(L2_128)
  L3_129 = A0_126
  L2_128 = A0_126.getTutorial2TownNPC
  L4_130 = L1_127
  L4_130 = L2_128(L3_129, L4_130)
  A0_126:setText("TextBlock_Title", 9006)
  A0_126:setText("TextBlock_Text_1", 9009, L2_128, L3_129, L4_130)
  A0_126:initWidgetNoButton()
end
function TutorialWidget.setTextKeyboard18(A0_131)
  A0_131:setText("TextBlock_Title", 9086)
  A0_131:setText("TextBlock_Text_1", 9089)
  A0_131:initWidgetNoButton()
end
function TutorialWidget.getTutorial2TownNPC(A0_132, A1_133)
  local L2_134, L3_135, L4_136, L5_137, L6_138, L7_139
  L2_134 = 0
  L3_135, L4_136 = nil, nil
  L5_137 = A1_133
  if L5_137 == 1 then
    L2_134 = 1600150
    L3_135 = 1
    L4_136 = 1
    break
  else
  end
  if L5_137 == 2 then
    L2_134 = 2300120
    L3_135 = 2
    L4_136 = 1
    break
  else
  end
  if L5_137 == 3 then
    L2_134 = 1100003
    L3_135 = 2
    L4_136 = 1
    do break end
    break
  else
  end
  L5_137 = L2_134
  L6_138 = L3_135
  L7_139 = L4_136
  return L5_137, L6_138, L7_139
end
function TutorialWidget.getTutorial7TownMob(A0_140, A1_141)
  local L2_142, L3_143, L4_144, L5_145, L6_146, L7_147
  L2_142 = 0
  L3_143, L4_144 = nil, nil
  L5_145 = A1_141
  if L5_145 == 1 then
    L2_142 = 3205403
    L3_143 = 3
    L4_144 = 2
    break
  else
  end
  if L5_145 == 2 then
    L2_142 = 3201406
    L3_143 = 3
    L4_144 = 2
    break
  else
  end
  if L5_145 == 3 then
    L2_142 = 3203301
    L3_143 = 3
    L4_144 = 1
    do break end
    break
  else
  end
  L5_145 = L2_142
  L6_146 = L3_143
  L7_147 = L4_144
  return L5_145, L6_146, L7_147
end
function TutorialWidget.getTutorial10SkillIcon(A0_148, A1_149)
  local L2_150, L3_151
  L2_150 = 0
  L3_151 = A1_149
  if L3_151 == 22 then
    L2_150 = 582
    break
  else
  end
  if L3_151 == 23 then
    L2_150 = 581
    do break end
    break
  else
  end
  return L2_150
end
function TutorialWidget.getTutorial11SkillIcon(A0_152, A1_153)
  local L2_154, L3_155
  L2_154 = 583
  L3_155 = A1_153
  if L3_155 == 39 then
    L2_154 = 938
    break
  else
  end
  if L3_155 == 40 then
    L2_154 = 972
    break
  else
  end
  if L3_155 == 41 then
    L2_154 = 973
    break
  elseif L3_155 == 29 then
  elseif L3_155 == 30 then
  elseif L3_155 == 31 then
  elseif L3_155 == 32 then
  elseif L3_155 == 33 then
  elseif L3_155 == 34 then
  elseif L3_155 == 35 then
  else
    if L3_155 == 36 then
      do break end
      break
    else
    end
  end
  return L2_154
end
function TutorialWidget.getTutorial13SkillIcon(A0_156, A1_157)
  local L2_158, L3_159
  L2_158 = 0
  L3_159 = A1_157
  if L3_159 == 2 then
    L2_158 = 590
    break
  else
  end
  if L3_159 == 3 then
    L2_158 = 591
    break
  else
  end
  if L3_159 == 4 then
    L2_158 = 592
    break
  else
  end
  if L3_159 == 7 then
    L2_158 = 594
    break
  else
  end
  if L3_159 == 8 then
    L2_158 = 593
    do break end
    break
  else
  end
  return L2_158
end
function TutorialWidget.getTutorial14Icon(A0_160, A1_161)
  local L2_162, L3_163
  L2_162 = 0
  L3_163 = A1_161
  if L3_163 == 1 then
    L2_162 = 611
    break
  else
  end
  if L3_163 == 2 then
    L2_162 = 612
    break
  else
  end
  if L3_163 == 3 then
    L2_162 = 613
    do break end
    break
  else
  end
  return L2_162
end
function TutorialWidget.getTutorial15TownNPC(A0_164, A1_165)
  local L2_166, L3_167, L4_168, L5_169, L6_170, L7_171
  L2_166 = 0
  L3_167, L4_168 = nil, nil
  L5_169 = A1_165
  if L5_169 == 1 then
    L2_166 = 1000015
    L3_167 = 1
    L4_168 = 1
    break
  else
  end
  if L5_169 == 2 then
    L2_166 = 1300018
    L3_167 = 2
    L4_168 = 1
    break
  else
  end
  if L5_169 == 3 then
    L2_166 = 1500014
    L3_167 = 2
    L4_168 = 1
    do break end
    break
  else
  end
  L5_169 = L2_166
  L6_170 = L3_167
  L7_171 = L4_168
  return L5_169, L6_170, L7_171
end
function TutorialWidget.getTutorial16Icon(A0_172, A1_173)
  local L2_174, L3_175
  L2_174 = 0
  L3_175 = A1_173
  if L3_175 == 1 then
    L2_174 = 620
    break
  else
  end
  if L3_175 == 2 then
    L2_174 = 626
    break
  else
  end
  if L3_175 == 3 then
    L2_174 = 632
    do break end
    break
  else
  end
  return L2_174
end
function TutorialWidget.initWidgetWithButton(A0_176)
  A0_176:setModal(true)
  A0_176:setProperty("Focusable", true)
  A0_176:enableButtonGrid()
end
function TutorialWidget.initWidgetNoButton(A0_177)
  A0_177.work.autoAnim = true
  A0_177:setProperty("Focusable", false)
  A0_177:disableButtonGrid()
end
function TutorialWidget.enableButtonGrid(A0_178)
  A0_178:setConfirmCondition("Button_OK")
  A0_178:setContent("Button_OK", 9095)
  A0_178:setVisibility("Grid_Button", true)
end
function TutorialWidget.disableButtonGrid(A0_179)
  A0_179:setVisibility("Grid_Button", false)
end
