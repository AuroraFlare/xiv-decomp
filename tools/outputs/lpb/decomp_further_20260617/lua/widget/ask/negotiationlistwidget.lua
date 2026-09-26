require("/Widget/Ask/AskBaseClass")
_defineClass("NegotiationListWidget", "AskBaseClass")
function NegotiationListWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10, A11_11)
  A0_0.work._temp = {}
  A0_0:setText("TextBlock_Question", 7104)
  if A2_2 == true then
    A0_0:setText("Button_Answer_1:TextBlock_Answer", 7101, A1_1)
    A0_0:setConfirmCondition("Button_Answer_1")
  else
    A0_0:setVisibility("Button_Answer_1", false)
  end
  if A3_3 == true then
    A0_0:setText("Button_Answer_2:TextBlock_Answer", 7101, A1_1 + 1)
    A0_0:setConfirmCondition("Button_Answer_2")
  else
    A0_0:setVisibility("Button_Answer_2", false)
  end
  if A4_4 == true then
    A0_0:setText("Button_Answer_3:TextBlock_Answer", 7101, A1_1 + 2)
    A0_0:setConfirmCondition("Button_Answer_3")
  else
    A0_0:setVisibility("Button_Answer_3", false)
  end
  if A5_5 == true then
    A0_0:setText("Button_Answer_4:TextBlock_Answer", 7101, A1_1 + 3)
    A0_0:setConfirmCondition("Button_Answer_4")
  else
    A0_0:setVisibility("Button_Answer_4", false)
  end
  if A6_6 == true then
    A0_0:setText("Button_Answer_5:TextBlock_Answer", 7101, A1_1 + 4)
    A0_0:setConfirmCondition("Button_Answer_5")
  else
    A0_0:setVisibility("Button_Answer_5", false)
  end
  if A7_7 == true then
    A0_0:setText("Button_Answer_6:TextBlock_Answer", 7101, A1_1 + 5)
    A0_0:setConfirmCondition("Button_Answer_6")
  else
    A0_0:setVisibility("Button_Answer_6", false)
  end
  if A8_8 == true then
    A0_0:setText("Button_Answer_7:TextBlock_Answer", 7101, A1_1 + 6)
    A0_0:setConfirmCondition("Button_Answer_7")
  else
    A0_0:setVisibility("Button_Answer_7", false)
  end
  if A9_9 == true then
    A0_0:setText("Button_Answer_8:TextBlock_Answer", 7101, A1_1 + 7)
    A0_0:setConfirmCondition("Button_Answer_8")
  else
    A0_0:setVisibility("Button_Answer_8", false)
  end
  if A10_10 == true then
    A0_0:setText("Button_Answer_9:TextBlock_Answer", 7101, A1_1 + 8)
    A0_0:setConfirmCondition("Button_Answer_9")
  else
    A0_0:setVisibility("Button_Answer_9", false)
  end
  if A11_11 == true then
    A0_0:setText("Button_Answer_10:TextBlock_Answer", 7101, A1_1 + 9)
    A0_0:setConfirmCondition("Button_Answer_10")
  else
    A0_0:setVisibility("Button_Answer_10", false)
  end
  A0_0:setCancelCondition()
end
function NegotiationListWidget.processUICommandOperate(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17
  L5_17 = A2_14
  if L5_17 == "Button_Answer_1" then
    A0_12:setBaseAskResult(1)
    break
  else
  end
  if L5_17 == "Button_Answer_2" then
    A0_12:setBaseAskResult(2)
    break
  else
  end
  if L5_17 == "Button_Answer_3" then
    A0_12:setBaseAskResult(3)
    break
  else
  end
  if L5_17 == "Button_Answer_4" then
    A0_12:setBaseAskResult(4)
    break
  else
  end
  if L5_17 == "Button_Answer_5" then
    A0_12:setBaseAskResult(5)
    break
  else
  end
  if L5_17 == "Button_Answer_6" then
    A0_12:setBaseAskResult(6)
    break
  else
  end
  if L5_17 == "Button_Answer_7" then
    A0_12:setBaseAskResult(7)
    break
  else
  end
  if L5_17 == "Button_Answer_8" then
    A0_12:setBaseAskResult(8)
    break
  else
  end
  if L5_17 == "Button_Answer_9" then
    A0_12:setBaseAskResult(9)
    break
  else
  end
  if L5_17 == "Button_Answer_10" then
    A0_12:setBaseAskResult(10)
    do break end
    break
  else
  end
end
function NegotiationListWidget.processUICommandCancel(A0_18, A1_19, A2_20, A3_21, A4_22)
  A0_18:setBaseAskResult(-1)
end
