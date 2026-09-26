require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCompanySupply", "NpcBaseClass")
function PopulaceCompanySupply.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 7664, "populaceCompanySupply")
  L1_1 = {
    {"townNumber", "integer8"},
    {
      "companyRank",
      "integer8"
    },
    {"supplyMode", "integer8"}
  }
  A0_0:initWork(nil, L1_1)
  if A0_0:getActorClassId() == 1500210 then
    A0_0.work.townNumber = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500211 then
    A0_0.work.townNumber = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1500212 then
    A0_0.work.townNumber = 3
    break
  else
  end
  A0_0.work.townNumber = 0
  do break end
  A0_0.work.supplyMode = 1
  A0_0.work.companyRank = 33
  A0_0:_setGroundOn(false)
  itemGcExSupplySheet:_loadKeySemipermanently(1001, 1029)
  itemGcExSupplySheet:_loadKeySemipermanently(2001, 2018)
  itemGcExSupplySheet:_loadKeySemipermanently(3001, 3018)
  itemGcExSupplySheet:_loadKeySemipermanently(4001, 4014)
  A0_0:_preloadItemSpreadSheetContainer("itemGcExSupply", 0, 1001, 1029)
  A0_0:_preloadItemSpreadSheetContainer("itemGcExSupply", 0, 2001, 2018)
  A0_0:_preloadItemSpreadSheetContainer("itemGcExSupply", 0, 3001, 3018)
  A0_0:_preloadItemSpreadSheetContainer("itemGcExSupply", 0, 4001, 4014)
end
function PopulaceCompanySupply._onFinalize(A0_2)
  A0_2:_releaseItemSpreadSheetContainer()
  itemGcExSupplySheet:_unloadKey(4001, 4014)
  itemGcExSupplySheet:_unloadKey(3001, 3018)
  itemGcExSupplySheet:_unloadKey(2001, 2018)
  itemGcExSupplySheet:_unloadKey(1001, 1029)
  A0_2:_callSuperClassFunc("_onFinalize")
end
function PopulaceCompanySupply.eventTalkPreJoin(A0_3)
  local L1_4, L2_5
  L1_4 = 3
  L2_5 = worldMaster
  L2_5 = L2_5._getMyPlayer
  L2_5 = L2_5(L2_5)
  if A0_3:getActorClassId() == 1500210 then
    L1_4 = 3
    break
  else
  end
  if A0_3:getActorClassId() == 1500211 then
    L1_4 = 4
    break
  else
  end
  if A0_3:getActorClassId() == 1500212 then
    L1_4 = 5
    do break end
    break
  else
  end
  A0_3:startCliantTalkTurn(2, L2_5)
  A0_3:_runCharaScheduler(353959936)
  A0_3:say(A0_3, L1_4, 0)
  return 0
end
function PopulaceCompanySupply.eventTalkExclusive(A0_6)
  local L1_7, L2_8
  L1_7 = 9
  L2_8 = worldMaster
  L2_8 = L2_8._getMyPlayer
  L2_8 = L2_8(L2_8)
  if A0_6:getActorClassId() == 1500210 then
    L1_7 = 9
    break
  else
  end
  if A0_6:getActorClassId() == 1500211 then
    L1_7 = 10
    break
  else
  end
  if A0_6:getActorClassId() == 1500212 then
    L1_7 = 11
    do break end
    break
  else
  end
  A0_6:startCliantTalkTurn(2, L2_8)
  A0_6:_runCharaScheduler(353959936)
  A0_6:say(A0_6, L1_7, 0)
  return 0
end
function PopulaceCompanySupply.eventTalkJoined(A0_9, A1_10)
  local L2_11, L3_12, L4_13
  L2_11 = 6
  L3_12 = worldMaster
  L4_13 = L3_12
  L3_12 = L3_12._getMyPlayer
  L3_12 = L3_12(L4_13)
  L4_13 = A0_9.getActorClassId
  L4_13 = L4_13(A0_9)
  if L4_13 == 1500210 then
    L2_11 = 6
    break
  else
  end
  if L4_13 == 1500211 then
    L2_11 = 7
    break
  else
  end
  if L4_13 == 1500212 then
    L2_11 = 8
    do break end
    break
  else
  end
  L4_13 = A0_9.startCliantTalkTurn
  L4_13(A0_9, 2, L3_12)
  L4_13 = A0_9.doSalute
  L4_13 = L4_13(A0_9, A0_9.work.townNumber, A0_9.work.companyRank)
  A0_9:say(A0_9, L2_11, 0)
  if L4_13 ~= 0 then
    A0_9:_waitForCharaSchedulerFinished(L4_13)
  end
  return 0
end
function PopulaceCompanySupply.eventTalkStepBreak(A0_14)
  A0_14:finishCliantTalkTurn()
  return 0
end
function PopulaceCompanySupply.eventQuestItemMenuOpen(A0_15, A1_16, A2_17, A3_18, A4_19)
  A0_15.work.supplyMode = A4_19
  if A4_19 > 2 then
    A1_16 = 0
    A4_19 = 3
  end
  return (desktopWidget:openEventModeWidgetYield("Ask/QuestDeliveryWidget", A1_16, A2_17, A3_18, A4_19, A0_15))
end
function PopulaceCompanySupply.eventQuestItemMenuSelect(A0_20, A1_21, A2_22, A3_23)
  local L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30, L11_31, L12_32
  L4_24 = desktopWidget
  L5_25 = L4_24
  L4_24 = L4_24.selectEventModeWidgetYield
  L6_26 = "Ask/QuestDeliveryWidget"
  L7_27 = A1_21
  L8_28 = A2_22
  L9_29 = A3_23
  L10_30 = L4_24(L5_25, L6_26, L7_27, L8_28, L9_29)
  if L4_24 == false then
    L11_31 = false
    L12_32 = nil
    return L11_31, L12_32, nil, nil, nil
  else
    if L6_26 == 0 then
      L11_31 = false
      L12_32 = nil
      return L11_31, L12_32, nil, nil, nil
    end
    L11_31 = worldMaster
    L12_32 = L11_31
    L11_31 = L11_31._getMyPlayer
    L11_31 = L11_31(L12_32)
    L12_32 = L11_31._getItem
    L12_32 = L12_32(L11_31, L5_25, L6_26)
    if L12_32 == nil then
      return false, nil, nil, nil, nil
    end
    return L4_24, L7_27, L8_28, L10_30, L12_32
  end
end
function PopulaceCompanySupply.eventQuestItemMenuClose(A0_33)
  desktopWidget:closeEventModeWidget("Ask/QuestDeliveryWidget")
end
function PopulaceCompanySupply.getEventQuestSupplyMode(A0_34)
  return A0_34.work.supplyMode
end
function PopulaceCompanySupply.eventQuestSupplyItemActor(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40
  L2_37 = false
  L3_38 = 0
  L4_39 = _isInstanceOf
  L5_40 = A1_36
  L4_39 = L4_39(L5_40, "NormalItemBaseClass")
  if L4_39 == true then
    L5_40 = A1_36
    L4_39 = A1_36._isAlive
    L4_39 = L4_39(L5_40)
    if L4_39 == true then
      L5_40 = A1_36
      L4_39 = A1_36._getCatalogID
      L4_39 = L4_39(L5_40)
      L5_40 = A1_36._getNameIndex
      L5_40 = L5_40(A1_36)
      L2_37, L3_38 = A0_35:eventQuestSupplyItemID(L4_39, L5_40)
    else
    end
  else
  end
  L4_39 = L2_37
  L5_40 = L3_38
  return L4_39, L5_40
end
function PopulaceCompanySupply.eventQuestSupplyItemID(A0_41, A1_42, A2_43)
  local L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50, L10_51, L11_52, L12_53
  L3_44 = false
  L4_45 = 0
  L5_46 = A0_41.work
  L5_46 = L5_46.supplyMode
  L6_47 = 0
  L7_48 = 0
  L8_49 = L5_46
  if L8_49 == 3 then
    L7_48 = 2018
    L6_47 = L9_50
    break
  else
  end
  if L8_49 == 4 then
    L7_48 = 3018
    L6_47 = L9_50
    break
  else
  end
  if L8_49 == 5 then
    L7_48 = 4014
    L6_47 = L9_50
    break
  else
  end
  if L8_49 == 6 then
    L7_48 = 1029
    L6_47 = L9_50
    do break end
    break
  else
  end
  if L7_48 == 0 then
    L8_49 = L3_44
    return L8_49, L9_50
  end
  L8_49 = L6_47
  for L12_53 = L6_47, L7_48 do
    if itemGcExSupplySheet:_getData(L12_53, 0) == A1_42 then
      L3_44 = true
      L4_45 = itemGcExSupplySheet:_getData(L12_53, 1)
      if A2_43 > 1 then
        L4_45 = math:_ceil(L4_45 * 1.5)
      end
      break
    end
  end
  return L9_50, L10_51
end
