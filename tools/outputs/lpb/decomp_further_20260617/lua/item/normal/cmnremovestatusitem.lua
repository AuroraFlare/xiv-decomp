require("/Item/Normal/NormalItemBaseClass")
_defineClass("CmnRemoveStatusItem", "NormalItemBaseClass")
function CmnRemoveStatusItem.canUseDetail(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11, L12_12
  L11_11 = true
  L12_12 = 0
  return L11_11, L12_12
end
function CmnRemoveStatusItem.canUseForRelation(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = true
  L2_15 = true
  L3_16 = false
  return L1_14, L2_15, L3_16
end
