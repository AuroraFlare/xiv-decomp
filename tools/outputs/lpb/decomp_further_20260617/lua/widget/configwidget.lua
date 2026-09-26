require("/Widget/WidgetBaseClass")
_defineClass("ConfigWidget", "WidgetBaseClass")
function ConfigWidget.init(A0_0)
  A0_0:setConfirmCondition("Button_System")
  A0_0:setConfirmCondition("Button_Sound")
  A0_0:setConfirmCondition("Button_Camera")
  A0_0:setConfirmCondition("Button_ChatFilter")
  A0_0:setConfirmCondition("Button_LogColorSetting")
  A0_0:setConfirmCondition("Button_NamePlate")
  A0_0:setConfirmCondition("Button_LockOn")
  A0_0:setConfirmCondition("Button_Map")
  A0_0:setConfirmCondition("Button_KeyBoard")
  A0_0:setConfirmCondition("Button_Macro")
  A0_0:setConfirmCondition("Button_WindowReset")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:update()
end
function ConfigWidget.update(A0_1)
  local L1_2, L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1.getChildWidgetByWindowName
  L2_3 = L2_3(L3_4, "ConfigSystemWidget")
  L1_2 = L2_3
  if L1_2 ~= nil then
    L3_4 = L1_2
    L2_3 = L1_2.update
    L2_3(L3_4)
  end
  L3_4 = A0_1
  L2_3 = A0_1.getChildWidgetByWindowName
  L2_3 = L2_3(L3_4, "ConfigNamePlateWidget")
  L1_2 = L2_3
  if L1_2 ~= nil then
    L3_4 = L1_2
    L2_3 = L1_2.update
    L2_3(L3_4)
  end
  L3_4 = A0_1
  L2_3 = A0_1.getChildWidgetByWindowName
  L2_3 = L2_3(L3_4, "ConfigTargetWidget")
  L1_2 = L2_3
  if L1_2 ~= nil then
    L3_4 = L1_2
    L2_3 = L1_2.update
    L2_3(L3_4)
  end
  L3_4 = A0_1
  L2_3 = A0_1.getChildWidgetByWindowName
  L2_3 = L2_3(L3_4, "LogSettingWidget")
  L1_2 = L2_3
  if L1_2 ~= nil then
    L3_4 = L1_2
    L2_3 = L1_2.update
    L2_3(L3_4)
  end
  L2_3 = desktopWidget
  L3_4 = L2_3
  L2_3 = L2_3.getTutorialMenuType
  L2_3 = L2_3(L3_4)
  L3_4 = true
  if L2_3 == 1 then
  elseif L2_3 == 2 then
  elseif L2_3 == 3 then
  else
  end
  if L2_3 == 4 then
    L3_4 = false
    break
  else
  end
  A0_1:setEnable("Button_LockOn", L3_4)
end
function ConfigWidget.processUICommandOperate(A0_5, A1_6, A2_7, A3_8, A4_9)
  local L5_10
  L5_10 = A2_7
  if L5_10 == "Button_System" then
    desktopWidget:openChildWidget("ConfigSystemWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_Sound" then
    desktopWidget:openChildWidget("ConfigSoundWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_Camera" then
    desktopWidget:openChildWidget("ConfigCameraWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_ChatFilter" then
    desktopWidget:openChildWidget("LogSettingWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_LogColorSetting" then
    desktopWidget:openChildWidget("LogColorSettingWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_NamePlate" then
    desktopWidget:openChildWidget("ConfigNamePlateWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_LockOn" then
    desktopWidget:openChildWidget("ConfigTargetWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_Map" then
    desktopWidget:openChildWidget("ConfigMapWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_KeyBoard" then
    desktopWidget:openChildWidget("ConfigKeyboardWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_Macro" then
    desktopWidget:openChildWidget("UserMacroEditWidget", A0_5, true)
    break
  else
  end
  if L5_10 == "Button_WindowReset" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_5, true, nil, 1347, 2, 1348, 1349)
    do break end
    break
  else
  end
end
function ConfigWidget.processClosing(A0_11)
  desktopWidget:_saveUserConfig()
end
function ConfigWidget.processAskResult(A0_12, A1_13)
  if A1_13 == 1 then
    A0_12:sendDesktopCommand("RaptureCommands.ResetWidgetPosition")
  end
end
