require("/Widget/Ask/AskBaseClass")
_defineClass("WaitingCountdownWidget", "AskBaseClass")
function WaitingCountdownWidget.initAsk(A0_0, A1_1, A2_2, A3_3, ...)
  A0_0:setConfirmCondition("Button_Cancel")
  A0_0:setCancelCondition()
  A0_0:setUICommandCondition("UILuaCommand.CountDownCompleted")
  A0_0:setTextByOwner("TextBlock_Text", A2_2, A3_3, ...)
  A0_0:setMaximum("ProgressBar_CountDown", A1_1 * 60)
  A0_0:setValue("ProgressBar_CountDown", A1_1 * 60)
end
function WaitingCountdownWidget.processUICommandOperate(A0_5, A1_6, A2_7, A3_8, A4_9)
  if A0_5:isAskFinish() == false and A2_7 == "Button_Cancel" then
    A0_5:setBaseAskResult(2)
  end
end
function WaitingCountdownWidget.processUICommandCancel(A0_10, A1_11, A2_12, A3_13, A4_14)
  if A0_10:isAskFinish() == false then
    A0_10:setBaseAskResult(2)
  end
end
function WaitingCountdownWidget.processUICommandDefault(A0_15, A1_16, A2_17, A3_18, A4_19, A5_20)
  if A0_15:isAskFinish() == false and A3_18 == "UILuaCommand.CountDownCompleted" then
    A0_15:setBaseAskResult(1)
  end
end
