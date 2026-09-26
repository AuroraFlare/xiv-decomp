require("/Widget/WidgetBaseClass")
_defineClass("PcProfileWidget", "WidgetBaseClass")
function PcProfileWidget.setCharaName(A0_0, A1_1)
  local L2_2, L3_3, L4_4
  L2_2 = desktopWidget
  L3_3 = L2_2
  L2_2 = L2_2.getActorName
  L4_4 = A1_1
  L2_2 = L2_2(L3_3, L4_4)
  if L2_2 ~= nil then
    L3_3 = 0
    L4_4 = 0
    L3_3 = A1_1:_getAchievementTitle()
    if A1_1:isFemale() then
      L4_4 = 1
    end
    A0_0:setText("TextBlock_PlayerName", 12037, L3_3, L4_4, L2_2)
  end
end
function PcProfileWidget.setCharaSkillName(A0_5, A1_6)
  local L2_7, L3_8, L4_9
  L3_8 = A1_6
  L2_7 = A1_6.getStateMainSkill
  L2_7 = L2_7(L3_8)
  L4_9 = A1_6
  L3_8 = A1_6.getStateMainSkillLevel
  L3_8 = L3_8(L4_9)
  L4_9 = A1_6.getMainClassOrJob
  L4_9 = L4_9(A1_6)
  if L2_7 == L4_9 then
    L4_9 = 0
  end
  A0_5:setText("TextBlock_SkillRank", 231, L2_7, L3_8, L4_9)
end
function PcProfileWidget.setEquipSlotIcon(A0_10, A1_11, A2_12, A3_13, A4_14)
  if A2_12 ~= nil and A2_12 > 0 then
    A0_10:setVisibility(A1_11, true)
    A0_10:setIcon(A1_11, A2_12)
    if A3_13 ~= nil then
      A0_10:setHidden(A3_13)
    end
  else
    A0_10:setVisibility(A1_11, false)
    A0_10:setIcon(A1_11, 0)
    if A3_13 ~= nil and A4_14 ~= nil then
      A0_10:setIcon(A3_13, A4_14)
      A0_10:setVisibility(A3_13, true)
    end
  end
end
function PcProfileWidget.setMainWeapon(A0_15, A1_16, A2_17, A3_18, A4_19, A5_20, A6_21)
  A0_15:setEquipSlotIcon("Button_PrimaryArm:IconControl_EquipIcon", A1_16, "Button_PrimaryArm:IconControl_EquipIconBase", 359)
  A0_15:setVisibility("Button_PrimaryArm" .. ":Border_ItemLife_EquipIconCaution", A2_17)
  A0_15:setVisibility("Button_PrimaryArm" .. ":Border_ItemLife_EquipIconDanger", A3_18)
  A0_15:setVisibility("Button_PrimaryArm" .. ":IconControl_PolishMAX", A4_19)
  A0_15:setVisibility("Button_PrimaryArm" .. ":IconControl_Materia", A5_20)
end
function PcProfileWidget.setSubWeapon(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27, A6_28)
  A0_22:setEquipSlotIcon("Button_SecondaryArm:IconControl_EquipIcon", A1_23, "Button_SecondaryArm:IconControl_EquipIconBase", 361)
  A0_22:setVisibility("Button_SecondaryArm" .. ":Border_ItemLife_EquipIconCaution", A2_24)
  A0_22:setVisibility("Button_SecondaryArm" .. ":Border_ItemLife_EquipIconDanger", A3_25)
  A0_22:setVisibility("Button_SecondaryArm" .. ":IconControl_PolishMAX", A4_26)
  A0_22:setVisibility("Button_SecondaryArm" .. ":IconControl_Materia", A5_27)
end
function PcProfileWidget.setPouch(A0_29, A1_30, A2_31, A3_32, A4_33, A5_34, A6_35)
  A0_29:setEquipSlotIcon("Button_LargePouch:IconControl_EquipIcon", A1_30, "Button_LargePouch:IconControl_EquipIconBase", 360)
  A0_29:setVisibility("Button_LargePouch" .. ":Border_ItemLife_EquipIconCaution", A2_31)
  A0_29:setVisibility("Button_LargePouch" .. ":Border_ItemLife_EquipIconDanger", A3_32)
  A0_29:setVisibility("Button_LargePouch" .. ":IconControl_PolishMAX", A4_33)
  A0_29:setVisibility("Button_LargePouch" .. ":IconControl_Materia", A5_34)
end
function PcProfileWidget.setBadolier(A0_36, A1_37, A2_38, A3_39, A4_40, A5_41, A6_42)
  A0_36:setEquipSlotIcon("Button_SmallPouch:IconControl_EquipIcon", A1_37, "Button_SmallPouch:IconControl_EquipIconBase", 362)
  A0_36:setVisibility("Button_SmallPouch" .. ":Border_ItemLife_EquipIconCaution", A2_38)
  A0_36:setVisibility("Button_SmallPouch" .. ":Border_ItemLife_EquipIconDanger", A3_39)
  A0_36:setVisibility("Button_SmallPouch" .. ":IconControl_PolishMAX", A4_40)
  A0_36:setVisibility("Button_SmallPouch" .. ":IconControl_Materia", A5_41)
end
function PcProfileWidget.setThrowWeapon(A0_43, A1_44, A2_45, A3_46, A4_47, A5_48, A6_49)
  A0_43:setEquipSlotIcon("Button_ThrowingWeapon:IconControl_EquipIcon", A1_44, "Button_ThrowingWeapon:IconControl_EquipIconBase", 363)
  A0_43:setVisibility("Button_ThrowingWeapon" .. ":Border_ItemLife_EquipIconCaution", A2_45)
  A0_43:setVisibility("Button_ThrowingWeapon" .. ":Border_ItemLife_EquipIconDanger", A3_46)
  A0_43:setVisibility("Button_ThrowingWeapon" .. ":IconControl_PolishMAX", A4_47)
  A0_43:setVisibility("Button_ThrowingWeapon" .. ":IconControl_Materia", A5_48)
end
function PcProfileWidget.setHead(A0_50, A1_51, A2_52, A3_53, A4_54, A5_55, A6_56)
  A0_50:setEquipSlotIcon("Button_Head:IconControl_EquipIcon", A1_51, "Button_Head:IconControl_EquipIconBase", 364)
  A0_50:setVisibility("Button_Head" .. ":Border_ItemLife_EquipIconCaution", A2_52)
  A0_50:setVisibility("Button_Head" .. ":Border_ItemLife_EquipIconDanger", A3_53)
  A0_50:setVisibility("Button_Head" .. ":IconControl_PolishMAX", A4_54)
  A0_50:setVisibility("Button_Head" .. ":IconControl_Materia", A5_55)
end
function PcProfileWidget.setBody(A0_57, A1_58, A2_59, A3_60, A4_61, A5_62, A6_63)
  A0_57:setEquipSlotIcon("Button_Body:IconControl_EquipIcon", A1_58, "Button_Body:IconControl_EquipIconBase", 365)
  A0_57:setVisibility("Button_Body" .. ":Border_ItemLife_EquipIconCaution", A2_59)
  A0_57:setVisibility("Button_Body" .. ":Border_ItemLife_EquipIconDanger", A3_60)
  A0_57:setVisibility("Button_Body" .. ":IconControl_PolishMAX", A4_61)
  A0_57:setVisibility("Button_Body" .. ":IconControl_Materia", A5_62)
end
function PcProfileWidget.setBodyInner(A0_64, A1_65, A2_66, A3_67, A4_68, A5_69, A6_70)
  A0_64:setEquipSlotIcon("Button_Undershirt:IconControl_EquipIcon", A1_65, "Button_Undershirt:IconControl_EquipIconBase", 366)
  A0_64:setVisibility("Button_Undershirt" .. ":Border_ItemLife_EquipIconCaution", A2_66)
  A0_64:setVisibility("Button_Undershirt" .. ":Border_ItemLife_EquipIconDanger", A3_67)
  A0_64:setVisibility("Button_Undershirt" .. ":IconControl_PolishMAX", A4_68)
  A0_64:setVisibility("Button_Undershirt" .. ":IconControl_Materia", A5_69)
end
function PcProfileWidget.setHands(A0_71, A1_72, A2_73, A3_74, A4_75, A5_76, A6_77)
  A0_71:setEquipSlotIcon("Button_Hands:IconControl_EquipIcon", A1_72, "Button_Hands:IconControl_EquipIconBase", 367)
  A0_71:setVisibility("Button_Hands" .. ":Border_ItemLife_EquipIconCaution", A2_73)
  A0_71:setVisibility("Button_Hands" .. ":Border_ItemLife_EquipIconDanger", A3_74)
  A0_71:setVisibility("Button_Hands" .. ":IconControl_PolishMAX", A4_75)
  A0_71:setVisibility("Button_Hands" .. ":IconControl_Materia", A5_76)
end
function PcProfileWidget.setWaist(A0_78, A1_79, A2_80, A3_81, A4_82, A5_83, A6_84)
  A0_78:setEquipSlotIcon("Button_Waist:IconControl_EquipIcon", A1_79, "Button_Waist:IconControl_EquipIconBase", 368)
  A0_78:setVisibility("Button_Waist" .. ":Border_ItemLife_EquipIconCaution", A2_80)
  A0_78:setVisibility("Button_Waist" .. ":Border_ItemLife_EquipIconDanger", A3_81)
  A0_78:setVisibility("Button_Waist" .. ":IconControl_PolishMAX", A4_82)
  A0_78:setVisibility("Button_Waist" .. ":IconControl_Materia", A5_83)
end
function PcProfileWidget.setLegs(A0_85, A1_86, A2_87, A3_88, A4_89, A5_90, A6_91)
  A0_85:setEquipSlotIcon("Button_Legs:IconControl_EquipIcon", A1_86, "Button_Legs:IconControl_EquipIconBase", 369)
  A0_85:setVisibility("Button_Legs" .. ":Border_ItemLife_EquipIconCaution", A2_87)
  A0_85:setVisibility("Button_Legs" .. ":Border_ItemLife_EquipIconDanger", A3_88)
  A0_85:setVisibility("Button_Legs" .. ":IconControl_PolishMAX", A4_89)
  A0_85:setVisibility("Button_Legs" .. ":IconControl_Materia", A5_90)
end
function PcProfileWidget.setLegsInner(A0_92, A1_93, A2_94, A3_95, A4_96, A5_97, A6_98)
  A0_92:setEquipSlotIcon("Button_Undergarment:IconControl_EquipIcon", A1_93, "Button_Undergarment:IconControl_EquipIconBase", 370)
  A0_92:setVisibility("Button_Undergarment" .. ":Border_ItemLife_EquipIconCaution", A2_94)
  A0_92:setVisibility("Button_Undergarment" .. ":Border_ItemLife_EquipIconDanger", A3_95)
  A0_92:setVisibility("Button_Undergarment" .. ":IconControl_PolishMAX", A4_96)
  A0_92:setVisibility("Button_Undergarment" .. ":IconControl_Materia", A5_97)
end
function PcProfileWidget.setFeet(A0_99, A1_100, A2_101, A3_102, A4_103, A5_104, A6_105)
  A0_99:setEquipSlotIcon("Button_Feet:IconControl_EquipIcon", A1_100, "Button_Feet:IconControl_EquipIconBase", 371)
  A0_99:setVisibility("Button_Feet" .. ":Border_ItemLife_EquipIconCaution", A2_101)
  A0_99:setVisibility("Button_Feet" .. ":Border_ItemLife_EquipIconDanger", A3_102)
  A0_99:setVisibility("Button_Feet" .. ":IconControl_PolishMAX", A4_103)
  A0_99:setVisibility("Button_Feet" .. ":IconControl_Materia", A5_104)
end
function PcProfileWidget.setEarR(A0_106, A1_107, A2_108, A3_109, A4_110, A5_111, A6_112)
  A0_106:setEquipSlotIcon("Button_Accessories_RightEar:IconControl_EquipIcon", A1_107, "Button_Accessories_RightEar:IconControl_EquipIconBase", 372)
  A0_106:setVisibility("Button_Accessories_RightEar" .. ":Border_ItemLife_EquipIconCaution", A2_108)
  A0_106:setVisibility("Button_Accessories_RightEar" .. ":Border_ItemLife_EquipIconDanger", A3_109)
  A0_106:setVisibility("Button_Accessories_RightEar" .. ":IconControl_PolishMAX", A4_110)
  A0_106:setVisibility("Button_Accessories_RightEar" .. ":IconControl_Materia", A5_111)
end
function PcProfileWidget.setNeck(A0_113, A1_114, A2_115, A3_116, A4_117, A5_118, A6_119)
  A0_113:setEquipSlotIcon("Button_Accessories_Neck:IconControl_EquipIcon", A1_114, "Button_Accessories_Neck:IconControl_EquipIconBase", 373)
  A0_113:setVisibility("Button_Accessories_Neck" .. ":Border_ItemLife_EquipIconCaution", A2_115)
  A0_113:setVisibility("Button_Accessories_Neck" .. ":Border_ItemLife_EquipIconDanger", A3_116)
  A0_113:setVisibility("Button_Accessories_Neck" .. ":IconControl_PolishMAX", A4_117)
  A0_113:setVisibility("Button_Accessories_Neck" .. ":IconControl_Materia", A5_118)
end
function PcProfileWidget.setIndexL(A0_120, A1_121, A2_122, A3_123, A4_124, A5_125, A6_126)
  A0_120:setEquipSlotIcon("Button_Accessories_LeftFinger_1:IconControl_EquipIcon", A1_121, "Button_Accessories_LeftFinger_1:IconControl_EquipIconBase", 374)
  A0_120:setVisibility("Button_Accessories_LeftFinger_1" .. ":Border_ItemLife_EquipIconCaution", A2_122)
  A0_120:setVisibility("Button_Accessories_LeftFinger_1" .. ":Border_ItemLife_EquipIconDanger", A3_123)
  A0_120:setVisibility("Button_Accessories_LeftFinger_1" .. ":IconControl_PolishMAX", A4_124)
  A0_120:setVisibility("Button_Accessories_LeftFinger_1" .. ":IconControl_Materia", A5_125)
end
function PcProfileWidget.setIndexR(A0_127, A1_128, A2_129, A3_130, A4_131, A5_132, A6_133)
  A0_127:setEquipSlotIcon("Button_Accessories_RightFinger_1:IconControl_EquipIcon", A1_128, "Button_Accessories_RightFinger_1:IconControl_EquipIconBase", 374)
  A0_127:setVisibility("Button_Accessories_RightFinger_1" .. ":Border_ItemLife_EquipIconCaution", A2_129)
  A0_127:setVisibility("Button_Accessories_RightFinger_1" .. ":Border_ItemLife_EquipIconDanger", A3_130)
  A0_127:setVisibility("Button_Accessories_RightFinger_1" .. ":IconControl_PolishMAX", A4_131)
  A0_127:setVisibility("Button_Accessories_RightFinger_1" .. ":IconControl_Materia", A5_132)
end
function PcProfileWidget.setWristR(A0_134, A1_135, A2_136, A3_137, A4_138, A5_139, A6_140)
  A0_134:setEquipSlotIcon("Button_Accessories_RightBracelet:IconControl_EquipIcon", A1_135, "Button_Accessories_RightBracelet:IconControl_EquipIconBase", 375)
  A0_134:setVisibility("Button_Accessories_RightBracelet" .. ":Border_ItemLife_EquipIconCaution", A2_136)
  A0_134:setVisibility("Button_Accessories_RightBracelet" .. ":Border_ItemLife_EquipIconDanger", A3_137)
  A0_134:setVisibility("Button_Accessories_RightBracelet" .. ":IconControl_PolishMAX", A4_138)
  A0_134:setVisibility("Button_Accessories_RightBracelet" .. ":IconControl_Materia", A5_139)
end
function PcProfileWidget.setPSNID(A0_141)
  A0_141:setUserWorkInt(1, nil, "CustomControl_PSNIDLabel", 1)
  A0_141:setUserWorkInt(1, nil, "CustomControl_PSNIDNameLabel", 1)
end
function PcProfileWidget.setGrandCompanyGrid(A0_142, A1_143)
  local L2_144, L3_145, L4_146, L5_147
  L2_144 = 1
  L4_146 = A1_143
  L3_145 = A1_143.isMale
  L3_145 = L3_145(L4_146)
  if L3_145 == true then
    L2_144 = 1
  else
    L4_146 = A1_143
    L3_145 = A1_143.isFemale
    L3_145 = L3_145(L4_146)
    if L3_145 == true then
      L2_144 = 2
    end
  end
  L4_146 = A1_143
  L3_145 = A1_143._getBelongGrandCompany
  L3_145 = L3_145(L4_146)
  L4_146 = L3_145
  if L4_146 == 1 then
    L5_147 = A0_142.setStyle
    L5_147(A0_142, "Grid_GrandCompany:Label_GrandCompanyBanner", "LAB_profile_stateBanner_LimsaLominsa")
    L5_147 = A0_142.setText
    L5_147(A0_142, "Grid_GrandCompany:TextBlock_CompanyCity", 100621)
    L5_147 = A0_142.setText
    L5_147(A0_142, "Grid_GrandCompany:TextBlock_CompanyName", 8051)
    break
  else
  end
  if L4_146 == 2 then
    L5_147 = A0_142.setStyle
    L5_147(A0_142, "Grid_GrandCompany:Label_GrandCompanyBanner", "LAB_profile_stateBanner_Gridania")
    L5_147 = A0_142.setText
    L5_147(A0_142, "Grid_GrandCompany:TextBlock_CompanyCity", 100622)
    L5_147 = A0_142.setText
    L5_147(A0_142, "Grid_GrandCompany:TextBlock_CompanyName", 8052)
    break
  else
  end
  if L4_146 == 3 then
    L5_147 = A0_142.setStyle
    L5_147(A0_142, "Grid_GrandCompany:Label_GrandCompanyBanner", "LAB_profile_stateBanner_Uldah")
    L5_147 = A0_142.setText
    L5_147(A0_142, "Grid_GrandCompany:TextBlock_CompanyCity", 100623)
    L5_147 = A0_142.setText
    L5_147(A0_142, "Grid_GrandCompany:TextBlock_CompanyName", 8053)
    do break end
    break
  else
  end
  L4_146 = 31
  if L3_145 ~= 0 then
    L5_147 = A1_143.getGrandCompanyRank
    L5_147 = L5_147(A1_143, L3_145)
    L4_146 = L5_147
  end
  if L3_145 == 0 or L4_146 == 0 or L4_146 == 127 then
    L5_147 = A0_142.setVisibility
    L5_147(A0_142, "Grid_GrandCompany:IconControl_CompanyStatus", false)
  else
    L5_147 = gcRankSheet
    L5_147 = L5_147._loadKeyTemporarily
    L5_147(L5_147, L4_146, L4_146)
    L5_147 = gcRankSheet
    L5_147 = L5_147._getData
    L5_147 = L5_147(L5_147, L4_146, L3_145 + 6 - 1)
    A0_142:setVisibility("Grid_GrandCompany:IconControl_CompanyStatus", true)
    A0_142:setIcon("Grid_GrandCompany:IconControl_CompanyStatus", L5_147)
    A0_142:setText("Grid_GrandCompany:TextBlock_CompanyRankName", 8079 + L3_145, L4_146, L2_144)
    A0_142:setVisibility("Grid_GrandCompany", true)
  end
end
function PcProfileWidget.processUpdateItemInformation(A0_148, A1_149, A2_150, A3_151)
  local L4_152, L5_153, L6_154, L7_155, L8_156, L9_157, L10_158, L11_159, L12_160, L13_161, L14_162
  L5_153 = A0_148
  L4_152 = A0_148.getArgActor
  L4_152 = L4_152(L5_153)
  if A1_149 ~= L4_152 then
    return
  end
  if A2_150 ~= -1 then
    return
  end
  L5_153 = A1_149
  L4_152 = A1_149._getEquippingItem
  L6_154 = A3_151
  L4_152 = L4_152(L5_153, L6_154)
  L5_153 = nil
  L6_154 = false
  L7_155 = false
  L8_156 = false
  L9_157 = 0
  L10_158 = 0
  L11_159 = false
  L12_160 = false
  L13_161 = nil
  if L4_152 == nil then
    L5_153 = nil
  else
    L14_162 = L4_152.getItemIcon
    L14_162 = L14_162(L4_152)
    L5_153 = L14_162
    L6_154 = true
    L14_162 = false
    L14_162 = L4_152:getMaterializePermission()
    if L4_152:getNormalItemFitness() == 10000 then
      L7_155 = A0_148.work.materialiseVisible and L14_162
    end
    if 0 < desktopWidget:getItemMateriaAttachInfo(L4_152) then
      L8_156 = true
    end
    L9_157, L10_158, L11_159, L12_160, L13_161 = desktopWidget:getItemLifeParam(A0_148, L4_152)
  end
  L14_162 = A3_151
  if L14_162 == 1 then
    A0_148:setMainWeapon(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
    if A0_148.work.firsttime == true then
      A0_148.work.firsttime = false
      A0_148:setButtonEnable("Button_PrimaryArm")
      A0_148:setButtonEnable("Button_LargePouch")
      A0_148:setButtonEnable("Button_SecondaryArm")
      A0_148:setButtonEnable("Button_SmallPouch")
      A0_148:setButtonEnable("Button_ThrowingWeapon")
      A0_148:setButtonEnable("Button_Head")
      A0_148:setButtonEnable("Button_Body")
      A0_148:setButtonEnable("Button_Undershirt")
      A0_148:setButtonEnable("Button_Hands")
      A0_148:setButtonEnable("Button_Waist")
      A0_148:setButtonEnable("Button_Legs")
      A0_148:setButtonEnable("Button_Undergarment")
      A0_148:setButtonEnable("Button_Feet")
      A0_148:setButtonEnable("Button_Accessories_RightEar")
      A0_148:setButtonEnable("Button_Accessories_Neck")
      A0_148:setButtonEnable("Button_Accessories_RightFinger_1")
      A0_148:setButtonEnable("Button_Accessories_RightBracelet")
      A0_148:setButtonEnable("Button_Accessories_LeftFinger_1")
      do break end
      else
      end
      if L14_162 == 2 then
        A0_148:setSubWeapon(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 5 then
        A0_148:setThrowWeapon(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 6 then
        A0_148:setPouch(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 7 then
        A0_148:setBadolier(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 9 then
        A0_148:setHead(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 11 then
        A0_148:setBody(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 10 then
        A0_148:setBodyInner(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 13 then
        A0_148:setLegs(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 12 then
        A0_148:setLegsInner(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 14 then
        A0_148:setHands(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 15 then
        A0_148:setFeet(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 16 then
        A0_148:setWaist(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 18 then
        A0_148:setEarR(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 17 then
        A0_148:setNeck(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 23 then
        A0_148:setIndexL(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 22 then
        A0_148:setIndexR(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      if L14_162 == 20 then
        A0_148:setWristR(L5_153, L11_159, L12_160, L7_155, L8_156, L6_154)
        break
      else
      end
      return
    end
  L14_162 = A0_148.work
  L14_162 = L14_162.detailSlot
  if L14_162 == A3_151 then
    L14_162 = A0_148.displaySlotItemHelp
    L14_162(A0_148, A0_148.work.detailSlot)
  end
end
function PcProfileWidget.setButtonEvents(A0_163, A1_164)
  local L2_165
  L2_165 = A0_163.getControlProperty
  L2_165 = L2_165(A0_163, A1_164, "Command")
  A0_163:setControlCommandCondition(A1_164, L2_165)
  A0_163:setControlCommandCondition(A1_164, "UILuaCommands.ButtonFocused")
  A0_163:setCancelCondition(A1_164, "UILuaCommands.Cancel")
  if A1_164 ~= "Button_PrimaryArm" then
    A0_163:setControlProperty(A1_164 .. ":Label_HoverEffect", "IsTabStop", false)
    A0_163:setControlProperty(A1_164 .. ":Label_HoverEffect", "Focusable", false)
  end
end
function PcProfileWidget.setButtonEnable(A0_166, A1_167)
  A0_166:setControlProperty(A1_167 .. ":Label_HoverEffect", "IsTabStop", true)
  A0_166:setControlProperty(A1_167 .. ":Label_HoverEffect", "Focusable", true)
end
function PcProfileWidget.isCreateCancel(A0_168)
  return A0_168.work.isCreateCancel
end
function PcProfileWidget.init(A0_169, A1_170)
  A0_169.work._temp = {
    {
      "isCreateCancel",
      "boolean"
    },
    {"firsttime", "boolean"},
    {"detailSlot", "integer32"},
    {
      "materialiseVisible",
      "boolean"
    }
  }
  A0_169.work.materialiseVisible = false
  if worldMaster:_getMyPlayer():hasItem(101, 2001001) or worldMaster:_getMyPlayer():hasItem(101, 2001002) or worldMaster:_getMyPlayer():hasItem(101, 2001003) then
    A0_169.work.materialiseVisible = true
  end
  A0_169.work.isCreateCancel = false
  A0_169.work.detailSlot = 1
  A0_169:setArgActor(A1_170)
  A0_169:initChildWidget("ItemDetailWidget", false, true, 610)
  A0_169:setDetailPosition()
  A0_169:setCancelCondition()
  A0_169:setCloseCondition()
  A0_169:setUICommandCondition("UILuaCommands.Shown")
  A0_169:setButtonEvents("Button_PrimaryArm")
  A0_169:setButtonEvents("Button_LargePouch")
  A0_169:setButtonEvents("Button_SecondaryArm")
  A0_169:setButtonEvents("Button_SmallPouch")
  A0_169:setButtonEvents("Button_ThrowingWeapon")
  A0_169:setButtonEvents("Button_Head")
  A0_169:setButtonEvents("Button_Body")
  A0_169:setButtonEvents("Button_Undershirt")
  A0_169:setButtonEvents("Button_Hands")
  A0_169:setButtonEvents("Button_Waist")
  A0_169:setButtonEvents("Button_Legs")
  A0_169:setButtonEvents("Button_Undergarment")
  A0_169:setButtonEvents("Button_Feet")
  A0_169:setButtonEvents("Button_Accessories_RightEar")
  A0_169:setButtonEvents("Button_Accessories_Neck")
  A0_169:setButtonEvents("Button_Accessories_RightFinger_1")
  A0_169:setButtonEvents("Button_Accessories_RightBracelet")
  A0_169:setButtonEvents("Button_Accessories_LeftFinger_1")
  A0_169:setMainWeapon(0, false, false, false, false, false)
  A0_169:setSubWeapon(0, false, false, false, false, false)
  A0_169:setPouch(0, false, false, false, false, false)
  A0_169:setBadolier(0, false, false, false, false, false)
  A0_169:setThrowWeapon(0, false, false, false, false, false)
  A0_169:setHead(0, false, false, false, false, false)
  A0_169:setBody(0, false, false, false, false, false)
  A0_169:setBodyInner(0, false, false, false, false, false)
  A0_169:setHands(0, false, false, false, false, false)
  A0_169:setWaist(0, false, false, false, false, false)
  A0_169:setLegs(0, false, false, false, false, false)
  A0_169:setLegsInner(0, false, false, false, false, false)
  A0_169:setFeet(0, false, false, false, false, false)
  A0_169:setEarR(0, false, false, false, false, false)
  A0_169:setNeck(0, false, false, false, false, false)
  A0_169:setIndexL(0, false, false, false, false, false)
  A0_169:setIndexR(0, false, false, false, false, false)
  A0_169:setWristR(0, false, false, false, false, false)
  A0_169:setModal(true)
  A0_169:setVisibility("Grid_GrandCompany", false)
  if A1_170 ~= nil and A1_170:_isAlive() == true and (worldMaster:_getMyPlayer():_getGMRank() ~= nil or A1_170:_getGMRank() == nil) then
    A0_169:setCharaName(A1_170)
    A0_169:setCharaSkillName(A1_170)
    A0_169:setGrandCompanyGrid(A1_170)
  end
  A0_169:setWindowFocus("Button_PrimaryArm")
  A0_169.work.firsttime = true
end
function PcProfileWidget.setWindowFocus(A0_171, A1_172)
  if A1_172 ~= nil and A1_172 ~= "" then
    A0_171:setLogicalFocus(A1_172)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_171 then
      A0_171:setKeyboardFocusedControl(A1_172)
    end
  end
end
function PcProfileWidget.slotNameToEquipSlotNum(A0_173, A1_174)
  local L2_175
  if A1_174 == "Button_PrimaryArm" then
    L2_175 = 1
    return L2_175
  elseif A1_174 == "Button_LargePouch" then
    L2_175 = 6
    return L2_175
  elseif A1_174 == "Button_SecondaryArm" then
    L2_175 = 2
    return L2_175
  elseif A1_174 == "Button_SmallPouch" then
    L2_175 = 7
    return L2_175
  elseif A1_174 == "Button_ThrowingWeapon" then
    L2_175 = 5
    return L2_175
  elseif A1_174 == "Button_Head" then
    L2_175 = 9
    return L2_175
  elseif A1_174 == "Button_Body" then
    L2_175 = 11
    return L2_175
  elseif A1_174 == "Button_Undershirt" then
    L2_175 = 10
    return L2_175
  elseif A1_174 == "Button_Hands" then
    L2_175 = 14
    return L2_175
  elseif A1_174 == "Button_Waist" then
    L2_175 = 16
    return L2_175
  elseif A1_174 == "Button_Legs" then
    L2_175 = 13
    return L2_175
  elseif A1_174 == "Button_Undergarment" then
    L2_175 = 12
    return L2_175
  elseif A1_174 == "Button_Feet" then
    L2_175 = 15
    return L2_175
  elseif A1_174 == "Button_Accessories_RightEar" then
    L2_175 = 18
    return L2_175
  elseif A1_174 == "Button_Accessories_Neck" then
    L2_175 = 17
    return L2_175
  elseif A1_174 == "Button_Accessories_RightFinger_1" then
    L2_175 = 22
    return L2_175
  elseif A1_174 == "Button_Accessories_RightBracelet" then
    L2_175 = 20
    return L2_175
  elseif A1_174 == "Button_Accessories_LeftFinger_1" then
    L2_175 = 23
    return L2_175
  else
    L2_175 = 0
    return L2_175
  end
end
function PcProfileWidget.processUICommandDefault(A0_176, A1_177, A2_178, A3_179, A4_180, A5_181)
  local L6_182, L7_183
  L6_182 = A3_179
  if L6_182 == "UILuaCommands.Shown" then
    L7_183 = A0_176.getArgActor
    L7_183 = L7_183(A0_176)
    if L7_183 == nil then
      desktopWidget:closeWidgetDirect(A0_176)
    end
    desktopWidget:executePlayerSystemCommand(24238, true, nil, L7_183)
    break
  else
  end
  if L6_182 == "UILuaCommands.ButtonFocused" then
    L7_183 = A0_176.slotNameToEquipSlotNum
    L7_183 = L7_183(A0_176, A2_178)
    A0_176:displaySlotItemHelp(L7_183)
    break
  else
  end
  L6_182 = A0_176.work
  L6_182 = L6_182.firsttime
  if L6_182 == true then
    L7_183 = A0_176
    L6_182 = A0_176.setWindowFocus
    L6_182(L7_183, "Button_PrimaryArm")
  end
end
function PcProfileWidget.setDetailPosition(A0_184)
  local L1_185, L2_186, L3_187, L4_188, L5_189, L6_190, L7_191, L8_192, L9_193, L10_194, L11_195, L12_196, L13_197, L14_198, L15_199, L16_200
  L2_186 = A0_184
  L1_185 = A0_184.getChildWidgetByWindowName
  L3_187 = "ItemDetailWidget"
  L1_185 = L1_185(L2_186, L3_187)
  if L1_185 ~= nil then
    L3_187 = L1_185
    L2_186 = L1_185.setProperty
    L4_188 = "Margin"
    L5_189 = "0,0,0,0"
    L2_186(L3_187, L4_188, L5_189)
    L3_187 = A0_184
    L2_186 = A0_184.getWindowPosition
    L3_187 = L2_186(L3_187)
    L5_189 = A0_184
    L4_188 = A0_184.getWindowSize
    L5_189 = L4_188(L5_189)
    L6_190 = desktopWidget
    L7_191 = L6_190
    L6_190 = L6_190.getWindowSize
    L7_191 = L6_190(L7_191)
    L9_193 = L1_185
    L8_192 = L1_185.getWindowSize
    L9_193 = L8_192(L9_193)
    if L8_192 == 0 then
      L8_192 = 382
    end
    if L9_193 == 0 then
      L9_193 = 280
    end
    L10_194 = L6_190 * 0.05
    L2_186 = L2_186 + L10_194
    L10_194 = L7_191 * 0.05
    L3_187 = L3_187 + L10_194
    L10_194 = L6_190 * 0.95
    L11_195 = L6_190 * 0.1
    L12_196 = L7_191 * 0.95
    L13_197 = L7_191 * 0.1
    L14_198 = L3_187 + 20
    L15_199 = L3_187 + 300
    L16_200 = L2_186 + L4_188
    if L10_194 < L16_200 + L8_192 then
      L16_200 = L16_200 - (L16_200 + L8_192 - L10_194)
    end
    if L12_196 < L15_199 then
      L14_198 = L14_198 - (L15_199 - L12_196)
    end
    if L16_200 < L2_186 + L4_188 - 20 then
      L16_200 = L2_186 - L8_192
    end
    L1_185:setProperty("Top", L14_198)
    L1_185:setProperty("Left", L16_200)
  end
end
function PcProfileWidget.displaySlotItemHelp(A0_201, A1_202)
  local L2_203, L3_204, L4_205
  if A1_202 < 0 then
    return
  end
  L3_204 = A0_201
  L2_203 = A0_201.getChildWidgetByWindowName
  L4_205 = "ItemDetailWidget"
  L2_203 = L2_203(L3_204, L4_205)
  L4_205 = A0_201
  L3_204 = A0_201.setDetailPosition
  L3_204(L4_205)
  L4_205 = A0_201
  L3_204 = A0_201.getArgActor
  L3_204 = L3_204(L4_205)
  if L3_204 == nil then
    L4_205 = desktopWidget
    L4_205 = L4_205.closeWidgetDirect
    return L4_205(L4_205, A0_201)
  end
  L4_205 = L3_204._getEquippingItem
  L4_205 = L4_205(L3_204, A1_202)
  if L4_205 ~= nil and A0_201.work.firsttime == false then
    L2_203:displayItemHelp(L4_205, 0, 0, 7, A1_202)
  else
    L2_203:displayEmpty(7)
    L2_203:setText("TextBlock_Title", 215, A1_202)
  end
  A0_201.work.detailSlot = A1_202
  L2_203:show()
  L2_203:setModal(false)
  desktopWidget:changeFocusedWidget(A0_201, true)
  L2_203:setVisibility("Grid_ActorName", false)
end
function PcProfileWidget.processUICommandOperate(A0_206, A1_207, A2_208, A3_209, A4_210)
  if A0_206.work.firsttime == true then
    A0_206:setWindowFocus("Button_PrimaryArm")
  end
end
