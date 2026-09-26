require("/Chara/Npc/NpcBaseClass")
_defineClass("GuildleveWarpPoint", "NpcBaseClass")
function GuildleveWarpPoint.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {
    L2_2,
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
  L2_2 = {"iconGil", "integer32"}
  L2_2 = A0_0.initWork
  L2_2(A0_0, nil, L1_1)
  L2_2 = itemDataSheet
  L2_2 = L2_2._loadKeyTemporarily
  L2_2(L2_2, 1000001, 1000001)
  L2_2 = itemDataSheet
  L2_2 = L2_2._getData
  L2_2 = L2_2(L2_2, 1000001, 36)
  A0_0:setTempWork("iconGil", L2_2)
  A0_0:_loadTextDataPermanently(10, "guildleveWarpPoint")
end
function GuildleveWarpPoint.eventGuildleveReward(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10, A8_11, A9_12, A10_13, A11_14, A12_15)
  local L13_16, L14_17
  L13_16 = A0_3.work
  L14_17 = A0_3.work
  L13_16.guildleveId, L14_17.clearTime, A0_3.work.missionBonus, A0_3.work.difficultyBonus, A0_3.work.factionNumber, A0_3.work.factionBonus, A0_3.work.factionCredit, A0_3.work.glRewardItem, A0_3.work.glRewardNumber, A0_3.work.glRewardSubItem, A0_3.work.glRewardSubNumber, A0_3.work.difficulty = A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10, A8_11, A9_12, A10_13, A11_14, A12_15
  L13_16 = desktopWidget
  L14_17 = L13_16
  L13_16 = L13_16.askEventModeWidgetYield
  L14_17 = L13_16(L14_17, "Ask/ContentRewardWidget", 1, A0_3, 1)
  return L13_16, L14_17
end
function GuildleveWarpPoint.eventTalkGuildleveWarp(A0_18, A1_19, A2_20)
  local L3_21
  L3_21 = 0
  if A2_20 > 0 then
    L3_21 = worldMaster:askRestrictChoices(A0_18, A0_18, 1, true, true, true, true, 0, A1_19, A2_20)
  else
    L3_21 = worldMaster:askRestrictChoices(A0_18, A0_18, 1, true, false, true, true, 0, A1_19)
  end
  return L3_21
end
function GuildleveWarpPoint.getGuildleveId(A0_22)
  return A0_22:getTempWork("guildleveId")
end
function GuildleveWarpPoint.getContentRewardButtonText(A0_23)
  local L1_24, L2_25
  L2_25 = 4403
  return L1_24, L2_25
end
function GuildleveWarpPoint.getContentRewardMainTitle(A0_26)
  local L1_27, L2_28
  L2_28 = 4401
  return L1_27, L2_28, A0_26:getTempWork("guildleveId")
end
function GuildleveWarpPoint.getContentRewardGridVisible(A0_29, A1_30)
  local L2_31
  if A1_30 == 1 then
    L2_31 = A0_29.work
    L2_31 = L2_31.glRewardItem
    if L2_31 == 0 then
      L2_31 = false
      return L2_31
    end
  end
  L2_31 = true
  return L2_31
end
function GuildleveWarpPoint.getContentRewardSubTitle(A0_32, A1_33)
  if A1_33 == 1 then
  else
    return
  end
end
function GuildleveWarpPoint.getContentRewardItem(A0_34, A1_35, A2_36, A3_37)
  local L4_38, L5_39
  if A1_35 == 1 then
    if A2_36 == 1 then
      L4_38 = A0_34.work
      L4_38 = L4_38.glRewardItem
      if L4_38 > 0 then
        if A3_37 == 1 then
          L4_38, L5_39 = nil, nil
          return L4_38, L5_39, 4402
        elseif A3_37 == 2 then
          L4_38 = itemDataSheet
          L5_39 = L4_38
          L4_38 = L4_38._loadKeyTemporarily
          L4_38(L5_39, A0_34.work.glRewardItem, A0_34.work.glRewardItem)
          L4_38 = itemDataSheet
          L5_39 = L4_38
          L4_38 = L4_38._getData
          L4_38 = L4_38(L5_39, A0_34.work.glRewardItem, 36)
          L5_39 = A0_34.work
          L5_39 = L5_39.glRewardItem
          if L5_39 == 1000001 then
            L5_39 = L4_38
            return L5_39, nil, 4405, A0_34.work.glRewardNumber
          else
            L5_39 = L4_38
            return L5_39, nil, 4406, A0_34.work.glRewardItem, A0_34.work.glRewardNumber
          end
        end
      end
    elseif A2_36 == 2 then
      L4_38 = A0_34.work
      L4_38 = L4_38.glRewardSubItem
      if L4_38 > 0 then
        if A3_37 == 1 then
          return
        elseif A3_37 == 2 then
          L4_38 = itemDataSheet
          L5_39 = L4_38
          L4_38 = L4_38._loadKeyTemporarily
          L4_38(L5_39, A0_34.work.glRewardSubItem, A0_34.work.glRewardSubItem)
          L4_38 = itemDataSheet
          L5_39 = L4_38
          L4_38 = L4_38._getData
          L4_38 = L4_38(L5_39, A0_34.work.glRewardSubItem, 36)
          L5_39 = L4_38
          return L5_39, nil, 4406, A0_34.work.glRewardSubItem, A0_34.work.glRewardSubNumber
        end
      end
    elseif A2_36 == 3 then
      L4_38 = A0_34.work
      L4_38 = L4_38.factionCredit
      if L4_38 > 0 then
        if A3_37 == 1 then
          L4_38, L5_39 = nil, nil
          return L4_38, L5_39, 4409, A0_34.work.factionNumber
        elseif A3_37 == 2 then
          L4_38 = 535
          L5_39 = A0_34.work
          L5_39 = L5_39.factionNumber
          if L5_39 == 2 then
            L4_38 = 536
          else
            L5_39 = A0_34.work
            L5_39 = L5_39.factionNumber
            if L5_39 == 3 then
              L4_38 = 537
            end
          end
          L5_39 = L4_38
          return L5_39, nil, 4410, A0_34.work.factionCredit
        end
      end
    elseif A2_36 == 4 then
      L4_38 = A0_34.work
      L4_38 = L4_38.factionBonus
      if L4_38 > 0 then
        if A3_37 == 1 then
          return
        elseif A3_37 == 2 then
          L5_39 = A0_34
          L4_38 = A0_34.getTempWork
          L4_38 = L4_38(L5_39, "iconGil")
          L5_39 = nil
          return L4_38, L5_39, 4405, A0_34.work.factionBonus
        end
      end
    end
  elseif A1_35 == 2 then
    if A2_36 == 1 then
      L4_38 = A0_34.work
      L4_38 = L4_38.missionBonus
      if L4_38 > 0 then
        if A3_37 == 1 then
          L4_38, L5_39 = nil, nil
          return L4_38, L5_39, 4407
        elseif A3_37 == 2 then
          L5_39 = A0_34
          L4_38 = A0_34.getTempWork
          L4_38 = L4_38(L5_39, "iconGil")
          L5_39 = nil
          return L4_38, L5_39, 4405, A0_34.work.missionBonus
        end
      end
    elseif A2_36 == 2 then
      L4_38 = A0_34.work
      L4_38 = L4_38.difficulty
      if L4_38 > 1 then
        if A3_37 == 1 then
          L4_38, L5_39 = nil, nil
          return L4_38, L5_39, 4408, A0_34.work.difficulty
        elseif A3_37 == 2 then
          L4_38 = A0_34.work
          L4_38 = L4_38.guildleveId
          if L4_38 > 20000 then
            L4_38 = A0_34.work
            L4_38 = L4_38.guildleveId
            if L4_38 < 29999 then
              L4_38 = itemDataSheet
              L5_39 = L4_38
              L4_38 = L4_38._loadKeyTemporarily
              L4_38(L5_39, A0_34.work.glRewardItem, A0_34.work.glRewardItem)
              L4_38 = itemDataSheet
              L5_39 = L4_38
              L4_38 = L4_38._getData
              L4_38 = L4_38(L5_39, A0_34.work.glRewardItem, 36)
              L5_39 = 0
              guildleveSheet:_loadKeyTemporarily(A0_34.work.guildleveId, A0_34.work.guildleveId)
              if guildleveSheet:_getData(A0_34.work.guildleveId, 5) == 30 then
                L5_39 = (A0_34.work.difficulty - 1) * 10
              else
                L5_39 = (A0_34.work.difficulty - 1) * 25
              end
              return L4_38, nil, 4406, A0_34.work.glRewardItem, L5_39
            end
          else
            L5_39 = A0_34
            L4_38 = A0_34.getTempWork
            L4_38 = L4_38(L5_39, "iconGil")
            L5_39 = nil
            return L4_38, L5_39, 4405, A0_34.work.difficultyBonus
          end
        end
      end
    end
  elseif A1_35 == 3 and A2_36 == 1 and A3_37 == 1 then
    L4_38 = _math
    L4_38 = L4_38.fmod
    L5_39 = A0_34.getTempWork
    L5_39 = L5_39(A0_34, "clearTime")
    L4_38 = L4_38(L5_39, 60)
    L5_39 = A0_34.getTempWork
    L5_39 = L5_39(A0_34, "clearTime")
    L5_39 = L5_39 - L4_38
    L5_39 = L5_39 / 60
    return 111, nil, 4404, L5_39, L4_38
  end
  return
end
function GuildleveWarpPoint.isMapMarkerVisibleForTalkable(A0_40)
  local L1_41
  L1_41 = false
  return L1_41
end
