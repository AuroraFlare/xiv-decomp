require("/Chara/Npc/NpcBaseClass")
_defineBaseClass("ShopBaseClass", "NpcBaseClass")
function ShopBaseClass.getShopBaseDetail(A0_0, A1_1)
  local L2_2, L3_3
  L2_2 = shopBaseSheet
  L3_3 = L2_2
  L2_2 = L2_2._loadKeyTemporarily
  L2_2(L3_3, A1_1, A1_1)
  L2_2 = shopBaseSheet
  L3_3 = L2_2
  L2_2 = L2_2._getData
  L2_2 = L2_2(L3_3, A1_1, 0)
  L3_3 = shopBaseSheet
  L3_3 = L3_3._getData
  L3_3 = L3_3(L3_3, A1_1, 1)
  return L2_2, L3_3
end
function ShopBaseClass.getShopSellingItemMax(A0_4, A1_5)
  if A0_4:getShopBaseDetail(A1_5) < A0_4:getShopBaseDetail(A1_5) then
    return 0
  end
  return A0_4:getShopBaseDetail(A1_5) - A0_4:getShopBaseDetail(A1_5) + 1
end
function ShopBaseClass.initForEvent(A0_6)
  A0_6.shopWork._temp = {
    {
      "_assignForChild",
      32
    }
  }
  A0_6:_setGroundOn(false)
  A0_6:initForShop()
end
function ShopBaseClass.initForShop(A0_7)
  local L1_8
end
function ShopBaseClass.openShopBuy(A0_9, A1_10, A2_11, A3_12)
  if A3_12 == nil then
    A3_12 = 1000001
  end
  desktopWidget:openEventModeWidgetYield("Ask/ShopBuyWidget", A0_9, A2_11, A3_12)
end
function ShopBaseClass.closeShopBuy(A0_13, A1_14)
  desktopWidget:closeEventModeWidget("Ask/ShopBuyWidget")
end
function ShopBaseClass.selectShopBuy(A0_15, A1_16)
  local L2_17, L3_18, L4_19
  L2_17 = desktopWidget
  L3_18 = L2_17
  L2_17 = L2_17.selectEventModeWidgetYield
  L4_19 = "Ask/ShopBuyWidget"
  L4_19 = L2_17(L3_18, L4_19)
  if L2_17 == false then
    L3_18 = 0
    L4_19 = 0
  end
  return L3_18, L4_19
end
function ShopBaseClass.openShopSell(A0_20, A1_21)
  desktopWidget:openEventModeWidgetYield("Ask/ShopSellWidget")
end
function ShopBaseClass.closeShopSell(A0_22, A1_23)
  desktopWidget:closeEventModeWidget("Ask/ShopSellWidget")
end
function ShopBaseClass.selectShopSell(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32
  L2_26 = desktopWidget
  L3_27 = L2_26
  L2_26 = L2_26.selectEventModeWidgetYield
  L4_28 = "Ask/ShopSellWidget"
  L6_30 = L2_26(L3_27, L4_28)
  if L2_26 == false then
    L3_27 = 0
    L4_28 = 0
    L5_29 = 0
    L6_30 = 0
  end
  L7_31, L8_32 = nil, nil
  if L4_28 ~= nil and L4_28 > 0 then
    L7_31 = A1_25:_getItem(L3_27, L4_28)
  end
  if L6_30 ~= nil then
    if L6_30 == 0 then
      L8_32 = 0
    elseif L6_30 == 1 then
      L8_32 = 1
    end
  end
  return L7_31, L5_29, L8_32, L3_27, L4_28
end
function ShopBaseClass.welcomeTalk(A0_33, A1_34, A2_35, A3_36)
  A0_33:startCliantTalkTurn(2, A3_36)
  A0_33:say(A0_33, A2_35, 0)
end
function ShopBaseClass.confirmSellingItem(A0_37, A1_38, A2_39, A3_40, A4_41)
end
function ShopBaseClass.informSellPrice(A0_42, A1_43, A2_44, A3_45)
  desktopWidget:getChildWidgetByWindowName("Ask/ShopSellWidget"):setPrice(A1_43, A2_44, A3_45)
end
function ShopBaseClass.finishTalkTurn(A0_46)
  A0_46:finishCliantTalkTurn()
end
function ShopBaseClass.getShopItemStartIndex(A0_47, A1_48)
  return A0_47:getShopBaseDetail(A1_48)
end
function ShopBaseClass.getShopSellingItemDetail(A0_49, A1_50, A2_51, A3_52, A4_53)
  local L5_54, L6_55, L7_56, L8_57, L9_58
  if A4_53 == nil then
    L7_56 = A0_49
    L6_55 = A0_49.getShopBaseDetail
    L8_57 = A2_51
    L6_55 = L6_55(L7_56, L8_57)
    L5_54 = L6_55
  else
    L5_54 = A4_53
  end
  L6_55 = L5_54 + A3_52
  L6_55 = L6_55 - 1
  L7_56 = shopItemSheet
  L8_57 = L7_56
  L7_56 = L7_56._loadKeyTemporarily
  L9_58 = L6_55
  L7_56(L8_57, L9_58, L6_55)
  L7_56 = shopItemSheet
  L8_57 = L7_56
  L7_56 = L7_56._getData
  L9_58 = L6_55
  L7_56 = L7_56(L8_57, L9_58, 0)
  L8_57 = shopItemSheet
  L9_58 = L8_57
  L8_57 = L8_57._getData
  L8_57 = L8_57(L9_58, L6_55, 1)
  L9_58 = shopItemSheet
  L9_58 = L9_58._getData
  L9_58 = L9_58(L9_58, L6_55, 2)
  return L7_56, L8_57, L9_58
end
