require("/Widget/WidgetBaseClass")
_defineClass("ItemListWidget", "WidgetBaseClass")
function ItemListWidget.init(A0_0, A1_1, A2_2)
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
      "materiaOrder",
      "boolean"
    },
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
      "equipItemIndex",
      "integer32"
    },
    {
      "materiaItemIndex",
      "integer32"
    },
    {
      "isMateriaList",
      "boolean"
    },
    {"equipx", "boolean"},
    {"lasttime", "integer32"}
  }
  A0_0.work.equipx = desktopWidget:demandPlayerExpInfomation()
  A0_0.work.chosenItem = 0
  A0_0.work.chosenOperation = 0
  A0_0.work.bonus1 = false
  A0_0.work.bonus2 = false
  A0_0.work.bonus3 = false
  A0_0.work.itemlife = false
  A0_0.work.bazaar = false
  A0_0.work.materiaOrder = false
  A0_0.work.closeok = false
  A0_0.work.demandSync = false
  A0_0.work.sorttype = desktopWidget:getConfigWork(9)
  A0_0.work.focus = 0
  A0_0.work.submenu = false
  A0_0.work.lastsub = 10
  A0_0.work.repair = false
  A0_0.work.waittrash = false
  A0_0.work.equipItemIndex = -1
  A0_0.work.materiaItemIndex = -1
  A0_0.work.isMateriaList = false
  A0_0:initForm()
  A0_0:initListBox(1)
  A0_0:initListBox(2)
  A0_0:initListBox(3)
  A0_0:initListBox(4)
  A0_0:initListBox(5)
  A0_0:initListBox(6)
  A0_0:setInitialData(A1_1, A2_2)
end
function ItemListWidget.initForm(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8
  L1_4(L2_5)
  L1_4(L2_5, L3_6)
  L1_4(L2_5, L3_6)
  L1_4(L2_5, L3_6)
  for L4_7 = 1, 5 do
    L5_8 = "TabItem_"
    L5_8 = L5_8 .. tostring(L4_7)
    A0_3:setCancelCondition(L5_8)
  end
  L4_7 = "UILuaCommands.TabChanged"
  L1_4(L2_5, L3_6, L4_7)
  L4_7 = 214
  L5_8 = 10091
  L1_4(L2_5, L3_6, L4_7, L5_8)
  L4_7 = 214
  L5_8 = 10093
  L1_4(L2_5, L3_6, L4_7, L5_8)
  L1_4(L2_5, L3_6)
  L1_4(L2_5, L3_6)
  L4_7 = nil
  L5_8 = "TOG_itemDetail"
  if L1_4 == 1 then
    L1_4.sdsize = true
  else
    L1_4.sdsize = false
  end
  L4_7 = false
  L1_4(L2_5, L3_6, L4_7)
  L4_7 = false
  L5_8 = true
  L1_4(L2_5, L3_6, L4_7, L5_8)
end
function ItemListWidget.initListBox(A0_9, A1_10)
  local L2_11, L3_12
  L3_12 = A0_9
  L2_11 = A0_9.getListBoxName
  L2_11 = L2_11(L3_12, A1_10)
  if L2_11 ~= "" then
    L3_12 = A0_9.setControlProperty
    L3_12(A0_9, L2_11, "IntData.Value0", A1_10)
    L3_12 = A0_9.setControlCommandCondition
    L3_12(A0_9, L2_11, "UILuaCommands.MouseEnteredItem")
    L3_12 = A0_9.setControlCommandCondition
    L3_12(A0_9, L2_11, "UILuaCommands.AnchoredItem")
    L3_12 = A0_9.setControlCommandCondition
    L3_12(A0_9, L2_11, "UILuaCommands.Selection")
    L3_12 = A0_9.setCancelCondition
    L3_12(A0_9, L2_11)
    L3_12 = A0_9.setVisibility
    L3_12(A0_9, L2_11, true)
    L3_12 = "TextBlock_NoContents_"
    L3_12 = L3_12 .. tostring(A1_10)
    A0_9:setVisibility(L3_12, false)
    A0_9:setCancelCondition(L3_12)
    A0_9:setControlProperty(L3_12, "IsTabStop", true)
    A0_9:setControlCommandCondition(L2_11, "UILuaCommands.Previous")
    A0_9:setControlCommandCondition(L2_11, "UILuaCommands.Next")
  end
end
function ItemListWidget.setInitialData(A0_13, A1_14, A2_15)
  A0_13:setModal(A1_14)
  A0_13:resetListBox(1)
  A0_13:resetListBox(2)
  A0_13:resetListBox(3)
  A0_13:resetListBox(4)
  A0_13:resetListBox(5)
  A0_13:resetListBox(6)
  A0_13:makeListFromPackage()
  A0_13:makeDropItemList()
  A0_13:makeMoneyList()
  if A2_15 == 3 then
    A0_13:setSelectedIndex("TabControl_ItemList", 4)
    A0_13.work.listbox = 5
    A0_13:changeList()
    A0_13:setText("TextBlock_Title", 3213)
  else
    A0_13.work.listbox = 1
    A0_13:changeList()
    A0_13:setText("TextBlock_Title", 3207)
  end
  A0_13:updateWindowDisplay(true)
end
function ItemListWidget.resetListBox(A0_16, A1_17)
  local L2_18, L3_19
  L3_19 = A0_16
  L2_18 = A0_16.getListBoxItemNum
  L2_18 = L2_18(L3_19, A1_17)
  L3_19 = A0_16.getListPropertyName
  L3_19 = L3_19(A0_16, A1_17)
  if L2_18 < 1 then
    return
  else
    for _FORV_7_ = 1, L2_18 do
      L2_18 = L2_18 - 1
      A0_16:deleteListProperty(L3_19, L2_18)
    end
    A0_16:updateListProperty(L3_19)
  end
  return
end
function ItemListWidget.processBeforeShow(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25, L6_26, L7_27
  if A1_21 == true then
    L2_22 = A0_20.work
    L2_22 = L2_22.submenu
    if L2_22 ~= true then
      L2_22 = A0_20.work
      L2_22 = L2_22.editWidgetOpen
    else
      if L2_22 > 0 then
        L2_22 = A0_20.work
        L2_22 = L2_22.editWidgetOpen
        if L2_22 == 2 then
          L3_23 = A0_20
          L2_22 = A0_20.closeBazaarEdit
          L4_24 = true
          L2_22(L3_23, L4_24)
        else
          L2_22 = A0_20.work
          L2_22 = L2_22.editWidgetOpen
          if L2_22 == 1 then
            L3_23 = A0_20
            L2_22 = A0_20.closeItemEdit
            L4_24 = true
            L2_22(L3_23, L4_24)
          else
            L2_22 = A0_20.work
            L2_22 = L2_22.editWidgetOpen
            if L2_22 ~= 3 then
              L2_22 = A0_20.work
              L2_22 = L2_22.editWidgetOpen
            else
              if L2_22 == 4 then
                L3_23 = A0_20
                L2_22 = A0_20.closeItemShare
                L4_24 = true
                L2_22(L3_23, L4_24)
            end
            else
              L2_22 = A0_20.work
              L2_22 = L2_22.submenu
              if L2_22 == true then
                L3_23 = A0_20
                L2_22 = A0_20.closeSubWidget
                L2_22(L3_23)
              end
            end
          end
        end
    end
    else
      L3_23 = A0_20
      L2_22 = A0_20.updateWindowDisplay
      L4_24 = true
      L2_22(L3_23, L4_24)
      L2_22 = A0_20.work
      L2_22 = L2_22.repair
      if L2_22 == true then
        L2_22 = worldMaster
        L3_23 = L2_22
        L2_22 = L2_22._getMyPlayer
        L2_22 = L2_22(L3_23)
        L3_23 = A0_20.work
        L3_23 = L3_23.repairindex
        L3_23 = L3_23 - 7
        L4_24 = A0_20.work
        L4_24 = L4_24.repairindex
        L4_24 = L4_24 + 15
        if L3_23 < 1 then
          L3_23 = 1
        end
        L6_26 = L2_22
        L5_25 = L2_22._getItemPackageCapacity
        L7_27 = 1
        L5_25 = L5_25(L6_26, L7_27)
        if L4_24 > L5_25 then
          L4_24 = L5_25
        end
        L6_26 = nil
        L7_27 = L4_24
        for _FORV_11_ = L3_23, L4_24 do
          L6_26 = L2_22:_getItem(1, L7_27)
          if L6_26 ~= nil and A0_20.work.repairitem == L6_26:_getCatalogID() and A0_20.work.repairlife == L6_26:getItemLife() then
            break
          end
          L7_27 = L7_27 - 1
        end
        if L6_26 ~= nil then
          A0_20.work.demandSync = desktopWidget:updateItemWork(L6_26)
        end
        A0_20.work.repair = false
      end
    end
  end
  L2_22 = true
  return L2_22
end
function ItemListWidget.processAfterShow(A0_28, A1_29)
  local L2_30
  if A1_29 then
  end
  L2_30 = true
  return L2_30
end
function ItemListWidget.processUICommandOperate(A0_31, A1_32, A2_33, A3_34, A4_35)
  if A0_31.work.editWidgetOpen ~= 0 then
    return false
  end
  if 0 < A0_31.work.updatecount then
    return false
  end
  if A2_33 == "Button_SortStatus" then
    A0_31:operateSort()
  elseif A2_33 == "Button_ListClose" then
    A0_31:closeMateriaList()
  end
end
function ItemListWidget.processUICommandCancel(A0_36, A1_37, A2_38, A3_39, A4_40)
  if A2_38 == "Button_ListClose" then
    A0_36:closeMateriaList()
    return
  end
  A0_36:previousSequence()
end
function ItemListWidget.processUICommandClose(A0_41, A1_42, A2_43, A3_44, A4_45)
  A0_41:previousSequence()
end
function ItemListWidget.processUICommandSelection(A0_46, A1_47, A2_48, A3_49, A4_50)
  if A0_46.work.editWidgetOpen ~= 0 then
    return
  end
  if 0 < A0_46.work.updatecount then
    return
  end
  if desktopWidget:checkKeyboardFocused(A0_46) == false then
    return
  end
  if A3_49 == nil or A3_49 < 0 then
    return
  end
  A0_46.work.focus = A3_49
  A0_46.work.listbox = A4_50
  if A0_46:getListBoxItemNum(A0_46.work.listbox) == 0 then
    A0_46:updateWindowDisplay(true)
    return
  end
  if A0_46.work.focus >= A0_46:getListBoxFocusNum(A0_46.work.listbox) then
    A0_46:updateListFocus()
    return
  end
  A0_46:updateWindowDisplay(true)
  if A0_46.work.waittrash ~= false then
    return
  end
  A0_46.work.chosenPackage = A0_46:getPackageFromList(A0_46.work.listbox)
  A0_46.work.chosenItem = A0_46.work.index + 1
  if A0_46.work.listbox ~= 6 then
    A0_46:openSubWidget()
    A0_46:selectedBorder(A0_46.work.index, true)
  end
end
function ItemListWidget.processUICommandDefault(A0_51, A1_52, A2_53, A3_54, A4_55, A5_56)
  if A0_51.work.editWidgetOpen ~= 0 then
    return false
  end
  if 0 < A0_51.work.updatecount then
    return false
  end
  if desktopWidget:checkKeyboardFocused(A0_51) == false then
    return
  end
  if A3_54 == "UILuaCommands.MouseEnteredItem" or A3_54 == "UILuaCommands.AnchoredItem" then
    if A5_56 == nil then
      return
    end
    if A4_55 == nil or A4_55 < 0 then
      return
    end
    A0_51.work.focus = A4_55
    A0_51.work.listbox = A5_56
    A0_51:setCommonTimer(0.2)
  elseif A3_54 == "UILuaCommands.TabChanged" then
    A0_51.work.listbox = 0 + A0_51:getSelectedTab()
    A0_51:changeList()
  elseif A3_54 == "UILuaCommands.Previous" then
    A0_51:catalogSkip(-1)
  elseif A3_54 == "UILuaCommands.Next" then
    A0_51:catalogSkip(1)
  end
end
function ItemListWidget.processTimer(A0_57)
  if A0_57:focusToIndex(A0_57.work.listbox, A0_57.work.focus) >= 0 then
    A0_57.work.index = A0_57:focusToIndex(A0_57.work.listbox, A0_57.work.focus)
  end
  A0_57.work.page = 0
  A0_57:updateWindowDisplay(true)
  A0_57:selectedBorder()
end
function ItemListWidget.catalogSkip(A0_58, A1_59)
  local L2_60, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66, L9_67, L10_68, L11_69, L12_70, L13_71
  L2_60 = A0_58.work
  L2_60 = L2_60.focus
  L4_62 = A0_58
  L3_61 = A0_58.getListBoxFocusNum
  L5_63 = A0_58.work
  L5_63 = L5_63.listbox
  L3_61 = L3_61(L4_62, L5_63)
  L3_61 = L3_61 - 1
  if L3_61 == -1 then
    return
  end
  L4_62 = 2
  L5_63 = A0_58.work
  L5_63 = L5_63.listbox
  if L5_63 ~= 1 then
    L5_63 = 10 * A1_59
    L2_60 = L2_60 + L5_63
  else
    L5_63 = A0_58.work
    L5_63 = L5_63.sorttype
    if L5_63 == 0 then
      L5_63 = 10 * A1_59
      L2_60 = L2_60 + L5_63
    else
      L5_63 = nil
      if A1_59 > 0 then
        L6_64 = A0_58.work
        L6_64 = L6_64.focus
        L5_63 = L3_61 - L6_64
      else
        L6_64 = A0_58.work
        L5_63 = L6_64.focus
      end
      L7_65 = A0_58
      L6_64 = A0_58.getListPropertyName
      L8_66 = A0_58.work
      L8_66 = L8_66.listbox
      L6_64 = L6_64(L7_65, L8_66)
      L7_65 = desktopWidget
      L8_66 = L7_65
      L7_65 = L7_65.getItemSortKey
      L12_70 = 1
      L13_71 = L4_62
      L7_65 = L7_65(L8_66, L9_67, L10_68, L11_69, L12_70, L13_71)
      L8_66 = L2_60
      for L12_70 = 1, L5_63 do
        L8_66 = L8_66 + A1_59
        L13_71 = A0_58.focusToIndex
        L13_71 = L13_71(A0_58, A0_58.work.listbox, L8_66)
        if L7_65 ~= desktopWidget:getItemSortKey(A0_58, L6_64, L13_71, 1, L4_62) then
          L2_60 = L2_60 + L12_70 * A1_59
          break
        end
        if L12_70 == L5_63 then
          if A1_59 > 0 then
            L2_60 = L3_61
          else
            L2_60 = 0
          end
        end
      end
    end
  end
  if L3_61 < L2_60 then
    L2_60 = L3_61
  elseif L2_60 < 0 then
    L2_60 = 0
  end
  L5_63 = A0_58.work
  L5_63 = L5_63.focus
  if L2_60 ~= L5_63 then
    L5_63 = A0_58.work
    L5_63.focus = L2_60
    L6_64 = A0_58
    L5_63 = A0_58.updateWindowDisplay
    L7_65 = true
    L5_63(L6_64, L7_65)
  end
end
function ItemListWidget.getListPropertyName(A0_72, A1_73)
  return "TabItem_" .. tostring(A1_73) .. "_Maker"
end
function ItemListWidget.updateWindowDisplay(A0_74, A1_75)
  A0_74:setGridVisibility(8)
  if A0_74.work.isMateriaList then
    A0_74:setVisibility("Grid_MateriaEquipList", true)
    A0_74:setVisibility("Grid_TabList", false)
  end
  if A0_74.work.listbox == 1 then
    A0_74:setVisibility("Button_SortStatus", true)
    A0_74:displaySortType(A0_74.work.sorttype)
  else
    A0_74:setVisibility("Button_SortStatus", false)
  end
  if A1_75 == true then
    A0_74:updateListFocus()
  end
end
function ItemListWidget.updateListFocus(A0_76)
  local L1_77, L2_78
  L1_77 = A0_76.work
  L1_77 = L1_77.updatecount
  if L1_77 ~= 0 then
    L1_77 = false
    return L1_77
  end
  L2_78 = A0_76
  L1_77 = A0_76.getListBoxName
  L1_77 = L1_77(L2_78, A0_76.work.listbox)
  L2_78 = "TextBlock_NoContents_"
  L2_78 = L2_78 .. tostring(A0_76.work.listbox)
  if A0_76.work.closeok == true then
    if A0_76.work.submenu == true and A0_76:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
      A0_76:getChildWidgetByWindowName("ItemSubWidget"):hide()
      A0_76.work.submenu = false
      A0_76.work.closeok = false
    end
    if A0_76.work.editWidgetOpen == 2 then
      A0_76:closeBazaarEdit(true)
      A0_76.work.closeok = false
    elseif A0_76.work.editWidgetOpen == 1 then
      A0_76:closeItemEdit(true)
      A0_76.work.closeok = false
    elseif A0_76.work.editWidgetOpen == 3 or A0_76.work.editWidgetOpen == 4 then
      A0_76:closeItemShare(true)
      A0_76.work.closeok = false
    end
  end
  if A0_76:getListBoxFocusNum(A0_76.work.listbox) == 0 then
    A0_76:setVisibility(L2_78, true)
    A0_76:setVisibility(L1_77, false)
    A0_76.work.editWidgetOpen = 0
    A0_76:displayFocusedItemHelp()
    A0_76:setWindowFocus(L2_78)
  else
    A0_76:setVisibility(L1_77, true)
    A0_76:setVisibility(L2_78, false)
    if A0_76.work.focus > A0_76:getListBoxFocusNum(A0_76.work.listbox) - 1 then
      A0_76.work.focus = A0_76:getListBoxFocusNum(A0_76.work.listbox) - 1
    end
    if 0 <= A0_76:focusToIndex(A0_76.work.listbox, A0_76.work.focus) then
      A0_76.work.index = A0_76:focusToIndex(A0_76.work.listbox, A0_76.work.focus)
    end
    A0_76:setControlProperty(L1_77, "SqwtFocusedIndex", A0_76.work.focus)
    A0_76:setFocusedIndex(L1_77, A0_76.work.focus)
    A0_76:setWindowFocus(L1_77)
    A0_76:displayFocusedItemHelp()
  end
end
function ItemListWidget.setGridVisibility(A0_79, A1_80)
  A0_79:setVisibility("Grid_TabList", true)
  A0_79:setVisibility("Grid_ActorName", A1_80 == 11 or A1_80 == 12)
  A0_79:setVisibility("Grid_Help", A1_80 == 0 or A1_80 == 1 or A1_80 == 2 or A1_80 == 6 or A1_80 == 7 or A1_80 == 12)
  A0_79:setVisibility("Grid_BackpackAndGil", true)
  A0_79:setVisibility("Grid_ItemNameBase", A1_80 == 3 or A1_80 == 4 or A1_80 == 5 or A1_80 == 8 or A1_80 == 9 or A1_80 == 10)
  A0_79:setVisibility("Grid_ItemDetail1", A0_79.work.bonus1)
  A0_79:setVisibility("Grid_ItemDetail2", A0_79.work.bonus2)
  A0_79:setVisibility("Grid_ItemDetail3", A0_79.work.bonus3 or A0_79.work.itemlife or A0_79.work.bazaar or A0_79.work.materiaOrder)
  A0_79:setVisibility("Label_ItemBonus5", A0_79.work.bonus3)
  A0_79:setVisibility("Grid_ItemLife", A0_79.work.itemlife)
  A0_79:setVisibility("Grid_ItemBazaarInformation", A0_79.work.bazaar)
  A0_79:setVisibility("Grid_MateriaAttachBazaarInformation", A0_79.work.materiaOrder)
end
function ItemListWidget.setWindowFocus(A0_81, A1_82)
  if A1_82 ~= nil and A1_82 ~= "" then
    A0_81:setLogicalFocus(A1_82)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_81 then
      A0_81:setKeyboardFocusedControl(A1_82)
    end
  end
end
function ItemListWidget.displayBagcapacityAndMoney(A0_83)
  local L1_84, L2_85, L3_86
  L1_84 = worldMaster
  L2_85 = L1_84
  L1_84 = L1_84._getMyPlayer
  L1_84 = L1_84(L2_85)
  L3_86 = L1_84
  L2_85 = L1_84.getMoneyOnHand
  L2_85 = L2_85(L3_86)
  L3_86 = A0_83.setText
  L3_86(A0_83, "TextBlock_Gil", 3263, L2_85)
  L3_86 = L1_84._getItemPackageCapacity
  L3_86 = L3_86(L1_84, 1)
  A0_83:setText("TextBlock_ItemStack_2", 3551, L3_86 - L1_84:_getItemPackageFreeSpace(1), L3_86)
end
function ItemListWidget.isExistItem(A0_87, A1_88, A2_89, A3_90)
  if A3_90 == nil or A3_90 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_88, A2_89) ~= nil then
      return true
    else
      return false
    end
  elseif A3_90 == 2 then
    if desktopWidget:getBazaarItem(A1_88, A2_89) ~= nil then
      return true
    else
      return false
    end
  end
end
function ItemListWidget.checkPackageAndIndex(A0_91, A1_92, A2_93, A3_94, A4_95)
  if A4_95 == nil or A4_95 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A2_93, A3_94) == A1_92 then
      return true
    else
      return false
    end
  elseif A4_95 == 2 then
    if desktopWidget:getBazaarItem(A2_93, A3_94) == A1_92 then
      return true
    else
      return false
    end
  end
end
function ItemListWidget.getSelectedTab(A0_96)
  return A0_96:getSelectedIndex("TabControl_ItemList") + 1
end
function ItemListWidget.getListBoxName(A0_97, A1_98)
  return "ListBox_TabItem_" .. tostring(A1_98)
end
function ItemListWidget.getListBoxItemNum(A0_99, A1_100)
  local L2_101, L3_102
  L3_102 = A0_99
  L2_101 = A0_99.getListPropertyCount
  return L2_101(L3_102, A0_99:getListPropertyName(A1_100))
end
function ItemListWidget.getListBoxFocusNum(A0_103, A1_104)
  local L2_105, L3_106, L4_107, L5_108
  L3_106 = A0_103
  L2_105 = A0_103.getListBoxItemNum
  L4_107 = A1_104
  L2_105 = L2_105(L3_106, L4_107)
  L4_107 = A0_103
  L3_106 = A0_103.getListPropertyName
  L5_108 = A1_104
  L3_106 = L3_106(L4_107, L5_108)
  if L2_105 < 1 then
    L4_107 = 0
    L5_108 = 0
    return L4_107, L5_108, 0, 0
  end
  L5_108 = A0_103
  L4_107 = A0_103.getControlProperty
  L4_107 = L4_107(L5_108, L3_106, "FilteredCount")
  L5_108 = A0_103.work
  L5_108 = L5_108.focus
  if L4_107 < A0_103.work.focus then
    L5_108 = L4_107 - 1
  end
  return L4_107, L4_107 - 1, 0, L5_108
end
function ItemListWidget.focusToIndex(A0_109, A1_110, A2_111)
  local L3_112
  L3_112 = A0_109.getListPropertyName
  L3_112 = L3_112(A0_109, A1_110)
  if A0_109:getListBoxFocusNum(A1_110) < 1 or A2_111 >= A0_109:getListBoxFocusNum(A1_110) then
    return -1
  else
    A0_109:setControlProperty(L3_112, "FilteredIndex", A2_111)
    return A0_109:getControlProperty(L3_112, "Index")
  end
end
function ItemListWidget.indexToFocus(A0_113, A1_114, A2_115)
  local L3_116, L4_117
  L3_116 = -1
  L4_117 = A0_113.getListPropertyName
  L4_117 = L4_117(A0_113, A1_114)
  if A0_113:getListBoxFocusNum(A1_114) > 0 then
    A0_113:setControlProperty(L4_117, "Index", A2_115)
    L3_116 = A0_113:getControlProperty(L4_117, "FilteredIndex")
  end
  return L3_116
end
function ItemListWidget.getPackageFromList(A0_118, A1_119)
  local L2_120
  L2_120 = 1
  if A1_119 == 1 then
    L2_120 = 1
  elseif A1_119 == 2 then
    L2_120 = 100
  elseif A1_119 == 3 then
    L2_120 = 8
  elseif A1_119 == 4 then
    L2_120 = 6
  elseif A1_119 == 5 then
    L2_120 = 5
  elseif A1_119 == 6 then
    L2_120 = 100
  end
  return L2_120
end
function ItemListWidget.setItemToXmlLight(A0_121, A1_122, A2_123, A3_124, A4_125, A5_126)
  local L6_127, L7_128, L8_129, L9_130, L10_131, L11_132, L12_133, L13_134, L14_135, L15_136, L16_137, L17_138
  L7_128 = A0_121
  L6_127 = A0_121.getListPropertyName
  L8_129 = A1_122
  L6_127 = L6_127(L7_128, L8_129)
  L7_128, L8_129, L9_130, L10_131 = nil, nil, nil, nil
  L11_132 = worldMaster
  L12_133 = L11_132
  L11_132 = L11_132._getMyPlayer
  L11_132 = L11_132(L12_133)
  L12_133, L13_134 = nil, nil
  if A3_124 > 0 and A4_125 > 0 then
    L15_136 = L11_132
    L14_135 = L11_132._getItem
    L16_137 = A3_124
    L17_138 = A4_125
    L14_135 = L14_135(L15_136, L16_137, L17_138)
    L12_133 = L14_135
  end
  if L12_133 == nil then
    L14_135 = false
    return L14_135
  end
  L15_136 = L12_133
  L14_135 = L12_133._getCatalogID
  L14_135 = L14_135(L15_136)
  L7_128 = L14_135
  L15_136 = L12_133
  L14_135 = L12_133.getItemIcon
  L14_135 = L14_135(L15_136)
  L8_129 = L14_135
  L15_136 = L12_133
  L14_135 = L12_133._isStackable
  L14_135 = L14_135(L15_136)
  L9_130 = L14_135
  L15_136 = L12_133
  L14_135 = L12_133._countStack
  L14_135 = L14_135(L15_136)
  L10_131 = L14_135
  L15_136 = L12_133
  L14_135 = L12_133._getNameIndex
  L14_135 = L14_135(L15_136)
  L15_136 = "TBL_null"
  L16_137 = A0_121.work
  L16_137 = L16_137.isRewardMode
  if L16_137 == true then
    L16_137 = A0_121.work
    L16_137 = L16_137.rewardItemPackage
    if L16_137 == A3_124 then
      L16_137 = A0_121.work
      L16_137 = L16_137.rewardItem
      if L16_137 == A4_125 then
        L15_136 = "TBL_selectedItem"
      end
    end
  end
  L16_137 = A0_121.work
  L16_137 = L16_137.sorttype
  L17_138 = 1
  if A1_122 == 1 then
    break
  else
  end
  if A1_122 == 2 then
    L16_137 = 11
    L17_138 = 2
    break
  else
  end
  if A1_122 == 3 then
    L16_137 = 0
    L17_138 = 3
    break
  else
  end
  if A1_122 == 4 then
    L16_137 = 0
    L17_138 = 26
    break
  else
  end
  if A1_122 == 5 then
    L16_137 = 0
    L17_138 = 4
    break
  else
  end
  if A1_122 == 6 then
    L16_137 = 12
    L17_138 = 5
    break
  else
  end
  desktopWidget:setItemToXml(A0_121, L6_127, A2_123, L12_133, L15_136, L7_128, L8_129, L9_130, L10_131, L14_135, L16_137, true, false, L17_138, A3_124, A4_125, A5_126, false)
  desktopWidget:setItemDetailToXml(A0_121, L6_127, A2_123, L12_133, L14_135, A5_126, L17_138, true)
  if L17_138 == 5 then
    if 0 < L11_132:getGrandCompanyRank(1) and (L7_128 == 1000202 or L7_128 == 1000203) then
      A0_121:setListPropertyVisibility(L6_127, A2_123, false)
    end
    if 0 < L11_132:getGrandCompanyRank(2) and (L7_128 == 1000201 or L7_128 == 1000203) then
      A0_121:setListPropertyVisibility(L6_127, A2_123, false)
    end
    if 0 < L11_132:getGrandCompanyRank(3) and (L7_128 == 1000201 or L7_128 == 1000202) then
      A0_121:setListPropertyVisibility(L6_127, A2_123, false)
    end
  end
  if 0 < A0_121.work.updatecount and A0_121.work.listbox == A1_122 and A0_121:getControlProperty(L6_127, "FilteredIndex") < A0_121.work.focus then
    A0_121.work.focusChange = true
  end
  return true
end
function ItemListWidget.setSortType(A0_139, A1_140, A2_141)
  local L3_142, L4_143
  L3_142 = worldMaster
  L4_143 = L3_142
  L3_142 = L3_142._getMyPlayer
  L3_142 = L3_142(L4_143)
  L4_143 = L3_142._getItem
  L4_143 = L4_143(L3_142, 1, A2_141 + 1)
  if L4_143 == nil then
    return
  end
  desktopWidget:setSortType(A0_139, A1_140, A2_141, A0_139.work.sorttype, L4_143)
end
function ItemListWidget.updateSortType(A0_144)
  local L1_145
  L1_145 = A0_144.getListPropertyName
  L1_145 = L1_145(A0_144, 1)
  for _FORV_5_ = 1, A0_144:getListBoxItemNum(1) do
    A0_144:setSortType(L1_145, _FORV_5_ - 1)
  end
  A0_144:updateListProperty(L1_145)
end
function ItemListWidget.setBazaarLabelVisibility(A0_146, A1_147, A2_148, A3_149)
  local L4_150, L5_151
  L4_150 = "Visible"
  if A3_149 == 1 then
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "bazaarStatus", 378)
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "priceStyle", "TBL_parameterPlus")
  elseif A3_149 == 7 then
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "bazaarStatus", 453)
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "priceStyle", "TBL_parameterPlus")
    L5_151 = A0_146.getListProperty
    L5_151 = L5_151(A0_146, A1_147, A2_148, "stackCount")
    if A0_146:getListProperty(A1_147, A2_148, "stackable") == 1 then
      A0_146:setListProperty(A1_147, A2_148, "stack", "(" .. tostring(L5_151) .. ")")
    end
  elseif A3_149 == 2 then
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "bazaarStatus", 379)
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "priceStyle", "TBL_parameterMinus")
    L5_151 = A0_146.getListProperty
    L5_151 = L5_151(A0_146, A1_147, A2_148, "stackCount")
    if A0_146:getListProperty(A1_147, A2_148, "stackable") == 1 then
      A0_146:setListProperty(A1_147, A2_148, "stack", "(" .. tostring(L5_151) .. ")")
    end
  elseif A3_149 == 3 then
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "bazaarStatus", 380)
    L5_151 = A0_146.setListProperty
    L5_151(A0_146, A1_147, A2_148, "priceStyle", "TBL_guildleveBonus")
  else
    L5_151 = A0_146.getListProperty
    L5_151 = L5_151(A0_146, A1_147, A2_148, "nameStyle")
    A0_146:setListProperty(A1_147, A2_148, "priceStyle", L5_151)
    L4_150 = "Hidden"
  end
  L5_151 = A0_146.setListProperty
  L5_151(A0_146, A1_147, A2_148, "bazaarStatusVisibility", L4_150)
end
function ItemListWidget.updateBazaarLabel(A0_152, A1_153, A2_154)
  local L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162, L11_163, L12_164, L13_165, L14_166, L15_167, L16_168, L17_169, L18_170, L19_171, L20_172, L21_173, L22_174, L23_175
  L13_165 = A0_152
  L12_164 = A0_152.getListPropertyName
  L14_166 = A1_153
  L12_164 = L12_164(L13_165, L14_166)
  L13_165, L14_166 = nil, nil
  L15_167 = 1
  L17_169 = A0_152
  L16_168 = A0_152.getListBoxItemNum
  L16_168 = L16_168(L17_169, L18_170)
  L17_169 = 8
  for L21_173 = L15_167 - 1, L16_168 - 1 do
    L14_166 = L21_173 + 1
    L23_175 = A0_152
    L22_174 = A0_152.isExistItem
    L22_174 = L22_174(L23_175, L17_169, L14_166, A2_154)
    if L22_174 == false then
      break
    end
    L3_155 = 0
    L22_174 = false
    L23_175 = desktopWidget
    L23_175 = L23_175.isDealingItem
    L23_175 = L23_175(L23_175, L17_169, L14_166)
    L22_174 = L23_175
    if L22_174 == true then
      L23_175 = desktopWidget
      L23_175 = L23_175.getItemDealData
      L5_157, L6_158, L23_175 = L23_175, L17_169, L23_175(L23_175, L17_169, L14_166)
      L4_156 = L23_175
      L23_175 = A0_152.setListProperty
      L23_175(A0_152, L12_164, L21_173, "bazaarkind", L4_156)
      if L4_156 == 11 then
        L3_155 = 1
      elseif L4_156 == 12 then
        L3_155 = 1
      elseif L4_156 == 13 then
        L3_155 = 7
      elseif L4_156 == 20 then
        L3_155 = 4
      elseif L4_156 == 30 then
        L3_155 = 4
      end
      if L3_155 ~= 4 then
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "rewardprice", L5_157)
        L23_175 = A0_152.setListText
        L23_175(A0_152, L12_164, L21_173, "price", 225, L5_157)
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "rewardpackage", 0)
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "rewarditem", 0)
        L23_175 = A0_152.setListPropertyVisibility
        L23_175(A0_152, L12_164, L21_173, true)
      else
        L23_175 = A0_152.setListPropertyVisibility
        L23_175(A0_152, L12_164, L21_173, true)
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "nameStyle", "TBL_selectedItem")
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "opacity", "0.5")
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "rewardprice", 0)
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "rewardpackage", 0)
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "rewarditem", 0)
        L23_175 = A0_152.setListProperty
        L23_175(A0_152, L12_164, L21_173, "price", "")
      end
    else
      L23_175 = false
      L23_175 = desktopWidget:isPlayerItemAttached(L17_169, L14_166)
      if L23_175 == true then
        L4_156, L7_159, L8_160, L9_161 = A0_152:checkRewardDependency(L17_169, L14_166, A2_154)
        if L4_156 ~= 0 then
          if L4_156 == 20 then
            L3_155 = 2
          elseif L4_156 == 30 then
            L3_155 = 3
          end
          if L9_161 ~= 0 then
            A0_152:setListText(L12_164, L21_173, "price", 225, L9_161)
          else
            A0_152:setListText(L12_164, L21_173, "price", 3144)
          end
          A0_152:setListProperty(L12_164, L21_173, "rewardpackage", L7_159)
          A0_152:setListProperty(L12_164, L21_173, "rewarditem", L8_160)
        else
          A0_152:setListProperty(L12_164, L21_173, "rewardpackage", 0)
          A0_152:setListProperty(L12_164, L21_173, "rewarditem", 0)
          A0_152:setListProperty(L12_164, L21_173, "price", "")
        end
      else
        A0_152:setListProperty(L12_164, L21_173, "rewardpackage", 0)
        A0_152:setListProperty(L12_164, L21_173, "rewarditem", 0)
        A0_152:setListProperty(L12_164, L21_173, "price", "")
      end
      A0_152:setListProperty(L12_164, L21_173, "bazaarkind", 0)
      A0_152:setListProperty(L12_164, L21_173, "rewardprice", 0)
      A0_152:setListPropertyVisibility(L12_164, L21_173, true)
    end
    L23_175 = A0_152.setBazaarLabelVisibility
    L23_175(A0_152, L12_164, L21_173, L3_155)
  end
  L18_170(L19_171, L20_172)
end
function ItemListWidget.checkRewardDependency(A0_176, A1_177, A2_178, A3_179)
  local L4_180, L5_181, L6_182, L7_183, L8_184, L9_185, L10_186, L11_187, L12_188, L13_189
  if A1_177 == 0 or A2_178 == 0 or A1_177 == false or A2_178 == false then
    L4_180 = 0
    L5_181 = 0
    L6_182 = 0
    L7_183 = 0
    return L4_180, L5_181, L6_182, L7_183
  end
  L4_180 = 0
  L5_181 = 0
  L6_182 = nil
  L7_183 = 0
  L8_184 = worldMaster
  L9_185 = L8_184
  L8_184 = L8_184._getMyPlayer
  L8_184 = L8_184(L9_185)
  L9_185 = L8_184._getItem
  L9_185 = L9_185(L10_186, L11_187, L12_188)
  L13_189 = 8
  for L13_189 = 1, L11_187(L12_188, L13_189) do
    if A0_176:isExistItem(8, L13_189) == false then
      break
    elseif desktopWidget:isDealingItem(8, L13_189) == true then
      L4_180, L5_181, L6_182 = desktopWidget:getItemDealData(8, L13_189)
      if L6_182 == L9_185 then
        if L8_184:_getItem(8, L13_189):_getCatalogID() == 1000001 then
          L7_183 = L8_184:_getItem(8, L13_189):_countStack()
        end
        return L4_180, 8, L13_189, L7_183
      end
    end
  end
  L13_189 = 0
  return L10_186, L11_187, L12_188, L13_189
end
function ItemListWidget.isRewardItemActor(A0_190, A1_191, A2_192, A3_193, A4_194, A5_195)
  if A1_191 == 0 or A2_192 == 0 or A3_193 == 0 or A4_194 == 0 or A1_191 == false or A2_192 == false or A3_193 == false or A4_194 == false then
    return false
  end
  if worldMaster:_getMyPlayer():_getItem(A1_191, A2_192) == desktopWidget:getItemDealData(A3_193, A4_194) then
    return true
  else
    return false
  end
end
function ItemListWidget.makeListFromPackage(A0_196, A1_197, A2_198)
  local L3_199, L4_200, L5_201, L6_202, L7_203, L8_204, L9_205, L10_206, L11_207, L12_208, L13_209
  L3_199 = worldMaster
  L4_200 = L3_199
  L3_199 = L3_199._getMyPlayer
  L3_199 = L3_199(L4_200)
  L4_200, L5_201, L6_202, L7_203, L8_204, L9_205 = nil, nil, nil, nil, nil, nil
  if A2_198 == nil then
    if A1_197 == 1 or A1_197 == nil then
      L4_200 = 0
      L5_201 = L10_206
      L6_202 = L10_206
      L7_203 = L10_206
      L8_204 = L10_206
      L9_205 = L10_206
      L13_209 = "SourceFirstIndex"
      L10_206(L11_207, L12_208, L13_209, 0)
      L13_209 = "SourceCount"
      L10_206(L11_207, L12_208, L13_209, L7_203)
      L13_209 = "FilteredSortKey"
      L10_206(L11_207, L12_208, L13_209, "sorttype")
      for L13_209 = 1, L7_203 - L8_204 do
        if A0_196:setItemToXmlLight(1, L4_200, 1, L13_209) == true then
          L4_200 = L4_200 + 1
        else
          break
        end
      end
      if L6_202 > L4_200 then
        for L13_209 = L4_200, L6_202 - 1 do
          L6_202 = L6_202 - 1
          A0_196:deleteListProperty(L5_201, L6_202)
        end
      end
      L10_206(L11_207, L12_208)
    end
    if A1_197 == 100 or A1_197 == nil then
      L7_203 = L10_206
      L4_200 = 0
      L6_202 = L10_206
      L5_201 = L10_206
      L9_205 = L10_206
      L13_209 = "SourceFirstIndex"
      L10_206(L11_207, L12_208, L13_209, 0)
      L13_209 = "SourceCount"
      L10_206(L11_207, L12_208, L13_209, L7_203)
      L13_209 = "FilteredSortKey"
      L10_206(L11_207, L12_208, L13_209, "sorttype")
      for L13_209 = 1, L7_203 do
        if A0_196:setItemToXmlLight(2, L4_200, 100, L13_209) == true then
          L4_200 = L4_200 + 1
        else
          break
        end
      end
      if L6_202 > L4_200 then
        for L13_209 = L4_200, L6_202 - 1 do
          L6_202 = L6_202 - 1
          A0_196:deleteListProperty(L5_201, L6_202)
        end
      end
      L10_206(L11_207, L12_208)
    end
    if A1_197 == 8 or A1_197 == nil then
      L7_203 = L10_206
      L4_200 = 0
      L6_202 = L10_206
      L5_201 = L10_206
      L9_205 = L10_206
      L13_209 = "SourceFirstIndex"
      L10_206(L11_207, L12_208, L13_209, 0)
      L13_209 = "SourceCount"
      L10_206(L11_207, L12_208, L13_209, L7_203)
      L13_209 = "FilteredSortKey"
      L10_206(L11_207, L12_208, L13_209, "sorttype")
      for L13_209 = 1, L7_203 do
        if A0_196:setItemToXmlLight(3, L4_200, 8, L13_209) == true then
          L4_200 = L4_200 + 1
        else
          break
        end
      end
      if L6_202 > L4_200 then
        for L13_209 = L4_200, L6_202 - 1 do
          L6_202 = L6_202 - 1
          A0_196:deleteListProperty(L5_201, L6_202)
        end
      end
      if L4_200 > 0 then
        L13_209 = 1
        L10_206(L11_207, L12_208, L13_209)
      else
        L10_206(L11_207, L12_208)
      end
    end
    if A1_197 == 4 or A1_197 == nil then
      L7_203 = L10_206
      L4_200 = 0
      L6_202 = L10_206
      L5_201 = L10_206
      L9_205 = L10_206
      L13_209 = "SourceFirstIndex"
      L10_206(L11_207, L12_208, L13_209, 0)
      L13_209 = "SourceCount"
      L10_206(L11_207, L12_208, L13_209, L7_203)
      L13_209 = "FilteredSortKey"
      L10_206(L11_207, L12_208, L13_209, "sorttype")
      for L13_209 = 1, L7_203 do
        if A0_196:setItemToXmlLight(4, L4_200, 6, L13_209) == true then
          L4_200 = L4_200 + 1
        else
          break
        end
      end
      if L6_202 > L4_200 then
        for L13_209 = L4_200, L6_202 - 1 do
          L6_202 = L6_202 - 1
          A0_196:deleteListProperty(L5_201, L6_202)
        end
      end
      L10_206(L11_207, L12_208)
    end
  else
    if A1_197 == 1 then
    elseif A1_197 == 100 then
    elseif A1_197 == 8 then
    elseif A1_197 == 6 then
    else
      return
    end
    L13_209 = L10_206
    L5_201 = L11_207
    L13_209 = A1_197
    if L11_207 ~= nil then
      L13_209 = L10_206
      L11_207(L12_208, L13_209, A2_198 - 1, A1_197, A2_198)
    else
      L13_209 = L10_206
      L13_209 = A0_196
      L12_208(L13_209, L5_201, L11_207 - 1)
      L13_209 = A0_196
      L12_208(L13_209, L5_201)
    end
  end
  L10_206(L11_207)
end
function ItemListWidget.makeDropItemList(A0_210, A1_211)
  local L2_212, L3_213, L4_214, L5_215, L6_216, L7_217, L8_218, L9_219, L10_220
  L2_212 = worldMaster
  L3_213 = L2_212
  L2_212 = L2_212._getMyPlayer
  L2_212 = L2_212(L3_213)
  L4_214 = L2_212
  L3_213 = L2_212._getItemPackageCapacity
  L5_215 = 5
  L3_213 = L3_213(L4_214, L5_215)
  L4_214 = 0
  L6_216 = A0_210
  L5_215 = A0_210.getListPropertyName
  L5_215 = L5_215(L6_216, L7_217)
  L6_216 = A0_210.setControlProperty
  L10_220 = 5
  L10_220 = 0
  L6_216(L7_217, L8_218, L9_219, L10_220)
  L6_216 = A0_210.setControlProperty
  L10_220 = 5
  L10_220 = L3_213
  L6_216(L7_217, L8_218, L9_219, L10_220)
  L6_216 = A0_210.setControlProperty
  L10_220 = "sorttype"
  L6_216(L7_217, L8_218, L9_219, L10_220)
  L6_216 = A0_210.getListBoxItemNum
  L6_216 = L6_216(L7_217, L8_218)
  if A1_211 == nil then
    for L10_220 = 1, L3_213 do
      if A0_210:setItemToXmlLight(5, L4_214, 5, L10_220) == true then
        L4_214 = L4_214 + 1
      else
        break
      end
    end
    if L6_216 > L4_214 then
      for L10_220 = L4_214, L6_216 - 1 do
        L6_216 = L6_216 - 1
        A0_210:deleteListProperty(L5_215, L6_216)
      end
    end
    L7_217(L8_218, L9_219)
  else
    L10_220 = A1_211
    if L7_217 ~= nil then
      L10_220 = A1_211 - 1
      L7_217(L8_218, L9_219, L10_220, 5, A1_211)
    else
      L10_220 = L5_215
      L8_218(L9_219, L10_220, L7_217 - 1)
      L10_220 = L5_215
      L8_218(L9_219, L10_220)
    end
  end
  L10_220 = 5
  L10_220 = A0_210
  L9_219(L10_220, L8_218, 3231, L7_217)
end
function ItemListWidget.makeMoneyList(A0_221, A1_222)
  local L2_223, L3_224, L4_225, L5_226, L6_227, L7_228, L8_229, L9_230, L10_231
  L2_223 = worldMaster
  L3_224 = L2_223
  L2_223 = L2_223._getMyPlayer
  L2_223 = L2_223(L3_224)
  L4_225 = L2_223
  L3_224 = L2_223._getItemPackageCapacity
  L5_226 = 100
  L3_224 = L3_224(L4_225, L5_226)
  L4_225 = 0
  L6_227 = A0_221
  L5_226 = A0_221.getListPropertyName
  L5_226 = L5_226(L6_227, L7_228)
  L6_227 = A0_221.setControlProperty
  L10_231 = 6
  L10_231 = 0
  L6_227(L7_228, L8_229, L9_230, L10_231)
  L6_227 = A0_221.setControlProperty
  L10_231 = 6
  L10_231 = L3_224
  L6_227(L7_228, L8_229, L9_230, L10_231)
  L6_227 = A0_221.setControlProperty
  L10_231 = "sorttype"
  L6_227(L7_228, L8_229, L9_230, L10_231)
  L6_227 = A0_221.getListBoxItemNum
  L6_227 = L6_227(L7_228, L8_229)
  if A1_222 == nil then
    for L10_231 = 1, L3_224 do
      if A0_221:setItemToXmlLight(6, L4_225, 100, L10_231) == true then
        L4_225 = L4_225 + 1
      else
        break
      end
    end
    if L6_227 > L4_225 then
      for L10_231 = L4_225, L6_227 - 1 do
        L6_227 = L6_227 - 1
        A0_221:deleteListProperty(L5_226, L6_227)
      end
    end
    L7_228(L8_229, L9_230)
  else
    L10_231 = A1_222
    if L7_228 ~= nil then
      L10_231 = A1_222 - 1
      L7_228(L8_229, L9_230, L10_231, 5, A1_222)
    else
      L10_231 = L5_226
      L8_229(L9_230, L10_231, L7_228 - 1)
      L10_231 = L5_226
      L8_229(L9_230, L10_231)
    end
  end
end
function ItemListWidget.getItemBazaarData(A0_232, A1_233, A2_234, A3_235, A4_236, A5_237, A6_238)
  local L7_239, L8_240, L9_241, L10_242, L11_243, L12_244, L13_245, L14_246, L15_247, L16_248, L17_249, L18_250, L19_251, L20_252
  L7_239 = 0
  L8_240 = 0
  L9_241 = 0
  L10_242 = 0
  L11_243 = 0
  L12_244 = 0
  L13_245 = 0
  L14_246 = 0
  L15_247 = ""
  L16_248 = 0
  L17_249 = false
  L18_250 = 0
  L19_251 = false
  L20_252 = false
  if A1_233 ~= nil then
  else
    L7_239 = A0_232:getListProperty(A2_234, A3_235, "bazaarkind")
    L10_242 = A0_232:getListProperty(A2_234, A3_235, "rewardprice")
    L8_240 = A0_232:getListProperty(A2_234, A3_235, "rewardpackage")
    L9_241 = A0_232:getListProperty(A2_234, A3_235, "rewarditem")
    if L8_240 ~= 0 then
      L11_243 = A0_232:getListProperty(A2_234, L9_241 - 1, "bazaarkind")
      L12_244 = A0_232:getListProperty(A2_234, L9_241 - 1, "catalog")
      L13_245 = A0_232:getListProperty(A2_234, L9_241 - 1, "icon")
      L14_246 = A0_232:getListProperty(A2_234, L9_241 - 1, "stackCount")
      L15_247 = A0_232:getListProperty(A2_234, L9_241 - 1, "name")
      L16_248 = A0_232:getListProperty(A2_234, L9_241 - 1, "stackable")
      L17_249 = A0_232:getListProperty(A2_234, L9_241 - 1, "polmax") == "Visible"
      L18_250 = A0_232:getListProperty(A2_234, L9_241 - 1, "mcount")
      L19_251 = A0_232:getListProperty(A2_234, L9_241 - 1, "equipx") == "Visible"
      L20_252 = A0_232:getListProperty(A2_234, L9_241 - 1, "mpvisible") == "Visible"
    end
  end
  return L7_239, L8_240, L9_241, L10_242, L11_243, L12_244, L13_245, L14_246, L15_247, L16_248, L17_249, L18_250, L19_251, L20_252
end
function ItemListWidget.displayBazaarGrid(A0_253, A1_254, A2_255, A3_256, A4_257, A5_258, A6_259)
  local L7_260, L8_261, L9_262, L10_263, L11_264, L12_265, L13_266, L14_267, L15_268, L16_269, L17_270, L18_271, L19_272, L20_273, L21_274, L22_275, L23_276, L24_277, L25_278, L26_279, L27_280, L28_281, L29_282
  L8_261 = A0_253
  L7_260 = A0_253.getItemBazaarData
  L9_262 = nil
  L10_263 = A2_255
  L11_264 = A3_256
  L12_265 = A4_257
  L13_266 = A5_258
  L14_267 = A6_259
  L20_273 = L7_260(L8_261, L9_262, L10_263, L11_264, L12_265, L13_266, L14_267)
  L21_274 = desktopWidget
  L22_275 = L21_274
  L21_274 = L21_274.getItemRepairData
  L23_276 = A0_253
  L24_277 = A1_254
  L26_279 = A0_253
  L25_278 = A0_253.getListPropertyName
  L27_280 = A0_253.work
  L27_280 = L27_280.listbox
  L25_278 = L25_278(L26_279, L27_280)
  L26_279 = A0_253.work
  L26_279 = L26_279.index
  L26_279 = L21_274(L22_275, L23_276, L24_277, L25_278, L26_279)
  L27_280 = false
  L28_281 = false
  L29_282 = false
  if A1_254 ~= nil then
    L27_280 = A1_254:isExclusiveItem()
    L28_281 = A1_254:isRareItem()
    if A6_259 == nil or A6_259 == 1 then
      L29_282 = A1_254:_isEquipping()
    end
  else
    if A0_253:getListProperty(A2_255, A3_256, "ex") == 1 then
      L27_280 = true
    end
    if A0_253:getListProperty(A2_255, A3_256, "rare") == 1 then
      L28_281 = true
    end
    if A0_253:getListProperty(A2_255, A3_256, "isEquipping") == 1 then
      L29_282 = true
    end
  end
  A0_253:setVisibility("IconControl_NotEquiped_2", false)
  A0_253:setVisibility("IconControl_PolishMAX_2", false)
  A0_253:setVisibility("Grid_MateriaNumber", false)
  if L7_260 == 11 then
    A0_253:setVisibility("TextBlock_ItemBazaarSingle", true)
    A0_253:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_253:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_253:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_253:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_253:setIcon("IconControl_ItemBazaarStatus", 378)
    A0_253:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_253:setVisibility("Grid_RewardItem", false)
    A0_253:setVisibility("Grid_RewardMoney", true)
    A0_253:setText("TextBlock_RewardMoney", 3201, L10_263)
    A0_253.work.bazaar = true
  elseif L7_260 == 12 then
    A0_253:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSeparate", true)
    A0_253:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_253:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_253:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_253:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_253:setIcon("IconControl_ItemBazaarStatus", 378)
    A0_253:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_253:setVisibility("Grid_RewardItem", false)
    A0_253:setVisibility("Grid_RewardMoney", true)
    A0_253:setText("TextBlock_RewardMoney", 3201, L10_263)
    A0_253.work.bazaar = true
  elseif L7_260 == 13 then
    A0_253:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSet", true)
    A0_253:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_253:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_253:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_253:setIcon("IconControl_ItemBazaarStatus", 453)
    A0_253:setVisibility("IconControl_ItemBazaarStatus", true)
    A0_253:setVisibility("Grid_RewardItem", false)
    A0_253:setVisibility("Grid_RewardMoney", true)
    A0_253:setText("TextBlock_RewardMoney", 3201, L10_263)
    A0_253.work.bazaar = true
  elseif L7_260 == 20 or L7_260 == 30 then
    A0_253:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_253:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_253:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_253:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_253:setVisibility("IconControl_ItemBazaarStatus", false)
    A0_253:setVisibility("Grid_RewardItem", false)
    A0_253:setVisibility("Grid_RewardMoney", false)
    A0_253.work.bazaar = true
  elseif L8_261 ~= 0 then
    A0_253.work.bazaar = true
    A0_253:setVisibility("Grid_RewardItem", true)
    if L12_265 == 1000001 then
      A0_253:setVisibility("Grid_RewardItem", false)
      A0_253:setVisibility("Grid_RewardMoney", true)
      A0_253:setText("TextBlock_RewardMoney", 3201, L14_267)
    else
      A0_253:setVisibility("Grid_RewardItem", true)
      A0_253:setVisibility("Grid_RewardMoney", false)
      A0_253:setIcon("IconControl_RewardItemIcon", L13_266)
      A0_253:setText("TextBlock_RewardItemName", L15_268)
      if L16_269 == 1 then
        A0_253:setText("TextBlock_RewardItemStack", 3189, L14_267)
        A0_253:setVisibility("TextBlock_RewardItemStack", true)
      else
        A0_253:setText("TextBlock_RewardItemStack", "")
      end
      A0_253:setVisibility("IconControl_PolishMAX_2", L17_270)
      if L18_271 > 0 then
        A0_253:setVisibility("Grid_MateriaNumber", true)
        A0_253:setVisibility("TextBlock_RewardItemStack", false)
        A0_253:setVisibility("TextBlock_MateriaNumber", true)
        A0_253:setText("TextBlock_MateriaNumber", tostring(L18_271))
        A0_253:setVisibility("IconControl_MateriaBase", false)
        A0_253:setVisibility("IconControl_MateriaIcon", true)
      elseif L20_273 == true then
        A0_253:setVisibility("Grid_MateriaNumber", true)
        A0_253:setVisibility("TextBlock_MateriaNumber", false)
        A0_253:setVisibility("TextBlock_RewardItemStack", false)
        A0_253:setVisibility("IconControl_MateriaBase", true)
        A0_253:setVisibility("IconControl_MateriaIcon", false)
      else
        A0_253:setVisibility("IconControl_MateriaBase", false)
        A0_253:setVisibility("IconControl_MateriaIcon", false)
      end
      A0_253:setVisibility("IconControl_NotEquiped_2", L19_272)
    end
    if L11_264 == 20 then
      A0_253:setVisibility("TextBlock_ItemBazaarSingle", false)
      A0_253:setVisibility("TextBlock_ItemBazaarSeparate", false)
      A0_253:setVisibility("TextBlock_ItemBazaarSet", false)
      A0_253:setVisibility("TextBlock_ItemBazaarBuy", true)
      A0_253:setVisibility("TextBlock_ItemBazaarRepair", false)
      A0_253:setVisibility("TextBlock_ItemBazaarReward", true)
      A0_253:setIcon("IconControl_ItemBazaarStatus", 379)
      A0_253:setVisibility("IconControl_ItemBazaarStatus", true)
    elseif L11_264 == 30 then
      A0_253:setVisibility("TextBlock_ItemBazaarSingle", false)
      A0_253:setVisibility("TextBlock_ItemBazaarSeparate", false)
      A0_253:setVisibility("TextBlock_ItemBazaarSet", false)
      A0_253:setVisibility("TextBlock_ItemBazaarBuy", false)
      A0_253:setVisibility("TextBlock_ItemBazaarRepair", true)
      A0_253:setVisibility("TextBlock_ItemBazaarReward", true)
      A0_253:setIcon("IconControl_ItemBazaarStatus", 380)
      A0_253:setVisibility("IconControl_ItemBazaarStatus", true)
    end
  else
    A0_253.work.bazaar = false
    A0_253:setVisibility("TextBlock_ItemBazaarSingle", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSeparate", false)
    A0_253:setVisibility("TextBlock_ItemBazaarSet", false)
    A0_253:setVisibility("TextBlock_ItemBazaarBuy", false)
    A0_253:setVisibility("TextBlock_ItemBazaarRepair", false)
    A0_253:setVisibility("TextBlock_ItemBazaarReward", false)
    A0_253:setVisibility("IconControl_ItemBazaarStatus", false)
    A0_253:setVisibility("Grid_RewardItem", false)
    A0_253:setVisibility("Grid_RewardMoney", false)
  end
  return true
end
function ItemListWidget.displayHelp(A0_283, A1_284)
  A0_283:setText("TextBlock_Help", A1_284)
end
function ItemListWidget.displayFocusedItemHelp(A0_285)
  local L1_286, L2_287, L3_288, L4_289, L5_290, L6_291, L7_292, L8_293, L9_294, L10_295, L11_296, L12_297, L13_298, L14_299, L15_300, L16_301
  L1_286 = A0_285.work
  L1_286 = L1_286.updatecount
  if L1_286 > 0 then
    L1_286 = false
    return L1_286
  end
  L2_287 = A0_285
  L1_286 = A0_285.getListBoxFocusNum
  L3_288 = A0_285.work
  L3_288 = L3_288.listbox
  L1_286 = L1_286(L2_287, L3_288)
  if L1_286 == 0 then
    L2_287 = A0_285
    L1_286 = A0_285.displayHelp
    L3_288 = 3140
    L1_286(L2_287, L3_288)
    L1_286 = A0_285.work
    L1_286.bonus1 = false
    L1_286 = A0_285.work
    L1_286.bonus2 = false
    L1_286 = A0_285.work
    L1_286.bonus3 = false
    L1_286 = A0_285.work
    L1_286.bazaar = false
    L1_286 = A0_285.work
    L1_286.materiaOrder = false
    L1_286 = A0_285.work
    L1_286.itemlife = false
    L1_286 = A0_285.work
    L1_286.page = 0
    L2_287 = A0_285
    L1_286 = A0_285.setGridVisibility
    L3_288 = 0
    L1_286(L2_287, L3_288)
    L1_286 = false
    return L1_286
  end
  L2_287 = A0_285
  L1_286 = A0_285.getListBoxItemNum
  L3_288 = A0_285.work
  L3_288 = L3_288.listbox
  L1_286 = L1_286(L2_287, L3_288)
  L2_287 = A0_285.work
  L2_287 = L2_287.index
  if L1_286 <= L2_287 then
    L1_286 = false
    return L1_286
  end
  L2_287 = A0_285
  L1_286 = A0_285.getListPropertyName
  L3_288 = A0_285.work
  L3_288 = L3_288.listbox
  L1_286 = L1_286(L2_287, L3_288)
  L3_288 = A0_285
  L2_287 = A0_285.getPackageFromList
  L4_289 = A0_285.work
  L4_289 = L4_289.listbox
  L2_287 = L2_287(L3_288, L4_289)
  L3_288 = A0_285.work
  L3_288 = L3_288.index
  L3_288 = L3_288 + 1
  L4_289 = 1
  L5_290 = worldMaster
  L6_291 = L5_290
  L5_290 = L5_290._getMyPlayer
  L5_290 = L5_290(L6_291)
  L6_291 = nil
  if L4_289 == 1 then
    L8_293 = L5_290
    L7_292 = L5_290._getItem
    L9_294 = L2_287
    L10_295 = L3_288
    L7_292 = L7_292(L8_293, L9_294, L10_295)
    L6_291 = L7_292
  elseif L4_289 == 2 then
    L7_292 = desktopWidget
    L8_293 = L7_292
    L7_292 = L7_292.getBazaarItem
    L9_294 = L2_287
    L10_295 = L3_288
    L7_292 = L7_292(L8_293, L9_294, L10_295)
    L6_291 = L7_292
  end
  L7_292 = desktopWidget
  L8_293 = L7_292
  L7_292 = L7_292.setItemDetail
  L9_294 = A0_285
  L10_295 = L6_291
  L12_297 = A0_285
  L11_296 = A0_285.getListPropertyName
  L11_296 = L11_296(L12_297, L13_298)
  L12_297 = A0_285.work
  L12_297 = L12_297.index
  L7_292(L8_293, L9_294, L10_295, L11_296, L12_297, L13_298)
  L7_292 = false
  L9_294 = A0_285
  L8_293 = A0_285.displayBazaarGrid
  L10_295 = L6_291
  L12_297 = A0_285
  L11_296 = A0_285.getListPropertyName
  L11_296 = L11_296(L12_297, L13_298)
  L12_297 = A0_285.work
  L12_297 = L12_297.index
  L8_293 = L8_293(L9_294, L10_295, L11_296, L12_297, L13_298, L14_299)
  L7_292 = L8_293
  L8_293 = nil
  L9_294 = 0
  L10_295 = 0
  L11_296 = 0
  L12_297 = 0
  if L6_291 ~= nil then
    if L13_298 == true then
      for L16_301 = 1, 27 do
        if L6_291:isFitForEquipPoint(L16_301) == true then
          if L9_294 == 0 then
            L9_294 = L16_301
          elseif L10_295 == 0 then
            L10_295 = L16_301
          elseif L11_296 == 0 then
            L11_296 = L16_301
          elseif L12_297 == 0 then
            L12_297 = L16_301
            break
          end
        end
      end
    end
  elseif L4_289 == 1 or L4_289 == 2 then
    L16_301 = A0_285.work
    L16_301 = L16_301.index
    L9_294 = L13_298
    L16_301 = A0_285.work
    L16_301 = L16_301.index
    L10_295 = L13_298
    L16_301 = A0_285.work
    L16_301 = L16_301.index
    L11_296 = L13_298
    L16_301 = A0_285.work
    L16_301 = L16_301.index
    L12_297 = L13_298
  end
  if L9_294 ~= 0 then
    L8_293 = L13_298
  end
  if L8_293 == nil and L10_295 ~= 0 then
    L8_293 = L13_298
  end
  if L8_293 == nil and L11_296 ~= 0 then
    L8_293 = L13_298
  end
  if L8_293 == nil and L12_297 ~= 0 then
    L8_293 = L13_298
  end
  L16_301 = A0_285.work
  L13_298.bonus1, L14_299.bonus2, L15_300.bonus3, L16_301.itemlife = desktopWidget:setItemDetailEquip(A0_285, L6_291, A0_285:getListPropertyName(A0_285.work.listbox), A0_285.work.index, L8_293, false, false, false, false, false, false, nil, true)
  L16_301 = 1
  if L13_298 ~= nil then
    L16_301 = A0_285
    L15_300(L16_301, "TextBlock_MateriaAttachCost", 225, L14_299)
  end
  if L14_299 == 3 then
    L16_301 = "Grid_MateriaPossible"
    L14_299(L15_300, L16_301, 0.5, 0.5, 0.5)
    L16_301 = "ProgressBar_ItemPolish"
    L14_299(L15_300, L16_301, 0.5, 0.5, 0.5)
    L16_301 = "Grid_ItemPolish"
    L14_299(L15_300, L16_301, 1, 73903)
  else
    L16_301 = "Grid_MateriaPossible"
    L14_299(L15_300, L16_301, 1, 1, 1)
    L16_301 = "ProgressBar_ItemPolish"
    L14_299(L15_300, L16_301, 1, 1, 1)
  end
  L16_301 = false
  L14_299(L15_300, L16_301)
end
function ItemListWidget.previousSequence(A0_302)
  A0_302:saveSortType()
  A0_302.work.editWidgetOpen = -1
  desktopWidget:closeWidgetDirect(A0_302)
end
function ItemListWidget.selectedBorder(A0_303, A1_304, A2_305)
  local L3_306, L4_307
  L3_306 = A0_303.getListPropertyName
  L3_306 = L3_306(L4_307, A0_303.work.listbox)
  if A1_304 ~= nil then
    A0_303:setListProperty(L3_306, A0_303.work.index, "selected", L4_307)
    A0_303.work.selected = A0_303.work.index
  elseif L4_307 == -1 then
    return
  else
    for _FORV_7_ = 1, A0_303:getListBoxItemNum(A0_303.work.listbox) do
      A0_303:setListProperty(L3_306, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_307.selected = -1
  end
  L4_307(A0_303, L3_306)
end
function ItemListWidget.changeList(A0_308)
  if A0_308.work.listbox == 5 then
    A0_308.work.mode = 100
    A0_308:setText("TextBlock_Title", 3213)
  else
    A0_308.work.mode = 310
    A0_308:setText("TextBlock_Title", A0_308:getControlProperty("TabItem_" .. tostring(A0_308.work.listbox), "Header"))
  end
  if A0_308.work.listbox == 4 then
    A0_308.work.materiaOrder = true
  end
  A0_308.work.index = 0
  A0_308.work.focus = 0
  return A0_308:updateWindowDisplay(true)
end
function ItemListWidget.operateBazaarSell(A0_309)
  local L1_310, L2_311, L3_312
  L1_310 = false
  L2_311 = desktopWidget
  L3_312 = L2_311
  L2_311 = L2_311.openChildWidget
  L2_311 = L2_311(L3_312, "BazaarEditWidget", A0_309, true, true, 1, A0_309.work.chosenPackage, A0_309.work.chosenItem, nil, A0_309)
  L1_310 = L2_311
  if L1_310 == true then
    L2_311 = A0_309.work
    L2_311.editWidgetOpen = 2
    L2_311 = A0_309.work
    L2_311.lastsub = 2
    L2_311 = worldMaster
    L3_312 = L2_311
    L2_311 = L2_311._getMyPlayer
    L2_311 = L2_311(L3_312)
    L3_312 = L2_311._getItem
    L3_312 = L3_312(L2_311, A0_309.work.chosenPackage, A0_309.work.chosenItem)
    if L3_312:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L3_312) > 0 then
      A0_309:showMateriaList()
      A0_309:setVisibility("Button_ListClose", false)
    end
  end
  return L1_310
end
function ItemListWidget.operateBazaarBuy(A0_313)
  local L1_314, L2_315, L3_316
  L2_315 = A0_313
  L1_314 = A0_313.saveSortType
  L1_314(L2_315)
  L1_314 = false
  L2_315 = desktopWidget
  L3_316 = L2_315
  L2_315 = L2_315.openChildWidget
  L2_315 = L2_315(L3_316, "BazaarEditWidget", A0_313, true, true, 2, A0_313.work.chosenPackage, A0_313.work.chosenItem, nil, A0_313)
  L1_314 = L2_315
  if L1_314 == true then
    L2_315 = A0_313.work
    L2_315.editWidgetOpen = 2
    L2_315 = A0_313.work
    L2_315.lastsub = 3
    L2_315 = worldMaster
    L3_316 = L2_315
    L2_315 = L2_315._getMyPlayer
    L2_315 = L2_315(L3_316)
    L3_316 = L2_315._getItem
    L3_316 = L3_316(L2_315, A0_313.work.chosenPackage, A0_313.work.chosenItem)
    if L3_316:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L3_316) > 0 then
      A0_313:showMateriaList()
      A0_313:setVisibility("Button_ListClose", false)
    end
  end
  return L1_314
end
function ItemListWidget.operateBazaarRepair(A0_317)
  local L1_318, L2_319, L3_320
  L2_319 = A0_317
  L1_318 = A0_317.saveSortType
  L1_318(L2_319)
  L1_318 = false
  L2_319 = desktopWidget
  L3_320 = L2_319
  L2_319 = L2_319.openChildWidget
  L2_319 = L2_319(L3_320, "BazaarEditWidget", A0_317, true, true, 3, A0_317.work.chosenPackage, A0_317.work.chosenItem, nil, A0_317)
  L1_318 = L2_319
  if L1_318 == true then
    L2_319 = A0_317.work
    L2_319.editWidgetOpen = 2
    L2_319 = A0_317.work
    L2_319.lastsub = 4
    L2_319 = worldMaster
    L3_320 = L2_319
    L2_319 = L2_319._getMyPlayer
    L2_319 = L2_319(L3_320)
    L3_320 = L2_319._getItem
    L3_320 = L3_320(L2_319, A0_317.work.chosenPackage, A0_317.work.chosenItem)
    if L3_320:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L3_320) > 0 then
      A0_317:showMateriaList()
      A0_317:setVisibility("Button_ListClose", false)
    end
  end
  return L1_318
end
function ItemListWidget.operateBazaarAbort(A0_321)
  local L1_322, L2_323, L3_324, L4_325, L5_326
  L2_323 = A0_321
  L1_322 = A0_321.getListPropertyName
  L3_324 = A0_321.work
  L3_324 = L3_324.listbox
  L1_322 = L1_322(L2_323, L3_324)
  L3_324 = A0_321
  L2_323 = A0_321.getListProperty
  L4_325 = L1_322
  L5_326 = A0_321.work
  L5_326 = L5_326.index
  L2_323 = L2_323(L3_324, L4_325, L5_326, "bazaarkind")
  if L2_323 == 0 then
    L4_325 = A0_321
    L3_324 = A0_321.getListProperty
    L5_326 = L1_322
    L3_324 = L3_324(L4_325, L5_326, A0_321.work.index, "rewardpackage")
    L5_326 = A0_321
    L4_325 = A0_321.getListProperty
    L4_325 = L4_325(L5_326, L1_322, A0_321.work.index, "rewarditem")
    L5_326 = A0_321.getListProperty
    L5_326 = L5_326(A0_321, L1_322, L4_325 - 1, "bazaarkind")
    if desktopWidget:isPlayerItemAttached(A0_321.work.chosenPackage, A0_321.work.chosenItem) == false then
      return
    end
    if desktopWidget:setItemUndeal(L3_324, L4_325, L5_326) == true then
      A0_321.work.lastsub = 1
      return true
    else
      return false
    end
  else
    L4_325 = A0_321
    L3_324 = A0_321.getListProperty
    L5_326 = L1_322
    L3_324 = L3_324(L4_325, L5_326, A0_321.work.index, "stackCount")
    L4_325 = desktopWidget
    L5_326 = L4_325
    L4_325 = L4_325.setItemUndeal
    L4_325 = L4_325(L5_326, A0_321.work.chosenPackage, A0_321.work.chosenItem, L2_323, 0, L3_324)
    if L4_325 == true then
      L4_325 = A0_321.work
      L4_325.lastsub = 1
      L4_325 = true
      return L4_325
    else
      L4_325 = false
      return L4_325
    end
  end
  L3_324 = true
  return L3_324
end
function ItemListWidget.operateTrash(A0_327)
  local L1_328, L2_329, L3_330, L4_331
  L2_329 = A0_327
  L1_328 = A0_327.getListPropertyName
  L3_330 = A0_327.work
  L3_330 = L3_330.listbox
  L1_328 = L1_328(L2_329, L3_330)
  L2_329 = false
  L3_330 = desktopWidget
  L4_331 = L3_330
  L3_330 = L3_330.openChildWidget
  L3_330 = L3_330(L4_331, "ItemEditWidget", A0_327, true, true, 3, A0_327.work.chosenPackage, A0_327.work.chosenItem, nil, A0_327)
  L2_329 = L3_330
  if L2_329 == true then
    L3_330 = A0_327.work
    L3_330.editWidgetOpen = 1
    L3_330 = A0_327.work
    L3_330.lastsub = 8
    L3_330 = worldMaster
    L4_331 = L3_330
    L3_330 = L3_330._getMyPlayer
    L3_330 = L3_330(L4_331)
    L4_331 = L3_330._getItem
    L4_331 = L4_331(L3_330, A0_327.work.chosenPackage, A0_327.work.chosenItem)
    if L4_331:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L4_331) > 0 then
      A0_327:showMateriaList()
      A0_327:setVisibility("Button_ListClose", false)
    end
  end
  return L2_329
end
function ItemListWidget.operateGetDrop(A0_332)
  local L1_333, L2_334, L3_335, L4_336
  L1_333 = worldMaster
  L2_334 = L1_333
  L1_333 = L1_333._getMyPlayer
  L1_333 = L1_333(L2_334)
  L3_335 = L1_333
  L2_334 = L1_333._getItem
  L4_336 = 5
  L2_334 = L2_334(L3_335, L4_336, A0_332.work.chosenItem)
  if L2_334 ~= nil then
    L4_336 = L2_334
    L3_335 = L2_334._countStack
    L3_335 = L3_335(L4_336)
    L4_336 = L2_334.getItemProperPackage
    L4_336 = L4_336(L2_334)
    if desktopWidget:executePlayerItemMovePackage(5, A0_332.work.chosenItem, L4_336, L3_335) == true then
      A0_332.work.lastsub = 6
      return true
    else
      return true
    end
    return true
  end
end
function ItemListWidget.operateShareDrop(A0_337)
  local L1_338
  L1_338 = false
  if A0_337.work.chosenPackage == 5 then
    L1_338 = desktopWidget:openChildWidget("ItemShareWidget", A0_337, true)
    if L1_338 == true then
      A0_337.work.editWidgetOpen = 3
      A0_337.work.lastsub = 7
    end
  end
  return true
end
function ItemListWidget.operateRepair(A0_339)
  local L1_340, L2_341, L3_342, L4_343, L5_344, L6_345, L7_346, L8_347, L9_348, L10_349, L11_350, L12_351, L13_352, L14_353, L15_354
  L1_340 = false
  L2_341 = desktopWidget
  L3_342 = L2_341
  L2_341 = L2_341.cannotExecuteWithErrorMessage
  L2_341 = L2_341(L3_342)
  if L2_341 then
    L2_341 = false
    return L2_341
  end
  L2_341 = A0_339.work
  L2_341 = L2_341.chosenPackage
  if L2_341 == 1 then
    L2_341 = worldMaster
    L3_342 = L2_341
    L2_341 = L2_341._getMyPlayer
    L2_341 = L2_341(L3_342)
    L4_343 = L2_341
    L3_342 = L2_341._getItem
    L5_344 = A0_339.work
    L5_344 = L5_344.chosenPackage
    L6_345 = A0_339.work
    L6_345 = L6_345.chosenItem
    L3_342 = L3_342(L4_343, L5_344, L6_345)
    L4_343, L5_344, L6_345, L7_346, L8_347 = nil, nil, nil, nil, nil
    if L3_342 ~= nil then
      L10_349 = L3_342
      L9_348 = L3_342.isRepairable
      L9_348 = L9_348(L10_349)
      if L9_348 == false then
        L9_348 = false
        return L9_348
      end
      L9_348 = A0_339.work
      L4_343 = L9_348.chosenItem
      L10_349 = L3_342
      L9_348 = L3_342._getCatalogID
      L9_348 = L9_348(L10_349)
      L5_344 = L9_348
      L10_349 = L3_342
      L9_348 = L3_342.getItemRepairItem
      L9_348 = L9_348(L10_349)
      L6_345 = L9_348
      L10_349 = L3_342
      L9_348 = L3_342.getItemRepairItemNum
      L9_348 = L9_348(L10_349)
      L7_346 = L9_348
      L10_349 = L3_342
      L9_348 = L3_342.getItemLife
      L9_348 = L9_348(L10_349)
      L8_347 = L9_348
    else
      L9_348 = false
      return L9_348
    end
    L10_349 = L2_341
    L9_348 = L2_341._getItemPackageCapacity
    L11_350 = 1
    L9_348 = L9_348(L10_349, L11_350)
    L11_350 = L2_341
    L10_349 = L2_341._getItemPackageFreeSpace
    L10_349 = L10_349(L11_350, L12_351)
    L11_350 = 0
    for L15_354 = 1, L9_348 - L10_349 do
      if desktopWidget:getPlayerItemInPackage(1, L15_354) == L6_345 then
        L11_350 = L11_350 + desktopWidget:getPlayerItemInPackage(1, L15_354)
      end
    end
    if L7_346 > L11_350 then
      L15_354 = 40241
      L12_351(L13_352, L14_353, L15_354)
      return L12_351
    end
    L15_354 = A0_339.work
    L15_354 = L15_354.chosenItem
    L1_340 = L12_351
    if L1_340 == true then
      L12_351.repairindex = L4_343
      L12_351.repairitem = L5_344
      L12_351.repairlife = L8_347
      L12_351.repair = true
    end
  end
  L2_341 = A0_339.work
  L2_341.lastsub = 5
  return L1_340
end
function ItemListWidget.operateSort(A0_355, A1_356)
  local L2_357
  L2_357 = A0_355.work
  L2_357 = L2_357.listbox
  if L2_357 == 1 then
    if A1_356 ~= nil then
      L2_357 = A0_355.work
      L2_357.sorttype = A1_356
    else
      L2_357 = A0_355.changeSortType
      L2_357(A0_355)
    end
    L2_357 = A0_355.work
    L2_357 = L2_357.index
    A0_355:updateSortType()
    if A0_355:indexToFocus(A0_355.work.listbox, L2_357) > -1 then
      A0_355.work.focus = A0_355:indexToFocus(A0_355.work.listbox, L2_357)
    end
    if A0_355:focusToIndex(A0_355.work.listbox, A0_355.work.focus) >= 0 then
      A0_355.work.index = A0_355:focusToIndex(A0_355.work.listbox, A0_355.work.focus)
    end
    A0_355:displaySortType(A0_355.work.sorttype)
    A0_355.work.lastsub = 9
  end
  L2_357 = true
  return L2_357
end
function ItemListWidget.operateMaterialize(A0_358)
  local L1_359, L2_360, L3_361, L4_362, L5_363, L6_364
  L1_359 = desktopWidget
  L2_360 = L1_359
  L1_359 = L1_359.cannotExecuteByRidingWithErrorMessage
  L1_359 = L1_359(L2_360)
  if L1_359 then
    L1_359 = false
    return L1_359
  end
  L1_359 = worldMaster
  L2_360 = L1_359
  L1_359 = L1_359._getMyPlayer
  L1_359 = L1_359(L2_360)
  L3_361 = L1_359
  L2_360 = L1_359._getItem
  L4_362 = A0_358.work
  L4_362 = L4_362.chosenPackage
  L5_363 = A0_358.work
  L5_363 = L5_363.chosenItem
  L2_360 = L2_360(L3_361, L4_362, L5_363)
  L4_362 = L2_360
  L3_361 = L2_360.getMaterializePermission
  L3_361 = L3_361(L4_362)
  if not L3_361 then
    L3_361 = worldMaster
    L4_362 = L3_361
    L3_361 = L3_361.alert
    L5_363 = worldMaster
    L6_364 = 25265
    L3_361(L4_362, L5_363, L6_364, L2_360:_getCatalogID(), L2_360:getNameIndex())
    L3_361 = false
    return L3_361
  end
  L4_362 = L2_360
  L3_361 = L2_360.getNormalItemFitness
  L3_361 = L3_361(L4_362)
  if L3_361 ~= 10000 then
    L4_362 = worldMaster
    L5_363 = L4_362
    L4_362 = L4_362.alert
    L6_364 = worldMaster
    L4_362(L5_363, L6_364, 25266, L2_360:_getCatalogID(), L2_360:getNameIndex())
    L4_362 = false
    return L4_362
  end
  L5_363 = L1_359
  L4_362 = L1_359.isActiveMode
  L4_362 = L4_362(L5_363)
  if not L4_362 then
    L5_363 = L1_359
    L4_362 = L1_359.isLiving
    L4_362 = L4_362(L5_363)
    if L4_362 then
      L5_363 = L1_359
      L4_362 = L1_359._getActorMainStat
      L4_362 = L4_362(L5_363)
      if L4_362 ~= 11 then
        L5_363 = L1_359
        L4_362 = L1_359._getActorMainStat
        L4_362 = L4_362(L5_363)
      end
    end
  elseif L4_362 == 13 then
    L4_362 = worldMaster
    L5_363 = L4_362
    L4_362 = L4_362.alert
    L6_364 = worldMaster
    L4_362(L5_363, L6_364, 32501)
    L4_362 = false
    return L4_362
  end
  L4_362 = desktopWidget
  L5_363 = L4_362
  L4_362 = L4_362.openChildWidget
  L6_364 = "Ask/MateriaDialogWidget"
  L4_362 = L4_362(L5_363, L6_364, A0_358, true, 1, A0_358.work.index)
  if L4_362 then
    L5_363 = A0_358.work
    L5_363.lastsub = 11
    L5_363 = worldMaster
    L6_364 = L5_363
    L5_363 = L5_363._getMyPlayer
    L5_363 = L5_363(L6_364)
    L6_364 = L5_363._getItem
    L6_364 = L6_364(L5_363, A0_358.work.chosenPackage, A0_358.work.chosenItem)
    if L6_364:isEquipment() and desktopWidget:getAttachedMateriaCountByItem(L6_364) > 0 then
      A0_358:showMateriaList()
      A0_358:setVisibility("Button_ListClose", false)
    end
  end
  return L4_362
end
function ItemListWidget.operateMateriaAttach(A0_365, A1_366)
  if A1_366 == nil then
    A1_366 = 12
  end
  if A1_366 == 12 and desktopWidget:cannotExecuteWithErrorMessage() then
    return false
  end
  if A0_365.work.lasttime > worldMaster:_getServerTime() - 3 then
    return false
  end
  if worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):isEquipment() then
    if not worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):getMateriaBindPermission() then
      worldMaster:alert(worldMaster, 40233, worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):_getCatalogID(), worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):getNameIndex())
      return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_365, true, 1, worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):_getCatalogID(), worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):getNameIndex()))
    end
    if 1 < worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):getNormalItemMateriaFreeIndex() then
      if A1_366 == 13 then
        worldMaster:alert(worldMaster, 25291, worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):_getCatalogID(), worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):getNameIndex())
        return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_365, true, 13, worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):_getCatalogID(), worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):getNameIndex()))
      end
      if not worldMaster:_getMyPlayer():hasItem(101, 2001003) then
        worldMaster:alert(worldMaster, 40242, 2001003, 1)
        return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_365, true, 7))
      end
    end
    if worldMaster:_getMyPlayer():_getItem(A0_365.work.chosenPackage, A0_365.work.chosenItem):getNormalItemMateriaFreeIndex() == 0 then
      worldMaster:alert(worldMaster, 40238)
      return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_365, true, 4))
    end
  end
  A0_365.work.lastsub = A1_366
  return (desktopWidget:openChildWidget("MateriaAttachWidget", A0_365, true, A0_365.work.chosenItem, A0_365.work.sorttype, A1_366))
end
function ItemListWidget.operateMateriaAbort(A0_367)
  return desktopWidget:setMateriaAttachUndeal()
end
function ItemListWidget.operateMateriaView(A0_368)
  A0_368:showMateriaList()
  A0_368:setVisibility("Button_ListClose", true)
  A0_368.work.lastsub = 15
  return true
end
function ItemListWidget.setSubPosition(A0_369)
  local L1_370, L2_371, L3_372, L4_373, L5_374, L6_375, L7_376, L8_377, L9_378, L10_379, L11_380, L12_381, L13_382, L14_383, L15_384, L16_385
  L2_371 = A0_369
  L1_370 = A0_369.getChildWidgetByWindowName
  L3_372 = "ItemSubWidget"
  L1_370 = L1_370(L2_371, L3_372)
  if L1_370 ~= nil then
    L3_372 = L1_370
    L2_371 = L1_370.setProperty
    L4_373 = "Margin"
    L5_374 = "0,0,0,0"
    L2_371(L3_372, L4_373, L5_374)
    L3_372 = A0_369
    L2_371 = A0_369.getWindowPosition
    L3_372 = L2_371(L3_372)
    L5_374 = A0_369
    L4_373 = A0_369.getWindowSize
    L5_374 = L4_373(L5_374)
    L6_375 = desktopWidget
    L7_376 = L6_375
    L6_375 = L6_375.getWindowSize
    L7_376 = L6_375(L7_376)
    L2_371 = L2_371 + 64
    L3_372 = L3_372 + 36
    L8_377 = L6_375 - 64
    L9_378 = 64
    L10_379 = L7_376 - 36
    L11_380 = 36
    if L6_375 == 640 and L7_376 == 480 then
      L8_377 = L6_375 * 0.85
      L9_378 = L6_375 * 0.15
      L10_379 = L7_376 * 0.85
      L11_380 = L7_376 * 0.15
    end
    L12_381 = L3_372 + 120
    L14_383 = L1_370
    L13_382 = L1_370.getWindowSize
    L14_383 = L13_382(L14_383)
    L15_384 = L12_381 + L14_383
    L16_385 = L2_371 + L4_373
    if L8_377 < L16_385 + L13_382 then
      L16_385 = L16_385 - (L16_385 + L13_382 - L8_377)
    end
    if L10_379 < L15_384 then
      L12_381 = L12_381 - (L15_384 - L10_379)
    end
    L1_370:setProperty("Top", L12_381)
    L1_370:setProperty("Left", L16_385)
  end
end
function ItemListWidget.openSubWidget(A0_386, A1_387)
  local L2_388, L3_389, L4_390, L5_391, L6_392, L7_393, L8_394, L9_395, L10_396, L11_397, L12_398, L13_399, L14_400, L15_401, L16_402, L17_403, L18_404, L19_405
  L3_389 = A0_386
  L2_388 = A0_386.getChildWidgetByWindowName
  L4_390 = "ItemSubWidget"
  L2_388 = L2_388(L3_389, L4_390)
  if L2_388 ~= nil then
    L3_389 = 0
    L4_390 = 0
    L5_391 = 0
    L6_392 = 0
    L7_393 = 0
    L8_394 = 0
    L9_395 = 0
    L10_396 = 0
    L11_397 = 0
    L12_398 = 2
    L13_399 = 0
    L14_400 = 0
    L15_401 = 0
    L16_402 = 0
    L17_403 = 0
    L19_405 = A0_386
    L18_404 = A0_386.setSubPosition
    L18_404(L19_405)
    L18_404 = A0_386.work
    L18_404 = L18_404.listbox
    if L18_404 == 5 then
      L18_404 = desktopWidget
      L19_405 = L18_404
      L18_404 = L18_404.countPartyMember
      L18_404 = L18_404(L19_405)
      if L18_404 > 1 then
        L9_395 = 2
      else
        L9_395 = 1
      end
      L8_394 = 2
      L10_396 = 2
    else
      L18_404 = A0_386.work
      L18_404 = L18_404.listbox
      if L18_404 == 3 then
        L18_404 = desktopWidget
        L19_405 = L18_404
        L18_404 = L18_404.isPlayerItemAttached
        L18_404 = L18_404(L19_405, A0_386.work.chosenPackage, A0_386.work.chosenItem)
        if L18_404 == false then
          L19_405 = desktopWidget
          L19_405 = L19_405.getItemDealData
          L19_405 = L19_405(L19_405, A0_386.work.chosenPackage, A0_386.work.chosenItem)
          if L19_405 == 11 or L19_405 == 12 or L19_405 == 13 then
            L3_389 = 2
          else
            L3_389 = 1
          end
        else
          L3_389 = 2
        end
        L19_405 = worldMaster
        L19_405 = L19_405._getMyPlayer
        L19_405 = L19_405(L19_405)
        if L19_405:_getItem(A0_386.work.chosenPackage, A0_386.work.chosenItem):isEquipment() then
          if L19_405:_getItem(A0_386.work.chosenPackage, A0_386.work.chosenItem):getMateriaBindPermission() then
            L17_403 = 2
          else
            L17_403 = 0
          end
        end
      else
        L18_404 = A0_386.work
        L18_404 = L18_404.listbox
        if L18_404 == 4 then
          L16_402 = 2
        else
          L18_404 = worldMaster
          L19_405 = L18_404
          L18_404 = L18_404._getMyPlayer
          L18_404 = L18_404(L19_405)
          L19_405 = L18_404._getItem
          L19_405 = L19_405(L18_404, A0_386.work.chosenPackage, A0_386.work.chosenItem)
          if A0_386.work.chosenPackage == 1 then
            if L19_405:_isEquipping() == false then
              L10_396 = 2
              if L19_405:isRareItem() == false then
                L5_391 = 2
              else
                L5_391 = 1
              end
              if L19_405:isExclusiveItem() == false then
                L4_390 = 2
              else
                L4_390 = 1
                L5_391 = 1
              end
            else
              L4_390 = 1
              L5_391 = 1
              L10_396 = 1
            end
            if desktopWidget:getItemRepairData(A0_386, L19_405, nil, nil) == true then
              if desktopWidget:getItemRepairData(A0_386, L19_405, nil, nil) == desktopWidget:getItemRepairData(A0_386, L19_405, nil, nil) then
                L7_393 = 1
                L6_392 = 1
              elseif L19_405:_isEquipping() == false then
                if desktopWidget:getItemRepairData(A0_386, L19_405, nil, nil) == L18_404:getStateMainSkill() then
                  L7_393 = 2
                else
                  L7_393 = 1
                end
                L6_392 = 2
              else
                L7_393 = 1
                L6_392 = 1
              end
            end
            L11_397 = 2
            L13_399 = 0
            if not worldMaster:_getMyPlayer():hasItem(101, 2001001) or not L19_405:isEquipment() or not desktopWidget:getItemMaterializePermission(A0_386, L19_405) then
            elseif L19_405:_isEquipping() then
              L13_399 = 1
            else
              L13_399 = 2
            end
            if (worldMaster:_getMyPlayer():hasItem(101, 2001002) or worldMaster:_getMyPlayer():hasItem(101, 2001003)) and A0_386.work.chosenPackage == 1 then
              if L19_405:isEquipment() then
                if L19_405:isRepairable() == false then
                  L14_400 = 0
                elseif L19_405:_isEquipping() == true then
                  L14_400 = 1
                else
                  L14_400 = 2
                end
                L2_388:setHelpParameter("Button_MateriaAttach", 1, 75322, nil, nil, nil)
              elseif L19_405:isEnchantMateria() then
                L14_400 = 2
                L2_388:setHelpParameter("Button_MateriaAttach", 1, 75323, nil, nil, nil)
              else
                L14_400 = 0
              end
              if L14_400 > 0 and (worldMaster:_getMyPlayer():isLiving() == false or worldMaster:_getMyPlayer():_getActorMainStat() == 11 or worldMaster:_getMyPlayer():_getActorMainStat() == 13) then
                L14_400 = 1
              end
            end
            if worldMaster:_getMyPlayer():hasItem(101, 2001001) and A0_386.work.chosenPackage == 1 then
              if worldMaster:_getMyPlayer():isMateriaAttachDealer() then
                L15_401 = 1
              elseif L19_405:isEquipment() then
                if L19_405:isRepairable() == false then
                  L15_401 = 0
                elseif L19_405:_isEquipping() == true then
                  L15_401 = 1
                else
                  L15_401 = 2
                end
                L2_388:setHelpParameter("Button_MateriaOrder", 1, 75325, nil, nil, nil)
              elseif L19_405:isEnchantMateria() then
                L15_401 = 2
                L2_388:setHelpParameter("Button_MateriaOrder", 1, 75326, nil, nil, nil)
              else
                L15_401 = 0
              end
              if L15_401 > 0 and (worldMaster:_getMyPlayer():isLiving() == false or worldMaster:_getMyPlayer():_getActorMainStat() == 11 or worldMaster:_getMyPlayer():_getActorMainStat() == 13) then
                L15_401 = 1
              end
            end
            if L19_405:getMateriaBindPermission() then
              L17_403 = 2
            else
              L17_403 = 0
            end
          else
            L4_390 = 2
            L5_391 = 2
          end
        end
      end
    end
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_BazaarAbort", L3_389)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_BazaarSell", L4_390)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_BazaarBuy", L5_391)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_BazaarRepair", L6_392)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_Repair", L7_393)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_Materialize", L13_399)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_MateriaAttach", L14_400)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_MateriaOrder", L15_401)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_MateriaAbort", L16_402)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_MateriaView", L17_403)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_DropItemGetAll", L8_394)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_DropItemGiveAll", L9_395)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_Trash", L10_396)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_Sort", L11_397)
    L19_405 = L2_388
    L18_404 = L2_388.setSubMenuVisibility
    L18_404(L19_405, "Button_Cancel", L12_398)
    L19_405 = L2_388
    L18_404 = L2_388.setModal
    L18_404(L19_405, true)
    L19_405 = L2_388
    L18_404 = L2_388.show
    L18_404(L19_405)
    L18_404 = A0_386.work
    L18_404 = L18_404.lastsub
    if L18_404 == 1 and L3_389 == 2 then
      L19_405 = L2_388
      L18_404 = L2_388.setWindowFocus
      L18_404(L19_405, "Button_BazaarAbort")
    else
      L18_404 = A0_386.work
      L18_404 = L18_404.lastsub
      if L18_404 == 2 and L4_390 == 2 then
        L19_405 = L2_388
        L18_404 = L2_388.setWindowFocus
        L18_404(L19_405, "Button_BazaarSell")
      else
        L18_404 = A0_386.work
        L18_404 = L18_404.lastsub
        if L18_404 == 3 and L5_391 == 2 then
          L19_405 = L2_388
          L18_404 = L2_388.setWindowFocus
          L18_404(L19_405, "Button_BazaarBuy")
        else
          L18_404 = A0_386.work
          L18_404 = L18_404.lastsub
          if L18_404 == 4 and L6_392 == 2 then
            L19_405 = L2_388
            L18_404 = L2_388.setWindowFocus
            L18_404(L19_405, "Button_BazaarRepair")
          else
            L18_404 = A0_386.work
            L18_404 = L18_404.lastsub
            if L18_404 == 5 and L7_393 == 2 then
              L19_405 = L2_388
              L18_404 = L2_388.setWindowFocus
              L18_404(L19_405, "Button_Repair")
            else
              L18_404 = A0_386.work
              L18_404 = L18_404.lastsub
              if L18_404 == 11 and L13_399 == 2 then
                L19_405 = L2_388
                L18_404 = L2_388.setWindowFocus
                L18_404(L19_405, "Button_Materialize")
              else
                L18_404 = A0_386.work
                L18_404 = L18_404.lastsub
                if L18_404 == 12 and L14_400 == 2 then
                  L19_405 = L2_388
                  L18_404 = L2_388.setWindowFocus
                  L18_404(L19_405, "Button_MateriaAttach")
                else
                  L18_404 = A0_386.work
                  L18_404 = L18_404.lastsub
                  if L18_404 == 13 and L15_401 == 2 then
                    L19_405 = L2_388
                    L18_404 = L2_388.setWindowFocus
                    L18_404(L19_405, "Button_MateriaOrder")
                  else
                    L18_404 = A0_386.work
                    L18_404 = L18_404.lastsub
                    if L18_404 == 14 and L16_402 == 2 then
                      L19_405 = L2_388
                      L18_404 = L2_388.setWindowFocus
                      L18_404(L19_405, "Button_MateriaAbort")
                    else
                      L18_404 = A0_386.work
                      L18_404 = L18_404.lastsub
                      if L18_404 == 15 and L17_403 == 2 then
                        L19_405 = L2_388
                        L18_404 = L2_388.setWindowFocus
                        L18_404(L19_405, "Button_MateriaView")
                      else
                        L18_404 = A0_386.work
                        L18_404 = L18_404.lastsub
                        if L18_404 == 6 and L8_394 == 2 then
                          L19_405 = L2_388
                          L18_404 = L2_388.setWindowFocus
                          L18_404(L19_405, "Button_DropItemGetAll")
                        else
                          L18_404 = A0_386.work
                          L18_404 = L18_404.lastsub
                          if L18_404 == 7 and L9_395 == 2 then
                            L19_405 = L2_388
                            L18_404 = L2_388.setWindowFocus
                            L18_404(L19_405, "Button_DropItemGiveAll")
                          else
                            L18_404 = A0_386.work
                            L18_404 = L18_404.lastsub
                            if L18_404 == 8 and L10_396 == 2 then
                              L19_405 = L2_388
                              L18_404 = L2_388.setWindowFocus
                              L18_404(L19_405, "Button_Trash")
                            else
                              L18_404 = A0_386.work
                              L18_404 = L18_404.lastsub
                              if L18_404 == 9 and L11_397 == 2 then
                                L19_405 = L2_388
                                L18_404 = L2_388.setWindowFocus
                                L18_404(L19_405, "Button_Sort")
                              else
                                L19_405 = L2_388
                                L18_404 = L2_388.setWindowFocus
                                L18_404(L19_405, "Button_Cancel")
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
    L18_404 = A0_386.work
    L18_404.submenu = true
  end
end
function ItemListWidget.closeSubWidget(A0_406)
  if A0_406:getChildWidgetByWindowName("ItemSubWidget") ~= nil then
    A0_406:getChildWidgetByWindowName("ItemSubWidget"):hide()
    A0_406.work.submenu = false
  end
  if not A0_406.work.isMateriaList then
    A0_406:updateWindowDisplay(true)
  end
end
function ItemListWidget.updatePlayerItem(A0_407, A1_408, A2_409)
  local L3_410, L4_411
  L3_410 = -1
  if A1_408 == 0 then
    L4_411 = A0_407.work
    L4_411.updatecount = A2_409
    L4_411 = A0_407.work
    L4_411.indexChange = false
    L4_411 = A0_407.work
    L4_411.focusChange = false
    return
  else
    if A1_408 == 1 then
      L4_411 = A0_407.work
      L4_411 = L4_411.listbox
      if L4_411 == 1 then
        L4_411 = A0_407.work
        L4_411 = L4_411.index
        L4_411 = L4_411 + 1
        if A2_409 < L4_411 then
          L4_411 = A0_407.work
          L4_411.indexChange = true
        end
      end
      L4_411 = A0_407.makeListFromPackage
      L4_411(A0_407, A1_408, A2_409)
      L3_410 = 1
    elseif A1_408 == 5 then
      L4_411 = A0_407.makeDropItemList
      L4_411(A0_407, A2_409)
      L3_410 = 5
    elseif A1_408 == 100 then
      L4_411 = A0_407.makeListFromPackage
      L4_411(A0_407, A1_408, A2_409)
      L3_410 = 2
    elseif A1_408 == 8 then
      L4_411 = A0_407.makeListFromPackage
      L4_411(A0_407, A1_408, A2_409)
      L3_410 = 3
    elseif A1_408 == 6 then
      L4_411 = A0_407.makeListFromPackage
      L4_411(A0_407, A1_408, A2_409)
      L3_410 = 4
    end
    L4_411 = A0_407.work
    L4_411 = L4_411.chosenPackage
    if L4_411 == A1_408 then
      L4_411 = A0_407.work
      L4_411 = L4_411.chosenItem
      if L4_411 == A2_409 then
        L4_411 = A0_407.work
        L4_411 = L4_411.editWidgetOpen
        if L4_411 == 0 then
          L4_411 = A0_407.work
          L4_411 = L4_411.submenu
        elseif L4_411 == true then
          L4_411 = A0_407.work
          L4_411.closeok = true
        end
      end
    end
  end
  L4_411 = A0_407.work
  L4_411 = L4_411.updatecount
  if L4_411 > 0 then
    L4_411 = A0_407.work
    L4_411.updatecount = A0_407.work.updatecount - 1
  end
  L4_411 = A0_407.work
  L4_411 = L4_411.updatecount
  if L4_411 == 0 then
    if A1_408 == 100 then
      L4_411 = A0_407.getListPropertyName
      L4_411 = L4_411(A0_407, 2)
      A0_407:updateListProperty(L4_411)
      A0_407:makeMoneyList()
      if A0_407:getChildWidgetByWindowName("BazaarEditWidget") ~= nil then
        A0_407:getChildWidgetByWindowName("BazaarEditWidget"):updateMoney(worldMaster:_getMyPlayer():getMoneyOnHand())
      end
    elseif A1_408 == 8 then
      L4_411 = A0_407.updateBazaarLabel
      L4_411(A0_407, 3)
    elseif L3_410 ~= -1 then
      L4_411 = A0_407.getListPropertyName
      L4_411 = L4_411(A0_407, L3_410)
      A0_407:updateListProperty(L4_411)
    end
    if A1_408 == 1 then
      L4_411 = A0_407.getChildWidgetByWindowName
      L4_411 = L4_411(A0_407, "MateriaAttachWidget")
      if L4_411 then
        L4_411:updatePlayerItem()
      end
    end
    L4_411 = A0_407.displayBagcapacityAndMoney
    L4_411(A0_407)
    L4_411 = A0_407.work
    L4_411 = L4_411.listbox
    if L3_410 == L4_411 then
      if A1_408 == 8 then
        L4_411 = A0_407.work
        L4_411 = L4_411.isMateriaList
        if L4_411 then
          L4_411 = A0_407.closeMateriaList
          L4_411(A0_407)
        end
      end
      L4_411 = A0_407.work
      L4_411 = L4_411.isMateriaList
      if not L4_411 then
        L4_411 = A0_407.updateListFocus
        L4_411(A0_407)
      end
    end
    L4_411 = A0_407.work
    L4_411.waittrash = false
  end
  return
end
function ItemListWidget.setBazaarEditData(A0_412, A1_413)
  A0_412.work.chosenOperation = A1_413
  return true
end
function ItemListWidget.closeBazaarEdit(A0_414, A1_415)
  A0_414.work.editWidgetOpen = 0
  A0_414.work.chosenOperation = 0
  if A0_414.work.isMateriaList then
    A0_414:closeMateriaList()
  end
  if A0_414:getChildWidgetByWindowName("BazaarEditWidget") ~= nil then
    desktopWidget:closeChildWidget("BazaarEditWidget", A0_414)
  end
  if A1_415 == nil then
    A0_414:updateWindowDisplay(true)
    A0_414:selectedBorder()
  end
  return true
end
function ItemListWidget.setItemEditData(A0_416, A1_417, A2_418)
  local L3_419
  L3_419 = A0_416.work
  L3_419.chosenOperation = A1_417
  if A1_417 ~= 12 then
    L3_419 = A0_416.work
    L3_419.waittrash = true
  end
  L3_419 = true
  return L3_419
end
function ItemListWidget.closeItemEdit(A0_420, A1_421)
  A0_420.work.editWidgetOpen = 0
  A0_420.work.chosenOperation = 0
  if A0_420.work.isMateriaList then
    A0_420:closeMateriaList()
  end
  if A0_420:getChildWidgetByWindowName("ItemEditWidget") ~= nil then
    desktopWidget:closeChildWidget("ItemEditWidget", A0_420)
  end
  if A1_421 == nil then
    A0_420:updateWindowDisplay(true)
    A0_420:selectedBorder()
  end
  return true
end
function ItemListWidget.setItemShare(A0_422, A1_423)
  if A1_423 ~= 12 then
    A0_422.work.chosenOperation = A1_423
  end
  return true
end
function ItemListWidget.closeItemShare(A0_424, A1_425)
  A0_424.work.editWidgetOpen = 0
  A0_424.work.chosenOperation = 0
  if A0_424:getChildWidgetByWindowName("ItemShareWidget") ~= nil then
    desktopWidget:closeChildWidget("ItemShareWidget", A0_424)
  end
  if A1_425 == nil then
    A0_424:updateWindowDisplay(true)
    A0_424:selectedBorder()
  end
  return true
end
function ItemListWidget.getShareItem(A0_426)
  local L1_427
  L1_427 = A0_426.work
  L1_427 = L1_427.editWidgetOpen
  if L1_427 == 4 then
    L1_427 = 0
    return L1_427
  else
    L1_427 = A0_426.work
    L1_427 = L1_427.chosenPackage
    if L1_427 == 5 then
      L1_427 = A0_426.work
      L1_427 = L1_427.chosenItem
      return L1_427
    else
      L1_427 = -1
      return L1_427
    end
  end
end
function ItemListWidget.checkChosenItem(A0_428, A1_429, A2_430, A3_431)
  if A2_430 ~= nil and A2_430 ~= A0_428.work.chosenPackage then
    return false
  end
  if A3_431 ~= nil and A3_431 ~= A0_428.work.chosenItem then
    return false
  end
  if A0_428.work.chosenPackage ~= A0_428:getPackageFromList(A0_428.work.listbox) then
    return false
  end
  if A0_428.work.chosenItem ~= A0_428.work.index + 1 then
    return false
  end
  if worldMaster:_getMyPlayer():_getItem(A0_428.work.chosenPackage, A0_428.work.chosenItem) == A1_429 then
    return true
  else
    return false
  end
end
function ItemListWidget.getItemContent(A0_432, A1_433, A2_434, A3_435)
  local L4_436
  if A2_434 == "itemPackage" then
    L4_436 = A0_432.work
    L4_436 = L4_436.chosenPackage
    return L4_436
  elseif A2_434 == "itemIndex" then
    L4_436 = A0_432.work
    L4_436 = L4_436.chosenItem
    return L4_436
  elseif A2_434 == "itemOwner" then
    L4_436 = 1
    return L4_436
  end
  if A1_433 == nil then
    L4_436 = A0_432._getProperty
    return L4_436(A0_432, nil, A2_434, A3_435)
  else
    L4_436 = A0_432.getListPropertyName
    L4_436 = L4_436(A0_432, A0_432.work.listbox)
    if A1_433 == -1 then
      return A0_432:getListProperty(L4_436, A0_432.work.index, A2_434)
    else
      return A0_432:getListProperty(L4_436, A1_433, A2_434)
    end
  end
end
function ItemListWidget.getItemEditData(A0_437)
  local L1_438, L2_439, L3_440, L4_441, L5_442, L6_443, L7_444
  L1_438 = 0
  L2_439 = 0
  L3_440 = ""
  L4_441 = false
  L5_442 = 1
  L6_443 = worldMaster
  L7_444 = L6_443
  L6_443 = L6_443._getMyPlayer
  L6_443 = L6_443(L7_444)
  L7_444 = nil
  L7_444, L2_439, L4_441, L5_442 = desktopWidget:getPlayerItemInPackage(A0_437.work.chosenPackage, A0_437.work.chosenItem)
  L3_440 = A0_437:_getProperty(nil, "TextBlock_ItemName", "Text")
  if L6_443:_getItem(A0_437.work.chosenPackage, A0_437.work.chosenItem) ~= nil then
    L1_438 = L6_443:_getItem(A0_437.work.chosenPackage, A0_437.work.chosenItem):getWasteConfirmLevel()
  end
  return L1_438, L2_439, L3_440, L4_441, L5_442
end
function ItemListWidget.syncItemWork(A0_445, A1_446)
  local L2_447, L3_448, L4_449, L5_450, L6_451, L7_452, L8_453
  L2_447 = worldMaster
  L3_448 = L2_447
  L2_447 = L2_447._getMyPlayer
  L2_447 = L2_447(L3_448)
  L4_449 = L2_447
  L3_448 = L2_447._getItemPackageCapacity
  L3_448 = L3_448(L4_449, L5_450)
  L4_449 = L2_447._getItemPackageFreeSpace
  L4_449 = L4_449(L5_450, L6_451)
  for L8_453 = 1, L3_448 - L4_449 do
    if A0_445:checkPackageAndIndex(A1_446, 1, L8_453) == true then
      A0_445:makeListFromPackage(1, L8_453)
      A0_445:updateListProperty(A0_445:getListPropertyName(1))
      if A0_445.work.listbox == 1 and A0_445.work.index == L8_453 - 1 then
        A0_445:displayFocusedItemHelp()
      end
    end
  end
end
function ItemListWidget.setSortTypeWork(A0_454, A1_455)
  local L2_456
  L2_456 = A0_454.work
  L2_456 = L2_456.sorttype
  if L2_456 ~= A1_455 then
    L2_456 = A0_454.work
    L2_456.sorttype = A1_455
    L2_456 = A0_454.work
    L2_456 = L2_456.index
    A0_454:updateSortType()
    if A0_454:indexToFocus(A0_454.work.listbox, L2_456) > -1 then
      A0_454.work.focus = A0_454:indexToFocus(A0_454.work.listbox, L2_456)
    end
    if A0_454:focusToIndex(A0_454.work.listbox, A0_454.work.focus) >= 0 then
      A0_454.work.index = A0_454:focusToIndex(A0_454.work.listbox, A0_454.work.focus)
    end
    A0_454:displaySortType(A0_454.work.sorttype)
  end
end
function ItemListWidget.update(A0_457, A1_458)
  if A1_458 == "exp" and A0_457.work.equipx == true then
    A0_457:updateEquipxBadge()
    A0_457.work.equipx = false
  end
end
function ItemListWidget.updateEquipxBadge(A0_459)
  local L1_460, L2_461, L3_462, L4_463, L5_464, L6_465, L7_466, L8_467, L9_468
  L1_460 = worldMaster
  L2_461 = L1_460
  L1_460 = L1_460._getMyPlayer
  L1_460 = L1_460(L2_461)
  L2_461, L3_462, L4_463 = nil, nil, nil
  L2_461 = L5_464
  L3_462 = L5_464
  L4_463 = L5_464
  for L8_467 = 1, L3_462 - L4_463 do
    L9_468 = A0_459.updateItemEquipxBadge
    L9_468 = L9_468(A0_459, 1, L8_467)
    if L9_468 == nil then
      break
    end
    A0_459:setListProperty(L2_461, L8_467 - 1, "equipx", L9_468)
  end
  L5_464(L6_465, L7_466)
  L2_461 = L5_464
  L3_462 = L5_464
  L4_463 = L5_464
  for L8_467 = 1, L3_462 - L4_463 do
    L9_468 = A0_459.updateItemEquipxBadge
    L9_468 = L9_468(A0_459, 8, L8_467)
    if L9_468 == nil then
      break
    end
    A0_459:setListProperty(L2_461, L8_467 - 1, "equipx", L9_468)
  end
  L5_464(L6_465, L7_466)
  L2_461 = L5_464
  L3_462 = L5_464
  L4_463 = L5_464
  for L8_467 = 1, L3_462 - L4_463 do
    L9_468 = A0_459.updateItemEquipxBadge
    L9_468 = L9_468(A0_459, 6, L8_467)
    if L9_468 == nil then
      break
    end
    A0_459:setListProperty(L2_461, L8_467 - 1, "equipx", L9_468)
  end
  L5_464(L6_465, L7_466)
  L2_461 = L5_464
  L3_462 = L5_464
  L4_463 = L5_464
  for L8_467 = 1, L3_462 - L4_463 do
    L9_468 = A0_459.updateItemEquipxBadge
    L9_468 = L9_468(A0_459, 5, L8_467)
    if L9_468 == nil then
      break
    end
    A0_459:setListProperty(L2_461, L8_467 - 1, "equipx", L9_468)
  end
  L5_464(L6_465, L7_466)
end
function ItemListWidget.updateItemEquipxBadge(A0_469, A1_470, A2_471)
  local L3_472, L4_473
  L3_472 = worldMaster
  L4_473 = L3_472
  L3_472 = L3_472._getMyPlayer
  L3_472 = L3_472(L4_473)
  L4_473 = L3_472._getItem
  L4_473 = L4_473(L3_472, A1_470, A2_471)
  if L4_473 == nil then
    return nil
  end
  if desktopWidget:cantEquipPlayer(L4_473) == true then
    return "Visible"
  else
    return "Collapsed"
  end
end
function ItemListWidget.showMateriaList(A0_474)
  local L1_475
  L1_475 = worldMaster
  L1_475 = L1_475._getMyPlayer
  L1_475 = L1_475(L1_475)
  L1_475 = L1_475._getItem
  L1_475 = L1_475(L1_475, A0_474.work.chosenPackage, A0_474.work.chosenItem)
  desktopWidget:setMateriaListItems(A0_474, L1_475)
  A0_474:setVisibility("Grid_MateriaEquipList", true)
  A0_474:setVisibility("Grid_TabList", false)
  A0_474:setVisibility("Button_SortStatus", false)
  A0_474.work.isMateriaList = true
end
function ItemListWidget.closeMateriaList(A0_476)
  A0_476:setVisibility("Grid_MateriaEquipList", false)
  A0_476:setVisibility("Grid_TabList", true)
  if A0_476.work.listbox == 1 then
    A0_476:setVisibility("Button_SortStatus", true)
  end
  A0_476.work.isMateriaList = false
end
function ItemListWidget.setMateriaAttachItemIndex(A0_477, A1_478)
  A0_477.work.equipItemIndex = A1_478
end
function ItemListWidget.getMateriaAttachEquipItemIndex(A0_479)
  local L1_480
  L1_480 = A0_479.work
  L1_480 = L1_480.equipItemIndex
  if L1_480 < 0 then
    L1_480 = nil
    return L1_480
  end
  L1_480 = A0_479.work
  L1_480 = L1_480.equipItemIndex
  return L1_480
end
function ItemListWidget.setMateriaItemIndex(A0_481, A1_482)
  A0_481.work.materiaItemIndex = A1_482
end
function ItemListWidget.getMateriaItemIndex(A0_483)
  local L1_484
  L1_484 = A0_483.work
  L1_484 = L1_484.materiaItemIndex
  if L1_484 < 0 then
    L1_484 = nil
    return L1_484
  end
  L1_484 = A0_483.work
  L1_484 = L1_484.materiaItemIndex
  return L1_484
end
function ItemListWidget.setOrderTime(A0_485)
  A0_485.work.lasttime = worldMaster:_getServerTime()
end
function ItemListWidget.displaySortType(A0_486, A1_487)
  desktopWidget:displaySortType(A1_487, A0_486, "Button_SortStatus")
end
function ItemListWidget.changeSortType(A0_488)
  A0_488.work.sorttype = desktopWidget:changeSortType(A0_488.work.sorttype)
end
function ItemListWidget.saveSortType(A0_489)
  desktopWidget:saveSortType(A0_489.work.sorttype)
end
function ItemListWidget.getCurrentSortType(A0_490)
  return A0_490.work.sorttype
end
