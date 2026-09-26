require("/Widget/WidgetBaseClass")
_defineClass("BazaarListWidget", "WidgetBaseClass")
function BazaarListWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function BazaarListWidget.init(A0_2, A1_3)
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
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L2_4.chosenItem = 0
  L2_4.chosenOperation = 0
  L2_4.updatecount = 0
  L2_4.updatecountbaz = 0
  L2_4.bonus1 = false
  L2_4.bonus2 = false
  L2_4.bonus3 = false
  L2_4.itemlife = false
  L2_4.bazaar = false
  L2_4.closeok = false
  L2_4.demandSync = false
  L2_4.sorttype = 0
  L2_4.lastsub = 10
  L2_4.bazaaritemget = false
  L2_4.demandSync = false
  L2_4.waitupdate = false
  L2_4.focus = 0
  L2_4.error = false
  L2_4.selected = -1
  L2_4(L3_5)
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
  L5_7 = ""
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = "@"
  L6_8 = tostring
  L6_8 = L6_8(3134)
  L5_7 = L5_7 .. L6_8
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = 3134
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  if L3_5 == false then
    L3_5.error = true
  else
    L5_7 = 8
    if L3_5 ~= false and L3_5 ~= nil then
      L4_6.bazaarCapacity = L3_5
    end
  end
  L5_7 = 3
  L5_7 = A0_2
  L6_8 = L3_5
  L4_6(L5_7, L6_8, "SourceFirstIndex", 0)
  L5_7 = A0_2
  L6_8 = L3_5
  L4_6(L5_7, L6_8, "SourceCount", A0_2.work.bazaarCapacity)
  L5_7 = A0_2
  L6_8 = A0_2.getListPropertyName
  L6_8 = L6_8(A0_2, 3)
  L4_6(L5_7, L6_8, "FilteredSortKey", "sorttype")
  L6_8 = L2_4
  L5_7 = L2_4._getItemPackageCapacity
  L5_7 = L5_7(L6_8, 1)
  L4_6.myBagCapacity = L5_7
  L6_8 = L2_4
  L5_7 = L2_4._getItemPackageCapacity
  L5_7 = L5_7(L6_8, 100)
  L4_6.myCrystalCapacity = L5_7
  L5_7 = A0_2
  L4_6(L5_7)
  L5_7 = A0_2
  L6_8 = "TextBlock_ActorName"
  L4_6(L5_7, L6_8, 1, 75303)
  L5_7 = A0_2
  L6_8 = "TabItem_3"
  L4_6(L5_7, L6_8, 1, 75304)
  if L4_6 == false then
    L5_7 = A0_2
    L4_6(L5_7)
  end
end
function BazaarListWidget.setInitialData(A0_9)
  local L1_10
  L1_10 = A0_9.resetListBox
  L1_10(A0_9, 1)
  L1_10 = A0_9.resetListBox
  L1_10(A0_9, 2)
  L1_10 = A0_9.resetListBox
  L1_10(A0_9, 3)
  L1_10 = A0_9.resetListBox
  L1_10(A0_9, 4)
  L1_10 = A0_9.resetListBox
  L1_10(A0_9, 5)
  L1_10 = desktopWidget
  L1_10 = L1_10.getBazaarActorName
  L1_10 = L1_10(L1_10)
  if L1_10 ~= nil then
    A0_9:setText("TextBlock_ActorName", 230, L1_10)
  end
  A0_9:displayHelp(3140)
  A0_9:setVisibility(A0_9:getListBoxName(3), false)
  A0_9:setVisibility("TextBlock_NoContents_3", true)
  A0_9:setText("TextBlock_NoContents_3", 3147)
  A0_9:initTargetItem()
  A0_9.work.listbox = 3
  A0_9:setSelectedIndex("TabControl_ItemList", 2)
  A0_9:setGridVisibility(8)
  A0_9.work.mode = 322
  A0_9.work.lastBazaarMode = 322
  A0_9:updateWindowDisplay(true)
end
function BazaarListWidget.processBeforeShow(A0_11, A1_12)
  if A1_12 ~= true then
    if A0_11.work.error == true or desktopWidget:isValidBazaarActor() == false then
      return desktopWidget:closeWidgetDirect(A0_11)
    end
  elseif A0_11.work.submenu == true or A0_11.work.editWidgetOpen > 0 then
    if A0_11.work.editWidgetOpen == 2 then
      A0_11:closeBazaarEdit()
    elseif A0_11.work.editWidgetOpen == 5 then
      A0_11:closeOrderItem()
    elseif A0_11.work.submenu == true then
      A0_11:closeSubWidget()
    end
  else
    A0_11:updateWindowDisplay(true)
  end
  return true
end
function BazaarListWidget.getListPropertyName(A0_13, A1_14)
  local L2_15
  if A1_14 == 1 then
    L2_15 = "TabItem_1_Maker"
    return L2_15
  elseif A1_14 == 2 then
    L2_15 = "TabItem_2_Maker"
    return L2_15
  elseif A1_14 == 3 then
    L2_15 = "TabItem_3_Maker"
    return L2_15
  elseif A1_14 == 4 then
    L2_15 = "TabItem_4_Maker"
    return L2_15
  elseif A1_14 == 5 then
    L2_15 = "TabItem_5_Maker"
    return L2_15
  end
end
function BazaarListWidget.updateWindowDisplay(A0_16, A1_17)
  A0_16:setGridVisibility(8)
  if A0_16.work.isMateriaList then
    A0_16:setVisibility("Grid_MateriaEquipList", true)
    A0_16:setVisibility("Grid_TabList", false)
  else
  end
  if A0_16.work.listbox == 1 then
    A0_16:setVisibility("Button_SortStatus", true)
    if A0_16.work.sorttype == 0 then
      A0_16:setContent("Button_SortStatus", 3186)
      A0_16:setControlProperty("Button_SortStatus", "Foreground", "#ffe57a45")
      A0_16:setHelpParameter("Button_SortStatus", 1, 73916, nil, nil, nil)
    else
      if A0_16.work.sorttype == 1 then
        A0_16:setContent("Button_SortStatus", 3177)
      else
        A0_16:setContent("Button_SortStatus", 3178)
      end
      A0_16:setControlProperty("Button_SortStatus", "Foreground", "#ff99ffb3")
      A0_16:setHelpParameter("Button_SortStatus", 1, 73915, nil, nil, nil)
    end
  else
    A0_16:setVisibility("Button_SortStatus", false)
  end
  if A1_17 == true then
    A0_16:updateListFocus()
  end
end
function BazaarListWidget.updateListFocus(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
  L1_19 = A0_18.work
  L1_19 = L1_19.updatecountbaz
  if L1_19 ~= 0 then
    L1_19 = false
    return L1_19
  end
  L2_20 = A0_18
  L1_19 = A0_18.getListBoxFocusNum
  L3_21 = A0_18.work
  L3_21 = L3_21.listbox
  L4_22 = L1_19(L2_20, L3_21)
  L6_24 = A0_18
  L5_23 = A0_18.getListBoxName
  L5_23 = L5_23(L6_24, A0_18.work.listbox)
  L6_24 = "TextBlock_NoContents_3"
  if L1_19 < 1 then
    A0_18:closeMateriaList()
    if A0_18.work.editWidgetOpen == 2 then
      A0_18:closeBazaarEdit()
    end
    if A0_18.work.editWidgetOpen == 5 then
      A0_18:closeOrderItem()
    end
    if A0_18.work.submenu == true and A0_18:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
      A0_18:getChildWidgetByWindowName("ItemSubWidget"):hide()
      A0_18.work.submenu = false
    end
    A0_18:displayFocusedItemHelp()
    A0_18:initTargetItem()
    A0_18:setVisibility(L6_24, true)
    A0_18:setVisibility(L5_23, false)
    A0_18:setWindowFocus(L6_24)
  else
    if not A0_18.work.isMateriaList then
      A0_18:setVisibility(L5_23, true)
    end
    A0_18:setVisibility(L6_24, false)
    if A0_18.work.focus > L1_19 - 1 then
      A0_18.work.focus = L1_19 - 1
    end
    if 0 <= A0_18:focusToIndex(A0_18.work.listbox, A0_18.work.focus) then
      A0_18.work.index = A0_18:focusToIndex(A0_18.work.listbox, A0_18.work.focus)
    end
    A0_18:setFocusedIndex(L5_23, A0_18.work.focus)
    if not A0_18.work.isMateriaList then
      A0_18:setWindowFocus(L5_23)
    end
    A0_18:displayFocusedItemHelp()
    if A0_18:isSameItem() == false then
      A0_18:closeMateriaList()
      A0_18:setWindowFocus(L5_23)
      if A0_18.work.editWidgetOpen == 2 then
        A0_18:closeBazaarEdit()
      end
      if A0_18.work.editWidgetOpen == 5 then
        A0_18:closeOrderItem()
      end
      if A0_18:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
        A0_18:getChildWidgetByWindowName("ItemSubWidget"):hide()
        A0_18.work.submenu = false
      end
    end
  end
end
function BazaarListWidget.setGridVisibility(A0_25, A1_26)
  A0_25:setVisibility("Grid_TabList", true)
  A0_25:setVisibility("Grid_ActorName", true)
  A0_25:setVisibility("Grid_Help", A1_26 == 1)
  A0_25:setVisibility("Grid_BackpackAndGil", true)
  A0_25:setVisibility("Grid_ItemNameBase", A1_26 == 8 or A1_26 == 9 or A1_26 == 10)
  A0_25:setVisibility("Grid_ItemDetail1", A0_25.work.bonus1)
  A0_25:setVisibility("Grid_ItemDetail2", A0_25.work.bonus2)
  A0_25:setVisibility("Grid_ItemDetail3", A0_25.work.bonus3 or A0_25.work.itemlife or A0_25.work.bazaar)
  A0_25:setVisibility("Label_ItemBonus5", A0_25.work.bonus3)
  A0_25:setVisibility("Grid_ItemLife", A0_25.work.itemlife)
  A0_25:setVisibility("Grid_ItemBazaarInformation", A0_25.work.bazaar)
  A0_25:setVisibility("Grid_MateriaAttachBazaarInformation", false)
end
function BazaarListWidget.setWindowFocus(A0_27, A1_28)
  if A1_28 ~= nil and A1_28 ~= "" then
    A0_27:setLogicalFocus(A1_28)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_27 then
      A0_27:setKeyboardFocusedControl(A1_28)
    end
  end
end
function BazaarListWidget.displayBagcapacityAndMoney(A0_29)
  local L1_30, L2_31, L3_32
  L1_30 = worldMaster
  L2_31 = L1_30
  L1_30 = L1_30._getMyPlayer
  L1_30 = L1_30(L2_31)
  L3_32 = L1_30
  L2_31 = L1_30.getMoneyOnHand
  L2_31 = L2_31(L3_32)
  L3_32 = A0_29.setText
  L3_32(A0_29, "TextBlock_Gil", 3263, L2_31)
  L3_32 = A0_29.work
  L3_32 = L3_32.myBagCapacity
  A0_29:setText("TextBlock_ItemStack_2", 3551, L3_32 - L1_30:_getItemPackageFreeSpace(1), L3_32)
end
function BazaarListWidget.isExistItem(A0_33, A1_34, A2_35, A3_36)
  if A3_36 == nil or A3_36 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_34, A2_35) ~= nil then
      return true
    else
      return false
    end
  elseif A3_36 == 2 then
    if desktopWidget:getBazaarItem(A1_34, A2_35) ~= nil then
      return true
    else
      return false
    end
  end
end
function BazaarListWidget.checkPackageAndIndex(A0_37, A1_38, A2_39, A3_40, A4_41)
  if A4_41 == nil or A4_41 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A2_39, A3_40) == A1_38 then
      return true
    else
      return false
    end
  elseif A4_41 == 2 then
    if desktopWidget:getBazaarItem(A2_39, A3_40) == A1_38 then
      return true
    else
      return false
    end
  end
end
function BazaarListWidget.getSelectedTab(A0_42)
  return A0_42:getSelectedIndex("TabControl_ItemList") + 1
end
function BazaarListWidget.getListBoxName(A0_43, A1_44)
  local L2_45
  if A1_44 == 1 then
    L2_45 = "ListBox_TabItem_1"
    return L2_45
  elseif A1_44 == 2 then
    L2_45 = "ListBox_TabItem_2"
    return L2_45
  elseif A1_44 == 3 then
    L2_45 = "ListBox_TabItem_3"
    return L2_45
  elseif A1_44 == 4 then
    L2_45 = "ListBox_TabItem_4"
    return L2_45
  elseif A1_44 == 5 then
    L2_45 = "ListBox_TabItem_5"
    return L2_45
  else
    L2_45 = ""
    return L2_45
  end
end
function BazaarListWidget.getListBoxItemNum(A0_46, A1_47)
  local L2_48, L3_49
  L3_49 = A0_46
  L2_48 = A0_46.getListPropertyCount
  return L2_48(L3_49, A0_46:getListPropertyName(A1_47))
end
function BazaarListWidget.getListBoxFocusNum(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55
  L3_53 = A0_50
  L2_52 = A0_50.getListBoxItemNum
  L4_54 = A1_51
  L2_52 = L2_52(L3_53, L4_54)
  L4_54 = A0_50
  L3_53 = A0_50.getListPropertyName
  L5_55 = A1_51
  L3_53 = L3_53(L4_54, L5_55)
  if L2_52 < 1 then
    L4_54 = 0
    L5_55 = 0
    return L4_54, L5_55, 0, 0
  end
  L5_55 = A0_50
  L4_54 = A0_50.getControlProperty
  L4_54 = L4_54(L5_55, L3_53, "FilteredCount")
  L5_55 = A0_50.work
  L5_55 = L5_55.focus
  if L4_54 < A0_50.work.focus then
    L5_55 = L4_54 - 1
  end
  return L4_54, L4_54 - 1, 0, L5_55
end
function BazaarListWidget.focusToIndex(A0_56, A1_57, A2_58)
  local L3_59
  L3_59 = A0_56.getListPropertyName
  L3_59 = L3_59(A0_56, A1_57)
  if A0_56:getListBoxFocusNum(A1_57) < 1 or A2_58 >= A0_56:getListBoxFocusNum(A1_57) then
    return -1
  else
    A0_56:setControlProperty(L3_59, "FilteredIndex", A2_58)
    return A0_56:getControlProperty(L3_59, "Index")
  end
end
function BazaarListWidget.indexToFocus(A0_60, A1_61, A2_62)
  local L3_63, L4_64
  L3_63 = -1
  L4_64 = A0_60.getListPropertyName
  L4_64 = L4_64(A0_60, A1_61)
  if A0_60:getListBoxFocusNum(A1_61) > 0 then
    A0_60:setControlProperty(L4_64, "Index", A2_62)
    L3_63 = A0_60:getControlProperty(L4_64, "FilteredIndex")
  end
  A0_60:setControlProperty(L4_64, "Index", A0_60.work.index)
  return L3_63
end
function BazaarListWidget.initListBox(A0_65, A1_66)
  local L2_67, L3_68
  L3_68 = A0_65
  L2_67 = A0_65.getListBoxName
  L2_67 = L2_67(L3_68, A1_66)
  if L2_67 ~= "" then
    L3_68 = A0_65.setControlProperty
    L3_68(A0_65, L2_67, "IntData.Value0", A1_66)
    L3_68 = A0_65.setControlCommandCondition
    L3_68(A0_65, L2_67, "UILuaCommands.MouseEnteredItem")
    L3_68 = A0_65.setControlCommandCondition
    L3_68(A0_65, L2_67, "UILuaCommands.AnchoredItem")
    L3_68 = A0_65.setControlCommandCondition
    L3_68(A0_65, L2_67, "UILuaCommands.Selection")
    L3_68 = A0_65.setCancelCondition
    L3_68(A0_65, L2_67)
    L3_68 = A0_65.setVisibility
    L3_68(A0_65, L2_67, true)
    L3_68 = "TextBlock_NoContents_"
    L3_68 = L3_68 .. tostring(A1_66)
    A0_65:setVisibility(L3_68, false)
    A0_65:setCancelCondition(L3_68)
    A0_65:setControlProperty(L3_68, "IsTabStop", true)
    A0_65:setControlCommandCondition(L2_67, "UILuaCommands.Previous")
    A0_65:setControlCommandCondition(L2_67, "UILuaCommands.Next")
  end
end
function BazaarListWidget.resetListBox(A0_69, A1_70)
  local L2_71, L3_72
  L3_72 = A0_69
  L2_71 = A0_69.getListBoxItemNum
  L2_71 = L2_71(L3_72, A1_70)
  L3_72 = A0_69.getListPropertyName
  L3_72 = L3_72(A0_69, A1_70)
  if L2_71 < 1 then
    return
  else
    for _FORV_7_ = 1, L2_71 do
      L2_71 = L2_71 - 1
      A0_69:deleteListProperty(L3_72, L2_71)
    end
    A0_69:updateListProperty(L3_72)
  end
end
function BazaarListWidget.setItemToXmlLight(A0_73, A1_74, A2_75, A3_76, A4_77, A5_78)
  local L6_79, L7_80, L8_81, L9_82, L10_83, L11_84, L12_85, L13_86, L14_87, L15_88, L16_89, L17_90, L18_91, L19_92, L20_93
  L7_80 = A0_73
  L6_79 = A0_73.getListPropertyName
  L8_81 = A1_74
  L7_80 = L6_79(L7_80, L8_81)
  L8_81, L9_82, L10_83, L11_84 = nil, nil, nil, nil
  L12_85 = worldMaster
  L13_86 = L12_85
  L12_85 = L12_85._getMyPlayer
  L12_85 = L12_85(L13_86)
  L13_86, L14_87 = nil, nil
  if A3_76 > 0 and A4_77 > 0 then
    L15_88 = desktopWidget
    L16_89 = L15_88
    L15_88 = L15_88.getBazaarItem
    L17_90 = A3_76
    L18_91 = A4_77
    L15_88 = L15_88(L16_89, L17_90, L18_91)
    L13_86 = L15_88
  end
  if L13_86 ~= nil then
    L16_89 = L13_86
    L15_88 = L13_86._isAlive
    L15_88 = L15_88(L16_89)
  elseif L15_88 == false then
    L15_88 = false
    return L15_88
  end
  L16_89 = L13_86
  L15_88 = L13_86._getCatalogID
  L15_88 = L15_88(L16_89)
  L8_81 = L15_88
  L16_89 = L13_86
  L15_88 = L13_86.getItemIcon
  L15_88 = L15_88(L16_89)
  L9_82 = L15_88
  L16_89 = L13_86
  L15_88 = L13_86._isStackable
  L15_88 = L15_88(L16_89)
  L10_83 = L15_88
  L16_89 = L13_86
  L15_88 = L13_86._countStack
  L15_88 = L15_88(L16_89)
  L11_84 = L15_88
  L16_89 = L13_86
  L15_88 = L13_86._getNameIndex
  L15_88 = L15_88(L16_89)
  L16_89 = "TBL_null"
  L17_90 = 0
  L18_91 = 3
  L19_92 = false
  L20_93 = A0_73.work
  L20_93 = L20_93.selected
  if L20_93 == A2_75 then
    L19_92 = true
  end
  L20_93 = desktopWidget
  L20_93 = L20_93.setItemToXml
  L20_93(L20_93, A0_73, L6_79, A2_75, L13_86, L16_89, L8_81, L9_82, L10_83, L11_84, L15_88, L17_90, true, false, L18_91, A3_76, A4_77, A5_78, L19_92)
  L20_93 = desktopWidget
  L20_93 = L20_93.setItemDetailToXml
  L20_93(L20_93, A0_73, L6_79, A2_75, L13_86, L15_88, A5_78, L18_91, true)
  L20_93 = true
  if desktopWidget:getBazaarItemDealData(A3_76, A4_77) == 20 or desktopWidget:getBazaarItemDealData(A3_76, A4_77) == 30 then
    L20_93 = false
  elseif 0 < desktopWidget:getBazaarItemDealData(A3_76, A4_77) then
  elseif desktopWidget:isBazaarItemAttached(A3_76, A4_77) == true then
  else
    L20_93 = false
  end
  A0_73:setListPropertyVisibility(L6_79, A2_75, L20_93)
  return true
end
function BazaarListWidget.getMoneyListIndex(A0_94, A1_95)
  local L2_96, L3_97
  L2_96 = 1
  if A1_95 == 1000001 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000102 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000101 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000103 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000107 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000106 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000104 then
    L3_97 = -1
    return L3_97
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000108 then
    L3_97 = -1
    return L3_97
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000109 then
    L3_97 = -1
    return L3_97
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000105 then
    L3_97 = -1
    return L3_97
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000111 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000110 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000112 then
    L3_97 = -1
    return L3_97
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000113 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000114 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000115 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000116 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000117 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000118 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000119 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000120 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000121 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000122 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  if A1_95 == 1000123 then
    return L2_96
  else
    L2_96 = L2_96 + 1
  end
  L3_97 = -1
  return L3_97
end
function BazaarListWidget.setSortType(A0_98, A1_99, A2_100, A3_101, A4_102)
  local L5_103
  L5_103 = desktopWidget
  L5_103 = L5_103.getBazaarItem
  L5_103 = L5_103(L5_103, 8, A2_100 + 1)
  if L5_103 == nil or L5_103:_isAlive() == false then
    return
  end
  desktopWidget:setSortType(A0_98, A1_99, A2_100, A0_98.work.sorttype, L5_103)
end
function BazaarListWidget.updateSortType(A0_104)
  local L1_105
  L1_105 = A0_104.getListPropertyName
  L1_105 = L1_105(A0_104, 1)
  for _FORV_5_ = 1, A0_104:getListBoxItemNum(1) do
    A0_104:setSortType(L1_105, _FORV_5_ - 1)
  end
  A0_104:updateListProperty(L1_105)
end
function BazaarListWidget.setBazaarLabelVisibility(A0_106, A1_107, A2_108, A3_109)
  local L4_110
  if A3_109 == 1 then
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "bazaarStatus", 378)
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "priceStyle", "TBL_parameterPlus")
  elseif A3_109 == 7 then
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "bazaarStatus", 453)
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "priceStyle", "TBL_parameterPlus")
    L4_110 = A0_106.getListProperty
    L4_110 = L4_110(A0_106, A1_107, A2_108, "stackCount")
    if A0_106:getListProperty(A1_107, A2_108, "stackable") == 1 then
      A0_106:setListProperty(A1_107, A2_108, "stack", "(" .. tostring(L4_110) .. ")")
    end
  elseif A3_109 == 2 then
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "bazaarStatus", 379)
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "priceStyle", "TBL_parameterMinus")
    L4_110 = A0_106.getListProperty
    L4_110 = L4_110(A0_106, A1_107, A2_108, "stackCount")
    if A0_106:getListProperty(A1_107, A2_108, "stackable") == 1 then
      A0_106:setListProperty(A1_107, A2_108, "stack", "(" .. tostring(L4_110) .. ")")
    end
  elseif A3_109 == 3 then
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "bazaarStatus", 380)
    L4_110 = A0_106.setListProperty
    L4_110(A0_106, A1_107, A2_108, "priceStyle", "TBL_guildleveBonus")
  end
end
function BazaarListWidget.updateBazaarLabel(A0_111, A1_112, A2_113)
  local L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130, L20_131
  L11_122 = A0_111
  L10_121 = A0_111.getListPropertyName
  L12_123 = A1_112
  L10_121 = L10_121(L11_122, L12_123)
  L11_122, L12_123 = nil, nil
  L13_124 = 1
  L14_125 = A0_111.getListBoxItemNum
  L14_125 = L14_125(L15_126, L16_127)
  for L18_129 = L13_124 - 1, L14_125 - 1 do
    L11_122 = 8
    L12_123 = L18_129 + 1
    L20_131 = A0_111
    L19_130 = A0_111.isExistItem
    L19_130 = L19_130(L20_131, L11_122, L12_123, A2_113)
    if L19_130 == false then
      break
    end
    L3_114 = 0
    L19_130 = false
    if A2_113 == nil or A2_113 == 1 then
      L20_131 = desktopWidget
      L20_131 = L20_131.isDealingItem
      L20_131 = L20_131(L20_131, L11_122, L12_123)
      L19_130 = L20_131
    elseif A2_113 == 2 then
      L20_131 = desktopWidget
      L20_131 = L20_131.isBazaarDealingItem
      L20_131 = L20_131(L20_131, L11_122, L12_123)
      L19_130 = L20_131
    end
    if L19_130 == true then
      if A2_113 == nil or A2_113 == 1 then
        L20_131 = desktopWidget
        L20_131 = L20_131.getItemDealData
        L5_116, L6_117, L20_131 = L20_131, L11_122, L20_131(L20_131, L11_122, L12_123)
        L4_115 = L20_131
      elseif A2_113 == 2 then
        L20_131 = desktopWidget
        L20_131 = L20_131.getBazaarItemDealData
        L5_116, L6_117, L20_131 = L20_131, L11_122, L20_131(L20_131, L11_122, L12_123)
        L4_115 = L20_131
      end
      L20_131 = A0_111.setListProperty
      L20_131(A0_111, L10_121, L18_129, "bazaarkind", L4_115)
      if L4_115 == 11 then
        L3_114 = 1
      elseif L4_115 == 12 then
        L3_114 = 1
      elseif L4_115 == 13 then
        L3_114 = 7
      elseif L4_115 == 20 then
        L3_114 = 4
      elseif L4_115 == 30 then
        L3_114 = 4
      end
      if L3_114 ~= 4 then
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "rewardprice", L5_116)
        L20_131 = A0_111.setListText
        L20_131(A0_111, L10_121, L18_129, "price", 225, L5_116)
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "rewardpackage", 0)
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "rewarditem", 0)
        L20_131 = A0_111.setListPropertyVisibility
        L20_131(A0_111, L10_121, L18_129, true)
      else
        L20_131 = A0_111.setListPropertyVisibility
        L20_131(A0_111, L10_121, L18_129, false)
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "nameStyle", "TBL_selectedItem")
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "opacity", "0.5")
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "rewardprice", 0)
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "rewardpackage", 0)
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "rewarditem", 0)
        L20_131 = A0_111.setListProperty
        L20_131(A0_111, L10_121, L18_129, "price", "")
      end
    else
      L20_131 = false
      if A2_113 == nil or A2_113 == 1 then
        L20_131 = desktopWidget:isPlayerItemAttached(L11_122, L12_123)
      elseif A2_113 == 2 then
        L20_131 = desktopWidget:isBazaarItemAttached(L11_122, L12_123)
      end
      if L20_131 == true then
        L4_115, L7_118, L8_119, L9_120 = A0_111:checkRewardDependency(L11_122, L12_123, A2_113)
        if L4_115 ~= 0 then
          if L4_115 == 20 then
            L3_114 = 2
          elseif L4_115 == 30 then
            L3_114 = 3
          end
          if L9_120 ~= 0 then
            A0_111:setListText(L10_121, L18_129, "price", 225, L9_120)
          else
            A0_111:setListText(L10_121, L18_129, "price", 3144)
          end
          A0_111:setListProperty(L10_121, L18_129, "rewardpackage", L7_118)
          A0_111:setListProperty(L10_121, L18_129, "rewarditem", L8_119)
        else
          A0_111:setListProperty(L10_121, L18_129, "rewardpackage", 0)
          A0_111:setListProperty(L10_121, L18_129, "rewarditem", 0)
          A0_111:setListProperty(L10_121, L18_129, "price", "")
        end
      else
        A0_111:setListProperty(L10_121, L18_129, "rewardpackage", 0)
        A0_111:setListProperty(L10_121, L18_129, "rewarditem", 0)
        A0_111:setListProperty(L10_121, L18_129, "price", "")
      end
      A0_111:setListProperty(L10_121, L18_129, "rewardprice", 0)
      A0_111:setListProperty(L10_121, L18_129, "bazaarkind", 0)
      A0_111:setListPropertyVisibility(L10_121, L18_129, true)
    end
    L20_131 = A0_111.setBazaarLabelVisibility
    L20_131(A0_111, L10_121, L18_129, L3_114)
  end
  L15_126(L16_127, L17_128)
end
function BazaarListWidget.checkRewardDependency(A0_132, A1_133, A2_134, A3_135)
  local L4_136, L5_137, L6_138, L7_139, L8_140, L9_141, L10_142, L11_143, L12_144, L13_145
  if A1_133 == 0 or A2_134 == 0 or A1_133 == false or A2_134 == false then
    L4_136 = 0
    L5_137 = 0
    L6_138 = 0
    L7_139 = 0
    return L4_136, L5_137, L6_138, L7_139
  end
  L4_136 = 0
  L5_137 = 0
  L6_138 = nil
  L7_139 = 0
  if A3_135 == nil or A3_135 == 1 then
    L8_140 = worldMaster
    L8_140 = L8_140._getMyPlayer
    L8_140 = L8_140(L9_141)
    L13_145 = 8
    for L13_145 = 1, L11_143(L12_144, L13_145) do
      if A0_132:isExistItem(8, L13_145) == false then
        break
      elseif desktopWidget:isDealingItem(8, L13_145) == true then
        L4_136, L5_137, L6_138 = desktopWidget:getItemDealData(8, L13_145)
        if L6_138 == L9_141 then
          if L8_140:_getItem(8, L13_145):_getCatalogID() == 1000001 then
            L7_139 = L8_140:_getItem(8, L13_145):_countStack()
          end
          return L4_136, 8, L13_145, L7_139
        end
      end
    end
    L13_145 = 0
    return L10_142, L11_143, L12_144, L13_145
  elseif A3_135 == 2 then
    L8_140 = desktopWidget
    L8_140 = L8_140.getBazaarItem
    L8_140 = L8_140(L9_141, L10_142, L11_143)
    for L12_144 = 1, L10_142.bazaarCapacity do
      L13_145 = A0_132.isExistItem
      L13_145 = L13_145(A0_132, 8, L12_144, A3_135)
      if L13_145 == false then
        break
      else
        L13_145 = desktopWidget
        L13_145 = L13_145.isBazaarDealingItem
        L13_145 = L13_145(L13_145, 8, L12_144)
        if L13_145 == true then
          L13_145 = desktopWidget
          L13_145 = L13_145.getBazaarItemDealData
          L5_137, L6_138, L13_145 = L13_145, 8, L13_145(L13_145, 8, L12_144)
          L4_136 = L13_145
          if L6_138 == L8_140 then
            L13_145 = desktopWidget
            L13_145 = L13_145.getBazaarItem
            L13_145 = L13_145(L13_145, 8, L12_144)
            if L13_145:_getCatalogID() == 1000001 then
              L7_139 = L13_145:_countStack()
            end
            return L4_136, 8, L12_144, L7_139
          end
        end
      end
    end
    return L9_141, L10_142, L11_143, L12_144
  end
end
function BazaarListWidget.isRewardItemActor(A0_146, A1_147, A2_148, A3_149, A4_150, A5_151)
  if A1_147 == 0 or A2_148 == 0 or A3_149 == 0 or A4_150 == 0 or A1_147 == false or A2_148 == false or A3_149 == false or A4_150 == false then
    return false
  end
  if A5_151 == nil or A5_151 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_147, A2_148) == desktopWidget:getItemDealData(A3_149, A4_150) then
      return true
    else
      return false
    end
  elseif A5_151 == 2 then
    if desktopWidget:getBazaarItem(A1_147, A2_148) == desktopWidget:getBazaarItemDealData(A3_149, A4_150) then
      return true
    else
      return false
    end
  end
end
function BazaarListWidget.makeBazaarItemList(A0_152, A1_153, A2_154)
  local L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162
  L4_156 = A0_152
  L3_155 = A0_152.getListPropertyName
  L5_157 = 3
  L3_155 = L3_155(L4_156, L5_157)
  L4_156 = 0
  L5_157 = A0_152.work
  L5_157 = L5_157.bazaarCapacity
  if L5_157 == 0 then
    L5_157 = desktopWidget
    L6_158 = L5_157
    L5_157 = L5_157.getBazaarItemPackageCapacity
    L5_157 = L5_157(L6_158, L7_159)
    if L5_157 ~= false and L5_157 ~= nil then
      L6_158 = A0_152.work
      L6_158.bazaarCapacity = L5_157
    end
    L6_158 = A0_152.work
    L6_158 = L6_158.bazaarCapacity
    if L6_158 > 0 then
      L6_158 = A0_152._setProperty
      L10_162 = A0_152
      L10_162 = "SourceCount"
      L6_158(L7_159, L8_160, L9_161, L10_162, A0_152.work.bazaarCapacity)
    end
  end
  L5_157 = A0_152.work
  L4_156 = L5_157.bazaarCapacity
  if A2_154 == nil then
    L5_157 = 0
    L6_158 = A0_152.getListBoxItemNum
    L6_158 = L6_158(L7_159, L8_160)
    for L10_162 = 1, L4_156 do
      if A0_152:setItemToXmlLight(3, L5_157, 8, L10_162, 2) == true then
        L5_157 = L5_157 + 1
      else
        break
      end
    end
    if L6_158 > L5_157 then
      for L10_162 = L5_157, L6_158 - 1 do
        L6_158 = L6_158 - 1
        A0_152:deleteListProperty(L3_155, L6_158)
      end
    end
    if L5_157 > 0 then
      L10_162 = 2
      L7_159(L8_160, L9_161, L10_162)
    else
      L7_159(L8_160, L9_161)
    end
    L10_162 = ""
    L7_159(L8_160, L9_161, L10_162)
  else
    if A1_153 ~= 8 then
      return
    end
    L6_158 = A0_152
    L5_157 = A0_152.getListPropertyName
    L5_157 = L5_157(L6_158, L7_159)
    L6_158 = desktopWidget
    L6_158 = L6_158.getBazaarItem
    L6_158 = L6_158(L7_159, L8_160, L9_161)
    if L6_158 ~= nil then
      L6_158 = A0_152.setItemToXmlLight
      L10_162 = A1_153
      L6_158(L7_159, L8_160, L9_161, L10_162, A2_154, 2)
    else
      L6_158 = A0_152.getListBoxItemNum
      L6_158 = L6_158(L7_159, L8_160)
      if L7_159 >= 0 and A2_154 <= L6_158 then
        L10_162 = L6_158 - 1
        L7_159(L8_160, L9_161, L10_162)
        L7_159(L8_160, L9_161)
      end
    end
  end
end
function BazaarListWidget.makeListFromPackage(A0_163, A1_164, A2_165)
  A0_163:displayBagcapacityAndMoney()
end
function BazaarListWidget.checkMyPackage(A0_166, A1_167)
  local L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175, L10_176
  L2_168 = 0
  L4_170 = A1_167
  L3_169 = A1_167.getItemProperPackage
  L3_169 = L3_169(L4_170)
  L5_171 = A1_167
  L4_170 = A1_167._countStack
  L4_170 = L4_170(L5_171)
  L5_171 = worldMaster
  L6_172 = L5_171
  L5_171 = L5_171._getMyPlayer
  L5_171 = L5_171(L6_172)
  L6_172 = A0_166.work
  L6_172 = L6_172.myBagCapacity
  if L6_172 == 0 then
    L6_172 = worldMaster
    L6_172 = L6_172._getMyPlayer
    L6_172 = L6_172(L7_173)
    L10_176 = 1
    L7_173.myBagCapacity = L8_174
    L10_176 = 100
    L7_173.myCrystalCapacity = L8_174
  end
  L6_172 = A0_166.work
  L6_172 = L6_172.myBagCapacity
  if L3_169 == 100 then
    L6_172 = L7_173.myCrystalCapacity
  end
  for L10_176 = 1, L6_172 do
    if A0_166:canItemSell(L3_169, L10_176, A1_167) == true then
      return 1, L3_169, L10_176
    else
      L2_168 = L2_168 + A0_166:canItemSell(L3_169, L10_176, A1_167)
    end
  end
  if L4_170 <= L2_168 then
    return L7_173, L8_174, L9_175
  else
    return L7_173, L8_174, L9_175
  end
end
function BazaarListWidget.canItemSell(A0_177, A1_178, A2_179, A3_180)
  local L4_181, L5_182, L6_183
  L4_181 = worldMaster
  L5_182 = L4_181
  L4_181 = L4_181._getMyPlayer
  L4_181 = L4_181(L5_182)
  L6_183 = L4_181
  L5_182 = L4_181._getItem
  L5_182 = L5_182(L6_183, A1_178, A2_179)
  if L5_182 ~= nil then
    L6_183 = L5_182._isAlive
    L6_183 = L6_183(L5_182)
  elseif L6_183 == false then
    L6_183 = false
    return L6_183, 0
  end
  L6_183 = L5_182._getCatalogID
  L6_183 = L6_183(L5_182)
  if L6_183 ~= A3_180:_getCatalogID() then
    L6_183 = false
    return L6_183, 0
  end
  L6_183 = L5_182._getNameIndex
  L6_183 = L6_183(L5_182)
  if L6_183 ~= A3_180:_getNameIndex() then
    L6_183 = false
    return L6_183, 0
  end
  L6_183 = L5_182.isExclusiveItem
  L6_183 = L6_183(L5_182)
  if L6_183 then
    L6_183 = false
    return L6_183, 0
  end
  L6_183 = L5_182._isEquipping
  L6_183 = L6_183(L5_182)
  if L6_183 then
    L6_183 = false
    return L6_183, 0
  end
  L6_183 = L5_182._countStack
  L6_183 = L6_183(L5_182)
  if L6_183 < A3_180:_countStack() then
    return false, L6_183
  else
    return true, L6_183
  end
end
function BazaarListWidget.initTargetItem(A0_184)
  local L1_185, L2_186
  L1_185 = "WidgetInternal"
  L2_186 = 1
  A0_184:setListProperty(L1_185, L2_186, "itemIndex", 0)
  A0_184:setListProperty(L1_185, L2_186, "catalog", 0)
  A0_184:setListProperty(L1_185, L2_186, "quality", 0)
  A0_184:setListProperty(L1_185, L2_186, "rare", 0)
  A0_184:setListProperty(L1_185, L2_186, "ex", 0)
  A0_184:setListProperty(L1_185, L2_186, "stackCount", 0)
  A0_184:setListProperty(L1_185, L2_186, "stackMax", 0)
  A0_184:setListProperty(L1_185, L2_186, "stackable", 0)
  A0_184:setListProperty(L1_185, L2_186, "bazaarkind", 0)
  A0_184:setListProperty(L1_185, L2_186, "rewardprice", 0)
  A0_184:setListProperty(L1_185, L2_186, "rewardpackage", 0)
  A0_184:setListProperty(L1_185, L2_186, "rewarditem", 0)
  A0_184:updateListProperty(L1_185)
end
function BazaarListWidget.setItemToBackup(A0_187, A1_188, A2_189, A3_190)
  local L4_191, L5_192
  L4_191 = "WidgetInternal"
  L5_192 = A0_187.getListPropertyName
  L5_192 = L5_192(A0_187, A0_187.work.listbox)
  A0_187:setListProperty(L4_191, 1, A1_188, A0_187:getListProperty(L5_192, A0_187.work.index, A1_188))
  if A3_190 ~= nil then
    A0_187:updateListProperty(L4_191)
  end
end
function BazaarListWidget.compareItemToBackup(A0_193, A1_194, A2_195)
  local L3_196, L4_197, L5_198, L6_199, L7_200
  L3_196 = "WidgetInternal"
  L5_198 = A0_193
  L4_197 = A0_193.getListPropertyName
  L6_199 = A0_193.work
  L6_199 = L6_199.listbox
  L4_197 = L4_197(L5_198, L6_199)
  L5_198 = true
  L7_200 = A0_193
  L6_199 = A0_193.getListProperty
  L6_199 = L6_199(L7_200, L3_196, 1, A1_194)
  L7_200 = A0_193.getListProperty
  L7_200 = L7_200(A0_193, L4_197, A0_193.work.index, A1_194)
  if L6_199 ~= L7_200 then
    A0_193.work.compare = false
    L5_198 = false
  end
  return L6_199, L7_200
end
function BazaarListWidget.copyItem(A0_201)
  local L1_202, L2_203, L3_204, L4_205
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  for L4_205 = 1, 5 do
    A0_201:setItemToBackup("mtype" .. tostring(L4_205), "Int")
    A0_201:setItemToBackup("mgrade" .. tostring(L4_205), "Int")
  end
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205)
  L4_205 = "Int"
  L1_202(L2_203, L3_204, L4_205, true)
end
function BazaarListWidget.isSameItem(A0_206)
  local L1_207, L2_208, L3_209, L4_210, L5_211, L6_212
  L1_207 = A0_206.work
  L1_207.compare = true
  L1_207, L2_208 = nil, nil
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  for L6_212 = 1, 5 do
    L1_207, L2_208 = A0_206:compareItemToBackup("mtype" .. tostring(L6_212), "Int")
    L1_207, L2_208 = A0_206:compareItemToBackup("mgrade" .. tostring(L6_212), "Int")
  end
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  L6_212 = "Int"
  L2_208 = L4_210
  L1_207 = L3_209
  return L3_209
end
function BazaarListWidget.getItemBazaarData(A0_213, A1_214, A2_215, A3_216, A4_217, A5_218, A6_219)
  local L7_220, L8_221, L9_222, L10_223, L11_224, L12_225, L13_226, L14_227, L15_228, L16_229, L17_230, L18_231, L19_232, L20_233
  L7_220 = 0
  L8_221 = 0
  L9_222 = 0
  L10_223 = 0
  L11_224 = 0
  L12_225 = 0
  L13_226 = 0
  L14_227 = 0
  L15_228 = ""
  L16_229 = 0
  L17_230 = false
  L18_231 = 0
  L19_232 = false
  L20_233 = false
  if A1_214 ~= nil then
  else
    L7_220 = A0_213:getListProperty(A2_215, A3_216, "bazaarkind")
    L10_223 = A0_213:getListProperty(A2_215, A3_216, "rewardprice")
    L8_221 = A0_213:getListProperty(A2_215, A3_216, "rewardpackage")
    L9_222 = A0_213:getListProperty(A2_215, A3_216, "rewarditem")
    if L8_221 ~= 0 then
      L11_224 = A0_213:getListProperty(A2_215, L9_222 - 1, "bazaarkind")
      L12_225 = A0_213:getListProperty(A2_215, L9_222 - 1, "catalog")
      L13_226 = A0_213:getListProperty(A2_215, L9_222 - 1, "icon")
      L14_227 = A0_213:getListProperty(A2_215, L9_222 - 1, "stackCount")
      L15_228 = A0_213:getListProperty(A2_215, L9_222 - 1, "name")
      L16_229 = A0_213:getListProperty(A2_215, L9_222 - 1, "stackable")
      L17_230 = A0_213:getListProperty(A2_215, L9_222 - 1, "polmax") == "Visible"
      L18_231 = A0_213:getListProperty(A2_215, L9_222 - 1, "mcount")
      L19_232 = A0_213:getListProperty(A2_215, L9_222 - 1, "equipx") == "Visible"
      L20_233 = A0_213:getListProperty(A2_215, L9_222 - 1, "mpvisible") == "Visible"
    end
  end
  return L7_220, L8_221, L9_222, L10_223, L11_224, L12_225, L13_226, L14_227, L15_228, L16_229, L17_230, L18_231, L19_232, L20_233
end
function BazaarListWidget.displayBazaarGrid(A0_234, A1_235, A2_236, A3_237, A4_238, A5_239, A6_240)
  local L7_241, L8_242, L9_243, L10_244, L11_245, L12_246, L13_247, L14_248, L15_249, L16_250, L17_251, L18_252, L19_253, L20_254, L21_255, L22_256, L23_257, L24_258, L25_259, L26_260, L27_261, L28_262, L29_263
  L8_242 = A0_234
  L7_241 = A0_234.getItemBazaarData
  L9_243 = nil
  L10_244 = A2_236
  L11_245 = A3_237
  L12_246 = A4_238
  L13_247 = A5_239
  L14_248 = A6_240
  L20_254 = L7_241(L8_242, L9_243, L10_244, L11_245, L12_246, L13_247, L14_248)
  L21_255 = desktopWidget
  L22_256 = L21_255
  L21_255 = L21_255.getItemRepairData
  L23_257 = A0_234
  L24_258 = A1_235
  L25_259 = A2_236
  L26_260 = A3_237
  L26_260 = L21_255(L22_256, L23_257, L24_258, L25_259, L26_260)
  L27_261 = false
  L28_262 = false
  L29_263 = false
  if A1_235 ~= nil then
    L27_261 = A1_235:isExclusiveItem()
    if A6_240 == nil or A6_240 == 1 then
      L29_263 = A1_235:_isEquipping()
    end
  else
    if A0_234:getListProperty(A2_236, A3_237, "ex") == 1 then
      L27_261 = true
    end
    if A0_234:getListProperty(A2_236, A3_237, "rare") == 1 then
      L28_262 = true
    end
    if A0_234:getListProperty(A2_236, A3_237, "isEquipping") == 1 then
      L29_263 = true
    end
  end
  A0_234:setVisibility("IconControl_NotEquiped_2", false)
  A0_234:setVisibility("IconControl_PolishMAX_2", false)
  A0_234:setVisibility("Grid_MateriaNumber", false)
  if L10_244 == nil then
    L10_244 = 0
  end
  if L7_241 == 11 then
    A0_234:setVisibility("TextBlock_ItemBazaarSingle", true)
    A0_234:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_234:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_234:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_234:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_234:setIcon("IconControl_ItemBazaarStatus", 378)
    A0_234:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_234:setVisibility("Grid_RewardItem", false)
    A0_234:setVisibility("Grid_RewardMoney", true)
    A0_234:setText("TextBlock_RewardMoney", 3201, L10_244)
    A0_234.work.bazaar = true
  elseif L7_241 == 12 then
    A0_234:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSeparate", true)
    A0_234:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_234:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_234:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_234:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_234:setIcon("IconControl_ItemBazaarStatus", 378)
    A0_234:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_234:setVisibility("Grid_RewardItem", false)
    A0_234:setVisibility("Grid_RewardMoney", true)
    A0_234:setText("TextBlock_RewardMoney", 3201, L10_244)
    A0_234.work.bazaar = true
  elseif L7_241 == 13 then
    A0_234:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSet", true)
    A0_234:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_234:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_234:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_234:setIcon("IconControl_ItemBazaarStatus", 453)
    A0_234:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_234:setVisibility("Grid_RewardItem", false)
    A0_234:setVisibility("Grid_RewardMoney", true)
    A0_234:setText("TextBlock_RewardMoney", 3201, L10_244)
    A0_234.work.bazaar = true
  elseif L7_241 == 20 or L7_241 == 30 then
    A0_234:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_234:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_234:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_234:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_234:setVisibility("IconControl_ItemBazaarStatus", false)
    A0_234:setVisibility("Grid_RewardItem", false)
    A0_234:setVisibility("Grid_RewardMoney", false)
    A0_234.work.bazaar = true
  elseif L8_242 ~= 0 then
    A0_234.work.bazaar = true
    A0_234:setVisibility("Grid_RewardItem", true)
    if L12_246 == 1000001 then
      A0_234:setVisibility("Grid_RewardItem", false)
      A0_234:setVisibility("Grid_RewardMoney", true)
      A0_234:setText("TextBlock_RewardMoney", 3201, L14_248)
    else
      A0_234:setVisibility("Grid_RewardItem", true)
      A0_234:setVisibility("Grid_RewardMoney", false)
      A0_234:setIcon("IconControl_RewardItemIcon", L13_247)
      A0_234:setText("TextBlock_RewardItemName", L15_249)
      if L16_250 == 1 then
        A0_234:setText("TextBlock_RewardItemStack", 3189, L14_248)
        A0_234:setVisibility("TextBlock_RewardItemStack", true)
      else
        A0_234:setText("TextBlock_RewardItemStack", "")
      end
      A0_234:setVisibility("IconControl_PolishMAX_2", L17_251)
      if L18_252 > 0 then
        A0_234:setVisibility("Grid_MateriaNumber", true)
        A0_234:setVisibility("TextBlock_RewardItemStack", false)
        A0_234:setVisibility("TextBlock_MateriaNumber", true)
        A0_234:setText("TextBlock_MateriaNumber", tostring(L18_252))
        A0_234:setVisibility("IconControl_MateriaBase", false)
        A0_234:setVisibility("IconControl_MateriaIcon", true)
      elseif L20_254 == true then
        A0_234:setVisibility("Grid_MateriaNumber", true)
        A0_234:setVisibility("TextBlock_MateriaNumber", false)
        A0_234:setVisibility("TextBlock_RewardItemStack", false)
        A0_234:setVisibility("IconControl_MateriaBase", true)
        A0_234:setVisibility("IconControl_MateriaIcon", false)
      else
        A0_234:setVisibility("IconControl_MateriaBase", false)
        A0_234:setVisibility("IconControl_MateriaIcon", false)
      end
      A0_234:setVisibility("IconControl_NotEquiped_2", L19_253)
    end
    if L11_245 == 20 then
      A0_234:setVisibility("TextBlock_ItemBazaarSingle", false)
      A0_234:setVisibility("TextBlock_ItemBazaarSeparate", false)
      A0_234:setVisibility("TextBlock_ItemBazaarSet", false)
      A0_234:setVisibility("TextBlock_ItemBazaarBuy", true)
      A0_234:setVisibility("TextBlock_ItemBazaarRepair", false)
      A0_234:setVisibility("TextBlock_ItemBazaarReward", true)
      A0_234:setIcon("IconControl_ItemBazaarStatus", 379)
      A0_234:setVisibility("IconControl_ItemBazaarStatus", true)
    elseif L11_245 == 30 then
      A0_234:setVisibility("TextBlock_ItemBazaarSingle", false)
      A0_234:setVisibility("TextBlock_ItemBazaarSeparate", false)
      A0_234:setVisibility("TextBlock_ItemBazaarSet", false)
      A0_234:setVisibility("TextBlock_ItemBazaarBuy", false)
      A0_234:setVisibility("TextBlock_ItemBazaarRepair", true)
      A0_234:setVisibility("TextBlock_ItemBazaarReward", true)
      A0_234:setIcon("IconControl_ItemBazaarStatus", 380)
      A0_234:setVisibility("IconControl_ItemBazaarStatus", true)
    end
  else
    A0_234.work.bazaar = false
    A0_234:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_234:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_234:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_234:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_234:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_234:setVisibility("IconControl_ItemBazaarStatus", false)
    A0_234:setVisibility("Grid_RewardItem", false)
    A0_234:setVisibility("Grid_RewardMoney", false)
  end
  return true
end
function BazaarListWidget.displayHelp(A0_264, A1_265)
  A0_264:setText("TextBlock_Help", A1_265)
end
function BazaarListWidget.displayFocusedItemHelp(A0_266)
  local L1_267, L2_268, L3_269, L4_270, L5_271, L6_272, L7_273, L8_274, L9_275, L10_276, L11_277, L12_278, L13_279, L14_280, L15_281, L16_282
  L1_267 = A0_266.work
  L1_267 = L1_267.updatecountbaz
  if L1_267 > 0 then
    L1_267 = false
    return L1_267
  end
  L2_268 = A0_266
  L1_267 = A0_266.getListBoxFocusNum
  L3_269 = A0_266.work
  L3_269 = L3_269.listbox
  L1_267 = L1_267(L2_268, L3_269)
  if L1_267 == 0 then
    L2_268 = A0_266
    L1_267 = A0_266.displayHelp
    L3_269 = 3140
    L1_267(L2_268, L3_269)
    L1_267 = A0_266.work
    L1_267.bonus1 = false
    L1_267 = A0_266.work
    L1_267.bonus2 = false
    L1_267 = A0_266.work
    L1_267.bonus3 = false
    L1_267 = A0_266.work
    L1_267.bazaar = false
    L1_267 = A0_266.work
    L1_267.itemlife = false
    L1_267 = A0_266.work
    L1_267.page = 0
    L2_268 = A0_266
    L1_267 = A0_266.setGridVisibility
    L3_269 = 1
    L1_267(L2_268, L3_269)
    L1_267 = false
    return L1_267
  end
  L2_268 = A0_266
  L1_267 = A0_266.getListPropertyName
  L3_269 = A0_266.work
  L3_269 = L3_269.listbox
  L1_267 = L1_267(L2_268, L3_269)
  L2_268 = 8
  L3_269 = A0_266.work
  L3_269 = L3_269.index
  L3_269 = L3_269 + 1
  L4_270 = 2
  L5_271 = worldMaster
  L6_272 = L5_271
  L5_271 = L5_271._getMyPlayer
  L5_271 = L5_271(L6_272)
  L6_272 = nil
  if L4_270 == 1 then
    L8_274 = L5_271
    L7_273 = L5_271._getItem
    L9_275 = L2_268
    L10_276 = L3_269
    L7_273 = L7_273(L8_274, L9_275, L10_276)
    L6_272 = L7_273
  elseif L4_270 == 2 then
    L7_273 = desktopWidget
    L8_274 = L7_273
    L7_273 = L7_273.getBazaarItem
    L9_275 = L2_268
    L10_276 = L3_269
    L7_273 = L7_273(L8_274, L9_275, L10_276)
    L6_272 = L7_273
  end
  if L6_272 ~= nil then
    L8_274 = L6_272
    L7_273 = L6_272._isAlive
    L7_273 = L7_273(L8_274)
    if L7_273 == true then
    end
  else
    L7_273 = false
    return L7_273
  end
  L7_273 = desktopWidget
  L8_274 = L7_273
  L7_273 = L7_273.setItemDetail
  L9_275 = A0_266
  L10_276 = L6_272
  L11_277 = L1_267
  L12_278 = A0_266.work
  L12_278 = L12_278.index
  L7_273(L8_274, L9_275, L10_276, L11_277, L12_278)
  L7_273 = false
  L9_275 = A0_266
  L8_274 = A0_266.displayBazaarGrid
  L10_276 = L6_272
  L12_278 = A0_266
  L11_277 = A0_266.getListPropertyName
  L11_277 = L11_277(L12_278, L13_279)
  L12_278 = A0_266.work
  L12_278 = L12_278.index
  L8_274 = L8_274(L9_275, L10_276, L11_277, L12_278, L13_279, L14_280)
  L7_273 = L8_274
  L8_274 = nil
  L9_275 = 0
  L10_276 = 0
  L11_277 = 0
  L12_278 = 0
  if L13_279 == true then
    for L16_282 = 1, 27 do
      if L6_272:isFitForEquipPoint(L16_282) == true then
        if L9_275 == 0 then
          L9_275 = L16_282
        elseif L10_276 == 0 then
          L10_276 = L16_282
        elseif L11_277 == 0 then
          L11_277 = L16_282
        elseif L12_278 == 0 then
          L12_278 = L16_282
          break
        end
      end
    end
  end
  if L9_275 ~= 0 then
    L8_274 = L13_279
  end
  if L8_274 == nil and L10_276 ~= 0 then
    L8_274 = L13_279
  end
  if L8_274 == nil and L11_277 ~= 0 then
    L8_274 = L13_279
  end
  if L8_274 == nil and L12_278 ~= 0 then
    L8_274 = L13_279
  end
  if L6_272 == nil then
  elseif not L14_280 then
  end
  L16_282 = A0_266
  L16_282 = L14_280(L15_281, L16_282, L6_272, L1_267, A0_266.work.index, L8_274, L13_279)
  A0_266.work.bonus1 = L14_280
  A0_266.work.bonus2 = L15_281
  A0_266.work.bonus3 = L16_282
  A0_266.work.itemlife = L14_280(L15_281, L16_282, L6_272, L1_267, A0_266.work.index, L8_274, L13_279)
  A0_266:setControlProperty("Grid_MateriaPossible", "VisualOpacityBlue", "0.5")
  A0_266:setControlProperty("Grid_MateriaPossible", "VisualOpacityGreen", "0.5")
  A0_266:setControlProperty("Grid_MateriaPossible", "VisualOpacityRed", "0.5")
  A0_266:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityBlue", "0.5")
  A0_266:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityGreen", "0.5")
  A0_266:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityRed", "0.5")
  A0_266:setHelpParameter("Grid_ItemPolish", 1, 73903)
  A0_266:updateWindowDisplay(false)
end
function BazaarListWidget.previousSequence(A0_283)
  A0_283.work.editWidgetOpen = -1
  desktopWidget:closeWidgetDirect(A0_283)
end
function BazaarListWidget.isOperateButtonEnable(A0_284, A1_285, A2_286)
  local L3_287, L4_288, L5_289, L6_290, L7_291, L8_292, L9_293, L10_294
  L4_288 = A0_284
  L3_287 = A0_284.getListPropertyName
  L5_289 = A1_285
  L3_287 = L3_287(L4_288, L5_289)
  L4_288 = true
  L5_289 = worldMaster
  L6_290 = L5_289
  L5_289 = L5_289._getMyPlayer
  L5_289 = L5_289(L6_290)
  L7_291 = L5_289
  L6_290 = L5_289.getMoneyOnHand
  L6_290 = L6_290(L7_291)
  L8_292 = A0_284
  L7_291 = A0_284.getListBoxFocusNum
  L9_293 = A1_285
  L7_291 = L7_291(L8_292, L9_293)
  if L7_291 == 0 then
    L7_291 = false
    return L7_291
  end
  L8_292 = A0_284
  L7_291 = A0_284.getListProperty
  L9_293 = L3_287
  L10_294 = A2_286
  L7_291 = L7_291(L8_292, L9_293, L10_294, "bazaarkind")
  if L7_291 == 11 then
    L9_293 = A0_284
    L8_292 = A0_284.getListProperty
    L10_294 = L3_287
    L8_292 = L8_292(L9_293, L10_294, A2_286, "rewardprice")
    if L6_290 < L8_292 then
      L4_288 = false
    end
  elseif L7_291 == 12 then
    L9_293 = A0_284
    L8_292 = A0_284.getListProperty
    L10_294 = L3_287
    L8_292 = L8_292(L9_293, L10_294, A2_286, "rewardprice")
    if L6_290 < L8_292 then
      L4_288 = false
    end
  elseif L7_291 == 13 then
    L9_293 = A0_284
    L8_292 = A0_284.getListProperty
    L10_294 = L3_287
    L8_292 = L8_292(L9_293, L10_294, A2_286, "rewardprice")
    if L6_290 < L8_292 then
      L4_288 = false
    end
  else
    L9_293 = A0_284
    L8_292 = A0_284.getListProperty
    L10_294 = L3_287
    L8_292 = L8_292(L9_293, L10_294, A2_286, "rewardpackage")
    L10_294 = A0_284
    L9_293 = A0_284.getListProperty
    L9_293 = L9_293(L10_294, L3_287, A2_286, "rewarditem")
    L10_294 = A0_284.getListProperty
    L10_294 = L10_294(A0_284, L3_287, L9_293 - 1, "bazaarkind")
    if L10_294 == 20 then
      L10_294 = desktopWidget
      L10_294 = L10_294.getBazaarItem
      L10_294 = L10_294(L10_294, 8, A2_286 + 1)
      if L10_294 == nil or L10_294:_isAlive() == false then
        L4_288 = false
      elseif A0_284:checkMyPackage(L10_294) ~= 1 then
        L4_288 = false
      end
    end
  end
  return L4_288
end
function BazaarListWidget.processUICommandOperate(A0_295, A1_296, A2_297, A3_298, A4_299)
  if A2_297 == "Button_ListClose" then
    A0_295:closeMateriaList()
  end
  if A0_295.work.editWidgetOpen ~= 0 then
    return false
  end
  if 0 < A0_295.work.updatecountbaz then
    return
  end
  if 0 < A0_295.work.updatecount then
    return
  end
end
function BazaarListWidget.processUICommandCancel(A0_300, A1_301, A2_302, A3_303, A4_304)
  if A0_300.work.updatecountbaz > 0 then
    return
  end
  if A2_302 == "Button_ListClose" then
    A0_300:closeMateriaList()
    return
  end
  if 0 < A0_300.work.updatecount then
    return
  end
  A0_300:previousSequence()
end
function BazaarListWidget.processUICommandClose(A0_305, A1_306, A2_307, A3_308, A4_309)
  if A0_305.work.updatecountbaz > 0 then
    return
  end
  if 0 < A0_305.work.updatecount then
    return
  end
  A0_305:previousSequence()
end
function BazaarListWidget.processUICommandSelection(A0_310, A1_311, A2_312, A3_313, A4_314)
  local L5_315, L6_316, L7_317, L8_318, L9_319, L10_320, L11_321
  L5_315 = A0_310.work
  L5_315 = L5_315.updatecountbaz
  if L5_315 > 0 then
    return
  end
  L5_315 = A0_310.work
  L5_315 = L5_315.updatecount
  if L5_315 > 0 then
    return
  end
  L5_315 = A0_310.work
  L5_315 = L5_315.editWidgetOpen
  if L5_315 ~= 0 then
    return
  end
  L5_315 = desktopWidget
  L6_316 = L5_315
  L5_315 = L5_315.checkKeyboardFocused
  L7_317 = A0_310
  L5_315 = L5_315(L6_316, L7_317)
  if L5_315 == false then
    return
  end
  L5_315 = desktopWidget
  L6_316 = L5_315
  L5_315 = L5_315.isValidBazaarActor
  L5_315 = L5_315(L6_316)
  if L5_315 == false then
    L6_316 = A0_310
    L5_315 = A0_310.previousSequence
    return L5_315(L6_316)
  end
  L5_315 = A0_310.work
  L5_315 = L5_315.waitupdate
  if L5_315 == true then
    return
  end
  L6_316 = A0_310
  L5_315 = A0_310.isExistItem
  L7_317 = 8
  L8_318 = 1
  L9_319 = 2
  L5_315 = L5_315(L6_316, L7_317, L8_318, L9_319)
  if L5_315 == false then
    L6_316 = A0_310
    L5_315 = A0_310.previousSequence
    L5_315(L6_316)
    return
  end
  if A3_313 == nil or A3_313 < 0 then
    return
  end
  L5_315 = A0_310.work
  L5_315.focus = A3_313
  L5_315 = A0_310.work
  L5_315.listbox = A4_314
  L6_316 = A0_310
  L5_315 = A0_310.getListPropertyName
  L7_317 = A0_310.work
  L7_317 = L7_317.listbox
  L5_315 = L5_315(L6_316, L7_317)
  L6_316 = A0_310.work
  L6_316 = L6_316.focus
  L8_318 = A0_310
  L7_317 = A0_310.getListBoxFocusNum
  L9_319 = A0_310.work
  L9_319 = L9_319.listbox
  L7_317 = L7_317(L8_318, L9_319)
  if L6_316 >= L7_317 then
    L7_317 = A0_310
    L6_316 = A0_310.updateListFocus
    L6_316(L7_317)
    return
  end
  L7_317 = A0_310
  L6_316 = A0_310.updateWindowDisplay
  L8_318 = true
  L6_316(L7_317, L8_318)
  L7_317 = A0_310
  L6_316 = A0_310.selectedBorder
  L8_318 = A0_310.work
  L8_318 = L8_318.index
  L9_319 = true
  L6_316(L7_317, L8_318, L9_319)
  L7_317 = A0_310
  L6_316 = A0_310.copyItem
  L6_316(L7_317)
  L6_316 = A0_310.work
  L6_316.chosenPackage = 8
  L6_316 = A0_310.work
  L7_317 = A0_310.work
  L7_317 = L7_317.index
  L7_317 = L7_317 + 1
  L6_316.chosenItem = L7_317
  L7_317 = A0_310
  L6_316 = A0_310.getListProperty
  L8_318 = L5_315
  L9_319 = A0_310.work
  L9_319 = L9_319.index
  L10_320 = "bazaarkind"
  L6_316 = L6_316(L7_317, L8_318, L9_319, L10_320)
  if L6_316 == 11 or L6_316 == 12 or L6_316 == 13 then
    L7_317 = worldMaster
    L8_318 = L7_317
    L7_317 = L7_317._getMyPlayer
    L7_317 = L7_317(L8_318)
    L9_319 = L7_317
    L8_318 = L7_317.getMoneyOnHand
    L8_318 = L8_318(L9_319)
    L10_320 = A0_310
    L9_319 = A0_310.getListProperty
    L11_321 = L5_315
    L9_319 = L9_319(L10_320, L11_321, A0_310.work.index, "rewardprice")
    if L8_318 < L9_319 then
      L9_319 = worldMaster
      L10_320 = L9_319
      L9_319 = L9_319.notify
      L11_321 = worldMaster
      L9_319(L10_320, L11_321, 25065)
      L9_319 = desktopWidget
      L10_320 = L9_319
      L9_319 = L9_319.getBazaarItem
      L11_321 = 8
      L9_319 = L9_319(L10_320, L11_321, A0_310.work.index + 1)
      if L9_319 ~= nil then
        L11_321 = L9_319
        L10_320 = L9_319._isAlive
        L10_320 = L10_320(L11_321)
      elseif L10_320 == false then
        return
      end
      L11_321 = L9_319
      L10_320 = L9_319.isEquipment
      L10_320 = L10_320(L11_321)
      if L10_320 then
        L11_321 = L9_319
        L10_320 = L9_319.isMateriaAttached
        L10_320 = L10_320(L11_321)
        if L10_320 then
          L11_321 = A0_310
          L10_320 = A0_310.showMateriaList
          L10_320(L11_321)
          L11_321 = A0_310
          L10_320 = A0_310.setVisibility
          L10_320(L11_321, "Button_ListClose", true)
          L11_321 = A0_310
          L10_320 = A0_310.setWindowFocus
          L10_320(L11_321, "Button_ListClose")
        end
      end
    else
      L10_320 = A0_310
      L9_319 = A0_310.operateBazaarSell
      L9_319(L10_320)
    end
    return
  else
    L8_318 = A0_310
    L7_317 = A0_310.getListProperty
    L9_319 = L5_315
    L10_320 = A0_310.work
    L10_320 = L10_320.index
    L11_321 = "rewardpackage"
    L7_317 = L7_317(L8_318, L9_319, L10_320, L11_321)
    L9_319 = A0_310
    L8_318 = A0_310.getListProperty
    L10_320 = L5_315
    L11_321 = A0_310.work
    L11_321 = L11_321.index
    L8_318 = L8_318(L9_319, L10_320, L11_321, "rewarditem")
    L10_320 = A0_310
    L9_319 = A0_310.getListProperty
    L11_321 = L5_315
    L9_319 = L9_319(L10_320, L11_321, L8_318 - 1, "bazaarkind")
    if L9_319 == 20 then
      L9_319 = desktopWidget
      L10_320 = L9_319
      L9_319 = L9_319.getBazaarItem
      L11_321 = A0_310.work
      L11_321 = L11_321.chosenPackage
      L9_319 = L9_319(L10_320, L11_321, A0_310.work.chosenItem)
      if L9_319 ~= nil then
        L11_321 = L9_319
        L10_320 = L9_319._isAlive
        L10_320 = L10_320(L11_321)
      elseif L10_320 == false then
        return
      end
      L11_321 = A0_310
      L10_320 = A0_310.checkMyPackage
      L11_321 = L10_320(L11_321, L9_319)
      if L10_320 == 1 then
        A0_310:operateBazaarBuy()
        return
      end
    else
      L9_319 = worldMaster
      L10_320 = L9_319
      L9_319 = L9_319._getMyPlayer
      L9_319 = L9_319(L10_320)
      L10_320 = desktopWidget
      L11_321 = L10_320
      L10_320 = L10_320.getBazaarItem
      L10_320 = L10_320(L11_321, A0_310.work.chosenPackage, A0_310.work.chosenItem)
      if L10_320 ~= nil then
        L11_321 = L10_320._isAlive
        L11_321 = L11_321(L10_320)
      elseif L11_321 == false then
        return
      end
      L11_321 = L10_320.getItemRepairSkill
      L11_321 = L11_321(L10_320)
      if L11_321 == L9_319:getStateMainSkill() then
        A0_310:operateBazaarRepair()
      else
        worldMaster:notify(worldMaster, 40222, L11_321)
      end
      return
    end
  end
  L7_317 = worldMaster
  L8_318 = L7_317
  L7_317 = L7_317.notify
  L9_319 = worldMaster
  L10_320 = 25099
  L7_317(L8_318, L9_319, L10_320)
end
function BazaarListWidget.processUICommandDefault(A0_322, A1_323, A2_324, A3_325, A4_326, A5_327)
  if A0_322.work.updatecountbaz > 0 then
    return
  end
  if 0 < A0_322.work.updatecount then
    return
  end
  if A0_322.work.editWidgetOpen ~= 0 then
    return
  end
  if desktopWidget:checkKeyboardFocused(A0_322) == false then
    return
  end
  if desktopWidget:isValidBazaarActor() == false then
    return A0_322:previousSequence()
  end
  if A3_325 == "UILuaCommands.Previous" then
    A0_322:catalogSkip(-1)
  elseif A3_325 == "UILuaCommands.Next" then
    A0_322:catalogSkip(1)
  elseif A3_325 == "UILuaCommands.MouseEnteredItem" or A3_325 == "UILuaCommands.AnchoredItem" then
    if A5_327 == nil then
      return
    end
    if A4_326 == nil or A4_326 < 0 then
      return
    end
    A0_322.work.listbox = A5_327
    A0_322.work.focus = A4_326
    if A0_322:isExistItem(8, 1, 2) == false then
      return
    end
    if A0_322:getListBoxFocusNum(A0_322.work.listbox) == 0 then
      A0_322:updateListFocus()
      return
    end
    if A0_322.work.focus >= A0_322:getListBoxFocusNum(A0_322.work.listbox) then
      A0_322:displayFocusedItemHelp()
      return
    end
    A0_322:selectedBorder()
    A0_322:setCommonTimer(0.2)
  end
end
function BazaarListWidget.processTimer(A0_328)
  if A0_328:focusToIndex(A0_328.work.listbox, A0_328.work.focus) >= 0 then
    A0_328.work.index = A0_328:focusToIndex(A0_328.work.listbox, A0_328.work.focus)
  end
  A0_328.work.page = 0
  A0_328:displayFocusedItemHelp()
end
function BazaarListWidget.catalogSkip(A0_329, A1_330)
  local L2_331
  L2_331 = A0_329.work
  L2_331 = L2_331.isMateriaList
  if L2_331 then
    return
  end
  L2_331 = A0_329.work
  L2_331 = L2_331.focus
  if A0_329:getListBoxFocusNum(A0_329.work.listbox) - 1 == -1 then
    return
  end
  L2_331 = L2_331 + 10 * A1_330
  if A0_329:getListBoxFocusNum(A0_329.work.listbox) - 1 < L2_331 then
    L2_331 = A0_329:getListBoxFocusNum(A0_329.work.listbox) - 1
  elseif L2_331 < 0 then
    L2_331 = 0
  end
  if L2_331 ~= A0_329.work.focus then
    A0_329.work.focus = L2_331
    A0_329:updateWindowDisplay(true)
  end
end
function BazaarListWidget.selectedBorder(A0_332, A1_333, A2_334)
  local L3_335, L4_336
  L3_335 = A0_332.getListPropertyName
  L3_335 = L3_335(L4_336, A0_332.work.listbox)
  if A1_333 ~= nil then
    A0_332:setListProperty(L3_335, A0_332.work.index, "selected", L4_336)
    A0_332.work.selected = A0_332.work.index
  elseif L4_336 == -1 then
    return
  else
    for _FORV_7_ = 1, A0_332:getListBoxItemNum(A0_332.work.listbox) do
      A0_332:setListProperty(L3_335, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_336.selected = -1
  end
  L4_336(A0_332, L3_335)
end
function BazaarListWidget.operateBazaarSell(A0_337)
  local L1_338, L2_339
  L1_338 = false
  L2_339 = desktopWidget
  L2_339 = L2_339.openChildWidget
  L2_339 = L2_339(L2_339, "BazaarEditWidget", A0_337, true, true, 6, A0_337.work.chosenPackage, A0_337.work.chosenItem, 2, A0_337)
  L1_338 = L2_339
  if L1_338 == true then
    L2_339 = A0_337.work
    L2_339.editWidgetOpen = 2
    L2_339 = desktopWidget
    L2_339 = L2_339.getBazaarItem
    L2_339 = L2_339(L2_339, A0_337.work.chosenPackage, A0_337.work.chosenItem)
    if L2_339:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L2_339) > 0 then
      A0_337:showMateriaList()
    end
  end
  return L1_338
end
function BazaarListWidget.operateBazaarBuy(A0_340)
  local L1_341
  L1_341 = false
  L1_341 = desktopWidget:openChildWidget("ItemSelectWidget", A0_340, true, true, 440, A0_340.work.chosenPackage, A0_340.work.chosenItem, 2)
  if L1_341 == true then
    A0_340.work.editWidgetOpen = 5
  end
  return L1_341
end
function BazaarListWidget.operateBazaarRepair(A0_342)
  local L1_343, L2_344, L3_345, L4_346, L5_347, L6_348, L7_349, L8_350, L9_351, L10_352, L11_353, L12_354, L13_355, L14_356
  L1_343 = desktopWidget
  L2_344 = L1_343
  L1_343 = L1_343.cannotExecuteWithErrorMessage
  L1_343 = L1_343(L2_344)
  if L1_343 then
    L1_343 = false
    return L1_343
  end
  L2_344 = A0_342
  L1_343 = A0_342.getListPropertyName
  L3_345 = A0_342.work
  L3_345 = L3_345.listbox
  L1_343 = L1_343(L2_344, L3_345)
  L3_345 = A0_342
  L2_344 = A0_342.getListProperty
  L4_346 = L1_343
  L5_347 = A0_342.work
  L5_347 = L5_347.index
  L6_348 = "rewardpackage"
  L2_344 = L2_344(L3_345, L4_346, L5_347, L6_348)
  L4_346 = A0_342
  L3_345 = A0_342.getListProperty
  L5_347 = L1_343
  L6_348 = A0_342.work
  L6_348 = L6_348.index
  L7_349 = "rewarditem"
  L3_345 = L3_345(L4_346, L5_347, L6_348, L7_349)
  L4_346 = worldMaster
  L5_347 = L4_346
  L4_346 = L4_346._getMyPlayer
  L4_346 = L4_346(L5_347)
  L5_347 = desktopWidget
  L6_348 = L5_347
  L5_347 = L5_347.getBazaarItem
  L7_349 = A0_342.work
  L7_349 = L7_349.chosenPackage
  L8_350 = A0_342.work
  L8_350 = L8_350.chosenItem
  L5_347 = L5_347(L6_348, L7_349, L8_350)
  L6_348, L7_349 = nil, nil
  if L5_347 ~= nil then
    L9_351 = L5_347
    L8_350 = L5_347.isRepairable
    L8_350 = L8_350(L9_351)
    if L8_350 == false then
      L8_350 = false
      return L8_350
    end
    L9_351 = L5_347
    L8_350 = L5_347.getItemRepairItem
    L8_350 = L8_350(L9_351)
    L6_348 = L8_350
    L9_351 = L5_347
    L8_350 = L5_347.getItemRepairItemNum
    L8_350 = L8_350(L9_351)
    L7_349 = L8_350
  else
    L8_350 = false
    return L8_350
  end
  L9_351 = L4_346
  L8_350 = L4_346._getItemPackageCapacity
  L10_352 = 1
  L8_350 = L8_350(L9_351, L10_352)
  L10_352 = L4_346
  L9_351 = L4_346._getItemPackageFreeSpace
  L9_351 = L9_351(L10_352, L11_353)
  L10_352 = 0
  for L14_356 = 1, L8_350 - L9_351 do
    if desktopWidget:getPlayerItemInPackage(1, L14_356) == L6_348 then
      L10_352 = L10_352 + desktopWidget:getPlayerItemInPackage(1, L14_356)
    end
  end
  if L7_349 > L10_352 then
    L14_356 = 40241
    L11_353(L12_354, L13_355, L14_356)
    return L11_353
  end
  L14_356 = L3_345
  if L11_353 == true then
  end
  return L11_353
end
function BazaarListWidget.setSubPosition(A0_357)
  local L1_358, L2_359, L3_360, L4_361, L5_362, L6_363, L7_364, L8_365, L9_366, L10_367, L11_368, L12_369, L13_370, L14_371, L15_372, L16_373
  L2_359 = A0_357
  L1_358 = A0_357.getChildWidgetByWindowName
  L3_360 = "ItemSubWidget"
  L1_358 = L1_358(L2_359, L3_360)
  if L1_358 ~= nil then
    L3_360 = L1_358
    L2_359 = L1_358.setProperty
    L4_361 = "Margin"
    L5_362 = "0,0,0,0"
    L2_359(L3_360, L4_361, L5_362)
    L3_360 = A0_357
    L2_359 = A0_357.getWindowPosition
    L3_360 = L2_359(L3_360)
    L5_362 = A0_357
    L4_361 = A0_357.getWindowSize
    L5_362 = L4_361(L5_362)
    L6_363 = desktopWidget
    L7_364 = L6_363
    L6_363 = L6_363.getWindowSize
    L7_364 = L6_363(L7_364)
    L2_359 = L2_359 + 64
    L3_360 = L3_360 + 36
    L8_365 = L6_363 - 64
    L9_366 = 64
    L10_367 = L7_364 - 36
    L11_368 = 36
    if L6_363 == 640 and L7_364 == 480 then
      L8_365 = L6_363 * 0.85
      L9_366 = L6_363 * 0.15
      L10_367 = L7_364 * 0.85
      L11_368 = L7_364 * 0.15
    end
    L12_369 = L3_360 + 120
    L14_371 = L1_358
    L13_370 = L1_358.getWindowSize
    L14_371 = L13_370(L14_371)
    L15_372 = L12_369 + L14_371
    L16_373 = L2_359 + L4_361
    if L8_365 < L16_373 + L13_370 then
      L16_373 = L16_373 - (L16_373 + L13_370 - L8_365)
    end
    if L10_367 < L15_372 then
      L12_369 = L12_369 - (L15_372 - L10_367)
    end
    L1_358:setProperty("Top", L12_369)
    L1_358:setProperty("Left", L16_373)
  end
end
function BazaarListWidget.openSubWidget(A0_374, A1_375)
  local L2_376, L3_377, L4_378, L5_379, L6_380, L7_381, L8_382, L9_383, L10_384, L11_385, L12_386, L13_387, L14_388, L15_389, L16_390, L17_391, L18_392, L19_393, L20_394
  L3_377 = A0_374
  L2_376 = A0_374.getChildWidgetByWindowName
  L4_378 = "ItemSubWidget"
  L2_376 = L2_376(L3_377, L4_378)
  if L2_376 ~= nil then
    L4_378 = A0_374
    L3_377 = A0_374.copyItem
    L3_377(L4_378)
    L3_377 = A0_374.work
    L3_377.chosenPackage = 8
    L3_377 = A0_374.work
    L4_378 = A0_374.work
    L4_378 = L4_378.index
    L4_378 = L4_378 + 1
    L3_377.chosenItem = L4_378
    L4_378 = L2_376
    L3_377 = L2_376.setContent
    L5_379 = "Button_BazaarSell"
    L6_380 = 3135
    L3_377(L4_378, L5_379, L6_380)
    L4_378 = L2_376
    L3_377 = L2_376.setContent
    L5_379 = "Button_BazaarBuy"
    L6_380 = 3135
    L3_377(L4_378, L5_379, L6_380)
    L4_378 = L2_376
    L3_377 = L2_376.setContent
    L5_379 = "Button_BazaarRepair"
    L6_380 = 3222
    L3_377(L4_378, L5_379, L6_380)
    L3_377 = 0
    L4_378 = 0
    L5_379 = 0
    L6_380 = 0
    L7_381 = 0
    L8_382 = 0
    L9_383 = 0
    L10_384 = 0
    L11_385 = 0
    L12_386 = 2
    L14_388 = A0_374
    L13_387 = A0_374.setSubPosition
    L13_387(L14_388)
    L14_388 = A0_374
    L13_387 = A0_374.getListPropertyName
    L15_389 = A0_374.work
    L15_389 = L15_389.listbox
    L13_387 = L13_387(L14_388, L15_389)
    L14_388 = true
    L15_389 = worldMaster
    L16_390 = L15_389
    L15_389 = L15_389._getMyPlayer
    L15_389 = L15_389(L16_390)
    L17_391 = L15_389
    L16_390 = L15_389.getMoneyOnHand
    L16_390 = L16_390(L17_391)
    L18_392 = A0_374
    L17_391 = A0_374.getListBoxFocusNum
    L19_393 = A0_374.work
    L19_393 = L19_393.listbox
    L17_391 = L17_391(L18_392, L19_393)
    if L17_391 == 0 then
      L17_391 = false
      return L17_391
    end
    L18_392 = A0_374
    L17_391 = A0_374.getListProperty
    L19_393 = L13_387
    L20_394 = A0_374.work
    L20_394 = L20_394.index
    L17_391 = L17_391(L18_392, L19_393, L20_394, "bazaarkind")
    if L17_391 == 11 then
      L19_393 = A0_374
      L18_392 = A0_374.getListProperty
      L20_394 = L13_387
      L18_392 = L18_392(L19_393, L20_394, A0_374.work.index, "rewardprice")
      if L16_390 < L18_392 then
        L4_378 = 1
      else
        L4_378 = 2
      end
    elseif L17_391 == 12 then
      L19_393 = A0_374
      L18_392 = A0_374.getListProperty
      L20_394 = L13_387
      L18_392 = L18_392(L19_393, L20_394, A0_374.work.index, "rewardprice")
      if L16_390 < L18_392 then
        L4_378 = 1
      else
        L4_378 = 2
      end
    elseif L17_391 == 13 then
      L19_393 = A0_374
      L18_392 = A0_374.getListProperty
      L20_394 = L13_387
      L18_392 = L18_392(L19_393, L20_394, A0_374.work.index, "rewardprice")
      if L16_390 < L18_392 then
        L4_378 = 1
      else
        L4_378 = 2
      end
    else
      L19_393 = A0_374
      L18_392 = A0_374.getListProperty
      L20_394 = L13_387
      L18_392 = L18_392(L19_393, L20_394, A0_374.work.index, "rewardpackage")
      L20_394 = A0_374
      L19_393 = A0_374.getListProperty
      L19_393 = L19_393(L20_394, L13_387, A0_374.work.index, "rewarditem")
      L20_394 = A0_374.getListProperty
      L20_394 = L20_394(A0_374, L13_387, L19_393 - 1, "bazaarkind")
      if L20_394 == 20 then
        L20_394 = desktopWidget
        L20_394 = L20_394.getBazaarItem
        L20_394 = L20_394(L20_394, A0_374.work.chosenPackage, A0_374.work.chosenItem)
        if L20_394 ~= nil and L20_394:_isAlive() == true then
          if A0_374:checkMyPackage(L20_394) ~= 1 then
            L5_379 = 1
          else
            L5_379 = 2
          end
        end
      else
        L6_380 = 2
      end
    end
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_BazaarAbort"
    L18_392(L19_393, L20_394, L3_377)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_BazaarSell"
    L18_392(L19_393, L20_394, L4_378)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_BazaarBuy"
    L18_392(L19_393, L20_394, L5_379)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_BazaarRepair"
    L18_392(L19_393, L20_394, L6_380)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_Repair"
    L18_392(L19_393, L20_394, L7_381)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_DropItemGetAll"
    L18_392(L19_393, L20_394, L8_382)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_DropItemGiveAll"
    L18_392(L19_393, L20_394, L9_383)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_Trash"
    L18_392(L19_393, L20_394, L10_384)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_Sort"
    L18_392(L19_393, L20_394, L11_385)
    L19_393 = L2_376
    L18_392 = L2_376.setSubMenuVisibility
    L20_394 = "Button_Cancel"
    L18_392(L19_393, L20_394, L12_386)
    L19_393 = L2_376
    L18_392 = L2_376.setModal
    L20_394 = true
    L18_392(L19_393, L20_394)
    L19_393 = L2_376
    L18_392 = L2_376.show
    L18_392(L19_393)
    L18_392 = A0_374.work
    L18_392 = L18_392.lastsub
    if L18_392 == 1 and L3_377 == 2 then
      L19_393 = L2_376
      L18_392 = L2_376.setWindowFocus
      L20_394 = "Button_BazaarAbort"
      L18_392(L19_393, L20_394)
    else
      L18_392 = A0_374.work
      L18_392 = L18_392.lastsub
      if L18_392 == 2 and L4_378 == 2 then
        L19_393 = L2_376
        L18_392 = L2_376.setWindowFocus
        L20_394 = "Button_BazaarSell"
        L18_392(L19_393, L20_394)
      else
        L18_392 = A0_374.work
        L18_392 = L18_392.lastsub
        if L18_392 == 3 and L5_379 == 2 then
          L19_393 = L2_376
          L18_392 = L2_376.setWindowFocus
          L20_394 = "Button_BazaarBuy"
          L18_392(L19_393, L20_394)
        else
          L18_392 = A0_374.work
          L18_392 = L18_392.lastsub
          if L18_392 == 4 and L6_380 == 2 then
            L19_393 = L2_376
            L18_392 = L2_376.setWindowFocus
            L20_394 = "Button_BazaarRepair"
            L18_392(L19_393, L20_394)
          else
            L18_392 = A0_374.work
            L18_392 = L18_392.lastsub
            if L18_392 == 5 and L7_381 == 2 then
              L19_393 = L2_376
              L18_392 = L2_376.setWindowFocus
              L20_394 = "Button_Repair"
              L18_392(L19_393, L20_394)
            else
              L18_392 = A0_374.work
              L18_392 = L18_392.lastsub
              if L18_392 == 6 and L8_382 == 2 then
                L19_393 = L2_376
                L18_392 = L2_376.setWindowFocus
                L20_394 = "Button_DropItemGetAll"
                L18_392(L19_393, L20_394)
              else
                L18_392 = A0_374.work
                L18_392 = L18_392.lastsub
                if L18_392 == 7 and L9_383 == 2 then
                  L19_393 = L2_376
                  L18_392 = L2_376.setWindowFocus
                  L20_394 = "Button_DropItemGiveAll"
                  L18_392(L19_393, L20_394)
                else
                  L18_392 = A0_374.work
                  L18_392 = L18_392.lastsub
                  if L18_392 == 8 and L10_384 == 2 then
                    L19_393 = L2_376
                    L18_392 = L2_376.setWindowFocus
                    L20_394 = "Button_Trash"
                    L18_392(L19_393, L20_394)
                  else
                    L18_392 = A0_374.work
                    L18_392 = L18_392.lastsub
                    if L18_392 == 9 and L11_385 == 2 then
                      L19_393 = L2_376
                      L18_392 = L2_376.setWindowFocus
                      L20_394 = "Button_Sort"
                      L18_392(L19_393, L20_394)
                    else
                      L19_393 = L2_376
                      L18_392 = L2_376.setWindowFocus
                      L20_394 = "Button_Cancel"
                      L18_392(L19_393, L20_394)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L18_392 = A0_374.work
    L18_392.submenu = true
  end
end
function BazaarListWidget.closeSubWidget(A0_395)
  if A0_395:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
    A0_395:getChildWidgetByWindowName("ItemSubWidget"):hide()
    A0_395.work.submenu = false
  end
  A0_395:updateWindowDisplay(true)
end
function BazaarListWidget.updateItemList(A0_396, A1_397, A2_398)
  if A1_397 == 0 then
    A0_396.work.updatecountbaz = A2_398
    return
  end
  if 0 < A0_396.work.updatecountbaz then
    A0_396.work.updatecountbaz = A0_396.work.updatecountbaz - 1
  end
  if A0_396.work.updatecountbaz == 0 then
    if desktopWidget:isValidBazaarActor() == false then
      return A0_396:previousSequence()
    end
    if A1_397 == 8 and A0_396.work.editWidgetOpen ~= -1 then
      A0_396.work.updatecountbaz = 1
      A0_396:makeBazaarItemList()
      A0_396.work.updatecountbaz = 0
      if A0_396:getListBoxFocusNum(3) == 0 then
        A0_396.work.closeok = true
      end
      A0_396.work.bazaaritemget = true
      A0_396:updateWindowDisplay(true)
      if A0_396.work.waitupdate == true then
        A0_396.work.waitupdate = false
      end
    end
  end
end
function BazaarListWidget.updatePlayerItem(A0_399, A1_400, A2_401)
  local L3_402, L4_403, L5_404
  if A1_400 == 0 then
    L3_402 = A0_399.work
    L3_402.updatecount = A2_401
    return
  end
  L3_402 = A0_399.work
  L3_402 = L3_402.updatecount
  if L3_402 > 0 then
    L3_402 = A0_399.work
    L4_403 = A0_399.work
    L4_403 = L4_403.updatecount
    L4_403 = L4_403 - 1
    L3_402.updatecount = L4_403
  end
  L3_402 = A0_399.work
  L3_402 = L3_402.updatecount
  if L3_402 == 0 then
    L4_403 = A0_399
    L3_402 = A0_399.displayBagcapacityAndMoney
    L3_402(L4_403)
    if A1_400 == 100 then
      L3_402 = A0_399.work
      L3_402 = L3_402.editWidgetOpen
      if L3_402 == 2 then
        L4_403 = A0_399
        L3_402 = A0_399.getChildWidgetByWindowName
        L5_404 = "BazaarEditWidget"
        L3_402 = L3_402(L4_403, L5_404)
        L4_403 = worldMaster
        L5_404 = L4_403
        L4_403 = L4_403._getMyPlayer
        L4_403 = L4_403(L5_404)
        L5_404 = L4_403.getMoneyOnHand
        L5_404 = L5_404(L4_403)
        if L3_402 ~= nil then
          L3_402:updateMoney(L5_404)
        end
      end
    end
    L3_402 = desktopWidget
    L4_403 = L3_402
    L3_402 = L3_402.isValidBazaarActor
    L3_402 = L3_402(L4_403)
    if L3_402 == false then
      L4_403 = A0_399
      L3_402 = A0_399.previousSequence
      return L3_402(L4_403)
    end
  end
  return
end
function BazaarListWidget.setBazaarEditData(A0_405, A1_406)
  A0_405.work.chosenOperation = A1_406
  return true
end
function BazaarListWidget.closeBazaarEdit(A0_407, A1_408)
  A0_407.work.editWidgetOpen = 0
  if A1_408 == nil and A0_407.work.chosenOperation == 2 then
    A0_407.work.waitupdate = true
  end
  if A0_407.work.isMateriaList then
    A0_407:closeMateriaList()
  end
  A0_407.work.chosenOperation = 0
  if A1_408 == nil then
    A0_407:updateWindowDisplay(true)
    A0_407:selectedBorder()
  end
  if A0_407:getChildWidgetByWindowName("BazaarEditWidget") ~= nil then
    desktopWidget:closeChildWidget("BazaarEditWidget", A0_407)
  end
  A0_407.work.closeok = false
  return true
end
function BazaarListWidget.setOrderItemData(A0_409, A1_410, A2_411, A3_412)
  local L4_413, L5_414, L6_415
  L4_413 = A0_409.work
  L4_413.chosenOperation = A1_410
  L4_413 = A0_409.work
  L4_413 = L4_413.chosenOperation
  if L4_413 == 1 then
    return
  end
  L5_414 = A0_409
  L4_413 = A0_409.getListPropertyName
  L6_415 = A0_409.work
  L6_415 = L6_415.listbox
  L4_413 = L4_413(L5_414, L6_415)
  L6_415 = A0_409
  L5_414 = A0_409.getListBoxFocusNum
  L5_414 = L5_414(L6_415, A0_409.work.listbox)
  if L5_414 == 0 then
    L5_414 = A0_409.work
    L5_414 = L5_414.editWidgetOpen
    if L5_414 == 5 then
      L6_415 = A0_409
      L5_414 = A0_409.closeOrderItem
      return L5_414(L6_415)
    end
  end
  L6_415 = A0_409
  L5_414 = A0_409.getListProperty
  L5_414 = L5_414(L6_415, L4_413, A0_409.work.index, "rewardpackage")
  L6_415 = A0_409.getListProperty
  L6_415 = L6_415(A0_409, L4_413, A0_409.work.index, "rewarditem")
  if L5_414 == 0 or L5_414 == false then
    A0_409.work.chosenOperation = 1
    return false
  end
  if desktopWidget:executeBazaarSell(A2_411, A3_412, L5_414, L6_415) == true then
    A0_409.work.waitupdate = true
    return true
  else
    A0_409.work.chosenOperation = 1
    return false
  end
end
function BazaarListWidget.closeOrderItem(A0_416, A1_417)
  A0_416.work.editWidgetOpen = 0
  A0_416.work.chosenOperation = 0
  if A1_417 == nil then
    A0_416:updateWindowDisplay(true)
    A0_416:selectedBorder()
  end
  if A0_416:getChildWidgetByWindowName("ItemSelectWidget") ~= nil then
    desktopWidget:closeChildWidget("ItemSelectWidget", A0_416)
  end
  A0_416.work.closeok = false
  return true
end
function BazaarListWidget.checkChosenItem(A0_418, A1_419, A2_420, A3_421)
  if A2_420 ~= nil and A2_420 ~= A0_418.work.chosenPackage then
    return false
  end
  if A3_421 ~= nil and A3_421 ~= A0_418.work.chosenItem then
    return false
  end
  if A0_418.work.chosenPackage ~= 8 then
    return false
  end
  if A0_418.work.chosenItem ~= A0_418.work.index + 1 then
    return false
  end
  if desktopWidget:getBazaarItem(A0_418.work.chosenPackage, A0_418.work.chosenItem) == A1_419 then
    return true
  else
    return false
  end
end
function BazaarListWidget.getItemContent(A0_422, A1_423, A2_424, A3_425)
  local L4_426
  L4_426 = A0_422.isSameItem
  L4_426 = L4_426(A0_422)
  if L4_426 == false then
    L4_426 = A0_422.work
    L4_426 = L4_426.editWidgetOpen
    if L4_426 == 2 then
      L4_426 = A0_422.closeBazaarEdit
      L4_426(A0_422)
    end
    L4_426 = A0_422.work
    L4_426 = L4_426.editWidgetOpen
    if L4_426 == 5 then
      L4_426 = A0_422.closeOrderItem
      L4_426(A0_422)
    end
  end
  if A1_423 == nil then
    L4_426 = A0_422._getProperty
    return L4_426(A0_422, nil, A2_424, A3_425)
  else
    L4_426 = A0_422.getListPropertyName
    L4_426 = L4_426(A0_422, A0_422.work.listbox)
    if A1_423 == -1 then
      return A0_422:getListProperty(L4_426, A0_422.work.index, A2_424)
    else
      return A0_422:getListProperty(L4_426, A1_423, A2_424)
    end
  end
end
function BazaarListWidget.getCurrentIndex(A0_427)
  if A0_427:isSameItem() == true then
    return A0_427.work.index + 1
  else
    return 0
  end
end
function BazaarListWidget.syncItemWork(A0_428, A1_429)
  A0_428.work.demandSync = false
end
function BazaarListWidget.setParentSortType(A0_430, A1_431)
end
function BazaarListWidget.showMateriaList(A0_432)
  local L1_433
  L1_433 = desktopWidget
  L1_433 = L1_433.getBazaarItem
  L1_433 = L1_433(L1_433, A0_432.work.chosenPackage, A0_432.work.chosenItem)
  desktopWidget:setMateriaListItems(A0_432, L1_433)
  A0_432:setVisibility("Grid_MateriaEquipList", true)
  A0_432:setVisibility("Grid_TabList", false)
  A0_432:setVisibility("Button_ListClose", false)
  A0_432.work.isMateriaList = true
end
function BazaarListWidget.closeMateriaList(A0_434)
  A0_434:setVisibility("Grid_MateriaEquipList", false)
  A0_434:setVisibility("Grid_TabList", true)
  A0_434.work.isMateriaList = false
end
