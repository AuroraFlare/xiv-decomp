require("/Widget/WidgetBaseClass")
_defineClass("PcMatchingFindWidget", "WidgetBaseClass")
function PcMatchingFindWidget.init(A0_0)
  local L1_1
  L1_1 = A0_0.work
  L1_1._temp = {
    {
      "chosenOperation",
      "integer8"
    },
    {"step", "integer8"},
    {"listindex", "integer8"},
    {"view", "integer8"},
    {"closeOK", "boolean"}
  }
  L1_1 = A0_0.work
  L1_1.chosenOperation = 0
  L1_1 = A0_0.work
  L1_1.listindex = -1
  L1_1 = A0_0.work
  L1_1.view = 0
  L1_1 = A0_0.work
  L1_1.closeOK = false
  L1_1 = A0_0.setCancelCondition
  L1_1(A0_0)
  L1_1 = A0_0.setCloseCondition
  L1_1(A0_0)
  L1_1 = A0_0.setConfirmCondition
  L1_1(A0_0, "Button_Operate")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "ComboBox_Purpose", "UILuaCommands.SelectComboBoxItem")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "ComboBox_Place", "UILuaCommands.SelectComboBoxItem")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "ComboBox_Skill", "UILuaCommands.SelectComboBoxItem")
  L1_1 = A0_0.setApplicationOperateCommand
  L1_1(A0_0, "TextBox_PersonName")
  L1_1 = A0_0.setCancelCondition
  L1_1(A0_0, "TextBox_PersonName")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "Button_Operate", "UILuaCommands.PropertyChanged")
  L1_1 = A0_0.makePurposeList
  L1_1(A0_0)
  L1_1 = A0_0.makePlaceList
  L1_1(A0_0)
  L1_1 = A0_0.makeSkillList
  L1_1(A0_0)
  L1_1 = A0_0.setUserWorkInt
  L1_1(A0_0, 2, nil, "ComboBox_Purpose", -1)
  L1_1 = A0_0.setUserWorkInt
  L1_1(A0_0, 2, nil, "ComboBox_Place", -1)
  L1_1 = A0_0.setUserWorkInt
  L1_1(A0_0, 2, nil, "ComboBox_Skill", -1)
  L1_1 = A0_0.setVisibility
  L1_1(A0_0, "Grid_SearchResult", false)
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "ListBox_SearchResult", "UILuaCommands.Selection")
  L1_1 = A0_0.setModal
  L1_1(A0_0, true)
  L1_1 = A0_0.setDrag
  L1_1(A0_0, true)
  L1_1 = A0_0.work
  L1_1.step = 0
  L1_1 = A0_0.setGrid
  L1_1(A0_0, A0_0.work.step)
  L1_1 = A0_0.setHelpParameter
  L1_1(A0_0, "Button_Operate", 0)
  L1_1 = desktopWidget
  L1_1 = L1_1.demandPlayerExpInfomation
  L1_1(L1_1)
  L1_1 = desktopWidget
  L1_1 = L1_1.isChinese
  L1_1 = L1_1(L1_1)
  if L1_1 == false then
    L1_1 = A0_0.setControlProperty
    L1_1(A0_0, "TextBox_PersonName", "InputMethod.SqwtInputAllowedChars", "Alphabet")
    L1_1 = A0_0.setAcceptChars
    L1_1(A0_0, "TextBox_PersonName", "A-Z a-z Space")
    L1_1 = A0_0.setControlProperty
    L1_1(A0_0, "TextBox_PersonName", "InputMethod.SqwtInputMethodStatus", "Enable")
  else
    L1_1 = A0_0.setIMEInput
    L1_1(A0_0, "TextBox_PersonName", true)
    L1_1 = A0_0.setControlProperty
    L1_1(A0_0, "TextBox_PersonName", "MaxLength", "24b")
    L1_1 = A0_0.setControlProperty
    L1_1(A0_0, "TextBox_PersonName", "InputMethod.SqwtInputAllowedChars", "Alphabet|Number")
    L1_1 = A0_0.getControlProperty
    L1_1 = L1_1(A0_0, "TextBox_PersonName", "StringData.Value0")
    A0_0:setAcceptChars("TextBox_PersonName", L1_1)
    A0_0:setControlProperty("TextBox_PersonName", "InputMethod.SqwtInputMethodStatus", "Enable")
  end
  L1_1 = A0_0.setSignal
  L1_1(A0_0, 1)
end
function PcMatchingFindWidget.processBeforeShow(A0_2, A1_3)
  if A1_3 ~= true then
    if A0_2:_getParentWidget() ~= nil then
      A0_2:_getParentWidget():updateChildWidgetStatus("PcMatchingFindWidget")
    end
    A0_2:setFocus("ComboBox_Purpose")
  end
  return true
end
function PcMatchingFindWidget.makePurposeList(A0_4)
  A0_4:setPurposeList(0, 2920, 0)
  A0_4:setPurposeList(1, 4005, 1)
  A0_4:setPurposeList(2, 4026, 2)
  A0_4:setPurposeList(3, 4027, 3)
  A0_4:setPurposeList(4, 2941, 15)
  A0_4:setPurposeList(5, 2968, 16)
  A0_4:setPurposeList(6, 2961, 17)
  A0_4:setPurposeList(7, 2962, 19)
  A0_4:setPurposeList(8, 7301, 34)
  A0_4:setPurposeList(9, 10059, 20)
  A0_4:setPurposeList(10, 2963, 18)
  A0_4:setPurposeList(11, 2964, 32)
  A0_4:setPurposeList(12, 10049, 35)
  A0_4:setPurposeList(13, 2947, 31)
  A0_4:setPurposeList(14, 2949, 33)
  A0_4:setPurposeList(15, 2942, 99)
end
function PcMatchingFindWidget.setPurposeList(A0_5, A1_6, A2_7, A3_8)
  local L4_9
  L4_9 = "ComboBoxItem_Purpose_"
  L4_9 = L4_9 .. tostring(A1_6 + 1)
  A0_5:setUserWorkInt(2, nil, L4_9, A3_8)
  A0_5:setContent(L4_9, A2_7)
end
function PcMatchingFindWidget.makePlaceList(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15
  for L4_14 = 1, 49 do
    L5_15 = "ComboBoxItem_Place_"
    L5_15 = L5_15 .. tostring(L4_14 + 1)
    A0_10:setVisibility(L5_15, false)
    A0_10:setContent(L5_15, "")
    A0_10:setUserWorkInt(2, nil, L5_15, 0)
  end
  L4_14 = L1_11
  L5_15 = 1280001
  L4_14 = L1_11
  L5_15 = 1280002
  L4_14 = L1_11
  L5_15 = 1280007
  L4_14 = L1_11
  L5_15 = 1280003
  L4_14 = L1_11
  L5_15 = 1280004
  L4_14 = L1_11
  L5_15 = 1280005
  L4_14 = L1_11
  L5_15 = 1280006
  L4_14 = L1_11
  L5_15 = 1030
  L4_14 = L1_11
  L5_15 = 1122
  L4_14 = L1_11
  L5_15 = 1280020
  L4_14 = L1_11
  L5_15 = 1125
  L4_14 = L1_11
  L5_15 = 1011
  L4_14 = L1_11
  L5_15 = 1041
  L4_14 = L1_11
  L5_15 = 1280061
  L4_14 = L1_11
  L5_15 = 1280062
  L4_14 = L1_11
  L5_15 = 1280067
  L4_14 = L1_11
  L5_15 = 1280063
  L4_14 = L1_11
  L5_15 = 1280064
  L4_14 = L1_11
  L5_15 = 1280073
  L4_14 = L1_11
  L5_15 = 1280065
  L4_14 = L1_11
  L5_15 = 1280078
  L4_14 = L1_11
  L5_15 = 1280066
  L4_14 = L1_11
  L5_15 = 2003
  L4_14 = L1_11
  L5_15 = 1280082
  L4_14 = L1_11
  L5_15 = 1280031
  L4_14 = L1_11
  L5_15 = 1280032
  L4_14 = L1_11
  L5_15 = 1280033
  L4_14 = L1_11
  L5_15 = 1280039
  L4_14 = L1_11
  L5_15 = 1280034
  L4_14 = L1_11
  L5_15 = 3019
  L4_14 = L1_11
  L5_15 = 1280035
  L4_14 = L1_11
  L5_15 = 1280036
  L4_14 = L1_11
  L5_15 = 3044
  L4_14 = L1_11
  L5_15 = 1280052
  L4_14 = L1_11
  L5_15 = 1280054
  L4_14 = L1_11
  L5_15 = 3521
  L4_14 = L1_11
  L5_15 = 1280092
  L4_14 = L1_11
  L5_15 = 1280099
  L4_14 = L1_11
  L5_15 = 1280093
  L4_14 = L1_11
  L5_15 = 1280094
  L4_14 = L1_11
  L5_15 = 1280095
  L4_14 = L1_11
  L5_15 = 1280096
  L4_14 = L1_11
  L5_15 = 4503
  L4_14 = L1_11
  L5_15 = 4073
  L4_14 = L1_11
  L5_15 = 1280121
  L4_14 = L1_11
  L5_15 = 1280122
  L4_14 = L1_11
  L5_15 = 1280125
  L4_14 = L1_11
  L5_15 = 5009
  L4_14 = L1_11
  L5_15 = 3038
end
function PcMatchingFindWidget.setPlaceList(A0_16, A1_17, A2_18, A3_19)
  local L4_20
  L4_20 = "ComboBoxItem_Place_"
  L4_20 = L4_20 .. tostring(A1_17 + 1)
  if A2_18 > 1280000 then
    A0_16:setContent(L4_20, 211, A2_18)
  else
    A0_16:setContent(L4_20, 204, A2_18)
  end
  A0_16:setUserWorkInt(2, nil, L4_20, A2_18)
  A0_16:setVisibility(L4_20, true)
  if A3_19 ~= nil then
    A0_16:setEnable(L4_20, A3_19)
  end
  return A1_17 + 1
end
function PcMatchingFindWidget.makeSkillList(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32
  L2_23 = worldMaster
  L3_24 = L2_23
  L2_23 = L2_23._getMyPlayer
  L2_23 = L2_23(L3_24)
  L4_25 = L2_23
  L3_24 = L2_23.getStateMainSkill
  L3_24 = L3_24(L4_25)
  L5_26 = L2_23
  L4_25 = L2_23.getMainSkillCategory
  L4_25 = L4_25(L5_26)
  L6_27 = A0_21
  L5_26 = A0_21.getSocietyText
  L5_26 = L5_26(L6_27, L7_28)
  L6_27 = L2_23.getMainClassOrJob
  L6_27 = L6_27(L7_28)
  if A1_22 == nil then
    L10_31 = nil
    L11_32 = "Label_Rank"
    L7_28(L8_29, L9_30, L10_31, L11_32, L4_25)
    L10_31 = nil
    L11_32 = "Label_Rank"
    L7_28(L8_29, L9_30, L10_31, L11_32, L6_27)
    L10_31 = nil
    L11_32 = "Label_Rank"
    L7_28(L8_29, L9_30, L10_31, L11_32, L2_23:getMainSkillLevel())
  end
  L10_31 = 0
  L11_32 = 0
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 0
  L7_28(L8_29, L9_30, L10_31, L11_32, false)
  L10_31 = 1
  L11_32 = 3
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 2
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 4
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 8
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 7
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 16
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 15
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 17
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 19
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 1
  L11_32 = 18
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 21
  L11_32 = 0
  L7_28(L8_29, L9_30, L10_31, L11_32, false)
  L10_31 = 21
  L11_32 = 23
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 21
  L11_32 = 22
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 21
  L11_32 = 27
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 21
  L11_32 = 26
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 0
  L7_28(L8_29, L9_30, L10_31, L11_32, false)
  L10_31 = 29
  L11_32 = 29
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 30
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 31
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 32
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 33
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 34
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 35
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 29
  L11_32 = 36
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 39
  L11_32 = 0
  L7_28(L8_29, L9_30, L10_31, L11_32, false)
  L10_31 = 39
  L11_32 = 39
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 39
  L11_32 = 40
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = 39
  L11_32 = 41
  L7_28(L8_29, L9_30, L10_31, L11_32)
  L10_31 = false
  L7_28(L8_29, L9_30, L10_31)
  if A1_22 == nil then
    L10_31 = -1
    L7_28(L8_29, L9_30, L10_31)
    L7_28(L8_29, L9_30)
    for L10_31 = 1, 30 do
      L11_32 = "ComboBoxItem_Skill_"
      L11_32 = L11_32 .. tostring(L10_31)
      if A0_21:getUserWorkInt(4, nil, L11_32) == L6_27 then
        A0_21:setText("ComboBox_Skill", 206, L6_27)
        A0_21:setUserWorkInt(2, nil, "ComboBox_Skill", L10_31 - 1)
        break
      end
    end
  end
end
function PcMatchingFindWidget.setSkillComboBoxData(A0_33, A1_34, A2_35, A3_36, A4_37)
  local L5_38, L6_39, L7_40, L8_41
  L5_38 = "ComboBoxItem_Skill_"
  L6_39 = tostring
  L7_40 = A1_34
  L6_39 = L6_39(L7_40)
  L5_38 = L5_38 .. L6_39
  L7_40 = A0_33
  L6_39 = A0_33.setUserWorkInt
  L8_41 = 3
  L6_39(L7_40, L8_41, nil, L5_38, A2_35)
  L7_40 = A0_33
  L6_39 = A0_33.setUserWorkInt
  L8_41 = 4
  L6_39(L7_40, L8_41, nil, L5_38, A3_36)
  L6_39 = L5_38
  L7_40 = ":Button_XXX"
  L6_39 = L6_39 .. L7_40
  if A3_36 ~= 0 then
    L8_41 = A0_33
    L7_40 = A0_33.setContent
    L7_40(L8_41, L5_38, 206, A3_36)
    L8_41 = A0_33
    L7_40 = A0_33.setControlProperty
    L7_40(L8_41, L5_38, "FontStyle", "")
  elseif A2_35 ~= 0 then
    L7_40 = nil
    if A2_35 == 1 then
      L7_40 = 100701
    elseif A2_35 == 21 then
      L7_40 = 100702
    elseif A2_35 == 29 then
      L7_40 = 100704
    elseif A2_35 == 39 then
      L7_40 = 100703
    end
    L8_41 = A0_33.setContent
    L8_41(A0_33, L5_38, L7_40)
    L8_41 = A0_33.setControlProperty
    L8_41(A0_33, L5_38, "FontStyle", "Italic")
  end
  L7_40 = worldMaster
  L8_41 = L7_40
  L7_40 = L7_40._getMyPlayer
  L7_40 = L7_40(L8_41)
  L8_41 = A0_33.getUserWorkInt
  L8_41 = L8_41(A0_33, 3, nil, "ComboBox_Purpose")
  if L8_41 == 99 then
    if A3_36 ~= 0 then
      L8_41 = A0_33.setControlProperty
      L8_41(A0_33, L5_38, "Foreground", "#ffffffff")
      L8_41 = A0_33.setEnable
      L8_41(A0_33, L6_39, true)
    else
      L8_41 = A0_33.setControlProperty
      L8_41(A0_33, L5_38, "Foreground", "#ffffffc0")
    end
  elseif A3_36 ~= 0 then
    L8_41 = nil
    if L7_40:isJob(A3_36) then
      L8_41 = L7_40:hasItem(101, L7_40:getJobItemId(A3_36))
    else
      L8_41 = L7_40:isSkillEnabled(A3_36)
    end
    if not L8_41 then
      A0_33:setControlProperty(L5_38, "Foreground", "#ffc0c0c0")
      A0_33:setEnable(L6_39, false)
    else
      A0_33:setControlProperty(L5_38, "Foreground", "#ffffffff")
      A0_33:setEnable(L6_39, true)
    end
    if A3_36 == L7_40:getMainClassOrJob() then
      A0_33:setControlProperty(L5_38, "Foreground", "#ffc0ffc0")
      A0_33:setEnable(L6_39, true)
    end
  else
    L8_41 = A0_33.getSocietyText
    L8_41 = L8_41(A0_33, A2_35)
    if L8_41 == A0_33:getSocietyText(L7_40:getMainSkillCategory()) then
      L8_41 = A0_33.setControlProperty
      L8_41(A0_33, L5_38, "Foreground", "#ffc0ffc0")
    else
      L8_41 = A0_33.setControlProperty
      L8_41(A0_33, L5_38, "Foreground", "#ffffffc0")
    end
  end
  if A4_37 ~= nil then
    L8_41 = A0_33.setEnable
    L8_41(A0_33, L6_39, false)
  end
end
function PcMatchingFindWidget.makeSkillListForInvite(A0_42)
  A0_42:makeSkillList()
  A0_42:setFocusedIndex("ComboBox_Skill", -1)
  A0_42:setSelectedIndex("ComboBox_Skill")
  A0_42:setUserWorkInt(2, nil, "ComboBox_Skill", 2)
  A0_42:setText("ComboBox_Skill", 100723)
  A0_42:setVisibility("ComboBoxItem_Skill_1", false)
  A0_42:setEnable("ComboBoxItem_Skill_2:Button_XXX", false)
  A0_42:setEnable("ComboBoxItem_Skill_13:Button_XXX", false)
  A0_42:setEnable("ComboBoxItem_Skill_18:Button_XXX", false)
  A0_42:setEnable("ComboBoxItem_Skill_27:Button_XXX", false)
end
function PcMatchingFindWidget.setGrid(A0_43, A1_44)
  if A1_44 == 0 then
    A0_43:setVisibility("Grid_SearchResult", false)
  elseif A1_44 == 1 then
    A0_43:setVisibility("Grid_SearchResult", true)
  end
end
function PcMatchingFindWidget.setFocus(A0_45, A1_46)
  if A1_46 ~= nil and A1_46 ~= "" then
    A0_45:setLogicalFocus(A1_46)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_45 then
      A0_45:setKeyboardFocusedControl(A1_46)
    end
  end
end
function PcMatchingFindWidget.checkFocusInNumberInput(A0_47)
  if A0_47:getKeyboardFocusedControl() == "0" then
    return true
  else
    return false
  end
end
function PcMatchingFindWidget.processUICommandClose(A0_48, A1_49, A2_50, A3_51, A4_52)
  if A0_48:_getParentWidget() ~= nil then
    A0_48:_getParentWidget():updateChildWidgetStatus("PcMatchingFindWidget", 4)
  end
  return desktopWidget:closeWidgetDirect(A0_48)
end
function PcMatchingFindWidget.processUICommandApplicationOperate(A0_53, A1_54, A2_55, A3_56, A4_57)
  if A2_55 == "TextBox_PersonName" then
    A0_53:setFocus("ComboBox_Purpose")
  end
end
function PcMatchingFindWidget.processUICommandOperate(A0_58, A1_59, A2_60, A3_61, A4_62)
  local L5_63, L6_64, L7_65, L8_66
  if A2_60 == "Button_Operate" then
    L6_64 = A0_58
    L5_63 = A0_58.getUserWorkInt
    L7_65 = 2
    L8_66 = nil
    L5_63 = L5_63(L6_64, L7_65, L8_66, "ComboBox_Purpose")
    if L5_63 <= 0 then
      L6_64 = A0_58
      L5_63 = A0_58.setUserWorkInt
      L7_65 = 3
      L8_66 = nil
      L5_63(L6_64, L7_65, L8_66, "ComboBox_Purpose", 0)
    end
    L6_64 = A0_58
    L5_63 = A0_58.getUserWorkInt
    L7_65 = 2
    L8_66 = nil
    L5_63 = L5_63(L6_64, L7_65, L8_66, "ComboBox_Place")
    if L5_63 <= 0 then
      L6_64 = A0_58
      L5_63 = A0_58.setUserWorkInt
      L7_65 = 3
      L8_66 = nil
      L5_63(L6_64, L7_65, L8_66, "ComboBox_Place", 0)
    end
    L6_64 = A0_58
    L5_63 = A0_58.getUserWorkInt
    L7_65 = 2
    L8_66 = nil
    L5_63 = L5_63(L6_64, L7_65, L8_66, "ComboBox_Skill")
    if L5_63 <= 0 then
      L6_64 = A0_58
      L5_63 = A0_58.setUserWorkInt
      L7_65 = 3
      L8_66 = nil
      L5_63(L6_64, L7_65, L8_66, "ComboBox_Skill", 0)
    end
    L6_64 = A0_58
    L5_63 = A0_58.getUserWorkInt
    L7_65 = 3
    L8_66 = nil
    L5_63 = L5_63(L6_64, L7_65, L8_66, "ComboBox_Purpose")
    if L5_63 == 99 then
      L6_64 = A0_58
      L5_63 = A0_58.getUserWorkInt
      L7_65 = 2
      L8_66 = nil
      L5_63 = L5_63(L6_64, L7_65, L8_66, "ComboBox_Skill")
      L6_64 = "ComboBoxItem_Skill_"
      L7_65 = tostring
      L8_66 = L5_63 + 1
      L7_65 = L7_65(L8_66)
      L6_64 = L6_64 .. L7_65
      L8_66 = A0_58
      L7_65 = A0_58.getUserWorkInt
      L7_65 = L7_65(L8_66, 4, nil, L6_64)
      L8_66 = A0_58.getUserWorkInt
      L8_66 = L8_66(A0_58, 3, nil, L6_64)
      A0_58:setUserWorkInt(1, nil, "Label_Rank", L8_66)
      A0_58:setUserWorkInt(2, nil, "Label_Rank", L7_65)
      A0_58:setUserWorkInt(3, nil, "Label_Rank", 200)
      if L7_65 == 0 then
        if L8_66 == 0 then
          A0_58:setUserWorkInt(1, nil, "Label_Rank", 11)
          A0_58:setUserWorkInt(2, nil, "Label_Rank", 11)
        else
          A0_58:setUserWorkInt(1, nil, "Label_Rank", L8_66)
          A0_58:setUserWorkInt(2, nil, "Label_Rank", L8_66)
        end
        A0_58:setUserWorkInt(3, nil, "ComboBox_Skill", 1)
      else
        A0_58:setUserWorkInt(3, nil, "ComboBox_Skill", 2)
      end
    else
      L6_64 = A0_58
      L5_63 = A0_58.setUserWorkInt
      L7_65 = 3
      L8_66 = nil
      L5_63(L6_64, L7_65, L8_66, "ComboBox_Skill", 2)
    end
    L6_64 = A0_58
    L5_63 = A0_58.getUserWorkInt
    L7_65 = 1
    L8_66 = nil
    L5_63 = L5_63(L6_64, L7_65, L8_66, "Label_Rank")
    L7_65 = A0_58
    L6_64 = A0_58.getUserWorkInt
    L8_66 = 2
    L6_64 = L6_64(L7_65, L8_66, nil, "Label_Rank")
    L8_66 = A0_58
    L7_65 = A0_58.getUserWorkInt
    L7_65 = L7_65(L8_66, 3, nil, "Label_Rank")
    L8_66 = A0_58.work
    L8_66 = L8_66.step
    if L8_66 == 0 then
      L8_66 = A0_58.work
      L8_66.step = 1
      L8_66 = A0_58.work
      L8_66.listindex = -1
      L8_66 = A0_58.setSignal
      L8_66(A0_58, 3)
      L8_66 = A0_58._getParentWidget
      L8_66 = L8_66(A0_58)
      if L8_66 ~= nil then
        L8_66:updateChildWidgetStatus("PcMatchingFindWidget", 3)
      end
    else
      L8_66 = A0_58.work
      L8_66 = L8_66.step
      if L8_66 == 1 then
        L8_66 = A0_58.work
        L8_66.listindex = -1
        L8_66 = A0_58.setSignal
        L8_66(A0_58, 3)
        L8_66 = A0_58._getParentWidget
        L8_66 = L8_66(A0_58)
        if L8_66 ~= nil then
          L8_66:updateChildWidgetStatus("PcMatchingFindWidget", 3)
        end
      end
    end
    return
  end
end
function PcMatchingFindWidget.processUICommandCancel(A0_67, A1_68, A2_69, A3_70, A4_71)
  if A0_67:getKeyboardFocusedControl() == "TextBox_PersonName" then
    if A0_67:_getParentWidget() ~= nil then
      A0_67:_getParentWidget():updateChildWidgetStatus("PcMatchingFindWidget", 0)
    end
    return desktopWidget:closeWidgetDirect(A0_67)
  elseif A0_67.work.step == 0 then
    if A0_67:_getParentWidget() ~= nil then
      A0_67:_getParentWidget():updateChildWidgetStatus("PcMatchingFindWidget", 0)
    end
    return desktopWidget:closeWidgetDirect(A0_67)
  elseif A0_67.work.step == 1 then
    A0_67.work.step = 0
    A0_67:setGrid(A0_67.work.step)
    A0_67:setFocus("ComboBox_Purpose")
  end
end
function PcMatchingFindWidget.processUICommandSelection(A0_72, A1_73, A2_74, A3_75, A4_76)
  local L5_77, L6_78, L7_79, L8_80, L9_81, L10_82
  if A3_75 == -1 then
    L5_77 = A0_72.work
    L5_77 = L5_77.listindex
    if L5_77 == -1 then
      return
    end
  else
    L5_77 = A0_72.work
    L5_77.listindex = A3_75
  end
  L6_78 = A0_72
  L5_77 = A0_72.getListProperty
  L7_79 = "Result_Maker"
  L8_80 = A0_72.work
  L8_80 = L8_80.listindex
  L9_81 = "tableInt"
  L5_77 = L5_77(L6_78, L7_79, L8_80, L9_81)
  L7_79 = A0_72
  L6_78 = A0_72.getListProperty
  L8_80 = "Result_Maker"
  L9_81 = A0_72.work
  L9_81 = L9_81.listindex
  L10_82 = "name"
  L6_78 = L6_78(L7_79, L8_80, L9_81, L10_82)
  L8_80 = A0_72
  L7_79 = A0_72.getListProperty
  L9_81 = "Result_Maker"
  L10_82 = A0_72.work
  L10_82 = L10_82.listindex
  L7_79 = L7_79(L8_80, L9_81, L10_82, "purposeInt")
  L8_80 = desktopWidget
  L9_81 = L8_80
  L8_80 = L8_80.getPlayerName
  L8_80 = L8_80(L9_81)
  if L6_78 == L8_80 then
    L8_80 = desktopWidget
    L9_81 = L8_80
    L8_80 = L8_80.openChildWidget
    L10_82 = "PcMatchingViewWidget"
    L8_80 = L8_80(L9_81, L10_82, A0_72, true, 2, -1, L7_79)
    if L8_80 == true then
      L9_81 = A0_72.work
      L9_81.view = 1
      L10_82 = A0_72
      L9_81 = A0_72._getParentWidget
      L9_81 = L9_81(L10_82)
      if L9_81 ~= nil then
        L10_82 = L9_81.updateChildWidgetStatus
        L10_82(L9_81, "PcMatchingViewWidget", 1)
      end
    end
  else
    L9_81 = A0_72
    L8_80 = A0_72._getParentWidget
    L8_80 = L8_80(L9_81)
    L9_81 = nil
    if L8_80 ~= nil then
      L10_82 = L8_80.getEditMode
      L10_82 = L10_82(L8_80)
      L9_81 = L10_82
    end
    if L9_81 == 0 then
      L10_82 = desktopWidget
      L10_82 = L10_82.isJoinedPartyMyPlayer
      L10_82 = L10_82(L10_82)
    else
      if L10_82 == true then
        L10_82 = 1
        if L7_79 == 99 then
          L10_82 = 0
        end
        if desktopWidget:openChildWidget("PcMatchingViewWidget", A0_72, true, L10_82, L5_77, L7_79) == true then
          A0_72.work.view = 1
          if L8_80 ~= nil then
            L8_80:updateChildWidgetStatus("PcMatchingViewWidget", 1)
          end
        end
    end
    else
      L10_82 = desktopWidget
      L10_82 = L10_82.openChildWidget
      L10_82 = L10_82(L10_82, "PcMatchingViewWidget", A0_72, true, 0, L5_77, L7_79)
      if L10_82 == true then
        A0_72.work.view = 1
        if L8_80 ~= nil then
          L8_80:updateChildWidgetStatus("PcMatchingViewWidget", 1)
        end
      end
    end
  end
  L9_81 = A0_72
  L8_80 = A0_72.setSelectedIndex
  L10_82 = "ListBox_SearchResult"
  L8_80(L9_81, L10_82, -1)
end
function PcMatchingFindWidget.processUICommandDefault(A0_83, A1_84, A2_85, A3_86, A4_87, A5_88)
  local L6_89, L7_90, L8_91, L9_92, L10_93, L11_94
  if A3_86 == "UILuaCommands.PropertyChanged" then
    L7_90 = A0_83
    L6_89 = A0_83.getSignal
    L6_89 = L6_89(L7_90)
    if L6_89 == 4 then
      L7_90 = A0_83
      L6_89 = A0_83.setGrid
      L8_91 = A0_83.work
      L8_91 = L8_91.step
      L6_89(L7_90, L8_91)
      L7_90 = A0_83
      L6_89 = A0_83.setSignal
      L8_91 = 2
      L6_89(L7_90, L8_91)
      L7_90 = A0_83
      L6_89 = A0_83.updateList
      L6_89 = L6_89(L7_90)
      if L6_89 > 0 then
      end
      L7_90 = A0_83
      L6_89 = A0_83._getParentWidget
      L6_89 = L6_89(L7_90)
      if L6_89 ~= nil then
        L8_91 = L6_89
        L7_90 = L6_89.updateChildWidgetStatus
        L9_92 = "PcMatchingFindWidget"
        L10_93 = 2
        L7_90(L8_91, L9_92, L10_93)
      end
    end
    return
  end
  L6_89 = A0_83.work
  L6_89 = L6_89.chosenOperation
  if L6_89 == 1 then
    L7_90 = A0_83
    L6_89 = A0_83.getKeyboardFocusedControl
    L6_89 = L6_89(L7_90)
    if L6_89 == "Button_Operate" then
      L6_89 = A0_83.work
      L6_89.chosenOperation = 0
    end
  end
  L6_89 = A0_83.work
  L6_89 = L6_89.chosenOperation
  if L6_89 ~= 0 then
    return
  end
  L6_89 = desktopWidget
  L7_90 = L6_89
  L6_89 = L6_89.checkKeyboardFocused
  L8_91 = A0_83
  L6_89 = L6_89(L7_90, L8_91)
  if L6_89 == false then
    return
  end
  if A3_86 == "UILuaCommands.SelectComboBoxItem" then
    if A2_85 == "ComboBox_Purpose" then
      L7_90 = A0_83
      L6_89 = A0_83.getFocusedIndex
      L8_91 = A2_85
      L6_89 = L6_89(L7_90, L8_91)
      L8_91 = A0_83
      L7_90 = A0_83.setFocusedIndex
      L9_92 = A2_85
      L10_93 = -1
      L7_90(L8_91, L9_92, L10_93)
      if L6_89 > -1 then
        L8_91 = A0_83
        L7_90 = A0_83.getUserWorkInt
        L9_92 = 2
        L10_93 = nil
        L11_94 = A2_85
        L7_90 = L7_90(L8_91, L9_92, L10_93, L11_94)
        if L6_89 ~= L7_90 then
          L8_91 = A0_83
          L7_90 = A0_83.setUserWorkInt
          L9_92 = 2
          L10_93 = nil
          L11_94 = A2_85
          L7_90(L8_91, L9_92, L10_93, L11_94, L6_89)
          L8_91 = A0_83
          L7_90 = A0_83.getUserWorkInt
          L9_92 = 2
          L10_93 = nil
          L11_94 = "ComboBoxItem_Purpose_"
          L11_94 = L11_94 .. tostring(L6_89 + 1)
          L7_90 = L7_90(L8_91, L9_92, L10_93, L11_94)
          L9_92 = A0_83
          L8_91 = A0_83.setUserWorkInt
          L10_93 = 3
          L11_94 = nil
          L8_91(L9_92, L10_93, L11_94, A2_85, L7_90)
          L9_92 = A0_83
          L8_91 = A0_83.getUserWorkInt
          L10_93 = 3
          L11_94 = nil
          L8_91 = L8_91(L9_92, L10_93, L11_94, A2_85)
          if L8_91 == 99 then
            L9_92 = A0_83
            L8_91 = A0_83.makeSkillListForInvite
            L8_91(L9_92)
            L9_92 = A0_83
            L8_91 = A0_83.setHelpParameter
            L10_93 = "ComboBox_Skill"
            L11_94 = 1
            L8_91(L9_92, L10_93, L11_94, 75438)
          else
            L9_92 = A0_83
            L8_91 = A0_83.makeSkillList
            L8_91(L9_92)
            L9_92 = A0_83
            L8_91 = A0_83.setHelpParameter
            L10_93 = "ComboBox_Skill"
            L11_94 = 1
            L8_91(L9_92, L10_93, L11_94, 75435)
          end
        end
      end
    elseif A2_85 == "ComboBox_Place" then
      L7_90 = A0_83
      L6_89 = A0_83.getFocusedIndex
      L8_91 = A2_85
      L6_89 = L6_89(L7_90, L8_91)
      L8_91 = A0_83
      L7_90 = A0_83.setFocusedIndex
      L9_92 = A2_85
      L10_93 = -1
      L7_90(L8_91, L9_92, L10_93)
      if L6_89 > -1 then
        L8_91 = A0_83
        L7_90 = A0_83.getUserWorkInt
        L9_92 = 2
        L10_93 = nil
        L11_94 = A2_85
        L7_90 = L7_90(L8_91, L9_92, L10_93, L11_94)
        if L6_89 ~= L7_90 then
          L8_91 = A0_83
          L7_90 = A0_83.setUserWorkInt
          L9_92 = 2
          L10_93 = nil
          L11_94 = A2_85
          L7_90(L8_91, L9_92, L10_93, L11_94, L6_89)
          L8_91 = A0_83
          L7_90 = A0_83.getUserWorkInt
          L9_92 = 2
          L10_93 = nil
          L11_94 = "ComboBoxItem_Place_"
          L11_94 = L11_94 .. tostring(L6_89 + 1)
          L7_90 = L7_90(L8_91, L9_92, L10_93, L11_94)
          L9_92 = A0_83
          L8_91 = A0_83.setUserWorkInt
          L10_93 = 3
          L11_94 = nil
          L8_91(L9_92, L10_93, L11_94, A2_85, L7_90)
        end
      end
    elseif A2_85 == "ComboBox_Skill" then
      L7_90 = A0_83
      L6_89 = A0_83.getFocusedIndex
      L8_91 = A2_85
      L6_89 = L6_89(L7_90, L8_91)
      L8_91 = A0_83
      L7_90 = A0_83.setFocusedIndex
      L9_92 = A2_85
      L10_93 = -1
      L7_90(L8_91, L9_92, L10_93)
      if L6_89 > -1 then
        L8_91 = A0_83
        L7_90 = A0_83.getUserWorkInt
        L9_92 = 2
        L10_93 = nil
        L11_94 = A2_85
        L7_90 = L7_90(L8_91, L9_92, L10_93, L11_94)
        if L6_89 ~= L7_90 then
          L8_91 = A0_83
          L7_90 = A0_83.setUserWorkInt
          L9_92 = 2
          L10_93 = nil
          L11_94 = A2_85
          L7_90(L8_91, L9_92, L10_93, L11_94, L6_89)
          if L6_89 < 1 then
            L8_91 = A0_83
            L7_90 = A0_83.setUserWorkInt
            L9_92 = 3
            L10_93 = nil
            L11_94 = A2_85
            L7_90(L8_91, L9_92, L10_93, L11_94, 0)
            L8_91 = A0_83
            L7_90 = A0_83.setUserWorkInt
            L9_92 = 4
            L10_93 = nil
            L11_94 = A2_85
            L7_90(L8_91, L9_92, L10_93, L11_94, 0)
          else
            L7_90 = "ComboBoxItem_Skill_"
            L8_91 = tostring
            L9_92 = L6_89 + 1
            L8_91 = L8_91(L9_92)
            L7_90 = L7_90 .. L8_91
            L9_92 = A0_83
            L8_91 = A0_83.getUserWorkInt
            L10_93 = 4
            L11_94 = nil
            L8_91 = L8_91(L9_92, L10_93, L11_94, L7_90)
            L10_93 = A0_83
            L9_92 = A0_83.getUserWorkInt
            L11_94 = 3
            L9_92 = L9_92(L10_93, L11_94, nil, L7_90)
            L10_93 = worldMaster
            L11_94 = L10_93
            L10_93 = L10_93._getMyPlayer
            L10_93 = L10_93(L11_94)
            L11_94 = A0_83.setUserWorkInt
            L11_94(A0_83, 1, nil, "Label_Rank", L9_92)
            L11_94 = A0_83.setUserWorkInt
            L11_94(A0_83, 2, nil, "Label_Rank", L8_91)
            if L8_91 ~= 0 then
              L11_94 = L10_93.isJob
              L11_94 = L11_94(L10_93, L8_91)
              if L11_94 then
                L11_94 = L10_93.convertSkillId
                L11_94 = L11_94(L10_93, L8_91)
                A0_83:setUserWorkInt(3, nil, "Label_Rank", L10_93:getSkillLevel(L11_94))
              else
                L11_94 = A0_83.setUserWorkInt
                L11_94(A0_83, 3, nil, "Label_Rank", L10_93:getSkillLevel(L8_91))
              end
            else
              L11_94 = A0_83.setUserWorkInt
              L11_94(A0_83, 3, nil, "Label_Rank", 0)
            end
          end
        end
      end
    end
  end
end
function PcMatchingFindWidget.updateList(A0_95)
  local L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104, L10_105, L11_106, L12_107, L13_108, L14_109, L15_110
  L2_97 = A0_95
  L1_96 = A0_95.getUserWorkInt
  L1_96 = L1_96(L2_97, L3_98, L4_99, L5_100)
  if L1_96 == -1 then
    L2_97 = A0_95.setText
    L6_101 = 30
    L2_97(L3_98, L4_99, L5_100, L6_101)
    L1_96 = 30
  elseif L1_96 == 0 then
    L2_97 = A0_95.setText
    L2_97(L3_98, L4_99, L5_100)
  else
    L2_97 = A0_95.setText
    L6_101 = L1_96
    L2_97(L3_98, L4_99, L5_100, L6_101)
  end
  L2_97 = A0_95.getControlProperty
  L2_97 = L2_97(L3_98, L4_99, L5_100)
  if L1_96 == 0 then
  else
    for L6_101 = 0, L1_96 - 1 do
      L8_103 = A0_95
      L7_102 = A0_95.getListProperty
      L9_104 = "Result_Maker"
      L10_105 = L6_101
      L11_106 = "name"
      L7_102 = L7_102(L8_103, L9_104, L10_105, L11_106)
      L9_104 = A0_95
      L8_103 = A0_95.setListText
      L10_105 = "Result_Maker"
      L11_106 = L6_101
      L12_107 = "name2"
      L13_108 = 230
      L14_109 = L7_102
      L8_103(L9_104, L10_105, L11_106, L12_107, L13_108, L14_109)
      L9_104 = A0_95
      L8_103 = A0_95.setControlProperty
      L10_105 = "Result_Maker"
      L11_106 = "Index"
      L12_107 = L6_101
      L8_103(L9_104, L10_105, L11_106, L12_107)
      L9_104 = A0_95
      L8_103 = A0_95.getListProperty
      L10_105 = "Result_Maker"
      L11_106 = L6_101
      L12_107 = "purposeInt"
      L8_103 = L8_103(L9_104, L10_105, L11_106, L12_107)
      L9_104 = ""
      if L8_103 == 0 then
        L9_104 = 2920
      elseif L8_103 == 2 then
        L9_104 = 4026
      elseif L8_103 == 3 then
        L9_104 = 4027
      elseif L8_103 == 1 then
        L9_104 = 4005
      elseif L8_103 == 15 then
        L9_104 = 2941
      elseif L8_103 == 16 then
        L9_104 = 2968
      elseif L8_103 == 17 then
        L9_104 = 2961
      elseif L8_103 == 19 then
        L9_104 = 2962
      elseif L8_103 == 34 then
        L9_104 = 7301
      elseif L8_103 == 20 then
        L9_104 = 10059
      elseif L8_103 == 18 then
        L9_104 = 2963
      elseif L8_103 == 32 then
        L9_104 = 2964
      elseif L8_103 == 31 then
        L9_104 = 2947
      elseif L8_103 == 35 then
        L9_104 = 10049
      elseif L8_103 == 33 then
        L9_104 = 2949
      elseif L8_103 == 99 then
        L9_104 = 2942
      end
      L11_106 = A0_95
      L10_105 = A0_95.setListText
      L12_107 = "Result_Maker"
      L13_108 = L6_101
      L14_109 = "kind"
      L15_110 = L9_104
      L10_105(L11_106, L12_107, L13_108, L14_109, L15_110)
      L11_106 = A0_95
      L10_105 = A0_95.getListProperty
      L12_107 = "Result_Maker"
      L13_108 = L6_101
      L14_109 = "placeInt"
      L10_105 = L10_105(L11_106, L12_107, L13_108, L14_109)
      if L10_105 == 0 then
        L12_107 = A0_95
        L11_106 = A0_95.setListText
        L13_108 = "Result_Maker"
        L14_109 = L6_101
        L15_110 = "place"
        L11_106(L12_107, L13_108, L14_109, L15_110, 2921)
      elseif L10_105 > 1280000 then
        L12_107 = A0_95
        L11_106 = A0_95.setListText
        L13_108 = "Result_Maker"
        L14_109 = L6_101
        L15_110 = "place"
        L11_106(L12_107, L13_108, L14_109, L15_110, 211, L10_105)
      else
        L12_107 = A0_95
        L11_106 = A0_95.setListText
        L13_108 = "Result_Maker"
        L14_109 = L6_101
        L15_110 = "place"
        L11_106(L12_107, L13_108, L14_109, L15_110, 204, L10_105)
      end
      L12_107 = A0_95
      L11_106 = A0_95.getListProperty
      L13_108 = "Result_Maker"
      L14_109 = L6_101
      L15_110 = "socialInt"
      L11_106 = L11_106(L12_107, L13_108, L14_109, L15_110)
      L13_108 = A0_95
      L12_107 = A0_95.getListProperty
      L14_109 = "Result_Maker"
      L15_110 = L6_101
      L12_107 = L12_107(L13_108, L14_109, L15_110, "skillInt")
      L13_108 = 0
      if L11_106 == 0 then
        L15_110 = A0_95
        L14_109 = A0_95.setListText
        L14_109(L15_110, "Result_Maker", L6_101, "skill", 2923)
      elseif L12_107 == 0 then
        L15_110 = A0_95
        L14_109 = A0_95.setListText
        L14_109(L15_110, "Result_Maker", L6_101, "skill", A0_95:getSocietyText(L11_106))
      else
        L15_110 = A0_95
        L14_109 = A0_95.setListText
        L14_109(L15_110, "Result_Maker", L6_101, "skill", 206, L12_107)
      end
      L15_110 = A0_95
      L14_109 = A0_95.getListProperty
      L14_109 = L14_109(L15_110, "Result_Maker", L6_101, "currentInt")
      L15_110 = A0_95.getListProperty
      L15_110 = L15_110(A0_95, "Result_Maker", L6_101, "demandInt")
      if L8_103 ~= 99 then
        A0_95:setListText("Result_Maker", L6_101, "currentnum", 3551, L14_109, L15_110)
      else
        A0_95:setListProperty("Result_Maker", L6_101, "currentnum", " ")
      end
    end
    L3_98(L4_99, L5_100)
  end
  return L1_96
end
function PcMatchingFindWidget.getPartyRoot(A0_111)
  return A0_111:_getParentWidget()
end
function PcMatchingFindWidget.closeViewWidget(A0_112, A1_113, A2_114)
  if A1_113 == true then
    if A2_114 == nil then
      if A0_112:_getParentWidget() ~= nil then
        A0_112:_getParentWidget():updateChildWidgetStatus("PcMatchingFindWidget", 3)
      end
      desktopWidget:closeWidgetDirect(A0_112)
    else
      A0_112:_getParentWidget():closeViewWidget(A1_113, A2_114)
    end
  else
    desktopWidget:closeChildWidget("PcMatchingViewWidget", A0_112)
    A0_112.work.chosenOperation = 0
    if 0 < A0_112:getListPropertyCount("Result_Maker") then
      if A0_112.work.index > A0_112:getListPropertyCount("Result_Maker") - 1 then
        A0_112.work.index = A0_112:getListPropertyCount("Result_Maker") - 1
      end
      desktopWidget:changeFocusedWidget(A0_112, true)
      A0_112:setControlProperty("ListBox_SearchResult", "SqwtFocusedIndex", A0_112.work.index)
    end
  end
end
function PcMatchingFindWidget.getSocietyText(A0_115, A1_116)
  local L2_117
  L2_117 = 0
  if A1_116 == 1 or A1_116 == 10 then
    L2_117 = 100701
  elseif A1_116 == 21 or A1_116 == 28 then
    L2_117 = 100702
  elseif A1_116 == 39 or A1_116 == 42 then
    L2_117 = 100703
  elseif A1_116 == 29 or A1_116 == 37 then
    L2_117 = 100704
  elseif A1_116 == 11 then
    L2_117 = 2923
  end
  return L2_117
end
function PcMatchingFindWidget.makeTestList(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123
  L1_119 = 25
  for L5_123 = 0, L1_119 do
    A0_118:setListProperty("Result_Maker", L5_123, "name", "name" .. tostring(L5_123))
  end
  L2_120(L3_121, L4_122)
end
function PcMatchingFindWidget.update(A0_124)
  if A0_124:getUserWorkInt(3, nil, "ComboBox_Purpose") == 99 then
  else
    A0_124:makeSkillList(true)
  end
end
function PcMatchingFindWidget.setSignal(A0_125, A1_126)
  if A1_126 == 0 then
    return
  end
  A0_125:setUserWorkInt(3, nil, "Button_Operate", A1_126)
end
function PcMatchingFindWidget.getSignal(A0_127)
  return A0_127:getUserWorkInt(3, nil, "Button_Operate")
end
