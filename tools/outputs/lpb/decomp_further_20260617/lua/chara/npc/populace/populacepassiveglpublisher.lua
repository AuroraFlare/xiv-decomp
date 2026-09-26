require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulacePassiveGLPublisher", "NpcBaseClass")
function PopulacePassiveGLPublisher.getMaxGuildlevePackNum(A0_0)
  local L1_1
  L1_1 = 8
  return L1_1
end
function PopulacePassiveGLPublisher.getMaxRankBand(A0_2)
  local L1_3
  L1_3 = 3
  return L1_3
end
function PopulacePassiveGLPublisher.getPassiveGuildleveVariation(A0_4, A1_5, A2_6)
  if type(A2_6) ~= "number" or A2_6 < 1 or A2_6 > 8 then
    return 1
  end
  return ({
    1,
    2,
    3,
    4,
    1,
    2,
    3,
    4
  })[A2_6]
end
function PopulacePassiveGLPublisher.initForEvent(A0_7)
  local L1_8, L2_9
  L1_8 = {}
  L2_9 = {
    {
      "pre_leve_id",
      "array",
      8,
      "integer32"
    }
  }
  A0_7:initWork(L1_8, L2_9)
  A0_7:_loadTextDataPermanently(509, "populacePassiveGLPublisher")
  A0_7:_setGroundOn(false)
end
function PopulacePassiveGLPublisher.getPreGuildlevePackId(A0_10, A1_11)
  return ({
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    39,
    40,
    41,
    42
  })[A1_11]
end
function PopulacePassiveGLPublisher.getMaxCardNum(A0_12)
  local L1_13
  L1_13 = A0_12.work
  L1_13 = L1_13.pre_leve_id
  L1_13 = #L1_13
  return L1_13
end
function PopulacePassiveGLPublisher.getPreGuildleveId(A0_14, A1_15)
  local L2_16
  L2_16 = A0_14.work
  L2_16 = L2_16.pre_leve_id
  L2_16 = L2_16[A1_15]
  return L2_16
end
function PopulacePassiveGLPublisher.askOfferPack(A0_17, A1_18)
  return (desktopWidget:askGuildleveSelectPackNumber(A0_17, true))
end
function PopulacePassiveGLPublisher.askOfferRank(A0_19, A1_20)
  local L2_21, L3_22, L4_23
  L2_21 = 1
  L3_22 = 31
  L4_23 = {}
  L4_23 = {
    32,
    32,
    32,
    33
  }
  if 1 <= desktopWidget:askForEventMode(A0_19, A0_19, A0_19, 1, false, true, L3_22, L4_23, 0, 0, 0, 0, 1, 20, 40, 0) and desktopWidget:askForEventMode(A0_19, A0_19, A0_19, 1, false, true, L3_22, L4_23, 0, 0, 0, 0, 1, 20, 40, 0) <= A0_19:getMaxRankBand() then
    L2_21 = desktopWidget:askForEventMode(A0_19, A0_19, A0_19, 1, false, true, L3_22, L4_23, 0, 0, 0, 0, 1, 20, 40, 0)
  else
    L2_21 = nil
  end
  return L2_21
end
function PopulacePassiveGLPublisher.askOfferQuest(A0_24, A1_25, A2_26, ...)
  local L4_28, L5_29, L6_30, L7_31, L8_32, L9_33
  L4_28 = 0
  L5_29 = nil
  for L9_33 = 1, #L7_31 do
    A0_24.work.pre_leve_id[L9_33] = 0
  end
  L9_33 = ...
  for L9_33 = 1, L7_31(L8_32, L9_33, ...) do
    A0_24.work.pre_leve_id[L9_33] = select(L9_33, ...)
    if select(L9_33, ...) ~= 0 then
      L4_28 = L4_28 + 1
    end
  end
  if L4_28 > 0 then
  else
    return L6_30, L7_31
  end
  L9_33 = true
  if L6_30 == nil or L6_30 <= 0 then
    return
  end
  if L7_31 ~= nil and L7_31 ~= 0 then
    L9_33 = A0_24
    L9_33 = desktopWidget
    L9_33 = L9_33.askJournalDetailWidget
    L9_33 = L9_33(L9_33, 11, L7_31, L8_32)
    if L9_33 == true then
      return L6_30
    else
      return -1
    end
  end
end
function PopulacePassiveGLPublisher.confirmOffer(A0_34, A1_35, A2_36)
  if A0_34:askExtendWidget(A0_34, 7, 2, 1, 2, A2_36) == 1 then
    return true
  end
  return false
end
function PopulacePassiveGLPublisher.confirmMaxOffer(A0_37, A1_38)
  if A0_37:askExtendWidget(A0_37, 20, 2, 1, 2) == 1 then
    return true
  end
  return false
end
function PopulacePassiveGLPublisher.talkOfferWelcome(A0_39, A1_40, A2_41)
  local L3_42, L4_43
  L4_43 = A0_39
  L3_42 = A0_39.startCliantTalkTurn
  L3_42(L4_43, 2, A1_40)
  L4_43 = A0_39
  L3_42 = A0_39.getActorClassId
  L3_42 = L3_42(L4_43)
  L4_43 = L3_42
  if L4_43 == 1000455 then
    A0_39:say(A0_39, 1, 0, A2_41)
    break
  else
  end
  if L4_43 == 1000456 then
    A0_39:say(A0_39, 13, 0, A2_41)
    break
  else
  end
  if L4_43 == 1001372 then
    A0_39:say(A0_39, 15, 0, A2_41)
    do break end
    break
  else
  end
end
function PopulacePassiveGLPublisher.talkOfferDecide(A0_44)
  local L1_45, L2_46
  L2_46 = A0_44
  L1_45 = A0_44.getActorClassId
  L1_45 = L1_45(L2_46)
  L2_46 = L1_45
  if L2_46 == 1000455 then
    A0_44:say(A0_44, 2, 0)
    break
  else
  end
  if L2_46 == 1000456 then
    A0_44:say(A0_44, 14, 0)
    break
  else
  end
  if L2_46 == 1001372 then
    A0_44:say(A0_44, 16, 0)
    do break end
    break
  else
  end
end
function PopulacePassiveGLPublisher.talkOfferMaxOver(A0_47)
  local L1_48, L2_49
  L2_49 = A0_47
  L1_48 = A0_47.getActorClassId
  L1_48 = L1_48(L2_49)
  L2_49 = L1_48
  if L2_49 == 1000455 then
    A0_47:say(A0_47, 17, 0)
    break
  else
  end
  if L2_49 == 1000456 then
    A0_47:say(A0_47, 18, 0)
    break
  else
  end
  if L2_49 == 1001372 then
    A0_47:say(A0_47, 19, 0)
    do break end
    break
  else
  end
end
function PopulacePassiveGLPublisher.finishTalkTurn(A0_50)
  A0_50:finishCliantTalkTurn()
end
function PopulacePassiveGLPublisher.selectDiscardGuildleve(A0_51, A1_52)
  local L2_53, L3_54, L4_55, L5_56, L6_57, L7_58, L8_59, L9_60
  L2_53 = desktopWidget
  L3_54 = L2_53
  L2_53 = L2_53.askPassiveGuildleveReleaseWidget
  L3_54 = L2_53(L3_54)
  if L2_53 == true and L3_54 ~= nil then
    L5_56 = A1_52
    L4_55 = A1_52.getGuildleveQuestLength
    L4_55 = L4_55(L5_56)
    L5_56 = 0
    for L9_60 = 1, L4_55 do
      if A1_52:getGuildleveQuest(L9_60) ~= nil then
        L5_56 = L5_56 + 1
        if L5_56 == L3_54 then
          return (A1_52:getGuildleveQuest(L9_60))
        end
      end
    end
  end
  L4_55 = nil
  return L4_55
end
function PopulacePassiveGLPublisher.confirmJournal(A0_61, A1_62, A2_63, A3_64, A4_65, A5_66, A6_67, A7_68)
  if A1_62 == nil then
    return
  end
  if A2_63 < 1 or A2_63 > 4 then
    return
  end
  return (desktopWidget:askJournalDetailWidget(13, A1_62, A2_63, A4_65, A5_66, A6_67, A7_68))
end
function PopulacePassiveGLPublisher.askDiscardGuildleve(A0_69)
  if A0_69:askExtendWidget(A0_69, 25, 2, 1, 2) == 1 then
    return true
  end
  return false
end
function PopulacePassiveGLPublisher.confirmDiscardGuildleve(A0_70, A1_71, A2_72, A3_73)
  if A0_70:askExtendWidget(A0_70, 28, 2, 1, 2, A2_72, A3_73) == 1 then
    return true
  end
  return false
end
function PopulacePassiveGLPublisher.askRetryRegionalleve(A0_74, A1_75, A2_76)
  local L3_77, L4_78
  L3_77 = worldMaster:ask(A0_74, worldMaster, 50144, 2, A1_75, A2_76)
  if L3_77 == 1 then
    return L3_77, L4_78
  elseif L3_77 == 2 then
    L4_78 = worldMaster:ask(A0_74, worldMaster, 50149, 2, A1_75)
  end
  return L3_77, L4_78
end
