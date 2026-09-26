require("/Command/System/SystemCommandBaseClass")
_defineClass("ContinueCommand", "SystemCommandBaseClass")
function ContinueCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  return A1_1:getHP() == 0
end
function ContinueCommand.fire(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17, A7_18, A8_19, A9_20, A10_21)
  local L11_22
  L11_22 = false
  return L11_22
end
function ContinueCommand.isEnabled(A0_23)
  return worldMaster:_getMyPlayer():getHP() == 0
end
