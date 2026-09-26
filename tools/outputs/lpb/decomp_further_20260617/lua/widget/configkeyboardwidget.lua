require("/Widget/WidgetBaseClass")
_defineClass("ConfigKeyboardWidget", "WidgetBaseClass")
function ConfigKeyboardWidget.init(A0_0)
  A0_0:setControlCommandCondition("ToggleButton_Controler", "UILuaCommands.ToggleButton")
  A0_0:setControlUserWorkInt(1, "ToggleButton_Controler", 10)
  A0_0:setConfirmCondition("Button_TypeA")
  A0_0:setConfirmCondition("Button_TypeB")
  A0_0:setCancelCondition()
  A0_0:initToggleButton("ToggleButton_Controler")
end
function ConfigKeyboardWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  local L5_6
  if A2_3 == "Button_TypeA" then
    L5_6 = 0
    break
  else
  end
  if A2_3 == "Button_TypeB" then
    L5_6 = 1
    do break end
    break
  else
  end
  if L5_6 ~= nil then
    desktopWidget:openChildWidget("ConfigKeyboardAskWidget", A0_1, true, L5_6)
  end
end
function ConfigKeyboardWidget.processUICommandCancel(A0_7, A1_8, A2_9, A3_10, A4_11)
  A0_7:sendControlCommand("KeyConfig_Saver", "KeyConfig.Save")
  desktopWidget:closeWidgetDirect(A0_7)
end
function ConfigKeyboardWidget.processUICommandToggleButton(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17)
  local L6_18
  if A5_17 == true then
    L6_18 = A0_12.sendControlCommand
    L6_18(A0_12, "KeyConfig_Saver", "KeyConfig.Save")
  end
  L6_18 = A0_12.getControlUserWorkInt
  L6_18 = L6_18(A0_12, 1, A2_14)
  desktopWidget:setConfigFlag(L6_18, A5_17)
end
function ConfigKeyboardWidget.initToggleButton(A0_19, A1_20)
  local L2_21
  L2_21 = A0_19.getControlUserWorkInt
  L2_21 = L2_21(A0_19, 1, A1_20)
  A0_19:setChecked(A1_20, desktopWidget:getConfigFlag(L2_21))
end
