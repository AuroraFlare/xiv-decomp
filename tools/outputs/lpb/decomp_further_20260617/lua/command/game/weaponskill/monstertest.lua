require("/Command/Game/GameCommandBaseClass")
_defineClass("MonsterTest", "GameCommandBaseClass")
function MonsterTest.isWeaponSkillCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function MonsterTest.isBattleCommand(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
function MonsterTest.getCommandInformation(A0_4, A1_5)
  local L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15
  L3_7 = A0_4
  L2_6 = A0_4.getCommandId
  L2_6 = L2_6(L3_7)
  L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_7, L4_8, L5_9, L8_12, L9_13, L10_14, L11_15 = true, true, true, 1, 1, -1, -1
  if A1_5 == 2 then
    if L3_7 == nil or L4_8 == nil or L5_9 == nil then
    end
    return L3_7, L4_8, L5_9
  elseif A1_5 == 4 then
    if L8_12 == nil then
    end
    return L8_12
  elseif A1_5 == 5 then
    if L9_13 == nil then
    end
    return L9_13
  elseif A1_5 == 6 then
    if L10_14 == nil then
    end
    return L10_14
  elseif A1_5 == 7 then
    if L11_15 == nil then
    end
    return L11_15
  else
    if A1_5 == 8 then
      if 1 == nil then
      end
      return 1
    else
    end
  end
end
function MonsterTest.canAimForRelation(A0_16)
  local L1_17, L2_18, L3_19
  L1_17 = false
  L2_18 = false
  L3_19 = true
  return L1_17, L2_18, L3_19
end
function MonsterTest.canAimParts(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
  L1_21 = true
  L2_22 = true
  L3_23 = true
  L4_24 = true
  L5_25 = true
  L6_26 = true
  L7_27 = true
  L8_28 = true
  return L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
end
function MonsterTest.canFireForRelation(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34
  L2_31 = A0_29
  L1_30 = A0_29.getCommandInformation
  L3_32 = 2
  L3_32 = L1_30(L2_31, L3_32)
  L4_33 = L1_30
  L5_34 = L2_31
  return L4_33, L5_34, L3_32
end
function MonsterTest.useWeaponRangeInformation(A0_35)
  local L1_36, L2_37
  L1_36 = false
  L2_37 = false
  return L1_36, L2_37
end
function MonsterTest.getCommandRangeCode(A0_38, A1_39, A2_40)
  return (A0_38:getCommandInformation(4))
end
function MonsterTest.getCommandTargettingMode(A0_41, A1_42, A2_43)
  return (A0_41:getCommandInformation(5))
end
