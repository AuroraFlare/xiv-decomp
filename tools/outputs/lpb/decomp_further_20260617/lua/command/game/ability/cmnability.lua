require("/Command/Game/Ability/AbilityBaseClass")
_defineClass("CmnAbility", "AbilityBaseClass")
function CmnAbility.getCommandHPCost(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6
  L4_4 = 0
  L6_6 = A0_0
  L5_5 = A0_0.getCommandId
  L5_5 = L5_5(L6_6)
  L6_6 = L5_5
  if L6_6 == 27582 then
  elseif L6_6 == 27583 then
  elseif L6_6 == 27584 then
  elseif L6_6 == 27589 then
  elseif L6_6 == 27590 then
  else
  end
  if L6_6 == 27591 then
    L4_4 = A0_0:getCommandParam3()
    break
  else
  end
  return L4_4
end
function CmnAbility.isResetRecastTimeAtChangeMainSkill(A0_7)
  local L1_8, L2_9, L3_10
  L1_8 = false
  L3_10 = A0_7
  L2_9 = A0_7.getCommandId
  L2_9 = L2_9(L3_10)
  L3_10 = L2_9
  if L3_10 == 28485 then
  else
  end
  if L3_10 == 28828 then
    L1_8 = true
    break
  else
  end
  return L1_8
end
