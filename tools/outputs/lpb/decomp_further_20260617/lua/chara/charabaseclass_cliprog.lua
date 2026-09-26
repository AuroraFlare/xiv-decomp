local L0_0, L1_1
L0_0 = CharaBaseClass
function L1_1(A0_2)
  return A0_2.charaWork.gameParameter
end
L0_0.hasGameParameter = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_3)
  local L1_4
  L1_4 = false
  if A0_3:hasGameParameter() and (A0_3.charaWork.eventTemp.bazaarRetail == true or A0_3.charaWork.eventTemp.bazaarRepair == true) then
    L1_4 = true
  end
  return L1_4
end
L0_0.isDealer = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_5, A1_6)
  local L2_7
  do break end
  if A1_6 == 1 or A1_6 == 2 then
    L2_7 = true
    return L2_7
  else
    L2_7 = false
    return L2_7
  end
  L2_7 = A0_5.charaWork
  L2_7 = L2_7.property
  L2_7 = L2_7[1]
  if not L2_7 and A1_6 == 2 then
    L2_7 = false
    return L2_7
  end
  L2_7 = A0_5.charaWork
  L2_7 = L2_7.property
  L2_7 = L2_7[A1_6]
  return L2_7
end
L0_0.isPropertyEnabled = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_8)
  local L1_9, L2_10
  L1_9 = A0_8.charaWork
  L1_9 = L1_9.parameterSave
  L1_9 = L1_9.state_mainSkill
  L1_9 = L1_9[1]
  L2_10 = A0_8.charaWork
  L2_10 = L2_10.parameterSave
  L2_10 = L2_10.state_mainSkill
  L2_10 = L2_10[2]
  return L1_9, L2_10
end
L0_0.getStateMainSkill = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_11, A1_12)
  local L2_13
  L2_13 = A0_11.charaWork
  L2_13 = L2_13.parameterSave
  L2_13 = L2_13.constanceCommandSlot_commandId
  L2_13 = L2_13[A1_12]
  return L2_13
end
L0_0.getConstanceCommand = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_14, A1_15)
  local L2_16
  L2_16 = A0_14.charaWork
  L2_16 = L2_16.parameterSave
  L2_16 = L2_16.giftCommandSlot_commandId
  L2_16 = L2_16[A1_15]
  return L2_16
end
L0_0.getGiftCommand = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_17, A1_18)
  local L2_19
  if A1_18 == 0 then
    L2_19 = 0
    return L2_19
  else
    L2_19 = A0_17.charaWork
    L2_19 = L2_19.battleSave
    L2_19 = L2_19.skillLevel
    L2_19 = L2_19[A1_18]
    if L2_19 == 0 then
      return 0
    elseif A0_17:isJob(A1_18) then
      return 0
    else
      return L2_19
    end
  end
end
L0_0.getSkillLevel = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_20)
  local L1_21
  L1_21 = A0_20.charaWork
  L1_21 = L1_21.parameterSave
  L1_21 = L1_21.abilityCostPoint_used
  return L1_21
end
L0_0.getAbilityCostPointUsed = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_22)
  local L1_23
  L1_23 = A0_22.charaWork
  L1_23 = L1_23.parameterSave
  L1_23 = L1_23.abilityCostPoint_max
  return L1_23
end
L0_0.getAbilityCostPointMax = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_24)
  local L1_25
  L1_25 = A0_24.charaWork
  L1_25 = L1_25.parameterSave
  L1_25 = L1_25.constanceCostPoint_used
  return L1_25
end
L0_0.getConstanceCostPointUsed = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_26)
  local L1_27
  L1_27 = A0_26.charaWork
  L1_27 = L1_27.parameterSave
  L1_27 = L1_27.constanceCostPoint_max
  return L1_27
end
L0_0.getConstanceCostPointMax = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_28)
  local L1_29
  L1_29 = A0_28.charaWork
  L1_29 = L1_29.parameterSave
  L1_29 = L1_29.giftCostPoint_used
  return L1_29
end
L0_0.getGiftCostPointUsed = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_30)
  local L1_31
  L1_31 = A0_30.charaWork
  L1_31 = L1_31.parameterSave
  L1_31 = L1_31.giftCostPoint_max
  return L1_31
end
L0_0.getGiftCostPointMax = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_32, A1_33)
  local L2_34, L3_35
  if type(A1_33) == "number" then
    L2_34 = A1_33
  else
    L2_34 = A1_33:getCommandId()
  end
  L3_35 = L2_34 - 26000
  if L2_34 >= 30000 then
    return true
  end
  return A0_32.charaWork.commandAcquired[L3_35]
end
L0_0.isCommandAcquired = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_36, A1_37)
  local L2_38, L3_39, L4_40
  L2_38 = A0_36.charaWork
  L2_38 = L2_38.command
  L3_39 = A0_36.charaWork
  L3_39 = L3_39.commandBorder
  L3_39 = L3_39 + A1_37
  L2_38 = L2_38[L3_39]
  L3_39 = A0_36.charaWork
  L3_39 = L3_39.commandCategory
  L4_40 = A0_36.charaWork
  L4_40 = L4_40.commandBorder
  L4_40 = L4_40 + A1_37
  L3_39 = L3_39[L4_40]
  return L2_38, L3_39
end
L0_0.getCustomCommand = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_41)
  if not A0_41:hasGameParameter() then
    return 0
  end
  return #A0_41.charaWork.command - A0_41.charaWork.commandBorder
end
L0_0.getCustomCommandSlotLength = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_42, A1_43)
  local L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50
  L3_45 = A0_42
  L2_44 = A0_42._hasItemPackage
  L4_46 = 100
  L2_44 = L2_44(L3_45, L4_46)
  if L2_44 == false then
    L2_44 = 0
    return L2_44
  end
  L3_45 = A0_42
  L2_44 = A0_42._getItemPackageCapacity
  L4_46 = 100
  L2_44 = L2_44(L3_45, L4_46)
  L4_46 = A0_42
  L3_45 = A0_42._getItemPackageFreeSpace
  L3_45 = L3_45(L4_46, L5_47)
  L4_46 = nil
  for L8_50 = 1, L2_44 - L3_45 do
    if A1_43 == nil then
      A1_43 = 1000001
    end
    if A0_42:countStackAtIndex(100, L8_50) == A1_43 then
      return A0_42:countStackAtIndex(100, L8_50)
    end
  end
  return L5_47
end
L0_0.getMoneyOnHand = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_51)
  return A0_51:_getActorMainStat() == 1 or A0_51:_getActorMainStat() == 3
end
L0_0.isDead = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_52)
  return A0_52:_isActorMainStatMode(2) or A0_52:_isActorMainStatMode(4) or A0_52:_isActorMainStatMode(8) or A0_52:_isActorMainStatMode(16)
end
L0_0.isActiveMode = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_53, A1_54)
  return (A0_53:_getExtendedTemporaryGroupCurrent(A1_54))
end
L0_0.getCommunityGroupCurrent = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_55)
  if A0_55:isPlayer() == true then
    return false
  end
  if A0_55:isPropertyEnabled(3) == false then
    return false
  end
  if A0_55:isNotoriousMonster() == true and A0_55:isNotoriousMonster() == 12 then
    return true
  end
  return false
end
L0_0.isUndead = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_56, A1_57)
  local L2_58, L3_59, L4_60
  L2_58 = {
    L3_59,
    L4_60,
    17,
    18,
    19,
    26,
    27
  }
  L3_59 = 15
  L4_60 = 16
  L3_59 = {
    L4_60,
    2000201,
    2000203,
    2000205,
    2000204,
    2000207,
    2000206
  }
  L4_60 = 2000202
  L4_60 = nil
  for _FORV_8_ = 1, #L2_58 do
    if L2_58[_FORV_8_] == A1_57 then
      L4_60 = L3_59[_FORV_8_]
      break
    end
  end
  if L4_60 == nil then
    return false
  end
  return A0_56:hasItem(101, L4_60)
end
L0_0.hasJobStone = L1_1
