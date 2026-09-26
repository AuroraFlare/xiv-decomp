require("/Widget/WidgetBaseClass")
_defineClass("LogColorListWidget", "WidgetBaseClass")
function LogColorListWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  for L4_4 = 1, 36 do
    L5_5 = "Button_Color_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:setConfirmCondition(L5_5)
    A0_0:setCommandParameter(L5_5, L4_4)
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
end
function LogColorListWidget.processUICommandOperate(A0_6, A1_7, A2_8, A3_9, A4_10)
  if A2_8 ~= "Button_Close" then
    A0_6:_getParentWidget():updateColor(A3_9)
  end
  A0_6:hide()
end
function LogColorListWidget.processUICommandClose(A0_11, A1_12, A2_13, A3_14, A4_15)
  A0_11:hide()
end
function LogColorListWidget.setListIndex(A0_16, A1_17, A2_18, A3_19)
  A0_16:setText("TextBlock_LogItemText", A1_17)
  A0_16:setHelpParameter("TextBlock_LogItemText", 1, A2_18)
  A0_16:setLogicalFocus("Button_Color_" .. tostring(A3_19))
end
