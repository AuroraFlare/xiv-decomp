require("/Widget/WidgetBaseClass")
_defineClass("CommonAskWidget", "WidgetBaseClass")
function CommonAskWidget.init(A0_0, A1_1, A2_2, A3_3, ...)
  A0_0.work._temp = {
    {
      "askDefaultAnswer",
      "integer8"
    }
  }
  A0_0:setModal(true)
  A0_0:setCancelCondition()
  A0_0:_setUICommandTemplateCondition("ControlTemplate_ListBoxItem", "TemplateButton_Answer", "UILuaCommands.Operate", 5)
  A0_0:setText("TextBlock_Question", A2_2)
  A0_0:setListBoxItem("ListBox_Answers", "Item_Answers", "TemplateButton_Answer", ...)
  if A3_3 ~= nil then
    A0_0.work.askDefaultAnswer = A3_3
  else
    A0_0.work.askDefaultAnswer = 1
  end
end
function CommonAskWidget.processUICommandEvent(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10)
  local L6_11, L7_12
  L6_11 = A3_8
  if L6_11 == "UILuaCommands.Operate" then
    if A2_7 == "TemplateButton_Answer" then
      L7_12 = tonumber
      L7_12 = L7_12(desktopWidget:parseWidgetString(A1_6, 2, "Answers"))
      A0_5:setAskResult(L7_12)
      do break end
      else
      end
      if L6_11 == "UILuaCommands.Cancel" then
        L7_12 = A0_5.setAskResult
        L7_12(A0_5, 0)
        break
      else
      end
    else
    end
end
function CommonAskWidget.processAfterShow(A0_13, A1_14)
  local L2_15
  L2_15 = "Item_Answers"
  L2_15 = L2_15 .. tostring(A0_13.work.askDefaultAnswer)
  A0_13:_setKeyboardFocusedControl(L2_15, "TemplateButton_Answer")
  return true
end
function CommonAskWidget.setAskResult(A0_16, A1_17)
  A0_16:_getParentWidget():processAskResult(A1_17)
  desktopWidget:closeWidgetDirect(A0_16)
end
