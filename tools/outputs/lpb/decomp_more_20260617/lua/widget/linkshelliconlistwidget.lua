require("/Widget/WidgetBaseClass")
_defineClass("LinkshellIconListWidget", "WidgetBaseClass")
function LinkshellIconListWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  for L4_4 = 1, 10 do
    L5_5 = "Button_Icon_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:setConfirmCondition(L5_5)
    A0_0:setCommandParameter(L5_5, L4_4)
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
end
function LinkshellIconListWidget.processUICommandOperate(A0_6, A1_7, A2_8, A3_9, A4_10)
  if A2_8 == "Button_Close" then
    A0_6:hide()
    break
  else
  end
  if A3_9 ~= nil then
    A0_6:_getParentWidget():setIconColor(A3_9)
    A0_6:hide()
    return
  else
  end
end
function LinkshellIconListWidget.processUICommandCancel(A0_11, A1_12, A2_13, A3_14, A4_15)
  A0_11:hide()
end
function LinkshellIconListWidget.setIconBaseID(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25
  L2_18 = true
  L3_19 = 10
  if A1_17 == 1 then
    L3_19 = 7
    L2_18 = false
  end
  L4_20 = desktopWidget
  L4_20 = L4_20.getLinkshellBaseIconID
  L4_20 = L4_20(L5_21, L6_22)
  L4_20 = L4_20 - 1
  for L8_24 = 1, L3_19 do
    L9_25 = "Button_Icon_"
    L9_25 = L9_25 .. tostring(L8_24)
    A0_16:setIcon(L9_25 .. ":IconControl_Icon", L4_20 + L8_24)
  end
  for L8_24 = 8, 10 do
    L9_25 = "Button_Icon_"
    L9_25 = L9_25 .. tostring(L8_24)
    A0_16:setVisibility(L9_25, L2_18)
  end
  L8_24 = "1"
  L5_21(L6_22, L7_23)
end
