require("/Chara/CharaBaseClass_parameter")
require("/Chara/CharaBaseClass_event")
require("/Chara/CharaBaseClass_cliprog")
function CharaBaseClass.isPlayer(A0_0)
  local L1_1
  return L1_1
end
function CharaBaseClass.isRestrictedByContents(A0_2, A1_3)
  local L2_4
  L2_4 = false
  for _FORV_7_ = 1, #A0_2:_getAllGroup() do
    if _isInstanceOf(A0_2:_getAllGroup()[_FORV_7_], "ContentGroupBaseClass") and A0_2:_getAllGroup()[_FORV_7_]:isPropertyEnabled(A1_3) then
      L2_4 = true
    end
  end
  return L2_4
end
function CharaBaseClass.getPlayerParty(A0_5)
  return A0_5:_getExtendedTemporaryGroup(10001)
end
function CharaBaseClass.getParty(A0_6)
  local L1_7
  L1_7 = A0_6._getExtendedTemporaryGroup
  L1_7 = L1_7(A0_6, 10001)
  if L1_7 == nil then
    L1_7 = A0_6:_getExtendedTemporaryGroup(10002)
  end
  return L1_7
end
function CharaBaseClass.isPartyLeader(A0_8)
  return A0_8:getPlayerParty():isPartyLeader(A0_8)
end
function CharaBaseClass.getContentGroup(A0_9, A1_10)
  return (A0_9:_getExtendedTemporaryGroup(A1_10))
end
function CharaBaseClass.getMainSkill(A0_11)
  if A0_11:_getEquippingItem(1) == nil then
    return 1
  elseif A0_11:_getEquippingItem(1):getMainSkill() == nil then
    return 1
  else
    return (A0_11:_getEquippingItem(1):getMainSkill())
  end
end
function CharaBaseClass.getDepictionJudge(A0_12)
  return A0_12.charaWork.depictionJudge
end
function CharaBaseClass.getCurrentContentGroup(A0_13)
  if A0_13.charaWork.currentContentGroup == 0 then
    return nil
  end
  return (A0_13:_getExtendedTemporaryGroup(A0_13.charaWork.currentContentGroup))
end
function CharaBaseClass.hasCurrentContent(A0_14)
  local L1_15
  L1_15 = A0_14.charaWork
  L1_15 = L1_15.currentContentGroup
  L1_15 = L1_15 ~= 0
  return L1_15
end
function CharaBaseClass.getRelationGroup(A0_16, A1_17)
  return (A0_16:_getExtendedTemporaryGroup(A1_17))
end
function CharaBaseClass.hasRelationGroup(A0_18, A1_19, A2_20)
  local L3_21, L4_22, L5_23, L6_24, L7_25
  L3_21 = A0_18._getGroup
  L3_21 = L3_21(L4_22, L5_23)
  if A2_20 == nil then
    L4_22 = L3_21 ~= nil
    return L4_22
  elseif L4_22 == "actor" then
    L4_22 = L3_21 ~= nil and L4_22(L5_23, L6_24)
    return L4_22
  else
    if L3_21 == nil then
      return L4_22
    end
    for L7_25 = 1, L5_23(L6_24) do
      if L3_21:_getMemberDisplayName(L7_25) == A2_20 then
        return true
      end
    end
    return L4_22
  end
end
function CharaBaseClass.getRelationGroupFellow(A0_26, A1_27)
  local L2_28, L3_29, L4_30, L5_31, L6_32
  L2_28 = A0_26._getGroup
  L2_28 = L2_28(L3_29, L4_30)
  for L6_32 = 1, L4_30(L5_31) do
    if L2_28:_isExistInAreaMember(L6_32) and L2_28:_getMember(L6_32) ~= A0_26 then
      return L2_28:_getMember(L6_32)
    end
  end
  return L3_29
end
function CharaBaseClass.countRelationGroupMember(A0_33, A1_34)
  if A0_33:_getGroup(A1_34) ~= nil then
    return A0_33:_getGroup(A1_34):_countMember()
  else
    return 0
  end
end
function CharaBaseClass.getReadyCommand(A0_35, A1_36)
  local L2_37
  L2_37 = A0_35.charaWork
  L2_37 = L2_37.command
  L2_37 = L2_37[A1_36]
  if L2_37 ~= nil and L2_37:_isAlive() and L2_37:getCommandId() == 22001 then
    if A0_35:_getActorMainStat() == 15 then
      return nil, nil
    elseif desktopWidget:isTutorialMode() == true then
      return nil, nil
    elseif A0_35:_getCurrentAreaMaster():_isInn() then
      return nil, nil
    end
  end
  return A0_35.charaWork.command[A1_36], A0_35.charaWork.commandCategory[A1_36]
end
function CharaBaseClass.getReadyCommandSlotLength(A0_38)
  if not A0_38:hasGameParameter() then
    return 0
  end
  return A0_38.charaWork.commandBorder
end
function CharaBaseClass.searchReadyCommand(A0_39, A1_40, A2_41)
  local L3_42, L5_43, L6_44, L7_45
  for L7_45 = 1, L5_43.commandBorder do
    if A0_39.charaWork.command[L7_45] ~= nil and A0_39.charaWork.command[L7_45]:getCommandId() == A1_40 and (A2_41 == nil or A0_39.charaWork.commandCategory[L7_45] == A2_41) then
      return A0_39.charaWork.command[L7_45]
    end
  end
  return L3_42
end
function CharaBaseClass.getCommandName(A0_46, A1_47)
  if A1_47:isDesktopCommandMode() == true then
    return "commandJudgeMode"
  end
  if A1_47:getCommandId() == 12017 or A1_47:getCommandId() == 12009 then
    return "commandRequest"
  end
  if _isInstanceOf(A1_47, "GameCommandBaseClass") then
    if A1_47:getPriority() == -1 then
    elseif A1_47:getPriority() == 11 then
    elseif A1_47:getPriority() == 10 then
    else
      if A1_47:getPriority() == 6 then
      else
      end
    end
    if A1_47:isJudgedAtCraftJudge() or A1_47:isJudgedAtHarvestJudge() or A1_47:isJudgedAtNegotiationJudge() then
    end
  elseif _isInstanceOf(A1_47, "SystemCommandBaseClass") then
    if A1_47:getPriority() == -1 then
    else
      if A1_47:getPriority() == 4 then
      else
      end
    end
    if _isInstanceOf(A1_47, "WidgetOpenCommand") then
    end
  else
    if _isInstanceOf(A1_47, "MacroCommand") and _isInstanceOf(A1_47, "ItemCommand") and A1_47:getPriority() == 10 then
  end
  return "commandDefault"
end
function CharaBaseClass.isDeadMode(A0_48)
  return A0_48:_isActorMainStatMode(1)
end
function CharaBaseClass.isSitMode(A0_49)
  return A0_49:_isActorMainStatMode(32)
end
function CharaBaseClass.countCommunityGroup(A0_50, A1_51)
  return #A0_50:_getAllGroup(A1_51)
end
function CharaBaseClass._onInit(A0_52, A1_53, A2_54)
  local L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63
  L3_55 = A0_52.charaWork
  L4_56 = {}
  L3_55._save = L4_56
  L3_55 = A0_52.charaWork
  L4_56 = {L5_57}
  L5_57 = {L6_58, L7_59}
  L6_58 = "gameParameter"
  L7_59 = "boolean"
  L3_55._temp = L4_56
  L4_56 = A0_52
  L3_55 = A0_52.isPlayer
  L3_55 = L3_55(L4_56)
  if L3_55 then
    L4_56 = A0_52
    L3_55 = A0_52.isMyPlayer
    L3_55 = L3_55(L4_56)
  end
  L4_56 = {
    L5_57,
    L6_58,
    L7_59,
    L8_60
  }
  L5_57 = {
    L6_58,
    L7_59,
    L8_60,
    L9_61
  }
  L6_58 = "commandAcquired"
  L7_59 = "array"
  L8_60 = 4096
  L6_58 = {
    L7_59,
    L8_60,
    L9_61,
    L10_62
  }
  L7_59 = "command"
  L8_60 = "array"
  L7_59 = {
    L8_60,
    L9_61,
    L10_62,
    L11_63
  }
  L8_60 = "commandCategory"
  L8_60 = {L9_61, L10_62}
  L5_57 = {
    L6_58,
    L7_59,
    L8_60,
    L9_61,
    L10_62,
    [7] = L11_63(L4_56, 1, L3_55 and 999 or 0)
  }
  L6_58 = {
    L7_59,
    L8_60,
    L9_61,
    L10_62
  }
  L7_59 = "statusShownTime"
  L8_60 = "array"
  L7_59 = {
    L8_60,
    L9_61,
    L10_62
  }
  L8_60 = "parameterSave"
  if L3_55 then
  else
  end
  L8_60 = {
    L9_61,
    L10_62,
    L11_63
  }
  if L3_55 then
  else
  end
  ;({
    L6_58,
    L7_59,
    L8_60,
    L9_61,
    L10_62,
    [7] = L11_63(L4_56, 1, L3_55 and 999 or 0)
  })[6] = L11_63
  if A2_54 then
    L6_58 = _table
    L6_58 = L6_58.insert
    L7_59 = L5_57
    L8_60 = {
      L9_61,
      L10_62,
      L11_63
    }
    if L3_55 then
    else
    end
    L6_58(L7_59, L8_60)
    L6_58 = _table
    L6_58 = L6_58.insert
    L7_59 = L5_57
    L8_60 = {
      L9_61,
      L10_62,
      L11_63
    }
    if L3_55 then
    else
    end
    L6_58(L7_59, L8_60)
  end
  L6_58 = A0_52.charaWork
  L7_59 = {
    L8_60,
    L9_61,
    L10_62,
    L11_63,
    unpack(L5_57, 1, A1_53 and 999 or 0)
  }
  L8_60 = {
    L9_61,
    L10_62,
    L11_63,
    "boolean"
  }
  L6_58._sync = L7_59
  L6_58, L7_59 = nil, nil
  if A1_53 then
    L8_60 = nil
    L6_58, L7_59 = A0_52:initCommonParameterSync()
    L8_60 = A0_52:initCommonParameterSync()
    if L3_55 then
      for _FORV_15_ = 1, #L9_61 do
        _table.insert(L8_60, L9_61[_FORV_15_])
      end
      for _FORV_15_ = 1, #L11_63 do
        _table.insert(L10_62, L11_63[_FORV_15_])
      end
    end
    _FOR_.parameterSave._nesting = L8_60
    A0_52.charaWork.parameterTemp._nesting = L10_62
  else
    L8_60 = {}
    L6_58 = L8_60
    L8_60 = {}
    L7_59 = L8_60
  end
  if A2_54 then
    L8_60 = A0_52.initBattleSync
    L8_60 = L8_60(L9_61)
    if L3_55 then
      for _FORV_17_ = 1, #L9_61 do
        _table.insert(L8_60, L9_61[_FORV_17_])
      end
      for _FORV_17_ = 1, #L11_63 do
        _table.insert(L10_62, L11_63[_FORV_17_])
      end
    end
    _FOR_.battleSave._nesting = L8_60
    A0_52.charaWork.battleTemp._nesting = L10_62
    for _FORV_17_ = 1, #L8_60(L9_61) do
      _table.insert(L6_58, L8_60(L9_61)[_FORV_17_])
    end
    for _FORV_17_ = 1, #L8_60(L9_61) do
      _table.insert(L7_59, L8_60(L9_61)[_FORV_17_])
    end
  end
  if A1_53 then
    L8_60 = A0_52.initEventSyncWork
    L8_60 = L8_60(L9_61)
    if L3_55 then
      for _FORV_17_ = 1, #L9_61 do
        _table.insert(L8_60, L9_61[_FORV_17_])
      end
      for _FORV_17_ = 1, #L11_63 do
        _table.insert(L10_62, L11_63[_FORV_17_])
      end
    end
    _FOR_.eventSave._nesting = L8_60
    A0_52.charaWork.eventTemp._nesting = L10_62
    for _FORV_17_ = 1, #L8_60(L9_61) do
      _table.insert(L6_58, L8_60(L9_61)[_FORV_17_])
    end
    for _FORV_17_ = 1, #L8_60(L9_61) do
      _table.insert(L7_59, L8_60(L9_61)[_FORV_17_])
    end
  end
  L8_60 = L6_58
  if L3_55 then
    for _FORV_12_ = 1, #L7_59 do
      _table.insert(L8_60, L7_59[_FORV_12_])
    end
    L9_61(L10_62, L11_63)
    L9_61(L10_62, L11_63)
    L9_61(L10_62, L11_63)
    L9_61(L10_62, L11_63)
    L9_61(L10_62, L11_63)
  end
  if A1_53 then
    L9_61(L10_62, L11_63)
  end
  L9_61(L10_62, L11_63)
  L9_61._tag = L8_60
  L9_61.gameParameter = A1_53
  L9_61(L10_62, L11_63, worldMaster, 10101)
  L9_61(L10_62, L11_63)
  if A1_53 then
    L9_61(L10_62, L11_63, "charaWork", "parameterSave", "hp")
    L9_61(L10_62, L11_63, "charaWork", "parameterSave", "hpMax")
    L9_61(L10_62, L11_63, "charaWork", "parameterSave", "state_mainSkillLevel")
    L9_61(L10_62, L11_63, "charaWork", "eventTemp", "bazaarRetail")
    L9_61(L10_62, L11_63, "charaWork", "eventTemp", "bazaarRepair")
  end
  if A2_54 and not L3_55 then
    L9_61(L10_62, L11_63, "charaWork", "battleSave", "potencial")
  end
  L9_61(L10_62, L11_63, "charaWork", "property")
end
function CharaBaseClass._onUpdateDisplayName(A0_64, A1_65, A2_66)
  A0_64:_setNameplate(1, worldMaster, 10101)
end
function CharaBaseClass._onUpdateWork(A0_67, A1_68, A2_69, A3_70, A4_71)
  local L5_72, L6_73
  do break end
  do return end
  L5_72 = worldMaster
  L6_73 = L5_72
  L5_72 = L5_72._getMyPlayer
  L5_72 = L5_72(L6_73)
  L6_73 = L5_72
  L5_72 = L5_72.getDepictionJudge
  L5_72 = L5_72(L6_73)
  L6_73 = L5_72
  L5_72 = L5_72.judgeNameplate
  L5_72(L6_73, A0_67)
  if A2_69 == "_init" or A1_68 == "charaWork" and A2_69 == "property" then
    L6_73 = A0_67
    L5_72 = A0_67.isPropertyEnabled
    L5_72 = L5_72(L6_73, 1)
    L6_73 = A0_67.isPropertyEnabled
    L6_73 = L6_73(A0_67, 5)
    A0_67:_setNameplateVisible(L5_72 and L6_73)
  end
  if A2_69 == "_init" then
    L6_73 = A0_67
    L5_72 = A0_67.processUpdateInitWork
    L5_72(L6_73, A1_68)
    return
  end
  if A1_68 == "charaWork" and A2_69 == "commandAcquired" then
    L6_73 = A0_67
    L5_72 = A0_67.processUpdateCommandAcquired
    L5_72(L6_73, A3_70, A4_71)
    return
  end
  L5_72 = desktopWidget
  L6_73 = L5_72
  L5_72 = L5_72.processCharacterParameterUpdated
  L5_72(L6_73, A0_67, A1_68, A2_69, A3_70, A4_71)
end
function CharaBaseClass.processUpdateInitWork(A0_74, A1_75)
end
function CharaBaseClass._onUpdateGroupCurrent(A0_76, A1_77, A2_78)
  local L3_79
  do break end
  do return end
  L3_79 = A0_76._getGroup
  L3_79 = L3_79(A0_76, A1_77)
  if L3_79 ~= nil and _isInstanceOf(L3_79, "CommunityGroupBaseClass") and A0_76 == worldMaster:_getMyPlayer() then
    desktopWidget:processUpdateCommunityGroupCurrent(A0_76, A1_77, A2_78)
  end
end
function CharaBaseClass.updateGameParameters(A0_80, A1_81)
  if worldMaster:_getMyPlayer():canRequestInformation() then
    A0_80:_updateWork("charaWork", A1_81)
    worldMaster:_getMyPlayer():recordRequestInformation()
    return true
  else
    return false
  end
end
function CharaBaseClass.updateItemPackage(A0_82, A1_83)
  if worldMaster:_getMyPlayer():canRequestInformation() then
    A0_82:_updateItemPackage(A1_83)
    worldMaster:_getMyPlayer():recordRequestInformation()
    return true
  else
    return false
  end
end
function CharaBaseClass._onUpdateItemPackage(A0_84, A1_85, A2_86)
  do break end
  do return end
  desktopWidget:processUpdateItemInformation(A0_84, A1_85, A2_86)
end
function CharaBaseClass._onUpdateTradingItem(A0_87, A1_88)
  do break end
  do return end
  desktopWidget:processUpdateTradingItem(A0_87, A1_88)
end
function CharaBaseClass._onReceiveDataPacket(A0_89, A1_90, ...)
  local L3_92, L4_93, L5_94
  if A1_90 == "data" then
    L4_93 = A0_89
    L3_92 = A0_89.processReceiveData
    L5_94 = ...
    L3_92(L4_93, L5_94)
  end
end
function CharaBaseClass.processReceiveData(A0_95, ...)
end
function CharaBaseClass._onChangeActorMainStat(A0_97, A1_98, A2_99)
  do break end
  do return end
  worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A0_97)
  if A0_97 == worldMaster:_getMyPlayer() and (A1_98 == 15 or A2_99 == 15) then
    desktopWidget:processUpdateChocoboStatus()
  end
  desktopWidget:processCharacterActorMainStatUpdated(A0_97, A1_98, A2_99)
end
function CharaBaseClass._onChangeSubStatMode(A0_100, ...)
end
function CharaBaseClass._onChangeSubStatStatus(A0_102, A1_103, A2_104, A3_105)
  desktopWidget:processChangeSubStatStatus(A0_102, A1_103, A2_104, A3_105)
end
function CharaBaseClass._onChangeNetStatSystem(A0_106, A1_107, A2_108, A3_109)
  do break end
  do return end
  worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A0_106)
  desktopWidget:processCharacterActorNetStatSystemUpdated(A0_106, A1_107, A2_108, A3_109)
end
function CharaBaseClass._onChangeNetStatUser(A0_110, A1_111, A2_112, A3_113)
  do break end
  do return end
  worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A0_110)
  desktopWidget:processCharacterActorNetStatUserUpdated(A0_110, A1_111, A2_112, A3_113)
end
function CharaBaseClass._onChangeSystemFlag(A0_114, A1_115, A2_116, A3_117)
  do break end
  do return end
  worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A0_114)
end
function CharaBaseClass._onChangeJob(A0_118, A1_119, A2_120)
  do break end
  do return end
  if A0_118:isMyPlayer() then
  end
end
function CharaBaseClass._onChangeAccessibleInServer(A0_121, A1_122, A2_123)
  do break end
  do return end
  worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A0_121)
end
function CharaBaseClass.updateCommandAcquired(A0_124, A1_125, A2_126)
  A1_125 = A1_125 - 26000
  A2_126 = A2_126 - 26000
  if worldMaster:_getMyPlayer():canRequestInformation() then
    A0_124:_updateWork("charaWork", "commandAcquired", A1_125, A2_126)
    worldMaster:_getMyPlayer():recordRequestInformation()
    return true
  else
    return false
  end
end
function CharaBaseClass.processUpdateCommandAcquired(A0_127, A1_128, A2_129)
  desktopWidget:processUpdateCommandAcquired(A1_128 + 26000, A2_129 + 26000)
end
function CharaBaseClass.getStatus(A0_130, A1_131)
  return A0_130:_getSubStatStatus(A1_131)
end
function CharaBaseClass.getStatusSlotLength(A0_132)
  if not A0_132:hasGameParameter() then
    return 0
  end
  return #A0_132.charaWork.statusShownTime
end
function CharaBaseClass.getStatusTime(A0_133, A1_134)
  local L2_135, L3_136, L4_137, L5_138, L6_139
  for L6_139 = 1, #L4_137 do
    if A0_133:_getSubStatStatus(L6_139) ~= nil and A0_133:_getSubStatStatus(L6_139) == A1_134 then
      L2_135 = L6_139
    end
  end
  return L3_136
end
function CharaBaseClass.getCommunityGroup(A0_140, A1_141, A2_142)
  return A0_140:_getAllExtendedTemporaryGroup(A1_141)[A2_142]
end
function CharaBaseClass.hasItem(A0_143, A1_144, A2_145, A3_146)
  local L4_147, L5_148, L6_149, L7_150, L8_151, L9_152, L10_153
  if A3_146 == nil then
    A3_146 = 1
  end
  L5_148 = A0_143
  L4_147 = A0_143._getItemPackageCapacity
  L6_149 = A1_144
  L4_147 = L4_147(L5_148, L6_149)
  L6_149 = A0_143
  L5_148 = A0_143._getItemPackageFreeSpace
  L5_148 = L5_148(L6_149, L7_150)
  L6_149 = L4_147 - L5_148
  for L10_153 = 1, L6_149 do
    if A0_143:checkSameItemInPackage(A1_144, L10_153, A2_145, A3_146) == true then
      return true
    end
  end
  return L7_150
end
function CharaBaseClass.checkSameItemInPackage(A0_154, A1_155, A2_156, A3_157, A4_158)
  if A0_154:_getItem(A1_155, A2_156) ~= nil then
    if A0_154:_getItem(A1_155, A2_156):_getCatalogID() == A3_157 and A4_158 <= A0_154:_getItem(A1_155, A2_156):_countStack() then
      return true
    end
  end
  return false
end
function CharaBaseClass.getItemPackageItemCount(A0_159, A1_160)
  return A0_159:_getItemPackageCapacity(A1_160) - A0_159:_getItemPackageFreeSpace(A1_160)
end
