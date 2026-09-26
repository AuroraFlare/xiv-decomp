require("/Widget/Ask/AskBaseClass")
_defineClass("TreasureListWidget", "AskBaseClass")
function TreasureListWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemListWidget"
  return L1_1
end
function TreasureListWidget.initAsk(A0_2)
  A0_2.work._temp = {
    {"helpIndex", "integer16"},
    {
      "selectIndex",
      "integer16"
    }
  }
  A0_2:setCancelCondition()
  A0_2:setCloseCondition()
  A0_2:setVisibility("TabItem_2", false)
  A0_2:setVisibility("TabItem_3", false)
  A0_2:setVisibility("TabItem_4", false)
  A0_2:setVisibility("TabItem_5", false)
  A0_2:setVisibility("TabItem_6", false)
  A0_2:setVisibility("Grid_BackpackAndGil", false)
  A0_2:setVisibility("Grid_ItemBazaarInformation", false)
  A0_2:setControlCommandCondition("ListBox_TabItem_1", "UILuaCommands.MouseEnteredItem")
  A0_2:setControlCommandCondition("ListBox_TabItem_1", "UILuaCommands.AnchoredItem")
  A0_2:setControlCommandCondition("ListBox_TabItem_1", "UILuaCommands.Selection")
end
function TreasureListWidget.updateList(A0_3)
  A0_3:updateListProperty("TabItem_1_Maker")
  A0_3.work.helpIndex = 0
  A0_3:updateHelpInfo()
end
function TreasureListWidget.processUICommandSelection(A0_4, A1_5, A2_6, A3_7, A4_8)
  A0_4.work.selectIndex = A3_7 + 1
  desktopWidget:openChildWidget("CommonAskWidget", A0_4, true, nil, "\230\156\172\229\189\147\227\129\171\228\186\164\230\143\155\227\129\151\227\129\190\227\129\153\227\129\139\239\188\159\239\188\136\228\187\174\239\188\137", 2, "\227\129\175\227\129\132", "\227\129\132\227\129\132\227\129\136")
end
function TreasureListWidget.processUICommandClose(A0_9, A1_10, A2_11, A3_12, A4_13)
  A0_9:setBaseAskResult(-1)
end
function TreasureListWidget.processUICommandDefault(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19)
  local L6_20
  L6_20 = A3_17
  if L6_20 == "UILuaCommands.MouseEnteredItem" then
  else
  end
  if L6_20 == "UILuaCommands.AnchoredItem" then
    if A4_18 == nil or A4_18 < 0 then
      return
    end
    A0_14.work.helpIndex = A4_18
    A0_14:setCommonTimer(0.2)
    do break end
    break
  else
  end
end
function TreasureListWidget.processAskResult(A0_21, A1_22)
  if A1_22 == 1 then
    A0_21:setBaseAskResult(A0_21.work.selectIndex)
  end
end
function TreasureListWidget.processTimer(A0_23)
  A0_23:updateHelpInfo()
end
function TreasureListWidget.addListItem(A0_24, A1_25, A2_26, A3_27)
  local L4_28, L5_29
  if A2_26 == nil then
    return
  end
  L4_28 = worldMaster
  L5_29 = L4_28
  L4_28 = L4_28._getMyPlayer
  L4_28 = L4_28(L5_29)
  L5_29 = L4_28._createVirtualItem
  L5_29 = L5_29(L4_28, A2_26, A3_27, 1)
  desktopWidget:setItemToXml(A0_24, "TabItem_1_Maker", A1_25, L5_29, "TBL_null", L5_29:_getCatalogID(), L5_29:getItemIcon(), L5_29:_isStackable(), L5_29:_countStack(), L5_29:_getNameIndex(), 0, false, false, 4, nil, nil, nil, false)
  desktopWidget:setItemDetailToXml(A0_24, "TabItem_1_Maker", A1_25, L5_29, L5_29:_getNameIndex(), nil, 4)
end
function TreasureListWidget.updateHelpInfo(A0_30)
  local L1_31, L2_32
  L1_31 = A0_30.work
  L1_31 = L1_31.helpIndex
  L2_32 = A0_30.getListPropertyCount
  L2_32 = L2_32(A0_30, "TabItem_1_Maker")
  if L1_31 >= L2_32 then
    L2_32 = A0_30.setVisibility
    L2_32(A0_30, "TabItem_1", false)
    L2_32 = A0_30.setVisibility
    L2_32(A0_30, "TextBlock_NoContents_1", true)
    L2_32 = A0_30.setVisibility
    L2_32(A0_30, "Grid_ItemNameBase", false)
    L2_32 = A0_30.setVisibility
    L2_32(A0_30, "Grid_ItemDetail1", false)
    L2_32 = A0_30.setVisibility
    L2_32(A0_30, "Grid_ItemDetail2", false)
    L2_32 = A0_30.setVisibility
    L2_32(A0_30, "Grid_ItemDetail3", false)
    return
  end
  L2_32 = desktopWidget
  L2_32 = L2_32.setItemDetail
  L2_32(L2_32, A0_30, nil, "TabItem_1_Maker", L1_31)
  L2_32 = nil
  desktopWidget:setItemDetailEquipWithGridControl(A0_30, nil, "TabItem_1_Maker", L1_31, L2_32, true, false, false, true)
end
