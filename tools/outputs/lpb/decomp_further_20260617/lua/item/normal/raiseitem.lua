require("/Item/Normal/NormalItemBaseClass")
_defineClass("RaiseItem", "NormalItemBaseClass")
function RaiseItem.canUseForRelation(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = true
  L2_2 = true
  L3_3 = false
  return L1_1, L2_2, L3_3
end
function RaiseItem.canUseForDeadTarget(A0_4)
  local L1_5
  L1_5 = true
  return L1_5
end
function RaiseItem.canUseForLiveTarget(A0_6)
  local L1_7
  L1_7 = false
  return L1_7
end
function RaiseItem.canUseDetail(A0_8, A1_9, A2_10, A3_11, A4_12, A5_13, A6_14, A7_15, A8_16, A9_17, A10_18)
  local L11_19, L12_20
  L11_19 = true
  L12_20 = 0
  return L11_19, L12_20
end
