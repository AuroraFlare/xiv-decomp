require("/Widget/WidgetBaseClass")
_defineClass("WarningDialogWidget", "WidgetBaseClass")
function WarningDialogWidget.init(A0_0)
  A0_0:setUICommandCondition("UIFormCommands.TimerFinish")
  A0_0:setProperty("StringData.Value0", "90")
  A0_0:setDrawPriority(0.4)
end
function WarningDialogWidget.setInitialData(A0_1, A1_2, A2_3, ...)
  A0_1:setText("TextBlock_Text")
  if A1_2 ~= nil then
    A0_1:setTextByOwner("TextBlock_Text", A1_2, A2_3, ...)
  end
  A0_1:sendCommand("UIFormCommands.TimerStart")
end
function WarningDialogWidget.processUICommandEvent(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10)
  if A3_8 == "UIFormCommands.TimerFinish" then
    A0_5:hide()
  end
end
