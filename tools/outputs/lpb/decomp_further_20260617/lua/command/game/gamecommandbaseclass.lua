require("/Command/CommandBaseClass")
_defineBaseClass("GameCommandBaseClass", "CommandBaseClass")
function GameCommandBaseClass.getGameCommandData(A0_0, A1_1)
  return gameCommandSheet:_getData(A0_0:getCommandId(), A1_1)
end
function GameCommandBaseClass.getGameCommandBasicData(A0_2, A1_3)
  return gameCommandBasicSheet:_getData(A0_2:getCommandId(), A1_3)
end
function GameCommandBaseClass.getCommandLevel(A0_4)
  return A0_4:getGameCommandBasicData(39)
end
function GameCommandBaseClass.getCommandMainSkill(A0_5)
  return A0_5:getGameCommandBasicData(38)
end
function GameCommandBaseClass.canFireDetail(A0_6, A1_7, A2_8, A3_9, A4_10, A5_11, A6_12, A7_13, A8_14, A9_15, A10_16)
  local L11_17, L12_18
  L11_17 = true
  L12_18 = 0
  return L11_17, L12_18
end
function GameCommandBaseClass.processCanCommandForActorStat(A0_19, A1_20)
  if (A1_20:_getActorMainStat() == 1 or A1_20:_getActorMainStat() == 3) and not A0_19:canFireOnDead() then
    return false, A0_19:getCanCommandErrTextIdForDead()
  end
  if not A0_19:isAvailableOnSit() and (A1_20:_getActorMainStat() == 11 or A1_20:_getActorMainStat() == 13 or A1_20:_getActorMainStat() == 14) then
    return false, 32501
  end
  if A0_19:getGameCommandData(37) == 0 then
    return true, 0
  end
  if A1_20:_getActorMainStat() == 0 then
    if A0_19:getGameCommandData(37) == 1 or A0_19:getGameCommandData(37) == 5 or A0_19:getGameCommandData(37) == 6 or A0_19:getGameCommandData(37) == 7 or A0_19:getGameCommandData(37) == 2 then
      return true, 0
    else
      return false, A0_19:getCanCommandErrTextIdForActorStat()
    end
  elseif A1_20:_getActorMainStat() == 2 then
    if A0_19:getGameCommandData(37) == 2 or A0_19:getGameCommandData(37) == 5 then
      return true, 0
    else
      return false, A0_19:getCanCommandErrTextIdForActorStat()
    end
  elseif A1_20:_getActorMainStat() == 30 or A1_20:_getActorMainStat() == 31 or A1_20:_getActorMainStat() == 32 then
    if A0_19:getGameCommandData(37) == 3 or A0_19:getGameCommandData(37) == 6 then
      return true, 0
    else
      return false, A0_19:getCanCommandErrTextIdForActorStat()
    end
  elseif A1_20:_getActorMainStat() == 50 or A1_20:_getActorMainStat() == 51 then
    if A0_19:getGameCommandData(37) == 4 or A0_19:getGameCommandData(37) == 7 then
      return true, 0
    else
      return false, A0_19:getCanCommandErrTextIdForActorStat()
    end
  elseif A1_20:_getActorMainStat() == 70 then
    if A0_19:getGameCommandData(37) == 5 or A0_19:getGameCommandData(37) == 7 then
      return true, 0
    else
      return false, A0_19:getCanCommandErrTextIdForActorStat()
    end
  else
    return true, 0
  end
end
function GameCommandBaseClass.getCanCommandErrTextIdForDead(A0_21)
  local L1_22
  L1_22 = 32509
  return L1_22
end
function GameCommandBaseClass.getCanCommandErrTextIdForActorStat(A0_23)
  if A0_23:getGameCommandData(37) == 1 or A0_23:getGameCommandData(37) == 5 or A0_23:getGameCommandData(37) == 6 or A0_23:getGameCommandData(37) == 7 then
    return 32502
  elseif A0_23:getGameCommandData(37) == 2 or A0_23:getGameCommandData(37) == 5 then
    return 32503
  elseif A0_23:getGameCommandData(37) == 3 or A0_23:getGameCommandData(37) == 6 then
    return 32504
  elseif A0_23:getGameCommandData(37) == 4 or A0_23:getGameCommandData(37) == 7 then
    return 32505
  elseif A0_23:getGameCommandData(37) == 5 or A0_23:getGameCommandData(37) == 7 then
    return 32506
  else
    return 32501
  end
end
function GameCommandBaseClass.processCanCommandForSkill(A0_24, A1_25, A2_26)
  local L3_27
  L3_27 = A1_25.searchCommandSlot
  L3_27 = L3_27(A1_25, A0_24:getCommandId(), A2_26)
  if L3_27 ~= nil and not A1_25:getCommandSlotCompatibility(L3_27) then
    return false, 32527
  end
  return true, 0
end
function GameCommandBaseClass.processCanCommandForChangeActorStat(A0_28, A1_29)
  local L2_30
  L2_30 = A0_28.getGameCommandData
  L2_30 = L2_30(A0_28, 68)
  if L2_30 ~= -1 and not A1_29:_canChangeActorMainStat(L2_30) then
    return false, 32501
  end
  return true, 0
end
function GameCommandBaseClass.processCanCommandForHpCost(A0_31, A1_32, A2_33, A3_34)
  if A0_31:getCostHP(A1_32, A2_33, A3_34) == -2 then
    return false, 32551
  end
  return true, 0
end
function GameCommandBaseClass.processCanCommandForMpCost(A0_35, A1_36, A2_37, A3_38)
  if A0_35:getCostMP(A1_36, A2_37, A3_38) == -2 then
    return false, 32545
  end
  return true, 0
end
function GameCommandBaseClass.processCanCommandForTpCost(A0_39, A1_40, A2_41, A3_42)
  if A0_39:getCostTP(A1_40, A2_41, A3_42) == -2 then
    return false, 32546
  end
  return true, 0
end
function GameCommandBaseClass.processCanCommandForRecastTime(A0_43, A1_44, A2_45, A3_46)
  local L4_47
  L4_47 = A0_43.getRecastTime
  L4_47 = L4_47(A0_43, A1_44, A2_45, A3_46)
  if L4_47 > 0 then
    L4_47 = A1_44.searchCommandSlot
    L4_47 = L4_47(A1_44, A0_43:getCommandId(), A2_45)
    if L4_47 ~= nil and A1_44:getCommandRecastTime(L4_47) > worldMaster:_getServerTime() then
      return false, 32544
    end
  end
  L4_47 = true
  return L4_47, 0
end
function GameCommandBaseClass.isAttackCommand(A0_48)
  local L1_49
  L1_49 = false
  return L1_49
end
function GameCommandBaseClass.isMagicMissileCommand(A0_50)
  local L1_51
  L1_51 = false
  return L1_51
end
function GameCommandBaseClass.isDefenceCommand(A0_52)
  local L1_53
  L1_53 = false
  return L1_53
end
function GameCommandBaseClass.isAbilityCommand(A0_54)
  local L1_55
  L1_55 = false
  return L1_55
end
function GameCommandBaseClass.isMagicCommand(A0_56)
  local L1_57
  L1_57 = false
  return L1_57
end
function GameCommandBaseClass.isWeaponSkillCommand(A0_58)
  local L1_59
  L1_59 = false
  return L1_59
end
function GameCommandBaseClass.isLongRangeCommand(A0_60, A1_61, A2_62, A3_63)
  local L4_64
  L4_64 = false
  return L4_64
end
function GameCommandBaseClass.isGiftCommand(A0_65)
  return A0_65:getCommandId() >= 29500 and A0_65:getCommandId() <= 29799
end
function GameCommandBaseClass.isConstanceCommand(A0_66)
  local L1_67
  L1_67 = false
  return L1_67
end
function GameCommandBaseClass.isThrowCommand(A0_68)
  local L1_69
  L1_69 = false
  return L1_69
end
function GameCommandBaseClass.isNegotiationCommand(A0_70)
  return A0_70:isJudgedAtNegotiationJudge()
end
function GameCommandBaseClass.isAssistanceCommand(A0_71)
  local L1_72
  L1_72 = false
  return L1_72
end
function GameCommandBaseClass.isHostilityCommand(A0_73)
  return A0_73:canFireForRelation()
end
function GameCommandBaseClass.isPlayerCommand(A0_74)
  if A0_74:getCommandId() >= 23000 and A0_74:getCommandId() <= 23999 then
    return false
  else
    return true
  end
end
function GameCommandBaseClass.isHarvestCommand(A0_75)
  if A0_75:getCommandId() >= 22002 and A0_75:getCommandId() <= 22009 then
    return true
  else
    return false
  end
end
function GameCommandBaseClass.isCraftCommand(A0_76)
  if A0_76:getCommandId() == 22001 then
    return true
  else
    return false
  end
end
function GameCommandBaseClass.isAvailableOnSit(A0_77)
  local L1_78
  L1_78 = false
  return L1_78
end
function GameCommandBaseClass.isNormalAttackCategoryCommand(A0_79)
  if A0_79:isAttackCommand() or A0_79:isMagicMissileCommand() or A0_79:isThrowCommand() then
    return true
  else
    return false
  end
end
function GameCommandBaseClass.isPhysicalCategoryCommand(A0_80)
  if A0_80:isAttackCommand() or A0_80:isWeaponSkillCommand() or A0_80:isThrowCommand() then
    return true
  else
    return false
  end
end
function GameCommandBaseClass.isMagicCategoryCommand(A0_81)
  if A0_81:isMagicMissileCommand() or A0_81:isMagicCommand() then
    return true
  else
    return false
  end
end
function GameCommandBaseClass.isExclusiveMainHand(A0_82)
  local L1_83
  L1_83 = false
  return L1_83
end
function GameCommandBaseClass.getObjectClassId(A0_84)
  local L1_85
  L1_85 = 2
  return L1_85
end
function GameCommandBaseClass.getAttackVolume(A0_86, A1_87, A2_88, A3_89, A4_90)
  local L5_91
  L5_91 = 1
  return L5_91
end
function GameCommandBaseClass.getRecastTime(A0_92, A1_93, A2_94, A3_95)
  return A0_92:getGameCommandBasicData(79)
end
function GameCommandBaseClass.getRange(A0_96, A1_97, A2_98, A3_99)
  return A0_96:getGameCommandData(64)
end
function GameCommandBaseClass.getBestRange(A0_100, A1_101, A2_102, A3_103)
  return A0_100:getGameCommandData(65)
end
function GameCommandBaseClass.getMinimumRange(A0_104, A1_105, A2_106, A3_107)
  return A0_104:getGameCommandData(66)
end
function GameCommandBaseClass.getEffectRange(A0_108, A1_109, A2_110, A3_111)
  return A0_108:getGameCommandData(67)
end
function GameCommandBaseClass.getRangeAngle(A0_112, A1_113, A2_114, A3_115)
  local L4_116
  L4_116 = 120
  return L4_116
end
function GameCommandBaseClass.getRangeRotate(A0_117, A1_118, A2_119, A3_120)
  local L4_121
  L4_121 = 0
  return L4_121
end
function GameCommandBaseClass.getRangeWidth(A0_122, A1_123, A2_124, A3_125)
  local L4_126
  L4_126 = 2
  return L4_126
end
function GameCommandBaseClass.useWeaponRangeInformation(A0_127, A1_128, A2_129, A3_130)
  local L4_131, L5_132
  L4_131 = false
  L5_132 = false
  return L4_131, L5_132
end
function GameCommandBaseClass.getCommandRangeCode(A0_133, A1_134, A2_135, A3_136)
  local L4_137
  L4_137 = 0
  return L4_137
end
function GameCommandBaseClass.getCommandTargettingMode(A0_138, A1_139, A2_140, A3_141)
  local L4_142
  L4_142 = -1
  return L4_142
end
function GameCommandBaseClass.getCommandRangeInfo(A0_143, A1_144, A2_145, A3_146)
  local L4_147, L5_148
  L4_147 = -1
  L5_148 = false
  return L4_147, L5_148
end
function GameCommandBaseClass.getCommandRangeTargettingMode(A0_149, A1_150, A2_151, A3_152)
  local L4_153
  L4_153 = false
  if A1_150:isPlayer() then
    L4_153 = A0_149:useWeaponRangeInformation(A1_150, A2_151, A3_152)
  end
  if L4_153 then
    if A1_150:_getEquippingItem(A1_150:getEquipPointByHand(A2_151)) ~= nil then
      return A1_150:_getEquippingItem(A1_150:getEquipPointByHand(A2_151)):getWeaponRangeTargettingMode()
    end
    return 1
  end
  return A0_149:getCommandTargettingMode(A1_150, A2_151, A3_152)
end
function GameCommandBaseClass.getCommandRangeShape(A0_154, A1_155, A2_156, A3_157)
  local L4_158, L5_159
  L5_159 = A1_155
  L4_158 = A1_155.judgeAttackWorkIndex
  L4_158 = L4_158(L5_159, A0_154, A2_156)
  L5_159 = false
  if A1_155:isPlayer() then
    L5_159 = A0_154:useWeaponRangeInformation(A1_155, A2_156, A3_157)
  end
  if L5_159 then
    return A1_155:getAttackRangeShape(L4_158), A0_154:getRangeAngle(A1_155, A2_156, A3_157), 0, A0_154:getEffectRange(A1_155, A2_156, A3_157)
  else
    return A0_154:getCommandRangeCode(A1_155, A2_156, A3_157), A0_154:getRangeAngle(A1_155, A2_156, A3_157), A0_154:getRangeRotate(A1_155, A2_156, A3_157), A0_154:getEffectRange(A1_155, A2_156, A3_157)
  end
end
function GameCommandBaseClass.getCommandRangeLength(A0_160, A1_161, A2_162, A3_163)
  local L4_164, L5_165, L6_166
  L5_165 = false
  L6_166 = A1_161.isPlayer
  L6_166 = L6_166(A1_161)
  if L6_166 then
    L6_166 = A0_160.useWeaponRangeInformation
    L5_165, L6_166 = A0_160, L6_166(A0_160, A1_161, A2_162, A3_163)
    L4_164 = L6_166
  end
  if L5_165 then
    L6_166 = A1_161.judgeAttackWorkIndex
    L6_166 = L6_166(A1_161, A0_160, A2_162)
    return A1_161:getAttackRange(L6_166), A1_161:getWeaponMinimumRange(L6_166)
  else
    L6_166 = A0_160.getRange
    L6_166 = L6_166(A0_160, A1_161, A2_162, A3_163)
    return L6_166, A0_160:getMinimumRange(A1_161, A2_162, A3_163)
  end
end
function GameCommandBaseClass.getCommandRangeHeight(A0_167, A1_168, A2_169, A3_170)
  local L4_171
  L4_171 = 10
  return L4_171
end
function GameCommandBaseClass.canUseCommandRangeAreaSelect(A0_172, A1_173, A2_174, A3_175)
  local L4_176
  L4_176 = false
  return L4_176
end
function GameCommandBaseClass.getCommandCompatibilityKey(A0_177)
  return A0_177:getGameCommandBasicData(40)
end
function GameCommandBaseClass.getCommandCompatibilityData(A0_178, A1_179)
  return compatibilitySheet:_getData(A0_178:getCommandCompatibilityKey(), 8 + (A1_179 - 1)) / 100
end
function GameCommandBaseClass.getCommandCompatibility(A0_180, A1_181, A2_182)
  local L3_183, L4_184
  if A1_181 == 0 then
    L3_183 = 0
    return L3_183
  end
  L4_184 = A0_180
  L3_183 = A0_180.getCommandMainSkill
  L3_183 = L3_183(L4_184)
  if A1_181 == L3_183 then
    L4_184 = 1
    return L4_184
  end
  if A2_182 ~= nil then
    L4_184 = A2_182.isJob
    L4_184 = L4_184(A2_182, A1_181)
    if L4_184 then
      L4_184 = A2_182.getStateMainSkill
      L4_184 = L4_184(A2_182)
      if L4_184 == L3_183 then
        L4_184 = 1
        return L4_184
      end
    end
  end
  L4_184 = A0_180.getCommandCompatibilityData
  L4_184 = L4_184(A0_180, A1_181)
  return _math.min(1, L4_184)
end
function GameCommandBaseClass.getCommandCompatibilityByHand(A0_185, A1_186, A2_187)
  local L3_188
  if A2_187 == 2 then
    L3_188 = A1_186.getStateMainSkillForSub
    L3_188 = L3_188(A1_186)
    return A0_185:getCommandCompatibility(L3_188, A1_186)
  end
  L3_188 = A1_186.getStateMainSkill
  L3_188 = L3_188(A1_186)
  return A0_185:getCommandCompatibility(L3_188, A1_186)
end
function GameCommandBaseClass.getBaseTextID(A0_189)
  local L1_190, L2_191
  L1_190 = 0
  L2_191 = 0
  return L1_190, L2_191
end
function GameCommandBaseClass.canFireOnDead(A0_192)
  local L1_193
  L1_193 = false
  return L1_193
end
function GameCommandBaseClass.canAimParts(A0_194)
  local L1_195, L2_196, L3_197, L4_198, L5_199, L6_200, L7_201, L8_202
  L1_195 = true
  L2_196 = false
  L3_197 = false
  L4_198 = false
  L5_199 = false
  L6_200 = false
  L7_201 = false
  L8_202 = false
  return L1_195, L2_196, L3_197, L4_198, L5_199, L6_200, L7_201, L8_202
end
function GameCommandBaseClass.getPartsDamageAdjust(A0_203)
  local L1_204, L2_205
  L1_204 = 1
  L2_205 = 1
  return L1_204, L2_205
end
function GameCommandBaseClass.canFireForDeadTarget(A0_206)
  local L1_207
  L1_207 = false
  return L1_207
end
function GameCommandBaseClass.canFireForLiveTarget(A0_208)
  local L1_209
  L1_209 = true
  return L1_209
end
function GameCommandBaseClass.canAimForRelation(A0_210)
  local L1_211, L2_212, L3_213
  L1_211 = true
  L2_212 = false
  L3_213 = false
  return L1_211, L2_212, L3_213
end
function GameCommandBaseClass.canFireForRelation(A0_214)
  local L1_215, L2_216, L3_217
  L1_215 = true
  L2_216 = false
  L3_217 = false
  return L1_215, L2_216, L3_217
end
function GameCommandBaseClass.aimWithSubTarget(A0_218)
  if A0_218:isMagicCommand() or A0_218:isAbilityCommand() then
    if A0_218:canAimForRelation() == true and A0_218:canAimForRelation() == false and A0_218:canAimForRelation() == false then
      return false
    else
      return true
    end
  else
    return false
  end
end
function GameCommandBaseClass.getTargetControlMode(A0_219)
  if not A0_219:aimWithSubTarget() then
    return 0
  elseif A0_219:canAimForRelation() then
    if A0_219:canAimForRelation() then
      if A0_219:canAimForRelation() then
        return 1
      else
        return 4
      end
    elseif A0_219:canAimForRelation() then
      if A0_219:canFireForDeadTarget() then
        if A0_219:canFireForLiveTarget() then
          return 10
        else
          return 8
        end
      else
        return 3
      end
    else
      return 2
    end
  elseif A0_219:canAimForRelation() then
    if A0_219:canAimForRelation() then
      return 6
    elseif A0_219:canFireForDeadTarget() then
      if A0_219:canFireForLiveTarget() then
        return 11
      else
        return 9
      end
    else
      return 7
    end
  else
    if A0_219:canAimForRelation() then
      return 5
    else
    end
  end
end
function GameCommandBaseClass.isUseActionGauge(A0_220)
  local L1_221
  L1_221 = true
  return L1_221
end
function GameCommandBaseClass.canCancel(A0_222)
  local L1_223
  L1_223 = true
  return L1_223
end
function GameCommandBaseClass.getFrequency(A0_224)
  local L1_225
  L1_225 = 1
  return L1_225
end
function GameCommandBaseClass.getCommandFrequency(A0_226, A1_227, A2_228)
  local L3_229, L4_230, L5_231, L6_232, L7_233, L8_234, L9_235
  L5_231 = A0_226
  L4_230 = A0_226.getFrequency
  L4_230 = L4_230(L5_231)
  if L4_230 ~= nil then
    L3_229 = L4_230
  else
    L6_232 = A1_227
    L5_231 = A1_227.judgeAttackWorkIndex
    L7_233 = A0_226
    L8_234 = A2_228
    L6_232 = L5_231(L6_232, L7_233, L8_234)
    L8_234 = A1_227
    L7_233 = A1_227.getEquipPointByAttackIndex
    L9_235 = L5_231
    L7_233 = L7_233(L8_234, L9_235)
    L9_235 = A1_227
    L8_234 = A1_227._getEquippingItem
    L8_234 = L8_234(L9_235, L7_233)
    if L8_234 ~= nil then
      L9_235 = L8_234.isShieldWeapon
      L9_235 = L9_235(L8_234)
    else
      if L9_235 then
        L3_229 = 1
    end
    else
      L9_235 = L8_234.getWeaponFrequency
      L9_235 = L9_235(L8_234)
      L3_229 = L9_235
    end
  end
  return L3_229
end
function GameCommandBaseClass.getCommandCompatibilityWithAdjust(A0_236, A1_237, A2_238, A3_239, A4_240)
  local L5_241, L6_242, L7_243
  L5_241 = 1
  L6_242, L7_243 = nil, nil
  if A1_237 ~= 0 then
    L6_242 = A0_236:getCommandCompatibilityByHand(A2_238, A3_239, A4_240)
    L7_243 = (1 - L6_242) * A1_237
    L5_241 = 1 - L7_243
  end
  return L5_241
end
function GameCommandBaseClass.getCommandTPPowerWithAdjust(A0_244, A1_245, A2_246, A3_247, A4_248)
  local L5_249, L6_250, L7_251
  L5_249 = 1
  if A1_245 ~= 0 then
    L6_250 = L5_249 - 1
    L7_251 = 1 - A1_245
    L6_250 = L6_250 * L7_251
    L5_249 = L5_249 - L6_250
  end
  return L5_249
end
function GameCommandBaseClass.getCommandLevelAdjustLevelMax(A0_252)
  local L1_253, L2_254
  L1_253 = -1
  L2_254 = 15
  return L1_253, L2_254
end
function GameCommandBaseClass.getCommandLevelAdjust(A0_255, A1_256, A2_257, A3_258, A4_259, A5_260, A6_261, A7_262)
  local L8_263, L9_264, L10_265, L11_266
  if A2_257 ~= nil then
    L9_264 = A0_255
    L8_263 = A0_255.getCommandLevel
    L8_263 = L8_263(L9_264)
    L10_265 = A5_260
    L9_264 = A5_260.getStateMainSkillLevel
    L9_264 = L9_264(L10_265)
    L11_266 = A0_255
    L10_265 = A0_255.getCommandLevelAdjustLevelMax
    L11_266 = L10_265(L11_266)
    if L8_263 > L9_264 then
      if L10_265 ~= -1 then
        L9_264 = L8_263 - _math.min(L10_265, L8_263 - L9_264)
      else
      end
    else
      if L8_263 < L9_264 and L11_266 ~= -1 then
        L9_264 = L8_263 + _math.min(L11_266, L9_264 - L8_263)
      else
      end
    end
    if L8_263 > L9_264 then
      A1_256 = A1_256 - (A1_256 - A5_260:getGrowData(L9_264, A2_257) * (A1_256 / A5_260:getGrowData(L8_263, A2_257))) * A3_258
    elseif L8_263 < L9_264 then
      A1_256 = A1_256 + (A5_260:getGrowData(L9_264, A2_257) * (A1_256 / A5_260:getGrowData(L8_263, A2_257)) - A1_256) * A4_259
    end
  end
  return A1_256
end
function GameCommandBaseClass.getCommandParam1AdjustForHighLevelUse(A0_267, A1_268, A2_269, A3_270)
  local L4_271
  L4_271 = 0.7
  return L4_271
end
function GameCommandBaseClass.getCommandParam2AdjustForHighLevelUse(A0_272, A1_273, A2_274, A3_275)
  local L4_276
  L4_276 = 0.7
  return L4_276
end
function GameCommandBaseClass.getCommandParam3AdjustForHighLevelUse(A0_277, A1_278, A2_279, A3_280)
  local L4_281
  L4_281 = 0.7
  return L4_281
end
function GameCommandBaseClass.getCommandParam4AdjustForHighLevelUse(A0_282, A1_283, A2_284, A3_285)
  local L4_286
  L4_286 = 0.7
  return L4_286
end
function GameCommandBaseClass.getCommandParam1AdjustForLowLevelUse(A0_287, A1_288, A2_289, A3_290)
  local L4_291
  L4_291 = 1
  return L4_291
end
function GameCommandBaseClass.getCommandParam2AdjustForLowLevelUse(A0_292, A1_293, A2_294, A3_295)
  local L4_296
  L4_296 = 1
  return L4_296
end
function GameCommandBaseClass.getCommandParam3AdjustForLowLevelUse(A0_297, A1_298, A2_299, A3_300)
  local L4_301
  L4_301 = 1
  return L4_301
end
function GameCommandBaseClass.getCommandParam4AdjustForLowLevelUse(A0_302, A1_303, A2_304, A3_305)
  local L4_306
  L4_306 = 1
  return L4_306
end
function GameCommandBaseClass.getCommandParam1LevelAdjustGrow(A0_307, A1_308, A2_309, A3_310)
  local L4_311
  L4_311 = A0_307.getGameCommandData
  L4_311 = L4_311(A0_307, 42)
  if L4_311 < 0 then
    L4_311 = nil
  else
    L4_311 = A1_308:judgeGrowColumn(A3_310, L4_311)
  end
  return L4_311
end
function GameCommandBaseClass.getCommandParam2LevelAdjustGrow(A0_312, A1_313, A2_314, A3_315)
  local L4_316
  L4_316 = A0_312.getGameCommandData
  L4_316 = L4_316(A0_312, 47)
  if L4_316 < 0 then
    L4_316 = nil
  else
    L4_316 = A1_313:judgeGrowColumn(A3_315, L4_316)
  end
  return L4_316
end
function GameCommandBaseClass.getCommandParam3LevelAdjustGrow(A0_317, A1_318, A2_319, A3_320)
  local L4_321
  L4_321 = A0_317.getGameCommandData
  L4_321 = L4_321(A0_317, 52)
  if L4_321 < 0 then
    L4_321 = nil
  else
    L4_321 = A1_318:judgeGrowColumn(A3_320, L4_321)
  end
  return L4_321
end
function GameCommandBaseClass.getCommandParam4LevelAdjustGrow(A0_322, A1_323, A2_324, A3_325)
  local L4_326
  L4_326 = A0_322.getGameCommandData
  L4_326 = L4_326(A0_322, 57)
  if L4_326 < 0 then
    L4_326 = nil
  else
    L4_326 = A1_323:judgeGrowColumn(A3_325, L4_326)
  end
  return L4_326
end
function GameCommandBaseClass.getCommandParam1(A0_327, A1_328, A2_329, A3_330, A4_331)
  local L5_332, L6_333, L7_334, L8_335
  L8_335 = A0_327.getGameCommandData
  L8_335 = L8_335(A0_327, 43)
  if A1_328 ~= nil and A2_329 ~= nil and A3_330 ~= nil and A3_330:_isAlive() then
    L5_332 = A0_327:getCommandCompatibilityWithAdjust(A0_327:getGameCommandData(44), A1_328, A2_329, A3_330)
    L6_333 = A0_327:getCommandTPPowerWithAdjust(A0_327:getGameCommandData(45), A1_328, A2_329, A3_330)
    L8_335 = A0_327:getCommandLevelAdjust(L8_335, A0_327:getCommandParam1LevelAdjustGrow(A1_328, A2_329, A3_330), A0_327:getCommandParam1AdjustForLowLevelUse(A1_328, A2_329, A3_330), A0_327:getCommandParam1AdjustForHighLevelUse(A1_328, A2_329, A3_330), A1_328, A2_329, A3_330)
  else
    L5_332 = 1
    L6_333 = 1
  end
  return L8_335 * L5_332 * L6_333
end
function GameCommandBaseClass.getCommandParam2(A0_336, A1_337, A2_338, A3_339, A4_340)
  local L5_341, L6_342, L7_343, L8_344
  L8_344 = A0_336.getGameCommandData
  L8_344 = L8_344(A0_336, 48)
  if A1_337 ~= nil and A2_338 ~= nil and A3_339 ~= nil and A3_339:_isAlive() then
    L5_341 = A0_336:getCommandCompatibilityWithAdjust(A0_336:getGameCommandData(49), A1_337, A2_338, A3_339)
    L6_342 = A0_336:getCommandTPPowerWithAdjust(A0_336:getGameCommandData(50), A1_337, A2_338, A3_339)
    L8_344 = A0_336:getCommandLevelAdjust(L8_344, A0_336:getCommandParam2LevelAdjustGrow(A1_337, A2_338, A3_339), A0_336:getCommandParam2AdjustForLowLevelUse(A1_337, A2_338, A3_339), A0_336:getCommandParam2AdjustForHighLevelUse(A1_337, A2_338, A3_339), A1_337, A2_338, A3_339)
  else
    L5_341 = 1
    L6_342 = 1
  end
  return L8_344 * L5_341 * L6_342
end
function GameCommandBaseClass.getCommandParam3(A0_345, A1_346, A2_347, A3_348, A4_349)
  local L5_350, L6_351, L7_352, L8_353
  L8_353 = A0_345.getGameCommandData
  L8_353 = L8_353(A0_345, 53)
  if A1_346 ~= nil and A2_347 ~= nil and A3_348 ~= nil and A3_348:_isAlive() then
    L5_350 = A0_345:getCommandCompatibilityWithAdjust(A0_345:getGameCommandData(54), A1_346, A2_347, A3_348)
    L6_351 = A0_345:getCommandTPPowerWithAdjust(A0_345:getGameCommandData(55), A1_346, A2_347, A3_348)
    L8_353 = A0_345:getCommandLevelAdjust(L8_353, A0_345:getCommandParam3LevelAdjustGrow(A1_346, A2_347, A3_348), A0_345:getCommandParam3AdjustForLowLevelUse(A1_346, A2_347, A3_348), A0_345:getCommandParam3AdjustForHighLevelUse(A1_346, A2_347, A3_348), A1_346, A2_347, A3_348)
  else
    L5_350 = 1
    L6_351 = 1
  end
  return L8_353 * L5_350 * L6_351
end
function GameCommandBaseClass.getCommandParam4(A0_354, A1_355, A2_356, A3_357, A4_358)
  local L5_359, L6_360, L7_361, L8_362
  L8_362 = A0_354.getGameCommandData
  L8_362 = L8_362(A0_354, 58)
  if A1_355 ~= nil and A2_356 ~= nil and A3_357 ~= nil and A3_357:_isAlive() then
    L5_359 = A0_354:getCommandCompatibilityWithAdjust(A0_354:getGameCommandData(59), A1_355, A2_356, A3_357)
    L6_360 = A0_354:getCommandTPPowerWithAdjust(A0_354:getGameCommandData(60), A1_355, A2_356, A3_357)
    L8_362 = A0_354:getCommandLevelAdjust(L8_362, A0_354:getCommandParam4LevelAdjustGrow(A1_355, A2_356, A3_357), A0_354:getCommandParam4AdjustForLowLevelUse(A1_355, A2_356, A3_357), A0_354:getCommandParam4AdjustForHighLevelUse(A1_355, A2_356, A3_357), A1_355, A2_356, A3_357)
  else
    L5_359 = 1
    L6_360 = 1
  end
  return L8_362 * L5_359 * L6_360
end
function GameCommandBaseClass.getCommandDamageAttribute(A0_363)
  return A0_363:getGameCommandData(108)
end
function GameCommandBaseClass.getCommandDamageElem(A0_364)
  return A0_364:getGameCommandData(110)
end
function GameCommandBaseClass.getCommandHPCost(A0_365, A1_366, A2_367, A3_368)
  local L4_369
  L4_369 = 0
  return L4_369
end
function GameCommandBaseClass.getCostHP(A0_370, A1_371, A2_372, A3_373)
  if A0_370:getCommandHPCost(A1_371, A2_372, A3_373) == 0 then
    return -1
  elseif A1_371:getHP() == nil then
    return (A0_370:getCommandHPCost(A1_371, A2_372, A3_373))
  elseif A0_370:getCommandHPCost(A1_371, A2_372, A3_373) >= A1_371:getHP() then
    return -2
  else
    return (A0_370:getCommandHPCost(A1_371, A2_372, A3_373))
  end
end
function GameCommandBaseClass.getCommandMPCost(A0_374, A1_375)
  local L2_376
  L2_376 = A0_374.getGameCommandBasicData
  L2_376 = L2_376(A0_374, 114)
  return A1_375:calculateCommandCost(L2_376)
end
function GameCommandBaseClass.getCostMP(A0_377, A1_378)
  local L2_379
  L2_379 = A0_377.getCommandMPCost
  L2_379 = L2_379(A0_377, A1_378)
  if A1_378:getForceCostMPForCaster() ~= -1 then
    L2_379 = A1_378:getForceCostMPForCaster()
  elseif A1_378:getForceCostMPForCaster() ~= 1 then
    L2_379 = L2_379 * A1_378:getForceCostMPForCaster()
  end
  if L2_379 == 0 then
    return -1
  end
  if L2_379 > A1_378:getMP() then
    return -2
  end
  return _math.floor(L2_379)
end
function GameCommandBaseClass.getCommandTPCost(A0_380, A1_381, A2_382, A3_383)
  return A0_380:getGameCommandBasicData(115)
end
function GameCommandBaseClass.getCostTP(A0_384, A1_385, A2_386, A3_387)
  local L4_388
  L4_388 = A0_384.getCommandTPCost
  L4_388 = L4_388(A0_384, A1_385, A2_386, A3_387)
  if A1_385:getForceCostTPForCaster() ~= -1 then
    L4_388 = A1_385:getForceCostTPForCaster()
  elseif A1_385:getForceCostTPForCaster() ~= 1 then
    L4_388 = L4_388 * A1_385:getForceCostTPForCaster()
  end
  if L4_388 == 0 then
    return -1
  elseif A1_385:getTP() == nil then
    return L4_388
  elseif A1_385:getTP() >= L4_388 then
    return (A1_385:getTP())
  end
  return -2
end
function GameCommandBaseClass.getCastTime(A0_389, A1_390, A2_391, A3_392)
  local L4_393
  L4_393 = A0_389.getGameCommandBasicData
  L4_393 = L4_393(A0_389, 76)
  if A1_390 ~= nil and A2_391 ~= nil and A3_392 ~= nil then
    if A1_390:getForceCastTimeForCaster() ~= 0 then
      L4_393 = A1_390:getForceCastTimeForCaster()
    elseif A1_390:getForceCastTimeForCaster() ~= 0 then
      L4_393 = L4_393 * A1_390:getForceCastTimeForCaster()
    end
  end
  return L4_393
end
function GameCommandBaseClass.getUseAmmo(A0_394, A1_395)
  local L2_396
  L2_396 = 0
  return L2_396
end
function GameCommandBaseClass.getUseAmmoMax(A0_397)
  if A0_397:isWeaponSkillCommand() then
    return -2
  else
    return -1
  end
end
function GameCommandBaseClass.getActionGaugeCost(A0_398, A1_399, A2_400)
  local L3_401
  L3_401 = A1_399.isPlayer
  L3_401 = L3_401(A1_399)
  if L3_401 == true then
    L3_401 = 0
    return L3_401
  end
  L3_401 = nil
  if A2_400 == 2 then
    L3_401 = A0_398:getGameCommandData(75) * (1 - A1_399:getActionGaugeUseAdjust(2)) * 2
  else
    L3_401 = A0_398:getGameCommandData(75) * (1 - A1_399:getActionGaugeUseAdjust(1))
  end
  if not A1_399:isPlayer() and A1_399:isPropertyEnabled(3) and A0_398:isPlayerCommand() then
    L3_401 = L3_401 * A1_399:getMonsterBaseData(5)
  end
  return _math.max(0, _math.min(L3_401, A1_399:getActionGaugeMax()))
end
function GameCommandBaseClass.isRegistable(A0_402)
  return A0_402:isMagicCommand()
end
function GameCommandBaseClass.isRecastSeparationHands(A0_403)
  return A0_403:getGameCommandData(82)
end
function GameCommandBaseClass.isEnableEquipForPlayerActionSlot(A0_404)
  if A0_404:getCommandId() >= 26000 and A0_404:getCommandId() <= 29999 then
    if A0_404:getCommandId() == 29497 or A0_404:getCommandId() == 29501 or A0_404:getCommandId() >= 29458 and A0_404:getCommandId() <= 29464 then
      return false
    end
    return true
  elseif A0_404:getCommandId() >= 22100 and A0_404:getCommandId() <= 22499 then
    if A0_404:getCommandId() < 22301 then
      if A0_404:getCommandId() == 22101 or A0_404:getCommandId() == 22103 or A0_404:getCommandId() == 22102 or A0_404:getCommandId() == 22105 or A0_404:getCommandId() == 22109 or A0_404:getCommandId() == 22106 or A0_404:getCommandId() == 22107 or A0_404:getCommandId() == 22110 or A0_404:getCommandId() == 22112 or A0_404:getCommandId() == 22111 then
        return false
      end
    elseif A0_404:getCommandId() == 22301 or A0_404:getCommandId() == 22304 or A0_404:getCommandId() == 22305 or A0_404:getCommandId() == 22306 then
      return false
    end
    return true
  else
    return false
  end
end
function GameCommandBaseClass.judgeHand(A0_405, A1_406, A2_407)
  if A2_407 == nil then
    A2_407 = A0_405:getCommandId()
  end
  if A0_405:isEnableEquipForPlayerActionSlot() then
    if A1_406:searchCommandSlot(A2_407, nil) == nil then
      return nil
    else
      return A1_406:searchCommandSlot(A2_407, nil)
    end
  else
    return 0
  end
end
function GameCommandBaseClass.isResetRecastTimeAtChangeMainSkill(A0_408)
  local L1_409
  L1_409 = false
  return L1_409
end
function GameCommandBaseClass.init(A0_410)
  local L1_411, L2_412
  L1_411 = gameCommandSheet
  L2_412 = L1_411
  L1_411 = L1_411._loadKeySemipermanently
  L1_411(L2_412, A0_410:getCommandId(), A0_410:getCommandId())
  L1_411 = gameCommandBasicSheet
  L2_412 = L1_411
  L1_411 = L1_411._loadKeySemipermanently
  L1_411(L2_412, A0_410:getCommandId(), A0_410:getCommandId())
end
function GameCommandBaseClass.processFinalize(A0_413)
  local L1_414, L2_415
  L1_414 = gameCommandSheet
  L2_415 = L1_414
  L1_414 = L1_414._unloadKey
  L1_414(L2_415, A0_413:getCommandId(), A0_413:getCommandId())
  L1_414 = gameCommandBasicSheet
  L2_415 = L1_414
  L1_414 = L1_414._unloadKey
  L1_414(L2_415, A0_413:getCommandId(), A0_413:getCommandId())
end
function GameCommandBaseClass.canFire(A0_416, A1_417, A2_418, A3_419, A4_420, A5_421, A6_422, A7_423, A8_424, A9_425, A10_426)
  return A0_416:processCanFire(A1_417, A2_418, A3_419, A4_420, A5_421, A6_422, A7_423, A8_424, A9_425, A10_426)
end
function GameCommandBaseClass.checkFireImpl(A0_427, A1_428, A2_429, A3_430, A4_431, A5_432, A6_433, A7_434, A8_435, A9_436, A10_437)
  local L11_438, L12_439, L13_440, L14_441, L15_442, L16_443, L17_444, L18_445, L19_446, L20_447
  L12_439 = A0_427
  L11_438 = A0_427.isHarvestCommand
  L11_438 = L11_438(L12_439)
  if not L11_438 then
    L12_439 = A0_427
    L11_438 = A0_427.judgeAtForceTarget
    L13_440 = A1_428
    L14_441 = A4_431
    L15_442 = A6_433
    L11_438 = L11_438(L12_439, L13_440, L14_441, L15_442)
    A6_433 = L11_438
  end
  L12_439 = A0_427
  L11_438 = A0_427.processCanCommandForActorStat
  L13_440 = A1_428
  L12_439 = L11_438(L12_439, L13_440)
  if not L11_438 then
    L13_440 = false
    L14_441 = L12_439
    return L13_440, L14_441
  end
  L14_441 = A0_427
  L13_440 = A0_427.processCanCommandForSkill
  L15_442 = A1_428
  L16_443 = A4_431
  L14_441 = L13_440(L14_441, L15_442, L16_443)
  L12_439 = L14_441
  L11_438 = L13_440
  if not L11_438 then
    L13_440 = false
    L14_441 = L12_439
    return L13_440, L14_441
  end
  L14_441 = A0_427
  L13_440 = A0_427.processCanCommandForRecastTime
  L15_442 = A1_428
  L16_443 = A4_431
  L17_444 = A6_433
  L14_441 = L13_440(L14_441, L15_442, L16_443, L17_444)
  L12_439 = L14_441
  L11_438 = L13_440
  if not L11_438 then
    L13_440 = false
    L14_441 = L12_439
    return L13_440, L14_441
  end
  L14_441 = A0_427
  L13_440 = A0_427.processCanCommandForHpCost
  L15_442 = A1_428
  L16_443 = A4_431
  L17_444 = A6_433
  L14_441 = L13_440(L14_441, L15_442, L16_443, L17_444)
  L12_439 = L14_441
  L11_438 = L13_440
  if not L11_438 then
    L13_440 = false
    L14_441 = L12_439
    return L13_440, L14_441
  end
  L14_441 = A1_428
  L13_440 = A1_428.getComboInformation
  L15_442 = L13_440(L14_441)
  L17_444 = A0_427
  L16_443 = A0_427.getCommandId
  L16_443 = L16_443(L17_444)
  L18_445 = A0_427
  L17_444 = A0_427.getCommandMPCost
  L19_446 = A1_428
  L17_444 = L17_444(L18_445, L19_446)
  L18_445 = L17_444
  if L13_440 == L16_443 or L14_441 == L16_443 then
    L19_446 = 1 - L15_442
    L18_445 = L18_445 * L19_446
  end
  L20_447 = A1_428
  L19_446 = A1_428.getMP
  L19_446 = L19_446(L20_447)
  if L18_445 > L19_446 then
    L19_446 = false
    L20_447 = 32545
    return L19_446, L20_447
  end
  L20_447 = A0_427
  L19_446 = A0_427.getCommandTPCost
  L19_446 = L19_446(L20_447, A1_428)
  L20_447 = L19_446
  if L13_440 == L16_443 or L14_441 == L16_443 then
    L20_447 = L20_447 * (1 - L15_442)
  end
  if L20_447 > A1_428:getTP() then
    return false, 32546
  end
  L11_438, L12_439 = A0_427:canFireDetail(A1_428, A2_429, A3_430, A4_431, A5_432, A6_433, A7_434, A8_435, A9_436, A10_437)
  if not L11_438 then
    return false, L12_439
  end
  return true, 0
end
function GameCommandBaseClass.processCanFire(A0_448, A1_449, A2_450, A3_451, A4_452, A5_453, A6_454, A7_455, A8_456, A9_457, A10_458)
  if A4_452 == nil then
    A4_452 = A0_448:judgeHand(A1_449, A0_448:getCommandId())
    if A4_452 == nil then
      return false, 0
    end
  end
  if A6_454 == nil then
    A6_454 = A1_449
  elseif not A6_454:_isAlive() then
    return false
  end
  if A7_455 == nil then
    A7_455 = 0
  end
  if A8_456 == nil then
    A8_456 = 0
  end
  if A9_457 == nil then
    A9_457 = 0
  end
  if A10_458 == nil then
    A10_458 = 0
  end
  return A0_448:checkFireImpl(A1_449, A2_450, A3_451, A4_452, A5_453, A6_454, A7_455, A8_456, A9_457, A10_458)
end
function GameCommandBaseClass.processCanFireWithoutTarget(A0_459, A1_460, A2_461, A3_462, A4_463, A5_464, A6_465, A7_466, A8_467, A9_468, A10_469)
  local L11_470, L12_471, L13_472, L14_473, L15_474, L16_475, L17_476, L18_477, L19_478, L20_479
  L12_471 = A0_459
  L11_470 = A0_459.isHarvestCommand
  L11_470 = L11_470(L12_471)
  if not L11_470 then
    L12_471 = A0_459
    L11_470 = A0_459.judgeAtForceTarget
    L13_472 = A1_460
    L14_473 = A4_463
    L15_474 = A6_465
    L11_470 = L11_470(L12_471, L13_472, L14_473, L15_474)
    A6_465 = L11_470
  end
  L12_471 = A0_459
  L11_470 = A0_459.processCanCommandForActorStat
  L13_472 = A1_460
  L12_471 = L11_470(L12_471, L13_472)
  if not L11_470 then
    L13_472 = false
    L14_473 = L12_471
    return L13_472, L14_473
  end
  L14_473 = A0_459
  L13_472 = A0_459.processCanCommandForSkill
  L15_474 = A1_460
  L16_475 = A4_463
  L14_473 = L13_472(L14_473, L15_474, L16_475)
  L12_471 = L14_473
  L11_470 = L13_472
  if not L11_470 then
    L13_472 = false
    L14_473 = L12_471
    return L13_472, L14_473
  end
  L14_473 = A0_459
  L13_472 = A0_459.processCanCommandForHpCost
  L15_474 = A1_460
  L16_475 = A4_463
  L17_476 = A6_465
  L14_473 = L13_472(L14_473, L15_474, L16_475, L17_476)
  L12_471 = L14_473
  L11_470 = L13_472
  if not L11_470 then
    L13_472 = false
    L14_473 = L12_471
    return L13_472, L14_473
  end
  L14_473 = A1_460
  L13_472 = A1_460.getComboInformation
  L15_474 = L13_472(L14_473)
  L17_476 = A0_459
  L16_475 = A0_459.getCommandId
  L16_475 = L16_475(L17_476)
  L18_477 = A0_459
  L17_476 = A0_459.getCommandMPCost
  L19_478 = A1_460
  L17_476 = L17_476(L18_477, L19_478)
  L18_477 = L17_476
  if L13_472 == L16_475 or L14_473 == L16_475 then
    L19_478 = 1 - L15_474
    L18_477 = L18_477 * L19_478
  end
  L20_479 = A1_460
  L19_478 = A1_460.getMP
  L19_478 = L19_478(L20_479)
  if L18_477 > L19_478 then
    L19_478 = false
    L20_479 = 32545
    return L19_478, L20_479
  end
  L20_479 = A0_459
  L19_478 = A0_459.getCommandTPCost
  L19_478 = L19_478(L20_479, A1_460)
  L20_479 = L19_478
  if L13_472 == L16_475 or L14_473 == L16_475 then
    L20_479 = L20_479 * (1 - L15_474)
  end
  if L20_479 > A1_460:getTP() then
    return false, 32546
  end
  L11_470, L12_471 = A0_459:canFireDetail(A1_460, A2_461, A3_462, A4_463, A5_464, A6_465, A7_466, A8_467, A9_468, A10_469)
  if not L11_470 then
    return false, L12_471
  end
  L11_470, L12_471 = A0_459:processCanCommandForRecastTime(A1_460, A4_463, A6_465)
  if not L11_470 then
    return false, L12_471, true
  end
  return true, 0
end
function GameCommandBaseClass.processCanCommandForMyCommandWork(A0_480, A1_481, A2_482, A3_483, A4_484, A5_485, A6_486, A7_487, A8_488, A9_489, A10_490)
  local L11_491, L12_492
  L11_491 = true
  L12_492 = 0
  return L11_491, L12_492
end
function GameCommandBaseClass.fire(A0_493, A1_494, A2_495, A3_496, A4_497, A5_498, A6_499, A7_500, A8_501, A9_502, A10_503)
  local L11_504
  L11_504 = false
  return L11_504
end
function GameCommandBaseClass.isActionMenu(A0_505)
  local L1_506
  L1_506 = true
  return L1_506
end
function GameCommandBaseClass.judgeAtForceTarget(A0_507, A1_508, A2_509, A3_510)
  if A3_510 ~= A1_508 and not A0_507:canAimForRelation() and not A0_507:canAimForRelation() then
    A3_510 = A1_508
  end
  return A3_510
end
function GameCommandBaseClass.sendMessageCommandErr(A0_511, A1_512, A2_513, A3_514, A4_515, A5_516, A6_517)
end
function GameCommandBaseClass.sendMessageEquipErr(A0_518, A1_519, A2_520, A3_521, A4_522, A5_523)
end
