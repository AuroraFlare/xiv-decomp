require("/Command/System/SystemCommandBaseClass")
_defineClass("RepairOrderCommand", "SystemCommandBaseClass")
function RepairOrderCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not A1_1:isPlayer() then
    return false
  end
  if not A1_1:isMyPlayer() then
    return false
  end
  if A1_1:isLiving() == false then
    return false
  end
  if type(A2_2) ~= "number" then
    return false
  end
  if A2_2 == 0 or A2_2 == 1 or A2_2 == 2 or A2_2 == 3 then
    return true
  end
  return false
end
