require("/Command/Game/WeaponSkill/WeaponSkillBaseClass")
_defineClass("AttackWeaponSkill", "WeaponSkillBaseClass")
function AttackWeaponSkill.getCommandRangeTargettingMode(A0_0, A1_1, A2_2)
  return A0_0:getCommandTargettingMode(A1_1, A2_2)
end
function AttackWeaponSkill.getFrequency(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = 1
  L3_6 = A0_3
  L2_5 = A0_3.getCommandId
  L2_5 = L2_5(L3_6)
  L3_6 = L2_5
  if L3_6 == 27155 then
    L1_4 = 5
    break
  else
  end
  if L3_6 == 27195 then
    L1_4 = 3
    break
  else
  end
  if L3_6 == 27112 then
    L1_4 = 9
    break
  else
  end
  if L3_6 == 27118 then
    L1_4 = 2
    break
  else
  end
  if L3_6 == 27276 then
    L1_4 = 6
    break
  else
  end
  return L1_4
end
function AttackWeaponSkill.canCancel(A0_7)
  local L1_8
  L1_8 = true
  return L1_8
end
