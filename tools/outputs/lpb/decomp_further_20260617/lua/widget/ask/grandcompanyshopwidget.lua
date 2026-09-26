require("/Widget/Ask/AskBaseClass")
_defineClass("GrandCompanyShopWidget", "AskBaseClass")
function GrandCompanyShopWidget.initAsk(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.work
  L2_2._temp = {
    {"askStatus", "boolean"},
    {
      "isUpdateMoney",
      "boolean"
    },
    {
      "editWidgetOpen",
      "integer8"
    },
    {"townID", "integer8"},
    {
      "chosenOperation",
      "integer32"
    },
    {"buyCount", "integer32"},
    {"pointID", "integer32"},
    {
      "currentItemCatalogID",
      "integer32"
    },
    {
      "updateItemCount",
      "integer32"
    },
    {"selected", "integer32"},
    {
      "selectedItemSheetIndex",
      "integer32"
    },
    {"myRank", "integer32"},
    {"myPoint", "integer32"},
    {"index", "integer32"},
    {"focusevent", "boolean"},
    {"closetime", "integer32"},
    {
      "blackmarket",
      "boolean"
    }
  }
  L2_2 = A0_0.work
  L2_2.askStatus = true
  L2_2 = A0_0.work
  L2_2.isUpdateMoney = false
  L2_2 = A0_0.work
  L2_2.editWidgetOpen = 0
  L2_2 = A0_0.work
  L2_2.chosenOperation = 0
  L2_2 = A0_0.work
  L2_2.buyCount = 0
  L2_2 = A0_0.work
  L2_2.pointID = 0
  L2_2 = A0_0.work
  L2_2.currentItemCatalogID = 0
  L2_2 = A0_0.work
  L2_2.updateItemCount = 0
  L2_2 = A0_0.work
  L2_2.selected = -1
  L2_2 = A0_0.work
  L2_2.selectedItemSheetIndex = -1
  L2_2 = A0_0.work
  L2_2.myRank = -1
  L2_2 = A0_0.work
  L2_2.myPoint = 0
  L2_2 = A0_0.work
  L2_2.index = 0
  L2_2 = A0_0.work
  L2_2.townID = A1_1:getGrandCompanyNumber()
  L2_2 = A0_0.work
  L2_2 = L2_2.townID
  if L2_2 == 1 then
    A0_0.work.pointID = 1000201
    break
  else
  end
  if L2_2 == 2 then
    A0_0.work.pointID = 1000202
    break
  else
  end
  if L2_2 == 3 then
    A0_0.work.pointID = 1000203
    do break end
    break
  else
  end
  L2_2 = A0_0.setCancelCondition
  L2_2(A0_0)
  L2_2 = A0_0.setCloseCondition
  L2_2(A0_0)
  L2_2 = A0_0.setControlCommandCondition
  L2_2(A0_0, "TabControl_ItemList", "UILuaCommands.TabChanged")
  L2_2 = A0_0.setTabCommandCondition
  L2_2(A0_0, 1)
  L2_2 = A0_0.setTabCommandCondition
  L2_2(A0_0, 2)
  L2_2 = A0_0.setTabCommandCondition
  L2_2(A0_0, 3)
  L2_2 = A0_0.setTabCommandCondition
  L2_2(A0_0, 4)
  L2_2 = A0_0.setTabCommandCondition
  L2_2(A0_0, 5)
  L2_2 = A0_0.setText
  L2_2(A0_0, "TextBlock_ItemLifeHeader", 214, 10091)
  L2_2 = A0_0.setText
  L2_2(A0_0, "TextBlock_RepairMaterialHeader", 214, 10093)
  L2_2 = A0_0.setText
  L2_2(A0_0, "TextBlock_Help", 3140)
  L2_2 = A0_0.setVisibility
  L2_2(A0_0, "Grid_Help", true)
  L2_2 = desktopWidget
  L2_2 = L2_2.setMateriaAttachSlotIconHelp
  L2_2(L2_2, A0_0)
  L2_2 = A0_0.displayBagCapacity
  L2_2(A0_0)
  L2_2 = 0
  if A0_0.work.townID == 1 then
    L2_2 = 530
    break
  else
  end
  if A0_0.work.townID == 2 then
    L2_2 = 531
    break
  else
  end
  if A0_0.work.townID == 3 then
    L2_2 = 532
    do break end
    break
  else
  end
  A0_0:setIcon("IconControl_CompanyPoint", L2_2)
  A0_0:displayGrandCompanyName(A0_0.work.townID)
  A0_0:displayGrandCompanyRank(A0_0.work.townID)
  A0_0:displayGrandCompanyPoint(A0_0.work.pointID)
  A0_0:initShopItemList(A1_1)
  if desktopWidget:isBlackMarketeer(A1_1) then
    A0_0.work.blackmarket = true
    A0_0:setHeader("TabItem_2", 8012)
    A0_0:setProperty("Title", desktopWidget:getActorName(A1_1))
    A0_0:setHelpParameter("Label_GrandCompanyBanner", 1, 76004)
  else
    A0_0.work.blackmarket = false
  end
end
function GrandCompanyShopWidget.setTabCommandCondition(A0_3, A1_4)
  local L2_5
  L2_5 = A0_3.getListBoxName
  L2_5 = L2_5(A0_3, A1_4)
  A0_3:setControlCommandCondition(L2_5, "UILuaCommands.Selection")
  A0_3:setControlCommandCondition(L2_5, "UILuaCommands.MouseEnteredItem")
  A0_3:setControlCommandCondition(L2_5, "UILuaCommands.AnchoredItem")
  A0_3:setControlCommandCondition(L2_5, "UILuaCommands.Previous")
  A0_3:setControlCommandCondition(L2_5, "UILuaCommands.Next")
end
function GrandCompanyShopWidget.displayBagCapacity(A0_6)
  local L1_7, L2_8
  L1_7 = worldMaster
  L2_8 = L1_7
  L1_7 = L1_7._getMyPlayer
  L1_7 = L1_7(L2_8)
  L2_8 = L1_7._getItemPackageCapacity
  L2_8 = L2_8(L1_7, 1)
  A0_6:setText("TextBlock_ItemStack_2", 3551, L2_8 - L1_7:_getItemPackageFreeSpace(1), L2_8)
end
function GrandCompanyShopWidget.displayGrandCompanyName(A0_9, A1_10)
  local L2_11, L3_12, L4_13
  L3_12 = A0_9
  L2_11 = A0_9.getGrandCompanyBanner
  L4_13 = A1_10
  L2_11 = L2_11(L3_12, L4_13)
  L4_13 = A0_9
  L3_12 = A0_9.getTownName
  L3_12 = L3_12(L4_13, A1_10)
  L4_13 = A0_9.getGrandCompanyName
  L4_13 = L4_13(A0_9, A1_10)
  A0_9:setControlProperty("Label_GrandCompanyBanner", "SqwtStyle", L2_11)
  A0_9:setText("TextBlock_CompanyCity", L3_12)
  A0_9:setText("TextBlock_CompanyName", L4_13)
end
function GrandCompanyShopWidget.displayGrandCompanyRank(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22
  L2_16 = worldMaster
  L3_17 = L2_16
  L2_16 = L2_16._getMyPlayer
  L2_16 = L2_16(L3_17)
  L4_18 = L2_16
  L3_17 = L2_16.getGrandCompanyRank
  L5_19 = A1_15
  L4_18 = L3_17(L4_18, L5_19)
  L5_19 = 1
  L6_20 = worldMaster
  L7_21 = L6_20
  L6_20 = L6_20._getMyPlayer
  L6_20 = L6_20(L7_21)
  L8_22 = L6_20
  L7_21 = L6_20.isMale
  L7_21 = L7_21(L8_22)
  if L7_21 == true then
    L5_19 = 1
  else
    L8_22 = L6_20
    L7_21 = L6_20.isFemale
    L7_21 = L7_21(L8_22)
    if L7_21 == true then
      L5_19 = 2
    end
  end
  L7_21 = A0_14.work
  L7_21.myRank = L3_17
  L7_21 = false
  if L3_17 > 0 then
    L7_21 = true
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacity", 1)
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacityRed", 1)
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacityGreen", 1)
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacityBlue", 1)
    L8_22 = A0_14.setVisibility
    L8_22(A0_14, "IconControl_CompanyStatus", true)
  elseif L4_18 == true then
    L3_17 = 127
    L7_21 = true
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacity", 0.8)
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacityRed", 0.4)
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacityGreen", 0.4)
    L8_22 = A0_14.setControlProperty
    L8_22(A0_14, "IconControl_CompanyStatus", "VisualOpacityBlue", 0.4)
    L8_22 = A0_14.setHidden
    L8_22(A0_14, "IconControl_CompanyStatus")
  else
    L7_21 = false
    L8_22 = A0_14.setHidden
    L8_22(A0_14, "IconControl_CompanyStatus")
    L8_22 = A0_14.setVisibility
    L8_22(A0_14, "TextBlock_CompanyRankName", false)
  end
  if L7_21 == true then
    L8_22 = A0_14.getGrandCompanyStatusIcon
    L8_22 = L8_22(A0_14, A1_15, L3_17)
    A0_14:setIcon("IconControl_CompanyStatus", L8_22)
    A0_14:setText("TextBlock_CompanyRankName", 8079 + A1_15, L3_17, L5_19)
  end
end
function GrandCompanyShopWidget.displayGrandCompanyPoint(A0_23, A1_24)
  A0_23.work.myPoint = A0_23:getPointCount(A1_24)
  A0_23:setText("TextBlock_CompanyPoint", 3042, A0_23.work.myPoint)
end
function GrandCompanyShopWidget.getGrandCompanyStatusIcon(A0_25, A1_26, A2_27)
  gcRankSheet:_loadKeyTemporarily(A2_27, A2_27)
  return (gcRankSheet:_getData(A2_27, A1_26 + 6 - 1))
end
function GrandCompanyShopWidget.initShopItemList(A0_28, A1_29)
  A0_28:setVisibility("TabItem_1", false)
  A0_28:setVisibility("TabItem_2", false)
  A0_28:setVisibility("TabItem_3", false)
  A0_28:setVisibility("TabItem_4", false)
  A0_28:setVisibility("TabItem_5", false)
  A0_28:createShopItemList(A1_29, 1)
  A0_28:createShopItemList(A1_29, 2)
  A0_28:createShopItemList(A1_29, 3)
  A0_28:createShopItemList(A1_29, 4)
  if A0_28:getListPropertyCount(A0_28:getListDataMakerName(1)) > 0 then
    A0_28:setVisibility("TabItem_1", true)
  end
  if A0_28:getListPropertyCount(A0_28:getListDataMakerName(2)) > 0 then
    A0_28:setVisibility("TabItem_2", true)
  end
  if A0_28:getListPropertyCount(A0_28:getListDataMakerName(3)) > 0 then
    A0_28:setVisibility("TabItem_3", true)
  end
  if A0_28:getListPropertyCount(A0_28:getListDataMakerName(4)) > 0 then
    A0_28:setVisibility("TabItem_4", true)
  end
  if 0 < A0_28:getListPropertyCount(A0_28:getListDataMakerName(5)) then
    A0_28:setVisibility("TabItem_5", true)
  end
  if A0_28:getListPropertyCount(A0_28:getListDataMakerName(1)) > 0 then
    A0_28:setWindowFocus(A0_28:getListBoxName(1))
    A0_28:displayFocusedItemHelp(0)
  elseif A0_28:getListPropertyCount(A0_28:getListDataMakerName(2)) > 0 then
    A0_28:setSelectedIndex("TabControl_ItemList", 1)
    A0_28:setWindowFocus(A0_28:getListBoxName(2))
    A0_28:displayFocusedItemHelp(0)
  elseif A0_28:getListPropertyCount(A0_28:getListDataMakerName(3)) > 0 then
    A0_28:setSelectedIndex("TabControl_ItemList", 2)
    A0_28:setWindowFocus(A0_28:getListBoxName(3))
    A0_28:displayFocusedItemHelp(0)
  else
    A0_28:setSelectedIndex("TabControl_ItemList", 1)
    A0_28:setWindowFocus(A0_28:getNoContentsTextName(2))
    A0_28:setVisibility("Grid_ItemNameBase", false)
    A0_28:setItemHelpVisibility(false, false, false, false)
  end
end
function GrandCompanyShopWidget.createShopItemList(A0_30, A1_31, A2_32)
  local L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42, L13_43, L14_44, L15_45, L16_46, L17_47, L18_48, L19_49, L20_50, L21_51, L22_52, L23_53, L24_54, L25_55
  L4_34 = A1_31
  L3_33 = A1_31.getShopItemStartIndex
  L5_35 = A2_32
  L3_33 = L3_33(L4_34, L5_35)
  L4_34 = A2_32
  if A2_32 == 1 then
    L4_34 = 2
  elseif A2_32 == 2 then
    L4_34 = 3
  elseif A2_32 == 3 then
    L4_34 = 1
  end
  L6_36 = A1_31
  L5_35 = A1_31.getShopSellingItemMax
  L7_37 = A2_32
  L8_38 = L3_33
  L5_35 = L5_35(L6_36, L7_37, L8_38)
  L7_37 = A0_30
  L6_36 = A0_30.getListDataMakerName
  L8_38 = L4_34
  L6_36 = L6_36(L7_37, L8_38)
  L7_37 = worldMaster
  L8_38 = L7_37
  L7_37 = L7_37._getMyPlayer
  L7_37 = L7_37(L8_38)
  L8_38 = 0
  for L12_42 = 1, L5_35 do
    L14_44 = A1_31
    L13_43 = A1_31.getShopSellingItemDetail
    L15_45 = L7_37
    L16_46 = A2_32
    L17_47 = L12_42
    L19_49 = L13_43(L14_44, L15_45, L16_46, L17_47)
    if L18_48 == true then
      L21_51 = A0_30
      L20_50 = A0_30.addShopItemList
      L22_52 = L6_36
      L23_53 = L8_38
      L24_54 = L12_42
      L25_55 = L13_43
      L20_50 = L20_50(L21_51, L22_52, L23_53, L24_54, L25_55, L14_44, L15_45, L16_46, L17_47, L19_49)
      if L20_50 == true then
        L8_38 = L8_38 + 1
      end
    end
  end
  if L8_38 < L9_39 then
    for L13_43 = L8_38, L9_39 - 1 do
      L15_45 = A0_30
      L14_44 = A0_30.deleteListProperty
      L16_46 = L6_36
      L17_47 = L13_43
      L14_44(L15_45, L16_46, L17_47)
    end
  end
  L10_40(L11_41, L12_42)
  L13_43 = L4_34
  if L8_38 > 0 then
    L13_43 = A0_30
    L14_44 = L10_40
    L15_45 = false
    L12_42(L13_43, L14_44, L15_45)
    L13_43 = A0_30
    L14_44 = L11_41
    L15_45 = true
    L12_42(L13_43, L14_44, L15_45)
    L13_43 = A0_30
    L14_44 = L11_41
    L15_45 = "SourceFirstIndex"
    L16_46 = 0
    L12_42(L13_43, L14_44, L15_45, L16_46)
    L13_43 = A0_30
    L14_44 = L11_41
    L15_45 = "SourceCount"
    L16_46 = L8_38
    L12_42(L13_43, L14_44, L15_45, L16_46)
  else
    L13_43 = A0_30
    L14_44 = L10_40
    L15_45 = true
    L12_42(L13_43, L14_44, L15_45)
    L13_43 = A0_30
    L14_44 = L11_41
    L15_45 = false
    L12_42(L13_43, L14_44, L15_45)
  end
end
function GrandCompanyShopWidget.addShopItemList(A0_56, A1_57, A2_58, A3_59, A4_60, A5_61, A6_62, A7_63, A8_64, A9_65)
  local L10_66, L11_67, L12_68
  L10_66 = worldMaster
  L11_67 = L10_66
  L10_66 = L10_66._getMyPlayer
  L10_66 = L10_66(L11_67)
  L11_67 = L10_66
  L10_66 = L10_66.createVirtualItem
  L12_68 = A4_60
  L10_66 = L10_66(L11_67, L12_68)
  if L10_66 == nil then
    L11_67 = false
    return L11_67
  end
  L12_68 = A0_56
  L11_67 = A0_56.setListPropertyVisibility
  L11_67(L12_68, A1_57, A2_58, true)
  L11_67 = desktopWidget
  L12_68 = L11_67
  L11_67 = L11_67.setItemToXml
  L11_67(L12_68, A0_56, A1_57, A2_58, L10_66, "TBL_null", A4_60, L10_66:getItemIcon(), L10_66:_isStackable(), A6_62, A5_61, nil, true, false, 6, A3_59, A4_60, 3, false)
  L11_67 = desktopWidget
  L12_68 = L11_67
  L11_67 = L11_67.setItemDetailToXml
  L11_67(L12_68, A0_56, A1_57, A2_58, L10_66, A5_61, 3, 6)
  L12_68 = A0_56
  L11_67 = A0_56.setListProperty
  L11_67(L12_68, A1_57, A2_58, "itemIndex", A3_59)
  L12_68 = A0_56
  L11_67 = A0_56.setListProperty
  L11_67(L12_68, A1_57, A2_58, "essentialRank", A8_64)
  L12_68 = A0_56
  L11_67 = A0_56.setListProperty
  L11_67(L12_68, A1_57, A2_58, "sheetIndex", A9_65)
  L11_67 = nil
  if A8_64 == 0 then
    L11_67 = "Hidden"
  else
    L12_68 = A0_56.getGrandCompanyStatusIcon
    L12_68 = L12_68(A0_56, A0_56.work.townID, A8_64)
    A0_56:setListProperty(A1_57, A2_58, "rankIcon", L12_68)
    L11_67 = "Visible"
  end
  L12_68 = A0_56.setListProperty
  L12_68(A0_56, A1_57, A2_58, "rankIconVisibility", L11_67)
  L12_68 = A0_56.setListProperty
  L12_68(A0_56, A1_57, A2_58, "pricedata", A7_63)
  L12_68 = A0_56.setListText
  L12_68(A0_56, A1_57, A2_58, "price", 225, A7_63)
  L12_68 = A0_56.setListProperty
  L12_68(A0_56, A1_57, A2_58, "priceVisibility", "Visible")
  L12_68 = A0_56.setMaskInformation
  L12_68(A0_56, A1_57, A2_58, A8_64, A7_63)
  L12_68 = A0_56.setListProperty
  L12_68(A0_56, A1_57, A2_58, "nameStyle", "TBL_selectedItem")
  L12_68 = A0_56.setListProperty
  L12_68(A0_56, A1_57, A2_58, "selected", "Collapsed")
  L12_68 = true
  return L12_68
end
function GrandCompanyShopWidget.setMaskInformation(A0_69, A1_70, A2_71, A3_72, A4_73)
  if A3_72 == nil then
    A3_72 = A0_69:getListProperty(A1_70, A2_71, "essentialRank")
  end
  if A4_73 == nil then
    A4_73 = A0_69:getListProperty(A1_70, A2_71, "pricedata")
  end
  if A0_69:isMaskItem(A3_72, A4_73) == true then
    A0_69:setListProperty(A1_70, A2_71, "mask", 1)
    A0_69:setListProperty(A1_70, A2_71, "priceStyle", "TBL_null")
    A0_69:setListProperty(A1_70, A2_71, "opacity", "0.5")
  else
    A0_69:setListProperty(A1_70, A2_71, "mask", 0)
    A0_69:setListProperty(A1_70, A2_71, "opacity", "1.0")
    A0_69:setListProperty(A1_70, A2_71, "priceStyle", "TBL_null")
  end
end
function GrandCompanyShopWidget.updateShopItemList(A0_74)
  local L1_75, L2_76, L3_77, L4_78, L5_79, L6_80, L7_81, L8_82, L9_83, L10_84, L11_85
  for L4_78 = 1, 2 do
    L5_79 = L4_78
    if L4_78 == 1 then
      L5_79 = 2
    elseif L4_78 == 2 then
      L5_79 = 3
    elseif L4_78 == 3 then
      L5_79 = 1
    else
      L5_79 = L4_78
    end
    L7_81 = A0_74
    L6_80 = A0_74.getListDataMakerName
    L6_80 = L6_80(L7_81, L8_82)
    L7_81 = A0_74.getListFilteredCount
    L7_81 = L7_81(L8_82, L9_83)
    for L11_85 = 0, L7_81 - 1 do
      A0_74:setMaskInformation(L6_80, L11_85)
    end
    L8_82(L9_83, L10_84)
  end
end
function GrandCompanyShopWidget.displayFocusedItemHelp(A0_86, A1_87)
  local L2_88, L3_89, L4_90, L5_91, L6_92, L7_93, L8_94, L9_95, L10_96, L11_97, L12_98, L13_99, L14_100, L15_101, L16_102, L17_103
  if A1_87 == nil then
    L2_88 = false
    return L2_88
  end
  if A1_87 < 0 then
    L2_88 = false
    return L2_88
  end
  L2_88 = A0_86.work
  L2_88 = L2_88.editWidgetOpen
  if L2_88 ~= 0 then
    L2_88 = false
    return L2_88
  end
  L3_89 = A0_86
  L2_88 = A0_86.getListDataMakerName
  L2_88 = L2_88(L3_89)
  L3_89 = worldMaster
  L4_90 = L3_89
  L3_89 = L3_89._getMyPlayer
  L3_89 = L3_89(L4_90)
  L5_91 = A0_86
  L4_90 = A0_86.setVisibility
  L6_92 = "Grid_Help"
  L7_93 = false
  L4_90(L5_91, L6_92, L7_93)
  L5_91 = A0_86
  L4_90 = A0_86.setVisibility
  L6_92 = "Grid_ItemNameBase"
  L7_93 = true
  L4_90(L5_91, L6_92, L7_93)
  L4_90 = desktopWidget
  L5_91 = L4_90
  L4_90 = L4_90.setItemDetail
  L6_92 = A0_86
  L7_93 = nil
  L8_94 = L2_88
  L9_95 = A1_87
  L10_96 = true
  L11_97 = false
  L4_90(L5_91, L6_92, L7_93, L8_94, L9_95, L10_96, L11_97)
  L5_91 = A0_86
  L4_90 = A0_86.getListProperty
  L6_92 = L2_88
  L7_93 = A1_87
  L8_94 = "catalog"
  L4_90 = L4_90(L5_91, L6_92, L7_93, L8_94)
  L5_91 = nil
  L6_92 = 0
  L7_93 = 0
  L8_94 = 0
  L9_95 = 0
  L11_97 = A0_86
  L10_96 = A0_86.getListProperty
  L12_98 = L2_88
  L13_99 = A1_87
  L14_100 = "firstSlot"
  L10_96 = L10_96(L11_97, L12_98, L13_99, L14_100)
  L6_92 = L10_96
  L11_97 = A0_86
  L10_96 = A0_86.getListProperty
  L12_98 = L2_88
  L13_99 = A1_87
  L14_100 = "secondSlot"
  L10_96 = L10_96(L11_97, L12_98, L13_99, L14_100)
  L7_93 = L10_96
  L11_97 = A0_86
  L10_96 = A0_86.getListProperty
  L12_98 = L2_88
  L13_99 = A1_87
  L14_100 = "thirdSlot"
  L10_96 = L10_96(L11_97, L12_98, L13_99, L14_100)
  L8_94 = L10_96
  L11_97 = A0_86
  L10_96 = A0_86.getListProperty
  L12_98 = L2_88
  L13_99 = A1_87
  L14_100 = "fourthSlot"
  L10_96 = L10_96(L11_97, L12_98, L13_99, L14_100)
  L9_95 = L10_96
  if L6_92 ~= 0 then
    L11_97 = L3_89
    L10_96 = L3_89._getEquippingItem
    L12_98 = L6_92
    L10_96 = L10_96(L11_97, L12_98)
    L5_91 = L10_96
  end
  if L5_91 == nil and L7_93 ~= 0 then
    L11_97 = L3_89
    L10_96 = L3_89._getEquippingItem
    L12_98 = L7_93
    L10_96 = L10_96(L11_97, L12_98)
    L5_91 = L10_96
  end
  if L5_91 == nil and L8_94 ~= 0 then
    L11_97 = L3_89
    L10_96 = L3_89._getEquippingItem
    L12_98 = L8_94
    L10_96 = L10_96(L11_97, L12_98)
    L5_91 = L10_96
  end
  if L5_91 == nil and L9_95 ~= 0 then
    L11_97 = L3_89
    L10_96 = L3_89._getEquippingItem
    L12_98 = L9_95
    L10_96 = L10_96(L11_97, L12_98)
    L5_91 = L10_96
  end
  L10_96 = desktopWidget
  L11_97 = L10_96
  L10_96 = L10_96.setItemDetailEquip
  L12_98 = A0_86
  L13_99 = nil
  L14_100 = L2_88
  L15_101 = A1_87
  L16_102 = L5_91
  L17_103 = true
  L13_99 = L10_96(L11_97, L12_98, L13_99, L14_100, L15_101, L16_102, L17_103, false, false, true)
  L15_101 = A0_86
  L14_100 = A0_86.setItemHelpVisibility
  L16_102 = L10_96
  L17_103 = L11_97
  L14_100(L15_101, L16_102, L17_103, L12_98, L13_99)
  L14_100 = A0_86.work
  L14_100.currentItemCatalogID = L4_90
  L14_100 = true
  return L14_100
end
function GrandCompanyShopWidget.setItemHelpVisibility(A0_104, A1_105, A2_106, A3_107, A4_108)
  A0_104:setVisibility("Grid_ItemDetail1", A1_105)
  A0_104:setVisibility("Grid_ItemDetail2", A2_106)
  A0_104:setVisibility("Grid_ItemDetail3", A3_107 or A4_108)
  A0_104:setVisibility("Grid_ItemLife", A4_108)
  A0_104:setVisibility("Grid_ItemBazaarInformation", false)
end
function GrandCompanyShopWidget.getListDataMakerName(A0_109, A1_110)
  local L2_111
  if A1_110 == nil then
    A1_110 = A0_109:getSelectedTab()
  end
  if A1_110 == 1 then
    L2_111 = "TabItem_1_Maker"
    break
  else
  end
  if A1_110 == 2 then
    L2_111 = "TabItem_2_Maker"
    break
  else
  end
  if A1_110 == 3 then
    L2_111 = "TabItem_3_Maker"
    break
  else
  end
  if A1_110 == 4 then
    L2_111 = "TabItem_4_Maker"
    break
  else
  end
  if A1_110 == 5 then
    L2_111 = "TabItem_5_Maker"
    do break end
    break
  else
  end
  return L2_111
end
function GrandCompanyShopWidget.getListBoxName(A0_112, A1_113)
  local L2_114
  if A1_113 == nil then
    A1_113 = A0_112:getSelectedTab()
  end
  if A1_113 == 1 then
    L2_114 = "ListBox_TabItem_1"
    break
  else
  end
  if A1_113 == 2 then
    L2_114 = "ListBox_TabItem_2"
    break
  else
  end
  if A1_113 == 3 then
    L2_114 = "ListBox_TabItem_3"
    break
  else
  end
  if A1_113 == 4 then
    L2_114 = "ListBox_TabItem_4"
    break
  else
  end
  if A1_113 == 5 then
    L2_114 = "ListBox_TabItem_5"
    do break end
    break
  else
  end
  return L2_114
end
function GrandCompanyShopWidget.getNoContentsTextName(A0_115, A1_116)
  local L2_117
  if A1_116 == nil then
    A1_116 = A0_115:getSelectedTab()
  end
  if A1_116 == 1 then
    L2_117 = "TextBlock_NoContents_1"
    break
  else
  end
  if A1_116 == 2 then
    L2_117 = "TextBlock_NoContents_2"
    break
  else
  end
  if A1_116 == 3 then
    L2_117 = "TextBlock_NoContents_3"
    break
  else
  end
  if A1_116 == 4 then
    L2_117 = "TextBlock_NoContents_4"
    break
  else
  end
  if A1_116 == 5 then
    L2_117 = "TextBlock_NoContents_5"
    do break end
    break
  else
  end
  return L2_117
end
function GrandCompanyShopWidget.getSelectedTab(A0_118)
  return A0_118:getSelectedIndex("TabControl_ItemList") + 1
end
function GrandCompanyShopWidget.getGrandCompanyBanner(A0_119, A1_120)
  local L2_121, L3_122
  L3_122 = A1_120
  if L3_122 == 1 then
    L2_121 = "LAB_profile_stateBanner_LimsaLominsa"
    break
  else
  end
  if L3_122 == 2 then
    L2_121 = "LAB_profile_stateBanner_Gridania"
    break
  else
  end
  if L3_122 == 3 then
    L2_121 = "LAB_profile_stateBanner_Uldah"
    do break end
    break
  else
  end
  return L2_121
end
function GrandCompanyShopWidget.getTownName(A0_123, A1_124)
  local L2_125, L3_126
  L3_126 = A1_124
  if L3_126 == 1 then
    L2_125 = 100621
    break
  else
  end
  if L3_126 == 2 then
    L2_125 = 100622
    break
  else
  end
  if L3_126 == 3 then
    L2_125 = 100623
    do break end
    break
  else
  end
  return L2_125
end
function GrandCompanyShopWidget.getGrandCompanyName(A0_127, A1_128)
  local L2_129, L3_130
  L3_130 = A1_128
  if L3_130 == 1 then
    L2_129 = 8051
    break
  else
  end
  if L3_130 == 2 then
    L2_129 = 8052
    break
  else
  end
  if L3_130 == 3 then
    L2_129 = 8053
    do break end
    break
  else
  end
  return L2_129
end
function GrandCompanyShopWidget.getPointCount(A0_131, A1_132)
  local L2_133, L3_134, L4_135, L5_136, L6_137, L7_138, L8_139, L9_140
  L2_133 = 0
  L3_134 = worldMaster
  L4_135 = L3_134
  L3_134 = L3_134._getMyPlayer
  L3_134 = L3_134(L4_135)
  L5_136 = L3_134
  L4_135 = L3_134._getItemPackageCapacity
  L4_135 = L4_135(L5_136, L6_137)
  L5_136 = L3_134._getItemPackageFreeSpace
  L5_136 = L5_136(L6_137, L7_138)
  for L9_140 = 1, L4_135 - L5_136 do
    if desktopWidget:getPlayerItemInPackage(100, L9_140) == A1_132 then
      L2_133 = desktopWidget:getPlayerItemInPackage(100, L9_140)
      break
    end
  end
  return L2_133
end
function GrandCompanyShopWidget.processUICommandCancel(A0_141, A1_142, A2_143, A3_144, A4_145)
  if A0_141.work.editWidgetOpen ~= 0 then
    return false
  end
  if A0_141:isAskFinish() == true then
    return false
  end
  A0_141:previousSequence()
end
function GrandCompanyShopWidget.processUICommandClose(A0_146, A1_147, A2_148, A3_149, A4_150)
  A0_146:previousSequence()
end
function GrandCompanyShopWidget.processUICommandSelection(A0_151, A1_152, A2_153, A3_154, A4_155)
  local L5_156
  L5_156 = A0_151.work
  L5_156 = L5_156.editWidgetOpen
  if L5_156 ~= 0 then
    L5_156 = false
    return L5_156
  end
  L5_156 = A0_151.isAskFinish
  L5_156 = L5_156(A0_151)
  if L5_156 == true then
    L5_156 = false
    return L5_156
  end
  L5_156 = A3_154
  A0_151:displayFocusedItemHelp(L5_156)
  A0_151:selectedBorder(L5_156, true)
  if L5_156 > -1 then
    A0_151.work.index = L5_156
  end
  if A2_153 == "ListBox_TabItem_1" or A2_153 == "ListBox_TabItem_2" or A2_153 == "ListBox_TabItem_3" or A2_153 == "ListBox_TabItem_4" or A2_153 == "ListBox_TabItem_5" then
    A0_151.work.focusevent = false
    A0_151.work.editWidgetOpen = 1
    if A0_151:operateBuy(L5_156) == true then
    else
      A0_151.work.editWidgetOpen = 0
      A0_151:selectedBorder()
    end
  end
end
function GrandCompanyShopWidget.processUICommandDefault(A0_157, A1_158, A2_159, A3_160, A4_161, A5_162)
  local L6_163, L7_164
  L6_163 = A0_157.work
  L6_163 = L6_163.editWidgetOpen
  if L6_163 ~= 0 then
    L6_163 = false
    return L6_163
  end
  L7_164 = A0_157
  L6_163 = A0_157.isAskFinish
  L6_163 = L6_163(L7_164)
  if L6_163 == true then
    L6_163 = false
    return L6_163
  end
  if A3_160 == "UILuaCommands.MouseEnteredItem" or A3_160 == "UILuaCommands.AnchoredItem" then
    if A4_161 > -1 then
      L6_163 = A0_157.work
      L6_163.index = A4_161
    end
    L7_164 = A0_157
    L6_163 = A0_157.displayFocusedItemHelp
    L6_163(L7_164, A0_157.work.index)
    L6_163 = A0_157.work
    L6_163 = L6_163.index
    if L6_163 > -1 then
      L6_163 = A0_157.work
      L6_163.focusevent = true
    end
  elseif A3_160 == "UILuaCommands.TabChanged" then
    L7_164 = A0_157
    L6_163 = A0_157.getListBoxName
    L6_163 = L6_163(L7_164)
    L7_164 = A0_157.getVisibility
    L7_164 = L7_164(A0_157, L6_163)
    if L7_164 == true then
      L7_164 = A0_157.displayFocusedItemHelp
      L7_164(A0_157, A0_157:getFocusedIndex(L6_163))
      L7_164 = A0_157.setWindowFocus
      L7_164(A0_157, L6_163)
    else
      L7_164 = A0_157.work
      L7_164.currentItemCatalogID = 0
      L7_164 = A0_157.setVisibility
      L7_164(A0_157, "Grid_Help", true)
      L7_164 = A0_157.setVisibility
      L7_164(A0_157, "Grid_ItemNameBase", false)
      L7_164 = A0_157.setItemHelpVisibility
      L7_164(A0_157, false, false, false, false)
      L7_164 = A0_157.getNoContentsTextName
      L7_164 = L7_164(A0_157)
      A0_157:setWindowFocus(L7_164)
    end
  elseif A3_160 == "UILuaCommands.Previous" then
    L7_164 = A0_157
    L6_163 = A0_157.catalogSkip
    L6_163(L7_164, -1)
  elseif A3_160 == "UILuaCommands.Next" then
    L7_164 = A0_157
    L6_163 = A0_157.catalogSkip
    L6_163(L7_164, 1)
  end
end
function GrandCompanyShopWidget.processTimer(A0_165)
  A0_165:displayFocusedItemHelp(A0_165.work.index)
end
function GrandCompanyShopWidget.catalogSkip(A0_166, A1_167)
  local L2_168, L3_169, L4_170, L5_171
  L3_169 = A0_166
  L2_168 = A0_166.getListDataMakerName
  L5_171 = A0_166
  L4_170 = A0_166.getSelectedTab
  L5_171 = L4_170(L5_171)
  L2_168 = L2_168(L3_169, L4_170, L5_171, L4_170(L5_171))
  L4_170 = A0_166
  L3_169 = A0_166.getListBoxName
  L3_169 = L3_169(L4_170)
  L5_171 = A0_166
  L4_170 = A0_166.getControlProperty
  L4_170 = L4_170(L5_171, L2_168, "FilteredIndex")
  L5_171 = L4_170
  if A0_166:getControlProperty(L2_168, "FilteredCount") - 1 == -1 then
    return
  end
  L5_171 = L5_171 + 10 * A1_167
  if A0_166:getControlProperty(L2_168, "FilteredCount") - 1 < L5_171 then
    L5_171 = A0_166:getControlProperty(L2_168, "FilteredCount") - 1
  elseif L5_171 < 0 then
    L5_171 = 0
  end
  if L5_171 ~= L4_170 then
    A0_166:setControlProperty(L2_168, "FilteredIndex", L5_171)
    A0_166:setControlProperty(L3_169, "SqwtFocusedIndex", L5_171)
    A0_166:displayFocusedItemHelp(L5_171)
  end
end
function GrandCompanyShopWidget.setWindowFocus(A0_172, A1_173)
  A0_172:setLogicalFocus(A1_173)
  if desktopWidget:_getKeyboardFocusedWidget() == A0_172 then
    A0_172:setKeyboardFocusedControl(A1_173)
  end
end
function GrandCompanyShopWidget.selectedBorder(A0_174, A1_175, A2_176)
  local L3_177, L4_178
  L3_177 = A0_174.getListDataMakerName
  L3_177 = L3_177(L4_178)
  if A1_175 ~= nil then
    if A1_175 == L4_178 then
      if A2_176 ~= true then
        L4_178.selected = -1
        L4_178(A0_174, L3_177, A1_175, "selected", "Collapsed")
      end
    else
      if A2_176 == true then
        A0_174.work.selected = A1_175
      end
      A0_174:setListProperty(L3_177, A1_175, "selected", L4_178)
    end
  elseif L4_178 ~= -1 then
    for _FORV_7_ = 1, A0_174:getListFilteredCount(L3_177) do
      A0_174:setListProperty(L3_177, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_178.selected = -1
  end
  L4_178(A0_174, L3_177)
end
function GrandCompanyShopWidget.operateBuy(A0_179, A1_180)
  local L2_181, L3_182, L4_183, L5_184
  L3_182 = A0_179
  L2_181 = A0_179.getControlProperty
  L4_183 = "IconControl_CompanyPoint"
  L5_184 = "IconDatas"
  L2_181 = L2_181(L3_182, L4_183, L5_184)
  L4_183 = A0_179
  L3_182 = A0_179.getListDataMakerName
  L3_182 = L3_182(L4_183)
  L5_184 = A0_179
  L4_183 = A0_179.getListProperty
  L4_183 = L4_183(L5_184, L3_182, A1_180, "catalog")
  L5_184 = A0_179.getListProperty
  L5_184 = L5_184(A0_179, L3_182, A1_180, "mask")
  if L5_184 == 1 then
    L5_184 = worldMaster
    L5_184 = L5_184.notify
    L5_184(L5_184, worldMaster, 25259)
    L5_184 = false
    return L5_184
  end
  L5_184 = A0_179.getListProperty
  L5_184 = L5_184(A0_179, L3_182, A1_180, "essentialRank")
  if L5_184 > A0_179.work.myRank then
    L5_184 = worldMaster
    L5_184 = L5_184.notify
    L5_184(L5_184, worldMaster, 25259)
    L5_184 = false
    return L5_184
  end
  L5_184 = A0_179.getListProperty
  L5_184 = L5_184(A0_179, L3_182, A1_180, "pricedata")
  if desktopWidget:openChildWidget("ShopEditWidget", A0_179, true, 13, L5_184, A0_179:getPointCount(A0_179.work.pointID), L2_181, A0_179.work.pointID, A0_179, L4_183, A0_179.work.blackmarket) == true then
    A0_179.work.editWidgetOpen = 13
    A0_179.work.selectedItemSheetIndex = A0_179:getListProperty(L3_182, A1_180, "sheetIndex")
  end
  return (desktopWidget:openChildWidget("ShopEditWidget", A0_179, true, 13, L5_184, A0_179:getPointCount(A0_179.work.pointID), L2_181, A0_179.work.pointID, A0_179, L4_183, A0_179.work.blackmarket))
end
function GrandCompanyShopWidget.previousSequence(A0_185)
  A0_185:setBaseAskResult(-1)
end
function GrandCompanyShopWidget.isMaskItem(A0_186, A1_187, A2_188)
  local L3_189, L4_190
  L3_189 = false
  L4_190 = A0_186.work
  L4_190 = L4_190.myRank
  if A1_187 > L4_190 then
    L3_189 = true
  end
  return L3_189
end
function GrandCompanyShopWidget.updatePlayerItem(A0_191, A1_192, A2_193)
  if A1_192 == 0 then
    A0_191.work.updateItemCount = A2_193
    A0_191.work.isUpdateMoney = false
  else
    if A1_192 == 100 then
      A0_191.work.isUpdateMoney = true
    end
    if 0 < A0_191.work.updateItemCount then
      A0_191.work.updateItemCount = A0_191.work.updateItemCount - 1
    end
    if A0_191.work.updateItemCount == 0 then
      A0_191:displayBagCapacity()
      A0_191:displayGrandCompanyPoint(A0_191.work.pointID)
      A0_191:updateShopItemList()
      if A0_191.work.isUpdateMoney == true and A0_191:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
        A0_191:getChildWidgetByWindowName("ShopEditWidget"):updateMoney(A0_191:getPointCount(A0_191.work.pointID))
      end
    end
  end
end
function GrandCompanyShopWidget.getAskResult(A0_194)
  local L1_195
  L1_195 = -1
  if A0_194:getBaseAskResult() ~= -1 then
    L1_195 = A0_194.work.selectedItemSheetIndex
  end
  return L1_195
end
function GrandCompanyShopWidget.setAskParameter(A0_196)
  A0_196:setSelectedIndex(A0_196:getListBoxName(), -1)
  A0_196:selectedBorder()
  A0_196.work.editWidgetOpen = 0
  A0_196.work.askStatus = true
end
function GrandCompanyShopWidget.setItemMask(A0_197, A1_198, A2_199, A3_200)
  local L4_201, L5_202
  L5_202 = A0_197
  L4_201 = A0_197.getListDataMakerName
  L4_201 = L4_201(L5_202, A1_198)
  L5_202 = A2_199 - 1
  if L5_202 < A0_197:getListFilteredCount(L4_201) then
    if A3_200 == true then
      A0_197:setListProperty(L4_201, L5_202, "mask", 1)
      A0_197:setListProperty(L4_201, L5_202, "nameStyle", "TBL_selectedItem")
    else
      A0_197:setListProperty(L4_201, L5_202, "mask", 0)
      A0_197:setListProperty(L4_201, L5_202, "nameStyle", "TBL_null")
    end
    A0_197:updateListProperty(L4_201)
  end
end
function GrandCompanyShopWidget.setShopEditData(A0_203, A1_204, A2_205)
  local L3_206
  L3_206 = A0_203.work
  L3_206.chosenOperation = A1_204
  L3_206 = A0_203.work
  L3_206.buyCount = A2_205
end
function GrandCompanyShopWidget.closeShopEdit(A0_207)
  A0_207:selectedBorder()
  if A0_207.work.chosenOperation == 1 then
    A0_207:setBaseAskResult(1)
  else
    A0_207.work.editWidgetOpen = 0
    A0_207.work.selectedItemSheetIndex = -1
  end
  A0_207.work.chosenOperation = 0
  if A0_207:getChildWidgetByWindowName("ShopEditWidget") ~= nil then
    A0_207.work.closetime = worldMaster:_getServerTime()
    desktopWidget:closeChildWidget("ShopEditWidget", A0_207)
  end
  A0_207.work.focusevent = false
end
function GrandCompanyShopWidget.getItemContent(A0_208, A1_209, A2_210, A3_211)
  local L4_212, L5_213
  if A1_209 == nil then
    L5_213 = A0_208
    L4_212 = A0_208.getControlProperty
    return L4_212(L5_213, A2_210, A3_211)
  else
    L5_213 = A0_208
    L4_212 = A0_208.getListDataMakerName
    L4_212 = L4_212(L5_213)
    L5_213 = A0_208.getSelectedIndex
    L5_213 = L5_213(A0_208, A0_208:getListBoxName())
    return A0_208:getListProperty(L4_212, L5_213, A2_210)
  end
end
function GrandCompanyShopWidget.getAskWaitStatus(A0_214)
  return A0_214.work.askStatus
end
