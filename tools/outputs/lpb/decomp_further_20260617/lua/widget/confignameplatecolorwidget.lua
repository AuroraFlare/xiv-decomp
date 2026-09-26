require("/Widget/WidgetBaseClass")
_defineClass("ConfigNamePlateColorWidget", "WidgetBaseClass")
function ConfigNamePlateColorWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ProgressBarColorListWidget"
  return L1_1
end
function ConfigNamePlateColorWidget.init(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7
  for L5_7 = 1, 4 do
    L1_3 = "Button_Color_" .. L5_7
    A0_2:setConfirmCondition(L1_3)
    A0_2:setCommandParameter(L1_3, L5_7)
  end
  L2_4(L3_5)
  L2_4(L3_5)
  L2_4(L3_5, L4_6)
end
function ConfigNamePlateColorWidget.setCurrent(A0_8, A1_9)
end
function ConfigNamePlateColorWidget.getButtonColor(A0_10, A1_11)
  return A0_10:getControlProperty(A1_11, "SqwtDesignData.StringValue0") * 255 * 65536 + A0_10:getControlProperty(A1_11, "SqwtDesignData.StringValue1") * 255 * 256 + A0_10:getControlProperty(A1_11, "SqwtDesignData.StringValue2") * 255
end
function ConfigNamePlateColorWidget.processUICommandOperate(A0_12, A1_13, A2_14, A3_15, A4_16)
  if A0_12:_getParentWidget() ~= nil then
    A0_12:_getParentWidget():processColorResult(A0_12:getButtonColor(A2_14))
  end
  A0_12:hide()
end
function ConfigNamePlateColorWidget.processUICommandClose(A0_17, A1_18, A2_19, A3_20, A4_21)
  A0_17:hide()
end
