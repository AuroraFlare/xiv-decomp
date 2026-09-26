require("/Widget/WidgetBaseClass")
_defineClass("ConsoleIconTrayWidget", "WidgetBaseClass")
function ConsoleIconTrayWidget.init(A0_0)
  A0_0.work._temp = {
    {"askType", "integer8"},
    {"helpID", "integer8"},
    {
      "helpFlag",
      "array",
      5,
      "boolean"
    }
  }
  A0_0.work.askType = 0
  A0_0.work.helpID = 0
  for _FORV_4_ = 1, 5 do
    A0_0.work.helpFlag[_FORV_4_] = false
  end
  A0_0:setVisibility("Button_Push_6" .. ":Border_Arrow", false)
  A0_0:setVisibility("Button_Push_7" .. ":Border_Arrow", false)
  A0_0:setVisibility("Button_Push_8" .. ":Border_Arrow", false)
  A0_0:setVisibility("Button_Push_9" .. ":Border_Arrow", false)
  A0_0:setConfirmCondition("Button_BattleMode")
  A0_0:setConfirmCondition("Button_ItemUse")
  A0_0:setConfirmCondition("Button_QuestLinkPearl")
  A0_0:setConfirmCondition("Button_EmoteList")
  A0_0:setConfirmCondition("Button_MainMenu")
  A0_0:setConfirmCondition("Button_ChocoboRiding")
  A0_0:setConfirmCondition("Button_GoobbueRiding")
  A0_0:setConfirmCondition("Button_CraftGathering")
  A0_0:setConfirmCondition("Button_Conditions_1")
  A0_0:setConfirmCondition("Button_Conditions_2")
  A0_0:setConfirmCondition("Button_Conditions_3")
  A0_0:setConfirmCondition("Button_Conditions_4")
  A0_0:setConfirmCondition("Button_Conditions_5")
  A0_0:setConfirmCondition("Button_Conditions_6")
  A0_0:setConfirmCondition("Button_Conditions_7")
  A0_0:setConfirmCondition("Button_Conditions_8")
  A0_0:setConfirmCondition("Button_Conditions_9")
  A0_0:setConfirmCondition("Button_Push_1")
  A0_0:setConfirmCondition("Button_Push_2")
  A0_0:setConfirmCondition("Button_Push_3")
  A0_0:setConfirmCondition("Button_Push_4")
  A0_0:setConfirmCondition("Button_Push_5")
  A0_0:setConfirmCondition("Button_Push_6")
  A0_0:setConfirmCondition("Button_Push_7")
  A0_0:setConfirmCondition("Button_Push_8")
  A0_0:setConfirmCondition("Button_Push_9")
  A0_0:setConfirmCondition("Button_Push_10")
  A0_0:setCancelCondition()
  A0_0:setControlCommandCondition("ToggleButton_WidgetLock", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_PopupHelp", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_PopupHelp_ActionBar", "UILuaCommands.ToggleButton")
  A0_0:setUICommandCondition("UILuaCommands.Deactivated")
  A0_0:setUICommandCondition("UIFormCommands.TimerFinish")
  A0_0:setControlUserWorkInt(1, "Button_Conditions_4", 24203)
  A0_0:setControlUserWorkInt(1, "ToggleButton_WidgetLock", 37)
  A0_0:setControlUserWorkInt(1, "ToggleButton_PopupHelp", 33)
  A0_0:setControlUserWorkInt(1, "ToggleButton_PopupHelp_ActionBar", 71)
  A0_0:update()
  A0_0:updateUILock()
  A0_0:updateQuestLinkPerlIcon()
end
function ConsoleIconTrayWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  local L5_6, L6_7, L7_8, L8_9
  L5_6 = true
  L6_7 = A2_3
  if L6_7 == "Button_MainMenu" then
    L8_9 = A0_1
    L7_8 = A0_1.sendDesktopCommand
    L7_8(L8_9, "UILuaCommands.MainMenu")
    L5_6 = false
    break
  else
  end
  if L6_7 == "Button_BattleMode" then
    L8_9 = A0_1
    L7_8 = A0_1.sendDesktopCommand
    L7_8(L8_9, "UILuaCommands.ChangeActivateMode")
    L5_6 = false
    break
  else
  end
  if L6_7 == "Button_ItemUse" then
    L8_9 = A0_1
    L7_8 = A0_1.openUseItemList
    L7_8(L8_9)
    break
  else
  end
  if L6_7 == "Button_EmoteList" then
    L8_9 = A0_1
    L7_8 = A0_1.openEmoteList
    L7_8(L8_9)
    break
  else
  end
  if L6_7 == "Button_ChocoboRiding" then
    L7_8 = desktopWidget
    L8_9 = L7_8
    L7_8 = L7_8.executeCallChocobo
    L7_8(L8_9)
    L5_6 = false
    break
  else
  end
  if L6_7 == "Button_GoobbueRiding" then
    L7_8 = desktopWidget
    L8_9 = L7_8
    L7_8 = L7_8.executeCallGoobbue
    L7_8(L8_9)
    L5_6 = false
    break
  else
  end
  if L6_7 == "Button_Conditions_1" then
    L7_8 = desktopWidget
    L8_9 = L7_8
    L7_8 = L7_8.executePlayerCheck
    L7_8(L8_9)
    break
  else
  end
  if L6_7 == "Button_Conditions_2" then
    L7_8 = desktopWidget
    L8_9 = L7_8
    L7_8 = L7_8.executeBazaarCommand
    L7_8(L8_9)
    break
  else
  end
  if L6_7 == "Button_CraftGathering" then
    L8_9 = A0_1
    L7_8 = A0_1.getControlUserWorkInt
    L7_8 = L7_8(L8_9, 1, A2_3)
    if L7_8 == 22001 then
      L8_9 = desktopWidget
      L8_9 = L8_9.executeCraftCommand
      L8_9(L8_9)
    else
      L8_9 = desktopWidget
      L8_9 = L8_9.executePlayerSystemCommand
      L8_9(L8_9, L7_8)
      do break end
      elseif L6_7 == "Button_Conditions_3" then
      else
      end
      if L6_7 == "Button_Conditions_4" then
        L8_9 = A0_1
        L7_8 = A0_1.getControlUserWorkInt
        L7_8 = L7_8(L8_9, 1, A2_3)
        L8_9 = desktopWidget
        L8_9 = L8_9.executePlayerSystemCommand
        L8_9(L8_9, L7_8)
        L5_6 = false
        break
      else
      end
      if L6_7 == "Button_Conditions_5" then
        L8_9 = A0_1
        L7_8 = A0_1.getControlUserWorkInt
        L7_8 = L7_8(L8_9, 1, A2_3)
        if L7_8 == 24232 then
          L8_9 = desktopWidget
          L8_9 = L8_9.executePlayerCurrentLinkshellInvite
          L8_9(L8_9)
        else
          L8_9 = desktopWidget
          L8_9 = L8_9.executePlayerTargetLinkshellInviteCancel
          L8_9(L8_9)
        end
        L5_6 = false
        break
      else
      end
      if L6_7 == "Button_Conditions_6" then
        L7_8 = desktopWidget
        L8_9 = L7_8
        L7_8 = L7_8.executePlayerBonusPointAssign
        L7_8(L8_9)
        L5_6 = false
        break
      else
      end
      if L6_7 == "Button_Push_10" then
        L7_8 = desktopWidget
        L8_9 = L7_8
        L7_8 = L7_8.openDropItemWidget
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Conditions_8" then
        L7_8 = desktopWidget
        L8_9 = L7_8
        L7_8 = L7_8.executePlayerRepair
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Conditions_9" then
        L7_8 = desktopWidget
        L8_9 = L7_8
        L7_8 = L7_8.openMateriaAttachContractWidget
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_QuestLinkPearl" then
        L8_9 = A0_1
        L7_8 = A0_1.sendDesktopCommand
        L7_8(L8_9, "UILuaCommands.ShortCutActionQuestLSMenu")
        break
      else
      end
      if L6_7 == "Button_Push_1" then
        L8_9 = A0_1
        L7_8 = A0_1.openConfirmPartyWidget
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Push_2" then
        L8_9 = A0_1
        L7_8 = A0_1.openConfirmLinkshellWidget
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Push_3" then
        L8_9 = A0_1
        L7_8 = A0_1.openConfirmTelepoWidget
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Push_4" then
        L8_9 = A0_1
        L7_8 = A0_1.openConfirmTradeWidget
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Push_5" then
        L8_9 = A0_1
        L7_8 = A0_1.openConfirmRaiseWidget
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Push_6" then
        L7_8 = desktopWidget
        L8_9 = L7_8
        L7_8 = L7_8.executeNegotiationCommand
        L7_8(L8_9)
        break
      else
      end
      if L6_7 == "Button_Push_7" then
        L8_9 = A0_1
        L7_8 = A0_1.getControlUserWorkInt
        L7_8 = L7_8(L8_9, 1, A2_3)
        L8_9 = desktopWidget
        L8_9 = L8_9.executePlayerSystemCommand
        L8_9(L8_9, 24301, L7_8)
        L5_6 = false
        break
      else
      end
      if L6_7 == "Button_Push_8" then
        L8_9 = A0_1
        L7_8 = A0_1.getContentSubTargetType
        L7_8 = L7_8(L8_9)
        if L7_8 ~= nil then
          if L7_8 == 100 then
            L8_9 = desktopWidget
            L8_9 = L8_9.executePlayerSystemCommand
            L8_9(L8_9, 24302)
          else
            L8_9 = A0_1.requestSelectSubTarget
            L8_9(A0_1, L7_8, true)
          end
        end
        L5_6 = false
        break
      else
      end
      if L6_7 == "Button_Push_9" then
        L8_9 = A0_1
        L7_8 = A0_1.getControlUserWorkInt
        L7_8 = L7_8(L8_9, 1, A2_3)
        L8_9 = nil
        if L7_8 ~= 0 then
          L8_9 = L7_8
        end
        desktopWidget:executePlayerSystemCommand(24312, L8_9)
        L5_6 = false
        do break end
        break
      else
      end
    end
  if L5_6 == false then
    L7_8 = A0_1
    L6_7 = A0_1.setFocusable
    L8_9 = false
    L6_7(L7_8, L8_9)
  end
  L7_8 = A0_1
  L6_7 = A0_1.getFocusable
  L6_7 = L6_7(L7_8)
  if L6_7 == false then
    L7_8 = A0_1
    L6_7 = A0_1.cancelFocus
    L6_7(L7_8)
  end
end
function ConsoleIconTrayWidget.processUICommandCancel(A0_10, A1_11, A2_12, A3_13, A4_14)
  A0_10:cancelFocus()
  A0_10:setFocusable(false)
end
function ConsoleIconTrayWidget.processUICommandToggleButton(A0_15, A1_16, A2_17, A3_18, A4_19, A5_20)
  local L6_21, L7_22
  L7_22 = A0_15
  L6_21 = A0_15.getControlUserWorkInt
  L6_21 = L6_21(L7_22, 1, A2_17)
  L7_22 = 0
  if A5_20 == true then
    L7_22 = 1
  end
  desktopWidget:setConfigWorkWithSave(L6_21, L7_22)
end
function ConsoleIconTrayWidget.processUICommandDefault(A0_23, A1_24, A2_25, A3_26, A4_27, A5_28)
  local L6_29
  L6_29 = A3_26
  if L6_29 == "UILuaCommands.Deactivated" then
    A0_23:cancelFocus()
    A0_23:setFocusable(false)
    break
  else
  end
  if L6_29 == "UIFormCommands.TimerFinish" then
    A0_23:sendControlCommand("Label_BalloonHelp", "UILuaCommands.BalloonWindowOFF")
    A0_23:sendControlCommand(A0_23:getControlUserWorkString(1, "Label_BalloonHelp"), "UILuaCommands.BalloonArrowOFF")
    do break end
    break
  else
  end
end
function ConsoleIconTrayWidget.openEmoteList(A0_30)
  if A0_30:getChildWidgetByWindowName("EmoteListWidget") ~= nil then
    return true
  end
  return desktopWidget:openChildWidget("EmoteListWidget", A0_30, true)
end
function ConsoleIconTrayWidget.openUseItemList(A0_31)
  if A0_31:getChildWidgetByWindowName("ItemUseWidget") ~= nil then
    return true
  end
  return desktopWidget:openChildWidget("ItemUseWidget", A0_31, true)
end
function ConsoleIconTrayWidget.updateButtonMask(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37
  L1_33 = false
  L2_34 = false
  L3_35 = false
  L4_36 = desktopWidget
  L5_37 = L4_36
  L4_36 = L4_36.getTutorialMenuType
  L4_36 = L4_36(L5_37)
  L5_37 = L4_36
  if L5_37 == 1 then
  else
  end
  if L5_37 == 2 then
    L3_35 = true
    break
  else
    if L5_37 == 4 then
      break
    else
      if L5_37 == 3 then
      else
      end
    end
    L1_33 = true
    L2_34 = true
    L3_35 = true
    break
  end
  L5_37 = false
  if desktopWidget:isTutorialLock(4) == false then
    L5_37 = true
  end
  A0_32:setButtonMask("Button_BattleMode", L5_37)
  A0_32:setButtonMask("Button_ItemUse", L1_33)
  A0_32:setButtonMask("Button_EmoteList", L2_34)
  A0_32:setButtonMask("Button_MainMenu", L3_35)
end
function ConsoleIconTrayWidget.update(A0_38)
  A0_38:updateCraftButton()
  A0_38:updatePushButton()
  A0_38:updateConditionButton()
  A0_38:updateChocoboStatus()
  A0_38:updateGoobbueStatus()
end
function ConsoleIconTrayWidget.updateCraftButton(A0_39)
  local L1_40, L2_41, L3_42
  L1_40 = 22001
  L2_41 = 0
  L3_42 = desktopWidget
  L3_42 = L3_42.isExistCraftCommand
  L3_42 = L3_42(L3_42)
  if L3_42 == false then
    L2_41 = desktopWidget:getGatherPlaceDrivenCommandID()
    if L2_41 ~= 0 then
      L1_40 = 24301
      L3_42 = true
    end
  end
  if L3_42 == true then
    A0_39:setIconLocal("Button_CraftGathering", A0_39:getCraftIconID())
    A0_39:setControlUserWorkInt(1, "Button_CraftGathering", L1_40)
    A0_39:setHelpParameter("Button_CraftGathering", 1, A0_39:getCraftHelpTexID(L2_41))
  end
  A0_39:setVisibility("Button_CraftGathering", L3_42)
end
function ConsoleIconTrayWidget.getCraftIconID(A0_43)
  local L1_44
  L1_44 = 0
  if worldMaster:_getMyPlayer():getStateMainSkill() == 29 then
    L1_44 = 875
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 30 then
    L1_44 = 868
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 31 then
    L1_44 = 869
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 32 then
    L1_44 = 872
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 33 then
    L1_44 = 874
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 34 then
    L1_44 = 871
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 35 then
    L1_44 = 873
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 36 then
    L1_44 = 870
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 39 then
    L1_44 = 865
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 40 then
    L1_44 = 866
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 41 then
    L1_44 = 867
    do break end
    break
  else
  end
  return L1_44
end
function ConsoleIconTrayWidget.getCraftHelpTexID(A0_45, A1_46)
  local L2_47, L3_48
  L2_47 = 74601
  L3_48 = A1_46
  if L3_48 == 20001 then
    L2_47 = 74602
    break
  else
  end
  if L3_48 == 20002 then
    L2_47 = 74603
    break
  else
  end
  if L3_48 == 30003 then
    L2_47 = 74604
    break
  else
  end
  if L3_48 == 20005 then
    L2_47 = 74626
    break
  else
  end
  if L3_48 == 20006 then
    L2_47 = 74627
    break
  else
  end
  if L3_48 == 20007 then
    L2_47 = 74628
    do break end
    break
  else
  end
  return L2_47
end
function ConsoleIconTrayWidget.updatePushButton(A0_49)
  local L1_50, L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61, L13_62, L14_63, L15_64, L16_65, L17_66, L18_67, L19_68
  L1_50 = {}
  L2_51 = {}
  L3_52 = false
  L4_53 = false
  L5_54 = false
  L6_55 = false
  L7_56 = false
  L8_57, L9_58 = nil, nil
  L10_59 = worldMaster
  L11_60 = L10_59
  L10_59 = L10_59._getMyPlayer
  L10_59 = L10_59(L11_60)
  L11_60, L12_61, L13_62, L14_63 = nil, nil, nil, nil
  L16_65 = L10_59
  L15_64 = L10_59.getConfirmRaiseCommandVariation
  L16_65 = L15_64(L16_65)
  L13_62 = L17_66
  L12_61 = L16_65
  L11_60 = L15_64
  if L11_60 ~= nil and L11_60 ~= 40004 then
    L1_50[5] = L12_61
  end
  L16_65 = L10_59
  L15_64 = L10_59.isDead
  L15_64 = L15_64(L16_65)
  if L15_64 == false then
    L15_64 = desktopWidget
    L16_65 = L15_64
    L15_64 = L15_64.isExistDropItemCommand
    L15_64 = L15_64(L16_65)
    if L15_64 == true then
      L7_56 = true
    end
    L16_65 = L10_59
    L15_64 = L10_59.getConfirmWarpCommandVariation
    L16_65 = L15_64(L16_65)
    L14_63 = L18_67
    L13_62 = L17_66
    L12_61 = L16_65
    L11_60 = L15_64
    if L11_60 ~= nil then
      L1_50[3] = L12_61
      L2_51[3] = L14_63
    end
    L16_65 = L10_59
    L15_64 = L10_59.getConfirmTradeCommandVariation
    L16_65 = L15_64(L16_65)
    L13_62 = L17_66
    L12_61 = L16_65
    L11_60 = L15_64
    if L11_60 ~= nil then
      L1_50[4] = L12_61
    end
    L16_65 = L10_59
    L15_64 = L10_59.getConfirmGroupCommandVariation
    L16_65 = L15_64(L16_65)
    L13_62 = L17_66
    L12_61 = L16_65
    L11_60 = L15_64
    if L11_60 ~= nil then
      L15_64 = L11_60
      if L15_64 == 10001 then
        L1_50[1] = L12_61
        break
      else
      end
      if L15_64 == 10002 then
        L1_50[2] = L12_61
        break
      else
      end
    else
    end
    L15_64 = desktopWidget
    L16_65 = L15_64
    L15_64 = L15_64.canTargetNegotiation
    L15_64 = L15_64(L16_65)
    if L15_64 == true then
      L3_52 = true
    end
    L15_64 = desktopWidget
    L16_65 = L15_64
    L15_64 = L15_64.getPlayerPlaceDrivenCommandVariation
    L16_65 = L15_64(L16_65)
    if L15_64 ~= nil then
      L8_57 = 852
      L9_58 = 74615
      if L19_68 == 10002 then
        L8_57 = 849
        L9_58 = 74623
        break
      else
      end
      if L19_68 == 10010 then
        L8_57 = 850
        L9_58 = 74624
        break
      else
      end
      if L19_68 == 10003 then
        L8_57 = 851
        L9_58 = 74625
        break
      elseif L19_68 == 20001 then
      elseif L19_68 == 20002 then
      elseif L19_68 == 30003 then
      elseif L19_68 == 20005 then
      elseif L19_68 == 20006 then
      else
      end
      if L19_68 == 20007 then
        L8_57 = 0
        do break end
        break
      else
      end
      if L8_57 ~= 0 then
        L19_68(A0_49, "Button_Push_7", L8_57)
        L19_68(A0_49, 1, "Button_Push_7", L15_64)
        L19_68(A0_49, "Button_Push_7", 1, L9_58, L15_64)
        L4_53 = true
      end
    end
    L12_61 = L19_68(L10_59)
    L11_60 = L19_68
    if L11_60 ~= nil then
      L19_68(A0_49, "Button_Push_8", 1, 74618, L11_60)
      L5_54 = true
    end
    if L10_59:isSitMode() == true then
      L8_57 = 848
      L9_58 = 74620
    else
      L11_60 = L10_59:getEmoteSitCommandVariation()
      if L11_60 ~= nil and L11_60 == 10002 then
        L8_57 = 847
        L9_58 = 74616
      end
    end
    if L19_68 ~= nil then
      A0_49:setIconLocal("Button_Push_9", L8_57)
      A0_49:setControlUserWorkInt(1, "Button_Push_9", L19_68)
      A0_49:setHelpParameter("Button_Push_9", 1, L9_58)
      L6_55 = true
    end
  end
  L16_65 = A0_49
  L15_64 = A0_49.setAnimIconVisibility
  L15_64(L16_65, L17_66, L18_67)
  L16_65 = A0_49
  L15_64 = A0_49.setAnimIconVisibility
  L15_64(L16_65, L17_66, L18_67)
  L16_65 = A0_49
  L15_64 = A0_49.setAnimIconVisibility
  L15_64(L16_65, L17_66, L18_67)
  L16_65 = A0_49
  L15_64 = A0_49.setAnimIconVisibility
  L15_64(L16_65, L17_66, L18_67)
  L16_65 = A0_49
  L15_64 = A0_49.setAnimIconVisibility
  L15_64(L16_65, L17_66, L18_67)
  L15_64 = {
    L16_65,
    L17_66,
    L18_67,
    L19_68,
    "Button_Push_5"
  }
  L16_65 = "Button_Push_1"
  L16_65 = 0
  for _FORV_20_ = 1, 5 do
    if L1_50[_FORV_20_] ~= nil then
      if A0_49.work.helpFlag[_FORV_20_] == false then
        L16_65 = _FORV_20_
      end
      A0_49.work.helpFlag[_FORV_20_] = true
    else
      A0_49.work.helpFlag[_FORV_20_] = false
    end
    A0_49:setVisibility(L15_64[_FORV_20_] .. ":Border_Arrow", false)
    A0_49:setAnimIconVisibility(L15_64[_FORV_20_], A0_49.work.helpFlag[_FORV_20_])
  end
  if L16_65 ~= 0 then
    if L18_67 == 1 then
      break
    else
    end
    if L18_67 == 2 then
      break
    else
    end
    if L18_67 == 3 then
      break
    else
    end
    if L18_67 == 4 then
      break
    else
    end
    if L18_67 == 5 then
      do break end
      break
    else
    end
    L19_68(A0_49, 1, "Label_BalloonHelp", L18_67)
    L19_68(A0_49, "TextBlock_BalloonHelp", L17_66, L1_50[L16_65], L2_51[L16_65])
    L19_68(A0_49, L18_67, true)
    L19_68(A0_49, "Label_BalloonHelp", "UILuaCommands.BalloonWindowON")
    L19_68(A0_49, L18_67, "UILuaCommands.BalloonArrowON")
    L19_68(A0_49, "UIFormCommands.TimerStart")
    L19_68.helpID = L16_65
  elseif L17_66 ~= 0 then
    if L17_66 == false then
      L17_66(L18_67, L19_68, false)
      L17_66.helpID = 0
    else
      L17_66(L18_67, L19_68, true)
    end
  end
  if L17_66 ~= nil then
    if L19_68 == 1 then
      break
    else
    end
    if L19_68 == 2 then
      break
    else
    end
    if L19_68 == 3 then
      break
    else
    end
    if L19_68 == 4 then
      break
    else
    end
    if L19_68 == 5 then
      do break end
      break
    else
    end
    if L18_67 == false then
      L19_68(L19_68, L17_66)
    end
  end
end
function ConsoleIconTrayWidget.updateConditionButton(A0_69)
  local L1_70, L2_71, L3_72, L4_73, L5_74, L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81, L13_82, L14_83, L15_84, L16_85
  L1_70 = worldMaster
  L2_71 = L1_70
  L1_70 = L1_70._getMyPlayer
  L1_70 = L1_70(L2_71)
  L2_71 = false
  L3_72 = false
  L4_73 = false
  L5_74 = false
  L6_75 = false
  L7_76 = false
  L8_77 = false
  L9_78 = false
  L10_79, L11_80, L12_81, L13_82, L14_83 = nil, nil, nil, nil, nil
  L15_84 = true
  L16_85 = L1_70.getConfirmTradeCommandVariation
  L11_80, L12_81, L16_85 = L1_70, nil, L16_85(L1_70)
  L10_79 = L16_85
  if L10_79 == nil then
    L16_85 = desktopWidget
    L16_85 = L16_85.isTargetDuringTradeOffer
    L16_85 = L16_85(L16_85)
    if L16_85 == true then
      L16_85 = A0_69.setIconLocal
      L16_85(A0_69, "Button_Conditions_3", 857)
      L16_85 = A0_69.setHelpParameter
      L16_85(A0_69, "Button_Conditions_3", 1, 74621)
      L13_82 = 24230
    end
  else
    L16_85 = desktopWidget
    L16_85 = L16_85.isTargetTradeOffer
    L16_85 = L16_85(L16_85)
    L15_84 = L16_85
    L16_85 = A0_69.setIconLocal
    L16_85(A0_69, "Button_Conditions_3", 856)
    L16_85 = A0_69.setHelpParameter
    L16_85(A0_69, "Button_Conditions_3", 1, 74606)
    L13_82 = 24217
  end
  L16_85 = A0_69.setControlUserWorkInt
  L16_85(A0_69, 1, "Button_Conditions_3", L13_82)
  L16_85 = true
  L10_79, L11_80, L12_81 = L1_70:getConfirmGroupCommandVariation()
  if L10_79 == nil and desktopWidget:isTargetDuringLinkshellInviteOffer() == true then
    A0_69:setIconLocal("Button_Conditions_5", 861)
    A0_69:setHelpParameter("Button_Conditions_5", 1, 74622)
    L13_82 = 24233
  else
    L16_85 = desktopWidget:isInviteCurrnetLinkshellByTarget()
    A0_69:setIconLocal("Button_Conditions_5", 860)
    A0_69:setHelpParameter("Button_Conditions_5", 1, 74610)
    L13_82 = 24232
  end
  A0_69:setControlUserWorkInt(1, "Button_Conditions_5", L13_82)
  if L1_70:isRemainBonusPoint() == true then
    L14_83 = 74629
  else
    L14_83 = 74631
  end
  A0_69:setHelpParameter("Button_Conditions_6", 1, L14_83)
  if L1_70:isDead() == false then
    L2_71 = desktopWidget:isTargetOtherPlayer()
    L3_72 = desktopWidget:isTargetBazaar()
    L4_73 = L15_84
    L5_74 = desktopWidget:canTargetJoinMyPlayerParty()
    L7_76, L6_75 = L1_70:isRemainBonusPoint(), L16_85
    if desktopWidget:getTargetRepairType() ~= 0 then
      L8_77 = true
    end
    if desktopWidget:isTargetMateriaAttachDealer() then
      L9_78 = true
    end
  end
  A0_69:setButtonMask("Button_Conditions_1", L2_71)
  A0_69:setButtonMask("Button_Conditions_2", L3_72)
  A0_69:setButtonMask("Button_Conditions_3", L4_73)
  A0_69:setButtonMask("Button_Conditions_4", L5_74)
  A0_69:setButtonMask("Button_Conditions_5", L6_75)
  A0_69:setButtonMask("Button_Conditions_6", L7_76)
  A0_69:setButtonMask("Button_Conditions_8", L8_77)
  A0_69:setButtonMask("Button_Conditions_9", L9_78)
  A0_69:updateQuestLinkPerlIcon()
end
function ConsoleIconTrayWidget.updateUILock(A0_86)
  local L1_87, L2_88, L3_89
  L2_88 = A0_86
  L1_87 = A0_86.setChecked
  L3_89 = "ToggleButton_WidgetLock"
  L1_87(L2_88, L3_89, desktopWidget:getConfigFlag(37))
end
function ConsoleIconTrayWidget.updatePopupHelp(A0_90)
  local L1_91, L2_92, L3_93
  L2_92 = A0_90
  L1_91 = A0_90.setChecked
  L3_93 = "ToggleButton_PopupHelp"
  L1_91(L2_92, L3_93, desktopWidget:getConfigFlag(33))
end
function ConsoleIconTrayWidget.updateActionHelp(A0_94)
  local L1_95, L2_96, L3_97
  L2_96 = A0_94
  L1_95 = A0_94.setChecked
  L3_97 = "ToggleButton_PopupHelp_ActionBar"
  L1_95(L2_96, L3_97, desktopWidget:getConfigFlag(71))
end
function ConsoleIconTrayWidget.updateChocoboStatus(A0_98)
  local L1_99, L2_100
  L1_99 = false
  L2_100 = 75705
  if desktopWidget:isRideChocobo() == true then
    L1_99 = true
    L2_100 = 75706
  elseif desktopWidget:canRideChocobo() == true then
    L1_99 = true
  end
  A0_98:setHelpParameter("Button_ChocoboRiding", 1, L2_100)
  A0_98:setVisibility("Button_ChocoboRiding", L1_99)
end
function ConsoleIconTrayWidget.updateGoobbueStatus(A0_101)
  local L1_102, L2_103
  L1_102 = false
  L2_103 = 74634
  if desktopWidget:isRideGoobbue() == true then
    L1_102 = true
    L2_103 = 74635
  elseif desktopWidget:canRideGoobbue() == true then
    L1_102 = true
  end
  A0_101:setHelpParameter("Button_GoobbueRiding", 1, L2_103)
  A0_101:setVisibility("Button_GoobbueRiding", L1_102)
end
function ConsoleIconTrayWidget.updateQuestLinkPerlIcon(A0_104)
  local L1_105
  if desktopWidget:getLinkpearlStatus() == -1 then
    A0_104:setIconLocal("Button_QuestLinkPearl", 293)
    A0_104:sendControlCommand("Button_QuestLinkPearl", "UILuaCommands.IconAnimeStop")
    A0_104:setVisibility("Button_QuestLinkPearl", false)
    L1_105 = false
    break
  else
  end
  if desktopWidget:getLinkpearlStatus() == 0 then
    A0_104:setIconLocal("Button_QuestLinkPearl", 293)
    A0_104:sendControlCommand("Button_QuestLinkPearl", "UILuaCommands.IconAnimeStop")
    A0_104:setVisibility("Button_QuestLinkPearl", true)
    L1_105 = false
    break
  else
  end
  if desktopWidget:getLinkpearlStatus() == 1 then
    A0_104:setIconLocal("Button_QuestLinkPearl", 292)
    A0_104:sendControlCommand("Button_QuestLinkPearl", "UILuaCommands.IconAnimeStop")
    A0_104:setVisibility("Button_QuestLinkPearl", true)
    L1_105 = true
    break
  else
  end
  if desktopWidget:getLinkpearlStatus() == 2 then
    A0_104:setIconLocal("Button_QuestLinkPearl", 291)
    A0_104:sendControlCommand("Button_QuestLinkPearl", "UILuaCommands.IconAnimeStart")
    A0_104:setVisibility("Button_QuestLinkPearl", true)
    L1_105 = true
    do break end
    break
  else
  end
  if L1_105 ~= nil then
    A0_104:setButtonMask("Button_QuestLinkPearl", L1_105)
  end
end
function ConsoleIconTrayWidget.setButtonMask(A0_106, A1_107, A2_108)
  local L3_109, L4_110
  L4_110 = A0_106
  L3_109 = A0_106.setEnable
  L3_109(L4_110, A1_107, A2_108)
  L3_109 = 1
  L4_110 = 1
  if A2_108 == false then
    L3_109 = 0.7
    L4_110 = 0.4
  end
  A0_106:setVisualOpacity(A1_107, L3_109)
  A0_106:setColor(A1_107, L4_110, L4_110, L4_110)
end
function ConsoleIconTrayWidget.setIconLocal(A0_111, A1_112, A2_113)
  A0_111:setControlProperty(A1_112, "SqwtDesignData.StringValue0", A2_113)
end
function ConsoleIconTrayWidget.setAnimIconVisibility(A0_114, A1_115, A2_116)
  if A2_116 == true then
    if A0_114:getVisibility(A1_115) == false then
      A0_114:sendControlCommand(A1_115, "UILuaCommands.PushIconAnimeStart")
    end
  else
    A0_114:sendControlCommand(A1_115, "UILuaCommands.PushIconAnimeStop")
  end
  A0_114:setVisibility(A1_115, A2_116)
end
function ConsoleIconTrayWidget.getContentSubTargetType(A0_117)
  if worldMaster:_getMyPlayer():getSystemCommand(24302) == nil then
    return nil
  end
  if worldMaster:_getMyPlayer():getSystemCommand(24302):_isAlive() == false then
    return nil
  end
  if worldMaster:_getMyPlayer():getSystemCommand(24302):isNoneTarget() == false then
    if worldMaster:_getMyPlayer():getSystemCommand(24302):isPcTarget() == true then
    elseif worldMaster:_getMyPlayer():getSystemCommand(24302):isNpcTarget() == true then
    elseif worldMaster:_getMyPlayer():getSystemCommand(24302):isPartyTarget() == true then
    else
    end
  end
  return 101
end
function ConsoleIconTrayWidget.openConfirmPartyWidget(A0_118)
  local L1_119, L2_120, L3_121
  L1_119 = worldMaster
  L2_120 = L1_119
  L1_119 = L1_119._getMyPlayer
  L1_119 = L1_119(L2_120)
  L3_121 = L1_119
  L2_120 = L1_119.getConfirmGroupCommandVariation
  L3_121 = L2_120(L3_121)
  if L2_120 == nil or L2_120 ~= 10001 then
    return
  end
  A0_118:openAskWidget(1, A0_118:packTextParameter(1121, L3_121), 1, 1122, 1123, 1136)
end
function ConsoleIconTrayWidget.openConfirmLinkshellWidget(A0_122)
  local L1_123, L2_124, L3_125
  L1_123 = worldMaster
  L2_124 = L1_123
  L1_123 = L1_123._getMyPlayer
  L1_123 = L1_123(L2_124)
  L3_125 = L1_123
  L2_124 = L1_123.getConfirmGroupCommandVariation
  L3_125 = L2_124(L3_125)
  if L2_124 == nil or L2_124 ~= 10002 then
    return
  end
  A0_122:openAskWidget(2, A0_122:packTextParameter(1137, L3_125), 1, 1138, 1139, 1136)
end
function ConsoleIconTrayWidget.openConfirmTelepoWidget(A0_126)
  local L1_127, L2_128, L3_129, L4_130, L5_131
  L1_127 = worldMaster
  L2_128 = L1_127
  L1_127 = L1_127._getMyPlayer
  L1_127 = L1_127(L2_128)
  L3_129 = L1_127
  L2_128 = L1_127.getConfirmWarpCommandVariation
  L5_131 = L2_128(L3_129)
  A0_126:openAskWidget(3, A0_126:packTextParameter(1130, L3_129, L5_131), 1, 1131, 1132, 1136)
end
function ConsoleIconTrayWidget.openConfirmTradeWidget(A0_132)
  local L1_133, L2_134, L3_135
  L1_133 = worldMaster
  L2_134 = L1_133
  L1_133 = L1_133._getMyPlayer
  L1_133 = L1_133(L2_134)
  L3_135 = L1_133
  L2_134 = L1_133.getConfirmTradeCommandVariation
  L3_135 = L2_134(L3_135)
  A0_132:openAskWidget(4, A0_132:packTextParameter(1124, L3_135), 1, 1125, 1126, 1136)
end
function ConsoleIconTrayWidget.openConfirmRaiseWidget(A0_136)
  local L1_137, L2_138, L3_139
  L1_137 = worldMaster
  L2_138 = L1_137
  L1_137 = L1_137._getMyPlayer
  L1_137 = L1_137(L2_138)
  L3_139 = L1_137
  L2_138 = L1_137.getConfirmRaiseCommandVariation
  L3_139 = L2_138(L3_139)
  A0_136:openAskWidget(5, A0_136:packTextParameter(1127, L3_139), 1, 1128, 1129, 1136)
end
function ConsoleIconTrayWidget.openAskWidget(A0_140, A1_141, ...)
  if A0_140:getChildWidgetByWindowName("CommonAskWidget") ~= nil then
    return
  end
  desktopWidget:openChildWidget("CommonAskWidget", A0_140, true, nil, ...)
  A0_140.work.askType = A1_141
end
function ConsoleIconTrayWidget.processAskResult(A0_143, A1_144)
  local L2_145
  L2_145 = A0_143.work
  L2_145 = L2_145.askType
  if L2_145 == 1 then
  else
  end
  if L2_145 == 2 then
    desktopWidget:executePlayerSystemCommand(24303, nil, A1_144)
    break
  else
  end
  if L2_145 == 3 then
    desktopWidget:executePlayerSystemCommand(24304, nil, A1_144)
    break
  else
  end
  if L2_145 == 4 then
    desktopWidget:executePlayerSystemCommand(24305, nil, A1_144)
    break
  else
  end
  if L2_145 == 5 then
    desktopWidget:executePlayerSystemCommand(24306, nil, A1_144)
    do break end
    break
  else
  end
end
function ConsoleIconTrayWidget.processSubTargetDecided(A0_146, A1_147)
  if A1_147 ~= nil then
    desktopWidget:executePlayerSystemCommand(24302, nil, nil, A1_147)
  end
end
