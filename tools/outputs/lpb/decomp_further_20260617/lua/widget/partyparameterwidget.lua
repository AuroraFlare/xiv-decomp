require("/Widget/WidgetBaseClass")
_defineClass("PartyParameterWidget", "WidgetBaseClass")
function PartyParameterWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4
  L4_4 = "nowTargetPartyMemberIndex"
  L4_4 = {
    "myPlayerPartyMemberIndex",
    "integer8"
  }
  L1_1._temp = L2_2
  L4_4 = "UILuaCommands.SelectionChanged"
  L1_1(L2_2, L3_3, L4_4)
  for L4_4 = 1, 15 do
    A0_0:setMemberItemVisibility(L4_4, false)
  end
  L1_1.myPlayerPartyMemberIndex = 1
  L1_1.nowTargetPartyMemberIndex = 0
  L1_1.partyBuffID = 0
  L1_1(L2_2, L3_3)
end
function PartyParameterWidget.processUICommandSelectionChanged(A0_5, A1_6, A2_7, A3_8, A4_9)
  if A3_8 ~= nil then
    desktopWidget:setTargetCharacterForPartyMember(A3_8 + 1)
  end
end
function PartyParameterWidget.updateAll(A0_10, A1_11, A2_12)
  A0_10:updateMemberList(A1_11, A2_12)
end
function PartyParameterWidget.updateHp(A0_13, A1_14)
  A0_13:setParameter(A1_14, 1)
end
function PartyParameterWidget.updateMp(A0_15, A1_16)
  A0_15:setParameter(A1_16, 2)
end
function PartyParameterWidget.updateTp(A0_17, A1_18)
  A0_17:setParameter(A1_18, 3)
end
function PartyParameterWidget.updateStatus(A0_19, A1_20)
  A0_19:setStatus(A1_20)
end
function PartyParameterWidget.updateStackedCombination(A0_21, A1_22)
  A0_21:setStackedCombination(A1_22)
end
function PartyParameterWidget.updateTargetPartyMember(A0_23, A1_24)
  A0_23:setTargetPartyMember(A1_24)
end
function PartyParameterWidget.updatePartyBuff(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30
  L2_27 = A0_25.work
  L2_27 = L2_27.partyBuffID
  if A1_26 ~= nil then
    L3_28 = 1042
    L4_29 = 10151
    L5_30 = 75641
    if A1_26 == 223194 then
      L3_28 = 1043
      L4_29 = 10152
      L5_30 = 75642
    end
    A0_25:setText("TextBlock_PartyTypeText", L3_28)
    A0_25:setIcon("IconControl_PartyType", L4_29)
    A0_25:setPopupHelpPartyType(L5_30)
    A0_25:setVisibility("Grid_PartyType", true)
    A0_25.work.partyBuffID = A1_26
  else
    L4_29 = A0_25
    L3_28 = A0_25.setVisibility
    L5_30 = "Grid_PartyType"
    L3_28(L4_29, L5_30, false)
    L3_28 = desktopWidget
    L4_29 = L3_28
    L3_28 = L3_28.countPartyMember
    L3_28 = L3_28(L4_29)
    if L3_28 < 4 then
      L3_28 = A0_25.work
      L3_28.partyBuffID = 0
    end
  end
  return L2_27
end
function PartyParameterWidget.updateMemberList(A0_31, A1_32, A2_33)
  local L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43
  L3_34 = false
  L4_35 = false
  L5_36 = worldMaster
  L6_37 = L5_36
  L5_36 = L5_36._getMyPlayer
  L5_36 = L5_36(L6_37)
  L7_38 = L5_36
  L6_37 = L5_36.getPlayerParty
  L6_37 = L6_37(L7_38)
  if A2_33 ~= nil then
    L6_37 = A2_33
  end
  L7_38 = L6_37._countMember
  L7_38 = L7_38(L8_39)
  if L7_38 > 1 then
    for L11_42 = 1, L7_38 do
      L12_43 = desktopWidget
      L12_43 = L12_43.isJoinedPartyMember
      L4_35, L12_43 = L12_43, L12_43(L12_43, L11_42)
      L3_34 = L12_43
      L12_43 = desktopWidget
      L12_43 = L12_43.isPartyMemberActorMe
      L12_43 = L12_43(L12_43, L11_42)
      if L12_43 then
        L12_43 = A0_31.setMemberItemVisibility
        L12_43(A0_31, L11_42, false)
        L12_43 = L6_37.isPartyLeader
        L12_43 = L12_43(L6_37, L11_42)
        desktopWidget:setPlayerPartyLeaderMark(L12_43)
        A0_31.work.myPlayerPartyMemberIndex = L11_42
      elseif L3_34 then
        L12_43 = A0_31.setMemberItemVisibility
        L12_43(A0_31, L11_42, true)
      elseif not L4_35 then
        L12_43 = A0_31.setMemberItemVisibility
        L12_43(A0_31, L11_42, false)
      else
        L12_43 = A0_31.setMemberItemVisibility
        L12_43(A0_31, L11_42, true)
      end
    end
  else
    L8_39(L9_40, L10_41)
    L8_39.myPlayerPartyMemberIndex = 1
  end
  for L11_42 = L7_38 + 1, 15 do
    L12_43 = A0_31.setMemberItemVisibility
    L12_43(A0_31, L11_42, false)
  end
end
function PartyParameterWidget.setParameter(A0_44, A1_45, A2_46)
  local L3_47, L4_48, L5_49, L6_50
  L3_47 = desktopWidget
  L4_48 = L3_47
  L3_47 = L3_47.getPartyMemberMaxParameter
  L5_49 = A1_45
  L4_48 = L3_47(L4_48, L5_49)
  L5_49 = desktopWidget
  L6_50 = L5_49
  L5_49 = L5_49.getPartyMemberCurrentParameter
  L6_50 = L5_49(L6_50, A1_45)
  if desktopWidget:getPartyMemberActor(A1_45) == nil then
    A0_44:changeUnknownParameter(A1_45, false)
    return
  end
  if L3_47 == nil or L4_48 == nil or L5_49 == nil or L6_50 == nil or L5_49(L6_50, A1_45) == nil then
    A0_44:changeUnknownParameter(A1_45, false)
    return
  end
  if A2_46 == 1 then
    A0_44:changeUnknownParameter(A1_45, desktopWidget:getPartyMemberActor(A1_45):isPlayer())
    A0_44:setHPMPMaximum(A1_45, 1, L3_47)
    A0_44:setHPMPValue(A1_45, 1, L5_49)
    break
  else
  end
  if A2_46 == 2 then
    A0_44:setHPMPMaximum(A1_45, 2, L4_48)
    A0_44:setHPMPValue(A1_45, 2, L6_50)
    break
  else
  end
  if A2_46 == 3 then
    if L5_49(L6_50, A1_45) >= 1000 then
      A0_44:setTpReadyIcon(A1_45, true)
    else
      A0_44:setTpReadyIcon(A1_45, false)
      break
    end
  else
  end
end
function PartyParameterWidget.setStatus(A0_51, A1_52)
  local L2_53, L3_54, L4_55, L5_56, L6_57, L7_58, L8_59
  L4_55 = desktopWidget
  L4_55 = L4_55.getPartyMemberStatusSlotLength
  L4_55 = L4_55(L5_56, L6_57)
  if L4_55 <= 0 then
    L4_55 = 20
  end
  for L8_59 = 1, L4_55 do
    L2_53, L3_54 = desktopWidget:getPartyMemberBufferStatus(A1_52, L8_59)
    if L2_53 > 0 then
      A0_51:setStatusIcon(A1_52, L8_59, L3_54)
      A0_51:setPopupHelpStatus(A1_52, L8_59, L2_53)
    else
      A0_51:setStatusIcon(A1_52, L8_59, 0)
    end
  end
end
function PartyParameterWidget.setStackedCombination(A0_60, A1_61)
  if desktopWidget:getStackedCombinationCountByPartyMember(A1_61) > 0 then
    A0_60:setCombination(A1_61, true)
  else
    A0_60:setCombination(A1_61, false)
  end
end
function PartyParameterWidget.setLeader(A0_62, A1_63)
  if desktopWidget:isMyPartyLeader(A1_63) then
    A0_62:setLeaderIcon(A1_63, true)
  else
    A0_62:setLeaderIcon(A1_63, false)
  end
end
function PartyParameterWidget.setMemberItemVisibility(A0_64, A1_65, A2_66)
  local L3_67, L4_68, L5_69, L6_70, L7_71, L8_72
  L4_68 = A0_64
  L3_67 = A0_64.getMemberItemName
  L3_67 = L3_67(L4_68, L5_69)
  L4_68 = nil
  if A2_66 == true then
    L8_72 = desktopWidget
    L8_72 = L8_72.getPartyMemberDisplayName
    L8_72 = L8_72(L8_72, A1_65)
    L5_69(L6_70, L7_71, L8_72, L8_72(L8_72, A1_65))
    L8_72 = 1
    L5_69(L6_70, L7_71, L8_72)
    L8_72 = 2
    L5_69(L6_70, L7_71, L8_72)
    L8_72 = 3
    L5_69(L6_70, L7_71, L8_72)
    L5_69(L6_70, L7_71)
    L5_69(L6_70, L7_71)
    L5_69(L6_70, L7_71)
    L8_72 = true
    L5_69(L6_70, L7_71, L8_72)
  else
    L8_72 = false
    L5_69(L6_70, L7_71, L8_72)
    L8_72 = 1
    L5_69(L6_70, L7_71, L8_72, 0)
    L8_72 = 2
    L5_69(L6_70, L7_71, L8_72, 0)
    L8_72 = 1
    L5_69(L6_70, L7_71, L8_72, 0)
    L8_72 = 2
    L5_69(L6_70, L7_71, L8_72, 0)
    L8_72 = nil
    L5_69(L6_70, L7_71, L8_72)
    L8_72 = true
    L5_69(L6_70, L7_71, L8_72)
    L8_72 = false
    L5_69(L6_70, L7_71, L8_72)
    L8_72 = false
    L5_69(L6_70, L7_71, L8_72)
    L8_72 = false
    L5_69(L6_70, L7_71, L8_72)
    for L8_72 = 1, 20 do
      A0_64:setStatusIcon(A1_65, L8_72, 0)
      A0_64:setPopupHelpStatus(A1_65, L8_72, 0)
    end
  end
end
function PartyParameterWidget.setName(A0_73, A1_74, A2_75)
  local L3_76
  L3_76 = A0_73.getCharactorLabelName
  L3_76 = L3_76(A0_73, A1_74)
  if A2_75 == nil or A2_75 == "" then
    A0_73:setText(L3_76, "")
  else
    A0_73:setText(L3_76, 230, A2_75)
  end
end
function PartyParameterWidget.setHPMPValue(A0_77, A1_78, A2_79, A3_80)
  local L4_81
  L4_81 = A0_77.getGaugeName
  L4_81 = L4_81(A0_77, A1_78, A2_79)
  if A2_79 == 1 then
    A0_77:setValue(L4_81, A3_80)
    break
  else
  end
  if A2_79 == 2 then
    A0_77:setValue(L4_81, A3_80)
    break
  else
  end
  do return end
  A0_77:changeHpVisual(A1_78)
end
function PartyParameterWidget.setHPMPMaximum(A0_82, A1_83, A2_84, A3_85)
  local L4_86
  L4_86 = A0_82.getGaugeName
  L4_86 = L4_86(A0_82, A1_83, A2_84)
  if A2_84 == 1 then
    A0_82:setMaximum(L4_86, A3_85)
    break
  else
  end
  if A2_84 == 2 then
    A0_82:setMaximum(L4_86, A3_85)
    break
  else
  end
  return
end
function PartyParameterWidget.setTpReadyIcon(A0_87, A1_88, A2_89)
  local L3_90
  L3_90 = A0_87.getCharactorLabelName
  L3_90 = L3_90(A0_87, A1_88)
  if A2_89 then
    A0_87:setStyle(L3_90, "TBL_tpReady")
  else
    A0_87:setStyle(L3_90, "TBL_null")
  end
end
function PartyParameterWidget.setCombination(A0_91, A1_92, A2_93)
  local L3_94
  L3_94 = A0_91.getBattleCommandStackIconName
  L3_94 = L3_94(A0_91, A1_92)
  if A2_93 then
    A0_91:setVisibility(L3_94, true)
  else
    A0_91:setVisibility(L3_94, false)
  end
end
function PartyParameterWidget.setLeaderIcon(A0_95, A1_96, A2_97)
  local L3_98
  L3_98 = A0_95.getLeaderIconName
  L3_98 = L3_98(A0_95, A1_96)
  if A2_97 then
    A0_95:setVisibility(L3_98, true)
  else
    A0_95:setHidden(L3_98)
  end
end
function PartyParameterWidget.changeUnknownParameter(A0_99, A1_100, A2_101)
  local L3_102, L4_103, L5_104, L6_105
  L4_103 = A0_99
  L3_102 = A0_99.getGaugeLabelName
  L5_104 = A1_100
  L6_105 = 1
  L3_102 = L3_102(L4_103, L5_104, L6_105, true)
  L5_104 = A0_99
  L4_103 = A0_99.getGaugeLabelName
  L6_105 = A1_100
  L4_103 = L4_103(L5_104, L6_105, 2, true)
  L6_105 = A0_99
  L5_104 = A0_99.getGaugeLabelName
  L5_104 = L5_104(L6_105, A1_100, 1, false)
  L6_105 = A0_99.getGaugeLabelName
  L6_105 = L6_105(A0_99, A1_100, 2, false)
  if A2_101 then
    A0_99:_setProperty(nil, L3_102, "Visibility", "Visible")
    A0_99:_setProperty(nil, L4_103, "Visibility", "Visible")
    A0_99:_setProperty(nil, L5_104, "Visibility", "Hidden")
    A0_99:_setProperty(nil, L6_105, "Visibility", "Hidden")
  else
    A0_99:_setProperty(nil, L3_102, "Visibility", "Hidden")
    A0_99:_setProperty(nil, L4_103, "Visibility", "Hidden")
    A0_99:_setProperty(nil, L5_104, "Visibility", "Visible")
    A0_99:_setProperty(nil, L6_105, "Visibility", "Visible")
  end
end
function PartyParameterWidget.changeHpVisual(A0_106, A1_107)
  local L2_108, L3_109
  L3_109 = A0_106
  L2_108 = A0_106.getGaugeName
  L2_108 = L2_108(L3_109, A1_107, 1)
  L3_109 = A0_106.getGaugeLabelName
  L3_109 = L3_109(A0_106, A1_107, 1, true)
  if A0_106:_getProperty(nil, L2_108, "Value") / A0_106:_getProperty(nil, L2_108, "Maximum") == 0 then
    A0_106:_setProperty(nil, L3_109, "SqwtStyle", "TBL_parameterDanger")
    A0_106:_setProperty(nil, L2_108, "SqwtStyle", "PRB_parameter_hpMiddleH")
  elseif A0_106:_getProperty(nil, L2_108, "Value") / A0_106:_getProperty(nil, L2_108, "Maximum") < 0.25 then
    A0_106:_setProperty(nil, L3_109, "SqwtStyle", "TBL_parameterDanger")
    A0_106:_setProperty(nil, L2_108, "SqwtStyle", "PRB_parameter_hpMiddle_signalH")
  elseif A0_106:_getProperty(nil, L2_108, "Value") / A0_106:_getProperty(nil, L2_108, "Maximum") < 0.5 then
    A0_106:_setProperty(nil, L3_109, "SqwtStyle", "TBL_parameterCaution")
    A0_106:_setProperty(nil, L2_108, "SqwtStyle", "PRB_parameter_hpMiddleH")
  else
    A0_106:_setProperty(nil, L3_109, "SqwtStyle", "TBL_parameterNormal")
    A0_106:_setProperty(nil, L2_108, "SqwtStyle", "PRB_parameter_hpMiddleH")
  end
end
function PartyParameterWidget.setStatusIcon(A0_110, A1_111, A2_112, A3_113)
  local L4_114
  L4_114 = A0_110.getStatusIconName
  L4_114 = L4_114(A0_110, A1_111, A2_112)
  if A3_113 > 0 then
    A0_110:_setProperty(nil, L4_114, "IconDatas", A3_113)
    A0_110:_setProperty(nil, L4_114, "Visibility", "Visible")
  else
    A0_110:_setProperty(nil, L4_114, "Visibility", "Collapsed")
    A0_110:_setProperty(nil, L4_114, "IconDatas", 0)
  end
end
function PartyParameterWidget.setTargetPartyMember(A0_115, A1_116)
  local L2_117, L3_118, L4_119
  L2_117 = A1_116
  if A1_116 == nil then
    L2_117 = 0
  end
  if L2_117 > 0 then
    L4_119 = A0_115
    L3_118 = A0_115.getTargetPartyMemberBorderName
    L3_118 = L3_118(L4_119, L2_117)
    L4_119 = A0_115.setVisibility
    L4_119(A0_115, L3_118, true)
    L4_119 = A0_115.sendControlCommand
    L4_119(A0_115, L3_118, "SQWTDesignCommands.TargetEffectOn")
    L4_119 = A0_115.work
    L4_119 = L4_119.nowTargetPartyMemberIndex
    if L4_119 > 0 then
      L4_119 = A0_115.work
      L4_119 = L4_119.nowTargetPartyMemberIndex
      if L2_117 ~= L4_119 then
        L4_119 = A0_115.getTargetPartyMemberBorderName
        L4_119 = L4_119(A0_115, A0_115.work.nowTargetPartyMemberIndex)
        A0_115:setVisibility(L4_119, false)
        A0_115:sendControlCommand(L4_119, "SQWTDesignCommands.TargetEffectOff")
      end
    end
  else
    L3_118 = A0_115.work
    L3_118 = L3_118.nowTargetPartyMemberIndex
    if L3_118 > 0 then
      L4_119 = A0_115
      L3_118 = A0_115.getTargetPartyMemberBorderName
      L3_118 = L3_118(L4_119, A0_115.work.nowTargetPartyMemberIndex)
      L4_119 = A0_115.setVisibility
      L4_119(A0_115, L3_118, false)
      L4_119 = A0_115.sendControlCommand
      L4_119(A0_115, L3_118, "SQWTDesignCommands.TargetEffectOff")
    end
  end
  L3_118 = A0_115.work
  L3_118.nowTargetPartyMemberIndex = L2_117
end
function PartyParameterWidget.setPopupHelpPartyType(A0_120, A1_121)
  A0_120:setHelpParameter("TextBlock_PartyTypeText", 1, A1_121)
end
function PartyParameterWidget.setPopupHelpStatus(A0_122, A1_123, A2_124, A3_125)
  local L4_126
  L4_126 = A0_122.getStatusIconName
  L4_126 = L4_126(A0_122, A1_123, A2_124)
  A0_122:setHelpParameter(L4_126, 1, 74701, A3_125)
end
function PartyParameterWidget.getMemberItemName(A0_127, A1_128)
  return "ListBoxItem_" .. tostring(A1_128)
end
function PartyParameterWidget.getGaugeLabelName(A0_129, A1_130, A2_131, A3_132)
  local L4_133
  L4_133 = A0_129.getMemberItemName
  L4_133 = L4_133(A0_129, A1_130)
  if A2_131 == 1 then
    if A3_132 then
    else
      do break end
      else
      end
      if A2_131 == 2 then
        if A3_132 then
        else
          do break end
          return
        end
      else
      end
    end
  return L4_133 .. ":TextBlock_CurrentMP_Unknown"
end
function PartyParameterWidget.getGaugeName(A0_134, A1_135, A2_136)
  local L3_137
  L3_137 = A0_134.getMemberItemName
  L3_137 = L3_137(A0_134, A1_135)
  if A2_136 == 1 then
    break
  else
  end
  if A2_136 == 2 then
    break
  else
  end
  do return end
  return L3_137 .. ":TemplateProgressBar_MP"
end
function PartyParameterWidget.getCharactorLabelName(A0_138, A1_139)
  return A0_138:getMemberItemName(A1_139) .. ":TextBlock_MemberName"
end
function PartyParameterWidget.getStatusIconName(A0_140, A1_141, A2_142)
  return A0_140:getMemberItemName(A1_141) .. ":IconControl_Buff_" .. tostring(A2_142)
end
function PartyParameterWidget.getTpReadyIconName(A0_143, A1_144)
  return A0_143:getMemberItemName(A1_144) .. ":IconControl_TPDisplay"
end
function PartyParameterWidget.getLeaderIconName(A0_145, A1_146)
  return A0_145:getMemberItemName(A1_146) .. ":IconControl_LeaderIcon"
end
function PartyParameterWidget.getBattleCommandStackIconName(A0_147, A1_148)
  return A0_147:getMemberItemName(A1_148) .. ":IconControl_BattleRegimenDisplay"
end
function PartyParameterWidget.getTargetPartyMemberBorderName(A0_149, A1_150)
  return A0_149:getMemberItemName(A1_150) .. ":Label_TargetingMember"
end
