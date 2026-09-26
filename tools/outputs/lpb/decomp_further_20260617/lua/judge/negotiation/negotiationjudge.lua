require("/Judge/JudgeBaseClass")
_defineClass("NegotiationJudge", "JudgeBaseClass")
function NegotiationJudge.openListWidget(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10, A11_11, A12_12, A13_13)
  local L14_14, L15_15
  L14_14 = false
  L15_15 = 0
  if A1_1:isPlayer() == true then
    L14_14, L15_15 = desktopWidget:askEventModeWidgetYield("Ask/NegotiationListWidget", 1, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10, A11_11, A12_12, A13_13)
    if L14_14 == false then
    end
  else
  end
  return L15_15
end
function NegotiationJudge.openAskWidget(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21, A6_22)
  local L7_23, L8_24
  L7_23 = false
  L8_24 = 0
  if A1_17:isPlayer() == true then
    L7_23, L8_24 = desktopWidget:askEventModeWidgetYield("Ask/NegotiationAskWidget", 1, A3_19, A4_20, A5_21, A6_22)
    if L7_23 == false then
    end
  else
  end
  return L8_24
end
function NegotiationJudge.openNegotiationWidget(A0_25, A1_26, A2_27, A3_28, A4_29, A5_30, A6_31, A7_32, A8_33, A9_34, A10_35, A11_36)
  local L12_37
  L12_37 = false
  if A1_26:isPlayer() == true then
    L12_37 = desktopWidget:openEventModeWidgetYield("Ask/NegotiationWidget", A3_28, A4_29, A5_30, A6_31, A7_32, A8_33, A9_34, A10_35, A11_36)
    if L12_37 == false then
    end
  else
  end
  return
end
function NegotiationJudge.inputNegotiationWidget(A0_38, A1_39, A2_40, A3_41, A4_42, A5_43)
  local L6_44, L7_45
  L6_44 = false
  L7_45 = 0
  if A1_39:isPlayer() == true then
    L6_44, L7_45 = desktopWidget:selectEventModeWidgetYield("Ask/NegotiationWidget", A3_41, A4_42, A5_43)
    if L6_44 == false then
    end
  else
  end
  return L7_45
end
function NegotiationJudge.updateNegotiationWidget(A0_46, A1_47, A2_48, A3_49, A4_50, A5_51, A6_52, A7_53, A8_54)
  local L9_55
  L9_55 = false
  if A1_47:isPlayer() == true then
    L9_55 = desktopWidget:updateEventModeWidget("Ask/NegotiationWidget", A3_49, A4_50, A5_51, A6_52, A7_53, A8_54)
    if L9_55 == false then
    end
  else
  end
  return
end
function NegotiationJudge.closeNegotiationWidget(A0_56, A1_57, A2_58)
  local L3_59
  L3_59 = false
  if A1_57:isPlayer() == true then
    L3_59 = desktopWidget:closeEventModeWidget("Ask/NegotiationWidget")
    if L3_59 == false then
    end
  else
  end
  return
end
function NegotiationJudge.negotiationEmote(A0_60, A1_61, A2_62, A3_63)
  A1_61:_runCharaScheduler(A3_63)
end
