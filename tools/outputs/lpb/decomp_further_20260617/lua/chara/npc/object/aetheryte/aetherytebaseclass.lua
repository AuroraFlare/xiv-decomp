require("/Chara/Npc/NpcBaseClass")
_defineBaseClass("AetheryteBaseClass", "NpcBaseClass")
function AetheryteBaseClass.initForEvent(A0_0)
  A0_0.aetheryteWork._temp = {
    {
      "_assignForChild",
      16
    },
    {"iconGil", "integer32"},
    {
      "guildleveId",
      "integer16"
    },
    {"clearTime", "integer16"},
    {
      "missionBonus",
      "integer32"
    },
    {
      "difficultyBonus",
      "integer32"
    },
    {
      "factionNumber",
      "integer8"
    },
    {
      "factionBonus",
      "integer32"
    },
    {
      "factionCredit",
      "integer8"
    },
    {
      "glRewardItem",
      "integer32"
    },
    {
      "glRewardNumber",
      "integer32"
    },
    {
      "glRewardSubItem",
      "integer32"
    },
    {
      "glRewardSubNumber",
      "integer32"
    },
    {"difficulty", "integer8"}
  }
  itemDataSheet:_loadKeyTemporarily(1000001, 1000001)
  A0_0.aetheryteWork.iconGil = itemDataSheet:_getData(1000001, 36)
  A0_0:_setGroundOn(false)
  A0_0:initForEventAsAetheryte()
end
function AetheryteBaseClass.initForEventAsAetheryte(A0_1)
  local L1_2
end
function AetheryteBaseClass.canUseGuildleve(A0_3, A1_4, A2_5)
  if not A1_4:isUnusedGuildleveById(A2_5) then
    return false
  end
  guildleveUISheet:_loadKeyTemporarily(A2_5, A2_5)
  if A0_3:_isAlive() and A0_3:getActorClassId() == guildleveUISheet:_getData(A2_5, 78) then
    return true
  end
  return false
end
function AetheryteBaseClass.eventGLSelect(A0_6, A1_7)
  local L2_8, L3_9
  L2_8 = desktopWidget
  L3_9 = L2_8
  L2_8 = L2_8.askActiveGuildleveSelectWidget
  L3_9 = L2_8(L3_9, A0_6, A1_7)
  return L2_8, L3_9
end
function AetheryteBaseClass.eventGLSelectDetail(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17, A8_18, A9_19)
  local L10_20, L11_21
  L10_20 = desktopWidget
  L11_21 = L10_20
  L10_20 = L10_20.askActiveGuildleveDetailWidget
  L11_21 = L10_20(L11_21, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17, A9_19)
  return L10_20, L11_21
end
function AetheryteBaseClass.eventGLDifficulty(A0_22, A1_23)
  if desktopWidget:askEventModeWidgetYield("Ask/GuildleveSelectLevelWidget", 1) ~= true or desktopWidget:askEventModeWidgetYield("Ask/GuildleveSelectLevelWidget", 1) == -1 then
    return nil
  end
  return desktopWidget:askEventModeWidgetYield("Ask/GuildleveSelectLevelWidget", 1)
end
function AetheryteBaseClass.eventGLStart(A0_24, A1_25, A2_26, A3_27, A4_28, A5_29, A6_30, A7_31, A8_32, A9_33)
  if desktopWidget:askEventModeWidgetYield("Ask/GuildleveStartWidget", 1, A1_25, A2_26, A3_27, A4_28, A5_29, A6_30, A7_31, A8_32, 0, A9_33) == 1 then
    return A2_26
  end
  return nil
end
function AetheryteBaseClass.eventGLBoost(A0_34, A1_35, A2_36)
  return A0_34:processGuildleveBoost(A1_35, A2_36)
end
function AetheryteBaseClass.processGuildleveBoost(A0_37, A1_38, A2_39)
end
function AetheryteBaseClass.eventGLPlay(A0_40, A1_41, A2_42, A3_43, A4_44, A5_45, A6_46, A7_47, A8_48, A9_49)
  return A0_40:processGuildlevePlaying(A1_41, A2_42, A3_43, A4_44, A5_45, A6_46, A7_47, A8_48, A9_49)
end
function AetheryteBaseClass.processGuildlevePlaying(A0_50, A1_51, A2_52, A3_53, A4_54, A5_55, A6_56, A7_57, A8_58, A9_59)
end
function AetheryteBaseClass.askRetryRegionalleve(A0_60, A1_61, A2_62)
  local L3_63, L4_64
  L3_63 = worldMaster:ask(A0_60, worldMaster, 50144, 2, A1_61, A2_62)
  if L3_63 == 1 then
    return L3_63, L4_64
  elseif L3_63 == 2 then
    L4_64 = worldMaster:ask(A0_60, worldMaster, 50149, 2, A1_61)
  end
  return L3_63, L4_64
end
function AetheryteBaseClass.eventGLJoin(A0_65)
  return A0_65:processGuildleveJoin()
end
function AetheryteBaseClass.processGuildleveJoin(A0_66)
  local L1_67
end
function AetheryteBaseClass.eventGLReward(A0_68, A1_69, A2_70, A3_71, A4_72, A5_73, A6_74, A7_75, A8_76, A9_77, A10_78, A11_79, A12_80)
  local L13_81, L14_82
  L13_81 = A0_68.aetheryteWork
  L14_82 = A0_68.aetheryteWork
  L13_81.guildleveId, L14_82.clearTime, A0_68.aetheryteWork.missionBonus, A0_68.aetheryteWork.difficultyBonus, A0_68.aetheryteWork.factionNumber, A0_68.aetheryteWork.factionBonus, A0_68.aetheryteWork.factionCredit, A0_68.aetheryteWork.glRewardItem, A0_68.aetheryteWork.glRewardNumber, A0_68.aetheryteWork.glRewardSubItem, A0_68.aetheryteWork.glRewardSubNumber, A0_68.aetheryteWork.difficulty = A1_69, A2_70, A3_71, A4_72, A5_73, A6_74, A7_75, A8_76, A9_77, A10_78, A11_79, A12_80
  L13_81 = desktopWidget
  L14_82 = L13_81
  L13_81 = L13_81.askEventModeWidgetYield
  L14_82 = L13_81(L14_82, "Ask/ContentRewardWidget", 1, A0_68, 1)
  return L13_81, L14_82
end
function AetheryteBaseClass.getGuildleveId(A0_83)
  return A0_83.aetheryteWork.guildleveId
end
function AetheryteBaseClass.getContentRewardButtonText(A0_84)
  local L1_85, L2_86
  L2_86 = 4403
  return L1_85, L2_86
end
function AetheryteBaseClass.getContentRewardMainTitle(A0_87)
  local L1_88, L2_89
  L2_89 = 4401
  return L1_88, L2_89, A0_87.aetheryteWork.guildleveId
end
function AetheryteBaseClass.getContentRewardGridVisible(A0_90, A1_91)
  local L2_92
  if A1_91 == 1 then
    L2_92 = A0_90.aetheryteWork
    L2_92 = L2_92.glRewardItem
    if L2_92 == 0 then
      L2_92 = false
      return L2_92
    end
  end
  L2_92 = true
  return L2_92
end
function AetheryteBaseClass.getContentRewardSubTitle(A0_93, A1_94)
  if A1_94 == 1 then
  else
    return
  end
end
function AetheryteBaseClass.getContentRewardItem(A0_95, A1_96, A2_97, A3_98)
  local L4_99, L5_100
  if A1_96 == 1 then
    if A2_97 == 1 then
      L4_99 = A0_95.aetheryteWork
      L4_99 = L4_99.glRewardItem
      if L4_99 > 0 then
        if A3_98 == 1 then
          L4_99, L5_100 = nil, nil
          return L4_99, L5_100, 4402
        elseif A3_98 == 2 then
          L4_99 = itemDataSheet
          L5_100 = L4_99
          L4_99 = L4_99._loadKeyTemporarily
          L4_99(L5_100, A0_95.aetheryteWork.glRewardItem, A0_95.aetheryteWork.glRewardItem)
          L4_99 = itemDataSheet
          L5_100 = L4_99
          L4_99 = L4_99._getData
          L4_99 = L4_99(L5_100, A0_95.aetheryteWork.glRewardItem, 36)
          L5_100 = A0_95.aetheryteWork
          L5_100 = L5_100.glRewardItem
          if L5_100 == 1000001 then
            L5_100 = L4_99
            return L5_100, nil, 4405, A0_95.aetheryteWork.glRewardNumber
          else
            L5_100 = L4_99
            return L5_100, nil, 4406, A0_95.aetheryteWork.glRewardItem, A0_95.aetheryteWork.glRewardNumber
          end
        end
      end
    elseif A2_97 == 2 then
      L4_99 = A0_95.aetheryteWork
      L4_99 = L4_99.glRewardSubItem
      if L4_99 > 0 then
        if A3_98 == 1 then
          return
        elseif A3_98 == 2 then
          L4_99 = itemDataSheet
          L5_100 = L4_99
          L4_99 = L4_99._loadKeyTemporarily
          L4_99(L5_100, A0_95.aetheryteWork.glRewardSubItem, A0_95.aetheryteWork.glRewardSubItem)
          L4_99 = itemDataSheet
          L5_100 = L4_99
          L4_99 = L4_99._getData
          L4_99 = L4_99(L5_100, A0_95.aetheryteWork.glRewardSubItem, 36)
          L5_100 = L4_99
          return L5_100, nil, 4406, A0_95.aetheryteWork.glRewardSubItem, A0_95.aetheryteWork.glRewardSubNumber
        end
      end
    elseif A2_97 == 3 then
      L4_99 = A0_95.aetheryteWork
      L4_99 = L4_99.factionCredit
      if L4_99 > 0 then
        if A3_98 == 1 then
          L4_99, L5_100 = nil, nil
          return L4_99, L5_100, 4409, A0_95.aetheryteWork.factionNumber
        elseif A3_98 == 2 then
          L4_99 = 535
          L5_100 = A0_95.aetheryteWork
          L5_100 = L5_100.factionNumber
          if L5_100 == 2 then
            L4_99 = 536
          else
            L5_100 = A0_95.aetheryteWork
            L5_100 = L5_100.factionNumber
            if L5_100 == 3 then
              L4_99 = 537
            end
          end
          L5_100 = L4_99
          return L5_100, nil, 4410, A0_95.aetheryteWork.factionCredit
        end
      end
    elseif A2_97 == 4 then
      L4_99 = A0_95.aetheryteWork
      L4_99 = L4_99.factionBonus
      if L4_99 > 0 then
        if A3_98 == 1 then
          return
        elseif A3_98 == 2 then
          L4_99 = A0_95.aetheryteWork
          L4_99 = L4_99.iconGil
          L5_100 = nil
          return L4_99, L5_100, 4405, A0_95.aetheryteWork.factionBonus
        end
      end
    end
  elseif A1_96 == 2 then
    if A2_97 == 1 then
      L4_99 = A0_95.aetheryteWork
      L4_99 = L4_99.missionBonus
      if L4_99 > 0 then
        if A3_98 == 1 then
          L4_99, L5_100 = nil, nil
          return L4_99, L5_100, 4407
        elseif A3_98 == 2 then
          L4_99 = A0_95.aetheryteWork
          L4_99 = L4_99.iconGil
          L5_100 = nil
          return L4_99, L5_100, 4405, A0_95.aetheryteWork.missionBonus
        end
      end
    elseif A2_97 == 2 then
      L4_99 = A0_95.aetheryteWork
      L4_99 = L4_99.difficulty
      if L4_99 > 1 then
        if A3_98 == 1 then
          L4_99, L5_100 = nil, nil
          return L4_99, L5_100, 4408, A0_95.aetheryteWork.difficulty
        elseif A3_98 == 2 then
          L4_99 = A0_95.aetheryteWork
          L4_99 = L4_99.guildleveId
          if L4_99 > 20000 then
            L4_99 = A0_95.aetheryteWork
            L4_99 = L4_99.guildleveId
            if L4_99 < 29999 then
              L4_99 = itemDataSheet
              L5_100 = L4_99
              L4_99 = L4_99._loadKeyTemporarily
              L4_99(L5_100, A0_95.aetheryteWork.glRewardItem, A0_95.aetheryteWork.glRewardItem)
              L4_99 = itemDataSheet
              L5_100 = L4_99
              L4_99 = L4_99._getData
              L4_99 = L4_99(L5_100, A0_95.aetheryteWork.glRewardItem, 36)
              L5_100 = 0
              guildleveSheet:_loadKeyTemporarily(A0_95.aetheryteWork.guildleveId, A0_95.aetheryteWork.guildleveId)
              if guildleveSheet:_getData(A0_95.aetheryteWork.guildleveId, 5) == 30 then
                L5_100 = (A0_95.aetheryteWork.difficulty - 1) * 10
              else
                L5_100 = (A0_95.aetheryteWork.difficulty - 1) * 25
              end
              return L4_99, nil, 4406, A0_95.aetheryteWork.glRewardItem, L5_100
            end
          else
            L4_99 = A0_95.aetheryteWork
            L4_99 = L4_99.iconGil
            L5_100 = nil
            return L4_99, L5_100, 4405, A0_95.aetheryteWork.difficultyBonus
          end
        end
      end
    end
  elseif A1_96 == 3 and A2_97 == 1 and A3_98 == 1 then
    L4_99 = _math
    L4_99 = L4_99.fmod
    L5_100 = A0_95.aetheryteWork
    L5_100 = L5_100.clearTime
    L4_99 = L4_99(L5_100, 60)
    L5_100 = A0_95.aetheryteWork
    L5_100 = L5_100.clearTime
    L5_100 = L5_100 - L4_99
    L5_100 = L5_100 / 60
    return 111, nil, 4404, L5_100, L4_99
  end
  return
end
function AetheryteBaseClass.isMapMarkerVisibleForTalkable(A0_101)
  local L1_102
  L1_102 = false
  return L1_102
end
