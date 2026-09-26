require("/Command/System/SystemCommandBaseClass")
_defineClass("DiceCommand", "SystemCommandBaseClass")
function DiceCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11
  L11_11 = A1_1.isLiving
  L11_11 = L11_11(A1_1)
  if not L11_11 then
    L11_11 = false
    return L11_11
  end
  L11_11 = tonumber
  L11_11 = L11_11(A2_2)
  if (type(L11_11) == "nil" or type(L11_11) == "number") and (L11_11 == nil or L11_11 >= 1 and L11_11 <= 1000) then
    return true
  end
  return false
end
function DiceCommand.isEnabled(A0_12)
  local L1_13
  L1_13 = true
  return L1_13
end
