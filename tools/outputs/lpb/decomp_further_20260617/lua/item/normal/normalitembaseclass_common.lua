local L0_0, L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_2)
  return _math.min(A0_2:getItemLifeMax(), A0_2.normalItemWork.life)
end
L0_0.getNormalItemLife = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_3)
  return A0_3.normalItemWork.use
end
L0_0.getNormalItemUse = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_4)
  return A0_4.normalItemWork.polish
end
L0_0.getNormalItemPolish = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_5)
  return A0_5.normalItemWork.param1
end
L0_0.getNormalItemParam1 = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_6)
  return A0_6.normalItemWork.param2
end
L0_0.getNormalItemParam2 = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_7)
  return A0_7.normalItemWork.param3
end
L0_0.getNormalItemParam3 = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_8)
  return A0_8.normalItemWork.fitness
end
L0_0.getNormalItemFitness = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_9)
  return A0_9.normalItemWork.materiaType
end
L0_0.getNormalItemMateriaType = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_10)
  return A0_10.normalItemWork.materiaGrade
end
L0_0.getNormalItemMateriaGrade = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_11)
  local L1_12, L2_13
  L2_13 = A0_11
  L1_12 = A0_11.getNormalItemMateriaType
  L1_12 = L1_12(L2_13)
  L2_13 = 0
  for _FORV_6_ = 1, 5 do
    if L1_12[_FORV_6_] == 0 then
      L2_13 = _FORV_6_
      break
    end
  end
  return L2_13
end
L0_0.getNormalItemMateriaFreeIndex = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_14)
  for _FORV_6_ = 1, 5 do
    if A0_14:getNormalItemMateriaType()[_FORV_6_] ~= 0 then
      break
    end
  end
  return true
end
L0_0.isMateriaAttached = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_15)
  for _FORV_6_ = 1, 5 do
  end
  return 0 + 1
end
L0_0.getMateriaAttachedCount = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_16)
  local L1_17
  L1_17 = true
  return L1_17
end
L0_0.isUseForBattle = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_18)
  local L1_19
  L1_19 = 4
  return L1_19
end
L0_0.getObjectClassId = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_20, A1_21, A2_22)
  if A2_22 == nil or A2_22 <= A1_21 then
    return 1
  end
  if A2_22 >= 31 then
    if _math.min(7, A2_22 - A1_21) == 1 then
    elseif _math.min(7, A2_22 - A1_21) == 2 then
    elseif _math.min(7, A2_22 - A1_21) == 3 then
    elseif _math.min(7, A2_22 - A1_21) == 4 then
    elseif _math.min(7, A2_22 - A1_21) == 5 then
    elseif _math.min(7, A2_22 - A1_21) == 6 then
    else
    end
  elseif A2_22 >= 11 then
    if _math.min(7, A2_22 - A1_21) == 1 then
    elseif _math.min(7, A2_22 - A1_21) == 2 then
    elseif _math.min(7, A2_22 - A1_21) == 3 then
    elseif _math.min(7, A2_22 - A1_21) == 4 then
    elseif _math.min(7, A2_22 - A1_21) == 5 then
    elseif _math.min(7, A2_22 - A1_21) == 6 then
    else
    end
  elseif _math.min(7, A2_22 - A1_21) == 1 then
  elseif _math.min(7, A2_22 - A1_21) == 2 then
  elseif _math.min(7, A2_22 - A1_21) == 3 then
  elseif _math.min(7, A2_22 - A1_21) == 4 then
  elseif _math.min(7, A2_22 - A1_21) == 5 then
  elseif _math.min(7, A2_22 - A1_21) == 6 then
  else
  end
  return 0.5
end
L0_0.calculateLevelAdjust = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_23, A1_24, A2_25)
  local L3_26, L4_27, L5_28
  L5_28 = A2_25
  L4_27 = A2_25.isWeapon
  L4_27 = L4_27(L5_28)
  if L4_27 then
    L5_28 = A2_25
    L4_27 = A2_25.getItemKind
    L4_27 = L4_27(L5_28)
    L5_28 = L4_27
    if L5_28 == 5005 then
      L3_26 = 48
      break
    else
    end
    if L5_28 == 5006 then
      L3_26 = 49
      break
    else
    end
    if L5_28 == 5009 then
      L3_26 = 50
      break
    else
    end
    if L5_28 == 5014 then
      L3_26 = 51
      break
    else
    end
    if L5_28 == 5013 then
      L3_26 = 52
      break
    else
    end
    if L5_28 == 5003 then
      L3_26 = 53
      break
    else
    end
    if L5_28 == 5107 then
      L3_26 = 54
      break
    else
    end
    if L5_28 == 5108 then
      L3_26 = 55
      break
    else
    end
    if L5_28 == 5105 then
      L3_26 = 56
      break
    else
    end
    if L5_28 == 5106 then
      L3_26 = 57
      break
    else
    end
    if L5_28 == 6003 then
      L3_26 = 58
      break
    else
    end
    if L5_28 == 6005 then
      L3_26 = 59
      break
    else
    end
    if L5_28 == 6007 then
      L3_26 = 60
      break
    else
    end
    if L5_28 == 6009 then
      L3_26 = 61
      break
    else
    end
    if L5_28 == 6011 then
      L3_26 = 62
      break
    else
    end
    if L5_28 == 6013 then
      L3_26 = 63
      break
    else
    end
    if L5_28 == 6015 then
      L3_26 = 64
      break
    else
    end
    if L5_28 == 6017 then
      L3_26 = 65
      break
    else
    end
    if L5_28 == 6103 then
      L3_26 = 66
      break
    else
    end
    if L5_28 == 6105 then
      L3_26 = 67
      break
    else
    end
    if L5_28 == 6107 then
      L3_26 = 68
      break
    else
    end
    if L5_28 == 6004 then
      L3_26 = 69
      break
    else
    end
    if L5_28 == 6006 then
      L3_26 = 70
      break
    else
    end
    if L5_28 == 6008 then
      L3_26 = 71
      break
    else
    end
    if L5_28 == 6010 then
      L3_26 = 72
      break
    else
    end
    if L5_28 == 6012 then
      L3_26 = 73
      break
    else
    end
    if L5_28 == 6014 then
      L3_26 = 74
      break
    else
    end
    if L5_28 == 6016 then
      L3_26 = 75
      break
    else
    end
    if L5_28 == 6018 then
      L3_26 = 76
      break
    else
    end
    if L5_28 == 6104 then
      L3_26 = 77
      break
    else
    end
    if L5_28 == 6106 then
      L3_26 = 78
      break
    else
    end
    if L5_28 == 6108 then
      L3_26 = 79
      break
    else
    end
    return false
  else
    L5_28 = A2_25
    L4_27 = A2_25.isArmor
    L4_27 = L4_27(L5_28)
    if L4_27 then
      L5_28 = A2_25
      L4_27 = A2_25.getEquipmentEquipPoint
      L4_27 = L4_27(L5_28)
      L5_28 = L4_27
      if L5_28 == 9 then
        L3_26 = 42
        break
      elseif L5_28 == 11 then
      elseif L5_28 == 42 then
      else
      end
      if L5_28 == 43 then
        L3_26 = 43
        break
      else
      end
      if L5_28 == 14 then
        L3_26 = 44
        break
      elseif L5_28 == 13 then
      else
      end
      if L5_28 == 44 then
        L3_26 = 45
        break
      else
      end
      if L5_28 == 15 then
        L3_26 = 46
        break
      else
      end
      if L5_28 == 16 then
        L3_26 = 47
        break
      else
      end
      return false
    else
      L4_27 = false
      return L4_27
    end
  end
  L5_28 = A0_23
  L4_27 = A0_23.getMateriaTypeAndGrade
  L5_28 = L4_27(L5_28, A1_24)
  return (materiaSheet:_getData(L4_27, L3_26))
end
L0_0.isMateriaFitItemEquipPoint = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_29, A1_30)
  local L2_31, L3_32, L4_33
  if A1_30 == nil then
    L4_33 = A0_29.getMateriaType
    L4_33 = L4_33(A0_29)
    L2_31 = L4_33
    L4_33 = A0_29.getNormalItemParam1
    L4_33 = L4_33(A0_29)
    L3_32 = L4_33
  else
    L4_33 = A0_29.getNormalItemMateriaType
    L4_33 = L4_33(A0_29)
    L2_31 = L4_33[A1_30]
    L4_33 = A0_29.getNormalItemMateriaGrade
    L4_33 = L4_33(A0_29)
    L3_32 = L4_33[A1_30]
  end
  L4_33 = _math
  L4_33 = L4_33.floor
  L4_33 = L4_33(L3_32 / 4)
  return L2_31, L3_32, L4_33
end
L0_0.getMateriaTypeAndGrade = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_34)
  A0_34.normalItemWork._sync = {
    {"life", "integer32"},
    {"use", "integer16"},
    {"materiaId", "integer32"},
    {
      "materiaLife",
      "integer32"
    },
    {
      "mainQuality",
      "integer8"
    },
    {
      "subQuality",
      "array",
      3,
      "integer8"
    },
    {"polish", "integer32"},
    {"param1", "integer32"},
    {"param2", "integer32"},
    {"param3", "integer32"},
    {"fitness", "integer16"},
    {
      "materiaType",
      "array",
      5,
      "integer8"
    },
    {
      "materiaGrade",
      "array",
      5,
      "integer8"
    },
    {
      "_assignForChild",
      18
    }
  }
end
L0_0.init = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_35)
  local L1_36, L2_37
  L1_36 = A0_35.normalItemWork
  L1_36 = L1_36.mainQuality
  if L1_36 == 0 then
    L2_37 = 1
    return L2_37
  else
    return L1_36
  end
end
L0_0.getNormalItemMainQuality = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_38)
  local L1_39, L2_40, L3_41, L4_42
  L1_39 = A0_38.normalItemWork
  L1_39 = L1_39.subQuality
  L1_39 = L1_39[1]
  if L1_39 == 0 then
    L2_40 = 1
    L3_41 = 1
    L4_42 = 1
    return L2_40, L3_41, L4_42
  else
    L2_40 = A0_38.normalItemWork
    L2_40 = L2_40.subQuality
    L2_40 = L2_40[1]
    L3_41 = A0_38.normalItemWork
    L3_41 = L3_41.subQuality
    L3_41 = L3_41[2]
    L4_42 = A0_38.normalItemWork
    L4_42 = L4_42.subQuality
    L4_42 = L4_42[3]
    return L2_40, L3_41, L4_42
  end
end
L0_0.getNormalItemSubQuality = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_43, A1_44)
  local L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51
  if A1_44 == nil then
    L4_47 = A0_43
    L3_46 = A0_43._getCatalogID
    L3_46 = L3_46(L4_47)
    L2_45 = L3_46
  else
    L4_47 = A0_43
    L3_46 = A0_43.getMateriaTypeAndGrade
    L5_48 = A1_44
    L5_48 = L3_46(L4_47, L5_48)
    L6_49 = materiaSheet
    L7_50 = L6_49
    L6_49 = L6_49._getData
    L8_51 = L3_46
    L6_49 = L6_49(L7_50, L8_51, 0 + L5_48)
    L2_45 = L6_49
  end
  return L2_45
end
L0_0.getMateriaCatalogID = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59
  L3_55 = A0_52
  L2_54 = A0_52.getMateriaTypeAndGrade
  L4_56 = A1_53
  L3_55 = L2_54(L3_55, L4_56)
  L4_56 = materiaSheet
  L5_57 = L4_56
  L4_56 = L4_56._getData
  L6_58 = L2_54
  L7_59 = 4
  L4_56 = L4_56(L5_57, L6_58, L7_59)
  L5_57 = materiaSheet
  L6_58 = L5_57
  L5_57 = L5_57._getData
  L7_59 = L2_54
  L5_57 = L5_57(L6_58, L7_59, 5 + L3_55)
  L6_58 = materiaSheet
  L7_59 = L6_58
  L6_58 = L6_58._getData
  L6_58 = L6_58(L7_59, L2_54, 21)
  L7_59 = materiaSheet
  L7_59 = L7_59._getData
  L7_59 = L7_59(L7_59, L2_54, 22 + L3_55)
  return L4_56, L5_57, L6_58, L7_59
end
L0_0.getMateriaEfficiency = L1_1
L0_0 = NormalItemBaseClass
function L1_1(A0_60, A1_61)
  local L2_62, L3_63, L4_64, L5_65, L6_66
  L3_63 = A0_60
  L2_62 = A0_60.canEquipSimple
  L4_64 = A1_61
  L2_62 = L2_62(L3_63, L4_64)
  if not L2_62 then
    L2_62 = 0
    return L2_62
  end
  L3_63 = A0_60
  L2_62 = A0_60._getCatalogID
  L2_62 = L2_62(L3_63)
  L3_63 = itemDataSheet
  L4_64 = L3_63
  L3_63 = L3_63._getData
  L5_65 = L2_62
  L6_66 = 47
  L3_63 = L3_63(L4_64, L5_65, L6_66)
  L5_65 = A1_61
  L4_64 = A1_61.getStateMainSkillLevel
  L4_64 = L4_64(L5_65)
  L6_66 = A0_60
  L5_65 = A0_60.calculateLevelAdjust
  L5_65 = L5_65(L6_66, L4_64, L3_63)
  L6_66 = 1
  L6_66 = A0_60:getItemCompatibility(A1_61)
  if L6_66 < 1 then
    L6_66 = 0.6
  end
  if 1 - (2 - (L5_65 + L6_66)) <= 0.1 then
  else
  end
  if A0_60:getItemLifeMax() ~= 0 then
    if 0 >= A0_60:getNormalItemLife() then
    elseif 0.1 < A0_60:getNormalItemLife() / A0_60:getItemLifeMax() then
    elseif 0 < A0_60:getNormalItemLife() / A0_60:getItemLifeMax() then
    else
    end
  end
  return 1 * 1
end
L0_0.getDegradeRate = L1_1
