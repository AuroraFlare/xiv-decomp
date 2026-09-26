require("/Item/Normal/NormalItemBaseClass")
_defineClass("EnchantMedicineItem", "NormalItemBaseClass")
function EnchantMedicineItem.canUseDetail(A0_0)
  local L1_1, L2_2
  L1_1 = true
  L2_2 = 0
  return L1_1, L2_2
end
function EnchantMedicineItem.canUseForRelation(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = true
  L2_5 = false
  L3_6 = false
  return L1_4, L2_5, L3_6
end
