require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCompanyShop", "NpcBaseClass")
function PopulaceCompanyShop.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 6749, "populaceCompanyShop")
  L1_1 = {
    {"townNumber", "integer8"},
    {
      "companyRank",
      "integer8"
    },
    {"eventFlag", "integer8"},
    {"rankDiv", "integer8"},
    {
      "startSuppliIndex",
      "integer32"
    },
    {
      "endSuppliIndex",
      "integer32"
    },
    {
      "startArmIndex",
      "integer32"
    },
    {
      "endArmIndex",
      "integer32"
    },
    {
      "startFestivalIndex",
      "integer32"
    },
    {
      "endFestivalIndex",
      "integer32"
    },
    {
      "startImportantIndex",
      "integer32"
    },
    {
      "endImportantIndex",
      "integer32"
    }
  }
  A0_0:initWork(nil, L1_1)
  A0_0.work.townNumber = 0
  A0_0.work.rankDiv = 0
  A0_0.work.startSuppliIndex = 0
  A0_0.work.endSuppliIndex = 0
  A0_0.work.startArmIndex = 0
  A0_0.work.endArmIndex = 0
  A0_0.work.startFestivalIndex = 0
  A0_0.work.endFestivalIndex = 0
  if A0_0:getActorClassId() == 1500202 then
    A0_0.work.townNumber = 1
    A0_0.work.startSuppliIndex = 100001
    A0_0.work.endSuppliIndex = 100029
    A0_0.work.startArmIndex = 101001
    A0_0.work.endArmIndex = 101021
    A0_0.work.startFestivalIndex = 102001
    A0_0.work.endFestivalIndex = 102001
    A0_0.work.startImportantIndex = 103001
    A0_0.work.endImportantIndex = 0
    break
  else
  end
  if A0_0:getActorClassId() == 1500203 then
    A0_0.work.townNumber = 2
    A0_0.work.startSuppliIndex = 200001
    A0_0.work.endSuppliIndex = 200029
    A0_0.work.startArmIndex = 201001
    A0_0.work.endArmIndex = 201021
    A0_0.work.startFestivalIndex = 202001
    A0_0.work.endFestivalIndex = 202001
    A0_0.work.startImportantIndex = 203001
    A0_0.work.endImportantIndex = 0
    break
  else
  end
  if A0_0:getActorClassId() == 1500201 then
    A0_0.work.townNumber = 3
    A0_0.work.startSuppliIndex = 300001
    A0_0.work.endSuppliIndex = 300029
    A0_0.work.startArmIndex = 301001
    A0_0.work.endArmIndex = 301021
    A0_0.work.startFestivalIndex = 302001
    A0_0.work.endFestivalIndex = 302001
    A0_0.work.startImportantIndex = 303001
    A0_0.work.endImportantIndex = 0
    do break end
    break
  else
  end
  A0_0.work.companyRank = 25
  A0_0:_setGroundOn(false)
  if A0_0.work.startSuppliIndex > 0 and A0_0.work.endSuppliIndex > 0 then
    gcSealShopItemSheet:_loadKeySemipermanently(A0_0.work.startSuppliIndex, A0_0.work.endSuppliIndex)
  end
  if A0_0.work.startArmIndex > 0 and A0_0.work.endArmIndex > 0 then
    gcSealShopItemSheet:_loadKeySemipermanently(A0_0.work.startArmIndex, A0_0.work.endArmIndex)
  end
  if A0_0.work.startFestivalIndex > 0 and A0_0.work.endFestivalIndex > 0 then
    gcSealShopItemSheet:_loadKeySemipermanently(A0_0.work.startFestivalIndex, A0_0.work.endFestivalIndex)
  end
  if A0_0.work.startImportantIndex > 0 and A0_0.work.endImportantIndex > 0 then
    gcSealShopItemSheet:_loadKeySemipermanently(A0_0.work.startImportantIndex, A0_0.work.endImportantIndex)
  end
  if A0_0.work.startSuppliIndex > 0 and A0_0.work.endSuppliIndex > 0 then
    A0_0:_preloadItemSpreadSheetContainer("gcSealShopItem", 0, A0_0.work.startSuppliIndex, A0_0.work.endSuppliIndex)
  end
  if A0_0.work.startArmIndex > 0 and A0_0.work.endArmIndex > 0 then
    A0_0:_preloadItemSpreadSheetContainer("gcSealShopItem", 0, A0_0.work.startArmIndex, A0_0.work.endArmIndex)
  end
  if A0_0.work.startFestivalIndex > 0 and A0_0.work.endFestivalIndex > 0 then
    A0_0:_preloadItemSpreadSheetContainer("gcSealShopItem", 0, A0_0.work.startFestivalIndex, A0_0.work.endFestivalIndex)
  end
  if A0_0.work.startImportantIndex > 0 and A0_0.work.endImportantIndex > 0 then
    A0_0:_preloadItemSpreadSheetContainer("gcSealShopItem", 0, A0_0.work.startImportantIndex, A0_0.work.endImportantIndex)
  end
end
function PopulaceCompanyShop._onFinalize(A0_2)
  if A0_2.work.startSuppliIndex > 0 and 0 < A0_2.work.endSuppliIndex or 0 < A0_2.work.startArmIndex and 0 < A0_2.work.endArmIndex or 0 < A0_2.work.startFestivalIndex and 0 < A0_2.work.endFestivalIndex or 0 < A0_2.work.startImportantIndex and 0 < A0_2.work.endImportantIndex then
    A0_2:_releaseItemSpreadSheetContainer()
  end
  if 0 < A0_2.work.startImportantIndex and 0 < A0_2.work.endImportantIndex then
    gcSealShopItemSheet:_unloadKey(A0_2.work.startImportantIndex, A0_2.work.endImportantIndex)
  end
  if 0 < A0_2.work.startFestivalIndex and 0 < A0_2.work.endFestivalIndex then
    gcSealShopItemSheet:_unloadKey(A0_2.work.startFestivalIndex, A0_2.work.endFestivalIndex)
  end
  if 0 < A0_2.work.startArmIndex and 0 < A0_2.work.endArmIndex then
    gcSealShopItemSheet:_unloadKey(A0_2.work.startArmIndex, A0_2.work.endArmIndex)
  end
  if A0_2.work.startSuppliIndex > 0 and 0 < A0_2.work.endSuppliIndex then
    gcSealShopItemSheet:_unloadKey(A0_2.work.startSuppliIndex, A0_2.work.endSuppliIndex)
  end
  A0_2:_callSuperClassFunc("_onFinalize")
end
function PopulaceCompanyShop.eventTalkStepCantUse(A0_3)
  local L1_4, L2_5
  L1_4 = 5
  L2_5 = worldMaster
  L2_5 = L2_5._getMyPlayer
  L2_5 = L2_5(L2_5)
  if A0_3:getActorClassId() == 1500202 then
    L1_4 = 5
    break
  else
  end
  if A0_3:getActorClassId() == 1500203 then
    L1_4 = 6
    break
  else
  end
  if A0_3:getActorClassId() == 1500201 then
    L1_4 = 7
    do break end
    break
  else
  end
  A0_3:startCliantTalkTurn(2, L2_5)
  A0_3:_runCharaScheduler(353959936)
  A0_3:say(A0_3, L1_4, 0)
  return 0
end
function PopulaceCompanyShop.eventTalkPreJoin(A0_6)
  local L1_7, L2_8
  L1_7 = 2
  L2_8 = worldMaster
  L2_8 = L2_8._getMyPlayer
  L2_8 = L2_8(L2_8)
  A0_6.work.rankDiv = 0
  if A0_6:getActorClassId() == 1500202 then
    if A0_6:isUpperRank(A0_6.work.townNumber, A0_6.work.companyRank) == true then
      L1_7 = 2
    else
      L1_7 = 87
      do break end
      else
      end
      if A0_6:getActorClassId() == 1500203 then
        if A0_6:isUpperRank(A0_6.work.townNumber, A0_6.work.companyRank) == true then
          L1_7 = 3
        else
          L1_7 = 65
          do break end
          else
          end
          if A0_6:getActorClassId() == 1500201 then
            if A0_6:isUpperRank(A0_6.work.townNumber, A0_6.work.companyRank) == true then
              L1_7 = 4
            else
              L1_7 = 66
              do break end
              break
            end
          else
          end
        end
    end
  A0_6:startCliantTalkTurn(2, L2_8)
  A0_6:_runCharaScheduler(353959936)
  A0_6:say(A0_6, L1_7, 0)
  return 0
end
function PopulaceCompanyShop.eventTalkPreJoinQuest(A0_9)
  local L1_10, L2_11
  L1_10 = 50
  L2_11 = worldMaster
  L2_11 = L2_11._getMyPlayer
  L2_11 = L2_11(L2_11)
  A0_9.work.rankDiv = 0
  if A0_9:getActorClassId() == 1500202 then
    L1_10 = 50
    break
  else
  end
  if A0_9:getActorClassId() == 1500203 then
    if A0_9:isUpperRank(A0_9.work.townNumber, A0_9.work.companyRank) == true then
      L1_10 = 51
    else
      L1_10 = 71
      do break end
      else
      end
      if A0_9:getActorClassId() == 1500201 then
        if A0_9:isUpperRank(A0_9.work.townNumber, A0_9.work.companyRank) == true then
          L1_10 = 52
        else
          L1_10 = 72
          do break end
          break
        end
      else
      end
    end
  A0_9:startCliantTalkTurn(2, L2_11)
  A0_9:_runCharaScheduler(353959936)
  A0_9:say(A0_9, L1_10, 0)
  return 0
end
function PopulaceCompanyShop.eventTalkJoined(A0_12, A1_13)
  local L2_14, L3_15, L4_16
  L2_14 = 2
  L3_15 = worldMaster
  L4_16 = L3_15
  L3_15 = L3_15._getMyPlayer
  L3_15 = L3_15(L4_16)
  L4_16 = A0_12.work
  L4_16.rankDiv = 0
  L4_16 = A0_12.getActorClassId
  L4_16 = L4_16(A0_12)
  if L4_16 == 1500202 then
    if A0_12:isUpperRank(A0_12.work.townNumber, A0_12.work.companyRank) == true then
      L2_14 = 2
    else
      L2_14 = 87
      do break end
      else
      end
      if L4_16 == 1500203 then
        if A0_12:isUpperRank(A0_12.work.townNumber, A0_12.work.companyRank) == true then
          L2_14 = 3
        else
          L2_14 = 65
          do break end
          else
          end
          if L4_16 == 1500201 then
            if A0_12:isUpperRank(A0_12.work.townNumber, A0_12.work.companyRank) == true then
              L2_14 = 4
            else
              L2_14 = 66
              do break end
              break
            end
          else
          end
        end
    end
  L4_16 = A0_12.startCliantTalkTurn
  L4_16(A0_12, 2, L3_15)
  L4_16 = A0_12.doSalute
  L4_16 = L4_16(A0_12, A0_12.work.townNumber, A0_12.work.companyRank)
  A0_12:say(A0_12, L2_14, 0)
  if L4_16 ~= 0 then
    A0_12:_waitForCharaSchedulerFinished(L4_16)
  end
  return 0
end
function PopulaceCompanyShop.eventTalkFestival(A0_17)
  local L1_18, L2_19
  L1_18 = 53
  L2_19 = worldMaster
  L2_19 = L2_19._getMyPlayer
  L2_19 = L2_19(L2_19)
  A0_17.work.rankDiv = 0
  if A0_17:getActorClassId() == 1500202 then
    L1_18 = 53
    break
  else
  end
  if A0_17:getActorClassId() == 1500203 then
    L1_18 = 54
    break
  else
  end
  if A0_17:getActorClassId() == 1500201 then
    if A0_17:isUpperRank(A0_17.work.townNumber, A0_17.work.companyRank) == true then
      L1_18 = 55
    else
      L1_18 = 73
      do break end
      break
    end
  else
  end
  A0_17:startCliantTalkTurn(2, L2_19)
  A0_17:_runCharaScheduler(353959936)
  A0_17:say(A0_17, L1_18, 0)
  return 0
end
function PopulaceCompanyShop.eventTalkFestival2(A0_20)
  local L1_21, L2_22
  L1_21 = 56
  L2_22 = worldMaster
  L2_22 = L2_22._getMyPlayer
  L2_22 = L2_22(L2_22)
  A0_20.work.rankDiv = 0
  if A0_20:getActorClassId() == 1500202 then
    L1_21 = 56
    break
  else
  end
  if A0_20:getActorClassId() == 1500203 then
    L1_21 = 57
    break
  else
  end
  if A0_20:getActorClassId() == 1500201 then
    if A0_20:isUpperRank(A0_20.work.townNumber, A0_20.work.companyRank) == true then
      L1_21 = 58
    else
      L1_21 = 74
      do break end
      break
    end
  else
  end
  A0_20:startCliantTalkTurn(2, L2_22)
  A0_20:_runCharaScheduler(353959936)
  A0_20:say(A0_20, L1_21, 0)
  return 0
end
function PopulaceCompanyShop.eventTalkMainMenu(A0_23, A1_24, A2_25)
  local L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35
  L3_26 = 8
  L4_27 = 118
  L5_28 = 38
  L6_29 = 39
  L7_30 = 40
  L8_31 = 41
  L9_32 = worldMaster
  L10_33 = L9_32
  L9_32 = L9_32._getMyPlayer
  L9_32 = L9_32(L10_33)
  L10_33 = 0
  L12_35 = A0_23
  L11_34 = A0_23.getActorClassId
  L11_34 = L11_34(L12_35)
  if L11_34 == 1500202 then
    L3_26 = 8
    L4_27 = 118
    L12_35 = A0_23.isUpperRank
    L12_35 = L12_35(A0_23, A0_23.work.townNumber, A0_23.work.companyRank)
    if L12_35 == true then
      L5_28 = 38
      L6_29 = 39
      L7_30 = 40
      L8_31 = 41
    else
      L5_28 = 106
      L6_29 = 107
      L7_30 = 108
      L8_31 = 109
      do break end
      else
      end
      if L11_34 == 1500203 then
        L3_26 = 13
        L4_27 = 126
        L12_35 = A0_23.isUpperRank
        L12_35 = L12_35(A0_23, A0_23.work.townNumber, A0_23.work.companyRank)
        if L12_35 == true then
          L5_28 = 42
          L6_29 = 43
          L7_30 = 44
          L8_31 = 45
        else
          L5_28 = 79
          L6_29 = 80
          L7_30 = 67
          L8_31 = 81
          do break end
          else
          end
          if L11_34 == 1500201 then
            L3_26 = 18
            L4_27 = 134
            L12_35 = A0_23.isUpperRank
            L12_35 = L12_35(A0_23, A0_23.work.townNumber, A0_23.work.companyRank)
            if L12_35 == true then
              L5_28 = 46
              L6_29 = 47
              L7_30 = 48
              L8_31 = 49
            else
              L5_28 = 68
              L6_29 = 82
              L7_30 = 69
              L8_31 = 70
              do break end
              break
            end
          else
          end
        end
    end
  L11_34 = 0
  L12_35 = 1
  if A0_23.work.rankDiv ~= 0 then
    L11_34 = 1
    L12_35 = A0_23.work.rankDiv
  end
  repeat
    if L11_34 == 0 then
      L10_33 = worldMaster:askRestrictChoices(A0_23, A0_23, L3_26, true, false, true, true)
      if type(L10_33) == "nil" then
        return -1
      elseif L10_33 == 1 then
        L11_34 = 1
        L12_35 = 1
      elseif L10_33 == 2 then
        return 2
      elseif L10_33 == 3 then
        L11_34 = 3
      else
        do return -1 end
        do break end
        else
        end
        if L11_34 == 1 then
          L10_33 = worldMaster:askMultipleTextMacro(A0_23, A0_23, L12_35, L4_27, 7, 1, true, true, true, true, false, false, true, 0, 0, 0, 0, 0, 0, 0)
          if type(L10_33) == "nil" then
          elseif L10_33 > 0 and L10_33 < 7 then
            A0_23.work.rankDiv = L10_33
            return 1
          end
          L11_34 = 0
          break
        else
        end
        if L11_34 == 3 then
          A0_23:say(A0_23, L5_28, 0)
          A0_23:say(A0_23, L6_29, 0)
          A0_23:say(A0_23, L7_30, 0)
          A0_23:say(A0_23, L8_31, 0)
          L11_34 = 0
          do break end
          break
        else
        end
      end
  until L11_34 < 0
  return -1
end
function PopulaceCompanyShop.eventShopMenuOpen(A0_36)
  if worldMaster:_getSpecialEventWork(9) == 8 then
    A0_36.work.eventFlag = 8
  elseif worldMaster:_getSpecialEventWork(9) == 11 then
    A0_36.work.eventFlag = 11
  else
    A0_36.work.eventFlag = 0
  end
  return (desktopWidget:openEventModeWidgetYield("Ask/GrandCompanyShopWidget", A0_36))
end
function PopulaceCompanyShop.eventShopMenuAsk(A0_37)
  local L1_38, L2_39
  L1_38 = desktopWidget
  L2_39 = L1_38
  L1_38 = L1_38.selectEventModeWidgetYield
  L2_39 = L1_38(L2_39, "Ask/GrandCompanyShopWidget")
  if L1_38 == false then
    L2_39 = -1
  end
  return L1_38, L2_39
end
function PopulaceCompanyShop.eventShopMenuClose(A0_40)
  desktopWidget:closeEventModeWidget("Ask/GrandCompanyShopWidget")
end
function PopulaceCompanyShop.eventGuideChocoboWhistle(A0_41, A1_42)
  local L2_43, L3_44, L4_45
  L2_43 = desktopWidget
  L3_44 = L2_43
  L2_43 = L2_43.closeEventModeWidget
  L4_45 = "Ask/GrandCompanyShopWidget"
  L2_43(L3_44, L4_45)
  L3_44 = A0_41
  L2_43 = A0_41._wait
  L4_45 = 1
  L2_43(L3_44, L4_45)
  L2_43 = 59
  L3_44 = 60
  L4_45 = worldMaster
  L4_45 = L4_45._getMyPlayer
  L4_45 = L4_45(L4_45)
  if A0_41:getActorClassId() == 1500202 then
    if A0_41:isUpperRank(A0_41.work.townNumber, A0_41.work.companyRank) == true then
      L2_43 = 59
      L3_44 = 60
    else
      L2_43 = 110
      L3_44 = 111
      do break end
      else
      end
      if A0_41:getActorClassId() == 1500203 then
        if A0_41:isUpperRank(A0_41.work.townNumber, A0_41.work.companyRank) == true then
          L2_43 = 61
          L3_44 = 62
        else
          L2_43 = 85
          L3_44 = 86
          do break end
          else
          end
          if A0_41:getActorClassId() == 1500201 then
            if A0_41:isUpperRank(A0_41.work.townNumber, A0_41.work.companyRank) == true then
              L2_43 = 63
              L3_44 = 64
            else
              L2_43 = 75
              L3_44 = 76
              do break end
              break
            end
          else
          end
        end
    end
  A0_41:startCliantTalkTurn(2, L4_45)
  A0_41:_runCharaScheduler(353959936)
  A0_41:say(A0_41, L2_43, 0)
  A0_41:_runCharaScheduler(353959936)
  A0_41:say(A0_41, L3_44, 0)
  return 0
end
function PopulaceCompanyShop.eventGuideTownTransport(A0_46, A1_47)
  local L2_48, L3_49, L4_50
  L2_48 = desktopWidget
  L3_49 = L2_48
  L2_48 = L2_48.closeEventModeWidget
  L4_50 = "Ask/GrandCompanyShopWidget"
  L2_48(L3_49, L4_50)
  L3_49 = A0_46
  L2_48 = A0_46._wait
  L4_50 = 1
  L2_48(L3_49, L4_50)
  L2_48 = 88
  L3_49 = 103
  L4_50 = worldMaster
  L4_50 = L4_50._getMyPlayer
  L4_50 = L4_50(L4_50)
  if A0_46:getActorClassId() == 1500202 then
    if A0_46:isUpperRank(A0_46.work.townNumber, A0_46.work.companyRank) == true then
      L2_48 = 88
      L3_49 = 103
    else
      L2_48 = 112
      L3_49 = 113
      do break end
      else
      end
      if A0_46:getActorClassId() == 1500203 then
        if A0_46:isUpperRank(A0_46.work.townNumber, A0_46.work.companyRank) == true then
          L2_48 = 89
          L3_49 = 104
        else
          L2_48 = 114
          L3_49 = 115
          do break end
          else
          end
          if A0_46:getActorClassId() == 1500201 then
            if A0_46:isUpperRank(A0_46.work.townNumber, A0_46.work.companyRank) == true then
              L2_48 = 90
              L3_49 = 91
            else
              L2_48 = 116
              L3_49 = 117
              do break end
              break
            end
          else
          end
        end
    end
  A0_46:startCliantTalkTurn(2, L4_50)
  A0_46:_runCharaScheduler(353959936)
  A0_46:say(A0_46, L2_48, 0, A1_47)
  A0_46:_runCharaScheduler(353959936)
  A0_46:say(A0_46, L3_49, 0)
  return 0
end
function PopulaceCompanyShop.eventAskChocoboCustomize(A0_51, A1_52, A2_53)
  local L3_54, L4_55, L5_56, L6_57, L7_58
  L3_54 = desktopWidget
  L4_55 = L3_54
  L3_54 = L3_54.closeEventModeWidget
  L5_56 = "Ask/GrandCompanyShopWidget"
  L3_54(L4_55, L5_56)
  L4_55 = A0_51
  L3_54 = A0_51._wait
  L5_56 = 1
  L3_54(L4_55, L5_56)
  L3_54 = 92
  L4_55 = 93
  L5_56 = worldMaster
  L6_57 = L5_56
  L5_56 = L5_56._getMyPlayer
  L5_56 = L5_56(L6_57)
  L7_58 = A0_51
  L6_57 = A0_51.getActorClassId
  L6_57 = L6_57(L7_58)
  if L6_57 == 1500202 then
    L3_54 = 92
    L4_55 = 93
    break
  else
  end
  if L6_57 == 1500203 then
    L3_54 = 97
    L4_55 = 98
    break
  else
  end
  if L6_57 == 1500201 then
    L3_54 = 100
    L4_55 = 101
    do break end
    break
  else
  end
  L6_57 = false
  L7_58 = A0_51.startCliantTalkTurn
  L7_58(A0_51, 2, L5_56)
  L7_58 = A0_51._runCharaScheduler
  L7_58(A0_51, 353959936)
  L7_58 = A0_51.say
  L7_58(A0_51, A0_51, L3_54, 0, A1_52)
  if L6_57 == false then
    L7_58 = A0_51._runCharaScheduler
    L7_58(A0_51, 353959936)
    L7_58 = A0_51.say
    L7_58(A0_51, A0_51, L4_55, 0)
  end
  L7_58 = worldMaster
  L7_58 = L7_58.askMultipleTextMacro
  L7_58 = L7_58(L7_58, A0_51, A0_51, 3, 94, 2, 1, true, true, A1_52, A2_53, A0_51.work.townNumber, 0, 0)
  if type(L7_58) == "nil" then
    return 0
  elseif L7_58 == 1 then
    return 1
  end
  return 0
end
function PopulaceCompanyShop.eventChocoboCustomize(A0_59)
  local L1_60, L2_61
  L1_60 = 88
  L2_61 = worldMaster
  L2_61 = L2_61._getMyPlayer
  L2_61 = L2_61(L2_61)
  if A0_59:getActorClassId() == 1500202 then
    L1_60 = 105
    break
  else
  end
  if A0_59:getActorClassId() == 1500203 then
    L1_60 = 99
    break
  else
  end
  if A0_59:getActorClassId() == 1500201 then
    L1_60 = 102
    do break end
    break
  else
  end
  A0_59:startCliantTalkTurn(2, L2_61)
  A0_59:_runCharaScheduler(353959936)
  A0_59:say(A0_59, L1_60, 0)
  return 0
end
function PopulaceCompanyShop.getGrandCompanyNumber(A0_62)
  return A0_62.work.townNumber
end
function PopulaceCompanyShop.getShopItemStartIndex(A0_63, A1_64)
  local L2_65
  L2_65 = A0_63.work
  L2_65 = L2_65.townNumber
  if L2_65 == 1 then
    if A1_64 == 1 then
      L2_65 = A0_63.work
      L2_65 = L2_65.rankDiv
      if L2_65 == 1 then
        L2_65 = 100001
        return L2_65
      else
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 2 then
          L2_65 = 100030
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 3 then
            L2_65 = 0
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 4 then
              L2_65 = 100032
              return L2_65
            end
          end
        end
      end
    elseif A1_64 == 2 then
      L2_65 = A0_63.work
      L2_65 = L2_65.rankDiv
      if L2_65 == 1 then
        L2_65 = 101001
        return L2_65
      else
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 2 then
          L2_65 = 101022
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 3 then
            L2_65 = 101052
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 4 then
              L2_65 = 101084
              return L2_65
            end
          end
        end
      end
    elseif A1_64 == 3 then
      L2_65 = A0_63.work
      L2_65 = L2_65.rankDiv
      if L2_65 == 1 then
        L2_65 = 102001
        return L2_65
      else
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 2 then
          L2_65 = 102002
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 3 then
            L2_65 = 0
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 4 then
              L2_65 = 0
              return L2_65
            end
          end
        end
      end
    elseif A1_64 == 4 then
      L2_65 = A0_63.work
      L2_65 = L2_65.rankDiv
      if L2_65 == 1 then
        L2_65 = 0
        return L2_65
      else
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 2 then
          L2_65 = 103001
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 3 then
            L2_65 = 103003
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 4 then
              L2_65 = 0
              return L2_65
            end
          end
        end
      end
    end
  else
    L2_65 = A0_63.work
    L2_65 = L2_65.townNumber
    if L2_65 == 2 then
      if A1_64 == 1 then
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 1 then
          L2_65 = 200001
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 2 then
            L2_65 = 200030
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 3 then
              L2_65 = 0
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 4 then
                L2_65 = 200032
                return L2_65
              end
            end
          end
        end
      elseif A1_64 == 2 then
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 1 then
          L2_65 = 201001
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 2 then
            L2_65 = 201022
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 3 then
              L2_65 = 201052
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 4 then
                L2_65 = 201084
                return L2_65
              end
            end
          end
        end
      elseif A1_64 == 3 then
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 1 then
          L2_65 = 202001
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 2 then
            L2_65 = 202002
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 3 then
              L2_65 = 0
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 4 then
                L2_65 = 0
                return L2_65
              end
            end
          end
        end
      elseif A1_64 == 4 then
        L2_65 = A0_63.work
        L2_65 = L2_65.rankDiv
        if L2_65 == 1 then
          L2_65 = 0
          return L2_65
        else
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 2 then
            L2_65 = 203001
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 3 then
              L2_65 = 203003
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 4 then
                L2_65 = 0
                return L2_65
              end
            end
          end
        end
      end
    else
      L2_65 = A0_63.work
      L2_65 = L2_65.townNumber
      if L2_65 == 3 then
        if A1_64 == 1 then
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 1 then
            L2_65 = 300001
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 2 then
              L2_65 = 300030
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 3 then
                L2_65 = 0
                return L2_65
              else
                L2_65 = A0_63.work
                L2_65 = L2_65.rankDiv
                if L2_65 == 4 then
                  L2_65 = 300032
                  return L2_65
                end
              end
            end
          end
        elseif A1_64 == 2 then
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 1 then
            L2_65 = 301001
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 2 then
              L2_65 = 301022
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 3 then
                L2_65 = 301052
                return L2_65
              else
                L2_65 = A0_63.work
                L2_65 = L2_65.rankDiv
                if L2_65 == 4 then
                  L2_65 = 301084
                  return L2_65
                end
              end
            end
          end
        elseif A1_64 == 3 then
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 1 then
            L2_65 = 302001
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 2 then
              L2_65 = 302002
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 3 then
                L2_65 = 0
                return L2_65
              else
                L2_65 = A0_63.work
                L2_65 = L2_65.rankDiv
                if L2_65 == 4 then
                  L2_65 = 0
                  return L2_65
                end
              end
            end
          end
        elseif A1_64 == 4 then
          L2_65 = A0_63.work
          L2_65 = L2_65.rankDiv
          if L2_65 == 1 then
            L2_65 = 0
            return L2_65
          else
            L2_65 = A0_63.work
            L2_65 = L2_65.rankDiv
            if L2_65 == 2 then
              L2_65 = 303001
              return L2_65
            else
              L2_65 = A0_63.work
              L2_65 = L2_65.rankDiv
              if L2_65 == 3 then
                L2_65 = 303003
                return L2_65
              else
                L2_65 = A0_63.work
                L2_65 = L2_65.rankDiv
                if L2_65 == 4 then
                  L2_65 = 0
                  return L2_65
                end
              end
            end
          end
        end
      end
    end
  end
  L2_65 = 0
  return L2_65
end
function PopulaceCompanyShop.getShopItemEndIndex(A0_66, A1_67)
  local L2_68
  L2_68 = A0_66.work
  L2_68 = L2_68.townNumber
  if L2_68 == 1 then
    if A1_67 == 1 then
      L2_68 = A0_66.work
      L2_68 = L2_68.rankDiv
      if L2_68 == 1 then
        L2_68 = 100029
        return L2_68
      else
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 2 then
          L2_68 = 100031
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 3 then
            L2_68 = 0
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 4 then
              L2_68 = 100032
              return L2_68
            end
          end
        end
      end
    elseif A1_67 == 2 then
      L2_68 = A0_66.work
      L2_68 = L2_68.rankDiv
      if L2_68 == 1 then
        L2_68 = 101021
        return L2_68
      else
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 2 then
          L2_68 = 101051
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 3 then
            L2_68 = 101083
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 4 then
              L2_68 = 101094
              return L2_68
            end
          end
        end
      end
    elseif A1_67 == 3 then
      L2_68 = A0_66.work
      L2_68 = L2_68.rankDiv
      if L2_68 == 1 then
        L2_68 = 102001
        return L2_68
      else
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 2 then
          L2_68 = 102002
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 3 then
            L2_68 = 0
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 4 then
              L2_68 = 0
              return L2_68
            end
          end
        end
      end
    elseif A1_67 == 4 then
      L2_68 = A0_66.work
      L2_68 = L2_68.rankDiv
      if L2_68 == 1 then
        L2_68 = 0
        return L2_68
      else
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 2 then
          L2_68 = 103002
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 3 then
            L2_68 = 103006
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 4 then
              L2_68 = 0
              return L2_68
            end
          end
        end
      end
    end
  else
    L2_68 = A0_66.work
    L2_68 = L2_68.townNumber
    if L2_68 == 2 then
      if A1_67 == 1 then
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 1 then
          L2_68 = 200029
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 2 then
            L2_68 = 200031
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 3 then
              L2_68 = 0
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 4 then
                L2_68 = 200032
                return L2_68
              end
            end
          end
        end
      elseif A1_67 == 2 then
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 1 then
          L2_68 = 201021
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 2 then
            L2_68 = 201051
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 3 then
              L2_68 = 201083
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 4 then
                L2_68 = 201094
                return L2_68
              end
            end
          end
        end
      elseif A1_67 == 3 then
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 1 then
          L2_68 = 202001
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 2 then
            L2_68 = 202002
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 3 then
              L2_68 = 0
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 4 then
                L2_68 = 0
                return L2_68
              end
            end
          end
        end
      elseif A1_67 == 4 then
        L2_68 = A0_66.work
        L2_68 = L2_68.rankDiv
        if L2_68 == 1 then
          L2_68 = 0
          return L2_68
        else
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 2 then
            L2_68 = 203002
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 3 then
              L2_68 = 203006
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 4 then
                L2_68 = 0
                return L2_68
              end
            end
          end
        end
      end
    else
      L2_68 = A0_66.work
      L2_68 = L2_68.townNumber
      if L2_68 == 3 then
        if A1_67 == 1 then
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 1 then
            L2_68 = 300029
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 2 then
              L2_68 = 300031
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 3 then
                L2_68 = 0
                return L2_68
              else
                L2_68 = A0_66.work
                L2_68 = L2_68.rankDiv
                if L2_68 == 4 then
                  L2_68 = 300032
                  return L2_68
                end
              end
            end
          end
        elseif A1_67 == 2 then
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 1 then
            L2_68 = 301021
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 2 then
              L2_68 = 301051
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 3 then
                L2_68 = 301083
                return L2_68
              else
                L2_68 = A0_66.work
                L2_68 = L2_68.rankDiv
                if L2_68 == 4 then
                  L2_68 = 301094
                  return L2_68
                end
              end
            end
          end
        elseif A1_67 == 3 then
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 1 then
            L2_68 = 302001
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 2 then
              L2_68 = 302002
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 3 then
                L2_68 = 0
                return L2_68
              else
                L2_68 = A0_66.work
                L2_68 = L2_68.rankDiv
                if L2_68 == 4 then
                  L2_68 = 0
                  return L2_68
                end
              end
            end
          end
        elseif A1_67 == 4 then
          L2_68 = A0_66.work
          L2_68 = L2_68.rankDiv
          if L2_68 == 1 then
            L2_68 = 0
            return L2_68
          else
            L2_68 = A0_66.work
            L2_68 = L2_68.rankDiv
            if L2_68 == 2 then
              L2_68 = 303002
              return L2_68
            else
              L2_68 = A0_66.work
              L2_68 = L2_68.rankDiv
              if L2_68 == 3 then
                L2_68 = 303006
                return L2_68
              else
                L2_68 = A0_66.work
                L2_68 = L2_68.rankDiv
                if L2_68 == 4 then
                  L2_68 = 0
                  return L2_68
                end
              end
            end
          end
        end
      end
    end
  end
  L2_68 = 0
  return L2_68
end
function PopulaceCompanyShop.getShopSellingItemMax(A0_69, A1_70)
  if A0_69:getShopItemStartIndex(A1_70) ~= 0 and A0_69:getShopItemEndIndex(A1_70) ~= 0 then
  end
  return 0
end
function PopulaceCompanyShop.getShopSellingItemDetail(A0_71, A1_72, A2_73, A3_74)
  local L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82
  L4_75 = true
  L6_77 = A0_71
  L5_76 = A0_71.getShopItemStartIndex
  L7_78 = A2_73
  L5_76 = L5_76(L6_77, L7_78)
  L6_77 = L5_76 + A3_74
  L6_77 = L6_77 - 1
  L7_78 = A0_71.work
  L7_78 = L7_78.rankDiv
  if L7_78 > 1 then
    L7_78 = gcSealShopItemSheet
    L8_79 = L7_78
    L7_78 = L7_78._loadKeyTemporarily
    L9_80 = L6_77
    L10_81 = L6_77
    L7_78(L8_79, L9_80, L10_81)
  end
  L7_78 = gcSealShopItemSheet
  L8_79 = L7_78
  L7_78 = L7_78._getData
  L9_80 = L6_77
  L10_81 = 0
  L7_78 = L7_78(L8_79, L9_80, L10_81)
  L8_79 = gcSealShopItemSheet
  L9_80 = L8_79
  L8_79 = L8_79._getData
  L10_81 = L6_77
  L11_82 = 1
  L8_79 = L8_79(L9_80, L10_81, L11_82)
  L9_80 = gcSealShopItemSheet
  L10_81 = L9_80
  L9_80 = L9_80._getData
  L11_82 = L6_77
  L9_80 = L9_80(L10_81, L11_82, 2)
  L10_81 = gcSealShopItemSheet
  L11_82 = L10_81
  L10_81 = L10_81._getData
  L10_81 = L10_81(L11_82, L6_77, 3)
  L11_82 = gcSealShopItemSheet
  L11_82 = L11_82._getData
  L11_82 = L11_82(L11_82, L6_77, 4)
  if A2_73 == 4 then
    if A1_72:hasItem(101, L7_78, 1) == true then
      L4_75 = false
    end
    if L7_78 == 2001004 then
    elseif L7_78 == 2001005 then
    else
    end
    if L7_78 == 2001006 then
      if A1_72:hasItem(101, 2001007, 1) == true then
        L4_75 = false
        do break end
        elseif L7_78 == 2001017 then
        elseif L7_78 == 2001018 then
        elseif L7_78 == 2001019 then
        elseif L7_78 == 2001020 then
        elseif L7_78 == 2001021 then
        elseif L7_78 == 2001022 then
        elseif L7_78 == 2001023 then
        elseif L7_78 == 2001024 then
        else
        end
        if L7_78 == 2001025 and A1_72:hasItem(101, 2001007, 1) == false then
          L4_75 = false
          break
        else
        end
      else
      end
  else
  end
  if gcSealShopItemSheet:_getData(L6_77, 6) ~= 0 then
    if gcSealShopItemSheet:_getData(L6_77, 6) <= A0_71.work.eventFlag then
      L4_75 = true
    else
      L4_75 = false
    end
  end
  return L7_78, L8_79, L9_80, L10_81, L11_82, L4_75, L6_77
end
function PopulaceCompanyShop.eventTalkStepBreak(A0_83)
  A0_83:finishCliantTalkTurn()
  return 0
end
