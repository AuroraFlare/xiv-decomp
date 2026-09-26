require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGuildleveTester", "NpcBaseClass")
function PopulaceGuildleveTester.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0.work
  L1_1._temp = {
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
    }
  }
  L1_1 = A0_0.work
  L1_1.iconGil = 60737
end
function PopulaceGuildleveTester.eventTalkGLTesterSelect(A0_2)
  local L1_3
  return L1_3
end
function PopulaceGuildleveTester.canUseGuildleve(A0_4, A1_5, A2_6)
  local L3_7
  L3_7 = true
  return L3_7
end
function PopulaceGuildleveTester.eventTalkGuildleveSelect(A0_8, A1_9)
  local L2_10, L3_11
  L2_10 = desktopWidget
  L3_11 = L2_10
  L2_10 = L2_10.askActiveGuildleveSelectWidget
  L3_11 = L2_10(L3_11, A0_8, A1_9)
  return L2_10, L3_11
end
function PopulaceGuildleveTester.eventTalkGuildleveSelectDetail(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18, A7_19, A8_20)
  local L9_21, L10_22
  L9_21 = desktopWidget
  L10_22 = L9_21
  L9_21 = L9_21.askActiveGuildleveDetailWidget
  L10_22 = L9_21(L10_22, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18, A7_19, A8_20)
  return L9_21, L10_22
end
function PopulaceGuildleveTester.eventTalkGuildleveStart(A0_23, A1_24, A2_25, A3_26, A4_27, A5_28, A6_29)
  local L7_30, L8_31, L9_32
  L9_32 = 0
  if A2_25 ~= 0 then
    while true do
      L7_30, L9_32 = desktopWidget:askEventModeWidgetYield("Ask/GuildleveSelectLevelWidget", 1)
      if L7_30 ~= true or L9_32 == -1 then
        return nil
      end
      L7_30, L8_31 = desktopWidget:askEventModeWidgetYield("Ask/GuildleveStartWidget", 1, A1_24, L9_32, A3_26, A4_27, A5_28, A6_29)
      if L8_31 == 1 then
        return L9_32
      elseif L8_31 == nil then
        return nil
      end
    end
  else
    L7_30, L8_31 = desktopWidget:askEventModeWidgetYield("Ask/GuildleveStartWidget", 1, A1_24, L9_32, A3_26, A4_27, A5_28, A6_29)
    if L8_31 == 1 then
      return L9_32
    end
    return nil
  end
end
function PopulaceGuildleveTester.eventTalkGuildlevePlaying(A0_33, A1_34, A2_35, A3_36)
  local L4_37
  L4_37 = 0
  if A3_36 > 0 then
    L4_37 = nil
    if L4_37 == 3 then
      L4_37 = L4_37 + nil
    end
  else
    L4_37 = nil
  end
  return L4_37
end
function PopulaceGuildleveTester.eventTalkGuildleveJoin(A0_38)
  local L1_39
  return L1_39
end
function PopulaceGuildleveTester.eventGuildleveReward(A0_40, A1_41, A2_42, A3_43, A4_44, A5_45, A6_46, A7_47, A8_48, A9_49, A10_50, A11_51, A12_52)
  local L13_53, L14_54
  L13_53 = A0_40.work
  L14_54 = A0_40.work
  L13_53.guildleveId, L14_54.clearTime, A0_40.work.missionBonus, A0_40.work.difficultyBonus, A0_40.work.factionNumber, A0_40.work.factionBonus, A0_40.work.factionCredit, A0_40.work.glRewardItem, A0_40.work.glRewardNumber, A0_40.work.glRewardSubItem, A0_40.work.glRewardSubNumber, A0_40.work.difficulty = A1_41, A2_42, A3_43, A4_44, A5_45, A6_46, A7_47, A8_48, A9_49, A10_50, A11_51, A12_52
  L13_53 = desktopWidget
  L14_54 = L13_53
  L13_53 = L13_53.askEventModeWidgetYield
  L14_54 = L13_53(L14_54, "Ask/ContentRewardWidget", 1, A0_40, 1)
  return L13_53, L14_54
end
function PopulaceGuildleveTester.getGuildleveId(A0_55)
  return A0_55.work.guildleveId
end
function PopulaceGuildleveTester.getContentRewardButtonText(A0_56)
  local L1_57, L2_58
  L2_58 = 4403
  return L1_57, L2_58
end
function PopulaceGuildleveTester.getContentRewardMainTitle(A0_59)
  local L1_60, L2_61
  L2_61 = 4401
  return L1_60, L2_61, A0_59.work.guildleveId
end
function PopulaceGuildleveTester.getContentRewardGridVisible(A0_62, A1_63)
  local L2_64
  if A1_63 == 1 then
    L2_64 = A0_62.work
    L2_64 = L2_64.glRewardItem
    if L2_64 == 0 then
      L2_64 = false
      return L2_64
    end
  end
  L2_64 = true
  return L2_64
end
function PopulaceGuildleveTester.getContentRewardSubTitle(A0_65, A1_66)
  if A1_66 == 1 then
  else
    return
  end
end
function PopulaceGuildleveTester.getContentRewardItem(A0_67, A1_68, A2_69, A3_70)
  local L4_71, L5_72
  if A1_68 == 1 then
    if A2_69 == 1 then
      L4_71 = A0_67.work
      L4_71 = L4_71.glRewardItem
      if L4_71 > 0 then
        if A3_70 == 1 then
          L4_71, L5_72 = nil, nil
          return L4_71, L5_72, 4402
        elseif A3_70 == 2 then
          L4_71 = itemDataSheet
          L5_72 = L4_71
          L4_71 = L4_71._loadKeyTemporarily
          L4_71(L5_72, A0_67.work.glRewardItem, A0_67.work.glRewardItem)
          L4_71 = itemDataSheet
          L5_72 = L4_71
          L4_71 = L4_71._getData
          L4_71 = L4_71(L5_72, A0_67.work.glRewardItem, 36)
          L5_72 = A0_67.work
          L5_72 = L5_72.glRewardItem
          if L5_72 == 1000001 then
            L5_72 = L4_71
            return L5_72, nil, 4405, A0_67.work.glRewardNumber
          else
            L5_72 = L4_71
            return L5_72, nil, 4406, A0_67.work.glRewardItem, A0_67.work.glRewardNumber
          end
        end
      end
    elseif A2_69 == 2 then
      L4_71 = A0_67.work
      L4_71 = L4_71.glRewardSubItem
      if L4_71 > 0 then
        if A3_70 == 1 then
          return
        elseif A3_70 == 2 then
          L4_71 = itemDataSheet
          L5_72 = L4_71
          L4_71 = L4_71._loadKeyTemporarily
          L4_71(L5_72, A0_67.work.glRewardSubItem, A0_67.work.glRewardSubItem)
          L4_71 = itemDataSheet
          L5_72 = L4_71
          L4_71 = L4_71._getData
          L4_71 = L4_71(L5_72, A0_67.work.glRewardSubItem, 36)
          L5_72 = L4_71
          return L5_72, nil, 4406, A0_67.work.glRewardSubItem, A0_67.work.glRewardSubNumber
        end
      end
    elseif A2_69 == 3 then
      L4_71 = A0_67.work
      L4_71 = L4_71.factionCredit
      if L4_71 > 0 then
        if A3_70 == 1 then
          L4_71, L5_72 = nil, nil
          return L4_71, L5_72, 4409, A0_67.work.factionNumber
        elseif A3_70 == 2 then
          L4_71 = 535
          L5_72 = A0_67.work
          L5_72 = L5_72.factionNumber
          if L5_72 == 2 then
            L4_71 = 536
          else
            L5_72 = A0_67.work
            L5_72 = L5_72.factionNumber
            if L5_72 == 3 then
              L4_71 = 537
            end
          end
          L5_72 = L4_71
          return L5_72, nil, 4410, A0_67.work.factionCredit
        end
      end
    elseif A2_69 == 4 then
      L4_71 = A0_67.work
      L4_71 = L4_71.factionBonus
      if L4_71 > 0 then
        if A3_70 == 1 then
          return
        elseif A3_70 == 2 then
          L4_71 = A0_67.work
          L4_71 = L4_71.iconGil
          L5_72 = nil
          return L4_71, L5_72, 4405, A0_67.work.factionBonus
        end
      end
    end
  elseif A1_68 == 2 then
    if A2_69 == 1 then
      L4_71 = A0_67.work
      L4_71 = L4_71.missionBonus
      if L4_71 > 0 then
        if A3_70 == 1 then
          L4_71, L5_72 = nil, nil
          return L4_71, L5_72, 4407
        elseif A3_70 == 2 then
          L4_71 = A0_67.work
          L4_71 = L4_71.iconGil
          L5_72 = nil
          return L4_71, L5_72, 4405, A0_67.work.missionBonus
        end
      end
    elseif A2_69 == 2 then
      L4_71 = A0_67.work
      L4_71 = L4_71.difficultyBonus
      if L4_71 > 0 then
        if A3_70 == 1 then
          L4_71, L5_72 = nil, nil
          return L4_71, L5_72, 4408, A0_67.work.difficulty
        elseif A3_70 == 2 then
          L4_71 = A0_67.work
          L4_71 = L4_71.iconGil
          L5_72 = nil
          return L4_71, L5_72, 4405, A0_67.work.difficultyBonus
        end
      end
    end
  elseif A1_68 == 3 and A2_69 == 1 and A3_70 == 1 then
    L4_71 = _math
    L4_71 = L4_71.fmod
    L5_72 = A0_67.work
    L5_72 = L5_72.clearTime
    L4_71 = L4_71(L5_72, 60)
    L5_72 = A0_67.work
    L5_72 = L5_72.clearTime
    L5_72 = L5_72 - L4_71
    L5_72 = L5_72 / 60
    return 111, nil, 4404, L5_72, L4_71
  end
  return
end
