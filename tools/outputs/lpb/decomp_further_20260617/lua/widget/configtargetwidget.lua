require("/Widget/WidgetBaseClass")
_defineClass("ConfigTargetWidget", "WidgetBaseClass")
function ConfigTargetWidget.init(A0_0)
  A0_0:setControlCommandCondition("ToggleButton_DirectTarget", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_AutoLockon", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_TargetBattle", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_UseSubTarget", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_CharacterEdge", "UILuaCommands.ToggleButton")
  A0_0:setControlCommandCondition("ToggleButton_MouseOverPlate", "UILuaCommands.ToggleButton")
  A0_0:setConfirmCondition("RadioButton_OperationType_A")
  A0_0:setConfirmCondition("RadioButton_OperationType_B")
  A0_0:setConfirmCondition("RadioButton_OperationType_C")
  A0_0:setConfirmCondition("RadioButton_CursorType_A")
  A0_0:setConfirmCondition("RadioButton_CursorType_B")
  A0_0:setConfirmCondition("RadioButton_CursorType_C")
  A0_0:setConfirmCondition("Button_Reset")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:setControlUserWorkInt(1, "ToggleButton_DirectTarget", 34)
  A0_0:setControlUserWorkInt(1, "ToggleButton_AutoLockon", 4)
  A0_0:setControlUserWorkInt(1, "ToggleButton_TargetBattle", 42)
  A0_0:setControlUserWorkInt(1, "ToggleButton_UseSubTarget", 43)
  A0_0:setControlUserWorkInt(1, "ToggleButton_CharacterEdge", 84)
  A0_0:setControlUserWorkInt(1, "ToggleButton_MouseOverPlate", 83)
  A0_0:update()
end
function ConfigTargetWidget.update(A0_1)
  local L1_2, L2_3, L3_4
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L3_4 = "ToggleButton_DirectTarget"
  L1_2(L2_3, L3_4)
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L3_4 = "ToggleButton_AutoLockon"
  L1_2(L2_3, L3_4)
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L3_4 = "ToggleButton_TargetBattle"
  L1_2(L2_3, L3_4)
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L3_4 = "ToggleButton_UseSubTarget"
  L1_2(L2_3, L3_4)
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L3_4 = "ToggleButton_CharacterEdge"
  L1_2(L2_3, L3_4)
  L2_3 = A0_1
  L1_2 = A0_1.initToggleButton
  L3_4 = "ToggleButton_MouseOverPlate"
  L1_2(L2_3, L3_4)
  L1_2 = desktopWidget
  L2_3 = L1_2
  L1_2 = L1_2.getConfigWork
  L3_4 = 13
  L1_2 = L1_2(L2_3, L3_4)
  L2_3 = L1_2
  if L2_3 == 0 then
    L3_4 = A0_1.setChecked
    L3_4(A0_1, "RadioButton_OperationType_A", true)
    break
  else
  end
  if L2_3 == 1 then
    L3_4 = A0_1.setChecked
    L3_4(A0_1, "RadioButton_OperationType_B", true)
    break
  else
  end
  if L2_3 == 2 then
    L3_4 = A0_1.setChecked
    L3_4(A0_1, "RadioButton_OperationType_C", true)
    break
  else
  end
  L2_3 = desktopWidget
  L3_4 = L2_3
  L2_3 = L2_3.getConfigWork
  L2_3 = L2_3(L3_4, 32)
  L3_4 = L2_3
  if L3_4 == 0 then
    A0_1:setChecked("RadioButton_CursorType_A", true)
    break
  else
  end
  if L3_4 == 1 then
    A0_1:setChecked("RadioButton_CursorType_B", true)
    break
  else
  end
  if L3_4 == 2 then
    A0_1:setChecked("RadioButton_CursorType_C", true)
    break
  else
  end
end
function ConfigTargetWidget.reset(A0_5)
  desktopWidget:resetConfigWork(34)
  desktopWidget:resetConfigWork(4)
  desktopWidget:resetConfigWork(13)
  desktopWidget:resetConfigWork(32)
  desktopWidget:resetConfigWork(42)
  desktopWidget:resetConfigWork(43)
  desktopWidget:resetConfigWork(83)
  desktopWidget:resetConfigWork(84)
  A0_5:update()
end
function ConfigTargetWidget.processUICommandOperate(A0_6, A1_7, A2_8, A3_9, A4_10)
  local L5_11
  L5_11 = A2_8
  if L5_11 == "RadioButton_OperationType_A" then
    desktopWidget:setConfigWork(13, 0)
    break
  else
  end
  if L5_11 == "RadioButton_OperationType_B" then
    desktopWidget:setConfigWork(13, 1)
    break
  else
  end
  if L5_11 == "RadioButton_OperationType_C" then
    desktopWidget:setConfigWork(13, 2)
    break
  else
  end
  if L5_11 == "RadioButton_CursorType_A" then
    desktopWidget:setConfigWork(32, 0)
    break
  else
  end
  if L5_11 == "RadioButton_CursorType_B" then
    desktopWidget:setConfigWork(32, 1)
    break
  else
  end
  if L5_11 == "RadioButton_CursorType_C" then
    desktopWidget:setConfigWork(32, 2)
    break
  else
  end
  if L5_11 == "Button_Reset" then
    desktopWidget:openChildWidget("CommonAskWidget", A0_6, true, nil, 1347, 2, 1348, 1349)
    break
  else
  end
end
function ConfigTargetWidget.processUICommandToggleButton(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17)
  local L6_18
  L6_18 = A0_12.getControlUserWorkInt
  L6_18 = L6_18(A0_12, 1, A2_14)
  desktopWidget:setConfigFlag(L6_18, A5_17)
end
function ConfigTargetWidget.initToggleButton(A0_19, A1_20)
  local L2_21
  L2_21 = A0_19.getControlUserWorkInt
  L2_21 = L2_21(A0_19, 1, A1_20)
  A0_19:setChecked(A1_20, desktopWidget:getConfigFlag(L2_21))
end
function ConfigTargetWidget.processAskResult(A0_22, A1_23)
  if A1_23 == 1 then
    A0_22:reset()
  end
end
