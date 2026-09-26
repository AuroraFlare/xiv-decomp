require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceHamletSupply", "NpcBaseClass")
function PopulaceHamletSupply.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(10192, "populaceHamletSupply")
end
function PopulaceHamletSupply.eventQuestItemMenuOpen(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  return desktopWidget:openEventModeWidgetYield("Ask/QuestDeliveryWidget", A1_2, A2_3, A3_4, A4_5, A0_1, A5_6)
end
function PopulaceHamletSupply.eventQuestItemMenuSelect(A0_7, A1_8, A2_9, A3_10)
  local L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19
  L4_11 = desktopWidget
  L5_12 = L4_11
  L4_11 = L4_11.selectEventModeWidgetYield
  L6_13 = "Ask/QuestDeliveryWidget"
  L7_14 = A1_8
  L8_15 = A2_9
  L9_16 = A3_10
  L10_17 = L4_11(L5_12, L6_13, L7_14, L8_15, L9_16)
  if L4_11 == false then
    L11_18 = false
    L12_19 = nil
    return L11_18, L12_19, nil, nil, nil
  else
    if L6_13 == 0 then
      L11_18 = false
      L12_19 = nil
      return L11_18, L12_19, nil, nil, nil
    end
    L11_18 = worldMaster
    L12_19 = L11_18
    L11_18 = L11_18._getMyPlayer
    L11_18 = L11_18(L12_19)
    L12_19 = L11_18._getItem
    L12_19 = L12_19(L11_18, L5_12, L6_13)
    if L12_19 == nil then
      return false, nil, nil, nil, nil
    end
    return L4_11, L7_14, L8_15, L10_17, L12_19
  end
end
function PopulaceHamletSupply.eventQuestItemMenuClose(A0_20)
  desktopWidget:closeEventModeWidget("Ask/QuestDeliveryWidget")
end
function PopulaceHamletSupply.eventQuestMateriaMenuOpen(A0_21, A1_22)
  return desktopWidget:openEventModeWidgetYield("Ask/QuestDeliveryWidget", 0, 0, 0, 1, A0_21, A1_22)
end
function PopulaceHamletSupply.eventQuestMateriaMenuSelect(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33
  L2_25 = desktopWidget
  L3_26 = L2_25
  L2_25 = L2_25.selectEventModeWidgetYield
  L4_27 = "Ask/QuestDeliveryWidget"
  L5_28 = 0
  L6_29 = 0
  L7_30 = 0
  L8_31 = 1
  L9_32 = A0_23
  L10_33 = A1_24
  L9_32 = L2_25(L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33)
  if L2_25 == false then
    L10_33 = nil
    return L10_33
  end
  L10_33 = nil
  if L4_27 > 0 then
    L10_33 = worldMaster:_getMyPlayer():_getItem(L3_26, L4_27)
  end
  return L10_33, L3_26, L4_27, L9_32
end
function PopulaceHamletSupply.eventQuestMateriaMenuSetPrice(A0_34, A1_35, A2_36, A3_37)
  if desktopWidget:getChildWidgetByWindowName("Ask/QuestDeliveryWidget") ~= nil then
    desktopWidget:getChildWidgetByWindowName("Ask/QuestDeliveryWidget"):setPrice(A1_35, A2_36, A3_37)
  end
end
function PopulaceHamletSupply.eventQuestMateriaMenuClose(A0_38)
  desktopWidget:closeEventModeWidget("Ask/QuestDeliveryWidget")
end
function PopulaceHamletSupply.getHamletSupplyCraftItemNum(A0_39)
  local L1_40
  L1_40 = 8
  return L1_40
end
function PopulaceHamletSupply.getHamletSupplyCraftItemData(A0_41, A1_42)
  local L2_43, L3_44, L4_45, L5_46, L6_47
  L2_43 = 0
  L4_45 = A0_41
  L3_44 = A0_41.getActorClassId
  L3_44 = L3_44(L4_45)
  L4_45 = L3_44
  if L4_45 == 1500433 then
    L2_43 = 12001
    break
  else
  end
  if L4_45 == 1500320 then
    L2_43 = 11001
    break
  else
  end
  if L4_45 == 1500434 then
    L2_43 = 13001
    break
  else
  end
  L4_45 = L2_43 + A1_42
  L4_45 = L4_45 - 1
  L5_46 = itemHamletSupplySheet
  L6_47 = L5_46
  L5_46 = L5_46._loadKeyTemporarily
  L5_46(L6_47, L4_45, L4_45)
  L5_46 = itemHamletSupplySheet
  L6_47 = L5_46
  L5_46 = L5_46._getData
  L5_46 = L5_46(L6_47, L4_45, 0)
  L6_47 = itemHamletSupplySheet
  L6_47 = L6_47._getData
  L6_47 = L6_47(L6_47, L4_45, 2)
  return L5_46, L6_47
end
function PopulaceHamletSupply.getHamletSupplyCraftItemAnima(A0_48)
  local L1_49, L2_50
  L1_49 = 4
  L2_50 = 6
  return L1_49, L2_50
end
function PopulaceHamletSupply.getHamletSupplyGatherItemNum(A0_51)
  local L1_52
  L1_52 = 3
  return L1_52
end
function PopulaceHamletSupply.getHamletSupplyGatherItemData(A0_53, A1_54)
  local L2_55, L3_56, L4_57, L5_58, L6_59
  L2_55 = 0
  L4_57 = A0_53
  L3_56 = A0_53.getActorClassId
  L3_56 = L3_56(L4_57)
  L4_57 = L3_56
  if L4_57 == 1500433 then
    L2_55 = 12009
    break
  else
  end
  if L4_57 == 1500320 then
    L2_55 = 11009
    break
  else
  end
  if L4_57 == 1500434 then
    L2_55 = 13009
    break
  else
  end
  L4_57 = L2_55 + A1_54
  L4_57 = L4_57 - 1
  L5_58 = itemHamletSupplySheet
  L6_59 = L5_58
  L5_58 = L5_58._loadKeyTemporarily
  L5_58(L6_59, L4_57, L4_57)
  L5_58 = itemHamletSupplySheet
  L6_59 = L5_58
  L5_58 = L5_58._getData
  L5_58 = L5_58(L6_59, L4_57, 0)
  L6_59 = itemHamletSupplySheet
  L6_59 = L6_59._getData
  L6_59 = L6_59(L6_59, L4_57, 2)
  return L5_58, L6_59
end
function PopulaceHamletSupply.getHamletSupplyGatherItemAnima(A0_60)
  local L1_61, L2_62
  L1_61 = 4
  L2_62 = 6
  return L1_61, L2_62
end
