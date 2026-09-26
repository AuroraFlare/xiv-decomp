require("/Widget/WidgetBaseClass")
_defineClass("MainMenuWidget", "WidgetBaseClass")
function MainMenuWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4
  L4_4 = "isInviteCommandShow"
  L4_4 = {
    "isRectCommandShow",
    "boolean"
  }
  L1_1._temp = L2_2
  L4_4 = "UILuaCommands.SelectionChanged"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "UILuaCommands.SelectionChanged"
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L1_1.mainMenuIndex = -1
  L4_4 = 0
  L1_1(L2_2, L3_3, L4_4, "MainName", 2128)
  L4_4 = 1
  L1_1(L2_2, L3_3, L4_4, "MainName", 2129)
  L4_4 = 2
  L1_1(L2_2, L3_3, L4_4, "MainName", 2102)
  L4_4 = 3
  L1_1(L2_2, L3_3, L4_4, "MainName", 2115)
  L4_4 = 4
  L1_1(L2_2, L3_3, L4_4, "MainName", 2103)
  L4_4 = 5
  L1_1(L2_2, L3_3, L4_4, "MainName", 2104)
  L4_4 = 6
  L1_1(L2_2, L3_3, L4_4, "MainName", 12001)
  L4_4 = 7
  L1_1(L2_2, L3_3, L4_4, "MainName", 2130)
  L4_4 = 8
  L1_1(L2_2, L3_3, L4_4, "MainName", 2109)
  L4_4 = 9
  L1_1(L2_2, L3_3, L4_4, "MainName", 2107)
  L4_4 = 10
  L1_1(L2_2, L3_3, L4_4, "MainName", 2113)
  L4_4 = 11
  L1_1(L2_2, L3_3, L4_4, "MainName", 2114)
  L4_4 = 12
  L1_1(L2_2, L3_3, L4_4, "MainName", 2106)
  L4_4 = 13
  L1_1(L2_2, L3_3, L4_4, "MainName", 2124)
  L4_4 = 14
  L1_1(L2_2, L3_3, L4_4, "MainName", 2111)
  L4_4 = 15
  L1_1(L2_2, L3_3, L4_4, "DataTemplate_ListBoxItem_Return")
  L4_4 = 15
  L1_1(L2_2, L3_3, L4_4, "MainName", 2112)
  L4_4 = 16
  L1_1(L2_2, L3_3, L4_4, "MainName", 2105)
  L4_4 = 17
  L1_1(L2_2, L3_3, L4_4, "MainName", 2108)
  L4_4 = 18
  L1_1(L2_2, L3_3, L4_4, "MainName", 2110)
  L4_4 = 0
  L1_1(L2_2, L3_3, L4_4, "Help", 75721)
  L4_4 = 1
  L1_1(L2_2, L3_3, L4_4, "Help", 75722)
  L4_4 = 2
  L1_1(L2_2, L3_3, L4_4, "Help", 75723)
  L4_4 = 3
  L1_1(L2_2, L3_3, L4_4, "Help", 75724)
  L4_4 = 4
  L1_1(L2_2, L3_3, L4_4, "Help", 75725)
  L4_4 = 5
  L1_1(L2_2, L3_3, L4_4, "Help", 75726)
  L4_4 = 6
  L1_1(L2_2, L3_3, L4_4, "Help", 75740)
  L4_4 = 7
  L1_1(L2_2, L3_3, L4_4, "Help", 75739)
  L4_4 = 8
  L1_1(L2_2, L3_3, L4_4, "Help", 75727)
  L4_4 = 9
  L1_1(L2_2, L3_3, L4_4, "Help", 75728)
  L4_4 = 10
  L1_1(L2_2, L3_3, L4_4, "Help", 75729)
  L4_4 = 11
  L1_1(L2_2, L3_3, L4_4, "Help", 75730)
  L4_4 = 12
  L1_1(L2_2, L3_3, L4_4, "Help", 75731)
  L4_4 = 13
  L1_1(L2_2, L3_3, L4_4, "Help", 75732)
  L4_4 = 14
  L1_1(L2_2, L3_3, L4_4, "Help", 75733)
  L4_4 = 15
  L1_1(L2_2, L3_3, L4_4, "Help", 75734)
  L4_4 = 16
  L1_1(L2_2, L3_3, L4_4, "Help", 75735)
  L4_4 = 17
  L1_1(L2_2, L3_3, L4_4, "Help", 75736)
  L4_4 = 18
  L1_1(L2_2, L3_3, L4_4, "Help", 75737)
  for L4_4 = 0, 18 do
    A0_0:setListProperty("MainMenu", L4_4, "MainEnable", "True")
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  if L1_1 == true then
    L4_4 = 16
    L1_1(L2_2, L3_3, L4_4, false)
  end
end
function MainMenuWidget.processUICommandSelectionChanged(A0_5, A1_6, A2_7, A3_8, A4_9)
  local L5_10, L6_11, L7_12, L8_13
  L5_10 = A2_7
  if L5_10 == "ListBox_MainMenu" then
    L6_11 = A3_8
    if L6_11 == 0 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "StatusWidget", A0_5)
      break
    else
    end
    if L6_11 == 1 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "EquipWidget", A0_5)
      break
    else
    end
    if L6_11 == 2 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "ActionSettingWidget", A0_5)
      break
    else
    end
    if L6_11 == 3 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.executePlayerBonusPointAssign
      L7_12(L8_13)
      break
    else
    end
    if L6_11 == 4 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.setBazaarActor
      L7_12(L8_13)
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "ItemListWidget", A0_5, true)
      break
    else
    end
    if L6_11 == 5 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "Ask/JournalListWidget", A0_5, 1)
      break
    else
    end
    if L6_11 == 6 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "AchievementListWidget", A0_5)
      break
    else
    end
    if L6_11 == 7 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "PcSearchWidget", A0_5)
      break
    else
    end
    if L6_11 == 8 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "PartyRootWidget", A0_5)
      break
    else
    end
    if L6_11 == 11 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "RetainerListWidget", A0_5)
      break
    else
    end
    if L6_11 == 12 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.processCommandMap
      L7_12(L8_13)
      break
    else
    end
    if L6_11 == 13 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.openMainMenuRootWidget
      L7_12(L8_13, "NpcLinkshellListWidget", A0_5)
      break
    else
    end
    if L6_11 == 14 then
      L8_13 = A0_5
      L7_12 = A0_5.hide
      L7_12(L8_13)
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.executePlayerTelepo
      L7_12(L8_13, 0)
      break
    else
    end
    if L6_11 == 15 then
      L8_13 = A0_5
      L7_12 = A0_5.hide
      L7_12(L8_13)
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.executePlayerReturn
      L7_12(L8_13)
      break
    else
    end
    if L6_11 == 17 then
      L7_12 = desktopWidget
      L8_13 = L7_12
      L7_12 = L7_12.isChinese
      L7_12 = L7_12(L8_13)
      if L7_12 == false then
        L7_12 = desktopWidget
        L8_13 = L7_12
        L7_12 = L7_12.openMainMenuRootWidget
        L7_12(L8_13, "ConfigWidget", A0_5)
      else
        L8_13 = A0_5
        L7_12 = A0_5.hide
        L7_12(L8_13)
        L7_12 = desktopWidget
        L8_13 = L7_12
        L7_12 = L7_12.executePlayerLogout
        L7_12(L8_13)
        do break end
        else
        end
        if L6_11 == 18 then
          L7_12 = desktopWidget
          L8_13 = L7_12
          L7_12 = L7_12.isChinese
          L7_12 = L7_12(L8_13)
          if L7_12 == false then
            L8_13 = A0_5
            L7_12 = A0_5.hide
            L7_12(L8_13)
            L7_12 = desktopWidget
            L8_13 = L7_12
            L7_12 = L7_12.executePlayerLogout
            L7_12(L8_13)
            do break end
            else
            end
            if L6_11 == 9 then
              L7_12 = desktopWidget
              L8_13 = L7_12
              L7_12 = L7_12.openMainMenuRootWidget
              L7_12(L8_13, "CommunityMenuWidget", A0_5)
              break
            else
            end
            if L6_11 == 10 then
              L7_12 = desktopWidget
              L8_13 = L7_12
              L7_12 = L7_12.openMainMenuRootWidget
              L7_12(L8_13, "Ask/LinkshellListWidget", A0_5, 1)
              break
            else
            end
            if L6_11 == 16 then
              L7_12 = desktopWidget
              L8_13 = L7_12
              L7_12 = L7_12.isChinese
              L7_12 = L7_12(L8_13)
              if L7_12 == false then
                L7_12 = desktopWidget
                L8_13 = L7_12
                L7_12 = L7_12.openMainMenuRootWidget
                L7_12(L8_13, "SupportDeskWidget", A0_5)
              else
                L7_12 = desktopWidget
                L8_13 = L7_12
                L7_12 = L7_12.openMainMenuRootWidget
                L7_12(L8_13, "ConfigWidget", A0_5)
                break
              end
            else
            end
          else
          end
      end
    L6_11 = A0_5.work
    L6_11.mainMenuIndex = A3_8
    break
  else
  end
  if L5_10 == "ListBox_SystemMenu" then
    L7_12 = A0_5
    L6_11 = A0_5.hide
    L6_11(L7_12)
    L7_12 = A0_5
    L6_11 = A0_5.getListProperty
    L8_13 = "SystemMenu"
    L6_11 = L6_11(L7_12, L8_13, A3_8, "SystemCommandID")
    L8_13 = A0_5
    L7_12 = A0_5.getListProperty
    L7_12 = L7_12(L8_13, "SystemMenu", A3_8, "SystemCommandInfo")
    L8_13 = A0_5.getListProperty
    L8_13 = L8_13(A0_5, "SystemMenu", A3_8, "SystemSubTarget")
    A0_5:executeCommand(L6_11, L7_12, L8_13)
    A0_5.work.mainMenuIndex = -1
    do break end
    break
  else
  end
end
function MainMenuWidget.processUICommandClose(A0_14, A1_15, A2_16, A3_17, A4_18)
  if desktopWidget:getTutorialMenuType() == 1 and desktopWidget:getTutorialMenuStatus() == 2 then
    if worldMaster:_getMyPlayer():getInitialTown() == 2 then
      desktopWidget:openTutorialWidget(nil, 17)
      desktopWidget:setTutorialMask(false, true, true, true, true, 4)
    else
      desktopWidget:openTutorialWidget(nil, 14)
      desktopWidget:setTutorialMask(false, false, false, true, false, 3)
    end
    desktopWidget:setTutorialMenuStatus(3)
  end
  A0_14.work.mainMenuIndex = A0_14:getFocusedIndex("ListBox_MainMenu")
  A0_14:hide()
end
function MainMenuWidget.processUICommandDefault(A0_19, A1_20, A2_21, A3_22, A4_23, A5_24)
  local L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31
  L6_25 = A3_22
  if L6_25 == "UILuaCommands.Activated" then
    L7_26 = A0_19.work
    L7_26 = L7_26.mainMenuIndex
    if L7_26 >= 0 then
      L8_27 = A0_19
      L7_26 = A0_19.setFocusMainMenu
      L9_28 = A0_19.work
      L9_28 = L9_28.mainMenuIndex
      L7_26(L8_27, L9_28)
      do break end
      else
      end
      if L6_25 == "RaptureCommands.TimerEnd" then
        L8_27 = A0_19
        L7_26 = A0_19.getButtonMask
        L9_28 = false
        L12_31 = L7_26(L8_27, L9_28)
        A0_19:setListProperty("MainMenu", 15, "MainEnable", L12_31)
        A0_19:setListProperty("MainMenu", 15, "TimerVisibility", "Collapsed")
        A0_19:updateListProperty("MainMenu")
        break
      else
      end
    else
    end
end
function MainMenuWidget.processBeforeShow(A0_32, A1_33)
  if A0_32.work.systemCommandCount > 0 and A0_32:getVisibility("Grid_SystemMenu") == true then
    if A0_32.work.systemCommandCount == 1 and A0_32.work.isCraftCommandShow == true then
      if 0 > A0_32.work.mainMenuIndex then
        A0_32:setFocusSystemMenu(0)
      end
    else
      A0_32:setFocusSystemMenu(0)
    end
  end
  A0_32:updateMainMenu()
  if desktopWidget:getTutorialMenuType() == 1 and desktopWidget:getTutorialMenuStatus() == 0 then
    desktopWidget:closeTutorialWidget()
    desktopWidget:openTutorialWidget(nil, 16)
    desktopWidget:setTutorialMenuStatus(1)
  end
  return true
end
function MainMenuWidget.processSubTargetDecided(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39, A6_40)
  if A1_35 ~= nil and A0_34.work.castingSystemCommand > 0 then
    desktopWidget:executePlayerSystemCommand(A0_34.work.castingSystemCommand, nil, nil, A1_35)
  end
  A0_34.work.castingSystemCommand = 0
end
function MainMenuWidget.processAskResult(A0_41, A1_42)
  if A1_42 ~= 3 and A0_41.work.castingSystemCommand > 0 then
    desktopWidget:executePlayerSystemCommand(A0_41.work.castingSystemCommand, nil, A1_42)
  end
  A0_41.work.castingSystemCommand = 0
end
function MainMenuWidget.update(A0_43)
  A0_43:updateMainMenu()
end
function MainMenuWidget.updateButtonMask(A0_44)
  local L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51
  L2_46 = A0_44
  L1_45 = A0_44.getButtonMask
  L3_47 = true
  L6_50 = L1_45(L2_46, L3_47)
  L7_51 = L1_45
  if worldMaster:_getMyPlayer():isBattleClass() == false then
    L7_51 = false
  end
  A0_44:setDezionTimer()
  A0_44:setListProperty("MainMenu", 0, "MainEnable", L4_48)
  A0_44:setListProperty("MainMenu", 1, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 2, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 3, "MainEnable", L7_51)
  A0_44:setListProperty("MainMenu", 4, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 5, "MainEnable", L2_46)
  A0_44:setListProperty("MainMenu", 6, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 7, "MainEnable", L5_49)
  A0_44:setListProperty("MainMenu", 8, "MainEnable", L5_49)
  A0_44:setListProperty("MainMenu", 9, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 10, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 11, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 12, "MainEnable", L4_48)
  A0_44:setListProperty("MainMenu", 13, "MainEnable", L3_47)
  A0_44:setListProperty("MainMenu", 14, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 15, "MainEnable", L6_50)
  A0_44:setListProperty("MainMenu", 16, "MainEnable", L1_45)
  A0_44:setListProperty("MainMenu", 17, "MainEnable", L4_48)
  A0_44:setListProperty("MainMenu", 18, "MainEnable", L4_48)
  A0_44:updateListProperty("MainMenu")
end
function MainMenuWidget.isButtonEnable(A0_52, A1_53)
  return A0_52:getListProperty("MainMenu", A1_53, "MainEnable")
end
function MainMenuWidget.getButtonMask(A0_54, A1_55)
  local L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63
  L2_56 = false
  L3_57 = false
  L4_58 = false
  L5_59 = false
  L6_60 = false
  L7_61 = desktopWidget
  L8_62 = L7_61
  L7_61 = L7_61.getTutorialMenuType
  L7_61 = L7_61(L8_62)
  L8_62 = L7_61
  if L8_62 == 1 then
    L3_57 = true
    break
  else
  end
  if L8_62 == 2 then
    L4_58 = true
    break
  else
  end
  if L8_62 == 3 then
    L3_57 = true
    L5_59 = true
    break
  else
    if L8_62 == 4 then
      break
    else
    end
    L2_56 = true
    L3_57 = true
    L4_58 = true
    L5_59 = true
    L6_60 = true
    break
  end
  L8_62 = worldMaster
  L9_63 = L8_62
  L8_62 = L8_62._getMyPlayer
  L8_62 = L8_62(L9_63)
  L9_63 = L8_62.isRestrictedByContents
  L9_63 = L9_63(L8_62, 1)
  if L9_63 == true then
    L6_60 = false
  end
  L9_63 = L2_56
  if L9_63 == true and worldMaster:_getMyPlayer():isDead() == false then
    if desktopWidget:isMyPlayerOccupancy() == true then
      L9_63 = false
    elseif A1_55 == true and worldMaster:_getMyPlayer():getWarpRecastTime() > 0 then
      L9_63 = false
    end
  end
  return L2_56, L3_57, L4_58, L5_59, L6_60, L9_63
end
function MainMenuWidget.setDezionTimer(A0_64)
  local L1_65, L2_66
  L1_65 = worldMaster
  L2_66 = L1_65
  L1_65 = L1_65._getMyPlayer
  L1_65 = L1_65(L2_66)
  L2_66 = L1_65.getWarpRecastTime
  L2_66 = L2_66(L1_65)
  if L1_65:isDead() == true then
    L2_66 = 0
  end
  if L2_66 > 0 then
    A0_64:setListProperty("MainMenu", 15, "FValue0", L2_66)
    A0_64:setListProperty("MainMenu", 15, "FValue1", 0)
    A0_64:setListProperty("MainMenu", 15, "IValue0", 1)
    A0_64:setListProperty("MainMenu", 15, "TimerVisibility", "Visible")
  else
    A0_64:setListProperty("MainMenu", 15, "TimerVisibility", "Collapsed")
  end
  A0_64:updateListProperty("MainMenu")
end
function MainMenuWidget.updateSystemCommand(A0_67)
  local L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76, L10_77, L11_78, L12_79
  L1_68 = worldMaster
  L2_69 = L1_68
  L1_68 = L1_68._getMyPlayer
  L1_68 = L1_68(L2_69)
  L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75 = nil, nil, nil, nil, nil, nil, nil
  L3_70 = L9_76
  if L3_70 ~= nil and L3_70 ~= 40004 then
    L9_76.isInviteCommandShow = true
    L12_79 = 1103
    L9_76(L10_77, L11_78, L12_79, 264, L3_70)
  elseif L9_76 == 24306 then
    if L9_76 ~= nil then
      L12_79 = "CommonAskWidget"
      L10_77(L11_78, L12_79, A0_67)
      L10_77.castingSystemCommand = 0
    end
  end
  if L9_76 then
    if L9_76 > 0 then
      if L9_76 ~= nil then
        L12_79 = "CommonAskWidget"
        L10_77(L11_78, L12_79, A0_67)
        L10_77.castingSystemCommand = 0
      end
    end
    return
  end
  if L9_76 == true then
    L9_76.isBootyCommandShow = true
    L12_79 = 2127
    L9_76(L10_77, L11_78, L12_79, 289)
  end
  L8_75 = L11_78
  L7_74 = L10_77
  L3_70 = L9_76
  if L3_70 ~= nil then
    L9_76.isInviteCommandShow = true
    L12_79 = 1103
    L9_76(L10_77, L11_78, L12_79, 264, L3_70)
  elseif L9_76 then
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 264)
  elseif L9_76 == 24305 then
    if L9_76 ~= nil then
      L12_79 = "CommonAskWidget"
      L10_77(L11_78, L12_79, A0_67)
      L10_77.castingSystemCommand = 0
    end
  end
  L3_70 = L9_76
  if L3_70 ~= nil then
    L9_76.isInviteCommandShow = true
    L12_79 = 1103
    L9_76(L10_77, L11_78, L12_79, 264, L3_70)
  elseif L9_76 == 24304 then
    if L9_76 ~= nil then
      L12_79 = "CommonAskWidget"
      L10_77(L11_78, L12_79, A0_67)
      L10_77.castingSystemCommand = 0
    end
  end
  L8_75 = L11_78
  L7_74 = L10_77
  L3_70 = L9_76
  if L3_70 ~= nil then
    L9_76.isInviteCommandShow = true
    L12_79 = 1103
    L9_76(L10_77, L11_78, L12_79, 264, L3_70)
  elseif L9_76 then
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 264)
  elseif L9_76 == 24303 then
    if L9_76 ~= nil then
      L12_79 = "CommonAskWidget"
      L10_77(L11_78, L12_79, A0_67)
      L10_77.castingSystemCommand = 0
    end
  end
  L7_74 = L10_77
  L3_70 = L9_76
  if L3_70 ~= nil then
    L12_79 = L9_76
    if not L11_78 then
      L12_79 = L9_76
      if L11_78 then
      else
        L12_79 = L9_76
        if L11_78 then
        else
          L12_79 = L9_76
          if L11_78 then
          else
            L12_79 = L9_76
            if L11_78 then
            end
          end
        end
      end
    end
    L11_78.isContentsCommandShow = true
    L12_79 = A0_67
    L11_78(L12_79, 24302, 1102, 246, L3_70, L10_77)
  end
  if L9_76 then
    L9_76.isPcCommandShow = true
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 452)
  end
  if L9_76 then
    L9_76.isPcCommandShow = true
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 452)
  end
  if L9_76 then
    L9_76.isPcCommandShow = true
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 452)
  end
  if L9_76 then
    L9_76.isPcCommandShow = true
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 452)
  end
  if L9_76 then
    L9_76.isPcCommandShow = true
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 452)
  end
  if L9_76 ~= 0 then
    L9_76.isPcCommandShow = true
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 452)
  end
  if L9_76 then
    L9_76.isPcCommandShow = true
    L12_79 = 1104
    L9_76(L10_77, L11_78, L12_79, 452, 18)
  end
  for L12_79 = 1, 1 do
    L3_70, L4_71, L5_72, L6_73 = L1_68:getPlaceDrivenCommandVariation(L12_79)
    if L3_70 ~= nil then
      A0_67.work.isRectCommandShow = true
      A0_67:addSystemCommand(24301, 1101, 265, L3_70)
    end
  end
  L3_70 = L9_76
  if L3_70 ~= nil then
    if not L9_76 and L3_70 == 10002 then
      L9_76.isRectCommandShow = true
      L12_79 = 2125
      L9_76(L10_77, L11_78, L12_79, 265, L3_70)
    end
  elseif L9_76 then
    L9_76.isRectCommandShow = true
    L12_79 = 2126
    L9_76(L10_77, L11_78, L12_79, 265, 0)
  end
end
function MainMenuWidget.updateMainMenuCommand(A0_80)
  A0_80:updateButtonMask()
end
function MainMenuWidget.updateReadyCommand(A0_81)
  local L1_82, L2_83, L3_84, L4_85, L5_86, L6_87, L7_88, L8_89, L9_90
  L1_82 = desktopWidget
  L2_83 = L1_82
  L1_82 = L1_82.isMyPlayerDead
  L1_82 = L1_82(L2_83)
  if L1_82 then
    return
  end
  L1_82, L2_83, L3_84, L4_85 = nil, nil, nil, nil
  L5_86 = desktopWidget
  L5_86 = L5_86.getPlayerEquippedReadyCommandSlotLength
  L5_86 = L5_86(L6_87)
  for L9_90 = 1, L5_86 do
    L1_82, L2_83, L3_84 = desktopWidget:getPlayerEquippedReadyCommand(L9_90)
    if L3_84 then
      L4_85 = desktopWidget:getCommandID(L1_82)
      if L4_85 == 22001 then
        A0_81:addReadyCommand(L4_85, 1104, 223, L9_90)
        A0_81.work.isCraftCommandShow = true
        break
      else
      end
      if L4_85 == 29497 and desktopWidget:canTargetNegotiation() then
        A0_81:addReadyCommand(L4_85, 1104, 30232, L9_90)
        A0_81.work.isNegotiationCommandShow = true
        break
      else
      end
    else
    end
  end
end
function MainMenuWidget.updateMainMenu(A0_91)
  local L1_92, L2_93, L3_94, L4_95
  L1_92 = desktopWidget
  L2_93 = L1_92
  L1_92 = L1_92.getStaticWidget
  L3_94 = 16
  L1_92 = L1_92(L2_93, L3_94)
  L2_93 = false
  L3_94 = A0_91.work
  L3_94 = L3_94.systemCommandCount
  L4_95 = A0_91.work
  L4_95.systemCommandCount = 0
  L4_95 = A0_91.work
  L4_95.isRectCommandShow = false
  L4_95 = A0_91.work
  L4_95.isPcCommandShow = false
  L4_95 = A0_91.work
  L4_95.isInviteCommandShow = false
  L4_95 = A0_91.work
  L4_95.isContentsCommandShow = false
  L4_95 = A0_91.work
  L4_95.isNegotiationCommandShow = false
  L4_95 = A0_91.work
  L4_95.isBootyCommandShow = false
  L4_95 = A0_91.work
  L4_95.isCraftCommandShow = false
  L4_95 = A0_91.updateMainMenuCommand
  L4_95(A0_91)
  L4_95 = A0_91.updateReadyCommand
  L4_95(A0_91)
  L4_95 = A0_91.updateSystemCommand
  L4_95(A0_91)
  L4_95 = A0_91.work
  L4_95 = L4_95.systemCommandCount
  if L4_95 > 0 then
    L4_95 = A0_91.getVisibility
    L4_95 = L4_95(A0_91, "Grid_SystemMenu")
    if L4_95 == false then
      L4_95 = A0_91.setVisibility
      L4_95(A0_91, "Grid_SystemMenu", true)
      L2_93 = true
    else
      L4_95 = A0_91.work
      L4_95 = L4_95.isCraftCommandShow
      if L4_95 == true and L3_94 == 1 then
        L4_95 = A0_91.work
        L4_95 = L4_95.systemCommandCount
        if L4_95 >= 2 then
          L2_93 = true
        end
      end
    end
    L4_95 = L1_92.updateNotice
    L4_95(L1_92, A0_91.work.isInviteCommandShow, A0_91.work.isPcCommandShow, A0_91.work.isRectCommandShow, A0_91.work.isContentsCommandShow, A0_91.work.isNegotiationCommandShow, A0_91.work.isBootyCommandShow)
  else
    L4_95 = A0_91.setVisibility
    L4_95(A0_91, "Grid_SystemMenu", false)
    L4_95 = L1_92.updateNotice
    L4_95(L1_92, false, false, false, false, false, false)
  end
  L4_95 = A0_91.work
  L4_95 = L4_95.systemCommandCount
  L4_95 = L4_95 + 1
  for _FORV_8_ = L4_95, L3_94 do
    A0_91:removeSystemCommand(L4_95)
  end
  A0_91:updateListProperty("SystemMenu")
  if L2_93 == true then
    A0_91:setFocusSystemMenu(0)
  end
end
function MainMenuWidget.executeCommand(A0_96, A1_97, A2_98, A3_99)
  local L4_100, L5_101, L6_102, L7_103, L8_104, L9_105
  L4_100 = worldMaster
  L5_101 = L4_100
  L4_100 = L4_100._getMyPlayer
  L4_100 = L4_100(L5_101)
  if A1_97 == nil then
    L5_101 = false
    return L5_101
  end
  L5_101 = A1_97
  if L5_101 == 24303 then
    L6_102 = A0_96.work
    L6_102.castingSystemCommand = A1_97
    L7_103 = L4_100
    L6_102 = L4_100.getConfirmGroupCommandVariation
    L8_104 = L6_102(L7_103)
    if L6_102 == 10001 then
      L9_105 = desktopWidget
      L9_105 = L9_105.openMainMenuRootWidget
      L9_105(L9_105, "CommonAskWidget", A0_96, nil, A0_96:packTextParameter(1121, L7_103), 1, 1122, 1123, 1136)
    elseif L6_102 == 10002 then
      L9_105 = desktopWidget
      L9_105 = L9_105.openMainMenuRootWidget
      L9_105(L9_105, "CommonAskWidget", A0_96, nil, A0_96:packTextParameter(1137, L7_103), 1, 1138, 1139, 1136)
      do break end
      else
      end
      if L5_101 == 24304 then
        L6_102 = A0_96.work
        L6_102.castingSystemCommand = A1_97
        L7_103 = L4_100
        L6_102 = L4_100.getConfirmWarpCommandVariation
        L9_105 = L6_102(L7_103)
        desktopWidget:openMainMenuRootWidget("CommonAskWidget", A0_96, nil, A0_96:packTextParameter(1130, L7_103, L9_105), 1, 1131, 1132, 1136)
        break
      else
      end
      if L5_101 == 24305 then
        L6_102 = A0_96.work
        L6_102.castingSystemCommand = A1_97
        L7_103 = L4_100
        L6_102 = L4_100.getConfirmTradeCommandVariation
        L8_104 = L6_102(L7_103)
        L9_105 = desktopWidget
        L9_105 = L9_105.openMainMenuRootWidget
        L9_105(L9_105, "CommonAskWidget", A0_96, nil, A0_96:packTextParameter(1124, L7_103), 1, 1125, 1126, 1136)
        break
      else
      end
      if L5_101 == 24306 then
        L6_102 = A0_96.work
        L6_102.castingSystemCommand = A1_97
        L7_103 = L4_100
        L6_102 = L4_100.getConfirmRaiseCommandVariation
        L8_104 = L6_102(L7_103)
        L9_105 = desktopWidget
        L9_105 = L9_105.openMainMenuRootWidget
        L9_105(L9_105, "CommonAskWidget", A0_96, nil, A0_96:packTextParameter(1127, L7_103), 1, 1128, 1129, 1136)
        break
      else
      end
      if L5_101 == 24215 then
        L6_102 = desktopWidget
        L7_103 = L6_102
        L6_102 = L6_102.executeBazaarCommand
        return L6_102(L7_103)
      else
      end
      if L5_101 == 24302 then
        if A3_99 == nil or A3_99 == 100 then
          L6_102 = desktopWidget
          L7_103 = L6_102
          L6_102 = L6_102.executePlayerSystemCommand
          L8_104 = A1_97
          return L6_102(L7_103, L8_104)
        else
          L6_102 = A0_96.work
          L6_102.castingSystemCommand = 24302
          L7_103 = A0_96
          L6_102 = A0_96.requestSelectSubTarget
          L8_104 = A3_99
          L9_105 = true
          L6_102(L7_103, L8_104, L9_105)
          L6_102 = true
          do return L6_102 end
          do break end
          else
          end
          if L5_101 == 22001 then
            L6_102 = desktopWidget
            L7_103 = L6_102
            L6_102 = L6_102.getPlayerEquippedReadyCommand
            L8_104 = A2_98
            L8_104 = L6_102(L7_103, L8_104)
            if L8_104 == true then
              L9_105 = desktopWidget
              L9_105 = L9_105.executePlayerCommand
              return L9_105(L9_105, L6_102, nil, nil, nil, nil, worldMaster:_getMyPlayer())
            end
            L9_105 = A0_96.work
            L9_105.mainMenuIndex = -1
            break
          else
          end
          if L5_101 == 29497 then
            L6_102 = desktopWidget
            L7_103 = L6_102
            L6_102 = L6_102.getPlayerEquippedReadyCommand
            L8_104 = A2_98
            L8_104 = L6_102(L7_103, L8_104)
            if L8_104 == true then
              L9_105 = desktopWidget
              L9_105 = L9_105.executePlayerCommand
              do return L9_105(L9_105, L6_102) end
              do break end
              else
              end
              if L5_101 == 24232 then
                L6_102 = desktopWidget
                L7_103 = L6_102
                L6_102 = L6_102.executePlayerCurrentLinkshellInvite
                L6_102(L7_103)
                break
              else
              end
              if L5_101 == 24233 then
                L6_102 = desktopWidget
                L7_103 = L6_102
                L6_102 = L6_102.executePlayerTargetLinkshellInviteCancel
                L6_102(L7_103)
                break
              else
              end
              if L5_101 == 24238 then
                L6_102 = desktopWidget
                L7_103 = L6_102
                L6_102 = L6_102.executePlayerCheck
                L6_102(L7_103)
                break
              else
              end
              if L5_101 == 0 then
                L6_102 = desktopWidget
                L7_103 = L6_102
                L6_102 = L6_102.openDropItemWidget
                L6_102(L7_103)
                break
              else
              end
              if L5_101 == 24312 then
                L6_102 = A2_98
                if L6_102 == 0 then
                  L6_102 = nil
                end
                L7_103 = desktopWidget
                L8_104 = L7_103
                L7_103 = L7_103.executePlayerSystemCommand
                L9_105 = 24312
                return L7_103(L8_104, L9_105, L6_102)
              else
              end
              if L5_101 == 24244 then
                L6_102 = desktopWidget
                L7_103 = L6_102
                L6_102 = L6_102.executePlayerRepair
                L6_102(L7_103)
                break
              else
              end
              if L5_101 == 22016 then
                L6_102 = desktopWidget
                L7_103 = L6_102
                L6_102 = L6_102.openMateriaAttachContractWidget
                L6_102(L7_103)
                break
              else
              end
              L6_102 = desktopWidget
              L7_103 = L6_102
              L6_102 = L6_102.executePlayerSystemCommand
              L8_104 = A1_97
              L9_105 = A2_98
              return L6_102(L7_103, L8_104, L9_105)
            end
        end
    end
  L5_101 = true
  return L5_101
end
function MainMenuWidget.addSystemCommand(A0_106, A1_107, A2_108, A3_109, A4_110, A5_111)
  local L6_112, L7_113, L8_114, L9_115
  L6_112 = A0_106.work
  L6_112 = L6_112.systemCommandCount
  if L6_112 >= 15 then
    L6_112 = false
    return L6_112
  end
  L6_112 = A0_106.work
  L7_113 = A0_106.work
  L7_113 = L7_113.systemCommandCount
  L7_113 = L7_113 + 1
  L6_112.systemCommandCount = L7_113
  L6_112 = A0_106.work
  L6_112 = L6_112.systemCommandCount
  L6_112 = L6_112 - 1
  L7_113 = A4_110
  if L7_113 == nil then
    L7_113 = A1_107
  end
  L9_115 = A0_106
  L8_114 = A0_106.setListText
  L8_114(L9_115, "SystemMenu", L6_112, "SystemName", A2_108, L7_113)
  L8_114 = nil
  L9_115 = A1_107
  if L9_115 == 24301 then
    if A4_110 == 20001 then
      L8_114 = 74602
      break
    else
    end
    if A4_110 == 20002 then
      L8_114 = 74603
      break
    else
    end
    if A4_110 == 30003 then
      L8_114 = 74604
      break
    else
    end
    if A4_110 == 20005 then
      L8_114 = 74626
      break
    else
    end
    if A4_110 == 20006 then
      L8_114 = 74627
      break
    else
    end
    if A4_110 == 20007 then
      L8_114 = 74628
      break
    else
    end
    L8_114 = 74632
    do break end
    break
  else
  end
  if L9_115 == 24215 then
    L8_114 = 74605
    break
  else
  end
  if L9_115 == 24217 then
    L8_114 = 74606
    break
  else
  end
  if L9_115 == 24305 then
    L8_114 = 74607
    break
  else
  end
  if L9_115 == 24303 then
    if A4_110 == 10001 then
      L8_114 = 74608
      break
    else
    end
    if A4_110 == 10002 then
      L8_114 = 74611
      do break end
      do break end
      do break end
      do break end
      else
      end
      if L9_115 == 24306 then
        L8_114 = 74612
        break
      else
      end
      if L9_115 == 24304 then
        L8_114 = 74613
        break
      else
      end
      if L9_115 == 24203 then
        L8_114 = 74609
        break
      else
      end
      if L9_115 == 24232 then
        L8_114 = 74610
        break
      else
      end
      if L9_115 == 24238 then
        L8_114 = 74614
        break
      else
      end
      if L9_115 == 24312 then
        if A4_110 == 10002 then
          L8_114 = 74616
          break
        else
        end
        if A4_110 == 0 then
          L8_114 = 74620
          do break end
          do break end
          do break end
          do break end
          else
          end
          if L9_115 == 0 then
            L8_114 = 74617
            break
          else
          end
          if L9_115 == 24302 then
            L8_114 = 74633
            break
          else
          end
          if L9_115 == 24230 then
            L8_114 = 74621
            break
          else
          end
          if L9_115 == 24233 then
            L8_114 = 74622
            break
          else
          end
          if L9_115 == 24244 then
            L8_114 = 74636
            break
          else
          end
          if L9_115 == 22016 then
            L8_114 = 74637
            break
          else
          end
        else
        end
    else
    end
  if L8_114 ~= nil then
    L9_115 = A0_106.setListProperty
    L9_115(A0_106, "SystemMenu", L6_112, "Help", L8_114)
  end
  L9_115 = A0_106.setListProperty
  L9_115(A0_106, "SystemMenu", L6_112, "SystemIcon", A3_109)
  L9_115 = A0_106.setListProperty
  L9_115(A0_106, "SystemMenu", L6_112, "SystemEnable", "True")
  L9_115 = A0_106.setListProperty
  L9_115(A0_106, "SystemMenu", L6_112, "SystemCommandID", A1_107)
  if A4_110 ~= nil then
    L9_115 = A0_106.setListProperty
    L9_115(A0_106, "SystemMenu", L6_112, "SystemCommandInfo", A4_110)
  end
  L9_115 = 100
  if A5_111 ~= nil then
    L9_115 = A5_111
  end
  A0_106:setListProperty("SystemMenu", L6_112, "SystemSubTarget", L9_115)
  A0_106:setListPropertyVisibility("SystemMenu", L6_112, true)
end
function MainMenuWidget.addReadyCommand(A0_116, A1_117, A2_118, A3_119, A4_120, A5_121)
  local L6_122, L7_123, L8_124
  L6_122 = A0_116.work
  L6_122 = L6_122.systemCommandCount
  if L6_122 >= 15 then
    L6_122 = false
    return L6_122
  end
  L6_122 = A0_116.work
  L7_123 = A0_116.work
  L7_123 = L7_123.systemCommandCount
  L7_123 = L7_123 + 1
  L6_122.systemCommandCount = L7_123
  L6_122 = A0_116.work
  L6_122 = L6_122.systemCommandCount
  L6_122 = L6_122 - 1
  L8_124 = A0_116
  L7_123 = A0_116.setListText
  L7_123(L8_124, "SystemMenu", L6_122, "SystemName", A2_118, A1_117)
  L7_123 = nil
  L8_124 = A1_117
  if L8_124 == 22001 then
    L7_123 = 74601
    break
  else
  end
  if L8_124 == 29497 then
    L7_123 = 74619
    break
  else
  end
  if L8_124 == 22016 then
    L7_123 = 74637
    do break end
    break
  else
  end
  if L7_123 ~= nil then
    L8_124 = A0_116.setListProperty
    L8_124(A0_116, "SystemMenu", L6_122, "Help", L7_123)
  end
  L8_124 = A0_116.setListProperty
  L8_124(A0_116, "SystemMenu", L6_122, "SystemIcon", A3_119)
  L8_124 = A0_116.setListProperty
  L8_124(A0_116, "SystemMenu", L6_122, "SystemEnable", "True")
  L8_124 = A0_116.setListProperty
  L8_124(A0_116, "SystemMenu", L6_122, "SystemCommandID", A1_117)
  L8_124 = A0_116.setListProperty
  L8_124(A0_116, "SystemMenu", L6_122, "SystemCommandInfo", A4_120)
  L8_124 = 100
  if A5_121 ~= nil then
    L8_124 = A5_121
  end
  A0_116:setListProperty("SystemMenu", L6_122, "SystemSubTarget", L8_124)
  A0_116:setListPropertyVisibility("SystemMenu", L6_122, true)
end
function MainMenuWidget.removeSystemCommand(A0_125, A1_126)
  A0_125:deleteListProperty("SystemMenu", A1_126 - 1)
end
function MainMenuWidget.setFocusMainMenu(A0_127, A1_128)
  A0_127:setLogicalFocus("ListBox_MainMenu")
  A0_127:setFocusedIndex("ListBox_MainMenu", A1_128)
  if A0_127:isShow() == true and desktopWidget:checkKeyboardFocused(A0_127) == true then
    A0_127:setKeyboardFocusedControl("ListBox_MainMenu")
  end
  A0_127.work.mainMenuIndex = A1_128
end
function MainMenuWidget.setFocusSystemMenu(A0_129, A1_130)
  A0_129:setLogicalFocus("ListBox_SystemMenu")
  A0_129:setFocusedIndex("ListBox_SystemMenu", A1_130)
  if A0_129:isShow() == true and desktopWidget:checkKeyboardFocused(A0_129) == true then
    A0_129:setKeyboardFocusedControl("ListBox_SystemMenu")
  end
  A0_129.work.mainMenuIndex = -1
end
