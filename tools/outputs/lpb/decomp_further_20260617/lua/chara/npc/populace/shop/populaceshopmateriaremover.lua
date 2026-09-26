require("/Chara/Npc/Populace/Shop/ShopBaseClass")
_defineClass("PopulaceShopMateriaRemover", "ShopBaseClass")
function PopulaceShopMateriaRemover.initForShop(A0_0)
  A0_0:_loadTextDataPermanently(7588, "populaceShopMateriaRemover")
end
function PopulaceShopMateriaRemover.welcomeTalk(A0_1, A1_2)
  A0_1:startCliantTalkTurn(2, A1_2)
  A0_1:_runCharaScheduler(70017024)
  A0_1:say(A0_1, 14, 0)
  A0_1:_waitForCharaSchedulerFinished(70017024)
  return
end
function PopulaceShopMateriaRemover.selectMode(A0_3, A1_4)
  return (A0_3:askRestrictChoices(A0_3, 1, true, A1_4, true))
end
function PopulaceShopMateriaRemover.askTradeJoinMateriaItem(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = false
  if A2_7 == true then
    A0_5:_runCharaScheduler(70078464)
    A0_5:say(A0_5, 21, 0)
    A0_5:say(A0_5, 22, 0)
    A0_5:_waitForCharaSchedulerFinished(70078464)
    worldMaster:say(A0_5, 23, 2001003, 1)
    worldMaster:say(A0_5, 24)
    worldMaster:say(A0_5, 25)
    A0_5:_runCharaScheduler(70017024)
    A0_5:say(A0_5, 27, 0)
    A0_5:_waitForCharaSchedulerFinished(70017024)
    if A1_6 == 1 and A0_5:askExtendWidget(A0_5, 8, 2, 1, 1, 2001002, 1, 2001003, 1) == 1 then
      A0_5:_runCharaScheduler(70139904)
      A0_5:_waitForCharaSchedulerFinished(70139904)
      L3_8 = true
    else
    end
  else
    A0_5:_runCharaScheduler(70103040)
    A0_5:say(A0_5, 20, 0)
    A0_5:_waitForCharaSchedulerFinished(70103040)
  end
  return L3_8
end
function PopulaceShopMateriaRemover.preRemove(A0_9)
  A0_9:_runCharaScheduler(70017024)
  A0_9:say(A0_9, 15, 0)
  A0_9:_waitForCharaSchedulerFinished(70017024)
  worldMaster:say(A0_9, 16)
end
function PopulaceShopMateriaRemover.removedone(A0_10)
  A0_10:_runCharaScheduler(70017024)
  A0_10:say(A0_10, 29, 0)
  A0_10:_waitForCharaSchedulerFinished(70017024)
end
function PopulaceShopMateriaRemover.confirmRemove(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16)
  local L6_17
  L6_17 = false
  if desktopWidget:openEventModeChildWidgetYield("Ask/MateriaDialogWidget", nil, 2, nil, A1_12, A2_13, A3_14, A4_15, A5_16) == true and desktopWidget:getEventModeWidget("Ask/MateriaDialogWidget") ~= nil then
    desktopWidget:closeEventModeWidget("Ask/MateriaDialogWidget")
    if desktopWidget:selectEventModeWidgetYield("Ask/MateriaDialogWidget") == true and desktopWidget:selectEventModeWidgetYield("Ask/MateriaDialogWidget") == 1 then
      if desktopWidget:getEventModeWidget("Ask/MateriaRemoveWidget") ~= nil then
        desktopWidget:getEventModeWidget("Ask/MateriaRemoveWidget"):hide()
      end
      A0_11:_runCharaScheduler(70275093)
      A0_11:_waitForCharaSchedulerFinished(70275093)
      L6_17 = true
    end
  end
  return L6_17
end
function PopulaceShopMateriaRemover.cancelRemove(A0_18)
  A0_18:_runCharaScheduler(70103040)
  A0_18:say(A0_18, 19, 0)
  A0_18:_waitForCharaSchedulerFinished(70103040)
  return
end
function PopulaceShopMateriaRemover.openRemoveWidget(A0_19)
  desktopWidget:openEventModeWidgetYield("Ask/MateriaRemoveWidget")
end
function PopulaceShopMateriaRemover.closeRemoveWidget(A0_20)
  desktopWidget:closeEventModeWidget("Ask/MateriaRemoveWidget")
end
function PopulaceShopMateriaRemover.selectRemoveWidget(A0_21)
  local L1_22, L2_23, L3_24, L4_25
  L1_22 = desktopWidget
  L2_23 = L1_22
  L1_22 = L1_22.getEventModeWidget
  L3_24 = "Ask/MateriaRemoveWidget"
  L1_22 = L1_22(L2_23, L3_24)
  if L1_22 ~= nil then
    L3_24 = L1_22
    L2_23 = L1_22.closeMateriaList
    L2_23(L3_24)
  end
  L2_23 = desktopWidget
  L3_24 = L2_23
  L2_23 = L2_23.selectEventModeWidgetYield
  L4_25 = "Ask/MateriaRemoveWidget"
  L3_24 = L2_23(L3_24, L4_25)
  if L2_23 == false then
    L4_25 = nil
    return L4_25
  end
  L4_25 = nil
  if L3_24 > 0 then
    L4_25 = worldMaster:_getMyPlayer():_getItem(1, L3_24)
  end
  return L4_25
end
