require("/Widget/Ask/AskBaseClass")
_defineClass("HamletDefenseRankingWidget", "AskBaseClass")
function HamletDefenseRankingWidget.setGrandCompanyTitle(A0_0, A1_1)
  A0_0:setStyle("Label_GrandCompanyBanner", A1_1)
end
function HamletDefenseRankingWidget.setTitleInformation(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7)
  A0_2:setText("TextBlock_TitleText", 13001, A1_3)
  if A2_4 == 1 then
    A0_2:setGrandCompanyTitle("LAB_profile_stateBanner_LimsaLominsa")
    break
  else
  end
  if A2_4 == 2 then
    A0_2:setGrandCompanyTitle("LAB_profile_stateBanner_Gridania")
    break
  else
  end
  if A2_4 == 3 then
    A0_2:setGrandCompanyTitle("LAB_profile_stateBanner_Uldah")
    break
  else
  end
  A0_2:setText("TextBlock_HamletLevel", 13002, A1_3, A3_5)
  A0_2:setText("TextBlock_CurrentPoint", 225, A4_6)
  A0_2:setText("TextBlock_PointNextLevel", 225, A5_7)
  if A5_7 > 0 then
    A0_2:setVisibility("Grid_PointNextLevel", true)
  else
    A0_2:setVisibility("Grid_PointNextLevel", false)
  end
end
function HamletDefenseRankingWidget.getListItemBaseName(A0_8, A1_9, A2_10)
  local L3_11
  L3_11 = "ListBoxItem_"
  L3_11 = L3_11 .. tostring(A1_9)
  if A2_10 == nil then
    return L3_11
  else
    return L3_11 .. ":" .. A2_10
  end
end
function HamletDefenseRankingWidget.setRankingListItem(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18)
  local L7_19, L8_20, L9_21, L10_22, L11_23, L12_24
  L8_20 = A0_12
  L7_19 = A0_12.getListItemBaseName
  L9_21 = A1_13
  L10_22 = "IconControl_Crown"
  L7_19 = L7_19(L8_20, L9_21, L10_22)
  L9_21 = A0_12
  L8_20 = A0_12.getListItemBaseName
  L10_22 = A1_13
  L11_23 = "TextBlock_RankNumber"
  L8_20 = L8_20(L9_21, L10_22, L11_23)
  L9_21 = A1_13
  if L9_21 == 1 then
  elseif L9_21 == 2 then
  else
  end
  if L9_21 == 3 then
    L11_23 = A0_12
    L10_22 = A0_12.setVisibility
    L12_24 = L7_19
    L10_22(L11_23, L12_24, true)
    L11_23 = A0_12
    L10_22 = A0_12.setVisibility
    L12_24 = L8_20
    L10_22(L11_23, L12_24, false)
    L11_23 = A0_12
    L10_22 = A0_12.setIcon
    L12_24 = L7_19
    L10_22(L11_23, L12_24, 985 + A1_13 - 1)
    break
  else
  end
  L11_23 = A0_12
  L10_22 = A0_12.setVisibility
  L12_24 = L7_19
  L10_22(L11_23, L12_24, false)
  L11_23 = A0_12
  L10_22 = A0_12.setVisibility
  L12_24 = L8_20
  L10_22(L11_23, L12_24, true)
  L11_23 = A0_12
  L10_22 = A0_12.setText
  L12_24 = L8_20
  L10_22(L11_23, L12_24, 225, A1_13)
  do break end
  L10_22 = A0_12
  L9_21 = A0_12.getListItemBaseName
  L11_23 = A1_13
  L12_24 = "IconControl_GrandCompany"
  L9_21 = L9_21(L10_22, L11_23, L12_24)
  L10_22 = A2_14
  if L10_22 == 1 then
    L12_24 = A0_12
    L11_23 = A0_12.setIcon
    L11_23(L12_24, L9_21, 527)
    L12_24 = A0_12
    L11_23 = A0_12.setVisibility
    L11_23(L12_24, L9_21, true)
    break
  else
  end
  if L10_22 == 2 then
    L12_24 = A0_12
    L11_23 = A0_12.setIcon
    L11_23(L12_24, L9_21, 528)
    L12_24 = A0_12
    L11_23 = A0_12.setVisibility
    L11_23(L12_24, L9_21, true)
    break
  else
  end
  if L10_22 == 3 then
    L12_24 = A0_12
    L11_23 = A0_12.setIcon
    L11_23(L12_24, L9_21, 529)
    L12_24 = A0_12
    L11_23 = A0_12.setVisibility
    L11_23(L12_24, L9_21, true)
    break
  else
  end
  L12_24 = A0_12
  L11_23 = A0_12.setHidden
  L11_23(L12_24, L9_21)
  do break end
  if A3_15 ~= nil then
    L11_23 = A0_12
    L10_22 = A0_12.getListItemBaseName
    L12_24 = A1_13
    L10_22 = L10_22(L11_23, L12_24, "TextBlock_Player")
    L12_24 = A0_12
    L11_23 = A0_12.setText
    L11_23(L12_24, L10_22, A3_15)
    L11_23 = worldMaster
    L12_24 = L11_23
    L11_23 = L11_23._getMyPlayer
    L11_23 = L11_23(L12_24)
    L12_24 = L11_23
    L11_23 = L11_23._getDisplayName
    L11_23 = L11_23(L12_24)
    if A3_15 == L11_23 then
      L12_24 = A0_12
      L11_23 = A0_12.setStyle
      L11_23(L12_24, L10_22, "TBL_selectedItem")
    end
  end
  if A4_16 ~= nil then
    L11_23 = A0_12
    L10_22 = A0_12.getListItemBaseName
    L12_24 = A1_13
    L10_22 = L10_22(L11_23, L12_24, "TextBlock_Point")
    L12_24 = A0_12
    L11_23 = A0_12.setText
    L11_23(L12_24, L10_22, 225, A4_16)
  end
  L11_23 = A0_12
  L10_22 = A0_12.getListItemBaseName
  L12_24 = A1_13
  L10_22 = L10_22(L11_23, L12_24, "Grid_LinkShell")
  if A5_17 ~= nil then
    L12_24 = A0_12
    L11_23 = A0_12.getListItemBaseName
    L11_23 = L11_23(L12_24, A1_13, "TextBlock_LinkShell")
    L12_24 = A0_12.setText
    L12_24(A0_12, L11_23, A5_17)
    L12_24 = A0_12.setVisibility
    L12_24(A0_12, "Grid_LinkShell", true)
    L12_24 = A0_12.getListItemBaseName
    L12_24 = L12_24(A0_12, A1_13, "IconControl_LinkShell")
    if A6_18 ~= nil then
      A0_12:setIcon(L12_24, A6_18)
      A0_12:setVisibility(L12_24, true)
    else
      A0_12:setVisibility(L12_24, false)
    end
    A0_12:setVisibility(L10_22, true)
  else
    L12_24 = A0_12
    L11_23 = A0_12.setVisibility
    L11_23(L12_24, L10_22, false)
  end
  L12_24 = A0_12
  L11_23 = A0_12.setVisibility
  L11_23(L12_24, A0_12:getListItemBaseName(A1_13), true)
end
function HamletDefenseRankingWidget.setRankingList(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38, L14_39, L15_40
  L2_27 = A0_25
  L1_26 = A0_25._getCurrentAreaMaster
  L1_26 = L1_26(L2_27)
  L2_27 = L1_26._countHamletSupplyRanking
  L2_27 = L2_27(L3_28)
  for L6_31 = 1, L2_27 do
    L8_33 = L1_26
    L7_32 = L1_26._getHamletSupplyRanking
    L9_34 = L6_31
    L14_39 = L7_32(L8_33, L9_34)
    L15_40 = nil
    if L11_36 ~= nil then
      L15_40 = desktopWidget:getLinkshellIconID(L11_36)
    end
    A0_25:setRankingListItem(L6_31, L9_34, L8_33, L7_32, L10_35, L15_40)
  end
end
function HamletDefenseRankingWidget.initAsk(A0_41, A1_42, A2_43, A3_44, A4_45, A5_46)
  A0_41:setCancelCondition()
  A0_41:setConfirmCondition("Button_Confirm")
  A0_41:setTitleInformation(A1_42, A2_43, A3_44, A4_45, A5_46)
  A0_41:setRankingList()
end
function HamletDefenseRankingWidget.processUICommandOperate(A0_47, A1_48, A2_49, A3_50, A4_51)
  A0_47:setBaseAskResult(1)
end
