require("/Command/System/SystemCommandBaseClass")
_defineClass("RepairEquipmentsCommand", "SystemCommandBaseClass")
function RepairEquipmentsCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not A1_1:isPlayer() then
    return false
  end
  if not A1_1:isMyPlayer() then
    return false
  end
  if A6_6 == nil then
    return false
  end
  if A6_6:_isAlive() == false then
    return false
  end
  if not A6_6:isPlayer() then
    return false
  end
  if A1_1 == A6_6 then
    return false
  end
  if A1_1:isLiving() == false then
    return false
  end
  if A6_6:isLiving() == false then
    return false
  end
  if A1_1:isActiveMode() == true then
    return false
  end
  if type(A2_2) ~= "number" then
    return false
  end
  if A2_2 < 1 then
    return false
  end
  return true
end
function RepairEquipmentsCommand.processResultRepair(A0_11, A1_12, A2_13)
end
