require("/Widget/WidgetBaseClass")
_defineClass("MateriaAttachWidget", "WidgetBaseClass")
function MateriaAttachWidget.updateItemListRow(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24
  L3_3 = worldMaster
  L4_4 = L3_3
  L3_3 = L3_3._getMyPlayer
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3._getItem
  L6_6 = 1
  L7_7 = A0_0.work
  L7_7 = L7_7.sourceItemIndex
  L4_4 = L4_4(L5_5, L6_6, L7_7)
  L6_6 = L3_3
  L5_5 = L3_3._getItem
  L7_7 = 1
  L8_8 = A1_1
  L5_5 = L5_5(L6_6, L7_7, L8_8)
  L6_6, L7_7 = nil, nil
  L8_8 = A0_0.work
  L8_8 = L8_8.isMateriaSource
  if L8_8 then
    L6_6 = L5_5
    L7_7 = L4_4
  else
    L6_6 = L4_4
    L7_7 = L5_5
  end
  L9_9 = L7_7
  L8_8 = L7_7.isEnchantMateria
  L8_8 = L8_8(L9_9)
  if L8_8 then
    L9_9 = L6_6
    L8_8 = L6_6.isEquipment
    L8_8 = L8_8(L9_9)
    if L8_8 then
      L9_9 = L6_6
      L8_8 = L6_6._isEquipping
      L8_8 = L8_8(L9_9)
      if L8_8 == false then
        L8_8 = false
        L10_10 = L5_5
        L9_9 = L5_5.isEquipment
        L9_9 = L9_9(L10_10)
        if L9_9 then
          L10_10 = L5_5
          L9_9 = L5_5.getMateriaBindPermission
          L9_9 = L9_9(L10_10)
          if not L9_9 then
            L8_8 = true
          end
        end
        L9_9 = A0_0.work
        L9_9 = L9_9.itemSubMenu
        if L9_9 == 13 then
          L10_10 = L6_6
          L9_9 = L6_6.getNormalItemMateriaFreeIndex
          L9_9 = L9_9(L10_10)
          if L9_9 > 1 then
            L8_8 = true
          end
        end
        if not L8_8 then
          L9_9 = desktopWidget
          L10_10 = L9_9
          L9_9 = L9_9.checkMateriaJoinRequirement
          L11_11 = L7_7
          L12_12 = L6_6
          L15_15 = L9_9(L10_10, L11_11, L12_12)
          L16_16 = A0_0.work
          L16_16 = L16_16.itemSubMenu
          if L16_16 == 13 then
            L9_9 = L11_11
          end
          L16_16 = "TBL_null"
          L18_18 = L5_5
          L17_17 = L5_5._getCatalogID
          L17_17 = L17_17(L18_18)
          L19_19 = L5_5
          L18_18 = L5_5.getItemIcon
          L18_18 = L18_18(L19_19)
          L20_20 = L5_5
          L19_19 = L5_5._isStackable
          L19_19 = L19_19(L20_20)
          L21_21 = L5_5
          L20_20 = L5_5._countStack
          L20_20 = L20_20(L21_21)
          L22_22 = L5_5
          L21_21 = L5_5._getNameIndex
          L21_21 = L21_21(L22_22)
          L22_22 = A0_0.work
          L22_22 = L22_22.sorttype
          L23_23 = 1
          L24_24 = 1
          desktopWidget:setItemToXml(A0_0, "TabItem_1_Maker", A2_2, L5_5, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, true, false, L23_23, L24_24, A1_1, L3_3, false)
          A0_0:setListProperty("TabItem_1_Maker", A2_2, "itemIndex", A1_1)
          if L9_9 ~= true then
            A0_0:setListProperty("TabItem_1_Maker", A2_2, "opacity", "0.5")
          end
          A2_2 = A2_2 + 1
        end
      end
    end
  end
  return A2_2
end
function MateriaAttachWidget.updateItemList(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36
  L1_26 = worldMaster
  L2_27 = L1_26
  L1_26 = L1_26._getMyPlayer
  L1_26 = L1_26(L2_27)
  L2_27 = A0_25.work
  L2_27 = L2_27.sourceItemIndex
  L4_29 = L1_26
  L3_28 = L1_26._getItem
  L5_30 = 1
  L6_31 = L2_27
  L3_28 = L3_28(L4_29, L5_30, L6_31)
  if L3_28 == nil then
    L4_29 = 0
    L5_30 = true
    return L4_29, L5_30
  end
  L4_29 = A0_25.work
  L6_31 = L3_28
  L5_30 = L3_28.isEnchantMateria
  L5_30 = L5_30(L6_31)
  L4_29.isMateriaSource = L5_30
  L4_29 = A0_25.work
  L4_29 = L4_29.isMateriaSource
  if L4_29 then
    L5_30 = A0_25
    L4_29 = A0_25.setText
    L6_31 = "TextBlock_Title"
    L7_32 = 3585
    L4_29(L5_30, L6_31, L7_32)
  else
    L5_30 = A0_25
    L4_29 = A0_25.setText
    L6_31 = "TextBlock_Title"
    L7_32 = 3584
    L4_29(L5_30, L6_31, L7_32)
  end
  L5_30 = L1_26
  L4_29 = L1_26._getItemPackageCapacity
  L6_31 = 1
  L4_29 = L4_29(L5_30, L6_31)
  L6_31 = L1_26
  L5_30 = L1_26._getItemPackageFreeSpace
  L7_32 = 1
  L5_30 = L5_30(L6_31, L7_32)
  L6_31 = L4_29 - L5_30
  L7_32 = 0
  for L11_36 = 1, L6_31 do
    L7_32 = A0_25:updateItemListRow(L11_36, L7_32)
  end
  L8_33(L9_34, L10_35)
  return L7_32
end
function MateriaAttachWidget.getEquipAndMateriaIndex(A0_37)
  local L1_38, L2_39
  L1_38 = A0_37.work
  L1_38 = L1_38.isMateriaSource
  if L1_38 then
    L1_38 = A0_37.work
    L1_38 = L1_38.selectItemIndex
    L2_39 = A0_37.work
    L2_39 = L2_39.sourceItemIndex
    return L1_38, L2_39
  else
    L1_38 = A0_37.work
    L1_38 = L1_38.sourceItemIndex
    L2_39 = A0_37.work
    L2_39 = L2_39.selectItemIndex
    return L1_38, L2_39
  end
end
function MateriaAttachWidget.updateItemDetail(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48, L9_49, L10_50, L11_51, L12_52, L13_53, L14_54, L15_55, L16_56
  L2_42 = A0_40.work
  L4_44 = A0_40
  L3_43 = A0_40.getListProperty
  L5_45 = "TabItem_1_Maker"
  L6_46 = A1_41
  L7_47 = "itemIndex"
  L3_43 = L3_43(L4_44, L5_45, L6_46, L7_47)
  L2_42.selectItemIndex = L3_43
  L2_42 = worldMaster
  L3_43 = L2_42
  L2_42 = L2_42._getMyPlayer
  L2_42 = L2_42(L3_43)
  L4_44 = L2_42
  L3_43 = L2_42._getItem
  L5_45 = 1
  L6_46 = A0_40.work
  L6_46 = L6_46.selectItemIndex
  L3_43 = L3_43(L4_44, L5_45, L6_46)
  if L3_43 == nil then
    L4_44 = desktopWidget
    L5_45 = L4_44
    L4_44 = L4_44.closeWidgetDirect
    L4_44(L5_45)
    return
  end
  L4_44 = A0_40.work
  L4_44 = L4_44.isMateriaSource
  if L4_44 then
    L5_45 = L3_43
    L4_44 = L3_43.isEnchantMateria
    L4_44 = L4_44(L5_45)
    if L4_44 then
      L4_44 = desktopWidget
      L5_45 = L4_44
      L4_44 = L4_44.closeWidgetDirect
      L4_44(L5_45)
    end
  else
    L5_45 = L3_43
    L4_44 = L3_43.isEquipment
    L4_44 = L4_44(L5_45)
    if L4_44 then
      L4_44 = desktopWidget
      L5_45 = L4_44
      L4_44 = L4_44.closeWidgetDirect
      L4_44(L5_45)
    end
  end
  if L3_43 then
    L4_44 = nil
    L5_45 = 0
    L6_46 = 0
    L7_47 = 0
    L8_48 = 0
    if L9_49 == true then
      for L12_52 = 1, 27 do
        L14_54 = L3_43
        L13_53 = L3_43.isFitForEquipPoint
        L15_55 = L12_52
        L13_53 = L13_53(L14_54, L15_55)
        if L13_53 == true then
          if L5_45 == 0 then
            L5_45 = L12_52
          elseif L6_46 == 0 then
            L6_46 = L12_52
          elseif L7_47 == 0 then
            L7_47 = L12_52
          elseif L8_48 == 0 then
            L8_48 = L12_52
            break
          end
        end
      end
    end
    if L5_45 ~= 0 then
      L4_44 = L9_49
    end
    if L4_44 == nil and L6_46 ~= 0 then
      L4_44 = L9_49
    end
    if L4_44 == nil and L7_47 ~= 0 then
      L4_44 = L9_49
    end
    if L4_44 == nil and L8_48 ~= 0 then
      L4_44 = L9_49
    end
    L12_52 = L3_43
    L13_53 = "TabItem_1_Maker"
    L14_54 = A1_41
    L9_49(L10_50, L11_51, L12_52, L13_53, L14_54)
    L12_52 = L3_43
    L13_53 = "TabItem_1_Maker"
    L14_54 = A1_41
    L15_55 = L4_44
    L16_56 = false
    L12_52 = L9_49(L10_50, L11_51, L12_52, L13_53, L14_54, L15_55, L16_56, false, false, false, false, false, nil, true)
    L14_54 = A0_40
    L13_53 = A0_40.setVisibility
    L15_55 = "Grid_ItemDetail1"
    L16_56 = L9_49
    L13_53(L14_54, L15_55, L16_56)
    L14_54 = A0_40
    L13_53 = A0_40.setVisibility
    L15_55 = "Grid_ItemDetail2"
    L16_56 = L10_50
    L13_53(L14_54, L15_55, L16_56)
    L14_54 = A0_40
    L13_53 = A0_40.setVisibility
    L15_55 = "Grid_ItemDetail3"
    L16_56 = L11_51 or L12_52
    L13_53(L14_54, L15_55, L16_56)
    L14_54 = A0_40
    L13_53 = A0_40.setVisibility
    L15_55 = "Grid_ItemLife"
    L16_56 = L12_52
    L13_53(L14_54, L15_55, L16_56)
    L13_53 = A0_40.work
    L13_53 = L13_53.itemSubMenu
    if L13_53 == 13 then
      L14_54 = A0_40
      L13_53 = A0_40.getEquipAndMateriaIndex
      L14_54 = L13_53(L14_54)
      L16_56 = L2_42
      L15_55 = L2_42._getItem
      L15_55 = L15_55(L16_56, 1, L13_53)
      L16_56 = L15_55.getAttachMateriaAmount
      L16_56 = L16_56(L15_55)
      A0_40:setText("TextBlock_MateriaAttachCost", 225, L16_56)
      A0_40:setVisibility("Grid_MateriaAttachBazzarCost", true)
    end
  end
end
function MateriaAttachWidget.init(A0_57, A1_58, A2_59, A3_60)
  local L4_61, L5_62
  L4_61 = A0_57.work
  L5_62 = {
    {
      "sourceItemIndex",
      "integer32"
    },
    {
      "selectItemIndex",
      "integer32"
    },
    {
      "equipItemIndex",
      "integer32"
    },
    {
      "materiaItemIndex",
      "integer32"
    },
    {
      "isMateriaSource",
      "boolean"
    },
    {
      "updatecount",
      "integer16"
    },
    {"sorttype", "integer8"},
    {
      "itemSubMenu",
      "integer8"
    },
    {"error", "boolean"},
    {"beforeShow", "boolean"},
    {"openChild", "boolean"}
  }
  L4_61._temp = L5_62
  L4_61 = A0_57.work
  L4_61.sourceItemIndex = A1_58
  L4_61 = A0_57.work
  L4_61.selectItemIndex = -1
  L4_61 = A0_57.work
  L4_61.equipItemIndex = -1
  L4_61 = A0_57.work
  L4_61.materiaItemIndex = -1
  L4_61 = A0_57.work
  L4_61.isMateriaSource = false
  L4_61 = A0_57.work
  L4_61.error = false
  L4_61 = A0_57.work
  L4_61.beforeShow = true
  if A2_59 ~= nil then
    L4_61 = A0_57.work
    L4_61.sorttype = A2_59
  end
  L4_61 = A0_57.work
  L4_61.itemSubMenu = A3_60
  L4_61 = A0_57.work
  L4_61.openChild = false
  L5_62 = A0_57
  L4_61 = A0_57.setControlCommandCondition
  L4_61(L5_62, "ListBox_TabItem_1", "UILuaCommands.Selection")
  L5_62 = A0_57
  L4_61 = A0_57.setControlCommandCondition
  L4_61(L5_62, "ListBox_TabItem_1", "UILuaCommands.SelectionChanged")
  L5_62 = A0_57
  L4_61 = A0_57.setControlCommandCondition
  L4_61(L5_62, "ListBox_TabItem_1", "UILuaCommands.EnterSelectorMouseFocus")
  L5_62 = A0_57
  L4_61 = A0_57.setControlCommandCondition
  L4_61(L5_62, "ListBox_TabItem_1", "UILuaCommands.EnterSelectorKeyboardFocus")
  L5_62 = A0_57
  L4_61 = A0_57.setControlCommandCondition
  L4_61(L5_62, "ListBox_TabItem_1", "UILuaCommands.Previous")
  L5_62 = A0_57
  L4_61 = A0_57.setControlCommandCondition
  L4_61(L5_62, "ListBox_TabItem_1", "UILuaCommands.Next")
  L5_62 = A0_57
  L4_61 = A0_57.setConfirmCondition
  L4_61(L5_62, "Button_Back")
  L5_62 = A0_57
  L4_61 = A0_57.setCancelCondition
  L4_61(L5_62)
  L5_62 = A0_57
  L4_61 = A0_57.setCloseCondition
  L4_61(L5_62)
  L5_62 = A0_57
  L4_61 = A0_57.setModal
  L4_61(L5_62, true)
  L4_61 = worldMaster
  L5_62 = L4_61
  L4_61 = L4_61._getMyPlayer
  L4_61 = L4_61(L5_62)
  L5_62 = L4_61._getItemPackageCapacity
  L5_62 = L5_62(L4_61, 1)
  A0_57:setControlProperty("ListBox_TabItem_1", "SourceFirstIndex", 0)
  A0_57:setControlProperty("ListBox_TabItem_1", "SourceCount", L5_62)
  A0_57:setControlProperty("TabItem_1_Maker", "FilteredSortKey", "sorttype")
  A0_57:setText("TextBlock_ItemLifeHeader", 214, 10091)
  A0_57:setText("TextBlock_RepairMaterialHeader", 214, 10093)
  desktopWidget:setMateriaAttachSlotIconHelp(A0_57)
  A0_57:setVisibility("Grid_MateriaAttachBazzarCost", false)
  if A0_57:updateItemList() then
    A0_57.work.error = true
    return
  end
  if A0_57:updateItemList() == 0 then
    A0_57:setVisibility("TextBlock_NoContents_1", true)
    A0_57:setVisibility("ListBox_TabItem_1", false)
    A0_57:setVisibility("Grid_Help", true)
    A0_57:setText("TextBlock_Help", 3140)
    A0_57:setVisibility("Grid_ItemNameBase", false)
    A0_57:setVisibility("Grid_ItemDetail1", false)
    A0_57:setVisibility("Grid_ItemDetail2", false)
    A0_57:setVisibility("Grid_ItemDetail3", false)
    A0_57:setVisibility("Grid_Edit", false)
    A0_57:setEnable("TabControl_ItemList", false)
    A0_57:setLogicalFocus("Button_Back")
  else
    A0_57:updateItemDetail(A0_57:focusToIndex(0))
  end
end
function MateriaAttachWidget.processBeforeShow(A0_63, A1_64)
  A0_63.work.beforeShow = false
  if A0_63.work.error == true then
    desktopWidget:closeWidgetDirect(A0_63)
    return
  end
end
function MateriaAttachWidget.focusToIndex(A0_65, A1_66)
  A0_65:setControlProperty("TabItem_1_Maker", "FilteredIndex", A1_66)
  return A0_65:getControlProperty("TabItem_1_Maker", "Index")
end
function MateriaAttachWidget.processUICommandOperate(A0_67, A1_68, A2_69, A3_70, A4_71)
  if A2_69 == "Button_Back" then
    desktopWidget:closeWidgetDirect(A0_67)
    return
  end
end
function MateriaAttachWidget.attachMateria(A0_72, A1_73, A2_74)
  local L3_75, L4_76, L5_77
  L3_75 = worldMaster
  L4_76 = L3_75
  L3_75 = L3_75._getMyPlayer
  L3_75 = L3_75(L4_76)
  L5_77 = L3_75
  L4_76 = L3_75._getItem
  L4_76 = L4_76(L5_77, 1, A1_73)
  L5_77 = L3_75._getItem
  L5_77 = L5_77(L3_75, 1, A2_74)
  if desktopWidget:checkMateriaJoinRequirement(L5_77, L4_76) ~= true then
    if desktopWidget:checkMateriaJoinRequirement(L5_77, L4_76) ~= true then
      worldMaster:alert(worldMaster, 40233, L4_76:_getCatalogID(), L4_76:getNameIndex())
      return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_72, true, 1, L4_76:_getCatalogID(), L4_76:getNameIndex()))
    elseif desktopWidget:checkMateriaJoinRequirement(L5_77, L4_76) ~= true then
      worldMaster:alert(worldMaster, 40236, L4_76:_getCatalogID(), L4_76:getNameIndex(), L5_77:_getCatalogID(), L5_77:getNameIndex())
      return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_72, true, 106, A2_74, A1_73))
    elseif not L3_75:hasItem(101, 2001003) and 1 < L4_76:getNormalItemMateriaFreeIndex() then
      worldMaster:alert(worldMaster, 40242, 2001003, 1)
      return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_72, true, 7))
    elseif desktopWidget:checkMateriaJoinRequirement(L5_77, L4_76) ~= true then
      worldMaster:alert(worldMaster, 40238)
      return (desktopWidget:openChildWidget("MateriaAttachWarningWidget", A0_72, true, 4))
    elseif desktopWidget:checkMateriaJoinRequirement(L5_77, L4_76) ~= true then
      worldMaster:alert(worldMaster, 40234, L4_76:getItemRepairSkill())
      if desktopWidget:executePlayerMateriaJoinRateGetCommand(A1_73, A2_74) == false then
      end
      return
    elseif desktopWidget:checkMateriaJoinRequirement(L5_77, L4_76) ~= true then
      worldMaster:alert(worldMaster, 40235, L4_76:_getCatalogID(), L4_76:getNameIndex())
      if desktopWidget:executePlayerMateriaJoinRateGetCommand(A1_73, A2_74) == false then
      end
      return
    else
      if desktopWidget:checkMateriaJoinRequirement(L5_77, L4_76) ~= true then
        worldMaster:alert(worldMaster, 40237, L5_77:_getCatalogID(), L5_77:_getNameIndex(), L5_77:getItemRepairItem(), 1)
        if desktopWidget:executePlayerMateriaJoinRateGetCommand(A1_73, A2_74) == false then
        end
        return
      else
      end
    end
    return
  end
  do break end
  if desktopWidget:executePlayerMateriaJoinCommand(A1_73, A2_74) == false then
  end
end
function MateriaAttachWidget.orderMateria(A0_78, A1_79, A2_80)
  if desktopWidget:openChildWidget("Ask/MateriaAttachAskWidget", A0_78, true, 100, nil, 2) == true then
    A0_78.work.openChild = true
  end
end
function MateriaAttachWidget.processUICommandSelection(A0_81, A1_82, A2_83, A3_84, A4_85)
  local L5_86, L6_87
  if A3_84 == nil or A3_84 < 0 then
    return
  end
  L6_87 = A0_81
  L5_86 = A0_81.getEquipAndMateriaIndex
  L6_87 = L5_86(L6_87)
  A0_81.work.equipItemIndex = L5_86
  A0_81.work.materiaItemIndex = L6_87
  A0_81:_getParentWidget():setMateriaAttachItemIndex(L5_86)
  A0_81:_getParentWidget():setMateriaItemIndex(L6_87)
  if A0_81.work.itemSubMenu == 12 then
    A0_81:attachMateria(L5_86, L6_87)
    break
  else
  end
  if A0_81.work.itemSubMenu == 13 then
    if A0_81.work.error == false then
      A0_81:orderMateria(L5_86, L6_87)
    else
      desktopWidget:closeWidgetDirect(A0_81)
      do break end
      break
    end
  else
  end
end
function MateriaAttachWidget.processUICommandDefault(A0_88, A1_89, A2_90, A3_91, A4_92, A5_93)
  if A3_91 == "UILuaCommands.Previous" then
    A0_88:catalogSkip(-1)
  elseif A3_91 == "UILuaCommands.Next" then
    A0_88:catalogSkip(1)
  end
end
function MateriaAttachWidget.catalogSkip(A0_94, A1_95)
  local L2_96, L3_97, L4_98, L5_99, L6_100, L7_101, L8_102, L9_103, L10_104, L11_105, L12_106, L13_107, L14_108
  L3_97 = A0_94
  L2_96 = A0_94.getControlProperty
  L4_98 = "TabItem_1_Maker"
  L5_99 = "FilteredIndex"
  L2_96 = L2_96(L3_97, L4_98, L5_99)
  L4_98 = A0_94
  L3_97 = A0_94.focusToIndex
  L5_99 = L2_96
  L3_97 = L3_97(L4_98, L5_99)
  L4_98 = L2_96
  L6_100 = A0_94
  L5_99 = A0_94.getControlProperty
  L7_101 = "TabItem_1_Maker"
  L8_102 = "FilteredCount"
  L5_99 = L5_99(L6_100, L7_101, L8_102)
  L5_99 = L5_99 - 1
  if L5_99 == -1 then
    return
  end
  L6_100 = 2
  L7_101 = A0_94.work
  L7_101 = L7_101.sorttype
  if L7_101 == 0 then
    L7_101 = 10 * A1_95
    L4_98 = L4_98 + L7_101
  else
    L7_101 = nil
    if A1_95 > 0 then
      L7_101 = L5_99 - L2_96
    else
      L7_101 = L2_96
    end
    L8_102 = desktopWidget
    L9_103 = L8_102
    L8_102 = L8_102.getItemSortKey
    L13_107 = 1
    L14_108 = L6_100
    L8_102 = L8_102(L9_103, L10_104, L11_105, L12_106, L13_107, L14_108)
    L9_103 = L4_98
    for L13_107 = 1, L7_101 do
      L9_103 = L9_103 + A1_95
      L14_108 = A0_94.focusToIndex
      L14_108 = L14_108(A0_94, L9_103)
      if L8_102 ~= desktopWidget:getItemSortKey(A0_94, "TabItem_1_Maker", L14_108, 1, L6_100) then
        L4_98 = L4_98 + L13_107 * A1_95
        break
      end
      if L13_107 == L7_101 then
        if A1_95 > 0 then
          L4_98 = L5_99
        else
          L4_98 = 0
        end
      end
    end
  end
  if L5_99 < L4_98 then
    L4_98 = L5_99
  elseif L4_98 < 0 then
    L4_98 = 0
  end
  if L4_98 ~= L2_96 then
    L8_102 = A0_94
    L7_101 = A0_94.setControlProperty
    L9_103 = "TabItem_1_Maker"
    L7_101(L8_102, L9_103, L10_104, L11_105)
    L8_102 = A0_94
    L7_101 = A0_94.setControlProperty
    L9_103 = "ListBox_TabItem_1"
    L7_101(L8_102, L9_103, L10_104, L11_105)
    L8_102 = A0_94
    L7_101 = A0_94.updateItemDetail
    L9_103 = A0_94.focusToIndex
    L14_108 = L9_103(L10_104, L11_105)
    L7_101(L8_102, L9_103, L10_104, L11_105, L12_106, L13_107, L14_108, L9_103(L10_104, L11_105))
  end
end
function MateriaAttachWidget.processUICommandEnterSelectorFocus(A0_109, A1_110, A2_111, A3_112)
  if A0_109.work.error == true then
    desktopWidget:closeWidgetDirect(A0_109)
  else
    A0_109:updateItemDetail(A0_109:focusToIndex(A3_112))
  end
end
function MateriaAttachWidget.askShow(A0_113)
  if A0_113.work.error == true then
    desktopWidget:closeWidgetDirect(A0_113)
  end
end
function MateriaAttachWidget.updatePlayerItem(A0_114)
  local L1_115, L2_116, L3_117, L4_118, L5_119
  L2_116 = A0_114
  L1_115 = A0_114.getControlProperty
  L3_117 = "TabItem_1_Maker"
  L4_118 = "FilteredIndex"
  L1_115 = L1_115(L2_116, L3_117, L4_118)
  L2_116 = 0
  if L1_115 > -1 then
    L4_118 = A0_114
    L3_117 = A0_114.focusToIndex
    L5_119 = L1_115
    L3_117 = L3_117(L4_118, L5_119)
    L2_116 = L3_117
  end
  L4_118 = A0_114
  L3_117 = A0_114.updateItemList
  L4_118 = L3_117(L4_118)
  if L4_118 == true then
    L5_119 = A0_114.work
    L5_119 = L5_119.beforeShow
    if L5_119 == true then
      L5_119 = A0_114.work
      L5_119.error = true
    else
      L5_119 = A0_114.work
      L5_119.error = true
      L5_119 = A0_114.work
      L5_119 = L5_119.openChild
      if L5_119 == false then
        L5_119 = desktopWidget
        L5_119 = L5_119.closeWidgetDirect
        L5_119(L5_119, A0_114)
      else
      end
    end
    return
  end
  if L3_117 == 0 then
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "TextBlock_NoContents_1", true)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "ListBox_TabItem_1", false)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_Help", true)
    L5_119 = A0_114.setText
    L5_119(A0_114, "TextBlock_Help", 3140)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemNameBase", false)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemDetail1", false)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemDetail2", false)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemDetail3", false)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_Edit", false)
    L5_119 = A0_114.setEnable
    L5_119(A0_114, "TabControl_ItemList", false)
    L5_119 = A0_114.setLogicalFocus
    L5_119(A0_114, "Button_Back")
  else
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "TextBlock_NoContents_1", false)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "ListBox_TabItem_1", true)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_Help", false)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemNameBase", true)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemDetail1", true)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemDetail2", true)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_ItemDetail3", true)
    L5_119 = A0_114.setVisibility
    L5_119(A0_114, "Grid_Edit", false)
    L5_119 = A0_114.setEnable
    L5_119(A0_114, "TabControl_ItemList", true)
    L5_119 = A0_114.setLogicalFocus
    L5_119(A0_114, "ListBox_TabItem_1")
    L5_119 = A0_114.setKeyboardFocusedControl
    L5_119(A0_114, "ListBox_TabItem_1")
    L5_119 = L3_117 - 1
    if L2_116 > L5_119 then
      L2_116 = L3_117 - 1
    end
    L5_119 = A0_114.setControlProperty
    L5_119(A0_114, "TabItem_1_Maker", "Index", L2_116)
    L5_119 = A0_114.getControlProperty
    L5_119 = L5_119(A0_114, "TabItem_1_Maker", "FilteredIndex")
    if L5_119 == -1 then
      L5_119 = L1_115
    end
    if L5_119 > L3_117 - 1 then
      L5_119 = L3_117 - 1
    end
    A0_114:setControlProperty("ListBox_TabItem_1", "SqwtFocusedIndex", L5_119)
    A0_114:setFocusedIndex("ListBox_TabItem_1", L5_119)
    A0_114:updateItemDetail(A0_114:focusToIndex(L5_119))
  end
end
