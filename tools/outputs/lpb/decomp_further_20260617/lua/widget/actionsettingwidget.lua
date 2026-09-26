require("/Widget/WidgetBaseClass")
_defineClass("ActionSettingWidget", "WidgetBaseClass")
function ActionSettingWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "selectAction"
  L5_5 = "integer32"
  L4_4 = {L5_5, "integer32"}
  L5_5 = "selectClass"
  L5_5 = {"jobID", "integer32"}
  L1_1._temp = L2_2
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L4_4 = 10210
  L5_5 = 10064
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 10210
  L5_5 = 10065
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 10210
  L5_5 = 10062
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 10210
  L5_5 = 10063
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 10210
  L5_5 = 10060
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 10210
  L5_5 = 10059
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = 20
  L5_5 = 1
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 20
  L5_5 = 1
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 20
  L5_5 = 2
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 20
  L5_5 = 3
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 30
  L5_5 = 1
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 10
  L5_5 = 3
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 5
  L5_5 = 4
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 20
  L5_5 = 3
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 20
  L5_5 = 4
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 30
  L5_5 = 1
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 10
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  for L4_4 = 1, 20 do
    L5_5 = "Button_AddAction_"
    L5_5 = L5_5 .. tostring(L4_4) .. ":IconControl_CommandSelected"
    A0_0:setIcon(L5_5, 984)
  end
  for L4_4 = 1, 20 do
    L5_5 = "Button_ProductionCommand_"
    L5_5 = L5_5 .. tostring(L4_4) .. ":IconControl_CommandSelected"
    A0_0:setIcon(L5_5, 984)
  end
  L1_1.classType = L2_2
  L1_1.selectClass = 0
  L1_1(L2_2)
  if L1_1 == 1 then
    for L4_4 = 1, 7 do
      L5_5 = "Button_FighterSorcerer_"
      L5_5 = L5_5 .. tostring(L4_4) .. ":IconControl_CommandSelected"
      A0_0:setIcon(L5_5, 984)
    end
  else
    for L4_4 = 1, 8 do
      L5_5 = "Button_GathererCrafter_"
      L5_5 = L5_5 .. tostring(L4_4) .. ":IconControl_CommandSelected"
      A0_0:setIcon(L5_5, 984)
    end
  end
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1.selectActionIndex = 0
  L1_1.helpCommandID = 0
  L4_4 = L1_1
  L2_2.jobID = L3_3
  L4_4 = 3
  L5_5 = "Button_ClassAction_"
  L5_5 = L5_5 .. "1"
  L4_4 = A0_0
  L5_5 = L2_2
  L3_3(L4_4, L5_5)
  L4_4 = L3_3
  L3_3(L4_4)
end
function ActionSettingWidget.processUICommandOperate(A0_6, A1_7, A2_8, A3_9, A4_10)
  local L5_11, L6_12, L7_13
  L6_12 = A0_6
  L5_11 = A0_6.getControlUserWorkInt
  L7_13 = 2
  L5_11 = L5_11(L6_12, L7_13, A2_8)
  L6_12 = A3_9
  if L6_12 == 1 then
    L7_13 = A0_6.work
    L7_13 = L7_13.selectActionIndex
    if L7_13 == L5_11 then
      L7_13 = A0_6.equipAction
      L7_13(A0_6, L5_11, 0)
      L7_13 = A0_6.setEquipButtonEffect
      L7_13(A0_6, L5_11, false)
      L7_13 = A0_6.work
      L7_13.selectActionIndex = 0
    else
      L7_13 = A0_6.work
      L7_13 = L7_13.selectActionIndex
      if L7_13 ~= 0 then
        L7_13 = A0_6.work
        L7_13 = L7_13.selectAction
        if L7_13 ~= 0 then
          L7_13 = A0_6.equipAction
          L7_13(A0_6, L5_11, A0_6.work.selectAction)
        else
          L7_13 = A0_6.getEquippedCommandID
          L7_13 = L7_13(A0_6, L5_11)
          if L7_13 ~= 0 then
            A0_6:equipAction(A0_6.work.selectActionIndex, L7_13)
          end
        end
        L7_13 = A0_6.setEquipButtonEffect
        L7_13(A0_6, A0_6.work.selectActionIndex, false)
        L7_13 = A0_6.work
        L7_13.selectActionIndex = 0
      else
        L7_13 = A0_6.getEquippedCommandID
        L7_13 = L7_13(A0_6, L5_11)
        if L7_13 ~= 0 then
          A0_6.work.selectAction = L7_13
        else
          A0_6.work.selectAction = 0
        end
        A0_6:setEquipButtonEffect(L5_11, true)
        A0_6.work.selectActionIndex = L5_11
        do break end
        else
        end
        if L6_12 == 2 then
          L7_13 = A0_6.work
          L7_13 = L7_13.selectClassIndex
          if L7_13 ~= L5_11 then
            L7_13 = A0_6.setClassButtonEffect
            L7_13(A0_6, A0_6.work.selectClassIndex, false)
            L7_13 = A0_6.setClassButtonEffect
            L7_13(A0_6, L5_11, true)
            L7_13 = A0_6.work
            L7_13.selectClassIndex = L5_11
            L7_13 = A0_6.getControlUserWorkInt
            L7_13 = L7_13(A0_6, 4, A2_8)
            A0_6.work.selectClass = L7_13
            if A0_6.work.classType == 1 then
              A0_6:setClassAction(L7_13)
            else
              A0_6:setGodsend(L7_13)
              do break end
              else
              end
              if L6_12 == 3 then
                L7_13 = A0_6.getControlUserWorkInt
                L7_13 = L7_13(A0_6, 3, A2_8)
                A0_6:equipAction(0, L7_13)
                break
              else
              end
              if L6_12 == 4 then
                L7_13 = A0_6.getControlUserWorkInt
                L7_13 = L7_13(A0_6, 3, A2_8)
                A0_6:equipGodsend(0, L7_13)
                break
              else
              end
              if L6_12 == 5 then
                L7_13 = A0_6.getControlUserWorkInt
                L7_13 = L7_13(A0_6, 3, A2_8)
                A0_6:equipGodsend(L5_11, 0)
                break
              else
              end
            end
          else
          end
      end
    end
end
function ActionSettingWidget.processUICommandCancel(A0_14, A1_15, A2_16, A3_17, A4_18)
  if A0_14.work.selectActionIndex ~= 0 then
    A0_14:setEquipButtonEffect(A0_14.work.selectActionIndex, false)
    A0_14.work.selectActionIndex = 0
    return
  end
  desktopWidget:closeWidgetDirect(A0_14)
end
function ActionSettingWidget.processUICommandEnterFocus(A0_19, A1_20, A2_21)
  local L3_22, L4_23
  L4_23 = A0_19
  L3_22 = A0_19.getControlUserWorkInt
  L3_22 = L3_22(L4_23, 1, A2_21)
  L4_23 = A0_19.getControlUserWorkInt
  L4_23 = L4_23(A0_19, 3, A2_21)
  if L3_22 == 1 then
  elseif L3_22 == 2 then
  elseif L3_22 == 3 then
  elseif L3_22 == 3 then
  else
    if L3_22 == 4 then
      break
    else
    end
    return
  end
  A0_19:setHelp(L4_23)
  A0_19:setControlUserWorkString(1, "Grid_Detail", A2_21)
end
function ActionSettingWidget.processSpreadSheetDataAsync(A0_24, A1_25, A2_26, A3_27)
  if A0_24.work.helpCommandID ~= A2_26 then
    return
  end
  if A1_25:_getData(A2_26, 119) ~= 0 then
    A0_24:setCommandInfo(A2_26, 0, A1_25:_getData(A2_26, 39), 0, 0, 0, 0, 0)
  else
    A0_24:setCommandInfo(A2_26, A1_25:_getData(A2_26, 38), A1_25:_getData(A2_26, 39), A1_25:_getData(A2_26, 40), A1_25:_getData(A2_26, 76), A1_25:_getData(A2_26, 79), A1_25:_getData(A2_26, 115), A1_25:_getData(A2_26, 114))
  end
end
function ActionSettingWidget.setCommandInfo(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33, A6_34, A7_35, A8_36)
  local L9_37, L10_38, L11_39
  L9_37 = worldMaster
  L10_38 = L9_37
  L9_37 = L9_37._getMyPlayer
  L9_37 = L9_37(L10_38)
  L10_38 = nil
  L11_39 = A0_28.setText
  L11_39(A0_28, "TextBlock_CommandHelpIcon", 10214, A1_29, 36)
  L11_39 = A0_28.setText
  L11_39(A0_28, "TextBlock_CommandText", 1104, A1_29)
  if A2_30 > 0 then
    L11_39 = A0_28.setText
    L11_39(A0_28, "TextBlock_SkillName", 10212, A2_30)
    L10_38 = true
  else
    L10_38 = false
  end
  L11_39 = A0_28.setVisibility
  L11_39(A0_28, "TextBlock_SkillName", L10_38)
  if A3_31 > 0 then
    L11_39 = A0_28.setText
    L11_39(A0_28, "TextBlock_BestLevel", tostring(A3_31))
    L10_38 = true
  else
    L10_38 = false
  end
  L11_39 = A0_28.setVisibility
  L11_39(A0_28, "Grid_BestLevel", L10_38)
  if A4_32 > 0 then
    L11_39 = A0_28.setText
    L11_39(A0_28, "TextBlock_Compatibility", 10213, A4_32, A2_30, 0)
    L10_38 = true
  else
    L10_38 = false
  end
  L11_39 = A0_28.setVisibility
  L11_39(A0_28, "Grid_Compatibility", L10_38)
  if A5_33 > 0 then
    L11_39 = A0_28.setText
    L11_39(A0_28, "TextBlock_CastTime", 10211, tostring(A5_33))
    L10_38 = true
  else
    L10_38 = false
  end
  L11_39 = A0_28.setVisibility
  L11_39(A0_28, "Grid_CastTime", L10_38)
  if A6_34 > 0 then
    L11_39 = A0_28.setText
    L11_39(A0_28, "TextBlock_RecastTime", 10211, tostring(A6_34))
    L10_38 = true
  else
    L10_38 = false
  end
  L11_39 = A0_28.setVisibility
  L11_39(A0_28, "Grid_RecastTime", L10_38)
  if A7_35 > 0 then
    L11_39 = A0_28.setText
    L11_39(A0_28, "TextBlock_TpCost", tostring(A7_35))
    L10_38 = true
  else
    L10_38 = false
  end
  L11_39 = A0_28.setVisibility
  L11_39(A0_28, "Grid_TPCost", L10_38)
  L11_39 = L9_37.calculateCommandCost
  L11_39 = L11_39(L9_37, A8_36)
  if L11_39 > 0 then
    A0_28:setText("TextBlock_MpCost", tostring(L11_39))
    L10_38 = true
  else
    L10_38 = false
  end
  A0_28:setVisibility("Grid_MPCost", L10_38)
  A0_28:setText("TextBlock_AbilityHelp", 1105, A1_29)
  A0_28:setVisibility("Grid_Detail", true)
end
function ActionSettingWidget.update(A0_40)
  local L1_41, L2_42, L3_43, L4_44
  L2_42 = A0_40
  L1_41 = A0_40.getClassType
  L1_41 = L1_41(L2_42)
  L2_42 = A0_40.work
  L2_42 = L2_42.classType
  if L1_41 ~= L2_42 then
    L1_41 = desktopWidget
    L2_42 = L1_41
    L1_41 = L1_41.closeWidgetDirect
    L3_43 = A0_40
    L1_41(L2_42, L3_43)
    return
  end
  L1_41 = worldMaster
  L2_42 = L1_41
  L1_41 = L1_41._getMyPlayer
  L1_41 = L1_41(L2_42)
  L3_43 = L1_41
  L2_42 = L1_41.getMainClassOrJob
  L2_42 = L2_42(L3_43)
  L3_43 = A0_40.work
  L3_43 = L3_43.jobID
  if L2_42 ~= L3_43 then
    L3_43 = desktopWidget
    L4_44 = L3_43
    L3_43 = L3_43.isJob
    L3_43 = L3_43(L4_44, L2_42)
    if L3_43 then
      L3_43 = A0_40.work
      L3_43.selectClass = 0
    end
  end
  L3_43 = A0_40.work
  L3_43.jobID = L2_42
  L4_44 = A0_40
  L3_43 = A0_40.setSkillInfo
  L3_43(L4_44)
  L4_44 = A0_40
  L3_43 = A0_40.setAddAction
  L3_43(L4_44)
  L4_44 = A0_40
  L3_43 = A0_40.setJobAction
  L3_43(L4_44)
  L4_44 = A0_40
  L3_43 = A0_40.setEquipAction
  L3_43(L4_44)
  L4_44 = A0_40
  L3_43 = A0_40.setEquipGodsend
  L3_43(L4_44)
  L4_44 = A0_40
  L3_43 = A0_40.getControlUserWorkString
  L3_43 = L3_43(L4_44, 1, "Grid_Detail")
  if L3_43 ~= "" then
    L4_44 = A0_40.getControlUserWorkInt
    L4_44 = L4_44(A0_40, 3, L3_43)
    A0_40:setHelp(L4_44)
  end
end
function ActionSettingWidget.setAddActionGrid(A0_45)
  local L1_46, L2_47
  L1_46 = A0_45.work
  L1_46 = L1_46.classType
  if L1_46 == 1 then
    L2_47 = A0_45.setBattleGrid
    L2_47(A0_45)
    break
  else
  end
  if L1_46 == 2 then
    L2_47 = A0_45.setCraftGrid
    L2_47(A0_45)
    break
  else
  end
  if L1_46 == 3 then
    L2_47 = A0_45.setGatherGrid
    L2_47(A0_45)
    break
  else
  end
  do return end
  L1_46 = A0_45.work
  L1_46 = L1_46.classType
  if L1_46 == 1 then
    L2_47 = A0_45
    L1_46 = A0_45.setVisibility
    L1_46(L2_47, "Grid_FighterSorcerer", true)
    L2_47 = A0_45
    L1_46 = A0_45.setVisibility
    L1_46(L2_47, "Grid_GathererCrafter", false)
    L2_47 = A0_45
    L1_46 = A0_45.setVisibility
    L1_46(L2_47, "Grid_Godsend", false)
  else
    L2_47 = A0_45
    L1_46 = A0_45.setVisibility
    L1_46(L2_47, "Grid_FighterSorcerer", false)
    L2_47 = A0_45
    L1_46 = A0_45.setVisibility
    L1_46(L2_47, "Grid_GathererCrafter", true)
    L2_47 = A0_45
    L1_46 = A0_45.setVisibility
    L1_46(L2_47, "Grid_Godsend", true)
  end
  L1_46 = worldMaster
  L2_47 = L1_46
  L1_46 = L1_46._getMyPlayer
  L1_46 = L1_46(L2_47)
  L2_47 = L1_46.getMainClassOrJob
  L2_47 = L2_47(L1_46)
  if desktopWidget:isJob(L2_47) ~= true then
    A0_45:setVisibility("Grid_JobAction", false)
  end
end
function ActionSettingWidget.setBattleGrid(A0_48)
  local L1_49
  L1_49 = {
    3,
    2,
    4,
    8,
    7,
    23,
    22
  }
  A0_48:setClassButton("Button_FighterSorcerer_", 7, L1_49)
end
function ActionSettingWidget.setCraftGrid(A0_50)
  local L1_51
  L1_51 = {
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36
  }
  A0_50:setClassButton("Button_GathererCrafter_", 8, L1_51)
end
function ActionSettingWidget.setGatherGrid(A0_52)
  local L1_53, L2_54, L3_55, L4_56, L5_57
  L1_53 = {
    L2_54,
    L3_55,
    L4_56
  }
  L5_57 = 3
  L2_54(L3_55, L4_56, L5_57, L1_53)
  for L5_57 = 4, 8 do
    A0_52:setVisibility("Button_GathererCrafter_" .. L5_57, false)
  end
end
function ActionSettingWidget.setClassButton(A0_58, A1_59, A2_60, A3_61)
  local L4_62, L5_63, L6_64, L7_65, L8_66, L9_67
  for L7_65 = 1, A2_60 do
    L8_66 = A1_59
    L9_67 = L7_65
    L8_66 = L8_66 .. L9_67
    L9_67 = A3_61[L7_65]
    A0_58:setIcon(L8_66 .. ":IconControl_CommandIcon", desktopWidget:getSkillIcon(L9_67))
    A0_58:setConfirmCondition(L8_66)
    A0_58:setCommandParameter(L8_66, 2)
    A0_58:setControlUserWorkInt(2, L8_66, L7_65)
    A0_58:setControlUserWorkInt(4, L8_66, L9_67)
  end
end
function ActionSettingWidget.setAddAction(A0_68)
  if A0_68.work.classType == 1 then
    A0_68:setAddClassButtonVisible("Button_FighterSorcerer_", 7)
    A0_68:setClassAction(A0_68.work.selectClass)
    A0_68:setSpecialSkill()
    break
  else
  end
  if A0_68.work.classType == 2 then
    A0_68:setClassIndex("Button_GathererCrafter_", 8)
    A0_68:setGodsend(A0_68.work.selectClass)
    break
  else
  end
  if A0_68.work.classType == 3 then
    A0_68:setClassIndex("Button_GathererCrafter_", 3)
    A0_68:setGodsend(A0_68.work.selectClass)
    break
  else
  end
  do return end
  A0_68:setClassAction()
  A0_68:setAddActionCount()
  A0_68:setClassButtonEffect(A0_68.work.selectClassIndex, true)
end
function ActionSettingWidget.setAddClassButtonVisible(A0_69, A1_70, A2_71)
  local L3_72, L4_73, L5_74, L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81
  L3_72 = worldMaster
  L4_73 = L3_72
  L3_72 = L3_72._getMyPlayer
  L3_72 = L3_72(L4_73)
  L5_74 = L3_72
  L4_73 = L3_72.getStateMainSkill
  L4_73 = L4_73(L5_74)
  L5_74, L6_75 = nil, nil
  for L10_79 = 1, A2_71 do
    L11_80 = A1_70
    L12_81 = L10_79
    L11_80 = L11_80 .. L12_81
    L12_81 = A0_69.setVisibility
    L12_81(A0_69, L11_80 .. ":IconControl_CommandSelected", false)
    L12_81 = A0_69.getControlUserWorkInt
    L12_81 = L12_81(A0_69, 4, L11_80)
    if L4_73 ~= L12_81 and L3_72:checkClassCommandPermission(L12_81) == true then
      if L5_74 == nil then
        L5_74 = L12_81
        L6_75 = L10_79
      end
      A0_69:setVisibility(L11_80, true)
    else
      A0_69:setVisibility(L11_80, false)
    end
  end
  if L7_76 ~= 0 then
  elseif L7_76 == L4_73 then
    L7_76.selectClass = L5_74
    L7_76.selectClassIndex = L6_75
  end
end
function ActionSettingWidget.setClassIndex(A0_82, A1_83, A2_84)
  local L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92
  L3_85 = worldMaster
  L4_86 = L3_85
  L3_85 = L3_85._getMyPlayer
  L3_85 = L3_85(L4_86)
  L5_87 = L3_85
  L4_86 = L3_85.getStateMainSkill
  L4_86 = L4_86(L5_87)
  L5_87 = nil
  for L9_91 = 1, A2_84 do
    L10_92 = A1_83
    L10_92 = L10_92 .. L9_91
    A0_82:setVisibility(L10_92 .. ":IconControl_CommandSelected", false)
    if L4_86 == A0_82:getControlUserWorkInt(4, L10_92) and L5_87 == nil then
      L5_87 = L9_91
    end
  end
  if L6_88 == 0 then
    L6_88.selectClass = L4_86
    L6_88.selectClassIndex = L5_87
  end
end
function ActionSettingWidget.setAddActionCount(A0_93)
  local L1_94, L2_95, L3_96, L4_97
  L1_94 = worldMaster
  L2_95 = L1_94
  L1_94 = L1_94._getMyPlayer
  L1_94 = L1_94(L2_95)
  L2_95 = 0
  L3_96 = 0
  L4_97 = "TextBlock_EquipmentActions"
  if A0_93.work.classType == 1 then
    L2_95, L3_96 = L1_94:getOtherClassAbilityCountInformation()
  else
    L2_95, L3_96 = L1_94:getGiftCountInformation()
    L4_97 = "TextBlock_EquipmentGodsend"
  end
  A0_93:setText(L4_97, 10219, L2_95, L3_96)
end
function ActionSettingWidget.getClassType(A0_98)
  local L1_99
  L1_99 = 1
  if worldMaster:_getMyPlayer():getMainSkillCategory() == 29 then
    L1_99 = 2
    break
  else
  end
  if worldMaster:_getMyPlayer():getMainSkillCategory() == 39 then
    L1_99 = 3
    do break end
    break
  else
  end
  return L1_99
end
function ActionSettingWidget.setButtonEvent(A0_100, A1_101, A2_102, A3_103)
  local L4_104, L5_105, L6_106, L7_107, L8_108
  for L7_107 = 1, A2_102 do
    L8_108 = A1_101
    L8_108 = L8_108 .. tostring(L7_107)
    A0_100:setConfirmCondition(L8_108)
    A0_100:setCommandParameter(L8_108, A3_103)
  end
end
function ActionSettingWidget.setContorlWork(A0_109, A1_110, A2_111, A3_112)
  local L4_113, L5_114, L6_115, L7_116, L8_117
  for L7_116 = 1, A2_111 do
    L8_117 = A1_110
    L8_117 = L8_117 .. tostring(L7_116)
    A0_109:setControlUserWorkInt(1, L8_117, A3_112)
    A0_109:setControlUserWorkInt(2, L8_117, L7_116)
  end
end
function ActionSettingWidget.setSkillInfo(A0_118)
  local L1_119, L2_120, L3_121, L4_122, L5_123
  L1_119 = worldMaster
  L2_120 = L1_119
  L1_119 = L1_119._getMyPlayer
  L1_119 = L1_119(L2_120)
  L3_121 = L1_119
  L2_120 = L1_119.getStateMainSkill
  L2_120 = L2_120(L3_121)
  L4_122 = L1_119
  L3_121 = L1_119.getMainClassOrJob
  L3_121 = L3_121(L4_122)
  L5_123 = L1_119
  L4_122 = L1_119.getMainSkillLevel
  L4_122 = L4_122(L5_123)
  L5_123 = desktopWidget
  L5_123 = L5_123.getSkillIcon
  L5_123 = L5_123(L5_123, L3_121)
  if L3_121 == L2_120 then
    L3_121 = 0
  end
  A0_118:setIcon("IconControl_Class", L5_123)
  A0_118:setText("TextBlock_ClassName", 231, L2_120, L4_122, L3_121)
end
function ActionSettingWidget.getClassCommandTbl(A0_124, A1_125)
  local L2_126, L3_127, L4_128
  L2_126 = {}
  L3_127 = A1_125
  if L3_127 == 3 then
    L4_128 = {
      27150,
      27142,
      27158,
      27141,
      27152,
      27145,
      27156,
      27140,
      27151,
      27154,
      27144,
      27157,
      27143,
      27155,
      27153
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 2 then
    L4_128 = {
      27110,
      27103,
      27114,
      27100,
      27111,
      27101,
      27119,
      27105,
      27117,
      27115,
      27104,
      27113,
      27102,
      27116,
      27112
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 4 then
    L4_128 = {
      27190,
      27181,
      27193,
      27182,
      27191,
      27180,
      27198,
      27183,
      27194,
      27199,
      27184,
      27196,
      27185,
      27197,
      27195
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 8 then
    L4_128 = {
      27269,
      27274,
      27278,
      27264,
      27273,
      27260,
      27275,
      27262,
      27265,
      27270,
      27261,
      27279,
      27263,
      27271,
      27276
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 7 then
    L4_128 = {
      27259,
      27258,
      27228,
      27222,
      27233,
      27220,
      27229,
      27225,
      27236,
      27221,
      27226,
      27234,
      27224,
      27231,
      27223,
      27235,
      27230
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 23 then
    L4_128 = {
      27355,
      27346,
      27353,
      27351,
      27342,
      27343,
      27349,
      27356,
      27350,
      27347,
      27340,
      27341,
      27354,
      27348,
      27352
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 22 then
    L4_128 = {
      27313,
      27304,
      27308,
      27303,
      27310,
      27300,
      27314,
      27301,
      27309,
      27307,
      27311,
      27302,
      27306,
      27315,
      27312
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 29 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 30 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 31 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 32 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 33 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 34 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 35 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 36 then
    L4_128 = {29861}
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 39 then
    L4_128 = {
      29801,
      29831,
      29802,
      29873,
      29861,
      29832,
      29803,
      29874,
      29833,
      29834,
      29804,
      29875,
      29835,
      29805,
      29876
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 40 then
    L4_128 = {
      29811,
      29841,
      29812,
      29873,
      29861,
      29842,
      29813,
      29874,
      29843,
      29844,
      29814,
      29875,
      29845,
      29815,
      29876
    }
    L2_126 = L4_128
    break
  else
  end
  if L3_127 == 41 then
    L4_128 = {
      29821,
      29851,
      29822,
      29873,
      29861,
      29852,
      29823,
      29874,
      29853,
      29854,
      29824,
      29875,
      29855,
      29825,
      29876
    }
    L2_126 = L4_128
    break
  else
  end
  do return end
  return L2_126
end
function ActionSettingWidget.checkSameClassCommandExist(A0_129, A1_130, A2_131)
  local L3_132, L4_133, L5_134
  L3_132 = {}
  L4_133 = 0
  L5_134 = false
  if A1_130 > 0 and A2_131 ~= 0 then
    L3_132 = A0_129:getClassCommandTbl(A1_130)
    L4_133 = #L3_132
    for _FORV_9_ = 1, L4_133 do
      if A2_131 == L3_132[_FORV_9_] then
        L5_134 = true
        break
      end
    end
  end
  return L5_134
end
function ActionSettingWidget.setEquipAction(A0_135)
  local L1_136, L2_137, L3_138, L4_139, L5_140, L6_141, L7_142, L8_143, L9_144
  for L4_139 = 1, 30 do
    L5_140 = 0
    L6_141 = desktopWidget
    L7_142 = L6_141
    L6_141 = L6_141.getPlayerEquippedCustomCommand
    L8_143 = L4_139
    L8_143 = L6_141(L7_142, L8_143)
    if L6_141 ~= nil and L8_143 == true then
      L9_144 = desktopWidget
      L9_144 = L9_144.getCommandID
      L9_144 = L9_144(L9_144, L6_141)
      L5_140 = L9_144
    end
    L9_144 = "Button_BattleCommand_"
    L9_144 = L9_144 .. tostring(L4_139)
    A0_135:setCommandIcon(L9_144, L5_140)
    A0_135:setCommandIconEquipBar(L9_144, L5_140)
  end
end
function ActionSettingWidget.initEquipGodSend(A0_145)
  local L1_146, L2_147, L3_148, L4_149, L5_150
  for L4_149 = 1, 10 do
    L5_150 = "Button_Godsend_"
    L5_150 = L5_150 .. tostring(L4_149)
    A0_145:setVisibility(L5_150 .. ":IconControl_NotEquiped", false)
    A0_145:setVisibility(L5_150 .. ":IconControl_CommandSelected", false)
    A0_145:setIcon(L5_150 .. ":IconControl_CommandSelected", 984)
  end
end
function ActionSettingWidget.setEquipGodsend(A0_151)
  local L1_152, L2_153, L3_154, L4_155, L5_156, L6_157, L7_158
  L1_152 = A0_151.work
  L1_152 = L1_152.classType
  if L1_152 == 1 then
    return
  end
  L1_152 = worldMaster
  L1_152 = L1_152._getMyPlayer
  L1_152 = L1_152(L2_153)
  for L5_156 = 1, 10 do
    L6_157 = "Button_Godsend_"
    L7_158 = tostring
    L7_158 = L7_158(L5_156)
    L6_157 = L6_157 .. L7_158
    L7_158 = L1_152.getGiftCommand
    L7_158 = L7_158(L1_152, L5_156)
    A0_151:setCommandIcon(L6_157, L7_158)
    A0_151:setEquipGodSendEquipBar(L6_157, L7_158)
  end
end
function ActionSettingWidget.setCommandIcon(A0_159, A1_160, A2_161)
  local L3_162
  L3_162 = false
  if A2_161 ~= 0 then
    A0_159:setText(A1_160 .. ":TextBlock_CommandData", 10214, A2_161, 36)
    L3_162 = true
  end
  A0_159:setVisibility(A1_160 .. ":IconControl_CommandIcon", L3_162)
  A0_159:setControlUserWorkInt(3, A1_160, A2_161)
end
function ActionSettingWidget.setCommandIconEquipBar(A0_163, A1_164, A2_165)
  local L3_166, L4_167, L5_168, L6_169, L7_170, L8_171, L9_172, L10_173
  L3_166 = worldMaster
  L4_167 = L3_166
  L3_166 = L3_166._getMyPlayer
  L3_166 = L3_166(L4_167)
  L4_167 = L3_166.getStateMainSkill
  L4_167 = L4_167(L5_168)
  L8_171 = ":IconControl_NotEquiped"
  L8_171 = false
  L5_168(L6_169, L7_170, L8_171)
  L8_171 = ":IconControl_CommandSelected"
  L8_171 = false
  L5_168(L6_169, L7_170, L8_171)
  if A2_165 ~= 0 then
    L8_171 = ":IconControl_CommandSelected"
    L8_171 = true
    L5_168(L6_169, L7_170, L8_171)
    L8_171 = ":IconControl_CommandSelected"
    L8_171 = 838
    L5_168(L6_169, L7_170, L8_171)
    if L5_168 == 1 then
      for L8_171 = 1, 7 do
        L9_172 = "Button_FighterSorcerer_"
        L10_173 = L8_171
        L9_172 = L9_172 .. L10_173
        L10_173 = A0_163.getControlUserWorkInt
        L10_173 = L10_173(A0_163, 4, L9_172)
        if L4_167 ~= L10_173 and L3_166:checkClassCommandPermission(L10_173) == true and A0_163:checkSameClassCommandExist(L10_173, A2_165) == true then
          A0_163:setIcon(A1_164 .. ":IconControl_CommandSelected", 984)
        end
      end
    end
  end
end
function ActionSettingWidget.setEquipGodSendEquipBar(A0_174, A1_175, A2_176)
  local L3_177
  L3_177 = false
  if A2_176 ~= 0 then
    L3_177 = true
  end
  A0_174:setVisibility(A1_175 .. ":IconControl_CommandSelected", L3_177)
end
function ActionSettingWidget.setClassAction(A0_178, A1_179)
  local L2_180, L3_181, L4_182, L5_183, L6_184
  L2_180 = {}
  L3_181 = worldMaster
  L4_182 = L3_181
  L3_181 = L3_181._getMyPlayer
  L3_181 = L3_181(L4_182)
  L4_182 = "Button_ClassAction_"
  L5_183 = "Border_ClassActionSlot_"
  L6_184 = L3_181.getMainSkillLevel
  L6_184 = L6_184(L3_181)
  if A1_179 ~= nil then
    L4_182 = "Button_AddAction_"
    L5_183 = "Border_AddActionSlot_"
    L6_184 = L3_181:getSkillLevel(A1_179)
  else
    A1_179 = L3_181:getStateMainSkill()
  end
  if A1_179 == 3 then
    L2_180 = {
      27150,
      1,
      27142,
      2,
      27158,
      4,
      27141,
      6,
      27152,
      10,
      27145,
      14,
      27156,
      18,
      27140,
      22,
      27151,
      26,
      27154,
      30,
      27144,
      34,
      27157,
      38,
      27143,
      42,
      27155,
      46,
      27153,
      50
    }
    break
  else
  end
  if A1_179 == 2 then
    L2_180 = {
      27110,
      1,
      27103,
      2,
      27114,
      4,
      27100,
      6,
      27111,
      10,
      27101,
      14,
      27119,
      18,
      27105,
      22,
      27117,
      26,
      27115,
      30,
      27104,
      34,
      27113,
      38,
      27102,
      42,
      27116,
      46,
      27112,
      50
    }
    break
  else
  end
  if A1_179 == 4 then
    L2_180 = {
      27190,
      1,
      27181,
      2,
      27193,
      4,
      27182,
      6,
      27191,
      10,
      27180,
      14,
      27198,
      18,
      27183,
      22,
      27194,
      26,
      27199,
      30,
      27184,
      34,
      27196,
      38,
      27185,
      42,
      27197,
      46,
      27195,
      50
    }
    break
  else
  end
  if A1_179 == 8 then
    L2_180 = {
      27269,
      1,
      27274,
      2,
      27278,
      4,
      27264,
      6,
      27273,
      10,
      27260,
      14,
      27275,
      18,
      27262,
      22,
      27265,
      26,
      27270,
      30,
      27261,
      34,
      27279,
      38,
      27263,
      42,
      27271,
      46,
      27276,
      50
    }
    break
  else
  end
  if A1_179 == 7 then
    L2_180 = {
      27259,
      1,
      27258,
      1,
      27228,
      1,
      27222,
      2,
      27233,
      4,
      27220,
      6,
      27229,
      10,
      27225,
      14,
      27236,
      18,
      27221,
      22,
      27226,
      26,
      27234,
      30,
      27224,
      34,
      27231,
      38,
      27223,
      42,
      27235,
      46,
      27230,
      50
    }
    break
  else
  end
  if A1_179 == 23 then
    L2_180 = {
      27355,
      1,
      27346,
      2,
      27353,
      4,
      27351,
      6,
      27342,
      10,
      27343,
      14,
      27349,
      18,
      27356,
      22,
      27350,
      26,
      27347,
      30,
      27340,
      34,
      27341,
      38,
      27354,
      42,
      27348,
      46,
      27352,
      50
    }
    break
  else
  end
  if A1_179 == 22 then
    L2_180 = {
      27313,
      1,
      27304,
      2,
      27308,
      4,
      27303,
      6,
      27310,
      10,
      27300,
      14,
      27314,
      18,
      27301,
      22,
      27309,
      26,
      27307,
      30,
      27311,
      34,
      27302,
      38,
      27306,
      42,
      27315,
      46,
      27312,
      50
    }
    break
  else
  end
  if A1_179 == 29 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 30 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 31 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 32 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 33 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 34 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 35 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 36 then
    L2_180 = {29861, 10}
    break
  else
  end
  if A1_179 == 39 then
    L2_180 = {
      29801,
      1,
      29831,
      3,
      29802,
      8,
      29873,
      8,
      29861,
      10,
      29832,
      10,
      29803,
      18,
      29874,
      18,
      29833,
      20,
      29834,
      20,
      29804,
      28,
      29875,
      28,
      29835,
      30,
      29805,
      38,
      29876,
      38
    }
    break
  else
  end
  if A1_179 == 40 then
    L2_180 = {
      29811,
      1,
      29841,
      3,
      29812,
      8,
      29873,
      8,
      29861,
      10,
      29842,
      10,
      29813,
      18,
      29874,
      18,
      29843,
      20,
      29844,
      20,
      29814,
      28,
      29875,
      28,
      29845,
      30,
      29815,
      38,
      29876,
      38
    }
    break
  else
  end
  if A1_179 == 41 then
    L2_180 = {
      29821,
      1,
      29851,
      3,
      29822,
      8,
      29873,
      8,
      29861,
      10,
      29852,
      10,
      29823,
      18,
      29874,
      18,
      29853,
      20,
      29854,
      20,
      29824,
      28,
      29875,
      28,
      29855,
      30,
      29825,
      38,
      29876,
      38
    }
    break
  else
  end
  do return end
  A0_178:setIconList(L4_182, L5_183, L2_180, L6_184, 20)
end
function ActionSettingWidget.setJobAction(A0_185)
  local L1_186, L2_187, L3_188, L4_189, L5_190
  L1_186 = worldMaster
  L2_187 = L1_186
  L1_186 = L1_186._getMyPlayer
  L1_186 = L1_186(L2_187)
  L3_188 = L1_186
  L2_187 = L1_186.getMainClassOrJob
  L2_187 = L2_187(L3_188)
  L3_188 = desktopWidget
  L4_189 = L3_188
  L3_188 = L3_188.isJob
  L5_190 = L2_187
  L3_188 = L3_188(L4_189, L5_190)
  if L3_188 == false then
    L4_189 = A0_185
    L3_188 = A0_185.setVisibility
    L5_190 = "Grid_JobAction"
    L3_188(L4_189, L5_190, false)
    return
  end
  L3_188 = nil
  L4_189 = L2_187
  if L4_189 == 15 then
    L3_188 = 11
    break
  else
  end
  if L4_189 == 16 then
    L3_188 = 1
    break
  else
  end
  if L4_189 == 17 then
    L3_188 = 6
    break
  else
  end
  if L4_189 == 18 then
    L3_188 = 21
    break
  else
  end
  if L4_189 == 19 then
    L3_188 = 16
    break
  else
  end
  if L4_189 == 26 then
    L3_188 = 31
    break
  else
  end
  if L4_189 == 27 then
    L3_188 = 26
    do break end
    break
  else
  end
  L5_190 = L1_186
  L4_189 = L1_186.getAdditionalCommandList
  L4_189 = L4_189(L5_190)
  L5_190 = {}
  for _FORV_10_ = 0, 4 do
    if L1_186:isAcquiredAdditionalCommand(L3_188 + _FORV_10_) then
      L5_190[1 + 0 * 2] = L4_189[L3_188 + _FORV_10_]
      L5_190[1 + 0 * 2 + 1] = 1
    end
  end
  if _FOR_ == 0 then
    A0_185:setVisibility("Grid_JobAction", false)
    return
  else
    A0_185:setVisibility("Grid_JobAction", true)
  end
  A0_185:setIconList("Button_JobAction_", "Border_JobActionSlot_", L5_190, 1, 5)
end
function ActionSettingWidget.setSpecialSkill(A0_191)
  local L1_192
  L1_192 = {}
  if worldMaster:_getMyPlayer():getStateMainSkill() == 3 then
    L1_192 = {
      27168,
      8,
      27163,
      12,
      27167,
      16,
      27164,
      20,
      27169,
      24,
      27161,
      28,
      27166,
      32,
      27160,
      36,
      27170,
      40,
      27165,
      44,
      27162,
      48
    }
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 2 then
    L1_192 = {
      27127,
      8,
      27129,
      12,
      27126,
      16,
      27120,
      20,
      27121,
      24,
      27123,
      28,
      27130,
      32,
      27125,
      36,
      27128,
      40,
      27124,
      44,
      27122,
      48
    }
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 4 then
    L1_192 = {
      27210,
      8,
      27208,
      12,
      27202,
      16,
      27201,
      20,
      27207,
      24,
      27200,
      28,
      27206,
      32,
      27205,
      36,
      27209,
      40,
      27204,
      44,
      27203,
      48
    }
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 8 then
    L1_192 = {
      27288,
      8,
      27286,
      12,
      27284,
      16,
      27289,
      20,
      27287,
      24,
      27280,
      28,
      27282,
      32,
      27285,
      36,
      27290,
      40,
      27281,
      44,
      27283,
      48
    }
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 7 then
    L1_192 = {
      27249,
      8,
      27248,
      12,
      27244,
      16,
      27247,
      20,
      27250,
      24,
      27240,
      28,
      27241,
      32,
      27243,
      36,
      27246,
      40,
      27242,
      44,
      27245,
      48
    }
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 23 then
    L1_192 = {
      27367,
      8,
      27366,
      12,
      27369,
      16,
      27370,
      20,
      27365,
      24,
      27368,
      28,
      27362,
      32,
      27364,
      36,
      27360,
      40,
      27361,
      44,
      27363,
      48
    }
    break
  else
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() == 22 then
    L1_192 = {
      27327,
      8,
      27325,
      12,
      27323,
      16,
      27330,
      20,
      27322,
      24,
      27328,
      28,
      27326,
      32,
      27320,
      36,
      27329,
      40,
      27324,
      44,
      27321,
      48
    }
    break
  else
  end
  do return end
  A0_191:setIconList("Button_PropertyCommand_", "Border_Property_", L1_192, worldMaster:_getMyPlayer():getMainSkillLevel(), 20)
end
function ActionSettingWidget.setGodsend(A0_193, A1_194)
  local L2_195
  L2_195 = {}
  if A1_194 == 29 then
    L2_195 = {
      29531,
      10,
      29502,
      15,
      29528,
      20,
      29507,
      30,
      29518,
      30,
      29519,
      36,
      29541,
      45
    }
    break
  else
  end
  if A1_194 == 30 then
    L2_195 = {
      29509,
      10,
      29502,
      15,
      29521,
      20,
      29533,
      30,
      29547,
      30,
      29511,
      36,
      29510,
      45
    }
    break
  else
  end
  if A1_194 == 31 then
    L2_195 = {
      29512,
      10,
      29502,
      15,
      29522,
      20,
      29536,
      30,
      29548,
      30,
      29537,
      36,
      29503,
      45
    }
    break
  else
  end
  if A1_194 == 32 then
    L2_195 = {
      29545,
      10,
      29502,
      15,
      29523,
      20,
      29539,
      30,
      29550,
      30,
      29544,
      36,
      29506,
      45
    }
    break
  else
  end
  if A1_194 == 33 then
    L2_195 = {
      29514,
      10,
      29502,
      15,
      29524,
      20,
      29513,
      30,
      29542,
      30,
      29504,
      36,
      29534,
      45
    }
    break
  else
  end
  if A1_194 == 34 then
    L2_195 = {
      29515,
      10,
      29502,
      15,
      29525,
      20,
      29505,
      30,
      29543,
      30,
      29538,
      36,
      29549,
      36,
      29516,
      45
    }
    break
  else
  end
  if A1_194 == 35 then
    L2_195 = {
      29553,
      10,
      29502,
      15,
      29520,
      20,
      29508,
      30,
      29546,
      30,
      29532,
      36,
      29552,
      36,
      29529,
      45
    }
    break
  else
  end
  if A1_194 == 36 then
    L2_195 = {
      29540,
      10,
      29502,
      15,
      29526,
      20,
      29517,
      30,
      29530,
      30,
      29527,
      36,
      29551,
      36,
      29535,
      45
    }
    break
  else
  end
  if A1_194 == 39 then
    L2_195 = {
      29705,
      10,
      29702,
      15,
      29730,
      20,
      29731,
      20,
      29736,
      20,
      29739,
      20,
      29718,
      25,
      29721,
      30,
      29727,
      30,
      29724,
      36,
      29742,
      -36
    }
    break
  else
  end
  if A1_194 == 40 then
    L2_195 = {
      29706,
      10,
      29703,
      15,
      29732,
      20,
      29735,
      20,
      29737,
      20,
      29740,
      20,
      29719,
      25,
      29722,
      30,
      29728,
      30,
      29725,
      36,
      29742,
      -36
    }
    break
  else
  end
  if A1_194 == 41 then
    L2_195 = {
      29707,
      10,
      29704,
      15,
      29733,
      20,
      29734,
      20,
      29738,
      20,
      29741,
      20,
      29717,
      25,
      29723,
      30,
      29729,
      30,
      29726,
      36,
      29742,
      -36
    }
    break
  else
  end
  do return end
  A0_193:setIconList("Button_ProductionCommand_", "Border_Production_", L2_195, worldMaster:_getMyPlayer():getSkillLevel(A1_194), 20)
end
function ActionSettingWidget.setIconList(A0_196, A1_197, A2_198, A3_199, A4_200, A5_201)
  local L6_202, L7_203, L8_204, L9_205, L10_206, L11_207, L12_208, L13_209, L14_210, L15_211, L16_212, L17_213, L18_214
  L6_202 = worldMaster
  L7_203 = L6_202
  L6_202 = L6_202._getMyPlayer
  L6_202 = L6_202(L7_203)
  L7_203 = #A3_199
  L7_203 = L7_203 / 2
  L8_204 = 1
  for L12_208 = 1, L7_203 do
    L13_209 = A3_199[L8_204]
    L14_210 = L8_204 + 1
    L14_210 = A3_199[L14_210]
    if L14_210 < 0 then
      L16_212 = L6_202
      L15_211 = L6_202.isAcquiredAdditionalCommand
      L17_213 = L14_210 * -1
      L15_211 = L15_211(L16_212, L17_213)
      if L15_211 == true then
        L14_210 = 1
      end
    end
    L15_211 = A1_197
    L16_212 = tostring
    L17_213 = L12_208
    L16_212 = L16_212(L17_213)
    L15_211 = L15_211 .. L16_212
    L16_212 = true
    if L14_210 > 0 then
      L18_214 = A0_196
      L17_213 = A0_196.setText
      L17_213(L18_214, L15_211 .. ":TextBlock_CommandData", 10214, L13_209, 36)
      L17_213 = 1
      if A4_200 < L14_210 then
        L17_213 = 0.5
      end
      L18_214 = A0_196.setColor
      L18_214(A0_196, L15_211 .. ":IconControl_CommandIcon", L17_213, L17_213, L17_213)
      L18_214 = A0_196.setControlUserWorkInt
      L18_214(A0_196, 3, L15_211, L13_209)
      L18_214 = false
      if A1_197 ~= "Button_PropertyCommand_" then
        if A1_197 ~= "Button_ProductionCommand_" then
          L18_214 = A0_196:isEquipCommand(L13_209)
        else
          L18_214 = A0_196:isEquipGodsend(L13_209)
        end
      end
      A0_196:setVisibility(L15_211 .. ":IconControl_CommandSelected", L18_214)
    else
      L16_212 = false
    end
    L18_214 = A0_196
    L17_213 = A0_196.setVisibility
    L17_213(L18_214, L15_211 .. ":IconControl_NotEquiped", false)
    L18_214 = A0_196
    L17_213 = A0_196.setVisibility
    L17_213(L18_214, A2_198 .. tostring(L12_208), L16_212)
    L18_214 = A0_196
    L17_213 = A0_196.setVisibility
    L17_213(L18_214, L15_211, L16_212)
    L8_204 = L8_204 + 2
  end
  for L12_208 = L7_203 + 1, A5_201 do
    L14_210 = A0_196
    L13_209 = A0_196.setVisibility
    L15_211 = A2_198
    L16_212 = L12_208
    L15_211 = L15_211 .. L16_212
    L16_212 = false
    L13_209(L14_210, L15_211, L16_212)
    L14_210 = A0_196
    L13_209 = A0_196.setVisibility
    L15_211 = A1_197
    L16_212 = L12_208
    L15_211 = L15_211 .. L16_212
    L16_212 = false
    L13_209(L14_210, L15_211, L16_212)
  end
end
function ActionSettingWidget.setEquipButtonEffect(A0_215, A1_216, A2_217)
  A0_215:setVisibility("Button_BattleCommand_" .. A1_216 .. ":Border_IconSelectedEffect", A2_217)
end
function ActionSettingWidget.setClassButtonEffect(A0_218, A1_219, A2_220)
  local L3_221
  L3_221 = "Button_FighterSorcerer_"
  if A0_218.work.classType ~= 1 then
    L3_221 = "Button_GathererCrafter_"
  end
  A0_218:setVisibility(L3_221 .. A1_219 .. ":IconControl_CommandSelected", A2_220)
end
function ActionSettingWidget.getEquippedCommandID(A0_222, A1_223)
  local L2_224, L3_225
  L2_224 = 0
  L3_225 = desktopWidget
  L3_225 = L3_225.getPlayerEquippedCustomCommand
  L3_225 = L3_225(L3_225, A1_223)
  if L3_225 ~= nil and L3_225(L3_225, A1_223) == true then
    L2_224 = desktopWidget:getCommandID(L3_225)
  end
  return L2_224
end
function ActionSettingWidget.setHelp(A0_226, A1_227)
  if A0_226.work.helpCommandID == A1_227 then
    return
  end
  if A1_227 ~= 0 then
    A0_226:loadSpreadSheetDataAsync(gameCommandBasicSheet, A1_227, A1_227)
  else
    A0_226:setVisibility("Grid_Detail", false)
  end
  A0_226.work.helpCommandID = A1_227
end
function ActionSettingWidget.equipAction(A0_228, A1_229, A2_230)
  desktopWidget:executePlayerEquipAction(0, A1_229, A2_230, 0)
end
function ActionSettingWidget.equipGodsend(A0_231, A1_232, A2_233)
  desktopWidget:executePlayerEquipAction(1, A1_232, A2_233, 0)
end
function ActionSettingWidget.isEquipCommand(A0_234, A1_235)
  local L2_236, L3_237, L4_238, L5_239
  for L5_239 = 1, 30 do
    if A0_234:getEquippedCommandID(L5_239) == A1_235 then
      return true
    end
  end
  return L2_236
end
function ActionSettingWidget.isEquipGodsend(A0_240, A1_241)
  local L2_242, L3_243, L4_244, L5_245, L6_246
  L2_242 = worldMaster
  L2_242 = L2_242._getMyPlayer
  L2_242 = L2_242(L3_243)
  for L6_246 = 1, 10 do
    if L2_242:getGiftCommand(L6_246) == A1_241 then
      return true
    end
  end
  return L3_243
end
