require("/Widget/WidgetBaseClass")
_defineClass("CraftEditWidget", "WidgetBaseClass")
function CraftEditWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "SubItemListWidget"
  return L1_1
end
function CraftEditWidget.init(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9
  L6_8 = "chosenItem"
  L7_9 = "integer32"
  L6_8 = {L7_9, "integer32"}
  L7_9 = "chosenPackage"
  L7_9 = {
    "chosenOperation",
    "integer32"
  }
  L3_5._temp = L4_6
  L3_5.chosenItem = 0
  L3_5.chosenOperation = 0
  L3_5.bonus1 = false
  L3_5.bonus2 = false
  L3_5.bonus3 = false
  L3_5.itemlife = false
  L3_5.bazaar = false
  L3_5.updatenexttime = false
  L3_5.closeok = false
  L3_5.demandSync = false
  L3_5.focus = 0
  L6_8 = 9
  L3_5.sorttype = L4_6
  L3_5.historyget = false
  L3_5.memoget = false
  L3_5(L4_6, L5_7)
  L3_5(L4_6, L5_7)
  L6_8 = "UILuaCommands.ButtonFocused"
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = "Command"
  L7_9 = "UILuaCommands.Operate"
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L3_5(L4_6, L5_7)
  L6_8 = 3220
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = "Command"
  L7_9 = "UILuaCommands.Operate"
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L3_5(L4_6, L5_7)
  L6_8 = 3115
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = "NumberInputBox.ValueChanged"
  L3_5(L4_6, L5_7, L6_8)
  for L6_8 = 1, 5 do
    L7_9 = "TabItem_"
    L7_9 = L7_9 .. tostring(L6_8)
    A0_2:setCancelCondition(L7_9)
  end
  L6_8 = "UILuaCommands.TabChanged"
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = 214
  L7_9 = 10091
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L6_8 = 214
  L7_9 = 10093
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L3_5(L4_6, L5_7)
  L3_5(L4_6, L5_7)
  L3_5(L4_6, L5_7)
  L3_5(L4_6, L5_7)
  L3_5(L4_6, L5_7)
  L3_5(L4_6, L5_7)
  L3_5(L4_6, L5_7)
  L3_5(L4_6)
  L6_8 = ""
  L3_5(L4_6, L5_7, L6_8)
  L3_5(L4_6, L5_7)
  L6_8 = ""
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = ""
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = 3093
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = 3094
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = 3081
  L3_5(L4_6, L5_7, L6_8)
  L6_8 = 1
  L7_9 = 76504
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L6_8 = 1
  L7_9 = 76505
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L6_8 = 1
  L7_9 = 76506
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L6_8 = A2_4
  L3_5(L4_6, L5_7, L6_8)
end
function CraftEditWidget.setInitialData(A0_10, A1_11, A2_12)
  local L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
  L4_14 = A0_10
  L3_13 = A0_10.setModal
  L5_15 = A1_11
  L3_13(L4_14, L5_15)
  if A2_12 ~= nil then
    L3_13 = A0_10.work
    L3_13.mode = 411
    L3_13 = A0_10.work
    L3_13.isRepairMode = true
  else
    L3_13 = A0_10.work
    L3_13.mode = 410
    L3_13 = A0_10.work
    L3_13.isRepairMode = false
  end
  L3_13 = A0_10.work
  L3_13.listSelectStep = 1
  L4_14 = A0_10
  L3_13 = A0_10.resetListBox
  L5_15 = 1
  L3_13(L4_14, L5_15)
  L4_14 = A0_10
  L3_13 = A0_10.resetListBox
  L5_15 = 2
  L3_13(L4_14, L5_15)
  L4_14 = A0_10
  L3_13 = A0_10.resetListBox
  L5_15 = 3
  L3_13(L4_14, L5_15)
  L4_14 = A0_10
  L3_13 = A0_10.resetListBox
  L5_15 = 4
  L3_13(L4_14, L5_15)
  L4_14 = A0_10
  L3_13 = A0_10.resetListBox
  L5_15 = 5
  L3_13(L4_14, L5_15)
  L4_14 = A0_10
  L3_13 = A0_10.setControlProperty
  L6_16 = A0_10
  L5_15 = A0_10.getListBoxName
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = "SourceFirstIndex"
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L4_14 = A0_10
  L3_13 = A0_10.setControlProperty
  L6_16 = A0_10
  L5_15 = A0_10.getListBoxName
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = "SourceCount"
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L4_14 = A0_10
  L3_13 = A0_10.setControlProperty
  L6_16 = A0_10
  L5_15 = A0_10.getListBoxName
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = "SourceFirstIndex"
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L4_14 = A0_10
  L3_13 = A0_10.setControlProperty
  L6_16 = A0_10
  L5_15 = A0_10.getListBoxName
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = "SourceCount"
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L4_14 = A0_10
  L3_13 = A0_10.setControlProperty
  L6_16 = A0_10
  L5_15 = A0_10.getListBoxName
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = "SourceFirstIndex"
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L4_14 = A0_10
  L3_13 = A0_10.setControlProperty
  L6_16 = A0_10
  L5_15 = A0_10.getListBoxName
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = "SourceCount"
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L4_14 = A0_10
  L3_13 = A0_10.setControlProperty
  L6_16 = A0_10
  L5_15 = A0_10.getListPropertyName
  L5_15 = L5_15(L6_16, L7_17)
  L6_16 = "FilteredSortKey"
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L4_14 = A0_10
  L3_13 = A0_10.makeListFromPackage
  L3_13(L4_14)
  L3_13 = A0_10.work
  L3_13.listbox = 1
  L4_14 = A0_10
  L3_13 = A0_10.getListBoxFocusNum
  L5_15 = A0_10.work
  L5_15 = L5_15.listbox
  L6_16 = L3_13(L4_14, L5_15)
  if L3_13 > 0 then
    L7_17.index = L5_15
    L7_17.focus = 0
  end
  for L10_20 = 0, 16 do
    A0_10:setDummyItem(L10_20)
  end
end
function CraftEditWidget.setNumberInput(A0_21, A1_22, A2_23, A3_24, A4_25)
  A0_21:setControlProperty(A1_22, "Minimum", A2_23)
  A0_21:setMaximum(A1_22, A3_24)
  A0_21:setValue(A1_22, A4_25)
end
function CraftEditWidget.getListPropertyName(A0_26, A1_27)
  local L2_28
  if A1_27 == 1 then
    L2_28 = "TabItem_1_Maker"
    return L2_28
  elseif A1_27 == 2 then
    L2_28 = "TabItem_2_Maker"
    return L2_28
  elseif A1_27 == 3 then
    L2_28 = "TabItem_3_Maker"
    return L2_28
  elseif A1_27 == 4 then
    L2_28 = "TabItem_4_Maker"
    return L2_28
  elseif A1_27 == 5 then
    L2_28 = "TabItem_5_Maker"
    return L2_28
  elseif A1_27 == 8 then
    L2_28 = "SlotItem_Maker"
    return L2_28
  elseif A1_27 == 9 then
    L2_28 = "HelpCache_Maker"
    return L2_28
  end
end
function CraftEditWidget.setButtonEvents(A0_29, A1_30)
  local L2_31
  L2_31 = A0_29.getControlProperty
  L2_31 = L2_31(A0_29, A1_30, "Command")
  A0_29:setControlCommandCondition(A1_30, L2_31)
  A0_29:setCancelCondition(A1_30)
end
function CraftEditWidget.updateWindowDisplay(A0_32, A1_33)
  if A0_32.work.editWidgetMode ~= 2 then
    if A0_32.work.listSelectStep == 0 then
      A0_32:setGridVisibility(4)
    elseif A0_32.work.listSelectStep == 1 then
      if A0_32.work.mode == 5 then
        A0_32:setGridVisibility(9)
      else
        A0_32:setGridVisibility(4)
      end
    elseif A0_32.work.listSelectStep == 2 then
      A0_32:setGridVisibility(5)
    else
      return
    end
  elseif A0_32.work.editWidgetMode == 2 then
    A0_32.work.listSelectStep = 2
    A0_32:setGridVisibility(7)
  end
  if A0_32.work.editWidgetMode ~= 2 and A1_33 == true then
    A0_32:updateListFocus()
  end
end
function CraftEditWidget.updateListFocus(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42, L9_43
  L1_35 = A0_34.work
  L1_35 = L1_35.listbox
  if L1_35 == 8 then
    L1_35 = false
    return L1_35
  end
  L2_36 = A0_34
  L1_35 = A0_34.getListPropertyName
  L3_37 = A0_34.work
  L3_37 = L3_37.listbox
  L1_35 = L1_35(L2_36, L3_37)
  L3_37 = A0_34
  L2_36 = A0_34.getListBoxName
  L4_38 = A0_34.work
  L4_38 = L4_38.listbox
  L2_36 = L2_36(L3_37, L4_38)
  L3_37 = "TextBlock_NoContents_"
  L4_38 = tostring
  L5_39 = A0_34.work
  L5_39 = L5_39.listbox
  L4_38 = L4_38(L5_39)
  L3_37 = L3_37 .. L4_38
  L4_38 = A0_34.work
  L4_38 = L4_38.listSelectStep
  if L4_38 >= 1 then
    L4_38 = A0_34.work
    L4_38 = L4_38.editWidgetMode
    if L4_38 ~= 4 then
      L5_39 = A0_34
      L4_38 = A0_34.getListBoxFocusNum
      L6_40 = A0_34.work
      L6_40 = L6_40.listbox
      L7_41 = L4_38(L5_39, L6_40)
      if L4_38 == 0 then
        L8_42 = A0_34.work
        L8_42.listSelectStep = 1
        L9_43 = A0_34
        L8_42 = A0_34.displayHelp
        L8_42(L9_43, 3140)
        L8_42 = A0_34.work
        L8_42.bonus1 = false
        L8_42 = A0_34.work
        L8_42.bonus2 = false
        L8_42 = A0_34.work
        L8_42.bonus3 = false
        L8_42 = A0_34.work
        L8_42.itemlife = false
        L8_42 = A0_34.work
        L8_42.page = 0
        L8_42 = A0_34.work
        L8_42.bazaar = false
        L9_43 = A0_34
        L8_42 = A0_34.setGridVisibility
        L8_42(L9_43, 1)
        L9_43 = A0_34
        L8_42 = A0_34.setVisibility
        L8_42(L9_43, L3_37, true)
        L9_43 = A0_34
        L8_42 = A0_34.setWindowFocus
        L8_42(L9_43, L3_37)
        L9_43 = A0_34
        L8_42 = A0_34.setHidden
        L8_42(L9_43, L2_36)
      else
        L9_43 = A0_34
        L8_42 = A0_34.setVisibility
        L8_42(L9_43, L2_36, true)
        L9_43 = A0_34
        L8_42 = A0_34.setVisibility
        L8_42(L9_43, L3_37, false)
        L8_42 = A0_34.work
        L8_42 = L8_42.focus
        L9_43 = L4_38 - 1
        if L8_42 >= L9_43 then
          L8_42 = A0_34.work
          L9_43 = L4_38 - 1
          L8_42.focus = L9_43
        end
        L9_43 = A0_34
        L8_42 = A0_34.focusToIndex
        L8_42 = L8_42(L9_43, A0_34.work.listbox, A0_34.work.focus)
        if L8_42 >= 0 then
          L9_43 = A0_34.work
          L9_43.index = L8_42
        end
        L9_43 = A0_34.setControlProperty
        L9_43(A0_34, L2_36, "SqwtFocusedIndex", A0_34.work.focus)
        L9_43 = A0_34.setFocusedIndex
        L9_43(A0_34, L2_36, A0_34.work.focus)
        L9_43 = A0_34.work
        L9_43 = L9_43.listSelectStep
        if L9_43 == 1 then
          L9_43 = A0_34.setWindowFocus
          L9_43(A0_34, L2_36)
        end
        L9_43 = A0_34.displayFocusedItemHelp
        L9_43(A0_34)
        L9_43 = A0_34.work
        L9_43 = L9_43.listSelectStep
        if L9_43 >= 1 then
          L9_43 = A0_34.work
          L9_43 = L9_43.editWidgetMode
          if L9_43 == 1 then
            L9_43 = A0_34.work
            L9_43.chosenPackage = A0_34:getPackageFromList(A0_34.work.listbox)
            L9_43 = A0_34.work
            L9_43.chosenItem = A0_34.work.index + 1
            L9_43 = A0_34.work
            L9_43.num1max = A0_34:getListProperty(L1_35, A0_34.work.index, "stackCount")
            L9_43 = A0_34.work
            L9_43.num1max = A0_34.work.num1max - A0_34:getSameItemNum(A0_34.work.chosenPackage, A0_34.work.chosenItem)
            L9_43 = A0_34.setText
            L9_43(A0_34, "TextBlock_ItemStackMax", 225, A0_34.work.num1max)
            L9_43 = A0_34.work
            L9_43 = L9_43.num1max
            if L9_43 > A0_34:getEmptySlotNum() then
              L9_43 = A0_34.work
              L9_43.num1max = A0_34:getEmptySlotNum()
            end
            L9_43 = A0_34.work
            L9_43.num1 = 1
            L9_43 = A0_34.setNumberInput
            L9_43(A0_34, "CustomControl_NumberInput", 1, A0_34.work.num1max, A0_34.work.num1)
            L9_43 = A0_34.isOperateButtonEnable
            L9_43 = L9_43(A0_34, A0_34.work.listbox, A0_34.work.index)
            A0_34:_setProperty(nil, "Button_EditCommand", "IsEnabled", L9_43)
            if A0_34.work.listSelectStep == 2 and A0_34.work.listbox ~= 5 then
              if A0_34.work.editWidgetMode == 2 then
                A0_34:setVisibility("Grid_ItemStack", false)
                A0_34:setWindowFocus("Button_EditCommand")
              elseif L9_43 == true then
                A0_34:setVisibility("Grid_ItemStack", A0_34:getListProperty(L1_35, A0_34.work.index, "stackable") == 1)
                A0_34:setWindowFocus("Button_EditCommand")
              else
                A0_34:setVisibility("Grid_ItemStack", false)
                A0_34:setWindowFocus("Button_EditBack")
              end
            end
          end
        end
      end
    end
  else
  end
  L4_38 = true
  return L4_38
end
function CraftEditWidget.setGridVisibility(A0_44, A1_45)
  A0_44:setVisibility("Grid_ActorName", false)
  A0_44:setVisibility("Grid_Help", A1_45 == 1 or A1_45 == 2 or A1_45 == 8)
  A0_44:setVisibility("Grid_TabList", A1_45 == 1 or A1_45 == 4 or A1_45 == 8 or A1_45 == 9 or A1_45 == 10)
  if A0_44.work.listbox == 1 and A0_44.work.listSelectStep == 1 then
    A0_44:setVisibility("Button_SortStatus", true)
    A0_44:displaySortType(A0_44.work.sorttype)
  else
    A0_44:setVisibility("Button_SortStatus", false)
  end
  A0_44:setVisibility("Grid_BackpackAndGil", A0_44.work.editWidgetMode ~= 5)
  A0_44:setVisibility("Grid_Button", A1_45 == 1 or A1_45 == 4 or A1_45 == 8 or A1_45 == 9)
  if A0_44.work.listbox ~= 5 then
    A0_44:setVisibility("Grid_ItemNameBase", A1_45 == 3 or A1_45 == 4 or A1_45 == 5 or A1_45 == 6 or A1_45 == 7 or A1_45 == 9 or A1_45 == 10)
    A0_44:setVisibility("Grid_ItemDetail1", A0_44.work.bonus1)
    A0_44:setVisibility("Grid_ItemDetail2", A0_44.work.bonus2)
    A0_44:setVisibility("Grid_ItemDetail3", A0_44.work.bonus3 or A0_44.work.itemlife or A0_44.work.bazaar)
    A0_44:setVisibility("Label_ItemBonus5", A0_44.work.bonus3)
    A0_44:setVisibility("Grid_ItemLife", A0_44.work.itemlife)
  else
    A0_44:setVisibility("Grid_ItemNameBase", false)
    A0_44:setVisibility("Grid_ItemDetail1", false)
    A0_44:setVisibility("Grid_ItemDetail2", false)
    A0_44:setVisibility("Grid_ItemDetail3", false)
    A0_44:setVisibility("Label_ItemBonus5", false)
    A0_44:setVisibility("Grid_ItemLife", false)
  end
  A0_44:setVisibility("Grid_Edit", A1_45 == 5 or A1_45 == 6 or A1_45 == 7)
  A0_44:setVisibility("Grid_ItemStack", A1_45 == 6)
  A0_44:setVisibility("Grid_NumberInput_Gil", false)
end
function CraftEditWidget.setWindowFocus(A0_46, A1_47)
  if A1_47 ~= nil and A1_47 ~= "" then
    A0_46:setLogicalFocus(A1_47)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_46 then
      A0_46:setKeyboardFocusedControl(A1_47)
    end
  end
end
function CraftEditWidget.displayBagcapacityAndMoney(A0_48)
  local L1_49, L2_50, L3_51
  L1_49 = worldMaster
  L2_50 = L1_49
  L1_49 = L1_49._getMyPlayer
  L1_49 = L1_49(L2_50)
  L3_51 = L1_49
  L2_50 = L1_49.getMoneyOnHand
  L2_50 = L2_50(L3_51)
  L3_51 = A0_48.setText
  L3_51(A0_48, "TextBlock_Gil", 3263, L2_50)
  L3_51 = L1_49._getItemPackageCapacity
  L3_51 = L3_51(L1_49, 1)
  A0_48:setText("TextBlock_ItemStack_2", 3551, L3_51 - L1_49:_getItemPackageFreeSpace(1), L3_51)
end
function CraftEditWidget.isExistItem(A0_52, A1_53, A2_54, A3_55)
  if A3_55 == nil or A3_55 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_53, A2_54) ~= nil then
      return true
    else
      return false
    end
  end
end
function CraftEditWidget.checkPackageAndIndex(A0_56, A1_57, A2_58, A3_59, A4_60)
  if A4_60 == nil or A4_60 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A2_58, A3_59) == A1_57 then
      return true
    else
      return false
    end
  elseif A4_60 == 2 then
    if desktopWidget:getBazaarItem(A2_58, A3_59) == A1_57 then
      return true
    else
      return false
    end
  elseif A4_60 == 4 then
    if desktopWidget:getRetainerItem(A2_58, A3_59) == A1_57 then
      return true
    else
      return false
    end
  end
end
function CraftEditWidget.getSelectedTab(A0_61)
  return A0_61:getSelectedIndex("TabControl_ItemList") + 1
end
function CraftEditWidget.getListBoxName(A0_62, A1_63)
  local L2_64
  if A1_63 == 1 then
    L2_64 = "ListBox_TabItem_1"
    return L2_64
  elseif A1_63 == 2 then
    L2_64 = "ListBox_TabItem_2"
    return L2_64
  elseif A1_63 == 3 then
    L2_64 = "ListBox_TabItem_3"
    return L2_64
  elseif A1_63 == 4 then
    L2_64 = "ListBox_TabItem_4"
    return L2_64
  elseif A1_63 == 5 then
    L2_64 = "ListBox_TabItem_5"
    return L2_64
  else
    L2_64 = ""
    return L2_64
  end
end
function CraftEditWidget.getListBoxItemNum(A0_65, A1_66)
  local L2_67, L3_68
  L3_68 = A0_65
  L2_67 = A0_65.getListPropertyCount
  return L2_67(L3_68, A0_65:getListPropertyName(A1_66))
end
function CraftEditWidget.getListBoxFocusNum(A0_69, A1_70)
  local L2_71, L3_72, L4_73, L5_74
  L3_72 = A0_69
  L2_71 = A0_69.getListBoxItemNum
  L4_73 = A1_70
  L2_71 = L2_71(L3_72, L4_73)
  L4_73 = A0_69
  L3_72 = A0_69.getListPropertyName
  L5_74 = A1_70
  L3_72 = L3_72(L4_73, L5_74)
  if L2_71 == 0 then
    L4_73 = 0
    L5_74 = 0
    return L4_73, L5_74, 0, 0
  end
  L5_74 = A0_69
  L4_73 = A0_69.getControlProperty
  L4_73 = L4_73(L5_74, L3_72, "FilteredCount")
  L5_74 = A0_69.work
  L5_74 = L5_74.focus
  if L4_73 < A0_69.work.focus then
    L5_74 = L4_73 - 1
  end
  return L4_73, L4_73 - 1, 0, L5_74
end
function CraftEditWidget.focusToIndex(A0_75, A1_76, A2_77)
  local L3_78
  L3_78 = A0_75.getListPropertyName
  L3_78 = L3_78(A0_75, A1_76)
  if A0_75:getListBoxFocusNum(A1_76) == 0 or A2_77 >= A0_75:getListBoxFocusNum(A1_76) then
    return -1
  else
    A0_75:setControlProperty(L3_78, "FilteredIndex", A2_77)
    return A0_75:getControlProperty(L3_78, "Index")
  end
end
function CraftEditWidget.indexToFocus(A0_79, A1_80, A2_81)
  local L3_82, L4_83
  L3_82 = -1
  L4_83 = A0_79.getListPropertyName
  L4_83 = L4_83(A0_79, A1_80)
  if A0_79:getListBoxFocusNum(A1_80) > 0 then
    A0_79:setControlProperty(L4_83, "Index", A2_81)
    L3_82 = A0_79:getControlProperty(L4_83, "FilteredIndex")
  end
  A0_79:setControlProperty(L4_83, "Index", A0_79.work.index)
  return L3_82
end
function CraftEditWidget.initListBox(A0_84, A1_85)
  local L2_86, L3_87
  L3_87 = A0_84
  L2_86 = A0_84.getListBoxName
  L2_86 = L2_86(L3_87, A1_85)
  if L2_86 ~= "" then
    L3_87 = A0_84.setControlProperty
    L3_87(A0_84, L2_86, "IntData.Value0", A1_85)
    L3_87 = A0_84.setControlCommandCondition
    L3_87(A0_84, L2_86, "UILuaCommands.MouseEnteredItem")
    L3_87 = A0_84.setControlCommandCondition
    L3_87(A0_84, L2_86, "UILuaCommands.AnchoredItem")
    L3_87 = A0_84.setControlCommandCondition
    L3_87(A0_84, L2_86, "UILuaCommands.Selection")
    L3_87 = A0_84.setCancelCondition
    L3_87(A0_84, L2_86)
    L3_87 = A0_84.setVisibility
    L3_87(A0_84, L2_86, true)
    L3_87 = "TextBlock_NoContents_"
    L3_87 = L3_87 .. tostring(A1_85)
    A0_84:setVisibility(L3_87, false)
    A0_84:setCancelCondition(L3_87)
    A0_84:setControlCommandCondition(L2_86, "UILuaCommands.Previous")
    A0_84:setControlCommandCondition(L2_86, "UILuaCommands.Next")
  end
end
function CraftEditWidget.resetListBox(A0_88, A1_89)
  local L2_90, L3_91
  L3_91 = A0_88
  L2_90 = A0_88.getListBoxItemNum
  L2_90 = L2_90(L3_91, A1_89)
  L3_91 = A0_88.getListPropertyName
  L3_91 = L3_91(A0_88, A1_89)
  if L2_90 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_90 do
      L2_90 = L2_90 - 1
      A0_88:deleteListProperty(L3_91, L2_90)
    end
    A0_88:updateListProperty(L3_91)
  end
  return
end
function CraftEditWidget.getPackageFromList(A0_92, A1_93)
  local L2_94
  L2_94 = 1
  if A1_93 == 1 then
    L2_94 = 1
  elseif A1_93 == 2 then
    L2_94 = 100
  elseif A1_93 == 3 then
    L2_94 = 101
  elseif A1_93 == 4 then
    L2_94 = 8
  end
  return L2_94
end
function CraftEditWidget.setItemToXml(A0_95, A1_96, A2_97, A3_98, A4_99, A5_100, A6_101)
  local L7_102, L8_103, L9_104, L10_105, L11_106, L12_107, L13_108, L14_109, L15_110, L16_111, L17_112, L18_113
  L8_103 = A0_95
  L7_102 = A0_95.getListPropertyName
  L9_104 = A1_96
  L7_102 = L7_102(L8_103, L9_104)
  L8_103, L9_104, L10_105, L11_106 = nil, nil, nil, nil
  L12_107 = worldMaster
  L13_108 = L12_107
  L12_107 = L12_107._getMyPlayer
  L12_107 = L12_107(L13_108)
  L13_108, L14_109 = nil, nil
  if A5_100 == 5 then
    L8_103 = A4_99
    L16_111 = L12_107
    L15_110 = L12_107.createVirtualItem
    L17_112 = L8_103
    L15_110 = L15_110(L16_111, L17_112)
    L13_108 = L15_110
    if L13_108 == nil then
      L15_110 = false
      return L15_110
    end
    L16_111 = L13_108
    L15_110 = L13_108.getItemIcon
    L15_110 = L15_110(L16_111)
    L9_104 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._isStackable
    L15_110 = L15_110(L16_111)
    L10_105 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._countStack
    L15_110 = L15_110(L16_111)
    L11_106 = L15_110
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "itemOwner", 5)
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "mivisible", "Collapsed")
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "mpvisible", "Hidden")
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "mcvisible", "Hidden")
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "polmax", "Collapsed")
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "equiped", "Collapsed")
  elseif A5_100 == 6 then
    L13_108 = A6_101
    if L13_108 == nil then
      L15_110 = false
      return L15_110
    end
    L16_111 = L13_108
    L15_110 = L13_108._getCatalogID
    L15_110 = L15_110(L16_111)
    L8_103 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108.getItemIcon
    L15_110 = L15_110(L16_111)
    L9_104 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._isStackable
    L15_110 = L15_110(L16_111)
    L10_105 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._countStack
    L15_110 = L15_110(L16_111)
    L11_106 = L15_110
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "itemOwner", 6)
  elseif A5_100 == 2 then
    L15_110 = desktopWidget
    L16_111 = L15_110
    L15_110 = L15_110.getBazaarItem
    L17_112 = A3_98
    L18_113 = A4_99
    L15_110 = L15_110(L16_111, L17_112, L18_113)
    L13_108 = L15_110
    if L13_108 == nil then
      L15_110 = false
      return L15_110
    end
    L16_111 = L13_108
    L15_110 = L13_108._getCatalogID
    L15_110 = L15_110(L16_111)
    L8_103 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108.getItemIcon
    L15_110 = L15_110(L16_111)
    L9_104 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._isStackable
    L15_110 = L15_110(L16_111)
    L10_105 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._countStack
    L15_110 = L15_110(L16_111)
    L11_106 = L15_110
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "itemOwner", 2)
  elseif A5_100 == 3 then
    L15_110 = desktopWidget
    L16_111 = L15_110
    L15_110 = L15_110.getShopSellingItemInfo
    L17_112 = A3_98
    L18_113 = A4_99
    L15_110 = L15_110(L16_111, L17_112, L18_113)
    L8_103 = L15_110
    L16_111 = L12_107
    L15_110 = L12_107.createVirtualItem
    L17_112 = L8_103
    L15_110 = L15_110(L16_111, L17_112)
    L13_108 = L15_110
    if L13_108 == nil then
      L15_110 = false
      return L15_110
    end
    L16_111 = L13_108
    L15_110 = L13_108.getItemIcon
    L15_110 = L15_110(L16_111)
    L9_104 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._isStackable
    L15_110 = L15_110(L16_111)
    L10_105 = L15_110
    L16_111 = L13_108
    L15_110 = L13_108._countStack
    L15_110 = L15_110(L16_111)
    L11_106 = L15_110
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "itemOwner", 3)
  else
    if A6_101 ~= nil then
      L13_108 = A6_101
    else
      L16_111 = L12_107
      L15_110 = L12_107._getItem
      L17_112 = A3_98
      L18_113 = A4_99
      L15_110 = L15_110(L16_111, L17_112, L18_113)
      L13_108 = L15_110
    end
    if L13_108 == nil then
      L15_110 = false
      return L15_110
    end
    L15_110 = desktopWidget
    L16_111 = L15_110
    L15_110 = L15_110.getPlayerItemInPackage
    L17_112 = A3_98
    L18_113 = A4_99
    L18_113 = L15_110(L16_111, L17_112, L18_113)
    L11_106 = L18_113
    L10_105 = L17_112
    L9_104 = L16_111
    L8_103 = L15_110
    L16_111 = A0_95
    L15_110 = A0_95.setListProperty
    L17_112 = L7_102
    L18_113 = A2_97
    L15_110(L16_111, L17_112, L18_113, "itemOwner", 1)
  end
  L16_111 = L13_108
  L15_110 = L13_108._getNameIndex
  L15_110 = L15_110(L16_111)
  L16_111 = 0
  L18_113 = L13_108
  L17_112 = L13_108.isEquipment
  L17_112 = L17_112(L18_113)
  if L17_112 == true and (A5_100 == 1 or A5_100 == nil) then
    L18_113 = L13_108
    L17_112 = L13_108._isEquipping
    L17_112 = L17_112(L18_113)
    if L17_112 then
      L16_111 = 1
    end
  end
  L17_112 = "TBL_null"
  if L16_111 == 1 then
    L17_112 = "TBL_equippedItem"
  end
  L18_113 = A0_95.work
  L18_113 = L18_113.isRewardMode
  if L18_113 == true then
    L18_113 = A0_95.work
    L18_113 = L18_113.rewardItemPackage
    if L18_113 == A3_98 then
      L18_113 = A0_95.work
      L18_113 = L18_113.rewardItem
      if L18_113 == A4_99 then
        L17_112 = "TBL_selectedItem"
      end
    end
  end
  L18_113 = A0_95.work
  L18_113 = L18_113.sorttype
  desktopWidget:setItemToXml(A0_95, L7_102, A2_97, L13_108, L17_112, L8_103, L9_104, L10_105, L11_106, L15_110, L18_113, true, false, 9, A3_98, A4_99, A5_100, false)
  desktopWidget:setItemDetailToXml(A0_95, L7_102, A2_97, L13_108, L15_110, A5_100, 9)
  return true
end
function CraftEditWidget.setItemToXmlLight(A0_114, A1_115, A2_116, A3_117, A4_118, A5_119)
  local L6_120, L7_121, L8_122, L9_123, L10_124, L11_125, L12_126, L13_127, L14_128, L15_129, L16_130, L17_131, L18_132, L19_133
  L7_121 = A0_114
  L6_120 = A0_114.getListPropertyName
  L8_122 = A1_115
  L7_121 = L6_120(L7_121, L8_122)
  L8_122, L9_123, L10_124, L11_125 = nil, nil, nil, nil
  L12_126 = worldMaster
  L13_127 = L12_126
  L12_126 = L12_126._getMyPlayer
  L12_126 = L12_126(L13_127)
  L13_127, L14_128 = nil, nil
  if A3_117 > 0 and A4_118 > 0 then
    L16_130 = L12_126
    L15_129 = L12_126._getItem
    L17_131 = A3_117
    L18_132 = A4_118
    L15_129 = L15_129(L16_130, L17_131, L18_132)
    L13_127 = L15_129
  end
  if L13_127 == nil then
    L15_129 = false
    return L15_129
  end
  L16_130 = L13_127
  L15_129 = L13_127._getCatalogID
  L15_129 = L15_129(L16_130)
  L8_122 = L15_129
  L16_130 = L13_127
  L15_129 = L13_127.getItemIcon
  L15_129 = L15_129(L16_130)
  L9_123 = L15_129
  L16_130 = L13_127
  L15_129 = L13_127._isStackable
  L15_129 = L15_129(L16_130)
  L10_124 = L15_129
  L16_130 = L13_127
  L15_129 = L13_127._countStack
  L15_129 = L15_129(L16_130)
  L11_125 = L15_129
  L16_130 = L13_127
  L15_129 = L13_127._getNameIndex
  L15_129 = L15_129(L16_130)
  L16_130 = "TBL_null"
  L17_131 = true
  L18_132 = A0_114.work
  L18_132 = L18_132.isRepairMode
  if L18_132 == true and (L8_122 < 10013001 or L8_122 > 10013005) then
    L17_131 = false
  end
  L19_133 = A0_114
  L18_132 = A0_114.setListPropertyVisibility
  L18_132(L19_133, L6_120, A2_116, L17_131)
  if L17_131 then
    L18_132 = A0_114.work
    L18_132 = L18_132.sorttype
    L19_133 = 11
    if A1_115 == 1 then
      break
    else
    end
    if A1_115 == 2 then
      L18_132 = 11
      L19_133 = 12
      break
    else
    end
    if A1_115 == 3 then
      L18_132 = 91
      break
    else
    end
    desktopWidget:setItemToXml(A0_114, L6_120, A2_116, L13_127, L16_130, L8_122, L9_123, L10_124, L11_125, L15_129, L18_132, true, false, L19_133, A3_117, A4_118, A5_119, false)
    if 0 < A0_114.work.updatecount and A0_114.work.listbox == 1 and A0_114:getControlProperty(L6_120, "FilteredIndex") < A0_114.work.focus then
      A0_114.work.focusChange = true
    end
  end
  L18_132 = true
  return L18_132
end
function CraftEditWidget.getMoneyListIndex(A0_134, A1_135)
  local L2_136, L3_137
  L2_136 = 1
  if A1_135 == 1000001 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000102 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000101 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000103 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000107 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000106 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000104 then
    L3_137 = -1
    return L3_137
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000108 then
    L3_137 = -1
    return L3_137
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000109 then
    L3_137 = -1
    return L3_137
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000105 then
    L3_137 = -1
    return L3_137
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000111 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000110 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000112 then
    L3_137 = -1
    return L3_137
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000113 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000114 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000115 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000116 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000117 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000118 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000119 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000120 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000121 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000122 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  if A1_135 == 1000123 then
    return L2_136
  else
    L2_136 = L2_136 + 1
  end
  L3_137 = -1
  return L3_137
end
function CraftEditWidget.setSortType(A0_138, A1_139, A2_140, A3_141, A4_142)
  local L5_143, L6_144
  L5_143 = worldMaster
  L6_144 = L5_143
  L5_143 = L5_143._getMyPlayer
  L5_143 = L5_143(L6_144)
  L6_144 = L5_143._getItem
  L6_144 = L6_144(L5_143, A4_142, A2_140 + 1)
  if L6_144 == nil then
    return
  end
  desktopWidget:setSortType(A0_138, A1_139, A2_140, A3_141, L6_144)
end
function CraftEditWidget.updateSortType(A0_145)
  local L1_146, L2_147
  L2_147 = A0_145
  L1_146 = A0_145.getListPropertyName
  L1_146 = L1_146(L2_147, 1)
  L2_147 = A0_145.getPackageFromList
  L2_147 = L2_147(A0_145, 1)
  for _FORV_6_ = 1, A0_145:getListBoxItemNum(1) do
    A0_145:setSortType(L1_146, _FORV_6_ - 1, A0_145.work.sorttype, L2_147)
  end
  A0_145:updateListProperty(L1_146)
end
function CraftEditWidget.makeListFromPackage(A0_148, A1_149, A2_150)
  local L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157, L10_158, L11_159, L12_160
  L3_151 = worldMaster
  L4_152 = L3_151
  L3_151 = L3_151._getMyPlayer
  L3_151 = L3_151(L4_152)
  L4_152, L5_153, L6_154, L7_155, L8_156 = nil, nil, nil, nil, nil
  if A2_150 == nil then
    if A1_149 == 1 or A1_149 == nil then
      L4_152 = 0
      L5_153 = L9_157
      L6_154 = L9_157
      L7_155 = L9_157
      L8_156 = L9_157
      L12_160 = A0_148
      L12_160 = "SourceFirstIndex"
      L9_157(L10_158, L11_159, L12_160, 0)
      L12_160 = A0_148
      L12_160 = "SourceCount"
      L9_157(L10_158, L11_159, L12_160, L7_155)
      L12_160 = "FilteredSortKey"
      L9_157(L10_158, L11_159, L12_160, "sorttype")
      for L12_160 = 1, L7_155 - L8_156 do
        if A0_148:setItemToXmlLight(1, L4_152, 1, L12_160, nil, nil, true) == true then
          L4_152 = L4_152 + 1
        else
          break
        end
      end
      if L6_154 > L4_152 then
        for L12_160 = L4_152, L6_154 - 1 do
          L6_154 = L6_154 - 1
          A0_148:deleteListProperty(L5_153, L6_154)
        end
      end
      L9_157(L10_158, L11_159)
    end
    if A1_149 == 100 or A1_149 == nil then
      L7_155 = L9_157
      L4_152 = 0
      L6_154 = L9_157
      L5_153 = L9_157
      L12_160 = A0_148
      L12_160 = "SourceFirstIndex"
      L9_157(L10_158, L11_159, L12_160, 0)
      L12_160 = A0_148
      L12_160 = "SourceCount"
      L9_157(L10_158, L11_159, L12_160, L7_155)
      L12_160 = "FilteredSortKey"
      L9_157(L10_158, L11_159, L12_160, "sorttype")
      for L12_160 = 1, L7_155 do
        if A0_148:setItemToXmlLight(2, L4_152, 100, L12_160, nil, nil, true) == true then
          L4_152 = L4_152 + 1
        else
          break
        end
      end
      if L6_154 > L4_152 then
        for L12_160 = L4_152, L6_154 - 1 do
          L6_154 = L6_154 - 1
          A0_148:deleteListProperty(L5_153, L6_154)
        end
      end
      L9_157(L10_158, L11_159)
    end
  else
    if A1_149 == 1 then
    elseif A1_149 == 100 then
    elseif A1_149 == 101 then
      return
    else
      return
    end
    L12_160 = L9_157
    L12_160 = L3_151
    if L11_159 ~= nil then
      L12_160 = A0_148
      L11_159(L12_160, L9_157, A2_150 - 1, A1_149, A2_150, nil, nil, true)
    else
      L12_160 = A0_148
      L12_160 = A0_148.deleteListProperty
      L12_160(A0_148, L10_158, L11_159 - 1)
      L12_160 = A0_148.updateListProperty
      L12_160(A0_148, L10_158)
    end
  end
  L9_157(L10_158)
end
function CraftEditWidget.makeRecipeList(A0_161, A1_162, A2_163)
  local L3_164
  L3_164 = A0_161.getListPropertyName
  L3_164 = L3_164(A0_161, 5)
  if A1_162 == 0 then
    A0_161:resetListBox(5)
  elseif A1_162 == -1 then
    A0_161:updateListProperty(L3_164)
  elseif A2_163 ~= nil then
    A0_161:setItemToXml(5, A1_162 - 1, 1, A2_163, 5)
  end
end
function CraftEditWidget.makeHistoryList(A0_165, A1_166, A2_167, A3_168)
  local L4_169, L5_170
  L4_169 = A3_168
  L5_170 = A0_165.getListPropertyName
  L5_170 = L5_170(A0_165, L4_169)
  if A1_166 == 0 then
    A0_165:resetListBox(L4_169)
  elseif A1_166 == -1 then
    A0_165:updateListProperty(L5_170)
    if A3_168 == 3 then
      A0_165.work.historyget = true
    else
      A0_165.work.memoget = true
    end
  elseif A2_167 ~= nil then
    A0_165:setItemToXml(L4_169, A1_166 - 1, 1, A2_167, 5)
  end
end
function CraftEditWidget.setDummyItem(A0_171, A1_172)
  local L2_173, L3_174, L4_175, L5_176, L6_177
  L2_173 = A0_171.getListPropertyName
  L2_173 = L2_173(L3_174, L4_175)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "catalog", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "quality", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "icon", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "name", "")
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "itemKind", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "rare", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "ex", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "isEquipment", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "itemlife", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "lifemax", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "mskill1", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "mskill2", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "compati", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "eqrank", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "eqrankType", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "nameStyle", "TBL_null")
  for L6_177 = 1, 3 do
    A0_171:setListProperty(L2_173, A1_172, "bn1" .. tostring(L6_177), 0)
    A0_171:setListProperty(L2_173, A1_172, "bv1" .. tostring(L6_177), 0)
    A0_171:setListProperty(L2_173, A1_172, "bh1" .. tostring(L6_177), 0)
  end
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "bn3t", 0)
  for L6_177 = 1, 3 do
    A0_171:setListProperty(L2_173, A1_172, "bn3" .. tostring(L6_177), 0)
    A0_171:setListProperty(L2_173, A1_172, "bv3" .. tostring(L6_177), 0)
  end
  for L6_177 = 1, 32 do
    A0_171:setListProperty(L2_173, A1_172, "bn5p" .. tostring(L6_177), 0)
    A0_171:setListProperty(L2_173, A1_172, "bn5v" .. tostring(L6_177), 0)
  end
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "stackCount", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "stackMax", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "stackable", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "stack", "")
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "bazaarkind", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "rewardprice", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "rewardpackage", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "rewarditem", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "polmax", "Hidden")
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "mcount", 0)
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "mpvisible", "Hidden")
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "mivisible", "Collapsed")
  L6_177 = A1_172
  L3_174(L4_175, L5_176, L6_177, "mcvisible", "Hidden")
  L3_174(L4_175, L5_176)
end
function CraftEditWidget.setReadyItem(A0_178, A1_179, A2_180)
  local L3_181, L4_182, L5_183
  L4_182 = A0_178
  L3_181 = A0_178.getListPropertyName
  L5_183 = 8
  L3_181 = L3_181(L4_182, L5_183)
  L4_182 = worldMaster
  L5_183 = L4_182
  L4_182 = L4_182._getMyPlayer
  L4_182 = L4_182(L5_183)
  L5_183 = L4_182.createVirtualItem
  L5_183 = L5_183(L4_182, A2_180)
  A0_178:setItemToXml(8, A1_179, 0, 0, 6, L5_183, true)
  A0_178:updateListProperty(L3_181)
end
function CraftEditWidget.setSlotItem(A0_184, A1_185)
  local L2_186, L3_187, L4_188, L5_189, L6_190, L7_191, L8_192
  L3_187 = A0_184
  L2_186 = A0_184.getListPropertyName
  L4_188 = 8
  L2_186 = L2_186(L3_187, L4_188)
  L3_187 = worldMaster
  L4_188 = L3_187
  L3_187 = L3_187._getMyPlayer
  L3_187 = L3_187(L4_188)
  L4_188 = desktopWidget
  L5_189 = L4_188
  L4_188 = L4_188.getPlayerItemInPackage
  L6_190 = A0_184.work
  L6_190 = L6_190.chosenPackage
  L7_191 = A0_184.work
  L7_191 = L7_191.chosenItem
  L7_191 = L4_188(L5_189, L6_190, L7_191)
  L8_192 = L3_187._getItem
  L8_192 = L8_192(L3_187, A0_184.work.chosenPackage, A0_184.work.chosenItem)
  A0_184:setItemToXml(8, A1_185, A0_184.work.chosenPackage, A0_184.work.chosenItem, 1, L8_192, true)
  if L8_192:_isStackable() == true then
    A0_184:setListProperty(L2_186, A1_185, "stackCount", 1)
    A0_184:setListProperty(L2_186, A1_185, "stackMax", L8_192:_getMaxStack())
    A0_184:setListProperty(L2_186, A1_185, "stackable", 1)
    A0_184:setListProperty(L2_186, A1_185, "stack", "1")
  else
    A0_184:setListProperty(L2_186, A1_185, "stackCount", 1)
    A0_184:setListProperty(L2_186, A1_185, "stackMax", 1)
    A0_184:setListProperty(L2_186, A1_185, "stackable", 0)
    A0_184:setListProperty(L2_186, A1_185, "stack", "")
  end
  A0_184:updateListProperty(L2_186)
end
function CraftEditWidget.findItemSetSlot(A0_193, A1_194, A2_195)
  local L3_196, L4_197, L5_198, L6_199, L7_200, L8_201, L9_202, L10_203, L11_204, L12_205, L13_206
  if A2_195 == 0 then
    return
  end
  L4_197 = A0_193
  L3_196 = A0_193.getListPropertyName
  L5_198 = 8
  L3_196 = L3_196(L4_197, L5_198)
  L4_197 = worldMaster
  L5_198 = L4_197
  L4_197 = L4_197._getMyPlayer
  L4_197 = L4_197(L5_198)
  L5_198 = 0
  for L9_202 = 1, 4 do
    L13_206 = 1
    for L13_206 = 1, L11_204(L12_205, L13_206) do
      if A0_193:getBagItemDataWithQuality(L13_206) == A2_195 and L9_202 == A0_193:getBagItemDataWithQuality(L13_206) and A0_193:isOperateButtonEnable(1, L13_206 - 1) == true then
        L5_198 = L13_206
        break
      end
    end
    if L5_198 ~= 0 then
      break
    end
  end
  if L5_198 == 0 then
    return L6_199
  end
  L9_202 = L5_198
  L9_202 = A0_193
  L13_206 = L5_198
  L8_201(L9_202, L10_203, L11_204, L12_205, L13_206, 1, L6_199)
  L9_202 = L6_199
  if L8_201 == true then
    L9_202 = A0_193
    L13_206 = 1
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206)
    L9_202 = A0_193
    L13_206 = L6_199._getMaxStack
    L13_206 = L13_206(L6_199)
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206, L13_206(L6_199))
    L9_202 = A0_193
    L13_206 = 1
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206)
    L9_202 = A0_193
    L13_206 = "1"
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206)
  else
    L9_202 = A0_193
    L13_206 = 1
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206)
    L9_202 = A0_193
    L13_206 = 1
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206)
    L9_202 = A0_193
    L13_206 = 0
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206)
    L9_202 = A0_193
    L13_206 = ""
    L8_201(L9_202, L10_203, L11_204, L12_205, L13_206)
  end
  L9_202 = A0_193
  L8_201(L9_202, L10_203)
  L9_202 = A0_193
  if L8_201 ~= nil then
    L9_202 = L8_201.setSlotData
    L13_206 = L5_198
    L9_202(L10_203, L11_204, L12_205, L13_206)
  end
  L9_202 = A0_193.updateStackPrint
  L9_202(L10_203)
  L9_202 = true
  return L9_202
end
function CraftEditWidget.getBagItemDataWithQuality(A0_207, A1_208)
  local L2_209, L3_210, L4_211, L5_212, L6_213, L7_214, L8_215
  L2_209 = desktopWidget
  L3_210 = L2_209
  L2_209 = L2_209.getPlayerItemInPackage
  L4_211 = 1
  L5_212 = A1_208
  L5_212 = L2_209(L3_210, L4_211, L5_212)
  L6_213 = worldMaster
  L7_214 = L6_213
  L6_213 = L6_213._getMyPlayer
  L6_213 = L6_213(L7_214)
  L8_215 = L6_213
  L7_214 = L6_213._getItem
  L7_214 = L7_214(L8_215, 1, A1_208)
  if L7_214 == nil then
    L8_215 = 0
    return L8_215, 0, 0
  end
  L8_215 = L7_214._getNameIndex
  L8_215 = L8_215(L7_214)
  if L4_211 == false then
    L5_212 = 1
  end
  return L2_209, L5_212, L8_215
end
function CraftEditWidget.displayHelp(A0_216, A1_217)
  A0_216:setVisibility("Grid_MateriaEquipList", false)
  return A0_216:setText("TextBlock_Help", A1_217)
end
function CraftEditWidget.displayFocusedItemHelp(A0_218)
  local L1_219, L2_220, L3_221, L4_222, L5_223, L6_224, L7_225, L8_226, L9_227, L10_228, L11_229, L12_230, L13_231, L14_232, L15_233, L16_234, L17_235, L18_236, L19_237, L20_238, L21_239, L22_240, L23_241, L24_242, L25_243, L26_244, L27_245, L28_246, L29_247, L30_248
  L2_220 = A0_218
  L1_219 = A0_218.getListBoxItemNum
  L3_221 = A0_218.work
  L3_221 = L3_221.listbox
  L1_219 = L1_219(L2_220, L3_221)
  L2_220 = A0_218.work
  L2_220 = L2_220.index
  if L1_219 <= L2_220 then
    L1_219 = false
    return L1_219
  end
  L1_219 = A0_218.work
  L1_219 = L1_219.editWidgetMode
  if L1_219 == 4 then
    L1_219 = false
    return L1_219
  end
  L2_220 = A0_218
  L1_219 = A0_218.getListPropertyName
  L3_221 = A0_218.work
  L3_221 = L3_221.listbox
  L1_219 = L1_219(L2_220, L3_221)
  L3_221 = A0_218
  L2_220 = A0_218.getPackageFromList
  L4_222 = A0_218.work
  L4_222 = L4_222.listbox
  L2_220 = L2_220(L3_221, L4_222)
  L3_221 = A0_218.work
  L3_221 = L3_221.index
  L3_221 = L3_221 + 1
  L4_222 = A0_218.work
  L4_222 = L4_222.listbox
  if L4_222 == 8 then
    L5_223 = A0_218
    L4_222 = A0_218.getListProperty
    L6_224 = L1_219
    L7_225 = A0_218.work
    L7_225 = L7_225.index
    L8_226 = "itemPackage"
    L4_222 = L4_222(L5_223, L6_224, L7_225, L8_226)
    L2_220 = L4_222
    L5_223 = A0_218
    L4_222 = A0_218.getListProperty
    L6_224 = L1_219
    L7_225 = A0_218.work
    L7_225 = L7_225.index
    L8_226 = "itemIndex"
    L4_222 = L4_222(L5_223, L6_224, L7_225, L8_226)
    L3_221 = L4_222
  end
  L4_222 = 1
  L5_223 = worldMaster
  L6_224 = L5_223
  L5_223 = L5_223._getMyPlayer
  L5_223 = L5_223(L6_224)
  L6_224 = nil
  L7_225 = A0_218.work
  L7_225 = L7_225.mode
  if L7_225 ~= 415 then
    L7_225 = A0_218.work
    L7_225 = L7_225.listbox
    if L7_225 ~= 8 and L4_222 == 1 then
      L8_226 = L5_223
      L7_225 = L5_223._getItem
      L9_227 = L2_220
      L10_228 = L3_221
      L7_225 = L7_225(L8_226, L9_227, L10_228)
      L6_224 = L7_225
    end
  end
  L7_225 = desktopWidget
  L8_226 = L7_225
  L7_225 = L7_225.getItemBase
  L9_227 = A0_218
  L10_228 = L6_224
  L11_229 = L1_219
  L12_230 = A0_218.work
  L12_230 = L12_230.index
  L21_239 = L7_225(L8_226, L9_227, L10_228, L11_229, L12_230)
  L22_240 = nil
  L23_241 = 0
  L24_242 = 0
  L25_243 = 0
  L26_244 = 0
  if L27_245 ~= 8 and L6_224 ~= nil then
    if L27_245 == true then
      for L30_248 = 1, 27 do
        if L6_224:isFitForEquipPoint(L30_248) == true then
          if L23_241 == 0 then
            L23_241 = L30_248
          elseif L24_242 == 0 then
            L24_242 = L30_248
          elseif L25_243 == 0 then
            L25_243 = L30_248
          elseif L26_244 == 0 then
            L26_244 = L30_248
            break
          end
        end
      end
    end
  else
    L30_248 = A0_218.work
    L30_248 = L30_248.index
    L23_241 = L27_245
    L30_248 = A0_218.work
    L30_248 = L30_248.index
    L24_242 = L27_245
    L30_248 = A0_218.work
    L30_248 = L30_248.index
    L25_243 = L27_245
    L30_248 = A0_218.work
    L30_248 = L30_248.index
    L26_244 = L27_245
  end
  if L23_241 ~= 0 then
    L22_240 = L27_245
  end
  if L22_240 == nil and L24_242 ~= 0 then
    L22_240 = L27_245
  end
  if L22_240 == nil and L25_243 ~= 0 then
    L22_240 = L27_245
  end
  if L22_240 == nil and L26_244 ~= 0 then
    L22_240 = L27_245
  end
  if L29_247 ~= 8 then
  else
    if L29_247 == 415 then
  end
  else
    L30_248 = A0_218
    L11_229 = L11_229 - L29_247
  end
  if L29_247 == 415 then
    L10_228 = false
  end
  L30_248 = L29_247
  L29_247(L30_248, A0_218, L6_224, L1_219, A0_218.work.index, L10_228, L9_227, L18_236, L19_237, L7_225, L11_229, L13_231, L14_232, L20_238, L21_239, nil, true)
  L30_248 = L29_247
  L30_248 = L29_247(L30_248, A0_218, L6_224, L1_219, A0_218.work.index, L22_240, L28_246, true, L27_245)
  A0_218.work.bonus1 = L29_247
  A0_218.work.bonus2 = L30_248
  A0_218.work.bonus3 = L29_247(L30_248, A0_218, L6_224, L1_219, A0_218.work.index, L22_240, L28_246, true, L27_245)
  A0_218.work.itemlife = L29_247(L30_248, A0_218, L6_224, L1_219, A0_218.work.index, L22_240, L28_246, true, L27_245)
  A0_218:setVisibility("Grid_MateriaEquipList", false)
  if A0_218.work.mode ~= 415 and A0_218.work.listbox == 8 and 0 < A0_218:getListProperty(L1_219, A0_218.work.index, "mcount") then
    desktopWidget:setMateriaListItems(A0_218, L6_224, L1_219, A0_218.work.index)
    A0_218:setVisibility("Grid_MateriaEquipList", true)
    A0_218:setVisibility("Button_ListClose", false)
  end
  A0_218:updateWindowDisplay(false)
  return true
end
function CraftEditWidget.previousSequence(A0_249)
  A0_249:saveSortType()
  if A0_249.work.mode == 410 or A0_249.work.mode == 411 then
    if A0_249.work.listSelectStep <= 1 then
      A0_249:gotoParent(true)
      return true
    elseif A0_249.work.listSelectStep == 2 then
      A0_249.work.listSelectStep = 1
      A0_249:selectedBorder()
      A0_249:updateWindowDisplay(true)
      return true
    else
      return false
    end
  elseif A0_249.work.mode == 415 and A0_249.work.listSelectStep <= 1 then
    A0_249:gotoParent()
    return true
  end
end
function CraftEditWidget.isOperateButtonEnable(A0_250, A1_251, A2_252)
  local L3_253, L4_254, L5_255, L6_256, L7_257, L8_258
  L4_254 = A0_250
  L3_253 = A0_250.getListPropertyName
  L5_255 = A1_251
  L3_253 = L3_253(L4_254, L5_255)
  L5_255 = A0_250
  L4_254 = A0_250.getListBoxFocusNum
  L6_256 = A1_251
  L4_254 = L4_254(L5_255, L6_256)
  if L4_254 == 0 then
    L4_254 = false
    return L4_254
  end
  L4_254 = true
  L6_256 = A0_250
  L5_255 = A0_250.getListBoxFocusNum
  L7_257 = A1_251
  L5_255 = L5_255(L6_256, L7_257)
  if L5_255 == 0 then
    L5_255 = false
    return L5_255
  end
  L6_256 = A0_250
  L5_255 = A0_250.getListBoxItemNum
  L7_257 = A1_251
  L5_255 = L5_255(L6_256, L7_257)
  if A2_252 >= L5_255 then
    L5_255 = false
    return L5_255
  end
  L6_256 = A0_250
  L5_255 = A0_250.getPackageFromList
  L7_257 = A1_251
  L5_255 = L5_255(L6_256, L7_257)
  L6_256 = A2_252 + 1
  L7_257 = worldMaster
  L8_258 = L7_257
  L7_257 = L7_257._getMyPlayer
  L7_257 = L7_257(L8_258)
  L8_258 = nil
  if L5_255 == 1 or L5_255 == 100 or L5_255 == 101 then
    L8_258 = L7_257:_getItem(L5_255, L6_256)
  end
  if L8_258 == nil then
    return false
  end
  if L8_258:_isEquipping() then
    L4_254 = false
  end
  if A1_251 ~= 1 and A1_251 ~= 8 then
    L4_254 = false
  end
  if A0_250:getListProperty(L3_253, A2_252, "stackCount") == A0_250:getSameItemNum(L5_255, L6_256) then
    L4_254 = false
  end
  return L4_254
end
function CraftEditWidget.processUICommandOperate(A0_259, A1_260, A2_261, A3_262, A4_263)
  if A0_259.work.recipeopen == true then
    return
  end
  if A0_259.work.chosenOperation ~= 0 then
    return
  end
  if A2_261 == "Button_Back" then
    if A0_259.work.chosenOperation ~= 0 then
      return
    end
    return A0_259:previousSequence()
  elseif A2_261 == "Button_EditBack" then
    if A0_259.work.editWidgetMode == 2 then
      return A0_259:gotoParent(true)
    else
      return A0_259:previousSequence()
    end
  elseif A2_261 == "Button_EditCommand" then
    if A0_259.work.editWidgetMode == 2 then
      A0_259:removeItem()
    else
      A0_259:setItem()
    end
    A0_259:selectedBorder()
    return A0_259:gotoParent(true)
  elseif A2_261 == "Button_SortStatus" then
    A0_259:operateSort()
    return
  end
end
function CraftEditWidget.processUICommandCancel(A0_264, A1_265, A2_266, A3_267, A4_268)
  if A0_264.work.recipeopen == true then
    return
  end
  if A0_264:getKeyboardFocusedControl() == "0" then
    return
  end
  if A0_264.work.chosenOperation ~= 0 then
    return
  end
  if A0_264.work.editWidgetMode == 2 then
    return A0_264:gotoParent(true)
  else
    A0_264:setCommonTimer(nil)
    return A0_264:previousSequence()
  end
end
function CraftEditWidget.processUICommandClose(A0_269, A1_270, A2_271, A3_272, A4_273)
  A0_269:setCommonTimer(nil)
  return
end
function CraftEditWidget.processUICommandSelection(A0_274, A1_275, A2_276, A3_277, A4_278)
  if A0_274.work.recipeopen == true then
    return
  end
  if A0_274.work.chosenOperation ~= 0 then
    return
  end
  if desktopWidget:checkKeyboardFocused(A0_274) == false then
    return
  end
  A0_274.work.focus = A3_277
  A0_274.work.listbox = A4_278
  A0_274:updateWindowDisplay(true)
  if A0_274.work.mode ~= 415 then
    if A0_274:isOperateButtonEnable(A0_274.work.listbox, A0_274.work.index) == true then
      A0_274:setItem()
      A0_274:updateWindowDisplay(true)
    else
      return
    end
  elseif A0_274.work.chosenOperation == 0 and A0_274:_getParentWidget() ~= nil then
    A0_274:_getParentWidget():setRecipeIndex(A0_274.work.index + 1, A0_274.work.listbox)
    A0_274.work.chosenOperation = A0_274.work.index + 1
    A0_274:selectedBorder()
    A0_274:selectedBorder(A0_274.work.index, true)
    A0_274:setInputEnable(false)
  end
end
function CraftEditWidget.processUICommandDefault(A0_279, A1_280, A2_281, A3_282, A4_283, A5_284)
  if A0_279.work.recipeopen == true then
    return
  end
  if A0_279.work.chosenOperation ~= 0 then
    return
  end
  if desktopWidget:checkKeyboardFocused(A0_279) == false then
    return
  end
  if A3_282 == "UILuaCommands.MouseEnteredItem" or A3_282 == "UILuaCommands.AnchoredItem" then
    if A5_284 == nil then
      return
    end
    if A4_283 == nil or A4_283 < 0 then
      return
    end
    A0_279.work.listbox = A5_284
    A0_279.work.focus = A4_283
    A0_279:setCommonTimer(0.2)
  elseif A3_282 == "UILuaCommands.TabChanged" then
    A0_279.work.listbox = 0 + A0_279:getSelectedTab()
    A0_279.work.index = 0
    A0_279.work.focus = 0
    if A0_279.work.listbox == 4 and A0_279.work.memoget == false then
      A0_279:_getParentWidget():setListRequest(A0_279.work.listbox)
      A0_279:setInputEnable(false)
    end
    A0_279:setText("TextBlock_Title", A0_279:getControlProperty("TabItem_" .. tostring(A0_279.work.listbox), "Header"))
    A0_279:setControlProperty("Button_Back", "Focusable", false)
    A0_279:setControlProperty("Button_Back", "IsTabStop", false)
    return A0_279:updateWindowDisplay(true)
  elseif A3_282 == "UILuaCommands.ButtonFocused" then
    A0_279:setControlProperty("Button_Back", "Focusable", true)
    A0_279:setControlProperty("Button_Back", "IsTabStop", true)
  elseif A3_282 == "NumberInputBox.ValueChanged" then
    A0_279:updateNumber(A4_283, A2_281)
  elseif A3_282 == "UILuaCommands.Previous" then
    A0_279:catalogSkip(-1)
  elseif A3_282 == "UILuaCommands.Next" then
    A0_279:catalogSkip(1)
  end
end
function CraftEditWidget.processTimer(A0_285)
  if A0_285:focusToIndex(A0_285.work.listbox, A0_285.work.focus) >= 0 then
    A0_285.work.index = A0_285:focusToIndex(A0_285.work.listbox, A0_285.work.focus)
  end
  A0_285:selectedBorder()
  A0_285.work.page = 0
  if A0_285.work.listSelectStep == 1 then
    A0_285:updateWindowDisplay(true)
  elseif A0_285.work.listSelectStep == 0 then
    A0_285.work.listSelectStep = 1
    A0_285:updateWindowDisplay(true)
  else
    return
  end
  A0_285:setControlProperty("Button_Back", "Focusable", true)
  A0_285:setControlProperty("Button_Back", "IsTabStop", true)
end
function CraftEditWidget.catalogSkip(A0_286, A1_287)
  local L2_288, L3_289, L4_290, L5_291, L6_292, L7_293, L8_294, L9_295, L10_296, L11_297, L12_298, L13_299
  L2_288 = A0_286.work
  L2_288 = L2_288.focus
  L4_290 = A0_286
  L3_289 = A0_286.getListBoxFocusNum
  L5_291 = A0_286.work
  L5_291 = L5_291.listbox
  L3_289 = L3_289(L4_290, L5_291)
  L3_289 = L3_289 - 1
  if L3_289 == -1 then
    return
  end
  L4_290 = 2
  L5_291 = A0_286.work
  L5_291 = L5_291.listbox
  if L5_291 ~= 1 then
    L5_291 = 10 * A1_287
    L2_288 = L2_288 + L5_291
  else
    L5_291 = A0_286.work
    L5_291 = L5_291.sorttype
    if L5_291 == 0 then
      L5_291 = 10 * A1_287
      L2_288 = L2_288 + L5_291
    else
      L5_291 = nil
      if A1_287 > 0 then
        L6_292 = A0_286.work
        L6_292 = L6_292.focus
        L5_291 = L3_289 - L6_292
      else
        L6_292 = A0_286.work
        L5_291 = L6_292.focus
      end
      L7_293 = A0_286
      L6_292 = A0_286.getListPropertyName
      L8_294 = A0_286.work
      L8_294 = L8_294.listbox
      L6_292 = L6_292(L7_293, L8_294)
      L7_293 = desktopWidget
      L8_294 = L7_293
      L7_293 = L7_293.getItemSortKey
      L12_298 = 1
      L13_299 = L4_290
      L7_293 = L7_293(L8_294, L9_295, L10_296, L11_297, L12_298, L13_299)
      L8_294 = L2_288
      for L12_298 = 1, L5_291 do
        L8_294 = L8_294 + A1_287
        L13_299 = A0_286.focusToIndex
        L13_299 = L13_299(A0_286, A0_286.work.listbox, L8_294)
        if L7_293 ~= desktopWidget:getItemSortKey(A0_286, L6_292, L13_299, 1, L4_290) then
          L2_288 = L2_288 + L12_298 * A1_287
          break
        end
        if L12_298 == L5_291 then
          if A1_287 > 0 then
            L2_288 = L3_289
          else
            L2_288 = 0
          end
        end
      end
    end
  end
  if L3_289 < L2_288 then
    L2_288 = L3_289
  elseif L2_288 < 0 then
    L2_288 = 0
  end
  L5_291 = A0_286.work
  L5_291 = L5_291.focus
  if L2_288 ~= L5_291 then
    L5_291 = A0_286.work
    L5_291.focus = L2_288
    L6_292 = A0_286
    L5_291 = A0_286.updateWindowDisplay
    L7_293 = true
    L5_291(L6_292, L7_293)
  end
end
function CraftEditWidget.selectedBorder(A0_300, A1_301, A2_302)
  local L3_303, L4_304
  L3_303 = A0_300.getListPropertyName
  L3_303 = L3_303(L4_304, A0_300.work.listbox)
  if A1_301 ~= nil then
    A0_300:setListProperty(L3_303, A0_300.work.index, "selected", L4_304)
    A0_300.work.selected = A0_300.work.index
  elseif L4_304 == -1 and A2_302 == nil then
    return
  else
    for _FORV_7_ = 1, A0_300:getListBoxItemNum(A0_300.work.listbox) do
      A0_300:setListProperty(L3_303, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_304.selected = -1
  end
  L4_304(A0_300, L3_303)
end
function CraftEditWidget.updateNumber(A0_305, A1_306, A2_307)
  if A2_307 == "CustomControl_NumberInput" and A0_305:getControlProperty(A2_307, "IsKeyboardFocusWithin") == true then
    A0_305.work.num1 = A1_306
  elseif A2_307 == "CustomControl_NumberInput_Gil" and A0_305:getControlProperty(A2_307, "IsKeyboardFocusWithin") == true then
    A0_305.work.num2 = A1_306
  end
end
function CraftEditWidget.updateStackPrint(A0_308)
  local L1_309, L2_310, L3_311, L4_312, L5_313, L6_314, L7_315, L8_316, L9_317, L10_318, L11_319, L12_320
  L2_310 = A0_308
  L1_309 = A0_308.getListPropertyName
  L3_311 = 1
  L1_309 = L1_309(L2_310, L3_311)
  L3_311 = A0_308
  L2_310 = A0_308.getListBoxItemNum
  L4_312 = 1
  L2_310 = L2_310(L3_311, L4_312)
  L3_311 = 0
  L4_312 = 0
  L5_313 = 0
  L6_314 = 1
  L7_315 = ""
  for L11_319 = 1, L2_310 do
    L12_320 = A0_308.isExistItem
    L12_320 = L12_320(A0_308, 1, L11_319)
    if L12_320 == false then
      break
    end
    L3_311 = 1
    L4_312 = L11_319
    L12_320 = A0_308.getListProperty
    L12_320 = L12_320(A0_308, L1_309, L11_319 - 1, "stackCount")
    L5_313 = L12_320
    L12_320 = A0_308.getListProperty
    L12_320 = L12_320(A0_308, L1_309, L11_319 - 1, "stackable")
    L6_314 = L12_320
    L12_320 = A0_308.getSameItemNum
    L12_320 = L12_320(A0_308, L3_311, L4_312)
    L12_320 = L5_313 - L12_320
    if L12_320 == 0 then
      A0_308:setListPropertyVisibility(L1_309, L11_319 - 1, false)
    elseif A0_308.work.isRepairMode == true then
      A0_308:updateStackPrintRepairItem(L3_311, L4_312, L1_309, L11_319)
    else
      A0_308:setListPropertyVisibility(L1_309, L11_319 - 1, true)
    end
    if L6_314 == 1 then
      A0_308:setListText(L1_309, L11_319 - 1, "stack", 225, L12_320)
    else
      A0_308:setListProperty(L1_309, L11_319 - 1, "stack", "")
    end
  end
  L8_316(L9_317, L10_318)
end
function CraftEditWidget.updateStackPrintRepairItem(A0_321, A1_322, A2_323, A3_324, A4_325)
  if worldMaster:_getMyPlayer():_getItem(A1_322, A2_323) ~= nil then
    if worldMaster:_getMyPlayer():_getItem(A1_322, A2_323):isRepairable() == true or worldMaster:_getMyPlayer():_getItem(A1_322, A2_323):isEquipment() == true then
      A0_321:setListPropertyVisibility(A3_324, A4_325 - 1, false)
    else
      A0_321:setListPropertyVisibility(A3_324, A4_325 - 1, true)
    end
  end
end
function CraftEditWidget.gotoParent(A0_326, A1_327)
  local L2_328
  L2_328 = A0_326._getParentWidget
  L2_328 = L2_328(A0_326)
  if L2_328 ~= nil then
    if A0_326.work.mode == 415 and A0_326.work.chosenOperation == 0 then
      L2_328:setRecipeIndex(0, A0_326.work.listbox)
      if A0_326.work.listbox ~= 5 then
        A0_326.work.mode = 410
      end
    end
    A0_326.work.mode = 0
    A0_326.work.recipeopen = false
    A0_326:setModal(false)
    desktopWidget:changeFocusedWidget(L2_328, true)
    if A1_327 == true then
      L2_328:displaySlotItemHelp()
    end
    return L2_328:returnFocus()
  end
end
function CraftEditWidget.setItem(A0_329)
  if A0_329:_getParentWidget() ~= nil then
    A0_329:_getParentWidget():setSlotItem(A0_329.work.chosenPackage, A0_329.work.chosenItem, A0_329.work.num1)
  end
  A0_329:updateStackPrint()
end
function CraftEditWidget.removeItem(A0_330)
  if A0_330:_getParentWidget() ~= nil then
    A0_330:_getParentWidget():clearMaterialSlot()
  end
  A0_330:updateStackPrint()
end
function CraftEditWidget.getEmptySlotNum(A0_331)
  if A0_331:_getParentWidget() ~= nil then
    return A0_331:_getParentWidget():countEmptySlot()
  end
end
function CraftEditWidget.getSameItemNum(A0_332, A1_333, A2_334)
  if A0_332:_getParentWidget() ~= nil then
    return A0_332:_getParentWidget():countMaterialInSlot(A1_333, A2_334)
  end
end
function CraftEditWidget.updatePlayerItem(A0_335, A1_336, A2_337)
  local L3_338
  L3_338 = -1
  if A1_336 == 0 then
    A0_335.work.updatecount = A2_337
    return
  elseif A1_336 == 1 then
    A0_335:makeListFromPackage(A1_336, A2_337)
    L3_338 = 1
  elseif A1_336 == 100 then
    A0_335:makeListFromPackage(A1_336, A2_337)
    L3_338 = 2
  elseif A1_336 == 101 then
  elseif A1_336 == 8 then
  elseif A1_336 == 5 then
  end
  if 0 < A0_335.work.updatecount then
    A0_335.work.updatecount = A0_335.work.updatecount - 1
  end
  if A0_335.work.updatecount == 0 then
    if L3_338 ~= -1 then
      A0_335:updateListProperty(A0_335:getListPropertyName(L3_338))
    end
    if L3_338 == 1 then
      A0_335:updateStackPrint()
    end
    if L3_338 == A0_335.work.listbox then
      A0_335:updateListFocus()
    end
    A0_335:displayBagcapacityAndMoney()
  end
  return
end
function CraftEditWidget.displayLeftButtonHelp(A0_339, A1_340, A2_341)
  A0_339.work.listSelectStep = 0
  A0_339.work.editWidgetMode = 4
  A0_339.work.bonus1 = false
  A0_339.work.bonus2 = false
  A0_339.work.bonus3 = false
  A0_339.work.itemlife = false
  A0_339.work.page = 0
  A0_339:setGridVisibility(2)
  A0_339:setText("TextBlock_Title", A1_340)
  A0_339:setText("TextBlock_Help", A2_341)
  A0_339:setVisibility("Grid_MateriaEquipList", false)
end
function CraftEditWidget.displayLeftItemHelp(A0_342, A1_343)
  if A0_342.work.mode == 415 then
    return false
  end
  A0_342.work.listSelectStep = 1
  A0_342.work.listbox = 8
  A0_342.work.editWidgetMode = 3
  A0_342.work.index = A1_343
  if A0_342.work.isRepairMode == true then
    A0_342:setText("TextBlock_Title", 3047)
  else
    A0_342:setText("TextBlock_Title", 3031)
  end
  A0_342.work.bonus1 = false
  A0_342.work.bonus2 = false
  A0_342.work.bonus3 = false
  A0_342.work.itemlife = false
  A0_342.work.page = 0
  A0_342:displayFocusedItemHelp()
  A0_342:setGridVisibility(3)
  if A1_343 == 0 then
    A0_342:setText("TextBlock_Title", 3044)
    A0_342:setVisibility("Grid_ItemDetail1", false)
    A0_342:setVisibility("Grid_ItemDetail2", false)
    A0_342:setVisibility("Grid_ItemDetail3", true)
    A0_342:setVisibility("Label_ItemBonus5", false)
    A0_342:setVisibility("Grid_ItemLife", true)
    A0_342:setVisibility("TOG_itemDetail", false)
    A0_342:setVisibility("Grid_ItemRare", false)
    A0_342:setVisibility("Grid_ItemTrade", false)
    A0_342:setVisibility("Grid_BackpackAndGil", false)
  end
end
function CraftEditWidget.openItemList(A0_344)
  if A0_344.work.isRepairMode == true then
    A0_344.work.mode = 411
  else
    A0_344.work.mode = 410
  end
  A0_344.work.editWidgetMode = 1
  A0_344.work.listSelectStep = 1
  A0_344:setVisibility("TabItem_1", true)
  A0_344:setVisibility("TabItem_2", true)
  A0_344:setVisibility("TabItem_3", false)
  A0_344:setVisibility("TabItem_4", false)
  A0_344:setVisibility("TabItem_5", false)
  A0_344.work.listbox = 1
  A0_344.work.index = 0
  A0_344:setSelectedIndex("TabControl_ItemList", 0)
  A0_344:selectedBorder(nil, false)
  A0_344:updateWindowDisplay(true)
  if A0_344.work.isRepairMode == true then
    A0_344:setText("TextBlock_Title", 3047)
  else
    A0_344:setText("TextBlock_Title", 3031)
  end
  A0_344.work.chosenOperation = 0
  A0_344.work.recipeopen = false
  A0_344:setInputEnable(true)
end
function CraftEditWidget.removeItemOperate(A0_345, A1_346)
  if A0_345.work.mode == 415 then
    return false
  end
  if A0_345.work.isRepairMode == true then
    A0_345.work.mode = 411
  else
    A0_345.work.mode = 410
  end
  A0_345.work.listbox = 8
  A0_345.work.index = A1_346 + 8
  A0_345.work.editWidgetMode = 2
  A0_345.work.listSelectStep = 2
  A0_345:setGridVisibility(7)
  A0_345:updateWindowDisplay()
  A0_345:setEnable("Button_EditCommand", true)
  A0_345:setWindowFocus("Button_EditCommand")
  if A0_345.work.isRepairMode == true then
    A0_345:setText("TextBlock_Title", 3047)
  else
    A0_345:setText("TextBlock_Title", 3031)
  end
end
function CraftEditWidget.getSlotIcon(A0_347, A1_348)
  local L2_349
  L2_349 = A0_347.getListPropertyName
  L2_349 = L2_349(A0_347, 8)
  return A0_347:getListProperty(L2_349, A1_348, "icon")
end
function CraftEditWidget.openRecipe(A0_350)
  A0_350.work.recipeopen = true
end
function CraftEditWidget.closeRecipe(A0_351)
  A0_351.work.recipeopen = false
end
function CraftEditWidget.openRecipeList(A0_352, A1_353)
  A0_352.work.chosenOperation = 0
  if A1_353 == nil then
    A0_352.work.currentmode = 5
    A0_352:setControlProperty("TextBlock_Title", "Focusable", true)
    A0_352:setControlProperty("TextBlock_Title", "IsTabStop", true)
    A0_352:setControlProperty("Button_Back", "Focusable", false)
    A0_352:setControlProperty("Button_Back", "IsTabStop", false)
    A0_352:setModal(true)
    desktopWidget:changeFocusedWidget(A0_352, true)
    A0_352.work.mode = 415
    A0_352.work.editWidgetMode = 5
    A0_352.work.listbox = 5
    A0_352.work.focus = 0
    A0_352.work.index = 0
    A0_352.work.recipeopen = false
    A0_352:setVisibility("TabItem_1", false)
    A0_352:setVisibility("TabItem_2", false)
    A0_352:setVisibility("TabItem_3", false)
    A0_352:setVisibility("TabItem_4", false)
    A0_352:setVisibility("TabItem_5", true)
    A0_352:setSelectedIndex("TabControl_ItemList", 4)
    A0_352:selectedBorder(nil, false)
    A0_352.work.listSelectStep = 1
    A0_352:setText("TextBlock_Title", 3081)
    if A0_352:getListBoxItemNum(5) == 0 then
      A0_352:setGridVisibility(8)
      A0_352:updateWindowDisplay()
      A0_352:displayHelp(3082)
      A0_352:setControlProperty("Button_Back", "Focusable", true)
      A0_352:setControlProperty("Button_Back", "IsTabStop", true)
    else
      A0_352:setGridVisibility(9)
      A0_352:updateWindowDisplay(true)
    end
  else
    A0_352.work.listSelectStep = 1
    A0_352:selectedBorder()
    A0_352:updateWindowDisplay(true)
    A0_352:setModal(true)
    A0_352.work.recipeopen = false
    desktopWidget:changeFocusedWidget(A0_352, true)
  end
  A0_352:setControlProperty("TextBlock_Title", "Focusable", false)
  A0_352:setControlProperty("TextBlock_Title", "IsTabStop", false)
end
function CraftEditWidget.openHistoryList(A0_354, A1_355, A2_356, A3_357)
  local L4_358, L5_359
  if A1_355 == nil then
    L4_358 = A0_354.work
    L4_358.currentmode = A2_356
    L5_359 = A0_354
    L4_358 = A0_354.setControlProperty
    L4_358(L5_359, "TextBlock_Title", "Focusable", true)
    L5_359 = A0_354
    L4_358 = A0_354.setControlProperty
    L4_358(L5_359, "TextBlock_Title", "IsTabStop", true)
    L5_359 = A0_354
    L4_358 = A0_354.setControlProperty
    L4_358(L5_359, "Button_Back", "Focusable", false)
    L5_359 = A0_354
    L4_358 = A0_354.setControlProperty
    L4_358(L5_359, "Button_Back", "IsTabStop", false)
    L5_359 = A0_354
    L4_358 = A0_354.setModal
    L4_358(L5_359, true)
    L4_358 = desktopWidget
    L5_359 = L4_358
    L4_358 = L4_358.changeFocusedWidget
    L4_358(L5_359, A0_354, true)
    L4_358 = A0_354.work
    L4_358.mode = 415
    L4_358 = A0_354.work
    L4_358.editWidgetMode = 5
    L4_358 = A0_354.work
    L4_358.listbox = A2_356
    L4_358 = A0_354.work
    L4_358.focus = 0
    L4_358 = A0_354.work
    L4_358.index = 0
    L5_359 = A0_354
    L4_358 = A0_354.setVisibility
    L4_358(L5_359, "TabItem_1", false)
    L5_359 = A0_354
    L4_358 = A0_354.setVisibility
    L4_358(L5_359, "TabItem_2", false)
    L5_359 = A0_354
    L4_358 = A0_354.setVisibility
    L4_358(L5_359, "TabItem_3", true)
    L5_359 = A0_354
    L4_358 = A0_354.setVisibility
    L4_358(L5_359, "TabItem_4", true)
    L5_359 = A0_354
    L4_358 = A0_354.setVisibility
    L4_358(L5_359, "TabItem_5", false)
    L5_359 = A0_354
    L4_358 = A0_354.setSelectedIndex
    L4_358(L5_359, "TabControl_ItemList", A2_356 - 1)
    L5_359 = A0_354
    L4_358 = A0_354.selectedBorder
    L4_358(L5_359, nil, false)
    L5_359 = A0_354
    L4_358 = A0_354.setText
    L4_358(L5_359, "TextBlock_Title", A0_354:getControlProperty("TabItem_" .. tostring(A0_354.work.listbox), "Header"))
    L4_358 = A0_354.work
    L4_358.listSelectStep = 1
    L5_359 = A0_354
    L4_358 = A0_354.getListBoxItemNum
    L4_358 = L4_358(L5_359, A2_356)
    if L4_358 == 0 then
      L5_359 = A0_354
      L4_358 = A0_354.updateWindowDisplay
      L4_358(L5_359, true)
      L5_359 = A0_354
      L4_358 = A0_354.setControlProperty
      L4_358(L5_359, "Button_Back", "Focusable", true)
      L5_359 = A0_354
      L4_358 = A0_354.setControlProperty
      L4_358(L5_359, "Button_Back", "IsTabStop", true)
    else
      L5_359 = A0_354
      L4_358 = A0_354.setGridVisibility
      L4_358(L5_359, 9)
      L5_359 = A0_354
      L4_358 = A0_354.updateWindowDisplay
      L4_358(L5_359, true)
    end
    L4_358 = A0_354.work
    L4_358.chosenOperation = 0
  else
    L4_358 = A0_354.work
    L4_358.listSelectStep = 1
    if A3_357 == 0 then
      L5_359 = A0_354
      L4_358 = A0_354.selectedBorder
      L4_358(L5_359)
    else
      L4_358 = A0_354.work
      L5_359 = A3_357 - 1
      L4_358.index = L5_359
      L4_358 = A0_354.work
      L5_359 = A3_357 - 1
      L4_358.focus = L5_359
    end
    L5_359 = A0_354
    L4_358 = A0_354.updateWindowDisplay
    L4_358(L5_359, true)
    L5_359 = A0_354
    L4_358 = A0_354.setModal
    L4_358(L5_359, true)
    L4_358 = A0_354.work
    L4_358.chosenOperation = 0
    L4_358 = A0_354.work
    L4_358 = L4_358.recipeopen
    if L4_358 == true then
      L5_359 = A0_354
      L4_358 = A0_354._getParentWidget
      L4_358 = L4_358(L5_359)
      L5_359 = L4_358.isRecipeWidgetOpen
      L5_359 = L5_359(L4_358)
      if L5_359 == nil then
      else
        desktopWidget:changeFocusedWidget(L5_359, true)
        A0_354:setInputEnable(false)
      end
    else
      L4_358 = desktopWidget
      L5_359 = L4_358
      L4_358 = L4_358.changeFocusedWidget
      L4_358(L5_359, A0_354, true)
      L5_359 = A0_354
      L4_358 = A0_354.setInputEnable
      L4_358(L5_359, true)
      L4_358 = A0_354.work
      L4_358.recipeopen = false
    end
  end
  L5_359 = A0_354
  L4_358 = A0_354.setControlProperty
  L4_358(L5_359, "TextBlock_Title", "Focusable", false)
  L5_359 = A0_354
  L4_358 = A0_354.setControlProperty
  L4_358(L5_359, "TextBlock_Title", "IsTabStop", false)
end
function CraftEditWidget.focusRecipeList(A0_360)
  A0_360:updateWindowDisplay(true)
end
function CraftEditWidget.closeRecipeDetail(A0_361)
  A0_361:selectedBorder()
  A0_361:updateWindowDisplay(true)
end
function CraftEditWidget.syncItemWork(A0_362, A1_363)
end
function CraftEditWidget.operateSort(A0_364, A1_365)
  local L2_366
  L2_366 = A0_364.work
  L2_366 = L2_366.listbox
  if L2_366 == 1 then
    if A1_365 ~= nil then
      L2_366 = A0_364.work
      L2_366.sorttype = A1_365
    else
      L2_366 = A0_364.changeSortType
      L2_366(A0_364)
    end
    L2_366 = A0_364.work
    L2_366 = L2_366.index
    A0_364:updateSortType()
    if A0_364:indexToFocus(A0_364.work.listbox, L2_366) > -1 then
      A0_364.work.focus = A0_364:indexToFocus(A0_364.work.listbox, L2_366)
    end
    if A0_364:focusToIndex(A0_364.work.listbox, A0_364.work.focus) >= 0 then
      A0_364.work.index = A0_364:focusToIndex(A0_364.work.listbox, A0_364.work.focus)
    end
    A0_364:displaySortType(A0_364.work.sorttype)
  end
  L2_366 = true
  return L2_366
end
function CraftEditWidget.displaySortType(A0_367, A1_368)
  desktopWidget:displaySortType(A1_368, A0_367, "Button_SortStatus")
end
function CraftEditWidget.changeSortType(A0_369)
  A0_369.work.sorttype = desktopWidget:changeSortType(A0_369.work.sorttype)
end
function CraftEditWidget.saveSortType(A0_370)
  desktopWidget:saveSortType(A0_370.work.sorttype)
end
