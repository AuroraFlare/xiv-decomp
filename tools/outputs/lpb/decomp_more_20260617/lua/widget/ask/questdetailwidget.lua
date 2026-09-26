require("/Widget/Ask/AskBaseClass")
_defineClass("QuestDetailWidget", "AskBaseClass")
function QuestDetailWidget.initAsk(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  L3_3 = A0_0.work
  L4_4 = {L5_5, L6_6}
  L5_5 = {L6_6, L7_7}
  L6_6 = "mode"
  L7_7 = "integer8"
  L6_6 = {L7_7, L8_8}
  L7_7 = "questID"
  L8_8 = "integer32"
  L3_3._temp = L4_4
  L4_4 = A0_0
  L3_3 = A0_0.setCancelCondition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setCloseCondition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setUICommandCondition
  L5_5 = "UILuaCommands.Shown"
  L3_3(L4_4, L5_5)
  L3_3 = A0_0.work
  L3_3.mode = A1_1
  L3_3 = A0_0.work
  L3_3.questID = A2_2
  L4_4 = A0_0
  L3_3 = A0_0.getGrandCompany
  L5_5 = A2_2
  L3_3 = L3_3(L4_4, L5_5)
  L4_4 = desktopWidget
  L5_5 = L4_4
  L4_4 = L4_4.getQuestIconID
  L6_6 = A2_2
  L5_5 = L4_4(L5_5, L6_6)
  if L3_3 == 0 then
    L7_7 = A0_0
    L6_6 = A0_0.setVisibility
    L8_8 = "Grid_GrandCompanyBanner"
    L6_6(L7_7, L8_8, false)
    L7_7 = A0_0
    L6_6 = A0_0.setVisibility
    L8_8 = "Grid_Quest"
    L6_6(L7_7, L8_8, true)
    L7_7 = A0_0
    L6_6 = A0_0.setText
    L8_8 = "TextBlock_Title"
    L6_6(L7_7, L8_8, 5025, A2_2)
    L7_7 = A0_0
    L6_6 = A0_0.setIcon
    L8_8 = "IconControl_QuestCategory"
    L6_6(L7_7, L8_8, L4_4)
    L7_7 = A0_0
    L6_6 = A0_0.setHelpParameter
    L8_8 = "IconControl_QuestCategory"
    L6_6(L7_7, L8_8, 1, L5_5)
  else
    L7_7 = A0_0
    L6_6 = A0_0.setVisibility
    L8_8 = "Label_LimsaLominsa"
    L6_6(L7_7, L8_8, L3_3 == 1)
    L7_7 = A0_0
    L6_6 = A0_0.setVisibility
    L8_8 = "Label_Gridania"
    L6_6(L7_7, L8_8, L3_3 == 2)
    L7_7 = A0_0
    L6_6 = A0_0.setVisibility
    L8_8 = "Label_Uldah"
    L6_6(L7_7, L8_8, L3_3 == 3)
    L7_7 = A0_0
    L6_6 = A0_0.setVisibility
    L8_8 = "Grid_GrandCompanyBanner"
    L6_6(L7_7, L8_8, true)
    L7_7 = A0_0
    L6_6 = A0_0.setVisibility
    L8_8 = "Grid_Quest"
    L6_6(L7_7, L8_8, false)
    L7_7 = A0_0
    L6_6 = A0_0.setText
    L8_8 = "TextBlock_GrandCompany"
    L6_6(L7_7, L8_8, 5025, A2_2)
    L7_7 = A0_0
    L6_6 = A0_0.setIcon
    L8_8 = "IconControl_GrandCompany"
    L6_6(L7_7, L8_8, L4_4)
    L7_7 = A0_0
    L6_6 = A0_0.setHelpParameter
    L8_8 = "IconControl_GrandCompany"
    L6_6(L7_7, L8_8, 1, L5_5)
  end
  L7_7 = A0_0
  L6_6 = A0_0.setText
  L8_8 = "TextBlock_ClientName"
  L6_6(L7_7, L8_8, 5028, A2_2)
  L7_7 = A0_0
  L6_6 = A0_0.setConditionData
  L8_8 = A2_2
  L6_6(L7_7, L8_8, L3_3)
  L7_7 = A0_0
  L6_6 = A0_0.setRewardData
  L8_8 = A2_2
  L6_6(L7_7, L8_8)
  L6_6 = false
  L7_7 = A0_0.work
  L7_7 = L7_7.mode
  if L7_7 == 1 then
    if A2_2 >= 110001 and A2_2 <= 110059 then
      L8_8 = A0_0
      L7_7 = A0_0.setVisibility
      L7_7(L8_8, "Button_Destruction", false)
    elseif A2_2 >= 111200 and A2_2 <= 111339 then
      L8_8 = A0_0
      L7_7 = A0_0.setVisibility
      L7_7(L8_8, "Button_Destruction", false)
    elseif A2_2 == 110869 then
      L8_8 = A0_0
      L7_7 = A0_0.setVisibility
      L7_7(L8_8, "Button_Destruction", false)
    else
      L8_8 = A0_0
      L7_7 = A0_0.setConfirmCondition
      L7_7(L8_8, "Button_Destruction")
    end
    L8_8 = A0_0
    L7_7 = A0_0.setConfirmCondition
    L7_7(L8_8, "Button_OpenMap")
    L8_8 = A0_0
    L7_7 = A0_0.setConfirmCondition
    L7_7(L8_8, "Button_Close")
    L8_8 = A0_0
    L7_7 = A0_0.setEnable
    L7_7(L8_8, "Button_OpenMap", false)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Grid_Bottom_Order", false)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Grid_Bottom_Progress", true)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Grid_QuestHystory", true)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Label_Number", false)
    L8_8 = A0_0
    L7_7 = A0_0.setLogicalFocus
    L7_7(L8_8, "Button_Close")
    L6_6 = true
  else
    L8_8 = A0_0
    L7_7 = A0_0.setConfirmCondition
    L7_7(L8_8, "Button_Undertake")
    L8_8 = A0_0
    L7_7 = A0_0.setConfirmCondition
    L7_7(L8_8, "Button_Refuse")
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Grid_Bottom_Order", true)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Grid_Bottom_Progress", false)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Grid_QuestHystory", false)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L7_7(L8_8, "Label_Number", true)
    L7_7 = desktopWidget
    L8_8 = L7_7
    L7_7 = L7_7.getQuestCount
    L8_8 = L7_7(L8_8)
    A0_0:setText("TextBlock_Explain", 5050, A2_2)
    A0_0:setText("TextBlock_Number", 228, L7_7, L8_8)
    A0_0:setLogicalFocus("Button_Undertake")
  end
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L7_7(L8_8, "Border_QuestItem", L6_6)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L7_7(L8_8, "Border_QuestItem_Head", L6_6)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L7_7(L8_8, "TextBlock_QuestItemTitle", L6_6)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L7_7(L8_8, "TextBlock_QuestItem", L6_6)
end
function QuestDetailWidget.processUICommandOperate(A0_9, A1_10, A2_11, A3_12, A4_13)
  local L5_14
  L5_14 = A2_11
  if L5_14 == "Button_Undertake" then
    A0_9:setBaseAskResult(1)
    break
  else
  end
  if L5_14 == "Button_Refuse" then
    A0_9:setBaseAskResult(-1)
    break
  else
  end
  if L5_14 == "Button_OpenMap" then
    desktopWidget:openChildWidget("MapNavigationWidget", A0_9, true, 1, nil, A0_9.work.questID)
    break
  else
  end
  if L5_14 == "Button_Destruction" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_9, true, nil, A0_9:packTextParameter(5049, A0_9.work.questID), 2, 1348, 1349)
    break
  else
  end
  if L5_14 == "Button_Close" then
    desktopWidget:closeWidgetDirect(A0_9)
    do break end
    break
  else
  end
end
function QuestDetailWidget.processUICommandClose(A0_15, A1_16, A2_17, A3_18, A4_19)
  if A0_15.work.mode == 1 then
    desktopWidget:closeWidgetDirect(A0_15)
  else
    A0_15:setBaseAskResult(-1)
  end
end
function QuestDetailWidget.processUICommandDefault(A0_20, A1_21, A2_22, A3_23, A4_24, A5_25)
  if A3_23 == "UILuaCommands.Shown" then
    if A0_20.work.mode == 1 and desktopWidget:executeCommandJournalDetailInfo(3, A0_20.work.questID) == false then
      desktopWidget:openCommandFailedWidget(A0_20, 4311)
      return
    else
    end
    if A0_20:getVisibility("Button_OpenMap") == true then
      A0_20:setEnable("Button_OpenMap", true)
    end
    if desktopWidget:getTutorialMenuType() == 1 and desktopWidget:getTutorialMenuStatus() == 1 then
      desktopWidget:closeTutorialWidget()
      desktopWidget:setTutorialMenuStatus(2)
      break
    else
    end
  else
  end
end
function QuestDetailWidget.getAskResult(A0_26)
  if A0_26:getBaseAskResult() == 1 then
    return true
  end
  return false
end
function QuestDetailWidget.setConditionData(A0_27, A1_28, A2_29)
  local L3_30, L4_31, L5_32, L6_33, L7_34
  L3_30 = questSheet
  L4_31 = L3_30
  L3_30 = L3_30._loadKeyTemporarily
  L5_32 = A1_28
  L6_33 = A1_28
  L3_30(L4_31, L5_32, L6_33)
  L3_30 = questSheet
  L4_31 = L3_30
  L3_30 = L3_30._getData
  L5_32 = A1_28
  L6_33 = 53
  L3_30 = L3_30(L4_31, L5_32, L6_33)
  L4_31 = questSheet
  L5_32 = L4_31
  L4_31 = L4_31._getData
  L6_33 = A1_28
  L7_34 = 54
  L4_31 = L4_31(L5_32, L6_33, L7_34)
  L6_33 = A0_27
  L5_32 = A0_27.setVisibility
  L7_34 = "Grid_Repeat"
  L5_32(L6_33, L7_34, L4_31)
  if L3_30 == 0 then
    L6_33 = A0_27
    L5_32 = A0_27.setText
    L7_34 = "TextBlock_Condition"
    L5_32(L6_33, L7_34, 5030, A1_28)
    L6_33 = A0_27
    L5_32 = A0_27.setVisibility
    L7_34 = "Border_RequiredLevel_bg"
    L5_32(L6_33, L7_34, false)
    L6_33 = A0_27
    L5_32 = A0_27.setVisibility
    L7_34 = "Border_RequiredLevel"
    L5_32(L6_33, L7_34, false)
    L6_33 = A0_27
    L5_32 = A0_27.setVisibility
    L7_34 = "TextBlock_RequiredLevel_Title"
    L5_32(L6_33, L7_34, false)
    L6_33 = A0_27
    L5_32 = A0_27.setVisibility
    L7_34 = "TextBlock_RequiredLevel"
    L5_32(L6_33, L7_34, false)
    L6_33 = A0_27
    L5_32 = A0_27.setVisibility
    L7_34 = "IconControl_CompanyRank"
    L5_32(L6_33, L7_34, false)
  else
    L5_32 = worldMaster
    L6_33 = L5_32
    L5_32 = L5_32._getMyPlayer
    L5_32 = L5_32(L6_33)
    L6_33 = 1
    L7_34 = L5_32.isMale
    L7_34 = L7_34(L5_32)
    if L7_34 == true then
      L6_33 = 1
    else
      L7_34 = L5_32.isFemale
      L7_34 = L7_34(L5_32)
      if L7_34 == true then
        L6_33 = 2
      end
    end
    L7_34 = A0_27.setText
    L7_34(A0_27, "TextBlock_Condition", 5056 + A2_29, L3_30, L6_33)
    L7_34 = A0_27.getGrandCompanyStatusIcon
    L7_34 = L7_34(A0_27, A2_29, L3_30)
    A0_27:setIcon("IconControl_CompanyRank", L7_34)
    A0_27:setVisibility("IconControl_CompanyRank", true)
    A0_27:setText("TextBlock_RequiredLevel", 5030, A1_28)
    A0_27:setVisibility("Border_RequiredLevel_bg", true)
    A0_27:setVisibility("Border_RequiredLevel", true)
    A0_27:setVisibility("TextBlock_RequiredLevel_Title", true)
    A0_27:setVisibility("TextBlock_RequiredLevel", true)
  end
end
function QuestDetailWidget.setRewardData(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49, L15_50, L16_51, L17_52, L18_53, L19_54, L20_55
  L2_37 = questSheet
  L3_38 = L2_37
  L2_37 = L2_37._loadKeyTemporarily
  L4_39 = A1_36
  L5_40 = A1_36
  L2_37(L3_38, L4_39, L5_40)
  L2_37 = questSheet
  L3_38 = L2_37
  L2_37 = L2_37._getData
  L4_39 = A1_36
  L5_40 = 51
  L2_37 = L2_37(L3_38, L4_39, L5_40)
  L3_38 = questSheet
  L4_39 = L3_38
  L3_38 = L3_38._getData
  L5_40 = A1_36
  L6_41 = 52
  L3_38 = L3_38(L4_39, L5_40, L6_41)
  L4_39 = questSheet
  L5_40 = L4_39
  L4_39 = L4_39._getData
  L6_41 = A1_36
  L7_42 = 53
  L4_39 = L4_39(L5_40, L6_41, L7_42)
  L5_40 = questSheet
  L6_41 = L5_40
  L5_40 = L5_40._getData
  L7_42 = A1_36
  L5_40 = L5_40(L6_41, L7_42, L8_43)
  L6_41 = questNewRewardSheet
  L7_42 = L6_41
  L6_41 = L6_41._loadKeyTemporarily
  L6_41(L7_42, L8_43, L9_44)
  L6_41 = 0
  L7_42 = 0
  for L11_46 = 1, 16 do
    L12_47 = questNewRewardSheet
    L13_48 = L12_47
    L12_47 = L12_47._getData
    L14_49 = A1_36
    L15_50 = L7_42 + 0
    L12_47 = L12_47(L13_48, L14_49, L15_50)
    if L12_47 == 301 then
      break
    end
    if L12_47 == 100 then
      L6_41 = L6_41 + 1
      L13_48 = questNewRewardSheet
      L14_49 = L13_48
      L13_48 = L13_48._getData
      L15_50 = A1_36
      L16_51 = L7_42 + 1
      L13_48 = L13_48(L14_49, L15_50, L16_51)
      L14_49 = questNewRewardSheet
      L15_50 = L14_49
      L14_49 = L14_49._getData
      L16_51 = A1_36
      L17_52 = L7_42 + 2
      L14_49 = L14_49(L15_50, L16_51, L17_52)
      L15_50 = questNewRewardSheet
      L16_51 = L15_50
      L15_50 = L15_50._getData
      L17_52 = A1_36
      L18_53 = L7_42 + 5
      L15_50 = L15_50(L16_51, L17_52, L18_53)
      L16_51 = "Item_Reward"
      L17_52 = tostring
      L18_53 = L6_41
      L17_52 = L17_52(L18_53)
      L16_51 = L16_51 .. L17_52
      L18_53 = A0_35
      L17_52 = A0_35._addItem
      L19_54 = nil
      L20_55 = "StackPanel_Reward"
      L17_52(L18_53, L19_54, L20_55, "ControlTemplate_Label_Reward", L16_51)
      if L14_49 ~= 0 then
        L18_53 = A0_35
        L17_52 = A0_35.setItemIcon
        L19_54 = L16_51
        L20_55 = "IconControl_RewardItem"
        L17_52(L18_53, L19_54, L20_55, L14_49)
      else
        L18_53 = A0_35
        L17_52 = A0_35.setItemHidden
        L19_54 = L16_51
        L20_55 = "IconControl_RewardItem"
        L17_52(L18_53, L19_54, L20_55)
      end
      L17_52 = L13_48
      if L17_52 == -2 then
        L19_54 = A0_35
        L18_53 = A0_35.setItemText
        L20_55 = L16_51
        L18_53(L19_54, L20_55, "TextBlock_RewardItem", 5051, L15_50)
        break
      elseif L17_52 == -10 then
      elseif L17_52 == -8 then
      elseif L17_52 == -3 then
      else
      end
      if L17_52 == -14 then
        L18_53 = questNewRewardSheet
        L19_54 = L18_53
        L18_53 = L18_53._getData
        L20_55 = A1_36
        L18_53 = L18_53(L19_54, L20_55, L7_42 + 3)
        L20_55 = A0_35
        L19_54 = A0_35.setItemText
        L19_54(L20_55, L16_51, "TextBlock_RewardItem", 5041, L18_53, 1, L15_50)
        break
      else
      end
      if L17_52 == -15 then
        L18_53 = 0
        L19_54 = worldMaster
        L20_55 = L19_54
        L19_54 = L19_54._getMyPlayer
        L19_54 = L19_54(L20_55)
        L20_55 = L19_54._getBelongGrandCompany
        L20_55 = L20_55(L19_54)
        L14_49, L18_53 = A0_35:getCompanySealData(L20_55)
        A0_35:setItemText(L16_51, "TextBlock_RewardItem", 5041, L18_53, 1, L15_50)
        A0_35:setItemIcon(L16_51, "IconControl_RewardItem", L14_49)
        break
      else
      end
      if L17_52 == -12 then
        L19_54 = A0_35
        L18_53 = A0_35.setItemText
        L20_55 = L16_51
        L18_53(L19_54, L20_55, "TextBlock_RewardItem", 5052, L15_50)
        break
      else
      end
      if L17_52 == -13 then
        L18_53 = worldMaster
        L19_54 = L18_53
        L18_53 = L18_53._getMyPlayer
        L18_53 = L18_53(L19_54)
        L19_54 = L18_53
        L18_53 = L18_53.calcSkillPoint
        L20_55 = L2_37
        L18_53 = L18_53(L19_54, L20_55, L15_50)
        L20_55 = A0_35
        L19_54 = A0_35.setItemText
        L19_54(L20_55, L16_51, "TextBlock_RewardItem", 5054, L18_53)
        break
      else
      end
      if L17_52 == -16 then
        L18_53 = worldMaster
        L19_54 = L18_53
        L18_53 = L18_53._getMyPlayer
        L18_53 = L18_53(L19_54)
        L19_54 = L18_53
        L18_53 = L18_53.calcSkillPoint
        L20_55 = L2_37
        L18_53 = L18_53(L19_54, L20_55, L15_50)
        L19_54 = questNewRewardSheet
        L20_55 = L19_54
        L19_54 = L19_54._getData
        L19_54 = L19_54(L20_55, A1_36, L7_42 + 11)
        L20_55 = A0_35.setItemText
        L20_55(A0_35, L16_51, "TextBlock_RewardItem", 5060, L18_53, L19_54)
        break
      else
      end
      if L17_52 == -4 then
        L18_53 = questNewRewardSheet
        L19_54 = L18_53
        L18_53 = L18_53._getData
        L20_55 = A1_36
        L18_53 = L18_53(L19_54, L20_55, L7_42 + 3)
        L20_55 = A0_35
        L19_54 = A0_35.setItemText
        L19_54(L20_55, L16_51, "TextBlock_RewardItem", 5053, L18_53)
        break
      else
      end
    else
    end
    L7_42 = L7_42 + 13
  end
  if L6_41 == 0 then
    L11_46 = false
    L8_43(L9_44, L10_45, L11_46)
  end
end
function QuestDetailWidget.setDetailData(A0_56, A1_57, A2_58, A3_59, A4_60, A5_61, A6_62, A7_63, A8_64)
  if A1_57 == nil then
    A1_57 = 0
  end
  if A2_58 == nil then
    A2_58 = 0
  end
  if A3_59 == nil then
    A3_59 = 0
  end
  if A4_60 == nil then
    A4_60 = 0
  end
  if A5_61 == nil then
    A5_61 = 0
  end
  if A6_62 == nil then
    A6_62 = 0
  end
  if A7_63 == nil then
    A7_63 = " "
  end
  A0_56:setText("TextBlock_Explain", 5026, A0_56.work.questID, A1_57, A2_58, A3_59, A4_60, A5_61, A6_62, A7_63)
  A0_56:setText("TextBlock_QuestItem", 4001, A0_56.work.questID, A1_57, A2_58, A3_59, A4_60, A5_61, A6_62, A7_63)
  A0_56:setText("TextBlock_QuestHistory", 5005, A0_56.work.questID, A1_57, A2_58, A3_59, A4_60, A5_61, A6_62, A7_63)
end
function QuestDetailWidget.processAskResult(A0_65, A1_66)
  if A1_66 == 1 then
    if desktopWidget:executeJournalCommand(3, A0_65.work.questID, 1) == true then
      desktopWidget:closeWidgetDirect(A0_65)
    else
      desktopWidget:openCommandFailedWidget(A0_65, 4311)
    end
  end
end
function QuestDetailWidget.processErrorDialogResult(A0_67, A1_68)
  desktopWidget:closeWidgetDirect(A0_67)
end
function QuestDetailWidget.getGrandCompany(A0_69, A1_70)
  local L2_71, L3_72
  L2_71 = questSheet
  L3_72 = L2_71
  L2_71 = L2_71._loadKeyTemporarily
  L2_71(L3_72, A1_70, A1_70)
  L2_71 = questSheet
  L3_72 = L2_71
  L2_71 = L2_71._getData
  L2_71 = L2_71(L3_72, A1_70, 52)
  L3_72 = 0
  if L2_71 == 201 then
    L3_72 = 1
    break
  else
  end
  if L2_71 == 202 then
    L3_72 = 2
    break
  else
  end
  if L2_71 == 203 then
    L3_72 = 3
    break
  else
  end
  if L2_71 == 204 then
    L3_72 = worldMaster:_getMyPlayer():_getBelongGrandCompany()
    break
  else
  end
  return L3_72
end
function QuestDetailWidget.getCompanySealData(A0_73, A1_74)
  local L2_75, L3_76, L4_77, L5_78
  L2_75 = 0
  L3_76 = 0
  L4_77 = A1_74
  if L4_77 == 1 then
    L2_75 = 1000201
    L3_76 = 61603
    break
  else
  end
  if L4_77 == 2 then
    L2_75 = 1000202
    L3_76 = 61602
    break
  else
  end
  if L4_77 == 3 then
    L2_75 = 1000203
    L3_76 = 61601
    break
  else
  end
  L4_77 = L3_76
  L5_78 = L2_75
  return L4_77, L5_78
end
function QuestDetailWidget.getGrandCompanyStatusIcon(A0_79, A1_80, A2_81)
  gcRankSheet:_loadKeyTemporarily(A2_81, A2_81)
  return (gcRankSheet:_getData(A2_81, A1_80 + 6 - 1))
end
function QuestDetailWidget.isFestival(A0_82)
  return true
end
