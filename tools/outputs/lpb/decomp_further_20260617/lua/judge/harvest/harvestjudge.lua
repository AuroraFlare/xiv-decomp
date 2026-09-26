require("/Judge/JudgeBaseClass")
_defineClass("HarvestJudge", "JudgeBaseClass")
function HarvestJudge.initText(A0_0)
  A0_0:_loadTextDataPermanently(1308, "harvestJudge")
end
function HarvestJudge.loadTextData(A0_1, A1_2, A2_3)
end
function HarvestJudge.targetCancel(A0_4, A1_5, A2_6)
  desktopWidget:cancelMainTargetCharacter()
end
function HarvestJudge.turnToTarget(A0_7, A1_8, A2_9, A3_10, A4_11)
  desktopWidget:cancelMainTargetCharacter()
  if _math.abs(A1_8:_getDir() - A4_11) >= 0.2 then
    A1_8:_turnDir(A4_11)
    if A3_10 == 22006 or A3_10 == 22007 or A3_10 == 22008 then
      A1_8:_waitForTurning()
    end
  end
end
function HarvestJudge.openInputWidget(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17
  L5_17 = false
  if A1_13:isPlayer() == true then
    if A3_15 == 22002 then
      L5_17 = desktopWidget:openEventModeWidgetYield("Ask/MiningInputWidget", A4_16)
    elseif A3_15 == 22003 then
      L5_17 = desktopWidget:openEventModeWidgetYield("Ask/FellingInputWidget", A4_16)
    elseif A3_15 == 22004 then
      L5_17 = desktopWidget:openEventModeWidgetYield("Ask/FishingInputWidget", A4_16)
    end
    if L5_17 == false then
    end
  else
  end
  return L5_17
end
function HarvestJudge.orderInputWidget(A0_18, A1_19, A2_20, A3_21, A4_22, A5_23)
  local L6_24
  L6_24 = false
  if A1_19:isPlayer() == true then
    if A5_23 == 22002 then
      L6_24 = desktopWidget:updateEventModeWidget("Ask/MiningInputWidget", A3_21, A4_22)
    elseif A5_23 == 22003 then
      L6_24 = desktopWidget:updateEventModeWidget("Ask/FellingInputWidget", A3_21, A4_22)
    elseif A5_23 == 22004 then
      L6_24 = desktopWidget:updateEventModeWidget("Ask/FishingInputWidget", A3_21, A4_22)
    end
    if L6_24 == false then
    end
  else
  end
  return L6_24
end
function HarvestJudge.askInputWidget(A0_25, A1_26, A2_27, A3_28, A4_29, A5_30, A6_31, A7_32, A8_33, A9_34)
  local L10_35, L11_36, L12_37, L13_38, L14_39, L15_40, L16_41
  L10_35 = 0
  L11_36 = 0
  L12_37 = false
  L13_38, L14_39, L15_40 = nil, nil, nil
  if A4_29 == 1 then
    if A3_28 == 22002 then
      L13_38 = 22701
    elseif A3_28 == 22003 then
      L13_38 = 22704
    elseif A3_28 == 22004 then
      L13_38 = 22711
    end
  elseif A3_28 == 22002 then
    L13_38 = 22703
  elseif A3_28 == 22003 then
    L13_38 = 22705
  elseif A3_28 == 22004 then
    if A6_31 == true and A7_32 == false then
      L13_38 = 22711
    elseif A6_31 == true and A7_32 == true then
      L13_38 = 22711
      L14_39 = 22708
    else
      L13_38 = 22708
    end
  end
  if A3_28 == 22002 then
    L15_40 = 22702
  elseif A3_28 == 22003 then
    L15_40 = 22706
  elseif A3_28 == 22004 then
    L15_40 = 22709
  end
  L16_41 = nil
  if A5_30 ~= 0 then
    L16_41 = 22710
  end
  if A1_26:isPlayer() == true then
    if A3_28 == 22002 then
      L12_37, L10_35, L11_36 = desktopWidget:selectEventModeWidgetYield("Ask/MiningInputWidget", L13_38, L14_39, L16_41, L15_40, nil, A4_29, nil, A9_34)
    elseif A3_28 == 22003 then
      L12_37, L10_35, L11_36 = desktopWidget:selectEventModeWidgetYield("Ask/FellingInputWidget", L13_38, L14_39, L16_41, L15_40, nil, A4_29, nil, A9_34)
    elseif A3_28 == 22004 then
      L12_37, L10_35, L11_36 = desktopWidget:selectEventModeWidgetYield("Ask/FishingInputWidget", L13_38, L14_39, L16_41, L15_40, nil, A4_29, A8_33, A9_34)
    end
    if L12_37 == false then
      L10_35 = 0
      L11_36 = 0
    end
  else
  end
  return L10_35, L11_36, L12_37
end
function HarvestJudge.textInputWidget(A0_42, A1_43, A2_44, A3_45, A4_46, A5_47, A6_48, A7_49, A8_50, A9_51)
  local L10_52, L11_53, L12_54
  if A5_47 == nil and A9_51 ~= 0 then
    A5_47 = 64
    A6_48 = A9_51
  end
  L10_52 = false
  L11_53 = nil
  L12_54 = A1_43.isPlayer
  L12_54 = L12_54(A1_43)
  if L12_54 == true then
    if A3_45 == 22002 then
      L12_54 = desktopWidget
      L12_54 = L12_54.getChildWidgetByWindowName
      L12_54 = L12_54(L12_54, "Ask/MiningInputWidget")
      L11_53 = L12_54
    elseif A3_45 == 22003 then
      L12_54 = desktopWidget
      L12_54 = L12_54.getChildWidgetByWindowName
      L12_54 = L12_54(L12_54, "Ask/FellingInputWidget")
      L11_53 = L12_54
    elseif A3_45 == 22004 then
      L12_54 = desktopWidget
      L12_54 = L12_54.getChildWidgetByWindowName
      L12_54 = L12_54(L12_54, "Ask/FishingInputWidget")
      L11_53 = L12_54
    end
    if L11_53 ~= nil then
      L12_54 = nil
      if A5_47 == 25 then
        L12_54 = A1_43:_createVirtualItem(A6_48, 1, 1):getItemIcon()
      end
      L11_53:orderHarvestOwnerMessageDisplay(A4_46, A5_47, A6_48, A7_49, A8_50, L12_54)
    else
    end
  else
  end
  return L10_52
end
function HarvestJudge.rangeInputWidget(A0_55, A1_56, A2_57, A3_58, A4_59, A5_60, A6_61, A7_62)
  local L8_63, L9_64
  L8_63 = false
  L9_64 = nil
  if A1_56:isPlayer() == true then
    if A3_58 == 22002 then
      L9_64 = desktopWidget:getChildWidgetByWindowName("Ask/MiningInputWidget")
    elseif A3_58 == 22003 then
      L9_64 = desktopWidget:getChildWidgetByWindowName("Ask/FellingInputWidget")
    elseif A3_58 == 22004 then
      L9_64 = desktopWidget:getChildWidgetByWindowName("Ask/FishingInputWidget")
    end
    if L9_64 ~= nil then
      L9_64:orderSweetSpotDisplay(A4_59, A5_60, A6_61, A7_62)
    else
    end
  else
  end
  return L8_63
end
function HarvestJudge.closeInputWidget(A0_65, A1_66, A2_67, A3_68)
  local L4_69
  L4_69 = false
  if A1_66:isPlayer() == true then
    if A3_68 == 22002 then
      L4_69 = desktopWidget:closeEventModeWidget("Ask/MiningInputWidget")
    elseif A3_68 == 22003 then
      L4_69 = desktopWidget:closeEventModeWidget("Ask/FellingInputWidget")
    elseif A3_68 == 22004 then
      L4_69 = desktopWidget:closeEventModeWidget("Ask/FishingInputWidget")
    end
    if L4_69 == false then
    end
  else
  end
  return L4_69
end
function HarvestJudge.testAsk(A0_70, A1_71, A2_72)
  local L3_73
  return L3_73
end
