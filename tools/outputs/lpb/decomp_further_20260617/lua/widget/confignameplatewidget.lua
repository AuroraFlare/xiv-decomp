require("/Widget/WidgetBaseClass")
_defineClass("ConfigNamePlateWidget", "WidgetBaseClass")
function ConfigNamePlateWidget.init(A0_0)
  A0_0:setControlCommandCondition("ToggleButton_NamePlate", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("Slider_NamePlatePos", "UILuaCommands.SliderValueChanged")
  A0_0:setControlCommandCondition("ToggleButton_NameIcon_1", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_HPbar_1", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_NameIcon_2", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_HPbar_2", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_NameIcon_3", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_HPbar_3", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_NameIcon_4", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_NpcHPbar", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_EnemyName", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_EnemyHPbar", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_ActiveIcon", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_EnemyLevel", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_Hostile", "UILuaCommands.ToggleButton")
  A0_0:setConfirmCondition("Button_Reset")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:setHelpParameter("TextBlock_Title", 1, 77418)
  A0_0:setControlUserWorkInt(1, "ToggleButton_NamePlate", 26)
  A0_0:setControlUserWorkInt(1, "Slider_NamePlatePos", 73)
  A0_0:setControlUserWorkInt(1, "ToggleButton_NameIcon_1", 74)
  A0_0:setControlUserWorkInt(1, "ToggleButton_HPbar_1", 75)
  A0_0:setControlUserWorkInt(1, "ToggleButton_NameIcon_2", 76)
  A0_0:setControlUserWorkInt(1, "ToggleButton_HPbar_2", 77)
  A0_0:setControlUserWorkInt(1, "ToggleButton_NameIcon_3", 78)
  A0_0:setControlUserWorkInt(1, "ToggleButton_HPbar_3", 79)
  A0_0:setControlUserWorkInt(1, "ToggleButton_NameIcon_4", 80)
  A0_0:setControlUserWorkInt(1, "ToggleButton_NpcHPbar", 85)
  A0_0:setControlUserWorkInt(1, "ToggleButton_EnemyName", 81)
  A0_0:setControlUserWorkInt(1, "ToggleButton_EnemyHPbar", 82)
  A0_0:setControlUserWorkInt(1, "ToggleButton_ActiveIcon", 31)
  A0_0:setControlUserWorkInt(1, "ToggleButton_EnemyLevel", 30)
  A0_0:setControlUserWorkInt(1, "ToggleButton_Hostile", 35)
  A0_0:update()
end
function ConfigNamePlateWidget.update(A0_1)
  A0_1:initToggleButton("ToggleButton_NamePlate")
  A0_1:initToggleButton("ToggleButton_NameIcon_1")
  A0_1:initToggleButton("ToggleButton_HPbar_1")
  A0_1:initToggleButton("ToggleButton_NameIcon_2")
  A0_1:initToggleButton("ToggleButton_HPbar_2")
  A0_1:initToggleButton("ToggleButton_NameIcon_3")
  A0_1:initToggleButton("ToggleButton_HPbar_3")
  A0_1:initToggleButton("ToggleButton_NameIcon_4")
  A0_1:initToggleButton("ToggleButton_NpcHPbar")
  A0_1:initToggleButton("ToggleButton_EnemyName")
  A0_1:initToggleButton("ToggleButton_EnemyHPbar")
  A0_1:initToggleButton("ToggleButton_ActiveIcon")
  A0_1:initToggleButton("ToggleButton_EnemyLevel")
  A0_1:initToggleButton("ToggleButton_Hostile")
  A0_1:initSliderBar("Slider_NamePlatePos")
end
function ConfigNamePlateWidget.reset(A0_2)
  desktopWidget:resetConfigWork(26)
  desktopWidget:resetConfigWork(73)
  desktopWidget:resetConfigWork(74)
  desktopWidget:resetConfigWork(75)
  desktopWidget:resetConfigWork(76)
  desktopWidget:resetConfigWork(77)
  desktopWidget:resetConfigWork(78)
  desktopWidget:resetConfigWork(79)
  desktopWidget:resetConfigWork(80)
  desktopWidget:resetConfigWork(85)
  desktopWidget:resetConfigWork(81)
  desktopWidget:resetConfigWork(82)
  desktopWidget:resetConfigWork(31)
  desktopWidget:resetConfigWork(30)
  desktopWidget:resetConfigWork(35)
  A0_2:update()
end
function ConfigNamePlateWidget.processUICommandOperate(A0_3, A1_4, A2_5, A3_6, A4_7)
  if A2_5 == "Button_Reset" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_3, true, nil, 1347, 2, 1348, 1349)
    do break end
    break
  else
  end
end
function ConfigNamePlateWidget.processUICommandSelection(A0_8, A1_9, A2_10, A3_11, A4_12)
  local L5_13
  L5_13 = A0_8.getControlUserWorkInt
  L5_13 = L5_13(A0_8, 1, A2_10)
  desktopWidget:setConfigWork(L5_13, A3_11)
end
function ConfigNamePlateWidget.processUICommandToggleButton(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19)
  local L6_20
  L6_20 = A0_14.getControlUserWorkInt
  L6_20 = L6_20(A0_14, 1, A2_16)
  desktopWidget:setConfigFlag(L6_20, A5_19)
end
function ConfigNamePlateWidget.processUICommandSliderChange(A0_21, A1_22, A2_23, A3_24, A4_25, A5_26)
  local L6_27
  L6_27 = A0_21.getControlUserWorkInt
  L6_27 = L6_27(A0_21, 1, A2_23)
  if A5_26 ~= desktopWidget:getConfigWork(L6_27) then
    desktopWidget:setConfigWork(L6_27, A5_26)
  end
end
function ConfigNamePlateWidget.initToggleButton(A0_28, A1_29)
  local L2_30
  L2_30 = A0_28.getControlUserWorkInt
  L2_30 = L2_30(A0_28, 1, A1_29)
  A0_28:setChecked(A1_29, desktopWidget:getConfigFlag(L2_30))
end
function ConfigNamePlateWidget.initSliderBar(A0_31, A1_32)
  local L2_33, L3_34
  L3_34 = A0_31
  L2_33 = A0_31.getControlUserWorkInt
  L2_33 = L2_33(L3_34, 1, A1_32)
  L3_34 = desktopWidget
  L3_34 = L3_34.getConfigWork
  L3_34 = L3_34(L3_34, L2_33)
  A0_31:setValue(A1_32, L3_34)
end
function ConfigNamePlateWidget.initComboBox(A0_35, A1_36)
  local L2_37
  L2_37 = A0_35.getControlUserWorkInt
  L2_37 = L2_37(A0_35, 1, A1_36)
  A0_35:setSelectedIndex(A1_36, desktopWidget:getConfigWork(L2_37))
end
function ConfigNamePlateWidget.processAskResult(A0_38, A1_39)
  if A1_39 == 1 then
    A0_38:reset()
  end
end
