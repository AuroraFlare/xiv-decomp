require("/Command/System/SystemCommandBaseClass")
_defineClass("EmoteStandardCommand", "SystemCommandBaseClass")
function EmoteStandardCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not A1_1:isLiving() then
    return false
  end
  if A2_2 == 146 and A1_1:_getBelongGrandCompany() ~= 1 then
    return false
  end
  if A2_2 == 148 and A1_1:_getBelongGrandCompany() ~= 3 then
    return false
  end
  if A2_2 == 147 and A1_1:_getBelongGrandCompany() ~= 2 then
    return false
  end
  if A2_2 == 156 and worldMaster:_getSpecialEventWork(9) ~= 18 then
    return false
  end
  return true
end
function EmoteStandardCommand.fire(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17, A7_18, A8_19, A9_20, A10_21)
  if not A0_11:canFire(A1_12, A2_13, A3_14, A4_15, A5_16, A6_17, A7_18, A8_19, A9_20, A10_21) then
    return true
  end
  if _isInstanceOf(A6_17, "NpcBaseClass") and A1_12:_executeEmote(A6_17, A2_13) then
    return true
  end
  return false
end
