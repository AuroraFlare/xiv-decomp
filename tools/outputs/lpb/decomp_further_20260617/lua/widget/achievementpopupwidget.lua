require("/Widget/WidgetBaseClass")
_defineClass("AchievementPopupWidget", "WidgetBaseClass")
function AchievementPopupWidget.init(A0_0)
  A0_0.work._temp = {
    {"unlockFlag", "boolean"}
  }
  A0_0:setUICommandCondition("UIFormCommands.TimerFinish")
  A0_0:setProperty("StringData.Value0", "5")
  A0_0:setDrawPriority(0.2)
end
function AchievementPopupWidget.processUICommandEvent(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  if A3_4 == "UIFormCommands.TimerFinish" then
    A0_1:hide()
  end
end
function AchievementPopupWidget.setAchivement(A0_7, A1_8, A2_9)
  A0_7.work.unlockFlag = A2_9
  A0_7:loadSpreadSheetDataAsync(achievementSheet, A1_8, A1_8)
end
function AchievementPopupWidget.processSpreadSheetDataAsync(A0_10, A1_11, A2_12, A3_13)
  local L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
  L4_14 = worldMaster
  L5_15 = L4_14
  L4_14 = L4_14._getMyPlayer
  L4_14 = L4_14(L5_15)
  L6_16 = A1_11
  L5_15 = A1_11._getData
  L7_17 = A2_12
  L8_18 = 4
  L5_15 = L5_15(L6_16, L7_17, L8_18)
  L7_17 = A0_10
  L6_16 = A0_10.setListProperty
  L8_18 = "Achievement_Maker"
  L9_19 = 0
  L10_20 = "icon"
  L6_16(L7_17, L8_18, L9_19, L10_20, L5_15)
  L6_16 = A0_10.work
  L6_16 = L6_16.unlockFlag
  if L6_16 == false then
    L7_17 = A0_10
    L6_16 = A0_10.setListText
    L8_18 = "Achievement_Maker"
    L9_19 = 0
    L10_20 = "name"
    L6_16(L7_17, L8_18, L9_19, L10_20, 12015, A2_12)
    L7_17 = A1_11
    L6_16 = A1_11._getData
    L8_18 = A2_12
    L9_19 = 2
    L6_16 = L6_16(L7_17, L8_18, L9_19)
    if L6_16 > 0 then
      L7_17 = _math
      L7_17 = L7_17.floor
      L8_18 = L6_16 / 10
      L7_17 = L7_17(L8_18)
      L8_18 = L7_17 * 10
      L8_18 = L6_16 - L8_18
      L10_20 = A0_10
      L9_19 = A0_10.setListProperty
      L9_19(L10_20, "Achievement_Maker", 0, "point1", 813 + L8_18)
      if L7_17 == 0 then
        L10_20 = A0_10
        L9_19 = A0_10.setListProperty
        L9_19(L10_20, "Achievement_Maker", 0, "point10v", false)
      else
        L10_20 = A0_10
        L9_19 = A0_10.setListProperty
        L9_19(L10_20, "Achievement_Maker", 0, "point10", 813 + L7_17)
        L10_20 = A0_10
        L9_19 = A0_10.setListProperty
        L9_19(L10_20, "Achievement_Maker", 0, "point10v", true)
      end
      L10_20 = A0_10
      L9_19 = A0_10.setListProperty
      L9_19(L10_20, "Achievement_Maker", 0, "point", true)
    else
      L8_18 = A0_10
      L7_17 = A0_10.setListProperty
      L9_19 = "Achievement_Maker"
      L10_20 = 0
      L7_17(L8_18, L9_19, L10_20, "point", false)
    end
    L8_18 = A1_11
    L7_17 = A1_11._getData
    L9_19 = A2_12
    L10_20 = 3
    L7_17 = L7_17(L8_18, L9_19, L10_20)
    L9_19 = A1_11
    L8_18 = A1_11._getData
    L10_20 = A2_12
    L8_18 = L8_18(L9_19, L10_20, 5)
    L9_19 = true
    L10_20 = 0
    if L8_18 ~= 0 then
      A0_10:setListText("Achievement_Maker", 0, "reward", 12013, L8_18)
    elseif L7_17 ~= 0 then
      if L4_14:isFemale() == true then
        L10_20 = 1
      end
      A0_10:setListText("Achievement_Maker", 0, "reward", 12012, L7_17, L10_20)
    else
      L9_19 = false
    end
    if L9_19 == true then
      A0_10:setListProperty("Achievement_Maker", 0, "style", "BOD_achievement_reward")
    else
      A0_10:setListProperty("Achievement_Maker", 0, "style", "BOD_achievement_normal")
    end
    A0_10:setListProperty("Achievement_Maker", 0, "rewardvisible", L9_19)
  else
    L7_17 = A0_10
    L6_16 = A0_10.setListText
    L8_18 = "Achievement_Maker"
    L9_19 = 0
    L10_20 = "name"
    L6_16(L7_17, L8_18, L9_19, L10_20, 12020, A2_12)
    L7_17 = A0_10
    L6_16 = A0_10.setListProperty
    L8_18 = "Achievement_Maker"
    L9_19 = 0
    L10_20 = "style"
    L6_16(L7_17, L8_18, L9_19, L10_20, "BOD_achievement_normal")
    L7_17 = A0_10
    L6_16 = A0_10.setListProperty
    L8_18 = "Achievement_Maker"
    L9_19 = 0
    L10_20 = "point"
    L6_16(L7_17, L8_18, L9_19, L10_20, false)
    L7_17 = A0_10
    L6_16 = A0_10.setListProperty
    L8_18 = "Achievement_Maker"
    L9_19 = 0
    L10_20 = "rewardvisible"
    L6_16(L7_17, L8_18, L9_19, L10_20, false)
  end
  L7_17 = A0_10
  L6_16 = A0_10.updateListProperty
  L8_18 = "Achievement_Maker"
  L6_16(L7_17, L8_18)
  L7_17 = A0_10
  L6_16 = A0_10.sendCommand
  L8_18 = "UIFormCommands.TimerStart"
  L6_16(L7_17, L8_18)
  L7_17 = A0_10
  L6_16 = A0_10.show
  L6_16(L7_17)
end
