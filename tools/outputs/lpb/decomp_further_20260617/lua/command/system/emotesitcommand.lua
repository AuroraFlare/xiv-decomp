require("/Command/System/SystemCommandBaseClass")
_defineClass("EmoteSitCommand", "SystemCommandBaseClass")
function EmoteSitCommand.mapActorMainStat(A0_0, A1_1)
  local L2_2
  if A1_1 == 10001 then
    L2_2 = 13
  elseif A1_1 == 10002 then
    L2_2 = 11
  else
    if A1_1 == nil then
      L2_2 = 0
    else
    end
  end
  return L2_2
end
function EmoteSitCommand.canFire(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10, A8_11, A9_12, A10_13)
  local L11_14
  L11_14 = A1_4.isLiving
  L11_14 = L11_14(A1_4)
  if not L11_14 then
    L11_14 = false
    return L11_14
  end
  L11_14 = A2_5
  if L11_14 ~= nil and L11_14 ~= A1_4:getEmoteSitCommandVariation() then
    return false
  end
  return A0_3:mapActorMainStat(L11_14) ~= nil
end
function EmoteSitCommand.fire(A0_15, A1_16, A2_17, A3_18, A4_19, A5_20, A6_21, A7_22, A8_23, A9_24, A10_25)
  local L11_26
  L11_26 = false
  return L11_26
end
