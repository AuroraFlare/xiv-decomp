require("/Widget/Ask/AskBaseClass")
_defineClass("RetainerDismissalWidget", "AskBaseClass")
function RetainerDismissalWidget.initAsk(A0_0)
  A0_0:setCommandParameter("Button_Yes", 1)
  A0_0:setConfirmCondition("Button_Yes")
  A0_0:setCommandParameter("Button_No", 2)
  A0_0:setConfirmCondition("Button_No")
  A0_0:setCancelCondition()
end
function RetainerDismissalWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  A0_1:setBaseAskResult(A3_4)
end
function RetainerDismissalWidget.processUICommandCancel(A0_6, A1_7, A2_8, A3_9, A4_10)
  A0_6:setKeyboardFocusedControl("Button_No")
end
