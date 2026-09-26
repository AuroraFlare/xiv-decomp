require("/Widget/WidgetBaseClass")
_defineClass("CutSceneSkipWarningWidget", "WidgetBaseClass")
function CutSceneSkipWarningWidget.init(A0_0)
  A0_0:setUICommandCondition("UILuaCommands.CompleteAnimated")
  A0_0:setText("TextBlock_WarningText", 1027)
end
function CutSceneSkipWarningWidget.processUICommandDefault(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  A0_1:hide()
end
function CutSceneSkipWarningWidget.processBeforeShow(A0_7, A1_8)
  A0_7:setVisualOpacity("TextBlock_WarningText", 0.7)
  return true
end
