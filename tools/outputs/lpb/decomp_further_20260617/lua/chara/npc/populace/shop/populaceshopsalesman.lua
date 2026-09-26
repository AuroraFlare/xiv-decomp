require("/Chara/Npc/Populace/Shop/ShopBaseClass")
_defineClass("PopulaceShopSalesman", "ShopBaseClass")
function PopulaceShopSalesman.initForShop(A0_0)
  A0_0:_loadTextDataPermanently(565, "populaceShopSalesman")
end
function PopulaceShopSalesman.welcomeTalk(A0_1, A1_2, A2_3, A3_4, A4_5)
  A0_1:startCliantTalkTurn(2, A2_3)
  if A1_2 ~= nil then
    A0_1:say(A0_1, A1_2, 0)
  end
  if A3_4 ~= nil then
    A0_1:say(A0_1, A3_4, 0)
  end
  if A4_5 ~= nil then
    A0_1:say(A0_1, A4_5, 0)
  end
  return
end
function PopulaceShopSalesman.selectMode(A0_6, A1_7)
  local L2_8, L3_9
  if A1_7 == nil or A1_7 == -7 or A1_7 == -8 or A1_7 == -9 then
    L3_9 = A0_6.askExtendWidget
    L3_9 = L3_9(A0_6, A0_6, 16, 3, 1, 1)
    if L3_9 < 3 then
      L2_8 = L3_9
    end
  elseif A1_7 < 0 then
    L3_9 = {
      218,
      219,
      220,
      221,
      231
    }
    if desktopWidget:askForEventMode(A0_6, A0_6, A0_6, 1, false, true, 217, L3_9) < 5 then
      L2_8 = desktopWidget:askForEventMode(A0_6, A0_6, A0_6, 1, false, true, 217, L3_9)
    end
    if desktopWidget:askForEventMode(A0_6, A0_6, A0_6, 1, false, true, 217, L3_9) == 3 then
      A0_6:startTutorialCompatibility()
    elseif desktopWidget:askForEventMode(A0_6, A0_6, A0_6, 1, false, true, 217, L3_9) == 4 then
      A0_6:startTutorialConsumption(A1_7)
    end
  else
    L3_9 = A0_6.askExtendWidget
    L3_9 = L3_9(A0_6, A0_6, 115, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, A1_7, 0)
    if L3_9 < 5 then
      L2_8 = L3_9
    end
  end
  return L2_8
end
function PopulaceShopSalesman.selectModeOfClassVendor(A0_10)
  local L1_11, L2_12
  L2_12 = {
    272,
    273,
    274,
    275,
    276,
    277,
    279,
    280
  }
  if desktopWidget:askForEventMode(A0_10, A0_10, A0_10, 1, false, true, 271, L2_12) < 7 then
    L1_11 = desktopWidget:askForEventMode(A0_10, A0_10, A0_10, 1, false, true, 271, L2_12)
  elseif desktopWidget:askForEventMode(A0_10, A0_10, A0_10, 1, false, true, 271, L2_12) == 7 then
    L1_11 = 0
  end
  return L1_11
end
function PopulaceShopSalesman.selectModeOfMultiWeaponVendor(A0_13, A1_14)
  local L2_15, L3_16
  L3_16 = {
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290
  }
  if desktopWidget:askForEventMode(A0_13, A0_13, A0_13, 1, false, true, 282, L3_16) < 5 then
    L2_15 = desktopWidget:askForEventMode(A0_13, A0_13, A0_13, 1, false, true, 282, L3_16)
  elseif desktopWidget:askForEventMode(A0_13, A0_13, A0_13, 1, false, true, 282, L3_16) == 5 then
    L2_15 = 0
  elseif desktopWidget:askForEventMode(A0_13, A0_13, A0_13, 1, false, true, 282, L3_16) == 6 then
    A0_13:startTutorialCompatibility()
  elseif desktopWidget:askForEventMode(A0_13, A0_13, A0_13, 1, false, true, 282, L3_16) == 7 then
    A0_13:startTutorialConsumption(A1_14)
  end
  return L2_15
end
function PopulaceShopSalesman.selectModeOfMultiArmorVendor(A0_17, A1_18)
  local L2_19, L3_20
  L3_20 = {
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299
  }
  if desktopWidget:askForEventMode(A0_17, A0_17, A0_17, 1, false, true, 291, L3_20) < 5 then
    L2_19 = desktopWidget:askForEventMode(A0_17, A0_17, A0_17, 1, false, true, 291, L3_20)
  elseif desktopWidget:askForEventMode(A0_17, A0_17, A0_17, 1, false, true, 291, L3_20) == 5 then
    L2_19 = 0
  elseif desktopWidget:askForEventMode(A0_17, A0_17, A0_17, 1, false, true, 291, L3_20) == 6 then
    A0_17:startTutorialCompatibility()
  elseif desktopWidget:askForEventMode(A0_17, A0_17, A0_17, 1, false, true, 291, L3_20) == 7 then
    A0_17:startTutorialConsumption(A1_18)
  end
  return L2_19
end
function PopulaceShopSalesman.confirmSellingItem(A0_21, A1_22, A2_23, A3_24, A4_25)
  if A0_21:askExtendWidget(A0_21, 23, 2, 1, 1, A1_22, A2_23, A3_24, A4_25) == 1 then
    return true
  else
    return false
  end
end
function PopulaceShopSalesman.informSellPrice(A0_26, A1_27, A2_28, A3_29)
  desktopWidget:getChildWidgetByWindowName("Ask/ShopSellWidget"):setPrice(A1_27, A2_28, A3_29)
end
function PopulaceShopSalesman.selectFacility(A0_30, A1_31, A2_32, A3_33)
  if A3_33 >= A0_30:askExtendWidget(A0_30, A2_32, A3_33, 1, 1) then
    return (A0_30:askExtendWidget(A0_30, A2_32, A3_33, 1, 1))
  end
  return
end
function PopulaceShopSalesman.confirmUseFacility(A0_34, A1_35, A2_36)
  local L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43
  L5_38 = A0_34
  L4_37 = A0_34.askExtendWidget
  L6_39 = A0_34
  L7_40 = 31
  L8_41 = 2
  L9_42 = 1
  L10_43 = 1
  L4_37 = L4_37(L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, A2_36, A1_35:getMoneyOnHand())
  if L4_37 == 1 then
    L5_38 = true
    return L5_38
  end
  L5_38 = false
  return L5_38
end
function PopulaceShopSalesman.startTutorialCompatibility(A0_44)
  worldMaster:say(A0_44, 222)
  worldMaster:say(A0_44, 223)
  worldMaster:say(A0_44, 224)
  worldMaster:say(A0_44, 225)
  worldMaster:say(A0_44, 226)
  worldMaster:say(A0_44, 300)
end
function PopulaceShopSalesman.startTutorialConsumption(A0_45, A1_46)
  worldMaster:say(A0_45, 227)
  worldMaster:say(A0_45, 228)
  worldMaster:say(A0_45, 229)
  worldMaster:say(A0_45, 232)
  if A1_46 == -1 then
    worldMaster:say(A0_45, 230)
  elseif A1_46 == -2 then
    worldMaster:say(A0_45, 233)
  elseif A1_46 == -3 then
    worldMaster:say(A0_45, 234)
  end
end
function PopulaceShopSalesman.startTutorial(A0_47, A1_48, A2_49)
  if A2_49 == nil then
    return
  end
  while true == true do
    if A2_49 == 29 then
      if A0_47:askExtendWidget(A0_47, 133, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 139, 0)
      elseif A0_47:askExtendWidget(A0_47, 133, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 140, 0)
      elseif A0_47:askExtendWidget(A0_47, 133, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 141, 0)
      elseif A0_47:askExtendWidget(A0_47, 133, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 142, 0)
        A0_47:say(A0_47, 143, 0)
      else
        A0_47:say(A0_47, 144, 0)
      end
    elseif A2_49 == 30 then
      if A0_47:askExtendWidget(A0_47, 145, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 151, 0)
      elseif A0_47:askExtendWidget(A0_47, 145, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 152, 0)
      elseif A0_47:askExtendWidget(A0_47, 145, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 153, 0)
      elseif A0_47:askExtendWidget(A0_47, 145, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 154, 0)
        A0_47:say(A0_47, 155, 0)
      else
        A0_47:say(A0_47, 156, 0)
      end
    elseif A2_49 == 31 then
      if A0_47:askExtendWidget(A0_47, 157, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 163, 0)
      elseif A0_47:askExtendWidget(A0_47, 157, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 164, 0)
      elseif A0_47:askExtendWidget(A0_47, 157, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 165, 0)
      elseif A0_47:askExtendWidget(A0_47, 157, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 166, 0)
        A0_47:say(A0_47, 167, 0)
      else
        A0_47:say(A0_47, 168, 0)
      end
    elseif A2_49 == 32 then
      if A0_47:askExtendWidget(A0_47, 169, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 175, 0)
      elseif A0_47:askExtendWidget(A0_47, 169, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 176, 0)
      elseif A0_47:askExtendWidget(A0_47, 169, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 177, 0)
      elseif A0_47:askExtendWidget(A0_47, 169, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 178, 0)
        A0_47:say(A0_47, 179, 0)
      else
        A0_47:say(A0_47, 180, 0)
      end
    elseif A2_49 == 33 then
      if A0_47:askExtendWidget(A0_47, 181, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 187, 0)
      elseif A0_47:askExtendWidget(A0_47, 181, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 188, 0)
      elseif A0_47:askExtendWidget(A0_47, 181, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 189, 0)
      elseif A0_47:askExtendWidget(A0_47, 181, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 190, 0)
        A0_47:say(A0_47, 191, 0)
      else
        A0_47:say(A0_47, 192, 0)
      end
    elseif A2_49 == 34 then
      if A0_47:askExtendWidget(A0_47, 193, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 199, 0)
      elseif A0_47:askExtendWidget(A0_47, 193, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 200, 0)
      elseif A0_47:askExtendWidget(A0_47, 193, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 201, 0)
      elseif A0_47:askExtendWidget(A0_47, 193, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 202, 0)
        A0_47:say(A0_47, 203, 0)
      else
        A0_47:say(A0_47, 204, 0)
      end
    elseif A2_49 == 35 then
      if A0_47:askExtendWidget(A0_47, 205, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 211, 0)
      elseif A0_47:askExtendWidget(A0_47, 205, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 212, 0)
      elseif A0_47:askExtendWidget(A0_47, 205, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 213, 0)
      elseif A0_47:askExtendWidget(A0_47, 205, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 214, 0)
        A0_47:say(A0_47, 215, 0)
      else
        A0_47:say(A0_47, 216, 0)
      end
    elseif A2_49 == 36 then
      if A0_47:askExtendWidget(A0_47, 121, 5, 1, 1) == 1 then
        A0_47:say(A0_47, 127, 0)
      elseif A0_47:askExtendWidget(A0_47, 121, 5, 1, 1) == 2 then
        A0_47:say(A0_47, 128, 0)
      elseif A0_47:askExtendWidget(A0_47, 121, 5, 1, 1) == 3 then
        A0_47:say(A0_47, 129, 0)
      elseif A0_47:askExtendWidget(A0_47, 121, 5, 1, 1) == 4 then
        A0_47:say(A0_47, 130, 0)
        A0_47:say(A0_47, 131, 0)
      else
        A0_47:say(A0_47, 132, 0)
      end
    else
    end
  end
  return
end
