require("/Chara/Npc/NpcBaseClass_event")
require("/Chara/Npc/NpcBaseClass_battle")
function NpcBaseClass.isPlayer(A0_0)
  local L1_1
  L1_1 = false
  return L1_1
end
function NpcBaseClass.isRetainer(A0_2)
  local L1_3
  L1_3 = false
  return L1_3
end
function NpcBaseClass.getSaveNpcId(A0_4)
  local L1_5
  L1_5 = 0
  return L1_5
end
function NpcBaseClass.getActorClassId(A0_6)
  return A0_6.npcWork.actorClassId
end
function NpcBaseClass.getMonsterParty(A0_7)
  return A0_7:_getExtendedTemporaryGroup(10002)
end
function NpcBaseClass.getTempWork(A0_8, A1_9)
  return A0_8.work[A1_9]
end
function NpcBaseClass.getSaveWork(A0_10, A1_11)
  return A0_10.work[A1_11]
end
function NpcBaseClass.setTempWork(A0_12, A1_13, A2_14)
  A0_12.work[A1_13] = A2_14
end
function NpcBaseClass.setSaveWork(A0_15, A1_16, A2_17)
  A0_15.work[A1_16] = A2_17
end
function NpcBaseClass.getPushCommandVariation(A0_18)
  return A0_18.npcWork.pushCommand, A0_18.npcWork.pushCommandSub, A0_18.npcWork.pushCommandPriority
end
function NpcBaseClass._onInit(A0_19, A1_20, A2_21, A3_22, ...)
  local L5_24
  L5_24 = A0_19._callSuperClassFunc
  L5_24(A0_19, "_onInit", A2_21, A3_22)
  L5_24 = A0_19.npcWork
  L5_24._save = {}
  L5_24 = A0_19.npcWork
  L5_24._temp = {
    {
      "actorClassId",
      "integer32"
    },
    {
      "eventCommon",
      "nesting",
      8
    },
    {
      "battleCommon",
      "nesting",
      8
    },
    {
      "_assignForChild",
      64
    }
  }
  L5_24 = A0_19.npcWork
  L5_24._sync = {
    {
      "pushCommand",
      "integer16"
    },
    {
      "pushCommandSub",
      "integer32"
    },
    {
      "pushCommandPriority",
      "integer8"
    },
    {"hateType", "integer8"},
    {
      "_assignForChild",
      16
    }
  }
  L5_24 = A0_19.npcWork
  L5_24._tag = {
    {
      "pushCommand",
      1,
      {
        "pushCommand"
      },
      {
        "pushCommandSub"
      },
      {
        "pushCommandPriority"
      }
    },
    {
      "hate",
      1,
      {"hateType"}
    }
  }
  L5_24 = A0_19.npcWork
  L5_24.actorClassId = A1_20
  L5_24 = A0_19._bindWork
  L5_24(A0_19, 5001, "npcWork", "actorClassId")
  L5_24 = 1
  if select(L5_24, ...) > 0 then
    A0_19:initForBattleCommon(A1_20, select(L5_24 + 1, ...))
  end
  L5_24 = L5_24 + 1 + select(L5_24, ...)
  if select(L5_24, ...) > 0 then
    A0_19:initForEventCommon(A1_20, select(L5_24 + 1, ...))
  end
  L5_24 = L5_24 + 1 + select(L5_24, ...)
  A0_19:initForBattle(select(L5_24, ...))
  A0_19:initForEvent(select(L5_24, ...))
end
function NpcBaseClass._onTimer(A0_25, A1_26, A2_27, ...)
  A0_25:_callSuperClassFunc("_onTimer", A1_26, A2_27, ...)
  if A1_26 == "npcWork" then
  elseif A1_26 == "work" or A1_26 == "retainerWork" then
    A0_25:processTimer(A2_27)
  end
end
function NpcBaseClass.processTimer(A0_29, A1_30)
end
function NpcBaseClass.initWork(A0_31, A1_32, A2_33, A3_34)
  local L4_35, L5_36
  L4_35 = A0_31.work
  L5_36 = A2_33 or {}
  L4_35._temp = L5_36
  L4_35 = A0_31.work
  L5_36 = A3_34 or {}
  L4_35._sync = L5_36
end
function NpcBaseClass.initWorkSyncTag(A0_37, A1_38)
  A0_37.work._tag = A1_38
end
function NpcBaseClass.getSyncWork(A0_39, A1_40)
  return A0_39.work[A1_40]
end
function NpcBaseClass.getHateType(A0_41)
  return A0_41.npcWork.hateType
end
function NpcBaseClass._onUpdateWork(A0_42, A1_43, A2_44)
  A0_42:_callSuperClassFunc("_onUpdateWork", A1_43, A2_44)
  if A2_44 == "_init" then
    A0_42:processUpdateWork(A2_44)
  elseif A1_43 == "work" then
    A0_42:processUpdateWork(A2_44)
  end
end
function NpcBaseClass.processUpdateWork(A0_45, A1_46)
end
function NpcBaseClass.getCategoryIcon(A0_47)
  local L1_48
  L1_48 = 0
  return L1_48
end
function NpcBaseClass.getMapMarkerRange(A0_49)
  local L1_50
  return
end
function NpcBaseClass._onTalkEvent(A0_51, A1_52, A2_53)
  do break end
  A0_51:_callServerOnTalk(A1_52, A2_53)
  do return end
  if desktopWidget:isEventLockonCameraEnable() then
    A1_52:_setLockonTarget(A0_51)
  else
    A1_52:_setLockonTarget(nil)
  end
  A0_51:_callServerOnTalk(A1_52, A2_53)
  A1_52:_setLockonTarget(nil)
  desktopWidget:cancelAllTarget()
end
function NpcBaseClass._onTalkRequest(A0_54, A1_55, A2_56)
  A0_54:_doServerOnTalk(A1_55, A2_56)
end
function NpcBaseClass._onEmoteEvent(A0_57, A1_58, A2_59)
  do break end
  A0_57:_callServerOnEmote(A1_58, A2_59)
  do return end
  if desktopWidget:isEventLockonCameraEnable() then
    A1_58:_setLockonTarget(A0_57)
  else
    A1_58:_setLockonTarget(nil)
  end
  A0_57:_callServerOnEmote(A1_58, A2_59)
  A1_58:_setLockonTarget(nil)
  desktopWidget:cancelAllTarget()
end
function NpcBaseClass._onEmoteRequest(A0_60, A1_61, A2_62)
  A0_60:_doServerOnEmote(A1_61, A2_62)
end
function NpcBaseClass._onPushEvent(A0_63, A1_64, A2_65)
  A0_63:_callServerOnPush(A1_64, A2_65)
end
function NpcBaseClass._onPushRequest(A0_66, A1_67, A2_68)
  local L3_69, L4_70, L5_71
  if A2_68 == "pushCommandIn" then
    L4_70 = A0_66
    L3_69 = A0_66.getPushCommandVariation
    L5_71 = L3_69(L4_70)
    A1_67:setPlaceDrivenCommandVariation(L3_69, L4_70, A0_66, L5_71)
    return
  elseif A2_68 == "pushCommandOut" then
    L4_70 = A0_66
    L3_69 = A0_66.getPushCommandVariation
    L5_71 = L3_69(L4_70)
    A1_67:resetPlaceDrivenCommandVariation(L3_69, L4_70, A0_66, L5_71)
    return
  end
  L4_70 = A0_66
  L3_69 = A0_66._doServerOnPush
  L5_71 = A1_67
  L3_69(L4_70, L5_71, A2_68)
end
function NpcBaseClass.delegateEvent(A0_72, A1_73, A2_74, A3_75, ...)
  local L5_77, L6_78, L7_79, L8_80, L9_81, L10_82
  L6_78 = A2_74
  L5_77 = A2_74._callFunction
  L7_79 = A3_75
  L8_80 = A1_73
  L9_81 = A0_72
  L10_82 = ...
  return L5_77(L6_78, L7_79, L8_80, L9_81, L10_82)
end
function NpcBaseClass._onEventCancel(A0_83, A1_84, A2_85, A3_86)
  do break end
  do return end
  A1_84:_setLockonTarget(nil)
  desktopWidget:cancelAllTarget()
  if A2_85 == "talkDefault" or A2_85 == "pushDefault" or A2_85 == "emoteDefault1" or A2_85 == "emoteDefault2" or A2_85 == "emoteDefault3" or A2_85 == "emoteDefault4" or A2_85 == "emoteDefault5" or A2_85 == "emoteDefault6" or A2_85 == "emoteDefault7" or A2_85 == "emoteDefault8" or A2_85 == "pushCommand" or A2_85 == "commandContent" or A2_85 == "commandForced" or A2_85 == "commandDefault" or A2_85 == "commandWeak" or A2_85 == "commandJudgeMode" then
    A1_84:_resetFade()
  end
end
function NpcBaseClass._onTalkRejected(A0_87, A1_88)
end
function NpcBaseClass._onEmoteRejected(A0_89, A1_90)
end
function NpcBaseClass._onNoticeRejected(A0_91, A1_92)
end
function NpcBaseClass._onReaction(A0_93, A1_94, A2_95)
end
