require("/Widget/Ask/AskBaseClass")
_defineClass("NegotiationAskWidget", "AskBaseClass")
function NegotiationAskWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L5_5 = A0_0.work
  L6_6 = {}
  L5_5._temp = L6_6
  L6_6 = A0_0
  L5_5 = A0_0.setText
  L5_5(L6_6, L7_7, L8_8, L9_9)
  L5_5 = desktopWidget
  L6_6 = L5_5
  L5_5 = L5_5.getTargetName
  L5_5 = L5_5(L6_6)
  L6_6 = A0_0.setText
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = A0_0.setText
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = A0_0.setText
  L6_6(L7_7, L8_8, L9_9)
  if A3_3 == 0 then
    L6_6 = A0_0.setText
    L6_6(L7_7, L8_8, L9_9)
  else
    L6_6 = A0_0.setText
    L10_10 = A3_3
    L6_6(L7_7, L8_8, L9_9, L10_10, 1)
  end
  L6_6 = A0_0.setText
  L6_6(L7_7, L8_8, L9_9)
  if A4_4 == 0 then
    L6_6 = A0_0.setText
    L6_6(L7_7, L8_8, L9_9)
  else
    L6_6 = A0_0.setText
    L10_10 = A4_4
    L6_6(L7_7, L8_8, L9_9, L10_10, 1)
  end
  L6_6 = A0_0.setText
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = A0_0.setContent
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = A0_0.setContent
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = 0
  for L10_10 = A2_2 + 1, 10 do
    A0_0:setVisibility("IconControl_Difficulty_" .. L10_10, false)
  end
  L10_10 = 7102
  L7_7(L8_8, L9_9, L10_10, A1_1)
  L7_7(L8_8, L9_9)
  L7_7(L8_8, L9_9)
  L7_7(L8_8)
end
function NegotiationAskWidget.processUICommandOperate(A0_11, A1_12, A2_13, A3_14, A4_15)
  if A2_13 == "Button_Negotiate" then
    A0_11:setBaseAskResult(1)
  elseif A2_13 == "Button_GiveUp" then
    A0_11:setBaseAskResult(-1)
  end
end
function NegotiationAskWidget.processUICommandCancel(A0_16, A1_17, A2_18, A3_19, A4_20)
  A0_16:setBaseAskResult(-1)
end
