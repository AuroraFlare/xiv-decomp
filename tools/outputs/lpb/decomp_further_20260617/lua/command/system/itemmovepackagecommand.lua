require("/Command/System/SystemCommandBaseClass")
_defineClass("ItemMovePackageCommand", "SystemCommandBaseClass")
function ItemMovePackageCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not A1_1:isPlayer() then
    return false
  end
  if not A1_1:isMyPlayer() then
    return false
  end
  if A1_1:_hasItemPackage(A4_4) == false then
    return false
  end
  if A1_1:_hasItemPackage(A3_3) == false then
    return false
  end
  if A2_2:_isAlive() == false then
    return false
  end
  if A2_2:_getPackage() ~= A4_4 then
    return false
  end
  if A7_7 < 1 then
    return false
  end
  return true
end
