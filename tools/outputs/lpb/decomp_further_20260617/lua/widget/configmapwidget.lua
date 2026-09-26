require("/Widget/WidgetBaseClass")
_defineClass("ConfigMapWidget", "WidgetBaseClass")
function ConfigMapWidget.init(A0_0)
  A0_0:setControlCommandCondition("Slider_TransparencyConfig", "UILuaCommands.SliderValueChanged")
  A0_0:setConfirmCondition("Button_Reset")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:setControlUserWorkInt(1, "Slider_TransparencyConfig", 72)
  A0_0:initControls()
end
function ConfigMapWidget.reset(A0_1)
  desktopWidget:resetConfigWork(72)
  A0_1:initControls()
end
function ConfigMapWidget.initControls(A0_2)
  A0_2:initSliderBar("Slider_TransparencyConfig")
end
function ConfigMapWidget.processUICommandOperate(A0_3, A1_4, A2_5, A3_6, A4_7)
  if A2_5 == "Button_Reset" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_3, true, nil, 1347, 2, 1348, 1349)
    do break end
    break
  else
  end
end
function ConfigMapWidget.processUICommandSliderChange(A0_8, A1_9, A2_10, A3_11, A4_12, A5_13)
  local L6_14, L7_15, L8_16, L9_17
  if A2_10 == "Slider_TransparencyConfig" then
    L7_15 = A0_8
    L6_14 = A0_8.getControlUserWorkInt
    L8_16 = 1
    L9_17 = A2_10
    L6_14 = L6_14(L7_15, L8_16, L9_17)
    L8_16 = A0_8
    L7_15 = A0_8.getMaximum
    L9_17 = A2_10
    L7_15 = L7_15(L8_16, L9_17)
    L8_16 = L7_15 - A5_13
    L9_17 = desktopWidget
    L9_17 = L9_17.setConfigWork
    L9_17(L9_17, L6_14, L8_16)
    L9_17 = L8_16 / L7_15
    A0_8:setVisualOpacity("IconControl_MapSample", L9_17)
  end
end
function ConfigMapWidget.processAskResult(A0_18, A1_19)
  if A1_19 == 1 then
    A0_18:reset()
  end
end
function ConfigMapWidget.initSliderBar(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25, L6_26
  if A1_21 == "Slider_TransparencyConfig" then
    L3_23 = A0_20
    L2_22 = A0_20.getControlUserWorkInt
    L4_24 = 1
    L5_25 = A1_21
    L2_22 = L2_22(L3_23, L4_24, L5_25)
    L3_23 = desktopWidget
    L4_24 = L3_23
    L3_23 = L3_23.getConfigWork
    L5_25 = L2_22
    L3_23 = L3_23(L4_24, L5_25)
    L5_25 = A0_20
    L4_24 = A0_20.getMaximum
    L6_26 = A1_21
    L4_24 = L4_24(L5_25, L6_26)
    L5_25 = L4_24 - L3_23
    L6_26 = A0_20.setValue
    L6_26(A0_20, A1_21, L5_25)
    L6_26 = L3_23 / L4_24
    A0_20:setVisualOpacity("IconControl_MapSample", L6_26)
  end
end
