require("/Widget/Ask/AskBaseClass")
_defineClass("QuestAskWidget", "AskBaseClass")
function QuestAskWidget.initAsk(A0_0, A1_1)
  local L2_2, L3_3
  L2_2 = A0_0.work
  L3_3 = {}
  L2_2._temp = L3_3
  L3_3 = A0_0
  L2_2 = A0_0.setConfirmCondition
  L2_2(L3_3, "Button_Approval")
  L3_3 = A0_0
  L2_2 = A0_0.setConfirmCondition
  L2_2(L3_3, "Button_Refusal")
  L3_3 = A0_0
  L2_2 = A0_0.setText
  L2_2(L3_3, "TextBlock_QuestTitle", 5001, A1_1)
  L3_3 = A0_0
  L2_2 = A0_0.setText
  L2_2(L3_3, "TextBlock_ScenarioTitle", 4028, A0_0:getQuestCategory(A1_1))
  L3_3 = A0_0
  L2_2 = A0_0.setText
  L2_2(L3_3, "TextBlock_SkillRank", 5302, A1_1)
  L3_3 = A0_0
  L2_2 = A0_0.setText
  L2_2(L3_3, "TextBlock_Client", 5301, A1_1)
  L3_3 = A0_0
  L2_2 = A0_0.setVisibility
  L2_2(L3_3, "TextBlock_Reward", false)
  L3_3 = A0_0
  L2_2 = A0_0.setVisibility
  L2_2(L3_3, "TextBlock_RewardTitle", false)
  L3_3 = A0_0
  L2_2 = A0_0.setVisibility
  L2_2(L3_3, "Border_RewardBg", false)
  L3_3 = A0_0
  L2_2 = A0_0.setVisibility
  L2_2(L3_3, "Border_RewardIcon", false)
  L2_2 = desktopWidget
  L3_3 = L2_2
  L2_2 = L2_2.getQuestIconID
  L3_3 = L2_2(L3_3, A1_1)
  A0_0:setIcon("IconControl_QuestTitle", L2_2)
  A0_0:setHelpParameter("IconControl_QuestTitle", 1, L3_3)
  A0_0:setCancelCondition()
end
function QuestAskWidget.processUICommandOperate(A0_4, A1_5, A2_6, A3_7, A4_8)
  if A2_6 == "Button_Approval" then
    A0_4:setBaseAskResult(1)
  elseif A2_6 == "Button_Refusal" then
    A0_4:setBaseAskResult(2)
  end
end
function QuestAskWidget.processUICommandCancel(A0_9, A1_10, A2_11, A3_12, A4_13)
  A0_9:setBaseAskResult(2)
end
function QuestAskWidget.getQuestAskIconID(A0_14, A1_15)
  local L2_16
  if A1_15 >= 110001 and A1_15 <= 110059 then
    L2_16 = 295
    return L2_16
  end
  if A1_15 >= 110080 and A1_15 <= 110099 then
    L2_16 = 203
    return L2_16
  end
  if A1_15 >= 110060 and A1_15 <= 110079 then
    L2_16 = 206
    return L2_16
  end
  if A1_15 >= 110100 and A1_15 <= 110119 then
    L2_16 = 204
    return L2_16
  end
  if A1_15 >= 110180 and A1_15 <= 110199 then
    L2_16 = 205
    return L2_16
  end
  if A1_15 >= 110160 and A1_15 <= 110179 then
    L2_16 = 207
    return L2_16
  end
  if A1_15 >= 110260 and A1_15 <= 110279 then
    L2_16 = 234
    return L2_16
  end
  if A1_15 >= 110240 and A1_15 <= 110259 then
    L2_16 = 233
    return L2_16
  end
  if A1_15 >= 110300 and A1_15 <= 110319 then
    L2_16 = 212
    return L2_16
  end
  if A1_15 >= 110320 and A1_15 <= 110339 then
    L2_16 = 209
    return L2_16
  end
  if A1_15 >= 110360 and A1_15 <= 110379 then
    L2_16 = 213
    return L2_16
  end
  if A1_15 >= 110380 and A1_15 <= 110399 then
    L2_16 = 211
    return L2_16
  end
  if A1_15 >= 110400 and A1_15 <= 110419 then
    L2_16 = 210
    return L2_16
  end
  if A1_15 >= 110420 and A1_15 <= 110439 then
    L2_16 = 215
    return L2_16
  end
  if A1_15 >= 110440 and A1_15 <= 110459 then
    L2_16 = 214
    return L2_16
  end
  if A1_15 >= 110460 and A1_15 <= 110479 then
    L2_16 = 217
    return L2_16
  end
  if A1_15 >= 110480 and A1_15 <= 110499 then
    L2_16 = 218
    return L2_16
  end
  if A1_15 >= 110500 and A1_15 <= 110519 then
    L2_16 = 219
    return L2_16
  end
  L2_16 = 295
  return L2_16
end
function QuestAskWidget.getQuestCategory(A0_17, A1_18)
  local L2_19
  if A1_18 < 110060 then
    L2_19 = 5
    return L2_19
  elseif A1_18 < 110080 then
    L2_19 = 6
    return L2_19
  elseif A1_18 < 110100 then
    L2_19 = 7
    return L2_19
  elseif A1_18 < 110120 then
    L2_19 = 8
    return L2_19
  elseif A1_18 < 110140 then
  elseif A1_18 < 110160 then
  elseif A1_18 < 110180 then
    L2_19 = 9
    return L2_19
  elseif A1_18 < 110200 then
    L2_19 = 10
    return L2_19
  elseif A1_18 < 110220 then
  elseif A1_18 < 110240 then
  elseif A1_18 < 110260 then
    L2_19 = 11
    return L2_19
  elseif A1_18 < 110280 then
    L2_19 = 12
    return L2_19
  elseif A1_18 < 110300 then
  elseif A1_18 < 110320 then
    L2_19 = 13
    return L2_19
  elseif A1_18 < 110340 then
    L2_19 = 14
    return L2_19
  elseif A1_18 < 110360 then
    L2_19 = 15
    return L2_19
  elseif A1_18 < 110380 then
    L2_19 = 16
    return L2_19
  elseif A1_18 < 110400 then
    L2_19 = 17
    return L2_19
  elseif A1_18 < 110420 then
    L2_19 = 18
    return L2_19
  elseif A1_18 < 110440 then
    L2_19 = 19
    return L2_19
  elseif A1_18 < 110460 then
    L2_19 = 20
    return L2_19
  elseif A1_18 < 110480 then
    L2_19 = 21
    return L2_19
  elseif A1_18 < 110500 then
    L2_19 = 22
    return L2_19
  elseif A1_18 < 110520 then
    L2_19 = 23
    return L2_19
  end
  L2_19 = 5
  return L2_19
end
