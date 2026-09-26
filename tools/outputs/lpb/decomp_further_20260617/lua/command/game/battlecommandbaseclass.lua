require("/Command/Game/GameCommandBaseClass")
_defineBaseClass("BattleCommandBaseClass", "GameCommandBaseClass")
function BattleCommandBaseClass.isBattleCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function BattleCommandBaseClass.getCommandType(A0_2)
  if A0_2:isAttackCommand() then
    return 1
  elseif A0_2:isMagicMissileCommand() then
    return 2
  elseif A0_2:isAbilityCommand() then
    return 3
  elseif A0_2:isMagicCommand() then
    return 4
  elseif A0_2:isWeaponSkillCommand() then
    return 5
  end
  return 0
end
function BattleCommandBaseClass.canAimForRelation(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L2_5 = A0_3
  L1_4 = A0_3.getCommandId
  L1_4 = L1_4(L2_5)
  L2_5 = gameCommandSheet
  L3_6 = L2_5
  L2_5 = L2_5._getData
  L4_7 = L1_4
  L2_5 = L2_5(L3_6, L4_7, 137)
  L3_6 = gameCommandSheet
  L4_7 = L3_6
  L3_6 = L3_6._getData
  L3_6 = L3_6(L4_7, L1_4, 138)
  L4_7 = gameCommandSheet
  L4_7 = L4_7._getData
  L4_7 = L4_7(L4_7, L1_4, 139)
  return L2_5, L3_6, L4_7
end
function BattleCommandBaseClass.getCommandTargettingMode(A0_8, A1_9)
end
function BattleCommandBaseClass.canFireForRelation(A0_10)
  local L1_11
end
function BattleCommandBaseClass.canAimParts(A0_12)
  local L1_13
end
function BattleCommandBaseClass.getCommandRangeCode(A0_14)
  local L1_15
end
function BattleCommandBaseClass.getRangeAngle(A0_16)
  local L1_17
end
function BattleCommandBaseClass.useWeaponRangeInformation(A0_18)
  local L1_19
end
function BattleCommandBaseClass.isLongRangeCommand(A0_20, A1_21, A2_22)
end
