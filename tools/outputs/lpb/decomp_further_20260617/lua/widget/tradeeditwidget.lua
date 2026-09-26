require("/Widget/WidgetBaseClass")
_defineClass("TradeEditWidget", "WidgetBaseClass")
function TradeEditWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "SubItemListWidget"
  return L1_1
end
function TradeEditWidget.init(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8
  L5_7 = "chosenItem"
  L6_8 = "integer32"
  L5_7 = {L6_8, "integer32"}
  L6_8 = "chosenPackage"
  L6_8 = {
    "chosenOperation",
    "integer32"
  }
  L2_4._temp = L3_5
  L2_4.chosenItem = 0
  L2_4.chosenOperation = 0
  L2_4.isRewardMode = false
  L2_4.checkSlot = false
  L2_4.bonus1 = false
  L2_4.bonus2 = false
  L2_4.bonus3 = false
  L2_4.itemlife = false
  L2_4.bazaar = false
  L2_4.updatenexttime = false
  L2_4.closeok = false
  L2_4.demandSync = false
  L2_4.focus = 0
  L5_7 = 9
  L2_4.sorttype = L3_5
  L2_4(L3_5, L4_6)
  L5_7 = ""
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = "Command"
  L6_8 = "UILuaCommands.Operate"
  L2_4(L3_5, L4_6, L5_7, L6_8)
  L2_4(L3_5, L4_6)
  L5_7 = 3318
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = "Command"
  L6_8 = "UILuaCommands.Operate"
  L2_4(L3_5, L4_6, L5_7, L6_8)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L5_7 = 3115
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = "UILuaCommands.ButtonFocused"
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = "NumberInputBox.ValueChanged"
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = "NumberInputBox.ValueChanged"
  L2_4(L3_5, L4_6, L5_7)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  for L5_7 = 1, 5 do
    L6_8 = "TabItem_"
    L6_8 = L6_8 .. tostring(L5_7)
    A0_2:setCancelCondition(L6_8)
  end
  L5_7 = "UILuaCommands.TabChanged"
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = 214
  L6_8 = 10091
  L2_4(L3_5, L4_6, L5_7, L6_8)
  L5_7 = 214
  L6_8 = 10093
  L2_4(L3_5, L4_6, L5_7, L6_8)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L5_7 = ""
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = 3322
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = 1
  L6_8 = 1
  L2_4(L3_5, L4_6, L5_7, L6_8, 1)
  L5_7 = 0
  L6_8 = 999999999
  L2_4(L3_5, L4_6, L5_7, L6_8, 0)
  L2_4(L3_5, L4_6)
end
function TradeEditWidget.setInitialData(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14
  L2_11(L3_12, L4_13)
  L2_11.mode = 450
  L2_11.listSelectStep = 1
  L2_11.listbox = 1
  L2_11.index = 0
  L2_11(L3_12, L4_13)
  L2_11(L3_12, L4_13)
  L2_11(L3_12, L4_13)
  L2_11(L3_12, L4_13)
  L2_11(L3_12, L4_13)
  L2_11(L3_12)
  for L5_14 = 0, 8 do
    A0_9:setDummyItem(L5_14)
  end
  L5_14 = L2_11(L3_12, L4_13)
  if L2_11 > 0 then
    A0_9.work.index = L4_13
    A0_9.work.focus = 0
  end
  A0_9:displayBagcapacityAndMoney()
end
function TradeEditWidget.setNumberInput(A0_15, A1_16, A2_17, A3_18, A4_19)
  A0_15:setControlProperty(A1_16, "Minimum", A2_17)
  A0_15:setMaximum(A1_16, A3_18)
  A0_15:setValue(A1_16, A4_19)
end
function TradeEditWidget.getListPropertyName(A0_20, A1_21)
  local L2_22
  if A1_21 == 1 then
    L2_22 = "TabItem_1_Maker"
    return L2_22
  elseif A1_21 == 2 then
    L2_22 = "TabItem_2_Maker"
    return L2_22
  elseif A1_21 == 3 then
    L2_22 = "TabItem_3_Maker"
    return L2_22
  elseif A1_21 == 4 then
    L2_22 = "TabItem_4_Maker"
    return L2_22
  elseif A1_21 == 5 then
    L2_22 = "TabItem_5_Maker"
    return L2_22
  elseif A1_21 == 8 then
    L2_22 = "SlotItem_Maker"
    return L2_22
  elseif A1_21 == 9 then
    L2_22 = "HelpCache_Maker"
    return L2_22
  end
end
function TradeEditWidget.setButtonEvents(A0_23, A1_24)
  local L2_25
  L2_25 = A0_23._getProperty
  L2_25 = L2_25(A0_23, nil, A1_24, "Command")
  A0_23:setControlCommandCondition(A1_24, L2_25)
  A0_23:setCancelCondition(A1_24)
end
function TradeEditWidget.updateWindowDisplay(A0_26, A1_27)
  local L2_28
  L2_28 = A0_26.work
  L2_28 = L2_28.editWidgetMode
  if L2_28 == 1 then
    L2_28 = A0_26.work
    L2_28 = L2_28.listSelectStep
    if L2_28 == 0 then
      L2_28 = A0_26.setGridVisibility
      L2_28(A0_26, 3)
    else
      L2_28 = A0_26.work
      L2_28 = L2_28.listSelectStep
      if L2_28 == 1 then
        L2_28 = A0_26.setGridVisibility
        L2_28(A0_26, 4)
      else
        L2_28 = A0_26.work
        L2_28 = L2_28.listSelectStep
        if L2_28 == 2 then
          L2_28 = A0_26.getListPropertyName
          L2_28 = L2_28(A0_26, A0_26.work.listbox)
          if A0_26:getListProperty(L2_28, A0_26.work.index, "stackable") == 1 then
            A0_26:setGridVisibility(6)
          else
            A0_26:setGridVisibility(5)
          end
        else
          return
        end
      end
    end
  end
  if A1_27 == true then
    L2_28 = A0_26.updateListFocus
    L2_28(A0_26)
  end
end
function TradeEditWidget.updateListFocus(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41
  L1_30 = A0_29.work
  L1_30 = L1_30.listSelectStep
  if L1_30 >= 1 then
    L1_30 = A0_29.work
    L1_30 = L1_30.listbox
    if L1_30 ~= 8 then
      L2_31 = A0_29
      L1_30 = A0_29.getListBoxFocusNum
      L3_32 = A0_29.work
      L3_32 = L3_32.listbox
      L4_33 = L1_30(L2_31, L3_32)
      L6_35 = A0_29
      L5_34 = A0_29.getListPropertyName
      L7_36 = A0_29.work
      L7_36 = L7_36.listbox
      L5_34 = L5_34(L6_35, L7_36)
      L7_36 = A0_29
      L6_35 = A0_29.getListBoxName
      L8_37 = A0_29.work
      L8_37 = L8_37.listbox
      L6_35 = L6_35(L7_36, L8_37)
      L7_36 = "TextBlock_NoContents_"
      L8_37 = tostring
      L9_38 = A0_29.work
      L9_38 = L9_38.listbox
      L8_37 = L8_37(L9_38)
      L7_36 = L7_36 .. L8_37
      if L1_30 == 0 then
        L9_38 = A0_29
        L8_37 = A0_29.displayHelp
        L10_39 = 3140
        L8_37(L9_38, L10_39)
        L8_37 = A0_29.work
        L8_37.bonus1 = false
        L8_37 = A0_29.work
        L8_37.bonus2 = false
        L8_37 = A0_29.work
        L8_37.bonus3 = false
        L8_37 = A0_29.work
        L8_37.itemlife = false
        L8_37 = A0_29.work
        L8_37.page = 0
        L9_38 = A0_29
        L8_37 = A0_29.setGridVisibility
        L10_39 = 1
        L8_37(L9_38, L10_39)
        L9_38 = A0_29
        L8_37 = A0_29.setVisibility
        L10_39 = L7_36
        L11_40 = true
        L8_37(L9_38, L10_39, L11_40)
        L9_38 = A0_29
        L8_37 = A0_29.setHidden
        L10_39 = L6_35
        L8_37(L9_38, L10_39)
        L9_38 = A0_29
        L8_37 = A0_29.setWindowFocus
        L10_39 = L7_36
        L8_37(L9_38, L10_39)
        L8_37 = A0_29.work
        L8_37 = L8_37.listSelectStep
        if L8_37 == 1 then
          L9_38 = A0_29
          L8_37 = A0_29.setVisibility
          L10_39 = "Grid_Button"
          L11_40 = true
          L8_37(L9_38, L10_39, L11_40)
        end
      else
        L9_38 = A0_29
        L8_37 = A0_29.setVisibility
        L10_39 = L6_35
        L11_40 = true
        L8_37(L9_38, L10_39, L11_40)
        L9_38 = A0_29
        L8_37 = A0_29.setVisibility
        L10_39 = L7_36
        L11_40 = false
        L8_37(L9_38, L10_39, L11_40)
        L8_37 = A0_29.work
        L8_37 = L8_37.focus
        L9_38 = L1_30 - 1
        if L8_37 >= L9_38 then
          L8_37 = A0_29.work
          L9_38 = L1_30 - 1
          L8_37.focus = L9_38
        end
        L9_38 = A0_29
        L8_37 = A0_29.focusToIndex
        L10_39 = A0_29.work
        L10_39 = L10_39.listbox
        L11_40 = A0_29.work
        L11_40 = L11_40.focus
        L8_37 = L8_37(L9_38, L10_39, L11_40)
        if L8_37 >= 0 then
          L9_38 = A0_29.work
          L9_38.index = L8_37
        end
        L10_39 = A0_29
        L9_38 = A0_29.setControlProperty
        L11_40 = L6_35
        L12_41 = "SqwtFocusedIndex"
        L9_38(L10_39, L11_40, L12_41, A0_29.work.focus)
        L10_39 = A0_29
        L9_38 = A0_29.setFocusedIndex
        L11_40 = L6_35
        L12_41 = A0_29.work
        L12_41 = L12_41.focus
        L9_38(L10_39, L11_40, L12_41)
        L9_38 = A0_29.work
        L9_38 = L9_38.listSelectStep
        if L9_38 == 1 then
          L10_39 = A0_29
          L9_38 = A0_29.setWindowFocus
          L11_40 = L6_35
          L9_38(L10_39, L11_40)
        end
        L10_39 = A0_29
        L9_38 = A0_29.displayFocusedItemHelp
        L9_38(L10_39)
        L9_38 = A0_29.work
        L9_38 = L9_38.listSelectStep
        if L9_38 >= 1 then
          L10_39 = A0_29
          L9_38 = A0_29.getListPropertyName
          L11_40 = A0_29.work
          L11_40 = L11_40.listbox
          L9_38 = L9_38(L10_39, L11_40)
          L10_39 = A0_29.work
          L12_41 = A0_29
          L11_40 = A0_29.getPackageFromList
          L11_40 = L11_40(L12_41, A0_29.work.listbox)
          L10_39.chosenPackage = L11_40
          L10_39 = A0_29.work
          L11_40 = A0_29.work
          L11_40 = L11_40.index
          L11_40 = L11_40 + 1
          L10_39.chosenItem = L11_40
          L10_39 = worldMaster
          L11_40 = L10_39
          L10_39 = L10_39._getMyPlayer
          L10_39 = L10_39(L11_40)
          L12_41 = L10_39
          L11_40 = L10_39._getItem
          L11_40 = L11_40(L12_41, A0_29.work.chosenPackage, A0_29.work.chosenItem)
          L12_41 = A0_29.work
          L12_41.num1max = A0_29:getListProperty(L9_38, A0_29.work.index, "stackCount")
          L12_41 = A0_29.setText
          L12_41(A0_29, "TextBlock_ItemStackMax", 225, A0_29.work.num1max)
          L12_41 = A0_29.isItemCrystal
          L12_41 = L12_41(A0_29, L11_40)
          if L12_41 == true then
            L12_41 = A0_29.work
            L12_41 = L12_41.num1max
            if L12_41 > 999 then
              L12_41 = A0_29.work
              L12_41.num1max = 999
            end
          end
          L12_41 = A0_29.work
          L12_41.num1 = 1
          L12_41 = A0_29.setNumberInput
          L12_41(A0_29, "CustomControl_NumberInput", 1, A0_29.work.num1max, 1)
          L12_41 = A0_29.isOperateButtonEnable
          L12_41 = L12_41(A0_29, A0_29.work.listbox, A0_29.work.index)
          A0_29:setEnable("Button_EditCommand", L12_41)
          if A0_29.work.listSelectStep == 2 then
            if L12_41 == true then
              if A0_29:getListProperty(L9_38, A0_29.work.index, "stackable") == 1 then
                A0_29:setGridVisibility(6)
              else
                A0_29:setGridVisibility(5)
              end
              A0_29:setWindowFocus("Button_EditCommand")
            else
              A0_29:setVisibility("Grid_ItemStack", false)
              A0_29:setWindowFocus("Button_EditBack")
            end
          end
        end
      end
    end
  end
end
function TradeEditWidget.setGridVisibility(A0_42, A1_43)
  A0_42:setVisibility("Grid_Edit", A1_43 == 5 or A1_43 == 6 or A1_43 == 7 or A1_43 == 8)
  A0_42:setVisibility("Grid_Button", A1_43 == 4)
  A0_42:setVisibility("Grid_ItemStack", A1_43 == 6)
  A0_42:setVisibility("Grid_NumberInput_Gil", A1_43 == 7)
  A0_42:setVisibility("Grid_TabList", A1_43 == 1 or A1_43 == 4)
  if A0_42.work.listbox == 1 and A0_42.work.listSelectStep == 1 then
    A0_42:setVisibility("Button_SortStatus", true)
    A0_42:displaySortType(A0_42.work.sorttype)
  else
    A0_42:setVisibility("Button_SortStatus", false)
  end
  A0_42:setVisibility("Grid_ActorName", A1_43 == 3 or A1_43 == 9 or A1_43 == 10 or A1_43 == 11)
  A0_42:setVisibility("Grid_Help", A1_43 == 1 or A1_43 == 2 or A1_43 == 11)
  A0_42:setVisibility("Grid_BackpackAndGil", A1_43 == 1 or A1_43 == 4 or A1_43 == 5 or A1_43 == 6 or A1_43 == 7 or A1_43 == 8 or A1_43 == 10 or A1_43 == 11)
  A0_42:setVisibility("Grid_ItemNameBase", A1_43 == 3 or A1_43 == 4 or A1_43 == 5 or A1_43 == 6 or A1_43 == 7 or A1_43 == 8 or A1_43 == 9)
  if 1 <= A0_42.work.listSelectStep or A1_43 == 3 then
    A0_42:setVisibility("Grid_ItemDetail1", A0_42.work.bonus1)
    A0_42:setVisibility("Grid_ItemDetail2", A0_42.work.bonus2)
    A0_42:setVisibility("Grid_ItemDetail3", A0_42.work.bonus3 or A0_42.work.itemlife or A0_42.work.bazaar)
    A0_42:setVisibility("Label_ItemBonus5", A0_42.work.bonus3)
    A0_42:setVisibility("Grid_ItemLife", A0_42.work.itemlife)
    A0_42:setVisibility("TOG_itemDetail", false)
  else
    A0_42:setVisibility("Grid_ItemDetail1", A0_42.work.bonus1)
    A0_42:setVisibility("Grid_ItemDetail2", A0_42.work.bonus2)
    A0_42:setVisibility("Grid_ItemDetail3", A0_42.work.bonus3 or A0_42.work.itemlife or A0_42.work.bazaar)
    A0_42:setVisibility("Label_ItemBonus5", A0_42.work.bonus3)
    A0_42:setVisibility("Grid_ItemLife", A0_42.work.itemlife)
  end
end
function TradeEditWidget.setWindowFocus(A0_44, A1_45)
  if A1_45 ~= nil and A1_45 ~= "" then
    A0_44:setLogicalFocus(A1_45)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_44 then
      A0_44:setKeyboardFocusedControl(A1_45)
    end
  end
end
function TradeEditWidget.displayBagcapacityAndMoney(A0_46)
  local L1_47, L2_48, L3_49
  L1_47 = worldMaster
  L2_48 = L1_47
  L1_47 = L1_47._getMyPlayer
  L1_47 = L1_47(L2_48)
  L2_48 = 0
  L3_49 = A0_46.work
  L2_48 = L3_49.playerMoneyCount
  if L2_48 > 0 then
    L3_49 = A0_46.work
    L3_49 = L3_49.playerMoneyIndex
    if L3_49 > 0 then
      L3_49 = L1_47._getItem
      L3_49 = L3_49(L1_47, 100, A0_46.work.playerMoneyIndex)
      if L3_49 ~= nil and L3_49:_isTrading() == true then
        L2_48 = L2_48 - L3_49:_isTrading()
      end
    end
  end
  L3_49 = A0_46.setText
  L3_49(A0_46, "TextBlock_Gil", 3263, L2_48)
  L3_49 = L1_47._getItemPackageCapacity
  L3_49 = L3_49(L1_47, 1)
  A0_46:setText("TextBlock_ItemStack_2", 3551, L3_49 - L1_47:_getItemPackageFreeSpace(1), L3_49)
end
function TradeEditWidget.isExistItem(A0_50, A1_51, A2_52)
  if worldMaster:_getMyPlayer():_getItem(A1_51, A2_52) ~= nil then
    return true
  else
    return false
  end
end
function TradeEditWidget.getSelectedTab(A0_53)
  return A0_53:getSelectedIndex("TabControl_ItemList") + 1
end
function TradeEditWidget.getListBoxName(A0_54, A1_55)
  local L2_56
  if A1_55 == 1 then
    L2_56 = "ListBox_TabItem_1"
    return L2_56
  elseif A1_55 == 2 then
    L2_56 = "ListBox_TabItem_2"
    return L2_56
  elseif A1_55 == 3 then
    L2_56 = "ListBox_TabItem_3"
    return L2_56
  elseif A1_55 == 4 then
    L2_56 = "ListBox_TabItem_4"
    return L2_56
  elseif A1_55 == 5 then
    L2_56 = "ListBox_TabItem_5"
    return L2_56
  else
    L2_56 = ""
    return L2_56
  end
end
function TradeEditWidget.getListBoxItemNum(A0_57, A1_58)
  local L2_59, L3_60
  L3_60 = A0_57
  L2_59 = A0_57.getListPropertyCount
  return L2_59(L3_60, A0_57:getListPropertyName(A1_58))
end
function TradeEditWidget.getListBoxFocusNum(A0_61, A1_62)
  local L2_63, L3_64, L4_65, L5_66
  L3_64 = A0_61
  L2_63 = A0_61.getListBoxItemNum
  L4_65 = A1_62
  L2_63 = L2_63(L3_64, L4_65)
  L4_65 = A0_61
  L3_64 = A0_61.getListPropertyName
  L5_66 = A1_62
  L3_64 = L3_64(L4_65, L5_66)
  if L2_63 == 0 then
    L4_65 = 0
    L5_66 = 0
    return L4_65, L5_66, 0, 0
  end
  L5_66 = A0_61
  L4_65 = A0_61.getControlProperty
  L4_65 = L4_65(L5_66, L3_64, "FilteredCount")
  L5_66 = A0_61.work
  L5_66 = L5_66.focus
  if L4_65 < A0_61.work.focus then
    L5_66 = L4_65 - 1
  end
  return L4_65, L4_65 - 1, 0, L5_66
end
function TradeEditWidget.focusToIndex(A0_67, A1_68, A2_69)
  local L3_70
  L3_70 = A0_67.getListPropertyName
  L3_70 = L3_70(A0_67, A1_68)
  if A0_67:getListBoxFocusNum(A1_68) == 0 or A2_69 >= A0_67:getListBoxFocusNum(A1_68) then
    return -1
  else
    A0_67:setControlProperty(L3_70, "FilteredIndex", A2_69)
    return A0_67:getControlProperty(L3_70, "Index")
  end
end
function TradeEditWidget.indexToFocus(A0_71, A1_72, A2_73)
  local L3_74, L4_75
  L3_74 = -1
  L4_75 = A0_71.getListPropertyName
  L4_75 = L4_75(A0_71, A1_72)
  if A0_71:getListBoxFocusNum(A1_72) > 0 then
    A0_71:setControlProperty(L4_75, "Index", A2_73)
    L3_74 = A0_71:getControlProperty(L4_75, "FilteredIndex")
  end
  return L3_74
end
function TradeEditWidget.initListBox(A0_76, A1_77)
  local L2_78, L3_79
  L3_79 = A0_76
  L2_78 = A0_76.getListBoxName
  L2_78 = L2_78(L3_79, A1_77)
  if L2_78 ~= "" then
    L3_79 = A0_76.setControlProperty
    L3_79(A0_76, L2_78, "IntData.Value0", A1_77)
    L3_79 = A0_76.setControlCommandCondition
    L3_79(A0_76, L2_78, "UILuaCommands.MouseEnteredItem")
    L3_79 = A0_76.setControlCommandCondition
    L3_79(A0_76, L2_78, "UILuaCommands.AnchoredItem")
    L3_79 = A0_76.setControlCommandCondition
    L3_79(A0_76, L2_78, "UILuaCommands.Selection")
    L3_79 = A0_76.setCancelCondition
    L3_79(A0_76, L2_78)
    L3_79 = A0_76.setVisibility
    L3_79(A0_76, L2_78, true)
    L3_79 = "TextBlock_NoContents_"
    L3_79 = L3_79 .. tostring(A1_77)
    A0_76:setVisibility(L3_79, false)
    A0_76:setCancelCondition(L3_79)
    A0_76:setControlCommandCondition(L2_78, "UILuaCommands.Previous")
    A0_76:setControlCommandCondition(L2_78, "UILuaCommands.Next")
  end
end
function TradeEditWidget.resetListBox(A0_80, A1_81)
  local L2_82, L3_83
  L3_83 = A0_80
  L2_82 = A0_80.getListBoxItemNum
  L2_82 = L2_82(L3_83, A1_81)
  L3_83 = A0_80.getListPropertyName
  L3_83 = L3_83(A0_80, A1_81)
  if L2_82 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_82 do
      L2_82 = L2_82 - 1
      A0_80:deleteListProperty(L3_83, L2_82)
    end
    A0_80:updateListProperty(L3_83)
  end
  return
end
function TradeEditWidget.getPackageFromList(A0_84, A1_85)
  local L2_86
  L2_86 = 1
  if A1_85 == 1 then
    L2_86 = 1
  elseif A1_85 == 2 then
    L2_86 = 100
  elseif A1_85 == 3 then
    L2_86 = 101
  elseif A1_85 == 4 then
    L2_86 = 8
  end
  return L2_86
end
function TradeEditWidget.setItemToXml(A0_87, A1_88, A2_89, A3_90, A4_91, A5_92, A6_93, A7_94)
  local L8_95, L9_96, L10_97, L11_98, L12_99, L13_100, L14_101, L15_102, L16_103, L17_104, L18_105, L19_106, L20_107
  L9_96 = A0_87
  L8_95 = A0_87.getListPropertyName
  L10_97 = A1_88
  L8_95 = L8_95(L9_96, L10_97)
  L9_96, L10_97, L11_98, L12_99 = nil, nil, nil, nil
  L13_100 = worldMaster
  L14_101 = L13_100
  L13_100 = L13_100._getMyPlayer
  L13_100 = L13_100(L14_101)
  L14_101, L15_102 = nil, nil
  if A5_92 == 2 then
    if A6_93 ~= nil then
      L14_101 = A6_93
    elseif A3_90 > 0 and A4_91 > 0 then
      L16_103 = desktopWidget
      L17_104 = L16_103
      L16_103 = L16_103.getBazaarItem
      L18_105 = A3_90
      L19_106 = A4_91
      L16_103 = L16_103(L17_104, L18_105, L19_106)
      L14_101 = L16_103
    end
    if L14_101 == nil then
      L16_103 = false
      return L16_103
    end
    L17_104 = L14_101
    L16_103 = L14_101._getCatalogID
    L16_103 = L16_103(L17_104)
    L9_96 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101.getItemIcon
    L16_103 = L16_103(L17_104)
    L10_97 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101._isStackable
    L16_103 = L16_103(L17_104)
    L11_98 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101._countStack
    L16_103 = L16_103(L17_104)
    L12_99 = L16_103
    L17_104 = A0_87
    L16_103 = A0_87.setListProperty
    L18_105 = L8_95
    L19_106 = A2_89
    L20_107 = "itemOwner"
    L16_103(L17_104, L18_105, L19_106, L20_107, 2)
  elseif A5_92 == 3 then
    if A6_93 ~= nil then
      L14_101 = A6_93
      L17_104 = L14_101
      L16_103 = L14_101._getCatalogID
      L16_103 = L16_103(L17_104)
      L9_96 = L16_103
    else
      L16_103 = desktopWidget
      L17_104 = L16_103
      L16_103 = L16_103.getShopSellingItemInfo
      L18_105 = A3_90
      L19_106 = A4_91
      L16_103 = L16_103(L17_104, L18_105, L19_106)
      L9_96 = L16_103
      L17_104 = L13_100
      L16_103 = L13_100.createVirtualItem
      L18_105 = L9_96
      L16_103 = L16_103(L17_104, L18_105)
      L14_101 = L16_103
    end
    if L14_101 == nil then
      L16_103 = false
      return L16_103
    end
    L17_104 = L14_101
    L16_103 = L14_101.getItemIcon
    L16_103 = L16_103(L17_104)
    L10_97 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101._isStackable
    L16_103 = L16_103(L17_104)
    L11_98 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101._countStack
    L16_103 = L16_103(L17_104)
    L12_99 = L16_103
    L17_104 = A0_87
    L16_103 = A0_87.setListProperty
    L18_105 = L8_95
    L19_106 = A2_89
    L20_107 = "itemOwner"
    L16_103(L17_104, L18_105, L19_106, L20_107, 3)
  else
    if A6_93 ~= nil then
      L14_101 = A6_93
    elseif A3_90 > 0 and A4_91 > 0 then
      L17_104 = L13_100
      L16_103 = L13_100._getItem
      L18_105 = A3_90
      L19_106 = A4_91
      L16_103 = L16_103(L17_104, L18_105, L19_106)
      L14_101 = L16_103
    end
    if L14_101 == nil then
      L16_103 = false
      return L16_103
    end
    L17_104 = L14_101
    L16_103 = L14_101._getCatalogID
    L16_103 = L16_103(L17_104)
    L9_96 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101.getItemIcon
    L16_103 = L16_103(L17_104)
    L10_97 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101._isStackable
    L16_103 = L16_103(L17_104)
    L11_98 = L16_103
    L17_104 = L14_101
    L16_103 = L14_101._countStack
    L16_103 = L16_103(L17_104)
    L12_99 = L16_103
    L17_104 = A0_87
    L16_103 = A0_87.setListProperty
    L18_105 = L8_95
    L19_106 = A2_89
    L20_107 = "itemOwner"
    L16_103(L17_104, L18_105, L19_106, L20_107, 1)
  end
  if L9_96 == 1000001 then
    L16_103 = A0_87.work
    L16_103.moneyIndex = A4_91
    L16_103 = A0_87.work
    L16_103.moneyCount = L12_99
  end
  L17_104 = L14_101
  L16_103 = L14_101._getNameIndex
  L16_103 = L16_103(L17_104)
  L17_104 = "TBL_null"
  L18_105 = 0
  L20_107 = L14_101
  L19_106 = L14_101.isEquipment
  L19_106 = L19_106(L20_107)
  if L19_106 == true and (A5_92 == 1 or A5_92 == nil) then
    L20_107 = L14_101
    L19_106 = L14_101._isEquipping
    L19_106 = L19_106(L20_107)
    if L19_106 then
      L18_105 = 1
    end
  end
  if L18_105 == 1 then
    L17_104 = "TBL_equippedItem"
  end
  L19_106 = A0_87.work
  L19_106 = L19_106.isRewardMode
  if L19_106 == true then
    L19_106 = A0_87.work
    L19_106 = L19_106.rewardItemPackage
    if L19_106 == A3_90 then
      L19_106 = A0_87.work
      L19_106 = L19_106.rewardItem
      if L19_106 == A4_91 then
        L17_104 = "TBL_selectedItem"
      end
    end
  end
  L19_106 = A0_87.work
  L19_106 = L19_106.sorttype
  L20_107 = 16
  if A1_88 == 2 then
    L19_106 = 11
    L20_107 = 17
  end
  desktopWidget:setItemToXml(A0_87, L8_95, A2_89, L14_101, L17_104, L9_96, L10_97, L11_98, L12_99, L16_103, L19_106, true, false, L20_107, A3_90, A4_91, A5_92, false)
  desktopWidget:setItemDetailToXml(A0_87, L8_95, A2_89, L14_101, L16_103, A5_92, L20_107, A7_94)
  return true
end
function TradeEditWidget.setItemToXmlLight(A0_108, A1_109, A2_110, A3_111, A4_112, A5_113)
  local L6_114, L7_115, L8_116, L9_117, L10_118, L11_119, L12_120, L13_121, L14_122, L15_123, L16_124, L17_125, L18_126
  L7_115 = A0_108
  L6_114 = A0_108.getListPropertyName
  L8_116 = A1_109
  L7_115 = L6_114(L7_115, L8_116)
  L8_116, L9_117, L10_118, L11_119 = nil, nil, nil, nil
  L12_120 = worldMaster
  L13_121 = L12_120
  L12_120 = L12_120._getMyPlayer
  L12_120 = L12_120(L13_121)
  L13_121, L14_122 = nil, nil
  if A3_111 > 0 and A4_112 > 0 then
    L16_124 = L12_120
    L15_123 = L12_120._getItem
    L17_125 = A3_111
    L18_126 = A4_112
    L15_123 = L15_123(L16_124, L17_125, L18_126)
    L13_121 = L15_123
  end
  if L13_121 == nil then
    L15_123 = false
    return L15_123
  end
  L16_124 = L13_121
  L15_123 = L13_121._getCatalogID
  L15_123 = L15_123(L16_124)
  L8_116 = L15_123
  L16_124 = L13_121
  L15_123 = L13_121.getItemIcon
  L15_123 = L15_123(L16_124)
  L9_117 = L15_123
  L16_124 = L13_121
  L15_123 = L13_121._isStackable
  L15_123 = L15_123(L16_124)
  L10_118 = L15_123
  L16_124 = L13_121
  L15_123 = L13_121._countStack
  L15_123 = L15_123(L16_124)
  L11_119 = L15_123
  L16_124 = L13_121
  L15_123 = L13_121._getNameIndex
  L15_123 = L15_123(L16_124)
  L16_124 = "TBL_null"
  L18_126 = L13_121
  L17_125 = L13_121._isEquipping
  L17_125 = L17_125(L18_126)
  if L17_125 then
    L16_124 = "TBL_equippedItem"
  end
  if L8_116 == 1000001 and A3_111 == 100 then
    L17_125 = A0_108.work
    L17_125.moneyIndex = A4_112
    L17_125 = A0_108.work
    L17_125.moneyCount = L11_119
  end
  L17_125 = A0_108.work
  L17_125 = L17_125.sorttype
  L18_126 = 18
  if A1_109 == 2 then
    L17_125 = 11
    L18_126 = 19
  end
  desktopWidget:setItemToXml(A0_108, L6_114, A2_110, L13_121, L16_124, L8_116, L9_117, L10_118, L11_119, L15_123, L17_125, true, false, L18_126, A3_111, A4_112, A5_113, false)
  return true
end
function TradeEditWidget.getMoneyListIndex(A0_127, A1_128)
  local L2_129, L3_130
  L2_129 = 1
  if A1_128 == 1000001 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000102 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000101 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000103 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000107 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000106 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000104 then
    L3_130 = -1
    return L3_130
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000108 then
    L3_130 = -1
    return L3_130
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000109 then
    L3_130 = -1
    return L3_130
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000105 then
    L3_130 = -1
    return L3_130
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000111 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000110 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000112 then
    L3_130 = -1
    return L3_130
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000113 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000114 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000115 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000116 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000117 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000118 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000119 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000120 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000121 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000122 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  if A1_128 == 1000123 then
    return L2_129
  else
    L2_129 = L2_129 + 1
  end
  L3_130 = -1
  return L3_130
end
function TradeEditWidget.setSortType(A0_131, A1_132, A2_133, A3_134, A4_135)
  local L5_136, L6_137
  L5_136 = worldMaster
  L6_137 = L5_136
  L5_136 = L5_136._getMyPlayer
  L5_136 = L5_136(L6_137)
  L6_137 = L5_136._getItem
  L6_137 = L6_137(L5_136, A4_135, A2_133 + 1)
  if L6_137 == nil then
    return
  end
  desktopWidget:setSortType(A0_131, A1_132, A2_133, A3_134, L6_137)
end
function TradeEditWidget.updateSortType(A0_138)
  local L1_139, L2_140
  L2_140 = A0_138
  L1_139 = A0_138.getListPropertyName
  L1_139 = L1_139(L2_140, 1)
  L2_140 = A0_138.getPackageFromList
  L2_140 = L2_140(A0_138, 1)
  for _FORV_6_ = 1, A0_138:getListBoxItemNum(1) do
    A0_138:setSortType(L1_139, _FORV_6_ - 1, A0_138.work.sorttype, L2_140)
  end
  A0_138:updateListProperty(L1_139)
end
function TradeEditWidget.makeListFromPackage(A0_141, A1_142, A2_143)
  local L3_144, L4_145, L5_146, L6_147, L7_148, L8_149, L9_150, L10_151, L11_152, L12_153, L13_154
  L3_144 = worldMaster
  L4_145 = L3_144
  L3_144 = L3_144._getMyPlayer
  L3_144 = L3_144(L4_145)
  L4_145, L5_146, L6_147, L7_148, L8_149, L9_150 = nil, nil, nil, nil, nil, nil
  if A2_143 == nil then
    if A1_142 == 1 or A1_142 == nil then
      L4_145 = 0
      L5_146 = L10_151
      L6_147 = L10_151
      L7_148 = L10_151
      L8_149 = L10_151
      L9_150 = L10_151
      L13_154 = "SourceFirstIndex"
      L10_151(L11_152, L12_153, L13_154, 0)
      L13_154 = "SourceCount"
      L10_151(L11_152, L12_153, L13_154, L8_149)
      L13_154 = "FilteredSortKey"
      L10_151(L11_152, L12_153, L13_154, "sorttype")
      for L13_154 = 1, L8_149 - L9_150 do
        if A0_141:setItemToXmlLight(1, L4_145, 1, L13_154, nil, nil, true) == true then
          L4_145 = L4_145 + 1
        else
          break
        end
      end
      if L7_148 > L4_145 then
        for L13_154 = L4_145, L7_148 - 1 do
          L7_148 = L7_148 - 1
          A0_141:deleteListProperty(L5_146, L7_148)
        end
      end
      L10_151(L11_152, L12_153)
    end
    if A1_142 == 100 or A1_142 == nil then
      L10_151.moneyIndex = 0
      L10_151.moneyCount = 0
      L8_149 = L10_151
      L4_145 = 0
      L7_148 = L10_151
      L5_146 = L10_151
      L6_147 = L10_151
      L13_154 = "SourceFirstIndex"
      L10_151(L11_152, L12_153, L13_154, 0)
      L13_154 = "SourceCount"
      L10_151(L11_152, L12_153, L13_154, L8_149)
      L13_154 = "FilteredSortKey"
      L10_151(L11_152, L12_153, L13_154, "sorttype")
      for L13_154 = 1, L8_149 do
        if A0_141:setItemToXmlLight(2, L4_145, 100, L13_154, nil, nil, true) == true then
          L4_145 = L4_145 + 1
        else
          break
        end
      end
      if L7_148 > L4_145 then
        for L13_154 = L4_145, L7_148 - 1 do
          L7_148 = L7_148 - 1
          A0_141:deleteListProperty(L5_146, L7_148)
        end
      end
      L10_151(L11_152, L12_153)
      L10_151.playerMoneyIndex = L11_152
      L10_151.playerMoneyCount = L11_152
    end
  else
    if A1_142 == 1 then
    elseif A1_142 == 100 then
      if A2_143 == L11_152 then
        L11_152.moneyIndex = 0
        L11_152.moneyCount = 0
      else
        L11_152.moneyIndex = L12_153
        L11_152.moneyCount = L12_153
      end
    elseif A1_142 == 101 then
      return
    else
      return
    end
    L13_154 = L10_151
    L13_154 = L3_144
    if L12_153 ~= nil then
      L13_154 = A0_141
      L12_153(L13_154, L10_151, A2_143 - 1, A1_142, A2_143, nil, nil, true)
      if A1_142 == 100 then
        L13_154 = A0_141.work
        L13_154 = L13_154.playerMoneyIndex
        if L12_153 == L13_154 then
          L13_154 = A0_141.work
          L13_154 = L13_154.playerMoneyCount
        elseif L12_153 ~= L13_154 then
          L13_154 = A0_141.work
          L13_154 = L13_154.moneyIndex
          L12_153.playerMoneyIndex = L13_154
          L13_154 = A0_141.work
          L13_154 = L13_154.moneyCount
          L12_153.playerMoneyCount = L13_154
        end
      end
    else
      L13_154 = A0_141
      L13_154 = A0_141.deleteListProperty
      L13_154(A0_141, L11_152, L12_153 - 1)
      L13_154 = A0_141.updateListProperty
      L13_154(A0_141, L11_152)
      if A1_142 == 100 then
        L13_154 = A0_141.work
        L13_154 = L13_154.playerMoneyIndex
        if A2_143 == L13_154 then
          L13_154 = A0_141.work
          L13_154.playerMoneyIndex = 0
          L13_154 = A0_141.work
          L13_154.playerMoneyCount = 0
        end
      end
    end
    L13_154 = A0_141
    L12_153(L13_154, L11_152)
  end
  L10_151(L11_152)
end
function TradeEditWidget.setDummyItem(A0_155, A1_156)
  local L2_157, L3_158, L4_159, L5_160, L6_161
  L2_157 = A0_155.getListPropertyName
  L2_157 = L2_157(L3_158, L4_159)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "catalog", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "quality", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "icon", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "name", "")
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "itemKind", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "rare", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "ex", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "isEquipment", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "itemlife", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "lifemax", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "mskill1", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "mskill2", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "compati", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "eqrank", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "eqrankType", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "nameStyle", "TBL_null")
  for L6_161 = 1, 3 do
    A0_155:setListProperty(L2_157, A1_156, "bn1" .. tostring(L6_161), 0)
    A0_155:setListProperty(L2_157, A1_156, "bv1" .. tostring(L6_161), 0)
    A0_155:setListProperty(L2_157, A1_156, "bh1" .. tostring(L6_161), 0)
  end
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "bn3t", 0)
  for L6_161 = 1, 3 do
    A0_155:setListProperty(L2_157, A1_156, "bn3" .. tostring(L6_161), 0)
    A0_155:setListProperty(L2_157, A1_156, "bv3" .. tostring(L6_161), 0)
  end
  for L6_161 = 1, 32 do
    A0_155:setListProperty(L2_157, A1_156, "bn5p" .. tostring(L6_161), 0)
    A0_155:setListProperty(L2_157, A1_156, "bn5v" .. tostring(L6_161), 0)
  end
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "stackCount", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "stackMax", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "stackable", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "stack", "")
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "bazaarkind", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "price", "")
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "polmax", "Hidden")
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "mcount", 0)
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "mpvisible", "Hidden")
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "mivisible", "Collapsed")
  L6_161 = A1_156
  L3_158(L4_159, L5_160, L6_161, "mcvisible", "Hidden")
  L3_158(L4_159, L5_160)
end
function TradeEditWidget.doListFilter(A0_162, A1_163, A2_164)
  local L3_165, L4_166, L5_167, L6_168, L7_169, L8_170, L9_171
  L4_166 = A0_162
  L3_165 = A0_162.getListPropertyName
  L5_167 = A1_163
  L3_165 = L3_165(L4_166, L5_167)
  L5_167 = A0_162
  L4_166 = A0_162.getListBoxItemNum
  L4_166 = L4_166(L5_167, L6_168)
  L5_167 = nil
  if L4_166 == 0 then
    return
  end
  for L9_171 = 0, L4_166 - 1 do
    L5_167 = false
    if A2_164 == nil then
      L5_167 = true
    elseif A2_164 == 1 then
      if A0_162:getListProperty(L3_165, L9_171, "catalog") ~= 1000001 and (A0_162:getListProperty(L3_165, L9_171, "catalog") < 1000101 or A0_162:getListProperty(L3_165, L9_171, "catalog") > 1000124) then
        L5_167 = true
      end
    elseif A2_164 == 2 then
      if A0_162:getListProperty(L3_165, L9_171, "catalog") == 1000001 then
        L5_167 = true
      end
      if A0_162:getListProperty(L3_165, L9_171, "catalog") >= 1000101 and A0_162:getListProperty(L3_165, L9_171, "catalog") <= 1000124 then
        L5_167 = true
      end
    elseif A2_164 == 6 and A0_162:getListProperty(L3_165, L9_171, "isEquipment") == 1 then
      L5_167 = true
    end
    A0_162:setListPropertyVisibility(L3_165, L9_171, L5_167)
  end
  L6_168(L7_169, L8_170)
end
function TradeEditWidget.setButtonContent(A0_172, A1_173, A2_174)
  A0_172:setContent(A1_173, A2_174)
end
function TradeEditWidget.displayHelp(A0_175, A1_176)
  A0_175:setVisibility("Grid_MateriaEquipList", false)
  A0_175:setText("TextBlock_Help", A1_176)
  A0_175.work.bonus1 = false
  A0_175.work.bonus2 = false
  A0_175.work.bonus3 = false
  A0_175.work.itemlife = false
  A0_175:setGridVisibility(1)
end
function TradeEditWidget.displayFocusedItemHelp(A0_177)
  local L1_178, L2_179, L3_180, L4_181, L5_182, L6_183, L7_184, L8_185, L9_186, L10_187, L11_188, L12_189, L13_190, L14_191, L15_192, L16_193, L17_194, L18_195, L19_196, L20_197, L21_198, L22_199, L23_200, L24_201, L25_202, L26_203, L27_204, L28_205, L29_206, L30_207, L31_208
  L1_178 = A0_177.work
  L1_178 = L1_178.listbox
  L1_178 = L1_178 == 8
  L3_180 = A0_177
  L2_179 = A0_177.setVisibility
  L4_181 = "Grid_MateriaEquipList"
  L5_182 = false
  L2_179(L3_180, L4_181, L5_182)
  if L1_178 == false then
    L3_180 = A0_177
    L2_179 = A0_177.getListBoxFocusNum
    L4_181 = A0_177.work
    L4_181 = L4_181.listbox
    L2_179 = L2_179(L3_180, L4_181)
    if L2_179 == 0 then
      L2_179 = A0_177.work
      L2_179 = L2_179.chosenPackage
      if L2_179 == 100 then
        L3_180 = A0_177
        L2_179 = A0_177.getListBoxItemNum
        L4_181 = A0_177.work
        L4_181 = L4_181.listbox
        L2_179 = L2_179(L3_180, L4_181)
        if L2_179 == 0 then
          L3_180 = A0_177
          L2_179 = A0_177.displayHelp
          L4_181 = 3140
          L2_179(L3_180, L4_181)
          L2_179 = A0_177.work
          L2_179.bonus1 = false
          L2_179 = A0_177.work
          L2_179.bonus2 = false
          L2_179 = A0_177.work
          L2_179.bonus3 = false
          L2_179 = A0_177.work
          L2_179.itemlife = false
          L3_180 = A0_177
          L2_179 = A0_177.setGridVisibility
          L4_181 = 1
          L2_179(L3_180, L4_181)
          L2_179 = false
          return L2_179
        end
      else
        L3_180 = A0_177
        L2_179 = A0_177.displayHelp
        L4_181 = 3140
        L2_179(L3_180, L4_181)
        L2_179 = A0_177.work
        L2_179.bonus1 = false
        L2_179 = A0_177.work
        L2_179.bonus2 = false
        L2_179 = A0_177.work
        L2_179.bonus3 = false
        L2_179 = A0_177.work
        L2_179.itemlife = false
        L2_179 = A0_177.work
        L2_179.page = 0
        L3_180 = A0_177
        L2_179 = A0_177.setGridVisibility
        L4_181 = 1
        L2_179(L3_180, L4_181)
        L2_179 = A0_177.work
        L2_179 = L2_179.listSelectStep
        if L2_179 == 1 then
          L3_180 = A0_177
          L2_179 = A0_177.setVisibility
          L4_181 = "Grid_Button"
          L5_182 = true
          L2_179(L3_180, L4_181, L5_182)
        end
        L2_179 = false
        return L2_179
      end
    end
  end
  L3_180 = A0_177
  L2_179 = A0_177.getListPropertyName
  L4_181 = A0_177.work
  L4_181 = L4_181.listbox
  L2_179 = L2_179(L3_180, L4_181)
  L3_180, L4_181 = nil, nil
  if L1_178 == false then
    L6_183 = A0_177
    L5_182 = A0_177.getPackageFromList
    L7_184 = A0_177.work
    L7_184 = L7_184.listbox
    L5_182 = L5_182(L6_183, L7_184)
    L3_180 = L5_182
    L5_182 = A0_177.work
    L5_182 = L5_182.index
    L4_181 = L5_182 + 1
  else
    L6_183 = A0_177
    L5_182 = A0_177.getListProperty
    L7_184 = L2_179
    L8_185 = A0_177.work
    L8_185 = L8_185.index
    L9_186 = "itemPackage"
    L5_182 = L5_182(L6_183, L7_184, L8_185, L9_186)
    L3_180 = L5_182
    L6_183 = A0_177
    L5_182 = A0_177.getListProperty
    L7_184 = L2_179
    L8_185 = A0_177.work
    L8_185 = L8_185.index
    L9_186 = "itemIndex"
    L5_182 = L5_182(L6_183, L7_184, L8_185, L9_186)
    L4_181 = L5_182
  end
  L5_182 = 1
  L6_183 = worldMaster
  L7_184 = L6_183
  L6_183 = L6_183._getMyPlayer
  L6_183 = L6_183(L7_184)
  L7_184 = nil
  if L1_178 == false then
    if L5_182 == 1 then
      L9_186 = L6_183
      L8_185 = L6_183._getItem
      L10_187 = L3_180
      L11_188 = L4_181
      L8_185 = L8_185(L9_186, L10_187, L11_188)
      L7_184 = L8_185
    elseif L5_182 == 2 then
      L8_185 = desktopWidget
      L9_186 = L8_185
      L8_185 = L8_185.getBazaarItem
      L10_187 = L3_180
      L11_188 = L4_181
      L8_185 = L8_185(L9_186, L10_187, L11_188)
      L7_184 = L8_185
    end
  end
  L8_185 = desktopWidget
  L9_186 = L8_185
  L8_185 = L8_185.setItemDetail
  L10_187 = A0_177
  L11_188 = L7_184
  L12_189 = L2_179
  L13_190 = A0_177.work
  L13_190 = L13_190.index
  L14_191 = true
  L8_185(L9_186, L10_187, L11_188, L12_189, L13_190, L14_191)
  L8_185 = desktopWidget
  L9_186 = L8_185
  L8_185 = L8_185.getItemBase
  L10_187 = A0_177
  L11_188 = L7_184
  L12_189 = L2_179
  L13_190 = A0_177.work
  L13_190 = L13_190.index
  L22_199 = L8_185(L9_186, L10_187, L11_188, L12_189, L13_190)
  if not L1_178 then
    L24_201 = A0_177
    L23_200 = A0_177.getListProperty
    L25_202 = L2_179
    L26_203 = A0_177.work
    L26_203 = L26_203.index
    L27_204 = "tradenum"
    L23_200 = L23_200(L24_201, L25_202, L26_203, L27_204)
    if L11_188 ~= false and L8_185 ~= 1000001 then
      L24_201 = desktopWidget
      L25_202 = L24_201
      L24_201 = L24_201.isGuildPoint
      L26_203 = L8_185
      L24_201 = L24_201(L25_202, L26_203)
    else
      if L24_201 then
        L25_202 = A0_177
        L24_201 = A0_177.setVisibility
        L26_203 = "TextBlock_ItemStack"
        L27_204 = false
        L24_201(L25_202, L26_203, L27_204)
    end
    else
      L24_201 = desktopWidget
      L25_202 = L24_201
      L24_201 = L24_201.isCampanyPoint
      L26_203 = L8_185
      L24_201 = L24_201(L25_202, L26_203)
      if L24_201 then
        L25_202 = A0_177
        L24_201 = A0_177.setText
        L26_203 = "TextBlock_ItemStack"
        L27_204 = 225
        L24_201(L25_202, L26_203, L27_204, L28_205)
        L25_202 = A0_177
        L24_201 = A0_177.setVisibility
        L26_203 = "TextBlock_ItemStack"
        L27_204 = true
        L24_201(L25_202, L26_203, L27_204)
      else
        if L14_191 == nil then
          L25_202 = A0_177
          L24_201 = A0_177.setText
          L26_203 = "TextBlock_ItemStack"
          L27_204 = 3189
          L24_201(L25_202, L26_203, L27_204, L28_205)
        else
          L25_202 = A0_177
          L24_201 = A0_177.setText
          L26_203 = "TextBlock_ItemStack"
          L27_204 = 3551
          L24_201(L25_202, L26_203, L27_204, L28_205, L29_206)
        end
        L25_202 = A0_177
        L24_201 = A0_177.setVisibility
        L26_203 = "TextBlock_ItemStack"
        L27_204 = true
        L24_201(L25_202, L26_203, L27_204)
      end
    end
  end
  L23_200 = nil
  L24_201 = 0
  L25_202 = 0
  L26_203 = 0
  L27_204 = 0
  if not L1_178 and L7_184 ~= nil then
    if L28_205 == true then
      for L31_208 = 1, 27 do
        if L7_184:isFitForEquipPoint(L31_208) == true then
          if L24_201 == 0 then
            L24_201 = L31_208
          elseif L25_202 == 0 then
            L25_202 = L31_208
          elseif L26_203 == 0 then
            L26_203 = L31_208
          elseif L27_204 == 0 then
            L27_204 = L31_208
            break
          end
        end
      end
    end
  else
    L31_208 = A0_177.work
    L31_208 = L31_208.index
    L24_201 = L28_205
    L31_208 = A0_177.work
    L31_208 = L31_208.index
    L25_202 = L28_205
    L31_208 = A0_177.work
    L31_208 = L31_208.index
    L26_203 = L28_205
    L31_208 = A0_177.work
    L31_208 = L31_208.index
    L27_204 = L28_205
  end
  if L24_201 ~= 0 then
    L23_200 = L28_205
  end
  if L23_200 == nil and L25_202 ~= 0 then
    L23_200 = L28_205
  end
  if L23_200 == nil and L26_203 ~= 0 then
    L23_200 = L28_205
  end
  if L23_200 == nil and L27_204 ~= 0 then
    L23_200 = L28_205
  end
  L31_208 = A0_177.work
  L28_205.bonus1, L29_206.bonus2, L30_207.bonus3, L31_208.itemlife = desktopWidget:setItemDetailEquip(A0_177, L7_184, A0_177:getListPropertyName(A0_177.work.listbox), A0_177.work.index, L23_200, L1_178, false, false, L1_178, false, false, A0_177, true)
  if L1_178 then
    L31_208 = A0_177.work
    L31_208 = L31_208.index
    L31_208 = A0_177
    L30_207(L31_208, "ProgressBar_ItemPolish", L29_206)
    L31_208 = A0_177
    L30_207(L31_208, "Grid_MateriaPossible", "VisualOpacityBlue", "0.5")
    L31_208 = A0_177
    L30_207(L31_208, "Grid_MateriaPossible", "VisualOpacityGreen", "0.5")
    L31_208 = A0_177
    L30_207(L31_208, "Grid_MateriaPossible", "VisualOpacityRed", "0.5")
    L31_208 = A0_177
    L30_207(L31_208, "ProgressBar_ItemPolish", "VisualOpacityBlue", "0.5")
    L31_208 = A0_177
    L30_207(L31_208, "ProgressBar_ItemPolish", "VisualOpacityGreen", "0.5")
    L31_208 = A0_177
    L30_207(L31_208, "ProgressBar_ItemPolish", "VisualOpacityRed", "0.5")
    L31_208 = A0_177
    L30_207(L31_208, "Grid_ItemPolish", 1, 73903)
  else
    L31_208 = "VisualOpacityBlue"
    L28_205(L29_206, L30_207, L31_208, "1.0")
    L31_208 = "VisualOpacityGreen"
    L28_205(L29_206, L30_207, L31_208, "1.0")
    L31_208 = "VisualOpacityRed"
    L28_205(L29_206, L30_207, L31_208, "1.0")
    L31_208 = "VisualOpacityBlue"
    L28_205(L29_206, L30_207, L31_208, "1.0")
    L31_208 = "VisualOpacityGreen"
    L28_205(L29_206, L30_207, L31_208, "1.0")
    L31_208 = "VisualOpacityRed"
    L28_205(L29_206, L30_207, L31_208, "1.0")
  end
  L31_208 = false
  L28_205(L29_206, L30_207, L31_208)
  if L28_205 ~= 8 then
  elseif L28_205 == 2 then
    L31_208 = A0_177.work
    L31_208 = L31_208.index
    if L28_205 > 0 then
      L31_208 = L7_184
      L28_205(L29_206, L30_207, L31_208, L2_179, A0_177.work.index)
      L31_208 = true
      L28_205(L29_206, L30_207, L31_208)
      L31_208 = false
      L28_205(L29_206, L30_207, L31_208)
    end
  end
  L28_205(L29_206, L30_207)
  return L28_205
end
function TradeEditWidget.previousSequence(A0_209)
  A0_209:saveSortType()
  if A0_209.work.listSelectStep <= 1 then
    A0_209:backtoParent()
    return true
  elseif A0_209.work.listSelectStep == 2 then
    A0_209.work.listSelectStep = 1
    A0_209:updateWindowDisplay(true)
    A0_209:selectedBorder()
    return true
  else
    return false
  end
end
function TradeEditWidget.isOperateButtonEnable(A0_210, A1_211, A2_212)
  local L3_213, L4_214, L5_215, L6_216, L7_217, L8_218
  L4_214 = A0_210
  L3_213 = A0_210.getListPropertyName
  L5_215 = A1_211
  L3_213 = L3_213(L4_214, L5_215)
  L5_215 = A0_210
  L4_214 = A0_210.getListBoxFocusNum
  L6_216 = A1_211
  L4_214 = L4_214(L5_215, L6_216)
  if L4_214 == 0 then
    L4_214 = false
    return L4_214
  end
  L4_214 = true
  L6_216 = A0_210
  L5_215 = A0_210.getListBoxFocusNum
  L7_217 = A1_211
  L5_215 = L5_215(L6_216, L7_217)
  if L5_215 == 0 then
    L5_215 = false
    return L5_215
  end
  L6_216 = A0_210
  L5_215 = A0_210.getListBoxItemNum
  L7_217 = A1_211
  L5_215 = L5_215(L6_216, L7_217)
  if A2_212 >= L5_215 then
    L5_215 = false
    return L5_215
  end
  L6_216 = A0_210
  L5_215 = A0_210.getPackageFromList
  L7_217 = A1_211
  L5_215 = L5_215(L6_216, L7_217)
  L6_216 = A2_212 + 1
  L7_217 = worldMaster
  L8_218 = L7_217
  L7_217 = L7_217._getMyPlayer
  L7_217 = L7_217(L8_218)
  L8_218 = nil
  if L5_215 == 1 or L5_215 == 100 then
    L8_218 = L7_217:_getItem(L5_215, L6_216)
  end
  if L8_218 == nil then
    return false
  end
  if L8_218:_isEquipping() then
    L4_214 = false
  end
  if A1_211 ~= 1 and A1_211 ~= 2 and A1_211 ~= 8 then
    L4_214 = false
  end
  if L8_218:isExclusiveItem() == true then
    L4_214 = false
  end
  if A0_210:getListProperty(L3_213, A2_212, "tradenum") ~= 0 then
    L4_214 = false
  end
  return L4_214
end
function TradeEditWidget.processUICommandOperate(A0_219, A1_220, A2_221, A3_222, A4_223)
  if A2_221 == "Button_Back" then
    if A0_219.work.listSelectStep == 1 then
      A0_219.work.listSelectStep = 0
    end
    return A0_219:backtoParent()
  elseif A2_221 == "Button_EditBack" then
    if A0_219.work.editWidgetMode ~= 1 then
      if A0_219.work.editWidgetMode == 2 then
        A0_219:displayLeftButtonHelp(3308, 3309)
      end
      return A0_219:backtoParent()
    else
      return A0_219:previousSequence()
    end
  elseif A2_221 == "Button_EditCommand" then
    if A0_219.work.editWidgetMode == 3 then
      A0_219:removeItem()
    elseif A0_219.work.editWidgetMode == 2 then
      return A0_219:setMoney()
    else
      return A0_219:setItem()
    end
    A0_219:selectedBorder()
    return A0_219:gotoParent()
  elseif A2_221 == "Button_SortStatus" then
    A0_219:operateSort()
    return
  end
end
function TradeEditWidget.processUICommandCancel(A0_224, A1_225, A2_226, A3_227, A4_228)
  if A2_226 == "CustomControl_NumberInput" or A2_226 == "CustomControl_NumberInput_Gil" then
    A0_224:setWindowFocus("Button_EditBack")
    return
  end
  A0_224:setCommonTimer(nil)
  if A0_224.work.editWidgetMode == 3 then
    return A0_224:backtoParent()
  else
    return A0_224:previousSequence()
  end
end
function TradeEditWidget.processUICommandClose(A0_229, A1_230, A2_231, A3_232, A4_233)
  A0_229:setCommonTimer(nil)
  return
end
function TradeEditWidget.processUICommandSelection(A0_234, A1_235, A2_236, A3_237, A4_238)
  if desktopWidget:checkKeyboardFocused(A0_234) == false then
    return
  end
  A0_234.work.focus = A3_237
  A0_234.work.listbox = A4_238
  A0_234.work.listSelectStep = 2
  A0_234:updateWindowDisplay(true)
end
function TradeEditWidget.processUICommandDefault(A0_239, A1_240, A2_241, A3_242, A4_243, A5_244)
  if desktopWidget:checkKeyboardFocused(A0_239) == false then
    return
  end
  if A3_242 == "UILuaCommands.MouseEnteredItem" or A3_242 == "UILuaCommands.AnchoredItem" then
    if A5_244 == nil then
      return
    end
    if A4_243 == nil or A4_243 < 0 then
      return
    end
    if A5_244 == 6 then
      return
    else
      A0_239.work.listbox = A5_244
      A0_239.work.focus = A4_243
      A0_239:setCommonTimer(0.2)
      return
    end
    A0_239.work.page = 0
    A0_239:selectedBorder()
    if A0_239.work.listSelectStep == 1 then
      A0_239:updateWindowDisplay(true)
    else
      return
    end
  elseif A3_242 == "UILuaCommands.TabChanged" then
    A0_239.work.listbox = 0 + A0_239:getSelectedTab()
    A0_239.work.index = 0
    A0_239.work.focus = 0
    A0_239:setControlProperty("Button_Back", "Focusable", false)
    A0_239:setControlProperty("Button_Back", "IsTabStop", false)
    return A0_239:updateWindowDisplay(true)
  elseif A3_242 == "UILuaCommands.ButtonFocused" then
    A0_239:setControlProperty("Button_Back", "Focusable", true)
    A0_239:setControlProperty("Button_Back", "IsTabStop", true)
  elseif A3_242 == "NumberInputBox.ValueChanged" then
    A0_239:updateNumber(A4_243, A2_241)
  elseif A3_242 == "UILuaCommands.Previous" then
    A0_239:catalogSkip(-1)
  elseif A3_242 == "UILuaCommands.Next" then
    A0_239:catalogSkip(1)
  end
end
function TradeEditWidget.processTimer(A0_245)
  if A0_245:focusToIndex(A0_245.work.listbox, A0_245.work.focus) >= 0 then
    A0_245.work.index = A0_245:focusToIndex(A0_245.work.listbox, A0_245.work.focus)
  end
  A0_245.work.page = 0
  A0_245:selectedBorder()
  if A0_245.work.listSelectStep == 1 then
    A0_245:updateWindowDisplay(true)
  end
end
function TradeEditWidget.catalogSkip(A0_246, A1_247)
  local L2_248, L3_249, L4_250, L5_251, L6_252, L7_253, L8_254, L9_255, L10_256, L11_257, L12_258, L13_259
  L2_248 = A0_246.work
  L2_248 = L2_248.focus
  L4_250 = A0_246
  L3_249 = A0_246.getListBoxFocusNum
  L5_251 = A0_246.work
  L5_251 = L5_251.listbox
  L3_249 = L3_249(L4_250, L5_251)
  L3_249 = L3_249 - 1
  if L3_249 == -1 then
    return
  end
  L4_250 = 2
  L5_251 = A0_246.work
  L5_251 = L5_251.listbox
  if L5_251 ~= 1 then
    L5_251 = 10 * A1_247
    L2_248 = L2_248 + L5_251
  else
    L5_251 = A0_246.work
    L5_251 = L5_251.sorttype
    if L5_251 == 0 then
      L5_251 = 10 * A1_247
      L2_248 = L2_248 + L5_251
    else
      L5_251 = nil
      if A1_247 > 0 then
        L6_252 = A0_246.work
        L6_252 = L6_252.focus
        L5_251 = L3_249 - L6_252
      else
        L6_252 = A0_246.work
        L5_251 = L6_252.focus
      end
      L7_253 = A0_246
      L6_252 = A0_246.getListPropertyName
      L8_254 = A0_246.work
      L8_254 = L8_254.listbox
      L6_252 = L6_252(L7_253, L8_254)
      L7_253 = desktopWidget
      L8_254 = L7_253
      L7_253 = L7_253.getItemSortKey
      L12_258 = 1
      L13_259 = L4_250
      L7_253 = L7_253(L8_254, L9_255, L10_256, L11_257, L12_258, L13_259)
      L8_254 = L2_248
      for L12_258 = 1, L5_251 do
        L8_254 = L8_254 + A1_247
        L13_259 = A0_246.focusToIndex
        L13_259 = L13_259(A0_246, A0_246.work.listbox, L8_254)
        if L7_253 ~= desktopWidget:getItemSortKey(A0_246, L6_252, L13_259, 1, L4_250) then
          L2_248 = L2_248 + L12_258 * A1_247
          break
        end
        if L12_258 == L5_251 then
          if A1_247 > 0 then
            L2_248 = L3_249
          else
            L2_248 = 0
          end
        end
      end
    end
  end
  if L3_249 < L2_248 then
    L2_248 = L3_249
  elseif L2_248 < 0 then
    L2_248 = 0
  end
  L5_251 = A0_246.work
  L5_251 = L5_251.focus
  if L2_248 ~= L5_251 then
    L5_251 = A0_246.work
    L5_251.focus = L2_248
    L6_252 = A0_246
    L5_251 = A0_246.updateWindowDisplay
    L7_253 = true
    L5_251(L6_252, L7_253)
  end
end
function TradeEditWidget.updateNumber(A0_260, A1_261, A2_262)
  if A2_262 == "CustomControl_NumberInput" and A0_260:_getProperty(nil, A2_262, "IsKeyboardFocusWithin") == true then
    A0_260.work.num1 = A1_261
    if A1_261 == 0 then
      A0_260:setEnable("Button_EditCommand", false)
    else
      A0_260:setEnable("Button_EditCommand", true)
    end
  elseif A2_262 == "CustomControl_NumberInput_Gil" and A0_260:_getProperty(nil, A2_262, "IsKeyboardFocusWithin") == true then
    A0_260.work.num2 = A1_261
    if A1_261 == 0 then
      A0_260:setEnable("Button_EditCommand", false)
    else
      A0_260:setEnable("Button_EditCommand", true)
    end
  end
end
function TradeEditWidget.selectedBorder(A0_263, A1_264, A2_265)
  local L3_266, L4_267
  L3_266 = A0_263.getListPropertyName
  L3_266 = L3_266(L4_267, A0_263.work.listbox)
  if A1_264 ~= nil then
    A0_263:setListProperty(L3_266, A0_263.work.index, "selected", L4_267)
    A0_263.work.selected = A0_263.work.index
  elseif L4_267 == -1 then
    return
  else
    for _FORV_7_ = 1, A0_263:getListBoxItemNum(A0_263.work.listbox) do
      A0_263:setListProperty(L3_266, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_267.selected = -1
  end
  L4_267(A0_263, L3_266)
end
function TradeEditWidget.gotoParent(A0_268, A1_269)
  local L2_270
  L2_270 = A0_268._getParentWidget
  L2_270 = L2_270(A0_268)
  if L2_270 ~= nil then
    A0_268:setModal(false)
    L2_270:displaySlotItemHelp()
    return desktopWidget:changeFocusedWidget(L2_270, true)
  end
end
function TradeEditWidget.backtoParent(A0_271)
  local L1_272
  L1_272 = A0_271._getParentWidget
  L1_272 = L1_272(A0_271)
  if L1_272 ~= nil then
    if A0_271.work.sorttype ~= desktopWidget:getConfigWork(9) then
      desktopWidget:setConfigWorkWithSave(9, A0_271.work.sorttype)
    end
    A0_271:setModal(false)
    L1_272:doNothing()
    L1_272:displaySlotItemHelp()
    desktopWidget:changeFocusedWidget(L1_272, true)
    A0_271.work.moneyEdit = false
  end
end
function TradeEditWidget.setItem(A0_273)
  local L1_274
  L1_274 = A0_273._getParentWidget
  L1_274 = L1_274(A0_273)
  if L1_274 ~= nil then
    A0_273:selectedBorder()
    A0_273:setModal(false)
    desktopWidget:changeFocusedWidget(L1_274, true)
    L1_274:setItem(A0_273.work.chosenPackage, A0_273.work.chosenItem, tonumber(A0_273.work.num1))
  end
end
function TradeEditWidget.removeItem(A0_275)
  if A0_275:_getParentWidget() ~= nil then
    A0_275:_getParentWidget():clearSlot()
    A0_275.work.moneyEdit = false
  end
end
function TradeEditWidget.setMoney(A0_276)
  local L1_277
  L1_277 = A0_276._getParentWidget
  L1_277 = L1_277(A0_276)
  if L1_277 ~= nil then
    L1_277:setMoney(tonumber(A0_276.work.num2), A0_276.work.playerMoneyIndex)
  end
  A0_276:setVisibility("Grid_Edit", false)
  A0_276:setModal(false)
  A0_276.work.moneyEdit = false
  desktopWidget:changeFocusedWidget(L1_277, true)
end
function TradeEditWidget.updatePlayerItem(A0_278, A1_279, A2_280)
  local L3_281, L4_282
  L3_281 = -1
  if A1_279 == 0 then
    L4_282 = A0_278.work
    L4_282.updatecount = A2_280
    return
  elseif A1_279 == 1 then
    L4_282 = A0_278.work
    L4_282 = L4_282.updatecount
    if L4_282 > 2 then
      L4_282 = A0_278.work
      L4_282.updatenexttime = true
    end
    L4_282 = A0_278.work
    L4_282 = L4_282.updatenexttime
    if L4_282 == false then
      L4_282 = A0_278.makeListFromPackage
      L4_282(A0_278, A1_279, A2_280)
    end
    L3_281 = 1
  elseif A1_279 == 5 then
  elseif A1_279 == 100 then
    L4_282 = A0_278.makeListFromPackage
    L4_282(A0_278, A1_279, A2_280)
    L3_281 = 2
  elseif A1_279 == 101 then
  elseif A1_279 == 8 then
  end
  L4_282 = A0_278.work
  L4_282 = L4_282.updatecount
  if L4_282 > 0 then
    L4_282 = A0_278.work
    L4_282.updatecount = A0_278.work.updatecount - 1
  end
  L4_282 = A0_278.work
  L4_282 = L4_282.updatecount
  if L4_282 == 0 then
    L4_282 = A0_278.work
    L4_282 = L4_282.updatenexttime
    if L4_282 == false then
      if A1_279 == 100 then
        L4_282 = A0_278.getListPropertyName
        L4_282 = L4_282(A0_278, 2)
        A0_278:updateListProperty(L4_282)
      elseif L3_281 ~= -1 then
        L4_282 = A0_278.getListPropertyName
        L4_282 = L4_282(A0_278, L3_281)
        A0_278:updateListProperty(L4_282)
      end
    elseif A1_279 == 1 then
      L4_282 = A0_278.makeListFromPackage
      L4_282(A0_278, 1)
      L4_282 = A0_278.updateListProperty
      L4_282(A0_278, A0_278:getListPropertyName(L3_281))
      L4_282 = A0_278.work
      L4_282.updatenexttime = false
    end
    L4_282 = A0_278.work
    L4_282 = L4_282.listbox
    if L3_281 == L4_282 then
      L4_282 = A0_278.work
      L4_282 = L4_282.moneyEdit
      if L4_282 == false then
        L4_282 = A0_278.updateListFocus
        L4_282(A0_278)
      end
    end
    L4_282 = A0_278.displayBagcapacityAndMoney
    L4_282(A0_278)
  end
  return
end
function TradeEditWidget.displayLeftButtonHelp(A0_283, A1_284, A2_285)
  A0_283.work.bonus1 = false
  A0_283.work.bonus2 = false
  A0_283.work.bonus3 = false
  A0_283.work.itemlife = false
  A0_283.work.page = 0
  A0_283.work.listSelectStep = 0
  A0_283:updateWindowDisplay(false)
  A0_283:setGridVisibility(2)
  A0_283:setText("TextBlock_Title", A1_284)
  A0_283:setText("TextBlock_Help", A2_285)
  A0_283:setVisibility("Grid_MateriaEquipList", false)
end
function TradeEditWidget.displayLeftItemHelp(A0_286, A1_287, A2_288)
  A0_286.work.editWidgetMode = 0
  A0_286.work.listSelectStep = 1
  A0_286.work.bonus1 = false
  A0_286.work.bonus2 = false
  A0_286.work.bonus3 = false
  A0_286.work.itemlife = false
  A0_286.work.page = 0
  A0_286.work.listbox = 8
  A0_286.work.index = A1_287
  if A1_287 > 4 and A2_288 == nil then
    A0_286:setText("TextBlock_Title", 3319)
  else
    A0_286:setText("TextBlock_Title", 3326)
  end
  A0_286:displayFocusedItemHelp()
  A0_286:setGridVisibility(3)
end
function TradeEditWidget.openItemList(A0_289)
  A0_289:setNumberInput("CustomControl_NumberInput", 1, 1, 1)
  if A0_289.work.updatenexttime == true then
    A0_289:makeListFromPackage()
    A0_289.work.updatenexttime = false
  end
  if A0_289:getListBoxItemNum(1) ~= worldMaster:_getMyPlayer():_getItemPackageCapacity(1) - worldMaster:_getMyPlayer():_getItemPackageFreeSpace(1) then
    A0_289:makeListFromPackage()
  end
  A0_289.work.editWidgetMode = 1
  A0_289.work.listSelectStep = 1
  if A0_289:getSelectedTab() ~= 0 then
    A0_289.work.listbox = A0_289:getSelectedTab()
  else
    A0_289.work.listbox = 1
  end
  A0_289.work.index = 0
  A0_289.work.bonus1 = false
  A0_289.work.bonus2 = false
  A0_289.work.bonus3 = false
  A0_289.work.itemlife = false
  A0_289.work.page = 0
  A0_289:setButtonContent("Button_EditCommand", 3317)
  A0_289:setText("TextBlock_Title", 3322)
  A0_289:updateWindowDisplay(true)
  A0_289.work.moneyEdit = false
end
function TradeEditWidget.openMoneyEdit(A0_290, A1_291)
  A0_290.work.listbox = 2
  A0_290.work.index = 0
  A0_290.work.chosenPackage = 100
  A0_290.work.chosenItem = A0_290.work.playerMoneyIndex
  A0_290.work.index = A0_290.work.playerMoneyIndex - 1
  A0_290:displayFocusedItemHelp()
  A0_290.work.editWidgetMode = 2
  A0_290.work.listSelectStep = 1
  A0_290.work.num2 = 0
  A0_290.work.num2max = A1_291
  A0_290.work.moneyEdit = true
  A0_290:setNumberInput("CustomControl_NumberInput_Gil", 0, 0, 0)
  A0_290:setNumberInput("CustomControl_NumberInput_Gil", 0, A0_290.work.num2max, A0_290.work.num2)
  A0_290:setButtonContent("Button_EditCommand", 3320)
  A0_290:setEnable("Button_EditCommand", false)
  A0_290:setText("TextBlock_Title", 3325)
  A0_290:setGridVisibility(7)
  A0_290:setWindowFocus("CustomControl_NumberInput_Gil")
  A0_290:updateNumber()
end
function TradeEditWidget.removeItemOperate(A0_292, A1_293)
  A0_292.work.listbox = 8
  A0_292.work.index = A1_293
  A0_292.work.editWidgetMode = 3
  A0_292.work.listSelectStep = 2
  A0_292:setButtonContent("Button_EditCommand", 3319)
  A0_292:setText("TextBlock_Title", 3319)
  A0_292:updateWindowDisplay(true)
  A0_292:setEnable("Button_EditCommand", true)
  A0_292:setWindowFocus("Button_EditCommand")
  A0_292:setGridVisibility(3)
  A0_292:displayFocusedItemHelp()
  A0_292:setGridVisibility(8)
end
function TradeEditWidget.getSlotIcon(A0_294, A1_295)
  local L2_296, L3_297, L4_298, L5_299
  L3_297 = A0_294
  L2_296 = A0_294.getListPropertyName
  L4_298 = 8
  L2_296 = L2_296(L3_297, L4_298)
  L3_297 = 0
  L4_298 = 0
  L5_299 = 0
  L3_297 = A0_294:getListProperty(L2_296, A1_295, "icon")
  L4_298 = A0_294:getListProperty(L2_296, A1_295, "stackCount")
  L5_299 = A0_294:getListProperty(L2_296, A1_295, "stackable")
  if A0_294:getListProperty(L2_296, A1_295, "catalog") == 1000001 then
    L5_299 = 0
  end
  return L3_297, L4_298, L5_299
end
function TradeEditWidget.setSlotXmlData(A0_300, A1_301, A2_302, A3_303, A4_304, A5_305)
  local L6_306
  L6_306 = A0_300.getListPropertyName
  L6_306 = L6_306(A0_300, 8)
  A0_300:setListProperty(L6_306, A1_301, A2_302, A4_304)
  if A5_305 ~= nil then
    A0_300:updateListProperty(L6_306)
  end
end
function TradeEditWidget.getSlotXmlData(A0_307, A1_308, A2_309, A3_310)
  local L4_311
  L4_311 = A0_307.getListPropertyName
  L4_311 = L4_311(A0_307, 8)
  return A0_307:getListProperty(L4_311, A1_308, A2_309)
end
function TradeEditWidget.enableCheckSlot(A0_312, A1_313)
  A0_312.work.checkSlot = A1_313
end
function TradeEditWidget.setActorName(A0_314, A1_315)
  local L2_316
  if A1_315 > 4 then
    L2_316 = A0_314.setText
    L2_316(A0_314, "TextBlock_ActorName", 230, desktopWidget:getPlayerName())
  else
    L2_316 = desktopWidget
    L2_316 = L2_316.getTradeActorName
    L2_316 = L2_316(L2_316)
    if L2_316 ~= nil then
      A0_314:setText("TextBlock_ActorName", 230, L2_316)
    else
      A0_314:setText("TextBlock_ActorName", "???")
    end
  end
end
function TradeEditWidget.isItemCrystal(A0_317, A1_318)
  if A1_318 ~= nil and A1_318:_getCatalogID() > 1000002 and A1_318:_getCatalogID() < 1000101 then
    return true
  end
  return false
end
function TradeEditWidget.syncItemWork(A0_319, A1_320)
  A0_319.work.demandSync = false
end
function TradeEditWidget.showMateriaList(A0_321)
  local L1_322
  if A0_321.work.listbox == 1 then
    L1_322 = worldMaster:_getMyPlayer():_getItem(1, A0_321.work.index + 1)
    if desktopWidget:getAttachedMateriaCountByItem(L1_322) == 0 then
      return
    end
  elseif A0_321.work.listbox == 8 then
  else
    return
  end
  desktopWidget:setMateriaListItems(A0_321, L1_322)
  A0_321:setVisibility("Grid_MateriaEquipList", true)
  A0_321:setVisibility("Button_ListClose", false)
  A0_321.work.isMateriaList = true
end
function TradeEditWidget.closeMateriaList(A0_323)
  A0_323:setVisibility("Grid_MateriaEquipList", false)
  A0_323.work.isMateriaList = false
end
function TradeEditWidget.operateSort(A0_324, A1_325)
  local L2_326
  L2_326 = A0_324.work
  L2_326 = L2_326.listbox
  if L2_326 == 1 then
    if A1_325 ~= nil then
      L2_326 = A0_324.work
      L2_326.sorttype = A1_325
    else
      L2_326 = A0_324.changeSortType
      L2_326(A0_324)
    end
    L2_326 = A0_324.work
    L2_326 = L2_326.index
    A0_324:updateSortType()
    if A0_324:indexToFocus(A0_324.work.listbox, L2_326) > -1 then
      A0_324.work.focus = A0_324:indexToFocus(A0_324.work.listbox, L2_326)
    end
    if A0_324:focusToIndex(A0_324.work.listbox, A0_324.work.focus) >= 0 then
      A0_324.work.index = A0_324:focusToIndex(A0_324.work.listbox, A0_324.work.focus)
    end
    A0_324:displaySortType(A0_324.work.sorttype)
  end
  L2_326 = true
  return L2_326
end
function TradeEditWidget.displaySortType(A0_327, A1_328)
  desktopWidget:displaySortType(A1_328, A0_327, "Button_SortStatus")
end
function TradeEditWidget.changeSortType(A0_329)
  A0_329.work.sorttype = desktopWidget:changeSortType(A0_329.work.sorttype)
end
function TradeEditWidget.saveSortType(A0_330)
  desktopWidget:saveSortType(A0_330.work.sorttype)
end
