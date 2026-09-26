require("/Command/Game/WeaponSkill/WeaponSkillBaseClass")
_defineClass("DevideAttackWeaponSkill", "WeaponSkillBaseClass")
function DevideAttackWeaponSkill.getCommandRangeTargettingMode(A0_0, A1_1, A2_2, A3_3)
  return A0_0:getCommandTargettingMode(A1_1, A2_2, A3_3)
end
function DevideAttackWeaponSkill.getFrequency(A0_4)
  local L1_5
  L1_5 = 1
  return L1_5
end
