require("/Widget/WidgetBaseClass")
_defineClass("RepairEquipmentDialogWidget", "WidgetBaseClass")
function RepairEquipmentDialogWidget.init(A0_0, A1_1)
  A0_0.work._temp = {
    {"mode", "integer8"}
  }
  A0_0:setModal(true)
  A0_0:setConfirmCondition("Button_Operate")
  A0_0:setCancelCondition("Button_Operate")
  A0_0:setConfirmCondition("Button_Back")
  A0_0:setCancelCondition("Button_Back")
  A0_0:setConfirmCondition("CheckBox_Weapon")
  A0_0:setConfirmCondition("CheckBox_Armor")
  A0_0:setCancelCondition("CheckBox_Weapon")
  A0_0:setCancelCondition("CheckBox_Armor")
  if A1_1 ~= nil then
    if A1_1 > 0 then
      A0_0:setText("TextBlock_RepairEquipDialogTitle", 3667)
      A0_0:setContent("Button_Operate", 3668)
      A0_0:setHidden("CheckBox_Weapon")
      A0_0:setHidden("CheckBox_Armor")
      if A1_1 == 1 then
        A0_0:setEnable("TextBlock_Armor", false)
      elseif A1_1 == 2 then
        A0_0:setEnable("TextBlock_Weapon", false)
      end
      A0_0.work.mode = A1_1
    else
      A0_0:setText("TextBlock_RepairEquipDialogTitle", 3662)
      A0_0:setContent("Button_Operate", 3665)
    end
  else
    A0_0:setText("TextBlock_RepairEquipDialogTitle", 3662)
    A0_0:setContent("Button_Operate", 3665)
  end
  A0_0:setLogicalFocus("Button_Operate")
  A0_0:setKeyboardFocusedControl("Button_Operate")
end
function RepairEquipmentDialogWidget.processUICommandOperate(A0_2, A1_3, A2_4, A3_5, A4_6)
  local L5_7, L6_8
  if A2_4 == "Button_Back" then
    L6_8 = A0_2
    L5_7 = A0_2._getParentWidget
    L5_7 = L5_7(L6_8)
    if L5_7 ~= nil then
      L6_8 = L5_7.setDialogResult
      L6_8(L5_7, -1)
      L6_8 = L5_7.maskRepairEquipmentSlot
      L6_8(L5_7)
    end
    L6_8 = desktopWidget
    L6_8 = L6_8.closeWidgetDirect
    return L6_8(L6_8, A0_2)
  elseif A2_4 == "Button_Operate" then
    L6_8 = A0_2
    L5_7 = A0_2._getParentWidget
    L5_7 = L5_7(L6_8)
    L6_8 = A0_2.getDialogResult
    L6_8 = L6_8(A0_2)
    if A0_2.work.mode > 0 then
      L6_8 = 0
    end
    if L5_7 ~= nil then
      L5_7:setDialogResult(L6_8)
      L5_7:maskRepairEquipmentSlot()
    end
    return desktopWidget:closeWidgetDirect(A0_2)
  elseif A2_4 == "CheckBox_Weapon" or A2_4 == "CheckBox_Armor" then
    L6_8 = A0_2
    L5_7 = A0_2.getDialogResult
    L5_7 = L5_7(L6_8)
    if L5_7 == 0 then
      L6_8 = A0_2.setEnable
      L6_8(A0_2, "Button_Operate", false)
    else
      L6_8 = A0_2.setEnable
      L6_8(A0_2, "Button_Operate", true)
    end
    L6_8 = A0_2._getParentWidget
    L6_8 = L6_8(A0_2)
    if L6_8 ~= nil then
      L6_8:displayRepairEquipmentCosts(L5_7)
      L6_8:displayRepairEquipmentSlotIcon(L5_7)
      L6_8:maskRepairEquipmentSlot(L5_7)
    end
  end
end
function RepairEquipmentDialogWidget.processUICommandCancel(A0_9, A1_10, A2_11, A3_12, A4_13)
  if A2_11 == "Button_Back" then
    if A0_9:_getParentWidget() ~= nil then
      A0_9:_getParentWidget():setDialogResult(-1)
      A0_9:_getParentWidget():maskRepairEquipmentSlot()
    end
    return desktopWidget:closeWidgetDirect(A0_9)
  else
    A0_9:setKeyboardFocusedControl("Button_Back")
  end
end
function RepairEquipmentDialogWidget.processUICommandClose(A0_14, A1_15, A2_16, A3_17, A4_18)
  if A0_14:_getParentWidget() ~= nil then
    A0_14:_getParentWidget():setDialogResult(-1)
    A0_14:_getParentWidget():maskRepairEquipmentSlot()
  end
  return desktopWidget:closeWidgetDirect(A0_14)
end
function RepairEquipmentDialogWidget.getDialogResult(A0_19)
  local L1_20
  L1_20 = 0
  if A0_19.work.mode == 0 then
    if A0_19:getControlProperty("CheckBox_Weapon", "IsChecked") == true then
      L1_20 = L1_20 + 1
    end
    if A0_19:getControlProperty("CheckBox_Armor", "IsChecked") == true then
      L1_20 = L1_20 + 2
    end
  else
    return A0_19.work.mode
  end
  return L1_20
end
function RepairEquipmentDialogWidget.processBeforeShow(A0_21, A1_22)
  if A1_22 == true then
  end
  A0_21:setProperty("Margin", tostring(desktopWidget:getWindowSize() / 2 + A0_21:_getParentWidget():getWindowSize() / 2 - 446 - 332 - 3) .. ",61,0,0")
end
