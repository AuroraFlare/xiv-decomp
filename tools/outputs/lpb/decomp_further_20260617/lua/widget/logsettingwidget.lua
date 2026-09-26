require("/Widget/WidgetBaseClass")
_defineClass("LogSettingWidget", "WidgetBaseClass")
function LogSettingWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L4_4 = "logDisplayCount"
  L4_4 = {L5_5, L6_6}
  L1_1._temp = L2_2
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = "UILuaCommands.LostFocusTitle"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.ToggleButton"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.ToggleButton"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.ToggleButton"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.ToggleButton"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.ToggleButton"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.SliderValueChanged"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.SliderValueChanged"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.SliderValueChanged"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.SliderValueChanged"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "Slider_LogOptical"
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "Slider_LogOptical_2"
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "Slider_TextOptical"
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "Slider_TextOptical_2"
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1(L2_2)
  L1_1(L2_2)
  L4_4 = "UILuaCommands.Selection"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.Selection"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.Selection"
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
  L1_1.logDisplayWindow = 1
  L1_1.logDisplayTab = 1
  L1_1.logDisplayCount = 0
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  for L4_4 = 1, 2 do
    for L8_8 = 1, 2 do
      L9_9 = desktopWidget
      L10_10 = L9_9
      L9_9 = L9_9.getConfigLogIndex
      L9_9 = L9_9(L10_10, L4_4, L8_8)
      L9_9 = L9_9 + 1
      L10_10 = "Button_"
      L10_10 = L10_10 .. tostring(L9_9)
      A0_0:setCommandParameter(L10_10, L4_4, L8_8)
      A0_0:setControlCommandCondition(L10_10, "UILuaCommands.OperateTab")
      A0_0:setTabTitleButton(L4_4, L8_8)
    end
  end
  L4_4 = 1
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = 1
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "1"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "2"
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
end
function LogSettingWidget.update(A0_11)
  A0_11:setSelectedIndex("ComboBox_Font_Win1", desktopWidget:getConfigWork(39))
  A0_11:setSelectedIndex("ComboBox_Font_Win2", desktopWidget:getConfigWork(40))
  A0_11:setChecked("ToggleButton_TellArrivingSE", desktopWidget:getConfigFlag(38))
  A0_11:setChecked("ToggleButton_Undisplay", desktopWidget:getConfigWork(12) ~= 0)
  A0_11:setChecked("ToggleButton_Undisplay_2", desktopWidget:getConfigWork(16) ~= 0)
  A0_11:setChecked("ToggleButton_WeaponSkillLog", desktopWidget:getConfigFlag(19))
end
function LogSettingWidget.processClosing(A0_12)
  desktopWidget:setLogAutoHideEnable(true)
end
function LogSettingWidget.processUICommandOperate(A0_13, A1_14, A2_15, A3_16, A4_17)
  local L5_18
  L5_18 = A2_15
  if L5_18 == "Button_AllClear" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_13, true, nil, 1347, 2, 1348, 1349)
    break
  else
  end
  if L5_18 == "Button_AllOn" then
    A0_13:setAllFilter(true)
    break
  else
  end
  if L5_18 == "Button_AllOff" then
    A0_13:setAllFilter(false)
    do break end
    break
  else
  end
end
function LogSettingWidget.processUICommandSelection(A0_19, A1_20, A2_21, A3_22, A4_23)
  local L5_24
  L5_24 = A2_21
  if L5_24 == "ListBox_LogSettingItems" then
    A0_19:setListItem(A3_22, nil)
    A0_19:updateListProperty("ListBox")
    A0_19:setLogDisplayContentForUserConfig()
    break
  else
  end
  if L5_24 == "ComboBox_Font_Win1" then
    desktopWidget:setConfigWork(39, A3_22)
    break
  else
  end
  if L5_24 == "ComboBox_Font_Win2" then
    desktopWidget:setConfigWork(40, A3_22)
    do break end
    break
  else
  end
end
function LogSettingWidget.processUICommandToggleButton(A0_25, A1_26, A2_27, A3_28, A4_29, A5_30)
  local L6_31, L7_32, L8_33
  if A2_27 == "ToggleButton_TabSetting" then
    L6_31 = A0_25.work
    L6_31 = L6_31.logDisplayWindow
    L7_32 = A0_25.work
    L7_32 = L7_32.logDisplayTab
    L8_33 = desktopWidget
    L8_33 = L8_33.setConfigLogEnable
    L8_33(L8_33, L6_31, L7_32, A5_30)
    L8_33 = A0_25.updateControlEnable
    L8_33(A0_25, A5_30)
    L8_33 = desktopWidget
    L8_33 = L8_33.getConfigLogIndex
    L8_33 = L8_33(L8_33, L6_31, L7_32)
    L8_33 = L8_33 + 1
    A0_25:setButtonStyle("Button_" .. tostring(L8_33), A5_30)
    A0_25:updateLogWidget(L6_31)
  elseif A2_27 == "ToggleButton_TellArrivingSE" then
    L6_31 = desktopWidget
    L7_32 = L6_31
    L6_31 = L6_31.setConfigFlag
    L8_33 = 38
    L6_31(L7_32, L8_33, A5_30)
  elseif A2_27 == "ToggleButton_Undisplay" then
    if A5_30 then
      L6_31 = desktopWidget
      L7_32 = L6_31
      L6_31 = L6_31.setConfigWork
      L8_33 = 12
      L6_31(L7_32, L8_33, 60)
    else
      L6_31 = desktopWidget
      L7_32 = L6_31
      L6_31 = L6_31.setConfigWork
      L8_33 = 12
      L6_31(L7_32, L8_33, 0)
    end
  elseif A2_27 == "ToggleButton_Undisplay_2" then
    if A5_30 then
      L6_31 = desktopWidget
      L7_32 = L6_31
      L6_31 = L6_31.setConfigWork
      L8_33 = 16
      L6_31(L7_32, L8_33, 60)
    else
      L6_31 = desktopWidget
      L7_32 = L6_31
      L6_31 = L6_31.setConfigWork
      L8_33 = 16
      L6_31(L7_32, L8_33, 0)
    end
  elseif A2_27 == "ToggleButton_WeaponSkillLog" then
    L6_31 = desktopWidget
    L7_32 = L6_31
    L6_31 = L6_31.setConfigFlag
    L8_33 = 19
    L6_31(L7_32, L8_33, A5_30)
    L7_32 = A0_25
    L6_31 = A0_25.setLogDisplayContentForUserConfig
    L6_31(L7_32)
  end
end
function LogSettingWidget.processUICommandSliderChange(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39)
  local L6_40
  L6_40 = A0_34.getControlUserWorkInt
  L6_40 = L6_40(A0_34, 1, A2_36)
  desktopWidget:setConfigWork(L6_40, A5_39)
  if A2_36 == "Slider_LogOptical" then
  else
  end
  if A2_36 == "Slider_LogOptical_2" then
    desktopWidget:updateLogTransparency()
    break
  elseif A2_36 == "Slider_TextOptical" then
  else
  end
  if A2_36 == "Slider_TextOptical_2" then
    desktopWidget:updateLogTextTransparency()
    break
  else
  end
end
function LogSettingWidget.processUICommandDefault(A0_41, A1_42, A2_43, A3_44, A4_45, A5_46)
  local L6_47
  L6_47 = A3_44
  if L6_47 == "UILuaCommands.OperateTab" then
    A0_41:setSelectedButton(A0_41.work.logDisplayWindow, A0_41.work.logDisplayTab, false)
    A0_41:updateLogDisplayContent(A4_45, A5_46)
    A0_41:setSelectedButton(A4_45, A5_46, true)
    break
  else
  end
  if L6_47 == "UILuaCommands.LostFocusTitle" then
    A0_41:setLogDisplayTitleForUserConfig()
    do break end
    break
  else
  end
end
function LogSettingWidget.processUICommandClose(A0_48, A1_49, A2_50, A3_51, A4_52)
  A0_48:setLogDisplayTitleForUserConfig()
  A0_48:setLogDisplayContentForUserConfig()
  desktopWidget:closeWidgetDirect(A0_48)
end
function LogSettingWidget.processAskResult(A0_53, A1_54)
  if A1_54 == 1 then
    A0_53:initLogDisplayDataForUserConfig()
  end
end
function LogSettingWidget.initLogDisplayDataForUserConfig(A0_55)
  local L1_56, L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63
  for L4_59 = 1, 2 do
    for L8_63 = 1, 2 do
      desktopWidget:setConfigLogTitle(L4_59, L8_63, nil)
      desktopWidget:initConfigLogData(L4_59, L8_63)
      A0_55:setTabTitleButton(L4_59, L8_63)
    end
    L5_60(L6_61, L7_62)
  end
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L1_56(L2_57)
  L1_56(L2_57)
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L4_59 = desktopWidget
  L4_59 = L4_59.getConfigFlag
  L8_63 = L4_59(L5_60, L6_61)
  L1_56(L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63, L4_59(L5_60, L6_61))
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L4_59 = desktopWidget
  L4_59 = L4_59.getConfigWork
  L4_59 = L4_59(L5_60, L6_61)
  L4_59 = L4_59 ~= 0
  L1_56(L2_57, L3_58, L4_59)
  L4_59 = desktopWidget
  L4_59 = L4_59.getConfigWork
  L4_59 = L4_59(L5_60, L6_61)
  L4_59 = L4_59 ~= 0
  L1_56(L2_57, L3_58, L4_59)
  L4_59 = desktopWidget
  L4_59 = L4_59.getConfigFlag
  L8_63 = L4_59(L5_60, L6_61)
  L1_56(L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63, L4_59(L5_60, L6_61))
  L1_56(L2_57, L3_58)
  L1_56(L2_57, L3_58)
  L4_59 = desktopWidget
  L4_59 = L4_59.getConfigWork
  L8_63 = L4_59(L5_60, L6_61)
  L1_56(L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63, L4_59(L5_60, L6_61))
  L4_59 = desktopWidget
  L4_59 = L4_59.getConfigWork
  L8_63 = L4_59(L5_60, L6_61)
  L1_56(L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63, L4_59(L5_60, L6_61))
  L4_59 = A0_55.work
  L4_59 = L4_59.logDisplayTab
  L1_56(L2_57, L3_58, L4_59)
end
function LogSettingWidget.updateLogDisplayContent(A0_64, A1_65, A2_66)
  local L3_67, L4_68, L5_69, L6_70, L7_71, L8_72
  L3_67 = A0_64.work
  L3_67.logDisplayWindow = A1_65
  L3_67 = A0_64.work
  L3_67.logDisplayTab = A2_66
  L3_67 = desktopWidget
  L4_68 = L3_67
  L3_67 = L3_67.getConfigLogEnable
  L3_67 = L3_67(L4_68, L5_69, L6_70)
  if A1_65 == 1 and A2_66 == 1 then
    L4_68 = A0_64.setEnable
    L4_68(L5_69, L6_70, L7_71)
    L3_67 = true
  else
    L4_68 = A0_64.setEnable
    L4_68(L5_69, L6_70, L7_71)
  end
  L4_68 = A0_64.setChecked
  L4_68(L5_69, L6_70, L7_71)
  L4_68 = A0_64.updateControlEnable
  L4_68(L5_69, L6_70)
  L4_68 = A0_64.setTabTitleTextBox
  L4_68(L5_69, L6_70)
  L4_68 = desktopWidget
  L4_68 = L4_68.getConfigLogFlagTable
  L4_68 = L4_68(L5_69, L6_70, L7_71)
  for L8_72 = 0, L6_70 - 1 do
    A0_64:setListItem(L8_72, L4_68[A0_64:getListProperty("ListBox", L8_72, "CategoryID")])
  end
  L5_69(L6_70, L7_71)
end
function LogSettingWidget.setLogDisplayTitleForUserConfig(A0_73)
  local L1_74, L2_75, L3_76
  L1_74 = A0_73.work
  L1_74 = L1_74.logDisplayWindow
  L2_75 = A0_73.work
  L2_75 = L2_75.logDisplayTab
  L3_76 = A0_73.getText
  L3_76 = L3_76(A0_73, "TextBox_TabName")
  desktopWidget:setConfigLogTitle(L1_74, L2_75, L3_76)
  A0_73:setTabTitleButton(L1_74, L2_75)
  A0_73:updateLogWidget(L1_74)
end
function LogSettingWidget.setLogDisplayContentForUserConfig(A0_77)
  local L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85
  L1_78 = A0_77.work
  L1_78 = L1_78.logDisplayWindow
  L2_79 = A0_77.work
  L2_79 = L2_79.logDisplayTab
  L3_80 = {}
  for L7_84 = 0, L5_82 - 1 do
    L8_85 = A0_77.getListProperty
    L8_85 = L8_85(A0_77, "ListBox", L7_84, "Checked")
    if L8_85 == true then
      L8_85 = A0_77.getListProperty
      L8_85 = L8_85(A0_77, "ListBox", L7_84, "CategoryID")
      _table.insert(L3_80, L8_85)
    end
  end
  L7_84 = L2_79
  L8_85 = L3_80
  L4_81(L5_82, L6_83, L7_84, L8_85)
  L4_81(L5_82, L6_83)
  L4_81(L5_82, L6_83)
end
function LogSettingWidget.updateLogWidget(A0_86, A1_87)
  local L2_88
  L2_88 = 2
  if A1_87 ~= 1 then
    L2_88 = 3
  end
  desktopWidget:getStaticWidget(L2_88):updateLogCategoryDisplay()
end
function LogSettingWidget.setAllFilter(A0_89, A1_90)
  local L2_91, L3_92, L4_93, L5_94
  for L5_94 = 0, L3_92 - 1 do
    A0_89:setListItem(L5_94, A1_90)
  end
  L2_91(L3_92, L4_93)
  L2_91(L3_92)
end
function LogSettingWidget.setButtonStyle(A0_95, A1_96, A2_97)
  local L3_98
  L3_98 = "BTN_basis_cmdRunning"
  if A2_97 == false then
    L3_98 = "BTN_basis"
  end
  A0_95:setStyle(A1_96, L3_98)
end
function LogSettingWidget.updateControlEnable(A0_99, A1_100)
  A0_99:setEnable("TextBox_TabName", A1_100)
  A0_99:setEnable("Button_AllOn", A1_100)
  A0_99:setEnable("Button_AllOff", A1_100)
  A0_99:setEnable("ListBox_LogSettingItems", A1_100)
end
function LogSettingWidget.setListItem(A0_101, A1_102, A2_103)
  local L3_104, L4_105, L5_106
  L3_104 = 2225
  if A2_103 == nil then
    L5_106 = A0_101
    L4_105 = A0_101.getListProperty
    L4_105 = L4_105(L5_106, "ListBox", A1_102, "Checked")
    A2_103 = L4_105
    if A2_103 == true then
      A2_103 = false
    else
      A2_103 = true
    end
  end
  L5_106 = A0_101
  L4_105 = A0_101.setListProperty
  L4_105(L5_106, "ListBox", A1_102, "Checked", A2_103)
  L4_105 = 2225
  L5_106 = "TBL_parameterPlus"
  if A2_103 == false then
    L4_105 = 2226
    L5_106 = "TBL_parameterMinus"
  end
  A0_101:setListText("ListBox", A1_102, "StatusName", L4_105)
  A0_101:setListProperty("ListBox", A1_102, "StatusStyle", L5_106)
end
function LogSettingWidget.createFilterList(A0_107)
  local L1_108, L2_109, L3_110, L4_111
  for L4_111 = 1, 12 do
    A0_107:addListItem(L4_111)
  end
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  for L4_111 = 80, 109 do
    A0_107:addListItem(L4_111)
  end
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
  L1_108(L2_109, L3_110)
end
function LogSettingWidget.addListItem(A0_112, A1_113)
  local L2_114
  L2_114 = A0_112.work
  L2_114 = L2_114.logDisplayCount
  A0_112:setListText("ListBox", L2_114, "ItemName", 2254, A1_113)
  A0_112:setListProperty("ListBox", L2_114, "CategoryID", A1_113)
  A0_112:setListProperty("ListBox", L2_114, "Help", 74801 + A1_113 - 1)
  A0_112.work.logDisplayCount = L2_114 + 1
end
function LogSettingWidget.setTabTitleButton(A0_115, A1_116, A2_117)
  local L3_118, L4_119, L5_120, L6_121
  L3_118 = desktopWidget
  L4_119 = L3_118
  L3_118 = L3_118.getConfigLogIndex
  L5_120 = A1_116
  L6_121 = A2_117
  L3_118 = L3_118(L4_119, L5_120, L6_121)
  L3_118 = L3_118 + 1
  L4_119 = "Button_"
  L5_120 = tostring
  L6_121 = L3_118
  L5_120 = L5_120(L6_121)
  L4_119 = L4_119 .. L5_120
  L5_120 = desktopWidget
  L6_121 = L5_120
  L5_120 = L5_120.getConfigLogTitle
  L5_120 = L5_120(L6_121, A1_116, A2_117)
  L6_121 = A0_115.setMacroContent
  L6_121(A0_115, L4_119, L5_120)
  L6_121 = desktopWidget
  L6_121 = L6_121.getConfigLogEnable
  L6_121 = L6_121(L6_121, A1_116, A2_117)
  A0_115:setButtonStyle(L4_119, L6_121)
end
function LogSettingWidget.setSelectedButton(A0_122, A1_123, A2_124, A3_125)
  local L4_126, L5_127
  L4_126 = desktopWidget
  L5_127 = L4_126
  L4_126 = L4_126.getConfigLogIndex
  L4_126 = L4_126(L5_127, A1_123, A2_124)
  L4_126 = L4_126 + 1
  L5_127 = "Button_"
  L5_127 = L5_127 .. tostring(L4_126)
  A0_122:setVisibility(L5_127 .. ":Border_ButtonSelectedEffect", A3_125)
end
function LogSettingWidget.setTabTitleTextBox(A0_128, A1_129)
  local L2_130
  L2_130 = desktopWidget
  L2_130 = L2_130.getConfigLogTitle
  L2_130 = L2_130(L2_130, A0_128.work.logDisplayWindow, A0_128.work.logDisplayTab)
  A0_128:setMacroText("TextBox_TabName", L2_130)
end
function LogSettingWidget.initSliderBar(A0_131, A1_132)
  local L2_133, L3_134
  L3_134 = A0_131
  L2_133 = A0_131.getControlUserWorkInt
  L2_133 = L2_133(L3_134, 1, A1_132)
  L3_134 = desktopWidget
  L3_134 = L3_134.getConfigWork
  L3_134 = L3_134(L3_134, L2_133)
  A0_131:setValue(A1_132, L3_134)
end
