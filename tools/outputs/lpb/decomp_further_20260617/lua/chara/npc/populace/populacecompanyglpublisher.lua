require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCompanyGLPublisher", "NpcBaseClass")
function PopulaceCompanyGLPublisher.initForEvent(A0_0, A1_1)
  local L2_2
  L2_2 = {
    {"townId", "integer8"},
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
  A0_0:initWork(nil, L2_2)
  A0_0.work.townId = A1_1
  itemDataSheet:_loadKeyTemporarily(1000001, 1000001)
  A0_0.work.iconGil = itemDataSheet:_getData(1000001, 36)
  A0_0:_loadTextDataPermanently(7712, "populaceCompanyGLPublisher")
end
function PopulaceCompanyGLPublisher.talkOutsider(A0_3)
  local L1_4
  L1_4 = worldMaster
  L1_4 = L1_4._getMyPlayer
  L1_4 = L1_4(L1_4)
  A0_3:startCliantTalkTurn(2, L1_4)
  A0_3:_runCharaScheduler(353959936)
  A0_3:say(A0_3, 1, 0, A0_3.work.townId)
  A0_3:finishCliantTalkTurn()
end
function PopulaceCompanyGLPublisher.talkOfferWelcome(A0_5, A1_6)
  local L2_7
  L2_7 = worldMaster
  L2_7 = L2_7._getMyPlayer
  L2_7 = L2_7(L2_7)
  A0_5:startCliantTalkTurn(2, L2_7)
  A0_5:_wait(1)
  if A0_5:isUpperRank(A0_5.work.townId, 25) == true then
    A0_5:say(A0_5, 2, 0, A1_6, A0_5.work.townId)
  else
    A0_5:say(A0_5, 36, 0, A1_6, A0_5.work.townId)
  end
end
function PopulaceCompanyGLPublisher.askCompanyLeve(A0_8)
  local L1_9
  L1_9 = 0
  while L1_9 ~= nil do
    L1_9 = A0_8:askExtendWidget(A0_8, 3, 3, 1, 1)
    if L1_9 == 1 then
      return L1_9
    elseif L1_9 == 2 then
      if A0_8:isUpperRank(A0_8.work.townId, 25) == true then
        A0_8:_runCharaScheduler(353959936)
        A0_8:say(A0_8, 11, 0)
        A0_8:say(A0_8, 12, 0)
        worldMaster:say(A0_8, 13)
        A0_8:_runCharaScheduler(353964032)
        A0_8:say(A0_8, 14, 0)
        worldMaster:say(A0_8, 15)
      else
        A0_8:_runCharaScheduler(353959936)
        A0_8:say(A0_8, 40, 0)
        A0_8:say(A0_8, 41, 0)
        worldMaster:say(A0_8, 13)
        A0_8:_runCharaScheduler(353964032)
        A0_8:say(A0_8, 42, 0)
        worldMaster:say(A0_8, 15)
      end
    else
      L1_9 = nil
    end
  end
  return L1_9
end
function PopulaceCompanyGLPublisher.askLeveDetail(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17, A8_18)
  A0_10:_runCharaScheduler(353959936)
  if A0_10:isUpperRank(A0_10.work.townId, 25) == true then
    A0_10:say(A0_10, 7, 0)
  else
    A0_10:say(A0_10, 37, 0)
  end
  return (desktopWidget:askJournalDetailWidget(9, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17, A8_18))
end
function PopulaceCompanyGLPublisher.eventGLDifficulty(A0_19, A1_20)
  if desktopWidget:askEventModeWidgetYield("Ask/GuildleveSelectLevelWidget", 1) ~= true or desktopWidget:askEventModeWidgetYield("Ask/GuildleveSelectLevelWidget", 1) == -1 then
    return nil
  end
  return desktopWidget:askEventModeWidgetYield("Ask/GuildleveSelectLevelWidget", 1)
end
function PopulaceCompanyGLPublisher.eventGLStart(A0_21, A1_22, A2_23, A3_24)
  if desktopWidget:askEventModeWidgetYield("Ask/GuildleveStartWidget", 1, A1_22, A2_23, 0, 0, 0, 0, 0, 0, 0, A3_24) == 1 then
    return A2_23
  end
  return nil
end
function PopulaceCompanyGLPublisher.talkAfterOffer(A0_25)
  A0_25:_runCharaScheduler(353959936)
  if A0_25:isUpperRank(A0_25.work.townId, 25) == true then
    A0_25:say(A0_25, 8, 0)
  else
    A0_25:say(A0_25, 38, 0)
  end
  A0_25:finishCliantTalkTurn()
end
function PopulaceCompanyGLPublisher.talkOfferLimit(A0_26)
  A0_26:_runCharaScheduler(353964032)
  if A0_26:isUpperRank(A0_26.work.townId, 25) == true then
    A0_26:say(A0_26, 9, 0)
  else
    A0_26:say(A0_26, 34, 0)
  end
end
function PopulaceCompanyGLPublisher.finishTalkTurn(A0_27)
  A0_27:finishCliantTalkTurn()
end
function PopulaceCompanyGLPublisher.eventGLPlay(A0_28, A1_29, A2_30, A3_31, A4_32)
  local L5_33, L6_34, L7_35, L8_36, L9_37, L10_38
  L5_33 = 0
  L6_34 = 0
  L7_35 = false
  if A3_31 == nil then
    A3_31 = 0
  end
  if A3_31 > 0 then
    L7_35 = true
  end
  L8_36 = false
  if A4_32 > 0 then
    L8_36 = true
  end
  while L5_33 == 0 do
    L9_37 = worldMaster
    L10_38 = L9_37
    L9_37 = L9_37.askRestrictChoices
    L9_37 = L9_37(L10_38, A0_28, A0_28, 16, true, L7_35, L8_36, true, A1_29, A3_31, A2_30, A4_32)
    L5_33 = L9_37
    if L5_33 == 2 then
      L9_37 = worldMaster
      L10_38 = L9_37
      L9_37 = L9_37.say
      L9_37(L10_38, A0_28, 21)
      L9_37 = worldMaster
      L10_38 = L9_37
      L9_37 = L9_37.ask
      L9_37 = L9_37(L10_38, A0_28, A0_28, 22, 2, A3_31, A2_30)
      if L9_37 ~= 1 then
        L5_33 = 0
      else
        return L5_33
      end
    elseif L5_33 == 3 then
      if A4_32 == 1 then
        L9_37 = worldMaster
        L10_38 = L9_37
        L9_37 = L9_37.say
        L9_37(L10_38, A0_28, 32)
        L5_33 = 0
      else
        L9_37 = worldMaster
        L10_38 = L9_37
        L9_37 = L9_37.say
        L9_37(L10_38, A0_28, 30)
        L9_37 = desktopWidget
        L10_38 = L9_37
        L9_37 = L9_37.askEventModeWidgetYield
        L10_38 = L9_37(L10_38, "Ask/GuildleveSelectLevelWidget", 1, A4_32 - 1)
        if L9_37 ~= true or L10_38 == -1 then
          L5_33 = 0
        elseif L10_38 ~= nil and L10_38 > 0 and L10_38 < 6 then
          return L5_33, L10_38
        else
          L5_33 = 0
        end
      end
    elseif L5_33 == 4 then
      L9_37 = worldMaster
      L10_38 = L9_37
      L9_37 = L9_37.ask
      L9_37 = L9_37(L10_38, A0_28, A0_28, 27, 2)
      if L9_37 ~= 1 then
        L5_33 = 0
      else
        return L5_33
      end
    end
  end
  return L5_33
end
function PopulaceCompanyGLPublisher.eventGLShinpu(A0_39, A1_40, A2_41)
  worldMaster:say(A0_39, 21)
  return (worldMaster:ask(A0_39, A0_39, 22, 2, A2_41, A1_40))
end
function PopulaceCompanyGLPublisher.eventGLThanks(A0_42)
  local L1_43
  L1_43 = worldMaster
  L1_43 = L1_43._getMyPlayer
  L1_43 = L1_43(L1_43)
  A0_42:startCliantTalkTurn(2, L1_43)
  A0_42:_wait(1)
  if A0_42:isUpperRank(A0_42.work.townId, 25) == true then
    A0_42:say(A0_42, 10, 0)
  else
    A0_42:say(A0_42, 39, 0)
  end
  A0_42:_runCharaScheduler(354107392)
  A0_42:_wait(2)
end
function PopulaceCompanyGLPublisher.eventGLReward(A0_44, A1_45, A2_46, A3_47, A4_48, A5_49, A6_50, A7_51, A8_52, A9_53, A10_54, A11_55, A12_56)
  local L13_57, L14_58
  L13_57 = A0_44.work
  L14_58 = A0_44.work
  L13_57.guildleveId, L14_58.clearTime, A0_44.work.missionBonus, A0_44.work.difficultyBonus, A0_44.work.factionNumber, A0_44.work.factionBonus, A0_44.work.factionCredit, A0_44.work.glRewardItem, A0_44.work.glRewardNumber, A0_44.work.glRewardSubItem, A0_44.work.glRewardSubNumber, A0_44.work.difficulty = A1_45, A2_46, A3_47, A4_48, A5_49, A6_50, A7_51, A8_52, A9_53, A10_54, A11_55, A12_56
  L13_57 = desktopWidget
  L14_58 = L13_57
  L13_57 = L13_57.askEventModeWidgetYield
  L14_58 = L13_57(L14_58, "Ask/ContentRewardWidget", 1, A0_44, 1)
  A0_44:finishCliantTalkTurn()
  return L13_57, L14_58
end
function PopulaceCompanyGLPublisher.getGuildleveId(A0_59)
  return A0_59:getTempWork("guildleveId")
end
function PopulaceCompanyGLPublisher.getContentRewardButtonText(A0_60)
  local L1_61, L2_62
  L2_62 = 4403
  return L1_61, L2_62
end
function PopulaceCompanyGLPublisher.getContentRewardMainTitle(A0_63)
  local L1_64, L2_65
  L2_65 = 4401
  return L1_64, L2_65, A0_63:getTempWork("guildleveId")
end
function PopulaceCompanyGLPublisher.getContentRewardGridVisible(A0_66, A1_67)
  local L2_68
  if A1_67 == 1 then
    L2_68 = A0_66.work
    L2_68 = L2_68.glRewardItem
    if L2_68 == 0 then
      L2_68 = false
      return L2_68
    end
  end
  L2_68 = true
  return L2_68
end
function PopulaceCompanyGLPublisher.getContentRewardSubTitle(A0_69, A1_70)
  if A1_70 == 1 then
  else
    return
  end
end
function PopulaceCompanyGLPublisher.getContentRewardItem(A0_71, A1_72, A2_73, A3_74)
  local L4_75, L5_76
  if A1_72 == 1 then
    if A2_73 == 1 then
      L4_75 = A0_71.work
      L4_75 = L4_75.glRewardItem
      if L4_75 > 0 then
        if A3_74 == 1 then
          L4_75, L5_76 = nil, nil
          return L4_75, L5_76, 4402
        elseif A3_74 == 2 then
          L4_75 = itemDataSheet
          L5_76 = L4_75
          L4_75 = L4_75._loadKeyTemporarily
          L4_75(L5_76, A0_71.work.glRewardItem, A0_71.work.glRewardItem)
          L4_75 = itemDataSheet
          L5_76 = L4_75
          L4_75 = L4_75._getData
          L4_75 = L4_75(L5_76, A0_71.work.glRewardItem, 36)
          L5_76 = A0_71.work
          L5_76 = L5_76.glRewardItem
          if L5_76 == 1000001 then
            L5_76 = L4_75
            return L5_76, nil, 4405, A0_71.work.glRewardNumber
          else
            L5_76 = L4_75
            return L5_76, nil, 4406, A0_71.work.glRewardItem, A0_71.work.glRewardNumber
          end
        end
      end
    elseif A2_73 == 2 then
      L4_75 = A0_71.work
      L4_75 = L4_75.glRewardSubItem
      if L4_75 > 0 then
        if A3_74 == 1 then
          return
        elseif A3_74 == 2 then
          L4_75 = itemDataSheet
          L5_76 = L4_75
          L4_75 = L4_75._loadKeyTemporarily
          L4_75(L5_76, A0_71.work.glRewardSubItem, A0_71.work.glRewardSubItem)
          L4_75 = itemDataSheet
          L5_76 = L4_75
          L4_75 = L4_75._getData
          L4_75 = L4_75(L5_76, A0_71.work.glRewardSubItem, 36)
          L5_76 = L4_75
          return L5_76, nil, 4406, A0_71.work.glRewardSubItem, A0_71.work.glRewardSubNumber
        end
      end
    elseif A2_73 == 3 then
      L4_75 = A0_71.work
      L4_75 = L4_75.factionCredit
      if L4_75 > 0 then
        if A3_74 == 1 then
          L4_75, L5_76 = nil, nil
          return L4_75, L5_76, 4409, A0_71.work.factionNumber
        elseif A3_74 == 2 then
          L4_75 = 535
          L5_76 = A0_71.work
          L5_76 = L5_76.factionNumber
          if L5_76 == 2 then
            L4_75 = 536
          else
            L5_76 = A0_71.work
            L5_76 = L5_76.factionNumber
            if L5_76 == 3 then
              L4_75 = 537
            end
          end
          L5_76 = L4_75
          return L5_76, nil, 4410, A0_71.work.factionCredit
        end
      end
    elseif A2_73 == 4 then
      L4_75 = A0_71.work
      L4_75 = L4_75.factionBonus
      if L4_75 > 0 then
        if A3_74 == 1 then
          return
        elseif A3_74 == 2 then
          L5_76 = A0_71
          L4_75 = A0_71.getTempWork
          L4_75 = L4_75(L5_76, "iconGil")
          L5_76 = nil
          return L4_75, L5_76, 4405, A0_71.work.factionBonus
        end
      end
    end
  elseif A1_72 == 2 then
    if A2_73 == 1 then
      L4_75 = A0_71.work
      L4_75 = L4_75.missionBonus
      if L4_75 > 0 then
        if A3_74 == 1 then
          L4_75, L5_76 = nil, nil
          return L4_75, L5_76, 4407
        elseif A3_74 == 2 then
          L5_76 = A0_71
          L4_75 = A0_71.getTempWork
          L4_75 = L4_75(L5_76, "iconGil")
          L5_76 = nil
          return L4_75, L5_76, 4405, A0_71.work.missionBonus
        end
      end
    elseif A2_73 == 2 then
      L4_75 = A0_71.work
      L4_75 = L4_75.difficulty
      if L4_75 > 1 then
        if A3_74 == 1 then
          L4_75, L5_76 = nil, nil
          return L4_75, L5_76, 4408, A0_71.work.difficulty
        elseif A3_74 == 2 then
          L4_75 = A0_71.work
          L4_75 = L4_75.guildleveId
          if L4_75 > 20000 then
            L4_75 = A0_71.work
            L4_75 = L4_75.guildleveId
            if L4_75 < 29999 then
              L4_75 = itemDataSheet
              L5_76 = L4_75
              L4_75 = L4_75._loadKeyTemporarily
              L4_75(L5_76, A0_71.work.glRewardItem, A0_71.work.glRewardItem)
              L4_75 = itemDataSheet
              L5_76 = L4_75
              L4_75 = L4_75._getData
              L4_75 = L4_75(L5_76, A0_71.work.glRewardItem, 36)
              L5_76 = 0
              guildleveSheet:_loadKeyTemporarily(A0_71.work.guildleveId, A0_71.work.guildleveId)
              if guildleveSheet:_getData(A0_71.work.guildleveId, 5) == 30 then
                L5_76 = (A0_71.work.difficulty - 1) * 10
              else
                L5_76 = (A0_71.work.difficulty - 1) * 25
              end
              return L4_75, nil, 4406, A0_71.work.glRewardItem, L5_76
            end
          else
            L5_76 = A0_71
            L4_75 = A0_71.getTempWork
            L4_75 = L4_75(L5_76, "iconGil")
            L5_76 = nil
            return L4_75, L5_76, 4405, A0_71.work.difficultyBonus
          end
        end
      end
    end
  elseif A1_72 == 3 and A2_73 == 1 and A3_74 == 1 then
    L4_75 = _math
    L4_75 = L4_75.fmod
    L5_76 = A0_71.getTempWork
    L5_76 = L5_76(A0_71, "clearTime")
    L4_75 = L4_75(L5_76, 60)
    L5_76 = A0_71.getTempWork
    L5_76 = L5_76(A0_71, "clearTime")
    L5_76 = L5_76 - L4_75
    L5_76 = L5_76 / 60
    return 111, nil, 4404, L5_76, L4_75
  end
  return
end
