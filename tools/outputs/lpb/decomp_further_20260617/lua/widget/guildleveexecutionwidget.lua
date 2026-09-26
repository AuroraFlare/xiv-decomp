require("/Widget/WidgetBaseClass")
_defineClass("GuildleveExecutionWidget", "WidgetBaseClass")
function GuildleveExecutionWidget.init(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14
  L2_2._temp = L3_3
  L5_5 = ""
  L2_2(L3_3, L4_4, L5_5)
  L5_5 = ""
  L2_2(L3_3, L4_4, L5_5)
  for L5_5 = 1, 7 do
    L7_7 = A0_0
    L6_6 = A0_0.setArticleDisplay
    L8_8 = L5_5
    L9_9 = false
    L6_6(L7_7, L8_8, L9_9)
  end
  L2_2(L3_3, L4_4)
  if L2_2 ~= nil then
    L6_6 = A0_0
    L5_5 = A0_0.setTitle
    L7_7 = L2_2
    L8_8 = L3_3
    L9_9 = L4_4
    L5_5(L6_6, L7_7, L8_8, L9_9)
    L6_6 = A1_1
    L5_5 = A1_1.getInstructionOnGuildleveInfo
    L7_7 = L5_5(L6_6)
    L9_9 = A0_0
    L8_8 = A0_0.setDetail
    L10_10 = L5_5
    L8_8(L9_9, L10_10, L11_11, L12_12)
    L9_9 = A1_1
    L8_8 = A1_1.getTimeDataOnGuildleveInfo
    L9_9 = L8_8(L9_9)
    L10_10 = A0_0.setTimer
    L10_10(L11_11, L12_12, L13_13)
    L10_10 = A1_1.getMaxIndexNumberOnGuildleveInfo
    L10_10 = L10_10(L11_11)
    for L14_14 = 1, L10_10 do
      A0_0:updateArticle(A1_1, L14_14)
    end
    L14_14 = nil
    if L11_11 ~= nil then
      guildleveUISheet:_loadKeyTemporarily(L11_11, L11_11)
      L14_14 = guildleveUISheet:_getData(L11_11, 75)
    end
    A0_0:setCard(L12_12, L13_13, L14_14)
  end
end
function GuildleveExecutionWidget.isCreateCancel(A0_15)
  if A0_15:getArgActor() == nil then
    return true
  end
  return false
end
function GuildleveExecutionWidget.update(A0_16, A1_17, A2_18)
  local L3_19
  L3_19 = A0_16.updateArticle
  L3_19(A0_16, A1_17, A2_18)
  L3_19 = "Label_Effect_"
  L3_19 = L3_19 .. tostring(A2_18)
  A0_16:_sendStoryboardCommand(nil, L3_19, "UIAnimationCommands.ChangeArticleEffect")
end
function GuildleveExecutionWidget.updateArticle(A0_20, A1_21, A2_22)
  local L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30, L11_31, L12_32
  L4_24 = A1_21
  L3_23 = A1_21.getArticleFullDataOnGuildleveInfo
  L5_25 = A2_22
  L12_32 = L3_23(L4_24, L5_25)
  A0_20:setArticleType(A2_22, L4_24, L6_26, L7_27, L8_28)
  A0_20:setArticleState(A2_22, L5_25, L3_23, L9_29, L10_30, L11_31, L12_32)
end
function GuildleveExecutionWidget.setTitle(A0_33, A1_34, A2_35, ...)
  local L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44
  L5_38 = A0_33
  L4_37 = A0_33._setProperty
  L6_39 = nil
  L7_40 = "TextBlock_GuildleveTitle"
  L8_41 = "Text"
  L9_42 = A1_34
  L10_43 = A2_35
  L11_44 = ...
  L4_37(L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44)
end
function GuildleveExecutionWidget.setDetail(A0_45, A1_46, A2_47, ...)
  local L4_49, L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, L11_56
  L5_50 = A0_45
  L4_49 = A0_45._setProperty
  L6_51 = nil
  L7_52 = "TextBlock_GuildleveTarget"
  L8_53 = "Text"
  L9_54 = A1_46
  L10_55 = A2_47
  L11_56 = ...
  L4_49(L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, L11_56)
end
function GuildleveExecutionWidget.setCard(A0_57, A1_58, A2_59, A3_60)
  if A1_58 == nil or A1_58 <= 0 then
    A0_57:setIcon("IconControl_Card", 0)
    A0_57:setIcon("IconControl_Plate", 0)
    A0_57:setIcon("IconControl_TownName", 0)
    A0_57:setVisibility("Label_GLPlate", false)
  else
    A0_57:setIcon("IconControl_Card", A1_58)
    A0_57:setIcon("IconControl_Plate", A2_59)
    A0_57:setIcon("IconControl_TownName", A3_60)
    A0_57:setVisibility("Label_GLPlate", true)
  end
end
function GuildleveExecutionWidget.setTimer(A0_61, A1_62, A2_63)
  local L3_64, L4_65, L5_66, L6_67
  L3_64 = worldMaster
  L4_65 = L3_64
  L3_64 = L3_64._getServerTime
  L3_64 = L3_64(L4_65)
  L4_65 = A1_62 - L3_64
  L5_66 = 0
  L6_67 = 0
  if A2_63 ~= nil then
    L6_67 = L4_65 - (A2_63 - L3_64)
  end
  A0_61:_setProperty(nil, "CustomControl_TimerLabel", "IntData.Value0", 1)
  A0_61:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value0", L4_65)
  A0_61:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value1", L5_66)
  A0_61:_setProperty(nil, "CustomControl_TimerLabel", "FloatData.Value2", L6_67)
end
function GuildleveExecutionWidget.setArticleType(A0_68, A1_69, A2_70, A3_71, A4_72, A5_73)
  local L6_74, L7_75, L8_76, L9_77, L10_78, L11_79, L12_80, L13_81, L14_82, L15_83
  L6_74 = false
  L7_75 = false
  L8_76 = false
  L9_77 = false
  L10_78 = "TextBlock_Bunshi_"
  L11_79 = tostring
  L12_80 = A1_69
  L11_79 = L11_79(L12_80)
  L10_78 = L10_78 .. L11_79
  L11_79 = "TextBlock_Bunbo_"
  L12_80 = tostring
  L13_81 = A1_69
  L12_80 = L12_80(L13_81)
  L11_79 = L11_79 .. L12_80
  L12_80 = "ProgressBar_"
  L13_81 = tostring
  L14_82 = A1_69
  L13_81 = L13_81(L14_82)
  L12_80 = L12_80 .. L13_81
  L13_81 = "CustomControl_QuestTimerLabel_"
  L14_82 = tostring
  L15_83 = A1_69
  L14_82 = L14_82(L15_83)
  L13_81 = L13_81 .. L14_82
  L14_82 = A2_70
  if L14_82 == 0 then
    break
  else
  end
  if L14_82 == 1 then
    L7_75 = true
    L15_83 = A0_68.setText
    L15_83(A0_68, L11_79, tostring(A3_71))
    break
  else
  end
  if L14_82 == 2 then
    L7_75 = true
    L6_74 = true
    L15_83 = A0_68.setText
    L15_83(A0_68, L11_79, tostring(A4_72))
    L15_83 = A0_68.setText
    L15_83(A0_68, L10_78, tostring(A3_71))
    break
  else
  end
  if L14_82 == 3 then
    L9_77 = true
    L15_83 = A0_68._setProperty
    L15_83(A0_68, nil, L13_81, "IntData.Value0", 1)
    L15_83 = A0_68._setProperty
    L15_83(A0_68, nil, L13_81, "FloatData.Value0", A3_71)
    L15_83 = A0_68._setProperty
    L15_83(A0_68, nil, L13_81, "FloatData.Value1", A4_72)
    if A5_73 ~= nil then
      L15_83 = A0_68._setProperty
      L15_83(A0_68, nil, L13_81, "FloatData.Value2", A5_73)
      do break end
      else
      end
      if L14_82 == 4 then
        L8_76 = true
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Maximum", A4_72)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Value", A3_71)
        break
      else
      end
      if L14_82 == 5 then
        L7_75 = true
        L8_76 = true
        L15_83 = A0_68.setText
        L15_83(A0_68, L11_79, tostring(A3_71))
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Maximum", A4_72)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Value", A3_71)
        break
      else
      end
      if L14_82 == 6 then
        L7_75 = true
        L6_74 = true
        L8_76 = true
        L15_83 = A0_68.setText
        L15_83(A0_68, L11_79, tostring(A4_72))
        L15_83 = A0_68.setText
        L15_83(A0_68, L10_78, tostring(A3_71))
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Maximum", A4_72)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Value", A3_71)
        break
      else
      end
      if L14_82 == 7 then
        L8_76 = true
        L15_83 = A0_68.setText
        L15_83(A0_68, L11_79, tostring(A3_71))
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Maximum", 100)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Value", A3_71)
        break
      else
      end
      if L14_82 == 8 then
        L8_76 = true
        L9_77 = true
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L13_81, "IntData.Value0", 1)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L13_81, "FloatData.Value0", A3_71)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L13_81, "FloatData.Value1", A4_72)
        if A5_73 ~= nil then
          L15_83 = A0_68._setProperty
          L15_83(A0_68, nil, L13_81, "FloatData.Value2", A5_73)
        end
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Maximum", A4_72)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Value", A3_71)
        break
      else
      end
      if L14_82 == 9 then
        L8_76 = true
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Maximum", A4_72)
        L15_83 = A0_68._setProperty
        L15_83(A0_68, nil, L12_80, "Value", A3_71)
        break
      else
      end
    else
    end
  L14_82 = "Grid_Bunshi_"
  L15_83 = tostring
  L15_83 = L15_83(A1_69)
  L14_82 = L14_82 .. L15_83
  L15_83 = "Label_Quest_Timer_"
  L15_83 = L15_83 .. tostring(A1_69)
  A0_68:setVisibility(L14_82, L6_74)
  A0_68:setVisibility(L11_79, L7_75)
  A0_68:setVisibility(L12_80, L8_76)
  A0_68:setVisibility(L15_83, L9_77)
end
function GuildleveExecutionWidget.setArticleState(A0_84, A1_85, A2_86, A3_87, A4_88, A5_89, ...)
  local L7_91, L8_92, L9_93, L10_94, L11_95, L12_96, L13_97
  L7_91 = 0
  L8_92 = 0
  L9_93 = "IconControl_Status_"
  L10_94 = tostring
  L11_95 = A1_85
  L10_94 = L10_94(L11_95)
  L9_93 = L9_93 .. L10_94
  L10_94 = "IconControl_StatusComplete_"
  L11_95 = tostring
  L12_96 = A1_85
  L11_95 = L11_95(L12_96)
  L10_94 = L10_94 .. L11_95
  L11_95 = false
  L12_96 = 0
  L13_97 = 1
  if A2_86 == 1 then
    L8_92 = 114
    L12_96 = 79003
    break
  else
  end
  if A2_86 == 2 then
    L8_92 = 115
    L12_96 = 79004
    break
  else
  end
  if A2_86 == 3 then
    L8_92 = 116
    L12_96 = 79005
    break
  else
  end
  if A2_86 == 4 then
    L8_92 = 117
    L12_96 = 79006
    break
  else
    if A2_86 == 0 then
    else
    end
  end
  L13_97 = 0
  do break end
  if A3_87 == 0 then
    break
  else
  end
  if A3_87 == 1 then
    L7_91 = 112
    L11_95 = true
    break
  else
  end
  if A3_87 == 2 then
    L7_91 = 112
    L8_92 = 118
    L11_95 = true
    break
  else
  end
  if A3_87 == 3 then
    L7_91 = 113
    L11_95 = true
    break
  else
  end
  if A3_87 == 4 then
    L7_91 = 113
    L8_92 = 119
    L11_95 = true
    do break end
    break
  else
  end
  if L11_95 then
    if L7_91 ~= 0 then
      A0_84:setVisibility(L9_93, true)
    else
      A0_84:setVisibility(L9_93, false)
    end
    A0_84:setIcon(L9_93, L7_91)
    if L8_92 ~= 0 then
      A0_84:setVisibility(L10_94, true)
    else
      A0_84:setVisibility(L10_94, false)
    end
    A0_84:setIcon(L10_94, L8_92)
    A0_84:_setProperty(nil, "TextBlock_ConditionText_" .. tostring(A1_85), "Text", A4_88, A5_89, ...)
    A0_84:setHelpParameter("Grid_GuildleveCondition_" .. tostring(A1_85), L13_97, L12_96)
  end
  A0_84:setArticleDisplay(A1_85, L11_95)
end
function GuildleveExecutionWidget.setArticleDisplay(A0_98, A1_99, A2_100)
  A0_98:setVisibility("Grid_GuildleveCondition_" .. tostring(A1_99), A2_100)
end
