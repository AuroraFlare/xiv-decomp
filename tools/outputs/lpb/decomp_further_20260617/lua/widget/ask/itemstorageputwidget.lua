require("/Widget/Ask/AskBaseClass")
_defineClass("ItemStoragePutWidget", "AskBaseClass")
function ItemStoragePutWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function ItemStoragePutWidget.initAsk(A0_2, A1_3)
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
  L2_4.sorttype = desktopWidget:getConfigWork(9)
  L2_4 = A0_2.work
  L2_4.lastsub = 10
  L2_4 = A0_2.work
  L2_4.askstatus = true
  L2_4 = A0_2.setProperty
  L2_4(A0_2, "Title", "@" .. tostring(3901))
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
  A0_2:setConfirmCondition("Button_SortStatus")
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
  A0_2:setInitialData()
  A0_2:setHelpParameter("TabItem_1", 1, 71911)
end
function ItemStoragePutWidget.setInitialData(A0_5)
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
function ItemStoragePutWidget.processBeforeShow(A0_6, A1_7)
  if A1_7 ~= true then
    return true
  elseif A0_6:getChildWidgetByWindowName("ItemStorageDialogWidget") ~= nil then
    A0_6:closeConfirmDialog(true)
  else
    A0_6:updateWindowDisplay(true)
  end
  return true
end
function ItemStoragePutWidget.getListPropertyName(A0_8, A1_9)
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
function ItemStoragePutWidget.updateWindowDisplay(A0_11, A1_12)
  A0_11:setGridVisibility(2)
  if A0_11.work.listbox == 1 then
    A0_11:setVisibility("Button_SortStatus", true)
    A0_11:displaySortType(A0_11.work.sorttype)
  else
    A0_11:setVisibility("Button_SortStatus", false)
  end
  if A1_12 == true then
    A0_11:updateListFocus()
  end
end
function ItemStoragePutWidget.updateListFocus(A0_13)
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
function ItemStoragePutWidget.setGridVisibility(A0_20, A1_21)
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
function ItemStoragePutWidget.setWindowFocus(A0_22, A1_23)
  if A1_23 ~= nil and A1_23 ~= "" then
    A0_22:setLogicalFocus(A1_23)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_22 then
      A0_22:setKeyboardFocusedControl(A1_23)
    end
  end
end
function ItemStoragePutWidget.displayBagcapacityAndMoney(A0_24)
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
function ItemStoragePutWidget.getListBoxName(A0_29, A1_30)
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
function ItemStoragePutWidget.getListBoxItemNum(A0_32, A1_33)
  local L2_34, L3_35
  L3_35 = A0_32
  L2_34 = A0_32.getListPropertyCount
  return L2_34(L3_35, A0_32:getListPropertyName(A1_33))
end
function ItemStoragePutWidget.getListBoxFocusNum(A0_36, A1_37)
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
function ItemStoragePutWidget.focusToIndex(A0_42, A1_43, A2_44)
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
function ItemStoragePutWidget.indexToFocus(A0_46, A1_47, A2_48)
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
function ItemStoragePutWidget.initListBox(A0_51, A1_52)
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
function ItemStoragePutWidget.resetListBox(A0_55, A1_56)
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
function ItemStoragePutWidget.getPackageFromList(A0_59, A1_60)
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
function ItemStoragePutWidget.setItemToXmlLight(A0_62, A1_63, A2_64, A3_65, A4_66, A5_67)
  local L6_68, L7_69, L8_70, L9_71, L10_72, L11_73, L12_74, L13_75, L14_76, L15_77, L16_78, L17_79, L18_80, L19_81, L20_82, L21_83, L22_84, L23_85, L24_86
  L7_69 = A0_62
  L6_68 = A0_62.getListPropertyName
  L8_70 = A1_63
  L6_68 = L6_68(L7_69, L8_70)
  L7_69, L8_70, L9_71, L10_72 = nil, nil, nil, nil
  L11_73 = worldMaster
  L12_74 = L11_73
  L11_73 = L11_73._getMyPlayer
  L11_73 = L11_73(L12_74)
  L12_74 = nil
  if A3_65 > 0 and A4_66 > 0 then
    L14_76 = L11_73
    L13_75 = L11_73._getItem
    L15_77 = A3_65
    L16_78 = A4_66
    L13_75 = L13_75(L14_76, L15_77, L16_78)
    L12_74 = L13_75
  end
  if L12_74 == nil then
    L13_75 = false
    return L13_75
  end
  L14_76 = L12_74
  L13_75 = L12_74._getCatalogID
  L13_75 = L13_75(L14_76)
  L7_69 = L13_75
  L14_76 = L11_73
  L13_75 = L11_73._canStoreItem
  L15_77 = A0_62.work
  L15_77 = L15_77.category
  L16_78 = L7_69
  L13_75 = L13_75(L14_76, L15_77, L16_78)
  if L13_75 == false then
    L13_75 = false
    return L13_75
  end
  L14_76 = L12_74
  L13_75 = L12_74.getItemIcon
  L13_75 = L13_75(L14_76)
  L8_70 = L13_75
  L14_76 = L12_74
  L13_75 = L12_74._isStackable
  L13_75 = L13_75(L14_76)
  L9_71 = L13_75
  L14_76 = L12_74
  L13_75 = L12_74._countStack
  L13_75 = L13_75(L14_76)
  L10_72 = L13_75
  L14_76 = L12_74
  L13_75 = L12_74._getNameIndex
  L13_75 = L13_75(L14_76)
  L14_76 = "TBL_null"
  L15_77 = A0_62.work
  L15_77 = L15_77.sorttype
  L16_78 = 1
  L17_79 = desktopWidget
  L18_80 = L17_79
  L17_79 = L17_79.setItemToXml
  L19_81 = A0_62
  L20_82 = L6_68
  L21_83 = A2_64
  L22_84 = L12_74
  L23_85 = L14_76
  L24_86 = L7_69
  L17_79(L18_80, L19_81, L20_82, L21_83, L22_84, L23_85, L24_86, L8_70, L9_71, L10_72, L13_75, L15_77, true, false, L16_78, A3_65, A4_66, A5_67, false)
  L17_79 = desktopWidget
  L18_80 = L17_79
  L17_79 = L17_79.setItemDetailToXml
  L19_81 = A0_62
  L20_82 = L6_68
  L21_83 = A2_64
  L22_84 = L12_74
  L23_85 = L13_75
  L24_86 = A5_67
  L17_79(L18_80, L19_81, L20_82, L21_83, L22_84, L23_85, L24_86, L16_78)
  L17_79 = desktopWidget
  L18_80 = L17_79
  L17_79 = L17_79.getItemLifeParam
  L19_81 = A0_62
  L20_82 = L12_74
  L21_83 = L17_79(L18_80, L19_81, L20_82)
  L22_84 = 0
  L23_85 = 0
  L24_86 = L12_74.isEquipment
  L24_86 = L24_86(L12_74)
  if L24_86 then
    L24_86 = L12_74.getItemLife
    L24_86 = L24_86(L12_74)
    L22_84 = L24_86
    L24_86 = L12_74.getItemLifeMax
    L24_86 = L24_86(L12_74)
    L23_85 = L24_86
  end
  L24_86 = false
  if L23_85 ~= 0 and L23_85 ~= L22_84 then
    L24_86 = true
  end
  if L12_74:_isEquipping() == true then
    L24_86 = true
  end
  A0_62:setMaskInformation(L6_68, A2_64, L24_86)
  if 0 < A0_62.work.updatecount and A0_62.work.listbox == A1_63 and A0_62:getControlProperty(L6_68, "FilteredIndex") < A0_62.work.focus then
    A0_62.work.focusChange = true
  end
  return true
end
function ItemStoragePutWidget.setSortType(A0_87, A1_88, A2_89)
  local L3_90, L4_91, L5_92
  L4_91 = A0_87
  L3_90 = A0_87.getListProperty
  L5_92 = A1_88
  L3_90 = L3_90(L4_91, L5_92, A2_89, "itemIndex")
  L4_91 = worldMaster
  L5_92 = L4_91
  L4_91 = L4_91._getMyPlayer
  L4_91 = L4_91(L5_92)
  L5_92 = nil
  if L3_90 > 0 then
    L5_92 = L4_91:_getItem(1, L3_90)
  end
  if L5_92 == nil then
    return
  end
  desktopWidget:setSortType(A0_87, A1_88, A2_89, A0_87.work.sorttype, L5_92)
end
function ItemStoragePutWidget.updateSortType(A0_93)
  local L1_94
  L1_94 = A0_93.getListPropertyName
  L1_94 = L1_94(A0_93, 1)
  for _FORV_5_ = 1, A0_93:getListBoxItemNum(1) do
    A0_93:setSortType(L1_94, _FORV_5_ - 1)
  end
  A0_93:updateListProperty(L1_94)
end
function ItemStoragePutWidget.makeList(A0_95)
  local L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104, L10_105, L11_106
  L1_96 = worldMaster
  L2_97 = L1_96
  L1_96 = L1_96._getMyPlayer
  L1_96 = L1_96(L2_97)
  L2_97, L3_98, L4_99, L5_100, L6_101, L7_102 = nil, nil, nil, nil, nil, nil
  L2_97 = 0
  L3_98 = L8_103
  L4_99 = L8_103
  L5_100 = L8_103
  L6_101 = L8_103
  L7_102 = L8_103
  L11_106 = "SourceFirstIndex"
  L8_103(L9_104, L10_105, L11_106, 0)
  L11_106 = "FilteredSortKey"
  L8_103(L9_104, L10_105, L11_106, "sorttype")
  for L11_106 = 1, L5_100 - L6_101 do
    if A0_95:setItemToXmlLight(1, L2_97, 1, L11_106, 1) == true then
      L2_97 = L2_97 + 1
    end
  end
  L11_106 = "SourceCount"
  L8_103(L9_104, L10_105, L11_106, L2_97)
  if L4_99 > L2_97 then
    for L11_106 = L2_97, L4_99 - 1 do
      L4_99 = L4_99 - 1
      A0_95:deleteListProperty(L3_98, L4_99)
    end
  end
  L8_103(L9_104, L10_105)
  L8_103(L9_104)
end
function ItemStoragePutWidget.setMaskInformation(A0_107, A1_108, A2_109, A3_110)
  if A3_110 == true then
    A0_107:setListProperty(A1_108, A2_109, "mask", 1)
    A0_107:setListProperty(A1_108, A2_109, "isEnabled", "False")
    A0_107:setListProperty(A1_108, A2_109, "opacity", "0.5")
  else
    A0_107:setListProperty(A1_108, A2_109, "mask", 0)
    A0_107:setListProperty(A1_108, A2_109, "isEnabled", "True")
    A0_107:setListProperty(A1_108, A2_109, "opacity", "1.0")
  end
end
function ItemStoragePutWidget.displayHelp(A0_111, A1_112)
  A0_111:setText("TextBlock_Help", A1_112)
end
function ItemStoragePutWidget.displayFocusedItemHelp(A0_113)
  local L1_114, L2_115, L3_116, L4_117, L5_118, L6_119, L7_120, L8_121, L9_122, L10_123, L11_124, L12_125, L13_126, L14_127, L15_128
  L1_114 = A0_113.work
  L1_114 = L1_114.updatecount
  if L1_114 > 0 then
    L1_114 = false
    return L1_114
  end
  L2_115 = A0_113
  L1_114 = A0_113.getListBoxFocusNum
  L3_116 = A0_113.work
  L3_116 = L3_116.listbox
  L1_114 = L1_114(L2_115, L3_116)
  if L1_114 == 0 then
    L2_115 = A0_113
    L1_114 = A0_113.displayHelp
    L3_116 = 3140
    L1_114(L2_115, L3_116)
    L1_114 = A0_113.work
    L1_114.bonus1 = false
    L1_114 = A0_113.work
    L1_114.bonus2 = false
    L1_114 = A0_113.work
    L1_114.bonus3 = false
    L1_114 = A0_113.work
    L1_114.itemlife = false
    L1_114 = A0_113.work
    L1_114.page = 0
    L2_115 = A0_113
    L1_114 = A0_113.setGridVisibility
    L3_116 = 1
    L1_114(L2_115, L3_116)
    L1_114 = false
    return L1_114
  end
  L2_115 = A0_113
  L1_114 = A0_113.getListBoxItemNum
  L3_116 = A0_113.work
  L3_116 = L3_116.listbox
  L1_114 = L1_114(L2_115, L3_116)
  L2_115 = A0_113.work
  L2_115 = L2_115.index
  if L1_114 <= L2_115 then
    L1_114 = false
    return L1_114
  end
  L2_115 = A0_113
  L1_114 = A0_113.getListPropertyName
  L3_116 = A0_113.work
  L3_116 = L3_116.listbox
  L1_114 = L1_114(L2_115, L3_116)
  L3_116 = A0_113
  L2_115 = A0_113.getPackageFromList
  L4_117 = A0_113.work
  L4_117 = L4_117.listbox
  L2_115 = L2_115(L3_116, L4_117)
  L4_117 = A0_113
  L3_116 = A0_113.getListProperty
  L5_118 = "TabItem_1_Maker"
  L6_119 = A0_113.work
  L6_119 = L6_119.index
  L7_120 = "itemIndex"
  L3_116 = L3_116(L4_117, L5_118, L6_119, L7_120)
  L4_117 = worldMaster
  L5_118 = L4_117
  L4_117 = L4_117._getMyPlayer
  L4_117 = L4_117(L5_118)
  L5_118 = nil
  L6_119 = 0
  if L2_115 > 0 and L3_116 > 0 then
    L8_121 = L4_117
    L7_120 = L4_117._getItem
    L9_122 = L2_115
    L10_123 = L3_116
    L7_120 = L7_120(L8_121, L9_122, L10_123)
    L5_118 = L7_120
  else
    L7_120 = false
    return L7_120
  end
  if L5_118 ~= nil then
    L8_121 = L5_118
    L7_120 = L5_118._getCatalogID
    L7_120 = L7_120(L8_121)
    L6_119 = L7_120
  else
    L8_121 = A0_113
    L7_120 = A0_113.getListProperty
    L9_122 = L1_114
    L10_123 = A0_113.work
    L10_123 = L10_123.index
    L11_124 = "catalog"
    L7_120 = L7_120(L8_121, L9_122, L10_123, L11_124)
    L6_119 = L7_120
  end
  L7_120 = desktopWidget
  L8_121 = L7_120
  L7_120 = L7_120.setItemDetail
  L9_122 = A0_113
  L10_123 = L5_118
  L11_124 = L1_114
  L7_120(L8_121, L9_122, L10_123, L11_124, L12_125)
  L7_120 = A0_113.work
  L7_120.bazaar = false
  L8_121 = A0_113
  L7_120 = A0_113.setVisibility
  L9_122 = "Grid_RewardMoney"
  L10_123 = false
  L7_120(L8_121, L9_122, L10_123)
  L8_121 = A0_113
  L7_120 = A0_113.setVisibility
  L9_122 = "Grid_RewardItem"
  L10_123 = false
  L7_120(L8_121, L9_122, L10_123)
  L7_120 = nil
  L8_121 = 0
  L9_122 = 0
  L10_123 = 0
  L11_124 = 0
  if L5_118 ~= nil then
    if L12_125 == true then
      for L15_128 = 1, 27 do
        if L5_118:isFitForEquipPoint(L15_128) == true then
          if L8_121 == 0 then
            L8_121 = L15_128
          elseif L9_122 == 0 then
            L9_122 = L15_128
          elseif L10_123 == 0 then
            L10_123 = L15_128
          elseif L11_124 == 0 then
            L11_124 = L15_128
            break
          end
        end
      end
    end
  else
    L15_128 = A0_113.work
    L15_128 = L15_128.index
    L8_121 = L12_125
    L15_128 = A0_113.work
    L15_128 = L15_128.index
    L9_122 = L12_125
    L15_128 = A0_113.work
    L15_128 = L15_128.index
    L10_123 = L12_125
    L15_128 = A0_113.work
    L15_128 = L15_128.index
    L11_124 = L12_125
  end
  if L8_121 ~= 0 then
    L7_120 = L12_125
  end
  if L7_120 == nil and L9_122 ~= 0 then
    L7_120 = L12_125
  end
  if L7_120 == nil and L10_123 ~= 0 then
    L7_120 = L12_125
  end
  if L7_120 == nil and L11_124 ~= 0 then
    L7_120 = L12_125
  end
  L15_128 = A0_113.work
  L12_125.bonus1, L13_126.bonus2, L14_127.bonus3, L15_128.itemlife = desktopWidget:setItemDetailEquip(A0_113, L5_118, L1_114, A0_113.work.index, L7_120)
  L12_125(L13_126, L14_127)
end
function ItemStoragePutWidget.previousSequence(A0_129)
  A0_129:setBaseAskResult(-1)
end
function ItemStoragePutWidget.processUICommandOperate(A0_130, A1_131, A2_132, A3_133, A4_134)
  local L5_135, L6_136
  L5_135 = A2_132
  if L5_135 == "Button_SortStatus" then
    L6_136 = A0_130.changeSortType
    L6_136(A0_130)
    L6_136 = A0_130.work
    L6_136 = L6_136.index
    A0_130:updateSortType()
    if A0_130:indexToFocus(A0_130.work.listbox, L6_136) > -1 then
      A0_130.work.focus = A0_130:indexToFocus(A0_130.work.listbox, L6_136)
    end
    if A0_130:focusToIndex(A0_130.work.listbox, A0_130.work.focus) >= 0 then
      A0_130.work.index = A0_130:focusToIndex(A0_130.work.listbox, A0_130.work.focus)
    end
    A0_130:displaySortType(A0_130.work.sorttype)
    do break end
    break
  else
  end
end
function ItemStoragePutWidget.processUICommandCancel(A0_137, A1_138, A2_139, A3_140, A4_141)
  if A0_137.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_137.work.waitNext == true then
    return false
  end
  if A0_137:isAskFinish() == true then
    return false
  end
  A0_137:previousSequence()
end
function ItemStoragePutWidget.processUICommandClose(A0_142, A1_143, A2_144, A3_145, A4_146)
  A0_142:previousSequence()
end
function ItemStoragePutWidget.processUICommandSelection(A0_147, A1_148, A2_149, A3_150, A4_151)
  local L5_152, L6_153, L7_154, L8_155, L9_156, L10_157, L11_158, L12_159, L13_160, L14_161, L15_162, L16_163, L17_164, L18_165, L19_166, L20_167
  L5_152 = A0_147.work
  L5_152 = L5_152.editWidgetOpen
  if L5_152 ~= 0 then
    L6_153 = A0_147
    L5_152 = A0_147.getChildWidgetByWindowName
    L7_154 = "ItemStorageDialogWidget"
    L5_152 = L5_152(L6_153, L7_154)
    if L5_152 == nil then
      L5_152 = worldMaster
      L6_153 = L5_152
      L5_152 = L5_152._getServerTime
      L5_152 = L5_152(L6_153)
      L6_153 = A0_147.work
      L6_153 = L6_153.lastcommandtime
      L5_152 = L5_152 - L6_153
      if L5_152 > 2 then
        L6_153 = A0_147
        L5_152 = A0_147.closeConfirmDialog
        L7_154 = true
        L5_152(L6_153, L7_154)
      end
    else
      L5_152 = false
      return L5_152
    end
  end
  L5_152 = A0_147.work
  L5_152 = L5_152.waitNext
  if L5_152 == true then
    L5_152 = false
    return L5_152
  end
  L6_153 = A0_147
  L5_152 = A0_147.isAskFinish
  L5_152 = L5_152(L6_153)
  if L5_152 == true then
    L5_152 = false
    return L5_152
  end
  L5_152 = desktopWidget
  L6_153 = L5_152
  L5_152 = L5_152.checkKeyboardFocused
  L7_154 = A0_147
  L5_152 = L5_152(L6_153, L7_154)
  if L5_152 == false then
    return
  end
  L5_152 = A0_147.work
  L5_152.focus = A3_150
  L5_152 = A0_147.work
  L5_152.listbox = A4_151
  L6_153 = A0_147
  L5_152 = A0_147.getListBoxItemNum
  L7_154 = A0_147.work
  L7_154 = L7_154.listbox
  L5_152 = L5_152(L6_153, L7_154)
  if L5_152 == 0 then
    L6_153 = A0_147
    L5_152 = A0_147.updateWindowDisplay
    L7_154 = true
    return L5_152(L6_153, L7_154)
  end
  L5_152 = A0_147.work
  L5_152 = L5_152.focus
  L7_154 = A0_147
  L6_153 = A0_147.getListBoxFocusNum
  L8_155 = A0_147.work
  L8_155 = L8_155.listbox
  L6_153 = L6_153(L7_154, L8_155)
  if L5_152 >= L6_153 then
    L6_153 = A0_147
    L5_152 = A0_147.updateListFocus
    return L5_152(L6_153)
  end
  L6_153 = A0_147
  L5_152 = A0_147.updateWindowDisplay
  L7_154 = true
  L5_152(L6_153, L7_154)
  L5_152 = A0_147.work
  L5_152 = L5_152.waitupdate
  if L5_152 == true then
    return
  end
  L5_152 = A0_147.work
  L5_152 = L5_152.editWidgetOpen
  if L5_152 == 0 then
    L6_153 = A0_147
    L5_152 = A0_147.getListPropertyName
    L7_154 = A0_147.work
    L7_154 = L7_154.listbox
    L5_152 = L5_152(L6_153, L7_154)
    L7_154 = A0_147
    L6_153 = A0_147.getListProperty
    L8_155 = L5_152
    L9_156 = A0_147.work
    L9_156 = L9_156.index
    L10_157 = "isEnabled"
    L6_153 = L6_153(L7_154, L8_155, L9_156, L10_157)
    if L6_153 == true then
      L8_155 = A0_147
      L7_154 = A0_147.getPackageFromList
      L9_156 = A0_147.work
      L9_156 = L9_156.listbox
      L7_154 = L7_154(L8_155, L9_156)
      L9_156 = A0_147
      L8_155 = A0_147.getListProperty
      L10_157 = "TabItem_1_Maker"
      L11_158 = A0_147.work
      L11_158 = L11_158.index
      L12_159 = "itemIndex"
      L8_155 = L8_155(L9_156, L10_157, L11_158, L12_159)
      L9_156 = worldMaster
      L10_157 = L9_156
      L9_156 = L9_156._getMyPlayer
      L9_156 = L9_156(L10_157)
      L10_157 = nil
      L11_158 = 0
      L12_159 = 0
      L13_160 = 0
      L14_161 = false
      L15_162 = ""
      L16_163 = false
      L17_164 = false
      L18_165 = 0
      L19_166 = false
      if L7_154 > 0 and L8_155 > 0 then
        L20_167 = L9_156._getItem
        L20_167 = L20_167(L9_156, L7_154, L8_155)
        L10_157 = L20_167
      else
        L20_167 = false
        return L20_167
      end
      L20_167 = desktopWidget
      L20_167 = L20_167.cantEquipBadge
      L20_167 = L20_167(L20_167, A0_147, L5_152, A0_147.work.index, L10_157)
      L14_161 = L20_167
      if L10_157 ~= nil then
        L20_167 = L10_157._getCatalogID
        L20_167 = L20_167(L10_157)
        L11_158 = L20_167
        L20_167 = L10_157.getItemIcon
        L20_167 = L20_167(L10_157)
        L12_159 = L20_167
        L20_167 = L10_157._getNameIndex
        L20_167 = L20_167(L10_157)
        L13_160 = L20_167
        L20_167 = A0_147.packTextParameter
        L20_167 = L20_167(A0_147, 3202, L11_158, L13_160)
        L15_162 = L20_167
        L20_167 = L10_157.canChangeFitness
        L20_167 = L20_167(L10_157)
        L16_163 = L20_167
        L20_167 = _isInstanceOf
        L20_167 = L20_167(L10_157, "NormalItemBaseClass")
        L17_164 = L20_167
        L20_167 = L10_157.getMaterializePermission
        L20_167 = L20_167(L10_157)
        L19_166 = L20_167
      else
        L20_167 = A0_147.getListProperty
        L20_167 = L20_167(A0_147, L5_152, A0_147.work.index, "catalog")
        L11_158 = L20_167
        L20_167 = A0_147.getListProperty
        L20_167 = L20_167(A0_147, L5_152, A0_147.work.index, "icon")
        L12_159 = L20_167
        L20_167 = A0_147.getListProperty
        L20_167 = L20_167(A0_147, L5_152, A0_147.work.index, "quality")
        L13_160 = L20_167
        L20_167 = A0_147.getListProperty
        L20_167 = L20_167(A0_147, L5_152, A0_147.work.index, "name")
        L15_162 = L20_167
        L20_167 = A0_147.getListProperty
        L20_167 = L20_167(A0_147, L5_152, A0_147.work.index, "canChangeFitness")
        if L20_167 == 1 then
          L16_163 = true
        end
        L20_167 = A0_147.getListProperty
        L20_167 = L20_167(A0_147, L5_152, A0_147.work.index, "isNormal")
        if L20_167 == 1 then
          L17_164 = true
        end
        L20_167 = A0_147.getListProperty
        L20_167 = L20_167(A0_147, L5_152, A0_147.work.index, "mperm")
        if L20_167 == 1 then
          L19_166 = true
        end
      end
      if L16_163 == true and L17_164 == true then
        L20_167 = 0
        if L10_157 ~= nil then
          L20_167 = L10_157:getNormalItemFitness()
        else
          L20_167 = A0_147:getListProperty(L5_152, A0_147.work.index, "fitness")
        end
        L18_165 = _math.floor(L20_167 / 10000 * 100)
        if L18_165 == 0 and L20_167 > 0 then
          L18_165 = 1
        end
      end
      L20_167 = desktopWidget
      L20_167 = L20_167.openChildWidget
      L20_167 = L20_167(L20_167, "ItemStorageDialogWidget", A0_147, true, 1, L11_158, L12_159, L13_160, L15_162, L14_161, L16_163, L18_165, L19_166)
      if L20_167 == true then
        A0_147.work.editWidgetOpen = 1
        return true
      end
    else
      L8_155 = A0_147
      L7_154 = A0_147.getPackageFromList
      L9_156 = A0_147.work
      L9_156 = L9_156.listbox
      L7_154 = L7_154(L8_155, L9_156)
      L9_156 = A0_147
      L8_155 = A0_147.getListProperty
      L10_157 = "TabItem_1_Maker"
      L11_158 = A0_147.work
      L11_158 = L11_158.index
      L12_159 = "itemIndex"
      L8_155 = L8_155(L9_156, L10_157, L11_158, L12_159)
      L9_156 = worldMaster
      L10_157 = L9_156
      L9_156 = L9_156._getMyPlayer
      L9_156 = L9_156(L10_157)
      L10_157 = nil
      L11_158 = 0
      L12_159 = 0
      if L7_154 > 0 and L8_155 > 0 then
        L14_161 = L9_156
        L13_160 = L9_156._getItem
        L15_162 = L7_154
        L16_163 = L8_155
        L13_160 = L13_160(L14_161, L15_162, L16_163)
        L10_157 = L13_160
      else
        L13_160 = false
        return L13_160
      end
      if L10_157 ~= nil then
        L14_161 = L10_157
        L13_160 = L10_157._getCatalogID
        L13_160 = L13_160(L14_161)
        L11_158 = L13_160
        L14_161 = L10_157
        L13_160 = L10_157._getNameIndex
        L13_160 = L13_160(L14_161)
        L12_159 = L13_160
        L13_160 = 0
        L14_161 = 0
        L16_163 = L10_157
        L15_162 = L10_157.isEquipment
        L15_162 = L15_162(L16_163)
        if L15_162 then
          L16_163 = L10_157
          L15_162 = L10_157.getItemLife
          L15_162 = L15_162(L16_163)
          L13_160 = L15_162
          L16_163 = L10_157
          L15_162 = L10_157.getItemLifeMax
          L15_162 = L15_162(L16_163)
          L14_161 = L15_162
        end
        if L14_161 ~= 0 and L14_161 ~= L13_160 then
          L15_162 = worldMaster
          L16_163 = L15_162
          L15_162 = L15_162.alert
          L17_164 = worldMaster
          L18_165 = 40276
          L19_166 = L11_158
          L20_167 = L12_159
          L15_162(L16_163, L17_164, L18_165, L19_166, L20_167)
        else
          L16_163 = L10_157
          L15_162 = L10_157._isEquipping
          L15_162 = L15_162(L16_163)
          if L15_162 == true then
            L15_162 = worldMaster
            L16_163 = L15_162
            L15_162 = L15_162.alert
            L17_164 = worldMaster
            L18_165 = 40281
            L19_166 = L11_158
            L20_167 = L12_159
            L15_162(L16_163, L17_164, L18_165, L19_166, L20_167)
          else
          end
        end
      else
        L14_161 = A0_147
        L13_160 = A0_147.getListProperty
        L15_162 = L5_152
        L16_163 = A0_147.work
        L16_163 = L16_163.index
        L17_164 = "catalog"
        L13_160 = L13_160(L14_161, L15_162, L16_163, L17_164)
        L11_158 = L13_160
        L14_161 = A0_147
        L13_160 = A0_147.getListProperty
        L15_162 = L5_152
        L16_163 = A0_147.work
        L16_163 = L16_163.index
        L17_164 = "quality"
        L13_160 = L13_160(L14_161, L15_162, L16_163, L17_164)
        L12_159 = L13_160
        L14_161 = A0_147
        L13_160 = A0_147.getListProperty
        L15_162 = L5_152
        L16_163 = A0_147.work
        L16_163 = L16_163.index
        L17_164 = "itemlife"
        L13_160 = L13_160(L14_161, L15_162, L16_163, L17_164)
        L15_162 = A0_147
        L14_161 = A0_147.getListProperty
        L16_163 = L5_152
        L17_164 = A0_147.work
        L17_164 = L17_164.index
        L18_165 = "lifemax"
        L14_161 = L14_161(L15_162, L16_163, L17_164, L18_165)
        if L14_161 ~= 0 and L14_161 ~= L13_160 then
          L15_162 = worldMaster
          L16_163 = L15_162
          L15_162 = L15_162.alert
          L17_164 = worldMaster
          L18_165 = 40276
          L19_166 = L11_158
          L20_167 = L12_159
          L15_162(L16_163, L17_164, L18_165, L19_166, L20_167)
        else
          L16_163 = A0_147
          L15_162 = A0_147.getListProperty
          L17_164 = L5_152
          L18_165 = A0_147.work
          L18_165 = L18_165.index
          L19_166 = "isEquipping"
          L15_162 = L15_162(L16_163, L17_164, L18_165, L19_166)
          if L15_162 == 1 then
            L15_162 = worldMaster
            L16_163 = L15_162
            L15_162 = L15_162.alert
            L17_164 = worldMaster
            L18_165 = 40281
            L19_166 = L11_158
            L20_167 = L12_159
            L15_162(L16_163, L17_164, L18_165, L19_166, L20_167)
          else
          end
        end
      end
      L13_160 = false
      return L13_160
    end
  end
  L5_152 = A0_147.work
  L6_153 = worldMaster
  L7_154 = L6_153
  L6_153 = L6_153._getServerTime
  L6_153 = L6_153(L7_154)
  L5_152.lastcommandtime = L6_153
end
function ItemStoragePutWidget.processUICommandDefault(A0_168, A1_169, A2_170, A3_171, A4_172, A5_173)
  if A0_168.work.editWidgetOpen ~= 0 then
    if A0_168:getChildWidgetByWindowName("ItemStorageDialogWidget") == nil and worldMaster:_getServerTime() - A0_168.work.lastcommandtime > 2 then
      A0_168:closeConfirmDialog(true)
    else
      return false
    end
  end
  if A0_168.work.waitNext == true then
    return false
  end
  if A0_168:isAskFinish() == true then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_168) == false then
    return
  end
  if A3_171 == "UILuaCommands.MouseEnteredItem" or A3_171 == "UILuaCommands.AnchoredItem" then
    if A5_173 == nil then
      return
    end
    if A4_172 == nil or A4_172 < 0 then
      return
    end
    A0_168.work.listbox = A5_173
    A0_168.work.focus = A4_172
    A0_168:setCommonTimer(0.2)
  elseif A3_171 == "UILuaCommands.Previous" then
    A0_168:catalogSkip(-1)
  elseif A3_171 == "UILuaCommands.Next" then
    A0_168:catalogSkip(1)
  end
end
function ItemStoragePutWidget.processTimer(A0_174)
  if A0_174:focusToIndex(A0_174.work.listbox, A0_174.work.focus) >= 0 then
    A0_174.work.index = A0_174:focusToIndex(A0_174.work.listbox, A0_174.work.focus)
  end
  A0_174.work.page = 0
  A0_174:updateWindowDisplay(true)
  A0_174:selectedBorder()
end
function ItemStoragePutWidget.catalogSkip(A0_175, A1_176)
  local L2_177, L3_178, L4_179, L5_180, L6_181, L7_182, L8_183, L9_184, L10_185, L11_186, L12_187, L13_188
  L2_177 = A0_175.work
  L2_177 = L2_177.focus
  L4_179 = A0_175
  L3_178 = A0_175.getListBoxFocusNum
  L5_180 = A0_175.work
  L5_180 = L5_180.listbox
  L3_178 = L3_178(L4_179, L5_180)
  L3_178 = L3_178 - 1
  if L3_178 == -1 then
    return
  end
  L4_179 = 2
  L5_180 = A0_175.work
  L5_180 = L5_180.listbox
  if L5_180 ~= 1 then
    L5_180 = 10 * A1_176
    L2_177 = L2_177 + L5_180
  else
    L5_180 = A0_175.work
    L5_180 = L5_180.sorttype
    if L5_180 == 0 then
      L5_180 = 10 * A1_176
      L2_177 = L2_177 + L5_180
    else
      L5_180 = nil
      if A1_176 > 0 then
        L6_181 = A0_175.work
        L6_181 = L6_181.focus
        L5_180 = L3_178 - L6_181
      else
        L6_181 = A0_175.work
        L5_180 = L6_181.focus
      end
      L7_182 = A0_175
      L6_181 = A0_175.getListPropertyName
      L8_183 = A0_175.work
      L8_183 = L8_183.listbox
      L6_181 = L6_181(L7_182, L8_183)
      L7_182 = desktopWidget
      L8_183 = L7_182
      L7_182 = L7_182.getItemSortKey
      L12_187 = 1
      L13_188 = L4_179
      L7_182 = L7_182(L8_183, L9_184, L10_185, L11_186, L12_187, L13_188)
      L8_183 = L2_177
      for L12_187 = 1, L5_180 do
        L8_183 = L8_183 + A1_176
        L13_188 = A0_175.focusToIndex
        L13_188 = L13_188(A0_175, A0_175.work.listbox, L8_183)
        if L7_182 ~= desktopWidget:getItemSortKey(A0_175, L6_181, L13_188, 1, L4_179) then
          L2_177 = L2_177 + L12_187 * A1_176
          break
        end
        if L12_187 == L5_180 then
          if A1_176 > 0 then
            L2_177 = L3_178
          else
            L2_177 = 0
          end
        end
      end
    end
  end
  if L3_178 < L2_177 then
    L2_177 = L3_178
  elseif L2_177 < 0 then
    L2_177 = 0
  end
  L5_180 = A0_175.work
  L5_180 = L5_180.focus
  if L2_177 ~= L5_180 then
    L5_180 = A0_175.work
    L5_180.focus = L2_177
    L6_181 = A0_175
    L5_180 = A0_175.updateWindowDisplay
    L7_182 = true
    L5_180(L6_181, L7_182)
  end
end
function ItemStoragePutWidget.selectedBorder(A0_189, A1_190, A2_191)
  local L3_192, L4_193
  L3_192 = A0_189.getListPropertyName
  L3_192 = L3_192(L4_193, A0_189.work.listbox)
  if A1_190 ~= nil then
    A0_189:setListProperty(L3_192, A0_189.work.index, "selected", L4_193)
    A0_189.work.selected = A0_189.work.index
  elseif L4_193 == -1 and A2_191 == nil then
    return
  else
    for _FORV_7_ = 1, A0_189:getListBoxItemNum(A0_189.work.listbox) do
      A0_189:setListProperty(L3_192, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_193.selected = -1
  end
  L4_193(A0_189, L3_192)
end
function ItemStoragePutWidget.updatePlayerItem(A0_194, A1_195, A2_196)
  local L3_197, L4_198
  L3_197 = -1
  if A1_195 == 0 then
    L4_198 = A0_194.work
    L4_198.updatecount = A2_196
    L4_198 = A0_194.work
    L4_198.indexChange = false
    L4_198 = A0_194.work
    L4_198.focusChange = false
    return
  else
    if A1_195 == 1 then
      L3_197 = 1
    end
    L4_198 = A0_194.work
    L4_198 = L4_198.chosenPackage
    if L4_198 == A1_195 then
      L4_198 = A0_194.work
      L4_198 = L4_198.chosenItem
      if L4_198 == A2_196 then
        L4_198 = A0_194.work
        L4_198 = L4_198.editWidgetOpen
        if L4_198 ~= 0 then
          L4_198 = A0_194.work
          L4_198.closeok = true
        end
      end
    end
  end
  L4_198 = A0_194.work
  L4_198 = L4_198.updatecount
  if L4_198 > 0 then
    L4_198 = A0_194.work
    L4_198.updatecount = A0_194.work.updatecount - 1
  end
  L4_198 = A0_194.work
  L4_198 = L4_198.updatecount
  if L4_198 == 0 then
    if L3_197 ~= -1 then
      L4_198 = A0_194.getListPropertyName
      L4_198 = L4_198(A0_194, L3_197)
      A0_194:updateListProperty(L4_198)
    end
    L4_198 = A0_194.work
    L4_198 = L4_198.closeok
    if L4_198 == true then
      L4_198 = A0_194.closeConfirmDialog
      L4_198(A0_194, true)
      L4_198 = A0_194.work
      L4_198.closeok = false
    end
    L4_198 = A0_194.work
    L4_198 = L4_198.listbox
    if L3_197 == L4_198 then
      L4_198 = A0_194.makeList
      L4_198(A0_194)
      L4_198 = A0_194.updateListFocus
      L4_198(A0_194)
    end
  end
  L4_198 = A0_194.work
  L4_198.waitupdate = false
end
function ItemStoragePutWidget.getAskResult(A0_199)
  local L1_200, L2_201, L3_202, L4_203, L5_204, L6_205, L7_206
  L2_201 = A0_199
  L1_200 = A0_199.getBaseAskResult
  L1_200 = L1_200(L2_201)
  L2_201 = nil
  if L1_200 == 1 then
    L3_202 = A0_199.work
    L3_202.askstatus = false
    L4_203 = A0_199
    L3_202 = A0_199.getPackageFromList
    L5_204 = A0_199.work
    L5_204 = L5_204.listbox
    L3_202 = L3_202(L4_203, L5_204)
    L5_204 = A0_199
    L4_203 = A0_199.getListProperty
    L6_205 = "TabItem_1_Maker"
    L7_206 = A0_199.work
    L7_206 = L7_206.index
    L4_203 = L4_203(L5_204, L6_205, L7_206, "itemIndex")
    L5_204 = worldMaster
    L6_205 = L5_204
    L5_204 = L5_204._getMyPlayer
    L5_204 = L5_204(L6_205)
    L6_205 = nil
    L7_206 = A0_199.getListPropertyName
    L7_206 = L7_206(A0_199, A0_199.work.listbox)
    if L3_202 > 0 and L4_203 > 0 then
      L6_205 = L5_204:_getItem(L3_202, L4_203)
      if L6_205 ~= nil then
        L2_201 = L6_205:_getCatalogID()
      else
        L2_201 = A0_199:getListProperty(L7_206, A0_199.work.index, "catalog")
      end
      if L2_201 <= 0 then
        L2_201 = nil
      end
    else
      L2_201 = nil
    end
    A0_199.work.waitupdate = true
  end
  L4_203 = A0_199
  L3_202 = A0_199.saveSortType
  L3_202(L4_203)
  return L2_201
end
function ItemStoragePutWidget.setAskParameter(A0_207)
  A0_207:updateWindowDisplay(true)
  A0_207.work.askstatus = true
  if A0_207.work.editWidgetOpen == 0 then
    A0_207:selectedBorder()
  end
  A0_207.work.waitNext = false
end
function ItemStoragePutWidget.syncItemWork(A0_208, A1_209)
  A0_208.work.demandSync = false
end
function ItemStoragePutWidget.getAskWaitStatus(A0_210)
  return A0_210.work.askstatus
end
function ItemStoragePutWidget.setConfirmDialogData(A0_211, A1_212)
  A0_211.work.chosenOperation = A1_212
end
function ItemStoragePutWidget.closeConfirmDialog(A0_213, A1_214)
  if A1_214 == nil then
    if A0_213.work.chosenOperation == 1 then
      A0_213:setBaseAskResult(1)
      A0_213:setInputEnable(false)
      A0_213.work.waitNext = true
    elseif A0_213.work.chosenOperation == 2 then
      A0_213.work.editWidgetOpen = 0
      A0_213:selectedBorder(nil, false)
      A0_213:setInputEnable(true)
    end
  end
  A0_213.work.chosenOperation = 0
  if A0_213:getChildWidgetByWindowName("ItemStorageDialogWidget") ~= nil then
  end
  A0_213.work.editWidgetOpen = 0
  A0_213.work.lastcommandtime = worldMaster:_getServerTime()
  if A1_214 == nil then
    A0_213:updateWindowDisplay(true)
  end
end
function ItemStoragePutWidget.displaySortType(A0_215, A1_216)
  desktopWidget:displaySortType(A1_216, A0_215, "Button_SortStatus")
end
function ItemStoragePutWidget.changeSortType(A0_217)
  A0_217.work.sorttype = desktopWidget:changeSortType(A0_217.work.sorttype)
end
function ItemStoragePutWidget.saveSortType(A0_218)
  desktopWidget:saveSortType(A0_218.work.sorttype)
end
