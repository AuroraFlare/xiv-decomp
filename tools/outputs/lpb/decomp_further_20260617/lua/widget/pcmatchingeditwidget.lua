require("/Widget/WidgetBaseClass")
_defineClass("PcMatchingEditWidget", "WidgetBaseClass")
function PcMatchingEditWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  L1_1 = A0_0.work
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    {"invite", "integer8"}
  }
  L3_3 = {L4_4, L5_5}
  L4_4 = "chosenOperation"
  L4_4 = {L5_5, L6_6}
  L8_8 = "integer8"
  L8_8 = "view"
  L8_8 = {"capget", "boolean"}
  L1_1._temp = L2_2
  L1_1 = A0_0.work
  L1_1.chosenOperation = 0
  L1_1 = A0_0.work
  L1_1.matchNum = 1
  L1_1 = A0_0.work
  L1_1.capget = false
  L1_1 = worldMaster
  L2_2 = L1_1
  L1_1 = L1_1._getMyPlayer
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.getStateMainSkill
  L2_2 = L2_2(L3_3)
  L4_4 = L1_1
  L3_3 = L1_1.getSkillLevelCap
  L3_3 = L3_3(L4_4, L5_5)
  if L3_3 == 0 then
    L4_4 = desktopWidget
    L4_4 = L4_4.demandPlayerExpInfomation
    L4_4(L5_5)
  end
  L4_4 = A0_0.setCancelCondition
  L4_4(L5_5)
  L4_4 = A0_0.setCloseCondition
  L4_4(L5_5)
  L4_4 = A0_0.setConfirmCondition
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.setConfirmCondition
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.setConfirmCondition
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.setApplicationOperateCommand
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.setCancelCondition
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.setControlCommandCondition
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = A0_0.makePurposeList
  L4_4(L5_5)
  L4_4 = A0_0.makeGuildleveList
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.makePlaceList
  L4_4(L5_5)
  L4_4 = A0_0.setUserWorkInt
  L8_8 = "ComboBox_Purpose"
  L4_4(L5_5, L6_6, L7_7, L8_8, -1)
  L4_4 = A0_0.setUserWorkInt
  L8_8 = "ComboBox_Place"
  L4_4(L5_5, L6_6, L7_7, L8_8, -1)
  L4_4 = A0_0.setUserWorkInt
  L8_8 = "ComboBox_GLName"
  L4_4(L5_5, L6_6, L7_7, L8_8, -1)
  L4_4 = A0_0.setEnable
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = 50
  for L8_8 = 1, 4 do
    A0_0:initNumberInput("CustomControl_RankFrom_" .. tostring(L8_8), 0, L4_4, 0)
    A0_0:initNumberInput("CustomControl_RankTo_" .. tostring(L8_8), 0, L4_4, 0)
    A0_0:initNumberInput("CustomControl_NumberOfPeople_" .. tostring(L8_8), 0, A0_0:numberOfPeopleRemain(), 0)
    A0_0:makeSkillList(L8_8)
    A0_0:setText("TextBlock_SetNumber_" .. tostring(L8_8), tostring(L8_8))
    A0_0:setText("TextBlock_ToMark_" .. tostring(L8_8), "\239\189\158")
  end
  L8_8 = "+"
  L5_5(L6_6, L7_7, L8_8)
  L8_8 = "-"
  L5_5(L6_6, L7_7, L8_8)
  L8_8 = 2918
  L5_5(L6_6, L7_7, L8_8, 60)
  L5_5(L6_6, L7_7)
  L5_5(L6_6, L7_7)
  L5_5.step = 0
  L5_5(L6_6, L7_7)
  L5_5(L6_6, L7_7)
  L5_5(L6_6, L7_7)
end
function PcMatchingEditWidget.processBeforeShow(A0_9, A1_10)
  if A1_10 ~= true and A0_9:_getParentWidget() ~= nil then
    A0_9:_getParentWidget():updateChildWidgetStatus("PcMatchingEditWidget")
  end
  return true
end
function PcMatchingEditWidget.setInitialData(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17)
  A0_11:setGLNameToComboBoxItem(A1_12, A2_13, A3_14, A4_15)
  return true
end
function PcMatchingEditWidget.initNumberInput(A0_18, A1_19, A2_20, A3_21, A4_22)
  A0_18:setControlCommandCondition(A1_19, "NumberInputBox.ValueChanged")
  A0_18:setCancelCondition(A1_19)
  A0_18:setMinimum(A1_19, A2_20)
  A0_18:setMaximum(A1_19, A3_21)
  A0_18:setValue(A1_19, A4_22)
end
function PcMatchingEditWidget.makePurposeList(A0_23)
  A0_23:setPurposeList(0, 2920, 0)
  A0_23:setPurposeList(1, 4005, 1)
  A0_23:setPurposeList(2, 4026, 2)
  A0_23:setPurposeList(3, 4027, 3)
  A0_23:setPurposeList(4, 2941, 15)
  A0_23:setPurposeList(5, 2968, 16)
  A0_23:setPurposeList(6, 2961, 17)
  A0_23:setPurposeList(7, 2962, 19)
  A0_23:setPurposeList(8, 7301, 34)
  A0_23:setPurposeList(9, 10059, 20)
  A0_23:setPurposeList(10, 2963, 18)
  A0_23:setPurposeList(11, 2964, 32)
  A0_23:setPurposeList(12, 10049, 35)
  A0_23:setPurposeList(13, 2947, 31)
  A0_23:setPurposeList(14, 2949, 33)
  A0_23:setPurposeList(15, 2942, 99)
  A0_23.work.invite = 16
  if 1 < desktopWidget:countPartyMember() then
    A0_23:setEnable("ComboBoxItem_Purpose_" .. tostring(A0_23.work.invite), false)
  end
end
function PcMatchingEditWidget.setPurposeList(A0_24, A1_25, A2_26, A3_27)
  local L4_28
  L4_28 = "ComboBoxItem_Purpose_"
  L4_28 = L4_28 .. tostring(A1_25 + 1)
  A0_24:setUserWorkInt(2, nil, L4_28, A3_27)
  A0_24:setContent(L4_28, A2_26)
end
function PcMatchingEditWidget.makeGuildleveList(A0_29, A1_30)
  A0_29:resetGLList()
  if A1_30 ~= false then
    return desktopWidget:orderUpdateJournalListWidget(A0_29.work.view, A0_29)
  end
  return true
end
function PcMatchingEditWidget.resetGLList(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36
  for L4_35 = 1, 45 do
    L5_36 = "ComboBoxItem_GLName_"
    L5_36 = L5_36 .. tostring(L4_35 + 1)
    A0_31:setVisibility(L5_36, false)
    A0_31:setEnable(L5_36, true)
    A0_31:setContent(L5_36, "")
    A0_31:setUserWorkInt(2, nil, L5_36, 0)
  end
end
function PcMatchingEditWidget.makeRaidList(A0_37)
  local L1_38
  L1_38 = A0_37.resetGLList
  L1_38(A0_37)
  L1_38 = nil
  L1_38 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(1)
  if L1_38 > 0 then
    A0_37:setGLComboBoxData(1, 1, 0, 0)
  else
    A0_37:setVisibility("ComboBoxItem_GLName_2", false)
  end
  L1_38 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(2)
  if L1_38 > 0 then
    A0_37:setGLComboBoxData(2, 2, 0, 0)
  else
    A0_37:setVisibility("ComboBoxItem_GLName_3", false)
  end
  L1_38 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(6)
  if L1_38 > 0 then
    A0_37:setGLComboBoxData(3, 6, 0, 0)
  else
    A0_37:setVisibility("ComboBoxItem_GLName_4", false)
  end
  L1_38 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(7)
  if L1_38 > 0 then
    A0_37:setGLComboBoxData(4, 7, 0, 0)
  else
    A0_37:setVisibility("ComboBoxItem_GLName_5", false)
  end
  L1_38 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(13)
  if L1_38 > 0 then
    A0_37:setGLComboBoxData(5, 13, 0, 0)
  else
    A0_37:setVisibility("ComboBoxItem_GLName_6", false)
  end
  return true
end
function PcMatchingEditWidget.makeBanshinList(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45
  L2_41 = A0_39
  L1_40 = A0_39.resetGLList
  L1_40(L2_41)
  L1_40 = nil
  L2_41 = worldMaster
  L3_42 = L2_41
  L2_41 = L2_41._getServerTime
  L2_41 = L2_41(L3_42)
  L3_42 = worldMaster
  L4_43 = L3_42
  L3_42 = L3_42._getMyPlayer
  L3_42 = L3_42(L4_43)
  L4_43 = 1
  L6_45 = L3_42
  L5_44 = L3_42._getOccupancyContentsTime
  L5_44 = L5_44(L6_45, 4)
  L1_40 = L5_44
  if L1_40 > 0 then
    L6_45 = A0_39
    L5_44 = A0_39.setGLComboBoxData
    L5_44 = L5_44(L6_45, L4_43, 4, 0, 0)
    L4_43 = L5_44
    L6_45 = A0_39
    L5_44 = A0_39.maskPlaceList
    L5_44(L6_45, 3019, true)
    L6_45 = A0_39
    L5_44 = A0_39.maskPlaceList
    L5_44(L6_45, 3038, true)
  end
  L6_45 = L3_42
  L5_44 = L3_42._getOccupancyContentsTime
  L5_44 = L5_44(L6_45, 3)
  L1_40 = L5_44
  if L1_40 > 0 then
    L6_45 = A0_39
    L5_44 = A0_39.setGLComboBoxData
    L5_44 = L5_44(L6_45, L4_43, 3, 0, 0)
    L4_43 = L5_44
    L6_45 = A0_39
    L5_44 = A0_39.maskPlaceList
    L5_44(L6_45, 3038, true)
  end
  L6_45 = L3_42
  L5_44 = L3_42._getOccupancyContentsTime
  L5_44 = L5_44(L6_45, 14)
  L1_40 = L5_44
  if L1_40 > 0 then
    L6_45 = A0_39
    L5_44 = A0_39.setGLComboBoxData
    L5_44 = L5_44(L6_45, L4_43, 14, 0, 0)
    L4_43 = L5_44
  end
  L6_45 = L3_42
  L5_44 = L3_42._getOccupancyContentsTime
  L5_44 = L5_44(L6_45, 5)
  L1_40 = L5_44
  if L1_40 > 0 then
    L6_45 = A0_39
    L5_44 = A0_39.setGLComboBoxData
    L5_44 = L5_44(L6_45, L4_43, 5, 0, 0)
    L4_43 = L5_44
    L6_45 = A0_39
    L5_44 = A0_39.maskPlaceList
    L5_44(L6_45, 1280078, true)
  end
  L6_45 = L3_42
  L5_44 = L3_42._getOccupancyContentsTime
  L5_44 = L5_44(L6_45, 12)
  L1_40 = L5_44
  if L1_40 > 0 then
    L6_45 = A0_39
    L5_44 = A0_39.setGLComboBoxData
    L5_44 = L5_44(L6_45, L4_43, 12, 0, 0)
    L4_43 = L5_44
    L6_45 = A0_39
    L5_44 = A0_39.maskPlaceList
    L5_44(L6_45, 1280099, true)
  end
  L6_45 = L3_42
  L5_44 = L3_42._getOccupancyContentsTime
  L5_44 = L5_44(L6_45, 11)
  L1_40 = L5_44
  if L1_40 > 0 then
    L6_45 = A0_39
    L5_44 = A0_39.setGLComboBoxData
    L5_44 = L5_44(L6_45, L4_43, 11, 0, 0)
    L4_43 = L5_44
  end
  L6_45 = L3_42
  L5_44 = L3_42._getBelongGrandCompany
  L5_44 = L5_44(L6_45)
  L6_45 = L3_42._getOccupancyContentsTime
  L6_45 = L6_45(L3_42, 15)
  L1_40 = L6_45
  if L1_40 > 0 then
    L6_45 = 111433
    if L5_44 == 1 then
      L6_45 = 111433
    elseif L5_44 == 2 then
      L6_45 = 111633
    elseif L5_44 == 3 then
      L6_45 = 111833
    end
    L4_43 = A0_39:setGLComboBoxData(L4_43, L6_45, 0, 0)
  end
  L6_45 = L3_42._getOccupancyContentsTime
  L6_45 = L6_45(L3_42, 16)
  L1_40 = L6_45
  if L1_40 > 0 then
    L6_45 = A0_39.setGLComboBoxData
    L6_45 = L6_45(A0_39, L4_43, 110870, 0, 0)
    L4_43 = L6_45
  end
  L6_45 = true
  return L6_45
end
function PcMatchingEditWidget.makeBanzokuList(A0_46)
  A0_46:resetGLList()
  A0_46:setGLComboBoxData(1, 1125, 0, 0)
  A0_46:setGLComboBoxData(2, 3521, 0, 0)
  A0_46:setGLComboBoxData(3, 4503, 0, 0)
  A0_46:setGLComboBoxData(4, 5009, 0, 0)
  return true
end
function PcMatchingEditWidget.makeHamletList(A0_47)
  local L1_48
  L1_48 = A0_47.resetGLList
  L1_48(A0_47)
  L1_48 = nil
  L1_48 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(8)
  if L1_48 > 0 then
    A0_47:setGLComboBoxData(1, 8, 0, 0)
  end
  L1_48 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(9)
  if L1_48 > 0 then
    A0_47:setGLComboBoxData(2, 9, 0, 0)
  end
  L1_48 = worldMaster:_getMyPlayer():_getOccupancyContentsTime(10)
  if L1_48 > 0 then
    A0_47:setGLComboBoxData(3, 10, 0, 0)
  end
  return true
end
function PcMatchingEditWidget.makeChocoboList(A0_49)
  A0_49:resetGLList()
  A0_49:setGLComboBoxData(1, 1280005, 1031, 0)
  A0_49:setGLComboBoxData(2, 1280003, 1030, 0)
  A0_49:setGLComboBoxData(3, 1280066, 2004, 0)
  A0_49:setGLComboBoxData(4, 1280073, 2003, 0)
  A0_49:setGLComboBoxData(5, 1280034, 3043, 0)
  A0_49:setGLComboBoxData(6, 1280033, 3044, 0)
end
function PcMatchingEditWidget.makeRushList(A0_50)
  A0_50:resetGLList()
  A0_50:setGLComboBoxData(1, 51143, 0, 0)
  A0_50:setGLComboBoxData(2, 51144, 0, 0)
  return true
end
function PcMatchingEditWidget.makeNMList(A0_51)
  local L1_52
  L1_52 = A0_51.resetGLList
  L1_52(A0_51)
  L1_52 = 2
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3107616, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3102012, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100801, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3104214, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3102720, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3107618, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3104513, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3103203, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3104323, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3101612, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3106628, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100311, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3101511, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3110312, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3101513, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3102806, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3101011, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3106221, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100515, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100512, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3105915, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3102611, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100612, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3103009, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100117, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3102311, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3105515, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100913, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3106312, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3101415, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3106557, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3100717, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3106209, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3106019, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3106433, 0, 0)
  L1_52 = A0_51:setGLComboBoxData(L1_52, 3101710, 0, 0)
  return true
end
function PcMatchingEditWidget.makeLevelingList(A0_53)
  A0_53:resetGLList()
  A0_53:setGLComboBoxData(1, 2965, 0, 102)
  return true
end
function PcMatchingEditWidget.setGLComboBoxData(A0_54, A1_55, A2_56, A3_57, A4_58)
  local L5_59, L6_60, L7_61, L8_62
  L5_59 = A1_55 + 1
  L6_60 = "ComboBoxItem_GLName_"
  L7_61 = tostring
  L8_62 = L5_59
  L7_61 = L7_61(L8_62)
  L6_60 = L6_60 .. L7_61
  L8_62 = A0_54
  L7_61 = A0_54.getUserWorkInt
  L7_61 = L7_61(L8_62, 3, nil, "ComboBox_Purpose")
  L8_62 = A0_54.setVisibility
  L8_62(A0_54, L6_60, true)
  if L7_61 == 15 then
    L8_62 = A0_54.setContent
    L8_62(A0_54, L6_60, 10051, A2_56)
  elseif L7_61 == 16 then
    if A2_56 == 111433 or A2_56 == 111633 or A2_56 == 111833 or A2_56 == 110870 then
      L8_62 = A0_54.setContent
      L8_62(A0_54, L6_60, 5001, A2_56)
    else
      L8_62 = A0_54.setContent
      L8_62(A0_54, L6_60, 10051, A2_56)
    end
  elseif L7_61 == 17 then
    L8_62 = A0_54.setContent
    L8_62(A0_54, L6_60, 2967, A2_56, A1_55)
  elseif L7_61 == 19 then
    L8_62 = A0_54.setContent
    L8_62(A0_54, L6_60, 10051, A2_56)
  elseif L7_61 == 34 then
    L8_62 = A0_54.setContent
    L8_62(A0_54, L6_60, 2966, A2_56, A3_57)
  elseif L7_61 == 20 then
    L8_62 = A0_54.setControlProperty
    L8_62(A0_54, L6_60, "Content", worldMaster, A2_56)
  elseif L7_61 == 18 then
    L8_62 = A0_54.setContent
    L8_62(A0_54, L6_60, 12017, A2_56)
  elseif L7_61 == 31 then
    L8_62 = A0_54.setContent
    L8_62(A0_54, L6_60, A2_56)
  end
  L8_62 = 0
  if A4_58 ~= 0 then
    L8_62 = A4_58
  else
    L8_62 = A2_56
  end
  A0_54:setUserWorkInt(2, nil, L6_60, L8_62)
  return L5_59
end
function PcMatchingEditWidget.makePlaceList(A0_63)
  local L1_64, L2_65, L3_66, L4_67, L5_68
  for L4_67 = 1, 49 do
    L5_68 = "ComboBoxItem_Place_"
    L5_68 = L5_68 .. tostring(L4_67 + 1)
    A0_63:setVisibility(L5_68, false)
    A0_63:setContent(L5_68, "")
    A0_63:setUserWorkInt(2, nil, L5_68, 0)
  end
  L4_67 = L1_64
  L5_68 = 1280001
  L4_67 = L1_64
  L5_68 = 1280002
  L4_67 = L1_64
  L5_68 = 1280007
  L4_67 = L1_64
  L5_68 = 1280003
  L4_67 = L1_64
  L5_68 = 1280004
  L4_67 = L1_64
  L5_68 = 1280005
  L4_67 = L1_64
  L5_68 = 1280006
  L4_67 = L1_64
  L5_68 = 1030
  L4_67 = L1_64
  L5_68 = 1122
  L4_67 = L1_64
  L5_68 = 1280020
  L4_67 = L1_64
  L5_68 = 1125
  L4_67 = L1_64
  L5_68 = 1011
  L4_67 = L1_64
  L5_68 = 1041
  L4_67 = L1_64
  L5_68 = 1280061
  L4_67 = L1_64
  L5_68 = 1280062
  L4_67 = L1_64
  L5_68 = 1280067
  L4_67 = L1_64
  L5_68 = 1280063
  L4_67 = L1_64
  L5_68 = 1280064
  L4_67 = L1_64
  L5_68 = 1280073
  L4_67 = L1_64
  L5_68 = 1280065
  L4_67 = L1_64
  L5_68 = 1280078
  L4_67 = L1_64
  L5_68 = 1280066
  L4_67 = L1_64
  L5_68 = 2003
  L4_67 = L1_64
  L5_68 = 1280082
  L4_67 = L1_64
  L5_68 = 1280031
  L4_67 = L1_64
  L5_68 = 1280032
  L4_67 = L1_64
  L5_68 = 1280033
  L4_67 = L1_64
  L5_68 = 1280039
  L4_67 = L1_64
  L5_68 = 1280034
  L4_67 = L1_64
  L5_68 = 3019
  L4_67 = L1_64
  L5_68 = 1280035
  L4_67 = L1_64
  L5_68 = 1280036
  L4_67 = L1_64
  L5_68 = 3044
  L4_67 = L1_64
  L5_68 = 1280052
  L4_67 = L1_64
  L5_68 = 1280054
  L4_67 = L1_64
  L5_68 = 3521
  L4_67 = L1_64
  L5_68 = 1280092
  L4_67 = L1_64
  L5_68 = 1280099
  L4_67 = L1_64
  L5_68 = 1280093
  L4_67 = L1_64
  L5_68 = 1280094
  L4_67 = L1_64
  L5_68 = 1280095
  L4_67 = L1_64
  L5_68 = 1280096
  L4_67 = L1_64
  L5_68 = 4503
  L4_67 = L1_64
  L5_68 = 4073
  L4_67 = L1_64
  L5_68 = 1280121
  L4_67 = L1_64
  L5_68 = 1280122
  L4_67 = L1_64
  L5_68 = 1280125
  L4_67 = L1_64
  L5_68 = 5009
  L4_67 = L1_64
  L5_68 = 3038
  L4_67 = 3038
  L5_68 = false
  L2_65(L3_66, L4_67, L5_68)
  L4_67 = 1280099
  L5_68 = false
  L2_65(L3_66, L4_67, L5_68)
end
function PcMatchingEditWidget.setPlaceList(A0_69, A1_70, A2_71, A3_72)
  local L4_73
  L4_73 = "ComboBoxItem_Place_"
  L4_73 = L4_73 .. tostring(A1_70 + 1)
  if A2_71 > 1280000 then
    A0_69:setContent(L4_73, 211, A2_71)
  else
    A0_69:setContent(L4_73, 204, A2_71)
  end
  A0_69:setUserWorkInt(2, nil, L4_73, A2_71)
  A0_69:setVisibility(L4_73, true)
  if A3_72 ~= nil then
    A0_69:setEnable(L4_73, A3_72)
  end
  return A1_70 + 1
end
function PcMatchingEditWidget.maskPlaceList(A0_74, A1_75, A2_76)
  local L3_77, L4_78, L5_79, L6_80, L7_81
  for L6_80 = 1, 49 do
    L7_81 = "ComboBoxItem_Place_"
    L7_81 = L7_81 .. tostring(L6_80 + 1)
    if A0_74:getUserWorkInt(2, nil, L7_81) == A1_75 then
      A0_74:setVisibility(L7_81, A2_76)
      break
    end
  end
end
function PcMatchingEditWidget.resetPlaceList(A0_82)
  local L1_83, L2_84
  L2_84 = A0_82
  L1_83 = A0_82.getUserWorkInt
  L1_83 = L1_83(L2_84, 3, nil, "ComboBox_Place")
  if L1_83 ~= 3019 then
    L2_84 = A0_82
    L1_83 = A0_82.getUserWorkInt
    L1_83 = L1_83(L2_84, 3, nil, "ComboBox_Place")
  elseif L1_83 == 3038 then
    L2_84 = A0_82
    L1_83 = A0_82.setUserWorkInt
    L1_83(L2_84, 2, nil, "ComboBox_Place", 0)
    L2_84 = A0_82
    L1_83 = A0_82.getUserWorkInt
    L1_83 = L1_83(L2_84, 2, nil, "ComboBoxItem_Place_1")
    L2_84 = A0_82.setUserWorkInt
    L2_84(A0_82, 3, nil, "ComboBox_Place", L1_83)
    L2_84 = A0_82.getControlProperty
    L2_84 = L2_84(A0_82, "ComboBoxItem_Place_1", "Content")
    A0_82:setText("ComboBox_Place", L2_84)
  end
end
function PcMatchingEditWidget.makeSkillList(A0_85, A1_86)
  A0_85:setSkillComboBoxData(A1_86, 1, 0, 0)
  A0_85:setSkillComboBoxData(A1_86, 2, 1, 0)
  A0_85:setSkillComboBoxData(A1_86, 3, 1, 3)
  A0_85:setSkillComboBoxData(A1_86, 4, 1, 2)
  A0_85:setSkillComboBoxData(A1_86, 5, 1, 4)
  A0_85:setSkillComboBoxData(A1_86, 6, 1, 8)
  A0_85:setSkillComboBoxData(A1_86, 7, 1, 7)
  A0_85:setSkillComboBoxData(A1_86, 8, 1, 16)
  A0_85:setSkillComboBoxData(A1_86, 9, 1, 15)
  A0_85:setSkillComboBoxData(A1_86, 10, 1, 17)
  A0_85:setSkillComboBoxData(A1_86, 11, 1, 19)
  A0_85:setSkillComboBoxData(A1_86, 12, 1, 18)
  A0_85:setSkillComboBoxData(A1_86, 13, 21, 0)
  A0_85:setSkillComboBoxData(A1_86, 14, 21, 23)
  A0_85:setSkillComboBoxData(A1_86, 15, 21, 22)
  A0_85:setSkillComboBoxData(A1_86, 16, 21, 27)
  A0_85:setSkillComboBoxData(A1_86, 17, 21, 26)
  A0_85:setSkillComboBoxData(A1_86, 18, 29, 0)
  A0_85:setSkillComboBoxData(A1_86, 19, 29, 29)
  A0_85:setSkillComboBoxData(A1_86, 20, 29, 30)
  A0_85:setSkillComboBoxData(A1_86, 21, 29, 31)
  A0_85:setSkillComboBoxData(A1_86, 22, 29, 32)
  A0_85:setSkillComboBoxData(A1_86, 23, 29, 33)
  A0_85:setSkillComboBoxData(A1_86, 24, 29, 34)
  A0_85:setSkillComboBoxData(A1_86, 25, 29, 35)
  A0_85:setSkillComboBoxData(A1_86, 26, 29, 36)
  A0_85:setSkillComboBoxData(A1_86, 27, 39, 0)
  A0_85:setSkillComboBoxData(A1_86, 28, 39, 39)
  A0_85:setSkillComboBoxData(A1_86, 29, 39, 40)
  A0_85:setSkillComboBoxData(A1_86, 30, 39, 41)
end
function PcMatchingEditWidget.setSkillComboBoxData(A0_87, A1_88, A2_89, A3_90, A4_91, A5_92)
  local L6_93, L7_94
  L6_93 = "ComboBoxItem_Skill_"
  L7_94 = tostring
  L7_94 = L7_94(A1_88)
  L6_93 = L6_93 .. L7_94 .. "_" .. tostring(A2_89)
  L7_94 = A0_87.setUserWorkInt
  L7_94(A0_87, 3, nil, L6_93, A3_90)
  L7_94 = A0_87.setUserWorkInt
  L7_94(A0_87, 4, nil, L6_93, A4_91)
  if A4_91 ~= 0 then
    L7_94 = A0_87.setContent
    L7_94(A0_87, L6_93, 206, A4_91)
    L7_94 = A0_87.setControlProperty
    L7_94(A0_87, L6_93, "FontStyle", "")
  elseif A3_90 ~= 0 then
    L7_94 = nil
    if A3_90 == 1 then
      L7_94 = 100701
    elseif A3_90 == 21 then
      L7_94 = 100702
    elseif A3_90 == 29 then
      L7_94 = 100704
    elseif A3_90 == 39 then
      L7_94 = 100703
    end
    A0_87:setContent(L6_93, L7_94)
    A0_87:setControlProperty(L6_93, "FontStyle", "Italic")
  end
  if A5_92 ~= nil then
    L7_94 = A0_87.setVisibility
    L7_94(A0_87, L6_93, false)
  end
end
function PcMatchingEditWidget.checkRankNumberRange(A0_95, A1_96, A2_97, A3_98)
  local L4_99, L5_100, L6_101
  L4_99 = worldMaster
  L5_100 = L4_99
  L4_99 = L4_99._getMyPlayer
  L4_99 = L4_99(L5_100)
  L5_100 = 0
  if A2_97 == 0 then
    L6_101 = L4_99.getSkillLevelCap
    L6_101 = L6_101(L4_99, L4_99:getStateMainSkill())
    L5_100 = L6_101
  elseif A3_98 == 0 then
    L6_101 = 0
    if A2_97 == 1 then
      L6_101 = L4_99:getSkillLevelCap(2)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(3)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(4)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(7)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(8)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
    elseif A2_97 == 21 then
      L6_101 = L4_99:getSkillLevelCap(23)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(22)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
    elseif A2_97 == 29 then
      L6_101 = L4_99:getSkillLevelCap(29)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(30)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(31)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(32)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(33)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(34)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(35)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(36)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
    elseif A2_97 == 39 then
      L6_101 = L4_99:getSkillLevelCap(39)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(40)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
      L6_101 = L4_99:getSkillLevelCap(41)
      if L5_100 < L6_101 then
        L5_100 = L6_101
      end
    end
  else
    L6_101 = A3_98
    if L4_99:isJob(L6_101) then
      L6_101 = L4_99:convertSkillId(L6_101)
    end
    L5_100 = L4_99:getSkillLevelCap(L6_101)
  end
  L6_101 = A0_95.setMaximum
  L6_101(A0_95, "CustomControl_RankFrom_" .. tostring(A1_96), L5_100)
  L6_101 = A0_95.setMaximum
  L6_101(A0_95, "CustomControl_RankTo_" .. tostring(A1_96), L5_100)
  L6_101 = A0_95.getValue
  L6_101 = L6_101(A0_95, "CustomControl_RankFrom_" .. tostring(A1_96))
  if L5_100 < L6_101 then
    L6_101 = A0_95.setValue
    L6_101(A0_95, "CustomControl_RankFrom_" .. tostring(A1_96), L5_100)
  end
  L6_101 = A0_95.getValue
  L6_101 = L6_101(A0_95, "CustomControl_RankTo_" .. tostring(A1_96))
  if L5_100 < L6_101 then
    L6_101 = A0_95.setValue
    L6_101(A0_95, "CustomControl_RankTo_" .. tostring(A1_96), L5_100)
  end
end
function PcMatchingEditWidget.setGLNameToComboBoxItem(A0_102, A1_103, A2_104, A3_105, A4_106)
  local L5_107
  L5_107 = "ComboBoxItem_GLName_"
  L5_107 = L5_107 .. tostring(A1_103 + 1)
  if A0_102:getUserWorkInt(3, nil, "ComboBox_Purpose") == 2 then
    A0_102:setContent(L5_107, 4101, A2_104)
  elseif A0_102:getUserWorkInt(3, nil, "ComboBox_Purpose") == 3 then
    A0_102:setContent(L5_107, 5001, A2_104)
  elseif A0_102:getUserWorkInt(3, nil, "ComboBox_Purpose") == 1 then
    A0_102:setContent(L5_107, 5001, A2_104)
  end
  A0_102:setUserWorkInt(2, nil, L5_107, A2_104)
  A0_102:setVisibility(L5_107, true)
  if A0_102:getUserWorkInt(3, nil, "ComboBox_Purpose") == 2 then
    if A3_105 == true then
      A0_102:setEnable(L5_107, false)
    else
      A0_102:setEnable(L5_107, true)
    end
  elseif A0_102:getUserWorkInt(3, nil, "ComboBox_Purpose") == 3 then
    if worldMaster:_getMyPlayer():isDoneLocalleveById(A2_104) == true then
      A0_102:setEnable(L5_107, false)
    else
      A0_102:setEnable(L5_107, true)
    end
  else
    A0_102:setEnable(L5_107, true)
  end
  return A1_103 + 1
end
function PcMatchingEditWidget.resetSkillSet(A0_108, A1_109)
  local L2_110
  L2_110 = A0_108.setSelectedIndex
  L2_110(A0_108, "ComboBox_Skill_" .. tostring(A1_109), -1)
  L2_110 = A0_108.getControlProperty
  L2_110 = L2_110(A0_108, "ComboBoxItem_Skill_" .. tostring(A1_109) .. "_1", "Content")
  A0_108:setText("ComboBox_Skill_" .. tostring(A1_109), L2_110)
  A0_108:setUserWorkInt(2, nil, "ComboBox_Skill_" .. tostring(A1_109), 0)
  A0_108:setUserWorkInt(3, nil, "ComboBox_Skill_" .. tostring(A1_109), 0)
  A0_108:checkRankNumberRange(A1_109, 0, 0)
  A0_108:setValue("CustomControl_RankFrom_" .. tostring(A1_109), 0)
  A0_108:setValue("CustomControl_RankTo_" .. tostring(A1_109), 0)
  A0_108:setValue("CustomControl_NumberOfPeople_" .. tostring(A1_109), 0)
end
function PcMatchingEditWidget.setGrid(A0_111, A1_112)
  local L2_113, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124
  L2_113 = 0
  if A1_112 == 0 then
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setContent
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setText
    L3_114(L4_115, L5_116, L6_117)
    L2_113 = 75423
  elseif A1_112 == 1 then
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setContent
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setText
    L8_119 = A0_111
    L8_119 = 4
    L3_114(L4_115, L5_116, L6_117, L7_118, L8_119)
    L2_113 = 75424
  elseif A1_112 == 2 then
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setContent
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setText
    L3_114(L4_115, L5_116, L6_117)
    L2_113 = 75425
  end
  L3_114 = A0_111.work
  L3_114 = L3_114.view
  if L3_114 == 99 then
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setContent
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setText
    L3_114(L4_115, L5_116, L6_117)
    L3_114 = A0_111.setVisibility
    L3_114(L4_115, L5_116, L6_117)
    L2_113 = 75425
  end
  L3_114 = A0_111.setHelpParameter
  L3_114(L4_115, L5_116, L6_117, L7_118)
  if A1_112 > 0 then
    L3_114 = A0_111.numberOfPeopleRemain
    L3_114 = L3_114(L4_115)
    L3_114 = L3_114 - L4_115
    L3_114 = L3_114 + 1
    for L7_118 = 1, 4 do
      L8_119 = A0_111.work
      L8_119 = L8_119.matchNum
      if L7_118 <= L8_119 then
        L9_120 = A0_111
        L8_119 = A0_111.setVisibility
        L8_119(L9_120, L10_121, L11_122)
        L8_119 = "CustomControl_NumberOfPeople_"
        L9_120 = tostring
        L9_120 = L9_120(L10_121)
        L8_119 = L8_119 .. L9_120
        L9_120 = A0_111.setMaximum
        L9_120(L10_121, L11_122, L12_123)
        L9_120 = A0_111.setMinimum
        L9_120(L10_121, L11_122, L12_123)
        L9_120 = A0_111.getValue
        L9_120 = L9_120(L10_121, L11_122)
        if L9_120 == 0 then
          L9_120 = A0_111.setValue
          L9_120(L10_121, L11_122, L12_123)
        end
        L9_120 = 0
        for L13_124 = 1, L7_118 - 1 do
          L9_120 = L9_120 + A0_111:getValue("CustomControl_NumberOfPeople_" .. tostring(L13_124))
        end
        if L10_121 > L11_122 then
          L13_124 = A0_111.numberOfPeopleRemain
          L13_124 = L13_124(A0_111)
          L13_124 = L13_124 - L9_120
          L10_121(L11_122, L12_123, L13_124)
        end
      else
        L9_120 = A0_111
        L8_119 = A0_111.setVisibility
        L8_119(L9_120, L10_121, L11_122)
        L9_120 = A0_111
        L8_119 = A0_111.setMinimum
        L8_119(L9_120, L10_121, L11_122)
        L9_120 = A0_111
        L8_119 = A0_111.setValue
        L8_119(L9_120, L10_121, L11_122)
      end
    end
    if L4_115 == 1 then
      L4_115(L5_116, L6_117, L7_118)
    else
      L4_115(L5_116, L6_117, L7_118)
    end
    for L8_119 = 1, L6_117.matchNum do
      L9_120 = A0_111.getValue
      L13_124 = L8_119
      L9_120 = L9_120(L10_121, L11_122)
    end
    if L5_116 ~= 4 then
    else
      if L4_115 >= L5_116 then
        L8_119 = false
        L5_116(L6_117, L7_118, L8_119)
    end
    else
      L8_119 = true
      L5_116(L6_117, L7_118, L8_119)
    end
    L9_120 = A0_111
    L8_119 = A0_111.isOperateButtonEnable
    L13_124 = L8_119(L9_120)
    L5_116(L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124, L8_119(L9_120))
  end
  L3_114 = true
  return L3_114
end
function PcMatchingEditWidget.setFocus(A0_125, A1_126)
  if A1_126 ~= nil and A1_126 ~= "" then
    A0_125:setLogicalFocus(A1_126)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_125 then
      A0_125:setKeyboardFocusedControl(A1_126)
    end
  end
end
function PcMatchingEditWidget.checkFocusInNumberInput(A0_127)
  local L1_128, L2_129, L3_130, L4_131, L5_132
  L1_128 = A0_127.getKeyboardFocusedControl
  L1_128 = L1_128(L2_129)
  for L5_132 = 0, 1 do
    if L1_128 == tostring(L5_132) then
      return true
    end
  end
  return L2_129
end
function PcMatchingEditWidget.numberOfPeopleRemain(A0_133)
  if desktopWidget:countPartyMember() == 0 then
    return 7
  else
    return 8 - desktopWidget:countPartyMember()
  end
end
function PcMatchingEditWidget.isOperateButtonEnable(A0_134)
  local L1_135, L2_136, L3_137, L4_138, L5_139
  L1_135 = 0
  if L2_136 ~= 99 then
    for L5_139 = 1, L3_137.matchNum do
      if A0_134:getValue("CustomControl_NumberOfPeople_" .. tostring(L5_139)) == 0 then
        return false
      end
    end
  end
  if L2_136 == 10001 or L2_136 == 10002 then
    L5_139 = false
    return L5_139
  end
  L5_139 = true
  return L5_139
end
function PcMatchingEditWidget.presetPlace(A0_140, A1_141)
  local L2_142, L3_143, L4_144, L5_145
  L2_142 = 1
  L3_143 = ""
  for _FORV_7_ = 1, 49 do
    L3_143 = "ComboBoxItem_Place_" .. tostring(_FORV_7_ + 1)
    if A0_140:getUserWorkInt(2, nil, L3_143) == A1_141 then
      L2_142 = _FORV_7_
      break
    end
  end
  L4_144(L5_145, 2, nil, "ComboBox_Place", L2_142)
  L5_145(A0_140, 3, nil, "ComboBox_Place", L4_144)
  A0_140:setText("ComboBox_Place", L5_145)
end
function PcMatchingEditWidget.processUICommandDefault(A0_146, A1_147, A2_148, A3_149, A4_150, A5_151)
  local L6_152, L7_153, L8_154, L9_155, L10_156, L11_157, L12_158, L13_159
  if A3_149 == "UILuaCommands.PropertyChanged" then
    if L6_152 == 4 then
      if L6_152 ~= nil then
        L9_155 = "PcMatchingEditWidget"
        L10_156 = 0
        L7_153(L8_154, L9_155, L10_156)
      end
      L9_155 = "MainMenuWidget"
      if L7_153 ~= nil then
        L9_155 = L8_154
        L10_156 = "PartyRootWidget"
        L11_157 = L7_153
        return L8_154(L9_155, L10_156, L11_157)
      else
        L9_155 = L8_154
        L10_156 = A0_146
        return L8_154(L9_155, L10_156)
      end
    end
  end
  if A3_149 == "UILuaCommands.SelectComboBoxItem" then
    if A2_148 == "ComboBox_Purpose" then
      L9_155 = A2_148
      L10_156 = -1
      L7_153(L8_154, L9_155, L10_156)
      if L6_152 > -1 then
        L9_155 = 2
        L10_156 = nil
        L11_157 = A2_148
        if L6_152 ~= L7_153 then
          L9_155 = A0_146
          L10_156 = 2
          L11_157 = nil
          L12_158 = "ComboBoxItem_Purpose_"
          L13_159 = tostring
          L13_159 = L13_159(L6_152 + 1)
          L12_158 = L12_158 .. L13_159
          L7_153.view = L8_154
          L9_155 = 3
          L10_156 = nil
          L11_157 = A2_148
          L12_158 = A0_146.work
          L12_158 = L12_158.view
          L7_153(L8_154, L9_155, L10_156, L11_157, L12_158)
          L9_155 = "ComboBox_GLName"
          L10_156 = false
          L7_153(L8_154, L9_155, L10_156)
          L9_155 = "ComboBox_GLName"
          L10_156 = -1
          L7_153(L8_154, L9_155, L10_156)
          L9_155 = 2
          L10_156 = nil
          L11_157 = "ComboBox_GLName"
          L12_158 = 0
          L7_153(L8_154, L9_155, L10_156, L11_157, L12_158)
          L9_155 = 3
          L10_156 = nil
          L11_157 = "ComboBox_GLName"
          L12_158 = 0
          L7_153(L8_154, L9_155, L10_156, L11_157, L12_158)
          L9_155 = "ComboBox_GLName"
          L10_156 = 2922
          L7_153(L8_154, L9_155, L10_156)
          if L7_153 == 0 then
            L9_155 = false
            L7_153(L8_154, L9_155)
          elseif L7_153 == 15 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 16 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 17 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 19 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 34 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 20 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 18 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 32 then
            L9_155 = false
            L7_153(L8_154, L9_155)
          elseif L7_153 == 31 then
            L7_153(L8_154)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          elseif L7_153 == 99 then
            L9_155 = false
            L7_153(L8_154, L9_155)
          elseif L7_153 ~= 1 then
          elseif L7_153 == 3 then
            L9_155 = true
            L7_153(L8_154, L9_155)
            L9_155 = "ComboBox_GLName"
            L10_156 = true
            L7_153(L8_154, L9_155, L10_156)
          end
          if L7_153 == 99 then
            L9_155 = false
            L7_153(L8_154, L9_155)
            L9_155 = 2
            L10_156 = nil
            L11_157 = "Button_Operate"
            L12_158 = A0_146.work
            L12_158 = L12_158.step
            L7_153(L8_154, L9_155, L10_156, L11_157, L12_158)
            L9_155 = "Button_Operate"
            L11_157 = A0_146
            L10_156 = A0_146.isOperateButtonEnable
            L13_159 = L10_156(L11_157)
            L7_153(L8_154, L9_155, L10_156, L11_157, L12_158, L13_159, L10_156(L11_157))
            L9_155 = A0_146.work
            L9_155 = L9_155.step
            L7_153(L8_154, L9_155)
            L9_155 = "Grid_People"
            L10_156 = false
            L7_153(L8_154, L9_155, L10_156)
            L9_155 = "Grid_PeopleButton"
            L10_156 = false
            L7_153(L8_154, L9_155, L10_156)
            L9_155 = "TextBox_Comment"
            L7_153(L8_154, L9_155)
          else
            L9_155 = A0_146.work
            L9_155 = L9_155.step
            L7_153(L8_154, L9_155)
            if L7_153 ~= 0 then
              L9_155 = "Button_Operate"
              L11_157 = A0_146
              L10_156 = A0_146.isOperateButtonEnable
              L13_159 = L10_156(L11_157)
              L7_153(L8_154, L9_155, L10_156, L11_157, L12_158, L13_159, L10_156(L11_157))
            else
              L9_155 = "Button_Operate"
              L10_156 = true
              L7_153(L8_154, L9_155, L10_156)
            end
          end
          L9_155 = 2
          L10_156 = nil
          L11_157 = A2_148
          L12_158 = L6_152
          L7_153(L8_154, L9_155, L10_156, L11_157, L12_158)
        end
      end
    elseif A2_148 == "ComboBox_Place" then
      L9_155 = A2_148
      L10_156 = -1
      L7_153(L8_154, L9_155, L10_156)
      if L6_152 > -1 then
        L9_155 = 2
        L10_156 = nil
        L11_157 = A2_148
        if L6_152 ~= L7_153 then
          L9_155 = 2
          L10_156 = nil
          L11_157 = A2_148
          L12_158 = L6_152
          L7_153(L8_154, L9_155, L10_156, L11_157, L12_158)
          L9_155 = 2
          L10_156 = nil
          L11_157 = "ComboBoxItem_Place_"
          L12_158 = tostring
          L13_159 = L6_152 + 1
          L12_158 = L12_158(L13_159)
          L11_157 = L11_157 .. L12_158
          L9_155 = A0_146
          L10_156 = 3
          L11_157 = nil
          L12_158 = A2_148
          L13_159 = L7_153
          L8_154(L9_155, L10_156, L11_157, L12_158, L13_159)
        end
      end
    else
      if A2_148 == "ComboBox_GLName" then
        L9_155 = A2_148
        L10_156 = -1
        L7_153(L8_154, L9_155, L10_156)
        if L6_152 > -1 then
          L9_155 = 2
          L10_156 = nil
          L11_157 = A2_148
          if L6_152 ~= L7_153 then
            L9_155 = 2
            L10_156 = nil
            L11_157 = A2_148
            L12_158 = L6_152
            L7_153(L8_154, L9_155, L10_156, L11_157, L12_158)
            if L6_152 > 0 then
              L9_155 = A0_146
              L10_156 = 2
              L11_157 = nil
              L12_158 = "ComboBoxItem_GLName_"
              L13_159 = tostring
              L13_159 = L13_159(L6_152 + 1)
              L12_158 = L12_158 .. L13_159
              if L7_153 == 111616 or L7_153 == 111816 or L7_153 == 111416 or L7_153 == 4 then
                L9_155 = A0_146
                L10_156 = 3019
                L11_157 = true
                L8_154(L9_155, L10_156, L11_157)
                L9_155 = A0_146
                L10_156 = 3038
                L11_157 = true
                L8_154(L9_155, L10_156, L11_157)
                L9_155 = A0_146
                L10_156 = 1280061
                L8_154(L9_155, L10_156)
              elseif L7_153 == 110627 or L7_153 == 3 then
                L9_155 = A0_146
                L10_156 = 3038
                L11_157 = true
                L8_154(L9_155, L10_156, L11_157)
                L9_155 = A0_146
                L10_156 = 1280036
                L8_154(L9_155, L10_156)
              elseif L7_153 == 110868 or L7_153 == 14 then
                L9_155 = A0_146
                L10_156 = 1280036
                L8_154(L9_155, L10_156)
              elseif L7_153 == 110816 or L7_153 == 5 then
                L9_155 = A0_146
                L10_156 = 1280078
                L11_157 = true
                L8_154(L9_155, L10_156, L11_157)
                L9_155 = A0_146
                L10_156 = 1280078
                L8_154(L9_155, L10_156)
              elseif L7_153 == 111630 or L7_153 == 111830 or L7_153 == 111430 or L7_153 == 12 then
                L9_155 = A0_146
                L10_156 = 1280099
                L11_157 = true
                L8_154(L9_155, L10_156, L11_157)
                L9_155 = A0_146
                L10_156 = 1280094
                L8_154(L9_155, L10_156)
              elseif L7_153 == 110867 or L7_153 == 11 then
                L9_155 = A0_146
                L10_156 = 1280092
                L8_154(L9_155, L10_156)
              elseif L7_153 == 111632 or L7_153 == 111832 or L7_153 == 111432 then
                L9_155 = A0_146
                L10_156 = 1280125
                L8_154(L9_155, L10_156)
              elseif L7_153 == 111633 or L7_153 == 111833 or L7_153 == 111433 or L7_153 == 110870 then
                L9_155 = A0_146
                L10_156 = 4073
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1125 then
                L9_155 = A0_146
                L10_156 = 1125
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3521 then
                L9_155 = A0_146
                L10_156 = 3521
                L8_154(L9_155, L10_156)
              elseif L7_153 == 4503 then
                L9_155 = A0_146
                L10_156 = 4503
                L8_154(L9_155, L10_156)
              elseif L7_153 == 5009 then
                L9_155 = A0_146
                L10_156 = 5009
                L8_154(L9_155, L10_156)
              elseif L7_153 == 8 then
                L9_155 = A0_146
                L10_156 = 1030
                L8_154(L9_155, L10_156)
              elseif L7_153 == 9 then
                L9_155 = A0_146
                L10_156 = 2003
                L8_154(L9_155, L10_156)
              elseif L7_153 == 10 then
                L9_155 = A0_146
                L10_156 = 3044
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1280005 then
                L9_155 = A0_146
                L10_156 = 1280005
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1280003 then
                L9_155 = A0_146
                L10_156 = 1280003
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1280066 then
                L9_155 = A0_146
                L10_156 = 1280066
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1280073 then
                L9_155 = A0_146
                L10_156 = 1280073
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1280034 then
                L9_155 = A0_146
                L10_156 = 1280034
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1280033 then
                L9_155 = A0_146
                L10_156 = 1280033
                L8_154(L9_155, L10_156)
              elseif L7_153 == 1125 then
                L9_155 = A0_146
                L10_156 = 1125
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3521 then
                L9_155 = A0_146
                L10_156 = 3521
                L8_154(L9_155, L10_156)
              elseif L7_153 == 4503 then
                L9_155 = A0_146
                L10_156 = 4503
                L8_154(L9_155, L10_156)
              elseif L7_153 == 51143 then
                L9_155 = A0_146
                L10_156 = 1041
                L8_154(L9_155, L10_156)
              elseif L7_153 == 51144 then
                L9_155 = A0_146
                L10_156 = 1011
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3107616 or L7_153 == 3102012 then
                L9_155 = A0_146
                L10_156 = 1280007
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3100801 then
                L9_155 = A0_146
                L10_156 = 1280004
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3104214 or L7_153 == 3102720 then
                L9_155 = A0_146
                L10_156 = 1280005
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3107618 or L7_153 == 3104513 or L7_153 == 3103203 then
                L9_155 = A0_146
                L10_156 = 1122
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3104323 or L7_153 == 3101612 then
                L9_155 = A0_146
                L10_156 = 1280020
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3106628 then
                L9_155 = A0_146
                L10_156 = 1125
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3100311 or L7_153 == 3101511 then
                L9_155 = A0_146
                L10_156 = 1280067
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3110312 then
                L9_155 = A0_146
                L10_156 = 1280073
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3101513 or L7_153 == 3102806 or L7_153 == 3101011 or L7_153 == 3106221 or L7_153 == 3100515 then
                L9_155 = A0_146
                L10_156 = 1280078
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3100512 or L7_153 == 3105915 then
                L9_155 = A0_146
                L10_156 = 1280066
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3102611 or L7_153 == 3100612 then
                L9_155 = A0_146
                L10_156 = 1280082
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3103009 or L7_153 == 3100117 then
                L9_155 = A0_146
                L10_156 = 1280034
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3102311 or L7_153 == 3105515 or L7_153 == 3100913 then
                L9_155 = A0_146
                L10_156 = 3019
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3106312 or L7_153 == 3101415 then
                L9_155 = A0_146
                L10_156 = 1280052
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3106557 then
                L9_155 = A0_146
                L10_156 = 3521
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3100717 or L7_153 == 3106209 or L7_153 == 3106019 then
                L9_155 = A0_146
                L10_156 = 1280094
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3106433 then
                L9_155 = A0_146
                L10_156 = 4503
                L8_154(L9_155, L10_156)
              elseif L7_153 == 3101710 then
                L9_155 = A0_146
                L10_156 = 1280121
                L8_154(L9_155, L10_156)
              end
            else
            end
            L9_155 = A0_146
            L10_156 = 3
            L11_157 = nil
            L12_158 = A2_148
            L13_159 = L7_153
            L8_154(L9_155, L10_156, L11_157, L12_158, L13_159)
            else
              for L9_155 = 1, 4 do
                L10_156 = "ComboBox_Skill_"
                L11_157 = tostring
                L12_158 = L9_155
                L11_157 = L11_157(L12_158)
                L10_156 = L10_156 .. L11_157
                if A2_148 == L10_156 then
                  L11_157 = A0_146
                  L10_156 = A0_146.getSelectedIndex
                  L12_158 = A2_148
                  L10_156 = L10_156(L11_157, L12_158)
                  L12_158 = A0_146
                  L11_157 = A0_146.setSelectedIndex
                  L13_159 = A2_148
                  L11_157(L12_158, L13_159, -1)
                  if L10_156 > -1 then
                    L12_158 = A0_146
                    L11_157 = A0_146.getUserWorkInt
                    L13_159 = 2
                    L11_157 = L11_157(L12_158, L13_159, nil, A2_148)
                    if L10_156 ~= L11_157 then
                      L12_158 = A0_146
                      L11_157 = A0_146.setUserWorkInt
                      L13_159 = 2
                      L11_157(L12_158, L13_159, nil, A2_148, L10_156)
                      if L10_156 < 1 then
                        L12_158 = A0_146
                        L11_157 = A0_146.setUserWorkInt
                        L13_159 = 3
                        L11_157(L12_158, L13_159, nil, A2_148, 0)
                        L12_158 = A0_146
                        L11_157 = A0_146.setUserWorkInt
                        L13_159 = 4
                        L11_157(L12_158, L13_159, nil, A2_148, 0)
                      else
                        L11_157 = "ComboBoxItem_Skill_"
                        L12_158 = tostring
                        L13_159 = L9_155
                        L12_158 = L12_158(L13_159)
                        L13_159 = "_"
                        L11_157 = L11_157 .. L12_158 .. L13_159 .. tostring(L10_156 + 1)
                        L13_159 = A0_146
                        L12_158 = A0_146.getUserWorkInt
                        L12_158 = L12_158(L13_159, 4, nil, L11_157)
                        L13_159 = A0_146.getUserWorkInt
                        L13_159 = L13_159(A0_146, 3, nil, L11_157)
                        A0_146:setUserWorkInt(3, nil, A2_148, L13_159)
                        A0_146:setUserWorkInt(4, nil, A2_148, L12_158)
                        A0_146:checkRankNumberRange(L9_155, L13_159, L12_158)
                        break
                      end
                    end
                  end
                end
              end
            end
          end
        else
        end
    end
    return
  end
  if A3_149 == "NumberInputBox.ValueChanged" then
    for L9_155 = 1, 4 do
      L10_156 = "CustomControl_RankFrom_"
      L11_157 = tostring
      L12_158 = L9_155
      L11_157 = L11_157(L12_158)
      L10_156 = L10_156 .. L11_157
      if A2_148 == L10_156 then
        L11_157 = A0_146
        L10_156 = A0_146.updateNumber
        L12_158 = L9_155
        L13_159 = "CustomControl_RankFrom_"
        L10_156(L11_157, L12_158, L13_159)
      else
        L10_156 = "CustomControl_RankTo_"
        L11_157 = tostring
        L12_158 = L9_155
        L11_157 = L11_157(L12_158)
        L10_156 = L10_156 .. L11_157
        if A2_148 == L10_156 then
          L11_157 = A0_146
          L10_156 = A0_146.updateNumber
          L12_158 = L9_155
          L13_159 = "CustomControl_RankTo_"
          L10_156(L11_157, L12_158, L13_159)
        else
          L10_156 = "CustomControl_NumberOfPeople_"
          L11_157 = tostring
          L12_158 = L9_155
          L11_157 = L11_157(L12_158)
          L10_156 = L10_156 .. L11_157
          if A2_148 == L10_156 then
            L11_157 = A0_146
            L10_156 = A0_146.updateNumber
            L12_158 = L9_155
            L13_159 = "CustomControl_NumberOfPeople_"
            L10_156(L11_157, L12_158, L13_159)
          end
        end
      end
    end
    if L6_152 ~= 0 then
      L10_156 = A0_146
      L9_155 = A0_146.isOperateButtonEnable
      L13_159 = L9_155(L10_156)
      L6_152(L7_153, L8_154, L9_155, L10_156, L11_157, L12_158, L13_159, L9_155(L10_156))
    else
      L9_155 = true
      L6_152(L7_153, L8_154, L9_155)
    end
  end
end
function PcMatchingEditWidget.processUICommandClose(A0_160, A1_161, A2_162, A3_163, A4_164)
  if A0_160.work.chosenOperation ~= 0 then
    return
  end
  if A0_160:_getParentWidget() ~= nil then
    A0_160:_getParentWidget():updateChildWidgetStatus("PcMatchingEditWidget", 0)
  end
  return desktopWidget:closeWidgetDirect(A0_160)
end
function PcMatchingEditWidget.processUICommandApplicationOperate(A0_165, A1_166, A2_167, A3_168, A4_169)
  if A2_167 == "TextBox_Comment" then
    if A0_165:getEnable("Button_Operate") then
      A0_165:setFocus("Button_Operate")
    elseif A0_165:getEnable("Button_Minus") then
      A0_165:setFocus("Button_Minus")
    elseif A0_165:getEnable("Button_Plus") then
      A0_165:setFocus("Button_Plus")
    end
  end
end
function PcMatchingEditWidget.processUICommandOperate(A0_170, A1_171, A2_172, A3_173, A4_174)
  local L5_175, L6_176, L7_177, L8_178, L9_179, L10_180, L11_181
  if A2_172 == "Button_Operate" then
    if L5_175 == 99 then
      L10_180 = A0_170
      L9_179 = A0_170.setUserWorkInt
      L11_181 = 3
      L9_179(L10_180, L11_181, nil, L8_178, L7_177)
      L10_180 = A0_170
      L9_179 = A0_170.setUserWorkInt
      L11_181 = 4
      L9_179(L10_180, L11_181, nil, L8_178, L6_176)
      L9_179 = "CustomControl_RankFrom_1"
      L11_181 = L5_175
      L10_180 = L5_175.getStateMainSkillLevel
      L10_180 = L10_180(L11_181)
      L10_180 = L10_180 + 100
      L11_181 = A0_170.setMaximum
      L11_181(A0_170, L9_179, L10_180)
      L11_181 = A0_170.setValue
      L11_181(A0_170, L9_179, L10_180)
      L9_179 = "CustomControl_RankTo_1"
      L11_181 = A0_170.setMaximum
      L11_181(A0_170, L9_179, 200)
      L11_181 = A0_170.setValue
      L11_181(A0_170, L9_179, 200)
      L11_181 = A0_170.setValue
      L11_181(A0_170, "CustomControl_NumberOfPeople_1", 1)
      L11_181 = A0_170.setValue
      L11_181(A0_170, "CustomControl_NumberOfPeople_3", 0)
      L11_181 = A0_170.setValue
      L11_181(A0_170, "CustomControl_NumberOfPeople_4", 0)
      L11_181 = L5_175.getMainClassOrJob
      L11_181 = L11_181(L5_175)
      A0_170:setUserWorkInt(3, nil, L8_178, L7_177)
      A0_170:setUserWorkInt(4, nil, L8_178, L11_181)
      L9_179 = "CustomControl_RankFrom_2"
      A0_170:setMaximum(L9_179, L10_180)
      A0_170:setValue(L9_179, L10_180)
      L9_179 = "CustomControl_RankTo_2"
      A0_170:setMaximum(L9_179, 200)
      A0_170:setValue(L9_179, 200)
      A0_170:setValue("CustomControl_NumberOfPeople_2", 1)
      if desktopWidget:getPlayerConfirmGroupCommandVariation() == 10001 or desktopWidget:getPlayerConfirmGroupCommandVariation() == 10002 then
        worldMaster:notify(worldMaster, 30507)
        if A0_170:_getParentWidget() ~= nil then
          A0_170:_getParentWidget():updateChildWidgetStatus("PcMatchingEditWidget", 0)
        end
        return desktopWidget:closeWidgetDirect(A0_170)
      end
      if 1 < desktopWidget:countPartyMember() and desktopWidget:isMyPartyLeaderForMyPlayer() == true then
        worldMaster:notify(worldMaster, 30507)
        return desktopWidget:closeWidgetDirect(A0_170)
      end
      A0_170:setSignal(3)
      if A0_170:_getParentWidget() ~= nil then
        A0_170:_getParentWidget():updateChildWidgetStatus("PcMatchingEditWidget", 3)
      end
    elseif L5_175 == 0 then
      L5_175.step = 1
      L9_179 = "Button_Operate"
      L10_180 = A0_170.work
      L10_180 = L10_180.step
      L5_175(L6_176, L7_177, L8_178, L9_179, L10_180)
      L9_179 = A0_170
      L11_181 = L8_178(L9_179)
      L5_175(L6_176, L7_177, L8_178, L9_179, L10_180, L11_181, L8_178(L9_179))
      L5_175(L6_176, L7_177)
      L5_175(L6_176, L7_177)
    elseif L5_175 == 1 then
      L5_175.step = 2
      L9_179 = "Button_Operate"
      L10_180 = A0_170.work
      L10_180 = L10_180.step
      L5_175(L6_176, L7_177, L8_178, L9_179, L10_180)
      L9_179 = A0_170
      L11_181 = L8_178(L9_179)
      L5_175(L6_176, L7_177, L8_178, L9_179, L10_180, L11_181, L8_178(L9_179))
      L5_175(L6_176, L7_177)
      L5_175(L6_176, L7_177)
    elseif L5_175 == 2 then
      L9_179 = "ComboBox_Purpose"
      if L5_175 == -1 then
        L9_179 = "ComboBox_Purpose"
        L10_180 = 0
        L5_175(L6_176, L7_177, L8_178, L9_179, L10_180)
      end
      L9_179 = "ComboBox_Place"
      if L5_175 == -1 then
        L9_179 = "ComboBox_Place"
        L10_180 = 0
        L5_175(L6_176, L7_177, L8_178, L9_179, L10_180)
      end
      L9_179 = "ComboBox_GLName"
      if L5_175 == -1 then
        L9_179 = "ComboBox_GLName"
        L10_180 = 0
        L5_175(L6_176, L7_177, L8_178, L9_179, L10_180)
      end
      for L8_178 = 1, 4 do
        L9_179 = "ComboBox_Skill_"
        L10_180 = tostring
        L11_181 = L8_178
        L10_180 = L10_180(L11_181)
        L9_179 = L9_179 .. L10_180
        L11_181 = A0_170
        L10_180 = A0_170.getUserWorkInt
        L10_180 = L10_180(L11_181, 2, nil, L9_179)
        if L10_180 == -1 then
          L11_181 = A0_170
          L10_180 = A0_170.setUserWorkInt
          L10_180(L11_181, 2, nil, L9_179, 0)
          L11_181 = A0_170
          L10_180 = A0_170.setUserWorkInt
          L10_180(L11_181, 3, nil, L9_179, 0)
          L11_181 = A0_170
          L10_180 = A0_170.setUserWorkInt
          L10_180(L11_181, 4, nil, L9_179, 0)
        end
      end
      if L5_175 == 10001 or L5_175 == 10002 then
        L9_179 = L8_178
        L10_180 = worldMaster
        L11_181 = 30507
        L8_178(L9_179, L10_180, L11_181)
        L9_179 = A0_170
        if L8_178 ~= nil then
          L10_180 = L8_178
          L9_179 = L8_178.updateChildWidgetStatus
          L11_181 = "PcMatchingEditWidget"
          L9_179(L10_180, L11_181, 0)
        end
        L9_179 = desktopWidget
        L10_180 = L9_179
        L9_179 = L9_179.closeWidgetDirect
        L11_181 = A0_170
        return L9_179(L10_180, L11_181)
      end
      if L8_178 == 30 then
        L9_179 = A0_170
        L10_180 = 3
        L11_181 = nil
        L8_178(L9_179, L10_180, L11_181, "ComboBox_Purpose", A0_170:getUserWorkInt(3, nil, "ComboBox_GLName"))
        L9_179 = A0_170
        L10_180 = 3
        L11_181 = nil
        L8_178(L9_179, L10_180, L11_181, "ComboBox_GLName", 0)
      end
      L9_179 = A0_170
      L10_180 = 3
      L8_178(L9_179, L10_180)
      L9_179 = A0_170
      if L8_178 ~= nil then
        L10_180 = L8_178
        L9_179 = L8_178.updateChildWidgetStatus
        L11_181 = "PcMatchingEditWidget"
        L9_179(L10_180, L11_181, 3)
      end
    end
    return
  end
  if A2_172 == "Button_Minus" then
    if L5_175 > 1 then
      L5_175.matchNum = L6_176
      L5_175(L6_176, L7_177)
      L5_175(L6_176, L7_177)
    end
    if L5_175 ~= 0 then
      L9_179 = A0_170
      L11_181 = L8_178(L9_179)
      L5_175(L6_176, L7_177, L8_178, L9_179, L10_180, L11_181, L8_178(L9_179))
    else
      L5_175(L6_176, L7_177, L8_178)
    end
  end
  if A2_172 == "Button_Plus" then
    if L5_175 < 4 then
      L5_175.matchNum = L6_176
      L5_175(L6_176, L7_177)
    end
    for L9_179 = 1, L7_177.matchNum do
      L11_181 = A0_170
      L10_180 = A0_170.getValue
      L10_180 = L10_180(L11_181, "CustomControl_NumberOfPeople_" .. tostring(L9_179))
    end
    if L7_177 ~= 0 then
      L9_179 = "Button_Operate"
      L11_181 = A0_170
      L10_180 = A0_170.isOperateButtonEnable
      L11_181 = L10_180(L11_181)
      L7_177(L8_178, L9_179, L10_180, L11_181, L10_180(L11_181))
    else
      L9_179 = "Button_Operate"
      L10_180 = true
      L7_177(L8_178, L9_179, L10_180)
    end
  end
end
function PcMatchingEditWidget.processUICommandCancel(A0_182, A1_183, A2_184, A3_185, A4_186)
  local L5_187, L6_188, L7_189, L8_190, L9_191
  L5_187 = A0_182.getKeyboardFocusedControl
  L5_187 = L5_187(L6_188)
  for L9_191 = 0, 1 do
    if L5_187 == tostring(L9_191) then
      A0_182:setWindowFocus(A2_184)
      return
    end
  end
  if A2_184 == "TextBox_Comment" then
    if L6_188 == 99 then
      L6_188(L7_189, L8_190)
    elseif L6_188 then
      L6_188(L7_189, L8_190)
    elseif L6_188 then
      L6_188(L7_189, L8_190)
    elseif L6_188 then
      L6_188(L7_189, L8_190)
    end
  elseif L6_188 == 99 then
    if L6_188 == "Button_Operate" then
      L6_188(L7_189, L8_190)
    else
      if L6_188 ~= nil then
        L9_191 = "PcMatchingEditWidget"
        L7_189(L8_190, L9_191, 0)
      end
      L9_191 = A0_182
      return L7_189(L8_190, L9_191)
    end
  elseif L6_188 == 0 then
    if L6_188 ~= nil then
      L9_191 = "PcMatchingEditWidget"
      L7_189(L8_190, L9_191, 0)
    end
    L9_191 = A0_182
    return L7_189(L8_190, L9_191)
  elseif L6_188 == 1 then
    if L6_188 > 1 then
      L6_188.matchNum = L7_189
      L6_188(L7_189, L8_190)
      L6_188(L7_189, L8_190)
      L9_191 = A0_182.isOperateButtonEnable
      L9_191 = L9_191(A0_182)
      L6_188(L7_189, L8_190, L9_191, L9_191(A0_182))
      L9_191 = tostring
      L9_191 = L9_191(A0_182.work.matchNum)
      L6_188(L7_189, L8_190)
      return
    end
    L6_188(L7_189, L8_190)
    L6_188.step = 0
    L9_191 = nil
    L6_188(L7_189, L8_190, L9_191, "Button_Operate", A0_182.work.step)
    L9_191 = true
    L6_188(L7_189, L8_190, L9_191)
    L6_188(L7_189, L8_190)
    L6_188(L7_189, L8_190)
  elseif L6_188 == 2 then
    L6_188.step = 1
    L9_191 = nil
    L6_188(L7_189, L8_190, L9_191, "Button_Operate", A0_182.work.step)
    L9_191 = A0_182.isOperateButtonEnable
    L9_191 = L9_191(A0_182)
    L6_188(L7_189, L8_190, L9_191, L9_191(A0_182))
    L6_188(L7_189, L8_190)
    L9_191 = tostring
    L9_191 = L9_191(A0_182.work.matchNum)
    L6_188(L7_189, L8_190)
  end
end
function PcMatchingEditWidget.updateNumber(A0_192, A1_193, A2_194)
  local L3_195, L4_196, L5_197, L6_198, L7_199, L8_200, L9_201
  L3_195 = A2_194
  L4_196 = tostring
  L4_196 = L4_196(L5_197)
  L3_195 = L3_195 .. L4_196
  if A2_194 == "CustomControl_RankFrom_" then
    L4_196 = A0_192.getControlProperty
    L4_196 = L4_196(L5_197, L6_198, L7_199)
    if L4_196 == true then
      L4_196 = "CustomControl_RankTo_"
      L4_196 = L4_196 .. L5_197
      L9_201 = "Value"
      if L5_197 > L6_198 then
        L9_201 = L5_197
        L6_198(L7_199, L8_200, L9_201)
      end
    end
  elseif A2_194 == "CustomControl_RankTo_" then
    L4_196 = A0_192.getControlProperty
    L4_196 = L4_196(L5_197, L6_198, L7_199)
    if L4_196 == true then
      L4_196 = "CustomControl_RankFrom_"
      L4_196 = L4_196 .. L5_197
      L9_201 = "Value"
      if L5_197 < L6_198 then
        L9_201 = L5_197
        L6_198(L7_199, L8_200, L9_201)
      end
    end
  elseif A2_194 == "CustomControl_NumberOfPeople_" then
    L4_196 = A0_192.getControlProperty
    L4_196 = L4_196(L5_197, L6_198, L7_199)
    if L4_196 == true then
      L4_196 = 0
      for L8_200 = 1, L6_198.matchNum do
        if L8_200 ~= A1_193 then
          L9_201 = A0_192.getValue
          L9_201 = L9_201(A0_192, A2_194 .. tostring(L8_200))
          L4_196 = L4_196 + L9_201
        end
      end
      if L5_197 > L6_198 then
        L9_201 = A0_192
        L5_197(L6_198, L7_199, L8_200)
      end
      for L9_201 = 1, L7_199.matchNum do
      end
      if L6_198 ~= 4 then
      else
        if L5_197 >= L6_198 then
          L9_201 = false
          L6_198(L7_199, L8_200, L9_201)
      end
      else
        L9_201 = true
        L6_198(L7_199, L8_200, L9_201)
      end
    end
  end
end
function PcMatchingEditWidget.setWindowFocus(A0_202, A1_203)
  if A1_203 ~= nil and A1_203 ~= "" then
    A0_202:setLogicalFocus(A1_203)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_202 then
      A0_202:setKeyboardFocusedControl(A1_203)
    end
  end
end
function PcMatchingEditWidget.setJournalContentsLineNumber(A0_204, A1_205)
end
function PcMatchingEditWidget.update(A0_206)
  local L1_207, L2_208, L3_209, L4_210
  if L1_207 == false then
    for L4_210 = 1, 4 do
      A0_206:checkRankNumberRange(L4_210, 0, 0)
    end
  end
  L1_207.capget = true
end
function PcMatchingEditWidget.setSignal(A0_211, A1_212)
  if A1_212 == 0 then
    return
  end
  A0_211:setUserWorkInt(3, nil, "Button_Operate", A1_212)
end
function PcMatchingEditWidget.getSignal(A0_213)
  return A0_213:getUserWorkInt(3, nil, "Button_Operate")
end
function PcMatchingEditWidget.setMinimum(A0_214, A1_215, A2_216)
  A0_214:setControlProperty(A1_215, "Minimum", A2_216)
end
