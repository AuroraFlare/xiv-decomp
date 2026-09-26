require("/Widget/Ask/AskBaseClass")
_defineClass("LinkshellConfirmWidget", "AskBaseClass")
function LinkshellConfirmWidget.initAsk(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8
  L5_5 = A0_0
  L4_4 = A0_0.setConfirmCondition
  L6_6 = "Button_Making"
  L4_4(L5_5, L6_6)
  L5_5 = A0_0
  L4_4 = A0_0.setCommandParameter
  L6_6 = "Button_Making"
  L7_7 = 1
  L4_4(L5_5, L6_6, L7_7)
  L5_5 = A0_0
  L4_4 = A0_0.setConfirmCondition
  L6_6 = "Button_Back"
  L4_4(L5_5, L6_6)
  L5_5 = A0_0
  L4_4 = A0_0.setCommandParameter
  L6_6 = "Button_Back"
  L7_7 = 2
  L4_4(L5_5, L6_6, L7_7)
  L5_5 = A0_0
  L4_4 = A0_0.setCancelCondition
  L4_4(L5_5)
  L4_4, L5_5, L6_6, L7_7, L8_8 = nil, nil, nil, nil, nil
  if A1_1 == 1 then
    L4_4 = 1248
    L5_5 = 1245
    L6_6 = 1254
    L7_7 = 1251
    A0_0:setConfirmCondition("Button_Quit")
    A0_0:setCommandParameter("Button_Quit", -1)
    L8_8 = "Button_Making"
    A0_0:setHelpParameter("Button_Making", 1, 79241)
    A0_0:setHelpParameter("Button_Back", 1, 79243)
  else
    L4_4 = 1265
    L5_5 = 1234
    L6_6 = 1235
    L7_7 = 1236
    A0_0:setVisibility("Button_Quit", false)
    L8_8 = "Button_Back"
  end
  A0_0:setText("TextBlock_Title", L4_4)
  A0_0:setText("TextBlock_Help", L5_5)
  A0_0:setContent("Button_Making", L6_6)
  A0_0:setContent("Button_Back", L7_7)
  A0_0:setIcon("IconControl_Emblem", desktopWidget:getLinkshellIconID(A3_3))
  A0_0:setLogicalFocus(L8_8)
  A0_0:setVisibility("Grid_Introductory", false)
  A0_0:setText("TextBlock_LinkshellName", A2_2)
end
function LinkshellConfirmWidget.processUICommandOperate(A0_9, A1_10, A2_11, A3_12, A4_13)
  A0_9:setBaseAskResult(A3_12)
end
function LinkshellConfirmWidget.processUICommandCancel(A0_14, A1_15, A2_16, A3_17, A4_18)
  A0_14:setKeyboardFocusedControl("Button_Back")
end
