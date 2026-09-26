require("/Command/System/ConfirmRaiseCommand_raise")
require("/Command/System/SystemCommandBaseClass")
_defineClass("ConfirmRaiseCommand", "SystemCommandBaseClass")
function ConfirmRaiseCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11, L12_12
  L12_12 = A1_1
  L11_11 = A1_1.isLiving
  L11_11 = L11_11(L12_12)
  if L11_11 then
    L11_11 = false
    return L11_11
  end
  L12_12 = A1_1
  L11_11 = A1_1.getConfirmRaiseCommandVariation
  L11_11 = L11_11(L12_12)
  L12_12 = A0_0.canFireDetail
  L12_12 = L12_12(A0_0, A1_1, L11_11)
  return A2_2 == L11_11 and L12_12
end
function ConfirmRaiseCommand.fire(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18, A6_19, A7_20, A8_21, A9_22, A10_23)
  local L11_24
  L11_24 = false
  return L11_24
end
function ConfirmRaiseCommand.isEnabled(A0_25)
  return worldMaster:_getMyPlayer():getConfirmRaiseCommandVariation() ~= nil and worldMaster:_getMyPlayer():getConfirmRaiseCommandVariation() >= 40000 and worldMaster:_getMyPlayer():getConfirmRaiseCommandVariation() <= 49999
end
