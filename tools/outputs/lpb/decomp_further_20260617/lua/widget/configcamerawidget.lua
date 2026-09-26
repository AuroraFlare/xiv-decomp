require("/Widget/WidgetBaseClass")
_defineClass("ConfigCameraWidget", "WidgetBaseClass")
function ConfigCameraWidget.init(A0_0)
  A0_0:setModal(true)
  A0_0:setControlCommandCondition("ToggleButton_Camera1", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Camera2", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Camera3", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Camera4", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Camera5", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("Slider_CameraView", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_CameraOffset", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_CameraTurn", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("Slider_LockOn", "UILuaCommands.SliderValueChanged")
  A0_0:setConfirmCondition("Button_AllClear")
  A0_0:setConfirmCondition("Button_Save")
  A0_0:setConfirmCondition("Button_Reset")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setControlUserWorkInt(1, "ToggleButton_Camera1", 20)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Camera2", 21)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Camera3", 22)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Camera4", 23)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Camera5", 5)
  A0_0:setControlUserWorkInt(1, "Slider_CameraView", 24)
  A0_0:setControlUserWorkInt(1, "Slider_CameraOffset", 28)
  A0_0:setControlUserWorkInt(1, "Slider_CameraTurn", 36)
  A0_0:setControlUserWorkInt(1, "Slider_LockOn", 70)
  A0_0:initControls()
end
function ConfigCameraWidget.reset(A0_1)
  desktopWidget:resetConfigWork(20)
  desktopWidget:resetConfigWork(21)
  desktopWidget:resetConfigWork(22)
  desktopWidget:resetConfigWork(23)
  desktopWidget:resetConfigWork(5)
  desktopWidget:resetConfigWork(24)
  desktopWidget:resetConfigWork(28)
  desktopWidget:resetConfigWork(36)
  desktopWidget:resetConfigWork(70)
  A0_1:initControls()
  desktopWidget:setDefaultCamera(false)
end
function ConfigCameraWidget.initControls(A0_2)
  A0_2:initToggleButton("ToggleButton_Camera1")
  A0_2:initToggleButton("ToggleButton_Camera2")
  A0_2:initToggleButton("ToggleButton_Camera3")
  A0_2:initToggleButton("ToggleButton_Camera4")
  A0_2:initToggleButton("ToggleButton_Camera5")
  A0_2:initSliderBar("Slider_CameraView")
  A0_2:initSliderBar("Slider_CameraOffset")
  A0_2:initSliderBar("Slider_CameraTurn")
  A0_2:initSliderBar("Slider_LockOn")
end
function ConfigCameraWidget.processUICommandOperate(A0_3, A1_4, A2_5, A3_6, A4_7)
  local L5_8
  L5_8 = A2_5
  if L5_8 == "Button_AllClear" then
    desktopWidget:setDefaultCamera(false)
    break
  else
  end
  if L5_8 == "Button_Save" then
    desktopWidget:setDefaultCamera(true)
    break
  else
  end
  if L5_8 == "Button_Reset" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_3, true, nil, 1347, 2, 1348, 1349)
    do break end
    break
  else
  end
end
function ConfigCameraWidget.processUICommandToggleButton(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  local L6_15
  L6_15 = A0_9.getControlUserWorkInt
  L6_15 = L6_15(A0_9, 1, A2_11)
  desktopWidget:setConfigFlag(L6_15, A5_14)
end
function ConfigCameraWidget.processUICommandSliderChange(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21)
  local L6_22
  L6_22 = A0_16.getControlUserWorkInt
  L6_22 = L6_22(A0_16, 1, A2_18)
  if A2_18 == "Slider_CameraView" then
    A5_21 = A5_21 + 18
  end
  if A5_21 ~= desktopWidget:getConfigWork(L6_22) then
    desktopWidget:setConfigWork(L6_22, A5_21)
  end
end
function ConfigCameraWidget.processAskResult(A0_23, A1_24)
  if A1_24 == 1 then
    A0_23:reset()
  end
end
function ConfigCameraWidget.initSliderBar(A0_25, A1_26)
  local L2_27, L3_28
  L3_28 = A0_25
  L2_27 = A0_25.getControlUserWorkInt
  L2_27 = L2_27(L3_28, 1, A1_26)
  L3_28 = desktopWidget
  L3_28 = L3_28.getConfigWork
  L3_28 = L3_28(L3_28, L2_27)
  if A1_26 == "Slider_CameraView" then
    L3_28 = L3_28 - 18
    if L3_28 < 0 then
      L3_28 = 0
    end
  end
  A0_25:setValue(A1_26, L3_28)
end
function ConfigCameraWidget.initToggleButton(A0_29, A1_30)
  local L2_31
  L2_31 = A0_29.getControlUserWorkInt
  L2_31 = L2_31(A0_29, 1, A1_30)
  A0_29:setChecked(A1_30, desktopWidget:getConfigFlag(L2_31))
end
