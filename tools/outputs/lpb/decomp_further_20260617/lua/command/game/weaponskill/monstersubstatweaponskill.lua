require("/Command/Game/WeaponSkill/WeaponSkillBaseClass")
_defineClass("MonsterSubStatWeaponSkill", "WeaponSkillBaseClass")
function MonsterSubStatWeaponSkill.isWeaponSkillCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function MonsterSubStatWeaponSkill.getCommandInformation(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  L3_5 = A0_2
  L2_4 = A0_2.getCommandId
  L2_4 = L2_4(L3_5)
  L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L12_14 = 1
  if L2_4 == 23022 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 2, 2, -1, 2, -1
  elseif L2_4 == 23023 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 2, 2, -1, 2, -1
  elseif L2_4 == 23041 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 2, 2, -1, 1, 1
  elseif L2_4 == 23042 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 2, 2, -1, 1, 1
  elseif L2_4 == 23043 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 2, 1
  elseif L2_4 == 23055 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23056 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23125 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23173 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23174 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23175 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23176 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23177 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23239 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 2, -1
  elseif L2_4 == 23255 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 1, 1
  elseif L2_4 == 23251 then
    L12_14 = -1
  elseif L2_4 == 23256 then
    L12_14 = -1
  elseif L2_4 == 23245 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 1, -1, 1, 1
  elseif L2_4 == 23247 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 2, 1
  elseif L2_4 == 23271 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 2, 1
  elseif L2_4 == 23272 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = true, false, true, 1, 2, -1, 2, 1
  elseif L2_4 == 23340 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_4 == 23341 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_4 == 23356 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_4 == 23365 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = false, false, true, 4, 2, -1, 2, 1
  elseif L2_4 == 23366 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = false, false, true, 1, 2, -1, -1, -1
  elseif L2_4 == 23374 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_4 == 23376 then
    L3_5, L4_6, L5_7, L8_10, L9_11, L10_12, L11_13, L12_14 = false, false, true, 1, 2, -1, 2, 1
  end
  if A1_3 == 8 then
    return L12_14
  else
  end
end
function MonsterSubStatWeaponSkill.getRangeWidth(A0_15, A1_16, A2_17, A3_18)
  if A0_15:getCommandId() == 23365 then
    return 4
  end
  return 2
end
function MonsterSubStatWeaponSkill.getRangeRotate(A0_19, A1_20, A2_21, A3_22)
  local L4_23
  L4_23 = A0_19.getCommandId
  L4_23 = L4_23(A0_19)
  if L4_23 == 23042 then
    break
  else
  end
  return 0
end
