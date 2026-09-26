require("/Widget/WidgetBaseClass")
_defineClass("CraftRecipeWidget", "WidgetBaseClass")
function CraftRecipeWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10, A11_11)
  local L12_12, L13_13, L14_14, L15_15, L16_16
  L15_15 = "chosenOperation"
  L16_16 = "integer8"
  L15_15 = {L16_16, "integer8"}
  L16_16 = "mode"
  L16_16 = {"items", "integer8"}
  L12_12._temp = L13_13
  L12_12.chosenOperation = -1
  L12_12.detailget = false
  L12_12.gridplace = false
  L12_12.gridlicense = false
  L12_12.gridcrystal = false
  L12_12.stack = 0
  L12_12(L13_13, L14_14)
  L12_12(L13_13, L14_14)
  L12_12(L13_13, L14_14)
  L12_12(L13_13, L14_14)
  L12_12(L13_13, L14_14)
  L12_12(L13_13, L14_14)
  L12_12(L13_13)
  for L15_15 = 1, 8 do
    L16_16 = "Item_"
    L16_16 = L16_16 .. tostring(L15_15)
    A0_0:setVisibility(L16_16, false)
    A0_0:setControlProperty(L16_16, "Focusable", false)
    A0_0:setControlProperty(L16_16, "IsTabStop", false)
  end
  L12_12(L13_13, L14_14)
  L12_12.items = 0
  if A10_10 == nil then
    L15_15 = A2_2
    L16_16 = A3_3
    L12_12(L13_13, L14_14, L15_15, L16_16, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9)
    L12_12.targetitem = A1_1
  else
    L15_15 = A3_3
    L16_16 = A4_4
    L12_12(L13_13, L14_14, L15_15, L16_16, A5_5, A6_6, A7_7, A8_8, A9_9)
    L15_15 = true
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = 3095
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = 3096
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = true
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L12_12.targetitem = A1_1
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L12_12.history = A10_10
    L12_12.index = A11_11
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L15_15 = false
    L12_12(L13_13, L14_14, L15_15)
    L12_12.mode = 1
  end
  L12_12(L13_13, L14_14)
end
function CraftRecipeWidget.processBeforeShow(A0_17, A1_18)
  if A1_18 ~= true and A0_17.work.targetitem ~= 0 then
    A0_17:displayItemHelp()
  end
  return true
end
function CraftRecipeWidget.processUICommandCancel(A0_19, A1_20, A2_21, A3_22, A4_23)
  if A0_19.work.chosenOperation ~= -1 then
    return
  end
  if A0_19:_getParentWidget() == nil then
    return
  end
  if A2_21 ~= "Button_Back" then
    A0_19:setKeyboardFocusedControl("Button_Back")
    return
  end
  if A0_19.work.mode == 0 then
    A0_19.work.chosenOperation = 0
    A0_19:_getParentWidget():setRecipeOperation(A0_19.work.chosenOperation)
  else
    A0_19:_getParentWidget():continueCraftEdit()
    if A0_19.work.detailget == true then
      A0_19:_getParentWidget():setRecipeOperation(0)
    else
      A0_19.work.chosenOperation = 0
      A0_19:_getParentWidget():getChildWidgetByWindowName("CraftEditWidget"):closeRecipeDetail()
      desktopWidget:closeWidgetDirect(A0_19)
    end
  end
end
function CraftRecipeWidget.processUICommandOperate(A0_24, A1_25, A2_26, A3_27, A4_28)
  local L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36
  L5_29 = A0_24.work
  L5_29 = L5_29.chosenOperation
  if L5_29 ~= -1 then
    return
  end
  L6_30 = A0_24
  L5_29 = A0_24._getParentWidget
  L5_29 = L5_29(L6_30)
  if L5_29 == nil then
    return
  end
  if A2_26 == "Button_Operate" then
    L6_30 = A0_24.work
    L6_30 = L6_30.mode
    if L6_30 == 0 then
      L6_30 = A0_24.work
      L6_30.chosenOperation = 1
      L6_30 = L5_29.setRecipeOperation
      L6_30(L7_31, L8_32)
    else
      L6_30 = L5_29.setRecipeToSlot
      L6_30(L7_31, L8_32, L9_33)
      L6_30 = 1
      for L10_34 = 1, L8_32.items do
        L11_35 = "Item_"
        L12_36 = tostring
        L12_36 = L12_36(L10_34)
        L11_35 = L11_35 .. L12_36
        L12_36 = A0_24.getUserWorkInt
        L12_36 = L12_36(A0_24, 1, nil, L11_35)
        while 0 < A0_24:getUserWorkInt(2, nil, L11_35) do
          L5_29:setRecipeToSlot(L6_30, L12_36)
          L6_30 = L6_30 + 1
        end
      end
      L10_34 = -1
      L7_31(L8_32, L9_33, L10_34)
      L7_31(L8_32, L9_33)
      L7_31.chosenOperation = 1
      L7_31(L8_32, L9_33)
    end
  end
  if A2_26 == "Button_Back" then
    L6_30 = A0_24.work
    L6_30 = L6_30.mode
    if L6_30 == 0 then
      L6_30 = A0_24.work
      L6_30.chosenOperation = 0
      L6_30 = L5_29.setRecipeOperation
      L6_30(L7_31, L8_32)
    else
      L6_30 = A0_24._getParentWidget
      L6_30 = L6_30(L7_31)
      L7_31(L8_32)
      if L7_31 == true then
        L7_31(L8_32, L9_33)
      else
        L7_31.chosenOperation = 0
        L8_32(L9_33)
        L10_34 = A0_24
        L8_32(L9_33, L10_34)
      end
    end
  end
  if A2_26 == "Button_Details" then
    L6_30 = A0_24.work
    L6_30 = L6_30.mode
    if L6_30 == 2 then
      L6_30 = A0_24.setVisibility
      L6_30(L7_31, L8_32, L9_33)
      L6_30 = A0_24.setVisibility
      L6_30(L7_31, L8_32, L9_33)
      L6_30 = A0_24.setVisibility
      L6_30(L7_31, L8_32, L9_33)
      L6_30 = A0_24.setVisibility
      L6_30(L7_31, L8_32, L9_33)
      L6_30 = A0_24.setContent
      L6_30(L7_31, L8_32, L9_33)
      L6_30 = A0_24.work
      L6_30.mode = 1
    else
      L6_30 = A0_24.work
      L6_30.mode = 2
      L6_30 = A0_24.work
      L6_30 = L6_30.detailget
      if L6_30 == false then
        L6_30 = A0_24.work
        L6_30.chosenOperation = 0
        L6_30 = L5_29.setDetailRequest
        L6_30(L7_31)
        L6_30 = A0_24.setInputEnable
        L6_30(L7_31, L8_32)
      else
        L6_30 = A0_24.setContent
        L6_30(L7_31, L8_32, L9_33)
        L6_30 = A0_24.setVisibility
        L6_30(L7_31, L8_32, L9_33)
        L6_30 = A0_24.setVisibility
        L6_30(L7_31, L8_32, L9_33)
        L6_30 = A0_24.setVisibility
        L6_30(L7_31, L8_32, L9_33)
        L6_30 = A0_24.setVisibility
        L6_30(L7_31, L8_32, L9_33)
        L6_30 = A0_24.setVisibility
        L6_30(L7_31, L8_32, L9_33)
      end
    end
  end
end
function CraftRecipeWidget.countCrystalInPackage(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45
  L2_39 = worldMaster
  L3_40 = L2_39
  L2_39 = L2_39._getMyPlayer
  L2_39 = L2_39(L3_40)
  L4_41 = L2_39
  L3_40 = L2_39._getItemPackageCapacity
  L3_40 = L3_40(L4_41, L5_42)
  L4_41 = L2_39._getItemPackageFreeSpace
  L4_41 = L4_41(L5_42, L6_43)
  for L8_45 = 1, L3_40 - L4_41 do
    if desktopWidget:getPlayerItemInPackage(100, L8_45) == A1_38 then
      return desktopWidget:getPlayerItemInPackage(100, L8_45)
    end
  end
  return L5_42
end
function CraftRecipeWidget.countMyItem(A0_46, A1_47)
  local L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55
  L2_48 = worldMaster
  L3_49 = L2_48
  L2_48 = L2_48._getMyPlayer
  L2_48 = L2_48(L3_49)
  L4_50 = L2_48
  L3_49 = L2_48._getItemPackageCapacity
  L5_51 = 1
  L3_49 = L3_49(L4_50, L5_51)
  L5_51 = L2_48
  L4_50 = L2_48._getItemPackageFreeSpace
  L4_50 = L4_50(L5_51, L6_52)
  L5_51 = 0
  for L9_55 = 1, L3_49 - L4_50 do
    if A0_46:getCraftableItemData(1, L9_55) == A1_47 then
      L5_51 = L5_51 + A0_46:getCraftableItemData(1, L9_55)
    end
  end
  return L5_51
end
function CraftRecipeWidget.getCraftableItemData(A0_56, A1_57, A2_58)
  local L3_59, L4_60, L5_61
  L3_59 = worldMaster
  L4_60 = L3_59
  L3_59 = L3_59._getMyPlayer
  L3_59 = L3_59(L4_60)
  L4_60 = L3_59
  L3_59 = L3_59._getItem
  L5_61 = A1_57
  L3_59 = L3_59(L4_60, L5_61, A2_58)
  L4_60 = 0
  L5_61 = 0
  if L3_59 ~= nil and not L3_59:_isEquipping() then
    L4_60 = L3_59:_getCatalogID()
    if L3_59:_isStackable() then
      L5_61 = L3_59:_countStack()
    else
      L5_61 = 1
    end
  end
  return L4_60, L5_61
end
function CraftRecipeWidget.checkLicense(A0_62, A1_63)
  local L2_64, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70
  L2_64 = worldMaster
  L3_65 = L2_64
  L2_64 = L2_64._getMyPlayer
  L2_64 = L2_64(L3_65)
  L4_66 = L2_64
  L3_65 = L2_64._getItemPackageCapacity
  L3_65 = L3_65(L4_66, L5_67)
  L4_66 = L2_64._getItemPackageFreeSpace
  L4_66 = L4_66(L5_67, L6_68)
  for L8_70 = 1, L3_65 - L4_66 do
    if desktopWidget:getPlayerItemInPackage(101, L8_70) == A1_63 then
      return true
    end
  end
  return L5_67
end
function CraftRecipeWidget.setReadyItemData(A0_71, A1_72, A2_73, A3_74, A4_75, A5_76, A6_77, A7_78, A8_79)
  local L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86, L16_87
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = A0_71.setItem
  L9_80(L10_81, L11_82, L12_83)
  L9_80 = true
  for L13_84 = 1, L11_82.items do
    L14_85 = "Item_"
    L15_86 = tostring
    L16_87 = L13_84
    L15_86 = L15_86(L16_87)
    L14_85 = L14_85 .. L15_86
    L16_87 = A0_71
    L15_86 = A0_71.getUserWorkInt
    L15_86 = L15_86(L16_87, 2, nil, L14_85)
    L16_87 = A0_71.setText
    L16_87(A0_71, L14_85 .. ":TextBlock_MaterialNumber", 3189, L15_86)
    L16_87 = A0_71.countMyItem
    L16_87 = L16_87(A0_71, A0_71:getUserWorkInt(1, nil, L14_85))
    if L15_86 > L16_87 then
      A0_71:setStyle(L14_85 .. ":TextBlock_OwnedMaterial", "TBL_parameterMinus")
      L9_80 = false
    else
      A0_71:setStyle(L14_85 .. ":TextBlock_OwnedMaterial", "TBL_parameterPlus")
    end
    A0_71:setText(L14_85 .. ":TextBlock_OwnedMaterial", 225, L16_87)
    A0_71:setVisibility(L14_85, true)
  end
  L13_84 = L9_80
  L10_81(L11_82, L12_83, L13_84)
end
function CraftRecipeWidget.setItem(A0_88, A1_89, A2_90)
  local L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97
  if A2_90 == 0 then
    return
  end
  L3_91 = "Item_"
  L4_92 = false
  for L8_96 = 1, L6_94.items do
    L9_97 = L3_91
    L9_97 = L9_97 .. tostring(L8_96)
    if A0_88:getUserWorkInt(1, nil, L9_97) == A2_90 then
      A0_88:setUserWorkInt(2, nil, L9_97, A0_88:getUserWorkInt(2, nil, L9_97) + 1)
      L4_92 = true
      break
    end
  end
  if L4_92 == false then
    L8_96 = A2_90
    L5_93(L6_94, L7_95, L8_96)
  end
end
function CraftRecipeWidget.setItemData(A0_98, A1_99, A2_100)
  local L3_101
  L3_101 = "Item_"
  L3_101 = L3_101 .. tostring(A1_99)
  A0_98:setUserWorkInt(1, nil, L3_101, A2_100)
  A0_98:setUserWorkInt(2, nil, L3_101, 1)
  A0_98:setIcon(L3_101 .. ":IconControl_MaterialIcon", worldMaster:_getMyPlayer():createVirtualItem(A2_100):getItemIcon())
  A0_98:setText(L3_101 .. ":TextBlock_MaterialName", 3202, A2_100, 1)
  A0_98.work.items = A1_99
end
function CraftRecipeWidget.setRecipeData(A0_102, A1_103, A2_104, A3_105, A4_106, A5_107, A6_108, A7_109, A8_110, A9_111)
  local L10_112, L11_113, L12_114, L13_115, L14_116, L15_117, L16_118, L17_119, L18_120
  L10_112 = worldMaster
  L11_113 = L10_112
  L10_112 = L10_112._getMyPlayer
  L10_112 = L10_112(L11_113)
  L12_114 = L10_112
  L11_113 = L10_112.createVirtualItem
  L13_115 = A1_103
  L11_113 = L11_113(L12_114, L13_115)
  L13_115 = L11_113
  L12_114 = L11_113.getItemIcon
  L12_114 = L12_114(L13_115)
  L14_116 = A0_102
  L13_115 = A0_102.setText
  L18_120 = 1
  L13_115(L14_116, L15_117, L16_118, L17_119, L18_120)
  L14_116 = A0_102
  L13_115 = A0_102.setIcon
  L13_115(L14_116, L15_117, L16_118)
  L14_116 = A0_102
  L13_115 = A0_102.setVisibility
  L13_115(L14_116, L15_117, L16_118)
  L14_116 = A0_102
  L13_115 = A0_102.setVisibility
  L13_115(L14_116, L15_117, L16_118)
  L14_116 = A0_102
  L13_115 = A0_102.setVisibility
  L13_115(L14_116, L15_117, L16_118)
  L14_116 = A0_102
  L13_115 = A0_102.setVisibility
  L13_115(L14_116, L15_117, L16_118)
  L13_115 = A0_102.work
  L13_115 = L13_115.mode
  if L13_115 == 0 then
    L13_115 = A0_102.work
    L13_115.stack = A2_104
  end
  L14_116 = A0_102
  L13_115 = A0_102.setVisibility
  L13_115(L14_116, L15_117, L16_118)
  L14_116 = A0_102
  L13_115 = A0_102.setVisibility
  L13_115(L14_116, L15_117, L16_118)
  if A8_110 ~= 0 then
    L14_116 = A0_102
    L13_115 = A0_102.setText
    L13_115(L14_116, L15_117, L16_118, L17_119)
    L14_116 = A0_102
    L13_115 = A0_102.setVisibility
    L13_115(L14_116, L15_117, L16_118)
    L13_115 = A0_102.work
    L13_115.gridplace = true
    L13_115 = 0
    L14_116 = desktopWidget
    L14_116 = L14_116.getPlayerStatusSlotLength
    L14_116 = L14_116(L15_117)
    for L18_120 = 1, L14_116 do
      if desktopWidget:getPlayerBufferStatus(L18_120) >= 230002 and desktopWidget:getPlayerBufferStatus(L18_120) <= 230009 then
        L13_115 = desktopWidget:getPlayerBufferStatus(L18_120)
        break
      end
    end
    if L13_115 > 0 then
      L18_120 = A8_110
      if L15_117 then
        L18_120 = 541
        L15_117(L16_118, L17_119, L18_120)
      else
        L18_120 = 837
        L15_117(L16_118, L17_119, L18_120)
      end
    else
      L18_120 = 837
      L15_117(L16_118, L17_119, L18_120)
    end
  else
    L14_116 = A0_102
    L13_115 = A0_102.setVisibility
    L13_115(L14_116, L15_117, L16_118)
    L13_115 = A0_102.work
    L13_115.gridplace = false
  end
  if A7_109 ~= 0 then
    L14_116 = L10_112
    L13_115 = L10_112.createVirtualItem
    L13_115 = L13_115(L14_116, L15_117)
    L14_116 = L13_115.getItemIcon
    L14_116 = L14_116(L15_117)
    L18_120 = L14_116
    L15_117(L16_118, L17_119, L18_120)
    L18_120 = 3202
    L15_117(L16_118, L17_119, L18_120, A7_109, 1)
    L18_120 = true
    L15_117(L16_118, L17_119, L18_120)
    L15_117.gridlicense = true
    if L15_117 == true then
      L18_120 = 541
      L15_117(L16_118, L17_119, L18_120)
    else
      L18_120 = 837
      L15_117(L16_118, L17_119, L18_120)
    end
  else
    L14_116 = A0_102
    L13_115 = A0_102.setVisibility
    L13_115(L14_116, L15_117, L16_118)
    L13_115 = A0_102.work
    L13_115.gridlicense = false
  end
  if A3_105 == nil and A5_107 == nil then
    L14_116 = A0_102
    L13_115 = A0_102.setVisibility
    L13_115(L14_116, L15_117, L16_118)
    L13_115 = A0_102.work
    L13_115.gridcrystal = false
  elseif A3_105 == 0 and A5_107 == 0 then
    L14_116 = A0_102
    L13_115 = A0_102.setVisibility
    L13_115(L14_116, L15_117, L16_118)
    L13_115 = A0_102.work
    L13_115.gridcrystal = false
  else
    L13_115 = A0_102.work
    L13_115.gridcrystal = true
    if A3_105 ~= 0 then
      L14_116 = L10_112
      L13_115 = L10_112.createVirtualItem
      L13_115 = L13_115(L14_116, L15_117)
      L14_116 = L13_115.getItemIcon
      L14_116 = L14_116(L15_117)
      L18_120 = L14_116
      L15_117(L16_118, L17_119, L18_120)
      L18_120 = 3202
      L15_117(L16_118, L17_119, L18_120, A3_105, 1)
      L18_120 = 3189
      L15_117(L16_118, L17_119, L18_120, A4_106)
      L18_120 = "TextBlock_OwnedCrystalNumber_1"
      L16_118(L17_119, L18_120, 225, L15_117)
      if A4_106 > L15_117 then
        L18_120 = "TextBlock_OwnedCrystalNumber_1"
        L16_118(L17_119, L18_120, "TBL_parameterMinus")
      else
        L18_120 = "TextBlock_OwnedCrystalNumber_1"
        L16_118(L17_119, L18_120, "TBL_parameterPlus")
      end
    else
      L14_116 = A0_102
      L13_115 = A0_102.setVisibility
      L13_115(L14_116, L15_117, L16_118)
    end
    if A5_107 ~= 0 then
      L14_116 = L10_112
      L13_115 = L10_112.createVirtualItem
      L13_115 = L13_115(L14_116, L15_117)
      L14_116 = L13_115.getItemIcon
      L14_116 = L14_116(L15_117)
      L18_120 = L14_116
      L15_117(L16_118, L17_119, L18_120)
      L18_120 = 3202
      L15_117(L16_118, L17_119, L18_120, A5_107, 1)
      L18_120 = 3189
      L15_117(L16_118, L17_119, L18_120, A6_108)
      L18_120 = "TextBlock_OwnedCrystalNumber_2"
      L16_118(L17_119, L18_120, 225, L15_117)
      if A6_108 > L15_117 then
        L18_120 = "TextBlock_OwnedCrystalNumber_2"
        L16_118(L17_119, L18_120, "TBL_parameterMinus")
      else
        L18_120 = "TextBlock_OwnedCrystalNumber_2"
        L16_118(L17_119, L18_120, "TBL_parameterPlus")
      end
    else
      L14_116 = A0_102
      L13_115 = A0_102.setVisibility
      L13_115(L14_116, L15_117, L16_118)
    end
    L14_116 = A0_102
    L13_115 = A0_102.setVisibility
    L13_115(L14_116, L15_117, L16_118)
  end
  L13_115 = A0_102.work
  L13_115 = L13_115.mode
  if L13_115 == 0 then
    L14_116 = A0_102
    L13_115 = A0_102.setVisibility
    L13_115(L14_116, L15_117, L16_118)
  else
    L14_116 = A0_102
    L13_115 = A0_102.setContent
    L13_115(L14_116, L15_117, L16_118)
  end
  L13_115 = A0_102.work
  L13_115.detailget = true
  L14_116 = A0_102
  L13_115 = A0_102.setInputEnable
  L13_115(L14_116, L15_117)
  L13_115 = A0_102.work
  L13_115.chosenOperation = -1
end
function CraftRecipeWidget.displayItemHelp(A0_121)
  local L1_122, L2_123, L3_124, L4_125, L5_126, L6_127, L7_128, L8_129, L9_130, L10_131, L11_132, L12_133, L13_134, L14_135, L15_136, L16_137, L17_138, L18_139, L19_140, L20_141, L21_142, L22_143, L23_144, L24_145, L25_146, L26_147, L27_148, L28_149, L29_150
  L2_123 = A0_121
  L1_122 = A0_121.setText
  L3_124 = "TextBlock_ItemLifeHeader"
  L4_125 = 214
  L5_126 = 10091
  L1_122(L2_123, L3_124, L4_125, L5_126)
  L2_123 = A0_121
  L1_122 = A0_121.setText
  L3_124 = "TextBlock_RepairMaterialHeader"
  L4_125 = 214
  L5_126 = 10093
  L1_122(L2_123, L3_124, L4_125, L5_126)
  L2_123 = A0_121
  L1_122 = A0_121._getParentWidget
  L1_122 = L1_122(L2_123)
  L3_124 = L1_122
  L2_123 = L1_122.getChildWidgetByWindowName
  L4_125 = "CraftEditWidget"
  L2_123 = L2_123(L3_124, L4_125)
  L3_124 = worldMaster
  L4_125 = L3_124
  L3_124 = L3_124._getMyPlayer
  L3_124 = L3_124(L4_125)
  L4_125, L5_126 = nil, nil
  L6_127 = A0_121.work
  L6_127 = L6_127.history
  if L6_127 == 0 then
    L7_128 = L3_124
    L6_127 = L3_124.createVirtualItem
    L8_129 = A0_121.work
    L8_129 = L8_129.targetitem
    L6_127 = L6_127(L7_128, L8_129)
    L4_125 = L6_127
  else
    L6_127 = A0_121.work
    L6_127 = L6_127.history
    if L6_127 == 3 then
      L5_126 = "TabItem_3_Maker"
    else
      L5_126 = "TabItem_4_Maker"
    end
  end
  L6_127 = desktopWidget
  L7_128 = L6_127
  L6_127 = L6_127.getItemBase
  L8_129 = L2_123
  L9_130 = L4_125
  L10_131 = L5_126
  L11_132 = A0_121.work
  L11_132 = L11_132.index
  L20_141 = L6_127(L7_128, L8_129, L9_130, L10_131, L11_132)
  L21_142 = nil
  L22_143 = 0
  L23_144 = 0
  L24_145 = 0
  L25_146 = 0
  if L4_125 ~= nil then
    if L26_147 == true then
      for L29_150 = 1, 27 do
        if L4_125:isFitForEquipPoint(L29_150) == true then
          if L22_143 == 0 then
            L22_143 = L29_150
          elseif L23_144 == 0 then
            L23_144 = L29_150
          elseif L24_145 == 0 then
            L24_145 = L29_150
          elseif L25_146 == 0 then
            L25_146 = L29_150
            break
          end
        end
      end
    end
  else
    L29_150 = A0_121.work
    L29_150 = L29_150.index
    L22_143 = L26_147
    L29_150 = A0_121.work
    L29_150 = L29_150.index
    L23_144 = L26_147
    L29_150 = A0_121.work
    L29_150 = L29_150.index
    L24_145 = L26_147
    L29_150 = A0_121.work
    L29_150 = L29_150.index
    L25_146 = L26_147
  end
  if L22_143 ~= 0 then
    L21_142 = L26_147
  end
  if L21_142 == nil and L23_144 ~= 0 then
    L21_142 = L26_147
  end
  if L21_142 == nil and L24_145 ~= 0 then
    L21_142 = L26_147
  end
  if L21_142 == nil and L25_146 ~= 0 then
    L21_142 = L26_147
  end
  if L26_147 == 0 and L9_130 then
    L9_130 = true
  else
    L9_130 = false
  end
  L29_150 = L4_125
  L26_147(L27_148, L28_149, L29_150, L5_126, A0_121.work.index, L9_130, L8_129, L17_138, "TBL_null", L6_127, A0_121.work.stack, nil, L13_134, L19_140, L20_141, L2_123)
  L29_150 = L4_125
  L29_150 = L26_147(L27_148, L28_149, L29_150, L5_126, A0_121.work.index, L21_142, false, true, true, false, false, false, L2_123, nil, true)
  A0_121.work.bonus1 = L26_147
  A0_121.work.bonus2 = L27_148
  A0_121.work.bonus3 = L28_149
  A0_121.work.itemlife = L29_150
  A0_121:setVisibility("Grid_ItemDetail1", A0_121.work.bonus1)
  A0_121:setVisibility("Grid_ItemDetail2", A0_121.work.bonus2)
  A0_121:setVisibility("Grid_ItemDetail3", A0_121.work.bonus3 or A0_121.work.itemlife)
  A0_121:setVisibility("Label_ItemBonus5", A0_121.work.bonus3)
  A0_121:setVisibility("Grid_ItemLife", A0_121.work.itemlife)
end
