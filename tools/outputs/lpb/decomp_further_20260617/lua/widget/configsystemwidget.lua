require("/Widget/WidgetBaseClass")
_defineClass("ConfigSystemWidget", "WidgetBaseClass")
function ConfigSystemWidget.init(A0_0)
  A0_0:setControlCommandCondition("ToggleButton_ActionBar", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Macrobar", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_ActionCancel", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_DamagePlate", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Vulgarity", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Shadow", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_FootSmoke", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Background", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Physics", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ComboBox_FrameRate", "UILuaCommands.Selection")
  A0_0:setConfirmCondition("Button_Reset")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:setControlUserWorkInt(1, "ToggleButton_ActionBar", 1)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Macrobar", 41)
  A0_0:setControlUserWorkInt(1, "ToggleButton_ActionCancel", 15)
  A0_0:setControlUserWorkInt(1, "ToggleButton_DamagePlate", 25)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Vulgarity", 27)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Shadow", 60)
  A0_0:setControlUserWorkInt(1, "ToggleButton_FootSmoke", 61)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Background", 63)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Physics", 62)
  A0_0:update()
end
function ConfigSystemWidget.update(A0_1)
  local L1_2, L2_3
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_ActionBar")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_Macrobar")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_ActionCancel")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_DamagePlate")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_Vulgarity")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_Shadow")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_FootSmoke")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_Background")
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L1_2(L2_3, "ToggleButton_Physics")
  L1_2 = desktopWidget
  L2_3 = L1_2
  L1_2 = L1_2.getConfigWork
  L1_2 = L1_2(L2_3, 64)
  L2_3 = 0
  if L1_2 == 30 then
    L2_3 = 1
  end
  A0_1:setSelectedIndex("ComboBox_FrameRate", L2_3)
end
function ConfigSystemWidget.reset(A0_4)
  desktopWidget:resetConfigWork(1)
  desktopWidget:resetConfigWork(41)
  desktopWidget:resetConfigWork(15)
  desktopWidget:resetConfigWork(25)
  desktopWidget:resetConfigWork(27)
  desktopWidget:resetConfigWork(60)
  desktopWidget:resetConfigWork(61)
  desktopWidget:resetConfigWork(63)
  desktopWidget:resetConfigWork(62)
  desktopWidget:resetConfigWork(64)
  A0_4:update()
end
function ConfigSystemWidget.processUICommandOperate(A0_5, A1_6, A2_7, A3_8, A4_9)
  desktopWidget:openChildWidget("CommonAskWidget", A0_5, true, nil, 1347, 2, 1348, 1349)
end
function ConfigSystemWidget.processUICommandSelection(A0_10, A1_11, A2_12, A3_13, A4_14)
  local L5_15
  L5_15 = 60
  if A3_13 == 1 then
    L5_15 = 30
  end
  desktopWidget:setConfigWork(64, L5_15)
end
function ConfigSystemWidget.processUICommandToggleButton(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21)
  local L6_22
  L6_22 = A0_16.getControlUserWorkInt
  L6_22 = L6_22(A0_16, 1, A2_18)
  desktopWidget:setConfigFlag(L6_22, A5_21)
end
function ConfigSystemWidget.initToggleButton(A0_23, A1_24)
  local L2_25
  L2_25 = A0_23.getControlUserWorkInt
  L2_25 = L2_25(A0_23, 1, A1_24)
  A0_23:setChecked(A1_24, desktopWidget:getConfigFlag(L2_25))
end
function ConfigSystemWidget.processAskResult(A0_26, A1_27)
  if A1_27 == 1 then
    A0_26:reset()
  end
end
