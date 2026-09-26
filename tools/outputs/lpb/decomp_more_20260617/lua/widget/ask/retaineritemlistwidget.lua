require("/Widget/Ask/AskBaseClass")
_defineClass("RetainerItemListWidget", "AskBaseClass")
function RetainerItemListWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function RetainerItemListWidget.initAsk(A0_2, A1_3)
  local L2_4
  L2_4 = A0_2.work
  L2_4._temp = {
    {"chosenItem", "integer32"},
    {
      "chosenPackage",
      "integer8"
    },
    {
      "chosenOwner",
      "integer8"
    },
    {
      "chosenOperation",
      "integer16"
    },
    {"resultItem", "integer32"},
    {
      "resultPackage",
      "integer8"
    },
    {
      "resultCount",
      "integer32"
    },
    {"mode", "integer16"},
    {"index", "integer16"},
    {"focus", "integer16"},
    {"selected", "integer16"},
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
    {"bonus1", "boolean"},
    {"bonus2", "boolean"},
    {"bonus3", "boolean"},
    {"itemlife", "boolean"},
    {"bazaar", "boolean"},
    {"bazaarItem", "integer32"},
    {
      "bazaarItemPackage",
      "integer8"
    },
    {"rewardItem", "integer32"},
    {
      "rewardPackage",
      "integer8"
    },
    {
      "rewardPrice",
      "integer32"
    },
    {
      "rewardCount",
      "integer32"
    },
    {"bazaartype", "integer32"},
    {
      "editWidgetOpen",
      "integer8"
    },
    {"submenu", "boolean"},
    {
      "bazaaritemget",
      "boolean"
    },
    {
      "updatecount",
      "integer16"
    },
    {
      "updatecountbaz",
      "integer16"
    },
    {
      "resultForAsk",
      "integer16"
    },
    {"closeok", "boolean"},
    {"demandSync", "boolean"},
    {"sorttype", "integer8"},
    {"compare", "boolean"},
    {
      "retainerBagCapacity",
      "integer16"
    },
    {
      "retainerMoneyCapacity",
      "integer16"
    },
    {
      "retainerBazaarCapacity",
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
    {"moneyIndex", "integer16"},
    {"moneyCount", "integer32"},
    {"error", "boolean"},
    {"lastsub", "integer8"},
    {"waittrash", "boolean"},
    {"sdsize", "boolean"},
    {"bakcatalog", "integer32"},
    {"bakquality", "integer8"},
    {"bakstack", "integer32"},
    {"bakrare", "boolean"},
    {"bakex", "boolean"},
    {
      "bakbazaarkind",
      "integer8"
    },
    {"bakprice", "integer32"},
    {
      "bakattached",
      "boolean"
    },
    {
      "lastoperatetime",
      "integer32"
    },
    {"inputok", "boolean"},
    {"waittime", "integer8"},
    {
      "isMateriaList",
      "boolean"
    }
  }
  L2_4 = A0_2.work
  L2_4.chosenItem = 0
  L2_4 = A0_2.work
  L2_4.chosenOperation = -1
  L2_4 = A0_2.work
  L2_4.updatecount = 0
  L2_4 = A0_2.work
  L2_4.updatecountbaz = 0
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
  L2_4.closeok = false
  L2_4 = A0_2.work
  L2_4.demandSync = false
  L2_4 = A0_2.work
  L2_4.sorttype = desktopWidget:getConfigWork(9)
  L2_4 = A0_2.work
  L2_4.focus = 0
  L2_4 = A0_2.work
  L2_4.submenu = false
  L2_4 = A0_2.work
  L2_4.lastsub = 10
  L2_4 = A0_2.work
  L2_4.waittrash = false
  L2_4 = A0_2.work
  L2_4.inputok = false
  L2_4 = A0_2.work
  L2_4.waittime = 1
  L2_4 = A0_2.initForm
  L2_4(A0_2)
  L2_4 = A0_2.work
  L2_4.isMateriaList = false
  L2_4 = A0_2.setVisibility
  L2_4(A0_2, "TabItem_4", false)
  L2_4 = A0_2.setVisibility
  L2_4(A0_2, "TabItem_5", false)
  L2_4 = A0_2.setVisibility
  L2_4(A0_2, "TabItem_6", false)
  L2_4 = A0_2.initListBox
  L2_4(A0_2, 1)
  L2_4 = A0_2.initListBox
  L2_4(A0_2, 2)
  L2_4 = A0_2.initListBox
  L2_4(A0_2, 3)
  L2_4 = A0_2.initListBox
  L2_4(A0_2, 4)
  L2_4 = A0_2.initListBox
  L2_4(A0_2, 5)
  L2_4 = desktopWidget
  L2_4 = L2_4.isValidRetainer
  L2_4 = L2_4(L2_4)
  if L2_4 == false then
    L2_4 = A0_2.work
    L2_4.error = true
  else
    L2_4 = A0_2.work
    L2_4.error = false
  end
  L2_4 = A0_2.work
  L2_4 = L2_4.error
  if L2_4 == false then
    L2_4 = desktopWidget
    L2_4 = L2_4.getRetainerName
    L2_4 = L2_4(L2_4)
    if L2_4 ~= nil then
      A0_2:setText("TextBlock_ActorName", 230, L2_4)
    else
      A0_2:setText("TextBlock_ActorName", "???")
    end
    A0_2:setStyle("TextBlock_ActorName", "TBL_myRetainer")
    A0_2.work.retainerBagCapacity = desktopWidget:getRetainerItemPackageCapacity(1)
    A0_2.work.retainerMoneyCapacity = desktopWidget:getRetainerItemPackageCapacity(100)
    A0_2.work.retainerBazaarCapacity = desktopWidget:getRetainerItemPackageCapacity(8)
    A0_2:setControlProperty(A0_2:getListBoxName(1), "SourceFirstIndex", 0)
    A0_2:setControlProperty(A0_2:getListBoxName(1), "SourceCount", A0_2.work.retainerBagCapacity)
    A0_2:setControlProperty(A0_2:getListPropertyName(1), "FilteredSortKey", "sorttype")
    A0_2:setControlProperty(A0_2:getListBoxName(2), "SourceFirstIndex", 0)
    A0_2:setControlProperty(A0_2:getListBoxName(2), "SourceCount", A0_2.work.retainerMoneyCapacity)
    A0_2:setControlProperty(A0_2:getListPropertyName(2), "FilteredSortKey", "sorttype")
    A0_2:setControlProperty(A0_2:getListBoxName(3), "SourceFirstIndex", 0)
    A0_2:setControlProperty(A0_2:getListBoxName(3), "SourceCount", A0_2.work.retainerBazaarCapacity)
    A0_2:setControlProperty(A0_2:getListPropertyName(3), "FilteredSortKey", "sorttype")
    A0_2:setInitialData(A1_3)
  else
    L2_4 = A0_2.setText
    L2_4(A0_2, "TextBlock_ActorName", " ")
  end
  L2_4 = A0_2.displayBagcapacityAndMoney
  L2_4(A0_2)
  L2_4 = A0_2.setHelpParameter
  L2_4(A0_2, "TextBlock_ActorName", 1, 76102)
end
function RetainerItemListWidget.setInitialData(A0_5, A1_6)
  A0_5:setModal(true)
  A0_5:resetListBox(1)
  A0_5:resetListBox(2)
  A0_5:resetListBox(3)
  A0_5:resetListBox(4)
  A0_5:resetListBox(5)
  A0_5:makeListFromPackage()
  A0_5.work.listbox = 1
  A0_5:changeList()
  A0_5:setText("TextBlock_Title", 3207)
end
function RetainerItemListWidget.initForm(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12
  L1_8(L2_9)
  L1_8(L2_9, L3_10)
  L1_8(L2_9, L3_10)
  L1_8(L2_9, L3_10)
  for L4_11 = 1, 5 do
    L5_12 = "TabItem_"
    L5_12 = L5_12 .. tostring(L4_11)
    A0_7:setCancelCondition(L5_12)
  end
  L4_11 = "UILuaCommands.TabChanged"
  L1_8(L2_9, L3_10, L4_11)
  L4_11 = 214
  L5_12 = 10091
  L1_8(L2_9, L3_10, L4_11, L5_12)
  L4_11 = 214
  L5_12 = 10093
  L1_8(L2_9, L3_10, L4_11, L5_12)
  L4_11 = ""
  L1_8(L2_9, L3_10, L4_11)
  L4_11 = 3207
  L1_8(L2_9, L3_10, L4_11)
  L1_8(L2_9, L3_10)
  L4_11 = false
  L1_8(L2_9, L3_10, L4_11)
end
function RetainerItemListWidget.processBeforeShow(A0_13, A1_14)
  if A1_14 ~= true then
    if A0_13.work.error == true or desktopWidget:isValidRetainer() == false then
      A0_13.work.chosenOperation = 1
      return desktopWidget:closeWidgetDirect(A0_13)
    end
    A0_13.work.inputok = true
  end
  return true
end
function RetainerItemListWidget.getListPropertyName(A0_15, A1_16)
  local L2_17
  if A1_16 == 1 then
    L2_17 = "TabItem_1_Maker"
    return L2_17
  elseif A1_16 == 2 then
    L2_17 = "TabItem_2_Maker"
    return L2_17
  elseif A1_16 == 3 then
    L2_17 = "TabItem_3_Maker"
    return L2_17
  elseif A1_16 == 4 then
    L2_17 = "TabItem_4_Maker"
    return L2_17
  elseif A1_16 == 5 then
    L2_17 = "TabItem_5_Maker"
    return L2_17
  elseif A1_16 == 6 then
    L2_17 = "TabItem_6_Maker"
    return L2_17
  elseif A1_16 == 8 then
    L2_17 = "SlotItem_Maker"
    return L2_17
  elseif A1_16 == 9 then
    L2_17 = "HelpCache_Maker"
    return L2_17
  end
end
function RetainerItemListWidget.updateWindowDisplay(A0_18, A1_19)
  A0_18:setGridVisibility(8)
  if A0_18.work.isMateriaList then
    A0_18:setVisibility("Grid_MateriaEquipList", true)
    A0_18:setVisibility("Grid_TabList", false)
  end
  if A0_18.work.listbox == 1 then
    A0_18:setVisibility("Button_SortStatus", true)
    A0_18:displaySortType(A0_18.work.sorttype)
  else
    A0_18:setVisibility("Button_SortStatus", false)
  end
  if A1_19 == true then
    A0_18:updateListFocus()
  end
end
function RetainerItemListWidget.updateListFocus(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26
  L2_22 = A0_20
  L1_21 = A0_20.getListBoxFocusNum
  L3_23 = A0_20.work
  L3_23 = L3_23.listbox
  L4_24 = L1_21(L2_22, L3_23)
  L6_26 = A0_20
  L5_25 = A0_20.getListBoxName
  L5_25 = L5_25(L6_26, A0_20.work.listbox)
  L6_26 = "TextBlock_NoContents_"
  L6_26 = L6_26 .. tostring(A0_20.work.listbox)
  if L1_21 == 0 then
    if A0_20.work.editWidgetOpen == 2 then
      A0_20:closeBazaarEdit(1)
    elseif A0_20.work.editWidgetOpen == 1 then
      A0_20:closeItemEdit(1)
    elseif A0_20.work.editWidgetOpen == 3 or A0_20.work.editWidgetOpen == 4 then
      A0_20:closeItemShare(1)
    end
    if A0_20.work.submenu == true and A0_20:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
      A0_20:getChildWidgetByWindowName("ItemSubWidget"):hide()
      A0_20.work.submenu = false
    end
    A0_20:setVisibility(L6_26, true)
    A0_20.work.editWidgetOpen = 0
    A0_20:displayFocusedItemHelp()
    A0_20:setWindowFocus(L6_26)
  else
    A0_20:setVisibility(L6_26, false)
    if A0_20.work.focus > L1_21 - 1 then
      A0_20.work.focus = L1_21 - 1
    end
    if 0 <= A0_20:focusToIndex(A0_20.work.listbox, A0_20.work.focus) then
      A0_20.work.index = A0_20:focusToIndex(A0_20.work.listbox, A0_20.work.focus)
    end
    A0_20:setControlProperty(L5_25, "SqwtFocusedIndex", A0_20.work.focus)
    A0_20:setFocusedIndex(L5_25, A0_20.work.focus)
    A0_20:setWindowFocus(L5_25)
    A0_20:displayFocusedItemHelp()
  end
end
function RetainerItemListWidget.setGridVisibility(A0_27, A1_28)
  A0_27:setVisibility("Grid_TabList", true)
  A0_27:setVisibility("Grid_ActorName", true)
  A0_27:setVisibility("Grid_Help", A1_28 == 1 or A1_28 == 2 or A1_28 == 4 or A1_28 == 5 or A1_28 == 7)
  A0_27:setVisibility("Grid_BackpackAndGil", true)
  A0_27:setVisibility("Grid_ItemNameBase", A1_28 == 6 or A1_28 == 8 or A1_28 == 9 or A1_28 == 10)
  A0_27:setVisibility("Grid_ItemDetail1", A0_27.work.bonus1)
  A0_27:setVisibility("Grid_ItemDetail2", A0_27.work.bonus2)
  A0_27:setVisibility("Grid_ItemDetail3", A0_27.work.bonus3 or A0_27.work.itemlife or A0_27.work.bazaar)
  A0_27:setVisibility("Label_ItemBonus5", A0_27.work.bonus3)
  A0_27:setVisibility("Grid_ItemLife", A0_27.work.itemlife)
  A0_27:setVisibility("Grid_ItemBazaarInformation", A0_27.work.bazaar)
  A0_27:setVisibility("Grid_MateriaAttachBazaarInformation", false)
end
function RetainerItemListWidget.setWindowFocus(A0_29, A1_30)
  if A1_30 ~= nil and A1_30 ~= "" then
    A0_29:setLogicalFocus(A1_30)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_29 then
      A0_29:setKeyboardFocusedControl(A1_30)
    end
  end
end
function RetainerItemListWidget.displayBagcapacityAndMoney(A0_31)
  local L1_32
  L1_32 = A0_31.getListBoxItemNum
  L1_32 = L1_32(A0_31, 1)
  A0_31:setText("TextBlock_Gil", 3263, A0_31.work.retainerMoneyCount)
  A0_31:setText("TextBlock_ItemStack_2", 3551, L1_32, A0_31.work.retainerBagCapacity)
end
function RetainerItemListWidget.isExistItem(A0_33, A1_34, A2_35, A3_36)
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
  elseif A3_36 == 4 then
    if desktopWidget:getRetainerItem(A1_34, A2_35) ~= nil then
      return true
    else
      return false
    end
  end
end
function RetainerItemListWidget.checkPackageAndIndex(A0_37, A1_38, A2_39, A3_40, A4_41)
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
  elseif A4_41 == 4 then
    if desktopWidget:getRetainerItem(A2_39, A3_40) == A1_38 then
      return true
    else
      return false
    end
  end
end
function RetainerItemListWidget.getSelectedTab(A0_42)
  return A0_42:getSelectedIndex("TabControl_ItemList") + 1
end
function RetainerItemListWidget.getListBoxName(A0_43, A1_44)
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
  elseif A1_44 == 6 then
    L2_45 = "ListBox_TabItem_6"
    return L2_45
  else
    L2_45 = ""
    return L2_45
  end
end
function RetainerItemListWidget.getListBoxItemNum(A0_46, A1_47)
  local L2_48, L3_49
  L3_49 = A0_46
  L2_48 = A0_46.getListPropertyCount
  return L2_48(L3_49, A0_46:getListPropertyName(A1_47))
end
function RetainerItemListWidget.getListBoxFocusNum(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55
  L3_53 = A0_50
  L2_52 = A0_50.getListBoxItemNum
  L4_54 = A1_51
  L2_52 = L2_52(L3_53, L4_54)
  L4_54 = A0_50
  L3_53 = A0_50.getListPropertyName
  L5_55 = A1_51
  L3_53 = L3_53(L4_54, L5_55)
  if L2_52 == 0 then
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
function RetainerItemListWidget.focusToIndex(A0_56, A1_57, A2_58)
  local L3_59
  L3_59 = A0_56.getListPropertyName
  L3_59 = L3_59(A0_56, A1_57)
  if A0_56:getListBoxFocusNum(A1_57) == 0 or A2_58 >= A0_56:getListBoxFocusNum(A1_57) or A2_58 < 0 then
    return -1
  else
    A0_56:setControlProperty(L3_59, "FilteredIndex", A2_58)
    return A0_56:getControlProperty(L3_59, "Index")
  end
end
function RetainerItemListWidget.indexToFocus(A0_60, A1_61, A2_62)
  local L3_63, L4_64
  L3_63 = -1
  L4_64 = A0_60.getListPropertyName
  L4_64 = L4_64(A0_60, A1_61)
  if A0_60:getListBoxFocusNum(A1_61) > 0 then
    A0_60:setControlProperty(L4_64, "Index", A2_62)
    L3_63 = A0_60:getControlProperty(L4_64, "FilteredIndex")
  end
  return L3_63
end
function RetainerItemListWidget.initListBox(A0_65, A1_66)
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
function RetainerItemListWidget.resetListBox(A0_69, A1_70)
  local L2_71, L3_72, L4_73, L5_74
  L3_72 = A0_69
  L2_71 = A0_69.getListBoxItemNum
  L4_73 = A1_70
  L2_71 = L2_71(L3_72, L4_73)
  L4_73 = A0_69
  L3_72 = A0_69.getListPropertyName
  L5_74 = A1_70
  L3_72 = L3_72(L4_73, L5_74)
  L5_74 = A0_69
  L4_73 = A0_69.getListBoxName
  L4_73 = L4_73(L5_74, A1_70)
  L5_74 = "TextBlock_NoContents_"
  L5_74 = L5_74 .. tostring(A1_70)
  A0_69:setVisibility(L5_74, true)
  if L2_71 == 0 then
    return
  else
    for _FORV_9_ = 1, L2_71 do
      L2_71 = L2_71 - 1
      A0_69:deleteListProperty(L3_72, L2_71)
    end
    A0_69:updateListProperty(L3_72)
  end
end
function RetainerItemListWidget.getPackageFromList(A0_75, A1_76)
  local L2_77
  L2_77 = 1
  if A1_76 == 1 then
    L2_77 = 1
  elseif A1_76 == 2 then
    L2_77 = 100
  elseif A1_76 == 3 then
    L2_77 = 8
  elseif A1_76 == 4 then
    L2_77 = 5
  elseif A1_76 == 5 then
    L2_77 = 100
  end
  return L2_77
end
function RetainerItemListWidget.setItemToXmlLight(A0_78, A1_79, A2_80, A3_81, A4_82, A5_83)
  local L6_84, L7_85, L8_86, L9_87, L10_88, L11_89, L12_90, L13_91, L14_92, L15_93, L16_94, L17_95, L18_96
  L7_85 = A0_78
  L6_84 = A0_78.getListPropertyName
  L8_86 = A1_79
  L7_85 = L6_84(L7_85, L8_86)
  L8_86, L9_87, L10_88, L11_89 = nil, nil, nil, nil
  L12_90 = worldMaster
  L13_91 = L12_90
  L12_90 = L12_90._getMyPlayer
  L12_90 = L12_90(L13_91)
  L13_91, L14_92 = nil, nil
  if A3_81 > 0 and A4_82 > 0 then
    L15_93 = desktopWidget
    L16_94 = L15_93
    L15_93 = L15_93.getRetainerItem
    L17_95 = A3_81
    L18_96 = A4_82
    L15_93 = L15_93(L16_94, L17_95, L18_96)
    L13_91 = L15_93
  else
    L15_93 = false
    return L15_93
  end
  if L13_91 == nil then
    L15_93 = false
    return L15_93
  end
  L16_94 = L13_91
  L15_93 = L13_91._isAlive
  L15_93 = L15_93(L16_94)
  if L15_93 == false then
    L15_93 = false
    return L15_93
  end
  L16_94 = L13_91
  L15_93 = L13_91._getCatalogID
  L15_93 = L15_93(L16_94)
  L8_86 = L15_93
  L16_94 = L13_91
  L15_93 = L13_91.getItemIcon
  L15_93 = L15_93(L16_94)
  L9_87 = L15_93
  L16_94 = L13_91
  L15_93 = L13_91._isStackable
  L15_93 = L15_93(L16_94)
  L10_88 = L15_93
  L16_94 = L13_91
  L15_93 = L13_91._countStack
  L15_93 = L15_93(L16_94)
  L11_89 = L15_93
  if L8_86 == 1000001 then
    L15_93 = A0_78.work
    L15_93.moneyIndex = A4_82
    L15_93 = A0_78.work
    L15_93.moneyCount = L11_89
  end
  L16_94 = L13_91
  L15_93 = L13_91._getNameIndex
  L15_93 = L15_93(L16_94)
  L16_94 = "TBL_null"
  L17_95 = A0_78.work
  L17_95 = L17_95.sorttype
  L18_96 = 20
  if A1_79 == 1 then
    break
  else
  end
  if A1_79 == 2 then
    L17_95 = 11
    L18_96 = 21
    break
  else
  end
  if A1_79 == 3 then
    L17_95 = 0
    break
  else
  end
  desktopWidget:setItemToXml(A0_78, L6_84, A2_80, L13_91, L16_94, L8_86, L9_87, L10_88, L11_89, L15_93, L17_95, true, false, L18_96, A3_81, A4_82, A5_83, false)
  if 0 < A0_78.work.updatecountbaz and A0_78.work.listbox == A1_79 and A0_78:getControlProperty(L6_84, "FilteredIndex") < A0_78.work.focus then
    A0_78.work.focusChange = true
  end
  return true
end
function RetainerItemListWidget.getMoneyListIndex(A0_97, A1_98)
  local L2_99, L3_100
  L2_99 = 1
  if A1_98 == 1000001 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000102 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000101 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000103 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000107 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000106 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000104 then
    L3_100 = -1
    return L3_100
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000108 then
    L3_100 = -1
    return L3_100
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000109 then
    L3_100 = -1
    return L3_100
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000105 then
    L3_100 = -1
    return L3_100
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000111 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000110 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000112 then
    L3_100 = -1
    return L3_100
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000113 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000114 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000115 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000116 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000117 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000118 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000119 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000120 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000121 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000122 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  if A1_98 == 1000123 then
    return L2_99
  else
    L2_99 = L2_99 + 1
  end
  L3_100 = -1
  return L3_100
end
function RetainerItemListWidget.setSortType(A0_101, A1_102, A2_103, A3_104, A4_105)
  local L5_106
  L5_106 = desktopWidget
  L5_106 = L5_106.getRetainerItem
  L5_106 = L5_106(L5_106, A4_105, A2_103 + 1)
  if L5_106 == nil then
    return
  end
  desktopWidget:setSortType(A0_101, A1_102, A2_103, A0_101.work.sorttype, L5_106)
end
function RetainerItemListWidget.updateSortType(A0_107)
  local L1_108, L2_109
  L2_109 = A0_107
  L1_108 = A0_107.getListPropertyName
  L1_108 = L1_108(L2_109, 1)
  L2_109 = A0_107.getPackageFromList
  L2_109 = L2_109(A0_107, 1)
  for _FORV_6_ = 1, A0_107:getListBoxItemNum(1) do
    A0_107:setSortType(L1_108, _FORV_6_ - 1, A0_107.work.sorttype, L2_109)
  end
  A0_107:updateListProperty(L1_108)
end
function RetainerItemListWidget.setBazaarLabelVisibility(A0_110, A1_111, A2_112, A3_113)
  local L4_114, L5_115
  L4_114 = "Visible"
  if A3_113 == 1 then
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "bazaarStatus", 378)
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "priceStyle", "TBL_parameterPlus")
  elseif A3_113 == 7 then
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "bazaarStatus", 453)
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "priceStyle", "TBL_parameterPlus")
    L5_115 = A0_110.getListProperty
    L5_115 = L5_115(A0_110, A1_111, A2_112, "stackCount")
    if A0_110:getListProperty(A1_111, A2_112, "stackable") == 1 then
      A0_110:setListProperty(A1_111, A2_112, "stack", "(" .. tostring(L5_115) .. ")")
    end
  elseif A3_113 == 2 then
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "bazaarStatus", 379)
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "priceStyle", "TBL_parameterMinus")
    L5_115 = A0_110.getListProperty
    L5_115 = L5_115(A0_110, A1_111, A2_112, "stackCount")
    if A0_110:getListProperty(A1_111, A2_112, "stackable") == 1 then
      A0_110:setListProperty(A1_111, A2_112, "stack", "(" .. tostring(L5_115) .. ")")
    end
  elseif A3_113 == 3 then
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "bazaarStatus", 380)
    L5_115 = A0_110.setListProperty
    L5_115(A0_110, A1_111, A2_112, "priceStyle", "TBL_guildleveBonus")
  else
    L5_115 = A0_110.getListProperty
    L5_115 = L5_115(A0_110, A1_111, A2_112, "nameStyle")
    A0_110:setListProperty(A1_111, A2_112, "priceStyle", L5_115)
    L4_114 = "Hidden"
  end
  L5_115 = A0_110.setListProperty
  L5_115(A0_110, A1_111, A2_112, "bazaarStatusVisibility", L4_114)
end
function RetainerItemListWidget.updateBazaarLabel(A0_116, A1_117, A2_118)
  local L3_119, L4_120, L5_121, L6_122, L7_123, L8_124, L9_125, L10_126, L11_127, L12_128, L13_129, L14_130, L15_131, L16_132, L17_133, L18_134, L19_135, L20_136
  L11_127 = A0_116
  L10_126 = A0_116.getListPropertyName
  L12_128 = A1_117
  L10_126 = L10_126(L11_127, L12_128)
  L11_127, L12_128 = nil, nil
  L13_129 = 1
  L14_130 = A0_116.getListBoxItemNum
  L14_130 = L14_130(L15_131, L16_132)
  for L18_134 = L13_129 - 1, L14_130 - 1 do
    L11_127 = 8
    L12_128 = L18_134 + 1
    L20_136 = A0_116
    L19_135 = A0_116.isExistItem
    L19_135 = L19_135(L20_136, L11_127, L12_128, A2_118)
    if L19_135 == false then
      break
    end
    L3_119 = 0
    L19_135 = false
    if A2_118 == nil or A2_118 == 1 then
      L20_136 = desktopWidget
      L20_136 = L20_136.isDealingItem
      L20_136 = L20_136(L20_136, L11_127, L12_128)
      L19_135 = L20_136
    elseif A2_118 == 2 then
      L20_136 = desktopWidget
      L20_136 = L20_136.isBazaarDealingItem
      L20_136 = L20_136(L20_136, L11_127, L12_128)
      L19_135 = L20_136
    elseif A2_118 == 4 then
      L20_136 = desktopWidget
      L20_136 = L20_136.isRetainerDealingItem
      L20_136 = L20_136(L20_136, L11_127, L12_128)
      L19_135 = L20_136
    end
    if L19_135 == true then
      L20_136 = desktopWidget
      L20_136 = L20_136.getRetainerItemDealData
      L5_121, L6_122, L20_136 = L20_136, L11_127, L20_136(L20_136, L11_127, L12_128)
      L4_120 = L20_136
      L20_136 = A0_116.setListProperty
      L20_136(A0_116, L10_126, L18_134, "bazaarkind", L4_120)
      if L4_120 == 11 then
        L3_119 = 1
      elseif L4_120 == 12 then
        L3_119 = 1
      elseif L4_120 == 13 then
        L3_119 = 7
      elseif L4_120 == 20 then
        L3_119 = 4
      elseif L4_120 == 30 then
        L3_119 = 4
      end
      if L3_119 ~= 4 then
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "rewardprice", L5_121)
        L20_136 = A0_116.setListText
        L20_136(A0_116, L10_126, L18_134, "price", 225, L5_121)
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "rewardpackage", 0)
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "rewarditem", 0)
        L20_136 = A0_116.setListPropertyVisibility
        L20_136(A0_116, L10_126, L18_134, true)
      else
        L20_136 = A0_116.setListPropertyVisibility
        L20_136(A0_116, L10_126, L18_134, true)
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "nameStyle", "TBL_selectedItem")
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "opacity", "0.5")
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "rewardprice", 0)
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "rewardpackage", 0)
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "rewarditem", 0)
        L20_136 = A0_116.setListProperty
        L20_136(A0_116, L10_126, L18_134, "price", "")
      end
    else
      L20_136 = false
      L20_136 = desktopWidget:isRetainerItemAttached(L11_127, L12_128)
      if L20_136 == true then
        L4_120, L7_123, L8_124, L9_125 = A0_116:checkRewardDependency(L11_127, L12_128, A2_118)
        if L4_120 ~= 0 then
          if L4_120 == 20 then
            L3_119 = 2
          elseif L4_120 == 30 then
            L3_119 = 3
          end
          if L9_125 ~= 0 then
            A0_116:setListText(L10_126, L18_134, "price", 225, L9_125)
          else
            A0_116:setListText(L10_126, L18_134, "price", 3144)
          end
          A0_116:setListProperty(L10_126, L18_134, "rewardpackage", L7_123)
          A0_116:setListProperty(L10_126, L18_134, "rewarditem", L8_124)
        else
          A0_116:setListProperty(L10_126, L18_134, "rewardpackage", 0)
          A0_116:setListProperty(L10_126, L18_134, "rewarditem", 0)
          A0_116:setListProperty(L10_126, L18_134, "price", "")
        end
      else
        A0_116:setListProperty(L10_126, L18_134, "rewardpackage", 0)
        A0_116:setListProperty(L10_126, L18_134, "rewarditem", 0)
        A0_116:setListProperty(L10_126, L18_134, "price", "")
      end
      A0_116:setListProperty(L10_126, L18_134, "bazaarkind", 0)
      A0_116:setListProperty(L10_126, L18_134, "rewardprice", 0)
      A0_116:setListPropertyVisibility(L10_126, L18_134, true)
    end
    L20_136 = A0_116.setBazaarLabelVisibility
    L20_136(A0_116, L10_126, L18_134, L3_119)
  end
  L15_131(L16_132, L17_133)
end
function RetainerItemListWidget.checkRewardDependency(A0_137, A1_138, A2_139, A3_140)
  local L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147, L11_148, L12_149, L13_150
  if A1_138 == 0 or A2_139 == 0 or A1_138 == false or A2_139 == false then
    L4_141 = 0
    L5_142 = 0
    L6_143 = 0
    L7_144 = 0
    return L4_141, L5_142, L6_143, L7_144
  end
  L4_141 = 0
  L5_142 = 0
  L6_143 = nil
  L7_144 = 0
  if A3_140 == nil or A3_140 == 1 then
    L8_145 = worldMaster
    L8_145 = L8_145._getMyPlayer
    L8_145 = L8_145(L9_146)
    L13_150 = 8
    for L13_150 = 1, L11_148(L12_149, L13_150) do
      if A0_137:isExistItem(8, L13_150) == false then
        break
      elseif desktopWidget:isDealingItem(8, L13_150) == true then
        L4_141, L5_142, L6_143 = desktopWidget:getItemDealData(8, L13_150)
        if L6_143 == L9_146 then
          if L8_145:_getItem(8, L13_150):_getCatalogID() == 1000001 then
            L7_144 = L8_145:_getItem(8, L13_150):_countStack()
          end
          return L4_141, 8, L13_150, L7_144
        end
      end
    end
    L13_150 = 0
    return L10_147, L11_148, L12_149, L13_150
  elseif A3_140 == 2 then
    L8_145 = desktopWidget
    L8_145 = L8_145.getBazaarItem
    L8_145 = L8_145(L9_146, L10_147, L11_148)
    for L12_149 = 1, L10_147(L11_148, L12_149) do
      L13_150 = A0_137.isExistItem
      L13_150 = L13_150(A0_137, 8, L12_149, A3_140)
      if L13_150 == false then
        break
      else
        L13_150 = desktopWidget
        L13_150 = L13_150.isBazaarDealingItem
        L13_150 = L13_150(L13_150, 8, L12_149)
        if L13_150 == true then
          L13_150 = desktopWidget
          L13_150 = L13_150.getBazaarItemDealData
          L5_142, L6_143, L13_150 = L13_150, 8, L13_150(L13_150, 8, L12_149)
          L4_141 = L13_150
          if L6_143 == L8_145 then
            L13_150 = desktopWidget
            L13_150 = L13_150.getBazaarItem
            L13_150 = L13_150(L13_150, 8, L12_149)
            if L13_150:_getCatalogID() == 1000001 then
              L7_144 = L13_150:_countStack()
            end
            return L4_141, 8, L12_149, L7_144
          end
        end
      end
    end
    return L9_146, L10_147, L11_148, L12_149
  elseif A3_140 == 4 then
    L8_145 = desktopWidget
    L8_145 = L8_145.getRetainerItem
    L8_145 = L8_145(L9_146, L10_147, L11_148)
    for L12_149 = 1, L10_147(L11_148, L12_149) do
      L13_150 = A0_137.isExistItem
      L13_150 = L13_150(A0_137, 8, L12_149, A3_140)
      if L13_150 == false then
        break
      else
        L13_150 = desktopWidget
        L13_150 = L13_150.isRetainerDealingItem
        L13_150 = L13_150(L13_150, 8, L12_149)
        if L13_150 == true then
          L13_150 = desktopWidget
          L13_150 = L13_150.getRetainerItemDealData
          L5_142, L6_143, L13_150 = L13_150, 8, L13_150(L13_150, 8, L12_149)
          L4_141 = L13_150
          if L6_143 == L8_145 then
            L13_150 = desktopWidget
            L13_150 = L13_150.getRetainerItem
            L13_150 = L13_150(L13_150, 8, L12_149)
            if L13_150:_getCatalogID() == 1000001 then
              L7_144 = L13_150:_countStack()
            end
            return L4_141, 8, L12_149, L7_144
          end
        end
      end
    end
    return L9_146, L10_147, L11_148, L12_149
  end
end
function RetainerItemListWidget.isRewardItemActor(A0_151, A1_152, A2_153, A3_154, A4_155, A5_156)
  if A1_152 == 0 or A2_153 == 0 or A3_154 == 0 or A4_155 == 0 or A1_152 == false or A2_153 == false or A3_154 == false or A4_155 == false then
    return false
  end
  if A5_156 == nil or A5_156 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_152, A2_153) == desktopWidget:getItemDealData(A3_154, A4_155) then
      return true
    else
      return false
    end
  elseif A5_156 == 2 then
    if desktopWidget:getBazaarItem(A1_152, A2_153) == desktopWidget:getBazaarItemDealData(A3_154, A4_155) then
      return true
    else
      return false
    end
  elseif A5_156 == 4 then
    if desktopWidget:getRetainerItem(A1_152, A2_153) == desktopWidget:getRetainerItemDealData(A3_154, A4_155) then
      return true
    else
      return false
    end
  end
end
function RetainerItemListWidget.makeListFromPackage(A0_157, A1_158, A2_159)
  local L3_160, L4_161, L5_162, L6_163, L7_164, L8_165, L9_166, L10_167
  if A2_159 == nil then
    if A1_158 == 1 or A1_158 == nil then
      L3_160 = 0
      L4_161 = L7_164
      L5_162 = L7_164
      if L7_164 == 0 then
        L10_167 = 1
        L7_164.retainerBagCapacity = L8_165
        L10_167 = A0_157
        L10_167 = "SourceCount"
        L7_164(L8_165, L9_166, L10_167, A0_157.work.retainerBagCapacity)
      end
      L6_163 = L7_164.retainerBagCapacity
      for L10_167 = 1, L6_163 do
        if A0_157:setItemToXmlLight(1, L3_160, 1, L10_167, 4) == true then
          L3_160 = L3_160 + 1
        else
          break
        end
      end
      if L5_162 > L3_160 then
        for L10_167 = L3_160, L5_162 - 1 do
          L5_162 = L5_162 - 1
          A0_157:deleteListProperty(L4_161, L5_162)
        end
      end
      L7_164(L8_165, L9_166)
    end
    if A1_158 == 100 or A1_158 == nil then
      L7_164.moneyIndex = 0
      L7_164.moneyCount = 0
      L4_161 = L7_164
      if L7_164 == 0 then
        L10_167 = 100
        L7_164.retainerMoneyCapacity = L8_165
        L10_167 = A0_157
        L10_167 = "SourceCount"
        L7_164(L8_165, L9_166, L10_167, A0_157.work.retainerMoneyCapacity)
      end
      L6_163 = L7_164.retainerMoneyCapacity
      L3_160 = 0
      L5_162 = L7_164
      for L10_167 = 1, L6_163 do
        if A0_157:setItemToXmlLight(2, L3_160, 100, L10_167, 4) == true then
          L3_160 = L3_160 + 1
        else
          break
        end
      end
      if L5_162 > L3_160 then
        for L10_167 = L3_160, L5_162 - 1 do
          L5_162 = L5_162 - 1
          A0_157:deleteListProperty(L4_161, L5_162)
        end
      end
      L7_164(L8_165, L9_166)
      L7_164.retainerMoneyIndex = L8_165
      L7_164.retainerMoneyCount = L8_165
    end
    if A1_158 == 8 or A1_158 == nil then
      if L7_164 == 0 then
        L10_167 = 8
        L7_164.retainerBazaarCapacity = L8_165
        L10_167 = A0_157
        L10_167 = "SourceCount"
        L7_164(L8_165, L9_166, L10_167, A0_157.work.retainerBazaarCapacity)
      end
      L6_163 = L7_164.retainerBazaarCapacity
      L3_160 = 0
      L5_162 = L7_164
      L4_161 = L7_164
      for L10_167 = 1, L6_163 do
        if A0_157:setItemToXmlLight(3, L3_160, 8, L10_167, 4) == true then
          L3_160 = L3_160 + 1
        else
          break
        end
      end
      if L5_162 > L3_160 then
        for L10_167 = L3_160, L5_162 - 1 do
          L5_162 = L5_162 - 1
          A0_157:deleteListProperty(L4_161, L5_162)
        end
      end
      if L3_160 > 0 then
        L10_167 = 4
        L7_164(L8_165, L9_166, L10_167)
      else
        L7_164(L8_165, L9_166)
      end
    end
  else
    if A1_158 == 1 then
      if L8_165 == 0 then
        L10_167 = L9_166
        L8_165.retainerBagCapacity = L9_166
        L10_167 = A0_157.getListBoxName
        L10_167 = L10_167(A0_157, 1)
        L8_165(L9_166, L10_167, "SourceCount", A0_157.work.retainerBagCapacity)
      end
    elseif A1_158 == 100 then
      if L8_165 == 0 then
        L10_167 = L9_166
        L8_165.retainerMoneyCapacity = L9_166
        L10_167 = A0_157.getListBoxName
        L10_167 = L10_167(A0_157, 2)
        L8_165(L9_166, L10_167, "SourceCount", A0_157.work.retainerMoneyCapacity)
        if A2_159 == L8_165 then
          L8_165.moneyIndex = 0
          L8_165.moneyCount = 0
        else
          L8_165.moneyIndex = L9_166
          L8_165.moneyCount = L9_166
        end
      end
    elseif A1_158 == 8 then
      if L8_165 == 0 then
        L10_167 = L9_166
        L8_165.retainerBazaarCapacity = L9_166
        L10_167 = A0_157.getListBoxName
        L10_167 = L10_167(A0_157, 3)
        L8_165(L9_166, L10_167, "SourceCount", A0_157.work.retainerBazaarCapacity)
      end
    else
      return
    end
    L10_167 = L7_164
    L4_161 = L8_165
    L10_167 = A1_158
    if L8_165 ~= nil then
      L10_167 = L7_164
      L8_165(L9_166, L10_167, A2_159 - 1, A1_158, A2_159, 4)
      if A1_158 == 100 then
        if L8_165 == L9_166 then
        elseif L8_165 ~= L9_166 then
          L8_165.retainerMoneyIndex = L9_166
          L8_165.retainerMoneyCount = L9_166
        end
      end
    else
      L10_167 = L7_164
      L10_167 = A0_157
      L9_166(L10_167, L4_161, L8_165 - 1)
      L10_167 = A0_157
      L9_166(L10_167, L4_161)
      if A1_158 == 100 then
        if A2_159 == L9_166 then
          L9_166.retainerMoneyIndex = 0
          L9_166.retainerMoneyCount = 0
        end
      end
    end
  end
  L7_164(L8_165)
end
function RetainerItemListWidget.copyItem(A0_168)
  A0_168.work.bakcatalog = desktopWidget:getRetainerItem(A0_168.work.chosenPackage, A0_168.work.chosenItem):_getCatalogID()
  A0_168.work.bakquality = desktopWidget:getRetainerItem(A0_168.work.chosenPackage, A0_168.work.chosenItem):_getNameIndex()
  A0_168.work.bakstack = desktopWidget:getRetainerItem(A0_168.work.chosenPackage, A0_168.work.chosenItem):_countStack()
  A0_168.work.bakrare = desktopWidget:getRetainerItem(A0_168.work.chosenPackage, A0_168.work.chosenItem):isRareItem()
  A0_168.work.bakex = desktopWidget:getRetainerItem(A0_168.work.chosenPackage, A0_168.work.chosenItem):isExclusiveItem()
  if A0_168.work.chosenPackage == 8 then
    A0_168.work.bakbazaarkind = desktopWidget:getRetainerItemDealData(A0_168.work.chosenPackage, A0_168.work.chosenItem)
    A0_168.work.bakprice = desktopWidget:getRetainerItemDealData(A0_168.work.chosenPackage, A0_168.work.chosenItem)
    A0_168.work.bakattached = desktopWidget:isRetainerItemAttached(A0_168.work.chosenPackage, A0_168.work.chosenItem)
  end
end
function RetainerItemListWidget.isSameItem(A0_169, A1_170, A2_171)
  if desktopWidget:getRetainerItem(A1_170, A2_171) == nil then
    return false
  end
  if desktopWidget:getRetainerItem(A1_170, A2_171):_isAlive() == false then
    return false
  end
  if A0_169.work.bakcatalog ~= desktopWidget:getRetainerItem(A1_170, A2_171):_getCatalogID() then
    return false
  end
  if A0_169.work.bakquality ~= desktopWidget:getRetainerItem(A1_170, A2_171):_getNameIndex() then
    return false
  end
  if A0_169.work.bakrare ~= desktopWidget:getRetainerItem(A1_170, A2_171):isRareItem() then
    return false
  end
  if A0_169.work.bakex ~= desktopWidget:getRetainerItem(A1_170, A2_171):isExclusiveItem() then
    return false
  end
  if A0_169.work.bakstack ~= desktopWidget:getRetainerItem(A1_170, A2_171):_countStack() then
    return false
  end
  if A1_170 == 8 then
    if A0_169.work.bakbazaarkind ~= desktopWidget:getRetainerItemDealData(A1_170, A2_171) then
      return false
    end
    if A0_169.work.bakprice ~= desktopWidget:getRetainerItemDealData(A1_170, A2_171) then
      return false
    end
    if A0_169.work.bakattached ~= desktopWidget:isRetainerItemAttached(A1_170, A2_171) then
      return false
    end
  end
  return true
end
function RetainerItemListWidget.getItemBazaarData(A0_172, A1_173, A2_174, A3_175, A4_176, A5_177, A6_178)
  local L7_179, L8_180, L9_181, L10_182, L11_183, L12_184, L13_185, L14_186, L15_187, L16_188, L17_189, L18_190, L19_191, L20_192
  L7_179 = 0
  L8_180 = 0
  L9_181 = 0
  L10_182 = 0
  L11_183 = 0
  L12_184 = 0
  L13_185 = 0
  L14_186 = 0
  L15_187 = ""
  L16_188 = 0
  L17_189 = false
  L18_190 = 0
  L19_191 = false
  L20_192 = false
  if A1_173 ~= nil then
  else
    L7_179 = A0_172:getListProperty(A2_174, A3_175, "bazaarkind")
    L10_182 = A0_172:getListProperty(A2_174, A3_175, "rewardprice")
    L8_180 = A0_172:getListProperty(A2_174, A3_175, "rewardpackage")
    L9_181 = A0_172:getListProperty(A2_174, A3_175, "rewarditem")
    if L8_180 ~= 0 then
      L11_183 = A0_172:getListProperty(A2_174, L9_181 - 1, "bazaarkind")
      L12_184 = A0_172:getListProperty(A2_174, L9_181 - 1, "catalog")
      L13_185 = A0_172:getListProperty(A2_174, L9_181 - 1, "icon")
      L14_186 = A0_172:getListProperty(A2_174, L9_181 - 1, "stackCount")
      L15_187 = A0_172:getListProperty(A2_174, L9_181 - 1, "name")
      L16_188 = A0_172:getListProperty(A2_174, L9_181 - 1, "stackable")
      L17_189 = A0_172:getListProperty(A2_174, L9_181 - 1, "polmax") == "Visible"
      L18_190 = A0_172:getListProperty(A2_174, L9_181 - 1, "mcount")
      L19_191 = A0_172:getListProperty(A2_174, L9_181 - 1, "equipx") == "Visible"
      L20_192 = A0_172:getListProperty(A2_174, L9_181 - 1, "mpvisible") == "Visible"
    end
  end
  return L7_179, L8_180, L9_181, L10_182, L11_183, L12_184, L13_185, L14_186, L15_187, L16_188, L17_189, L18_190, L19_191, L20_192
end
function RetainerItemListWidget.displayBazaarGrid(A0_193, A1_194, A2_195, A3_196, A4_197, A5_198, A6_199)
  local L7_200, L8_201, L9_202, L10_203, L11_204, L12_205, L13_206, L14_207, L15_208, L16_209, L17_210, L18_211, L19_212, L20_213, L21_214, L22_215, L23_216, L24_217, L25_218, L26_219, L27_220, L28_221
  L8_201 = A0_193
  L7_200 = A0_193.getItemBazaarData
  L9_202 = nil
  L10_203 = A2_195
  L11_204 = A3_196
  L12_205 = A4_197
  L13_206 = A5_198
  L14_207 = A6_199
  L20_213 = L7_200(L8_201, L9_202, L10_203, L11_204, L12_205, L13_206, L14_207)
  L21_214 = desktopWidget
  L22_215 = L21_214
  L21_214 = L21_214.getItemRepairData
  L23_216 = A0_193
  L24_217 = A1_194
  L25_218 = A2_195
  L26_219 = A3_196
  L26_219 = L21_214(L22_215, L23_216, L24_217, L25_218, L26_219)
  L27_220 = false
  L28_221 = false
  if A1_194 ~= nil then
    L27_220 = A1_194:isExclusiveItem()
    L28_221 = A1_194:isRareItem()
  else
    if A0_193:getListProperty(A2_195, A3_196, "ex") == 1 then
      L27_220 = true
    end
    if A0_193:getListProperty(A2_195, A3_196, "rare") == 1 then
      L28_221 = true
    end
  end
  A0_193:setVisibility("IconControl_NotEquiped_2", false)
  A0_193:setVisibility("IconControl_PolishMAX_2", false)
  A0_193:setVisibility("Grid_MateriaNumber", false)
  if L7_200 == 11 then
    A0_193:setVisibility("TextBlock_ItemBazaarSingle", true)
    A0_193:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_193:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_193:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_193:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_193:setIcon("IconControl_ItemBazaarStatus", 378)
    A0_193:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_193:setVisibility("Grid_RewardItem", false)
    A0_193:setVisibility("Grid_RewardMoney", true)
    A0_193:setText("TextBlock_RewardMoney", 3201, L10_203)
    A0_193.work.bazaar = true
  elseif L7_200 == 12 then
    A0_193:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSeparate", true)
    A0_193:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_193:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_193:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_193:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_193:setIcon("IconControl_ItemBazaarStatus", 378)
    A0_193:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_193:setVisibility("Grid_RewardItem", false)
    A0_193:setVisibility("Grid_RewardMoney", true)
    A0_193:setText("TextBlock_RewardMoney", 3201, L10_203)
    A0_193.work.bazaar = true
  elseif L7_200 == 13 then
    A0_193:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSet", true)
    A0_193:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_193:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_193:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_193:setIcon("IconControl_ItemBazaarStatus", 453)
    A0_193:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_193:setVisibility("Grid_RewardItem", false)
    A0_193:setVisibility("Grid_RewardMoney", true)
    A0_193:setText("TextBlock_RewardMoney", 3201, L10_203)
    A0_193.work.bazaar = true
  elseif L7_200 == 20 or L7_200 == 30 then
    A0_193:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_193:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_193:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_193:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_193:setVisibility("IconControl_ItemBazaarStatus", false)
    A0_193:setVisibility("Grid_RewardItem", false)
    A0_193:setVisibility("Grid_RewardMoney", false)
  elseif L8_201 ~= 0 then
    A0_193.work.bazaar = true
    A0_193:setVisibility("Grid_RewardItem", true)
    if L12_205 == 1000001 then
      A0_193:setVisibility("Grid_RewardItem", false)
      A0_193:setVisibility("Grid_RewardMoney", true)
      A0_193:setText("TextBlock_RewardMoney", 3201, L14_207)
    else
      A0_193:setVisibility("Grid_RewardItem", true)
      A0_193:setVisibility("Grid_RewardMoney", false)
      A0_193:setIcon("IconControl_RewardItemIcon", L13_206)
      A0_193:setText("TextBlock_RewardItemName", L15_208)
      if L16_209 == 1 then
        A0_193:setText("TextBlock_RewardItemStack", 3189, L14_207)
        A0_193:setVisibility("TextBlock_RewardItemStack", true)
      else
        A0_193:setText("TextBlock_RewardItemStack", "")
      end
      A0_193:setVisibility("IconControl_PolishMAX_2", L17_210)
      if L18_211 > 0 then
        A0_193:setVisibility("Grid_MateriaNumber", true)
        A0_193:setVisibility("TextBlock_RewardItemStack", false)
        A0_193:setVisibility("TextBlock_MateriaNumber", true)
        A0_193:setText("TextBlock_MateriaNumber", tostring(L18_211))
        A0_193:setVisibility("IconControl_MateriaBase", false)
        A0_193:setVisibility("IconControl_MateriaIcon", true)
      elseif L20_213 == true then
        A0_193:setVisibility("Grid_MateriaNumber", true)
        A0_193:setVisibility("TextBlock_MateriaNumber", false)
        A0_193:setVisibility("TextBlock_RewardItemStack", false)
        A0_193:setVisibility("IconControl_MateriaBase", true)
        A0_193:setVisibility("IconControl_MateriaIcon", false)
      else
        A0_193:setVisibility("IconControl_MateriaBase", false)
        A0_193:setVisibility("IconControl_MateriaIcon", false)
      end
      A0_193:setVisibility("IconControl_NotEquiped_2", L19_212)
    end
    if L11_204 == 20 then
      A0_193:setVisibility("TextBlock_ItemBazaarSingle", false)
      A0_193:setVisibility("TextBlock_ItemBazaarSeparate", false)
      A0_193:setVisibility("TextBlock_ItemBazaarSet", false)
      A0_193:setVisibility("TextBlock_ItemBazaarBuy", true)
      A0_193:setVisibility("TextBlock_ItemBazaarRepair", false)
      A0_193:setVisibility("TextBlock_ItemBazaarReward", true)
      A0_193:setIcon("IconControl_ItemBazaarStatus", 379)
      A0_193:setVisibility("IconControl_ItemBazaarStatus", true)
    elseif L11_204 == 30 then
      A0_193:setVisibility("TextBlock_ItemBazaarSingle", false)
      A0_193:setVisibility("TextBlock_ItemBazaarSeparate", false)
      A0_193:setVisibility("TextBlock_ItemBazaarSet", false)
      A0_193:setVisibility("TextBlock_ItemBazaarBuy", false)
      A0_193:setVisibility("TextBlock_ItemBazaarRepair", true)
      A0_193:setVisibility("TextBlock_ItemBazaarReward", true)
      A0_193:setIcon("IconControl_ItemBazaarStatus", 380)
      A0_193:setVisibility("IconControl_ItemBazaarStatus", true)
    end
  else
    A0_193.work.bazaar = false
    A0_193:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_193:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_193:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_193:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_193:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_193:setVisibility("IconControl_ItemBazaarStatus", false)
    A0_193:setVisibility("Grid_RewardItem", false)
    A0_193:setVisibility("Grid_RewardMoney", false)
  end
  return true
end
function RetainerItemListWidget.displayHelp(A0_222, A1_223)
  A0_222:setText("TextBlock_Help", A1_223)
end
function RetainerItemListWidget.displayFocusedItemHelp(A0_224)
  local L1_225, L2_226, L3_227, L4_228, L5_229, L6_230, L7_231, L8_232, L9_233, L10_234, L11_235, L12_236, L13_237, L14_238, L15_239, L16_240
  L1_225 = A0_224.work
  L1_225 = L1_225.updatecountbaz
  if L1_225 ~= 0 then
    L1_225 = false
    return L1_225
  end
  L2_226 = A0_224
  L1_225 = A0_224.getListBoxFocusNum
  L3_227 = A0_224.work
  L3_227 = L3_227.listbox
  L1_225 = L1_225(L2_226, L3_227)
  if L1_225 <= 0 then
    L2_226 = A0_224
    L1_225 = A0_224.displayHelp
    L3_227 = 3140
    L1_225(L2_226, L3_227)
    L1_225 = A0_224.work
    L1_225.bonus1 = false
    L1_225 = A0_224.work
    L1_225.bonus2 = false
    L1_225 = A0_224.work
    L1_225.bonus3 = false
    L1_225 = A0_224.work
    L1_225.bazaar = false
    L1_225 = A0_224.work
    L1_225.itemlife = false
    L1_225 = A0_224.work
    L1_225.page = 0
    L2_226 = A0_224
    L1_225 = A0_224.setGridVisibility
    L3_227 = 1
    L1_225(L2_226, L3_227)
    L1_225 = false
    return L1_225
  end
  L1_225 = A0_224.work
  L1_225 = L1_225.listbox
  if L1_225 == 3 then
    L2_226 = A0_224
    L1_225 = A0_224.isExistItem
    L3_227 = 8
    L4_228 = 1
    L5_229 = 4
    L1_225 = L1_225(L2_226, L3_227, L4_228, L5_229)
    if L1_225 == false then
      L2_226 = A0_224
      L1_225 = A0_224.displayHelp
      L3_227 = 3140
      L1_225(L2_226, L3_227)
      L1_225 = A0_224.work
      L1_225.bonus1 = false
      L1_225 = A0_224.work
      L1_225.bonus2 = false
      L1_225 = A0_224.work
      L1_225.bonus3 = false
      L1_225 = A0_224.work
      L1_225.bazaar = false
      L1_225 = A0_224.work
      L1_225.itemlife = false
      L1_225 = A0_224.work
      L1_225.page = 0
      L2_226 = A0_224
      L1_225 = A0_224.setGridVisibility
      L3_227 = 1
      L1_225(L2_226, L3_227)
      L1_225 = false
      return L1_225
    end
  end
  L2_226 = A0_224
  L1_225 = A0_224.getListBoxItemNum
  L3_227 = A0_224.work
  L3_227 = L3_227.listbox
  L1_225 = L1_225(L2_226, L3_227)
  L2_226 = A0_224.work
  L2_226 = L2_226.index
  if L1_225 <= L2_226 then
    L1_225 = false
    return L1_225
  end
  L2_226 = A0_224
  L1_225 = A0_224.getListPropertyName
  L3_227 = A0_224.work
  L3_227 = L3_227.listbox
  L1_225 = L1_225(L2_226, L3_227)
  L3_227 = A0_224
  L2_226 = A0_224.getPackageFromList
  L4_228 = A0_224.work
  L4_228 = L4_228.listbox
  L2_226 = L2_226(L3_227, L4_228)
  L3_227 = A0_224.work
  L3_227 = L3_227.index
  L3_227 = L3_227 + 1
  L4_228 = 4
  L5_229 = nil
  L6_230 = desktopWidget
  L7_231 = L6_230
  L6_230 = L6_230.getRetainerItem
  L8_232 = L2_226
  L9_233 = L3_227
  L6_230 = L6_230(L7_231, L8_232, L9_233)
  L5_229 = L6_230
  if L5_229 == nil then
    L6_230 = false
    return L6_230
  end
  L7_231 = L5_229
  L6_230 = L5_229._isAlive
  L6_230 = L6_230(L7_231)
  if L6_230 == false then
    L6_230 = false
    return L6_230
  end
  L6_230 = desktopWidget
  L7_231 = L6_230
  L6_230 = L6_230.setItemDetail
  L8_232 = A0_224
  L9_233 = L5_229
  L10_234 = L1_225
  L11_235 = A0_224.work
  L11_235 = L11_235.index
  L6_230(L7_231, L8_232, L9_233, L10_234, L11_235)
  L6_230 = false
  L8_232 = A0_224
  L7_231 = A0_224.displayBazaarGrid
  L9_233 = L5_229
  L11_235 = A0_224
  L10_234 = A0_224.getListPropertyName
  L12_236 = A0_224.work
  L12_236 = L12_236.listbox
  L10_234 = L10_234(L11_235, L12_236)
  L11_235 = A0_224.work
  L11_235 = L11_235.index
  L12_236 = L2_226
  L7_231 = L7_231(L8_232, L9_233, L10_234, L11_235, L12_236, L13_237)
  L6_230 = L7_231
  L7_231 = nil
  L8_232 = worldMaster
  L9_233 = L8_232
  L8_232 = L8_232._getMyPlayer
  L8_232 = L8_232(L9_233)
  L9_233 = 0
  L10_234 = 0
  L11_235 = 0
  L12_236 = 0
  if L13_237 == true then
    for L16_240 = 1, 27 do
      if L5_229:isFitForEquipPoint(L16_240) == true then
        if L9_233 == 0 then
          L9_233 = L16_240
        elseif L10_234 == 0 then
          L10_234 = L16_240
        elseif L11_235 == 0 then
          L11_235 = L16_240
        elseif L12_236 == 0 then
          L12_236 = L16_240
          break
        end
      end
    end
  end
  if L9_233 ~= 0 then
    L7_231 = L13_237
  end
  if L7_231 == nil and L10_234 ~= 0 then
    L7_231 = L13_237
  end
  if L7_231 == nil and L11_235 ~= 0 then
    L7_231 = L13_237
  end
  if L7_231 == nil and L12_236 ~= 0 then
    L7_231 = L13_237
  end
  L16_240 = L5_229
  L16_240 = L13_237(L14_238, L15_239, L16_240, L1_225, A0_224.work.index, L7_231, false, false, false, false, false, false, nil, true)
  if A0_224.work.listbox == 3 then
    A0_224:setControlProperty("Grid_MateriaPossible", "VisualOpacityBlue", "0.5")
    A0_224:setControlProperty("Grid_MateriaPossible", "VisualOpacityGreen", "0.5")
    A0_224:setControlProperty("Grid_MateriaPossible", "VisualOpacityRed", "0.5")
    A0_224:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityBlue", "0.5")
    A0_224:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityGreen", "0.5")
    A0_224:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityRed", "0.5")
  else
    A0_224:setControlProperty("Grid_MateriaPossible", "VisualOpacityBlue", "1.0")
    A0_224:setControlProperty("Grid_MateriaPossible", "VisualOpacityGreen", "1.0")
    A0_224:setControlProperty("Grid_MateriaPossible", "VisualOpacityRed", "1.0")
    A0_224:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityBlue", "1.0")
    A0_224:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityGreen", "1.0")
    A0_224:setControlProperty("ProgressBar_ItemPolish", "VisualOpacityRed", "1.0")
  end
  A0_224.work.bonus1 = L13_237
  A0_224.work.bonus2 = L14_238
  A0_224.work.bonus3 = L15_239
  A0_224.work.itemlife = L16_240
  A0_224:updateWindowDisplay(false)
end
function RetainerItemListWidget.previousSequence(A0_241)
  if A0_241.work.sorttype ~= desktopWidget:getConfigWork(9) then
    desktopWidget:setConfigWorkWithSave(9, A0_241.work.sorttype)
  end
  A0_241.work.editWidgetOpen = -1
  A0_241.work.chosenOperation = 1
end
function RetainerItemListWidget.processUICommandOperate(A0_242, A1_243, A2_244, A3_245, A4_246)
  if A0_242.work.error == true or desktopWidget:isValidRetainer() == false then
    A0_242:saveSortType()
    return desktopWidget:closeWidgetDirect(A0_242)
  end
  if desktopWidget:checkKeyboardFocused(A0_242) == false then
    return
  end
  if A0_242.work.editWidgetOpen ~= 0 then
    return false
  end
  if 0 < A0_242.work.updatecount then
    return false
  end
  if 0 < A0_242.work.updatecountbaz then
    return false
  end
  if A0_242.work.submenu == true then
    return false
  end
  if A0_242.work.inputok == false then
    return false
  end
  if A2_244 == "Button_SortStatus" then
    A0_242:operateSort()
  elseif A2_244 == "Button_ListClose" then
    A0_242:closeMateriaList()
  end
end
function RetainerItemListWidget.processUICommandCancel(A0_247, A1_248, A2_249, A3_250, A4_251)
  if A0_247.work.error == true or desktopWidget:isValidRetainer() == false then
    A0_247:saveSortType()
    return desktopWidget:closeWidgetDirect(A0_247)
  end
  if desktopWidget:checkKeyboardFocused(A0_247) == false then
    return
  end
  if A0_247.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_247.work.resultForAsk ~= 0 then
    return false
  end
  if 0 < A0_247.work.updatecount then
    return false
  end
  if 0 < A0_247.work.updatecountbaz then
    return false
  end
  if A0_247.work.submenu == true then
    return false
  end
  if A0_247.work.inputok == false then
    return false
  end
  if A2_249 == "Button_ListClose" then
    A0_247:closeMateriaList()
    return
  end
  A0_247:previousSequence()
end
function RetainerItemListWidget.processUICommandClose(A0_252, A1_253, A2_254, A3_255, A4_256)
  if A0_252.work.error == true or desktopWidget:isValidRetainer() == false then
    A0_252:saveSortType()
    return desktopWidget:closeWidgetDirect(A0_252)
  end
  if A0_252.work.submenu == true then
    return false
  end
  if A0_252.work.inputok == false then
    return false
  end
  A0_252:previousSequence()
end
function RetainerItemListWidget.processUICommandSelection(A0_257, A1_258, A2_259, A3_260, A4_261)
  if A0_257.work.error == true or desktopWidget:isValidRetainer() == false then
    A0_257:saveSortType()
    return desktopWidget:closeWidgetDirect(A0_257)
  end
  if A0_257.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_257.work.resultForAsk ~= 0 then
    return false
  end
  if 0 < A0_257.work.updatecount then
    return false
  end
  if 0 < A0_257.work.updatecountbaz then
    return false
  end
  if A0_257.work.submenu == true then
    return false
  end
  if A0_257.work.inputok == false then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_257) == false then
    return
  end
  if A0_257.work.chosenOperation ~= -1 or A0_257.work.resultForAsk ~= 0 then
    return false
  end
  if worldMaster:_getServerTime() - A0_257.work.lastoperatetime < A0_257.work.waittime then
    return false
  end
  A0_257.work.focus = A3_260
  A0_257.work.listbox = A4_261
  if A0_257:getListBoxItemNum(A0_257.work.listbox) == 0 then
    return A0_257:updateWindowDisplay(true)
  end
  if A0_257.work.focus >= A0_257:getListBoxFocusNum(A0_257.work.listbox) then
    return A0_257:updateListFocus()
  end
  A0_257:updateWindowDisplay(true)
  if A0_257:getListBoxFocusNum(A0_257.work.listbox) == 0 then
    return
  end
  if A0_257.work.waittrash ~= false then
    return
  end
  if A0_257.work.inputok == false then
    return false
  end
  A0_257.work.inputok = false
  A0_257:openSubWidget()
  A0_257:selectedBorder(A0_257.work.index, true)
  A0_257.work.inputok = A0_257.work.inputok
end
function RetainerItemListWidget.processUICommandDefault(A0_262, A1_263, A2_264, A3_265, A4_266, A5_267)
  if A0_262.work.error == true or desktopWidget:isValidRetainer() == false then
    A0_262:saveSortType()
    return desktopWidget:closeWidgetDirect(A0_262)
  end
  if A0_262.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_262.work.resultForAsk ~= 0 then
    return false
  end
  if 0 < A0_262.work.updatecount then
    return false
  end
  if 0 < A0_262.work.updatecountbaz then
    return false
  end
  if A0_262.work.submenu == true then
    return false
  end
  if A0_262.work.inputok == false then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_262) == false then
    return
  end
  if A3_265 == "UILuaCommands.TabChanged" then
    A0_262.work.listbox = 0 + A0_262:getSelectedTab()
    A0_262:changeList()
  elseif A3_265 == "UILuaCommands.Previous" then
    A0_262:catalogSkip(-1)
  elseif A3_265 == "UILuaCommands.Next" then
    A0_262:catalogSkip(1)
  elseif A3_265 == "UILuaCommands.MouseEnteredItem" or A3_265 == "UILuaCommands.AnchoredItem" then
    if A5_267 == nil then
      return
    end
    if A4_266 == nil or A4_266 < 0 then
      return
    end
    if A5_267 == 6 then
      return
    else
      A0_262.work.listbox = A5_267
      A0_262.work.focus = A4_266
      if 0 <= A0_262:focusToIndex(A0_262.work.listbox, A0_262.work.focus) then
        A0_262.work.index = A0_262:focusToIndex(A0_262.work.listbox, A0_262.work.focus)
      end
    end
    A0_262.work.page = 0
    A0_262:updateWindowDisplay(true)
    A0_262:selectedBorder()
  end
end
function RetainerItemListWidget.processTimer(A0_268)
  if A0_268:focusToIndex(A0_268.work.listbox, A0_268.work.focus) >= 0 then
    A0_268.work.index = A0_268:focusToIndex(A0_268.work.listbox, A0_268.work.focus)
  end
  A0_268.work.page = 0
  A0_268:updateWindowDisplay(true)
  A0_268:selectedBorder()
end
function RetainerItemListWidget.catalogSkip(A0_269, A1_270)
  local L2_271, L3_272, L4_273, L5_274, L6_275, L7_276, L8_277, L9_278, L10_279, L11_280, L12_281, L13_282
  L2_271 = A0_269.work
  L2_271 = L2_271.focus
  L4_273 = A0_269
  L3_272 = A0_269.getListBoxFocusNum
  L5_274 = A0_269.work
  L5_274 = L5_274.listbox
  L3_272 = L3_272(L4_273, L5_274)
  L3_272 = L3_272 - 1
  if L3_272 == -1 then
    return
  end
  L4_273 = 2
  L5_274 = A0_269.work
  L5_274 = L5_274.listbox
  if L5_274 ~= 1 then
    L5_274 = 10 * A1_270
    L2_271 = L2_271 + L5_274
  else
    L5_274 = A0_269.work
    L5_274 = L5_274.sorttype
    if L5_274 == 0 then
      L5_274 = 10 * A1_270
      L2_271 = L2_271 + L5_274
    else
      L5_274 = nil
      if A1_270 > 0 then
        L6_275 = A0_269.work
        L6_275 = L6_275.focus
        L5_274 = L3_272 - L6_275
      else
        L6_275 = A0_269.work
        L5_274 = L6_275.focus
      end
      L7_276 = A0_269
      L6_275 = A0_269.getListPropertyName
      L8_277 = A0_269.work
      L8_277 = L8_277.listbox
      L6_275 = L6_275(L7_276, L8_277)
      L7_276 = desktopWidget
      L8_277 = L7_276
      L7_276 = L7_276.getItemSortKey
      L12_281 = 1
      L13_282 = L4_273
      L7_276 = L7_276(L8_277, L9_278, L10_279, L11_280, L12_281, L13_282)
      L8_277 = L2_271
      for L12_281 = 1, L5_274 do
        L8_277 = L8_277 + A1_270
        L13_282 = A0_269.focusToIndex
        L13_282 = L13_282(A0_269, A0_269.work.listbox, L8_277)
        if L7_276 ~= desktopWidget:getItemSortKey(A0_269, L6_275, L13_282, 1, L4_273) then
          L2_271 = L2_271 + L12_281 * A1_270
          break
        end
        if L12_281 == L5_274 then
          if A1_270 > 0 then
            L2_271 = L3_272
          else
            L2_271 = 0
          end
        end
      end
    end
  end
  if L3_272 < L2_271 then
    L2_271 = L3_272
  elseif L2_271 < 0 then
    L2_271 = 0
  end
  L5_274 = A0_269.work
  L5_274 = L5_274.focus
  if L2_271 ~= L5_274 then
    L5_274 = A0_269.work
    L5_274.focus = L2_271
    L6_275 = A0_269
    L5_274 = A0_269.updateWindowDisplay
    L7_276 = true
    L5_274(L6_275, L7_276)
  end
end
function RetainerItemListWidget.selectedBorder(A0_283, A1_284, A2_285)
  local L3_286, L4_287
  L3_286 = A0_283.getListPropertyName
  L3_286 = L3_286(L4_287, A0_283.work.listbox)
  if A1_284 ~= nil then
    A0_283:setListProperty(L3_286, A0_283.work.index, "selected", L4_287)
    A0_283.work.selected = A0_283.work.index
  elseif L4_287 == -1 then
    return
  else
    for _FORV_7_ = 1, A0_283:getListBoxItemNum(A0_283.work.listbox) do
      A0_283:setListProperty(L3_286, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_287.selected = -1
  end
  L4_287(A0_283, L3_286)
end
function RetainerItemListWidget.changeList(A0_288)
  A0_288:setText("TextBlock_Title", A0_288:getControlProperty("TabItem_" .. tostring(A0_288.work.listbox), "Header"))
  A0_288.work.index = 0
  A0_288.work.focus = 0
  return A0_288:updateWindowDisplay(true)
end
function RetainerItemListWidget.operateBazaarSell(A0_289)
  local L1_290, L2_291
  L1_290 = A0_289.work
  L1_290 = L1_290.chosenPackage
  if L1_290 == 8 then
    L1_290 = false
    return L1_290
  end
  L1_290 = A0_289.work
  L1_290.chosenOperation = -1
  L1_290 = false
  L2_291 = desktopWidget
  L2_291 = L2_291.openChildWidget
  L2_291 = L2_291(L2_291, "BazaarEditWidget", A0_289, true, true, 1, A0_289.work.chosenPackage, A0_289.work.chosenItem, 4, A0_289)
  L1_290 = L2_291
  if L1_290 == true then
    L2_291 = A0_289.work
    L2_291.editWidgetOpen = 2
    L2_291 = A0_289.work
    L2_291.lastsub = 2
    L2_291 = desktopWidget
    L2_291 = L2_291.getRetainerItem
    L2_291 = L2_291(L2_291, A0_289.work.chosenPackage, A0_289.work.chosenItem)
    if L2_291:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L2_291) > 0 then
      A0_289:showMateriaList()
      A0_289:setVisibility("Button_ListClose", false)
    end
  end
  return L1_290
end
function RetainerItemListWidget.operateBazaarBuy(A0_292)
  local L1_293, L2_294
  L1_293 = A0_292.work
  L1_293 = L1_293.chosenPackage
  if L1_293 == 8 then
    L1_293 = false
    return L1_293
  end
  L1_293 = A0_292.work
  L1_293.chosenOperation = -1
  L2_294 = A0_292
  L1_293 = A0_292.saveSortType
  L1_293(L2_294)
  L1_293 = false
  L2_294 = desktopWidget
  L2_294 = L2_294.openChildWidget
  L2_294 = L2_294(L2_294, "BazaarEditWidget", A0_292, true, true, 2, A0_292.work.chosenPackage, A0_292.work.chosenItem, 4, A0_292)
  L1_293 = L2_294
  if L1_293 == true then
    L2_294 = A0_292.work
    L2_294.editWidgetOpen = 2
    L2_294 = A0_292.work
    L2_294.lastsub = 3
    L2_294 = desktopWidget
    L2_294 = L2_294.getRetainerItem
    L2_294 = L2_294(L2_294, A0_292.work.chosenPackage, A0_292.work.chosenItem)
    if L2_294:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L2_294) > 0 then
      A0_292:showMateriaList()
      A0_292:setVisibility("Button_ListClose", false)
    end
  end
  return L1_293
end
function RetainerItemListWidget.operateBazaarRepair(A0_295)
  local L1_296, L2_297
  L1_296 = A0_295.work
  L1_296 = L1_296.chosenPackage
  if L1_296 == 8 then
    L1_296 = false
    return L1_296
  end
  L1_296 = A0_295.work
  L1_296.chosenOperation = -1
  L2_297 = A0_295
  L1_296 = A0_295.saveSortType
  L1_296(L2_297)
  L1_296 = false
  L2_297 = desktopWidget
  L2_297 = L2_297.openChildWidget
  L2_297 = L2_297(L2_297, "BazaarEditWidget", A0_295, true, true, 3, A0_295.work.chosenPackage, A0_295.work.chosenItem, 4, A0_295)
  L1_296 = L2_297
  if L1_296 == true then
    L2_297 = A0_295.work
    L2_297.editWidgetOpen = 2
    L2_297 = A0_295.work
    L2_297.lastsub = 4
    L2_297 = desktopWidget
    L2_297 = L2_297.getRetainerItem
    L2_297 = L2_297(L2_297, A0_295.work.chosenPackage, A0_295.work.chosenItem)
    if L2_297:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L2_297) > 0 then
      A0_295:showMateriaList()
      A0_295:setVisibility("Button_ListClose", false)
    end
  end
  return L1_296
end
function RetainerItemListWidget.operateBazaarAbort(A0_298)
  local L1_299, L2_300, L3_301, L4_302, L5_303
  L1_299 = A0_298.work
  L1_299 = L1_299.chosenPackage
  if L1_299 ~= 8 then
    L1_299 = false
    return L1_299
  end
  L2_300 = A0_298
  L1_299 = A0_298.getListPropertyName
  L3_301 = A0_298.work
  L3_301 = L3_301.listbox
  L1_299 = L1_299(L2_300, L3_301)
  L3_301 = A0_298
  L2_300 = A0_298.getListProperty
  L4_302 = L1_299
  L5_303 = A0_298.work
  L5_303 = L5_303.index
  L2_300 = L2_300(L3_301, L4_302, L5_303, "bazaarkind")
  if L2_300 == 0 then
    L4_302 = A0_298
    L3_301 = A0_298.getListProperty
    L5_303 = L1_299
    L3_301 = L3_301(L4_302, L5_303, A0_298.work.index, "rewardpackage")
    L5_303 = A0_298
    L4_302 = A0_298.getListProperty
    L4_302 = L4_302(L5_303, L1_299, A0_298.work.index, "rewarditem")
    L5_303 = A0_298.getListProperty
    L5_303 = L5_303(A0_298, L1_299, L4_302 - 1, "bazaarkind")
    A0_298:setBazaarEditData(22, L5_303, 0, 0, L3_301, L4_302, 0)
    A0_298.work.lastsub = 1
    A0_298.work.inputok = false
    return true
  else
    L4_302 = A0_298
    L3_301 = A0_298.setBazaarEditData
    L5_303 = 22
    L3_301(L4_302, L5_303, L2_300, 0, 0, 0, 0, 0)
    L3_301 = A0_298.work
    L3_301.lastsub = 1
    L3_301 = A0_298.work
    L3_301.inputok = false
    L3_301 = true
    return L3_301
  end
  L3_301 = true
  return L3_301
end
function RetainerItemListWidget.operateTrash(A0_304)
  local L1_305, L2_306, L3_307
  L2_306 = A0_304
  L1_305 = A0_304.updateWindowDisplay
  L1_305(L2_306)
  L1_305 = A0_304.work
  L1_305.chosenOperation = -1
  L2_306 = A0_304
  L1_305 = A0_304.getListPropertyName
  L3_307 = A0_304.work
  L3_307 = L3_307.listbox
  L1_305 = L1_305(L2_306, L3_307)
  L2_306 = false
  L3_307 = desktopWidget
  L3_307 = L3_307.openChildWidget
  L3_307 = L3_307(L3_307, "ItemEditWidget", A0_304, true, true, 3, A0_304.work.chosenPackage, A0_304.work.chosenItem, 4, A0_304)
  L2_306 = L3_307
  if L2_306 == true then
    L3_307 = A0_304.work
    L3_307.editWidgetOpen = 1
    L3_307 = A0_304.work
    L3_307.lastsub = 8
    L3_307 = desktopWidget
    L3_307 = L3_307.getRetainerItem
    L3_307 = L3_307(L3_307, A0_304.work.chosenPackage, A0_304.work.chosenItem)
    if L3_307:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L3_307) > 0 then
      A0_304:showMateriaList()
      A0_304:setVisibility("Button_ListClose", false)
    end
  end
  return L2_306
end
function RetainerItemListWidget.operateSort(A0_308, A1_309)
  local L2_310
  L2_310 = A0_308.work
  L2_310 = L2_310.listbox
  if L2_310 == 1 then
    if A1_309 ~= nil then
      L2_310 = A0_308.work
      L2_310.sorttype = A1_309
    else
      L2_310 = A0_308.changeSortType
      L2_310(A0_308)
    end
    L2_310 = A0_308.work
    L2_310 = L2_310.index
    A0_308:updateSortType()
    if A0_308:indexToFocus(A0_308.work.listbox, L2_310) > -1 then
      A0_308.work.focus = A0_308:indexToFocus(A0_308.work.listbox, L2_310)
    end
    if A0_308:focusToIndex(A0_308.work.listbox, A0_308.work.focus) >= 0 then
      A0_308.work.index = A0_308:focusToIndex(A0_308.work.listbox, A0_308.work.focus)
    end
    A0_308:displaySortType(A0_308.work.sorttype)
    A0_308.work.lastsub = 9
  end
  L2_310 = true
  return L2_310
end
function RetainerItemListWidget.operateMateriaView(A0_311)
  A0_311:showMateriaList()
  A0_311:setVisibility("Button_ListClose", true)
  A0_311.work.lastsub = 15
  return true
end
function RetainerItemListWidget.setSubPosition(A0_312)
  local L1_313, L2_314, L3_315, L4_316, L5_317, L6_318, L7_319, L8_320, L9_321, L10_322, L11_323, L12_324, L13_325, L14_326, L15_327, L16_328
  L2_314 = A0_312
  L1_313 = A0_312.getChildWidgetByWindowName
  L3_315 = "ItemSubWidget"
  L1_313 = L1_313(L2_314, L3_315)
  if L1_313 ~= nil then
    L3_315 = L1_313
    L2_314 = L1_313.setProperty
    L4_316 = "Margin"
    L5_317 = "0,0,0,0"
    L2_314(L3_315, L4_316, L5_317)
    L3_315 = A0_312
    L2_314 = A0_312.getWindowPosition
    L3_315 = L2_314(L3_315)
    L5_317 = A0_312
    L4_316 = A0_312.getWindowSize
    L5_317 = L4_316(L5_317)
    L6_318 = desktopWidget
    L7_319 = L6_318
    L6_318 = L6_318.getWindowSize
    L7_319 = L6_318(L7_319)
    L2_314 = L2_314 + 64
    L3_315 = L3_315 + 36
    L8_320 = L6_318 - 64
    L9_321 = 64
    L10_322 = L7_319 - 36
    L11_323 = 36
    if L6_318 == 640 and L7_319 == 480 then
      L8_320 = L6_318 * 0.85
      L9_321 = L6_318 * 0.15
      L10_322 = L7_319 * 0.85
      L11_323 = L7_319 * 0.15
    end
    L12_324 = L3_315 + 120
    L14_326 = L1_313
    L13_325 = L1_313.getWindowSize
    L14_326 = L13_325(L14_326)
    L15_327 = L12_324 + L14_326
    L16_328 = L2_314 + L4_316
    if L8_320 < L16_328 + L13_325 then
      L16_328 = L16_328 - (L16_328 + L13_325 - L8_320)
    end
    if L10_322 < L15_327 then
      L12_324 = L12_324 - (L15_327 - L10_322)
    end
    L1_313:setProperty("Top", L12_324)
    L1_313:setProperty("Left", L16_328)
  end
end
function RetainerItemListWidget.openSubWidget(A0_329)
  local L1_330, L2_331, L3_332, L4_333, L5_334, L6_335, L7_336, L8_337, L9_338, L10_339, L11_340, L12_341, L13_342, L14_343, L15_344, L16_345, L17_346
  L1_330 = A0_329.work
  L1_330 = L1_330.chosenOperation
  if L1_330 == -1 then
    L1_330 = A0_329.work
    L1_330 = L1_330.resultForAsk
  elseif L1_330 ~= 0 then
    L1_330 = false
    return L1_330
  end
  L2_331 = A0_329
  L1_330 = A0_329.getChildWidgetByWindowName
  L3_332 = "ItemSubWidget"
  L1_330 = L1_330(L2_331, L3_332)
  if L1_330 ~= nil then
    L2_331 = A0_329.work
    L4_333 = A0_329
    L3_332 = A0_329.getPackageFromList
    L5_334 = A0_329.work
    L5_334 = L5_334.listbox
    L3_332 = L3_332(L4_333, L5_334)
    L2_331.chosenPackage = L3_332
    L2_331 = A0_329.work
    L3_332 = A0_329.work
    L3_332 = L3_332.index
    L3_332 = L3_332 + 1
    L2_331.chosenItem = L3_332
    L2_331 = A0_329.work
    L2_331.chosenOwner = 4
    L3_332 = A0_329
    L2_331 = A0_329.copyItem
    L2_331(L3_332)
    L2_331 = 0
    L3_332 = 0
    L4_333 = 0
    L5_334 = 0
    L6_335 = 0
    L7_336 = 0
    L8_337 = 0
    L9_338 = 0
    L10_339 = 0
    L11_340 = 2
    L12_341 = 0
    L13_342 = 0
    L14_343 = 0
    L15_344 = 0
    L16_345 = 0
    L17_346 = A0_329.setSubPosition
    L17_346(A0_329)
    L17_346 = A0_329.work
    L17_346 = L17_346.listbox
    if L17_346 == 4 then
      L17_346 = desktopWidget
      L17_346 = L17_346.countPartyMember
      L17_346 = L17_346(L17_346)
      if L17_346 > 1 then
        L8_337 = 2
      else
        L8_337 = 1
      end
      L7_336 = 2
    else
      L17_346 = A0_329.work
      L17_346 = L17_346.listbox
      if L17_346 == 3 then
        L17_346 = desktopWidget
        L17_346 = L17_346.isRetainerItemAttached
        L17_346 = L17_346(L17_346, A0_329.work.chosenPackage, A0_329.work.chosenItem)
        if L17_346 == false then
          if desktopWidget:getRetainerItemDealData(A0_329.work.chosenPackage, A0_329.work.chosenItem) == 11 or desktopWidget:getRetainerItemDealData(A0_329.work.chosenPackage, A0_329.work.chosenItem) == 12 or desktopWidget:getRetainerItemDealData(A0_329.work.chosenPackage, A0_329.work.chosenItem) == 13 then
            L2_331 = 2
          else
            L2_331 = 1
          end
        else
          L2_331 = 2
        end
        if desktopWidget:getRetainerItem(A0_329.work.chosenPackage, A0_329.work.chosenItem):isEquipment() then
          if desktopWidget:getRetainerItem(A0_329.work.chosenPackage, A0_329.work.chosenItem):getMateriaBindPermission() then
            L16_345 = 2
          else
            L16_345 = 0
          end
        end
      else
        L17_346 = desktopWidget
        L17_346 = L17_346.getRetainerItem
        L17_346 = L17_346(L17_346, A0_329.work.chosenPackage, A0_329.work.chosenItem)
        if A0_329.work.chosenPackage == 1 then
          if L17_346:_isEquipping() == false then
            L9_338 = 2
            if L17_346:isRareItem() == false then
              L4_333 = 2
            else
              L4_333 = 1
            end
            if L17_346:isExclusiveItem() == false then
              L3_332 = 2
            else
              L3_332 = 1
              L4_333 = 1
            end
          else
            L3_332 = 1
            L4_333 = 1
            L9_338 = 1
          end
          if desktopWidget:getItemRepairData(A0_329, L17_346) == true then
            if desktopWidget:getItemRepairData(A0_329, L17_346) == desktopWidget:getItemRepairData(A0_329, L17_346) then
              L5_334 = 1
            elseif L17_346:_isEquipping() == false then
              L5_334 = 2
            else
              L5_334 = 1
            end
          end
          L10_339 = 2
          if L17_346:getMateriaBindPermission() then
            L16_345 = 2
          else
            L16_345 = 0
          end
        else
          L3_332 = 2
          L4_333 = 2
        end
      end
    end
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_BazaarAbort", L2_331)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_BazaarSell", L3_332)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_BazaarBuy", L4_333)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_BazaarRepair", L5_334)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_Repair", L6_335)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_Materialize", L12_341)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_MateriaAttach", L13_342)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_MateriaOrder", L14_343)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_MateriaAbort", L15_344)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_MateriaView", L16_345)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_DropItemGetAll", L7_336)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_DropItemGiveAll", L8_337)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_Trash", L9_338)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_Sort", L10_339)
    L17_346 = L1_330.setSubMenuVisibility
    L17_346(L1_330, "Button_Cancel", L11_340)
    L17_346 = A0_329.work
    L17_346.submenu = true
    L17_346 = L1_330.setModal
    L17_346(L1_330, true)
    L17_346 = L1_330.show
    L17_346(L1_330)
    L17_346 = A0_329.work
    L17_346 = L17_346.lastsub
    if L17_346 == 1 and L2_331 == 2 then
      L17_346 = L1_330.setWindowFocus
      L17_346(L1_330, "Button_BazaarAbort")
    else
      L17_346 = A0_329.work
      L17_346 = L17_346.lastsub
      if L17_346 == 2 and L3_332 == 2 then
        L17_346 = L1_330.setWindowFocus
        L17_346(L1_330, "Button_BazaarSell")
      else
        L17_346 = A0_329.work
        L17_346 = L17_346.lastsub
        if L17_346 == 3 and L4_333 == 2 then
          L17_346 = L1_330.setWindowFocus
          L17_346(L1_330, "Button_BazaarBuy")
        else
          L17_346 = A0_329.work
          L17_346 = L17_346.lastsub
          if L17_346 == 4 and L5_334 == 2 then
            L17_346 = L1_330.setWindowFocus
            L17_346(L1_330, "Button_BazaarRepair")
          else
            L17_346 = A0_329.work
            L17_346 = L17_346.lastsub
            if L17_346 == 5 and L6_335 == 2 then
              L17_346 = L1_330.setWindowFocus
              L17_346(L1_330, "Button_Repair")
            else
              L17_346 = A0_329.work
              L17_346 = L17_346.lastsub
              if L17_346 == 11 and L12_341 == 2 then
                L17_346 = L1_330.setWindowFocus
                L17_346(L1_330, "Button_Materialize")
              else
                L17_346 = A0_329.work
                L17_346 = L17_346.lastsub
                if L17_346 == 12 and L13_342 == 2 then
                  L17_346 = L1_330.setWindowFocus
                  L17_346(L1_330, "Button_MateriaAttach")
                else
                  L17_346 = A0_329.work
                  L17_346 = L17_346.lastsub
                  if L17_346 == 15 and L16_345 == 2 then
                    L17_346 = L1_330.setWindowFocus
                    L17_346(L1_330, "Button_MateriaView")
                  else
                    L17_346 = A0_329.work
                    L17_346 = L17_346.lastsub
                    if L17_346 == 6 and L7_336 == 2 then
                      L17_346 = L1_330.setWindowFocus
                      L17_346(L1_330, "Button_DropItemGetAll")
                    else
                      L17_346 = A0_329.work
                      L17_346 = L17_346.lastsub
                      if L17_346 == 7 and L8_337 == 2 then
                        L17_346 = L1_330.setWindowFocus
                        L17_346(L1_330, "Button_DropItemGiveAll")
                      else
                        L17_346 = A0_329.work
                        L17_346 = L17_346.lastsub
                        if L17_346 == 8 and L9_338 == 2 then
                          L17_346 = L1_330.setWindowFocus
                          L17_346(L1_330, "Button_Trash")
                        else
                          L17_346 = A0_329.work
                          L17_346 = L17_346.lastsub
                          if L17_346 == 9 and L10_339 == 2 then
                            L17_346 = L1_330.setWindowFocus
                            L17_346(L1_330, "Button_Sort")
                          else
                            L17_346 = L1_330.setWindowFocus
                            L17_346(L1_330, "Button_Cancel")
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
function RetainerItemListWidget.closeSubWidget(A0_347)
  local L1_348
  L1_348 = A0_347.work
  L1_348 = L1_348.inputok
  A0_347.work.inputok = false
  if A0_347:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
    A0_347:getChildWidgetByWindowName("ItemSubWidget"):hide()
    A0_347.work.submenu = false
  end
  A0_347.work.inputok = L1_348
  if not A0_347.work.isMateriaList then
    A0_347:updateWindowDisplay(true)
  end
end
function RetainerItemListWidget.updateItemList(A0_349, A1_350, A2_351)
  local L3_352, L4_353, L5_354, L6_355, L7_356
  L4_353 = A0_349
  L3_352 = A0_349.getChildWidgetByWindowName
  L5_354 = "ItemSelectWidget"
  L3_352 = L3_352(L4_353, L5_354)
  if L3_352 ~= nil then
    L5_354 = L3_352
    L4_353 = L3_352.updateItemList
    L6_355 = A1_350
    L7_356 = A2_351
    L4_353(L5_354, L6_355, L7_356)
  end
  L4_353 = A0_349.work
  L4_353 = L4_353.inputok
  L5_354 = -1
  if A1_350 == 0 then
    L6_355 = A0_349.work
    L6_355.updatecountbaz = A2_351
    L6_355 = A0_349.work
    L6_355.indexChange = false
    L6_355 = A0_349.work
    L6_355.focusChange = false
    return
  else
    L6_355 = A0_349.work
    L6_355.inputok = false
    if A1_350 == 1 then
      L6_355 = A0_349.work
      L6_355 = L6_355.listbox
      if L6_355 == 1 then
        L6_355 = A0_349.work
        L6_355 = L6_355.index
        L6_355 = L6_355 + 1
        if A2_351 < L6_355 then
          L6_355 = A0_349.work
          L6_355.indexChange = true
        end
      end
      L7_356 = A0_349
      L6_355 = A0_349.makeListFromPackage
      L6_355(L7_356, A1_350, A2_351)
      L5_354 = 1
    elseif A1_350 == 100 then
      L5_354 = 2
    elseif A1_350 == 8 then
      L5_354 = 3
    end
    L6_355 = A0_349.work
    L6_355 = L6_355.chosenPackage
    if L6_355 == A1_350 then
      L6_355 = A0_349.work
      L6_355 = L6_355.chosenItem
      if L6_355 == A2_351 then
        L6_355 = A0_349.work
        L6_355 = L6_355.editWidgetOpen
        if L6_355 == 0 then
          L6_355 = A0_349.work
          L6_355 = L6_355.submenu
        elseif L6_355 == true then
          L7_356 = A0_349
          L6_355 = A0_349.isSameItem
          L6_355 = L6_355(L7_356, A1_350, A2_351)
          if L6_355 == false then
            L6_355 = A0_349.work
            L6_355.closeok = true
          end
        end
      end
    end
  end
  L6_355 = A0_349.work
  L6_355 = L6_355.updatecountbaz
  if L6_355 > 0 then
    L6_355 = A0_349.work
    L7_356 = A0_349.work
    L7_356 = L7_356.updatecountbaz
    L7_356 = L7_356 - 1
    L6_355.updatecountbaz = L7_356
  end
  L6_355 = A0_349.work
  L6_355 = L6_355.updatecountbaz
  if L6_355 == 0 then
    L6_355 = A0_349.work
    L6_355 = L6_355.error
    if L6_355 ~= true then
      L6_355 = desktopWidget
      L7_356 = L6_355
      L6_355 = L6_355.isValidRetainer
      L6_355 = L6_355(L7_356)
    elseif L6_355 == false then
      L6_355 = A0_349.work
      L6_355.chosenOperation = 1
      L6_355 = desktopWidget
      L7_356 = L6_355
      L6_355 = L6_355.closeWidgetDirect
      return L6_355(L7_356, A0_349)
    end
    if A1_350 == 100 then
      L7_356 = A0_349
      L6_355 = A0_349.makeListFromPackage
      L6_355(L7_356, A1_350)
      L6_355 = "TextBlock_NoContents_"
      L7_356 = tostring
      L7_356 = L7_356(2)
      L6_355 = L6_355 .. L7_356
      L7_356 = A0_349.getListPropertyName
      L7_356 = L7_356(A0_349, 2)
      A0_349:updateListProperty(L7_356)
      A0_349:setVisibility(L6_355, A0_349:getListBoxFocusNum(2) == 0)
    elseif A1_350 == 8 then
      L7_356 = A0_349
      L6_355 = A0_349.makeListFromPackage
      L6_355(L7_356, A1_350)
      L6_355 = A0_349.work
      L6_355 = L6_355.listbox
      if L6_355 == 3 then
        L6_355 = A0_349.work
        L6_355 = L6_355.isMateriaList
        if L6_355 then
          L7_356 = A0_349
          L6_355 = A0_349.closeMateriaList
          L6_355(L7_356)
        end
      end
      L6_355 = "TextBlock_NoContents_"
      L7_356 = tostring
      L7_356 = L7_356(3)
      L6_355 = L6_355 .. L7_356
      L7_356 = A0_349.setVisibility
      L7_356(A0_349, L6_355, A0_349:getListBoxFocusNum(3) == 0)
    elseif A1_350 == 1 then
      L7_356 = A0_349
      L6_355 = A0_349.getListPropertyName
      L6_355 = L6_355(L7_356, 1)
      L7_356 = "TextBlock_NoContents_"
      L7_356 = L7_356 .. tostring(1)
      A0_349:updateListProperty(L6_355)
      A0_349:setVisibility(L7_356, A0_349:getListBoxFocusNum(1) == 0)
    end
    L6_355 = A0_349.work
    L6_355 = L6_355.closeok
    if L6_355 == true then
      L6_355 = A0_349.work
      L6_355 = L6_355.submenu
      if L6_355 == true then
        L7_356 = A0_349
        L6_355 = A0_349.getChildWidgetByWindowName
        L6_355 = L6_355(L7_356, "ItemSubWidget")
        if L6_355 ~= nil then
          L7_356 = L6_355.isShow
          L7_356 = L7_356(L6_355)
          if L7_356 == true then
            L7_356 = A0_349.closeSubWidget
            L7_356(A0_349)
          end
          L7_356 = A0_349.work
          L7_356.closeok = false
        end
      end
    end
    L6_355 = A0_349.work
    L6_355 = L6_355.editWidgetOpen
    if L6_355 ~= 0 then
      L6_355 = A0_349.work
      L6_355 = L6_355.closeok
      if L6_355 == true then
        L6_355 = A0_349.work
        L6_355 = L6_355.editWidgetOpen
        if L6_355 == 1 then
          L7_356 = A0_349
          L6_355 = A0_349.closeItemEdit
          L6_355(L7_356)
        end
        L6_355 = A0_349.work
        L6_355 = L6_355.editWidgetOpen
        if L6_355 == 2 then
          L7_356 = A0_349
          L6_355 = A0_349.closeBazaarEdit
          L6_355(L7_356)
        end
        L6_355 = A0_349.work
        L6_355.closeok = false
      end
    end
    L7_356 = A0_349
    L6_355 = A0_349.displayBagcapacityAndMoney
    L6_355(L7_356)
    L6_355 = A0_349.work
    L6_355 = L6_355.listbox
    if L5_354 == L6_355 then
      L7_356 = A0_349
      L6_355 = A0_349.updateListFocus
      L6_355(L7_356)
    end
    L6_355 = A0_349.work
    L6_355.waittrash = false
  end
  L6_355 = A0_349.work
  L6_355.inputok = L4_353
  return
end
function RetainerItemListWidget.updatePlayerItem(A0_357, A1_358, A2_359)
  if A1_358 == 0 then
    A0_357.work.updatecount = A2_359
    return
  end
  if 0 < A0_357.work.updatecount then
    A0_357.work.updatecount = A0_357.work.updatecount - 1
  end
  if A0_357.work.updatecount == 0 and (A0_357.work.error == true or desktopWidget:isValidRetainer() == false) then
    A0_357.work.chosenOperation = 1
    return desktopWidget:closeWidgetDirect(A0_357)
  end
end
function RetainerItemListWidget.setBazaarEditData(A0_360, A1_361, A2_362, A3_363, A4_364, A5_365, A6_366, A7_367)
  local L8_368, L9_369
  if A1_361 == 1 then
    return
  end
  L8_368 = A0_360.work
  L8_368 = L8_368.chosenOperation
  if L8_368 == -1 then
    L8_368 = A0_360.work
    L8_368 = L8_368.resultForAsk
  elseif L8_368 ~= 0 then
    L8_368 = false
    return L8_368
  end
  L8_368 = A0_360.work
  L8_368.chosenOperation = A1_361
  L8_368 = A0_360.work
  L8_368.bazaartype = A2_362
  L8_368 = A0_360.work
  L8_368.rewardPrice = A3_363
  L8_368 = A0_360.work
  L9_369 = A0_360.work
  L9_369 = L9_369.chosenPackage
  L8_368.resultPackage = L9_369
  L8_368 = A0_360.work
  L9_369 = A0_360.work
  L9_369 = L9_369.chosenItem
  L8_368.resultItem = L9_369
  L8_368 = A0_360.work
  L8_368.resultCount = A4_364
  L8_368 = A0_360.work
  L8_368.rewardPackage = A5_365
  L8_368 = A0_360.work
  L8_368.rewardItem = A6_366
  L8_368 = A0_360.work
  L8_368.rewardCount = A7_367
end
function RetainerItemListWidget.closeBazaarEdit(A0_370, A1_371)
  A0_370.work.editWidgetOpen = 0
  if A1_371 == nil then
    if A0_370.work.chosenOperation == 5 then
      A0_370.work.chosenOperation = -1
    elseif A0_370.work.chosenOperation == 1 then
      A0_370.work.chosenOperation = -1
    end
  else
    A0_370.work.chosenOperation = -1
  end
  if A0_370.work.isMateriaList then
    A0_370:closeMateriaList()
  end
  if A0_370:getChildWidgetByWindowName("BazaarEditWidget") ~= nil then
    desktopWidget:closeChildWidget("BazaarEditWidget", A0_370)
  end
  if A1_371 == nil then
    A0_370:updateWindowDisplay(true)
    A0_370:selectedBorder()
  end
  return true
end
function RetainerItemListWidget.setItemEditData(A0_372, A1_373, A2_374, A3_375)
  local L4_376, L5_377
  if A1_373 ~= 12 then
    L4_376 = A0_372.work
    L4_376.chosenOperation = 13
    L4_376 = A0_372.work
    L4_376.waittrash = true
    L4_376 = A0_372.work
    L5_377 = A0_372.work
    L5_377 = L5_377.chosenPackage
    L4_376.resultPackage = L5_377
    L4_376 = A0_372.work
    L5_377 = A0_372.work
    L5_377 = L5_377.chosenItem
    L4_376.resultItem = L5_377
    if A3_375 ~= nil then
      L4_376 = A0_372.work
      L4_376.resultCount = A3_375
    else
      L4_376 = A0_372.work
      L4_376.resultCount = 0
    end
  else
    L4_376 = A0_372.work
    L4_376.editWidgetOpen = 0
  end
  L4_376 = true
  return L4_376
end
function RetainerItemListWidget.closeItemEdit(A0_378, A1_379)
  A0_378.work.editWidgetOpen = 0
  if A0_378.work.isMateriaList then
    A0_378:closeMateriaList()
  end
  if A0_378:getChildWidgetByWindowName("ItemEditWidget") ~= nil then
    desktopWidget:closeChildWidget("ItemEditWidget", A0_378)
  end
  if A1_379 == nil then
    A0_378:updateWindowDisplay(true)
    A0_378:selectedBorder()
  end
  return true
end
function RetainerItemListWidget.checkChosenItem(A0_380, A1_381, A2_382, A3_383)
  if A2_382 ~= nil and A2_382 ~= A0_380.work.chosenPackage then
    return false
  end
  if A3_383 ~= nil and A3_383 ~= A0_380.work.chosenItem then
    return false
  end
  if A0_380.work.chosenPackage ~= A0_380:getPackageFromList(A0_380.work.listbox) then
    return false
  end
  if A0_380.work.chosenItem ~= A0_380.work.index + 1 then
    return false
  end
  if A1_381 == nil then
    return false
  end
  if A1_381:_isAlive() == false then
    return false
  end
  if desktopWidget:getRetainerItem(A0_380.work.chosenPackage, A0_380.work.chosenItem) == A1_381 then
    return true
  else
    return false
  end
end
function RetainerItemListWidget.getItemContent(A0_384, A1_385, A2_386, A3_387)
  local L4_388
  if A2_386 == "itemPackage" then
    L4_388 = A0_384.work
    L4_388 = L4_388.chosenPackage
    return L4_388
  elseif A2_386 == "itemIndex" then
    L4_388 = A0_384.work
    L4_388 = L4_388.chosenItem
    return L4_388
  elseif A2_386 == "itemOwner" then
    L4_388 = 4
    return L4_388
  end
  if A1_385 == nil then
    L4_388 = A0_384.getControlProperty
    return L4_388(A0_384, A2_386, A3_387)
  else
    L4_388 = A0_384.getListPropertyName
    L4_388 = L4_388(A0_384, A0_384.work.listbox)
    if A1_385 == -1 then
      return A0_384:getListProperty(L4_388, A0_384.work.index, A2_386)
    else
      return A0_384:getListProperty(L4_388, A1_385, A2_386)
    end
  end
end
function RetainerItemListWidget.processWaitCallFunction(A0_389)
  local L1_390, L2_391
  L1_390 = A0_389.work
  L1_390 = L1_390.chosenOperation
  if L1_390 == -1 then
    L1_390 = false
    return L1_390
  else
    L1_390 = A0_389.work
    L2_391 = A0_389.work
    L2_391 = L2_391.chosenOperation
    L1_390.resultForAsk = L2_391
    L1_390 = A0_389.work
    L1_390.chosenOperation = -1
    L1_390 = A0_389.work
    L1_390.inputok = false
    L1_390 = true
    return L1_390
  end
end
function RetainerItemListWidget.getAskResult(A0_392)
  local L1_393, L2_394, L3_395, L4_396, L5_397
  L1_393 = A0_392.work
  L1_393 = L1_393.resultForAsk
  L2_394 = A0_392.work
  L2_394.resultForAsk = 0
  if L1_393 == 1 then
    L2_394 = 1
    return L2_394
  elseif L1_393 == 13 then
    L2_394 = A0_392.work
    L2_394.waittime = 2
    L2_394 = L1_393
    L3_395 = A0_392.work
    L3_395 = L3_395.chosenPackage
    L4_396 = A0_392.work
    L4_396 = L4_396.chosenItem
    return L2_394, L3_395, L4_396
  elseif L1_393 == 21 then
    L2_394 = A0_392.work
    L2_394.waittime = 1
    L2_394 = L1_393
    L3_395 = A0_392.work
    L3_395 = L3_395.resultPackage
    L4_396 = A0_392.work
    L4_396 = L4_396.resultItem
    L5_397 = A0_392.work
    L5_397 = L5_397.bazaartype
    return L2_394, L3_395, L4_396, L5_397, A0_392.work.rewardPrice, A0_392.work.rewardPackage, A0_392.work.rewardItem, A0_392.work.resultCount, A0_392.work.rewardCount
  elseif L1_393 == 22 then
    L2_394 = A0_392.work
    L2_394 = L2_394.rewardPackage
    if L2_394 ~= 0 then
      L2_394 = A0_392.work
      L2_394.waittime = 2
      L2_394 = L1_393
      L3_395 = A0_392.work
      L3_395 = L3_395.rewardPackage
      L4_396 = A0_392.work
      L4_396 = L4_396.rewardItem
      L5_397 = A0_392.work
      L5_397 = L5_397.bazaartype
      return L2_394, L3_395, L4_396, L5_397
    else
      L2_394 = A0_392.work
      L2_394.waittime = 2
      L2_394 = L1_393
      L3_395 = A0_392.work
      L3_395 = L3_395.resultPackage
      L4_396 = A0_392.work
      L4_396 = L4_396.resultItem
      L5_397 = A0_392.work
      L5_397 = L5_397.bazaartype
      return L2_394, L3_395, L4_396, L5_397
    end
  elseif L1_393 == 23 then
    L2_394 = A0_392.work
    L2_394.waittime = 1
    L2_394 = L1_393
    L3_395 = A0_392.work
    L3_395 = L3_395.resultPackage
    L4_396 = A0_392.work
    L4_396 = L4_396.resultItem
    return L2_394, L3_395, L4_396
  else
    L2_394 = L1_393
    L3_395, L4_396, L5_397 = nil, nil, nil
    return L2_394, L3_395, L4_396, L5_397, nil
  end
end
function RetainerItemListWidget.setAskParameter(A0_398)
  A0_398.work.lastoperatetime = worldMaster:_getServerTime()
  A0_398.work.editWidgetOpen = 0
  A0_398.work.resultForAsk = 0
  A0_398.work.chosenOperation = -1
  A0_398:updateWindowDisplay(true)
  A0_398.work.inputok = true
end
function RetainerItemListWidget.syncItemWork(A0_399, A1_400)
end
function RetainerItemListWidget.setSortTypeWork(A0_401, A1_402)
  local L2_403
  L2_403 = A0_401.work
  L2_403 = L2_403.sorttype
  if L2_403 ~= A1_402 then
    L2_403 = A0_401.work
    L2_403.sorttype = A1_402
    L2_403 = A0_401.work
    L2_403 = L2_403.index
    A0_401:updateSortType()
    if A0_401:indexToFocus(A0_401.work.listbox, L2_403) > -1 then
      A0_401.work.focus = A0_401:indexToFocus(A0_401.work.listbox, L2_403)
    end
    if A0_401:focusToIndex(A0_401.work.listbox, A0_401.work.focus) >= 0 then
      A0_401.work.index = A0_401:focusToIndex(A0_401.work.listbox, A0_401.work.focus)
    end
    A0_401:displaySortType(A0_401.work.sorttype)
  end
end
function RetainerItemListWidget.showMateriaList(A0_404)
  local L1_405
  L1_405 = desktopWidget
  L1_405 = L1_405.getRetainerItem
  L1_405 = L1_405(L1_405, A0_404.work.chosenPackage, A0_404.work.chosenItem)
  desktopWidget:setMateriaListItems(A0_404, L1_405)
  A0_404:setVisibility("Grid_MateriaEquipList", true)
  A0_404:setVisibility("Grid_TabList", false)
  A0_404:setVisibility("Button_SortStatus", false)
  A0_404.work.isMateriaList = true
end
function RetainerItemListWidget.closeMateriaList(A0_406)
  A0_406:setVisibility("Grid_MateriaEquipList", false)
  A0_406:setVisibility("Grid_TabList", true)
  if A0_406.work.listbox == 1 then
    A0_406:setVisibility("Button_SortStatus", true)
  end
  A0_406.work.isMateriaList = false
end
function RetainerItemListWidget.displaySortType(A0_407, A1_408)
  desktopWidget:displaySortType(A1_408, A0_407, "Button_SortStatus")
end
function RetainerItemListWidget.changeSortType(A0_409)
  A0_409.work.sorttype = desktopWidget:changeSortType(A0_409.work.sorttype)
end
function RetainerItemListWidget.saveSortType(A0_410)
  desktopWidget:saveSortType(A0_410.work.sorttype)
end
function RetainerItemListWidget.getCurrentSortType(A0_411)
  return A0_411.work.sorttype
end
