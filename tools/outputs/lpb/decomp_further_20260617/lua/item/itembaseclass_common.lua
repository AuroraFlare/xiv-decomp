local L0_0, L1_1
L0_0 = ItemBaseClass
function L1_1(A0_2, A1_3)
  return itemDataSheet:_getData(A0_2:_getCatalogID(), A1_3)
end
L0_0.getItemData = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_4)
  if A0_4:_getCatalogID() >= 1000000 and A0_4:_getCatalogID() <= 1999999 then
    return true
  else
    return false
  end
end
L0_0.isMoney = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_5)
  if A0_5:_getCatalogID() >= 2000001 and A0_5:_getCatalogID() <= 2002048 then
    return true
  else
    return false
  end
end
L0_0.isImportant = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_6)
  if A0_6:_getCatalogID() >= 3010000 and A0_6:_getCatalogID() <= 3019999 then
    return true
  else
    return false
  end
end
L0_0.isFood = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_7)
  if A0_7:_getCatalogID() >= 3010600 and A0_7:_getCatalogID() <= 3010699 then
    return true
  else
    return false
  end
end
L0_0.isDrink = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_8)
  if A0_8:_getCatalogID() >= 3020000 and A0_8:_getCatalogID() <= 3029999 then
    return true
  else
    return false
  end
end
L0_0.isPotion = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_9)
  local L1_10
  L1_10 = false
  return L1_10
end
L0_0.isFurniture = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_11)
  if A0_11:_getCatalogID() >= 3900000 and A0_11:_getCatalogID() <= 9999999 then
    return true
  else
    return false
  end
end
L0_0.isEquipment = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_12)
  if A0_12:_getCatalogID() >= 3900000 and A0_12:_getCatalogID() <= 7999999 then
    return true
  else
    return false
  end
end
L0_0.isWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_13)
  if A0_13:_getCatalogID() >= 3900000 and A0_13:_getCatalogID() <= 5999999 then
    if A0_13:isFishingBaitWeapon() == true then
      return false
    else
      return true
    end
    return true
  else
    return false
  end
end
L0_0.isBattleWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_14)
  if A0_14:_getCatalogID() >= 3900000 and A0_14:_getCatalogID() <= 4999999 then
    return true
  else
    return false
  end
end
L0_0.isAttackWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_15)
  if A0_15:_getCatalogID() >= 4020000 and A0_15:_getCatalogID() <= 4029999 then
    return true
  else
    return false
  end
end
L0_0.isNailWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_16)
  if A0_16:_getCatalogID() >= 4030000 and A0_16:_getCatalogID() <= 4039999 then
    return true
  else
    return false
  end
end
L0_0.isSwordWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_17)
  if A0_17:_getCatalogID() >= 4040000 and A0_17:_getCatalogID() <= 4049999 then
    return true
  else
    return false
  end
end
L0_0.isAxeWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_18)
  if A0_18:_getCatalogID() >= 4050000 and A0_18:_getCatalogID() <= 4059999 then
    return true
  else
    return false
  end
end
L0_0.isRapierWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_19)
  if A0_19:_getCatalogID() >= 4060000 and A0_19:_getCatalogID() <= 4069999 then
    return true
  else
    return false
  end
end
L0_0.isMaceWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_20)
  if A0_20:_getCatalogID() >= 4070000 and A0_20:_getCatalogID() <= 4079999 then
    return true
  else
    return false
  end
end
L0_0.isBowWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_21)
  if A0_21:_getCatalogID() >= 4080000 and A0_21:_getCatalogID() <= 4089999 then
    return true
  else
    return false
  end
end
L0_0.isLanceWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_22)
  if A0_22:_getCatalogID() >= 4090000 and A0_22:_getCatalogID() <= 4099999 then
    return true
  else
    return false
  end
end
L0_0.isGunWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_23)
  return A0_23:isBowWeapon() or A0_23:isGunWeapon() or A0_23:isThrowWeapon()
end
L0_0.isLongRangeWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_24)
  return A0_24:isBowWeapon() or A0_24:isGunWeapon()
end
L0_0.isShotWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_25)
  return A0_25:isThrowWeapon() or A0_25:isArrowWeapon() or A0_25:isBulletWeapon()
end
L0_0.isAmmoWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_26)
  if A0_26:_getCatalogID() >= 3910000 and A0_26:_getCatalogID() <= 3919999 then
    return true
  else
    return false
  end
end
L0_0.isThrowWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_27)
  if A0_27:_getCatalogID() >= 3920000 and A0_27:_getCatalogID() <= 3929999 then
    return true
  else
    return false
  end
end
L0_0.isArrowWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_28)
  if A0_28:_getCatalogID() >= 3930000 and A0_28:_getCatalogID() <= 3939999 then
    return true
  else
    return false
  end
end
L0_0.isBulletWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_29)
  if A0_29:_getCatalogID() >= 4100000 and A0_29:_getCatalogID() <= 4109999 then
    return true
  else
    return false
  end
end
L0_0.isShieldWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_30)
  if A0_30:isShieldWeapon() and A0_30:getShieldGuardTime() ~= -1 then
    return true
  else
    return false
  end
end
L0_0.isManualGuardShieldWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_31)
  if A0_31:_getCatalogID() >= 5000000 and A0_31:_getCatalogID() <= 5999999 then
    return true
  else
    return false
  end
end
L0_0.isMagicWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_32)
  if A0_32:_getCatalogID() >= 5010000 and A0_32:_getCatalogID() <= 5019999 then
    return true
  else
    return false
  end
end
L0_0.isMysticWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_33)
  if A0_33:_getCatalogID() >= 5020000 and A0_33:_getCatalogID() <= 5029999 then
    return true
  else
    return false
  end
end
L0_0.isThaumaturgeWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_34)
  if A0_34:_getCatalogID() >= 5030000 and A0_34:_getCatalogID() <= 5039999 then
    return true
  else
    return false
  end
end
L0_0.isConjurerWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_35)
  if A0_35:_getCatalogID() >= 5040000 and A0_35:_getCatalogID() <= 5049999 then
    return true
  else
    return false
  end
end
L0_0.isArchanistWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_36)
  if A0_36:_getCatalogID() >= 6000000 and A0_36:_getCatalogID() <= 6999999 then
    return true
  else
    return false
  end
end
L0_0.isCraftWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_37)
  if A0_37:_getCatalogID() >= 6010000 and A0_37:_getCatalogID() <= 6019999 then
    return true
  else
    return false
  end
end
L0_0.isCarpenterWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_38)
  if A0_38:_getCatalogID() >= 6020000 and A0_38:_getCatalogID() <= 6029999 then
    return true
  else
    return false
  end
end
L0_0.isBlackSmithWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_39)
  if A0_39:_getCatalogID() >= 6030000 and A0_39:_getCatalogID() <= 6039999 then
    return true
  else
    return false
  end
end
L0_0.isArmorerWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_40)
  if A0_40:_getCatalogID() >= 6040000 and A0_40:_getCatalogID() <= 6049999 then
    return true
  else
    return false
  end
end
L0_0.isGoldSmithWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_41)
  if A0_41:_getCatalogID() >= 6050000 and A0_41:_getCatalogID() <= 6059999 then
    return true
  else
    return false
  end
end
L0_0.isTannerWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_42)
  if A0_42:_getCatalogID() >= 6060000 and A0_42:_getCatalogID() <= 6069999 then
    return true
  else
    return false
  end
end
L0_0.isWeaverWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_43)
  if A0_43:_getCatalogID() >= 6070000 and A0_43:_getCatalogID() <= 6079999 then
    return true
  else
    return false
  end
end
L0_0.isArchemistWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_44)
  if A0_44:_getCatalogID() >= 6080000 and A0_44:_getCatalogID() <= 6089999 then
    return true
  else
    return false
  end
end
L0_0.isCulinarianWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_45)
  if A0_45:_getCatalogID() >= 7000000 and A0_45:_getCatalogID() <= 7999999 then
    return true
  else
    return false
  end
end
L0_0.isHarvestWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_46)
  if A0_46:_getCatalogID() >= 7010000 and A0_46:_getCatalogID() <= 7019999 then
    return true
  else
    return false
  end
end
L0_0.isMinerWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_47)
  if A0_47:_getCatalogID() >= 7020000 and A0_47:_getCatalogID() <= 7029999 then
    return true
  else
    return false
  end
end
L0_0.isBotanistWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_48)
  if A0_48:_getCatalogID() >= 7030000 and A0_48:_getCatalogID() <= 7039999 then
    return true
  else
    return false
  end
end
L0_0.isFishingWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_49)
  if A0_49:_getCatalogID() >= 7040000 and A0_49:_getCatalogID() <= 7049999 then
    return true
  else
    return false
  end
end
L0_0.isShepherdWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_50)
  if A0_50:_getCatalogID() >= 3940000 and A0_50:_getCatalogID() <= 3949999 then
    return true
  else
    return false
  end
end
L0_0.isFishingBaitWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_51)
  if A0_51:_getCatalogID() >= 3940100 and A0_51:_getCatalogID() <= 3940199 then
    return true
  else
    return false
  end
end
L0_0.isFishingLureWeapon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_52)
  if A0_52:_getCatalogID() >= 8000000 and A0_52:_getCatalogID() <= 8999999 then
    return true
  else
    return false
  end
end
L0_0.isArmor = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_53)
  if A0_53:_getCatalogID() >= 9000000 and A0_53:_getCatalogID() <= 9079999 then
    return true
  else
    return false
  end
end
L0_0.isAccessory = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_54)
  if A0_54:_getCatalogID() >= 9080000 and A0_54:_getCatalogID() <= 9089999 then
    return true
  else
    return false
  end
end
L0_0.isAmulet = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_55)
  if A0_55:_getCatalogID() >= 10100000 and A0_55:_getCatalogID() <= 10199999 then
    return true
  else
    return false
  end
end
L0_0.isEnchantMateria = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_56)
  if A0_56:isEnchantMateria() then
    return false
  elseif A0_56:_getCatalogID() >= 10000000 and A0_56:_getCatalogID() <= 10999999 then
    return true
  else
    return false
  end
end
L0_0.isMaterial = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_57)
  if A0_57:_getCatalogID() >= 11000000 and A0_57:_getCatalogID() <= 15000000 then
    return true
  else
    return false
  end
end
L0_0.isEventItem = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_58)
  local L1_59
  L1_59 = false
  return L1_59
end
L0_0.isUseForBattle = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_60)
  local L1_61
  L1_61 = true
  return L1_61
end
L0_0.isHostilityItem = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_62)
  if A0_62:getItemData(43) ~= 0 then
    return true
  else
    return false
  end
end
L0_0.isUsable = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_63)
  return A0_63:getItemData(43) == -1
end
L0_0.isUseFree = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_64)
  return not A0_64:isEquipment()
end
L0_0.isLostAfterUsed = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_65)
  local L1_66
  L1_66 = 3
  return L1_66
end
L0_0.getObjectClassId = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_67)
  local L1_68
  L1_68 = 0
  return L1_68
end
L0_0.getItemCanUseStatCategory = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_69)
  local L1_70, L2_71
  L2_71 = A0_69
  L1_70 = A0_69.getItemData
  L1_70 = L1_70(L2_71, 44)
  L2_71 = A0_69.getItemData
  L2_71 = L2_71(A0_69, 45)
  if L1_70 == -1 then
    L1_70 = 0
  end
  if L2_71 == -1 then
    L2_71 = 0
  end
  return L1_70, L2_71
end
L0_0.getItemMainSkill = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_72)
  return A0_72:getItemData(47)
end
L0_0.getItemLevel = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_73)
  if A0_73:isEquipment() then
    return A0_73:getItemData(46)
  else
    return 0
  end
end
L0_0.getItemLevelType = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_74)
  return A0_74:getItemData(48)
end
L0_0.getItemCompatibilityKey = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_75, A1_76)
  return compatibilitySheet:_getData(A0_75:getItemCompatibilityKey(), 8 + (A1_76 - 1)) / 100
end
L0_0.getItemCompatibilityData = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_77)
  if A0_77:isMoney() == true then
    return 100
  elseif A0_77:isImportant() == true then
    return 101
  elseif A0_77:isEventItem() == true then
    return nil
  else
    return 1
  end
end
L0_0.getItemProperPackage = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_78, A1_79)
  local L2_80, L3_81
  L3_81 = A0_78
  L2_80 = A0_78.getItemCompatibilityData
  return L2_80(L3_81, A1_79:getMainClassOrJob())
end
L0_0.getItemCompatibility = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_82, A1_83)
  return A0_82:getItemCompatibilityData(A1_83)
end
L0_0.getItemCompatibilityBySkill = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_84)
  return A0_84:getItemData(43)
end
L0_0.getItemUseMax = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_85)
  if A0_85:isEquipment() then
    return itemDataSheet:_getData(A0_85:_getCatalogID(), 64)
  else
    return 0
  end
end
L0_0.getItemRepairSkill = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_86)
  if A0_86:isEquipment() then
    return itemDataSheet:_getData(A0_86:_getCatalogID(), 67)
  else
    return 0
  end
end
L0_0.getItemRepairLevel = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_87)
  if A0_87:isEquipment() or A0_87:isEnchantMateria() then
    return itemDataSheet:_getData(A0_87:_getCatalogID(), 65)
  else
    return 0
  end
end
L0_0.getItemRepairItem = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_88)
  if A0_88:isEquipment() or A0_88:isEnchantMateria() then
    return itemDataSheet:_getData(A0_88:_getCatalogID(), 66)
  else
    return 0
  end
end
L0_0.getItemRepairItemNum = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_89)
  local L1_90
  L1_90 = 0
  return L1_90
end
L0_0.getItemRepairCrystal = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_91)
  if A0_91:isEquipment() then
    return itemDataSheet:_getData(A0_91:_getCatalogID(), 68)
  else
    return 0
  end
end
L0_0.getItemRepairLicence = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_92)
  local L1_93
  L1_93 = 1
  return L1_93
end
L0_0.getItemLifeForm = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_94)
  return A0_94:getItemData(33)
end
L0_0.getItemLifeMax = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_95, A1_96, A2_97, A3_98)
  if A1_96 ~= 0 then
  end
  return A0_95:getItemCompatibility(A2_97) - (1 - A0_95:getItemCompatibility(A2_97)) * A1_96
end
L0_0.getItemCompatibilityWithAdjust = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_99)
  local L1_100, L2_101
  L1_100 = -1
  L2_101 = 15
  return L1_100, L2_101
end
L0_0.getItemLevelAdjustLevelMax = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_102, A1_103, A2_104, A3_105, A4_106, A5_107, A6_108, A7_109)
  local L8_110, L9_111, L10_112, L11_113
  if A2_104 ~= nil then
    L9_111 = A0_102
    L8_110 = A0_102.getItemLevel
    L8_110 = L8_110(L9_111)
    L10_112 = A5_107
    L9_111 = A5_107.getMainSkillLevel
    L9_111 = L9_111(L10_112)
    L11_113 = A0_102
    L10_112 = A0_102.getItemLevelAdjustLevelMax
    L11_113 = L10_112(L11_113)
    if L8_110 > L9_111 then
      if L10_112 ~= -1 then
        L9_111 = L8_110 - _math.min(L10_112, L8_110 - L9_111)
      else
      end
    else
      if L8_110 < L9_111 and L11_113 ~= -1 then
        L9_111 = L8_110 + _math.min(L11_113, L9_111 - L8_110)
      else
      end
    end
    if L8_110 > L9_111 then
      A1_103 = A1_103 - (A1_103 - A5_107:getGrowData(L9_111, A2_104) * (A1_103 / A5_107:getGrowData(L8_110, A2_104))) * A3_105
    elseif L8_110 < L9_111 then
      A1_103 = A1_103 + (A5_107:getGrowData(L9_111, A2_104) * (A1_103 / A5_107:getGrowData(L8_110, A2_104)) - A1_103) * A4_106
    end
  end
  return A1_103
end
L0_0.getItemLevelAdjust = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_114, A1_115, A2_116, A3_117)
  local L4_118
  L4_118 = 0.7
  return L4_118
end
L0_0.getItemParam1AdjustForHighLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_119, A1_120, A2_121, A3_122)
  local L4_123
  L4_123 = 0.7
  return L4_123
end
L0_0.getItemParam2AdjustForHighLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_124, A1_125, A2_126, A3_127)
  local L4_128
  L4_128 = 0.7
  return L4_128
end
L0_0.getItemParam3AdjustForHighLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_129, A1_130, A2_131, A3_132)
  local L4_133
  L4_133 = 0.7
  return L4_133
end
L0_0.getItemParam4AdjustForHighLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_134, A1_135, A2_136, A3_137)
  local L4_138
  L4_138 = 1
  return L4_138
end
L0_0.getItemParam1AdjustForLowLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_139, A1_140, A2_141, A3_142)
  local L4_143
  L4_143 = 1
  return L4_143
end
L0_0.getItemParam2AdjustForLowLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_144, A1_145, A2_146, A3_147)
  local L4_148
  L4_148 = 1
  return L4_148
end
L0_0.getItemParam3AdjustForLowLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_149, A1_150, A2_151, A3_152)
  local L4_153
  L4_153 = 1
  return L4_153
end
L0_0.getItemParam4AdjustForLowLevelUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_154, A1_155, A2_156, A3_157)
  local L4_158
  L4_158 = A0_154.getItemData
  L4_158 = L4_158(A0_154, 49)
  if L4_158 < 0 then
    L4_158 = nil
  else
    L4_158 = A1_155:judgeGrowColumn(A3_157, L4_158)
  end
  return L4_158
end
L0_0.getItemParam1LevelAdjustGrow = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_159, A1_160, A2_161, A3_162)
  local L4_163
  L4_163 = A0_159.getItemData
  L4_163 = L4_163(A0_159, 52)
  if L4_163 < 0 then
    L4_163 = nil
  else
    L4_163 = A1_160:judgeGrowColumn(A3_162, L4_163)
  end
  return L4_163
end
L0_0.getItemParam2LevelAdjustGrow = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_164, A1_165, A2_166, A3_167)
  local L4_168
  L4_168 = A0_164.getItemData
  L4_168 = L4_168(A0_164, 55)
  if L4_168 < 0 then
    L4_168 = nil
  else
    L4_168 = A1_165:judgeGrowColumn(A3_167, L4_168)
  end
  return L4_168
end
L0_0.getItemParam3LevelAdjustGrow = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_169, A1_170, A2_171, A3_172)
  local L4_173
  L4_173 = A0_169.getItemData
  L4_173 = L4_173(A0_169, 58)
  if L4_173 < 0 then
    L4_173 = nil
  else
    L4_173 = A1_170:judgeGrowColumn(A3_172, L4_173)
  end
  return L4_173
end
L0_0.getItemParam4LevelAdjustGrow = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_174, A1_175, A2_176, A3_177, A4_178)
  local L5_179, L6_180, L7_181
  L7_181 = A0_174.getItemData
  L7_181 = L7_181(A0_174, 50)
  if A1_175 ~= nil then
    L5_179 = A0_174:getItemCompatibilityWithAdjust(A0_174:getItemData(51), A1_175, A2_176)
    L7_181 = A0_174:getItemLevelAdjust(L7_181, A0_174:getItemParam1LevelAdjustGrow(A1_175, A2_176, A3_177), A0_174:getItemParam1AdjustForLowLevelUse(A1_175, A2_176, A3_177), A0_174:getItemParam1AdjustForHighLevelUse(A1_175, A2_176, A3_177), A1_175, A2_176, A3_177)
  else
    L5_179 = 1
    L6_180 = 1
  end
  return L7_181 * L5_179
end
L0_0.getItemParam1 = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_182, A1_183, A2_184, A3_185, A4_186)
  local L5_187, L6_188, L7_189
  L7_189 = A0_182.getItemData
  L7_189 = L7_189(A0_182, 53)
  if A1_183 ~= nil then
    L5_187 = A0_182:getItemCompatibilityWithAdjust(A0_182:getItemData(54), A1_183, A2_184)
    L7_189 = A0_182:getItemLevelAdjust(L7_189, A0_182:getItemParam2LevelAdjustGrow(A1_183, A2_184, A3_185), A0_182:getItemParam2AdjustForLowLevelUse(A1_183, A2_184, A3_185), A0_182:getItemParam2AdjustForHighLevelUse(A1_183, A2_184, A3_185), A1_183, A2_184, A3_185)
  else
    L5_187 = 1
    L6_188 = 1
  end
  return L7_189 * L5_187
end
L0_0.getItemParam2 = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_190, A1_191, A2_192, A3_193, A4_194)
  local L5_195, L6_196, L7_197
  L7_197 = A0_190.getItemData
  L7_197 = L7_197(A0_190, 56)
  if A1_191 ~= nil then
    L5_195 = A0_190:getItemCompatibilityWithAdjust(A0_190:getItemData(57), A1_191, A2_192)
    L7_197 = A0_190:getItemLevelAdjust(L7_197, A0_190:getItemParam3LevelAdjustGrow(A1_191, A2_192, A3_193), A0_190:getItemParam3AdjustForLowLevelUse(A1_191, A2_192, A3_193), A0_190:getItemParam3AdjustForHighLevelUse(A1_191, A2_192, A3_193), A1_191, A2_192, A3_193)
  else
    L5_195 = 1
    L6_196 = 1
  end
  return L7_197 * L5_195
end
L0_0.getItemParam3 = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_198, A1_199, A2_200, A3_201, A4_202)
  local L5_203, L6_204, L7_205
  L7_205 = A0_198.getItemData
  L7_205 = L7_205(A0_198, 59)
  if A1_199 ~= nil then
    L5_203 = A0_198:getItemCompatibilityWithAdjust(A0_198:getItemData(60), A1_199, A2_200)
    L7_205 = A0_198:getItemLevelAdjust(L7_205, A0_198:getItemParam4LevelAdjustGrow(A1_199, A2_200, A3_201), A0_198:getItemParam4AdjustForLowLevelUse(A1_199, A2_200, A3_201), A0_198:getItemParam4AdjustForHighLevelUse(A1_199, A2_200, A3_201), A1_199, A2_200, A3_201)
  else
    L5_203 = 1
    L6_204 = 1
  end
  return L7_205 * L5_203
end
L0_0.getItemParam4 = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_206)
  local L1_207, L2_208, L3_209, L4_210
  L1_207 = {}
  L2_208 = {}
  L3_209 = {}
  L4_210 = A0_206._getCatalogID
  L4_210 = L4_210(A0_206)
  for _FORV_9_ = 1, 3 do
    if equipmentSheet:_getData(L4_210, 79 + (_FORV_9_ - 1) * 2) ~= -1 then
      L1_207[0 + 1] = equipmentSheet:_getData(L4_210, 79 + (_FORV_9_ - 1) * 2)
      L2_208[0 + 1] = equipmentSheet:_getData(L4_210, 80 + (_FORV_9_ - 1) * 2)
      L3_209[0 + 1] = equipmentSheet:_getData(L4_210, 86 + (_FORV_9_ - 1) * 2)
      if 1 < A0_206:getMainQuality() then
        if 0 < L2_208[0 + 1] then
          L2_208[0 + 1] = _math.ceil(L2_208[0 + 1] * (1 + equipmentSheet:_getData(L4_210, 78) / 100) - 1.0E-4)
        elseif 0 > L2_208[0 + 1] then
          L2_208[0 + 1] = _math.floor(L2_208[0 + 1] * (1 + equipmentSheet:_getData(L4_210, 78) / 100) + 1.0E-4)
        end
        if 0 < L3_209[0 + 1] then
          L3_209[0 + 1] = _math.ceil(L3_209[0 + 1] * (1 + equipmentSheet:_getData(L4_210, 78) / 100) - 1.0E-4)
        elseif 0 > L3_209[0 + 1] then
          L3_209[0 + 1] = _math.floor(L3_209[0 + 1] * (1 + equipmentSheet:_getData(L4_210, 78) / 100) + 1.0E-4)
        end
      end
    end
  end
  if _FOR_:_getData(L4_210, 75) ~= -1 then
    L1_207[0 + 1 + 1] = _FOR_:_getData(L4_210, 75)
    L2_208[0 + 1 + 1] = equipmentSheet:_getData(L4_210, 76)
    L3_209[0 + 1 + 1] = 0
  end
  return L1_207, L2_208, L3_209
end
L0_0.getItemConsumptionBonus = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_211)
  local L1_212, L2_213
  L2_213 = A0_211
  L1_212 = A0_211.getItemData
  L1_212 = L1_212(L2_213, 59)
  L2_213 = A0_211._getCatalogID
  L2_213 = L2_213(A0_211)
  if L1_212 > 0 then
    if A0_211:getMainQuality() > 1 then
      L1_212 = _math.ceil(L1_212 * (1 + equipmentSheet:_getData(L2_213, 78) / 100) - 1.0E-4)
    end
  else
    L1_212 = 0
  end
  return L1_212
end
L0_0.getItemEffectTime = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_214)
  return A0_214:getItemData(61)
end
L0_0.getItemRecastTime = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_215)
  return A0_215:getItemData(63)
end
L0_0.getItemRecastGroup = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_216, A1_217)
  return equipmentSheet:_getData(A0_216:_getCatalogID(), A1_217)
end
L0_0.getEquipmentData = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_218, A1_219)
  for _FORV_7_ = 1, #A0_218:processGetEquipmentEquipParameter() do
    if A0_218:processGetEquipmentEquipParameter()[_FORV_7_] == A1_219 then
      return A0_218:processGetEquipmentEquipParameter()[_FORV_7_]
    end
  end
  return _FOR_
end
L0_0.getEquipmentEquipParameter = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_220)
  local L1_221, L2_222, L3_223, L4_224
  L1_221 = {}
  L2_222 = {}
  L3_223 = L1_221
  L4_224 = L2_222
  return L3_223, L4_224
end
L0_0.processGetEquipmentEquipParameter = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_225)
  local L1_226, L2_227, L3_228, L4_229, L5_230
  L2_227 = A0_225
  L1_226 = A0_225._getCatalogID
  L1_226 = L1_226(L2_227)
  L2_227 = equipmentSheet
  L3_228 = L2_227
  L2_227 = L2_227._getData
  L4_229 = L1_226
  L5_230 = 71
  L2_227 = L2_227(L3_228, L4_229, L5_230)
  L3_228 = equipmentSheet
  L4_229 = L3_228
  L3_228 = L3_228._getData
  L5_230 = L1_226
  L3_228 = L3_228(L4_229, L5_230, 72)
  L4_229 = equipmentSheet
  L5_230 = L4_229
  L4_229 = L4_229._getData
  L4_229 = L4_229(L5_230, L1_226, 73)
  L5_230 = equipmentSheet
  L5_230 = L5_230._getData
  L5_230 = L5_230(L5_230, L1_226, 74)
  return L2_227, L3_228, L4_229, L5_230
end
L0_0.processGetConditionParameterBonus = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_231, A1_232)
  if A0_231:isEquipment() then
    for _FORV_7_ = 1, #A0_231:processGetEquipmentParameterBonus() do
      if A0_231:processGetEquipmentParameterBonus()[_FORV_7_] == A1_232 then
        return A0_231:processGetEquipmentParameterBonus()[_FORV_7_]
      end
    end
  end
  return 0
end
L0_0.getEquipmentParameterBonus = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_233)
  local L1_234, L2_235, L3_236
  L1_234 = {}
  L2_235 = {}
  L3_236 = A0_233._getCatalogID
  L3_236 = L3_236(A0_233)
  for _FORV_8_ = 1, 1 do
    if equipmentSheet:_getData(L3_236, 75 + (_FORV_8_ - 1) * 2) ~= -1 then
      L1_234[0 + 1] = equipmentSheet:_getData(L3_236, 75 + (_FORV_8_ - 1) * 2)
      L2_235[0 + 1] = equipmentSheet:_getData(L3_236, 76 + (_FORV_8_ - 1) * 2)
    end
  end
  return L1_234, L2_235
end
L0_0.processGetEquipmentAppendParameter = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_237)
  local L1_238, L2_239, L3_240, L4_241
  L1_238 = {}
  L2_239 = {}
  L4_241 = A0_237
  L3_240 = A0_237.isEquipment
  L3_240 = L3_240(L4_241)
  if L3_240 then
    L4_241 = A0_237
    L3_240 = A0_237._getCatalogID
    L3_240 = L3_240(L4_241)
    L4_241 = 0
    L1_238, L2_239 = A0_237:processGetEquipmentAppendParameter()
    L4_241 = #L1_238
    if A0_237:getMainQuality() > 1 then
      L4_241 = L4_241 + 1
      L1_238[L4_241] = equipmentSheet:_getData(L3_240, 77)
      L2_239[L4_241] = equipmentSheet:_getData(L3_240, 78)
    end
    for _FORV_8_ = 1, 6 do
      if equipmentSheet:_getData(L3_240, 79 + (_FORV_8_ - 1) * 2) ~= -1 then
        if L4_241 > 0 then
          for _FORV_15_ = 1, L4_241 do
            if false == false and L1_238[_FORV_15_] == equipmentSheet:_getData(L3_240, 79 + (_FORV_8_ - 1) * 2) then
              L2_239[_FORV_15_] = L2_239[_FORV_15_] + equipmentSheet:_getData(L3_240, 80 + (_FORV_8_ - 1) * 2)
            end
          end
        end
        if true == false then
          L2_239[L4_241], L1_238[L4_241], L4_241 = equipmentSheet:_getData(L3_240, 80 + (_FORV_8_ - 1) * 2), equipmentSheet:_getData(L3_240, 79 + (_FORV_8_ - 1) * 2), L4_241 + 1
        end
      end
    end
  end
  L3_240 = L1_238
  L4_241 = L2_239
  return L3_240, L4_241
end
L0_0.processGetEquipmentParameterBonus = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_242)
  if A0_242:isEquipment() then
    return equipmentSheet:_getData(A0_242:_getCatalogID(), 137)
  else
    return 0
  end
end
L0_0.getAdditionalEffect = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_243)
  return equipmentSheet:_getData(A0_243:_getCatalogID(), 69)
end
L0_0.getEquipmentEquipPoint = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_244)
  return equipmentSheet:_getData(A0_244:_getCatalogID(), 70)
end
L0_0.getEquipmentEquipTribe = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_245, A1_246)
  if A0_245:isEquipment() then
    for _FORV_7_ = 1, #A0_245:getEquipmentEquipPointDetail() do
      if A1_246 == A0_245:getEquipmentEquipPointDetail()[_FORV_7_] then
        return true
      end
    end
  end
  return false
end
L0_0.isFitForEquipPoint = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_247)
  return A0_247:getEquipmentEquipPoint() <= 27
end
L0_0.isEquipmentEquipPointSimple = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_248)
  local L1_249, L2_250, L3_251
  L1_249 = {}
  L2_250 = {}
  L3_251 = A0_248.getEquipmentEquipPoint
  L3_251 = L3_251(A0_248)
  if L3_251 <= 27 then
    L1_249[1] = L3_251
    return L1_249, nil
  elseif L3_251 <= 40 then
    if L3_251 == 37 then
      L1_249[1] = 1
      L2_250[1] = 1
      L2_250[2] = 2
      return L1_249, L2_250
    else
    end
    if L3_251 == 38 then
      L1_249[1] = 1
      L2_250[1] = 1
      L2_250[2] = 2
      return L1_249, L2_250
    else
    end
    if L3_251 == 39 then
      L1_249[1] = 1
      L2_250[1] = 1
      L2_250[2] = 3
      return L1_249, L2_250
    else
    end
    if L3_251 == 40 then
      L1_249[1] = 2
      L2_250[1] = 2
      L2_250[2] = 4
      return L1_249, L2_250
    else
    end
    if L3_251 == 35 then
      L1_249[1] = 6
      L2_250[1] = 6
      L2_250[2] = 7
      return L1_249, L2_250
    else
    end
    if L3_251 == 34 then
      L1_249[1] = 6
      L1_249[2] = 7
      return L1_249, nil
    else
    end
    if L3_251 == 36 then
      L1_249[1] = 1
      L1_249[2] = 2
      return L1_249, nil
    else
    end
  elseif L3_251 <= 44 then
    if L3_251 == 41 then
      L1_249[1] = 11
      L2_250[1] = 9
      L2_250[2] = 11
      L2_250[3] = 13
      L2_250[4] = 14
      L2_250[5] = 15
      L2_250[6] = 16
      return L1_249, L2_250
    else
    end
    if L3_251 == 42 then
      L1_249[1] = 11
      L2_250[1] = 9
      L2_250[2] = 11
      return L1_249, L2_250
    else
    end
    if L3_251 == 43 then
      L1_249[1] = 11
      L2_250[1] = 11
      L2_250[2] = 13
      L2_250[3] = 14
      L2_250[4] = 15
      return L1_249, L2_250
    else
    end
    if L3_251 == 44 then
      L1_249[1] = 13
      L2_250[1] = 13
      L2_250[2] = 15
      return L1_249, L2_250
    else
    end
  elseif L3_251 <= 51 then
    if L3_251 == 46 then
      L1_249[1] = 20
      L2_250[1] = 20
      L2_250[2] = 21
      return L1_249, L2_250
    else
    end
    if L3_251 == 48 then
      L1_249[1] = 18
      L2_250[1] = 18
      L2_250[2] = 19
      return L1_249, L2_250
    else
    end
    if L3_251 == 50 then
      L1_249[1] = 22
      L2_250[1] = 22
      L2_250[2] = 23
      return L1_249, L2_250
    else
    end
    if L3_251 == 52 then
      L1_249[1] = 24
      L2_250[1] = 24
      L2_250[2] = 25
      return L1_249, L2_250
    else
    end
    if L3_251 == 45 then
      L1_249[1] = 20
      L1_249[2] = 21
      return L1_249, nil
    else
    end
    if L3_251 == 47 then
      L1_249[1] = 18
      L1_249[2] = 19
      return L1_249, nil
    else
    end
    if L3_251 == 49 then
      L1_249[1] = 22
      L1_249[2] = 23
      L1_249[3] = 24
      L1_249[4] = 25
      return L1_249, nil
    else
    end
    if L3_251 == 51 then
      L1_249[1] = 24
      L1_249[2] = 25
      return L1_249, nil
    else
    end
  elseif L3_251 <= 53 then
    if L3_251 == 53 then
      for _FORV_9_ = 26, 27 do
        L1_249[1] = _FORV_9_
      end
      return L1_249, nil
    else
    end
  else
    if L3_251 == 54 then
      for _FORV_9_ = 1, 27 do
        L1_249[1] = _FORV_9_
      end
      return L1_249, nil
    else
    end
  end
end
L0_0.getEquipmentEquipPointDetail = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_252, A1_253)
  if A0_252:getEquipmentEquipTribe() == 0 then
    return false
  elseif A0_252:getEquipmentEquipTribe() >= 1 and A0_252:getEquipmentEquipTribe() <= 15 then
    if A0_252:getEquipmentEquipTribe() ~= A1_253:getTribe() then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 16 then
    if A1_253:getTribe() ~= 1 and A1_253:getTribe() ~= 3 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 17 then
    if A1_253:getTribe() ~= 2 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 18 then
    if A1_253:getTribe() ~= 4 and A1_253:getTribe() ~= 6 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 19 then
    if A1_253:getTribe() ~= 5 and A1_253:getTribe() ~= 7 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 20 then
    if A1_253:getTribe() ~= 8 and A1_253:getTribe() ~= 10 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 21 then
    if A1_253:getTribe() ~= 9 and A1_253:getTribe() ~= 11 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 22 then
    if A1_253:getTribe() ~= 14 and A1_253:getTribe() ~= 15 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 23 then
    if A1_253:getTribe() ~= 12 and A1_253:getTribe() ~= 13 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 24 then
    if A1_253:getTribe() ~= 1 and A1_253:getTribe() ~= 3 and A1_253:getTribe() ~= 2 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 25 then
    if A1_253:getTribe() ~= 4 and A1_253:getTribe() ~= 6 and A1_253:getTribe() ~= 5 and A1_253:getTribe() ~= 7 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 26 then
    if A1_253:getTribe() ~= 8 and A1_253:getTribe() ~= 10 and A1_253:getTribe() ~= 9 and A1_253:getTribe() ~= 11 then
      return false
    end
  elseif A0_252:getEquipmentEquipTribe() == 27 then
    if A1_253:getTribe() ~= 1 and A1_253:getTribe() ~= 3 and A1_253:getTribe() ~= 4 and A1_253:getTribe() ~= 6 and A1_253:getTribe() ~= 8 and A1_253:getTribe() ~= 10 and A1_253:getTribe() ~= 14 and A1_253:getTribe() ~= 15 then
      return false
    end
  else
    if A0_252:getEquipmentEquipTribe() == 28 and A1_253:getTribe() ~= 2 and A1_253:getTribe() ~= 5 and A1_253:getTribe() ~= 7 and A1_253:getTribe() ~= 9 and A1_253:getTribe() ~= 11 and A1_253:getTribe() ~= 12 and A1_253:getTribe() ~= 13 then
      return false
    else
    end
  end
  return true
end
L0_0.isConformTribe = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_254)
  local L1_255
  L1_255 = 2000002
  return L1_255
end
L0_0.getEquipmentAttachedMateria = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_256)
  local L1_257
  L1_257 = 100
  return L1_257
end
L0_0.getEquipmentAttachedMateriaLife = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_258)
  local L1_259
  L1_259 = 5000
  return L1_259
end
L0_0.getEquipmentEmbezzlement = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_260, A1_261)
  return weaponSheet:_getData(A0_260:_getCatalogID(), A1_261)
end
L0_0.getWeaponData = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_262)
  return weaponSheet:_getData(A0_262:_getCatalogID(), 92)
end
L0_0.getWeaponAttack = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_263)
  return weaponSheet:_getData(A0_263:_getCatalogID(), 99)
end
L0_0.getWeaponRate = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_264)
  return weaponSheet:_getData(A0_264:_getCatalogID(), 93)
end
L0_0.getWeaponMagicAttack = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_265)
  return weaponSheet:_getData(A0_265:_getCatalogID(), 100)
end
L0_0.getWeaponMagicRate = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_266)
  return A0_266:getItemHQValue(weaponSheet:_getData(A0_266:_getCatalogID(), 94), 1.03)
end
L0_0.getWeaponCraftProcessing = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_267)
  return A0_267:getItemHQValue(weaponSheet:_getData(A0_267:_getCatalogID(), 95), 1.03)
end
L0_0.getWeaponCraftMagicProcessing = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_268)
  return A0_268:getItemHQValue(weaponSheet:_getData(A0_268:_getCatalogID(), 101), 1.03)
end
L0_0.getWeaponCraftProcessControl = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_269)
  return A0_269:getItemHQValue(weaponSheet:_getData(A0_269:_getCatalogID(), 96), 1.03)
end
L0_0.getWeaponHarvestPotency = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_270)
  return A0_270:getItemHQValue(weaponSheet:_getData(A0_270:_getCatalogID(), 97), 1.03)
end
L0_0.getWeaponHarvestLimit = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_271)
  return A0_271:getItemHQValue(weaponSheet:_getData(A0_271:_getCatalogID(), 102), 1.03)
end
L0_0.getWeaponHarvestRate = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_272)
  return weaponSheet:_getData(A0_272:_getCatalogID(), 103)
end
L0_0.getWeaponCritical = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_273)
  return weaponSheet:_getData(A0_273:_getCatalogID(), 104)
end
L0_0.getWeaponMagicCritical = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_274)
  return _math.ceil(weaponSheet:_getData(A0_274:_getCatalogID(), 105))
end
L0_0.getWeaponParry = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_275)
  return weaponSheet:_getData(A0_275:_getCatalogID(), 98)
end
L0_0.getWeaponFrequency = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_276)
  local L1_277
  L1_277 = 15
  return L1_277
end
L0_0.getWeaponActionGaugeTime = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_278)
  local L1_279
  L1_279 = 1
  return L1_279
end
L0_0.getWeaponPowerGaugeLength = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_280)
  if A0_280:isNailWeapon() then
    return true
  elseif A0_280:isSwordWeapon() then
    return true
  elseif A0_280:isAxeWeapon() then
    return false
  elseif A0_280:isRapierWeapon() then
    return false
  elseif A0_280:isMaceWeapon() then
    return false
  elseif A0_280:isBowWeapon() then
    return true
  elseif A0_280:isLanceWeapon() then
    return true
  elseif A0_280:isGunWeapon() then
    return false
  elseif A0_280:isShieldWeapon() then
    return true
  elseif A0_280:isMysticWeapon() then
    return true
  elseif A0_280:isThaumaturgeWeapon() then
    return false
  elseif A0_280:isConjurerWeapon() then
    return true
  elseif A0_280:isArchanistWeapon() then
    return false
  else
    return false
  end
end
L0_0.getWeaponPendulum = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_281)
  if A0_281:isMysticWeapon() or A0_281:isConjurerWeapon() then
    return 1
  else
    return 2
  end
end
L0_0.getWeaponRangeShape = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_282)
  if A0_282:isThaumaturgeWeapon() then
    return 2
  else
    return 1
  end
end
L0_0.getWeaponRangeTargettingMode = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_283)
  local L1_284
  L1_284 = {
    A0_283:getWeaponData(106),
    A0_283:getWeaponData(108),
    A0_283:getWeaponData(110)
  }
  return L1_284, {
    A0_283:getWeaponData(107),
    A0_283:getWeaponData(109),
    A0_283:getWeaponData(111)
  }
end
L0_0.getWeaponDamageAttribute = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_285)
  if A0_285:isWeapon() then
    return A0_285:getItemHQValue(weaponSheet:_getData(A0_285:_getCatalogID(), 135), 1.05)
  else
    return 0
  end
end
L0_0.getWeaponDamagePower = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_286)
  if A0_286:isWeapon() then
    return A0_286:getWeaponData(136) + 0.05
  else
    return 0
  end
end
L0_0.getWeaponInterval = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_287)
  if A0_287:isShieldWeapon() then
    return A0_287:getItemHQValue(A0_287:getItemData(50), 1.03)
  else
    return 0
  end
end
L0_0.getShieldDefence = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_288)
  if A0_288:isShieldWeapon() then
    return A0_288:getItemData(56)
  else
    return 0
  end
end
L0_0.getShieldGuardTime = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_289)
  if A0_289:isShieldWeapon() then
    return A0_289:getItemHQValue(A0_289:getItemData(53), 1.03)
  else
    return 0
  end
end
L0_0.getShieldRate = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_290)
  return A0_290:getItemHQValue(armorSheet:_getData(A0_290:_getCatalogID(), 116), 1.05)
end
L0_0.getArmorDefence = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_291, A1_292)
  for _FORV_7_ = 1, #A0_291:processGetArmorDamageCut() do
    if A0_291:processGetArmorDamageCut()[_FORV_7_] == A1_292 then
      return A0_291:processGetArmorDamageCut()[_FORV_7_]
    end
  end
  return _FOR_
end
L0_0.getArmorDamageCut = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_293)
  local L1_294, L2_295, L3_296
  L1_294 = {}
  L2_295 = {}
  L3_296 = A0_293.isArmor
  L3_296 = L3_296(A0_293)
  if not L3_296 then
    L3_296 = A0_293.isAccessory
    L3_296 = L3_296(A0_293)
  elseif L3_296 then
    L3_296 = A0_293._getCatalogID
    L3_296 = L3_296(A0_293)
    for _FORV_8_ = 1, 4 do
      if armorSheet:_getData(L3_296, 121 + (_FORV_8_ - 1) * 2) ~= -1 then
        L1_294[0 + 1] = armorSheet:_getData(L3_296, 121 + (_FORV_8_ - 1) * 2)
        L2_295[0 + 1] = armorSheet:_getData(L3_296, 122 + (_FORV_8_ - 1) * 2)
      end
    end
  end
  L3_296 = L1_294
  return L3_296, L2_295
end
L0_0.processGetArmorDamageCut = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_297)
  return accessorySheet:_getData(A0_297:_getCatalogID(), 129)
end
L0_0.getAccessorySize = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_298)
  return A0_298:getItemData(140)
end
L0_0.getMateriaType = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_299)
  if A0_299:isEquipment() then
    return equipmentSheet:_getData(A0_299:_getCatalogID(), 139)
  else
    return 0
  end
end
L0_0.getMaterializeTable = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_300)
  if A0_300:getMaterializeTable() == 0 then
    return false
  else
    return true
  end
end
L0_0.getMaterializePermission = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_301)
  if A0_301:isEquipment() then
    return equipmentSheet:_getData(A0_301:_getCatalogID(), 138)
  else
    return false
  end
end
L0_0.getMateriaBindPermission = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_302)
  local L1_303
  if _isInstanceOf(A0_302, "NormalItemBaseClass") then
    L1_303 = A0_302:getNormalItemMainQuality()
  else
    L1_303 = -1
  end
  return L1_303
end
L0_0.getMainQuality = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_304)
  local L1_305, L2_306, L3_307
  if _isInstanceOf(A0_304, "NormalItemBaseClass") then
    L1_305, L2_306, L3_307 = A0_304:getNormalItemSubQuality()
  else
    L1_305, L2_306, L3_307 = -1, -1, -1
  end
  return L1_305, L2_306, L3_307
end
L0_0.getSubQuality = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_308)
  if A0_308:getNameIndex() == 4 then
  elseif A0_308:getNameIndex() == 3 then
  else
  end
  if A0_308:isEquipment() then
    for _FORV_9_ = 1, 5 do
    end
  end
  return _math.floor(A0_308:getItemData(35) * (1.1 + 0.1))
end
L0_0.getSellPrice = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_309)
  if A0_309:getSellPrice() > 0 then
    return true
  end
  return false
end
L0_0.isRealizableItem = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_310, A1_311, A2_312, A3_313, A4_314, A5_315, A6_316, A7_317, A8_318, A9_319, A10_320)
  local L11_321, L12_322
  L11_321 = true
  L12_322 = 0
  return L11_321, L12_322
end
L0_0.canUseDetail = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_323, A1_324)
  if (A1_324:_getActorMainStat() == 1 or A1_324:_getActorMainStat() == 3) and not A0_323:canUseOnDead() then
    return false, 32509
  end
  if A0_323:getItemCanUseStatCategory() == 0 then
    return true, 0
  end
  if A1_324:_getActorMainStat() == 0 then
    if A0_323:getItemCanUseStatCategory() == 1 or A0_323:getItemCanUseStatCategory() == 5 or A0_323:getItemCanUseStatCategory() == 6 or A0_323:getItemCanUseStatCategory() == 7 then
      return true, 0
    else
      return false, A0_323:getCanUseErrTextIdForActorStat()
    end
  elseif A1_324:_getActorMainStat() == 2 then
    if A0_323:getItemCanUseStatCategory() == 2 or A0_323:getItemCanUseStatCategory() == 5 then
      return true, 0
    else
      return false, A0_323:getCanUseErrTextIdForActorStat()
    end
  elseif A1_324:_getActorMainStat() == 30 or A1_324:_getActorMainStat() == 31 or A1_324:_getActorMainStat() == 32 then
    if A0_323:getItemCanUseStatCategory() == 3 or A0_323:getItemCanUseStatCategory() == 6 then
      return true, 0
    else
      return false, A0_323:getCanUseErrTextIdForActorStat()
    end
  elseif A1_324:_getActorMainStat() == 50 or A1_324:_getActorMainStat() == 51 then
    if A0_323:getItemCanUseStatCategory() == 4 or A0_323:getItemCanUseStatCategory() == 7 then
      return true, 0
    else
      return false, A0_323:getCanUseErrTextIdForActorStat()
    end
  elseif A1_324:_getActorMainStat() == 70 then
    if A0_323:getItemCanUseStatCategory() == 5 or A0_323:getItemCanUseStatCategory() == 8 then
      return true, 0
    else
      return false, A0_323:getCanUseErrTextIdForActorStat()
    end
  else
    return true, 0
  end
end
L0_0.processCanUseForActorStat = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_325)
  if A0_325:getGameCommandData(37) == 1 or A0_325:getGameCommandData(37) == 5 or A0_325:getGameCommandData(37) == 6 or A0_325:getGameCommandData(37) == 7 then
    return 32502
  elseif A0_325:getGameCommandData(37) == 2 or A0_325:getGameCommandData(37) == 5 then
    return 32503
  elseif A0_325:getGameCommandData(37) == 3 or A0_325:getGameCommandData(37) == 6 then
    return 32504
  elseif A0_325:getGameCommandData(37) == 4 or A0_325:getGameCommandData(37) == 7 then
    return 32505
  elseif A0_325:getGameCommandData(37) == 5 or A0_325:getGameCommandData(37) == 8 then
    return 32506
  else
    return 32501
  end
end
L0_0.getCanUseErrTextIdForActorStat = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_326, A1_327, A2_328)
  local L3_329, L4_330, L5_331, L6_332, L7_333, L8_334, L9_335
  L4_330 = A2_328
  L3_329 = A2_328.isPropertyEnabled
  L5_331 = 3
  L3_329 = L3_329(L4_330, L5_331)
  if L3_329 == false then
    L3_329 = false
    L4_330 = 32708
    return L3_329, L4_330
  end
  L4_330 = A2_328
  L3_329 = A2_328.isBlockAll
  L3_329 = L3_329(L4_330)
  if L3_329 then
    L3_329 = false
    L4_330 = 32708
    return L3_329, L4_330
  end
  L4_330 = A1_327
  L3_329 = A1_327.judgeRelation
  L5_331 = A2_328
  L3_329 = L3_329(L4_330, L5_331)
  L4_330 = _getStaticActor
  L5_331 = 21007
  L4_330 = L4_330(L5_331)
  L6_332 = A0_326
  L5_331 = A0_326.canUseForRelation
  L7_333 = L5_331(L6_332)
  L9_335 = A0_326
  L8_334 = A0_326.canUseForDeadTarget
  L8_334 = L8_334(L9_335)
  L9_335 = A0_326.canUseForLiveTarget
  L9_335 = L9_335(A0_326)
  if L6_332 and A2_328:isBlockFriendly() then
    return false, 32708
  end
  if A2_328 ~= A1_327 and A2_328:isBlockOtherAll() then
    return false, 32708
  end
  return A1_327:canApproach(L4_330, A2_328, L5_331, L6_332, L7_333, L8_334, L9_335, L3_329)
end
L0_0.processCanUseForTarget = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_336, A1_337, A2_338)
  if A1_337:_getPos() > A2_338:_getPos() + 5 then
    return false, 32541
  elseif A1_337:_getPos() < A2_338:_getPos() - 5 then
    return false, 32540
  end
  if _math.sqrt((A1_337:_getPos() - A2_338:_getPos()) ^ 2 + (A1_337:_getPos() - A2_338:_getPos()) ^ 2) <= 10 then
    return true, 0
  else
    return false, 32539
  end
end
L0_0.processCanUseForRange = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_339)
  local L1_340
  L1_340 = false
  return L1_340
end
L0_0.canUseWithPartsCheck = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_341, A1_342, A2_343)
  if not A0_341:canUseWithPartsCheck() then
    return true, 0
  end
  if A2_343 == 0 or A2_343 == 1 then
    return true, 0
  end
  if A0_341:processCanUseParts()[A2_343] then
    if A1_342:isParts(A2_343) then
      if A1_342:_getSubStatBreakage(A2_343) then
        if A0_341:canUseForDeadTarget() then
          return true, 0
        else
          return false, 32526
        end
      else
        return true, 0
      end
    else
      return false, 32525
    end
  else
    return false, 32524
  end
  return true, 0
end
L0_0.processCanUseForTargetParts = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_344)
  local L1_345
  L1_345 = false
  return L1_345
end
L0_0.canUseOnDead = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_346)
  local L1_347, L2_348, L3_349, L4_350, L5_351, L6_352, L7_353, L8_354
  L1_347 = true
  L2_348 = false
  L3_349 = false
  L4_350 = false
  L5_351 = false
  L6_352 = false
  L7_353 = false
  L8_354 = false
  return L1_347, L2_348, L3_349, L4_350, L5_351, L6_352, L7_353, L8_354
end
L0_0.canUseParts = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_355)
  local L1_356
  L1_356 = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  }
  L1_356[1], L1_356[2], L1_356[3], L1_356[4], L1_356[5], L1_356[6], L1_356[7], L1_356[8] = A0_355:canUseParts()
  return L1_356
end
L0_0.processCanUseParts = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_357)
  local L1_358, L2_359, L3_360
  L1_358 = true
  L2_359 = true
  L3_360 = true
  return L1_358, L2_359, L3_360
end
L0_0.canUseForRelation = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_361)
  local L1_362
  L1_362 = false
  return L1_362
end
L0_0.canUseForDeadTarget = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_363)
  local L1_364
  L1_364 = true
  return L1_364
end
L0_0.canUseForLiveTarget = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_365, A1_366)
  if not A0_365:isRepairable() then
    return false, 40213
  end
  if A0_365:getItemLifePercent() >= 100 then
    return false, 40214
  end
  if A1_366 ~= nil and A1_366 <= A0_365:getItemLifePercent() then
    return false, 40217
  end
  return true, 0
end
L0_0.canRepair = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_367)
  if A0_367:isEquipment() == false and A0_367:isFurniture() == false then
    return false
  end
  if A0_367:_isStackable() then
    return false
  end
  if A0_367:getItemLifeMax() <= 0 then
    return false
  end
  if A0_367:getItemRepairSkill() == 0 then
    return false
  end
  if A0_367:getItemRepairItem() == 0 then
    return false
  end
  if A0_367:getItemRepairItemNum() < 1 or A0_367:getItemRepairItemNum() > 8 then
    return false
  end
  return true
end
L0_0.isRepairable = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_368)
  return itemDataSheet:_getData(A0_368:_getCatalogID(), 40)
end
L0_0.getItemKind = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_369)
  return itemDataSheet:_getData(A0_369:_getCatalogID(), 41)
end
L0_0.getItemRarity = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_370)
  local L1_371
  L1_371 = {}
  return L1_371
end
L0_0.getProperMarket = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_372, A1_373)
  local L2_374, L3_375, L4_376, L5_377, L6_378, L7_379
  L2_374 = marketItemSheet
  L3_375 = L2_374
  L2_374 = L2_374._loadKeyTemporarily
  L2_374(L3_375, L4_376, L5_377)
  L3_375 = A0_372
  L2_374 = A0_372._isAlive
  L2_374 = L2_374(L3_375)
  if L2_374 == false then
    L2_374 = false
    return L2_374
  end
  L3_375 = A0_372
  L2_374 = A0_372.getItemKind
  L2_374 = L2_374(L3_375)
  if A1_373 < 1 or A1_373 > 20 then
    L3_375 = false
    return L3_375
  end
  L3_375 = false
  for L7_379 = 0, 23 do
    if L2_374 ~= 0 and L2_374 == marketItemSheet:_getData(A1_373, L7_379) then
      L3_375 = true
      break
    end
  end
  if L3_375 == true then
    if A1_373 == 7 or A1_373 == 8 or A1_373 == 9 then
      L7_379 = A1_373
      L7_379 = L6_378
      if L4_376 >= L5_377 and L4_376 <= L6_378 then
        L7_379 = true
        return L7_379
      end
    else
      return L4_376
    end
  end
  return L4_376
end
L0_0.isProperMarket = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_380)
  if A0_380:isEquipment() then
    if A0_380:getItemLifeMax() <= 0 then
      return false
    end
    return true
  end
  return false
end
L0_0.canChangeFitness = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_381, A1_382, A2_383)
  local L3_384, L4_385
  L4_385 = A0_381
  L3_384 = A0_381.getNameIndex
  L3_384 = L3_384(L4_385)
  L4_385 = A1_382
  if L3_384 >= 2 then
    L4_385 = _math.max(L4_385 + 1, _math.ceil(A1_382 * A2_383))
  end
  return L4_385
end
L0_0.getItemHQValue = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_386)
  if A0_386:isRepairable() == true then
    if 1 > _math.floor((A0_386:getItemLevel() - 1) / 10) then
      return 100
    elseif _math.floor((A0_386:getItemLevel() - 1) / 10) < 2 then
      return 200
    elseif _math.floor((A0_386:getItemLevel() - 1) / 10) < 3 then
      return 300
    elseif _math.floor((A0_386:getItemLevel() - 1) / 10) < 4 then
      return 400
    else
      return 500
    end
  end
  return 0
end
L0_0.getRepairAmount = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_387)
  if A0_387:isEquipment() == true then
    if 1 > _math.floor((A0_387:getItemLevel() - 1) / 10) then
      return 100
    elseif _math.floor((A0_387:getItemLevel() - 1) / 10) < 2 then
      return 200
    elseif _math.floor((A0_387:getItemLevel() - 1) / 10) < 3 then
      return 500
    elseif _math.floor((A0_387:getItemLevel() - 1) / 10) < 4 then
      return 1000
    else
      return 2000
    end
  end
  return 0
end
L0_0.getAttachMateriaAmount = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_388)
  local L1_389
  L1_389 = 0
  return L1_389
end
L0_0.getNormalItemMateriaFreeIndex = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_390)
  local L1_391
  L1_391 = false
  return L1_391
end
L0_0.isMateriaAttached = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_392)
  local L1_393
  L1_393 = 0
  return L1_393
end
L0_0.getMateriaAttachedCount = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_394)
  local L1_395
  L1_395 = 3
  return L1_395
end
L0_0.getMainSkill = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_396)
  return A0_396:_getNameIndex()
end
L0_0.getNameIndex = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_397)
  return itemDataSheet:_getData(A0_397:_getCatalogID(), 36)
end
L0_0.getItemIcon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_398)
  local L1_399
  L1_399 = 0
  return L1_399
end
L0_0.getItemRepairItemIcon = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_400)
  local L1_401
  L1_401 = 0
  return L1_401
end
L0_0.getItemColor = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_402)
  local L1_403
  L1_403 = 0
  return L1_403
end
L0_0.getItemMaterial = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_404)
  local L1_405
  L1_405 = 0
  return L1_405
end
L0_0.getItemDecoration = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_406)
  return A0_406:getWeaponDamageAttribute()[1], A0_406:getWeaponDamageAttribute()[2], A0_406:getWeaponDamageAttribute()[3], _math.floor(A0_406:getWeaponDamageAttribute()[1] * 100 + 0.5), _math.floor(A0_406:getWeaponDamageAttribute()[2] * 100 + 0.5), _math.floor(A0_406:getWeaponDamageAttribute()[3] * 100 + 0.5)
end
L0_0.getWeaponDamageAttributeNoArray = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_407)
  if _isInstanceOf(A0_407, "NormalItemBaseClass") then
    return A0_407:getNormalItemLife()
  else
    return 0
  end
end
L0_0.getItemLife = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_408, A1_409, A2_410, A3_411)
end
L0_0.sendMessageUseErr = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_412)
  return A0_412:_isRare()
end
L0_0.isRareItem = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_413)
  local L1_414
  L1_414 = A0_413._getLockingInfo
  L1_414 = L1_414(A0_413, 3)
  if L1_414 ~= nil then
    return true, L1_414
  else
    return false
  end
end
L0_0.isExclusiveItem = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_415)
  if A0_415:_getCatalogID() >= 3010000 and A0_415:_getCatalogID() <= 3019999 then
    return true
  elseif A0_415:_getCatalogID() >= 3010600 and A0_415:_getCatalogID() <= 3010699 then
    return true
  elseif A0_415:_getCatalogID() >= 3020000 and A0_415:_getCatalogID() <= 3029999 then
    return true
  end
  return false
end
L0_0.isFoodOrPotion = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_416)
  if A0_416:isExclusiveItem() then
  end
  return 0 + 1
end
L0_0.getWasteConfirmLevel = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_417, A1_418, A2_419, A3_420, A4_421, A5_422, A6_423, A7_424, A8_425, A9_426)
  local L10_427, L11_428
  if A4_421 == nil then
    A4_421 = A1_418
  end
  if A9_426 == nil then
    A9_426 = 1
  end
  if A8_425 == nil then
    A8_425 = 1
  end
  L11_428 = A0_417
  L10_427 = A0_417.getItemUseMax
  L10_427 = L10_427(L11_428)
  if L10_427 == 0 then
    L10_427 = false
    L11_428 = 0
    return L10_427, L11_428
  end
  L11_428 = A0_417
  L10_427 = A0_417.processCanUseForActorStat
  L11_428 = L10_427(L11_428, A1_418)
  if not L10_427 then
    A0_417:sendMessageUseErr(L11_428, A1_418, A4_421)
    return false, L11_428
  end
  L10_427, L11_428 = A0_417:processCanUseForTargetParts(A4_421, A8_425)
  if not L10_427 then
    A0_417:sendMessageUseErr(L11_428, A1_418, A4_421)
    return false, L11_428
  end
  L10_427, L11_428 = A0_417:canUseDetail(A1_418, A4_421, A8_425)
  if not L10_427 then
    A0_417:sendMessageUseErr(L11_428, A1_418, A4_421)
    return false, L11_428
  end
  return true
end
L0_0.canUse = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_429, A1_430)
  local L2_431, L3_432, L4_433, L5_434
  L2_431 = {}
  L3_432 = {}
  L5_434 = A0_429
  L4_433 = A0_429.processGetEquipmentParameterBonus
  L5_434 = L4_433(L5_434)
  L3_432 = L5_434
  L2_431 = L4_433
  L4_433 = #L2_431
  if A1_430 > L4_433 then
    L4_433 = -1
    L5_434 = 0
    return L4_433, L5_434, 0
  end
  L4_433 = L3_432[A1_430]
  if L4_433 == 0 then
    L4_433 = -1
    L5_434 = 0
    return L4_433, L5_434, 0
  end
  L4_433 = desktopWidget
  L5_434 = L4_433
  L4_433 = L4_433.getParameterUnit
  L5_434 = L4_433(L5_434, L2_431[A1_430])
  return L4_433, L3_432[A1_430], L5_434
end
L0_0.getEquipmentParameterBonusAtSlot = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_435, A1_436)
  local L2_437
  L2_437 = A0_435.getItemCompatibility
  L2_437 = L2_437(A0_435, A1_436)
  if L2_437 == 0 then
    L2_437 = false
    return L2_437
  end
  L2_437 = A0_435.isConformTribe
  L2_437 = L2_437(A0_435, A1_436)
  if not L2_437 then
    L2_437 = false
    return L2_437
  end
  L2_437 = A1_436.getStateMainSkill
  L2_437 = L2_437(A1_436)
  if A0_435:getItemLevelType() == 1 and A1_436:getSkillLevel(L2_437) < A0_435:getItemLevel() then
    return false
  end
  return true
end
L0_0.canEquipSimple = L1_1
L0_0 = ItemBaseClass
function L1_1(A0_438)
  if A0_438:isWeapon() then
    return A0_438:getWeaponData(141)
  else
    return 0
  end
end
L0_0.getAmmoVirtualDamagePower = L1_1
