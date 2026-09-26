require("/Widget/Ask/AskBaseClass")
_defineClass("QuestRewardWidget", "AskBaseClass")
function QuestRewardWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, ...)
  local L6_6, L7_7, L8_8
  L6_6 = A0_0.work
  L7_7 = {L8_8}
  L8_8 = {"mode", "integer8"}
  L6_6._temp = L7_7
  L6_6 = A0_0.work
  L6_6.mode = A1_1
  L7_7 = A0_0
  L6_6 = A0_0.setCancelCondition
  L6_6(L7_7)
  L7_7 = A0_0
  L6_6 = A0_0.setConfirmCondition
  L8_8 = "Button_Confirm"
  L6_6(L7_7, L8_8)
  L7_7 = A0_0
  L6_6 = A0_0.getGrandCompany
  L8_8 = A2_2
  L6_6 = L6_6(L7_7, L8_8)
  L7_7 = desktopWidget
  L8_8 = L7_7
  L7_7 = L7_7.getQuestIconID
  L8_8 = L7_7(L8_8, A2_2)
  if L6_6 == 0 then
    A0_0:setVisibility("Grid_GrandCompanyBanner", false)
    A0_0:setVisibility("Grid_Quest", true)
    A0_0:setText("TextBlock_Title", 7201, A2_2)
    A0_0:setIcon("IconControl_QuestCategory", L7_7)
    A0_0:setHelpParameter("IconControl_QuestCategory", 1, L8_8)
  else
    A0_0:setVisibility("Label_LimsaLominsa", L6_6 == 1)
    A0_0:setVisibility("Label_Gridania", L6_6 == 2)
    A0_0:setVisibility("Label_Uldah", L6_6 == 3)
    A0_0:setVisibility("Grid_GrandCompanyBanner", true)
    A0_0:setVisibility("Grid_Quest", false)
    A0_0:setText("TextBlock_GrandCompany", 7201, A2_2)
    A0_0:setIcon("IconControl_GrandCompany", L7_7)
    A0_0:setHelpParameter("IconControl_GrandCompany", 1, L8_8)
  end
  A0_0:setVisibility("ListBoxItem_Bonus", false)
  A0_0:setRewardData(A2_2, A3_3, A4_4, ...)
  A0_0:setLogicalFocus("Button_Confirm")
  if A0_0.work.mode == 2 then
    A0_0:setProperty("SqwtStartupVerticalAlignment", "Top")
    A0_0:setProperty("Margin", "0,20%,0,0")
    A0_0:setUICommandCondition("UIFormCommands.TimerFinish")
    A0_0:setProperty("StringData.Value0", "0:0:8")
    A0_0:setDrawPriority(0.2)
    A0_0:setVisibility("Button_Confirm", false)
    A0_0:sendCommand("UIFormCommands.TimerStart")
    A0_0:setModal(false)
    A0_0:setFocusable(false)
  end
end
function QuestRewardWidget.processAfterShow(A0_9, A1_10)
  if A0_9.work.mode == 2 then
    A0_9:setInputContorlFlag(false)
    A0_9:setInputEnable(false)
  end
  return true
end
function QuestRewardWidget.processUICommandOperate(A0_11, A1_12, A2_13, A3_14, A4_15)
  if A0_11.work.mode == 1 then
    A0_11:setBaseAskResult(1)
  end
end
function QuestRewardWidget.processUICommandCancel(A0_16, A1_17, A2_18, A3_19, A4_20)
  if A0_16.work.mode == 1 then
    A0_16:setBaseAskResult(1)
  end
end
function QuestRewardWidget.processUICommandDefault(A0_21, A1_22, A2_23, A3_24, A4_25, A5_26)
  if A3_24 == "UIFormCommands.TimerFinish" then
    desktopWidget:closeWidgetDirect(A0_21)
  end
end
function QuestRewardWidget.setRewardData(A0_27, A1_28, A2_29, A3_30, ...)
  local L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41, L15_42, L16_43, L17_44, L18_45, L19_46, L20_47, L21_48, L22_49, L23_50
  L5_32 = questSheet
  L6_33 = L5_32
  L5_32 = L5_32._loadKeyTemporarily
  L7_34 = A1_28
  L8_35 = A1_28
  L5_32(L6_33, L7_34, L8_35)
  L5_32 = questSheet
  L6_33 = L5_32
  L5_32 = L5_32._getData
  L7_34 = A1_28
  L8_35 = 52
  L5_32 = L5_32(L6_33, L7_34, L8_35)
  L6_33 = questSheet
  L7_34 = L6_33
  L6_33 = L6_33._getData
  L8_35 = A1_28
  L6_33 = L6_33(L7_34, L8_35, L9_36)
  L7_34 = questSheet
  L8_35 = L7_34
  L7_34 = L7_34._getData
  L7_34 = L7_34(L8_35, L9_36, L10_37)
  L8_35 = questNewRewardSheet
  L8_35 = L8_35._loadKeyTemporarily
  L8_35(L9_36, L10_37, L11_38)
  L8_35 = select
  L23_50 = ...
  L8_35 = L8_35(L9_36, L10_37, L11_38, L12_39, L13_40, L14_41, L15_42, L16_43, L17_44, L18_45, L19_46, L20_47, L21_48, L22_49, L23_50, ...)
  for L12_39 = 1, L8_35 do
    L13_40 = select
    L14_41 = L12_39
    L23_50 = ...
    L13_40 = L13_40(L14_41, L15_42, L16_43, L17_44, L18_45, L19_46, L20_47, L21_48, L22_49, L23_50, ...)
    L14_41 = L13_40 - 1
    L14_41 = 13 * L14_41
    L15_42 = questNewRewardSheet
    L16_43 = L15_42
    L15_42 = L15_42._getData
    L17_44 = A1_28
    L18_45 = L14_41 + 1
    L15_42 = L15_42(L16_43, L17_44, L18_45)
    L16_43 = questNewRewardSheet
    L17_44 = L16_43
    L16_43 = L16_43._getData
    L18_45 = A1_28
    L19_46 = L14_41 + 2
    L16_43 = L16_43(L17_44, L18_45, L19_46)
    L17_44 = questNewRewardSheet
    L18_45 = L17_44
    L17_44 = L17_44._getData
    L19_46 = A1_28
    L20_47 = L14_41 + 5
    L21_48 = A3_30 - 1
    L20_47 = L20_47 + L21_48
    L17_44 = L17_44(L18_45, L19_46, L20_47)
    if L17_44 < 0 then
      L18_45 = questNewRewardSheet
      L19_46 = L18_45
      L18_45 = L18_45._getData
      L20_47 = A1_28
      L21_48 = L14_41 + 5
      L18_45 = L18_45(L19_46, L20_47, L21_48)
      L17_44 = L18_45
    end
    L18_45 = "Item_Reward"
    L19_46 = tostring
    L20_47 = L12_39
    L19_46 = L19_46(L20_47)
    L18_45 = L18_45 .. L19_46
    L19_46 = false
    if L15_42 == -14 or L15_42 == -15 then
      L21_48 = A0_27
      L20_47 = A0_27.isFestival
      L20_47 = L20_47(L21_48)
      if L20_47 == true and L6_33 > 0 and L6_33 < 127 then
        L18_45 = "ListBoxItem_Bonus"
        L21_48 = A0_27
        L20_47 = A0_27.setVisibility
        L22_49 = L18_45
        L23_50 = true
        L20_47(L21_48, L22_49, L23_50)
        L19_46 = true
      end
    else
      L21_48 = A0_27
      L20_47 = A0_27._addItem
      L22_49 = nil
      L23_50 = "ListBox_RewardArea"
      L20_47(L21_48, L22_49, L23_50, "ControlTemplate_ListBoxItem_Reward", L18_45)
    end
    if L16_43 ~= 0 then
      L21_48 = A0_27
      L20_47 = A0_27.setIcon
      L22_49 = L18_45
      L23_50 = ":"
      L22_49 = L22_49 .. L23_50 .. "IconControl_RewardItem"
      L23_50 = L16_43
      L20_47(L21_48, L22_49, L23_50)
    else
      L21_48 = A0_27
      L20_47 = A0_27.setHidden
      L22_49 = L18_45
      L23_50 = ":"
      L22_49 = L22_49 .. L23_50 .. "IconControl_RewardItem"
      L20_47(L21_48, L22_49)
    end
    L20_47 = L15_42
    if L20_47 == -2 then
      L22_49 = A0_27
      L21_48 = A0_27.setText
      L23_50 = L18_45
      L23_50 = L23_50 .. ":" .. "TextBlock_RewardItem"
      L21_48(L22_49, L23_50, 5051, L17_44)
      break
    elseif L20_47 == -10 then
    elseif L20_47 == -8 then
    elseif L20_47 == -3 then
    else
    end
    if L20_47 == -14 then
      L21_48 = questNewRewardSheet
      L22_49 = L21_48
      L21_48 = L21_48._getData
      L23_50 = A1_28
      L21_48 = L21_48(L22_49, L23_50, L14_41 + 3)
      L23_50 = A0_27
      L22_49 = A0_27.setText
      L22_49(L23_50, L18_45 .. ":" .. "TextBlock_RewardItem", 5041, L21_48, 1, L17_44)
      if L19_46 == true then
        L23_50 = A0_27
        L22_49 = A0_27.setText
        L22_49(L23_50, L18_45 .. ":" .. "TextBlock_RewardBonus", 3189, 2)
        L23_50 = A0_27
        L22_49 = A0_27.setContent
        L22_49(L23_50, L18_45 .. ":" .. "Label_RewardBonusEffect", 3189, 2)
        L23_50 = A0_27
        L22_49 = A0_27.sendControlCommand
        L22_49(L23_50, L18_45, "UILuaCommands.BonusEffectStart")
        do break end
        else
        end
        if L20_47 == -15 then
          L21_48 = 0
          L22_49 = worldMaster
          L23_50 = L22_49
          L22_49 = L22_49._getMyPlayer
          L22_49 = L22_49(L23_50)
          L23_50 = L22_49._getBelongGrandCompany
          L23_50 = L23_50(L22_49)
          L16_43, L21_48 = A0_27:getCompanySealData(L23_50)
          A0_27:setText(L18_45 .. ":" .. "TextBlock_RewardItem", 5041, L21_48, 1, L17_44)
          A0_27:setIcon(L18_45 .. ":" .. "IconControl_RewardItem", L16_43)
          if L19_46 == true then
            A0_27:setText(L18_45 .. ":" .. "TextBlock_RewardBonus", 3189, 2)
            A0_27:setContent(L18_45 .. ":" .. "Label_RewardBonusEffect", 3189, 2)
            A0_27:sendControlCommand(L18_45, "UILuaCommands.BonusEffectStart")
            do break end
            elseif L20_47 == -12 then
            else
            end
            if L20_47 == -13 then
              L22_49 = A0_27
              L21_48 = A0_27.setText
              L23_50 = L18_45
              L23_50 = L23_50 .. ":" .. "TextBlock_RewardItem"
              L21_48(L22_49, L23_50, 5052, A2_29)
              break
            else
            end
            if L20_47 == -16 then
              L21_48 = questNewRewardSheet
              L22_49 = L21_48
              L21_48 = L21_48._getData
              L23_50 = A1_28
              L21_48 = L21_48(L22_49, L23_50, L14_41 + 11)
              L23_50 = A0_27
              L22_49 = A0_27.setText
              L22_49(L23_50, L18_45 .. ":" .. "TextBlock_RewardItem", 5061, A2_29, L21_48)
              break
            else
            end
            if L20_47 == -4 then
              L21_48 = questNewRewardSheet
              L22_49 = L21_48
              L21_48 = L21_48._getData
              L23_50 = A1_28
              L21_48 = L21_48(L22_49, L23_50, L14_41 + 3)
              L23_50 = A0_27
              L22_49 = A0_27.setText
              L22_49(L23_50, L18_45 .. ":" .. "TextBlock_RewardItem", 5053, L21_48)
              break
            else
            end
          else
          end
      else
      end
  end
end
function QuestRewardWidget.getGrandCompany(A0_51, A1_52)
  local L2_53, L3_54, L4_55
  L2_53 = questSheet
  L3_54 = L2_53
  L2_53 = L2_53._loadKeyTemporarily
  L4_55 = A1_52
  L2_53(L3_54, L4_55, A1_52)
  L2_53 = questSheet
  L3_54 = L2_53
  L2_53 = L2_53._getData
  L4_55 = A1_52
  L2_53 = L2_53(L3_54, L4_55, 52)
  L3_54 = 0
  L4_55 = L2_53
  if L4_55 == 201 then
    L3_54 = 1
    break
  else
  end
  if L4_55 == 202 then
    L3_54 = 2
    break
  else
  end
  if L4_55 == 203 then
    L3_54 = 3
    break
  else
  end
  if L4_55 == 204 then
    L3_54 = worldMaster:_getMyPlayer():_getBelongGrandCompany()
    break
  else
  end
  L4_55 = questSheet
  L4_55 = L4_55._getData
  L4_55 = L4_55(L4_55, A1_52, 54)
  A0_51:setVisibility("TextBlock_Repeat", L4_55)
end
function QuestRewardWidget.getCompanySealData(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61
  L2_58 = 0
  L3_59 = 0
  L4_60 = A1_57
  if L4_60 == 1 then
    L2_58 = 1000201
    L3_59 = 61603
    break
  else
  end
  if L4_60 == 2 then
    L2_58 = 1000202
    L3_59 = 61602
    break
  else
  end
  if L4_60 == 3 then
    L2_58 = 1000203
    L3_59 = 61601
    break
  else
  end
  L4_60 = L3_59
  L5_61 = L2_58
  return L4_60, L5_61
end
function QuestRewardWidget.isFestival(A0_62)
  return true
end
