require("/Widget/WidgetBaseClass")
_defineClass("ItemSelectWidget", "WidgetBaseClass")
function ItemSelectWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "SubItemListWidget"
  return L1_1
end
function ItemSelectWidget.init(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7)
  A0_2.work._temp = {
    {"chosenItem", "integer32"},
    {
      "chosenPackage",
      "integer32"
    },
    {
      "chosenOperation",
      "integer32"
    },
    {"mode", "integer16"},
    {"index", "integer16"},
    {"focus", "integer16"},
    {"selected", "integer16"},
    {"prevIndex", "integer16"},
    {"prevFocus", "integer16"},
    {"prevCount", "integer16"},
    {
      "indexChange",
      "boolean"
    },
    {
      "focusChange",
      "boolean"
    },
    {"listbox", "integer8"},
    {"page", "integer8"},
    {"bonus1", "boolean"},
    {"bonus2", "boolean"},
    {"bonus3", "boolean"},
    {"itemlife", "boolean"},
    {"bazaar", "boolean"},
    {
      "isRewardMode",
      "boolean"
    },
    {"isRetainer", "boolean"},
    {"rewardItem", "integer32"},
    {
      "rewardItemPackage",
      "integer32"
    },
    {
      "orderCatalog",
      "integer32"
    },
    {"orderStack", "integer32"},
    {
      "orderQuality",
      "integer8"
    },
    {
      "updatecount",
      "integer32"
    },
    {
      "updatecountbaz",
      "integer32"
    },
    {"closeok", "boolean"},
    {"demandSync", "boolean"},
    {"moneyIndex", "integer16"},
    {"moneyCount", "integer32"},
    {
      "playerBagCapacity",
      "integer16"
    },
    {
      "playerMoneyCapacity",
      "integer16"
    },
    {
      "playerMoneyIndex",
      "integer16"
    },
    {
      "playerMoneyCount",
      "integer32"
    },
    {
      "retainerBagCapacity",
      "integer16"
    },
    {
      "retainerMoneyCapacity",
      "integer16"
    },
    {
      "retainerMoneyIndex",
      "integer16"
    },
    {
      "retainerMoneyCount",
      "integer32"
    },
    {"sorttype", "integer8"},
    {"submenu", "boolean"}
  }
  A0_2.work.chosenItem = 0
  A0_2.work.chosenOperation = 0
  A0_2.work.isRewardMode = false
  A0_2.work.bonus1 = false
  A0_2.work.bonus2 = false
  A0_2.work.bonus3 = false
  A0_2.work.itemlife = false
  A0_2.work.bazaar = false
  A0_2.work.closeok = false
  A0_2.work.demandSync = false
  A0_2.work.sorttype = desktopWidget:getConfigWork(9)
  A0_2.work.focus = 0
  A0_2.work.submenu = false
  A0_2:setDrag(true)
  A0_2:initForm()
  A0_2:initListBox(1)
  A0_2:initListBox(2)
  A0_2:initListBox(3)
  A0_2:initListBox(4)
  A0_2:initListBox(5)
  A0_2:setVisibility("TabItem_3", false)
  A0_2:setVisibility("TabItem_4", false)
  A0_2:setVisibility("TabItem_5", false)
  A0_2.work.playerBagCapacity = worldMaster:_getMyPlayer():_getItemPackageCapacity(1)
  A0_2.work.playerMoneyCapacity = worldMaster:_getMyPlayer():_getItemPackageCapacity(100)
  if A5_7 == 4 then
    A0_2.work.retainerBagCapacity = desktopWidget:getRetainerItemPackageCapacity(1)
    A0_2.work.retainerMoneyCapacity = desktopWidget:getRetainerItemPackageCapacity(100)
  end
  A0_2:setInitialData(A1_3, A2_4, A3_5, A4_6, A5_7)
end
function ItemSelectWidget.setInitialData(A0_8, A1_9, A2_10, A3_11, A4_12, A5_13)
  local L6_14, L7_15
  L7_15 = A0_8
  L6_14 = A0_8.setModal
  L6_14(L7_15, A1_9)
  L6_14 = A0_8.work
  L6_14.mode = A2_10
  L6_14 = nil
  if A2_10 == 400 then
    L7_15 = A0_8.work
    L7_15.isRewardMode = true
    if A3_11 ~= nil then
      L7_15 = A0_8.work
      L7_15.rewardItemPackage = A3_11
    end
    if A4_12 ~= nil then
      L7_15 = A0_8.work
      L7_15.rewardItem = A4_12
    end
    if A5_13 == 4 then
      L7_15 = A0_8.work
      L7_15.isRetainer = true
      L7_15 = desktopWidget
      L7_15 = L7_15.getRetainerName
      L7_15 = L7_15(L7_15)
      if L7_15 ~= nil then
        A0_8:setText("TextBlock_ActorName", 230, L7_15)
      end
    else
      L7_15 = A0_8.work
      L7_15.isRetainer = false
    end
  elseif A2_10 == 440 then
    L7_15 = desktopWidget
    L7_15 = L7_15.getBazaarItem
    L7_15 = L7_15(L7_15, A3_11, A4_12)
    if L7_15 ~= nil then
      A0_8.work.orderCatalog = L7_15:_getCatalogID()
      A0_8.work.orderStack = L7_15:_countStack()
      A0_8.work.orderQuality = L7_15:_getNameIndex()
      L6_14 = L7_15:getItemProperPackage()
    end
  end
  L7_15 = A0_8.resetListBox
  L7_15(A0_8, 1)
  L7_15 = A0_8.resetListBox
  L7_15(A0_8, 2)
  L7_15 = A0_8.resetListBox
  L7_15(A0_8, 3)
  L7_15 = A0_8.resetListBox
  L7_15(A0_8, 4)
  L7_15 = A0_8.resetListBox
  L7_15(A0_8, 5)
  L7_15 = A0_8.setControlProperty
  L7_15(A0_8, A0_8:getListBoxName(1), "SourceFirstIndex", 0)
  L7_15 = A0_8.work
  L7_15 = L7_15.isRetainer
  if L7_15 == true then
    L7_15 = A0_8.setControlProperty
    L7_15(A0_8, A0_8:getListBoxName(1), "SourceCount", A0_8.work.retainerBagCapacity)
  else
    L7_15 = A0_8.setControlProperty
    L7_15(A0_8, A0_8:getListBoxName(1), "SourceCount", A0_8.work.playerBagCapacity)
  end
  L7_15 = A0_8.setControlProperty
  L7_15(A0_8, A0_8:getListPropertyName(1), "FilteredSortKey", "sorttype")
  L7_15 = A0_8.setControlProperty
  L7_15(A0_8, A0_8:getListBoxName(2), "SourceFirstIndex", 0)
  L7_15 = A0_8.work
  L7_15 = L7_15.isRetainer
  if L7_15 == true then
    L7_15 = A0_8.setControlProperty
    L7_15(A0_8, A0_8:getListBoxName(2), "SourceCount", A0_8.work.retainerMoneyCapacity)
  else
    L7_15 = A0_8.setControlProperty
    L7_15(A0_8, A0_8:getListBoxName(2), "SourceCount", A0_8.work.playerMoneyCapacity)
  end
  L7_15 = A0_8.setControlProperty
  L7_15(A0_8, A0_8:getListPropertyName(2), "FilteredSortKey", "sorttype")
  L7_15 = A0_8.makeListFromPackage
  L7_15(A0_8)
  L7_15 = A0_8.operateSort
  L7_15(A0_8, A0_8.work.sorttype)
  L7_15 = 3207
  if A2_10 == 440 then
    if L6_14 == 100 then
      A0_8.work.listbox = 2
      A0_8:setSelectedIndex("TabControl_ItemList", 1)
      L7_15 = 3208
    else
      A0_8.work.listbox = 1
      A0_8:setSelectedIndex("TabControl_ItemList", 0)
    end
  else
    A0_8.work.listbox = 1
    A0_8:setSelectedIndex("TabControl_ItemList", 0)
  end
  A0_8:changeList()
  A0_8:updateWindowDisplay(true)
  A0_8:setText("TextBlock_Title", L7_15)
end
function ItemSelectWidget.processBeforeShow(A0_16, A1_17)
  if A1_17 == true then
    A0_16:updateWindowDisplay(true)
  end
  return true
end
function ItemSelectWidget.getListPropertyName(A0_18, A1_19)
  local L2_20
  if A1_19 == 1 then
    L2_20 = "TabItem_1_Maker"
    return L2_20
  elseif A1_19 == 2 then
    L2_20 = "TabItem_2_Maker"
    return L2_20
  elseif A1_19 == 3 then
    L2_20 = "TabItem_3_Maker"
    return L2_20
  elseif A1_19 == 4 then
    L2_20 = "TabItem_4_Maker"
    return L2_20
  elseif A1_19 == 5 then
    L2_20 = "TabItem_5_Maker"
    return L2_20
  elseif A1_19 == 8 then
    L2_20 = "SlotItem_Maker"
    return L2_20
  elseif A1_19 == 9 then
    L2_20 = "HelpCache_Maker"
    return L2_20
  end
end
function ItemSelectWidget.initForm(A0_21)
  A0_21:setCancelCondition()
  A0_21:setCloseCondition()
  A0_21:setConfirmCondition("Button_SortStatus")
  A0_21:setCancelCondition("TabItem_1")
  A0_21:setCancelCondition("TabItem_2")
  A0_21:setControlCommandCondition("TabControl_ItemList", "UILuaCommands.TabChanged")
  A0_21:setConfirmCondition("Button_Back")
  A0_21:setCancelCondition("Button_Back")
  A0_21:setContent("Button_Back", 3115)
  A0_21:setControlCommandCondition("Button_Back", "UILuaCommands.ButtonFocused")
  A0_21:setText("TextBlock_ItemLifeHeader", 214, 10091)
  A0_21:setText("TextBlock_RepairMaterialHeader", 214, 10093)
  A0_21:setConfirmCondition("TOG_itemDetail")
  A0_21:setControlProperty("Button_Back", "Focusable", false)
  A0_21:setControlProperty("Button_Back", "IsTabStop", false)
  desktopWidget:setMateriaAttachSlotIconHelp(A0_21)
end
function ItemSelectWidget.updateWindowDisplay(A0_22, A1_23)
  if A0_22.work.mode == 400 then
    A0_22:setGridVisibility(3)
    if A0_22.work.listbox == 1 then
      A0_22:setVisibility("Button_SortStatus", true)
      A0_22:displaySortType(A0_22.work.sorttype)
    else
      A0_22:setVisibility("Button_SortStatus", false)
    end
  elseif A0_22.work.mode == 440 then
    A0_22:setGridVisibility(8)
  end
  if A1_23 == true then
    A0_22:updateListFocus()
  end
end
function ItemSelectWidget.updateListFocus(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29, L6_30
  L2_26 = A0_24
  L1_25 = A0_24.getListBoxFocusNum
  L3_27 = A0_24.work
  L3_27 = L3_27.listbox
  L4_28 = L1_25(L2_26, L3_27)
  L6_30 = A0_24
  L5_29 = A0_24.getListBoxName
  L5_29 = L5_29(L6_30, A0_24.work.listbox)
  L6_30 = "TextBlock_NoContents_"
  L6_30 = L6_30 .. tostring(A0_24.work.listbox)
  if L1_25 == 0 then
    A0_24:setVisibility(L6_30, true)
    A0_24:setVisibility(L5_29, false)
    A0_24:setWindowFocus(L6_30)
    A0_24:displayFocusedItemHelp()
    A0_24:setControlProperty("Button_Back", "Focusable", true)
    A0_24:setControlProperty("Button_Back", "IsTabStop", true)
  else
    A0_24:setVisibility(L5_29, true)
    A0_24:setVisibility(L6_30, false)
    if A0_24.work.focus > L1_25 - 1 then
      A0_24.work.focus = L1_25 - 1
    end
    if 0 <= A0_24:focusToIndex(A0_24.work.listbox, A0_24.work.focus) then
      A0_24.work.index = A0_24:focusToIndex(A0_24.work.listbox, A0_24.work.focus)
    end
    A0_24:setControlProperty(L5_29, "SqwtFocusedIndex", A0_24.work.focus)
    A0_24:setFocusedIndex(L5_29, A0_24.work.focus)
    A0_24:setWindowFocus(L5_29)
    A0_24:displayFocusedItemHelp()
  end
end
function ItemSelectWidget.setGridVisibility(A0_31, A1_32)
  A0_31:setVisibility("Grid_ActorName", A0_31.work.isRetainer)
  A0_31:setVisibility("Grid_Help", A1_32 == 1)
  A0_31:setVisibility("Grid_TabList", A1_32 == 1 or A1_32 == 3 or A1_32 == 8)
  if A0_31.work.listbox == 1 then
    A0_31:setVisibility("Button_SortStatus", true)
    A0_31:displaySortType(A0_31.work.sorttype)
  else
    A0_31:setVisibility("Button_SortStatus", false)
  end
  A0_31:setVisibility("Grid_BackpackAndGil", true)
  A0_31:setVisibility("Grid_ItemNameBase", A1_32 == 3 or A1_32 == 8)
  A0_31:setVisibility("Grid_ItemDetail1", A0_31.work.bonus1)
  A0_31:setVisibility("Grid_ItemDetail2", A0_31.work.bonus2)
  A0_31:setVisibility("Grid_ItemDetail3", A0_31.work.bonus3 or A0_31.work.itemlife or A0_31.work.bazaar)
  A0_31:setVisibility("Label_ItemBonus5", A0_31.work.bonus3)
  A0_31:setVisibility("Grid_ItemLife", A0_31.work.itemlife)
  A0_31:setVisibility("TOG_itemDetail", false)
  A0_31:setVisibility("Grid_Edit", false)
  A0_31:setVisibility("Grid_Button", true)
end
function ItemSelectWidget.setWindowFocus(A0_33, A1_34)
  if A1_34 ~= nil and A1_34 ~= "" then
    A0_33:setLogicalFocus(A1_34)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_33 then
      A0_33:setKeyboardFocusedControl(A1_34)
    end
  end
end
function ItemSelectWidget.displayBagcapacityAndMoney(A0_35)
  local L1_36, L2_37
  L1_36 = A0_35.work
  L1_36 = L1_36.playerMoneyCount
  L2_37 = A0_35.work
  L2_37 = L2_37.isRetainer
  if L2_37 == true then
    L2_37 = A0_35.work
    L1_36 = L2_37.retainerMoneyCount
  end
  L2_37 = A0_35.setText
  L2_37(A0_35, "TextBlock_Gil", 3263, L1_36)
  L2_37 = A0_35.work
  L2_37 = L2_37.playerBagCapacity
  if A0_35.work.isRetainer == true then
    L2_37 = A0_35.work.retainerBagCapacity
  end
  A0_35:setText("TextBlock_ItemStack_2", 3551, A0_35:getListBoxItemNum(1), L2_37)
end
function ItemSelectWidget.isExistItem(A0_38, A1_39, A2_40, A3_41)
  if A3_41 == nil or A3_41 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_39, A2_40) ~= nil then
      return true
    else
      return false
    end
  elseif A3_41 == 2 then
    if desktopWidget:getBazaarItem(A1_39, A2_40) ~= nil then
      return true
    else
      return false
    end
  elseif A3_41 == 4 then
    if desktopWidget:getRetainerItem(A1_39, A2_40) ~= nil then
      return true
    else
      return false
    end
  end
end
function ItemSelectWidget.checkPackageAndIndex(A0_42, A1_43, A2_44, A3_45, A4_46)
  if A4_46 == nil or A4_46 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A2_44, A3_45) == A1_43 then
      return true
    else
      return false
    end
  elseif A4_46 == 2 then
    if desktopWidget:getBazaarItem(A2_44, A3_45) == A1_43 then
      return true
    else
      return false
    end
  elseif A4_46 == 4 then
    if desktopWidget:getRetainerItem(A2_44, A3_45) == A1_43 then
      return true
    else
      return false
    end
  end
end
function ItemSelectWidget.getSelectedTab(A0_47)
  return A0_47:getSelectedIndex("TabControl_ItemList") + 1
end
function ItemSelectWidget.getListBoxName(A0_48, A1_49)
  local L2_50
  if A1_49 == 1 then
    L2_50 = "ListBox_TabItem_1"
    return L2_50
  elseif A1_49 == 2 then
    L2_50 = "ListBox_TabItem_2"
    return L2_50
  elseif A1_49 == 3 then
    L2_50 = "ListBox_TabItem_3"
    return L2_50
  elseif A1_49 == 4 then
    L2_50 = "ListBox_TabItem_4"
    return L2_50
  elseif A1_49 == 5 then
    L2_50 = "ListBox_TabItem_5"
    return L2_50
  else
    L2_50 = ""
    return L2_50
  end
end
function ItemSelectWidget.getListBoxItemNum(A0_51, A1_52)
  local L2_53, L3_54
  L3_54 = A0_51
  L2_53 = A0_51.getListPropertyCount
  return L2_53(L3_54, A0_51:getListPropertyName(A1_52))
end
function ItemSelectWidget.getListBoxFocusNum(A0_55, A1_56)
  local L2_57, L3_58, L4_59, L5_60
  L3_58 = A0_55
  L2_57 = A0_55.getListBoxItemNum
  L4_59 = A1_56
  L2_57 = L2_57(L3_58, L4_59)
  L4_59 = A0_55
  L3_58 = A0_55.getListPropertyName
  L5_60 = A1_56
  L3_58 = L3_58(L4_59, L5_60)
  if L2_57 == 0 then
    L4_59 = 0
    L5_60 = 0
    return L4_59, L5_60, 0, 0
  end
  L5_60 = A0_55
  L4_59 = A0_55._getProperty
  L4_59 = L4_59(L5_60, nil, L3_58, "FilteredCount")
  L5_60 = A0_55.work
  L5_60 = L5_60.focus
  if L4_59 < A0_55.work.focus then
    L5_60 = L4_59 - 1
  end
  return L4_59, L4_59 - 1, 0, L5_60
end
function ItemSelectWidget.focusToIndex(A0_61, A1_62, A2_63)
  local L3_64
  L3_64 = A0_61.getListPropertyName
  L3_64 = L3_64(A0_61, A1_62)
  if A0_61:getListBoxFocusNum(A1_62) == 0 or A2_63 >= A0_61:getListBoxFocusNum(A1_62) then
    return -1
  else
    A0_61:setControlProperty(L3_64, "FilteredIndex", A2_63)
    return A0_61:getControlProperty(L3_64, "Index")
  end
end
function ItemSelectWidget.indexToFocus(A0_65, A1_66, A2_67)
  local L3_68, L4_69
  L3_68 = -1
  L4_69 = A0_65.getListPropertyName
  L4_69 = L4_69(A0_65, A1_66)
  if A0_65:getListBoxFocusNum(A1_66) > 0 then
    A0_65:setControlProperty(L4_69, "Index", A2_67)
    L3_68 = A0_65:getControlProperty(L4_69, "FilteredIndex")
  end
  A0_65:setControlProperty(L4_69, "Index", A0_65.work.index)
  return L3_68
end
function ItemSelectWidget.initListBox(A0_70, A1_71)
  local L2_72, L3_73
  L3_73 = A0_70
  L2_72 = A0_70.getListBoxName
  L2_72 = L2_72(L3_73, A1_71)
  if L2_72 ~= "" then
    L3_73 = A0_70.setControlProperty
    L3_73(A0_70, L2_72, "IntData.Value0", A1_71)
    L3_73 = A0_70.setControlCommandCondition
    L3_73(A0_70, L2_72, "UILuaCommands.MouseEnteredItem")
    L3_73 = A0_70.setControlCommandCondition
    L3_73(A0_70, L2_72, "UILuaCommands.AnchoredItem")
    L3_73 = A0_70.setControlCommandCondition
    L3_73(A0_70, L2_72, "UILuaCommands.Selection")
    L3_73 = A0_70.setCancelCondition
    L3_73(A0_70, L2_72)
    L3_73 = A0_70.setVisibility
    L3_73(A0_70, L2_72, true)
    L3_73 = "TextBlock_NoContents_"
    L3_73 = L3_73 .. tostring(A1_71)
    A0_70:setVisibility(L3_73, false)
    A0_70:setText(L3_73, 3140)
    A0_70:setControlProperty(L3_73, "IsTabStop", true)
    A0_70:setControlCommandCondition(L2_72, "UILuaCommands.Previous")
    A0_70:setControlCommandCondition(L2_72, "UILuaCommands.Next")
  end
end
function ItemSelectWidget.resetListBox(A0_74, A1_75)
  local L2_76, L3_77
  L3_77 = A0_74
  L2_76 = A0_74.getListBoxItemNum
  L2_76 = L2_76(L3_77, A1_75)
  L3_77 = A0_74.getListPropertyName
  L3_77 = L3_77(A0_74, A1_75)
  if L2_76 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_76 do
      L2_76 = L2_76 - 1
      A0_74:deleteListProperty(L3_77, L2_76)
    end
    A0_74:updateListProperty(L3_77)
  end
  return
end
function ItemSelectWidget.getPackageFromList(A0_78, A1_79)
  local L2_80
  L2_80 = 1
  if A1_79 == 1 then
    L2_80 = 1
  elseif A1_79 == 2 then
    L2_80 = 100
  elseif A1_79 == 3 then
    L2_80 = 8
  elseif A1_79 == 4 then
    L2_80 = 5
  elseif A1_79 == 5 then
    L2_80 = 100
  end
  return L2_80
end
function ItemSelectWidget.setItemToXmlLight(A0_81, A1_82, A2_83, A3_84, A4_85, A5_86)
  local L6_87, L7_88, L8_89, L9_90, L10_91, L11_92, L12_93, L13_94, L14_95, L15_96, L16_97, L17_98, L18_99, L19_100
  L7_88 = A0_81
  L6_87 = A0_81.getListPropertyName
  L8_89 = A1_82
  L7_88 = L6_87(L7_88, L8_89)
  L8_89, L9_90, L10_91, L11_92 = nil, nil, nil, nil
  L12_93 = worldMaster
  L13_94 = L12_93
  L12_93 = L12_93._getMyPlayer
  L12_93 = L12_93(L13_94)
  L13_94, L14_95 = nil, nil
  if A3_84 > 0 and A4_85 > 0 then
    if A5_86 == 4 then
      L15_96 = desktopWidget
      L16_97 = L15_96
      L15_96 = L15_96.getRetainerItem
      L17_98 = A3_84
      L18_99 = A4_85
      L15_96 = L15_96(L16_97, L17_98, L18_99)
      L13_94 = L15_96
    else
      L16_97 = L12_93
      L15_96 = L12_93._getItem
      L17_98 = A3_84
      L18_99 = A4_85
      L15_96 = L15_96(L16_97, L17_98, L18_99)
      L13_94 = L15_96
    end
  end
  if L13_94 == nil then
    L15_96 = false
    return L15_96
  end
  L16_97 = L13_94
  L15_96 = L13_94._getCatalogID
  L15_96 = L15_96(L16_97)
  L8_89 = L15_96
  L16_97 = L13_94
  L15_96 = L13_94.getItemIcon
  L15_96 = L15_96(L16_97)
  L9_90 = L15_96
  L16_97 = L13_94
  L15_96 = L13_94._isStackable
  L15_96 = L15_96(L16_97)
  L10_91 = L15_96
  L16_97 = L13_94
  L15_96 = L13_94._countStack
  L15_96 = L15_96(L16_97)
  L11_92 = L15_96
  L16_97 = L13_94
  L15_96 = L13_94._getNameIndex
  L15_96 = L15_96(L16_97)
  L16_97 = "TBL_null"
  L17_98 = A0_81.work
  L17_98 = L17_98.isRewardMode
  if L17_98 == true then
    L17_98 = A0_81.work
    L17_98 = L17_98.rewardItemPackage
    if L17_98 == A3_84 then
      L17_98 = A0_81.work
      L17_98 = L17_98.rewardItem
      if L17_98 == A4_85 then
        L16_97 = "TBL_selectedItem"
      end
    end
  end
  if L8_89 == 1000001 then
    L17_98 = A0_81.work
    L17_98.moneyIndex = A4_85
    L17_98 = A0_81.work
    L17_98.moneyCount = L11_92
  end
  L17_98 = A0_81.work
  L17_98 = L17_98.sorttype
  L18_99 = 13
  L19_100 = A1_82
  if L19_100 == 1 then
    break
  else
  end
  if L19_100 == 2 then
    L17_98 = 11
    L18_99 = 14
    break
  else
  end
  if L19_100 == 3 then
    L17_98 = 0
    break
  else
  end
  if L19_100 == 4 then
    L17_98 = 0
    break
  else
  end
  if L19_100 == 5 then
    L17_98 = 12
    L18_99 = 15
    break
  else
  end
  L19_100 = true
  if A0_81.work.mode == 440 then
    if L8_89 == A0_81.work.orderCatalog and L15_96 == A0_81.work.orderQuality then
      if L11_92 >= A0_81.work.orderStack then
      else
        L19_100 = false
      end
    else
      L19_100 = false
    end
  end
  A0_81:setListPropertyVisibility(L6_87, A2_83, L19_100)
  if L19_100 then
    desktopWidget:setItemToXml(A0_81, L6_87, A2_83, L13_94, L16_97, L8_89, L9_90, L10_91, L11_92, L15_96, L17_98, true, false, L18_99, A3_84, A4_85, A5_86, false)
    if A0_81.work.mode == 400 then
      if L13_94:isExclusiveItem() then
      end
      if L13_94:_isEquipping() then
      end
      if true then
        A0_81:setListProperty(L6_87, A2_83, "opacity", "0.5")
      else
        A0_81:setListProperty(L6_87, A2_83, "opacity", "1.0")
      end
    end
    if 0 < A0_81.work.updatecount and A0_81.work.listbox == A1_82 and A0_81:getControlProperty(L6_87, "FilteredIndex") < A0_81.work.focus then
      A0_81.work.focusChange = true
    end
  end
  return true
end
function ItemSelectWidget.getMoneyListIndex(A0_101, A1_102)
  local L2_103, L3_104
  L2_103 = 1
  if A1_102 == 1000001 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000102 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000101 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000103 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000107 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000106 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000104 then
    L3_104 = -1
    return L3_104
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000108 then
    L3_104 = -1
    return L3_104
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000109 then
    L3_104 = -1
    return L3_104
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000105 then
    L3_104 = -1
    return L3_104
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000111 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000110 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000112 then
    L3_104 = -1
    return L3_104
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000113 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000114 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000115 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000116 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000117 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000118 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000119 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000120 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000121 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000122 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  if A1_102 == 1000123 then
    return L2_103
  else
    L2_103 = L2_103 + 1
  end
  L3_104 = -1
  return L3_104
end
function ItemSelectWidget.setSortType(A0_105, A1_106, A2_107, A3_108, A4_109)
  local L5_110
  if A0_105.work.isRetainer == true then
    L5_110 = desktopWidget:getRetainerItem(A4_109, A2_107 + 1)
  else
    L5_110 = worldMaster:_getMyPlayer():_getItem(A4_109, A2_107 + 1)
  end
  if L5_110 == nil then
    return false
  end
  desktopWidget:setSortType(A0_105, A1_106, A2_107, A0_105.work.sorttype, L5_110)
end
function ItemSelectWidget.updateSortType(A0_111)
  local L1_112, L2_113
  L2_113 = A0_111
  L1_112 = A0_111.getListPropertyName
  L1_112 = L1_112(L2_113, 1)
  L2_113 = A0_111.getPackageFromList
  L2_113 = L2_113(A0_111, 1)
  for _FORV_6_ = 1, A0_111:getListBoxItemNum(1) do
    A0_111:setSortType(L1_112, _FORV_6_ - 1, A0_111.work.sorttype, L2_113)
  end
  A0_111:updateListProperty(L1_112)
end
function ItemSelectWidget.makeListFromPackage(A0_114, A1_115, A2_116)
  local L3_117, L4_118, L5_119, L6_120, L7_121, L8_122, L9_123, L10_124, L11_125, L12_126, L13_127
  L3_117 = worldMaster
  L4_118 = L3_117
  L3_117 = L3_117._getMyPlayer
  L3_117 = L3_117(L4_118)
  L4_118, L5_119, L6_120, L7_121, L8_122, L9_123 = nil, nil, nil, nil, nil, nil
  if L10_124 == true then
    L9_123 = 4
  else
    L9_123 = 1
  end
  if A2_116 == nil then
    if A1_115 == 1 or A1_115 == nil then
      L4_118 = 0
      L5_119 = L10_124
      L6_120 = L10_124
      if L10_124 == true then
        if L10_124 == 0 then
          L13_127 = 1
          L10_124.retainerBagCapacity = L11_125
          L13_127 = A0_114
          L13_127 = "SourceCount"
          L10_124(L11_125, L12_126, L13_127, A0_114.work.retainerBagCapacity)
        end
        L7_121 = L10_124.retainerBagCapacity
      else
        if L10_124 == 0 then
          L13_127 = L10_124
          L11_125.playerBagCapacity = L12_126
          L13_127 = A0_114.getListBoxName
          L13_127 = L13_127(A0_114, 1)
          L11_125(L12_126, L13_127, "SourceCount", A0_114.work.playerBagCapacity)
        end
        L7_121 = L10_124.playerBagCapacity
      end
      for L13_127 = 1, L7_121 do
        if A0_114:setItemToXmlLight(1, L4_118, 1, L13_127, L9_123) == true then
          L4_118 = L4_118 + 1
        else
          break
        end
      end
      if L6_120 > L4_118 then
        for L13_127 = L4_118, L6_120 - 1 do
          L6_120 = L6_120 - 1
          A0_114:deleteListProperty(L5_119, L6_120)
        end
      end
      L10_124(L11_125, L12_126)
    end
    if A1_115 == 100 or A1_115 == nil then
      L10_124.moneyIndex = 0
      L10_124.moneyCount = 0
      if L10_124 == true then
        if L10_124 == 0 then
          L13_127 = 100
          L10_124.retainerMoneyCapacity = L11_125
          L13_127 = A0_114
          L13_127 = "SourceCount"
          L10_124(L11_125, L12_126, L13_127, A0_114.work.retainerMoneyCapacity)
        end
        L7_121 = L10_124.retainerMoneyCapacity
      else
        if L10_124 == 0 then
          L13_127 = L10_124
          L11_125.playerMoneyCapacity = L12_126
          L13_127 = A0_114.getListBoxName
          L13_127 = L13_127(A0_114, 2)
          L11_125(L12_126, L13_127, "SourceCount", A0_114.work.playerMoneyCapacity)
        end
        L7_121 = L10_124.playerMoneyCapacity
      end
      L4_118 = 0
      L6_120 = L10_124
      L5_119 = L10_124
      for L13_127 = 1, L7_121 do
        if A0_114:setItemToXmlLight(2, L4_118, 100, L13_127, L9_123) == true then
          L4_118 = L4_118 + 1
        else
          break
        end
      end
      if L6_120 > L4_118 then
        for L13_127 = L4_118, L6_120 - 1 do
          L6_120 = L6_120 - 1
          A0_114:deleteListProperty(L5_119, L6_120)
        end
      end
      if L9_123 == 4 then
        L10_124.retainerMoneyIndex = L11_125
        L10_124.retainerMoneyCount = L11_125
      else
        L10_124.playerMoneyIndex = L11_125
        L10_124.playerMoneyCount = L11_125
      end
      L10_124(L11_125, L12_126)
    end
  else
    if A1_115 == 1 then
    elseif A1_115 == 100 then
      if L9_123 == 4 then
        if A2_116 == L11_125 then
          L11_125.moneyIndex = 0
          L11_125.moneyCount = 0
        else
          L11_125.moneyIndex = L12_126
          L11_125.moneyCount = L12_126
        end
      elseif A2_116 == L11_125 then
        L11_125.moneyIndex = 0
        L11_125.moneyCount = 0
      else
        L11_125.moneyIndex = L12_126
        L11_125.moneyCount = L12_126
      end
    else
      return
    end
    L13_127 = L10_124
    if L12_126 == false then
      L13_127 = L3_117
      if L12_126 ~= nil then
        L13_127 = A0_114
        L12_126(L13_127, L10_124, A2_116 - 1, A1_115, A2_116, L9_123)
        if A1_115 == 100 then
          L13_127 = A0_114.work
          L13_127 = L13_127.playerMoneyIndex
          if L12_126 == L13_127 then
            L13_127 = A0_114.work
            L13_127 = L13_127.playerMoneyCount
          elseif L12_126 ~= L13_127 then
            L13_127 = A0_114.work
            L13_127 = L13_127.moneyIndex
            L12_126.playerMoneyIndex = L13_127
            L13_127 = A0_114.work
            L13_127 = L13_127.moneyCount
            L12_126.playerMoneyCount = L13_127
          end
        end
      else
        L13_127 = A0_114
        L13_127 = A0_114.deleteListProperty
        L13_127(A0_114, L11_125, L12_126 - 1)
        L13_127 = A0_114.updateListProperty
        L13_127(A0_114, L11_125)
        if A1_115 == 100 then
          L13_127 = A0_114.work
          L13_127 = L13_127.retainerMoneyIndex
          if A2_116 == L13_127 then
            L13_127 = A0_114.work
            L13_127.playerMoneyIndex = 0
            L13_127 = A0_114.work
            L13_127.playerMoneyCount = 0
          end
        end
      end
    else
      L13_127 = L12_126
      if L12_126 ~= nil then
        L13_127 = A0_114
        L12_126(L13_127, L10_124, A2_116 - 1, A1_115, A2_116, L9_123)
        if A1_115 == 100 then
          L13_127 = A0_114.work
          L13_127 = L13_127.retainerMoneyIndex
          if L12_126 == L13_127 then
            L13_127 = A0_114.work
            L13_127 = L13_127.retainerMoneyCount
          elseif L12_126 ~= L13_127 then
            L13_127 = A0_114.work
            L13_127 = L13_127.moneyIndex
            L12_126.retainerMoneyIndex = L13_127
            L13_127 = A0_114.work
            L13_127 = L13_127.moneyCount
            L12_126.retainerMoneyCount = L13_127
          end
        end
      else
        L13_127 = A0_114
        L13_127 = A0_114.deleteListProperty
        L13_127(A0_114, L11_125, L12_126 - 1)
        L13_127 = A0_114.updateListProperty
        L13_127(A0_114, L11_125)
        if A1_115 == 100 then
          L13_127 = A0_114.work
          L13_127 = L13_127.retainerMoneyIndex
          if A2_116 == L13_127 then
            L13_127 = A0_114.work
            L13_127.retainerMoneyIndex = 0
            L13_127 = A0_114.work
            L13_127.retainerMoneyCount = 0
          end
        end
      end
    end
  end
  L10_124(L11_125)
end
function ItemSelectWidget.displayHelp(A0_128, A1_129)
  A0_128:setText("TextBlock_Help", A1_129)
end
function ItemSelectWidget.displayFocusedItemHelp(A0_130)
  local L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137, L8_138, L9_139, L10_140, L11_141, L12_142, L13_143, L14_144, L15_145
  L2_132 = A0_130
  L1_131 = A0_130.getListBoxFocusNum
  L3_133 = A0_130.work
  L3_133 = L3_133.listbox
  L1_131 = L1_131(L2_132, L3_133)
  if L1_131 == 0 then
    L2_132 = A0_130
    L1_131 = A0_130.displayHelp
    L3_133 = 3140
    L1_131(L2_132, L3_133)
    L1_131 = A0_130.work
    L1_131.bonus1 = false
    L1_131 = A0_130.work
    L1_131.bonus2 = false
    L1_131 = A0_130.work
    L1_131.bonus3 = false
    L1_131 = A0_130.work
    L1_131.itemlife = false
    L1_131 = A0_130.work
    L1_131.page = 0
    L2_132 = A0_130
    L1_131 = A0_130.setGridVisibility
    L3_133 = 1
    L1_131(L2_132, L3_133)
    L1_131 = false
    return L1_131
  end
  L2_132 = A0_130
  L1_131 = A0_130.getListBoxItemNum
  L3_133 = A0_130.work
  L3_133 = L3_133.listbox
  L1_131 = L1_131(L2_132, L3_133)
  L2_132 = A0_130.work
  L2_132 = L2_132.focus
  if L1_131 <= L2_132 then
    L1_131 = false
    return L1_131
  end
  L2_132 = A0_130
  L1_131 = A0_130.getListPropertyName
  L3_133 = A0_130.work
  L3_133 = L3_133.listbox
  L1_131 = L1_131(L2_132, L3_133)
  L3_133 = A0_130
  L2_132 = A0_130.getPackageFromList
  L4_134 = A0_130.work
  L4_134 = L4_134.listbox
  L2_132 = L2_132(L3_133, L4_134)
  L3_133 = A0_130.work
  L3_133 = L3_133.index
  L3_133 = L3_133 + 1
  L4_134 = 1
  L5_135 = A0_130.work
  L5_135 = L5_135.isRetainer
  if L5_135 == true then
    L4_134 = 4
  end
  L5_135 = worldMaster
  L6_136 = L5_135
  L5_135 = L5_135._getMyPlayer
  L5_135 = L5_135(L6_136)
  L6_136 = nil
  if L4_134 == 1 then
    L8_138 = L5_135
    L7_137 = L5_135._getItem
    L9_139 = L2_132
    L10_140 = L3_133
    L7_137 = L7_137(L8_138, L9_139, L10_140)
    L6_136 = L7_137
  elseif L4_134 == 2 then
    L7_137 = desktopWidget
    L8_138 = L7_137
    L7_137 = L7_137.getBazaarItem
    L9_139 = L2_132
    L10_140 = L3_133
    L7_137 = L7_137(L8_138, L9_139, L10_140)
    L6_136 = L7_137
  elseif L4_134 == 4 then
    L7_137 = desktopWidget
    L8_138 = L7_137
    L7_137 = L7_137.getRetainerItem
    L9_139 = L2_132
    L10_140 = L3_133
    L7_137 = L7_137(L8_138, L9_139, L10_140)
    L6_136 = L7_137
  end
  L7_137 = desktopWidget
  L8_138 = L7_137
  L7_137 = L7_137.setItemDetail
  L9_139 = A0_130
  L10_140 = L6_136
  L11_141 = A0_130.getListPropertyName
  L11_141 = L11_141(L12_142, L13_143)
  L7_137(L8_138, L9_139, L10_140, L11_141, L12_142, L13_143)
  L7_137 = A0_130.work
  L7_137.bazaar = false
  L7_137 = nil
  L8_138 = A0_130.work
  L8_138 = L8_138.isRetainer
  if L8_138 == false then
    L8_138 = 0
    L9_139 = 0
    L10_140 = 0
    L11_141 = 0
    if L12_142 == true then
      for L15_145 = 1, 27 do
        if L6_136:isFitForEquipPoint(L15_145) == true then
          if L8_138 == 0 then
            L8_138 = L15_145
          elseif L9_139 == 0 then
            L9_139 = L15_145
          elseif L10_140 == 0 then
            L10_140 = L15_145
          elseif L11_141 == 0 then
            L11_141 = L15_145
            break
          end
        end
      end
    end
    if L8_138 ~= 0 then
      L7_137 = L12_142
    end
    if L7_137 == nil and L9_139 ~= 0 then
      L7_137 = L12_142
    end
    if L7_137 == nil and L10_140 ~= 0 then
      L7_137 = L12_142
    end
    if L7_137 == nil and L11_141 ~= 0 then
      L7_137 = L12_142
    end
  end
  L8_138 = A0_130.work
  L9_139 = A0_130.work
  L10_140 = A0_130.work
  L11_141 = A0_130.work
  L15_145 = L6_136
  L15_145 = L12_142(L13_143, L14_144, L15_145, A0_130:getListPropertyName(A0_130.work.listbox), A0_130.work.index, L7_137, false, false, false, false, false)
  L11_141.itemlife = L15_145
  L10_140.bonus3 = L14_144
  L9_139.bonus2 = L13_143
  L8_138.bonus1 = L12_142
  L9_139 = A0_130
  L8_138 = A0_130.updateWindowDisplay
  L10_140 = false
  L8_138(L9_139, L10_140)
  L8_138 = true
  return L8_138
end
function ItemSelectWidget.previousSequence(A0_146)
  if A0_146.work.sorttype ~= desktopWidget:getConfigWork(9) then
    desktopWidget:setConfigWorkWithSave(9, A0_146.work.sorttype)
  end
  if A0_146.work.mode == 400 then
    A0_146:closeWidget()
    return true
  elseif A0_146.work.mode == 440 then
    if A0_146:_getParentWidget() ~= nil then
      A0_146:_getParentWidget():setOrderItemData(1, 0, 0)
      return A0_146:_getParentWidget():closeOrderItem()
    end
    return false
  end
end
function ItemSelectWidget.processUICommandOperate(A0_147, A1_148, A2_149, A3_150, A4_151)
  if A0_147.work.isRetainer == true then
    if A0_147.work.updatecountbaz > 0 then
      return false
    end
  elseif 0 < A0_147.work.updatecount then
    return false
  end
  if A2_149 == "Button_SortStatus" then
    A0_147:operateSort()
    if A0_147:_getParentWidget() ~= nil then
      A0_147:_getParentWidget():setParentSortType(A0_147.work.sorttype)
    end
  elseif A2_149 == "Button_Back" then
    A0_147:previousSequence()
  end
end
function ItemSelectWidget.processUICommandCancel(A0_152, A1_153, A2_154, A3_155, A4_156)
  A0_152:setCommonTimer(nil)
  A0_152:previousSequence()
end
function ItemSelectWidget.processUICommandClose(A0_157, A1_158, A2_159, A3_160, A4_161)
  A0_157:setCommonTimer(nil)
  A0_157:previousSequence()
end
function ItemSelectWidget.processUICommandSelection(A0_162, A1_163, A2_164, A3_165, A4_166)
  if A0_162.work.isRetainer == true then
    if A0_162.work.updatecountbaz > 0 then
      return false
    end
  elseif 0 < A0_162.work.updatecount then
    return false
  end
  A0_162.work.focus = A3_165
  A0_162.work.listbox = A4_166
  if A0_162:getListBoxItemNum(A0_162.work.listbox) == 0 then
    A0_162:updateWindowDisplay(true)
    return
  end
  if A0_162.work.focus >= A0_162:getListBoxFocusNum(A0_162.work.listbox) then
    A0_162:updateListFocus()
    return
  end
  A0_162:updateWindowDisplay(true)
  if A0_162:getListBoxFocusNum(A0_162.work.listbox) == 0 then
    return
  end
  A0_162.work.chosenPackage = A0_162:getPackageFromList(A0_162.work.listbox)
  A0_162.work.chosenItem = A0_162.work.index + 1
  if A0_162:isOperateButtonEnable(A0_162.work.listbox, A0_162.work.index) == true then
    A0_162:saveSortType()
    if A0_162.work.mode == 400 then
      if A0_162.work.chosenPackage ~= A0_162.work.rewardItemPackage or A0_162.work.chosenItem ~= A0_162.work.rewardItem then
        A0_162:selectedBorder(A0_162.work.index, true)
        A0_162:_getParentWidget():setReward(A0_162.work.chosenPackage, A0_162.work.chosenItem)
        desktopWidget:closeWidgetDirect(A0_162)
      end
      return
    elseif A0_162.work.mode == 440 then
      if A0_162.work.chosenOperation ~= 0 then
        return
      end
      A0_162:selectedBorder(A0_162.work.index, true)
      A0_162:_getParentWidget():setOrderItemData(2, A0_162.work.chosenPackage, A0_162.work.chosenItem, A0_162.work.orderStack)
      A0_162.work.chosenOperation = 2
      A0_162:_getParentWidget():closeOrderItem()
      return
    end
  end
end
function ItemSelectWidget.processUICommandDefault(A0_167, A1_168, A2_169, A3_170, A4_171, A5_172)
  if A0_167.work.isRetainer == true then
    if A0_167.work.updatecountbaz > 0 then
      return false
    end
  elseif 0 < A0_167.work.updatecount then
    return false
  end
  if A3_170 == "UILuaCommands.MouseEnteredItem" or A3_170 == "UILuaCommands.AnchoredItem" then
    if A5_172 == nil then
      return
    end
    if A4_171 == nil or A4_171 < 0 then
      return
    end
    A0_167.work.listbox = A5_172
    A0_167.work.focus = A4_171
    A0_167:setCommonTimer(0.2)
  elseif A3_170 == "UILuaCommands.TabChanged" then
    A0_167.work.listbox = 0 + A0_167:getSelectedTab()
    A0_167:changeList()
  elseif A3_170 == "UILuaCommands.ButtonFocused" then
    A0_167:setControlProperty("Button_Back", "Focusable", true)
    A0_167:setControlProperty("Button_Back", "IsTabStop", true)
  elseif A3_170 == "UILuaCommands.Previous" then
    A0_167:catalogSkip(-1)
  elseif A3_170 == "UILuaCommands.Next" then
    A0_167:catalogSkip(1)
  end
end
function ItemSelectWidget.processTimer(A0_173)
  if A0_173:focusToIndex(A0_173.work.listbox, A0_173.work.focus) >= 0 then
    A0_173.work.index = A0_173:focusToIndex(A0_173.work.listbox, A0_173.work.focus)
  end
  A0_173.work.page = 0
  A0_173:updateWindowDisplay(true)
  A0_173:selectedBorder()
  A0_173:setControlProperty("Button_Back", "Focusable", true)
  A0_173:setControlProperty("Button_Back", "IsTabStop", true)
end
function ItemSelectWidget.catalogSkip(A0_174, A1_175)
  local L2_176, L3_177, L4_178, L5_179, L6_180, L7_181, L8_182, L9_183, L10_184, L11_185, L12_186, L13_187
  L2_176 = A0_174.work
  L2_176 = L2_176.focus
  L4_178 = A0_174
  L3_177 = A0_174.getListBoxFocusNum
  L5_179 = A0_174.work
  L5_179 = L5_179.listbox
  L3_177 = L3_177(L4_178, L5_179)
  L3_177 = L3_177 - 1
  if L3_177 == -1 then
    return
  end
  L4_178 = 2
  L5_179 = A0_174.work
  L5_179 = L5_179.listbox
  if L5_179 ~= 1 then
    L5_179 = 10 * A1_175
    L2_176 = L2_176 + L5_179
  else
    L5_179 = A0_174.work
    L5_179 = L5_179.sorttype
    if L5_179 == 0 then
      L5_179 = 10 * A1_175
      L2_176 = L2_176 + L5_179
    else
      L5_179 = nil
      if A1_175 > 0 then
        L6_180 = A0_174.work
        L6_180 = L6_180.focus
        L5_179 = L3_177 - L6_180
      else
        L6_180 = A0_174.work
        L5_179 = L6_180.focus
      end
      L7_181 = A0_174
      L6_180 = A0_174.getListPropertyName
      L8_182 = A0_174.work
      L8_182 = L8_182.listbox
      L6_180 = L6_180(L7_181, L8_182)
      L7_181 = desktopWidget
      L8_182 = L7_181
      L7_181 = L7_181.getItemSortKey
      L12_186 = 1
      L13_187 = L4_178
      L7_181 = L7_181(L8_182, L9_183, L10_184, L11_185, L12_186, L13_187)
      L8_182 = L2_176
      for L12_186 = 1, L5_179 do
        L8_182 = L8_182 + A1_175
        L13_187 = A0_174.focusToIndex
        L13_187 = L13_187(A0_174, A0_174.work.listbox, L8_182)
        if L7_181 ~= desktopWidget:getItemSortKey(A0_174, L6_180, L13_187, 1, L4_178) then
          L2_176 = L2_176 + L12_186 * A1_175
          break
        end
        if L12_186 == L5_179 then
          if A1_175 > 0 then
            L2_176 = L3_177
          else
            L2_176 = 0
          end
        end
      end
    end
  end
  if L3_177 < L2_176 then
    L2_176 = L3_177
  elseif L2_176 < 0 then
    L2_176 = 0
  end
  L5_179 = A0_174.work
  L5_179 = L5_179.focus
  if L2_176 ~= L5_179 then
    L5_179 = A0_174.work
    L5_179.focus = L2_176
    L6_180 = A0_174
    L5_179 = A0_174.updateWindowDisplay
    L7_181 = true
    L5_179(L6_180, L7_181)
  end
end
function ItemSelectWidget.selectedBorder(A0_188, A1_189, A2_190)
  local L3_191, L4_192
  L3_191 = A0_188.getListPropertyName
  L3_191 = L3_191(L4_192, A0_188.work.listbox)
  if A1_189 ~= nil then
    A0_188:setListProperty(L3_191, A0_188.work.index, "selected", L4_192)
    A0_188.work.selected = A0_188.work.index
  elseif L4_192 == -1 then
    return
  else
    for _FORV_7_ = 1, A0_188:getListBoxItemNum(A0_188.work.listbox) do
      A0_188:setListProperty(L3_191, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_192.selected = -1
  end
  L4_192(A0_188, L3_191)
end
function ItemSelectWidget.changeList(A0_193)
  A0_193:setText("TextBlock_Title", A0_193:getControlProperty("TabItem_" .. tostring(A0_193.work.listbox), "Header"))
  A0_193.work.index = 0
  A0_193.work.focus = 0
  return A0_193:updateWindowDisplay(true)
end
function ItemSelectWidget.operateSort(A0_194, A1_195)
  if A0_194.work.listbox == 1 then
    if A1_195 ~= nil then
      A0_194.work.sorttype = A1_195
    else
      A0_194:changeSortType()
    end
    A0_194:updateSortType()
    A0_194:displaySortType(A0_194.work.sorttype)
  end
  return true
end
function ItemSelectWidget.isOperateButtonEnable(A0_196, A1_197, A2_198, A3_199)
  local L4_200, L5_201, L6_202, L7_203, L8_204
  L5_201 = A0_196
  L4_200 = A0_196.getListPropertyName
  L6_202 = A1_197
  L4_200 = L4_200(L5_201, L6_202)
  L6_202 = A0_196
  L5_201 = A0_196.getListBoxFocusNum
  L7_203 = A1_197
  L5_201 = L5_201(L6_202, L7_203)
  if L5_201 == 0 then
    L5_201 = false
    return L5_201
  end
  L6_202 = A0_196
  L5_201 = A0_196.getListBoxItemNum
  L7_203 = A1_197
  L5_201 = L5_201(L6_202, L7_203)
  if A2_198 >= L5_201 then
    L5_201 = false
    return L5_201
  end
  L6_202 = A0_196
  L5_201 = A0_196.getPackageFromList
  L7_203 = A1_197
  L5_201 = L5_201(L6_202, L7_203)
  L6_202 = A2_198 + 1
  L7_203 = true
  L8_204 = A0_196.work
  L8_204 = L8_204.isRewardMode
  if L8_204 == true then
    L8_204 = A0_196.getListProperty
    L8_204 = L8_204(A0_196, L4_200, A2_198, "opacity")
    if L8_204 == "0.5" then
      L7_203 = false
    end
  end
  L8_204 = nil
  if A0_196.work.isRetainer == true then
    L8_204 = desktopWidget:getRetainerItem(A0_196.work.chosenPackage, A0_196.work.chosenItem)
  else
    L8_204 = worldMaster:_getMyPlayer():_getItem(A0_196.work.chosenPackage, A0_196.work.chosenItem)
  end
  if A3_199 ~= nil then
    L8_204 = A3_199
  end
  if L8_204 == nil then
    return false
  end
  if L8_204:_isEquipping() == true then
    L7_203 = false
  end
  if A0_196.work.chosenPackage ~= 1 and A0_196.work.chosenPackage ~= 100 then
    L7_203 = false
  end
  if L8_204:isExclusiveItem() == true then
    L7_203 = false
  end
  return L7_203
end
function ItemSelectWidget.closeWidget(A0_205, A1_206)
  if A0_205.work.isRewardMode == true and A0_205:_getParentWidget() ~= nil then
    A0_205:_getParentWidget():setReward(nil, nil)
    desktopWidget:closeWidgetDirect(A0_205)
  end
end
function ItemSelectWidget.updateItemList(A0_207, A1_208, A2_209)
  local L3_210, L4_211
  L3_210 = A0_207.work
  L3_210 = L3_210.isRetainer
  if L3_210 == false then
    return
  end
  L3_210 = -1
  if A1_208 == 0 then
    L4_211 = A0_207.work
    L4_211.updatecountbaz = A2_209
    return
  elseif A1_208 == 1 then
    L4_211 = A0_207.makeListFromPackage
    L4_211(A0_207, A1_208, A2_209)
    L3_210 = 1
  elseif A1_208 == 100 then
    L4_211 = A0_207.makeListFromPackage
    L4_211(A0_207, A1_208, A2_209)
    L3_210 = 2
  end
  L4_211 = A0_207.work
  L4_211 = L4_211.updatecountbaz
  if L4_211 > 0 then
    L4_211 = A0_207.work
    L4_211.updatecountbaz = A0_207.work.updatecountbaz - 1
  end
  L4_211 = A0_207.work
  L4_211 = L4_211.updatecountbaz
  if L4_211 == 0 then
    if A1_208 == 100 then
      L4_211 = A0_207.getListPropertyName
      L4_211 = L4_211(A0_207, 2)
      A0_207:updateListProperty(L4_211)
    elseif A1_208 == 1 then
      L4_211 = A0_207.getListPropertyName
      L4_211 = L4_211(A0_207, 1)
      A0_207:updateListProperty(L4_211)
    end
    L4_211 = A0_207.work
    L4_211 = L4_211.listbox
    if L3_210 == L4_211 then
      L4_211 = A0_207.updateListFocus
      L4_211(A0_207)
    end
    L4_211 = A0_207.displayBagcapacityAndMoney
    L4_211(A0_207)
  end
end
function ItemSelectWidget.updatePlayerItem(A0_212, A1_213, A2_214)
  local L3_215, L4_216
  L3_215 = -1
  if A1_213 == 0 then
    L4_216 = A0_212.work
    L4_216.updatecount = A2_214
    return
  else
    L4_216 = A0_212.work
    L4_216 = L4_216.isRetainer
    if L4_216 == false then
      if A1_213 == 1 then
        L4_216 = A0_212.makeListFromPackage
        L4_216(A0_212, A1_213, A2_214)
        L3_215 = 1
      elseif A1_213 == 100 then
        L4_216 = A0_212.makeListFromPackage
        L4_216(A0_212, A1_213, A2_214)
        L3_215 = 2
      end
    end
  end
  L4_216 = A0_212.work
  L4_216 = L4_216.updatecount
  if L4_216 > 0 then
    L4_216 = A0_212.work
    L4_216.updatecount = A0_212.work.updatecount - 1
  end
  L4_216 = A0_212.work
  L4_216 = L4_216.updatecount
  if L4_216 == 0 then
    L4_216 = A0_212.work
    L4_216 = L4_216.isRetainer
    if L4_216 == false then
      if L3_215 ~= -1 then
        L4_216 = A0_212.work
        L4_216 = L4_216.mode
        if L4_216 == 440 then
          L4_216 = A0_212.getListPropertyName
          L4_216 = L4_216(A0_212, L3_215)
          A0_212:updateListProperty(L4_216)
        elseif A1_213 == 100 then
          L4_216 = A0_212.getListPropertyName
          L4_216 = L4_216(A0_212, 2)
          A0_212:updateListProperty(L4_216)
        elseif L3_215 ~= -1 then
          L4_216 = A0_212.getListPropertyName
          L4_216 = L4_216(A0_212, L3_215)
          A0_212:updateListProperty(L4_216)
        end
      end
      L4_216 = A0_212.displayBagcapacityAndMoney
      L4_216(A0_212)
      L4_216 = A0_212.work
      L4_216 = L4_216.listbox
      if L3_215 == L4_216 then
        L4_216 = A0_212.updateListFocus
        L4_216(A0_212)
      end
    end
  end
  return
end
function ItemSelectWidget.syncItemWork(A0_217, A1_218)
end
function ItemSelectWidget.displaySortType(A0_219, A1_220)
  desktopWidget:displaySortType(A1_220, A0_219, "Button_SortStatus")
end
function ItemSelectWidget.changeSortType(A0_221)
  A0_221.work.sorttype = desktopWidget:changeSortType(A0_221.work.sorttype)
end
function ItemSelectWidget.saveSortType(A0_222)
  desktopWidget:saveSortType(A0_222.work.sorttype)
end
