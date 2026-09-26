local L0_0, L1_1
L0_0 = Math
function L1_1(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8)
  local L7_9, L8_10, L9_11
  L7_9 = A4_6 - A1_3
  L8_10 = A5_7 - A2_4
  L9_11 = A6_8 - A3_5
  return _math.sqrt(L7_9 * L7_9 + L8_10 * L8_10 + L9_11 * L9_11)
end
L0_0.distance = L1_1
L0_0 = Math
function L1_1(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18)
  local L7_19, L8_20, L9_21, L10_22, L11_23
  L7_19 = A4_16 - A1_13
  L8_20 = A5_17 - A2_14
  L9_21 = A6_18 - A3_15
  L10_22 = L7_19 * L7_19
  L11_23 = L8_20 * L8_20
  L10_22 = L10_22 + L11_23
  L11_23 = L9_21 * L9_21
  L10_22 = L10_22 + L11_23
  return L10_22
end
L0_0.distance2 = L1_1
L0_0 = Math
function L1_1(A0_24, A1_25, A2_26)
  if A2_26 == 0 then
    return A1_25
  else
    return A0_24:gcm(A2_26, A1_25 % A2_26)
  end
end
L0_0.gcm = L1_1
