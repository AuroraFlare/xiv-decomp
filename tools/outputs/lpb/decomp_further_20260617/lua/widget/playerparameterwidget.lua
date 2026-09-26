require("/Widget/WidgetBaseClass")
_defineClass("PlayerParameterWidget", "WidgetBaseClass")
function PlayerParameterWidget.init(A0_0)
  A0_0:setConfirmCondition("Button_PlayerParameter")
  A0_0:clearAll()
  A0_0:setParameter(1)
  A0_0:setParameter(2)
  A0_0:setParameter(3)
end
function PlayerParameterWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  if A2_3 == "Button_PlayerParameter" then
    desktopWidget:setTargetCharacterForMyPlayer()
  end
end
function PlayerParameterWidget.updateAll(A0_6)
  A0_6:setParameter(1)
  A0_6:setParameter(2)
  A0_6:setParameter(3)
end
function PlayerParameterWidget.updateHp(A0_7)
  A0_7:setParameter(1)
end
function PlayerParameterWidget.updateMp(A0_8)
  A0_8:setParameter(2)
end
function PlayerParameterWidget.updateTp(A0_9)
  A0_9:setParameter(3)
end
function PlayerParameterWidget.setPartyLeader(A0_10, A1_11)
  A0_10:setLeader(A1_11)
end
function PlayerParameterWidget.setTargetMyPlayer(A0_12, A1_13)
  A0_12:setVisibility("Label_TargetingMember", A1_13)
  if A1_13 == true then
    A0_12:sendControlCommand("Label_TargetingMember", "SQWTDesignCommands.TargetEffectOn")
  else
    A0_12:sendControlCommand("Label_TargetingMember", "SQWTDesignCommands.TargetEffectOff")
  end
end
function PlayerParameterWidget.updateCost(A0_14, A1_15)
  local L2_16, L3_17, L4_18
  if A1_15 == nil then
    L3_17 = A0_14
    L2_16 = A0_14.setCost
    L4_18 = 1
    L2_16(L3_17, L4_18, 0)
    L3_17 = A0_14
    L2_16 = A0_14.setCost
    L4_18 = 2
    L2_16(L3_17, L4_18, 0)
    L3_17 = A0_14
    L2_16 = A0_14.setCost
    L4_18 = 3
    L2_16(L3_17, L4_18, 0)
    return
  end
  L2_16 = desktopWidget
  L3_17 = L2_16
  L2_16 = L2_16.getPlayerEquippedCustomCommandCost
  L4_18 = A1_15
  L4_18 = L2_16(L3_17, L4_18)
  if L2_16 == nil then
    A0_14:setCost(1, 0)
  else
    A0_14:setCost(1, L2_16)
  end
  if L3_17 == nil then
    A0_14:setCost(2, 0)
  else
    A0_14:setCost(2, L3_17)
  end
  if L4_18 == nil then
    A0_14:setCost(3, 0)
  else
    A0_14:setCost(3, L4_18)
  end
end
function PlayerParameterWidget.setParameter(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24, L6_25, L7_26
  L2_21 = desktopWidget
  L3_22 = L2_21
  L2_21 = L2_21.getPlayerGaugeMaxParameter
  L4_23 = L2_21(L3_22)
  L5_24 = desktopWidget
  L6_25 = L5_24
  L5_24 = L5_24.getPlayerGaugeCurrentParameter
  L7_26 = L5_24(L6_25)
  if A1_20 == 1 then
    A0_19:setHPMPTPMaximum(1, L2_21)
    A0_19:setHPMPTPValue(1, L5_24)
    break
  else
  end
  if A1_20 == 2 then
    A0_19:setHPMPTPMaximum(2, L3_22)
    A0_19:setHPMPTPValue(2, L6_25)
    break
  else
  end
  if A1_20 == 3 then
    A0_19:setHPMPTPMaximum(3, L4_23)
    A0_19:setHPMPTPValue(3, L7_26)
    do break end
    break
  else
  end
  A0_19:changeHpVisual()
end
function PlayerParameterWidget.setLeader(A0_27, A1_28)
  local L2_29
  L2_29 = A0_27.getLeaderIconControlName
  L2_29 = L2_29(A0_27)
  if A1_28 then
    A0_27:_setProperty(nil, L2_29, "Visibility", "Visible")
  else
    A0_27:_setProperty(nil, L2_29, "Visibility", "Hidden")
  end
end
function PlayerParameterWidget.setHPMPTPMaximum(A0_30, A1_31, A2_32)
  local L3_33, L4_34
  L4_34 = A0_30
  L3_33 = A0_30.getProgressBarControlName
  L3_33 = L3_33(L4_34, A1_31)
  L4_34 = A0_30.getCostProgressBarControlName
  L4_34 = L4_34(A0_30, A1_31)
  A0_30:_setProperty(nil, L3_33, "Maximum", A2_32)
  A0_30:_setProperty(nil, L4_34, "Maximum", A2_32)
end
function PlayerParameterWidget.setHPMPTPValue(A0_35, A1_36, A2_37)
  local L3_38
  L3_38 = A0_35.getProgressBarControlName
  L3_38 = L3_38(A0_35, A1_36)
  A0_35:_setProperty(nil, L3_38, "Value", A2_37)
end
function PlayerParameterWidget.setCost(A0_39, A1_40, A2_41)
  local L3_42
  L3_42 = A0_39.getCostProgressBarControlName
  L3_42 = L3_42(A0_39, A1_40)
  A0_39:_setProperty(nil, L3_42, "Value", A2_41)
end
function PlayerParameterWidget.changeHpVisual(A0_43)
  local L1_44, L2_45
  L2_45 = A0_43
  L1_44 = A0_43.getProgressBarControlName
  L1_44 = L1_44(L2_45, 1)
  L2_45 = A0_43.getTextBlockControlName
  L2_45 = L2_45(A0_43, 1)
  if A0_43:_getProperty(nil, L1_44, "Value") / A0_43:_getProperty(nil, L1_44, "Maximum") == 0 then
    A0_43:_setProperty(nil, L2_45, "SqwtStyle", "TBL_parameterDanger")
    A0_43:_setProperty(nil, L1_44, "SqwtStyle", "PRB_parameter_hpLargeH")
  elseif A0_43:_getProperty(nil, L1_44, "Value") / A0_43:_getProperty(nil, L1_44, "Maximum") < 0.25 then
    A0_43:_setProperty(nil, L2_45, "SqwtStyle", "TBL_parameterDanger")
    A0_43:_setProperty(nil, L1_44, "SqwtStyle", "PRB_parameter_hpLarge_signalH")
  elseif A0_43:_getProperty(nil, L1_44, "Value") / A0_43:_getProperty(nil, L1_44, "Maximum") < 0.5 then
    A0_43:_setProperty(nil, L2_45, "SqwtStyle", "TBL_parameterCaution")
    A0_43:_setProperty(nil, L1_44, "SqwtStyle", "PRB_parameter_hpLargeH")
  else
    A0_43:_setProperty(nil, L2_45, "SqwtStyle", "TBL_parameterNormal")
    A0_43:_setProperty(nil, L1_44, "SqwtStyle", "PRB_parameter_hpLargeH")
  end
end
function PlayerParameterWidget.clearAll(A0_46)
  A0_46:setHPMPTPValue(1, 0)
  A0_46:setHPMPTPValue(2, 0)
  A0_46:setHPMPTPValue(3, 0)
  A0_46:setHPMPTPMaximum(1, 0)
  A0_46:setHPMPTPMaximum(2, 0)
  A0_46:setHPMPTPMaximum(3, 0)
  A0_46:setCost(1, 0)
  A0_46:setCost(2, 0)
  A0_46:setCost(3, 0)
  A0_46:setLeader(false)
end
function PlayerParameterWidget.getLeaderIconControlName(A0_47)
  local L1_48
  L1_48 = "IconControl_LeaderIcon"
  return L1_48
end
function PlayerParameterWidget.getTextBlockControlName(A0_49, A1_50)
  local L2_51, L3_52
  L2_51 = "TextBlock_"
  L3_52 = A1_50
  if L3_52 == 1 then
    L2_51 = L2_51 .. "CurrentHp"
    break
  else
  end
  if L3_52 == 2 then
    L2_51 = L2_51 .. "CurrentMp"
    break
  else
  end
  if L3_52 == 3 then
    L2_51 = L2_51 .. "CurrentTp"
    break
  else
  end
  do return end
  return L2_51
end
function PlayerParameterWidget.getProgressBarControlName(A0_53, A1_54)
  local L2_55, L3_56
  L2_55 = "ProgressBar_"
  L3_56 = A1_54
  if L3_56 == 1 then
    L2_55 = L2_55 .. "Hp"
    break
  else
  end
  if L3_56 == 2 then
    L2_55 = L2_55 .. "Mp"
    break
  else
  end
  if L3_56 == 3 then
    L2_55 = L2_55 .. "Tp"
    break
  else
  end
  do return end
  return L2_55
end
function PlayerParameterWidget.getCostProgressBarControlName(A0_57, A1_58)
  local L2_59, L3_60
  L2_59 = "ProgressBar_actionCost_"
  L3_60 = A1_58
  if L3_60 == 1 then
    L2_59 = L2_59 .. "Hp"
    break
  else
  end
  if L3_60 == 2 then
    L2_59 = L2_59 .. "Mp"
    break
  else
  end
  if L3_60 == 3 then
    L2_59 = L2_59 .. "Tp"
    break
  else
  end
  do return end
  return L2_59
end
