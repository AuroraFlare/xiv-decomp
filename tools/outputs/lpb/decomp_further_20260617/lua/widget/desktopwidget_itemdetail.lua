local L0_0, L1_1
L0_0 = DesktopWidget
function L1_1(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8, A7_9, A8_10, A9_11, A10_12, A11_13, A12_14, A13_15, A14_16, A15_17, A16_18, A17_19, A18_20)
  local L19_21, L20_22
  L20_22 = A1_3
  L19_21 = A1_3.setListProperty
  L19_21(L20_22, A2_4, A3_5, "isEnabled", "True")
  L20_22 = A0_2
  L19_21 = A0_2.isCampanyPoint
  L19_21 = L19_21(L20_22, A6_8)
  if L19_21 and A14_16 ~= 5 then
    L20_22 = A1_3
    L19_21 = A1_3.setListPropertyVisibility
    L19_21(L20_22, A2_4, A3_5, false)
    L19_21 = false
    return L19_21
  end
  if A14_16 == 2 or A14_16 == 12 or A14_16 == 24 or A14_16 == 21 or A14_16 == 14 or A14_16 == 8 or A14_16 == 17 or A14_16 == 19 then
    L20_22 = A0_2
    L19_21 = A0_2.isGil
    L19_21 = L19_21(L20_22, A6_8)
    if not L19_21 then
      L20_22 = A0_2
      L19_21 = A0_2.isGuildPoint
      L19_21 = L19_21(L20_22, A6_8)
    elseif L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListPropertyVisibility
      L19_21(L20_22, A2_4, A3_5, false)
      L19_21 = false
      return L19_21
    end
  end
  if A14_16 == 5 or A14_16 == 15 then
    L20_22 = A0_2
    L19_21 = A0_2.isCrystal
    L19_21 = L19_21(L20_22, A6_8)
    if L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListPropertyVisibility
      L19_21(L20_22, A2_4, A3_5, false)
      L19_21 = false
      return L19_21
    end
  end
  if A14_16 == 25 then
    L20_22 = A0_2
    L19_21 = A0_2.isCrystal
    L19_21 = L19_21(L20_22, A6_8)
    if not L19_21 then
      L20_22 = A0_2
      L19_21 = A0_2.isGuildPoint
      L19_21 = L19_21(L20_22, A6_8)
    elseif L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListPropertyVisibility
      L19_21(L20_22, A2_4, A3_5, false)
      L19_21 = false
      return L19_21
    end
  end
  L20_22 = A1_3
  L19_21 = A1_3.setListPropertyVisibility
  L19_21(L20_22, A2_4, A3_5, true)
  L20_22 = A1_3
  L19_21 = A1_3.setListProperty
  L19_21(L20_22, A2_4, A3_5, "selected", "Collapsed")
  if A18_20 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "selected", "Visible")
  end
  if A14_16 == 1 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "itemIndex", A16_18)
  elseif A14_16 == 6 or A14_16 == 9 or A14_16 == 16 or A14_16 == 17 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "catalog", A6_8)
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "itemPackage", A15_17)
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "itemIndex", A16_18)
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "itemKind", A4_6:getItemKind())
  elseif A14_16 == 22 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "catalog", A6_8)
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "stack", "")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "itemKind", A4_6:getItemKind())
  else
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "catalog", A6_8)
  end
  L20_22 = A1_3
  L19_21 = A1_3.setListProperty
  L19_21(L20_22, A2_4, A3_5, "icon", A7_9)
  if A14_16 == 22 then
    if A8_10 == true then
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackable", 1)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackCount", A9_11)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackMax", A4_6:_getMaxStack())
    else
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackable", 0)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackCount", 1)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackMax", 1)
    end
  elseif A8_10 then
    L20_22 = A1_3
    L19_21 = A1_3.setListText
    L19_21(L20_22, A2_4, A3_5, "stack", 225, A9_11)
    if A12_14 then
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackable", 1)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackCount", A9_11)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackMax", A4_6:_getMaxStack())
    end
  else
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "stack", "")
    if A12_14 then
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackable", 0)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackCount", 1)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stackMax", 1)
    end
  end
  if A14_16 == 6 or A14_16 == 16 or A14_16 == 17 or A14_16 == 22 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "life60", "Collapsed")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "life20", "Collapsed")
  elseif A14_16 == 9 then
    if A17_19 == 5 then
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "life60", "Collapsed")
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "life20", "Collapsed")
    end
  else
    L20_22 = A0_2
    L19_21 = A0_2.getItemLifeParam
    L20_22 = L19_21(L20_22, A1_3, A4_6)
    if L19_21(L20_22, A1_3, A4_6) == true then
      A1_3:setListProperty(A2_4, A3_5, "life60", "Visible")
    else
      A1_3:setListProperty(A2_4, A3_5, "life60", "Collapsed")
    end
    if L19_21(L20_22, A1_3, A4_6) == true then
      A1_3:setListProperty(A2_4, A3_5, "life20", "Visible")
    else
      A1_3:setListProperty(A2_4, A3_5, "life20", "Collapsed")
    end
  end
  if A14_16 == 5 then
    L20_22 = A0_2
    L19_21 = A0_2.isGil
    L19_21 = L19_21(L20_22, A6_8)
    if L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "name", 3650, A9_11)
    else
      L20_22 = A0_2
      L19_21 = A0_2.isGuildPoint
      L19_21 = L19_21(L20_22, A6_8)
      if L19_21 then
        L19_21 = A6_8 - 1000101
        L19_21 = 3621 + L19_21
        L20_22 = A1_3.setListText
        L20_22(A1_3, A2_4, A3_5, "name", L19_21, A9_11)
      else
        L20_22 = A0_2
        L19_21 = A0_2.isCampanyPoint
        L19_21 = L19_21(L20_22, A6_8)
        if L19_21 then
          L19_21 = A6_8 - 1000201
          L19_21 = 3651 + L19_21
          L20_22 = A1_3.setListText
          L20_22(A1_3, A2_4, A3_5, "name", L19_21, A9_11)
        else
          L20_22 = A1_3
          L19_21 = A1_3.setListText
          L19_21(L20_22, A2_4, A3_5, "name", 3202, A6_8, A10_12)
        end
      end
    end
  elseif A14_16 == 6 or A14_16 == 9 or A14_16 == 16 or A14_16 == 17 then
    L20_22 = A0_2
    L19_21 = A0_2.isGil
    L19_21 = L19_21(L20_22, A6_8)
    if L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "name", 3263, A9_11)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stack", "")
    else
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "name", 3202, A6_8, A10_12)
    end
  elseif A14_16 == 22 then
    if A6_8 == 1000001 then
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "name", 3263, A9_11)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stack", "")
    else
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "name", 3202, A6_8, 1)
    end
  elseif A14_16 == 25 then
    L20_22 = A0_2
    L19_21 = A0_2.isGil
    L19_21 = L19_21(L20_22, A6_8)
    if L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "name", 3264)
    end
  elseif A14_16 == 23 or A14_16 == 24 then
    L19_21 = desktopWidget
    L20_22 = L19_21
    L19_21 = L19_21.isGil
    L19_21 = L19_21(L20_22, A6_8)
    if not L19_21 then
      L19_21 = desktopWidget
      L20_22 = L19_21
      L19_21 = L19_21.isGuildPoint
      L19_21 = L19_21(L20_22, A6_8)
      if not L19_21 then
        L20_22 = A1_3
        L19_21 = A1_3.setListText
        L19_21(L20_22, A2_4, A3_5, "name", 3202, A6_8, A10_12)
      end
    end
  else
    L20_22 = A0_2
    L19_21 = A0_2.isGil
    L19_21 = L19_21(L20_22, A6_8)
    if L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "name", 3263, A9_11)
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stack", "")
    else
      L20_22 = A0_2
      L19_21 = A0_2.isGuildPoint
      L19_21 = L19_21(L20_22, A6_8)
      if L19_21 then
        L19_21 = A6_8 - 1000101
        L19_21 = 3421 + L19_21
        L20_22 = A1_3.setListText
        L20_22(A1_3, A2_4, A3_5, "name", L19_21, A9_11)
        L20_22 = A1_3.setListProperty
        L20_22(A1_3, A2_4, A3_5, "stack", "")
      else
        L20_22 = A0_2
        L19_21 = A0_2.isCampanyPoint
        L19_21 = L19_21(L20_22, A6_8)
        if L19_21 then
          L19_21 = A6_8 - 1000201
          L19_21 = 3651 + L19_21
          L20_22 = A1_3.setListText
          L20_22(A1_3, A2_4, A3_5, "name", L19_21, A9_11)
          L20_22 = A1_3.setListProperty
          L20_22(A1_3, A2_4, A3_5, "stack", "")
        else
          L20_22 = A1_3
          L19_21 = A1_3.setListText
          L19_21(L20_22, A2_4, A3_5, "name", 3202, A6_8, A10_12)
        end
      end
    end
  end
  if A11_13 then
    L20_22 = A0_2
    L19_21 = A0_2.setSortType
    L19_21(L20_22, A1_3, A2_4, A3_5, A11_13, A4_6)
  end
  L20_22 = A1_3
  L19_21 = A1_3.setListProperty
  L19_21(L20_22, A2_4, A3_5, "nameStyle", A5_7)
  if A14_16 == 6 then
    L19_21 = worldMaster
    L20_22 = L19_21
    L19_21 = L19_21._getMyPlayer
    L19_21 = L19_21(L20_22)
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "priceStyle", "TBL_null")
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "priceVisibility", "Visible")
  elseif A14_16 == 3 then
    L19_21 = worldMaster
    L20_22 = L19_21
    L19_21 = L19_21._getMyPlayer
    L19_21 = L19_21(L20_22)
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "priceVisibility", "Visible")
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "bazaarStatusVisibility", "Visible")
  elseif A14_16 == 7 or A14_16 == 8 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceStyle", "TBL_null")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Visible")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Hidden")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "price", "")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "isEnabled", false)
    L20_22 = A4_6
    L19_21 = A4_6.isRealizableItem
    L19_21 = L19_21(L20_22)
    if L19_21 == true then
      L20_22 = A1_3
      L19_21 = A1_3.setListText
      L19_21(L20_22, A2_4, A3_5, "price", 225, A4_6:getSellPrice())
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "isEnabled", not A4_6:_isEquipping())
    end
  elseif A14_16 == 9 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceStyle", A5_7)
    if A17_19 == 5 then
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "stack", "")
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "selected", "Collapsed")
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Hidden")
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Hidden")
    end
  elseif A14_16 == 16 or A14_16 == 17 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceStyle", "TBL_null")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Hidden")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Hidden")
    if A17_19 == 1 or A17_19 == nil then
      L20_22 = A4_6
      L19_21 = A4_6._isTrading
      L20_22 = L19_21(L20_22)
      A1_3:setListProperty(A2_4, A3_5, "tradenum", L20_22)
      if L20_22 > 0 then
        if A8_10 and not A0_2:isGil(A6_8) then
          A1_3:setListText(A2_4, A3_5, "stack", 225, A9_11 - L20_22)
        end
        A1_3:setListProperty(A2_4, A3_5, "nameStyle", "TBL_selectedItem")
        A1_3:setListProperty(A2_4, A3_5, "priceStyle", "TBL_selectedItem")
      end
    end
  elseif A14_16 == 18 or A14_16 == 19 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Hidden")
    L20_22 = A4_6
    L19_21 = A4_6.isRepairable
    L19_21 = L19_21(L20_22)
    if L19_21 then
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Visible")
    else
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Hidden")
    end
    if A17_19 == 1 or A17_19 == nil then
      L20_22 = A4_6
      L19_21 = A4_6._isTrading
      L20_22 = L19_21(L20_22)
      A1_3:setListProperty(A2_4, A3_5, "tradenum", L20_22)
      if L20_22 > 0 then
        if A8_10 == true and A6_8 ~= 1000001 then
          A1_3:setListText(A2_4, A3_5, "stack", 225, A9_11 - L20_22)
        end
        A5_7 = "TBL_selectedItem"
      end
    end
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "nameStyle", A5_7)
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceStyle", A5_7)
  elseif A14_16 == 20 or A14_16 == 21 then
    if A15_17 ~= 8 then
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "priceStyle", "TBL_null")
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Hidden")
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Hidden")
    else
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Visible")
      L20_22 = A1_3
      L19_21 = A1_3.setListProperty
      L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Visible")
    end
  elseif A13_15 then
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceStyle", A5_7)
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Hidden")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Hidden")
  else
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceStyle", "TBL_null")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "priceVisibility", "Hidden")
    L20_22 = A1_3
    L19_21 = A1_3.setListProperty
    L19_21(L20_22, A2_4, A3_5, "bazaarStatusVisibility", "Hidden")
  end
  L19_21 = "Collapsed"
  L20_22 = A0_2.cantEquipPlayer
  L20_22 = L20_22(A0_2, A4_6)
  if L20_22 == true then
    L19_21 = "Visible"
  end
  L20_22 = A1_3.setListProperty
  L20_22(A1_3, A2_4, A3_5, "equipx", L19_21)
  L20_22 = A4_6._isEquipping
  L20_22 = L20_22(A4_6)
  if L20_22 then
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "equiped", "Visible")
  else
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "equiped", "Collapsed")
  end
  L20_22 = _isInstanceOf
  L20_22 = L20_22(A4_6, "NormalItemBaseClass")
  if L20_22 then
    L20_22 = worldMaster
    L20_22 = L20_22._getMyPlayer
    L20_22 = L20_22(L20_22)
    if A4_6:canChangeFitness() and A4_6:getNormalItemFitness() == 10000 and A4_6:getMaterializePermission() and (L20_22:hasItem(101, 2001001) or L20_22:hasItem(101, 2001002) or L20_22:hasItem(101, 2001003)) then
      A1_3:setListProperty(A2_4, A3_5, "polmax", "Visible")
    else
      A1_3:setListProperty(A2_4, A3_5, "polmax", "Hidden")
    end
  else
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "polmax", "Hidden")
  end
  L20_22 = A4_6.isEquipment
  L20_22 = L20_22(A4_6)
  if L20_22 then
    L20_22 = A4_6.getMateriaBindPermission
    L20_22 = L20_22(A4_6)
    if L20_22 then
      L20_22 = A0_2.getAttachedMateriaCountByItem
      L20_22 = L20_22(A0_2, A4_6)
      if L20_22 > 0 then
        A1_3:setListProperty(A2_4, A3_5, "mcount", L20_22)
        A1_3:setListProperty(A2_4, A3_5, "mivisible", "Visible")
        A1_3:setListProperty(A2_4, A3_5, "mpvisible", "Hidden")
        A1_3:setListProperty(A2_4, A3_5, "mcvisible", "Visible")
      else
        A1_3:setListProperty(A2_4, A3_5, "mivisible", "Collapsed")
        A1_3:setListProperty(A2_4, A3_5, "mpvisible", "Visible")
        A1_3:setListProperty(A2_4, A3_5, "mcvisible", "Hidden")
      end
    else
      L20_22 = A1_3.setListProperty
      L20_22(A1_3, A2_4, A3_5, "mivisible", "Collapsed")
      L20_22 = A1_3.setListProperty
      L20_22(A1_3, A2_4, A3_5, "mpvisible", "Hidden")
      L20_22 = A1_3.setListProperty
      L20_22(A1_3, A2_4, A3_5, "mcvisible", "Hidden")
    end
  else
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "mivisible", "Collapsed")
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "mpvisible", "Hidden")
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "mcvisible", "Hidden")
  end
  if A5_7 == "TBL_selectedItem" then
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "opacity", "0.5")
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "same", "Visible")
  else
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "opacity", "1.0")
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "same", "Collapsed")
  end
  L20_22 = A4_6.isFood
  L20_22 = L20_22(A4_6)
  if not L20_22 then
    L20_22 = A4_6.isDrink
    L20_22 = L20_22(A4_6)
    if not L20_22 then
      L20_22 = A4_6.isPotion
      L20_22 = L20_22(A4_6)
    end
  else
    if L20_22 then
      L20_22 = A1_3.setListProperty
      L20_22(A1_3, A2_4, A3_5, "foodpotion", 1)
      L20_22 = A4_6.getItemConsumptionBonus
      L20_22 = L20_22(A4_6)
      A1_3:setListProperty(A2_4, A3_5, "fpParamCount", #L20_22)
      for _FORV_26_ = 1, #L20_22 do
        if _FORV_26_ == 1 then
          A1_3:setListProperty(A2_4, A3_5, "fpParamKind1", L20_22[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamValue1", L20_22(A4_6)[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamLimit1", L20_22(A4_6)[_FORV_26_])
        elseif _FORV_26_ == 2 then
          A1_3:setListProperty(A2_4, A3_5, "fpParamKind2", L20_22[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamValue2", L20_22(A4_6)[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamLimit2", L20_22(A4_6)[_FORV_26_])
        elseif _FORV_26_ == 3 then
          A1_3:setListProperty(A2_4, A3_5, "fpParamKind3", L20_22[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamValue3", L20_22(A4_6)[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamLimit3", L20_22(A4_6)[_FORV_26_])
        elseif _FORV_26_ == 4 then
          A1_3:setListProperty(A2_4, A3_5, "fpParamKind4", L20_22[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamValue4", L20_22(A4_6)[_FORV_26_])
          A1_3:setListProperty(A2_4, A3_5, "fpParamLimit4", L20_22(A4_6)[_FORV_26_])
        end
      end
      A1_3:setListProperty(A2_4, A3_5, "fpEffectTime", A4_6:getItemEffectTime())
      A1_3:setListProperty(A2_4, A3_5, "fpRecastTime", A4_6:getItemRecastTime())
  end
  else
    L20_22 = A1_3.setListProperty
    L20_22(A1_3, A2_4, A3_5, "foodpotion", 0)
  end
  L20_22 = true
  return L20_22
end
L0_0.setItemToXml = L1_1
L0_0 = DesktopWidget
function L1_1(A0_23, A1_24, A2_25, A3_26, A4_27, A5_28, A6_29, A7_30, A8_31)
  local L9_32, L10_33, L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "catalog"
  L16_39 = A4_27
  L15_38 = A4_27._getCatalogID
  L54_77 = L15_38(L16_39)
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "quality"
  L15_38 = A5_28
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  L9_32 = 0
  L11_34 = A4_27
  L10_33 = A4_27.isRareItem
  L10_33 = L10_33(L11_34)
  if L10_33 then
    L9_32 = 1
  end
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "rare"
  L15_38 = L9_32
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  L9_32 = 0
  L11_34 = A4_27
  L10_33 = A4_27.isExclusiveItem
  L10_33 = L10_33(L11_34)
  if L10_33 == true then
    L9_32 = 1
  end
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "ex"
  L15_38 = L9_32
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  L11_34 = A4_27
  L10_33 = A4_27.getMaterializePermission
  L10_33 = L10_33(L11_34)
  if L10_33 then
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "mperm"
    L15_38 = 1
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  else
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "mperm"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  end
  L11_34 = A4_27
  L10_33 = A4_27.getMateriaBindPermission
  L10_33 = L10_33(L11_34)
  if L10_33 then
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "mbperm"
    L15_38 = 1
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  else
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "mbperm"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  end
  L11_34 = A4_27
  L10_33 = A4_27.isEnchantMateria
  L10_33 = L10_33(L11_34)
  if L10_33 then
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "materia"
    L15_38 = 1
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "mkey"
    L16_39 = A4_27
    L15_38 = A4_27.getMateriaType
    L54_77 = L15_38(L16_39)
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "mrank"
    L16_39 = A4_27
    L15_38 = A4_27.getNormalItemParam1
    L54_77 = L15_38(L16_39)
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "eqrank"
    L16_39 = A4_27
    L15_38 = A4_27.getItemLevel
    L54_77 = L15_38(L16_39)
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
  else
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "materia"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  end
  L11_34 = A4_27
  L10_33 = A4_27.canChangeFitness
  L10_33 = L10_33(L11_34)
  if L10_33 then
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "canChangeFitness"
    L15_38 = 1
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  else
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "canChangeFitness"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  end
  L10_33 = _isInstanceOf
  L11_34 = A4_27
  L12_35 = "NormalItemBaseClass"
  L10_33 = L10_33(L11_34, L12_35)
  if L10_33 then
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "isNormal"
    L15_38 = 1
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
    L11_34 = A4_27
    L10_33 = A4_27.getNormalItemFitness
    L10_33 = L10_33(L11_34)
    L12_35 = A1_24
    L11_34 = A1_24.setListProperty
    L13_36 = A2_25
    L14_37 = A3_26
    L15_38 = "fitness"
    L16_39 = L10_33
    L11_34(L12_35, L13_36, L14_37, L15_38, L16_39)
    L12_35 = A4_27
    L11_34 = A4_27.isMateriaAttached
    L11_34 = L11_34(L12_35)
    if L11_34 then
      L13_36 = A1_24
      L12_35 = A1_24.setListProperty
      L14_37 = A2_25
      L15_38 = A3_26
      L16_39 = "attached"
      L17_40 = 1
      L12_35(L13_36, L14_37, L15_38, L16_39, L17_40)
    else
      L13_36 = A1_24
      L12_35 = A1_24.setListProperty
      L14_37 = A2_25
      L15_38 = A3_26
      L16_39 = "attached"
      L17_40 = 0
      L12_35(L13_36, L14_37, L15_38, L16_39, L17_40)
    end
  else
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "isNormal"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "fitness"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "attached"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  end
  L11_34 = A4_27
  L10_33 = A4_27.isRepairable
  L10_33 = L10_33(L11_34)
  if L10_33 then
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "repairable"
    L15_38 = 1
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  else
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "repairable"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  end
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "repairitem"
  L16_39 = A4_27
  L15_38 = A4_27.getItemRepairItem
  L54_77 = L15_38(L16_39)
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "repairinum"
  L16_39 = A4_27
  L15_38 = A4_27.getItemRepairItemNum
  L54_77 = L15_38(L16_39)
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "repairskill"
  L16_39 = A4_27
  L15_38 = A4_27.getItemRepairSkill
  L54_77 = L15_38(L16_39)
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "repairlevel"
  L16_39 = A4_27
  L15_38 = A4_27.getItemRepairLevel
  L54_77 = L15_38(L16_39)
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L15_38(L16_39))
  L11_34 = A1_24
  L10_33 = A1_24.setListProperty
  L12_35 = A2_25
  L13_36 = A3_26
  L14_37 = "accessory"
  L15_38 = 0
  L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  L11_34 = A4_27
  L10_33 = A4_27.isEquipment
  L10_33 = L10_33(L11_34)
  if L10_33 == true then
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "isEquipment"
    L15_38 = 1
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
    L10_33 = 0
    if A7_30 ~= 22 and (A6_29 == 1 or A6_29 == nil) then
      L12_35 = A4_27
      L11_34 = A4_27._isEquipping
      L11_34 = L11_34(L12_35)
      if L11_34 then
        L10_33 = 1
      end
    end
    L12_35 = A1_24
    L11_34 = A1_24.setListProperty
    L13_36 = A2_25
    L14_37 = A3_26
    L15_38 = "isEquipping"
    L16_39 = L10_33
    L11_34(L12_35, L13_36, L14_37, L15_38, L16_39)
    L12_35 = A4_27
    L11_34 = A4_27.getSubQuality
    L13_36 = L11_34(L12_35)
    L15_38 = A1_24
    L14_37 = A1_24.setListProperty
    L16_39 = A2_25
    L17_40 = A3_26
    L18_41 = "q1"
    L14_37(L15_38, L16_39, L17_40, L18_41, L19_42)
    L15_38 = A1_24
    L14_37 = A1_24.setListProperty
    L16_39 = A2_25
    L17_40 = A3_26
    L18_41 = "q2"
    L14_37(L15_38, L16_39, L17_40, L18_41, L19_42)
    L15_38 = A1_24
    L14_37 = A1_24.setListProperty
    L16_39 = A2_25
    L17_40 = A3_26
    L18_41 = "q3"
    L14_37(L15_38, L16_39, L17_40, L18_41, L19_42)
    L15_38 = A4_27
    L14_37 = A4_27.getItemMainSkill
    L15_38 = L14_37(L15_38)
    L17_40 = A4_27
    L16_39 = A4_27.getItemLevel
    L16_39 = L16_39(L17_40)
    L18_41 = A1_24
    L17_40 = A1_24.setListProperty
    L22_45 = L14_37
    L17_40(L18_41, L19_42, L20_43, L21_44, L22_45)
    L18_41 = A1_24
    L17_40 = A1_24.setListProperty
    L22_45 = L15_38
    L17_40(L18_41, L19_42, L20_43, L21_44, L22_45)
    L18_41 = A1_24
    L17_40 = A1_24.setListProperty
    L23_46 = A4_27
    L22_45 = A4_27.getItemCompatibilityKey
    L54_77 = L22_45(L23_46)
    L17_40(L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L22_45(L23_46))
    L18_41 = A1_24
    L17_40 = A1_24.setListProperty
    L22_45 = L16_39
    L17_40(L18_41, L19_42, L20_43, L21_44, L22_45)
    L18_41 = A1_24
    L17_40 = A1_24.setListProperty
    L23_46 = A4_27
    L22_45 = A4_27.getItemLevelType
    L54_77 = L22_45(L23_46)
    L17_40(L18_41, L19_42, L20_43, L21_44, L22_45, L23_46, L24_47, L25_48, L26_49, L27_50, L28_51, L29_52, L30_53, L31_54, L32_55, L33_56, L34_57, L35_58, L36_59, L37_60, L38_61, L39_62, L40_63, L41_64, L42_65, L43_66, L44_67, L45_68, L46_69, L47_70, L48_71, L49_72, L50_73, L51_74, L52_75, L53_76, L54_77, L22_45(L23_46))
    L18_41 = A0_23
    L17_40 = A0_23.getItemRankColorID
    L18_41 = L17_40(L18_41, L19_42, L20_43, L21_44)
    L22_45 = A3_26
    L23_46 = "rankcolor"
    L24_47 = L17_40
    L19_42(L20_43, L21_44, L22_45, L23_46, L24_47)
    L22_45 = A3_26
    L23_46 = "conditionColor"
    L24_47 = L18_41
    L19_42(L20_43, L21_44, L22_45, L23_46, L24_47)
    if (A7_30 == 16 or A7_30 == 17) and A8_31 == nil then
    else
      for L22_45 = 1, 3 do
        L24_47 = A1_24
        L23_46 = A1_24.setListProperty
        L25_48 = A2_25
        L26_49 = A3_26
        L27_50 = "bn3"
        L28_51 = tostring
        L29_52 = L22_45
        L28_51 = L28_51(L29_52)
        L27_50 = L27_50 .. L28_51
        L28_51 = -1
        L23_46(L24_47, L25_48, L26_49, L27_50, L28_51)
        L24_47 = A1_24
        L23_46 = A1_24.setListProperty
        L25_48 = A2_25
        L26_49 = A3_26
        L27_50 = "bv3"
        L28_51 = tostring
        L29_52 = L22_45
        L28_51 = L28_51(L29_52)
        L27_50 = L27_50 .. L28_51
        L28_51 = 0
        L23_46(L24_47, L25_48, L26_49, L27_50, L28_51)
      end
      L22_45 = A4_27
      L27_50 = L19_42(L20_43, L21_44, L22_45)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bn11"
      L33_56 = L19_42
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bv11"
      L33_56 = L20_43
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bh11"
      L33_56 = L21_44
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bn12"
      L33_56 = L22_45
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      if L22_45 == 15060 then
        L23_46 = L23_46 * 10
      end
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bv12"
      L33_56 = L23_46
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bh12"
      L33_56 = L24_47
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bn13"
      L33_56 = L25_48
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bv13"
      L33_56 = L26_49
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A1_24
      L28_51 = A1_24.setListProperty
      L30_53 = A2_25
      L31_54 = A3_26
      L32_55 = "bh13"
      L33_56 = L27_50
      L28_51(L29_52, L30_53, L31_54, L32_55, L33_56)
      L29_52 = A0_23
      L28_51 = A0_23.getItemBonus3
      L30_53 = A1_24
      L31_54 = A4_27
      L34_57 = L28_51(L29_52, L30_53, L31_54)
      L36_59 = A1_24
      L35_58 = A1_24.setListProperty
      L37_60 = A2_25
      L35_58(L36_59, L37_60, L38_61, L39_62, L40_63)
      L36_59 = A1_24
      L35_58 = A1_24.setListProperty
      L37_60 = A2_25
      L35_58(L36_59, L37_60, L38_61, L39_62, L40_63)
      L36_59 = A1_24
      L35_58 = A1_24.setListProperty
      L37_60 = A2_25
      L35_58(L36_59, L37_60, L38_61, L39_62, L40_63)
      L36_59 = A1_24
      L35_58 = A1_24.setListProperty
      L37_60 = A2_25
      L35_58(L36_59, L37_60, L38_61, L39_62, L40_63)
      L36_59 = A1_24
      L35_58 = A1_24.setListProperty
      L37_60 = A2_25
      L35_58(L36_59, L37_60, L38_61, L39_62, L40_63)
      L36_59 = A1_24
      L35_58 = A1_24.setListProperty
      L37_60 = A2_25
      L35_58(L36_59, L37_60, L38_61, L39_62, L40_63)
      L36_59 = A1_24
      L35_58 = A1_24.setListProperty
      L37_60 = A2_25
      L35_58(L36_59, L37_60, L38_61, L39_62, L40_63)
      L36_59 = A0_23
      L35_58 = A0_23.getItemBonus5
      L37_60 = A1_24
      L36_59 = L35_58(L36_59, L37_60, L38_61)
      L37_60 = #L35_58
      L41_64 = A3_26
      L42_65 = "bn5count"
      L43_66 = L37_60
      L38_61(L39_62, L40_63, L41_64, L42_65, L43_66)
      for L41_64 = 1, L37_60 do
        L43_66 = A1_24
        L42_65 = A1_24.setListProperty
        L44_67 = A2_25
        L48_71 = L41_64
        L42_65(L43_66, L44_67, L45_68, L46_69, L47_70)
        L43_66 = A1_24
        L42_65 = A1_24.setListProperty
        L44_67 = A2_25
        L48_71 = L41_64
        L42_65(L43_66, L44_67, L45_68, L46_69, L47_70)
      end
      L41_64 = L38_61(L39_62)
      if L38_61 ~= 0 and L39_62 ~= 0 then
        L42_65 = L38_61
        if L42_65 == 16007 then
        elseif L42_65 == 16008 then
        elseif L42_65 == 16009 then
        else
        end
        if L42_65 == 16010 then
          L44_67 = A1_24
          L43_66 = A1_24.setListProperty
          L48_71 = 1
          L43_66(L44_67, L45_68, L46_69, L47_70, L48_71)
          L44_67 = A1_24
          L43_66 = A1_24.setListProperty
          L48_71 = L38_61
          L43_66(L44_67, L45_68, L46_69, L47_70, L48_71)
          L44_67 = A1_24
          L43_66 = A1_24.setListProperty
          L48_71 = L39_62
          L43_66(L44_67, L45_68, L46_69, L47_70, L48_71)
          L44_67 = A1_24
          L43_66 = A1_24.setListProperty
          L48_71 = L40_63
          L43_66(L44_67, L45_68, L46_69, L47_70, L48_71)
          L44_67 = A1_24
          L43_66 = A1_24.setListProperty
          L48_71 = L41_64
          L43_66(L44_67, L45_68, L46_69, L47_70, L48_71)
          break
        else
        end
        L44_67 = A1_24
        L43_66 = A1_24.setListProperty
        L48_71 = 0
        L43_66(L44_67, L45_68, L46_69, L47_70, L48_71)
        break
      else
        L43_66 = A1_24
        L42_65 = A1_24.setListProperty
        L44_67 = A2_25
        L42_65(L43_66, L44_67, L45_68, L46_69, L47_70)
      end
      L43_66 = A4_27
      L42_65 = A4_27.getNormalItemMateriaType
      L42_65 = L42_65(L43_66)
      L44_67 = A4_27
      L43_66 = A4_27.getNormalItemMateriaGrade
      L43_66 = L43_66(L44_67)
      L44_67 = A0_23.getAttachedMateriaCount
      L44_67 = L44_67(L45_68, L46_69)
      L37_60 = L44_67
      L44_67 = 0
      for L48_71 = 1, L37_60 do
        L50_73 = A1_24
        L49_72 = A1_24.setListProperty
        L54_77 = tostring
        L54_77 = L54_77(L48_71)
        L54_77 = L42_65[L48_71]
        L49_72(L50_73, L51_74, L52_75, L53_76, L54_77)
        L50_73 = A1_24
        L49_72 = A1_24.setListProperty
        L54_77 = tostring
        L54_77 = L54_77(L48_71)
        L54_77 = L43_66[L48_71]
        L49_72(L50_73, L51_74, L52_75, L53_76, L54_77)
      end
      if L45_68 then
        L48_71 = A3_26
        L49_72 = "weapon"
        L50_73 = 1
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      else
        L48_71 = A3_26
        L49_72 = "weapon"
        L50_73 = 0
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      end
      if L45_68 then
        L48_71 = A3_26
        L49_72 = "armor"
        L50_73 = 1
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      else
        L48_71 = A3_26
        L49_72 = "armor"
        L50_73 = 0
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      end
      if L45_68 then
        L48_71 = A3_26
        L49_72 = "accessory"
        L50_73 = 1
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      else
        L48_71 = A3_26
        L49_72 = "accessory"
        L50_73 = 0
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      end
      L48_71 = L47_70
      L54_77 = L47_70(L48_71)
      if L45_68 then
        L48_71 = A3_26
        L49_72 = "canEquip"
        L50_73 = 1
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      else
        L48_71 = A3_26
        L49_72 = "canEquip"
        L50_73 = 0
        L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      end
      L41_64 = 0
      if L45_68 == true then
        L41_64 = 1
      end
      L48_71 = A3_26
      L49_72 = "bait"
      L50_73 = L41_64
      L45_68(L46_69, L47_70, L48_71, L49_72, L50_73)
      L48_71 = A1_24
      L49_72 = A2_25
      L50_73 = A3_26
      L47_70(L48_71, L49_72, L50_73, L51_74, L52_75)
      L48_71 = A1_24
      L49_72 = A2_25
      L50_73 = A3_26
      L47_70(L48_71, L49_72, L50_73, L51_74, L52_75)
      L48_71 = 0
      L49_72 = 0
      L50_73 = 0
      if L51_74 then
        for L54_77 = 1, 27 do
          if A4_27:isFitForEquipPoint(L54_77) == true then
            if L47_70 == 0 then
            elseif L48_71 == 0 then
              L48_71 = L54_77
            elseif L49_72 == 0 then
              L49_72 = L54_77
            elseif L50_73 == 0 then
              L50_73 = L54_77
            end
          end
        end
      end
      L54_77 = A3_26
      L51_74(L52_75, L53_76, L54_77, "firstSlot", L47_70)
      L54_77 = A3_26
      L51_74(L52_75, L53_76, L54_77, "secondSlot", L48_71)
      L54_77 = A3_26
      L51_74(L52_75, L53_76, L54_77, "thirdSlot", L49_72)
      L54_77 = A3_26
      L51_74(L52_75, L53_76, L54_77, "fourthSlot", L50_73)
      L54_77 = worldMaster
      L54_77 = L54_77._getMyPlayer
      L54_77 = L54_77(L54_77)
      L54_77 = A2_25
      L52_75(L53_76, L54_77, A3_26, "degradeRate", L51_74)
    end
  else
    L11_34 = A1_24
    L10_33 = A1_24.setListProperty
    L12_35 = A2_25
    L13_36 = A3_26
    L14_37 = "isEquipping"
    L15_38 = 0
    L10_33(L11_34, L12_35, L13_36, L14_37, L15_38)
  end
end
L0_0.setItemDetailToXml = L1_1
L0_0 = DesktopWidget
function L1_1(A0_78, A1_79, A2_80, A3_81, A4_82, A5_83)
  local L6_84, L7_85, L8_86, L9_87, L10_88
  L7_85 = A1_79
  L6_84 = A1_79.setListProperty
  L8_86 = A2_80
  L9_87 = A3_81
  L10_88 = "sorttype"
  L6_84(L7_85, L8_86, L9_87, L10_88, A0_78:getSortString(A4_82, A5_83, A3_81))
end
L0_0.setSortType = L1_1
L0_0 = DesktopWidget
function L1_1(A0_89, A1_90)
  local L2_91
  L2_91 = A1_90 == 1000001
  return L2_91
end
L0_0.isGil = L1_1
L0_0 = DesktopWidget
function L1_1(A0_92, A1_93)
  local L2_94
  L2_94 = A1_93 >= 1000002 and A1_93 <= 1000020
  return L2_94
end
L0_0.isCrystal = L1_1
L0_0 = DesktopWidget
function L1_1(A0_95, A1_96)
  local L2_97
  L2_97 = A1_96 >= 1000101 and A1_96 <= 1000124
  return L2_97
end
L0_0.isGuildPoint = L1_1
L0_0 = DesktopWidget
function L1_1(A0_98, A1_99)
  local L2_100
  L2_100 = A1_99 >= 1000201 and A1_99 <= 1000203
  return L2_100
end
L0_0.isCampanyPoint = L1_1
L0_0 = DesktopWidget
function L1_1(A0_101, A1_102)
  return A0_101:isCampanyPoint(A1_102)
end
L0_0.isCollapsedInMoney = L1_1
L0_0 = DesktopWidget
function L1_1(A0_103, A1_104, A2_105, A3_106, A4_107)
  local L5_108
  L5_108 = false
  if A4_107 ~= nil then
    L5_108 = A4_107:isWeapon()
  elseif A1_104:getListProperty(A2_105, A3_106, "weapon") == 1 then
    L5_108 = true
  end
  return L5_108
end
L0_0.isWeapon = L1_1
L0_0 = DesktopWidget
function L1_1(A0_109, A1_110, A2_111, A3_112, A4_113)
  local L5_114
  L5_114 = false
  if A4_113 ~= nil then
    L5_114 = A4_113:isArmor()
  elseif A1_110:getListProperty(A2_111, A3_112, "armor") == 1 then
    L5_114 = true
  end
  return L5_114
end
L0_0.isArmor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_115, A1_116, A2_117, A3_118, A4_119)
  local L5_120
  L5_120 = false
  if A4_119 ~= nil then
    L5_120 = A4_119:isAccessory()
  elseif A1_116:getListProperty(A2_117, A3_118, "accessory") == 1 then
    L5_120 = true
  end
  return L5_120
end
L0_0.isAccessory = L1_1
L0_0 = DesktopWidget
function L1_1(A0_121, A1_122, A2_123, A3_124, A4_125)
  local L5_126, L6_127
  L5_126 = false
  L6_127 = 0
  if A4_125 ~= nil then
    L6_127 = A4_125:_getCatalogID()
  else
    L6_127 = A1_122:getListProperty(A2_123, A3_124, "catalog")
  end
  if L6_127 > 8032400 and L6_127 < 8032500 or L6_127 > 8040000 and L6_127 < 8050000 or L6_127 > 8051300 and L6_127 < 8051400 or L6_127 > 8060000 and L6_127 < 8070000 then
    L5_126 = true
  end
  return L5_126
end
L0_0.isWearUnder = L1_1
L0_0 = DesktopWidget
function L1_1(A0_128, A1_129, A2_130, A3_131, A4_132)
  local L5_133
  L5_133 = false
  if A4_132 ~= nil then
    L5_133 = A4_132:isFishingBaitWeapon()
  elseif A1_129:getListProperty(A2_130, A3_131, "bait") == 1 then
    L5_133 = true
  end
  return L5_133
end
L0_0.isFishingBaitWeapon = L1_1
L0_0 = DesktopWidget
function L1_1(A0_134, A1_135, A2_136, A3_137, A4_138)
  local L5_139
  L5_139 = false
  if A4_138 ~= nil then
    L5_139 = A4_138:canEquipSimple(worldMaster:_getMyPlayer())
  elseif A1_135:getListProperty(A2_136, A3_137, "canEquip") == 1 then
    L5_139 = true
  end
  return L5_139
end
L0_0.canEquipSimple = L1_1
L0_0 = DesktopWidget
function L1_1(A0_140, A1_141, A2_142, A3_143, A4_144)
  local L5_145
  L5_145 = false
  if A4_144 ~= nil then
    L5_145 = A0_140:cantEquipPlayer(A4_144)
  elseif A1_141:getListProperty(A2_142, A3_143, "equipx") == "Visible" then
    L5_145 = true
  end
  return L5_145
end
L0_0.cantEquipBadge = L1_1
L0_0 = DesktopWidget
function L1_1(A0_146, A1_147)
  local L2_148, L3_149, L4_150, L5_151
  L2_148 = A1_147
  L3_149 = 0
  if A1_147 > 1000000 then
    L2_148 = L2_148 - 1000000
    L3_149 = 1
  elseif A1_147 > 20000 and A1_147 <= 20057 then
    L3_149 = 2
  end
  L4_150 = L2_148
  L5_151 = L3_149
  return L4_150, L5_151
end
L0_0.getParameterUnit = L1_1
L0_0 = DesktopWidget
function L1_1(A0_152, A1_153, A2_154, A3_155)
  local L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162
  L5_157 = A1_153
  if L5_157 == 0 then
    L6_158 = _string
    L6_158 = L6_158.format
    L7_159 = "A%03d"
    L8_160 = A3_155
    L6_158 = L6_158(L7_159, L8_160)
    L4_156 = L6_158
    break
  else
  end
  if L5_157 == 1 then
    L7_159 = A2_154
    L6_158 = A2_154._getCatalogID
    L6_158 = L6_158(L7_159)
    L8_160 = A2_154
    L7_159 = A2_154._getNameIndex
    L7_159 = L7_159(L8_160)
    L9_161 = A2_154
    L8_160 = A2_154.isEquipment
    L8_160 = L8_160(L9_161)
    if not L8_160 then
      L9_161 = A2_154
      L8_160 = A2_154.isFishingBaitWeapon
      L8_160 = L8_160(L9_161)
    else
      if L8_160 then
        L9_161 = A2_154
        L8_160 = A2_154.isBattleWeapon
        L8_160 = L8_160(L9_161)
        if L8_160 then
          L9_161 = A2_154
          L8_160 = A2_154.isShieldWeapon
          L8_160 = L8_160(L9_161)
          if not L8_160 then
            L9_161 = A2_154
            L8_160 = A2_154.isAmmoWeapon
            L8_160 = L8_160(L9_161)
            if not L8_160 then
              L8_160 = _string
              L8_160 = L8_160.format
              L9_161 = "AA%09d%d%03d"
              L10_162 = L6_158
              L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
              L4_156 = L8_160
            end
          end
        else
          L9_161 = A2_154
          L8_160 = A2_154.isAmmoWeapon
          L8_160 = L8_160(L9_161)
          if L8_160 then
            L8_160 = _string
            L8_160 = L8_160.format
            L9_161 = "AB%09d%d%03d"
            L10_162 = L6_158
            L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
            L4_156 = L8_160
          else
            L9_161 = A2_154
            L8_160 = A2_154.isCraftWeapon
            L8_160 = L8_160(L9_161)
            if L8_160 then
              L8_160 = _string
              L8_160 = L8_160.format
              L9_161 = "AC%09d%d%03d"
              L10_162 = L6_158
              L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
              L4_156 = L8_160
            else
              L9_161 = A2_154
              L8_160 = A2_154.isHarvestWeapon
              L8_160 = L8_160(L9_161)
              if L8_160 then
                L8_160 = _string
                L8_160 = L8_160.format
                L9_161 = "AD%09d%d%03d"
                L10_162 = L6_158
                L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                L4_156 = L8_160
              else
                L9_161 = A2_154
                L8_160 = A2_154.isFishingBaitWeapon
                L8_160 = L8_160(L9_161)
                if L8_160 then
                  L8_160 = _string
                  L8_160 = L8_160.format
                  L9_161 = "AE%09d%d%03d"
                  L10_162 = L6_158
                  L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                  L4_156 = L8_160
                else
                  L9_161 = A2_154
                  L8_160 = A2_154.isArmor
                  L8_160 = L8_160(L9_161)
                  if not L8_160 then
                    L9_161 = A2_154
                    L8_160 = A2_154.isShieldWeapon
                    L8_160 = L8_160(L9_161)
                  else
                    if L8_160 then
                      L8_160 = _string
                      L8_160 = L8_160.format
                      L9_161 = "AF%09d%d%03d"
                      L10_162 = L6_158
                      L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                      L4_156 = L8_160
                  end
                  else
                    L9_161 = A2_154
                    L8_160 = A2_154.isAccessory
                    L8_160 = L8_160(L9_161)
                    if L8_160 then
                      L8_160 = _string
                      L8_160 = L8_160.format
                      L9_161 = "AG%09d%d%03d"
                      L10_162 = L6_158
                      L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                      L4_156 = L8_160
                    else
                      L8_160 = _string
                      L8_160 = L8_160.format
                      L9_161 = "AH%09d%d%03d"
                      L10_162 = L6_158
                      L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                      L4_156 = L8_160
                    end
                  end
                end
              end
            end
          end
        end
    end
    else
      L9_161 = A2_154
      L8_160 = A2_154.isPotion
      L8_160 = L8_160(L9_161)
      if L8_160 then
        if L6_158 == 3020410 or L6_158 >= 3020504 and L6_158 <= 3020510 or L6_158 >= 3020601 and L6_158 < 3910001 then
          L8_160 = _string
          L8_160 = L8_160.format
          L9_161 = "D%010d%d%03d"
          L10_162 = L6_158
          L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
          L4_156 = L8_160
        else
          L8_160 = _string
          L8_160 = L8_160.format
          L9_161 = "BA%09d%d%03d"
          L10_162 = L6_158
          L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
          L4_156 = L8_160
        end
      else
        L9_161 = A2_154
        L8_160 = A2_154.isFood
        L8_160 = L8_160(L9_161)
        if not L8_160 then
          L9_161 = A2_154
          L8_160 = A2_154.isDrink
          L8_160 = L8_160(L9_161)
        else
          if L8_160 then
            L8_160 = _string
            L8_160 = L8_160.format
            L9_161 = "BB%09d%d%03d"
            L10_162 = L6_158
            L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
            L4_156 = L8_160
        end
        else
          L9_161 = A2_154
          L8_160 = A2_154.isMaterial
          L8_160 = L8_160(L9_161)
          if L8_160 then
            L8_160 = _string
            L8_160 = L8_160.format
            L9_161 = "C%010d%d%03d"
            L10_162 = L6_158
            L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
            L4_156 = L8_160
          else
            L9_161 = A2_154
            L8_160 = A2_154.isEnchantMateria
            L8_160 = L8_160(L9_161)
            if L8_160 then
              L8_160 = _string
              L8_160 = L8_160.format
              L9_161 = "E%010d%d%03d"
              L10_162 = L6_158
              L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
              L4_156 = L8_160
            else
              L8_160 = _string
              L8_160 = L8_160.format
              L9_161 = "D%010d%d%03d"
              L10_162 = L6_158
              L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
              L4_156 = L8_160
              do break end
              else
              end
              if L5_157 == 2 then
                L7_159 = A2_154
                L6_158 = A2_154._getCatalogID
                L6_158 = L6_158(L7_159)
                L8_160 = A2_154
                L7_159 = A2_154._getNameIndex
                L7_159 = L7_159(L8_160)
                L9_161 = A2_154
                L8_160 = A2_154.isEquipment
                L8_160 = L8_160(L9_161)
                if not L8_160 then
                  L9_161 = A2_154
                  L8_160 = A2_154.isFishingBaitWeapon
                  L8_160 = L8_160(L9_161)
                else
                  if L8_160 then
                    L9_161 = A2_154
                    L8_160 = A2_154.isBattleWeapon
                    L8_160 = L8_160(L9_161)
                    if L8_160 then
                      L9_161 = A2_154
                      L8_160 = A2_154.isShieldWeapon
                      L8_160 = L8_160(L9_161)
                      if not L8_160 then
                        L9_161 = A2_154
                        L8_160 = A2_154.isAmmoWeapon
                        L8_160 = L8_160(L9_161)
                        if not L8_160 then
                          L8_160 = _string
                          L8_160 = L8_160.format
                          L9_161 = "EA%09d%d%03d"
                          L10_162 = L6_158
                          L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                          L4_156 = L8_160
                        end
                      end
                    else
                      L9_161 = A2_154
                      L8_160 = A2_154.isAmmoWeapon
                      L8_160 = L8_160(L9_161)
                      if L8_160 then
                        L8_160 = _string
                        L8_160 = L8_160.format
                        L9_161 = "EB%09d%d%03d"
                        L10_162 = L6_158
                        L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                        L4_156 = L8_160
                      else
                        L9_161 = A2_154
                        L8_160 = A2_154.isCraftWeapon
                        L8_160 = L8_160(L9_161)
                        if L8_160 then
                          L8_160 = _string
                          L8_160 = L8_160.format
                          L9_161 = "EC%09d%d%03d"
                          L10_162 = L6_158
                          L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                          L4_156 = L8_160
                        else
                          L9_161 = A2_154
                          L8_160 = A2_154.isHarvestWeapon
                          L8_160 = L8_160(L9_161)
                          if L8_160 then
                            L8_160 = _string
                            L8_160 = L8_160.format
                            L9_161 = "ED%09d%d%03d"
                            L10_162 = L6_158
                            L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                            L4_156 = L8_160
                          else
                            L9_161 = A2_154
                            L8_160 = A2_154.isFishingBaitWeapon
                            L8_160 = L8_160(L9_161)
                            if L8_160 then
                              L8_160 = _string
                              L8_160 = L8_160.format
                              L9_161 = "EE%09d%d%03d"
                              L10_162 = L6_158
                              L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                              L4_156 = L8_160
                            else
                              L9_161 = A2_154
                              L8_160 = A2_154.isArmor
                              L8_160 = L8_160(L9_161)
                              if not L8_160 then
                                L9_161 = A2_154
                                L8_160 = A2_154.isShieldWeapon
                                L8_160 = L8_160(L9_161)
                              else
                                if L8_160 then
                                  L8_160 = _string
                                  L8_160 = L8_160.format
                                  L9_161 = "EF%09d%d%03d"
                                  L10_162 = L6_158
                                  L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                                  L4_156 = L8_160
                              end
                              else
                                L9_161 = A2_154
                                L8_160 = A2_154.isAccessory
                                L8_160 = L8_160(L9_161)
                                if L8_160 then
                                  L8_160 = _string
                                  L8_160 = L8_160.format
                                  L9_161 = "EG%09d%d%03d"
                                  L10_162 = L6_158
                                  L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                                  L4_156 = L8_160
                                else
                                  L8_160 = _string
                                  L8_160 = L8_160.format
                                  L9_161 = "EH%09d%d%03d"
                                  L10_162 = L6_158
                                  L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                                  L4_156 = L8_160
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                end
                else
                  L9_161 = A2_154
                  L8_160 = A2_154.isPotion
                  L8_160 = L8_160(L9_161)
                  if L8_160 then
                    if L6_158 == 3020410 or L6_158 >= 3020504 and L6_158 <= 3020510 or L6_158 >= 3020601 and L6_158 < 3910001 then
                      L8_160 = _string
                      L8_160 = L8_160.format
                      L9_161 = "B%010d%d%03d"
                      L10_162 = L6_158
                      L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                      L4_156 = L8_160
                    else
                      L8_160 = _string
                      L8_160 = L8_160.format
                      L9_161 = "CA%09d%d%03d"
                      L10_162 = L6_158
                      L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                      L4_156 = L8_160
                    end
                  else
                    L9_161 = A2_154
                    L8_160 = A2_154.isFood
                    L8_160 = L8_160(L9_161)
                    if not L8_160 then
                      L9_161 = A2_154
                      L8_160 = A2_154.isDrink
                      L8_160 = L8_160(L9_161)
                    else
                      if L8_160 then
                        L8_160 = _string
                        L8_160 = L8_160.format
                        L9_161 = "CB%09d%d%03d"
                        L10_162 = L6_158
                        L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                        L4_156 = L8_160
                    end
                    else
                      L9_161 = A2_154
                      L8_160 = A2_154.isMaterial
                      L8_160 = L8_160(L9_161)
                      if L8_160 then
                        L8_160 = _string
                        L8_160 = L8_160.format
                        L9_161 = "A%010d%d%03d"
                        L10_162 = L6_158
                        L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                        L4_156 = L8_160
                      else
                        L9_161 = A2_154
                        L8_160 = A2_154.isEnchantMateria
                        L8_160 = L8_160(L9_161)
                        if L8_160 then
                          L8_160 = _string
                          L8_160 = L8_160.format
                          L9_161 = "D%010d%d%03d"
                          L10_162 = L6_158
                          L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                          L4_156 = L8_160
                        else
                          L8_160 = _string
                          L8_160 = L8_160.format
                          L9_161 = "B%010d%d%03d"
                          L10_162 = L6_158
                          L8_160 = L8_160(L9_161, L10_162, L7_159, A3_155)
                          L4_156 = L8_160
                          do break end
                          else
                          end
                          if L5_157 == 3 then
                            L7_159 = A2_154
                            L6_158 = A2_154._getCatalogID
                            L6_158 = L6_158(L7_159)
                            L8_160 = A2_154
                            L7_159 = A2_154._getNameIndex
                            L7_159 = L7_159(L8_160)
                            L9_161 = A2_154
                            L8_160 = A2_154.isEquipment
                            L8_160 = L8_160(L9_161)
                            if not L8_160 then
                              L9_161 = A2_154
                              L8_160 = A2_154.isFishingBaitWeapon
                              L8_160 = L8_160(L9_161)
                            else
                              if L8_160 then
                                L9_161 = A2_154
                                L8_160 = A2_154.getItemLife
                                L8_160 = L8_160(L9_161)
                                L10_162 = A2_154
                                L9_161 = A2_154.getItemLifeMax
                                L9_161 = L9_161(L10_162)
                                L10_162 = 0
                                if L9_161 ~= 0 then
                                  L10_162 = _math.floor(L8_160 / L9_161 * 100000)
                                  L4_156 = _string.format("A%06d%010d%d%03d", L10_162, L6_158, L7_159, A3_155)
                                else
                                  L4_156 = _string.format("B%06d%010d%d%03d", 0, L6_158, L7_159, A3_155)
                                end
                            end
                            else
                              L8_160 = _string
                              L8_160 = L8_160.format
                              L9_161 = "C%06d%010d%d%03d"
                              L10_162 = 0
                              L8_160 = L8_160(L9_161, L10_162, L6_158, L7_159, A3_155)
                              L4_156 = L8_160
                              do break end
                              else
                              end
                              if L5_157 == 4 then
                                L7_159 = A2_154
                                L6_158 = A2_154._getCatalogID
                                L6_158 = L6_158(L7_159)
                                L8_160 = A2_154
                                L7_159 = A2_154._getNameIndex
                                L7_159 = L7_159(L8_160)
                                L9_161 = A2_154
                                L8_160 = A2_154.isEquipment
                                L8_160 = L8_160(L9_161)
                                if not L8_160 then
                                  L9_161 = A2_154
                                  L8_160 = A2_154.isFishingBaitWeapon
                                  L8_160 = L8_160(L9_161)
                                else
                                  if L8_160 then
                                    L9_161 = A2_154
                                    L8_160 = A2_154.canChangeFitness
                                    L8_160 = L8_160(L9_161)
                                    if L8_160 then
                                      L9_161 = A2_154
                                      L8_160 = A2_154.getNormalItemFitness
                                      L8_160 = L8_160(L9_161)
                                      L9_161 = _string
                                      L9_161 = L9_161.format
                                      L10_162 = "A%05d%010d%d%03d"
                                      L9_161 = L9_161(L10_162, 10000 - L8_160, L6_158, L7_159, A3_155)
                                      L4_156 = L9_161
                                    else
                                      L8_160 = _string
                                      L8_160 = L8_160.format
                                      L9_161 = "B%05d%010d%d%03d"
                                      L10_162 = 0
                                      L8_160 = L8_160(L9_161, L10_162, L6_158, L7_159, A3_155)
                                      L4_156 = L8_160
                                    end
                                end
                                else
                                  L8_160 = _string
                                  L8_160 = L8_160.format
                                  L9_161 = "C%05d%010d%d%03d"
                                  L10_162 = 0
                                  L8_160 = L8_160(L9_161, L10_162, L6_158, L7_159, A3_155)
                                  L4_156 = L8_160
                                  do break end
                                  else
                                  end
                                  if L5_157 == 91 then
                                    L7_159 = A2_154
                                    L6_158 = A2_154._getCatalogID
                                    L6_158 = L6_158(L7_159)
                                    L8_160 = A2_154
                                    L7_159 = A2_154._getNameIndex
                                    L7_159 = L7_159(L8_160)
                                    L8_160 = _string
                                    L8_160 = L8_160.format
                                    L9_161 = "A%010d%d"
                                    L10_162 = L6_158
                                    L8_160 = L8_160(L9_161, L10_162, L7_159)
                                    L4_156 = L8_160
                                    break
                                  else
                                  end
                                  if L5_157 == 2 then
                                    L7_159 = A2_154
                                    L6_158 = A2_154.getItemKind
                                    L6_158 = L6_158(L7_159)
                                    L7_159 = _string
                                    L7_159 = L7_159.format
                                    L8_160 = "K%010d"
                                    L9_161 = L6_158
                                    L7_159 = L7_159(L8_160, L9_161)
                                    L4_156 = L7_159
                                    break
                                  else
                                  end
                                  if L5_157 == 11 then
                                    L7_159 = A2_154
                                    L6_158 = A2_154._getCatalogID
                                    L6_158 = L6_158(L7_159)
                                    L7_159 = L6_158
                                    if L7_159 == 1000003 then
                                      L4_156 = "C1a"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000004 then
                                      L4_156 = "C6a"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000005 then
                                      L4_156 = "C5a"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000006 then
                                      L4_156 = "C3a"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000007 then
                                      L4_156 = "C4a"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000008 then
                                      L4_156 = "C2a"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000009 then
                                      L4_156 = "C1b"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000010 then
                                      L4_156 = "C6b"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000011 then
                                      L4_156 = "C5b"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000012 then
                                      L4_156 = "C3b"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000013 then
                                      L4_156 = "C4b"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000014 then
                                      L4_156 = "C2b"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000015 then
                                      L4_156 = "C1c"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000016 then
                                      L4_156 = "C6c"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000017 then
                                      L4_156 = "C5c"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000018 then
                                      L4_156 = "C3c"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000019 then
                                      L4_156 = "C4c"
                                      break
                                    else
                                    end
                                    if L7_159 == 1000020 then
                                      L4_156 = "C2c"
                                      break
                                    else
                                    end
                                    L4_156 = "A0A"
                                    do break end
                                    break
                                  else
                                  end
                                  if L5_157 == 12 then
                                    L7_159 = A0_152
                                    L6_158 = A0_152.getMoneyListIndex
                                    L9_161 = A2_154
                                    L8_160 = A2_154._getCatalogID
                                    L10_162 = L8_160(L9_161)
                                    L6_158 = L6_158(L7_159, L8_160, L9_161, L10_162, L8_160(L9_161))
                                    if L6_158 < 1 then
                                      L4_156 = "G99"
                                    else
                                      L7_159 = string
                                      L8_160 = L7_159
                                      L7_159 = L7_159._format
                                      L9_161 = "G%02d"
                                      L10_162 = L6_158
                                      L7_159 = L7_159(L8_160, L9_161, L10_162)
                                      L4_156 = L7_159
                                      do break end
                                      else
                                      end
                                      if L5_157 == 99 then
                                        L4_156 = ""
                                        break
                                      else
                                      end
                                      L4_156 = ""
                                      break
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
  return L4_156
end
L0_0.getSortString = L1_1
L0_0 = DesktopWidget
function L1_1(A0_163, A1_164)
  local L2_165, L3_166
  L2_165 = -1
  L3_166 = A1_164
  if L3_166 == 1000001 then
    L2_165 = 1
    break
  else
  end
  if L3_166 == 1000102 then
    L2_165 = 2
    break
  else
  end
  if L3_166 == 1000101 then
    L2_165 = 3
    break
  else
  end
  if L3_166 == 1000103 then
    L2_165 = 4
    break
  else
  end
  if L3_166 == 1000107 then
    L2_165 = 5
    break
  else
  end
  if L3_166 == 1000106 then
    L2_165 = 6
    break
  else
  end
  if L3_166 == 1000111 then
    L2_165 = 11
    break
  else
  end
  if L3_166 == 1000110 then
    L2_165 = 12
    break
  else
  end
  if L3_166 == 1000113 then
    L2_165 = 14
    break
  else
  end
  if L3_166 == 1000114 then
    L2_165 = 15
    break
  else
  end
  if L3_166 == 1000115 then
    L2_165 = 16
    break
  else
  end
  if L3_166 == 1000116 then
    L2_165 = 17
    break
  else
  end
  if L3_166 == 1000117 then
    L2_165 = 18
    break
  else
  end
  if L3_166 == 1000118 then
    L2_165 = 19
    break
  else
  end
  if L3_166 == 1000119 then
    L2_165 = 20
    break
  else
  end
  if L3_166 == 1000120 then
    L2_165 = 21
    break
  else
  end
  if L3_166 == 1000121 then
    L2_165 = 22
    break
  else
  end
  if L3_166 == 1000122 then
    L2_165 = 23
    break
  else
  end
  if L3_166 == 1000123 then
    L2_165 = 24
    break
  else
  end
  return L2_165
end
L0_0.getMoneyListIndex = L1_1
L0_0 = DesktopWidget
function L1_1(A0_167, A1_168, A2_169, A3_170, A4_171)
  A1_168:setListProperty(A2_169, A3_170, "itemOwner", A4_171)
end
L0_0.setItemListOwner = L1_1
L0_0 = DesktopWidget
function L1_1(A0_172, A1_173, A2_174, A3_175, A4_176, A5_177)
  A1_173:setListProperty(A2_174, A3_175, "itemPackage", A4_176)
  A1_173:setListProperty(A2_174, A3_175, "itemIndex", A5_177)
end
L0_0.setItemListOwnerParam = L1_1
L0_0 = DesktopWidget
function L1_1(A0_178, A1_179, A2_180, A3_181)
  return A1_179:getListProperty(A2_180, A3_181, "itemOwner")
end
L0_0.getItemOwner = L1_1
L0_0 = DesktopWidget
function L1_1(A0_182, A1_183, A2_184, A3_185, A4_186)
  local L5_187, L6_188
  L6_188 = A1_183
  L5_187 = A1_183.getListProperty
  L5_187 = L5_187(L6_188, A2_184, A3_185, "itemPackage")
  L6_188 = A1_183.getListProperty
  L6_188 = L6_188(A1_183, A2_184, A3_185, "itemIndex")
  return A4_186:_getItem(L5_187, L6_188)
end
L0_0.getPlayerItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_189, A1_190, A2_191, A3_192)
  local L4_193, L5_194
  L5_194 = A1_190
  L4_193 = A1_190.getListProperty
  L4_193 = L4_193(L5_194, A2_191, A3_192, "itemPackage")
  L5_194 = A1_190.getListProperty
  L5_194 = L5_194(A1_190, A2_191, A3_192, "itemIndex")
  return A0_189:getBazaarItem(L4_193, L5_194)
end
L0_0.getBazzerItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_195, A1_196)
  local L2_197, L3_198
  L2_197 = 203
  L3_198 = A1_196
  if L3_198 == 3 then
    L2_197 = 203
    break
  else
  end
  if L3_198 == 2 then
    L2_197 = 206
    break
  else
  end
  if L3_198 == 4 then
    L2_197 = 204
    break
  else
  end
  if L3_198 == 7 then
    L2_197 = 207
    break
  else
  end
  if L3_198 == 8 then
    L2_197 = 205
    break
  else
  end
  if L3_198 == 23 then
    L2_197 = 234
    break
  else
  end
  if L3_198 == 22 then
    L2_197 = 233
    break
  else
  end
  if L3_198 == 39 then
    L2_197 = 217
    break
  else
  end
  if L3_198 == 40 then
    L2_197 = 218
    break
  else
  end
  if L3_198 == 41 then
    L2_197 = 219
    break
  else
  end
  if L3_198 == 29 then
    L2_197 = 212
    break
  else
  end
  if L3_198 == 30 then
    L2_197 = 209
    break
  else
  end
  if L3_198 == 31 then
    L2_197 = 216
    break
  else
  end
  if L3_198 == 32 then
    L2_197 = 213
    break
  else
  end
  if L3_198 == 33 then
    L2_197 = 211
    break
  else
  end
  if L3_198 == 34 then
    L2_197 = 210
    break
  else
  end
  if L3_198 == 35 then
    L2_197 = 215
    break
  else
  end
  if L3_198 == 36 then
    L2_197 = 214
    break
  else
  end
  if L3_198 == 15 then
    L2_197 = 940
    break
  else
  end
  if L3_198 == 16 then
    L2_197 = 939
    break
  else
  end
  if L3_198 == 17 then
    L2_197 = 941
    break
  else
  end
  if L3_198 == 18 then
    L2_197 = 943
    break
  else
  end
  if L3_198 == 19 then
    L2_197 = 942
    break
  else
  end
  if L3_198 == 26 then
    L2_197 = 945
    break
  else
  end
  if L3_198 == 27 then
    L2_197 = 944
    do break end
    break
  else
  end
  return L2_197
end
L0_0.getSkillIcon = L1_1
L0_0 = DesktopWidget
function L1_1(A0_199, A1_200, A2_201, A3_202)
  local L4_203, L5_204, L6_205, L7_206, L8_207, L9_208, L10_209, L11_210, L12_211, L13_212, L14_213, L15_214, L16_215
  L4_203 = 0
  L5_204 = 0
  L6_205 = worldMaster
  L7_206 = L6_205
  L6_205 = L6_205._getMyPlayer
  L6_205 = L6_205(L7_206)
  L8_207 = A3_202
  L7_206 = A3_202.isConformTribe
  L9_208 = L6_205
  L7_206 = L7_206(L8_207, L9_208)
  if not L7_206 then
    L8_207 = 0
    L9_208 = 4
    return L8_207, L9_208
  end
  L9_208 = L6_205
  L8_207 = L6_205.getStateMainSkill
  L8_207 = L8_207(L9_208)
  L9_208 = 0
  if A1_200 ~= L8_207 and A1_200 ~= 0 then
    L11_210 = L6_205
    L10_209 = L6_205.getSkillLevel
    L12_211 = A1_200
    L10_209 = L10_209(L11_210, L12_211)
    L9_208 = L10_209
  else
    L11_210 = L6_205
    L10_209 = L6_205.getStateMainSkillLevel
    L10_209 = L10_209(L11_210)
    L9_208 = L10_209
  end
  L11_210 = A3_202
  L10_209 = A3_202.getItemLevelType
  L10_209 = L10_209(L11_210)
  L10_209 = L10_209 == 1
  L12_211 = A3_202
  L11_210 = A3_202.getItemCompatibility
  L11_210 = L11_210(L12_211, L13_212)
  if L11_210 == 0 then
    L5_204 = 4
  elseif L11_210 == 1 then
    L5_204 = 2
  else
    L5_204 = 3
  end
  L12_211 = A3_202.isWeapon
  L12_211 = L12_211(L13_212)
  if L12_211 then
    if L7_206 then
      L5_204 = 0
    end
    L12_211 = A3_202.isShieldWeapon
    L12_211 = L12_211(L13_212)
    if L12_211 then
      L12_211 = A3_202.getItemCompatibilityBySkill
      L12_211 = L12_211(L13_212, L14_213)
      if L12_211 == 0 then
        L5_204 = 4
      elseif L12_211 == 1 then
        L5_204 = 2
      else
        L5_204 = 3
      end
      L16_215 = L6_205
      L16_215 = A2_201
      L4_203 = L13_212
    else
      if A1_200 == 0 then
        if L11_210 > 0 then
          L5_204 = 2
        end
      elseif A1_200 == L8_207 then
        L5_204 = 2
      else
        L5_204 = 0
      end
      L12_211 = A3_202.isAmmoWeapon
      L12_211 = L12_211(L13_212)
      if not L12_211 then
        L12_211 = A3_202.isFishingBaitWeapon
        L12_211 = L12_211(L13_212)
      elseif L12_211 and L8_207 ~= A1_200 and A1_200 ~= 0 then
        L5_204 = 4
      end
      L12_211 = A3_202.getItemKind
      L12_211 = L12_211(L13_212)
      if L12_211 == 6004 or L12_211 == 6006 or L12_211 == 6008 or L12_211 == 6010 or L12_211 == 6012 or L12_211 == 6014 or L12_211 == 6016 or L12_211 == 6018 or L12_211 == 6104 or L12_211 == 6106 or L12_211 == 6108 then
        if A1_200 ~= L8_207 then
          L5_204 = 4
        end
        L9_208 = L13_212
        L16_215 = A2_201
        L4_203 = L13_212
      else
        L16_215 = L6_205
        L16_215 = A2_201
        L4_203 = L13_212
      end
    end
  elseif A1_200 == 0 then
    L12_211 = A0_199.calcRankColor
    L12_211 = L12_211(L13_212, L14_213, L15_214)
    L4_203 = L12_211
  elseif A1_200 == 10 then
    L12_211 = L6_205.getStateMainSkillLevel
    L12_211 = L12_211(L13_212)
    L9_208 = L12_211
    L12_211 = A3_202.getItemCompatibility
    L12_211 = L12_211(L13_212, L14_213)
    if L12_211 == 0 then
      L12_211 = 0
      return L12_211, L13_212
    end
    L12_211 = A0_199.calcRankColor
    L12_211 = L12_211(L13_212, L14_213, L15_214)
    L4_203 = L12_211
  else
    L12_211 = A0_199.calcRankColor
    L16_215 = A1_200
    L12_211 = L12_211(L13_212, L14_213, L15_214)
    L4_203 = L12_211
  end
  L12_211 = 0
  for L16_215 = 2, 41 do
    L12_211 = L12_211 + L6_205:getSkillLevelCap(L16_215)
  end
  if L9_208 == 0 and L12_211 == 0 then
    L4_203 = 0
  end
  return L13_212, L14_213
end
L0_0.getItemRankColorID = L1_1
L0_0 = DesktopWidget
function L1_1(A0_216, A1_217, A2_218)
  local L3_219, L4_220, L5_221
  L3_219 = 0
  L4_220 = A1_217 + 5
  L5_221 = A1_217 - 5
  if A2_218 > L4_220 then
    L3_219 = 1
  elseif A1_217 < A2_218 then
    L3_219 = 2
  elseif A2_218 >= L5_221 then
    L3_219 = 3
  else
    L3_219 = 4
  end
  return L3_219
end
L0_0.calcRankColor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_222, A1_223)
  local L2_224, L3_225, L4_226, L5_227, L6_228, L7_229, L8_230, L9_231, L10_232
  L3_225 = A1_223
  L2_224 = A1_223.isEquipment
  L2_224 = L2_224(L3_225)
  if L2_224 == false then
    L2_224 = false
    return L2_224
  end
  L2_224 = false
  L3_225 = worldMaster
  L4_226 = L3_225
  L3_225 = L3_225._getMyPlayer
  L3_225 = L3_225(L4_226)
  L4_226 = false
  L5_227 = false
  L7_229 = A1_223
  L6_228 = A1_223.getItemCompatibility
  L8_230 = L3_225
  L6_228 = L6_228(L7_229, L8_230)
  if L6_228 == 0 then
    L4_226 = true
  end
  L7_229 = A1_223
  L6_228 = A1_223.isConformTribe
  L8_230 = L3_225
  L6_228 = L6_228(L7_229, L8_230)
  if not L6_228 then
    L5_227 = true
    L6_228 = true
    return L6_228
  end
  L7_229 = A1_223
  L6_228 = A1_223.isWeapon
  L6_228 = L6_228(L7_229)
  if L6_228 then
    L7_229 = A1_223
    L6_228 = A1_223.getItemMainSkill
    L7_229 = L6_228(L7_229)
    L9_231 = A1_223
    L8_230 = A1_223.getItemLevel
    L8_230 = L8_230(L9_231)
    L10_232 = L3_225
    L9_231 = L3_225.getStateMainSkill
    L9_231 = L9_231(L10_232)
    L10_232 = nil
    if L6_228 == L9_231 then
      L10_232 = L3_225:getStateMainSkillLevel()
    else
      L10_232 = L3_225:getSkillLevel(L6_228)
    end
    if L6_228 == 10 then
      L10_232 = L3_225:getStateMainSkillLevel()
      L2_224 = L4_226
    end
    if (A1_223:getItemKind() == 6004 or A1_223:getItemKind() == 6006 or A1_223:getItemKind() == 6008 or A1_223:getItemKind() == 6010 or A1_223:getItemKind() == 6012 or A1_223:getItemKind() == 6014 or A1_223:getItemKind() == 6016 or A1_223:getItemKind() == 6018 or A1_223:getItemKind() == 6104 or A1_223:getItemKind() == 6106 or A1_223:getItemKind() == 6108) and L9_231 ~= L6_228 then
      return true
    end
    if (A1_223:isAmmoWeapon() or A1_223:isFishingBaitWeapon()) and L6_228 ~= 0 and L9_231 ~= L6_228 then
      return true
    end
    if A1_223:getItemLevelType() == 1 and L8_230 > L10_232 then
      L2_224 = true
    end
    if L10_232 == 0 and L3_225:getSkillLevelCap(L6_228) == 0 then
      L2_224 = false
    end
    return L2_224 or L5_227, L2_224, L4_226, L5_227
  else
    L7_229 = A1_223
    L6_228 = A1_223.getItemMainSkill
    L7_229 = L6_228(L7_229)
    L9_231 = L3_225
    L8_230 = L3_225.getStateMainSkillLevel
    L8_230 = L8_230(L9_231)
    if L6_228 ~= 0 then
      L10_232 = L3_225
      L9_231 = L3_225.getStateMainSkill
      L9_231 = L9_231(L10_232)
      if L6_228 ~= L9_231 then
        L10_232 = L3_225
        L9_231 = L3_225.getSkillLevel
        L9_231 = L9_231(L10_232, L6_228)
        L8_230 = L9_231
      end
    else
    end
    L10_232 = A1_223
    L9_231 = A1_223.getItemLevel
    L9_231 = L9_231(L10_232)
    L10_232 = A1_223.getItemLevelType
    L10_232 = L10_232(A1_223)
    if L10_232 == 1 and L8_230 < L9_231 then
      L2_224 = true
    end
    if L8_230 == 0 then
      L10_232 = L3_225.getSkillLevelCap
      L10_232 = L10_232(L3_225, L6_228)
      if L10_232 == 0 then
        L2_224 = false
      end
    end
  end
  L6_228 = L2_224 or L4_226 or L5_227
  L7_229 = L2_224
  L8_230 = L4_226
  L9_231 = L5_227
  return L6_228, L7_229, L8_230, L9_231
end
L0_0.cantEquipPlayer = L1_1
L0_0 = DesktopWidget
function L1_1(A0_233, A1_234, A2_235, A3_236, A4_237)
  local L5_238, L6_239, L7_240, L8_241, L9_242, L10_243, L11_244, L12_245, L13_246, L14_247, L15_248, L16_249, L17_250, L18_251, L19_252, L20_253
  L5_238 = 0
  L6_239 = 0
  L7_240 = 0
  L8_241 = true
  L9_242 = 1
  L10_243 = "0"
  L11_244 = 1
  L12_245 = 0
  L13_246 = 0
  L14_247 = 0
  L15_248 = false
  L16_249 = ""
  L17_250 = "TBL_null"
  L18_251 = false
  L19_252 = false
  if A2_235 ~= nil then
    L20_253 = A2_235._getCatalogID
    L20_253 = L20_253(A2_235)
    L5_238 = L20_253
    L20_253 = A2_235._getNameIndex
    L20_253 = L20_253(A2_235)
    L6_239 = L20_253
    L20_253 = A2_235.getItemIcon
    L20_253 = L20_253(A2_235)
    L7_240 = L20_253
    L20_253 = A2_235._isStackable
    L20_253 = L20_253(A2_235)
    L8_241 = L20_253
    if L8_241 == true then
      L20_253 = A2_235._countStack
      L20_253 = L20_253(A2_235)
      L9_242 = L20_253
      L20_253 = A2_235._getMaxStack
      L20_253 = L20_253(A2_235)
      L11_244 = L20_253
    else
      L9_242 = 1
      L11_244 = 1
    end
    L20_253 = A2_235.getItemKind
    L20_253 = L20_253(A2_235)
    L12_245 = L20_253
    L20_253 = A2_235.isEquipment
    L20_253 = L20_253(A2_235)
    L15_248 = L20_253
    if L5_238 == 1000001 then
      L20_253 = A1_234.packTextParameter
      L20_253 = L20_253(A1_234, 3263, L9_242)
      L16_249 = L20_253
      L10_243 = ""
    else
      L20_253 = A0_233.isCampanyPoint
      L20_253 = L20_253(A0_233, L5_238)
      if L20_253 then
        L20_253 = A1_234.packTextParameter
        L20_253 = L20_253(A1_234, 3202, L5_238, L6_239)
        L16_249 = L20_253
        L20_253 = A1_234.packTextParameter
        L20_253 = L20_253(A1_234, 225, L9_242)
        L10_243 = L20_253
      else
        L20_253 = A0_233.isCollapsedInMoney
        L20_253 = L20_253(A0_233, L5_238)
        if L20_253 then
        else
          L20_253 = A0_233.isGuildPoint
          L20_253 = L20_253(A0_233, L5_238)
          if L20_253 then
            L20_253 = L5_238 - 1000101
            L20_253 = 3421 + L20_253
            L16_249 = A1_234:packTextParameter(L20_253, L9_242)
            L10_243 = ""
          else
            L20_253 = A1_234.packTextParameter
            L20_253 = L20_253(A1_234, 3202, L5_238, L6_239)
            L16_249 = L20_253
            L20_253 = A1_234.packTextParameter
            L20_253 = L20_253(A1_234, 225, L9_242)
            L10_243 = L20_253
          end
        end
      end
    end
    L17_250 = "TBL_null"
    L20_253 = A2_235.isRareItem
    L20_253 = L20_253(A2_235)
    L18_251 = L20_253
    L20_253 = A2_235.isExclusiveItem
    L20_253 = L20_253(A2_235)
    L19_252 = L20_253
  else
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "catalog")
    L5_238 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "quality")
    L6_239 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "icon")
    L7_240 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "stackable")
    if L20_253 == 0 then
      L8_241 = false
    end
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "stackCount")
    L9_242 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "stackMax")
    L11_244 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "itemKind")
    L12_245 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "isEquipment")
    if L20_253 == 1 then
      L15_248 = true
    end
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "name")
    L16_249 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "stack")
    L10_243 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "nameStyle")
    L17_250 = L20_253
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "rare")
    if L20_253 == 1 then
      L18_251 = true
    end
    L20_253 = A1_234.getListProperty
    L20_253 = L20_253(A1_234, A3_236, A4_237, "ex")
    if L20_253 == 1 then
      L19_252 = true
    end
  end
  L20_253 = L5_238
  return L20_253, L6_239, L7_240, L8_241, L9_242, L10_243, L11_244, L12_245, L13_246, L14_247, L15_248, L16_249, L17_250, L18_251, L19_252
end
L0_0.getItemBase = L1_1
L0_0 = DesktopWidget
function L1_1(A0_254, A1_255, A2_256, A3_257, A4_258)
  local L5_259, L6_260, L7_261, L8_262, L9_263, L10_264, L11_265, L12_266, L13_267
  L5_259 = -1
  L6_260 = false
  L7_261 = false
  L8_262 = "TBL_parameterDanger"
  L9_263 = nil
  L10_264 = 1
  L11_265 = 1
  L12_266 = 0
  if A2_256 ~= nil then
    L13_267 = A2_256.isRepairable
    L13_267 = L13_267(A2_256)
    L9_263 = L13_267
  else
    L13_267 = A1_255.getListProperty
    L13_267 = L13_267(A1_255, A3_257, A4_258, "repairable")
    L9_263 = L13_267
  end
  if L9_263 == true or L9_263 == 1 then
    if A2_256 ~= nil then
      L13_267 = A2_256.getItemLife
      L13_267 = L13_267(A2_256)
      L10_264 = L13_267
      L13_267 = A2_256.getItemLifeMax
      L13_267 = L13_267(A2_256)
      L11_265 = L13_267
    else
      L13_267 = A1_255.getListProperty
      L13_267 = L13_267(A1_255, A3_257, A4_258, "itemlife")
      L10_264 = L13_267
      L13_267 = A1_255.getListProperty
      L13_267 = L13_267(A1_255, A3_257, A4_258, "lifemax")
      L11_265 = L13_267
    end
    L13_267 = _math
    L13_267 = L13_267.floor
    L13_267 = L13_267(L10_264 * 100 / L11_265)
    L5_259 = L13_267
    L13_267 = L10_264 * 100
    L12_266 = L13_267 / L11_265
    if L5_259 > 100 then
      L5_259 = 100
    end
  end
  L13_267 = 0
  if L5_259 < 0 then
    L6_260 = false
    L7_261 = false
    L8_262 = "TBL_null"
  elseif L10_264 == 0 then
    L6_260 = false
    L7_261 = true
    L8_262 = "TBL_parameterDanger"
  elseif L12_266 <= 10 then
    L6_260 = true
    L7_261 = false
    L8_262 = "TBL_parameterCaution"
  elseif L10_264 < L11_265 then
    L6_260 = false
    L7_261 = false
    L8_262 = "TBL_null"
  else
    L6_260 = false
    L7_261 = false
    L8_262 = "TBL_parameterPlus"
  end
  return L5_259, L13_267, L6_260, L7_261, L8_262
end
L0_0.getItemLifeParam = L1_1
L0_0 = DesktopWidget
function L1_1(A0_268, A1_269, A2_270, A3_271, A4_272)
  local L5_273
  L5_273 = 0
  if A2_270 ~= nil then
    if A2_270:isEquipment() then
      L5_273 = A2_270:getItemMainSkill()
    end
  elseif A1_269:getListProperty(A3_271, A4_272, "isEquipment") == 1 then
    L5_273 = A1_269:getListProperty(A3_271, A4_272, "mskill1")
  end
  return L5_273
end
L0_0.getItemMainSkill1 = L1_1
L0_0 = DesktopWidget
function L1_1(A0_274, A1_275, A2_276, A3_277, A4_278)
  local L5_279, L6_280, L7_281, L8_282, L9_283, L10_284, L11_285
  L5_279 = 0
  L6_280 = 0
  L7_281 = 0
  L8_282 = 0
  L9_283 = 0
  L10_284 = 0
  L11_285 = 0
  if A2_276 ~= nil then
    if A2_276:isEquipment() then
      L5_279, L6_280 = A2_276:getItemMainSkill()
      L7_281 = A2_276:getItemCompatibilityKey()
      L8_282 = A2_276:getItemLevel()
      L9_283 = A2_276:getItemLevelType()
      L10_284, L11_285 = A0_274:getItemRankColorID(L5_279, L8_282, A2_276)
    end
  elseif A1_275:getListProperty(A3_277, A4_278, "isEquipment") == 1 then
    L5_279 = A1_275:getListProperty(A3_277, A4_278, "mskill1")
    L6_280 = A1_275:getListProperty(A3_277, A4_278, "mskill2")
    L7_281 = A1_275:getListProperty(A3_277, A4_278, "compati")
    L8_282 = A1_275:getListProperty(A3_277, A4_278, "eqrank")
    L9_283 = A1_275:getListProperty(A3_277, A4_278, "eqrankType")
    L10_284 = A1_275:getListProperty(A3_277, A4_278, "rankcolor")
    L11_285 = A1_275:getListProperty(A3_277, A4_278, "conditionColor")
  end
  return L5_279, L6_280, L7_281, L8_282, L9_283, L10_284, L11_285
end
L0_0.getItemEquipCondition = L1_1
L0_0 = DesktopWidget
function L1_1(A0_286, A1_287, A2_288, A3_289, A4_290)
  local L5_291
  L5_291 = 0
  if A2_288 ~= nil then
    L5_291 = A2_288:getItemLevel()
  else
    L5_291 = A1_287:getListProperty(A3_289, A4_290, "eqrank")
  end
  return L5_291
end
L0_0.getItemRank = L1_1
L0_0 = DesktopWidget
function L1_1(A0_292, A1_293, A2_294, A3_295, A4_296)
  local L5_297, L6_298, L7_299, L8_300, L9_301, L10_302, L11_303, L12_304, L13_305
  L5_297 = 0
  L6_298 = 0
  L7_299 = 0
  L8_300 = 0
  L9_301 = 0
  L10_302 = 0
  L11_303 = 0
  L12_304 = 0
  L13_305 = 0
  if A2_294 ~= nil then
    if A2_294:isBattleWeapon() then
      if A2_294:isShieldWeapon() then
        L5_297 = 15041
        L6_298 = A2_294:getShieldRate()
        L7_299 = 72041
        L8_300 = 15042
        L9_301 = A2_294:getShieldDefence()
        L10_302 = 72042
      elseif A2_294:isAmmoWeapon() then
        L5_297 = 15059
        L6_298 = A2_294:getWeaponDamagePower()
        L7_299 = 72059
      else
        L5_297 = 15059
        L6_298 = A2_294:getWeaponDamagePower()
        L7_299 = 72059
        L8_300 = 15060
        L9_301 = _math.floor(A2_294:getWeaponInterval() * 10) / 10
        L10_302 = 72060
        L11_303 = 10105
        L12_304 = A2_294:getAmmoVirtualDamagePower()
        L13_305 = 73954
      end
    elseif A2_294:isCraftWeapon() then
      L5_297 = 400
      L6_298 = A2_294:getWeaponCraftProcessing()
      L7_299 = 72030
      L8_300 = 410
      L9_301 = A2_294:getWeaponCraftMagicProcessing()
      L10_302 = 72031
      L11_303 = 420
      L12_304 = A2_294:getWeaponCraftProcessControl()
      L13_305 = 72032
    elseif A2_294:isHarvestWeapon() then
      L5_297 = 500
      L6_298 = A2_294:getWeaponHarvestPotency()
      L7_299 = 72033
      L8_300 = 510
      L9_301 = A2_294:getWeaponHarvestLimit()
      L10_302 = 72034
      L11_303 = 520
      L12_304 = A2_294:getWeaponHarvestRate()
      L13_305 = 72035
    elseif A2_294:isArmor() or A2_294:isAccessory() then
      L5_297 = 15019
      L6_298 = A2_294:getArmorDefence()
      L7_299 = 72019
    end
  else
    L5_297 = A1_293:getListProperty(A3_295, A4_296, "bn11")
    L6_298 = A1_293:getListProperty(A3_295, A4_296, "bv11")
    L7_299 = A1_293:getListProperty(A3_295, A4_296, "bh11")
    L8_300 = A1_293:getListProperty(A3_295, A4_296, "bn12")
    L9_301 = A1_293:getListProperty(A3_295, A4_296, "bv12")
    if L8_300 == 15060 then
      L9_301 = L9_301 / 10
    end
    L10_302 = A1_293:getListProperty(A3_295, A4_296, "bh12")
    L11_303 = A1_293:getListProperty(A3_295, A4_296, "bn13")
    L12_304 = A1_293:getListProperty(A3_295, A4_296, "bv13")
    L13_305 = A1_293:getListProperty(A3_295, A4_296, "bh13")
  end
  return L5_297, L6_298, L7_299, L8_300, L9_301, L10_302, L11_303, L12_304, L13_305
end
L0_0.getItemBonus1 = L1_1
L0_0 = DesktopWidget
function L1_1(A0_306, A1_307, A2_308, A3_309, A4_310)
  local L5_311, L6_312, L7_313, L8_314, L9_315, L10_316, L11_317, L12_318, L13_319, L14_320, L15_321, L16_322
  L5_311 = 0
  L6_312 = 0
  L7_313 = 0
  L8_314 = 0
  L9_315 = 0
  L10_316 = 0
  L11_317 = 0
  if A2_308 ~= nil then
    L12_318 = A2_308.isBattleWeapon
    L12_318 = L12_318(L13_319)
    if L12_318 then
      L12_318 = A2_308.getWeaponDamageAttributeNoArray
      L11_317, L12_318 = nil, L12_318(L13_319)
      L11_317, L16_322 = nil, L12_318(L13_319)
      L9_315 = L16_322
      L7_313 = L15_321
      L10_316 = L14_320
      L8_314 = L13_319
      L6_312 = L12_318
    else
      L12_318 = A2_308.isArmor
      L12_318 = L12_318(L13_319)
      if not L12_318 then
        L12_318 = A2_308.isAccessory
        L12_318 = L12_318(L13_319)
      elseif L12_318 then
        L12_318 = 1
        for L16_322 = 1, 13 do
          if A2_308:getArmorDamageCut(L16_322) ~= 0 then
            if L12_318 == 1 then
              L7_313, L6_312 = A2_308:getArmorDamageCut(L16_322), L16_322
            elseif L12_318 == 2 then
              L9_315, L8_314 = A2_308:getArmorDamageCut(L16_322), L16_322
            elseif L12_318 == 3 then
              L11_317, L10_316 = A2_308:getArmorDamageCut(L16_322), L16_322
            end
            L12_318 = L12_318 + 1
            if L12_318 > 3 then
              break
            end
          end
        end
      end
    end
  else
    L12_318 = A1_307.getListProperty
    L16_322 = "bn3t"
    L12_318 = L12_318(L13_319, L14_320, L15_321, L16_322)
    L5_311 = L12_318
    L12_318 = A1_307.getListProperty
    L16_322 = "bn31"
    L12_318 = L12_318(L13_319, L14_320, L15_321, L16_322)
    L6_312 = L12_318
    L12_318 = A1_307.getListProperty
    L16_322 = "bv31"
    L12_318 = L12_318(L13_319, L14_320, L15_321, L16_322)
    L7_313 = L12_318
    L12_318 = A1_307.getListProperty
    L16_322 = "bn32"
    L12_318 = L12_318(L13_319, L14_320, L15_321, L16_322)
    L8_314 = L12_318
    L12_318 = A1_307.getListProperty
    L16_322 = "bv32"
    L12_318 = L12_318(L13_319, L14_320, L15_321, L16_322)
    L9_315 = L12_318
    L12_318 = A1_307.getListProperty
    L16_322 = "bn33"
    L12_318 = L12_318(L13_319, L14_320, L15_321, L16_322)
    L10_316 = L12_318
    L12_318 = A1_307.getListProperty
    L16_322 = "bv33"
    L12_318 = L12_318(L13_319, L14_320, L15_321, L16_322)
    L11_317 = L12_318
  end
  L12_318 = L5_311
  L16_322 = L9_315
  return L12_318, L13_319, L14_320, L15_321, L16_322, L10_316, L11_317
end
L0_0.getItemBonus3 = L1_1
L0_0 = DesktopWidget
function L1_1(A0_323, A1_324, A2_325, A3_326, A4_327, A5_328)
  local L6_329, L7_330, L8_331, L9_332, L10_333, L11_334, L12_335, L13_336, L14_337, L15_338, L16_339
  L6_329 = {}
  L7_330 = {}
  if A2_325 ~= nil then
    L8_331 = {}
    L13_336 = A2_325
    L12_335 = A2_325.processGetEquipmentParameterBonus
    L13_336 = L12_335(L13_336)
    L8_331 = L12_335
    L13_336 = A0_323
    L12_335 = A0_323.getItemBonusMateria
    L14_337 = A1_324
    L15_338 = A2_325
    L13_336 = L12_335(L13_336, L14_337, L15_338, L16_339, A4_327)
    L14_337 = #L12_335
    if L14_337 > 0 then
      L15_338 = 0
      for _FORV_19_ = 1, L14_337 do
        if 0 < A0_323:getMateriaProperty(L12_335[_FORV_19_], L13_336[_FORV_19_]) then
          L11_334[L15_338], L10_333[L15_338], L15_338 = A0_323:getMateriaProperty(L12_335[_FORV_19_], L13_336[_FORV_19_])
          L11_334[L15_338], L10_333[L15_338], L15_338 = A0_323:getMateriaProperty(L12_335[_FORV_19_], L13_336[_FORV_19_])
          if 0 < A0_323:getMateriaProperty(L12_335[_FORV_19_], L13_336[_FORV_19_]) then
            L11_334[L15_338], L10_333[L15_338], L15_338 = A0_323:getMateriaProperty(L12_335[_FORV_19_], L13_336[_FORV_19_])
            L11_334[L15_338], L10_333[L15_338], L15_338 = A0_323:getMateriaProperty(L12_335[_FORV_19_], L13_336[_FORV_19_])
          end
        end
      end
    end
    L15_338 = #L8_331
    for _FORV_21_ = 1, L15_338 do
      L6_329[1] = L8_331[_FORV_21_]
      L7_330[1] = L9_332[_FORV_21_]
      for _FORV_25_ = 1, L16_339 do
        if L6_329[1] == L10_333[_FORV_25_] then
          L7_330[1] = L7_330[1] + L11_334[_FORV_25_]
          L10_333[_FORV_25_] = 0
        end
      end
    end
    for _FORV_21_ = 1, L16_339 do
      if L10_333[_FORV_21_] ~= 0 then
        L6_329[1 + 1] = L10_333[_FORV_21_]
        L7_330[1 + 1] = L11_334[_FORV_21_]
        for _FORV_25_ = _FORV_21_ + 1, L16_339 do
          if L6_329[1 + 1] == L10_333[_FORV_25_] then
            L7_330[1 + 1] = L7_330[1 + 1] + L11_334[_FORV_25_]
            L10_333[_FORV_25_] = 0
          end
        end
      end
    end
  else
    L8_331 = A1_324.getListProperty
    L12_335 = "bn5count"
    L8_331 = L8_331(L9_332, L10_333, L11_334, L12_335)
    for L12_335 = 1, L8_331 do
      L14_337 = A1_324
      L13_336 = A1_324.getListProperty
      L15_338 = A3_326
      L13_336 = L13_336(L14_337, L15_338, L16_339, "bn5p" .. tostring(L12_335))
      L6_329[L12_335] = L13_336
      L14_337 = A1_324
      L13_336 = A1_324.getListProperty
      L15_338 = A3_326
      L13_336 = L13_336(L14_337, L15_338, L16_339, "bn5v" .. tostring(L12_335))
      L7_330[L12_335] = L13_336
    end
  end
  L8_331 = L6_329
  return L8_331, L9_332
end
L0_0.getItemBonus5 = L1_1
L0_0 = DesktopWidget
function L1_1(A0_340, A1_341, A2_342, A3_343, A4_344)
  local L5_345, L6_346, L7_347, L8_348, L9_349, L10_350
  L5_345 = {
    L6_346,
    L7_347,
    L8_348,
    L9_349,
    L10_350
  }
  L6_346 = 0
  L10_350 = 0
  L6_346 = {
    L7_347,
    L8_348,
    L9_349,
    L10_350,
    0
  }
  L10_350 = 0
  if A2_342 ~= nil then
    L5_345 = L7_347
    L6_346 = L7_347
  else
    for L10_350 = 1, 5 do
      L5_345[L10_350] = A1_341:getListProperty(A3_343, A4_344, "mtype" .. tostring(L10_350))
      L6_346[L10_350] = A1_341:getListProperty(A3_343, A4_344, "mgrade" .. tostring(L10_350))
    end
  end
  return L7_347, L8_348
end
L0_0.getItemBonusMateria = L1_1
L0_0 = DesktopWidget
function L1_1(A0_351, A1_352, A2_353, A3_354)
  local L4_355, L5_356, L6_357, L7_358, L8_359
  L4_355 = ""
  L5_356 = ""
  L6_357 = 0
  L7_358 = 0
  L8_359 = A0_351.getParameterUnit
  L7_358, L8_359 = A0_351, L8_359(A0_351, A2_353)
  L6_357 = L8_359
  L8_359 = L7_358
  if L8_359 == 0 then
    L4_355 = A1_352:packTextParameter(3554, L6_357)
    break
  else
  end
  if L8_359 == 1 then
    L4_355 = A1_352:packTextParameter(3554, L6_357)
    break
  else
  end
  if L8_359 == 2 then
    L4_355 = A1_352:packTextParameter(3188, L6_357)
    break
  else
  end
  L8_359 = 2
  if A3_354 < 0 then
    L8_359 = 3
    A3_354 = A3_354 * -1
  end
  L5_356 = A1_352:packTextParameter(3548, A3_354, 0, " ", L7_358, L8_359)
  return L4_355, L5_356
end
L0_0.getItemParamString = L1_1
L0_0 = DesktopWidget
function L1_1(A0_360, A1_361, A2_362, A3_363, A4_364)
  local L5_365
  L5_365 = -1
  if A2_362 then
    if A2_362:isBattleWeapon() == true and A2_362:isShieldWeapon() == false then
      L5_365 = A2_362:getWeaponFrequency()
    end
  else
    L5_365 = A1_361:getListProperty(A3_363, A4_364, "atkn")
  end
  return L5_365
end
L0_0.getWeaponFrequency = L1_1
L0_0 = DesktopWidget
function L1_1(A0_366, A1_367, A2_368, A3_369, A4_370)
  local L5_371
  L5_371 = -1
  if A2_368 then
    if A2_368:isBattleWeapon() == true and A2_368:isShieldWeapon() == false then
      L5_371 = A2_368:getWeaponInterval()
    end
  else
    L5_371 = tonumber(A1_367:getListProperty(A3_369, A4_370, "wpiv"))
  end
  return L5_371
end
L0_0.getWeaponInterval = L1_1
L0_0 = DesktopWidget
function L1_1(A0_372, A1_373, A2_374, A3_375, A4_376)
  local L5_377
  L5_377 = false
  if A2_374 ~= nil then
    L5_377 = A2_374:getMaterializePermission()
  elseif A1_373:getListProperty(A3_375, A4_376, "mperm") == 1 then
    L5_377 = true
  end
  return L5_377
end
L0_0.getItemMaterializePermission = L1_1
L0_0 = DesktopWidget
function L1_1(A0_378, A1_379, A2_380, A3_381, A4_382)
  local L5_383
  L5_383 = false
  if A2_380 ~= nil then
    L5_383 = A2_380:getMateriaBindPermission()
  elseif A1_379:getListProperty(A3_381, A4_382, "mbperm") == 1 then
    L5_383 = true
  end
  return L5_383
end
L0_0.getItemMateriaBindPermission = L1_1
L0_0 = DesktopWidget
function L1_1(A0_384, A1_385, A2_386)
  local L3_387
  L3_387 = 0
  if A1_385 then
    if A2_386 then
      L3_387 = 3565
    else
      L3_387 = 3232
    end
  elseif A2_386 then
    L3_387 = 3564
  end
  return L3_387
end
L0_0.getSkillHeaderTextUI = L1_1
L0_0 = DesktopWidget
function L1_1(A0_388, A1_389, A2_390, A3_391, A4_392)
  local L5_393
  L5_393 = false
  if A2_390 ~= nil then
    L5_393 = A2_390:_isEquipping()
  elseif A1_389:getListProperty(A3_391, A4_392, "isEquipping") == 1 then
    L5_393 = true
  end
  return L5_393
end
L0_0.isEquipping = L1_1
L0_0 = DesktopWidget
function L1_1(A0_394, A1_395, A2_396, A3_397, A4_398)
  local L5_399
  L5_399 = false
  if A2_396 ~= nil then
    L5_399 = A2_396:isEnchantMateria()
  elseif A1_395:getListProperty(A3_397, A4_398, "materia") == 1 then
    L5_399 = true
  end
  return L5_399
end
L0_0.isEnchantMateria = L1_1
L0_0 = DesktopWidget
function L1_1(A0_400, A1_401, A2_402, A3_403, A4_404)
  local L5_405
  L5_405 = false
  if A2_402 ~= nil then
    L5_405 = A2_402:isMateriaAttached()
  elseif A1_401:getListProperty(A3_403, A4_404, "attached") == 1 then
    L5_405 = true
  end
  return L5_405
end
L0_0.isMateriaAttached = L1_1
L0_0 = DesktopWidget
function L1_1(A0_406, A1_407, A2_408, A3_409, A4_410)
  local L5_411
  L5_411 = 0
  if A2_408 ~= nil then
    L5_411 = A2_408:getMateriaType()
  else
    L5_411 = A1_407:getListProperty(A3_409, A4_410, "mkey")
  end
  return L5_411
end
L0_0.getMateriaType = L1_1
L0_0 = DesktopWidget
function L1_1(A0_412, A1_413, A2_414, A3_415, A4_416)
  local L5_417
  L5_417 = 0
  if A2_414 ~= nil then
    L5_417 = A2_414:getNormalItemParam1()
  else
    L5_417 = A1_413:getListProperty(A3_415, A4_416, "mrank")
  end
  return L5_417
end
L0_0.getMateriaRank = L1_1
L0_0 = DesktopWidget
function L1_1(A0_418, A1_419, A2_420, A3_421, A4_422)
  local L5_423
  L5_423 = false
  if A2_420 ~= nil then
    L5_423 = A2_420:canChangeFitness()
  elseif A1_419:getListProperty(A3_421, A4_422, "canChangeFitness") == 1 then
    L5_423 = true
  end
  return L5_423
end
L0_0.canChangeFitness = L1_1
L0_0 = DesktopWidget
function L1_1(A0_424, A1_425, A2_426, A3_427, A4_428)
  local L5_429
  L5_429 = false
  if A2_426 ~= nil then
    L5_429 = _isInstanceOf(A2_426, "NormalItemBaseClass")
  elseif A1_425:getListProperty(A3_427, A4_428, "isNormal") == 1 then
    L5_429 = true
  end
  return L5_429
end
L0_0.isItemNormal = L1_1
L0_0 = DesktopWidget
function L1_1(A0_430, A1_431, A2_432, A3_433, A4_434)
  local L5_435
  L5_435 = 0
  if A2_432 ~= nil then
    L5_435 = A2_432:getNormalItemFitness()
  else
    L5_435 = A1_431:getListProperty(A3_433, A4_434, "fitness")
  end
  return L5_435
end
L0_0.getItemFitness = L1_1
L0_0 = DesktopWidget
function L1_1(A0_436, A1_437, A2_438, A3_439, A4_440)
  local L5_441
  L5_441 = false
  if A2_438 ~= nil then
    L5_441 = A2_438:isRepairable()
  elseif A1_437:getListProperty(A3_439, A4_440, "repairable") == 1 then
    L5_441 = true
  end
  return L5_441
end
L0_0.isRepairable = L1_1
L0_0 = DesktopWidget
function L1_1(A0_442, A1_443, A2_444, A3_445, A4_446)
  local L5_447
  L5_447 = 1
  if A2_444 ~= nil then
    L5_447 = A2_444:getDegradeRate(worldMaster:_getMyPlayer())
  else
    L5_447 = A1_443:getListProperty(A3_445, A4_446, "degradeRate") / 100
  end
  return L5_447
end
L0_0.getDegradeRate = L1_1
L0_0 = DesktopWidget
function L1_1(A0_448, A1_449, A2_450, A3_451, A4_452)
  local L5_453
  L5_453 = 0
  if A2_450 ~= nil then
    L5_453 = A2_450:getItemLife()
  else
    L5_453 = A1_449:getListProperty(A3_451, A4_452, "itemlife")
  end
  return L5_453
end
L0_0.getItemLife = L1_1
L0_0 = DesktopWidget
function L1_1(A0_454, A1_455, A2_456, A3_457, A4_458)
  local L5_459
  L5_459 = 100000
  if A2_456 ~= nil then
    L5_459 = A2_456:getItemLifeMax()
  else
    L5_459 = A1_455:getListProperty(A3_457, A4_458, "lifemax")
  end
  return L5_459
end
L0_0.getItemLifeMax = L1_1
L0_0 = DesktopWidget
function L1_1(A0_460, A1_461, A2_462, A3_463, A4_464)
  local L5_465
  L5_465 = 0
  if A2_462 ~= nil then
    L5_465 = A2_462:getItemRepairItem()
  else
    L5_465 = A1_461:getListProperty(A3_463, A4_464, "repairitem")
  end
  return L5_465
end
L0_0.getItemRepairItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_466, A1_467, A2_468, A3_469, A4_470)
  local L5_471
  L5_471 = 0
  if A2_468 ~= nil then
    L5_471 = A2_468:getItemRepairItemNum()
  else
    L5_471 = A1_467:getListProperty(A3_469, A4_470, "repairinum")
  end
  return L5_471
end
L0_0.getItemRepairItemNum = L1_1
L0_0 = DesktopWidget
function L1_1(A0_472, A1_473, A2_474, A3_475, A4_476)
  local L5_477
  L5_477 = 0
  if A2_474 ~= nil then
    if A2_474:isRepairable() then
      L5_477 = A2_474:getItemRepairSkill()
    end
  else
    L5_477 = A1_473:getListProperty(A3_475, A4_476, "repairskill")
  end
  return L5_477
end
L0_0.getItemRepairSkill = L1_1
L0_0 = DesktopWidget
function L1_1(A0_478, A1_479, A2_480, A3_481, A4_482)
  local L5_483, L6_484, L7_485, L8_486, L9_487, L10_488, L11_489
  L5_483 = false
  L6_484 = 0
  L7_485 = 100000
  L8_486 = 0
  L9_487 = 0
  L10_488 = 0
  L11_489 = 0
  if A2_480 ~= nil then
    L5_483 = A2_480:isRepairable()
    if L5_483 == true then
      L6_484 = A2_480:getItemLife()
      L7_485 = A2_480:getItemLifeMax()
      L8_486 = A2_480:getItemRepairItem()
      L9_487 = A2_480:getItemRepairItemNum()
      L10_488 = A2_480:getItemRepairSkill()
      L11_489 = A2_480:getItemRepairLevel()
    end
  elseif A1_479:getListProperty(A3_481, A4_482, "repairable") == 1 then
    L5_483 = true
    L6_484 = A1_479:getListProperty(A3_481, A4_482, "itemlife")
    L7_485 = A1_479:getListProperty(A3_481, A4_482, "lifemax")
    L8_486 = A1_479:getListProperty(A3_481, A4_482, "repairitem")
    L9_487 = A1_479:getListProperty(A3_481, A4_482, "repairinum")
    L10_488 = A1_479:getListProperty(A3_481, A4_482, "repairskill")
    L11_489 = A1_479:getListProperty(A3_481, A4_482, "repairlevel")
  end
  return L5_483, L6_484, L7_485, L8_486, L9_487, L10_488, L11_489
end
L0_0.getItemRepairData = L1_1
L0_0 = DesktopWidget
function L1_1(A0_490, A1_491, A2_492, A3_493, A4_494)
  local L5_495
  L5_495 = false
  if A2_492 ~= nil then
    if A2_492:isEquipment() == true and A2_492:isFishingBaitWeapon() == false then
      L5_495 = true
    end
  elseif A1_491:getListProperty(A3_493, A4_494, "isEquipment") == 1 and A1_491:getListProperty(A3_493, A4_494, "bait") == 0 then
    L5_495 = true
  end
  return L5_495
end
L0_0.isDetail2Visible = L1_1
L0_0 = DesktopWidget
function L1_1(A0_496, A1_497, A2_498, A3_499, A4_500, A5_501)
  local L6_502, L7_503, L8_504, L9_505
  L6_502 = false
  if A3_499 == "" or A3_499 == 0 then
    L8_504 = A1_497
    L7_503 = A1_497.setVisibility
    L9_505 = A2_498
    L9_505 = L9_505 .. ":" .. "TextBlock_ParameterHeader"
    L7_503(L8_504, L9_505, false)
    L8_504 = A1_497
    L7_503 = A1_497.setVisibility
    L9_505 = A2_498
    L9_505 = L9_505 .. ":" .. "TextBlock_ParameterValue"
    L7_503(L8_504, L9_505, false)
  else
    if A3_499 == 15060 then
      L7_503 = _math
      L7_503 = L7_503.floor
      L8_504 = A4_500
      L7_503 = L7_503(L8_504)
      L8_504 = 0
      if A4_500 == L7_503 then
      else
        L9_505 = A4_500 - L7_503
        L8_504 = L9_505 * 10
      end
      L9_505 = A1_497.setText
      L9_505(A1_497, A2_498 .. ":" .. "TextBlock_ParameterValue", 3548, L7_503, 1, tostring(L8_504), 0, 1)
    elseif A3_499 == 10105 then
      L7_503 = _math
      L7_503 = L7_503.floor
      L8_504 = A4_500
      L7_503 = L7_503(L8_504)
      L8_504 = 0
      if A4_500 == L7_503 then
      else
        L9_505 = _math
        L9_505 = L9_505.floor
        L9_505 = L9_505(A4_500 * 100 - L7_503 * 100)
        L8_504 = L9_505
      end
      L9_505 = " "
      if L8_504 < 10 then
        L9_505 = "0" .. tostring(L8_504)
      else
        L9_505 = tostring(L8_504)
      end
      A1_497:setText(A2_498 .. ":" .. "TextBlock_ParameterValue", 3548, L7_503, 1, L9_505, 0, 1)
    else
      L7_503 = 1
      if A4_500 < 0 then
        L7_503 = 3
        A4_500 = A4_500 * -1
      end
      L9_505 = A1_497
      L8_504 = A1_497.setText
      L8_504(L9_505, A2_498 .. ":" .. "TextBlock_ParameterValue", 3548, A4_500, 0, " ", 0, L7_503)
    end
    L8_504 = A1_497
    L7_503 = A1_497.setText
    L9_505 = A2_498
    L9_505 = L9_505 .. ":" .. "TextBlock_ParameterHeader"
    L7_503(L8_504, L9_505, 3188, A3_499)
    L8_504 = A1_497
    L7_503 = A1_497.setHelpParameter
    L9_505 = A2_498
    L9_505 = L9_505 .. ":" .. "TextBlock_ParameterHeader"
    L7_503(L8_504, L9_505, 1, A5_501)
    L8_504 = A1_497
    L7_503 = A1_497.setVisibility
    L9_505 = A2_498
    L9_505 = L9_505 .. ":" .. "TextBlock_ParameterHeader"
    L7_503(L8_504, L9_505, true)
    L8_504 = A1_497
    L7_503 = A1_497.setVisibility
    L9_505 = A2_498
    L9_505 = L9_505 .. ":" .. "TextBlock_ParameterValue"
    L7_503(L8_504, L9_505, true)
    L6_502 = true
  end
  return L6_502
end
L0_0.setItemBonus1 = L1_1
L0_0 = DesktopWidget
function L1_1(A0_506, A1_507, A2_508, A3_509, A4_510)
  local L5_511
  L5_511 = false
  if A3_509 == -1 or A3_509 == 0 then
    A1_507:setVisibility(A2_508 .. ":" .. "TextBlock_ParameterHeader", false)
    A1_507:setVisibility(A2_508 .. ":" .. "TextBlock_ParameterValue", false)
  else
    A1_507:setText(A2_508 .. ":" .. "TextBlock_ParameterHeader", 3198, A3_509)
    A1_507:setText(A2_508 .. ":" .. "TextBlock_ParameterValue", 3553, A4_510)
    A1_507:setHelpParameter(A2_508 .. ":" .. "TextBlock_ParameterHeader", 1, 74050 + A3_509)
    A1_507:setVisibility(A2_508 .. ":" .. "TextBlock_ParameterHeader", true)
    A1_507:setVisibility(A2_508 .. ":" .. "TextBlock_ParameterValue", true)
    L5_511 = true
  end
  return L5_511
end
L0_0.setItemBonus3 = L1_1
L0_0 = DesktopWidget
function L1_1(A0_512, A1_513, A2_514, A3_515, A4_516, A5_517, A6_518, A7_519, A8_520, A9_521, A10_522, A11_523)
  local L12_524, L13_525, L14_526, L15_527, L16_528, L17_529, L18_530
  L12_524 = true
  L13_525 = "Label_ItemBonus5_"
  L14_526 = tostring
  L15_527 = A2_514
  L14_526 = L14_526(L15_527)
  L13_525 = L13_525 .. L14_526
  L14_526 = 0
  L15_527 = 0
  L16_528 = 0
  L17_529 = 0
  L18_530 = "TBL_null"
  for _FORV_23_ = 1, A4_516 do
    if A5_517[_FORV_23_] == A3_515 then
      L14_526 = A6_518[_FORV_23_]
      L16_528 = _FORV_23_
      break
    end
  end
  for _FORV_23_ = 1, A7_519 do
    if A8_520[_FORV_23_] == A3_515 then
      L15_527 = A9_521[_FORV_23_]
      L17_529 = _FORV_23_
      break
    end
  end
  if L16_528 > 0 and L17_529 > 0 then
  elseif L16_528 > 0 then
    if A10_522 and A0_512:getParameterUnit(A3_515) == 2 then
      L18_530 = "TBL_parameterPlus"
    end
  elseif L17_529 > 0 then
    L12_524 = false
  else
    L12_524 = false
  end
  if L12_524 then
    A0_512:setItemBonus5Data(A1_513, L13_525, A3_515, L14_526, L18_530, A11_523)
    A1_513:setHelpParameter(L13_525 .. ":" .. "TextBlock_ParameterDiff", 0)
    if A10_522 and A0_512:getParameterUnit(A3_515) ~= 2 then
      A0_512:setItemBonusDiff(A1_513, L13_525, A3_515, L14_526, L15_527)
    end
  else
    A1_513:setVisibility(L13_525, false)
    A1_513:setHelpParameter(L13_525, 0)
  end
  return L12_524
end
L0_0.setItemBonus5 = L1_1
L0_0 = DesktopWidget
function L1_1(A0_531, A1_532, A2_533, A3_534, A4_535, A5_536, A6_537)
  local L7_538, L8_539, L9_540
  L8_539 = A0_531
  L7_538 = A0_531.getItemParamString
  L9_540 = A1_532
  L8_539 = L7_538(L8_539, L9_540, A3_534, A4_535)
  L9_540 = A1_532.setText
  L9_540(A1_532, A2_533 .. ":" .. "TextBlock_ParameterHeader", L7_538)
  L9_540 = A1_532.setText
  L9_540(A1_532, A2_533 .. ":" .. "TextBlock_ParameterValue", L8_539)
  L9_540 = A1_532.setVisibility
  L9_540(A1_532, A2_533 .. ":" .. "TextBlock_ParameterDiff", false)
  L9_540 = A1_532.setStyle
  L9_540(A1_532, A2_533 .. ":" .. "TextBlock_ParameterHeader", A5_536)
  L9_540 = A1_532.setStyle
  L9_540(A1_532, A2_533 .. ":" .. "TextBlock_ParameterValue", A5_536)
  L9_540 = 72000
  if A3_534 < 15000 then
    L9_540 = 73000 + A3_534
  elseif A3_534 < 16000 then
    L9_540 = 72000 + (A3_534 - 15000)
  elseif A3_534 < 20000 then
    L9_540 = 72500 + (A3_534 - 16000)
  else
    L9_540 = 72000
  end
  if L9_540 == 72000 then
    A1_532:setHelpParameter(A2_533 .. ":" .. "TextBlock_ParameterHeader", 0)
  elseif A6_537 == false then
    A1_532:setHelpParameter(A2_533 .. ":" .. "TextBlock_ParameterHeader", 1, L9_540)
  else
    A1_532:setHelpParameter(A2_533 .. ":" .. "TextBlock_ParameterHeader", 1, 73927)
  end
  A1_532:setVisibility(A2_533, true)
end
L0_0.setItemBonus5Data = L1_1
L0_0 = DesktopWidget
function L1_1(A0_541, A1_542, A2_543, A3_544, A4_545, A5_546)
  local L6_547, L7_548, L8_549, L9_550, L10_551, L11_552, L12_553, L13_554, L14_555, L15_556, L16_557
  L7_548 = A1_542
  L6_547 = A1_542.setVisibility
  L8_549 = A2_543
  L9_550 = ":"
  L10_551 = "TextBlock_ParameterDiff"
  L8_549 = L8_549 .. L9_550 .. L10_551
  L9_550 = false
  L6_547(L7_548, L8_549, L9_550)
  L7_548 = A1_542
  L6_547 = A1_542.setHelpParameter
  L8_549 = A2_543
  L9_550 = ":"
  L10_551 = "TextBlock_ParameterDiff"
  L8_549 = L8_549 .. L9_550 .. L10_551
  L9_550 = 0
  L6_547(L7_548, L8_549, L9_550)
  L6_547 = A4_545 - A5_546
  L7_548 = " "
  L8_549 = "TBL_null"
  L9_550 = A3_544 == 15060
  L10_551 = A3_544 == 10105
  if L9_550 then
    L11_552 = _math
    L11_552 = L11_552.floor
    L12_553 = _math
    L12_553 = L12_553.abs
    L13_554 = L6_547
    L16_557 = L12_553(L13_554)
    L11_552 = L11_552(L12_553, L13_554, L14_555, L15_556, L16_557, L12_553(L13_554))
    L12_553 = 0
    L13_554 = _math
    L13_554 = L13_554.abs
    L14_555 = L6_547
    L13_554 = L13_554(L14_555)
    if L11_552 == L13_554 then
    else
      L13_554 = _math
      L13_554 = L13_554.abs
      L14_555 = L6_547
      L13_554 = L13_554(L14_555)
      L13_554 = L13_554 - L11_552
      L12_553 = L13_554 * 10
    end
    L13_554 = 2
    if L6_547 < 0 then
      L13_554 = 3
    end
    L15_556 = A1_542
    L14_555 = A1_542.packTextParameter
    L16_557 = 3549
    L14_555 = L14_555(L15_556, L16_557, L11_552, 1, tostring(L12_553), 0, L13_554)
    L7_548 = L14_555
  elseif L10_551 then
    L11_552 = _math
    L11_552 = L11_552.floor
    L12_553 = A4_545 * 100
    L11_552 = L11_552(L12_553)
    L12_553 = _math
    L12_553 = L12_553.floor
    L13_554 = A5_546 * 100
    L12_553 = L12_553(L13_554)
    L13_554 = L11_552 - L12_553
    L6_547 = L13_554 / 100
    L13_554 = _math
    L13_554 = L13_554.floor
    L14_555 = _math
    L14_555 = L14_555.abs
    L15_556 = L6_547
    L16_557 = L14_555(L15_556)
    L13_554 = L13_554(L14_555, L15_556, L16_557, L14_555(L15_556))
    L14_555 = 0
    L15_556 = _math
    L15_556 = L15_556.abs
    L16_557 = L6_547
    L15_556 = L15_556(L16_557)
    if L13_554 == L15_556 then
    else
      L15_556 = _math
      L15_556 = L15_556.floor
      L16_557 = _math
      L16_557 = L16_557.abs
      L16_557 = L16_557(L11_552 - L12_553)
      L15_556 = L15_556(L16_557, L16_557(L11_552 - L12_553))
      L16_557 = L13_554 * 100
      L14_555 = L15_556 - L16_557
    end
    L15_556 = " "
    if L14_555 < 10 then
      L16_557 = "0"
      L15_556 = L16_557 .. tostring(L14_555)
    else
      L16_557 = tostring
      L16_557 = L16_557(L14_555)
      L15_556 = L16_557
    end
    L16_557 = 2
    if L6_547 < 0 then
      L16_557 = 3
    end
    L7_548 = A1_542:packTextParameter(3549, L13_554, 1, L15_556, 0, L16_557)
  else
    L11_552 = _math
    L11_552 = L11_552.abs
    L12_553 = L6_547
    L11_552 = L11_552(L12_553)
    L12_553 = 2
    if L6_547 < 0 then
      L12_553 = 3
    end
    L14_555 = A1_542
    L13_554 = A1_542.packTextParameter
    L15_556 = 3549
    L16_557 = L11_552
    L13_554 = L13_554(L14_555, L15_556, L16_557, 0, " ", 0, L12_553)
    L7_548 = L13_554
  end
  if L6_547 > 0 then
    if L9_550 then
      L8_549 = "TBL_parameterMinus"
    elseif L10_551 then
      L8_549 = "TBL_parameterPlus"
    else
      L8_549 = "TBL_parameterPlus"
    end
  elseif L6_547 < 0 then
    if L9_550 then
      L8_549 = "TBL_parameterPlus"
    elseif L10_551 then
      L8_549 = "TBL_parameterMinus"
    else
      L8_549 = "TBL_parameterMinus"
    end
  else
    L7_548 = " "
  end
  L12_553 = A1_542
  L11_552 = A1_542.setText
  L13_554 = A2_543
  L14_555 = ":"
  L15_556 = "TextBlock_ParameterDiff"
  L13_554 = L13_554 .. L14_555 .. L15_556
  L14_555 = L7_548
  L11_552(L12_553, L13_554, L14_555)
  L12_553 = A1_542
  L11_552 = A1_542.setStyle
  L13_554 = A2_543
  L14_555 = ":"
  L15_556 = "TextBlock_ParameterDiff"
  L13_554 = L13_554 .. L14_555 .. L15_556
  L14_555 = L8_549
  L11_552(L12_553, L13_554, L14_555)
  if L7_548 ~= " " then
    L12_553 = A1_542
    L11_552 = A1_542.setVisibility
    L13_554 = A2_543
    L14_555 = ":"
    L15_556 = "TextBlock_ParameterDiff"
    L13_554 = L13_554 .. L14_555 .. L15_556
    L14_555 = true
    L11_552(L12_553, L13_554, L14_555)
    L12_553 = A1_542
    L11_552 = A1_542.setHelpParameter
    L13_554 = A2_543
    L14_555 = ":"
    L15_556 = "TextBlock_ParameterDiff"
    L13_554 = L13_554 .. L14_555 .. L15_556
    L14_555 = 1
    L15_556 = 73925
    L11_552(L12_553, L13_554, L14_555, L15_556)
  else
    L12_553 = A1_542
    L11_552 = A1_542.setVisibility
    L13_554 = A2_543
    L14_555 = ":"
    L15_556 = "TextBlock_ParameterDiff"
    L13_554 = L13_554 .. L14_555 .. L15_556
    L14_555 = false
    L11_552(L12_553, L13_554, L14_555)
    L12_553 = A1_542
    L11_552 = A1_542.setHelpParameter
    L13_554 = A2_543
    L14_555 = ":"
    L15_556 = "TextBlock_ParameterDiff"
    L13_554 = L13_554 .. L14_555 .. L15_556
    L14_555 = 0
    L11_552(L12_553, L13_554, L14_555)
  end
end
L0_0.setItemBonusDiff = L1_1
L0_0 = DesktopWidget
function L1_1(A0_558, A1_559, A2_560, A3_561, A4_562, A5_563)
  local L6_564, L7_565, L8_566, L9_567, L10_568
  L6_564 = _math
  L6_564 = L6_564.ceil
  L7_565 = A5_563
  L6_564 = L6_564(L7_565)
  L6_564 = A4_562 - L6_564
  L7_565 = "-"
  L8_566 = tostring
  L9_567 = L6_564
  L8_566 = L8_566(L9_567)
  L7_565 = L7_565 .. L8_566
  L8_566 = "TBL_parameterMinus"
  L9_567 = A3_561 == 15060
  L10_568 = 73933
  if A4_562 == L6_564 then
    L8_566 = "TBL_parameterZero"
    L10_568 = 73926
  end
  if L9_567 then
    A1_559:setVisibility(A2_560 .. ":" .. "TextBlock_ParameterDiff", false)
    A1_559:setHelpParameter(A2_560 .. ":" .. "TextBlock_ParameterDiff", 0)
  else
    A1_559:setText(A2_560 .. ":" .. "TextBlock_ParameterDiff", 3548, L6_564, 0, " ", 0, 3)
    A1_559:setStyle(A2_560 .. ":" .. "TextBlock_ParameterDiff", L8_566)
    A1_559:setVisibility(A2_560 .. ":" .. "TextBlock_ParameterDiff", true)
    A1_559:setHelpParameter(A2_560 .. ":" .. "TextBlock_ParameterDiff", 1, L10_568)
  end
end
L0_0.setItemBonusDiffDegrade = L1_1
L0_0 = DesktopWidget
function L1_1(A0_569, A1_570, A2_571, A3_572, A4_573, A5_574, A6_575)
  local L7_576, L8_577, L9_578, L10_579, L11_580, L12_581, L13_582, L14_583, L15_584, L16_585, L17_586, L18_587, L19_588
  L7_576 = false
  L8_577, L9_578, L10_579, L11_580 = nil, nil, nil, nil
  L12_581 = 17
  L13_582 = "Label_ItemBonus5_"
  L14_583 = tostring
  L15_584 = L12_581
  L14_583 = L14_583(L15_584)
  L13_582 = L13_582 .. L14_583
  L15_584 = A1_570
  L14_583 = A1_570.setVisibility
  L16_585 = L13_582
  L17_586 = false
  L14_583(L15_584, L16_585, L17_586)
  L15_584 = A1_570
  L14_583 = A1_570.setHelpParameter
  L16_585 = L13_582
  L17_586 = 0
  L14_583(L15_584, L16_585, L17_586)
  L15_584 = A1_570
  L14_583 = A1_570.setHelpParameter
  L16_585 = L13_582
  L17_586 = ":"
  L18_587 = "TextBlock_ParameterDiff"
  L16_585 = L16_585 .. L17_586 .. L18_587
  L17_586 = 0
  L14_583(L15_584, L16_585, L17_586)
  if A3_572 ~= nil then
    L15_584 = A3_572
    L14_583 = A3_572.processGetConditionParameterBonus
    L17_586 = L14_583(L15_584)
    L11_580 = L17_586
    L10_579 = L16_585
    L9_578 = L15_584
    L8_577 = L14_583
    if L8_577 ~= 0 and L9_578 ~= 0 then
      L14_583 = L8_577
      if L14_583 == 16007 then
      elseif L14_583 == 16008 then
      elseif L14_583 == 16009 then
      else
      end
      if L14_583 == 16010 then
        L7_576 = true
        do break end
        else
          L15_584 = A2_571
          L14_583 = A2_571.getListProperty
          L16_585 = A4_573
          L17_586 = A5_574
          L18_587 = "hasConditionBonus"
          L14_583 = L14_583(L15_584, L16_585, L17_586, L18_587)
          if L14_583 == 1 then
            L7_576 = true
            L15_584 = A2_571
            L14_583 = A2_571.getListProperty
            L16_585 = A4_573
            L17_586 = A5_574
            L18_587 = "cbConditionKind"
            L14_583 = L14_583(L15_584, L16_585, L17_586, L18_587)
            L8_577 = L14_583
            L15_584 = A2_571
            L14_583 = A2_571.getListProperty
            L16_585 = A4_573
            L17_586 = A5_574
            L18_587 = "cbConditionValue"
            L14_583 = L14_583(L15_584, L16_585, L17_586, L18_587)
            L9_578 = L14_583
            L15_584 = A2_571
            L14_583 = A2_571.getListProperty
            L16_585 = A4_573
            L17_586 = A5_574
            L18_587 = "cbParamKind"
            L14_583 = L14_583(L15_584, L16_585, L17_586, L18_587)
            L10_579 = L14_583
            L15_584 = A2_571
            L14_583 = A2_571.getListProperty
            L16_585 = A4_573
            L17_586 = A5_574
            L18_587 = "cbParamValue"
            L14_583 = L14_583(L15_584, L16_585, L17_586, L18_587)
            L11_580 = L14_583
          end
        end
      end
    else
    end
  if L7_576 == true then
    L15_584 = A1_570
    L14_583 = A1_570.setVisibility
    L16_585 = L13_582
    L17_586 = true
    L14_583(L15_584, L16_585, L17_586)
    L15_584 = A1_570
    L14_583 = A1_570.packTextParameter
    L16_585 = 3555
    L17_586 = L8_577
    L18_587 = L9_578
    L19_588 = L10_579
    L14_583 = L14_583(L15_584, L16_585, L17_586, L18_587, L19_588)
    L16_585 = A1_570
    L15_584 = A1_570.setText
    L17_586 = L13_582
    L18_587 = ":"
    L19_588 = "TextBlock_ParameterHeader"
    L17_586 = L17_586 .. L18_587 .. L19_588
    L18_587 = L14_583
    L15_584(L16_585, L17_586, L18_587)
    L15_584 = 2
    if L11_580 < 0 then
      L15_584 = 3
      L11_580 = L11_580 * -1
    end
    L17_586 = A1_570
    L16_585 = A1_570.packTextParameter
    L18_587 = 3548
    L19_588 = L11_580
    L16_585 = L16_585(L17_586, L18_587, L19_588, 0, " ", 0, L15_584)
    L18_587 = A1_570
    L17_586 = A1_570.setText
    L19_588 = L13_582
    L19_588 = L19_588 .. ":" .. "TextBlock_ParameterValue"
    L17_586(L18_587, L19_588, L16_585)
    L17_586 = "TBL_null"
    L19_588 = A1_570
    L18_587 = A1_570.setStyle
    L18_587(L19_588, L13_582 .. ":" .. "TextBlock_ParameterHeader", L17_586)
    L19_588 = A1_570
    L18_587 = A1_570.setStyle
    L18_587(L19_588, L13_582 .. ":" .. "TextBlock_ParameterValue", L17_586)
    L18_587 = L8_577
    if L18_587 == 16007 then
    elseif L18_587 == 16008 then
    elseif L18_587 == 16009 then
    else
    end
    if L18_587 == 16010 then
      if A6_575 == false then
        L19_588 = L8_577 - 16000
        L19_588 = 72500 + L19_588
        A1_570:setHelpParameter(L13_582 .. ":" .. "TextBlock_ParameterHeader", 1, L19_588)
      else
        L19_588 = A1_570.setHelpParameter
        L19_588(A1_570, L13_582 .. ":" .. "TextBlock_ParameterHeader", 1, 73927)
      end
    else
    end
  else
  end
  return L7_576
end
L0_0.setItemConditionBonus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_589, A1_590, A2_591, A3_592, A4_593, A5_594, A6_595, A7_596, A8_597, A9_598, A10_599)
  local L11_600, L12_601, L13_602, L14_603, L15_604, L16_605, L17_606, L18_607, L19_608, L20_609, L21_610, L22_611, L23_612, L24_613, L25_614, L26_615, L27_616, L28_617, L29_618
  L11_600 = false
  L13_602 = A1_590
  L12_601 = A1_590.setVisibility
  L14_603 = "Grid_MateriaPossible"
  L15_604 = false
  L12_601(L13_602, L14_603, L15_604)
  L13_602 = A1_590
  L12_601 = A1_590.setHelpParameter
  L14_603 = "Grid_Life"
  L15_604 = 1
  L16_605 = 73901
  L12_601(L13_602, L14_603, L15_604, L16_605)
  L13_602 = A1_590
  L12_601 = A1_590.setHelpParameter
  L14_603 = "Grid_ItemPolish"
  L15_604 = 0
  L12_601(L13_602, L14_603, L15_604)
  L13_602 = A1_590
  L12_601 = A1_590.setHelpParameter
  L14_603 = "Grid_Repair"
  L15_604 = 0
  L12_601(L13_602, L14_603, L15_604)
  L13_602 = A1_590
  L12_601 = A1_590.setHelpParameter
  L14_603 = "Grid_RepairItem"
  L15_604 = 0
  L12_601(L13_602, L14_603, L15_604)
  if A6_595 then
    L13_602 = A0_589
    L12_601 = A0_589.getItemRank
    L14_603 = A5_594
    L15_604 = A2_591
    L16_605 = A3_592
    L17_606 = A4_593
    L12_601 = L12_601(L13_602, L14_603, L15_604, L16_605, L17_606)
    L14_603 = A0_589
    L13_602 = A0_589.isRepairable
    L15_604 = A5_594
    L16_605 = A2_591
    L17_606 = A3_592
    L18_607 = A4_593
    L13_602 = L13_602(L14_603, L15_604, L16_605, L17_606, L18_607)
    if L13_602 then
      L13_602 = true
      L15_604 = A0_589
      L14_603 = A0_589.getItemMaterializePermission
      L16_605 = A5_594
      L17_606 = nil
      L18_607 = A3_592
      L19_608 = A4_593
      L14_603 = L14_603(L15_604, L16_605, L17_606, L18_607, L19_608)
      L16_605 = A0_589
      L15_604 = A0_589.getItemMateriaBindPermission
      L17_606 = A5_594
      L18_607 = nil
      L19_608 = A3_592
      L20_609 = A4_593
      L15_604 = L15_604(L16_605, L17_606, L18_607, L19_608, L20_609)
      L17_606 = A0_589
      L16_605 = A0_589.getSkillHeaderTextUI
      L18_607 = L13_602
      L19_608 = L15_604
      L16_605 = L16_605(L17_606, L18_607, L19_608)
      L18_607 = A5_594
      L17_606 = A5_594.getListProperty
      L19_608 = A3_592
      L20_609 = A4_593
      L21_610 = "repairskill"
      L17_606 = L17_606(L18_607, L19_608, L20_609, L21_610)
      L19_608 = A5_594
      L18_607 = A5_594.getListProperty
      L20_609 = A3_592
      L21_610 = A4_593
      L18_607 = L18_607(L19_608, L20_609, L21_610, L22_611)
      L20_609 = A5_594
      L19_608 = A5_594.getListProperty
      L21_610 = A3_592
      L19_608 = L19_608(L20_609, L21_610, L22_611, L23_612)
      L21_610 = A5_594
      L20_609 = A5_594.getListProperty
      L20_609 = L20_609(L21_610, L22_611, L23_612, L24_613)
      L21_610 = A1_590.setIcon
      L29_618 = L24_613(L25_614, L26_615)
      L21_610(L22_611, L23_612, L24_613, L25_614, L26_615, L27_616, L28_617, L29_618, L24_613(L25_614, L26_615))
      L21_610 = worldMaster
      L21_610 = L21_610._getMyPlayer
      L21_610 = L21_610(L22_611)
      if L23_612 == L17_606 then
      else
      end
      for L27_616 = 2, 41 do
        L29_618 = L21_610
        L28_617 = L21_610.getSkillLevelCap
        L28_617 = L28_617(L29_618, L27_616)
      end
      L27_616 = 1
      L28_617 = 73902
      L24_613(L25_614, L26_615, L27_616, L28_617)
      L27_616 = 3202
      L28_617 = L19_608
      L29_618 = 1
      L24_613(L25_614, L26_615, L27_616, L28_617, L29_618)
      L27_616 = 3189
      L28_617 = tonumber
      L29_618 = L20_609
      L29_618 = L28_617(L29_618)
      L24_613(L25_614, L26_615, L27_616, L28_617, L29_618, L28_617(L29_618))
      L27_616 = 3553
      L28_617 = 100
      L24_613(L25_614, L26_615, L27_616, L28_617)
      L27_616 = "TBL_parameterPlus"
      L24_613(L25_614, L26_615, L27_616)
      L27_616 = false
      L24_613(L25_614, L26_615, L27_616)
      L27_616 = true
      L24_613(L25_614, L26_615, L27_616)
      L27_616 = true
      L24_613(L25_614, L26_615, L27_616)
      L27_616 = true
      L24_613(L25_614, L26_615, L27_616)
      L27_616 = true
      L24_613(L25_614, L26_615, L27_616)
      L27_616 = true
      L24_613(L25_614, L26_615, L27_616)
      if A10_599 == false then
      else
        L27_616 = 0
        L24_613(L25_614, L26_615, L27_616)
      end
      L27_616 = A1_590
      L28_617 = "Grid_ItemPolish"
      L29_618 = 1
      L26_615(L27_616, L28_617, L29_618, 73930)
      L27_616 = A1_590
      L28_617 = "Grid_Repair"
      L29_618 = 1
      L26_615(L27_616, L28_617, L29_618, 73904)
      L27_616 = L24_613
      L28_617 = 101
      L29_618 = 2001001
      if not L26_615 then
        L27_616 = L24_613
        L28_617 = 101
        L29_618 = 2001002
        if not L26_615 then
          L27_616 = L24_613
          L28_617 = 101
          L29_618 = 2001003
        end
      else
        if L26_615 then
          L27_616 = A0_589
          L28_617 = L13_602
          L29_618 = L15_604
          if L14_603 then
            L27_616 = A1_590
            L28_617 = "TextBlock_Materialize"
            L29_618 = 3540
            L26_615(L27_616, L28_617, L29_618)
            L27_616 = A1_590
            L28_617 = "TextBlock_Materialize"
            L29_618 = "TBL_null"
            L26_615(L27_616, L28_617, L29_618)
            L27_616 = A1_590
            L28_617 = "Grid_MateriaPossible"
            L29_618 = L14_603
            L26_615(L27_616, L28_617, L29_618)
            L27_616 = A1_590
            L28_617 = "Grid_ItemPolish"
            L29_618 = 1
            L26_615(L27_616, L28_617, L29_618, 73931)
          else
            L27_616 = A1_590
            L28_617 = "TextBlock_Materialize"
            L29_618 = 3541
            L26_615(L27_616, L28_617, L29_618)
            L27_616 = A1_590
            L28_617 = "TextBlock_Materialize"
            L29_618 = "TBL_parameterMinus"
            L26_615(L27_616, L28_617, L29_618)
          end
          L27_616 = A1_590
          L28_617 = "TextBlock_Materialize"
          L29_618 = true
          L26_615(L27_616, L28_617, L29_618)
          if L15_604 then
            L27_616 = A1_590
            L28_617 = "TextBlock_MateriaAttach"
            L29_618 = 3542
            L26_615(L27_616, L28_617, L29_618)
            L27_616 = A1_590
            L28_617 = "TextBlock_MateriaAttach"
            L29_618 = "TBL_null"
            L26_615(L27_616, L28_617, L29_618)
            L27_616 = A1_590
            L28_617 = "Grid_Repair"
            L29_618 = 1
            L26_615(L27_616, L28_617, L29_618, 73929)
          else
            L12_601 = 0
            L27_616 = A1_590
            L28_617 = "TextBlock_MateriaAttach"
            L29_618 = 3543
            L26_615(L27_616, L28_617, L29_618)
            L27_616 = A1_590
            L28_617 = "TextBlock_MateriaAttach"
            L29_618 = "TBL_parameterMinus"
            L26_615(L27_616, L28_617, L29_618)
          end
          L27_616 = A1_590
          L28_617 = "TextBlock_MateriaAttach"
          L29_618 = true
          L26_615(L27_616, L28_617, L29_618)
      end
      else
        L12_601 = 0
        L27_616 = A1_590
        L28_617 = "TextBlock_Materialize"
        L29_618 = false
        L26_615(L27_616, L28_617, L29_618)
        L27_616 = A1_590
        L28_617 = "TextBlock_MateriaAttach"
        L29_618 = false
        L26_615(L27_616, L28_617, L29_618)
      end
      L27_616 = A1_590
      L28_617 = "TextBlock_RepairSkill"
      L29_618 = 3620
      L26_615(L27_616, L28_617, L29_618, L17_606, L18_607, L22_611, L12_601)
      L11_600 = true
    else
      L11_600 = false
    end
    L14_603 = A1_590
    L13_602 = A1_590.setVisibility
    L15_604 = "Border_ItemLife_IconCaution"
    L16_605 = false
    L13_602(L14_603, L15_604, L16_605)
    L14_603 = A1_590
    L13_602 = A1_590.setVisibility
    L15_604 = "Border_ItemLife_IconDanger"
    L16_605 = false
    L13_602(L14_603, L15_604, L16_605)
  else
    L13_602 = A0_589
    L12_601 = A0_589.isWearUnder
    L14_603 = A5_594
    L15_604 = A3_592
    L16_605 = A4_593
    L17_606 = A2_591
    L12_601 = L12_601(L13_602, L14_603, L15_604, L16_605, L17_606)
    if L12_601 then
      L11_600 = false
      L13_602 = A1_590
      L12_601 = A1_590.setVisibility
      L14_603 = "Border_ItemLife_IconCaution"
      L15_604 = false
      L12_601(L13_602, L14_603, L15_604)
      L13_602 = A1_590
      L12_601 = A1_590.setVisibility
      L14_603 = "Border_ItemLife_IconDanger"
      L15_604 = false
      L12_601(L13_602, L14_603, L15_604)
    else
      L13_602 = A0_589
      L12_601 = A0_589.getItemRepairData
      L14_603 = A5_594
      L15_604 = A2_591
      L16_605 = A3_592
      L17_606 = A4_593
      L18_607 = L12_601(L13_602, L14_603, L15_604, L16_605, L17_606)
      L19_608 = worldMaster
      L20_609 = L19_608
      L19_608 = L19_608._getMyPlayer
      L19_608 = L19_608(L20_609)
      L20_609 = 1
      L21_610 = L19_608.getStateMainSkill
      L21_610 = L21_610(L22_611)
      if L21_610 == L17_606 then
        L21_610 = L19_608.getStateMainSkillLevel
        L21_610 = L21_610(L22_611)
        L20_609 = L21_610
      else
        L21_610 = L19_608.getSkillLevel
        L21_610 = L21_610(L22_611, L23_612)
        L20_609 = L21_610
      end
      L21_610 = 0
      for L25_614 = 2, 41 do
        L27_616 = L19_608
        L28_617 = L25_614
        L21_610 = L21_610 + L26_615
      end
      if L21_610 ~= 0 and L20_609 == 0 then
        L20_609 = 1
      end
      L27_616 = A4_593
      L27_616 = A3_592
      L28_617 = A4_593
      L27_616 = A2_591
      L28_617 = A3_592
      L29_618 = A4_593
      L27_616 = "Grid_RepairItem"
      L28_617 = 1
      L29_618 = 73902
      L25_614(L26_615, L27_616, L28_617, L29_618)
      L27_616 = "Grid_Repair"
      L28_617 = 1
      L29_618 = 73904
      L25_614(L26_615, L27_616, L28_617, L29_618)
      if L12_601 then
        L11_600 = true
        L27_616 = "TextBlock_RepairMaterialHeader"
        L28_617 = 214
        L29_618 = 10093
        L25_614(L26_615, L27_616, L28_617, L29_618)
        L27_616 = "TextBlock_RepairMaterialName"
        L28_617 = 3202
        L29_618 = L15_604
        L25_614(L26_615, L27_616, L28_617, L29_618, 1)
        L27_616 = "TextBlock_RepairMaterialNum"
        L28_617 = 3189
        L29_618 = L16_605
        L25_614(L26_615, L27_616, L28_617, L29_618)
        L27_616 = "IconControl_RepairSkill"
        L29_618 = A0_589
        L28_617 = A0_589.getSkillIcon
        L29_618 = L28_617(L29_618, L17_606)
        L25_614(L26_615, L27_616, L28_617, L29_618, L28_617(L29_618, L17_606))
        L27_616 = "TextBlock_RepairSkillHeader"
        L28_617 = true
        L25_614(L26_615, L27_616, L28_617)
        L27_616 = "IconControl_RepairSkill"
        L28_617 = true
        L25_614(L26_615, L27_616, L28_617)
        L27_616 = "TextBlock_RepairSkill"
        L28_617 = true
        L25_614(L26_615, L27_616, L28_617)
        L27_616 = "IconControl_RepairMaterialIcon"
        L28_617 = false
        L25_614(L26_615, L27_616, L28_617)
        if A8_597 then
          L27_616 = "Border_ItemLife_IconCaution"
          L28_617 = false
          L25_614(L26_615, L27_616, L28_617)
          L27_616 = "Border_ItemLife_IconDanger"
          L28_617 = false
          L25_614(L26_615, L27_616, L28_617)
        else
          L27_616 = A5_594
          L28_617 = A2_591
          L29_618 = A3_592
          L29_618 = L25_614(L26_615, L27_616, L28_617, L29_618, A4_593)
          if A9_598 then
            L27_616 = false
            L28_617 = false
            L29_618 = "TBL_parameterPlus"
          end
          A1_590:setText("TextBlock_ItemLife", 3553, L25_614)
          A1_590:setStyle("TextBlock_ItemLife", L29_618)
          A1_590:setVisibility("TextBlock_ItemLifeHeader", true)
          A1_590:setVisibility("TextBlock_ItemLife", true)
          A1_590:setVisibility("Border_ItemLife_IconCaution", L27_616)
          A1_590:setVisibility("Border_ItemLife_IconDanger", L28_617)
        end
        L27_616 = "TextBlock_ItemLifeHeader"
        L28_617 = not A8_597
        L25_614(L26_615, L27_616, L28_617)
        L27_616 = "TextBlock_ItemLife"
        L28_617 = not A8_597
        L25_614(L26_615, L27_616, L28_617)
      else
        L27_616 = "Border_ItemLife_IconCaution"
        L28_617 = false
        L25_614(L26_615, L27_616, L28_617)
        L27_616 = "Border_ItemLife_IconDanger"
        L28_617 = false
        L25_614(L26_615, L27_616, L28_617)
        L11_600 = false
      end
      if A10_599 == false then
      else
        L27_616 = A5_594
        L28_617 = A2_591
        L29_618 = A3_592
        if L25_614 then
          L27_616 = "Grid_ItemPolish"
          L28_617 = true
          L25_614(L26_615, L27_616, L28_617)
          L27_616 = "TextBlock_ItemPolish"
          L28_617 = 3563
          L25_614(L26_615, L27_616, L28_617)
          L27_616 = A5_594
          L28_617 = A2_591
          L29_618 = A3_592
          if L25_614 then
            L27_616 = A5_594
            L28_617 = A2_591
            L29_618 = A3_592
            L27_616 = L25_614 / 10000
            L27_616 = L27_616 * 100
            L28_617 = A1_590
            L27_616 = A1_590.setValue
            L29_618 = "ProgressBar_ItemPolish"
            L27_616(L28_617, L29_618, L26_615)
            L28_617 = A1_590
            L27_616 = A1_590._sendStoryboardCommand
            L29_618 = nil
            L27_616(L28_617, L29_618, "Label_MateriaPossibleEffect", "UILuaCommands.MateriaPossibleEffectStop")
            if L23_612 and L25_614 == 10000 then
              L28_617 = A1_590
              L27_616 = A1_590._sendStoryboardCommand
              L29_618 = nil
              L27_616(L28_617, L29_618, "Label_MateriaPossibleEffect", "UILuaCommands.MateriaPossibleEffectStart")
            end
          else
          end
          L11_600 = true
        else
        end
      end
      L28_617 = A1_590
      L27_616 = A1_590.setHelpParameter
      L29_618 = "Grid_ItemPolish"
      L27_616(L28_617, L29_618, 1, 73930)
      L28_617 = L25_614
      L27_616 = L25_614.hasItem
      L29_618 = 101
      L27_616 = L27_616(L28_617, L29_618, 2001001)
      if not L27_616 then
        L28_617 = L25_614
        L27_616 = L25_614.hasItem
        L29_618 = 101
        L27_616 = L27_616(L28_617, L29_618, 2001002)
        if not L27_616 then
          L28_617 = L25_614
          L27_616 = L25_614.hasItem
          L29_618 = 101
          L27_616 = L27_616(L28_617, L29_618, 2001003)
        end
      else
        if L27_616 then
          L28_617 = A0_589
          L27_616 = A0_589.getSkillHeaderTextUI
          L29_618 = L12_601
          L27_616 = L27_616(L28_617, L29_618, L24_613)
          if L23_612 then
            L28_617 = A1_590
            L27_616 = A1_590.setText
            L29_618 = "TextBlock_Materialize"
            L27_616(L28_617, L29_618, 3540)
            L28_617 = A1_590
            L27_616 = A1_590.setStyle
            L29_618 = "TextBlock_Materialize"
            L27_616(L28_617, L29_618, "TBL_null")
            L28_617 = A1_590
            L27_616 = A1_590.setVisibility
            L29_618 = "Grid_MateriaPossible"
            L27_616(L28_617, L29_618, L23_612)
            L28_617 = A1_590
            L27_616 = A1_590.setHelpParameter
            L29_618 = "Grid_ItemPolish"
            L27_616(L28_617, L29_618, 1, 73931)
          else
            L28_617 = A1_590
            L27_616 = A1_590.setText
            L29_618 = "TextBlock_Materialize"
            L27_616(L28_617, L29_618, 3541)
            L28_617 = A1_590
            L27_616 = A1_590.setStyle
            L29_618 = "TextBlock_Materialize"
            L27_616(L28_617, L29_618, "TBL_parameterMinus")
          end
          L28_617 = A1_590
          L27_616 = A1_590.setVisibility
          L29_618 = "TextBlock_Materialize"
          L27_616(L28_617, L29_618, true)
          if L24_613 then
            L28_617 = A1_590
            L27_616 = A1_590.setText
            L29_618 = "TextBlock_MateriaAttach"
            L27_616(L28_617, L29_618, 3542)
            L28_617 = A1_590
            L27_616 = A1_590.setStyle
            L29_618 = "TextBlock_MateriaAttach"
            L27_616(L28_617, L29_618, "TBL_null")
            L28_617 = A1_590
            L27_616 = A1_590.setHelpParameter
            L29_618 = "Grid_Repair"
            L27_616(L28_617, L29_618, 1, 73929)
          else
            L28_617 = A1_590
            L27_616 = A1_590.setText
            L29_618 = "TextBlock_MateriaAttach"
            L27_616(L28_617, L29_618, 3543)
            L28_617 = A1_590
            L27_616 = A1_590.setStyle
            L29_618 = "TextBlock_MateriaAttach"
            L27_616(L28_617, L29_618, "TBL_parameterMinus")
          end
          L28_617 = A1_590
          L27_616 = A1_590.setVisibility
          L29_618 = "TextBlock_MateriaAttach"
          L27_616(L28_617, L29_618, true)
      end
      else
        L28_617 = A1_590
        L27_616 = A1_590.setVisibility
        L29_618 = "TextBlock_Materialize"
        L27_616(L28_617, L29_618, false)
        L28_617 = A1_590
        L27_616 = A1_590.setVisibility
        L29_618 = "TextBlock_MateriaAttach"
        L27_616(L28_617, L29_618, false)
      end
      if L12_601 then
        L28_617 = A1_590
        L27_616 = A1_590.setText
        L29_618 = "TextBlock_RepairSkill"
        L27_616(L28_617, L29_618, 3620, L17_606, L18_607, L20_609, L22_611)
      end
    end
  end
  return L11_600
end
L0_0.setItemBonusOther = L1_1
L0_0 = DesktopWidget
function L1_1(A0_619, A1_620, A2_621, A3_622, A4_623, A5_624, A6_625)
  local L7_626, L8_627, L9_628, L10_629, L11_630
  L7_626 = "IconControl_Equiped"
  L8_627 = "IconControl_PolishMAX"
  L9_628 = "IconControl_Materia"
  L10_629 = "IconControl_NotEquiped"
  if A6_625 == nil then
    A6_625 = A1_620
  end
  if A3_622 ~= nil then
    L11_630 = "_"
    L11_630 = L11_630 .. tostring(A3_622)
    L7_626 = L7_626 .. L11_630
    L8_627 = L8_627 .. L11_630
    L9_628 = L9_628 .. L11_630
    L10_629 = L10_629 .. L11_630
  end
  L11_630 = A0_619.isEquipping
  L11_630 = L11_630(A0_619, A6_625, A2_621, A4_623, A5_624)
  if L11_630 then
    L11_630 = A6_625.setVisibility
    L11_630(A6_625, L7_626, true)
  else
    L11_630 = A6_625.setVisibility
    L11_630(A6_625, L7_626, false)
  end
  L11_630 = A0_619.isItemNormal
  L11_630 = L11_630(A0_619, A6_625, A2_621, A4_623, A5_624)
  if L11_630 then
    L11_630 = worldMaster
    L11_630 = L11_630._getMyPlayer
    L11_630 = L11_630(L11_630)
    if L11_630:hasItem(101, 2001001) or L11_630:hasItem(101, 2001002) or L11_630:hasItem(101, 2001003) then
    end
    if A0_619:canChangeFitness(A6_625, A2_621, A4_623, A5_624) and A0_619:getItemFitness(A6_625, A2_621, A4_623, A5_624) == 10000 and true and A0_619:getItemMaterializePermission(A6_625, A2_621, A4_623, A5_624) then
      A6_625:setVisibility(L8_627, true)
    else
      A6_625:setVisibility(L8_627, false)
    end
    A6_625:setVisibility(L9_628, A0_619:isMateriaAttached(A6_625, A2_621, A4_623, A5_624))
  else
    L11_630 = A6_625.setVisibility
    L11_630(A6_625, L8_627, false)
    L11_630 = A6_625.setVisibility
    L11_630(A6_625, L9_628, false)
  end
  L11_630 = A0_619.cantEquipBadge
  L11_630 = L11_630(A0_619, A6_625, A4_623, A5_624, A2_621)
  A6_625:setVisibility(L10_629, L11_630)
end
L0_0.setVisibilityBadgeIcons = L1_1
L0_0 = DesktopWidget
function L1_1(A0_631, A1_632, A2_633, A3_634)
  local L4_635, L5_636, L6_637, L7_638, L8_639
  L4_635 = "IconControl_Equiped"
  L5_636 = "IconControl_PolishMAX"
  L6_637 = "IconControl_Materia"
  L7_638 = "IconControl_NotEquiped"
  if A2_633 == nil then
    A2_633 = A1_632
  end
  if A3_634 ~= nil then
    L8_639 = "_"
    L8_639 = L8_639 .. tostring(A3_634)
    L4_635 = L4_635 .. L8_639
    L5_636 = L5_636 .. L8_639
    L6_637 = L6_637 .. L8_639
    L7_638 = L7_638 .. L8_639
  end
  L8_639 = A2_633.setVisibility
  L8_639(A2_633, L4_635, false)
  L8_639 = A2_633.setVisibility
  L8_639(A2_633, L5_636, false)
  L8_639 = A2_633.setVisibility
  L8_639(A2_633, L6_637, false)
  L8_639 = A2_633.setVisibility
  L8_639(A2_633, L7_638, false)
end
L0_0.unsetVisibilityBadgeIconsAll = L1_1
L0_0 = DesktopWidget
function L1_1(A0_640, A1_641, A2_642, A3_643, A4_644, A5_645)
  local L6_646, L7_647, L8_648, L9_649, L10_650, L11_651, L12_652, L13_653, L14_654, L15_655, L16_656, L17_657, L18_658, L19_659, L20_660, L21_661, L22_662, L23_663, L24_664, L25_665, L26_666, L27_667, L28_668, L29_669, L30_670, L31_671, L32_672
  L7_647 = A0_640
  L6_646 = A0_640.getItemBase
  L8_648 = A1_641
  L9_649 = A2_642
  L10_650 = A3_643
  L11_651 = A4_644
  L20_660 = L6_646(L7_647, L8_648, L9_649, L10_650, L11_651)
  L22_662 = A0_640
  L21_661 = A0_640.setItemDetailWithParam
  L23_663 = A1_641
  L24_664 = A2_642
  L25_665 = A3_643
  L26_666 = A4_644
  L27_667 = L9_649
  L28_668 = L8_648
  L29_669 = L17_657
  L30_670 = L18_658
  L31_671 = L6_646
  L32_672 = L10_650
  L21_661(L22_662, L23_663, L24_664, L25_665, L26_666, L27_667, L28_668, L29_669, L30_670, L31_671, L32_672, L12_652, L13_653, L19_659, L20_660, nil, A5_645)
end
L0_0.setItemDetail = L1_1
L0_0 = DesktopWidget
function L1_1(A0_673, A1_674, A2_675, A3_676, A4_677, A5_678, A6_679, A7_680, A8_681, A9_682, A10_683, A11_684, A12_685, A13_686, A14_687, A15_688, A16_689)
  local L17_690, L18_691, L19_692, L20_693, L21_694, L22_695, L23_696, L24_697, L25_698, L26_699, L27_700, L28_701, L29_702, L30_703, L31_704, L32_705
  if A15_688 == nil then
    A15_688 = A1_674
  end
  L18_691 = A1_674
  L17_690 = A1_674.setIcon
  L19_692 = "IconControl_ItemIcon"
  L20_693 = A6_679
  L17_690(L18_691, L19_692, L20_693)
  if A16_689 == false then
    L18_691 = A0_673
    L17_690 = A0_673.unsetVisibilityBadgeIconsAll
    L19_692 = A1_674
    L20_693 = A15_688
    L21_694 = nil
    L17_690(L18_691, L19_692, L20_693, L21_694)
  else
    L18_691 = A0_673
    L17_690 = A0_673.setVisibilityBadgeIcons
    L19_692 = A1_674
    L20_693 = A2_675
    L21_694 = nil
    L22_695 = A3_676
    L23_696 = A4_677
    L24_697 = A15_688
    L17_690(L18_691, L19_692, L20_693, L21_694, L22_695, L23_696, L24_697)
  end
  L18_691 = A1_674
  L17_690 = A1_674.setText
  L19_692 = "TextBlock_ItemName"
  L20_693 = A7_680
  L17_690(L18_691, L19_692, L20_693)
  L18_691 = A1_674
  L17_690 = A1_674.setStyle
  L19_692 = "TextBlock_ItemName"
  L20_693 = A8_681
  L17_690(L18_691, L19_692, L20_693)
  L18_691 = A1_674
  L17_690 = A1_674.setStyle
  L19_692 = "TextBlock_ItemStack"
  L20_693 = "TBL_null"
  L17_690(L18_691, L19_692, L20_693)
  if A5_678 ~= false then
    L18_691 = A0_673
    L17_690 = A0_673.isGuildPoint
    L19_692 = A9_682
    L17_690 = L17_690(L18_691, L19_692)
  else
    if L17_690 then
      L18_691 = A1_674
      L17_690 = A1_674.setVisibility
      L19_692 = "TextBlock_ItemStack"
      L20_693 = false
      L17_690(L18_691, L19_692, L20_693)
  end
  elseif A9_682 == 1000001 then
    L18_691 = A1_674
    L17_690 = A1_674.setText
    L19_692 = "TextBlock_ItemName"
    L20_693 = 4405
    L21_694 = A10_683
    L17_690(L18_691, L19_692, L20_693, L21_694)
    L18_691 = A1_674
    L17_690 = A1_674.setVisibility
    L19_692 = "TextBlock_ItemStack"
    L20_693 = false
    L17_690(L18_691, L19_692, L20_693)
  else
    L18_691 = A0_673
    L17_690 = A0_673.isCampanyPoint
    L19_692 = A9_682
    L17_690 = L17_690(L18_691, L19_692)
    if L17_690 then
      L18_691 = A1_674
      L17_690 = A1_674.setText
      L19_692 = "TextBlock_ItemStack"
      L20_693 = 225
      L21_694 = A10_683
      L17_690(L18_691, L19_692, L20_693, L21_694)
      L18_691 = A1_674
      L17_690 = A1_674.setVisibility
      L19_692 = "TextBlock_ItemStack"
      L20_693 = true
      L17_690(L18_691, L19_692, L20_693)
    else
      if A11_684 == nil then
        L18_691 = A1_674
        L17_690 = A1_674.setText
        L19_692 = "TextBlock_ItemStack"
        L20_693 = 3189
        L21_694 = A10_683
        L17_690(L18_691, L19_692, L20_693, L21_694)
      else
        L18_691 = A1_674
        L17_690 = A1_674.setText
        L19_692 = "TextBlock_ItemStack"
        L20_693 = 3551
        L21_694 = A10_683
        L22_695 = A11_684
        L17_690(L18_691, L19_692, L20_693, L21_694, L22_695)
      end
      L18_691 = A1_674
      L17_690 = A1_674.setVisibility
      L19_692 = "TextBlock_ItemStack"
      L20_693 = true
      L17_690(L18_691, L19_692, L20_693)
    end
  end
  if A12_685 > 0 then
    L18_691 = A1_674
    L17_690 = A1_674.setText
    L19_692 = "TextBlock_ItemKind"
    L20_693 = 3205
    L21_694 = A12_685
    L17_690(L18_691, L19_692, L20_693, L21_694)
  else
    L18_691 = A1_674
    L17_690 = A1_674.setText
    L19_692 = "TextBlock_ItemKind"
    L20_693 = ""
    L17_690(L18_691, L19_692, L20_693)
  end
  L18_691 = A1_674
  L17_690 = A1_674.setVisibility
  L19_692 = "Grid_ItemRare"
  L20_693 = A13_686
  L17_690(L18_691, L19_692, L20_693)
  L18_691 = A1_674
  L17_690 = A1_674.setVisibility
  L19_692 = "Grid_ItemTrade"
  L20_693 = A14_687
  L17_690(L18_691, L19_692, L20_693)
  L18_691 = A0_673
  L17_690 = A0_673.getItemEquipCondition
  L19_692 = A15_688
  L20_693 = A2_675
  L21_694 = A3_676
  L22_695 = A4_677
  L23_696 = L17_690(L18_691, L19_692, L20_693, L21_694, L22_695)
  if L19_692 == 0 then
    L25_698 = A1_674
    L24_697 = A1_674.setText
    L24_697(L25_698, L26_699, L27_700)
    L25_698 = A1_674
    L24_697 = A1_674.setVisibility
    L24_697(L25_698, L26_699, L27_700)
  else
    if L17_690 < 0 then
      L17_690 = 0
    end
    if L18_691 < 0 then
      L18_691 = 0
    end
    L25_698 = A1_674
    L24_697 = A1_674.setText
    L29_702 = L17_690
    L30_703 = L18_691
    L31_704 = L20_693
    L32_705 = L21_694
    L24_697(L25_698, L26_699, L27_700, L28_701, L29_702, L30_703, L31_704, L32_705, L22_695)
    L24_697 = "TBL_null"
    L25_698 = L23_696
    if L25_698 == 2 then
      L24_697 = "TBL_parameterPlus"
      break
    else
    end
    if L25_698 == 3 then
      L24_697 = "TBL_parameterCaution"
      break
    else
    end
    if L25_698 == 4 then
      L24_697 = "TBL_parameterMinus"
      break
    else
    end
    L25_698 = A1_674.setStyle
    L25_698(L26_699, L27_700, L28_701)
    L25_698 = A1_674.setVisibility
    L25_698(L26_699, L27_700, L28_701)
  end
  L25_698 = A1_674
  L24_697 = A1_674.setHelpParameter
  L24_697(L25_698, L26_699, L27_700)
  L25_698 = A1_674
  L24_697 = A1_674.setHelpParameter
  L24_697(L25_698, L26_699, L27_700)
  L25_698 = A1_674
  L24_697 = A1_674.setVisibility
  L24_697(L25_698, L26_699, L27_700)
  L25_698 = A0_673
  L24_697 = A0_673.isDetail2Visible
  L29_702 = A4_677
  L24_697 = L24_697(L25_698, L26_699, L27_700, L28_701, L29_702)
  if L24_697 == true then
    L25_698 = A1_674
    L24_697 = A1_674.setText
    L24_697(L25_698, L26_699, L27_700)
    L25_698 = A1_674
    L24_697 = A1_674.setVisibility
    L24_697(L25_698, L26_699, L27_700)
    L25_698 = A1_674
    L24_697 = A1_674.setHelpParameter
    L24_697(L25_698, L26_699, L27_700, L28_701)
  else
    L25_698 = A0_673
    L24_697 = A0_673.isEnchantMateria
    L29_702 = A4_677
    L24_697 = L24_697(L25_698, L26_699, L27_700, L28_701, L29_702)
    if L24_697 then
      L25_698 = A0_673
      L24_697 = A0_673.getItemRank
      L29_702 = A4_677
      L24_697 = L24_697(L25_698, L26_699, L27_700, L28_701, L29_702)
      L25_698 = A1_674.setText
      L29_702 = L24_697
      L25_698(L26_699, L27_700, L28_701, L29_702)
      L25_698 = A1_674.setStyle
      L25_698(L26_699, L27_700, L28_701)
      L25_698 = A1_674.setVisibility
      L25_698(L26_699, L27_700, L28_701)
      L25_698 = A1_674.setHelpParameter
      L29_702 = 73935
      L25_698(L26_699, L27_700, L28_701, L29_702)
      L25_698 = A0_673.getMateriaType
      L29_702 = A3_676
      L30_703 = A4_677
      L25_698 = L25_698(L26_699, L27_700, L28_701, L29_702, L30_703)
      for L29_702 = 42, 79 do
        L30_703 = 0.8
        L31_704 = 0.3
        L32_705 = "IconControl_MateriaSlot_"
        L32_705 = L32_705 .. tostring(L29_702)
        if materiaSheet:_getData(L25_698, L29_702) then
          L30_703, L31_704 = 1, 1
        end
        A1_674:setVisualOpacity(L32_705, L30_703)
        A1_674:setColor(L32_705, L31_704, L31_704, L31_704)
      end
      L29_702 = true
      L26_699(L27_700, L28_701, L29_702)
    else
      L25_698 = A1_674
      L24_697 = A1_674.setText
      L24_697(L25_698, L26_699, L27_700, L28_701)
      L25_698 = A1_674
      L24_697 = A1_674.setVisibility
      L24_697(L25_698, L26_699, L27_700)
      if A2_675 ~= nil or A15_688 ~= nil then
        L25_698 = A0_673
        L24_697 = A0_673.isFishingBaitWeapon
        L29_702 = A2_675
        L24_697 = L24_697(L25_698, L26_699, L27_700, L28_701, L29_702)
        if L24_697 == true then
          L25_698 = A1_674
          L24_697 = A1_674.setHelpParameter
          L24_697(L25_698, L26_699, L27_700, L28_701)
        end
      end
    end
  end
end
L0_0.setItemDetailWithParam = L1_1
L0_0 = DesktopWidget
function L1_1(A0_706, A1_707, A2_708, A3_709, A4_710, A5_711, A6_712, A7_713, A8_714, A9_715, A10_716, A11_717, A12_718, A13_719)
  local L14_720, L15_721, L16_722, L17_723
  if A12_718 == nil then
    A12_718 = A1_707
  end
  L15_721 = A0_706
  L14_720 = A0_706.setItemDetailEquipItem
  L16_722 = A1_707
  L17_723 = A2_708
  L17_723 = L14_720(L15_721, L16_722, L17_723, A3_709, A4_710, A5_711, A6_712, A7_713, A8_714, A9_715, A10_716, A11_717, A12_718, A13_719)
  A1_707:setVisibility("Grid_ItemDetail1", L14_720)
  A1_707:setVisibility("Grid_ItemDetail2", L15_721)
  A1_707:setVisibility("Grid_ItemDetail3", L16_722 or L17_723)
  A1_707:setVisibility("Grid_ItemLife", L17_723)
end
L0_0.setItemDetailEquipWithGridControl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_724, A1_725, A2_726, A3_727, A4_728, A5_729, A6_730, A7_731, A8_732, A9_733, A10_734, A11_735, A12_736, A13_737, A14_738)
  local L15_739, L16_740, L17_741, L18_742, L19_743, L20_744, L21_745, L22_746
  L15_739 = false
  L16_740 = false
  L17_741 = false
  L18_742 = false
  L19_743 = false
  L20_744 = A5_729
  if A12_736 == nil then
    A12_736 = A1_725
  end
  L22_746 = A0_724
  L21_745 = A0_724.isEnchantMateria
  L21_745 = L21_745(L22_746, A12_736, A2_726, A3_727, A4_728)
  if L21_745 then
    L22_746 = A0_724
    L21_745 = A0_724.setItemDetailMateriaItem
    L17_741, L18_742, L21_745 = A1_725, A12_736, L21_745(L22_746, A1_725, A12_736, A2_726, A3_727, A4_728)
    L17_741, L18_742, L22_746 = A1_725, A12_736, L21_745(L22_746, A1_725, A12_736, A2_726, A3_727, A4_728)
    L16_740 = L22_746
    L15_739 = L21_745
    L15_739 = false
  else
    L22_746 = A0_724
    L21_745 = A0_724.isEquipping
    L21_745 = L21_745(L22_746, A12_736, A2_726, A3_727, A4_728)
    if L21_745 then
      L22_746 = A0_724
      L21_745 = A0_724.isFishingBaitWeapon
      L21_745 = L21_745(L22_746, A1_725, A3_727, A4_728, A2_726)
      if not L21_745 then
        L21_745 = 1
        L22_746 = false
        if A10_734 then
        else
          L21_745 = A0_724:getDegradeRate(A12_736, A2_726, A3_727, A4_728)
          if A0_724:getItemLife(A12_736, A2_726, A3_727, A4_728) ~= 0 and L21_745 == 0 then
          elseif L21_745 ~= 1 then
            L22_746 = true
          end
        end
        L15_739, L16_740, L17_741, L18_742 = A0_724:setItemDetailDegradeEquipItem(A1_725, A12_736, A2_726, A3_727, A4_728, A6_730, A7_731, A8_732, A9_733, A10_734, A11_735, A13_737, L21_745, L22_746)
      end
    else
      L22_746 = A0_724
      L21_745 = A0_724.isDetail2Visible
      L21_745 = L21_745(L22_746, A12_736, A2_726, A3_727, A4_728)
      if L21_745 then
        L21_745 = true
        L22_746 = A0_724.isWeapon
        L22_746 = L22_746(A0_724, A12_736, A3_727, A4_728, A2_726)
        if L22_746 then
        elseif L20_744 == nil then
          L22_746 = A0_724.cantEquipBadge
          L22_746 = L22_746(A0_724, A12_736, A3_727, A4_728, A2_726)
          if L22_746 then
            L21_745 = false
          end
        else
          L22_746 = A0_724.isArmor
          L22_746 = L22_746(A0_724, A12_736, A3_727, A4_728, A2_726)
          if not L22_746 then
            L22_746 = A0_724.isAccessory
            L22_746 = L22_746(A0_724, A12_736, A3_727, A4_728, A2_726)
          elseif L22_746 then
            L22_746 = A0_724.cantEquipBadge
            L22_746 = L22_746(A0_724, A12_736, A3_727, A4_728, A2_726)
            if L22_746 then
              L21_745 = false
            end
          end
        end
        L22_746 = A0_724.setItemDetailEquipItem
        L16_740, L17_741, L18_742, L22_746 = A0_724, A1_725, A2_726, L22_746(A0_724, A1_725, A2_726, A3_727, A4_728, L20_744, A6_730, A7_731, A8_732, A9_733, A10_734, A11_735, A12_736, A13_737, L21_745, A14_738)
        L15_739 = L22_746
      else
        L22_746 = A0_724
        L21_745 = A0_724.setItemDetailOtherItem
        L17_741, L18_742, L21_745 = A1_725, A12_736, L21_745(L22_746, A1_725, A12_736, A2_726, A3_727, A4_728)
        L17_741, L18_742, L22_746 = A1_725, A12_736, L21_745(L22_746, A1_725, A12_736, A2_726, A3_727, A4_728)
        L16_740 = L22_746
        L15_739 = L21_745
      end
    end
  end
  L21_745 = L15_739
  L22_746 = L16_740
  return L21_745, L22_746, L17_741, L18_742
end
L0_0.setItemDetailEquip = L1_1
L0_0 = DesktopWidget
function L1_1(A0_747, A1_748, A2_749, A3_750, A4_751, A5_752)
  local L6_753, L7_754, L8_755, L9_756, L10_757, L11_758, L12_759, L13_760, L14_761, L15_762, L16_763, L17_764, L18_765
  L6_753 = ""
  L7_754 = true
  L8_755 = false
  L9_756 = true
  L10_757 = true
  for L14_761 = 1, 32 do
    L15_762 = "Label_ItemBonus5_"
    L16_763 = tostring
    L17_764 = L14_761
    L16_763 = L16_763(L17_764)
    L6_753 = L15_762 .. L16_763
    L16_763 = A1_748
    L15_762 = A1_748.setVisibility
    L17_764 = L6_753
    L18_765 = ":"
    L17_764 = L17_764 .. L18_765 .. "TextBlock_ParameterDiff"
    L18_765 = false
    L15_762(L16_763, L17_764, L18_765)
    L16_763 = A1_748
    L15_762 = A1_748.setVisibility
    L17_764 = L6_753
    L18_765 = false
    L15_762(L16_763, L17_764, L18_765)
    L16_763 = A1_748
    L15_762 = A1_748.setVisualOpacity
    L17_764 = L6_753
    L18_765 = 1
    L15_762(L16_763, L17_764, L18_765)
    L16_763 = A1_748
    L15_762 = A1_748.setHelpParameter
    L17_764 = L6_753
    L18_765 = 0
    L15_762(L16_763, L17_764, L18_765)
  end
  L14_761 = A3_750
  L15_762 = A4_751
  L16_763 = A5_752
  L14_761 = A2_749
  L15_762 = A3_750
  L16_763 = A4_751
  L17_764 = A5_752
  L14_761 = A0_747
  L15_762 = L11_758
  L16_763 = L12_759
  L16_763 = L13_760(L14_761, L15_762, L16_763)
  if L13_760 > 0 then
    L17_764 = "Label_ItemBonus5_"
    L18_765 = tostring
    L18_765 = L18_765(1)
    L17_764 = L17_764 .. L18_765
    L18_765 = A0_747.setItemBonus5Data
    L18_765(A0_747, A1_748, L17_764, L13_760, L14_761, "TBL_null", false)
    if L15_762 > 0 then
      L18_765 = "Label_ItemBonus5_"
      L18_765 = L18_765 .. tostring(2)
      A0_747:setItemBonus5Data(A1_748, L18_765, L15_762, L16_763, "TBL_null", false)
    end
  end
  L18_765 = A1_748
  L17_764 = A1_748.setHelpParameter
  L17_764(L18_765, "Grid_Life", 0)
  L18_765 = A1_748
  L17_764 = A1_748.setHelpParameter
  L17_764(L18_765, "Grid_ItemPolish", 0)
  L18_765 = A1_748
  L17_764 = A1_748.setHelpParameter
  L17_764(L18_765, "Grid_Repair", 0)
  L18_765 = A1_748
  L17_764 = A1_748.setHelpParameter
  L17_764(L18_765, "Grid_RepairItem", 0)
  L18_765 = A1_748
  L17_764 = A1_748.setText
  L17_764(L18_765, "TextBlock_RepairMaterialHeader", 3568)
  L18_765 = A1_748
  L17_764 = A1_748.setText
  L17_764(L18_765, "TextBlock_RepairMaterialName", 3202, A0_747:getItemRepairItem(A2_749, A3_750, A4_751, A5_752), 1)
  L18_765 = A1_748
  L17_764 = A1_748.setHelpParameter
  L17_764(L18_765, "Grid_RepairItem", 1, 73936)
  L18_765 = A1_748
  L17_764 = A1_748.setText
  L17_764(L18_765, "TextBlock_RepairMaterialNum", 3189, 1)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "IconControl_RepairMaterialIcon", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "Border_ItemLife_IconCaution", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "Border_ItemLife_IconDanger", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "TextBlock_ItemLifeHeader", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "TextBlock_ItemLife", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "Grid_ItemPolish", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "TextBlock_Materialize", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "TextBlock_MateriaAttach", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "TextBlock_RepairSkillHeader", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "IconControl_RepairSkill", false)
  L18_765 = A1_748
  L17_764 = A1_748.setVisibility
  L17_764(L18_765, "TextBlock_RepairSkill", false)
  L17_764 = L7_754
  L18_765 = L8_755
  return L17_764, L18_765, L9_756, L10_757
end
L0_0.setItemDetailMateriaItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_766, A1_767, A2_768, A3_769, A4_770, A5_771)
  local L6_772, L7_773, L8_774, L9_775
  L6_772 = true
  L7_773 = false
  L8_774 = false
  L9_775 = false
  if A3_769 ~= nil then
    if A3_769:isFood() or A3_769:isDrink() or A3_769:isPotion() then
      L8_774 = A0_766:setFoodOrPotionItemBonus(A1_767, A2_768, A3_769, A4_770, A5_771)
    end
  elseif A2_768:getListProperty(A4_770, A5_771, "foodpotion") == 1 then
    L8_774 = A0_766:setFoodOrPotionItemBonus(A1_767, A2_768, A3_769, A4_770, A5_771)
  end
  A1_767:setVisibility("Border_ItemLife_IconCaution", false)
  A1_767:setVisibility("Border_ItemLife_IconDanger", false)
  return L6_772, L7_773, L8_774, L9_775
end
L0_0.setItemDetailOtherItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_776, A1_777, A2_778, A3_779, A4_780, A5_781)
  local L6_782, L7_783, L8_784, L9_785, L10_786, L11_787, L12_788, L13_789, L14_790, L15_791, L16_792
  L6_782 = ""
  for L10_786 = 1, 32 do
    L6_782 = L11_787 .. L12_788
    L14_790 = false
    L11_787(L12_788, L13_789, L14_790)
    L14_790 = ":"
    L15_791 = "TextBlock_ParameterDiff"
    L14_790 = false
    L11_787(L12_788, L13_789, L14_790)
    L14_790 = 1
    L11_787(L12_788, L13_789, L14_790)
    L14_790 = 0
    L11_787(L12_788, L13_789, L14_790)
    L14_790 = ":"
    L15_791 = "TextBlock_ParameterHeader"
    L14_790 = 0
    L11_787(L12_788, L13_789, L14_790)
    L14_790 = ":"
    L15_791 = "TextBlock_ParameterDiff"
    L14_790 = 0
    L11_787(L12_788, L13_789, L14_790)
  end
  L10_786 = {}
  if A3_779 ~= nil then
    L10_786 = L13_789
  else
    L14_790 = A5_781
    L15_791 = "fpParamCount"
    if L7_783 > 0 then
      for L14_790 = 1, L7_783 do
        if L14_790 == 1 then
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamKind1")
          L8_784[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamValue1")
          L9_785[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamLimit1")
          L10_786[L14_790] = L15_791
        elseif L14_790 == 2 then
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamKind2")
          L8_784[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamValue2")
          L9_785[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamLimit2")
          L10_786[L14_790] = L15_791
        elseif L14_790 == 3 then
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamKind3")
          L8_784[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamValue3")
          L9_785[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamLimit3")
          L10_786[L14_790] = L15_791
        elseif L14_790 == 4 then
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamKind4")
          L8_784[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamValue4")
          L9_785[L14_790] = L15_791
          L16_792 = A2_778
          L15_791 = A2_778.getListProperty
          L15_791 = L15_791(L16_792, A4_780, A5_781, "fpParamLimit4")
          L10_786[L14_790] = L15_791
        end
      end
    end
  end
  if L7_783 > 0 then
    for L14_790 = 1, L7_783 do
      L15_791 = "Label_ItemBonus5_"
      L16_792 = tostring
      L16_792 = L16_792(L14_790)
      L6_782 = L15_791 .. L16_792
      L16_792 = A1_777
      L15_791 = A1_777.setVisibility
      L15_791(L16_792, L6_782, true)
      L16_792 = A0_776
      L15_791 = A0_776.getItemParamString
      L16_792 = L15_791(L16_792, A1_777, L8_784[L14_790], L9_785[L14_790])
      A1_777:setText(L6_782 .. ":" .. "TextBlock_ParameterHeader", L15_791)
      A1_777:setStyle(L6_782 .. ":" .. "TextBlock_ParameterHeader", "TBL_null")
      A1_777:setText(L6_782 .. ":" .. "TextBlock_ParameterValue", L16_792)
      A1_777:setStyle(L6_782 .. ":" .. "TextBlock_ParameterValue", "TBL_null")
      if L8_784[L14_790] ~= 75 and L10_786[L14_790] > 0 then
        A1_777:setVisibility(L6_782 .. ":" .. "TextBlock_ParameterDiff", true)
        A1_777:setText(L6_782 .. ":" .. "TextBlock_ParameterDiff", 3160, L10_786[L14_790])
        A1_777:setStyle(L6_782 .. ":" .. "TextBlock_ParameterDiff", "TBL_null")
      end
    end
  end
  if A3_779 ~= nil then
  else
    L14_790 = A4_780
    L15_791 = A5_781
    L16_792 = "fpEffectTime"
  end
  if L11_787 > 0 then
    L14_790 = 5
    L6_782 = L12_788 .. L13_789
    L14_790 = L6_782
    L15_791 = true
    L12_788(L13_789, L14_790, L15_791)
    L14_790 = L6_782
    L15_791 = ":"
    L16_792 = "TextBlock_ParameterHeader"
    L14_790 = L14_790 .. L15_791 .. L16_792
    L15_791 = 3554
    L16_792 = 10074
    L12_788(L13_789, L14_790, L15_791, L16_792)
    L14_790 = L6_782
    L15_791 = ":"
    L16_792 = "TextBlock_ParameterHeader"
    L14_790 = L14_790 .. L15_791 .. L16_792
    L15_791 = "TBL_null"
    L12_788(L13_789, L14_790, L15_791)
    L14_790 = L6_782
    L15_791 = ":"
    L16_792 = "TextBlock_ParameterValue"
    L14_790 = L14_790 .. L15_791 .. L16_792
    L15_791 = 3233
    L16_792 = L11_787
    L12_788(L13_789, L14_790, L15_791, L16_792)
    L14_790 = L6_782
    L15_791 = ":"
    L16_792 = "TextBlock_ParameterValue"
    L14_790 = L14_790 .. L15_791 .. L16_792
    L15_791 = "TBL_null"
    L12_788(L13_789, L14_790, L15_791)
  end
  if A3_779 ~= nil then
    L14_790 = A3_779
  else
    L14_790 = A2_778
    L15_791 = A4_780
    L16_792 = A5_781
  end
  if L12_788 > 0 then
    L14_790 = tostring
    L15_791 = 6
    L14_790 = L14_790(L15_791)
    L6_782 = L13_789 .. L14_790
    L14_790 = A1_777
    L15_791 = L6_782
    L16_792 = true
    L13_789(L14_790, L15_791, L16_792)
    L14_790 = A1_777
    L15_791 = L6_782
    L16_792 = ":"
    L15_791 = L15_791 .. L16_792 .. "TextBlock_ParameterHeader"
    L16_792 = 3554
    L13_789(L14_790, L15_791, L16_792, 10063)
    L14_790 = A1_777
    L15_791 = L6_782
    L16_792 = ":"
    L15_791 = L15_791 .. L16_792 .. "TextBlock_ParameterHeader"
    L16_792 = "TBL_null"
    L13_789(L14_790, L15_791, L16_792)
    L14_790 = A1_777
    L15_791 = L6_782
    L16_792 = ":"
    L15_791 = L15_791 .. L16_792 .. "TextBlock_ParameterValue"
    L16_792 = 3233
    L13_789(L14_790, L15_791, L16_792, L12_788)
    L14_790 = A1_777
    L15_791 = L6_782
    L16_792 = ":"
    L15_791 = L15_791 .. L16_792 .. "TextBlock_ParameterValue"
    L16_792 = "TBL_null"
    L13_789(L14_790, L15_791, L16_792)
  end
  return L13_789
end
L0_0.setFoodOrPotionItemBonus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_793, A1_794, A2_795, A3_796, A4_797, A5_798, A6_799, A7_800, A8_801, A9_802, A10_803, A11_804, A12_805, A13_806, A14_807, A15_808)
  local L16_809, L17_810, L18_811, L19_812, L20_813, L21_814, L22_815, L23_816, L24_817, L25_818, L26_819, L27_820, L28_821, L29_822, L30_823, L31_824, L32_825, L33_826, L34_827, L35_828, L36_829, L37_830, L38_831, L39_832, L40_833, L41_834, L42_835, L43_836, L44_837, L45_838, L46_839, L47_840, L48_841
  L16_809 = ""
  L17_810 = false
  L18_811 = false
  L19_812 = false
  L20_813 = false
  L22_815 = A0_793
  L21_814 = A0_793.getItemBonus1
  L23_816 = A12_805
  L24_817 = A2_795
  L25_818 = A3_796
  L26_819 = A4_797
  L29_822 = L21_814(L22_815, L23_816, L24_817, L25_818, L26_819)
  for L33_826 = 1, 3 do
    L34_827 = "Label_ItemBonus1_"
    L35_828 = tostring
    L36_829 = L33_826
    L35_828 = L35_828(L36_829)
    L16_809 = L34_827 .. L35_828
    L34_827 = L33_826
    if L34_827 == 1 then
      L36_829 = A0_793
      L35_828 = A0_793.setItemBonus1
      L35_828 = L35_828(L36_829, L37_830, L38_831, L39_832, L40_833, L41_834)
      if L35_828 then
        L18_811 = true
        do break end
        else
        end
        if L34_827 == 2 then
          L36_829 = A0_793
          L35_828 = A0_793.setItemBonus1
          L35_828 = L35_828(L36_829, L37_830, L38_831, L39_832, L40_833, L41_834)
          if L35_828 then
            L18_811 = true
            do break end
            else
            end
            if L34_827 == 3 then
              if L27_820 == 10105 then
                L35_828 = L22_815 + L28_821
                L35_828 = L35_828 / L25_818
                L36_829 = A0_793.setItemBonus1
                L42_835 = L29_822
                L36_829 = L36_829(L37_830, L38_831, L39_832, L40_833, L41_834, L42_835)
                if L36_829 then
                  L18_811 = true
                end
              else
                L36_829 = A0_793
                L35_828 = A0_793.setItemBonus1
                L35_828 = L35_828(L36_829, L37_830, L38_831, L39_832, L40_833, L41_834)
                if L35_828 then
                  L18_811 = true
                end
              end
            else
            end
          else
          end
      else
      end
  end
  if A14_807 then
    L33_826 = L24_817
    L34_827 = 0
    L35_828 = L26_819
    L36_829 = L27_820
    if A5_798 ~= nil then
      L42_835 = A5_798
      L43_836 = A3_796
      L44_837 = A4_797
      L44_837 = L39_832(L40_833, L41_834, L42_835, L43_836, L44_837)
      L36_829 = L45_838
      L35_828 = L44_837
      L34_827 = L43_836
      L33_826 = L42_835
    end
    for L42_835 = 1, 3 do
      L43_836 = "Label_ItemBonus1_"
      L44_837 = tostring
      L44_837 = L44_837(L45_838)
      L16_809 = L43_836 .. L44_837
      L44_837 = A1_794
      L43_836 = A1_794.setHelpParameter
      L43_836(L44_837, L45_838, L46_839)
      L43_836 = L42_835
      if L43_836 == 1 then
        if L21_814 == L30_823 then
          L44_837 = A0_793.setItemBonusDiff
          L48_841 = L21_814
          L44_837(L45_838, L46_839, L47_840, L48_841, L22_815, L31_824)
        else
          L44_837 = A1_794.setVisibility
          L48_841 = "TextBlock_ParameterDiff"
          L44_837(L45_838, L46_839, L47_840)
          do break end
          else
          end
          if L43_836 == 2 then
            if L24_817 == L33_826 then
              L44_837 = A0_793.setItemBonusDiff
              L48_841 = L24_817
              L44_837(L45_838, L46_839, L47_840, L48_841, L25_818, L34_827)
            else
              L44_837 = A1_794.setVisibility
              L48_841 = "TextBlock_ParameterDiff"
              L44_837(L45_838, L46_839, L47_840)
              do break end
              else
              end
              if L43_836 == 3 then
                if L27_820 == L36_829 then
                  if L27_820 == 10105 then
                    L44_837 = L22_815 + L28_821
                    L44_837 = L44_837 / L25_818
                    if A5_798 ~= nil then
                    end
                    L48_841 = A1_794
                    L46_839(L47_840, L48_841, L16_809, L27_820, L44_837, L45_838)
                  else
                    L44_837 = A0_793.setItemBonusDiff
                    L48_841 = L27_820
                    L44_837(L45_838, L46_839, L47_840, L48_841, L28_821, L37_830)
                  end
                else
                  L44_837 = A1_794.setVisibility
                  L48_841 = "TextBlock_ParameterDiff"
                  L44_837(L45_838, L46_839, L47_840)
                  break
                end
              else
              end
            end
        end
    end
  else
    for L33_826 = 1, 3 do
      L35_828 = A1_794
      L34_827 = A1_794.setVisibility
      L36_829 = "Label_ItemBonus1_"
      L36_829 = L36_829 .. L37_830 .. L38_831 .. L39_832
      L34_827(L35_828, L36_829, L37_830)
    end
  end
  L33_826 = A2_795
  L34_827 = A3_796
  L35_828 = A4_797
  L36_829 = L30_823(L31_824, L32_825, L33_826, L34_827, L35_828)
  for L40_833 = 1, 32 do
    L42_835 = tostring
    L43_836 = L40_833
    L42_835 = L42_835(L43_836)
    L16_809 = L41_834 .. L42_835
    if L41_834 == 1 then
      L43_836 = A0_793
      L42_835 = A0_793.setItemBonus3
      L44_837 = A1_794
      L42_835 = L42_835(L43_836, L44_837, L45_838, L46_839, L47_840)
      if L42_835 then
        L18_811 = true
        do break end
        else
        end
        if L41_834 == 2 then
          L43_836 = A0_793
          L42_835 = A0_793.setItemBonus3
          L44_837 = A1_794
          L42_835 = L42_835(L43_836, L44_837, L45_838, L46_839, L47_840)
          if L42_835 then
            L18_811 = true
            do break end
            else
            end
            if L41_834 == 3 then
              L43_836 = A0_793
              L42_835 = A0_793.setItemBonus3
              L44_837 = A1_794
              L42_835 = L42_835(L43_836, L44_837, L45_838, L46_839, L47_840)
              if L42_835 then
                L18_811 = true
              end
            else
            end
          else
          end
      else
      end
  end
  if A2_795 ~= nil and (A15_808 == nil or A15_808 == false) and A9_802 ~= true and A10_803 ~= true and A8_801 ~= true and A11_804 ~= true then
    L42_835 = A4_797
    L43_836 = A2_795
    if L38_831 == false then
      L42_835 = A3_796
      L43_836 = A4_797
      L42_835 = L38_831(L39_832, L40_833, L41_834, L42_835, L43_836)
    end
  end
  for L41_834 = 1, 32 do
    L42_835 = "Label_ItemBonus5_"
    L43_836 = tostring
    L44_837 = L41_834
    L43_836 = L43_836(L44_837)
    L16_809 = L42_835 .. L43_836
    L43_836 = A1_794
    L42_835 = A1_794.setVisibility
    L44_837 = L16_809
    L44_837 = L44_837 .. L45_838 .. L46_839
    L42_835(L43_836, L44_837, L45_838)
    L43_836 = A1_794
    L42_835 = A1_794.setVisualOpacity
    L44_837 = L16_809
    L42_835(L43_836, L44_837, L45_838)
    L43_836 = A1_794
    L42_835 = A1_794.setVisibility
    L44_837 = L16_809
    L42_835(L43_836, L44_837, L45_838)
    L43_836 = A1_794
    L42_835 = A1_794.setHelpParameter
    L44_837 = L16_809
    L42_835(L43_836, L44_837, L45_838)
  end
  L42_835 = A3_796
  L43_836 = A4_797
  if A5_798 ~= nil then
    L43_836 = A0_793
    L42_835 = A0_793.getItemBonus5
    L44_837 = A12_805
    L43_836 = L42_835(L43_836, L44_837, L45_838, L46_839, L47_840)
  end
  L42_835 = #L38_831
  L43_836 = #L40_833
  L44_837 = 1
  L48_841 = L44_837
  if L45_838 then
    L44_837 = L44_837 + 1
    L19_812 = true
  end
  L48_841 = L44_837
  if L45_838 then
    L44_837 = L44_837 + 1
    L19_812 = true
  end
  L48_841 = L44_837
  if L45_838 then
    L44_837 = L44_837 + 1
    L19_812 = true
  end
  L48_841 = L44_837
  if L45_838 then
    L44_837 = L44_837 + 1
    L19_812 = true
  end
  L48_841 = L44_837
  if L45_838 then
    L44_837 = L44_837 + 1
    L19_812 = true
  end
  L48_841 = L44_837
  if L45_838 then
    L44_837 = L44_837 + 1
    L19_812 = true
  end
  for L48_841 = 15001, 15105 do
    if A0_793:setItemBonus5(A1_794, L44_837, L48_841, L42_835, L38_831, L39_832, L43_836, L40_833, L41_834, A14_807, L37_830) then
      L44_837 = L44_837 + 1
      L19_812 = true
    end
  end
  for L48_841 = 16000, 16010 do
    if A0_793:setItemBonus5(A1_794, L44_837, L48_841, L42_835, L38_831, L39_832, L43_836, L40_833, L41_834, A14_807, L37_830) then
      L44_837 = L44_837 + 1
      L19_812 = true
    end
  end
  for L48_841 = 20000, 20057 do
    if A0_793:setItemBonus5(A1_794, L44_837, L48_841, L42_835, L38_831, L39_832, L43_836, L40_833, L41_834, A14_807, L37_830) then
      L44_837 = L44_837 + 1
      L19_812 = true
    end
  end
  L48_841 = A12_805
  if L45_838 == true then
    L19_812 = true
  end
  L48_841 = A2_795
  L20_813 = L45_838
  L48_841 = L20_813
  return L45_838, L46_839, L47_840, L48_841
end
L0_0.setItemDetailEquipItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_842, A1_843, A2_844, A3_845, A4_846, A5_847, A6_848, A7_849, A8_850, A9_851, A10_852, A11_853, A12_854, A13_855, A14_856)
  local L15_857, L16_858, L17_859, L18_860, L19_861, L20_862, L21_863, L22_864, L23_865, L24_866, L25_867, L26_868, L27_869, L28_870, L29_871, L30_872, L31_873, L32_874, L33_875, L34_876, L35_877, L36_878, L37_879, L38_880, L39_881, L40_882, L41_883, L42_884, L43_885, L44_886, L45_887, L46_888, L47_889
  L15_857 = ""
  L16_858 = false
  L17_859 = false
  L18_860 = false
  L19_861 = false
  L17_859 = true
  L21_863 = A0_842
  L20_862 = A0_842.getItemBonus1
  L22_864 = A2_844
  L23_865 = A3_845
  L24_866 = A4_846
  L25_867 = A5_847
  L28_870 = L20_862(L21_863, L22_864, L23_865, L24_866, L25_867)
  L15_857 = "Label_ItemBonus1_1"
  L32_874 = L15_857
  L33_875 = L20_862
  L34_876 = L21_863
  L35_877 = L22_864
  if L29_871 then
    L17_859 = true
  end
  L15_857 = "Label_ItemBonus1_2"
  L32_874 = L15_857
  L33_875 = L23_865
  L34_876 = L24_866
  L35_877 = L25_867
  if L29_871 then
    L17_859 = true
  end
  L15_857 = "Label_ItemBonus1_3"
  if L26_868 == 10105 then
    L32_874 = A1_843
    L33_875 = L15_857
    L34_876 = L26_868
    L35_877 = L29_871
    if L30_872 then
      L17_859 = true
    end
  else
    L32_874 = L15_857
    L33_875 = L26_868
    L34_876 = L27_869
    L35_877 = L28_870
    if L29_871 then
      L17_859 = true
    end
  end
  if A14_856 then
    L32_874 = A3_845
    L33_875 = A4_846
    L34_876 = A5_847
    L35_877 = L29_871(L30_872, L31_873, L32_874, L33_875, L34_876)
    L33_875 = L33_875 * A13_855
    for L41_883 = 1, 3 do
      L42_884 = "Label_ItemBonus1_"
      L43_885 = tostring
      L43_885 = L43_885(L44_886)
      L15_857 = L42_884 .. L43_885
      L43_885 = A1_843
      L42_884 = A1_843.setHelpParameter
      L42_884(L43_885, L44_886, L45_887)
      L42_884 = L41_883
      if L42_884 == 1 then
        if L20_862 > 0 and L21_863 ~= L30_872 then
          L43_885 = A0_842.setItemBonusDiffDegrade
          L47_889 = L20_862
          L43_885(L44_886, L45_887, L46_888, L47_889, L21_863, L30_872)
        else
          L43_885 = A1_843.setVisibility
          L47_889 = "TextBlock_ParameterDiff"
          L43_885(L44_886, L45_887, L46_888)
          do break end
          else
          end
          if L42_884 == 2 then
            if L23_865 > 0 and L24_866 ~= L33_875 then
              L43_885 = A0_842.setItemBonusDiffDegrade
              L47_889 = L23_865
              L43_885(L44_886, L45_887, L46_888, L47_889, L24_866, L33_875)
            else
              L43_885 = A1_843.setVisibility
              L47_889 = "TextBlock_ParameterDiff"
              L43_885(L44_886, L45_887, L46_888)
              do break end
              else
              end
              if L42_884 == 3 then
                if L26_868 == 10105 then
                  L43_885 = A1_843.setVisibility
                  L47_889 = "TextBlock_ParameterDiff"
                  L43_885(L44_886, L45_887, L46_888)
                elseif L26_868 > 0 and L27_869 ~= L36_878 then
                  L43_885 = A0_842.setItemBonusDiffDegrade
                  L47_889 = L26_868
                  L43_885(L44_886, L45_887, L46_888, L47_889, L27_869, L36_878)
                else
                  L43_885 = A1_843.setVisibility
                  L47_889 = "TextBlock_ParameterDiff"
                  L43_885(L44_886, L45_887, L46_888)
                  break
                end
              else
              end
            end
        end
    end
  else
    for L32_874 = 1, 3 do
      L34_876 = A1_843
      L33_875 = A1_843.setVisibility
      L35_877 = "Label_ItemBonus1_"
      L35_877 = L35_877 .. L36_878 .. L37_879 .. L38_880
      L33_875(L34_876, L35_877, L36_878)
    end
  end
  L32_874 = A3_845
  L33_875 = A4_846
  L34_876 = A5_847
  L35_877 = L29_871(L30_872, L31_873, L32_874, L33_875, L34_876)
  for L39_881 = 1, 32 do
    L41_883 = tostring
    L42_884 = L39_881
    L41_883 = L41_883(L42_884)
    L15_857 = L40_882 .. L41_883
    if L40_882 == 1 then
      L42_884 = A0_842
      L41_883 = A0_842.setItemBonus3
      L43_885 = A1_843
      L41_883 = L41_883(L42_884, L43_885, L44_886, L45_887, L46_888)
      if L41_883 then
        L17_859 = true
        do break end
        else
        end
        if L40_882 == 2 then
          L42_884 = A0_842
          L41_883 = A0_842.setItemBonus3
          L43_885 = A1_843
          L41_883 = L41_883(L42_884, L43_885, L44_886, L45_887, L46_888)
          if L41_883 then
            L17_859 = true
            do break end
            else
            end
            if L40_882 == 3 then
              L42_884 = A0_842
              L41_883 = A0_842.setItemBonus3
              L43_885 = A1_843
              L41_883 = L41_883(L42_884, L43_885, L44_886, L45_887, L46_888)
              if L41_883 then
                L17_859 = true
              end
            else
            end
          else
          end
      else
      end
  end
  if A3_845 ~= nil and A9_851 ~= true and A10_852 ~= true and A8_850 ~= true and A11_853 ~= true then
    L41_883 = A5_847
    L42_884 = A3_845
    if L37_879 == false then
      L41_883 = A4_846
      L42_884 = A5_847
      L41_883 = L37_879(L38_880, L39_881, L40_882, L41_883, L42_884)
    end
  end
  for L40_882 = 1, 32 do
    L41_883 = "Label_ItemBonus5_"
    L42_884 = tostring
    L43_885 = L40_882
    L42_884 = L42_884(L43_885)
    L15_857 = L41_883 .. L42_884
    L42_884 = A1_843
    L41_883 = A1_843.setVisibility
    L43_885 = L15_857
    L43_885 = L43_885 .. L44_886 .. L45_887
    L41_883(L42_884, L43_885, L44_886)
    L42_884 = A1_843
    L41_883 = A1_843.setVisualOpacity
    L43_885 = L15_857
    L41_883(L42_884, L43_885, L44_886)
    L42_884 = A1_843
    L41_883 = A1_843.setVisibility
    L43_885 = L15_857
    L41_883(L42_884, L43_885, L44_886)
    L42_884 = A1_843
    L41_883 = A1_843.setHelpParameter
    L43_885 = L15_857
    L41_883(L42_884, L43_885, L44_886)
  end
  L41_883 = A4_846
  L42_884 = A5_847
  L41_883 = #L37_879
  L42_884 = #L39_881
  L43_885 = 1
  L47_889 = L43_885
  if L44_886 then
    L43_885 = L43_885 + 1
    L18_860 = true
  end
  L47_889 = L43_885
  if L44_886 then
    L43_885 = L43_885 + 1
    L18_860 = true
  end
  L47_889 = L43_885
  if L44_886 then
    L43_885 = L43_885 + 1
    L18_860 = true
  end
  L47_889 = L43_885
  if L44_886 then
    L43_885 = L43_885 + 1
    L18_860 = true
  end
  L47_889 = L43_885
  if L44_886 then
    L43_885 = L43_885 + 1
    L18_860 = true
  end
  L47_889 = L43_885
  if L44_886 then
    L43_885 = L43_885 + 1
    L18_860 = true
  end
  for L47_889 = 15001, 15105 do
    if A0_842:setItemBonus5(A1_843, L43_885, L47_889, L41_883, L37_879, L38_880, L42_884, L39_881, L40_882, false, L36_878) then
      L43_885 = L43_885 + 1
      L18_860 = true
    end
  end
  for L47_889 = 16001, 16010 do
    if A0_842:setItemBonus5(A1_843, L43_885, L47_889, L41_883, L37_879, L38_880, L42_884, L39_881, L40_882, false, L36_878) then
      L43_885 = L43_885 + 1
      L18_860 = true
    end
  end
  for L47_889 = 20000, 20057 do
    if A0_842:setItemBonus5(A1_843, L43_885, L47_889, L41_883, L37_879, L38_880, L42_884, L39_881, L40_882, false, L36_878) then
      L43_885 = L43_885 + 1
      L18_860 = true
    end
  end
  if A14_856 then
    for L47_889 = 1, 32 do
      L15_857 = "Label_ItemBonus5_" .. tostring(L47_889)
      A1_843:setVisualOpacity(L15_857, 0.5)
    end
  end
  L47_889 = A2_844
  if L44_886 == true then
    L18_860 = true
  end
  L47_889 = A3_845
  L19_861 = L44_886
  L47_889 = L19_861
  return L44_886, L45_887, L46_888, L47_889
end
L0_0.setItemDetailDegradeEquipItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_890, A1_891, A2_892, A3_893)
  if A1_891:_getItem(A2_892, A3_893) ~= nil then
    return A1_891:_getItem(A2_892, A3_893):_getCatalogID(), A1_891:_getItem(A2_892, A3_893):_countStack()
  end
end
L0_0.getItemInfo = L1_1
L0_0 = DesktopWidget
function L1_1(A0_894, A1_895, A2_896, A3_897, A4_898, A5_899)
  local L6_900, L7_901, L8_902, L9_903, L10_904, L11_905, L12_906, L13_907, L14_908, L15_909
  if A4_898 == nil then
    A4_898 = 1
  end
  L7_901 = A2_896
  L6_900 = A2_896.getItemRepairItem
  L6_900 = L6_900(L7_901)
  L7_901 = 1
  if A5_899 == nil then
    L8_902 = worldMaster
    L9_903 = L8_902
    L8_902 = L8_902._getMyPlayer
    L8_902 = L8_902(L9_903)
    L9_903 = L8_902
    L8_902 = L8_902.createVirtualItem
    L10_904 = L6_900
    L8_902 = L8_902(L9_903, L10_904)
    A5_899 = L8_902
  end
  L9_903 = A5_899
  L8_902 = A5_899.getItemIcon
  L8_902 = L8_902(L9_903)
  L10_904 = A1_895
  L9_903 = A1_895.packTextParameter
  L11_905 = 3202
  L9_903 = L9_903(L10_904, L11_905, L12_906, L13_907)
  L11_905 = A1_895
  L10_904 = A1_895.setIcon
  L10_904(L11_905, L12_906, L13_907)
  L11_905 = A1_895
  L10_904 = A1_895.setText
  L10_904(L11_905, L12_906, L13_907)
  L11_905 = A1_895
  L10_904 = A1_895.setText
  L10_904(L11_905, L12_906, L13_907, L14_908)
  L10_904 = 0
  L11_905 = A3_897.getItemPackageItemCount
  L11_905 = L11_905(L12_906, L13_907)
  for L15_909 = 1, L11_905 do
    if A0_894:getItemInfo(A3_897, A4_898, L15_909) == L6_900 then
      L10_904 = L10_904 + A0_894:getItemInfo(A3_897, A4_898, L15_909)
    end
  end
  if L7_901 > L10_904 then
    L15_909 = "TBL_parameterMinus"
    L12_906(L13_907, L14_908, L15_909)
  else
    L15_909 = "TBL_parameterPlus"
    L12_906(L13_907, L14_908, L15_909)
  end
  L15_909 = 225
  L12_906(L13_907, L14_908, L15_909, L10_904)
end
L0_0.setItemCatalyst = L1_1
L0_0 = DesktopWidget
function L1_1(A0_910, A1_911, A2_912, A3_913, A4_914, A5_915)
  local L6_916, L7_917, L8_918, L9_919, L10_920, L11_921, L12_922, L13_923, L14_924, L15_925, L16_926, L17_927
  L7_917 = A0_910
  L6_916 = A0_910.getItemBase
  L8_918 = A1_911
  L9_919 = A2_912
  L17_927 = L6_916(L7_917, L8_918, L9_919)
  A1_911:setIcon("IconControl_Materialize", L8_918)
  A1_911:setText("TextBlock_TargetItemName", L17_927)
  A0_910:setVisibilityBadgeIcons(A1_911, A2_912, 2, A4_914, A5_915)
  A0_910:setMateriaListItems(A1_911, A2_912)
  if A2_912:getNormalItemMateriaFreeIndex() == 1 then
    A1_911:setVisibility("Grid_MateriaEquipList", false)
  end
end
L0_0.setItemMateriaInstall = L1_1
L0_0 = DesktopWidget
function L1_1(A0_928, A1_929, A2_930)
  A1_929:setText("TextBlock_RankText", 3617, A0_928:getItemRank(A1_929, A2_930))
  A1_929:setIcon("IconControl_ClassIcon", A0_928:getSkillIcon(A2_930:getItemRepairSkill()))
  A1_929:setText("TextBlock_ClassName", 206, A2_930:getItemRepairSkill())
  if worldMaster:_getMyPlayer():getStateMainSkill() ~= A2_930:getItemRepairSkill() then
    A1_929:setStyle("TextBlock_ClassName", "TBL_parameterMinus")
    A1_929:setStyle("TextBlock_RankText", "TBL_parameterMinus")
  elseif A0_928:getItemRank(A1_929, A2_930) > worldMaster:_getMyPlayer():getStateMainSkillLevel() then
    A1_929:setStyle("TextBlock_RankText", "TBL_parameterMinus")
  end
end
L0_0.setItemMateriaInstallSkill = L1_1
L0_0 = DesktopWidget
function L1_1(A0_931, A1_932, A2_933, A3_934)
  local L4_935, L5_936, L6_937, L7_938, L8_939, L9_940, L10_941, L11_942
  L4_935 = _math
  L4_935 = L4_935.floor
  L5_936 = A3_934 * 100
  L4_935 = L4_935(L5_936)
  L5_936 = L4_935 / 100
  L6_937 = _math
  L6_937 = L6_937.floor
  L7_938 = L5_936
  L6_937 = L6_937(L7_938)
  L7_938 = L6_937 * 100
  L7_938 = L4_935 - L7_938
  L8_939 = tostring
  L9_940 = L6_937
  L8_939 = L8_939(L9_940)
  L9_940 = _string
  L9_940 = L9_940.format
  L10_941 = "%02d"
  L11_942 = L7_938
  L9_940 = L9_940(L10_941, L11_942)
  L11_942 = A1_932
  L10_941 = A1_932.setText
  L10_941(L11_942, "TextBlock_SuccessRateNumber", 3570, L8_939, L9_940)
  L10_941 = 3578
  L11_942 = "TBL_parameterPlus"
  if L5_936 == 100 then
    L10_941 = 3575
    L11_942 = "TBL_parameterPlus"
  elseif L5_936 > 50 then
    L10_941 = 3576
    L11_942 = "TBL_null"
  elseif L5_936 > 25 then
    L10_941 = 3577
    L11_942 = "TBL_parameterCaution"
  else
    L10_941 = 3578
    L11_942 = "TBL_parameterDanger"
  end
  A1_932:setStyle("TextBlock_SuccessRateNumber", L11_942)
  A1_932:setStyle("TextBlock_CatalystText", L11_942)
  A1_932:setText("TextBlock_CatalystText", L10_941, L6_937)
end
L0_0.setItemMateriaInstallRate = L1_1
L0_0 = DesktopWidget
function L1_1(A0_943, A1_944)
  local L2_945, L3_946
  L2_945 = 0
  L3_946 = false
  if A1_944:isEquipment() then
    L2_945 = A0_943:getAttachedMateriaCountByItem(A1_944)
    L3_946 = A1_944:getMateriaBindPermission()
  end
  return L2_945, L3_946
end
L0_0.getItemMateriaAttachInfo = L1_1
L0_0 = DesktopWidget
function L1_1(A0_947, A1_948, A2_949, A3_950, A4_951, A5_952)
  local L6_953
  L6_953 = A1_948.getListProperty
  L6_953 = L6_953(A1_948, A2_949, A3_950, "sorttype")
  return _string.sub(L6_953, A4_951, A5_952)
end
L0_0.getItemSortKey = L1_1
L0_0 = DesktopWidget
function L1_1(A0_954, A1_955)
  return worldMaster:_getMyPlayer():isJob(A1_955)
end
L0_0.isJob = L1_1
L0_0 = DesktopWidget
function L1_1(A0_956, A1_957)
  local L2_958
  L2_958 = false
  if A1_957 ~= nil and A1_957:_isAlive() then
    L2_958 = _isInstanceOf(A1_957, "PopulaceBlackMarketeer")
  end
  return L2_958
end
L0_0.isBlackMarketeer = L1_1
L0_0 = DesktopWidget
function L1_1(A0_959, A1_960)
  local L2_961, L3_962, L4_963, L5_964, L6_965, L7_966, L8_967
  for L5_964 = 42, 79 do
    L6_965 = "IconControl_MateriaSlot_"
    L7_966 = tostring
    L8_967 = L5_964
    L7_966 = L7_966(L8_967)
    L6_965 = L6_965 .. L7_966
    L8_967 = A1_960
    L7_966 = A1_960.getUserWorkInt
    L7_966 = L7_966(L8_967, 1, nil, L6_965)
    L8_967 = A1_960.getUserWorkInt
    L8_967 = L8_967(A1_960, 2, nil, L6_965)
    A1_960:setHelpParameter(L6_965, 1, L7_966, L8_967)
  end
end
L0_0.setMateriaAttachSlotIconHelp = L1_1
L0_0 = DesktopWidget
function L1_1(A0_968, A1_969, A2_970, A3_971)
  local L4_972, L5_973, L6_974
  if A1_969 == 0 then
    L5_973 = "#ffe57a45"
    L4_972 = 3186
    L6_974 = 73916
  else
    L5_973 = "#ff99ffb3"
    if A1_969 == 1 then
      L4_972 = 3177
      L6_974 = 73915
    elseif A1_969 == 2 then
      L4_972 = 3178
      L6_974 = 73915
    elseif A1_969 == 3 then
      L4_972 = 3179
      L6_974 = 73955
    elseif A1_969 == 4 then
      L4_972 = 3180
      L6_974 = 73955
    end
  end
  A2_970:setContent(A3_971, L4_972)
  A2_970:setControlProperty(A3_971, "Foreground", L5_973)
  A2_970:setHelpParameter(A3_971, 1, L6_974)
end
L0_0.displaySortType = L1_1
L0_0 = DesktopWidget
function L1_1(A0_975, A1_976)
  if A1_976 == 0 then
    A1_976 = 1
  elseif A1_976 == 1 then
    A1_976 = 2
  elseif A1_976 == 2 then
    A1_976 = 3
  elseif A1_976 == 3 then
    A1_976 = 4
  else
    A1_976 = 0
  end
  return A1_976
end
L0_0.changeSortType = L1_1
L0_0 = DesktopWidget
function L1_1(A0_977, A1_978)
  if A1_978 ~= A0_977:getConfigWork(9) and A1_978 <= 4 then
    A0_977:setConfigWorkWithSave(9, A1_978)
  end
end
L0_0.saveSortType = L1_1
