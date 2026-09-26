require("/Widget/Ask/AskBaseClass")
_defineClass("NegotiationAbilityListWidget", "AskBaseClass")
function NegotiationAbilityListWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5)
  local L6_6
  L6_6 = A0_0.work
  L6_6._temp = {}
  L6_6 = A0_0.setText
  L6_6(A0_0, "TextBlock_AbilityTitle", 7108)
  L6_6 = A0_0.abilityUseCheck
  L6_6 = L6_6(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5)
  A0_0:abilityHelpDisp(L6_6)
  A0_0:setText("Button_AbilityCommand_1:TextBlock_Ability", 7110)
  A0_0:setText("Button_AbilityCommand_2:TextBlock_Ability", 7111)
  A0_0:setText("Button_AbilityCommand_3:TextBlock_Ability", 7112)
  A0_0:setText("Button_AbilityCommand_4:TextBlock_Ability", 7113)
  A0_0:setContent("Button_CloseWindow", 7109)
  A0_0:setVisibility("Button_AbilityCommand_1", A1_1)
  A0_0:setVisibility("Button_AbilityCommand_2", A2_2)
  A0_0:setVisibility("Button_AbilityCommand_3", A3_3)
  A0_0:setVisibility("Button_AbilityCommand_4", A4_4)
  A0_0:setVisibility("Button_AbilityCommand_5", A5_5)
  A0_0:setModal(true)
  A0_0:setConfirmCondition("Button_AbilityCommand_1")
  A0_0:setConfirmCondition("Button_AbilityCommand_2")
  A0_0:setConfirmCondition("Button_AbilityCommand_3")
  A0_0:setConfirmCondition("Button_AbilityCommand_4")
  A0_0:setConfirmCondition("Button_AbilityCommand_5")
  A0_0:setConfirmCondition("Button_CloseWindow")
  A0_0:setControlCommandCondition("Button_AbilityCommand_1", "UILuaCommands.Hover")
  A0_0:setControlCommandCondition("Button_AbilityCommand_2", "UILuaCommands.Hover")
  A0_0:setControlCommandCondition("Button_AbilityCommand_3", "UILuaCommands.Hover")
  A0_0:setControlCommandCondition("Button_AbilityCommand_4", "UILuaCommands.Hover")
  A0_0:setControlCommandCondition("Button_AbilityCommand_5", "UILuaCommands.Hover")
  A0_0:setControlCommandCondition("Button_CloseWindow", "UILuaCommands.Hover")
  A0_0:setCancelCondition()
end
function NegotiationAbilityListWidget.processUICommandOperate(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12
  L5_12 = false
  if A2_9 == "Button_AbilityCommand_1" then
    A0_7:playerAbilitySelect(1)
    break
  else
  end
  if A2_9 == "Button_AbilityCommand_2" then
    A0_7:playerAbilitySelect(2)
    break
  else
  end
  if A2_9 == "Button_AbilityCommand_3" then
    A0_7:playerAbilitySelect(3)
    break
  else
  end
  if A2_9 == "Button_AbilityCommand_4" then
    A0_7:playerAbilitySelect(4)
    break
  else
  end
  if A2_9 == "Button_AbilityCommand_5" then
    A0_7:playerAbilitySelect(5)
    break
  else
    if A2_9 == "Button_CloseWindow" then
      do break end
      break
    else
    end
  end
  L5_12 = desktopWidget:closeEventModeWidget("Ask/NegotiationAbilityListWidget")
  if L5_12 == false then
  end
end
function NegotiationAbilityListWidget.processUICommandCancel(A0_13, A1_14, A2_15, A3_16, A4_17)
  local L5_18
  L5_18 = false
  L5_18 = desktopWidget:closeEventModeWidget("Ask/NegotiationAbilityListWidget")
  if L5_18 == false then
  end
end
function NegotiationAbilityListWidget.processUICommandDefault(A0_19, A1_20, A2_21, A3_22, A4_23, A5_24)
  local L6_25
  L6_25 = A2_21
  if L6_25 == "Button_AbilityCommand_1" then
    A0_19:abilityHelpDisp(1)
    break
  else
  end
  if L6_25 == "Button_AbilityCommand_2" then
    A0_19:abilityHelpDisp(2)
    break
  else
  end
  if L6_25 == "Button_AbilityCommand_3" then
    A0_19:abilityHelpDisp(3)
    break
  else
  end
  if L6_25 == "Button_AbilityCommand_4" then
    A0_19:abilityHelpDisp(4)
    break
  else
  end
  if L6_25 == "Button_AbilityCommand_5" then
    A0_19:abilityHelpDisp(5)
    break
  else
  end
  A0_19:setVisibility("TextBlock_AbilityHelp", false)
  break
end
function NegotiationAbilityListWidget.abilityUseCheck(A0_26, A1_27, A2_28, A3_29, A4_30, A5_31)
  local L6_32
  if A1_27 then
    L6_32 = 1
    return L6_32
  elseif A2_28 then
    L6_32 = 2
    return L6_32
  elseif A3_29 then
    L6_32 = 3
    return L6_32
  elseif A4_30 then
    L6_32 = 4
    return L6_32
  elseif A5_31 then
    L6_32 = 5
    return L6_32
  end
end
function NegotiationAbilityListWidget.abilityHelpDisp(A0_33, A1_34)
  local L2_35
  L2_35 = A1_34
  if L2_35 == 1 then
    A0_33:setText("TextBlock_AbilityHelp", 7114)
    A0_33:setVisibility("TextBlock_AbilityHelp", true)
    break
  else
  end
  if L2_35 == 2 then
    A0_33:setText("TextBlock_AbilityHelp", 7115)
    A0_33:setVisibility("TextBlock_AbilityHelp", true)
    break
  else
  end
  if L2_35 == 3 then
    A0_33:setText("TextBlock_AbilityHelp", 7116)
    A0_33:setVisibility("TextBlock_AbilityHelp", true)
    break
  else
  end
  if L2_35 == 4 then
    A0_33:setText("TextBlock_AbilityHelp", 7117)
    A0_33:setVisibility("TextBlock_AbilityHelp", true)
    break
  else
    if L2_35 == 5 then
      do break end
      break
    else
    end
  end
end
function NegotiationAbilityListWidget.playerAbilitySelect(A0_36, A1_37)
  A0_36:_getParentWidget():setBaseAskResult(A1_37 + 14)
  A0_36:_getParentWidget():_sendStoryboardCommand(nil, "ProgressBar_TimeGauge", "UILuaCommands.PauseLimitTimer")
  A0_36:setVisibility("Button_AbilityCommand_" .. A1_37, false)
  A0_36:_sendStoryboardCommand(nil, "Button_AbilityCommand_" .. A1_37, "UILuaCommands.SoundPlayAbility")
end
