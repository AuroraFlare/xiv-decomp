require("/Widget/WidgetBaseClass")
_defineClass("SubTargetGuideWidget", "WidgetBaseClass")
function SubTargetGuideWidget.init(A0_0)
  A0_0:setText("TextBlock_GuideText", 1025)
  A0_0:setVisibility("ToggleButton_RangeAttack", false)
end
function SubTargetGuideWidget.changeDisplay(A0_1, A1_2, A2_3)
  if A1_2 then
    A0_1:show()
  else
    A0_1:hide()
  end
end
function SubTargetGuideWidget.getRangeMode(A0_4)
  local L1_5
  L1_5 = true
  return L1_5
end
function SubTargetGuideWidget.setRangeMode(A0_6, A1_7)
end
