require("/Widget/Ask/AskBaseClass")
_defineClass("JobTutorialWidget", "AskBaseClass")
function JobTutorialWidget.initAsk(A0_0)
  A0_0:setConfirmCondition("Button_OK")
  A0_0:setText("TextBlock_Title", 11101)
  A0_0:setText("TextBlock_Text_1", 11102)
  A0_0:setContent("Button_OK", 11103)
  A0_0:setCancelCondition()
  A0_0:setVisibility("TextBlock_Text_2", false)
end
function JobTutorialWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  if A2_3 == "Button_OK" then
    A0_1:setBaseAskResult(1)
  end
end
function JobTutorialWidget.processUICommandCancel(A0_6, A1_7, A2_8, A3_9, A4_10)
  A0_6:setBaseAskResult(1)
end
