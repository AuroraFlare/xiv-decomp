require("/Widget/Ask/AskBaseClass")
_defineClass("RewardSelectWidget", "AskBaseClass")
function RewardSelectWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function RewardSelectWidget.initAsk(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8, A7_9, A8_10, A9_11, A10_12, A11_13, A12_14, A13_15, A14_16, A15_17, A16_18, A17_19, A18_20, A19_21)
  local L20_22, L21_23, L22_24, L23_25, L24_26
  L23_25 = "index"
  L24_26 = "integer16"
  L23_25 = {L24_26, "integer16"}
  L24_26 = "focus"
  L24_26 = {"selected", "integer16"}
  L20_22._temp = L21_23
  L20_22.initialized = false
  L21_23.index = 0
  L20_22.listbox = L22_24
  L20_22.bonus1 = false
  L20_22.bonus2 = false
  L20_22.bonus3 = false
  L20_22.itemlife = false
  L20_22.bazaar = false
  L20_22.closeok = false
  L20_22.sorttype = 0
  L23_25 = "@"
  L24_26 = tostring
  L24_26 = L24_26(3461)
  L23_25 = L23_25 .. L24_26
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = 3462
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = 3463
  L20_22(L21_23, L22_24, L23_25)
  L20_22(L21_23)
  for L23_25 = 1, 5 do
    L24_26 = "TabItem_"
    L24_26 = L24_26 .. tostring(L23_25)
    A0_2:setCancelCondition(L24_26)
  end
  L23_25 = "UILuaCommands.TabChanged"
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = 214
  L24_26 = 10091
  L20_22(L21_23, L22_24, L23_25, L24_26)
  L23_25 = 214
  L24_26 = 10093
  L20_22(L21_23, L22_24, L23_25, L24_26)
  L23_25 = ""
  L20_22(L21_23, L22_24, L23_25)
  L20_22(L21_23, L22_24)
  L23_25 = false
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = false
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = false
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = false
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = false
  L20_22(L21_23, L22_24, L23_25)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22(L21_23, L22_24)
  L20_22.listbox = 1
  L23_25 = A0_2
  L24_26 = 1
  L23_25 = false
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = true
  L20_22(L21_23, L22_24, L23_25)
  L23_25 = 1
  L23_25 = A0_2
  L24_26 = L20_22
  L22_24(L23_25, L24_26, "SourceFirstIndex", 0)
  L23_25 = A0_2
  L24_26 = L20_22
  L22_24(L23_25, L24_26, "SourceCount", 16)
  L23_25 = A0_2
  L24_26 = L21_23
  L22_24(L23_25, L24_26, "FilteredSortKey", "sorttype")
  L23_25 = A0_2
  L24_26 = A4_6
  L22_24(L23_25, L24_26, A5_7, A6_8, A7_9, A8_10, A9_11, A10_12, A11_13, A12_14, A13_15, A14_16, A15_17, A16_18, A17_19, A18_20, A19_21)
  L22_24.initialized = true
  L23_25 = A0_2
  L24_26 = 2
  L22_24(L23_25, L24_26)
  L23_25 = A0_2
  L24_26 = A0_2.getListBoxName
  L24_26 = L24_26(A0_2, 1)
  L22_24(L23_25, L24_26, true)
  L23_25 = A0_2
  L24_26 = "TextBlock_NoContents_1"
  L22_24(L23_25, L24_26, false)
  if A3_5 > 0 then
    L23_25 = A3_5 - 1
    L22_24.index = L23_25
    L23_25 = A3_5 - 1
    L22_24.focus = L23_25
  end
  L23_25 = A0_2
  L24_26 = true
  L22_24(L23_25, L24_26)
  L23_25 = A0_2
  L22_24(L23_25)
  L23_25 = A0_2
  L24_26 = "TabItem_1"
  L22_24(L23_25, L24_26, 1, 76022)
end
function RewardSelectWidget.setInitialData(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32, A6_33, A7_34, A8_35, A9_36, A10_37, A11_38, A12_39, A13_40, A14_41, A15_42, A16_43)
  A0_27:makeRewardItemList(1, A1_28)
  A0_27:makeRewardItemList(2, A2_29)
  A0_27:makeRewardItemList(3, A3_30)
  A0_27:makeRewardItemList(4, A4_31)
  A0_27:makeRewardItemList(5, A5_32)
  A0_27:makeRewardItemList(6, A6_33)
  A0_27:makeRewardItemList(7, A7_34)
  A0_27:makeRewardItemList(8, A8_35)
  A0_27:makeRewardItemList(9, A9_36)
  A0_27:makeRewardItemList(10, A10_37)
  A0_27:makeRewardItemList(11, A11_38)
  A0_27:makeRewardItemList(12, A12_39)
  A0_27:makeRewardItemList(13, A13_40)
  A0_27:makeRewardItemList(14, A14_41)
  A0_27:makeRewardItemList(15, A15_42)
  A0_27:makeRewardItemList(16, A16_43)
  A0_27:makeRewardItemList(-1, nil)
end
function RewardSelectWidget.processBeforeShow(A0_44, A1_45)
  local L2_46
  if A1_45 ~= true then
    L2_46 = true
    return L2_46
  end
  L2_46 = true
  return L2_46
end
function RewardSelectWidget.getListPropertyName(A0_47, A1_48)
  local L2_49
  if A1_48 == 1 then
    L2_49 = "TabItem_1_Maker"
    return L2_49
  elseif A1_48 == 2 then
    L2_49 = "TabItem_2_Maker"
    return L2_49
  elseif A1_48 == 3 then
    L2_49 = "TabItem_3_Maker"
    return L2_49
  elseif A1_48 == 4 then
    L2_49 = "TabItem_4_Maker"
    return L2_49
  elseif A1_48 == 5 then
    L2_49 = "TabItem_5_Maker"
    return L2_49
  elseif A1_48 == 8 then
    L2_49 = "SlotItem_Maker"
    return L2_49
  elseif A1_48 == 9 then
    L2_49 = "HelpCache_Maker"
    return L2_49
  end
end
function RewardSelectWidget.updateWindowDisplay(A0_50, A1_51)
  A0_50:setGridVisibility(3)
  A0_50:setVisibility("Button_SortStatus", false)
  if A1_51 == true then
    A0_50:updateListFocus()
  end
end
function RewardSelectWidget.updateListFocus(A0_52)
  local L1_53, L2_54, L3_55, L4_56, L5_57, L6_58
  L1_53 = A0_52.work
  L1_53 = L1_53.updatecount
  if L1_53 ~= 0 then
    L1_53 = false
    return L1_53
  end
  L2_54 = A0_52
  L1_53 = A0_52.getListBoxFocusNum
  L3_55 = A0_52.work
  L3_55 = L3_55.listbox
  L4_56 = L1_53(L2_54, L3_55)
  L6_58 = A0_52
  L5_57 = A0_52.getListBoxName
  L5_57 = L5_57(L6_58, A0_52.work.listbox)
  L6_58 = "TextBlock_NoContents_1"
  if L1_53 == 0 then
    if A0_52:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
      A0_52:closeShopEdit(false)
    end
    A0_52:setVisibility(L6_58, true)
    A0_52:setVisibility(L5_57, false)
    A0_52:displayHelp(3140)
    A0_52:setGridVisibility(2)
    A0_52:setWindowFocus(L6_58)
  else
    A0_52:setVisibility(L5_57, true)
    A0_52:setVisibility(L6_58, false)
    if A0_52.work.focus > L1_53 - 1 then
      A0_52.work.focus = L1_53 - 1
    end
    if 0 <= A0_52:focusToIndex(A0_52.work.listbox, A0_52.work.focus) then
      A0_52.work.index = A0_52:focusToIndex(A0_52.work.listbox, A0_52.work.focus)
    end
    A0_52:setControlProperty(L5_57, "SqwtFocusedIndex", A0_52.work.focus)
    A0_52:setWindowFocus(L5_57)
    A0_52:setFocusedIndex(L5_57, A0_52.work.focus)
    A0_52:displayFocusedItemHelp()
  end
end
function RewardSelectWidget.setGridVisibility(A0_59, A1_60)
  A0_59:setVisibility("Grid_ActorName", false)
  A0_59:setVisibility("Grid_Help", A1_60 == 2)
  A0_59:setVisibility("Grid_TabList", true)
  A0_59:setVisibility("Grid_BackpackAndGil", true)
  A0_59:setVisibility("Grid_ItemNameBase", A1_60 == 1 or A1_60 == 2 or A1_60 == 3 or A1_60 == 4)
  A0_59:setVisibility("Grid_ItemDetail1", A0_59.work.bonus1)
  A0_59:setVisibility("Grid_ItemDetail2", A0_59.work.bonus2)
  A0_59:setVisibility("Grid_ItemDetail3", A0_59.work.bonus3 or A0_59.work.itemlife or A0_59.work.bazaar)
  A0_59:setVisibility("Label_ItemBonus5", A0_59.work.bonus3)
  A0_59:setVisibility("Grid_ItemLife", A0_59.work.itemlife)
  A0_59:setVisibility("Grid_ItemBazaarInformation", A0_59.work.bazaar)
  A0_59:setVisibility("Grid_MateriaAttachBazaarInformation", false)
end
function RewardSelectWidget.setWindowFocus(A0_61, A1_62)
  if A1_62 ~= nil and A1_62 ~= "" then
    A0_61:setLogicalFocus(A1_62)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_61 then
      A0_61:setKeyboardFocusedControl(A1_62)
    end
  end
end
function RewardSelectWidget.displayBagcapacityAndMoney(A0_63)
  local L1_64, L2_65, L3_66
  L1_64 = worldMaster
  L2_65 = L1_64
  L1_64 = L1_64._getMyPlayer
  L1_64 = L1_64(L2_65)
  L3_66 = L1_64
  L2_65 = L1_64.getMoneyOnHand
  L2_65 = L2_65(L3_66)
  L3_66 = A0_63.setText
  L3_66(A0_63, "TextBlock_Gil", 3263, L2_65)
  L3_66 = L1_64._getItemPackageCapacity
  L3_66 = L3_66(L1_64, 1)
  A0_63:setText("TextBlock_ItemStack_2", 3551, L3_66 - L1_64:_getItemPackageFreeSpace(1), L3_66)
end
function RewardSelectWidget.getSelectedTab(A0_67)
  return A0_67:getSelectedIndex("TabControl_ItemList") + 1
end
function RewardSelectWidget.getListBoxName(A0_68, A1_69)
  local L2_70
  if A1_69 == 1 then
    L2_70 = "ListBox_TabItem_1"
    return L2_70
  elseif A1_69 == 2 then
    L2_70 = "ListBox_TabItem_2"
    return L2_70
  elseif A1_69 == 3 then
    L2_70 = "ListBox_TabItem_3"
    return L2_70
  elseif A1_69 == 4 then
    L2_70 = "ListBox_TabItem_4"
    return L2_70
  elseif A1_69 == 5 then
    L2_70 = "ListBox_TabItem_5"
    return L2_70
  else
    L2_70 = ""
    return L2_70
  end
end
function RewardSelectWidget.getListBoxItemNum(A0_71, A1_72)
  local L2_73, L3_74
  L3_74 = A0_71
  L2_73 = A0_71.getListPropertyCount
  return L2_73(L3_74, A0_71:getListPropertyName(A1_72))
end
function RewardSelectWidget.getListBoxFocusNum(A0_75, A1_76)
  local L2_77, L3_78, L4_79, L5_80
  L3_78 = A0_75
  L2_77 = A0_75.getListBoxItemNum
  L4_79 = A1_76
  L2_77 = L2_77(L3_78, L4_79)
  L4_79 = A0_75
  L3_78 = A0_75.getListPropertyName
  L5_80 = A1_76
  L3_78 = L3_78(L4_79, L5_80)
  if L2_77 == 0 then
    L4_79 = 0
    L5_80 = 0
    return L4_79, L5_80, 0, 0
  end
  L5_80 = A0_75
  L4_79 = A0_75.getControlProperty
  L4_79 = L4_79(L5_80, L3_78, "FilteredCount")
  L5_80 = A0_75.work
  L5_80 = L5_80.focus
  if L4_79 < A0_75.work.focus then
    L5_80 = L4_79 - 1
  end
  return L4_79, L4_79 - 1, 0, L5_80
end
function RewardSelectWidget.focusToIndex(A0_81, A1_82, A2_83)
  local L3_84
  L3_84 = A0_81.getListPropertyName
  L3_84 = L3_84(A0_81, A1_82)
  if A0_81:getListBoxFocusNum(A1_82) == 0 or A2_83 >= A0_81:getListBoxFocusNum(A1_82) then
    return -1
  else
    A0_81:setControlProperty(L3_84, "FilteredIndex", A2_83)
    return A0_81:getControlProperty(L3_84, "Index")
  end
end
function RewardSelectWidget.indexToFocus(A0_85, A1_86, A2_87)
  local L3_88, L4_89
  L3_88 = -1
  L4_89 = A0_85.getListPropertyName
  L4_89 = L4_89(A0_85, A1_86)
  if A0_85:getListBoxFocusNum(A1_86) > 0 then
    A0_85:setControlProperty(L4_89, "Index", A2_87)
    L3_88 = A0_85:getControlProperty(L4_89, "FilteredIndex")
  end
  A0_85:setControlProperty(L4_89, "Index", A0_85.work.index)
  return L3_88
end
function RewardSelectWidget.initListBox(A0_90, A1_91)
  local L2_92, L3_93
  L3_93 = A0_90
  L2_92 = A0_90.getListBoxName
  L2_92 = L2_92(L3_93, A1_91)
  if L2_92 ~= "" then
    L3_93 = A0_90.setControlProperty
    L3_93(A0_90, L2_92, "IntData.Value0", A1_91)
    L3_93 = A0_90.setControlCommandCondition
    L3_93(A0_90, L2_92, "UILuaCommands.MouseEnteredItem")
    L3_93 = A0_90.setControlCommandCondition
    L3_93(A0_90, L2_92, "UILuaCommands.AnchoredItem")
    L3_93 = A0_90.setControlCommandCondition
    L3_93(A0_90, L2_92, "UILuaCommands.Selection")
    L3_93 = A0_90.setCancelCondition
    L3_93(A0_90, L2_92)
    L3_93 = A0_90.setVisibility
    L3_93(A0_90, L2_92, true)
    L3_93 = "TextBlock_NoContents_"
    L3_93 = L3_93 .. tostring(A1_91)
    A0_90:setVisibility(L3_93, false)
    A0_90:setControlProperty(L3_93, "IsTabStop", true)
    A0_90:setCancelCondition(L3_93)
    A0_90:setControlCommandCondition(L2_92, "UILuaCommands.Previous")
    A0_90:setControlCommandCondition(L2_92, "UILuaCommands.Next")
  end
end
function RewardSelectWidget.resetListBox(A0_94, A1_95)
  local L2_96, L3_97
  L3_97 = A0_94
  L2_96 = A0_94.getListBoxItemNum
  L2_96 = L2_96(L3_97, A1_95)
  L3_97 = A0_94.getListPropertyName
  L3_97 = L3_97(A0_94, A1_95)
  if L2_96 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_96 do
      L2_96 = L2_96 - 1
      A0_94:deleteListProperty(L3_97, L2_96)
    end
    A0_94:updateListProperty(L3_97)
  end
end
function RewardSelectWidget.setItemToXml(A0_98, A1_99, A2_100, A3_101)
  local L4_102, L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109, L12_110
  L5_103 = A0_98
  L4_102 = A0_98.getListPropertyName
  L6_104 = A1_99
  L4_102 = L4_102(L5_103, L6_104)
  L5_103, L6_104, L7_105 = nil, nil, nil
  L8_106 = 1
  L9_107 = worldMaster
  L10_108 = L9_107
  L9_107 = L9_107._getMyPlayer
  L9_107 = L9_107(L10_108)
  L10_108, L11_109 = nil, nil
  L12_110 = L9_107.createVirtualItem
  L12_110 = L12_110(L9_107, A3_101, L8_106)
  L10_108 = L12_110
  if L10_108 == nil then
    L12_110 = false
    return L12_110
  end
  L12_110 = L10_108.getItemIcon
  L12_110 = L12_110(L10_108)
  L5_103 = L12_110
  L12_110 = L10_108._isStackable
  L12_110 = L12_110(L10_108)
  L6_104 = L12_110
  L12_110 = L10_108._countStack
  L12_110 = L12_110(L10_108)
  L7_105 = L12_110
  L12_110 = "TBL_null"
  desktopWidget:setItemToXml(A0_98, L4_102, A2_100, L10_108, L12_110, A3_101, L5_103, L6_104, L7_105, L8_106, A0_98.work.sorttype, false, false, 22, nil, nil, nil, false)
  desktopWidget:setItemDetailToXml(A0_98, L4_102, A2_100, L10_108, L8_106, nil, 22, nil)
  return true
end
function RewardSelectWidget.makeRewardItemList(A0_111, A1_112, A2_113)
  local L3_114
  L3_114 = A0_111.getListPropertyName
  L3_114 = L3_114(A0_111, 1)
  if A1_112 == -1 then
    A0_111:updateListProperty(L3_114)
    return
  end
  if A2_113 == nil then
    return
  end
  A0_111:setItemToXml(1, A1_112 - 1, A2_113)
end
function RewardSelectWidget.displayHelp(A0_115, A1_116)
  A0_115:setText("TextBlock_Help", A1_116)
end
function RewardSelectWidget.displayFocusedItemHelp(A0_117)
  local L1_118, L2_119, L3_120, L4_121, L5_122, L6_123, L7_124
  L2_119 = A0_117
  L1_118 = A0_117.getListBoxItemNum
  L3_120 = A0_117.work
  L3_120 = L3_120.listbox
  L1_118 = L1_118(L2_119, L3_120)
  if L1_118 == 0 then
    L1_118 = false
    return L1_118
  end
  L2_119 = A0_117
  L1_118 = A0_117.getListBoxItemNum
  L3_120 = A0_117.work
  L3_120 = L3_120.listbox
  L1_118 = L1_118(L2_119, L3_120)
  L2_119 = A0_117.work
  L2_119 = L2_119.index
  if L1_118 <= L2_119 then
    L1_118 = false
    return L1_118
  end
  L2_119 = A0_117
  L1_118 = A0_117.getListPropertyName
  L3_120 = A0_117.work
  L3_120 = L3_120.listbox
  L1_118 = L1_118(L2_119, L3_120)
  L2_119 = worldMaster
  L3_120 = L2_119
  L2_119 = L2_119._getMyPlayer
  L2_119 = L2_119(L3_120)
  L3_120 = desktopWidget
  L4_121 = L3_120
  L3_120 = L3_120.setItemDetail
  L5_122 = A0_117
  L6_123 = nil
  L7_124 = L1_118
  L3_120(L4_121, L5_122, L6_123, L7_124, A0_117.work.index)
  L3_120 = A0_117.work
  L3_120.bazaar = false
  L4_121 = A0_117
  L3_120 = A0_117.setVisibility
  L5_122 = "Grid_RewardMoney"
  L6_123 = false
  L3_120(L4_121, L5_122, L6_123)
  L4_121 = A0_117
  L3_120 = A0_117.setVisibility
  L5_122 = "Grid_RewardItem"
  L6_123 = false
  L3_120(L4_121, L5_122, L6_123)
  L3_120 = nil
  L4_121 = 0
  L5_122 = 0
  L6_123 = 0
  L7_124 = 0
  L4_121 = A0_117:getListProperty(L1_118, A0_117.work.index, "firstSlot")
  L5_122 = A0_117:getListProperty(L1_118, A0_117.work.index, "secondSlot")
  L6_123 = A0_117:getListProperty(L1_118, A0_117.work.index, "thirdSlot")
  L7_124 = A0_117:getListProperty(L1_118, A0_117.work.index, "fourthSlot")
  if L4_121 ~= 0 then
    L3_120 = L2_119:_getEquippingItem(L4_121)
  end
  if L3_120 == nil and L5_122 ~= 0 then
    L3_120 = L2_119:_getEquippingItem(L5_122)
  end
  if L3_120 == nil and L6_123 ~= 0 then
    L3_120 = L2_119:_getEquippingItem(L6_123)
  end
  if L3_120 == nil and L7_124 ~= 0 then
    L3_120 = L2_119:_getEquippingItem(L7_124)
  end
  A0_117.work.bonus1, A0_117.work.bonus2, A0_117.work.bonus3, A0_117.work.itemlife = desktopWidget:setItemDetailEquip(A0_117, nil, L1_118, A0_117.work.index, L3_120, true, false, false, true)
  A0_117:setVisibility("Border_ItemLife_IconCaution", false)
  A0_117:setVisibility("Border_ItemLife_IconDanger", false)
  A0_117:updateWindowDisplay(false)
end
function RewardSelectWidget.processUICommandOperate(A0_125, A1_126, A2_127, A3_128, A4_129)
  if A0_125:isAskFinish() == true then
    return false
  end
  if A2_127 == "TOG_itemDetail" then
    if A0_125.work.page == 0 and A0_125.work.itemlife == true then
      A0_125.work.page = 1
    else
      A0_125.work.page = 0
    end
    A0_125:displayFocusedItemHelp()
    return
  end
end
function RewardSelectWidget.processUICommandCancel(A0_130, A1_131, A2_132, A3_133, A4_134)
  A0_130:setBaseAskResult(-1)
end
function RewardSelectWidget.processUICommandClose(A0_135, A1_136, A2_137, A3_138, A4_139)
  A0_135:setBaseAskResult(-1)
end
function RewardSelectWidget.processUICommandSelection(A0_140, A1_141, A2_142, A3_143, A4_144)
  if A0_140:isAskFinish() == true then
    return false
  end
  A0_140.work.focus = A3_143
  A0_140.work.listbox = A4_144
  if A0_140:getListBoxItemNum(A0_140.work.listbox) == 0 then
    return A0_140:updateWindowDisplay(true)
  end
  if A0_140.work.focus >= A0_140:getListBoxFocusNum(A0_140.work.listbox) then
    return A0_140:updateListFocus()
  end
  A0_140:updateWindowDisplay(true)
  A0_140:selectedBorder(A0_140.work.index, true)
  A0_140:setBaseAskResult(A0_140.work.index + 1)
end
function RewardSelectWidget.processUICommandDefault(A0_145, A1_146, A2_147, A3_148, A4_149, A5_150)
  if A0_145:isAskFinish() == true then
    return false
  end
  if A3_148 == "UILuaCommands.MouseEnteredItem" or A3_148 == "UILuaCommands.AnchoredItem" then
    if A5_150 == nil then
      return
    end
    if A4_149 == nil or A4_149 < 0 then
      return
    end
    A0_145.work.listbox = A5_150
    A0_145.work.focus = A4_149
    A0_145:setCommonTimer(0.2)
  elseif A3_148 == "UILuaCommands.Previous" then
    A0_145:catalogSkip(-1)
  elseif A3_148 == "UILuaCommands.Next" then
    A0_145:catalogSkip(1)
  end
end
function RewardSelectWidget.processTimer(A0_151)
  if A0_151:focusToIndex(A0_151.work.listbox, A0_151.work.focus) >= 0 then
    A0_151.work.index = A0_151:focusToIndex(A0_151.work.listbox, A0_151.work.focus)
  end
  A0_151.work.page = 0
  A0_151:updateWindowDisplay(true)
  if A0_151.work.selected ~= -1 then
    A0_151:selectedBorder()
  end
end
function RewardSelectWidget.catalogSkip(A0_152, A1_153)
  local L2_154
  L2_154 = A0_152.work
  L2_154 = L2_154.focus
  if A0_152:getListBoxFocusNum(A0_152.work.listbox) - 1 == -1 then
    return
  end
  L2_154 = L2_154 + 10 * A1_153
  if A0_152:getListBoxFocusNum(A0_152.work.listbox) - 1 < L2_154 then
    L2_154 = A0_152:getListBoxFocusNum(A0_152.work.listbox) - 1
  elseif L2_154 < 0 then
    L2_154 = 0
  end
  if L2_154 ~= A0_152.work.focus then
    A0_152.work.focus = L2_154
    A0_152:updateWindowDisplay(true)
  end
end
function RewardSelectWidget.selectedBorder(A0_155, A1_156, A2_157)
  local L3_158, L4_159
  L3_158 = A0_155.getListPropertyName
  L3_158 = L3_158(L4_159, A0_155.work.listbox)
  if A1_156 ~= nil then
    A0_155:setListProperty(L3_158, A0_155.work.index, "selected", L4_159)
    A0_155.work.selected = A0_155.work.index
  else
    for _FORV_7_ = 1, A0_155:getListBoxItemNum(A0_155.work.listbox) do
      A0_155:setListProperty(L3_158, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_159.selected = -1
  end
  L4_159(A0_155, L3_158)
end
function RewardSelectWidget.updatePlayerItem(A0_160, A1_161, A2_162)
  local L3_163
  L3_163 = -1
  if A1_161 == 0 then
    A0_160.work.updatecount = A2_162
    return
  else
  end
  if 0 < A0_160.work.updatecount then
    A0_160.work.updatecount = A0_160.work.updatecount - 1
  end
  if A0_160.work.updatecount == 0 then
    A0_160:displayBagcapacityAndMoney()
  end
  return
end
function RewardSelectWidget.setAskParameter(A0_164)
  A0_164:updateWindowDisplay(true)
end
