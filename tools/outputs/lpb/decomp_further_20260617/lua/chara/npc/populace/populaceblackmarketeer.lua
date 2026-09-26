require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceBlackMarketeer", "NpcBaseClass")
function PopulaceBlackMarketeer.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 9904, "populaceBlackMarketeer")
  L1_1 = {
    {"townNumber", "integer8"},
    {
      "supplyStart",
      "integer16"
    },
    {
      "supplyCount",
      "integer16"
    },
    {"armsStart", "integer16"},
    {"armsCount", "integer16"},
    {
      "festivalStart",
      "integer16"
    },
    {
      "festivalCount",
      "integer16"
    },
    {
      "importantStart",
      "integer16"
    },
    {
      "importantCount",
      "integer16"
    }
  }
  A0_0:initWork(nil, L1_1)
  if A0_0:getActorClassId() == 1500293 then
    A0_0.work.townNumber = 1
    A0_0.work.supplyStart = 1001
    A0_0.work.supplyCount = 5
    A0_0.work.armsStart = 1101
    A0_0.work.armsCount = 2
    A0_0.work.festivalStart = 0
    A0_0.work.festivalCount = 0
    A0_0.work.importantStart = 1301
    A0_0.work.importantCount = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500294 then
    A0_0.work.townNumber = 2
    A0_0.work.supplyStart = 2001
    A0_0.work.supplyCount = 5
    A0_0.work.armsStart = 2101
    A0_0.work.armsCount = 2
    A0_0.work.festivalStart = 0
    A0_0.work.festivalCount = 0
    A0_0.work.importantStart = 2301
    A0_0.work.importantCount = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500295 then
    A0_0.work.townNumber = 3
    A0_0.work.supplyStart = 3001
    A0_0.work.supplyCount = 5
    A0_0.work.armsStart = 3101
    A0_0.work.armsCount = 2
    A0_0.work.festivalStart = 0
    A0_0.work.festivalCount = 0
    A0_0.work.importantStart = 3301
    A0_0.work.importantCount = 1
    do break end
    break
  else
  end
end
function PopulaceBlackMarketeer._onFinalize(A0_2)
  A0_2:_callSuperClassFunc("_onFinalize")
end
function PopulaceBlackMarketeer.eventTalkWelcome(A0_3, A1_4)
  local L2_5
  L2_5 = A0_3.startCliantTalkTurn
  L2_5(A0_3, 1, A1_4)
  L2_5 = 2
  if A0_3.work.townNumber == 1 then
    L2_5 = 2
  elseif A0_3.work.townNumber == 2 then
    L2_5 = 8
  elseif A0_3.work.townNumber == 3 then
    L2_5 = 10
  end
  A0_3:_runCharaScheduler(353959936)
  A0_3:say(A0_3, L2_5, 0)
end
function PopulaceBlackMarketeer.eventSellItemAsk(A0_6, A1_7, A2_8, A3_9)
  local L4_10, L5_11, L6_12
  L4_10 = 0
  L6_12 = A1_7
  L5_11 = A1_7._getBelongGrandCompany
  L5_11 = L5_11(L6_12)
  repeat
    L6_12 = worldMaster
    L6_12 = L6_12.askMultipleTextMacro
    L6_12 = L6_12(L6_12, A0_6, A0_6, 1, 12, 3, 1, true, true, true, 0, A2_8, 0)
    L4_10 = L6_12
    L6_12 = type
    L6_12 = L6_12(L4_10)
    if L6_12 ~= "number" then
      L4_10 = 0
    end
    if L4_10 == 3 then
      L4_10 = 0
    end
    if L4_10 == 1 then
      break
    elseif L4_10 == 2 and L5_11 > 0 then
      L6_12 = A0_6._runCharaScheduler
      L6_12(A0_6, 353959936)
      L6_12 = A0_6.say
      L6_12(A0_6, A0_6, 20, 0, A2_8, A3_9)
      L6_12 = worldMaster
      L6_12 = L6_12.askMultipleTextMacro
      L6_12 = L6_12(L6_12, A0_6, A0_6, 1, 16, 2, 0, true, true, A2_8, A3_9, 0, 0, L5_11)
      if type(L6_12) ~= "number" then
        L6_12 = 0
      end
      if L6_12 == 1 then
        break
      end
    end
  until L4_10 < 1
  return L4_10
end
function PopulaceBlackMarketeer.eventAskMainMenu(A0_13, A1_14)
  local L2_15
  L2_15 = worldMaster
  L2_15 = L2_15.askMultipleTextMacro
  L2_15 = L2_15(L2_15, A0_13, A0_13, 1, 3, 3, 0, true, true, true)
  if type(L2_15) ~= "number" then
    L2_15 = 0
  end
  if L2_15 == 3 then
    L2_15 = 0
  end
  return L2_15
end
function PopulaceBlackMarketeer.eventTalkBye(A0_16, A1_17)
  local L2_18
  L2_18 = A0_16.startCliantTalkTurn
  L2_18(A0_16, 1, A1_17)
  L2_18 = 7
  if A0_16.work.townNumber == 1 then
    L2_18 = 7
  elseif A0_16.work.townNumber == 2 then
    L2_18 = 9
  elseif A0_16.work.townNumber == 3 then
    L2_18 = 11
  end
  A0_16:_runCharaScheduler(353959936)
  A0_16:say(A0_16, L2_18, 0)
end
function PopulaceBlackMarketeer.eventSealShopMenuOpen(A0_19)
  return (desktopWidget:openEventModeWidgetYield("Ask/GrandCompanyShopWidget", A0_19))
end
function PopulaceBlackMarketeer.eventSealShopMenuAsk(A0_20)
  local L1_21, L2_22
  L1_21 = desktopWidget
  L2_22 = L1_21
  L1_21 = L1_21.selectEventModeWidgetYield
  L2_22 = L1_21(L2_22, "Ask/GrandCompanyShopWidget")
  if L1_21 == false then
    L2_22 = -1
  end
  return L1_21, L2_22
end
function PopulaceBlackMarketeer.eventSealShopMenuClose(A0_23)
  desktopWidget:closeEventModeWidget("Ask/GrandCompanyShopWidget")
end
function PopulaceBlackMarketeer.eventGilShopMenuOpen(A0_24)
  return (desktopWidget:openEventModeWidgetYield("Ask/ShopBuyWidget", A0_24, 10, 1000001))
end
function PopulaceBlackMarketeer.eventGilShopMenuAsk(A0_25)
  local L1_26, L2_27, L3_28
  L1_26 = desktopWidget
  L2_27 = L1_26
  L1_26 = L1_26.selectEventModeWidgetYield
  L3_28 = "Ask/ShopBuyWidget"
  L3_28 = L1_26(L2_27, L3_28)
  if L1_26 == false then
    L2_27 = 0
    L3_28 = 0
  elseif L2_27 > 0 then
    L2_27 = A0_25:getSheetIndex(10, L2_27)
  end
  return L1_26, L2_27, L3_28
end
function PopulaceBlackMarketeer.eventGilShopMenuClose(A0_29)
  desktopWidget:closeEventModeWidget("Ask/ShopBuyWidget")
end
function PopulaceBlackMarketeer.getGrandCompanyNumber(A0_30)
  return (worldMaster:_getMyPlayer():_getBelongGrandCompany())
end
function PopulaceBlackMarketeer.getShopItemStartIndex(A0_31, A1_32)
  local L2_33
  if A1_32 == 1 then
    L2_33 = A0_31.work
    L2_33 = L2_33.supplyStart
    return L2_33
  elseif A1_32 == 10 then
    L2_33 = A0_31.work
    L2_33 = L2_33.supplyStart
    return L2_33
  end
  L2_33 = 0
  return L2_33
end
function PopulaceBlackMarketeer.getShopSellingItemMax(A0_34, A1_35, A2_36)
  local L3_37, L4_38
  if A1_35 == 1 then
    L3_37 = A0_34.work
    L3_37 = L3_37.supplyCount
    L4_38 = A0_34.work
    L4_38 = L4_38.armsCount
    L3_37 = L3_37 + L4_38
    L4_38 = A0_34.work
    L4_38 = L4_38.festivalCount
    L3_37 = L3_37 + L4_38
    L4_38 = A0_34.work
    L4_38 = L4_38.importantCount
    L3_37 = L3_37 + L4_38
    return L3_37
  elseif A1_35 == 10 then
    L3_37 = A0_34.work
    L3_37 = L3_37.supplyCount
    L4_38 = A0_34.work
    L4_38 = L4_38.armsCount
    L3_37 = L3_37 + L4_38
    L4_38 = A0_34.work
    L4_38 = L4_38.festivalCount
    L3_37 = L3_37 + L4_38
    L4_38 = A0_34.work
    L4_38 = L4_38.importantCount
    L3_37 = L3_37 + L4_38
    return L3_37
  end
  L3_37 = 0
  return L3_37
end
function PopulaceBlackMarketeer.getShopSellingItemDetail(A0_39, A1_40, A2_41, A3_42, A4_43)
  local L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53
  L5_44 = false
  L6_45 = type
  L7_46 = A4_43
  L6_45 = L6_45(L7_46)
  if L6_45 ~= "nil" then
    L5_44 = true
  end
  L6_45 = true
  L8_47 = A0_39
  L7_46 = A0_39.getShopItemStartIndex
  L9_48 = A2_41
  L7_46 = L7_46(L8_47, L9_48)
  if L7_46 == 0 then
    L8_47 = 0
    L9_48 = 1
    L10_49 = 1
    L11_50 = 1
    L12_51 = 127
    L13_52 = false
    L14_53 = 0
    return L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53
  end
  L9_48 = A0_39
  L8_47 = A0_39.getSheetIndex
  L10_49 = A2_41
  L11_50 = A3_42
  L8_47 = L8_47(L9_48, L10_49, L11_50)
  if L8_47 <= 0 then
    L9_48 = 0
    L10_49 = 1
    L11_50 = 1
    L12_51 = 1
    L13_52 = 127
    L14_53 = false
    return L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, 0
  end
  L9_48 = blackMarketSheet
  L10_49 = L9_48
  L9_48 = L9_48._loadKeyTemporarily
  L11_50 = L8_47
  L12_51 = L8_47
  L9_48(L10_49, L11_50, L12_51)
  L9_48 = blackMarketSheet
  L10_49 = L9_48
  L9_48 = L9_48._getData
  L11_50 = L8_47
  L12_51 = 0
  L9_48 = L9_48(L10_49, L11_50, L12_51)
  L10_49 = blackMarketSheet
  L11_50 = L10_49
  L10_49 = L10_49._getData
  L12_51 = L8_47
  L13_52 = 1
  L10_49 = L10_49(L11_50, L12_51, L13_52)
  L11_50 = blackMarketSheet
  L12_51 = L11_50
  L11_50 = L11_50._getData
  L13_52 = L8_47
  L14_53 = 2
  L11_50 = L11_50(L12_51, L13_52, L14_53)
  L12_51 = blackMarketSheet
  L13_52 = L12_51
  L12_51 = L12_51._getData
  L14_53 = L8_47
  L12_51 = L12_51(L13_52, L14_53, 3)
  L13_52 = 0
  L14_53 = blackMarketSheet
  L14_53 = L14_53._getData
  L14_53 = L14_53(L14_53, L8_47, 4)
  if L5_44 == true then
    return L9_48, L10_49, L14_53, 0, 0, true, 0
  else
    return L9_48, L10_49, L11_50, L12_51, L13_52, L6_45, L8_47
  end
end
function PopulaceBlackMarketeer.getSheetIndex(A0_54, A1_55, A2_56)
  local L3_57, L4_58
  L3_57 = 0
  L4_58 = A0_54.work
  L4_58 = L4_58.supplyCount
  if A2_56 <= L4_58 then
    L4_58 = A0_54.work
    L4_58 = L4_58.supplyStart
    L4_58 = L4_58 + A2_56
    L3_57 = L4_58 - 1
  else
    L4_58 = A0_54.work
    L4_58 = L4_58.supplyCount
    A2_56 = A2_56 - L4_58
  end
  if L3_57 == 0 then
    L4_58 = A0_54.work
    L4_58 = L4_58.armsCount
    if A2_56 <= L4_58 then
      L4_58 = A0_54.work
      L4_58 = L4_58.armsStart
      L4_58 = L4_58 + A2_56
      L3_57 = L4_58 - 1
    end
  else
    L4_58 = A0_54.work
    L4_58 = L4_58.armsCount
    A2_56 = A2_56 - L4_58
  end
  if L3_57 == 0 then
    L4_58 = A0_54.work
    L4_58 = L4_58.festivalCount
    if A2_56 <= L4_58 then
      L4_58 = A0_54.work
      L4_58 = L4_58.festivalStart
      L4_58 = L4_58 + A2_56
      L3_57 = L4_58 - 1
    end
  else
    L4_58 = A0_54.work
    L4_58 = L4_58.festivalCount
    A2_56 = A2_56 - L4_58
  end
  if L3_57 == 0 then
    L4_58 = A0_54.work
    L4_58 = L4_58.importantCount
    if A2_56 <= L4_58 then
      L4_58 = A0_54.work
      L4_58 = L4_58.importantStart
      L4_58 = L4_58 + A2_56
      L3_57 = L4_58 - 1
    end
  else
    L4_58 = A0_54.work
    L4_58 = L4_58.importantCount
    A2_56 = A2_56 - L4_58
  end
  if L3_57 <= 0 then
    L3_57 = 0
  end
  return L3_57
end
function PopulaceBlackMarketeer.eventTalkStepBreak(A0_59)
  A0_59:finishCliantTalkTurn()
  return 0
end
