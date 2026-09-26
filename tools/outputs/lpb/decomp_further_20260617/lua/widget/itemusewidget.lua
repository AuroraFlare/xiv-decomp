require("/Widget/WidgetBaseClass")
_defineClass("ItemUseWidget", "WidgetBaseClass")
function ItemUseWidget.init(A0_0, A1_1)
  A0_0.work._temp = {
    {"chosenItem", "integer32"},
    {
      "chosenPackage",
      "integer32"
    },
    {
      "chosenOperation",
      "integer32"
    },
    {"useItem", "integer32"},
    {"usePackage", "integer32"},
    {"mode", "integer16"},
    {"index", "integer16"},
    {"focus", "integer16"},
    {
      "indexChange",
      "boolean"
    },
    {
      "focusChange",
      "boolean"
    },
    {"listbox", "integer8"},
    {
      "listSelectStep",
      "integer8"
    },
    {"page", "integer8"},
    {
      "editWidgetMode",
      "integer8"
    },
    {
      "updatecount",
      "integer32"
    },
    {
      "updatenexttime",
      "boolean"
    },
    {"sorttype", "integer8"}
  }
  A0_0.work.chosenPackage = 0
  A0_0.work.chosenItem = 0
  A0_0.work.usePackage = 0
  A0_0.work.useItem = 0
  A0_0.work.chosenOperation = 0
  A0_0.work.focus = 0
  A0_0.work.sorttype = desktopWidget:getConfigWork(9)
  A0_0:setConfirmCondition("Button_SortStatus")
  A0_0:displaySortType(A0_0.work.sorttype)
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setControlProperty("ItemList_Maker", "FilteredSortKey", "sorttype")
  A0_0:setText("TextBlock_ItemHelp", "")
  A0_0:initListBox(1)
  A0_0:resetListBox(1)
  A0_0:setVisibility("Grid_ItemRare", false)
  A0_0:setVisibility("Grid_ItemTrade", false)
  A0_0:setVisibility("Grid_ItemDetail3", false)
  A0_0:setControlProperty("TextBlock_ItemListIsEmpty", "Focusable", true)
  A0_0:setInitialData(A1_1)
end
function ItemUseWidget.setInitialData(A0_2, A1_3)
  A0_2:setModal(true)
  A0_2:makeListFromPackage()
  A0_2.work.listbox = 1
  A0_2.work.focus = 0
  A0_2:updateWindowDisplay()
end
function ItemUseWidget.getListPropertyName(A0_4, A1_5)
  local L2_6
  L2_6 = "ItemList_Maker"
  return L2_6
end
function ItemUseWidget.setButtonEvents(A0_7, A1_8)
  local L2_9
  L2_9 = A0_7.getControlProperty
  L2_9 = L2_9(A0_7, A1_8, "Command")
  A0_7:setControlCommandCondition(A1_8, L2_9)
  A0_7:setControlCommandCondition(A1_8, "UILuaCommands.ButtonFocused")
end
function ItemUseWidget.updateWindowDisplay(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15
  L1_11 = A0_10.work
  L1_11 = L1_11.updatecount
  if L1_11 ~= 0 then
    L1_11 = false
    return L1_11
  end
  L2_12 = A0_10
  L1_11 = A0_10.setVisibility
  L3_13 = "Button_SortStatus"
  L4_14 = true
  L1_11(L2_12, L3_13, L4_14)
  L2_12 = A0_10
  L1_11 = A0_10.displaySortType
  L3_13 = A0_10.work
  L3_13 = L3_13.sorttype
  L1_11(L2_12, L3_13)
  L2_12 = A0_10
  L1_11 = A0_10.getListBoxFocusNum
  L3_13 = A0_10.work
  L3_13 = L3_13.listbox
  L4_14 = L1_11(L2_12, L3_13)
  if L1_11 > 0 then
    L5_15 = A0_10.getListBoxName
    L5_15 = L5_15(A0_10, A0_10.work.listbox)
    A0_10:setVisibility("Label_UseItemDetail", true)
    A0_10:setVisibility("TextBlock_ItemListIsEmpty", false)
    A0_10:setVisibility(L5_15, true)
    if A0_10.work.focus > L1_11 - 1 then
      A0_10.work.focus = L1_11 - 1
    end
    if 0 <= A0_10:focusToIndex(A0_10.work.listbox, A0_10.work.focus) then
      A0_10.work.index = A0_10:focusToIndex(A0_10.work.listbox, A0_10.work.focus)
    end
    A0_10:setControlProperty(L5_15, "SqwtFocusedIndex", A0_10.work.focus)
    A0_10:setFocusedIndex(L5_15, A0_10.work.focus)
    A0_10:setWindowFocus(L5_15)
    A0_10:displayFocusedItemHelp()
    A0_10.work.chosenPackage = 1
    A0_10.work.chosenItem = A0_10.work.index + 1
    if A0_10.work.useItem ~= A0_10.work.chosenItem then
      A0_10.work.useItem = A0_10.work.chosenItem
    end
  else
    L5_15 = A0_10.displayListEmptyMessage
    L5_15(A0_10)
  end
end
function ItemUseWidget.setWindowFocus(A0_16, A1_17)
  if A1_17 ~= nil and A1_17 ~= "" then
    A0_16:setLogicalFocus(A1_17)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_16 then
      A0_16:setKeyboardFocusedControl(A1_17)
    end
  end
end
function ItemUseWidget.getListBoxName(A0_18, A1_19)
  local L2_20
  L2_20 = "ListBox_ItemList"
  return L2_20
end
function ItemUseWidget.getListBoxItemNum(A0_21, A1_22)
  local L2_23, L3_24
  L3_24 = A0_21
  L2_23 = A0_21.getListPropertyCount
  return L2_23(L3_24, A0_21:getListPropertyName(A1_22))
end
function ItemUseWidget.getListBoxFocusNum(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30
  L3_28 = A0_25
  L2_27 = A0_25.getListBoxItemNum
  L4_29 = A1_26
  L2_27 = L2_27(L3_28, L4_29)
  L4_29 = A0_25
  L3_28 = A0_25.getListPropertyName
  L5_30 = A1_26
  L3_28 = L3_28(L4_29, L5_30)
  if L2_27 == 0 then
    L4_29 = 0
    L5_30 = 0
    return L4_29, L5_30, 0, 0
  end
  L5_30 = A0_25
  L4_29 = A0_25.getControlProperty
  L4_29 = L4_29(L5_30, L3_28, "FilteredCount")
  L5_30 = A0_25.work
  L5_30 = L5_30.focus
  if L4_29 < A0_25.work.focus then
    L5_30 = L4_29 - 1
  end
  return L4_29, 0, L4_29, L5_30
end
function ItemUseWidget.focusToIndex(A0_31, A1_32, A2_33)
  local L3_34
  L3_34 = A0_31.getListPropertyName
  L3_34 = L3_34(A0_31, A1_32)
  if A0_31:getListBoxFocusNum(A1_32) == 0 or A2_33 >= A0_31:getListBoxFocusNum(A1_32) then
    return -1
  else
    A0_31:setControlProperty(L3_34, "FilteredIndex", A2_33)
    return A0_31:getControlProperty(L3_34, "Index")
  end
end
function ItemUseWidget.indexToFocus(A0_35, A1_36, A2_37)
  local L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44
  L4_39 = A0_35
  L3_38 = A0_35.getListPropertyName
  L5_40 = A1_36
  L3_38 = L3_38(L4_39, L5_40)
  L4_39 = 0
  L5_40 = A0_35.getListBoxFocusNum
  L5_40 = L5_40(L6_41, L7_42)
  if L5_40 > 0 and A2_37 < L5_40 then
    for L9_44 = 0, A2_37 do
      if A0_35:getListProperty(L3_38, L9_44, "visibility") ~= "False" then
        L4_39 = L4_39 + 1
      end
    end
  end
  return L6_41
end
function ItemUseWidget.initListBox(A0_45, A1_46)
  local L2_47
  L2_47 = A0_45.getListBoxName
  L2_47 = L2_47(A0_45, A1_46)
  if L2_47 ~= "" then
    A0_45:setControlProperty(L2_47, "IntData.Value0", A1_46)
    A0_45:setControlCommandCondition(L2_47, "UILuaCommands.MouseEnteredItem")
    A0_45:setControlCommandCondition(L2_47, "UILuaCommands.AnchoredItem")
    A0_45:setControlCommandCondition(L2_47, "UILuaCommands.Selection")
    A0_45:setCancelCondition(L2_47)
  end
end
function ItemUseWidget.resetListBox(A0_48, A1_49)
  local L2_50, L3_51
  L3_51 = A0_48
  L2_50 = A0_48.getListBoxItemNum
  L2_50 = L2_50(L3_51, A1_49)
  L3_51 = A0_48.getListPropertyName
  L3_51 = L3_51(A0_48, A1_49)
  if L2_50 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_50 do
      L2_50 = L2_50 - 1
      A0_48:deleteListProperty(L3_51, L2_50)
    end
    A0_48:updateListProperty(L3_51)
  end
end
function ItemUseWidget.setItemToXml(A0_52, A1_53, A2_54, A3_55, A4_56, A5_57)
  local L6_58, L7_59, L8_60, L9_61, L10_62, L11_63, L12_64, L13_65, L14_66
  L7_59 = A0_52
  L6_58 = A0_52.getListPropertyName
  L8_60 = A1_53
  L6_58 = L6_58(L7_59, L8_60)
  L7_59, L8_60, L9_61, L10_62 = nil, nil, nil, nil
  L11_63 = worldMaster
  L12_64 = L11_63
  L11_63 = L11_63._getMyPlayer
  L11_63 = L11_63(L12_64)
  L12_64, L13_65 = nil, nil
  if A3_55 > 0 and A4_56 > 0 then
    L14_66 = L11_63._getItem
    L14_66 = L14_66(L11_63, A3_55, A4_56)
    L12_64 = L14_66
  end
  if L12_64 == nil then
    L14_66 = false
    return L14_66
  end
  L14_66 = desktopWidget
  L14_66 = L14_66.getPlayerItemInPackage
  L8_60, L9_61, L10_62, L14_66 = L14_66, A3_55, A4_56, L14_66(L14_66, A3_55, A4_56)
  L7_59 = L14_66
  L14_66 = L12_64._getNameIndex
  L14_66 = L14_66(L12_64)
  if L14_66 == -1 then
    L14_66 = 1
  end
  A0_52:setListProperty(L6_58, A2_54, "icon", L8_60)
  if L9_61 == true then
    A0_52:setListText(L6_58, A2_54, "stack", 225, L10_62)
  else
    A0_52:setListProperty(L6_58, A2_54, "stack", "")
  end
  if L7_59 == 1000001 then
    A0_52:setListText(L6_58, A2_54, "name", 3263, L10_62)
    A0_52:setListProperty(L6_58, A2_54, "stack", "")
  else
    A0_52:setListText(L6_58, A2_54, "name", 3202, L7_59, L14_66)
  end
  if L12_64:isUsable() == true then
    A0_52:setListPropertyVisibility(L6_58, A2_54, true)
  else
    A0_52:setListPropertyVisibility(L6_58, A2_54, false)
  end
  A0_52:setSortType(L6_58, A2_54, L12_64)
  if 0 < A0_52.work.updatecount and A0_52.work.sorttype ~= 0 then
    if A0_52:getControlProperty(L6_58, "FilteredIndex") == -1 then
      A0_52.work.focusChange = true
    elseif A0_52:getControlProperty(L6_58, "FilteredIndex") < A0_52.work.focus then
      A0_52.work.focusChange = true
    end
  end
  return true
end
function ItemUseWidget.setSortType(A0_67, A1_68, A2_69, A3_70)
  local L4_71, L5_72
  L4_71 = worldMaster
  L5_72 = L4_71
  L4_71 = L4_71._getMyPlayer
  L4_71 = L4_71(L5_72)
  L5_72 = A3_70
  if L5_72 == nil then
    L5_72 = L4_71:_getItem(1, A2_69 + 1)
  end
  if L5_72 == nil then
    return
  end
  desktopWidget:setSortType(A0_67, A1_68, A2_69, A0_67.work.sorttype, L5_72)
end
function ItemUseWidget.updateSortType(A0_73)
  local L1_74
  L1_74 = A0_73.getListPropertyName
  L1_74 = L1_74(A0_73)
  for _FORV_5_ = 1, A0_73:getListBoxItemNum(1) do
    A0_73:setSortType(L1_74, _FORV_5_ - 1)
  end
  A0_73:updateListProperty(L1_74)
end
function ItemUseWidget.getMoneyListIndex(A0_75, A1_76)
  local L2_77, L3_78
  L2_77 = 1
  if A1_76 == 1000001 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000102 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000101 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000103 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000107 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000106 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000104 then
    L3_78 = -1
    return L3_78
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000108 then
    L3_78 = -1
    return L3_78
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000109 then
    L3_78 = -1
    return L3_78
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000105 then
    L3_78 = -1
    return L3_78
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000111 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000110 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000112 then
    L3_78 = -1
    return L3_78
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000113 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000114 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000115 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000116 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000117 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000118 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000119 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000120 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000121 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000122 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  if A1_76 == 1000123 then
    return L2_77
  else
    L2_77 = L2_77 + 1
  end
  L3_78 = -1
  return L3_78
end
function ItemUseWidget.makeListFromPackage(A0_79, A1_80, A2_81)
  local L3_82, L4_83, L5_84, L6_85, L7_86, L8_87, L9_88, L10_89, L11_90, L12_91, L13_92, L14_93, L15_94, L16_95
  L3_82 = worldMaster
  L4_83 = L3_82
  L3_82 = L3_82._getMyPlayer
  L3_82 = L3_82(L4_83)
  L5_84 = A0_79
  L4_83 = A0_79.getListPropertyName
  L6_85 = 1
  L4_83 = L4_83(L5_84, L6_85)
  L6_85 = L3_82
  L5_84 = L3_82._getItemPackageCapacity
  L7_86 = 1
  L5_84 = L5_84(L6_85, L7_86)
  L7_86 = A0_79
  L6_85 = A0_79.setControlProperty
  L9_88 = A0_79
  L8_87 = A0_79.getListBoxName
  L10_89 = 1
  L8_87 = L8_87(L9_88, L10_89)
  L9_88 = "SourceFirstIndex"
  L10_89 = 0
  L6_85(L7_86, L8_87, L9_88, L10_89)
  L7_86 = A0_79
  L6_85 = A0_79.setControlProperty
  L9_88 = A0_79
  L8_87 = A0_79.getListBoxName
  L10_89 = 1
  L8_87 = L8_87(L9_88, L10_89)
  L9_88 = "SourceCount"
  L10_89 = L5_84
  L6_85(L7_86, L8_87, L9_88, L10_89)
  if A2_81 == nil then
    L6_85 = 0
    L7_86, L8_87, L9_88, L10_89 = nil, nil, nil, nil
    L12_91 = A0_79
    L11_90 = A0_79.getListPropertyName
    L11_90 = L11_90(L12_91, L13_92)
    L12_91 = A0_79.getListBoxItemNum
    L12_91 = L12_91(L13_92, L14_93)
    for L16_95 = 1, L5_84 do
      if A0_79:setItemToXml(1, L6_85, 1, L16_95) == true then
        L6_85 = L6_85 + 1
      end
    end
    if L12_91 > L6_85 then
      for L16_95 = L6_85, L12_91 - 1 do
        L12_91 = L12_91 - 1
        A0_79:deleteListProperty(L11_90, L12_91)
      end
    end
    L13_92(L14_93, L15_94)
  else
    L7_86 = A0_79
    L6_85 = A0_79.getListPropertyName
    L8_87 = 1
    L6_85 = L6_85(L7_86, L8_87)
    L8_87 = L3_82
    L7_86 = L3_82._getItem
    L9_88 = 1
    L10_89 = A2_81
    L7_86 = L7_86(L8_87, L9_88, L10_89)
    if L7_86 ~= nil then
      L8_87 = A0_79
      L7_86 = A0_79.setItemToXml
      L9_88 = 1
      L10_89 = A2_81 - 1
      L11_90 = 1
      L12_91 = A2_81
      L7_86(L8_87, L9_88, L10_89, L11_90, L12_91)
    else
      L8_87 = A0_79
      L7_86 = A0_79.getListBoxItemNum
      L9_88 = 1
      L7_86 = L7_86(L8_87, L9_88)
      L9_88 = A0_79
      L8_87 = A0_79.deleteListProperty
      L10_89 = L6_85
      L11_90 = L7_86 - 1
      L8_87(L9_88, L10_89, L11_90)
      L9_88 = A0_79
      L8_87 = A0_79.updateListProperty
      L10_89 = L6_85
      L8_87(L9_88, L10_89)
    end
  end
end
function ItemUseWidget.displayListEmptyMessage(A0_96)
  A0_96:setHidden("Label_UseItemDetail")
  A0_96:setVisibility("TextBlock_ItemListIsEmpty", true)
  A0_96:setVisibility("ListBox_ItemList", false)
  A0_96:setWindowFocus("TextBlock_ItemListIsEmpty")
  A0_96:setText("TextBlock_ItemHelp", "")
end
function ItemUseWidget.displayFocusedItemHelp(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102, L6_103
  L2_99 = A0_97
  L1_98 = A0_97.getListBoxFocusNum
  L3_100 = A0_97.work
  L3_100 = L3_100.listbox
  L1_98 = L1_98(L2_99, L3_100)
  if L1_98 == 0 then
  else
    L1_98 = 1
    L2_99 = A0_97.work
    L2_99 = L2_99.index
    L2_99 = L2_99 + 1
    L3_100 = worldMaster
    L4_101 = L3_100
    L3_100 = L3_100._getMyPlayer
    L3_100 = L3_100(L4_101)
    L5_102 = L3_100
    L4_101 = L3_100._getItem
    L6_103 = L1_98
    L4_101 = L4_101(L5_102, L6_103, L2_99)
    if L4_101 == nil then
      return
    end
    L6_103 = L4_101
    L5_102 = L4_101._getCatalogID
    L5_102 = L5_102(L6_103)
    L6_103 = A0_97.setText
    L6_103(A0_97, "TextBlock_ItemHelp", 3203, L5_102)
    L6_103 = A0_97.setVisibility
    L6_103(A0_97, "Grid_ItemRare", L4_101:isRareItem())
    L6_103 = A0_97.setVisibility
    L6_103(A0_97, "Grid_ItemTrade", L4_101:isExclusiveItem())
    L6_103 = L4_101.isFoodOrPotion
    L6_103 = L6_103(L4_101)
    if L6_103 == true then
      L6_103 = desktopWidget
      L6_103 = L6_103.setFoodOrPotionItemBonus
      L6_103 = L6_103(L6_103, A0_97, A0_97, L4_101, "", 0)
      A0_97:setVisibility("Grid_ItemDetail3", L6_103)
    else
      L6_103 = A0_97.setVisibility
      L6_103(A0_97, "Grid_ItemDetail3", false)
    end
  end
end
function ItemUseWidget.previousSequence(A0_104)
  A0_104:saveSortType()
  desktopWidget:closeWidgetDirect(A0_104)
end
function ItemUseWidget.processUICommandEvent(A0_105, A1_106, A2_107, A3_108, A4_109, A5_110)
  local L6_111, L7_112, L8_113
  L6_111 = A0_105.work
  L6_111 = L6_111.editWidgetMode
  if L6_111 ~= 0 then
    L6_111 = false
    return L6_111
  end
  L6_111 = A0_105.work
  L6_111 = L6_111.updatecount
  if L6_111 > 0 then
    L6_111 = false
    return L6_111
  end
  if A3_108 == "UILuaCommands.WidgetClose" then
    L7_112 = A0_105
    L6_111 = A0_105.previousSequence
    return L6_111(L7_112)
  elseif A3_108 == "UILuaCommands.Cancel" then
    L7_112 = A0_105
    L6_111 = A0_105.previousSequence
    return L6_111(L7_112)
  elseif A3_108 == "UILuaCommands.MouseEnteredItem" or A3_108 == "UILuaCommands.AnchoredItem" then
    if A5_110 == nil then
      L6_111 = false
      return L6_111
    end
    if A4_109 == nil or A4_109 < 0 then
      L6_111 = false
      return L6_111
    end
    L6_111 = A0_105.work
    L6_111.listbox = A5_110
    L6_111 = A0_105.work
    L6_111.focus = A4_109
    L7_112 = A0_105
    L6_111 = A0_105.getListPropertyName
    L8_113 = A0_105.work
    L8_113 = L8_113.listbox
    L6_111 = L6_111(L7_112, L8_113)
    L8_113 = A0_105
    L7_112 = A0_105.focusToIndex
    L7_112 = L7_112(L8_113, A0_105.work.listbox, A0_105.work.focus)
    if L7_112 >= 0 then
      L8_113 = A0_105.work
      L8_113.index = L7_112
    end
    L8_113 = A0_105.displayFocusedItemHelp
    L8_113(A0_105)
    L8_113 = false
    return L8_113
  elseif A3_108 == "UILuaCommands.Selection" then
    L6_111 = A0_105.work
    L6_111 = L6_111.focus
    if L6_111 == -1 then
      return
    end
    L7_112 = A0_105
    L6_111 = A0_105.getListPropertyName
    L8_113 = A0_105.work
    L8_113 = L8_113.listbox
    L6_111 = L6_111(L7_112, L8_113)
    L7_112 = A0_105.work
    L7_112 = L7_112.focus
    L8_113 = A0_105.getListBoxFocusNum
    L8_113 = L8_113(A0_105, A0_105.work.listbox)
    if L7_112 >= L8_113 then
      L8_113 = A0_105
      L7_112 = A0_105.updateWindowDisplay
      return L7_112(L8_113)
    end
    L8_113 = A0_105
    L7_112 = A0_105.getListProperty
    L7_112 = L7_112(L8_113, L6_111, A0_105.work.index, "catalog")
    if L7_112 == false then
      L8_113 = A0_105
      L7_112 = A0_105.updateWindowDisplay
      return L7_112(L8_113)
    end
    L7_112 = A0_105.work
    L7_112.chosenPackage = 1
    L7_112 = A0_105.work
    L8_113 = A0_105.work
    L8_113 = L8_113.index
    L8_113 = L8_113 + 1
    L7_112.chosenItem = L8_113
    L7_112 = worldMaster
    L8_113 = L7_112
    L7_112 = L7_112._getMyPlayer
    L7_112 = L7_112(L8_113)
    L8_113 = nil
    if L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForDeadTarget() == true then
      L8_113 = 8
    elseif L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForRelation() == true then
      if L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForRelation() == true then
        if L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForRelation() == true then
          L8_113 = 101
        else
          L8_113 = 3
        end
      elseif L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForRelation() == true then
        L8_113 = 4
      else
        L8_113 = 2
      end
    elseif L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForRelation() == true then
      if L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForRelation() == true then
        L8_113 = 6
      else
        L8_113 = 5
      end
    elseif L7_112:_getItem(A0_105.work.chosenPackage, A0_105.work.chosenItem):canUseForRelation() == true then
      L8_113 = 7
    else
      return
    end
    if L8_113 == 2 then
      A0_105.work.usePackage = A0_105.work.chosenPackage
      A0_105.work.useItem = A0_105.work.chosenItem
      if A0_105.work.usePackage == 1 and 0 < A0_105.work.useItem and L7_112:_getItemPackageCapacity(1) - L7_112:_getItemPackageFreeSpace(1) >= A0_105.work.useItem and desktopWidget:executeCharacterUseItem(A0_105.work.usePackage, A0_105.work.useItem, L7_112) == true then
        A0_105:previousSequence()
      end
      A0_105:updateWindowDisplay()
    elseif A0_105:requestSelectSubTarget(L8_113, false, false, true) == true then
      A0_105:saveSortType()
      A0_105.work.usePackage = A0_105.work.chosenPackage
      A0_105.work.useItem = A0_105.work.chosenItem
    end
    return
  elseif A3_108 == "UILuaCommands.Operate" then
    L7_112 = A0_105
    L6_111 = A0_105.changeSortType
    L6_111(L7_112)
    L6_111 = A0_105.work
    L6_111 = L6_111.index
    L8_113 = A0_105
    L7_112 = A0_105.updateSortType
    L7_112(L8_113)
    L8_113 = A0_105
    L7_112 = A0_105.indexToFocus
    L7_112 = L7_112(L8_113, A0_105.work.listbox, L6_111)
    if L7_112 > -1 then
      L8_113 = A0_105.work
      L8_113.focus = L7_112
    end
    L8_113 = A0_105.focusToIndex
    L8_113 = L8_113(A0_105, A0_105.work.listbox, A0_105.work.focus)
    if L8_113 >= 0 then
      A0_105.work.index = L8_113
    end
    A0_105:displaySortType(A0_105.work.sorttype)
    return true
  end
end
function ItemUseWidget.processSubTargetDecided(A0_114, A1_115, A2_116, A3_117, A4_118, A5_119, A6_120)
  if A1_115 ~= nil and A0_114.work.usePackage == 1 and A0_114.work.useItem > 0 and worldMaster:_getMyPlayer():_getItemPackageCapacity(1) - worldMaster:_getMyPlayer():_getItemPackageFreeSpace(1) >= A0_114.work.useItem then
    desktopWidget:executeCharacterUseItem(A0_114.work.usePackage, A0_114.work.useItem, A1_115)
  end
  A0_114:updateWindowDisplay()
end
function ItemUseWidget.updatePlayerItem(A0_121, A1_122, A2_123)
  local L3_124
  L3_124 = -1
  if A1_122 == 0 then
    A0_121.work.updatecount = A2_123
    return
  elseif A1_122 == 1 then
    A0_121:makeListFromPackage(A1_122, A2_123)
    L3_124 = 1
  end
  if 0 < A0_121.work.updatecount then
    A0_121.work.updatecount = A0_121.work.updatecount - 1
  end
  if A0_121.work.updatecount == 0 then
    if L3_124 == 1 then
      A0_121:updateListProperty(A0_121:getListPropertyName(L3_124))
    end
    A0_121:updateWindowDisplay()
  end
end
function ItemUseWidget.displaySortType(A0_125, A1_126)
  desktopWidget:displaySortType(A1_126, A0_125, "Button_SortStatus")
end
function ItemUseWidget.changeSortType(A0_127)
  A0_127.work.sorttype = desktopWidget:changeSortType(A0_127.work.sorttype)
end
function ItemUseWidget.saveSortType(A0_128)
  desktopWidget:saveSortType(A0_128.work.sorttype)
end
