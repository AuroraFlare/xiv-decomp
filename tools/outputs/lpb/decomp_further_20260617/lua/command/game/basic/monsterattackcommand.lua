require("/Command/Game/BattleCommandBaseClass")
_defineClass("MonsterAttackCommand", "BattleCommandBaseClass")
function MonsterAttackCommand.isAttackCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function MonsterAttackCommand.canAimForRelation(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = false
  L2_4 = false
  L3_5 = true
  return L1_3, L2_4, L3_5
end
function MonsterAttackCommand.canFireForRelation(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = false
  L2_8 = false
  L3_9 = true
  return L1_7, L2_8, L3_9
end
function MonsterAttackCommand.getCommandTargettingMode(A0_10, A1_11, A2_12)
  local L3_13
  L3_13 = 1
  return L3_13
end
function MonsterAttackCommand.useWeaponRangeInformation(A0_14)
  local L1_15, L2_16, L3_17
  L2_16 = A0_14
  L1_15 = A0_14.getCommandId
  L1_15 = L1_15(L2_16)
  L2_16 = true
  L3_17 = true
  if L1_15 == 23331 then
  elseif L1_15 == 23332 then
  elseif L1_15 == 23333 then
  elseif L1_15 == 23334 then
  elseif L1_15 == 23335 then
  elseif L1_15 == 23336 then
  elseif L1_15 == 23405 then
  elseif L1_15 == 23406 then
  else
  end
  if L1_15 == 23407 then
    L2_16 = false
    break
  else
  end
  return L2_16, L3_17
end
function MonsterAttackCommand.getCommandRangeTargettingMode(A0_18, A1_19, A2_20, A3_21)
  local L4_22, L5_23, L6_24
  L4_22 = 1
  L6_24 = A0_18
  L5_23 = A0_18.getCommandId
  L5_23 = L5_23(L6_24)
  L6_24 = L5_23
  if L6_24 == 23331 then
  elseif L6_24 == 23332 then
  elseif L6_24 == 23333 then
  elseif L6_24 == 23334 then
  elseif L6_24 == 23335 then
  elseif L6_24 == 23336 then
  elseif L6_24 == 23405 then
  elseif L6_24 == 23406 then
  else
  end
  if L6_24 == 23407 then
    L4_22 = 2
    break
  else
  end
  return L4_22
end
function MonsterAttackCommand.isLongRangeCommand(A0_25, A1_26, A2_27, A3_28)
  local L4_29
  L4_29 = A1_26.getAttackWorkIndexByHand
  L4_29 = L4_29(A1_26, A2_27)
  return A1_26:getWeaponLongRangeInformation(L4_29)
end
function MonsterAttackCommand.getUseAmmoMax(A0_30)
  local L1_31
  L1_31 = -1
  return L1_31
end
function MonsterAttackCommand.getCommandRangeShape(A0_32, A1_33, A2_34, A3_35)
  local L4_36, L5_37
  L5_37 = A0_32
  L4_36 = A0_32.useWeaponRangeInformation
  L4_36 = L4_36(L5_37, A1_33, A2_34, A3_35)
  if L4_36 then
    L5_37 = A1_33.judgeAttackWorkIndex
    L5_37 = L5_37(A1_33, A0_32, A2_34)
    return A1_33:getAttackRangeShape(L5_37), A0_32:getRangeAngle(A1_33, A2_34, A3_35), 0, A0_32:getEffectRange(A1_33, A2_34, A3_35)
  else
    L5_37 = A0_32.getCommandRangeCode
    L5_37 = L5_37(A0_32, A1_33, A2_34, A3_35)
    return L5_37, A0_32:getRangeAngle(A1_33, A2_34, A3_35), A0_32:getRangeRotate(A1_33, A2_34, A3_35), A0_32:getEffectRange(A1_33, A2_34, A3_35)
  end
end
function MonsterAttackCommand.getCommandLevelAdjustLevelMax(A0_38)
  local L1_39, L2_40
  L1_39 = -1
  L2_40 = -1
  return L1_39, L2_40
end
