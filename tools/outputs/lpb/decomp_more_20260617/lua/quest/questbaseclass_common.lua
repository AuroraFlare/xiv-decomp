local L0_0, L1_1
L0_0 = QuestBaseClass
function L1_1(A0_2)
  if A0_2:getQuestId() > 120000 and A0_2:getQuestId() < 121024 then
    return true
  else
    return false
  end
end
L0_0.isCraftPassiveGuildleve = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_3, A1_4, A2_5, ...)
  local L4_7, L5_8
  L4_7, L5_8 = worldMaster:createCutScene(A1_4, A0_3):startCutScene(1, 61, A2_5, ...)
  if L4_7 == true then
    worldMaster:createCutScene(A1_4, A0_3):_delete()
  else
  end
  return L5_8
end
L0_0.startNQCutScene = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_9, A1_10, A2_11, ...)
  local L4_13, L5_14
  L4_13, L5_14 = worldMaster:_getPendingCutSceneActor():startCutScene(2, 61, A2_11, ...)
  worldMaster:_getPendingCutSceneActor():_delete()
  if L4_13 == true then
    worldMaster:_getPendingCutSceneActor():_delete()
  else
  end
end
L0_0.replayNQCutScene = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_15, A1_16, A2_17, ...)
  local L4_19, L5_20
  L4_19, L5_20 = worldMaster:createCutScene(A1_16, A0_15):startCutScene(1, 62, A2_17, ...)
  worldMaster:createCutScene(A1_16, A0_15):_delete()
  return L5_20
end
L0_0.startHQCutScene = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_21, A1_22, A2_23, A3_24, A4_25, A5_26, A6_27, A7_28, ...)
  local L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39
  L11_32 = "xxx"
  L12_33 = "xxx"
  L13_34 = "xxx"
  L14_35 = 999
  L15_36 = 999
  L16_37 = 999
  L17_38 = 1
  L18_39 = 1
  if type(select(1, ...)) == "string" then
    L11_32 = select(1, ...)
    L18_39 = L18_39 + 1
  elseif type(select(1, ...)) == "number" then
    L14_35 = select(1, ...)
    L17_38 = L17_38 + 1
  end
  if type(select(2, ...)) == "string" then
    if L18_39 == 1 then
      L11_32 = select(L18_39, ...)
      L18_39 = L18_39 + 1
    elseif L18_39 == 2 then
      L12_33 = select(L18_39, ...)
      L18_39 = L18_39 + 1
    elseif L18_39 == 3 then
      L13_34 = select(L18_39, ...)
      L18_39 = L18_39 + 1
    end
  elseif type(select(2, ...)) == "number" then
    if L17_38 == 1 then
      L14_35 = select(L17_38, ...)
      L17_38 = L17_38 + 1
    elseif L17_38 == 2 then
      L15_36 = select(L17_38, ...)
      L17_38 = L17_38 + 1
    elseif L17_38 == 3 then
      L16_37 = select(L17_38, ...)
      L17_38 = L17_38 + 1
    end
  end
  if type(select(3, ...)) == "string" then
    if L18_39 == 1 then
      L11_32 = select(L18_39, ...)
      L18_39 = L18_39 + 1
    elseif L18_39 == 2 then
      L12_33 = select(L18_39, ...)
      L18_39 = L18_39 + 1
    elseif L18_39 == 3 then
      L13_34 = select(L18_39, ...)
      L18_39 = L18_39 + 1
    end
  elseif type(select(3, ...)) == "number" then
    if L17_38 == 1 then
      L14_35 = select(L17_38, ...)
      L17_38 = L17_38 + 1
    elseif L17_38 == 2 then
      L15_36 = select(L17_38, ...)
      L17_38 = L17_38 + 1
    elseif L17_38 == 3 then
      L16_37 = select(L17_38, ...)
      L17_38 = L17_38 + 1
    end
  end
  L10_31 = A0_21:startNQCutScene(A1_22, A2_23, true, A4_25, A5_26, A6_27, A7_28, L14_35, L15_36, L16_37, A3_24, L11_32, L12_33)
  return L10_31
end
L0_0.startSnpcNQCutScene = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_40, A1_41, A2_42, A3_43, A4_44, A5_45, A6_46, A7_47, ...)
  local L9_49, L10_50, L11_51, L12_52, L13_53
  L11_51 = select
  L12_52 = 1
  L13_53 = ...
  L11_51 = L11_51(L12_52, L13_53, ...)
  if L11_51 == nil then
    L11_51 = 0
  end
  L12_52 = select
  L13_53 = 2
  L12_52 = L12_52(L13_53, ...)
  if L12_52 == nil then
    L12_52 = 0
  end
  L13_53 = select
  L13_53 = L13_53(3, ...)
  if L13_53 == nil then
    L13_53 = 0
  end
  L10_50 = A0_40:startHQCutScene(A1_41, A2_42, true, A4_44, A5_45, A6_46, A7_47, L11_51, L12_52, L13_53, A3_43)
  return L10_50
end
L0_0.startSnpcHQCutScene = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_54, A1_55)
  local L2_56
  L2_56 = 1
  A1_55:_fadeOut(L2_56)
  A1_55:_waitForFading()
end
L0_0.startFadeOutCutSceneDefault = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_57, A1_58)
  local L2_59
  L2_59 = 1
  A1_58:_waitForMapLoaded(nil)
  A1_58:_fadeIn(L2_59)
  A1_58:_waitForFading()
end
L0_0.startFadeInCutSceneDefault = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_60, A1_61, A2_62)
  A1_61:_fadeOut(A2_62)
  A1_61:_waitForFading()
end
L0_0.startFadeOut = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_63, A1_64, A2_65)
  A1_64:_fadeIn(A2_65)
  A1_64:_waitForFading()
end
L0_0.startFadeIn = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_66, A1_67)
  if A0_66:_getCurrentAreaMaster():_getZoneName() == "test" then
    A0_66:startFadeInCutSceneDefault(A1_67)
    return
  end
  A1_67:_fadeInAfterWarp()
end
L0_0.startFadeInCutSceneAfterWarp = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_68, A1_69)
  return A1_69:isMale()
end
L0_0.isPlayerMale = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_70, A1_71)
  return A1_71:isFemale()
end
L0_0.isPlayerFemale = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_72, A1_73)
  return A1_73 + 1070000
end
L0_0.getSnpcActorClassID = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_74, A1_75)
  local L2_76, L3_77
  if A1_75 == 1 then
    L3_77 = 1
    return L3_77
  elseif A1_75 == 2 then
    L3_77 = 2
    return L3_77
  elseif A1_75 == 3 then
    L3_77 = 1
    return L3_77
  elseif A1_75 == 4 then
    L3_77 = 2
    return L3_77
  elseif A1_75 == 5 then
    L3_77 = 1
    return L3_77
  elseif A1_75 == 6 then
    L3_77 = 2
    return L3_77
  elseif A1_75 == 7 then
    L3_77 = 1
    return L3_77
  elseif A1_75 == 8 then
    L3_77 = 2
    return L3_77
  elseif A1_75 == 9 then
    L3_77 = 1
    return L3_77
  else
    L3_77 = 1
    return L3_77
  end
end
L0_0.getSnpcSexualityToSkin = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_78, A1_79, A2_80)
  local L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88
  L3_81 = desktopWidget
  L4_82 = L3_81
  L3_81 = L3_81.askSelectReleaseQuestWidget
  L3_81 = L3_81(L4_82)
  if L3_81 == nil then
    L4_82 = false
    return L4_82
  else
    L4_82 = nil
    L5_83 = A1_79.getScenarioQuestLength
    L5_83 = L5_83(L6_84)
    for L9_87 = 1, L5_83 do
      L10_88 = A1_79.getScenarioQuest
      L10_88 = L10_88(A1_79, L9_87)
      if L10_88 ~= nil and L10_88:getQuestId() == L3_81 then
        return true, L10_88
      end
    end
  end
end
L0_0.processReleaseQuest = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_89, A1_90, A2_91)
  local L3_92, L4_93, L5_94, L6_95, L7_96, L8_97
  L4_93 = A2_91
  L3_92 = A2_91._getPos
  L5_94 = L3_92(L4_93)
  L7_96 = A1_90
  L6_95 = A1_90._getDir
  L6_95 = L6_95(L7_96)
  L8_97 = A1_90
  L7_96 = A1_90._getOrientation
  L7_96 = L7_96(L8_97, L3_92, L4_93, L5_94)
  L8_97 = L6_95 + L7_96
  A1_90:_turnDir(L8_97)
  A1_90:_waitForTurning()
end
L0_0.clientTrunDirForQuestNpc = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_98, A1_99)
  A1_99:_runCharaScheduler(67111866)
end
L0_0.runCharaSchedulerPastAreaIn = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_100, A1_101, A2_102)
  local L3_103, L4_104, L5_105, L6_106, L7_107
  L4_104 = A2_102
  L3_103 = A2_102.ask
  L5_105 = worldMaster
  L6_106 = 25015
  L7_107 = 2
  L3_103 = L3_103(L4_104, L5_105, L6_106, L7_107, A0_100:getQuestId())
  return L3_103
end
L0_0.contentsJoinAskInBasaClass = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_108, A1_109, A2_110)
  return (A2_110:ask(worldMaster, 51030, 2))
end
L0_0.pastAreaJoinAskInBasaClass = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_111, A1_112, A2_113)
  return (A2_113:ask(worldMaster, 34112, 2))
end
L0_0.instanceAreaJoinAskInBasaClass = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_114, A1_115, A2_116)
  A0_114:startFadeOutCutSceneDefault(A1_115)
end
L0_0.processFadeOutGeneral = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_117, A1_118, A2_119)
  if A0_117:_getCurrentAreaMaster():_getZoneName() == "test" then
    A0_117:startFadeOutCutSceneDefault(A1_118)
    A0_117:startFadeOutCutSceneDefault(A1_118)
    return
  end
  A0_117:startFadeOutCutSceneDefault(A1_118)
  A1_118:_waitForFading()
  A0_117:startFadeInCutSceneAfterWarp(A1_118)
end
L0_0.processAfterWarpFadeOutGeneral = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_120, A1_121, A2_122)
  A0_120:startFadeInCutSceneDefault(A1_121)
end
L0_0.processFadeInGeneral = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_123, A1_124, A2_125, A3_126)
  A1_124:_setMusic(A2_125, A3_126)
end
L0_0.setMusic = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_127, A1_128)
  local L2_129, L3_130, L4_131, L5_132, L6_133, L7_134, L8_135
  L2_129 = {
    L3_130,
    L4_131,
    L5_132,
    L6_133,
    L7_134,
    L8_135,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  }
  L3_130 = 0
  L4_131 = 0
  L5_132 = 0
  L6_133 = 0
  L7_134 = 0
  L8_135 = 0
  L3_130, L4_131, L5_132, L6_133, L7_134 = nil, nil, nil, nil, nil
  L8_135 = 15
  for _FORV_15_ = 1, L8_135 do
    ({})[_FORV_15_] = _FORV_15_
  end
  for _FORV_15_ = 1, L8_135 do
    ({})[_FORV_15_], ({})[math:_randomInteger(1, L8_135)] = ({})[math:_randomInteger(1, L8_135)], ({})[_FORV_15_]
  end
  for _FORV_15_ = 5 + 1, L8_135 do
    ({})[_FORV_15_] = nil
  end
  L3_130 = _FOR_ - 1
  L4_131 = ({})[2] - 1
  L5_132 = ({})[3] - 1
  L6_133 = ({})[4] - 1
  L7_134 = ({})[5] - 1
  L3_130 = L3_130 + A1_128
  L4_131 = L4_131 + A1_128
  L5_132 = L5_132 + A1_128
  L6_133 = L6_133 + A1_128
  L7_134 = L7_134 + A1_128
  return L3_130, L4_131, L5_132, L6_133, L7_134
end
L0_0.getSnpcCandidacyNumber = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_136, A1_137, A2_138, A3_139)
  return (desktopWidget:askRetainerNamingWidget(A2_138, nil))
end
L0_0.inputSnpcName = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_140)
  local L1_141, L2_142, L3_143
  L2_142 = A0_140
  L1_141 = A0_140.getQuestId
  L1_141 = L1_141(L2_142)
  L2_142, L3_143 = nil, nil
  if L1_141 >= 110600 and L1_141 <= 119999 or L1_141 >= 110001 and L1_141 <= 110021 then
    L2_142 = desktopWidget:askQuestDetailWidget(L1_141)
    if L2_142 ~= true then
      L3_143 = 2
    else
      L3_143 = 1
    end
    return L3_143
  else
    L2_142, L3_143 = desktopWidget:askEventModeWidgetYield("Ask/QuestAskWidget", 1, L1_141)
    if L2_142 ~= true then
      L3_143 = 2
    end
    return L3_143
  end
end
L0_0.showQuestInfomation = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_144, A1_145, A2_146, A3_147, A4_148, A5_149, A6_150, A7_151, A8_152)
  local L9_153, L10_154
  L10_154 = A0_144
  L9_153 = A0_144.getQuestId
  L9_153 = L9_153(L10_154)
  L10_154 = nil
  if L9_153 == 110014 then
    if A8_152 == 1 then
      L10_154 = "man20602"
    elseif A8_152 == 2 then
      L10_154 = "man20603"
    elseif A8_152 == 3 then
      L10_154 = "man20630"
    end
  elseif L9_153 == 110015 then
    if A8_152 == 1 then
      L10_154 = "man30020"
    elseif A8_152 == 2 then
      L10_154 = "man30030"
    elseif A8_152 == 3 then
      L10_154 = "man30040"
    end
  elseif L9_153 == 110016 then
    if A8_152 == 1 then
      L10_154 = "man30400"
    elseif A8_152 == 2 then
      L10_154 = "man30410"
    elseif A8_152 == 3 then
      L10_154 = "man30420"
    elseif A8_152 == 4 then
      L10_154 = "man30430"
    end
  elseif L9_153 == 110018 then
    if A8_152 == 1 then
      L10_154 = "man40210"
    elseif A8_152 == 2 then
      L10_154 = "man40220"
    elseif A8_152 == 3 then
      L10_154 = "man40230"
    end
  elseif L9_153 == 110019 then
    if A8_152 == 1 then
      L10_154 = "man40600"
    elseif A8_152 == 2 then
      L10_154 = "man40610"
    elseif A8_152 == 3 then
      L10_154 = "man40615"
    elseif A8_152 == 4 then
      L10_154 = "man40630"
    elseif A8_152 == 5 then
      L10_154 = "man40635"
    elseif A8_152 == 6 then
      L10_154 = "man40640"
    elseif A8_152 == 7 then
      L10_154 = "man40650"
    end
  elseif L9_153 == 110020 then
    if A8_152 == 1 then
      L10_154 = "man50250"
    else
      L10_154 = "man50250"
    end
  elseif L9_153 == 110013 then
    if A8_152 == 1 then
      L10_154 = "man20150"
    elseif A8_152 == 2 then
      L10_154 = "man20140"
    else
      L10_154 = "man20140"
    end
  end
  A4_148 = A0_144:getSnpcActorClassID(A4_148)
  A0_144:startFadeOutCutSceneDefault(A1_145)
  if L10_154 == "man40635" or L10_154 == "man40640" or L10_154 == "man50250" then
    A0_144:startSnpcHQCutScene(L10_154, 1, A3_147, A4_148, A5_149, A6_150, A7_151)
  elseif L10_154 == "man20140" then
    A0_144:startNQCutScene("man20140", 1, A4_148, A4_148, A4_148, A4_148, A4_148, 1)
  else
    A0_144:startSnpcNQCutScene(L10_154, 1, A3_147, A4_148, A5_149, A6_150, A7_151)
  end
  A0_144:startFadeInCutSceneDefault(A1_145)
end
L0_0.snpcPreviw = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_155, A1_156, A2_157, A3_158, ...)
  local L6_160, L7_161, L8_162, L9_163, L10_164, L11_165
  L6_160 = desktopWidget
  L7_161 = L6_160
  L6_160 = L6_160.showMessage
  L8_162 = A1_156
  L9_163 = 38
  L10_164 = A0_155
  L11_165 = A3_158
  L6_160(L7_161, L8_162, L9_163, L10_164, L11_165, ...)
end
L0_0.sayFreeDisplayName = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_166, A1_167, A2_168, A3_169, A4_170, ...)
  A1_167:_runCharaScheduler(67111902)
  desktopWidget:askEventModeWidgetYield("Ask/QuestRewardWidget", 1, 1, A0_166:getQuestId(), A3_169, A4_170, ...)
  A0_166:processAfterQuestRewardWidget(A1_167, A2_168)
end
L0_0.sqrwa = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_172, A1_173, A2_174)
end
L0_0.processAfterQuestRewardWidget = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_175, A1_176, A2_177, A3_178, A4_179, ...)
  local L7_181, L8_182, L9_183
  L7_181 = desktopWidget
  L8_182 = L7_181
  L7_181 = L7_181.askEventModeWidgetYield
  L9_183 = "Ask/QuestRewardWidget"
  L7_181(L8_182, L9_183, 1, A0_175:getQuestId(), A3_178, A4_179, ...)
end
L0_0.showQuestRewardAsClientCall = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_184, A1_185, A2_186)
  A1_185:_fadeInNowLoadingForNoticeEventJustInArea()
  A0_184:startFadeInCutSceneDefault(A1_185)
  A0_184:_wait(0.5)
end
L0_0.questBaseRewardSeting = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_187, A1_188, A2_189, A3_190)
  return A0_187:processEventContentExit(A1_188, A2_189, A3_190)
end
L0_0.processAskContentExit = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_191, A1_192, A2_193, A3_194)
  A0_191:_wait(1)
  A0_191:_wait(1)
  return true
end
L0_0.processEventContentExit = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_195, A1_196)
end
L0_0.onJobQuestCompleteFirst = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_197, A1_198)
end
L0_0.onJobQuestCompleteSecond = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_199, A1_200)
end
L0_0.onJobQuestCompleteThird = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_201, A1_202, A2_203, A3_204, A4_205)
  local L5_206, L6_207, L7_208, L8_209, L9_210, L10_211
  L5_206 = 2
  L7_208 = A0_201
  L6_207 = A0_201.getJobQuestIcon
  L6_207 = L6_207(L7_208)
  L8_209 = A0_201
  L7_208 = A0_201.getJobQuestJobName
  L7_208 = L7_208(L8_209)
  L8_209 = nil
  if A3_204 == 1 then
    L8_209 = 33923
  elseif A3_204 == 2 then
    L8_209 = 33924
  else
    L8_209 = 33925
  end
  L9_210 = desktopWidget
  L10_211 = L9_210
  L9_210 = L9_210.openJobQuestInformationWidget
  L9_210(L10_211, L5_206, L6_207, worldMaster, L8_209, A1_202, L7_208, A2_203)
  if A4_205 == 1 then
    L9_210 = worldMaster
    L10_211 = L9_210
    L9_210 = L9_210.notify
    L9_210(L10_211, worldMaster, L8_209, A1_202, L7_208, A2_203)
  end
  L10_211 = A0_201
  L9_210 = A0_201.getQuestId
  L9_210 = L9_210(L10_211)
  L10_211 = nil
  if L9_210 >= 111200 and L9_210 <= 111219 then
    L10_211 = 67108911
  elseif L9_210 >= 111220 and L9_210 <= 111239 then
    L10_211 = 67108913
  elseif L9_210 >= 111240 and L9_210 <= 111259 then
    L10_211 = 67108915
  elseif L9_210 >= 111260 and L9_210 <= 111279 then
    L10_211 = 67108916
  elseif L9_210 >= 111280 and L9_210 <= 111299 then
    L10_211 = 67108914
  elseif L9_210 >= 111300 and L9_210 <= 111319 then
    L10_211 = 67108918
  elseif L9_210 >= 111320 and L9_210 <= 111339 then
    L10_211 = 67108917
  else
    L10_211 = 67108911
  end
  A1_202:_runCharaScheduler(L10_211)
end
L0_0.showGetJobAbilityWidget = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_212, A1_213, A2_214, A3_215)
  local L4_216, L5_217, L6_218, L7_219
  L4_216 = 2
  L6_218 = A0_212
  L5_217 = A0_212.getJobQuestIcon
  L5_217 = L5_217(L6_218)
  L6_218 = nil
  if A2_214 == 2000203 or A2_214 == 2000202 or A2_214 == 2000201 or A2_214 == 2000206 or A2_214 == 2000207 or A2_214 == 2000204 or A2_214 == 2000205 then
    L6_218 = 51128
  else
    L6_218 = 33932
  end
  L7_219 = desktopWidget
  L7_219 = L7_219.openJobQuestInformationWidget
  L7_219(L7_219, L4_216, L5_217, worldMaster, L6_218, A2_214, 1, 1)
  if A3_215 == 1 then
    L7_219 = worldMaster
    L7_219 = L7_219.notify
    L7_219(L7_219, worldMaster, L6_218, A2_214, 1, 1)
  end
  L7_219 = nil
  if A2_214 == 2000203 then
    L7_219 = 67108903
  elseif A2_214 == 2000202 then
    L7_219 = 67108904
  elseif A2_214 == 2000201 then
    L7_219 = 67108905
  elseif A2_214 == 2000206 then
    L7_219 = 67108906
  elseif A2_214 == 2000207 then
    L7_219 = 67108907
  elseif A2_214 == 2000204 then
    L7_219 = 67108908
  elseif A2_214 == 2000205 then
    L7_219 = 67108909
  elseif A0_212:getQuestId() >= 111200 and A0_212:getQuestId() <= 111219 then
    L7_219 = 67108911
  elseif A0_212:getQuestId() >= 111220 and A0_212:getQuestId() <= 111239 then
    L7_219 = 67108913
  elseif A0_212:getQuestId() >= 111240 and A0_212:getQuestId() <= 111259 then
    L7_219 = 67108915
  elseif A0_212:getQuestId() >= 111260 and A0_212:getQuestId() <= 111279 then
    L7_219 = 67108916
  elseif A0_212:getQuestId() >= 111280 and A0_212:getQuestId() <= 111299 then
    L7_219 = 67108914
  elseif A0_212:getQuestId() >= 111300 and A0_212:getQuestId() <= 111319 then
    L7_219 = 67108918
  elseif A0_212:getQuestId() >= 111320 and A0_212:getQuestId() <= 111339 then
    L7_219 = 67108917
  else
    L7_219 = 67108911
  end
  A1_213:_runCharaScheduler(L7_219)
end
L0_0.showGetJobItemWidget = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_220)
  if A0_220:getQuestId() >= 111200 and A0_220:getQuestId() <= 111219 then
    return 962
  elseif A0_220:getQuestId() >= 111220 and A0_220:getQuestId() <= 111239 then
    return 961
  elseif A0_220:getQuestId() >= 111240 and A0_220:getQuestId() <= 111259 then
    return 965
  elseif A0_220:getQuestId() >= 111260 and A0_220:getQuestId() <= 111279 then
    return 966
  elseif A0_220:getQuestId() >= 111280 and A0_220:getQuestId() <= 111299 then
    return 960
  elseif A0_220:getQuestId() >= 111300 and A0_220:getQuestId() <= 111319 then
    return 964
  elseif A0_220:getQuestId() >= 111320 and A0_220:getQuestId() <= 111339 then
    return 963
  else
    return 209
  end
end
L0_0.getJobQuestIcon = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_221)
  if A0_221:getQuestId() >= 111200 and A0_221:getQuestId() <= 111219 then
    return 17
  elseif A0_221:getQuestId() >= 111220 and A0_221:getQuestId() <= 111239 then
    return 15
  elseif A0_221:getQuestId() >= 111240 and A0_221:getQuestId() <= 111259 then
    return 27
  elseif A0_221:getQuestId() >= 111260 and A0_221:getQuestId() <= 111279 then
    return 26
  elseif A0_221:getQuestId() >= 111280 and A0_221:getQuestId() <= 111299 then
    return 16
  elseif A0_221:getQuestId() >= 111300 and A0_221:getQuestId() <= 111319 then
    return 18
  elseif A0_221:getQuestId() >= 111320 and A0_221:getQuestId() <= 111339 then
    return 19
  else
    return 209
  end
end
L0_0.getJobQuestJobName = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_222, A1_223, A2_224)
  desktopWidget:askEventModeWidgetYield("Ask/JobTutorialWidget", 1)
end
L0_0.jobTutorial = L1_1
L0_0 = QuestBaseClass
function L1_1(A0_225, A1_226, A2_227, A3_228, ...)
  local L5_230, L6_231, L7_232, L8_233, L9_234, L10_235
  if select(1, ...) == nil then
    L5_230 = 1
  else
    L5_230 = select(1, ...)
  end
  if select(2, ...) == nil then
    L6_231 = 2
  else
    L6_231 = select(2, ...)
  end
  if select(3, ...) == nil then
    L7_232 = 3
  else
    L7_232 = select(3, ...)
  end
  if select(4, ...) == nil then
    L8_233 = 4
  else
    L8_233 = select(4, ...)
  end
  if select(5, ...) == nil then
    L9_234 = 5
  else
    L9_234 = select(5, ...)
  end
  if select(6, ...) == nil then
    L10_235 = "arglstr6Dummy"
  else
    L10_235 = select(6, ...)
  end
  A0_225:tellByNpcLinkshellChat(A2_227, worldMaster, 51035, A3_228, L5_230, L6_231, L7_232, L8_233, L9_234, L10_235)
end
L0_0.showEventBeforeNpsLS = L1_1
