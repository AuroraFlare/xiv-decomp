require("/Widget/WidgetBaseClass")
_defineClass("ConfigKeyboardAskWidget", "WidgetBaseClass")
function ConfigKeyboardAskWidget.init(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.setCancelCondition
  L2_2(A0_0)
  L2_2 = A0_0.setLogicalFocus
  L2_2(A0_0, "Button_2")
  L2_2 = A0_0.setCommandParameter
  L2_2(A0_0, "Button_1", A1_1)
  L2_2 = 1493
  if A1_1 == 1 then
    L2_2 = 1494
  end
  A0_0:setText("TextBlock_Text", L2_2)
end
