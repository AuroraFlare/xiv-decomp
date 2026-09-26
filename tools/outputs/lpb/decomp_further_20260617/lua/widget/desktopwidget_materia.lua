local L0_0, L1_1
L0_0 = DesktopWidget
function L1_1(A0_2, A1_3)
  local L3_4, L4_5, L5_6
  L3_4 = 0
  for _FORV_6_ = 1, #A1_3 do
    if A1_3[_FORV_6_] > 0 then
      L3_4 = L3_4 + 1
    end
  end
  return L3_4
end
L0_0.getAttachedMateriaCount = L1_1
L0_0 = DesktopWidget
function L1_1(A0_7, A1_8)
  local L2_9, L3_10
  L2_9 = 0
  L3_10 = A1_8.getNormalItemMateriaType
  L3_10 = L3_10(A1_8)
  L2_9 = A0_7:getAttachedMateriaCount(L3_10)
  return L2_9
end
L0_0.getAttachedMateriaCountByItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_11, A1_12)
  local L2_13
  L2_13 = worldMaster
  L2_13 = L2_13._getMyPlayer
  L2_13 = L2_13(L2_13)
  L2_13 = L2_13._getItem
  L2_13 = L2_13(L2_13, 1, A1_12)
  return A0_11:getAttachedMateriaCountByItem(L2_13)
end
L0_0.getAttachedMateriaCountByIndex = L1_1
L0_0 = DesktopWidget
function L1_1(A0_14, A1_15, A2_16, A3_17, A4_18)
  local L5_19, L6_20, L7_21, L8_22, L9_23, L10_24
  L6_20 = A0_14
  L5_19 = A0_14.getItemBonusMateria
  L10_24 = A4_18
  L6_20 = L5_19(L6_20, L7_21, L8_22, L9_23, L10_24)
  for L10_24 = 1, #L5_19 do
    A0_14:setMateriaListItem(A1_15, L10_24, L5_19[L10_24], L6_20[L10_24])
  end
end
L0_0.setMateriaListItems = L1_1
L0_0 = DesktopWidget
function L1_1(A0_25, A1_26, A2_27, A3_28, A4_29)
  local L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38, L14_39, L15_40
  L5_30 = "ListBoxItem_MateriaParameter_"
  L6_31 = tostring
  L7_32 = A2_27
  L6_31 = L6_31(L7_32)
  L5_30 = L5_30 .. L6_31
  if A3_28 > 0 then
    L7_32 = A1_26
    L6_31 = A1_26.setVisibility
    L8_33 = L5_30
    L9_34 = true
    L6_31(L7_32, L8_33, L9_34)
  else
    L7_32 = A1_26
    L6_31 = A1_26.setVisibility
    L8_33 = L5_30
    L9_34 = false
    L6_31(L7_32, L8_33, L9_34)
    return
  end
  L7_32 = A0_25
  L6_31 = A0_25.getMateriaIcon
  L8_33 = A3_28
  L9_34 = A4_29
  L6_31 = L6_31(L7_32, L8_33, L9_34)
  L8_33 = A0_25
  L7_32 = A0_25.getMateriaCatalogID
  L9_34 = A3_28
  L10_35 = A4_29
  L7_32 = L7_32(L8_33, L9_34, L10_35)
  L8_33 = L5_30
  L9_34 = ":"
  L5_30 = L8_33 .. L9_34
  L9_34 = A1_26
  L8_33 = A1_26.setIcon
  L10_35 = L5_30
  L11_36 = "IconControl_Materia"
  L10_35 = L10_35 .. L11_36
  L11_36 = L6_31
  L8_33(L9_34, L10_35, L11_36)
  L9_34 = A1_26
  L8_33 = A1_26.setText
  L10_35 = L5_30
  L11_36 = "TextBlock_MateriaName"
  L10_35 = L10_35 .. L11_36
  L11_36 = 3202
  L12_37 = L7_32
  L13_38 = 1
  L8_33(L9_34, L10_35, L11_36, L12_37, L13_38)
  L9_34 = A0_25
  L8_33 = A0_25.getMateriaProperty
  L10_35 = A3_28
  L11_36 = A4_29
  L11_36 = L8_33(L9_34, L10_35, L11_36)
  L12_37 = L5_30
  L13_38 = "Label_MateriaParameter_"
  L14_39 = "1:"
  L12_37 = L12_37 .. L13_38 .. L14_39
  L14_39 = A0_25
  L13_38 = A0_25.getItemParamString
  L15_40 = A1_26
  L14_39 = L13_38(L14_39, L15_40, L8_33, L9_34)
  L15_40 = A1_26.setText
  L15_40(A1_26, L12_37 .. "TextBlock_ParameterHeader", L13_38)
  L15_40 = A1_26.setText
  L15_40(A1_26, L12_37 .. "TextBlock_ParameterValue", L14_39)
  L15_40 = L5_30
  L15_40 = L15_40 .. "Label_MateriaParameter_" .. "2:"
  if L10_35 > 0 then
    L13_38, L14_39 = A0_25:getItemParamString(A1_26, L10_35, L11_36)
    A1_26:setText(L15_40 .. "TextBlock_ParameterHeader", L13_38)
    A1_26:setText(L15_40 .. "TextBlock_ParameterValue", L14_39)
    A1_26:setVisibility(L15_40, true)
  else
    A1_26:setVisibility(L15_40, false)
  end
end
L0_0.setMateriaListItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_41, A1_42, A2_43)
  local L3_44, L4_45, L5_46, L6_47
  L3_44 = 0
  L4_45 = 0
  L5_46 = 0
  L6_47 = 0
  L3_44 = materiaSheet:_getData(A1_42, 4)
  L4_45 = materiaSheet:_getData(A1_42, 5 + A2_43)
  L5_46 = materiaSheet:_getData(A1_42, 21)
  L6_47 = materiaSheet:_getData(A1_42, 22 + A2_43)
  return L3_44, L4_45, L5_46, L6_47
end
L0_0.getMateriaProperty = L1_1
L0_0 = DesktopWidget
function L1_1(A0_48, A1_49, A2_50)
  local L3_51
  L3_51 = 0
  if A2_50 >= 0 and A2_50 <= 3 then
    L3_51 = 38
  elseif A2_50 >= 4 and A2_50 <= 7 then
    L3_51 = 39
  elseif A2_50 >= 8 and A2_50 <= 11 then
    L3_51 = 40
  elseif A2_50 >= 12 and A2_50 <= 15 then
    L3_51 = 41
  end
  L3_51 = materiaSheet:_getData(A1_49, L3_51)
  return tonumber(L3_51)
end
L0_0.getMateriaIcon = L1_1
L0_0 = DesktopWidget
function L1_1(A0_52, A1_53, A2_54)
  return (materiaSheet:_getData(A1_53, 0 + _math.floor(A2_54 / 4)))
end
L0_0.getMateriaCatalogID = L1_1
L0_0 = DesktopWidget
function L1_1(A0_55, A1_56)
  return worldMaster:_getMyPlayer():_getItem(1, A1_56):getMateriaBindPermission()
end
L0_0.getMateriaBindPermission = L1_1
L0_0 = DesktopWidget
function L1_1(A0_57, A1_58, A2_59)
  local L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67, L11_68, L12_69, L13_70, L14_71, L15_72, L16_73, L17_74, L18_75, L19_76
  L3_60 = worldMaster
  L4_61 = L3_60
  L3_60 = L3_60._getMyPlayer
  L3_60 = L3_60(L4_61)
  L5_62 = A2_59
  L4_61 = A2_59.getMateriaBindPermission
  L4_61 = L4_61(L5_62)
  L6_63 = A1_58
  L5_62 = A1_58.isMateriaFitItemEquipPoint
  L7_64 = nil
  L8_65 = A2_59
  L5_62 = L5_62(L6_63, L7_64, L8_65)
  if L5_62 then
    L7_64 = A1_58
    L6_63 = A1_58.getItemLevel
    L6_63 = L6_63(L7_64)
    L8_65 = A2_59
    L7_64 = A2_59.getItemLevel
    L7_64 = L7_64(L8_65)
    if L6_63 > L7_64 then
      L5_62 = false
    end
  end
  L7_64 = A2_59
  L6_63 = A2_59.getItemRepairSkill
  L6_63 = L6_63(L7_64)
  L8_65 = L3_60
  L7_64 = L3_60.getStateMainSkill
  L7_64 = L7_64(L8_65)
  L7_64 = L6_63 == L7_64
  L9_66 = A2_59
  L8_65 = A2_59.getItemLevel
  L8_65 = L8_65(L9_66)
  L10_67 = L3_60
  L9_66 = L3_60.getMainSkillLevel
  L9_66 = L9_66(L10_67)
  L9_66 = L8_65 <= L9_66
  L11_68 = A2_59
  L10_67 = A2_59.getNormalItemMateriaFreeIndex
  L10_67 = L10_67(L11_68)
  L10_67 = L10_67 ~= 0
  L12_69 = A2_59
  L11_68 = A2_59.isMateriaAttached
  L11_68 = L11_68(L12_69)
  L13_70 = L3_60
  L12_69 = L3_60.hasItem
  L14_71 = 101
  L15_72 = 2001003
  L12_69 = L12_69(L13_70, L14_71, L15_72)
  if L11_68 and L12_69 == false then
    L10_67 = false
  end
  L13_70 = false
  L15_72 = L3_60
  L14_71 = L3_60.getItemPackageItemCount
  L14_71 = L14_71(L15_72, L16_73)
  L15_72 = A1_58.getItemRepairItem
  L15_72 = L15_72(L16_73)
  for L19_76 = 1, L14_71 do
    if A0_57:getItemInfo(L3_60, 1, L19_76) == L15_72 then
      L13_70 = true
    end
  end
  L16_73 = L4_61 and L5_62 and L7_64 and L9_66 and L10_67 and L13_70
  L19_76 = L5_62
  return L17_74, L18_75, L19_76, L7_64, L9_66, L10_67, L13_70
end
L0_0.checkMateriaJoinRequirement = L1_1
