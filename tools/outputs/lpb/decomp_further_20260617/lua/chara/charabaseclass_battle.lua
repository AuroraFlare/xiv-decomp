require("/Chara/CharaBaseClass_ffxivbattle")
function CharaBaseClass.isLiving(A0_0)
  return A0_0:_isAlive() and (not A0_0:hasGameParameter() or A0_0:getHP() > 0)
end
function CharaBaseClass.getSkillPoint(A0_1, A1_2)
  local L2_3
  L2_3 = A0_1.charaWork
  L2_3 = L2_3.battleSave
  L2_3 = L2_3.skillPoint
  L2_3 = L2_3[A1_2]
  return L2_3
end
function CharaBaseClass.getSkillLevelCap(A0_4, A1_5)
  local L2_6
  if A1_5 == 0 then
    L2_6 = 0
    return L2_6
  else
    L2_6 = A0_4.charaWork
    L2_6 = L2_6.battleSave
    L2_6 = L2_6.skillLevelCap
    L2_6 = L2_6[A1_5]
    return L2_6
  end
end
function CharaBaseClass.getSkillCategory(A0_7, A1_8)
  local L2_9
  if A1_8 == 0 then
    L2_9 = 0
    return L2_9
  end
  if A1_8 >= 39 then
    L2_9 = 39
    return L2_9
  elseif A1_8 >= 29 then
    L2_9 = 29
    return L2_9
  elseif A1_8 >= 21 then
    L2_9 = 21
    return L2_9
  elseif A1_8 >= 1 then
    L2_9 = 1
    return L2_9
  else
    L2_9 = 0
    return L2_9
  end
end
function CharaBaseClass.getMainSkillCategory(A0_10)
  local L1_11, L2_12
  L2_12 = A0_10
  L1_11 = A0_10.getSkillCategory
  return L1_11(L2_12, A0_10:getStateMainSkill())
end
function CharaBaseClass.isGatherer(A0_13)
  if A0_13:getMainSkillCategory() == 39 then
    return true
  end
  return false
end
function CharaBaseClass.isCrafter(A0_14)
  if A0_14:getMainSkillCategory() == 29 then
    return true
  end
  return false
end
function CharaBaseClass.isSkillCapped(A0_15, A1_16)
  if A0_15:getSkillLevelCap(A1_16) == 255 then
    return true
  else
    return false
  end
end
function CharaBaseClass.isSkillEnabled(A0_17, A1_18)
  return A0_17:getSkillLevel(A1_18) ~= 0
end
function CharaBaseClass.getCastSpeed(A0_19, A1_20)
  local L2_21
  L2_21 = A0_19.charaWork
  L2_21 = L2_21.battleTemp
  L2_21 = L2_21.castGauge_speed
  L2_21 = L2_21[A1_20]
  return L2_21
end
function CharaBaseClass.getCastSpeedAtEquip(A0_22, A1_23)
  local L2_24
  L2_24 = A0_22.charaWork
  L2_24 = L2_24.battleTemp
  L2_24 = L2_24.castGauge_speedAtEquip
  L2_24 = L2_24[A1_23]
  return L2_24
end
function CharaBaseClass.isBattleCharacter(A0_25)
  return A0_25:isPropertyEnabled(3)
end
function CharaBaseClass.getObjectClassId(A0_26)
  local L1_27
  L1_27 = 1
  return L1_27
end
function CharaBaseClass.isExistRemoveItemFromEquip(A0_28, A1_29, A2_30, A3_31)
  local L4_32, L5_33, L6_34
  if A2_30 == 1 then
    L5_33 = A0_28
    L4_32 = A0_28._getEquippingItem
    L4_32 = L4_32(L5_33, L6_34)
    if L4_32 ~= nil then
      L5_33 = A3_31.getItemMainSkill
      L5_33 = L5_33(L6_34)
      if A0_28:isJob(L6_34) and A0_28:convertSkillId(L6_34) == L5_33 then
        L5_33 = L6_34
      end
      if L4_32:getItemCompatibilityBySkill(L5_33) == 0 then
        return true
      end
    end
  end
  L5_33 = A3_31
  L4_32 = A3_31.getEquipmentEquipPointDetail
  L5_33 = L4_32(L5_33)
  if L5_33 ~= nil then
    for _FORV_9_ = 1, #L5_33 do
      if L5_33[_FORV_9_] == A1_29 then
        if A0_28:_getEquippingItem(A1_29) ~= nil then
          return true
        else
          return false
        end
      end
    end
  elseif A1_29 == A2_30 then
    if L6_34 ~= nil then
      return L6_34
    end
  end
  return L6_34
end
function CharaBaseClass.getEquipPointByHand(A0_35, A1_36)
  local L2_37, L3_38
  L2_37 = A1_36
  if L2_37 == 1 then
    L3_38 = 1
    return L3_38
  else
  end
  if L2_37 == 2 then
    L3_38 = 2
    return L3_38
  else
  end
  if L2_37 == 0 then
    L3_38 = 1
    return L3_38
  else
  end
end
function CharaBaseClass.getEquipPointByAttackIndex(A0_39, A1_40)
  local L2_41, L3_42
  L2_41 = A1_40
  if L2_41 == 1 then
    L3_42 = 1
    return L3_42
  else
  end
  if L2_41 == 2 then
    L3_42 = 2
    return L3_42
  else
  end
  if L2_41 == 3 then
    L3_42 = 5
    return L3_42
  else
  end
  if L2_41 == 4 then
    L3_42 = 6
    return L3_42
  else
  end
  if L2_41 == 5 then
    L3_42 = 7
    return L3_42
  else
  end
end
function CharaBaseClass.getEquipPointByParts(A0_43, A1_44)
  local L2_45, L3_46
  L2_45 = A1_44
  if L2_45 == 1 then
    L3_46 = 11
    return L3_46
  else
  end
  if L2_45 == 2 then
    L3_46 = 1
    return L3_46
  else
  end
  if L2_45 == 3 then
    L3_46 = 2
    return L3_46
  else
  end
  if L2_45 == 4 then
    L3_46 = 13
    return L3_46
  else
  end
  if L2_45 == 5 then
    L3_46 = 9
    return L3_46
  elseif L2_45 == 6 then
  elseif L2_45 == 7 then
  else
    if L2_45 == 8 then
    else
    end
  end
end
function CharaBaseClass.isEquipPointUseToAmmo(A0_47, A1_48)
  local L2_49, L3_50, L4_51
  L2_49 = A1_48
  if L2_49 == 5 then
    L3_50 = true
    L4_51 = 5
    return L3_50, L4_51
  else
  end
  if L2_49 == 6 then
    L3_50 = true
    L4_51 = 1
    return L3_50, L4_51
  else
  end
  if L2_49 == 7 then
    L3_50 = true
    L4_51 = 2
    return L3_50, L4_51
  else
  end
  L3_50 = false
  L4_51 = nil
  return L3_50, L4_51
end
function CharaBaseClass.getAttackWorkIndexByEquipPoint(A0_52, A1_53)
  local L2_54, L3_55
  L2_54 = A1_53
  if L2_54 == 1 then
    L3_55 = 1
    return L3_55
  else
  end
  if L2_54 == 2 then
    L3_55 = 2
    return L3_55
  else
  end
  if L2_54 == 5 then
    L3_55 = 3
    return L3_55
  else
  end
  if L2_54 == 6 then
    L3_55 = 4
    return L3_55
  else
  end
  if L2_54 == 7 then
    L3_55 = 5
    return L3_55
  else
  end
  L3_55 = nil
  return L3_55
end
function CharaBaseClass.getAttackWorkIndexByHand(A0_56, A1_57)
  local L2_58, L3_59
  L2_58 = A1_57
  if L2_58 == 1 then
    L3_59 = 1
    return L3_59
  else
  end
  if L2_58 == 2 then
    L3_59 = 2
    return L3_59
  else
  end
  if L2_58 == 0 then
    L3_59 = 1
    return L3_59
  else
  end
end
function CharaBaseClass.getAttackWorkIndexByParts(A0_60, A1_61)
  local L2_62, L3_63
  L2_62 = A1_61
  if L2_62 == 2 then
    L3_63 = 1
    return L3_63
  else
  end
  if L2_62 == 3 then
    L3_63 = 2
    return L3_63
  else
  end
end
function CharaBaseClass.getAttackWorkIndexByMyCommandIndex(A0_64, A1_65)
  local L2_66, L3_67
  L2_66 = A1_65
  if L2_66 == 1 then
    L3_67 = 1
    return L3_67
  else
  end
  if L2_66 == 2 then
    L3_67 = 2
    return L3_67
  else
  end
end
function CharaBaseClass.isAttackWorkIndexUseToAmmo(A0_68, A1_69)
  local L2_70, L3_71
  L2_70 = A1_69
  if L2_70 == 3 then
  elseif L2_70 == 4 then
  else
  end
  if L2_70 == 5 then
    L3_71 = true
    return L3_71
  else
  end
  L3_71 = false
  return L3_71
end
function CharaBaseClass.getCraftWorkIndexByEquipPoint(A0_72, A1_73)
  local L2_74, L3_75
  L2_74 = A1_73
  if L2_74 == 1 then
    L3_75 = 1
    return L3_75
  else
  end
  if L2_74 == 2 then
    L3_75 = 2
    return L3_75
  else
  end
end
function CharaBaseClass.getCraftWorkIndexByHand(A0_76, A1_77)
  local L2_78, L3_79
  L2_78 = A1_77
  if L2_78 == 1 then
    L3_79 = 1
    return L3_79
  else
  end
  if L2_78 == 2 then
    L3_79 = 2
    return L3_79
  else
  end
end
function CharaBaseClass.getHarvestWorkIndexByEquipPoint(A0_80, A1_81)
  local L2_82, L3_83
  L2_82 = A1_81
  if L2_82 == 1 then
    L3_83 = 1
    return L3_83
  else
  end
  if L2_82 == 2 then
    L3_83 = 2
    return L3_83
  else
  end
end
function CharaBaseClass.getHarvestWorkIndexByHand(A0_84, A1_85)
  local L2_86, L3_87
  L2_86 = A1_85
  if L2_86 == 1 then
    L3_87 = 1
    return L3_87
  else
  end
  if L2_86 == 2 then
    L3_87 = 2
    return L3_87
  else
  end
end
function CharaBaseClass.getMyCommandWorkIndexByHand(A0_88, A1_89)
  local L2_90, L3_91
  L2_90 = A1_89
  if L2_90 == 1 then
    L3_91 = 1
    return L3_91
  else
  end
  if L2_90 == 2 then
    L3_91 = 2
    return L3_91
  else
  end
  if L2_90 == 0 then
    L3_91 = 1
    return L3_91
  else
  end
end
function CharaBaseClass.getMyCommandWorkIndexByEquipPoint(A0_92, A1_93)
  local L2_94, L3_95
  L2_94 = A1_93
  if L2_94 == 1 then
    L3_95 = 1
    return L3_95
  else
  end
  if L2_94 == 2 then
    L3_95 = 2
    return L3_95
  else
  end
  if L2_94 == 5 then
    L3_95 = 1
    return L3_95
  else
  end
  if L2_94 == 6 then
    L3_95 = 1
    return L3_95
  else
  end
  if L2_94 == 7 then
    L3_95 = 2
    return L3_95
  else
  end
end
function CharaBaseClass.judgeAttackWorkIndex(A0_96, A1_97, A2_98)
  local L3_99
  L3_99 = A0_96.getAttackWorkIndexByHand
  L3_99 = L3_99(A0_96, A2_98)
  if A1_97 == nil then
    return L3_99, nil
  elseif A1_97:isThrowCommand() then
    return 3, 3
  elseif A0_96:getAttackUseAmmo(L3_99) ~= -1 and A1_97:getUseAmmoMax() ~= -1 then
    if A2_98 == 1 then
      return 1, 4
    elseif A2_98 == 2 then
      return 2, 5
    else
      return 1, 4
    end
  else
    return L3_99, nil
  end
end
function CharaBaseClass.getPartsWorkIndexByAttackIndex(A0_100, A1_101)
  local L2_102, L3_103
  L2_102 = A1_101
  if L2_102 == 1 then
    L3_103 = 2
    return L3_103
  else
  end
  if L2_102 == 2 then
    L3_103 = 3
    return L3_103
  else
  end
  if L2_102 == 3 then
    L3_103 = 2
    return L3_103
  else
  end
  if L2_102 == 4 then
    L3_103 = 2
    return L3_103
  else
  end
  if L2_102 == 5 then
    L3_103 = 3
    return L3_103
  else
  end
end
function CharaBaseClass.getHandByAttackIndex(A0_104, A1_105)
  local L2_106, L3_107
  L2_106 = A1_105
  if L2_106 == 1 then
    L3_107 = 1
    return L3_107
  else
  end
  if L2_106 == 2 then
    L3_107 = 2
    return L3_107
  else
  end
end
function CharaBaseClass.getHandByEquipPoint(A0_108, A1_109)
  local L2_110, L3_111
  L2_110 = A1_109
  if L2_110 == 1 then
    L3_111 = 1
    return L3_111
  else
  end
  if L2_110 == 2 then
    L3_111 = 2
    return L3_111
  else
  end
  if L2_110 == 3 then
    L3_111 = 1
    return L3_111
  else
  end
  if L2_110 == 4 then
    L3_111 = 2
    return L3_111
  else
  end
  if L2_110 == 5 then
    L3_111 = 1
    return L3_111
  else
  end
  if L2_110 == 6 then
    L3_111 = 1
    return L3_111
  else
  end
  if L2_110 == 7 then
    L3_111 = 2
    return L3_111
  else
  end
  L3_111 = 1
  return L3_111
end
function CharaBaseClass.judgeDirection(A0_112, A1_113, A2_114)
  local L3_115
  L3_115 = {
    false,
    false,
    false,
    false
  }
  if A1_113 >= 8 then
    L3_115[4] = true
    A1_113 = A1_113 - 8
  else
    L3_115[4] = false
  end
  if A1_113 >= 4 then
    L3_115[3] = true
    A1_113 = A1_113 - 4
  else
    L3_115[3] = false
  end
  if A1_113 >= 2 then
    L3_115[2] = true
    A1_113 = A1_113 - 2
  else
    L3_115[2] = false
  end
  if A1_113 >= 1 then
    L3_115[1] = true
  else
    L3_115[1] = false
  end
  if A2_114 == 4 then
  elseif A2_114 == 2 then
  else
  end
  return L3_115[4]
end
function CharaBaseClass.getStackedCombinationNum(A0_116)
  local L1_117
  L1_117 = 0
  return L1_117
end
function CharaBaseClass.getStackedCombinationTimer(A0_118, A1_119)
  local L2_120
  L2_120 = 0
  return L2_120
end
function CharaBaseClass.isParts(A0_121, A1_122)
  if A0_121:isPlayer() then
    return A1_122 <= 5
  elseif A0_121:isPropertyEnabled(3) then
    return A0_121:isPartsExists(A1_122)
  else
    return false
  end
end
function CharaBaseClass.processGetPartsDirection(A0_123)
  local L1_124
  L1_124 = {
    0,
    2,
    8,
    0,
    1,
    2,
    8,
    4
  }
  return L1_124
end
function CharaBaseClass.processGetPartsWideDirection(A0_125)
  local L1_126
  L1_126 = {
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  }
  return L1_126
end
function CharaBaseClass.isBreakedParts(A0_127, A1_128)
  if not A0_127:isParts(A1_128) then
    return false
  else
    return A0_127:_getSubStatBreakage(A1_128)
  end
end
function CharaBaseClass.getStatusLostTime(A0_129, A1_130)
  return A0_129:getStatusTime(A1_130)
end
function CharaBaseClass.adjustLockOnTargetDirection(A0_131, A1_132)
  local L2_133, L3_134, L4_135, L5_136
  L3_134 = A0_131
  L2_133 = A0_131._getDir
  L2_133 = L2_133(L3_134)
  if A1_132 ~= nil and A1_132 ~= A0_131 then
    L4_135 = A0_131
    L3_134 = A0_131.isPlayer
    L3_134 = L3_134(L4_135)
    if L3_134 then
      L4_135 = A1_132
      L3_134 = A1_132._getPos
      L5_136 = L3_134(L4_135)
      L2_133 = L2_133 + A0_131:_getOrientation(L3_134, 0, L5_136)
    end
  end
  return L2_133
end
function CharaBaseClass.judgeRelation(A0_137, A1_138, A2_139, A3_140)
  if not A0_137:isPropertyEnabled(3) then
    return 4
  end
  if not A1_138:isPropertyEnabled(3) then
    return 4
  end
  if A0_137 == A1_138 then
    return 3
  end
  if A2_139 == nil then
    A2_139 = A0_137:getParty()
  end
  if A2_139:_isMember(A1_138) == true then
    return 2
  elseif A0_137:getBattalion() ~= 0 and A0_137:getBattalion() == A1_138:getBattalion() then
    return 2
  elseif A0_137:isPlayer() and A1_138:isPlayer() then
    if A0_137:isInPvP() and A1_138:isInPvP() then
      return 1, false
    else
      return 2
    end
  elseif not A0_137:isPlayer() then
    if A1_138:isPlayer() then
      return 1, false
    elseif A0_137:getBattalion() ~= A1_138:getBattalion() then
      return 1, false
    else
      return 2, false
    end
  else
    if A1_138:getBattalion() == 1 then
      return 2
    end
    return 1, false
  end
end
function CharaBaseClass.canStartCombination(A0_141, A1_142)
  local L2_143
  L2_143 = false
  return L2_143
end
function CharaBaseClass.canAutoGuardWithAxe(A0_144)
  local L1_145
  L1_145 = false
  return L1_145
end
function CharaBaseClass.isNotoriousMonster(A0_146)
  if A0_146:getPotencial() == -1 then
    return true, 11
  elseif A0_146:getPotencial() == -2 then
    return true, 12
  elseif A0_146:getPotencial() == -3 then
    return true, 13
  elseif A0_146:getPotencial() == -4 then
    return true, 14
  else
    return false, 0
  end
end
function CharaBaseClass.getPotencial(A0_147)
  local L1_148
  L1_148 = A0_147.charaWork
  L1_148 = L1_148.battleSave
  L1_148 = L1_148.potencial
  return L1_148
end
function CharaBaseClass.calcPotencial(A0_149)
  local L1_150, L2_151
  L2_151 = A0_149.isPlayer
  L2_151 = L2_151(A0_149)
  if not L2_151 then
    L2_151 = A0_149.getMonsterBaseData
    L2_151 = L2_151(A0_149, 132)
    if type(L2_151) == "number" then
      if L2_151 == 1 then
        return -1
      elseif L2_151 == 2 then
        return -2
      elseif L2_151 == 3 then
        return -3
      elseif L2_151 == 4 then
        return -4
      else
        L1_150 = A0_149:getMonsterBaseData(87)
      end
    elseif L2_151 then
      return -1
    else
      L1_150 = A0_149:getMonsterBaseData(87)
    end
  else
    L1_150 = 1
  end
  L2_151 = {
    98,
    21,
    93,
    20,
    88,
    19,
    83,
    18,
    78,
    17,
    73,
    16,
    68,
    15,
    63,
    14,
    58,
    13,
    53,
    12,
    48,
    11,
    43,
    10,
    38,
    9,
    33,
    8,
    28,
    7,
    23,
    6,
    18,
    5,
    13,
    4,
    9,
    3,
    5,
    2,
    1,
    1
  }
  for _FORV_9_ = 1, #L2_151, 2 do
    if A0_149:getStateMainSkillLevel() >= L2_151[_FORV_9_] then
      if _FORV_9_ ~= 1 and A0_149:getStateMainSkillLevel() ~= L2_151[_FORV_9_] then
      end
      return (L2_151[_FORV_9_ + 1] + (L2_151[_FORV_9_ - 1] - L2_151[_FORV_9_ + 1]) * ((A0_149:getStateMainSkillLevel() - L2_151[_FORV_9_]) / (L2_151[_FORV_9_ - 2] - L2_151[_FORV_9_]))) * L1_150
    end
  end
  return _FOR_
end
function CharaBaseClass.calcOverLevelAdjust(A0_152, A1_153, A2_154)
  local L3_155
  if A2_154 == nil then
    L3_155 = A0_152.getStateMainSkillLevel
    L3_155 = L3_155(A0_152)
    A2_154 = L3_155
  end
  L3_155 = A1_153 - A2_154
  if _math.abs(L3_155) <= 10 then
    return 1
  else
  end
  if L3_155 < 0 then
    return (_math.sqrt(1 + (_math.abs(L3_155) - 10) * 0.4))
  elseif L3_155 > 0 then
    return 1 / _math.sqrt(1 + (_math.abs(L3_155) - 10) * 0.4)
  end
end
function CharaBaseClass.enableNegotiation(A0_156)
  local L1_157
  L1_157 = A0_156.charaWork
  L1_157 = L1_157.battleSave
  L1_157 = L1_157.negotiationFlag
  L1_157 = L1_157[1]
  if L1_157 then
    L1_157 = A0_156.charaWork
    L1_157 = L1_157.battleSave
    L1_157 = L1_157.negotiationFlag
    L1_157 = L1_157[2]
    L1_157 = not L1_157
  end
  return L1_157
end
function CharaBaseClass.initBattleSync(A0_158)
  local L1_159, L2_160, L3_161, L4_162, L5_163, L6_164
  L1_159 = {L2_160}
  L2_160 = {L3_161, L4_162}
  L3_161 = "potencial"
  L4_162 = "float"
  L2_160 = {
    L3_161,
    L4_162,
    L5_163,
    L6_164,
    {
      "skillPoint",
      "array",
      52,
      "integer32"
    },
    {
      "negotiationFlag",
      "array",
      2,
      "boolean"
    }
  }
  L3_161 = {L4_162, L5_163}
  L4_162 = "physicalLevel"
  L5_163 = "integer16"
  L4_162 = {L5_163, L6_164}
  L5_163 = "physicalExp"
  L6_164 = "integer32"
  L5_163 = {
    L6_164,
    "array",
    52,
    "integer16"
  }
  L6_164 = "skillLevel"
  L6_164 = {
    "skillLevelCap",
    "array",
    52,
    "integer16"
  }
  L3_161 = {}
  L4_162 = {
    L5_163,
    L6_164,
    {
      "generalParameter",
      "array",
      35,
      "integer16"
    }
  }
  L5_163 = {
    L6_164,
    "array",
    2,
    "float"
  }
  L6_164 = "castGauge_speed"
  L6_164 = {
    "timingCommandFlag",
    "array",
    4,
    "boolean"
  }
  L5_163 = {
    L6_164,
    {
      "exp",
      {"battleSave", "skillLevel"},
      {
        "battleSave",
        "skillLevelCap"
      }
    }
  }
  L6_164 = {
    "potencial",
    1,
    {"battleSave", "potencial"}
  }
  L6_164 = {
    {
      "battleStateForSelf",
      1,
      A0_158,
      {
        "battleTemp",
        "castGauge_speed"
      },
      {"battleSave", "skillPoint"},
      {
        "battleSave",
        "physicalExp"
      },
      {
        "battleSave",
        "negotiationFlag"
      }
    },
    {
      "timingCommand",
      1,
      A0_158,
      {
        "battleTemp",
        "timingCommandFlag"
      }
    },
    {
      "battleParameter",
      1,
      A0_158,
      {
        "battleTemp",
        "generalParameter",
        4
      },
      {
        "battleTemp",
        "generalParameter",
        5
      },
      {
        "battleTemp",
        "generalParameter",
        6
      },
      {
        "battleTemp",
        "generalParameter",
        7
      },
      {
        "battleTemp",
        "generalParameter",
        8
      },
      {
        "battleTemp",
        "generalParameter",
        9
      },
      {
        "battleTemp",
        "generalParameter",
        10
      },
      {
        "battleTemp",
        "generalParameter",
        11
      },
      {
        "battleTemp",
        "generalParameter",
        12
      },
      {
        "battleTemp",
        "generalParameter",
        14
      },
      {
        "battleTemp",
        "generalParameter",
        13
      },
      {
        "battleTemp",
        "generalParameter",
        15
      },
      {
        "battleTemp",
        "generalParameter",
        16
      },
      {
        "battleTemp",
        "generalParameter",
        17
      },
      {
        "battleTemp",
        "generalParameter",
        18
      },
      {
        "battleTemp",
        "generalParameter",
        19
      },
      {
        "battleTemp",
        "generalParameter",
        24
      },
      {
        "battleTemp",
        "generalParameter",
        25
      },
      {
        "battleTemp",
        "generalParameter",
        26
      },
      {
        "battleTemp",
        "generalParameter",
        27
      },
      {
        "battleTemp",
        "generalParameter",
        28
      },
      {
        "battleTemp",
        "generalParameter",
        29
      },
      {
        "battleTemp",
        "generalParameter",
        30
      },
      {
        "battleTemp",
        "generalParameter",
        31
      },
      {
        "battleTemp",
        "generalParameter",
        32
      },
      {
        "battleTemp",
        "generalParameter",
        33
      },
      {
        "battleTemp",
        "generalParameter",
        34
      },
      {
        "battleTemp",
        "generalParameter",
        35
      }
    }
  }
  return L1_159, L2_160, L3_161, L4_162, L5_163, L6_164
end
function CharaBaseClass.getPartsNameID(A0_165)
  if A0_165:isPlayer() then
    return 1
  elseif A0_165:isPropertyEnabled(3) then
    return A0_165:getPartsName()
  else
    return nil
  end
end
function CharaBaseClass.isMorrowTimingCommand(A0_166, A1_167)
  local L2_168
  L2_168 = A0_166.charaWork
  L2_168 = L2_168.battleTemp
  L2_168 = L2_168.timingCommandFlag
  L2_168 = L2_168[A1_167]
  return L2_168
end
function CharaBaseClass.getEnableTimingCommands(A0_169)
  local L1_170
  L1_170 = {
    nil,
    nil,
    nil,
    nil,
    nil,
    nil
  }
  if A0_169.charaWork.battleTemp.timingCommandFlag[1] then
    L1_170[0 + 1] = 27278
    L1_170[0 + 1 + 1] = 27279
  end
  if A0_169.charaWork.battleTemp.timingCommandFlag[2] then
    L1_170[0 + 1 + 1 + 1] = 27119
  end
  if A0_169.charaWork.battleTemp.timingCommandFlag[3] then
    L1_170[0 + 1 + 1 + 1 + 1] = 27198
    L1_170[0 + 1 + 1 + 1 + 1 + 1] = 27199
  end
  if A0_169.charaWork.battleTemp.timingCommandFlag[4] then
    L1_170[0 + 1 + 1 + 1 + 1 + 1 + 1] = 27158
    L1_170[0 + 1 + 1 + 1 + 1 + 1 + 1 + 1] = 27157
  end
  return L1_170
end
function CharaBaseClass.getMagicAttack(A0_171, A1_172)
  local L2_173
  L2_173 = 0
  return L2_173
end
function CharaBaseClass.getSkillPointMax(A0_174, A1_175)
  local L2_176
  if A1_175 <= 10 then
    L2_176 = {
      570,
      700,
      880,
      1100,
      1500,
      1800,
      2300,
      3200,
      4300,
      5000
    }
    return L2_176[A1_175]
  elseif A1_175 <= 20 then
    L2_176 = {
      5900,
      6800,
      7700,
      8700,
      9700,
      11000,
      12000,
      13000,
      15000,
      16000
    }
    return L2_176[A1_175 - 10]
  elseif A1_175 <= 30 then
    L2_176 = {
      20000,
      22000,
      23000,
      25000,
      27000,
      29000,
      31000,
      33000,
      35000,
      38000
    }
    return L2_176[A1_175 - 20]
  elseif A1_175 <= 40 then
    L2_176 = {
      45000,
      47000,
      50000,
      53000,
      56000,
      59000,
      62000,
      65000,
      68000,
      71000
    }
    return L2_176[A1_175 - 30]
  elseif A1_175 <= 50 then
    L2_176 = {
      74000,
      78000,
      81000,
      85000,
      89000,
      92000,
      96000,
      100000,
      100000,
      110000
    }
    return L2_176[A1_175 - 40]
  else
    L2_176 = 99999999
    return L2_176
  end
end
