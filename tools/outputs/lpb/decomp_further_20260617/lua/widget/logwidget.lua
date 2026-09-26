require("/Widget/WidgetBaseClass")
_defineClass("LogWidget", "WidgetBaseClass")
function LogWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "LogWidget"
  return L1_1
end
function LogWidget.init(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8
  L2_4 = A0_2.work
  L6_8 = "integer8"
  L6_8 = "tellHistoryIndex"
  L6_8 = {
    "sendHistoryIndex",
    "integer8"
  }
  L2_4._temp = L3_5
  if A1_3 == 1 then
    L2_4 = A0_2.setControlCommandCondition
    L2_4(L3_5, L4_6, L5_7)
    L2_4 = A0_2.setControlCommandCondition
    L2_4(L3_5, L4_6, L5_7)
    L2_4 = A0_2.setConfirmCondition
    L2_4(L3_5, L4_6)
    L2_4 = ""
    for L6_8 = 1, 7 do
      L2_4 = "Button_Command_" .. tostring(L6_8)
      A0_2:setConfirmCondition(L2_4)
    end
    L3_5(L4_6, L5_7)
  end
  L2_4 = A0_2.setCancelCondition
  L2_4(L3_5)
  L2_4 = A0_2.setControlCommandCondition
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = A0_2.setControlCommandCondition
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = A0_2.setUICommandCondition
  L2_4(L3_5, L4_6)
  L2_4 = A0_2.setUICommandCondition
  L2_4(L3_5, L4_6)
  L2_4 = A0_2.setUICommandCondition
  L2_4(L3_5, L4_6)
  L2_4 = A0_2.setModalGroup
  L2_4(L3_5, L4_6)
  L2_4 = A0_2.hideChatMenu
  L2_4(L3_5)
  if A1_3 == 2 then
    L2_4 = A0_2.setProperty
    L2_4(L3_5, L4_6, L5_7)
    L2_4 = A0_2.hideChatInput
    L2_4(L3_5)
    L2_4 = A0_2.cancelFocus
    L2_4(L3_5)
  end
  L2_4 = A0_2.work
  L2_4.index = A1_3
  L2_4 = A0_2.work
  L2_4.inputHistoryIndex = 0
  L2_4 = A0_2.work
  L2_4.tellHistoryIndex = 0
  L2_4 = A0_2.work
  L2_4.sendHistoryIndex = 0
  L2_4 = A0_2.work
  L2_4.inputHistoryCount = 0
  L2_4 = A0_2.work
  L2_4.tellHistoryCount = 0
  L2_4 = A0_2.work
  L2_4.sendHistoryCount = 0
  L2_4 = A0_2.work
  L2_4.chatMode = 1
  L2_4 = A0_2.work
  L2_4.temporaryChatMode = 0
  L2_4 = A0_2.work
  L2_4.autoHideEnable = true
  L2_4 = A0_2.setText
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = A0_2.setStyle
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = A0_2.setVisibility
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = A0_2.setVisibility
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = A0_2.updateLogCategoryDisplayFromUserConfig
  L2_4(L3_5)
end
function LogWidget.processUICommandDefault(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  local L6_15, L7_16
  if A3_12 == "UILuaCommands.PressEnter" then
    if A4_13 ~= nil and A4_13 ~= "" then
      L6_15 = desktopWidget
      L7_16 = L6_15
      L6_15 = L6_15.processInputWordAnalyze
      L7_16 = L6_15(L7_16, A4_13)
      if L6_15 ~= nil and A0_9:requestSelectSubTarget(L6_15, true, L7_16) == true then
        A0_9:setControlUserWorkString(3, "TextBox_ChatInput", A4_13)
      end
      A0_9:saveInputHistory(A4_13)
    end
    L7_16 = A0_9
    L6_15 = A0_9.setDeactiveBatch
    L6_15(L7_16)
  elseif A3_12 == "UILuaCommands.SetHistory" then
    L6_15 = 0
    if A4_13 == 1 then
      L7_16 = A0_9.work
      L7_16 = L7_16.inputHistoryIndex
      L6_15 = L7_16 + 1
    elseif A4_13 == 2 then
      L7_16 = A0_9.work
      L7_16 = L7_16.inputHistoryIndex
      L6_15 = L7_16 - 1
    end
    L7_16 = A0_9.addInputHistory
    L7_16(A0_9, L6_15)
  elseif A3_12 == "UILuaCommands.ReceiveTell" then
    L6_15 = desktopWidget
    L7_16 = L6_15
    L6_15 = L6_15.getConfigFlag
    L6_15 = L6_15(L7_16, 38)
    if L6_15 == true then
      L7_16 = A0_9
      L6_15 = A0_9.sendCommand
      L6_15(L7_16, "UILuaCommands.PlaySeReceiveTell")
    end
    L7_16 = A0_9
    L6_15 = A0_9.saveTellHistory
    L6_15(L7_16, A4_13)
  elseif A3_12 == "UILuaCommands.NextTabItem" then
    L7_16 = A0_9
    L6_15 = A0_9.getItemCount
    L6_15 = L6_15(L7_16, "TabControl_Log")
    L7_16 = A0_9.getSelectedIndex
    L7_16 = L7_16(A0_9, "TabControl_Log")
    L7_16 = L7_16 + 1
    if L6_15 <= L7_16 then
      L7_16 = L7_16 - L6_15
    end
    A0_9:setSelectedIndex("TabControl_Log", L7_16)
  elseif A3_12 == "UILuaCommands.PreviousTabItem" then
    L7_16 = A0_9
    L6_15 = A0_9.getItemCount
    L6_15 = L6_15(L7_16, "TabControl_Log")
    L7_16 = A0_9.getSelectedIndex
    L7_16 = L7_16(A0_9, "TabControl_Log")
    L7_16 = L7_16 - 1
    if L7_16 < 0 then
      L7_16 = L7_16 + L6_15
    end
    A0_9:setSelectedIndex("TabControl_Log", L7_16)
  elseif A3_12 == "UILuaCommands.Deactivated" then
    L6_15 = A0_9.work
    L6_15 = L6_15.index
    if L6_15 == 1 then
      L7_16 = A0_9
      L6_15 = A0_9.saveInputHistory
      L6_15(L7_16, A0_9:getChatInputText())
    end
    L7_16 = A0_9
    L6_15 = A0_9.setDeactiveBatch
    L6_15(L7_16)
  elseif A3_12 == "UILuaCommands.EnterFocus" then
    L7_16 = A0_9
    L6_15 = A0_9.getControlProperty
    L6_15 = L6_15(L7_16, "Grid_ChatMenu", "IsKeyboardFocusWithin")
    if L6_15 == false then
      L7_16 = A0_9
      L6_15 = A0_9.getVisibility
      L6_15 = L6_15(L7_16, "Grid_ChatMenu")
      if L6_15 == true then
        L7_16 = A0_9
        L6_15 = A0_9.hideChatMenu
        L6_15(L7_16)
      end
    end
  end
end
function LogWidget.processUICommandOperate(A0_17, A1_18, A2_19, A3_20, A4_21)
  local L5_22, L6_23, L7_24, L8_25, L9_26
  if A2_19 == "Button_ChatInput" then
    L5_22 = A0_17.getVisibility
    L5_22 = L5_22(L6_23, L7_24)
    if L5_22 == true then
      L5_22 = A0_17.hideChatMenu
      L5_22(L6_23)
    else
      L5_22 = A0_17.showChatMenu
      L5_22(L6_23)
    end
    return
  end
  L5_22 = desktopWidget
  L5_22 = L5_22.getTutorialMenuType
  L5_22 = L5_22(L6_23)
  if L5_22 == 0 or L5_22 == 3 then
    if A2_19 == "Button_Command_6" then
      L6_23(L7_24, L8_25)
      return
    elseif A2_19 == "Button_Command_7" then
      L6_23(L7_24, L8_25)
      return
    end
  else
    L6_23(L7_24)
  end
  for L9_26 = 1, 5 do
    if A2_19 == "Button_Command_" .. tostring(L9_26) then
      if L9_26 == 3 then
        A0_17:setTellAddress(A0_17:getSendHistoryCache(A0_17:getSendHistoryCount()))
      end
      A0_17:setChatMode(L9_26)
      A0_17:hideChatMenu()
      A0_17:setKeyboardFocusedControl("Button_ChatInput")
      return
    end
  end
end
function LogWidget.processUICommandCancel(A0_27, A1_28, A2_29, A3_30, A4_31)
  if A0_27:getControlProperty("Grid_ChatMenu", "IsKeyboardFocusWithin") == true then
    A0_27:hideChatMenu()
    A0_27:setKeyboardFocusedControl("Button_ChatInput")
    return
  end
  A0_27:saveInputHistory(A0_27:getChatInputText())
  A0_27:setDeactiveBatch()
end
function LogWidget.processSubTargetDecided(A0_32, A1_33, A2_34, A3_35, A4_36, A5_37, A6_38)
  local L7_39
  if A1_33 == nil then
    return
  end
  L7_39 = A0_32.getControlUserWorkString
  L7_39 = L7_39(A0_32, 3, "TextBox_ChatInput")
  desktopWidget:executeTextCommand(L7_39, false, A1_33, nil, true)
end
function LogWidget.setKeyboardFocusToChatControl(A0_40)
  return A0_40:setKeyboardFocusToChatInput()
end
function LogWidget.appendStringForChatControl(A0_41, A1_42)
  local L2_43, L3_44
  L2_43 = desktopWidget
  L3_44 = L2_43
  L2_43 = L2_43._getKeyboardFocusedWidget
  L2_43 = L2_43(L3_44)
  if L2_43 == A0_41 then
    L3_44 = A0_41
    L2_43 = A0_41.getChatInputText
    L2_43 = L2_43(L3_44)
    L3_44 = L2_43
    L2_43 = L3_44 .. A1_42
    L3_44 = A0_41.setText
    L3_44(A0_41, "TextBox_ChatInput", L2_43)
    if A1_42 == "/" then
      L3_44 = A0_41._sendStoryboardCommand
      L3_44(A0_41, nil, "TextBox_ChatInput", "ApplicationCommands.ImeOff")
    end
    L3_44 = true
    return L3_44
  end
  L2_43 = false
  return L2_43
end
function LogWidget.startChatInputForPadMode(A0_45, A1_46)
  A0_45:sendControlCommand("TextBox_ChatInput", "App.KeyDown", A1_46)
end
function LogWidget.appendTextIdForChatControl(A0_47, A1_48, ...)
  if desktopWidget:_getKeyboardFocusedWidget() == A0_47 then
    A0_47:setMacroText("TextBox_ChatInput", A1_48, ...)
    return true
  end
  return false
end
function LogWidget.cancelLogWait(A0_50)
  A0_50:_sendStoryboardCommand(nil, "LogControl_Main_1", "RaptureCommands.LogControlPressKeyCancel")
end
function LogWidget.setChatMode(A0_51, A1_52, A2_53, A3_54)
  if A3_54 == true or A1_52 == 2 then
    A0_51.work.temporaryChatMode = A1_52
    if A0_51.work.temporaryChatMode == 3 then
      A0_51:setTellTemporaryAddress(A2_53)
    end
  else
    A0_51.work.chatMode = A1_52
    A0_51.work.temporaryChatMode = 0
    A0_51:setTellTemporaryAddress()
    if A0_51.work.chatMode == 3 then
      A0_51:setTellAddress(A2_53)
    end
  end
  A0_51:updateTitle()
end
function LogWidget.resetTemporaryChatMode(A0_55)
  A0_55.work.temporaryChatMode = 0
  A0_55:updateTitle()
end
function LogWidget.updateTitle(A0_56)
  local L1_57, L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64
  L1_57 = false
  L2_58 = false
  L3_59 = A0_56.work
  L3_59 = L3_59.chatMode
  L5_61 = A0_56
  L4_60 = A0_56.getTellAddress
  L4_60 = L4_60(L5_61)
  L5_61 = A0_56.work
  L5_61 = L5_61.temporaryChatMode
  if L5_61 ~= 0 then
    L5_61 = A0_56.work
    L3_59 = L5_61.temporaryChatMode
    L6_62 = A0_56
    L5_61 = A0_56.getTellTemporaryAddress
    L5_61 = L5_61(L6_62)
    L4_60 = L5_61
  end
  L5_61 = L3_59
  if L5_61 == 1 then
    L7_63 = A0_56
    L6_62 = A0_56.setText
    L8_64 = "TextBlock_ChannelTitle"
    L6_62(L7_63, L8_64, 2227)
    L7_63 = A0_56
    L6_62 = A0_56.setChatColor
    L8_64 = 1
    L6_62(L7_63, L8_64)
    break
  else
  end
  if L5_61 == 2 then
    L7_63 = A0_56
    L6_62 = A0_56.setText
    L8_64 = "TextBlock_ChannelTitle"
    L6_62(L7_63, L8_64, 2228)
    L7_63 = A0_56
    L6_62 = A0_56.setChatColor
    L8_64 = 2
    L6_62(L7_63, L8_64)
    break
  else
  end
  if L5_61 == 3 then
    L7_63 = A0_56
    L6_62 = A0_56.setText
    L8_64 = "TextBlock_ChannelTitle"
    L6_62(L7_63, L8_64, 2229)
    L2_58 = true
    if L4_60 ~= nil then
      if L4_60 ~= "" then
        L7_63 = A0_56
        L6_62 = A0_56.setText
        L8_64 = "TextBlock_Name"
        L6_62(L7_63, L8_64, 2262, L4_60)
      else
        L7_63 = A0_56
        L6_62 = A0_56.setText
        L8_64 = "TextBlock_Name"
        L6_62(L7_63, L8_64, "")
      end
    else
      L7_63 = A0_56
      L6_62 = A0_56.setText
      L8_64 = "TextBlock_Name"
      L6_62(L7_63, L8_64, "")
    end
    L7_63 = A0_56
    L6_62 = A0_56.setChatColor
    L8_64 = 3
    L6_62(L7_63, L8_64)
    break
  else
  end
  if L5_61 == 4 then
    L7_63 = A0_56
    L6_62 = A0_56.setText
    L8_64 = "TextBlock_ChannelTitle"
    L6_62(L7_63, L8_64, 2230)
    L7_63 = A0_56
    L6_62 = A0_56.setChatColor
    L8_64 = 4
    L6_62(L7_63, L8_64)
    break
  else
  end
  if L5_61 == 5 then
    L7_63 = A0_56
    L6_62 = A0_56.getCurrentLinkShellIndex
    L6_62 = L6_62(L7_63)
    L7_63 = 2231
    if L6_62 ~= nil then
      L8_64 = L7_63 + L6_62
      L7_63 = L8_64 - 1
    end
    L8_64 = A0_56.setText
    L8_64(A0_56, "TextBlock_ChannelTitle", L7_63)
    L8_64 = desktopWidget
    L8_64 = L8_64.isValidCurrnetLinkshell
    L8_64 = L8_64(L8_64)
    if L8_64 then
      L1_57 = true
      L8_64 = A0_56.setIcon
      L8_64(A0_56, "IconControl_LinkshellIcon", desktopWidget:getCurrnetLinkshellIconID())
      L2_58 = true
      L8_64 = worldMaster
      L8_64 = L8_64._getMyPlayer
      L8_64 = L8_64(L8_64)
      L8_64 = L8_64.getCommunityGroupCurrent
      L8_64 = L8_64(L8_64, 20002)
      A0_56:setTextWorldMaster("TextBlock_Name", 33626, L8_64)
    end
    L8_64 = A0_56.setChatColor
    L8_64(A0_56, 5, L6_62)
    do break end
    break
  else
  end
  L6_62 = A0_56
  L5_61 = A0_56.setVisibility
  L7_63 = "IconControl_LinkshellIcon"
  L8_64 = L1_57
  L5_61(L6_62, L7_63, L8_64)
  L6_62 = A0_56
  L5_61 = A0_56.setVisibility
  L7_63 = "TextBlock_Name"
  L8_64 = L2_58
  L5_61(L6_62, L7_63, L8_64)
end
function LogWidget.getChatMode(A0_65)
  local L1_66, L2_67
  L1_66 = A0_65.work
  L1_66 = L1_66.chatMode
  L2_67 = nil
  if A0_65.work.temporaryChatMode ~= 0 then
    L1_66 = A0_65.work.temporaryChatMode
    if L1_66 == 3 then
      L2_67 = A0_65:getTellTemporaryAddress()
    end
  elseif L1_66 == 3 then
    L2_67 = A0_65:getTellAddress()
  end
  return L1_66, L2_67
end
function LogWidget.updateLogCategoryDisplay(A0_68)
  A0_68:updateLogCategoryDisplayFromUserConfig()
  A0_68:updateDisplayStatus()
end
function LogWidget.setReplayTellHistroyChatMode(A0_69)
  A0_69:addTellHistory(A0_69.work.tellHistoryIndex + 1)
end
function LogWidget.setSendTellHistroyChatMode(A0_70)
  A0_70:addSendHistory(A0_70.work.sendHistoryIndex + 1)
end
function LogWidget.addTextCommand(A0_71, A1_72, A2_73)
  A0_71:setMacroText("TextBox_ChatInput", 2256, A1_72, A2_73)
end
function LogWidget.updateLogFormat(A0_74)
  local L1_75, L2_76, L3_77, L4_78, L5_79
  for L4_78 = 1, 2 do
    L5_79 = "LogControl_Main_"
    L5_79 = L5_79 .. tostring(L4_78)
    A0_74:setControlProperty(L5_79, "LogFormat", 2400)
    A0_74:setControlProperty(L5_79, "LogFormat2", 2600)
    A0_74:sendControlCommand(L5_79, "App.InvalidateRender")
  end
  L1_75(L2_76)
end
function LogWidget.setTransparency(A0_80, A1_81)
  local L2_82
  L2_82 = 0
  if A1_81 > 0 then
    L2_82 = A1_81 / 100
  end
  A0_80:setControlProperty("Window_LogWidget", "FloatData.Value0", L2_82)
end
function LogWidget.setTextTransparency(A0_83, A1_84)
  local L2_85
  L2_85 = 0
  if A1_84 > 0 then
    L2_85 = A1_84 / 100
  end
  A0_83:setVisualOpacity("LogControl_Main_1", 1 - L2_85)
  A0_83:setVisualOpacity("LogControl_Main_2", 1 - L2_85)
end
function LogWidget.setAutoHideTime(A0_86, A1_87)
  if A0_86.work.autoHideEnable == false then
    return
  end
  A0_86:setControlUserWorkInt(1, "Window_LogWidget", A1_87)
end
function LogWidget.setAutoHideEnable(A0_88, A1_89)
  A0_88.work.autoHideEnable = A1_89
end
function LogWidget.setEventHide(A0_90, A1_91)
  local L2_92
  L2_92 = 0
  if A1_91 == true then
    L2_92 = 1
  end
  A0_90:setControlUserWorkInt(4, "Window_LogWidget", L2_92)
end
function LogWidget.setLogFontSize(A0_93, A1_94)
  A0_93:setFontSize("LogControl_Main_1", A1_94)
  A0_93:setFontSize("LogControl_Main_2", A1_94)
end
function LogWidget.setKeyboardFocusToChatInput(A0_95)
  if desktopWidget:_getKeyboardFocusedWidget() == A0_95 then
    return A0_95:setKeyboardFocusedControl("TextBox_ChatInput")
  end
  return false
end
function LogWidget.setKeyboardFocusToChatMenu(A0_96)
  local L1_97
  L1_97 = desktopWidget
  L1_97 = L1_97._getKeyboardFocusedWidget
  L1_97 = L1_97(L1_97)
  if L1_97 == A0_96 then
    L1_97 = A0_96.getChatMode
    L1_97 = L1_97(A0_96)
    return A0_96:setKeyboardFocusedControl("Button_Command_" .. tostring(L1_97))
  end
  L1_97 = false
  return L1_97
end
function LogWidget.setTellAddress(A0_98, A1_99)
  local L2_100
  L2_100 = A1_99
  if L2_100 == nil then
    return
  end
  A0_98:setControlUserWorkString(1, "TextBox_ChatInput", L2_100)
end
function LogWidget.setTellTemporaryAddress(A0_101, A1_102)
  local L2_103
  L2_103 = A1_102
  if L2_103 == nil then
    L2_103 = ""
  end
  A0_101:setControlUserWorkString(2, "TextBox_ChatInput", L2_103)
end
function LogWidget.updateLogCategoryDisplayFromUserConfig(A0_104)
  local L1_105, L2_106, L3_107, L4_108, L5_109, L6_110, L7_111, L8_112, L9_113, L10_114, L11_115, L12_116, L13_117
  L1_105 = tostring
  L2_106 = 28
  L1_105 = L1_105(L2_106)
  L2_106 = ","
  L3_107 = tostring
  L4_108 = 29
  L3_107 = L3_107(L4_108)
  L4_108 = ","
  L5_109 = tostring
  L5_109 = L5_109(L6_110)
  L9_113 = tostring
  L10_114 = 34
  L9_113 = L9_113(L10_114)
  L10_114 = ","
  L11_115 = tostring
  L12_116 = 35
  L11_115 = L11_115(L12_116)
  L12_116 = ","
  L13_117 = tostring
  L13_117 = L13_117(36)
  L1_105 = L1_105 .. L2_106 .. L3_107 .. L4_108 .. L5_109 .. L6_110 .. L7_111 .. L8_112 .. L9_113 .. L10_114 .. L11_115 .. L12_116 .. L13_117 .. "," .. tostring(37) .. "," .. tostring(38) .. "," .. tostring(39) .. "," .. tostring(40)
  L2_106 = A0_104.work
  L2_106 = L2_106.index
  L4_108 = A0_104
  L3_107 = A0_104.getSelectedIndex
  L5_109 = "TabControl_Log"
  L3_107 = L3_107(L4_108, L5_109)
  L4_108 = false
  L5_109 = 0
  for L9_113 = 1, 2 do
    L10_114 = desktopWidget
    L11_115 = L10_114
    L10_114 = L10_114.getConfigLogEnable
    L12_116 = L2_106
    L13_117 = L9_113
    L10_114 = L10_114(L11_115, L12_116, L13_117)
    if L10_114 == true then
      if L5_109 == 0 then
        L5_109 = L9_113
      end
    else
      L11_115 = L3_107 + 1
      if L11_115 == L9_113 then
        L4_108 = true
      end
    end
    L11_115 = desktopWidget
    L12_116 = L11_115
    L11_115 = L11_115.getConfigLogTitle
    L13_117 = L2_106
    L11_115 = L11_115(L12_116, L13_117, L9_113)
    L13_117 = A0_104
    L12_116 = A0_104.setTabHeader
    L12_116(L13_117, L2_106, L9_113, L11_115, L10_114)
    L12_116 = L1_105
    if L2_106 ~= 1 or L9_113 ~= 1 then
      L12_116 = ""
    end
    L13_117 = desktopWidget
    L13_117 = L13_117.getConfigLogFilterData
    L13_117 = L13_117(L13_117, L2_106, L9_113)
    if L13_117 ~= "" then
      L12_116 = L12_116 .. "," .. L13_117
    end
    A0_104:setLogCategories("LogControl_Main_" .. tostring(L9_113), L12_116)
  end
  if L5_109 ~= 0 and L4_108 == true then
    L9_113 = L5_109 - 1
    L6_110(L7_111, L8_112, L9_113)
  end
end
function LogWidget.updateDisplayStatus(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123, L6_124
  L1_119 = A0_118.work
  L1_119 = L1_119.index
  if L1_119 == 1 then
    return
  end
  L2_120 = false
  for L6_124 = 1, 2 do
    if desktopWidget:getConfigLogEnable(L1_119, L6_124) == true then
      L2_120 = true
      break
    end
  end
  if L2_120 == true then
    L3_121(L4_122)
  else
    L3_121(L4_122)
  end
end
function LogWidget.setDeactiveBatch(A0_125)
  local L1_126, L2_127, L3_128, L4_129, L5_130
  for L4_129 = 1, 2 do
    L5_130 = "LogControl_Main_"
    L5_130 = L5_130 .. tostring(L4_129)
    A0_125:setSelectionLength(L5_130, 0)
  end
  L4_129 = ""
  L1_126(L2_127, L3_128, L4_129)
  L1_126(L2_127)
  L1_126.inputHistoryIndex = 0
  L1_126.tellHistoryIndex = 0
  L1_126.sendHistoryIndex = 0
  L1_126(L2_127)
end
function LogWidget.getChatInputText(A0_131)
  return A0_131:getFixedText("TextBox_ChatInput")
end
function LogWidget.getTellAddress(A0_132)
  return A0_132:getControlUserWorkString(1, "TextBox_ChatInput")
end
function LogWidget.getTellTemporaryAddress(A0_133)
  return nil
end
function LogWidget.getCurrentLinkShellIndex(A0_134)
  local L1_135, L2_136, L3_137, L4_138, L5_139, L6_140, L7_141
  L1_135 = worldMaster
  L2_136 = L1_135
  L1_135 = L1_135._getMyPlayer
  L1_135 = L1_135(L2_136)
  L3_137 = L1_135
  L2_136 = L1_135.getCommunityGroupCurrent
  L2_136 = L2_136(L3_137, L4_138)
  L3_137 = L1_135.countCommunityGroup
  L3_137 = L3_137(L4_138, L5_139)
  if L3_137 > 0 then
    for L7_141 = 1, L3_137 do
      if L2_136 == L1_135:getCommunityGroup(20002, L7_141) then
        return L7_141
      end
    end
  end
  return L4_138
end
function LogWidget.saveInputHistory(A0_142, A1_143)
  local L2_144
  if A1_143 == "" then
    return
  end
  L2_144 = A0_142.getInputHistoryCount
  L2_144 = L2_144(A0_142)
  if A1_143 == A0_142:getInputHistoryCache(L2_144) then
    return
  end
  A0_142:setInputHistoryCache(L2_144 + 1, A1_143)
end
function LogWidget.setInputHistoryCache(A0_145, A1_146, A2_147)
  local L3_148, L4_149, L5_150, L6_151, L7_152, L8_153, L9_154
  if A1_146 > 20 then
    for L6_151 = 1, 19 do
      L7_152 = "TextBlock_Histroy"
      L8_153 = tostring
      L9_154 = L6_151
      L8_153 = L8_153(L9_154)
      L7_152 = L7_152 .. L8_153
      L8_153 = "TextBlock_Histroy"
      L9_154 = tostring
      L9_154 = L9_154(L6_151 + 1)
      L8_153 = L8_153 .. L9_154
      L9_154 = A0_145.getInputHistoryCache
      L9_154 = L9_154(A0_145, L6_151 + 1)
      A0_145:setControlUserWorkString(1, L7_152, L9_154)
    end
    L6_151 = "TextBlock_Histroy"
    L7_152 = tostring
    L8_153 = 20
    L7_152 = L7_152(L8_153)
    L6_151 = L6_151 .. L7_152
    L7_152 = A2_147
    L3_148(L4_149, L5_150, L6_151, L7_152)
    L3_148.inputHistoryCount = 20
  else
    L6_151 = "TextBlock_Histroy"
    L7_152 = tostring
    L8_153 = A1_146
    L7_152 = L7_152(L8_153)
    L6_151 = L6_151 .. L7_152
    L7_152 = A2_147
    L3_148(L4_149, L5_150, L6_151, L7_152)
    L3_148.inputHistoryCount = L4_149
  end
end
function LogWidget.getInputHistoryCache(A0_155, A1_156)
  local L2_157
  L2_157 = ""
  if A0_155:getInputHistoryCount() > 0 and A1_156 >= 1 and A1_156 <= A0_155:getInputHistoryCount() and A1_156 <= 20 then
    L2_157 = A0_155:getControlUserWorkString(1, "TextBlock_Histroy" .. tostring(A1_156))
  end
  return L2_157
end
function LogWidget.getInputHistoryCount(A0_158)
  return A0_158.work.inputHistoryCount
end
function LogWidget.addInputHistory(A0_159, A1_160)
  local L2_161, L3_162
  L3_162 = A0_159
  L2_161 = A0_159.getInputHistoryCount
  L2_161 = L2_161(L3_162)
  if A1_160 < 0 then
    A1_160 = 0
  elseif A1_160 > 20 then
    A1_160 = 20
  elseif L2_161 < A1_160 then
    A1_160 = L2_161
  end
  L3_162 = 0
  if A1_160 > 0 then
    L3_162 = L2_161 - A1_160 + 1
  end
  A0_159:setText("TextBox_ChatInput", A0_159:getInputHistoryCache(L3_162))
  A0_159.work.inputHistoryIndex = A1_160
end
function LogWidget.saveTellHistory(A0_163, A1_164)
  local L2_165
  L2_165 = A0_163.work
  L2_165 = L2_165.index
  if L2_165 ~= 1 then
    L2_165 = desktopWidget
    L2_165 = L2_165.getStaticWidget
    L2_165 = L2_165(L2_165, 2)
    L2_165 = L2_165.saveTellHistory
    L2_165(L2_165, A1_164)
  end
  if A1_164 == "" then
    return
  end
  L2_165 = A0_163.getTellHistoryCount
  L2_165 = L2_165(A0_163)
  if A1_164 == A0_163:getTellHistoryCache(L2_165) then
    return
  end
  A0_163:setTellHistoryCache(L2_165 + 1, A1_164)
end
function LogWidget.setTellHistoryCache(A0_166, A1_167, A2_168)
  local L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175
  if A1_167 > 20 then
    for L6_172 = 1, 19 do
      L7_173 = "TextBlock_Histroy"
      L8_174 = tostring
      L9_175 = L6_172
      L8_174 = L8_174(L9_175)
      L7_173 = L7_173 .. L8_174
      L8_174 = "TextBlock_Histroy"
      L9_175 = tostring
      L9_175 = L9_175(L6_172 + 1)
      L8_174 = L8_174 .. L9_175
      L9_175 = A0_166.getTellHistoryCache
      L9_175 = L9_175(A0_166, L6_172 + 1)
      A0_166:setControlUserWorkString(2, L7_173, L9_175)
    end
    L6_172 = "TextBlock_Histroy"
    L7_173 = tostring
    L8_174 = 20
    L7_173 = L7_173(L8_174)
    L6_172 = L6_172 .. L7_173
    L7_173 = A2_168
    L3_169(L4_170, L5_171, L6_172, L7_173)
    L3_169.tellHistoryCount = 20
  else
    L6_172 = "TextBlock_Histroy"
    L7_173 = tostring
    L8_174 = A1_167
    L7_173 = L7_173(L8_174)
    L6_172 = L6_172 .. L7_173
    L7_173 = A2_168
    L3_169(L4_170, L5_171, L6_172, L7_173)
    L3_169.tellHistoryCount = L4_170
  end
end
function LogWidget.getTellHistoryCache(A0_176, A1_177)
  local L2_178
  L2_178 = ""
  if A0_176:getTellHistoryCount() > 0 and A1_177 >= 1 and A1_177 <= A0_176:getTellHistoryCount() and A1_177 <= 20 then
    L2_178 = A0_176:getControlUserWorkString(2, "TextBlock_Histroy" .. tostring(A1_177))
  end
  return L2_178
end
function LogWidget.getTellHistoryCount(A0_179)
  return A0_179.work.tellHistoryCount
end
function LogWidget.addTellHistory(A0_180, A1_181)
  local L2_182, L3_183, L4_184
  L3_183 = A0_180
  L2_182 = A0_180.getTellHistoryCount
  L2_182 = L2_182(L3_183)
  if A1_181 < 0 then
    A1_181 = 0
  elseif A1_181 > 20 then
    A1_181 = 1
  elseif L2_182 < A1_181 then
    A1_181 = 1
  end
  L3_183 = 0
  if A1_181 > 0 then
    L4_184 = L2_182 - A1_181
    L3_183 = L4_184 + 1
  end
  L4_184 = A0_180.getTellHistoryCache
  L4_184 = L4_184(A0_180, L3_183)
  A0_180:setChatMode(3, L4_184, true)
  A0_180.work.tellHistoryIndex = A1_181
end
function LogWidget.saveSendHistroy(A0_185, A1_186)
  local L2_187
  if A1_186 == "" then
    return
  end
  L2_187 = A0_185.getSendHistoryCount
  L2_187 = L2_187(A0_185)
  if A1_186 == A0_185:getSendHistoryCache(L2_187) then
    return
  end
  A0_185:setSendHistroyCache(L2_187 + 1, A1_186)
end
function LogWidget.setSendHistroyCache(A0_188, A1_189, A2_190)
  local L3_191, L4_192, L5_193, L6_194, L7_195, L8_196, L9_197
  if A1_189 > 20 then
    for L6_194 = 1, 19 do
      L7_195 = "TextBlock_Histroy"
      L8_196 = tostring
      L9_197 = L6_194
      L8_196 = L8_196(L9_197)
      L7_195 = L7_195 .. L8_196
      L8_196 = "TextBlock_Histroy"
      L9_197 = tostring
      L9_197 = L9_197(L6_194 + 1)
      L8_196 = L8_196 .. L9_197
      L9_197 = A0_188.getSendHistoryCache
      L9_197 = L9_197(A0_188, L6_194 + 1)
      A0_188:setControlUserWorkString(3, L7_195, L9_197)
    end
    L6_194 = "TextBlock_Histroy"
    L7_195 = tostring
    L8_196 = 20
    L7_195 = L7_195(L8_196)
    L6_194 = L6_194 .. L7_195
    L7_195 = A2_190
    L3_191(L4_192, L5_193, L6_194, L7_195)
    L3_191.sendHistoryCount = 20
  else
    L6_194 = "TextBlock_Histroy"
    L7_195 = tostring
    L8_196 = A1_189
    L7_195 = L7_195(L8_196)
    L6_194 = L6_194 .. L7_195
    L7_195 = A2_190
    L3_191(L4_192, L5_193, L6_194, L7_195)
    L3_191.sendHistoryCount = L4_192
  end
end
function LogWidget.getSendHistoryCache(A0_198, A1_199)
  local L2_200
  L2_200 = ""
  if A0_198:getSendHistoryCount() > 0 and A1_199 >= 1 and A1_199 <= A0_198:getSendHistoryCount() and A1_199 <= 20 then
    L2_200 = A0_198:getControlUserWorkString(3, "TextBlock_Histroy" .. tostring(A1_199))
  end
  return L2_200
end
function LogWidget.getSendHistoryCount(A0_201)
  return A0_201.work.sendHistoryCount
end
function LogWidget.addSendHistory(A0_202, A1_203)
  local L2_204, L3_205, L4_206
  L3_205 = A0_202
  L2_204 = A0_202.getSendHistoryCount
  L2_204 = L2_204(L3_205)
  if A1_203 < 0 then
    A1_203 = 0
  elseif A1_203 > 20 then
    A1_203 = 1
  elseif L2_204 < A1_203 then
    A1_203 = 1
  end
  L3_205 = 0
  if A1_203 > 0 then
    L4_206 = L2_204 - A1_203
    L3_205 = L4_206 + 1
  end
  L4_206 = A0_202.getSendHistoryCache
  L4_206 = L4_206(A0_202, L3_205)
  A0_202:setChatMode(3, L4_206, true)
  A0_202.work.sendHistoryIndex = A1_203
end
function LogWidget.showChatInput(A0_207)
  A0_207:setText("TextBox_ChatInput", "")
  A0_207:setVisibility("Grid_ChatInput", true)
end
function LogWidget.showChatMenu(A0_208)
  A0_208:setVisibility("Grid_ChatMenu", true)
  A0_208:setKeyboardFocusToChatMenu()
end
function LogWidget.hideChatInput(A0_209)
  A0_209:setText("TextBox_ChatInput", "")
  A0_209:setVisibility("Grid_ChatInput", false)
  A0_209.work.inputHistoryIndex = 0
  A0_209.work.tellHistoryIndex = 0
  A0_209.work.sendHistoryIndex = 0
end
function LogWidget.hideChatMenu(A0_210)
  A0_210:setVisibility("Grid_ChatMenu", false)
end
function LogWidget.setTabHeader(A0_211, A1_212, A2_213, A3_214, A4_215)
  local L5_216
  L5_216 = "TabItem_"
  L5_216 = L5_216 .. tostring(A2_213)
  A0_211:setMacroHeader(L5_216, A3_214)
  A0_211:setVisibility(L5_216, A4_215)
end
function LogWidget.setChatColor(A0_217, A1_218, A2_219)
  local L3_220, L4_221
  L3_220 = A1_218
  if L3_220 == 5 and A2_219 ~= nil then
    L4_221 = L3_220 + A2_219
    L3_220 = L4_221 - 1
  end
  L4_221 = "#ff"
  L4_221 = L4_221 .. _string.format("%x", desktopWidget:_getUserConfig(2, L3_220))
  A0_217:setControlProperty("TextBox_ChatInput", "Foreground", L4_221)
  A0_217:setControlProperty("TextBlock_Name", "Foreground", L4_221)
end
