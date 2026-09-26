require("/Widget/WidgetBaseClass")
_defineClass("ErrorDialogWidget", "WidgetBaseClass")
function ErrorDialogWidget.init(A0_0)
  A0_0:setConfirmCondition("Button_1")
  A0_0:setCancelCondition()
  A0_0:setContent("Button_1", 1005)
  A0_0:setVisibility("IconControl_InfoIcon", false)
  A0_0:setModal(true)
end
function ErrorDialogWidget.processUICommandEvent(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  A0_1:finish(true)
end
function ErrorDialogWidget.finish(A0_7, A1_8)
  if A0_7:getArgActor() ~= nil then
    A0_7:getArgActor():processErrorDialogResult()
    A0_7:setArgActor(nil)
  end
  if A1_8 == true then
    A0_7:hide()
  end
end
function ErrorDialogWidget.request(A0_9, A1_10, A2_11)
  A0_9:finish(false)
  A0_9:setArgActor(A1_10)
  A0_9:setText("TextBlock_GuildText", A2_11)
  A0_9:show()
end
