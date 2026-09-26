require("/Chara/CharaBaseClass_battle")
function CharaBaseClass.getStateMainSkillWithIndex(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.charaWork
  L2_2 = L2_2.parameterSave
  L2_2 = L2_2.state_mainSkill
  L2_2 = L2_2[A1_1]
  return L2_2
end
function CharaBaseClass.getStateMainSkillForSub(A0_3)
  local L1_4
  L1_4 = A0_3.charaWork
  L1_4 = L1_4.parameterSave
  L1_4 = L1_4.state_mainSkill
  L1_4 = L1_4[3]
  return L1_4
end
function CharaBaseClass.getStateMainSkillLevel(A0_5)
  local L1_6
  L1_6 = A0_5.charaWork
  L1_6 = L1_6.parameterSave
  L1_6 = L1_6.state_mainSkillLevel
  return L1_6
end
function CharaBaseClass.getMainSkillLevel(A0_7)
  return A0_7:getStateMainSkillLevel()
end
function CharaBaseClass.getStateMainSkillLimitterRank(A0_8)
  local L1_9, L2_10
  L1_9 = 1
  L2_10 = 1
  return L1_9, L2_10
end
function CharaBaseClass.getStateMainSkillBoostPoint(A0_11)
  local L1_12, L2_13
  L1_12 = A0_11.charaWork
  L1_12 = L1_12.parameterSave
  L1_12 = L1_12.state_boostPointForSkill
  L1_12 = L1_12[1]
  L2_13 = A0_11.charaWork
  L2_13 = L2_13.parameterSave
  L2_13 = L2_13.state_boostPointForSkill
  L2_13 = L2_13[2]
  return L1_12, L2_13
end
function CharaBaseClass.getMPMax(A0_14)
  if not A0_14:hasGameParameter() then
    return 0
  end
  return A0_14.charaWork.parameterSave.mpMax
end
function CharaBaseClass.getMPMaxAtEquip(A0_15)
  if not A0_15:hasGameParameter() then
    return 0
  end
  return A0_15.charaWork.parameterSave.mpMaxAtEquip
end
function CharaBaseClass.getTPMaxAtEquip(A0_16)
  if not A0_16:hasGameParameter() then
    return 0
  end
  return A0_16.charaWork.parameterSave.tpMaxAtEquip
end
function CharaBaseClass.getActionGaugeMax(A0_17)
  local L1_18
  L1_18 = 15
  return L1_18
end
function CharaBaseClass.getCommandSlotCompatibility(A0_19, A1_20)
  local L2_21
  L2_21 = A0_19.charaWork
  L2_21 = L2_21.parameterSave
  L2_21 = L2_21.commandSlot_compatibility
  L2_21 = L2_21[A1_20]
  return L2_21
end
function CharaBaseClass.getCommandRecastTime(A0_22, A1_23)
  local L2_24
  L2_24 = A0_22.charaWork
  L2_24 = L2_24.parameterSave
  L2_24 = L2_24.commandSlot_recastTime
  L2_24 = L2_24[A1_23]
  return L2_24
end
function CharaBaseClass.getMaxCommandRecastTime(A0_25, A1_26)
  local L2_27
  L2_27 = A0_25.charaWork
  L2_27 = L2_27.parameterTemp
  L2_27 = L2_27.maxCommandRecastTime
  L2_27 = L2_27[A1_26]
  return L2_27
end
function CharaBaseClass.isNegotiatable(A0_28)
  return A0_28:isPropertyEnabled(4)
end
function CharaBaseClass.getMyCommandCommandId(A0_29, A1_30)
  local L2_31
  L2_31 = A0_29.charaWork
  L2_31 = L2_31.parameterTemp
  L2_31 = L2_31.mycommand_command
  L2_31 = L2_31[A1_30]
  return L2_31
end
function CharaBaseClass.getMyCombinationStackedNum(A0_32)
  local L1_33
  L1_33 = 0
  return L1_33
end
function CharaBaseClass.canSetPartyTarget(A0_34, A1_35, A2_36)
  local L3_37, L4_38
  L4_38 = A0_34
  L3_37 = A0_34.getParty
  L3_37 = L3_37(L4_38)
  if L3_37 == nil then
    L4_38 = false
    return L4_38, 30420
  end
  if L3_37 ~= nil then
    L4_38 = L3_37._countMember
    L4_38 = L4_38(L3_37)
    if L4_38 == 1 then
      L4_38 = false
      return L4_38, 30414
    end
  end
  L4_38 = A1_35._isAlive
  L4_38 = L4_38(A1_35)
  if not L4_38 then
    L4_38 = false
    return L4_38, 30415
  end
  L4_38 = A1_35.isPropertyEnabled
  L4_38 = L4_38(A1_35, 3)
  if not L4_38 then
    L4_38 = false
    return L4_38, 30420
  end
  L4_38 = A1_35.isPlayer
  L4_38 = L4_38(A1_35)
  if L4_38 then
    L4_38 = false
    return L4_38, 30416
  end
  L4_38 = A1_35.getParty
  L4_38 = L4_38(A1_35)
  if L4_38 == nil then
    return false, 30420
  end
  if L3_37:getPartyTargetTo() ~= nil and L4_38:getPartyTargetFrom() ~= nil then
    if not L4_38:getPartyTargetFrom():_isAlive() then
      return false, 30420
    end
    if L3_37:getPartyOwner() ~= L4_38:getPartyTargetFrom() then
      return false, 30421
    end
  end
  if A0_34:judgeRelation(A1_35, L3_37, L4_38) == 1 then
    if A0_34:getContentGroup(30001) == nil then
      return false, 30418
    elseif A1_35:getContentGroup(30001) == nil or A0_34:getContentGroup(30001) ~= A1_35:getContentGroup(30001) then
      return false, 30419
    end
  else
    return false, 30420
  end
  return true, 0
end
function CharaBaseClass.canSetOpenThinking(A0_39, A1_40, A2_41)
  if A1_40 ~= A0_39 then
    return false, 30423
  elseif A0_39:getParty() ~= nil and A0_39:getParty():_countMember() == 1 then
    return false, 30424
  end
  return true, 0
end
function CharaBaseClass.getTargetInformationOpenThinking(A0_42)
  return _math.fmod(_math.floor(A0_42.charaWork.parameterTemp.targetInformation / 1000), 1000)
end
function CharaBaseClass.getTargetInformationPartyTarget(A0_43)
  return _math.fmod(_math.floor(A0_43.charaWork.parameterTemp.targetInformation / 1000000), 1000)
end
function CharaBaseClass.getTargetInformationNumbering(A0_44)
  return _math.fmod(_math.floor(A0_44.charaWork.parameterTemp.targetInformation / 1), 1000)
end
function CharaBaseClass.getForceCostMPForCaster(A0_45)
  if A0_45:hasGameParameter() then
    return A0_45.charaWork.parameterTemp.forceControl_float_forClientSelf[1], A0_45.charaWork.parameterTemp.forceControl_int16_forClientSelf[1]
  else
    return 1, -1
  end
end
function CharaBaseClass.getForceCostTPForCaster(A0_46)
  if A0_46:hasGameParameter() then
    return A0_46.charaWork.parameterTemp.forceControl_float_forClientSelf[2], A0_46.charaWork.parameterTemp.forceControl_int16_forClientSelf[2]
  else
    return 1, -1
  end
end
function CharaBaseClass.isFrontSide(A0_47, A1_48, A2_49)
  local L3_50
  L3_50 = A0_47._getOrientation
  L3_50 = L3_50(A0_47, A1_48:_getPos())
  if A2_49 == nil then
    A2_49 = _math.pi / 2
  end
  return _math.abs(L3_50) < A2_49 / 2
end
function CharaBaseClass.isBackSide(A0_51, A1_52, A2_53)
  local L3_54, L4_55
  L4_55 = A0_51
  L3_54 = A0_51._getOrientation
  L3_54 = L3_54(L4_55, A1_52:_getPos())
  if A2_53 == nil then
    L4_55 = _math
    L4_55 = L4_55.pi
    A2_53 = L4_55 / 2
  end
  L4_55 = _math
  L4_55 = L4_55.pi
  L4_55 = L4_55 - _math.abs(L3_54)
  L4_55 = L4_55 < A2_53 / 2
  return L4_55
end
function CharaBaseClass.judgeGrowColumn(A0_56, A1_57, A2_58)
  if not A0_56:isPlayer() then
    if A1_57:isPlayer() then
      if A2_58 == 69 then
        A2_58 = 19
      elseif A2_58 == 73 then
        A2_58 = 23
      elseif A2_58 == 77 then
        A2_58 = 27
      elseif A2_58 == 81 then
        A2_58 = 31
      elseif A2_58 == 85 then
        A2_58 = 35
      elseif A2_58 == 91 then
        A2_58 = 41
      elseif A2_58 == 95 then
        A2_58 = 45
      elseif A2_58 == 99 then
        A2_58 = 49
      elseif A2_58 == 99 then
        A2_58 = 49
      elseif A2_58 == 89 then
        A2_58 = 39
      end
    elseif A2_58 == 19 then
      A2_58 = 69
    elseif A2_58 == 23 then
      A2_58 = 73
    elseif A2_58 == 27 then
      A2_58 = 77
    elseif A2_58 == 31 then
      A2_58 = 81
    elseif A2_58 == 35 then
      A2_58 = 85
    elseif A2_58 == 41 then
      A2_58 = 91
    elseif A2_58 == 45 then
      A2_58 = 95
    elseif A2_58 == 49 then
      A2_58 = 99
    elseif A2_58 == 49 then
      A2_58 = 99
    elseif A2_58 == 39 then
      A2_58 = 89
    end
  end
  return A2_58
end
function CharaBaseClass.getHP(A0_59)
  return A0_59:getPartsHP(1)
end
function CharaBaseClass.getPartsHP(A0_60, A1_61)
  if not A0_60:hasGameParameter() then
    return 0
  end
  return A0_60:getHpImpl(A1_61)
end
function CharaBaseClass.getHPMax(A0_62)
  return A0_62:getPartsHPMax(1)
end
function CharaBaseClass.getPartsHPMax(A0_63, A1_64)
  if not A0_63:hasGameParameter() then
    return 0
  end
  return A0_63:getHpMaxImpl(A1_64)
end
function CharaBaseClass.getMP(A0_65)
  if not A0_65:hasGameParameter() then
    return 0
  end
  return A0_65.charaWork.parameterSave.mp
end
function CharaBaseClass.getTP(A0_66)
  if not A0_66:hasGameParameter() then
    return 0
  end
  return A0_66.charaWork.parameterTemp.tp
end
function CharaBaseClass.getElapsedTimeAtCureMPFromAetheryte(A0_67)
  return worldMaster:_getServerTime() - A0_67.charaWork.parameterSave.commandResultTimeSave[1]
end
function CharaBaseClass.isEquippingTwoHandedWeapon(A0_68)
  if A0_68:_getEquippingItem(1) ~= nil and A0_68:_getEquippingItem(1):getEquipmentEquipPointDetail() ~= nil and A0_68:_getEquippingItem(1):getEquipmentEquipPointDetail()[1] == 1 and A0_68:_getEquippingItem(1):getEquipmentEquipPointDetail()[2] == 2 then
    return true
  end
  return false
end
function CharaBaseClass.isEquippingFullArmor(A0_69)
  if A0_69:_getEquippingItem(11) ~= nil and A0_69:_getEquippingItem(11):getEquipmentEquipPoint() == 41 then
    return true
  else
    return false
  end
end
function CharaBaseClass.isEquippingAttackWeapon(A0_70, A1_71)
  local L2_72, L3_73, L4_74, L5_75, L6_76
  if A1_71 ~= nil then
    L6_76 = A0_70
    L6_76 = L5_75(L6_76, A1_71)
    L2_72 = L3_73
    if L2_72 ~= nil then
      L6_76 = L2_72
      L6_76 = L5_75(L6_76, 44)
      if L3_73 == 1 then
        return L3_73
      end
    end
  else
    for L6_76 = 1, 7 do
      L2_72 = A0_70:_getEquippingItem(L6_76)
      if L2_72 ~= nil and A0_70:getSkillCategory(L2_72:getItemData(44)) == 1 then
        return true
      end
    end
  end
  return L3_73
end
function CharaBaseClass.isEquippingMagicWeapon(A0_77, A1_78)
  local L2_79, L3_80, L4_81, L5_82, L6_83
  if A1_78 ~= nil then
    L6_83 = A0_77
    L6_83 = L5_82(L6_83, A1_78)
    L2_79 = L3_80
    if L2_79 ~= nil then
      L6_83 = L2_79
      L6_83 = L5_82(L6_83, 44)
      if L3_80 == 21 then
        return L3_80
      end
    end
  else
    for L6_83 = 1, 7 do
      L2_79 = A0_77:_getEquippingItem(L6_83)
      if L2_79 ~= nil and A0_77:getSkillCategory(L2_79:getItemData(44)) == 21 then
        return true
      end
    end
  end
  return L3_80
end
function CharaBaseClass.isEquippingCraftWeapon(A0_84, A1_85)
  local L2_86, L3_87, L4_88, L5_89, L6_90
  if A1_85 ~= nil then
    L6_90 = A0_84
    L6_90 = L5_89(L6_90, A1_85)
    L2_86 = L3_87
    if L2_86 ~= nil then
      L6_90 = L2_86
      L6_90 = L5_89(L6_90, 44)
      if L3_87 == 29 then
        return L3_87
      end
    end
  else
    for L6_90 = 1, 7 do
      L2_86 = A0_84:_getEquippingItem(L6_90)
      if L2_86 ~= nil and A0_84:getSkillCategory(L2_86:getItemData(44)) == 29 then
        return true
      end
    end
  end
  return L3_87
end
function CharaBaseClass.isEquippingHarvestWeapon(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97
  if A1_92 ~= nil then
    L6_97 = A0_91
    L6_97 = L5_96(L6_97, A1_92)
    L2_93 = L3_94
    if L2_93 ~= nil then
      L6_97 = L2_93
      L6_97 = L5_96(L6_97, 44)
      if L3_94 == 39 then
        return L3_94
      end
    end
  else
    for L6_97 = 1, 7 do
      L2_93 = A0_91:_getEquippingItem(L6_97)
      if L2_93 ~= nil and A0_91:getSkillCategory(L2_93:getItemData(44)) == 39 then
        return true
      end
    end
  end
  return L3_94
end
function CharaBaseClass.isBattleClass(A0_98)
  if A0_98:getStateMainSkill() == 2 or A0_98:getStateMainSkill() == 2 then
    return true
  elseif A0_98:getStateMainSkill() == 3 or A0_98:getStateMainSkill() == 3 then
    return true
  elseif A0_98:getStateMainSkill() == 4 or A0_98:getStateMainSkill() == 4 then
    return true
  elseif A0_98:getStateMainSkill() == 7 or A0_98:getStateMainSkill() == 7 then
    return true
  elseif A0_98:getStateMainSkill() == 8 or A0_98:getStateMainSkill() == 8 then
    return true
  elseif A0_98:getStateMainSkill() == 10 or A0_98:getStateMainSkill() == 10 then
    return true
  elseif A0_98:getStateMainSkill() == 22 or A0_98:getStateMainSkill() == 22 then
    return true
  elseif A0_98:getStateMainSkill() == 23 or A0_98:getStateMainSkill() == 23 then
    return true
  end
  return false
end
function CharaBaseClass.initCommonParameterSync(A0_99)
  local L1_100, L2_101, L3_102, L4_103, L5_104, L6_105
  L1_100 = {
    L2_101,
    L3_102,
    L4_103,
    L5_104,
    L6_105,
    {
      "state_mainSkillLevel",
      "integer16"
    }
  }
  L2_101 = {
    L3_102,
    L4_103,
    L5_104,
    L6_105
  }
  L3_102 = "hp"
  L4_103 = "array"
  L5_104 = 8
  L6_105 = "integer16"
  L3_102 = {
    L4_103,
    L5_104,
    L6_105,
    "integer16"
  }
  L4_103 = "hpMax"
  L5_104 = "array"
  L6_105 = 8
  L4_103 = {L5_104, L6_105}
  L5_104 = "mp"
  L6_105 = "integer16"
  L5_104 = {L6_105, "integer16"}
  L6_105 = "mpMax"
  L6_105 = {
    "state_mainSkill",
    "array",
    4,
    "integer8"
  }
  L2_101 = {
    L3_102,
    L4_103,
    L5_104,
    L6_105,
    {
      "constanceCommandSlot_commandId",
      "array",
      10,
      "integer16"
    },
    {
      "abilityCostPoint_used",
      "integer8"
    },
    {
      "abilityCostPoint_max",
      "integer8"
    },
    {
      "giftCostPoint_used",
      "integer8"
    },
    {
      "giftCostPoint_max",
      "integer8"
    },
    {
      "constanceCostPoint_used",
      "integer8"
    },
    {
      "constanceCostPoint_max",
      "integer8"
    }
  }
  L3_102 = {
    L4_103,
    L5_104,
    L6_105,
    "integer8"
  }
  L4_103 = "state_boostPointForSkill"
  L5_104 = "array"
  L6_105 = 4
  L4_103 = {
    L5_104,
    L6_105,
    40,
    "integer32"
  }
  L5_104 = "commandSlot_recastTime"
  L6_105 = "array"
  L5_104 = {
    L6_105,
    "array",
    40,
    "boolean"
  }
  L6_105 = "commandSlot_compatibility"
  L6_105 = {
    "giftCommandSlot_commandId",
    "array",
    10,
    "integer16"
  }
  L3_102 = {L4_103, L5_104}
  L4_103 = {L5_104, L6_105}
  L5_104 = "tp"
  L6_105 = "integer16"
  L5_104 = {L6_105, "integer32"}
  L6_105 = "targetInformation"
  L4_103 = {
    L5_104,
    L6_105,
    {
      "forceControl_int16_forClientSelf",
      "array",
      2,
      "integer16"
    },
    {
      "otherClassAbilityCount",
      "array",
      2,
      "integer8"
    },
    {
      "giftCount",
      "array",
      2,
      "integer8"
    }
  }
  L5_104 = {
    L6_105,
    "array",
    40,
    "integer16"
  }
  L6_105 = "maxCommandRecastTime"
  L6_105 = {
    "forceControl_float_forClientSelf",
    "array",
    4,
    "float"
  }
  L5_104 = {
    L6_105,
    {
      "stateForAll",
      1.5,
      {
        "parameterSave",
        "state_mainSkill"
      },
      {
        "parameterSave",
        "state_mainSkillLevel"
      },
      {
        "parameterTemp",
        "targetInformation"
      }
    }
  }
  L6_105 = {
    "stateAtQuicklyForAll",
    0.3,
    {
      "parameterSave",
      "hp",
      1
    },
    {
      "parameterSave",
      "hpMax",
      1
    },
    {
      "parameterSave",
      "mp"
    },
    {
      "parameterSave",
      "mpMax"
    },
    {
      "parameterTemp",
      "tp"
    }
  }
  L6_105 = {
    {
      "stateAtQuicklyForSelf",
      1,
      A0_99,
      {
        "parameterSave",
        "state_boostPointForSkill"
      }
    },
    {
      "commandDetailForSelf",
      1,
      A0_99,
      {
        "parameterSave",
        "commandSlot_compatibility"
      },
      {
        "parameterSave",
        "commandSlot_recastTime"
      },
      {
        "parameterTemp",
        "maxCommandRecastTime"
      },
      {
        "parameterTemp",
        "forceControl_float_forClientSelf"
      },
      {
        "parameterTemp",
        "forceControl_int16_forClientSelf"
      }
    },
    {
      "commandEquip",
      1,
      A0_99,
      {
        "parameterSave",
        "giftCommandSlot_commandId"
      },
      {
        "parameterTemp",
        "otherClassAbilityCount"
      },
      {
        "parameterTemp",
        "giftCount"
      }
    }
  }
  return L1_100, L2_101, L3_102, L4_103, L5_104, L6_105
end
function CharaBaseClass.getTPMax(A0_106)
  if not A0_106:hasGameParameter() then
    return 0
  end
  return 3000
end
function CharaBaseClass.searchCommandSlot(A0_107, A1_108, A2_109)
  local L3_110, L4_111, L5_112, L6_113, L7_114, L8_115
  for L6_113 = 1, 30 do
    L8_115 = A0_107
    L7_114 = A0_107.getCustomCommand
    L8_115 = L7_114(L8_115, L6_113)
    if L7_114 ~= nil and L7_114:_isAlive() then
      if L7_114:getCommandId() == A1_108 and (A2_109 == nil or A2_109 == L8_115) then
        return L6_113, L8_115
      end
    elseif A1_108 == 0 then
      return L6_113
    end
  end
  return L3_110
end
function CharaBaseClass.getBattalion(A0_116)
  local L1_117
  L1_117 = 0
  return L1_117
end
function CharaBaseClass.getLooksPartyTarget(A0_118, A1_119, A2_120, A3_121)
  if not A0_118:hasGameParameter() then
    return nil
  elseif A1_119:getTargetInformationOpenThinking() ~= 0 then
    if A2_120 == nil then
      A2_120 = A0_118:getParty()
    end
    if A3_121 == nil then
      A3_121 = A1_119:getParty()
    end
    if A2_120 == A3_121 then
      return (A1_119:getTargetInformationOpenThinking())
    end
  elseif A1_119:getTargetInformationPartyTarget() ~= 0 then
    if A2_120 == nil then
      A2_120 = A0_118:getParty()
    end
    if A3_121 == nil then
      A3_121 = A1_119:getParty()
    end
    return (A1_119:getTargetInformationPartyTarget())
  end
  return nil
end
function CharaBaseClass.getExpBPCostSheetData(A0_122, A1_123, A2_124)
  local L3_125
  if A2_124 == 0 then
    if A1_123 <= 10 then
      L3_125 = {
        15,
        20,
        25,
        30,
        35,
        40,
        45,
        50,
        55,
        60
      }
      return L3_125[A1_123]
    elseif A1_123 <= 20 then
      L3_125 = {
        65,
        70,
        75,
        80,
        85,
        90,
        96,
        102,
        108,
        116
      }
      return L3_125[A1_123 - 10]
    else
      if A1_123 <= 30 then
        L3_125 = {
          122,
          128,
          136,
          144,
          152,
          160,
          168,
          176,
          184
        }
        return L3_125[A1_123 - 20]
      else
      end
    end
  elseif A2_124 == 1 then
    if A1_123 <= 10 then
      L3_125 = {
        1,
        1,
        1,
        1,
        1,
        2,
        2,
        2,
        2,
        2
      }
      return L3_125[A1_123]
    elseif A1_123 <= 20 then
      L3_125 = {
        2,
        2,
        2,
        3,
        3,
        3,
        3,
        3,
        3,
        3
      }
      return L3_125[A1_123 - 10]
    else
      if A1_123 <= 30 then
        L3_125 = {
          3,
          4,
          4,
          4,
          4,
          4,
          4,
          4,
          4
        }
        return L3_125[A1_123 - 20]
      else
      end
    end
  elseif A2_124 == 2 then
    if A1_123 <= 10 then
      L3_125 = {
        5,
        10,
        15,
        20,
        25,
        35,
        45,
        55,
        65,
        75
      }
      return L3_125[A1_123]
    elseif A1_123 <= 20 then
      L3_125 = {
        85,
        95,
        105,
        120,
        135,
        153,
        171,
        189,
        213,
        231
      }
      return L3_125[A1_123 - 10]
    else
      if A1_123 <= 30 then
        L3_125 = {
          249,
          281,
          313,
          345,
          377,
          409,
          441,
          473,
          -1
        }
        return L3_125[A1_123 - 20]
      else
      end
    end
  else
    if A2_124 == 3 then
      if A1_123 <= 10 then
        L3_125 = {
          20,
          25,
          30,
          35,
          40,
          45,
          50,
          55,
          60,
          65
        }
        return L3_125[A1_123]
      elseif A1_123 <= 20 then
        L3_125 = {
          70,
          75,
          80,
          85,
          90,
          96,
          102,
          108,
          116,
          122
        }
        return L3_125[A1_123 - 10]
      else
        if A1_123 <= 30 then
          L3_125 = {
            128,
            136,
            144,
            152,
            160,
            168,
            176,
            184,
            -1
          }
          return L3_125[A1_123 - 20]
        else
        end
      end
    else
    end
  end
end
function CharaBaseClass.isInPvP(A0_126)
  local L1_127
  L1_127 = false
  return L1_127
end
function CharaBaseClass.getBonusPointStockForPhysical(A0_128)
  local L1_129
  L1_129 = 0
  return L1_129
end
function CharaBaseClass.getBonusPointStockForElement(A0_130)
  local L1_131
  L1_131 = 0
  return L1_131
end
function CharaBaseClass.getBonusPointAtPhysicalParameter(A0_132, A1_133)
  local L2_134
  L2_134 = 0
  return L2_134
end
function CharaBaseClass.isPassedBonusPointRetakeTime(A0_135)
  local L1_136
  L1_136 = true
  return L1_136
end
function CharaBaseClass.getRetakeBonusPointAtPhysicalParameter(A0_137)
  local L1_138, L2_139, L3_140, L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147, L11_148, L12_149, L13_150
  L1_138 = 0
  L2_139 = 0
  L3_140 = 0
  L4_141 = 0
  L5_142 = 0
  L6_143 = 0
  L7_144 = 0
  L8_145 = 0
  L9_146 = 0
  L10_147 = 0
  L11_148 = 0
  L12_149 = 0
  L13_150 = 0
  return L1_138, L2_139, L3_140, L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147, L11_148, L12_149, L13_150
end
function CharaBaseClass.processInitParameterFromBonusPoint(A0_151, A1_152, A2_153)
  local L3_154
  L3_154 = 0
  return L3_154
end
function CharaBaseClass.getParameterMaxFromBonusPoint(A0_155)
  local L1_156
  L1_156 = 0
  return L1_156
end
