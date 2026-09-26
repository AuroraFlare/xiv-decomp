require("/Widget/WidgetBaseClass")
_defineClass("PlayerProfileWidget", "WidgetBaseClass")
function PlayerProfileWidget.init(A0_0)
  A0_0.work._temp = {}
  A0_0:setUICommandCondition("RaptureCommands.ChainTimerStart")
  A0_0:initParameter()
  A0_0:initChildWidget("ChainBonusEffectWidget", true)
end
function PlayerProfileWidget.processBeforeShow(A0_1, A1_2)
  A0_1:updateExp()
  return true
end
function PlayerProfileWidget.processUICommandDefault(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8)
  if A3_6 == "RaptureCommands.ChainTimerStart" then
    A0_3:startChainTimer(A4_7, A5_8)
  end
end
function PlayerProfileWidget.processTimer(A0_9)
  A0_9:endChainTimer()
end
function PlayerProfileWidget.update(A0_10)
  if A0_10:isShow() then
    A0_10:updateExp()
  end
end
function PlayerProfileWidget.updateExp(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23
  L1_12 = worldMaster
  L2_13 = L1_12
  L1_12 = L1_12._getMyPlayer
  L1_12 = L1_12(L2_13)
  L3_14 = L1_12
  L2_13 = L1_12.getStateMainSkill
  L2_13 = L2_13(L3_14)
  L4_15 = L1_12
  L3_14 = L1_12.getMainClassOrJob
  L3_14 = L3_14(L4_15)
  L5_16 = L1_12
  L4_15 = L1_12.getStateMainSkillLevel
  L4_15 = L4_15(L5_16)
  L5_16 = 50
  L7_18 = L1_12
  L6_17 = L1_12.getSkillPoint
  L8_19 = L2_13
  L6_17 = L6_17(L7_18, L8_19)
  L8_19 = L1_12
  L7_18 = L1_12.getSkillPointMax
  L9_20 = L4_15
  L7_18 = L7_18(L8_19, L9_20)
  L9_20 = L1_12
  L8_19 = L1_12.getSkillPointMax
  L10_21 = L4_15 + 1
  L8_19 = L8_19(L9_20, L10_21)
  L10_21 = L1_12
  L9_20 = L1_12.getRestBonusExpRate
  L9_20 = L9_20(L10_21)
  L10_21 = 50
  L11_22 = L7_18 * L9_20
  L12_23 = L10_21 - 2
  if L4_15 == L12_23 then
    L12_23 = L6_17 + L11_22
    if L12_23 > L7_18 + L8_19 then
      L12_23 = L7_18 + L8_19
      L11_22 = L12_23 - L6_17
    end
  else
    L12_23 = L10_21 - 1
    if L4_15 == L12_23 then
      L12_23 = L6_17 + L11_22
      if L7_18 < L12_23 then
        L11_22 = L7_18 - L6_17
      end
    elseif L4_15 == L10_21 then
      L11_22 = 0
    end
  end
  L12_23 = desktopWidget
  L12_23 = L12_23.getSkillIcon
  L12_23 = L12_23(L12_23, L3_14)
  A0_11:setSkill(L2_13, L3_14, L12_23, L4_15, L5_16, L6_17, L11_22, L7_18, L8_19)
end
function PlayerProfileWidget.initParameter(A0_24)
  A0_24:setSkill(0, 0, 0, 0, 0, 0, 0, 0, 0)
end
function PlayerProfileWidget.setSkill(A0_25, A1_26, A2_27, A3_28, A4_29, A5_30, A6_31, A7_32, A8_33, A9_34)
  if A1_26 > 0 then
    if A1_26 == A2_27 then
      A2_27 = 0
    end
    A0_25:setVisibility("IconControl_SkillCategory", true)
    A0_25:setVisibility("TextBlock_SkillRankTitle", true)
    A0_25:setIcon("IconControl_SkillCategory", A3_28)
    A0_25:setText("TextBlock_SkillRankTitle", 231, A1_26, A4_29, A2_27)
    if A6_31 == nil or A8_33 == nil then
      return
    end
    A0_25:_setProperty(nil, "ProgressBar_SkillRankEXP", "Value", A6_31)
    A0_25:_setProperty(nil, "ProgressBar_SkillRankEXP", "Maximum", A8_33)
    A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_1", "Maximum", A8_33)
    A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_2", "Maximum", A8_33)
    if A7_32 == 0 then
      A0_25:setStyle("ProgressBar_SkillRankEXP", "PRB_parameter_tpH")
      A0_25:setVisibility("IconControl_LogoutBonus", false)
      A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_1", "Value", 0)
      A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_2", "Value", 0)
    else
      A0_25:setStyle("ProgressBar_SkillRankEXP", "PRB_logoutBonus_blinkH")
      A0_25:setVisibility("IconControl_LogoutBonus", true)
      if A8_33 >= A6_31 + A7_32 then
        A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_1", "Value", A6_31 + A7_32)
        A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_2", "Value", 0)
      else
        A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_1", "Value", 0)
        A0_25:_setProperty(nil, "ProgressBar_LogoutBonus_2", "Value", A8_33)
      end
    end
  else
    A0_25:setVisibility("IconControl_SkillCategory", false)
    A0_25:setVisibility("TextBlock_SkillRankTitle", false)
  end
end
function PlayerProfileWidget.startChainTimer(A0_35, A1_36, A2_37)
  A0_35:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value0", 1)
  A0_35:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value0", A2_37)
  A0_35:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value1", 0)
  A0_35:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value2", 4)
  A0_35:setCommonTimer(A2_37 + 3)
  A0_35:sendControlCommand("Label_ChainBonus", "UILuaCommands.ChainDisplayOn")
end
function PlayerProfileWidget.endChainTimer(A0_38)
  A0_38:sendControlCommand("Label_ChainBonus", "UILuaCommands.ChainDisplayOff")
end
