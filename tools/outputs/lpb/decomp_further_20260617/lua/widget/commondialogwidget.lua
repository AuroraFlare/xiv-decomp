require("/Widget/WidgetBaseClass")
_defineClass("CommonDialogWidget", "WidgetBaseClass")
function CommonDialogWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8)
  local L9_9, L10_10, L11_11, L12_12
  L9_9(L10_10, L11_11)
  for L12_12 = 1, 3 do
    A0_0:setConfirmCondition("Button_" .. tostring(L12_12))
  end
  L9_9(L10_10)
  L12_12 = A2_2
  L9_9(L10_10, L11_11, L12_12)
  if A8_8 ~= nil then
    L12_12 = A8_8
    L9_9(L10_10, L11_11, L12_12)
  end
  L12_12 = A3_3
  if L12_12 == 1 then
    break
  else
  end
  if L12_12 == 2 then
    break
  else
  end
  if L12_12 == 3 then
    break
  else
  end
  if L12_12 == 4 then
    do break end
    break
  else
  end
  if A5_5 == nil then
    L12_12 = A0_0.setButton
    L12_12(A0_0, 1, L9_9)
  else
    L12_12 = A0_0.setButton
    L12_12(A0_0, 1, A5_5)
  end
  if A6_6 == nil then
    L12_12 = A0_0.setButton
    L12_12(A0_0, 2, L10_10)
  else
    L12_12 = A0_0.setButton
    L12_12(A0_0, 2, A6_6)
  end
  if A7_7 == nil then
    L12_12 = A0_0.setButton
    L12_12(A0_0, 3, L11_11)
  else
    L12_12 = A0_0.setButton
    L12_12(A0_0, 3, A7_7)
  end
  if A4_4 ~= nil then
    L12_12 = A0_0.setLogicalFocus
    L12_12(A0_0, "Button_" .. tostring(A4_4))
  end
end
function CommonDialogWidget.processUICommandEvent(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18)
  local L6_19
  L6_19 = A3_16
  if L6_19 == "UILuaCommands.Operate" then
    A0_13:setAskResult(A4_17)
    break
  else
  end
  if L6_19 == "UILuaCommands.Cancel" then
    A0_13:setAskResult(0)
    do break end
    break
  else
  end
end
function CommonDialogWidget.setAskResult(A0_20, A1_21)
  A0_20:_getParentWidget():processAskResult(A1_21)
  desktopWidget:closeWidgetDirect(A0_20)
end
function CommonDialogWidget.setButton(A0_22, A1_23, A2_24)
  local L3_25, L4_26
  if A2_24 ~= nil then
    L3_25 = true
  else
    L3_25 = false
  end
  L4_26 = "Button_"
  L4_26 = L4_26 .. tostring(A1_23)
  A0_22:setContent(L4_26, A2_24)
  A0_22:setVisibility(L4_26, L3_25)
end
