require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man0g0", "ScenarioBaseClass")
function Man0g0.initText(A0_0)
  A0_0:_loadTextDataPermanently(391, "man0g0")
end
function Man0g0.processEvent000_0(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startHQCutScene("MAN0G000", 1)
  A0_1:startFadeInCutSceneDefault(A1_2)
end
function Man0g0.processEvent000_1(A0_4, A1_5, A2_6)
  A2_6:say(A0_4, 52, 0)
end
function Man0g0.processEvent000_2(A0_7, A1_8, A2_9)
  A2_9:say(A0_7, 54, 0)
end
function Man0g0.processEvent000_3(A0_10, A1_11, A2_12)
  A2_12:say(A0_10, 53, 0)
end
function Man0g0.processEvent000_4(A0_13, A1_14, A2_15)
  worldMaster:say(A0_13, 55)
end
function Man0g0.processEvent010_1(A0_16, A1_17, A2_18)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:closeTutorialWidget()
  desktopWidget:orderDesktopWidgetMode(16)
end
function Man0g0.processEvent020_1(A0_19, A1_20, A2_21)
  local L3_22, L4_23, L5_24, L6_25, L7_26, L8_27
  L4_23 = A0_19
  L3_22 = A0_19.startFadeOutCutSceneDefault
  L5_24 = A1_20
  L3_22(L4_23, L5_24)
  L4_23 = A0_19
  L3_22 = A0_19.setMusic
  L5_24 = A1_20
  L6_25 = 7
  L7_26 = 2
  L3_22(L4_23, L5_24, L6_25, L7_26)
  L4_23 = A0_19
  L3_22 = A0_19.startHQCutScene
  L5_24 = "MAN0G020"
  L6_25 = 3
  L3_22(L4_23, L5_24, L6_25)
  L4_23 = A0_19
  L3_22 = A0_19.startHQCutScene
  L5_24 = "MAN0G030"
  L6_25 = 7
  L3_22(L4_23, L5_24, L6_25)
  L3_22 = desktopWidget
  L4_23 = L3_22
  L3_22 = L3_22.openPublicInformDialogWidget
  L5_24 = worldMaster
  L6_25 = 25117
  L7_26 = 11000088
  L8_27 = 1
  L3_22(L4_23, L5_24, L6_25, L7_26, L8_27)
  L3_22 = worldMaster
  L4_23 = L3_22
  L3_22 = L3_22.notify
  L5_24 = worldMaster
  L6_25 = 25117
  L7_26 = 11000088
  L8_27 = 1
  L3_22(L4_23, L5_24, L6_25, L7_26, L8_27)
  L4_23 = A0_19
  L3_22 = A0_19._wait
  L5_24 = 5
  L3_22(L4_23, L5_24)
  L3_22 = worldMaster
  L4_23 = L3_22
  L3_22 = L3_22.say
  L5_24 = A0_19
  L6_25 = 101
  L3_22(L4_23, L5_24, L6_25)
  L3_22 = worldMaster
  L4_23 = L3_22
  L3_22 = L3_22.say
  L5_24 = A0_19
  L6_25 = 102
  L3_22(L4_23, L5_24, L6_25)
  L3_22 = worldMaster
  L4_23 = L3_22
  L3_22 = L3_22.say
  L5_24 = A0_19
  L6_25 = 103
  L3_22(L4_23, L5_24, L6_25)
  L3_22 = false
  L4_23 = false
  L5_24 = false
  L6_25 = true
  L7_26 = true
  L8_27 = 3
  desktopWidget:setTutorialMask(L3_22, L4_23, L5_24, L6_25, L7_26, L8_27)
  A0_19:startFadeInCutSceneAfterWarp(A1_20)
end
function Man0g0.processEvent020_2(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:_runCharaScheduler(354082816)
  A2_30:say(A0_28, 56, 0)
  A2_30:say(A0_28, 57, 0)
  A2_30:finishCliantTalkTurn()
end
function Man0g0.processEvent020_3(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:_runCharaScheduler(69193728)
  A2_33:say(A0_31, 58, 0)
  A2_33:_runCharaScheduler(353964032)
  A2_33:say(A0_31, 59, 0)
  A2_33:finishCliantTalkTurn()
end
function Man0g0.processEvent020_4(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:_runCharaScheduler(353964032)
  A2_36:say(A0_34, 60, 0)
  A2_36:finishCliantTalkTurn()
end
function Man0g0.processEvent020_5(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 61, 0)
  A2_39:_runCharaScheduler(353964032)
  A2_39:say(A0_37, 62, 0)
  A2_39:finishCliantTalkTurn()
end
function Man0g0.processEvent020_6(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:_runCharaScheduler(353959936)
  A2_42:say(A0_40, 95, 0)
  A2_42:say(A0_40, 96, 0)
  A2_42:finishCliantTalkTurn()
end
function Man0g0.processTtrNomal001withHQ(A0_43, A1_44, A2_45)
  local L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56, L14_57, L15_58, L16_59, L17_60
  L5_48 = A1_44
  L4_47 = A1_44._lockCameraControl
  L4_47(L5_48)
  L4_47 = desktopWidget
  L5_48 = L4_47
  L4_47 = L4_47.orderTutorialMode
  L4_47(L5_48)
  L4_47 = desktopWidget
  L5_48 = L4_47
  L4_47 = L4_47.orderDesktopWidgetMode
  L6_49 = 62
  L4_47(L5_48, L6_49)
  L4_47 = true
  L5_48 = true
  L6_49 = true
  L7_50 = true
  L8_51 = true
  L9_52 = 4
  L10_53 = desktopWidget
  L11_54 = L10_53
  L10_53 = L10_53.setTutorialMask
  L12_55 = L4_47
  L13_56 = L5_48
  L14_57 = L6_49
  L15_58 = L7_50
  L16_59 = L8_51
  L17_60 = L9_52
  L10_53(L11_54, L12_55, L13_56, L14_57, L15_58, L16_59, L17_60)
  L11_54 = A1_44
  L10_53 = A1_44._fadeInNowLoadingForNoticeEventJustInArea
  L10_53(L11_54)
  L11_54 = A0_43
  L10_53 = A0_43.startFadeOut
  L12_55 = A1_44
  L13_56 = 0
  L10_53(L11_54, L12_55, L13_56)
  L11_54 = A0_43
  L10_53 = A0_43._wait
  L12_55 = 1
  L10_53(L11_54, L12_55)
  L10_53 = false
  L11_54 = worldMaster
  L12_55 = L11_54
  L11_54 = L11_54._isKeyboardOnlyTutorial
  L11_54 = L11_54(L12_55)
  while L10_53 == false do
    L12_55 = desktopWidget
    L13_56 = L12_55
    L12_55 = L12_55.askTutorialDeviceType
    L12_55 = L12_55(L13_56)
    L3_46 = L12_55
    L13_56 = A0_43
    L12_55 = A0_43._wait
    L14_57 = 3
    L12_55(L13_56, L14_57)
    L12_55 = worldMaster
    L13_56 = L12_55
    L12_55 = L12_55._isKeyboardOnlyTutorial
    L12_55 = L12_55(L13_56)
    if L12_55 ~= L11_54 then
      L12_55 = worldMaster
      L13_56 = L12_55
      L12_55 = L12_55._isKeyboardOnlyTutorial
      L12_55 = L12_55(L13_56)
      L11_54 = L12_55
      L10_53 = false
    else
      L10_53 = true
    end
  end
  L13_56 = A0_43
  L12_55 = A0_43.startHQCutScene
  L14_57 = "MAN0G000"
  L15_58 = 3
  L12_55(L13_56, L14_57, L15_58)
  L13_56 = A0_43
  L12_55 = A0_43.startNQCutScene
  L14_57 = "man0g005"
  L15_58 = 3
  L12_55(L13_56, L14_57, L15_58)
  L13_56 = A1_44
  L12_55 = A1_44._waitForMapLoaded
  L14_57 = nil
  L12_55(L13_56, L14_57)
  L13_56 = A1_44
  L12_55 = A1_44._fadeIn
  L14_57 = 5
  L12_55(L13_56, L14_57)
  L13_56 = A0_43
  L12_55 = A0_43._wait
  L14_57 = 4
  L12_55(L13_56, L14_57)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.cancelDesktopWidgetMode
  L14_57 = 61
  L12_55(L13_56, L14_57)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.openPublicInformDialogWidget
  L14_57 = A0_43
  L15_58 = 94
  L12_55(L13_56, L14_57, L15_58)
  L13_56 = A1_44
  L12_55 = A1_44._waitForFading
  L12_55(L13_56)
  L13_56 = A0_43
  L12_55 = A0_43._wait
  L14_57 = 2
  L12_55(L13_56, L14_57)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.orderDesktopWidgetMode
  L14_57 = 16
  L12_55(L13_56, L14_57)
  L13_56 = A0_43
  L12_55 = A0_43.sayFreeDisplayName
  L14_57 = 2300120
  L15_58 = A0_43
  L16_59 = 72
  L12_55(L13_56, L14_57, L15_58, L16_59)
  L13_56 = A0_43
  L12_55 = A0_43._wait
  L14_57 = 0.5
  L12_55(L13_56, L14_57)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.cancelDesktopWidgetMode
  L14_57 = 16
  L12_55(L13_56, L14_57)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.openTutorialWidget
  L14_57 = L3_46
  L15_58 = 1
  L12_55(L13_56, L14_57, L15_58)
  L13_56 = A1_44
  L12_55 = A1_44._unlockCameraControl
  L12_55(L13_56)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55._waitForCameraTutorial
  L12_55(L13_56)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.closeTutorialWidget
  L12_55(L13_56)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.openTutorialSuccessWidget
  L14_57 = 9005
  L15_58 = true
  L12_55(L13_56, L14_57, L15_58)
  L13_56 = A0_43
  L12_55 = A0_43._wait
  L14_57 = 3
  L12_55(L13_56, L14_57)
  L13_56 = A1_44
  L12_55 = A1_44._lockCameraControl
  L12_55(L13_56)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55.orderDesktopWidgetMode
  L14_57 = 16
  L12_55(L13_56, L14_57)
  L12_55 = worldMaster
  L13_56 = L12_55
  L12_55 = L12_55._aimCameraTutorial
  L14_57 = 2300120
  L12_55(L13_56, L14_57)
  L13_56 = A0_43
  L12_55 = A0_43.sayFreeDisplayName
  L14_57 = 2300120
  L15_58 = A0_43
  L16_59 = 74
  L12_55(L13_56, L14_57, L15_58, L16_59)
  L12_55 = desktopWidget
  L13_56 = L12_55
  L12_55 = L12_55._setTargetCharacter
  L14_57 = 1
  L15_58 = nil
  L12_55(L13_56, L14_57, L15_58)
  L12_55 = true
  L13_56 = true
  L14_57 = true
  L15_58 = true
  L16_59 = true
  L17_60 = 1
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_46, 5)
  desktopWidget:setTutorialMask(L12_55, L13_56, L14_57, L15_58, L16_59, L17_60)
  A1_44:_unlockCameraControl()
  worldMaster:_cancelAimCameraTutorial(2300120)
  return L3_46
end
function Man0g0.processTtrNomal001(A0_61, A1_62, A2_63)
  local L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74, L14_75, L15_76, L16_77, L17_78
  L5_66 = A1_62
  L4_65 = A1_62._lockCameraControl
  L4_65(L5_66)
  L4_65 = desktopWidget
  L5_66 = L4_65
  L4_65 = L4_65.isTutorialMode
  L4_65 = L4_65(L5_66)
  if L4_65 == false then
    L4_65 = desktopWidget
    L5_66 = L4_65
    L4_65 = L4_65.orderTutorialMode
    L4_65(L5_66)
  end
  L4_65 = desktopWidget
  L5_66 = L4_65
  L4_65 = L4_65.orderDesktopWidgetMode
  L6_67 = 62
  L4_65(L5_66, L6_67)
  L4_65 = true
  L5_66 = true
  L6_67 = true
  L7_68 = true
  L8_69 = true
  L9_70 = 4
  L10_71 = desktopWidget
  L11_72 = L10_71
  L10_71 = L10_71.setTutorialMask
  L12_73 = L4_65
  L13_74 = L5_66
  L14_75 = L6_67
  L15_76 = L7_68
  L16_77 = L8_69
  L17_78 = L9_70
  L10_71(L11_72, L12_73, L13_74, L14_75, L15_76, L16_77, L17_78)
  L11_72 = A1_62
  L10_71 = A1_62._fadeInNowLoadingForNoticeEventJustInArea
  L10_71(L11_72)
  L11_72 = A0_61
  L10_71 = A0_61.startFadeOut
  L12_73 = A1_62
  L13_74 = 0
  L10_71(L11_72, L12_73, L13_74)
  L11_72 = A0_61
  L10_71 = A0_61._wait
  L12_73 = 1
  L10_71(L11_72, L12_73)
  L10_71 = false
  L11_72 = worldMaster
  L12_73 = L11_72
  L11_72 = L11_72._isKeyboardOnlyTutorial
  L11_72 = L11_72(L12_73)
  while L10_71 == false do
    L12_73 = desktopWidget
    L13_74 = L12_73
    L12_73 = L12_73.askTutorialDeviceType
    L12_73 = L12_73(L13_74)
    L3_64 = L12_73
    L13_74 = A0_61
    L12_73 = A0_61._wait
    L14_75 = 3
    L12_73(L13_74, L14_75)
    L12_73 = worldMaster
    L13_74 = L12_73
    L12_73 = L12_73._isKeyboardOnlyTutorial
    L12_73 = L12_73(L13_74)
    if L12_73 ~= L11_72 then
      L12_73 = worldMaster
      L13_74 = L12_73
      L12_73 = L12_73._isKeyboardOnlyTutorial
      L12_73 = L12_73(L13_74)
      L11_72 = L12_73
      L10_71 = false
    else
      L10_71 = true
    end
  end
  L13_74 = A0_61
  L12_73 = A0_61.startNQCutScene
  L14_75 = "man0g005"
  L15_76 = 3
  L12_73(L13_74, L14_75, L15_76)
  L13_74 = A1_62
  L12_73 = A1_62._waitForMapLoaded
  L14_75 = nil
  L12_73(L13_74, L14_75)
  L13_74 = A1_62
  L12_73 = A1_62._fadeIn
  L14_75 = 5
  L12_73(L13_74, L14_75)
  L13_74 = A0_61
  L12_73 = A0_61._wait
  L14_75 = 4
  L12_73(L13_74, L14_75)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.cancelDesktopWidgetMode
  L14_75 = 61
  L12_73(L13_74, L14_75)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.openPublicInformDialogWidget
  L14_75 = A0_61
  L15_76 = 94
  L12_73(L13_74, L14_75, L15_76)
  L13_74 = A1_62
  L12_73 = A1_62._waitForFading
  L12_73(L13_74)
  L13_74 = A0_61
  L12_73 = A0_61._wait
  L14_75 = 2
  L12_73(L13_74, L14_75)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.orderDesktopWidgetMode
  L14_75 = 16
  L12_73(L13_74, L14_75)
  L13_74 = A0_61
  L12_73 = A0_61.sayFreeDisplayName
  L14_75 = 2300120
  L15_76 = A0_61
  L16_77 = 72
  L12_73(L13_74, L14_75, L15_76, L16_77)
  L13_74 = A0_61
  L12_73 = A0_61._wait
  L14_75 = 0.5
  L12_73(L13_74, L14_75)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.cancelDesktopWidgetMode
  L14_75 = 16
  L12_73(L13_74, L14_75)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.openTutorialWidget
  L14_75 = L3_64
  L15_76 = 1
  L12_73(L13_74, L14_75, L15_76)
  L13_74 = A1_62
  L12_73 = A1_62._unlockCameraControl
  L12_73(L13_74)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73._waitForCameraTutorial
  L12_73(L13_74)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.closeTutorialWidget
  L12_73(L13_74)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.openTutorialSuccessWidget
  L14_75 = 9005
  L15_76 = true
  L12_73(L13_74, L14_75, L15_76)
  L13_74 = A0_61
  L12_73 = A0_61._wait
  L14_75 = 3
  L12_73(L13_74, L14_75)
  L13_74 = A1_62
  L12_73 = A1_62._lockCameraControl
  L12_73(L13_74)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73.orderDesktopWidgetMode
  L14_75 = 16
  L12_73(L13_74, L14_75)
  L12_73 = worldMaster
  L13_74 = L12_73
  L12_73 = L12_73._aimCameraTutorial
  L14_75 = 2300120
  L12_73(L13_74, L14_75)
  L13_74 = A0_61
  L12_73 = A0_61.sayFreeDisplayName
  L14_75 = 2300120
  L15_76 = A0_61
  L16_77 = 74
  L12_73(L13_74, L14_75, L15_76, L16_77)
  L12_73 = desktopWidget
  L13_74 = L12_73
  L12_73 = L12_73._setTargetCharacter
  L14_75 = 1
  L15_76 = nil
  L12_73(L13_74, L14_75, L15_76)
  L12_73 = true
  L13_74 = true
  L14_75 = true
  L15_76 = true
  L16_77 = true
  L17_78 = 1
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_64, 5)
  desktopWidget:setTutorialMask(L12_73, L13_74, L14_75, L15_76, L16_77, L17_78)
  A1_62:_unlockCameraControl()
  worldMaster:_cancelAimCameraTutorial(2300120)
  return L3_64
end
function Man0g0.processTtrNomal002(A0_79, A1_80, A2_81, A3_82)
  local L4_83, L5_84, L6_85, L7_86, L8_87, L9_88
  L4_83 = desktopWidget
  L5_84 = L4_83
  L4_83 = L4_83.cancelDesktopWidgetMode
  L6_85 = 16
  L4_83(L5_84, L6_85)
  L4_83 = desktopWidget
  L5_84 = L4_83
  L4_83 = L4_83.closeTutorialWidget
  L4_83(L5_84)
  L5_84 = A0_79
  L4_83 = A0_79._wait
  L6_85 = 0.5
  L4_83(L5_84, L6_85)
  L4_83 = desktopWidget
  L5_84 = L4_83
  L4_83 = L4_83.openTutorialWidget
  L6_85 = A3_82
  L7_86 = 3
  L4_83(L5_84, L6_85, L7_86)
  L4_83 = true
  L5_84 = false
  L6_85 = true
  L7_86 = true
  L8_87 = true
  L9_88 = 4
  desktopWidget:setTutorialMask(L4_83, L5_84, L6_85, L7_86, L8_87, L9_88)
  desktopWidget:_unlockTargetCursorControl()
  A1_80:_unlockLockonControl()
  A1_80:_unlockPlayerControl()
  desktopWidget:_waitForTargetTutorial(2300120)
  L4_83 = true
  L5_84 = true
  L6_85 = true
  L7_86 = true
  L8_87 = true
  L9_88 = 4
  desktopWidget:setTutorialMask(L4_83, L5_84, L6_85, L7_86, L8_87, L9_88)
  desktopWidget:closeTutorialWidget()
  desktopWidget:_lockTargetCursorControl()
  desktopWidget:orderDesktopWidgetMode(16)
  A1_80:_lockPlayerControl()
  A1_80:_lockLockonControl()
  desktopWidget:cancelDesktopWidgetMode(16)
  A0_79:_wait(0.5)
  desktopWidget:openTutorialWidget(A3_82, 4)
  L4_83 = true
  L5_84 = true
  L6_85 = false
  L7_86 = true
  L8_87 = true
  L9_88 = 4
  desktopWidget:setTutorialMask(L4_83, L5_84, L6_85, L7_86, L8_87, L9_88)
end
function Man0g0.processTtrNomal003(A0_89, A1_90, A2_91, A3_92)
  local L4_93, L5_94, L6_95, L7_96, L8_97, L9_98
  L4_93 = desktopWidget
  L5_94 = L4_93
  L4_93 = L4_93.closeTutorialWidget
  L4_93(L5_94)
  L5_94 = A0_89
  L4_93 = A0_89._wait
  L6_95 = 0.5
  L4_93(L5_94, L6_95)
  L5_94 = A2_91
  L4_93 = A2_91.say
  L6_95 = A0_89
  L7_96 = 76
  L8_97 = 0
  L4_93(L5_94, L6_95, L7_96, L8_97)
  L4_93 = desktopWidget
  L5_94 = L4_93
  L4_93 = L4_93._setTargetCharacter
  L6_95 = 1
  L7_96 = nil
  L4_93(L5_94, L6_95, L7_96)
  L4_93 = desktopWidget
  L5_94 = L4_93
  L4_93 = L4_93.cancelDesktopWidgetMode
  L6_95 = 16
  L4_93(L5_94, L6_95)
  L4_93 = desktopWidget
  L5_94 = L4_93
  L4_93 = L4_93.openTutorialSuccessWidget
  L6_95 = 9020
  L7_96 = true
  L4_93(L5_94, L6_95, L7_96)
  L5_94 = A0_89
  L4_93 = A0_89._wait
  L6_95 = 3
  L4_93(L5_94, L6_95)
  L4_93 = false
  L5_94 = false
  L6_95 = false
  L7_96 = true
  L8_97 = true
  L9_98 = 3
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(A3_92, 14)
  desktopWidget:setTutorialMask(L4_93, L5_94, L6_95, L7_96, L8_97, L9_98)
end
function Man0g0.processTtrMini001(A0_99, A1_100, A2_101)
  A2_101:startCliantTalkTurn(2, A1_100)
  A2_101:_runCharaScheduler(353964032)
  A2_101:say(A0_99, 10, 0)
  A2_101:say(A0_99, 11, 0)
  A2_101:finishCliantTalkTurn()
end
function Man0g0.processTtrMini002(A0_102, A1_103, A2_104)
  A2_104:startCliantTalkTurn(2, A1_103)
  A2_104:_runCharaScheduler(83992576)
  A2_104:say(A0_102, 66, 0)
  A2_104:finishCliantTalkTurn()
end
function Man0g0.processTtrMini003(A0_105, A1_106, A2_107)
  A2_107:startCliantTalkTurn(2, A1_106)
  A2_107:_runCharaScheduler(353959936)
  A2_107:say(A0_105, 72, 0)
  A2_107:say(A0_105, 73, 0)
  A2_107:finishCliantTalkTurn()
end
function Man0g0.processTtrAfterBtl001(A0_108, A1_109, A2_110)
  local L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117, L10_118, L11_119
  L3_111 = desktopWidget
  L4_112 = L3_111
  L3_111 = L3_111.isTutorialMode
  L3_111 = L3_111(L4_112)
  if L3_111 == false then
    L3_111 = desktopWidget
    L4_112 = L3_111
    L3_111 = L3_111.orderTutorialMode
    L3_111(L4_112)
  end
  L4_112 = A1_109
  L3_111 = A1_109._fadeInNowLoadingForNoticeEventJustInArea
  L3_111(L4_112)
  L3_111 = desktopWidget
  L4_112 = L3_111
  L3_111 = L3_111.cancelDesktopWidgetMode
  L5_113 = 16
  L3_111(L4_112, L5_113)
  L3_111 = desktopWidget
  L4_112 = L3_111
  L3_111 = L3_111.closeTutorialWidget
  L3_111(L4_112)
  L3_111 = nil
  L4_112 = false
  L5_113 = worldMaster
  L6_114 = L5_113
  L5_113 = L5_113._isKeyboardOnlyTutorial
  L5_113 = L5_113(L6_114)
  while L4_112 == false do
    L6_114 = desktopWidget
    L7_115 = L6_114
    L6_114 = L6_114.askTutorialDeviceType
    L6_114 = L6_114(L7_115)
    L3_111 = L6_114
    L7_115 = A0_108
    L6_114 = A0_108._wait
    L8_116 = 3
    L6_114(L7_115, L8_116)
    L6_114 = worldMaster
    L7_115 = L6_114
    L6_114 = L6_114._isKeyboardOnlyTutorial
    L6_114 = L6_114(L7_115)
    if L6_114 ~= L5_113 then
      L6_114 = worldMaster
      L7_115 = L6_114
      L6_114 = L6_114._isKeyboardOnlyTutorial
      L6_114 = L6_114(L7_115)
      L5_113 = L6_114
      L4_112 = false
    else
      L4_112 = true
    end
  end
  L6_114 = false
  L7_115 = false
  L8_116 = false
  L9_117 = true
  L10_118 = true
  L11_119 = 3
  desktopWidget:closeTutorialWidget()
  desktopWidget:setTutorialMask(L6_114, L7_115, L8_116, L9_117, L10_118, L11_119)
  return L3_111
end
function Man0g0.processTtrBtl001(A0_120, A1_121, A2_122, A3_123)
  local L4_124, L5_125, L6_126, L7_127, L8_128, L9_129
  L4_124 = desktopWidget
  L5_125 = L4_124
  L4_124 = L4_124.closeTutorialWidget
  L4_124(L5_125)
  L5_125 = A0_120
  L4_124 = A0_120.startHQCutScene
  L6_126 = "MAN0G010"
  L7_127 = 1
  L4_124(L5_125, L6_126, L7_127)
  L5_125 = A0_120
  L4_124 = A0_120.startFadeInCutSceneDefault
  L6_126 = A1_121
  L4_124(L5_125, L6_126)
  L5_125 = A0_120
  L4_124 = A0_120.setMusic
  L6_126 = A1_121
  L7_127 = 13
  L8_128 = 1
  L4_124(L5_125, L6_126, L7_127, L8_128)
  L5_125 = A0_120
  L4_124 = A0_120._wait
  L6_126 = 2
  L4_124(L5_125, L6_126)
  L4_124 = worldMaster
  L5_125 = L4_124
  L4_124 = L4_124._aimCameraTutorial
  L6_126 = 2300120
  L4_124(L5_125, L6_126)
  L4_124 = worldMaster
  L5_125 = L4_124
  L4_124 = L4_124._lookAtPlayerTutorial
  L6_126 = 2300120
  L4_124(L5_125, L6_126)
  L4_124 = worldMaster
  L5_125 = L4_124
  L4_124 = L4_124._runCharaSchedulerTutorial
  L6_126 = 2300120
  L7_127 = 403087360
  L4_124(L5_125, L6_126, L7_127)
  L4_124 = worldMaster
  L5_125 = L4_124
  L4_124 = L4_124._runCharaSchedulerTutorial
  L6_126 = 2300120
  L7_127 = 403087360
  L4_124(L5_125, L6_126, L7_127)
  L5_125 = A0_120
  L4_124 = A0_120.sayFreeDisplayName
  L6_126 = 2300120
  L7_127 = A0_120
  L8_128 = 77
  L4_124(L5_125, L6_126, L7_127, L8_128)
  L4_124 = worldMaster
  L5_125 = L4_124
  L4_124 = L4_124._cancelAimCameraTutorial
  L6_126 = 2300120
  L4_124(L5_125, L6_126)
  L4_124 = desktopWidget
  L5_125 = L4_124
  L4_124 = L4_124.cancelDesktopWidgetMode
  L6_126 = 16
  L4_124(L5_125, L6_126)
  L4_124 = true
  L5_125 = true
  L6_126 = true
  L7_127 = false
  L8_128 = true
  L9_129 = 4
  desktopWidget:setTutorialMask(L4_124, L5_125, L6_126, L7_127, L8_128, L9_129)
  desktopWidget:openTutorialWidget(A3_123, 6)
  L4_124 = true
  L5_125 = true
  L6_126 = true
  L7_127 = false
  L8_128 = true
  L9_129 = 4
  desktopWidget:setTutorialMask(L4_124, L5_125, L6_126, L7_127, L8_128, L9_129)
end
function Man0g0.processTtrBtlMagic001(A0_130, A1_131, A2_132, A3_133)
  local L4_134, L5_135, L6_136, L7_137, L8_138, L9_139, L10_140, L11_141, L12_142, L13_143, L14_144, L15_145
  L4_134 = desktopWidget
  L5_135 = L4_134
  L4_134 = L4_134.closeTutorialWidget
  L4_134(L5_135)
  L4_134 = true
  L5_135 = true
  L6_136 = true
  L7_137 = false
  L8_138 = true
  L9_139 = 4
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140.setTutorialMask
  L12_142 = L4_134
  L13_143 = L5_135
  L14_144 = L6_136
  L15_145 = L7_137
  L10_140(L11_141, L12_142, L13_143, L14_144, L15_145, L8_138, L9_139)
  L11_141 = A0_130
  L10_140 = A0_130.startHQCutScene
  L12_142 = "MAN0G010"
  L13_143 = 1
  L10_140(L11_141, L12_142, L13_143)
  L11_141 = A0_130
  L10_140 = A0_130.startFadeInCutSceneDefault
  L12_142 = A1_131
  L10_140(L11_141, L12_142)
  L11_141 = A0_130
  L10_140 = A0_130.setMusic
  L12_142 = A1_131
  L13_143 = 13
  L14_144 = 1
  L10_140(L11_141, L12_142, L13_143, L14_144)
  L11_141 = A0_130
  L10_140 = A0_130._wait
  L12_142 = 2
  L10_140(L11_141, L12_142)
  L10_140 = worldMaster
  L11_141 = L10_140
  L10_140 = L10_140._aimCameraTutorial
  L12_142 = 2300120
  L10_140(L11_141, L12_142)
  L10_140 = worldMaster
  L11_141 = L10_140
  L10_140 = L10_140._lookAtPlayerTutorial
  L12_142 = 2300120
  L10_140(L11_141, L12_142)
  L10_140 = worldMaster
  L11_141 = L10_140
  L10_140 = L10_140._runCharaSchedulerTutorial
  L12_142 = 2300120
  L13_143 = 403087360
  L10_140(L11_141, L12_142, L13_143)
  L10_140 = worldMaster
  L11_141 = L10_140
  L10_140 = L10_140._runCharaSchedulerTutorial
  L12_142 = 2300120
  L13_143 = 403087360
  L10_140(L11_141, L12_142, L13_143)
  L11_141 = A0_130
  L10_140 = A0_130.sayFreeDisplayName
  L12_142 = 2300120
  L13_143 = A0_130
  L14_144 = 120
  L10_140(L11_141, L12_142, L13_143, L14_144)
  L10_140 = worldMaster
  L11_141 = L10_140
  L10_140 = L10_140._cancelAimCameraTutorial
  L12_142 = 2300120
  L10_140(L11_141, L12_142)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140.cancelDesktopWidgetMode
  L12_142 = 16
  L10_140(L11_141, L12_142)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140.openTutorialWidget
  L12_142 = A3_133
  L13_143 = 7
  L10_140(L11_141, L12_142, L13_143)
  L4_134 = true
  L5_135 = false
  L6_136 = true
  L7_137 = true
  L8_138 = true
  L9_139 = 4
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140.setTutorialMask
  L12_142 = L4_134
  L13_143 = L5_135
  L14_144 = L6_136
  L15_145 = L7_137
  L10_140(L11_141, L12_142, L13_143, L14_144, L15_145, L8_138, L9_139)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140.closeAllEventModeWidget
  L10_140(L11_141)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140._unlockTargetCursorControl
  L10_140(L11_141)
  L11_141 = A1_131
  L10_140 = A1_131._unlockLockonControl
  L10_140(L11_141)
  L11_141 = A1_131
  L10_140 = A1_131._unlockPlayerControl
  L10_140(L11_141)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140._waitForTargetTutorial
  L12_142 = 3201406
  L10_140(L11_141, L12_142)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140.closeTutorialWidget
  L10_140(L11_141)
  L11_141 = A0_130
  L10_140 = A0_130._wait
  L12_142 = 1
  L10_140(L11_141, L12_142)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140._lockTargetCursorControl
  L10_140(L11_141)
  L10_140 = desktopWidget
  L11_141 = L10_140
  L10_140 = L10_140.orderDesktopWidgetMode
  L12_142 = 16
  L10_140(L11_141, L12_142)
  L11_141 = A1_131
  L10_140 = A1_131._lockPlayerControl
  L10_140(L11_141)
  L11_141 = A1_131
  L10_140 = A1_131._lockLockonControl
  L10_140(L11_141)
  L10_140 = 1
  L12_142 = A1_131
  L11_141 = A1_131.getStateMainSkill
  L11_141 = L11_141(L12_142)
  L13_143 = A1_131
  L12_142 = A1_131.getSkillCategory
  L14_144 = L11_141
  L12_142 = L12_142(L13_143, L14_144)
  if L12_142 == 21 then
    L10_140 = 3
  elseif L12_142 == 29 or L12_142 == 39 then
    L10_140 = 4
  elseif L11_141 == 7 then
    L10_140 = 2
  else
    L10_140 = 1
  end
  L13_143, L14_144, L15_145 = nil, nil, nil
  if L10_140 == 1 then
    L13_143 = 81
    L14_144 = 85
    L15_145 = 8
  elseif L10_140 == 2 then
    L13_143 = 82
    L14_144 = 86
    L15_145 = 9
  elseif L10_140 == 3 then
    L13_143 = 83
    L14_144 = 87
    L15_145 = 10
  elseif L10_140 == 4 then
    L13_143 = 84
    L14_144 = 88
    L15_145 = 11
  end
  if L10_140 == 3 then
    if L11_141 == 22 then
    else
    end
  else
  end
  desktopWidget:cancelDesktopWidgetMode(16)
  L4_134 = true
  L5_135 = true
  L6_136 = true
  L7_137 = true
  L8_138 = true
  L9_139 = 4
  desktopWidget:setTutorialMask(L4_134, L5_135, L6_136, L7_137, L8_138, L9_139)
  desktopWidget:openTutorialWidget(A3_133, L15_145)
  if L10_140 == 1 then
    L4_134 = false
    L5_135 = false
    L6_136 = false
    L7_137 = false
    L8_138 = false
    L9_139 = 3
  else
    L4_134 = false
    L5_135 = false
    L6_136 = false
    L7_137 = false
    L8_138 = false
    L9_139 = 3
  end
  desktopWidget:setTutorialMask(L4_134, L5_135, L6_136, L7_137, L8_138, L9_139)
end
function Man0g0.processTtrBtl002(A0_146, A1_147, A2_148, A3_149)
  local L4_150, L5_151, L6_152, L7_153, L8_154, L9_155, L10_156, L11_157, L12_158, L13_159, L14_160, L15_161, L16_162, L17_163, L18_164, L19_165, L20_166, L21_167, L22_168
  L4_150 = desktopWidget
  L5_151 = L4_150
  L4_150 = L4_150.cancelDesktopWidgetMode
  L6_152 = 16
  L4_150(L5_151, L6_152)
  L4_150 = desktopWidget
  L5_151 = L4_150
  L4_150 = L4_150.closeTutorialWidget
  L4_150(L5_151)
  L5_151 = A0_146
  L4_150 = A0_146._wait
  L6_152 = 1
  L4_150(L5_151, L6_152)
  L4_150 = desktopWidget
  L5_151 = L4_150
  L4_150 = L4_150.orderDesktopWidgetMode
  L6_152 = 16
  L4_150(L5_151, L6_152)
  L4_150 = worldMaster
  L5_151 = L4_150
  L4_150 = L4_150._aimCameraTutorial
  L6_152 = 1400004
  L4_150(L5_151, L6_152)
  L4_150 = worldMaster
  L5_151 = L4_150
  L4_150 = L4_150._lookAtPlayerTutorial
  L6_152 = 1400004
  L4_150(L5_151, L6_152)
  L4_150 = worldMaster
  L5_151 = L4_150
  L4_150 = L4_150._runCharaSchedulerTutorial
  L6_152 = 1400004
  L7_153 = 403087360
  L4_150(L5_151, L6_152, L7_153)
  L4_150 = worldMaster
  L5_151 = L4_150
  L4_150 = L4_150._runCharaSchedulerTutorial
  L6_152 = 1400004
  L7_153 = 403087360
  L4_150(L5_151, L6_152, L7_153)
  L5_151 = A0_146
  L4_150 = A0_146.sayFreeDisplayName
  L6_152 = 1400004
  L7_153 = A0_146
  L8_154 = 79
  L4_150(L5_151, L6_152, L7_153, L8_154)
  L4_150 = worldMaster
  L5_151 = L4_150
  L4_150 = L4_150._cancelAimCameraTutorial
  L6_152 = 1400004
  L4_150(L5_151, L6_152)
  L4_150 = desktopWidget
  L5_151 = L4_150
  L4_150 = L4_150.cancelDesktopWidgetMode
  L6_152 = 16
  L4_150(L5_151, L6_152)
  L4_150 = desktopWidget
  L5_151 = L4_150
  L4_150 = L4_150.openTutorialWidget
  L6_152 = A3_149
  L7_153 = 7
  L4_150(L5_151, L6_152, L7_153)
  L4_150 = true
  L5_151 = false
  L6_152 = true
  L7_153 = true
  L8_154 = true
  L9_155 = 4
  L10_156 = desktopWidget
  L11_157 = L10_156
  L10_156 = L10_156.setTutorialMask
  L12_158 = L4_150
  L13_159 = L5_151
  L14_160 = L6_152
  L15_161 = L7_153
  L16_162 = L8_154
  L17_163 = L9_155
  L10_156(L11_157, L12_158, L13_159, L14_160, L15_161, L16_162, L17_163)
  L10_156 = desktopWidget
  L11_157 = L10_156
  L10_156 = L10_156.closeAllEventModeWidget
  L10_156(L11_157)
  L10_156 = desktopWidget
  L11_157 = L10_156
  L10_156 = L10_156._unlockTargetCursorControl
  L10_156(L11_157)
  L11_157 = A1_147
  L10_156 = A1_147._unlockLockonControl
  L10_156(L11_157)
  L11_157 = A1_147
  L10_156 = A1_147._unlockPlayerControl
  L10_156(L11_157)
  L10_156 = desktopWidget
  L11_157 = L10_156
  L10_156 = L10_156._waitForTargetTutorial
  L12_158 = 3201406
  L10_156(L11_157, L12_158)
  L10_156 = desktopWidget
  L11_157 = L10_156
  L10_156 = L10_156.closeTutorialWidget
  L10_156(L11_157)
  L11_157 = A0_146
  L10_156 = A0_146._wait
  L12_158 = 1
  L10_156(L11_157, L12_158)
  L10_156 = desktopWidget
  L11_157 = L10_156
  L10_156 = L10_156._lockTargetCursorControl
  L10_156(L11_157)
  L10_156 = desktopWidget
  L11_157 = L10_156
  L10_156 = L10_156.orderDesktopWidgetMode
  L12_158 = 16
  L10_156(L11_157, L12_158)
  L11_157 = A1_147
  L10_156 = A1_147._lockPlayerControl
  L10_156(L11_157)
  L11_157 = A1_147
  L10_156 = A1_147._lockLockonControl
  L10_156(L11_157)
  L10_156 = 1
  L12_158 = A1_147
  L11_157 = A1_147.getStateMainSkill
  L11_157 = L11_157(L12_158)
  L13_159 = A1_147
  L12_158 = A1_147.getSkillCategory
  L14_160 = L11_157
  L12_158 = L12_158(L13_159, L14_160)
  if L12_158 == 21 then
    L10_156 = 3
  elseif L12_158 == 29 or L12_158 == 39 then
    L10_156 = 4
  elseif L11_157 == 7 then
    L10_156 = 2
  else
    L10_156 = 1
  end
  L13_159, L14_160, L15_161 = nil, nil, nil
  if L10_156 == 1 then
    L13_159 = 81
    L14_160 = 85
    L15_161 = 8
  elseif L10_156 == 2 then
    L13_159 = 82
    L14_160 = 86
    L15_161 = 9
  elseif L10_156 == 3 then
    L13_159 = 83
    L14_160 = 87
    L15_161 = 10
  elseif L10_156 == 4 then
    L13_159 = 84
    L14_160 = 88
    L15_161 = 11
  end
  L16_162 = nil
  if L10_156 == 3 then
    if L11_157 == 22 then
      L16_162 = 2
    else
      L16_162 = 1
    end
  else
  end
  L17_163 = desktopWidget
  L18_164 = L17_163
  L17_163 = L17_163.cancelDesktopWidgetMode
  L19_165 = 16
  L17_163(L18_164, L19_165)
  L17_163 = desktopWidget
  L18_164 = L17_163
  L17_163 = L17_163.openTutorialWidget
  L19_165 = A3_149
  L20_166 = L15_161
  L17_163(L18_164, L19_165, L20_166)
  L17_163, L18_164, L19_165, L20_166, L21_167, L22_168 = nil, nil, nil, nil, nil, nil
  if L10_156 == 1 then
    L17_163 = false
    L18_164 = false
    L19_165 = false
    L20_166 = false
    L21_167 = false
    L22_168 = 3
  else
    L17_163 = false
    L18_164 = false
    L19_165 = false
    L20_166 = false
    L21_167 = false
    L22_168 = 3
  end
  desktopWidget:setTutorialMask(L17_163, L18_164, L19_165, L20_166, L21_167, L22_168)
end
function Man0g0.processTtrBtl003(A0_169, A1_170, A2_171)
  local L3_172, L4_173, L5_174, L6_175, L7_176, L8_177, L9_178, L10_179, L11_180
  L3_172 = desktopWidget
  L4_173 = L3_172
  L3_172 = L3_172.cancelDesktopWidgetMode
  L5_174 = 16
  L3_172(L4_173, L5_174)
  L3_172 = desktopWidget
  L4_173 = L3_172
  L3_172 = L3_172.closeTutorialWidget
  L3_172(L4_173)
  L4_173 = A0_169
  L3_172 = A0_169._wait
  L5_174 = 3
  L3_172(L4_173, L5_174)
  L3_172 = 1
  L5_174 = A1_170
  L4_173 = A1_170.getStateMainSkill
  L4_173 = L4_173(L5_174)
  L6_175 = A1_170
  L5_174 = A1_170.getSkillCategory
  L7_176 = L4_173
  L5_174 = L5_174(L6_175, L7_176)
  if L5_174 == 21 then
    L3_172 = 3
  elseif L5_174 == 29 or L5_174 == 39 then
    L3_172 = 4
  elseif L4_173 == 7 then
    L3_172 = 2
  else
    L3_172 = 1
  end
  if L3_172 == 1 or L3_172 == 2 then
    L6_175 = desktopWidget
    L7_176 = L6_175
    L6_175 = L6_175.orderDesktopWidgetMode
    L8_177 = 16
    L6_175(L7_176, L8_177)
    L7_176 = A0_169
    L6_175 = A0_169.sayFreeDisplayName
    L8_177 = 2300120
    L9_178 = A0_169
    L10_179 = 110
    L6_175(L7_176, L8_177, L9_178, L10_179)
    L6_175 = desktopWidget
    L7_176 = L6_175
    L6_175 = L6_175.cancelDesktopWidgetMode
    L8_177 = 16
    L6_175(L7_176, L8_177)
    L6_175 = desktopWidget
    L7_176 = L6_175
    L6_175 = L6_175.openTutorialWidget
    L8_177 = 2
    L9_178 = 1
    L6_175(L7_176, L8_177, L9_178)
    L6_175 = false
    L7_176 = false
    L8_177 = false
    L9_178 = false
    L10_179 = false
    L11_180 = 3
    desktopWidget:setTutorialMask(L6_175, L7_176, L8_177, L9_178, L10_179, L11_180)
  end
end
function Man0g0.processTtrBlkNml001(A0_181, A1_182, A2_183)
  local L3_184, L4_185, L5_186, L6_187, L7_188, L8_189
  L3_184 = desktopWidget
  L4_185 = L3_184
  L3_184 = L3_184.isTutorialMode
  L3_184 = L3_184(L4_185)
  if L3_184 == false then
    L3_184 = desktopWidget
    L4_185 = L3_184
    L3_184 = L3_184.orderTutorialMode
    L3_184(L4_185)
  end
  L3_184 = worldMaster
  L4_185 = L3_184
  L3_184 = L3_184._aimCameraTutorial
  L5_186 = 1600102
  L3_184(L4_185, L5_186)
  L3_184 = worldMaster
  L4_185 = L3_184
  L3_184 = L3_184._lookAtPlayerTutorial
  L5_186 = 1600102
  L3_184(L4_185, L5_186)
  L3_184 = worldMaster
  L4_185 = L3_184
  L3_184 = L3_184._runCharaSchedulerTutorial
  L5_186 = 1600102
  L6_187 = 353972224
  L3_184(L4_185, L5_186, L6_187)
  L3_184 = worldMaster
  L4_185 = L3_184
  L3_184 = L3_184._runCharaSchedulerTutorial
  L5_186 = 1600102
  L6_187 = 403087360
  L3_184(L4_185, L5_186, L6_187)
  L4_185 = A0_181
  L3_184 = A0_181.sayFreeDisplayName
  L5_186 = 1600102
  L6_187 = A0_181
  L7_188 = 97
  L3_184(L4_185, L5_186, L6_187, L7_188)
  L3_184 = worldMaster
  L4_185 = L3_184
  L3_184 = L3_184._cancelLookAtPlayerTutorial
  L5_186 = 1600102
  L3_184(L4_185, L5_186)
  L3_184 = false
  L4_185 = false
  L5_186 = false
  L6_187 = true
  L7_188 = true
  L8_189 = 3
  desktopWidget:setTutorialMask(L3_184, L4_185, L5_186, L6_187, L7_188, L8_189)
  worldMaster:_cancelAimCameraTutorial(1600102)
end
function Man0g0.processTtrBlkNml002(A0_190, A1_191, A2_192)
end
function Man0g0.processTtrBtl004(A0_193, A1_194, A2_195)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:closeTutorialWidget()
  desktopWidget:openTutorialSuccessWidget(4305, true)
  A0_193:_wait(3)
  A0_193:processInformDialogAsQuest(A0_193, 90)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(2, 1)
end
function Man0g0.processInformDialogAsQuest(A0_196, A1_197, A2_198)
  desktopWidget:openPublicInformDialogWidget(A0_196, A1_197, A2_198)
  A0_196:_wait(2)
  desktopWidget:getStaticWidget(8):hide()
end
