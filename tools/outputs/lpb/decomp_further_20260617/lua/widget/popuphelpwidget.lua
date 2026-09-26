require("/Widget/WidgetBaseClass")
_defineClass("PopupHelpWidget", "WidgetBaseClass")
function PopupHelpWidget.init(A0_0)
  A0_0:setText("TextBlock_CastTimeTitle", 10210, 10062)
  A0_0:setText("TextBlock_RecastTimeTitle", 10210, 10063)
  A0_0:setText("TextBlock_HPCostTitle", 10210, 10058)
  A0_0:setText("TextBlock_MpCostTitle", 10210, 10060)
  A0_0:setText("TextBlock_TpCostTitle", 10210, 10059)
  A0_0:setDrawPriority(0.3)
end
function PopupHelpWidget._onHoverHelp(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  local L6_7, L7_8, L8_9
  L6_7 = false
  L7_8 = false
  L8_9 = 0.8
  if A1_2 == 1 then
    A0_1:textHelp(A2_3, A3_4, A4_5, A5_6)
    L6_7 = true
    break
  else
  end
  if A1_2 == 2 then
    L7_8 = A0_1:battleCommandHelp(A2_3)
    L8_9 = 0
    do break end
    break
  else
  end
  A0_1:setWindowUserWorkFloat(1, L8_9)
  A0_1:setVisibility("Grid_HelpType_1", L6_7)
  A0_1:setVisibility("Grid_HelpType_2", L7_8)
end
function PopupHelpWidget.textHelp(A0_10, A1_11, A2_12, A3_13, A4_14)
  if A2_12 == 0 then
    A2_12 = nil
  end
  if A3_13 == 0 then
    A3_13 = nil
  end
  if A4_14 == 0 then
    A4_14 = nil
  end
  A0_10:setText("TextBlock_HelpType_1", A1_11, A2_12, A3_13, A4_14)
end
function PopupHelpWidget.battleCommandHelp(A0_15, A1_16)
  local L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
  L2_17 = false
  L3_18 = desktopWidget
  L4_19 = L3_18
  L3_18 = L3_18.getPlayerEquippedCustomCommand
  L5_20 = A1_16
  L5_20 = L3_18(L4_19, L5_20)
  if L3_18 ~= nil and L5_20 == true then
    L6_21 = desktopWidget
    L7_22 = L6_21
    L6_21 = L6_21.getPlayerEquippedCustomCommandCost
    L8_23 = A1_16
    L8_23 = L6_21(L7_22, L8_23)
    A0_15:setCommandInfo(desktopWidget:getCommandID(L3_18), desktopWidget:getPlayerActionCommandData(L3_18, 38), tostring(desktopWidget:getPlayerActionCommandData(L3_18, 76)), tostring(desktopWidget:getPlayerActionCommandData(L3_18, 79)), L6_21, L7_22, L8_23)
    L2_17 = true
  end
  return L2_17
end
function PopupHelpWidget.setCommandInfo(A0_24, A1_25, A2_26, A3_27, A4_28, A5_29, A6_30, A7_31)
  local L8_32
  A0_24:setText("TextBlock_CommandText", 1104, A1_25)
  if A2_26 > 0 then
    A0_24:setText("TextBlock_SkillName", 10212, A2_26)
    L8_32 = true
  else
    L8_32 = false
  end
  A0_24:setVisibility("TextBlock_SkillName", L8_32)
  if A3_27 ~= "0" then
    A0_24:setText("TextBlock_CastTime", 10211, A3_27)
    L8_32 = true
  else
    L8_32 = false
  end
  A0_24:setVisibility("Grid_CastTime", L8_32)
  if A4_28 ~= "0" then
    A0_24:setText("TextBlock_RecastTime", 10211, A4_28)
    L8_32 = true
  else
    L8_32 = false
  end
  A0_24:setVisibility("Grid_RecastTime", L8_32)
  if A5_29 ~= nil then
    A0_24:setText("TextBlock_HPCost", tostring(A5_29))
    L8_32 = true
  else
    L8_32 = false
  end
  A0_24:setVisibility("Grid_HPCost", L8_32)
  if A6_30 ~= nil then
    A0_24:setText("TextBlock_MpCost", tostring(A6_30))
    L8_32 = true
  else
    L8_32 = false
  end
  A0_24:setVisibility("Grid_MPCost", L8_32)
  if A7_31 ~= nil then
    A0_24:setText("TextBlock_TpCost", tostring(A7_31))
    L8_32 = true
  else
    L8_32 = false
  end
  A0_24:setVisibility("Grid_TPCost", L8_32)
  A0_24:setText("TextBlock_AbilityHelp", 1105, A1_25)
end
