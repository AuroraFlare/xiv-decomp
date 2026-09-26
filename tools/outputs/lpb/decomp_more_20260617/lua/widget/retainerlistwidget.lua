require("/Widget/WidgetBaseClass")
_defineClass("RetainerListWidget", "WidgetBaseClass")
function RetainerListWidget.init(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
  L4_4 = A0_0.work
  L5_5 = {L6_6, L7_7}
  L6_6 = {L7_7, L8_8}
  L7_7 = "askAnswer"
  L8_8 = "integer32"
  L7_7 = {L8_8, L9_9}
  L8_8 = "eventMode"
  L9_9 = "boolean"
  L4_4._temp = L5_5
  L4_4 = A0_0.work
  L4_4.askAnswer = -1
  L5_5 = A0_0
  L4_4 = A0_0.setEventMode
  L6_6 = A1_1
  L4_4(L5_5, L6_6)
  L4_4 = ""
  L5_5 = "ListBox_Retainer"
  L6_6 = "ControlTemplate_ListBoxItem"
  L8_8 = A0_0
  L7_7 = A0_0.getEventMode
  L7_7 = L7_7(L8_8)
  if L7_7 then
    L6_6 = "ControlTemplate_ListBoxItem_Button"
  end
  L7_7 = 0
  L8_8 = 0
  L9_9 = 0
  L10_10 = 0
  L11_11 = ""
  L12_12 = 0
  L13_13 = desktopWidget
  L14_14 = L13_13
  L13_13 = L13_13.countRetainerMember
  L13_13 = L13_13(L14_14)
  L14_14 = 0
  L18_18 = false
  L15_15(L16_16, L17_17, L18_18)
  L15_15(L16_16)
  L15_15(L16_16)
  if L15_15 then
    L18_18 = "Button_List"
    L15_15(L16_16, L17_17, L18_18)
  end
  if L13_13 == nil then
    L13_13 = 0
  end
  for L18_18 = 1, 8 do
    L4_4 = "Item_RetainerSelect" .. L18_18
    A0_0:_addItem(nil, L5_5, L6_6, L4_4)
    A0_0:setText(L4_4 .. ":TextBlock_Nickname", "")
    A0_0:setListItemVisible(L18_18, false)
    if A0_0:getEventMode() == true then
      A0_0:_setProperty(L4_4, "Button_List", "Command", "UILuaCommands.Operate")
      A0_0:_setProperty(L4_4, L4_4, "IntData.Value0", L18_18)
      A0_0:_setProperty(L4_4, L4_4, "IsTabStop", false)
    end
  end
  L15_15(L16_16)
  L15_15(L16_16, L17_17)
  if nil ~= A2_2 and nil ~= A3_3 and "" ~= A3_3 then
    L18_18 = A2_2
    L15_15(L16_16, L17_17, L18_18, A3_3)
  else
    L18_18 = "Title"
    L16_16(L17_17, L18_18, L15_15)
  end
end
function RetainerListWidget.setInitialData(A0_19, A1_20)
  A0_19:setModal(A1_20)
end
function RetainerListWidget.updateRetainerData(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33
  L1_22 = desktopWidget
  L2_23 = L1_22
  L1_22 = L1_22.countRetainerMember
  L1_22 = L1_22(L2_23)
  L2_23 = 0
  if L1_22 == nil then
    L1_22 = 0
  end
  for L6_27 = 1, L1_22 do
    L7_28 = desktopWidget
    L8_29 = L7_28
    L7_28 = L7_28.getRetainerMemberInfo
    L9_30 = L6_27
    L12_33 = L7_28(L8_29, L9_30)
    if L8_29 ~= 127 then
      A0_21:setRetainerLineData(L2_23 + 1, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33)
      L2_23 = L2_23 + 1
    end
  end
  for L6_27 = L2_23 + 1, 8 do
    L8_29 = A0_21
    L7_28 = A0_21.setListItemVisible
    L9_30 = L6_27
    L10_31 = false
    L7_28(L8_29, L9_30, L10_31)
  end
  L3_24(L4_25, L5_26)
end
function RetainerListWidget.processUICommandEvent(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39)
  local L6_40
  if A3_37 == "UILuaCommands.WidgetClose" then
    L6_40 = A0_34.getEventMode
    L6_40 = L6_40(A0_34)
    if L6_40 then
      L6_40 = A0_34.setAskResult
      L6_40(A0_34, 0)
    else
      L6_40 = desktopWidget
      L6_40 = L6_40.closeWidgetDirect
      L6_40(L6_40, A0_34)
    end
    return
  end
  if A3_37 == "UILuaCommands.Cancel" then
    L6_40 = A0_34.getEventMode
    L6_40 = L6_40(A0_34)
    if L6_40 then
      L6_40 = A0_34.setAskResult
      L6_40(A0_34, 0)
    else
      L6_40 = desktopWidget
      L6_40 = L6_40.closeWidgetDirect
      L6_40(L6_40, A0_34)
    end
    return
  end
  if A3_37 == "UILuaCommands.Operate" then
    L6_40 = A0_34._getProperty
    L6_40 = L6_40(A0_34, A1_35, A1_35, "IntData.Value0")
    if nil ~= L6_40 and true ~= L6_40 and false ~= L6_40 and "" ~= L6_40 then
      A0_34:setAskResult(L6_40)
    end
    return
  end
  return
end
function RetainerListWidget.getFormItemName(A0_41, A1_42)
  return "Item_RetainerSelect" .. A1_42
end
function RetainerListWidget.getStatusName(A0_43)
  local L1_44, L2_45
  L1_44 = "Label_State"
  L2_45 = "Content"
  return L1_44, L2_45
end
function RetainerListWidget.getNickNameTitleName(A0_46)
  local L1_47, L2_48
  L1_47 = "TextBlock_NicknameTitle"
  L2_48 = "Text"
  return L1_47, L2_48
end
function RetainerListWidget.getNickNameName(A0_49)
  local L1_50, L2_51
  L1_50 = "TextBlock_Nickname"
  L2_51 = "Text"
  return L1_50, L2_51
end
function RetainerListWidget.getLvNameTitle(A0_52)
  local L1_53, L2_54
  L1_53 = "TextBlock_RaceTitle"
  L2_54 = "Text"
  return L1_53, L2_54
end
function RetainerListWidget.getLvName(A0_55)
  local L1_56, L2_57
  L1_56 = "TextBlock_Race"
  L2_57 = "Text"
  return L1_56, L2_57
end
function RetainerListWidget.getLocationTitleName(A0_58)
  local L1_59, L2_60
  L1_59 = "TextBlock_LocationTitle"
  L2_60 = "Text"
  return L1_59, L2_60
end
function RetainerListWidget.getLocationName(A0_61)
  local L1_62, L2_63
  L1_62 = "TextBlock_Location"
  L2_63 = "Text"
  return L1_62, L2_63
end
function RetainerListWidget.setRetainerLineData(A0_64, A1_65, A2_66, A3_67, A4_68, A5_69, A6_70, A7_71)
  local L8_72
  L8_72 = A0_64.setRetainerName
  L8_72(A0_64, A1_65, A2_66, A6_70)
  L8_72 = A0_64.setRetainerCondition
  L8_72(A0_64, A1_65, A3_67)
  L8_72 = A0_64.setRetainerLevel
  L8_72(A0_64, A1_65, A5_69)
  L8_72 = A0_64.setRetainerLocation
  L8_72(A0_64, A1_65, A4_68, A7_71)
  L8_72 = A0_64.getFormItemName
  L8_72 = L8_72(A0_64, A1_65)
  A0_64:setVisibility(L8_72, true)
end
function RetainerListWidget.setRetainerName(A0_73, A1_74, A2_75, A3_76)
  local L4_77, L5_78, L6_79, L7_80, L8_81, L9_82
  if nil == A1_74 or "" == A1_74 then
    return
  end
  if nil == A2_75 or "" == A2_75 then
    return
  end
  L5_78 = A0_73
  L4_77 = A0_73.getFormItemName
  L6_79 = A1_74
  L4_77 = L4_77(L5_78, L6_79)
  L6_79 = A0_73
  L5_78 = A0_73.getNickNameTitleName
  L6_79 = L5_78(L6_79)
  L8_81 = A0_73
  L7_80 = A0_73.getNickNameName
  L8_81 = L7_80(L8_81)
  L9_82 = "@"
  L9_82 = L9_82 .. tostring(6302)
  A0_73:_setProperty(L4_77, L5_78, L6_79, L9_82)
  A0_73:_setProperty(L4_77, L7_80, L8_81, A3_76)
end
function RetainerListWidget.setRetainerLevel(A0_83, A1_84, A2_85)
  local L3_86, L4_87, L5_88, L6_89, L7_90, L8_91
  if nil == A1_84 or "" == A1_84 then
    return
  end
  if nil == A2_85 or "" == A2_85 then
    return
  end
  L4_87 = A0_83
  L3_86 = A0_83.getFormItemName
  L5_88 = A1_84
  L3_86 = L3_86(L4_87, L5_88)
  L5_88 = A0_83
  L4_87 = A0_83.getLvNameTitle
  L5_88 = L4_87(L5_88)
  L7_90 = A0_83
  L6_89 = A0_83.getLvName
  L7_90 = L6_89(L7_90)
  L8_91 = "@"
  L8_91 = L8_91 .. tostring(6307)
  A0_83:_setProperty(L3_86, L4_87, L5_88, L8_91)
  A0_83:_setProperty(L3_86, L6_89, L7_90, A2_85)
end
function RetainerListWidget.setRetainerLocation(A0_92, A1_93, A2_94, A3_95)
  local L4_96, L5_97, L6_98, L7_99, L8_100, L9_101
  if nil == A1_93 or "" == A1_93 then
    return
  end
  if nil == A2_94 or "" == A2_94 then
    return
  end
  L5_97 = A0_92
  L4_96 = A0_92.getFormItemName
  L6_98 = A1_93
  L4_96 = L4_96(L5_97, L6_98)
  L6_98 = A0_92
  L5_97 = A0_92.getLocationTitleName
  L6_98 = L5_97(L6_98)
  L8_100 = A0_92
  L7_99 = A0_92.getLocationName
  L8_100 = L7_99(L8_100)
  L9_101 = A0_92.packTextParameter
  L9_101 = L9_101(A0_92, 6304)
  A0_92:_setProperty(L4_96, L5_97, L6_98, L9_101)
  A0_92:setText(L4_96 .. ":" .. L7_99, 6314, A3_95, A2_94)
end
function RetainerListWidget.setRetainerCondition(A0_102, A1_103, A2_104)
  local L3_105, L4_106, L5_107, L6_108, L7_109, L8_110
  if nil == A1_103 or "" == A1_103 then
    return
  end
  if nil == A2_104 or "" == A2_104 then
    return
  end
  L3_105 = 0
  L4_106 = ""
  L6_108 = A0_102
  L5_107 = A0_102.getFormItemName
  L7_109 = A1_103
  L5_107 = L5_107(L6_108, L7_109)
  L7_109 = A0_102
  L6_108 = A0_102.getStatusName
  L7_109 = L6_108(L7_109)
  L8_110 = 0
  if A2_104 == 0 then
  else
    if A2_104 == 101 then
      break
    else
    end
    if A2_104 == 1 then
      L3_105 = 6301
      L8_110 = 266
      break
    else
    end
    if A2_104 == 2 then
      L3_105 = 6310
      L8_110 = 267
      break
    else
    end
    if A2_104 == 3 then
      L3_105 = 6311
      L8_110 = 200
      break
    else
    end
    if A2_104 == 4 then
      L3_105 = 6312
      L8_110 = 201
      break
    else
    end
    if A2_104 == 5 then
      L3_105 = 6313
      L8_110 = 202
      do break end
      break
    else
    end
  end
  if L8_110 ~= 0 then
    A0_102:setIcon(L5_107 .. ":IconControl_State", L8_110)
    A0_102:setVisibility(L5_107 .. ":IconControl_State", true)
    A0_102:setHelpParameter(L5_107 .. ":IconControl_State", 1, 75602)
    A0_102:setHelpParameter(L5_107 .. ":Grid_Race", 1, 75603)
    A0_102:setHelpParameter(L5_107 .. ":Grid_Location", 1, 75604)
  else
    A0_102:setHidden(L5_107 .. ":IconControl_State")
  end
end
function RetainerListWidget.setRetainerListMax(A0_111, A1_112)
  if A1_112 > 0 then
    A0_111:setInfomation(true)
  else
    A0_111:setInfomation(false)
  end
end
function RetainerListWidget.processWaitCallFunction(A0_113)
  local L1_114
  L1_114 = A0_113.work
  L1_114 = L1_114.askAnswer
  if L1_114 ~= -1 then
    L1_114 = true
    return L1_114
  end
  L1_114 = false
  return L1_114
end
function RetainerListWidget.setAskResult(A0_115, A1_116)
  A0_115.work.askAnswer = A1_116
end
function RetainerListWidget.getAskResult(A0_117)
  return A0_117.work.askAnswer
end
function RetainerListWidget.setEventMode(A0_118, A1_119)
  if A1_119 ~= true then
    A1_119 = false
  end
  A0_118.work.eventMode = A1_119
end
function RetainerListWidget.getEventMode(A0_120)
  return A0_120.work.eventMode
end
function RetainerListWidget.setListItemVisible(A0_121, A1_122, A2_123)
  local L3_124
  L3_124 = "Item_RetainerSelect"
  L3_124 = L3_124 .. A1_122
  if A1_122 < 0 and A1_122 > 8 then
    return false
  end
  A0_121:setVisibility(L3_124, A2_123)
  return true
end
function RetainerListWidget.setInfomation(A0_125, A1_126)
  if A1_126 == false then
    A0_125:setVisibility("ListBox_Retainer", false)
    A0_125:setVisibility("TextBlock_Message", true)
  else
    A0_125:setVisibility("ListBox_Retainer", true)
    A0_125:setVisibility("TextBlock_Message", false)
  end
  return true
end
