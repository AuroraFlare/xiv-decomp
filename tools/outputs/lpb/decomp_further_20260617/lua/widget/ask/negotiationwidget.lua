require("/Widget/Ask/AskBaseClass")
_defineClass("NegotiationWidget", "AskBaseClass")
function NegotiationWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9)
  local L10_10, L11_11, L12_12, L13_13, L14_14
  L10_10 = A0_0.work
  L14_14 = "integer16"
  L14_14 = "key2"
  L14_14 = {"key3", "integer16"}
  L10_10._temp = L11_11
  L10_10 = 0
  for L14_14 = 1, 12 do
    A0_0:setVisibility("Button_ItemIcon_" .. L14_14 .. ":IconControl_ItemIcon", false)
    A0_0:setVisibility("Button_ItemIcon_" .. L14_14 .. ":TextBlock_NumberOfTopics", false)
  end
  L14_14 = ""
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = false
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = false
  L11_11(L12_12, L13_13, L14_14)
  for L14_14 = 1, 6 do
    A0_0:setVisibility("Label_SelectedItem_" .. L14_14 .. ":IconControl_SelectedItemIcon", false)
  end
  L14_14 = false
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = false
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = false
  L11_11(L12_12, L13_13, L14_14)
  L11_11.ability1 = A5_5
  L11_11.ability2 = A6_6
  L11_11.ability3 = A7_7
  L11_11.ability4 = A8_8
  L11_11.ability5 = A9_9
  L11_11.select = 1
  for L14_14 = 1, 12 do
    A0_0:setEnable("Button_ItemIcon_" .. L14_14, false)
  end
  L14_14 = false
  L11_11(L12_12, L13_13, L14_14)
  L11_11.time = A4_4
  L14_14 = true
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = false
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = 7107
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = true
  L11_11(L12_12, L13_13, L14_14, A1_1, A2_2, A3_3)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L11_11(L12_12, L13_13)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L14_14 = "UILuaCommands.Hover"
  L11_11(L12_12, L13_13, L14_14)
  L11_11(L12_12, L13_13)
  L11_11(L12_12)
  L11_11(L12_12)
  L11_11(L12_12, L13_13)
end
function NegotiationWidget.processUICommandOperate(A0_15, A1_16, A2_17, A3_18, A4_19)
  local L5_20, L6_21, L7_22, L8_23
  L5_20 = 0
  L6_21 = 0
  L7_22 = 0
  L8_23 = A2_17
  if L8_23 == "Button_ItemIcon_1" then
    A0_15:playerSelect(1)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_2" then
    A0_15:playerSelect(2)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_3" then
    A0_15:playerSelect(3)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_4" then
    A0_15:playerSelect(4)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_5" then
    A0_15:playerSelect(5)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_6" then
    A0_15:playerSelect(6)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_7" then
    A0_15:playerSelect(7)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_8" then
    A0_15:playerSelect(8)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_9" then
    A0_15:playerSelect(9)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_10" then
    A0_15:playerSelect(10)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_11" then
    A0_15:playerSelect(11)
    break
  else
  end
  if L8_23 == "Button_ItemIcon_12" then
    A0_15:playerSelect(12)
    break
  else
  end
  if L8_23 == "Button_Ability" and A0_15:abilityCheck() == true then
    L6_21 = A0_15:getChildWidgetByWindowName("Ask/NegotiationAbilityListWidget")
    if L6_21 == nil then
      L5_20 = desktopWidget:openChildWidget("Ask/NegotiationAbilityListWidget", A0_15, true, A0_15.work.ability1, A0_15.work.ability2, A0_15.work.ability3, A0_15.work.ability4, A0_15.work.ability5)
      if L5_20 == false then
        A0_15:_sendStoryboardCommand(nil, "ProgressBar_TimeGauge", "UILuaCommands.ResumeLimitTimer")
      else
      end
    else
    end
  else
  end
end
function NegotiationWidget.playerSelect(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29, L6_30
  L2_26 = 0
  L3_27(L4_28, L5_29)
  L6_30 = false
  L3_27(L4_28, L5_29, L6_30)
  L6_30 = false
  L3_27(L4_28, L5_29, L6_30)
  if A1_25 ~= 13 then
    L3_27.select = A1_25
  end
  L6_30 = "ProgressBar_TimeGauge"
  L3_27(L4_28, L5_29, L6_30, "UILuaCommands.StopLimitTimer")
  L6_30 = "ProgressBar_TimeGauge"
  L3_27(L4_28, L5_29, L6_30, "Maximum", A0_24.work.time)
  L6_30 = "ProgressBar_TimeGauge"
  L3_27(L4_28, L5_29, L6_30, "Value", 0)
  for L6_30 = 1, 12 do
    A0_24:setEnable("Button_ItemIcon_" .. L6_30, false)
  end
  L6_30 = false
  L3_27(L4_28, L5_29, L6_30)
end
function NegotiationWidget.processUICommandCancel(A0_31, A1_32, A2_33, A3_34, A4_35)
  desktopWidget:openChildWidget("CommonAskWidget", A0_31, true, nil, 7124, 2, 7125, 7126)
end
function NegotiationWidget.processUICommandDefault(A0_36, A1_37, A2_38, A3_39, A4_40, A5_41)
  local L6_42, L7_43
  L6_42 = 0
  L7_43 = 0
  if A3_39 == "UILuaCommands.TimerOver" then
    A0_36:playerSelect(13)
    return
  end
  if A2_38 == "Button_ItemIcon_1" then
    L6_42 = A0_36.work.key1
    L7_43 = A0_36.work.icon1
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_2" then
    L6_42 = A0_36.work.key2
    L7_43 = A0_36.work.icon2
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_3" then
    L6_42 = A0_36.work.key3
    L7_43 = A0_36.work.icon3
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_4" then
    L6_42 = A0_36.work.key4
    L7_43 = A0_36.work.icon4
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_5" then
    L6_42 = A0_36.work.key5
    L7_43 = A0_36.work.icon5
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_6" then
    L6_42 = A0_36.work.key6
    L7_43 = A0_36.work.icon6
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_7" then
    L6_42 = A0_36.work.key7
    L7_43 = A0_36.work.icon7
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_8" then
    L6_42 = A0_36.work.key8
    L7_43 = A0_36.work.icon8
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_9" then
    L6_42 = A0_36.work.key9
    L7_43 = A0_36.work.icon9
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_10" then
    L6_42 = A0_36.work.key10
    L7_43 = A0_36.work.icon10
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_11" then
    L6_42 = A0_36.work.key11
    L7_43 = A0_36.work.icon11
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_ItemIcon_12" then
    L6_42 = A0_36.work.key12
    L7_43 = A0_36.work.icon12
    A0_36:setSelectIconInformationDisp(L6_42, L7_43)
    break
  else
  end
  if A2_38 == "Button_Ability" then
    A0_36:setVisibility("TextBlock_TopicItem", false)
    A0_36:setVisibility("IconControl_TopicItem", false)
    do break end
    break
  else
  end
end
function NegotiationWidget.setSelectIconInformationDisp(A0_44, A1_45, A2_46)
  A0_44:setText("TextBlock_TopicItem", 7103, A1_45)
  A0_44:setVisibility("TextBlock_TopicItem", true)
  A0_44:setIcon("IconControl_TopicItem", A2_46)
  A0_44:setVisibility("IconControl_TopicItem", true)
end
function NegotiationWidget.setAskParameter(A0_47, A1_48, A2_49, A3_50)
  local L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59
  L4_51 = false
  L5_52 = 0
  L6_53 = 0
  L7_54 = 0
  L8_55 = 0
  if A3_50 == true then
    L12_59 = "ProgressBar_TimeGauge"
    L9_56(L10_57, L11_58, L12_59, "UILuaCommands.ResumeLimitTimer")
    return
  end
  if A2_49 == true then
    return
  end
  L4_51 = L9_56
  if L4_51 ~= nil then
    L12_59 = "TextBlock_RemainderTurn"
    L10_57(L11_58, L12_59, L9_56)
  else
  end
  L12_59 = "ProgressBar_TimeGauge"
  L9_56(L10_57, L11_58, L12_59, "Maximum", A0_47.work.time)
  L12_59 = "ProgressBar_TimeGauge"
  L9_56(L10_57, L11_58, L12_59, "Value", A0_47.work.time)
  L12_59 = "ProgressBar_TimeGauge"
  L9_56(L10_57, L11_58, L12_59, "UILuaCommands.StartLimitTimer")
  for L12_59 = 1, 12 do
    A0_47:setEnable("Button_ItemIcon_" .. L12_59, true)
  end
  if L9_56 == true then
    L12_59 = true
    L9_56(L10_57, L11_58, L12_59)
  end
  L8_55 = L11_58
  L7_54 = L10_57
  L6_53 = L9_56
  L12_59 = 7103
  L9_56(L10_57, L11_58, L12_59, L6_53)
  L12_59 = true
  L9_56(L10_57, L11_58, L12_59)
  L12_59 = L7_54
  L9_56(L10_57, L11_58, L12_59)
  L12_59 = true
  L9_56(L10_57, L11_58, L12_59)
  if L9_56 then
    L12_59 = A0_47.work
    L12_59 = L12_59.select
    L9_56(L10_57, L11_58)
  end
end
function NegotiationWidget.updateAskParameter(A0_60, A1_61, A2_62, A3_63, A4_64, A5_65, A6_66)
  local L7_67, L8_68, L9_69, L10_70, L11_71, L12_72, L13_73, L14_74, L15_75, L16_76, L17_77
  L7_67 = 0
  L8_68 = 0
  L9_69 = 0
  L10_70 = 0
  L11_71 = 0
  L12_72 = 0
  L13_73 = A1_61
  if L13_73 == 1 then
  elseif L13_73 == 2 then
  elseif L13_73 == 3 then
  elseif L13_73 == 4 then
  elseif L13_73 == 5 then
  elseif L13_73 == 6 then
  elseif L13_73 == 7 then
  elseif L13_73 == 8 then
  elseif L13_73 == 9 then
  elseif L13_73 == 10 then
  elseif L13_73 == 11 then
  else
  end
  if L13_73 == 12 then
    L17_77 = A2_62
    L14_74(L15_75, L16_76, L17_77, A3_63, A4_64)
    L17_77 = A1_61
    L17_77 = A3_63
    L14_74(L15_75, L16_76, L17_77)
    L17_77 = A1_61
    L17_77 = true
    L14_74(L15_75, L16_76, L17_77)
    L9_69 = L14_74
    L17_77 = A1_61
    L17_77 = L9_69
    L14_74(L15_75, L16_76, L17_77)
    L17_77 = A1_61
    L17_77 = true
    L14_74(L15_75, L16_76, L17_77)
    L17_77 = "ProgressBar_NegotiationGauge"
    L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayIconSet")
    break
  else
  end
  if L13_73 == 13 then
    L17_77 = A2_62
    L17_77 = false
    L14_74(L15_75, L16_76, L17_77)
    L17_77 = A2_62
    L17_77 = false
    L14_74(L15_75, L16_76, L17_77)
    if A3_63 == 0 then
      L17_77 = "ProgressBar_NegotiationGauge"
      L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayMyOperate")
    else
      L17_77 = "ProgressBar_NegotiationGauge"
      L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayEnemyOperate")
    end
    if A5_65 == true then
      L14_74(L15_75, L16_76)
      L17_77 = A2_62
      L17_77 = true
      L14_74(L15_75, L16_76, L17_77)
      L14_74(L15_75, L16_76)
      L17_77 = A2_62
      L17_77 = false
      L14_74(L15_75, L16_76, L17_77)
      do break end
      else
      end
      if L13_73 == 14 then
        L17_77 = "ProgressBar_NegotiationGauge"
        L14_74(L15_75, L16_76, L17_77, "Maximum", A2_62)
        L17_77 = "ProgressBar_NegotiationGauge"
        L14_74(L15_75, L16_76, L17_77, "Value", A3_63)
        break
      else
      end
      if L13_73 == 15 then
        L17_77 = "ProgressBar_AchievementGauge"
        L14_74(L15_75, L16_76, L17_77, "Maximum", A2_62)
        L17_77 = "ProgressBar_AchievementGauge"
        L14_74(L15_75, L16_76, L17_77, "Value", A3_63)
        break
      else
      end
      if L13_73 == 16 then
        L17_77 = A2_62
        L14_74(L15_75, L16_76, L17_77)
        if A2_62 then
          L17_77 = "ProgressBar_NegotiationGauge"
          L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayAddItem")
          do break end
          else
          end
          if L13_73 == 17 then
            L17_77 = A2_62
            L14_74(L15_75, L16_76, L17_77)
            if A2_62 then
              L17_77 = "ProgressBar_NegotiationGauge"
              L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayAddItem")
              do break end
              else
              end
              if L13_73 == 18 then
                L17_77 = A2_62
                L14_74(L15_75, L16_76, L17_77)
                if A2_62 then
                  L17_77 = "ProgressBar_NegotiationGauge"
                  L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayAddItem")
                  do break end
                  else
                  end
                  if L13_73 == 19 then
                    L17_77 = A3_63
                    L14_74(L15_75, L16_76, L17_77)
                    break
                  else
                  end
                  if L13_73 == 20 then
                    L14_74.ability1 = A2_62
                    L14_74.ability2 = A3_63
                    L14_74.ability3 = A4_64
                    L14_74.ability4 = A5_65
                    L14_74.ability5 = A6_66
                    if L14_74 == false then
                      L17_77 = false
                      L14_74(L15_75, L16_76, L17_77)
                      do break end
                      else
                      end
                      if L13_73 == 21 then
                        if A5_65 == true then
                          L17_77 = true
                          L14_74(L15_75, L16_76, L17_77)
                          L17_77 = false
                          L14_74(L15_75, L16_76, L17_77)
                        else
                          L17_77 = false
                          L14_74(L15_75, L16_76, L17_77)
                          L17_77 = true
                          L14_74(L15_75, L16_76, L17_77)
                          do break end
                          else
                          end
                          if L13_73 == 22 then
                            L17_77 = "ProgressBar_TimeGauge"
                            L14_74(L15_75, L16_76, L17_77, "Maximum", A0_60.work.time)
                            L17_77 = "ProgressBar_TimeGauge"
                            L14_74(L15_75, L16_76, L17_77, "Value", 0)
                            break
                          else
                          end
                          if L13_73 == 23 then
                            L17_77 = "ProgressBar_NegotiationGauge"
                            L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayMyOperate")
                            break
                          else
                          end
                          if L13_73 == 24 then
                            L17_77 = "ProgressBar_NegotiationGauge"
                            L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayEnemyOperate")
                            break
                          else
                          end
                          if L13_73 == 25 then
                            L17_77 = "ProgressBar_NegotiationGauge"
                            L14_74(L15_75, L16_76, L17_77, "UILuaCommands.SoundPlayTimeUp")
                            if L14_74 then
                              L17_77 = "Ask/NegotiationAbilityListWidget"
                              if L15_75 == false then
                                do break end
                                else
                                end
                                if L13_73 == 26 then
                                  L12_72 = L16_76
                                  L11_71 = L15_75
                                  L10_70 = L14_74
                                  L17_77 = L10_70
                                  L14_74(L15_75, L16_76, L17_77, L11_71, L12_72)
                                  L17_77 = A2_62
                                  L17_77 = L11_71
                                  L14_74(L15_75, L16_76, L17_77)
                                  L17_77 = A2_62
                                  L17_77 = true
                                  L14_74(L15_75, L16_76, L17_77)
                                  L17_77 = "Button_ItemIcon_"
                                  L17_77 = L17_77 .. A2_62 .. ":TextBlock_NumberOfTopics"
                                  L15_75(L16_76, L17_77, L14_74)
                                  L17_77 = "Button_ItemIcon_"
                                  L17_77 = L17_77 .. A2_62 .. ":TextBlock_NumberOfTopics"
                                  L15_75(L16_76, L17_77, true)
                                  L17_77 = "Button_ItemIcon_"
                                  L17_77 = L17_77 .. A3_63 .. ":IconControl_ItemIcon"
                                  L15_75(L16_76, L17_77, false)
                                  L17_77 = "Button_ItemIcon_"
                                  L17_77 = L17_77 .. A3_63 .. ":TextBlock_NumberOfTopics"
                                  L15_75(L16_76, L17_77, false)
                                  L17_77 = nil
                                  L15_75(L16_76, L17_77, "ProgressBar_NegotiationGauge", "UILuaCommands.SoundPlayIconSet")
                                  break
                                else
                                end
                                if L13_73 == 27 then
                                  for L17_77 = 1, 12 do
                                    L10_70, L11_71, L12_72 = A0_60:negotiationWidgetGetData(L17_77)
                                    if A5_65 then
                                      L12_72 = L12_72 * 2
                                    else
                                      L12_72 = L12_72 / 2
                                    end
                                    A0_60:negotiationWidgetSetData(L17_77, L10_70, L11_71, L12_72)
                                    L9_69 = tostring(L12_72)
                                    A0_60:setText("Button_ItemIcon_" .. L17_77 .. ":TextBlock_NumberOfTopics", L9_69)
                                  end
                                  break
                                else
                                end
                                if L13_73 == 28 then
                                  L17_77 = "ProgressBar_TimeGauge"
                                  L14_74(L15_75, L16_76, L17_77, "UILuaCommands.PauseLimitTimer")
                                  break
                                else
                                end
                                if L13_73 == 29 then
                                  L17_77 = "ProgressBar_TimeGauge"
                                  L14_74(L15_75, L16_76, L17_77, "UILuaCommands.ResumeLimitTimer")
                                  break
                                else
                                end
                              else
                              end
                            else
                            end
                        end
                    else
                    end
                else
                end
            else
            end
        else
        end
    else
    end
end
function NegotiationWidget.abilityCheck(A0_78)
  local L1_79, L2_80
  L1_79 = true
  L2_80 = A0_78.work
  L2_80 = L2_80.ability1
  if L2_80 == false then
    L2_80 = A0_78.work
    L2_80 = L2_80.ability2
    if L2_80 == false then
      L2_80 = A0_78.work
      L2_80 = L2_80.ability3
      if L2_80 == false then
        L2_80 = A0_78.work
        L2_80 = L2_80.ability4
        if L2_80 == false then
          L2_80 = A0_78.work
          L2_80 = L2_80.ability5
          if L2_80 == false then
            L1_79 = false
          end
        end
      end
    end
  end
  return L1_79
end
function NegotiationWidget.negotiationWidgetSetData(A0_81, A1_82, A2_83, A3_84, A4_85)
  local L5_86, L6_87
  L5_86 = A1_82
  if L5_86 == 1 then
    L6_87 = A0_81.work
    L6_87.key1 = A2_83
    L6_87 = A0_81.work
    L6_87.icon1 = A3_84
    L6_87 = A0_81.work
    L6_87.value1 = A4_85
    break
  else
  end
  if L5_86 == 2 then
    L6_87 = A0_81.work
    L6_87.key2 = A2_83
    L6_87 = A0_81.work
    L6_87.icon2 = A3_84
    L6_87 = A0_81.work
    L6_87.value2 = A4_85
    break
  else
  end
  if L5_86 == 3 then
    L6_87 = A0_81.work
    L6_87.key3 = A2_83
    L6_87 = A0_81.work
    L6_87.icon3 = A3_84
    L6_87 = A0_81.work
    L6_87.value3 = A4_85
    break
  else
  end
  if L5_86 == 4 then
    L6_87 = A0_81.work
    L6_87.key4 = A2_83
    L6_87 = A0_81.work
    L6_87.icon4 = A3_84
    L6_87 = A0_81.work
    L6_87.value4 = A4_85
    break
  else
  end
  if L5_86 == 5 then
    L6_87 = A0_81.work
    L6_87.key5 = A2_83
    L6_87 = A0_81.work
    L6_87.icon5 = A3_84
    L6_87 = A0_81.work
    L6_87.value5 = A4_85
    break
  else
  end
  if L5_86 == 6 then
    L6_87 = A0_81.work
    L6_87.key6 = A2_83
    L6_87 = A0_81.work
    L6_87.icon6 = A3_84
    L6_87 = A0_81.work
    L6_87.value6 = A4_85
    break
  else
  end
  if L5_86 == 7 then
    L6_87 = A0_81.work
    L6_87.key7 = A2_83
    L6_87 = A0_81.work
    L6_87.icon7 = A3_84
    L6_87 = A0_81.work
    L6_87.value7 = A4_85
    break
  else
  end
  if L5_86 == 8 then
    L6_87 = A0_81.work
    L6_87.key8 = A2_83
    L6_87 = A0_81.work
    L6_87.icon8 = A3_84
    L6_87 = A0_81.work
    L6_87.value8 = A4_85
    break
  else
  end
  if L5_86 == 9 then
    L6_87 = A0_81.work
    L6_87.key9 = A2_83
    L6_87 = A0_81.work
    L6_87.icon9 = A3_84
    L6_87 = A0_81.work
    L6_87.value9 = A4_85
    break
  else
  end
  if L5_86 == 10 then
    L6_87 = A0_81.work
    L6_87.key10 = A2_83
    L6_87 = A0_81.work
    L6_87.icon10 = A3_84
    L6_87 = A0_81.work
    L6_87.value10 = A4_85
    break
  else
  end
  if L5_86 == 11 then
    L6_87 = A0_81.work
    L6_87.key11 = A2_83
    L6_87 = A0_81.work
    L6_87.icon11 = A3_84
    L6_87 = A0_81.work
    L6_87.value11 = A4_85
    break
  else
  end
  if L5_86 == 12 then
    L6_87 = A0_81.work
    L6_87.key12 = A2_83
    L6_87 = A0_81.work
    L6_87.icon12 = A3_84
    L6_87 = A0_81.work
    L6_87.value12 = A4_85
    do break end
    break
  else
  end
end
function NegotiationWidget.negotiationWidgetGetData(A0_88, A1_89)
  local L2_90, L3_91, L4_92, L5_93, L6_94, L7_95
  L2_90 = 0
  L3_91 = 0
  L4_92 = 0
  L5_93 = A1_89
  if L5_93 == 1 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key1
    L6_94 = A0_88.work
    L3_91 = L6_94.icon1
    L6_94 = A0_88.work
    L4_92 = L6_94.value1
    break
  else
  end
  if L5_93 == 2 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key2
    L6_94 = A0_88.work
    L3_91 = L6_94.icon2
    L6_94 = A0_88.work
    L4_92 = L6_94.value2
    break
  else
  end
  if L5_93 == 3 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key3
    L6_94 = A0_88.work
    L3_91 = L6_94.icon3
    L6_94 = A0_88.work
    L4_92 = L6_94.value3
    break
  else
  end
  if L5_93 == 4 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key4
    L6_94 = A0_88.work
    L3_91 = L6_94.icon4
    L6_94 = A0_88.work
    L4_92 = L6_94.value4
    break
  else
  end
  if L5_93 == 5 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key5
    L6_94 = A0_88.work
    L3_91 = L6_94.icon5
    L6_94 = A0_88.work
    L4_92 = L6_94.value5
    break
  else
  end
  if L5_93 == 6 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key6
    L6_94 = A0_88.work
    L3_91 = L6_94.icon6
    L6_94 = A0_88.work
    L4_92 = L6_94.value6
    break
  else
  end
  if L5_93 == 7 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key7
    L6_94 = A0_88.work
    L3_91 = L6_94.icon7
    L6_94 = A0_88.work
    L4_92 = L6_94.value7
    break
  else
  end
  if L5_93 == 8 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key8
    L6_94 = A0_88.work
    L3_91 = L6_94.icon8
    L6_94 = A0_88.work
    L4_92 = L6_94.value8
    break
  else
  end
  if L5_93 == 9 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key9
    L6_94 = A0_88.work
    L3_91 = L6_94.icon9
    L6_94 = A0_88.work
    L4_92 = L6_94.value9
    break
  else
  end
  if L5_93 == 10 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key10
    L6_94 = A0_88.work
    L3_91 = L6_94.icon10
    L6_94 = A0_88.work
    L4_92 = L6_94.value10
    break
  else
  end
  if L5_93 == 11 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key11
    L6_94 = A0_88.work
    L3_91 = L6_94.icon11
    L6_94 = A0_88.work
    L4_92 = L6_94.value11
    break
  else
  end
  if L5_93 == 12 then
    L6_94 = A0_88.work
    L2_90 = L6_94.key12
    L6_94 = A0_88.work
    L3_91 = L6_94.icon12
    L6_94 = A0_88.work
    L4_92 = L6_94.value12
    do break end
    break
  else
  end
  L5_93 = L2_90
  L6_94 = L3_91
  L7_95 = L4_92
  return L5_93, L6_94, L7_95
end
function NegotiationWidget.negotiationWidgetDispSelected(A0_96, A1_97, A2_98)
  if A1_97 < 6 then
    if A1_97 == 1 then
      A0_96.work.selected1 = A2_98
      A0_96:setIcon("Label_SelectedItem_1:IconControl_SelectedItemIcon", A2_98)
      A0_96:setVisibility("Label_SelectedItem_1:IconControl_SelectedItemIcon", true)
      break
    else
    end
    if A1_97 == 2 then
      A0_96.work.selected2 = A2_98
      A0_96:setIcon("Label_SelectedItem_2:IconControl_SelectedItemIcon", A2_98)
      A0_96:setVisibility("Label_SelectedItem_2:IconControl_SelectedItemIcon", true)
      break
    else
    end
    if A1_97 == 3 then
      A0_96.work.selected3 = A2_98
      A0_96:setIcon("Label_SelectedItem_3:IconControl_SelectedItemIcon", A2_98)
      A0_96:setVisibility("Label_SelectedItem_3:IconControl_SelectedItemIcon", true)
      break
    else
    end
    if A1_97 == 4 then
      A0_96.work.selected4 = A2_98
      A0_96:setIcon("Label_SelectedItem_4:IconControl_SelectedItemIcon", A2_98)
      A0_96:setVisibility("Label_SelectedItem_4:IconControl_SelectedItemIcon", true)
      break
    else
    end
    if A1_97 == 5 then
      A0_96.work.selected5 = A2_98
      A0_96:setIcon("Label_SelectedItem_5:IconControl_SelectedItemIcon", A2_98)
      A0_96:setVisibility("Label_SelectedItem_5:IconControl_SelectedItemIcon", true)
      do break end
      break
    else
    end
  elseif A0_96.work.selected6 == 0 then
    A0_96.work.selected6 = A2_98
    A0_96:setIcon("Label_SelectedItem_6:IconControl_SelectedItemIcon", A2_98)
    A0_96:setVisibility("Label_SelectedItem_6:IconControl_SelectedItemIcon", true)
  else
    A0_96.work.selected1 = A0_96.work.selected2
    A0_96.work.selected2 = A0_96.work.selected3
    A0_96.work.selected3 = A0_96.work.selected4
    A0_96.work.selected4 = A0_96.work.selected5
    A0_96.work.selected5 = A0_96.work.selected6
    A0_96.work.selected6 = A2_98
    A0_96:setIcon("Label_SelectedItem_1:IconControl_SelectedItemIcon", A0_96.work.selected1)
    A0_96:setIcon("Label_SelectedItem_2:IconControl_SelectedItemIcon", A0_96.work.selected2)
    A0_96:setIcon("Label_SelectedItem_3:IconControl_SelectedItemIcon", A0_96.work.selected3)
    A0_96:setIcon("Label_SelectedItem_4:IconControl_SelectedItemIcon", A0_96.work.selected4)
    A0_96:setIcon("Label_SelectedItem_5:IconControl_SelectedItemIcon", A0_96.work.selected5)
    A0_96:setIcon("Label_SelectedItem_6:IconControl_SelectedItemIcon", A0_96.work.selected6)
  end
end
function NegotiationWidget.processAskResult(A0_99, A1_100)
  if A1_100 == 1 then
    A0_99:setBaseAskResult(-1)
  end
end
