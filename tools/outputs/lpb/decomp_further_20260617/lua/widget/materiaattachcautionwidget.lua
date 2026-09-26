require("/Widget/WidgetBaseClass")
_defineClass("MateriaAttachCautionWidget", "WidgetBaseClass")
function MateriaAttachCautionWidget.init(A0_0, A1_1, A2_2, A3_3)
  A0_0:setModal(true)
  A0_0:setConfirmCondition("Button_1")
  A0_0:setConfirmCondition("Button_2")
  A0_0:setCancelCondition()
  A0_0:setText("TextBlock_GuildText", A1_1)
  A0_0:setContent("Button_1", A2_2)
  A0_0:setContent("Button_2", A3_3)
  A0_0:setLogicalFocus("Button_2")
end
function MateriaAttachCautionWidget.processUICommandEvent(A0_4, A1_5, A2_6, A3_7, A4_8, A5_9)
  local L6_10
  L6_10 = A3_7
  if L6_10 == "UILuaCommands.Operate" then
    if A2_6 == "Button_1" then
      A0_4:setAskResult(1)
    else
      A0_4:setAskResult(-1)
      do break end
      else
      end
      if L6_10 == "UILuaCommands.Cancel" then
        A0_4:setAskResult(-1)
        do break end
        break
      else
      end
    end
end
function MateriaAttachCautionWidget.setAskResult(A0_11, A1_12)
  A0_11:_getParentWidget():processAskResult(A1_12)
  desktopWidget:closeWidgetDirect(A0_11)
end
