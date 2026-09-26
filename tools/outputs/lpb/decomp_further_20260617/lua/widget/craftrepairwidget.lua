require("/Widget/WidgetBaseClass")
_defineClass("CraftRepairWidget", "WidgetBaseClass")
function CraftRepairWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "chosenSlot"
  L5_5 = "integer8"
  L4_4 = {L5_5, "integer32"}
  L5_5 = "chosenItem"
  L5_5 = {
    "chosenPackage",
    "integer32"
  }
  L1_1._temp = L2_2
  L1_1.chosenItem = 0
  L1_1.focusedSlot = 0
  L1_1.choosing = false
  L1_1.chosenOperation = -1
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  for L4_4 = 1, 8 do
    L5_5 = "Button_MaterialSlot_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.ChooseSlot")
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.ButtonFocused")
    A0_0:setCancelCondition(L5_5)
    A0_0:setControlProperty(L5_5, "IntData.Value0", 0)
    A0_0:setControlProperty(L5_5, "IntData.Value1", 0)
    A0_0:setControlProperty(L5_5, "IntData.Value2", 0)
    A0_0:setControlProperty(L5_5, "IntData.Value3", L4_4)
    A0_0:setControlProperty(L5_5, "CommandParameter", L4_4)
    A0_0:setIcon("IconControl_MaterialSlot_" .. tostring(L4_4), 0)
    A0_0:setHidden("IconControl_MaterialSlot_" .. tostring(L4_4))
    A0_0:setIcon("IconControl_MaterialSlot_" .. tostring(L4_4), 0)
    A0_0:setHidden("IconControl_MaterialSlot_" .. tostring(L4_4))
    A0_0:setVisibility("IconControl_NotEquiped_" .. tostring(L4_4), false)
    A0_0:setVisibility("IconControl_PolishMAX_" .. tostring(L4_4), false)
    A0_0:setVisibility("IconControl_Materia_" .. tostring(L4_4), false)
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = "UILuaCommands.ButtonFocused"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = true
  L5_5 = false
  L1_1(L2_2, L3_3, L4_4, L5_5, 411)
  L4_4 = 2
  if L2_2 == nil then
    L4_4 = A0_0
    L5_5 = "Button_CraftRepairBySub"
    L3_3(L4_4, L5_5, false)
  else
    L4_4 = L2_2
    if L3_3 ~= true then
      L4_4 = A0_0
      L5_5 = "Button_CraftRepairBySub"
      L3_3(L4_4, L5_5, false)
    end
  end
end
function CraftRepairWidget.setInitialData(A0_6, A1_7, A2_8, A3_9, A4_10, A5_11, A6_12, A7_13)
  local L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L16_22, L17_23, L18_24, L19_25, L20_26, L21_27, L22_28
  L8_14.craftMode = A1_7
  L8_14.isEnableRecipe = false
  if A3_9 > 0 and A3_9 ~= nil then
    L11_17 = 3092
    L12_18 = A3_9
    L8_14(L9_15, L10_16, L11_17, L12_18)
    L11_17 = true
    L8_14(L9_15, L10_16, L11_17)
    L11_17 = true
    L8_14(L9_15, L10_16, L11_17)
  else
    L11_17 = false
    L8_14(L9_15, L10_16, L11_17)
    L11_17 = false
    L8_14(L9_15, L10_16, L11_17)
  end
  for L11_17 = 1, 8 do
    L13_19 = A0_6
    L12_18 = A0_6.setReadyMaterialInSlot
    L14_20 = L11_17
    L15_21 = 0
    L12_18(L13_19, L14_20, L15_21)
  end
  if L8_14 == nil then
    return
  end
  if A4_10 ~= nil then
    L11_17 = 8
    L12_18 = 0
    L13_19 = 0
    L14_20 = 0
    L15_21 = 6
    L16_22 = A4_10
    L9_15(L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L16_22, L17_23)
    L11_17 = "IconControl_RepairItemIcon"
    L13_19 = A4_10
    L12_18 = A4_10.getItemIcon
    L22_28 = L12_18(L13_19)
    L9_15(L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L16_22, L17_23, L18_24, L19_25, L20_26, L21_27, L22_28, L12_18(L13_19))
    L11_17 = L10_16
    L11_17 = false
    L12_18 = 0
    L13_19 = 0
    L14_20 = 0
    L15_21 = 0
    L16_22 = L10_16.hasItem
    L16_22 = L16_22(L17_23, L18_24, L19_25)
    if not L16_22 then
      L16_22 = L10_16.hasItem
      L16_22 = L16_22(L17_23, L18_24, L19_25)
      if not L16_22 then
        L16_22 = L10_16.hasItem
        L16_22 = L16_22(L17_23, L18_24, L19_25)
      end
    elseif L16_22 then
      L11_17 = true
    end
    L16_22 = A0_6.setVisibility
    L22_28 = "SlotItem_Maker"
    L22_28 = L19_25(L20_26, L21_27, L22_28, 0, A4_10)
    L16_22(L17_23, L18_24, L19_25, L20_26, L21_27, L22_28, L19_25(L20_26, L21_27, L22_28, 0, A4_10))
    L16_22 = A0_6.setVisibility
    L19_25 = A7_13 == 10000 and L9_15 and L11_17
    L16_22(L17_23, L18_24, L19_25)
    L16_22 = A0_6.setVisibility
    L16_22(L17_23, L18_24, L19_25)
    L16_22 = L8_14.getListPropertyName
    L16_22 = L16_22(L17_23, L18_24)
    L22_28 = A7_13
    L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    L22_28 = "Collapsed"
    L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    if L17_23 then
      L22_28 = 1
      L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    else
      L22_28 = 0
      L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    end
    if L17_23 then
      L22_28 = 1
      L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
      for L20_26 = 1, 27 do
        L22_28 = A4_10
        if L21_27 == true then
          if L12_18 == 0 then
            L12_18 = L20_26
          elseif L13_19 == 0 then
            L13_19 = L20_26
          elseif L14_20 == 0 then
            L14_20 = L20_26
          elseif L15_21 == 0 then
            L15_21 = L20_26
            break
          end
        end
      end
    else
      L22_28 = 0
      L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    end
    if A5_11 ~= nil then
      L22_28 = A5_11
      L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    end
    L22_28 = L12_18
    L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    L22_28 = L13_19
    L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    L22_28 = L14_20
    L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    L22_28 = L15_21
    L17_23(L18_24, L19_25, L20_26, L21_27, L22_28)
    L18_24.repairitem = L19_25
    L18_24.repairinum = L19_25
    for L22_28 = 1, L20_26.repairinum do
      L18_24:findItemSetSlot(L22_28, A0_6.work.repairitem)
    end
    L19_25(L20_26)
  else
    L11_17 = "IconControl_RepairItemIcon"
    L12_18 = 0
    L9_15(L10_16, L11_17, L12_18)
    L11_17 = nil
    L12_18 = "Label_IconBackground"
    L13_19 = "Focusable"
    L14_20 = false
    L9_15(L10_16, L11_17, L12_18, L13_19, L14_20)
    L11_17 = 8
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "catalog"
    L15_21 = 0
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "quality"
    L15_21 = 1
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "name"
    L15_21 = ""
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "icon"
    L15_21 = 0
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "lifemax"
    L15_21 = 0
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "stack"
    L15_21 = ""
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "stackable"
    L15_21 = 0
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "stackCount"
    L15_21 = 1
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "stackMax"
    L15_21 = 0
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L13_19 = 0
    L14_20 = "price"
    L15_21 = ""
    L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
    L11_17 = L8_14
    L12_18 = L9_15
    L10_16(L11_17, L12_18)
  end
end
function CraftRepairWidget.processBeforeShow(A0_29, A1_30)
  if A1_30 ~= true then
    A0_29:setWindowFocus("Button_CraftRepairByMain")
    A0_29:displayHelp(3025, 3026)
  end
  return true
end
function CraftRepairWidget.setButtonEvents(A0_31, A1_32)
  local L2_33
  L2_33 = A0_31._getProperty
  L2_33 = L2_33(A0_31, nil, A1_32, "Command")
  A0_31:setControlCommandCondition(A1_32, L2_33)
  A0_31:setControlCommandCondition(A1_32, "UILuaCommands.ButtonFocused")
  A0_31:setCancelCondition(A1_32)
end
function CraftRepairWidget.setWindowFocus(A0_34, A1_35)
  if A1_35 ~= nil and A1_35 ~= "" then
    A0_34:setLogicalFocus(A1_35)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_34 then
      A0_34:setKeyboardFocusedControl(A1_35)
    end
  end
end
function CraftRepairWidget.openItemListWindow(A0_36)
  local L1_37
  L1_37 = A0_36.getChildWidgetByWindowName
  L1_37 = L1_37(A0_36, "CraftEditWidget")
  if L1_37 == nil then
    desktopWidget:openChildWidget("CraftEditWidget", A0_36, true, false)
  else
    L1_37:setModal(true)
    if A0_36:getSlotData(A0_36.work.chosenSlot) == 0 then
      L1_37:openItemList()
    else
      L1_37:removeItem()
      A0_36:updateSlotIcon(A0_36.work.chosenSlot)
      A0_36:displaySlotItemHelp(A0_36.work.chosenSlot)
    end
    A0_36.work.choosing = true
  end
end
function CraftRepairWidget.countMaterialInSlot(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43, L6_44, L7_45
  L3_41 = 0
  for L7_45 = 1, 8 do
    if A0_38:getSlotData(L7_45) == A1_39 and A0_38:getSlotData(L7_45) == A2_40 then
      L3_41 = L3_41 + 1
    end
  end
  return L3_41
end
function CraftRepairWidget.countEmptySlot(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51
  L1_47 = 0
  for L5_51 = 1, 8 do
    if A0_46:getSlotData(L5_51) == 0 then
      L1_47 = L1_47 + 1
    end
  end
  return L1_47
end
function CraftRepairWidget.clearAllMaterialSlot(A0_52)
  local L1_53, L2_54, L3_55, L4_56, L5_57, L6_58
  for L4_56 = 1, 8 do
    L6_58 = A0_52
    L5_57(L6_58, L4_56)
  end
  if L1_53 ~= nil then
    L2_54(L3_55)
  end
  for L6_58 = 1, L4_56.repairinum do
    L2_54:findItemSetSlot(L6_58, A0_52.work.repairitem)
  end
  L3_55(L4_56)
end
function CraftRepairWidget.clearMaterialSlot(A0_59, A1_60)
  local L2_61
  L2_61 = 0
  if A1_60 == nil then
    L2_61 = A0_59.work.chosenSlot
  else
    L2_61 = A1_60
  end
  if A0_59:getSlotData(L2_61) == 0 then
    return false
  else
    A0_59:setSlotData(L2_61, 0, 0)
    if A0_59:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
      A0_59:getChildWidgetByWindowName("CraftEditWidget"):setDummyItem(L2_61 + 8)
    end
  end
  A0_59:updateSlotIcon(A1_60)
  return true
end
function CraftRepairWidget.setReadyMaterialInSlot(A0_62, A1_63, A2_64)
  A0_62:_setProperty(nil, A0_62:getSlotName(A1_63), "IntData.Value2", A2_64)
  if A0_62:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    A0_62:getChildWidgetByWindowName("CraftEditWidget"):setReadyItem(A1_63, A2_64)
  end
end
function CraftRepairWidget.getSlotName(A0_65, A1_66)
  if A1_66 > 0 then
    return "Button_MaterialSlot_" .. tostring(A1_66)
  end
end
function CraftRepairWidget.getSlotData(A0_67, A1_68)
  local L2_69, L3_70, L4_71, L5_72
  L2_69 = 0
  L3_70 = 0
  L4_71 = 0
  if A1_68 == nil or A1_68 <= 0 or A1_68 > 8 then
  else
    L5_72 = A0_67.getSlotName
    L5_72 = L5_72(A0_67, A1_68)
    L2_69 = A0_67:getControlProperty(L5_72, "IntData.Value0")
    L3_70 = A0_67:getControlProperty(L5_72, "IntData.Value1")
    L4_71 = A0_67:getControlProperty(L5_72, "IntData.Value2")
  end
  L5_72 = L2_69
  return L5_72, L3_70, L4_71
end
function CraftRepairWidget.setSlotData(A0_73, A1_74, A2_75, A3_76)
  local L4_77
  if A1_74 == nil or A1_74 <= 0 or A1_74 > 8 then
    L4_77 = false
    return L4_77
  end
  L4_77 = A0_73.getSlotName
  L4_77 = L4_77(A0_73, A1_74)
  A0_73:setControlProperty(L4_77, "IntData.Value0", A2_75)
  A0_73:setControlProperty(L4_77, "IntData.Value1", A3_76)
  A0_73:updateSlotIcon(A1_74)
  return true
end
function CraftRepairWidget.updateSlotIcon(A0_78, A1_79)
  local L2_80, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88
  L3_81 = A0_78
  L2_80 = A0_78.getChildWidgetByWindowName
  L4_82 = "CraftEditWidget"
  L2_80 = L2_80(L3_81, L4_82)
  if L2_80 == nil then
    return
  end
  L3_81 = 1
  L4_82 = 8
  if A1_79 ~= nil then
    L3_81 = A1_79
    L4_82 = A1_79
  end
  for L8_86 = L3_81, L4_82 do
    L9_87 = "IconControl_MaterialSlot_"
    L10_88 = tostring
    L10_88 = L10_88(L8_86)
    L9_87 = L9_87 .. L10_88
    L10_88 = 0
    if A0_78:getSlotData(L8_86) ~= 0 then
      L10_88 = L2_80:getSlotIcon(L8_86 + 8)
    elseif A0_78:getSlotData(L8_86) ~= 0 then
      L10_88 = L2_80:getSlotIcon(L8_86)
    end
    if L10_88 == 0 then
      A0_78:setHidden(L9_87)
    else
      A0_78:setIcon(L9_87, L10_88)
      A0_78:setVisibility(L9_87, true)
    end
  end
  return
end
function CraftRepairWidget.displaySlotItemHelp(A0_89, A1_90)
  if A1_90 == nil then
    A1_90 = A0_89.work.chosenSlot
  end
  if A0_89:getSlotData(A1_90) == 0 and A0_89:getSlotData(A1_90) == 0 then
    A0_89:displayHelp(3047, 3048)
  elseif A0_89:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    if A0_89:getSlotData(A1_90) ~= 0 then
      A0_89:getChildWidgetByWindowName("CraftEditWidget"):displayLeftItemHelp(A1_90 + 8)
    else
      A0_89:getChildWidgetByWindowName("CraftEditWidget"):displayLeftItemHelp(A1_90)
    end
  end
end
function CraftRepairWidget.displayHelp(A0_91, A1_92, A2_93, A3_94)
  if A0_91:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    A0_91:getChildWidgetByWindowName("CraftEditWidget"):displayLeftButtonHelp(A1_92, A2_93)
  end
end
function CraftRepairWidget.processUICommandCancel(A0_95, A1_96, A2_97, A3_98, A4_99)
  if A0_95.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_95.work.chosenOperation ~= -1 then
    return false
  end
  if A2_97 == "Button_CraftRepairCancel" then
    A0_95.work.chosenOperation = 0
    A0_95:setInputEnable(false)
  else
    A0_95:setWindowFocus("Button_CraftRepairCancel")
    A0_95:displayHelp(3029, 3030)
  end
end
function CraftRepairWidget.processUICommandOperate(A0_100, A1_101, A2_102, A3_103, A4_104)
  if A0_100.work.editWidgetOpen ~= 0 then
    return false
  end
  if 0 < A0_100.work.updatecount then
    return false
  end
  if A2_102 == "Button_CraftRepairCancel" then
    A0_100.work.chosenOperation = 0
    A0_100:setInputEnable(false)
    return true
  else
    if A2_102 == "Button_CraftRepairByMain" then
      A0_100.work.chosenOperation = 1
      A0_100.work.lastbutton = 1
    elseif A2_102 == "Button_CraftRepairBySub" then
      A0_100.work.chosenOperation = 2
      A0_100.work.lastbutton = 2
    end
    A0_100:setInputEnable(false)
    return true
  end
end
function CraftRepairWidget.processUICommandDefault(A0_105, A1_106, A2_107, A3_108, A4_109, A5_110)
  local L6_111
  L6_111 = A0_105.work
  L6_111 = L6_111.editWidgetOpen
  if L6_111 ~= 0 then
    L6_111 = false
    return L6_111
  end
  L6_111 = A0_105.work
  L6_111 = L6_111.chosenOperation
  if L6_111 ~= -1 then
    L6_111 = false
    return L6_111
  end
  if A3_108 == "UILuaCommands.ClearSlot" then
    L6_111 = A0_105.clearAllMaterialSlot
    L6_111(A0_105)
    L6_111 = true
    return L6_111
  end
  if A3_108 == "UILuaCommands.ChooseSlot" then
    L6_111 = A0_105.work
    L6_111.chosenSlot = A4_109
    L6_111 = A0_105.openItemListWindow
    L6_111(A0_105)
    L6_111 = true
    return L6_111
  end
  if A3_108 == "UILuaCommands.ButtonFocused" then
    if A2_107 == "Label_IconSelected" then
      L6_111 = A0_105.getChildWidgetByWindowName
      L6_111 = L6_111(A0_105, "CraftEditWidget")
      if L6_111 ~= nil then
        L6_111:displayLeftItemHelp(0)
      end
    elseif A2_107 == "Button_ClearMaterial" then
      L6_111 = A0_105.displayHelp
      L6_111(A0_105, 3023, 3024)
    elseif A2_107 == "Button_CraftRepairByMain" then
      L6_111 = A0_105.displayHelp
      L6_111(A0_105, 3025, 3026)
    elseif A2_107 == "Button_CraftRepairBySub" then
      L6_111 = A0_105.displayHelp
      L6_111(A0_105, 3027, 3028)
    elseif A2_107 == "Button_CraftRepairCancel" then
      L6_111 = A0_105.displayHelp
      L6_111(A0_105, 3029, 3030)
    else
      L6_111 = A0_105.getControlProperty
      L6_111 = L6_111(A0_105, A2_107, "IntData.Value3")
      if L6_111 ~= nil then
        A0_105.work.focusedSlot = L6_111
        A0_105:displaySlotItemHelp(L6_111)
      end
    end
    return
  end
end
function CraftRepairWidget.updatePlayerItem(A0_112, A1_113, A2_114)
  if A0_112:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    A0_112:getChildWidgetByWindowName("CraftEditWidget"):updatePlayerItem(A1_113, A2_114)
  end
  return
end
function CraftRepairWidget.setInitialItems(A0_115, A1_116, A2_117, A3_118, A4_119, A5_120, A6_121, A7_122, A8_123)
  if A1_116 ~= nil then
    A0_115:setReadyMaterialInSlot(1, A1_116)
  end
  if A2_117 ~= nil then
    A0_115:setReadyMaterialInSlot(2, A2_117)
  end
  if A3_118 ~= nil then
    A0_115:setReadyMaterialInSlot(3, A3_118)
  end
  if A4_119 ~= nil then
    A0_115:setReadyMaterialInSlot(4, A4_119)
  end
  if A5_120 ~= nil then
    A0_115:setReadyMaterialInSlot(5, A5_120)
  end
  if A6_121 ~= nil then
    A0_115:setReadyMaterialInSlot(6, A6_121)
  end
  if A7_122 ~= nil then
    A0_115:setReadyMaterialInSlot(7, A7_122)
  end
  if A8_123 ~= nil then
    A0_115:setReadyMaterialInSlot(8, A8_123)
  end
  A0_115:updateSlotIcon()
end
function CraftRepairWidget.setSlotItem(A0_124, A1_125, A2_126, A3_127)
  local L4_128, L5_129, L6_130
  if A3_127 < 0 or A3_127 > 8 then
    L4_128 = false
    return L4_128
  end
  L5_129 = A0_124
  L4_128 = A0_124.getChildWidgetByWindowName
  L6_130 = "CraftEditWidget"
  L4_128 = L4_128(L5_129, L6_130)
  if L4_128 == nil then
    return
  end
  L5_129 = A3_127
  L6_130 = 0
  for _FORV_10_ = A0_124.work.chosenSlot, A0_124.work.chosenSlot + 8 do
    L6_130 = _FORV_10_
    if _FORV_10_ > 8 then
      L6_130 = L6_130 - 8
    end
    if A0_124:getSlotData(L6_130) == 0 then
      A0_124:setSlotData(L6_130, A1_125, A2_126)
      L4_128:setSlotItem(L6_130 + 8)
      L5_129 = L5_129 - 1
    end
    if L5_129 == 0 then
      break
    end
  end
  _FOR_(_FOR_)
end
function CraftRepairWidget.processWaitCallFunction(A0_131)
  local L1_132
  L1_132 = A0_131.work
  L1_132 = L1_132.chosenOperation
  if L1_132 == -1 then
    L1_132 = false
    return L1_132
  else
    L1_132 = true
    return L1_132
  end
end
function CraftRepairWidget.getCraftOperation(A0_133)
  return A0_133.work.chosenOperation
end
function CraftRepairWidget.getCraftItems(A0_134, A1_135)
  if A0_134:getSlotData(A1_135) ~= 0 then
    return A0_134:getSlotData(A1_135)
  elseif A0_134:getSlotData(A1_135) ~= 0 then
    return 0
  else
    return -1
  end
end
function CraftRepairWidget.returnFocus(A0_136)
  if A0_136.work.choosing == true then
    A0_136.work.choosing = false
    if A0_136.work.chosenSlot ~= 0 then
      A0_136:setKeyboardFocusedControl(A0_136:getSlotName(A0_136.work.chosenSlot))
    end
  elseif A0_136.work.lastbutton == 1 then
    A0_136:setKeyboardFocusedControl("Button_CraftRepairByMain")
    A0_136:displayHelp(3025, 3026)
  elseif A0_136.work.lastbutton == 2 then
    A0_136:setKeyboardFocusedControl("Button_CraftRepairBySub")
    A0_136:displayHelp(3027, 3028)
  end
end
function CraftRepairWidget.updateBuffInfo(A0_137)
  local L1_138, L2_139, L3_140, L4_141, L5_142, L6_143
  L1_138 = 0
  L2_139 = desktopWidget
  L2_139 = L2_139.getPlayerStatusSlotLength
  L2_139 = L2_139(L3_140)
  for L6_143 = 1, L2_139 do
    if desktopWidget:getPlayerBufferStatus(L6_143) >= 230002 and desktopWidget:getPlayerBufferStatus(L6_143) <= 230009 then
      L1_138 = desktopWidget:getPlayerBufferStatus(L6_143)
      break
    end
  end
  if L1_138 > 0 then
    L6_143 = true
    L3_140(L4_141, L5_142, L6_143)
    L6_143 = true
    L3_140(L4_141, L5_142, L6_143)
  else
    L6_143 = false
    L3_140(L4_141, L5_142, L6_143)
    L6_143 = false
    L3_140(L4_141, L5_142, L6_143)
  end
end
