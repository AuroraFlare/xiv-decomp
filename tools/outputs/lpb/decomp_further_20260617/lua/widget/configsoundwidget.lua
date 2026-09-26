require("/Widget/WidgetBaseClass")
_defineClass("ConfigSoundWidget", "WidgetBaseClass")
function ConfigSoundWidget.init(A0_0)
  A0_0:setControlCommandCondition("Slider_BGM", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_SystemSE", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_SE", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_Voice", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_EnvSound", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_SoundPos", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("ToggleButton_DOLBY", "UILuaCommands.ToggleButton")
  A0_0:setConfirmCondition("Button_Reset")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:setControlUserWorkInt(1, "Slider_BGM", 50)
  A0_0:setControlUserWorkInt(1, "Slider_SystemSE", 51)
  A0_0:setControlUserWorkInt(1, "Slider_SE", 52)
  A0_0:setControlUserWorkInt(1, "Slider_Voice", 54)
  A0_0:setControlUserWorkInt(1, "Slider_EnvSound", 55)
  A0_0:setControlUserWorkInt(1, "Slider_SoundPos", 56)
  A0_0:setControlUserWorkInt(1, "ToggleButton_DOLBY", 53)
  A0_0:initControls()
end
function ConfigSoundWidget.reset(A0_1)
  desktopWidget:resetConfigWork(50)
  desktopWidget:resetConfigWork(51)
  desktopWidget:resetConfigWork(52)
  desktopWidget:resetConfigWork(54)
  desktopWidget:resetConfigWork(55)
  desktopWidget:resetConfigWork(56)
  desktopWidget:resetConfigWork(53)
  A0_1:initControls()
end
function ConfigSoundWidget.initControls(A0_2)
  A0_2:initSliderBar("Slider_BGM")
  A0_2:initSliderBar("Slider_SystemSE")
  A0_2:initSliderBar("Slider_SE")
  A0_2:initSliderBar("Slider_Voice")
  A0_2:initSliderBar("Slider_EnvSound")
  A0_2:initSliderBar("Slider_SoundPos")
  A0_2:initToggleButton("ToggleButton_DOLBY")
end
function ConfigSoundWidget.processUICommandOperate(A0_3, A1_4, A2_5, A3_6, A4_7)
  if A2_5 == "Button_Reset" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_3, true, nil, 1347, 2, 1348, 1349)
    do break end
    break
  else
  end
end
function ConfigSoundWidget.processAskResult(A0_8, A1_9)
  if A1_9 == 1 then
    A0_8:reset()
  end
end
function ConfigSoundWidget.processUICommandToggleButton(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15)
  local L6_16
  L6_16 = A0_10.getControlUserWorkInt
  L6_16 = L6_16(A0_10, 1, A2_12)
  desktopWidget:setConfigFlag(L6_16, A5_15)
end
function ConfigSoundWidget.processUICommandSliderChange(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22)
  local L6_23
  L6_23 = A0_17.getControlUserWorkInt
  L6_23 = L6_23(A0_17, 1, A2_19)
  if L6_23 == 56 then
    A5_22 = A0_17:getMaximum(A2_19) - A5_22
  end
  desktopWidget:setConfigWork(L6_23, A5_22)
end
function ConfigSoundWidget.initToggleButton(A0_24, A1_25)
  local L2_26
  L2_26 = A0_24.getControlUserWorkInt
  L2_26 = L2_26(A0_24, 1, A1_25)
  A0_24:setChecked(A1_25, desktopWidget:getConfigFlag(L2_26))
end
function ConfigSoundWidget.initSliderBar(A0_27, A1_28)
  local L2_29, L3_30
  L3_30 = A0_27
  L2_29 = A0_27.getControlUserWorkInt
  L2_29 = L2_29(L3_30, 1, A1_28)
  L3_30 = desktopWidget
  L3_30 = L3_30.getConfigWork
  L3_30 = L3_30(L3_30, L2_29)
  if L2_29 == 56 then
    L3_30 = A0_27:getMaximum(A1_28) - L3_30
  end
  A0_27:setValue(A1_28, L3_30)
end
