require("/Widget/Ask/AskBaseClass")
_defineClass("HamletDefenseTutorialWidget", "AskBaseClass")
function HamletDefenseTutorialWidget.initAsk(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6
  L5_5 = "kind"
  L6_6 = "integer8"
  L5_5 = {L6_6, "integer8"}
  L6_6 = "gcId"
  L6_6 = {"page", "integer8"}
  L2_2._temp = L3_3
  L2_2.kind = 1
  L2_2.gcId = A1_1
  L2_2.page = 1
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3)
  L2_2(L3_3, L4_4)
  L5_5 = A0_0.work
  L5_5 = L5_5.kind
  for L5_5 = 1, L3_3(L4_4, L5_5) do
    L6_6 = A0_0.getPageName
    L6_6 = L6_6(A0_0, A0_0.work.kind, L5_5)
    A0_0:setVisibility(L6_6, false)
  end
  L5_5 = A0_0.work
  L5_5 = L5_5.gcId
  L6_6 = A0_0.work
  L6_6 = L6_6.page
  L2_2(L3_3, L4_4, L5_5, L6_6)
end
function HamletDefenseTutorialWidget.processUICommandOperate(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12
  L5_12 = A2_9
  if L5_12 == "Button_Previous" then
    A0_7.work.page = A0_7.work.page - 1
    A0_7:setPage(A0_7.work.kind, A0_7.work.gcId, A0_7.work.page)
    break
  else
  end
  if L5_12 == "Button_Next" then
    A0_7.work.page = A0_7.work.page + 1
    A0_7:setPage(A0_7.work.kind, A0_7.work.gcId, A0_7.work.page)
    break
  else
  end
  if L5_12 == "Button_Close" then
    A0_7:setBaseAskResult(1)
    break
  else
  end
end
function HamletDefenseTutorialWidget.processUICommandCancel(A0_13, A1_14, A2_15, A3_16, A4_17)
  if A0_13:getKeyboardFocusedControl() == "Button_Previous" then
  else
  end
  if A0_13:getKeyboardFocusedControl() == "Button_Next" then
    A0_13:setKeyboardFocusedControl("Button_Close")
    break
  else
  end
  if A0_13:getKeyboardFocusedControl() == "Button_Close" then
    A0_13:setBaseAskResult(1)
    break
  else
  end
end
function HamletDefenseTutorialWidget.setPage(A0_18, A1_19, A2_20, A3_21)
  local L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30
  L10_28 = A1_19
  for L10_28 = 1, L8_26(L9_27, L10_28) do
    L12_30 = A0_18
    L11_29 = A0_18.getPageName
    L6_24, L11_29 = A1_19, L11_29(L12_30, A1_19, L10_28)
    L6_24, L12_30 = A1_19, L11_29(L12_30, A1_19, L10_28)
    L5_23 = L12_30
    L4_22 = L11_29
    L12_30 = A0_18
    L11_29 = A0_18.getVisibility
    L11_29 = L11_29(L12_30, L4_22)
    if L11_29 == true then
      L12_30 = A0_18
      L11_29 = A0_18.setVisibility
      L11_29(L12_30, L4_22, false)
      break
    end
  end
  L10_28 = A2_20
  L11_29 = A3_21
  L11_29 = A0_18
  L10_28 = A0_18.getPageName
  L12_30 = A1_19
  L12_30 = L10_28(L11_29, L12_30, A3_21)
  A0_18:setVisibility(L10_28, true)
  if L7_25 ~= nil then
    A0_18:setControlUserWorkInt(1, L11_29, L7_25)
  end
  if L8_26 ~= nil then
    A0_18:sendControlCommand(L12_30, L9_27)
    A0_18:sendControlCommand(L12_30, L8_26)
  end
  A0_18:setText("TextBlock_Text", A0_18:getGuideText(A1_19, A2_20, A3_21))
  A0_18:setEnable("Button_Previous", A3_21 > 1)
  A0_18:setEnable("Button_Next", A3_21 < A0_18:getPageMax(A1_19))
  if A0_18:getKeyboardFocusedControl() ~= nil then
    if A3_21 == 1 and A0_18:getKeyboardFocusedControl() ~= "Button_Next" then
      A0_18:setKeyboardFocusedControl("Button_Next")
    end
    if A3_21 == A0_18:getPageMax(A1_19) and A0_18:getKeyboardFocusedControl() ~= "Button_Close" then
      A0_18:setKeyboardFocusedControl("Button_Close")
    end
  end
end
function HamletDefenseTutorialWidget.getGuideGraphics(A0_31, A1_32, A2_33, A3_34)
  local L4_35, L5_36, L6_37, L7_38, L8_39, L9_40
  if A1_32 == 1 then
    if A2_33 == 1 then
      L7_38 = A3_34
      if L7_38 == 7 then
        L4_35 = 1065
        L5_36 = "UILuaCommands.BINGOAnimeStart"
        L6_37 = "UILuaCommands.BINGOAnimeStop"
        break
      elseif L7_38 == 2 then
      elseif L7_38 == 3 then
      elseif L7_38 == 4 then
      else
      end
      if L7_38 == 5 then
        L4_35 = 1065
        break
      elseif L7_38 == 1 then
      elseif L7_38 == 6 then
      elseif L7_38 == 8 then
      else
      end
      if L7_38 == 9 then
        L4_35 = nil
        break
      else
      end
    elseif A2_33 == 2 then
      L7_38 = A3_34
      if L7_38 == 7 then
        L4_35 = 1071
        L5_36 = "UILuaCommands.BINGOAnimeStart"
        L6_37 = "UILuaCommands.BINGOAnimeStop"
        break
      elseif L7_38 == 2 then
      elseif L7_38 == 3 then
      elseif L7_38 == 4 then
      else
      end
      if L7_38 == 5 then
        L4_35 = 1071
        break
      elseif L7_38 == 1 then
      elseif L7_38 == 6 then
      elseif L7_38 == 8 then
      else
      end
      if L7_38 == 9 then
        L4_35 = nil
        break
      else
      end
    else
      if A2_33 == 3 then
        L7_38 = A3_34
        if L7_38 == 7 then
          L4_35 = 1077
          L5_36 = "UILuaCommands.BINGOAnimeStart"
          L6_37 = "UILuaCommands.BINGOAnimeStop"
          break
        elseif L7_38 == 2 then
        elseif L7_38 == 3 then
        elseif L7_38 == 4 then
        else
        end
        if L7_38 == 5 then
          L4_35 = 1077
          break
        elseif L7_38 == 1 then
        elseif L7_38 == 6 then
        elseif L7_38 == 8 then
        else
        end
        if L7_38 == 9 then
          L4_35 = nil
        else
        end
      else
      end
    end
  elseif A1_32 == 2 then
    if A2_33 == 1 then
      L7_38 = A3_34
      if L7_38 == 1 then
        L4_35 = nil
        break
      else
      end
      if L7_38 == 2 then
        L4_35 = 1065
        L5_36 = "UILuaCommands.BINGOAnimeStart"
        L6_37 = "UILuaCommands.BINGOAnimeStop"
        break
      else
      end
    elseif A2_33 == 2 then
      L7_38 = A3_34
      if L7_38 == 1 then
        L4_35 = nil
        break
      else
      end
      if L7_38 == 2 then
        L4_35 = 1071
        L5_36 = "UILuaCommands.BINGOAnimeStart"
        L6_37 = "UILuaCommands.BINGOAnimeStop"
        break
      else
      end
    else
      if A2_33 == 3 then
        L7_38 = A3_34
        if L7_38 == 1 then
          L4_35 = nil
          break
        else
        end
        if L7_38 == 2 then
          L4_35 = 1077
          L5_36 = "UILuaCommands.BINGOAnimeStart"
          L6_37 = "UILuaCommands.BINGOAnimeStop"
        else
        end
      else
      end
    end
  else
    if A1_32 == 3 then
      if A2_33 == 1 then
        L7_38 = A3_34
        if L7_38 == 1 then
        else
        end
        if L7_38 == 2 then
          L4_35 = nil
          break
        else
        end
      elseif A2_33 == 2 then
        L7_38 = A3_34
        if L7_38 == 1 then
        else
        end
        if L7_38 == 2 then
          L4_35 = nil
          break
        else
        end
      else
        if A2_33 == 3 then
          L7_38 = A3_34
          if L7_38 == 1 then
          else
          end
          if L7_38 == 2 then
            L4_35 = nil
          end
        else
        end
      end
    else
    end
  end
  L7_38 = L4_35
  L8_39 = L5_36
  L9_40 = L6_37
  return L7_38, L8_39, L9_40
end
function HamletDefenseTutorialWidget.getGuideText(A0_41, A1_42, A2_43, A3_44)
  local L4_45, L5_46
  if A1_42 == 1 then
    L5_46 = A3_44
    if L5_46 == 1 then
      L4_45 = 11108
      break
    else
    end
    if L5_46 == 2 then
      L4_45 = 11109
      break
    else
    end
    if L5_46 == 3 then
      L4_45 = 11110
      break
    else
    end
    if L5_46 == 4 then
      L4_45 = 11111
      break
    else
    end
    if L5_46 == 5 then
      L4_45 = 11112
      break
    else
    end
    if L5_46 == 6 then
      L4_45 = 11114
      break
    else
    end
    if L5_46 == 7 then
      L4_45 = 11115
      break
    else
    end
    if L5_46 == 8 then
      L4_45 = 11116
      break
    else
    end
    if L5_46 == 9 then
      L4_45 = 11117
      break
    else
    end
  elseif A1_42 == 2 then
    L5_46 = A3_44
    if L5_46 == 1 then
      L4_45 = 11116
      break
    else
    end
    if L5_46 == 2 then
      L4_45 = 11117
      break
    else
    end
  else
    if A1_42 == 3 then
      L5_46 = A3_44
      if L5_46 == 1 then
        L4_45 = 11114
        break
      else
      end
      if L5_46 == 2 then
        L4_45 = 11115
      else
      end
    else
    end
  end
  return L4_45
end
function HamletDefenseTutorialWidget.getPageMax(A0_47, A1_48)
  local L2_49, L3_50
  L3_50 = A1_48
  if L3_50 == 1 then
    L2_49 = 9
    break
  else
  end
  if L3_50 == 2 then
    L2_49 = 2
    break
  else
  end
  if L3_50 == 3 then
    L2_49 = 2
    break
  else
  end
  return L2_49
end
function HamletDefenseTutorialWidget.getPageName(A0_51, A1_52, A2_53)
  local L3_54, L4_55, L5_56, L6_57
  L6_57 = A1_52
  if L6_57 == 1 then
    if A2_53 == 1 then
    elseif A2_53 == 2 then
    elseif A2_53 == 3 then
    elseif A2_53 == 4 then
    else
    end
    if A2_53 == 5 then
      L3_54 = "Grid_All_" .. tostring(A2_53)
      L4_55 = "IconControl_" .. tostring(A2_53)
      L5_56 = "Label_All_" .. tostring(A2_53)
      break
    else
    end
    if A2_53 == 6 then
      L3_54 = "Grid_DisciplesOfTheLand_" .. tostring(1)
      L4_55 = "IconControl_DisciplesOfTheLand_" .. tostring(1)
      L5_56 = "Label_DisciplesOfTheLand_" .. tostring(1)
      break
    else
    end
    if A2_53 == 7 then
      L3_54 = "Grid_DisciplesOfTheLand_" .. tostring(2)
      L4_55 = "IconControl_DisciplesOfTheLand_" .. tostring(2)
      L5_56 = "Label_DisciplesOfTheLand_" .. tostring(2)
      break
    else
    end
    if A2_53 == 8 then
      L3_54 = "Grid_DisciplesOfTheHand_" .. tostring(1)
      L4_55 = "IconControl_DisciplesOfTheHand_" .. tostring(1)
      L5_56 = "Label_DisciplesOfTheHand_" .. tostring(1)
      break
    else
    end
    if A2_53 == 9 then
      L3_54 = "Grid_DisciplesOfTheHand_" .. tostring(2)
      L4_55 = "IconControl_DisciplesOfTheHand_" .. tostring(2)
      L5_56 = "Label_DisciplesOfTheHand_" .. tostring(2)
      do break end
      do break end
      do break end
      else
      end
      if L6_57 == 3 then
        L3_54 = "Grid_DisciplesOfTheLand_" .. tostring(A2_53)
        L4_55 = "IconControl_DisciplesOfTheLand_" .. tostring(A2_53)
        L5_56 = "Label_DisciplesOfTheLand_" .. tostring(A2_53)
        break
      else
      end
      if L6_57 == 2 then
        L3_54 = "Grid_DisciplesOfTheHand_" .. tostring(A2_53)
        L4_55 = "IconControl_DisciplesOfTheHand_" .. tostring(A2_53)
        L5_56 = "Label_DisciplesOfTheHand_" .. tostring(A2_53)
      else
      end
    else
    end
  L6_57 = L3_54
  return L6_57, L4_55, L5_56
end
