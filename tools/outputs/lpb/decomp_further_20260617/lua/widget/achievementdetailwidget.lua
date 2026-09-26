require("/Widget/WidgetBaseClass")
_defineClass("AchievementDetailWidget", "WidgetBaseClass")
function AchievementDetailWidget.init(A0_0)
  A0_0.work._temp = {
    {
      "achievementID",
      "integer32"
    },
    {"iconID", "integer32"},
    {"listID", "integer32"},
    {"reward", "integer32"},
    {"numerator", "integer32"},
    {
      "denominator",
      "integer32"
    },
    {"listCount", "integer32"}
  }
  A0_0.work.achievementID = 0
  A0_0.work.iconID = 0
  A0_0.work.listID = 0
  A0_0.work.reward = 0
  A0_0.work.numerator = 0
  A0_0.work.denominator = 0
  A0_0.work.listCount = 0
  A0_0:setModal(true)
  A0_0:setConfirmCondition("Button_Close")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setUICommandCondition("UILuaCommands.Shown")
end
function AchievementDetailWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  if A0_1:_getParentWidget() ~= nil then
  end
  if A2_3 == "Button_Close" then
    A0_1:hide()
    do break end
    break
  else
  end
end
function AchievementDetailWidget.processUICommandCancel(A0_6, A1_7, A2_8, A3_9, A4_10)
  if A0_6:_getParentWidget() ~= nil then
  end
  A0_6:hide()
end
function AchievementDetailWidget.setAchievementRate(A0_11, A1_12, A2_13)
  A0_11:setAchievementDetail(A0_11.work.achievementID, A0_11.work.iconID, A0_11.work.listID, A0_11.work.reward, A1_12, A2_13)
end
function AchievementDetailWidget.setAchievementDetail(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19, A6_20)
  local L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27
  L7_21 = A0_14.work
  L7_21.achievementID = A1_15
  L7_21 = A0_14.work
  L7_21.iconID = A2_16
  L7_21 = A0_14.work
  L7_21.listID = A3_17
  L7_21 = A0_14.work
  L7_21.reward = A4_18
  L7_21 = A0_14.work
  L7_21.numerator = A5_19
  L7_21 = A0_14.work
  L7_21.denominator = A6_20
  L7_21 = A0_14.work
  L7_21.listCount = L8_22
  L7_21 = A0_14.work
  L7_21 = L7_21.listCount
  if L7_21 <= 0 then
    L7_21 = A0_14.hide
    L7_21(L8_22)
    return
  end
  L7_21 = A0_14.setText
  L7_21(L8_22, L9_23, L10_24, L11_25)
  L7_21 = A0_14.setIcon
  L7_21(L8_22, L9_23, L10_24)
  L7_21 = A0_14.work
  L7_21 = L7_21.reward
  if L7_21 == 0 then
    L7_21 = A0_14.setStyle
    L7_21(L8_22, L9_23, L10_24)
  else
    L7_21 = A0_14.setStyle
    L7_21(L8_22, L9_23, L10_24)
  end
  L7_21 = _math
  L7_21 = L7_21.floor
  L7_21 = L7_21(L8_22)
  L8_22(L9_23, L10_24, L11_25)
  L13_27 = A0_14.work
  L13_27 = L13_27.denominator
  L8_22(L9_23, L10_24, L11_25, L12_26, L13_27, L7_21)
  L8_22(L9_23, L10_24, L11_25)
  for L11_25 = 1, 25 do
    L13_27 = A0_14
    L12_26(L13_27, "Label_Step_" .. tostring(L11_25), false)
    L13_27 = A0_14
    L12_26(L13_27, "Label_Step_" .. tostring(L11_25) .. ":" .. "IconControl_StepClear", false)
  end
  for L13_27 = 1, L11_25.listCount do
    A0_14:setVisibility(L9_23, true)
    if worldMaster:_getMyPlayer():_isDoneAchievementRateList(A0_14.work.achievementID, L13_27) then
      A0_14:setVisibility(L9_23 .. ":" .. "IconControl_StepClear", true)
    else
      A0_14:setHidden(L9_23 .. ":" .. "IconControl_StepClear")
    end
    A0_14:setText(L9_23 .. ":" .. "TextBlock_Step", worldMaster:_getMyPlayer():_getAchievementRateList(A0_14.work.achievementID, L13_27))
  end
  if L7_21 <= 0 and L8_22 > 0 then
    L10_24.numerator = L8_22
    L10_24.denominator = L11_25
    L13_27 = "ProgressBar_Progress"
    L11_25(L12_26, L13_27, L10_24)
    L13_27 = "TextBlock_Progress"
    L11_25(L12_26, L13_27, 12014, A0_14.work.numerator, A0_14.work.denominator, L10_24)
    L13_27 = "Button_Close"
    L11_25(L12_26, L13_27, 12018)
  end
end
