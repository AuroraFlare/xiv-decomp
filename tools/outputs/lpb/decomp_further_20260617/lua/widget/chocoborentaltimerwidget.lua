require("/Widget/WidgetBaseClass")
_defineClass("ChocoboRentalTimerWidget", "WidgetBaseClass")
function ChocoboRentalTimerWidget.init(A0_0)
  local L1_1
end
function ChocoboRentalTimerWidget.setTimer(A0_2, A1_3)
  local L2_4
  L2_4 = worldMaster
  L2_4 = L2_4._getServerTime
  L2_4 = L2_4(L2_4)
  L2_4 = A1_3 - L2_4
  A0_2:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value0", 1)
  A0_2:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value0", L2_4)
  A0_2:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value1", 0)
  A0_2:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value2", 60)
end
