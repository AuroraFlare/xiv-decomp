require("/Chara/Player/PlayerBaseClass_craft")
require("/Chara/Player/PlayerBaseClass_harvest")
require("/Chara/Player/PlayerBaseClass_negotiation")
require("/Chara/Player/PlayerBaseClass_cliprog")
function PlayerBaseClass.isPlayer(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function PlayerBaseClass.isValidName(A0_2, A1_3)
  if A1_3 == nil or #A1_3 > 31 then
    return false
  end
  return true
end
function PlayerBaseClass.getTribe(A0_4)
  return A0_4.playerWork.tribe
end
function PlayerBaseClass.getNation(A0_5)
  return tribeSheet:_getData(A0_5.playerWork.tribe, 1)
end
function PlayerBaseClass.getGuardian(A0_6)
  return A0_6.playerWork.guardian
end
function PlayerBaseClass.getBirthday(A0_7)
  return A0_7.playerWork.birthdayMonth, A0_7.playerWork.birthdayDay
end
function PlayerBaseClass.getInitialTown(A0_8)
  return A0_8.playerWork.initialTown
end
function PlayerBaseClass.isEventPlaying(A0_9)
  return A0_9:_isEventPlaying("talkDefault") or A0_9:_isEventPlaying("emoteDefault1") or A0_9:_isEventPlaying("emoteDefault2") or A0_9:_isEventPlaying("emoteDefault3") or A0_9:_isEventPlaying("emoteDefault4") or A0_9:_isEventPlaying("emoteDefault5") or A0_9:_isEventPlaying("emoteDefault6") or A0_9:_isEventPlaying("emoteDefault7") or A0_9:_isEventPlaying("emoteDefault8") or A0_9:_isEventPlaying("pushDefault") or A0_9:_isEventPlaying("pushCommand") or A0_9:_isEventPlaying("noticeEvent")
end
function PlayerBaseClass.hasNpcLinkshell(A0_10, A1_11)
  local L2_12
  L2_12 = A0_10.playerWork
  L2_12 = L2_12.npcLinkshellChatCalling
  L2_12 = L2_12[A1_11]
  if not L2_12 then
    L2_12 = A0_10.playerWork
    L2_12 = L2_12.npcLinkshellChatExtra
    L2_12 = L2_12[A1_11]
  end
  return L2_12
end
function PlayerBaseClass.isNpcLinkshellChatCalling(A0_13, A1_14)
  local L2_15, L3_16, L4_17, L5_18, L6_19, L7_20
  if A1_14 ~= nil then
    L3_16 = A0_13
    L2_15 = A0_13.hasNpcLinkshell
    L2_15 = L2_15(L3_16, L4_17)
    if not L2_15 then
      L2_15 = false
      L3_16 = false
      return L2_15, L3_16
    end
    L2_15 = A0_13.playerWork
    L2_15 = L2_15.npcLinkshellChatCalling
    L2_15 = L2_15[A1_14]
    L3_16 = A0_13.playerWork
    L3_16 = L3_16.npcLinkshellChatCalling
    L3_16 = L3_16[A1_14]
    if L3_16 then
      L3_16 = A0_13.playerWork
      L3_16 = L3_16.npcLinkshellChatExtra
      L3_16 = L3_16[A1_14]
    end
    return L2_15, L3_16
  else
    L2_15 = false
    L3_16 = false
    for L7_20 = 1, #L5_18 do
      if A0_13:hasNpcLinkshell(L7_20) and A0_13.playerWork.npcLinkshellChatCalling[L7_20] then
        L2_15 = true
        if A0_13.playerWork.npcLinkshellChatExtra[L7_20] then
          L3_16 = true
        end
      end
    end
    return L4_17, L5_18
  end
end
function PlayerBaseClass.getNpcLinkshellChatLinkshellLength(A0_21)
  local L1_22
  L1_22 = A0_21.playerWork
  L1_22 = L1_22.npcLinkshellChatCalling
  L1_22 = #L1_22
  return L1_22
end
function PlayerBaseClass.isPrebelongGrandCompany(A0_23, A1_24)
  if A0_23:_getGrandCompanyRank(A1_24) == 127 then
    return true
  end
  return false
end
function PlayerBaseClass.getGrandCompanyRank(A0_25, A1_26)
  local L2_27
  L2_27 = A0_25._getGrandCompanyRank
  L2_27 = L2_27(A0_25, A1_26)
  if L2_27 == 127 then
    return 0, true
  elseif L2_27 <= 0 or L2_27 > 100 then
    return 0, false
  end
  return L2_27, false
end
function PlayerBaseClass.getGrandCompanyRankLinear(A0_28, A1_29)
  local L2_30, L3_31, L4_32
  L3_31 = A0_28
  L2_30 = A0_28._getGrandCompanyRank
  L4_32 = A1_29
  L2_30 = L2_30(L3_31, L4_32)
  if L2_30 == 127 then
    L3_31 = 0
    L4_32 = true
    return L3_31, L4_32
  elseif L2_30 <= 0 or L2_30 > 100 then
    L3_31 = 0
    L4_32 = false
    return L3_31, L4_32
  end
  L3_31 = gcRankSheet
  L4_32 = L3_31
  L3_31 = L3_31._loadKeyTemporarily
  L3_31(L4_32, L2_30, L2_30)
  L3_31 = gcRankSheet
  L4_32 = L3_31
  L3_31 = L3_31._getData
  L3_31 = L3_31(L4_32, L2_30, 0)
  L4_32 = L3_31
  return L4_32, false
end
function PlayerBaseClass.getGrandCompanySealMax(A0_33, A1_34)
  local L2_35
  L2_35 = A0_33._getGrandCompanyRank
  L2_35 = L2_35(A0_33, A1_34)
  gcRankSheet:_loadKeyTemporarily(L2_35, L2_35)
  return (gcRankSheet:_getData(L2_35, 1))
end
function PlayerBaseClass.getGrandCompanyNeedSealNextRank(A0_36, A1_37)
  local L2_38
  L2_38 = A0_36._getGrandCompanyRank
  L2_38 = L2_38(A0_36, A1_37)
  gcRankSheet:_loadKeyTemporarily(L2_38, L2_38)
  return (gcRankSheet:_getData(L2_38, 2))
end
function PlayerBaseClass.setQuestContentsCommandPermitFlag(A0_39, A1_40)
  A0_39.playerWork.isContentsCommand = A1_40
end
function PlayerBaseClass.getQuestContentsCommandPermitFlag(A0_41)
  return A0_41.playerWork.isContentsCommand
end
function PlayerBaseClass._onInit(A0_42, A1_43)
  A0_42:_callSuperClassFunc("_onInit", true, true)
  A0_42.playerWork._save = {
    {
      "_assignForChild",
      16
    }
  }
  A0_42.playerWork._temp = {
    {
      "variableCommandPlaceDriven",
      "array",
      4,
      "integer16"
    },
    {
      "variableCommandPlaceDrivenSub",
      "array",
      4,
      "integer32"
    },
    {
      "variableCommandPlaceDrivenTarget",
      "array",
      4,
      "actor"
    },
    {
      "variableCommandPlaceDrivenPriority",
      "array",
      4,
      "integer8"
    },
    {
      "variableCommandContent",
      "integer32"
    },
    {
      "variableCommandContentSub",
      "integer32"
    },
    {
      "variableCommandEmoteSit",
      "integer32"
    },
    {
      "commandBurstBlocker",
      "timer",
      false
    },
    {
      "requestBurstBlocker",
      "integer32"
    },
    {
      "widgetCommandBurstBlocker",
      "integer32"
    },
    {
      "_assignForChild",
      512
    }
  }
  if A0_42:isMyPlayer() then
    A0_42.playerWork._sync = {
      {"tribe", "integer8"},
      {"guardian", "integer8"},
      {
        "birthdayMonth",
        "integer8"
      },
      {
        "birthdayDay",
        "integer8"
      },
      {
        "initialTown",
        "integer8"
      },
      {
        "questScenario",
        "array",
        16,
        "actor"
      },
      {
        "questScenarioComplete",
        "array",
        2048,
        "boolean"
      },
      {
        "questGuildleve",
        "array",
        8,
        "actor"
      },
      {
        "questGuildleveComplete",
        "array",
        2048,
        "boolean"
      },
      {
        "variableCommandConfirmWarp",
        "integer32"
      },
      {
        "variableCommandConfirmWarpSender",
        "string",
        32
      },
      {
        "variableCommandConfirmWarpSenderByID",
        "integer32"
      },
      {
        "variableCommandConfirmWarpSenderSex",
        "integer8"
      },
      {
        "variableCommandConfirmWarpPlace",
        "integer32"
      },
      {
        "variableCommandConfirmRaise",
        "integer32"
      },
      {
        "variableCommandConfirmRaiseSender",
        "string",
        32
      },
      {
        "variableCommandConfirmRaiseSenderByID",
        "integer32"
      },
      {
        "variableCommandConfirmRaiseSenderSex",
        "integer8"
      },
      {
        "npcLinkshellChatCalling",
        "array",
        64,
        "boolean"
      },
      {
        "npcLinkshellChatExtra",
        "array",
        64,
        "boolean"
      },
      {
        "isContentsCommand",
        "boolean"
      },
      {
        "castEndClient",
        "integer32"
      },
      {
        "castCommandClient",
        "integer32"
      },
      {
        "comboNextCommandId",
        "array",
        2,
        "integer32"
      },
      {
        "comboCostBonusRate",
        "float"
      },
      {
        "isRemainBonusPoint",
        "boolean"
      },
      {
        "restBonusExpRate",
        "float"
      },
      {
        "_assignForChild",
        128
      }
    }
  else
    A0_42.playerWork._sync = {
      {
        "_assignForChild",
        128
      }
    }
  end
  A0_42.playerWork._tag = {
    {
      "profile",
      60,
      A0_42,
      {"tribe"},
      {"guardian"},
      {
        "birthdayMonth"
      },
      {
        "birthdayDay"
      },
      {
        "initialTown"
      }
    },
    {
      "confirmWarpCommand",
      1,
      A0_42,
      {
        "variableCommandConfirmWarp"
      },
      {
        "variableCommandConfirmWarpSender"
      },
      {
        "variableCommandConfirmWarpSenderByID"
      },
      {
        "variableCommandConfirmWarpSenderSex"
      },
      {
        "variableCommandConfirmWarpPlace"
      }
    },
    {
      "confirmRaiseCommand",
      1,
      A0_42,
      {
        "variableCommandConfirmRaise"
      },
      {
        "variableCommandConfirmRaiseSender"
      },
      {
        "variableCommandConfirmRaiseSenderByID"
      },
      {
        "variableCommandConfirmRaiseSenderSex"
      }
    },
    {
      "journal",
      1,
      A0_42,
      {
        "questScenario"
      },
      {
        "questGuildleve"
      }
    },
    {
      "npcLinkshellChat",
      1,
      A0_42,
      {
        "npcLinkshellChatCalling"
      },
      {
        "npcLinkshellChatExtra"
      }
    },
    {
      "questCompleteS",
      {
        "questScenarioComplete",
        "."
      }
    },
    {
      "questCompleteG",
      {
        "questGuildleveComplete",
        "."
      }
    },
    {
      "isContentsCommand",
      1,
      A0_42,
      {
        "isContentsCommand"
      }
    },
    {
      "combo",
      1,
      A0_42,
      {
        "comboNextCommandId"
      },
      {
        "comboCostBonusRate"
      }
    },
    {
      "consoleTray",
      1,
      A0_42,
      {
        "isRemainBonusPoint"
      }
    },
    {
      "expBonus",
      1,
      A0_42,
      {
        "restBonusExpRate"
      }
    },
    {
      "castState",
      1,
      A0_42,
      {
        "castEndClient"
      },
      {
        "castCommandClient"
      }
    }
  }
  if A0_42:isMyPlayer() then
    A0_42:_setTouchAttribute(1, true)
    A0_42:_setTouchAttribute(1, false)
    A0_42:_setTouchAttribute(2, true)
    A0_42:_setTouchAttribute(2, false)
    A0_42:_setTouchAttribute(5, true)
    A0_42:_setTouchAttribute(5, false)
    A0_42:_bindWork(1001, "charaWork", "parameterSave", "state_mainSkill")
    A0_42:_bindWork(1002, "charaWork", "parameterSave", "constanceCommandSlot_commandId")
    A0_42:_bindWork(1003, "charaWork", "parameterSave", "giftCommandSlot_commandId")
    A0_42:_bindWork(1004, "charaWork", "parameterSave", "abilityCostPoint_used")
    A0_42:_bindWork(1005, "charaWork", "parameterSave", "abilityCostPoint_max")
    A0_42:_bindWork(1006, "charaWork", "parameterSave", "constanceCostPoint_used")
    A0_42:_bindWork(1007, "charaWork", "parameterSave", "constanceCostPoint_max")
    A0_42:_bindWork(1008, "charaWork", "parameterSave", "giftCostPoint_used")
    A0_42:_bindWork(1009, "charaWork", "parameterSave", "giftCostPoint_max")
    A0_42:_bindWork(2001, "charaWork", "battleSave", "skillLevel")
    A0_42:_bindWork(3001, "charaWork", "commandAcquired")
    A0_42:_bindWork(3002, "charaWork", "command")
    A0_42:_bindWork(3003, "charaWork", "commandCategory")
    A0_42:_bindWork(3004, "charaWork", "commandBorder")
    A0_42:_bindWork(100001, "playerWork", "variableCommandConfirmRaise")
    A0_42:_bindWork(100002, "playerWork", "variableCommandConfirmWarp")
    A0_42:_bindWork(100003, "playerWork", "variableCommandContent")
    A0_42:_bindWork(100004, "playerWork", "variableCommandPlaceDriven")
    A0_42:_bindWork(100005, "playerWork", "variableCommandEmoteSit")
    A0_42:_bindWork(100007, "playerWork", "initialTown")
  end
end
function PlayerBaseClass.getRestBonusExpRate(A0_44)
  return A0_44.playerWork.restBonusExpRate
end
function PlayerBaseClass.isAcquiredAdditionalCommand(A0_45, A1_46)
  local L2_47
  L2_47 = A0_45.charaWork
  L2_47 = L2_47.additionalCommandAcquired
  L2_47 = L2_47[A1_46]
  return L2_47
end
function PlayerBaseClass.getGiftCountInformation(A0_48)
  local L1_49, L2_50
  L1_49 = A0_48.charaWork
  L1_49 = L1_49.parameterTemp
  L1_49 = L1_49.giftCount
  L1_49 = L1_49[1]
  L2_50 = A0_48.charaWork
  L2_50 = L2_50.parameterTemp
  L2_50 = L2_50.giftCount
  L2_50 = L2_50[2]
  return L1_49, L2_50
end
function PlayerBaseClass.getOtherClassAbilityCountInformation(A0_51)
  local L1_52, L2_53
  L1_52 = A0_51.charaWork
  L1_52 = L1_52.parameterTemp
  L1_52 = L1_52.otherClassAbilityCount
  L1_52 = L1_52[1]
  L2_53 = A0_51.charaWork
  L2_53 = L2_53.parameterTemp
  L2_53 = L2_53.otherClassAbilityCount
  L2_53 = L2_53[2]
  return L1_52, L2_53
end
function PlayerBaseClass.isRemainBonusPoint(A0_54)
  return A0_54.playerWork.isRemainBonusPoint
end
function PlayerBaseClass.getComboInformation(A0_55)
  local L1_56, L2_57
  L1_56 = A0_55.playerWork
  L1_56 = L1_56.comboNextCommandId
  L1_56 = L1_56[1]
  L2_57 = A0_55.playerWork
  L2_57 = L2_57.comboNextCommandId
  L2_57 = L2_57[2]
  return L1_56, L2_57, A0_55.playerWork.comboCostBonusRate
end
function PlayerBaseClass.isMyPlayer(A0_58)
  return worldMaster:_getMyPlayer() == A0_58
end
function PlayerBaseClass.isMale(A0_59)
  if A0_59:isMyPlayer() == true then
    return tribeSheet:_getData(A0_59.playerWork.tribe, 2) == 0
  elseif A0_59:_getDisplayName() == 0 then
    return true
  else
    return false
  end
end
function PlayerBaseClass.isFemale(A0_60)
  if A0_60:isMyPlayer() == true then
    return tribeSheet:_getData(A0_60.playerWork.tribe, 2) == 1
  elseif A0_60:_getDisplayName() == 1 then
    return true
  else
    return false
  end
end
function PlayerBaseClass.canRequestInformation(A0_61)
  local L1_62
  L1_62 = A0_61.playerWork
  L1_62 = L1_62.requestBurstBlocker
  L1_62 = L1_62 < worldMaster:_getServerTime()
  return L1_62
end
function PlayerBaseClass.recordRequestInformation(A0_63)
  if worldMaster:_getServerTime() <= A0_63.playerWork.requestBurstBlocker + 1 then
    A0_63.playerWork.requestBurstBlocker = worldMaster:_getServerTime() + 3
  else
    A0_63.playerWork.requestBurstBlocker = worldMaster:_getServerTime()
  end
end
function PlayerBaseClass._onUpdateWork(A0_64, A1_65, A2_66, A3_67, A4_68)
  if A1_65 == "playerWork" then
    if A2_66 == "confirmWarpCommand" then
      desktopWidget:processUpdateConfirmWarpCommandVariation()
    elseif A2_66 == "confirmRaiseCommand" then
      desktopWidget:processUpdateConfirmRaiseCommandVariation()
    elseif A2_66 == "npcLinkshellChat" then
      desktopWidget:processUpdateNpcLinkshellChat()
    elseif A2_66 == "questCompleteS" or A2_66 == "questCompleteG" then
      A0_64:processUpdateQuestComplete(A2_66, A3_67, A4_68)
    elseif A2_66 == "combo" then
      desktopWidget:processUpdateComboInformation()
    elseif A2_66 == "consoleTray" then
      desktopWidget:processUpdateConsoleTray()
    elseif A2_66 == "expBonus" then
      desktopWidget:processUpdateExpBonus(A0_64.playerWork.restBonusExpRate)
    else
      A0_64:_callSuperClassFunc("_onUpdateWork", A1_65, A2_66, A3_67, A4_68)
    end
  else
    if A1_65 == "charaWork" then
      if A2_66 == "command" then
        if A0_64:searchReadyCommand(22004) ~= nil and A0_64:searchReadyCommand(22004):canFire(A0_64, nil, nil, nil, nil, nil, nil, nil, nil, nil) and A0_64:_isTouching(1) and A0_64:_getCurrentAreaMaster():isInstanceRaid() == false then
          A0_64:setPlaceDrivenCommandVariation(30003, nil, A0_64, 5)
        else
          A0_64:resetPlaceDrivenCommandVariation(30003, nil, A0_64, 5)
        end
      elseif A2_66 == "timingCommand" then
        desktopWidget:processUpdateTimingCommandInformation()
      end
    end
    A0_64:_callSuperClassFunc("_onUpdateWork", A1_65, A2_66, A3_67, A4_68)
  end
end
function PlayerBaseClass._onReceiveDataPacket(A0_69, A1_70, ...)
  local L3_72, L4_73, L5_74
  L4_73 = A0_69
  L3_72 = A0_69._callSuperClassFunc
  L5_74 = "_onReceiveDataPacket"
  L3_72(L4_73, L5_74, A1_70, ...)
  if A1_70 == "requestedData" then
    L4_73 = ...
    L5_74 = desktopWidget
    L5_74 = L5_74.processRecievedRequestedDataForWidget
    L5_74(L5_74, L3_72, L4_73, select(3, ...))
  elseif A1_70 == "attention" then
    L5_74 = ...
    desktopWidget:processUpdatePublicInformationDialog(L3_72, L4_73, L5_74, select(4, ...))
  else
    L3_72 = type
    L4_73 = A1_70
    L3_72 = L3_72(L4_73)
    if L3_72 == "number" then
      L5_74 = ...
      desktopWidget:processUpdateGeneralNotificationDialog(A1_70, L3_72, L4_73, L5_74, select(4, ...))
    end
  end
end
function PlayerBaseClass._onReceiveTimingPacket(A0_75, A1_76, A2_77, A3_78)
  desktopWidget:showGauge(A0_75, A2_77, A1_76, A3_78)
end
function PlayerBaseClass._onTouch(A0_79, A1_80, A2_81)
  local L3_82, L4_83
  L4_83 = A0_79
  L3_82 = A0_79._getCurrentAreaMaster
  L3_82 = L3_82(L4_83)
  L4_83 = L3_82
  L3_82 = L3_82.isInstanceRaid
  L3_82 = L3_82(L4_83)
  if L3_82 then
    if A1_80 == 5 then
      L3_82 = _getStaticActor
      L4_83 = 24301
      L3_82 = L3_82(L4_83)
      L4_83 = A0_79.getCommandName
      L4_83 = L4_83(A0_79, L3_82)
      if A2_81 then
        A0_79:_executeCommand(L4_83, L3_82, 30004, 5, 1)
      else
        A0_79:_executeCommand(L4_83, L3_82, 30004, 5, 2)
      end
    end
    return
  end
  if A1_80 == 1 then
    if A2_81 then
      L4_83 = A0_79
      L3_82 = A0_79.searchReadyCommand
      L3_82 = L3_82(L4_83, 22004)
      if L3_82 ~= nil then
        L4_83 = L3_82.canFire
        L4_83 = L4_83(L3_82, A0_79, nil, nil, nil, nil, nil, nil, nil, nil, nil)
        if L4_83 then
          L4_83 = A0_79.setPlaceDrivenCommandVariation
          L4_83(A0_79, 30003, nil, A0_79, 5)
        end
      end
    else
      L4_83 = A0_79
      L3_82 = A0_79.resetPlaceDrivenCommandVariation
      L3_82(L4_83, 30003, nil, A0_79, 5)
    end
  elseif A1_80 == 2 then
    if A2_81 then
      L4_83 = A0_79
      L3_82 = A0_79.setEmoteSitCommandVariation
      L3_82(L4_83, 10002)
    else
      L4_83 = A0_79
      L3_82 = A0_79.setEmoteSitCommandVariation
      L3_82(L4_83, nil)
    end
  end
end
function PlayerBaseClass.getScenarioQuest(A0_84, A1_85)
  local L2_86
  L2_86 = A0_84.playerWork
  L2_86 = L2_86.questScenario
  L2_86 = L2_86[A1_85]
  return L2_86
end
function PlayerBaseClass.getScenarioQuestLength(A0_87)
  local L1_88
  L1_88 = A0_87.playerWork
  L1_88 = L1_88.questScenario
  L1_88 = #L1_88
  return L1_88
end
function PlayerBaseClass.getGuildleveQuest(A0_89, A1_90)
  local L2_91
  L2_91 = A0_89.playerWork
  L2_91 = L2_91.questGuildleve
  L2_91 = L2_91[A1_90]
  return L2_91
end
function PlayerBaseClass.getGuildleveQuestLength(A0_92)
  local L1_93
  L1_93 = A0_92.playerWork
  L1_93 = L1_93.questGuildleve
  L1_93 = #L1_93
  return L1_93
end
function PlayerBaseClass.updateQuestComplete(A0_94, A1_95, A2_96)
  local L3_97
  L3_97 = type
  L3_97 = L3_97(A1_95)
  if L3_97 == "actor" then
    L3_97 = A1_95.getQuestId
    L3_97 = L3_97(A1_95)
    A1_95 = L3_97
  end
  L3_97 = type
  L3_97 = L3_97(A2_96)
  if L3_97 == "actor" then
    L3_97 = A2_96.getQuestId
    L3_97 = L3_97(A2_96)
    A2_96 = L3_97
  end
  L3_97 = nil
  if A1_95 >= 110001 and A2_96 >= 110001 and A1_95 <= 110001 + #A0_94.playerWork.questScenarioComplete - 1 and A2_96 <= 110001 + #A0_94.playerWork.questScenarioComplete - 1 then
    L3_97 = "questCompleteS"
    A1_95 = 1 + A1_95 - 110001
    A2_96 = 1 + A2_96 - 110001
  else
    if A1_95 >= 120001 and A2_96 >= 120001 and A1_95 <= 120001 + #A0_94.playerWork.questGuildleveComplete - 1 and A2_96 <= 120001 + #A0_94.playerWork.questGuildleveComplete - 1 then
      L3_97 = "questCompleteG"
      A1_95 = 1 + A1_95 - 120001
      A2_96 = 1 + A2_96 - 120001
    else
    end
  end
  if A0_94:canRequestInformation() then
    A0_94:_updateWork("playerWork", L3_97, A1_95, A2_96)
    A0_94:recordRequestInformation()
    return true
  else
    return false
  end
end
function PlayerBaseClass.processUpdateQuestComplete(A0_98, A1_99, A2_100, A3_101)
  if A1_99 == "questCompleteS" then
    desktopWidget:processUpdateQuestComplete(A2_100 + 110001 - 1, A3_101 + 110001 - 1)
  elseif A1_99 == "questCompleteG" then
    desktopWidget:processUpdateQuestComplete(A2_100 + 120001 - 1, A3_101 + 120001 - 1)
  end
end
function PlayerBaseClass.isQuestComplete(A0_102, A1_103)
  if type(A1_103) == "actor" then
    A1_103 = A1_103:getQuestId()
  end
  if A1_103 >= 110001 and A1_103 <= 110001 + #A0_102.playerWork.questScenarioComplete - 1 then
    return A0_102.playerWork.questScenarioComplete[1 + A1_103 - 110001]
  else
    if A1_103 >= 120001 and A1_103 <= 120001 + #A0_102.playerWork.questGuildleveComplete - 1 then
      return A0_102.playerWork.questGuildleveComplete[1 + A1_103 - 120001]
    else
    end
  end
end
function PlayerBaseClass.getSystemCommand(A0_104, A1_105)
  if not _getStaticActor(A1_105):isEnabled() then
    return nil
  end
  return (_getStaticActor(A1_105))
end
function PlayerBaseClass._onCommandEvent(A0_106, A1_107, A2_108, ...)
  local L4_110, L5_111, L6_112, L7_113
  L5_111 = A2_108
  L4_110 = A2_108.getCommandId
  L4_110 = L4_110(L5_111)
  if L4_110 == 24105 then
    L6_112 = A2_108
    L5_111 = A2_108.fire
    L7_113 = A0_106
    L5_111 = L5_111(L6_112, L7_113, ...)
    if L5_111 then
      return
    end
  end
  L6_112 = A0_106
  L5_111 = A0_106._callServerOnCommand
  L7_113 = A1_107
  L5_111(L6_112, L7_113, A2_108, ...)
  if L4_110 == 12014 then
    L5_111 = _getStaticActor
    L6_112 = 320013
    L5_111 = L5_111(L6_112)
    L7_113 = L5_111
    L6_112 = L5_111.isRiding
    L6_112 = L6_112(L7_113, A0_106)
    if L6_112 then
      L7_113 = A0_106
      L6_112 = A0_106._isPushingOut
      L6_112 = L6_112(L7_113)
      if L6_112 then
        L6_112 = worldMaster
        L7_113 = L6_112
        L6_112 = L6_112.notify
        L6_112(L7_113, worldMaster, L5_111:getRidingErrorTextId(A0_106, 26005))
        L6_112 = _getStaticActor
        L7_113 = 12015
        L6_112 = L6_112(L7_113)
        L7_113 = A0_106.getCommandName
        L7_113 = L7_113(A0_106, L6_112)
        A0_106:_executeCommand(L7_113, L6_112)
      end
    end
  end
end
function PlayerBaseClass._onCommandRequest(A0_114, A1_115, A2_116, ...)
  local L6_118, L7_119, L8_120, L9_121, L10_122
  L7_119 = A2_116
  L6_118 = A2_116.command
  L8_120 = A0_114
  L10_122 = ...
  L6_118 = L6_118(L7_119, L8_120, L9_121, L10_122, ...)
  if not L6_118 then
    L8_120 = A2_116
    L7_119 = A2_116.fire
    L9_121 = A0_114
    L10_122 = ...
    L7_119 = L7_119(L8_120, L9_121, L10_122, ...)
    if not L7_119 then
      L9_121 = A0_114
      L8_120 = A0_114._doServerOnCommand
      L10_122 = A1_115
      L8_120(L9_121, L10_122, A2_116, ...)
    end
  end
end
function PlayerBaseClass.command(A0_123, A1_124, A2_125, A3_126, A4_127, A5_128, A6_129, A7_130, A8_131, A9_132, A10_133)
  local L11_134, L12_135, L13_136, L14_137
  L11_134 = 0
  L12_135 = 0
  L13_136 = type
  L14_137 = A2_125
  L13_136 = L13_136(L14_137)
  if L13_136 == "string" then
    L11_134 = #A2_125
  end
  L13_136 = type
  L14_137 = A3_126
  L13_136 = L13_136(L14_137)
  if L13_136 == "string" then
    L12_135 = #A3_126
  end
  L13_136 = L11_134 + L12_135
  if L13_136 > 50 then
    return
  end
  L14_137 = A0_123
  L13_136 = A0_123.canCommand
  L13_136 = L13_136(L14_137, A1_124, A2_125, A3_126, A4_127, A5_128, A6_129, A7_130, A8_131, A9_132, A10_133)
  if L13_136 == true then
    L14_137 = A0_123.getCommandName
    L14_137 = L14_137(A0_123, A1_124)
    L13_136 = A0_123:_executeCommand(L14_137, A1_124, A2_125, A3_126, A4_127, A5_128, A6_129, A7_130, A8_131, A9_132, A10_133)
    if L14_137 == "commandRequest" then
      A0_123:recordRequestInformation()
    end
    A0_123.playerWork.commandBurstBlocker = 1
  end
  return L13_136
end
function PlayerBaseClass.canCommand(A0_138, A1_139, A2_140, A3_141, A4_142, A5_143, A6_144, A7_145, A8_146, A9_147, A10_148)
  local L11_149
  if A1_139 ~= nil then
    L11_149 = A1_139.getCommandId
    L11_149 = L11_149(A1_139)
    if L11_149 == 12017 or L11_149 == 12009 then
    elseif A0_138.playerWork.commandBurstBlocker ~= nil then
      return false
    end
  end
  L11_149 = A0_138.getCommandName
  L11_149 = L11_149(A0_138, A1_139)
  if L11_149 ~= "commandRequest" and not A0_138:_canExecuteCommand(L11_149) then
    return false
  end
  return (A1_139:canFire(A0_138, A2_140, A3_141, A4_142, A5_143, A6_144, A7_145, A8_146, A9_147, A10_148))
end
function PlayerBaseClass._onCommandCancel(A0_150, A1_151, A2_152)
  do break end
  do return end
  if A1_151 == "commandForced" or A1_151 == "commandDefault" or A1_151 == "commandWeak" or A1_151 == "commandContent" or A1_151 == "commandJudgeMode" then
    desktopWidget:closeAllEventModeWidget()
  end
  if A1_151 == "widgetCreate" or A1_151 == "macroRequest" then
    A0_150:processCancelCommandAboutWidget(A1_151)
  end
end
function PlayerBaseClass._onCommandRejected(A0_153, A1_154)
  if A1_154 == "widgetCreate" or A1_154 == "macroRequest" then
    A0_153:processCancelCommandAboutWidget(A1_154)
  end
end
function PlayerBaseClass._onPreEvent(A0_155, A1_156, A2_157)
  A0_155:_lockPlayerControl()
  A0_155:_lockLockonControl()
  desktopWidget:_lockTargetCursorControl()
  desktopWidget:orderDesktopWidgetMode(16)
end
function PlayerBaseClass._onPostEvent(A0_158, A1_159, A2_160, A3_161)
  desktopWidget:cancelDesktopWidgetMode(16)
  desktopWidget:closeAllEventModeWidget()
  desktopWidget:_unlockTargetCursorControl()
  A0_158:_unlockLockonControl()
  A0_158:_unlockPlayerControl()
end
function PlayerBaseClass._onPreCommand(A0_162, A1_163)
  if A1_163 == "commandJudgeMode" or A1_163 == "commandContent" then
    A0_162:_lockPlayerControl()
    A0_162:_lockLockonControl()
    desktopWidget:_lockTargetCursorControl()
    desktopWidget:orderDesktopWidgetMode(32)
  end
end
function PlayerBaseClass._onPostCommand(A0_164, A1_165, A2_166)
  if A1_165 == "commandJudgeMode" or A1_165 == "commandContent" then
    desktopWidget:cancelDesktopWidgetMode(32)
    desktopWidget:closeAllEventModeWidget()
    desktopWidget:_unlockTargetCursorControl()
    A0_164:_unlockLockonControl()
    A0_164:_unlockPlayerControl()
  end
end
function PlayerBaseClass.delegateCommand(A0_167, A1_168, A2_169, ...)
  local L4_171, L5_172, L6_173, L7_174, L8_175
  L5_172 = A1_168
  L4_171 = A1_168._callFunction
  L6_173 = A2_169
  L7_174 = A0_167
  L8_175 = ...
  return L4_171(L5_172, L6_173, L7_174, L8_175)
end
function PlayerBaseClass._onChocoboRentalRide(A0_176, A1_177, A2_178, A3_179)
  if A1_177 - worldMaster:_getServerTime() > 0 then
    if A2_178 then
      worldMaster:notify(worldMaster, 26007, A3_179)
    end
    if A3_179 == 0 then
      desktopWidget:processRentalChocobo(A1_177)
    else
      desktopWidget:processRentalChocobo(A3_179 * 60 + worldMaster:_getServerTime())
    end
  end
end
function PlayerBaseClass._onChocoboWarpRide(A0_180, A1_181)
  desktopWidget:openPublicInformDialogWidget(worldMaster, 25248, 2001007, 1)
  worldMaster:notify(worldMaster, 25248, 2001007, 1)
end
function PlayerBaseClass._onGetGoobbue(A0_182)
  desktopWidget:processUpdateChocoboStatus()
end
function PlayerBaseClass.setPlaceDrivenCommandVariation(A0_183, A1_184, A2_185, A3_186, A4_187)
  local L5_188
  if A2_185 == nil then
    A2_185 = 0
  end
  for _FORV_8_ = 1, #A0_183.playerWork.variableCommandPlaceDriven do
    if A0_183.playerWork.variableCommandPlaceDriven[_FORV_8_] == A1_184 and A0_183.playerWork.variableCommandPlaceDrivenSub[_FORV_8_] == A2_185 and A0_183.playerWork.variableCommandPlaceDrivenTarget[_FORV_8_] == A3_186 and A0_183.playerWork.variableCommandPlaceDrivenPriority[_FORV_8_] == A4_187 then
      return
    end
  end
  for _FORV_9_ = 1, #A0_183.playerWork.variableCommandPlaceDriven do
    if A0_183.playerWork.variableCommandPlaceDriven[_FORV_9_] == 0 then
      break
    end
    if A4_187 >= A0_183.playerWork.variableCommandPlaceDrivenPriority[_FORV_9_] then
      break
    end
  end
  if L5_188 == nil then
    return
  end
  for _FORV_9_ = #A0_183.playerWork.variableCommandPlaceDriven, L5_188 + 1, -1 do
    A0_183.playerWork.variableCommandPlaceDriven[_FORV_9_] = A0_183.playerWork.variableCommandPlaceDriven[_FORV_9_ - 1]
    A0_183.playerWork.variableCommandPlaceDrivenSub[_FORV_9_] = A0_183.playerWork.variableCommandPlaceDrivenSub[_FORV_9_ - 1]
    A0_183.playerWork.variableCommandPlaceDrivenTarget[_FORV_9_] = A0_183.playerWork.variableCommandPlaceDrivenTarget[_FORV_9_ - 1]
    A0_183.playerWork.variableCommandPlaceDrivenPriority[_FORV_9_] = A0_183.playerWork.variableCommandPlaceDrivenPriority[_FORV_9_ - 1]
  end
  _FOR_.variableCommandPlaceDriven[L5_188] = A1_184
  A0_183.playerWork.variableCommandPlaceDrivenSub[L5_188] = A2_185
  A0_183.playerWork.variableCommandPlaceDrivenTarget[L5_188] = A3_186
  A0_183.playerWork.variableCommandPlaceDrivenPriority[L5_188] = A4_187
  desktopWidget:processUpdatePlaceDrivenCommandVariation()
end
function PlayerBaseClass.resetPlaceDrivenCommandVariation(A0_189, A1_190, A2_191, A3_192, A4_193)
  local L5_194, L6_195
  if A2_191 == nil then
    A2_191 = 0
  end
  L5_194 = nil
  for _FORV_9_ = 1, #A0_189.playerWork.variableCommandPlaceDriven do
    if A0_189.playerWork.variableCommandPlaceDriven[_FORV_9_] == A1_190 and A0_189.playerWork.variableCommandPlaceDrivenSub[_FORV_9_] == A2_191 and A0_189.playerWork.variableCommandPlaceDrivenTarget[_FORV_9_] == A3_192 and A0_189.playerWork.variableCommandPlaceDrivenPriority[_FORV_9_] == A4_193 then
      L5_194 = _FORV_9_
      break
    end
  end
  if L5_194 == nil then
    return
  end
  for _FORV_9_ = L5_194, #A0_189.playerWork.variableCommandPlaceDriven - 1 do
    A0_189.playerWork.variableCommandPlaceDriven[_FORV_9_] = A0_189.playerWork.variableCommandPlaceDriven[_FORV_9_ + 1]
    A0_189.playerWork.variableCommandPlaceDrivenSub[_FORV_9_] = A0_189.playerWork.variableCommandPlaceDrivenSub[_FORV_9_ + 1]
    A0_189.playerWork.variableCommandPlaceDrivenTarget[_FORV_9_] = A0_189.playerWork.variableCommandPlaceDrivenTarget[_FORV_9_ + 1]
    A0_189.playerWork.variableCommandPlaceDrivenPriority[_FORV_9_] = A0_189.playerWork.variableCommandPlaceDrivenPriority[_FORV_9_ + 1]
  end
  A0_189.playerWork.variableCommandPlaceDriven[L6_195] = 0
  A0_189.playerWork.variableCommandPlaceDrivenSub[L6_195] = 0
  A0_189.playerWork.variableCommandPlaceDrivenTarget[L6_195] = nil
  A0_189.playerWork.variableCommandPlaceDrivenPriority[L6_195] = 0
  desktopWidget:processUpdatePlaceDrivenCommandVariation()
end
function PlayerBaseClass.setContentCommandVariation(A0_196, A1_197, A2_198)
  if A1_197 == nil then
    A1_197 = 0
  end
  if A2_198 == nil then
    A2_198 = 0
  end
  A0_196.playerWork.variableCommandContent = A1_197
  A0_196.playerWork.variableCommandContentSub = A2_198
  desktopWidget:processUpdateContentCommandVariation()
end
function PlayerBaseClass.setEmoteSitCommandVariation(A0_199, A1_200)
  if A1_200 == nil then
    A1_200 = 0
  end
  A0_199.playerWork.variableCommandEmoteSit = A1_200
  desktopWidget:processUpdateEmoteSitCommandVariation()
end
function PlayerBaseClass.commandAboutDebug(A0_201, A1_202, ...)
  local L3_204, L4_205, L5_206, L6_207, L7_208, L8_209
  L3_204 = _getUTF8StringByteLength
  L3_204 = L3_204(L4_205)
  L3_204 = 24 + L3_204
  L3_204 = L3_204 + 1
  L8_209 = ...
  for L7_208 = 1, L5_206(L6_207, L7_208, L8_209, ...) do
    L3_204 = L3_204 + 1
    L8_209 = _isInstanceOf
    L8_209 = L8_209(select(L7_208, ...), "ActorBaseClass")
    if L8_209 then
      L3_204 = L3_204 + 8
    else
      L8_209 = type
      L8_209 = L8_209(select(L7_208, ...))
      if L8_209 == "string" then
        L8_209 = select
        L8_209 = L8_209(L7_208, ...)
        L3_204 = L3_204 + _getUTF8StringByteLength(L8_209)
      else
        L8_209 = select
        L8_209 = L8_209(L7_208, ...)
        if L8_209 == nil then
          L3_204 = L3_204 + 4
        else
        end
      end
    end
  end
  if L3_204 >= 116 then
    L4_205(L5_206, L6_207)
    return L4_205
  end
  L7_208 = _getStaticActor
  L8_209 = 30101
  L7_208 = L7_208(L8_209)
  L8_209 = A1_202
  L4_205(L5_206, L6_207, L7_208, L8_209, ...)
  return L4_205
end
function PlayerBaseClass.commandAboutWidget(A0_210, A1_211, A2_212, ...)
  local L4_214, L5_215, L6_216
  L4_214 = worldMaster
  L5_215 = L4_214
  L4_214 = L4_214._getServerTime
  L4_214 = L4_214(L5_215)
  L5_215 = A0_210.playerWork
  L5_215 = L5_215.widgetCommandBurstBlocker
  if L5_215 ~= 0 and L4_214 < L5_215 and not A2_212 then
    L6_216 = false
    return L6_216
  end
  L6_216 = A0_210.getCommandName
  L6_216 = L6_216(A0_210, A1_211)
  if not A2_212 then
    if A0_210:_isCommandPlaying(L6_216) then
      return false
    end
  else
    A0_210:_cancelCommand(L6_216)
  end
  A0_210.playerWork.widgetCommandBurstBlocker = L4_214
  if A2_212 then
    A0_210:recordRequestInformation()
  end
  return (A0_210:_executeCommand(L6_216, A1_211, ...))
end
function PlayerBaseClass.isCommandAboutWidgetPlaying(A0_217, A1_218)
  local L2_219
  L2_219 = A0_217.getCommandName
  L2_219 = L2_219(A0_217, A1_218)
  return A0_217:_isCommandPlaying(L2_219, A1_218)
end
function PlayerBaseClass.cancelCommandAboutWidget(A0_220, A1_221)
  local L2_222
  if A1_221 == nil then
    L2_222 = A0_220._isCommandPlaying
    L2_222 = L2_222(A0_220, "widgetCreate")
    if L2_222 then
      L2_222 = A0_220._cancelCommand
      L2_222(A0_220, "widgetCreate")
    end
    L2_222 = A0_220._isCommandPlaying
    L2_222 = L2_222(A0_220, "macroRequest")
    if L2_222 then
      L2_222 = A0_220._cancelCommand
      L2_222(A0_220, "macroRequest")
    end
  else
    L2_222 = A0_220.getCommandName
    L2_222 = L2_222(A0_220, A1_221)
    if A0_220:_isCommandPlaying(L2_222) then
      A0_220:_cancelCommand(L2_222)
    end
  end
end
function PlayerBaseClass.processCancelCommandAboutWidget(A0_223, A1_224)
  if A1_224 == "widgetCreate" then
    desktopWidget:processWidgetCreateAborted()
  end
end
function PlayerBaseClass.postMapOpen(A0_225)
  for _FORV_5_ = 1, #A0_225:_getAllGroup() do
    if _isInstanceOf(A0_225:_getAllGroup()[_FORV_5_], "ContentGroupBaseClass") and A0_225:_getAllGroup()[_FORV_5_]:getDirector() ~= nil then
      A0_225:_getAllGroup()[_FORV_5_]:getDirector():processMapOpenMessage()
    end
  end
end
function PlayerBaseClass._onReceiveLimitAddicted(A0_226, A1_227)
  if A1_227 == 1 then
    desktopWidget:_appendLogPool(worldMaster, 68, worldMaster, 25252, 1)
    desktopWidget:openWarningInformDialogWidget(worldMaster, 25252, 1)
  elseif A1_227 == 2 then
    desktopWidget:_appendLogPool(worldMaster, 68, worldMaster, 25252, 2)
    desktopWidget:openWarningInformDialogWidget(worldMaster, 25252, 2)
  elseif A1_227 == 3 then
    desktopWidget:_appendLogPool(worldMaster, 68, worldMaster, 25253)
    desktopWidget:openWarningInformDialogWidget(worldMaster, 25253)
  elseif A1_227 == 4 then
    desktopWidget:_appendLogPool(worldMaster, 68, worldMaster, 25254)
    desktopWidget:openWarningInformDialogWidget(worldMaster, 25254)
  elseif A1_227 == 5 then
    desktopWidget:_appendLogPool(worldMaster, 68, worldMaster, 25255)
    desktopWidget:openWarningInformDialogWidget(worldMaster, 25255)
  end
end
function PlayerBaseClass.getWarpRecastTime(A0_228)
  return _math.max(0, A0_228:_getWarpRecastTime() - worldMaster:_getServerTime())
end
function PlayerBaseClass.getCastCommand(A0_229)
  return A0_229.playerWork.castCommandClient
end
function PlayerBaseClass.getCastEndTime(A0_230)
  return A0_230.playerWork.castEndClient
end
function PlayerBaseClass.getGrandCompanySealCount(A0_231, A1_232)
  local L2_233, L3_234, L4_235, L5_236, L6_237, L7_238, L8_239
  L2_233 = 1000201
  L3_234 = A1_232
  if L3_234 == 1 then
    L2_233 = 1000201
    break
  else
  end
  if L3_234 == 2 then
    L2_233 = 1000202
    break
  else
  end
  if L3_234 == 3 then
    L2_233 = 1000203
    do break end
    break
  else
  end
  L4_235 = A0_231
  L3_234 = A0_231._hasItemPackage
  L3_234 = L3_234(L4_235, L5_236)
  if L3_234 == true then
    L4_235 = A0_231
    L3_234 = A0_231._getItemPackageCapacity
    L3_234 = L3_234(L4_235, L5_236)
    if L3_234 > 0 then
      L4_235 = nil
      for L8_239 = 1, L3_234 do
        if A0_231:checkSameItemCatalogId(L2_233, 100, L8_239) == true then
          return A0_231:_getItem(100, L8_239):_countStack()
        end
      end
    end
  end
  L3_234 = 0
  return L3_234
end
function PlayerBaseClass.checkSameItemCatalogId(A0_240, A1_241, A2_242, A3_243)
  if A0_240:_getItem(A2_242, A3_243) ~= nil and A0_240:_getItem(A2_242, A3_243):_getCatalogID() == A1_241 then
    return true
  end
  return false
end
function PlayerBaseClass.decodeTimingPacketInformation(A0_244, A1_245)
  local L2_246, L3_247
  if A1_245 < 0 then
    A1_245 = A1_245 + 65536
  end
  L2_246 = _math
  L2_246 = L2_246.modf
  L3_247 = A1_245 / 10000
  L2_246 = L2_246(L3_247)
  L3_247 = _math
  L3_247 = L3_247.abs
  L3_247 = L3_247(A1_245 - L2_246 * 10000)
  return L2_246, L3_247
end
function PlayerBaseClass._onReceiveAchievementId(A0_248, A1_249, A2_250)
  desktopWidget:showAchievementPopup(A1_249, A2_250)
end
function PlayerBaseClass._onReceiveAchievementRate(A0_251, A1_252, A2_253, A3_254)
  desktopWidget:processReceiveAchievementRate(A1_252, A2_253, A3_254)
end
function PlayerBaseClass._onMoveAtSit(A0_255)
  return desktopWidget:executePlayerSystemCommand(24312, nil, 1)
end
function PlayerBaseClass._onLoginEvent(A0_256, A1_257, A2_258, A3_259)
  local L4_260
  L4_260 = A0_256.getSystemCommand
  L4_260 = L4_260(A0_256, 24105)
  return A0_256:command(L4_260, A1_257, A2_258, nil, nil, A3_259)
end
