require("/Command/System/SystemCommandBaseClass")
_defineClass("LinkshellChangeCommand", "SystemCommandBaseClass")
function LinkshellChangeCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if A1_1 == nil then
    return false
  end
  if A1_1:_isAlive() == false then
    return false
  end
  if A1_1:isPlayer() == false then
    return false
  end
  if type(A4_4) == "nil" then
    return false
  end
  if A4_4 == 1 then
    if type(A2_2) == "nil" then
      return true
    end
    if type(A2_2) == "string" then
      return true
    end
  end
  return false
end
