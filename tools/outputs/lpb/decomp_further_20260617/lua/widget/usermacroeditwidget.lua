require("/Widget/WidgetBaseClass")
_defineClass("UserMacroEditWidget", "WidgetBaseClass")
function UserMacroEditWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L4_4 = "setID"
  L4_4 = {L5_5, L6_6}
  L1_1._temp = L2_2
  for L4_4 = 1, 5 do
    for L8_8 = 1, 10 do
      L9_9 = tostring
      L10_10 = L4_4
      L9_9 = L9_9(L10_10)
      L10_10 = "_"
      L11_11 = tostring
      L11_11 = L11_11(L8_8)
      L9_9 = L9_9 .. L10_10 .. L11_11
      L10_10 = "Button_Ctrl_"
      L11_11 = L9_9
      L10_10 = L10_10 .. L11_11
      L11_11 = "Button_Alt_"
      L11_11 = L11_11 .. L9_9
      A0_0:setConfirmCondition(L10_10)
      A0_0:setConfirmCondition(L11_11)
      A0_0:setCommandParameter(L10_10, L4_4, L8_8)
      A0_0:setCommandParameter(L11_11, L4_4, L8_8 + 10)
    end
  end
  L4_4 = "UILuaCommands.SelectionChangedOnce"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.TextChanged"
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L1_1.setID = 1
  L1_1.index = 1
  L4_4 = A0_0.work
  L4_4 = L4_4.index
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
end
function UserMacroEditWidget.processUICommandOperate(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17, L6_18, L7_19
  L5_17 = A2_14
  if L5_17 == "Button_SelectedIconDisplay" then
    L7_19 = A0_12
    L6_18 = A0_12.getChildWidgetByWindowName
    L6_18 = L6_18(L7_19, "UserMacroIconListWidget")
    L7_19 = desktopWidget
    L7_19 = L7_19._getUserMacroIcon
    L7_19 = L7_19(L7_19, A0_12.work.setID, A0_12.work.index)
    L6_18:setIconID(L7_19)
    L6_18:show()
    break
  else
  end
  if L5_17 == "Button_MacroCopy" then
    L7_19 = A0_12
    L6_18 = A0_12.copyMacroData
    L6_18(L7_19)
    L7_19 = A0_12
    L6_18 = A0_12.getEnable
    L6_18 = L6_18(L7_19, "Button_MacroPaste")
    if L6_18 == false then
      L7_19 = A0_12
      L6_18 = A0_12.setEnable
      L6_18(L7_19, "Button_MacroPaste", true)
      do break end
      else
      end
      if L5_17 == "Button_MacroCut" then
        L7_19 = A0_12
        L6_18 = A0_12.copyMacroData
        L6_18(L7_19)
        L7_19 = A0_12
        L6_18 = A0_12.clearMacroData
        L6_18(L7_19)
        L7_19 = A0_12
        L6_18 = A0_12.getEnable
        L6_18 = L6_18(L7_19, "Button_MacroPaste")
        if L6_18 == false then
          L7_19 = A0_12
          L6_18 = A0_12.setEnable
          L6_18(L7_19, "Button_MacroPaste", true)
          do break end
          else
          end
          if L5_17 == "Button_MacroPaste" then
            L7_19 = A0_12
            L6_18 = A0_12.pasteMacroData
            L6_18(L7_19)
            break
          else
          end
          if L5_17 == "Button_MacroDelete" then
            L7_19 = A0_12
            L6_18 = A0_12.clearMacroData
            L6_18(L7_19)
            break
          else
          end
          if A3_15 ~= nil then
            L6_18 = A0_12.work
            L6_18 = L6_18.setID
            if L6_18 == A3_15 then
              L6_18 = A0_12.work
              L6_18 = L6_18.index
              if L6_18 == A4_16 then
                L7_19 = A0_12
                L6_18 = A0_12.setKeyboardFocusedControl
                L6_18(L7_19, "TextBox_ChatInput_UserMacroTitle")
              end
            else
              L7_19 = A0_12
              L6_18 = A0_12.changeMacroInfo
              L6_18(L7_19, A3_15, A4_16)
            end
          end
        else
        end
    else
    end
end
function UserMacroEditWidget.processUICommandSelectionChanged(A0_20, A1_21, A2_22, A3_23, A4_24)
  local L5_25
  L5_25 = A0_20.updateIconPage
  L5_25(A0_20, A3_23)
  L5_25 = A0_20.work
  L5_25 = L5_25.index
  if A3_23 == 0 then
    if L5_25 > 10 then
      L5_25 = L5_25 - 10
    end
  elseif L5_25 <= 10 then
    L5_25 = L5_25 + 10
  end
  A0_20:changeMacroInfo(A0_20.work.setID, L5_25)
end
function UserMacroEditWidget.processUICommandDefault(A0_26, A1_27, A2_28, A3_29, A4_30, A5_31)
  local L6_32, L7_33, L8_34
  L6_32 = A3_29
  if L6_32 == "UILuaCommands.TextChanged" then
    L8_34 = A0_26
    L7_33 = A0_26.getButtonName
    L7_33 = L7_33(L8_34, A0_26.work.setID, A0_26.work.index)
    L8_34 = A0_26.getText
    L8_34 = L8_34(A0_26, "TextBox_ChatInput_UserMacroTitle")
    A0_26:setText(L7_33 .. ":TextBlock_MacroTitle", L8_34)
    A0_26:setText("Button_SelectedIconDisplay" .. ":TextBlock_MacroTitle", L8_34)
    do break end
    break
  else
  end
end
function UserMacroEditWidget.processClosing(A0_35)
  A0_35:updateMacroInfo()
  desktopWidget:_saveUserMacro()
end
function UserMacroEditWidget.changeMacroInfo(A0_36, A1_37, A2_38)
  local L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45
  L3_39 = A0_36.work
  L3_39 = L3_39.setID
  if L3_39 == A1_37 then
    L3_39 = A0_36.work
    L3_39 = L3_39.index
  elseif L3_39 ~= A2_38 then
    L4_40 = A0_36
    L3_39 = A0_36.updateMacroInfo
    L3_39(L4_40)
    L4_40 = A0_36
    L3_39 = A0_36.setSelectedCursor
    L3_39(L4_40, L5_41, L6_42, L7_43)
  end
  L3_39 = A0_36.work
  L3_39.setID = A1_37
  L3_39 = A0_36.work
  L3_39.index = A2_38
  L3_39 = desktopWidget
  L4_40 = L3_39
  L3_39 = L3_39._getUserMacroTitle
  L3_39 = L3_39(L4_40, L5_41, L6_42)
  L4_40 = A0_36.setText
  L4_40(L5_41, L6_42, L7_43)
  L4_40 = A0_36.getMacroIcon
  L4_40 = L4_40(L5_41, L6_42, L7_43)
  L8_44 = L4_40
  L9_45 = L3_39
  L5_41(L6_42, L7_43, L8_44, L9_45)
  for L8_44 = 1, 10 do
    L9_45 = desktopWidget
    L9_45 = L9_45._getUserMacroData
    L9_45 = L9_45(L9_45, A1_37, A2_38, L8_44)
    A0_36:setText("TextBox_ChatInput_WriteMacro_" .. tostring(L8_44), L9_45)
  end
  L8_44 = A0_36
  L9_45 = "TextBlock_MacroNumber"
  L7_43(L8_44, L9_45, 228, L5_41, 50)
  L8_44 = A0_36
  L9_45 = A1_37
  L7_43(L8_44, L9_45, A2_38, true)
end
function UserMacroEditWidget.updateMacroInfo(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54
  L1_47 = A0_46.work
  L1_47 = L1_47.setID
  L2_48 = A0_46.work
  L2_48 = L2_48.index
  L3_49 = A0_46.getFixedText
  L3_49 = L3_49(L4_50, L5_51)
  L7_53 = L2_48
  L8_54 = L3_49
  L4_50(L5_51, L6_52, L7_53, L8_54)
  for L7_53 = 1, 10 do
    L8_54 = A0_46.getFixedText
    L8_54 = L8_54(A0_46, "TextBox_ChatInput_WriteMacro_" .. tostring(L7_53))
    desktopWidget:_setUserMacroData(L1_47, L2_48, L7_53, L8_54)
  end
end
function UserMacroEditWidget.setMacroIcon(A0_55, A1_56)
  local L2_57, L3_58, L4_59, L5_60
  L2_57 = A0_55.work
  L2_57 = L2_57.setID
  L3_58 = A0_55.work
  L3_58 = L3_58.index
  L4_59 = desktopWidget
  L5_60 = L4_59
  L4_59 = L4_59._setUserMacroIcon
  L4_59(L5_60, L2_57, L3_58, A1_56)
  L5_60 = A0_55
  L4_59 = A0_55.getMacroIcon
  L4_59 = L4_59(L5_60, L2_57, L3_58)
  L5_60 = A0_55.setIconData
  L5_60(A0_55, "Button_SelectedIconDisplay", L4_59)
  L5_60 = A0_55.getButtonName
  L5_60 = L5_60(A0_55, L2_57, L3_58)
  A0_55:setIconData(L5_60, L4_59)
end
function UserMacroEditWidget.getMacroIcon(A0_61, A1_62, A2_63)
  if desktopWidget:_getUserMacroIcon(A1_62, A2_63) > 0 then
  end
  return desktopWidget:_getUserMacroIcon(A1_62, A2_63) + 41001 - 1
end
function UserMacroEditWidget.updateIconPage(A0_64, A1_65)
  local L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72, L9_73, L10_74, L11_75, L12_76, L13_77, L14_78
  if A1_65 == 0 then
    L2_66 = "Button_Ctrl_"
    L3_67 = 0
  else
    L2_66 = "Button_Alt_"
    L3_67 = 10
  end
  for L7_71 = 1, 5 do
    for L11_75 = 1, 10 do
      L12_76 = L2_66
      L13_77 = tostring
      L14_78 = L7_71
      L13_77 = L13_77(L14_78)
      L14_78 = "_"
      L12_76 = L12_76 .. L13_77 .. L14_78 .. tostring(L11_75)
      L14_78 = A0_64
      L13_77 = A0_64.getMacroIcon
      L13_77 = L13_77(L14_78, L7_71, L11_75 + L3_67)
      L14_78 = desktopWidget
      L14_78 = L14_78._getUserMacroTitle
      L14_78 = L14_78(L14_78, L7_71, L11_75 + L3_67)
      A0_64:setIconData(L12_76, L13_77, L14_78)
    end
  end
end
function UserMacroEditWidget.setIconData(A0_79, A1_80, A2_81, A3_82)
  A0_79:setIconWithVisibility(A1_80 .. ":IconControl_SelecedIcon", A2_81)
  if A3_82 ~= nil then
    A0_79:setText(A1_80 .. ":TextBlock_MacroTitle", A3_82)
  end
end
function UserMacroEditWidget.setSelectedCursor(A0_83, A1_84, A2_85, A3_86)
  local L4_87
  L4_87 = A0_83.getButtonName
  L4_87 = L4_87(A0_83, A1_84, A2_85)
  L4_87 = L4_87 .. ":Border_IconSelectedEffect"
  A0_83:setVisibility(L4_87, A3_86)
end
function UserMacroEditWidget.getButtonName(A0_88, A1_89, A2_90)
  local L3_91
  if A2_90 <= 10 then
    L3_91 = "Button_Ctrl_" .. tostring(A1_89) .. "_" .. tostring(A2_90)
  else
    L3_91 = "Button_Alt_" .. tostring(A1_89) .. "_" .. tostring(A2_90 - 10)
  end
  return L3_91
end
function UserMacroEditWidget.copyMacroData(A0_92)
  local L1_93, L2_94, L3_95, L4_96, L5_97, L6_98, L7_99, L8_100, L9_101, L10_102
  L1_93 = A0_92.work
  L1_93 = L1_93.setID
  L2_94 = A0_92.work
  L2_94 = L2_94.index
  L4_96 = A0_92
  L3_95 = A0_92.getFixedText
  L5_97 = "TextBox_ChatInput_UserMacroTitle"
  L3_95 = L3_95(L4_96, L5_97)
  L4_96 = "TextBox_ChatInput_UserMacroTitle"
  L5_97 = "_Copy"
  L4_96 = L4_96 .. L5_97
  L5_97 = A0_92.setText
  L5_97(L6_98, L7_99, L8_100)
  L5_97 = desktopWidget
  L5_97 = L5_97._getUserMacroIcon
  L5_97 = L5_97(L6_98, L7_99, L8_100)
  L9_101 = L4_96
  L10_102 = L5_97
  L6_98(L7_99, L8_100, L9_101, L10_102)
  for L9_101 = 1, 10 do
    L10_102 = A0_92.getFixedText
    L10_102 = L10_102(A0_92, "TextBox_ChatInput_WriteMacro_" .. tostring(L9_101))
    L4_96 = "TextBox_ChatInput_WriteMacro_" .. "Copy_" .. tostring(L9_101)
    A0_92:setText(L4_96, L10_102)
  end
end
function UserMacroEditWidget.pasteMacroData(A0_103)
  local L1_104, L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113, L11_114
  L1_104 = A0_103.work
  L1_104 = L1_104.setID
  L2_105 = A0_103.work
  L2_105 = L2_105.index
  L3_106 = "TextBox_ChatInput_UserMacroTitle"
  L4_107 = "_Copy"
  L3_106 = L3_106 .. L4_107
  L5_108 = A0_103
  L4_107 = A0_103.getFixedText
  L6_109 = L3_106
  L4_107 = L4_107(L5_108, L6_109)
  L6_109 = A0_103
  L5_108 = A0_103.setText
  L5_108(L6_109, L7_110, L8_111)
  L6_109 = A0_103
  L5_108 = A0_103.getControlUserWorkInt
  L5_108 = L5_108(L6_109, L7_110, L8_111)
  L6_109 = A0_103.setMacroIcon
  L6_109(L7_110, L8_111)
  L6_109 = A0_103.getButtonName
  L6_109 = L6_109(L7_110, L8_111, L9_112)
  L10_113 = ":TextBlock_MacroTitle"
  L10_113 = L4_107
  L7_110(L8_111, L9_112, L10_113)
  L10_113 = ":TextBlock_MacroTitle"
  L10_113 = L4_107
  L7_110(L8_111, L9_112, L10_113)
  for L10_113 = 1, 10 do
    L11_114 = "TextBox_ChatInput_WriteMacro_"
    L3_106 = L11_114 .. "Copy_" .. tostring(L10_113)
    L11_114 = A0_103.getFixedText
    L11_114 = L11_114(A0_103, L3_106)
    A0_103:setText("TextBox_ChatInput_WriteMacro_" .. tostring(L10_113), L11_114)
  end
end
function UserMacroEditWidget.clearMacroData(A0_115)
  local L1_116, L2_117, L3_118, L4_119, L5_120, L6_121, L7_122
  L1_116 = A0_115.work
  L1_116 = L1_116.setID
  L2_117 = A0_115.work
  L2_117 = L2_117.index
  L3_118 = A0_115.setText
  L3_118(L4_119, L5_120, L6_121)
  L3_118 = A0_115.getButtonName
  L3_118 = L3_118(L4_119, L5_120, L6_121)
  L4_119(L5_120, L6_121)
  L7_122 = ":TextBlock_MacroTitle"
  L7_122 = ""
  L4_119(L5_120, L6_121, L7_122)
  L7_122 = ":TextBlock_MacroTitle"
  L7_122 = ""
  L4_119(L5_120, L6_121, L7_122)
  for L7_122 = 1, 10 do
    A0_115:setText("TextBox_ChatInput_WriteMacro_" .. tostring(L7_122), "")
  end
end
