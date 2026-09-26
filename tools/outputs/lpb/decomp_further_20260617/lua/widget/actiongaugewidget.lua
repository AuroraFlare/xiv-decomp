require("/Widget/WidgetBaseClass")
_defineClass("ActionGaugeWidget", "WidgetBaseClass")
function ActionGaugeWidget.init(A0_0)
  A0_0.work._temp = {}
  A0_0:hideWidget()
end
function ActionGaugeWidget.changeWaitingAction(A0_1, A1_2, A2_3)
end
function ActionGaugeWidget.startCastGauge(A0_4, A1_5)
  local L2_6, L3_7
  L2_6 = desktopWidget
  L3_7 = L2_6
  L2_6 = L2_6.getCommandID
  L2_6 = L2_6(L3_7, A1_5)
  L3_7 = desktopWidget
  L3_7 = L3_7.getPlayerActionCommandData
  L3_7 = L3_7(L3_7, A1_5, 36)
  if L2_6 == -1 or L3_7 == nil then
    L2_6 = 0
    L3_7 = 0
  end
  A0_4:setIcon("IconControl_MainCommand", L3_7)
  A0_4:setText("TextBlock_MainCommand", 1104, L2_6)
  A0_4:showWidget()
  A0_4:startCastGaugeAnimation()
end
function ActionGaugeWidget.stopCastGauge(A0_8)
  A0_8:stopCastGaugeAnimation()
  A0_8:hideWidget()
end
function ActionGaugeWidget.deleteCastGauge(A0_9)
  A0_9:hideWidget()
end
function ActionGaugeWidget.startCastGaugeAnimation(A0_10)
  local L1_11, L2_12, L3_13, L4_14
  L1_11 = 1
  L2_12 = worldMaster
  L3_13 = L2_12
  L2_12 = L2_12._getMyPlayer
  L2_12 = L2_12(L3_13)
  L4_14 = L2_12
  L3_13 = L2_12.getCastEndTime
  L3_13 = L3_13(L4_14)
  L4_14 = worldMaster
  L4_14 = L4_14._getServerTime
  L4_14 = L4_14(L4_14)
  L3_13 = L3_13 - L4_14
  if L3_13 <= 0 then
    L3_13 = 1
  end
  L4_14 = L1_11 / L3_13
  A0_10:_setProperty(nil, "ProgressBar_MagicCast_Main", "Maximum", L1_11)
  A0_10:_setProperty(nil, "ProgressBar_MagicCast_Main", "Value", 0)
  A0_10:_setProperty(nil, "ProgressBar_MagicCast_Main", "FloatData.Value0", L4_14)
  A0_10:setVisibility("ProgressBar_MagicCast_Main", true)
  A0_10:_sendStoryboardCommand(nil, "ProgressBar_MagicCast_Main", "UILuaCommands.StartCastGauge")
end
function ActionGaugeWidget.stopCastGaugeAnimation(A0_15)
  A0_15:_sendStoryboardCommand(nil, "ProgressBar_MagicCast_Main", "UILuaCommands.PauseCastGauge")
  A0_15:setVisibility("ProgressBar_MagicCast_Main", false)
end
function ActionGaugeWidget.showWidget(A0_16)
  A0_16:setVisibility("IconControl_MainCommand", true)
  A0_16:setVisibility("TextBlock_MainCommand", true)
  A0_16:show()
end
function ActionGaugeWidget.hideWidget(A0_17)
  A0_17:hide()
  A0_17:setVisibility("IconControl_MainCommand", false)
  A0_17:setVisibility("TextBlock_MainCommand", false)
end
