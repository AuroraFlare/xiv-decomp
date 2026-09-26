require("/Widget/WidgetBaseClass")
_defineClass("CraftStartWidget", "WidgetBaseClass")
function CraftStartWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "chosenSlot"
  L5_5 = "integer8"
  L4_4 = {L5_5, "integer32"}
  L5_5 = "chosenOperation"
  L5_5 = {
    "focusedSlot",
    "integer8"
  }
  L1_1._temp = L2_2
  L1_1.chosenSlot = 0
  L1_1.focusedSlot = 0
  L1_1.choosing = false
  L1_1.chosenOperation = -1
  L1_1.recipemode = false
  L1_1.historymode = true
  L1_1.historytype = 3
  L1_1.historyget = false
  L1_1.memoget = false
  L1_1(L2_2, L3_3)
  for L4_4 = 1, 8 do
    L5_5 = A0_0.getSlotName
    L5_5 = L5_5(A0_0, L4_4)
    A0_0:setControlProperty(L5_5, "IntData.Value0", 0)
    A0_0:setControlProperty(L5_5, "IntData.Value1", 0)
    A0_0:setControlProperty(L5_5, "IntData.Value2", 0)
    A0_0:setControlProperty(L5_5, "IntData.Value3", L4_4)
    A0_0:setControlProperty(L5_5, "CommandParameter", L4_4)
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.ChooseSlot")
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.ButtonFocused")
    A0_0:setCancelCondition(L5_5)
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
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = true
  L5_5 = false
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 2
  if L2_2 ~= nil then
    L4_4 = L2_2
  elseif L3_3 ~= true then
    L4_4 = A0_0
    L5_5 = "Button_CraftStartBySub"
    L3_3(L4_4, L5_5, false)
  end
end
function CraftStartWidget.setInitialData(A0_6, A1_7, A2_8, A3_9)
  A0_6.work.craftMode = A1_7
  if A1_7 == 1 then
    A0_6:setContent("Button_QuestCraft", 3008)
    A0_6:setEnable("Button_Recipe", false)
  else
    A0_6:setContent("Button_QuestCraft", 3012)
    A0_6:setEnable("Button_Recipe", true)
    if A0_6.work.firsttime == false then
      A0_6.work.historymode = true
      A0_6.work.historytype = 3
    end
  end
  A0_6.work.isEnableRecipe = false
  if A3_9 > 0 and A3_9 ~= nil then
    A0_6:setText("TextBlock_SkillInformation", 3092, A3_9)
    A0_6:setVisibility("Border_LineH", true)
    A0_6:setVisibility("Label_SkillInformation", true)
    A0_6.work.facility = A3_9
  else
    A0_6:setVisibility("Border_LineH", false)
    A0_6:setVisibility("Label_SkillInformation", false)
  end
end
function CraftStartWidget.processBeforeShow(A0_10, A1_11)
  if A1_11 ~= true and A0_10.work.firsttime == false then
    if A0_10.work.craftMode == 1 then
      A0_10:setWindowFocus("Button_CraftStartByMain")
      A0_10:displayHelp(3025, 3026)
    else
      A0_10:setWindowFocus("Button_Recipe")
      A0_10:displayHelp(3021, 3022)
      A0_10.work.firsttime = true
    end
  end
  return true
end
function CraftStartWidget.setButtonEvents(A0_12, A1_13)
  local L2_14
  L2_14 = A0_12._getProperty
  L2_14 = L2_14(A0_12, nil, A1_13, "Command")
  A0_12:setControlCommandCondition(A1_13, L2_14)
  A0_12:setControlCommandCondition(A1_13, "UILuaCommands.ButtonFocused", 5)
  A0_12:setCancelCondition(A1_13)
end
function CraftStartWidget.setWindowFocus(A0_15, A1_16)
  if A1_16 ~= nil and A1_16 ~= "" then
    A0_15:setLogicalFocus(A1_16)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_15 then
      A0_15:setKeyboardFocusedControl(A1_16)
    end
  end
end
function CraftStartWidget.openItemListWindow(A0_17)
  local L1_18
  L1_18 = A0_17.getChildWidgetByWindowName
  L1_18 = L1_18(A0_17, "CraftEditWidget")
  if L1_18 == nil then
  elseif A0_17:getSlotData(A0_17.work.chosenSlot) == 0 then
    L1_18:openItemList()
    A0_17.work.choosing = true
    L1_18:setModal(true)
    desktopWidget:changeFocusedWidget(L1_18, true)
  else
    L1_18:removeItem()
    A0_17:updateSlotIcon(A0_17.work.chosenSlot)
    A0_17:displaySlotItemHelp(A0_17.work.chosenSlot)
  end
end
function CraftStartWidget.countMaterialInSlot(A0_19, A1_20, A2_21)
  local L3_22, L4_23, L5_24, L6_25, L7_26
  L3_22 = 0
  for L7_26 = 1, 8 do
    if A0_19:getSlotData(L7_26) == A1_20 and A0_19:getSlotData(L7_26) == A2_21 then
      L3_22 = L3_22 + 1
    end
  end
  return L3_22
end
function CraftStartWidget.countEmptySlot(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32
  L1_28 = 0
  for L5_32 = 1, 8 do
    if A0_27:getSlotData(L5_32) == 0 then
      L1_28 = L1_28 + 1
    end
  end
  return L1_28
end
function CraftStartWidget.clearAllMaterialSlot(A0_33)
  local L1_34, L2_35, L3_36, L4_37
  for L4_37 = 1, 8 do
    A0_33:clearMaterialSlot(L4_37)
  end
  if L1_34 ~= nil then
    L2_35(L3_36)
  end
end
function CraftStartWidget.clearMaterialSlot(A0_38, A1_39)
  local L2_40
  L2_40 = 0
  if A1_39 == nil then
    L2_40 = A0_38.work.chosenSlot
  else
    L2_40 = A1_39
  end
  if A0_38:getSlotData(L2_40) == 0 then
    return false
  else
    A0_38:setSlotData(L2_40, 0, 0)
    if A0_38:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
      A0_38:getChildWidgetByWindowName("CraftEditWidget"):setDummyItem(L2_40 + 8)
    end
    if A0_38.work.craftMode ~= 1 then
      A0_38.work.historyItem = 0
    end
  end
  A0_38:updateSlotIcon(A1_39)
  return true
end
function CraftStartWidget.setReadyMaterialInSlot(A0_41, A1_42, A2_43)
  if A2_43 == nil then
    return
  end
  A0_41:setControlProperty(A0_41:getSlotName(A1_42), "IntData.Value2", A2_43)
  if A0_41:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    A0_41:getChildWidgetByWindowName("CraftEditWidget"):setReadyItem(A1_42, A2_43)
  end
end
function CraftStartWidget.getSlotName(A0_44, A1_45)
  if A1_45 > 0 then
    return "Button_MaterialSlot_" .. tostring(A1_45)
  end
end
function CraftStartWidget.getSlotData(A0_46, A1_47)
  local L2_48, L3_49, L4_50, L5_51
  L2_48 = 0
  L3_49 = 0
  L4_50 = 0
  if A1_47 == nil or A1_47 <= 0 or A1_47 > 8 then
  else
    L5_51 = A0_46.getSlotName
    L5_51 = L5_51(A0_46, A1_47)
    L2_48 = A0_46:getControlProperty(L5_51, "IntData.Value0")
    L3_49 = A0_46:getControlProperty(L5_51, "IntData.Value1")
    L4_50 = A0_46:getControlProperty(L5_51, "IntData.Value2")
  end
  L5_51 = L2_48
  return L5_51, L3_49, L4_50
end
function CraftStartWidget.setSlotData(A0_52, A1_53, A2_54, A3_55)
  local L4_56
  if A1_53 == nil or A1_53 <= 0 or A1_53 > 8 then
    L4_56 = false
    return L4_56
  end
  L4_56 = A0_52.getSlotName
  L4_56 = L4_56(A0_52, A1_53)
  A0_52:setControlProperty(L4_56, "IntData.Value0", A2_54)
  A0_52:setControlProperty(L4_56, "IntData.Value1", A3_55)
  A0_52:updateSlotIcon(A1_53)
  return true
end
function CraftStartWidget.updateSlotIcon(A0_57, A1_58)
  local L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67, L11_68, L12_69, L13_70, L14_71, L15_72, L16_73, L17_74, L18_75, L19_76, L20_77, L21_78
  L3_60 = A0_57
  L2_59 = A0_57.getChildWidgetByWindowName
  L4_61 = "CraftEditWidget"
  L2_59 = L2_59(L3_60, L4_61)
  if L2_59 == nil then
    L3_60 = false
    return L3_60
  end
  L3_60 = 1
  L4_61 = 8
  if A1_58 ~= nil then
    L3_60 = A1_58
    L4_61 = A1_58
  end
  for L8_65 = L3_60, L4_61 do
    L9_66 = "IconControl_MaterialSlot_"
    L10_67 = tostring
    L11_68 = L8_65
    L10_67 = L10_67(L11_68)
    L9_66 = L9_66 .. L10_67
    L10_67 = 0
    L12_69 = A0_57
    L11_68 = A0_57.getSlotData
    L13_70 = L8_65
    L13_70 = L11_68(L12_69, L13_70)
    L14_71 = false
    L15_72 = false
    L16_73 = false
    L17_74 = false
    L18_75 = false
    L19_76 = worldMaster
    L20_77 = L19_76
    L19_76 = L19_76._getMyPlayer
    L19_76 = L19_76(L20_77)
    L21_78 = L19_76
    L20_77 = L19_76.hasItem
    L20_77 = L20_77(L21_78, 101, 2001001)
    if not L20_77 then
      L21_78 = L19_76
      L20_77 = L19_76.hasItem
      L20_77 = L20_77(L21_78, 101, 2001002)
      if not L20_77 then
        L21_78 = L19_76
        L20_77 = L19_76.hasItem
        L20_77 = L20_77(L21_78, 101, 2001003)
      end
    elseif L20_77 then
      L18_75 = true
    end
    if L11_68 ~= 0 then
      L21_78 = L2_59
      L20_77 = L2_59.getSlotIcon
      L20_77 = L20_77(L21_78, L8_65 + 8)
      L10_67 = L20_77
      L20_77 = worldMaster
      L21_78 = L20_77
      L20_77 = L20_77._getMyPlayer
      L20_77 = L20_77(L21_78)
      L21_78 = L20_77._getItem
      L21_78 = L21_78(L20_77, L11_68, L12_69)
      if L21_78 ~= nil then
        if L21_78:isEquipment() then
          if L21_78:getNormalItemFitness() == 10000 then
            L15_72 = true
          end
          L14_71 = desktopWidget:cantEquipBadge(L2_59, "SlotItem_Maker", A1_58, L21_78)
        end
        L16_73 = L21_78:getMaterializePermission()
        if 0 < desktopWidget:getItemMateriaAttachInfo(L21_78) then
          L17_74 = true
        end
      end
    elseif L13_70 ~= 0 then
      L21_78 = L2_59
      L20_77 = L2_59.getSlotIcon
      L20_77 = L20_77(L21_78, L8_65)
      L10_67 = L20_77
    end
    if L10_67 == 0 then
      L21_78 = A0_57
      L20_77 = A0_57.setHidden
      L20_77(L21_78, L9_66)
      L21_78 = A0_57
      L20_77 = A0_57.setVisibility
      L20_77(L21_78, "IconControl_NotEquiped_" .. tostring(L8_65), false)
      L21_78 = A0_57
      L20_77 = A0_57.setVisibility
      L20_77(L21_78, "IconControl_PolishMAX_" .. tostring(L8_65), false)
      L21_78 = A0_57
      L20_77 = A0_57.setVisibility
      L20_77(L21_78, "IconControl_Materia_" .. tostring(L8_65), false)
    else
      L21_78 = A0_57
      L20_77 = A0_57.setIcon
      L20_77(L21_78, L9_66, L10_67)
      L21_78 = A0_57
      L20_77 = A0_57.setVisibility
      L20_77(L21_78, L9_66, true)
      L21_78 = A0_57
      L20_77 = A0_57.setVisibility
      L20_77(L21_78, "IconControl_NotEquiped_" .. tostring(L8_65), L14_71)
      L21_78 = A0_57
      L20_77 = A0_57.setVisibility
      L20_77(L21_78, "IconControl_PolishMAX_" .. tostring(L8_65), L15_72 and L16_73 and L18_75)
      L21_78 = A0_57
      L20_77 = A0_57.setVisibility
      L20_77(L21_78, "IconControl_Materia_" .. tostring(L8_65), L17_74)
    end
  end
  return L5_62
end
function CraftStartWidget.displaySlotItemHelp(A0_79, A1_80)
  if A1_80 == nil then
    A1_80 = A0_79.work.chosenSlot
  end
  if A0_79:getSlotData(A1_80) == 0 and A0_79:getSlotData(A1_80) == 0 then
    A0_79:displayHelp(3031, 3032)
  elseif A0_79:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    if A0_79:getSlotData(A1_80) ~= 0 then
      A0_79:getChildWidgetByWindowName("CraftEditWidget"):displayLeftItemHelp(A1_80 + 8)
    else
      A0_79:getChildWidgetByWindowName("CraftEditWidget"):displayLeftItemHelp(A1_80)
    end
  end
end
function CraftStartWidget.displayHelp(A0_81, A1_82, A2_83)
  if A0_81:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    A0_81:getChildWidgetByWindowName("CraftEditWidget"):displayLeftButtonHelp(A1_82, A2_83)
  end
end
function CraftStartWidget.processUICommandCancel(A0_84, A1_85, A2_86, A3_87, A4_88)
  if A0_84.work.editWidgetMode ~= 0 then
    return false
  end
  if A0_84.work.chosenOperation ~= -1 then
    return false
  end
  if A0_84.work.recipemode == true then
    return false
  end
  if A2_86 == "Button_CraftCancel" then
    A0_84.work.chosenOperation = 0
    A0_84:setInputEnable(false)
  else
    A0_84:setWindowFocus("Button_CraftCancel")
    A0_84:displayHelp(3029, 3030)
  end
end
function CraftStartWidget.processUICommandDefault(A0_89, A1_90, A2_91, A3_92, A4_93, A5_94)
  local L6_95
  L6_95 = A0_89.work
  L6_95 = L6_95.editWidgetMode
  if L6_95 ~= 0 then
    L6_95 = false
    return L6_95
  end
  L6_95 = A0_89.work
  L6_95 = L6_95.chosenOperation
  if L6_95 ~= -1 then
    L6_95 = false
    return L6_95
  end
  L6_95 = A0_89.work
  L6_95 = L6_95.recipemode
  if L6_95 == true then
    L6_95 = false
    return L6_95
  end
  if A3_92 == "UILuaCommands.ChooseSlot" then
    L6_95 = A0_89.work
    L6_95.chosenSlot = A4_93
    L6_95 = A0_89.openItemListWindow
    L6_95(A0_89)
    L6_95 = true
    return L6_95
  end
  if A3_92 == "UILuaCommands.Quest" then
    L6_95 = A0_89.work
    L6_95.chosenOperation = 3
    L6_95 = A0_89.setInputEnable
    L6_95(A0_89, false)
    L6_95 = true
    return L6_95
  end
  if A3_92 == "UILuaCommands.Recipe" then
    L6_95 = A0_89.work
    L6_95 = L6_95.craftMode
    if L6_95 ~= 1 then
      L6_95 = A0_89.work
      L6_95.lastbutton = 3
      L6_95 = A0_89.work
      L6_95.historymode = true
      L6_95 = A0_89.work
      L6_95.recipemode = false
      L6_95 = A0_89.getChildWidgetByWindowName
      L6_95 = L6_95(A0_89, "CraftEditWidget")
      if A0_89.work.historytype == 3 then
        if A0_89.work.historyget == false then
          A0_89.work.chosenOperation = 7
          A0_89.work.chosenRecipe = 0
        else
          L6_95:openHistoryList(nil, 3)
          A0_89.work.choosing = true
        end
      elseif A0_89.work.memoget == false then
        A0_89.work.chosenOperation = 8
        A0_89.work.chosenRecipe = 0
        A0_89.work.historymode = true
      else
        L6_95:openHistoryList(nil, 4)
        A0_89.work.choosing = true
      end
      A0_89:setInputEnable(false)
    end
  end
  if A3_92 == "UILuaCommands.ClearSlot" then
    L6_95 = A0_89.clearAllMaterialSlot
    L6_95(A0_89)
    L6_95 = A0_89.work
    L6_95 = L6_95.craftMode
    if L6_95 ~= 1 then
      L6_95 = A0_89.work
      L6_95.historyItem = 0
    end
    L6_95 = true
    return L6_95
  end
  if A3_92 == "UILuaCommands.CraftOperate" then
    if A2_91 == "Button_CraftCancel" then
      L6_95 = A0_89.work
      L6_95.chosenOperation = 0
      L6_95 = A0_89.setInputEnable
      L6_95(A0_89, false)
      L6_95 = true
      return L6_95
    else
      if A2_91 == "Button_CraftStartByMain" then
        L6_95 = A0_89.work
        L6_95.chosenOperation = 1
        L6_95 = A0_89.work
        L6_95.lastbutton = 1
        L6_95 = A0_89.work
        L6_95.recipemode = false
        L6_95 = A0_89.work
        L6_95.historymode = false
        L6_95 = A0_89.work
        L6_95.editWidgetMode = 1
      elseif A2_91 == "Button_CraftStartBySub" then
        L6_95 = A0_89.work
        L6_95.chosenOperation = 2
        L6_95 = A0_89.work
        L6_95.lastbutton = 2
        L6_95 = A0_89.work
        L6_95.recipemode = false
        L6_95 = A0_89.work
        L6_95.historymode = false
        L6_95 = A0_89.work
        L6_95.editWidgetMode = 2
      end
      L6_95 = A0_89.setInputEnable
      L6_95(A0_89, false)
      L6_95 = true
      return L6_95
    end
  end
  if A3_92 == "UILuaCommands.ButtonFocused" then
    L6_95 = A0_89.work
    L6_95.focusedSlot = 0
    if A2_91 == "Button_QuestCraft" then
      L6_95 = A0_89.work
      L6_95 = L6_95.craftMode
      if L6_95 == 1 then
        L6_95 = A0_89.displayHelp
        L6_95(A0_89, 3009, 3010)
      else
        L6_95 = A0_89.displayHelp
        L6_95(A0_89, 3019, 3020)
      end
    elseif A2_91 == "Button_Recipe" then
      L6_95 = A0_89.displayHelp
      L6_95(A0_89, 3021, 3022)
    elseif A2_91 == "Button_ClearMaterial" then
      L6_95 = A0_89.displayHelp
      L6_95(A0_89, 3023, 3024)
    elseif A2_91 == "Button_CraftStartByMain" then
      L6_95 = A0_89.displayHelp
      L6_95(A0_89, 3025, 3026)
    elseif A2_91 == "Button_CraftStartBySub" then
      L6_95 = A0_89.displayHelp
      L6_95(A0_89, 3027, 3028)
    elseif A2_91 == "Button_CraftCancel" then
      L6_95 = A0_89.displayHelp
      L6_95(A0_89, 3029, 3030)
    else
      L6_95 = A0_89.getControlProperty
      L6_95 = L6_95(A0_89, A2_91, "IntData.Value3")
      if L6_95 ~= nil then
        A0_89.work.focusedSlot = L6_95
        A0_89:displaySlotItemHelp(L6_95)
      end
    end
    return
  end
end
function CraftStartWidget.updatePlayerItem(A0_96, A1_97, A2_98)
  if A0_96:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    A0_96:getChildWidgetByWindowName("CraftEditWidget"):updatePlayerItem(A1_97, A2_98)
  end
  return
end
function CraftStartWidget.setInitialItems(A0_99, A1_100, A2_101, A3_102, A4_103, A5_104, A6_105, A7_106, A8_107)
  local L9_108, L10_109, L11_110, L12_111, L13_112, L14_113, L15_114, L16_115, L17_116, L18_117
  L9_108 = A0_99.work
  L9_108 = L9_108.craftMode
  if L9_108 == 1 then
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 1
    L12_111 = A1_100
    L9_108(L10_109, L11_110, L12_111)
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 2
    L12_111 = A2_101
    L9_108(L10_109, L11_110, L12_111)
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 3
    L12_111 = A3_102
    L9_108(L10_109, L11_110, L12_111)
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 4
    L12_111 = A4_103
    L9_108(L10_109, L11_110, L12_111)
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 5
    L12_111 = A5_104
    L9_108(L10_109, L11_110, L12_111)
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 6
    L12_111 = A6_105
    L9_108(L10_109, L11_110, L12_111)
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 7
    L12_111 = A7_106
    L9_108(L10_109, L11_110, L12_111)
    L10_109 = A0_99
    L9_108 = A0_99.setReadyMaterialInSlot
    L11_110 = 8
    L12_111 = A8_107
    L9_108(L10_109, L11_110, L12_111)
  else
    L9_108 = A1_100 + A2_101
    L9_108 = L9_108 + A3_102
    L9_108 = L9_108 + A4_103
    L9_108 = L9_108 + A5_104
    L9_108 = L9_108 + A6_105
    L9_108 = L9_108 + A7_106
    L9_108 = L9_108 + A8_107
    if L9_108 == 0 then
      L10_109 = A0_99
      L9_108 = A0_99.setInputEnable
      L11_110 = true
      L9_108(L10_109, L11_110)
    else
      L10_109 = A0_99
      L9_108 = A0_99.getChildWidgetByWindowName
      L11_110 = "CraftEditWidget"
      L9_108 = L9_108(L10_109, L11_110)
      L11_110 = L9_108
      L10_109 = L9_108.getText
      L12_111 = "TextBlock_ItemName"
      L10_109 = L10_109(L11_110, L12_111)
      L12_111 = L9_108
      L11_110 = L9_108.getIcon
      L11_110 = L11_110(L12_111, L13_112)
      L12_111 = A0_99.clearReadyItemData
      L12_111(L13_112)
      L12_111 = A0_99.setReadyItemData
      L16_115 = A3_102
      L17_116 = A4_103
      L18_117 = A5_104
      L12_111 = L12_111(L13_112, L14_113, L15_114, L16_115, L17_116, L18_117, A6_105, A7_106, A8_107)
      if L12_111 == true then
        L12_111 = A0_99.setRecipeToSlot
        L12_111(L13_112, L14_113, L15_114)
        L12_111 = 1
        for L16_115 = 1, L14_113.items do
          L17_116 = "Grid_MaterialSlot_"
          L18_117 = tostring
          L18_117 = L18_117(L16_115)
          L17_116 = L17_116 .. L18_117
          L18_117 = A0_99.getUserWorkInt
          L18_117 = L18_117(A0_99, 1, nil, L17_116)
          while 0 < A0_99:getUserWorkInt(2, nil, L17_116) do
            A0_99:setRecipeToSlot(L12_111, L18_117)
            L12_111 = L12_111 + 1
          end
        end
        L16_115 = -1
        L13_112(L14_113, L15_114, L16_115)
        L13_112.chosenOperation = 1
        L13_112(L14_113)
        if L14_113 == 3 then
        else
        end
        if L13_112 ~= "" then
          L16_115 = L13_112
          L17_116 = A0_99.work
          L17_116 = L17_116.chosenRecipe
          L17_116 = L17_116 - 1
          L18_117 = "catalog"
          L15_114.historyItem = L14_113
        else
          L14_113.historyItem = 0
        end
        return
      else
        L12_111 = "TabItem_5_Maker"
        if L13_112 == true then
          if L13_112 == 3 then
            L12_111 = "TabItem_3_Maker"
          else
            L12_111 = "TabItem_4_Maker"
          end
        end
        L16_115 = A0_99.work
        L16_115 = L16_115.chosenRecipe
        L16_115 = L16_115 - 1
        L17_116 = "catalog"
        L16_115 = "CraftRecipeWidget"
        L17_116 = A0_99
        L18_117 = true
        if L14_113 == true then
          L16_115 = L9_108
          L15_114(L16_115)
        else
          L16_115 = L9_108
          L15_114(L16_115)
        end
      end
    end
    L9_108 = A0_99.work
    L9_108.chosenOperation = -1
  end
  L10_109 = A0_99
  L9_108 = A0_99.updateSlotIcon
  L9_108(L10_109)
end
function CraftStartWidget.setSlotItem(A0_118, A1_119, A2_120, A3_121)
  local L4_122, L5_123, L6_124
  if A3_121 < 0 or A3_121 > 8 then
    return
  end
  L5_123 = A0_118
  L4_122 = A0_118.getChildWidgetByWindowName
  L6_124 = "CraftEditWidget"
  L4_122 = L4_122(L5_123, L6_124)
  if L4_122 == nil then
    return
  end
  L5_123 = A3_121
  L6_124 = 0
  for _FORV_10_ = A0_118.work.chosenSlot, A0_118.work.chosenSlot + 8 do
    L6_124 = _FORV_10_
    if _FORV_10_ > 8 then
      L6_124 = L6_124 - 8
    end
    if A0_118:getSlotData(L6_124) == 0 then
      A0_118:setSlotData(L6_124, A1_119, A2_120)
      L4_122:setSlotItem(L6_124 + 8)
      L5_123 = L5_123 - 1
    end
    if L5_123 == 0 then
      break
    end
  end
  _FOR_(_FOR_)
end
function CraftStartWidget.processWaitCallFunction(A0_125)
  local L1_126
  L1_126 = A0_125.work
  L1_126 = L1_126.chosenOperation
  if L1_126 == -1 then
    L1_126 = false
    return L1_126
  else
    L1_126 = true
    return L1_126
  end
end
function CraftStartWidget.getCraftOperation(A0_127)
  local L1_128
  L1_128 = A0_127.work
  L1_128 = L1_128.chosenOperation
  A0_127.work.chosenOperation = -1
  return L1_128, A0_127.work.chosenRecipe
end
function CraftStartWidget.getCraftItems(A0_129, A1_130)
  if A0_129:getSlotData(A1_130) ~= 0 then
    return A0_129:getSlotData(A1_130)
  elseif A0_129:getSlotData(A1_130) ~= 0 then
    return 0
  else
    return -1
  end
end
function CraftStartWidget.setRecipeList(A0_131, A1_132, A2_133, A3_134, A4_135, A5_136, A6_137, A7_138, A8_139)
  local L9_140, L10_141
  L10_141 = A0_131
  L9_140 = A0_131.getChildWidgetByWindowName
  L9_140 = L9_140(L10_141, "CraftEditWidget")
  L10_141 = A0_131.work
  L10_141.chosenOperation = -1
  L10_141 = A0_131.work
  L10_141.chosenRecipe = 0
  L10_141 = A0_131.work
  L10_141 = L10_141.historymode
  if L10_141 == true then
    L10_141 = A0_131.work
    L10_141 = L10_141.historytype
    if L10_141 == 3 then
      L10_141 = A0_131.work
      L10_141 = L10_141.historyget
      if L10_141 == false then
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 0, 0, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 1, A1_132, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 2, A2_133, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 3, A3_134, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 4, A4_135, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 5, A5_136, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 6, A6_137, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 7, A7_138, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 8, A8_139, 3)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, -1, -1, 3)
        L10_141 = A0_131.work
        L10_141.historyget = true
      end
      L10_141 = L9_140.openHistoryList
      L10_141(L9_140, nil, 3)
    else
      L10_141 = A0_131.work
      L10_141 = L10_141.memoget
      if L10_141 == false then
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 0, 0, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 1, A1_132, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 2, A2_133, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 3, A3_134, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 4, A4_135, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 5, A5_136, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 6, A6_137, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 7, A7_138, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, 8, A8_139, 4)
        L10_141 = L9_140.makeHistoryList
        L10_141(L9_140, -1, -1, 4)
        L10_141 = A0_131.work
        L10_141.memoget = true
      end
      L10_141 = L9_140.openHistoryList
      L10_141(L9_140, nil, 4)
    end
    L10_141 = A0_131.work
    L10_141.chosenRecipe = 0
    L10_141 = A0_131.work
    L10_141.chosenOperation = 7
  else
    L10_141 = A0_131.work
    L10_141 = L10_141.recipemode
    if L10_141 == false then
      L10_141 = A0_131.work
      L10_141 = L10_141.historyItem
      if L10_141 ~= 0 then
        L10_141 = A0_131.work
        L10_141.recipemode = true
        L10_141 = 0
        if A1_132 ~= nil and A0_131.work.historyItem == A1_132 then
          L10_141 = 1
        end
        if A2_133 ~= nil and A0_131.work.historyItem == A2_133 then
          L10_141 = 2
        end
        if A3_134 ~= nil and A0_131.work.historyItem == A3_134 then
          L10_141 = 3
        end
        if A4_135 ~= nil and A0_131.work.historyItem == A4_135 then
          L10_141 = 4
        end
        if A5_136 ~= nil and A0_131.work.historyItem == A5_136 then
          L10_141 = 5
        end
        if A6_137 ~= nil and A0_131.work.historyItem == A6_137 then
          L10_141 = 6
        end
        if A7_138 ~= nil and A0_131.work.historyItem == A7_138 then
          L10_141 = 7
        end
        if A8_139 ~= nil and A0_131.work.historyItem == A8_139 then
          L10_141 = 8
        end
        if L10_141 ~= 0 then
          A0_131:setRecipeIndex(L10_141, 5)
          A0_131.work.skiprecipelist = true
        else
          A0_131.work.skiprecipelist = false
          A0_131.work.recipemode = true
          L9_140:makeRecipeList(0)
          L9_140:makeRecipeList(1, A1_132)
          L9_140:makeRecipeList(2, A2_133)
          L9_140:makeRecipeList(3, A3_134)
          L9_140:makeRecipeList(4, A4_135)
          L9_140:makeRecipeList(5, A5_136)
          L9_140:makeRecipeList(6, A6_137)
          L9_140:makeRecipeList(7, A7_138)
          L9_140:makeRecipeList(8, A8_139)
          L9_140:makeRecipeList(-1)
          L9_140:openRecipeList()
        end
      elseif A1_132 ~= nil and A2_133 == nil then
        L10_141 = A0_131.work
        L10_141.recipemode = true
        L10_141 = A0_131.setRecipeIndex
        L10_141(A0_131, 1, 5)
        L10_141 = A0_131.work
        L10_141.skiprecipelist = true
      else
        L10_141 = A0_131.work
        L10_141.skiprecipelist = false
        L10_141 = A0_131.work
        L10_141.recipemode = true
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 0)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 1, A1_132)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 2, A2_133)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 3, A3_134)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 4, A4_135)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 5, A5_136)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 6, A6_137)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 7, A7_138)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, 8, A8_139)
        L10_141 = L9_140.makeRecipeList
        L10_141(L9_140, -1)
        L10_141 = L9_140.openRecipeList
        L10_141(L9_140)
      end
    else
      L10_141 = A0_131.work
      L10_141 = L10_141.skiprecipelist
      if L10_141 == false then
        L10_141 = L9_140.openRecipeList
        L10_141(L9_140, true)
      else
        L10_141 = A0_131.setRecipeIndex
        L10_141(A0_131, 0, 5)
      end
    end
  end
end
function CraftStartWidget.setRecipeIndex(A0_142, A1_143, A2_144)
  if A2_144 == 5 then
    A0_142.work.chosenRecipe = A1_143
    A0_142.work.chosenOperation = 4
    A0_142.work.historymode = false
  elseif A2_144 == 3 then
    if A1_143 == 0 then
      A0_142:setWindowFocus("Button_Recipe")
      A0_142:displayHelp(3021, 3022)
      A0_142.work.choosing = false
      A0_142.work.historymode = false
      A0_142.work.historytype = 3
    else
      A0_142.work.chosenRecipe = A1_143
      A0_142.work.chosenOperation = 7
      A0_142.work.historymode = true
      A0_142.work.historytype = 3
    end
  elseif A2_144 == 4 then
    if A1_143 == 0 then
      A0_142:setWindowFocus("Button_Recipe")
      A0_142:displayHelp(3021, 3022)
      A0_142.work.choosing = false
      A0_142.work.historymode = false
      A0_142.work.historytype = 4
    else
      A0_142.work.chosenRecipe = A1_143
      A0_142.work.chosenOperation = 8
      A0_142.work.historymode = true
      A0_142.work.historytype = 4
    end
  end
end
function CraftStartWidget.setListRequest(A0_145, A1_146)
  local L2_147
  if A1_146 == 4 then
    L2_147 = A0_145.work
    L2_147.chosenRecipe = 0
    L2_147 = A0_145.work
    L2_147.chosenOperation = 8
    L2_147 = A0_145.work
    L2_147.historymode = true
    L2_147 = A0_145.work
    L2_147.historytype = 4
  end
end
function CraftStartWidget.setDetailRequest(A0_148)
  local L1_149
  L1_149 = A0_148.work
  L1_149 = L1_149.historytype
  if L1_149 == 3 then
    L1_149 = A0_148.work
    L1_149.chosenOperation = 9
  else
    L1_149 = A0_148.work
    L1_149.chosenOperation = 10
  end
end
function CraftStartWidget.setRecipeToSlot(A0_150, A1_151, A2_152)
  if A1_151 == 0 then
    A0_150:clearAllMaterialSlot()
    A0_150:getChildWidgetByWindowName("CraftEditWidget"):setInputEnable(false)
    A0_150:setInputEnable(false)
  elseif A1_151 == -1 then
    A0_150:updateSlotIcon()
    A0_150.work.historymode = false
    A0_150:getChildWidgetByWindowName("CraftEditWidget"):gotoParent()
    A0_150:setWindowFocus("Button_CraftStartByMain")
    A0_150:displayHelp(3025, 3026)
  else
    A0_150:getChildWidgetByWindowName("CraftEditWidget"):findItemSetSlot(A1_151, A2_152)
  end
end
function CraftStartWidget.getRecipeIndex(A0_153)
  local L1_154
  L1_154 = A0_153.work
  L1_154 = L1_154.chosenRecipe
  if L1_154 == 0 then
    L1_154 = A0_153.work
    L1_154.recipemode = false
  end
  L1_154 = A0_153.work
  L1_154 = L1_154.chosenRecipe
  return L1_154
end
function CraftStartWidget.setRecipeOperation(A0_155, A1_156)
  A0_155.work.chosenOperation = A1_156
  if A0_155:getChildWidgetByWindowName("CraftRecipeWidget") ~= nil then
    A0_155:getChildWidgetByWindowName("CraftRecipeWidget"):setModal(false)
  end
  if A0_155:getChildWidgetByWindowName("CraftEditWidget") ~= nil then
    if A0_155.work.skiprecipelist == true then
      A0_155:returnFocus()
    else
      A0_155:getChildWidgetByWindowName("CraftEditWidget"):closeRecipeDetail()
    end
  end
  desktopWidget:closeChildWidget("CraftRecipeWidget", A0_155)
end
function CraftStartWidget.getRecipeDecision(A0_157)
  local L1_158
  L1_158 = A0_157.work
  L1_158 = L1_158.recipemode
  if L1_158 == true then
    L1_158 = A0_157.work
    L1_158 = L1_158.chosenOperation
    if L1_158 == 1 then
      L1_158 = true
      return L1_158
    else
      L1_158 = false
      return L1_158
    end
  else
    L1_158 = false
    return L1_158
  end
end
function CraftStartWidget.isRecipeWidgetOpen(A0_159)
  return (A0_159:getChildWidgetByWindowName("CraftRecipeWidget"))
end
function CraftStartWidget.returnFocus(A0_160)
  A0_160:setInputEnable(true)
  if A0_160.work.choosing == true then
    A0_160.work.choosing = false
    if A0_160.work.chosenSlot ~= 0 then
      A0_160:setKeyboardFocusedControl(A0_160:getSlotName(A0_160.work.chosenSlot))
    end
  elseif A0_160.work.lastbutton == 1 then
    A0_160:setKeyboardFocusedControl("Button_CraftStartByMain")
    A0_160:displayHelp(3025, 3026)
  elseif A0_160.work.lastbutton == 2 then
    A0_160:setKeyboardFocusedControl("Button_CraftStartBySub")
    A0_160:displayHelp(3027, 3028)
  elseif A0_160.work.lastbutton == 3 then
    A0_160:setKeyboardFocusedControl("Button_Recipe")
    A0_160:displayHelp(3021, 3022)
  end
end
function CraftStartWidget.continue(A0_161)
  A0_161.work.chosenOperation = -1
  if A0_161.work.historymode == true then
    A0_161:getChildWidgetByWindowName("CraftEditWidget"):openHistoryList(true, A0_161.work.historytype, A0_161.work.chosenRecipe)
  else
    A0_161.work.recipemode = false
    A0_161.work.editWidgetMode = 0
    A0_161:setInputEnable(true)
  end
end
function CraftStartWidget.continueCraftEdit(A0_162)
  A0_162.work.chosenOperation = -1
  if A0_162.work.historymode == true then
    A0_162:getChildWidgetByWindowName("CraftEditWidget"):closeRecipe()
    A0_162:getChildWidgetByWindowName("CraftEditWidget"):openHistoryList(true, A0_162.work.historytype, A0_162.work.chosenRecipe)
  end
end
function CraftStartWidget.updateBuffInfo(A0_163)
  local L1_164, L2_165, L3_166, L4_167, L5_168, L6_169
  L1_164 = 0
  L2_165 = desktopWidget
  L2_165 = L2_165.getPlayerStatusSlotLength
  L2_165 = L2_165(L3_166)
  for L6_169 = 1, L2_165 do
    if desktopWidget:getPlayerBufferStatus(L6_169) >= 230002 and desktopWidget:getPlayerBufferStatus(L6_169) <= 230009 then
      L1_164 = desktopWidget:getPlayerBufferStatus(L6_169)
      break
    end
  end
  if L1_164 > 0 then
    L6_169 = true
    L3_166(L4_167, L5_168, L6_169)
    L6_169 = true
    L3_166(L4_167, L5_168, L6_169)
  else
    L6_169 = false
    L3_166(L4_167, L5_168, L6_169)
    L6_169 = false
    L3_166(L4_167, L5_168, L6_169)
    L3_166.facility = 0
  end
end
function CraftStartWidget.countMyItem(A0_170, A1_171)
  local L2_172, L3_173, L4_174, L5_175, L6_176, L7_177, L8_178, L9_179
  L2_172 = worldMaster
  L3_173 = L2_172
  L2_172 = L2_172._getMyPlayer
  L2_172 = L2_172(L3_173)
  L4_174 = L2_172
  L3_173 = L2_172._getItemPackageCapacity
  L5_175 = 1
  L3_173 = L3_173(L4_174, L5_175)
  L5_175 = L2_172
  L4_174 = L2_172._getItemPackageFreeSpace
  L4_174 = L4_174(L5_175, L6_176)
  L5_175 = 0
  for L9_179 = 1, L3_173 - L4_174 do
    if A0_170:getCraftableItemData(1, L9_179) == A1_171 then
      L5_175 = L5_175 + A0_170:getCraftableItemData(1, L9_179)
    end
  end
  return L5_175
end
function CraftStartWidget.getCraftableItemData(A0_180, A1_181, A2_182)
  local L3_183, L4_184, L5_185
  L3_183 = worldMaster
  L4_184 = L3_183
  L3_183 = L3_183._getMyPlayer
  L3_183 = L3_183(L4_184)
  L4_184 = L3_183
  L3_183 = L3_183._getItem
  L5_185 = A1_181
  L3_183 = L3_183(L4_184, L5_185, A2_182)
  L4_184 = 0
  L5_185 = 0
  if L3_183 ~= nil and not L3_183:_isEquipping() then
    L4_184 = L3_183:_getCatalogID()
    if L3_183:_isStackable() then
      L5_185 = L3_183:_countStack()
    else
      L5_185 = 1
    end
  end
  return L4_184, L5_185
end
function CraftStartWidget.clearReadyItemData(A0_186)
  local L1_187, L2_188, L3_189, L4_190, L5_191
  for L4_190 = 1, 8 do
    L5_191 = "Grid_MaterialSlot_"
    L5_191 = L5_191 .. tostring(L4_190)
    A0_186:setUserWorkInt(1, nil, L5_191, 0)
    A0_186:setUserWorkInt(2, nil, L5_191, 0)
  end
  L1_187.items = 0
end
function CraftStartWidget.setReadyItemData(A0_192, A1_193, A2_194, A3_195, A4_196, A5_197, A6_198, A7_199, A8_200)
  local L9_201, L10_202, L11_203, L12_204, L13_205, L14_206
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = A0_192.setItem
  L9_201(L10_202, L11_203, L12_204)
  L9_201 = true
  for L13_205 = 1, L11_203.items do
    L14_206 = "Grid_MaterialSlot_"
    L14_206 = L14_206 .. tostring(L13_205)
    if A0_192:getUserWorkInt(2, nil, L14_206) > A0_192:countMyItem(A0_192:getUserWorkInt(1, nil, L14_206)) then
      L9_201 = false
    end
  end
  return L9_201
end
function CraftStartWidget.setItem(A0_207, A1_208, A2_209)
  local L3_210, L4_211, L5_212, L6_213, L7_214, L8_215, L9_216
  if A2_209 == 0 then
    return
  end
  L3_210 = "Grid_MaterialSlot_"
  L4_211 = false
  for L8_215 = 1, L6_213.items do
    L9_216 = L3_210
    L9_216 = L9_216 .. tostring(L8_215)
    if A0_207:getUserWorkInt(1, nil, L9_216) == A2_209 then
      A0_207:setUserWorkInt(2, nil, L9_216, A0_207:getUserWorkInt(2, nil, L9_216) + 1)
      L4_211 = true
      break
    end
  end
  if L4_211 == false then
    L8_215 = A2_209
    L5_212(L6_213, L7_214, L8_215)
  end
end
function CraftStartWidget.setItemData(A0_217, A1_218, A2_219)
  local L3_220
  L3_220 = "Grid_MaterialSlot_"
  L3_220 = L3_220 .. tostring(A1_218)
  A0_217:setUserWorkInt(1, nil, L3_220, A2_219)
  A0_217:setUserWorkInt(2, nil, L3_220, 1)
  A0_217.work.items = A1_218
end
function CraftStartWidget.isRecipeListSkip(A0_221)
  return A0_221.work.skiprecipelist
end
function CraftStartWidget.isRecipeMode(A0_222)
  return A0_222.work.recipemode
end
function CraftStartWidget.clearOperation(A0_223)
  A0_223.work.chosenOperation = -1
end
function CraftStartWidget.getFacility(A0_224)
  return A0_224.work.facility
end
