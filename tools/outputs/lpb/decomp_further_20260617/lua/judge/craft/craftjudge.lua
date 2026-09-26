require("/Judge/JudgeBaseClass")
_defineClass("CraftJudge", "JudgeBaseClass")
function CraftJudge.getCraftCommandData(A0_0, A1_1, A2_2)
  return gameCommandSheet:_getData(A1_1, A2_2)
end
function CraftJudge.isCraftSystemCommand(A0_3, A1_4)
  local L2_5
  if A1_4 >= 22501 and A1_4 <= 22549 then
    L2_5 = true
    return L2_5
  end
  L2_5 = false
  return L2_5
end
function CraftJudge.isCraftStandardCommand(A0_6, A1_7)
  local L2_8
  if A1_7 >= 22550 and A1_7 <= 22698 then
    L2_8 = true
    return L2_8
  end
  L2_8 = false
  return L2_8
end
function CraftJudge.isCraftStandardNormalCommand(A0_9, A1_10)
  local L2_11
  if A1_10 == 22550 or A1_10 == 22556 or A1_10 == 22562 or A1_10 == 22568 or A1_10 == 22574 or A1_10 == 22580 or A1_10 == 22586 or A1_10 == 22592 or A1_10 == 22553 or A1_10 == 22559 or A1_10 == 22565 or A1_10 == 22571 or A1_10 == 22577 or A1_10 == 22583 or A1_10 == 22589 or A1_10 == 22595 then
    L2_11 = true
    return L2_11
  end
  L2_11 = false
  return L2_11
end
function CraftJudge.isCraftStandardRapidCommand(A0_12, A1_13)
  local L2_14
  if A1_13 == 22551 or A1_13 == 22557 or A1_13 == 22563 or A1_13 == 22569 or A1_13 == 22575 or A1_13 == 22581 or A1_13 == 22587 or A1_13 == 22593 or A1_13 == 22554 or A1_13 == 22560 or A1_13 == 22566 or A1_13 == 22572 or A1_13 == 22578 or A1_13 == 22584 or A1_13 == 22590 or A1_13 == 22596 then
    L2_14 = true
    return L2_14
  end
  L2_14 = false
  return L2_14
end
function CraftJudge.isCraftStandardBoldCommand(A0_15, A1_16)
  local L2_17
  if A1_16 == 22552 or A1_16 == 22558 or A1_16 == 22564 or A1_16 == 22570 or A1_16 == 22576 or A1_16 == 22582 or A1_16 == 22588 or A1_16 == 22594 or A1_16 == 22555 or A1_16 == 22561 or A1_16 == 22567 or A1_16 == 22573 or A1_16 == 22579 or A1_16 == 22585 or A1_16 == 22591 or A1_16 == 22597 then
    L2_17 = true
    return L2_17
  end
  L2_17 = false
  return L2_17
end
function CraftJudge.isCraftGiftCommand(A0_18, A1_19)
  local L2_20
  if A1_19 >= 29501 and A1_19 <= 29698 then
    L2_20 = true
    return L2_20
  end
  L2_20 = false
  return L2_20
end
function CraftJudge.isMainToolOrder(A0_21, A1_22)
  local L2_23
  if A1_22 == 2 or A1_22 == 6 then
    L2_23 = false
    return L2_23
  end
  L2_23 = true
  return L2_23
end
function CraftJudge.getAvailableStandardCraftCommand(A0_24, A1_25, A2_26)
  local L3_27, L4_28
  L3_27 = {}
  L4_28 = nil
  if A1_25 == 29 then
    L4_28 = 22550
  elseif A1_25 == 30 then
    L4_28 = 22556
  elseif A1_25 == 31 then
    L4_28 = 22562
  elseif A1_25 == 32 then
    L4_28 = 22568
  elseif A1_25 == 33 then
    L4_28 = 22574
  elseif A1_25 == 34 then
    L4_28 = 22580
  elseif A1_25 == 35 then
    L4_28 = 22586
  elseif A1_25 == 36 then
    L4_28 = 22592
  end
  if L4_28 ~= nil then
    if A0_24:isMainToolOrder(A2_26) == false then
      L4_28 = L4_28 + 3
    end
    L3_27[1] = L4_28
    L3_27[2] = L4_28 + 1
    L3_27[3] = L4_28 + 2
  end
  if A2_26 == 1 or A2_26 == 2 then
    L3_27[4] = 22506
  elseif A2_26 == 5 or A2_26 == 6 then
  end
  return L3_27
end
function CraftJudge._onInit(A0_29)
  A0_29:_callSuperClassFunc("_onInit")
end
function CraftJudge._onFinalize(A0_30)
  local L1_31
end
function CraftJudge.initText(A0_32)
  A0_32:_loadTextDataPermanently(16, "craftJudge")
end
function CraftJudge.loadTextData(A0_33, A1_34, A2_35)
end
function CraftJudge.openCraftProgressWidget(A0_36, A1_37, A2_38, A3_39, A4_40, A5_41)
  if A1_37:isPlayer() == true then
    desktopWidget:openEventModeWidgetYield("CraftProgressWidget", 0, A5_41, A3_39, 1000, A4_40, 1000)
  end
end
function CraftJudge.closeCraftProgressWidget(A0_42, A1_43, A2_44)
  if A1_43:isPlayer() == true then
    desktopWidget:closeEventModeWidget("CraftProgressWidget")
  end
end
function CraftJudge.updateInfo(A0_45, A1_46, A2_47, A3_48, A4_49, A5_50, A6_51, A7_52, A8_53, A9_54, A10_55)
  if A1_46:isPlayer() == true then
    desktopWidget:orderCraftProgressWidgetUpdate(A3_48, A4_49, A5_50, A6_51, A7_52, A8_53, A9_54, 0)
  end
end
function CraftJudge.closeCraftStartWidget(A0_56, A1_57, A2_58)
  if A1_57:isPlayer() == true then
    desktopWidget:closeEventModeWidget("CraftStartWidget")
  end
end
function CraftJudge.start(A0_59, A1_60, A2_61, A3_62, A4_63, ...)
  local L6_65, L7_66, L8_67, L9_68, L10_69, L11_70, L12_71, L13_72, L14_73, L15_74, L16_75, L17_76
  L6_65 = 0
  L7_66 = 0
  L8_67 = {}
  L9_68 = {}
  L10_69 = {}
  L11_70 = 0
  L17_76 = ...
  for L15_74 = 1, L13_72(L14_73, L15_74, L16_75, L17_76, ...) do
    L17_76 = L15_74
    if L16_75 ~= nil then
      L11_70 = L11_70 + 1
      L10_69[L11_70] = L16_75
    end
  end
  for L15_74 = 1, 8 do
    L8_67[L15_74] = -1
    L9_68[L15_74] = 0
  end
  if L12_71 == true then
    if A3_62 == -1 then
      L8_67 = L16_75
      L7_66 = L15_74
      L6_65 = L14_73
    elseif A3_62 == -2 then
      L17_76 = A3_62
      L8_67 = L16_75
      L7_66 = L15_74
      L6_65 = L14_73
    else
      L13_72(L14_73)
      if L12_71 == true then
        L17_76 = 0
        L17_76 = L14_73(L15_74, L16_75, L17_76, A3_62, L10_69)
        L8_67 = L17_76
        L7_66 = L16_75
        L6_65 = L15_74
      end
    end
    if L12_71 == true then
      for L16_75 = 1, 8 do
        L17_76 = nil
        if L16_75 <= #L8_67 then
          if L8_67[L16_75] == 0 then
            L17_76 = L10_69[L16_75]
          elseif L8_67[L16_75] > 0 then
            L17_76 = A1_60:_getExtendedTemporaryItem(1, L8_67[L16_75])
          else
            L17_76 = 0
          end
        end
        if L17_76 == nil then
          L9_68[L16_75] = 0
        else
          L9_68[L16_75] = L17_76
        end
      end
    else
      L6_65 = nil
    end
  end
  for L17_76 = 1, #L9_68 do
    if _isInstanceOf(L9_68[L17_76], "ItemBaseClass") then
      L12_71[L13_72] = L9_68[L17_76]
    end
  end
  for L17_76 = 1, #L9_68 do
    if not _isInstanceOf(L9_68[L17_76], "ItemBaseClass") then
      L12_71[L13_72] = L9_68[L17_76]
    end
  end
  L17_76 = L12_71
  L17_76 = L16_75(L17_76)
  return L14_73, L15_74, L16_75, L17_76, L16_75(L17_76)
end
function CraftJudge.selectRcp(A0_77, A1_78, A2_79, ...)
  local L5_81, L6_82
  L5_81 = desktopWidget
  L6_82 = L5_81
  L5_81 = L5_81.selectCraftRecipeSelectWidget
  L5_81 = L5_81(L6_82, ...)
  return L5_81
end
function CraftJudge.confirmRcp(A0_83, A1_84, A2_85, A3_86, A4_87, A5_88, A6_89, A7_90, A8_91, A9_92, A10_93)
  return desktopWidget:selectCraftRecipeDetailWidget(A3_86, A4_87, A5_88, A6_89, A7_90, A8_91, A9_92, A10_93)
end
function CraftJudge.startRepair(A0_94, A1_95, A2_96, A3_97, A4_98, A5_99, A6_100, A7_101, A8_102, A9_103)
  local L10_104, L11_105, L12_106, L13_107, L14_108, L15_109, L16_110, L17_111, L18_112, L19_113, L20_114, L21_115
  L11_105 = A1_95
  L10_104 = A1_95._createVirtualItem
  L12_106 = A4_98
  L13_107 = 1
  L14_108 = A5_99
  L10_104 = L10_104(L11_105, L12_106, L13_107, L14_108)
  L11_105 = {}
  L12_106 = {}
  L13_107 = 0
  L14_108 = 0
  L15_109 = {}
  for L19_113 = 1, 8 do
    L11_105[L19_113] = -1
    L12_106[L19_113] = 0
  end
  if L16_110 == true then
    L17_111(L18_112)
    L21_115 = A3_97
    L11_105 = L20_114
    L14_108 = L19_113
    L13_107 = L18_112
    if L13_107 == 1 then
      L13_107 = 5
    elseif L13_107 == 2 then
      L13_107 = 6
    end
    if L16_110 == true then
      for L20_114 = 1, 8 do
        L21_115 = nil
        if L20_114 <= #L11_105 and L11_105[L20_114] > 0 then
          L21_115 = A1_95:_getExtendedTemporaryItem(1, L11_105[L20_114])
        end
        if L21_115 == nil then
          L12_106[L20_114] = 0
        else
          L12_106[L20_114] = L21_115
        end
      end
    else
      L13_107 = nil
    end
  end
  for L21_115 = 1, #L12_106 do
    if _isInstanceOf(L12_106[L21_115], "ItemBaseClass") then
      L16_110[L17_111] = L12_106[L21_115]
    end
  end
  for L21_115 = 1, #L12_106 do
    if not _isInstanceOf(L12_106[L21_115], "ItemBaseClass") then
      L16_110[L17_111] = L12_106[L21_115]
    end
  end
  L21_115 = L16_110
  L21_115 = L20_114(L21_115)
  return L18_112, L19_113, L20_114, L21_115, L20_114(L21_115)
end
function CraftJudge.craftCommandUI(A0_116, A1_117, A2_118, A3_119, A4_120, ...)
  local L6_122, L7_123, L8_124, L9_125, L10_126, L11_127, L12_128, L13_129, L14_130, L15_131, L16_132
  L6_122 = {}
  L7_123, L8_124, L9_125, L10_126 = nil, nil, nil, nil
  L11_127 = 0
  L12_128 = A0_116.getAvailableStandardCraftCommand
  L12_128 = L12_128(L13_129, L14_130, L15_131)
  for L16_132 = 1, #L12_128 do
    L10_126 = L12_128[L16_132]
    if L10_126 ~= nil and L10_126 ~= 22502 then
      L11_127 = L11_127 + 1
      L6_122[L11_127] = L10_126
    end
  end
  L16_132 = ...
  for L16_132 = 1, L14_130(L15_131, L16_132, ...) do
    L10_126 = select(L16_132, ...)
    if L10_126 ~= nil then
      L11_127 = L11_127 + 1
      L6_122[L11_127] = L10_126
    end
  end
  for L16_132 = 1, #L12_128 do
    L10_126 = L12_128[L16_132]
    if L10_126 == 22502 then
      L11_127 = L11_127 + 1
      L6_122[L11_127] = L10_126
    end
  end
  L16_132 = L6_122
  L8_124 = L14_130
  L7_123 = L13_129
  if L8_124 == -1 then
    return L13_129
  end
  if L7_123 == false then
    return L13_129
  end
  return L8_124
end
function CraftJudge.craftTuningUI(A0_133, A1_134, A2_135, ...)
  local L4_137, L5_138, L6_139, L7_140, L8_141, L9_142, L10_143, L11_144
  L4_137 = {}
  L5_138, L6_139 = nil, nil
  L7_140 = 0
  L11_144 = ...
  for L11_144 = 1, L9_142(L10_143, L11_144, ...) do
    if select(L11_144, ...) ~= nil then
      L4_137[L7_140], L7_140 = select(L11_144, ...), L7_140 + 1
    end
  end
  L11_144 = L4_137
  L6_139 = L9_142
  L5_138 = L8_141
  if L6_139 == -1 then
    return L8_141
  end
  if L5_138 == false then
    return L8_141
  end
  return L6_139
end
function CraftJudge.sendTutorialGuildleve(A0_145, A1_146, A2_147, A3_148)
  local L4_149, L5_150, L6_151, L7_152, L8_153, L9_154
  L4_149 = {}
  if A3_148 == 29 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  elseif A3_148 == 30 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  elseif A3_148 == 31 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  elseif A3_148 == 32 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  elseif A3_148 == 33 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  elseif A3_148 == 34 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  elseif A3_148 == 35 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  elseif A3_148 == 36 then
    L5_150 = {
      L6_151,
      L7_152,
      L8_153
    }
    L4_149 = L5_150
  end
  L5_150 = false
  for L9_154 = 1, L7_152(L8_153) do
    if A1_146:getGuildleveQuest(L9_154) ~= nil then
      for _FORV_14_ = 1, #L4_149 do
        if A1_146:getGuildleveQuest(L9_154):getQuestId() == L4_149[_FORV_14_] then
          L5_150 = true
        end
      end
    end
  end
  return L5_150
end
function CraftJudge.selectCraftQuest(A0_155, A1_156, A2_157)
  local L3_158, L4_159
  L4_159 = A1_156
  L3_158 = A1_156.isPlayer
  L3_158 = L3_158(L4_159)
  if L3_158 == false then
    return
  end
  L3_158 = desktopWidget
  L4_159 = L3_158
  L3_158 = L3_158.askPassiveGuildleveSelectWidget
  L4_159 = L3_158(L4_159)
  if L3_158 == true then
    if L3_158(L4_159) == true then
      if L4_159 ~= nil and L4_159 >= 1 and L4_159 <= A1_156:getGuildleveQuestLength() then
        return A1_156:getGuildleveQuest(L4_159)
      end
    elseif L3_158(L4_159) == false and L4_159 ~= nil and L4_159 >= 1 and L4_159 <= A1_156:getScenarioQuestLength() then
      return A1_156:getScenarioQuest(L4_159)
    end
  end
  return nil
end
function CraftJudge.cfmQst(A0_160, A1_161, A2_162, A3_163, ...)
  local L6_165, L7_166, L8_167, L9_168
  if A3_163 == nil then
    return
  end
  L6_165 = desktopWidget
  L7_166 = L6_165
  L6_165 = L6_165.askJournalDetailWidget
  L8_167 = 1
  L9_168 = A3_163
  L6_165 = L6_165(L7_166, L8_167, L9_168, ...)
  return L6_165
end
function CraftJudge.confirmLeve(A0_169, A1_170, A2_171, A3_172, A4_173, A5_174, A6_175, A7_176, A8_177, A9_178)
  if A3_172 == nil then
    return
  end
  return (desktopWidget:askJournalDetailWidget(7, A3_172, A4_173, A6_175, A7_176, A8_177, A9_178))
end
function CraftJudge.askContinueLocalleve(A0_179, A1_180, A2_181, A3_182, A4_183, A5_184, A6_185, A7_186)
  local L8_187, L9_188
  L8_187 = 26
  L9_188 = {}
  L9_188 = {27, 28}
  return (desktopWidget:askForEventMode(A0_179, A0_179, A0_179, 1, false, true, L8_187, L9_188, A3_182, A4_183, A5_184, A6_185, A7_186))
end
function CraftJudge.askRetryLocalleve(A0_189, A1_190, A2_191, A3_192, A4_193)
  local L5_194, L6_195, L7_196, L8_197
  L7_196 = 50144
  L8_197 = {}
  L8_197 = {50145, 50146}
  L5_194 = desktopWidget:askForEventMode(A0_189, worldMaster, worldMaster, 1, false, true, L7_196, L8_197, A3_192, A4_193)
  if L5_194 == 1 then
    return L5_194, L6_195
  elseif L5_194 == 2 then
    L7_196 = 50149
    L8_197 = {}
    L8_197 = {50150, 50151}
    L6_195 = desktopWidget:askForEventMode(A0_189, worldMaster, worldMaster, 1, false, true, L7_196, L8_197, A3_192)
  end
  return L5_194, L6_195
end
function CraftJudge.askJoinMateria(A0_198, A1_199, A2_200, A3_201)
  desktopWidget:cancelMainTargetCharacter()
  if desktopWidget:askEventModeWidgetYield("Ask/MateriaAttachAskWidget", 1, A3_201) == false then
    return false
  end
  if desktopWidget:askEventModeWidgetYield("Ask/MateriaAttachAskWidget", 1, A3_201) ~= 1 then
    return false
  end
  return true
end
function CraftJudge.cancelTarget(A0_202, A1_203, A2_204)
  desktopWidget:cancelMainTargetCharacter()
end
function CraftJudge.askJoinResult(A0_205, A1_206, A2_207, A3_208, A4_209, A5_210, A6_211, A7_212, A8_213)
  local L9_214, L10_215
  L10_215 = A1_206
  L9_214 = A1_206._createVirtualItem
  L9_214 = L9_214(L10_215, A4_209, 1, A5_210)
  L10_215 = A1_206._createVirtualItem
  L10_215 = L10_215(A1_206, A6_211, 1, 1)
  desktopWidget:askEventModeWidgetYield("Ask/MateriaInformWidget", 1, A3_208, L10_215, L9_214, A7_212, A8_213)
end
function CraftJudge.selectRecipeBookTest(A0_216, A1_217, A2_218)
  local L3_219
  return L3_219
end
function CraftJudge.displayRate(A0_220, A1_221, A2_222, A3_223)
  desktopWidget:cancelMainTargetCharacter()
  desktopWidget:askEventModeWidgetYield("Ask/MateriaAttachAskWidget", 1, A3_223, true)
end
function CraftJudge.selectTestMotion(A0_224, A1_225, A2_226)
  local L3_227, L4_228, L5_229, L6_230, L7_231, L8_232, L9_233, L10_234, L11_235, L12_236, L13_237, L14_238, L15_239, L16_240
  L3_227 = 0
  L4_228 = 0
  L5_229 = 0
  L6_230 = 0
  L7_231 = 0
  L8_232 = 0
  L9_233 = nil
  L10_234 = L3_227
  L11_235 = L4_228
  L12_236 = L5_229
  L13_237 = L6_230
  L14_238 = L7_231
  L15_239 = L8_232
  L16_240 = L9_233
  return L10_234, L11_235, L12_236, L13_237, L14_238, L15_239, L16_240
end
