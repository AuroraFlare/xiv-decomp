require("/Command/Game/GameCommandBaseClass")
_defineClass("CombinationStartCommand", "GameCommandBaseClass")
function CombinationStartCommand.useWeaponRangeInformation(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = true
  L5_5 = true
  return L4_4, L5_5
end
function CombinationStartCommand.canAimForRelation(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = false
  L2_8 = false
  L3_9 = true
  return L1_7, L2_8, L3_9
end
function CombinationStartCommand.canFireForRelation(A0_10)
  local L1_11, L2_12, L3_13
  L1_11 = false
  L2_12 = false
  L3_13 = true
  return L1_11, L2_12, L3_13
end
function CombinationStartCommand.getCommandRangeCode(A0_14, A1_15, A2_16)
  local L3_17
  L3_17 = 2
  return L3_17
end
function CombinationStartCommand.getCommandTargettingMode(A0_18, A1_19, A2_20)
  local L3_21
  L3_21 = 1
  return L3_21
end
function CombinationStartCommand.isUseActionGauge(A0_22)
  local L1_23
  L1_23 = false
  return L1_23
end
