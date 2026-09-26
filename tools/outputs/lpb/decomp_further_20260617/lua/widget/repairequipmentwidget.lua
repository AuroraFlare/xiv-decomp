require("/Widget/WidgetBaseClass")
_defineClass("RepairEquipmentWidget", "WidgetBaseClass")
function RepairEquipmentWidget.init(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6
  L2_2 = A0_0.work
  L3_3 = {
    L4_4,
    L5_5,
    L6_6,
    {
      "materialiseVisible",
      "boolean"
    },
    {
      "lastcommand",
      "integer32"
    }
  }
  L4_4 = {L5_5, L6_6}
  L5_5 = "isCreateCancel"
  L6_6 = "boolean"
  L5_5 = {L6_6, "boolean"}
  L6_6 = "firsttime"
  L6_6 = {"detailSlot", "integer32"}
  L2_2._temp = L3_3
  L2_2 = worldMaster
  L3_3 = L2_2
  L2_2 = L2_2._getMyPlayer
  L2_2 = L2_2(L3_3)
  L3_3 = A0_0.work
  L3_3.materialiseVisible = false
  L4_4 = L2_2
  L3_3 = L2_2.hasItem
  L5_5 = 101
  L6_6 = 2001001
  L3_3 = L3_3(L4_4, L5_5, L6_6)
  if not L3_3 then
    L4_4 = L2_2
    L3_3 = L2_2.hasItem
    L5_5 = 101
    L6_6 = 2001002
    L3_3 = L3_3(L4_4, L5_5, L6_6)
    if not L3_3 then
      L4_4 = L2_2
      L3_3 = L2_2.hasItem
      L5_5 = 101
      L6_6 = 2001003
      L3_3 = L3_3(L4_4, L5_5, L6_6)
    end
  elseif L3_3 then
    L3_3 = A0_0.work
    L3_3.materialiseVisible = true
  end
  L3_3 = A0_0.work
  L3_3.isCreateCancel = false
  L3_3 = A0_0.work
  L3_3.detailSlot = 1
  L4_4 = A0_0
  L3_3 = A0_0.setArgActor
  L5_5 = A1_1
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.initChildWidget
  L5_5 = "ItemDetailWidget"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, true, 610)
  L4_4 = A0_0
  L3_3 = A0_0.setDetailPosition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setCancelCondition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setCloseCondition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setUICommandCondition
  L5_5 = "UILuaCommands.Shown"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_PrimaryArm"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_LargePouch"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_SecondaryArm"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_SmallPouch"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_ThrowingWeapon"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Head"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Body"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Undershirt"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Hands"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Waist"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Legs"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Undergarment"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Feet"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Accessories_RightEar"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Accessories_Neck"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Accessories_RightFinger_1"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Accessories_RightBracelet"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_Accessories_LeftFinger_1"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setButtonEvents
  L5_5 = "Button_RepairAll"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setMainWeapon
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setSubWeapon
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setPouch
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setBadolier
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setThrowWeapon
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setHead
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setBody
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setBodyInner
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setHands
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setWaist
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setLegs
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setLegsInner
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setFeet
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setEarR
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setNeck
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setIndexL
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setIndexR
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.setWristR
  L5_5 = 0
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6, false, false, false, false)
  L4_4 = A0_0
  L3_3 = A0_0.maskSlot
  L5_5 = "Button_LargePouch"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L4_4 = A0_0
  L3_3 = A0_0.maskSlot
  L5_5 = "Button_SmallPouch"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L4_4 = A0_0
  L3_3 = A0_0.maskSlot
  L5_5 = "Button_ThrowingWeapon"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L4_4 = A0_0
  L3_3 = A0_0.maskSlot
  L5_5 = "Button_Undershirt"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L4_4 = A0_0
  L3_3 = A0_0.maskSlot
  L5_5 = "Button_Undergarment"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L4_4 = A0_0
  L3_3 = A0_0.setModal
  L5_5 = true
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setVisibility
  L5_5 = "TextBlock_SkillRank"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L4_4 = A0_0
  L3_3 = A0_0.setVisibility
  L5_5 = "Grid_GrandCompany"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  if A1_1 ~= nil then
    L4_4 = A1_1
    L3_3 = A1_1._isAlive
    L3_3 = L3_3(L4_4)
    if L3_3 == true then
      L4_4 = A0_0
      L3_3 = A0_0.setCharaName
      L5_5 = A1_1
      L3_3(L4_4, L5_5)
      L4_4 = A0_0
      L3_3 = A0_0.setCharaSkillName
      L5_5 = A1_1
      L3_3(L4_4, L5_5)
      L4_4 = A1_1
      L3_3 = A1_1.getRepairType
      L3_3 = L3_3(L4_4)
      L5_5 = A0_0
      L4_4 = A0_0.displayRepairEquipmentSlotIcon
      L6_6 = L3_3
      L4_4(L5_5, L6_6)
    end
  end
  L4_4 = L2_2
  L3_3 = L2_2.getStateMainSkill
  L3_3 = L3_3(L4_4)
  L5_5 = L2_2
  L4_4 = L2_2.getMainClassOrJob
  L4_4 = L4_4(L5_5)
  L6_6 = L2_2
  L5_5 = L2_2.getStateMainSkillLevel
  L5_5 = L5_5(L6_6)
  L6_6 = desktopWidget
  L6_6 = L6_6.getSkillIcon
  L6_6 = L6_6(L6_6, L4_4)
  if L3_3 == L4_4 then
    L4_4 = 0
  end
  A0_0:setText("TextBlock_Class_Level", 231, L3_3, L5_5, L4_4)
  A0_0:setIcon("IconControl_ClassIcon", L6_6)
  A0_0:setWindowFocus("Button_PrimaryArm")
  A0_0.work.firsttime = true
end
function RepairEquipmentWidget.setCharaName(A0_7, A1_8)
  local L2_9
  L2_9 = desktopWidget
  L2_9 = L2_9.getActorName
  L2_9 = L2_9(L2_9, A1_8)
  A0_7:setText("TextBlock_PlayerName", L2_9)
end
function RepairEquipmentWidget.setCharaSkillName(A0_10, A1_11)
  local L2_12, L3_13, L4_14
  L3_13 = A1_11
  L2_12 = A1_11.getStateMainSkill
  L2_12 = L2_12(L3_13)
  L4_14 = A1_11
  L3_13 = A1_11.getMainClassOrJob
  L3_13 = L3_13(L4_14)
  if L2_12 == L3_13 then
    L3_13 = 0
  end
  L4_14 = A1_11.getStateMainSkillLevel
  L4_14 = L4_14(A1_11)
  A0_10:setText("TextBlock_SkillRank", 231, L2_12, L4_14, L3_13)
end
function RepairEquipmentWidget.setEquipSlotIcon(A0_15, A1_16, A2_17, A3_18, A4_19)
  if A2_17 ~= nil and A2_17 > 0 then
    A0_15:setVisibility(A1_16, true)
    A0_15:setIcon(A1_16, A2_17)
    if A3_18 ~= nil then
      A0_15:setHidden(A3_18)
    end
  else
    A0_15:setVisibility(A1_16, false)
    A0_15:setIcon(A1_16, 0)
    if A3_18 ~= nil and A4_19 ~= nil then
      A0_15:setIcon(A3_18, A4_19)
      A0_15:setVisibility(A3_18, true)
    end
  end
end
function RepairEquipmentWidget.setMainWeapon(A0_20, A1_21, A2_22, A3_23, A4_24, A5_25, A6_26)
  A0_20:setEquipSlotIcon("Button_PrimaryArm:IconControl_EquipIcon", A1_21, "Button_PrimaryArm:IconControl_EquipIconBase", 359)
  A0_20:setVisibility("Button_PrimaryArm" .. ":Border_ItemLife_EquipIconCaution", A2_22)
  A0_20:setVisibility("Button_PrimaryArm" .. ":Border_ItemLife_EquipIconDanger", A3_23)
  A0_20:setVisibility("Button_PrimaryArm" .. ":IconControl_PolishMAX", A4_24)
  A0_20:setVisibility("Button_PrimaryArm" .. ":IconControl_Materia", A5_25)
end
function RepairEquipmentWidget.setSubWeapon(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32, A6_33)
  A0_27:setEquipSlotIcon("Button_SecondaryArm:IconControl_EquipIcon", A1_28, "Button_SecondaryArm:IconControl_EquipIconBase", 361)
  A0_27:setVisibility("Button_SecondaryArm" .. ":Border_ItemLife_EquipIconCaution", A2_29)
  A0_27:setVisibility("Button_SecondaryArm" .. ":Border_ItemLife_EquipIconDanger", A3_30)
  A0_27:setVisibility("Button_SecondaryArm" .. ":IconControl_PolishMAX", A4_31)
  A0_27:setVisibility("Button_SecondaryArm" .. ":IconControl_Materia", A5_32)
end
function RepairEquipmentWidget.setPouch(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39, A6_40)
  A0_34:setEquipSlotIcon("Button_LargePouch:IconControl_EquipIcon", A1_35, "Button_LargePouch:IconControl_EquipIconBase", 360)
  A0_34:setVisibility("Button_LargePouch" .. ":Border_ItemLife_EquipIconCaution", A2_36)
  A0_34:setVisibility("Button_LargePouch" .. ":Border_ItemLife_EquipIconDanger", A3_37)
  A0_34:setVisibility("Button_LargePouch" .. ":IconControl_PolishMAX", A4_38)
  A0_34:setVisibility("Button_LargePouch" .. ":IconControl_Materia", A5_39)
end
function RepairEquipmentWidget.setBadolier(A0_41, A1_42, A2_43, A3_44, A4_45, A5_46, A6_47)
  A0_41:setEquipSlotIcon("Button_SmallPouch:IconControl_EquipIcon", A1_42, "Button_SmallPouch:IconControl_EquipIconBase", 362)
  A0_41:setVisibility("Button_SmallPouch" .. ":Border_ItemLife_EquipIconCaution", A2_43)
  A0_41:setVisibility("Button_SmallPouch" .. ":Border_ItemLife_EquipIconDanger", A3_44)
  A0_41:setVisibility("Button_SmallPouch" .. ":IconControl_PolishMAX", A4_45)
  A0_41:setVisibility("Button_SmallPouch" .. ":IconControl_Materia", A5_46)
end
function RepairEquipmentWidget.setThrowWeapon(A0_48, A1_49, A2_50, A3_51, A4_52, A5_53, A6_54)
  A0_48:setEquipSlotIcon("Button_ThrowingWeapon:IconControl_EquipIcon", A1_49, "Button_ThrowingWeapon:IconControl_EquipIconBase", 363)
  A0_48:setVisibility("Button_ThrowingWeapon" .. ":Border_ItemLife_EquipIconCaution", A2_50)
  A0_48:setVisibility("Button_ThrowingWeapon" .. ":Border_ItemLife_EquipIconDanger", A3_51)
  A0_48:setVisibility("Button_ThrowingWeapon" .. ":IconControl_PolishMAX", A4_52)
  A0_48:setVisibility("Button_ThrowingWeapon" .. ":IconControl_Materia", A5_53)
end
function RepairEquipmentWidget.setHead(A0_55, A1_56, A2_57, A3_58, A4_59, A5_60, A6_61)
  A0_55:setEquipSlotIcon("Button_Head:IconControl_EquipIcon", A1_56, "Button_Head:IconControl_EquipIconBase", 364)
  A0_55:setVisibility("Button_Head" .. ":Border_ItemLife_EquipIconCaution", A2_57)
  A0_55:setVisibility("Button_Head" .. ":Border_ItemLife_EquipIconDanger", A3_58)
  A0_55:setVisibility("Button_Head" .. ":IconControl_PolishMAX", A4_59)
  A0_55:setVisibility("Button_Head" .. ":IconControl_Materia", A5_60)
end
function RepairEquipmentWidget.setBody(A0_62, A1_63, A2_64, A3_65, A4_66, A5_67, A6_68)
  A0_62:setEquipSlotIcon("Button_Body:IconControl_EquipIcon", A1_63, "Button_Body:IconControl_EquipIconBase", 365)
  A0_62:setVisibility("Button_Body" .. ":Border_ItemLife_EquipIconCaution", A2_64)
  A0_62:setVisibility("Button_Body" .. ":Border_ItemLife_EquipIconDanger", A3_65)
  A0_62:setVisibility("Button_Body" .. ":IconControl_PolishMAX", A4_66)
  A0_62:setVisibility("Button_Body" .. ":IconControl_Materia", A5_67)
end
function RepairEquipmentWidget.setBodyInner(A0_69, A1_70, A2_71, A3_72, A4_73, A5_74, A6_75)
  A0_69:setEquipSlotIcon("Button_Undershirt:IconControl_EquipIcon", A1_70, "Button_Undershirt:IconControl_EquipIconBase", 366)
  A0_69:setVisibility("Button_Undershirt" .. ":Border_ItemLife_EquipIconCaution", A2_71)
  A0_69:setVisibility("Button_Undershirt" .. ":Border_ItemLife_EquipIconDanger", A3_72)
  A0_69:setVisibility("Button_Undershirt" .. ":IconControl_PolishMAX", A4_73)
  A0_69:setVisibility("Button_Undershirt" .. ":IconControl_Materia", A5_74)
end
function RepairEquipmentWidget.setHands(A0_76, A1_77, A2_78, A3_79, A4_80, A5_81, A6_82)
  A0_76:setEquipSlotIcon("Button_Hands:IconControl_EquipIcon", A1_77, "Button_Hands:IconControl_EquipIconBase", 367)
  A0_76:setVisibility("Button_Hands" .. ":Border_ItemLife_EquipIconCaution", A2_78)
  A0_76:setVisibility("Button_Hands" .. ":Border_ItemLife_EquipIconDanger", A3_79)
  A0_76:setVisibility("Button_Hands" .. ":IconControl_PolishMAX", A4_80)
  A0_76:setVisibility("Button_Hands" .. ":IconControl_Materia", A5_81)
end
function RepairEquipmentWidget.setWaist(A0_83, A1_84, A2_85, A3_86, A4_87, A5_88, A6_89)
  A0_83:setEquipSlotIcon("Button_Waist:IconControl_EquipIcon", A1_84, "Button_Waist:IconControl_EquipIconBase", 368)
  A0_83:setVisibility("Button_Waist" .. ":Border_ItemLife_EquipIconCaution", A2_85)
  A0_83:setVisibility("Button_Waist" .. ":Border_ItemLife_EquipIconDanger", A3_86)
  A0_83:setVisibility("Button_Waist" .. ":IconControl_PolishMAX", A4_87)
  A0_83:setVisibility("Button_Waist" .. ":IconControl_Materia", A5_88)
end
function RepairEquipmentWidget.setLegs(A0_90, A1_91, A2_92, A3_93, A4_94, A5_95, A6_96)
  A0_90:setEquipSlotIcon("Button_Legs:IconControl_EquipIcon", A1_91, "Button_Legs:IconControl_EquipIconBase", 369)
  A0_90:setVisibility("Button_Legs" .. ":Border_ItemLife_EquipIconCaution", A2_92)
  A0_90:setVisibility("Button_Legs" .. ":Border_ItemLife_EquipIconDanger", A3_93)
  A0_90:setVisibility("Button_Legs" .. ":IconControl_PolishMAX", A4_94)
  A0_90:setVisibility("Button_Legs" .. ":IconControl_Materia", A5_95)
end
function RepairEquipmentWidget.setLegsInner(A0_97, A1_98, A2_99, A3_100, A4_101, A5_102, A6_103)
  A0_97:setEquipSlotIcon("Button_Undergarment:IconControl_EquipIcon", A1_98, "Button_Undergarment:IconControl_EquipIconBase", 370)
  A0_97:setVisibility("Button_Undergarment" .. ":Border_ItemLife_EquipIconCaution", A2_99)
  A0_97:setVisibility("Button_Undergarment" .. ":Border_ItemLife_EquipIconDanger", A3_100)
  A0_97:setVisibility("Button_Undergarment" .. ":IconControl_PolishMAX", A4_101)
  A0_97:setVisibility("Button_Undergarment" .. ":IconControl_Materia", A5_102)
end
function RepairEquipmentWidget.setFeet(A0_104, A1_105, A2_106, A3_107, A4_108, A5_109, A6_110)
  A0_104:setEquipSlotIcon("Button_Feet:IconControl_EquipIcon", A1_105, "Button_Feet:IconControl_EquipIconBase", 371)
  A0_104:setVisibility("Button_Feet" .. ":Border_ItemLife_EquipIconCaution", A2_106)
  A0_104:setVisibility("Button_Feet" .. ":Border_ItemLife_EquipIconDanger", A3_107)
  A0_104:setVisibility("Button_Feet" .. ":IconControl_PolishMAX", A4_108)
  A0_104:setVisibility("Button_Feet" .. ":IconControl_Materia", A5_109)
end
function RepairEquipmentWidget.setEarR(A0_111, A1_112, A2_113, A3_114, A4_115, A5_116, A6_117)
  A0_111:setEquipSlotIcon("Button_Accessories_RightEar:IconControl_EquipIcon", A1_112, "Button_Accessories_RightEar:IconControl_EquipIconBase", 372)
  A0_111:setVisibility("Button_Accessories_RightEar" .. ":Border_ItemLife_EquipIconCaution", A2_113)
  A0_111:setVisibility("Button_Accessories_RightEar" .. ":Border_ItemLife_EquipIconDanger", A3_114)
  A0_111:setVisibility("Button_Accessories_RightEar" .. ":IconControl_PolishMAX", A4_115)
  A0_111:setVisibility("Button_Accessories_RightEar" .. ":IconControl_Materia", A5_116)
end
function RepairEquipmentWidget.setNeck(A0_118, A1_119, A2_120, A3_121, A4_122, A5_123, A6_124)
  A0_118:setEquipSlotIcon("Button_Accessories_Neck:IconControl_EquipIcon", A1_119, "Button_Accessories_Neck:IconControl_EquipIconBase", 373)
  A0_118:setVisibility("Button_Accessories_Neck" .. ":Border_ItemLife_EquipIconCaution", A2_120)
  A0_118:setVisibility("Button_Accessories_Neck" .. ":Border_ItemLife_EquipIconDanger", A3_121)
  A0_118:setVisibility("Button_Accessories_Neck" .. ":IconControl_PolishMAX", A4_122)
  A0_118:setVisibility("Button_Accessories_Neck" .. ":IconControl_Materia", A5_123)
end
function RepairEquipmentWidget.setIndexL(A0_125, A1_126, A2_127, A3_128, A4_129, A5_130, A6_131)
  A0_125:setEquipSlotIcon("Button_Accessories_LeftFinger_1:IconControl_EquipIcon", A1_126, "Button_Accessories_LeftFinger_1:IconControl_EquipIconBase", 374)
  A0_125:setVisibility("Button_Accessories_LeftFinger_1" .. ":Border_ItemLife_EquipIconCaution", A2_127)
  A0_125:setVisibility("Button_Accessories_LeftFinger_1" .. ":Border_ItemLife_EquipIconDanger", A3_128)
  A0_125:setVisibility("Button_Accessories_LeftFinger_1" .. ":IconControl_PolishMAX", A4_129)
  A0_125:setVisibility("Button_Accessories_LeftFinger_1" .. ":IconControl_Materia", A5_130)
end
function RepairEquipmentWidget.setIndexR(A0_132, A1_133, A2_134, A3_135, A4_136, A5_137, A6_138)
  A0_132:setEquipSlotIcon("Button_Accessories_RightFinger_1:IconControl_EquipIcon", A1_133, "Button_Accessories_RightFinger_1:IconControl_EquipIconBase", 374)
  A0_132:setVisibility("Button_Accessories_RightFinger_1" .. ":Border_ItemLife_EquipIconCaution", A2_134)
  A0_132:setVisibility("Button_Accessories_RightFinger_1" .. ":Border_ItemLife_EquipIconDanger", A3_135)
  A0_132:setVisibility("Button_Accessories_RightFinger_1" .. ":IconControl_PolishMAX", A4_136)
  A0_132:setVisibility("Button_Accessories_RightFinger_1" .. ":IconControl_Materia", A5_137)
end
function RepairEquipmentWidget.setWristR(A0_139, A1_140, A2_141, A3_142, A4_143, A5_144, A6_145)
  A0_139:setEquipSlotIcon("Button_Accessories_RightBracelet:IconControl_EquipIcon", A1_140, "Button_Accessories_RightBracelet:IconControl_EquipIconBase", 375)
  A0_139:setVisibility("Button_Accessories_RightBracelet" .. ":Border_ItemLife_EquipIconCaution", A2_141)
  A0_139:setVisibility("Button_Accessories_RightBracelet" .. ":Border_ItemLife_EquipIconDanger", A3_142)
  A0_139:setVisibility("Button_Accessories_RightBracelet" .. ":IconControl_PolishMAX", A4_143)
  A0_139:setVisibility("Button_Accessories_RightBracelet" .. ":IconControl_Materia", A5_144)
end
function RepairEquipmentWidget.setPSNID(A0_146)
  A0_146:setUserWorkInt(1, nil, "CustomControl_PSNIDLabel", 1)
  A0_146:setUserWorkInt(1, nil, "CustomControl_PSNIDNameLabel", 1)
end
function RepairEquipmentWidget.processUpdateItemInformation(A0_147, A1_148, A2_149, A3_150)
  local L4_151, L5_152, L6_153, L7_154, L8_155, L9_156, L10_157, L11_158, L12_159, L13_160, L14_161
  L5_152 = A0_147
  L4_151 = A0_147.getArgActor
  L4_151 = L4_151(L5_152)
  if A1_148 ~= L4_151 then
    return
  end
  if A2_149 ~= -1 then
    return
  end
  L5_152 = A1_148
  L4_151 = A1_148._getEquippingItem
  L6_153 = A3_150
  L4_151 = L4_151(L5_152, L6_153)
  L5_152 = nil
  L6_153 = false
  L7_154 = false
  L8_155 = false
  L9_156 = 0
  L10_157 = 0
  L11_158 = false
  L12_159 = false
  L13_160 = nil
  if L4_151 == nil then
    L5_152 = nil
  else
    L14_161 = L4_151.getItemIcon
    L14_161 = L14_161(L4_151)
    L5_152 = L14_161
    L6_153 = true
    L14_161 = false
    L14_161 = L4_151:getMaterializePermission()
    if L4_151:getNormalItemFitness() == 10000 then
      L7_154 = A0_147.work.materialiseVisible and L14_161
    end
    if 0 < desktopWidget:getItemMateriaAttachInfo(L4_151) then
      L8_155 = true
    end
    L9_156, L10_157, L11_158, L12_159, L13_160 = desktopWidget:getItemLifeParam(A0_147, L4_151)
  end
  L14_161 = A3_150
  if L14_161 == 1 then
    A0_147:setMainWeapon(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
    if A0_147.work.firsttime == true then
      A0_147.work.firsttime = false
      A0_147:setButtonEnable("Button_PrimaryArm")
      A0_147:setButtonEnable("Button_LargePouch")
      A0_147:setButtonEnable("Button_SecondaryArm")
      A0_147:setButtonEnable("Button_SmallPouch")
      A0_147:setButtonEnable("Button_ThrowingWeapon")
      A0_147:setButtonEnable("Button_Head")
      A0_147:setButtonEnable("Button_Body")
      A0_147:setButtonEnable("Button_Undershirt")
      A0_147:setButtonEnable("Button_Hands")
      A0_147:setButtonEnable("Button_Waist")
      A0_147:setButtonEnable("Button_Legs")
      A0_147:setButtonEnable("Button_Undergarment")
      A0_147:setButtonEnable("Button_Feet")
      A0_147:setButtonEnable("Button_Accessories_RightEar")
      A0_147:setButtonEnable("Button_Accessories_Neck")
      A0_147:setButtonEnable("Button_Accessories_RightFinger_1")
      A0_147:setButtonEnable("Button_Accessories_RightBracelet")
      A0_147:setButtonEnable("Button_Accessories_LeftFinger_1")
      do break end
      else
      end
      if L14_161 == 2 then
        A0_147:setSubWeapon(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 5 then
        A0_147:setThrowWeapon(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 6 then
        A0_147:setPouch(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 7 then
        A0_147:setBadolier(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 9 then
        A0_147:setHead(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 11 then
        A0_147:setBody(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 10 then
        A0_147:setBodyInner(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 13 then
        A0_147:setLegs(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 12 then
        A0_147:setLegsInner(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 14 then
        A0_147:setHands(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 15 then
        A0_147:setFeet(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 16 then
        A0_147:setWaist(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 18 then
        A0_147:setEarR(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 17 then
        A0_147:setNeck(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 23 then
        A0_147:setIndexL(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 22 then
        A0_147:setIndexR(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      if L14_161 == 20 then
        A0_147:setWristR(L5_152, L11_158, L12_159, L7_154, L8_155, L6_153)
        break
      else
      end
      return
    end
  L14_161 = A0_147.work
  L14_161 = L14_161.detailSlot
  if L14_161 == A3_150 then
    L14_161 = A0_147.displaySlotItemHelp
    L14_161(A0_147, A0_147.work.detailSlot)
  end
  L14_161 = A1_148.getRepairType
  L14_161 = L14_161(A1_148)
  A0_147:displayRepairEquipmentSlotIcon(L14_161)
end
function RepairEquipmentWidget.setButtonEvents(A0_162, A1_163)
  local L2_164
  L2_164 = A0_162.getControlProperty
  L2_164 = L2_164(A0_162, A1_163, "Command")
  A0_162:setControlCommandCondition(A1_163, L2_164)
  A0_162:setControlCommandCondition(A1_163, "UILuaCommands.ButtonFocused")
  A0_162:setCancelCondition(A1_163, "UILuaCommands.Cancel")
  A0_162:setConfirmCondition(A1_163)
  if A1_163 ~= "Button_PrimaryArm" and A1_163 ~= "Button_RepairAll" then
    A0_162:setControlProperty(A1_163 .. ":Label_HoverEffect", "IsTabStop", false)
    A0_162:setControlProperty(A1_163 .. ":Label_HoverEffect", "Focusable", false)
  end
end
function RepairEquipmentWidget.setButtonEnable(A0_165, A1_166)
  A0_165:setControlProperty(A1_166 .. ":Label_HoverEffect", "IsTabStop", true)
  A0_165:setControlProperty(A1_166 .. ":Label_HoverEffect", "Focusable", true)
end
function RepairEquipmentWidget.isCreateCancel(A0_167)
  return A0_167.work.isCreateCancel
end
function RepairEquipmentWidget.setWindowFocus(A0_168, A1_169)
  if A1_169 ~= nil and A1_169 ~= "" then
    A0_168:setLogicalFocus(A1_169)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_168 then
      A0_168:setKeyboardFocusedControl(A1_169)
    end
  end
end
function RepairEquipmentWidget.slotNameToEquipSlotNum(A0_170, A1_171)
  local L2_172
  if A1_171 == "Button_PrimaryArm" then
    L2_172 = 1
    return L2_172
  elseif A1_171 == "Button_LargePouch" then
    L2_172 = 6
    return L2_172
  elseif A1_171 == "Button_SecondaryArm" then
    L2_172 = 2
    return L2_172
  elseif A1_171 == "Button_SmallPouch" then
    L2_172 = 7
    return L2_172
  elseif A1_171 == "Button_ThrowingWeapon" then
    L2_172 = 5
    return L2_172
  elseif A1_171 == "Button_Head" then
    L2_172 = 9
    return L2_172
  elseif A1_171 == "Button_Body" then
    L2_172 = 11
    return L2_172
  elseif A1_171 == "Button_Undershirt" then
    L2_172 = 10
    return L2_172
  elseif A1_171 == "Button_Hands" then
    L2_172 = 14
    return L2_172
  elseif A1_171 == "Button_Waist" then
    L2_172 = 16
    return L2_172
  elseif A1_171 == "Button_Legs" then
    L2_172 = 13
    return L2_172
  elseif A1_171 == "Button_Undergarment" then
    L2_172 = 12
    return L2_172
  elseif A1_171 == "Button_Feet" then
    L2_172 = 15
    return L2_172
  elseif A1_171 == "Button_Accessories_RightEar" then
    L2_172 = 18
    return L2_172
  elseif A1_171 == "Button_Accessories_Neck" then
    L2_172 = 17
    return L2_172
  elseif A1_171 == "Button_Accessories_RightFinger_1" then
    L2_172 = 22
    return L2_172
  elseif A1_171 == "Button_Accessories_RightBracelet" then
    L2_172 = 20
    return L2_172
  elseif A1_171 == "Button_Accessories_LeftFinger_1" then
    L2_172 = 23
    return L2_172
  else
    L2_172 = 0
    return L2_172
  end
end
function RepairEquipmentWidget.processUICommandOperate(A0_173, A1_174, A2_175, A3_176, A4_177)
  local L5_178, L6_179, L7_180
  L5_178 = A0_173.work
  L5_178 = L5_178.firsttime
  if L5_178 == true then
    L6_179 = A0_173
    L5_178 = A0_173.setWindowFocus
    L7_180 = "Button_PrimaryArm"
    L5_178(L6_179, L7_180)
    return
  end
  L5_178 = A0_173.work
  L5_178 = L5_178.lastcommand
  L6_179 = worldMaster
  L7_180 = L6_179
  L6_179 = L6_179._getServerTime
  L6_179 = L6_179(L7_180)
  if L5_178 >= L6_179 then
    return
  end
  if A2_175 == "Button_RepairAll" then
    L6_179 = A0_173
    L5_178 = A0_173.getArgActor
    L5_178 = L5_178(L6_179)
    if L5_178 ~= nil then
      L7_180 = L5_178
      L6_179 = L5_178.getRepairType
      L6_179 = L6_179(L7_180)
      L7_180 = 0
      if L6_179 == 1 then
        L7_180 = 27
        break
      else
      end
      if L6_179 == 2 then
        L7_180 = 27
        break
      else
      end
      if L6_179 == 3 then
        L7_180 = 27
        do break end
        break
      else
      end
      if desktopWidget:executePlayerCommand(24244, L7_180, nil, nil, nil, L5_178) == true then
        A0_173.work.lastcommand = worldMaster:_getServerTime()
      end
    else
      L6_179 = desktopWidget
      L7_180 = L6_179
      L6_179 = L6_179.closeWidgetDirect
      L6_179(L7_180, A0_173)
    end
  else
    L6_179 = A0_173
    L5_178 = A0_173.slotNameToEquipSlotNum
    L7_180 = A2_175
    L5_178 = L5_178(L6_179, L7_180)
    if L5_178 == 0 then
      return
    end
    if L5_178 == 6 or L5_178 == 7 or L5_178 == 5 or L5_178 == 10 or L5_178 == 12 then
      L6_179 = worldMaster
      L7_180 = L6_179
      L6_179 = L6_179.alert
      L6_179(L7_180, worldMaster, 40272)
      return
    end
    L6_179 = worldMaster
    L7_180 = L6_179
    L6_179 = L6_179._getMyPlayer
    L6_179 = L6_179(L7_180)
    L7_180 = A0_173.getArgActor
    L7_180 = L7_180(A0_173)
    if L7_180 ~= nil then
      if L7_180:_getEquippingItem(L5_178) == nil then
      elseif not L7_180:_getEquippingItem(L5_178):isRepairable() then
      elseif L7_180:_getEquippingItem(L5_178):getItemLife() == L7_180:_getEquippingItem(L5_178):getItemLifeMax() then
      elseif L7_180:_getEquippingItem(L5_178):getItemRepairSkill() ~= L6_179:getStateMainSkill() then
      else
        if L7_180:_getEquippingItem(L5_178):getItemRepairLevel() > L6_179:getStateMainSkillLevel() then
        else
        end
      end
      if desktopWidget:executePlayerCommand(24244, L5_178, nil, nil, nil, L7_180) == true then
        A0_173.work.lastcommand = worldMaster:_getServerTime()
      end
    else
    end
  end
end
function RepairEquipmentWidget.processUICommandDefault(A0_181, A1_182, A2_183, A3_184, A4_185, A5_186)
  local L6_187, L7_188, L8_189
  L6_187 = A3_184
  if L6_187 == "UILuaCommands.Shown" then
    L8_189 = A0_181
    L7_188 = A0_181.getArgActor
    L7_188 = L7_188(L8_189)
    if L7_188 == nil then
      L8_189 = desktopWidget
      L8_189 = L8_189.closeWidgetDirect
      L8_189(L8_189, A0_181)
    end
    L8_189 = worldMaster
    L8_189 = L8_189._getMyPlayer
    L8_189 = L8_189(L8_189)
    if L8_189:isEventPlaying() then
      A0_181.work.firsttime = true
      desktopWidget:closeWidgetDirect(A0_181)
      return
    else
      if A0_181.work.firsttime == true and desktopWidget:executePlayerSystemCommand(24238, nil, nil, L7_188) == false then
        desktopWidget:closeWidgetDirect(A0_181)
        do return end
        do break end
        else
        end
        if L6_187 == "UILuaCommands.ButtonFocused" then
          L8_189 = A0_181
          L7_188 = A0_181.getArgActor
          L7_188 = L7_188(L8_189)
          if L7_188 == nil then
            L8_189 = desktopWidget
            L8_189 = L8_189.closeWidgetDirect
            L8_189(L8_189, A0_181)
            return
          end
          if A2_183 == "Button_RepairAll" then
            L8_189 = A0_181.getChildWidgetByWindowName
            L8_189 = L8_189(A0_181, "ItemDetailWidget")
            if L8_189 ~= nil then
              L8_189:displayEmpty(7)
              L8_189:setText("TextBlock_Help", 3675)
              L8_189:setVisibility("Grid_Help", true)
              L8_189:setVisibility("Grid_ActorName", false)
              L8_189:setText("TextBlock_Title", 3674)
            end
          else
            L8_189 = A0_181.slotNameToEquipSlotNum
            L8_189 = L8_189(A0_181, A2_183)
            A0_181:displaySlotItemHelp(L8_189)
          end
        else
        end
      else
      end
    end
  L6_187 = A0_181.work
  L6_187 = L6_187.firsttime
  if L6_187 == true then
    L7_188 = A0_181
    L6_187 = A0_181.setWindowFocus
    L8_189 = "Button_PrimaryArm"
    L6_187(L7_188, L8_189)
  end
end
function RepairEquipmentWidget.setDetailPosition(A0_190)
  local L1_191, L2_192, L3_193, L4_194, L5_195, L6_196, L7_197, L8_198, L9_199, L10_200, L11_201, L12_202, L13_203, L14_204, L15_205, L16_206
  L2_192 = A0_190
  L1_191 = A0_190.getChildWidgetByWindowName
  L3_193 = "ItemDetailWidget"
  L1_191 = L1_191(L2_192, L3_193)
  if L1_191 ~= nil then
    L3_193 = L1_191
    L2_192 = L1_191.setProperty
    L4_194 = "Margin"
    L5_195 = "0,0,0,0"
    L2_192(L3_193, L4_194, L5_195)
    L3_193 = A0_190
    L2_192 = A0_190.getWindowPosition
    L3_193 = L2_192(L3_193)
    L5_195 = A0_190
    L4_194 = A0_190.getWindowSize
    L5_195 = L4_194(L5_195)
    L6_196 = desktopWidget
    L7_197 = L6_196
    L6_196 = L6_196.getWindowSize
    L7_197 = L6_196(L7_197)
    L9_199 = L1_191
    L8_198 = L1_191.getWindowSize
    L9_199 = L8_198(L9_199)
    if L8_198 == 0 then
      L8_198 = 382
    end
    if L9_199 == 0 then
      L9_199 = 280
    end
    L10_200 = L6_196 * 0.05
    L2_192 = L2_192 + L10_200
    L10_200 = L7_197 * 0.05
    L3_193 = L3_193 + L10_200
    L10_200 = L6_196 * 0.95
    L11_201 = L6_196 * 0.1
    L12_202 = L7_197 * 0.95
    L13_203 = L7_197 * 0.1
    L14_204 = L3_193 + 20
    L15_205 = L3_193 + 300
    L16_206 = L2_192 + L4_194
    if L10_200 < L16_206 + L8_198 then
      L16_206 = L16_206 - (L16_206 + L8_198 - L10_200)
    end
    if L12_202 < L15_205 then
      L14_204 = L14_204 - (L15_205 - L12_202)
    end
    if L16_206 < L2_192 + L4_194 - 20 then
      L16_206 = L2_192 - L8_198
    end
    L1_191:setProperty("Top", L14_204)
    L1_191:setProperty("Left", L16_206)
  end
end
function RepairEquipmentWidget.displaySlotItemHelp(A0_207, A1_208)
  local L2_209, L3_210, L4_211, L5_212, L6_213
  if A1_208 < 0 then
    return
  end
  L3_210 = A0_207
  L2_209 = A0_207.getChildWidgetByWindowName
  L4_211 = "ItemDetailWidget"
  L2_209 = L2_209(L3_210, L4_211)
  L4_211 = A0_207
  L3_210 = A0_207.setDetailPosition
  L3_210(L4_211)
  L4_211 = L2_209
  L3_210 = L2_209.setText
  L5_212 = "TextBlock_RepairCostHeader"
  L6_213 = 3683
  L3_210(L4_211, L5_212, L6_213)
  L4_211 = A0_207
  L3_210 = A0_207.getArgActor
  L3_210 = L3_210(L4_211)
  if L3_210 == nil then
    L4_211 = desktopWidget
    L5_212 = L4_211
    L4_211 = L4_211.closeWidgetDirect
    L6_213 = A0_207
    return L4_211(L5_212, L6_213)
  end
  L5_212 = L3_210
  L4_211 = L3_210._getEquippingItem
  L6_213 = A1_208
  L4_211 = L4_211(L5_212, L6_213)
  if L4_211 ~= nil then
    L5_212 = A0_207.work
    L5_212 = L5_212.firsttime
    if L5_212 == false then
      L6_213 = L2_209
      L5_212 = L2_209.displayItemHelp
      L5_212(L6_213, L4_211, 0, 0, 7, A1_208)
      if A1_208 == 6 or A1_208 == 7 or A1_208 == 5 or A1_208 == 10 or A1_208 == 12 then
        L6_213 = L2_209
        L5_212 = L2_209.setText
        L5_212(L6_213, "TextBlock_Help", 3680)
      else
        L5_212 = worldMaster
        L6_213 = L5_212
        L5_212 = L5_212._getMyPlayer
        L5_212 = L5_212(L6_213)
        L6_213 = L4_211.getItemLife
        L6_213 = L6_213(L4_211)
        if L6_213 == L4_211:getItemLifeMax() then
          L6_213 = L2_209.setText
          L6_213(L2_209, "TextBlock_Help", 3678)
        else
          L6_213 = L4_211.getItemRepairSkill
          L6_213 = L6_213(L4_211)
          if L6_213 ~= L5_212:getStateMainSkill() then
            L6_213 = L2_209.setText
            L6_213(L2_209, "TextBlock_Help", 3677)
          else
            L6_213 = L4_211.getItemRepairLevel
            L6_213 = L6_213(L4_211)
            if L6_213 > L5_212:getStateMainSkillLevel() then
              L6_213 = L2_209.setText
              L6_213(L2_209, "TextBlock_Help", 3677)
            else
              L6_213 = L2_209.setText
              L6_213(L2_209, "TextBlock_Help", 3676)
            end
          end
        end
        L6_213 = L4_211.getRepairAmount
        L6_213 = L6_213(L4_211)
        L2_209:setText("TextBlock_RepairCostGil", 3263, L6_213)
        L2_209:setVisibility("Grid_RepairCost", true)
      end
      L6_213 = L2_209
      L5_212 = L2_209.setVisibility
      L5_212(L6_213, "Grid_Help", true)
    end
  else
    L6_213 = L2_209
    L5_212 = L2_209.displayEmpty
    L5_212(L6_213, 7)
    L6_213 = L2_209
    L5_212 = L2_209.setText
    L5_212(L6_213, "TextBlock_Help", 3679)
    L6_213 = L2_209
    L5_212 = L2_209.setText
    L5_212(L6_213, "TextBlock_Title", 215, A1_208)
    L6_213 = L2_209
    L5_212 = L2_209.setVisibility
    L5_212(L6_213, "Grid_RepairCost", false)
  end
  L5_212 = A0_207.work
  L5_212.detailSlot = A1_208
  L6_213 = L2_209
  L5_212 = L2_209.show
  L5_212(L6_213)
  L6_213 = L2_209
  L5_212 = L2_209.setModal
  L5_212(L6_213, false)
  L5_212 = desktopWidget
  L6_213 = L5_212
  L5_212 = L5_212.changeFocusedWidget
  L5_212(L6_213, A0_207, true)
  L6_213 = L2_209
  L5_212 = L2_209.setVisibility
  L5_212(L6_213, "Grid_ActorName", false)
end
function RepairEquipmentWidget.displayRepairEquipmentSlotIcon(A0_214, A1_215)
  local L2_216, L3_217
  L2_216 = A1_215 == 1 or A1_215 == 3
  L3_217 = A1_215 == 2 or A1_215 == 3
  A0_214:displayRepairIcon("Button_LargePouch", false)
  A0_214:displayRepairIcon("Button_SmallPouch", false)
  A0_214:displayRepairIcon("Button_ThrowingWeapon", false)
  A0_214:displayRepairIcon("Button_Undershirt", false)
  A0_214:displayRepairIcon("Button_Undergarment", false)
  A0_214:displayRepairIcon("Button_PrimaryArm", L2_216)
  A0_214:displayRepairIcon("Button_SecondaryArm", L2_216)
  A0_214:displayRepairIcon("Button_Head", L3_217)
  A0_214:displayRepairIcon("Button_Body", L3_217)
  A0_214:displayRepairIcon("Button_Hands", L3_217)
  A0_214:displayRepairIcon("Button_Waist", L3_217)
  A0_214:displayRepairIcon("Button_Legs", L3_217)
  A0_214:displayRepairIcon("Button_Feet", L3_217)
  A0_214:displayRepairIcon("Button_Accessories_RightEar", L3_217)
  A0_214:displayRepairIcon("Button_Accessories_Neck", L3_217)
  A0_214:displayRepairIcon("Button_Accessories_RightFinger_1", L3_217)
  A0_214:displayRepairIcon("Button_Accessories_RightBracelet", L3_217)
  A0_214:displayRepairIcon("Button_Accessories_LeftFinger_1", L3_217)
end
function RepairEquipmentWidget.displayRepairIcon(A0_218, A1_219, A2_220)
  local L3_221, L4_222, L5_223, L6_224, L7_225, L8_226, L9_227, L10_228, L11_229
  L4_222 = A0_218
  L3_221 = A0_218.getArgActor
  L3_221 = L3_221(L4_222)
  if L3_221 == nil then
    L4_222 = desktopWidget
    L5_223 = L4_222
    L4_222 = L4_222.closeWidgetDirect
    L6_224 = A0_218
    L4_222(L5_223, L6_224)
  end
  L5_223 = L3_221
  L4_222 = L3_221._isAlive
  L4_222 = L4_222(L5_223)
  if not L4_222 then
    L4_222 = desktopWidget
    L5_223 = L4_222
    L4_222 = L4_222.closeWidgetDirect
    L6_224 = A0_218
    L4_222(L5_223, L6_224)
  end
  L5_223 = A0_218
  L4_222 = A0_218.slotNameToEquipSlotNum
  L6_224 = A1_219
  L4_222 = L4_222(L5_223, L6_224)
  L6_224 = A0_218
  L5_223 = A0_218.setVisibility
  L7_225 = A1_219
  L8_226 = ":IconControl_Repair"
  L7_225 = L7_225 .. L8_226
  L8_226 = A2_220
  L5_223(L6_224, L7_225, L8_226)
  L6_224 = L3_221
  L5_223 = L3_221._getEquippingItem
  L7_225 = L4_222
  L5_223 = L5_223(L6_224, L7_225)
  if L5_223 == nil then
    L7_225 = A0_218
    L6_224 = A0_218.setVisualOpacityColor
    L8_226 = A1_219
    L9_227 = ":IconControl_Repair"
    L8_226 = L8_226 .. L9_227
    L9_227 = 0.5
    L6_224(L7_225, L8_226, L9_227)
    L7_225 = A0_218
    L6_224 = A0_218.setVisibility
    L8_226 = A1_219
    L9_227 = ":IconControl_UnableToRepair"
    L8_226 = L8_226 .. L9_227
    L9_227 = false
    L6_224(L7_225, L8_226, L9_227)
    return
  end
  L7_225 = A0_218
  L6_224 = A0_218.setVisualOpacityColor
  L8_226 = A1_219
  L9_227 = ":IconControl_Repair"
  L8_226 = L8_226 .. L9_227
  L9_227 = 1
  L6_224(L7_225, L8_226, L9_227)
  L6_224 = worldMaster
  L7_225 = L6_224
  L6_224 = L6_224._getMyPlayer
  L6_224 = L6_224(L7_225)
  L8_226 = L6_224
  L7_225 = L6_224.getStateMainSkill
  L7_225 = L7_225(L8_226)
  L9_227 = L6_224
  L8_226 = L6_224.getStateMainSkillLevel
  L8_226 = L8_226(L9_227)
  L10_228 = L5_223
  L9_227 = L5_223.getItemRepairSkill
  L9_227 = L9_227(L10_228)
  L11_229 = L5_223
  L10_228 = L5_223.getItemRepairLevel
  L10_228 = L10_228(L11_229)
  L11_229 = true
  if L7_225 == L9_227 and L8_226 >= L10_228 then
    L11_229 = false
  end
  if L4_222 == 6 or L4_222 == 7 or L4_222 == 5 or L4_222 == 10 or L4_222 == 12 then
    L11_229 = false
  end
  A0_218:setVisibility(A1_219 .. ":IconControl_UnableToRepair", L11_229)
end
function RepairEquipmentWidget.maskSlot(A0_230, A1_231, A2_232)
  if A2_232 == false then
    A0_230:setVisualOpacityColor(A1_231 .. ":IconControl_EquipIconBase", 0.5)
    A0_230:setVisualOpacityColor(A1_231 .. ":IconControl_EquipIcon", 0.5)
  else
    A0_230:setVisualOpacityColor(A1_231 .. ":IconControl_EquipIconBase", 1)
    A0_230:setVisualOpacityColor(A1_231 .. ":IconControl_EquipIcon", 1)
    A0_230:setControlProperty(A1_231 .. ":Label_HoverEffect", "IsTabStop", true)
  end
end
function RepairEquipmentWidget.setVisualOpacityColor(A0_233, A1_234, A2_235)
  A0_233:setControlProperty(A1_234, "VisualOpacityBlue", A2_235)
  A0_233:setControlProperty(A1_234, "VisualOpacityGreen", A2_235)
  A0_233:setControlProperty(A1_234, "VisualOpacityRed", A2_235)
end
