require("/Command/System/SystemCommandBaseClass")
_defineClass("CheckCommand", "SystemCommandBaseClass")
function CheckCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not _isInstanceOf(A6_6, "CharaBaseClass") then
    return false
  end
  if not A6_6:isPlayer() then
    return false
  end
  return true
end
