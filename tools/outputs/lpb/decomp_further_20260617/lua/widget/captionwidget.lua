require("/Widget/WidgetBaseClass")
_defineClass("CaptionWidget", "WidgetBaseClass")
function CaptionWidget.init(A0_0)
  A0_0:removeCaption()
end
function CaptionWidget.setCaptionText(A0_1, A1_2, A2_3, ...)
  local L4_5, L5_6, L6_7, L7_8, L8_9
  L5_6 = A0_1
  L4_5 = A0_1.setCaption
  L6_7 = A1_2
  L7_8 = A2_3
  L8_9 = ...
  L4_5(L5_6, L6_7, L7_8, L8_9)
end
function CaptionWidget.removeCaptionText(A0_10)
  A0_10:removeCaption()
end
function CaptionWidget.setCaption(A0_11, A1_12, A2_13, ...)
  local L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22
  L5_16 = A0_11
  L4_15 = A0_11._setProperty
  L6_17 = nil
  L7_18 = "TextBlock_Caption"
  L8_19 = "Text"
  L9_20 = A1_12
  L10_21 = A2_13
  L11_22 = ...
  L4_15(L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22)
end
function CaptionWidget.removeCaption(A0_23)
  A0_23:_setProperty(nil, "TextBlock_Caption", "Text", "")
end
