require("/Command/System/SystemCommandBaseClass")
_defineClass("TalkCommand", "SystemCommandBaseClass")
function TalkCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if A1_1:isActiveMode() and not A1_1:_isActorMainStatMode(2) then
    return false
  end
  if not A1_1:isLiving() then
    return false
  end
  if _isInstanceOf(A6_6, "NpcBaseClass") then
    return A1_1:_canExecuteTalk(A6_6)
  else
    return false
  end
end
function TalkCommand.fire(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17, A7_18, A8_19, A9_20, A10_21)
  local L11_22, L12_23, L13_24, L14_25, L15_26, L16_27
  L12_23 = A1_12
  L11_22 = A1_12._getPos
  L13_24 = L11_22(L12_23)
  L15_26 = A6_17
  L14_25 = A6_17._getPos
  L16_27 = L14_25(L15_26)
  if A6_17:getLimitedDistanceForTalk() <= math:distance(L11_22, L12_23, L13_24, L14_25, L15_26, L16_27) then
    worldMaster:alert(worldMaster, 25081)
    return true
  end
  A1_12:_executeTalk(A6_17)
  return true
end
