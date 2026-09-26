require("/Widget/WidgetBaseClass")
_defineClass("CraftProgressWidget", "WidgetBaseClass")
function CraftProgressWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
  A0_0.work._temp = {
    {
      "progressPercentage",
      "integer8"
    },
    {
      "maxProgress",
      "integer8"
    },
    {"craftPoint", "integer16"},
    {
      "maxCraftPoint",
      "integer16"
    },
    {
      "qualityPoint",
      "integer16"
    },
    {
      "maxQualityPoint",
      "integer16"
    },
    {
      "initialized",
      "boolean"
    },
    {
      "isTuningPhase",
      "boolean"
    },
    {
      "focusEnable",
      "boolean"
    },
    {"itemID", "integer32"},
    {
      "itemQuality",
      "integer32"
    },
    {"param1", "integer32"},
    {"param2", "integer32"},
    {"param3", "integer32"},
    {"oldparam1", "integer32"},
    {"oldparam2", "integer32"},
    {"oldparam3", "integer32"},
    {
      "previousCommand",
      "integer32"
    },
    {
      "chosenCommand",
      "integer32"
    },
    {
      "focusedCommand",
      "integer32"
    },
    {"localBuf", "boolean"},
    {
      "firstChoise",
      "integer8"
    }
  }
  A0_0:setModal(true)
  A0_0:setDrag(true)
  A0_0:initCommandList()
  A0_0.work.itemQuality = 1
  A0_0:setInitialData(A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
end
function CraftProgressWidget.setInitialData(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12, A6_13)
  A0_7.work.progressPercentage = A1_8
  A0_7.work.maxProgress = 100
  A0_7.work.craftPoint = A3_10
  if A4_11 == 0 or A4_11 == nil then
    A4_11 = 999
  end
  A0_7.work.maxCraftPoint = A4_11
  A0_7.work.qualityPoint = A5_12
  if A6_13 == 0 or A6_13 == nil then
    A6_13 = 999
  end
  A0_7.work.maxQualityPoint = A6_13
  A0_7.work.initialized = true
  A0_7:setVisibility("Grid_Top_2", false)
  return A0_7:updateProcess(A1_8, A3_10, A5_12, nil, nil, nil, A2_9, nil)
end
function CraftProgressWidget.initCommandList(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19
  L4_18 = "Button_Command"
  L1_15(L2_16, L3_17, L4_18)
  for L4_18 = 1, 10 do
    L5_19 = A0_14.getButtonName
    L5_19 = L5_19(A0_14, L4_18)
    A0_14:_addItem(nil, "ListBox_Commands", "Template_ListBoxItem", L5_19)
    A0_14:setVisibility(L5_19, false)
    A0_14:setControlProperty(L5_19, "IsTabStop", false)
    A0_14:setControlProperty(L5_19 .. ":Button_Command", "CommandParameter", L4_18)
  end
  L1_15.isTuningPhase = false
  L4_18 = "Selector.MouseEnteredItem"
  L1_15(L2_16, L3_17, L4_18)
  L4_18 = "Selector.AnchoredItem"
  L1_15(L2_16, L3_17, L4_18)
end
function CraftProgressWidget.setCommandList(A0_20, A1_21, A2_22)
  local L3_23
  L3_23 = A0_20.getButtonName
  L3_23 = L3_23(A0_20, A1_21)
  if A2_22 ~= nil then
    A0_20:setVisibility(L3_23, true)
    A0_20:setControlProperty(L3_23, "IntData.Value0", A2_22)
    A0_20:setStyle(L3_23 .. ":Button_Command", "BTN_basis_listboxSelect")
    A0_20:setContent(L3_23 .. ":Button_Command", 3043, A2_22)
    if A0_20.work.firstChoise == 0 then
      A0_20.work.firstChoise = A1_21
    end
  else
    A0_20:setVisibility(L3_23, false)
  end
end
function CraftProgressWidget.getCommandId(A0_24, A1_25)
  return A0_24:getControlProperty(A0_24:getButtonName(A1_25), "IntData.Value0")
end
function CraftProgressWidget.getButtonName(A0_26, A1_27)
  return "ListBox_Command_" .. tostring(A1_27)
end
function CraftProgressWidget.maskCommandList(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33, L6_34
  L2_30.focusEnable = false
  for L5_33 = 1, 10 do
    L6_34 = A0_28.getButtonName
    L6_34 = L6_34(A0_28, L5_33)
    if A1_29 == L5_33 then
      A0_28:setStyle(L6_34 .. ":Button_Command", "BTN_basis_listboxSelect_cmdRunning")
    end
  end
  L5_33 = false
  L2_30(L3_31, L4_32, L5_33)
end
function CraftProgressWidget.proceedTuningPhase(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40, L6_41
  L2_37 = worldMaster
  L3_38 = L2_37
  L2_37 = L2_37._getMyPlayer
  L2_37 = L2_37(L3_38)
  L4_39 = L2_37
  L3_38 = L2_37.createVirtualItem
  L5_40 = A0_35.work
  L5_40 = L5_40.itemID
  L3_38 = L3_38(L4_39, L5_40)
  L5_40 = A0_35
  L4_39 = A0_35.setIcon
  L6_41 = "IconControl_ItemIcon"
  L4_39(L5_40, L6_41, L3_38:getItemIcon())
  L5_40 = A0_35
  L4_39 = A0_35.setVisibility
  L6_41 = "IconControl_ItemIcon"
  L4_39(L5_40, L6_41, true)
  L4_39 = A0_35.work
  L4_39 = L4_39.itemQuality
  if L4_39 ~= 0 then
    L4_39 = A0_35.work
    L4_39 = L4_39.itemQuality
  elseif L4_39 > 4 then
    L4_39 = A0_35.work
    L4_39.itemQuality = 1
  end
  L5_40 = A0_35
  L4_39 = A0_35.setText
  L6_41 = "TextBlock_ItemName"
  L4_39(L5_40, L6_41, 3202, A0_35.work.itemID, A0_35.work.itemQuality)
  L4_39 = false
  L6_41 = L3_38
  L5_40 = L3_38._isStackable
  L5_40 = L5_40(L6_41)
  if L5_40 == true then
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "TextBlock_Number", true)
    L6_41 = A0_35
    L5_40 = A0_35.setText
    L5_40(L6_41, "TextBlock_Number", tostring(A0_35.work.param1))
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "TextBlock_Slash", true)
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "TextBlock_MaxStack", true)
    L6_41 = A0_35
    L5_40 = A0_35.setText
    L5_40(L6_41, "TextBlock_MaxStack", 225, L3_38:_getMaxStack())
  else
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "TextBlock_Number", false)
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "TextBlock_Slash", false)
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "TextBlock_MaxStack", false)
    L6_41 = L3_38
    L5_40 = L3_38.getMateriaBindPermission
    L5_40 = L5_40(L6_41)
    L4_39 = L5_40
  end
  L6_41 = A0_35
  L5_40 = A0_35.setVisibility
  L5_40(L6_41, "IconControl_MateriaBase", L4_39)
  L6_41 = A0_35
  L5_40 = A0_35.setVisibility
  L5_40(L6_41, "IconControl_NotEquiped", desktopWidget:cantEquipPlayer(L3_38))
  if A1_36 == true then
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "Grid_Top_1", false)
    L6_41 = A0_35
    L5_40 = A0_35.setVisibility
    L5_40(L6_41, "Grid_Top_2", true)
    L6_41 = A0_35
    L5_40 = A0_35.setHidden
    L5_40(L6_41, "TextBlock_CraftPoint")
    L6_41 = A0_35
    L5_40 = A0_35.setHidden
    L5_40(L6_41, "TextBlock_CraftPointValue")
    L6_41 = A0_35
    L5_40 = A0_35.setHidden
    L5_40(L6_41, "TextBlock_QualityPoint")
    L6_41 = A0_35
    L5_40 = A0_35.setHidden
    L5_40(L6_41, "TextBlock_QualityPointValue")
    L6_41 = A0_35
    L5_40 = A0_35.getButtonName
    L5_40 = L5_40(L6_41, 2)
    L6_41 = A0_35.getCommandId
    L6_41 = L6_41(A0_35, 2)
    if A0_35:getControlProperty(L5_40, "Visibility") == "Visible" then
      A0_35:setText("TextBlock_HQRate", 3006, A0_35.work.param2, L6_41)
    else
      A0_35:setHidden("TextBlock_HQRate")
    end
  end
  L5_40 = true
  return L5_40
end
function CraftProgressWidget.setWindowFocus(A0_42, A1_43)
  if A1_43 ~= nil and A1_43 ~= "" then
    A0_42:setLogicalFocus(A1_43)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_42 then
      A0_42:setKeyboardFocusedControl(A1_43)
    end
  end
end
function CraftProgressWidget.processUICommandOperate(A0_44, A1_45, A2_46, A3_47, A4_48)
  if A0_44.work.focusEnable == false then
    return
  end
  if A0_44.work.chosenCommand ~= 0 then
    return
  end
  if A2_46 == "Button_Command" then
    A0_44.work.chosenCommand = A0_44:getCommandId(A3_47)
    A0_44:maskCommandList(A3_47)
    A0_44:displayHelp(A0_44.work.chosenCommand)
    if A3_47 >= 6 then
      A0_44.work.localBuf = true
    else
      A0_44.work.localBuf = false
    end
  end
  return true
end
function CraftProgressWidget.processUICommandDefault(A0_49, A1_50, A2_51, A3_52, A4_53, A5_54)
  if A0_49.work.focusEnable == false then
    return
  end
  if A0_49.work.chosenCommand ~= 0 then
    return
  end
  if A3_52 == "Selector.MouseEnteredItem" or A3_52 == "Selector.AnchoredItem" then
    if A4_53 < 0 then
      return false
    end
    A0_49.work.focusedCommand = A0_49:getCommandId(A4_53 + 1)
    if A0_49.work.focusedCommand ~= nil then
      A0_49:displayHelp(A0_49.work.focusedCommand)
    end
  end
end
function CraftProgressWidget.displayHelp(A0_55, A1_56)
  A0_55:setText("TextBlock_CommandHelp", 1105, A1_56)
end
function CraftProgressWidget.setCommand(A0_57, A1_58, A2_59, A3_60, A4_61, A5_62, A6_63, A7_64, A8_65, A9_66, A10_67)
  A0_57.work.firstChoise = 0
  A0_57:setCommandList(1, A1_58)
  A0_57:setCommandList(2, A2_59)
  A0_57:setCommandList(3, A3_60)
  A0_57:setCommandList(4, A4_61)
  A0_57:setCommandList(5, A5_62)
  A0_57:setCommandList(6, A6_63)
  A0_57:setCommandList(7, A7_64)
  A0_57:setCommandList(8, A8_65)
  A0_57:setCommandList(9, A9_66)
  A0_57:setCommandList(10, A10_67)
  A0_57.work.chosenCommand = 0
  if A0_57.work.isTuningPhase == true then
    A0_57:proceedTuningPhase(true)
  end
  A0_57.work.focusEnable = true
  A0_57:setEnable("ListBox_Commands", true)
  A0_57:setSelectedIndex("ListBox_Commands", A0_57.work.firstChoise - 1)
  A0_57:setWindowFocus(A0_57:getButtonName(A0_57.work.firstChoise) .. ":Button_Command")
  A0_57:displayHelp(A0_57:getCommandId(A0_57.work.firstChoise))
  A0_57:setEnable("ListBox_Commands", true)
end
function CraftProgressWidget.updateProcess(A0_68, A1_69, A2_70, A3_71, A4_72, A5_73, A6_74, A7_75, A8_76)
  local L9_77
  L9_77 = A0_68.work
  L9_77 = L9_77.maxProgress
  if A1_69 > L9_77 or A1_69 < 0 then
    L9_77 = false
    return L9_77
  end
  if not (A2_70 < 0) then
    L9_77 = A0_68.work
    L9_77 = L9_77.maxCraftPoint
  elseif A2_70 > L9_77 then
    L9_77 = false
    return L9_77
  end
  L9_77 = A0_68.work
  L9_77 = L9_77.maxQualityPoint
  if A3_71 > L9_77 then
    L9_77 = false
    return L9_77
  end
  L9_77 = A0_68.work
  L9_77.progressPercentage = A1_69
  L9_77 = A0_68.work
  L9_77.craftPoint = A2_70
  L9_77 = A0_68.work
  L9_77.qualityPoint = A3_71
  L9_77 = A0_68.setValue
  L9_77(A0_68, "ProgressBar_Percentage", A1_69)
  L9_77 = A0_68.setText
  L9_77(A0_68, "TextBlock_CraftPointValue", tostring(A2_70))
  L9_77 = A0_68.setText
  L9_77(A0_68, "TextBlock_QualityPointValue", tostring(A3_71))
  L9_77 = 0
  if A7_75 ~= nil then
    L9_77 = A7_75
  end
  A0_68:setText("TextBlock_HQRate", 3006, L9_77, 0)
  if A4_72 ~= nil then
    if A0_68.work.isTuningPhase ~= true then
      A0_68.work.isTuningPhase = true
      A0_68.work.oldparam1 = A6_74
      A0_68.work.oldparam2 = A7_75
      A0_68.work.oldparam3 = A8_76
      A0_68.work.param1 = A6_74
      A0_68.work.param2 = A7_75
      A0_68.work.param3 = A8_76
    else
      A0_68.work.oldparam1 = A0_68.work.param1
      A0_68.work.oldparam2 = A0_68.work.param2
      A0_68.work.oldparam3 = A0_68.work.param3
      A0_68.work.param1 = A6_74
      A0_68.work.param2 = A7_75
      A0_68.work.param3 = A8_76
    end
    A0_68.work.itemID = A4_72
    A0_68.work.itemQuality = A5_73
    A0_68:proceedTuningPhase()
  end
  A0_68.work.previousCommand = A0_68.work.chosenCommand
  return true
end
function CraftProgressWidget.processWaitCallFunction(A0_78)
  local L1_79
  L1_79 = A0_78.work
  L1_79 = L1_79.chosenCommand
  if L1_79 == 0 then
    L1_79 = false
    return L1_79
  else
    L1_79 = true
    return L1_79
  end
end
function CraftProgressWidget.getCommand(A0_80)
  return A0_80.work.chosenCommand
end
