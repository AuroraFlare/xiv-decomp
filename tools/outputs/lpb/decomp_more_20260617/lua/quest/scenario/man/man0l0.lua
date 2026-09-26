require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man0l0", "ScenarioBaseClass")
function Man0l0.initText(A0_0)
  A0_0:_loadTextDataPermanently(21, "man0l0")
end
function Man0l0.processEvent000_1(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startHQCutScene("MAN0L000", 1)
  A0_1:startFadeInCutSceneDefault(A1_2)
end
function Man0l0.processEvent000_2(A0_4, A1_5, A2_6)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:closeTutorialWidget()
  desktopWidget:orderDesktopWidgetMode(16)
end
function Man0l0.processEvent000_3(A0_7, A1_8, A2_9)
  local L3_10, L4_11, L5_12, L6_13, L7_14, L8_15
  L4_11 = A0_7
  L3_10 = A0_7.startFadeOutCutSceneDefault
  L5_12 = A1_8
  L3_10(L4_11, L5_12)
  L4_11 = A0_7
  L3_10 = A0_7.startHQCutScene
  L5_12 = "MAN0L020"
  L6_13 = 3
  L3_10(L4_11, L5_12, L6_13)
  L4_11 = A0_7
  L3_10 = A0_7.startHQCutScene
  L5_12 = "MAN0L030"
  L6_13 = 5
  L3_10(L4_11, L5_12, L6_13)
  L4_11 = A0_7
  L3_10 = A0_7.startHQCutScene
  L5_12 = "MAN0L040"
  L6_13 = 7
  L3_10(L4_11, L5_12, L6_13)
  L3_10 = desktopWidget
  L4_11 = L3_10
  L3_10 = L3_10.openPublicInformDialogWidget
  L5_12 = worldMaster
  L6_13 = 25117
  L7_14 = 11000001
  L8_15 = 1
  L3_10(L4_11, L5_12, L6_13, L7_14, L8_15)
  L3_10 = worldMaster
  L4_11 = L3_10
  L3_10 = L3_10.notify
  L5_12 = worldMaster
  L6_13 = 25117
  L7_14 = 11000001
  L8_15 = 1
  L3_10(L4_11, L5_12, L6_13, L7_14, L8_15)
  L4_11 = A0_7
  L3_10 = A0_7._wait
  L5_12 = 5
  L3_10(L4_11, L5_12)
  L3_10 = worldMaster
  L4_11 = L3_10
  L3_10 = L3_10.say
  L5_12 = A0_7
  L6_13 = 120
  L3_10(L4_11, L5_12, L6_13)
  L3_10 = worldMaster
  L4_11 = L3_10
  L3_10 = L3_10.say
  L5_12 = A0_7
  L6_13 = 121
  L3_10(L4_11, L5_12, L6_13)
  L3_10 = worldMaster
  L4_11 = L3_10
  L3_10 = L3_10.say
  L5_12 = A0_7
  L6_13 = 122
  L3_10(L4_11, L5_12, L6_13)
  L3_10 = false
  L4_11 = false
  L5_12 = false
  L6_13 = true
  L7_14 = true
  L8_15 = 3
  desktopWidget:setTutorialMask(L3_10, L4_11, L5_12, L6_13, L7_14, L8_15)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Man0l0.processEvent000_4(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 22, 0)
  A2_18:say(A0_16, 36, 0)
  A2_18:finishCliantTalkTurn()
end
function Man0l0.processEvent000_5(A0_19, A1_20, A2_21)
  A2_21:say(A0_19, 23, 0)
  A2_21:say(A0_19, 37, 0)
end
function Man0l0.processEvent000_6(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 24, 0)
  A2_24:finishCliantTalkTurn()
end
function Man0l0.processEvent000_7(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:_runCharaScheduler(354168832)
  A2_27:say(A0_25, 25, 0)
  A2_27:say(A0_25, 38, 0)
  A2_27:finishCliantTalkTurn()
end
function Man0l0.processEvent000_8(A0_28, A1_29, A2_30)
  A2_30:say(A0_28, 26, 0)
end
function Man0l0.processEvent000_9(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 27, 0)
  A2_33:finishCliantTalkTurn()
end
function Man0l0.processEvent000_10(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:_runCharaScheduler(353959936)
  A2_36:say(A0_34, 28, 0)
  A2_36:finishCliantTalkTurn()
end
function Man0l0.processEvent000_11(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 29, 0)
  A2_39:finishCliantTalkTurn()
end
function Man0l0.processEvent000_12(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:_runCharaScheduler(353959936)
  A2_42:say(A0_40, 30, 0)
  A2_42:finishCliantTalkTurn()
end
function Man0l0.processEvent000_13(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:_runCharaScheduler(354172928)
  A2_45:say(A0_43, 31, 0)
  A2_45:finishCliantTalkTurn()
end
function Man0l0.processEvent000_14(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 32, 0)
  A2_48:say(A0_46, 39, 0)
  A2_48:finishCliantTalkTurn()
end
function Man0l0.processEvent000_15(A0_49, A1_50, A2_51)
  A2_51:say(A0_49, 33, 0)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 40, 0)
  A2_51:finishCliantTalkTurn()
end
function Man0l0.processEvent000_16(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:_runCharaScheduler(354168832)
  A2_54:say(A0_52, 34, 0)
  A2_54:say(A0_52, 41, 0)
  A2_54:finishCliantTalkTurn()
end
function Man0l0.processEvent000_17(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:_runCharaScheduler(354234368)
  A2_57:say(A0_55, 35, 0)
  A2_57:finishCliantTalkTurn()
end
function Man0l0.processEvent020_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 13, 0)
  A2_60:say(A0_58, 14, 0)
  A2_60:finishCliantTalkTurn()
end
function Man0l0.processEvent020_3(A0_61, A1_62, A2_63)
  A2_63:say(A0_61, 15, 0)
end
function Man0l0.processEvent020_4(A0_64, A1_65, A2_66)
  A2_66:say(A0_64, 16, 0)
  A2_66:say(A0_64, 42, 0)
end
function Man0l0.processEvent020_5(A0_67, A1_68, A2_69)
  A2_69:_runCharaScheduler(83910656)
  A2_69:say(A0_67, 17, 0)
end
function Man0l0.processEvent020_6(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:say(A0_70, 18, 0)
  A2_72:finishCliantTalkTurn()
end
function Man0l0.processEvent020_7(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 43, 0)
  A2_75:say(A0_73, 44, 0)
  A2_75:finishCliantTalkTurn()
end
function Man0l0.processEvent020_8(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:say(A0_76, 45, 0)
  A2_78:say(A0_76, 46, 0)
  A2_78:finishCliantTalkTurn()
end
function Man0l0.processEvent020_9(A0_79, A1_80, A2_81)
  A2_81:startCliantTalkTurn(2, A1_80)
  A2_81:_runCharaScheduler(353964032)
  A2_81:say(A0_79, 19, 0)
  A2_81:say(A0_79, 20, 0)
  A2_81:_runCharaScheduler(353972224)
  A2_81:say(A0_79, 21, 0)
  A2_81:finishCliantTalkTurn()
  if A2_81:ask(A0_79, 84, 2) == 1 then
    A2_81:_runCharaScheduler(354000896)
    A2_81:say(A0_79, 88, 0)
    A0_79:startFadeOutCutSceneDefault(A1_80)
  else
    A2_81:_runCharaScheduler(354082816)
    A2_81:say(A0_79, 87, 0)
  end
  return (A2_81:ask(A0_79, 84, 2))
end
function Man0l0.processEvent020_10(A0_82, A1_83, A2_84)
  A2_84:startCliantTalkTurn(2, A1_83)
  A2_84:say(A0_82, 58, 0)
  A2_84:finishCliantTalkTurn()
end
function Man0l0.processEvent020_11(A0_85, A1_86, A2_87)
  A2_87:startCliantTalkTurn(2, A1_86)
  A2_87:say(A0_85, 59, 0)
  A2_87:finishCliantTalkTurn()
end
function Man0l0.processEventNewRectAsk(A0_88, A1_89, A2_90)
  return (A2_90:ask(A0_88, 115, 2))
end
function Man0l0.processEventTalkMenuManCutPreview(A0_91, A1_92, A2_93, A3_94)
  if A3_94 == 102 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l000", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  elseif A3_94 == 103 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l010", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  elseif A3_94 == 105 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l020", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  elseif A3_94 == 104 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l030", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  elseif A3_94 ~= 10001 or nil == 1 then
  elseif nil == 2 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l000", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  elseif nil == 3 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l010", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  elseif nil == 4 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l020", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  elseif nil == 5 then
    A0_91:startFadeOutCutSceneDefault(A1_92)
    A0_91:startHQCutScene("man0l030", 2)
    A0_91:startFadeInCutSceneDefault(A1_92)
  end
end
function Man0l0.processTtrNomal001withHQ(A0_95, A1_96, A2_97)
  local L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104, L10_105, L11_106, L12_107
  L5_100 = A1_96
  L4_99 = A1_96._lockCameraControl
  L4_99(L5_100)
  L4_99 = desktopWidget
  L5_100 = L4_99
  L4_99 = L4_99.orderTutorialMode
  L4_99(L5_100)
  L4_99 = desktopWidget
  L5_100 = L4_99
  L4_99 = L4_99.orderDesktopWidgetMode
  L6_101 = 62
  L4_99(L5_100, L6_101)
  L4_99 = true
  L5_100 = true
  L6_101 = true
  L7_102 = true
  L8_103 = true
  L9_104 = 4
  L10_105 = desktopWidget
  L11_106 = L10_105
  L10_105 = L10_105.setTutorialMask
  L12_107 = L4_99
  L10_105(L11_106, L12_107, L5_100, L6_101, L7_102, L8_103, L9_104)
  L11_106 = A1_96
  L10_105 = A1_96._fadeInNowLoadingForNoticeEventJustInArea
  L10_105(L11_106)
  L11_106 = A0_95
  L10_105 = A0_95.startFadeOut
  L12_107 = A1_96
  L10_105(L11_106, L12_107, 0)
  L11_106 = A0_95
  L10_105 = A0_95._wait
  L12_107 = 1
  L10_105(L11_106, L12_107)
  L10_105 = false
  L11_106 = worldMaster
  L12_107 = L11_106
  L11_106 = L11_106._isKeyboardOnlyTutorial
  L11_106 = L11_106(L12_107)
  while L10_105 == false do
    L12_107 = desktopWidget
    L12_107 = L12_107.askTutorialDeviceType
    L12_107 = L12_107(L12_107)
    L3_98 = L12_107
    L12_107 = A0_95._wait
    L12_107(A0_95, 3)
    L12_107 = worldMaster
    L12_107 = L12_107._isKeyboardOnlyTutorial
    L12_107 = L12_107(L12_107)
    if L12_107 ~= L11_106 then
      L12_107 = worldMaster
      L12_107 = L12_107._isKeyboardOnlyTutorial
      L12_107 = L12_107(L12_107)
      L11_106 = L12_107
      L10_105 = false
    else
      L10_105 = true
    end
  end
  L12_107 = A0_95.startHQCutScene
  L12_107(A0_95, "MAN0L000", 3)
  L12_107 = A0_95.startNQCutScene
  L12_107(A0_95, "man0l005", 3)
  L12_107 = A1_96._waitForMapLoaded
  L12_107(A1_96, nil)
  L12_107 = A1_96._fadeIn
  L12_107(A1_96, 5)
  L12_107 = A0_95._wait
  L12_107(A0_95, 4)
  L12_107 = desktopWidget
  L12_107 = L12_107.cancelDesktopWidgetMode
  L12_107(L12_107, 61)
  L12_107 = desktopWidget
  L12_107 = L12_107.openPublicInformDialogWidget
  L12_107(L12_107, A0_95, 96)
  L12_107 = A1_96._waitForFading
  L12_107(A1_96)
  L12_107 = A0_95._wait
  L12_107(A0_95, 2)
  L12_107 = desktopWidget
  L12_107 = L12_107.orderDesktopWidgetMode
  L12_107(L12_107, 16)
  L12_107 = worldMaster
  L12_107 = L12_107._runCharaSchedulerTutorial
  L12_107(L12_107, 1600150, 354086912)
  L12_107 = A0_95.sayFreeDisplayName
  L12_107(A0_95, 1600150, A0_95, 89)
  L12_107 = A0_95._wait
  L12_107(A0_95, 0.5)
  L12_107 = desktopWidget
  L12_107 = L12_107.cancelDesktopWidgetMode
  L12_107(L12_107, 16)
  L12_107 = desktopWidget
  L12_107 = L12_107.openTutorialWidget
  L12_107(L12_107, L3_98, 1)
  L12_107 = A1_96._unlockCameraControl
  L12_107(A1_96)
  L12_107 = desktopWidget
  L12_107 = L12_107._waitForCameraTutorial
  L12_107(L12_107)
  L12_107 = desktopWidget
  L12_107 = L12_107.closeTutorialWidget
  L12_107(L12_107)
  L12_107 = desktopWidget
  L12_107 = L12_107.openTutorialSuccessWidget
  L12_107(L12_107, 9005, true)
  L12_107 = A0_95._wait
  L12_107(A0_95, 3)
  L12_107 = A1_96._lockCameraControl
  L12_107(A1_96)
  L12_107 = desktopWidget
  L12_107 = L12_107.orderDesktopWidgetMode
  L12_107(L12_107, 16)
  L12_107 = worldMaster
  L12_107 = L12_107._aimCameraTutorial
  L12_107(L12_107, 1600150)
  L12_107 = worldMaster
  L12_107 = L12_107._lookAtPlayerTutorial
  L12_107(L12_107, 1600150)
  L12_107 = worldMaster
  L12_107 = L12_107._runCharaSchedulerTutorial
  L12_107(L12_107, 1600150, 353959936)
  L12_107 = worldMaster
  L12_107 = L12_107._runCharaSchedulerTutorial
  L12_107(L12_107, 1600150, 403087360)
  L12_107 = A1_96.getTribe
  L12_107 = L12_107(A1_96)
  if L12_107 >= 1 and L12_107 <= 3 then
    L12_107 = 1
  elseif L12_107 >= 4 and L12_107 <= 7 then
    L12_107 = 2
  elseif L12_107 >= 8 and L12_107 <= 11 then
    L12_107 = 3
  elseif L12_107 >= 12 and L12_107 <= 13 then
    L12_107 = 4
  elseif L12_107 >= 14 and L12_107 <= 15 then
    L12_107 = 5
  end
  A0_95:sayFreeDisplayName(1600150, A0_95, 91, L12_107)
  desktopWidget:_setTargetCharacter(1, nil)
  desktopWidget:orderDesktopWidgetMode(16)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_98, 2)
  L4_99 = false
  L5_100 = true
  L6_101 = true
  L7_102 = true
  L8_103 = true
  L9_104 = 4
  desktopWidget:setTutorialMask(L4_99, L5_100, L6_101, L7_102, L8_103, L9_104)
  A1_96:_unlockCameraControl()
  worldMaster:_cancelAimCameraTutorial(1600150)
  return L3_98
end
function Man0l0.processTtrNomal001(A0_108, A1_109, A2_110)
  local L3_111, L4_112, L5_113, L6_114, L7_115, L8_116, L9_117, L10_118, L11_119, L12_120
  L5_113 = A1_109
  L4_112 = A1_109._lockCameraControl
  L4_112(L5_113)
  L4_112 = desktopWidget
  L5_113 = L4_112
  L4_112 = L4_112.isTutorialMode
  L4_112 = L4_112(L5_113)
  if L4_112 == false then
    L4_112 = desktopWidget
    L5_113 = L4_112
    L4_112 = L4_112.orderTutorialMode
    L4_112(L5_113)
  end
  L4_112 = desktopWidget
  L5_113 = L4_112
  L4_112 = L4_112.orderDesktopWidgetMode
  L6_114 = 62
  L4_112(L5_113, L6_114)
  L4_112 = true
  L5_113 = true
  L6_114 = true
  L7_115 = true
  L8_116 = true
  L9_117 = 4
  L10_118 = desktopWidget
  L11_119 = L10_118
  L10_118 = L10_118.setTutorialMask
  L12_120 = L4_112
  L10_118(L11_119, L12_120, L5_113, L6_114, L7_115, L8_116, L9_117)
  L11_119 = A1_109
  L10_118 = A1_109._fadeInNowLoadingForNoticeEventJustInArea
  L10_118(L11_119)
  L11_119 = A0_108
  L10_118 = A0_108.startFadeOut
  L12_120 = A1_109
  L10_118(L11_119, L12_120, 0)
  L11_119 = A0_108
  L10_118 = A0_108._wait
  L12_120 = 1
  L10_118(L11_119, L12_120)
  L10_118 = false
  L11_119 = worldMaster
  L12_120 = L11_119
  L11_119 = L11_119._isKeyboardOnlyTutorial
  L11_119 = L11_119(L12_120)
  while L10_118 == false do
    L12_120 = desktopWidget
    L12_120 = L12_120.askTutorialDeviceType
    L12_120 = L12_120(L12_120)
    L3_111 = L12_120
    L12_120 = A0_108._wait
    L12_120(A0_108, 3)
    L12_120 = worldMaster
    L12_120 = L12_120._isKeyboardOnlyTutorial
    L12_120 = L12_120(L12_120)
    if L12_120 ~= L11_119 then
      L12_120 = worldMaster
      L12_120 = L12_120._isKeyboardOnlyTutorial
      L12_120 = L12_120(L12_120)
      L11_119 = L12_120
      L10_118 = false
    else
      L10_118 = true
    end
  end
  L12_120 = A0_108.startNQCutScene
  L12_120(A0_108, "man0l005", 3)
  L12_120 = A1_109._waitForMapLoaded
  L12_120(A1_109, nil)
  L12_120 = A1_109._fadeIn
  L12_120(A1_109, 5)
  L12_120 = A0_108._wait
  L12_120(A0_108, 4)
  L12_120 = desktopWidget
  L12_120 = L12_120.cancelDesktopWidgetMode
  L12_120(L12_120, 61)
  L12_120 = desktopWidget
  L12_120 = L12_120.openPublicInformDialogWidget
  L12_120(L12_120, A0_108, 96)
  L12_120 = A1_109._waitForFading
  L12_120(A1_109)
  L12_120 = A0_108._wait
  L12_120(A0_108, 2)
  L12_120 = desktopWidget
  L12_120 = L12_120.orderDesktopWidgetMode
  L12_120(L12_120, 16)
  L12_120 = worldMaster
  L12_120 = L12_120._runCharaSchedulerTutorial
  L12_120(L12_120, 1600150, 354086912)
  L12_120 = A0_108.sayFreeDisplayName
  L12_120(A0_108, 1600150, A0_108, 89)
  L12_120 = A0_108._wait
  L12_120(A0_108, 0.5)
  L12_120 = desktopWidget
  L12_120 = L12_120.cancelDesktopWidgetMode
  L12_120(L12_120, 16)
  L12_120 = desktopWidget
  L12_120 = L12_120.openTutorialWidget
  L12_120(L12_120, L3_111, 1)
  L12_120 = A1_109._unlockCameraControl
  L12_120(A1_109)
  L12_120 = desktopWidget
  L12_120 = L12_120._waitForCameraTutorial
  L12_120(L12_120)
  L12_120 = desktopWidget
  L12_120 = L12_120.closeTutorialWidget
  L12_120(L12_120)
  L12_120 = desktopWidget
  L12_120 = L12_120.openTutorialSuccessWidget
  L12_120(L12_120, 9005, true)
  L12_120 = A0_108._wait
  L12_120(A0_108, 3)
  L12_120 = A1_109._lockCameraControl
  L12_120(A1_109)
  L12_120 = desktopWidget
  L12_120 = L12_120.orderDesktopWidgetMode
  L12_120(L12_120, 16)
  L12_120 = worldMaster
  L12_120 = L12_120._aimCameraTutorial
  L12_120(L12_120, 1600150)
  L12_120 = worldMaster
  L12_120 = L12_120._lookAtPlayerTutorial
  L12_120(L12_120, 1600150)
  L12_120 = worldMaster
  L12_120 = L12_120._runCharaSchedulerTutorial
  L12_120(L12_120, 1600150, 353959936)
  L12_120 = worldMaster
  L12_120 = L12_120._runCharaSchedulerTutorial
  L12_120(L12_120, 1600150, 403087360)
  L12_120 = A1_109.getTribe
  L12_120 = L12_120(A1_109)
  if L12_120 >= 1 and L12_120 <= 3 then
    L12_120 = 1
  elseif L12_120 >= 4 and L12_120 <= 7 then
    L12_120 = 2
  elseif L12_120 >= 8 and L12_120 <= 11 then
    L12_120 = 3
  elseif L12_120 >= 12 and L12_120 <= 13 then
    L12_120 = 4
  elseif L12_120 >= 14 and L12_120 <= 15 then
    L12_120 = 5
  end
  A0_108:sayFreeDisplayName(1600150, A0_108, 91, L12_120)
  desktopWidget:_setTargetCharacter(1, nil)
  desktopWidget:orderDesktopWidgetMode(16)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_111, 2)
  L4_112 = false
  L5_113 = true
  L6_114 = true
  L7_115 = true
  L8_116 = true
  L9_117 = 4
  desktopWidget:setTutorialMask(L4_112, L5_113, L6_114, L7_115, L8_116, L9_117)
  A1_109:_unlockCameraControl()
  worldMaster:_cancelAimCameraTutorial(1600150)
  return L3_111
end
function Man0l0.processTtrNomal002(A0_121, A1_122, A2_123, A3_124)
  local L4_125, L5_126, L6_127, L7_128, L8_129, L9_130
  L4_125 = desktopWidget
  L5_126 = L4_125
  L4_125 = L4_125.cancelDesktopWidgetMode
  L6_127 = 16
  L4_125(L5_126, L6_127)
  L4_125 = desktopWidget
  L5_126 = L4_125
  L4_125 = L4_125.closeTutorialWidget
  L4_125(L5_126)
  L5_126 = A0_121
  L4_125 = A0_121._wait
  L6_127 = 0.5
  L4_125(L5_126, L6_127)
  L4_125 = desktopWidget
  L5_126 = L4_125
  L4_125 = L4_125.openTutorialWidget
  L6_127 = A3_124
  L7_128 = 3
  L4_125(L5_126, L6_127, L7_128)
  L4_125 = true
  L5_126 = false
  L6_127 = true
  L7_128 = true
  L8_129 = true
  L9_130 = 4
  desktopWidget:setTutorialMask(L4_125, L5_126, L6_127, L7_128, L8_129, L9_130)
  desktopWidget:_unlockTargetCursorControl()
  A1_122:_unlockLockonControl()
  A1_122:_unlockPlayerControl()
  desktopWidget:_waitForTargetTutorial(1600150)
  L4_125 = true
  L5_126 = true
  L6_127 = true
  L7_128 = true
  L8_129 = true
  L9_130 = 4
  desktopWidget:setTutorialMask(L4_125, L5_126, L6_127, L7_128, L8_129, L9_130)
  desktopWidget:closeTutorialWidget()
  desktopWidget:_lockTargetCursorControl()
  desktopWidget:orderDesktopWidgetMode(16)
  A1_122:_lockPlayerControl()
  A1_122:_lockLockonControl()
  desktopWidget:cancelDesktopWidgetMode(16)
  A0_121:_wait(1)
  desktopWidget:openTutorialWidget(A3_124, 4)
  L4_125 = true
  L5_126 = true
  L6_127 = false
  L7_128 = true
  L8_129 = true
  L9_130 = 4
  desktopWidget:setTutorialMask(L4_125, L5_126, L6_127, L7_128, L8_129, L9_130)
end
function Man0l0.processTtrNomal003(A0_131, A1_132, A2_133, A3_134)
  local L4_135, L5_136, L6_137, L7_138, L8_139, L9_140
  L4_135 = desktopWidget
  L5_136 = L4_135
  L4_135 = L4_135.closeTutorialWidget
  L4_135(L5_136)
  L5_136 = A0_131
  L4_135 = A0_131._wait
  L6_137 = 0.5
  L4_135(L5_136, L6_137)
  L5_136 = A2_133
  L4_135 = A2_133._runCharaScheduler
  L6_137 = 353964032
  L4_135(L5_136, L6_137)
  L5_136 = A2_133
  L4_135 = A2_133.say
  L6_137 = A0_131
  L7_138 = 93
  L8_139 = 0
  L4_135(L5_136, L6_137, L7_138, L8_139)
  L4_135 = desktopWidget
  L5_136 = L4_135
  L4_135 = L4_135._setTargetCharacter
  L6_137 = 1
  L7_138 = nil
  L4_135(L5_136, L6_137, L7_138)
  L4_135 = desktopWidget
  L5_136 = L4_135
  L4_135 = L4_135.cancelDesktopWidgetMode
  L6_137 = 16
  L4_135(L5_136, L6_137)
  L4_135 = desktopWidget
  L5_136 = L4_135
  L4_135 = L4_135.openTutorialSuccessWidget
  L6_137 = 9020
  L7_138 = true
  L4_135(L5_136, L6_137, L7_138)
  L5_136 = A0_131
  L4_135 = A0_131._wait
  L6_137 = 3
  L4_135(L5_136, L6_137)
  L4_135 = true
  L5_136 = true
  L6_137 = true
  L7_138 = true
  L8_139 = true
  L9_140 = 1
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(A3_134, 5)
  worldMaster:_cancelLookAtPlayerTutorial(1600150)
  desktopWidget:setTutorialMask(L4_135, L5_136, L6_137, L7_138, L8_139, L9_140)
end
function Man0l0.processTtrMini001(A0_141, A1_142, A2_143)
  A2_143:startCliantTalkTurn(2, A1_142)
  A2_143:_runCharaScheduler(353964032)
  A2_143:say(A0_141, 94, 0)
  A2_143:say(A0_141, 95, 0)
  A2_143:finishCliantTalkTurn()
end
function Man0l0.processTtrMini002(A0_144, A1_145, A2_146)
  A2_146:startCliantTalkTurn(2, A1_145)
  A2_146:_runCharaScheduler(353964032)
  A2_146:say(A0_144, 119, 0)
  A2_146:finishCliantTalkTurn()
end
function Man0l0.processTtrMini003(A0_147, A1_148, A2_149)
  A2_149:startCliantTalkTurn(2, A1_148)
  A2_149:_runCharaScheduler(353964032)
  A2_149:say(A0_147, 118, 0)
  A2_149:finishCliantTalkTurn()
end
function Man0l0.processTtrAfterBtl001(A0_150, A1_151, A2_152)
  local L3_153, L4_154, L5_155, L6_156, L7_157, L8_158, L9_159, L10_160, L11_161
  L3_153 = desktopWidget
  L4_154 = L3_153
  L3_153 = L3_153.isTutorialMode
  L3_153 = L3_153(L4_154)
  if L3_153 == false then
    L3_153 = desktopWidget
    L4_154 = L3_153
    L3_153 = L3_153.orderTutorialMode
    L3_153(L4_154)
  end
  L4_154 = A1_151
  L3_153 = A1_151._fadeInNowLoadingForNoticeEventJustInArea
  L3_153(L4_154)
  L3_153 = desktopWidget
  L4_154 = L3_153
  L3_153 = L3_153.cancelDesktopWidgetMode
  L5_155 = 16
  L3_153(L4_154, L5_155)
  L3_153 = desktopWidget
  L4_154 = L3_153
  L3_153 = L3_153.closeTutorialWidget
  L3_153(L4_154)
  L3_153 = nil
  L4_154 = false
  L5_155 = worldMaster
  L6_156 = L5_155
  L5_155 = L5_155._isKeyboardOnlyTutorial
  L5_155 = L5_155(L6_156)
  while L4_154 == false do
    L6_156 = desktopWidget
    L7_157 = L6_156
    L6_156 = L6_156.askTutorialDeviceType
    L6_156 = L6_156(L7_157)
    L3_153 = L6_156
    L7_157 = A0_150
    L6_156 = A0_150._wait
    L8_158 = 3
    L6_156(L7_157, L8_158)
    L6_156 = worldMaster
    L7_157 = L6_156
    L6_156 = L6_156._isKeyboardOnlyTutorial
    L6_156 = L6_156(L7_157)
    if L6_156 ~= L5_155 then
      L6_156 = worldMaster
      L7_157 = L6_156
      L6_156 = L6_156._isKeyboardOnlyTutorial
      L6_156 = L6_156(L7_157)
      L5_155 = L6_156
      L4_154 = false
    else
      L4_154 = true
    end
  end
  L6_156 = false
  L7_157 = false
  L8_158 = false
  L9_159 = true
  L10_160 = true
  L11_161 = 3
  desktopWidget:closeTutorialWidget()
  desktopWidget:setTutorialMask(L6_156, L7_157, L8_158, L9_159, L10_160, L11_161)
  return L3_153
end
function Man0l0.processTtrBtl001(A0_162, A1_163, A2_164, A3_165)
  local L4_166, L5_167, L6_168, L7_169, L8_170, L9_171
  L4_166 = desktopWidget
  L5_167 = L4_166
  L4_166 = L4_166.closeTutorialWidget
  L4_166(L5_167)
  L4_166 = true
  L5_167 = true
  L6_168 = true
  L7_169 = false
  L8_170 = true
  L9_171 = 4
  A0_162:startHQCutScene("MAN0L010", 1)
  A0_162:startFadeInCutSceneDefault(A1_163)
  A0_162:setMusic(A1_163, 21, 1)
  A0_162:_wait(2)
  worldMaster:_aimCameraTutorial(1900006)
  worldMaster:_lookAtPlayerTutorial(1900006)
  worldMaster:_runCharaSchedulerTutorial(1900006, 403087360)
  A0_162:sayFreeDisplayName(1900006, A0_162, 97)
  worldMaster:_cancelAimCameraTutorial(1900006)
  desktopWidget:cancelDesktopWidgetMode(16)
  L4_166 = true
  L5_167 = true
  L6_168 = true
  L7_169 = false
  L8_170 = true
  L9_171 = 4
  desktopWidget:setTutorialMask(L4_166, L5_167, L6_168, L7_169, L8_170, L9_171)
  desktopWidget:openTutorialWidget(A3_165, 6)
  L4_166 = true
  L5_167 = true
  L6_168 = true
  L7_169 = false
  L8_170 = true
  L9_171 = 4
  desktopWidget:setTutorialMask(L4_166, L5_167, L6_168, L7_169, L8_170, L9_171)
end
function Man0l0.processTtrBtlMagic001(A0_172, A1_173, A2_174, A3_175)
  local L4_176, L5_177, L6_178, L7_179, L8_180, L9_181, L10_182, L11_183, L12_184, L13_185, L14_186, L15_187, L16_188, L17_189, L18_190, L19_191, L20_192, L21_193
  L4_176 = desktopWidget
  L5_177 = L4_176
  L4_176 = L4_176.closeTutorialWidget
  L4_176(L5_177)
  L4_176 = true
  L5_177 = true
  L6_178 = true
  L7_179 = false
  L8_180 = true
  L9_181 = 4
  L10_182 = desktopWidget
  L11_183 = L10_182
  L10_182 = L10_182.setTutorialMask
  L12_184 = L4_176
  L13_185 = L5_177
  L14_186 = L6_178
  L15_187 = L7_179
  L16_188 = L8_180
  L17_189 = L9_181
  L10_182(L11_183, L12_184, L13_185, L14_186, L15_187, L16_188, L17_189)
  L11_183 = A0_172
  L10_182 = A0_172.startHQCutScene
  L12_184 = "MAN0L010"
  L13_185 = 1
  L10_182(L11_183, L12_184, L13_185)
  L11_183 = A0_172
  L10_182 = A0_172.startFadeInCutSceneDefault
  L12_184 = A1_173
  L10_182(L11_183, L12_184)
  L11_183 = A0_172
  L10_182 = A0_172.setMusic
  L12_184 = A1_173
  L13_185 = 21
  L14_186 = 1
  L10_182(L11_183, L12_184, L13_185, L14_186)
  L11_183 = A0_172
  L10_182 = A0_172._wait
  L12_184 = 2
  L10_182(L11_183, L12_184)
  L10_182 = worldMaster
  L11_183 = L10_182
  L10_182 = L10_182._aimCameraTutorial
  L12_184 = 1900006
  L10_182(L11_183, L12_184)
  L10_182 = worldMaster
  L11_183 = L10_182
  L10_182 = L10_182._lookAtPlayerTutorial
  L12_184 = 1900006
  L10_182(L11_183, L12_184)
  L10_182 = worldMaster
  L11_183 = L10_182
  L10_182 = L10_182._runCharaSchedulerTutorial
  L12_184 = 1900006
  L13_185 = 403087360
  L10_182(L11_183, L12_184, L13_185)
  L10_182 = worldMaster
  L11_183 = L10_182
  L10_182 = L10_182._runCharaSchedulerTutorial
  L12_184 = 1900006
  L13_185 = 403087360
  L10_182(L11_183, L12_184, L13_185)
  L11_183 = A0_172
  L10_182 = A0_172.sayFreeDisplayName
  L12_184 = 1900006
  L13_185 = A0_172
  L14_186 = 97
  L10_182(L11_183, L12_184, L13_185, L14_186)
  L10_182 = worldMaster
  L11_183 = L10_182
  L10_182 = L10_182._cancelAimCameraTutorial
  L12_184 = 1900006
  L10_182(L11_183, L12_184)
  L10_182 = desktopWidget
  L11_183 = L10_182
  L10_182 = L10_182.cancelDesktopWidgetMode
  L12_184 = 16
  L10_182(L11_183, L12_184)
  L10_182 = desktopWidget
  L11_183 = L10_182
  L10_182 = L10_182.openTutorialWidget
  L12_184 = A3_175
  L13_185 = 7
  L10_182(L11_183, L12_184, L13_185)
  L10_182 = true
  L11_183 = false
  L12_184 = true
  L13_185 = true
  L14_186 = true
  L15_187 = 4
  L16_188 = desktopWidget
  L17_189 = L16_188
  L16_188 = L16_188.setTutorialMask
  L18_190 = L10_182
  L19_191 = L11_183
  L20_192 = L12_184
  L21_193 = L13_185
  L16_188(L17_189, L18_190, L19_191, L20_192, L21_193, L14_186, L15_187)
  L16_188 = desktopWidget
  L17_189 = L16_188
  L16_188 = L16_188.closeAllEventModeWidget
  L16_188(L17_189)
  L16_188 = desktopWidget
  L17_189 = L16_188
  L16_188 = L16_188._unlockTargetCursorControl
  L16_188(L17_189)
  L17_189 = A1_173
  L16_188 = A1_173._unlockLockonControl
  L16_188(L17_189)
  L17_189 = A1_173
  L16_188 = A1_173._unlockPlayerControl
  L16_188(L17_189)
  L16_188 = desktopWidget
  L17_189 = L16_188
  L16_188 = L16_188._waitForTargetTutorial
  L18_190 = 3205403
  L16_188(L17_189, L18_190)
  L16_188 = desktopWidget
  L17_189 = L16_188
  L16_188 = L16_188.closeTutorialWidget
  L16_188(L17_189)
  L17_189 = A0_172
  L16_188 = A0_172._wait
  L18_190 = 1
  L16_188(L17_189, L18_190)
  L16_188 = desktopWidget
  L17_189 = L16_188
  L16_188 = L16_188._lockTargetCursorControl
  L16_188(L17_189)
  L16_188 = desktopWidget
  L17_189 = L16_188
  L16_188 = L16_188.orderDesktopWidgetMode
  L18_190 = 16
  L16_188(L17_189, L18_190)
  L17_189 = A1_173
  L16_188 = A1_173._lockPlayerControl
  L16_188(L17_189)
  L17_189 = A1_173
  L16_188 = A1_173._lockLockonControl
  L16_188(L17_189)
  L16_188 = 1
  L18_190 = A1_173
  L17_189 = A1_173.getStateMainSkill
  L17_189 = L17_189(L18_190)
  L19_191 = A1_173
  L18_190 = A1_173.getSkillCategory
  L20_192 = L17_189
  L18_190 = L18_190(L19_191, L20_192)
  if L18_190 == 21 then
    L16_188 = 3
  elseif L18_190 == 29 or L18_190 == 39 then
    L16_188 = 4
  elseif L17_189 == 7 then
    L16_188 = 2
  else
    L16_188 = 1
  end
  L19_191, L20_192, L21_193 = nil, nil, nil
  if L16_188 == 1 then
    L19_191 = 101
    L20_192 = 105
    L21_193 = 8
  elseif L16_188 == 2 then
    L19_191 = 102
    L20_192 = 106
    L21_193 = 9
  elseif L16_188 == 3 then
    L19_191 = 103
    L20_192 = 107
    L21_193 = 10
  elseif L16_188 == 4 then
    L19_191 = 104
    L20_192 = 108
    L21_193 = 11
  end
  if L16_188 == 3 then
    if L17_189 == 22 then
    else
    end
  else
  end
  desktopWidget:cancelDesktopWidgetMode(16)
  L10_182 = true
  L11_183 = true
  L12_184 = true
  L13_185 = true
  L14_186 = true
  L15_187 = 4
  desktopWidget:setTutorialMask(L10_182, L11_183, L12_184, L13_185, L14_186, L15_187)
  desktopWidget:openTutorialWidget(A3_175, L21_193)
  if L16_188 == 1 then
    L10_182 = false
    L11_183 = false
    L12_184 = false
    L13_185 = false
    L14_186 = false
    L15_187 = 3
  else
    L10_182 = false
    L11_183 = false
    L12_184 = false
    L13_185 = false
    L14_186 = false
    L15_187 = 3
  end
  desktopWidget:setTutorialMask(L10_182, L11_183, L12_184, L13_185, L14_186, L15_187)
end
function Man0l0.processTtrBtl002(A0_194, A1_195, A2_196, A3_197)
  local L4_198, L5_199, L6_200, L7_201, L8_202, L9_203, L10_204, L11_205, L12_206, L13_207, L14_208, L15_209, L16_210, L17_211, L18_212, L19_213, L20_214, L21_215, L22_216
  L4_198 = desktopWidget
  L5_199 = L4_198
  L4_198 = L4_198.cancelDesktopWidgetMode
  L6_200 = 16
  L4_198(L5_199, L6_200)
  L4_198 = desktopWidget
  L5_199 = L4_198
  L4_198 = L4_198.closeTutorialWidget
  L4_198(L5_199)
  L5_199 = A0_194
  L4_198 = A0_194._wait
  L6_200 = 1
  L4_198(L5_199, L6_200)
  L4_198 = desktopWidget
  L5_199 = L4_198
  L4_198 = L4_198.orderDesktopWidgetMode
  L6_200 = 16
  L4_198(L5_199, L6_200)
  L4_198 = worldMaster
  L5_199 = L4_198
  L4_198 = L4_198._aimCameraTutorial
  L6_200 = 1600179
  L4_198(L5_199, L6_200)
  L4_198 = worldMaster
  L5_199 = L4_198
  L4_198 = L4_198._lookAtPlayerTutorial
  L6_200 = 1600179
  L4_198(L5_199, L6_200)
  L4_198 = worldMaster
  L5_199 = L4_198
  L4_198 = L4_198._runCharaSchedulerTutorial
  L6_200 = 1600179
  L7_201 = 403087360
  L4_198(L5_199, L6_200, L7_201)
  L5_199 = A0_194
  L4_198 = A0_194.sayFreeDisplayName
  L6_200 = 1600179
  L7_201 = A0_194
  L8_202 = 99
  L4_198(L5_199, L6_200, L7_201, L8_202)
  L4_198 = worldMaster
  L5_199 = L4_198
  L4_198 = L4_198._cancelAimCameraTutorial
  L6_200 = 1600179
  L4_198(L5_199, L6_200)
  L4_198 = desktopWidget
  L5_199 = L4_198
  L4_198 = L4_198.cancelDesktopWidgetMode
  L6_200 = 16
  L4_198(L5_199, L6_200)
  L4_198 = true
  L5_199 = true
  L6_200 = true
  L7_201 = true
  L8_202 = true
  L9_203 = 4
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204.setTutorialMask
  L12_206 = L4_198
  L13_207 = L5_199
  L14_208 = L6_200
  L15_209 = L7_201
  L16_210 = L8_202
  L17_211 = L9_203
  L10_204(L11_205, L12_206, L13_207, L14_208, L15_209, L16_210, L17_211)
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204.openTutorialWidget
  L12_206 = A3_197
  L13_207 = 7
  L10_204(L11_205, L12_206, L13_207)
  L4_198 = true
  L5_199 = true
  L6_200 = true
  L7_201 = true
  L8_202 = true
  L9_203 = 4
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204.setTutorialMask
  L12_206 = L4_198
  L13_207 = L5_199
  L14_208 = L6_200
  L15_209 = L7_201
  L16_210 = L8_202
  L17_211 = L9_203
  L10_204(L11_205, L12_206, L13_207, L14_208, L15_209, L16_210, L17_211)
  L4_198 = true
  L5_199 = false
  L6_200 = true
  L7_201 = true
  L8_202 = true
  L9_203 = 4
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204.setTutorialMask
  L12_206 = L4_198
  L13_207 = L5_199
  L14_208 = L6_200
  L15_209 = L7_201
  L16_210 = L8_202
  L17_211 = L9_203
  L10_204(L11_205, L12_206, L13_207, L14_208, L15_209, L16_210, L17_211)
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204.closeAllEventModeWidget
  L10_204(L11_205)
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204._unlockTargetCursorControl
  L10_204(L11_205)
  L11_205 = A1_195
  L10_204 = A1_195._unlockLockonControl
  L10_204(L11_205)
  L11_205 = A1_195
  L10_204 = A1_195._unlockPlayerControl
  L10_204(L11_205)
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204._waitForTargetTutorial
  L12_206 = 3205403
  L10_204(L11_205, L12_206)
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204.closeTutorialWidget
  L10_204(L11_205)
  L11_205 = A0_194
  L10_204 = A0_194._wait
  L12_206 = 1
  L10_204(L11_205, L12_206)
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204._lockTargetCursorControl
  L10_204(L11_205)
  L10_204 = desktopWidget
  L11_205 = L10_204
  L10_204 = L10_204.orderDesktopWidgetMode
  L12_206 = 16
  L10_204(L11_205, L12_206)
  L11_205 = A1_195
  L10_204 = A1_195._lockPlayerControl
  L10_204(L11_205)
  L11_205 = A1_195
  L10_204 = A1_195._lockLockonControl
  L10_204(L11_205)
  L10_204 = 1
  L12_206 = A1_195
  L11_205 = A1_195.getStateMainSkill
  L11_205 = L11_205(L12_206)
  L13_207 = A1_195
  L12_206 = A1_195.getSkillCategory
  L14_208 = L11_205
  L12_206 = L12_206(L13_207, L14_208)
  if L12_206 == 21 then
    L10_204 = 3
  elseif L12_206 == 29 or L12_206 == 39 then
    L10_204 = 4
  elseif L11_205 == 7 then
    L10_204 = 2
  else
    L10_204 = 1
  end
  L13_207, L14_208, L15_209 = nil, nil, nil
  if L10_204 == 1 then
    L13_207 = 101
    L14_208 = 105
    L15_209 = 8
  elseif L10_204 == 2 then
    L13_207 = 102
    L14_208 = 106
    L15_209 = 9
  elseif L10_204 == 3 then
    L13_207 = 103
    L14_208 = 107
    L15_209 = 10
  elseif L10_204 == 4 then
    L13_207 = 104
    L14_208 = 108
    L15_209 = 11
  end
  L16_210 = nil
  if L10_204 == 3 then
    if L11_205 == 22 then
      L16_210 = 2
    else
      L16_210 = 1
    end
  else
  end
  L17_211 = desktopWidget
  L18_212 = L17_211
  L17_211 = L17_211.cancelDesktopWidgetMode
  L19_213 = 16
  L17_211(L18_212, L19_213)
  L17_211 = desktopWidget
  L18_212 = L17_211
  L17_211 = L17_211.openTutorialWidget
  L19_213 = A3_197
  L20_214 = L15_209
  L17_211(L18_212, L19_213, L20_214)
  L17_211, L18_212, L19_213, L20_214, L21_215, L22_216 = nil, nil, nil, nil, nil, nil
  if L10_204 == 1 then
    L17_211 = false
    L18_212 = false
    L19_213 = false
    L20_214 = false
    L21_215 = false
    L22_216 = 3
  else
    L17_211 = false
    L18_212 = false
    L19_213 = false
    L20_214 = false
    L21_215 = false
    L22_216 = 3
  end
  desktopWidget:setTutorialMask(L17_211, L18_212, L19_213, L20_214, L21_215, L22_216)
end
function Man0l0.processTtrBtl003(A0_217, A1_218, A2_219)
  local L3_220, L4_221, L5_222, L6_223, L7_224, L8_225, L9_226, L10_227, L11_228
  L3_220 = desktopWidget
  L4_221 = L3_220
  L3_220 = L3_220.cancelDesktopWidgetMode
  L5_222 = 16
  L3_220(L4_221, L5_222)
  L3_220 = desktopWidget
  L4_221 = L3_220
  L3_220 = L3_220.closeTutorialWidget
  L3_220(L4_221)
  L3_220 = desktopWidget
  L4_221 = L3_220
  L3_220 = L3_220.openTutorialSuccessWidget
  L5_222 = 4305
  L6_223 = true
  L3_220(L4_221, L5_222, L6_223)
  L4_221 = A0_217
  L3_220 = A0_217._wait
  L5_222 = 3
  L3_220(L4_221, L5_222)
  L3_220 = 1
  L5_222 = A1_218
  L4_221 = A1_218.getStateMainSkill
  L4_221 = L4_221(L5_222)
  L6_223 = A1_218
  L5_222 = A1_218.getSkillCategory
  L7_224 = L4_221
  L5_222 = L5_222(L6_223, L7_224)
  if L5_222 == 21 then
    L3_220 = 3
  elseif L5_222 == 29 or L5_222 == 39 then
    L3_220 = 4
  elseif L4_221 == 7 then
    L3_220 = 2
  else
    L3_220 = 1
  end
  if L3_220 == 1 or L3_220 == 2 then
    L6_223 = desktopWidget
    L7_224 = L6_223
    L6_223 = L6_223.orderDesktopWidgetMode
    L8_225 = 16
    L6_223(L7_224, L8_225)
    L7_224 = A0_217
    L6_223 = A0_217.sayFreeDisplayName
    L8_225 = 1600179
    L9_226 = A0_217
    L10_227 = 109
    L6_223(L7_224, L8_225, L9_226, L10_227)
    L6_223 = desktopWidget
    L7_224 = L6_223
    L6_223 = L6_223.cancelDesktopWidgetMode
    L8_225 = 16
    L6_223(L7_224, L8_225)
    L6_223 = desktopWidget
    L7_224 = L6_223
    L6_223 = L6_223.openTutorialWidget
    L8_225 = 2
    L9_226 = 1
    L6_223(L7_224, L8_225, L9_226)
    L6_223 = false
    L7_224 = false
    L8_225 = false
    L9_226 = false
    L10_227 = false
    L11_228 = 3
    desktopWidget:setTutorialMask(L6_223, L7_224, L8_225, L9_226, L10_227, L11_228)
  end
end
function Man0l0.processTtrBtl004(A0_229, A1_230, A2_231)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:closeTutorialWidget()
  desktopWidget:openTutorialSuccessWidget(4305, true)
  A0_229:_wait(3)
  A0_229:processInformDialogAsQuest(A0_229, 110)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(2, 1)
end
function Man0l0.processInformDialogAsQuest(A0_232, A1_233, A2_234)
  desktopWidget:openPublicInformDialogWidget(A0_232, A1_233, A2_234)
  A0_232:_wait(2)
  desktopWidget:getStaticWidget(8):hide()
end
