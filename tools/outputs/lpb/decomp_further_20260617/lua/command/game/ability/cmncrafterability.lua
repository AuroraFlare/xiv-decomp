require("/Command/Game/Ability/AbilityBaseClass")
_defineClass("CmnCrafterAbility", "AbilityBaseClass")
function CmnCrafterAbility.isHostilityCommand(A0_0)
  local L1_1
  L1_1 = false
  return L1_1
end
function CmnCrafterAbility.isExclusiveMainHand(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
function CmnCrafterAbility.isResetRecastTimeAtChangeMainSkill(A0_4)
  local L1_5, L2_6, L3_7
  L1_5 = false
  L3_7 = A0_4
  L2_6 = A0_4.getCommandId
  L2_6 = L2_6(L3_7)
  L3_7 = L2_6
  if L3_7 == 29862 then
  elseif L3_7 == 29863 then
  elseif L3_7 == 29864 then
  elseif L3_7 == 29865 then
  elseif L3_7 == 29866 then
  elseif L3_7 == 29867 then
  elseif L3_7 == 29868 then
  elseif L3_7 == 29869 then
  elseif L3_7 == 29870 then
  elseif L3_7 == 29871 then
  else
  end
  if L3_7 == 29872 then
    L1_5 = true
    break
  else
  end
  return L1_5
end
