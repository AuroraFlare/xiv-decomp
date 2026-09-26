require("/Widget/Ask/AskBaseClass")
_defineClass("GrandCompanyOfficialJoinWidget", "AskBaseClass")
function GrandCompanyOfficialJoinWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "RetainerDismissalWidget"
  return L1_1
end
function GrandCompanyOfficialJoinWidget.initAsk(A0_2, A1_3)
  local L2_4
  L2_4 = 1
  if A1_3 ~= nil then
    L2_4 = A1_3
  end
  A0_2:setText("TextBlock_Text", 8004, L2_4)
  A0_2:setText("TextBlock_DismissalAgree", 8005, L2_4)
  A0_2:setContent("Button_Yes", 8006)
  A0_2:setContent("Button_No", 8007)
  A0_2:setCommandParameter("Button_Yes", 1)
  A0_2:setConfirmCondition("Button_Yes")
  A0_2:setCommandParameter("Button_No", 2)
  A0_2:setConfirmCondition("Button_No")
  A0_2:setCancelCondition()
end
function GrandCompanyOfficialJoinWidget.processUICommandOperate(A0_5, A1_6, A2_7, A3_8, A4_9)
  A0_5:setBaseAskResult(A3_8)
end
function GrandCompanyOfficialJoinWidget.processUICommandCancel(A0_10, A1_11, A2_12, A3_13, A4_14)
  A0_10:setKeyboardFocusedControl("Button_No")
end
