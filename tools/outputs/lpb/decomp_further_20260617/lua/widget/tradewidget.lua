require("/Widget/WidgetBaseClass")
_defineClass("TradeWidget", "WidgetBaseClass")
function TradeWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L4_4 = "chosenSlot"
  L5_5 = "integer8"
  L4_4 = {L5_5, L6_6}
  L5_5 = "focusedSlot"
  L6_6 = "integer8"
  L5_5 = {L6_6, L7_7}
  L6_6 = "reservedSlot"
  L7_7 = "integer8"
  L6_6 = {L7_7, "integer8"}
  L7_7 = "firstEmptySlot"
  L7_7 = {
    "chosenPackage",
    "integer32"
  }
  L1_1._temp = L2_2
  L1_1.chosenOperation = -1
  L1_1.choosing = false
  L1_1.sourceFix = false
  L1_1.destinationFix = false
  L1_1.clearcount = 0
  L1_1(L2_2, L3_3)
  for L4_4 = 1, 4 do
    L6_6 = A0_0
    L5_5 = A0_0.getSlotName
    L7_7 = L4_4
    L5_5 = L5_5(L6_6, L7_7)
    L6_6 = "IconControl_Slot_"
    L7_7 = tostring
    L7_7 = L7_7(L4_4)
    L6_6 = L6_6 .. L7_7
    L7_7 = "TextBlock_Slot_"
    L7_7 = L7_7 .. tostring(L4_4) .. "_Number"
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.ButtonFocused")
    A0_0:setCancelCondition(L5_5)
    A0_0:_setProperty(nil, L5_5, "IntData.Value0", -1)
    A0_0:_setProperty(nil, L5_5, "IntData.Value1", 0)
    A0_0:_setProperty(nil, L5_5, "IntData.Value2", 0)
    A0_0:_setProperty(nil, L5_5, "IntData.Value3", L4_4)
    A0_0:_setProperty(nil, L5_5, "CommandParameter", L4_4)
    A0_0:_setProperty(nil, L5_5, "IsHitTestVisible", false)
    A0_0:setIcon(L6_6, 0)
    A0_0:setHidden(L6_6)
    A0_0:setText(L7_7, "")
    A0_0:setVisibility("IconControl_NotEquiped_" .. tostring(L4_4), false)
    A0_0:setVisibility("IconControl_Materia_" .. tostring(L4_4), false)
    A0_0:setVisibility("IconControl_PolishMAX_" .. tostring(L4_4), false)
  end
  L4_4 = 3201
  L5_5 = 0
  L1_1(L2_2, L3_3, L4_4, L5_5)
  for L4_4 = 5, 8 do
    L6_6 = A0_0
    L5_5 = A0_0.getSlotName
    L7_7 = L4_4
    L5_5 = L5_5(L6_6, L7_7)
    L6_6 = "IconControl_Slot_"
    L7_7 = tostring
    L7_7 = L7_7(L4_4)
    L6_6 = L6_6 .. L7_7
    L7_7 = "TextBlock_Slot_"
    L7_7 = L7_7 .. tostring(L4_4) .. "_Number"
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.ChooseSlot")
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.ButtonFocused")
    A0_0:setCancelCondition(L5_5)
    A0_0:_setProperty(nil, L5_5, "IntData.Value0", -1)
    A0_0:_setProperty(nil, L5_5, "IntData.Value1", 0)
    A0_0:_setProperty(nil, L5_5, "IntData.Value2", 0)
    A0_0:_setProperty(nil, L5_5, "IntData.Value3", L4_4)
    A0_0:_setProperty(nil, L5_5, "CommandParameter", L4_4)
    A0_0:setIcon(L6_6, 0)
    A0_0:setHidden(L6_6)
    A0_0:setText(L7_7, "")
    A0_0:setVisibility("IconControl_NotEquiped_" .. tostring(L4_4), false)
    A0_0:setVisibility("IconControl_Materia_" .. tostring(L4_4), false)
    A0_0:setVisibility("IconControl_PolishMAX_" .. tostring(L4_4), false)
  end
  L4_4 = 3201
  L5_5 = 0
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1.sourceFix = false
  L1_1.destinationFix = false
  L4_4 = true
  L5_5 = false
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1.chosenSlot = 0
  L1_1.focusedSlot = 5
  L2_2(L3_3)
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
end
function TradeWidget.setButtonEvents(A0_8, A1_9)
  A0_8:setConfirmCondition(A1_9)
  A0_8:setCancelCondition(A1_9)
  A0_8:setControlCommandCondition(A1_9, "UILuaCommands.ButtonFocused")
end
function TradeWidget.setWindowFocus(A0_10, A1_11)
  if A1_11 ~= nil and A1_11 ~= "" then
    A0_10:setLogicalFocus(A1_11)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_10 then
      A0_10:setKeyboardFocusedControl(A1_11)
    end
  end
end
function TradeWidget.openItemListWindow(A0_12)
  local L1_13
  L1_13 = A0_12.getChildWidgetByWindowName
  L1_13 = L1_13(A0_12, "TradeEditWidget")
  if L1_13 ~= nil then
    A0_12.work.choosing = true
    if A0_12:getSlotData(A0_12.work.chosenSlot) == -1 then
      L1_13:openItemList()
    else
      L1_13:removeItemOperate(A0_12.work.chosenSlot)
    end
    L1_13:setModal(true)
    desktopWidget:changeFocusedWidget(L1_13, true)
  end
  return true
end
function TradeWidget.openMoneyWindow(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  L1_15 = 0
  for _FORV_5_ = 1, 4 do
    if A0_14:getSlotData(_FORV_5_ + 4) == -1 then
      L1_15 = L1_15 + 1
    end
  end
  if L1_15 == 0 then
    return L2_16
  end
  if L3_17 == 0 then
    return L4_18
  end
  if L4_18 ~= nil then
    A0_14.work.choosing = true
    L4_18:openMoneyEdit(L3_17)
    L4_18:setModal(true)
    desktopWidget:changeFocusedWidget(L4_18, true)
  end
  return true
end
function TradeWidget.findEmptySlot(A0_19)
  local L1_20, L3_21, L4_22, L5_23
  L1_20 = 0
  for _FORV_5_ = 1, 4 do
    if A0_19:getSlotData(_FORV_5_ + 4) == -1 then
      L1_20 = _FORV_5_
      break
    end
  end
  return L3_21
end
function TradeWidget.countEmptySlot(A0_24)
  local L2_25, L3_26, L4_27
  L2_25 = 0
  for _FORV_5_ = 1, 4 do
    if A0_24:getSlotData(_FORV_5_ + 4) == -1 then
      L2_25 = L2_25 + 1
    end
  end
  return L2_25
end
function TradeWidget.clearAllMyTradeSlot(A0_28)
  local L1_29, L2_30, L3_31
  for _FORV_4_ = 1, 4 do
    A0_28:clearTradeSlot(4 + _FORV_4_)
  end
end
function TradeWidget.clearTradeSlot(A0_32, A1_33)
  if A0_32:getSlotData(A1_33) == -1 then
    return false
  else
    A0_32:setSlotData(A1_33, -1, 0, 0)
    if A1_33 > 4 then
    end
    A0_32:updateSlotIcon(A1_33)
  end
  return true
end
function TradeWidget.getSlotName(A0_34, A1_35)
  if A1_35 > 0 then
    return "Button_Slot_" .. tostring(A1_35)
  end
end
function TradeWidget.getSlotData(A0_36, A1_37)
  local L2_38, L3_39, L4_40, L5_41
  L2_38 = 0
  L3_39 = 0
  L4_40 = 0
  if A1_37 == nil or A1_37 <= 0 or A1_37 > 8 then
  else
    L5_41 = A0_36.getSlotName
    L5_41 = L5_41(A0_36, A1_37)
    L2_38 = A0_36:_getProperty(nil, L5_41, "IntData.Value0")
    L3_39 = A0_36:_getProperty(nil, L5_41, "IntData.Value1")
    L4_40 = A0_36:_getProperty(nil, L5_41, "IntData.Value2")
  end
  L5_41 = L2_38
  return L5_41, L3_39, L4_40
end
function TradeWidget.setSlotData(A0_42, A1_43, A2_44, A3_45, A4_46)
  local L5_47
  if A1_43 == nil or A1_43 <= 0 or A1_43 > 8 then
    L5_47 = false
    return L5_47
  end
  L5_47 = A0_42.getSlotName
  L5_47 = L5_47(A0_42, A1_43)
  A0_42:_setProperty(nil, L5_47, "IntData.Value0", A2_44)
  A0_42:_setProperty(nil, L5_47, "IntData.Value1", A3_45)
  A0_42:_setProperty(nil, L5_47, "IntData.Value2", A4_46)
  A0_42:updateSlotIcon(A1_43)
end
function TradeWidget.updateSlotIcon(A0_48, A1_49)
  local L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59, L12_60, L13_61, L14_62, L15_63, L16_64, L17_65, L18_66, L19_67, L20_68
  L3_51 = A0_48
  L2_50 = A0_48.getChildWidgetByWindowName
  L4_52 = "TradeEditWidget"
  L2_50 = L2_50(L3_51, L4_52)
  if L2_50 == nil then
    return
  end
  L3_51 = 1
  L4_52 = 8
  if A1_49 ~= nil then
    L3_51 = A1_49
    L4_52 = A1_49
  end
  for L8_56 = L3_51, L4_52 do
    L9_57 = "IconControl_Slot_"
    L10_58 = tostring
    L11_59 = L8_56
    L10_58 = L10_58(L11_59)
    L9_57 = L9_57 .. L10_58
    L10_58 = "TextBlock_Slot_"
    L11_59 = tostring
    L12_60 = L8_56
    L11_59 = L11_59(L12_60)
    L12_60 = "_Number"
    L10_58 = L10_58 .. L11_59 .. L12_60
    L12_60 = A0_48
    L11_59 = A0_48.getSlotData
    L13_61 = L8_56
    L13_61 = L11_59(L12_60, L13_61)
    if L11_59 == -1 then
      L15_63 = A0_48
      L14_62 = A0_48.setHidden
      L16_64 = L9_57
      L14_62(L15_63, L16_64)
      L15_63 = A0_48
      L14_62 = A0_48.setText
      L16_64 = L10_58
      L17_65 = ""
      L14_62(L15_63, L16_64, L17_65)
    else
      L15_63 = L2_50
      L14_62 = L2_50.getSlotIcon
      L16_64 = L8_56
      L16_64 = L14_62(L15_63, L16_64)
      L18_66 = A0_48
      L17_65 = A0_48.setIcon
      L19_67 = L9_57
      L20_68 = L14_62
      L17_65(L18_66, L19_67, L20_68)
      L18_66 = A0_48
      L17_65 = A0_48.setVisibility
      L19_67 = L9_57
      L20_68 = true
      L17_65(L18_66, L19_67, L20_68)
      if L16_64 == 0 then
        L18_66 = A0_48
        L17_65 = A0_48.setText
        L19_67 = L10_58
        L20_68 = ""
        L17_65(L18_66, L19_67, L20_68)
      else
        L18_66 = A0_48
        L17_65 = A0_48.setText
        L19_67 = L10_58
        L20_68 = 225
        L17_65(L18_66, L19_67, L20_68, L15_63)
      end
    end
  end
  L5_53(L6_54)
end
function TradeWidget.tradeFix(A0_69, A1_70)
  local L2_71
  L2_71 = A0_69.work
  L2_71 = L2_71.sourceFix
  A0_69.work.sourceFix = A1_70
  if A1_70 == true then
    A0_69:setVisibility("Button_OK", false)
    A0_69:setVisibility("Button_Cancel", false)
    A0_69:setVisibility("Button_Reedit", true)
    A0_69:setEnable("Button_Clear", false)
    if A0_69:getChildWidgetByWindowName("TradeEditWidget") ~= nil and A0_69:getChildWidgetByWindowName("TradeEditWidget"):getProperty("IsModal") == true then
      A0_69:getChildWidgetByWindowName("TradeEditWidget"):setModal(false)
      desktopWidget:changeFocusedWidget(A0_69, true)
      A0_69:doNothing()
      if A0_69.work.focusedSlot ~= 0 then
        A0_69:displaySlotItemHelp(A0_69.work.focusedSlot)
      else
        A0_69:displayHelp(3308, 3309)
      end
    end
    A0_69:setWindowFocus("Button_Reedit")
    A0_69:displayHelp(3314, 3315)
  else
    A0_69:setVisibility("Button_OK", true)
    A0_69:setVisibility("Button_Cancel", true)
    A0_69:setVisibility("Button_Reedit", false)
    A0_69:setEnable("Button_Clear", true)
    if desktopWidget:checkKeyboardFocused(A0_69) == true then
      A0_69:setWindowFocus("Button_OK")
      A0_69:displayHelp(3308, 3309)
    end
  end
  A0_69:tradePrint()
  if L2_71 == true and A1_70 == false then
    A0_69:sendControlCommand("TextBlock_Source", "Reedit")
  elseif L2_71 == false and A1_70 == true then
    A0_69:sendControlCommand("TextBlock_Source", "Fixed")
  end
end
function TradeWidget.tradeDestFix(A0_72, A1_73)
  if A0_72.work.destinationFix == true and A1_73 == false then
    A0_72:sendControlCommand("TextBlock_Destination", "Reedit")
  elseif A0_72.work.destinationFix == false and A1_73 == true then
    A0_72:sendControlCommand("TextBlock_Destination", "Fixed")
  end
  A0_72.work.destinationFix = A1_73
  if A1_73 == true then
  else
  end
  A0_72:tradePrint()
end
function TradeWidget.tradePrint(A0_74)
  if A0_74.work.sourceFix == true then
    A0_74:setStyle("Label_Source", "LAB_trade_ContentWindow_H")
    A0_74:setStyle("Border_Trade_1", "BOD_trade_directionIconUp_H")
  else
    A0_74:setStyle("Label_Source", "LAB_basis_ContentWindow")
    A0_74:setStyle("Border_Trade_1", "BOD_trade_directionIconUp_N")
  end
  if A0_74.work.destinationFix == true then
    A0_74:setStyle("Label_Destination", "LAB_trade_ContentWindow_H")
    A0_74:setStyle("Border_Trade_2", "BOD_trade_directionIconDown_H")
  else
    A0_74:setStyle("Label_Destination", "LAB_basis_ContentWindow")
    A0_74:setStyle("Border_Trade_2", "BOD_trade_directionIconDown_N")
  end
end
function TradeWidget.displaySlotItemHelp(A0_75, A1_76)
  if A0_75:doesTradeFinish() == true then
    return
  end
  if A1_76 == nil then
    A1_76 = A0_75.work.chosenSlot
  end
  if A1_76 == 0 then
    return
  end
  if A0_75:getSlotData(A1_76) == -1 then
    if A0_75.work.sourceFix == true then
      A0_75:displayHelp(3308, 3309)
    elseif A1_76 > 4 then
      A0_75:displayHelp(3321, 3322)
    else
      A0_75:displayHelp(3323, 3324)
    end
  elseif A0_75:getChildWidgetByWindowName("TradeEditWidget") ~= nil then
    A0_75:getChildWidgetByWindowName("TradeEditWidget"):setActorName(A1_76)
    A0_75:getChildWidgetByWindowName("TradeEditWidget"):displayLeftItemHelp(A1_76, A0_75.work.sourceFix)
  end
end
function TradeWidget.displayHelp(A0_77, A1_78, A2_79, A3_80)
  if A0_77:getChildWidgetByWindowName("TradeEditWidget") ~= nil then
    A0_77:getChildWidgetByWindowName("TradeEditWidget"):displayLeftButtonHelp(A1_78, A2_79)
  end
end
function TradeWidget.playDisableSe(A0_81)
  A0_81:sendControlCommand("TextBlock_Source", "Disable")
end
function TradeWidget.processUICommandOperate(A0_82, A1_83, A2_84, A3_85, A4_86)
  if A0_82:doesTradeFinish() == true then
    return
  end
  if A0_82.work.editWidgetMode ~= 0 then
    return false
  end
  if A0_82.work.chosenOperation ~= -1 then
    return false
  end
  if A2_84 == "Button_Clear" then
    if A0_82.work.reservedSlot ~= 0 then
      return
    end
    if A0_82.work.sourceFix == true then
      return
    end
    if A0_82.work.choosing == true then
      return
    end
    if 0 < A0_82.work.clearcount then
      return
    end
    if A0_82:countEmptySlot() ~= 4 then
      A0_82.work.chosenOperation = 2
      A0_82.work.clearcount = 4 - A0_82:countEmptySlot()
      return true
    end
    return false
  elseif A2_84 == "Button_Cancel" then
    if A0_82.work.sourceFix == true then
      return
    end
    if A0_82.work.choosing == true then
      return
    end
    if 0 < A0_82.work.clearcount then
      return
    end
    A0_82.work.choosing = false
    A0_82.work.chosenOperation = 11
    return true
  elseif A2_84 == "Button_Reedit" then
    A0_82.work.chosenOperation = 13
    return true
  elseif A2_84 == "Button_OK" then
    if A0_82.work.sourceFix == true then
      return
    end
    if A0_82.work.choosing == true then
      return
    end
    if A0_82.work.reservedSlot ~= 0 then
      return
    end
    if 0 < A0_82.work.clearcount then
      return
    end
    A0_82.work.chosenOperation = 12
    A0_82.work.choosing = true
    return true
  elseif A2_84 == "Button_InputGil" then
    if A0_82.work.reservedSlot ~= 0 then
      return
    end
    if A0_82.work.choosing == true then
      return
    end
    if A0_82.work.sourceFix == true then
      return false
    end
    if 0 < A0_82.work.clearcount then
      return
    end
    if A0_82:findEmptySlot() == 4 then
      A0_82:playDisableSe()
      return
    end
    if 0 < A0_82:_getProperty(nil, "TextBlock_Gil_Source", "IntData.Value0") then
      A0_82:playDisableSe()
      return
    end
    return A0_82:openMoneyWindow()
  end
end
function TradeWidget.processUICommandCancel(A0_87, A1_88, A2_89, A3_90, A4_91)
  if A0_87:doesTradeFinish() == true then
    return
  end
  if A0_87.work.editWidgetMode ~= 0 then
    return false
  end
  if A0_87.work.chosenOperation ~= -1 then
    return false
  end
  if A0_87.work.sourceFix == false then
    if A2_89 == "Button_Cancel" then
      if A0_87.work.sourceFix == true then
        return
      end
      if A0_87.work.choosing == true then
        return
      end
      if 0 < A0_87.work.clearcount then
        return
      end
      A0_87.work.choosing = false
      A0_87.work.chosenOperation = 11
      return true
    else
      A0_87:setWindowFocus("Button_Cancel")
      A0_87:displayHelp(3311, 3312)
    end
  elseif A2_89 == "Button_Reedit" then
    A0_87.work.chosenOperation = 13
    return true
  else
    A0_87:setWindowFocus("Button_Reedit")
    A0_87:displayHelp(3314, 3315)
  end
end
function TradeWidget.processUICommandDefault(A0_92, A1_93, A2_94, A3_95, A4_96, A5_97)
  local L6_98
  L6_98 = A0_92.doesTradeFinish
  L6_98 = L6_98(A0_92)
  if L6_98 == true then
    return
  end
  L6_98 = A0_92.work
  L6_98 = L6_98.editWidgetMode
  if L6_98 ~= 0 then
    L6_98 = false
    return L6_98
  end
  L6_98 = A0_92.work
  L6_98 = L6_98.chosenOperation
  if L6_98 ~= -1 then
    L6_98 = false
    return L6_98
  end
  L6_98 = desktopWidget
  L6_98 = L6_98.checkKeyboardFocused
  L6_98 = L6_98(L6_98, A0_92)
  if L6_98 == false then
    return
  end
  if A3_95 == "UILuaCommands.ChooseSlot" then
    L6_98 = A0_92.work
    L6_98 = L6_98.sourceFix
    if L6_98 == true then
      L6_98 = A0_92.playDisableSe
      L6_98(A0_92)
      return
    end
    L6_98 = A0_92.work
    L6_98 = L6_98.choosing
    if L6_98 == true then
      L6_98 = A0_92.playDisableSe
      L6_98(A0_92)
      return
    end
    L6_98 = A0_92.work
    L6_98 = L6_98.reservedSlot
    if L6_98 ~= 0 then
      L6_98 = A0_92.playDisableSe
      L6_98(A0_92)
      return
    end
    L6_98 = A0_92.work
    L6_98 = L6_98.clearcount
    if L6_98 > 0 then
      return
    end
    L6_98 = A0_92.work
    L6_98 = L6_98.reservedSlot
    if A4_96 == L6_98 then
      return
    end
    L6_98 = A0_92.work
    L6_98.chosenSlot = A4_96
    L6_98 = A0_92.work
    L6_98.choosing = true
    L6_98 = A0_92.openItemListWindow
    L6_98(A0_92)
    L6_98 = true
    return L6_98
  end
  if A3_95 == "UILuaCommands.ButtonFocused" then
    if A2_94 == "Button_Reedit" then
      L6_98 = A0_92.displayHelp
      L6_98(A0_92, 3314, 3315)
    end
    L6_98 = A0_92.work
    L6_98.focusedSlot = 0
    L6_98 = A0_92.work
    L6_98 = L6_98.sourceFix
    if L6_98 == false then
      if A2_94 == "Button_OK" then
        L6_98 = A0_92.displayHelp
        return L6_98(A0_92, 3308, 3309)
      elseif A2_94 == "Button_Clear" then
        L6_98 = A0_92.displayHelp
        return L6_98(A0_92, 3305, 3306)
      elseif A2_94 == "Button_Reedit" then
        L6_98 = A0_92.displayHelp
        return L6_98(A0_92, 3314, 3315)
      elseif A2_94 == "Button_Cancel" then
        L6_98 = A0_92.displayHelp
        return L6_98(A0_92, 3311, 3312)
      elseif A2_94 == "Button_InputGil" then
        L6_98 = A0_92.displayHelp
        return L6_98(A0_92, 3320, 3325)
      end
    elseif A2_94 == "Button_OK" then
      L6_98 = A0_92.displayHelp
      return L6_98(A0_92, 3308, 3309)
    elseif A2_94 == "Button_Clear" then
      L6_98 = A0_92.displayHelp
      return L6_98(A0_92, 3308, 3309)
    elseif A2_94 == "Button_Reedit" then
      L6_98 = A0_92.displayHelp
      return L6_98(A0_92, 3314, 3315)
    elseif A2_94 == "Button_Cancel" then
      L6_98 = A0_92.displayHelp
      return L6_98(A0_92, 3308, 3309)
    elseif A2_94 == "Button_InputGil" then
      L6_98 = A0_92.displayHelp
      return L6_98(A0_92, 3308, 3309)
    end
    L6_98 = A0_92._getProperty
    L6_98 = L6_98(A0_92, nil, A2_94, "IntData.Value3")
    if L6_98 ~= nil then
      A0_92.work.focusedSlot = L6_98
      A0_92:displaySlotItemHelp(L6_98)
    end
    return
  end
end
function TradeWidget.setItem(A0_99, A1_100, A2_101, A3_102)
  if A0_99:doesTradeFinish() == true then
    return
  end
  A0_99:displaySlotItemHelp()
  A0_99.work.chosenOperation = 3
  A0_99.work.chosenPackage = A1_100
  A0_99.work.chosenItem = A2_101
  A0_99.work.chosenStack = A3_102
  A0_99.work.reservedSlot = A0_99.work.chosenSlot
  A0_99.work.editWidgetMode = 0
  A0_99:setWindowFocus(A0_99:getSlotName(A0_99.work.chosenSlot))
  A0_99.work.focusedSlot = A0_99.work.chosenSlot
end
function TradeWidget.setMoney(A0_103, A1_104, A2_105)
  if A0_103:doesTradeFinish() == true then
    return
  end
  A0_103.work.firstEmptySlot = A0_103:findEmptySlot()
  if A0_103.work.firstEmptySlot == 4 then
    A0_103.work.editWidgetMode = 0
    A0_103.work.choosing = false
    return
  end
  A0_103.work.reservedSlot = A0_103.work.firstEmptySlot
  A0_103.work.chosenOperation = 4
  A0_103.work.chosenStack = A1_104
  A0_103.work.chosenItem = A2_105
  return A0_103:displayHelp(3308, 3309)
end
function TradeWidget.clearSlot(A0_106)
  if A0_106:doesTradeFinish() == true then
    return
  end
  A0_106.work.chosenOperation = 1
  A0_106:setWindowFocus(A0_106:getSlotName(A0_106.work.chosenSlot))
  A0_106.work.reservedSlot = A0_106.work.chosenSlot
  A0_106.work.focusedSlot = A0_106.work.chosenSlot
end
function TradeWidget.doNothing(A0_107)
  if A0_107:doesTradeFinish() == true then
    return
  end
  if A0_107.work.chosenSlot > 0 then
    A0_107:setWindowFocus(A0_107:getSlotName(A0_107.work.chosenSlot))
    A0_107.work.focusedSlot = A0_107.work.chosenSlot
  elseif 0 < A0_107.work.focusedSlot then
    A0_107:setWindowFocus(A0_107:getSlotName(A0_107.work.focusedSlot))
  else
    A0_107.work.chosenSlot = 5
    A0_107.work.focusedSlot = A0_107.work.chosenSlot
    A0_107:setWindowFocus(A0_107:getSlotName(A0_107.work.focusedSlot))
  end
  A0_107.work.choosing = false
  A0_107.work.editWidgetMode = 0
end
function TradeWidget.updateMoneyDisplay(A0_108)
  local L1_109, L2_110, L3_111, L4_112, L5_113, L6_114
  L2_110 = A0_108
  L1_109 = A0_108.doesTradeFinish
  L1_109 = L1_109(L2_110)
  if L1_109 == true then
    return
  end
  L1_109 = 0
  L2_110 = A0_108.getChildWidgetByWindowName
  L2_110 = L2_110(L3_111, L4_112)
  if L2_110 == nil then
    return
  end
  for L6_114 = 1, 4 do
    if L2_110:getSlotXmlData(L6_114, "catalog", "Int") == 1000001 then
      L1_109 = L1_109 + L2_110:getSlotXmlData(L6_114, "stackCount", "Int")
    end
  end
  L6_114 = 3201
  L3_111(L4_112, L5_113, L6_114, L1_109)
  L1_109 = 0
  for L6_114 = 5, 8 do
    if L2_110:getSlotXmlData(L6_114, "catalog", "Int") == 1000001 then
      L1_109 = L1_109 + L2_110:getSlotXmlData(L6_114, "stackCount", "Int")
    end
  end
  L6_114 = "TextBlock_Gil_Source"
  L3_111(L4_112, L5_113, L6_114, "IntData.Value0", L1_109)
  L6_114 = 3201
  L3_111(L4_112, L5_113, L6_114, L1_109)
end
function TradeWidget.updatePlayerItem(A0_115, A1_116, A2_117)
  if A0_115:doesTradeFinish() == true then
    return
  end
  if A0_115:getChildWidgetByWindowName("TradeEditWidget") ~= nil then
    A0_115:getChildWidgetByWindowName("TradeEditWidget"):updatePlayerItem(A1_116, A2_117)
  end
  return
end
function TradeWidget.processUpdatePlayerTradingItem(A0_118, A1_119, A2_120)
  local L3_121, L4_122, L5_123, L6_124, L7_125, L8_126, L9_127, L10_128, L11_129
  L4_122 = A0_118
  L3_121 = A0_118.doesTradeFinish
  L3_121 = L3_121(L4_122)
  if L3_121 == true then
    return
  end
  L4_122 = A0_118
  L3_121 = A0_118.getChildWidgetByWindowName
  L5_123 = "TradeEditWidget"
  L3_121 = L3_121(L4_122, L5_123)
  if L3_121 == nil then
    return
  end
  L4_122 = "SlotItem_Maker"
  L6_124 = L3_121
  L5_123 = L3_121.enableCheckSlot
  L7_125 = true
  L5_123(L6_124, L7_125)
  L5_123 = A1_119 + 4
  if A2_120 ~= nil then
    L7_125 = L3_121
    L6_124 = L3_121.setItemToXml
    L8_126 = 8
    L9_127 = L5_123
    L10_128 = 0
    L11_129 = 0
    L6_124(L7_125, L8_126, L9_127, L10_128, L11_129, 1, A2_120, true)
    L7_125 = A2_120
    L6_124 = A2_120._isTrading
    L7_125 = L6_124(L7_125)
    L9_127 = A2_120
    L8_126 = A2_120._isStackable
    L8_126 = L8_126(L9_127)
    if L8_126 == true then
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stackCount"
      L8_126(L9_127, L10_128, L11_129, "Int", L7_125)
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stackMax"
      L8_126(L9_127, L10_128, L11_129, "Int", A2_120:_getMaxStack())
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stackable"
      L8_126(L9_127, L10_128, L11_129, "Int", 1)
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stack"
      L8_126(L9_127, L10_128, L11_129, nil, A0_118:packTextParameter(3042, L7_125))
    else
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stackCount"
      L8_126(L9_127, L10_128, L11_129, "Int", 1)
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stackMax"
      L8_126(L9_127, L10_128, L11_129, "Int", 1)
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stackable"
      L8_126(L9_127, L10_128, L11_129, "Int", 0)
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stack"
      L8_126(L9_127, L10_128, L11_129, nil, "")
    end
    L9_127 = A2_120
    L8_126 = A2_120._getCatalogID
    L8_126 = L8_126(L9_127)
    if L8_126 == 1000001 then
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "stack"
      L8_126(L9_127, L10_128, L11_129, nil, "")
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "name"
      L8_126(L9_127, L10_128, L11_129, nil, A0_118:packTextParameter(3263, L7_125))
    else
      L9_127 = L3_121
      L8_126 = L3_121.setSlotXmlData
      L10_128 = L5_123
      L11_129 = "name"
      L8_126(L9_127, L10_128, L11_129, nil, A0_118:packTextParameter(3202, A2_120:_getCatalogID(), A2_120:_getNameIndex()))
    end
    L8_126 = desktopWidget
    L9_127 = L8_126
    L8_126 = L8_126.cantEquipBadge
    L10_128 = L3_121
    L11_129 = L4_122
    L8_126 = L8_126(L9_127, L10_128, L11_129, L5_123, A2_120)
    L10_128 = A0_118
    L9_127 = A0_118.setVisibility
    L11_129 = "IconControl_NotEquiped_"
    L11_129 = L11_129 .. tostring(L5_123)
    L9_127(L10_128, L11_129, L8_126)
    L9_127 = worldMaster
    L10_128 = L9_127
    L9_127 = L9_127._getMyPlayer
    L9_127 = L9_127(L10_128)
    L10_128 = false
    L11_129 = L9_127.hasItem
    L11_129 = L11_129(L9_127, 101, 2001001)
    if not L11_129 then
      L11_129 = L9_127.hasItem
      L11_129 = L11_129(L9_127, 101, 2001002)
      if not L11_129 then
        L11_129 = L9_127.hasItem
        L11_129 = L11_129(L9_127, 101, 2001003)
      end
    elseif L11_129 then
      L10_128 = true
    end
    L11_129 = false
    if A2_120:isEquipment() then
      L11_129 = A2_120:getMaterializePermission()
    end
    A0_118:setVisibility("IconControl_PolishMAX_" .. tostring(L5_123), true and L10_128 and L11_129)
    if 0 < desktopWidget:getItemMateriaAttachInfo(A2_120) then
      A0_118:setVisibility("IconControl_Materia_" .. tostring(L5_123), true)
    else
      A0_118:setVisibility("IconControl_Materia_" .. tostring(L5_123), false)
    end
    A0_118:setSlotData(L5_123, 8, L5_123, L7_125)
  else
    L7_125 = L3_121
    L6_124 = L3_121.setDummyItem
    L8_126 = L5_123
    L6_124(L7_125, L8_126)
    L7_125 = A0_118
    L6_124 = A0_118.setVisibility
    L8_126 = "IconControl_NotEquiped_"
    L9_127 = tostring
    L10_128 = L5_123
    L9_127 = L9_127(L10_128)
    L8_126 = L8_126 .. L9_127
    L9_127 = false
    L6_124(L7_125, L8_126, L9_127)
    L7_125 = A0_118
    L6_124 = A0_118.setVisibility
    L8_126 = "IconControl_PolishMAX_"
    L9_127 = tostring
    L10_128 = L5_123
    L9_127 = L9_127(L10_128)
    L8_126 = L8_126 .. L9_127
    L9_127 = false
    L6_124(L7_125, L8_126, L9_127)
    L7_125 = A0_118
    L6_124 = A0_118.setVisibility
    L8_126 = "IconControl_Materia_"
    L9_127 = tostring
    L10_128 = L5_123
    L9_127 = L9_127(L10_128)
    L8_126 = L8_126 .. L9_127
    L9_127 = false
    L6_124(L7_125, L8_126, L9_127)
    L7_125 = A0_118
    L6_124 = A0_118.clearTradeSlot
    L8_126 = L5_123
    L6_124(L7_125, L8_126)
    L6_124 = A0_118.work
    L6_124 = L6_124.clearcount
    if L6_124 > 0 then
      L6_124 = A0_118.work
      L7_125 = A0_118.work
      L7_125 = L7_125.clearcount
      L7_125 = L7_125 - 1
      L6_124.clearcount = L7_125
    end
  end
  L7_125 = A0_118
  L6_124 = A0_118.updateSlotIcon
  L8_126 = L5_123
  L6_124(L7_125, L8_126)
  L6_124 = A0_118.work
  L6_124 = L6_124.reservedSlot
  if L5_123 == L6_124 then
    L6_124 = A0_118.work
    L6_124.reservedSlot = 0
  end
  L6_124 = A0_118.work
  L6_124 = L6_124.focusedSlot
  if L5_123 == L6_124 then
    L6_124 = desktopWidget
    L7_125 = L6_124
    L6_124 = L6_124.checkKeyboardFocused
    L8_126 = A0_118
    L6_124 = L6_124(L7_125, L8_126)
    if L6_124 == true then
      L7_125 = A0_118
      L6_124 = A0_118.displaySlotItemHelp
      L8_126 = A0_118.work
      L8_126 = L8_126.focusedSlot
      L6_124(L7_125, L8_126)
    end
  end
end
function TradeWidget.processUpdateTradingItem(A0_130, A1_131, A2_132)
  local L3_133, L4_134, L5_135, L6_136, L7_137, L8_138, L9_139, L10_140
  L4_134 = A0_130
  L3_133 = A0_130.doesTradeFinish
  L3_133 = L3_133(L4_134)
  if L3_133 == true then
    return
  end
  L4_134 = A0_130
  L3_133 = A0_130.getChildWidgetByWindowName
  L5_135 = "TradeEditWidget"
  L3_133 = L3_133(L4_134, L5_135)
  if L3_133 == nil then
    return
  end
  L4_134 = "SlotItem_Maker"
  if A2_132 ~= nil then
    L6_136 = L3_133
    L5_135 = L3_133.setItemToXml
    L7_137 = 8
    L8_138 = A1_131
    L9_139 = 0
    L10_140 = 0
    L5_135(L6_136, L7_137, L8_138, L9_139, L10_140, 2, A2_132, true)
    L6_136 = A2_132
    L5_135 = A2_132._isTrading
    L6_136 = L5_135(L6_136)
    L8_138 = A2_132
    L7_137 = A2_132._isStackable
    L7_137 = L7_137(L8_138)
    if L7_137 == true then
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stackCount"
      L7_137(L8_138, L9_139, L10_140, "Int", L6_136)
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stackMax"
      L7_137(L8_138, L9_139, L10_140, "Int", A2_132:_getMaxStack())
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stackable"
      L7_137(L8_138, L9_139, L10_140, "Int", 1)
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stack"
      L7_137(L8_138, L9_139, L10_140, nil, A0_130:packTextParameter(3042, L6_136))
    else
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stackCount"
      L7_137(L8_138, L9_139, L10_140, "Int", 1)
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stackMax"
      L7_137(L8_138, L9_139, L10_140, "Int", 1)
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stackable"
      L7_137(L8_138, L9_139, L10_140, "Int", 0)
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stack"
      L7_137(L8_138, L9_139, L10_140, nil, "")
    end
    L8_138 = A2_132
    L7_137 = A2_132._getCatalogID
    L7_137 = L7_137(L8_138)
    if L7_137 == 1000001 then
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "stack"
      L7_137(L8_138, L9_139, L10_140, nil, "")
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "name"
      L7_137(L8_138, L9_139, L10_140, nil, A0_130:packTextParameter(3263, L6_136))
    else
      L8_138 = L3_133
      L7_137 = L3_133.setSlotXmlData
      L9_139 = A1_131
      L10_140 = "name"
      L7_137(L8_138, L9_139, L10_140, nil, A0_130:packTextParameter(3202, A2_132:_getCatalogID(), A2_132:_getNameIndex()))
    end
    L7_137 = desktopWidget
    L8_138 = L7_137
    L7_137 = L7_137.cantEquipBadge
    L9_139 = L3_133
    L10_140 = L4_134
    L7_137 = L7_137(L8_138, L9_139, L10_140, A1_131, A2_132)
    L9_139 = A0_130
    L8_138 = A0_130.setVisibility
    L10_140 = "IconControl_NotEquiped_"
    L10_140 = L10_140 .. tostring(A1_131)
    L8_138(L9_139, L10_140, L7_137)
    L8_138 = worldMaster
    L9_139 = L8_138
    L8_138 = L8_138._getMyPlayer
    L8_138 = L8_138(L9_139)
    L9_139 = false
    L10_140 = L8_138.hasItem
    L10_140 = L10_140(L8_138, 101, 2001001)
    if not L10_140 then
      L10_140 = L8_138.hasItem
      L10_140 = L10_140(L8_138, 101, 2001002)
      if not L10_140 then
        L10_140 = L8_138.hasItem
        L10_140 = L10_140(L8_138, 101, 2001003)
      end
    elseif L10_140 then
      L9_139 = true
    end
    L10_140 = false
    if A2_132:isEquipment() then
      L10_140 = A2_132:getMaterializePermission()
    end
    A0_130:setVisibility("IconControl_PolishMAX_" .. tostring(A1_131), L9_139 and true and L9_139 and L10_140)
    if 0 < desktopWidget:getItemMateriaAttachInfo(A2_132) then
      A0_130:setVisibility("IconControl_Materia_" .. tostring(A1_131), true)
    else
      A0_130:setVisibility("IconControl_Materia_" .. tostring(A1_131), false)
    end
    A0_130:setSlotData(A1_131, 8, A1_131, L6_136)
  else
    L6_136 = L3_133
    L5_135 = L3_133.setDummyItem
    L7_137 = A1_131
    L5_135(L6_136, L7_137)
    L6_136 = A0_130
    L5_135 = A0_130.setVisibility
    L7_137 = "IconControl_NotEquiped_"
    L8_138 = tostring
    L9_139 = A1_131
    L8_138 = L8_138(L9_139)
    L7_137 = L7_137 .. L8_138
    L8_138 = false
    L5_135(L6_136, L7_137, L8_138)
    L6_136 = A0_130
    L5_135 = A0_130.setVisibility
    L7_137 = "IconControl_PolishMAX_"
    L8_138 = tostring
    L9_139 = A1_131
    L8_138 = L8_138(L9_139)
    L7_137 = L7_137 .. L8_138
    L8_138 = false
    L5_135(L6_136, L7_137, L8_138)
    L6_136 = A0_130
    L5_135 = A0_130.setVisibility
    L7_137 = "IconControl_Materia_"
    L8_138 = tostring
    L9_139 = A1_131
    L8_138 = L8_138(L9_139)
    L7_137 = L7_137 .. L8_138
    L8_138 = false
    L5_135(L6_136, L7_137, L8_138)
    L6_136 = A0_130
    L5_135 = A0_130.clearTradeSlot
    L7_137 = A1_131
    L5_135(L6_136, L7_137)
  end
  L6_136 = A0_130
  L5_135 = A0_130.updateSlotIcon
  L7_137 = A1_131
  L5_135(L6_136, L7_137)
  L5_135 = A0_130.work
  L5_135 = L5_135.focusedSlot
  if A1_131 == L5_135 then
    L5_135 = desktopWidget
    L6_136 = L5_135
    L5_135 = L5_135.checkKeyboardFocused
    L7_137 = A0_130
    L5_135 = L5_135(L6_136, L7_137)
    if L5_135 == true then
      L6_136 = A0_130
      L5_135 = A0_130.displaySlotItemHelp
      L7_137 = A0_130.work
      L7_137 = L7_137.focusedSlot
      L5_135(L6_136, L7_137)
    end
  end
  L5_135 = A0_130.work
  L5_135 = L5_135.sourceFix
  if L5_135 == true then
    L5_135 = A0_130.work
    L5_135.chosenOperation = 13
  end
end
function TradeWidget.processWaitCallFunction(A0_141)
  if A0_141:doesTradeFinish() == true then
    return false
  end
  if A0_141.work.chosenOperation == -1 then
    return false
  else
    A0_141.work.resultForAsk = A0_141.work.chosenOperation
    A0_141.work.chosenOperation = -1
    return true
  end
end
function TradeWidget.getAskResult(A0_142)
  local L1_143, L2_144, L3_145, L5_146, L6_147
  L1_143 = A0_142.work
  L1_143 = L1_143.resultForAsk
  if L1_143 == 1 then
    L1_143 = A0_142.work
    L1_143 = L1_143.reservedSlot
    L1_143 = L1_143 - 4
    L2_144 = A0_142.work
    L2_144.reservedSlot = 0
    L2_144 = A0_142.work
    L2_144.resultForAsk = 0
    L2_144 = 1
    L3_145 = L1_143
    L5_146, L6_147 = nil, nil
    return L2_144, L3_145, L5_146, L6_147, nil
  else
    L1_143 = A0_142.work
    L1_143 = L1_143.resultForAsk
    if L1_143 == 2 then
      L1_143 = A0_142.work
      L1_143.reservedSlot = 0
      L1_143 = A0_142.work
      L1_143.resultForAsk = 0
      L1_143 = 2
      L2_144 = 0
      L3_145, L5_146, L6_147 = nil, nil, nil
      return L1_143, L2_144, L3_145, L5_146, L6_147
    else
      L1_143 = A0_142.work
      L1_143 = L1_143.resultForAsk
      if L1_143 == 3 then
        L1_143 = A0_142.work
        L1_143 = L1_143.reservedSlot
        L1_143 = L1_143 - 4
        L2_144 = A0_142.work
        L2_144.reservedSlot = 0
        L2_144 = A0_142.work
        L2_144.resultForAsk = 0
        L2_144 = 3
        L3_145 = L1_143
        L5_146 = A0_142.work
        L5_146 = L5_146.chosenPackage
        L6_147 = A0_142.work
        L6_147 = L6_147.chosenItem
        return L2_144, L3_145, L5_146, L6_147, A0_142.work.chosenStack
      else
        L1_143 = A0_142.work
        L1_143 = L1_143.resultForAsk
        if L1_143 == 4 then
          L1_143 = A0_142.work
          L1_143 = L1_143.reservedSlot
          L1_143 = L1_143 - 4
          L2_144 = A0_142.work
          L2_144.resultForAsk = 0
          L2_144 = 4
          L3_145 = L1_143
          L5_146 = 100
          L6_147 = A0_142.work
          L6_147 = L6_147.chosenItem
          return L2_144, L3_145, L5_146, L6_147, A0_142.work.chosenStack
        else
          L1_143 = A0_142.work
          L1_143 = L1_143.resultForAsk
          L2_144 = A0_142.work
          L2_144.resultForAsk = 0
          L2_144 = L1_143
          L3_145, L5_146, L6_147 = nil, nil, nil
          return L2_144, L3_145, L5_146, L6_147, nil
        end
      end
    end
  end
end
function TradeWidget.dictateNoticeTradeWidget(A0_148, A1_149, A2_150, A3_151, A4_152)
  if A1_149 == 201 or A1_149 == 203 then
    A0_148.work.reservedSlot = 0
    A0_148.work.choosing = false
    return
  elseif A1_149 == 211 then
    return
  elseif A1_149 == 212 then
    return
  elseif A1_149 == 213 then
    return
  elseif A1_149 == 204 then
    A0_148.work.choosing = false
    return
  elseif A1_149 == 205 then
    A0_148.work.choosing = false
    return
  elseif A1_149 == 206 then
    A0_148.work.choosing = false
    A0_148.work.reservedSlot = 0
    return
  elseif A1_149 == 101 then
    A0_148.work.choosing = false
  elseif A1_149 == 103 then
    A0_148.work.reservedSlot = 0
    A0_148.work.choosing = false
  elseif A1_149 == 112 then
    A0_148:tradeFix(true)
  elseif A1_149 == 113 then
    A0_148.work.choosing = false
    A0_148:tradeFix(false)
  elseif A1_149 == 90 then
    A0_148:tradeDestFix(true)
  elseif A1_149 == 91 then
    A0_148:tradeDestFix(false)
  end
end
function TradeWidget.doesTradeFinish(A0_153)
  local L1_154
  L1_154 = A0_153.work
  L1_154 = L1_154.sourceFix
  if L1_154 == true then
    L1_154 = A0_153.work
    L1_154 = L1_154.destinationFix
    if L1_154 == true then
      L1_154 = true
      return L1_154
    end
  else
    L1_154 = false
    return L1_154
  end
end
