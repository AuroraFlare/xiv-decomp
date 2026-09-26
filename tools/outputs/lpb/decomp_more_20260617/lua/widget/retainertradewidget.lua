require("/Widget/WidgetBaseClass")
_defineClass("RetainerTradeWidget", "WidgetBaseClass")
function RetainerTradeWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "WItemListWidget"
  return L1_1
end
function RetainerTradeWidget.init(A0_2, A1_3)
  local L2_4
  L2_4 = A0_2.work
  L2_4._temp = {
    {"chosenItem", "integer32"},
    {
      "chosenPackage",
      "integer8"
    },
    {
      "chosenOperation",
      "integer16"
    },
    {
      "chosenCount",
      "integer32"
    },
    {
      "chosenOwner",
      "integer8"
    },
    {
      "itemListFocus",
      "integer16"
    },
    {"selected", "integer16"},
    {"itemlist", "integer8"},
    {"playerItem", "integer32"},
    {
      "playerItemPackage",
      "integer8"
    },
    {
      "retainerItem",
      "integer32"
    },
    {
      "retainerItemPackage",
      "integer8"
    },
    {
      "editWidgetMode",
      "integer8"
    },
    {"moneyIndex", "integer16"},
    {"moneyCount", "integer32"},
    {
      "updatecount",
      "integer16"
    },
    {
      "updatenexttime",
      "boolean"
    },
    {
      "updatecountbaz",
      "integer16"
    },
    {
      "resultForAsk",
      "integer32"
    },
    {"editmoney", "boolean"},
    {"tabchanged", "boolean"},
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
    {"closeok", "boolean"},
    {"amActive", "boolean"},
    {"error", "boolean"},
    {"sorttype", "integer8"},
    {
      "waitplayerupdate",
      "boolean"
    },
    {
      "waitretainerupdate",
      "boolean"
    },
    {"bakcatalog", "integer32"},
    {"bakquality", "integer8"},
    {"bakstack", "integer32"},
    {"bakrare", "boolean"},
    {"bakex", "boolean"},
    {"bakowner", "integer8"},
    {
      "noticeGetTime",
      "integer32"
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
  L2_4.updatenexttime = false
  L2_4 = A0_2.work
  L2_4.sorttype = desktopWidget:getConfigWork(9)
  L2_4 = A0_2.work
  L2_4.waitplayerupdate = false
  L2_4 = A0_2.work
  L2_4.waitretainerupdate = false
  L2_4 = A0_2.work
  L2_4.editmoney = false
  L2_4 = A0_2.work
  L2_4.closeok = false
  L2_4 = A0_2.work
  L2_4.editWidgetMode = 0
  L2_4 = A0_2.work
  L2_4.amActive = false
  L2_4 = A0_2.work
  L2_4.error = false
  L2_4 = A0_2.setCancelCondition
  L2_4(A0_2)
  L2_4 = A0_2.setCloseCondition
  L2_4(A0_2)
  L2_4 = A0_2.setConfirmCondition
  L2_4(A0_2, "Button_SortStatus")
  L2_4 = A0_2.setControlCommandCondition
  L2_4(A0_2, "TabControl_ItemList", "UILuaCommands.TabChanged")
  L2_4 = A0_2.setControlCommandCondition
  L2_4(A0_2, "TabControl_ItemList_2", "UILuaCommands.TabChanged")
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
  L2_4 = A0_2.initListBox
  L2_4(A0_2, 6)
  L2_4 = A0_2.setControlProperty
  L2_4(A0_2, "TabItem_1", "IsTabStop", false)
  L2_4 = A0_2.setControlProperty
  L2_4(A0_2, "TabItem_2", "IsTabStop", false)
  L2_4 = A0_2.setControlProperty
  L2_4(A0_2, "TabItem_3", "IsTabStop", false)
  L2_4 = A0_2.setControlProperty
  L2_4(A0_2, "TabItem_4", "IsTabStop", false)
  L2_4 = A0_2.setControlProperty
  L2_4(A0_2, "TabItem_5", "IsTabStop", false)
  L2_4 = A0_2.setControlProperty
  L2_4(A0_2, "TabItem_6", "IsTabStop", false)
  L2_4 = desktopWidget
  L2_4 = L2_4.isValidRetainer
  L2_4 = L2_4(L2_4)
  if L2_4 then
    L2_4 = desktopWidget
    L2_4 = L2_4.getRetainerName
    L2_4 = L2_4(L2_4)
    if L2_4 ~= nil then
      A0_2:setText("TextBlock_ActorName", 230, L2_4)
    else
      A0_2:setText("TextBlock_ActorName", "???")
    end
    A0_2:setText("TextBlock_ActorName_2", 230, desktopWidget:getPlayerName())
    A0_2.work.playerBagCapacity = worldMaster:_getMyPlayer():_getItemPackageCapacity(1)
    A0_2.work.playerMoneyCapacity = worldMaster:_getMyPlayer():_getItemPackageCapacity(100)
    A0_2.work.retainerBagCapacity = desktopWidget:getRetainerItemPackageCapacity(1)
    A0_2.work.retainerMoneyCapacity = desktopWidget:getRetainerItemPackageCapacity(100)
    A0_2:initChildWidget("ItemDetailWidget", true, false, 600)
    A0_2:setInitialData(A1_3)
    desktopWidget:changeFocusedWidget(A0_2, true)
    A0_2:displaySortType()
  else
    L2_4 = A0_2.setText
    L2_4(A0_2, "TextBlock_ActorName", " ")
  end
  L2_4 = A0_2.work
  L2_4.amActive = true
end
function RetainerTradeWidget.isValidRetainer(A0_5)
  if desktopWidget:isValidRetainer() == false then
    A0_5.work.error = true
    desktopWidget:closeWidgetDirect(A0_5)
    return false
  end
  return true
end
function RetainerTradeWidget.setInitialData(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L5_11 = A0_6
  L6_12 = 1
  L5_11 = "sorttype"
  L2_8(L3_9, L4_10, L5_11)
  L5_11 = A0_6
  L6_12 = 2
  L5_11 = "sorttype"
  L2_8(L3_9, L4_10, L5_11)
  L5_11 = A0_6
  L6_12 = 3
  L5_11 = "sorttype"
  L2_8(L3_9, L4_10, L5_11)
  L5_11 = A0_6
  L6_12 = 4
  L5_11 = "sorttype"
  L2_8(L3_9, L4_10, L5_11)
  L5_11 = A0_6
  L6_12 = 5
  L5_11 = "sorttype"
  L2_8(L3_9, L4_10, L5_11)
  L5_11 = A0_6
  L6_12 = 6
  L5_11 = "sorttype"
  L2_8(L3_9, L4_10, L5_11)
  L5_11 = nil
  L6_12 = 4
  L2_8(L3_9, L4_10, L5_11, L6_12)
  L5_11 = nil
  L6_12 = 1
  L2_8(L3_9, L4_10, L5_11, L6_12)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9)
  for L5_11 = 1, 6 do
    L6_12 = A0_6.getListPropertyName
    L6_12 = L6_12(A0_6, L5_11)
    if A0_6:getListFilteredCount(L6_12) == 0 then
      A0_6:setVisibility("TextBlock_NoContents_" .. tostring(L5_11), true)
    else
      A0_6:setVisibility("TextBlock_NoContents_" .. tostring(L5_11), false)
    end
  end
  L2_8.itemlist = 1
  L2_8(L3_9)
end
function RetainerTradeWidget.processBeforeShow(A0_13, A1_14)
  A0_13:getChildWidgetByWindowName("ItemDetailWidget"):setVisibility("TextBlock_SortStatus", false)
  if A1_14 ~= true and A0_13:isValidRetainer() == false then
    return false
  end
  return true
end
function RetainerTradeWidget.processAfterShow(A0_15, A1_16)
  if A1_16 ~= true and (A0_15.work.error == true or desktopWidget:isValidRetainer() == false) then
    A0_15.work.chosenOperation = 1
    return desktopWidget:closeWidgetDirect(A0_15)
  end
  if A0_15.work.editWidgetMode ~= 0 or A0_15.work.amActive == true then
  end
  return true
end
function RetainerTradeWidget.setDetailPosition(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33
  L2_19 = A0_17
  L1_18 = A0_17.getChildWidgetByWindowName
  L3_20 = "ItemDetailWidget"
  L1_18 = L1_18(L2_19, L3_20)
  if L1_18 ~= nil then
    L3_20 = A0_17
    L2_19 = A0_17.getWindowPosition
    L3_20 = L2_19(L3_20)
    L4_21 = 32
    L5_22 = 32
    L7_24 = A0_17
    L6_23 = A0_17.getWindowSize
    L7_24 = L6_23(L7_24)
    L8_25 = desktopWidget
    L9_26 = L8_25
    L8_25 = L8_25.getWindowSize
    L9_26 = L8_25(L9_26)
    L11_28 = L1_18
    L10_27 = L1_18.getWindowSize
    L11_28 = L10_27(L11_28)
    if L6_23 == 0 then
      L6_23 = 770
    end
    if L7_24 == 0 then
      L7_24 = 329
    end
    if L10_27 == 0 then
      L10_27 = 382
    end
    if L11_28 == 0 then
      L11_28 = 280
    end
    L2_19 = L2_19 + L4_21
    L3_20 = L3_20 + L5_22
    L12_29 = L8_25 * 1
    L13_30 = L9_26 * 0.95
    L14_31 = L3_20 + 20
    L15_32 = L3_20 + 400
    L16_33 = L2_19 + L6_23
    if L12_29 < L16_33 + L10_27 then
      L16_33 = L16_33 - (L16_33 + L10_27 - L12_29)
    end
    if L13_30 < L15_32 then
      L14_31 = L14_31 - (L15_32 - L13_30)
    end
    L1_18:setProperty("Top", L14_31)
    L1_18:setProperty("Left", L16_33)
  end
end
function RetainerTradeWidget.getListPropertyName(A0_34, A1_35)
  local L2_36
  if A1_35 == 1 then
    L2_36 = "TabItem_1_Maker"
    return L2_36
  elseif A1_35 == 2 then
    L2_36 = "TabItem_2_Maker"
    return L2_36
  elseif A1_35 == 3 then
    L2_36 = "TabItem_3_Maker"
    return L2_36
  elseif A1_35 == 4 then
    L2_36 = "TabItem_4_Maker"
    return L2_36
  elseif A1_35 == 5 then
    L2_36 = "TabItem_5_Maker"
    return L2_36
  elseif A1_35 == 6 then
    L2_36 = "TabItem_6_Maker"
    return L2_36
  elseif A1_35 == 8 then
    L2_36 = "SlotItem_Maker"
    return L2_36
  end
end
function RetainerTradeWidget.setButtonEvents(A0_37, A1_38)
  local L2_39
  L2_39 = A0_37.getControlProperty
  L2_39 = L2_39(A0_37, A1_38, "Command")
  A0_37:setControlCommandCondition(A1_38, L2_39)
  A0_37:setControlCommandCondition(A1_38, "UILuaCommands.ButtonFocused")
end
function RetainerTradeWidget.cancelDetailEdit(A0_40)
  if A0_40.work.closeok == true and A0_40.work.editWidgetMode ~= 0 then
    if A0_40:getChildWidgetByWindowName("ItemDetailWidget") ~= nil then
      A0_40:getChildWidgetByWindowName("ItemDetailWidget"):setModal(false)
      A0_40:getChildWidgetByWindowName("ItemDetailWidget"):setVisibility("Grid_Edit", false)
      desktopWidget:changeFocusedWidget(A0_40, true)
    end
    A0_40.work.editWidgetMode = 0
    A0_40.work.closeok = false
  end
end
function RetainerTradeWidget.displayItemList(A0_41, A1_42)
  local L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50
  L3_44 = A0_41
  L2_43 = A0_41.getListBoxName
  L4_45 = A1_42
  L2_43 = L2_43(L3_44, L4_45)
  L4_45 = A0_41
  L3_44 = A0_41.getListPropertyName
  L5_46 = A1_42
  L3_44 = L3_44(L4_45, L5_46)
  L4_45 = "TextBlock_NoContents_"
  L5_46 = tostring
  L6_47 = A1_42
  L5_46 = L5_46(L6_47)
  L4_45 = L4_45 .. L5_46
  L6_47 = A0_41
  L5_46 = A0_41.getListFilteredCount
  L7_48 = L3_44
  L5_46 = L5_46(L6_47, L7_48)
  if L5_46 > 0 then
    L7_48 = A0_41
    L6_47 = A0_41.setVisibility
    L8_49 = L2_43
    L9_50 = true
    L6_47(L7_48, L8_49, L9_50)
    L7_48 = A0_41
    L6_47 = A0_41.setVisibility
    L8_49 = L4_45
    L9_50 = false
    L6_47(L7_48, L8_49, L9_50)
  else
    L7_48 = A0_41
    L6_47 = A0_41.setVisibility
    L8_49 = L4_45
    L9_50 = true
    L6_47(L7_48, L8_49, L9_50)
  end
  L6_47 = A0_41.work
  L6_47 = L6_47.itemlist
  if A1_42 == L6_47 then
    if L5_46 > 0 then
      L7_48 = A0_41
      L6_47 = A0_41.getControlProperty
      L8_49 = L2_43
      L9_50 = "MouseEnteredIndex"
      L6_47 = L6_47(L7_48, L8_49, L9_50)
      L8_49 = A0_41
      L7_48 = A0_41.filteredIndexToIndex
      L9_50 = L3_44
      L7_48 = L7_48(L8_49, L9_50, L6_47)
      L9_50 = A0_41
      L8_49 = A0_41.getFocusedIndex
      L8_49 = L8_49(L9_50, L2_43)
      L9_50 = A0_41.filteredIndexToIndex
      L9_50 = L9_50(A0_41, L3_44, L8_49)
      if L6_47 >= 0 and L5_46 > L6_47 then
        if L7_48 ~= L9_50 then
          A0_41:setWindowFocus(L2_43)
          A0_41:setFocusedIndex(L2_43, L6_47)
          L9_50 = L7_48
        end
      elseif L8_49 < 0 or L5_46 <= L8_49 then
        L8_49 = A0_41:getAnchoredIndex(L2_43)
        L9_50 = A0_41:filteredIndexToIndex(L3_44, L8_49)
        if L8_49 < 0 or L5_46 <= L8_49 then
          L9_50 = 0
        end
      end
      A0_41.work.itemListFocus = L9_50
    else
      L6_47 = A0_41.work
      L6_47.itemListFocus = 0
    end
    L7_48 = A0_41
    L6_47 = A0_41.displayFocusedItemHelp
    L6_47(L7_48)
  end
end
function RetainerTradeWidget.setWindowFocus(A0_51, A1_52)
  A0_51:setLogicalFocus(A1_52)
  if desktopWidget:_getKeyboardFocusedWidget() == A0_51 then
    A0_51:setKeyboardFocusedControl(A1_52)
  end
end
function RetainerTradeWidget.displayBagcapacityAndMoney(A0_53)
  A0_53:setText("TextBlock_Gil", 3263, A0_53.work.retainerMoneyCount)
  A0_53:setText("TextBlock_ItemStack_2", 3551, A0_53:getListBoxItemNum(1), A0_53.work.retainerBagCapacity)
  A0_53:setText("TextBlock_Gil_2", 3263, A0_53.work.playerMoneyCount)
  A0_53:setText("TextBlock_ItemStack_4", 3551, A0_53:getListBoxItemNum(4), A0_53.work.playerBagCapacity)
end
function RetainerTradeWidget.getListBoxName(A0_54, A1_55)
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
  elseif A1_55 == 6 then
    L2_56 = "ListBox_TabItem_6"
    return L2_56
  end
  L2_56 = nil
  return L2_56
end
function RetainerTradeWidget.getListBoxItemNum(A0_57, A1_58)
  local L2_59, L3_60
  L3_60 = A0_57
  L2_59 = A0_57.getListPropertyCount
  return L2_59(L3_60, A0_57:getListPropertyName(A1_58))
end
function RetainerTradeWidget.filteredIndexToIndex(A0_61, A1_62, A2_63)
  if A2_63 < 0 or A0_61:getListFilteredCount(A1_62) <= 0 or A2_63 >= A0_61:getListFilteredCount(A1_62) then
    return -1
  else
    A0_61:setControlProperty(A1_62, "FilteredIndex", A2_63)
    return A0_61:getControlProperty(A1_62, "Index")
  end
end
function RetainerTradeWidget.getListBoxOwner(A0_64, A1_65)
  if A0_64:isListBoxOwnerRetainer(A1_65) then
    return 4
  end
  return 1
end
function RetainerTradeWidget.isListBoxOwnerRetainer(A0_66, A1_67)
  local L2_68
  L2_68 = A1_67 < 4
  return L2_68
end
function RetainerTradeWidget.isMoneyList(A0_69, A1_70)
  local L2_71
  L2_71 = A1_70 == 3 or A1_70 == 6
  return L2_71
end
function RetainerTradeWidget.initListBox(A0_72, A1_73)
  local L2_74, L3_75
  L3_75 = A0_72
  L2_74 = A0_72.getListBoxName
  L2_74 = L2_74(L3_75, A1_73)
  if L2_74 ~= "" then
    L3_75 = A0_72.setControlProperty
    L3_75(A0_72, L2_74, "IntData.Value0", A1_73)
    L3_75 = A0_72.setControlCommandCondition
    L3_75(A0_72, L2_74, "UILuaCommands.MouseEnteredItem")
    L3_75 = A0_72.setControlCommandCondition
    L3_75(A0_72, L2_74, "UILuaCommands.AnchoredItem")
    L3_75 = A0_72.setControlCommandCondition
    L3_75(A0_72, L2_74, "UILuaCommands.Selection")
    L3_75 = A0_72.setCancelCondition
    L3_75(A0_72, L2_74)
    L3_75 = A0_72.setVisibility
    L3_75(A0_72, L2_74, true)
    L3_75 = "TextBlock_NoContents_"
    L3_75 = L3_75 .. tostring(A1_73)
    A0_72:setVisibility(L3_75, false)
    A0_72:setControlProperty(L3_75, "IsTabStop", true)
    A0_72:setControlCommandCondition(L3_75, "UILuaCommands.GotAnchor")
    A0_72:setCancelCondition(L3_75)
    A0_72:setText(L3_75, 3140)
  end
end
function RetainerTradeWidget.resetListBox(A0_76, A1_77)
  local L2_78, L3_79
  L3_79 = A0_76
  L2_78 = A0_76.getListBoxItemNum
  L2_78 = L2_78(L3_79, A1_77)
  L3_79 = A0_76.getListPropertyName
  L3_79 = L3_79(A0_76, A1_77)
  if L2_78 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_78 do
      L2_78 = L2_78 - 1
      A0_76:deleteListProperty(L3_79, L2_78)
    end
    A0_76:updateListProperty(L3_79)
  end
  return
end
function RetainerTradeWidget.getPackageFromList(A0_80, A1_81)
  local L2_82
  L2_82 = 1
  if A1_81 == 1 then
    L2_82 = 1
  elseif A1_81 == 2 then
    L2_82 = 100
  elseif A1_81 == 3 then
    L2_82 = 100
  elseif A1_81 == 4 then
    L2_82 = 1
  elseif A1_81 == 5 then
    L2_82 = 100
  elseif A1_81 == 6 then
    L2_82 = 100
  end
  return L2_82
end
function RetainerTradeWidget.setItemToXml(A0_83, A1_84, A2_85, A3_86, A4_87, A5_88)
  local L6_89, L7_90, L8_91, L9_92, L10_93, L11_94, L12_95, L13_96, L14_97, L15_98, L16_99, L17_100, L18_101, L19_102
  L7_90 = A0_83
  L6_89 = A0_83.getListPropertyName
  L8_91 = A1_84
  L6_89 = L6_89(L7_90, L8_91)
  L7_90, L8_91, L9_92, L10_93, L11_94, L12_95, L13_96 = nil, nil, nil, nil, nil, nil, nil
  L14_97 = false
  if A5_88 == 4 then
    if A3_86 > 0 and A4_87 > 0 then
      L15_98 = desktopWidget
      L16_99 = L15_98
      L15_98 = L15_98.getRetainerItem
      L17_100 = A3_86
      L18_101 = A4_87
      L15_98 = L15_98(L16_99, L17_100, L18_101)
      L12_95 = L15_98
    end
  elseif A3_86 > 0 and A4_87 > 0 then
    L15_98 = worldMaster
    L16_99 = L15_98
    L15_98 = L15_98._getMyPlayer
    L15_98 = L15_98(L16_99)
    L17_100 = L15_98
    L16_99 = L15_98._getItem
    L18_101 = A3_86
    L19_102 = A4_87
    L16_99 = L16_99(L17_100, L18_101, L19_102)
    L12_95 = L16_99
  end
  if L12_95 ~= nil then
    L16_99 = L12_95
    L15_98 = L12_95._isAlive
    L15_98 = L15_98(L16_99)
  elseif L15_98 == false then
    L15_98 = false
    return L15_98
  end
  L16_99 = L12_95
  L15_98 = L12_95._getCatalogID
  L15_98 = L15_98(L16_99)
  L7_90 = L15_98
  L16_99 = L12_95
  L15_98 = L12_95.getItemIcon
  L15_98 = L15_98(L16_99)
  L8_91 = L15_98
  L16_99 = L12_95
  L15_98 = L12_95._isStackable
  L15_98 = L15_98(L16_99)
  L9_92 = L15_98
  L16_99 = L12_95
  L15_98 = L12_95._countStack
  L15_98 = L15_98(L16_99)
  L10_93 = L15_98
  L16_99 = L12_95
  L15_98 = L12_95._getNameIndex
  L15_98 = L15_98(L16_99)
  L11_94 = L15_98
  L16_99 = L12_95
  L15_98 = L12_95.isEquipment
  L15_98 = L15_98(L16_99)
  if L15_98 == true and (A5_88 == 1 or A5_88 == nil) then
    L16_99 = L12_95
    L15_98 = L12_95._isEquipping
    L15_98 = L15_98(L16_99)
    if L15_98 then
      L14_97 = true
    end
  end
  if L7_90 == 1000001 then
    L15_98 = A0_83.work
    L15_98.moneyIndex = A4_87
    L15_98 = A0_83.work
    L15_98.moneyCount = L10_93
  end
  L15_98 = "TBL_null"
  if L14_97 then
    L15_98 = "TBL_equippedItem"
  end
  L16_99 = A0_83.work
  L16_99 = L16_99.sorttype
  L17_100 = 23
  if A1_84 == 1 or A1_84 == 4 then
  elseif A1_84 == 2 or A1_84 == 5 then
    L16_99 = 11
    L17_100 = 24
  elseif A1_84 == 3 or A1_84 == 6 then
    L16_99 = 12
    L17_100 = 25
  end
  L18_101 = 1
  L19_102 = L12_95._isDealing
  L19_102 = L19_102(L12_95)
  if L19_102 ~= true then
    L19_102 = L12_95._isAttached
    L19_102 = L19_102(L12_95)
    if L19_102 ~= true then
      L19_102 = L12_95._isEquipping
      L19_102 = L19_102(L12_95)
    end
  elseif L19_102 == true then
    L18_101 = 0
  end
  L19_102 = desktopWidget
  L19_102 = L19_102.isGuildPoint
  L19_102 = L19_102(L19_102, L7_90)
  if L19_102 then
    L18_101 = 0
  end
  L19_102 = true
  if L17_100 == 25 then
    if desktopWidget:isGuildPoint(L7_90) then
      L18_101 = 0
    elseif not desktopWidget:isGil(L7_90) then
      L19_102 = false
    end
  elseif desktopWidget:isGil(L7_90) or desktopWidget:isGuildPoint(L7_90) then
    L19_102 = false
  end
  A0_83:setListProperty(L6_89, A2_85, "canTrade", L18_101)
  A0_83:setListPropertyVisibility(L6_89, A2_85, L19_102)
  if not L19_102 then
    return true
  end
  desktopWidget:setItemToXml(A0_83, L6_89, A2_85, L12_95, L15_98, L7_90, L8_91, L9_92, L10_93, L11_94, L16_99, true, false, L17_100, A3_86, A4_87, A5_88, false)
  return true
end
function RetainerTradeWidget.setSortType(A0_103, A1_104, A2_105, A3_106, A4_107)
  local L5_108
  if A1_104 == 1 then
    L5_108 = desktopWidget:getRetainerItem(A4_107, A3_106 + 1)
  else
    L5_108 = worldMaster:_getMyPlayer():_getItem(A4_107, A3_106 + 1)
  end
  if L5_108 == nil or not L5_108:_isAlive() then
    return false
  end
  desktopWidget:setSortType(A0_103, A2_105, A3_106, A0_103.work.sorttype, L5_108)
end
function RetainerTradeWidget.updateSortType(A0_109)
  local L1_110, L2_111, L3_112, L4_113
  L2_111 = A0_109
  L1_110 = A0_109.getListPropertyName
  L1_110 = L1_110(L2_111, L3_112)
  L2_111 = A0_109.getPackageFromList
  L2_111 = L2_111(L3_112, L4_113)
  for _FORV_6_ = 1, L4_113(A0_109, 1) do
    A0_109:setSortType(1, L1_110, _FORV_6_ - 1, L2_111)
  end
  L3_112(L4_113, L1_110)
  for _FORV_8_ = 1, A0_109:getListBoxItemNum(4) do
    A0_109:setSortType(4, L3_112, _FORV_8_ - 1, L4_113)
  end
  A0_109:updateListProperty(L3_112)
end
function RetainerTradeWidget.displaySortType(A0_114)
  desktopWidget:displaySortType(A0_114.work.sorttype, A0_114, "Button_SortStatus")
  A0_114:setVisibility("Button_SortStatus", true)
end
function RetainerTradeWidget.makeListFromPackage(A0_115, A1_116, A2_117, A3_118)
  local L4_119, L5_120, L6_121, L7_122, L8_123, L9_124, L10_125, L11_126, L12_127
  if A2_117 == nil then
    L4_119 = 0
    L5_120, L6_121, L7_122 = nil, nil, nil
    L8_123 = 0
    if A1_116 == nil or A1_116 == 1 then
      if A3_118 == 4 then
        if L9_124 == 0 then
          L12_127 = 1
          L9_124.retainerBagCapacity = L10_125
          L12_127 = A0_115
          L12_127 = "SourceCount"
          L9_124(L10_125, L11_126, L12_127, A0_115.work.retainerBagCapacity)
        end
        L4_119 = L9_124.retainerBagCapacity
        L5_120 = 1
      else
        if L9_124 == 0 then
          L12_127 = L9_124
          L10_125.playerBagCapacity = L11_126
          L12_127 = A0_115.getListBoxName
          L12_127 = L12_127(A0_115, 4)
          L10_125(L11_126, L12_127, "SourceCount", A0_115.work.playerBagCapacity)
        end
        L4_119 = L9_124.playerBagCapacity
        L5_120 = 4
      end
      L6_121 = L9_124
      L7_122 = L9_124
      for L12_127 = 1, L4_119 do
        if A0_115:setItemToXml(L5_120, L8_123, 1, L12_127, A3_118) == true then
          L8_123 = L8_123 + 1
        else
          break
        end
      end
      if L7_122 > L8_123 then
        for L12_127 = L8_123, L7_122 - 1 do
          L7_122 = L7_122 - 1
          A0_115:deleteListProperty(L6_121, L7_122)
        end
      end
      L9_124(L10_125, L11_126)
    end
    if A1_116 == nil or A1_116 == 100 then
      L9_124.moneyIndex = 0
      L9_124.moneyCount = 0
      if A3_118 == 4 then
        if L9_124 == 0 then
          L12_127 = 100
          L9_124.retainerMoneyCapacity = L10_125
          L12_127 = A0_115
          L12_127 = "SourceCount"
          L9_124(L10_125, L11_126, L12_127, A0_115.work.retainerMoneyCapacity)
        end
        L4_119 = L9_124.retainerMoneyCapacity
        L5_120 = 2
      else
        if L9_124 == 0 then
          L12_127 = L9_124
          L10_125.playerMoneyCapacity = L11_126
          L12_127 = A0_115.getListBoxName
          L12_127 = L12_127(A0_115, 5)
          L10_125(L11_126, L12_127, "SourceCount", A0_115.work.playerMoneyCapacity)
        end
        L4_119 = L9_124.playerMoneyCapacity
        L5_120 = 5
      end
      L8_123 = 0
      L7_122 = L9_124
      L6_121 = L9_124
      for L12_127 = 1, L4_119 do
        if A0_115:setItemToXml(L5_120, L8_123, 100, L12_127, A3_118) == true then
          L8_123 = L8_123 + 1
        else
          break
        end
      end
      if L7_122 > L8_123 then
        for L12_127 = L8_123, L7_122 - 1 do
          L7_122 = L7_122 - 1
          A0_115:deleteListProperty(L6_121, L7_122)
        end
      end
      L9_124(L10_125, L11_126)
      if A3_118 == 4 then
        L9_124.retainerMoneyIndex = L10_125
        L9_124.retainerMoneyCount = L10_125
      else
        L9_124.playerMoneyIndex = L10_125
        L9_124.playerMoneyCount = L10_125
      end
    end
  else
    L4_119 = 0
    L5_120 = nil
    if A3_118 == 4 then
      if A1_116 == 1 then
        L4_119 = 1
      elseif A1_116 == 100 then
        L4_119 = 2
      else
        L6_121 = false
        return L6_121
      end
      L6_121 = desktopWidget
      L7_122 = L6_121
      L6_121 = L6_121.getRetainerItem
      L8_123 = A1_116
      L6_121 = L6_121(L7_122, L8_123, L9_124)
      L5_120 = L6_121
    else
      if A1_116 == 1 then
        L4_119 = 4
      elseif A1_116 == 100 then
        L4_119 = 5
      else
        L6_121 = false
        return L6_121
      end
      L6_121 = worldMaster
      L7_122 = L6_121
      L6_121 = L6_121._getMyPlayer
      L6_121 = L6_121(L7_122)
      L8_123 = L6_121
      L7_122 = L6_121._getItem
      L7_122 = L7_122(L8_123, L9_124, L10_125)
      L5_120 = L7_122
    end
    L7_122 = A0_115
    L6_121 = A0_115.getListPropertyName
    L8_123 = L4_119
    L6_121 = L6_121(L7_122, L8_123)
    if L5_120 ~= nil then
      L8_123 = A0_115
      L7_122 = A0_115.setItemToXml
      L12_127 = A2_117
      L7_122(L8_123, L9_124, L10_125, L11_126, L12_127, A3_118)
    else
      L8_123 = A0_115
      L7_122 = A0_115.getListBoxItemNum
      L7_122 = L7_122(L8_123, L9_124)
      L8_123 = L7_122 - 1
      if L8_123 >= 0 and A2_117 <= L7_122 then
        L8_123 = A0_115.deleteListProperty
        L8_123(L9_124, L10_125, L11_126)
      end
      L8_123 = A0_115.updateListProperty
      L8_123(L9_124, L10_125)
    end
  end
end
function RetainerTradeWidget.makeMoneyList(A0_128, A1_129)
  local L2_130, L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137, L10_138
  L2_130 = 0
  L3_131, L4_132, L5_133 = nil, nil, nil
  L6_134 = 0
  L7_135.moneyIndex = 0
  L7_135.moneyCount = 0
  if A1_129 == 4 then
    if L7_135 == 0 then
      L10_138 = 100
      L7_135.retainerMoneyCapacity = L8_136
      if L7_135 > 0 then
        L10_138 = A0_128
        L10_138 = "SourceCount"
        L7_135(L8_136, L9_137, L10_138, A0_128.work.retainerMoneyCapacity)
      end
    end
    L2_130 = L7_135.retainerMoneyCapacity
    L3_131 = 3
  else
    if L7_135 == 0 then
      L10_138 = L7_135
      L8_136.playerMoneyCapacity = L9_137
      L10_138 = A0_128.getListBoxName
      L10_138 = L10_138(A0_128, 6)
      L8_136(L9_137, L10_138, "SourceCount", A0_128.work.playerMoneyCapacity)
    end
    L2_130 = L7_135.playerMoneyCapacity
    L3_131 = 6
  end
  L6_134 = 0
  L5_133 = L7_135
  L4_132 = L7_135
  for L10_138 = 1, L2_130 do
    if A0_128:setItemToXml(L3_131, L6_134, 100, L10_138, A1_129) == true then
      L6_134 = L6_134 + 1
    else
      break
    end
  end
  if L5_133 > L6_134 then
    for L10_138 = L6_134, L5_133 - 1 do
      L5_133 = L5_133 - 1
      A0_128:deleteListProperty(L4_132, L5_133)
    end
  end
  L7_135(L8_136, L9_137)
  if A1_129 == 4 then
    L7_135.retainerMoneyIndex = L8_136
    L7_135.retainerMoneyCount = L8_136
  else
    L7_135.playerMoneyIndex = L8_136
    L7_135.playerMoneyCount = L8_136
  end
  if L7_135 > 0 then
    if A1_129 == 4 then
      L10_138 = A0_128
      L10_138 = true
      L7_135(L8_136, L9_137, L10_138)
      L10_138 = false
      L7_135(L8_136, L9_137, L10_138)
      L10_138 = A0_128
      L10_138 = "SourceCount"
      L7_135(L8_136, L9_137, L10_138, A0_128:getListBoxItemNum(L3_131))
    end
  elseif A1_129 == 4 then
    L10_138 = true
    L7_135(L8_136, L9_137, L10_138)
  end
end
function RetainerTradeWidget.copyItem(A0_139)
  local L1_140
  if A0_139.work.chosenOwner == 4 then
    L1_140 = desktopWidget:getRetainerItem(A0_139.work.chosenPackage, A0_139.work.chosenItem)
  else
    L1_140 = worldMaster:_getMyPlayer():_getItem(A0_139.work.chosenPackage, A0_139.work.chosenItem)
  end
  if L1_140 == nil or L1_140:_isAlive() == false then
    return
  end
  A0_139.work.bakcatalog = L1_140:_getCatalogID()
  A0_139.work.bakquality = L1_140:_getNameIndex()
  A0_139.work.bakstack = L1_140:_countStack()
  A0_139.work.bakrare = L1_140:isRareItem()
  A0_139.work.bakex = L1_140:isExclusiveItem()
  A0_139.work.bakowner = A0_139.work.chosenOwner
end
function RetainerTradeWidget.isSameItem(A0_141, A1_142, A2_143, A3_144)
  local L4_145
  if A3_144 == 4 then
    L4_145 = desktopWidget:getRetainerItem(A1_142, A2_143)
  else
    L4_145 = worldMaster:_getMyPlayer():_getItem(A1_142, A2_143)
  end
  if L4_145 == nil or L4_145:_isAlive() == false then
    return false
  end
  if A0_141.work.bakcatalog ~= L4_145:_getCatalogID() then
    return false
  end
  if A0_141.work.bakquality ~= L4_145:_getNameIndex() then
    return false
  end
  if A0_141.work.bakrare ~= L4_145:isRareItem() then
    return false
  end
  if A0_141.work.bakex ~= L4_145:isExclusiveItem() then
    return false
  end
  if A0_141.work.bakstack ~= L4_145:_countStack() then
    return false
  end
  if A0_141.work.bakowner ~= A3_144 then
    return false
  end
  return true
end
function RetainerTradeWidget.getItemLifeParam(A0_146, A1_147, A2_148, A3_149)
  local L4_150, L5_151, L6_152, L7_153, L8_154, L9_155, L10_156, L11_157
  L4_150 = -1
  L5_151 = false
  L6_152 = false
  L7_153 = "TBL_parameterDanger"
  L8_154 = nil
  L9_155 = 1
  L10_156 = 1
  if A1_147 ~= nil then
    L11_157 = A1_147.isRepairable
    L11_157 = L11_157(A1_147)
    L8_154 = L11_157
  else
    L11_157 = A0_146.getListProperty
    L11_157 = L11_157(A0_146, A2_148, A3_149, "repairable")
    L8_154 = L11_157
  end
  if L8_154 == true or L8_154 == 1 then
    if A1_147 ~= nil then
      L11_157 = A1_147.getItemLife
      L11_157 = L11_157(A1_147)
      L9_155 = L11_157
      L11_157 = A1_147.getItemLifeMax
      L11_157 = L11_157(A1_147)
      L10_156 = L11_157
    else
      L11_157 = A0_146.getListProperty
      L11_157 = L11_157(A0_146, A2_148, A3_149, "itemlife")
      L9_155 = L11_157
      L11_157 = A0_146.getListProperty
      L11_157 = L11_157(A0_146, A2_148, A3_149, "lifemax")
      L10_156 = L11_157
    end
    L11_157 = _math
    L11_157 = L11_157.floor
    L11_157 = L11_157(L9_155 * 100 / L10_156)
    L4_150 = L11_157
    if L4_150 == 0 and L9_155 > 1 then
      L4_150 = 1
    end
    if L4_150 > 100 then
      L4_150 = 100
    end
  end
  L11_157 = 0
  if L4_150 == 100 then
    L11_157 = 514
  elseif L4_150 > 80 then
    L11_157 = 513
  elseif L4_150 > 60 then
    L11_157 = 460
  elseif L4_150 > 40 then
    L11_157 = 459
  elseif L4_150 > 20 then
    L11_157 = 458
  elseif L9_155 > 1 then
    L11_157 = 457
  else
    L11_157 = 515
  end
  if L4_150 < 0 then
    L5_151 = false
    L6_152 = false
    L7_153 = "TBL_null"
  elseif L4_150 < 20 then
    L5_151 = false
    L6_152 = true
    L7_153 = "TBL_parameterDanger"
  elseif L4_150 < 35 then
    L5_151 = true
    L6_152 = false
    L7_153 = "TBL_parameterCaution"
  elseif L4_150 < 100 then
    L5_151 = false
    L6_152 = false
    L7_153 = "TBL_null"
  else
    L5_151 = false
    L6_152 = false
    L7_153 = "TBL_parameterPlus"
  end
  return L4_150, L11_157, L5_151, L6_152, L7_153
end
function RetainerTradeWidget.canTransfer(A0_158, A1_159, A2_160, A3_161, A4_162)
  local L5_163, L6_164, L7_165, L8_166, L9_167
  L5_163 = worldMaster
  L6_164 = L5_163
  L5_163 = L5_163._getMyPlayer
  L5_163 = L5_163(L6_164)
  if A1_159 == 1 then
    if A4_162 == 4 then
      L7_165 = L5_163
      L6_164 = L5_163._getItemPackageFreeSpace
      L8_166 = A1_159
      L6_164 = L6_164(L7_165, L8_166)
      if L6_164 ~= 0 then
        L6_164 = true
        return L6_164
      else
        L6_164 = false
        return L6_164
      end
    else
      L6_164 = desktopWidget
      L7_165 = L6_164
      L6_164 = L6_164.getRetainerItem
      L8_166 = 1
      L9_167 = A0_158.work
      L9_167 = L9_167.retainerBagCapacity
      L6_164 = L6_164(L7_165, L8_166, L9_167)
      if L6_164 == nil then
        L6_164 = true
        return L6_164
      else
        L6_164 = false
        return L6_164
      end
    end
  elseif A1_159 == 100 then
    if A4_162 == 4 then
      L7_165 = A0_158
      L6_164 = A0_158.getListPropertyName
      L8_166 = 2
      L6_164 = L6_164(L7_165, L8_166)
      L8_166 = A0_158
      L7_165 = A0_158.getListProperty
      L9_167 = L6_164
      L7_165 = L7_165(L8_166, L9_167, A2_160 - 1, "catalog")
      L9_167 = A0_158
      L8_166 = A0_158.getListProperty
      L8_166 = L8_166(L9_167, L6_164, A2_160 - 1, "stackMax")
      L9_167 = 0
      L6_164 = A0_158:getListPropertyName(5)
      for _FORV_13_ = 1, A0_158:getListBoxItemNum(5) do
        if A0_158:getListProperty(L6_164, _FORV_13_ - 1, "catalog") == L7_165 then
          L9_167 = A0_158:getListProperty(L6_164, _FORV_13_ - 1, "stackCount")
        end
      end
      if A3_161 <= _FOR_ then
        return true
      else
        return false
      end
    else
      L7_165 = A0_158
      L6_164 = A0_158.getListPropertyName
      L8_166 = 5
      L6_164 = L6_164(L7_165, L8_166)
      L8_166 = A0_158
      L7_165 = A0_158.getListProperty
      L9_167 = L6_164
      L7_165 = L7_165(L8_166, L9_167, A2_160 - 1, "catalog")
      L9_167 = A0_158
      L8_166 = A0_158.getListProperty
      L8_166 = L8_166(L9_167, L6_164, A2_160 - 1, "stackMax")
      L9_167 = 0
      L6_164 = A0_158:getListPropertyName(2)
      for _FORV_13_ = 1, A0_158:getListBoxItemNum(2) do
        if A0_158:getListProperty(L6_164, _FORV_13_ - 1, "catalog") == L7_165 then
          L9_167 = A0_158:getListProperty(L6_164, _FORV_13_ - 1, "stackCount")
        end
      end
      if A3_161 <= _FOR_ then
        return true
      else
        return false
      end
    end
  end
end
function RetainerTradeWidget.displayFocusedItemHelp(A0_168)
  local L1_169, L2_170, L3_171, L4_172, L5_173, L6_174, L7_175, L8_176
  L1_169 = A0_168.work
  L1_169 = L1_169.updatecount
  if not (L1_169 > 0) then
    L1_169 = A0_168.work
    L1_169 = L1_169.updatecountbaz
  elseif L1_169 > 0 then
    L1_169 = false
    return L1_169
  end
  L1_169 = A0_168.work
  L1_169 = L1_169.editWidgetMode
  if L1_169 ~= 0 then
    L1_169 = false
    return L1_169
  end
  L1_169 = A0_168.work
  L1_169 = L1_169.itemlist
  L3_171 = A0_168
  L2_170 = A0_168.getListBoxName
  L4_172 = L1_169
  L2_170 = L2_170(L3_171, L4_172)
  L4_172 = A0_168
  L3_171 = A0_168.getListPropertyName
  L5_173 = L1_169
  L3_171 = L3_171(L4_172, L5_173)
  L5_173 = A0_168
  L4_172 = A0_168.getPackageFromList
  L6_174 = L1_169
  L4_172 = L4_172(L5_173, L6_174)
  L6_174 = A0_168
  L5_173 = A0_168.getListBoxOwner
  L7_175 = L1_169
  L5_173 = L5_173(L6_174, L7_175)
  L7_175 = A0_168
  L6_174 = A0_168.getChildWidgetByWindowName
  L8_176 = "ItemDetailWidget"
  L6_174 = L6_174(L7_175, L8_176)
  L7_175 = A0_168.work
  L7_175 = L7_175.itemListFocus
  L7_175 = L7_175 + 1
  if not L6_174 then
    return
  end
  L8_176 = A0_168.setDetailPosition
  L8_176(A0_168)
  L8_176 = A0_168.getListFilteredCount
  L8_176 = L8_176(A0_168, L3_171)
  if L8_176 == 0 then
    L8_176 = L6_174.displayEmpty
    L8_176(L6_174, L5_173)
    L8_176 = L6_174.show
    L8_176(L6_174)
    return
  end
  L8_176 = nil
  if L4_172 == 0 or L7_175 == 0 then
    return
  end
  if L5_173 == 1 then
    L8_176 = worldMaster:_getMyPlayer():_getItem(L4_172, L7_175)
  else
    L8_176 = desktopWidget:getRetainerItem(L4_172, L7_175)
  end
  if L8_176 ~= nil and L8_176:_isAlive() == true then
    L6_174:displayItemHelp(L8_176, L4_172, L7_175, L5_173)
    L6_174:show()
  end
end
function RetainerTradeWidget.previousSequence(A0_177)
  A0_177:saveSortType()
  A0_177:closeWidgets()
  A0_177.work.chosenOperation = 1
end
function RetainerTradeWidget.processUICommandOperate(A0_178, A1_179, A2_180, A3_181, A4_182)
  A0_178:changeSortType()
  A0_178:updateSortType()
  A0_178:displaySortType()
end
function RetainerTradeWidget.processUICommandClose(A0_183, A1_184, A2_185, A3_186, A4_187)
  if A0_183.work.error == true or desktopWidget:isValidRetainer() == false then
    A0_183.work.chosenOperation = 1
    return desktopWidget:closeWidgetDirect(A0_183)
  end
  A0_183:previousSequence()
  return
end
function RetainerTradeWidget.processUICommandCancel(A0_188, A1_189, A2_190, A3_191, A4_192)
  A0_188:previousSequence()
end
function RetainerTradeWidget.processUICommandSelection(A0_193, A1_194, A2_195, A3_196, A4_197)
  local L5_198, L6_199, L7_200, L8_201, L9_202
  L5_198 = A4_197
  L6_199 = A3_196
  L8_201 = A0_193
  L7_200 = A0_193.canOperate
  L7_200 = L7_200(L8_201)
  if L7_200 == false then
    L8_201 = A0_193
    L7_200 = A0_193.setSelectedIndex
    L9_202 = A2_195
    L7_200(L8_201, L9_202)
    return
  end
  L8_201 = A0_193
  L7_200 = A0_193.getListBoxOwner
  L9_202 = L5_198
  L7_200 = L7_200(L8_201, L9_202)
  L8_201 = false
  if L7_200 == 1 then
    L9_202 = A0_193.work
    L9_202 = L9_202.waitplayerupdate
    if L9_202 then
      L8_201 = true
    else
      L9_202 = A0_193.work
      L9_202 = L9_202.waitretainerupdate
      if L9_202 and (L5_198 == 4 or L5_198 == 5) then
        L8_201 = true
      end
    end
  elseif L7_200 == 4 then
    L9_202 = A0_193.work
    L9_202 = L9_202.waitretainerupdate
    if L9_202 then
      L8_201 = true
    else
      L9_202 = A0_193.work
      L9_202 = L9_202.waitplayerupdate
      if L9_202 and (L5_198 == 2 or L5_198 == 3) then
        L8_201 = true
      end
    end
  end
  if L8_201 then
    L9_202 = A0_193.setSelectedIndex
    L9_202(A0_193, A2_195)
    return
  end
  L9_202 = A0_193.getListPropertyName
  L9_202 = L9_202(A0_193, L5_198)
  L6_199 = A0_193:filteredIndexToIndex(L9_202, L6_199)
  A0_193.work.itemlist = L5_198
  A0_193.work.chosenPackage = A0_193:getPackageFromList(L5_198)
  A0_193.work.chosenItem = L6_199 + 1
  A0_193.work.chosenOwner = L7_200
  A0_193.work.itemListFocus = L6_199
  A0_193:displayFocusedItemHelp()
  if A0_193:getListProperty(L9_202, L6_199, "canTrade") == 1 then
    A0_193.work.editmoney = false
    if A0_193:isMoneyList(A0_193.work.itemlist) then
      if A0_193:editItemCount(true, A0_193.work.chosenOwner) == true then
        A0_193.work.editWidgetMode = 2
        A0_193:copyItem()
        A0_193:selectedBorder(L6_199, true)
        A0_193.work.editmoney = true
      end
    elseif A0_193:getListProperty(L9_202, L6_199, "stackCount") == 1 then
      A0_193:setItemCount(1, A0_193.work.chosenOwner)
    elseif A0_193:editItemCount(false, A0_193.work.chosenOwner) == true then
      A0_193.work.editWidgetMode = 1
      A0_193:copyItem()
      A0_193:selectedBorder(L6_199, true)
    end
  end
  if A0_193.work.editWidgetMode == 0 then
    A0_193:setSelectedIndex(A2_195)
  end
end
function RetainerTradeWidget.processUICommandDefault(A0_203, A1_204, A2_205, A3_206, A4_207, A5_208)
  local L6_209, L7_210, L8_211, L9_212, L10_213, L11_214
  L7_210 = A0_203
  L6_209 = A0_203.getInputEnable
  L6_209 = L6_209(L7_210)
  if not L6_209 then
    return
  end
  L7_210 = A0_203
  L6_209 = A0_203.canOperate
  L6_209 = L6_209(L7_210)
  L7_210 = A3_206
  if L7_210 == "UILuaCommands.MouseEnteredItem" then
  else
  end
  if L7_210 == "UILuaCommands.AnchoredItem" then
    if A5_208 == nil then
      return
    end
    if A4_207 == nil or A4_207 < 0 then
      return
    end
    L11_214 = A0_203
    L11_214 = A0_203.filteredIndexToIndex
    L11_214 = L11_214(A0_203, L10_213, L9_212)
    A0_203.work.itemlist = L8_211
    A0_203.work.itemListFocus = L11_214
    if A3_206 == "UILuaCommands.MouseEnteredItem" then
      A0_203:setWindowFocus(A2_205)
      A0_203:setFocusedIndex(A2_205, L9_212)
      break
    else
    end
    if A0_203:isListBoxOwnerRetainer(L8_211) and A0_203.work.waitretainerupdate == true then
    else
      A0_203:setCommonTimer(0.2)
      do break end
      else
      end
      if L7_210 == "UILuaCommands.TabChanged" then
        L11_214 = A2_205
        L8_211.itemlist = L9_212
        L11_214 = A0_203.work
        L11_214 = L11_214.itemlist
        L11_214 = A0_203
        L11_214 = A0_203.getListBoxName
        L11_214 = L11_214(A0_203, A0_203.work.itemlist)
        A0_203.work.itemListFocus = L10_213
        A0_203:setWindowFocus(L11_214)
        A0_203:setFocusedIndex(L11_214, L8_211)
        if L6_209 then
          A0_203:displayFocusedItemHelp()
          do break end
          else
          end
          if L7_210 == "UILuaCommands.GotAnchor" then
            for L11_214 = 1, 6 do
              if A2_205 == "TextBlock_NoContents_" .. tostring(L11_214) then
                if A0_203.work.itemlist ~= L11_214 then
                  A0_203.work.itemlist = L11_214
                  A0_203.work.itemListFocus = 0
                  if L6_209 then
                    A0_203:displayFocusedItemHelp()
                  end
                end
                break
              end
            end
          else
          end
        else
        end
    end
end
function RetainerTradeWidget.processTimer(A0_215)
  if A0_215:canOperate() then
    A0_215:displayFocusedItemHelp()
  end
end
function RetainerTradeWidget.getCurrentListFromTabControl(A0_216, A1_217)
  local L2_218
  if A1_217 == "TabControl_ItemList" then
    L2_218 = A0_216:getSelectedIndex(A1_217) + 1
  elseif A1_217 == "TabControl_ItemList_2" then
    L2_218 = A0_216:getSelectedIndex(A1_217) + 4
  end
  return L2_218
end
function RetainerTradeWidget.canOperate(A0_219)
  local L1_220
  L1_220 = A0_219.work
  L1_220 = L1_220.editWidgetMode
  if L1_220 ~= 0 then
    L1_220 = false
    return L1_220
  end
  L1_220 = A0_219.work
  L1_220 = L1_220.updatecount
  if L1_220 > 0 then
    L1_220 = false
    return L1_220
  end
  L1_220 = A0_219.work
  L1_220 = L1_220.updatecountbaz
  if L1_220 > 0 then
    L1_220 = false
    return L1_220
  end
  L1_220 = A0_219.work
  L1_220 = L1_220.chosenOperation
  if L1_220 ~= -1 then
    L1_220 = false
    return L1_220
  end
  L1_220 = A0_219.work
  L1_220 = L1_220.amActive
  if L1_220 == false then
    L1_220 = false
    return L1_220
  end
  L1_220 = A0_219.work
  L1_220 = L1_220.closeok
  if L1_220 == true then
    L1_220 = false
    return L1_220
  end
  L1_220 = true
  return L1_220
end
function RetainerTradeWidget.selectedBorder(A0_221, A1_222, A2_223)
  local L3_224, L4_225
  L3_224 = A0_221.getListPropertyName
  L3_224 = L3_224(L4_225, A0_221.work.itemlist)
  if A1_222 ~= nil then
    A0_221:setListProperty(L3_224, A1_222, "selected", L4_225)
    A0_221.work.selected = A1_222
  elseif L4_225 == -1 then
    return
  else
    for _FORV_7_ = 1, A0_221:getListBoxItemNum(A0_221.work.itemlist) do
      A0_221:setListProperty(L3_224, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_225.selected = -1
  end
  L4_225(A0_221, L3_224)
end
function RetainerTradeWidget.editItemCount(A0_226, A1_227, A2_228)
  local L3_229, L4_230
  L4_230 = A0_226
  L3_229 = A0_226.getChildWidgetByWindowName
  L3_229 = L3_229(L4_230, "ItemDetailWidget")
  if L3_229 ~= nil then
    if A1_227 ~= true then
      L4_230 = L3_229.editCount
      return L4_230(L3_229, A0_226.work.chosenPackage, A0_226.work.chosenItem, A2_228)
    else
      L4_230 = 0
      if A2_228 == 4 then
        L4_230 = A0_226.work.retainerMoneyIndex
      else
        L4_230 = A0_226.work.playerMoneyIndex
      end
      if L4_230 > 0 then
        A0_226.work.chosenOwner = A2_228
        return L3_229:editCount(100, L4_230, A2_228)
      else
        return false
      end
    end
  end
end
function RetainerTradeWidget.setItemCount(A0_231, A1_232, A2_233)
  desktopWidget:changeFocusedWidget(A0_231, true)
  if A1_232 > 0 then
    A0_231.work.chosenCount = A1_232
    if A2_233 == 4 then
      A0_231.work.chosenOperation = 31
      if A0_231.work.editmoney == false then
        A0_231.work.retainerItemPackage = A0_231.work.chosenPackage
        A0_231.work.retainerItem = A0_231.work.chosenItem
      else
        A0_231.work.retainerItemPackage = 100
        A0_231.work.retainerItem = A0_231.work.retainerMoneyIndex
      end
    elseif A0_231.work.editmoney == false then
      A0_231:setPlayerItem(A0_231.work.chosenPackage, A0_231.work.chosenItem)
    else
      A0_231:setPlayerItem(100, A0_231.work.playerMoneyIndex)
    end
    A0_231:setInputEnable(false)
  end
  A0_231:setSelectedIndex(A0_231:getListBoxName(A0_231.work.itemlist))
  A0_231:selectedBorder()
  A0_231.work.editWidgetMode = 0
end
function RetainerTradeWidget.setPlayerItem(A0_234, A1_235, A2_236)
  local L3_237
  L3_237 = A0_234.work
  L3_237.chosenOperation = 32
  L3_237 = A0_234.work
  L3_237.playerItemPackage = A1_235
  L3_237 = A0_234.work
  L3_237.playerItem = A2_236
end
function RetainerTradeWidget.closeWidgets(A0_238)
  A0_238.work.editWidgetMode = 0
end
function RetainerTradeWidget.updateItemList(A0_239, A1_240, A2_241)
  local L3_242
  L3_242 = -1
  if A1_240 == 0 then
    A0_239.work.updatecountbaz = A2_241
    return
  else
    if A0_239.work.resultForAsk == 31 and A0_239.work.retainerItemPackage == A1_240 and A0_239.work.retainerItem == A2_241 then
      A0_239.work.waitretainerupdate = false
    end
    if A0_239.work.resultForAsk == 32 and A0_239.work.playerItemPackage == A1_240 then
      A0_239.work.waitretainerupdate = false
    end
    if A0_239.work.chosenOwner == 4 and A0_239.work.editWidgetMode ~= 0 and (A0_239.work.editmoney == true and A1_240 == 100 and A2_241 == A0_239.work.retainerMoneyIndex or A0_239.work.itemlist == 2 and A1_240 == 100 or A0_239.work.editmoney == false and A1_240 == A0_239.work.chosenPackage and A2_241 == A0_239.work.chosenItem) and A0_239:isSameItem(A1_240, A2_241, 4) == false then
      A0_239.work.closeok = true
    end
  end
  if 0 < A0_239.work.updatecountbaz then
    A0_239.work.updatecountbaz = A0_239.work.updatecountbaz - 1
  end
  if A0_239.work.updatecountbaz == 0 then
    if A0_239.work.error == true or desktopWidget:isValidRetainer() == false then
      A0_239.work.chosenOperation = 1
      return desktopWidget:closeWidgetDirect(A0_239)
    end
    if A1_240 == 1 then
    else
    end
    if A1_240 == 100 then
      A0_239:cancelDetailEdit()
      if A1_240 == 1 then
        A0_239:makeListFromPackage(1, nil, 4)
        A0_239:displayItemList(1)
        break
      else
      end
      if A1_240 == 100 then
        A0_239:makeListFromPackage(100, nil, 4)
        A0_239:displayItemList(2)
        A0_239:makeMoneyList(4)
        A0_239:displayItemList(3)
        break
      else
      end
      A0_239:displayBagcapacityAndMoney()
    else
    end
  else
  end
  return
end
function RetainerTradeWidget.updatePlayerItem(A0_243, A1_244, A2_245)
  local L3_246, L4_247, L5_248, L6_249
  L3_246 = -1
  if A1_244 == 0 then
    L4_247 = A0_243.work
    L4_247.updatecount = A2_245
    return
  else
    L4_247 = A0_243.work
    L4_247 = L4_247.resultForAsk
    if L4_247 == 32 then
      L4_247 = A0_243.work
      L4_247 = L4_247.playerItemPackage
      if L4_247 == A1_244 then
        L4_247 = A0_243.work
        L4_247 = L4_247.playerItem
        if L4_247 == A2_245 then
          L4_247 = A0_243.work
          L4_247.waitplayerupdate = false
        end
      end
    end
    L4_247 = A0_243.work
    L4_247 = L4_247.resultForAsk
    if L4_247 == 31 then
      L4_247 = A0_243.work
      L4_247 = L4_247.retainerItemPackage
      if L4_247 == A1_244 then
        L4_247 = A0_243.work
        L4_247.waitplayerupdate = false
      end
    end
    L4_247 = A1_244
    if L4_247 == 1 then
    else
    end
    if L4_247 == 100 then
      L5_248 = A0_243.work
      L5_248 = L5_248.chosenOwner
      if L5_248 == 1 then
        L5_248 = A0_243.work
        L5_248 = L5_248.editWidgetMode
        if L5_248 ~= 0 then
          L5_248 = A0_243.work
          L5_248 = L5_248.editmoney
          if L5_248 == true and A1_244 == 100 then
            L5_248 = A0_243.work
            L5_248 = L5_248.playerMoneyIndex
          else
            if A2_245 ~= L5_248 then
              L5_248 = A0_243.work
              L5_248 = L5_248.itemlist
              if L5_248 ~= 6 or A1_244 ~= 100 then
                L5_248 = A0_243.work
                L5_248 = L5_248.editmoney
                if L5_248 == false then
                  L5_248 = A0_243.work
                  L5_248 = L5_248.chosenPackage
                  if A1_244 == L5_248 then
                    L5_248 = A0_243.work
                    L5_248 = L5_248.chosenItem
                  end
                end
              end
          end
          elseif A2_245 == L5_248 then
            L6_249 = A0_243
            L5_248 = A0_243.isSameItem
            L5_248 = L5_248(L6_249, A1_244, A2_245, 1)
            if L5_248 == false then
              L5_248 = A0_243.work
              L5_248.closeok = true
            end
          end
        end
      end
      L6_249 = A0_243
      L5_248 = A0_243.makeListFromPackage
      L5_248(L6_249, A1_244, A2_245, 1)
      break
    else
    end
  end
  L4_247 = A0_243.work
  L4_247 = L4_247.updatecount
  if L4_247 > 0 then
    L4_247 = A0_243.work
    L5_248 = A0_243.work
    L5_248 = L5_248.updatecount
    L5_248 = L5_248 - 1
    L4_247.updatecount = L5_248
  end
  L4_247 = A0_243.work
  L4_247 = L4_247.updatecount
  if L4_247 == 0 then
    L4_247 = A0_243.work
    L4_247 = L4_247.error
    if L4_247 ~= true then
      L4_247 = desktopWidget
      L5_248 = L4_247
      L4_247 = L4_247.isValidRetainer
      L4_247 = L4_247(L5_248)
    elseif L4_247 == false then
      L4_247 = A0_243.work
      L4_247.chosenOperation = 1
      L4_247 = desktopWidget
      L5_248 = L4_247
      L4_247 = L4_247.closeWidgetDirect
      L6_249 = A0_243
      return L4_247(L5_248, L6_249)
    end
    L4_247 = A1_244
    if L4_247 == 1 then
    else
    end
    if L4_247 == 100 then
      L6_249 = A0_243
      L5_248 = A0_243.cancelDetailEdit
      L5_248(L6_249)
      L5_248 = A1_244
      if L5_248 == 1 then
        L6_249 = A0_243.getListPropertyName
        L6_249 = L6_249(A0_243, 4)
        A0_243:updateListProperty(L6_249)
        A0_243:displayItemList(4)
        break
      else
      end
      if L5_248 == 100 then
        L6_249 = A0_243.getListPropertyName
        L6_249 = L6_249(A0_243, 5)
        A0_243:updateListProperty(L6_249)
        A0_243:displayItemList(5)
        A0_243:makeMoneyList(1)
        A0_243:displayItemList(6)
        break
      else
      end
      L6_249 = A0_243
      L5_248 = A0_243.displayBagcapacityAndMoney
      L5_248(L6_249)
    else
    end
  else
  end
  return
end
function RetainerTradeWidget.processWaitCallFunction(A0_250)
  local L1_251, L2_252
  L1_251 = A0_250.work
  L1_251 = L1_251.chosenOperation
  if L1_251 == -1 then
    L1_251 = false
    return L1_251
  else
    L1_251 = A0_250.work
    L2_252 = A0_250.work
    L2_252 = L2_252.chosenOperation
    L1_251.resultForAsk = L2_252
    L1_251 = A0_250.work
    L1_251.chosenOperation = -1
    L1_251 = A0_250.work
    L1_251.amActive = false
    L1_251 = true
    return L1_251
  end
end
function RetainerTradeWidget.getAskResult(A0_253)
  if A0_253.work.resultForAsk == 1 then
    return 1
  elseif A0_253.work.resultForAsk == 31 then
    if A0_253:canTransfer(A0_253.work.retainerItemPackage, A0_253.work.retainerItem, A0_253.work.chosenCount, 4) == true then
      A0_253.work.waitplayerupdate = true
      A0_253.work.waitretainerupdate = true
    end
    return A0_253.work.resultForAsk, A0_253.work.retainerItemPackage, A0_253.work.retainerItem, A0_253.work.chosenCount
  elseif A0_253.work.resultForAsk == 32 then
    if A0_253:canTransfer(A0_253.work.playerItemPackage, A0_253.work.playerItem, A0_253.work.chosenCount, 1) == true then
      A0_253.work.waitplayerupdate = true
      A0_253.work.waitretainerupdate = true
    end
    return A0_253.work.resultForAsk, A0_253.work.playerItemPackage, A0_253.work.playerItem, A0_253.work.chosenCount
  else
    return A0_253.work.resultForAsk, nil, nil, nil, nil
  end
end
function RetainerTradeWidget.reActivateWidget(A0_254)
  A0_254:setInputEnable(true)
  A0_254.work.amActive = true
end
function RetainerTradeWidget.noticeItemTransferResult(A0_255, A1_256, A2_257)
  local L3_258
  L3_258 = A0_255.work
  L3_258.noticeGetTime = worldMaster:_getServerTime()
  if A2_257 == true then
  else
    L3_258 = A0_255.work
    L3_258.waitplayerupdate = false
    L3_258 = A0_255.work
    L3_258.waitretainerupdate = false
  end
end
function RetainerTradeWidget.syncItemWork(A0_259, A1_260)
end
function RetainerTradeWidget.changeSortType(A0_261)
  A0_261.work.sorttype = desktopWidget:changeSortType(A0_261.work.sorttype)
end
function RetainerTradeWidget.saveSortType(A0_262)
  desktopWidget:saveSortType(A0_262.work.sorttype)
end
