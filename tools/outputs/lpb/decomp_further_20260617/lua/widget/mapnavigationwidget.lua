require("/Widget/WidgetBaseClass")
_defineClass("MapNavigationWidget", "WidgetBaseClass")
function MapNavigationWidget.getMenuItemName(A0_0, A1_1)
  return "Item_Menu_" .. A1_1
end
function MapNavigationWidget.focusMenuListItem(A0_2, A1_3)
  local L2_4
  L2_4 = A0_2.getMenuItemName
  L2_4 = L2_4(A0_2, A1_3)
  A0_2:_setKeyboardFocusedControl(L2_4, "Button_MenuItem")
end
function MapNavigationWidget.init(A0_5, A1_6, A2_7, A3_8)
  A0_5.work._temp = {
    {"mode", "integer8"},
    {"questIndex", "integer32"},
    {"journalID", "integer32"},
    {
      "menuCategory",
      "integer32"
    },
    {
      "menuPrevious",
      "integer32"
    },
    {"regionId", "integer32"},
    {"mapDataId", "integer32"}
  }
  A0_5:setInitializeMapMarker()
  A0_5:setModal(true)
  A0_5:setUICommandCondition("UILuaCommands.Activated")
  A0_5:setUICommandCondition("MapScreenControl.NaviRowUpdated")
  A0_5:setTemplateConfirmCondition("ControlTemplate_ListBoxItem_MenuItem", "Button_MenuItem")
  A0_5:setTemplateCancelCondition("ControlTemplate_ListBoxItem_MenuItem", "Button_MenuItem")
  A0_5:initMenuList()
  A0_5.work.mode = A1_6
  A0_5:setUserWorkInt(1, nil, "CustomControl_MapNavigation", A1_6)
  A0_5:setMenuCategory(1)
  if A2_7 ~= nil then
    A0_5.work.questIndex = A2_7
  end
  if A3_8 ~= nil then
    A0_5.work.journalID = A3_8
  end
  A0_5.work.menuPrevious = -1
  A0_5.work.mapDataId = -1
  A0_5:setVisibility("Label_MarkerSelectMenu", false)
  if A1_6 == 0 then
    A0_5:setVisibility("Label_MessageDialog", false)
    A0_5:setDisplayLocation(-1, -1)
    break
  else
  end
  if A1_6 == 1 then
    A0_5:setHelpParameter("StackPanel_AreaList", 0)
    A0_5:setVisibility("Label_MessageDialog", false)
    break
  else
  end
  if A1_6 == 2 then
    A0_5:setVisibility("Label_MessageDialog", false)
    A0_5:setModal(false)
    A0_5:setProperty("Focusable", false)
    A0_5:setProperty("SqwtIsEnableInput", false)
    A0_5:setProperty("IsHitTestVisible", false)
    A0_5:setControlProperty("CustomControl_MapNavigation", "IsHitTestVisible", false)
    do break end
    break
  else
  end
  desktopWidget:setLogPriority(true)
  desktopWidget:setLogEventHide(true)
end
function MapNavigationWidget.processUICommandEvent(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  local L6_15, L7_16, L8_17
  if A3_12 == "UILuaCommands.Operate" then
    if A2_11 == "Button_MarkerItem" then
      L7_16 = A0_9
      L6_15 = A0_9.getTemplateUserWorkInt
      L8_17 = 1
      L6_15 = L6_15(L7_16, L8_17, A1_10)
      L8_17 = A0_9
      L7_16 = A0_9.dispMarker
      L7_16(L8_17, L6_15)
    else
      L7_16 = A0_9
      L6_15 = A0_9._getProperty
      L8_17 = A1_10
      L6_15 = L6_15(L7_16, L8_17, "TextBlock_MenuItemName", "IntData.Value0")
      L8_17 = A0_9
      L7_16 = A0_9.getMenuCategory
      L7_16 = L7_16(L8_17)
      L8_17 = L7_16
      if L8_17 == 1 then
        A0_9:callbackTopMenuList(L6_15)
        break
      else
      end
      if L8_17 == 2 then
        A0_9:callbackSelectRegionMenuList(L6_15)
        break
      else
      end
      if L8_17 == 3 then
        A0_9:callbackSelectPieceMenuList(L6_15)
        break
      else
      end
    end
  else
    L6_15 = A3_12
    if L6_15 == "UILuaCommands.MapClose" then
    else
    end
    if L6_15 == "UILuaCommands.Cancel" then
      L7_16 = A2_11
      if L7_16 == "Button_MenuItem" then
        L8_17 = A0_9.getMenuCategoryPrevious
        L8_17 = L8_17(A0_9)
        if L8_17 < 0 then
          desktopWidget:closeWidgetDirect(A0_9)
        else
          A0_9:setMenuCategory(L8_17)
          do break end
          do break end
          do break end
          do break end
          else
          end
          if L6_15 == "UILuaCommands.Activated" then
            L7_16 = A0_9.work
            L7_16 = L7_16.mode
            if L7_16 == 0 then
              L8_17 = desktopWidget
              L8_17 = L8_17.postMapOpen
              L8_17(L8_17)
              break
            else
            end
            if L7_16 == 1 then
              L8_17 = desktopWidget
              L8_17 = L8_17.executeCommandJournalDetailInfo
              L8_17 = L8_17(L8_17, 3, A0_9.work.journalID, A0_9.work.questIndex, 2)
              if L8_17 == false then
                L8_17 = desktopWidget
                L8_17 = L8_17.openCommandFailedWidget
                L8_17(L8_17, A0_9, 5211)
                do break end
                else
                end
                if L7_16 == 2 then
                  L8_17 = A0_9.setQuestMarker
                  L8_17(A0_9, tostring(A0_9.work.questIndex))
                  L8_17 = A0_9.dispMarker
                  L8_17(A0_9, A0_9.work.questIndex)
                  do break end
                  do break end
                  do break end
                  do break end
                  else
                  end
                  if L6_15 == "MapScreenControl.NaviRowUpdated" then
                    L8_17 = A0_9
                    L7_16 = A0_9._getProperty
                    L7_16 = L7_16(L8_17, nil, "CustomControl_MapNavigation", "NaviRow")
                    L8_17 = A0_9.setText
                    L8_17(A0_9, "TextBlock_RegionName", 5202, L7_16)
                    L8_17 = A0_9.setText
                    L8_17(A0_9, "AreaName1Label:TextBlock_AreaName", 5213, L7_16)
                    L8_17 = A0_9.setText
                    L8_17(A0_9, "AreaName2Label:TextBlock_AreaName", 5214, L7_16)
                    L8_17 = A0_9.setText
                    L8_17(A0_9, "AreaName3Label:TextBlock_AreaName", 5215, L7_16)
                    break
                  else
                  end
                else
                end
              else
              end
        end
      else
      end
  end
end
function MapNavigationWidget.processSpreadSheetDataLoaded(A0_18, A1_19)
  if A1_19 == aetheryte2DmapSheet then
    A0_18:aetheryte2DmapSheetLoaded(A1_19)
  elseif A1_19 == mapNaviDataSheet then
    A0_18:mapNaviDataSheetLoaded(A1_19)
  end
end
function MapNavigationWidget.processClosing(A0_20)
  desktopWidget:setLogPriority(false)
  desktopWidget:setLogEventHide(false)
end
function MapNavigationWidget.setMenuCategory(A0_21, A1_22)
  if nil == A1_22 then
    return
  end
  if A1_22 == 0 then
    return
  end
  A0_21.work.menuCategory = A1_22
end
function MapNavigationWidget.getMenuCategory(A0_23)
  return A0_23.work.menuCategory
end
function MapNavigationWidget.getMenuCategoryPrevious(A0_24)
  return A0_24.work.menuPrevious
end
function MapNavigationWidget.setMenuCategoryPrevious(A0_25, A1_26)
  A0_25.work.menuPrevious = A1_26
end
function MapNavigationWidget.initMenuList(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34
  L1_28 = "ListBox_NavigationMenu"
  L2_29 = "ControlTemplate_ListBoxItem_MenuItem"
  for L6_33 = 1, 30 do
    L7_34 = A0_27.getMenuItemName
    L7_34 = L7_34(A0_27, L6_33)
    A0_27:_addItem(nil, L1_28, L2_29, L7_34)
    A0_27:_setProperty(L7_34, L7_34, "Focusable", false)
    A0_27:_setProperty(L7_34, L7_34, "Visibility", "Visible")
  end
end
function MapNavigationWidget.setMenuListData(A0_35, A1_36, A2_37, A3_38, A4_39)
  local L5_40
  L5_40 = A0_35.getMenuItemName
  L5_40 = L5_40(A0_35, A1_36)
  if A2_37 == nil or A2_37 == "" then
    A0_35:_setProperty(L5_40, L5_40, "Visibility", "Collapsed")
    return
  end
  A0_35:_setProperty(L5_40, "TextBlock_MenuItemName", "Text", A2_37)
  A0_35:_setProperty(L5_40, "TextBlock_MenuItemName", "IntData.Value0", tostring(A3_38))
  if A4_39 == true then
    A0_35:_setProperty(L5_40, "Border_ClassIcon", "Visibility", "Visible")
  else
    A0_35:_setProperty(L5_40, "Border_ClassIcon", "Visibility", "Hidden")
  end
  A0_35:_setProperty(L5_40, L5_40, "Visibility", "Visible")
end
function MapNavigationWidget.setMenuListTitle(A0_41, A1_42)
  A0_41:setText("TextBlock_Title", A1_42)
end
function MapNavigationWidget.setMenuListItemVisible(A0_43, A1_44, A2_45)
  local L3_46
  if A1_44 > 30 then
    return
  end
  L3_46 = A0_43.getMenuItemName
  L3_46 = L3_46(A0_43, A1_44)
  if A2_45 == true then
    A0_43:_setProperty(L3_46, L3_46, "Visibility", "Visible")
  else
    A0_43:_setProperty(L3_46, L3_46, "Visibility", "Collapsed")
  end
end
function MapNavigationWidget.setMenuListItemText(A0_47, A1_48, A2_49, A3_50, ...)
  local L5_52
  if A1_48 > 30 then
    return
  end
  L5_52 = A0_47.getMenuItemName
  L5_52 = L5_52(A0_47, A1_48)
  A0_47:_setProperty(L5_52, "TextBlock_MenuItemName", "IntData.Value0", A1_48)
  if A3_50 == nil or A3_50 == "" then
    A0_47:setMenuListItemVisible(A1_48, false)
    return
  end
  A0_47:setItemText(L5_52, "TextBlock_MenuItemName", A3_50, ...)
  if A2_49 == true then
    A0_47:_setProperty(L5_52, "Border_ClassIcon", "Visibility", "Visible")
  else
    A0_47:_setProperty(L5_52, "Border_ClassIcon", "Visibility", "Hidden")
  end
  A0_47:setMenuListItemVisible(A1_48, true)
end
function MapNavigationWidget.setMenuListItemData(A0_53, A1_54, A2_55, A3_56)
  local L4_57
  if A1_54 > 30 then
    return
  end
  L4_57 = A0_53.getMenuItemName
  L4_57 = L4_57(A0_53, A1_54)
  A0_53:_setProperty(L4_57, "TextBlock_MenuItemName", "IntData.Value1", A2_55)
  if A3_56 ~= nil then
    A0_53:_setProperty(L4_57, "TextBlock_MenuItemName", "IntData.Value2", A3_56)
  end
end
function MapNavigationWidget.getMenuListItemData(A0_58, A1_59)
  local L2_60, L3_61, L4_62
  if A1_59 > 30 then
    L2_60 = -1
    L3_61 = -1
    return L2_60, L3_61
  end
  L3_61 = A0_58
  L2_60 = A0_58.getMenuItemName
  L4_62 = A1_59
  L2_60 = L2_60(L3_61, L4_62)
  L4_62 = A0_58
  L3_61 = A0_58._getProperty
  L3_61 = L3_61(L4_62, L2_60, "TextBlock_MenuItemName", "IntData.Value1")
  L4_62 = A0_58._getProperty
  L4_62 = L4_62(A0_58, L2_60, "TextBlock_MenuItemName", "IntData.Value2")
  return L3_61, L4_62
end
function MapNavigationWidget.clearMenuListItem(A0_63, A1_64)
  local L2_65, L3_66, L4_67, L5_68
  for L5_68 = A1_64, 30 do
    A0_63:setMenuListItemText(L5_68, nil, "")
    A0_63:setMenuListItemData(L5_68, -1, -1)
  end
end
function MapNavigationWidget.updateMenuList(A0_69)
  if A0_69.work.mode == 2 then
    A0_69:_setProperty(nil, "Label_NavigationMenu", "Visibility", "Hidden")
  else
    A0_69:_setProperty(nil, "Label_NavigationMenu", "Visibility", "Visible")
  end
  if A0_69:getMenuCategory() == 1 then
    A0_69:setTopMenuList()
    break
  else
  end
  if A0_69:getMenuCategory() == 2 then
    A0_69:setSelectRegionMenuList()
    break
  else
  end
  if A0_69:getMenuCategory() == 3 then
    A0_69:setSelectPieceMenuList()
    do break end
    break
  else
  end
end
function MapNavigationWidget.setPopupHelpMenuItem(A0_70, A1_71, A2_72)
  local L3_73
  L3_73 = A0_70.getMenuItemName
  L3_73 = L3_73(A0_70, A1_71)
  if A2_72 > 0 then
    A0_70:setHelpParameter(L3_73, 1, A2_72)
  else
    A0_70:setHelpParameter(L3_73, 0)
  end
end
function MapNavigationWidget.setTopMenuList(A0_74)
  local L1_75
  L1_75 = A0_74.setMenuListTitle
  L1_75(A0_74, 5205)
  L1_75 = A0_74.setMenuCategoryPrevious
  L1_75(A0_74, -1)
  L1_75 = 1
  A0_74:clearMenuListItem(L1_75)
  if A0_74.work.mode == 0 then
    A0_74:setMenuListItemText(L1_75, true, 5206)
    A0_74:setMenuListItemData(L1_75, 2)
    A0_74:setPopupHelpMenuItem(L1_75, 0)
    L1_75 = L1_75 + 1
  elseif A0_74.work.mode == 1 then
    L1_75 = 8
  end
  A0_74:setMenuListItemText(L1_75, false, 1318)
  A0_74:setMenuListItemData(L1_75, -1)
  A0_74:setPopupHelpMenuItem(L1_75, 77309)
  L1_75 = L1_75 + 1
  A0_74:focusMenuListItem(1)
end
function MapNavigationWidget.callbackTopMenuList(A0_76, A1_77)
  local L2_78, L3_79
  L3_79 = A0_76
  L2_78 = A0_76.getMenuListItemData
  L2_78 = L2_78(L3_79, A1_77)
  L3_79 = A0_76.work
  L3_79 = L3_79.mode
  if L3_79 == 1 then
    if L2_78 >= 0 then
      L3_79 = A0_76.getMenuListItemData
      L3_79 = L3_79(A0_76, A1_77)
      A0_76:dispMarker(L3_79)
    end
  elseif L2_78 >= 0 then
    L3_79 = A0_76.setMenuCategory
    L3_79(A0_76, L2_78)
  end
  if L2_78 < 0 then
    L3_79 = desktopWidget
    L3_79 = L3_79.closeWidgetDirect
    L3_79(L3_79, A0_76)
  end
end
function MapNavigationWidget.setSelectRegionMenuList(A0_80)
  local L1_81
  L1_81 = A0_80.setMenuListTitle
  L1_81(A0_80, 5205)
  L1_81 = A0_80.setMenuCategoryPrevious
  L1_81(A0_80, 1)
  L1_81 = 1
  A0_80:clearMenuListItem(L1_81)
  A0_80:setMenuListItemText(L1_81, false, A0_80:getRegionName(-2))
  A0_80:setMenuListItemData(L1_81, -2)
  A0_80:setPopupHelpMenuItem(L1_81, 77305)
  L1_81 = L1_81 + 1
  A0_80:setMenuListItemText(L1_81, false, A0_80:getRegionName(-3))
  A0_80:setMenuListItemData(L1_81, -3)
  A0_80:setPopupHelpMenuItem(L1_81, 77306)
  L1_81 = L1_81 + 1
  A0_80:setMenuListItemText(L1_81, true, A0_80:getRegionName(101))
  A0_80:setMenuListItemData(L1_81, 101)
  A0_80:setPopupHelpMenuItem(L1_81, 77307)
  L1_81 = L1_81 + 1
  A0_80:setMenuListItemText(L1_81, true, A0_80:getRegionName(102))
  A0_80:setMenuListItemData(L1_81, 102)
  A0_80:setPopupHelpMenuItem(L1_81, 77307)
  L1_81 = L1_81 + 1
  A0_80:setMenuListItemText(L1_81, true, A0_80:getRegionName(103))
  A0_80:setMenuListItemData(L1_81, 103)
  A0_80:setPopupHelpMenuItem(L1_81, 77307)
  L1_81 = L1_81 + 1
  A0_80:setMenuListItemText(L1_81, true, A0_80:getRegionName(104))
  A0_80:setMenuListItemData(L1_81, 104)
  A0_80:setPopupHelpMenuItem(L1_81, 77307)
  L1_81 = L1_81 + 1
  A0_80:setMenuListItemText(L1_81, true, A0_80:getRegionName(105))
  A0_80:setMenuListItemData(L1_81, 105)
  A0_80:setPopupHelpMenuItem(L1_81, 77307)
  L1_81 = L1_81 + 1
  A0_80:setMenuListItemText(L1_81, false, A0_80:getRegionName(-1))
  A0_80:setMenuListItemData(L1_81, -1)
  A0_80:setPopupHelpMenuItem(L1_81, 77308)
  L1_81 = L1_81 + 1
  A0_80:focusMenuListItem(1)
end
function MapNavigationWidget.getRegionName(A0_82, A1_83)
  local L2_84, L3_85
  if A1_83 == -1 then
    L2_84 = 100125
    return L2_84
  elseif A1_83 == -2 then
    L2_84 = 5207
    return L2_84
  elseif A1_83 == -3 then
    L2_84 = 5210
    return L2_84
  else
    L2_84 = 5201
    L3_85 = A1_83
    return L2_84, L3_85
  end
end
function MapNavigationWidget.callbackSelectRegionMenuList(A0_86, A1_87)
  if A0_86:getMenuListItemData(A1_87) == -1 then
    A0_86:setMenuCategory(1)
  elseif A0_86:getMenuListItemData(A1_87) == -2 then
    A0_86:setDisplayLocation(-1, -1)
  elseif A0_86:getMenuListItemData(A1_87) == -3 then
    A0_86:setDisplayLocation(101, 2)
  elseif A0_86:getMenuListItemData(A1_87) > 0 then
    A0_86.work.regionId = A0_86:getMenuListItemData(A1_87)
    A0_86:setMenuCategory(3)
  end
end
function MapNavigationWidget.setSelectPieceMenuList(A0_88)
  local L1_89, L2_90
  L2_90 = A0_88
  L1_89 = A0_88.setMenuListTitle
  L1_89(L2_90, 5205)
  L2_90 = A0_88
  L1_89 = A0_88.setMenuCategoryPrevious
  L1_89(L2_90, 2)
  L2_90 = A0_88
  L1_89 = A0_88.clearMenuListItem
  L1_89(L2_90, 1)
  L1_89 = desktopWidget
  L2_90 = L1_89
  L1_89 = L1_89.getAchieveAetheryteID
  L2_90 = L1_89(L2_90, A0_88.work.regionId, false)
  A0_88:requestLoadSpreadSheetData(aetheryte2DmapSheet, L1_89, L2_90)
end
function MapNavigationWidget.aetheryte2DmapSheetLoaded(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99
  L2_93 = desktopWidget
  L3_94 = L2_93
  L2_93 = L2_93.getAchieveAetheryteID
  L4_95 = A0_91.work
  L4_95 = L4_95.regionId
  L3_94 = L2_93(L3_94, L4_95, L5_96)
  L4_95 = 1
  L5_96(L6_97, L7_98)
  for L8_99 = L2_93, L3_94 do
    L4_95 = A0_91:pushSelectPieceMenuListItem(L4_95, A1_92, L8_99)
    A0_91:setMenuListItemVisible(L4_95, false)
  end
  L8_99 = nil
  L5_96(L6_97, L7_98, L8_99, 100125)
  L8_99 = -1
  L5_96(L6_97, L7_98, L8_99)
  L5_96(L6_97, L7_98)
  L8_99 = 77308
  L5_96(L6_97, L7_98, L8_99)
  L4_95 = L4_95 + 1
  L8_99 = false
  if L5_96 == false then
    L8_99 = 5211
    L5_96(L6_97, L7_98, L8_99)
  end
end
function MapNavigationWidget.pushSelectPieceMenuListItem(A0_100, A1_101, A2_102, A3_103)
  local L4_104, L5_105, L6_106, L7_107, L8_108
  for L7_107 = 17, 20 do
    L8_108 = A2_102._getData
    L8_108 = L8_108(A2_102, A3_103, L7_107)
    if L8_108 > 0 then
      A0_100:setMenuListItemText(A1_101, false, 5202, L8_108)
      A0_100:setMenuListItemData(A1_101, L8_108, A3_103)
      A0_100:setPopupHelpMenuItem(A1_101, 77307)
      A0_100:setMenuListItemVisible(A1_101, false)
      A1_101 = A1_101 + 1
    end
  end
  return A1_101
end
function MapNavigationWidget.updateAetheryteList(A0_109)
  local L1_110, L2_111, L3_112, L4_113, L5_114, L6_115, L7_116, L8_117
  L1_110 = false
  L2_111 = worldMaster
  L2_111 = L2_111._getMyPlayer
  L2_111 = L2_111(L3_112)
  for L6_115 = 1, 30 do
    L8_117 = A0_109
    L7_116 = A0_109.getMenuListItemData
    L8_117 = L7_116(L8_117, L6_115)
    if L8_117 >= 0 and L2_111:getAchieveAetheryte(L8_117) == true then
      A0_109:setMenuListItemVisible(L6_115, true)
      if L1_110 == false then
        A0_109:focusMenuListItem(L6_115)
        L1_110 = true
      end
    end
  end
end
function MapNavigationWidget.callbackSelectPieceMenuList(A0_118, A1_119)
  local L2_120
  L2_120 = A0_118.getMenuListItemData
  L2_120 = L2_120(A0_118, A1_119)
  if L2_120(A0_118, A1_119) < 0 then
    A0_118:setMenuCategory(2)
    return
  end
  if 0 > A0_118.work.mapDataId then
    A0_118.work.mapDataId = L2_120
    A0_118:requestLoadSpreadSheetData(mapNaviDataSheet, L2_120, L2_120)
  end
end
function MapNavigationWidget.mapNaviDataSheetLoaded(A0_121, A1_122)
  local L2_123, L3_124
  L3_124 = A1_122
  L2_123 = A1_122._getData
  L2_123 = L2_123(L3_124, A0_121.work.mapDataId, 1)
  L3_124 = A1_122._getData
  L3_124 = L3_124(A1_122, A0_121.work.mapDataId, 2)
  A0_121:setDisplayLocation(L2_123, L3_124)
  A0_121.work.mapDataId = -1
end
function MapNavigationWidget.processErrorDialogResult(A0_125, A1_126)
  desktopWidget:closeWidgetDirect(A0_125)
end
function MapNavigationWidget.setMapNavigationWidgetMarkerData(A0_127, A1_128, A2_129, A3_130, A4_131, A5_132, A6_133)
  local L7_134
  L7_134 = A1_128
  if L7_134 == 2 then
    A0_127:setActiveGuildleveMarker(A1_128, A2_129, A3_130, A4_131, A5_132, A6_133)
    break
  else
    if L7_134 == 1 then
  end
end
function MapNavigationWidget.setContentsMarker(A0_135, A1_136, A2_137, A3_138, A4_139, A5_140, A6_141, A7_142, A8_143, A9_144, A10_145, A11_146, A12_147, A13_148, A14_149, A15_150, A16_151)
  local L17_152
  L17_152 = ""
  if A1_136 ~= nil and A2_137 ~= nil then
    L17_152 = L17_152 .. tostring(A1_136) .. "," .. tostring(A2_137)
  end
  if A3_138 ~= nil and A4_139 ~= nil then
    if L17_152 ~= "" then
      L17_152 = L17_152 .. ","
    end
    L17_152 = L17_152 .. tostring(A3_138) .. "," .. tostring(A4_139)
  end
  if A5_140 ~= nil and A6_141 ~= nil then
    if L17_152 ~= "" then
      L17_152 = L17_152 .. ","
    end
    L17_152 = L17_152 .. tostring(A5_140) .. "," .. tostring(A6_141)
  end
  if A7_142 ~= nil and A8_143 ~= nil then
    if L17_152 ~= "" then
      L17_152 = L17_152 .. ","
    end
    L17_152 = L17_152 .. tostring(A7_142) .. "," .. tostring(A8_143)
  end
  if A9_144 ~= nil and A10_145 ~= nil then
    if L17_152 ~= "" then
      L17_152 = L17_152 .. ","
    end
    L17_152 = L17_152 .. tostring(A9_144) .. "," .. tostring(A10_145)
  end
  if A11_146 ~= nil and A12_147 ~= nil then
    if L17_152 ~= "" then
      L17_152 = L17_152 .. ","
    end
    L17_152 = L17_152 .. tostring(A11_146) .. "," .. tostring(A12_147)
  end
  if A13_148 ~= nil and A14_149 ~= nil then
    if L17_152 ~= "" then
      L17_152 = L17_152 .. ","
    end
    L17_152 = L17_152 .. tostring(A13_148) .. "," .. tostring(A14_149)
  end
  if A15_150 ~= nil and A16_151 ~= nil then
    if L17_152 ~= "" then
      L17_152 = L17_152 .. ","
    end
    L17_152 = L17_152 .. tostring(A15_150) .. "," .. tostring(A16_151)
  end
  A0_135:_setProperty(nil, "CustomControl_MapNavigation", "Marker", tostring(L17_152))
end
function MapNavigationWidget.setInitializeMapMarker(A0_153)
  local L1_154
end
function MapNavigationWidget.setDisplayLocation(A0_155, A1_156, A2_157)
  A0_155:_setProperty(nil, "CustomControl_MapNavigation", "Layout", A1_156)
  A0_155:_setProperty(nil, "CustomControl_MapNavigation", "Rect", A2_157)
  A0_155:_setProperty(nil, "CustomControl_MapNavigation", "Ready", false)
  A0_155:_setProperty(nil, "CustomControl_MapNavigation", "Ready", true)
end
function MapNavigationWidget.zoomOut(A0_158)
  if A0_158:_getProperty(nil, "CustomControl_MapNavigation", "Scale") <= 0.3 then
    return
  end
end
function MapNavigationWidget.zoomIn(A0_159)
  if A0_159:_getProperty(nil, "CustomControl_MapNavigation", "Scale") >= 2 then
    return
  end
end
function MapNavigationWidget.clearActiveGuildleveMarker(A0_160)
  A0_160:deleteListPropertyAll("GLMakerData")
end
function MapNavigationWidget.setActiveGuildleveMarker(A0_161, A1_162, A2_163, A3_164, A4_165, A5_166, A6_167)
  local L7_168
  if A1_162 == nil or A1_162 == "" then
    return
  end
  if A2_163 < 0 or A2_163 > 8 or A2_163 == "" then
    return
  end
  if A3_164 == nil or A3_164 == "" then
  end
  if A4_165 == nil or A4_165 == "" then
    return
  end
  if A5_166 == nil or A5_166 == "" then
    return
  end
  if A6_167 == nil or A6_167 == "" then
    return
  end
  L7_168 = nil
  if A3_164 == 1 then
    L7_168 = 32
    break
  else
  end
  if A3_164 == 2 then
    L7_168 = 64
    break
  else
  end
  if A3_164 == 3 then
    L7_168 = 128
    break
  else
  end
  do return end
  A0_161:setListProperty("GLMakerData", A2_163, "X", math:_floor(A4_165))
  A0_161:setListProperty("GLMakerData", A2_163, "Y", math:_floor(A5_166))
  A0_161:setListProperty("GLMakerData", A2_163, "Z", math:_floor(A6_167))
  A0_161:setListProperty("GLMakerData", A2_163, "Radius", L7_168)
  A0_161:updateListProperty("GLMakerData")
end
function MapNavigationWidget.initMarkerList(A0_169, A1_170)
end
function MapNavigationWidget.addMarkerList(A0_171, A1_172, A2_173)
  if A0_171:getMenuCategory() == 1 then
    A0_171:setMenuListItemText(A1_172, false, 5208, A2_173)
    A0_171:setMenuListItemData(A1_172, A2_173)
    A0_171:setMenuListItemVisible(A1_172, true)
  end
end
function MapNavigationWidget.dispMarker(A0_174, A1_175)
  A0_174:_setProperty(nil, "CustomControl_MapNavigation", "QuestMapIndex", A1_175)
end
function MapNavigationWidget.setQuestMarker(A0_176, A1_177)
  A0_176:_setProperty(nil, "ssd_marker_data", "Row", A1_177)
end
