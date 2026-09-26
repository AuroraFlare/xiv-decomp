require("/Item/Normal/NormalItemBaseClass")
_defineClass("FoodItem", "NormalItemBaseClass")
function FoodItem.canUseDetail(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11, L12_12
  L11_11 = true
  L12_12 = 0
  return L11_11, L12_12
end
function FoodItem.getItemParam1AdjustForHighLevelUse(A0_13, A1_14, A2_15, A3_16)
  local L4_17
  L4_17 = 0
  return L4_17
end
function FoodItem.getItemParam2AdjustForHighLevelUse(A0_18, A1_19, A2_20, A3_21)
  local L4_22
  L4_22 = 0
  return L4_22
end
function FoodItem.getItemParam3AdjustForHighLevelUse(A0_23, A1_24, A2_25, A3_26)
  local L4_27
  L4_27 = 0
  return L4_27
end
function FoodItem.getItemParam4AdjustForHighLevelUse(A0_28, A1_29, A2_30, A3_31)
  local L4_32
  L4_32 = 0
  return L4_32
end
function FoodItem.getItemParam1AdjustForLowLevelUse(A0_33, A1_34, A2_35, A3_36)
  local L4_37
  L4_37 = 0
  return L4_37
end
function FoodItem.getItemParam2AdjustForLowLevelUse(A0_38, A1_39, A2_40, A3_41)
  local L4_42
  L4_42 = 0
  return L4_42
end
function FoodItem.getItemParam3AdjustForLowLevelUse(A0_43, A1_44, A2_45, A3_46)
  local L4_47
  L4_47 = 0
  return L4_47
end
function FoodItem.getItemParam4AdjustForLowLevelUse(A0_48, A1_49, A2_50, A3_51)
  local L4_52
  L4_52 = 0
  return L4_52
end
function FoodItem.canUseForRelation(A0_53)
  if A0_53:_getCatalogID() == 3010418 then
    return true, true, false
  else
    return true, false, false
  end
end
