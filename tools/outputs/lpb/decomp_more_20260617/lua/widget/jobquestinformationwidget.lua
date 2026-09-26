require("/Widget/WidgetBaseClass")
_defineClass("JobQuestInformationWidget", "WidgetBaseClass")
function JobQuestInformationWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, ...)
  A0_0:setUICommandCondition("UIFormCommands.TimerFinish")
  A0_0:setFocusable(false)
  A0_0:setProperty("StringData.Value0", "0:0:5")
  A0_0:setDrawPriority(0.2)
  if A1_1 == 1 then
    A0_0:setVisibility("Grid_GetAbility", true)
    A0_0:setVisibility("Grid_GetItem", false)
    A0_0:setText("TextBlock_GetAbility")
    if A3_3 ~= nil then
      A0_0:setTextByOwner("TextBlock_GetAbility", A3_3, A4_4, ...)
    end
    A0_0:setIcon("IconControl_AbilityIcon", A2_2)
    break
  else
  end
  if A1_1 == 2 then
    A0_0:setVisibility("Grid_GetAbility", false)
    A0_0:setVisibility("Grid_GetItem", true)
    A0_0:setText("TextBlock_GetItem")
    if A3_3 ~= nil then
      A0_0:setTextByOwner("TextBlock_GetItem", A3_3, A4_4, ...)
    end
    A0_0:setIcon("IconControl_ItemIcon", A2_2)
    do break end
    break
  else
  end
  A0_0:sendCommand("UIFormCommands.TimerStart")
end
function JobQuestInformationWidget.processUICommandEvent(A0_6, A1_7, A2_8, A3_9, A4_10, A5_11)
  if A3_9 == "UIFormCommands.TimerFinish" then
    desktopWidget:closeWidgetDirect(A0_6)
  end
end
