require("/Widget/Ask/AskBaseClass")
_defineClass("ItemSearchWidget", "AskBaseClass")
function ItemSearchWidget.initAsk(A0_0)
  A0_0.work._temp = {
    {"phase", "integer8"},
    {"market", "integer32"},
    {"itemType", "integer32"},
    {"itemId", "integer32"}
  }
  A0_0.work.phase = 0
  A0_0.work.market = 0
  A0_0.work.itemType = 0
  A0_0.work.itemId = 0
  A0_0:setConfirmCondition("Button_Close")
  A0_0:setConfirmCondition("Button_Back")
  A0_0:setControlCommandCondition("ListBox_Item", "UILuaCommands.SelectionChanged")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:initPhase(1)
end
function ItemSearchWidget.initPhase(A0_1, A1_2)
  local L2_3
  L2_3 = A1_2
  if L2_3 == 1 then
    A0_1:initMarketSelectPhase()
    break
  else
  end
  if L2_3 == 2 then
    A0_1:initItemTypeSelectPhase()
    break
  else
  end
  if L2_3 == 3 then
    A0_1:initItemSelectPhase()
    break
  else
  end
  L2_3 = A0_1.work
  L2_3.phase = A1_2
end
function ItemSearchWidget.processUICommandClose(A0_4, A1_5, A2_6, A3_7, A4_8)
  A0_4:setBaseAskResult(-1)
end
function ItemSearchWidget.processUICommandOperate(A0_9, A1_10, A2_11, A3_12, A4_13)
  local L5_14
  L5_14 = A0_9.work
  L5_14 = L5_14.phase
  if L5_14 == 1 then
    A0_9:operateMarketSelectPhase(A2_11)
    break
  else
  end
  if L5_14 == 2 then
    A0_9:operateItemTypeSelectPhase(A2_11)
    break
  else
  end
  if L5_14 == 3 then
    A0_9:operateItemSelectPhase(A2_11)
    break
  else
  end
end
function ItemSearchWidget.processUICommandSelectionChanged(A0_15, A1_16, A2_17, A3_18, A4_19)
  local L5_20
  L5_20 = A0_15.work
  L5_20 = L5_20.phase
  if L5_20 == 1 then
    A0_15:selectionChangedMarketSelectPhase(A2_17, A3_18)
    break
  else
  end
  if L5_20 == 2 then
    A0_15:selectionChangedItemTypeSelectPhase(A2_17, A3_18)
    break
  else
  end
  if L5_20 == 3 then
    A0_15:selectionChangedItemSelectPhase(A2_17, A3_18)
    break
  else
  end
end
function ItemSearchWidget.processUICommandCancel(A0_21, A1_22, A2_23, A3_24, A4_25)
  local L5_26
  L5_26 = A0_21.work
  L5_26 = L5_26.phase
  if L5_26 == 1 then
    A0_21:cancelMarketSelectPhase()
    break
  else
  end
  if L5_26 == 2 then
    A0_21:cancelItemTypeSelectPhase()
    break
  else
  end
  if L5_26 == 3 then
    A0_21:cancelItemSelectPhase()
    break
  else
  end
end
function ItemSearchWidget.initMarketSelectPhase(A0_27)
  A0_27:setVisibility("Grid_ItemNameBase", false)
  A0_27:deleteListPropertyAll("DataMaker_ListBox")
  A0_27:setListProperty("DataMaker_ListBox", 0, "Name", "\227\131\149\227\130\161\227\130\164\227\130\191\227\131\188\232\161\151")
  A0_27:setListProperty("DataMaker_ListBox", 0, "Data", 0)
  A0_27:setListProperty("DataMaker_ListBox", 1, "Name", "\227\130\189\227\131\188\227\130\181\227\131\169\227\131\188\232\161\151")
  A0_27:setListProperty("DataMaker_ListBox", 1, "Data", 1)
  A0_27:updateListProperty("DataMaker_ListBox")
end
function ItemSearchWidget.operateMarketSelectPhase(A0_28, A1_29)
  if A1_29 == "Button_Close" then
    A0_28:setBaseAskResult(-1)
  elseif A1_29 == "Button_Back" then
    A0_28:setBaseAskResult(-1)
  end
end
function ItemSearchWidget.selectionChangedMarketSelectPhase(A0_30, A1_31, A2_32)
  A0_30.work.market = A0_30:getListProperty("DataMaker_ListBox", A2_32, "Data")
  A0_30:initPhase(2)
end
function ItemSearchWidget.cancelMarketSelectPhase(A0_33)
  A0_33:setBaseAskResult(-1)
end
function ItemSearchWidget.initItemTypeSelectPhase(A0_34)
  A0_34:setVisibility("Grid_ItemNameBase", false)
  A0_34:deleteListPropertyAll("DataMaker_ListBox")
  A0_34:setListProperty("DataMaker_ListBox", 0, "Name", "\231\137\135\230\137\139\229\137\163\233\161\158")
  A0_34:setListProperty("DataMaker_ListBox", 0, "Data", 0)
  A0_34:setListProperty("DataMaker_ListBox", 1, "Name", "\228\184\161\230\137\139\229\137\163\233\161\158")
  A0_34:setListProperty("DataMaker_ListBox", 1, "Data", 1)
  A0_34:updateListProperty("DataMaker_ListBox")
end
function ItemSearchWidget.operateItemTypeSelectPhase(A0_35, A1_36)
  if A1_36 == "Button_Close" then
    A0_35:setBaseAskResult(-1)
  elseif A1_36 == "Button_Back" then
    A0_35:initPhase(1)
  end
end
function ItemSearchWidget.selectionChangedItemTypeSelectPhase(A0_37, A1_38, A2_39)
  A0_37.work.itemType = A0_37:getListProperty("DataMaker_ListBox", A2_39, "Data")
  A0_37:initPhase(3)
end
function ItemSearchWidget.cancelItemTypeSelectPhase(A0_40)
  A0_40:initPhase(1)
end
function ItemSearchWidget.initItemSelectPhase(A0_41)
  A0_41:setVisibility("Grid_ItemNameBase", false)
  A0_41:deleteListPropertyAll("DataMaker_ListBox")
  A0_41:setListProperty("DataMaker_ListBox", 0, "Name", "C++\227\129\139\227\130\137\229\133\165\227\130\140\227\130\139\227\131\135\227\131\188\227\130\1911")
  A0_41:setListProperty("DataMaker_ListBox", 0, "Data", 0)
  A0_41:setListProperty("DataMaker_ListBox", 1, "Name", "C++\227\129\139\227\130\137\229\133\165\227\130\140\227\130\139\227\131\135\227\131\188\227\130\1912")
  A0_41:setListProperty("DataMaker_ListBox", 1, "Data", 1)
  A0_41:updateListProperty("DataMaker_ListBox")
end
function ItemSearchWidget.operateItemSelectPhase(A0_42, A1_43)
  if A1_43 == "Button_Close" then
    A0_42:setBaseAskResult(-1)
  elseif A1_43 == "Button_Back" then
    A0_42:initPhase(2)
  end
end
function ItemSearchWidget.selectionChangedItemSelectPhase(A0_44, A1_45, A2_46)
  A0_44.work.itemId = A0_44:getListProperty("DataMaker_ListBox", A2_46, "Data")
end
function ItemSearchWidget.cancelItemSelectPhase(A0_47)
  A0_47:initPhase(2)
end
