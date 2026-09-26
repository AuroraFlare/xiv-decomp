require("/Widget/Ask/AskBaseClass")
_defineClass("FellingInputWidget", "AskBaseClass")
function FellingInputWidget.initAsk(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8
  L7_7 = "focus"
  L8_8 = "integer8"
  L7_7 = {L8_8, "integer8"}
  L8_8 = "hp"
  L8_8 = {"commands", "integer8"}
  L4_4._temp = L5_5
  L4_4(L5_5, L6_6)
  L7_7 = "UILuaCommands.Cancel"
  L4_4(L5_5, L6_6, L7_7)
  L7_7 = "UILuaCommands.Cancel"
  L4_4(L5_5, L6_6, L7_7)
  L7_7 = "UILuaCommands.Operate"
  L4_4(L5_5, L6_6, L7_7)
  L7_7 = "TemplateButton_Command"
  L8_8 = "UILuaCommands.Operate"
  L4_4(L5_5, L6_6, L7_7, L8_8)
  for L7_7 = 1, 5 do
    L8_8 = "ListBoxItem_Command_"
    L8_8 = L8_8 .. L7_7
    A0_0:_addItem(nil, "ListBox_CommandList", "ControlTemplate_Item", L8_8)
    A0_0:setControlProperty(L8_8, "IsTabStop", false)
    A0_0:setControlProperty(L8_8 .. ":TemplateButton_Command", "CommandParameter", L7_7)
  end
  L7_7 = "Selector.MouseEnteredItem"
  L4_4(L5_5, L6_6, L7_7)
  L7_7 = "Selector.AnchoredItem"
  L4_4(L5_5, L6_6, L7_7)
  L4_4.hp = 100
  if A1_1 ~= nil then
    L7_7 = 3051
    L8_8 = A1_1
    L4_4(L5_5, L6_6, L7_7, L8_8)
  end
  L7_7 = "Minimum"
  L8_8 = 0
  L4_4(L5_5, L6_6, L7_7, L8_8)
  L7_7 = "Maximum"
  L8_8 = A0_0.work
  L8_8 = L8_8.hp
  L4_4(L5_5, L6_6, L7_7, L8_8)
  L7_7 = "Value"
  L8_8 = A0_0.work
  L8_8 = L8_8.hp
  L4_4(L5_5, L6_6, L7_7, L8_8)
  L4_4.currentAngle = 0
  L4_4.previousAngle = 0
  L4_4.phase = 0
  L4_4.focus = 0
  L7_7 = "Value"
  L8_8 = 50
  L4_4(L5_5, L6_6, L7_7, L8_8)
  L7_7 = "UILuaCommands.SliderFocused"
  L4_4(L5_5, L6_6, L7_7)
  L7_7 = "ApplicationCommands.Operate"
  L4_4(L5_5, L6_6, L7_7)
  L4_4(L5_5, L6_6)
end
function FellingInputWidget.setWindowFocus(A0_9, A1_10)
  if A1_10 ~= nil and A1_10 ~= "" then
    A0_9:setLogicalFocus(A1_10)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_9 then
      A0_9:setKeyboardFocusedControl(A1_10)
    end
  end
end
function FellingInputWidget.setControlFocusable(A0_11, A1_12, A2_13)
  A0_11:setControlProperty(A1_12, "Focusable", A2_13)
end
function FellingInputWidget.processUICommandEvent(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19)
  if A0_14:isAskFinish() == true then
    return
  end
  if A3_17 == "UILuaCommands.Cancel" then
    if A0_14.work.phase == 1 then
      if A0_14:getKeyboardFocusedControl() ~= "Slider_PhaseA" then
        A0_14:setWindowFocus("Slider_PhaseA")
        A0_14:displayHelp()
      else
        A0_14:focusFirstCommand(true)
      end
    end
    return
  end
  if A3_17 == "ApplicationCommands.Operate" then
    if A0_14.work.phase == 1 and A0_14:getKeyboardFocusedControl() == "Slider_PhaseA" then
      A0_14:focusFirstCommand()
    end
    return
  end
  if A3_17 == "UILuaCommands.Operate" then
    if A2_16 == "TemplateButton_Power" then
      if A0_14.work.focus == 2 then
        if A0_14:stopAngleGauge() == true then
          A0_14:setBaseAskResult(1)
          A0_14:setAngleGaugeFocusable(false)
        end
        A0_14.work.focus = 0
      end
    elseif A4_18 ~= nil then
      if A0_14.work.focus == 2 then
        return
      end
      A0_14.work.chosenItem = A4_18
      A0_14.work.chosenCommand = A0_14:getCommandId(A0_14.work.chosenItem)
      A0_14:collapseCommandList(A0_14.work.chosenItem)
      A0_14:displayHelp(A0_14.work.chosenCommand)
      if A0_14.work.phase == 1 then
        A0_14:setControlFocusable("Slider_PhaseA", false)
        A0_14:setEnable("Slider_PhaseA", false)
        A0_14:setBaseAskResult(1)
      elseif A0_14:isUseGauge(A0_14.work.chosenCommand) == true then
        A0_14.work.focus = 2
        A0_14:startAngleGauge()
      else
        A0_14:setBaseAskResult(1)
      end
    end
    return
  end
  if A3_17 == "Selector.MouseEnteredItem" or A3_17 == "Selector.AnchoredItem" then
    if A0_14.work.focus ~= 1 or A4_18 < 0 then
      return false
    end
    A0_14.work.focusedCommand = A0_14:getCommandId(A4_18 + 1)
    if A0_14.work.focusedCommand ~= nil then
      A0_14:displayHelp(A0_14.work.focusedCommand)
    end
    return
  end
  if A3_17 == "UILuaCommands.SliderFocused" then
    A0_14:displayHelp()
  end
end
function FellingInputWidget.displayHelp(A0_20, A1_21)
  if A1_21 == nil then
    A0_20:setText("TextBlock_CommandHelp", 3069)
  else
    A0_20:setText("TextBlock_CommandHelp", 1105, A1_21)
  end
end
function FellingInputWidget.setCommandList(A0_22, A1_23, A2_24)
  local L3_25, L4_26
  L3_25 = "ListBoxItem_Command_"
  L4_26 = tostring
  L4_26 = L4_26(A1_23)
  L3_25 = L3_25 .. L4_26
  L4_26 = L3_25
  L4_26 = L4_26 .. ":TemplateButton_Command"
  if A2_24 ~= nil then
    A0_22.work.commands = A0_22.work.commands + 1
    A0_22:setContent(L4_26, 3043, A2_24)
    A0_22:setControlProperty(L4_26, "SqwtStyle", "BTN_basis_listboxSelect")
    A0_22:setControlProperty(L3_25, "IntData.Value0", A2_24)
    A0_22:setVisibility(L3_25, true)
  else
    A0_22:setContent(L4_26, "")
    A0_22:setControlProperty(L3_25, "IntData.Value0", 0)
    A0_22:setVisibility(L3_25, false)
  end
end
function FellingInputWidget.getCommandId(A0_27, A1_28)
  return A0_27:getControlProperty("ListBoxItem_Command_" .. tostring(A1_28), "IntData.Value0")
end
function FellingInputWidget.collapseCommandList(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35, L7_36
  for L5_34 = 1, 5 do
    L6_35 = "ListBoxItem_Command_"
    L7_36 = tostring
    L7_36 = L7_36(L5_34)
    L6_35 = L6_35 .. L7_36
    L7_36 = L6_35
    L7_36 = L7_36 .. ":TemplateButton_Command"
    if L5_34 == A1_30 then
      A0_29:setControlProperty(L7_36, "SqwtStyle", "BTN_basis_listboxSelect_cmdRunning")
    end
  end
  L5_34 = false
  L2_31(L3_32, L4_33, L5_34)
end
function FellingInputWidget.focusFirstCommand(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42, L6_43, L7_44
  L2_39 = 0
  for L6_43 = 1, 5 do
    L7_44 = A0_37.getCommandId
    L7_44 = L7_44(A0_37, L6_43)
    if L7_44 ~= 0 then
      if A1_38 == nil then
        A0_37:setWindowFocus("ListBoxItem_Command_" .. tostring(L6_43))
        A0_37.work.focusedCommand = L7_44
        A0_37:displayHelp(L7_44)
        return L6_43
      else
        L2_39 = L6_43
      end
    end
  end
  if L2_39 ~= 0 then
    if A1_38 ~= nil then
      L6_43 = "ListBoxItem_Command_"
      L7_44 = tostring
      L7_44 = L7_44(L2_39)
      L6_43 = L6_43 .. L7_44
      L4_41(L5_42, L6_43)
      L4_41.focusedCommand = L3_40
      L6_43 = L3_40
      L4_41(L5_42, L6_43)
      return L2_39
    end
  end
  return L3_40
end
function FellingInputWidget.isUseGauge(A0_45, A1_46)
  local L2_47
  if A1_46 == 22705 then
    L2_47 = true
    return L2_47
  else
    L2_47 = false
    return L2_47
  end
end
function FellingInputWidget.setAngleGaugeFocusable(A0_48, A1_49)
  if A1_49 == true then
    A0_48:setControlFocusable("Label_Power", true)
    A0_48:setControlProperty("Label_Power", "IsHitTestVisible", true)
    A0_48:setEnable("Label_Power:TemplateButton_Power", true)
  else
    A0_48:setControlFocusable("Label_Power", false)
    A0_48:setControlProperty("Label_Power", "IsHitTestVisible", false)
    A0_48:setEnable("Label_Power:TemplateButton_Power", false)
  end
end
function FellingInputWidget.startAngleGauge(A0_50)
  A0_50.work.currentAngle = 0
  A0_50:setAngleGaugeFocusable(true)
  A0_50:setWindowFocus("Label_Power:TemplateButton_Power")
  A0_50:sendControlCommand("Label_Power", "Start_PowerGauge")
end
function FellingInputWidget.stopAngleGauge(A0_51)
  A0_51:sendControlCommand("Label_Power", "Stop_PowerGauge")
  if tonumber(A0_51:getControlProperty("Label_Power:TemplateLabel_Power", "RenderTransform.AngleZ")) > 0 then
    A0_51.work.currentAngle = _math.floor(tonumber(A0_51:getControlProperty("Label_Power:TemplateLabel_Power", "RenderTransform.AngleZ")) + 0.5)
  elseif tonumber(A0_51:getControlProperty("Label_Power:TemplateLabel_Power", "RenderTransform.AngleZ")) < 0 then
    A0_51.work.currentAngle = _math.floor(tonumber(A0_51:getControlProperty("Label_Power:TemplateLabel_Power", "RenderTransform.AngleZ")) - 0.5)
  end
  if A0_51.work.currentAngle >= A0_51.work.goodmin and A0_51.work.currentAngle <= A0_51.work.goodmax then
    A0_51:sendControlCommand("Label_Power", "Se_Good")
  else
    A0_51:sendControlCommand("Label_Power", "Se_Normal")
  end
  return true
end
function FellingInputWidget.setAskParameter(A0_52, A1_53, A2_54, A3_55, A4_56, A5_57, A6_58, A7_59, A8_60)
  A0_52.work.commands = 0
  A0_52:setCommandList(1, A1_53)
  A0_52:setCommandList(2, A2_54)
  A0_52:setCommandList(3, A3_55)
  A0_52:setCommandList(4, A4_56)
  A0_52:setCommandList(5, A5_57)
  A0_52:setEnable("ListBox_CommandList", true)
  A0_52.work.currentAngle = 0
  if A0_52.work.commands == 0 then
    return false
  end
  A0_52.work.focus = 1
  A0_52:setAngleGaugeFocusable(false)
  if A6_58 == 1 then
    A0_52:setText("TextBlock_PhaseTitle", 3059)
    A0_52:setHelpParameter("TextBlock_PhaseTitle", 1, 76615)
    if A0_52.work.phase == 2 then
      A0_52:displayEffect()
      A0_52:sendControlCommand("Label_PhaseB", "SQWTDesignCommands.PhaseBtoA")
    end
    A0_52.work.phase = 1
    A0_52:setVisibility("Label_PhaseA", true)
    A0_52:setControlFocusable("Slider_PhaseA", true)
    A0_52:setEnable("Slider_PhaseA", true)
    A0_52:setWindowFocus("Slider_PhaseA")
    if A8_60 ~= nil then
      if A8_60 == true then
        A0_52:sendControlCommand("Label_RareCatalystEffect", "UILuaCommands.RareEffectStart")
      else
        A0_52:sendControlCommand("Label_RareCatalystEffect", "UILuaCommands.RareEffectStop")
      end
    end
    A0_52:displayHelp()
  elseif A6_58 == 2 then
    A0_52:setText("TextBlock_PhaseTitle", 3060)
    A0_52:setHelpParameter("TextBlock_PhaseTitle", 1, 76616)
    if A0_52.work.phase == 1 then
      A0_52:sendControlCommand("Label_PhaseA", "SQWTDesignCommands.PhaseAtoB")
    end
    if A0_52.work.phase == 2 then
      A0_52:displayEffect()
    end
    A0_52.work.phase = 2
    A0_52:focusFirstCommand()
    if A8_60 ~= nil then
      if A8_60 == true then
        A0_52:sendControlCommand("Label_RareCatalystGaugeEffect", "UILuaCommands.RareGaugeEffectStart")
      else
        A0_52:sendControlCommand("Label_RareCatalystGaugeEffect", "UILuaCommands.RareGaugeEffectStop")
      end
    end
  end
  return true
end
function FellingInputWidget.getAskResult(A0_61)
  local L1_62
  L1_62 = A0_61.work
  L1_62 = L1_62.phase
  if L1_62 == 1 then
    L1_62 = A0_61.work
    L1_62 = L1_62.chosenCommand
    return L1_62, A0_61:getControlProperty("Slider_PhaseA", "Value")
  else
    L1_62 = A0_61.work
    L1_62 = L1_62.chosenCommand
    return L1_62, A0_61.work.currentAngle
  end
end
function FellingInputWidget.updateHP(A0_63, A1_64)
  if A1_64 > 100 or A1_64 < 0 then
    return false
  end
  A0_63.work.hp = A1_64
  A0_63:setControlProperty("ProgressBar_HP:TemplateProgressBar_HP", "Value", A1_64)
  return true
end
function FellingInputWidget.displayEffect(A0_65)
  if A0_65:isUseGauge(A0_65.work.chosenCommand) == true then
    A0_65:sendControlCommand("Label_Power", "Start_Effect")
    A0_65.work.previousAngle = A0_65.work.currentAngle
    return true
  else
    return false
  end
end
function FellingInputWidget.updateAskParameter(A0_66, A1_67, A2_68)
  A0_66:updateHP(A1_67)
  if A2_68 == true then
    A0_66:displayEffect()
  end
end
function FellingInputWidget.orderHarvestOwnerMessageDisplay(A0_69, A1_70, A2_71, A3_72, A4_73, A5_74, A6_75)
  if A2_71 == nil or A1_70 == nil then
    A0_69:setText("TextBlock_Message", " ")
    A0_69:setHidden("Grid_HarvestMessage")
  else
    A0_69:setTextByOwner("TextBlock_Message", A1_70, A2_71, A3_72, A4_73, A5_74, A6_75)
    A0_69:setVisibility("Grid_HarvestMessage", true)
  end
end
function FellingInputWidget.orderSweetspotDisplay(A0_76, A1_77, A2_78, A3_79, A4_80)
  local L6_81
  L6_81 = ""
  if A1_77 == 1 then
    L6_81 = "Slider_PhaseA"
  elseif A1_77 == 2 then
    L6_81 = "Label_Power"
  end
  if L6_81 == "" then
    return false
  end
  if A2_78 ~= nil and A1_77 == 2 then
    A0_76.work.goodmin = A2_78
  end
  if A3_79 ~= nil and A1_77 == 2 then
    A0_76.work.goodmax = A3_79
  end
  if A4_80 == nil or A4_80 == false then
  else
  end
  return true
end
