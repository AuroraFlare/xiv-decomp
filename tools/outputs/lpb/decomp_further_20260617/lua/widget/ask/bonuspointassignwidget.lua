require("/Widget/Ask/AskBaseClass")
_defineClass("BonusPointAssignWidget", "AskBaseClass")
function BonusPointAssignWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8)
  A0_0.work._temp = {
    {
      "totalRemainingBonusDefault",
      "integer16"
    },
    {
      "totalRemainingBonus",
      "integer16"
    },
    {"strCurrent", "integer16"},
    {"vitCurrent", "integer16"},
    {"dexCurrent", "integer16"},
    {"intCurrent", "integer16"},
    {"mndCurrent", "integer16"},
    {"pieCurrent", "integer16"},
    {
      "strCumulateAddBonus",
      "integer16"
    },
    {
      "vitCumulateAddBonus",
      "integer16"
    },
    {
      "dexCumulateAddBonus",
      "integer16"
    },
    {
      "intCumulateAddBonus",
      "integer16"
    },
    {
      "mndCumulateAddBonus",
      "integer16"
    },
    {
      "pieCumulateAddBonus",
      "integer16"
    },
    {
      "strAddBonusLimit",
      "integer16"
    },
    {
      "vitAddBonusLimit",
      "integer16"
    },
    {
      "dexAddBonusLimit",
      "integer16"
    },
    {
      "intAddBonusLimit",
      "integer16"
    },
    {
      "mndAddBonusLimit",
      "integer16"
    },
    {
      "pieAddBonusLimit",
      "integer16"
    },
    {
      "strAddBonus",
      "integer16"
    },
    {
      "vitAddBonus",
      "integer16"
    },
    {
      "dexAddBonus",
      "integer16"
    },
    {
      "intAddBonus",
      "integer16"
    },
    {
      "mndAddBonus",
      "integer16"
    },
    {
      "pieAddBonus",
      "integer16"
    }
  }
  A0_0.work.totalRemainingBonusDefault = A1_1
  A0_0.work.totalRemainingBonus = A1_1
  A0_0.work.strCurrent = 0
  A0_0.work.vitCurrent = 0
  A0_0.work.dexCurrent = 0
  A0_0.work.intCurrent = 0
  A0_0.work.mndCurrent = 0
  A0_0.work.pieCurrent = 0
  A0_0.work.strCumulateAddBonus = A3_3
  A0_0.work.vitCumulateAddBonus = A4_4
  A0_0.work.dexCumulateAddBonus = A5_5
  A0_0.work.intCumulateAddBonus = A6_6
  A0_0.work.mndCumulateAddBonus = A7_7
  A0_0.work.pieCumulateAddBonus = A8_8
  A0_0.work.strAddBonusLimit = A2_2 - A3_3
  A0_0.work.vitAddBonusLimit = A2_2 - A4_4
  A0_0.work.dexAddBonusLimit = A2_2 - A5_5
  A0_0.work.intAddBonusLimit = A2_2 - A6_6
  A0_0.work.mndAddBonusLimit = A2_2 - A7_7
  A0_0.work.pieAddBonusLimit = A2_2 - A8_8
  A0_0.work.strAddBonus = 0
  A0_0.work.vitAddBonus = 0
  A0_0.work.dexAddBonus = 0
  A0_0.work.intAddBonus = 0
  A0_0.work.mndAddBonus = 0
  A0_0.work.pieAddBonus = 0
  A0_0:setConfirmCondition("Button_PointMinus_STR")
  A0_0:setConfirmCondition("Button_PointMinus_VIT")
  A0_0:setConfirmCondition("Button_PointMinus_DEX")
  A0_0:setConfirmCondition("Button_PointMinus_INT")
  A0_0:setConfirmCondition("Button_PointMinus_MND")
  A0_0:setConfirmCondition("Button_PointMinus_PIE")
  A0_0:setConfirmCondition("Button_PointPlus_STR")
  A0_0:setConfirmCondition("Button_PointPlus_VIT")
  A0_0:setConfirmCondition("Button_PointPlus_DEX")
  A0_0:setConfirmCondition("Button_PointPlus_INT")
  A0_0:setConfirmCondition("Button_PointPlus_MND")
  A0_0:setConfirmCondition("Button_PointPlus_PIE")
  A0_0:setConfirmCondition("Button_Redo")
  A0_0:setConfirmCondition("Button_Complete")
  A0_0:setConfirmCondition("Button_Cancel")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:setText("TextBlock_ParameterTitle_STR", 6911, 1)
  A0_0:setText("TextBlock_ParameterTitle_VIT", 6911, 2)
  A0_0:setText("TextBlock_ParameterTitle_DEX", 6911, 3)
  A0_0:setText("TextBlock_ParameterTitle_INT", 6911, 4)
  A0_0:setText("TextBlock_ParameterTitle_MND", 6911, 5)
  A0_0:setText("TextBlock_ParameterTitle_PIE", 6911, 6)
  A0_0:setHelpParameter("TextBlock_ParameterTitle_STR", 1, 70001)
  A0_0:setHelpParameter("TextBlock_ParameterTitle_VIT", 1, 70002)
  A0_0:setHelpParameter("TextBlock_ParameterTitle_DEX", 1, 70003)
  A0_0:setHelpParameter("TextBlock_ParameterTitle_INT", 1, 70004)
  A0_0:setHelpParameter("TextBlock_ParameterTitle_MND", 1, 70005)
  A0_0:setHelpParameter("TextBlock_ParameterTitle_PIE", 1, 70006)
  A0_0:setHelpParameter("TextBlock_CurrentValue_STR", 1, 76806)
  A0_0:setHelpParameter("TextBlock_CurrentValue_VIT", 1, 76806)
  A0_0:setHelpParameter("TextBlock_CurrentValue_DEX", 1, 76806)
  A0_0:setHelpParameter("TextBlock_CurrentValue_INT", 1, 76806)
  A0_0:setHelpParameter("TextBlock_CurrentValue_MND", 1, 76806)
  A0_0:setHelpParameter("TextBlock_CurrentValue_PIE", 1, 76806)
  A0_0:setHelpParameter("TextBlock_BonusValue_STR", 1, 76806)
  A0_0:setHelpParameter("TextBlock_BonusValue_VIT", 1, 76807)
  A0_0:setHelpParameter("TextBlock_BonusValue_DEX", 1, 76807)
  A0_0:setHelpParameter("TextBlock_BonusValue_INT", 1, 76807)
  A0_0:setHelpParameter("TextBlock_BonusValue_MND", 1, 76807)
  A0_0:setHelpParameter("TextBlock_BonusValue_PIE", 1, 76807)
  A0_0:setHelpParameter("TextBlock_AddPoint_STR", 1, 76808)
  A0_0:setHelpParameter("TextBlock_AddPoint_VIT", 1, 76808)
  A0_0:setHelpParameter("TextBlock_AddPoint_DEX", 1, 76808)
  A0_0:setHelpParameter("TextBlock_AddPoint_INT", 1, 76808)
  A0_0:setHelpParameter("TextBlock_AddPoint_MND", 1, 76808)
  A0_0:setHelpParameter("TextBlock_AddPoint_PIE", 1, 76808)
  A0_0:initWindowDisplay()
  A0_0:updateWindowDisplay()
end
function BonusPointAssignWidget.initWindowDisplay(A0_9)
  A0_9.work.totalRemainingBonus = A0_9.work.totalRemainingBonusDefault
  A0_9.work.strCurrent = worldMaster:_getMyPlayer():getPhysicalParameter(1)
  A0_9.work.vitCurrent = worldMaster:_getMyPlayer():getPhysicalParameter(2)
  A0_9.work.dexCurrent = worldMaster:_getMyPlayer():getPhysicalParameter(3)
  A0_9.work.intCurrent = worldMaster:_getMyPlayer():getPhysicalParameter(4)
  A0_9.work.mndCurrent = worldMaster:_getMyPlayer():getPhysicalParameter(5)
  A0_9.work.pieCurrent = worldMaster:_getMyPlayer():getPhysicalParameter(6)
  A0_9.work.strAddBonus = 0
  A0_9.work.vitAddBonus = 0
  A0_9.work.dexAddBonus = 0
  A0_9.work.intAddBonus = 0
  A0_9.work.mndAddBonus = 0
  A0_9.work.pieAddBonus = 0
  A0_9:setRedoAndCompleteButtonEnable(false)
  A0_9:setWindowFocus("Button_PointPlus_STR")
end
function BonusPointAssignWidget.updateWindowDisplay(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15
  L1_11 = worldMaster
  L2_12 = L1_11
  L1_11 = L1_11._getMyPlayer
  L1_11 = L1_11(L2_12)
  L3_13 = L1_11
  L2_12 = L1_11.getStateMainSkill
  L2_12 = L2_12(L3_13)
  L4_14 = L1_11
  L3_13 = L1_11.getMainClassOrJob
  L3_13 = L3_13(L4_14)
  L5_15 = L1_11
  L4_14 = L1_11.getMainSkillLevel
  L4_14 = L4_14(L5_15)
  L5_15 = desktopWidget
  L5_15 = L5_15.getSkillIcon
  L5_15 = L5_15(L5_15, L3_13)
  if L1_11:isJob(L3_13) == false then
    L3_13 = 0
  end
  A0_10:setText("TextBlock_ClassName", 231, L2_12, L4_14, L3_13)
  A0_10:setVisibility("TextBlock_ClassLevel", false)
  A0_10:setIcon("IconControl_Class", L5_15)
  A0_10:setText("TextBlock_RemainingTitle_Status", 6902, A0_10.work.totalRemainingBonus)
  A0_10.work.strCurrent = L1_11:getPhysicalParameter(1)
  A0_10.work.vitCurrent = L1_11:getPhysicalParameter(2)
  A0_10.work.dexCurrent = L1_11:getPhysicalParameter(3)
  A0_10.work.intCurrent = L1_11:getPhysicalParameter(4)
  A0_10.work.mndCurrent = L1_11:getPhysicalParameter(5)
  A0_10.work.pieCurrent = L1_11:getPhysicalParameter(6)
  A0_10:setPhysicalParameterDisplay(1, A0_10.work.strCurrent, A0_10.work.strAddBonus)
  A0_10:setPhysicalParameterDisplay(2, A0_10.work.vitCurrent, A0_10.work.vitAddBonus)
  A0_10:setPhysicalParameterDisplay(3, A0_10.work.dexCurrent, A0_10.work.dexAddBonus)
  A0_10:setPhysicalParameterDisplay(4, A0_10.work.intCurrent, A0_10.work.intAddBonus)
  A0_10:setPhysicalParameterDisplay(5, A0_10.work.mndCurrent, A0_10.work.mndAddBonus)
  A0_10:setPhysicalParameterDisplay(6, A0_10.work.pieCurrent, A0_10.work.pieAddBonus)
  A0_10:setCumulateAddBonusDisplay(1, A0_10.work.strCumulateAddBonus, A0_10.work.strAddBonus)
  A0_10:setCumulateAddBonusDisplay(2, A0_10.work.vitCumulateAddBonus, A0_10.work.vitAddBonus)
  A0_10:setCumulateAddBonusDisplay(3, A0_10.work.dexCumulateAddBonus, A0_10.work.dexAddBonus)
  A0_10:setCumulateAddBonusDisplay(4, A0_10.work.intCumulateAddBonus, A0_10.work.intAddBonus)
  A0_10:setCumulateAddBonusDisplay(5, A0_10.work.mndCumulateAddBonus, A0_10.work.mndAddBonus)
  A0_10:setCumulateAddBonusDisplay(6, A0_10.work.pieCumulateAddBonus, A0_10.work.pieAddBonus)
  A0_10:setText("TextBlock_AddPoint_STR", 6912, A0_10.work.strAddBonus, A0_10.work.strAddBonusLimit)
  A0_10:setText("TextBlock_AddPoint_VIT", 6912, A0_10.work.vitAddBonus, A0_10.work.vitAddBonusLimit)
  A0_10:setText("TextBlock_AddPoint_DEX", 6912, A0_10.work.dexAddBonus, A0_10.work.dexAddBonusLimit)
  A0_10:setText("TextBlock_AddPoint_INT", 6912, A0_10.work.intAddBonus, A0_10.work.intAddBonusLimit)
  A0_10:setText("TextBlock_AddPoint_MND", 6912, A0_10.work.mndAddBonus, A0_10.work.mndAddBonusLimit)
  A0_10:setText("TextBlock_AddPoint_PIE", 6912, A0_10.work.pieAddBonus, A0_10.work.pieAddBonusLimit)
end
function BonusPointAssignWidget.updateBonusPointPlusButtonEnable(A0_16)
  local L1_17
  L1_17 = true
  if A0_16.work.totalRemainingBonus <= 0 then
    A0_16:setEnable("Button_PointPlus_STR", false)
    A0_16:setEnable("Button_PointPlus_VIT", false)
    A0_16:setEnable("Button_PointPlus_DEX", false)
    A0_16:setEnable("Button_PointPlus_INT", false)
    A0_16:setEnable("Button_PointPlus_MND", false)
    A0_16:setEnable("Button_PointPlus_PIE", false)
  else
    L1_17 = true
    if A0_16.work.strAddBonus >= A0_16.work.strAddBonusLimit then
      L1_17 = false
    end
    A0_16:setEnable("Button_PointPlus_STR", L1_17)
    L1_17 = true
    if A0_16.work.vitAddBonus >= A0_16.work.vitAddBonusLimit then
      L1_17 = false
    end
    A0_16:setEnable("Button_PointPlus_VIT", L1_17)
    L1_17 = true
    if A0_16.work.dexAddBonus >= A0_16.work.dexAddBonusLimit then
      L1_17 = false
    end
    A0_16:setEnable("Button_PointPlus_DEX", L1_17)
    L1_17 = true
    if A0_16.work.intAddBonus >= A0_16.work.intAddBonusLimit then
      L1_17 = false
    end
    A0_16:setEnable("Button_PointPlus_INT", L1_17)
    L1_17 = true
    if A0_16.work.mndAddBonus >= A0_16.work.mndAddBonusLimit then
      L1_17 = false
    end
    A0_16:setEnable("Button_PointPlus_MND", L1_17)
    L1_17 = true
    if A0_16.work.pieAddBonus >= A0_16.work.pieAddBonusLimit then
      L1_17 = false
    end
    A0_16:setEnable("Button_PointPlus_PIE", L1_17)
  end
end
function BonusPointAssignWidget.updateBonusPointMinusButtonEnable(A0_18)
  local L1_19
  L1_19 = true
  if A0_18.work.totalRemainingBonus >= A0_18.work.totalRemainingBonusDefault then
    A0_18:setEnable("Button_PointMinus_STR", false)
    A0_18:setEnable("Button_PointMinus_VIT", false)
    A0_18:setEnable("Button_PointMinus_DEX", false)
    A0_18:setEnable("Button_PointMinus_INT", false)
    A0_18:setEnable("Button_PointMinus_MND", false)
    A0_18:setEnable("Button_PointMinus_PIE", false)
  else
    L1_19 = true
    if A0_18.work.strAddBonus <= 0 then
      L1_19 = false
    end
    A0_18:setEnable("Button_PointMinus_STR", L1_19)
    L1_19 = true
    if 0 >= A0_18.work.vitAddBonus then
      L1_19 = false
    end
    A0_18:setEnable("Button_PointMinus_VIT", L1_19)
    L1_19 = true
    if 0 >= A0_18.work.dexAddBonus then
      L1_19 = false
    end
    A0_18:setEnable("Button_PointMinus_DEX", L1_19)
    L1_19 = true
    if 0 >= A0_18.work.intAddBonus then
      L1_19 = false
    end
    A0_18:setEnable("Button_PointMinus_INT", L1_19)
    L1_19 = true
    if 0 >= A0_18.work.mndAddBonus then
      L1_19 = false
    end
    A0_18:setEnable("Button_PointMinus_MND", L1_19)
    L1_19 = true
    if 0 >= A0_18.work.pieAddBonus then
      L1_19 = false
    end
    A0_18:setEnable("Button_PointMinus_PIE", L1_19)
  end
end
function BonusPointAssignWidget.setPlusButtonEnable(A0_20, A1_21)
  A0_20:setEnable("Button_PointPlus_STR", A1_21)
  A0_20:setEnable("Button_PointPlus_VIT", A1_21)
  A0_20:setEnable("Button_PointPlus_DEX", A1_21)
  A0_20:setEnable("Button_PointPlus_INT", A1_21)
  A0_20:setEnable("Button_PointPlus_MND", A1_21)
  A0_20:setEnable("Button_PointPlus_PIE", A1_21)
end
function BonusPointAssignWidget.setMinusButtonEnable(A0_22, A1_23)
  A0_22:setEnable("Button_PointMinus_STR", A1_23)
  A0_22:setEnable("Button_PointMinus_VIT", A1_23)
  A0_22:setEnable("Button_PointMinus_DEX", A1_23)
  A0_22:setEnable("Button_PointMinus_INT", A1_23)
  A0_22:setEnable("Button_PointMinus_MND", A1_23)
  A0_22:setEnable("Button_PointMinus_PIE", A1_23)
end
function BonusPointAssignWidget.setRedoAndCompleteButtonEnable(A0_24, A1_25)
  A0_24:setEnable("Button_Redo", A1_25)
  A0_24:setEnable("Button_Complete", A1_25)
end
function BonusPointAssignWidget.setPhysicalParameterDisplay(A0_26, A1_27, A2_28, A3_29)
  local L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37
  L4_30 = false
  L5_31 = "TextBlock_CurrentValue_STR"
  L6_32 = A2_28 + A3_29
  L7_33 = A1_27
  if L7_33 == 1 then
    L4_30 = true
    L5_31 = "TextBlock_CurrentValue_STR"
    break
  else
  end
  if L7_33 == 2 then
    L4_30 = true
    L5_31 = "TextBlock_CurrentValue_VIT"
    break
  else
  end
  if L7_33 == 3 then
    L4_30 = true
    L5_31 = "TextBlock_CurrentValue_DEX"
    break
  else
  end
  if L7_33 == 4 then
    L4_30 = true
    L5_31 = "TextBlock_CurrentValue_INT"
    break
  else
  end
  if L7_33 == 5 then
    L4_30 = true
    L5_31 = "TextBlock_CurrentValue_MND"
    break
  else
  end
  if L7_33 == 6 then
    L4_30 = true
    L5_31 = "TextBlock_CurrentValue_PIE"
    break
  else
  end
  if L4_30 == true then
    L8_34 = A0_26
    L7_33 = A0_26._setProperty
    L9_35 = nil
    L10_36 = L5_31
    L11_37 = "Text"
    L7_33(L8_34, L9_35, L10_36, L11_37, tostring(L6_32))
  end
end
function BonusPointAssignWidget.setCumulateAddBonusDisplay(A0_38, A1_39, A2_40, A3_41)
  local L4_42, L5_43, L6_44
  L4_42 = false
  L5_43 = "TextBlock_CurrentValue_STR"
  L6_44 = A2_40 + A3_41
  if A1_39 == 1 then
    L4_42 = true
    L5_43 = "TextBlock_BonusValue_STR"
    break
  else
  end
  if A1_39 == 2 then
    L4_42 = true
    L5_43 = "TextBlock_BonusValue_VIT"
    break
  else
  end
  if A1_39 == 3 then
    L4_42 = true
    L5_43 = "TextBlock_BonusValue_DEX"
    break
  else
  end
  if A1_39 == 4 then
    L4_42 = true
    L5_43 = "TextBlock_BonusValue_INT"
    break
  else
  end
  if A1_39 == 5 then
    L4_42 = true
    L5_43 = "TextBlock_BonusValue_MND"
    break
  else
  end
  if A1_39 == 6 then
    L4_42 = true
    L5_43 = "TextBlock_BonusValue_PIE"
    break
  else
  end
  if L4_42 == true then
    A0_38:_setProperty(nil, L5_43, "Text", "+" .. tostring(L6_44))
    if A3_41 > 0 then
      A0_38:setStyle(L5_43, "TBL_parameterAllocation")
    else
      A0_38:setStyle(L5_43, "TBL_parameterPlus")
    end
  end
end
function BonusPointAssignWidget.execBonusPointPlusButton(A0_45, A1_46)
  local L2_47, L4_48, L5_49
  L2_47 = 0
  L4_48 = 0
  L5_49 = A1_46
  if L5_49 == "Button_PointPlus_STR" then
    L2_47 = A0_45.work.strAddBonus
    L4_48 = A0_45.work.strAddBonusLimit
    break
  else
  end
  if L5_49 == "Button_PointPlus_VIT" then
    L2_47 = A0_45.work.vitAddBonus
    L4_48 = A0_45.work.vitAddBonusLimit
    break
  else
  end
  if L5_49 == "Button_PointPlus_DEX" then
    L2_47 = A0_45.work.dexAddBonus
    L4_48 = A0_45.work.dexAddBonusLimit
    break
  else
  end
  if L5_49 == "Button_PointPlus_INT" then
    L2_47 = A0_45.work.intAddBonus
    L4_48 = A0_45.work.intAddBonusLimit
    break
  else
  end
  if L5_49 == "Button_PointPlus_MND" then
    L2_47 = A0_45.work.mndAddBonus
    L4_48 = A0_45.work.mndAddBonusLimit
    break
  else
  end
  if L5_49 == "Button_PointPlus_PIE" then
    L2_47 = A0_45.work.pieAddBonus
    L4_48 = A0_45.work.pieAddBonusLimit
    break
  else
  end
  if L2_47 < L4_48 then
    L5_49 = A0_45.work
    L5_49 = L5_49.totalRemainingBonus
    if L5_49 > 0 then
      L2_47 = L2_47 + 1
      L5_49 = A0_45.work
      L5_49.totalRemainingBonus = A0_45.work.totalRemainingBonus - 1
    end
  end
  L5_49 = A1_46
  if L5_49 == "Button_PointPlus_STR" then
    A0_45.work.strAddBonus = L2_47
    break
  else
  end
  if L5_49 == "Button_PointPlus_VIT" then
    A0_45.work.vitAddBonus = L2_47
    break
  else
  end
  if L5_49 == "Button_PointPlus_DEX" then
    A0_45.work.dexAddBonus = L2_47
    break
  else
  end
  if L5_49 == "Button_PointPlus_INT" then
    A0_45.work.intAddBonus = L2_47
    break
  else
  end
  if L5_49 == "Button_PointPlus_MND" then
    A0_45.work.mndAddBonus = L2_47
    break
  else
  end
  if L5_49 == "Button_PointPlus_PIE" then
    A0_45.work.pieAddBonus = L2_47
    break
  else
  end
end
function BonusPointAssignWidget.execBonusPointMinusButton(A0_50, A1_51)
  local L2_52, L3_53, L4_54
  L2_52 = 0
  L3_53 = A1_51
  if L3_53 == "Button_PointMinus_STR" then
    L4_54 = A0_50.work
    L2_52 = L4_54.strAddBonus
    break
  else
  end
  if L3_53 == "Button_PointMinus_VIT" then
    L4_54 = A0_50.work
    L2_52 = L4_54.vitAddBonus
    break
  else
  end
  if L3_53 == "Button_PointMinus_DEX" then
    L4_54 = A0_50.work
    L2_52 = L4_54.dexAddBonus
    break
  else
  end
  if L3_53 == "Button_PointMinus_INT" then
    L4_54 = A0_50.work
    L2_52 = L4_54.intAddBonus
    break
  else
  end
  if L3_53 == "Button_PointMinus_MND" then
    L4_54 = A0_50.work
    L2_52 = L4_54.mndAddBonus
    break
  else
  end
  if L3_53 == "Button_PointMinus_PIE" then
    L4_54 = A0_50.work
    L2_52 = L4_54.pieAddBonus
    break
  else
  end
  if L2_52 > 0 then
    L2_52 = L2_52 - 1
    L3_53 = A0_50.work
    L4_54 = A0_50.work
    L4_54 = L4_54.totalRemainingBonus
    L4_54 = L4_54 + 1
    L3_53.totalRemainingBonus = L4_54
  end
  L3_53 = A1_51
  if L3_53 == "Button_PointMinus_STR" then
    L4_54 = A0_50.work
    L4_54.strAddBonus = L2_52
    break
  else
  end
  if L3_53 == "Button_PointMinus_VIT" then
    L4_54 = A0_50.work
    L4_54.vitAddBonus = L2_52
    break
  else
  end
  if L3_53 == "Button_PointMinus_DEX" then
    L4_54 = A0_50.work
    L4_54.dexAddBonus = L2_52
    break
  else
  end
  if L3_53 == "Button_PointMinus_INT" then
    L4_54 = A0_50.work
    L4_54.intAddBonus = L2_52
    break
  else
  end
  if L3_53 == "Button_PointMinus_MND" then
    L4_54 = A0_50.work
    L4_54.mndAddBonus = L2_52
    break
  else
  end
  if L3_53 == "Button_PointMinus_PIE" then
    L4_54 = A0_50.work
    L4_54.pieAddBonus = L2_52
    break
  else
  end
end
function BonusPointAssignWidget.setWindowFocus(A0_55, A1_56)
  if A1_56 ~= nil and A1_56 ~= "" then
    A0_55:setLogicalFocus(A1_56)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_55 then
      A0_55:setKeyboardFocusedControl(A1_56)
    end
  end
end
function BonusPointAssignWidget.processUICommandOperate(A0_57, A1_58, A2_59, A3_60, A4_61)
  local L5_62
  L5_62 = A2_59
  if L5_62 == "Button_Redo" then
    if A0_57:getEnable("Button_Redo") == true then
      A0_57:initWindowDisplay()
      A0_57:updateWindowDisplay()
      do return end
      do break end
      elseif L5_62 == "Button_PointMinus_STR" then
      elseif L5_62 == "Button_PointMinus_VIT" then
      elseif L5_62 == "Button_PointMinus_DEX" then
      elseif L5_62 == "Button_PointMinus_INT" then
      elseif L5_62 == "Button_PointMinus_MND" then
      else
      end
      if L5_62 == "Button_PointMinus_PIE" then
        A0_57:execBonusPointMinusButton(A2_59)
        break
      elseif L5_62 == "Button_PointPlus_STR" then
      elseif L5_62 == "Button_PointPlus_VIT" then
      elseif L5_62 == "Button_PointPlus_DEX" then
      elseif L5_62 == "Button_PointPlus_INT" then
      elseif L5_62 == "Button_PointPlus_MND" then
      else
      end
      if L5_62 == "Button_PointPlus_PIE" then
        A0_57:execBonusPointPlusButton(A2_59)
        break
      else
      end
      if L5_62 == "Button_Complete" then
        A0_57:setBaseAskResult(1)
        return
      else
      end
      if L5_62 == "Button_Cancel" then
        A0_57:setBaseAskResult(-1)
        return
      end
    else
    end
  L5_62 = A0_57.work
  L5_62 = L5_62.strAddBonus
  L5_62 = L5_62 + A0_57.work.vitAddBonus
  L5_62 = L5_62 + A0_57.work.dexAddBonus
  L5_62 = L5_62 + A0_57.work.intAddBonus
  L5_62 = L5_62 + A0_57.work.mndAddBonus
  L5_62 = L5_62 + A0_57.work.pieAddBonus
  if L5_62 > 0 then
    A0_57:setRedoAndCompleteButtonEnable(true)
  else
    A0_57:setRedoAndCompleteButtonEnable(false)
  end
  A0_57:updateWindowDisplay()
end
function BonusPointAssignWidget.getAskResult(A0_63)
  local L1_64, L2_65
  L2_65 = A0_63
  L1_64 = A0_63.getBaseAskResult
  L1_64 = L1_64(L2_65)
  L2_65 = true
  if L1_64 == 1 then
    L2_65 = true
  elseif L1_64 == -1 then
    L2_65 = false
  end
  return L2_65, A0_63.work.strAddBonus, A0_63.work.vitAddBonus, A0_63.work.dexAddBonus, A0_63.work.intAddBonus, A0_63.work.mndAddBonus, A0_63.work.pieAddBonus
end
