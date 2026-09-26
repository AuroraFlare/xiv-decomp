require("/Widget/WidgetBaseClass")
_defineClass("GrandCompanyStatusWidget", "WidgetBaseClass")
function GrandCompanyStatusWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "StatusWidget"
  return L1_1
end
function GrandCompanyStatusWidget.init(A0_2, A1_3, A2_4, A3_5, A4_6)
  local L5_7, L6_8, L7_9
  L5_7 = A0_2.work
  L6_8 = {
    L7_9,
    {"limsaQuest", "boolean"},
    {
      "gridaniaQuest",
      "boolean"
    },
    {"uldahQuest", "boolean"}
  }
  L7_9 = {"companyID", "integer16"}
  L5_7._temp = L6_8
  L5_7 = A0_2.work
  L5_7.companyID = A1_3
  if A2_4 ~= nil then
    L5_7 = A0_2.work
    L5_7.limsaQuest = A2_4
  end
  if A3_5 ~= nil then
    L5_7 = A0_2.work
    L5_7.gridaniaQuest = A3_5
  end
  if A4_6 ~= nil then
    L5_7 = A0_2.work
    L5_7.uldahQuest = A4_6
  end
  L6_8 = A0_2
  L5_7 = A0_2.setModal
  L7_9 = false
  L5_7(L6_8, L7_9)
  L6_8 = A0_2
  L5_7 = A0_2.setDrag
  L7_9 = false
  L5_7(L6_8, L7_9)
  L6_8 = A0_2
  L5_7 = A0_2.setControlCommandCondition
  L7_9 = "TabControl_Status"
  L5_7(L6_8, L7_9, "UILuaCommands.TabChanged")
  L6_8 = A0_2
  L5_7 = A0_2.initForm
  L5_7(L6_8)
  L6_8 = A0_2
  L5_7 = A0_2.setPlayerName
  L7_9 = ""
  L5_7(L6_8, L7_9)
  L5_7 = desktopWidget
  L6_8 = L5_7
  L5_7 = L5_7.getPlayerName
  L5_7 = L5_7(L6_8)
  L7_9 = A0_2
  L6_8 = A0_2.setPlayerName
  L6_8(L7_9, L5_7)
  L7_9 = A0_2
  L6_8 = A0_2.setSelectedIndex
  L6_8(L7_9, "TabControl_Status", 3)
  L7_9 = A0_2
  L6_8 = A0_2.getProperty
  L6_8 = L6_8(L7_9, "Top")
  L7_9 = A0_2.getProperty
  L7_9 = L7_9(A0_2, "Left")
  L6_8 = 0 - L6_8 + 36
  L7_9 = 0 - L7_9 + 64
  A0_2:setProperty("Margin", tostring(L7_9) .. "," .. tostring(L6_8) .. ",0,0")
end
function GrandCompanyStatusWidget.initForm(A0_10)
  A0_10:setCloseCondition()
  A0_10:setCancelCondition()
  A0_10:setEnable("TabItem_Status", false)
  A0_10:setEnable("TabItem_SkillList", false)
  A0_10:setEnable("TabItem_Important", false)
  A0_10:setEnable("TabItem_Contents", false)
  A0_10:initGrandCompanyStatus()
  A0_10:updateGrandCompanyStatus()
end
function GrandCompanyStatusWidget.setPlayerName(A0_11, A1_12)
  if A1_12 ~= "" then
    A0_11:setText("TextBlock_PlayerName", 230, A1_12)
  else
    A0_11:setText("TextBlock_PlayerName", "")
  end
end
function GrandCompanyStatusWidget.initGrandCompanyStatus(A0_13)
  A0_13:setGrandCompany(1)
  A0_13:setGrandCompany(2)
  A0_13:setGrandCompany(3)
end
function GrandCompanyStatusWidget.setGrandCompany(A0_14, A1_15, A2_16, A3_17)
  local L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27
  L5_19 = A0_14
  L4_18 = A0_14.getGrandCompanyLabel
  L6_20 = A1_15
  L4_18 = L4_18(L5_19, L6_20)
  L5_19 = worldMaster
  L6_20 = L5_19
  L5_19 = L5_19._getMyPlayer
  L5_19 = L5_19(L6_20)
  L6_20 = 1
  L8_22 = L5_19
  L7_21 = L5_19.isMale
  L7_21 = L7_21(L8_22)
  if L7_21 == true then
    L6_20 = 1
  else
    L8_22 = L5_19
    L7_21 = L5_19.isFemale
    L7_21 = L7_21(L8_22)
    if L7_21 == true then
      L6_20 = 2
    end
  end
  L8_22 = L5_19
  L7_21 = L5_19.getGrandCompanyRank
  L9_23 = A1_15
  L8_22 = L7_21(L8_22, L9_23)
  L9_23 = false
  if A2_16 ~= nil then
    L7_21 = A2_16
  end
  if A3_17 ~= nil and A3_17 == true then
    L8_22 = false
  end
  if L7_21 > 0 and L8_22 == false then
    L9_23 = true
    L11_25 = A0_14
    L10_24 = A0_14.getTemplateControl
    L12_26 = L4_18
    L13_27 = "IconControl_CompanyStatus"
    L10_24 = L10_24(L11_25, L12_26, L13_27)
    L11_25 = 1
    L13_27 = A0_14
    L12_26 = A0_14.setControlProperty
    L12_26(L13_27, L10_24, "VisualOpacity", L11_25)
    L13_27 = A0_14
    L12_26 = A0_14.setControlProperty
    L12_26(L13_27, L10_24, "VisualOpacityRed", L11_25)
    L13_27 = A0_14
    L12_26 = A0_14.setControlProperty
    L12_26(L13_27, L10_24, "VisualOpacityGreen", L11_25)
    L13_27 = A0_14
    L12_26 = A0_14.setControlProperty
    L12_26(L13_27, L10_24, "VisualOpacityBlue", L11_25)
  elseif L8_22 == true then
    L9_23 = true
    L7_21 = 127
    L10_24, L11_25 = nil, nil
    L12_26 = A1_15
    if L12_26 == 1 then
      L13_27 = 2
      L11_25 = 3
      L10_24 = L13_27
      break
    else
    end
    if L12_26 == 2 then
      L13_27 = 1
      L11_25 = 3
      L10_24 = L13_27
      break
    else
    end
    if L12_26 == 3 then
      L13_27 = 1
      L11_25 = 2
      L10_24 = L13_27
      do break end
      break
    else
    end
    L13_27 = L5_19
    L12_26 = L5_19.getGrandCompanyRankLinear
    L13_27 = L12_26(L13_27, L10_24)
    if L12_26 > 0 and L13_27 == false or 0 < L5_19:getGrandCompanyRankLinear(L11_25) and L5_19:getGrandCompanyRankLinear(L11_25) == false then
      A0_14:setVisibility(L4_18, false)
    end
    if A1_15 == A0_14.work.companyID then
      A0_14:setEnable(L4_18, true)
    else
      A0_14:setEnable(L4_18, false)
    end
  else
    L11_25 = A0_14
    L10_24 = A0_14.setVisibility
    L12_26 = L4_18
    L13_27 = false
    L10_24(L11_25, L12_26, L13_27)
  end
  if L9_23 == true then
    L11_25 = A0_14
    L10_24 = A0_14.getGrandCompanyPoint
    L12_26 = A1_15
    L11_25 = L10_24(L11_25, L12_26)
    L13_27 = A0_14
    L12_26 = A0_14.getGrandCompanyStatusIcon
    L12_26 = L12_26(L13_27, A1_15, L7_21)
    L13_27 = A0_14.setText
    L13_27(A0_14, A0_14:getTemplateControl(L4_18, "TextBlock_CompanyPoint"), 3551, L10_24, L11_25)
    if L7_21 == 0 or L7_21 == 127 then
      L13_27 = A0_14.setHidden
      L13_27(A0_14, A0_14:getTemplateControl(L4_18, "IconControl_CompanyStatus"))
    else
      L13_27 = A0_14.setVisibility
      L13_27(A0_14, A0_14:getTemplateControl(L4_18, "IconControl_CompanyStatus"), true)
      L13_27 = A0_14.setIcon
      L13_27(A0_14, A0_14:getTemplateControl(L4_18, "IconControl_CompanyStatus"), L12_26)
    end
    L13_27 = L7_21
    A0_14:setText(A0_14:getTemplateControl(L4_18, "TextBlock_CompanyRankName"), 8079 + A1_15, L13_27, L6_20)
  end
end
function GrandCompanyStatusWidget.getGrandCompanyPoint(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38, L11_39
  L3_31 = A1_29
  if L3_31 == 1 then
    L2_30 = 1000201
    break
  else
  end
  if L3_31 == 2 then
    L2_30 = 1000202
    break
  else
  end
  if L3_31 == 3 then
    L2_30 = 1000203
    do break end
    break
  else
  end
  L3_31 = 100
  L4_32 = 0
  L5_33 = worldMaster
  L6_34 = L5_33
  L5_33 = L5_33._getMyPlayer
  L5_33 = L5_33(L6_34)
  L7_35 = L5_33
  L6_34 = L5_33._getItemPackageCapacity
  L6_34 = L6_34(L7_35, L8_36)
  L7_35 = L5_33._getItemPackageFreeSpace
  L7_35 = L7_35(L8_36, L9_37)
  for L11_39 = 1, L6_34 - L7_35 do
    if desktopWidget:getPlayerItemInPackage(L3_31, L11_39) == L2_30 then
      L4_32 = desktopWidget:getPlayerItemInPackage(L3_31, L11_39)
      break
    end
  end
  return L9_37, L10_38
end
function GrandCompanyStatusWidget.getGrandCompanyLabel(A0_40, A1_41)
  local L2_42, L3_43
  L3_43 = A1_41
  if L3_43 == 1 then
    L2_42 = "Label_1"
    break
  else
  end
  if L3_43 == 2 then
    L2_42 = "Label_2"
    break
  else
  end
  if L3_43 == 3 then
    L2_42 = "Label_3"
    break
  else
  end
  return L2_42
end
function GrandCompanyStatusWidget.getGrandCompanyStatusIcon(A0_44, A1_45, A2_46)
  gcRankSheet:_loadKeyTemporarily(A2_46, A2_46)
  return (gcRankSheet:_getData(A2_46, A1_45 + 6 - 1))
end
function GrandCompanyStatusWidget.getTemplateControl(A0_47, A1_48, A2_49)
  return A1_48 .. ":" .. A2_49
end
function GrandCompanyStatusWidget.updateGrandCompanyStatus(A0_50)
  local L1_51, L2_52, L3_53, L4_54, L5_55
  L1_51 = A0_50.work
  L1_51 = L1_51.companyID
  L3_53 = A0_50
  L2_52 = A0_50.getGrandCompanyLabel
  L4_54 = L1_51
  L2_52 = L2_52(L3_53, L4_54)
  L4_54 = A0_50
  L3_53 = A0_50.getGrandCompanyStatusIcon
  L5_55 = L1_51
  L3_53 = L3_53(L4_54, L5_55, 127)
  L4_54 = worldMaster
  L5_55 = L4_54
  L4_54 = L4_54._getMyPlayer
  L4_54 = L4_54(L5_55)
  L5_55 = 1
  if L4_54:isMale() == true then
    L5_55 = 1
  elseif L4_54:isFemale() == true then
    L5_55 = 2
  end
  A0_50:setHidden(A0_50:getTemplateControl(L2_52, "IconControl_CompanyStatus"))
  A0_50:setText(A0_50:getTemplateControl(L2_52, "TextBlock_CompanyRankName"), 8079 + L1_51, 127, L5_55)
  A0_50:setVisibility(L2_52, true)
end
function GrandCompanyStatusWidget.setGrandCompanyPoint(A0_56, A1_57)
  local L2_58, L3_59
  L2_58 = worldMaster
  L3_59 = L2_58
  L2_58 = L2_58._getMyPlayer
  L2_58 = L2_58(L3_59)
  L3_59 = L2_58.getGrandCompanySealMax
  L3_59 = L3_59(L2_58, A0_56.work.companyID)
  A0_56:setText(A0_56:getTemplateControl(A0_56:getGrandCompanyLabel(A0_56.work.companyID), "TextBlock_CompanyPoint"), 3551, A1_57, L3_59)
end
function GrandCompanyStatusWidget.setGrandCompanyJoinStatus(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65, L6_66
  L2_62 = 1
  if A1_61 ~= nil then
    L2_62 = A1_61
  end
  L4_64 = A0_60
  L3_63 = A0_60.setGrandCompany
  L5_65 = A0_60.work
  L5_65 = L5_65.companyID
  L6_66 = A1_61
  L3_63(L4_64, L5_65, L6_66, true)
  L3_63 = A0_60.work
  L3_63 = L3_63.companyID
  if L3_63 == 1 then
    L5_65 = A0_60
    L4_64 = A0_60.setVisibility
    L6_66 = A0_60.getGrandCompanyLabel
    L6_66 = L6_66(A0_60, 2)
    L4_64(L5_65, L6_66, false)
    L5_65 = A0_60
    L4_64 = A0_60.setVisibility
    L6_66 = A0_60.getGrandCompanyLabel
    L6_66 = L6_66(A0_60, 3)
    L4_64(L5_65, L6_66, false)
    break
  else
  end
  if L3_63 == 2 then
    L5_65 = A0_60
    L4_64 = A0_60.setVisibility
    L6_66 = A0_60.getGrandCompanyLabel
    L6_66 = L6_66(A0_60, 1)
    L4_64(L5_65, L6_66, false)
    L5_65 = A0_60
    L4_64 = A0_60.setVisibility
    L6_66 = A0_60.getGrandCompanyLabel
    L6_66 = L6_66(A0_60, 3)
    L4_64(L5_65, L6_66, false)
    break
  else
  end
  if L3_63 == 3 then
    L5_65 = A0_60
    L4_64 = A0_60.setVisibility
    L6_66 = A0_60.getGrandCompanyLabel
    L6_66 = L6_66(A0_60, 1)
    L4_64(L5_65, L6_66, false)
    L5_65 = A0_60
    L4_64 = A0_60.setVisibility
    L6_66 = A0_60.getGrandCompanyLabel
    L6_66 = L6_66(A0_60, 2)
    L4_64(L5_65, L6_66, false)
    do break end
    break
  else
  end
  L3_63 = worldMaster
  L4_64 = L3_63
  L3_63 = L3_63._getMyPlayer
  L3_63 = L3_63(L4_64)
  L5_65 = L3_63
  L4_64 = L3_63._getBelongGrandCompany
  L4_64 = L4_64(L5_65)
  if L4_64 > 0 then
    L6_66 = A0_60
    L5_65 = A0_60.getGrandCompanyPoint
    L6_66 = L5_65(L6_66, A0_60.work.companyID)
    gcRankSheet:_loadKeyTemporarily(A1_61, A1_61)
    L6_66 = gcRankSheet:_getData(A1_61, 1)
    A0_60:setText(A0_60:getTemplateControl(A0_60:getGrandCompanyLabel(A0_60.work.companyID), "TextBlock_CompanyPoint"), 3551, L5_65, L6_66)
  end
end
function GrandCompanyStatusWidget.processUICommandClose(A0_67, A1_68, A2_69, A3_70, A4_71)
  return
end
function GrandCompanyStatusWidget.processUICommandDefault(A0_72, A1_73, A2_74, A3_75, A4_76)
  if A2_74 == "TabControl_Status" then
    A0_72:setSelectedIndex("TabControl_Status", 3)
  end
end
