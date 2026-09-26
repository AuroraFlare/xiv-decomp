require("/Widget/Ask/AskBaseClass")
_defineClass("EventItemSelectWidget", "AskBaseClass")
function EventItemSelectWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10, A11_11, A12_12, A13_13, A14_14, A15_15, A16_16, A17_17, A18_18)
  local L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25
  L25_25 = 16
  L25_25 = "array"
  L25_25 = "inputNumberTbl"
  L19_19._temp = L20_20
  L19_19.updatecount = 0
  for L22_22 = 1, 16 do
    L23_23[L22_22] = 0
    L23_23[L22_22] = false
    L23_23[L22_22] = 0
  end
  L25_25 = A8_8
  if L20_20 > 16 then
    return L20_20
  end
  for L23_23 = 1, #L19_19 do
    if L24_24 ~= nil then
      L25_25 = L19_19[L23_23]
      L24_24[L23_23] = L25_25
    end
    if L24_24 > 0 then
      L24_24[L23_23] = true
    end
  end
  L20_20(L21_21, L22_22, L23_23)
  for L25_25 = 1, 16 do
    A0_0:setVisibility("Grid_Item_" .. tostring(L25_25), true)
    A0_0:setVisibility("Label_" .. tostring(L25_25), false)
    A0_0:setText("TextBlock_NoItem_" .. tostring(L25_25), 225, 0)
    A0_0:setVisibility("TextBlock_NoItem_" .. tostring(L25_25), true)
    A0_0:setText("TextBlock_Slash_" .. tostring(L25_25), 3473)
    A0_0:setNumberInput("CustomControl_NumberInput_" .. tostring(L25_25), 0, 0, 0)
    if A0_0.work.headingEnableTbl[L25_25] == true then
      if L21_21 == nil then
        return false
      end
      A0_0:setIcon("IconControl_ItemIcon_" .. tostring(L25_25), L21_21:getItemIcon())
      A0_0:setText("TextBlock_ItemName_" .. tostring(L25_25), 3202, A0_0.work.catalogIdTbl[L25_25], 1)
    elseif A0_0.work.headingEnableTbl[L25_25] == false then
      A0_0:setVisibility("Grid_Item_" .. tostring(L25_25), false)
    end
  end
  L25_25 = 3471
  L22_22(L23_23, L24_24, L25_25)
  L25_25 = 3472
  L22_22(L23_23, L24_24, L25_25)
  for L25_25 = 1, 16 do
    A0_0:setControlCommandCondition("Label_HitArea_" .. tostring(L25_25), "UILuaCommands.ButtonFocused")
    A0_0:setControlCommandCondition("Label_HitArea_" .. tostring(L25_25), "UILuaCommands.LostFocus")
    A0_0:setControlCommandCondition("Label_" .. tostring(L25_25), "UILuaCommands.ButtonFocused")
    A0_0:setControlCommandCondition("Label_" .. tostring(L25_25), "UILuaCommands.LostFocus")
    A0_0:setControlCommandCondition("CustomControl_NumberInput_" .. tostring(L25_25), "NumberInputBox.ValueChanged")
    A0_0:setCancelCondition("CustomControl_NumberInput_" .. tostring(L25_25))
  end
  L22_22(L23_23, L24_24)
  L22_22(L23_23, L24_24)
  L22_22(L23_23)
  L22_22(L23_23)
  L25_25 = false
  L22_22(L23_23, L24_24, L25_25, false, 621)
  L22_22(L23_23)
  L22_22(L23_23, L24_24)
end
function EventItemSelectWidget.updateWindowDisplay(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43, L18_44, L19_45
  L1_27 = worldMaster
  L1_27 = L1_27._getMyPlayer
  L1_27 = L1_27(L2_28)
  for L5_31 = 1, 16 do
    L7_33 = A0_26
    L6_32 = A0_26.setVisibility
    L8_34 = "Label_"
    L9_35 = tostring
    L10_36 = L5_31
    L9_35 = L9_35(L10_36)
    L8_34 = L8_34 .. L9_35
    L9_35 = false
    L6_32(L7_33, L8_34, L9_35)
    L7_33 = A0_26
    L6_32 = A0_26.setVisibility
    L8_34 = "TextBlock_NoItem_"
    L9_35 = tostring
    L10_36 = L5_31
    L9_35 = L9_35(L10_36)
    L8_34 = L8_34 .. L9_35
    L9_35 = true
    L6_32(L7_33, L8_34, L9_35)
    L7_33 = A0_26
    L6_32 = A0_26.setNumberInput
    L8_34 = "CustomControl_NumberInput_"
    L9_35 = tostring
    L10_36 = L5_31
    L9_35 = L9_35(L10_36)
    L8_34 = L8_34 .. L9_35
    L9_35 = 0
    L10_36 = 0
    L11_37 = 0
    L6_32(L7_33, L8_34, L9_35, L10_36, L11_37)
    L7_33 = A0_26
    L6_32 = A0_26.setText
    L8_34 = "TextBlock_ItemNumber_"
    L9_35 = tostring
    L10_36 = L5_31
    L9_35 = L9_35(L10_36)
    L8_34 = L8_34 .. L9_35
    L9_35 = 225
    L10_36 = 0
    L6_32(L7_33, L8_34, L9_35, L10_36)
    L7_33 = A0_26
    L6_32 = A0_26.setControlProperty
    L8_34 = "Grid_Item_"
    L9_35 = tostring
    L10_36 = L5_31
    L9_35 = L9_35(L10_36)
    L8_34 = L8_34 .. L9_35
    L9_35 = "IsEnabled"
    L10_36 = false
    L6_32(L7_33, L8_34, L9_35, L10_36)
  end
  L5_31 = 1
  L5_31 = 0
  L6_32 = {}
  L7_33 = 0
  L8_34 = false
  L9_35 = 0
  L10_36 = {}
  L11_37 = 0
  for L15_41 = 1, 16 do
    if L4_30 > 0 then
      if L16_42 == true then
        for L19_45 = 1, L4_30 do
          L5_31, L7_33, L8_34, L9_35 = desktopWidget:getPlayerItemInPackage(1, L19_45)
          L6_32[L19_45] = L5_31
          L10_36[L19_45] = L9_35
          if L5_31 ~= 0 and L5_31 == A0_26.work.catalogIdTbl[L15_41] then
            if L8_34 == true then
              if L19_45 > 1 then
                for _FORV_23_ = 1, L19_45 - 1 do
                  if L5_31 == L6_32[_FORV_23_] then
                    L9_35 = L9_35 + L10_36[_FORV_23_]
                  end
                end
              end
            elseif L8_34 == false then
              L9_35 = 1
            end
            A0_26:setVisibility("Label_" .. tostring(L15_41), true)
            A0_26:setVisibility("TextBlock_NoItem_" .. tostring(L15_41), false)
            L11_37 = A0_26:getValue("CustomControl_NumberInput_" .. tostring(L15_41))
            if L9_35 < L11_37 then
              L11_37 = L9_35
              A0_26:setValue("CustomControl_NumberInput_" .. tostring(L15_41), L11_37)
            end
            A0_26:setNumberInput("CustomControl_NumberInput_" .. tostring(L15_41), 0, L9_35, L11_37)
            A0_26:setText("TextBlock_ItemNumber_" .. tostring(L15_41), 225, L9_35)
            A0_26:setControlProperty("Grid_Item_" .. tostring(L15_41), "IsEnabled", true)
          end
        end
      end
    end
  end
  L12_38(L13_39)
end
function EventItemSelectWidget.processAfterShow(A0_46, A1_47)
  local L2_48, L3_49, L4_50, L5_51, L6_52
  L2_48 = A0_46.updateWindowDisplay
  L2_48(L3_49)
  L2_48 = false
  for L6_52 = 1, 16 do
    if A0_46.work.headingEnableTbl[L6_52] == true and A0_46:getVisibility("Label_" .. tostring(L6_52)) == true then
      A0_46:setKeyboardFocusedControl("Label_" .. tostring(L6_52))
      L2_48 = true
      break
    end
  end
  if L2_48 == false then
    L3_49(L4_50, L5_51)
  end
  return L3_49
end
function EventItemSelectWidget.processUICommandOperate(A0_53, A1_54, A2_55, A3_56, A4_57)
  local L5_58, L6_59, L7_60, L8_61, L9_62
  L5_58 = A2_55
  if L5_58 == "Button_Operate" then
    for L9_62 = 1, 16 do
      A0_53.work.inputNumberTbl[L9_62] = 0
      if A0_53.work.headingEnableTbl[L9_62] == true then
        A0_53.work.inputNumberTbl[L9_62] = A0_53:getValue("CustomControl_NumberInput_" .. tostring(L9_62))
      end
    end
    L6_59(L7_60, L8_61)
    return
  else
  end
  if L5_58 == "Button_Close" then
    L6_59(L7_60, L8_61)
    return
  else
  end
end
function EventItemSelectWidget.processUICommandCancel(A0_63, A1_64, A2_65, A3_66, A4_67)
  local L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74, L12_75
  L6_69 = A0_63
  L5_68 = A0_63.getKeyboardFocusedControl
  L5_68 = L5_68(L6_69)
  if L5_68 ~= nil then
    L6_69 = L5_68
    if L6_69 == "Button_Close" then
      L8_71 = A0_63
      L7_70 = A0_63.setBaseAskResult
      L7_70(L8_71, L9_72)
      break
    else
    end
    if L6_69 == "Button_Operate" then
      L8_71 = A0_63
      L7_70 = A0_63.setKeyboardFocusedControl
      L7_70(L8_71, L9_72)
      break
    else
    end
    L7_70 = false
    L8_71 = ""
    for L12_75 = 1, 16 do
      if A0_63.work.headingEnableTbl[L12_75] == true then
        L8_71 = "CustomControl_NumberInput_" .. tostring(L12_75)
        if A2_65 == L8_71 and L5_68 ~= L8_71 then
          L7_70 = true
          A0_63:setKeyboardFocusedControl(A2_65)
          break
        end
      end
    end
    if L7_70 == false then
      L9_72(L10_73)
      L9_72(L10_73, L11_74)
    end
  else
  end
end
function EventItemSelectWidget.processUICommandDefault(A0_76, A1_77, A2_78, A3_79, A4_80, A5_81)
  if A3_79 == "NumberInputBox.ValueChanged" then
    A0_76:setOperateButtonEnable()
  end
  if A3_79 == "UILuaCommands.ButtonFocused" then
    A0_76:displayItemHelp(A2_78)
  end
  if A3_79 == "UILuaCommands.LostFocus" then
    A0_76:closeItemHelp()
  end
end
function EventItemSelectWidget.updatePlayerItem(A0_82, A1_83, A2_84)
  if A1_83 == 0 then
    A0_82.work.updatecount = A2_84
    return
  else
  end
  if 0 < A0_82.work.updatecount then
    A0_82.work.updatecount = A0_82.work.updatecount - 1
  end
  if A0_82.work.updatecount == 0 then
    A0_82:updateWindowDisplay()
  end
  return
end
function EventItemSelectWidget.setWindowTitle(A0_85, A1_86, A2_87)
  if A1_86 ~= nil then
    A0_85:_setProperty(nil, "TextBlock_Title", "Text", A1_86, A2_87)
  end
end
function EventItemSelectWidget.setNumberInput(A0_88, A1_89, A2_90, A3_91, A4_92)
  A0_88:setControlProperty(A1_89, "Minimum", A2_90)
  A0_88:setMaximum(A1_89, A3_91)
  A0_88:setValue(A1_89, A4_92)
end
function EventItemSelectWidget.setOperateButtonEnable(A0_93)
  local L1_94, L2_95, L3_96, L4_97, L5_98
  L1_94 = false
  for L5_98 = 1, 16 do
    if A0_93.work.headingEnableTbl[L5_98] == true and A0_93:getValue("CustomControl_NumberInput_" .. tostring(L5_98)) > 0 then
      L1_94 = true
      break
    end
  end
  L5_98 = "IsEnabled"
  L2_95(L3_96, L4_97, L5_98, L1_94)
end
function EventItemSelectWidget.setDetailPosition(A0_99)
  local L1_100, L2_101, L3_102, L4_103, L5_104, L6_105, L7_106, L8_107, L9_108, L10_109, L11_110, L12_111, L13_112, L14_113, L15_114, L16_115
  L2_101 = A0_99
  L1_100 = A0_99.getChildWidgetByWindowName
  L3_102 = "ItemDetailWidget"
  L1_100 = L1_100(L2_101, L3_102)
  if L1_100 ~= nil then
    L3_102 = A0_99
    L2_101 = A0_99.getWindowPosition
    L3_102 = L2_101(L3_102)
    L4_103 = 32
    L5_104 = 32
    L7_106 = A0_99
    L6_105 = A0_99.getWindowSize
    L7_106 = L6_105(L7_106)
    L8_107 = desktopWidget
    L9_108 = L8_107
    L8_107 = L8_107.getWindowSize
    L9_108 = L8_107(L9_108)
    L11_110 = L1_100
    L10_109 = L1_100.getWindowSize
    L11_110 = L10_109(L11_110)
    if L6_105 == 0 then
      L6_105 = 500
    end
    if L10_109 == 0 then
      L10_109 = 382
    end
    if L11_110 == 0 then
      L11_110 = 280
    end
    L2_101 = L2_101 + L4_103
    L3_102 = L3_102 + L5_104
    L12_111 = L8_107 * 1
    L13_112 = L9_108 * 0.95
    L14_113 = L3_102
    L15_114 = L3_102 + 400
    L16_115 = L2_101 + L6_105
    if L12_111 < L16_115 + L10_109 then
      L16_115 = L16_115 - (L16_115 + L10_109 - L12_111)
    end
    if L13_112 < L15_114 then
      L14_113 = L14_113 - (L15_114 - L13_112)
    end
    L1_100:setProperty("Top", L14_113)
    L1_100:setProperty("Left", L16_115)
  end
end
function EventItemSelectWidget.displayItemHelp(A0_116, A1_117)
  local L2_118, L3_119, L4_120, L5_121, L6_122, L7_123, L8_124, L9_125, L10_126, L11_127, L12_128, L13_129, L14_130, L15_131, L16_132, L17_133, L18_134, L19_135, L20_136, L21_137, L22_138, L23_139
  L3_119 = A0_116
  L2_118 = A0_116.getChildWidgetByWindowName
  L4_120 = "ItemDetailWidget"
  L2_118 = L2_118(L3_119, L4_120)
  if L2_118 ~= nil then
    if A1_117 == nil then
      L3_119 = false
      return L3_119
    end
    L4_120 = L2_118
    L3_119 = L2_118.isShow
    L3_119 = L3_119(L4_120)
    if L3_119 == false then
      L3_119 = worldMaster
      L4_120 = L3_119
      L3_119 = L3_119._getMyPlayer
      L3_119 = L3_119(L4_120)
      L4_120 = {L5_121, L6_122}
      L5_121 = "Label_HitArea_"
      L6_122 = "Label_"
      L5_121 = false
      L6_122 = 0
      L7_123 = 0
      L8_124 = 0
      L9_125 = 0
      L10_126 = false
      L11_127 = nil
      L12_128 = 0
      L13_129 = 0
      L14_130 = false
      L15_131 = 0
      for L19_135 = 1, 16 do
        L5_121 = false
        for L23_139 = 1, #L4_120 do
          if A1_117 == L4_120[L23_139] .. tostring(L19_135) then
            L5_121 = true
            break
          end
        end
        if L20_136 == true and L5_121 == true then
          L6_122 = L19_135
          L7_123 = L20_136
          L8_124 = L20_136
          L9_125 = L7_123 - L8_124
          if L9_125 > 0 then
            for L23_139 = 1, L9_125 do
              L12_128, L13_129, L14_130, L15_131 = desktopWidget:getPlayerItemInPackage(1, L23_139)
              if L12_128 ~= 0 and L12_128 == A0_116.work.catalogIdTbl[L6_122] then
                L11_127 = L3_119:_getItem(1, L23_139)
                if L11_127 ~= nil then
                  L2_118:displayItemHelp(L11_127, 1, L23_139, 1)
                  L2_118:setText("TextBlock_Title", 3207)
                  L10_126 = true
                end
                break
              end
            end
          end
          break
        end
      end
      if L6_122 <= 0 or L10_126 == false then
        L16_132(L17_133, L18_134)
      end
      L16_132(L17_133)
      L16_132(L17_133, L18_134)
      L16_132(L17_133)
    end
  end
end
function EventItemSelectWidget.closeItemHelp(A0_140)
  if A0_140:getChildWidgetByWindowName("ItemDetailWidget") ~= nil and A0_140:getChildWidgetByWindowName("ItemDetailWidget"):isShow() == true then
    A0_140:getChildWidgetByWindowName("ItemDetailWidget"):hide()
  end
end
function EventItemSelectWidget.getAskResult(A0_141)
  local L1_142, L2_143
  L2_143 = A0_141
  L1_142 = A0_141.getBaseAskResult
  L1_142 = L1_142(L2_143)
  L2_143 = true
  if L1_142 == 1 then
    L2_143 = true
  elseif L1_142 == -1 then
    L2_143 = false
  end
  return L2_143, A0_141.work.inputNumberTbl[1], A0_141.work.inputNumberTbl[2], A0_141.work.inputNumberTbl[3], A0_141.work.inputNumberTbl[4], A0_141.work.inputNumberTbl[5], A0_141.work.inputNumberTbl[6], A0_141.work.inputNumberTbl[7], A0_141.work.inputNumberTbl[8], A0_141.work.inputNumberTbl[9], A0_141.work.inputNumberTbl[10], A0_141.work.inputNumberTbl[11], A0_141.work.inputNumberTbl[12], A0_141.work.inputNumberTbl[13], A0_141.work.inputNumberTbl[14], A0_141.work.inputNumberTbl[15], A0_141.work.inputNumberTbl[16]
end
