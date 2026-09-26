require("/Widget/WidgetBaseClass")
_defineClass("ActionMenuWidget", "WidgetBaseClass")
function ActionMenuWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L9_9 = "integer8"
  L9_9 = "subTargetSelectingCommand"
  L9_9 = {
    "castingMainCommand",
    "integer8"
  }
  L1_1._temp = L2_2
  for L4_4 = 1, 10 do
    L9_9 = "UILuaCommands.OperateCommand"
    L6_6(L7_7, L8_8, L9_9)
  end
  for L5_5 = 1, 10 do
    L9_9 = L6_6
    L7_7(L8_8, L9_9, "UILuaCommands.ExecuteUserMacro")
  end
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L2_2.slotMoving = false
  L2_2.subTargetSelectingCommand = 0
  L2_2.castingMainCommand = 0
  L2_2.castingSubCommand = 0
  L2_2.slotPage = 1
  L2_2.slotMaxPage = 3
  L2_2.slotSelectIndex = 1
  L2_2.userMacroStages = 1
  L2_2.userMacroType = 0
  L2_2.userMacroCtrIndex = 1
  L2_2.userMacroAltIndex = 1
  L2_2.userMacroSelectIndex = 1
  L2_2(L3_3, L4_4)
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3, L4_4)
  for L7_7 = 1, L5_5 * 10 do
    L9_9 = A0_0
    L9_9 = A0_0
    L8_8(L9_9, L2_2, 1140 + L3_3)
    if L3_3 < 9 then
    else
    end
  end
  for L9_9 = 1, 10 do
    A0_0:setText(L4_4, 1140 + L5_5)
  end
end
function ActionMenuWidget.processUICommandEvent(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15)
  local L6_16, L7_17, L8_18, L9_19
  L6_16 = A3_13
  if L6_16 == "UILuaCommands.LeaveButton" then
    L8_18 = A0_10
    L7_17 = A0_10.getSlotNameFromButton
    L9_19 = A4_14
    L7_17 = L7_17(L8_18, L9_19)
    if L7_17 ~= nil then
      L9_19 = A0_10
      L8_18 = A0_10.setVisualOpacity
      L8_18(L9_19, L7_17 .. ":" .. "Border_FocusEffect", 1)
      L9_19 = A0_10
      L8_18 = A0_10.sendControlCommand
      L8_18(L9_19, L7_17, "UILuaCommands.LeaveButtonAnimation")
    end
    L9_19 = A0_10
    L8_18 = A0_10.updatePlayerParameterCostData
    L8_18(L9_19)
    break
  else
  end
  if L6_16 == "UILuaCommands.EnterButton" then
    L8_18 = A0_10
    L7_17 = A0_10.getSlotNameFromButton
    L9_19 = A4_14
    L7_17 = L7_17(L8_18, L9_19)
    if L7_17 ~= nil then
      L9_19 = A0_10
      L8_18 = A0_10.sendControlCommand
      L8_18(L9_19, L7_17, "UILuaCommands.EnterButtonAnimation")
      L9_19 = A0_10
      L8_18 = A0_10.updatePlayerParameterCostData
      L8_18(L9_19, L7_17)
      L9_19 = A0_10
      L8_18 = A0_10.setOnCursorControl
      L8_18(L9_19, A4_14)
      L8_18 = A0_10.work
      L9_19 = A0_10.getControlProperty
      L9_19 = L9_19(A0_10, A4_14, "IntData.Value0")
      L8_18.slotSelectIndex = L9_19
      do break end
      else
      end
      if L6_16 == "UILuaCommands.EnterMacroButton" then
        L7_17 = A0_10.work
        L9_19 = A0_10
        L8_18 = A0_10.getControlUserWorkInt
        L8_18 = L8_18(L9_19, 1, A4_14)
        L7_17.userMacroSelectIndex = L8_18
        break
      elseif L6_16 == "UILuaCommands.PushSlotNext" then
      else
      end
      if L6_16 == "UILuaCommands.ActionBarSlotNext" then
        L8_18 = A0_10
        L7_17 = A0_10.isShow
        L7_17 = L7_17(L8_18)
        if L7_17 == false then
          return
        end
        L7_17 = A0_10.work
        L7_17 = L7_17.slotMoving
        if L7_17 then
          return
        end
        L8_18 = A0_10
        L7_17 = A0_10.changeNextSlot
        L7_17(L8_18)
        break
      elseif L6_16 == "UILuaCommands.PushSlotPrev" then
      else
      end
      if L6_16 == "UILuaCommands.ActionBarSlotPrev" then
        L8_18 = A0_10
        L7_17 = A0_10.isShow
        L7_17 = L7_17(L8_18)
        if L7_17 == false then
          return
        end
        L7_17 = A0_10.work
        L7_17 = L7_17.slotMoving
        if L7_17 then
          return
        end
        L8_18 = A0_10
        L7_17 = A0_10.changePrevSlot
        L7_17(L8_18)
        break
      else
      end
      if L6_16 == "UILuaCommands.Deactivated" then
        L7_17 = desktopWidget
        L8_18 = L7_17
        L7_17 = L7_17.isMainTargetDecided
        L7_17 = L7_17(L8_18)
        if L7_17 == true then
        else
          L8_18 = A0_10
          L7_17 = A0_10.cancelFocus
          L7_17(L8_18)
          else
          end
          if L6_16 == "UILuaCommands.Cancel" then
            L7_17 = desktopWidget
            L8_18 = L7_17
            L7_17 = L7_17.isMainTargetDecided
            L7_17 = L7_17(L8_18)
            if L7_17 == true then
              L7_17 = A0_10.work
              L7_17 = L7_17.userMacroType
              if L7_17 ~= 0 then
                L8_18 = A0_10
                L7_17 = A0_10.hideUserMacroBar
                L7_17(L8_18)
                L8_18 = A0_10
                L7_17 = A0_10.getSlotNameFromButton
                L9_19 = A0_10.getSlotButton
                L9_19 = L9_19(A0_10)
                L7_17 = L7_17(L8_18, L9_19, L9_19(A0_10))
                L9_19 = A0_10
                L8_18 = A0_10.sendControlCommand
                L8_18(L9_19, L7_17, "UILuaCommands.EnterButtonAnimation")
                L9_19 = A0_10
                L8_18 = A0_10.updatePlayerParameterCostData
                L8_18(L9_19, L7_17)
              end
            else
              L8_18 = A0_10
              L7_17 = A0_10.hideUserMacroBar
              L7_17(L8_18)
              L8_18 = A0_10
              L7_17 = A0_10.clearButtonAnim
              L7_17(L8_18)
              L8_18 = A0_10
              L7_17 = A0_10.updatePlayerParameterCostData
              L7_17(L8_18)
              L7_17 = desktopWidget
              L8_18 = L7_17
              L7_17 = L7_17.updateActionMenuWidget
              L9_19 = false
              L7_17(L8_18, L9_19, false)
              do break end
              else
              end
              if L6_16 == "UILuaCommands.OperateCommand" then
                L7_17 = A0_10.work
                L7_17 = L7_17.slotMoving
                if L7_17 then
                  return
                end
                L8_18 = A0_10
                L7_17 = A0_10.getSlotNameFromButton
                L9_19 = A2_12
                L7_17 = L7_17(L8_18, L9_19)
                L9_19 = A0_10
                L8_18 = A0_10.isButtonEnabled
                L8_18 = L8_18(L9_19, L7_17)
                if not L8_18 then
                  L9_19 = A0_10
                  L8_18 = A0_10.playCommandExecuteSound
                  L8_18(L9_19, false)
                  return
                end
                L9_19 = A0_10
                L8_18 = A0_10.getControlProperty
                L8_18 = L8_18(L9_19, L7_17, "IntData.Value2")
                L9_19 = A0_10.getControlProperty
                L9_19 = L9_19(A0_10, L7_17, "IntData.Value3")
                A0_10:playCommandExecuteSound(A0_10:executeGameCommand(L8_18, L9_19))
                break
              else
              end
              if L6_16 == "UILuaCommands.ExecuteUserMacro" then
                L8_18 = A0_10
                L7_17 = A0_10.playCommandExecuteSound
                L9_19 = desktopWidget
                L9_19 = L9_19.executeCommandMacro
                L9_19 = L9_19(L9_19, A4_14, A5_15)
                L7_17(L8_18, L9_19, L9_19(L9_19, A4_14, A5_15))
                break
              else
              end
              if L6_16 == "UILuaCommands.ShortCutAction" then
                L7_17 = A0_10.work
                L7_17 = L7_17.slotMoving
                if L7_17 then
                  return
                end
                L7_17 = A0_10.work
                L7_17 = L7_17.userMacroType
                if L7_17 == 0 then
                  L8_18 = A0_10
                  L7_17 = A0_10.executeCustomCommandForShortCutNumber
                  L9_19 = A4_14
                  L7_17(L8_18, L9_19)
                else
                  L8_18 = A0_10
                  L7_17 = A0_10.getUserMacroPage
                  L7_17 = L7_17(L8_18)
                  L8_18 = A0_10.work
                  L9_19 = L7_17 - 1
                  L9_19 = L9_19 * 10
                  L9_19 = L9_19 + A4_14
                  L8_18.userMacroSelectIndex = L9_19
                  L8_18 = "Button_UserMacroIcon_"
                  L9_19 = tostring
                  L9_19 = L9_19(A4_14)
                  L8_18 = L8_18 .. L9_19
                  L9_19 = A0_10.getVisibility
                  L9_19 = L9_19(A0_10, "Grid_UserMacro")
                  if L9_19 == false then
                    L9_19 = A0_10.setFocusScope
                    L9_19(A0_10, L8_18)
                  else
                    L9_19 = A0_10.setKeyboardFocusedControl
                    L9_19(A0_10, L8_18)
                  end
                  L9_19 = A0_10.executeUserMacroForShortCutNumber
                  L9_19(A0_10, A4_14)
                  do break end
                  else
                  end
                  if L6_16 == "UILuaCommands.FinishAnimation" then
                    L7_17 = A0_10.work
                    L7_17.slotMoving = false
                    break
                  else
                  end
                  if L6_16 == "UILuaCommands.TimerEnd" then
                    L8_18 = A0_10
                    L7_17 = A0_10.updateMainSlotEnabled
                    L7_17(L8_18)
                    break
                  else
                  end
                end
            end
        end
    else
    end
end
function ActionMenuWidget.processAfterShow(A0_20, A1_21)
  A0_20:updateMainSlotEnabled()
  return true
end
function ActionMenuWidget.processAfterHide(A0_22, A1_23)
  A0_22:clearButtonAnim()
  A0_22:updatePlayerParameterCostData()
  A0_22:hideUserMacroBar()
  return true
end
function ActionMenuWidget.processSubTargetDecided(A0_24, A1_25)
  local L2_26, L3_27, L4_28, L5_29
  L2_26 = A0_24.work
  L2_26 = L2_26.subTargetSelectingCommand
  L3_27 = A0_24.work
  L3_27.subTargetSelectingCommand = 0
  L4_28 = A0_24
  L3_27 = A0_24.show
  L3_27(L4_28)
  L3_27, L4_28, L5_29 = nil, nil, nil
  L3_27, L4_28, L5_29 = desktopWidget:getPlayerEquippedCustomCommand(L2_26)
  if A1_25 == nil or L5_29 == false then
    A0_24:updateCastGaugeWidget(L4_28, L2_26)
    return
  end
  if L3_27:isMagicCommand() == true then
    A0_24:sendDesktopCommand("RaptureCommands.CastAutoFace")
  end
  if not desktopWidget:executePlayerCommand(L3_27, nil, 0, L4_28, 0, A1_25, nil) then
    A0_24:playCommandExecuteSound(false)
    return
  end
  A0_24:playCommandExecuteSound(true)
  A0_24:setCastingCommand(L4_28, L2_26)
end
function ActionMenuWidget.updateActionMenu(A0_30)
  A0_30:updateMainSlot()
end
function ActionMenuWidget.updateActionMenuEnabled(A0_31)
  A0_31:updateMainSlotEnabled()
  A0_31:changeBattleModeDisplay()
end
function ActionMenuWidget.resetCastingCommandInfomation(A0_32, A1_33)
  A0_32:setCastingCommand(A1_33, 0)
end
function ActionMenuWidget.updateCastGauge(A0_34, A1_35, A2_36)
  A0_34:updateCastGaugeWidget(A1_35, A2_36)
  if desktopWidget:getCastTimeForCustomCommand(A2_36) > 0 then
    A0_34:setCastingCommand(A1_35, A2_36)
  end
end
function ActionMenuWidget.updateCastInfo(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42
  L2_39 = A0_37
  L1_38 = A0_37.getChildWidgetByWindowName
  L3_40 = "ActionGaugeWidget"
  L1_38 = L1_38(L2_39, L3_40)
  L2_39 = worldMaster
  L3_40 = L2_39
  L2_39 = L2_39._getMyPlayer
  L2_39 = L2_39(L3_40)
  L4_41 = L2_39
  L3_40 = L2_39.getCastCommand
  L3_40 = L3_40(L4_41)
  if L3_40 ~= 0 then
    L5_42 = L2_39
    L4_41 = L2_39.searchCommandSlot
    L4_41 = L4_41(L5_42, L3_40)
    if L4_41 ~= nil then
      L5_42 = L2_39.getCustomCommand
      L5_42 = L5_42(L2_39, L4_41)
      if L5_42 ~= nil then
        L1_38:startCastGauge(L5_42)
      end
    end
  else
    L5_42 = L1_38
    L4_41 = L1_38.deleteCastGauge
    L4_41(L5_42)
  end
end
function ActionMenuWidget.updateComboInfo(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56
  L1_44 = worldMaster
  L2_45 = L1_44
  L1_44 = L1_44._getMyPlayer
  L1_44 = L1_44(L2_45)
  L3_46 = L1_44
  L2_45 = L1_44.getComboInformation
  L4_47 = L2_45(L3_46)
  L5_48 = L1_44.getEnableTimingCommands
  L5_48 = L5_48(L6_49)
  for L9_52 = 1, 30 do
    L10_53 = "UILuaCommands.ComboEffectOFF"
    L11_54 = "UILuaCommands.TriggerWaitEffectOFF"
    L12_55 = "Label_CommandIcon_"
    L13_56 = tostring
    L13_56 = L13_56(L9_52)
    L12_55 = L12_55 .. L13_56
    L13_56 = desktopWidget
    L13_56 = L13_56.getPlayerEquippedCustomCommand
    L13_56 = L13_56(L13_56, L9_52)
    if L13_56 ~= nil and L13_56(L13_56, L9_52) == true and desktopWidget:getCommandID(L13_56) ~= 0 then
      if desktopWidget:getCommandID(L13_56) == L2_45 or desktopWidget:getCommandID(L13_56) == L3_46 then
        L10_53 = "UILuaCommands.ComboEffectON"
      else
        for _FORV_20_ = 1, #L5_48 do
          if desktopWidget:getCommandID(L13_56) == L5_48[_FORV_20_] then
            L11_54 = "UILuaCommands.TriggerWaitEffectON"
            break
          end
        end
      end
    end
    A0_43:sendControlCommand(L12_55, L10_53)
    A0_43:sendControlCommand(L12_55, L11_54)
  end
  L6_49(L7_50)
end
function ActionMenuWidget.showUserMacro(A0_57, A1_58)
  A0_57:showUserMacroBar(A1_58)
end
function ActionMenuWidget.hideUserMacro(A0_59)
  A0_59:hideUserMacroBar()
end
function ActionMenuWidget.executeGameCommand(A0_60, A1_61, A2_62, A3_63)
  local L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71, L12_72
  L4_64 = desktopWidget
  L5_65 = L4_64
  L4_64 = L4_64.isTutorialLock
  L6_66 = 5
  L4_64 = L4_64(L5_65, L6_66)
  if L4_64 == true then
    L4_64 = false
    return L4_64
  end
  L4_64 = desktopWidget
  L5_65 = L4_64
  L4_64 = L4_64.isSubTargetSelectMode
  L4_64 = L4_64(L5_65)
  if L4_64 == true then
    L4_64 = false
    return L4_64
  end
  L4_64, L5_65, L6_66, L7_67 = nil, nil, nil, nil
  if A1_61 == 1 then
    L8_68 = desktopWidget
    L9_69 = L8_68
    L8_68 = L8_68.getPlayerEquippedReadyCommand
    L10_70 = A2_62
    L10_70 = L8_68(L9_69, L10_70)
    L6_66 = L10_70
    L5_65 = L9_69
    L4_64 = L8_68
  elseif A1_61 == 2 then
    L8_68 = desktopWidget
    L9_69 = L8_68
    L8_68 = L8_68.getPlayerEquippedCustomCommand
    L10_70 = A2_62
    L10_70 = L8_68(L9_69, L10_70)
    L6_66 = L10_70
    L5_65 = L9_69
    L4_64 = L8_68
  else
    L8_68 = false
    return L8_68
  end
  if not L6_66 then
    L8_68 = false
    return L8_68
  end
  L8_68 = desktopWidget
  L9_69 = L8_68
  L8_68 = L8_68.getConfigFlag
  L10_70 = 15
  L8_68 = L8_68(L9_69, L10_70)
  if L8_68 then
    L8_68, L9_69 = nil, nil
    L10_70 = worldMaster
    L11_71 = L10_70
    L10_70 = L10_70._getMyPlayer
    L10_70 = L10_70(L11_71)
    L12_72 = L10_70
    L11_71 = L10_70.getCastCommand
    L11_71 = L11_71(L12_72)
    L12_72 = nil
    if L11_71 then
      L12_72 = L10_70:searchCommandSlot(L11_71)
    end
    if A1_61 == 2 and L12_72 ~= nil then
      L8_68, L9_69 = desktopWidget:getPlayerEquippedCustomCommand(L12_72)
    end
    if L4_64 == L8_68 and L5_65 == L9_69 and desktopWidget:getCastTimeForCustomCommand(A2_62) > 0 then
      A0_60:cancelCommand(L5_65)
      return true
    end
  end
  L9_69 = L4_64
  L8_68 = L4_64.getTargetControlMode
  L8_68 = L8_68(L9_69)
  if L8_68 ~= 0 then
    L9_69 = A0_60.work
    L9_69.subTargetSelectingCommand = A2_62
    L10_70 = A0_60
    L9_69 = A0_60.updateCastGaugeWidget
    L11_71 = L5_65
    L12_72 = A2_62
    L9_69(L10_70, L11_71, L12_72)
    L9_69 = desktopWidget
    L10_70 = L9_69
    L9_69 = L9_69.getConfigFlag
    L11_71 = 43
    L9_69 = L9_69(L10_70, L11_71)
    if L9_69 == true then
      L10_70 = A0_60
      L9_69 = A0_60.requestSelectSubTarget
      L11_71 = L8_68
      L12_72 = nil
      L9_69(L10_70, L11_71, L12_72, L4_64:isMagicCommand())
    else
      L10_70 = A0_60
      L9_69 = A0_60.processSubTargetDecided
      L11_71 = desktopWidget
      L12_72 = L11_71
      L11_71 = L11_71.getMainTargetCharacter
      L12_72 = L11_71(L12_72)
      L9_69(L10_70, L11_71, L12_72, L11_71(L12_72))
    end
    L9_69 = true
    return L9_69
  end
  L9_69 = desktopWidget
  L10_70 = L9_69
  L9_69 = L9_69.executePlayerCommand
  L11_71 = L4_64
  L12_72 = nil
  L9_69 = L9_69(L10_70, L11_71, L12_72, 0, L5_65)
  if not L9_69 then
    L9_69 = false
    return L9_69
  end
  if A1_61 == 2 then
    L10_70 = A0_60
    L9_69 = A0_60.updateCastGauge
    L11_71 = L5_65
    L12_72 = A2_62
    L9_69(L10_70, L11_71, L12_72)
  end
  L9_69 = desktopWidget
  L10_70 = L9_69
  L9_69 = L9_69.requestAutoLockonTarget
  L9_69(L10_70)
  L9_69 = true
  return L9_69
end
function ActionMenuWidget.executeCustomCommandForShortCutNumber(A0_73, A1_74, A2_75)
  local L3_76, L4_77, L5_78, L6_79
  L4_77 = A0_73
  L3_76 = A0_73.getSlotButtonName
  L5_78 = A1_74
  L3_76 = L3_76(L4_77, L5_78)
  L4_77 = desktopWidget
  L5_78 = L4_77
  L4_77 = L4_77.updateActionMenuWidget
  L6_79 = false
  L4_77(L5_78, L6_79, true)
  L5_78 = A0_73
  L4_77 = A0_73.isShow
  L4_77 = L4_77(L5_78)
  if not L4_77 then
    L4_77 = desktopWidget
    L5_78 = L4_77
    L4_77 = L4_77.checkKeyboardFocused
    L6_79 = A0_73
    L4_77 = L4_77(L5_78, L6_79)
    if L4_77 then
      L5_78 = A0_73
      L4_77 = A0_73.setKeyboardFocusedControl
      L6_79 = L3_76
      L4_77(L5_78, L6_79)
    end
  end
  L5_78 = A0_73
  L4_77 = A0_73.getSlotNameFromButton
  L6_79 = L3_76
  L4_77 = L4_77(L5_78, L6_79)
  L6_79 = A0_73
  L5_78 = A0_73.updatePlayerParameterCostData
  L5_78(L6_79, L4_77)
  L6_79 = A0_73
  L5_78 = A0_73.isButtonEnabled
  L5_78 = L5_78(L6_79, L4_77)
  if not L5_78 then
    L6_79 = A0_73
    L5_78 = A0_73.playCommandExecuteSound
    L5_78(L6_79, false)
    return
  end
  L6_79 = A0_73
  L5_78 = A0_73.getControlProperty
  L5_78 = L5_78(L6_79, L4_77, "IntData.Value2")
  L6_79 = A0_73.getControlProperty
  L6_79 = L6_79(A0_73, L4_77, "IntData.Value3")
  A0_73:playCommandExecuteSound(A0_73:executeGameCommand(L5_78, L6_79, A2_75))
end
function ActionMenuWidget.executeUserMacroForShortCutNumber(A0_80, A1_81)
  local L2_82, L3_83
  L2_82 = "Button_UserMacroIcon_"
  L3_83 = tostring
  L3_83 = L3_83(A1_81)
  L2_82 = L2_82 .. L3_83
  L3_83 = A0_80.isShow
  L3_83 = L3_83(A0_80)
  if not L3_83 then
    L3_83 = desktopWidget
    L3_83 = L3_83.updateActionMenuWidget
    L3_83(L3_83, false, true)
    L3_83 = desktopWidget
    L3_83 = L3_83.checkKeyboardFocused
    L3_83 = L3_83(L3_83, A0_80)
    if L3_83 then
      L3_83 = A0_80.setKeyboardFocusedControl
      L3_83(A0_80, L2_82)
    end
  end
  L3_83 = A0_80.getControlUserWorkInt
  L3_83 = L3_83(A0_80, 1, L2_82)
  if A0_80.work.userMacroType <= 0 then
    A0_80:playCommandExecuteSound(false)
    return
  end
  A0_80:playCommandExecuteSound(desktopWidget:executeCommandMacro(A0_80.work.userMacroType, L3_83))
end
function ActionMenuWidget.cancelCommand(A0_84, A1_85)
  if desktopWidget:cancelPlayerCastCommand(A1_85) == true then
    A0_84:resetCastingCommandInfomation(A1_85)
  end
  return (desktopWidget:cancelPlayerCastCommand(A1_85))
end
function ActionMenuWidget.setCastingCommand(A0_86, A1_87, A2_88)
  local L3_89
  if A1_87 == 1 then
    L3_89 = A0_86.work
    L3_89.castingMainCommand = A2_88
  elseif A1_87 == 2 then
    L3_89 = A0_86.work
    L3_89.castingSubCommand = A2_88
  end
end
function ActionMenuWidget.updateMainSlot(A0_90)
  local L1_91, L2_92, L3_93, L4_94, L5_95, L6_96, L7_97, L8_98, L9_99, L10_100, L11_101
  for L11_101 = 1, 30 do
    L1_91, L2_92, L3_93 = desktopWidget:getPlayerEquippedCustomCommand(L11_101)
    if L1_91 ~= nil and L3_93 then
      L6_96 = 2
      A0_90:addSlot(L11_101, L1_91, L6_96, L2_92)
    else
      A0_90:removeSlot(L11_101)
    end
  end
  L8_98(L9_99)
end
function ActionMenuWidget.updateMainSlotEnabled(A0_102)
  local L1_103, L2_104, L3_105, L4_106, L5_107, L6_108, L7_109, L8_110, L9_111, L10_112, L11_113, L12_114, L13_115, L14_116, L15_117, L16_118, L17_119, L18_120, L19_121, L20_122, L21_123, L22_124, L23_125, L24_126
  L16_118 = false
  L18_120 = A0_102
  L17_119 = A0_102.getSlotIndex
  L18_120 = L17_119(L18_120)
  for L22_124 = L17_119, L18_120 do
    L23_125 = "Label_CommandIcon_"
    L24_126 = tostring
    L24_126 = L24_126(L22_124)
    L8_110 = L23_125 .. L24_126
    L23_125 = desktopWidget
    L24_126 = L23_125
    L23_125 = L23_125.getPlayerEquippedCustomCommand
    L3_105, L23_125 = L22_124, L23_125(L24_126, L22_124)
    L3_105, L24_126 = L22_124, L23_125(L24_126, L22_124)
    L2_104 = L24_126
    L1_103 = L23_125
    if L1_103 ~= nil and L3_105 then
      L24_126 = A0_102
      L23_125 = A0_102.getSlotIconName
      L24_126 = L23_125(L24_126, L22_124)
      L9_111, L10_112, L11_113 = desktopWidget:isStackIntoActionMenu(L1_103, nil, nil, L2_104, 0)
      A0_102:setButtonEnabled(L8_110, L10_112)
      L4_106, L5_107 = desktopWidget:getRecastTimeForCustomCommand(L22_124)
      L6_108 = A0_102:getControlUserWorkInt(2, L24_126)
      if L4_106 == nil then
        L4_106 = 0
      end
      if L5_107 == nil then
        L5_107 = 0
      end
      if L5_107 <= 0 or L4_106 <= 0 or worldMaster:_getMyPlayer():getCommandSlotCompatibility(L22_124) == false then
        L16_118 = false
      else
        L16_118 = true
        if L6_108 ~= L4_106 then
          A0_102:setControlUserWorkInt(2, L24_126, L4_106)
          A0_102:setControlProperty(L24_126, "StartTime", L5_107)
          A0_102:setControlProperty(L24_126, "EndTime", 0)
          A0_102:setControlProperty(L24_126, "RunningValue", 0)
          A0_102:setControlProperty(L24_126, "RunningValue", 1)
          A0_102:setControlProperty(L24_126 .. ":IconControl_Command_2", "Percent", 0)
        elseif A0_102:getControlProperty(L24_126 .. ":IconControl_Command_2", "Percent") >= 100 then
          if L10_112 == false and L11_113 == true then
            A0_102:setButtonEnabled(L8_110, true)
          end
          L16_118 = false
        end
      end
      if L16_118 then
        A0_102:setCost(L8_110, nil)
      else
        A0_102:setControlUserWorkInt(2, L24_126, 0)
        A0_102:setControlProperty(L24_126, "StartTime", 0)
        A0_102:setControlProperty(L24_126, "EndTime", 0)
        A0_102:setControlProperty(L24_126, "RunningValue", 0)
        A0_102:setCost(L8_110, L22_124)
      end
    end
  end
  if L19_121 ~= "" then
    L23_125 = A0_102
    L22_124 = A0_102.getSlotNameFromButton
    L24_126 = L19_121
    L24_126 = L22_124(L23_125, L24_126)
    L20_122(L21_123, L22_124, L23_125, L24_126, L22_124(L23_125, L24_126))
  end
end
function ActionMenuWidget.setCost(A0_127, A1_128, A2_129)
  local L3_130, L4_131, L5_132, L6_133, L7_134, L8_135
  L3_130 = A1_128
  L4_131 = ":TextBlock_ActionCost_Hp"
  L3_130 = L3_130 .. L4_131
  L4_131 = A1_128
  L5_132 = ":TextBlock_ActionCost_Mp"
  L4_131 = L4_131 .. L5_132
  L5_132 = A1_128
  L6_133 = ":TextBlock_ActionCost_Tp"
  L5_132 = L5_132 .. L6_133
  L6_133, L7_134, L8_135 = nil, nil, nil
  if A2_129 ~= nil then
    L6_133, L7_134, L8_135 = desktopWidget:getPlayerEquippedCustomCommandCost(A2_129)
  end
  if L6_133 ~= nil then
    A0_127:setVisibility(L3_130, true)
    A0_127:setText(L3_130, tostring(L6_133))
  else
    A0_127:setVisibility(L3_130, false)
  end
  if L7_134 ~= nil then
    A0_127:setVisibility(L4_131, true)
    A0_127:setText(L4_131, tostring(L7_134))
  else
    A0_127:setVisibility(L4_131, false)
  end
  if L8_135 ~= nil then
    A0_127:setVisibility(L5_132, true)
    A0_127:setText(L5_132, tostring(L8_135))
  else
    A0_127:setVisibility(L5_132, false)
  end
end
function ActionMenuWidget.clearSlots(A0_136, A1_137)
  local L2_138, L3_139, L4_140, L5_141
  if A1_137 < 1 or A1_137 > 30 then
    return
  end
  for L5_141 = A1_137, 30 do
    A0_136:removeSlot(L5_141)
  end
end
function ActionMenuWidget.updateUserMacro(A0_142)
  local L1_143, L2_144, L3_145, L4_146, L5_147
  L1_143 = A0_142.work
  L1_143.userMacroStages = 1
  L2_144 = A0_142
  L1_143 = A0_142.getUserMacroPage
  L1_143 = L1_143(L2_144)
  L1_143 = L1_143 * 10
  L1_143 = L1_143 - 10
  L1_143 = L1_143 + 1
  L2_144 = 1
  L3_145 = ""
  L4_146 = 0
  L5_147 = ""
  for _FORV_9_ = 1, 10 do
    L3_145, L4_146 = desktopWidget:getCommandMacroInfo(A0_142.work.userMacroType, L1_143)
    L5_147 = "Button_UserMacroIcon_" .. tostring(L2_144)
    A0_142:addUserMacroSlot(L5_147, A0_142.work.userMacroType, L1_143, L3_145, L4_146)
    if L1_143 < 50 then
      L1_143 = L1_143 + 1
    else
      L1_143 = 1
    end
    L2_144 = L2_144 + 1
  end
  _FOR_(_FOR_)
end
function ActionMenuWidget.updateCastGaugeWidget(A0_148, A1_149, A2_150)
  if A0_148:getChildWidgetByWindowName("ActionGaugeWidget") ~= nil then
    A0_148:getChildWidgetByWindowName("ActionGaugeWidget"):changeWaitingAction(A1_149, A2_150)
  end
end
function ActionMenuWidget.showUserMacroBar(A0_151, A1_152)
  local L2_153, L3_154
  L2_153 = A0_151.work
  L2_153 = L2_153.userMacroType
  if L2_153 ~= 0 then
    L2_153 = A0_151.work
    L2_153 = L2_153.userMacroType
    if L2_153 ~= A1_152 then
      L3_154 = A0_151
      L2_153 = A0_151.setUserMacroIndex
      L2_153(L3_154, A0_151.work.userMacroSelectIndex)
    end
  end
  L2_153 = A0_151.work
  L2_153.userMacroType = A1_152
  L3_154 = A0_151
  L2_153 = A0_151.getUserMacroIndex
  L2_153 = L2_153(L3_154)
  L3_154 = A0_151.work
  L3_154.userMacroSelectIndex = L2_153
  L3_154 = A0_151.updateUserMacro
  L3_154(A0_151)
  L3_154 = A0_151.changeUserMacroTypeDisplay
  L3_154(A0_151)
  L3_154 = "Button_UserMacroIcon_"
  L3_154 = L3_154 .. tostring(A0_151:getUserMacroLineIndex(L2_153))
  if A0_151:getVisibility("Grid_UserMacro") == false then
    A0_151:setFocusScope(L3_154)
    A0_151:setVisibility("Grid_UserMacro", true)
    A0_151:setHidden("Grid_ActionCommands")
  else
    A0_151:setKeyboardFocusedControl(L3_154)
  end
end
function ActionMenuWidget.hideUserMacroBar(A0_155)
  if A0_155.work.userMacroType == 0 then
    return
  end
  A0_155:setUserMacroIndex(A0_155.work.userMacroSelectIndex)
  A0_155.work.userMacroType = 0
  A0_155:setVisibility("Grid_ActionCommands", true)
  A0_155:setHidden("Grid_UserMacro")
end
function ActionMenuWidget.isShowMacro(A0_156, A1_157)
  if A0_156:isShow() == false then
    return false
  end
  if A0_156.work.userMacroType == 0 then
    return false
  end
  if A1_157 ~= nil and A0_156.work.userMacroType ~= A1_157 then
    return false
  end
  return true
end
function ActionMenuWidget.getMacroType(A0_158)
  return A0_158.work.userMacroType
end
function ActionMenuWidget.addSlot(A0_159, A1_160, A2_161, A3_162, A4_163)
  local L5_164, L6_165, L7_166, L8_167, L9_168, L10_169, L11_170, L12_171, L13_172, L14_173, L15_174
  L5_164 = desktopWidget
  L6_165 = L5_164
  L5_164 = L5_164.getCommandID
  L7_166 = A2_161
  L5_164 = L5_164(L6_165, L7_166)
  L7_166 = A0_159
  L6_165 = A0_159.getSlotLabelCommandIconName
  L8_167 = A1_160
  L6_165 = L6_165(L7_166, L8_167)
  L8_167 = A0_159
  L7_166 = A0_159.getControlProperty
  L9_168 = L6_165
  L10_169 = "IntData.Value0"
  L7_166 = L7_166(L8_167, L9_168, L10_169)
  L8_167 = desktopWidget
  L9_168 = L8_167
  L8_167 = L8_167.isStackIntoActionMenu
  L10_169 = A2_161
  L11_170, L12_171 = nil, nil
  L13_172 = A4_163
  L14_173 = 0
  L9_168 = L8_167(L9_168, L10_169, L11_170, L12_171, L13_172, L14_173)
  if not L8_167 then
    L10_169 = false
    return L10_169
  end
  if L5_164 ~= L7_166 then
    L11_170 = A0_159
    L10_169 = A0_159.getPopuptLabelName
    L12_171 = A1_160
    L10_169 = L10_169(L11_170, L12_171)
    L12_171 = A0_159
    L11_170 = A0_159.getSlotEffectName
    L13_172 = A1_160
    L11_170 = L11_170(L12_171, L13_172)
    L13_172 = A0_159
    L12_171 = A0_159.getSlotIconName
    L14_173 = A1_160
    L14_173 = L12_171(L13_172, L14_173)
    L15_174 = desktopWidget
    L15_174 = L15_174.getPlayerActionCommandData
    L15_174 = L15_174(L15_174, A2_161, 36)
    A0_159:setControlProperty(L6_165, "IntData.Value0", L5_164)
    A0_159:setControlProperty(L6_165, "IntData.Value1", A4_163)
    A0_159:setControlProperty(L6_165, "IntData.Value2", A3_162)
    A0_159:setControlProperty(L6_165, "IntData.Value3", A1_160)
    A0_159:setControlUserWorkInt(2, L13_172, 0)
    if L15_174 == nil then
      L15_174 = 0
    end
    A0_159:setControlProperty(L13_172, "IconDatas", L15_174)
    A0_159:setControlProperty(L12_171, "IconDatas", A0_159:getHandIconNumber(A4_163))
    A0_159:setVisibility(L13_172, true)
    A0_159:setVisibility(L12_171, true)
  end
  L10_169 = true
  return L10_169
end
function ActionMenuWidget.changeNextSlot(A0_175)
  A0_175:changeSlotPage(true)
end
function ActionMenuWidget.changePrevSlot(A0_176)
  A0_176:changeSlotPage(false)
end
function ActionMenuWidget.changeSlotPage(A0_177, A1_178)
  local L2_179, L3_180, L4_181, L5_182, L6_183
  L2_179 = A0_177.work
  L2_179 = L2_179.userMacroType
  if L2_179 ~= 0 then
    if A1_178 == true then
      L3_180 = A0_177
      L2_179 = A0_177.changeNextUserMacroPage
      L2_179(L3_180)
    else
      L3_180 = A0_177
      L2_179 = A0_177.changePrevUserMacroPage
      L2_179(L3_180)
    end
    L3_180 = A0_177
    L2_179 = A0_177.updateUserMacro
    L2_179(L3_180)
    return
  end
  L3_180 = A0_177
  L2_179 = A0_177.getOnCursorControl
  L2_179 = L2_179(L3_180)
  if L2_179 ~= "" then
    L4_181 = A0_177
    L3_180 = A0_177.getSlotNameFromButton
    L5_182 = L2_179
    L3_180 = L3_180(L4_181, L5_182)
    L5_182 = A0_177
    L4_181 = A0_177.sendControlCommand
    L6_183 = L3_180
    L4_181(L5_182, L6_183, "UILuaCommands.LeaveButtonAnimation")
  end
  L3_180 = A0_177.work
  L3_180 = L3_180.slotPage
  L4_181 = L3_180
  L5_182 = "UILuaCommands.ChangePageNext"
  if A1_178 == true then
    L3_180 = L3_180 + 1
    L6_183 = A0_177.work
    L6_183 = L6_183.slotMaxPage
    if L3_180 > L6_183 then
      L3_180 = 1
    end
  else
    if L3_180 > 1 then
      L3_180 = L3_180 - 1
    else
      L6_183 = A0_177.work
      L3_180 = L6_183.slotMaxPage
    end
    L5_182 = "UILuaCommands.ChangePagePrev"
  end
  L6_183 = A0_177.work
  L6_183.slotPage = L3_180
  L6_183 = A0_177.sendControlCommand
  L6_183(A0_177, "Label_MenuSlot_" .. tostring(L4_181), L5_182)
  L6_183 = A0_177.work
  L6_183.slotMoving = true
  if L2_179 ~= "" then
    L6_183 = A0_177.getSlotNameFromButton
    L6_183 = L6_183(A0_177, L2_179)
    A0_177:sendControlCommand(L6_183, "UILuaCommands.EnterButtonAnimation")
    A0_177:updatePlayerParameterCostData(L6_183)
  end
  L6_183 = A0_177.updateMainSlotEnabled
  L6_183(A0_177)
  L6_183 = A0_177.changeSlotPageDisplay
  L6_183(A0_177)
end
function ActionMenuWidget.changeSlotPageDisplay(A0_184)
  A0_184:setText("TextBlock_SlotNumber", tostring(A0_184.work.slotPage))
  A0_184:updateActionHelp()
end
function ActionMenuWidget.changeUserMacroSlotPageDisplay(A0_185)
  local L1_186, L2_187, L3_188, L4_189
  L2_187 = A0_185
  L1_186 = A0_185.setText
  L3_188 = "TextBlock_MacroSlotNumber"
  L4_189 = tostring
  L4_189 = L4_189(A0_185:getUserMacroPage())
  L1_186(L2_187, L3_188, L4_189, L4_189(A0_185:getUserMacroPage()))
end
function ActionMenuWidget.changeUserMacroTypeDisplay(A0_190)
  local L1_191
  L1_191 = ""
  if A0_190.work.userMacroType == 1 then
    L1_191 = 1174
  elseif A0_190.work.userMacroType == 2 then
    L1_191 = 1175
  end
  A0_190:setText("TextBlock_MacroSetKeyTitle", L1_191)
end
function ActionMenuWidget.removeSlot(A0_192, A1_193)
  local L2_194, L3_195, L4_196, L5_197, L6_198, L7_199, L8_200, L9_201
  L3_195 = A0_192
  L2_194 = A0_192.getSlotLabelCommandIconName
  L4_196 = A1_193
  L2_194 = L2_194(L3_195, L4_196)
  L4_196 = A0_192
  L3_195 = A0_192.getSlotEffectName
  L5_197 = A1_193
  L3_195 = L3_195(L4_196, L5_197)
  L5_197 = A0_192
  L4_196 = A0_192.getSlotIconName
  L6_198 = A1_193
  L6_198 = L4_196(L5_197, L6_198)
  L8_200 = A0_192
  L7_199 = A0_192.setControlProperty
  L9_201 = L5_197
  L7_199(L8_200, L9_201, "IconDatas", 0)
  L8_200 = A0_192
  L7_199 = A0_192.setHidden
  L9_201 = L5_197
  L7_199(L8_200, L9_201)
  L8_200 = A0_192
  L7_199 = A0_192.setControlProperty
  L9_201 = L4_196
  L7_199(L8_200, L9_201, "IconDatas", 245)
  L8_200 = A0_192
  L7_199 = A0_192.setControlUserWorkInt
  L9_201 = 2
  L7_199(L8_200, L9_201, L5_197, 0)
  L8_200 = A0_192
  L7_199 = A0_192.setControlProperty
  L9_201 = L5_197
  L7_199(L8_200, L9_201, "StartTime", 0)
  L8_200 = A0_192
  L7_199 = A0_192.setCost
  L9_201 = "Label_CommandIcon_"
  L9_201 = L9_201 .. tostring(A1_193)
  L7_199(L8_200, L9_201, nil)
  L8_200 = A0_192
  L7_199 = A0_192.setControlProperty
  L9_201 = L2_194
  L7_199(L8_200, L9_201, "IntData.Value0", 0)
  L8_200 = A0_192
  L7_199 = A0_192.setControlProperty
  L9_201 = L2_194
  L7_199(L8_200, L9_201, "IntData.Value1", 0)
  L8_200 = A0_192
  L7_199 = A0_192.setControlProperty
  L9_201 = L2_194
  L7_199(L8_200, L9_201, "IntData.Value2", 0)
  L8_200 = A0_192
  L7_199 = A0_192.setControlProperty
  L9_201 = L2_194
  L7_199(L8_200, L9_201, "IntData.Value3", 0)
  L8_200 = A0_192
  L7_199 = A0_192.setButtonEnabled
  L9_201 = L2_194
  L7_199(L8_200, L9_201, false)
end
function ActionMenuWidget.getSlotButton(A0_202)
  return A0_202:getSlotButtonName(A0_202.work.slotSelectIndex)
end
function ActionMenuWidget.getUserMacroPage(A0_203)
  local L1_204
  L1_204 = A0_203.work
  L1_204 = L1_204.userMacroSelectIndex
  return _math.floor((L1_204 - 1) / 10) + 1
end
function ActionMenuWidget.changeUserMacroPage(A0_205, A1_206)
  local L2_207, L3_208
  L2_207 = A0_205.work
  L2_207 = L2_207.userMacroType
  if L2_207 == 0 then
    return
  end
  L2_207 = A0_205.work
  L2_207 = L2_207.userMacroSelectIndex
  L3_208 = 10 * A1_206
  L2_207 = L2_207 + L3_208
  if L2_207 <= 0 then
    L2_207 = L2_207 + 50
  elseif L2_207 > 50 then
    L2_207 = L2_207 - 50
  end
  L3_208 = A0_205.work
  L3_208.userMacroSelectIndex = L2_207
end
function ActionMenuWidget.changeNextUserMacroPage(A0_209)
  A0_209:changeUserMacroPage(1)
end
function ActionMenuWidget.changePrevUserMacroPage(A0_210)
  A0_210:changeUserMacroPage(-1)
end
function ActionMenuWidget.getUserMacroIndex(A0_211)
  local L1_212, L2_213
  L1_212 = A0_211.work
  L1_212 = L1_212.userMacroType
  if L1_212 == 0 then
    L1_212 = 1
    return L1_212
  end
  L1_212 = A0_211.work
  L1_212 = L1_212.userMacroCtrIndex
  L2_213 = A0_211.work
  L2_213 = L2_213.userMacroType
  if L2_213 == 2 then
    L2_213 = A0_211.work
    L1_212 = L2_213.userMacroAltIndex
  end
  return L1_212
end
function ActionMenuWidget.setUserMacroIndex(A0_214, A1_215)
  local L2_216
  L2_216 = A0_214.work
  L2_216 = L2_216.userMacroType
  if L2_216 == 0 then
    return
  end
  L2_216 = A0_214.work
  L2_216 = L2_216.userMacroType
  if L2_216 == 1 then
    L2_216 = A0_214.work
    L2_216.userMacroCtrIndex = A1_215
  else
    L2_216 = A0_214.work
    L2_216.userMacroAltIndex = A1_215
  end
end
function ActionMenuWidget.getUserMacroLineIndex(A0_217, A1_218)
  local L2_219
  L2_219 = A1_218 - 1
  L2_219 = L2_219 % 10
  L2_219 = L2_219 + 1
  return L2_219
end
function ActionMenuWidget.addUserMacroSlot(A0_220, A1_221, A2_222, A3_223, A4_224, A5_225)
  local L6_226, L7_227
  L6_226 = A1_221
  L7_227 = ":TextBlock_UserMacroTitle"
  L6_226 = L6_226 .. L7_227
  L7_227 = A1_221
  L7_227 = L7_227 .. ":IconControl_UserSelectedIcon"
  A0_220:setText(L6_226, A4_224)
  if A5_225 == 0 then
    A0_220:setHidden(L7_227)
  else
    A0_220:setIcon(L7_227, A5_225)
    A0_220:setVisibility(L7_227, true)
  end
  A0_220:setCommandParameter(A1_221, A2_222, A3_223)
  A0_220:setControlUserWorkInt(1, A1_221, A3_223)
end
function ActionMenuWidget.updateActionHelp(A0_228)
  local L1_229, L2_230, L3_231, L4_232, L5_233, L6_234, L7_235, L8_236
  L2_230 = A0_228
  L1_229 = A0_228.setHelpParameter
  L3_231 = A0_228.getSlotButtonName
  L3_231 = L3_231(L4_232, L5_233)
  L1_229(L2_230, L3_231, L4_232)
  L2_230 = A0_228
  L1_229 = A0_228.getSlotIndex
  L2_230 = L1_229(L2_230)
  L3_231 = 1
  for L7_235 = L1_229, L2_230 do
    L8_236 = A0_228.getSlotButtonName
    L8_236 = L8_236(A0_228, L3_231)
    if desktopWidget:getPlayerEquippedCustomCommand(L7_235) == true then
      A0_228:setHelpParameter(L8_236, 2, L7_235)
    else
      A0_228:setHelpParameter(L8_236, 0)
    end
    L3_231 = L3_231 + 1
  end
end
function ActionMenuWidget.updateButtonMask(A0_237)
  A0_237:changeBattleModeDisplay()
end
function ActionMenuWidget.changeBattleModeDisplay(A0_238)
  if worldMaster:_getMyPlayer():isActiveMode() then
    if not A0_238.work.activeModeDisplay then
      A0_238:sendControlCommand("Label_ModeImage", "UILuaCommands.ModeImageActive")
      A0_238.work.activeModeDisplay = true
    end
  elseif A0_238.work.activeModeDisplay then
    A0_238:sendControlCommand("Label_ModeImage", "UILuaCommands.ModeImagePassive")
    A0_238.work.activeModeDisplay = false
  end
end
function ActionMenuWidget.updatePlayerParameterCostData(A0_239, A1_240)
  local L2_241
  if A0_239:isShow() == true and A1_240 ~= nil and A1_240 ~= "" then
    L2_241 = A0_239:getControlProperty(A1_240, "IntData.Value3")
  end
  desktopWidget:getStaticWidget(4):updateCost(L2_241)
  if A1_240 == nil then
    A0_239:setOnCursorControl()
  end
end
function ActionMenuWidget.setButtonEnabled(A0_242, A1_243, A2_244)
  local L3_245, L4_246
  L3_245 = A1_243
  L4_246 = ":IconControl_Command_1"
  L3_245 = L3_245 .. L4_246
  L4_246 = A1_243
  L4_246 = L4_246 .. ":IconControl_Command_2"
  if A2_244 then
    A0_242:setColor(L3_245, 1, 1, 1)
    A0_242:setVisualOpacity(L3_245, 1)
    A0_242:setControlProperty(L4_246, "IconRed", 1)
    A0_242:setControlProperty(L4_246, "IconBlue", 1)
    A0_242:setControlProperty(L4_246, "IconGreen", 1)
    A0_242:setControlProperty(L4_246, "IconAlpha", 1)
  else
    A0_242:setColor(L3_245, 0.5, 0.5, 0.5)
    A0_242:setVisualOpacity(L3_245, 0.9)
    A0_242:setControlProperty(L4_246, "IconRed", 0.5)
    A0_242:setControlProperty(L4_246, "IconBlue", 0.5)
    A0_242:setControlProperty(L4_246, "IconGreen", 0.5)
    A0_242:setControlProperty(L4_246, "IconAlpha", 0.9)
  end
end
function ActionMenuWidget.isButtonEnabled(A0_247, A1_248)
  if A0_247:getColor(A1_248 .. ":IconControl_Command_1") < 1 then
    return false
  end
  return true
end
function ActionMenuWidget.playCommandExecuteSound(A0_249, A1_250)
  if A1_250 then
    A0_249:sendCommand("UILuaCommands.ExecuteCommand")
  else
    A0_249:sendCommand("UILuaCommands.ExecuteCommandError")
  end
end
function ActionMenuWidget.clearButtonAnim(A0_251)
  local L1_252, L2_253, L3_254, L4_255, L5_256, L6_257, L7_258
  L2_253 = A0_251
  L1_252 = A0_251.getSlotIndex
  L2_253 = L1_252(L2_253)
  for L6_257 = L1_252, L2_253 do
    L7_258 = A0_251.getSlotLabelCommandIconName
    L7_258 = L7_258(A0_251, L6_257)
    A0_251:sendControlCommand(L7_258, "UILuaCommands.LeaveButtonAnimation")
  end
end
function ActionMenuWidget.getSlotButtonName(A0_259, A1_260)
  return "Button_Command_" .. tostring(A1_260)
end
function ActionMenuWidget.getSlotLabelName(A0_261, A1_262)
  return "Label_Command_" .. tostring(A1_262)
end
function ActionMenuWidget.getSlotLabelCommandNumberName(A0_263, A1_264)
  return A0_263:getSlotLabelCommandIconName(A1_264) .. ":TextBlock_CommandNumber"
end
function ActionMenuWidget.getSlotLabelCommandIconName(A0_265, A1_266)
  return "Label_CommandIcon_" .. tostring(A1_266)
end
function ActionMenuWidget.getPopuptLabelName(A0_267, A1_268)
  return "Label_Command_" .. tostring(A1_268)
end
function ActionMenuWidget.getSlotIconName(A0_269, A1_270)
  local L2_271, L3_272
  L3_272 = A0_269
  L2_271 = A0_269.getSlotLabelCommandIconName
  L2_271 = L2_271(L3_272, A1_270)
  L3_272 = L2_271
  L3_272 = L3_272 .. ":IconControl_Command_1"
  return L3_272, L2_271 .. ":IconControl_Command_2", L2_271 .. ":Grid_Command"
end
function ActionMenuWidget.getSlotRecastGaugeName(A0_273, A1_274)
  return GAUGE_RECAST_BASE .. tostring(A1_274)
end
function ActionMenuWidget.getSlotEffectName(A0_275, A1_276)
  local L2_277, L3_278
  L3_278 = A0_275
  L2_277 = A0_275.getSlotLabelCommandIconName
  L2_277 = L2_277(L3_278, A1_276)
  L3_278 = L2_277
  L3_278 = L3_278 .. ":" .. "Border_FocusEffect"
  return L3_278
end
function ActionMenuWidget.getSlotNameFromButton(A0_279, A1_280)
  local L2_281
  L2_281 = A0_279.getSlotNumberFromButton
  L2_281 = L2_281(A0_279, A1_280)
  if L2_281 == nil then
    return nil
  end
  return A0_279:getSlotLabelCommandIconName(L2_281)
end
function ActionMenuWidget.getSlotNumberFromButton(A0_282, A1_283)
  if A0_282:getControlProperty(A1_283, "IntData.Value0") < 1 or A0_282:getControlProperty(A1_283, "IntData.Value0") > 10 then
    return nil
  end
  return A0_282.work.slotPage * 10 - 10 + A0_282:getControlProperty(A1_283, "IntData.Value0")
end
function ActionMenuWidget.getHandIconNumber(A0_284, A1_285)
  local L2_286
  L2_286 = 245
  if A1_285 == 1 then
    L2_286 = 243
  elseif A1_285 == 2 then
    L2_286 = 244
  end
  return L2_286
end
function ActionMenuWidget.setOnCursorControl(A0_287, A1_288)
  local L2_289
  L2_289 = ""
  if A1_288 ~= nil then
    L2_289 = tostring(A1_288)
  end
  A0_287:setProperty("StringData.Value0", L2_289)
  return
end
function ActionMenuWidget.getOnCursorControl(A0_290)
  return A0_290:getProperty("StringData.Value0")
end
function ActionMenuWidget.getSlotIndex(A0_291)
  local L1_292, L2_293, L3_294, L4_295, L5_296
  L1_292 = A0_291.work
  L1_292 = L1_292.slotPage
  L1_292 = L1_292 - 1
  L1_292 = L1_292 * 10
  L2_293 = L1_292 + 1
  L3_294 = L1_292 + 10
  L4_295 = L2_293
  L5_296 = L3_294
  return L4_295, L5_296
end
