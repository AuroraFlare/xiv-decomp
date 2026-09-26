require("/Widget/Ask/AskBaseClass")
_defineClass("QuestDeliveryWidget", "AskBaseClass")
function QuestDeliveryWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "GrandCompanyShopWidget"
  return L1_1
end
function QuestDeliveryWidget.initAsk(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8)
  local L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  L7_9 = A0_2.work
  L11_13 = "integer32"
  L11_13 = "chosenPackage"
  L12_14 = "integer32"
  L11_13 = {L12_14, "integer32"}
  L12_14 = "chosenOperation"
  L12_14 = {"mode", "integer16"}
  L7_9._temp = L8_10
  L7_9 = A0_2.work
  L7_9.chosenOperation = 0
  L7_9 = A0_2.work
  L7_9.editWidgetOpen = 0
  L7_9 = A0_2.work
  L7_9.initialized = false
  L7_9 = A0_2.work
  L8_10.index = 0
  L7_9.listbox = L9_11
  L7_9 = A0_2.work
  L7_9.bonus1 = false
  L7_9 = A0_2.work
  L7_9.bonus2 = false
  L7_9 = A0_2.work
  L7_9.bonus3 = false
  L7_9 = A0_2.work
  L7_9.itemlife = false
  L7_9 = A0_2.work
  L7_9.bazaar = false
  L7_9 = A0_2.work
  L7_9.waitForPrice = false
  L7_9 = A0_2.work
  L7_9.waitNext = false
  L7_9 = A0_2.work
  L7_9.waitupdate = false
  L7_9 = A0_2.work
  L7_9.focus = 0
  L7_9 = A0_2.work
  L7_9.closeok = false
  L7_9 = A0_2.work
  L7_9.demandSync = false
  L7_9 = A0_2.work
  L7_9.sorttype = L8_10
  L7_9 = A0_2.work
  L7_9.submenu = false
  L7_9 = A0_2.work
  L7_9.askstatus = true
  L7_9 = 8031
  if A4_6 ~= nil and A6_8 == nil then
    L8_10.mode = A4_6
    if A4_6 == 2 then
      L7_9 = 8032
    elseif A4_6 > 2 then
      L7_9 = 8040
    end
  end
  L11_13 = "@"
  L12_14 = tostring
  L12_14 = L12_14(L7_9)
  L11_13 = L11_13 .. L12_14
  L8_10(L9_11, L10_12, L11_13)
  if A5_7 ~= nil then
    L8_10(L9_11, L10_12)
    if L9_11 == 1500433 then
      L10_12.townID = 1
      L10_12.shopid = 1030
      break
    else
    end
    if L9_11 == 1500320 then
      L10_12.townID = 2
      L10_12.shopid = 2003
      break
    else
    end
    if L9_11 == 1500434 then
      L10_12.townID = 3
      L10_12.shopid = 3044
      break
    else
    end
  else
  end
  L8_10(L9_11)
  L8_10(L9_11, L10_12)
  for L11_13 = 1, 5 do
    L12_14 = "TabItem_"
    L12_14 = L12_14 .. tostring(L11_13)
    A0_2:setCancelCondition(L12_14)
  end
  L11_13 = "UILuaCommands.TabChanged"
  L8_10(L9_11, L10_12, L11_13)
  L11_13 = 214
  L12_14 = 10091
  L8_10(L9_11, L10_12, L11_13, L12_14)
  L11_13 = 214
  L12_14 = 10093
  L8_10(L9_11, L10_12, L11_13, L12_14)
  L11_13 = ""
  L8_10(L9_11, L10_12, L11_13)
  L11_13 = 3402
  L8_10(L9_11, L10_12, L11_13)
  L8_10.orderCatalog = A1_3
  L8_10.rewardCS = A2_4
  L8_10.rewardHQCS = A3_5
  L8_10.bundle = 1
  if L8_10 ~= 0 and A4_6 > 0 then
    L8_10.bundle = A4_6
  end
  L8_10(L9_11, L10_12)
  L8_10(L9_11, L10_12)
  L8_10(L9_11, L10_12)
  L8_10(L9_11, L10_12)
  L8_10(L9_11, L10_12)
  L11_13 = 3207
  L8_10(L9_11, L10_12, L11_13)
  L11_13 = 3208
  L8_10(L9_11, L10_12, L11_13)
  L8_10(L9_11, L10_12)
  if L8_10 ~= 0 and A1_3 ~= 0 then
    L8_10(L9_11, L10_12)
  end
  L11_13 = A6_8
  L8_10(L9_11, L10_12, L11_13)
  if A1_3 > 0 then
    L11_13 = A1_3
    L12_14 = 1
    L11_13 = L9_11
    if L10_12 == 1 then
      L12_14 = A0_2
      L11_13 = A0_2.setVisibility
      L11_13(L12_14, "TabItem_1", true)
      L12_14 = A0_2
      L11_13 = A0_2.setVisibility
      L11_13(L12_14, "TabItem_2", false)
      L12_14 = A0_2
      L11_13 = A0_2.setSelectedIndex
      L11_13(L12_14, "TabControl_ItemList", 0)
    elseif L10_12 == 100 then
      L12_14 = A0_2
      L11_13 = A0_2.setVisibility
      L11_13(L12_14, "TabItem_1", false)
      L12_14 = A0_2
      L11_13 = A0_2.setVisibility
      L11_13(L12_14, "TabItem_2", true)
      L12_14 = A0_2
      L11_13 = A0_2.setSelectedIndex
      L11_13(L12_14, "TabControl_ItemList", 1)
    end
  else
    L11_13 = "TabItem_1"
    L12_14 = true
    L9_11(L10_12, L11_13, L12_14)
    L11_13 = "TabItem_2"
    L12_14 = false
    L9_11(L10_12, L11_13, L12_14)
    L11_13 = "TabControl_ItemList"
    L12_14 = 0
    L9_11(L10_12, L11_13, L12_14)
  end
  L11_13 = "TabItem_3"
  L12_14 = false
  L9_11(L10_12, L11_13, L12_14)
  L11_13 = "TabItem_4"
  L12_14 = false
  L9_11(L10_12, L11_13, L12_14)
  L11_13 = "TabItem_5"
  L12_14 = false
  L9_11(L10_12, L11_13, L12_14)
  L11_13 = "TabItem_1"
  L12_14 = 1
  L9_11(L10_12, L11_13, L12_14, 71911)
  L11_13 = "TabItem_2"
  L12_14 = 1
  L9_11(L10_12, L11_13, L12_14, 71912)
  if L9_11 ~= 0 then
    L11_13 = "Label_GrandCompanyBanner"
    L12_14 = 0
    L9_11(L10_12, L11_13, L12_14)
  end
end
function QuestDeliveryWidget.setInitialData(A0_15, A1_16, A2_17)
  local L3_18, L4_19, L5_20
  L4_19 = A0_15
  L3_18 = A0_15.setModal
  L5_20 = true
  L3_18(L4_19, L5_20)
  L4_19 = A0_15
  L3_18 = A0_15.resetListBox
  L5_20 = 1
  L3_18(L4_19, L5_20)
  L4_19 = A0_15
  L3_18 = A0_15.resetListBox
  L5_20 = 2
  L3_18(L4_19, L5_20)
  L4_19 = A0_15
  L3_18 = A0_15.makeListFromPackage
  L3_18(L4_19)
  L3_18 = A0_15.work
  L3_18.initialized = true
  L3_18 = A0_15.work
  L3_18.listbox = 1
  L4_19 = A0_15
  L3_18 = A0_15.operateSort
  L5_20 = A0_15.work
  L5_20 = L5_20.sorttype
  L3_18(L4_19, L5_20)
  L4_19 = A0_15
  L3_18 = A0_15.changeList
  L3_18(L4_19)
  L4_19 = A0_15
  L3_18 = A0_15.updateWindowDisplay
  L5_20 = true
  L3_18(L4_19, L5_20)
  if A1_16 == 0 then
    L3_18 = worldMaster
    L4_19 = L3_18
    L3_18 = L3_18._getMyPlayer
    L3_18 = L3_18(L4_19)
    L5_20 = L3_18
    L4_19 = L3_18._getBelongGrandCompany
    L4_19 = L4_19(L5_20)
    L5_20 = A0_15.work
    L5_20.townID = L4_19
    L5_20 = 0
    if L4_19 == 1 then
      L5_20 = 530
      break
    else
    end
    if L4_19 == 2 then
      L5_20 = 531
      break
    else
    end
    if L4_19 == 3 then
      L5_20 = 532
      do break end
      break
    else
    end
    A0_15:setIcon("IconControl_CompanyPoint", L5_20)
    A0_15:displayGrandCompanyName(L4_19)
    A0_15:displayGrandCompanyRank(L4_19)
    A0_15:displayGrandCompanyPoint(L4_19)
  else
    L4_19 = A0_15
    L3_18 = A0_15.displayGrandCompanyName
    L5_20 = A0_15.work
    L5_20 = L5_20.townID
    L3_18(L4_19, L5_20)
    L4_19 = A0_15
    L3_18 = A0_15.setText
    L5_20 = "TextBlock_CompanyName"
    L3_18(L4_19, L5_20, 204, A0_15.work.shopid)
    L4_19 = A0_15
    L3_18 = A0_15.setVisibility
    L5_20 = "IconControl_CompanyStatus"
    L3_18(L4_19, L5_20, false)
    L4_19 = A0_15
    L3_18 = A0_15.setVisibility
    L5_20 = "IconControl_CompanyPoint"
    L3_18(L4_19, L5_20, false)
    L3_18 = 0
    if A2_17 ~= nil then
      L3_18 = A2_17
    end
    L5_20 = A0_15
    L4_19 = A0_15.setText
    L4_19(L5_20, "TextBlock_CompanyPoint", 8043, L3_18, 100)
    L4_19 = A0_15.work
    L4_19 = L4_19.orderCatalog
    if L4_19 > 0 then
      L5_20 = A0_15
      L4_19 = A0_15.setProperty
      L4_19(L5_20, "Title", "@" .. tostring(8041))
    else
      L5_20 = A0_15
      L4_19 = A0_15.setProperty
      L4_19(L5_20, "Title", "@" .. tostring(8042))
    end
  end
end
function QuestDeliveryWidget.displayGrandCompanyName(A0_21, A1_22)
  local L2_23, L3_24, L4_25
  L3_24 = A0_21
  L2_23 = A0_21.getGrandCompanyBanner
  L4_25 = A1_22
  L2_23 = L2_23(L3_24, L4_25)
  L4_25 = A0_21
  L3_24 = A0_21.getTownName
  L3_24 = L3_24(L4_25, A1_22)
  L4_25 = A0_21.getGrandCompanyName
  L4_25 = L4_25(A0_21, A1_22)
  A0_21:setControlProperty("Label_GrandCompanyBanner", "SqwtStyle", L2_23)
  A0_21:setText("TextBlock_CompanyCity", L3_24)
  A0_21:setText("TextBlock_CompanyName", L4_25)
end
function QuestDeliveryWidget.getGrandCompanyBanner(A0_26, A1_27)
  local L2_28, L3_29
  L3_29 = A1_27
  if L3_29 == 1 then
    L2_28 = "LAB_profile_stateBanner_LimsaLominsa"
    break
  else
  end
  if L3_29 == 2 then
    L2_28 = "LAB_profile_stateBanner_Gridania"
    break
  else
  end
  if L3_29 == 3 then
    L2_28 = "LAB_profile_stateBanner_Uldah"
    do break end
    break
  else
  end
  return L2_28
end
function QuestDeliveryWidget.getTownName(A0_30, A1_31)
  local L2_32, L3_33
  L3_33 = A1_31
  if L3_33 == 1 then
    L2_32 = 100621
    break
  else
  end
  if L3_33 == 2 then
    L2_32 = 100622
    break
  else
  end
  if L3_33 == 3 then
    L2_32 = 100623
    do break end
    break
  else
  end
  return L2_32
end
function QuestDeliveryWidget.getGrandCompanyName(A0_34, A1_35)
  local L2_36, L3_37
  L3_37 = A1_35
  if L3_37 == 1 then
    L2_36 = 8051
    break
  else
  end
  if L3_37 == 2 then
    L2_36 = 8052
    break
  else
  end
  if L3_37 == 3 then
    L2_36 = 8053
    do break end
    break
  else
  end
  return L2_36
end
function QuestDeliveryWidget.displayGrandCompanyRank(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43, L6_44, L7_45
  L2_40 = worldMaster
  L3_41 = L2_40
  L2_40 = L2_40._getMyPlayer
  L2_40 = L2_40(L3_41)
  L4_42 = L2_40
  L3_41 = L2_40.getGrandCompanyRank
  L5_43 = A1_39
  L4_42 = L3_41(L4_42, L5_43)
  L5_43 = 1
  L7_45 = L2_40
  L6_44 = L2_40.isMale
  L6_44 = L6_44(L7_45)
  if L6_44 == true then
    L5_43 = 1
  else
    L7_45 = L2_40
    L6_44 = L2_40.isFemale
    L6_44 = L6_44(L7_45)
    if L6_44 == true then
      L5_43 = 2
    end
  end
  L6_44 = A0_38.work
  L6_44.myRank = L3_41
  L6_44 = false
  L7_45 = A0_38.getGrandCompanyStatusIcon
  L7_45 = L7_45(A0_38, A1_39, L3_41)
  A0_38:setIcon("IconControl_CompanyStatus", L7_45)
  A0_38:setText("TextBlock_CompanyRankName", 8079 + A1_39, L3_41, L5_43)
  A0_38:setVisibility("IconControl_CompanyStatus", true)
end
function QuestDeliveryWidget.displayGrandCompanyPoint(A0_46, A1_47)
  local L2_48, L3_49
  L3_49 = A0_46
  L2_48 = A0_46.getGrandCompanyPoint
  L3_49 = L2_48(L3_49, A1_47)
  A0_46:setText("TextBlock_CompanyPoint", 3551, L2_48, L3_49)
end
function QuestDeliveryWidget.getGrandCompanyStatusIcon(A0_50, A1_51, A2_52)
  gcRankSheet:_loadKeyTemporarily(A2_52, A2_52)
  return (gcRankSheet:_getData(A2_52, A1_51 + 6 - 1))
end
function QuestDeliveryWidget.getGrandCompanyPoint(A0_53, A1_54)
  local L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64
  L3_56 = A1_54
  if L3_56 == 1 then
    L2_55 = 1000201
    break
  else
  end
  if L3_56 == 2 then
    L2_55 = 1000202
    break
  else
  end
  if L3_56 == 3 then
    L2_55 = 1000203
    do break end
    break
  else
  end
  L3_56 = worldMaster
  L4_57 = L3_56
  L3_56 = L3_56._getMyPlayer
  L3_56 = L3_56(L4_57)
  L4_57 = A0_53.work
  L4_57 = L4_57.pointMax
  if L4_57 == 0 then
    L4_57 = A0_53.work
    L6_59 = L3_56
    L5_58 = L3_56.getGrandCompanySealMax
    L7_60 = A1_54
    L5_58 = L5_58(L6_59, L7_60)
    L4_57.pointMax = L5_58
  end
  L4_57 = 100
  L5_58 = 0
  L7_60 = L3_56
  L6_59 = L3_56._getItemPackageCapacity
  L6_59 = L6_59(L7_60, L8_61)
  L7_60 = L3_56._getItemPackageFreeSpace
  L7_60 = L7_60(L8_61, L9_62)
  for L11_64 = 1, L6_59 - L7_60 do
    if desktopWidget:getPlayerItemInPackage(L4_57, L11_64) == L2_55 then
      L5_58 = desktopWidget:getPlayerItemInPackage(L4_57, L11_64)
      break
    end
  end
  return L8_61, L9_62
end
function QuestDeliveryWidget.setHamletItemData(A0_65, A1_66)
  local L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77
  if A1_66 ~= nil then
    L3_68 = A1_66
    L2_67 = A1_66._isAlive
    L2_67 = L2_67(L3_68)
    if L2_67 then
      L3_68 = A1_66
      L2_67 = A1_66.getHamletSupplyCraftItemNum
      L2_67 = L2_67(L3_68)
      L4_69 = A1_66
      L3_68 = A1_66.getHamletSupplyGatherItemNum
      L3_68 = L3_68(L4_69)
      L4_69 = "TabItem_4_Maker"
      L6_71 = A1_66
      L5_70 = A1_66.getHamletSupplyCraftItemAnima
      L6_71 = L5_70(L6_71)
      for L10_75 = 1, L2_67 do
        L12_77 = A1_66
        L11_76 = A1_66.getHamletSupplyCraftItemData
        L12_77 = L11_76(L12_77, L10_75)
        A0_65:setListProperty(L4_69, L10_75 - 1, "catalog", L11_76)
        A0_65:setListProperty(L4_69, L10_75 - 1, "nqanima", L5_70)
        A0_65:setListProperty(L4_69, L10_75 - 1, "hqanima", L6_71)
        A0_65:setListProperty(L4_69, L10_75 - 1, "unit", L12_77)
      end
      L7_72(L8_73, L9_74)
      L4_69 = "TabItem_5_Maker"
      L6_71 = L8_73
      L5_70 = L7_72
      for L10_75 = 1, L3_68 do
        L12_77 = A1_66
        L11_76 = A1_66.getHamletSupplyGatherItemData
        L12_77 = L11_76(L12_77, L10_75)
        A0_65:setListProperty(L4_69, L10_75 - 1, "catalog", L11_76)
        A0_65:setListProperty(L4_69, L10_75 - 1, "nqanima", L5_70)
        A0_65:setListProperty(L4_69, L10_75 - 1, "hqanima", L6_71)
        A0_65:setListProperty(L4_69, L10_75 - 1, "unit", L12_77)
      end
      L7_72(L8_73, L9_74)
    end
  end
end
function QuestDeliveryWidget.getHamletItemData(A0_78, A1_79, A2_80)
  local L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88, L11_89
  L3_81 = false
  L4_82 = 0
  L5_83 = 1
  L6_84 = "TabItem_4_Maker"
  L10_88 = L6_84
  for L10_88 = 1, L8_86(L9_87, L10_88) do
    L11_89 = A0_78.getListProperty
    L11_89 = L11_89(A0_78, L6_84, L10_88 - 1, "catalog")
    if L11_89 == A1_79 then
      L11_89 = "nqanima"
      if A2_80 > 1 then
        L11_89 = "hqanima"
      end
      L4_82 = A0_78:getListProperty(L6_84, L10_88 - 1, L11_89)
      L5_83 = A0_78:getListProperty(L6_84, L10_88 - 1, "unit")
      L3_81 = true
      break
    end
  end
  if L3_81 then
    return L7_85, L8_86, L9_87
  end
  L6_84 = "TabItem_5_Maker"
  L10_88 = L6_84
  for L10_88 = 1, L8_86(L9_87, L10_88) do
    L11_89 = A0_78.getListProperty
    L11_89 = L11_89(A0_78, L6_84, L10_88 - 1, "catalog")
    if L11_89 == A1_79 then
      L11_89 = "nqanima"
      if A2_80 > 1 then
        L11_89 = "hqanima"
      end
      L4_82 = A0_78:getListProperty(L6_84, L10_88 - 1, L11_89)
      L5_83 = A0_78:getListProperty(L6_84, L10_88 - 1, "unit")
      L3_81 = true
      break
    end
  end
  return L7_85, L8_86, L9_87
end
function QuestDeliveryWidget.processBeforeShow(A0_90, A1_91)
  if A1_91 ~= true then
    return true
  elseif A0_90:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
    A0_90:closeShopEdit(true)
  elseif A0_90.work.submenu == true then
  else
    A0_90:updateWindowDisplay(true)
  end
  return true
end
function QuestDeliveryWidget.getListPropertyName(A0_92, A1_93)
  local L2_94
  if A1_93 == 1 then
    L2_94 = "TabItem_1_Maker"
    return L2_94
  elseif A1_93 == 2 then
    L2_94 = "TabItem_2_Maker"
    return L2_94
  elseif A1_93 == 3 then
    L2_94 = "TabItem_3_Maker"
    return L2_94
  elseif A1_93 == 4 then
    L2_94 = "TabItem_4_Maker"
    return L2_94
  elseif A1_93 == 5 then
    L2_94 = "TabItem_5_Maker"
    return L2_94
  elseif A1_93 == 8 then
    L2_94 = "SlotItem_Maker"
    return L2_94
  elseif A1_93 == 9 then
    L2_94 = "HelpCache_Maker"
    return L2_94
  end
end
function QuestDeliveryWidget.updateWindowDisplay(A0_95, A1_96)
  A0_95:setGridVisibility(3)
  if A0_95.work.isMateriaList then
    A0_95:setVisibility("Grid_MateriaEquipList", true)
    A0_95:setVisibility("Grid_TabList", false)
  end
  if A0_95.work.listbox == 1 then
    A0_95:setVisibility("Button_SortStatus", true)
    A0_95:displaySortType(A0_95.work.sorttype)
  else
    A0_95:setVisibility("Button_SortStatus", false)
  end
  if A1_96 == true then
    A0_95:updateListFocus()
  end
end
function QuestDeliveryWidget.updateListFocus(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102, L6_103
  L1_98 = A0_97.work
  L1_98 = L1_98.updatecount
  if L1_98 ~= 0 then
    L1_98 = false
    return L1_98
  end
  L2_99 = A0_97
  L1_98 = A0_97.getListBoxFocusNum
  L3_100 = A0_97.work
  L3_100 = L3_100.listbox
  L4_101 = L1_98(L2_99, L3_100)
  L6_103 = A0_97
  L5_102 = A0_97.getListBoxName
  L5_102 = L5_102(L6_103, A0_97.work.listbox)
  L6_103 = "TextBlock_NoContents_"
  L6_103 = L6_103 .. tostring(A0_97.work.listbox)
  if L1_98 == 0 then
    if A0_97:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
      A0_97:closeShopEdit(false)
    end
    A0_97:setVisibility(L6_103, true)
    A0_97:setVisibility(L5_102, false)
    A0_97:displayFocusedItemHelp()
    A0_97:setWindowFocus(L6_103)
  else
    A0_97:setVisibility(L5_102, true)
    A0_97:setVisibility(L6_103, false)
    if A0_97.work.focus > L1_98 - 1 then
      A0_97.work.focus = L1_98 - 1
    end
    if 0 <= A0_97:focusToIndex(A0_97.work.listbox, A0_97.work.focus) then
      A0_97.work.index = A0_97:focusToIndex(A0_97.work.listbox, A0_97.work.focus)
    end
    A0_97:setControlProperty(L5_102, "SqwtFocusedIndex", A0_97.work.focus)
    A0_97:setFocusedIndex(L5_102, A0_97.work.focus)
    A0_97:setWindowFocus(L5_102)
    A0_97:displayFocusedItemHelp()
  end
end
function QuestDeliveryWidget.setGridVisibility(A0_104, A1_105)
  A0_104:setVisibility("Grid_ActorName", false)
  A0_104:setVisibility("Grid_Help", A1_105 == 2)
  A0_104:setVisibility("Grid_TabList", A1_105 == 1 or A1_105 == 2 or A1_105 == 3)
  A0_104:setVisibility("Grid_ItemNameBase", A1_105 == 1 or A1_105 == 3 or A1_105 == 4 or A1_105 == 5)
  A0_104:setVisibility("Grid_ItemDetail1", A0_104.work.bonus1)
  A0_104:setVisibility("Grid_ItemDetail2", A0_104.work.bonus2)
  A0_104:setVisibility("Grid_ItemDetail3", A0_104.work.bonus3 or A0_104.work.itemlife or A0_104.work.bazaar)
  A0_104:setVisibility("Label_ItemBonus5", A0_104.work.bonus3)
  A0_104:setVisibility("Grid_ItemLife", A0_104.work.itemlife)
  A0_104:setVisibility("Grid_ItemBazaarInformation", A0_104.work.bazaar)
end
function QuestDeliveryWidget.setWindowFocus(A0_106, A1_107)
  if A1_107 ~= nil and A1_107 ~= "" then
    A0_106:setLogicalFocus(A1_107)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_106 then
      A0_106:setKeyboardFocusedControl(A1_107)
    end
  end
end
function QuestDeliveryWidget.displayBagcapacityAndMoney(A0_108)
  local L1_109, L2_110, L3_111
  L1_109 = worldMaster
  L2_110 = L1_109
  L1_109 = L1_109._getMyPlayer
  L1_109 = L1_109(L2_110)
  L3_111 = L1_109
  L2_110 = L1_109.getMoneyOnHand
  L2_110 = L2_110(L3_111)
  L3_111 = A0_108.setText
  L3_111(A0_108, "TextBlock_Gil", 3263, L2_110)
  L3_111 = L1_109._getItemPackageCapacity
  L3_111 = L3_111(L1_109, 1)
  A0_108:setText("TextBlock_ItemStack_2", 3551, L3_111 - L1_109:_getItemPackageFreeSpace(1), L3_111)
end
function QuestDeliveryWidget.isExistItem(A0_112, A1_113, A2_114, A3_115)
  if A3_115 == nil or A3_115 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A1_113, A2_114) ~= nil then
      return true
    else
      return false
    end
  elseif A3_115 == 2 then
    if desktopWidget:getBazaarItem(A1_113, A2_114) ~= nil then
      return true
    else
      return false
    end
  end
end
function QuestDeliveryWidget.getSelectedTab(A0_116)
  return A0_116:getSelectedIndex("TabControl_ItemList") + 1
end
function QuestDeliveryWidget.getListBoxName(A0_117, A1_118)
  local L2_119
  if A1_118 == 1 then
    L2_119 = "ListBox_TabItem_1"
    return L2_119
  elseif A1_118 == 2 then
    L2_119 = "ListBox_TabItem_2"
    return L2_119
  elseif A1_118 == 3 then
    L2_119 = "ListBox_TabItem_3"
    return L2_119
  elseif A1_118 == 4 then
    L2_119 = "ListBox_TabItem_4"
    return L2_119
  elseif A1_118 == 5 then
    L2_119 = "ListBox_TabItem_5"
    return L2_119
  else
    L2_119 = ""
    return L2_119
  end
end
function QuestDeliveryWidget.getListBoxItemNum(A0_120, A1_121)
  local L2_122, L3_123
  L3_123 = A0_120
  L2_122 = A0_120.getListPropertyCount
  return L2_122(L3_123, A0_120:getListPropertyName(A1_121))
end
function QuestDeliveryWidget.getListBoxFocusNum(A0_124, A1_125)
  local L2_126, L3_127, L4_128, L5_129
  L3_127 = A0_124
  L2_126 = A0_124.getListBoxItemNum
  L4_128 = A1_125
  L2_126 = L2_126(L3_127, L4_128)
  L4_128 = A0_124
  L3_127 = A0_124.getListPropertyName
  L5_129 = A1_125
  L3_127 = L3_127(L4_128, L5_129)
  if L2_126 == 0 then
    L4_128 = 0
    L5_129 = 0
    return L4_128, L5_129, 0, 0
  end
  L5_129 = A0_124
  L4_128 = A0_124.getControlProperty
  L4_128 = L4_128(L5_129, L3_127, "FilteredCount")
  L5_129 = A0_124.work
  L5_129 = L5_129.focus
  if L4_128 < A0_124.work.focus then
    L5_129 = L4_128 - 1
  end
  return L4_128, L4_128 - 1, 0, L5_129
end
function QuestDeliveryWidget.focusToIndex(A0_130, A1_131, A2_132)
  local L3_133
  L3_133 = A0_130.getListPropertyName
  L3_133 = L3_133(A0_130, A1_131)
  if A0_130:getListBoxFocusNum(A1_131) == 0 or A2_132 >= A0_130:getListBoxFocusNum(A1_131) then
    return -1
  else
    A0_130:setControlProperty(L3_133, "FilteredIndex", A2_132)
    return A0_130:getControlProperty(L3_133, "Index")
  end
end
function QuestDeliveryWidget.indexToFocus(A0_134, A1_135, A2_136)
  local L3_137, L4_138
  L3_137 = -1
  L4_138 = A0_134.getListPropertyName
  L4_138 = L4_138(A0_134, A1_135)
  if A0_134:getListBoxFocusNum(A1_135) > 0 then
    A0_134:setControlProperty(L4_138, "Index", A2_136)
    L3_137 = A0_134:getControlProperty(L4_138, "FilteredIndex")
  end
  return L3_137
end
function QuestDeliveryWidget.initListBox(A0_139, A1_140)
  local L2_141, L3_142
  L3_142 = A0_139
  L2_141 = A0_139.getListBoxName
  L2_141 = L2_141(L3_142, A1_140)
  if L2_141 ~= "" then
    L3_142 = A0_139.setControlProperty
    L3_142(A0_139, L2_141, "IntData.Value0", A1_140)
    L3_142 = A0_139.setControlCommandCondition
    L3_142(A0_139, L2_141, "UILuaCommands.MouseEnteredItem")
    L3_142 = A0_139.setControlCommandCondition
    L3_142(A0_139, L2_141, "UILuaCommands.AnchoredItem")
    L3_142 = A0_139.setControlCommandCondition
    L3_142(A0_139, L2_141, "UILuaCommands.Selection")
    L3_142 = A0_139.setCancelCondition
    L3_142(A0_139, L2_141)
    L3_142 = A0_139.setVisibility
    L3_142(A0_139, L2_141, true)
    L3_142 = "TextBlock_NoContents_"
    L3_142 = L3_142 .. tostring(A1_140)
    A0_139:setVisibility(L3_142, false)
    A0_139:setCancelCondition(L3_142)
    A0_139:setControlProperty(L3_142, "IsTabStop", true)
    A0_139:setControlCommandCondition(L2_141, "UILuaCommands.Previous")
    A0_139:setControlCommandCondition(L2_141, "UILuaCommands.Next")
  end
end
function QuestDeliveryWidget.resetListBox(A0_143, A1_144)
  local L2_145, L3_146
  L3_146 = A0_143
  L2_145 = A0_143.getListBoxItemNum
  L2_145 = L2_145(L3_146, A1_144)
  L3_146 = A0_143.getListPropertyName
  L3_146 = L3_146(A0_143, A1_144)
  if L2_145 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_145 do
      L2_145 = L2_145 - 1
      A0_143:deleteListProperty(L3_146, L2_145)
    end
    A0_143:updateListProperty(L3_146)
  end
end
function QuestDeliveryWidget.getPackageFromList(A0_147, A1_148)
  local L2_149
  L2_149 = 1
  if A1_148 == 1 then
    L2_149 = 1
  elseif A1_148 == 2 then
    L2_149 = 100
  elseif A1_148 == 3 then
    L2_149 = 8
  elseif A1_148 == 4 then
    L2_149 = 5
  elseif A1_148 == 5 then
    L2_149 = 100
  end
  return L2_149
end
function QuestDeliveryWidget.setItemToXmlLight(A0_150, A1_151, A2_152, A3_153, A4_154, A5_155)
  local L6_156, L7_157, L8_158, L9_159, L10_160, L11_161, L12_162, L13_163, L14_164, L15_165, L16_166, L17_167, L18_168, L19_169, L20_170, L21_171
  L7_157 = A0_150
  L6_156 = A0_150.getListPropertyName
  L8_158 = A1_151
  L7_157 = L6_156(L7_157, L8_158)
  L8_158, L9_159, L10_160, L11_161 = nil, nil, nil, nil
  L12_162 = worldMaster
  L13_163 = L12_162
  L12_162 = L12_162._getMyPlayer
  L12_162 = L12_162(L13_163)
  L13_163, L14_164 = nil, nil
  if A3_153 > 0 and A4_154 > 0 then
    L16_166 = L12_162
    L15_165 = L12_162._getItem
    L17_167 = A3_153
    L18_168 = A4_154
    L15_165 = L15_165(L16_166, L17_167, L18_168)
    L13_163 = L15_165
  end
  if L13_163 == nil then
    L15_165 = false
    return L15_165
  end
  L16_166 = L13_163
  L15_165 = L13_163._getCatalogID
  L15_165 = L15_165(L16_166)
  L8_158 = L15_165
  L16_166 = L13_163
  L15_165 = L13_163.getItemIcon
  L15_165 = L15_165(L16_166)
  L9_159 = L15_165
  L16_166 = L13_163
  L15_165 = L13_163._isStackable
  L15_165 = L15_165(L16_166)
  L10_160 = L15_165
  L16_166 = L13_163
  L15_165 = L13_163._countStack
  L15_165 = L15_165(L16_166)
  L11_161 = L15_165
  L16_166 = L13_163
  L15_165 = L13_163._getNameIndex
  L15_165 = L15_165(L16_166)
  L16_166 = "TBL_null"
  L17_167 = A0_150.work
  L17_167 = L17_167.sorttype
  L18_168 = 7
  if A1_151 == 2 then
    L17_167 = 11
    L18_168 = 8
  end
  L19_169 = desktopWidget
  L20_170 = L19_169
  L19_169 = L19_169.setItemToXml
  L21_171 = A0_150
  L19_169(L20_170, L21_171, L6_156, A2_152, L13_163, L16_166, L8_158, L9_159, L10_160, L11_161, L15_165, L17_167, true, false, L18_168, A3_153, A4_154, A5_155, false)
  L19_169 = true
  L20_170 = A0_150.work
  L20_170 = L20_170.shopid
  if L20_170 == 0 then
    L20_170 = A0_150.work
    L20_170 = L20_170.orderCatalog
    if L20_170 == 0 then
      L19_169 = false
      L21_171 = A0_150
      L20_170 = A0_150.getArgActor
      L20_170 = L20_170(L21_171)
      if L20_170 ~= nil then
        L21_171 = L20_170._isAlive
        L21_171 = L21_171(L20_170)
        if L21_171 then
          L21_171 = L20_170.eventQuestSupplyItemActor
          L14_164, L21_171 = L20_170, L21_171(L20_170, L13_163)
          L19_169 = L21_171
          L21_171 = A0_150.setListText
          L21_171(A0_150, L6_156, A2_152, "price", 225, L14_164)
          L21_171 = A0_150.setListProperty
          L21_171(A0_150, L6_156, A2_152, "pricedata", L14_164)
        end
      end
    else
      L20_170 = A0_150.work
      L20_170 = L20_170.orderCatalog
      if L8_158 == L20_170 then
        L20_170 = L11_161
        if L10_160 == false then
          L20_170 = 1
        end
        L21_171 = L13_163._getNameIndex
        L21_171 = L21_171(L13_163)
        if L21_171 == 1 then
          L21_171 = A0_150.setListText
          L21_171(A0_150, L6_156, A2_152, "price", 225, A0_150.work.rewardCS * L20_170)
          L21_171 = A0_150.setListProperty
          L21_171(A0_150, L6_156, A2_152, "pricedata", A0_150.work.rewardCS)
        else
          L21_171 = A0_150.setListText
          L21_171(A0_150, L6_156, A2_152, "price", 225, A0_150.work.rewardHQCS * L20_170)
          L21_171 = A0_150.setListProperty
          L21_171(A0_150, L6_156, A2_152, "pricedata", A0_150.work.rewardHQCS)
        end
      else
        L19_169 = false
        L21_171 = A0_150
        L20_170 = A0_150.setListProperty
        L20_170(L21_171, L6_156, A2_152, "price", "")
        L21_171 = A0_150
        L20_170 = A0_150.setListProperty
        L20_170(L21_171, L6_156, A2_152, "pricedata", 0)
      end
    end
  else
    L20_170 = A0_150.work
    L20_170 = L20_170.orderCatalog
    if L20_170 == 0 then
      L19_169 = false
      L21_171 = L13_163
      L20_170 = L13_163.isEquipment
      L20_170 = L20_170(L21_171)
      if L20_170 then
        L21_171 = L13_163
        L20_170 = L13_163.isMateriaAttached
        L20_170 = L20_170(L21_171)
        if L20_170 then
          L19_169 = true
        end
      end
      L21_171 = A0_150
      L20_170 = A0_150.setListProperty
      L20_170(L21_171, L6_156, A2_152, "price", "")
      L21_171 = A0_150
      L20_170 = A0_150.setListProperty
      L20_170(L21_171, L6_156, A2_152, "pricedata", 0)
    else
      L21_171 = A0_150
      L20_170 = A0_150.getHamletItemData
      L21_171 = L20_170(L21_171, L8_158, L15_165)
      L19_169 = L20_170
      A0_150:setListText(L6_156, A2_152, "price", 225, _math.floor(1 / L20_170(L21_171, L8_158, L15_165)) * L21_171)
      A0_150:setListProperty(L6_156, A2_152, "pricedata", L21_171)
    end
  end
  L21_171 = L13_163
  L20_170 = L13_163._isEquipping
  L20_170 = L20_170(L21_171)
  if L20_170 then
    L21_171 = A0_150
    L20_170 = A0_150.setListProperty
    L20_170(L21_171, L6_156, A2_152, "opacity", "0.5")
  else
    L21_171 = A0_150
    L20_170 = A0_150.setListProperty
    L20_170(L21_171, L6_156, A2_152, "opacity", "1.0")
  end
  L21_171 = A0_150
  L20_170 = A0_150.setListPropertyVisibility
  L20_170(L21_171, L6_156, A2_152, L19_169)
  L20_170 = A0_150.work
  L20_170 = L20_170.updatecount
  if L20_170 > 0 then
    L20_170 = A0_150.work
    L20_170 = L20_170.listbox
    if L20_170 == A1_151 then
      L21_171 = A0_150
      L20_170 = A0_150.getControlProperty
      L20_170 = L20_170(L21_171, L6_156, "FilteredIndex")
      L21_171 = A0_150.work
      L21_171 = L21_171.focus
      if L20_170 < L21_171 then
        L21_171 = A0_150.work
        L21_171.focusChange = true
      end
    end
  end
  L20_170 = true
  return L20_170
end
function QuestDeliveryWidget.setSortType(A0_172, A1_173, A2_174)
  local L3_175, L4_176
  L3_175 = worldMaster
  L4_176 = L3_175
  L3_175 = L3_175._getMyPlayer
  L3_175 = L3_175(L4_176)
  L4_176 = L3_175._getItem
  L4_176 = L4_176(L3_175, 1, A2_174 + 1)
  if L4_176 == nil then
    return
  end
  desktopWidget:setSortType(A0_172, A1_173, A2_174, A0_172.work.sorttype, L4_176)
end
function QuestDeliveryWidget.updateSortType(A0_177)
  local L1_178
  L1_178 = A0_177.getListPropertyName
  L1_178 = L1_178(A0_177, 1)
  for _FORV_5_ = 1, A0_177:getListBoxItemNum(1) do
    A0_177:setSortType(L1_178, _FORV_5_ - 1)
  end
  A0_177:updateListProperty(L1_178)
end
function QuestDeliveryWidget.makeListFromPackage(A0_179, A1_180, A2_181)
  local L3_182, L4_183, L5_184, L6_185, L7_186, L8_187, L9_188, L10_189, L11_190, L12_191, L13_192
  L3_182 = worldMaster
  L4_183 = L3_182
  L3_182 = L3_182._getMyPlayer
  L3_182 = L3_182(L4_183)
  L4_183, L5_184, L6_185, L7_186, L8_187, L9_188 = nil, nil, nil, nil, nil, nil
  if A2_181 == nil then
    if A1_180 == 1 or A1_180 == nil then
      L4_183 = 0
      L5_184 = L10_189
      L6_185 = L10_189
      L7_186 = L10_189
      L8_187 = L10_189
      L9_188 = L10_189
      L13_192 = "SourceFirstIndex"
      L10_189(L11_190, L12_191, L13_192, 0)
      L13_192 = "SourceCount"
      L10_189(L11_190, L12_191, L13_192, L7_186)
      L13_192 = "FilteredSortKey"
      L10_189(L11_190, L12_191, L13_192, "sorttype")
      for L13_192 = 1, L7_186 - L8_187 do
        if A0_179:setItemToXmlLight(1, L4_183, 1, L13_192) == true then
          L4_183 = L4_183 + 1
        else
          break
        end
      end
      if L6_185 > L4_183 then
        for L13_192 = L4_183, L6_185 - 1 do
          L6_185 = L6_185 - 1
          A0_179:deleteListProperty(L5_184, L6_185)
        end
      end
      L10_189(L11_190, L12_191)
    end
    if A1_180 == 100 or A1_180 == nil then
      L7_186 = L10_189
      L4_183 = 0
      L6_185 = L10_189
      L5_184 = L10_189
      L9_188 = L10_189
      L13_192 = "SourceFirstIndex"
      L10_189(L11_190, L12_191, L13_192, 0)
      L13_192 = "SourceCount"
      L10_189(L11_190, L12_191, L13_192, L7_186)
      L13_192 = "FilteredSortKey"
      L10_189(L11_190, L12_191, L13_192, "sorttype")
      for L13_192 = 1, L7_186 do
        if A0_179:setItemToXmlLight(2, L4_183, 100, L13_192) == true then
          L4_183 = L4_183 + 1
        else
          break
        end
      end
      if L6_185 > L4_183 then
        for L13_192 = L4_183, L6_185 - 1 do
          L6_185 = L6_185 - 1
          A0_179:deleteListProperty(L5_184, L6_185)
        end
      end
      L10_189(L11_190, L12_191)
    end
  else
    if A1_180 == 1 then
    elseif A1_180 == 100 then
    else
      return
    end
    L13_192 = L10_189
    L5_184 = L11_190
    L13_192 = A1_180
    if L11_190 ~= nil then
      L13_192 = L10_189
      L11_190(L12_191, L13_192, A2_181 - 1, A1_180, A2_181)
    else
      L13_192 = L10_189
      L13_192 = A0_179
      L12_191(L13_192, L5_184, L11_190 - 1)
      L13_192 = A0_179
      L12_191(L13_192, L5_184)
    end
  end
  L10_189(L11_190)
end
function QuestDeliveryWidget.displayHelp(A0_193, A1_194, A2_195)
  A0_193:setText("TextBlock_Help", A1_194, A2_195)
end
function QuestDeliveryWidget.displayFocusedItemHelp(A0_196)
  local L1_197, L2_198, L3_199, L4_200, L5_201, L6_202, L7_203, L8_204, L9_205, L10_206, L11_207, L12_208, L13_209, L14_210, L15_211
  L1_197 = A0_196.work
  L1_197 = L1_197.updatecount
  if L1_197 > 0 then
    L1_197 = false
    return L1_197
  end
  L2_198 = A0_196
  L1_197 = A0_196.getListBoxFocusNum
  L3_199 = A0_196.work
  L3_199 = L3_199.listbox
  L1_197 = L1_197(L2_198, L3_199)
  if L1_197 == 0 then
    L1_197 = A0_196.work
    L1_197 = L1_197.orderCatalog
    if L1_197 ~= 0 then
      L1_197 = A0_196.work
      L1_197 = L1_197.shopid
      if L1_197 == 0 then
        L2_198 = A0_196
        L1_197 = A0_196.displayHelp
        L3_199 = 8033
        L4_200 = A0_196.work
        L4_200 = L4_200.orderCatalog
        L1_197(L2_198, L3_199, L4_200)
      else
        L2_198 = A0_196
        L1_197 = A0_196.displayHelp
        L3_199 = 3140
        L1_197(L2_198, L3_199)
      end
    else
      L2_198 = A0_196
      L1_197 = A0_196.displayHelp
      L3_199 = 3140
      L1_197(L2_198, L3_199)
    end
    L1_197 = A0_196.work
    L1_197.bonus1 = false
    L1_197 = A0_196.work
    L1_197.bonus2 = false
    L1_197 = A0_196.work
    L1_197.bonus3 = false
    L1_197 = A0_196.work
    L1_197.itemlife = false
    L1_197 = A0_196.work
    L1_197.page = 0
    L2_198 = A0_196
    L1_197 = A0_196.setGridVisibility
    L3_199 = 2
    L1_197(L2_198, L3_199)
    L1_197 = false
    return L1_197
  end
  L2_198 = A0_196
  L1_197 = A0_196.getListBoxItemNum
  L3_199 = A0_196.work
  L3_199 = L3_199.listbox
  L1_197 = L1_197(L2_198, L3_199)
  L2_198 = A0_196.work
  L2_198 = L2_198.index
  if L1_197 <= L2_198 then
    L1_197 = false
    return L1_197
  end
  L2_198 = A0_196
  L1_197 = A0_196.getListPropertyName
  L3_199 = A0_196.work
  L3_199 = L3_199.listbox
  L1_197 = L1_197(L2_198, L3_199)
  L3_199 = A0_196
  L2_198 = A0_196.getPackageFromList
  L4_200 = A0_196.work
  L4_200 = L4_200.listbox
  L2_198 = L2_198(L3_199, L4_200)
  L3_199 = A0_196.work
  L3_199 = L3_199.index
  L3_199 = L3_199 + 1
  L4_200 = 1
  L5_201 = worldMaster
  L6_202 = L5_201
  L5_201 = L5_201._getMyPlayer
  L5_201 = L5_201(L6_202)
  L6_202 = nil
  if L4_200 == 1 then
    L8_204 = L5_201
    L7_203 = L5_201._getItem
    L9_205 = L2_198
    L10_206 = L3_199
    L7_203 = L7_203(L8_204, L9_205, L10_206)
    L6_202 = L7_203
  elseif L4_200 == 2 then
    L7_203 = desktopWidget
    L8_204 = L7_203
    L7_203 = L7_203.getBazaarItem
    L9_205 = L2_198
    L10_206 = L3_199
    L7_203 = L7_203(L8_204, L9_205, L10_206)
    L6_202 = L7_203
  end
  L7_203 = desktopWidget
  L8_204 = L7_203
  L7_203 = L7_203.setItemDetail
  L9_205 = A0_196
  L10_206 = L6_202
  L11_207 = L1_197
  L7_203(L8_204, L9_205, L10_206, L11_207, L12_208)
  L7_203 = A0_196.work
  L7_203.bazaar = false
  L8_204 = A0_196
  L7_203 = A0_196.setVisibility
  L9_205 = "Grid_RewardMoney"
  L10_206 = false
  L7_203(L8_204, L9_205, L10_206)
  L8_204 = A0_196
  L7_203 = A0_196.setVisibility
  L9_205 = "Grid_RewardItem"
  L10_206 = false
  L7_203(L8_204, L9_205, L10_206)
  L7_203 = nil
  L8_204 = 0
  L9_205 = 0
  L10_206 = 0
  L11_207 = 0
  if L12_208 == true then
    for L15_211 = 1, 27 do
      if L6_202:isFitForEquipPoint(L15_211) == true then
        if L8_204 == 0 then
          L8_204 = L15_211
        elseif L9_205 == 0 then
          L9_205 = L15_211
        elseif L10_206 == 0 then
          L10_206 = L15_211
        elseif L11_207 == 0 then
          L11_207 = L15_211
          break
        end
      end
    end
  end
  if L8_204 ~= 0 then
    L7_203 = L12_208
  end
  if L7_203 == nil and L9_205 ~= 0 then
    L7_203 = L12_208
  end
  if L7_203 == nil and L10_206 ~= 0 then
    L7_203 = L12_208
  end
  if L7_203 == nil and L11_207 ~= 0 then
    L7_203 = L12_208
  end
  L15_211 = A0_196.work
  L12_208.bonus1, L13_209.bonus2, L14_210.bonus3, L15_211.itemlife = desktopWidget:setItemDetailEquip(A0_196, L6_202, L1_197, A0_196.work.index, L7_203)
  L12_208(L13_209, L14_210)
end
function QuestDeliveryWidget.previousSequence(A0_212)
  A0_212:saveSortType()
  A0_212:setBaseAskResult(-1)
end
function QuestDeliveryWidget.processUICommandOperate(A0_213, A1_214, A2_215, A3_216, A4_217)
  local L5_218, L6_219
  L5_218 = A2_215
  if L5_218 == "Button_SortStatus" then
    L6_219 = A0_213.changeSortType
    L6_219(A0_213)
    L6_219 = A0_213.work
    L6_219 = L6_219.index
    A0_213:updateSortType()
    if A0_213:indexToFocus(A0_213.work.listbox, L6_219) > -1 then
      A0_213.work.focus = A0_213:indexToFocus(A0_213.work.listbox, L6_219)
    end
    if A0_213:focusToIndex(A0_213.work.listbox, A0_213.work.focus) >= 0 then
      A0_213.work.index = A0_213:focusToIndex(A0_213.work.listbox, A0_213.work.focus)
    end
    A0_213:displaySortType(A0_213.work.sorttype)
    do break end
    break
  else
  end
end
function QuestDeliveryWidget.processUICommandCancel(A0_220, A1_221, A2_222, A3_223, A4_224)
  if A0_220.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_220.work.waitNext == true then
    return false
  end
  if A0_220:isAskFinish() == true then
    return false
  end
  A0_220:previousSequence()
end
function QuestDeliveryWidget.processUICommandClose(A0_225, A1_226, A2_227, A3_228, A4_229)
  A0_225:previousSequence()
end
function QuestDeliveryWidget.processUICommandSelection(A0_230, A1_231, A2_232, A3_233, A4_234)
  local L5_235, L6_236, L7_237
  L5_235 = A0_230.work
  L5_235 = L5_235.editWidgetOpen
  if L5_235 ~= 0 then
    L6_236 = A0_230
    L5_235 = A0_230.getChildWidgetByWindowName
    L7_237 = "ShopEditWidget"
    L5_235 = L5_235(L6_236, L7_237)
    if L5_235 == nil then
      L5_235 = worldMaster
      L6_236 = L5_235
      L5_235 = L5_235._getServerTime
      L5_235 = L5_235(L6_236)
      L6_236 = A0_230.work
      L6_236 = L6_236.lastcommandtime
      L5_235 = L5_235 - L6_236
      if L5_235 > 2 then
        L6_236 = A0_230
        L5_235 = A0_230.closeShopEdit
        L7_237 = true
        L5_235(L6_236, L7_237)
      end
    else
      L5_235 = false
      return L5_235
    end
  end
  L5_235 = A0_230.work
  L5_235 = L5_235.waitNext
  if L5_235 == true then
    L5_235 = false
    return L5_235
  end
  L6_236 = A0_230
  L5_235 = A0_230.isAskFinish
  L5_235 = L5_235(L6_236)
  if L5_235 == true then
    L5_235 = false
    return L5_235
  end
  L5_235 = desktopWidget
  L6_236 = L5_235
  L5_235 = L5_235.checkKeyboardFocused
  L7_237 = A0_230
  L5_235 = L5_235(L6_236, L7_237)
  if L5_235 == false then
    return
  end
  L5_235 = A0_230.work
  L5_235.focus = A3_233
  L5_235 = A0_230.work
  L5_235.listbox = A4_234
  L6_236 = A0_230
  L5_235 = A0_230.getListBoxItemNum
  L7_237 = A0_230.work
  L7_237 = L7_237.listbox
  L5_235 = L5_235(L6_236, L7_237)
  if L5_235 == 0 then
    L6_236 = A0_230
    L5_235 = A0_230.updateWindowDisplay
    L7_237 = true
    return L5_235(L6_236, L7_237)
  end
  L5_235 = A0_230.work
  L5_235 = L5_235.focus
  L7_237 = A0_230
  L6_236 = A0_230.getListBoxFocusNum
  L6_236 = L6_236(L7_237, A0_230.work.listbox)
  if L5_235 >= L6_236 then
    L6_236 = A0_230
    L5_235 = A0_230.updateListFocus
    return L5_235(L6_236)
  end
  L6_236 = A0_230
  L5_235 = A0_230.updateWindowDisplay
  L7_237 = true
  L5_235(L6_236, L7_237)
  L5_235 = A0_230.work
  L5_235 = L5_235.waitupdate
  if L5_235 == true then
    return
  end
  L5_235 = worldMaster
  L6_236 = L5_235
  L5_235 = L5_235._getServerTime
  L5_235 = L5_235(L6_236)
  L6_236 = A0_230.work
  L6_236 = L6_236.lastcommandtime
  L5_235 = L5_235 - L6_236
  if L5_235 < 1 then
    L5_235 = false
    return L5_235
  end
  L5_235 = A0_230.work
  L7_237 = A0_230
  L6_236 = A0_230.getPackageFromList
  L6_236 = L6_236(L7_237, A0_230.work.listbox)
  L5_235.chosenPackage = L6_236
  L5_235 = A0_230.work
  L6_236 = A0_230.work
  L6_236 = L6_236.index
  L6_236 = L6_236 + 1
  L5_235.chosenItem = L6_236
  L5_235 = worldMaster
  L6_236 = L5_235
  L5_235 = L5_235._getMyPlayer
  L5_235 = L5_235(L6_236)
  L7_237 = L5_235
  L6_236 = L5_235._getItem
  L6_236 = L6_236(L7_237, A0_230.work.chosenPackage, A0_230.work.chosenItem)
  L7_237 = A0_230.work
  L7_237 = L7_237.chosenPackage
  if L7_237 == 1 then
    L7_237 = L6_236._isEquipping
    L7_237 = L7_237(L6_236)
    if L7_237 ~= false then
      return
    end
  else
    L7_237 = A0_230.work
    L7_237 = L7_237.chosenPackage
    if L7_237 ~= 100 then
      return
    end
  end
  L7_237 = nil
  if 0 < A0_230.work.shopid then
    if A0_230.work.orderCatalog == 0 then
      A0_230.work.waitForPrice = true
      A0_230:selectedBorder(A0_230.work.chosenItem - 1, true)
      A0_230:setBaseAskResult(1)
    else
      if A0_230.work.shopid ~= 0 then
        if L6_236:_getNameIndex() == 1 then
          L7_237 = A0_230.work.rewardCS
        else
          L7_237 = A0_230.work.rewardHQCS
        end
      else
        L7_237 = A0_230:getListProperty(A0_230:getListPropertyName(A0_230.work.listbox), A0_230.work.index, "pricedata")
      end
      A0_230:setPrice(A0_230.work.chosenPackage, A0_230.work.chosenItem, L7_237)
    end
  else
    if 2 < A0_230.work.mode then
      L7_237 = A0_230:getListProperty(A0_230:getListPropertyName(A0_230.work.listbox), A0_230.work.index, "pricedata")
    elseif L6_236:_getNameIndex() == 1 then
      L7_237 = A0_230.work.rewardCS
    else
      L7_237 = A0_230.work.rewardHQCS
    end
    A0_230:setPrice(A0_230.work.chosenPackage, A0_230.work.chosenItem, L7_237)
  end
end
function QuestDeliveryWidget.processUICommandDefault(A0_238, A1_239, A2_240, A3_241, A4_242, A5_243)
  if A0_238.work.editWidgetOpen ~= 0 then
    if A0_238:getChildWidgetByWindowName("ShopEditWidget") == nil and worldMaster:_getServerTime() - A0_238.work.lastcommandtime > 2 then
      A0_238:closeShopEdit(true)
    else
      return false
    end
  end
  if A0_238.work.waitNext == true then
    return false
  end
  if A0_238:isAskFinish() == true then
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
    A0_238.work.listbox = A5_243
    A0_238.work.focus = A4_242
    A0_238:setCommonTimer(0.2)
  elseif A3_241 == "UILuaCommands.TabChanged" then
    A0_238.work.listbox = 0 + A0_238:getSelectedTab()
    A0_238:changeList()
  elseif A3_241 == "UILuaCommands.Previous" then
    A0_238:catalogSkip(-1)
  elseif A3_241 == "UILuaCommands.Next" then
    A0_238:catalogSkip(1)
  end
end
function QuestDeliveryWidget.processTimer(A0_244)
  if A0_244:focusToIndex(A0_244.work.listbox, A0_244.work.focus) >= 0 then
    A0_244.work.index = A0_244:focusToIndex(A0_244.work.listbox, A0_244.work.focus)
  end
  A0_244.work.page = 0
  A0_244:updateWindowDisplay(true)
  A0_244:selectedBorder()
end
function QuestDeliveryWidget.catalogSkip(A0_245, A1_246)
  local L2_247, L3_248, L4_249, L5_250, L6_251, L7_252, L8_253, L9_254, L10_255, L11_256, L12_257, L13_258
  L2_247 = A0_245.work
  L2_247 = L2_247.focus
  L4_249 = A0_245
  L3_248 = A0_245.getListBoxFocusNum
  L5_250 = A0_245.work
  L5_250 = L5_250.listbox
  L3_248 = L3_248(L4_249, L5_250)
  L3_248 = L3_248 - 1
  if L3_248 == -1 then
    return
  end
  L4_249 = 2
  L5_250 = A0_245.work
  L5_250 = L5_250.listbox
  if L5_250 ~= 1 then
    L5_250 = 10 * A1_246
    L2_247 = L2_247 + L5_250
  else
    L5_250 = A0_245.work
    L5_250 = L5_250.sorttype
    if L5_250 == 0 then
      L5_250 = 10 * A1_246
      L2_247 = L2_247 + L5_250
    else
      L5_250 = nil
      if A1_246 > 0 then
        L6_251 = A0_245.work
        L6_251 = L6_251.focus
        L5_250 = L3_248 - L6_251
      else
        L6_251 = A0_245.work
        L5_250 = L6_251.focus
      end
      L7_252 = A0_245
      L6_251 = A0_245.getListPropertyName
      L8_253 = A0_245.work
      L8_253 = L8_253.listbox
      L6_251 = L6_251(L7_252, L8_253)
      L7_252 = desktopWidget
      L8_253 = L7_252
      L7_252 = L7_252.getItemSortKey
      L12_257 = 1
      L13_258 = L4_249
      L7_252 = L7_252(L8_253, L9_254, L10_255, L11_256, L12_257, L13_258)
      L8_253 = L2_247
      for L12_257 = 1, L5_250 do
        L8_253 = L8_253 + A1_246
        L13_258 = A0_245.focusToIndex
        L13_258 = L13_258(A0_245, A0_245.work.listbox, L8_253)
        if L7_252 ~= desktopWidget:getItemSortKey(A0_245, L6_251, L13_258, 1, L4_249) then
          L2_247 = L2_247 + L12_257 * A1_246
          break
        end
        if L12_257 == L5_250 then
          if A1_246 > 0 then
            L2_247 = L3_248
          else
            L2_247 = 0
          end
        end
      end
    end
  end
  if L3_248 < L2_247 then
    L2_247 = L3_248
  elseif L2_247 < 0 then
    L2_247 = 0
  end
  L5_250 = A0_245.work
  L5_250 = L5_250.focus
  if L2_247 ~= L5_250 then
    L5_250 = A0_245.work
    L5_250.focus = L2_247
    L6_251 = A0_245
    L5_250 = A0_245.updateWindowDisplay
    L7_252 = true
    L5_250(L6_251, L7_252)
  end
end
function QuestDeliveryWidget.selectedBorder(A0_259, A1_260, A2_261)
  local L3_262, L4_263
  L3_262 = A0_259.getListPropertyName
  L3_262 = L3_262(L4_263, A0_259.work.listbox)
  if A1_260 ~= nil then
    A0_259:setListProperty(L3_262, A0_259.work.index, "selected", L4_263)
    A0_259.work.selected = A0_259.work.index
  elseif L4_263 == -1 and A2_261 == nil then
    return
  else
    for _FORV_7_ = 1, A0_259:getListBoxItemNum(A0_259.work.listbox) do
      A0_259:setListProperty(L3_262, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_263.selected = -1
  end
  L4_263(A0_259, L3_262)
end
function QuestDeliveryWidget.changeList(A0_264)
  A0_264:setText("TextBlock_Title", A0_264:getControlProperty("TabItem_" .. tostring(A0_264.work.listbox), "Header"))
  A0_264.work.index = 0
  A0_264.work.focus = 0
  return A0_264:updateWindowDisplay(true)
end
function QuestDeliveryWidget.operateSell(A0_265)
  A0_265:setBaseAskResult(1)
  A0_265.work.lastcommandtime = worldMaster:_getServerTime()
  return true
end
function QuestDeliveryWidget.operateSort(A0_266, A1_267)
  local L2_268
  L2_268 = A0_266.work
  L2_268 = L2_268.listbox
  if L2_268 == 1 then
    if A1_267 ~= nil then
      L2_268 = A0_266.work
      L2_268.sorttype = A1_267
    else
      L2_268 = A0_266.changeSortType
      L2_268(A0_266)
    end
    L2_268 = A0_266.work
    L2_268 = L2_268.index
    A0_266:updateSortType()
    if A0_266:indexToFocus(A0_266.work.listbox, L2_268) > -1 then
      A0_266.work.focus = A0_266:indexToFocus(A0_266.work.listbox, L2_268)
    end
    if A0_266:focusToIndex(A0_266.work.listbox, A0_266.work.focus) >= 0 then
      A0_266.work.index = A0_266:focusToIndex(A0_266.work.listbox, A0_266.work.focus)
    end
    A0_266:displaySortType(A0_266.work.sorttype)
    A0_266.work.lastsub = 9
  end
  L2_268 = true
  return L2_268
end
function QuestDeliveryWidget.updatePlayerItem(A0_269, A1_270, A2_271)
  local L3_272, L4_273
  L3_272 = -1
  if A1_270 == 0 then
    L4_273 = A0_269.work
    L4_273.updatecount = A2_271
    L4_273 = A0_269.work
    L4_273.indexChange = false
    L4_273 = A0_269.work
    L4_273.focusChange = false
    return
  else
    if A1_270 == 1 then
      L4_273 = A0_269.makeListFromPackage
      L4_273(A0_269, A1_270, A2_271)
      L3_272 = 1
    elseif A1_270 == 100 then
      L4_273 = A0_269.makeListFromPackage
      L4_273(A0_269, A1_270, A2_271)
      L3_272 = 2
    end
    L4_273 = A0_269.work
    L4_273 = L4_273.chosenPackage
    if L4_273 == A1_270 then
      L4_273 = A0_269.work
      L4_273 = L4_273.chosenItem
      if L4_273 == A2_271 then
        L4_273 = A0_269.work
        L4_273 = L4_273.editWidgetOpen
        if L4_273 == 0 then
          L4_273 = A0_269.work
          L4_273 = L4_273.submenu
        elseif L4_273 == true then
          L4_273 = A0_269.work
          L4_273.closeok = true
        end
      end
    end
  end
  L4_273 = A0_269.work
  L4_273 = L4_273.updatecount
  if L4_273 > 0 then
    L4_273 = A0_269.work
    L4_273.updatecount = A0_269.work.updatecount - 1
  end
  L4_273 = A0_269.work
  L4_273 = L4_273.updatecount
  if L4_273 == 0 then
    if L3_272 ~= -1 then
      L4_273 = A0_269.getListPropertyName
      L4_273 = L4_273(A0_269, L3_272)
      A0_269:updateListProperty(L4_273)
    end
    L4_273 = A0_269.work
    L4_273 = L4_273.closeok
    if L4_273 == true then
      L4_273 = A0_269.closeShopEdit
      L4_273(A0_269, true)
      L4_273 = A0_269.work
      L4_273.closeok = false
    end
    L4_273 = A0_269.displayBagcapacityAndMoney
    L4_273(A0_269)
    L4_273 = A0_269.work
    L4_273 = L4_273.shopid
    if L4_273 == 0 then
      L4_273 = A0_269.displayGrandCompanyPoint
      L4_273(A0_269, A0_269.work.townID)
    end
    L4_273 = A0_269.work
    L4_273 = L4_273.listbox
    if L3_272 == L4_273 then
      L4_273 = A0_269.updateListFocus
      L4_273(A0_269)
    end
  end
  L4_273 = A0_269.work
  L4_273.waitupdate = false
end
function QuestDeliveryWidget.setShopEditData(A0_274, A1_275, A2_276)
  local L3_277
  L3_277 = A0_274.work
  L3_277.chosenOperation = A1_275
  L3_277 = A0_274.work
  L3_277.buycount = A2_276
end
function QuestDeliveryWidget.closeShopEdit(A0_278, A1_279)
  if A1_279 == nil then
    if A0_278.work.chosenOperation == 1 then
      A0_278:setBaseAskResult(1)
      A0_278:setInputEnable(false)
      A0_278.work.waitNext = true
    else
      A0_278.work.editWidgetOpen = 0
      A0_278:selectedBorder(nil, false)
      A0_278:setInputEnable(true)
    end
  end
  if A0_278.work.isMateriaList then
    A0_278:closeMateriaList()
  end
  A0_278.work.chosenOperation = 0
  if A0_278:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
  end
  A0_278.work.editWidgetOpen = 0
  A0_278.work.lastcommandtime = worldMaster:_getServerTime()
  if A1_279 == nil then
    A0_278:updateWindowDisplay(true)
  end
  return true
end
function QuestDeliveryWidget.checkChosenItem(A0_280, A1_281, A2_282, A3_283)
  if A2_282 ~= nil and A2_282 ~= A0_280.work.chosenPackage then
    return false
  end
  if A3_283 ~= nil and A3_283 ~= A0_280.work.chosenItem then
    return false
  end
  if A0_280.work.chosenPackage ~= A0_280:getPackageFromList(A0_280.work.listbox) then
    return false
  end
  if A0_280.work.chosenItem ~= A0_280.work.index + 1 then
    return false
  end
  if worldMaster:_getMyPlayer():_getItem(A0_280.work.chosenPackage, A0_280.work.chosenItem) == A1_281 then
    return true
  else
    return false
  end
end
function QuestDeliveryWidget.getItemContent(A0_284, A1_285, A2_286, A3_287)
  local L4_288, L5_289, L6_290
  if A1_285 == nil then
    L5_289 = A0_284
    L4_288 = A0_284.getControlProperty
    L6_290 = A2_286
    return L4_288(L5_289, L6_290, A3_287)
  else
    L4_288 = worldMaster
    L5_289 = L4_288
    L4_288 = L4_288._getMyPlayer
    L4_288 = L4_288(L5_289)
    L6_290 = L4_288
    L5_289 = L4_288._getItem
    L5_289 = L5_289(L6_290, A0_284.work.chosenPackage, A0_284.work.chosenItem)
    if A2_286 == "isEquipping" and L5_289 ~= nil then
      L6_290 = L5_289._isEquipping
      L6_290 = L6_290(L5_289)
      if L6_290 == true then
        L6_290 = 1
        return L6_290
      else
        L6_290 = 0
        return L6_290
      end
    end
    if A2_286 == "materianumber" then
      if L5_289 ~= nil then
        L6_290 = desktopWidget
        L6_290 = L6_290.getItemMateriaAttachInfo
        L6_290 = L6_290(L6_290, L5_289)
        return L6_290
      else
        L6_290 = 0
        return L6_290
      end
    end
    if A2_286 == "materiapermission" then
      if L5_289 ~= nil then
        L6_290 = desktopWidget
        L6_290 = L6_290.getItemMateriaAttachInfo
        L6_290 = L6_290(L6_290, L5_289)
        return L6_290(L6_290, L5_289)
      else
        L6_290 = false
        return L6_290
      end
    end
    if A2_286 == "polish" then
      L6_290 = false
      if L5_289 ~= nil and L5_289:isEquipment() and L5_289:getNormalItemFitness() == 10000 then
        L6_290 = true
      end
      return L6_290
    end
    L6_290 = A0_284.getListPropertyName
    L6_290 = L6_290(A0_284, A0_284.work.listbox)
    return A0_284:getListProperty(L6_290, A0_284.work.index, A2_286, A3_287)
  end
end
function QuestDeliveryWidget.getAskResult(A0_291)
  local L1_292, L2_293, L3_294, L4_295, L5_296, L6_297
  L2_293 = A0_291
  L1_292 = A0_291.getBaseAskResult
  L1_292 = L1_292(L2_293)
  if L1_292 == -1 then
    L1_292 = 0
    L2_293 = 0
    L3_294 = 0
    L4_295 = 0
    L5_296 = 0
    L6_297 = 0
    return L1_292, L2_293, L3_294, L4_295, L5_296, L6_297, 0
  else
    L1_292 = A0_291.work
    L1_292.askstatus = false
    L1_292 = 0
    L2_293 = A0_291.work
    L2_293 = L2_293.waitForPrice
    if L2_293 == true then
      L1_292 = -1
    else
    end
    L2_293 = worldMaster
    L3_294 = L2_293
    L2_293 = L2_293._getMyPlayer
    L2_293 = L2_293(L3_294)
    L4_295 = L2_293
    L3_294 = L2_293._getItem
    L5_296 = A0_291.work
    L5_296 = L5_296.chosenPackage
    L6_297 = A0_291.work
    L6_297 = L6_297.chosenItem
    L3_294 = L3_294(L4_295, L5_296, L6_297)
    if L3_294 ~= nil then
      L5_296 = L3_294
      L4_295 = L3_294._getCatalogID
      L4_295 = L4_295(L5_296)
      L6_297 = L3_294
      L5_296 = L3_294._getNameIndex
      L5_296 = L5_296(L6_297)
      L6_297 = 0
      if L3_294:isEquipment() and L3_294:getMateriaBindPermission() then
        L6_297 = desktopWidget:getAttachedMateriaCountByItem(L3_294)
      end
      return A0_291.work.chosenPackage, A0_291.work.chosenItem, A0_291.work.buycount, L5_296, L4_295, L6_297, L1_292
    else
      L4_295 = 0
      L5_296 = 0
      L6_297 = 0
      return L4_295, L5_296, L6_297, 0, 0, 0, 0
    end
  end
end
function QuestDeliveryWidget.setAskParameter(A0_298, A1_299, A2_300, A3_301, A4_302, A5_303, A6_304)
  if A6_304 ~= nil and A0_298.work.shopid ~= 0 then
    A0_298:setText("TextBlock_CompanyPoint", 8043, A6_304, 100)
  end
  A0_298:updateWindowDisplay(true)
  A0_298.work.askstatus = true
  if A0_298.work.editWidgetOpen == 0 then
    A0_298:selectedBorder()
  end
  A0_298.work.waitNext = false
end
function QuestDeliveryWidget.setPrice(A0_305, A1_306, A2_307, A3_308)
  local L4_309, L5_310, L6_311, L7_312, L8_313, L9_314, L10_315, L11_316, L12_317, L13_318, L14_319, L15_320, L16_321
  L4_309 = A0_305.work
  L4_309 = L4_309.chosenItem
  if L4_309 == A2_307 then
    L4_309 = A0_305.work
    L4_309 = L4_309.chosenPackage
    if L4_309 == A1_306 then
      L4_309 = A0_305.work
      L4_309.price = A3_308
      L4_309 = A0_305.work
      L4_309.waitForPrice = false
      L4_309 = nil
      if A1_306 == 1 then
        L4_309 = 1
      elseif A1_306 == 100 then
        L4_309 = 2
      else
        return
      end
      L6_311 = A0_305
      L5_310 = A0_305.getListPropertyName
      L7_312 = L4_309
      L5_310 = L5_310(L6_311, L7_312)
      L6_311 = worldMaster
      L7_312 = L6_311
      L6_311 = L6_311._getMyPlayer
      L6_311 = L6_311(L7_312)
      L8_313 = L6_311
      L7_312 = L6_311._getItem
      L9_314 = A1_306
      L10_315 = A2_307
      L7_312 = L7_312(L8_313, L9_314, L10_315)
      L9_314 = L7_312
      L8_313 = L7_312._getCatalogID
      L8_313 = L8_313(L9_314)
      L10_315 = L7_312
      L9_314 = L7_312._getNameIndex
      L9_314 = L9_314(L10_315)
      L10_315 = tostring
      L11_316 = L8_313
      L10_315 = L10_315(L11_316)
      L11_316 = ":"
      L12_317 = tostring
      L13_318 = L9_314
      L12_317 = L12_317(L13_318)
      L10_315 = L10_315 .. L11_316 .. L12_317
      L11_316 = 0
      L12_317 = 0
      L13_318 = 0
      L14_319 = 14
      L15_320 = A0_305.work
      L15_320 = L15_320.shopid
      if L15_320 == 0 then
        L16_321 = L6_311
        L15_320 = L6_311._getBelongGrandCompany
        L15_320 = L15_320(L16_321)
        L16_321 = L15_320
        if L16_321 == 1 then
          L12_317 = 1000201
          L11_316 = 530
          break
        else
        end
        if L16_321 == 2 then
          L12_317 = 1000202
          L11_316 = 531
          break
        else
        end
        if L16_321 == 3 then
          L12_317 = 1000203
          L11_316 = 532
          do break end
          break
        else
        end
        L16_321 = A0_305.getGrandCompanyPoint
        L16_321 = L16_321(A0_305, L15_320)
        L13_318 = L16_321
      else
        L14_319 = 20
        L15_320 = A0_305.work
        L15_320 = L15_320.orderCatalog
        if L15_320 ~= 0 then
          L16_321 = A0_305
          L15_320 = A0_305.getHamletItemData
          L16_321 = L15_320(L16_321, L8_313, L9_314)
          A0_305.work.bundle = L15_320(L16_321, L8_313, L9_314)
          A3_308 = L16_321
        end
      end
      L15_320 = desktopWidget
      L16_321 = L15_320
      L15_320 = L15_320.openChildWidget
      L15_320 = L15_320(L16_321, "ShopEditWidget", A0_305, true, L14_319, A3_308, L13_318, L11_316, L12_317, A0_305, L8_313, nil, A0_305.work.bundle)
      if L15_320 == true then
        L16_321 = A0_305
        L15_320 = A0_305.selectedBorder
        L15_320(L16_321, A0_305.work.chosenItem - 1, true)
        L15_320 = A0_305.work
        L15_320.editWidgetOpen = 11
        L16_321 = A0_305
        L15_320 = A0_305.setInputEnable
        L15_320(L16_321, false)
        L15_320 = A0_305.work
        L16_321 = worldMaster
        L16_321 = L16_321._getServerTime
        L16_321 = L16_321(L16_321)
        L15_320.lastcommandtime = L16_321
        L16_321 = L7_312
        L15_320 = L7_312.isEquipment
        L15_320 = L15_320(L16_321)
        if L15_320 then
          L15_320 = desktopWidget
          L16_321 = L15_320
          L15_320 = L15_320.getAttachedMateriaCountByItem
          L15_320 = L15_320(L16_321, L7_312)
          if L15_320 > 0 then
            L16_321 = A0_305
            L15_320 = A0_305.showMateriaList
            L15_320(L16_321)
          end
        end
        L15_320 = true
        return L15_320
      else
        L15_320 = A0_305.work
        L15_320.editWidgetOpen = 0
        L15_320 = A0_305.work
        L16_321 = worldMaster
        L16_321 = L16_321._getServerTime
        L16_321 = L16_321(L16_321)
        L15_320.lastcommandtime = L16_321
      end
    end
  end
end
function QuestDeliveryWidget.updatePrice(A0_322, A1_323, A2_324, A3_325)
  local L4_326, L5_327, L6_328, L7_329, L8_330, L9_331, L10_332
  L5_327 = A0_322
  L4_326 = A0_322.getListPropertyName
  L6_328 = A0_322.work
  L6_328 = L6_328.listbox
  L4_326 = L4_326(L5_327, L6_328)
  L6_328 = A0_322
  L5_327 = A0_322.getPackageFromList
  L5_327 = L5_327(L6_328, L7_329)
  L6_328 = A0_322.getListBoxItemNum
  L6_328 = L6_328(L7_329, L8_330)
  for L10_332 = 1, L6_328 do
    if A0_322:checkCatalogQuality(L5_327, L10_332, A1_323, A2_324) == true then
      A0_322:setListText(L4_326, L10_332 - 1, "price", 3201, A3_325)
    end
  end
  L7_329(L8_330, L9_331)
end
function QuestDeliveryWidget.checkCatalogQuality(A0_333, A1_334, A2_335, A3_336, A4_337)
  if A3_336 == worldMaster:_getMyPlayer():_getItem(A1_334, A2_335):_getCatalogID() and A4_337 == worldMaster:_getMyPlayer():_getItem(A1_334, A2_335):_getNameIndex() then
    return true
  else
    return false
  end
end
function QuestDeliveryWidget.syncItemWork(A0_338, A1_339)
  A0_338.work.demandSync = false
end
function QuestDeliveryWidget.getAskWaitStatus(A0_340)
  return A0_340.work.askstatus
end
function QuestDeliveryWidget.showMateriaList(A0_341)
  local L1_342
  L1_342 = worldMaster
  L1_342 = L1_342._getMyPlayer
  L1_342 = L1_342(L1_342)
  L1_342 = L1_342._getItem
  L1_342 = L1_342(L1_342, A0_341.work.chosenPackage, A0_341.work.chosenItem)
  desktopWidget:setMateriaListItems(A0_341, L1_342)
  A0_341:setVisibility("Grid_MateriaEquipList", true)
  A0_341:setVisibility("Grid_TabList", false)
  A0_341:setVisibility("Button_ListClose", false)
  A0_341.work.isMateriaList = true
end
function QuestDeliveryWidget.closeMateriaList(A0_343)
  A0_343:setVisibility("Grid_MateriaEquipList", false)
  A0_343:setVisibility("Grid_TabList", true)
  A0_343.work.isMateriaList = false
end
function QuestDeliveryWidget.displaySortType(A0_344, A1_345)
  desktopWidget:displaySortType(A1_345, A0_344, "Button_SortStatus")
end
function QuestDeliveryWidget.changeSortType(A0_346)
  A0_346.work.sorttype = desktopWidget:changeSortType(A0_346.work.sorttype)
end
function QuestDeliveryWidget.saveSortType(A0_347)
  desktopWidget:saveSortType(A0_347.work.sorttype)
end
