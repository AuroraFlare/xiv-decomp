require("/Director/DirectorBaseClass")
_defineBaseClass("GuildleveBaseClass", "DirectorBaseClass")
function GuildleveBaseClass.getGuildleveId(A0_0)
  return A0_0.guildleveWork.guildleveId
end
function GuildleveBaseClass.getStartTime(A0_1)
  return A0_1.guildleveWork.startTime
end
function GuildleveBaseClass.setStartTime(A0_2, A1_3)
  A0_2.guildleveWork.startTime = A1_3
end
function GuildleveBaseClass.getSignal(A0_4)
  return A0_4.guildleveWork.signal
end
function GuildleveBaseClass.getAimNumOf(A0_5, A1_6)
  local L2_7
  L2_7 = A0_5.guildleveWork
  L2_7 = L2_7.aimNum
  L2_7 = L2_7[A1_6]
  return L2_7
end
function GuildleveBaseClass.setAimNumOf(A0_8, A1_9, A2_10)
  local L3_11
  L3_11 = A0_8.guildleveWork
  L3_11 = L3_11.aimNum
  L3_11[A1_9] = A2_10
end
function GuildleveBaseClass.setAimNumAll(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17, L6_18, L7_19, L8_20
  L5_17 = A0_12.guildleveWork
  L5_17 = L5_17.aimNum
  L6_18 = A0_12.guildleveWork
  L6_18 = L6_18.aimNum
  L7_19 = A0_12.guildleveWork
  L7_19 = L7_19.aimNum
  L8_20 = A0_12.guildleveWork
  L8_20 = L8_20.aimNum
  L5_17[1], L6_18[2], L7_19[3], L8_20[4] = A1_13, A2_14, A3_15, A4_16
end
function GuildleveBaseClass.getAimNumNowOf(A0_21, A1_22)
  local L2_23
  L2_23 = A0_21.guildleveWork
  L2_23 = L2_23.aimNumNow
  L2_23 = L2_23[A1_22]
  return L2_23
end
function GuildleveBaseClass.setAimNumNowOf(A0_24, A1_25, A2_26)
  local L3_27
  L3_27 = A0_24.guildleveWork
  L3_27 = L3_27.aimNumNow
  L3_27[A1_25] = A2_26
end
function GuildleveBaseClass.getUiStateOf(A0_28, A1_29)
  local L2_30
  L2_30 = A0_28.guildleveWork
  L2_30 = L2_30.uiState
  L2_30 = L2_30[A1_29]
  return L2_30
end
function GuildleveBaseClass.setUiStateOf(A0_31, A1_32, A2_33)
  local L3_34
  L3_34 = A0_31.guildleveWork
  L3_34 = L3_34.uiState
  L3_34[A1_32] = A2_33
end
function GuildleveBaseClass.setUiStateAll(A0_35, A1_36, A2_37, A3_38, A4_39)
  local L5_40, L6_41, L7_42, L8_43
  L5_40 = A0_35.guildleveWork
  L5_40 = L5_40.uiState
  L6_41 = A0_35.guildleveWork
  L6_41 = L6_41.uiState
  L7_42 = A0_35.guildleveWork
  L7_42 = L7_42.uiState
  L8_43 = A0_35.guildleveWork
  L8_43 = L8_43.uiState
  L5_40[1], L6_41[2], L7_42[3], L8_43[4] = A1_36, A2_37, A3_38, A4_39
end
function GuildleveBaseClass.setUiStateOffOf(A0_44, A1_45)
  local L2_46
  L2_46 = A0_44.guildleveWork
  L2_46 = L2_46.uiState
  L2_46[A1_45] = 0
end
function GuildleveBaseClass.setUiStateOnOf(A0_47, A1_48)
  local L2_49
  L2_49 = A0_47.guildleveWork
  L2_49 = L2_49.uiState
  L2_49[A1_48] = 1
end
function GuildleveBaseClass.setUiStateClearedOf(A0_50, A1_51)
  local L2_52
  L2_52 = A0_50.guildleveWork
  L2_52 = L2_52.uiState
  L2_52[A1_51] = 2
end
function GuildleveBaseClass.setUiStateFailedOf(A0_53, A1_54)
  local L2_55
  L2_55 = A0_53.guildleveWork
  L2_55 = L2_55.uiState
  L2_55[A1_54] = 4
end
function GuildleveBaseClass.getPosByMapMarkerExtra(A0_56)
  return A0_56.guildleveWork.exMarkerX, A0_56.guildleveWork.exMarkerY, A0_56.guildleveWork.exMarkerZ
end
function GuildleveBaseClass.init(A0_57, A1_58, A2_59, A3_60, A4_61, A5_62, ...)
  A0_57.guildleveWork._temp = {
    {
      "_assignForChild",
      6
    },
    {
      "guildleveId",
      "integer16"
    },
    {
      "aetheryteLocation",
      "integer8"
    },
    {"uiStep", "integer8"},
    {"timeLimit", "integer8"},
    {
      "aimNumNowTmp",
      "array",
      4,
      "integer8"
    },
    {
      "uiStateTmp",
      "array",
      4,
      "integer8"
    },
    {"exMarkerX", "float"},
    {"exMarkerY", "float"},
    {"exMarkerZ", "float"}
  }
  A0_57.guildleveWork._sync = {
    {
      "_assignForChild",
      8
    },
    {"startTime", "integer32"},
    {"signal", "integer8"},
    {
      "aimNum",
      "array",
      4,
      "integer8"
    },
    {
      "aimNumNow",
      "array",
      4,
      "integer8"
    },
    {
      "uiState",
      "array",
      4,
      "integer8"
    },
    {
      "markerX",
      "array",
      3,
      "float"
    },
    {
      "markerY",
      "array",
      3,
      "float"
    },
    {
      "markerZ",
      "array",
      3,
      "float"
    }
  }
  guildleveSheet:_loadKeyTemporarily(A1_58, A1_58)
  A0_57.guildleveWork.guildleveId = A1_58
  A0_57.guildleveWork.aetheryteLocation = A2_59
  A0_57.guildleveWork.uiStep = 0
  A0_57.guildleveWork.timeLimit = guildleveSheet:_getData(A1_58, 21)
  A0_57.guildleveWork.exMarkerX = A3_60
  A0_57.guildleveWork.exMarkerY = A4_61
  A0_57.guildleveWork.exMarkerZ = A5_62
  A0_57:initAsGuildleve(...)
  A0_57.guildleveWork._tag = {
    {
      "start",
      1,
      {"startTime"}
    },
    {
      "signal",
      1,
      {"signal"}
    },
    {
      "infoVariable",
      1,
      {"aimNum"},
      {"aimNumNow"},
      {"uiState"}
    },
    {
      "marker",
      1,
      {"markerX"},
      {"markerY"},
      {"markerZ"}
    }
  }
end
function GuildleveBaseClass.initAsGuildleve(A0_64, ...)
end
function GuildleveBaseClass.getAetheryteLocation(A0_66)
  return A0_66.guildleveWork.aetheryteLocation
end
function GuildleveBaseClass.getUiStep(A0_67)
  return A0_67.guildleveWork.uiStep
end
function GuildleveBaseClass.setUiStep(A0_68, A1_69)
  A0_68.guildleveWork.uiStep = A1_69
end
function GuildleveBaseClass.getAimNumNowTmpOf(A0_70, A1_71)
  local L2_72
  L2_72 = A0_70.guildleveWork
  L2_72 = L2_72.aimNumNowTmp
  L2_72 = L2_72[A1_71]
  return L2_72
end
function GuildleveBaseClass.setAimNumNowTmpOf(A0_73, A1_74, A2_75)
  local L3_76
  L3_76 = A0_73.guildleveWork
  L3_76 = L3_76.aimNumNowTmp
  L3_76[A1_74] = A2_75
end
function GuildleveBaseClass.getUiStateTmpOf(A0_77, A1_78)
  local L2_79
  L2_79 = A0_77.guildleveWork
  L2_79 = L2_79.uiStateTmp
  L2_79 = L2_79[A1_78]
  return L2_79
end
function GuildleveBaseClass.setUiStateTmpOf(A0_80, A1_81, A2_82)
  local L3_83
  L3_83 = A0_80.guildleveWork
  L3_83 = L3_83.uiStateTmp
  L3_83[A1_81] = A2_82
end
function GuildleveBaseClass.getRecommendedRank(A0_84)
  return guildleveSheet:_getData(A0_84.guildleveWork.guildleveId, 5)
end
function GuildleveBaseClass.getGuildleveWordText(A0_85)
  return guildleveSheet:_getData(A0_85:getGuildleveId(), 19)
end
function GuildleveBaseClass.getTimeLimit(A0_86)
  return A0_86.guildleveWork.timeLimit
end
function GuildleveBaseClass.processUIInit(A0_87)
  for _FORV_4_ = 1, 4 do
    A0_87.guildleveWork.aimNumNowTmp[_FORV_4_] = A0_87.guildleveWork.aimNumNow[_FORV_4_]
    A0_87.guildleveWork.uiStateTmp[_FORV_4_] = A0_87.guildleveWork.uiState[_FORV_4_]
  end
  if _FOR_(_FOR_) > 0 and A0_87:getUiStep() == 0 then
    A0_87:setUiStep(1)
    desktopWidget:processUpdateContentsInformation(A0_87, "start", A0_87:getGuildleveId())
    A0_87:setMiniMapMarkerForGL()
  end
end
function GuildleveBaseClass.processUpdateWork(A0_88, A1_89, A2_90)
  local L3_91, L4_92, L5_93, L6_94
  if A1_89 == "guildleveWork" then
    if A2_90 == "start" then
      if L3_91 > 0 then
        if L3_91 == 0 then
          L3_91(L4_92, L5_93)
          L6_94 = "start"
          L3_91(L4_92, L5_93, L6_94, A0_88:getGuildleveId())
          L3_91(L4_92)
          return
        end
      end
    end
    if not (L3_91 > 0) then
    elseif L3_91 == -1 then
      for L6_94 = 1, 4 do
        if A0_88.guildleveWork.aimNumNowTmp[L6_94] ~= A0_88:getAimNumNowOf(L6_94) then
          A0_88.guildleveWork.aimNumNowTmp[L6_94] = A0_88:getAimNumNowOf(L6_94)
        end
        if A0_88.guildleveWork.uiStateTmp[L6_94] ~= A0_88:getUiStateOf(L6_94) then
          A0_88.guildleveWork.uiStateTmp[L6_94] = A0_88:getUiStateOf(L6_94)
        end
        if true then
          desktopWidget:processUpdateContentsInformation(A0_88, "update", L6_94)
        end
      end
      if A2_90 == "signal" then
        if L3_91 == -1 then
          L6_94 = "finish"
          L3_91(L4_92, L5_93, L6_94)
          L3_91(L4_92)
          return
        else
          L3_91(L4_92)
          return
        end
      end
      if A2_90 == "marker" then
        L3_91(L4_92)
      end
    end
  end
end
function GuildleveBaseClass.processUIFinalize(A0_95)
  desktopWidget:setMiniMapWidgetMarkerData(2, -1)
  desktopWidget:processUpdateContentsInformation(A0_95, "cancel")
end
function GuildleveBaseClass.getKindContentsInformation(A0_96)
  local L1_97
  L1_97 = 1
  return L1_97
end
function GuildleveBaseClass.getDisplayLeveOnGuildleveInfo(A0_98)
  local L1_99, L2_100, L3_101
  L1_99 = 1
  L2_100 = math
  L3_101 = L2_100
  L2_100 = L2_100._randomInteger
  L2_100 = L2_100(L3_101, 1, 5)
  L3_101 = 1
  return L1_99, L2_100, L3_101
end
function GuildleveBaseClass.getTitleOnGuildleveInfo(A0_102)
  local L1_103, L2_104, L3_105
  L1_103 = worldMaster
  L2_104 = 33601
  L3_105 = A0_102.getGuildleveId
  L3_105 = L3_105(A0_102)
  return L1_103, L2_104, L3_105
end
function GuildleveBaseClass.getMaxIndexNumberOnGuildleveInfo(A0_106)
  local L1_107
  L1_107 = 4
  return L1_107
end
function GuildleveBaseClass.getTimeDataOnGuildleveInfo(A0_108)
  local L1_109, L2_110
  L2_110 = A0_108
  L1_109 = A0_108.getStartTime
  L1_109 = L1_109(L2_110)
  L2_110 = A0_108.getTimeLimit
  L2_110 = L2_110(A0_108)
  L2_110 = 60 * L2_110
  L1_109 = L1_109 + L2_110
  L2_110 = L1_109 - 60
  return L1_109, L2_110
end
function GuildleveBaseClass.getInstructionOnGuildleveInfo(A0_111)
  local L1_112, L2_113, L3_114, L4_115
  L1_112 = worldMaster
  L2_113 = 50089
  L3_114 = L1_112
  L4_115 = L2_113
  return L3_114, L4_115, A0_111:getGuildleveId()
end
function GuildleveBaseClass.getIdForInstruction(A0_116, A1_117)
  local L2_118, L3_119
  L2_118 = 10011
  L3_119 = A1_117
  if L3_119 == "glText" then
    L2_118 = 50003
    break
  else
  end
  if L3_119 == "sweep" then
    L2_118 = 10011
    break
  else
  end
  if L3_119 == "gather" then
    L2_118 = 10021
    break
  else
  end
  if L3_119 == "chase" then
    L2_118 = 10031
    break
  else
  end
  if L3_119 == "detect" then
    L2_118 = 10041
    break
  else
  end
  if L3_119 == "orb" then
    L2_118 = 10051
    break
  else
  end
  if L3_119 == "survive" then
    L2_118 = 10061
    break
  else
  end
  if L3_119 == "hunt" then
    L2_118 = 10071
    break
  else
  end
  if L3_119 == "round" then
    L2_118 = 10081
    break
  else
  end
  if L3_119 == "follow" then
    L2_118 = 10091
    break
  else
  end
  return L2_118
end
function GuildleveBaseClass.getArticleFullDataOnGuildleveInfo(A0_120, A1_121)
  local L2_122, L3_123, L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130
  L3_123 = A0_120
  L2_122 = A0_120.getArticleStateOnGuildleveInfo
  L4_124 = A1_121
  L2_122 = L2_122(L3_123, L4_124)
  L4_124 = A0_120
  L3_123 = A0_120.getArticleCondition
  L5_125 = A1_121
  L3_123 = L3_123(L4_124, L5_125)
  L5_125 = A0_120
  L4_124 = A0_120.getArticleParamOnGuildleveInfo
  L6_126 = A1_121
  L6_126 = L4_124(L5_125, L6_126)
  L7_127 = {
    [4] = L8_128(L9_129, L10_130)
  }
  L9_129 = A0_120
  L8_128 = A0_120.getArticleDataOnGuildleveInfo
  L10_130 = A1_121
  L10_130 = L8_128(L9_129, L10_130)
  ;({
    [4] = L8_128(L9_129, L10_130)
  })[1] = L8_128
  ;({
    [4] = L8_128(L9_129, L10_130)
  })[2] = L9_129
  ;({
    [4] = L8_128(L9_129, L10_130)
  })[3] = L10_130
  L8_128 = unpack
  L9_129 = L7_127
  L10_130 = 1
  L10_130 = L8_128(L9_129, L10_130, 3)
  return L2_122, L8_128, L3_123, L4_124, L5_125, L6_126, L9_129, L10_130, unpack(L7_127, 4, #L7_127)
end
function GuildleveBaseClass.getArticleDataOnGuildleveInfo(A0_131, A1_132)
  local L2_133, L3_134, L4_135, L5_136, L6_137, L7_138
  L2_133 = 0
  L3_134 = nil
  L4_135 = 0
  L5_136 = 0
  L6_137 = 0
  L7_138 = A1_132
  if L7_138 == 1 then
  elseif L7_138 == 2 then
  elseif L7_138 == 3 then
  else
  end
  if L7_138 == 4 then
    L2_133 = A0_131:getArticleTypeForInfo("smash")
    L3_134 = worldMaster
    L4_135 = A0_131:getTextIdForInfo("enemy")
    L5_136 = A0_131:getGuildleveId()
    L6_137 = A1_132
    break
  else
  end
  L7_138 = L2_133
  return L7_138, L3_134, L4_135, L5_136, L6_137
end
function GuildleveBaseClass.getTextIdForInfo(A0_139, A1_140)
  local L2_141, L3_142
  L2_141 = 50047
  L3_142 = A1_140
  if L3_142 == "glText" then
    L2_141 = 50003
    break
  else
  end
  if L3_142 == "glOrder" then
    L2_141 = 50089
    break
  else
  end
  if L3_142 == "enemy" then
    L2_141 = 50001
    break
  else
  end
  if L3_142 == "enemyParty" then
    L2_141 = 50099
    break
  else
  end
  if L3_142 == "item" then
    L2_141 = 50002
    break
  else
  end
  return L2_141
end
function GuildleveBaseClass.getArticleTypeForInfo(A0_143, A1_144)
  local L2_145, L3_146
  L2_145 = 0
  L3_146 = A1_144
  if L3_146 == "smash" then
    L2_145 = 6
    break
  else
  end
  if L3_146 == "get" then
    L2_145 = 2
    break
  else
  end
  if L3_146 == "number" then
    L2_145 = 1
    break
  else
  end
  if L3_146 == "fraction" then
    L2_145 = 2
    break
  else
  end
  if L3_146 == "barFraction" then
    L2_145 = 6
    break
  else
  end
  if L3_146 == "time" then
    L2_145 = 3
    break
  else
  end
  if L3_146 == "barTime" then
    L2_145 = 8
    break
  else
  end
  if L3_146 == "bar" then
    L2_145 = 4
    break
  else
  end
  return L2_145
end
function GuildleveBaseClass.getArticleStateOnGuildleveInfo(A0_147, A1_148)
  local L2_149, L3_150
  L2_149 = 0
  L3_150 = A1_148
  if L3_150 == 1 then
  elseif L3_150 == 2 then
  elseif L3_150 == 3 then
  else
  end
  if L3_150 == 4 then
    L2_149 = A0_147:getUiStateOf(A1_148)
    break
  else
  end
  return L2_149
end
function GuildleveBaseClass.getArticleStateForInfo(A0_151, A1_152)
  local L2_153, L3_154
  L2_153 = 0
  L3_154 = A1_152
  if L3_154 == "off" then
    L2_153 = 0
    break
  else
  end
  if L3_154 == "on" then
    L2_153 = 1
    break
  else
  end
  if L3_154 == "cleared" then
    L2_153 = 2
    break
  else
  end
  if L3_154 == "unfailed" then
    L2_153 = 3
    break
  else
  end
  if L3_154 == "failed" then
    L2_153 = 4
    break
  else
  end
  return L2_153
end
function GuildleveBaseClass.getArticleCondition(A0_155, A1_156)
  local L2_157, L3_158
  L2_157 = 0
  L3_158 = A1_156
  if L3_158 == 1 then
  elseif L3_158 == 2 then
  elseif L3_158 == 3 then
  else
  end
  if L3_158 == 4 then
    L2_157 = A0_155:getArticleConditionForInfo("smash")
    break
  else
  end
  return L2_157
end
function GuildleveBaseClass.getArticleConditionForInfo(A0_159, A1_160)
  local L2_161, L3_162
  L2_161 = 0
  L3_162 = A1_160
  if L3_162 == "none" then
    L2_161 = 0
    break
  else
  end
  if L3_162 == "smash" then
    L2_161 = 1
    break
  else
  end
  if L3_162 == "get" then
    L2_161 = 2
    break
  else
  end
  if L3_162 == "guard" then
    L2_161 = 3
    break
  else
  end
  if L3_162 == "time" then
    L2_161 = 4
    break
  else
  end
  return L2_161
end
function GuildleveBaseClass.getArticleParamOnGuildleveInfo(A0_163, A1_164)
  local L2_165, L3_166, L4_167, L5_168
  L5_168 = A1_164
  if L5_168 == 1 then
  elseif L5_168 == 2 then
  elseif L5_168 == 3 then
  else
  end
  if L5_168 == 4 then
    L2_165 = A0_163:getAimNumNowOf(A1_164)
    L3_166 = A0_163:getAimNumOf(A1_164)
    break
  else
  end
  L5_168 = L2_165
  return L5_168, L3_166, L4_167
end
function GuildleveBaseClass.processMapOpenMessage(A0_169)
  local L1_170, L2_171, L3_172, L4_173, L5_174, L6_175
  L1_170 = A0_169.guildleveWork
  L1_170 = L1_170.signal
  if L1_170 == -1 then
    L1_170 = A0_169.processMapOpenMessageForAchieve
    L1_170 = L1_170(L2_171)
    if L1_170 == true then
      return
    end
  end
  L1_170 = 0
  for L5_174 = 1, 3 do
    L6_175 = A0_169.guildleveWork
    L6_175 = L6_175.markerX
    L6_175 = L6_175[L5_174]
    if L6_175 ~= 0 then
      L6_175 = A0_169.guildleveWork
      L6_175 = L6_175.markerX
      L6_175 = L6_175[L5_174]
      if L6_175 ~= nil then
        L6_175 = A0_169.guildleveWork
        L6_175 = L6_175.markerY
        L6_175 = L6_175[L5_174]
        if L6_175 ~= nil then
          L6_175 = A0_169.guildleveWork
          L6_175 = L6_175.markerZ
          L6_175 = L6_175[L5_174]
          if L6_175 ~= nil then
            L6_175 = A0_169.setMapMarkerSize
            L6_175 = L6_175(A0_169, L5_174)
            desktopWidget:setMapNavigationWidgetMarkerData(2, L1_170, L6_175, A0_169.guildleveWork.markerX[L5_174], A0_169.guildleveWork.markerY[L5_174], A0_169.guildleveWork.markerZ[L5_174])
            L1_170 = L1_170 + 1
          end
        end
      end
    end
  end
  if L2_171 > 0 then
    L5_174 = 2
    L6_175 = L1_170
    L3_172(L4_173, L5_174, L6_175, L2_171, A0_169.guildleveWork.exMarkerX, A0_169.guildleveWork.exMarkerY, A0_169.guildleveWork.exMarkerZ)
  end
end
function GuildleveBaseClass.processMapOpenMessageForAchieve(A0_176)
  if A0_176.guildleveWork.markerX[1] ~= nil and A0_176.guildleveWork.markerY[1] ~= nil and A0_176.guildleveWork.markerZ[1] ~= nil then
    desktopWidget:setMapNavigationWidgetMarkerData(2, 0, 1, A0_176.guildleveWork.markerX[1], A0_176.guildleveWork.markerY[1], A0_176.guildleveWork.markerZ[1])
    return true
  end
end
function GuildleveBaseClass.setMiniMapMarkerForGL(A0_177)
  local L1_178, L2_179, L3_180, L4_181, L5_182, L6_183
  L1_178 = desktopWidget
  L1_178 = L1_178.setMiniMapWidgetMarkerData
  L1_178(L2_179, L3_180, L4_181)
  L1_178 = A0_177.guildleveWork
  L1_178 = L1_178.signal
  if L1_178 == -1 then
    L1_178 = A0_177.processSetMiniMapMarkerForGLAchieve
    L1_178 = L1_178(L2_179)
    if L1_178 == true then
      return
    end
  end
  L1_178 = 0
  for L5_182 = 1, 3 do
    L6_183 = A0_177.guildleveWork
    L6_183 = L6_183.markerX
    L6_183 = L6_183[L5_182]
    if L6_183 ~= 0 then
      L6_183 = A0_177.guildleveWork
      L6_183 = L6_183.markerX
      L6_183 = L6_183[L5_182]
      if L6_183 ~= nil then
        L6_183 = A0_177.guildleveWork
        L6_183 = L6_183.markerY
        L6_183 = L6_183[L5_182]
        if L6_183 ~= nil then
          L6_183 = A0_177.guildleveWork
          L6_183 = L6_183.markerZ
          L6_183 = L6_183[L5_182]
          if L6_183 ~= nil then
            L6_183 = A0_177.setMapMarkerSize
            L6_183 = L6_183(A0_177, L5_182)
            desktopWidget:setMiniMapWidgetMarkerData(2, L1_178, L6_183, A0_177.guildleveWork.markerX[L5_182], A0_177.guildleveWork.markerY[L5_182], A0_177.guildleveWork.markerZ[L5_182])
            L1_178 = L1_178 + 1
          end
        end
      end
    end
  end
  if L2_179 > 0 then
    L5_182 = 2
    L6_183 = L1_178
    L3_180(L4_181, L5_182, L6_183, L2_179, A0_177.guildleveWork.exMarkerX, A0_177.guildleveWork.exMarkerY, A0_177.guildleveWork.exMarkerZ)
  end
end
function GuildleveBaseClass.processSetMiniMapMarkerForGLAchieve(A0_184)
  if A0_184.guildleveWork.markerX[1] ~= nil and A0_184.guildleveWork.markerY[1] ~= nil and A0_184.guildleveWork.markerZ[1] ~= nil then
    desktopWidget:setMiniMapWidgetMarkerData(2, 0, 1, A0_184.guildleveWork.markerX[1], A0_184.guildleveWork.markerY[1], A0_184.guildleveWork.markerZ[1])
    return true
  end
end
function GuildleveBaseClass.setMapMarkerSize(A0_185, A1_186)
  local L2_187, L3_188
  L3_188 = A0_185
  L2_187 = A0_185.processSetMapMarkerSize
  L2_187 = L2_187(L3_188, A1_186)
  L3_188 = L2_187
  if L3_188 == "small" then
    return 1
  else
  end
  if L3_188 == "normal" then
    return 2
  else
  end
  if L3_188 == "large" then
    return 3
  else
  end
  return 1
end
function GuildleveBaseClass.processSetMapMarkerSize(A0_189, A1_190)
  local L2_191
  L2_191 = A1_190
  if A0_189:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
