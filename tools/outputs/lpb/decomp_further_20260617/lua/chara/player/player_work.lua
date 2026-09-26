local L0_0, L1_1
L0_0 = Player
function L1_1(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
L0_0.isWorldEndTerm = L1_1
L0_0 = Player
function L1_1(A0_4)
  return A0_4.work.betacheck
end
L0_0.isBeta = L1_1
L0_0 = Player
function L1_1(A0_5)
  local L1_6
  L1_6 = A0_5.work
  L1_6 = L1_6.betacheck
  L1_6 = not L1_6
  return L1_6
end
L0_0.isMaskUnderDevelop = L1_1
L0_0 = Player
function L1_1(A0_7)
  local L1_8
  L1_8 = false
  return L1_8
end
L0_0.isMaskForChina = L1_1
L0_0 = Player
function L1_1(A0_9, A1_10)
  local L2_11
  if A1_10 < 120000 then
    L2_11 = true
    return L2_11
  else
    L2_11 = false
    return L2_11
  end
end
L0_0.isRegionalleve = L1_1
L0_0 = Player
function L1_1(A0_12, A1_13)
  local L2_14
  if A1_13 >= 20000 and A1_13 <= 29999 then
    L2_14 = true
    return L2_14
  end
  L2_14 = false
  return L2_14
end
L0_0.isCompanyleve = L1_1
L0_0 = Player
function L1_1(A0_15, A1_16)
  local L2_17
  if A1_16 <= 8 then
    L2_17 = A0_15.work
    L2_17 = L2_17.guildleveId
    L2_17 = L2_17[A1_16]
    return L2_17
  else
    L2_17 = A0_15.work
    L2_17 = L2_17.guildleveId
    L2_17 = L2_17[A1_16]
    L2_17 = L2_17 + 120000
    return L2_17
  end
end
L0_0.getGuildleveID = L1_1
L0_0 = Player
function L1_1(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23
  for L4_22 = 1, 8 do
    L5_23 = A0_18.work
    L5_23 = L5_23.guildleveId
    L5_23 = L5_23[L4_22]
    if L5_23 == 0 then
      L5_23 = L4_22 - 1
      return L5_23
    end
  end
  return L1_19
end
L0_0.getGuildleveIndexMax = L1_1
L0_0 = Player
function L1_1(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29
  for L4_28 = 9, #L2_26 do
    L5_29 = A0_24.work
    L5_29 = L5_29.guildleveId
    L5_29 = L5_29[L4_28]
    if L5_29 == 0 then
      L5_29 = L4_28 - 1
      L5_29 = L5_29 - 8
      return L5_29
    end
  end
  return L1_25
end
L0_0.getLocalleveIndexMax = L1_1
L0_0 = Player
function L1_1(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L6_35
  for L6_35 = 1, 8 do
    if A0_30.work.guildleveId[L6_35] == A1_31 then
      return true
    end
  end
  return L2_32
end
L0_0.isHavingGuildleveById = L1_1
L0_0 = Player
function L1_1(A0_36, A1_37)
  local L2_38, L3_39, L4_40, L6_41
  for L6_41 = 9, #L3_39 do
    if A0_36.work.guildleveId[L6_41] + 120000 == A1_37 then
      return true
    end
  end
  return L2_38
end
L0_0.isHavingLocalleveById = L1_1
L0_0 = Player
function L1_1(A0_42, A1_43)
  local L2_44, L3_45, L4_46, L5_47, L6_48
  for L5_47 = 1, 8 do
    L6_48 = A0_42.work
    L6_48 = L6_48.guildleveId
    L6_48 = L6_48[L5_47]
    if L6_48 == A1_43 then
      L6_48 = A0_42.work
      L6_48 = L6_48.guildleveDone
      L6_48 = L6_48[L5_47]
      if L6_48 == true then
        L6_48 = true
        return L6_48
      end
    end
  end
  return L2_44
end
L0_0.isDoneGuildleveById = L1_1
L0_0 = Player
function L1_1(A0_49, A1_50)
  local L2_51, L3_52, L4_53, L5_54, L6_55
  for L5_54 = 9, #L3_52 do
    L6_55 = A0_49.work
    L6_55 = L6_55.guildleveId
    L6_55 = L6_55[L5_54]
    L6_55 = L6_55 + 120000
    if L6_55 == A1_50 then
      L6_55 = A0_49.work
      L6_55 = L6_55.guildleveDone
      L6_55 = L6_55[L5_54]
      if L6_55 == true then
        L6_55 = true
        return L6_55
      end
    end
  end
  return L2_51
end
L0_0.isDoneLocalleveById = L1_1
L0_0 = Player
function L1_1(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62
  for L5_61 = 1, 8 do
    L6_62 = A0_56.work
    L6_62 = L6_62.guildleveId
    L6_62 = L6_62[L5_61]
    if L6_62 == A1_57 then
      L6_62 = A0_56.work
      L6_62 = L6_62.guildleveChecked
      L6_62 = L6_62[L5_61]
      if L6_62 == true then
        L6_62 = true
        return L6_62
      end
    end
  end
  return L2_58
end
L0_0.isCheckedGuildleveById = L1_1
L0_0 = Player
function L1_1(A0_63, A1_64)
  local L2_65, L3_66, L4_67, L5_68, L6_69
  for L5_68 = 9, #L3_66 do
    L6_69 = A0_63.work
    L6_69 = L6_69.guildleveId
    L6_69 = L6_69[L5_68]
    L6_69 = L6_69 + 120000
    if L6_69 == A1_64 then
      L6_69 = A0_63.work
      L6_69 = L6_69.guildleveChecked
      L6_69 = L6_69[L5_68]
      if L6_69 == true then
        L6_69 = true
        return L6_69
      end
    end
  end
  return L2_65
end
L0_0.isCheckedLocalleveById = L1_1
L0_0 = Player
function L1_1(A0_70, A1_71)
  local L2_72, L3_73, L4_74, L5_75, L6_76
  for L5_75 = 1, 8 do
    L6_76 = A0_70.work
    L6_76 = L6_76.guildleveId
    L6_76 = L6_76[L5_75]
    if L6_76 == A1_71 then
      L6_76 = A0_70.work
      L6_76 = L6_76.guildleveDone
      L6_76 = L6_76[L5_75]
      if L6_76 == true then
        L6_76 = false
        return L6_76
      else
        L6_76 = A0_70.work
        L6_76 = L6_76.guildleveChecked
        L6_76 = L6_76[L5_75]
        if L6_76 == true then
          L6_76 = false
          return L6_76
        end
      end
      L6_76 = true
      return L6_76
    end
  end
  return L2_72
end
L0_0.isUnusedGuildleveById = L1_1
L0_0 = Player
function L1_1(A0_77, A1_78)
  local L2_79, L3_80, L4_81, L5_82, L6_83
  for L5_82 = 9, #L3_80 do
    L6_83 = A0_77.work
    L6_83 = L6_83.guildleveId
    L6_83 = L6_83[L5_82]
    L6_83 = L6_83 + 120000
    if L6_83 == A1_78 then
      L6_83 = A0_77.work
      L6_83 = L6_83.guildleveDone
      L6_83 = L6_83[L5_82]
      if L6_83 == true then
        L6_83 = false
        return L6_83
      else
        L6_83 = A0_77.work
        L6_83 = L6_83.guildleveChecked
        L6_83 = L6_83[L5_82]
        if L6_83 == true then
          L6_83 = false
          return L6_83
        end
      end
      L6_83 = true
      return L6_83
    end
  end
  return L2_79
end
L0_0.isUnusedLocalleveById = L1_1
L0_0 = Player
function L1_1(A0_84, A1_85)
  local L2_86, L3_87, L4_88, L5_89, L6_90
  for L5_89 = 1, 8 do
    L6_90 = A0_84.work
    L6_90 = L6_90.guildleveId
    L6_90 = L6_90[L5_89]
    if L6_90 == A1_85 then
      L6_90 = A0_84.work
      L6_90 = L6_90.guildleveChecked
      L6_90 = L6_90[L5_89]
      if L6_90 == true then
        L6_90 = A0_84.work
        L6_90 = L6_90.guildleveDone
        L6_90 = L6_90[L5_89]
        if L6_90 == true then
          L6_90 = true
          return L6_90
        end
        L6_90 = false
        return L6_90
      end
    end
  end
  return L2_86
end
L0_0.isClearedGuildleveById = L1_1
L0_0 = Player
function L1_1(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97
  for L5_96 = 9, #L3_94 do
    L6_97 = A0_91.work
    L6_97 = L6_97.guildleveId
    L6_97 = L6_97[L5_96]
    L6_97 = L6_97 + 120000
    if L6_97 == A1_92 then
      L6_97 = A0_91.work
      L6_97 = L6_97.guildleveChecked
      L6_97 = L6_97[L5_96]
      if L6_97 == true then
        L6_97 = A0_91.work
        L6_97 = L6_97.guildleveDone
        L6_97 = L6_97[L5_96]
        if L6_97 == true then
          L6_97 = true
          return L6_97
        end
        L6_97 = false
        return L6_97
      end
    end
  end
  return L2_93
end
L0_0.isClearedLocalleveById = L1_1
L0_0 = Player
function L1_1(A0_98, A1_99)
  local L2_100, L3_101, L4_102, L6_103
  for L6_103 = 1, 8 do
    if A0_98.work.guildleveId[L6_103] == A1_99 then
      return L6_103
    end
  end
  return L2_100
end
L0_0.getGuildleveIndexById = L1_1
L0_0 = Player
function L1_1(A0_104, A1_105)
  local L2_106
  if A1_105 >= 1000 and A1_105 <= 1099 then
    L2_106 = 535
    return L2_106
  elseif A1_105 >= 1100 and A1_105 <= 1199 then
    L2_106 = 536
    return L2_106
  elseif A1_105 >= 1200 and A1_105 <= 1299 then
    L2_106 = 537
    return L2_106
  elseif A1_105 >= 3200 and A1_105 <= 3399 then
    L2_106 = 597
    return L2_106
  elseif A1_105 >= 4000 and A1_105 <= 4199 then
    L2_106 = 597
    return L2_106
  elseif A1_105 >= 4800 and A1_105 <= 4999 then
    L2_106 = 597
    return L2_106
  elseif A1_105 >= 3400 and A1_105 <= 3599 then
    L2_106 = 598
    return L2_106
  elseif A1_105 >= 4200 and A1_105 <= 4399 then
    L2_106 = 598
    return L2_106
  elseif A1_105 >= 5000 and A1_105 <= 5199 then
    L2_106 = 598
    return L2_106
  elseif A1_105 >= 3600 and A1_105 <= 3799 then
    L2_106 = 599
    return L2_106
  elseif A1_105 >= 4400 and A1_105 <= 4599 then
    L2_106 = 599
    return L2_106
  elseif A1_105 >= 5200 and A1_105 <= 5399 then
    L2_106 = 599
    return L2_106
  elseif A1_105 >= 20800 and A1_105 <= 21599 then
    L2_106 = 527
    return L2_106
  elseif A1_105 >= 21600 and A1_105 <= 22399 then
    L2_106 = 529
    return L2_106
  elseif A1_105 >= 22400 and A1_105 <= 23159 then
    L2_106 = 528
    return L2_106
  end
  L2_106 = 596
  return L2_106
end
L0_0.getActiveGLKindIcon = L1_1
L0_0 = Player
function L1_1(A0_107, A1_108)
  local L2_109
  L2_109 = 236
  return L2_109
end
L0_0.getLocalGLKindIcon = L1_1
L0_0 = Player
function L1_1(A0_110, A1_111)
  local L2_112, L3_113
  L2_112 = A0_110.work
  L2_112 = L2_112.event_achieve_aetheryte
  L3_113 = A1_111 - 1280000
  L2_112 = L2_112[L3_113]
  return L2_112
end
L0_0.getAchieveAetheryte = L1_1
L0_0 = Player
function L1_1(A0_114)
  local L1_115, L2_116, L3_117, L4_118, L5_119
  L1_115 = {}
  L2_116 = {
    L3_117,
    L4_118,
    L5_119
  }
  L3_117 = {L4_118, L5_119}
  L4_118 = "weatherNow"
  L5_119 = "integer16"
  L4_118 = {L5_119, "integer16"}
  L5_119 = "weatherDefault"
  L5_119 = {
    "cutSceneReplayId",
    "integer32"
  }
  L3_117 = {
    L4_118,
    L5_119,
    {
      "guildleveChecked",
      "array",
      16,
      "boolean"
    },
    {
      "event_achieve_aetheryte",
      "array",
      512,
      "boolean"
    },
    {"betacheck", "boolean"}
  }
  L4_118 = {
    L5_119,
    "array",
    16,
    "integer16"
  }
  L5_119 = "guildleveId"
  L5_119 = {
    "guildleveDone",
    "array",
    16,
    "boolean"
  }
  L4_118 = {
    L5_119,
    {
      "betacheck",
      1,
      A0_114,
      {"betacheck"}
    }
  }
  L5_119 = {
    "guildleve",
    1,
    A0_114,
    {
      "guildleveId"
    },
    {
      "guildleveDone"
    },
    {
      "guildleveChecked"
    }
  }
  L5_119 = {
    {
      "achieveAetheryte",
      {
        "event_achieve_aetheryte",
        "."
      }
    }
  }
  return L1_115, L2_116, L3_117, L4_118, L5_119
end
L0_0.defineWork = L1_1
L0_0 = Player
function L1_1(A0_120, A1_121)
  A0_120.work.weatherNow = A1_121
end
L0_0.setWeatherId = L1_1
L0_0 = Player
function L1_1(A0_122)
  return A0_122.work.weatherNow
end
L0_0.getWeatherId = L1_1
L0_0 = Player
function L1_1(A0_123, A1_124, A2_125)
  A2_125 = A2_125 / 100
  return (_math.ceil(A0_123:getSkillPointMax(A1_124) * A2_125))
end
L0_0.calcSkillPoint = L1_1
L0_0 = Player
function L1_1(A0_126)
  return A0_126.work.cutSceneReplayId
end
L0_0.getCutSceneReplayId = L1_1
