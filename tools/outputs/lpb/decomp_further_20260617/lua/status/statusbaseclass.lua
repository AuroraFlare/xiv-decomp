local L0_0, L1_1
L0_0 = StatusBaseClass
function L1_1(A0_2)
  return A0_2:_getStaticActorID()
end
L0_0.getStatusId = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_3, A1_4)
  return statusSheet:_getData(A0_3:getStatusId(), A1_4)
end
L0_0.getStatusData = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_5)
  if A0_5:getStatusId() >= 223000 and A0_5:getStatusId() <= 231999 or A0_5:getStatusId() >= 253000 and A0_5:getStatusId() <= 254999 then
    return true
  else
    return false
  end
end
L0_0.isShownStatus = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_6)
  if A0_6:getStatusId() >= 220000 and A0_6:getStatusId() <= 222999 or A0_6:getStatusId() >= 251000 and A0_6:getStatusId() <= 252999 then
    return true
  else
    return false
  end
end
L0_0.isHiddenStatus = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_7)
  local L1_8
  L1_8 = false
  return L1_8
end
L0_0.isBadStatus = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_9)
  local L1_10
  L1_10 = false
  return L1_10
end
L0_0.isGoodStatus = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_11)
  return A0_11:isBadStatus() and A0_11:isGoodStatus() or not A0_11:isBadStatus() and not A0_11:isGoodStatus()
end
L0_0.isNeutralStatus = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_12)
  local L1_13
  L1_13 = true
  return L1_13
end
L0_0.isRemovedFromDeath = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_14)
  local L1_15
  L1_15 = false
  return L1_15
end
L0_0.isRemovedAtChangeMainSkill = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_16)
  return A0_16:isBadStatus()
end
L0_0.canRegist = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_17)
  return A0_17:isBadStatus()
end
L0_0.canLifeAdjust = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_18)
  local L1_19
  L1_19 = 5
  return L1_19
end
L0_0.getObjectClassId = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_20)
  local L1_21
  L1_21 = false
  return L1_21
end
L0_0.canStartOnDead = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_22)
  return A0_22:getStatusData(45)
end
L0_0.getProcessPriority = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_23, A1_24, A2_25, A3_26)
  if A1_24 == nil then
    return 1
  else
    return A1_24:getCommandCompatibility(A2_25, A3_26)
  end
end
L0_0.getStatusCompatibility = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_27, A1_28, A2_29, A3_30, A4_31)
  local L5_32
  if A3_30 == 2 then
    L5_32 = A1_28:getStateMainSkillForSub()
  else
    L5_32 = A1_28:getStateMainSkill()
  end
  return A0_27:getStatusCompatibility(A2_29, L5_32, A1_28)
end
L0_0.getStatusCompatibilityByHand = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_33, A1_34, A2_35, A3_36, A4_37, A5_38)
  if A3_36 ~= nil and A1_34 ~= 0 then
  end
  return A0_33:getStatusCompatibilityByHand(A2_35, A3_36, A4_37, A5_38) - (1 - A0_33:getStatusCompatibilityByHand(A2_35, A3_36, A4_37, A5_38)) * A1_34
end
L0_0.getStatusCompatibilityWithAdjust = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_39, A1_40, A2_41, A3_42, A4_43, A5_44, A6_45, A7_46, A8_47)
  local L9_48, L10_49, L11_50, L12_51
  if A2_41 ~= nil then
    L10_49 = A6_45
    L9_48 = A6_45.getCommandLevel
    L9_48 = L9_48(L10_49)
    L11_50 = A5_44
    L10_49 = A5_44.getStateMainSkillLevel
    L10_49 = L10_49(L11_50)
    L12_51 = A6_45
    L11_50 = A6_45.getCommandLevelAdjustLevelMax
    L12_51 = L11_50(L12_51)
    if L9_48 > L10_49 then
      if L11_50 ~= -1 then
        L10_49 = L9_48 - _math.min(L11_50, L9_48 - L10_49)
      else
      end
    else
      if L9_48 < L10_49 and L12_51 ~= -1 then
        L10_49 = L9_48 + _math.min(L12_51, L10_49 - L9_48)
      else
      end
    end
    if L9_48 > L10_49 then
      A1_40 = A1_40 - (A1_40 - A5_44:getGrowData(L10_49, A2_41) * (A1_40 / A5_44:getGrowData(L9_48, A2_41))) * A3_42
    elseif L9_48 < L10_49 then
      A1_40 = A1_40 + (A5_44:getGrowData(L10_49, A2_41) * (A1_40 / A5_44:getGrowData(L9_48, A2_41)) - A1_40) * A4_43
    end
  end
  return A1_40
end
L0_0.getStatusLevelAdjust = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_52, A1_53, A2_54, A3_55, A4_56)
  local L5_57
  L5_57 = 0.7
  return L5_57
end
L0_0.getStatusParam1AdjustForHighLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_58, A1_59, A2_60, A3_61, A4_62)
  local L5_63
  L5_63 = 0.7
  return L5_63
end
L0_0.getStatusParam2AdjustForHighLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_64, A1_65, A2_66, A3_67, A4_68)
  local L5_69
  L5_69 = 0.7
  return L5_69
end
L0_0.getStatusParam3AdjustForHighLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_70, A1_71, A2_72, A3_73, A4_74)
  local L5_75
  L5_75 = 0.7
  return L5_75
end
L0_0.getStatusPowerAdjustForHighLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_76, A1_77, A2_78, A3_79, A4_80)
  local L5_81
  L5_81 = 0.7
  return L5_81
end
L0_0.getStatusLifeAdjustForHighLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_82, A1_83, A2_84, A3_85, A4_86)
  local L5_87
  L5_87 = 1
  return L5_87
end
L0_0.getStatusParam1AdjustForLowLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_88, A1_89, A2_90, A3_91, A4_92)
  local L5_93
  L5_93 = 1
  return L5_93
end
L0_0.getStatusParam2AdjustForLowLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_94, A1_95, A2_96, A3_97, A4_98)
  local L5_99
  L5_99 = 1
  return L5_99
end
L0_0.getStatusParam3AdjustForLowLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_100, A1_101, A2_102, A3_103, A4_104)
  local L5_105
  L5_105 = 1
  return L5_105
end
L0_0.getStatusPowerAdjustForLowLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_106, A1_107, A2_108, A3_109, A4_110)
  local L5_111
  L5_111 = 1
  return L5_111
end
L0_0.getStatusLifeAdjustForLowLevelUse = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_112, A1_113, A2_114, A3_115, A4_116)
  local L5_117
  L5_117 = A0_112.getStatusData
  L5_117 = L5_117(A0_112, 30)
  if L5_117 < 0 then
    L5_117 = nil
  else
    L5_117 = A1_113:judgeGrowColumn(A4_116, L5_117)
  end
  return L5_117
end
L0_0.getStatusParam1LevelAdjustGrow = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_118, A1_119, A2_120, A3_121, A4_122)
  local L5_123
  L5_123 = A0_118.getStatusData
  L5_123 = L5_123(A0_118, 34)
  if L5_123 < 0 then
    L5_123 = nil
  else
    L5_123 = A1_119:judgeGrowColumn(A4_122, L5_123)
  end
  return L5_123
end
L0_0.getStatusParam2LevelAdjustGrow = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_124, A1_125, A2_126, A3_127, A4_128)
  local L5_129
  L5_129 = A0_124.getStatusData
  L5_129 = L5_129(A0_124, 38)
  if L5_129 < 0 then
    L5_129 = nil
  else
    L5_129 = A1_125:judgeGrowColumn(A4_128, L5_129)
  end
  return L5_129
end
L0_0.getStatusParam3LevelAdjustGrow = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_130, A1_131, A2_132, A3_133, A4_134)
  local L5_135
  L5_135 = A0_130.getStatusData
  L5_135 = L5_135(A0_130, 26)
  if L5_135 < 0 then
    L5_135 = nil
  else
    L5_135 = A1_131:judgeGrowColumn(A4_134, L5_135)
  end
  return L5_135
end
L0_0.getStatusPowerLevelAdjustGrow = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_136, A1_137, A2_138, A3_139, A4_140)
  local L5_141
  L5_141 = A0_136.getStatusData
  L5_141 = L5_141(A0_136, 48)
  if L5_141 < 0 then
    L5_141 = nil
  else
    L5_141 = A1_137:judgeGrowColumn(A4_140, L5_141)
  end
  return L5_141
end
L0_0.getStatusLifeLevelAdjustGrow = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_142, A1_143, A2_144, A3_145, A4_146, A5_147)
  local L6_148, L7_149, L8_150
  L8_150 = A0_142.getStatusData
  L8_150 = L8_150(A0_142, 31)
  if A1_143 ~= nil and A3_145 ~= nil and A4_146 ~= nil and A4_146:_isAlive() then
    L6_148 = A0_142:getStatusCompatibilityWithAdjust(A0_142:getStatusData(32), A1_143, A2_144, A3_145, A4_146)
    L8_150 = A0_142:getStatusLevelAdjust(L8_150, A0_142:getStatusParam1LevelAdjustGrow(A1_143, A2_144, A3_145, A4_146), A0_142:getStatusParam1AdjustForLowLevelUse(A1_143, A2_144, A3_145, A4_146), A0_142:getStatusParam1AdjustForHighLevelUse(A1_143, A2_144, A3_145, A4_146), A1_143, A2_144, A3_145, A4_146)
  else
    L6_148 = 1
    L7_149 = 1
  end
  return L8_150 * L6_148
end
L0_0.getStatusParam1AtSheet = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_151, A1_152, A2_153, A3_154, A4_155, A5_156)
  local L6_157, L7_158, L8_159
  L8_159 = A0_151.getStatusData
  L8_159 = L8_159(A0_151, 35)
  if A1_152 ~= nil and A3_154 ~= nil and A4_155 ~= nil and A4_155:_isAlive() then
    L6_157 = A0_151:getStatusCompatibilityWithAdjust(A0_151:getStatusData(36), A1_152, A2_153, A3_154, A4_155)
    L8_159 = A0_151:getStatusLevelAdjust(L8_159, A0_151:getStatusParam2LevelAdjustGrow(A1_152, A2_153, A3_154, A4_155), A0_151:getStatusParam2AdjustForLowLevelUse(A1_152, A2_153, A3_154, A4_155), A0_151:getStatusParam2AdjustForHighLevelUse(A1_152, A2_153, A3_154, A4_155), A1_152, A2_153, A3_154, A4_155)
  else
    L6_157 = 1
    L7_158 = 1
  end
  return L8_159 * L6_157
end
L0_0.getStatusParam2AtSheet = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_160, A1_161, A2_162, A3_163, A4_164, A5_165)
  local L6_166, L7_167, L8_168
  L8_168 = A0_160.getStatusData
  L8_168 = L8_168(A0_160, 39)
  if A1_161 ~= nil and A3_163 ~= nil and A4_164 ~= nil and A4_164:_isAlive() then
    L6_166 = A0_160:getStatusCompatibilityWithAdjust(A0_160:getStatusData(40), A1_161, A2_162, A3_163, A4_164)
    L8_168 = A0_160:getStatusLevelAdjust(L8_168, A0_160:getStatusParam3LevelAdjustGrow(A1_161, A2_162, A3_163, A4_164), A0_160:getStatusParam3AdjustForLowLevelUse(A1_161, A2_162, A3_163, A4_164), A0_160:getStatusParam3AdjustForHighLevelUse(A1_161, A2_162, A3_163, A4_164), A1_161, A2_162, A3_163, A4_164)
  else
    L6_166 = 1
    L7_167 = 1
  end
  return L8_168 * L6_166
end
L0_0.getStatusParam3AtSheet = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_169, A1_170, A2_171, A3_172, A4_173, A5_174)
  local L6_175, L7_176, L8_177
  L8_177 = A0_169.getStatusData
  L8_177 = L8_177(A0_169, 27)
  if A1_170 ~= nil and A3_172 ~= nil and A4_173 ~= nil and A4_173:_isAlive() then
    L6_175 = A0_169:getStatusCompatibilityWithAdjust(A0_169:getStatusData(28), A1_170, A2_171, A3_172, A4_173)
    L8_177 = A0_169:getStatusLevelAdjust(L8_177, A0_169:getStatusPowerLevelAdjustGrow(A1_170, A2_171, A3_172, A4_173), A0_169:getStatusPowerAdjustForLowLevelUse(A1_170, A2_171, A3_172, A4_173), A0_169:getStatusPowerAdjustForHighLevelUse(A1_170, A2_171, A3_172, A4_173), A1_170, A2_171, A3_172, A4_173)
  else
    L6_175 = 1
    L7_176 = 1
  end
  return L8_177 * L6_175
end
L0_0.getStatusPowerAtSheet = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_178, A1_179, A2_180, A3_181, A4_182, A5_183)
  local L6_184, L7_185, L8_186
  L8_186 = A0_178.getStatusData
  L8_186 = L8_186(A0_178, 47)
  if A1_179 ~= nil and A3_181 ~= nil and A4_182 ~= nil and A4_182:_isAlive() then
    L6_184 = A0_178:getStatusCompatibilityWithAdjust(A0_178:getStatusData(49), A1_179, A2_180, A3_181, A4_182)
    L8_186 = A0_178:getStatusLevelAdjust(L8_186, A0_178:getStatusLifeLevelAdjustGrow(A1_179, A2_180, A3_181, A4_182), A0_178:getStatusLifeAdjustForLowLevelUse(A1_179, A2_180, A3_181, A4_182), A0_178:getStatusLifeAdjustForHighLevelUse(A1_179, A2_180, A3_181, A4_182), A1_179, A2_180, A3_181, A4_182)
  else
    L6_184 = 1
    L7_185 = 1
  end
  return L8_186 * L6_184
end
L0_0.getStatusLifeAtSheet = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_187)
  local L1_188
  L1_188 = A0_187._callSuperClassFunc
  L1_188(A0_187, "_onInit")
  L1_188 = A0_187._getStaticActorID
  L1_188 = L1_188(A0_187)
  statusSheet:_loadKeySemipermanently(L1_188, L1_188)
end
L0_0._onInit = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_189)
  local L1_190
  L1_190 = A0_189._callSuperClassFunc
  L1_190(A0_189, "_onFinalize")
  L1_190 = A0_189._getStaticActorID
  L1_190 = L1_190(A0_189)
  statusSheet:_unloadKey(L1_190, L1_190)
end
L0_0._onFinalize = L1_1
L0_0 = StatusBaseClass
function L1_1(A0_191)
  return statusSheet:_getData(A0_191:getStatusId(), 25)
end
L0_0.getStatusIcon = L1_1
