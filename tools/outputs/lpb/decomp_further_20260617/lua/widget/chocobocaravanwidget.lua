require("/Widget/WidgetBaseClass")
_defineClass("ChocoboCaravanWidget", "WidgetBaseClass")
function ChocoboCaravanWidget.init(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  if A1_1 ~= nil then
    L6_6, L7_7, L8_8, L12_12 = nil, nil, nil, L9_9(L10_10)
    L5_5 = L12_12
    L4_4 = L11_11
    L3_3 = L10_10
    L2_2 = L9_9
  else
    L2_2 = L9_9 + 420
    L12_12 = 3
    L3_3 = L9_9
    L4_4 = 1014
    L5_5 = 1018
  end
  L9_9(L10_10, L11_11)
  L12_12 = L5_5
  L9_9(L10_10, L11_11, L12_12)
  L9_9(L10_10, L11_11)
  for L12_12 = 1, 3 do
    A0_0:updateChocoboHp(L12_12, 1)
    A0_0:updateChocoboStatus(L12_12, 1)
  end
  if L6_6 ~= nil then
    L12_12 = 7304
    L9_9(L10_10, L11_11, L12_12, L6_6)
  end
  if L7_7 ~= nil then
    L12_12 = 7304
    L9_9(L10_10, L11_11, L12_12, L7_7)
  end
  if L8_8 ~= nil then
    L12_12 = 7304
    L9_9(L10_10, L11_11, L12_12, L8_8)
  end
end
function ChocoboCaravanWidget.setContents(A0_13, A1_14)
  A0_13:setText("TextBlock_ContentsName", 10051, A1_14)
end
function ChocoboCaravanWidget.setTimer(A0_15, A1_16)
  local L2_17, L3_18, L4_19
  L2_17 = worldMaster
  L3_18 = L2_17
  L2_17 = L2_17._getServerTime
  L2_17 = L2_17(L3_18)
  L2_17 = A1_16 - L2_17
  L3_18 = 0
  L4_19 = 300
  A0_15:setControlProperty("CustomControl_TimerLabel", "IntData.Value0", 1)
  A0_15:setControlProperty("CustomControl_TimerLabel", "FloatData.Value0", L2_17)
  A0_15:setControlProperty("CustomControl_TimerLabel", "FloatData.Value1", L3_18)
  A0_15:setControlProperty("CustomControl_TimerLabel", "FloatData.Value2", L4_19)
  A0_15:setControlProperty("CustomControl_TimerLabel", "IntData.Value1", 300)
  A0_15:setControlProperty("CustomControl_TimerLabel", "IntData.Value2", 120)
end
function ChocoboCaravanWidget.setPlaceName(A0_20, A1_21, A2_22)
  A0_20:setText("TextBlock_DepartureText", 204, A1_21)
  A0_20:setText("TextBlock_DestinationText", 204, A2_22)
end
function ChocoboCaravanWidget.setCompanyIcon(A0_23, A1_24)
  local L2_25
  L2_25 = 0
  if A1_24 == 1 then
    L2_25 = 833
    break
  else
  end
  if A1_24 == 2 then
    L2_25 = 834
    break
  else
  end
  if A1_24 == 3 then
    L2_25 = 835
    break
  else
  end
  A0_23:setIcon("IconControl_GrandCompany", L2_25)
end
function ChocoboCaravanWidget.updateChocoboStatus(A0_26, A1_27, A2_28)
  local L3_29, L4_30
  L3_29 = "Label_ChocoboStatus_"
  L4_30 = tostring
  L4_30 = L4_30(A1_27)
  L3_29 = L3_29 .. L4_30
  L4_30 = ""
  if A2_28 == 1 then
    L4_30 = "UILuaCommands.ChocoboWalk"
    break
  else
  end
  if A2_28 == 2 then
    L4_30 = "UILuaCommands.ChocoboStop"
    break
  else
  end
  if A2_28 == 3 then
    L4_30 = "UILuaCommands.ChocoboFlight"
    break
  else
  end
  if A2_28 == 4 then
    L4_30 = "UILuaCommands.ChocoboEscaped"
    break
  else
  end
  if A2_28 == 5 then
    L4_30 = "UILuaCommands.ChocoboReturn"
    break
  else
  end
  if L4_30 ~= "" then
    A0_26:sendControlCommand(L3_29, L4_30)
  end
end
function ChocoboCaravanWidget.updateChocoboHp(A0_31, A1_32, A2_33)
  local L3_34, L4_35
  L3_34 = "Label_ChocoboStatus_"
  L4_35 = tostring
  L4_35 = L4_35(A1_32)
  L3_34 = L3_34 .. L4_35
  L4_35 = ""
  if A2_33 == 1 then
    L4_35 = "UILuaCommands.StatusNormal"
    break
  else
  end
  if A2_33 == 2 then
    L4_35 = "UILuaCommands.StatusCaution"
    break
  else
  end
  if A2_33 == 3 then
    L4_35 = "UILuaCommands.StatusDanger"
    break
  else
  end
  if L4_35 ~= "" then
    A0_31:sendControlCommand(L3_34, L4_35)
  end
end
function ChocoboCaravanWidget.updateCaravanProgress(A0_36, A1_37)
  A0_36:setValue("ProgressBar_Progress", A1_37)
end
function ChocoboCaravanWidget.update(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48
  L3_41 = A2_40
  if L3_41 == 1 then
    L5_43 = A1_39
    L4_42 = A1_39.getUIDataUpdate
    L6_44 = 1
    L4_42 = L4_42(L5_43, L6_44)
    L6_44 = A0_38
    L5_43 = A0_38.updateCaravanProgress
    L7_45 = L4_42
    L5_43(L6_44, L7_45)
    break
  else
  end
  if L3_41 == 2 then
    L5_43 = A1_39
    L4_42 = A1_39.getUIDataUpdate
    L6_44 = 2
    L6_44 = L4_42(L5_43, L6_44)
    L8_46 = A0_38
    L7_45 = A0_38.updateChocoboStatus
    L9_47 = 1
    L10_48 = L4_42
    L7_45(L8_46, L9_47, L10_48)
    L8_46 = A0_38
    L7_45 = A0_38.updateChocoboStatus
    L9_47 = 2
    L10_48 = L5_43
    L7_45(L8_46, L9_47, L10_48)
    L8_46 = A0_38
    L7_45 = A0_38.updateChocoboStatus
    L9_47 = 3
    L10_48 = L6_44
    L7_45(L8_46, L9_47, L10_48)
    break
  else
  end
  if L3_41 == 3 then
    L5_43 = A1_39
    L4_42 = A1_39.getUIDataUpdate
    L6_44 = 3
    L6_44 = L4_42(L5_43, L6_44)
    L8_46 = A0_38
    L7_45 = A0_38.updateChocoboHp
    L9_47 = 1
    L10_48 = L4_42
    L7_45(L8_46, L9_47, L10_48)
    L8_46 = A0_38
    L7_45 = A0_38.updateChocoboHp
    L9_47 = 2
    L10_48 = L5_43
    L7_45(L8_46, L9_47, L10_48)
    L8_46 = A0_38
    L7_45 = A0_38.updateChocoboHp
    L9_47 = 3
    L10_48 = L6_44
    L7_45(L8_46, L9_47, L10_48)
    break
  else
  end
end
