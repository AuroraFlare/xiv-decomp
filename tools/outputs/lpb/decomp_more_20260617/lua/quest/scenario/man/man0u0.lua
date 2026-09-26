require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man0u0", "ScenarioBaseClass")
function Man0u0.initText(A0_0)
  A0_0:_loadTextDataPermanently(1351, "man0u0")
end
function Man0u0.processEvent000(A0_1, A1_2, A2_3)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startHQCutScene("MAN0U000", 1)
  A0_1:startFadeInCutSceneDefault(A1_2)
end
function Man0u0.processEvent000_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 3, 0)
  A2_6:say(A0_4, 4, 0)
  A2_6:finishCliantTalkTurn()
end
function Man0u0.processEvent000_3(A0_7, A1_8, A2_9)
  _getTutorialJudge():man0u0processEvent000_3(A0_7, A1_8, A2_9)
end
function Man0u0.processEvent000_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 6, 0)
  A2_12:say(A0_10, 7, 0)
  A2_12:finishCliantTalkTurn()
end
function Man0u0.processEvent000_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 10, 0)
  A2_15:say(A0_13, 11, 0)
  A2_15:finishCliantTalkTurn()
end
function Man0u0.processEvent000_6(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 64, 0)
  A2_18:say(A0_16, 65, 0)
  A2_18:finishCliantTalkTurn()
end
function Man0u0.processEvent000_6_2(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 120, 0)
  A2_21:finishCliantTalkTurn()
end
function Man0u0.processEvent000_7(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 66, 0)
  A2_24:finishCliantTalkTurn()
end
function Man0u0.processEvent000_8(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 67, 0)
  A2_27:say(A0_25, 68, 0)
  A2_27:finishCliantTalkTurn()
end
function Man0u0.processEvent000_9(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 69, 0)
  A2_30:say(A0_28, 70, 0)
  A2_30:finishCliantTalkTurn()
end
function Man0u0.processEvent000_10(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 71, 0)
  A2_33:finishCliantTalkTurn()
end
function Man0u0.processEvent000_11(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 72, 0)
  A2_36:say(A0_34, 73, 0)
  A2_36:finishCliantTalkTurn()
end
function Man0u0.processEvent000_12(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 74, 0)
  A2_39:finishCliantTalkTurn()
end
function Man0u0.processEvent000_13(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 75, 0)
  A2_42:finishCliantTalkTurn()
end
function Man0u0.processEvent000_14(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 121, 0)
  A2_45:_runCharaScheduler(354086912)
  A2_45:say(A0_43, 122, 0)
  A2_45:finishCliantTalkTurn()
end
function Man0u0.processEvent010(A0_46, A1_47, A2_48)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:closeTutorialWidget()
  desktopWidget:orderDesktopWidgetMode(16)
end
function Man0u0.processEvent020(A0_49, A1_50, A2_51)
  local L3_52, L4_53, L5_54, L6_55, L7_56, L8_57
  L4_53 = A0_49
  L3_52 = A0_49.setMusic
  L5_54 = A1_50
  L6_55 = 7
  L7_56 = 2
  L3_52(L4_53, L5_54, L6_55, L7_56)
  L4_53 = A0_49
  L3_52 = A0_49.startFadeOutCutSceneDefault
  L5_54 = A1_50
  L3_52(L4_53, L5_54)
  L4_53 = A0_49
  L3_52 = A0_49.startHQCutScene
  L5_54 = "MAN0U020"
  L6_55 = 1
  L3_52(L4_53, L5_54, L6_55)
  L3_52 = desktopWidget
  L4_53 = L3_52
  L3_52 = L3_52.openPublicInformDialogWidget
  L5_54 = worldMaster
  L6_55 = 25117
  L7_56 = 11000089
  L8_57 = 1
  L3_52(L4_53, L5_54, L6_55, L7_56, L8_57)
  L3_52 = worldMaster
  L4_53 = L3_52
  L3_52 = L3_52.notify
  L5_54 = worldMaster
  L6_55 = 25117
  L7_56 = 11000089
  L8_57 = 1
  L3_52(L4_53, L5_54, L6_55, L7_56, L8_57)
  L4_53 = A0_49
  L3_52 = A0_49._wait
  L5_54 = 5
  L3_52(L4_53, L5_54)
  L3_52 = worldMaster
  L4_53 = L3_52
  L3_52 = L3_52.say
  L5_54 = A0_49
  L6_55 = 134
  L3_52(L4_53, L5_54, L6_55)
  L3_52 = worldMaster
  L4_53 = L3_52
  L3_52 = L3_52.say
  L5_54 = A0_49
  L6_55 = 135
  L3_52(L4_53, L5_54, L6_55)
  L3_52 = worldMaster
  L4_53 = L3_52
  L3_52 = L3_52.say
  L5_54 = A0_49
  L6_55 = 136
  L3_52(L4_53, L5_54, L6_55)
  L3_52 = false
  L4_53 = false
  L5_54 = false
  L6_55 = true
  L7_56 = true
  L8_57 = 3
  desktopWidget:setTutorialMask(L3_52, L4_53, L5_54, L6_55, L7_56, L8_57)
  A0_49:startFadeInCutSceneAfterWarp(A1_50)
end
function Man0u0.processEvent020_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:_runCharaScheduler(67727360)
  A2_60:say(A0_58, 76, 0)
  A2_60:finishCliantTalkTurn()
end
function Man0u0.processEvent020_3(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 77, 0)
  A2_63:say(A0_61, 78, 0)
  A2_63:finishCliantTalkTurn()
end
function Man0u0.processEvent020_4(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 79, 0)
  A2_66:_runCharaScheduler(354082816)
  A2_66:say(A0_64, 80, 0)
  A2_66:finishCliantTalkTurn()
end
function Man0u0.processEvent020_5(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:_runCharaScheduler(353968128)
  A2_69:say(A0_67, 81, 0)
  A2_69:say(A0_67, 82, 0)
  A2_69:finishCliantTalkTurn()
end
function Man0u0.processEvent020_6(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:_runCharaScheduler(67887104)
  A2_72:say(A0_70, 83, 0)
  A2_72:finishCliantTalkTurn()
end
function Man0u0.processEvent020_7(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 84, 0)
  A2_75:say(A0_73, 85, 0)
  A2_75:finishCliantTalkTurn()
end
function Man0u0.processEvent020_8(A0_76, A1_77, A2_78)
  return (_getTutorialJudge():man0u0processEvent020_8(A0_76, A1_77, A2_78))
end
function Man0u0.processTtrNomal001withHQ(A0_79, A1_80, A2_81)
  local L3_82, L4_83, L5_84, L6_85, L7_86, L8_87, L9_88, L10_89, L11_90
  L5_84 = A1_80
  L4_83 = A1_80._lockCameraControl
  L4_83(L5_84)
  L4_83 = desktopWidget
  L5_84 = L4_83
  L4_83 = L4_83.orderTutorialMode
  L4_83(L5_84)
  L4_83 = desktopWidget
  L5_84 = L4_83
  L4_83 = L4_83.orderDesktopWidgetMode
  L6_85 = 62
  L4_83(L5_84, L6_85)
  L4_83 = true
  L5_84 = true
  L6_85 = true
  L7_86 = true
  L8_87 = true
  L9_88 = 4
  L10_89 = desktopWidget
  L11_90 = L10_89
  L10_89 = L10_89.setTutorialMask
  L10_89(L11_90, L4_83, L5_84, L6_85, L7_86, L8_87, L9_88)
  L11_90 = A1_80
  L10_89 = A1_80._fadeInNowLoadingForNoticeEventJustInArea
  L10_89(L11_90)
  L11_90 = A0_79
  L10_89 = A0_79.startFadeOut
  L10_89(L11_90, A1_80, 0)
  L11_90 = A0_79
  L10_89 = A0_79._wait
  L10_89(L11_90, 1)
  L10_89 = false
  L11_90 = worldMaster
  L11_90 = L11_90._isKeyboardOnlyTutorial
  L11_90 = L11_90(L11_90)
  while L10_89 == false do
    L3_82 = desktopWidget:askTutorialDeviceType()
    A0_79:_wait(3)
    if worldMaster:_isKeyboardOnlyTutorial() ~= L11_90 then
      L11_90 = worldMaster:_isKeyboardOnlyTutorial()
      L10_89 = false
    else
      L10_89 = true
    end
  end
  A0_79:startHQCutScene("MAN0U000", 3)
  A0_79:startNQCutScene("man0u005", 3)
  A1_80:_waitForMapLoaded(nil)
  A1_80:_fadeIn(5)
  A0_79:_wait(4)
  desktopWidget:cancelDesktopWidgetMode(61)
  desktopWidget:openPublicInformDialogWidget(A0_79, 118)
  A1_80:_waitForFading()
  A0_79:_wait(2)
  desktopWidget:orderDesktopWidgetMode(16)
  worldMaster:_runCharaSchedulerTutorial(1100003, 353972224)
  worldMaster:_runCharaSchedulerTutorial(1100003, 403087360)
  A0_79:sayFreeDisplayName(1100003, A0_79, 96)
  worldMaster:_waitForCharaSchedulerTutorialFinished(1100003, 353972224)
  A0_79:_wait(0.5)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_82, 1)
  A1_80:_unlockCameraControl()
  desktopWidget:_waitForCameraTutorial()
  desktopWidget:closeTutorialWidget()
  desktopWidget:openTutorialSuccessWidget(9005, true)
  A0_79:_wait(3)
  A1_80:_lockCameraControl()
  desktopWidget:orderDesktopWidgetMode(16)
  worldMaster:_aimCameraTutorial(1100003)
  worldMaster:_lookAtPlayerTutorial(1100003)
  worldMaster:_lookAtPlayerTutorial(1000347)
  worldMaster:_runCharaSchedulerTutorial(1100003, 353972224)
  worldMaster:_runCharaSchedulerTutorial(1100003, 403087360)
  A0_79:sayFreeDisplayName(1100003, A0_79, 98)
  desktopWidget:_setTargetCharacter(1, nil)
  desktopWidget:orderDesktopWidgetMode(16)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_82, 2)
  L4_83 = false
  L5_84 = true
  L6_85 = true
  L7_86 = true
  L8_87 = true
  L9_88 = 4
  desktopWidget:setTutorialMask(L4_83, L5_84, L6_85, L7_86, L8_87, L9_88)
  A1_80:_unlockCameraControl()
  worldMaster:_cancelAimCameraTutorial(1100003)
  return L3_82
end
function Man0u0.processTtrNomal001(A0_91, A1_92, A2_93)
  local L3_94, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100, L10_101, L11_102
  L5_96 = A1_92
  L4_95 = A1_92._lockCameraControl
  L4_95(L5_96)
  L4_95 = desktopWidget
  L5_96 = L4_95
  L4_95 = L4_95.isTutorialMode
  L4_95 = L4_95(L5_96)
  if L4_95 == false then
    L4_95 = desktopWidget
    L5_96 = L4_95
    L4_95 = L4_95.orderTutorialMode
    L4_95(L5_96)
  end
  L4_95 = desktopWidget
  L5_96 = L4_95
  L4_95 = L4_95.orderDesktopWidgetMode
  L6_97 = 62
  L4_95(L5_96, L6_97)
  L4_95 = true
  L5_96 = true
  L6_97 = true
  L7_98 = true
  L8_99 = true
  L9_100 = 4
  L10_101 = desktopWidget
  L11_102 = L10_101
  L10_101 = L10_101.setTutorialMask
  L10_101(L11_102, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100)
  L11_102 = A1_92
  L10_101 = A1_92._fadeInNowLoadingForNoticeEventJustInArea
  L10_101(L11_102)
  L11_102 = A0_91
  L10_101 = A0_91.startFadeOut
  L10_101(L11_102, A1_92, 0)
  L11_102 = A0_91
  L10_101 = A0_91._wait
  L10_101(L11_102, 1)
  L10_101 = false
  L11_102 = worldMaster
  L11_102 = L11_102._isKeyboardOnlyTutorial
  L11_102 = L11_102(L11_102)
  while L10_101 == false do
    L3_94 = desktopWidget:askTutorialDeviceType()
    A0_91:_wait(3)
    if worldMaster:_isKeyboardOnlyTutorial() ~= L11_102 then
      L11_102 = worldMaster:_isKeyboardOnlyTutorial()
      L10_101 = false
    else
      L10_101 = true
    end
  end
  A0_91:startNQCutScene("man0u005", 3)
  A1_92:_waitForMapLoaded(nil)
  A1_92:_fadeIn(5)
  A0_91:_wait(4)
  desktopWidget:cancelDesktopWidgetMode(61)
  desktopWidget:openPublicInformDialogWidget(A0_91, 118)
  A1_92:_waitForFading()
  A0_91:_wait(2)
  desktopWidget:orderDesktopWidgetMode(16)
  worldMaster:_runCharaSchedulerTutorial(1100003, 353972224)
  worldMaster:_runCharaSchedulerTutorial(1100003, 403087360)
  A0_91:sayFreeDisplayName(1100003, A0_91, 96)
  worldMaster:_waitForCharaSchedulerTutorialFinished(1100003, 353972224)
  A0_91:_wait(0.5)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_94, 1)
  A1_92:_unlockCameraControl()
  desktopWidget:_waitForCameraTutorial()
  desktopWidget:closeTutorialWidget()
  desktopWidget:openTutorialSuccessWidget(9005, true)
  A0_91:_wait(3)
  A1_92:_lockCameraControl()
  desktopWidget:orderDesktopWidgetMode(16)
  worldMaster:_aimCameraTutorial(1100003)
  worldMaster:_lookAtPlayerTutorial(1100003)
  worldMaster:_lookAtPlayerTutorial(1000347)
  worldMaster:_runCharaSchedulerTutorial(1100003, 353972224)
  worldMaster:_runCharaSchedulerTutorial(1100003, 403087360)
  A0_91:sayFreeDisplayName(1100003, A0_91, 98)
  desktopWidget:_setTargetCharacter(1, nil)
  desktopWidget:orderDesktopWidgetMode(16)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(L3_94, 2)
  L4_95 = false
  L5_96 = true
  L6_97 = true
  L7_98 = true
  L8_99 = true
  L9_100 = 4
  desktopWidget:setTutorialMask(L4_95, L5_96, L6_97, L7_98, L8_99, L9_100)
  A1_92:_unlockCameraControl()
  worldMaster:_cancelAimCameraTutorial(1100003)
  return L3_94
end
function Man0u0.processTtrNomal002(A0_103, A1_104, A2_105, A3_106)
  local L4_107, L5_108, L6_109, L7_110, L8_111, L9_112
  L4_107 = desktopWidget
  L5_108 = L4_107
  L4_107 = L4_107.cancelDesktopWidgetMode
  L6_109 = 16
  L4_107(L5_108, L6_109)
  L4_107 = desktopWidget
  L5_108 = L4_107
  L4_107 = L4_107.closeTutorialWidget
  L4_107(L5_108)
  L5_108 = A0_103
  L4_107 = A0_103._wait
  L6_109 = 0.5
  L4_107(L5_108, L6_109)
  L4_107 = desktopWidget
  L5_108 = L4_107
  L4_107 = L4_107.openTutorialWidget
  L6_109 = A3_106
  L7_110 = 3
  L4_107(L5_108, L6_109, L7_110)
  L4_107 = true
  L5_108 = false
  L6_109 = true
  L7_110 = true
  L8_111 = true
  L9_112 = 4
  desktopWidget:setTutorialMask(L4_107, L5_108, L6_109, L7_110, L8_111, L9_112)
  desktopWidget:_unlockTargetCursorControl()
  A1_104:_unlockLockonControl()
  A1_104:_unlockPlayerControl()
  desktopWidget:_waitForTargetTutorial(1100003)
  L4_107 = true
  L5_108 = true
  L6_109 = true
  L7_110 = true
  L8_111 = true
  L9_112 = 4
  desktopWidget:setTutorialMask(L4_107, L5_108, L6_109, L7_110, L8_111, L9_112)
  desktopWidget:closeTutorialWidget()
  desktopWidget:_lockTargetCursorControl()
  A0_103:_wait(0.5)
  desktopWidget:orderDesktopWidgetMode(16)
  A1_104:_lockPlayerControl()
  A1_104:_lockLockonControl()
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(A3_106, 4)
  L4_107 = true
  L5_108 = true
  L6_109 = false
  L7_110 = true
  L8_111 = true
  L9_112 = 4
  desktopWidget:setTutorialMask(L4_107, L5_108, L6_109, L7_110, L8_111, L9_112)
end
function Man0u0.processTtrNomal003(A0_113, A1_114, A2_115, A3_116)
  local L4_117, L5_118, L6_119, L7_120, L8_121, L9_122
  L4_117 = desktopWidget
  L5_118 = L4_117
  L4_117 = L4_117.closeTutorialWidget
  L4_117(L5_118)
  L5_118 = A0_113
  L4_117 = A0_113._wait
  L6_119 = 0.5
  L4_117(L5_118, L6_119)
  L5_118 = A2_115
  L4_117 = A2_115._runCharaScheduler
  L6_119 = 353964032
  L4_117(L5_118, L6_119)
  L5_118 = A2_115
  L4_117 = A2_115.say
  L6_119 = A0_113
  L7_120 = 100
  L8_121 = 0
  L4_117(L5_118, L6_119, L7_120, L8_121)
  L5_118 = A2_115
  L4_117 = A2_115.say
  L6_119 = A0_113
  L7_120 = 101
  L8_121 = 0
  L4_117(L5_118, L6_119, L7_120, L8_121)
  L4_117 = desktopWidget
  L5_118 = L4_117
  L4_117 = L4_117._setTargetCharacter
  L6_119 = 1
  L7_120 = nil
  L4_117(L5_118, L6_119, L7_120)
  L4_117 = desktopWidget
  L5_118 = L4_117
  L4_117 = L4_117.cancelDesktopWidgetMode
  L6_119 = 16
  L4_117(L5_118, L6_119)
  L4_117 = desktopWidget
  L5_118 = L4_117
  L4_117 = L4_117.openTutorialSuccessWidget
  L6_119 = 9020
  L7_120 = true
  L4_117(L5_118, L6_119, L7_120)
  L5_118 = A0_113
  L4_117 = A0_113._wait
  L6_119 = 3
  L4_117(L5_118, L6_119)
  L4_117 = true
  L5_118 = true
  L6_119 = true
  L7_120 = true
  L8_121 = true
  L9_122 = 1
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(A3_116, 5)
  worldMaster:_cancelLookAtPlayerTutorial(1100003)
  worldMaster:_cancelLookAtPlayerTutorial(1000347)
  desktopWidget:setTutorialMask(L4_117, L5_118, L6_119, L7_120, L8_121, L9_122)
end
function Man0u0.processTtrAfterBtl001(A0_123, A1_124, A2_125)
  local L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134
  L3_126 = desktopWidget
  L4_127 = L3_126
  L3_126 = L3_126.isTutorialMode
  L3_126 = L3_126(L4_127)
  if L3_126 == false then
    L3_126 = desktopWidget
    L4_127 = L3_126
    L3_126 = L3_126.orderTutorialMode
    L3_126(L4_127)
  end
  L4_127 = A1_124
  L3_126 = A1_124._fadeInNowLoadingForNoticeEventJustInArea
  L3_126(L4_127)
  L3_126 = desktopWidget
  L4_127 = L3_126
  L3_126 = L3_126.cancelDesktopWidgetMode
  L5_128 = 16
  L3_126(L4_127, L5_128)
  L3_126 = desktopWidget
  L4_127 = L3_126
  L3_126 = L3_126.closeTutorialWidget
  L3_126(L4_127)
  L3_126 = nil
  L4_127 = false
  L5_128 = worldMaster
  L6_129 = L5_128
  L5_128 = L5_128._isKeyboardOnlyTutorial
  L5_128 = L5_128(L6_129)
  while L4_127 == false do
    L6_129 = desktopWidget
    L7_130 = L6_129
    L6_129 = L6_129.askTutorialDeviceType
    L6_129 = L6_129(L7_130)
    L3_126 = L6_129
    L7_130 = A0_123
    L6_129 = A0_123._wait
    L8_131 = 3
    L6_129(L7_130, L8_131)
    L6_129 = worldMaster
    L7_130 = L6_129
    L6_129 = L6_129._isKeyboardOnlyTutorial
    L6_129 = L6_129(L7_130)
    if L6_129 ~= L5_128 then
      L6_129 = worldMaster
      L7_130 = L6_129
      L6_129 = L6_129._isKeyboardOnlyTutorial
      L6_129 = L6_129(L7_130)
      L5_128 = L6_129
      L4_127 = false
    else
      L4_127 = true
    end
  end
  L6_129 = false
  L7_130 = false
  L8_131 = false
  L9_132 = true
  L10_133 = true
  L11_134 = 3
  desktopWidget:closeTutorialWidget()
  desktopWidget:setTutorialMask(L6_129, L7_130, L8_131, L9_132, L10_133, L11_134)
  return L3_126
end
function Man0u0.processTtrMini001(A0_135, A1_136, A2_137)
  A2_137:startCliantTalkTurn(2, A1_136)
  A2_137:_runCharaScheduler(353964032)
  A2_137:say(A0_135, 10, 0)
  A2_137:say(A0_135, 11, 0)
  A2_137:finishCliantTalkTurn()
end
function Man0u0.processTtrMini002(A0_138, A1_139, A2_140)
  A2_140:startCliantTalkTurn(2, A1_139)
  A2_140:_runCharaScheduler(83992576)
  A2_140:say(A0_138, 66, 0)
  A2_140:finishCliantTalkTurn()
end
function Man0u0.processTtrMini002_first(A0_141, A1_142, A2_143)
  A2_143:startCliantTalkTurn(2, A1_142)
  A2_143:_runCharaScheduler(83992576)
  A2_143:say(A0_141, 131, 0)
  A2_143:finishCliantTalkTurn()
end
function Man0u0.processTtrMini003(A0_144, A1_145, A2_146)
  A2_146:startCliantTalkTurn(2, A1_145)
  A2_146:_runCharaScheduler(353959936)
  A2_146:say(A0_144, 72, 0)
  A2_146:say(A0_144, 73, 0)
  A2_146:finishCliantTalkTurn()
end
function Man0u0.processTtrMini003_first(A0_147, A1_148, A2_149)
  A2_149:startCliantTalkTurn(2, A1_148)
  A2_149:_runCharaScheduler(353959936)
  A2_149:say(A0_147, 132, 0)
  A2_149:say(A0_147, 133, 0)
  A2_149:finishCliantTalkTurn()
end
function Man0u0.processTtrBlkNml001(A0_150, A1_151, A2_152)
  if desktopWidget:isTutorialMode() == false then
    desktopWidget:orderTutorialMode()
  end
  worldMaster:_aimCameraTutorial(4000542)
  worldMaster:_lookAtPlayerTutorial(4000542)
  worldMaster:_runCharaSchedulerTutorial(4000542, 353972224)
  worldMaster:_runCharaSchedulerTutorial(4000542, 403087360)
  A0_150:sayFreeDisplayName(4000542, A0_150, 120)
  worldMaster:_cancelLookAtPlayerTutorial(4000542)
  worldMaster:_cancelAimCameraTutorial(4000542)
end
function Man0u0.processTtrBtl001(A0_153, A1_154, A2_155, A3_156)
  local L4_157, L5_158, L6_159, L7_160, L8_161, L9_162
  L4_157 = desktopWidget
  L5_158 = L4_157
  L4_157 = L4_157.closeTutorialWidget
  L4_157(L5_158)
  L5_158 = A0_153
  L4_157 = A0_153.startHQCutScene
  L6_159 = "MAN0U010"
  L7_160 = 1
  L4_157(L5_158, L6_159, L7_160)
  L5_158 = A0_153
  L4_157 = A0_153.startFadeInCutSceneDefault
  L6_159 = A1_154
  L4_157(L5_158, L6_159)
  L5_158 = A0_153
  L4_157 = A0_153.setMusic
  L6_159 = A1_154
  L7_160 = 25
  L8_161 = 1
  L4_157(L5_158, L6_159, L7_160, L8_161)
  L5_158 = A0_153
  L4_157 = A0_153._wait
  L6_159 = 2
  L4_157(L5_158, L6_159)
  L4_157 = worldMaster
  L5_158 = L4_157
  L4_157 = L4_157._aimCameraTutorial
  L6_159 = 1000010
  L4_157(L5_158, L6_159)
  L4_157 = worldMaster
  L5_158 = L4_157
  L4_157 = L4_157._lookAtPlayerTutorial
  L6_159 = 1000010
  L4_157(L5_158, L6_159)
  L4_157 = worldMaster
  L5_158 = L4_157
  L4_157 = L4_157._runCharaSchedulerTutorial
  L6_159 = 1000010
  L7_160 = 403087360
  L4_157(L5_158, L6_159, L7_160)
  L4_157 = worldMaster
  L5_158 = L4_157
  L4_157 = L4_157._runCharaSchedulerTutorial
  L6_159 = 1000010
  L7_160 = 403087360
  L4_157(L5_158, L6_159, L7_160)
  L5_158 = A0_153
  L4_157 = A0_153.sayFreeDisplayName
  L6_159 = 1000010
  L7_160 = A0_153
  L8_161 = 102
  L4_157(L5_158, L6_159, L7_160, L8_161)
  L4_157 = worldMaster
  L5_158 = L4_157
  L4_157 = L4_157._cancelAimCameraTutorial
  L6_159 = 1000010
  L4_157(L5_158, L6_159)
  L4_157 = desktopWidget
  L5_158 = L4_157
  L4_157 = L4_157.cancelDesktopWidgetMode
  L6_159 = 16
  L4_157(L5_158, L6_159)
  L4_157 = true
  L5_158 = true
  L6_159 = true
  L7_160 = false
  L8_161 = true
  L9_162 = 4
  desktopWidget:setTutorialMask(L4_157, L5_158, L6_159, L7_160, L8_161, L9_162)
  desktopWidget:openTutorialWidget(A3_156, 6)
  L4_157 = true
  L5_158 = true
  L6_159 = true
  L7_160 = false
  L8_161 = true
  L9_162 = 4
  desktopWidget:setTutorialMask(L4_157, L5_158, L6_159, L7_160, L8_161, L9_162)
end
function Man0u0.processTtrBtlMagic001(A0_163, A1_164, A2_165, A3_166)
  local L4_167, L5_168, L6_169, L7_170, L8_171, L9_172, L10_173, L11_174, L12_175, L13_176, L14_177, L15_178
  L4_167 = desktopWidget
  L5_168 = L4_167
  L4_167 = L4_167.closeTutorialWidget
  L4_167(L5_168)
  L4_167 = true
  L5_168 = true
  L6_169 = true
  L7_170 = false
  L8_171 = true
  L9_172 = 4
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173.setTutorialMask
  L12_175 = L4_167
  L13_176 = L5_168
  L14_177 = L6_169
  L15_178 = L7_170
  L10_173(L11_174, L12_175, L13_176, L14_177, L15_178, L8_171, L9_172)
  L11_174 = A0_163
  L10_173 = A0_163.startHQCutScene
  L12_175 = "MAN0U010"
  L13_176 = 1
  L10_173(L11_174, L12_175, L13_176)
  L11_174 = A0_163
  L10_173 = A0_163.startFadeInCutSceneDefault
  L12_175 = A1_164
  L10_173(L11_174, L12_175)
  L11_174 = A0_163
  L10_173 = A0_163.setMusic
  L12_175 = A1_164
  L13_176 = 25
  L14_177 = 1
  L10_173(L11_174, L12_175, L13_176, L14_177)
  L11_174 = A0_163
  L10_173 = A0_163._wait
  L12_175 = 2
  L10_173(L11_174, L12_175)
  L10_173 = worldMaster
  L11_174 = L10_173
  L10_173 = L10_173._aimCameraTutorial
  L12_175 = 1000010
  L10_173(L11_174, L12_175)
  L10_173 = worldMaster
  L11_174 = L10_173
  L10_173 = L10_173._lookAtPlayerTutorial
  L12_175 = 1000010
  L10_173(L11_174, L12_175)
  L10_173 = worldMaster
  L11_174 = L10_173
  L10_173 = L10_173._runCharaSchedulerTutorial
  L12_175 = 1000010
  L13_176 = 403087360
  L10_173(L11_174, L12_175, L13_176)
  L10_173 = worldMaster
  L11_174 = L10_173
  L10_173 = L10_173._runCharaSchedulerTutorial
  L12_175 = 1000010
  L13_176 = 403087360
  L10_173(L11_174, L12_175, L13_176)
  L11_174 = A0_163
  L10_173 = A0_163.sayFreeDisplayName
  L12_175 = 1000010
  L13_176 = A0_163
  L14_177 = 150
  L10_173(L11_174, L12_175, L13_176, L14_177)
  L10_173 = worldMaster
  L11_174 = L10_173
  L10_173 = L10_173._cancelAimCameraTutorial
  L12_175 = 1000010
  L10_173(L11_174, L12_175)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173.cancelDesktopWidgetMode
  L12_175 = 16
  L10_173(L11_174, L12_175)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173.openTutorialWidget
  L12_175 = A3_166
  L13_176 = 7
  L10_173(L11_174, L12_175, L13_176)
  L4_167 = true
  L5_168 = false
  L6_169 = true
  L7_170 = true
  L8_171 = true
  L9_172 = 4
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173.setTutorialMask
  L12_175 = L4_167
  L13_176 = L5_168
  L14_177 = L6_169
  L15_178 = L7_170
  L10_173(L11_174, L12_175, L13_176, L14_177, L15_178, L8_171, L9_172)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173.closeAllEventModeWidget
  L10_173(L11_174)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173._unlockTargetCursorControl
  L10_173(L11_174)
  L11_174 = A1_164
  L10_173 = A1_164._unlockLockonControl
  L10_173(L11_174)
  L11_174 = A1_164
  L10_173 = A1_164._unlockPlayerControl
  L10_173(L11_174)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173._waitForTargetTutorial
  L12_175 = 3203301
  L10_173(L11_174, L12_175)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173.closeTutorialWidget
  L10_173(L11_174)
  L11_174 = A0_163
  L10_173 = A0_163._wait
  L12_175 = 1
  L10_173(L11_174, L12_175)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173._lockTargetCursorControl
  L10_173(L11_174)
  L10_173 = desktopWidget
  L11_174 = L10_173
  L10_173 = L10_173.orderDesktopWidgetMode
  L12_175 = 16
  L10_173(L11_174, L12_175)
  L11_174 = A1_164
  L10_173 = A1_164._lockPlayerControl
  L10_173(L11_174)
  L11_174 = A1_164
  L10_173 = A1_164._lockLockonControl
  L10_173(L11_174)
  L10_173 = 1
  L12_175 = A1_164
  L11_174 = A1_164.getStateMainSkill
  L11_174 = L11_174(L12_175)
  L13_176 = A1_164
  L12_175 = A1_164.getSkillCategory
  L14_177 = L11_174
  L12_175 = L12_175(L13_176, L14_177)
  if L12_175 == 21 then
    L10_173 = 3
  elseif L12_175 == 29 or L12_175 == 39 then
    L10_173 = 4
  elseif L11_174 == 7 then
    L10_173 = 2
  else
    L10_173 = 1
  end
  L13_176, L14_177, L15_178 = nil, nil, nil
  if L10_173 == 1 then
    L13_176 = 106
    L14_177 = 113
    L15_178 = 8
  elseif L10_173 == 2 then
    L13_176 = 107
    L14_177 = 114
    L15_178 = 9
  elseif L10_173 == 3 then
    L13_176 = 108
    L14_177 = 115
    L15_178 = 10
  elseif L10_173 == 4 then
    L13_176 = 109
    L14_177 = 116
    L15_178 = 11
  end
  if L10_173 == 3 then
    if L11_174 == 22 then
    else
    end
  else
  end
  desktopWidget:cancelDesktopWidgetMode(16)
  L4_167 = true
  L5_168 = true
  L6_169 = true
  L7_170 = true
  L8_171 = true
  L9_172 = 4
  desktopWidget:openTutorialWidget(A3_166, L15_178)
  if L10_173 == 1 then
    L4_167 = false
    L5_168 = false
    L6_169 = false
    L7_170 = false
    L8_171 = false
    L9_172 = 3
  else
    L4_167 = false
    L5_168 = false
    L6_169 = false
    L7_170 = false
    L8_171 = false
    L9_172 = 3
  end
  desktopWidget:setTutorialMask(L4_167, L5_168, L6_169, L7_170, L8_171, L9_172)
end
function Man0u0.processTtrBtl002(A0_179, A1_180, A2_181, A3_182)
  local L4_183, L5_184, L6_185, L7_186, L8_187, L9_188, L10_189, L11_190, L12_191, L13_192, L14_193, L15_194, L16_195, L17_196, L18_197, L19_198, L20_199, L21_200, L22_201
  L4_183 = desktopWidget
  L5_184 = L4_183
  L4_183 = L4_183.cancelDesktopWidgetMode
  L6_185 = 16
  L4_183(L5_184, L6_185)
  L4_183 = desktopWidget
  L5_184 = L4_183
  L4_183 = L4_183.closeTutorialWidget
  L4_183(L5_184)
  L5_184 = A0_179
  L4_183 = A0_179._wait
  L6_185 = 1
  L4_183(L5_184, L6_185)
  L4_183 = desktopWidget
  L5_184 = L4_183
  L4_183 = L4_183.orderDesktopWidgetMode
  L6_185 = 16
  L4_183(L5_184, L6_185)
  L4_183 = worldMaster
  L5_184 = L4_183
  L4_183 = L4_183._aimCameraTutorial
  L6_185 = 1200024
  L4_183(L5_184, L6_185)
  L4_183 = worldMaster
  L5_184 = L4_183
  L4_183 = L4_183._lookAtPlayerTutorial
  L6_185 = 1200024
  L4_183(L5_184, L6_185)
  L4_183 = worldMaster
  L5_184 = L4_183
  L4_183 = L4_183._runCharaSchedulerTutorial
  L6_185 = 1200024
  L7_186 = 403087360
  L4_183(L5_184, L6_185, L7_186)
  L5_184 = A0_179
  L4_183 = A0_179.sayFreeDisplayName
  L6_185 = 1200024
  L7_186 = A0_179
  L8_187 = 104
  L4_183(L5_184, L6_185, L7_186, L8_187)
  L4_183 = worldMaster
  L5_184 = L4_183
  L4_183 = L4_183._cancelAimCameraTutorial
  L6_185 = 1000010
  L4_183(L5_184, L6_185)
  L4_183 = desktopWidget
  L5_184 = L4_183
  L4_183 = L4_183.cancelDesktopWidgetMode
  L6_185 = 16
  L4_183(L5_184, L6_185)
  L4_183 = desktopWidget
  L5_184 = L4_183
  L4_183 = L4_183.openTutorialWidget
  L6_185 = A3_182
  L7_186 = 7
  L4_183(L5_184, L6_185, L7_186)
  L4_183 = true
  L5_184 = false
  L6_185 = true
  L7_186 = true
  L8_187 = true
  L9_188 = 4
  L10_189 = desktopWidget
  L11_190 = L10_189
  L10_189 = L10_189.setTutorialMask
  L12_191 = L4_183
  L13_192 = L5_184
  L14_193 = L6_185
  L15_194 = L7_186
  L16_195 = L8_187
  L17_196 = L9_188
  L10_189(L11_190, L12_191, L13_192, L14_193, L15_194, L16_195, L17_196)
  L10_189 = desktopWidget
  L11_190 = L10_189
  L10_189 = L10_189.closeAllEventModeWidget
  L10_189(L11_190)
  L10_189 = desktopWidget
  L11_190 = L10_189
  L10_189 = L10_189._unlockTargetCursorControl
  L10_189(L11_190)
  L11_190 = A1_180
  L10_189 = A1_180._unlockLockonControl
  L10_189(L11_190)
  L11_190 = A1_180
  L10_189 = A1_180._unlockPlayerControl
  L10_189(L11_190)
  L10_189 = desktopWidget
  L11_190 = L10_189
  L10_189 = L10_189._waitForTargetTutorial
  L12_191 = 3203301
  L10_189(L11_190, L12_191)
  L10_189 = desktopWidget
  L11_190 = L10_189
  L10_189 = L10_189.closeTutorialWidget
  L10_189(L11_190)
  L11_190 = A0_179
  L10_189 = A0_179._wait
  L12_191 = 1
  L10_189(L11_190, L12_191)
  L10_189 = desktopWidget
  L11_190 = L10_189
  L10_189 = L10_189._lockTargetCursorControl
  L10_189(L11_190)
  L10_189 = desktopWidget
  L11_190 = L10_189
  L10_189 = L10_189.orderDesktopWidgetMode
  L12_191 = 16
  L10_189(L11_190, L12_191)
  L11_190 = A1_180
  L10_189 = A1_180._lockPlayerControl
  L10_189(L11_190)
  L11_190 = A1_180
  L10_189 = A1_180._lockLockonControl
  L10_189(L11_190)
  L10_189 = 1
  L12_191 = A1_180
  L11_190 = A1_180.getStateMainSkill
  L11_190 = L11_190(L12_191)
  L13_192 = A1_180
  L12_191 = A1_180.getSkillCategory
  L14_193 = L11_190
  L12_191 = L12_191(L13_192, L14_193)
  if L12_191 == 21 then
    L10_189 = 3
  elseif L12_191 == 29 or L12_191 == 39 then
    L10_189 = 4
  elseif L11_190 == 7 then
    L10_189 = 2
  else
    L10_189 = 1
  end
  L13_192, L14_193, L15_194 = nil, nil, nil
  if L10_189 == 1 then
    L13_192 = 106
    L14_193 = 113
    L15_194 = 8
  elseif L10_189 == 2 then
    L13_192 = 107
    L14_193 = 114
    L15_194 = 9
  elseif L10_189 == 3 then
    L13_192 = 108
    L14_193 = 115
    L15_194 = 10
  elseif L10_189 == 4 then
    L13_192 = 109
    L14_193 = 116
    L15_194 = 11
  end
  L16_195 = nil
  if L10_189 == 3 then
    if L11_190 == 22 then
      L16_195 = 2
    else
      L16_195 = 1
    end
  else
  end
  L17_196 = desktopWidget
  L18_197 = L17_196
  L17_196 = L17_196.cancelDesktopWidgetMode
  L19_198 = 16
  L17_196(L18_197, L19_198)
  L17_196 = desktopWidget
  L18_197 = L17_196
  L17_196 = L17_196.openTutorialWidget
  L19_198 = A3_182
  L20_199 = L15_194
  L17_196(L18_197, L19_198, L20_199)
  L17_196, L18_197, L19_198, L20_199, L21_200, L22_201 = nil, nil, nil, nil, nil, nil
  if L10_189 == 1 then
    L17_196 = false
    L18_197 = false
    L19_198 = false
    L20_199 = false
    L21_200 = false
    L22_201 = 3
  else
    L17_196 = false
    L18_197 = false
    L19_198 = false
    L20_199 = false
    L21_200 = false
    L22_201 = 3
  end
  desktopWidget:setTutorialMask(L17_196, L18_197, L19_198, L20_199, L21_200, L22_201)
end
function Man0u0.processTtrBtl003(A0_202, A1_203, A2_204)
  local L3_205, L4_206, L5_207, L6_208, L7_209, L8_210, L9_211, L10_212, L11_213
  L3_205 = desktopWidget
  L4_206 = L3_205
  L3_205 = L3_205.cancelDesktopWidgetMode
  L5_207 = 16
  L3_205(L4_206, L5_207)
  L3_205 = desktopWidget
  L4_206 = L3_205
  L3_205 = L3_205.closeTutorialWidget
  L3_205(L4_206)
  L4_206 = A0_202
  L3_205 = A0_202._wait
  L5_207 = 3
  L3_205(L4_206, L5_207)
  L3_205 = 1
  L5_207 = A1_203
  L4_206 = A1_203.getStateMainSkill
  L4_206 = L4_206(L5_207)
  L6_208 = A1_203
  L5_207 = A1_203.getSkillCategory
  L7_209 = L4_206
  L5_207 = L5_207(L6_208, L7_209)
  if L5_207 == 21 then
    L3_205 = 3
  elseif L5_207 == 29 or L5_207 == 39 then
    L3_205 = 4
  elseif L4_206 == 7 then
    L3_205 = 2
  else
    L3_205 = 1
  end
  if L3_205 == 1 or L3_205 == 2 then
    L6_208 = desktopWidget
    L7_209 = L6_208
    L6_208 = L6_208.orderDesktopWidgetMode
    L8_210 = 16
    L6_208(L7_209, L8_210)
    L7_209 = A0_202
    L6_208 = A0_202.sayFreeDisplayName
    L8_210 = 1000010
    L9_211 = A0_202
    L10_212 = 110
    L6_208(L7_209, L8_210, L9_211, L10_212)
    L6_208 = desktopWidget
    L7_209 = L6_208
    L6_208 = L6_208.cancelDesktopWidgetMode
    L8_210 = 16
    L6_208(L7_209, L8_210)
    L6_208 = desktopWidget
    L7_209 = L6_208
    L6_208 = L6_208.openTutorialWidget
    L8_210 = 2
    L9_211 = 12
    L6_208(L7_209, L8_210, L9_211)
    L6_208 = false
    L7_209 = false
    L8_210 = false
    L9_211 = false
    L10_212 = false
    L11_213 = 3
    desktopWidget:setTutorialMask(L6_208, L7_209, L8_210, L9_211, L10_212, L11_213)
  end
end
function Man0u0.processTtrBtl004(A0_214, A1_215, A2_216)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:closeTutorialWidget()
  desktopWidget:openTutorialSuccessWidget(4305, true)
  A0_214:_wait(3)
  A0_214:processInformDialogAsQuest(A0_214, 117)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:openTutorialWidget(2, 13)
end
function Man0u0.processTtrBlkNml002(A0_217, A1_218, A2_219)
  local L3_220, L4_221, L5_222, L6_223, L7_224, L8_225
  L3_220 = desktopWidget
  L4_221 = L3_220
  L3_220 = L3_220.isTutorialMode
  L3_220 = L3_220(L4_221)
  if L3_220 == false then
    L3_220 = desktopWidget
    L4_221 = L3_220
    L3_220 = L3_220.orderTutorialMode
    L3_220(L4_221)
  end
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._aimCameraTutorial
  L5_222 = 4000608
  L3_220(L4_221, L5_222)
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._lookAtPlayerTutorial
  L5_222 = 4000608
  L3_220(L4_221, L5_222)
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._lookAtPlayerTutorial
  L5_222 = 4000609
  L3_220(L4_221, L5_222)
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._runCharaSchedulerTutorial
  L5_222 = 4000608
  L6_223 = 403087360
  L3_220(L4_221, L5_222, L6_223)
  L4_221 = A0_217
  L3_220 = A0_217.sayFreeDisplayName
  L5_222 = 4000608
  L6_223 = A0_217
  L7_224 = 123
  L3_220(L4_221, L5_222, L6_223, L7_224)
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._runCharaSchedulerTutorial
  L5_222 = 4000609
  L6_223 = 353972224
  L3_220(L4_221, L5_222, L6_223)
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._runCharaSchedulerTutorial
  L5_222 = 4000609
  L6_223 = 403087360
  L3_220(L4_221, L5_222, L6_223)
  L4_221 = A0_217
  L3_220 = A0_217.sayFreeDisplayName
  L5_222 = 4000609
  L6_223 = A0_217
  L7_224 = 124
  L3_220(L4_221, L5_222, L6_223, L7_224)
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._cancelLookAtPlayerTutorial
  L5_222 = 4000608
  L3_220(L4_221, L5_222)
  L3_220 = worldMaster
  L4_221 = L3_220
  L3_220 = L3_220._cancelLookAtPlayerTutorial
  L5_222 = 4000609
  L3_220(L4_221, L5_222)
  L3_220 = false
  L4_221 = false
  L5_222 = false
  L6_223 = true
  L7_224 = true
  L8_225 = 3
  desktopWidget:setTutorialMask(L3_220, L4_221, L5_222, L6_223, L7_224, L8_225)
  worldMaster:_cancelAimCameraTutorial(4000608)
end
function Man0u0.processTtrBlkNml003(A0_226, A1_227, A2_228)
  local L3_229, L4_230, L5_231, L6_232, L7_233, L8_234
  L3_229 = desktopWidget
  L4_230 = L3_229
  L3_229 = L3_229.isTutorialMode
  L3_229 = L3_229(L4_230)
  if L3_229 == false then
    L3_229 = desktopWidget
    L4_230 = L3_229
    L3_229 = L3_229.orderTutorialMode
    L3_229(L4_230)
  end
  L3_229 = worldMaster
  L4_230 = L3_229
  L3_229 = L3_229._aimCameraTutorial
  L5_231 = 4000610
  L3_229(L4_230, L5_231)
  L3_229 = worldMaster
  L4_230 = L3_229
  L3_229 = L3_229._lookAtPlayerTutorial
  L5_231 = 4000610
  L3_229(L4_230, L5_231)
  L3_229 = worldMaster
  L4_230 = L3_229
  L3_229 = L3_229._runCharaSchedulerTutorial
  L5_231 = 4000610
  L6_232 = 353972224
  L3_229(L4_230, L5_231, L6_232)
  L3_229 = worldMaster
  L4_230 = L3_229
  L3_229 = L3_229._runCharaSchedulerTutorial
  L5_231 = 4000610
  L6_232 = 403087360
  L3_229(L4_230, L5_231, L6_232)
  L4_230 = A0_226
  L3_229 = A0_226.sayFreeDisplayName
  L5_231 = 4000610
  L6_232 = A0_226
  L7_233 = 125
  L3_229(L4_230, L5_231, L6_232, L7_233)
  L3_229 = worldMaster
  L4_230 = L3_229
  L3_229 = L3_229._cancelLookAtPlayerTutorial
  L5_231 = 4000610
  L3_229(L4_230, L5_231)
  L3_229 = false
  L4_230 = false
  L5_231 = false
  L6_232 = true
  L7_233 = true
  L8_234 = 3
  desktopWidget:setTutorialMask(L3_229, L4_230, L5_231, L6_232, L7_233, L8_234)
  worldMaster:_cancelAimCameraTutorial(4000610)
end
function Man0u0.processEtc001(A0_235, A1_236, A2_237)
  A2_237:startCliantTalkTurn(2, A1_236)
  A2_237:_runCharaScheduler(353959936)
  A2_237:say(A0_235, 124, 0)
  A2_237:finishCliantTalkTurn()
end
function Man0u0.processEtc002(A0_238, A1_239, A2_240)
  A2_240:startCliantTalkTurn(2, A1_239)
  A2_240:_runCharaScheduler(353959936)
  A2_240:say(A0_238, 125, 0)
  A2_240:finishCliantTalkTurn()
end
function Man0u0.processEtc003(A0_241, A1_242, A2_243)
  A2_243:startCliantTalkTurn(2, A1_242)
  A2_243:_runCharaScheduler(353959936)
  A2_243:say(A0_241, 123, 0)
  A2_243:finishCliantTalkTurn()
end
function Man0u0.processInformDialogAsQuest(A0_244, A1_245, A2_246)
  desktopWidget:openPublicInformDialogWidget(A0_244, A1_245, A2_246)
  A0_244:_wait(2)
  desktopWidget:getStaticWidget(8):hide()
end
