require("/Command/Game/WeaponSkill/WeaponSkillBaseClass")
_defineClass("MonsterAbsorbWeaponSkill", "WeaponSkillBaseClass")
function MonsterAbsorbWeaponSkill.getCommandInformation(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L3_3 = A0_0
  L2_2 = A0_0.getCommandId
  L2_2 = L2_2(L3_3)
  L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if L2_2 == 23049 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L12_12, L10_10, L11_11 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23082 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L12_12, L10_10, L11_11 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23129 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L12_12, L10_10, L11_11 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23145 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L12_12, L10_10, L11_11 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23346 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L12_12, L10_10, L11_11 = false, false, true, 2, 2, -1, 2, 1
  end
  if A1_1 == 2 then
    if L3_3 == nil or L4_4 == nil or L5_5 == nil then
    end
    return L3_3, L4_4, L5_5
  elseif A1_1 == 4 then
    if L8_8 == nil then
    end
    return L8_8
  elseif A1_1 == 5 then
    if L9_9 == nil then
    end
    return L9_9
  elseif A1_1 == 6 then
    if L12_12 == nil then
    end
    return L12_12
  elseif A1_1 == 7 then
    if L10_10 == nil then
    end
    return L10_10
  else
    if A1_1 == 8 then
      if L11_11 == nil then
      end
      return L11_11
    else
    end
  end
end
function MonsterAbsorbWeaponSkill.isRegistable(A0_13)
  if A0_13:getCommandInformation(7) == 2 then
    return true
  else
    return false
  end
end
