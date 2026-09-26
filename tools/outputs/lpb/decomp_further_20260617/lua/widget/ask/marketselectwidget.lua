require("/Widget/Ask/AskBaseClass")
_defineClass("MarketSelectWidget", "AskBaseClass")
function MarketSelectWidget.initAsk(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "askDefaultAnswer"
  L5_5 = "integer8"
  L4_4 = {L5_5, "integer8"}
  L5_5 = "askAnswerMax"
  L5_5 = {"canCancel", "boolean"}
  L1_1._temp = L2_2
  L1_1(L2_2)
  L1_1(L2_2)
  for L4_4 = 1, 24 do
    L5_5 = "Button_Answer_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:setConfirmCondition(L5_5)
  end
end
function MarketSelectWidget.processAfterShow(A0_6, A1_7)
  local L2_8
  L2_8 = "Button_Answer_"
  L2_8 = L2_8 .. tostring(A0_6.work.askDefaultAnswer)
  A0_6:setKeyboardFocusedControl(L2_8)
  if A0_6.work.canCancel == false then
    A0_6:setVisibility("Button_Close", false)
  end
  return true
end
function MarketSelectWidget.ask(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14, A6_15, ...)
  local L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23, L15_24, L16_25, L17_26
  L9_18 = A0_9
  L8_17 = A0_9.initialWidget
  L8_17(L9_18)
  L8_17 = A0_9.work
  L9_18 = #A6_15
  L8_17.askAnswerMax = L9_18
  L8_17 = A0_9.work
  L8_17.canCancel = A4_13
  L8_17 = #A6_15
  L9_18 = select
  L10_19 = "#"
  L17_26 = ...
  L9_18 = L9_18(L10_19, L11_20, L12_21, L13_22, L14_23, L15_24, L16_25, L17_26, ...)
  L10_19 = L9_18 - L8_17
  if L10_19 < 0 then
    L10_19 = 0
  end
  if A2_11 == nil then
    L14_23 = A5_14
    L11_20(L12_21, L13_22, L14_23)
    for L14_23 = 1, L12_21.askAnswerMax do
      L15_24 = select
      L16_25 = L10_19 + L14_23
      L17_26 = ...
      L15_24 = L15_24(L16_25, L17_26, ...)
      L17_26 = A0_9
      L16_25 = A0_9.packTextParameter
      L16_25 = L16_25(L17_26, A6_15[L14_23], L15_24)
      L17_26 = "Button_Answer_"
      L17_26 = L17_26 .. tostring(L14_23)
      A0_9:setContent(L17_26, L16_25)
      A0_9:setVisibility(L17_26, true)
    end
  else
    L14_23 = A2_11
    L15_24 = A5_14
    L17_26 = ...
    L11_20(L12_21, L13_22, L14_23, L15_24, L16_25, L17_26, ...)
    for L14_23 = 1, L12_21.askAnswerMax do
      L15_24 = "Button_Answer_"
      L16_25 = tostring
      L17_26 = L14_23
      L16_25 = L16_25(L17_26)
      L15_24 = L15_24 .. L16_25
      L17_26 = A0_9
      L16_25 = A0_9._setProperty
      L16_25(L17_26, nil, L15_24, "Content", A2_11, A6_15[L14_23], select(L10_19 + L14_23, ...))
      L17_26 = A0_9
      L16_25 = A0_9.setVisibility
      L16_25(L17_26, L15_24, true)
    end
  end
  L11_20.askDefaultAnswer = A3_12
end
function MarketSelectWidget.processUICommandEvent(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32)
  local L6_33, L7_34, L8_35, L9_36, L10_37
  L6_33 = A3_30
  if L6_33 == "UILuaCommands.Operate" then
    for L10_37 = 1, L8_35.askAnswerMax do
      if A2_29 == "Button_Answer_" .. tostring(L10_37) then
        A0_27:setBaseAskResult(L10_37)
      end
    end
    break
  elseif L6_33 == "UILuaCommands.Cancel" then
  else
  end
  if L6_33 == "UILuaCommands.WidgetClose" then
    if L7_34 == true then
      L7_34(L8_35, L9_36)
      break
    else
    end
  else
  end
end
function MarketSelectWidget.initialWidget(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43
  L1_39(L2_40)
  L1_39.askAnswerMax = 0
  L1_39.askDefaultAnswer = 1
  L1_39.canCancel = false
  L4_42 = ""
  L1_39(L2_40, L3_41, L4_42)
  for L4_42 = 1, 24 do
    L5_43 = "Button_Answer_"
    L5_43 = L5_43 .. tostring(L4_42)
    A0_38:setContent(L5_43, "")
    A0_38:setVisibility(L5_43, false)
  end
end
