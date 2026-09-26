local L0_0, L1_1
L0_0 = DesktopWidget
function L1_1(A0_2, A1_3, A2_4, A3_5, A4_6, ...)
  local L6_8, L7_9
  L6_8 = "self"
  L7_9 = "_appendMessagePool_cpp"
  return L6_8, L7_9
end
L0_0._appendMessagePool_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_10, A1_11, A2_12, A3_13, A4_14, ...)
  local L6_16, L7_17
  L6_16 = "self"
  L7_17 = "_appendLogPool_cpp"
  return L6_16, L7_17
end
L0_0._appendLogPool_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_18)
  local L1_19, L2_20
  L1_19 = "self"
  L2_20 = "_clearLogPool_cpp"
  return L1_19, L2_20
end
L0_0._clearLogPool_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_21, A1_22)
  local L2_23, L3_24
  L2_23 = "self"
  L3_24 = "_initTargetCursors_cpp"
  return L2_23, L3_24
end
L0_0._initTargetCursors_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_25, A1_26, A2_27)
  local L3_28, L4_29
  L3_28 = "self"
  L4_29 = "_setTargetCursorImage_cpp"
  return L3_28, L4_29
end
L0_0._setTargetCursorImage_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_30, A1_31, A2_32)
  local L3_33, L4_34
  L3_33 = "self"
  L4_34 = "_setTargetableDistance_cpp"
  return L3_33, L4_34
end
L0_0._setTargetableDistance_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_35)
  local L1_36, L2_37
  L1_36 = "self"
  L2_37 = "_getCurrentTargetCursor_cpp"
  return L1_36, L2_37
end
L0_0._getCurrentTargetCursor_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_38, A1_39)
  local L2_40, L3_41
  L2_40 = "self"
  L3_41 = "_setCurrentTargetCursor_cpp"
  return L2_40, L3_41
end
L0_0._setCurrentTargetCursor_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_42, A1_43)
  local L2_44, L3_45
  L2_44 = "self"
  L3_45 = "_setAllTargetCursorMask_cpp"
  return L2_44, L3_45
end
L0_0._setAllTargetCursorMask_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_46, A1_47)
  local L2_48, L3_49
  L2_48 = "self"
  L3_49 = "_getTargetCharacter_cpp"
  return L2_48, L3_49
end
L0_0._getTargetCharacter_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_50, A1_51, A2_52)
  local L3_53, L4_54
  L3_53 = "self"
  L4_54 = "_setTargetCharacter_cpp"
  return L3_53, L4_54
end
L0_0._setTargetCharacter_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_55, A1_56, A2_57)
  local L3_58, L4_59
  L3_58 = "self"
  L4_59 = "_setTargetCharacterByDisplayName_cpp"
  return L3_58, L4_59
end
L0_0._setTargetCharacterByDisplayName_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_60, A1_61)
  if A0_60.work.targetCursorMask == true then
    return false
  end
  if A0_60:_getCurrentTargetCursor() == 1 and worldMaster:_getMyPlayer():_getLockonTarget() ~= nil then
    return false
  end
  A0_60:_setTargetNearestCharacter_cpp(A1_61)
  return true
end
L0_0._setTargetNearestCharacter = L1_1
L0_0 = DesktopWidget
function L1_1(A0_62, A1_63)
  local L2_64, L3_65
  L2_64 = "self"
  L3_65 = "_getCharacterByDisplayNameForTextCommand_cpp"
  return L2_64, L3_65
end
L0_0._getCharacterByDisplayNameForTextCommand_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_66)
  local L1_67, L2_68
  L1_67 = "self"
  L2_68 = "_getKeyboardFocusedWidget_cpp"
  return L1_67, L2_68
end
L0_0._getKeyboardFocusedWidget_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_69, A1_70)
  local L2_71, L3_72
  L2_71 = "self"
  L3_72 = "_setKeyboardFocusedWidget_cpp"
  return L2_71, L3_72
end
L0_0._setKeyboardFocusedWidget_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_73)
  local L1_74, L2_75
  L1_74 = "self"
  L2_75 = "_lockTargetCursorControl_cpp"
  return L1_74, L2_75
end
L0_0._lockTargetCursorControl_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_76)
  local L1_77, L2_78
  L1_77 = "self"
  L2_78 = "_unlockTargetCursorControl_cpp"
  return L1_77, L2_78
end
L0_0._unlockTargetCursorControl_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_79)
  local L1_80, L2_81
  L1_80 = "self"
  L2_81 = "_isTargetCursorControlEnabled_cpp"
  return L1_80, L2_81
end
L0_0._isTargetCursorControlEnabled_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_82, A1_83)
  local L2_84, L3_85
  L2_84 = "self"
  L3_85 = "_setLockonCursorImage_cpp"
  return L2_84, L3_85
end
L0_0._setLockonCursorImage_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_86, A1_87)
  local L2_88, L3_89
  L2_88 = "self"
  L3_89 = "_parseTextCommand_cpp"
  return L2_88, L3_89
end
L0_0._parseTextCommand_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_90)
  local L1_91, L2_92
  L1_91 = "self"
  L2_92 = "_getLastAttacker_cpp"
  return L1_91, L2_92
end
L0_0._getLastAttacker_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_93, A1_94, A2_95, A3_96)
  local L4_97, L5_98
  L4_97 = "self"
  L5_98 = "_setUserConfig_cpp"
  return L4_97, L5_98
end
L0_0._setUserConfig_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_99, A1_100, A2_101)
  local L3_102, L4_103
  L3_102 = "self"
  L4_103 = "_resetUserConfig_cpp"
  return L3_102, L4_103
end
L0_0._resetUserConfig_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_104, A1_105, A2_106)
  local L3_107, L4_108
  L3_107 = "self"
  L4_108 = "_getUserConfig_cpp"
  return L3_107, L4_108
end
L0_0._getUserConfig_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_109)
  local L1_110, L2_111
  L1_110 = "self"
  L2_111 = "_saveUserConfig_cpp"
  return L1_110, L2_111
end
L0_0._saveUserConfig_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_112, A1_113, A2_114, A3_115)
  local L4_116, L5_117
  L4_116 = "self"
  L5_117 = "_setUserMacroTitle_cpp"
  return L4_116, L5_117
end
L0_0._setUserMacroTitle_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_118, A1_119, A2_120)
  local L3_121, L4_122
  L3_121 = "self"
  L4_122 = "_getUserMacroTitle_cpp"
  return L3_121, L4_122
end
L0_0._getUserMacroTitle_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_123, A1_124, A2_125, A3_126)
  local L4_127, L5_128
  L4_127 = "self"
  L5_128 = "_setUserMacroIcon_cpp"
  return L4_127, L5_128
end
L0_0._setUserMacroIcon_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_129, A1_130, A2_131)
  local L3_132, L4_133
  L3_132 = "self"
  L4_133 = "_getUserMacroIcon_cpp"
  return L3_132, L4_133
end
L0_0._getUserMacroIcon_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_134, A1_135, A2_136, A3_137, A4_138)
  local L5_139, L6_140
  L5_139 = "self"
  L6_140 = "_setUserMacroData_cpp"
  return L5_139, L6_140
end
L0_0._setUserMacroData_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_141, A1_142, A2_143, A3_144)
  local L4_145, L5_146
  L4_145 = "self"
  L5_146 = "_getUserMacroData_cpp"
  return L4_145, L5_146
end
L0_0._getUserMacroData_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_147)
  local L1_148, L2_149
  L1_148 = "self"
  L2_149 = "_saveUserMacro_cpp"
  return L1_148, L2_149
end
L0_0._saveUserMacro_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_150)
  local L1_151, L2_152
  L1_151 = "self"
  L2_152 = "_waitForItemSearchWidget_cpp"
  return L1_151, L2_152
end
L0_0._waitForItemSearchWidget_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_153, A1_154)
  local L2_155, L3_156
  L2_155 = "self"
  L3_156 = "_waitForTargetTutorial_cpp"
  return L2_155, L3_156
end
L0_0._waitForTargetTutorial_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_157)
  local L1_158, L2_159
  L1_158 = "self"
  L2_159 = "_waitForCameraTutorial_cpp"
  return L1_158, L2_159
end
L0_0._waitForCameraTutorial_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_160, A1_161)
  local L2_162, L3_163
  L2_162 = "self"
  L3_163 = "_reserveWidgetContainer_cpp"
  return L2_162, L3_163
end
L0_0._reserveWidgetContainer_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_164)
  local L1_165, L2_166
  L1_165 = "self"
  L2_166 = "_getWidgetContainerSize_cpp"
  return L1_165, L2_166
end
L0_0._getWidgetContainerSize_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_167, A1_168, A2_169, ...)
  local L4_171, L5_172
  L4_171 = "self"
  L5_172 = "_createWidgetInWidgetContainer_cpp"
  return L4_171, L5_172
end
L0_0._createWidgetInWidgetContainer_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_173, A1_174)
  local L2_175, L3_176
  L2_175 = "self"
  L3_176 = "_isExistWidgetInWidgetContainer_cpp"
  return L2_175, L3_176
end
L0_0._isExistWidgetInWidgetContainer_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_177, A1_178)
  local L2_179, L3_180
  L2_179 = "self"
  L3_180 = "_isCreatingWidgetInWidgetContainer_cpp"
  return L2_179, L3_180
end
L0_0._isCreatingWidgetInWidgetContainer_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_181, A1_182)
  local L2_183, L3_184
  L2_183 = "self"
  L3_184 = "_getWidgetFromWidgetContainer_cpp"
  return L2_183, L3_184
end
L0_0._getWidgetFromWidgetContainer_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_185, A1_186)
  local L2_187, L3_188
  L2_187 = "self"
  L3_188 = "_deleteCreatingWidgetInWidgetContainer_cpp"
  return L2_187, L3_188
end
L0_0._deleteCreatingWidgetInWidgetContainer_inl = L1_1
L0_0 = DesktopWidget
function L1_1(A0_189, A1_190)
end
L0_0._hideMainWeapon = L1_1
L0_0 = DesktopWidget
function L1_1(A0_191)
  local L1_192, L2_193
  L1_192 = "self"
  L2_193 = "_sendCountDown_cpp"
  return L1_192, L2_193
end
L0_0._sendCountDown_inl = L1_1
