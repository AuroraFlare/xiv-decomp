require("/Widget/Ask/AskBaseClass")
_defineClass("LinkshellSelectIconWidget", "AskBaseClass")
function LinkshellSelectIconWidget.initAsk(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L6_6 = "iconBaseID"
  L7_7 = "integer32"
  L6_6 = {L7_7, L8_8}
  L7_7 = "selectBaseID"
  L8_8 = "integer32"
  L7_7 = {L8_8, L9_9}
  L8_8 = "oldIconID"
  L9_9 = "integer32"
  L8_8 = {L9_9, L10_10}
  L9_9 = "iconColor"
  L10_10 = "integer8"
  L3_3._temp = L4_4
  L3_3(L4_4, L5_5)
  L6_6 = 1
  L3_3(L4_4, L5_5, L6_6)
  L3_3(L4_4, L5_5)
  L6_6 = 2
  L3_3(L4_4, L5_5, L6_6)
  for L6_6 = 1, 58 do
    L7_7 = "Button_Icon_"
    L8_8 = tostring
    L9_9 = L6_6
    L8_8 = L8_8(L9_9)
    L7_7 = L7_7 .. L8_8
    L9_9 = A0_0
    L8_8 = A0_0.setConfirmCondition
    L10_10 = L7_7
    L8_8(L9_9, L10_10)
    L9_9 = A0_0
    L8_8 = A0_0.setCommandParameter
    L10_10 = L7_7
    L8_8(L9_9, L10_10, L6_6)
    L9_9 = A0_0
    L8_8 = A0_0.setIcon
    L10_10 = L7_7
    L10_10 = L10_10 .. ":IconControl_Icon"
    L8_8(L9_9, L10_10, 387 + L6_6 - 1)
  end
  L3_3(L4_4)
  L6_6, L7_7 = nil, nil
  if A1_1 == 1 then
    L6_6 = 1226
    L9_9 = A0_0
    L8_8 = A0_0.setConfirmCondition
    L10_10 = "Button_Quit"
    L8_8(L9_9, L10_10)
    L9_9 = A0_0
    L8_8 = A0_0.setCommandParameter
    L10_10 = "Button_Quit"
    L8_8(L9_9, L10_10, -1)
    L9_9 = A0_0
    L8_8 = A0_0.setHelpParameter
    L10_10 = "Button_Next"
    L8_8(L9_9, L10_10, 1, 79232)
    L9_9 = A0_0
    L8_8 = A0_0.setHelpParameter
    L10_10 = "Button_Back"
    L8_8(L9_9, L10_10, 1, 79234)
    L9_9 = A0_0
    L8_8 = A0_0.setHelpParameter
    L10_10 = "Button_Quit"
    L8_8(L9_9, L10_10, 1, 79235)
  else
    L6_6 = 1226
    L9_9 = A0_0
    L8_8 = A0_0.setVisibility
    L10_10 = "Button_Quit"
    L8_8(L9_9, L10_10, false)
    L9_9 = A0_0
    L8_8 = A0_0.setHelpParameter
    L10_10 = "Button_Next"
    L8_8(L9_9, L10_10, 0)
    L9_9 = A0_0
    L8_8 = A0_0.setHelpParameter
    L10_10 = "Button_Back"
    L8_8(L9_9, L10_10, 0)
  end
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_WindowTitle"
  L8_8(L9_9, L10_10, L3_3)
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_GuideText"
  L8_8(L9_9, L10_10, L6_6)
  L9_9 = A0_0
  L8_8 = A0_0.setContent
  L10_10 = "Button_Next"
  L8_8(L9_9, L10_10, L4_4)
  L9_9 = A0_0
  L8_8 = A0_0.setContent
  L10_10 = "Button_Back"
  L8_8(L9_9, L10_10, L5_5)
  if A2_2 == nil then
    L9_9 = A0_0
    L8_8 = A0_0.setSelectedIcon
    L10_10 = 1
    L8_8(L9_9, L10_10, 1)
    L8_8 = A0_0.work
    L8_8.oldIconID = -1
  else
    L8_8 = A2_2 - 1
    L9_9 = L8_8 / 10
    L10_10 = _math
    L10_10 = L10_10.floor
    L10_10 = L10_10(L9_9)
    L9_9 = L10_10 + 1
    L10_10 = L8_8 % 10
    L10_10 = L10_10 + 1
    A0_0:setSelectedIcon(L9_9, L10_10)
    A0_0.work.oldIconID = A2_2
  end
  L9_9 = A0_0
  L8_8 = A0_0.initChildWidget
  L10_10 = "LinkshellIconListWidget"
  L8_8(L9_9, L10_10, false)
end
function LinkshellSelectIconWidget.processUICommandOperate(A0_11, A1_12, A2_13, A3_14, A4_15)
  local L5_16
  L5_16 = A2_13
  if L5_16 == "Button_Next" then
  elseif L5_16 == "Button_Back" then
  else
  end
  if L5_16 == "Button_Quit" then
    A0_11:setBaseAskResult(A3_14)
    break
  else
  end
  A0_11.work.selectBaseID = A3_14
  A0_11:getChildWidgetByWindowName("LinkshellIconListWidget"):setIconBaseID(A0_11.work.selectBaseID)
  A0_11:getChildWidgetByWindowName("LinkshellIconListWidget"):show()
  break
end
function LinkshellSelectIconWidget.processUICommandCancel(A0_17, A1_18, A2_19, A3_20, A4_21)
  A0_17:setKeyboardFocusedControl("Button_Back")
end
function LinkshellSelectIconWidget.getAskResult(A0_22)
  local L1_23, L2_24
  L2_24 = A0_22
  L1_23 = A0_22.getIconID
  L1_23 = L1_23(L2_24, A0_22.work.iconBaseID, A0_22.work.iconColor)
  L2_24 = L1_23 - 40001
  L1_23 = L2_24 + 1
  L2_24 = A0_22.getBaseAskResult
  L2_24 = L2_24(A0_22)
  if A0_22.work.oldIconID >= 0 and A0_22.work.oldIconID == L1_23 then
    L2_24 = 2
  end
  return L2_24, L1_23
end
function LinkshellSelectIconWidget.setIconColor(A0_25, A1_26)
  A0_25:setSelectedIcon(A0_25.work.selectBaseID, A1_26)
end
function LinkshellSelectIconWidget.getIconID(A0_27, A1_28, A2_29)
  return desktopWidget:getLinkshellBaseIconID(A1_28) + A2_29 - 1
end
function LinkshellSelectIconWidget.setSelectedIcon(A0_30, A1_31, A2_32)
  local L3_33
  L3_33 = A0_30.work
  L3_33.iconBaseID = A1_31
  L3_33 = A0_30.work
  L3_33.iconColor = A2_32
  L3_33 = A0_30.getIconID
  L3_33 = L3_33(A0_30, A1_31, A2_32)
  A0_30:setIcon("IconControl_SampleEmblem", L3_33)
end
