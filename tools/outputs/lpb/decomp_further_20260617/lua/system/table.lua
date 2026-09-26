local L0_0, L1_1
L0_0 = Table
function L1_1(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  L3_5 = {}
  for L7_9, L8_10 in L4_6(L5_7) do
    L3_5[L7_9] = A2_4(L8_10)
  end
  return L3_5
end
L0_0.map = L1_1
L0_0 = Table
function L1_1(A0_11, A1_12, A2_13)
  local L3_14, L4_15, L5_16
  for _FORV_6_ = 1, #A1_12 do
    if A1_12[_FORV_6_] == A2_13 then
      return true
    end
  end
  return L3_14
end
L0_0.contains = L1_1
