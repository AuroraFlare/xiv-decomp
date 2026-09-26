require("/Widget/Ask/AskBaseClass")
_defineClass("JournalDetailWidget", "AskBaseClass")
function JournalDetailWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
  local L7_7, L8_8, L9_9, L10_10, L11_11
  L7_7 = A0_0.work
  L8_8 = {
    L9_9,
    L10_10,
    L11_11,
    {
      "journalType",
      "integer8"
    },
    {
      "journalSubindex",
      "integer8"
    },
    {"offerLimit", "integer8"},
    {"journalID", "integer32"},
    {"townIcon", "integer32"},
    {"designIcon", "integer32"},
    {"frameIcon", "integer32"},
    {"skillIcon", "integer32"},
    {
      "skillIconHelp",
      "integer32"
    },
    {
      "guildleveFailed",
      "boolean"
    }
  }
  L9_9 = {L10_10, L11_11}
  L10_10 = "questCompleted"
  L11_11 = "boolean"
  L10_10 = {L11_11, "integer8"}
  L11_11 = "mode"
  L11_11 = {"questIndex", "integer8"}
  L7_7._temp = L8_8
  L8_8 = A0_0
  L7_7 = A0_0.initTemplate
  L9_9 = A2_2
  L10_10 = A4_4
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "IconControl_Category"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "IconControl_StageIcon"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "TextBlock_Title"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "TextBlock_Type"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "TextBlock_Target"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "ScrollViewer_GuildeleveArea"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "ScrollViewer_QuestArea"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_OpenMap"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Regionalleve_Retry"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Localleve_Retry"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Regionalleve_Break"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Localleve_Break"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Quest_Break"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Ready"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Order"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setVisibility
  L9_9 = "Button_Release"
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = A0_0
  L7_7 = A0_0.setCancelCondition
  L7_7(L8_8)
  L8_8 = A0_0
  L7_7 = A0_0.setCloseCondition
  L7_7(L8_8)
  L8_8 = A0_0
  L7_7 = A0_0.setConfirmCondition
  L9_9 = "Button_Close"
  L7_7(L8_8, L9_9)
  L8_8 = A0_0
  L7_7 = A0_0.setUICommandCondition
  L9_9 = "UILuaCommands.Shown"
  L7_7(L8_8, L9_9)
  L7_7 = A0_0.work
  L7_7.mode = A1_1
  L7_7 = A0_0.work
  L7_7.journalType = A2_2
  L7_7 = A0_0.work
  L7_7.journalID = A3_3
  L7_7 = A0_0.work
  L7_7.journalSubindex = 0
  L7_7 = A0_0.work
  L7_7.questCompleted = false
  L7_7 = A0_0.work
  L7_7.offerLimit = 0
  L7_7 = A0_0.work
  L7_7.guildleveFailed = false
  if A6_6 == true then
    L7_7 = A0_0.work
    L7_7.questCompleted = true
  end
  L7_7 = A1_1
  if L7_7 == 1 then
    L8_8 = A0_0.work
    L8_8.questIndex = A5_5
    L8_8 = false
    L9_9 = false
    if A2_2 == 3 then
      L10_10 = A0_0.work
      L10_10 = L10_10.questCompleted
      if L10_10 == false then
        L11_11 = A0_0
        L10_10 = A0_0.setConfirmCondition
        L10_10(L11_11, "Button_Quest_Break")
        L11_11 = A0_0
        L10_10 = A0_0.setVisibility
        L10_10(L11_11, "Button_Quest_Break", true)
        L8_8 = true
      end
    elseif A2_2 == 2 then
      L10_10 = false
      L11_11 = true
      L8_8 = true
      A0_0:setConfirmCondition("Button_Localleve_Retry")
      A0_0:setVisibility("Button_Localleve_Retry", true)
      A0_0:setConfirmCondition("Button_Localleve_Break")
      A0_0:setVisibility("Button_Localleve_Break", true)
      if A0_0:checkGuildleveProcess(A0_0.work.journalType, A0_0.work.journalID) == true then
        A0_0.work.guildleveFailed = true
      end
      A0_0:setEnable("Button_Localleve_Retry", L10_10)
      A0_0:setEnable("Button_Localleve_Break", L11_11)
    elseif A2_2 == 1 then
      L10_10 = false
      L11_11 = true
      A0_0:setConfirmCondition("Button_Regionalleve_Retry")
      A0_0:setVisibility("Button_Regionalleve_Retry", true)
      A0_0:setConfirmCondition("Button_Regionalleve_Break")
      A0_0:setVisibility("Button_Regionalleve_Break", true)
      if A0_0:checkGuildleveProcess(A0_0.work.journalType, A0_0.work.journalID) == true then
        A0_0.work.guildleveFailed = true
      end
      if A0_0:checkGuildleveProcess(A0_0.work.journalType, A0_0.work.journalID) == true and A0_0:checkGuildleveProcess(A0_0.work.journalType, A0_0.work.journalID) == false then
        L11_11 = false
      end
      A0_0:setEnable("Button_Regionalleve_Retry", L10_10)
      A0_0:setEnable("Button_Regionalleve_Break", L11_11)
    end
    if L8_8 == true then
      L11_11 = A0_0
      L10_10 = A0_0.setConfirmCondition
      L10_10(L11_11, "Button_OpenMap")
      L11_11 = A0_0
      L10_10 = A0_0.setVisibility
      L10_10(L11_11, "Button_OpenMap", true)
      L11_11 = A0_0
      L10_10 = A0_0.setEnable
      L10_10(L11_11, "Button_OpenMap", false)
    end
    L11_11 = A0_0
    L10_10 = A0_0.setLogicalFocus
    L10_10(L11_11, "Button_Close")
    break
  else
  end
  if L7_7 == 2 then
    L9_9 = A0_0
    L8_8 = A0_0.setConfirmCondition
    L10_10 = "Button_Ready"
    L8_8(L9_9, L10_10)
    L9_9 = A0_0
    L8_8 = A0_0.setVisibility
    L10_10 = "Button_Ready"
    L11_11 = true
    L8_8(L9_9, L10_10, L11_11)
    L9_9 = A0_0
    L8_8 = A0_0.setLogicalFocus
    L10_10 = "Button_Ready"
    L8_8(L9_9, L10_10)
    break
  else
  end
  if L7_7 == 3 then
    L9_9 = A0_0
    L8_8 = A0_0.setConfirmCondition
    L10_10 = "Button_Order"
    L8_8(L9_9, L10_10)
    L9_9 = A0_0
    L8_8 = A0_0.setVisibility
    L10_10 = "Button_Order"
    L11_11 = true
    L8_8(L9_9, L10_10, L11_11)
    L9_9 = A0_0
    L8_8 = A0_0.setLogicalFocus
    L10_10 = "Button_Order"
    L8_8(L9_9, L10_10)
    break
  else
  end
  if L7_7 == 4 then
    L9_9 = A0_0
    L8_8 = A0_0.setConfirmCondition
    L10_10 = "Button_Release"
    L8_8(L9_9, L10_10)
    L9_9 = A0_0
    L8_8 = A0_0.setVisibility
    L10_10 = "Button_Release"
    L11_11 = true
    L8_8(L9_9, L10_10, L11_11)
    L9_9 = A0_0
    L8_8 = A0_0.setLogicalFocus
    L10_10 = "Button_Release"
    L8_8(L9_9, L10_10)
    do break end
    break
  else
  end
  L8_8 = A0_0
  L7_7 = A0_0.loadIconData
  L9_9 = A2_2
  L10_10 = A3_3
  L7_7(L8_8, L9_9, L10_10)
end
function JournalDetailWidget.processUICommandOperate(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17
  L5_17 = A2_14
  if L5_17 == "Button_Ready" then
  elseif L5_17 == "Button_Order" then
  else
  end
  if L5_17 == "Button_Release" then
    A0_12:setBaseAskResult(1)
    break
  else
  end
  if L5_17 == "Button_Close" then
    A0_12:finish()
    break
  else
  end
  if L5_17 == "Button_OpenMap" then
    desktopWidget:openChildWidget("MapNavigationWidget", A0_12, true, 1, A0_12.work.questIndex, A0_12.work.journalID)
    break
  else
  end
  if L5_17 == "Button_Quest_Break" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_12, true, nil, A0_12:packTextParameter(5049, A0_12.work.journalID), 2, 1348, 1349)
    A0_12.work.journalSubindex = 1
    break
  else
  end
  if L5_17 == "Button_Regionalleve_Retry" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_12, true, nil, A0_12:packTextParameter(4245, A0_12.work.journalID, A0_12.work.offerLimit), 2, 4246, 4247)
    A0_12.work.journalSubindex = 4
    break
  else
  end
  if L5_17 == "Button_Regionalleve_Break" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_12, true, nil, A0_12:packTextParameter(4242, A0_12.work.journalID), 2, 4243, 4244)
    A0_12.work.journalSubindex = 2
    break
  else
  end
  if L5_17 == "Button_Localleve_Retry" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_12, true, nil, A0_12:packTextParameter(4245, A0_12.work.journalID, A0_12.work.offerLimit), 2, 4246, 4247)
    A0_12.work.journalSubindex = 5
    break
  else
  end
  if L5_17 == "Button_Localleve_Break" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_12, true, nil, A0_12:packTextParameter(4242, A0_12.work.journalID), 2, 4243, 4244)
    A0_12.work.journalSubindex = 3
    do break end
    break
  else
  end
end
function JournalDetailWidget.processUICommandCancel(A0_18, A1_19, A2_20, A3_21, A4_22)
  A0_18:finish()
end
function JournalDetailWidget.processUICommandDefault(A0_23, A1_24, A2_25, A3_26, A4_27, A5_28)
  if A3_26 == "UILuaCommands.Shown" then
    if A0_23.work.mode == 1 then
      if A0_23.work.questCompleted == false then
        if desktopWidget:executeCommandJournalDetailInfo(A0_23.work.journalType, A0_23.work.journalID, A0_23.work.questIndex) == false then
          desktopWidget:openCommandFailedWidget(A0_23, 4311)
          return
        end
      else
        A0_23:setDetailData()
      end
    end
    if A0_23:getVisibility("Button_OpenMap") == true then
      A0_23:setEnable("Button_OpenMap", true)
      break
    else
    end
  else
  end
end
function JournalDetailWidget.finish(A0_29)
  local L1_30
  L1_30 = A0_29.work
  L1_30 = L1_30.mode
  if L1_30 == 1 then
    desktopWidget:closeWidgetDirect(A0_29)
    break
  else
  end
  A0_29:setBaseAskResult(-1)
  break
end
function JournalDetailWidget.initTemplate(A0_31, A1_32, A2_33)
  local L3_34
  L3_34 = A1_32
  if L3_34 == 1 then
    A0_31:addGuildleveTemplateTitle("Item_RewardTitle", 78523)
    if A2_33 == true then
      A0_31:addGuildleveTemplate("ControlTemplate_Label_GuildeleveBonus", "Item_RewardText")
      A0_31:addGuildleveTemplate("ControlTemplate_Label_GuildeleveBonus", "Item_RewardText2")
    else
      A0_31:addGuildleveTemplate("ControlTemplate_Label_GuildeleveItem", "Item_RewardText")
      A0_31:addGuildleveTemplate("ControlTemplate_Label_GuildeleveItem", "Item_RewardText2")
    end
    A0_31:addGuildleveTemplateTitle("Item_MemberTitle", 78524)
    A0_31:addGuildleveTemplate("ControlTemplate_Label_GuildleveEmployers", "Item_MemberText")
    A0_31:addGuildleveTemplateNormal("Item_TownTitle", "Item_TownText", 78525)
    A0_31:addGuildleveTemplateNormal("Item_LimitTitle", "Item_LimitText", 78526)
    A0_31:addGuildleveTemplateNormal("Item_PlaceTitle", "Item_PlaceText", 78527)
    A0_31:addGuildleveTemplateNormal("Item_DetailTitle", "Item_DetailText", 78528)
    A0_31:addGuildleveTemplateNormal("Item_EvaluateTitle", "Item_EvaluateText", 78529)
    A0_31:addGuildleveTemplateNormal("Item_BoostTitle", "Item_BoosttText", 78530)
    break
  else
  end
  if L3_34 == 2 then
    A0_31:addGuildleveTemplate("ControlTemplate_Label_PassiveGLCurrentStatus", "Item_Status", "TextBlock_ConditionItemName", 78543)
    A0_31:addGuildleveTemplateNormal("Item_DetailTitle", "Item_DetailText", 78528)
    A0_31:addGuildleveTemplateNormal("Item_RewardTitle", "Item_RewardText", 78523)
    A0_31:addGuildleveTemplateNormal("Item_TownTitle", "Item_TownText", 78525)
    A0_31:addGuildleveTemplateTitle("Item_MemberTitle", 78524)
    A0_31:addGuildleveTemplate("ControlTemplate_Label_GuildleveEmployers", "Item_MemberText")
    A0_31:addGuildleveTemplateNormal("Item_PlaceTitle", "Item_PlaceText", 78527)
    A0_31:addGuildleveTemplateNormal("Item_OfficerTitle", "Item_OfficerText", 78531)
    do break end
    break
  else
  end
end
function JournalDetailWidget.addGuildleveTemplate(A0_35, A1_36, A2_37, A3_38, A4_39)
  A0_35:_addItem(nil, "StackPanel_Guildeleve", A1_36, A2_37)
  if A3_38 ~= nil then
    A0_35:setItemHelpParameter(A2_37, A3_38, 1, A4_39)
  end
end
function JournalDetailWidget.addGuildleveTemplateTitle(A0_40, A1_41, A2_42)
  A0_40:addGuildleveTemplate("ControlTemplate_Label_GuildleveItemTitle", A1_41, "TextBlock_ItemTitle", A2_42)
end
function JournalDetailWidget.addGuildleveTemplateNormal(A0_43, A1_44, A2_45, A3_46)
  A0_43:addGuildleveTemplateTitle(A1_44, A3_46)
  A0_43:addGuildleveTemplate("ControlTemplate_Label_GuildeleveItem", A2_45)
end
function JournalDetailWidget.loadIconData(A0_47, A1_48, A2_49)
  local L3_50, L4_51, L5_52
  L3_50 = A0_47.work
  L3_50.townIcon = 0
  L3_50 = A0_47.work
  L3_50.designIcon = 0
  L3_50 = A0_47.work
  L3_50.frameIcon = 0
  L3_50 = A0_47.work
  L3_50.skillIcon = 0
  L3_50 = A0_47.work
  L3_50.skillIconHelp = 0
  L3_50 = A1_48
  if L3_50 == 1 then
    L4_51 = guildleveUISheet
    L5_52 = L4_51
    L4_51 = L4_51._loadKeyTemporarily
    L4_51(L5_52, A2_49, A2_49)
    L4_51 = A0_47.work
    L5_52 = guildleveUISheet
    L5_52 = L5_52._getData
    L5_52 = L5_52(L5_52, A2_49, 75)
    L4_51.townIcon = L5_52
    L4_51 = A0_47.work
    L5_52 = guildleveUISheet
    L5_52 = L5_52._getData
    L5_52 = L5_52(L5_52, A2_49, 76)
    L4_51.designIcon = L5_52
    L4_51 = A0_47.work
    L5_52 = guildleveUISheet
    L5_52 = L5_52._getData
    L5_52 = L5_52(L5_52, A2_49, 77)
    L4_51.frameIcon = L5_52
    L4_51 = A0_47.work
    L5_52 = A0_47.work
    L4_51.skillIcon, L5_52.skillIconHelp = desktopWidget:getJournalIconID(1, A2_49)
    break
  else
  end
  if L3_50 == 2 then
    L4_51 = passiveGLIconSheet
    L5_52 = L4_51
    L4_51 = L4_51._loadKeyTemporarily
    L4_51(L5_52, A2_49, A2_49)
    L4_51 = A0_47.work
    L5_52 = passiveGLIconSheet
    L5_52 = L5_52._getData
    L5_52 = L5_52(L5_52, A2_49, 3)
    L4_51.townIcon = L5_52
    L4_51 = A0_47.work
    L5_52 = passiveGLIconSheet
    L5_52 = L5_52._getData
    L5_52 = L5_52(L5_52, A2_49, 4)
    L4_51.designIcon = L5_52
    L4_51 = A0_47.work
    L5_52 = passiveGLIconSheet
    L5_52 = L5_52._getData
    L5_52 = L5_52(L5_52, A2_49, 5)
    L4_51.frameIcon = L5_52
    L4_51 = questSheet
    L5_52 = L4_51
    L4_51 = L4_51._loadKeyTemporarily
    L4_51(L5_52, A2_49, A2_49)
    L4_51 = questSheet
    L5_52 = L4_51
    L4_51 = L4_51._getData
    L4_51 = L4_51(L5_52, A2_49, 52)
    L5_52 = L4_51
    if L5_52 == 329 then
      A0_47.work.skillIcon = 607
      A0_47.work.skillIconHelp = 78478
      break
    else
    end
    if L5_52 == 330 then
      A0_47.work.skillIcon = 600
      A0_47.work.skillIconHelp = 78479
      break
    else
    end
    if L5_52 == 331 then
      A0_47.work.skillIcon = 601
      A0_47.work.skillIconHelp = 78480
      break
    else
    end
    if L5_52 == 332 then
      A0_47.work.skillIcon = 604
      A0_47.work.skillIconHelp = 78481
      break
    else
    end
    if L5_52 == 333 then
      A0_47.work.skillIcon = 606
      A0_47.work.skillIconHelp = 78482
      break
    else
    end
    if L5_52 == 334 then
      A0_47.work.skillIcon = 603
      A0_47.work.skillIconHelp = 78483
      break
    else
    end
    if L5_52 == 335 then
      A0_47.work.skillIcon = 605
      A0_47.work.skillIconHelp = 78484
      break
    else
    end
    if L5_52 == 336 then
      A0_47.work.skillIcon = 602
      A0_47.work.skillIconHelp = 78485
      do break end
      do break end
      do break end
      do break end
      else
      end
      if L3_50 == 3 then
        L4_51 = A0_47.work
        L5_52 = A0_47.work
        L4_51.skillIcon, L5_52.skillIconHelp = desktopWidget:getJournalIconID(A1_48, A2_49)
      else
      end
    else
    end
end
function JournalDetailWidget.setDetailData(A0_53, A1_54, A2_55, A3_56, A4_57, A5_58, A6_59, A7_60, A8_61)
  local L9_62, L10_63, L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L17_70
  L9_62 = A0_53.work
  L9_62 = L9_62.journalType
  if L9_62 == 1 then
    L10_63 = A1_54
    L11_64 = A2_55
    L12_65 = A3_56
    L13_66 = A4_57
    L14_67 = A5_58
    L15_68 = A6_59
    L16_69 = A7_60
    L17_70 = A8_61
    A0_53:setIcon("IconControl_Category", A0_53:getIconID())
    A0_53:setHelpParameter("IconControl_Category", 1, A0_53:getIconHelpID())
    A0_53:setVisibility("IconControl_Category", true)
    A0_53:setText("TextBlock_Title", 4101, A0_53.work.journalID)
    A0_53:setVisibility("TextBlock_Title", true)
    A0_53:setText("TextBlock_Type", 4223, A0_53.work.journalID)
    A0_53:setVisibility("TextBlock_Type", true)
    A0_53:setText("TextBlock_Target", 4103, A0_53.work.journalID)
    A0_53:setVisibility("TextBlock_Target", true)
    A0_53:setIcon("IconControl_GuildeleveTownName", A0_53.work.townIcon)
    A0_53:setIcon("IconControl_GuildeleveCard", A0_53.work.designIcon)
    A0_53:setIcon("IconControl_GuildeleveFrame", A0_53.work.frameIcon)
    A0_53:setInfoData("Item_TownTitle", 4121, "Item_TownText", 4122, A0_53.work.journalID)
    A0_53:setInfoData("Item_LimitTitle", 4213, "Item_LimitText", 4142, A0_53.work.journalID)
    A0_53:setItemText("Item_MemberTitle", "TextBlock_ItemTitle", 4210)
    A0_53:setItemText("Item_MemberText", "TextBlock_EmployersText_1", 4224, A0_53.work.journalID)
    A0_53:setItemText("Item_MemberText", "TextBlock_EmployersText_2", 4152, A0_53.work.journalID)
    A0_53:setInfoData("Item_PlaceTitle", 4211, "Item_PlaceText", 4132, A0_53.work.journalID)
    A0_53:setInfoData("Item_DetailTitle", 4212, "Item_DetailText", 4192, A0_53.work.journalID)
    A0_53:setVisibility("IconControl_StageIcon", L17_70)
    A0_53:setItemText("Item_RewardTitle", "TextBlock_ItemTitle", 4214)
    A0_53:setRewardData("Item_RewardText", L12_65, L13_66)
    A0_53:setRewardData("Item_RewardText2", L14_67, L15_68)
    if L16_69 >= 1 then
      A0_53:setItemText("Item_EvaluateTitle", "TextBlock_ItemTitle", 4209)
      A0_53:setItemText("Item_EvaluateText", "TextBlock_ItemText", 4236, L16_69)
    else
      A0_53:setItemVisibility("Item_EvaluateTitle", "TextBlock_ItemTitle", false)
      A0_53:setItemVisibility("Item_EvaluateTitle", "Border_Title1", false)
      A0_53:setItemVisibility("Item_EvaluateTitle", "Border_Title2", false)
      A0_53:setItemVisibility("Item_EvaluateText", "TextBlock_ItemText", false)
    end
    A0_53:setItemVisibility("Item_BoostTitle", "TextBlock_ItemTitle", false)
    A0_53:setItemVisibility("Item_BoostTitle", "Border_Title1", false)
    A0_53:setItemVisibility("Item_BoostTitle", "Border_Title2", false)
    A0_53:setItemVisibility("Item_BoosttText", "TextBlock_ItemText", false)
    A0_53:setVisibility("ScrollViewer_GuildeleveArea", true)
    if A0_53.work.guildleveFailed == true and L10_63 ~= nil and L10_63 > 0 then
      A0_53:setEnable("Button_Regionalleve_Retry", true)
      A0_53.work.offerLimit = L10_63
      do break end
      else
      end
      if L9_62 == 2 then
        L10_63 = A1_54
        L11_64 = A3_56
        L12_65 = A4_57
        L13_66 = A5_58
        L14_67 = A6_59
        L15_68 = A7_60
        if L13_66 ~= nil and L13_66 > 0 then
          L17_70 = A0_53
          L16_69 = A0_53.setItemText
          L16_69(L17_70, "Item_Status", "TextBlock_ConditionItemName", 4216)
          L17_70 = A0_53
          L16_69 = A0_53.setItemText
          L16_69(L17_70, "Item_Status", "TextBlock_NumberOfSuccesses", 4217)
          L17_70 = A0_53
          L16_69 = A0_53.setItemText
          L16_69(L17_70, "Item_Status", "TextBlock_NumberOfSuccessesValue", tostring(L11_64))
          L17_70 = A0_53
          L16_69 = A0_53.setItemText
          L16_69(L17_70, "Item_Status", "TextBlock_NumberRemaining", 4218)
          L17_70 = A0_53
          L16_69 = A0_53.setItemText
          L16_69(L17_70, "Item_Status", "TextBlock_NumberRemainingValue", tostring(L12_65))
        else
          L17_70 = A0_53
          L16_69 = A0_53.setItemVisibility
          L16_69(L17_70, "Item_Status", "Item_Status", false)
        end
        L17_70 = A0_53
        L16_69 = A0_53.setIcon
        L16_69(L17_70, "IconControl_Category", A0_53:getIconID())
        L17_70 = A0_53
        L16_69 = A0_53.setHelpParameter
        L16_69(L17_70, "IconControl_Category", 1, A0_53:getIconHelpID())
        L17_70 = A0_53
        L16_69 = A0_53.setVisibility
        L16_69(L17_70, "IconControl_Category", true)
        L17_70 = A0_53
        L16_69 = A0_53.setText
        L16_69(L17_70, "TextBlock_Title", 4219, A0_53.work.journalID)
        L17_70 = A0_53
        L16_69 = A0_53.setVisibility
        L16_69(L17_70, "TextBlock_Title", true)
        L17_70 = A0_53
        L16_69 = A0_53.setText
        L16_69(L17_70, "TextBlock_Type", 4221, A0_53.work.journalID)
        L17_70 = A0_53
        L16_69 = A0_53.setVisibility
        L16_69(L17_70, "TextBlock_Type", true)
        L17_70 = A0_53
        L16_69 = A0_53.setText
        L16_69(L17_70, "TextBlock_Target", 4220, A0_53.work.journalID)
        L17_70 = A0_53
        L16_69 = A0_53.setVisibility
        L16_69(L17_70, "TextBlock_Target", true)
        L17_70 = A0_53
        L16_69 = A0_53.setIcon
        L16_69(L17_70, "IconControl_GuildeleveTownName", A0_53.work.townIcon)
        L17_70 = A0_53
        L16_69 = A0_53.setIcon
        L16_69(L17_70, "IconControl_GuildeleveCard", A0_53.work.designIcon)
        L17_70 = A0_53
        L16_69 = A0_53.setIcon
        L16_69(L17_70, "IconControl_GuildeleveFrame", A0_53.work.frameIcon)
        L17_70 = A0_53
        L16_69 = A0_53.setInfoData
        L16_69(L17_70, "Item_TownTitle", 4121, "Item_TownText", 4225, A0_53.work.journalID)
        L17_70 = A0_53
        L16_69 = A0_53.setItemText
        L16_69(L17_70, "Item_MemberTitle", "TextBlock_ItemTitle", 4210)
        L17_70 = A0_53
        L16_69 = A0_53.setItemText
        L16_69(L17_70, "Item_MemberText", "TextBlock_EmployersText_1", 4226, A0_53.work.journalID, L10_63)
        L17_70 = A0_53
        L16_69 = A0_53.setItemText
        L16_69(L17_70, "Item_MemberText", "TextBlock_EmployersText_2", 4227, A0_53.work.journalID, L10_63)
        L17_70 = A0_53
        L16_69 = A0_53.setInfoData
        L16_69(L17_70, "Item_PlaceTitle", 4211, "Item_PlaceText", 4228, A0_53.work.journalID)
        L17_70 = A0_53
        L16_69 = A0_53.setInfoData
        L16_69(L17_70, "Item_OfficerTitle", 4215, "Item_OfficerText", 4230, A0_53.work.journalID)
        L17_70 = A0_53
        L16_69 = A0_53.setItemText
        L16_69(L17_70, "Item_RewardTitle", "TextBlock_ItemTitle", 4214)
        L17_70 = A0_53
        L16_69 = A0_53.setItemText
        L16_69(L17_70, "Item_RewardText", "TextBlock_ItemText", 4231, A0_53.work.journalID, L10_63)
        L17_70 = A0_53
        L16_69 = A0_53.setInfoData
        L16_69(L17_70, "Item_DetailTitle", 4212, "Item_DetailText", 4229, A0_53.work.journalID, L10_63)
        L17_70 = A0_53
        L16_69 = A0_53.setVisibility
        L16_69(L17_70, "ScrollViewer_GuildeleveArea", true)
        L16_69 = A0_53.work
        L16_69 = L16_69.guildleveFailed
        if L16_69 == true and L15_68 ~= nil and L15_68 > 0 then
          L17_70 = A0_53
          L16_69 = A0_53.setEnable
          L16_69(L17_70, "Button_Localleve_Retry", true)
          L16_69 = A0_53.work
          L16_69.offerLimit = L15_68
          do break end
          else
          end
          if L9_62 == 3 then
            L11_64 = A0_53
            L10_63 = A0_53.setIcon
            L12_65 = "IconControl_Category"
            L14_67 = A0_53
            L13_66 = A0_53.getIconID
            L17_70 = L13_66(L14_67)
            L10_63(L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L17_70, L13_66(L14_67))
            L11_64 = A0_53
            L10_63 = A0_53.setHelpParameter
            L12_65 = "IconControl_Category"
            L13_66 = 1
            L15_68 = A0_53
            L14_67 = A0_53.getIconHelpID
            L17_70 = L14_67(L15_68)
            L10_63(L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L17_70, L14_67(L15_68))
            L11_64 = A0_53
            L10_63 = A0_53.setVisibility
            L12_65 = "IconControl_Category"
            L13_66 = true
            L10_63(L11_64, L12_65, L13_66)
            L11_64 = A0_53
            L10_63 = A0_53.setText
            L12_65 = "TextBlock_Title"
            L13_66 = 5001
            L14_67 = A0_53.work
            L14_67 = L14_67.journalID
            L10_63(L11_64, L12_65, L13_66, L14_67)
            L11_64 = A0_53
            L10_63 = A0_53.setVisibility
            L12_65 = "TextBlock_Title"
            L13_66 = true
            L10_63(L11_64, L12_65, L13_66)
            L11_64 = A0_53
            L10_63 = A0_53.setText
            L12_65 = "TextBlock_TracksTitle"
            L13_66 = 5023
            L10_63(L11_64, L12_65, L13_66)
            L10_63 = A0_53.work
            L10_63 = L10_63.questCompleted
            if L10_63 == false then
              if A1_54 == nil then
                A1_54 = 0
              end
              if A2_55 == nil then
                A2_55 = 0
              end
              if A3_56 == nil then
                A3_56 = 0
              end
              if A4_57 == nil then
                A4_57 = 0
              end
              if A5_58 == nil then
                A5_58 = 0
              end
              if A6_59 == nil then
                A6_59 = 0
              end
              if A7_60 == nil then
                A7_60 = " "
              end
              L11_64 = A0_53
              L10_63 = A0_53.setText
              L12_65 = "TextBlock_NowStoryTitle"
              L13_66 = 5022
              L10_63(L11_64, L12_65, L13_66)
              L11_64 = A0_53
              L10_63 = A0_53.setText
              L12_65 = "TextBlock_NowCondition"
              L13_66 = 5004
              L14_67 = A0_53.work
              L14_67 = L14_67.journalID
              L15_68 = A1_54
              L16_69 = A2_55
              L17_70 = A3_56
              L10_63(L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L17_70, A4_57, A5_58, A6_59, A7_60)
              L11_64 = A0_53
              L10_63 = A0_53.setText
              L12_65 = "TextBlock_QuestItemTitle"
              L13_66 = 5021
              L10_63(L11_64, L12_65, L13_66)
              L11_64 = A0_53
              L10_63 = A0_53.setText
              L12_65 = "TextBlock_QuestItem"
              L13_66 = 4001
              L14_67 = A0_53.work
              L14_67 = L14_67.journalID
              L15_68 = A1_54
              L16_69 = A2_55
              L17_70 = A3_56
              L10_63(L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L17_70, A4_57, A5_58, A6_59, A7_60)
              L11_64 = A0_53
              L10_63 = A0_53.setText
              L12_65 = "TextBlock_OldCondition"
              L13_66 = 5005
              L14_67 = A0_53.work
              L14_67 = L14_67.journalID
              L15_68 = A1_54
              L16_69 = A2_55
              L17_70 = A3_56
              L10_63(L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L17_70, A4_57, A5_58, A6_59, A7_60)
            else
              L11_64 = A0_53
              L10_63 = A0_53.setVisibility
              L12_65 = "Label_Now"
              L13_66 = false
              L10_63(L11_64, L12_65, L13_66)
              L11_64 = A0_53
              L10_63 = A0_53.setVisibility
              L12_65 = "Label_QuestItem"
              L13_66 = false
              L10_63(L11_64, L12_65, L13_66)
              L11_64 = A0_53
              L10_63 = A0_53.setText
              L12_65 = "TextBlock_OldCondition"
              L13_66 = 5024
              L14_67 = A0_53.work
              L14_67 = L14_67.journalID
              L10_63(L11_64, L12_65, L13_66, L14_67)
            end
            L11_64 = A0_53
            L10_63 = A0_53.setVisibility
            L12_65 = "ScrollViewer_QuestArea"
            L13_66 = true
            L10_63(L11_64, L12_65, L13_66)
            break
          else
          end
        else
        end
    else
    end
end
function JournalDetailWidget.setInfoData(A0_71, A1_72, A2_73, A3_74, A4_75, ...)
  A0_71:setItemText(A1_72, "TextBlock_ItemTitle", A2_73)
  A0_71:setItemText(A3_74, "TextBlock_ItemText", A4_75, ...)
end
function JournalDetailWidget.setRewardData(A0_77, A1_78, A2_79, A3_80)
  local L4_81
  if A2_79 ~= 0 then
    L4_81 = nil
    if A2_79 == 1000001 then
      L4_81 = 4172
    else
      L4_81 = 4182
    end
    A0_77:setItemText(A1_78, "TextBlock_ItemText", L4_81, A2_79, A3_80)
  else
    L4_81 = A0_77.setItemVisibility
    L4_81(A0_77, A1_78, "TextBlock_ItemText", false)
  end
end
function JournalDetailWidget.getIconID(A0_82)
  return A0_82.work.skillIcon
end
function JournalDetailWidget.getIconHelpID(A0_83)
  return A0_83.work.skillIconHelp
end
function JournalDetailWidget.processAskResult(A0_84, A1_85)
  if A1_85 == 1 and A0_84.work.journalSubindex > 0 then
    if desktopWidget:executeJournalCommand(A0_84.work.journalType, A0_84.work.journalID, A0_84.work.journalSubindex) == true then
      desktopWidget:closeWidgetDirect(A0_84)
      A0_84.work.journalSubindex = 0
    else
      desktopWidget:openCommandFailedWidget(A0_84, 4311)
    end
  end
end
function JournalDetailWidget.processErrorDialogResult(A0_86, A1_87)
  desktopWidget:closeWidgetDirect(A0_86)
end
function JournalDetailWidget.checkGuildleveProcess(A0_88, A1_89, A2_90)
  local L3_91, L4_92, L5_93
  L3_91 = false
  L4_92 = false
  L5_93 = false
  if A1_89 == 1 then
    L4_92 = worldMaster:_getMyPlayer():isDoneGuildleveById(A2_90)
    L3_91 = worldMaster:_getMyPlayer():isCheckedGuildleveById(A2_90)
    if L4_92 == true and L3_91 == false then
      L5_93 = true
    end
  elseif A1_89 == 2 then
    L4_92 = worldMaster:_getMyPlayer():isDoneLocalleveById(A2_90)
    L3_91 = worldMaster:_getMyPlayer():isCheckedLocalleveById(A2_90)
    if L4_92 == true and L3_91 == false then
      L5_93 = true
    end
  end
  return L3_91, L4_92, L5_93
end
