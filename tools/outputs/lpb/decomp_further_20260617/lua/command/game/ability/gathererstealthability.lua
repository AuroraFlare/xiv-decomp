require("/Command/Game/Ability/AbilityBaseClass")
_defineClass("GathererStealthAbility", "AbilityBaseClass")
function GathererStealthAbility.isAbilityCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function GathererStealthAbility.canAimForRelation(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = true
  L2_4 = false
  L3_5 = false
  return L1_3, L2_4, L3_5
end
function GathererStealthAbility.canAimParts(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14
  L1_7 = true
  L2_8 = false
  L3_9 = false
  L4_10 = false
  L5_11 = false
  L6_12 = false
  L7_13 = false
  L8_14 = false
  return L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14
end
function GathererStealthAbility.canFireForRelation(A0_15)
  local L1_16, L2_17, L3_18
  L1_16 = true
  L2_17 = false
  L3_18 = false
  return L1_16, L2_17, L3_18
end
function GathererStealthAbility.useWeaponRangeInformation(A0_19)
  local L1_20, L2_21
  L1_20 = false
  L2_21 = false
  return L1_20, L2_21
end
function GathererStealthAbility.getCommandRangeCode(A0_22, A1_23, A2_24)
  local L3_25
  L3_25 = 2
  return L3_25
end
function GathererStealthAbility.getCommandTargettingMode(A0_26, A1_27, A2_28)
  local L3_29
  L3_29 = 1
  return L3_29
end
function GathererStealthAbility.isExclusiveMainHand(A0_30)
  local L1_31
  L1_31 = true
  return L1_31
end
