require("/Widget/Ask/AskBaseClass")
_defineClass("ItemStorageGetWidget", "AskBaseClass")
function ItemStorageGetWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function ItemStorageGetWidget.initAsk(A0_2, A1_3)
  local L2_4
  L2_4 = A0_2.work
  L2_4._temp = {
    {"category", "integer32"},
    {"isDecided", "boolean"},
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
      "editWidgetOpen",
      "integer8"
    },
    {
      "initialized",
      "boolean"
    },
    {
      "waitForPrice",
      "boolean"
    },
    {"waitNext", "boolean"},
    {"waitupdate", "boolean"},
    {"shopid", "integer32"},
    {
      "updatecount",
      "integer32"
    },
    {"buycount", "integer32"},
    {"price", "integer32"},
    {"closeok", "boolean"},
    {"demandSync", "boolean"},
    {"sorttype", "integer8"},
    {"lastsub", "integer8"},
    {"sdsize", "boolean"},
    {
      "lastcommandtime",
      "integer32"
    },
    {"askstatus", "boolean"},
    {
      "isMateriaList",
      "boolean"
    }
  }
  L2_4 = A0_2.work
  L2_4.category = A1_3
  L2_4 = A0_2.work
  L2_4.isDecided = false
  L2_4 = A0_2.work
  L2_4.chosenOperation = 0
  L2_4 = A0_2.work
  L2_4.editWidgetOpen = 0
  L2_4 = A0_2.work
  L2_4.initialized = false
  L2_4 = A0_2.work
  L2_4.listbox, A0_2.work.index = 0, 0
  L2_4 = A0_2.work
  L2_4.bonus1 = false
  L2_4 = A0_2.work
  L2_4.bonus2 = false
  L2_4 = A0_2.work
  L2_4.bonus3 = false
  L2_4 = A0_2.work
  L2_4.itemlife = false
  L2_4 = A0_2.work
  L2_4.bazaar = false
  L2_4 = A0_2.work
  L2_4.waitNext = false
  L2_4 = A0_2.work
  L2_4.waitForPrice = false
  L2_4 = A0_2.work
  L2_4.waitupdate = false
  L2_4 = A0_2.work
  L2_4.focus = 0
  L2_4 = A0_2.work
  L2_4.closeok = false
  L2_4 = A0_2.work
  L2_4.demandSync = false
  L2_4 = A0_2.work
  L2_4.sorttype = 0
  L2_4 = A0_2.work
  L2_4.lastsub = 10
  L2_4 = A0_2.work
  L2_4.askstatus = true
  L2_4 = A0_2.setProperty
  L2_4(A0_2, "Title", "@" .. tostring(3902))
  L2_4 = 0
  if A0_2.work.category == 1 then
    L2_4 = 3903
    break
  else
  end
  if A0_2.work.category == 2 then
    L2_4 = 3904
    break
  else
  end
  if A0_2.work.category == 3 then
    L2_4 = 3905
    break
  else
  end
  if A0_2.work.category == 4 then
    L2_4 = 3906
    break
  else
  end
  do return false end
  A0_2:setText("TextBlock_Title", L2_4)
  A0_2:setCloseCondition()
  A0_2:setCancelCondition("TabItem_1")
  A0_2:setText("TextBlock_ItemLifeHeader", 214, 10091)
  A0_2:setText("TextBlock_RepairMaterialHeader", 214, 10093)
  A0_2:setText("TextBlock_Help", "")
  A0_2:setVisibility("TabItem_2", false)
  A0_2:setVisibility("TabItem_3", false)
  A0_2:setVisibility("TabItem_4", false)
  A0_2:setVisibility("TabItem_5", false)
  A0_2:setVisibility("TabItem_6", false)
  A0_2:setVisibility("Grid_MateriaAttachBazaarInformation", false)
  A0_2:initListBox(1)
  A0_2:initListBox(2)
  A0_2:initListBox(3)
  A0_2:initListBox(4)
  A0_2:initListBox(5)
  A0_2:initListBox(6)
  A0_2:setHeader("TabItem_1", L2_4)
  A0_2:setHelpParameter("TabItem_1", 0)
  A0_2:setInitialData()
end
function ItemStorageGetWidget.setInitialData(A0_5)
  A0_5:setModal(true)
  A0_5:resetListBox(1)
  A0_5:resetListBox(2)
  A0_5:resetListBox(3)
  A0_5:resetListBox(4)
  A0_5:resetListBox(5)
  A0_5:resetListBox(6)
  A0_5:makeList()
  A0_5.work.initialized = true
  A0_5.work.listbox = 1
  A0_5:updateWindowDisplay(true)
end
function ItemStorageGetWidget.processBeforeShow(A0_6, A1_7)
  if A1_7 ~= true then
    return true
  elseif A0_6:getChildWidgetByWindowName("ItemStorageDialogWidget") ~= nil then
    A0_6:closeConfirmDialog(true)
  else
    A0_6:updateWindowDisplay(true)
  end
  return true
end
function ItemStorageGetWidget.getListPropertyName(A0_8, A1_9)
  local L2_10
  if A1_9 == 1 then
    L2_10 = "TabItem_1_Maker"
    return L2_10
  elseif A1_9 == 2 then
    L2_10 = "TabItem_2_Maker"
    return L2_10
  elseif A1_9 == 3 then
    L2_10 = "TabItem_3_Maker"
    return L2_10
  elseif A1_9 == 4 then
    L2_10 = "TabItem_4_Maker"
    return L2_10
  elseif A1_9 == 5 then
    L2_10 = "TabItem_5_Maker"
    return L2_10
  elseif A1_9 == 6 then
    L2_10 = "TabItem_6_Maker"
    return L2_10
  else
    L2_10 = ""
    return L2_10
  end
end
function ItemStorageGetWidget.updateWindowDisplay(A0_11, A1_12)
  A0_11:setGridVisibility(2)
  if A0_11.work.listbox == 1 then
    A0_11:setVisibility("Button_SortStatus", false)
  else
    A0_11:setVisibility("Button_SortStatus", false)
  end
  if A1_12 == true then
    A0_11:updateListFocus()
  end
end
function ItemStorageGetWidget.updateListFocus(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L1_14 = A0_13.work
  L1_14 = L1_14.updatecount
  if L1_14 ~= 0 then
    L1_14 = false
    return L1_14
  end
  L2_15 = A0_13
  L1_14 = A0_13.getListBoxFocusNum
  L3_16 = A0_13.work
  L3_16 = L3_16.listbox
  L4_17 = L1_14(L2_15, L3_16)
  L6_19 = A0_13
  L5_18 = A0_13.getListBoxName
  L5_18 = L5_18(L6_19, A0_13.work.listbox)
  L6_19 = "TextBlock_NoContents_"
  L6_19 = L6_19 .. tostring(A0_13.work.listbox)
  if L1_14 == 0 then
    if A0_13:getChildWidgetByWindowName("ItemStorageDialogWidget") ~= nil then
      A0_13:closeConfirmDialog(false)
    end
    A0_13:setVisibility(L6_19, true)
    A0_13:setVisibility(L5_18, false)
    A0_13:displayFocusedItemHelp()
    A0_13:setWindowFocus(L6_19)
  else
    A0_13:setVisibility(L5_18, true)
    A0_13:setVisibility(L6_19, false)
    if A0_13.work.focus > L1_14 - 1 then
      A0_13.work.focus = L1_14 - 1
    end
    if 0 <= A0_13:focusToIndex(A0_13.work.listbox, A0_13.work.focus) then
      A0_13.work.index = A0_13:focusToIndex(A0_13.work.listbox, A0_13.work.focus)
    end
    A0_13:setControlProperty(L5_18, "SqwtFocusedIndex", A0_13.work.focus)
    A0_13:setFocusedIndex(L5_18, A0_13.work.focus)
    A0_13:setWindowFocus(L5_18)
    A0_13:displayFocusedItemHelp()
  end
end
function ItemStorageGetWidget.setGridVisibility(A0_20, A1_21)
  A0_20:setVisibility("Grid_ActorName", false)
  A0_20:setVisibility("Grid_Help", A1_21 == 1)
  A0_20:setVisibility("Grid_TabList", A1_21 == 2 or A1_21 == 1)
  A0_20:setVisibility("Grid_BackpackAndGil", true)
  A0_20:setVisibility("Grid_ItemNameBase", A1_21 == 2)
  A0_20:setVisibility("Grid_ItemDetail1", A0_20.work.bonus1)
  A0_20:setVisibility("Grid_ItemDetail2", A0_20.work.bonus2)
  A0_20:setVisibility("Grid_ItemDetail3", A0_20.work.bonus3 or A0_20.work.itemlife or A0_20.work.bazaar)
  A0_20:setVisibility("Label_ItemBonus5", A0_20.work.bonus3)
  A0_20:setVisibility("Grid_ItemLife", A0_20.work.itemlife)
  A0_20:setVisibility("Grid_ItemBazaarInformation", A0_20.work.bazaar)
end
function ItemStorageGetWidget.setWindowFocus(A0_22, A1_23)
  if A1_23 ~= nil and A1_23 ~= "" then
    A0_22:setLogicalFocus(A1_23)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_22 then
      A0_22:setKeyboardFocusedControl(A1_23)
    end
  end
end
function ItemStorageGetWidget.displayBagcapacityAndMoney(A0_24)
  local L1_25, L2_26, L3_27, L4_28
  L1_25 = worldMaster
  L2_26 = L1_25
  L1_25 = L1_25._getMyPlayer
  L1_25 = L1_25(L2_26)
  L3_27 = L1_25
  L2_26 = L1_25._getItemPackageCapacity
  L4_28 = 1
  L2_26 = L2_26(L3_27, L4_28)
  L4_28 = L1_25
  L3_27 = L1_25._getItemPackageFreeSpace
  L3_27 = L3_27(L4_28, 1)
  L4_28 = A0_24.setText
  L4_28(A0_24, "TextBlock_ItemStack_2", 3551, L2_26 - L3_27, L2_26)
  L4_28 = L1_25.getMoneyOnHand
  L4_28 = L4_28(L1_25)
  A0_24:setText("TextBlock_Gil", 3263, L4_28)
end
function ItemStorageGetWidget.getListBoxName(A0_29, A1_30)
  local L2_31
  if A1_30 == 1 then
    L2_31 = "ListBox_TabItem_1"
    return L2_31
  elseif A1_30 == 2 then
    L2_31 = "ListBox_TabItem_2"
    return L2_31
  elseif A1_30 == 3 then
    L2_31 = "ListBox_TabItem_3"
    return L2_31
  elseif A1_30 == 4 then
    L2_31 = "ListBox_TabItem_4"
    return L2_31
  elseif A1_30 == 5 then
    L2_31 = "ListBox_TabItem_5"
    return L2_31
  elseif A1_30 == 6 then
    L2_31 = "ListBox_TabItem_6"
    return L2_31
  else
    L2_31 = ""
    return L2_31
  end
end
function ItemStorageGetWidget.getListBoxItemNum(A0_32, A1_33)
  local L2_34, L3_35
  L3_35 = A0_32
  L2_34 = A0_32.getListPropertyCount
  return L2_34(L3_35, A0_32:getListPropertyName(A1_33))
end
function ItemStorageGetWidget.getListBoxFocusNum(A0_36, A1_37)
  local L2_38, L3_39, L4_40, L5_41
  L3_39 = A0_36
  L2_38 = A0_36.getListBoxItemNum
  L4_40 = A1_37
  L2_38 = L2_38(L3_39, L4_40)
  if L2_38 == 0 then
    L3_39 = 0
    L4_40 = 0
    L5_41 = 0
    return L3_39, L4_40, L5_41, 0
  end
  L4_40 = A0_36
  L3_39 = A0_36.getListPropertyName
  L5_41 = A1_37
  L3_39 = L3_39(L4_40, L5_41)
  L5_41 = A0_36
  L4_40 = A0_36.getControlProperty
  L4_40 = L4_40(L5_41, L3_39, "FilteredCount")
  L5_41 = A0_36.work
  L5_41 = L5_41.focus
  if L4_40 < A0_36.work.focus then
    L5_41 = L4_40 - 1
  end
  return L4_40, L4_40 - 1, 0, L5_41
end
function ItemStorageGetWidget.focusToIndex(A0_42, A1_43, A2_44)
  local L3_45
  L3_45 = A0_42.getListPropertyName
  L3_45 = L3_45(A0_42, A1_43)
  if A0_42:getListBoxFocusNum(A1_43) == 0 or A2_44 >= A0_42:getListBoxFocusNum(A1_43) then
    return -1
  else
    A0_42:setControlProperty(L3_45, "FilteredIndex", A2_44)
    return A0_42:getControlProperty(L3_45, "Index")
  end
end
function ItemStorageGetWidget.indexToFocus(A0_46, A1_47, A2_48)
  local L3_49, L4_50
  L3_49 = -1
  L4_50 = A0_46.getListPropertyName
  L4_50 = L4_50(A0_46, A1_47)
  if A0_46:getListBoxFocusNum(A1_47) > 0 then
    A0_46:setControlProperty(L4_50, "Index", A2_48)
    L3_49 = A0_46:getControlProperty(L4_50, "FilteredIndex")
  end
  return L3_49
end
function ItemStorageGetWidget.initListBox(A0_51, A1_52)
  local L2_53, L3_54
  L3_54 = A0_51
  L2_53 = A0_51.getListBoxName
  L2_53 = L2_53(L3_54, A1_52)
  if L2_53 ~= "" then
    L3_54 = A0_51.setControlProperty
    L3_54(A0_51, L2_53, "IntData.Value0", A1_52)
    L3_54 = A0_51.setControlCommandCondition
    L3_54(A0_51, L2_53, "UILuaCommands.MouseEnteredItem")
    L3_54 = A0_51.setControlCommandCondition
    L3_54(A0_51, L2_53, "UILuaCommands.AnchoredItem")
    L3_54 = A0_51.setControlCommandCondition
    L3_54(A0_51, L2_53, "UILuaCommands.Selection")
    L3_54 = A0_51.setCancelCondition
    L3_54(A0_51, L2_53)
    L3_54 = A0_51.setVisibility
    L3_54(A0_51, L2_53, true)
    L3_54 = "TextBlock_NoContents_"
    L3_54 = L3_54 .. tostring(A1_52)
    A0_51:setVisibility(L3_54, false)
    A0_51:setCancelCondition(L3_54)
    A0_51:setControlProperty(L3_54, "IsTabStop", true)
    A0_51:setControlCommandCondition(L2_53, "UILuaCommands.Previous")
    A0_51:setControlCommandCondition(L2_53, "UILuaCommands.Next")
  end
end
function ItemStorageGetWidget.resetListBox(A0_55, A1_56)
  local L2_57, L3_58
  L3_58 = A0_55
  L2_57 = A0_55.getListBoxItemNum
  L2_57 = L2_57(L3_58, A1_56)
  L3_58 = A0_55.getListPropertyName
  L3_58 = L3_58(A0_55, A1_56)
  if L2_57 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_57 do
      L2_57 = L2_57 - 1
      A0_55:deleteListProperty(L3_58, L2_57)
    end
    A0_55:updateListProperty(L3_58)
  end
end
function ItemStorageGetWidget.getPackageFromList(A0_59, A1_60)
  local L2_61
  L2_61 = 1
  if A1_60 == 1 then
    L2_61 = 1
  elseif A1_60 == 2 then
    L2_61 = 100
  elseif A1_60 == 3 then
    L2_61 = 8
  elseif A1_60 == 4 then
    L2_61 = 5
  elseif A1_60 == 5 then
    L2_61 = 100
  end
  return L2_61
end
function ItemStorageGetWidget.setItemToXmlLight(A0_62, A1_63, A2_64, A3_65, A4_66, A5_67)
  local L6_68, L7_69, L8_70, L9_71, L10_72, L11_73, L12_74, L13_75, L14_76, L15_77, L16_78
  L7_69 = A0_62
  L6_68 = A0_62.getListPropertyName
  L8_70 = A1_63
  L6_68 = L6_68(L7_69, L8_70)
  L7_69 = worldMaster
  L8_70 = L7_69
  L7_69 = L7_69._getMyPlayer
  L7_69 = L7_69(L8_70)
  L9_71 = L7_69
  L8_70 = L7_69.createVirtualItem
  L10_72 = A3_65
  L8_70 = L8_70(L9_71, L10_72)
  if L8_70 == nil then
    L9_71 = false
    return L9_71
  end
  L10_72 = L8_70
  L9_71 = L8_70.getItemIcon
  L9_71 = L9_71(L10_72)
  L11_73 = L8_70
  L10_72 = L8_70._isStackable
  L10_72 = L10_72(L11_73)
  L12_74 = L8_70
  L11_73 = L8_70._countStack
  L11_73 = L11_73(L12_74)
  L13_75 = L8_70
  L12_74 = L8_70._getNameIndex
  L12_74 = L12_74(L13_75)
  L13_75 = "TBL_null"
  L14_76 = 3
  L15_77 = A0_62.work
  L15_77 = L15_77.sorttype
  L16_78 = 6
  A0_62:setListProperty(L6_68, A2_64, "itemOwner", L14_76)
  A0_62:setListPropertyVisibility(L6_68, A2_64, true)
  A0_62:setListProperty(L6_68, A2_64, "stack", "")
  A0_62:setListProperty(L6_68, A2_64, "mivisible", "Collapsed")
  A0_62:setListProperty(L6_68, A2_64, "mpvisible", "Hidden")
  A0_62:setListProperty(L6_68, A2_64, "mcvisible", "Hidden")
  A0_62:setListProperty(L6_68, A2_64, "polmax", "Collapsed")
  A0_62:setListProperty(L6_68, A2_64, "equiped", "Collapsed")
  desktopWidget:setItemToXml(A0_62, L6_68, A2_64, L8_70, L13_75, A3_65, L9_71, L10_72, L11_73, L12_74, L15_77, false, false, L16_78, 1, A4_66, L14_76, false)
  desktopWidget:setItemDetailToXml(A0_62, L6_68, A2_64, L8_70, L12_74, L14_76, L16_78)
  if A0_62.work.updatecount > 0 and A0_62.work.listbox == A1_63 and A0_62:getControlProperty(L6_68, "FilteredIndex") < A0_62.work.focus then
    A0_62.work.focusChange = true
  end
  return true
end
function ItemStorageGetWidget.setSortType(A0_79, A1_80, A2_81)
  local L3_82, L4_83, L5_84
  L3_82 = A2_81 + 1
  L4_83 = worldMaster
  L5_84 = L4_83
  L4_83 = L4_83._getMyPlayer
  L4_83 = L4_83(L5_84)
  L5_84 = nil
  if L3_82 > 0 then
    L5_84 = L4_83:_getItem(1, L3_82)
  end
  if L5_84 == nil then
    return
  end
  desktopWidget:setSortType(A0_79, A1_80, A2_81, A0_79.work.sorttype, L5_84)
end
function ItemStorageGetWidget.updateSortType(A0_85)
  local L1_86
  L1_86 = A0_85.getListPropertyName
  L1_86 = L1_86(A0_85, 1)
  for _FORV_5_ = 1, A0_85:getListBoxItemNum(1) do
    A0_85:setSortType(L1_86, _FORV_5_ - 1)
  end
  A0_85:updateListProperty(L1_86)
end
function ItemStorageGetWidget.makeList(A0_87)
  local L1_88, L2_89, L3_90, L4_91, L5_92, L6_93, L7_94, L8_95, L9_96, L10_97, L11_98
  L1_88 = worldMaster
  L2_89 = L1_88
  L1_88 = L1_88._getMyPlayer
  L1_88 = L1_88(L2_89)
  L3_90 = A0_87
  L2_89 = A0_87.getListPropertyName
  L4_91 = 1
  L2_89 = L2_89(L3_90, L4_91)
  L4_91 = L1_88
  L3_90 = L1_88._countStoredItem
  L5_92 = A0_87.work
  L5_92 = L5_92.category
  L3_90 = L3_90(L4_91, L5_92)
  if L3_90 > 0 then
    L5_92 = A0_87
    L4_91 = A0_87.getListBoxItemNum
    L6_93 = 1
    L4_91 = L4_91(L5_92, L6_93)
    L6_93 = A0_87
    L5_92 = A0_87.getListBoxName
    L7_94 = 1
    L5_92 = L5_92(L6_93, L7_94)
    L6_93 = 0
    L7_94 = 0
    L11_98 = "SourceFirstIndex"
    L8_95(L9_96, L10_97, L11_98, 0)
    L11_98 = "SourceCount"
    L8_95(L9_96, L10_97, L11_98, L3_90)
    L11_98 = "FilteredSortKey"
    L8_95(L9_96, L10_97, L11_98, "sorttype")
    for L11_98 = 1, L3_90 do
      L6_93 = L1_88:_getStoredItem(A0_87.work.category, L11_98)
      if A0_87:setItemToXmlLight(1, L7_94, L6_93, L11_98) == true then
        L7_94 = L7_94 + 1
      else
        break
      end
    end
    if L4_91 > L7_94 then
      for L11_98 = L7_94, L4_91 - 1 do
        L4_91 = L4_91 - 1
        A0_87:deleteListProperty(L2_89, L4_91)
      end
    end
  end
  L5_92 = A0_87
  L4_91 = A0_87.updateListProperty
  L6_93 = L2_89
  L4_91(L5_92, L6_93)
  L5_92 = A0_87
  L4_91 = A0_87.displayBagcapacityAndMoney
  L4_91(L5_92)
end
function ItemStorageGetWidget.displayHelp(A0_99, A1_100)
  A0_99:setText("TextBlock_Help", A1_100)
end
function ItemStorageGetWidget.displayFocusedItemHelp(A0_101)
  local L1_102, L2_103, L3_104, L4_105, L5_106, L6_107, L7_108
  L1_102 = A0_101.work
  L1_102 = L1_102.updatecount
  if L1_102 > 0 then
    L1_102 = false
    return L1_102
  end
  L2_103 = A0_101
  L1_102 = A0_101.getListBoxFocusNum
  L3_104 = A0_101.work
  L3_104 = L3_104.listbox
  L1_102 = L1_102(L2_103, L3_104)
  if L1_102 == 0 then
    L2_103 = A0_101
    L1_102 = A0_101.displayHelp
    L3_104 = 3140
    L1_102(L2_103, L3_104)
    L1_102 = A0_101.work
    L1_102.bonus1 = false
    L1_102 = A0_101.work
    L1_102.bonus2 = false
    L1_102 = A0_101.work
    L1_102.bonus3 = false
    L1_102 = A0_101.work
    L1_102.itemlife = false
    L1_102 = A0_101.work
    L1_102.page = 0
    L2_103 = A0_101
    L1_102 = A0_101.setGridVisibility
    L3_104 = 1
    L1_102(L2_103, L3_104)
    L1_102 = false
    return L1_102
  end
  L2_103 = A0_101
  L1_102 = A0_101.getListBoxItemNum
  L3_104 = A0_101.work
  L3_104 = L3_104.listbox
  L1_102 = L1_102(L2_103, L3_104)
  L2_103 = A0_101.work
  L2_103 = L2_103.index
  if L1_102 <= L2_103 then
    L1_102 = false
    return L1_102
  end
  L2_103 = A0_101
  L1_102 = A0_101.getListPropertyName
  L3_104 = A0_101.work
  L3_104 = L3_104.listbox
  L1_102 = L1_102(L2_103, L3_104)
  L2_103 = worldMaster
  L3_104 = L2_103
  L2_103 = L2_103._getMyPlayer
  L2_103 = L2_103(L3_104)
  L3_104 = desktopWidget
  L4_105 = L3_104
  L3_104 = L3_104.setItemDetail
  L5_106 = A0_101
  L6_107 = nil
  L7_108 = L1_102
  L3_104(L4_105, L5_106, L6_107, L7_108, A0_101.work.index)
  L3_104 = A0_101.work
  L3_104.bazaar = false
  L4_105 = A0_101
  L3_104 = A0_101.setVisibility
  L5_106 = "Grid_RewardMoney"
  L6_107 = false
  L3_104(L4_105, L5_106, L6_107)
  L4_105 = A0_101
  L3_104 = A0_101.setVisibility
  L5_106 = "Grid_RewardItem"
  L6_107 = false
  L3_104(L4_105, L5_106, L6_107)
  L3_104 = nil
  L4_105 = 0
  L5_106 = 0
  L6_107 = 0
  L7_108 = 0
  L4_105 = A0_101:getListProperty(L1_102, A0_101.work.index, "firstSlot")
  L5_106 = A0_101:getListProperty(L1_102, A0_101.work.index, "secondSlot")
  L6_107 = A0_101:getListProperty(L1_102, A0_101.work.index, "thirdSlot")
  L7_108 = A0_101:getListProperty(L1_102, A0_101.work.index, "fourthSlot")
  if L4_105 ~= 0 then
    L3_104 = L2_103:_getEquippingItem(L4_105)
  end
  if L3_104 == nil and L5_106 ~= 0 then
    L3_104 = L2_103:_getEquippingItem(L5_106)
  end
  if L3_104 == nil and L6_107 ~= 0 then
    L3_104 = L2_103:_getEquippingItem(L6_107)
  end
  if L3_104 == nil and L7_108 ~= 0 then
    L3_104 = L2_103:_getEquippingItem(L7_108)
  end
  A0_101.work.bonus1, A0_101.work.bonus2, A0_101.work.bonus3, A0_101.work.itemlife = desktopWidget:setItemDetailEquip(A0_101, nil, L1_102, A0_101.work.index, L3_104, true, false, false, true, false, false, A0_101, true)
  A0_101:updateWindowDisplay(false)
end
function ItemStorageGetWidget.previousSequence(A0_109)
  A0_109:setBaseAskResult(-1)
end
function ItemStorageGetWidget.processUICommandOperate(A0_110, A1_111, A2_112, A3_113, A4_114)
  local L5_115
  L5_115 = A2_112
  break
end
function ItemStorageGetWidget.processUICommandCancel(A0_116, A1_117, A2_118, A3_119, A4_120)
  if A0_116.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_116.work.waitNext == true then
    return false
  end
  if A0_116:isAskFinish() == true then
    return false
  end
  A0_116:previousSequence()
end
function ItemStorageGetWidget.processUICommandClose(A0_121, A1_122, A2_123, A3_124, A4_125)
  A0_121:previousSequence()
end
function ItemStorageGetWidget.processUICommandSelection(A0_126, A1_127, A2_128, A3_129, A4_130)
  local L5_131, L6_132, L7_133
  L5_131 = A0_126.work
  L5_131 = L5_131.editWidgetOpen
  if L5_131 ~= 0 then
    L6_132 = A0_126
    L5_131 = A0_126.getChildWidgetByWindowName
    L7_133 = "ItemStorageDialogWidget"
    L5_131 = L5_131(L6_132, L7_133)
    if L5_131 == nil then
      L5_131 = worldMaster
      L6_132 = L5_131
      L5_131 = L5_131._getServerTime
      L5_131 = L5_131(L6_132)
      L6_132 = A0_126.work
      L6_132 = L6_132.lastcommandtime
      L5_131 = L5_131 - L6_132
      if L5_131 > 2 then
        L6_132 = A0_126
        L5_131 = A0_126.closeConfirmDialog
        L7_133 = true
        L5_131(L6_132, L7_133)
      end
    else
      L5_131 = false
      return L5_131
    end
  end
  L5_131 = A0_126.work
  L5_131 = L5_131.waitNext
  if L5_131 == true then
    L5_131 = false
    return L5_131
  end
  L6_132 = A0_126
  L5_131 = A0_126.isAskFinish
  L5_131 = L5_131(L6_132)
  if L5_131 == true then
    L5_131 = false
    return L5_131
  end
  L5_131 = desktopWidget
  L6_132 = L5_131
  L5_131 = L5_131.checkKeyboardFocused
  L7_133 = A0_126
  L5_131 = L5_131(L6_132, L7_133)
  if L5_131 == false then
    return
  end
  L5_131 = A0_126.work
  L5_131.focus = A3_129
  L5_131 = A0_126.work
  L5_131.listbox = A4_130
  L6_132 = A0_126
  L5_131 = A0_126.getListBoxItemNum
  L7_133 = A0_126.work
  L7_133 = L7_133.listbox
  L5_131 = L5_131(L6_132, L7_133)
  if L5_131 == 0 then
    L6_132 = A0_126
    L5_131 = A0_126.updateWindowDisplay
    L7_133 = true
    return L5_131(L6_132, L7_133)
  end
  L5_131 = A0_126.work
  L5_131 = L5_131.focus
  L7_133 = A0_126
  L6_132 = A0_126.getListBoxFocusNum
  L6_132 = L6_132(L7_133, A0_126.work.listbox)
  if L5_131 >= L6_132 then
    L6_132 = A0_126
    L5_131 = A0_126.updateListFocus
    return L5_131(L6_132)
  end
  L6_132 = A0_126
  L5_131 = A0_126.updateWindowDisplay
  L7_133 = true
  L5_131(L6_132, L7_133)
  L5_131 = A0_126.work
  L5_131 = L5_131.waitupdate
  if L5_131 == true then
    return
  end
  L5_131 = A0_126.work
  L5_131 = L5_131.editWidgetOpen
  if L5_131 == 0 then
    L6_132 = A0_126
    L5_131 = A0_126.getListProperty
    L7_133 = "TabItem_1_Maker"
    L5_131 = L5_131(L6_132, L7_133, A0_126.work.index, "itemIndex")
    L6_132 = worldMaster
    L7_133 = L6_132
    L6_132 = L6_132._getMyPlayer
    L6_132 = L6_132(L7_133)
    L7_133 = L6_132._getStoredItem
    L7_133 = L7_133(L6_132, A0_126.work.category, L5_131)
    if desktopWidget:openChildWidget("ItemStorageDialogWidget", A0_126, true, 2, L7_133) == true then
      A0_126.work.editWidgetOpen = 1
      return
    end
  end
  L5_131 = A0_126.work
  L6_132 = worldMaster
  L7_133 = L6_132
  L6_132 = L6_132._getServerTime
  L6_132 = L6_132(L7_133)
  L5_131.lastcommandtime = L6_132
end
function ItemStorageGetWidget.processUICommandDefault(A0_134, A1_135, A2_136, A3_137, A4_138, A5_139)
  if A0_134.work.editWidgetOpen ~= 0 then
    if A0_134:getChildWidgetByWindowName("ItemStorageDialogWidget") == nil and worldMaster:_getServerTime() - A0_134.work.lastcommandtime > 2 then
      A0_134:closeConfirmDialog(true)
    else
      return false
    end
  end
  if A0_134.work.waitNext == true then
    return false
  end
  if A0_134:isAskFinish() == true then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_134) == false then
    return
  end
  if A3_137 == "UILuaCommands.MouseEnteredItem" or A3_137 == "UILuaCommands.AnchoredItem" then
    if A5_139 == nil then
      return
    end
    if A4_138 == nil or A4_138 < 0 then
      return
    end
    A0_134.work.listbox = A5_139
    A0_134.work.focus = A4_138
    A0_134:setCommonTimer(0.2)
  elseif A3_137 == "UILuaCommands.Previous" then
    A0_134:catalogSkip(-1)
  elseif A3_137 == "UILuaCommands.Next" then
    A0_134:catalogSkip(1)
  end
end
function ItemStorageGetWidget.processTimer(A0_140)
  if A0_140:focusToIndex(A0_140.work.listbox, A0_140.work.focus) >= 0 then
    A0_140.work.index = A0_140:focusToIndex(A0_140.work.listbox, A0_140.work.focus)
  end
  A0_140.work.page = 0
  A0_140:updateWindowDisplay(true)
  A0_140:selectedBorder()
end
function ItemStorageGetWidget.catalogSkip(A0_141, A1_142)
  local L2_143, L3_144, L4_145, L5_146, L6_147, L7_148, L8_149, L9_150, L10_151, L11_152, L12_153, L13_154
  L2_143 = A0_141.work
  L2_143 = L2_143.focus
  L4_145 = A0_141
  L3_144 = A0_141.getListBoxFocusNum
  L5_146 = A0_141.work
  L5_146 = L5_146.listbox
  L3_144 = L3_144(L4_145, L5_146)
  L3_144 = L3_144 - 1
  if L3_144 == -1 then
    return
  end
  L4_145 = 2
  L5_146 = A0_141.work
  L5_146 = L5_146.listbox
  if L5_146 ~= 1 then
    L5_146 = 10 * A1_142
    L2_143 = L2_143 + L5_146
  else
    L5_146 = A0_141.work
    L5_146 = L5_146.sorttype
    if L5_146 == 0 then
      L5_146 = 10 * A1_142
      L2_143 = L2_143 + L5_146
    else
      L5_146 = nil
      if A1_142 > 0 then
        L6_147 = A0_141.work
        L6_147 = L6_147.focus
        L5_146 = L3_144 - L6_147
      else
        L6_147 = A0_141.work
        L5_146 = L6_147.focus
      end
      L7_148 = A0_141
      L6_147 = A0_141.getListPropertyName
      L8_149 = A0_141.work
      L8_149 = L8_149.listbox
      L6_147 = L6_147(L7_148, L8_149)
      L7_148 = desktopWidget
      L8_149 = L7_148
      L7_148 = L7_148.getItemSortKey
      L12_153 = 1
      L13_154 = L4_145
      L7_148 = L7_148(L8_149, L9_150, L10_151, L11_152, L12_153, L13_154)
      L8_149 = L2_143
      for L12_153 = 1, L5_146 do
        L8_149 = L8_149 + A1_142
        L13_154 = A0_141.focusToIndex
        L13_154 = L13_154(A0_141, A0_141.work.listbox, L8_149)
        if L7_148 ~= desktopWidget:getItemSortKey(A0_141, L6_147, L13_154, 1, L4_145) then
          L2_143 = L2_143 + L12_153 * A1_142
          break
        end
        if L12_153 == L5_146 then
          if A1_142 > 0 then
            L2_143 = L3_144
          else
            L2_143 = 0
          end
        end
      end
    end
  end
  if L3_144 < L2_143 then
    L2_143 = L3_144
  elseif L2_143 < 0 then
    L2_143 = 0
  end
  L5_146 = A0_141.work
  L5_146 = L5_146.focus
  if L2_143 ~= L5_146 then
    L5_146 = A0_141.work
    L5_146.focus = L2_143
    L6_147 = A0_141
    L5_146 = A0_141.updateWindowDisplay
    L7_148 = true
    L5_146(L6_147, L7_148)
  end
end
function ItemStorageGetWidget.selectedBorder(A0_155, A1_156, A2_157)
  local L3_158, L4_159
  L3_158 = A0_155.getListPropertyName
  L3_158 = L3_158(L4_159, A0_155.work.listbox)
  if A1_156 ~= nil then
    A0_155:setListProperty(L3_158, A0_155.work.index, "selected", L4_159)
    A0_155.work.selected = A0_155.work.index
  elseif L4_159 == -1 and A2_157 == nil then
    return
  else
    for _FORV_7_ = 1, A0_155:getListBoxItemNum(A0_155.work.listbox) do
      A0_155:setListProperty(L3_158, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_159.selected = -1
  end
  L4_159(A0_155, L3_158)
end
function ItemStorageGetWidget.updatePlayerItem(A0_160, A1_161, A2_162)
  if A1_161 == 0 then
    A0_160.work.updatecount = A2_162
  end
  if 0 < A0_160.work.updatecount then
    A0_160.work.updatecount = A0_160.work.updatecount - 1
  end
  if A0_160.work.updatecount == 0 then
    A0_160:displayBagcapacityAndMoney()
  end
  A0_160.work.waitupdate = false
end
function ItemStorageGetWidget.getAskResult(A0_163)
  local L1_164, L2_165, L3_166
  L2_165 = A0_163
  L1_164 = A0_163.getBaseAskResult
  L1_164 = L1_164(L2_165)
  L2_165 = nil
  if L1_164 == 1 then
    L3_166 = A0_163.work
    L3_166.askstatus = false
    L3_166 = A0_163.getListProperty
    L3_166 = L3_166(A0_163, "TabItem_1_Maker", A0_163.work.index, "itemIndex")
    L2_165 = worldMaster:_getMyPlayer():_getStoredItem(A0_163.work.category, L3_166)
    if L2_165 <= 0 then
      L2_165 = nil
    end
    A0_163.work.waitupdate = true
  end
  return L2_165
end
function ItemStorageGetWidget.setAskParameter(A0_167)
  A0_167:updateWindowDisplay(true)
  A0_167.work.askstatus = true
  if A0_167.work.editWidgetOpen == 0 then
    A0_167:selectedBorder()
  end
  A0_167.work.waitNext = false
end
function ItemStorageGetWidget.syncItemWork(A0_168, A1_169)
  A0_168.work.demandSync = false
end
function ItemStorageGetWidget.getAskWaitStatus(A0_170)
  return A0_170.work.askstatus
end
function ItemStorageGetWidget.setConfirmDialogData(A0_171, A1_172)
  A0_171.work.chosenOperation = A1_172
end
function ItemStorageGetWidget.closeConfirmDialog(A0_173, A1_174)
  if A1_174 == nil then
    if A0_173.work.chosenOperation == 1 then
      A0_173:setBaseAskResult(1)
      A0_173:setInputEnable(false)
      A0_173.work.waitNext = true
    elseif A0_173.work.chosenOperation == 2 then
      A0_173.work.editWidgetOpen = 0
      A0_173:selectedBorder(nil, false)
      A0_173:setInputEnable(true)
    end
  end
  A0_173.work.chosenOperation = 0
  if A0_173:getChildWidgetByWindowName("ItemStorageDialogWidget") ~= nil then
  end
  A0_173.work.editWidgetOpen = 0
  A0_173.work.lastcommandtime = worldMaster:_getServerTime()
  if A1_174 == nil then
    A0_173:updateWindowDisplay(true)
  end
end
