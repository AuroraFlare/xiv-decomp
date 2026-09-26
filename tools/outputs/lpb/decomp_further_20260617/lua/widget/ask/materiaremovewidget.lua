require("/Widget/Ask/AskBaseClass")
_defineClass("MateriaRemoveWidget", "AskBaseClass")
function MateriaRemoveWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function MateriaRemoveWidget.initAsk(A0_2)
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
    {
      "isRewardMode",
      "boolean"
    },
    {"rewardItem", "integer32"},
    {
      "rewardItemPackage",
      "integer32"
    },
    {
      "editWidgetOpen",
      "integer8"
    },
    {"submenu", "boolean"},
    {
      "updatecount",
      "integer32"
    },
    {"closeok", "boolean"},
    {"demandSync", "boolean"},
    {"sorttype", "integer8"},
    {"lastsub", "integer8"},
    {"waittrash", "boolean"},
    {"sdsize", "boolean"},
    {"repair", "boolean"},
    {
      "repairindex",
      "integer16"
    },
    {"repairitem", "integer32"},
    {"repairlife", "integer32"},
    {
      "isMateriaList",
      "boolean"
    }
  }
  A0_2.work.chosenItem = 0
  A0_2.work.chosenOperation = 0
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
  A0_2.work.lastsub = 10
  A0_2.work.repair = false
  A0_2.work.waittrash = false
  A0_2:initForm()
  A0_2:initListBox(1)
  A0_2:setVisibility("TabItem_2", false)
  A0_2:setVisibility("TabItem_3", false)
  A0_2:setVisibility("TabItem_4", false)
  A0_2:setVisibility("TabItem_5", false)
  A0_2:setVisibility("TabItem_6", false)
  A0_2:setInitialData()
end
function MateriaRemoveWidget.initForm(A0_3)
  A0_3:setCloseCondition()
  A0_3:setConfirmCondition("Button_SortStatus")
  A0_3:setConfirmCondition("Button_ListClose")
  A0_3:setCancelCondition("TabItem_1")
  A0_3:setConfirmCondition("TOG_itemDetail")
  if A0_3:getUserWorkInt(1, nil, "TOG_itemDetail") == 1 then
    A0_3.work.sdsize = true
  else
    A0_3.work.sdsize = false
  end
  A0_3:setVisibility("Grid_MateriaEquipList", false)
  desktopWidget:setMateriaAttachSlotIconHelp(A0_3)
end
function MateriaRemoveWidget.initListBox(A0_4, A1_5)
  local L2_6, L3_7
  L3_7 = A0_4
  L2_6 = A0_4.getListBoxName
  L2_6 = L2_6(L3_7, A1_5)
  if L2_6 ~= "" then
    L3_7 = A0_4.setControlProperty
    L3_7(A0_4, L2_6, "IntData.Value0", A1_5)
    L3_7 = A0_4.setControlCommandCondition
    L3_7(A0_4, L2_6, "UILuaCommands.MouseEnteredItem")
    L3_7 = A0_4.setControlCommandCondition
    L3_7(A0_4, L2_6, "UILuaCommands.AnchoredItem")
    L3_7 = A0_4.setControlCommandCondition
    L3_7(A0_4, L2_6, "UILuaCommands.Selection")
    L3_7 = A0_4.setCancelCondition
    L3_7(A0_4, L2_6)
    L3_7 = A0_4.setVisibility
    L3_7(A0_4, L2_6, true)
    L3_7 = "TextBlock_NoContents_"
    L3_7 = L3_7 .. tostring(A1_5)
    A0_4:setVisibility(L3_7, false)
    A0_4:setCancelCondition(L3_7)
    A0_4:setControlProperty(L3_7, "IsTabStop", true)
    A0_4:setControlCommandCondition(L2_6, "UILuaCommands.Previous")
    A0_4:setControlCommandCondition(L2_6, "UILuaCommands.Next")
  end
end
function MateriaRemoveWidget.setInitialData(A0_8)
  A0_8:resetListBox(1)
  A0_8:makeListFromPackage()
  A0_8:setText("TextBlock_ItemLifeHeader", 214, 10091)
  A0_8:setText("TextBlock_RepairMaterialHeader", 214, 10093)
  A0_8:_setTextProperty(nil, "Window_ItemListWidget", "Title", 3594)
  A0_8:setText("TextBlock_Title", 3595)
  A0_8.work.listbox = 1
  A0_8:updateWindowDisplay(true)
end
function MateriaRemoveWidget.processBeforeShow(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14, L6_15, L7_16
  if A1_10 == true then
    L2_11 = A0_9.work
    L2_11 = L2_11.submenu
    if L2_11 ~= true then
      L2_11 = A0_9.work
      L2_11 = L2_11.editWidgetOpen
    else
      if L2_11 > 0 then
        L2_11 = A0_9.work
        L2_11 = L2_11.editWidgetOpen
        if L2_11 == 2 then
          L3_12 = A0_9
          L2_11 = A0_9.closeBazaarEdit
          L4_13 = true
          L2_11(L3_12, L4_13)
        else
          L2_11 = A0_9.work
          L2_11 = L2_11.editWidgetOpen
          if L2_11 == 1 then
            L3_12 = A0_9
            L2_11 = A0_9.closeItemEdit
            L4_13 = true
            L2_11(L3_12, L4_13)
          else
            L2_11 = A0_9.work
            L2_11 = L2_11.editWidgetOpen
            if L2_11 ~= 3 then
              L2_11 = A0_9.work
              L2_11 = L2_11.editWidgetOpen
            else
              if L2_11 == 4 then
                L3_12 = A0_9
                L2_11 = A0_9.closeItemShare
                L4_13 = true
                L2_11(L3_12, L4_13)
            end
            else
              L2_11 = A0_9.work
              L2_11 = L2_11.submenu
              if L2_11 == true then
                L3_12 = A0_9
                L2_11 = A0_9.closeSubWidget
                L2_11(L3_12)
              end
            end
          end
        end
    end
    else
      L3_12 = A0_9
      L2_11 = A0_9.updateWindowDisplay
      L4_13 = true
      L2_11(L3_12, L4_13)
      L2_11 = A0_9.work
      L2_11 = L2_11.repair
      if L2_11 == true then
        L2_11 = worldMaster
        L3_12 = L2_11
        L2_11 = L2_11._getMyPlayer
        L2_11 = L2_11(L3_12)
        L3_12 = A0_9.work
        L3_12 = L3_12.repairindex
        L3_12 = L3_12 - 7
        L4_13 = A0_9.work
        L4_13 = L4_13.repairindex
        L4_13 = L4_13 + 15
        if L3_12 < 1 then
          L3_12 = 1
        end
        L6_15 = L2_11
        L5_14 = L2_11._getItemPackageCapacity
        L7_16 = 1
        L5_14 = L5_14(L6_15, L7_16)
        if L4_13 > L5_14 then
          L4_13 = L5_14
        end
        L6_15 = nil
        L7_16 = L4_13
        for _FORV_11_ = L3_12, L4_13 do
          L6_15 = L2_11:_getItem(1, L7_16)
          if L6_15 ~= nil and A0_9.work.repairitem == L6_15:_getCatalogID() and A0_9.work.repairlife == L6_15:getItemLife() then
            break
          end
          L7_16 = L7_16 - 1
        end
        if L6_15 ~= nil then
          A0_9.work.demandSync = desktopWidget:updateItemWork(L6_15)
        end
        A0_9.work.repair = false
      end
    end
  end
  L2_11 = true
  return L2_11
end
function MateriaRemoveWidget.processAfterShow(A0_17, A1_18)
  local L2_19
  if A1_18 == true then
  end
  L2_19 = true
  return L2_19
end
function MateriaRemoveWidget.getListPropertyName(A0_20, A1_21)
  local L2_22
  if A1_21 == 1 then
    L2_22 = "TabItem_1_Maker"
    return L2_22
  elseif A1_21 == 2 then
    L2_22 = "TabItem_2_Maker"
    return L2_22
  elseif A1_21 == 3 then
    L2_22 = "TabItem_3_Maker"
    return L2_22
  elseif A1_21 == 4 then
    L2_22 = "TabItem_4_Maker"
    return L2_22
  elseif A1_21 == 5 then
    L2_22 = "TabItem_5_Maker"
    return L2_22
  end
end
function MateriaRemoveWidget.updateWindowDisplay(A0_23, A1_24)
  A0_23:setGridVisibility(8)
  if A0_23.work.isMateriaList then
    A0_23:setVisibility("Grid_MateriaEquipList", true)
    A0_23:setVisibility("Grid_TabList", false)
  end
  if A0_23.work.listbox == 1 then
    A0_23:setVisibility("Button_SortStatus", true)
    A0_23:displaySortType(A0_23.work.sorttype)
  else
    A0_23:setVisibility("Button_SortStatus", false)
  end
  if A1_24 == true then
    A0_23:updateListFocus()
  end
end
function MateriaRemoveWidget.updateListFocus(A0_25)
  local L1_26, L2_27
  L1_26 = A0_25.work
  L1_26 = L1_26.updatecount
  if L1_26 ~= 0 then
    L1_26 = false
    return L1_26
  end
  L2_27 = A0_25
  L1_26 = A0_25.getListBoxName
  L1_26 = L1_26(L2_27, A0_25.work.listbox)
  L2_27 = "TextBlock_NoContents_"
  L2_27 = L2_27 .. tostring(A0_25.work.listbox)
  if A0_25:getListBoxFocusNum(A0_25.work.listbox) == 0 then
    A0_25:setVisibility(L2_27, true)
    A0_25:setVisibility(L1_26, false)
    A0_25.work.editWidgetOpen = 0
    A0_25:displayFocusedItemHelp()
    A0_25:setWindowFocus(L2_27)
  else
    A0_25:setVisibility(L1_26, true)
    A0_25:setVisibility(L2_27, false)
    if A0_25.work.focus > A0_25:getListBoxFocusNum(A0_25.work.listbox) - 1 then
      A0_25.work.focus = A0_25:getListBoxFocusNum(A0_25.work.listbox) - 1
    end
    if 0 <= A0_25:focusToIndex(A0_25.work.listbox, A0_25.work.focus) then
      A0_25.work.index = A0_25:focusToIndex(A0_25.work.listbox, A0_25.work.focus)
    end
    A0_25:setControlProperty(L1_26, "SqwtFocusedIndex", A0_25.work.focus)
    A0_25:setFocusedIndex(L1_26, A0_25.work.focus)
    A0_25:setWindowFocus(L1_26)
    A0_25:displayFocusedItemHelp()
  end
end
function MateriaRemoveWidget.setGridVisibility(A0_28, A1_29)
  A0_28:setVisibility("Grid_TabList", true)
  A0_28:setVisibility("Grid_ActorName", A1_29 == 11 or A1_29 == 12)
  A0_28:setVisibility("Grid_Help", A1_29 == 0 or A1_29 == 1 or A1_29 == 2 or A1_29 == 6 or A1_29 == 7 or A1_29 == 12)
  A0_28:setVisibility("Grid_BackpackAndGil", true)
  A0_28:setVisibility("Grid_ItemNameBase", A1_29 == 3 or A1_29 == 4 or A1_29 == 5 or A1_29 == 8 or A1_29 == 9 or A1_29 == 10)
  A0_28:setVisibility("Grid_ItemDetail1", A0_28.work.bonus1)
  A0_28:setVisibility("Grid_ItemDetail2", A0_28.work.bonus2)
  A0_28:setVisibility("Grid_ItemDetail3", A0_28.work.bonus3 or A0_28.work.itemlife or A0_28.work.bazaar)
  A0_28:setVisibility("Label_ItemBonus5", A0_28.work.bonus3)
  A0_28:setVisibility("Grid_ItemLife", A0_28.work.itemlife)
  A0_28:setVisibility("Grid_ItemBazaarInformation", A0_28.work.bazaar)
  A0_28:setVisibility("Grid_MateriaAttachBazaarInformation", false)
end
function MateriaRemoveWidget.setWindowFocus(A0_30, A1_31)
  if A1_31 ~= nil and A1_31 ~= "" then
    A0_30:setLogicalFocus(A1_31)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_30 then
      A0_30:setKeyboardFocusedControl(A1_31)
    end
  end
end
function MateriaRemoveWidget.displayBagcapacityAndMoney(A0_32)
  local L1_33, L2_34, L3_35
  L1_33 = worldMaster
  L2_34 = L1_33
  L1_33 = L1_33._getMyPlayer
  L1_33 = L1_33(L2_34)
  L3_35 = L1_33
  L2_34 = L1_33.getMoneyOnHand
  L2_34 = L2_34(L3_35)
  L3_35 = A0_32.setText
  L3_35(A0_32, "TextBlock_Gil", 3263, L2_34)
  L3_35 = L1_33._getItemPackageCapacity
  L3_35 = L3_35(L1_33, 1)
  A0_32:setText("TextBlock_ItemStack_2", 3551, L3_35 - L1_33:_getItemPackageFreeSpace(1), L3_35)
end
function MateriaRemoveWidget.isExistItem(A0_36, A1_37, A2_38, A3_39)
  if A3_39 == nil or A3_39 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_37, A2_38) ~= nil then
      return true
    else
      return false
    end
  elseif A3_39 == 2 then
    if desktopWidget:getBazaarItem(A1_37, A2_38) ~= nil then
      return true
    else
      return false
    end
  end
end
function MateriaRemoveWidget.checkPackageAndIndex(A0_40, A1_41, A2_42, A3_43, A4_44)
  if A4_44 == nil or A4_44 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A2_42, A3_43) == A1_41 then
      return true
    else
      return false
    end
  elseif A4_44 == 2 then
    if desktopWidget:getBazaarItem(A2_42, A3_43) == A1_41 then
      return true
    else
      return false
    end
  end
end
function MateriaRemoveWidget.getSelectedTab(A0_45)
  return A0_45:getSelectedIndex("TabControl_ItemList") + 1
end
function MateriaRemoveWidget.getListBoxName(A0_46, A1_47)
  local L2_48
  if A1_47 == 1 then
    L2_48 = "ListBox_TabItem_1"
    return L2_48
  elseif A1_47 == 2 then
    L2_48 = "ListBox_TabItem_2"
    return L2_48
  elseif A1_47 == 3 then
    L2_48 = "ListBox_TabItem_3"
    return L2_48
  elseif A1_47 == 4 then
    L2_48 = "ListBox_TabItem_4"
    return L2_48
  elseif A1_47 == 5 then
    L2_48 = "ListBox_TabItem_5"
    return L2_48
  else
    L2_48 = ""
    return L2_48
  end
end
function MateriaRemoveWidget.getListBoxItemNum(A0_49, A1_50)
  local L2_51, L3_52
  L3_52 = A0_49
  L2_51 = A0_49.getListPropertyCount
  return L2_51(L3_52, A0_49:getListPropertyName(A1_50))
end
function MateriaRemoveWidget.getListBoxFocusNum(A0_53, A1_54)
  local L2_55, L3_56, L4_57, L5_58
  L3_56 = A0_53
  L2_55 = A0_53.getListBoxItemNum
  L4_57 = A1_54
  L2_55 = L2_55(L3_56, L4_57)
  L4_57 = A0_53
  L3_56 = A0_53.getListPropertyName
  L5_58 = A1_54
  L3_56 = L3_56(L4_57, L5_58)
  if L2_55 < 1 then
    L4_57 = 0
    L5_58 = 0
    return L4_57, L5_58, 0, 0
  end
  L5_58 = A0_53
  L4_57 = A0_53.getControlProperty
  L4_57 = L4_57(L5_58, L3_56, "FilteredCount")
  L5_58 = A0_53.work
  L5_58 = L5_58.focus
  if L4_57 < A0_53.work.focus then
    L5_58 = L4_57 - 1
  end
  return L4_57, L4_57 - 1, 0, L5_58
end
function MateriaRemoveWidget.focusToIndex(A0_59, A1_60, A2_61)
  local L3_62
  L3_62 = A0_59.getListPropertyName
  L3_62 = L3_62(A0_59, A1_60)
  if A0_59:getListBoxFocusNum(A1_60) < 1 or A2_61 >= A0_59:getListBoxFocusNum(A1_60) then
    return -1
  else
    A0_59:setControlProperty(L3_62, "FilteredIndex", A2_61)
    return A0_59:getControlProperty(L3_62, "Index")
  end
end
function MateriaRemoveWidget.indexToFocus(A0_63, A1_64, A2_65)
  local L3_66, L4_67
  L3_66 = -1
  L4_67 = A0_63.getListPropertyName
  L4_67 = L4_67(A0_63, A1_64)
  if A0_63:getListBoxFocusNum(A1_64) > 0 then
    A0_63:setControlProperty(L4_67, "Index", A2_65)
    L3_66 = A0_63:getControlProperty(L4_67, "FilteredIndex")
  end
  return L3_66
end
function MateriaRemoveWidget.resetListBox(A0_68, A1_69)
  local L2_70, L3_71
  L3_71 = A0_68
  L2_70 = A0_68.getListBoxItemNum
  L2_70 = L2_70(L3_71, A1_69)
  L3_71 = A0_68.getListPropertyName
  L3_71 = L3_71(A0_68, A1_69)
  if L2_70 < 1 then
    return
  else
    for _FORV_7_ = 1, L2_70 do
      L2_70 = L2_70 - 1
      A0_68:deleteListProperty(L3_71, L2_70)
    end
    A0_68:updateListProperty(L3_71)
  end
  return
end
function MateriaRemoveWidget.getPackageFromList(A0_72, A1_73)
  local L2_74
  L2_74 = 1
  if A1_73 == 1 then
    L2_74 = 1
  elseif A1_73 == 2 then
    L2_74 = 100
  elseif A1_73 == 3 then
    L2_74 = 8
  elseif A1_73 == 4 then
    L2_74 = 5
  elseif A1_73 == 5 then
    L2_74 = 100
  end
  return L2_74
end
function MateriaRemoveWidget.setItemToXmlLight(A0_75, A1_76, A2_77, A3_78, A4_79, A5_80)
  local L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88, L14_89, L15_90, L16_91, L17_92
  L7_82 = A0_75
  L6_81 = A0_75.getListPropertyName
  L8_83 = A1_76
  L6_81 = L6_81(L7_82, L8_83)
  L7_82, L8_83, L9_84, L10_85 = nil, nil, nil, nil
  L11_86 = worldMaster
  L12_87 = L11_86
  L11_86 = L11_86._getMyPlayer
  L11_86 = L11_86(L12_87)
  L12_87, L13_88 = nil, nil
  if A3_78 > 0 and A4_79 > 0 then
    L15_90 = L11_86
    L14_89 = L11_86._getItem
    L16_91 = A3_78
    L17_92 = A4_79
    L14_89 = L14_89(L15_90, L16_91, L17_92)
    L12_87 = L14_89
  end
  if L12_87 == nil then
    L14_89 = false
    return L14_89
  end
  L15_90 = L12_87
  L14_89 = L12_87._getCatalogID
  L14_89 = L14_89(L15_90)
  L7_82 = L14_89
  L15_90 = L12_87
  L14_89 = L12_87.getItemIcon
  L14_89 = L14_89(L15_90)
  L8_83 = L14_89
  L15_90 = L12_87
  L14_89 = L12_87._isStackable
  L14_89 = L14_89(L15_90)
  L9_84 = L14_89
  L15_90 = L12_87
  L14_89 = L12_87._countStack
  L14_89 = L14_89(L15_90)
  L10_85 = L14_89
  L15_90 = L12_87
  L14_89 = L12_87._getNameIndex
  L14_89 = L14_89(L15_90)
  L15_90 = "TBL_null"
  L16_91 = A0_75.work
  L16_91 = L16_91.sorttype
  L17_92 = 1
  desktopWidget:setItemToXml(A0_75, L6_81, A2_77, L12_87, L15_90, L7_82, L8_83, L9_84, L10_85, L14_89, L16_91, true, false, L17_92, A3_78, A4_79, A5_80, false, true)
  if L17_92 == 5 then
    if 0 < L11_86:getGrandCompanyRank(1) and (L7_82 == 1000202 or L7_82 == 1000203) then
      A0_75:setListPropertyVisibility(L6_81, A2_77, false)
    end
    if 0 < L11_86:getGrandCompanyRank(2) and (L7_82 == 1000201 or L7_82 == 1000203) then
      A0_75:setListPropertyVisibility(L6_81, A2_77, false)
    end
    if 0 < L11_86:getGrandCompanyRank(3) and (L7_82 == 1000201 or L7_82 == 1000202) then
      A0_75:setListPropertyVisibility(L6_81, A2_77, false)
    end
  end
  if 0 < A0_75.work.updatecount and A0_75.work.listbox == A1_76 and A0_75:getControlProperty(L6_81, "FilteredIndex") < A0_75.work.focus then
    A0_75.work.focusChange = true
  end
  return true
end
function MateriaRemoveWidget.setSortType(A0_93, A1_94, A2_95, A3_96)
  local L4_97, L5_98
  L4_97 = worldMaster
  L5_98 = L4_97
  L4_97 = L4_97._getMyPlayer
  L4_97 = L4_97(L5_98)
  L5_98 = L4_97._getItem
  L5_98 = L5_98(L4_97, 1, A3_96)
  if L5_98 == nil then
    return false
  end
  if not desktopWidget:getMateriaBindPermission(A3_96) then
    return false
  end
  if desktopWidget:getAttachedMateriaCountByIndex(A3_96) == 0 then
    return false
  end
  desktopWidget:setSortType(A0_93, A1_94, A2_95, A0_93.work.sorttype, L5_98)
  return true
end
function MateriaRemoveWidget.updateSortType(A0_99)
  local L1_100, L2_101, L3_102, L4_103, L5_104, L6_105, L7_106, L8_107, L9_108
  L2_101 = A0_99
  L1_100 = A0_99.getListPropertyName
  L3_102 = 1
  L1_100 = L1_100(L2_101, L3_102)
  L2_101 = worldMaster
  L3_102 = L2_101
  L2_101 = L2_101._getMyPlayer
  L2_101 = L2_101(L3_102)
  L4_103 = L2_101
  L3_102 = L2_101._getItemPackageCapacity
  L5_104 = 1
  L3_102 = L3_102(L4_103, L5_104)
  L5_104 = L2_101
  L4_103 = L2_101._getItemPackageFreeSpace
  L4_103 = L4_103(L5_104, L6_105)
  L5_104 = 0
  for L9_108 = 1, L3_102 - L4_103 do
    if A0_99:setSortType(L1_100, L5_104, L9_108) then
      L5_104 = L5_104 + 1
    end
  end
  L6_105(L7_106, L8_107)
end
function MateriaRemoveWidget.setBazaarLabelVisibility(A0_109, A1_110, A2_111, A3_112)
  local L4_113, L5_114
  L4_113 = "Visible"
  if A3_112 == 1 then
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "bazaarStatus", 378)
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "priceStyle", "TBL_parameterPlus")
  elseif A3_112 == 7 then
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "bazaarStatus", 453)
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "priceStyle", "TBL_parameterPlus")
    L5_114 = A0_109.getListProperty
    L5_114 = L5_114(A0_109, A1_110, A2_111, "stackCount")
    if A0_109:getListProperty(A1_110, A2_111, "stackable") == 1 then
      A0_109:setListProperty(A1_110, A2_111, "stack", "(" .. tostring(L5_114) .. ")")
    end
  elseif A3_112 == 2 then
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "bazaarStatus", 379)
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "priceStyle", "TBL_parameterMinus")
    L5_114 = A0_109.getListProperty
    L5_114 = L5_114(A0_109, A1_110, A2_111, "stackCount")
    if A0_109:getListProperty(A1_110, A2_111, "stackable") == 1 then
      A0_109:setListProperty(A1_110, A2_111, "stack", "(" .. tostring(L5_114) .. ")")
    end
  elseif A3_112 == 3 then
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "bazaarStatus", 380)
    L5_114 = A0_109.setListProperty
    L5_114(A0_109, A1_110, A2_111, "priceStyle", "TBL_guildleveBonus")
  else
    L5_114 = A0_109.getListProperty
    L5_114 = L5_114(A0_109, A1_110, A2_111, "nameStyle")
    A0_109:setListProperty(A1_110, A2_111, "priceStyle", L5_114)
    L4_113 = "Hidden"
  end
  L5_114 = A0_109.setListProperty
  L5_114(A0_109, A1_110, A2_111, "bazaarStatusVisibility", L4_113)
end
function MateriaRemoveWidget.updateBazaarLabel(A0_115, A1_116, A2_117)
  local L3_118, L4_119, L5_120, L6_121, L7_122, L8_123, L9_124, L10_125, L11_126, L12_127, L13_128, L14_129, L15_130, L16_131, L17_132, L18_133, L19_134, L20_135
  L11_126 = A0_115
  L10_125 = A0_115.getListPropertyName
  L12_127 = A1_116
  L10_125 = L10_125(L11_126, L12_127)
  L11_126, L12_127 = nil, nil
  L13_128 = 1
  L14_129 = A0_115.getListBoxItemNum
  L14_129 = L14_129(L15_130, L16_131)
  for L18_133 = L13_128 - 1, L14_129 - 1 do
    L11_126 = 8
    L12_127 = L18_133 + 1
    L20_135 = A0_115
    L19_134 = A0_115.isExistItem
    L19_134 = L19_134(L20_135, L11_126, L12_127, A2_117)
    if L19_134 == false then
      break
    end
    L3_118 = 0
    L19_134 = false
    L20_135 = desktopWidget
    L20_135 = L20_135.isDealingItem
    L20_135 = L20_135(L20_135, L11_126, L12_127)
    L19_134 = L20_135
    if L19_134 == true then
      L20_135 = desktopWidget
      L20_135 = L20_135.getItemDealData
      L5_120, L6_121, L20_135 = L20_135, L11_126, L20_135(L20_135, L11_126, L12_127)
      L4_119 = L20_135
      L20_135 = A0_115.setListProperty
      L20_135(A0_115, L10_125, L18_133, "bazaarkind", L4_119)
      if L4_119 == 11 then
        L3_118 = 1
      elseif L4_119 == 12 then
        L3_118 = 1
      elseif L4_119 == 13 then
        L3_118 = 7
      elseif L4_119 == 20 then
        L3_118 = 4
      elseif L4_119 == 30 then
        L3_118 = 4
      end
      if L3_118 ~= 4 then
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "rewardprice", L5_120)
        L20_135 = A0_115.setListText
        L20_135(A0_115, L10_125, L18_133, "price", 225, L5_120)
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "rewardpackage", 0)
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "rewarditem", 0)
        L20_135 = A0_115.setListPropertyVisibility
        L20_135(A0_115, L10_125, L18_133, true)
      else
        L20_135 = A0_115.setListPropertyVisibility
        L20_135(A0_115, L10_125, L18_133, true)
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "nameStyle", "TBL_selectedItem")
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "rewardprice", 0)
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "rewardpackage", 0)
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "rewarditem", 0)
        L20_135 = A0_115.setListProperty
        L20_135(A0_115, L10_125, L18_133, "price", "")
      end
    else
      L20_135 = false
      L20_135 = desktopWidget:isPlayerItemAttached(L11_126, L12_127)
      if L20_135 == true then
        L4_119, L7_122, L8_123, L9_124 = A0_115:checkRewardDependency(L11_126, L12_127, A2_117)
        if L4_119 ~= 0 then
          if L4_119 == 20 then
            L3_118 = 2
          elseif L4_119 == 30 then
            L3_118 = 3
          end
          if L9_124 ~= 0 then
            A0_115:setListText(L10_125, L18_133, "price", 225, L9_124)
          else
            A0_115:setListText(L10_125, L18_133, "price", 3144)
          end
          A0_115:setListProperty(L10_125, L18_133, "rewardpackage", L7_122)
          A0_115:setListProperty(L10_125, L18_133, "rewarditem", L8_123)
        else
          A0_115:setListProperty(L10_125, L18_133, "rewardpackage", 0)
          A0_115:setListProperty(L10_125, L18_133, "rewarditem", 0)
          A0_115:setListProperty(L10_125, L18_133, "price", "")
        end
      else
        A0_115:setListProperty(L10_125, L18_133, "rewardpackage", 0)
        A0_115:setListProperty(L10_125, L18_133, "rewarditem", 0)
        A0_115:setListProperty(L10_125, L18_133, "price", "")
      end
      A0_115:setListProperty(L10_125, L18_133, "bazaarkind", 0)
      A0_115:setListProperty(L10_125, L18_133, "rewardprice", 0)
      A0_115:setListPropertyVisibility(L10_125, L18_133, true)
    end
    L20_135 = A0_115.setBazaarLabelVisibility
    L20_135(A0_115, L10_125, L18_133, L3_118)
  end
  L15_130(L16_131, L17_132)
end
function MateriaRemoveWidget.checkRewardDependency(A0_136, A1_137, A2_138, A3_139)
  local L4_140, L5_141, L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149
  if A1_137 == 0 or A2_138 == 0 or A1_137 == false or A2_138 == false then
    L4_140 = 0
    L5_141 = 0
    L6_142 = 0
    L7_143 = 0
    return L4_140, L5_141, L6_142, L7_143
  end
  L4_140 = 0
  L5_141 = 0
  L6_142 = nil
  L7_143 = 0
  L8_144 = worldMaster
  L9_145 = L8_144
  L8_144 = L8_144._getMyPlayer
  L8_144 = L8_144(L9_145)
  L9_145 = L8_144._getItem
  L9_145 = L9_145(L10_146, L11_147, L12_148)
  L13_149 = 8
  for L13_149 = 1, L11_147(L12_148, L13_149) do
    if A0_136:isExistItem(8, L13_149) == false then
      break
    elseif desktopWidget:isDealingItem(8, L13_149) == true then
      L4_140, L5_141, L6_142 = desktopWidget:getItemDealData(8, L13_149)
      if L6_142 == L9_145 then
        if L8_144:_getItem(8, L13_149):_getCatalogID() == 1000001 then
          L7_143 = L8_144:_getItem(8, L13_149):_countStack()
        end
        return L4_140, 8, L13_149, L7_143
      end
    end
  end
  L13_149 = 0
  return L10_146, L11_147, L12_148, L13_149
end
function MateriaRemoveWidget.isRewardItemActor(A0_150, A1_151, A2_152, A3_153, A4_154, A5_155)
  if A1_151 == 0 or A2_152 == 0 or A3_153 == 0 or A4_154 == 0 or A1_151 == false or A2_152 == false or A3_153 == false or A4_154 == false then
    return false
  end
  if worldMaster:_getMyPlayer():_getItem(A1_151, A2_152) == desktopWidget:getItemDealData(A3_153, A4_154) then
    return true
  else
    return false
  end
end
function MateriaRemoveWidget.makeListFromPackage(A0_156, A1_157, A2_158)
  local L3_159, L4_160, L5_161, L6_162, L7_163, L8_164, L9_165, L10_166, L11_167, L12_168, L13_169
  L3_159 = worldMaster
  L4_160 = L3_159
  L3_159 = L3_159._getMyPlayer
  L3_159 = L3_159(L4_160)
  if A2_158 == nil then
    L4_160 = 0
    L6_162 = A0_156
    L5_161 = A0_156.getListPropertyName
    L7_163 = 1
    L5_161 = L5_161(L6_162, L7_163)
    L7_163 = A0_156
    L6_162 = A0_156.getListBoxItemNum
    L8_164 = 1
    L6_162 = L6_162(L7_163, L8_164)
    L8_164 = L3_159
    L7_163 = L3_159._getItemPackageCapacity
    L9_165 = 1
    L7_163 = L7_163(L8_164, L9_165)
    L9_165 = L3_159
    L8_164 = L3_159._getItemPackageFreeSpace
    L8_164 = L8_164(L9_165, L10_166)
    L9_165 = A0_156.getListBoxName
    L9_165 = L9_165(L10_166, L11_167)
    L13_169 = "SourceFirstIndex"
    L10_166(L11_167, L12_168, L13_169, 0)
    L13_169 = "SourceCount"
    L10_166(L11_167, L12_168, L13_169, L7_163)
    L13_169 = "FilteredSortKey"
    L10_166(L11_167, L12_168, L13_169, "sorttype")
    for L13_169 = 1, L7_163 - L8_164 do
      if desktopWidget:getMateriaBindPermission(L13_169) and 0 < desktopWidget:getAttachedMateriaCountByIndex(L13_169) then
        if A0_156:setItemToXmlLight(1, L4_160, 1, L13_169) then
          L4_160 = L4_160 + 1
        else
          break
        end
      end
    end
    if L6_162 > L4_160 then
      for L13_169 = L4_160, L6_162 - 1 do
        L6_162 = L6_162 - 1
        A0_156:deleteListProperty(L5_161, L6_162)
      end
    end
    L10_166(L11_167, L12_168)
  else
    L5_161 = A0_156
    L4_160 = A0_156.getListPropertyName
    L6_162 = 1
    L4_160 = L4_160(L5_161, L6_162)
    L6_162 = L3_159
    L5_161 = L3_159._getItem
    L7_163 = A1_157
    L8_164 = A2_158
    L5_161 = L5_161(L6_162, L7_163, L8_164)
    if L5_161 ~= nil then
      L6_162 = A0_156
      L5_161 = A0_156.setItemToXmlLight
      L7_163 = 1
      L8_164 = A2_158 - 1
      L9_165 = A1_157
      L5_161(L6_162, L7_163, L8_164, L9_165, L10_166)
    else
      L6_162 = A0_156
      L5_161 = A0_156.getListBoxItemNum
      L7_163 = 1
      L5_161 = L5_161(L6_162, L7_163)
      L7_163 = A0_156
      L6_162 = A0_156.deleteListProperty
      L8_164 = L4_160
      L9_165 = L5_161 - 1
      L6_162(L7_163, L8_164, L9_165)
      L7_163 = A0_156
      L6_162 = A0_156.updateListProperty
      L8_164 = L4_160
      L6_162(L7_163, L8_164)
    end
  end
  L5_161 = A0_156
  L4_160 = A0_156.displayBagcapacityAndMoney
  L4_160(L5_161)
end
function MateriaRemoveWidget.makeDropItemList(A0_170, A1_171)
  local L2_172, L3_173, L4_174, L5_175, L6_176, L7_177, L8_178, L9_179, L10_180
  L2_172 = worldMaster
  L3_173 = L2_172
  L2_172 = L2_172._getMyPlayer
  L2_172 = L2_172(L3_173)
  L4_174 = L2_172
  L3_173 = L2_172._getItemPackageCapacity
  L5_175 = 5
  L3_173 = L3_173(L4_174, L5_175)
  L4_174 = 0
  L6_176 = A0_170
  L5_175 = A0_170.getListPropertyName
  L5_175 = L5_175(L6_176, L7_177)
  L6_176 = A0_170.setControlProperty
  L10_180 = 4
  L10_180 = 0
  L6_176(L7_177, L8_178, L9_179, L10_180)
  L6_176 = A0_170.setControlProperty
  L10_180 = 4
  L10_180 = L3_173
  L6_176(L7_177, L8_178, L9_179, L10_180)
  L6_176 = A0_170.setControlProperty
  L10_180 = "sorttype"
  L6_176(L7_177, L8_178, L9_179, L10_180)
  L6_176 = A0_170.getListBoxItemNum
  L6_176 = L6_176(L7_177, L8_178)
  if A1_171 == nil then
    for L10_180 = 1, L3_173 do
      if A0_170:setItemToXmlLight(4, L4_174, 5, L10_180) == true then
        L4_174 = L4_174 + 1
      else
        break
      end
    end
    if L6_176 > L4_174 then
      for L10_180 = L4_174, L6_176 - 1 do
        L6_176 = L6_176 - 1
        A0_170:deleteListProperty(L5_175, L6_176)
      end
    end
    L7_177(L8_178, L9_179)
  else
    L10_180 = A1_171
    if L7_177 ~= nil then
      L10_180 = A1_171 - 1
      L7_177(L8_178, L9_179, L10_180, 5, A1_171)
    else
      L10_180 = L5_175
      L8_178(L9_179, L10_180, L7_177 - 1)
      L10_180 = L5_175
      L8_178(L9_179, L10_180)
    end
  end
  L10_180 = "TabItem_4"
  L8_178(L9_179, L10_180, 3231, L7_177)
end
function MateriaRemoveWidget.getItemBazaarData(A0_181, A1_182, A2_183, A3_184, A4_185, A5_186, A6_187)
  local L7_188, L8_189, L9_190, L10_191, L11_192, L12_193, L13_194, L14_195, L15_196, L16_197
  L7_188 = 0
  L8_189 = 0
  L9_190 = 0
  L10_191 = 0
  L11_192 = 0
  L12_193 = 0
  L13_194 = 0
  L14_195 = 0
  L15_196 = ""
  L16_197 = 0
  if A1_182 ~= nil then
  else
    L7_188 = A0_181:getListProperty(A2_183, A3_184, "bazaarkind")
    L10_191 = A0_181:getListProperty(A2_183, A3_184, "rewardprice")
    L8_189 = A0_181:getListProperty(A2_183, A3_184, "rewardpackage")
    L9_190 = A0_181:getListProperty(A2_183, A3_184, "rewarditem")
    if L8_189 ~= 0 then
      L11_192 = A0_181:getListProperty(A2_183, L9_190 - 1, "bazaarkind")
      L12_193 = A0_181:getListProperty(A2_183, L9_190 - 1, "catalog")
      L13_194 = A0_181:getListProperty(A2_183, L9_190 - 1, "icon")
      L14_195 = A0_181:getListProperty(A2_183, L9_190 - 1, "stackCount")
      L15_196 = A0_181:getListProperty(A2_183, L9_190 - 1, "name")
      L16_197 = A0_181:getListProperty(A2_183, L9_190 - 1, "stackable")
    end
  end
  return L7_188, L8_189, L9_190, L10_191, L11_192, L12_193, L13_194, L14_195, L15_196, L16_197
end
function MateriaRemoveWidget.displayHelp(A0_198, A1_199)
  A0_198:setText("TextBlock_Help", A1_199)
end
function MateriaRemoveWidget.displayFocusedItemHelp(A0_200)
  local L1_201, L2_202, L3_203, L4_204, L5_205, L6_206, L7_207, L8_208, L9_209, L10_210, L11_211, L12_212, L13_213, L14_214
  L1_201 = A0_200.work
  L1_201 = L1_201.updatecount
  if L1_201 > 0 then
    L1_201 = false
    return L1_201
  end
  L2_202 = A0_200
  L1_201 = A0_200.getListBoxFocusNum
  L3_203 = A0_200.work
  L3_203 = L3_203.listbox
  L1_201 = L1_201(L2_202, L3_203)
  if L1_201 == 0 then
    L2_202 = A0_200
    L1_201 = A0_200.displayHelp
    L3_203 = 3140
    L1_201(L2_202, L3_203)
    L1_201 = A0_200.work
    L1_201.bonus1 = false
    L1_201 = A0_200.work
    L1_201.bonus2 = false
    L1_201 = A0_200.work
    L1_201.bonus3 = false
    L1_201 = A0_200.work
    L1_201.bazaar = false
    L1_201 = A0_200.work
    L1_201.itemlife = false
    L1_201 = A0_200.work
    L1_201.page = 0
    L2_202 = A0_200
    L1_201 = A0_200.setGridVisibility
    L3_203 = 0
    L1_201(L2_202, L3_203)
    L1_201 = false
    return L1_201
  end
  L2_202 = A0_200
  L1_201 = A0_200.getListBoxItemNum
  L3_203 = A0_200.work
  L3_203 = L3_203.listbox
  L1_201 = L1_201(L2_202, L3_203)
  L2_202 = A0_200.work
  L2_202 = L2_202.index
  if L1_201 <= L2_202 then
    L1_201 = false
    return L1_201
  end
  L2_202 = A0_200
  L1_201 = A0_200.getListPropertyName
  L3_203 = A0_200.work
  L3_203 = L3_203.listbox
  L1_201 = L1_201(L2_202, L3_203)
  L3_203 = A0_200
  L2_202 = A0_200.getPackageFromList
  L4_204 = A0_200.work
  L4_204 = L4_204.listbox
  L2_202 = L2_202(L3_203, L4_204)
  L4_204 = A0_200
  L3_203 = A0_200.getListProperty
  L5_205 = "TabItem_1_Maker"
  L6_206 = A0_200.work
  L6_206 = L6_206.index
  L7_207 = "itemIndex"
  L3_203 = L3_203(L4_204, L5_205, L6_206, L7_207)
  L4_204 = worldMaster
  L5_205 = L4_204
  L4_204 = L4_204._getMyPlayer
  L4_204 = L4_204(L5_205)
  L6_206 = L4_204
  L5_205 = L4_204._getItem
  L7_207 = L2_202
  L8_208 = L3_203
  L5_205 = L5_205(L6_206, L7_207, L8_208)
  L6_206 = desktopWidget
  L7_207 = L6_206
  L6_206 = L6_206.setItemDetail
  L8_208 = A0_200
  L9_209 = L5_205
  L10_210 = A0_200.getListPropertyName
  L10_210 = L10_210(L11_211, L12_212)
  L6_206(L7_207, L8_208, L9_209, L10_210, L11_211)
  L6_206 = nil
  L7_207 = 0
  L8_208 = 0
  L9_209 = 0
  L10_210 = 0
  if L11_211 == true then
    for L14_214 = 1, 27 do
      if L5_205:isFitForEquipPoint(L14_214) == true then
        if L7_207 == 0 then
          L7_207 = L14_214
        elseif L8_208 == 0 then
          L8_208 = L14_214
        elseif L9_209 == 0 then
          L9_209 = L14_214
        elseif L10_210 == 0 then
          L10_210 = L14_214
          break
        end
      end
    end
  end
  if L7_207 ~= 0 then
    L6_206 = L11_211
  end
  if L6_206 == nil and L8_208 ~= 0 then
    L6_206 = L11_211
  end
  if L6_206 == nil and L9_209 ~= 0 then
    L6_206 = L11_211
  end
  if L6_206 == nil and L10_210 ~= 0 then
    L6_206 = L11_211
  end
  L14_214 = A0_200.work
  L11_211.bonus1, L12_212.bonus2, L13_213.bonus3, L14_214.itemlife = desktopWidget:setItemDetailEquip(A0_200, L5_205, A0_200:getListPropertyName(A0_200.work.listbox), A0_200.work.index, L6_206, false, false, false, false)
  L11_211(L12_212, L13_213)
end
function MateriaRemoveWidget.previousSequence(A0_215)
  A0_215:saveSortType()
  A0_215.work.editWidgetOpen = -1
  desktopWidget:closeWidgetDirect(A0_215)
end
function MateriaRemoveWidget.processUICommandOperate(A0_216, A1_217, A2_218, A3_219, A4_220)
  local L5_221
  L5_221 = A0_216.work
  L5_221 = L5_221.editWidgetOpen
  if L5_221 ~= 0 then
    L5_221 = false
    return L5_221
  end
  L5_221 = A0_216.work
  L5_221 = L5_221.updatecount
  if L5_221 > 0 then
    L5_221 = false
    return L5_221
  end
  if A2_218 == "Button_SortStatus" then
    L5_221 = A0_216.changeSortType
    L5_221(A0_216)
    L5_221 = A0_216.work
    L5_221 = L5_221.index
    A0_216:updateSortType()
    if A0_216:indexToFocus(A0_216.work.listbox, L5_221) > -1 then
      A0_216.work.focus = A0_216:indexToFocus(A0_216.work.listbox, L5_221)
    end
    if 0 <= A0_216:focusToIndex(A0_216.work.listbox, A0_216.work.focus) then
      A0_216.work.index = A0_216:focusToIndex(A0_216.work.listbox, A0_216.work.focus)
    end
    A0_216:displaySortType(A0_216.work.sorttype)
  elseif A2_218 == "Button_ListClose" then
    L5_221 = A0_216.closeMateriaList
    L5_221(A0_216)
  end
end
function MateriaRemoveWidget.processUICommandCancel(A0_222, A1_223, A2_224, A3_225, A4_226)
  A0_222:setBaseAskResult(-1)
end
function MateriaRemoveWidget.processUICommandClose(A0_227, A1_228, A2_229, A3_230, A4_231)
  A0_227:setBaseAskResult(-1)
end
function MateriaRemoveWidget.processUICommandSelection(A0_232, A1_233, A2_234, A3_235, A4_236)
  local L5_237
  L5_237 = A0_232.work
  L5_237 = L5_237.editWidgetOpen
  if L5_237 ~= 0 then
    return
  end
  L5_237 = A0_232.work
  L5_237 = L5_237.updatecount
  if L5_237 > 0 then
    return
  end
  L5_237 = desktopWidget
  L5_237 = L5_237.checkKeyboardFocused
  L5_237 = L5_237(L5_237, A0_232)
  if L5_237 == false then
    return
  end
  if A3_235 == nil or A3_235 < 0 then
    return
  end
  L5_237 = A0_232.work
  L5_237.focus = A3_235
  L5_237 = A0_232.work
  L5_237.listbox = A4_236
  L5_237 = A0_232.updateWindowDisplay
  L5_237(A0_232, true)
  L5_237 = A0_232.work
  L5_237 = L5_237.waittrash
  if L5_237 ~= false then
    return
  end
  L5_237 = A0_232.selectedBorder
  L5_237(A0_232, A0_232.work.index, true)
  L5_237 = A0_232.getListProperty
  L5_237 = L5_237(A0_232, "TabItem_1_Maker", A0_232.work.index, "itemIndex")
  A0_232:showMateriaList()
  A0_232:setBaseAskResult(L5_237)
end
function MateriaRemoveWidget.processUICommandDefault(A0_238, A1_239, A2_240, A3_241, A4_242, A5_243)
  if A0_238.work.editWidgetOpen ~= 0 then
    return false
  end
  if 0 < A0_238.work.updatecount then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_238) == false then
    return
  end
  if A3_241 == "UILuaCommands.MouseEnteredItem" or A3_241 == "UILuaCommands.AnchoredItem" then
    if A5_243 == nil then
      return
    end
    if A4_242 == nil or A4_242 < 0 then
      return
    end
    A0_238.work.focus = A4_242
    A0_238.work.listbox = A5_243
    if 0 <= A0_238:focusToIndex(A0_238.work.listbox, A0_238.work.focus) then
      A0_238.work.index = A0_238:focusToIndex(A0_238.work.listbox, A0_238.work.focus)
    end
    A0_238.work.page = 0
    A0_238:updateWindowDisplay(true)
    A0_238:selectedBorder()
  elseif A3_241 == "UILuaCommands.Previous" then
    A0_238:catalogSkip(-1)
  elseif A3_241 == "UILuaCommands.Next" then
    A0_238:catalogSkip(1)
  end
end
function MateriaRemoveWidget.selectedBorder(A0_244, A1_245, A2_246)
  local L3_247, L4_248
  L3_247 = A0_244.getListPropertyName
  L3_247 = L3_247(L4_248, A0_244.work.listbox)
  if A1_245 ~= nil then
    A0_244:setListProperty(L3_247, A0_244.work.index, "selected", L4_248)
    A0_244.work.selected = A0_244.work.index
  elseif L4_248 == -1 then
    return
  else
    for _FORV_7_ = 1, A0_244:getListBoxItemNum(A0_244.work.listbox) do
      A0_244:setListProperty(L3_247, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_248.selected = -1
  end
  L4_248(A0_244, L3_247)
end
function MateriaRemoveWidget.catalogSkip(A0_249, A1_250)
  local L2_251, L3_252, L4_253, L5_254, L6_255, L7_256, L8_257, L9_258, L10_259, L11_260, L12_261, L13_262
  L2_251 = A0_249.work
  L2_251 = L2_251.focus
  L4_253 = A0_249
  L3_252 = A0_249.getListBoxFocusNum
  L5_254 = A0_249.work
  L5_254 = L5_254.listbox
  L3_252 = L3_252(L4_253, L5_254)
  L3_252 = L3_252 - 1
  if L3_252 == -1 then
    return
  end
  L4_253 = 2
  L5_254 = A0_249.work
  L5_254 = L5_254.sorttype
  if L5_254 == 0 then
    L5_254 = 10 * A1_250
    L2_251 = L2_251 + L5_254
  else
    L5_254 = nil
    if A1_250 > 0 then
      L6_255 = A0_249.work
      L6_255 = L6_255.focus
      L5_254 = L3_252 - L6_255
    else
      L6_255 = A0_249.work
      L5_254 = L6_255.focus
    end
    L7_256 = A0_249
    L6_255 = A0_249.getListPropertyName
    L8_257 = A0_249.work
    L8_257 = L8_257.listbox
    L6_255 = L6_255(L7_256, L8_257)
    L7_256 = desktopWidget
    L8_257 = L7_256
    L7_256 = L7_256.getItemSortKey
    L12_261 = 1
    L13_262 = L4_253
    L7_256 = L7_256(L8_257, L9_258, L10_259, L11_260, L12_261, L13_262)
    L8_257 = L2_251
    for L12_261 = 1, L5_254 do
      L8_257 = L8_257 + A1_250
      L13_262 = A0_249.focusToIndex
      L13_262 = L13_262(A0_249, A0_249.work.listbox, L8_257)
      if L7_256 ~= desktopWidget:getItemSortKey(A0_249, L6_255, L13_262, 1, L4_253) then
        L2_251 = L2_251 + L12_261 * A1_250
        break
      end
      if L12_261 == L5_254 then
        if A1_250 > 0 then
          L2_251 = L3_252
        else
          L2_251 = 0
        end
      end
    end
  end
  if L3_252 < L2_251 then
    L2_251 = L3_252
  elseif L2_251 < 0 then
    L2_251 = 0
  end
  L5_254 = A0_249.work
  L5_254 = L5_254.focus
  if L2_251 ~= L5_254 then
    L5_254 = A0_249.work
    L5_254.focus = L2_251
    L6_255 = A0_249
    L5_254 = A0_249.updateWindowDisplay
    L7_256 = true
    L5_254(L6_255, L7_256)
  end
end
function MateriaRemoveWidget.changeList(A0_263)
  if A0_263.work.listbox == 4 then
    A0_263.work.mode = 100
    A0_263:setText("TextBlock_Title", 3213)
  else
    A0_263.work.mode = 310
    A0_263:setText("TextBlock_Title", A0_263:getControlProperty("TabItem_" .. tostring(A0_263.work.listbox), "Header"))
  end
  A0_263.work.index = 0
  A0_263.work.focus = 0
  return A0_263:updateWindowDisplay(true)
end
function MateriaRemoveWidget.updatePlayerItem(A0_264, A1_265, A2_266)
  local L3_267, L4_268
  L3_267 = -1
  if A1_265 == 1 then
    L4_268 = A0_264.work
    L4_268 = L4_268.listbox
    if L4_268 == 1 then
      L4_268 = A0_264.work
      L4_268 = L4_268.index
      L4_268 = L4_268 + 1
      if A2_266 < L4_268 then
        L4_268 = A0_264.work
        L4_268.indexChange = true
      end
    end
    L4_268 = A0_264.makeListFromPackage
    L4_268(A0_264, A1_265)
    L3_267 = 1
  end
  L4_268 = A0_264.work
  L4_268 = L4_268.chosenPackage
  if L4_268 == A1_265 then
    L4_268 = A0_264.work
    L4_268 = L4_268.chosenItem
    if L4_268 == A2_266 then
      L4_268 = A0_264.work
      L4_268 = L4_268.editWidgetOpen
      if L4_268 == 0 then
        L4_268 = A0_264.work
        L4_268 = L4_268.submenu
      elseif L4_268 == true then
        L4_268 = A0_264.work
        L4_268.closeok = true
      end
    end
  end
  L4_268 = A0_264.work
  L4_268 = L4_268.updatecount
  if L4_268 > 0 then
    L4_268 = A0_264.work
    L4_268.updatecount = A0_264.work.updatecount - 1
  end
  L4_268 = A0_264.work
  L4_268 = L4_268.updatecount
  if L4_268 == 0 then
    if L3_267 ~= -1 then
      L4_268 = A0_264.getListPropertyName
      L4_268 = L4_268(A0_264, L3_267)
      A0_264:updateListProperty(L4_268)
    end
    L4_268 = A0_264.displayBagcapacityAndMoney
    L4_268(A0_264)
    L4_268 = A0_264.work
    L4_268 = L4_268.listbox
    if L3_267 == L4_268 then
      L4_268 = A0_264.updateListFocus
      L4_268(A0_264)
    end
    L4_268 = A0_264.work
    L4_268.waittrash = false
  end
end
function MateriaRemoveWidget.setBazaarEditData(A0_269, A1_270)
  A0_269.work.chosenOperation = A1_270
  return true
end
function MateriaRemoveWidget.closeBazaarEdit(A0_271, A1_272)
  A0_271.work.editWidgetOpen = 0
  A0_271.work.chosenOperation = 0
  if A0_271:getChildWidgetByWindowName("BazaarEditWidget") ~= nil then
    desktopWidget:closeChildWidget("BazaarEditWidget", A0_271)
  end
  if A1_272 == nil then
    A0_271:updateWindowDisplay(true)
    A0_271:selectedBorder()
  end
  return true
end
function MateriaRemoveWidget.setItemEditData(A0_273, A1_274, A2_275)
  local L3_276
  L3_276 = A0_273.work
  L3_276.chosenOperation = A1_274
  if A1_274 ~= 12 then
    L3_276 = A0_273.work
    L3_276.waittrash = true
  end
  L3_276 = true
  return L3_276
end
function MateriaRemoveWidget.closeItemEdit(A0_277, A1_278)
  A0_277.work.editWidgetOpen = 0
  A0_277.work.chosenOperation = 0
  if A0_277:getChildWidgetByWindowName("ItemEditWidget") ~= nil then
    desktopWidget:closeChildWidget("ItemEditWidget", A0_277)
  end
  if A1_278 == nil then
    A0_277:updateWindowDisplay(true)
    A0_277:selectedBorder()
  end
  return true
end
function MateriaRemoveWidget.setItemShare(A0_279, A1_280)
  if A1_280 ~= 12 then
    A0_279.work.chosenOperation = A1_280
  end
  return true
end
function MateriaRemoveWidget.closeItemShare(A0_281, A1_282)
  A0_281.work.editWidgetOpen = 0
  A0_281.work.chosenOperation = 0
  if A0_281:getChildWidgetByWindowName("ItemShareWidget") ~= nil then
    desktopWidget:closeChildWidget("ItemShareWidget", A0_281)
  end
  if A1_282 == nil then
    A0_281:updateWindowDisplay(true)
    A0_281:selectedBorder()
  end
  return true
end
function MateriaRemoveWidget.getShareItem(A0_283)
  local L1_284
  L1_284 = A0_283.work
  L1_284 = L1_284.editWidgetOpen
  if L1_284 == 4 then
    L1_284 = 0
    return L1_284
  else
    L1_284 = A0_283.work
    L1_284 = L1_284.chosenPackage
    if L1_284 == 5 then
      L1_284 = A0_283.work
      L1_284 = L1_284.chosenItem
      return L1_284
    else
      L1_284 = -1
      return L1_284
    end
  end
end
function MateriaRemoveWidget.checkChosenItem(A0_285, A1_286, A2_287, A3_288)
  if A2_287 ~= nil and A2_287 ~= A0_285.work.chosenPackage then
    return false
  end
  if A3_288 ~= nil and A3_288 ~= A0_285.work.chosenItem then
    return false
  end
  if A0_285.work.chosenPackage ~= A0_285:getPackageFromList(A0_285.work.listbox) then
    return false
  end
  if A0_285.work.chosenItem ~= A0_285.work.index + 1 then
    return false
  end
  if worldMaster:_getMyPlayer():_getItem(A0_285.work.chosenPackage, A0_285.work.chosenItem) == A1_286 then
    return true
  else
    return false
  end
end
function MateriaRemoveWidget.getItemContent(A0_289, A1_290, A2_291, A3_292)
  local L4_293
  if A2_291 == "itemPackage" then
    L4_293 = A0_289.work
    L4_293 = L4_293.chosenPackage
    return L4_293
  elseif A2_291 == "itemIndex" then
    L4_293 = A0_289.work
    L4_293 = L4_293.chosenItem
    return L4_293
  elseif A2_291 == "itemOwner" then
    L4_293 = 1
    return L4_293
  end
  if A1_290 == nil then
    L4_293 = A0_289._getProperty
    return L4_293(A0_289, nil, A2_291, A3_292)
  else
    L4_293 = A0_289.getListPropertyName
    L4_293 = L4_293(A0_289, A0_289.work.listbox)
    if A1_290 == -1 then
      return A0_289:getListProperty(L4_293, A0_289.work.index, A2_291)
    else
      return A0_289:getListProperty(L4_293, A1_290, A2_291)
    end
  end
end
function MateriaRemoveWidget.getItemEditData(A0_294)
  local L1_295, L2_296, L3_297, L4_298, L5_299, L6_300, L7_301
  L1_295 = 0
  L2_296 = 0
  L3_297 = ""
  L4_298 = false
  L5_299 = 1
  L6_300 = worldMaster
  L7_301 = L6_300
  L6_300 = L6_300._getMyPlayer
  L6_300 = L6_300(L7_301)
  L7_301 = nil
  L7_301, L2_296, L4_298, L5_299 = desktopWidget:getPlayerItemInPackage(A0_294.work.chosenPackage, A0_294.work.chosenItem)
  L3_297 = A0_294:_getProperty(nil, "TextBlock_ItemName", "Text")
  if L6_300:_getItem(A0_294.work.chosenPackage, A0_294.work.chosenItem) ~= nil then
    L1_295 = L6_300:_getItem(A0_294.work.chosenPackage, A0_294.work.chosenItem):getWasteConfirmLevel()
  end
  return L1_295, L2_296, L3_297, L4_298, L5_299
end
function MateriaRemoveWidget.syncItemWork(A0_302, A1_303)
  local L2_304, L3_305, L4_306, L5_307, L6_308, L7_309, L8_310
  L2_304 = worldMaster
  L3_305 = L2_304
  L2_304 = L2_304._getMyPlayer
  L2_304 = L2_304(L3_305)
  L4_306 = L2_304
  L3_305 = L2_304._getItemPackageCapacity
  L3_305 = L3_305(L4_306, L5_307)
  L4_306 = L2_304._getItemPackageFreeSpace
  L4_306 = L4_306(L5_307, L6_308)
  for L8_310 = 1, L3_305 - L4_306 do
    if A0_302:checkPackageAndIndex(A1_303, 1, L8_310) == true then
      A0_302:makeListFromPackage(1, L8_310)
      A0_302:updateListProperty(A0_302:getListPropertyName(1))
      if A0_302.work.listbox == 1 and A0_302.work.index == L8_310 - 1 then
        A0_302:displayFocusedItemHelp()
      end
    end
  end
end
function MateriaRemoveWidget.setSortTypeWork(A0_311, A1_312)
  local L2_313
  L2_313 = A0_311.work
  L2_313 = L2_313.sorttype
  if L2_313 ~= A1_312 then
    L2_313 = A0_311.work
    L2_313.sorttype = A1_312
    L2_313 = A0_311.work
    L2_313 = L2_313.index
    A0_311:updateSortType()
    if A0_311:indexToFocus(A0_311.work.listbox, L2_313) > -1 then
      A0_311.work.focus = A0_311:indexToFocus(A0_311.work.listbox, L2_313)
    end
    if A0_311:focusToIndex(A0_311.work.listbox, A0_311.work.focus) >= 0 then
      A0_311.work.index = A0_311:focusToIndex(A0_311.work.listbox, A0_311.work.focus)
    end
    A0_311:displaySortType(A0_311.work.sorttype)
  end
end
function MateriaRemoveWidget.getCountItemsAttachedMateria(A0_314)
  local L1_315, L2_316, L3_317, L4_318, L5_319, L6_320, L7_321, L8_322
  L1_315 = 0
  L2_316 = worldMaster
  L3_317 = L2_316
  L2_316 = L2_316._getMyPlayer
  L2_316 = L2_316(L3_317)
  L4_318 = L2_316
  L3_317 = L2_316._getItemPackageCapacity
  L3_317 = L3_317(L4_318, L5_319)
  L4_318 = L2_316._getItemPackageFreeSpace
  L4_318 = L4_318(L5_319, L6_320)
  for L8_322 = 1, L3_317 - L4_318 do
    if desktopWidget:getMateriaBindPermission(L8_322) and 0 < desktopWidget:getAttachedMateriaCountByIndex(L8_322) then
      L1_315 = L1_315 + 1
    end
  end
  return L1_315
end
function MateriaRemoveWidget.showMateriaList(A0_323)
  local L1_324
  L1_324 = worldMaster
  L1_324 = L1_324._getMyPlayer
  L1_324 = L1_324(L1_324)
  L1_324 = L1_324._getItem
  L1_324 = L1_324(L1_324, 1, A0_323:getListProperty("TabItem_1_Maker", A0_323.work.index, "itemIndex"))
  desktopWidget:setMateriaListItems(A0_323, L1_324)
  A0_323:setVisibility("Grid_MateriaEquipList", true)
  A0_323:setVisibility("Grid_TabList", false)
  A0_323:setVisibility("Button_ListClose", false)
  A0_323.work.isMateriaList = true
end
function MateriaRemoveWidget.closeMateriaList(A0_325)
  A0_325:setVisibility("Grid_MateriaEquipList", false)
  A0_325:setVisibility("Grid_TabList", true)
  A0_325.work.isMateriaList = false
end
function MateriaRemoveWidget.setAskParameter(A0_326, ...)
  A0_326:closeMateriaList()
end
function MateriaRemoveWidget.displaySortType(A0_328, A1_329)
  desktopWidget:displaySortType(A1_329, A0_328, "Button_SortStatus")
end
function MateriaRemoveWidget.changeSortType(A0_330)
  A0_330.work.sorttype = desktopWidget:changeSortType(A0_330.work.sorttype)
end
function MateriaRemoveWidget.saveSortType(A0_331)
  desktopWidget:saveSortType(A0_331.work.sorttype)
end
