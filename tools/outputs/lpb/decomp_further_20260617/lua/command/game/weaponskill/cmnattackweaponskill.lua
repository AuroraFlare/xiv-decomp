require("/Command/Game/WeaponSkill/WeaponSkillBaseClass")
_defineClass("CmnAttackWeaponSkill", "WeaponSkillBaseClass")
function CmnAttackWeaponSkill.getCommandRangeTargettingMode(A0_0, A1_1, A2_2, A3_3)
  return A0_0:getCommandTargettingMode(A1_1, A2_2, A3_3)
end
function CmnAttackWeaponSkill.getFrequency(A0_4)
  local L1_5, L2_6, L3_7
  L1_5 = 1
  L3_7 = A0_4
  L2_6 = A0_4.getCommandId
  L2_6 = L2_6(L3_7)
  L3_7 = L2_6
  if L3_7 == 26640 then
  else
  end
  if L3_7 == 26642 then
    L1_5 = 9
    break
  elseif L3_7 == 26817 then
  else
  end
  if L3_7 == 27532 then
    L1_5 = 4
    break
  else
  end
  if L3_7 == 26998 then
    L1_5 = 3
    break
  elseif L3_7 == 26811 then
  else
  end
  if L3_7 == 26812 then
    L1_5 = 5
    break
  else
  end
  if L3_7 == 27717 then
    L1_5 = 6
    break
  else
  end
  return L1_5
end
function CmnAttackWeaponSkill.canCancel(A0_8)
  local L1_9
  L1_9 = A0_8.getCommandId
  L1_9 = L1_9(A0_8)
  if L1_9 == 26811 then
  else
  end
  if L1_9 == 26812 then
  return false
end
