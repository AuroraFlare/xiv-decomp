require("/Widget/WidgetBaseClass")
_defineClass("PcMatchingViewWidget", "WidgetBaseClass")
function PcMatchingViewWidget.init(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = A0_0.work
  L5_5 = {
    {
      "chosenOperation",
      "integer8"
    },
    {"mode", "integer8"},
    {"canJoin", "boolean"},
    {
      "returnFromEvent",
      "boolean"
    },
    {"dataget", "boolean"},
    {"timeout", "integer32"}
  }
  L4_4._temp = L5_5
  L4_4 = A0_0.work
  L4_4.chosenOperation = 0
  L4_4 = A0_0.work
  L4_4.canJoin = false
  L4_4 = A0_0.work
  L4_4.dataget = false
  L4_4 = A0_0.work
  L5_5 = worldMaster
  L5_5 = L5_5._getServerTime
  L5_5 = L5_5(L5_5)
  L4_4.timeout = L5_5
  L5_5 = A0_0
  L4_4 = A0_0.setCancelCondition
  L4_4(L5_5)
  L5_5 = A0_0
  L4_4 = A0_0.setCloseCondition
  L4_4(L5_5)
  L5_5 = A0_0
  L4_4 = A0_0.setConfirmCondition
  L4_4(L5_5, "Button_Operate")
  L5_5 = A0_0
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, "Button_Operate", "UILuaCommands.PropertyChanged")
  L5_5 = A0_0
  L4_4 = A0_0.setConfirmCondition
  L4_4(L5_5, "Button_Tell")
  L5_5 = A0_0
  L4_4 = A0_0.setVisibility
  L4_4(L5_5, "Button_Tell", false)
  L5_5 = A0_0
  L4_4 = A0_0.setModal
  L4_4(L5_5, true)
  L5_5 = A0_0
  L4_4 = A0_0.setDrag
  L4_4(L5_5, true)
  if A1_1 ~= nil then
    L4_4 = A0_0.work
    L4_4.mode = A1_1
  end
  L4_4 = A2_2
  if L4_4 == nil then
    L4_4 = -1
  end
  L5_5 = 0
  if A0_0.work.mode == 0 then
    A0_0:setUserWorkInt(4, nil, "Button_Operate", L4_4)
    if desktopWidget:countPartyMember() <= 1 then
      if desktopWidget:getPlayerConfirmGroupCommandVariation() == 10001 or desktopWidget:getPlayerConfirmGroupCommandVariation() == 10002 then
        A0_0:setContent("Button_Operate", 2932)
      else
        if A3_3 ~= 99 then
          A0_0:setContent("Button_Operate", 2931)
        else
          A0_0:setContent("Button_Operate", 2943)
        end
        A0_0:setVisibility("Button_Tell", true)
        A0_0.work.canJoin = true
        A0_0:setFocus("Button_Tell")
      end
    elseif desktopWidget:isMyPartyLeaderForMyPlayer() == true and A3_3 == 99 then
      A0_0:setContent("Button_Operate", 2943)
      A0_0.work.canJoin = true
      A0_0:setVisibility("Button_Tell", true)
    else
      A0_0:setContent("Button_Operate", 2932)
    end
  elseif A0_0.work.mode == 1 then
    A0_0:setUserWorkInt(4, nil, "Button_Operate", L4_4)
    A0_0:setContent("Button_Operate", 2932)
  elseif A0_0.work.mode == 2 then
    A0_0:setUserWorkInt(4, nil, "Button_Operate", L4_4)
    A0_0:setContent("Button_Operate", 2930)
  end
  if L5_5 > 0 then
    A0_0:setHelpParameter("Button_Operate", 0, L5_5)
  end
  A0_0:setModal(true)
  A0_0:setDrag(true)
  A0_0:setVisibility("Grid_People", false)
  A0_0:setVisibility("Grid_Comment", false)
  A0_0:setSignal(1)
  A0_0.work.returnFromEvent = false
end
function PcMatchingViewWidget.processBeforeShow(A0_6, A1_7)
  if A1_7 == true then
    A0_6.work.returnFromEvent = true
  end
  return true
end
function PcMatchingViewWidget.setFocus(A0_8, A1_9)
  if A1_9 ~= nil and A1_9 ~= "" then
    A0_8:setLogicalFocus(A1_9)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_8 then
      A0_8:setKeyboardFocusedControl(A1_9)
    end
  end
end
function PcMatchingViewWidget.displayData(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25
  L2_12 = A0_10
  L1_11 = A0_10.getParameter
  L3_13 = "Name"
  L1_11 = L1_11(L2_12, L3_13)
  if L1_11 == nil or L1_11 == "" then
    L1_11 = " "
  end
  L3_13 = A0_10
  L2_12 = A0_10.setText
  L4_14 = "TextBlock_PersonName_2"
  L2_12(L3_13, L4_14, L5_15, L6_16)
  L3_13 = A0_10
  L2_12 = A0_10.getParameter
  L4_14 = "Purpose"
  L2_12 = L2_12(L3_13, L4_14)
  if L2_12 == 0 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 2 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 3 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 1 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 15 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 16 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 17 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 19 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 34 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 20 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 18 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 32 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 31 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 35 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 33 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
  elseif L2_12 == 99 then
    L4_14 = A0_10
    L3_13 = A0_10.setText
    L3_13(L4_14, L5_15, L6_16)
    L3_13 = A0_10.work
    L3_13 = L3_13.mode
    if L3_13 == 0 then
      L3_13 = desktopWidget
      L4_14 = L3_13
      L3_13 = L3_13.isMyPartyLeaderForMyPlayer
      L3_13 = L3_13(L4_14)
      if L3_13 == true then
      end
    end
  end
  L4_14 = A0_10
  L3_13 = A0_10.getParameter
  L3_13 = L3_13(L4_14, L5_15)
  if L3_13 == 0 then
    L4_14 = A0_10.setText
    L4_14(L5_15, L6_16, L7_17)
    L4_14 = A0_10.setEnable
    L4_14(L5_15, L6_16, L7_17)
  else
    L4_14 = A0_10.setEnable
    L4_14(L5_15, L6_16, L7_17)
    if L2_12 == 2 then
      L4_14 = A0_10.setText
      L8_18 = L3_13
      L4_14(L5_15, L6_16, L7_17, L8_18)
    elseif L2_12 == 3 then
      L4_14 = A0_10.setText
      L8_18 = L3_13
      L4_14(L5_15, L6_16, L7_17, L8_18)
    elseif L2_12 == 1 then
      L4_14 = A0_10.setText
      L8_18 = L3_13
      L4_14(L5_15, L6_16, L7_17, L8_18)
    elseif L2_12 == 15 or L2_12 == 19 then
      L4_14 = A0_10.setText
      L8_18 = L3_13
      L4_14(L5_15, L6_16, L7_17, L8_18)
    elseif L2_12 == 16 then
      if L3_13 == 111433 or L3_13 == 111633 or L3_13 == 111833 or L3_13 == 110870 then
        L4_14 = A0_10.setText
        L8_18 = L3_13
        L4_14(L5_15, L6_16, L7_17, L8_18)
      else
        L4_14 = A0_10.setText
        L8_18 = L3_13
        L4_14(L5_15, L6_16, L7_17, L8_18)
      end
    elseif L2_12 == 17 then
      L4_14 = 0
      if L3_13 == 1125 then
        L4_14 = 1
      elseif L3_13 == 3521 then
        L4_14 = 2
      elseif L3_13 == 4503 then
        L4_14 = 3
      elseif L3_13 == 5009 then
        L4_14 = 4
      end
      if L4_14 ~= 0 then
        L8_18 = 2967
        L9_19 = L3_13
        L10_20 = L4_14
        L5_15(L6_16, L7_17, L8_18, L9_19, L10_20)
      else
        L8_18 = 2922
        L5_15(L6_16, L7_17, L8_18)
      end
    elseif L2_12 == 34 then
      L4_14 = 0
      if L3_13 == 1280005 then
        L4_14 = 1031
      elseif L3_13 == 1280003 then
        L4_14 = 1030
      elseif L3_13 == 1280066 then
        L4_14 = 2004
      elseif L3_13 == 1280073 then
        L4_14 = 2003
      elseif L3_13 == 1280034 then
        L4_14 = 3043
      elseif L3_13 == 1280033 then
        L4_14 = 3044
      end
      L8_18 = 2966
      L9_19 = L3_13
      L10_20 = L4_14
      L5_15(L6_16, L7_17, L8_18, L9_19, L10_20)
    elseif L2_12 == 20 then
      if L3_13 == 0 then
        L4_14 = A0_10.setText
        L4_14(L5_15, L6_16, L7_17)
      else
        L4_14 = A0_10.setTextByOwner
        L8_18 = L3_13
        L4_14(L5_15, L6_16, L7_17, L8_18)
      end
    elseif L2_12 == 18 then
      L4_14 = A0_10.setText
      L8_18 = L3_13
      L4_14(L5_15, L6_16, L7_17, L8_18)
    elseif L2_12 == 31 then
      L4_14 = 2922
      if L3_13 == 101 then
      elseif L3_13 == 102 then
        L4_14 = 2965
      elseif L3_13 == 103 then
      end
      L8_18 = L4_14
      L5_15(L6_16, L7_17, L8_18)
    end
  end
  L4_14 = A0_10.getParameter
  L4_14 = L4_14(L5_15, L6_16)
  if L4_14 == 0 then
    L8_18 = 2921
    L5_15(L6_16, L7_17, L8_18)
  elseif L4_14 > 1280000 then
    L8_18 = 211
    L9_19 = L4_14
    L5_15(L6_16, L7_17, L8_18, L9_19)
  else
    L8_18 = 204
    L9_19 = L4_14
    L5_15(L6_16, L7_17, L8_18, L9_19)
  end
  for L8_18 = 1, 4 do
    L10_20 = A0_10
    L9_19 = A0_10.getParameter
    L11_21 = "NumberOfPeople"
    L12_22 = L8_18
    L9_19 = L9_19(L10_20, L11_21, L12_22)
    if L9_19 == 0 then
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_People_"
      L13_23 = tostring
      L14_24 = L8_18
      L13_23 = L13_23(L14_24)
      L12_22 = L12_22 .. L13_23
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
    else
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_People_"
      L13_23 = tostring
      L14_24 = L8_18
      L13_23 = L13_23(L14_24)
      L12_22 = L12_22 .. L13_23
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.getParameter
      L12_22 = "Cate"
      L13_23 = L8_18
      L10_20 = L10_20(L11_21, L12_22, L13_23)
      L12_22 = A0_10
      L11_21 = A0_10.getParameter
      L13_23 = "Skill"
      L14_24 = L8_18
      L11_21 = L11_21(L12_22, L13_23, L14_24)
      L12_22 = "TextBlock_Skill_"
      L13_23 = tostring
      L14_24 = L8_18
      L13_23 = L13_23(L14_24)
      L12_22 = L12_22 .. L13_23
      if L10_20 == 0 then
        L14_24 = A0_10
        L13_23 = A0_10.setText
        L15_25 = L12_22
        L13_23(L14_24, L15_25, 2923)
      elseif L11_21 == 0 then
        if L10_20 == 1 then
          L14_24 = A0_10
          L13_23 = A0_10.setText
          L15_25 = L12_22
          L13_23(L14_24, L15_25, 100701)
        elseif L10_20 == 21 then
          L14_24 = A0_10
          L13_23 = A0_10.setText
          L15_25 = L12_22
          L13_23(L14_24, L15_25, 100702)
        elseif L10_20 == 39 then
          L14_24 = A0_10
          L13_23 = A0_10.setText
          L15_25 = L12_22
          L13_23(L14_24, L15_25, 100703)
        elseif L10_20 == 29 then
          L14_24 = A0_10
          L13_23 = A0_10.setText
          L15_25 = L12_22
          L13_23(L14_24, L15_25, 100704)
        end
      else
        L14_24 = A0_10
        L13_23 = A0_10.setText
        L15_25 = L12_22
        L13_23(L14_24, L15_25, 206, L11_21)
      end
      L14_24 = A0_10
      L13_23 = A0_10.getParameter
      L15_25 = "RankFrom"
      L13_23 = L13_23(L14_24, L15_25, L8_18)
      if L13_23 == 0 then
        L15_25 = A0_10
        L14_24 = A0_10.setHidden
        L14_24(L15_25, "TextBlock_RankFrom_" .. tostring(L8_18))
      else
        L15_25 = A0_10
        L14_24 = A0_10.setText
        L14_24(L15_25, "TextBlock_RankFrom_" .. tostring(L8_18), tostring(L13_23))
        L15_25 = A0_10
        L14_24 = A0_10.setVisibility
        L14_24(L15_25, "TextBlock_RankFrom_" .. tostring(L8_18), true)
      end
      L15_25 = A0_10
      L14_24 = A0_10.getParameter
      L14_24 = L14_24(L15_25, "RankTo", L8_18)
      if L14_24 == 0 then
        L15_25 = A0_10.setHidden
        L15_25(A0_10, "TextBlock_RankTo_" .. tostring(L8_18))
      else
        L15_25 = A0_10.setText
        L15_25(A0_10, "TextBlock_RankTo_" .. tostring(L8_18), tostring(L14_24))
        L15_25 = A0_10.setVisibility
        L15_25(A0_10, "TextBlock_RankTo_" .. tostring(L8_18), true)
      end
      if L13_23 == 0 and L14_24 == 0 then
        L15_25 = A0_10.setText
        L15_25(A0_10, "TextBlock_RankFrom_" .. tostring(L8_18), "1")
        L15_25 = A0_10.setVisibility
        L15_25(A0_10, "TextBlock_RankFrom_" .. tostring(L8_18), true)
      end
      L15_25 = A0_10.getParameter
      L15_25 = L15_25(A0_10, "NumberOfCurrent", L8_18)
      A0_10:setText("TextBlock_NumberOfPeople_" .. tostring(L8_18), 228, L15_25, L9_19)
      if L15_25 == L9_19 then
        A0_10:setVisibility("TextBlock_Fixed_" .. tostring(L8_18), true)
      else
        A0_10:setHidden("TextBlock_Fixed_" .. tostring(L8_18))
      end
      A0_10:setText("TextBlock_ToMark_" .. tostring(L8_18), "\239\189\158")
    end
  end
  if L2_12 == 99 then
    L8_18 = 2945
    L5_15(L6_16, L7_17, L8_18)
    L8_18 = false
    L5_15(L6_16, L7_17, L8_18)
    L8_18 = false
    L5_15(L6_16, L7_17, L8_18)
    L5_15(L6_16, L7_17)
    L5_15(L6_16, L7_17)
    L8_18 = 1
    L9_19 = 75457
    L5_15(L6_16, L7_17, L8_18, L9_19)
    L8_18 = 1
    L9_19 = 75458
    L5_15(L6_16, L7_17, L8_18, L9_19)
    L8_18 = 1
    L8_18 = "TextBlock_RankFrom_1"
    L9_19 = tostring
    L10_20 = L5_15
    L15_25 = L9_19(L10_20)
    L6_16(L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25, L9_19(L10_20))
    L8_18 = "TextBlock_Skill_1"
    L9_19 = 206
    L11_21 = A0_10
    L10_20 = A0_10.getParameter
    L12_22 = "Skill"
    L13_23 = 2
    L15_25 = L10_20(L11_21, L12_22, L13_23)
    L6_16(L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25, L10_20(L11_21, L12_22, L13_23))
    L8_18 = "Grid_People_2"
    L9_19 = false
    L6_16(L7_17, L8_18, L9_19)
    L8_18 = "Grid_People_3"
    L9_19 = false
    L6_16(L7_17, L8_18, L9_19)
    L8_18 = "Grid_People_4"
    L9_19 = false
    L6_16(L7_17, L8_18, L9_19)
  else
  end
  L8_18 = true
  L5_15(L6_16, L7_17, L8_18)
  if L5_15 == "" then
    L8_18 = "TextBlock_Comment"
    L9_19 = "SqwtDesignData.StringValue2"
    L10_20 = "True"
    L6_16(L7_17, L8_18, L9_19, L10_20)
    L8_18 = "TextBlock_Comment"
    L9_19 = 2917
    L6_16(L7_17, L8_18, L9_19)
  else
  end
  L8_18 = "Grid_Comment"
  L9_19 = true
  L6_16(L7_17, L8_18, L9_19)
  L8_18 = "RemainTime"
  L8_18 = A0_10
  L9_19 = "TextBlock_RemainTime"
  L10_20 = 2934
  L11_21 = L6_16
  L7_17(L8_18, L9_19, L10_20, L11_21)
  return
end
function PcMatchingViewWidget.getParameter(A0_26, A1_27, A2_28)
  if A1_27 == "Purpose" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_Purpose")
  elseif A1_27 == "Place" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_Place")
  elseif A1_27 == "GLName" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_GLName")
  elseif A1_27 == "NumberOfPeople" then
    return A0_26:getUserWorkInt(4, nil, "TextBlock_NumberOfPeople_" .. tostring(A2_28))
  elseif A1_27 == "NumberOfCurrent" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_NumberOfPeople_" .. tostring(A2_28))
  elseif A1_27 == "Cate" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_Skill_" .. tostring(A2_28))
  elseif A1_27 == "Skill" then
    return A0_26:getUserWorkInt(4, nil, "TextBlock_Skill_" .. tostring(A2_28))
  elseif A1_27 == "RankFrom" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_RankFrom_" .. tostring(A2_28))
  elseif A1_27 == "RankTo" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_RankTo_" .. tostring(A2_28))
  elseif A1_27 == "Comment" then
    return A0_26:getText("TextBlock_Comment")
  elseif A1_27 == "Name" then
    return A0_26:getText("TextBlock_PersonName")
  elseif A1_27 == "RemainTime" then
    return A0_26:getUserWorkInt(3, nil, "TextBlock_RemainTime")
  end
  return
end
function PcMatchingViewWidget.closeAndBackToParent(A0_29, A1_30, A2_31)
  if A0_29:_getParentWidget() == nil then
    return
  end
  A0_29:setModal(false)
  A0_29.work.chosenOperation = -1
  A0_29:_getParentWidget():closeViewWidget(A1_30, A2_31)
  return
end
function PcMatchingViewWidget.processUICommandClose(A0_32, A1_33, A2_34, A3_35, A4_36)
  if A0_32.work.dataget == false or A0_32.work.timeout > worldMaster:_getServerTime() - 2 then
    return
  end
  if 2 > A0_32:getSignal() and A0_32.work.returnFromEven == false then
    return
  end
  if A0_32:getSignal() == 3 or A0_32:getSignal() == 1 then
    return
  end
  if A0_32.work.mode == 0 then
    return A0_32:closeAndBackToParent()
  else
    return desktopWidget:closeWidgetDirect(A0_32)
  end
  if A0_32.work.returnFromEvent == true and A0_32.work.dataget == true then
    if A0_32.work.mode == 0 then
      return A0_32:closeAndBackToParent()
    else
      return desktopWidget:closeWidgetDirect(A0_32)
    end
  end
end
function PcMatchingViewWidget.processUICommandCancel(A0_37, A1_38, A2_39, A3_40, A4_41)
  if A0_37.work.dataget == false or A0_37.work.timeout > worldMaster:_getServerTime() - 2 then
    return
  end
  if 2 > A0_37:getSignal() and A0_37.work.returnFromEven == false then
    return
  end
  if A0_37.work.returnFromEvent == true and A0_37.work.dataget == true then
    if A0_37.work.mode == 0 then
      return A0_37:closeAndBackToParent()
    else
      return desktopWidget:closeWidgetDirect(A0_37)
    end
  end
  if A0_37:getSignal() == 3 or A0_37:getSignal() == 1 then
    return
  end
  if A0_37.work.mode == 0 then
    return A0_37:closeAndBackToParent()
  else
    return desktopWidget:closeWidgetDirect(A0_37)
  end
end
function PcMatchingViewWidget.processUICommandOperate(A0_42, A1_43, A2_44, A3_45, A4_46)
  local L5_47
  L5_47 = A0_42.work
  L5_47 = L5_47.dataget
  if L5_47 == false then
    return
  end
  L5_47 = A0_42.work
  L5_47 = L5_47.returnFromEvent
  if L5_47 == true then
    L5_47 = A0_42.work
    L5_47 = L5_47.dataget
    if L5_47 == true then
      L5_47 = A0_42.work
      L5_47 = L5_47.mode
      if L5_47 == 0 then
        L5_47 = A0_42.closeAndBackToParent
        return L5_47(A0_42)
      else
        L5_47 = desktopWidget
        L5_47 = L5_47.closeWidgetDirect
        return L5_47(L5_47, A0_42)
      end
    end
  end
  L5_47 = A0_42.work
  L5_47 = L5_47.chosenOperation
  if L5_47 ~= 0 then
    return
  end
  L5_47 = A0_42.getSignal
  L5_47 = L5_47(A0_42)
  if L5_47 < 2 then
    L5_47 = A0_42.work
    L5_47 = L5_47.returnFromEven
    if L5_47 == false then
      return
    end
  end
  if A2_44 == "Button_Operate" then
    L5_47 = A0_42.work
    L5_47 = L5_47.mode
    if L5_47 == 0 then
      L5_47 = desktopWidget
      L5_47 = L5_47.countPartyMember
      L5_47 = L5_47(L5_47)
      if L5_47 <= 1 then
        L5_47 = A0_42.work
        L5_47 = L5_47.canJoin
        if L5_47 == true then
          L5_47 = A0_42.getParameter
          L5_47 = L5_47(A0_42, "Purpose")
          if L5_47 == 99 then
            L5_47 = A0_42.getParameter
            L5_47 = L5_47(A0_42, "Name")
            if desktopWidget:executePlayerPartyInviteByName(L5_47) == true then
              if A0_42:_getParentWidget() ~= nil then
                A0_42:hide()
                A0_42:_getParentWidget():hide()
                return A0_42:_getParentWidget():closeViewWidget(true, true)
              else
                do return desktopWidget:closeWidgetDirect(A0_42) end
                else
                  L5_47 = A0_42.setSignal
                  L5_47(A0_42, 3)
                  L5_47 = A0_42.getPartyRoot
                  L5_47 = L5_47(A0_42)
                  if L5_47 ~= nil then
                    L5_47:updateChildWidgetStatus("PcMatchingViewWidget", 3)
                  end
                end
                else
                  L5_47 = desktopWidget
                  L5_47 = L5_47.closeWidgetDirect
                  return L5_47(L5_47, A0_42)
                end
                else
                  L5_47 = desktopWidget
                  L5_47 = L5_47.isMyPartyLeaderForMyPlayer
                  L5_47 = L5_47(L5_47)
                  if L5_47 == true then
                    L5_47 = A0_42.getParameter
                    L5_47 = L5_47(A0_42, "Purpose")
                    if L5_47 == 99 then
                      L5_47 = A0_42.getParameter
                      L5_47 = L5_47(A0_42, "Name")
                      if desktopWidget:executePlayerPartyInviteByName(L5_47) == true then
                        if A0_42:_getParentWidget() ~= nil then
                          A0_42:hide()
                          A0_42:_getParentWidget():hide()
                          return A0_42:_getParentWidget():closeViewWidget(true, true)
                        else
                          do return desktopWidget:closeWidgetDirect(A0_42) end
                          else
                            L5_47 = desktopWidget
                            L5_47 = L5_47.closeWidgetDirect
                            return L5_47(L5_47, A0_42)
                          end
                          else
                            L5_47 = A0_42.work
                            L5_47 = L5_47.mode
                            if L5_47 == 1 then
                              L5_47 = desktopWidget
                              L5_47 = L5_47.closeWidgetDirect
                              return L5_47(L5_47, A0_42)
                            else
                              L5_47 = A0_42.work
                              L5_47 = L5_47.mode
                              if L5_47 == 2 then
                                L5_47 = A0_42.setSignal
                                L5_47(A0_42, 3)
                                L5_47 = A0_42.getPartyRoot
                                L5_47 = L5_47(A0_42)
                                if L5_47 ~= nil then
                                  L5_47:updateChildWidgetStatus("PcMatchingViewWidget", 3)
                                end
                              end
                            end
                          end
                          elseif A2_44 == "Button_Tell" then
                            L5_47 = A0_42.setLogicalFocus
                            L5_47(A0_42, A2_44)
                            L5_47 = A0_42.sendTellFormat
                            return L5_47(A0_42)
                          end
                        end
                      else
                      end
                    end
                end
              end
            else
            end
end
function PcMatchingViewWidget.processUICommandDefault(A0_48, A1_49, A2_50, A3_51, A4_52, A5_53)
  local L6_54, L7_55, L8_56
  if A3_51 == "UILuaCommands.PropertyChanged" then
    L7_55 = A0_48
    L6_54 = A0_48.getSignal
    L6_54 = L6_54(L7_55)
    if L6_54 == 2 then
      L7_55 = A0_48
      L6_54 = A0_48.getPartyRoot
      L6_54 = L6_54(L7_55)
      if L6_54 ~= nil then
        L8_56 = L6_54
        L7_55 = L6_54.updateChildWidgetStatus
        L7_55(L8_56, "PcMatchingViewWidget", 2)
      end
      L8_56 = A0_48
      L7_55 = A0_48.displayData
      L7_55(L8_56)
      L7_55 = A0_48.work
      L7_55.dataget = true
    end
    L7_55 = A0_48
    L6_54 = A0_48.getSignal
    L6_54 = L6_54(L7_55)
    if L6_54 == 4 then
      L7_55 = A0_48
      L6_54 = A0_48.getPartyRoot
      L6_54 = L6_54(L7_55)
      if L6_54 ~= nil then
        L8_56 = L6_54
        L7_55 = L6_54.updateChildWidgetStatus
        L7_55(L8_56, "PcMatchingViewWidget", 4)
      end
      L7_55 = A0_48.work
      L7_55 = L7_55.mode
      if L7_55 == 0 then
        L8_56 = A0_48
        L7_55 = A0_48.getParameter
        L7_55 = L7_55(L8_56, "Purpose")
        if L7_55 == 99 then
        else
          L8_56 = desktopWidget
          L8_56 = L8_56.countPartyMember
          L8_56 = L8_56(L8_56)
          if L8_56 <= 1 then
            L8_56 = A0_48.getParameter
            L8_56 = L8_56(A0_48, "Name")
            if desktopWidget:executePlayerPartyJoin(L8_56) == true then
            else
            end
            if A0_48:_getParentWidget() ~= nil then
              A0_48:hide()
              A0_48:_getParentWidget():hide()
              return A0_48:_getParentWidget():closeViewWidget(true, true)
            else
              return desktopWidget:closeWidgetDirect(A0_48)
            end
          end
        end
      else
        L7_55 = A0_48.work
        L7_55 = L7_55.mode
        if L7_55 == 2 then
          L8_56 = A0_48
          L7_55 = A0_48.getPartyRoot
          L7_55 = L7_55(L8_56)
          if L7_55 ~= nil then
            L8_56 = desktopWidget
            L8_56 = L8_56.closeWidgetDirect
            L8_56(L8_56, L7_55)
          else
            L8_56 = A0_48.closeAndBackToParent
            return L8_56(A0_48, true, true)
          end
        else
          L7_55 = desktopWidget
          L8_56 = L7_55
          L7_55 = L7_55.closeWidgetDirect
          return L7_55(L8_56, A0_48)
        end
      end
    end
    L7_55 = A0_48
    L6_54 = A0_48.getSignal
    L6_54 = L6_54(L7_55)
    if L6_54 == 5 then
      L7_55 = A0_48
      L6_54 = A0_48.getPartyRoot
      L6_54 = L6_54(L7_55)
      if L6_54 ~= nil then
        L8_56 = L6_54
        L7_55 = L6_54.updateChildWidgetStatus
        L7_55(L8_56, "PcMatchingViewWidget", 5)
        L7_55 = A0_48.work
        L7_55 = L7_55.mode
        if L7_55 == 1 then
          L8_56 = A0_48
          L7_55 = A0_48.closeAndBackToParent
          return L7_55(L8_56, true, true)
        end
      end
      L7_55 = A0_48.work
      L7_55 = L7_55.mode
      if L7_55 == 0 then
        L8_56 = A0_48
        L7_55 = A0_48.closeAndBackToParent
        return L7_55(L8_56, true, true)
      else
        L7_55 = desktopWidget
        L8_56 = L7_55
        L7_55 = L7_55.closeWidgetDirect
        return L7_55(L8_56, A0_48)
      end
    end
  end
  L6_54 = A0_48.work
  L6_54 = L6_54.returnFromEvent
  if L6_54 == true then
    L6_54 = A0_48.work
    L6_54 = L6_54.mode
    if L6_54 == 0 then
      L7_55 = A0_48
      L6_54 = A0_48.closeAndBackToParent
      return L6_54(L7_55)
    else
      L6_54 = desktopWidget
      L7_55 = L6_54
      L6_54 = L6_54.closeWidgetDirect
      L8_56 = A0_48
      return L6_54(L7_55, L8_56)
    end
  end
end
function PcMatchingViewWidget.updateJoinButton(A0_57)
  local L1_58, L2_59, L3_60, L4_61
  L1_58 = A0_57.work
  L1_58 = L1_58.mode
  if L1_58 == 0 then
    L1_58 = desktopWidget
    L2_59 = L1_58
    L1_58 = L1_58.getPlayerConfirmGroupCommandVariation
    L3_60 = L1_58(L2_59)
    L4_61 = nil
    if L1_58 == 10001 or L1_58 == 10002 then
      A0_57:setContent("Button_Operate", 2932)
      L4_61 = 75455
      A0_57.work.canJoin = false
    else
      A0_57:setContent("Button_Operate", 2931)
      L4_61 = 75456
      A0_57.work.canJoin = true
    end
    A0_57:setHelpParameter("Button_Operate", 0, L4_61)
  end
end
function PcMatchingViewWidget.getPartyRoot(A0_62)
  return A0_62:_getParentWidget():getPartyRoot()
end
function PcMatchingViewWidget.sendTellFormat(A0_63)
  local L1_64
  L1_64 = A0_63.getText
  L1_64 = L1_64(A0_63, "TextBlock_PersonName")
  return desktopWidget:setTellAddress(L1_64)
end
function PcMatchingViewWidget.getViewMode(A0_65)
  return A0_65.work.mode
end
function PcMatchingViewWidget.getSignal(A0_66)
  return A0_66:getUserWorkInt(3, nil, "Button_Operate")
end
function PcMatchingViewWidget.setSignal(A0_67, A1_68)
  A0_67:setUserWorkInt(3, nil, "Button_Operate", A1_68)
end
function PcMatchingViewWidget.checkMySkill(A0_69, A1_70)
  if A0_69:getParameter("NumberOfPeople", A1_70) == 0 then
    return false
  end
  if A0_69:getParameter("NumberOfCurrent", A1_70) == A0_69:getParameter("NumberOfPeople", A1_70) then
    return false
  end
  if A0_69:getParameter("Cate", A1_70) == 0 then
    if A0_69:getParameter("RankFrom", A1_70) <= worldMaster:_getMyPlayer():getStateMainSkillLevel() and 100 >= worldMaster:_getMyPlayer():getStateMainSkillLevel() then
      return true
    else
      return false
    end
  elseif A0_69:getParameter("Skill", A1_70) == 0 then
    if A0_69:getParameter("Cate", A1_70) == worldMaster:_getMyPlayer():getMainSkillCategory() then
      if A0_69:getParameter("RankFrom", A1_70) <= worldMaster:_getMyPlayer():getStateMainSkillLevel() and 100 >= worldMaster:_getMyPlayer():getStateMainSkillLevel() then
        return true
      else
        return false
      end
    else
      return false
    end
  elseif A0_69:getParameter("Skill", A1_70) == worldMaster:_getMyPlayer():getMainClassOrJob() then
    if A0_69:getParameter("RankFrom", A1_70) <= worldMaster:_getMyPlayer():getStateMainSkillLevel() and 100 >= worldMaster:_getMyPlayer():getStateMainSkillLevel() then
      return true
    else
      return false
    end
  else
    return false
  end
end
