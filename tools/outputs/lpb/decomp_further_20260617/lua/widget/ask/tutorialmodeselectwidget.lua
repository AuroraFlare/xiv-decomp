require("/Widget/Ask/AskBaseClass")
_defineClass("TutorialModeSelectWidget", "AskBaseClass")
function TutorialModeSelectWidget.initAsk(A0_0)
  A0_0:setCommandParameter("Button_1", 2)
  if worldMaster:_isKeyboardOnlyTutorial() == true then
    A0_0:setEnable("Button_1", false)
  else
    A0_0:setConfirmCondition("Button_1")
  end
  A0_0:setCommandParameter("Button_2", 1)
  A0_0:setConfirmCondition("Button_2")
end
function TutorialModeSelectWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  A0_1:setBaseAskResult(A3_4)
end
