local L0_0, L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_2, A1_3, A2_4, A3_5, A4_6)
  local L5_7
  L5_7 = A0_2.widgetWork
  L5_7 = L5_7.common
  L5_7._nesting = {
    {
      "widgetName",
      "string",
      64
    },
    {
      "widgetIndex",
      "integer8"
    },
    {
      "visibleFlag",
      "boolean"
    },
    {
      "forceHideFlag",
      "boolean"
    },
    {"argActor", "actor"}
  }
  L5_7 = A0_2.getFormName
  L5_7 = L5_7(A0_2)
  if L5_7 == nil then
    L5_7 = _string.gsub(A2_4, ".+/", "")
  end
  A0_2:loadFormData(L5_7)
  A0_2.widgetWork.common.widgetName = "Window_" .. L5_7
  if L5_7 ~= "Desktop" then
    if L5_7 ~= A2_4 then
      A0_2:setWindowName("Window_" .. A2_4)
    end
    A0_2:setProperty("Visibility", "Hidden")
  end
  A0_2.widgetWork.common.widgetIndex = A3_5
  A0_2.widgetWork.common.visibleFlag = A4_6
  A0_2.widgetWork.common.forceHideFlag = false
  A0_2.widgetWork.common.argActor = nil
  if A0_2:getWindowName() ~= "Desktop" then
    A0_2:setModalGroup(1)
    A0_2:setDrawPriority(0.1)
    A0_2:initConsumedCommmand()
  end
  return 4
end
L0_0.initCommon = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_8)
  local L1_9, L2_10, L3_11
  L2_10 = A0_8
  L1_9 = A0_8.getProperty
  L3_11 = "ConsumedCommand"
  L1_9 = L1_9(L2_10, L3_11)
  L2_10 = string
  L3_11 = L2_10
  L2_10 = L2_10.split
  L2_10 = L2_10(L3_11, L1_9, ",")
  L3_11 = "UILuaCommands.Operate"
  L3_11 = L3_11 .. "," .. "UILuaCommands.Cancel" .. "," .. "UILuaCommands.WidgetClose" .. "," .. "UILuaCommands.Shown" .. "," .. "UILuaCommands.Activated" .. "," .. "UILuaCommands.OpenUserMacro" .. "," .. "UILuaCommands.ShortCutAction" .. "," .. "UIOperatorCommands.Close" .. "," .. "UIOperatorCommands.OpenChild" .. "," .. "UIOperatorCommands.Request"
  for _FORV_7_ = 1, #L2_10 do
    if L2_10[_FORV_7_] == "" then
    elseif L2_10[_FORV_7_] == "UILuaCommands.Operate" then
    elseif L2_10[_FORV_7_] == "UILuaCommands.Cancel" then
    elseif L2_10[_FORV_7_] == "UILuaCommands.WidgetClose" then
    elseif L2_10[_FORV_7_] == "UILuaCommands.Shown" then
    elseif L2_10[_FORV_7_] == "UILuaCommands.Activated" then
    elseif L2_10[_FORV_7_] == "UILuaCommands.OpenUserMacro" then
    else
      if L2_10[_FORV_7_] == "UILuaCommands.ShortCutAction" then
        break
      else
      end
      L3_11 = L3_11 .. "," .. L2_10[_FORV_7_]
      break
    end
  end
  A0_8:setProperty("ConsumedCommand", L3_11)
end
L0_0.initConsumedCommmand = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_12)
  local L1_13
  return L1_13
end
L0_0.getFormName = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_14, A1_15)
  A0_14:setProperty("Name", A1_15)
  A0_14.widgetWork.common.widgetName = A1_15
end
L0_0.setWindowName = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_16)
  local L1_17, L2_18
  L1_17 = A0_16.widgetWork
  L1_17 = L1_17.common
  L1_17 = L1_17.widgetName
  L2_18 = "_"
  if #string:split(L1_17, L2_18) ~= 2 then
    return A0_16.widgetWork.common.widgetName
  end
  if string:split(L1_17, L2_18)[1] ~= "Window" then
    return A0_16.widgetWork.common.widgetName
  end
  return string:split(L1_17, L2_18)[2]
end
L0_0.getWindowName = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_19)
  local L1_20
  L1_20 = A0_19.widgetWork
  L1_20 = L1_20.common
  L1_20 = L1_20.widgetIndex
  return L1_20
end
L0_0.getWidgetIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_21)
  return A0_21:getWidgetIndex() == 3
end
L0_0.isMainMenuWidget = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_22)
  return A0_22:getWidgetTypeByIndex(A0_22.widgetWork.common.widgetIndex)
end
L0_0.getWidgetType = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_23)
  local L1_24
  L1_24 = A0_23.widgetWork
  L1_24 = L1_24.common
  L1_24 = L1_24.visibleFlag
  return L1_24
end
L0_0.getVisibleFlag = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_25, A1_26)
  local L2_27, L3_28
  L3_28 = A1_26
  if L3_28 == 0 then
    L2_27 = 0
    break
  else
  end
  if L3_28 == 1 then
    L2_27 = 1
    break
  else
  end
  if L3_28 == 2 then
    L2_27 = 2
    break
  else
  end
  if L3_28 == 3 then
    L2_27 = 3
    break
  elseif L3_28 == 4 then
  else
  end
  if L3_28 == 5 then
    L2_27 = 4
    break
  elseif L3_28 == 6 then
  elseif L3_28 == 7 then
  elseif L3_28 == 8 then
  elseif L3_28 == 9 then
  elseif L3_28 == 15 then
  else
  end
  if L3_28 == 16 then
    L2_27 = 5
    break
  elseif L3_28 == 10 then
  elseif L3_28 == 11 then
  else
  end
  if L3_28 == 12 then
    L2_27 = 6
    break
  elseif L3_28 == 13 then
  elseif L3_28 == 14 then
  else
  end
  if L3_28 == 17 then
    L2_27 = 7
    do break end
    break
  else
  end
  return L2_27
end
L0_0.getWidgetTypeByIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_29, A1_30)
  if A1_30 ~= nil and A1_30:_isAlive() == false then
    return
  end
  A0_29.widgetWork.common.argActor = A1_30
end
L0_0.setArgActor = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_31)
  local L1_32
  L1_32 = A0_31.widgetWork
  L1_32 = L1_32.common
  L1_32 = L1_32.argActor
  if L1_32 ~= nil and L1_32:_isAlive() == false then
    L1_32 = nil
    A0_31.widgetWork.common.argActor = nil
  end
  return L1_32
end
L0_0.getArgActor = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_33)
  local L1_34
  L1_34 = false
  return L1_34
end
L0_0.isCreateCancel = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_35, A1_36, A2_37, A3_38, A4_39, A5_40)
  local L6_41, L7_42
  L6_41 = A3_38
  if L6_41 == "UILuaCommands.Operate" then
    L7_42 = A0_35.processUICommandOperate
    L7_42(A0_35, A1_36, A2_37, A4_39, A5_40)
    break
  else
  end
  if L6_41 == "ApplicationCommands.Operate" then
    L7_42 = A0_35.processUICommandApplicationOperate
    L7_42(A0_35, A1_36, A2_37, A4_39, A5_40)
    break
  else
  end
  if L6_41 == "UILuaCommands.Cancel" then
    L7_42 = A0_35.processUICommandCancel
    L7_42(A0_35, A1_36, A2_37, A4_39, A5_40)
    break
  else
  end
  if L6_41 == "UILuaCommands.WidgetClose" then
    L7_42 = A0_35.processUICommandClose
    L7_42(A0_35, A1_36, A2_37, A4_39, A5_40)
    break
  else
  end
  if L6_41 == "UILuaCommands.Selection" then
    L7_42 = A0_35.getSelectedIndex
    L7_42 = L7_42(A0_35, A2_37)
    A4_39 = L7_42
    if A4_39 < 0 then
    else
      L7_42 = A0_35.processUICommandSelection
      L7_42(A0_35, A1_36, A2_37, A4_39, A5_40)
      do break end
      elseif L6_41 == "UILuaCommands.SelectionChanged" then
      else
      end
      if L6_41 == "UILuaCommands.SelectionChangedOnce" then
        L7_42 = A0_35.getSelectedIndex
        L7_42 = L7_42(A0_35, A2_37)
        A4_39 = L7_42
        if A4_39 < 0 then
        else
          L7_42 = A0_35.processUICommandSelectionChanged
          L7_42(A0_35, A1_36, A2_37, A4_39, A5_40)
          if A3_38 == "UILuaCommands.SelectionChanged" then
            L7_42 = A0_35.setSelectedIndex
            L7_42(A0_35, A2_37)
            do break end
            else
            end
            if L6_41 == "UILuaCommands.EnterMouseFocus" then
              L7_42 = A0_35.processUICommandEnterMouseFocus
              L7_42(A0_35, A1_36, A4_39)
              break
            else
            end
            if L6_41 == "UILuaCommands.EnterKeyboardFocus" then
              L7_42 = A0_35.processUICommandEnterKeyboardFocus
              L7_42(A0_35, A1_36, A4_39)
              break
            else
            end
            if L6_41 == "UILuaCommands.EnterSelectorMouseFocus" then
              L7_42 = A0_35.getMouseEnteredIndex
              L7_42 = L7_42(A0_35, A4_39)
              if L7_42 < 0 then
              else
                A0_35:processUICommandEnterSelectorMouseFocus(A1_36, A4_39, L7_42)
                do break end
                else
                end
                if L6_41 == "UILuaCommands.EnterSelectorKeyboardFocus" then
                  L7_42 = A0_35.getAnchoredIndex
                  L7_42 = L7_42(A0_35, A4_39)
                  if L7_42 < 0 then
                  else
                    A0_35:processUICommandEnterSelectorKeyboardFocus(A1_36, A4_39, L7_42)
                    do break end
                    else
                    end
                    if L6_41 == "UILuaCommands.LostMouseFocus" then
                      L7_42 = A0_35.processUICommandLostMouseFocus
                      L7_42(A0_35, A1_36, A4_39)
                      break
                    else
                    end
                    if L6_41 == "UILuaCommands.ToggleButton" then
                      L7_42 = A0_35.getChecked
                      L7_42 = L7_42(A0_35, A2_37)
                      A0_35:processUICommandToggleButton(A1_36, A2_37, A4_39, A5_40, L7_42)
                      break
                    else
                    end
                    if L6_41 == "UILuaCommands.SliderValueChanged" then
                      L7_42 = _math
                      L7_42 = L7_42.floor
                      L7_42 = L7_42(A0_35:getValue(A2_37))
                      A0_35:processUICommandSliderChange(A1_36, A2_37, A4_39, A5_40, L7_42)
                      break
                    else
                    end
                    if L6_41 == "UIOperatorCommands.Close" then
                      L7_42 = A0_35.processUIOperatorCommandClose
                      L7_42(A0_35)
                      break
                    else
                    end
                    if L6_41 == "UIOperatorCommands.OpenChild" then
                      L7_42 = A0_35.processUIOperatorCommandOpenChild
                      L7_42(A0_35, A4_39)
                      break
                    else
                    end
                    if L6_41 == "UIOperatorCommands.Request" then
                      L7_42 = A0_35.processUIOperatorCommandRequest
                      L7_42(A0_35, A4_39, A5_40)
                      break
                    else
                    end
                    L7_42 = A0_35.processUICommandDefault
                    L7_42(A0_35, A1_36, A2_37, A3_38, A4_39, A5_40)
                  end
              end
          else
          end
        end
    end
end
L0_0.processUICommandEvent = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_43, A1_44, A2_45, A3_46, A4_47)
end
L0_0.processUICommandOperate = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_48, A1_49, A2_50, A3_51, A4_52)
  A0_48:processUICommandOperate(A1_49, A2_50, A3_51, A4_52)
end
L0_0.processUICommandApplicationOperate = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_53, A1_54, A2_55, A3_56, A4_57)
  A0_53:processUICommandClose(A1_54, A2_55, A3_56, A4_57)
end
L0_0.processUICommandCancel = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_58, A1_59, A2_60, A3_61, A4_62)
  desktopWidget:closeWidgetDirect(A0_58)
end
L0_0.processUICommandClose = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_63, A1_64, A2_65, A3_66, A4_67)
end
L0_0.processUICommandSelection = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_68, A1_69, A2_70, A3_71, A4_72)
end
L0_0.processUICommandSelectionChanged = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_73, A1_74, A2_75)
  A0_73:processUICommandEnterFocus(A1_74, A2_75)
end
L0_0.processUICommandEnterMouseFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_76, A1_77, A2_78)
  A0_76:processUICommandEnterFocus(A1_77, A2_78)
end
L0_0.processUICommandEnterKeyboardFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_79, A1_80, A2_81)
end
L0_0.processUICommandEnterFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_82, A1_83, A2_84, A3_85)
  A0_82:processUICommandEnterSelectorFocus(A1_83, A2_84, A3_85)
end
L0_0.processUICommandEnterSelectorMouseFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_86, A1_87, A2_88, A3_89)
  A0_86:processUICommandEnterSelectorFocus(A1_87, A2_88, A3_89)
end
L0_0.processUICommandEnterSelectorKeyboardFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_90, A1_91, A2_92, A3_93)
end
L0_0.processUICommandEnterSelectorFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_94, A1_95, A2_96)
end
L0_0.processUICommandLostMouseFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_97, A1_98, A2_99, A3_100, A4_101, A5_102)
end
L0_0.processUICommandToggleButton = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_103, A1_104, A2_105, A3_106, A4_107, A5_108)
end
L0_0.processUICommandSliderChange = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_109)
  desktopWidget:closeWidgetDirect(A0_109)
end
L0_0.processUIOperatorCommandClose = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_110, A1_111)
  desktopWidget:openChildWidget(A1_111, A0_110, true)
end
L0_0.processUIOperatorCommandOpenChild = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_112, A1_113, A2_114)
end
L0_0.processUIOperatorCommandRequest = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_115, A1_116, A2_117, A3_118, A4_119, A5_120)
end
L0_0.processUICommandDefault = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_121, A1_122, A2_123, A3_124, A4_125, A5_126)
end
L0_0.processUICommandRequest = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_127)
  local L1_128
  L1_128 = true
  return L1_128
end
L0_0.processWaitCallFunction = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_129, A1_130)
end
L0_0.processWaitTimerFunction = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_131, A1_132)
end
L0_0.processErrorDialogResult = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_133, A1_134, A2_135, ...)
  local L4_137
  L4_137 = A0_133.getWidgetIndex
  L4_137 = L4_137(A0_133)
  desktopWidget:openInitialChildWidget(L4_137, A1_134, A0_133, A2_135, ...)
end
L0_0.initChildWidget = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_138)
  A0_138:setInputEnable(false)
  A0_138:processClosing()
  A0_138:_delete()
end
L0_0.close = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_139)
  local L1_140
end
L0_0.processClosing = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_141, A1_142, A2_143, A3_144)
  local L4_145, L5_146, L6_147, L7_148, L8_149, L9_150, L10_151, L11_152
  if A3_144 ~= true then
    L4_145 = A0_141.widgetWork
    L4_145 = L4_145.common
    L4_145.visibleFlag = true
  end
  L4_145 = A0_141.widgetWork
  L4_145 = L4_145.common
  L4_145 = L4_145.forceHideFlag
  if L4_145 == true then
    L4_145 = false
    return L4_145
  end
  L5_146 = A0_141
  L4_145 = A0_141.isShow
  L4_145 = L4_145(L5_146)
  if L4_145 == true then
    L4_145 = false
    return L4_145
  end
  L5_146 = A0_141
  L4_145 = A0_141.setInputEnable
  L6_147 = true
  L4_145(L5_146, L6_147)
  L5_146 = A0_141
  L4_145 = A0_141.sendCommand
  L6_147 = "UIOperatorCommands.BeforeLuaShow"
  L4_145(L5_146, L6_147)
  L5_146 = A0_141
  L4_145 = A0_141.processBeforeShow
  L6_147 = A3_144
  L4_145 = L4_145(L5_146, L6_147)
  if A1_142 == false then
    L6_147 = A0_141
    L5_146 = A0_141.setProperty
    L7_148 = "Visibility"
    L5_146(L6_147, L7_148, L8_149)
  else
    L6_147 = A0_141
    L5_146 = A0_141.setProperty
    L7_148 = "Anime"
    L5_146(L6_147, L7_148, L8_149)
  end
  L6_147 = A0_141
  L5_146 = A0_141.processAfterShow
  L7_148 = A3_144
  L5_146 = L5_146(L6_147, L7_148)
  L7_148 = A0_141
  L6_147 = A0_141.sendCommand
  L6_147(L7_148, L8_149)
  if A2_143 == true then
    L7_148 = A0_141
    L6_147 = A0_141._countChildWidgets
    L6_147 = L6_147(L7_148)
    L7_148 = nil
    for L11_152 = 1, L6_147 do
      L7_148 = A0_141:_getChildWidget(L11_152)
      L7_148:show(A1_142, A2_143, A3_144)
    end
  end
  if L4_145 == false or L5_146 == false then
    L6_147 = false
    return L6_147
  end
  L6_147 = true
  return L6_147
end
L0_0.show = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_153, A1_154)
  local L2_155
  L2_155 = true
  return L2_155
end
L0_0.processBeforeShow = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_156, A1_157)
  local L2_158
  L2_158 = true
  return L2_158
end
L0_0.processAfterShow = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_159, A1_160, A2_161, A3_162)
  local L4_163, L5_164, L6_165, L7_166, L8_167, L9_168, L10_169
  if A3_162 ~= true then
    L4_163 = A0_159.widgetWork
    L4_163 = L4_163.common
    L4_163.visibleFlag = false
  end
  L5_164 = A0_159
  L4_163 = A0_159.isShow
  L4_163 = L4_163(L5_164)
  if L4_163 == false then
    L4_163 = false
    return L4_163
  end
  L5_164 = A0_159
  L4_163 = A0_159.setInputEnable
  L6_165 = false
  L4_163(L5_164, L6_165)
  if A1_160 == false then
    L5_164 = A0_159
    L4_163 = A0_159.setProperty
    L6_165 = "Visibility"
    L4_163(L5_164, L6_165, L7_166)
  else
    L5_164 = A0_159
    L4_163 = A0_159.setProperty
    L6_165 = "Anime"
    L4_163(L5_164, L6_165, L7_166)
  end
  L5_164 = A0_159
  L4_163 = A0_159.processAfterHide
  L6_165 = A3_162
  L4_163 = L4_163(L5_164, L6_165)
  if A2_161 == true then
    L6_165 = A0_159
    L5_164 = A0_159._countChildWidgets
    L5_164 = L5_164(L6_165)
    L6_165 = nil
    for L10_169 = 1, L5_164 do
      L6_165 = A0_159:_getChildWidget(L10_169)
      L6_165:hide(A1_160, A2_161, A3_162)
    end
  end
  return L4_163
end
L0_0.hide = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_170, A1_171)
  local L2_172
  L2_172 = true
  return L2_172
end
L0_0.processAfterHide = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_173)
  if A0_173:getProperty("Visibility") == "Hidden" then
    return false
  end
  if A0_173:getProperty("Anime") == "Hide" then
    return false
  end
  return true
end
L0_0.isShow = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_174, A1_175)
  local L2_176, L3_177, L4_178, L5_179, L6_180
  L2_176 = A0_174._countChildWidgets
  L2_176 = L2_176(L3_177)
  for L6_180 = 1, L2_176 do
    if A0_174:_getChildWidget(L6_180):getWindowName() == A1_175 then
      return (A0_174:_getChildWidget(L6_180))
    end
  end
  return L3_177
end
L0_0.getChildWidgetByWindowName = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_181, A1_182)
  local L2_183, L3_184, L4_185, L5_186, L6_187, L7_188, L8_189
  L2_183 = false
  if A1_182 == true then
    L3_184 = A0_181.widgetWork
    L3_184 = L3_184.common
    L3_184 = L3_184.visibleFlag
    if L3_184 == true then
      L2_183 = true
    end
    L3_184 = A0_181.widgetWork
    L3_184 = L3_184.common
    L3_184.forceHideFlag = false
  else
    L3_184 = A0_181.widgetWork
    L3_184 = L3_184.common
    L3_184.forceHideFlag = true
  end
  if L2_183 == true then
    L4_185 = A0_181
    L3_184 = A0_181.show
    L3_184(L4_185, L5_186, L6_187, L7_188)
  else
    L4_185 = A0_181
    L3_184 = A0_181.hide
    L3_184(L4_185, L5_186, L6_187, L7_188)
  end
  L4_185 = A0_181
  L3_184 = A0_181._countChildWidgets
  L3_184 = L3_184(L4_185)
  L4_185 = nil
  for L8_189 = 1, L3_184 do
    L4_185 = A0_181:_getChildWidget(L8_189)
    L4_185:forceVisible(A1_182)
  end
end
L0_0.forceVisible = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_190)
  local L1_191
  L1_191 = A0_190.widgetWork
  L1_191 = L1_191.common
  L1_191 = L1_191.forceHideFlag
  return L1_191
end
L0_0.isForceHide = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_192, A1_193, A2_194)
  local L3_195
  if A1_193 ~= nil then
    L3_195 = ""
    if A2_194 == nil then
      L3_195 = "{CommandParameter Int," .. tostring(A1_193) .. "}"
    else
      L3_195 = "{CommandParameter Int," .. tostring(A1_193) .. "," .. tostring(A2_194) .. "}"
    end
    return L3_195
  end
  L3_195 = nil
  return L3_195
end
L0_0.packCommandParameter = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_196, A1_197, ...)
  local L3_199, L4_200, L5_201, L6_202, L7_203, L8_204, L9_205
  L3_199 = ""
  L4_200 = select
  L9_205 = ...
  L4_200 = L4_200(L5_201, L6_202, L7_203, L8_204, L9_205, ...)
  for L8_204 = 1, L4_200 do
    L9_205 = select
    L9_205 = L9_205(L8_204, ...)
    if L9_205 ~= nil then
      if type(L9_205) == "string" then
        L3_199 = L3_199 .. "/s" .. L9_205
      else
        L3_199 = L3_199 .. "/i" .. tostring(L9_205)
      end
    end
  end
  return L5_201
end
L0_0.packTextParameter = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_206, A1_207)
  A0_206:_sendStoryboardCommand(nil, "", A1_207)
end
L0_0.sendDesktopCommand = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_208, A1_209, A2_210, A3_211)
  A0_208:sendControlCommand(A0_208.widgetWork.common.widgetName, A1_209, A2_210, A3_211)
end
L0_0.sendCommand = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_212, A1_213, A2_214, A3_215, A4_216)
  A0_212:_sendStoryboardCommand(nil, A1_213, A2_214, A3_215, A4_216)
end
L0_0.sendControlCommand = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_217, A1_218)
  A0_217:_setUICommandCondition("_widget", A1_218, 5)
end
L0_0.setUICommandCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_219, A1_220, A2_221)
  A0_219:_setUICommandCondition(A1_220, A2_221, 5)
end
L0_0.setControlCommandCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_222, A1_223)
  A0_222:_setUICommandCondition(A1_223, "UILuaCommands.Operate", 5)
end
L0_0.setConfirmCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_224, A1_225)
  A0_224:_setUICommandCondition(A1_225, "ApplicationCommands.Operate", 5)
end
L0_0.setApplicationOperateCommand = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_226, A1_227)
  if A1_227 == nil then
    A1_227 = "_widget"
  end
  A0_226:_setUICommandCondition(A1_227, "UILuaCommands.Cancel", 5)
end
L0_0.setCancelCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_228)
  A0_228:_setUICommandCondition("_widget", "UILuaCommands.WidgetClose", 5)
end
L0_0.setCloseCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_229, A1_230, A2_231)
  A0_229:_setUICommandTemplateCondition(A1_230, A2_231, "UILuaCommands.Operate", 5)
end
L0_0.setTemplateConfirmCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_232, A1_233, A2_234)
  A0_232:_setUICommandTemplateCondition(A1_233, A2_234, "UILuaCommands.Cancel", 5)
end
L0_0.setTemplateCancelCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_235, A1_236)
  A0_235:setTemplateConfirmCondition("ControlTemplate_ListBoxItem", A1_236)
end
L0_0.setTemplateListBoxCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_237)
  A0_237:_setUICommandCondition("_widget", "UIOperatorCommands.Close", 5)
end
L0_0.setOperatorCloseCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_238)
  A0_238:_setUICommandCondition("_widget", "UIOperatorCommands.OpenChild", 5)
end
L0_0.setOperatorOpenChildCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_239)
  A0_239:_setUICommandCondition("_widget", "UIOperatorCommands.Request", 5)
end
L0_0.setOperatorRequestCondition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_240, A1_241, ...)
  local L3_243, L4_244, L5_245, L6_246, L7_247, L8_248
  L4_244 = A0_240
  L3_243 = A0_240._setProperty
  L5_245 = nil
  L6_246 = A0_240.widgetWork
  L6_246 = L6_246.common
  L6_246 = L6_246.widgetName
  L7_247 = A1_241
  L8_248 = ...
  L3_243(L4_244, L5_245, L6_246, L7_247, L8_248)
end
L0_0.setProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_249, A1_250)
  return A0_249:_getProperty(nil, A0_249.widgetWork.common.widgetName, A1_250)
end
L0_0.getProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_251, A1_252, A2_253, ...)
  local L4_255, L5_256, L6_257, L7_258, L8_259, L9_260
  L5_256 = A0_251
  L4_255 = A0_251._setProperty
  L6_257 = nil
  L7_258 = A1_252
  L8_259 = A2_253
  L9_260 = ...
  L4_255(L5_256, L6_257, L7_258, L8_259, L9_260)
end
L0_0.setControlProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_261, A1_262, A2_263)
  return A0_261:_getProperty(nil, A1_262, A2_263)
end
L0_0.getControlProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_264, A1_265)
  local L2_266
  L2_266 = A0_264.getProperty
  L2_266 = L2_266(A0_264, "ConsumedCommand")
  if _string.find(L2_266, A1_265) ~= nil then
    return
  end
  L2_266 = L2_266 .. "," .. A1_265
  A0_264:setProperty("ConsumedCommand", L2_266)
end
L0_0.setConsumedCommand = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_267, A1_268)
  local L2_269
  L2_269 = A0_267.getProperty
  L2_269 = L2_269(A0_267, "ConsumedCommand")
  L2_269 = _string.gsub(L2_269, "," .. A1_268, "")
  L2_269 = _string.gsub(L2_269, A1_268 .. "," .. "?", "")
  A0_267:setProperty("ConsumedCommand", L2_269)
end
L0_0.resetConsumedCommand = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_270, A1_271)
  A0_270:setProperty("SqwtIsEnableInput", A1_271)
end
L0_0.setInputEnable = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_272)
  return A0_272:getProperty("SqwtIsEnableInput")
end
L0_0.getInputEnable = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_273, A1_274)
  A0_273:setProperty("IsModal", A1_274)
end
L0_0.setModal = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_275, A1_276)
  A0_275:setProperty("SqwtModalGroup", A1_276)
end
L0_0.setModalGroup = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_277, A1_278)
  local L2_279
  if A1_278 == true then
    L2_279 = "CanDrag"
  else
    L2_279 = "NoDrag"
  end
  A0_277:setProperty("DragMode", L2_279)
end
L0_0.setDrag = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_280, A1_281, A2_282)
  A0_280:setControlProperty(A1_281, "IsEnabled", A2_282)
end
L0_0.setEnable = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_283, A1_284)
  local L2_285
  L2_285 = A0_283.getControlProperty
  L2_285 = L2_285(A0_283, A1_284, "IsEnabled")
  return A0_283:getBoolean(L2_285)
end
L0_0.getEnable = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_286, A1_287, A2_288)
  A0_286:setItemVisibility(nil, A1_287, A2_288)
end
L0_0.setVisibility = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_289, A1_290, A2_291, A3_292)
  local L4_293
  if A3_292 == true then
    L4_293 = "Visible"
  else
    L4_293 = "Collapsed"
  end
  A0_289:_setProperty(A1_290, A2_291, "Visibility", L4_293)
end
L0_0.setItemVisibility = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_294, A1_295)
  A0_294:setItemHidden(nil, A1_295)
end
L0_0.setHidden = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_296, A1_297, A2_298)
  A0_296:_setProperty(A1_297, A2_298, "Visibility", "Hidden")
end
L0_0.setItemHidden = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_299, A1_300)
  return A0_299:getItemVisibility(nil, A1_300)
end
L0_0.getVisibility = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_301, A1_302, A2_303)
  if A0_301:_getProperty(A1_302, A2_303, "Visibility") == "Visible" then
    return true
  end
  return false
end
L0_0.getItemVisibility = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_304, A1_305, A2_306, ...)
  local L4_308, L5_309, L6_310, L7_311, L8_312, L9_313, L10_314
  L5_309 = A0_304
  L4_308 = A0_304.setTextProperty
  L6_310 = nil
  L7_311 = A1_305
  L8_312 = "Content"
  L9_313 = A2_306
  L10_314 = ...
  L4_308(L5_309, L6_310, L7_311, L8_312, L9_313, L10_314)
end
L0_0.setContent = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_315, A1_316, A2_317, ...)
  if type(A2_317) == "number" then
    A0_315:_setTextProperty(nil, A1_316, "ContentTextUI", A2_317, ...)
  else
    A0_315:setContent(A1_316, A2_317, ...)
  end
end
L0_0.setMacroContent = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_319, A1_320, A2_321, ...)
  local L4_323, L5_324, L6_325, L7_326, L8_327, L9_328, L10_329
  L5_324 = A0_319
  L4_323 = A0_319.setTextProperty
  L6_325 = nil
  L7_326 = A1_320
  L8_327 = "Header"
  L9_328 = A2_321
  L10_329 = ...
  L4_323(L5_324, L6_325, L7_326, L8_327, L9_328, L10_329)
end
L0_0.setHeader = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_330, A1_331, A2_332, ...)
  if type(A2_332) == "number" then
    A0_330:_setTextProperty(nil, A1_331, "HeaderTextUI", A2_332, ...)
  else
    A0_330:setHeader(A1_331, A2_332, ...)
  end
end
L0_0.setMacroHeader = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_334, A1_335, A2_336, ...)
  local L4_338, L5_339, L6_340, L7_341, L8_342, L9_343
  L5_339 = A0_334
  L4_338 = A0_334.setItemText
  L6_340 = nil
  L7_341 = A1_335
  L8_342 = A2_336
  L9_343 = ...
  L4_338(L5_339, L6_340, L7_341, L8_342, L9_343)
end
L0_0.setText = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_344, A1_345)
  return A0_344:getControlProperty(A1_345, "Text")
end
L0_0.getText = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_346, A1_347, A2_348, A3_349, ...)
  local L5_351, L6_352, L7_353, L8_354, L9_355, L10_356, L11_357
  L6_352 = A0_346
  L5_351 = A0_346.setTextProperty
  L7_353 = A1_347
  L8_354 = A2_348
  L9_355 = "Text"
  L10_356 = A3_349
  L11_357 = ...
  L5_351(L6_352, L7_353, L8_354, L9_355, L10_356, L11_357)
end
L0_0.setItemText = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_358, A1_359)
  return A0_358:getControlProperty(A1_359, "Text2")
end
L0_0.getFixedText = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_360, A1_361, A2_362, ...)
  if type(A2_362) == "number" then
    A0_360:_setTextProperty(nil, A1_361, "TextUI", A2_362, ...)
  else
    A0_360:setText(A1_361, A2_362, ...)
  end
end
L0_0.setMacroText = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_364, A1_365, A2_366, ...)
  local L4_368, L5_369, L6_370, L7_371, L8_372, L9_373, L10_374
  L5_369 = A0_364
  L4_368 = A0_364.setItemTextByOwner
  L6_370 = nil
  L7_371 = A1_365
  L8_372 = worldMaster
  L9_373 = A2_366
  L10_374 = ...
  L4_368(L5_369, L6_370, L7_371, L8_372, L9_373, L10_374)
end
L0_0.setTextWorldMaster = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_375, A1_376, A2_377, A3_378, ...)
  local L5_380, L6_381, L7_382, L8_383, L9_384, L10_385, L11_386
  L6_381 = A0_375
  L5_380 = A0_375.setItemTextByOwner
  L7_382 = nil
  L8_383 = A1_376
  L9_384 = A2_377
  L10_385 = A3_378
  L11_386 = ...
  L5_380(L6_381, L7_382, L8_383, L9_384, L10_385, L11_386)
end
L0_0.setTextByOwner = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_387, A1_388, A2_389, A3_390, A4_391, ...)
  local L6_393, L7_394, L8_395, L9_396, L10_397, L11_398, L12_399, L13_400
  L7_394 = A0_387
  L6_393 = A0_387._setProperty
  L8_395 = A1_388
  L9_396 = A2_389
  L10_397 = "Text"
  L11_398 = A3_390
  L12_399 = A4_391
  L13_400 = ...
  L6_393(L7_394, L8_395, L9_396, L10_397, L11_398, L12_399, L13_400)
end
L0_0.setItemTextByOwner = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_401, A1_402, A2_403)
  A0_401:setItemIcon(nil, A1_402, A2_403)
end
L0_0.setIcon = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_404, A1_405, A2_406, A3_407)
  A0_404:_setProperty(A1_405, A2_406, "IconDatas", A3_407)
end
L0_0.setItemIcon = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_408, A1_409, A2_410)
  if A2_410 == nil or A2_410 == 0 then
    A0_408:setHidden(A1_409)
  else
    A0_408:setIcon(A1_409, A2_410)
    A0_408:setVisibility(A1_409, true)
  end
end
L0_0.setIconWithVisibility = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_411, A1_412)
  local L2_413
  L2_413 = A0_411.getControlProperty
  L2_413 = L2_413(A0_411, A1_412, "IconDatas")
  return tonumber(L2_413)
end
L0_0.getIcon = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_414, A1_415)
  if A0_414:getVisibility(A1_415) == false then
    return 0
  end
  return A0_414:getIcon(A1_415)
end
L0_0.getIconWithVisibility = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_416, A1_417, A2_418)
  A0_416:setControlProperty(A1_417, "IsChecked", A2_418)
end
L0_0.setChecked = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_419, A1_420)
  return A0_419:getControlProperty(A1_420, "IsChecked")
end
L0_0.getChecked = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_421, A1_422, A2_423)
  A0_421:setControlProperty(A1_422, "Value", A2_423)
end
L0_0.setValue = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_424, A1_425)
  return A0_424:getControlProperty(A1_425, "Value")
end
L0_0.getValue = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_426, A1_427, A2_428)
  A0_426:setControlProperty(A1_427, "Maximum", A2_428)
end
L0_0.setMaximum = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_429, A1_430)
  return A0_429:getControlProperty(A1_430, "Maximum")
end
L0_0.getMaximum = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_431, A1_432, A2_433)
  A0_431:setControlProperty(A1_432, "VisualOpacity", A2_433)
end
L0_0.setVisualOpacity = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_434, A1_435)
  return A0_434:getControlProperty(A1_435, "VisualOpacity")
end
L0_0.getVisualOpacity = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_436, A1_437, A2_438, A3_439, A4_440)
  if A2_438 ~= nil then
    A0_436:setControlProperty(A1_437, "VisualOpacityRed", A2_438)
  end
  if A3_439 ~= nil then
    A0_436:setControlProperty(A1_437, "VisualOpacityGreen", A3_439)
  end
  if A4_440 ~= nil then
    A0_436:setControlProperty(A1_437, "VisualOpacityBlue", A4_440)
  end
end
L0_0.setColor = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_441, A1_442)
  local L2_443, L3_444, L4_445
  L3_444 = A0_441
  L2_443 = A0_441.getControlProperty
  L4_445 = A1_442
  L2_443 = L2_443(L3_444, L4_445, "VisualOpacityRed")
  L4_445 = A0_441
  L3_444 = A0_441.getControlProperty
  L3_444 = L3_444(L4_445, A1_442, "VisualOpacityGreen")
  L4_445 = A0_441.getControlProperty
  L4_445 = L4_445(A0_441, A1_442, "VisualOpacityBlue")
  return L2_443, L3_444, L4_445
end
L0_0.getColor = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_446, A1_447, A2_448)
  if A2_448 == nil then
    A2_448 = -1
  end
  A0_446:setControlProperty(A1_447, "SelectedIndex", A2_448)
end
L0_0.setSelectedIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_449, A1_450)
  return A0_449:getControlProperty(A1_450, "SelectedIndex")
end
L0_0.getSelectedIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_451, A1_452, A2_453)
  A0_451:setControlProperty(A1_452, "SqwtFocusedIndex", A2_453)
end
L0_0.setFocusedIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_454, A1_455)
  return A0_454:getControlProperty(A1_455, "SqwtFocusedIndex")
end
L0_0.getFocusedIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_456, A1_457)
  return A0_456:getControlProperty(A1_457, "AnchoredIndex")
end
L0_0.getAnchoredIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_458, A1_459)
  return A0_458:getControlProperty(A1_459, "MouseEnteredIndex")
end
L0_0.getMouseEnteredIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_460, A1_461, A2_462)
  A0_460:setControlProperty(A1_461, "IsDropDownOpen", A2_462)
end
L0_0.setDropDown = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_463, A1_464)
  return A0_463:getControlProperty(A1_464, "IsDropDownOpen")
end
L0_0.getDropDown = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_465, A1_466)
  return A0_465:getControlProperty(A1_466, "ItemCount")
end
L0_0.getItemCount = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_467, A1_468, A2_469, A3_470)
  local L4_471
  L4_471 = A0_467.packCommandParameter
  L4_471 = L4_471(A0_467, A2_469, A3_470)
  A0_467:setControlProperty(A1_468, "CommandParameter", L4_471)
end
L0_0.setCommandParameter = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_472, A1_473, A2_474, A3_475, A4_476)
  A0_472:setUserWork("IntData.Value", A1_473, A2_474, A3_475, A4_476)
end
L0_0.setUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_477, A1_478, A2_479, A3_480)
  return A0_477:getUserWork("IntData.Value", A1_478, A2_479, A3_480)
end
L0_0.getUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_481, A1_482, A2_483, A3_484)
  return A0_481:getUserWork("FloatData.Value", A1_482, A2_483, A3_484)
end
L0_0.getUserWorkFloat = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_485, A1_486, A2_487, A3_488, A4_489)
  A0_485:setUserWork("FloatData.Value", A1_486, A2_487, A3_488, A4_489)
end
L0_0.setUserWorkFloat = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_490, A1_491, A2_492)
  A0_490:setUserWorkInt(A1_491, nil, A0_490.widgetWork.common.widgetName, A2_492)
end
L0_0.setWindowUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_493, A1_494)
  return A0_493:getUserWorkInt(A1_494, nil, A0_493.widgetWork.common.widgetName)
end
L0_0.getWindowUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_495, A1_496, A2_497)
  A0_495:setUserWorkFloat(A1_496, nil, A0_495.widgetWork.common.widgetName, A2_497)
end
L0_0.setWindowUserWorkFloat = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_498, A1_499)
  return A0_498:getUserWorkFloat(A1_499, nil, A0_498.widgetWork.common.widgetName)
end
L0_0.getWindowUserWorkFloat = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_500, A1_501, A2_502, A3_503)
  A0_500:setUserWorkInt(A1_501, nil, A2_502, A3_503)
end
L0_0.setControlUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_504, A1_505, A2_506)
  return A0_504:getUserWorkInt(A1_505, nil, A2_506)
end
L0_0.getControlUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_507, A1_508, A2_509, A3_510)
  A0_507:setUserWorkInt(A1_508, A2_509, A2_509, A3_510)
end
L0_0.setTemplateUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_511, A1_512, A2_513)
  return A0_511:getUserWorkInt(A1_512, A2_513, A2_513)
end
L0_0.getTemplateUserWorkInt = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_514, A1_515, A2_516, A3_517, A4_518)
  A0_514:setUserWork("StringData.Value", A1_515, A2_516, A3_517, A4_518)
end
L0_0.setUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_519, A1_520, A2_521, A3_522)
  return A0_519:getUserWork("StringData.Value", A1_520, A2_521, A3_522)
end
L0_0.getUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_523, A1_524, A2_525)
  A0_523:setUserWorkString(A1_524, nil, A0_523.widgetWork.common.widgetName, A2_525)
end
L0_0.setWindowUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_526, A1_527)
  return A0_526:getUserWorkString(A1_527, nil, A0_526.widgetWork.common.widgetName)
end
L0_0.getWindowUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_528, A1_529, A2_530, A3_531)
  A0_528:setUserWorkString(A1_529, nil, A2_530, A3_531)
end
L0_0.setControlUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_532, A1_533, A2_534)
  return A0_532:getUserWorkString(A1_533, nil, A2_534)
end
L0_0.getControlUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_535, A1_536, A2_537, A3_538)
  A0_535:setUserWorkString(A1_536, A2_537, A2_537, A3_538)
end
L0_0.setTemplateUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_539, A1_540, A2_541)
  return A0_539:getUserWorkString(A1_540, A2_541, A2_541)
end
L0_0.getTemplateUserWorkString = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_542, A1_543, A2_544)
  A0_542:setProperty("Left", A1_543)
  A0_542:setProperty("Top", A2_544)
end
L0_0.setWindowPosition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_545)
  local L1_546, L2_547
  L2_547 = A0_545
  L1_546 = A0_545.getProperty
  L1_546 = L1_546(L2_547, "Left")
  L2_547 = A0_545.getProperty
  L2_547 = L2_547(A0_545, "Top")
  return L1_546, L2_547
end
L0_0.getWindowPosition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_548)
  local L1_549, L2_550
  L2_550 = A0_548
  L1_549 = A0_548.getProperty
  L1_549 = L1_549(L2_550, "ActualWidth")
  L2_550 = A0_548.getProperty
  L2_550 = L2_550(A0_548, "ActualHeight")
  return L1_549, L2_550
end
L0_0.getWindowSize = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_551, A1_552, ...)
  local L3_554, L4_555, L5_556, L6_557, L7_558, L8_559
  L3_554 = ""
  L4_555 = select
  L8_559 = ...
  L4_555 = L4_555(L5_556, L6_557, L7_558, L8_559, ...)
  for L8_559 = 1, L4_555 do
    if L3_554 ~= "" then
      L3_554 = L3_554 .. " "
    end
    L3_554 = L3_554 .. select(L8_559, ...)
  end
  L8_559 = "InputMethod.AcceptChars"
  L5_556(L6_557, L7_558, L8_559, L3_554)
end
L0_0.setAcceptChars = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_560, A1_561, A2_562)
  A0_560:setControlProperty(A1_561, "SqwtStyle", A2_562)
end
L0_0.setStyle = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_563, A1_564)
  A0_563:setProperty("SqwtDrawOrder", A1_564)
end
L0_0.setDrawPriority = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_565, A1_566, A2_567)
  A0_565:setControlProperty(A1_566, "Categories", A2_567)
end
L0_0.setLogCategories = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_568, A1_569, A2_570)
  A0_568:setControlProperty(A1_569, "SelectionLength", A2_570)
end
L0_0.setSelectionLength = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_571, A1_572)
  local L2_573, L3_574
  L3_574 = A0_571
  L2_573 = A0_571.getControlProperty
  L2_573 = L2_573(L3_574, A1_572, "PlayerPosX")
  L3_574 = A0_571.getControlProperty
  L3_574 = L3_574(A0_571, A1_572, "PlayerPosY")
  return L2_573, L3_574
end
L0_0.getPlayerMapPosition = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_575, A1_576, A2_577)
  local L3_578
  L3_578 = 0
  if A2_577 == true then
    L3_578 = 1
    A0_575:setControlProperty(A1_576, "InputMethod.SqwtInputAllowedChars", "")
  end
  A0_575:setControlProperty(A1_576, "InputMethod.SqwtInputMethodStatus", L3_578)
end
L0_0.setIMEInput = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_579, A1_580, A2_581, A3_582, A4_583, A5_584, A6_585, A7_586)
  A0_579:_setProperty(A1_580, A2_581, "Help.Type", A3_582)
  if A4_583 == nil then
    A4_583 = 0
  end
  if A5_584 == nil then
    A5_584 = 0
  end
  if A6_585 == nil then
    A6_585 = 0
  end
  if A7_586 == nil then
    A7_586 = 0
  end
  A0_579:_setProperty(A1_580, A2_581, "Help.Value0", A4_583)
  A0_579:_setProperty(A1_580, A2_581, "Help.Value1", A5_584)
  A0_579:_setProperty(A1_580, A2_581, "Help.Value2", A6_585)
  A0_579:_setProperty(A1_580, A2_581, "Help.Value3", A7_586)
end
L0_0.setItemHelpParameter = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_587, A1_588, A2_589, A3_590, A4_591, A5_592, A6_593)
  A0_587:setItemHelpParameter(nil, A1_588, A2_589, A3_590, A4_591, A5_592, A6_593)
end
L0_0.setHelpParameter = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_594, A1_595, A2_596, A3_597)
  A0_594:setControlProperty(A2_596, "Help.Location", A3_597)
end
L0_0.setItemHelpLocation = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_598, A1_599, A2_600)
  A0_598:setItemHelpLocation(nil, A1_599, A2_600)
end
L0_0.setHelpLocation = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_601, A1_602)
  A0_601:sendControlCommand(A1_602, "App.UpdateHelp")
end
L0_0.updateHelp = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_603, A1_604)
  A0_603:setProperty("Focusable", A1_604)
end
L0_0.setFocusable = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_605)
  return A0_605:getProperty("Focusable")
end
L0_0.getFocusable = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_606, A1_607)
  return A0_606:_isKeyboardFocused(nil, A1_607)
end
L0_0.checkKeyboardFocusedControl = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_608)
  return A0_608:_getKeyboardFocusedControl()
end
L0_0.getKeyboardFocusedControl = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_609, A1_610)
  return A0_609:_setKeyboardFocusedControl(nil, A1_610)
end
L0_0.setKeyboardFocusedControl = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_611, A1_612)
  A0_611:setProperty("LogicalFocus", A1_612)
end
L0_0.setLogicalFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_613)
  A0_613:sendCommand("ApplicationCommands.FocusOrderToBottom")
end
L0_0.cancelFocus = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_614, A1_615)
  A0_614:sendControlCommand(A1_615, "App.FocusElement")
end
L0_0.setFocusScope = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_616, A1_617, A2_618)
  A0_616:setControlProperty(A1_617, "FontSize", A2_618)
end
L0_0.setFontSize = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_619, A1_620, A2_621)
  A0_619:_addItem(nil, A1_620, "ControlTemplate_ListBoxItem", A2_621)
  A0_619:_setProperty(A2_621, A2_621, "Focusable", false)
end
L0_0.addItem = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_622, A1_623, A2_624, A3_625)
  local L4_626, L5_627, L6_628, L7_629, L8_630
  for L7_629 = 1, A3_625 do
    L8_630 = A2_624
    L8_630 = L8_630 .. tostring(L7_629)
    A0_622:addItem(A1_623, L8_630)
  end
end
L0_0.addListBoxItem = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_631, A1_632, A2_633, A3_634, ...)
  local L5_636, L6_637, L7_638, L8_639, L9_640, L10_641, L11_642
  L5_636 = select
  L11_642 = ...
  L5_636 = L5_636(L6_637, L7_638, L8_639, L9_640, L10_641, L11_642, ...)
  if A1_632 ~= nil then
    L9_640 = A2_633
    L10_641 = L5_636
    L6_637(L7_638, L8_639, L9_640, L10_641)
  end
  for L9_640 = 1, L5_636 do
    L10_641 = A2_633
    L11_642 = tostring
    L11_642 = L11_642(L9_640)
    L10_641 = L10_641 .. L11_642
    L11_642 = select
    L11_642 = L11_642(L9_640, ...)
    A0_631:setTextProperty(L10_641, A3_634, "Content", L11_642)
  end
end
L0_0.setListBoxItem = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_643, A1_644, A2_645, A3_646, A4_647)
  A0_643:_setListProperty(A1_644, A2_645, A3_646, A4_647)
end
L0_0.setListProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_648, A1_649, A2_650, A3_651)
  return A0_648:_getListProperty(A1_649, A2_650, A3_651)
end
L0_0.getListProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_652, A1_653, A2_654)
  A0_652:_addList(A1_653, A2_654)
end
L0_0.insertListProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_655, A1_656, A2_657)
  A0_655:_removeList(A1_656, A2_657)
end
L0_0.deleteListProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_658, A1_659)
  A0_658:_clearAllList(A1_659)
end
L0_0.deleteListPropertyAll = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_660, A1_661)
  A0_660:_updateList(A1_661)
end
L0_0.updateListProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_662, A1_663, A2_664, A3_665, A4_666, ...)
  local L6_668, L7_669, L8_670, L9_671, L10_672, L11_673, L12_674
  L7_669 = A0_662
  L6_668 = A0_662._setListTextProperty
  L8_670 = A1_663
  L9_671 = A2_664
  L10_672 = A3_665
  L11_673 = A4_666
  L12_674 = ...
  L6_668(L7_669, L8_670, L9_671, L10_672, L11_673, L12_674)
end
L0_0.setListText = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_675, A1_676, A2_677)
  A0_675:_setProperty(nil, A1_676, "SortedIndex", A2_677)
  return A0_675:_getProperty(nil, A1_676, "Index")
end
L0_0.getListPropertyIndex = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_678, A1_679)
  return A0_678:_getProperty(nil, A1_679, "Count")
end
L0_0.getListPropertyCount = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_680, A1_681)
  return A0_680:_getProperty(nil, A1_681, "FilteredCount")
end
L0_0.getListFilteredCount = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_682, A1_683, A2_684)
  A0_682:_setProperty(nil, A1_683, "FilteredSortKey", A2_684)
end
L0_0.setListFilteredSortKey = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_685, A1_686, A2_687, A3_688)
  A0_685:setListProperty(A1_686, A2_687, "template", A3_688)
end
L0_0.setListPropertyTemplate = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_689, A1_690, A2_691, A3_692)
  A0_689:setListProperty(A1_690, A2_691, "visibility", A3_692)
end
L0_0.setListPropertyVisibility = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_693, A1_694, A2_695, A3_696, A4_697, ...)
  if A4_697 ~= nil then
    if type(A4_697) == "number" then
      A0_693:_setTextProperty(A1_694, A2_695, A3_696, A4_697, ...)
    else
      A0_693:_setProperty(A1_694, A2_695, A3_696, A4_697)
    end
  else
    A0_693:_setProperty(A1_694, A2_695, A3_696, "")
  end
end
L0_0.setTextProperty = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_699, A1_700, A2_701, A3_702, A4_703, A5_704)
  local L6_705
  L6_705 = A1_700
  L6_705 = L6_705 .. tostring(A2_701 - 1)
  A0_699:_setProperty(A3_702, A4_703, L6_705, A5_704)
end
L0_0.setUserWork = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_706, A1_707, A2_708, A3_709, A4_710)
  local L5_711
  L5_711 = A1_707
  L5_711 = L5_711 .. tostring(A2_708 - 1)
  return A0_706:_getProperty(A3_709, A4_710, L5_711)
end
L0_0.getUserWork = L1_1
L0_0 = WidgetBaseClass
function L1_1(A0_712, A1_713)
  local L2_714
  if A1_713 == "True" then
    L2_714 = true
    return L2_714
  end
  L2_714 = false
  return L2_714
end
L0_0.getBoolean = L1_1
