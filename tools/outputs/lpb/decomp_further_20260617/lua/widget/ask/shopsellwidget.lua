require("/Widget/Ask/AskBaseClass")
_defineClass("ShopSellWidget", "AskBaseClass")
function ShopSellWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function ShopSellWidget.initAsk(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7
  L4_6 = "chosenItem"
  L5_7 = "integer32"
  L4_6 = {L5_7, "integer32"}
  L5_7 = "chosenPackage"
  L5_7 = {
    "chosenOperation",
    "integer32"
  }
  L1_3._temp = L2_4
  L1_3.chosenOperation = 0
  L1_3.editWidgetOpen = 0
  L1_3.initialized = false
  L2_4.index = 0
  L1_3.listbox = L3_5
  L1_3.bonus1 = false
  L1_3.bonus2 = false
  L1_3.bonus3 = false
  L1_3.itemlife = false
  L1_3.bazaar = false
  L1_3.waitNext = false
  L1_3.waitForPrice = false
  L1_3.waitupdate = false
  L1_3.focus = 0
  L1_3.closeok = false
  L1_3.demandSync = false
  L4_6 = 9
  L1_3.sorttype = L2_4
  L1_3.submenu = false
  L1_3.lastsub = 10
  L1_3.askstatus = true
  L4_6 = "@"
  L5_7 = tostring
  L5_7 = L5_7(3408)
  L4_6 = L4_6 .. L5_7
  L1_3(L2_4, L3_5, L4_6)
  L1_3(L2_4)
  L1_3(L2_4, L3_5)
  for L4_6 = 1, 5 do
    L5_7 = "TabItem_"
    L5_7 = L5_7 .. tostring(L4_6)
    A0_2:setCancelCondition(L5_7)
  end
  L4_6 = "UILuaCommands.TabChanged"
  L1_3(L2_4, L3_5, L4_6)
  L4_6 = 214
  L5_7 = 10091
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L4_6 = 214
  L5_7 = 10093
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L4_6 = ""
  L1_3(L2_4, L3_5, L4_6)
  L4_6 = 3402
  L1_3(L2_4, L3_5, L4_6)
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  L1_3(L2_4, L3_5)
  L1_3(L2_4)
  L4_6 = 1
  L5_7 = 71911
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L4_6 = 1
  L5_7 = 71912
  L1_3(L2_4, L3_5, L4_6, L5_7)
end
function ShopSellWidget.setInitialData(A0_8)
  A0_8:setModal(true)
  A0_8:resetListBox(1)
  A0_8:resetListBox(2)
  A0_8:resetListBox(3)
  A0_8:resetListBox(4)
  A0_8:resetListBox(5)
  A0_8:makeListFromPackage()
  A0_8.work.initialized = true
  A0_8.work.listbox = 1
  A0_8:changeList()
  A0_8:updateWindowDisplay(true)
  A0_8:setText("TextBlock_Title", 3207)
end
function ShopSellWidget.processBeforeShow(A0_9, A1_10)
  if A1_10 ~= true then
    return true
  elseif A0_9:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
    A0_9:closeShopEdit(true)
  elseif A0_9.work.submenu == true then
  else
    A0_9:updateWindowDisplay(true)
  end
  return true
end
function ShopSellWidget.getListPropertyName(A0_11, A1_12)
  local L2_13
  if A1_12 == 1 then
    L2_13 = "TabItem_1_Maker"
    return L2_13
  elseif A1_12 == 2 then
    L2_13 = "TabItem_2_Maker"
    return L2_13
  elseif A1_12 == 3 then
    L2_13 = "TabItem_3_Maker"
    return L2_13
  elseif A1_12 == 4 then
    L2_13 = "TabItem_4_Maker"
    return L2_13
  elseif A1_12 == 5 then
    L2_13 = "TabItem_5_Maker"
    return L2_13
  elseif A1_12 == 8 then
    L2_13 = "SlotItem_Maker"
    return L2_13
  elseif A1_12 == 9 then
    L2_13 = "HelpCache_Maker"
    return L2_13
  end
end
function ShopSellWidget.updateWindowDisplay(A0_14, A1_15)
  A0_14:setGridVisibility(3)
  if A0_14.work.isMateriaList then
    A0_14:setVisibility("Grid_MateriaEquipList", true)
    A0_14:setVisibility("Grid_TabList", false)
  end
  if A0_14.work.listbox == 1 then
    A0_14:setVisibility("Button_SortStatus", true)
    A0_14:displaySortType(A0_14.work.sorttype)
  else
    A0_14:setVisibility("Button_SortStatus", false)
  end
  if A1_15 == true then
    A0_14:updateListFocus()
  end
end
function ShopSellWidget.updateListFocus(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22
  L1_17 = A0_16.work
  L1_17 = L1_17.updatecount
  if L1_17 ~= 0 then
    L1_17 = false
    return L1_17
  end
  L2_18 = A0_16
  L1_17 = A0_16.getListBoxFocusNum
  L3_19 = A0_16.work
  L3_19 = L3_19.listbox
  L4_20 = L1_17(L2_18, L3_19)
  L6_22 = A0_16
  L5_21 = A0_16.getListBoxName
  L5_21 = L5_21(L6_22, A0_16.work.listbox)
  L6_22 = "TextBlock_NoContents_"
  L6_22 = L6_22 .. tostring(A0_16.work.listbox)
  if L1_17 == 0 then
    if A0_16:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
      A0_16:closeShopEdit(false)
    end
    A0_16:setVisibility(L6_22, true)
    A0_16:setVisibility(L5_21, false)
    A0_16:displayFocusedItemHelp()
    A0_16:setWindowFocus(L6_22)
  else
    A0_16:setVisibility(L5_21, true)
    A0_16:setVisibility(L6_22, false)
    if A0_16.work.focus > L1_17 - 1 then
      A0_16.work.focus = L1_17 - 1
    end
    if 0 <= A0_16:focusToIndex(A0_16.work.listbox, A0_16.work.focus) then
      A0_16.work.index = A0_16:focusToIndex(A0_16.work.listbox, A0_16.work.focus)
    end
    A0_16:setControlProperty(L5_21, "SqwtFocusedIndex", A0_16.work.focus)
    A0_16:setFocusedIndex(L5_21, A0_16.work.focus)
    A0_16:setWindowFocus(L5_21)
    A0_16:displayFocusedItemHelp()
  end
end
function ShopSellWidget.setGridVisibility(A0_23, A1_24)
  A0_23:setVisibility("Grid_ActorName", false)
  A0_23:setVisibility("Grid_Help", A1_24 == 2)
  A0_23:setVisibility("Grid_TabList", A1_24 == 1 or A1_24 == 2 or A1_24 == 3)
  A0_23:setVisibility("Grid_BackpackAndGil", true)
  A0_23:setVisibility("Grid_ItemNameBase", A1_24 == 1 or A1_24 == 3 or A1_24 == 4 or A1_24 == 5)
  A0_23:setVisibility("Grid_ItemDetail1", A0_23.work.bonus1)
  A0_23:setVisibility("Grid_ItemDetail2", A0_23.work.bonus2)
  A0_23:setVisibility("Grid_ItemDetail3", A0_23.work.bonus3 or A0_23.work.itemlife or A0_23.work.bazaar)
  A0_23:setVisibility("Label_ItemBonus5", A0_23.work.bonus3)
  A0_23:setVisibility("Grid_ItemLife", A0_23.work.itemlife)
  A0_23:setVisibility("Grid_ItemBazaarInformation", A0_23.work.bazaar)
  A0_23:setVisibility("Grid_MateriaAttachBazaarInformation", false)
end
function ShopSellWidget.setWindowFocus(A0_25, A1_26)
  if A1_26 ~= nil and A1_26 ~= "" then
    A0_25:setLogicalFocus(A1_26)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_25 then
      A0_25:setKeyboardFocusedControl(A1_26)
    end
  end
end
function ShopSellWidget.displayBagcapacityAndMoney(A0_27)
  local L1_28, L2_29, L3_30
  L1_28 = worldMaster
  L2_29 = L1_28
  L1_28 = L1_28._getMyPlayer
  L1_28 = L1_28(L2_29)
  L3_30 = L1_28
  L2_29 = L1_28.getMoneyOnHand
  L2_29 = L2_29(L3_30)
  L3_30 = A0_27.setText
  L3_30(A0_27, "TextBlock_Gil", 3263, L2_29)
  L3_30 = L1_28._getItemPackageCapacity
  L3_30 = L3_30(L1_28, 1)
  A0_27:setText("TextBlock_ItemStack_2", 3551, L3_30 - L1_28:_getItemPackageFreeSpace(1), L3_30)
end
function ShopSellWidget.isExistItem(A0_31, A1_32, A2_33, A3_34)
  if A3_34 == nil or A3_34 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_32, A2_33) ~= nil then
      return true
    else
      return false
    end
  elseif A3_34 == 2 then
    if desktopWidget:getBazaarItem(A1_32, A2_33) ~= nil then
      return true
    else
      return false
    end
  end
end
function ShopSellWidget.getSelectedTab(A0_35)
  return A0_35:getSelectedIndex("TabControl_ItemList") + 1
end
function ShopSellWidget.getListBoxName(A0_36, A1_37)
  local L2_38
  if A1_37 == 1 then
    L2_38 = "ListBox_TabItem_1"
    return L2_38
  elseif A1_37 == 2 then
    L2_38 = "ListBox_TabItem_2"
    return L2_38
  elseif A1_37 == 3 then
    L2_38 = "ListBox_TabItem_3"
    return L2_38
  elseif A1_37 == 4 then
    L2_38 = "ListBox_TabItem_4"
    return L2_38
  elseif A1_37 == 5 then
    L2_38 = "ListBox_TabItem_5"
    return L2_38
  else
    L2_38 = ""
    return L2_38
  end
end
function ShopSellWidget.getListBoxItemNum(A0_39, A1_40)
  local L2_41, L3_42
  L3_42 = A0_39
  L2_41 = A0_39.getListPropertyCount
  return L2_41(L3_42, A0_39:getListPropertyName(A1_40))
end
function ShopSellWidget.getListBoxFocusNum(A0_43, A1_44)
  local L2_45, L3_46, L4_47, L5_48
  L3_46 = A0_43
  L2_45 = A0_43.getListBoxItemNum
  L4_47 = A1_44
  L2_45 = L2_45(L3_46, L4_47)
  L4_47 = A0_43
  L3_46 = A0_43.getListPropertyName
  L5_48 = A1_44
  L3_46 = L3_46(L4_47, L5_48)
  if L2_45 == 0 then
    L4_47 = 0
    L5_48 = 0
    return L4_47, L5_48, 0, 0
  end
  L5_48 = A0_43
  L4_47 = A0_43.getControlProperty
  L4_47 = L4_47(L5_48, L3_46, "FilteredCount")
  L5_48 = A0_43.work
  L5_48 = L5_48.focus
  if L4_47 < A0_43.work.focus then
    L5_48 = L4_47 - 1
  end
  return L4_47, L4_47 - 1, 0, L5_48
end
function ShopSellWidget.focusToIndex(A0_49, A1_50, A2_51)
  local L3_52
  L3_52 = A0_49.getListPropertyName
  L3_52 = L3_52(A0_49, A1_50)
  if A0_49:getListBoxFocusNum(A1_50) == 0 or A2_51 >= A0_49:getListBoxFocusNum(A1_50) then
    return -1
  else
    A0_49:setControlProperty(L3_52, "FilteredIndex", A2_51)
    return A0_49:getControlProperty(L3_52, "Index")
  end
end
function ShopSellWidget.indexToFocus(A0_53, A1_54, A2_55)
  local L3_56, L4_57
  L3_56 = -1
  L4_57 = A0_53.getListPropertyName
  L4_57 = L4_57(A0_53, A1_54)
  if A0_53:getListBoxFocusNum(A1_54) > 0 then
    A0_53:setControlProperty(L4_57, "Index", A2_55)
    L3_56 = A0_53:getControlProperty(L4_57, "FilteredIndex")
  end
  return L3_56
end
function ShopSellWidget.initListBox(A0_58, A1_59)
  local L2_60, L3_61
  L3_61 = A0_58
  L2_60 = A0_58.getListBoxName
  L2_60 = L2_60(L3_61, A1_59)
  if L2_60 ~= "" then
    L3_61 = A0_58.setControlProperty
    L3_61(A0_58, L2_60, "IntData.Value0", A1_59)
    L3_61 = A0_58.setControlCommandCondition
    L3_61(A0_58, L2_60, "UILuaCommands.MouseEnteredItem")
    L3_61 = A0_58.setControlCommandCondition
    L3_61(A0_58, L2_60, "UILuaCommands.AnchoredItem")
    L3_61 = A0_58.setControlCommandCondition
    L3_61(A0_58, L2_60, "UILuaCommands.Selection")
    L3_61 = A0_58.setCancelCondition
    L3_61(A0_58, L2_60)
    L3_61 = A0_58.setVisibility
    L3_61(A0_58, L2_60, true)
    L3_61 = "TextBlock_NoContents_"
    L3_61 = L3_61 .. tostring(A1_59)
    A0_58:setVisibility(L3_61, false)
    A0_58:setCancelCondition(L3_61)
    A0_58:setControlProperty(L3_61, "IsTabStop", true)
    A0_58:setControlCommandCondition(L2_60, "UILuaCommands.Previous")
    A0_58:setControlCommandCondition(L2_60, "UILuaCommands.Next")
  end
end
function ShopSellWidget.resetListBox(A0_62, A1_63)
  local L2_64, L3_65
  L3_65 = A0_62
  L2_64 = A0_62.getListBoxItemNum
  L2_64 = L2_64(L3_65, A1_63)
  L3_65 = A0_62.getListPropertyName
  L3_65 = L3_65(A0_62, A1_63)
  if L2_64 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_64 do
      L2_64 = L2_64 - 1
      A0_62:deleteListProperty(L3_65, L2_64)
    end
    A0_62:updateListProperty(L3_65)
  end
end
function ShopSellWidget.getPackageFromList(A0_66, A1_67)
  local L2_68
  L2_68 = 1
  if A1_67 == 1 then
    L2_68 = 1
  elseif A1_67 == 2 then
    L2_68 = 100
  elseif A1_67 == 3 then
    L2_68 = 8
  elseif A1_67 == 4 then
    L2_68 = 5
  elseif A1_67 == 5 then
    L2_68 = 100
  end
  return L2_68
end
function ShopSellWidget.setItemToXmlLight(A0_69, A1_70, A2_71, A3_72, A4_73, A5_74)
  local L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81, L13_82, L14_83, L15_84, L16_85, L17_86, L18_87
  L7_76 = A0_69
  L6_75 = A0_69.getListPropertyName
  L8_77 = A1_70
  L7_76 = L6_75(L7_76, L8_77)
  L8_77, L9_78, L10_79, L11_80 = nil, nil, nil, nil
  L12_81 = worldMaster
  L13_82 = L12_81
  L12_81 = L12_81._getMyPlayer
  L12_81 = L12_81(L13_82)
  L13_82, L14_83 = nil, nil
  if A3_72 > 0 and A4_73 > 0 then
    L16_85 = L12_81
    L15_84 = L12_81._getItem
    L17_86 = A3_72
    L18_87 = A4_73
    L15_84 = L15_84(L16_85, L17_86, L18_87)
    L13_82 = L15_84
  end
  if L13_82 == nil then
    L15_84 = false
    return L15_84
  end
  L16_85 = L13_82
  L15_84 = L13_82._getCatalogID
  L15_84 = L15_84(L16_85)
  L8_77 = L15_84
  L16_85 = L13_82
  L15_84 = L13_82.getItemIcon
  L15_84 = L15_84(L16_85)
  L9_78 = L15_84
  L16_85 = L13_82
  L15_84 = L13_82._isStackable
  L15_84 = L15_84(L16_85)
  L10_79 = L15_84
  L16_85 = L13_82
  L15_84 = L13_82._countStack
  L15_84 = L15_84(L16_85)
  L11_80 = L15_84
  L16_85 = L13_82
  L15_84 = L13_82._getNameIndex
  L15_84 = L15_84(L16_85)
  L16_85 = "TBL_null"
  L17_86 = A0_69.work
  L17_86 = L17_86.sorttype
  L18_87 = 7
  if A1_70 == 1 then
    break
  else
  end
  if A1_70 == 2 then
    L17_86 = 11
    L18_87 = 8
  else
  end
  desktopWidget:setItemToXml(A0_69, L6_75, A2_71, L13_82, L16_85, L8_77, L9_78, L10_79, L11_80, L15_84, L17_86, true, false, L18_87, A3_72, A4_73, A5_74, false)
  if 0 < A0_69.work.updatecount and A0_69.work.listbox == A1_70 and A0_69:getControlProperty(L6_75, "FilteredIndex") < A0_69.work.focus then
    A0_69.work.focusChange = true
  end
  return true
end
function ShopSellWidget.getMoneyListIndex(A0_88, A1_89)
  local L2_90, L3_91
  L2_90 = 1
  if A1_89 == 1000001 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000102 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000101 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000103 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000107 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000106 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000104 then
    L3_91 = -1
    return L3_91
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000108 then
    L3_91 = -1
    return L3_91
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000109 then
    L3_91 = -1
    return L3_91
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000105 then
    L3_91 = -1
    return L3_91
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000111 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000110 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000112 then
    L3_91 = -1
    return L3_91
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000113 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000114 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000115 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000116 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000117 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000118 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000119 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000120 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000121 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000122 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  if A1_89 == 1000123 then
    return L2_90
  else
    L2_90 = L2_90 + 1
  end
  L3_91 = -1
  return L3_91
end
function ShopSellWidget.setSortType(A0_92, A1_93, A2_94)
  local L3_95, L4_96
  L3_95 = worldMaster
  L4_96 = L3_95
  L3_95 = L3_95._getMyPlayer
  L3_95 = L3_95(L4_96)
  L4_96 = L3_95._getItem
  L4_96 = L4_96(L3_95, 1, A2_94 + 1)
  if L4_96 == nil then
    return
  end
  desktopWidget:setSortType(A0_92, A1_93, A2_94, A0_92.work.sorttype, L4_96)
end
function ShopSellWidget.updateSortType(A0_97)
  local L1_98
  L1_98 = A0_97.getListPropertyName
  L1_98 = L1_98(A0_97, 1)
  for _FORV_5_ = 1, A0_97:getListBoxItemNum(1) do
    A0_97:setSortType(L1_98, _FORV_5_ - 1)
  end
  A0_97:updateListProperty(L1_98)
end
function ShopSellWidget.makeListFromPackage(A0_99, A1_100, A2_101)
  local L3_102, L4_103, L5_104, L6_105, L7_106, L8_107, L9_108, L10_109, L11_110, L12_111, L13_112
  L3_102 = worldMaster
  L4_103 = L3_102
  L3_102 = L3_102._getMyPlayer
  L3_102 = L3_102(L4_103)
  L4_103, L5_104, L6_105, L7_106, L8_107, L9_108 = nil, nil, nil, nil, nil, nil
  if A2_101 == nil then
    if A1_100 == 1 or A1_100 == nil then
      L4_103 = 0
      L5_104 = L10_109
      L6_105 = L10_109
      L7_106 = L10_109
      L8_107 = L10_109
      L9_108 = L10_109
      L13_112 = "SourceFirstIndex"
      L10_109(L11_110, L12_111, L13_112, 0)
      L13_112 = "SourceCount"
      L10_109(L11_110, L12_111, L13_112, L7_106)
      L13_112 = "FilteredSortKey"
      L10_109(L11_110, L12_111, L13_112, "sorttype")
      for L13_112 = 1, L7_106 - L8_107 do
        if A0_99:setItemToXmlLight(1, L4_103, 1, L13_112) == true then
          L4_103 = L4_103 + 1
        else
          break
        end
      end
      if L6_105 > L4_103 then
        for L13_112 = L4_103, L6_105 - 1 do
          L6_105 = L6_105 - 1
          A0_99:deleteListProperty(L5_104, L6_105)
        end
      end
      L10_109(L11_110, L12_111)
    end
    if A1_100 == 100 or A1_100 == nil then
      L7_106 = L10_109
      L4_103 = 0
      L6_105 = L10_109
      L5_104 = L10_109
      L9_108 = L10_109
      L13_112 = "SourceFirstIndex"
      L10_109(L11_110, L12_111, L13_112, 0)
      L13_112 = "SourceCount"
      L10_109(L11_110, L12_111, L13_112, L7_106)
      L13_112 = "FilteredSortKey"
      L10_109(L11_110, L12_111, L13_112, "sorttype")
      for L13_112 = 1, L7_106 do
        if A0_99:setItemToXmlLight(2, L4_103, 100, L13_112) == true then
          L4_103 = L4_103 + 1
        else
          break
        end
      end
      if L6_105 > L4_103 then
        for L13_112 = L4_103, L6_105 - 1 do
          L6_105 = L6_105 - 1
          A0_99:deleteListProperty(L5_104, L6_105)
        end
      end
      L10_109(L11_110, L12_111)
    end
  else
    if A1_100 == 1 then
    elseif A1_100 == 100 then
    else
      return
    end
    L13_112 = L10_109
    L5_104 = L11_110
    L13_112 = A1_100
    if L11_110 ~= nil then
      L13_112 = L10_109
      L11_110(L12_111, L13_112, A2_101 - 1, A1_100, A2_101)
    else
      L13_112 = L10_109
      L13_112 = A0_99
      L12_111(L13_112, L5_104, L11_110 - 1)
      L13_112 = A0_99
      L12_111(L13_112, L5_104)
    end
  end
  L10_109(L11_110)
end
function ShopSellWidget.displayHelp(A0_113, A1_114)
  A0_113:setText("TextBlock_Help", A1_114)
end
function ShopSellWidget.displayFocusedItemHelp(A0_115)
  local L1_116, L2_117, L3_118, L4_119, L5_120, L6_121, L7_122, L8_123, L9_124, L10_125, L11_126, L12_127, L13_128, L14_129, L15_130
  L1_116 = A0_115.work
  L1_116 = L1_116.updatecount
  if L1_116 > 0 then
    L1_116 = false
    return L1_116
  end
  L2_117 = A0_115
  L1_116 = A0_115.getListBoxFocusNum
  L3_118 = A0_115.work
  L3_118 = L3_118.listbox
  L1_116 = L1_116(L2_117, L3_118)
  if L1_116 == 0 then
    L2_117 = A0_115
    L1_116 = A0_115.displayHelp
    L3_118 = 3140
    L1_116(L2_117, L3_118)
    L1_116 = A0_115.work
    L1_116.bonus1 = false
    L1_116 = A0_115.work
    L1_116.bonus2 = false
    L1_116 = A0_115.work
    L1_116.bonus3 = false
    L1_116 = A0_115.work
    L1_116.itemlife = false
    L1_116 = A0_115.work
    L1_116.page = 0
    L2_117 = A0_115
    L1_116 = A0_115.setGridVisibility
    L3_118 = 2
    L1_116(L2_117, L3_118)
    L1_116 = false
    return L1_116
  end
  L2_117 = A0_115
  L1_116 = A0_115.getListBoxItemNum
  L3_118 = A0_115.work
  L3_118 = L3_118.listbox
  L1_116 = L1_116(L2_117, L3_118)
  L2_117 = A0_115.work
  L2_117 = L2_117.index
  if L1_116 <= L2_117 then
    L1_116 = false
    return L1_116
  end
  L2_117 = A0_115
  L1_116 = A0_115.getListPropertyName
  L3_118 = A0_115.work
  L3_118 = L3_118.listbox
  L1_116 = L1_116(L2_117, L3_118)
  L3_118 = A0_115
  L2_117 = A0_115.getPackageFromList
  L4_119 = A0_115.work
  L4_119 = L4_119.listbox
  L2_117 = L2_117(L3_118, L4_119)
  L3_118 = A0_115.work
  L3_118 = L3_118.index
  L3_118 = L3_118 + 1
  L4_119 = 1
  L5_120 = worldMaster
  L6_121 = L5_120
  L5_120 = L5_120._getMyPlayer
  L5_120 = L5_120(L6_121)
  L6_121 = nil
  if L4_119 == 1 then
    L8_123 = L5_120
    L7_122 = L5_120._getItem
    L9_124 = L2_117
    L10_125 = L3_118
    L7_122 = L7_122(L8_123, L9_124, L10_125)
    L6_121 = L7_122
  elseif L4_119 == 2 then
    L7_122 = desktopWidget
    L8_123 = L7_122
    L7_122 = L7_122.getBazaarItem
    L9_124 = L2_117
    L10_125 = L3_118
    L7_122 = L7_122(L8_123, L9_124, L10_125)
    L6_121 = L7_122
  end
  L7_122 = desktopWidget
  L8_123 = L7_122
  L7_122 = L7_122.setItemDetail
  L9_124 = A0_115
  L10_125 = L6_121
  L11_126 = L1_116
  L7_122(L8_123, L9_124, L10_125, L11_126, L12_127)
  L7_122 = A0_115.work
  L7_122.bazaar = false
  L8_123 = A0_115
  L7_122 = A0_115.setVisibility
  L9_124 = "Grid_RewardMoney"
  L10_125 = false
  L7_122(L8_123, L9_124, L10_125)
  L8_123 = A0_115
  L7_122 = A0_115.setVisibility
  L9_124 = "Grid_RewardItem"
  L10_125 = false
  L7_122(L8_123, L9_124, L10_125)
  L7_122 = nil
  L8_123 = 0
  L9_124 = 0
  L10_125 = 0
  L11_126 = 0
  if L12_127 == true then
    for L15_130 = 1, 27 do
      if L6_121:isFitForEquipPoint(L15_130) == true then
        if L8_123 == 0 then
          L8_123 = L15_130
        elseif L9_124 == 0 then
          L9_124 = L15_130
        elseif L10_125 == 0 then
          L10_125 = L15_130
        elseif L11_126 == 0 then
          L11_126 = L15_130
          break
        end
      end
    end
  end
  if L8_123 ~= 0 then
    L7_122 = L12_127
  end
  if L7_122 == nil and L9_124 ~= 0 then
    L7_122 = L12_127
  end
  if L7_122 == nil and L10_125 ~= 0 then
    L7_122 = L12_127
  end
  if L7_122 == nil and L11_126 ~= 0 then
    L7_122 = L12_127
  end
  L15_130 = A0_115.work
  L12_127.bonus1, L13_128.bonus2, L14_129.bonus3, L15_130.itemlife = desktopWidget:setItemDetailEquip(A0_115, L6_121, L1_116, A0_115.work.index, L7_122)
  L12_127(L13_128, L14_129)
end
function ShopSellWidget.previousSequence(A0_131)
  A0_131:saveSortType()
  A0_131:setBaseAskResult(-1)
end
function ShopSellWidget.processUICommandOperate(A0_132, A1_133, A2_134, A3_135, A4_136)
  local L5_137, L6_138
  L5_137 = A2_134
  if L5_137 == "Button_SortStatus" then
    L6_138 = A0_132.changeSortType
    L6_138(A0_132)
    L6_138 = A0_132.work
    L6_138 = L6_138.index
    A0_132:updateSortType()
    if A0_132:indexToFocus(A0_132.work.listbox, L6_138) > -1 then
      A0_132.work.focus = A0_132:indexToFocus(A0_132.work.listbox, L6_138)
    end
    if A0_132:focusToIndex(A0_132.work.listbox, A0_132.work.focus) >= 0 then
      A0_132.work.index = A0_132:focusToIndex(A0_132.work.listbox, A0_132.work.focus)
    end
    A0_132:displaySortType(A0_132.work.sorttype)
    do break end
    break
  else
  end
end
function ShopSellWidget.processUICommandCancel(A0_139, A1_140, A2_141, A3_142, A4_143)
  if A0_139.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_139.work.waitNext == true then
    return false
  end
  if A0_139:isAskFinish() == true then
    return false
  end
  A0_139:previousSequence()
end
function ShopSellWidget.processUICommandClose(A0_144, A1_145, A2_146, A3_147, A4_148)
  A0_144:previousSequence()
end
function ShopSellWidget.processUICommandSelection(A0_149, A1_150, A2_151, A3_152, A4_153)
  if A0_149.work.editWidgetOpen ~= 0 then
    if A0_149:getChildWidgetByWindowName("ShopEditWidget") == nil and worldMaster:_getServerTime() - A0_149.work.lastcommandtime > 2 then
      A0_149:closeShopEdit(true)
    else
      return false
    end
  end
  if A0_149.work.waitNext == true then
    return false
  end
  if A0_149:isAskFinish() == true then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_149) == false then
    return
  end
  A0_149.work.focus = A3_152
  A0_149.work.listbox = A4_153
  if A0_149:getListBoxItemNum(A0_149.work.listbox) == 0 then
    return A0_149:updateWindowDisplay(true)
  end
  if A0_149.work.focus >= A0_149:getListBoxFocusNum(A0_149.work.listbox) then
    return A0_149:updateListFocus()
  end
  A0_149:updateWindowDisplay(true)
  if A0_149.work.waitupdate == true then
    return
  end
  A0_149.work.chosenPackage = A0_149:getPackageFromList(A0_149.work.listbox)
  A0_149.work.chosenItem = A0_149.work.index + 1
  if A0_149.work.chosenPackage == 1 then
    if A0_149:getListProperty(A0_149:getListPropertyName(A0_149.work.listbox), A0_149.work.index, "isEnabled") == false then
      return
    end
  elseif A0_149.work.chosenPackage ~= 100 then
    return
  end
  A0_149:operateSell()
end
function ShopSellWidget.processUICommandDefault(A0_154, A1_155, A2_156, A3_157, A4_158, A5_159)
  if A0_154.work.editWidgetOpen ~= 0 then
    if A0_154:getChildWidgetByWindowName("ShopEditWidget") == nil and worldMaster:_getServerTime() - A0_154.work.lastcommandtime > 2 then
      A0_154:closeShopEdit(true)
    else
      return false
    end
  end
  if A0_154.work.waitNext == true then
    return false
  end
  if A0_154:isAskFinish() == true then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_154) == false then
    return
  end
  if A3_157 == "UILuaCommands.MouseEnteredItem" or A3_157 == "UILuaCommands.AnchoredItem" then
    if A5_159 == nil then
      return
    end
    if A4_158 == nil or A4_158 < 0 then
      return
    end
    A0_154.work.listbox = A5_159
    A0_154.work.focus = A4_158
    A0_154:setCommonTimer(0.2)
  elseif A3_157 == "UILuaCommands.TabChanged" then
    A0_154.work.listbox = 0 + A0_154:getSelectedTab()
    A0_154:changeList()
  elseif A3_157 == "UILuaCommands.Previous" then
    A0_154:catalogSkip(-1)
  elseif A3_157 == "UILuaCommands.Next" then
    A0_154:catalogSkip(1)
  end
end
function ShopSellWidget.processTimer(A0_160)
  if A0_160:focusToIndex(A0_160.work.listbox, A0_160.work.focus) >= 0 then
    A0_160.work.index = A0_160:focusToIndex(A0_160.work.listbox, A0_160.work.focus)
  end
  A0_160.work.page = 0
  A0_160:updateWindowDisplay(true)
  A0_160:selectedBorder()
end
function ShopSellWidget.catalogSkip(A0_161, A1_162)
  local L2_163, L3_164, L4_165, L5_166, L6_167, L7_168, L8_169, L9_170, L10_171, L11_172, L12_173, L13_174
  L2_163 = A0_161.work
  L2_163 = L2_163.focus
  L4_165 = A0_161
  L3_164 = A0_161.getListBoxFocusNum
  L5_166 = A0_161.work
  L5_166 = L5_166.listbox
  L3_164 = L3_164(L4_165, L5_166)
  L3_164 = L3_164 - 1
  if L3_164 == -1 then
    return
  end
  L4_165 = 2
  L5_166 = A0_161.work
  L5_166 = L5_166.listbox
  if L5_166 ~= 1 then
    L5_166 = 10 * A1_162
    L2_163 = L2_163 + L5_166
  else
    L5_166 = A0_161.work
    L5_166 = L5_166.sorttype
    if L5_166 == 0 then
      L5_166 = 10 * A1_162
      L2_163 = L2_163 + L5_166
    else
      L5_166 = nil
      if A1_162 > 0 then
        L6_167 = A0_161.work
        L6_167 = L6_167.focus
        L5_166 = L3_164 - L6_167
      else
        L6_167 = A0_161.work
        L5_166 = L6_167.focus
      end
      L7_168 = A0_161
      L6_167 = A0_161.getListPropertyName
      L8_169 = A0_161.work
      L8_169 = L8_169.listbox
      L6_167 = L6_167(L7_168, L8_169)
      L7_168 = desktopWidget
      L8_169 = L7_168
      L7_168 = L7_168.getItemSortKey
      L12_173 = 1
      L13_174 = L4_165
      L7_168 = L7_168(L8_169, L9_170, L10_171, L11_172, L12_173, L13_174)
      L8_169 = L2_163
      for L12_173 = 1, L5_166 do
        L8_169 = L8_169 + A1_162
        L13_174 = A0_161.focusToIndex
        L13_174 = L13_174(A0_161, A0_161.work.listbox, L8_169)
        if L7_168 ~= desktopWidget:getItemSortKey(A0_161, L6_167, L13_174, 1, L4_165) then
          L2_163 = L2_163 + L12_173 * A1_162
          break
        end
        if L12_173 == L5_166 then
          if A1_162 > 0 then
            L2_163 = L3_164
          else
            L2_163 = 0
          end
        end
      end
    end
  end
  if L3_164 < L2_163 then
    L2_163 = L3_164
  elseif L2_163 < 0 then
    L2_163 = 0
  end
  L5_166 = A0_161.work
  L5_166 = L5_166.focus
  if L2_163 ~= L5_166 then
    L5_166 = A0_161.work
    L5_166.focus = L2_163
    L6_167 = A0_161
    L5_166 = A0_161.updateWindowDisplay
    L7_168 = true
    L5_166(L6_167, L7_168)
  end
end
function ShopSellWidget.selectedBorder(A0_175, A1_176, A2_177)
  local L3_178, L4_179
  L3_178 = A0_175.getListPropertyName
  L3_178 = L3_178(L4_179, A0_175.work.listbox)
  if A1_176 ~= nil then
    A0_175:setListProperty(L3_178, A0_175.work.index, "selected", L4_179)
    A0_175.work.selected = A0_175.work.index
  elseif L4_179 == -1 and A2_177 == nil then
    return
  else
    for _FORV_7_ = 1, A0_175:getListBoxItemNum(A0_175.work.listbox) do
      A0_175:setListProperty(L3_178, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_179.selected = -1
  end
  L4_179(A0_175, L3_178)
end
function ShopSellWidget.changeList(A0_180)
  A0_180:setText("TextBlock_Title", A0_180:getControlProperty("TabItem_" .. tostring(A0_180.work.listbox), "Header"))
  A0_180.work.index = 0
  A0_180.work.focus = 0
  return A0_180:updateWindowDisplay(true)
end
function ShopSellWidget.operateSell(A0_181)
  A0_181:setBaseAskResult(1)
  A0_181.work.waitForPrice = true
  A0_181.work.lastsub = 8
  A0_181.work.lastcommandtime = worldMaster:_getServerTime()
  return true
end
function ShopSellWidget.updatePlayerItem(A0_182, A1_183, A2_184)
  local L3_185, L4_186
  L3_185 = -1
  if A1_183 == 0 then
    L4_186 = A0_182.work
    L4_186.updatecount = A2_184
    L4_186 = A0_182.work
    L4_186.indexChange = false
    L4_186 = A0_182.work
    L4_186.focusChange = false
    return
  else
    if A1_183 == 1 then
      L4_186 = A0_182.makeListFromPackage
      L4_186(A0_182, A1_183, A2_184)
      L3_185 = 1
    elseif A1_183 == 100 then
      L4_186 = A0_182.makeListFromPackage
      L4_186(A0_182, A1_183, A2_184)
      L3_185 = 2
    end
    L4_186 = A0_182.work
    L4_186 = L4_186.chosenPackage
    if L4_186 == A1_183 then
      L4_186 = A0_182.work
      L4_186 = L4_186.chosenItem
      if L4_186 == A2_184 then
        L4_186 = A0_182.work
        L4_186 = L4_186.editWidgetOpen
        if L4_186 == 0 then
          L4_186 = A0_182.work
          L4_186 = L4_186.submenu
        elseif L4_186 == true then
          L4_186 = A0_182.work
          L4_186.closeok = true
        end
      end
    end
  end
  L4_186 = A0_182.work
  L4_186 = L4_186.updatecount
  if L4_186 > 0 then
    L4_186 = A0_182.work
    L4_186.updatecount = A0_182.work.updatecount - 1
  end
  L4_186 = A0_182.work
  L4_186 = L4_186.updatecount
  if L4_186 == 0 then
    if L3_185 ~= -1 then
      L4_186 = A0_182.getListPropertyName
      L4_186 = L4_186(A0_182, L3_185)
      A0_182:updateListProperty(L4_186)
    end
    L4_186 = A0_182.work
    L4_186 = L4_186.closeok
    if L4_186 == true then
      L4_186 = A0_182.closeShopEdit
      L4_186(A0_182, true)
      L4_186 = A0_182.work
      L4_186.closeok = false
    end
    L4_186 = A0_182.displayBagcapacityAndMoney
    L4_186(A0_182)
    L4_186 = A0_182.work
    L4_186 = L4_186.listbox
    if L3_185 == L4_186 then
      L4_186 = A0_182.updateListFocus
      L4_186(A0_182)
    end
  end
  L4_186 = A0_182.work
  L4_186.waitupdate = false
end
function ShopSellWidget.setShopEditData(A0_187, A1_188, A2_189)
  local L3_190
  L3_190 = A0_187.work
  L3_190.chosenOperation = A1_188
  L3_190 = A0_187.work
  L3_190.buycount = A2_189
end
function ShopSellWidget.closeShopEdit(A0_191, A1_192)
  if A1_192 == nil then
    if A0_191.work.chosenOperation == 1 then
      A0_191:setBaseAskResult(1)
      A0_191:setInputEnable(false)
      A0_191.work.waitNext = true
    else
      A0_191.work.editWidgetOpen = 0
      A0_191:selectedBorder(nil, false)
      A0_191:setInputEnable(true)
    end
  end
  if A0_191.work.isMateriaList then
    A0_191:closeMateriaList()
  end
  A0_191.work.chosenOperation = 0
  if A0_191:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
  end
  A0_191.work.editWidgetOpen = 0
  A0_191.work.lastcommandtime = worldMaster:_getServerTime()
  if A1_192 == nil then
    A0_191:updateWindowDisplay(true)
  end
  return true
end
function ShopSellWidget.checkChosenItem(A0_193, A1_194, A2_195, A3_196)
  if A2_195 ~= nil and A2_195 ~= A0_193.work.chosenPackage then
    return false
  end
  if A3_196 ~= nil and A3_196 ~= A0_193.work.chosenItem then
    return false
  end
  if A0_193.work.chosenPackage ~= A0_193:getPackageFromList(A0_193.work.listbox) then
    return false
  end
  if A0_193.work.chosenItem ~= A0_193.work.index + 1 then
    return false
  end
  if worldMaster:_getMyPlayer():_getItem(A0_193.work.chosenPackage, A0_193.work.chosenItem) == A1_194 then
    return true
  else
    return false
  end
end
function ShopSellWidget.getItemContent(A0_197, A1_198, A2_199, A3_200)
  local L4_201, L5_202, L6_203
  if A1_198 == nil then
    L5_202 = A0_197
    L4_201 = A0_197.getControlProperty
    L6_203 = A2_199
    return L4_201(L5_202, L6_203, A3_200)
  else
    L4_201 = worldMaster
    L5_202 = L4_201
    L4_201 = L4_201._getMyPlayer
    L4_201 = L4_201(L5_202)
    L6_203 = L4_201
    L5_202 = L4_201._getItem
    L5_202 = L5_202(L6_203, A0_197.work.chosenPackage, A0_197.work.chosenItem)
    if A2_199 == "isEquipping" and L5_202 ~= nil then
      L6_203 = L5_202._isEquipping
      L6_203 = L6_203(L5_202)
      if L6_203 == true then
        L6_203 = 1
        return L6_203
      else
        L6_203 = 0
        return L6_203
      end
    end
    if A2_199 == "materianumber" then
      if L5_202 ~= nil then
        L6_203 = desktopWidget
        L6_203 = L6_203.getItemMateriaAttachInfo
        L6_203 = L6_203(L6_203, L5_202)
        return L6_203
      else
        L6_203 = 0
        return L6_203
      end
    end
    if A2_199 == "materiapermission" then
      if L5_202 ~= nil then
        L6_203 = desktopWidget
        L6_203 = L6_203.getItemMateriaAttachInfo
        L6_203 = L6_203(L6_203, L5_202)
        return L6_203(L6_203, L5_202)
      else
        L6_203 = false
        return L6_203
      end
    end
    if A2_199 == "polish" then
      L6_203 = false
      if L5_202 ~= nil and L5_202:isEquipment() and L5_202:getNormalItemFitness() == 10000 then
        L6_203 = true
      end
      return L6_203
    end
    L6_203 = A0_197.getListPropertyName
    L6_203 = L6_203(A0_197, A0_197.work.listbox)
    return A0_197:getListProperty(L6_203, A0_197.work.index, A2_199, A3_200)
  end
end
function ShopSellWidget.getAskResult(A0_204)
  if A0_204:getBaseAskResult() == -1 then
    return 0, 0, 0, 0
  else
    A0_204.work.askstatus = false
    if A0_204.work.waitForPrice == true then
      return A0_204.work.chosenPackage, A0_204.work.chosenItem, 1, 1
    else
      A0_204.work.waitupdate = true
      return A0_204.work.chosenPackage, A0_204.work.chosenItem, A0_204.work.buycount, nil
    end
  end
end
function ShopSellWidget.setAskParameter(A0_205)
  A0_205:updateWindowDisplay(true)
  A0_205.work.askstatus = true
  if A0_205.work.editWidgetOpen == 0 then
    A0_205:selectedBorder()
  end
  A0_205.work.waitNext = false
end
function ShopSellWidget.setPrice(A0_206, A1_207, A2_208, A3_209)
  local L4_210, L5_211, L6_212, L7_213, L8_214, L9_215
  L4_210 = A0_206.work
  L4_210 = L4_210.chosenItem
  if L4_210 == A2_208 then
    L4_210 = A0_206.work
    L4_210 = L4_210.chosenPackage
    if L4_210 == A1_207 then
      L4_210 = A0_206.work
      L4_210.price = A3_209
      L4_210 = nil
      if A1_207 == 1 then
        L4_210 = 1
      elseif A1_207 == 100 then
        L4_210 = 2
      else
        return
      end
      L6_212 = A0_206
      L5_211 = A0_206.getListPropertyName
      L7_213 = L4_210
      L5_211 = L5_211(L6_212, L7_213)
      L6_212 = worldMaster
      L7_213 = L6_212
      L6_212 = L6_212._getMyPlayer
      L6_212 = L6_212(L7_213)
      L8_214 = L6_212
      L7_213 = L6_212._getItem
      L9_215 = A1_207
      L7_213 = L7_213(L8_214, L9_215, A2_208)
      L9_215 = L7_213
      L8_214 = L7_213._getCatalogID
      L8_214 = L8_214(L9_215)
      L9_215 = L7_213._getNameIndex
      L9_215 = L9_215(L7_213)
      if desktopWidget:openChildWidget("ShopEditWidget", A0_206, true, 11, A3_209, nil, nil, nil, A0_206, L7_213:_getCatalogID()) == true then
        A0_206:selectedBorder(A0_206.work.chosenItem - 1, true)
        A0_206.work.waitForPrice = false
        A0_206.work.editWidgetOpen = 11
        A0_206:setInputEnable(false)
        A0_206.work.lastcommandtime = worldMaster:_getServerTime()
        if L7_213:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L7_213) > 0 then
          A0_206:showMateriaList()
        end
        return true
      else
        A0_206.work.editWidgetOpen = 0
        A0_206.work.lastcommandtime = worldMaster:_getServerTime()
      end
    end
  end
  L4_210 = A0_206.work
  L4_210.waitForPrice = false
end
function ShopSellWidget.updatePrice(A0_216, A1_217, A2_218, A3_219)
  local L4_220, L5_221, L6_222, L7_223, L8_224, L9_225, L10_226
  L5_221 = A0_216
  L4_220 = A0_216.getListPropertyName
  L6_222 = A0_216.work
  L6_222 = L6_222.listbox
  L4_220 = L4_220(L5_221, L6_222)
  L6_222 = A0_216
  L5_221 = A0_216.getPackageFromList
  L5_221 = L5_221(L6_222, L7_223)
  L6_222 = A0_216.getListBoxItemNum
  L6_222 = L6_222(L7_223, L8_224)
  for L10_226 = 1, L6_222 do
    if A0_216:checkCatalogQuality(L5_221, L10_226, A1_217, A2_218) == true then
      A0_216:setListText(L4_220, L10_226 - 1, "price", 3201, A3_219)
    end
  end
  L7_223(L8_224, L9_225)
end
function ShopSellWidget.checkCatalogQuality(A0_227, A1_228, A2_229, A3_230, A4_231)
  if A3_230 == worldMaster:_getMyPlayer():_getItem(A1_228, A2_229):_getCatalogID() and A4_231 == worldMaster:_getMyPlayer():_getItem(A1_228, A2_229):_getNameIndex() then
    return true
  else
    return false
  end
end
function ShopSellWidget.syncItemWork(A0_232, A1_233)
  A0_232.work.demandSync = false
end
function ShopSellWidget.getAskWaitStatus(A0_234)
  return A0_234.work.askstatus
end
function ShopSellWidget.showMateriaList(A0_235)
  local L1_236
  L1_236 = worldMaster
  L1_236 = L1_236._getMyPlayer
  L1_236 = L1_236(L1_236)
  L1_236 = L1_236._getItem
  L1_236 = L1_236(L1_236, A0_235.work.chosenPackage, A0_235.work.chosenItem)
  desktopWidget:setMateriaListItems(A0_235, L1_236)
  A0_235:setVisibility("Grid_MateriaEquipList", true)
  A0_235:setVisibility("Grid_TabList", false)
  A0_235:setVisibility("Button_ListClose", false)
  A0_235.work.isMateriaList = true
end
function ShopSellWidget.closeMateriaList(A0_237)
  A0_237:setVisibility("Grid_MateriaEquipList", false)
  A0_237:setVisibility("Grid_TabList", true)
  A0_237.work.isMateriaList = false
end
function ShopSellWidget.displaySortType(A0_238, A1_239)
  desktopWidget:displaySortType(A1_239, A0_238, "Button_SortStatus")
end
function ShopSellWidget.changeSortType(A0_240)
  A0_240.work.sorttype = desktopWidget:changeSortType(A0_240.work.sorttype)
end
function ShopSellWidget.saveSortType(A0_241)
  desktopWidget:saveSortType(A0_241.work.sorttype)
end
