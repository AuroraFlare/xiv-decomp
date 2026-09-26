require("/Command/System/SystemCommandBaseClass")
_defineClass("BazaarDealCommand", "SystemCommandBaseClass")
function BazaarDealCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not A1_1:isPlayer() then
    return false
  end
  if not A1_1:isMyPlayer() then
    return false
  end
  if not A6_6:isPlayer() then
    if _isInstanceOf(A6_6, "RetainerBaseClass") == false then
      return false
    end
  elseif A6_6 ~= A1_1 then
    return false
  end
  if type(A4_4) == "number" then
  else
  end
  if A2_2 == nil then
    return false
  end
  if 10 == 40 then
    if _isInstanceOf(A2_2, "ItemBaseClass") == false then
      return false
    end
    if A2_2:isEquipment() == false then
      return false
    end
    if A2_2:getNormalItemMateriaFreeIndex() == 0 then
      return false
    end
    if 0 < A2_2:getMateriaAttachedCount() then
      return false
    end
    if _isInstanceOf(A3_3, "ItemBaseClass") == false then
      return false
    end
    if A3_3:isEnchantMateria() == false then
      return false
    end
  elseif _math.floor(10 / 10) * 10 == 10 then
    if _isInstanceOf(A2_2, "ItemBaseClass") == false then
      return false
    end
    if A2_2:_isAlive() == false then
      return false
    end
    if type(A3_3) == "number" and A3_3 < 1 then
      return false
    end
  elseif type(A2_2) == "number" then
    if A2_2 < 1 then
      return false
    end
    if A2_2 == 1000001 and A7_7 > A1_1:getMoneyOnHand(1000001) then
      return false
    end
  end
  return true
end
