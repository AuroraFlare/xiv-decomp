local L0_0, L1_1
L0_0 = NpcBaseClass
function L1_1(A0_2)
  local L1_3
  L1_3 = 7
  return L1_3
end
L0_0.getLimitedDistanceForTalk = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_4, ...)
end
L0_0.initForEvent = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_6, A1_7, ...)
  if A0_6:_getGrandOnExtraStat() then
    A0_6:_setGroundOn(false)
  end
end
L0_0.initForEventCommon = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  local L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23
  if A1_10 == 0 or A1_10 == 1 or A1_10 == 2 or A1_10 == 7 then
    L13_22 = A2_11
    L12_21 = A2_11._getPos
    L14_23 = L12_21(L13_22)
    L8_17 = L14_23
    L7_16 = L13_22
    L6_15 = L12_21
  elseif A1_10 == 3 or A1_10 == 4 then
    L6_15 = A3_12
    L7_16 = A4_13
    L8_17 = A5_14
  elseif A1_10 == 5 or A1_10 == 6 then
    L12_21, L13_22, L14_23 = nil, nil, nil
    L6_15, L7_16, L8_17 = A2_11:_getPos()
    L9_18, L10_19, L11_20 = A0_9:_getPos()
    L12_21 = L6_15 - L9_18
    L13_22 = L7_16 - L10_19
    L14_23 = L8_17 - L11_20
    L6_15 = L9_18 - L12_21
    L7_16 = L10_19 - L13_22
    L8_17 = L11_20 - L14_23
  end
  L13_22 = A0_9
  L12_21 = A0_9._getDir
  L12_21 = L12_21(L13_22)
  L14_23 = A0_9
  L13_22 = A0_9._getOrientation
  L13_22 = L13_22(L14_23, L6_15, L7_16, L8_17)
  if A1_10 == 0 or A1_10 == 1 or A1_10 == 2 then
    if L13_22 > 0.523 or L13_22 < -0.523 then
      L14_23 = A0_9._lookAtCharacter
      L14_23(A0_9, A2_11, 1)
    else
      L14_23 = A0_9._lookAtCharacter
      L14_23(A0_9, A2_11, 1)
    end
  elseif A1_10 == 7 then
    if L13_22 > 1.047 or L13_22 < -1.047 then
    else
      L14_23 = A0_9._lookAtCharacter
      L14_23(A0_9, A2_11, 0.25)
    end
  elseif L13_22 > 0.523 or L13_22 < -0.523 then
    L14_23 = A0_9._lookAtPosition
    L14_23(A0_9, L6_15, L7_16, L8_17, 1)
  else
    L14_23 = A0_9._lookAtPosition
    L14_23(A0_9, L6_15, L7_16, L8_17, 1)
  end
  if A1_10 == 1 or A1_10 == 7 then
    if L13_22 > 1.047 or L13_22 < -1.047 then
      L14_23 = L12_21 + L13_22
      A0_9:_turnDir(L14_23)
      A0_9:_waitForTurning()
    end
  elseif A1_10 == 2 then
    L14_23 = A0_9._lookAtCharacter
    L14_23(A0_9, A2_11, 0.25)
  elseif A1_10 == 3 then
    L14_23 = L12_21 + L13_22
    A0_9:_turnDir(L14_23)
    A0_9:_waitForTurning()
  elseif A1_10 == 4 then
    L14_23 = A0_9._lookAtPosition
    L14_23(A0_9, L6_15, L7_16, L8_17, 1)
  elseif A1_10 == 5 then
    L14_23 = L12_21 + L13_22
    A0_9:_turnDir(L14_23)
    A0_9:_waitForTurning()
  elseif A1_10 == 6 then
    L14_23 = A0_9._lookAtPosition
    L14_23(A0_9, L6_15, L7_16, L8_17, 1)
  end
end
L0_0.startCliantTalkTurn = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_24, A1_25, A2_26)
  local L3_27, L4_28, L5_29, L6_30, L7_31, L8_32
  L4_28 = A2_26
  L3_27 = A2_26._getPos
  L5_29 = L3_27(L4_28)
  L7_31 = A0_24
  L6_30 = A0_24._getDir
  L6_30 = L6_30(L7_31)
  L8_32 = A0_24
  L7_31 = A0_24._getOrientation
  L7_31 = L7_31(L8_32, L3_27, L4_28, L5_29)
  if A1_25 == 1 then
    L8_32 = A0_24._lookAtCharacter
    L8_32(A0_24, A2_26, 1)
    if L7_31 > 1.047 or L7_31 < -1.047 then
      L8_32 = L6_30 + L7_31
      A0_24:_turnDir(L8_32)
    end
  elseif A1_25 == 2 then
    L8_32 = A0_24._lookAtCharacter
    L8_32(A0_24, A2_26, 0.5)
  elseif A1_25 == 3 then
  end
end
L0_0.startCliantTalkTurnNoWait = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_33)
  A0_33:_waitForTurning()
end
L0_0.waitCliantTalkTurn = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_34)
  A0_34:_turnBack()
  A0_34:_cancelLookAt()
end
L0_0.finishCliantTalkTurn = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_35)
  local L1_36
end
L0_0.normalTalkStep0 = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_37, A1_38, A2_39, A3_40, ...)
  if A3_40 == 0 then
    A0_37:_runCharaScheduler(403087360)
  elseif A3_40 == -1 then
  elseif A3_40 == 1 then
    A0_37:_runCharaScheduler(403066880)
  elseif A3_40 == 2 then
    A0_37:_runCharaScheduler(403070976)
  elseif A3_40 == 3 then
    A0_37:_runCharaScheduler(403075072)
  elseif A3_40 == 4 then
    A0_37:_runCharaScheduler(403079168)
  elseif A3_40 == 5 then
    A0_37:_runCharaScheduler(403083264)
  elseif A3_40 == 6 then
    A0_37:_runCharaScheduler(403087360)
  elseif A3_40 == 7 then
    A0_37:_runCharaScheduler(403091456)
  elseif A3_40 == 8 then
    A0_37:_runCharaScheduler(403095552)
  elseif A3_40 == 8 then
    A0_37:_runCharaScheduler(403099648)
  end
  desktopWidget:showMessage(A0_37, 38, A1_38, A2_39, ...)
end
L0_0.say = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_42, A1_43, A2_44, ...)
  local L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64
  L4_46 = {}
  L5_47 = false
  L6_48 = 1
  L7_49 = 1
  L8_50 = 0
  L9_51 = 1
  L10_52 = 0
  while L5_47 == false do
    L11_53 = select
    L13_54 = L6_48
    L23_64 = ...
    L11_53 = L11_53(L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, ...)
    if L11_53 == true then
      L11_53 = A2_44 + L6_48
      L4_46[L7_49] = L11_53
      L7_49 = L7_49 + 1
    end
    L6_48 = L6_48 + 1
    L9_51 = L9_51 + 1
    L11_53 = type
    L13_54 = select
    L14_55 = L6_48
    L23_64 = ...
    L23_64 = L13_54(L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, ...)
    L11_53 = L11_53(L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, L13_54(L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, ...))
    if L11_53 ~= "boolean" then
      L5_47 = true
    end
  end
  L6_48 = L6_48 + 1
  L11_53 = type
  L13_54 = select
  L14_55 = L6_48
  L23_64 = ...
  L23_64 = L13_54(L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, ...)
  L11_53 = L11_53(L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, L13_54(L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, ...))
  if L11_53 == "boolean" then
  end
  L11_53 = desktopWidget
  L13_54 = L11_53
  L11_53 = L11_53.askForEventMode
  L14_55 = A0_42
  L15_56 = A0_42
  L16_57 = A1_43
  L17_58 = 1
  L18_59 = false
  L19_60 = false
  L20_61 = A2_44
  L21_62 = L4_46
  L22_63 = select
  L23_64 = L9_51
  L23_64 = L22_63(L23_64, ...)
  L11_53 = L11_53(L13_54, L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, L22_63(L23_64, ...))
  L6_48 = 1
  while L10_52 < L11_53 do
    L13_54 = select
    L14_55 = L6_48
    L23_64 = ...
    L13_54 = L13_54(L14_55, L15_56, L16_57, L17_58, L18_59, L19_60, L20_61, L21_62, L22_63, L23_64, ...)
    if L13_54 == true then
      L10_52 = L10_52 + 1
    end
    L8_50 = L8_50 + 1
    L6_48 = L6_48 + 1
  end
  return L8_50
end
L0_0.askRestrictChoices = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_65, A1_66, A2_67, A3_68, ...)
  local L5_70, L7_71, L8_72, L9_73, L10_74, L11_75, L12_76, L13_77, L14_78, L15_79, L16_80
  L5_70 = {}
  for L10_74 = 1, A3_68 do
    L11_75 = A2_67 + L10_74
    L5_70[L10_74] = L11_75
  end
  L10_74 = A0_65
  L11_75 = A1_66
  L12_76 = 1
  L13_77 = false
  L14_78 = false
  L15_79 = A2_67
  L16_80 = L5_70
  return L7_71
end
L0_0.ask = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_81, A1_82, A2_83, A3_84, A4_85, A5_86, ...)
  local L7_88, L8_89, L9_90, L10_91, L11_92, L12_93, L13_94, L14_95, L15_96, L16_97, L17_98, L18_99, L19_100
  L7_88 = {}
  for L11_92 = 1, A3_84 do
    L12_93 = A2_83 + L11_92
    L7_88[L11_92] = L12_93
  end
  if A4_85 == 0 then
    L11_92 = A0_81
    L12_93 = A0_81
    L13_94 = A1_82
    L14_95 = A5_86
    L15_96 = false
    L16_97 = false
    L17_98 = A2_83
    L18_99 = L7_88
    L19_100 = ...
  elseif A4_85 == 1 then
    L11_92 = A0_81
    L12_93 = A0_81
    L13_94 = A1_82
    L14_95 = A5_86
    L15_96 = false
    L16_97 = true
    L17_98 = A2_83
    L18_99 = L7_88
    L19_100 = ...
  elseif A4_85 == 2 then
    L11_92 = A0_81
    L12_93 = A0_81
    L13_94 = A1_82
    L14_95 = A5_86
    L15_96 = true
    L16_97 = false
    L17_98 = A2_83
    L18_99 = L7_88
    L19_100 = ...
  elseif A4_85 == 3 then
    L11_92 = A0_81
    L12_93 = A0_81
    L13_94 = A1_82
    L14_95 = A5_86
    L15_96 = true
    L16_97 = true
    L17_98 = A2_83
    L18_99 = L7_88
    L19_100 = ...
  end
  return L8_89
end
L0_0.askExtendWidget = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_101, A1_102, A2_103, A3_104, A4_105, A5_106, A6_107, ...)
  local L9_109, L10_110, L11_111, L12_112, L13_113, L14_114, L15_115, L16_116, L17_117, L18_118
  L9_109 = desktopWidget
  L10_110 = L9_109
  L9_109 = L9_109.askForEventMode
  L11_111 = A0_101
  L12_112 = A0_101
  L13_113 = A1_102
  L14_114 = A2_103
  L15_115 = A3_104
  L16_116 = A4_105
  L17_117 = A5_106
  L18_118 = A6_107
  L9_109 = L9_109(L10_110, L11_111, L12_112, L13_113, L14_114, L15_115, L16_116, L17_117, L18_118, ...)
  return L9_109
end
L0_0.askForCustomizeOption = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_119, A1_120, A2_121, A3_122, A4_123, A5_124, A6_125, A7_126)
  local L8_127, L9_128, L10_129, L11_130, L12_131, L13_132, L14_133, L15_134
  if A1_120 ~= nil then
    L15_134 = A1_120
    L14_133 = A1_120.getQuestId
    L14_133 = L14_133(L15_134)
    L10_129 = L14_133
  end
  if A2_121 ~= nil then
    L15_134 = A2_121
    L14_133 = A2_121.getQuestId
    L14_133 = L14_133(L15_134)
    L11_130 = L14_133
  end
  if A3_122 ~= nil then
    L15_134 = A3_122
    L14_133 = A3_122.getQuestId
    L14_133 = L14_133(L15_134)
    L12_131 = L14_133
  end
  if A4_123 ~= nil then
    L15_134 = A4_123
    L14_133 = A4_123.getQuestId
    L14_133 = L14_133(L15_134)
    L13_132 = L14_133
  end
  L14_133 = nil
  if A6_125 ~= 1 then
    L15_134 = nil
    if L13_132 ~= nil then
      L15_134 = {
        A7_126 + 1,
        A7_126 + 2,
        A7_126 + 3,
        A7_126 + 4,
        1049
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, true, true, A7_126, L15_134, L10_129, L11_130, L12_131, L13_132)
      if L8_127 == 5 then
        L8_127 = -3
      end
    elseif L12_131 ~= nil then
      L15_134 = {
        A7_126 + 1,
        A7_126 + 2,
        A7_126 + 3,
        1049
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, true, true, A7_126, L15_134, L10_129, L11_130, L12_131)
      if L8_127 == 4 then
        L8_127 = -3
      end
    elseif L11_130 ~= nil then
      L15_134 = {
        A7_126 + 1,
        A7_126 + 2,
        1049
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, true, true, A7_126, L15_134, L10_129, L11_130)
      if L8_127 == 3 then
        L8_127 = -3
      end
    elseif L10_129 ~= nil then
      L15_134 = {
        A7_126 + 1,
        1049
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, true, true, A7_126, L15_134, L10_129)
      if L8_127 == 2 then
        L8_127 = -3
      end
    end
    if L8_127 == -2 then
      if A5_124 ~= 1 then
        L9_128 = A5_124 - 1
      else
        L9_128 = A6_125
      end
    elseif L8_127 == -1 then
      if A5_124 == A6_125 then
        L9_128 = 1
      else
        L9_128 = A5_124 + 1
      end
    elseif L8_127 == -3 then
      L9_128 = -1
    else
      L9_128 = 0
    end
  else
    L15_134 = nil
    if L13_132 ~= nil then
      L15_134 = {
        A7_126 + 1,
        A7_126 + 2,
        A7_126 + 3,
        A7_126 + 4,
        1049
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, false, true, A7_126, L15_134, L10_129, L11_130, L12_131, L13_132)
      if L8_127 == 5 then
        L8_127 = -3
      end
    elseif L12_131 ~= nil then
      L15_134 = {
        A7_126 + 1,
        A7_126 + 2,
        A7_126 + 3,
        1049
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, false, true, A7_126, L15_134, L10_129, L11_130, L12_131)
      if L8_127 == 4 then
        L8_127 = -3
      end
    elseif L11_130 ~= nil then
      L15_134 = {
        A7_126 + 1,
        A7_126 + 2,
        1049
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, false, true, A7_126, L15_134, L10_129, L11_130)
      if L8_127 == 3 then
        L8_127 = -3
      end
    elseif L10_129 ~= nil then
      L15_134 = {
        A7_126 + 1
      }
      L8_127 = desktopWidget:askForEventMode(A0_119, A0_119, nil, 1, false, true, A7_126, L15_134, L10_129)
    end
    if L8_127 == -3 then
      L9_128 = -1
    else
      L9_128 = 0
    end
  end
  L15_134 = L9_128
  return L15_134, L8_127
end
L0_0.switchEvent = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_135, A1_136, A2_137, A3_138, A4_139)
  if A4_139 == nil then
    A4_139 = 1
  end
  A0_135:_lookAtPosition(A1_136, A2_137, A3_138, A4_139)
end
L0_0.lookAtPosition = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_140)
  local L1_141
  L1_141 = true
  return L1_141
end
L0_0.isMapMarkerVisibleForTalkable = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_142)
  local L1_143
  L1_143 = 6
  return L1_143
end
L0_0.getMapMarkerTypeForTalkable = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_144, A1_145, A2_146)
  local L3_147, L4_148
  L3_147 = worldMaster
  L4_148 = L3_147
  L3_147 = L3_147._getMyPlayer
  L3_147 = L3_147(L4_148)
  L4_148 = 0
  if L3_147:getGrandCompanyRank(A1_145) == true or L3_147:getGrandCompanyRank(A1_145) == 0 then
    L4_148 = 0
  elseif A2_146 < L3_147:getGrandCompanyRank(A1_145) then
    L4_148 = ({
      84090880,
      84094976,
      84099072
    })[A1_145]
  elseif A2_146 >= L3_147:getGrandCompanyRank(A1_145) then
    L4_148 = ({
      354287616,
      354291712,
      354295808
    })[A1_145]
  end
  if L4_148 ~= 0 then
    A0_144:_runCharaScheduler(L4_148)
  end
  return L4_148
end
L0_0.doSalute = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_149, A1_150, A2_151)
  if A2_151 >= 0 then
    return true
  end
  return false
end
L0_0.isUpperRank = L1_1
L0_0 = NpcBaseClass
function L1_1(A0_152, A1_153)
  local L2_154, L3_155, L4_156, L5_157, L6_158
  L3_155 = A0_152
  L2_154 = A0_152.ask
  L4_156 = worldMaster
  L5_157 = 25015
  L6_158 = 2
  L2_154 = L2_154(L3_155, L4_156, L5_157, L6_158, A1_153:getQuestId())
  return L2_154
end
L0_0.isContentsInAsk = L1_1
