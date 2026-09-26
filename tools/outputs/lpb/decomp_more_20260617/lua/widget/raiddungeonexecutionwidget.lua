require("/Widget/WidgetBaseClass")
_defineClass("RaidDungeonExecutionWidget", "WidgetBaseClass")
function RaidDungeonExecutionWidget.init(A0_0, A1_1, A2_2)
  A0_0:setContents(A1_1)
  A0_0:setTimer(A2_2)
end
function RaidDungeonExecutionWidget.setContents(A0_3, A1_4)
  A0_3:setText("TextBlock_ContentsName", 10051, A1_4)
end
function RaidDungeonExecutionWidget.setTimer(A0_5, A1_6)
  local L2_7, L3_8, L4_9
  L2_7 = worldMaster
  L3_8 = L2_7
  L2_7 = L2_7._getServerTime
  L2_7 = L2_7(L3_8)
  L2_7 = A1_6 - L2_7
  L3_8 = 0
  L4_9 = 300
  A0_5:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value0", 1)
  A0_5:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value0", L2_7)
  A0_5:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value1", L3_8)
  A0_5:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value2", L4_9)
  A0_5:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value1", 300)
  A0_5:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value2", 120)
end
