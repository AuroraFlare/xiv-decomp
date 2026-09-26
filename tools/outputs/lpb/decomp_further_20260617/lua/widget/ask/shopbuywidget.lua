require("/Widget/Ask/AskBaseClass")
_defineClass("ShopBuyWidget", "AskBaseClass")
function ShopBuyWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function ShopBuyWidget.initAsk(A0_2, A1_3, A2_4, A3_5)
  local L4_6, L5_7, L6_8, L7_9, L8_10
  L7_9 = "chosenItem"
  L8_10 = "integer32"
  L7_9 = {L8_10, "integer32"}
  L8_10 = "chosenPackage"
  L8_10 = {
    "chosenOperation",
    "integer32"
  }
  L4_6._temp = L5_7
  L4_6.chosenOperation = 0
  L4_6.editWidgetOpen = 0
  L4_6.initialized = false
  L5_7.index = 0
  L4_6.listbox = L6_8
  L4_6.bonus1 = false
  L4_6.bonus2 = false
  L4_6.bonus3 = false
  L4_6.itemlife = false
  L4_6.bazaar = false
  L4_6.closeok = false
  L4_6.demandSync = false
  L4_6.sorttype = 0
  L4_6.submenu = false
  L4_6.lastsub = 10
  L4_6.askstatus = true
  L7_9 = "@"
  L8_10 = tostring
  L8_10 = L8_10(3407)
  L7_9 = L7_9 .. L8_10
  L4_6(L5_7, L6_8, L7_9)
  L4_6(L5_7)
  for L7_9 = 1, 5 do
    L8_10 = "TabItem_"
    L8_10 = L8_10 .. tostring(L7_9)
    A0_2:setCancelCondition(L8_10)
  end
  L7_9 = "UILuaCommands.TabChanged"
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = 214
  L8_10 = 10091
  L4_6(L5_7, L6_8, L7_9, L8_10)
  L7_9 = 214
  L8_10 = 10093
  L4_6(L5_7, L6_8, L7_9, L8_10)
  L7_9 = ""
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = 3401
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = 3131
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = 0
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L4_6(L5_7, L6_8)
  L4_6(L5_7, L6_8)
  L4_6(L5_7, L6_8)
  L4_6(L5_7, L6_8)
  L4_6(L5_7, L6_8)
  L4_6(L5_7, L6_8)
  L7_9 = A2_4
  L8_10 = A3_5
  L4_6(L5_7, L6_8, L7_9, L8_10)
  if L4_6 then
    L4_6.blackmarket = true
    L7_9 = desktopWidget
    L8_10 = L7_9
    L7_9 = L7_9.getActorName
    L8_10 = L7_9(L8_10, A1_3)
    L4_6(L5_7, L6_8, L7_9, L8_10, L7_9(L8_10, A1_3))
    L7_9 = 8013
    L4_6(L5_7, L6_8, L7_9)
    L7_9 = 8012
    L4_6(L5_7, L6_8, L7_9)
  else
    L4_6.blackmarket = false
  end
end
function ShopBuyWidget.setInitialData(A0_11, A1_12, A2_13, A3_14)
  local L4_15, L5_16, L6_17
  if A2_13 ~= nil then
    L4_15 = A0_11.work
    L4_15.shopid = A2_13
  else
    L4_15 = A0_11.work
    L4_15.shopid = 0
  end
  L4_15 = A0_11.work
  L6_17 = A1_12
  L5_16 = A1_12.getShopItemStartIndex
  L5_16 = L5_16(L6_17, A0_11.work.shopid)
  L4_15.startindex = L5_16
  L5_16 = A0_11
  L4_15 = A0_11.resetListBox
  L6_17 = 1
  L4_15(L5_16, L6_17)
  L5_16 = A0_11
  L4_15 = A0_11.resetListBox
  L6_17 = 2
  L4_15(L5_16, L6_17)
  L5_16 = A0_11
  L4_15 = A0_11.resetListBox
  L6_17 = 3
  L4_15(L5_16, L6_17)
  L5_16 = A0_11
  L4_15 = A0_11.resetListBox
  L6_17 = 4
  L4_15(L5_16, L6_17)
  L5_16 = A0_11
  L4_15 = A0_11.resetListBox
  L6_17 = 5
  L4_15(L5_16, L6_17)
  L4_15 = desktopWidget
  L5_16 = L4_15
  L4_15 = L4_15.setMateriaAttachSlotIconHelp
  L6_17 = A0_11
  L4_15(L5_16, L6_17)
  L5_16 = A0_11
  L4_15 = A0_11.setGridVisibility
  L6_17 = 1
  L4_15(L5_16, L6_17)
  L4_15 = A0_11.work
  L4_15.listbox = 1
  L5_16 = A0_11
  L4_15 = A0_11.setVisibility
  L6_17 = A0_11.getListBoxName
  L6_17 = L6_17(A0_11, 1)
  L4_15(L5_16, L6_17, false)
  L5_16 = A0_11
  L4_15 = A0_11.setVisibility
  L6_17 = "TextBlock_NoContents_1"
  L4_15(L5_16, L6_17, true)
  L5_16 = A0_11
  L4_15 = A0_11.makeShopItemList
  L6_17 = A1_12
  L4_15 = L4_15(L5_16, L6_17)
  L6_17 = A0_11
  L5_16 = A0_11.getListBoxName
  L5_16 = L5_16(L6_17, 1)
  L6_17 = A0_11.getListPropertyName
  L6_17 = L6_17(A0_11, 1)
  A0_11:setControlProperty(L5_16, "SourceFirstIndex", 0)
  A0_11:setControlProperty(L5_16, "SourceCount", L4_15)
  A0_11:setControlProperty(L6_17, "FilteredSortKey", "sorttype")
  A0_11.work.initialized = true
  if A3_14 == nil or A3_14 == 1000001 then
    A0_11.work.money = 1000001
  else
    A0_11.work.money = A3_14
    A0_11:setIcon("IconControl_Gil", worldMaster:_getMyPlayer():createVirtualItem(A0_11.work.money):getItemIcon())
    A0_11:setHelpParameter("Grid_Gil", 0)
  end
  A0_11:setGridVisibility(2)
  A0_11:setVisibility(A0_11:getListBoxName(1), true)
  A0_11:setVisibility("TextBlock_NoContents_1", false)
  A0_11:changeList()
  A0_11:updateWindowDisplay(true)
  A0_11:displayBagcapacityAndMoney()
end
function ShopBuyWidget.processBeforeShow(A0_18, A1_19)
  local L2_20
  if A1_19 ~= true then
    L2_20 = true
    return L2_20
  end
  L2_20 = true
  return L2_20
end
function ShopBuyWidget.getListPropertyName(A0_21, A1_22)
  local L2_23
  if A1_22 == 1 then
    L2_23 = "TabItem_1_Maker"
    return L2_23
  elseif A1_22 == 2 then
    L2_23 = "TabItem_2_Maker"
    return L2_23
  elseif A1_22 == 3 then
    L2_23 = "TabItem_3_Maker"
    return L2_23
  elseif A1_22 == 4 then
    L2_23 = "TabItem_4_Maker"
    return L2_23
  elseif A1_22 == 5 then
    L2_23 = "TabItem_5_Maker"
    return L2_23
  elseif A1_22 == 8 then
    L2_23 = "SlotItem_Maker"
    return L2_23
  elseif A1_22 == 9 then
    L2_23 = "HelpCache_Maker"
    return L2_23
  end
end
function ShopBuyWidget.updateWindowDisplay(A0_24, A1_25)
  A0_24:setGridVisibility(3)
  A0_24:setVisibility("Button_SortStatus", false)
  if A1_25 == true then
    A0_24:updateListFocus()
  end
end
function ShopBuyWidget.updateListFocus(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  L1_27 = A0_26.work
  L1_27 = L1_27.updatecount
  if L1_27 ~= 0 then
    L1_27 = false
    return L1_27
  end
  L2_28 = A0_26
  L1_27 = A0_26.getListBoxFocusNum
  L3_29 = A0_26.work
  L3_29 = L3_29.listbox
  L4_30 = L1_27(L2_28, L3_29)
  L6_32 = A0_26
  L5_31 = A0_26.getListBoxName
  L5_31 = L5_31(L6_32, A0_26.work.listbox)
  L6_32 = "TextBlock_NoContents_1"
  if L1_27 == 0 then
    if A0_26:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
      A0_26:closeShopEdit(false)
    end
    A0_26:setVisibility(L6_32, true)
    A0_26:setVisibility(L5_31, false)
    A0_26:displayHelp(3140)
    A0_26:setGridVisibility(2)
    A0_26:setWindowFocus(L6_32)
  else
    A0_26:setVisibility(L5_31, true)
    A0_26:setVisibility(L6_32, false)
    if A0_26.work.focus > L1_27 - 1 then
      A0_26.work.focus = L1_27 - 1
    end
    if 0 <= A0_26:focusToIndex(A0_26.work.listbox, A0_26.work.focus) then
      A0_26.work.index = A0_26:focusToIndex(A0_26.work.listbox, A0_26.work.focus)
    end
    A0_26:setControlProperty(L5_31, "SqwtFocusedIndex", A0_26.work.focus)
    A0_26:setWindowFocus(L5_31)
    A0_26:setFocusedIndex(L5_31, A0_26.work.focus)
    A0_26:displayFocusedItemHelp()
  end
end
function ShopBuyWidget.setGridVisibility(A0_33, A1_34)
  A0_33:setVisibility("Grid_ActorName", false)
  A0_33:setVisibility("Grid_Help", A1_34 == 2)
  A0_33:setVisibility("Grid_TabList", true)
  A0_33:setVisibility("Grid_BackpackAndGil", true)
  A0_33:setVisibility("Grid_ItemNameBase", A1_34 == 1 or A1_34 == 2 or A1_34 == 3 or A1_34 == 4)
  A0_33:setVisibility("Grid_ItemDetail1", A0_33.work.bonus1)
  A0_33:setVisibility("Grid_ItemDetail2", A0_33.work.bonus2)
  A0_33:setVisibility("Grid_ItemDetail3", A0_33.work.bonus3 or A0_33.work.itemlife or A0_33.work.bazaar)
  A0_33:setVisibility("Label_ItemBonus5", A0_33.work.bonus3)
  A0_33:setVisibility("Grid_ItemLife", A0_33.work.itemlife)
  A0_33:setVisibility("Grid_ItemBazaarInformation", A0_33.work.bazaar)
  A0_33:setVisibility("Grid_MateriaAttachBazaarInformation", false)
end
function ShopBuyWidget.setWindowFocus(A0_35, A1_36)
  if A1_36 ~= nil and A1_36 ~= "" then
    A0_35:setLogicalFocus(A1_36)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_35 then
      A0_35:setKeyboardFocusedControl(A1_36)
    end
  end
end
function ShopBuyWidget.displayBagcapacityAndMoney(A0_37)
  local L1_38, L2_39
  L1_38 = A0_37.work
  L1_38 = L1_38.money
  if L1_38 == 1000001 then
    L2_39 = A0_37
    L1_38 = A0_37.setText
    L1_38(L2_39, "TextBlock_Gil", 3263, A0_37:countMoney(A0_37.work.money))
  else
    L1_38 = A0_37.work
    L1_38 = L1_38.money
    L1_38 = L1_38 - 1000101
    L1_38 = 3421 + L1_38
    L2_39 = A0_37.setText
    L2_39(A0_37, "TextBlock_Gil", L1_38, A0_37:countMoney(A0_37.work.money))
  end
  L1_38 = worldMaster
  L2_39 = L1_38
  L1_38 = L1_38._getMyPlayer
  L1_38 = L1_38(L2_39)
  L2_39 = L1_38._getItemPackageCapacity
  L2_39 = L2_39(L1_38, 1)
  A0_37:setText("TextBlock_ItemStack_2", 3551, L2_39 - L1_38:_getItemPackageFreeSpace(1), L2_39)
end
function ShopBuyWidget.countMoney(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48
  L2_42 = worldMaster
  L3_43 = L2_42
  L2_42 = L2_42._getMyPlayer
  L2_42 = L2_42(L3_43)
  L4_44 = L2_42
  L3_43 = L2_42._getItemPackageCapacity
  L3_43 = L3_43(L4_44, L5_45)
  L4_44 = L2_42._getItemPackageFreeSpace
  L4_44 = L4_44(L5_45, L6_46)
  for L8_48 = 1, L3_43 - L4_44 do
    if desktopWidget:getPlayerItemInPackage(100, L8_48) == A1_41 then
      return desktopWidget:getPlayerItemInPackage(100, L8_48)
    end
  end
  return L5_45
end
function ShopBuyWidget.isMoneyItem(A0_49, A1_50)
  local L2_51
  if A1_50 == 1000001 then
    L2_51 = true
    return L2_51
  elseif A1_50 >= 1000101 and A1_50 <= 1000124 then
    L2_51 = true
    return L2_51
  end
  L2_51 = false
  return L2_51
end
function ShopBuyWidget.isExistItem(A0_52, A1_53, A2_54)
  if worldMaster:_getMyPlayer():_getItem(A1_53, A2_54) ~= nil then
    return true
  else
    return false
  end
end
function ShopBuyWidget.getSelectedTab(A0_55)
  return A0_55:getSelectedIndex("TabControl_ItemList") + 1
end
function ShopBuyWidget.getListBoxName(A0_56, A1_57)
  local L2_58
  if A1_57 == 1 then
    L2_58 = "ListBox_TabItem_1"
    return L2_58
  elseif A1_57 == 2 then
    L2_58 = "ListBox_TabItem_2"
    return L2_58
  elseif A1_57 == 3 then
    L2_58 = "ListBox_TabItem_3"
    return L2_58
  elseif A1_57 == 4 then
    L2_58 = "ListBox_TabItem_4"
    return L2_58
  elseif A1_57 == 5 then
    L2_58 = "ListBox_TabItem_5"
    return L2_58
  else
    L2_58 = ""
    return L2_58
  end
end
function ShopBuyWidget.getListBoxItemNum(A0_59, A1_60)
  local L2_61, L3_62
  L3_62 = A0_59
  L2_61 = A0_59.getListPropertyCount
  return L2_61(L3_62, A0_59:getListPropertyName(A1_60))
end
function ShopBuyWidget.getListBoxFocusNum(A0_63, A1_64)
  local L2_65, L3_66, L4_67, L5_68
  L3_66 = A0_63
  L2_65 = A0_63.getListBoxItemNum
  L4_67 = A1_64
  L2_65 = L2_65(L3_66, L4_67)
  L4_67 = A0_63
  L3_66 = A0_63.getListPropertyName
  L5_68 = A1_64
  L3_66 = L3_66(L4_67, L5_68)
  if L2_65 == 0 then
    L4_67 = 0
    L5_68 = 0
    return L4_67, L5_68, 0, 0
  end
  L5_68 = A0_63
  L4_67 = A0_63.getControlProperty
  L4_67 = L4_67(L5_68, L3_66, "FilteredCount")
  L5_68 = A0_63.work
  L5_68 = L5_68.focus
  if L4_67 < A0_63.work.focus then
    L5_68 = L4_67 - 1
  end
  return L4_67, L4_67 - 1, 0, L5_68
end
function ShopBuyWidget.focusToIndex(A0_69, A1_70, A2_71)
  local L3_72
  L3_72 = A0_69.getListPropertyName
  L3_72 = L3_72(A0_69, A1_70)
  if A0_69:getListBoxFocusNum(A1_70) == 0 or A2_71 >= A0_69:getListBoxFocusNum(A1_70) then
    return -1
  else
    A0_69:setControlProperty(L3_72, "FilteredIndex", A2_71)
    return A0_69:getControlProperty(L3_72, "Index")
  end
end
function ShopBuyWidget.indexToFocus(A0_73, A1_74, A2_75)
  local L3_76, L4_77
  L3_76 = -1
  L4_77 = A0_73.getListPropertyName
  L4_77 = L4_77(A0_73, A1_74)
  if A0_73:getListBoxFocusNum(A1_74) > 0 then
    A0_73:setControlProperty(L4_77, "Index", A2_75)
    L3_76 = A0_73:getControlProperty(L4_77, "FilteredIndex")
  end
  A0_73:setControlProperty(L4_77, "Index", A0_73.work.index)
  return L3_76
end
function ShopBuyWidget.initListBox(A0_78, A1_79)
  local L2_80, L3_81
  L3_81 = A0_78
  L2_80 = A0_78.getListBoxName
  L2_80 = L2_80(L3_81, A1_79)
  if L2_80 ~= "" then
    L3_81 = A0_78.setControlProperty
    L3_81(A0_78, L2_80, "IntData.Value0", A1_79)
    L3_81 = A0_78.setControlCommandCondition
    L3_81(A0_78, L2_80, "UILuaCommands.MouseEnteredItem")
    L3_81 = A0_78.setControlCommandCondition
    L3_81(A0_78, L2_80, "UILuaCommands.AnchoredItem")
    L3_81 = A0_78.setControlCommandCondition
    L3_81(A0_78, L2_80, "UILuaCommands.Selection")
    L3_81 = A0_78.setCancelCondition
    L3_81(A0_78, L2_80)
    L3_81 = A0_78.setVisibility
    L3_81(A0_78, L2_80, true)
    L3_81 = "TextBlock_NoContents_"
    L3_81 = L3_81 .. tostring(A1_79)
    A0_78:setVisibility(L3_81, false)
    A0_78:setControlProperty(L3_81, "IsTabStop", true)
    A0_78:setCancelCondition(L3_81)
    A0_78:setControlCommandCondition(L2_80, "UILuaCommands.Previous")
    A0_78:setControlCommandCondition(L2_80, "UILuaCommands.Next")
  end
end
function ShopBuyWidget.resetListBox(A0_82, A1_83)
  local L2_84, L3_85
  L3_85 = A0_82
  L2_84 = A0_82.getListBoxItemNum
  L2_84 = L2_84(L3_85, A1_83)
  L3_85 = A0_82.getListPropertyName
  L3_85 = L3_85(A0_82, A1_83)
  if L2_84 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_84 do
      L2_84 = L2_84 - 1
      A0_82:deleteListProperty(L3_85, L2_84)
    end
    A0_82:updateListProperty(L3_85)
  end
end
function ShopBuyWidget.setItemToXml(A0_86, A1_87, A2_88, A3_89, A4_90, A5_91, A6_92)
  local L7_93, L8_94, L9_95, L10_96, L11_97, L12_98, L13_99, L14_100, L15_101, L16_102, L17_103
  L8_94 = A0_86
  L7_93 = A0_86.getListPropertyName
  L9_95 = A1_87
  L7_93 = L7_93(L8_94, L9_95)
  L8_94, L9_95, L10_96, L11_97, L12_98 = nil, nil, nil, nil, nil
  L13_99 = worldMaster
  L14_100 = L13_99
  L13_99 = L13_99._getMyPlayer
  L13_99 = L13_99(L14_100)
  L14_100, L15_101 = nil, nil
  L16_102 = "TBL_null"
  if A5_91 == 3 then
    L17_103 = nil
    L8_94, L12_98, L17_103 = A6_92:getShopSellingItemDetail(L13_99, A3_89, A4_90, A0_86.work.startindex)
    L14_100 = L13_99:createVirtualItem(L8_94)
    if L14_100 == nil then
      return false
    end
    L9_95 = L14_100:getItemIcon()
    L10_96 = L14_100:_isStackable()
    L11_97 = L14_100:_countStack()
    A0_86:setListProperty(L7_93, A2_88, "itemOwner", 3)
    A0_86:setListText(L7_93, A2_88, "price", 225, L17_103)
    A0_86:setListProperty(L7_93, A2_88, "pricedata", L17_103)
    A0_86:setListPropertyVisibility(L7_93, A2_88, true)
    A0_86:setListProperty(L7_93, A2_88, "stack", "")
    A0_86:setListProperty(L7_93, A2_88, "mivisible", "Collapsed")
    A0_86:setListProperty(L7_93, A2_88, "mpvisible", "Hidden")
    A0_86:setListProperty(L7_93, A2_88, "mcvisible", "Hidden")
    A0_86:setListProperty(L7_93, A2_88, "polmax", "Collapsed")
    A0_86:setListProperty(L7_93, A2_88, "equiped", "Collapsed")
  else
    L17_103 = L13_99._getItem
    L17_103 = L17_103(L13_99, A3_89, A4_90)
    L14_100 = L17_103
    if L14_100 == nil then
      L17_103 = false
      return L17_103
    end
    L17_103 = A0_86.setListProperty
    L17_103(A0_86, L7_93, A2_88, "itemOwner", 1)
    L17_103 = desktopWidget
    L17_103 = L17_103.getPlayerItemInPackage
    L9_95, L10_96, L11_97, L17_103 = L17_103, A3_89, A4_90, L17_103(L17_103, A3_89, A4_90)
    L8_94 = L17_103
    L17_103 = L14_100._getNameIndex
    L17_103 = L17_103(L14_100)
    L12_98 = L17_103
  end
  L17_103 = desktopWidget
  L17_103 = L17_103.setItemToXml
  L17_103(L17_103, A0_86, L7_93, A2_88, L14_100, L16_102, L8_94, L9_95, L10_96, L11_97, L12_98, nil, true, false, 6, A3_89, A4_90, A5_91, false)
  L17_103 = desktopWidget
  L17_103 = L17_103.setItemDetailToXml
  L17_103(L17_103, A0_86, L7_93, A2_88, L14_100, L12_98, A5_91, 6)
  L17_103 = L14_100.isEnchantMateria
  L17_103 = L17_103(L14_100)
  if L17_103 then
    L17_103 = A0_86.setListProperty
    L17_103(A0_86, L7_93, A2_88, "mrank", (L8_94 - 1) % 4 * 4)
  end
  L17_103 = true
  return L17_103
end
function ShopBuyWidget.makeShopItemList(A0_104, A1_105)
  local L2_106, L3_107, L4_108, L5_109, L6_110, L7_111, L8_112
  L3_107 = A1_105
  L2_106 = A1_105.getShopSellingItemMax
  L4_108 = A0_104.work
  L4_108 = L4_108.shopid
  L2_106 = L2_106(L3_107, L4_108, L5_109)
  L4_108 = A0_104
  L3_107 = A0_104.getListPropertyName
  L3_107 = L3_107(L4_108, L5_109)
  L4_108 = A0_104.getListBoxItemNum
  L4_108 = L4_108(L5_109, L6_110)
  for L8_112 = 1, L2_106 do
    A0_104:setItemToXml(1, L8_112 - 1, A0_104.work.shopid, L8_112, 3, A1_105)
  end
  if L2_106 < L4_108 then
    for L8_112 = L2_106, L4_108 - 1 do
      A0_104:deleteListProperty(L3_107, L8_112)
    end
  end
  L5_109(L6_110, L7_111)
  return L2_106
end
function ShopBuyWidget.displayHelp(A0_113, A1_114)
  A0_113:setText("TextBlock_Help", A1_114)
end
function ShopBuyWidget.displayFocusedItemHelp(A0_115)
  local L1_116, L2_117, L3_118, L4_119, L5_120, L6_121, L7_122
  L2_117 = A0_115
  L1_116 = A0_115.getListBoxItemNum
  L3_118 = A0_115.work
  L3_118 = L3_118.listbox
  L1_116 = L1_116(L2_117, L3_118)
  if L1_116 == 0 then
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
  L2_117 = worldMaster
  L3_118 = L2_117
  L2_117 = L2_117._getMyPlayer
  L2_117 = L2_117(L3_118)
  L3_118 = desktopWidget
  L4_119 = L3_118
  L3_118 = L3_118.setItemDetail
  L5_120 = A0_115
  L6_121 = nil
  L7_122 = L1_116
  L3_118(L4_119, L5_120, L6_121, L7_122, A0_115.work.index)
  L3_118 = A0_115.work
  L3_118.bazaar = false
  L4_119 = A0_115
  L3_118 = A0_115.setVisibility
  L5_120 = "Grid_RewardMoney"
  L6_121 = false
  L3_118(L4_119, L5_120, L6_121)
  L4_119 = A0_115
  L3_118 = A0_115.setVisibility
  L5_120 = "Grid_RewardItem"
  L6_121 = false
  L3_118(L4_119, L5_120, L6_121)
  L3_118 = nil
  L4_119 = 0
  L5_120 = 0
  L6_121 = 0
  L7_122 = 0
  L4_119 = A0_115:getListProperty(L1_116, A0_115.work.index, "firstSlot")
  L5_120 = A0_115:getListProperty(L1_116, A0_115.work.index, "secondSlot")
  L6_121 = A0_115:getListProperty(L1_116, A0_115.work.index, "thirdSlot")
  L7_122 = A0_115:getListProperty(L1_116, A0_115.work.index, "fourthSlot")
  if L4_119 ~= 0 then
    L3_118 = L2_117:_getEquippingItem(L4_119)
  end
  if L3_118 == nil and L5_120 ~= 0 then
    L3_118 = L2_117:_getEquippingItem(L5_120)
  end
  if L3_118 == nil and L6_121 ~= 0 then
    L3_118 = L2_117:_getEquippingItem(L6_121)
  end
  if L3_118 == nil and L7_122 ~= 0 then
    L3_118 = L2_117:_getEquippingItem(L7_122)
  end
  A0_115.work.bonus1, A0_115.work.bonus2, A0_115.work.bonus3, A0_115.work.itemlife = desktopWidget:setItemDetailEquip(A0_115, nil, L1_116, A0_115.work.index, L3_118, true, false, false, true, false, false, A0_115, true)
  A0_115:setVisibility("Border_ItemLife_IconCaution", false)
  A0_115:setVisibility("Border_ItemLife_IconDanger", false)
  A0_115:updateWindowDisplay(false)
end
function ShopBuyWidget.previousSequence(A0_123)
  A0_123:setBaseAskResult(-1)
end
function ShopBuyWidget.isOperateButtonEnable(A0_124, A1_125, A2_126)
  local L3_127
  L3_127 = A0_124.getListPropertyName
  L3_127 = L3_127(A0_124, A1_125)
  return false
end
function ShopBuyWidget.processUICommandOperate(A0_128, A1_129, A2_130, A3_131, A4_132)
  if A0_128.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_128.work.waitNext == true then
    return false
  end
  if A0_128:isAskFinish() == true then
    return false
  end
  if A2_130 == "TOG_itemDetail" then
    if A0_128.work.page == 0 and A0_128.work.itemlife == true then
      A0_128.work.page = 1
    else
      A0_128.work.page = 0
    end
    A0_128:displayFocusedItemHelp()
    return
  end
end
function ShopBuyWidget.processUICommandCancel(A0_133, A1_134, A2_135, A3_136, A4_137)
  if A0_133.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_133.work.waitNext == true then
    return false
  end
  if A0_133:isAskFinish() == true then
    return false
  end
  A0_133:previousSequence()
end
function ShopBuyWidget.processUICommandClose(A0_138, A1_139, A2_140, A3_141, A4_142)
  A0_138:previousSequence()
end
function ShopBuyWidget.processUICommandSelection(A0_143, A1_144, A2_145, A3_146, A4_147)
  local L5_148
  L5_148 = A0_143.work
  L5_148 = L5_148.editWidgetOpen
  if L5_148 ~= 0 then
    L5_148 = false
    return L5_148
  end
  L5_148 = A0_143.work
  L5_148 = L5_148.waitNext
  if L5_148 == true then
    L5_148 = false
    return L5_148
  end
  L5_148 = A0_143.isAskFinish
  L5_148 = L5_148(A0_143)
  if L5_148 == true then
    L5_148 = false
    return L5_148
  end
  L5_148 = desktopWidget
  L5_148 = L5_148.checkKeyboardFocused
  L5_148 = L5_148(L5_148, A0_143)
  if L5_148 == false then
    return
  end
  L5_148 = A0_143.work
  L5_148.focus = A3_146
  L5_148 = A0_143.work
  L5_148.listbox = A4_147
  L5_148 = A0_143.getListBoxItemNum
  L5_148 = L5_148(A0_143, A0_143.work.listbox)
  if L5_148 == 0 then
    L5_148 = A0_143.updateWindowDisplay
    return L5_148(A0_143, true)
  end
  L5_148 = A0_143.work
  L5_148 = L5_148.focus
  if L5_148 >= A0_143:getListBoxFocusNum(A0_143.work.listbox) then
    L5_148 = A0_143.updateListFocus
    return L5_148(A0_143)
  end
  L5_148 = A0_143.setCommonTimer
  L5_148(A0_143, nil)
  L5_148 = A0_143.updateWindowDisplay
  L5_148(A0_143, true)
  L5_148 = A0_143.selectedBorder
  L5_148(A0_143, A0_143.work.index, true)
  L5_148 = A0_143.getListPropertyName
  L5_148 = L5_148(A0_143, A0_143.work.listbox)
  A0_143.work.chosenPackage = A0_143:getListProperty(L5_148, A0_143.work.index, "itemPackage")
  A0_143.work.chosenItem = A0_143:getListProperty(L5_148, A0_143.work.index, "itemIndex")
  A0_143:operateBuy()
end
function ShopBuyWidget.processUICommandDefault(A0_149, A1_150, A2_151, A3_152, A4_153, A5_154)
  if A0_149.work.editWidgetOpen ~= 0 then
    return false
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
  if A3_152 == "UILuaCommands.MouseEnteredItem" or A3_152 == "UILuaCommands.AnchoredItem" then
    if A5_154 == nil then
      return
    end
    if A4_153 == nil or A4_153 < 0 then
      return
    end
    A0_149.work.listbox = A5_154
    A0_149.work.focus = A4_153
    A0_149:setCommonTimer(0.2)
  elseif A3_152 == "UILuaCommands.Previous" then
    A0_149:catalogSkip(-1)
  elseif A3_152 == "UILuaCommands.Next" then
    A0_149:catalogSkip(1)
  elseif A3_152 == "UILuaCommands.TabChanged" then
    return
  end
end
function ShopBuyWidget.processTimer(A0_155)
  if A0_155:focusToIndex(A0_155.work.listbox, A0_155.work.focus) >= 0 then
    A0_155.work.index = A0_155:focusToIndex(A0_155.work.listbox, A0_155.work.focus)
  end
  A0_155.work.page = 0
  A0_155:updateWindowDisplay(true)
  if A0_155.work.selected ~= -1 then
    A0_155:selectedBorder()
  end
end
function ShopBuyWidget.catalogSkip(A0_156, A1_157)
  local L2_158
  L2_158 = A0_156.work
  L2_158 = L2_158.focus
  if A0_156:getListBoxFocusNum(A0_156.work.listbox) - 1 == -1 then
    return
  end
  L2_158 = L2_158 + 10 * A1_157
  if A0_156:getListBoxFocusNum(A0_156.work.listbox) - 1 < L2_158 then
    L2_158 = A0_156:getListBoxFocusNum(A0_156.work.listbox) - 1
  elseif L2_158 < 0 then
    L2_158 = 0
  end
  if L2_158 ~= A0_156.work.focus then
    A0_156.work.focus = L2_158
    A0_156:updateWindowDisplay(true)
  end
end
function ShopBuyWidget.selectedBorder(A0_159, A1_160, A2_161)
  local L3_162, L4_163
  L3_162 = A0_159.getListPropertyName
  L3_162 = L3_162(L4_163, A0_159.work.listbox)
  if A1_160 ~= nil then
    A0_159:setListProperty(L3_162, A0_159.work.index, "selected", L4_163)
    A0_159.work.selected = A0_159.work.index
  else
    for _FORV_7_ = 1, A0_159:getListBoxItemNum(A0_159.work.listbox) do
      A0_159:setListProperty(L3_162, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_163.selected = -1
  end
  L4_163(A0_159, L3_162)
end
function ShopBuyWidget.changeList(A0_164)
  A0_164.work.index = 0
  A0_164.work.focus = 0
  return A0_164:updateWindowDisplay(true)
end
function ShopBuyWidget.operateBuy(A0_165)
  local L1_166, L2_167, L3_168, L4_169, L5_170
  L2_167 = A0_165
  L1_166 = A0_165.getControlProperty
  L3_168 = "IconControl_Gil"
  L4_169 = "IconDatas"
  L1_166 = L1_166(L2_167, L3_168, L4_169)
  L3_168 = A0_165
  L2_167 = A0_165.getListPropertyName
  L4_169 = A0_165.work
  L4_169 = L4_169.listbox
  L2_167 = L2_167(L3_168, L4_169)
  L4_169 = A0_165
  L3_168 = A0_165.getListProperty
  L5_170 = L2_167
  L3_168 = L3_168(L4_169, L5_170, A0_165.work.index, "catalog")
  L5_170 = A0_165
  L4_169 = A0_165.getListProperty
  L4_169 = L4_169(L5_170, L2_167, A0_165.work.index, "mask")
  if L4_169 == 1 then
    L4_169 = worldMaster
    L5_170 = L4_169
    L4_169 = L4_169.notify
    L4_169(L5_170, worldMaster, 25089)
    L4_169 = false
    return L4_169
  end
  L5_170 = A0_165
  L4_169 = A0_165.getListProperty
  L4_169 = L4_169(L5_170, L2_167, A0_165.work.index, "pricedata")
  L5_170 = A0_165.countMoney
  L5_170 = L5_170(A0_165, A0_165.work.money)
  if L4_169 > L5_170 then
  end
  L5_170 = nil
  L5_170 = desktopWidget:openChildWidget("ShopEditWidget", A0_165, true, 12, L4_169, A0_165:countMoney(A0_165.work.money), L1_166, A0_165.work.money, A0_165, L3_168, A0_165.work.blackmarket)
  if L5_170 == true then
    A0_165.work.editWidgetOpen = 12
    A0_165.work.lastsub = 8
  end
  return L5_170
end
function ShopBuyWidget.setSubPosition(A0_171)
  local L1_172, L2_173, L3_174, L4_175, L5_176, L6_177, L7_178, L8_179, L9_180, L10_181, L11_182, L12_183, L13_184, L14_185, L15_186, L16_187
  L2_173 = A0_171
  L1_172 = A0_171.getChildWidgetByWindowName
  L3_174 = "ItemSubWidget"
  L1_172 = L1_172(L2_173, L3_174)
  if L1_172 ~= nil then
    L3_174 = L1_172
    L2_173 = L1_172.setProperty
    L4_175 = "Margin"
    L5_176 = "0,0,0,0"
    L2_173(L3_174, L4_175, L5_176)
    L3_174 = A0_171
    L2_173 = A0_171.getWindowPosition
    L3_174 = L2_173(L3_174)
    L5_176 = A0_171
    L4_175 = A0_171.getWindowSize
    L5_176 = L4_175(L5_176)
    L6_177 = desktopWidget
    L7_178 = L6_177
    L6_177 = L6_177.getWindowSize
    L7_178 = L6_177(L7_178)
    L2_173 = L2_173 + 64
    L3_174 = L3_174 + 36
    L8_179 = L6_177 - 64
    L9_180 = 64
    L10_181 = L7_178 - 36
    L11_182 = 36
    if L6_177 == 640 and L7_178 == 480 then
      L8_179 = L6_177 * 0.85
      L9_180 = L6_177 * 0.15
      L10_181 = L7_178 * 0.85
      L11_182 = L7_178 * 0.15
    end
    L12_183 = L3_174 + 120
    L14_185 = L1_172
    L13_184 = L1_172.getWindowSize
    L14_185 = L13_184(L14_185)
    L15_186 = L12_183 + L14_185
    L16_187 = L2_173 + L4_175
    if L8_179 < L16_187 + L13_184 then
      L16_187 = L16_187 - (L16_187 + L13_184 - L8_179)
    end
    if L10_181 < L15_186 then
      L12_183 = L12_183 - (L15_186 - L10_181)
    end
    L1_172:setProperty("Top", L12_183)
    L1_172:setProperty("Left", L16_187)
  end
end
function ShopBuyWidget.openSubWidget(A0_188, A1_189)
  local L2_190, L3_191, L4_192, L5_193, L6_194, L7_195, L8_196, L9_197, L10_198, L11_199, L12_200, L13_201
  L3_191 = A0_188
  L2_190 = A0_188.getChildWidgetByWindowName
  L4_192 = "ItemSubWidget"
  L2_190 = L2_190(L3_191, L4_192)
  if L2_190 ~= nil then
    L4_192 = L2_190
    L3_191 = L2_190.setContent
    L5_193 = "Button_Trash"
    L6_194 = 3401
    L3_191(L4_192, L5_193, L6_194)
    L3_191 = 0
    L4_192 = 0
    L5_193 = 0
    L6_194 = 0
    L7_195 = 0
    L8_196 = 0
    L9_197 = 0
    L10_198 = 0
    L11_199 = 0
    L12_200 = 2
    L13_201 = A0_188.setSubPosition
    L13_201(A0_188)
    L13_201 = A0_188.getListPropertyName
    L13_201 = L13_201(A0_188, A0_188.work.listbox)
    if A0_188:getListProperty(L13_201, A0_188.work.index, "pricedata") > A0_188:countMoney(A0_188.work.money) then
      L10_198 = 1
    else
      L10_198 = 2
    end
    if A0_188:getListProperty(L13_201, A0_188.work.index, "mask") == 1 then
      L10_198 = 1
      worldMaster:notify(worldMaster, 25089)
    end
    L2_190:setSubMenuVisibility("Button_BazaarAbort", L3_191)
    L2_190:setSubMenuVisibility("Button_BazaarSell", L4_192)
    L2_190:setSubMenuVisibility("Button_BazaarBuy", L5_193)
    L2_190:setSubMenuVisibility("Button_BazaarRepair", L6_194)
    L2_190:setSubMenuVisibility("Button_Repair", L7_195)
    L2_190:setSubMenuVisibility("Button_DropItemGetAll", L8_196)
    L2_190:setSubMenuVisibility("Button_DropItemGiveAll", L9_197)
    L2_190:setSubMenuVisibility("Button_Trash", L10_198)
    L2_190:setSubMenuVisibility("Button_Sort", L11_199)
    L2_190:setSubMenuVisibility("Button_Cancel", L12_200)
    L2_190:setModal(true)
    L2_190:show()
    if A0_188.work.lastsub == 1 and L3_191 == 2 then
      L2_190:setWindowFocus("Button_BazaarAbort")
    elseif A0_188.work.lastsub == 2 and L4_192 == 2 then
      L2_190:setWindowFocus("Button_BazaarSell")
    elseif A0_188.work.lastsub == 3 and L5_193 == 2 then
      L2_190:setWindowFocus("Button_BazaarBuy")
    elseif A0_188.work.lastsub == 4 and L6_194 == 2 then
      L2_190:setWindowFocus("Button_BazaarRepair")
    elseif A0_188.work.lastsub == 5 and L7_195 == 2 then
      L2_190:setWindowFocus("Button_Repair")
    elseif A0_188.work.lastsub == 6 and L8_196 == 2 then
      L2_190:setWindowFocus("Button_DropItemGetAll")
    elseif A0_188.work.lastsub == 7 and L9_197 == 2 then
      L2_190:setWindowFocus("Button_DropItemGiveAll")
    elseif A0_188.work.lastsub == 8 and L10_198 == 2 then
      L2_190:setWindowFocus("Button_Trash")
    elseif A0_188.work.lastsub == 9 and L11_199 == 2 then
      L2_190:setWindowFocus("Button_Sort")
    else
      L2_190:setWindowFocus("Button_Cancel")
    end
    A0_188.work.submenu = true
  end
end
function ShopBuyWidget.closeSubWidget(A0_202)
  if A0_202:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
    A0_202:getChildWidgetByWindowName("ItemSubWidget"):hide()
    A0_202.work.submenu = false
  end
  A0_202:updateWindowDisplay(true)
end
function ShopBuyWidget.updatePlayerItem(A0_203, A1_204, A2_205)
  local L3_206
  L3_206 = -1
  if A1_204 == 0 then
    A0_203.work.updatecount = A2_205
    return
  else
  end
  if 0 < A0_203.work.updatecount then
    A0_203.work.updatecount = A0_203.work.updatecount - 1
  end
  if A0_203.work.updatecount == 0 then
    A0_203:displayBagcapacityAndMoney()
    if A1_204 == 100 and A0_203:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
      A0_203:getChildWidgetByWindowName("ShopEditWidget"):updateMoney(A0_203:countMoney(A0_203.work.money))
    end
  end
  return
end
function ShopBuyWidget.setShopEditData(A0_207, A1_208, A2_209)
  local L3_210
  L3_210 = A0_207.work
  L3_210.chosenOperation = A1_208
  L3_210 = A0_207.work
  L3_210.buycount = A2_209
end
function ShopBuyWidget.closeShopEdit(A0_211, A1_212)
  if A1_212 == nil then
    if A0_211.work.chosenOperation == 1 then
      A0_211:setBaseAskResult(1)
      A0_211.work.lastbuy = A0_211.work.focus
    else
      A0_211.work.editWidgetOpen = 0
    end
  end
  A0_211:updateWindowDisplay(true)
  A0_211.work.chosenOperation = 0
  A0_211:selectedBorder()
  if A0_211:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
    desktopWidget:closeChildWidget("ShopEditWidget", A0_211)
  end
end
function ShopBuyWidget.getItemContent(A0_213, A1_214, A2_215, A3_216)
  local L4_217
  if A1_214 == nil then
    L4_217 = A0_213.getControlProperty
    return L4_217(A0_213, A2_215, A3_216)
  else
    L4_217 = A0_213.getListPropertyName
    L4_217 = L4_217(A0_213, 1)
    return A0_213:getListProperty(L4_217, A0_213.work.index, A2_215, A3_216)
  end
end
function ShopBuyWidget.getAskResult(A0_218)
  if A0_218:getBaseAskResult() == -1 then
    return 0, 0
  else
    A0_218.work.askstatus = false
    return A0_218.work.index + 1, A0_218.work.buycount
  end
end
function ShopBuyWidget.setAskParameter(A0_219)
  if A0_219.work.editWidgetOpen == 0 then
    return
  end
  A0_219.work.editWidgetOpen = 0
  A0_219.work.askstatus = true
  A0_219:updateWindowDisplay(true)
end
function ShopBuyWidget.setItemMask(A0_220, A1_221, A2_222)
  local L3_223
  L3_223 = A0_220.getListBoxItemNum
  L3_223 = L3_223(A0_220, 1)
  if A1_221 > L3_223 then
    L3_223 = false
    return L3_223
  else
    L3_223 = A0_220.getListPropertyName
    L3_223 = L3_223(A0_220, 1)
    if A2_222 == true then
      A0_220:setListProperty(L3_223, A1_221 - 1, "mask", 1)
      A0_220:setListProperty(L3_223, A1_221 - 1, "nameStyle", "TBL_selectedItem")
      A0_220:setListProperty(L3_223, A1_221 - 1, "opacity", "0.5")
    else
      A0_220:setListProperty(L3_223, A1_221 - 1, "mask", 0)
      A0_220:setListProperty(L3_223, A1_221 - 1, "nameStyle", "TBL_null")
      A0_220:setListProperty(L3_223, A1_221 - 1, "opacity", "1.0")
    end
    A0_220:updateListProperty(L3_223)
  end
end
function ShopBuyWidget.getAskWaitStatus(A0_224)
  return A0_224.work.askstatus
end
