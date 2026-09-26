require("/Widget/WidgetBaseClass")
_defineClass("AchievementTitleListWidget", "WidgetBaseClass")
function AchievementTitleListWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L1_1 = A0_0.work
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6
  }
  L3_3 = {L4_4, L5_5}
  L4_4 = "enableAchievementTitleCount"
  L5_5 = "integer16"
  L4_4 = {L5_5, L6_6}
  L5_5 = "currentAchievementTitle"
  L5_5 = {L6_6, L7_7}
  L1_1._temp = L2_2
  L1_1 = worldMaster
  L2_2 = L1_1
  L1_1 = L1_1._getMyPlayer
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.getTribe
  L2_2 = L2_2(L3_3)
  L3_3 = 0
  L4_4 = L2_2
  if L4_4 == 2 then
  elseif L4_4 == 5 then
  elseif L4_4 == 7 then
  elseif L4_4 == 9 then
  elseif L4_4 == 11 then
  elseif L4_4 == 12 then
  else
  end
  if L4_4 == 13 then
    L3_3 = 1
    break
  else
  end
  L4_4 = A0_0.work
  L5_5 = L1_1._countEnableAchievementTitle
  L5_5 = L5_5(L6_6)
  L4_4.enableAchievementTitleCount = L5_5
  L4_4 = A0_0.work
  L5_5 = L1_1._getAchievementTitle
  L5_5 = L5_5(L6_6)
  L4_4.currentAchievementTitle = L5_5
  L4_4 = A0_0.work
  L5_5 = A0_0.work
  L5_5 = L5_5.currentAchievementTitle
  L4_4.focusedAchievementTitle = L5_5
  L4_4 = A0_0.work
  L4_4.focusedIndex = 0
  L4_4 = ""
  L5_5 = 0
  for L9_9 = 0, L7_7.enableAchievementTitleCount do
    L4_4 = "Item_AchievementTitleSelect" .. tostring(L9_9)
    A0_0:_addItem(nil, "ListBox_Achievement", "ControlTemplate_Achievement", L4_4)
    A0_0:setControlProperty(L4_4, "IsTabStop", false)
    if L9_9 > 0 then
      L5_5 = L1_1:_getEnableAchievementTitle(L9_9)
      if L5_5 == A0_0.work.currentAchievementTitle then
        A0_0.work.focusedIndex = L9_9
      end
      A0_0:setText(L4_4 .. ":" .. "TextBlock_Achievement", 12035, L5_5, L3_3)
    else
      A0_0:setText(L4_4 .. ":" .. "TextBlock_Achievement", 12031)
    end
  end
  L6_6(L7_7)
  L6_6(L7_7, L8_8)
  L9_9 = "UILuaCommands.Selection"
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = "UILuaCommands.EnterSelectorMouseFocus"
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = "UILuaCommands.EnterSelectorKeyboardFocus"
  L6_6(L7_7, L8_8, L9_9)
  L6_6(L7_7)
  L6_6(L7_7, L8_8)
end
function AchievementTitleListWidget.processUICommandSelection(A0_10, A1_11, A2_12, A3_13, A4_14)
  local L5_15, L6_16, L7_17
  L5_15 = A3_13
  L6_16 = worldMaster
  L7_17 = L6_16
  L6_16 = L6_16._getMyPlayer
  L6_16 = L6_16(L7_17)
  L7_17 = 0
  if A2_12 == "ListBox_Achievement" and L5_15 ~= nil then
    if L5_15 > 0 then
      L7_17 = L6_16:_getEnableAchievementTitle(L5_15)
      L6_16:_setAchievementTitle(L7_17)
    else
      L6_16:_setAchievementTitle(0)
    end
    desktopWidget:closeWidgetDirect(A0_10)
    do break end
    break
  else
  end
end
function AchievementTitleListWidget.processUICommandCancel(A0_18, A1_19, A2_20, A3_21, A4_22)
  if A0_18:_getParentWidget() ~= nil then
    A0_18:_getParentWidget():previewAchievementTitle(A0_18.work.currentAchievementTitle)
  end
  desktopWidget:closeWidgetDirect(A0_18)
end
function AchievementTitleListWidget.processUICommandEnterSelectorFocus(A0_23, A1_24, A2_25, A3_26)
  A0_23.work.focusedIndex = A3_26
  if A0_23.work.focusedIndex > 0 then
    A0_23.work.focusedAchievementTitle = worldMaster:_getMyPlayer():_getEnableAchievementTitle(A0_23.work.focusedIndex)
  else
    A0_23.work.focusedAchievementTitle = 0
  end
  if A0_23:_getParentWidget() ~= nil then
    A0_23:_getParentWidget():previewAchievementTitle(A0_23.work.focusedAchievementTitle)
  end
end
function AchievementTitleListWidget.processAfterShow(A0_27, A1_28)
  if A0_27:_getParentWidget() ~= nil then
    A0_27:_getParentWidget():previewAchievementTitle(0)
  end
  return true
end
function AchievementTitleListWidget.setListItemVisibility(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37
  L1_30 = worldMaster
  L2_31 = L1_30
  L1_30 = L1_30._getMyPlayer
  L1_30 = L1_30(L2_31)
  L2_31 = ""
  L3_32 = 0
  L4_33 = false
  for L8_37 = 0, L6_35.enableAchievementTitleCount do
    L2_31 = "Item_AchievementTitleSelect" .. tostring(L8_37)
    if L8_37 > 0 then
      L3_32 = L1_30:_getEnableAchievementTitle(L8_37)
    else
      L3_32 = 0
    end
    if L3_32 == A0_29.work.currentAchievementTitle then
      L4_33 = true
    else
      L4_33 = false
    end
    A0_29:setItemVisibility(L2_31, "Border_AchievementSelected", L4_33)
    A0_29:setItemVisibility(L2_31, "IconControl_AchievementSelected", L4_33)
  end
end
