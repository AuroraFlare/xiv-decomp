require("/Widget/WidgetBaseClass")
_defineClass("TutorialSuccessWidget", "WidgetBaseClass")
function TutorialSuccessWidget.init(A0_0)
  A0_0:setUICommandCondition("UIFormCommands.TimerFinish")
  A0_0:setProperty("StringData.Value0", "3")
  A0_0:setDrawPriority(0.2)
end
function TutorialSuccessWidget.setData(A0_1, A1_2, A2_3)
  A0_1:setText("TextBlock_Text", A1_2)
  if A2_3 == true then
    A0_1:sendCommand("UIFormCommands.TimerStart")
  end
  A0_1:show()
end
function TutorialSuccessWidget.processUICommandEvent(A0_4, A1_5, A2_6, A3_7, A4_8, A5_9)
  if A3_7 == "UIFormCommands.TimerFinish" then
    A0_4:hide()
  end
end
