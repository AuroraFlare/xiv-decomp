require("/Widget/Ask/AskBaseClass")
_defineClass("HamletDefenseScoreWidget", "AskBaseClass")
function HamletDefenseScoreWidget.initAsk(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L2_2 = A0_0.setCancelCondition
  L2_2(L3_3)
  L2_2 = A0_0.setConfirmCondition
  L2_2(L3_3, L4_4)
  L2_2 = worldMaster
  L2_2 = L2_2._getMyPlayer
  L2_2 = L2_2(L3_3)
  for L6_6 = 1, L4_4(L5_5) do
    L7_7 = L6_6 - 1
    L9_9 = L2_2
    L8_8 = L2_2._getHamletDefenseScore
    L10_10 = L6_6
    L10_10 = L8_8(L9_9, L10_10)
    A0_0:setListText("DataMaker_ListBox", L7_7, "bonus", 13019, L9_9, L10_10)
    A0_0:setListProperty("DataMaker_ListBox", L7_7, "point", L8_8)
  end
  L3_3(L4_4, L5_5)
  if A1_1 == nil then
    A1_1 = 9
  end
  L6_6, L7_7 = nil, nil
  L9_9 = L2_2
  L8_8 = L2_2._getHamletDefenseScoreAll
  L6_6, L7_7, L8_8 = A0_0.setListProperty, A0_0, L8_8(L9_9)
  L6_6, L7_7, L9_9 = A0_0.setListProperty, A0_0, L8_8(L9_9)
  L6_6, L7_7, L10_10 = A0_0.setListProperty, A0_0, L8_8(L9_9)
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_ContentsTitle"
  L8_8(L9_9, L10_10, 13012, A1_1, L3_3)
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_PointTotalValue"
  L8_8(L9_9, L10_10, 225, L4_4)
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_CorrectionLevelValue"
  L8_8(L9_9, L10_10, 3189, L3_3)
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_PointAfterCorrectionValue"
  L8_8(L9_9, L10_10, 225, L5_5)
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_ClearTimeValue"
  L8_8(L9_9, L10_10, 225, L6_6)
  L9_9 = A0_0
  L8_8 = A0_0.setText
  L10_10 = "TextBlock_TotalPointsValue"
  L8_8(L9_9, L10_10, 225, L7_7)
  L9_9 = A0_0
  L8_8 = A0_0.setContent
  L10_10 = "Label_TotalPointsValue"
  L8_8(L9_9, L10_10, 225, L7_7)
end
function HamletDefenseScoreWidget.processUICommandOperate(A0_11, A1_12, A2_13, A3_14, A4_15)
  A0_11:setBaseAskResult(1)
end
