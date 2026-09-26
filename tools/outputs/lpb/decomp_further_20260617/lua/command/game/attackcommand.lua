require("/Command/Game/BattleCommandBaseClass")
_defineClass("AttackCommand", "BattleCommandBaseClass")
function AttackCommand.isAttackCommand(A0_0)
  if A0_0:isMagicMissileCommand() then
    return false
  else
    return true
  end
end
function AttackCommand.isMagicMissileCommand(A0_1)
  if A0_1:getCommandId() >= 22301 and A0_1:getCommandId() <= 22306 then
    return true
  elseif A0_1:getCommandId() >= 28588 and A0_1:getCommandId() <= 28589 then
    return true
  elseif A0_1:getCommandId() >= 28928 and A0_1:getCommandId() <= 28929 then
    return true
  end
  return false
end
function AttackCommand.canAimForRelation(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = false
  L2_4 = false
  L3_5 = true
  return L1_3, L2_4, L3_5
end
function AttackCommand.canFireForRelation(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = false
  L2_8 = false
  L3_9 = true
  return L1_7, L2_8, L3_9
end
function AttackCommand.useWeaponRangeInformation(A0_10)
  local L1_11, L2_12, L3_13
  L2_12 = A0_10
  L1_11 = A0_10.getCommandId
  L1_11 = L1_11(L2_12)
  L2_12 = true
  L3_13 = true
  if L1_11 == 27578 then
    L2_12 = true
    L3_13 = false
    break
  else
  end
  if L1_11 == 22114 then
    L2_12 = false
    L3_13 = false
    break
  else
  end
  return L2_12, L3_13
end
function AttackCommand.getCommandRangeCode(A0_14, A1_15, A2_16)
  local L3_17
  L3_17 = 2
  return L3_17
end
function AttackCommand.getCommandTargettingMode(A0_18, A1_19, A2_20)
  local L3_21
  L3_21 = 1
  return L3_21
end
function AttackCommand.getCommandRangeTargettingMode(A0_22, A1_23, A2_24, A3_25)
  local L4_26, L5_27, L6_28
  L4_26 = 1
  L6_28 = A0_22
  L5_27 = A0_22.getCommandId
  L5_27 = L5_27(L6_28)
  L6_28 = L5_27
  if L6_28 == 27037 then
  elseif L6_28 == 27038 then
  else
  end
  if L6_28 == 28588 then
    L4_26 = 2
    break
  else
  end
  return L4_26
end
function AttackCommand.isLongRangeCommand(A0_29, A1_30, A2_31, A3_32)
  local L4_33
  L4_33 = A0_29.getCommandId
  L4_33 = L4_33(A0_29)
  if L4_33 == 22114 then
    L4_33 = true
    return L4_33
  end
  L4_33 = A0_29.isAutoAttack
  L4_33 = L4_33(A0_29)
  if L4_33 then
    L4_33 = false
    return L4_33
  end
  L4_33 = A1_30.getAttackWorkIndexByHand
  L4_33 = L4_33(A1_30, A2_31)
  return A1_30:getWeaponLongRangeInformation(L4_33)
end
function AttackCommand.getFrequency(A0_34)
  if A0_34:getCommandId() == 26678 then
    return 3
  else
    return nil
  end
end
function AttackCommand.getUseAmmoMax(A0_35)
  if A0_35:getCommandId() == 22114 then
    return -1
  end
  if A0_35:isAttackCommand() then
    return -2
  end
  return -1
end
function AttackCommand.getCommandRangeShape(A0_36, A1_37, A2_38, A3_39)
  local L4_40, L5_41, L6_42, L7_43, L8_44
  L4_40 = false
  L6_42 = A1_37
  L5_41 = A1_37.isPlayer
  L5_41 = L5_41(L6_42)
  if L5_41 then
    L6_42 = A0_36
    L5_41 = A0_36.useWeaponRangeInformation
    L7_43 = A1_37
    L8_44 = A2_38
    L5_41 = L5_41(L6_42, L7_43, L8_44, A3_39)
    L4_40 = L5_41
  end
  if L4_40 then
    L6_42 = A1_37
    L5_41 = A1_37.judgeAttackWorkIndex
    L7_43 = A0_36
    L8_44 = A2_38
    L5_41 = L5_41(L6_42, L7_43, L8_44)
    L7_43 = A0_36
    L6_42 = A0_36.getCommandId
    L6_42 = L6_42(L7_43)
    L8_44 = A1_37
    L7_43 = A1_37.getAttackRangeShape
    L7_43 = L7_43(L8_44, L5_41)
    L8_44 = A0_36.getRangeAngle
    L8_44 = L8_44(A0_36, A1_37, A2_38, A3_39)
    if A0_36:isMagicMissileCommand() and L6_42 ~= 28928 then
      return L7_43, L8_44, 0, 0
    end
    return L7_43, L8_44, 0, A0_36:getEffectRange(A1_37, A2_38, A3_39)
  end
  L6_42 = A0_36
  L5_41 = A0_36.getCommandRangeCode
  L7_43 = A1_37
  L8_44 = A2_38
  L5_41 = L5_41(L6_42, L7_43, L8_44, A3_39)
  L7_43 = A0_36
  L6_42 = A0_36.getRangeAngle
  L8_44 = A1_37
  L6_42 = L6_42(L7_43, L8_44, A2_38, A3_39)
  L8_44 = A0_36
  L7_43 = A0_36.getRangeRotate
  L7_43 = L7_43(L8_44, A1_37, A2_38, A3_39)
  L8_44 = A0_36.getEffectRange
  L8_44 = L8_44(A0_36, A1_37, A2_38, A3_39)
  return L5_41, L6_42, L7_43, L8_44, L8_44(A0_36, A1_37, A2_38, A3_39)
end
function AttackCommand.getAttackVolume(A0_45, A1_46, A2_47, A3_48, A4_49)
  local L5_50
  L5_50 = A0_45.getCommandId
  L5_50 = L5_50(A0_45)
  if L5_50 == 22103 then
  elseif L5_50 == 22105 then
  elseif L5_50 == 22109 then
  elseif L5_50 == 27578 then
  else
  end
  if L5_50 == 26857 then
    break
  elseif L5_50 == 22108 then
  elseif L5_50 == 26858 then
  elseif L5_50 == 26859 then
  elseif L5_50 == 27037 then
  elseif L5_50 == 27757 then
  else
  end
  if L5_50 == 27759 then
    break
  elseif L5_50 == 27038 then
  elseif L5_50 == 27039 then
  elseif L5_50 == 27579 then
  else
  end
  if L5_50 == 27758 then
    break
  else
  end
  if A4_49 >= A3_48:getHPMax() / 13 * 1.1 then
  elseif A4_49 >= A3_48:getHPMax() / 13 * 0.9 then
  else
    break
  end
  return 0
end
function AttackCommand.getCommandLevelAdjustLevelMax(A0_51)
  local L1_52, L2_53
  L1_52 = -1
  L2_53 = -1
  return L1_52, L2_53
end
