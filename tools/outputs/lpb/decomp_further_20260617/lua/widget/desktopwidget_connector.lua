local L0_0, L1_1, L2_2
L0_0 = DesktopWidget
function L1_1(A0_3)
  A0_3.work._temp = {
    {
      "bazaarActor",
      "actor"
    },
    {
      "bazaarTargetActor",
      "actor"
    },
    {
      "mainTargetCursorImage",
      "integer8"
    },
    {
      "subTargetCursorIndex",
      "array",
      1,
      "integer8"
    },
    {
      "subTargetCursorType",
      "integer8"
    },
    {
      "targetCursorMask",
      "boolean"
    },
    {
      "mainTargetGmModeFlag",
      "boolean"
    },
    {
      "mainTargetDecidedFlag",
      "boolean"
    },
    {
      "subTargetExecuteWidget",
      "actor"
    },
    {
      "subTargetMacroFlag",
      "boolean"
    },
    {
      "subTargetWidgetHideFlag",
      "boolean"
    },
    {
      "subTargetMagicFlag",
      "boolean"
    },
    {
      "subTargetCloseFlag",
      "boolean"
    },
    {
      "subTargetActor",
      "actor"
    },
    {"targetMode", "integer8"},
    {
      "commandIndex",
      "array",
      18,
      "integer8"
    },
    {
      "bazaarUpdateTime",
      "integer32"
    },
    {
      "bazaarUpdateTimeAdd",
      "integer8"
    },
    {"mode", "integer8"},
    {"modeLevel", "integer8"},
    {
      "partyTargetIndex",
      "integer8"
    },
    {
      "tutorialMenuType",
      "integer8"
    },
    {
      "tutorialMenuStatus",
      "integer8"
    },
    {
      "tutorialDeviceType",
      "integer8"
    },
    {
      "userMacroType",
      "integer8"
    },
    {
      "threadOwnerWidget",
      "actor"
    },
    {
      "lockUserControl",
      "boolean"
    },
    {
      "autoLockonEnable",
      "boolean"
    },
    {
      "cutsceneMapFlag",
      "boolean"
    },
    {
      "tutorialFlag",
      "boolean"
    },
    {
      "actionMenuFlag",
      "boolean"
    },
    {
      "logHideFlag",
      "boolean"
    },
    {
      "subTargetName",
      "string",
      128
    },
    {
      "widget",
      "array",
      24,
      "actor"
    },
    {
      "rootWidget",
      "array",
      17,
      "actor"
    },
    {
      "widgetEnableFlag",
      "array",
      7,
      "boolean"
    },
    {
      "widgetOwner",
      "array",
      4,
      "actor"
    },
    {
      "contentsType",
      "array",
      4,
      "integer8"
    },
    {
      "desktopMode",
      "array",
      5,
      "integer8"
    },
    {
      "oldTarget",
      "array",
      4,
      "actor"
    },
    {
      "tutorialLockFlag",
      "array",
      5,
      "boolean"
    },
    {
      "widgetShowFlag",
      "array",
      2,
      "boolean"
    }
  }
  A0_3.work.mode = 1
  A0_3.work.modeLevel = 0
  for _FORV_4_ = 1, 5 do
    A0_3.work.desktopMode[_FORV_4_] = 0
  end
  _FOR_.lockUserControl = true
  A0_3.work.threadOwnerWidget = nil
  A0_3.work.tutorialFlag = false
  A0_3.work.tutorialMenuType = 0
  A0_3.work.tutorialMenuStatus = 0
  A0_3.work.tutorialDeviceType = 1
  for _FORV_4_ = 1, 5 do
    A0_3.work.tutorialLockFlag[_FORV_4_] = false
  end
  for _FORV_4_ = 1, 17 do
    A0_3.work.rootWidget[_FORV_4_] = nil
  end
  for _FORV_4_ = 1, 7 do
    A0_3.work.widgetEnableFlag[_FORV_4_] = false
  end
  for _FORV_4_ = 1, 4 do
    A0_3.work.widgetOwner[_FORV_4_] = nil
    A0_3.work.contentsType[_FORV_4_] = 0
  end
  _FOR_.mainTargetGmModeFlag = false
  for _FORV_4_ = 1, 18 do
    A0_3.work.commandIndex[_FORV_4_] = 0
  end
  _FOR_.bazaarActor = nil
  A0_3.work.bazaarTargetActor = nil
  A0_3.work.bazaarUpdateTime = 0
  A0_3.work.bazaarUpdateTimeAdd = 15
  A0_3.work.autoLockonEnable = false
  A0_3.work.cutsceneMapFlag = false
  A0_3.work.partyTargetIndex = -1
  A0_3.work.actionMenuFlag = false
  A0_3.work.logHideFlag = false
  A0_3.work.userMacroType = 0
  for _FORV_4_ = 1, 4 do
    A0_3.work.oldTarget[_FORV_4_] = nil
  end
  A0_3:_bindWork(500001, "work", "tutorialMenuType")
  A0_3:_bindWork(500002, "work", "tutorialFlag")
  A0_3:_bindWork(500003, "work", "tutorialLockFlag")
  A0_3:_bindWork(500004, "work", "mainTargetDecidedFlag")
  A0_3:checkConfigLogData()
  A0_3:initializeTargetCursor()
  A0_3:setDefaultWidgetLocation()
  A0_3:initializeParameterforStaticWidget()
  A0_3:updateLogTransparency()
  A0_3:updateLogTextTransparency()
  A0_3:updateLogAutoHideTime()
  A0_3:updateLogFontSize()
  A0_3:updateConfigWork(37)
  A0_3:updateConfigWork(33)
  A0_3:updateConfigWork(71)
  A0_3:setUICommandCondition("UILuaCommands.Cancel")
  A0_3:setUICommandCondition("UILuaCommands.MainMenu")
  A0_3:setUICommandCondition("RaptureCommands.Chat")
  A0_3:setUICommandCondition("RaptureCommands.Chat2")
  A0_3:setUICommandCondition("UILuaCommands.ChangeActivateMode")
  A0_3:setUICommandCondition("UILuaCommands.PartyTargetPrev")
  A0_3:setUICommandCondition("UILuaCommands.PartyTargetNext")
  A0_3:setUICommandCondition("UILuaCommands.TargetMyPlayer")
  A0_3:setUICommandCondition("UILuaCommands.ChangeTargetCirclePrev")
  A0_3:setUICommandCondition("UILuaCommands.ChangeTargetCircleNext")
  A0_3:setUICommandCondition("UILuaCommands.ActionMenu")
  A0_3:setUICommandCondition("UILuaCommands.EmoteList")
  A0_3:setUICommandCondition("UILuaCommands.StatusEffect")
  A0_3:setUICommandCondition("UILuaCommands.UseItemList")
  A0_3:setUICommandCondition("UILuaCommands.ActionBarSlotPrev")
  A0_3:setUICommandCondition("UILuaCommands.ActionBarSlotNext")
  A0_3:setUICommandCondition("UILuaCommands.OpenUserMacro")
  A0_3:setUICommandCondition("UILuaCommands.CloseUserMacro")
  A0_3:setUICommandCondition("UILuaCommands.Function1")
  A0_3:setUICommandCondition("UILuaCommands.Function2")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutAction")
  A0_3:setUICommandCondition("UILuaCommands.ChangeChatMode")
  A0_3:setUICommandCondition("UILuaCommands.ReplayTell")
  A0_3:setUICommandCondition("UILuaCommands.SendTell")
  A0_3:setUICommandCondition("UILuaCommands.CallChocobo")
  A0_3:setUICommandCondition("UILuaCommands.CallGoobbue")
  A0_3:setUICommandCondition("UILuaCommands.ChangeWidgetLock")
  A0_3:setUICommandCondition("UILuaCommands.ConsoleTray")
  A0_3:setUICommandCondition("UILuaCommands.ChangePopupHelp")
  A0_3:setUICommandCondition("UILuaCommands.ChangePopupActionHelp")
  A0_3:setUICommandCondition("UILuaCommands.FaceTarget")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionStatusMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionEquipMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionActionMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutBonusMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionItemMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionJournalMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutAchievementMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutSearchMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionPartyMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionCommunicationMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionLinkshellMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionRetainerMenu")
  A0_3:setUICommandCondition("UILuaCommands.MapNavigation")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionQuestLSMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionTeleportMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionReturnMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionSupportMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionConfigMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionLogoutMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionLootMenu")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionCheck")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionBazaar")
  A0_3:setUICommandCondition("UILuaCommands.ShortCutActionCraft")
  A0_3:setUICommandCondition("UILuaCommands.NearestPC")
  A0_3:setUICommandCondition("UILuaCommands.NearestNPC")
  A0_3:setUICommandCondition("UILuaCommands.NearestEnemy")
  A0_3:setUICommandCondition("UILuaCommands.PartyTarget1")
  A0_3:setUICommandCondition("UILuaCommands.PartyTarget2")
  A0_3:setUICommandCondition("UILuaCommands.PartyTarget3")
  A0_3:setUICommandCondition("UILuaCommands.PartyTarget4")
  A0_3:setUICommandCondition("UILuaCommands.PartyTarget5")
  A0_3:setUICommandCondition("UILuaCommands.PartyTarget6")
  A0_3:setUICommandCondition("UILuaCommands.PartyTarget7")
  A0_3:setUICommandCondition("UILuaCommands.TargetLastAttacker")
  A0_3:setUICommandCondition("UILuaCommands.ChangeTargetCircleAll")
  A0_3:setUICommandCondition("UILuaCommands.ChangeTargetCirclePlayer")
  A0_3:setUICommandCondition("UILuaCommands.ChangeTargetCircleParty")
  A0_3:setUICommandCondition("UILuaCommands.ChangeTargetCircleEnemy")
  A0_3:setUICommandCondition("UILuaCommands.ChangeCurrentLinkshell")
  A0_3:setUICommandCondition("UILuaCommands.SetCurrentLinkshell")
  A0_3:orderDesktopWidgetMode(8)
  A0_3:getStaticWidget(3):updateDisplayStatus()
  A0_3:changeFocusedWidget(A0_3, false)
end
L0_0.init = L1_1
L0_0 = DesktopWidget
function L1_1(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9
  L2_6 = true
  L3_7 = "Desktop"
  L4_8 = 0
  L5_9 = true
  return L1_5, L2_6, L3_7, L4_8, L5_9
end
L0_0.initDesktopInitialParameter = L1_1
L0_0 = DesktopWidget
function L1_1(A0_10, A1_11, A2_12, A3_13)
  local L4_14
  L4_14 = false
  return L4_14
end
L0_0.show = L1_1
L0_0 = DesktopWidget
function L1_1(A0_15, A1_16, A2_17, A3_18)
  local L4_19
  L4_19 = false
  return L4_19
end
L0_0.hide = L1_1
L0_0 = DesktopWidget
function L1_1(A0_20)
  local L1_21
  L1_21 = true
  return L1_21
end
L0_0.isShow = L1_1
L0_0 = DesktopWidget
function L1_1(A0_22)
  if A0_22:getWidget(4, "BazaarListWidget") == nil then
    return
  end
  if A0_22:getBazaarActor() == nil then
    return
  end
  if worldMaster:_getMyPlayer() == A0_22:getBazaarActor() then
    return
  end
  if worldMaster:_getServerTime() > A0_22.work.bazaarUpdateTime + A0_22.work.bazaarUpdateTimeAdd and A0_22:getBazaarActor():updateItemPackage(8) == true then
    A0_22.work.bazaarUpdateTime = worldMaster:_getServerTime()
    A0_22.work.bazaarUpdateTimeAdd = 15
  end
end
L0_0.updateBazaarPackage = L1_1
L0_0 = DesktopWidget
function L1_1(A0_23, A1_24)
  if A1_24 ~= nil and A1_24:_isAlive() == false then
    return nil
  end
  return A1_24
end
L0_0.checkActor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_25, A1_26)
  local L2_27
  if A1_26 == nil then
    L2_27 = false
    return L2_27
  end
  if A1_26 == "" then
    L2_27 = false
    return L2_27
  end
  L2_27 = true
  return L2_27
end
L0_0.checkText = L1_1
L0_0 = DesktopWidget
function L1_1(A0_28, A1_29)
  if A0_28:checkActor(A1_29) == nil then
    return nil
  end
  return A1_29:_getLocalizedDisplayName()
end
L0_0.getActorName = L1_1
L0_0 = DesktopWidget
function L1_1(A0_30)
  local L1_31, L2_32
  L2_32 = A0_30
  L1_31 = A0_30.getActorName
  return L1_31(L2_32, worldMaster:_getMyPlayer())
end
L0_0.getPlayerName = L1_1
L0_0 = DesktopWidget
function L1_1(A0_33)
  local L1_34
  L1_34 = A0_33.work
  L1_34 = L1_34.bazaarActor
  if L1_34 ~= nil and L1_34:_isAlive() == false then
    L1_34 = nil
    A0_33.work.bazaarActor = nil
  else
  end
  return L1_34
end
L0_0.getBazaarActor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_35)
  if A0_35:getBazaarActor() == nil then
    return false
  end
  return true
end
L0_0.isValidBazaarActor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_36)
  A0_36.work.bazaarActor = worldMaster:_getMyPlayer()
end
L0_0.setBazaarActor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_37)
  local L1_38
  L1_38 = A0_37.getBazaarActor
  L1_38 = L1_38(A0_37)
  return A0_37:getActorName(L1_38)
end
L0_0.getBazaarActorName = L1_1
L0_0 = DesktopWidget
function L1_1(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47
  L1_40 = worldMaster
  L2_41 = L1_40
  L1_40 = L1_40._getMyPlayer
  L1_40 = L1_40(L2_41)
  L3_42 = L1_40
  L2_41 = L1_40._getGroup
  L4_43 = 50002
  L2_41 = L2_41(L3_42, L4_43)
  if L2_41 == nil then
    L3_42 = nil
    return L3_42
  end
  L3_42 = nil
  L4_43 = L2_41._countMember
  L4_43 = L4_43(L5_44)
  for L8_47 = 1, L4_43 do
    if L2_41:_isExistInClientMember(L8_47) == true and L2_41:_getMember(L8_47):_isAlive() == true and L2_41:_getMember(L8_47) ~= L1_40 then
      L3_42 = L2_41:_getMember(L8_47)
      break
    end
  end
  return L3_42
end
L0_0.getTradeActor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_48)
  local L1_49
  L1_49 = A0_48.getTradeActor
  L1_49 = L1_49(A0_48)
  return A0_48:getActorName(L1_49)
end
L0_0.getTradeActorName = L1_1
L0_0 = DesktopWidget
function L1_1(A0_50, A1_51)
  local L2_52, L3_53
  L3_53 = A0_50
  L2_52 = A0_50.isChinese
  L2_52 = L2_52(L3_53)
  if L2_52 == true then
    return A1_51
  end
  L2_52 = _string
  L2_52 = L2_52.upper
  L3_53 = _string
  L3_53 = L3_53.sub
  L3_53 = L3_53(A1_51, 1, 1)
  L2_52 = L2_52(L3_53, L3_53(A1_51, 1, 1))
  L3_53 = L2_52
  L2_52 = L3_53 .. _string.sub(_string.lower(A1_51), 2)
  return L2_52
end
L0_0.convertNameText = L1_1
L0_0 = DesktopWidget
function L1_1(A0_54, A1_55)
  if A0_54:isChinese() == false then
    return A1_55
  end
  return A1_55 .. " !!!"
end
L0_0.convertChineseName = L1_1
L0_0 = DesktopWidget
function L1_1(A0_56, A1_57)
  if A1_57 == nil then
    return nil
  end
  if A0_56:isChinese() == false then
    return A1_57
  end
  return _string.gsub(A1_57, " !!!", "")
end
L0_0.deleteChineseName = L1_1
L0_0 = DesktopWidget
function L1_1(A0_58, A1_59)
  worldMaster:_getMyPlayer():_runCharaScheduler(A1_59)
end
L0_0.executeEffect = L1_1
L0_0 = DesktopWidget
function L1_1(A0_60, A1_61)
  A0_60.work.threadOwnerWidget = A1_61
end
L0_0.setThreadOwnerWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_62)
  return A0_62.work.threadOwnerWidget
end
L0_0.getThreadOwnerWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_63)
  A0_63:_initTargetCursors(2)
  A0_63:_setTargetCursorImage(1, 1)
  A0_63.work.mainTargetCursorImage = 1
  A0_63.work.mainTargetDecidedFlag = false
  A0_63:_setTargetableDistance(1, 50)
  A0_63:_setTargetCharacter(1, nil)
  for _FORV_5_ = 1, #A0_63.work.subTargetCursorIndex do
    A0_63.work.subTargetCursorIndex[_FORV_5_] = 2 + 0
    A0_63:_setTargetCursorImage(A0_63.work.subTargetCursorIndex[_FORV_5_], 3)
    A0_63:_setTargetableDistance(A0_63.work.subTargetCursorIndex[_FORV_5_], 50)
    A0_63:_setTargetCharacter(A0_63.work.subTargetCursorIndex[_FORV_5_], nil)
  end
  _FOR_.subTargetCursorType = 100
  A0_63.work.subTargetName = ""
  A0_63.work.subTargetExecuteWidget = nil
  A0_63.work.subTargetMacroFlag = false
  A0_63.work.subTargetWidgetHideFlag = false
  A0_63.work.subTargetMagicFlag = false
  A0_63.work.subTargetActor = nil
  A0_63:_setCurrentTargetCursor(1)
  A0_63.work.targetCursorMask = false
  A0_63:_setAllTargetCursorMask(A0_63.work.targetCursorMask)
  A0_63.work.targetMode = A0_63:getDefaultTargetMode()
end
L0_0.initializeTargetCursor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_64)
  local L1_65
  L1_65 = 1
  if A0_64:getConfigWork(13) == 1 then
    L1_65 = 2
  end
  return L1_65
end
L0_0.getDefaultTargetMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_66, A1_67, A2_68, A3_69, A4_70, A5_71)
  local L6_72, L7_73, L8_74, L9_75
  L6_72 = A0_66.work
  L6_72 = L6_72.subTargetExecuteWidget
  if L6_72 ~= nil then
    L6_72 = false
    return L6_72
  end
  L6_72 = A0_66.work
  L6_72.subTargetCursorType = A2_68
  if A4_70 ~= nil then
    L6_72 = A0_66.work
    L6_72.subTargetMagicFlag = A4_70
  else
    L6_72 = A0_66.work
    L6_72.subTargetMagicFlag = false
  end
  if A5_71 ~= nil then
    L6_72 = A0_66.work
    L6_72.subTargetCloseFlag = A5_71
  else
    L6_72 = A0_66.work
    L6_72.subTargetCloseFlag = false
  end
  L6_72 = worldMaster
  L7_73 = L6_72
  L6_72 = L6_72._getMyPlayer
  L6_72 = L6_72(L7_73)
  L7_73 = A0_66.work
  L7_73 = L7_73.subTargetCursorIndex
  L7_73 = L7_73[1]
  L8_74 = 1
  L9_75 = A0_66.getMainTargetCharacter
  L9_75 = L9_75(A0_66)
  if L9_75 == nil then
    A0_66:_setTargetCharacter(L8_74, L6_72)
    L9_75 = L6_72
  elseif not A0_66:checkSubTargetable(L9_75, A0_66.work.subTargetCursorType) then
    L9_75 = L6_72
  end
  A0_66:_setCurrentTargetCursor(L7_73)
  A0_66:_setTargetCharacter(L7_73, L9_75)
  if A1_67 ~= A0_66 then
    if A3_69 ~= true then
      A0_66.work.subTargetWidgetHideFlag = true
      A1_67:setInputEnable(false)
      A1_67:hide()
    else
      A0_66.work.subTargetWidgetHideFlag = false
    end
  else
    A0_66.work.subTargetWidgetHideFlag = false
  end
  if A0_66:getConfigFlag(41) == true then
    A0_66.work.userMacroType = A0_66:getStaticWidget(7):getMacroType()
    A0_66.work.widgetShowFlag[1] = true
  else
    A0_66.work.userMacroType = 0
    A0_66.work.widgetShowFlag[1] = A0_66:isShowActionMenu()
  end
  A0_66:getStaticWidget(7):hide()
  A0_66.work.widgetShowFlag[2] = A0_66:getStaticWidget(15):isShow()
  if A0_66.work.widgetShowFlag[2] == true then
    A0_66:getStaticWidget(15):hide()
  end
  A0_66:getStaticWidget(1):hide()
  A0_66:getStaticWidget(16):cancelFocus()
  A0_66:changeFocusedWidget(A0_66, false)
  A0_66.work.subTargetExecuteWidget = A1_67
  return true
end
L0_0.executeSubTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_76, A1_77)
  local L2_78
  L2_78 = A0_76.work
  L2_78 = L2_78.subTargetExecuteWidget
  if L2_78 == nil then
    return
  end
  if A1_77 ~= nil then
    L2_78 = A0_76.playSoundTargetDecided
    L2_78(A0_76)
  else
    L2_78 = A0_76.playSoundTargetCanceled
    L2_78(A0_76)
  end
  if A1_77 ~= nil then
    L2_78 = A1_77._isAlive
    L2_78 = L2_78(A1_77)
    if L2_78 == true then
      L2_78 = A1_77._getLocalizedDisplayNameForChat
      L2_78 = L2_78(A1_77)
      if L2_78 ~= nil and _getUTF8StringByteLength(L2_78) <= 128 then
        A0_76.work.subTargetName = L2_78
      end
    end
  end
  L2_78 = A0_76.work
  L2_78 = L2_78.widgetShowFlag
  L2_78 = L2_78[1]
  if L2_78 == true then
    L2_78 = A0_76.getStaticWidget
    L2_78 = L2_78(A0_76, 7)
    L2_78:show()
    if A0_76.work.userMacroType ~= 0 then
      L2_78:showUserMacro(A0_76.work.userMacroType)
    end
  end
  L2_78 = A0_76.work
  L2_78 = L2_78.widgetShowFlag
  L2_78 = L2_78[2]
  if L2_78 == true then
    L2_78 = A0_76.getStaticWidget
    L2_78 = L2_78(A0_76, 15)
    L2_78 = L2_78.show
    L2_78(L2_78)
  end
  L2_78 = A0_76.checkActor
  L2_78 = L2_78(A0_76, A0_76.work.subTargetExecuteWidget)
  if L2_78 ~= nil then
    L2_78:processSubTargetDecided(A1_77)
    if A0_76.work.subTargetCloseFlag == true and A1_77 ~= nil then
      L2_78:close()
    elseif A0_76.work.subTargetWidgetHideFlag == true then
      L2_78:setInputEnable(true)
      L2_78:show()
    end
  end
  A0_76.work.subTargetExecuteWidget = nil
  A0_76:cancelSubTargetSelect()
end
L0_0.subTargetDecided = L1_1
L0_0 = DesktopWidget
function L1_1(A0_79, A1_80)
  local L2_81
  L2_81 = A0_79.work
  L2_81.subTargetMacroFlag = false
  L2_81 = A0_79.work
  L2_81.subTargetActor = A1_80
end
L0_0.processSubTargetDecided = L1_1
L0_0 = DesktopWidget
function L1_1(A0_82, A1_83)
  local L2_84
  L2_84 = A0_82.work
  L2_84.mainTargetDecidedFlag = A1_83
  L2_84 = A0_82.work
  L2_84 = L2_84.mainTargetCursorImage
  if A1_83 == true then
    L2_84 = L2_84 + 1
    if worldMaster:_getMyPlayer():isActiveMode() == true then
      A0_82:requestAutoLockonTarget()
    end
  elseif A0_82.work.mainTargetDecidedFlag == true then
    A0_82:cancelLockon()
  end
  A0_82:_setTargetCursorImage(1, L2_84)
end
L0_0.setMainTargetCursorStatus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_85)
  return A0_85.work.mainTargetDecidedFlag
end
L0_0.isMainTargetDecided = L1_1
L0_0 = DesktopWidget
function L1_1(A0_86, A1_87)
  A0_86.work.targetCursorMask = A1_87
  A0_86:_setAllTargetCursorMask(A0_86.work.targetCursorMask)
end
L0_0.maskAllTargetCursorDisplay = L1_1
L0_0 = DesktopWidget
function L1_1(A0_88)
  return A0_88:_getTargetCharacter(1)
end
L0_0.getMainTargetCharacter = L1_1
L0_0 = DesktopWidget
function L1_1(A0_89)
  worldMaster:_getMyPlayer():_setLockonTarget(nil)
  A0_89:_setTargetCharacter(1, nil)
  A0_89:afterTargetChanged(1, nil)
end
L0_0.cancelMainTargetCharacter = L1_1
L0_0 = DesktopWidget
function L1_1(A0_90, A1_91)
  return A0_90:_getTargetCharacter(A1_91)
end
L0_0.getSubTargetCharacter = L1_1
L0_0 = DesktopWidget
function L1_1(A0_92)
  local L1_93, L2_94
  L2_94 = A0_92
  L1_93 = A0_92._getTargetCharacter
  return L1_93(L2_94, A0_92:_getCurrentTargetCursor())
end
L0_0.getCurrentTargetCharacter = L1_1
L0_0 = DesktopWidget
function L1_1(A0_95)
  local L1_96
  L1_96 = A0_95.work
  L1_96 = L1_96.subTargetExecuteWidget
  if L1_96 ~= nil then
    L1_96 = true
    return L1_96
  end
  L1_96 = false
  return L1_96
end
L0_0.isSubTargetSelectMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_97)
  A0_97:_setCurrentTargetCursor(1)
  A0_97:_setTargetCharacter(A0_97.work.subTargetCursorIndex[1], nil)
end
L0_0.cancelSubTargetSelect = L1_1
L0_0 = DesktopWidget
function L1_1(A0_98, A1_99)
  A0_98.work.mainTargetGmModeFlag = A1_99
end
L0_0.setMainTargetGmMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_100, A1_101, A2_102, A3_103)
  do break end
  do return true end
  if A0_100.work.targetCursorMask == true then
    return false
  end
  if A2_102 == nil then
    return true
  end
  if A0_100:_getCurrentTargetCursor() == 1 then
    if A0_100.work.mainTargetGmModeFlag then
      return true
    end
    if worldMaster:_getMyPlayer():_getLockonTarget() ~= nil then
      return false
    end
    if A0_100:isValidTarget(A2_102) == false then
      return false
    end
    if A3_103 == 2 then
      break
    else
    end
    if A3_103 == 3 then
      if A0_100:getConfigFlag(34) == true then
        do break end
        elseif A3_103 == 4 then
        else
        end
        if A3_103 == 6 then
          if A0_100:checkEnemyModeTarget(A2_102) == false then
            return false
          end
          break
        else
        end
        if A3_103 == 5 then
          if A0_100:checkEnemyModeTarget(A2_102) == false then
            return false
          end
          if A2_102:getHateType() == 1 then
            return false
          end
          break
        else
        end
      else
      end
    if false == true and A0_100:isValidModeTarget(A2_102) == false then
      return false
    end
  elseif A0_100:_getCurrentTargetCursor() == A0_100.work.subTargetCursorIndex[1] then
    if A2_102:isPropertyEnabled(2) == false then
      return false
    end
    if A3_103 == 2 then
      return true
    end
    return A0_100:checkSubTargetable(A2_102, A0_100.work.subTargetCursorType)
  end
  return true
end
L0_0._onCheckTargetable = L1_1
L0_0 = DesktopWidget
function L1_1(A0_104, A1_105)
  if A1_105:isPropertyEnabled(2) == false then
    return false
  end
  if A1_105:isDead() == true and (A0_104:getConfigFlag(43) == true or A0_104:checkEnemyModeTarget(A1_105) == true) then
    return false
  end
  return true
end
L0_0.isValidTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_106, A1_107)
  if A1_107:isPlayer() == true then
    return true
  end
  if A1_107:isPropertyEnabled(3) == false then
    return true
  end
  if A1_107:getBattalion() == 1 then
    return true
  end
  return false
end
L0_0.checkPlayerModeTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_108, A1_109)
  if A0_108:checkPlayerModeTarget(A1_109) == true then
    return false
  end
  return true
end
L0_0.checkEnemyModeTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_110, A1_111)
  if worldMaster:_getMyPlayer():isActiveMode() == true and A0_110:getConfigFlag(42) == true and A0_110:checkTargetInBattle() == true and A1_111:getHateType() == 1 then
    return true
  end
  return false
end
L0_0.isInvalidEnmityTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_112, A1_113)
  local L2_114
  L2_114 = A0_112.work
  L2_114 = L2_114.targetMode
  if L2_114 == 2 then
    if A0_112:checkPlayerModeTarget(A1_113) == false then
      do return false end
      do break end
      else
      end
      if L2_114 == 4 then
        if A0_112:checkEnemyModeTarget(A1_113) == false then
          return false
        end
        if A0_112:isInvalidEnmityTarget(A1_113) == true then
          do return false end
          do break end
          else
          end
          if L2_114 == 3 then
            if worldMaster:_getMyPlayer():getPlayerParty():_isMember(A1_113) == false then
              do return false end
              do break end
              if worldMaster:_getMyPlayer():isActiveMode() == true and A0_112:getConfigFlag(42) == true then
                if A0_112:checkEnemyModeTarget(A1_113) == true then
                  if A0_112:checkTargetInBattle() == true and A1_113:getHateType() == 1 then
                    return false
                  end
                else
                  return false
                end
              end
            else
            end
          else
          end
        else
        end
    else
    end
  L2_114 = true
  return L2_114
end
L0_0.isValidModeTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_115)
  if worldMaster:_getMyPlayer():_haveEnmityCharacters() == true then
    return true
  end
  return false
end
L0_0.checkTargetInBattle = L1_1
L0_0 = DesktopWidget
function L1_1(A0_116, A1_117, A2_118)
  if A1_117 == nil then
    return false
  end
  if A1_117:isPropertyEnabled(2) == false then
    return false
  end
  if A2_118 == 1 then
    if A1_117:isLiving() == true then
      do return true end
      do break end
      else
      end
      if A2_118 == 2 then
        if A1_117 == worldMaster:_getMyPlayer() and A1_117:isLiving() == true then
          do return true end
          do break end
          else
          end
          if A2_118 == 3 then
            if (A1_117:isPlayer() == true or A1_117:getBattalion() == 1) and A1_117:isLiving() == true then
              do return true end
              do break end
              else
              end
              if A2_118 == 4 then
                if (A1_117 == worldMaster:_getMyPlayer() or A1_117:isPlayer() == false) and A1_117:isLiving() == true then
                  do return true end
                  do break end
                  else
                  end
                  if A2_118 == 5 then
                    if A1_117 ~= worldMaster:_getMyPlayer() and (A1_117:isPlayer() == true or A1_117:getBattalion() == 1) and A1_117:isLiving() == true then
                      do return true end
                      do break end
                      else
                      end
                      if A2_118 == 6 then
                        if A1_117 ~= worldMaster:_getMyPlayer() and A1_117:isLiving() then
                          do return true end
                          do break end
                          else
                          end
                          if A2_118 == 7 then
                            if A1_117:isPlayer() == false and A1_117:isLiving() == true then
                              do return true end
                              do break end
                              else
                              end
                              if A2_118 == 8 then
                                if A1_117 ~= worldMaster:_getMyPlayer() and (A1_117:isPlayer() == true or A1_117:getBattalion() == 1) and A1_117:isDead() == true then
                                  do return true end
                                  do break end
                                  else
                                  end
                                  if A2_118 == 9 then
                                    if A1_117:isPlayer() == false and A1_117:isDead() == false then
                                      do return true end
                                      do break end
                                      else
                                      end
                                      if A2_118 == 10 then
                                        if A1_117 ~= worldMaster:_getMyPlayer() then
                                          do return true end
                                          do break end
                                          else
                                          end
                                          if A2_118 == 11 then
                                            if A1_117:isPlayer() == false then
                                              do return true end
                                              do break end
                                              else
                                              end
                                              if A2_118 == 102 then
                                                if A1_117:isPlayer() then
                                                  do return true end
                                                  do break end
                                                  else
                                                  end
                                                  if A2_118 == 103 then
                                                    if not A1_117:isPlayer() then
                                                      do return true end
                                                      do break end
                                                      else
                                                      end
                                                      if A2_118 == 104 then
                                                        if A0_116:isJoinedCharacterAtMyParty(A1_117) > 0 then
                                                          do return true end
                                                          do break end
                                                          else
                                                          end
                                                          if A2_118 == 105 then
                                                            if A1_117:isDead() then
                                                              do return true end
                                                              do break end
                                                              else
                                                              end
                                                              if A2_118 == 106 then
                                                                if A0_116:checkEnemyModeTarget(A1_117) == true then
                                                                  do return true end
                                                                  do break end
                                                                  else
                                                                  end
                                                                  if A2_118 == 107 then
                                                                    if A0_116:checkEnemyModeTarget(A1_117) == true and A1_117:getHateType() ~= 1 then
                                                                      do return true end
                                                                      do break end
                                                                      else
                                                                        if A2_118 == 101 then
                                                                        else
                                                                        end
                                                                      end
                                                                      return true
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
  return false
end
L0_0.checkSubTargetable = L1_1
L0_0 = DesktopWidget
function L1_1(A0_119, A1_120, A2_121, A3_122)
  if A1_120 == 1 then
    if A0_119:isValidTarget(A2_121) == false then
      return false
    end
  elseif A1_120 == A0_119.work.subTargetCursorIndex[1] then
    if A0_119:checkSubTargetable(A2_121, A0_119.work.subTargetCursorType) == false then
      return false
    end
  else
    return false
  end
  if A3_122 == 1 then
    if A2_121:isPlayer() == false then
      do return false end
      do break end
      else
      end
      if A3_122 == 2 then
        if A2_121:isPlayer() == true then
          do return false end
          do break end
          else
          end
          if A3_122 == 3 then
            if A0_119:checkEnemyModeTarget(A2_121) == false then
              do return false end
              do break end
              else
              end
              if A3_122 == 4 then
                if A0_119:checkEnemyModeTarget(A2_121) == false then
                  return false
                end
                if A2_121:getHateType() == 1 then
                  do return false end
                  do break end
                  return false
                end
              else
              end
            end
        end
    end
  return true
end
L0_0._onCheckTargetableNearest = L1_1
L0_0 = DesktopWidget
function L1_1(A0_123, A1_124, A2_125)
  local L3_126, L4_127, L5_128, L6_129, L7_130, L8_131
  L3_126 = A0_123.work
  L3_126 = L3_126.targetCursorMask
  if L3_126 == true then
    L3_126 = false
    return L3_126
  end
  if A1_124 == 1 then
    L3_126 = worldMaster
    L4_127 = L3_126
    L3_126 = L3_126._getMyPlayer
    L3_126 = L3_126(L4_127)
    L4_127 = L3_126
    L3_126 = L3_126._getLockonTarget
    L3_126 = L3_126(L4_127)
    if L3_126 ~= nil then
      L3_126 = false
      return L3_126
    end
  end
  L3_126 = A0_123.work
  L3_126 = L3_126.subTargetCursorIndex
  L3_126 = L3_126[1]
  if A1_124 == L3_126 then
    L4_127 = A0_123
    L3_126 = A0_123.checkSubTargetable
    L5_128 = A2_125
    L6_129 = A0_123.work
    L6_129 = L6_129.subTargetCursorType
    L3_126 = L3_126(L4_127, L5_128, L6_129)
    if L3_126 == false then
      L3_126 = false
      return L3_126
    end
  end
  if A2_125 ~= nil then
    L3_126 = worldMaster
    L4_127 = L3_126
    L3_126 = L3_126._getMyPlayer
    L3_126 = L3_126(L4_127)
    L4_127 = L3_126
    L3_126 = L3_126._getPos
    L5_128 = L3_126(L4_127)
    L7_130 = A2_125
    L6_129 = A2_125._getPos
    L8_131 = L6_129(L7_130)
    if math:distance(L3_126, L4_127, L5_128, L6_129, L7_130, L8_131) > 50 then
      return false
    end
  end
  L4_127 = A0_123
  L3_126 = A0_123._setTargetCharacter
  L5_128 = A1_124
  L6_129 = A2_125
  L3_126(L4_127, L5_128, L6_129)
  L4_127 = A0_123
  L3_126 = A0_123.afterTargetChanged
  L5_128 = A1_124
  L6_129 = A2_125
  L3_126(L4_127, L5_128, L6_129)
  L3_126 = true
  return L3_126
end
L0_0.setTargetCharacter = L1_1
L0_0 = DesktopWidget
function L1_1(A0_132, A1_133)
  return A0_132:setTargetCharacter(A0_132:_getCurrentTargetCursor(), A1_133)
end
L0_0.setCurrentTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_134, A1_135)
  return A0_134:setShortcutTarget(worldMaster:_getMyPlayer(), A1_135)
end
L0_0.setTargetCharacterForMyPlayer = L1_1
L0_0 = DesktopWidget
function L1_1(A0_136, A1_137, A2_138)
  do break end
  do return end
  if A2_138 == nil then
    if A1_137 == 1 then
      A0_136:cancelLockon()
    end
  else
  end
  A0_136:updateParameterWidget(A1_137, A2_138)
  if A1_137 == 1 then
    A0_136.work.autoLockonEnable = true
    if (A2_138:_isTalkable(worldMaster:_getMyPlayer()) and false) == false then
      A0_136:updateActionMenuWidget(false, false)
      A0_136:updateMainMenuWidget()
    else
      A0_136:updateActionMenuWidget(false)
      A0_136:updateMainMenuWidget()
      do break end
      return
    end
    if A2_138 ~= nil then
      if A0_136:isValidModeTarget(A2_138) == true then
        A0_136.work.oldTarget[A0_136.work.targetMode] = A2_138
      end
    else
      A0_136.work.oldTarget[A0_136.work.targetMode] = nil
    end
  elseif A1_137 == A0_136.work.subTargetCursorIndex[1] and A2_138 == nil then
    A0_136:subTargetDecided(nil)
  end
  if false == false then
    A0_136:getStaticWidget(5):hide()
  else
    A0_136:getStaticWidget(5):show()
    A0_136:getStaticWidget(5):updateAll()
  end
end
L0_0.afterTargetChanged = L1_1
L0_0 = DesktopWidget
function L1_1(A0_139, A1_140, A2_141)
  local L3_142, L4_143
  L3_142 = A0_139.work
  L3_142 = L3_142.subTargetCursorIndex
  L3_142 = L3_142[1]
  if A1_140 == L3_142 and A2_141 == nil then
    L4_143 = A0_139
    L3_142 = A0_139.getMainTargetCharacter
    L3_142 = L3_142(L4_143)
    A2_141 = L3_142
  end
  L3_142 = true
  L4_143 = 0
  if A2_141 ~= worldMaster:_getMyPlayer() then
    L3_142 = false
  end
  A0_139.work.partyTargetIndex = -1
  if A0_139:isJoinedPartyMyPlayer() == true and A2_141 ~= nil then
    if A2_141 ~= worldMaster:_getMyPlayer() then
      L4_143 = A0_139:isJoinedCharacterAtMyParty(A2_141)
      A0_139.work.partyTargetIndex = A0_139:getPartyMemberListIndex(A2_141)
    else
      A0_139.work.partyTargetIndex = 0
    end
  end
  A0_139:getStaticWidget(4):setTargetMyPlayer(L3_142)
  if L4_143 == 0 then
    L4_143 = nil
  end
  A0_139:getStaticWidget(6):updateTargetPartyMember(L4_143)
end
L0_0.updateParameterWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_144)
  do break end
  do return end
  if A0_144:_getCurrentTargetCursor() == A0_144.work.subTargetCursorIndex[1] then
    A0_144:setTargetCharacter(A0_144.work.subTargetCursorIndex[1], nil)
  end
  A0_144:setTargetCharacter(1, nil)
end
L0_0.cancelAllTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_145, A1_146, A2_147)
  A0_145:afterTargetChanged(A1_146, A2_147)
  if A2_147 ~= nil then
    A0_145:playSoundTargetChanged()
  elseif A1_146 ~= A0_145.work.subTargetCursorIndex[1] then
    A0_145:playSoundTargetCanceled()
  end
end
L0_0._onTargetChanged = L1_1
L0_0 = DesktopWidget
function L1_1(A0_148)
  if not worldMaster:_getMyPlayer():isEventPlaying() then
    A0_148:_sendStoryboardCommand(nil, "Window_Desktop", "UILuaCommands.PlayTargetChanged")
  end
end
L0_0.playSoundTargetChanged = L1_1
L0_0 = DesktopWidget
function L1_1(A0_149)
  if not worldMaster:_getMyPlayer():isEventPlaying() then
    A0_149:_sendStoryboardCommand(nil, "Window_Desktop", "UILuaCommands.PlayTargetCancel")
  end
end
L0_0.playSoundTargetCanceled = L1_1
L0_0 = DesktopWidget
function L1_1(A0_150)
  if not worldMaster:_getMyPlayer():isEventPlaying() then
    A0_150:_sendStoryboardCommand(nil, "Window_Desktop", "UILuaCommands.PlayTargetDecided")
  end
end
L0_0.playSoundTargetDecided = L1_1
L0_0 = DesktopWidget
function L1_1(A0_151)
  if worldMaster:_getMyPlayer():isEventPlaying() == false then
    A0_151:sendCommand("UILuaCommands.ExecuteCommandError")
  end
end
L0_0.playSoundCommandError = L1_1
L0_0 = DesktopWidget
function L1_1(A0_152)
  local L1_153
  L1_153 = A0_152.getConfigFlag
  L1_153 = L1_153(A0_152, 4)
  if L1_153 == false then
    L1_153 = false
    return L1_153
  end
  L1_153 = A0_152.work
  L1_153 = L1_153.autoLockonEnable
  if L1_153 == false then
    L1_153 = false
    return L1_153
  end
  L1_153 = A0_152.getCurrentTargetCharacter
  L1_153 = L1_153(A0_152)
  if L1_153 == nil then
    return false
  end
  if A0_152.work.mainTargetDecidedFlag == false then
    return false
  end
  if A0_152:checkPlayerModeTarget(L1_153) == true then
    return false
  end
  return A0_152:lockonCurrentTarget()
end
L0_0.requestAutoLockonTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_154)
  local L1_155, L2_156, L3_157
  L1_155 = false
  L2_156 = worldMaster
  L3_157 = L2_156
  L2_156 = L2_156._getMyPlayer
  L2_156 = L2_156(L3_157)
  L3_157 = L2_156._getLockonTarget
  L3_157 = L3_157(L2_156)
  if L3_157 == nil then
    L3_157 = A0_154.getCurrentTargetCharacter
    L3_157 = L3_157(A0_154)
    if L3_157 ~= nil and L3_157 ~= L2_156 then
      L2_156:_setLockonTarget(L3_157)
      A0_154.work.autoLockonEnable = false
      L1_155 = true
    end
  end
  return L1_155
end
L0_0.lockonCurrentTarget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_158)
  return A0_158:getConfigFlag(5)
end
L0_0.isEventLockonCameraEnable = L1_1
L0_0 = DesktopWidget
function L1_1(A0_159, A1_160, A2_161)
  local L3_162, L4_163
  do break end
  do return end
  L4_163 = A0_159
  L3_162 = A0_159.isTutorialLock
  L3_162 = L3_162(L4_163, 3)
  if L3_162 == true then
    return
  end
  L3_162 = worldMaster
  L4_163 = L3_162
  L3_162 = L3_162._getMyPlayer
  L3_162 = L3_162(L4_163)
  if A1_160 == 1 then
    if A2_161 == nil then
      L4_163 = A0_159.playSoundTargetCanceled
      L4_163(A0_159)
      L4_163 = A0_159._setTargetCharacter
      L4_163(A0_159, 1, L3_162)
      L4_163 = A0_159.maskAllTargetCursorDisplay
      L4_163(A0_159, false)
      L4_163 = A0_159.getStaticWidget
      L4_163 = L4_163(A0_159, 5)
      L4_163:show()
      L4_163:updateAll()
      A0_159:updateActionMenuWidget(false, false)
      return
    elseif A2_161 ~= L3_162 then
      do break end
      do return end
      L4_163 = A0_159.work
      L4_163 = L4_163.lockUserControl
      if L4_163 then
        return
      end
      L4_163 = A0_159.playSoundTargetDecided
      L4_163(A0_159)
      L4_163 = A0_159.isOtherRetainerBazaar
      L4_163 = L4_163(A0_159, A2_161)
      if L4_163 == true then
        L4_163 = A0_159.executeBazaarCommand
        L4_163(A0_159)
        return
      end
      L4_163 = A2_161.isPlayer
      L4_163 = L4_163(A2_161)
      if L4_163 == false then
        L4_163 = A2_161.getActorClassId
        L4_163 = L4_163(A2_161)
        if L4_163 == 1200052 or L4_163 == 1200054 or L4_163 == 1200053 or L4_163 == 1200055 or L4_163 == 1200057 then
          if A2_161 == L3_162:getPlaceDrivenCommandVariation(1) and (L3_162:getPlaceDrivenCommandVariation(1) == 20001 or L3_162:getPlaceDrivenCommandVariation(1) == 20002 or L3_162:getPlaceDrivenCommandVariation(1) == 20005 or L3_162:getPlaceDrivenCommandVariation(1) == 20006 or L3_162:getPlaceDrivenCommandVariation(1) == 20007) then
            desktopWidget:executePlayerSystemCommand(24301)
          end
          return
        end
      end
      L4_163 = A0_159.isTargetTalkable
      L4_163 = L4_163(A0_159)
      if L4_163 then
        L4_163 = L3_162.getSystemCommand
        L4_163 = L4_163(L3_162, 24101)
        if L4_163 ~= nil and L4_163:_isAlive() then
          if L3_162:canCommand(L4_163, nil, nil, nil, nil, A2_161) then
            L3_162:command(L4_163, nil, nil, nil, nil, A2_161)
          end
          return
        end
      end
      L4_163 = A0_159.updateActionMenuWidget
      L4_163(A0_159, false, true)
    else
      L4_163 = A0_159.playSoundTargetDecided
      L4_163(A0_159)
      L4_163 = A0_159.updateActionMenuWidget
      L4_163(A0_159, false, true)
    end
  else
    L4_163 = A0_159.work
    L4_163 = L4_163.subTargetCursorIndex
    L4_163 = L4_163[1]
    if A1_160 == L4_163 then
      L4_163 = A0_159.work
      L4_163 = L4_163.subTargetMagicFlag
      if L4_163 == true then
        L4_163 = L3_162._getGear
        L4_163 = L4_163(L3_162)
        if L4_163 ~= 0 then
          L4_163 = A0_159.playSoundCommandError
          L4_163(A0_159)
          L4_163 = A0_159.printSystemMessage
          L4_163(A0_159, 30211)
          return
        end
      end
      L4_163 = A0_159.subTargetDecided
      L4_163(A0_159, A2_161)
    end
  end
end
L0_0._onTargetDecided = L1_1
L0_0 = DesktopWidget
function L1_1(A0_164)
  if A0_164.work.mode <= 1 then
    return
  end
  if worldMaster:_getMyPlayer():_getLockonTarget() ~= nil then
    worldMaster:_getMyPlayer():_setLockonTarget(nil)
  end
end
L0_0.cancelLockon = L1_1
L0_0 = DesktopWidget
function L1_1(A0_165, A1_166, A2_167, A3_168, A4_169, A5_170)
  local L6_171, L7_172, L8_173, L9_174
  L6_171 = A0_165.work
  L6_171 = L6_171.mode
  if L6_171 <= 1 then
    return
  end
  L7_172 = A0_165
  L6_171 = A0_165._getKeyboardFocusedWidget
  L6_171 = L6_171(L7_172)
  if L6_171 == nil then
    L7_172 = A3_168
    if L7_172 == "UILuaCommands.OpenUserMacro" then
    else
    end
    if L7_172 == "UILuaCommands.ShortCutAction" then
      return
    else
    end
  else
  end
  if A2_167 ~= "_widget" then
    return
  end
  L7_172 = worldMaster
  L8_173 = L7_172
  L7_172 = L7_172._getMyPlayer
  L7_172 = L7_172(L8_173)
  L8_173 = A3_168
  if L8_173 == "UILuaCommands.Cancel" then
    L9_174 = A0_165.isCutSceneMode
    L9_174 = L9_174(A0_165)
    if L9_174 == true then
      L9_174 = A0_165.getStaticWidget
      L9_174 = L9_174(A0_165, 12)
      if L9_174:getArgActor() ~= nil then
        if L9_174:isShow() == true then
          L9_174:skipDirect()
        else
          L9_174:show()
        end
      else
        A0_165:getStaticWidget(13):show()
        do break end
        else
        end
        if L8_173 == "RaptureCommands.Chat" then
          L9_174 = A0_165.getStaticWidget
          L9_174 = L9_174(A0_165, 2)
          if L9_174:isShow() == true and L9_174:getInputEnable() == true then
            A0_165:getStaticWidget(3):sendCommand("Log.FadeIn")
            A0_165:changeFocusedWidget(L9_174, false)
            L9_174:setKeyboardFocusToChatControl()
            if A4_169 == 191 then
              L9_174:appendStringForChatControl("/")
              do break end
              else
              end
              if L8_173 == "RaptureCommands.Chat2" then
                L9_174 = A0_165.getStaticWidget
                L9_174 = L9_174(A0_165, 2)
                if L9_174:isShow() == true and L9_174:getInputEnable() == true then
                  A0_165:getStaticWidget(3):sendCommand("Log.FadeIn")
                  L9_174:startChatInputForPadMode(A4_169)
                  do break end
                  else
                  end
                  if L8_173 == "UILuaCommands.SendTell" then
                    L9_174 = A0_165.getStaticWidget
                    L9_174 = L9_174(A0_165, 2)
                    if L9_174:isShow() == true and L9_174:getInputEnable() == true then
                      A0_165:changeFocusedWidget(L9_174, false)
                      L9_174:setKeyboardFocusToChatControl()
                      L9_174:setSendTellHistroyChatMode()
                      do break end
                      else
                      end
                      if L8_173 == "UILuaCommands.ReplayTell" then
                        L9_174 = A0_165.getStaticWidget
                        L9_174 = L9_174(A0_165, 2)
                        if L9_174:isShow() == true and L9_174:getInputEnable() == true then
                          A0_165:changeFocusedWidget(L9_174, false)
                          L9_174:setKeyboardFocusToChatControl()
                          L9_174:setReplayTellHistroyChatMode()
                          do break end
                          else
                          end
                          if L8_173 == "UILuaCommands.ChangeChatMode" then
                            L9_174 = A0_165.getStaticWidget
                            L9_174 = L9_174(A0_165, 2)
                            if L9_174:isShow() == true and L9_174:getInputEnable() == true then
                              A0_165:changeFocusedWidget(L9_174, false)
                              L9_174:setKeyboardFocusToChatControl()
                              L9_174:setChatMode(A4_169, nil, true)
                              do break end
                              else
                              end
                              if L8_173 == "UILuaCommands.CloseUserMacro" then
                                L9_174 = A0_165.getStaticWidget
                                L9_174 = L9_174(A0_165, 7)
                                if A0_165:getConfigFlag(41) == true then
                                else
                                  L9_174:hideUserMacro()
                                  if A0_165:isMainTargetDecided() == false then
                                    A0_165:updateActionMenuWidget(false, false, true)
                                    do break end
                                    else
                                    end
                                    if L8_173 == "UILuaCommands.ChangeCurrentLinkshell" then
                                      L9_174 = A0_165.getMainMenuModeWidget
                                      L9_174 = L9_174(A0_165, "LinkshellMembersListWidget")
                                      if L9_174 == nil then
                                        L9_174 = A0_165.getMainMenuModeWidget
                                        L9_174 = L9_174(A0_165, "LinkshellListSubWidget")
                                        if L9_174 == nil then
                                          L9_174 = A0_165.getMainMenuModeWidget
                                          L9_174 = L9_174(A0_165, "LinkshellMenuSubWidget")
                                        end
                                      elseif L9_174 ~= nil then
                                        return
                                      end
                                      L9_174 = desktopWidget
                                      L9_174 = L9_174.executePlayerSetCurrentLinkshellInOrder
                                      L9_174(L9_174)
                                      break
                                    else
                                    end
                                    if L8_173 == "UILuaCommands.SetCurrentLinkshell" then
                                      L9_174 = A0_165.getMainMenuModeWidget
                                      L9_174 = L9_174(A0_165, "LinkshellMembersListWidget")
                                      if L9_174 == nil then
                                        L9_174 = A0_165.getMainMenuModeWidget
                                        L9_174 = L9_174(A0_165, "LinkshellListSubWidget")
                                        if L9_174 == nil then
                                          L9_174 = A0_165.getMainMenuModeWidget
                                          L9_174 = L9_174(A0_165, "LinkshellMenuSubWidget")
                                        end
                                      elseif L9_174 ~= nil then
                                        return
                                      end
                                      if A4_169 ~= nil then
                                        L9_174 = L7_172.getCommunityGroup
                                        L9_174 = L9_174(L7_172, 20002, A4_169)
                                        if L9_174 ~= nil then
                                          A0_165:executePlayerSetCurrentLinkshell(L9_174)
                                        end
                                      else
                                        L9_174 = A0_165.executePlayerSetCurrentLinkshell
                                        L9_174(A0_165)
                                        break
                                      end
                                    else
                                    end
                                  else
                                  end
                                end
                            else
                            end
                        else
                        end
                    else
                    end
                else
                end
            else
            end
          else
          end
      end
    else
    end
  L8_173 = A0_165.work
  L8_173 = L8_173.lockUserControl
  if L8_173 then
    return
  end
  L8_173 = A0_165.work
  L8_173 = L8_173.tutorialFlag
  if L8_173 == true then
    L8_173 = A3_168
    if L8_173 == "UILuaCommands.MainMenu" then
    else
    end
    if L8_173 == "UILuaCommands.Function1" then
      L9_174 = A0_165.processCommandMainMenu
      L9_174(A0_165)
      break
    else
    end
    if L8_173 == "UILuaCommands.ChangeActivateMode" then
      L9_174 = A0_165.isTutorialLock
      L9_174 = L9_174(A0_165, 4)
      if L9_174 == false then
        L9_174 = A0_165.analyzeShortCutCommand
        L9_174(A0_165, A3_168, "")
        do break end
        else
        end
        if L8_173 == "UILuaCommands.ShortCutActionQuestLSMenu" then
          L9_174 = A0_165.openMainMenuRootWidget
          L9_174(A0_165, "NpcLinkshellListWidget")
          break
        else
        end
      else
      end
    return
  end
  L8_173 = A3_168
  if L8_173 == "UILuaCommands.TargetMyPlayer" then
    L9_174 = A0_165.setTargetCharacterForMyPlayer
    L9_174(A0_165, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.NearestPC" then
    L9_174 = A0_165._setTargetNearestCharacter
    L9_174(A0_165, 1)
    break
  else
  end
  if L8_173 == "UILuaCommands.NearestNPC" then
    L9_174 = A0_165._setTargetNearestCharacter
    L9_174(A0_165, 2)
    break
  else
  end
  if L8_173 == "UILuaCommands.NearestEnemy" then
    L9_174 = A0_165._setTargetNearestCharacter
    L9_174(A0_165, 3)
    break
  else
  end
  if L8_173 == "UILuaCommands.PartyTarget1" then
    L9_174 = A0_165.partyMemberTargetShortcut
    L9_174(A0_165, 1, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.PartyTarget2" then
    L9_174 = A0_165.partyMemberTargetShortcut
    L9_174(A0_165, 2, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.PartyTarget3" then
    L9_174 = A0_165.partyMemberTargetShortcut
    L9_174(A0_165, 3, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.PartyTarget4" then
    L9_174 = A0_165.partyMemberTargetShortcut
    L9_174(A0_165, 4, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.PartyTarget5" then
    L9_174 = A0_165.partyMemberTargetShortcut
    L9_174(A0_165, 5, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.PartyTarget6" then
    L9_174 = A0_165.partyMemberTargetShortcut
    L9_174(A0_165, 6, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.PartyTarget7" then
    L9_174 = A0_165.partyMemberTargetShortcut
    L9_174(A0_165, 7, true)
    break
  else
  end
  if L8_173 == "UILuaCommands.TargetLastAttacker" then
    L9_174 = A0_165._getLastAttacker
    L9_174 = L9_174(A0_165)
    if L9_174 ~= nil and A0_165:isValidTarget(L9_174) == true then
      A0_165:setCurrentTarget(L9_174)
      do break end
      else
      end
      if L8_173 == "UILuaCommands.PartyTargetPrev" then
        L9_174 = A0_165.changeTargetOnlyPartyMember
        L9_174(A0_165, false, true)
        break
      else
      end
      if L8_173 == "UILuaCommands.PartyTargetNext" then
        L9_174 = A0_165.changeTargetOnlyPartyMember
        L9_174(A0_165, true, true)
        break
      else
      end
      if L8_173 == "UILuaCommands.ChangeTargetCirclePrev" then
        L9_174 = A0_165.changeTargetMode
        L9_174(A0_165, false)
        break
      else
      end
      if L8_173 == "UILuaCommands.ChangeTargetCircleNext" then
        L9_174 = A0_165.changeTargetMode
        L9_174(A0_165, true)
        break
      else
      end
      if L8_173 == "UILuaCommands.FaceTarget" then
        L9_174 = A0_165.getCurrentTargetCharacter
        L9_174 = L9_174(A0_165)
        if L9_174 ~= nil and L9_174 ~= L7_172 then
          L7_172:_turn(L9_174)
        else
        end
      else
      end
    else
    end
  L9_174 = A0_165
  L8_173 = A0_165.isSubTargetSelectMode
  L8_173 = L8_173(L9_174)
  if L8_173 then
    return
  end
  L8_173 = A3_168
  if L8_173 == "UILuaCommands.MainMenu" then
  else
  end
  if L8_173 == "UILuaCommands.Function1" then
    L9_174 = A0_165.processCommandMainMenu
    L9_174(A0_165)
    break
  else
  end
  if L8_173 == "UILuaCommands.MapNavigation" then
    L9_174 = A0_165.processCommandMap
    L9_174(A0_165)
    break
  else
  end
  if L8_173 == "UILuaCommands.ChangeActivateMode" then
    L9_174 = A0_165.analyzeShortCutCommand
    L9_174(A0_165, A3_168, "")
    break
  else
  end
  if L8_173 == "UILuaCommands.ShortCutAction" then
    if A4_169 ~= nil then
      if A3_168 == "UILuaCommands.ShortCutAction" then
        L9_174 = A0_165.getMainTargetCharacter
        L9_174 = L9_174(A0_165)
        if L9_174 == nil then
          L9_174 = A0_165.setTargetCharacter
          L9_174(A0_165, 1, worldMaster:_getMyPlayer())
        end
      end
      L9_174 = A0_165.getStaticWidget
      L9_174 = L9_174(A0_165, 7)
      L9_174:sendCommand(A3_168, A4_169)
      do break end
      elseif L8_173 == "UILuaCommands.ActionBarSlotPrev" then
      else
      end
      if L8_173 == "UILuaCommands.ActionBarSlotNext" then
        L9_174 = A0_165.getStaticWidget
        L9_174 = L9_174(A0_165, 7)
        L9_174:sendCommand(A3_168)
        break
      elseif L8_173 == "UILuaCommands.Function2" then
      else
      end
      if L8_173 == "UILuaCommands.ConsoleTray" then
        L9_174 = A0_165.getStaticWidget
        L9_174 = L9_174(A0_165, 15)
        L9_174:setFocusable(true)
        A0_165:changeFocusedWidget(L9_174)
        break
      elseif L8_173 == "UILuaCommands.EmoteList" then
      else
      end
      if L8_173 == "UILuaCommands.UseItemList" then
        L9_174 = A0_165.getStaticWidget
        L9_174 = L9_174(A0_165, 1)
        L9_174 = L9_174.isShow
        L9_174 = L9_174(L9_174)
        if L9_174 == true then
        else
          L9_174 = A0_165.isWidgetExec
          L9_174 = L9_174(A0_165, 3)
          if L9_174 == true then
          else
            elseif L8_173 == "UILuaCommands.ActionMenu" then
            else
            end
            if L8_173 == "UILuaCommands.StatusEffect" then
              L9_174 = A0_165.analyzeShortCutCommand
              L9_174(A0_165, A3_168)
              break
            else
            end
            if L8_173 == "UILuaCommands.OpenUserMacro" then
              L9_174 = A0_165.getStaticWidget
              L9_174 = L9_174(A0_165, 7)
              if A0_165:getConfigFlag(41) == true and L9_174:isShowMacro(A4_169) == true then
                L9_174:hideUserMacro()
                if A0_165:isMainTargetDecided() == false then
                  A0_165:updateActionMenuWidget(false, false)
                end
              else
                A0_165.work.actionMenuFlag = A0_165:checkKeyboardFocused(L9_174)
                L9_174:showUserMacro(A4_169)
                A0_165:updateActionMenuWidget(false, true, true)
                A0_165:changeFocusedWidget(L9_174)
                do break end
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionStatusMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "StatusWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionEquipMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "EquipWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionActionMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "ActionSettingWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutBonusMenu" then
                  L9_174 = desktopWidget
                  L9_174 = L9_174.executePlayerBonusPointAssign
                  L9_174(L9_174)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionItemMenu" then
                  L9_174 = A0_165.setBazaarActor
                  L9_174(A0_165)
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "ItemListWidget", nil, true)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionJournalMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "Ask/JournalListWidget", nil, 1)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutAchievementMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "AchievementListWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutSearchMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "PcSearchWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionPartyMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "PartyRootWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionCommunicationMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "CommunityMenuWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionLinkshellMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "Ask/LinkshellListWidget", nil, 1)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionRetainerMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "RetainerListWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionQuestLSMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "NpcLinkshellListWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionTeleportMenu" then
                  L9_174 = A0_165.executePlayerTelepo
                  L9_174(A0_165, 0)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionReturnMenu" then
                  L9_174 = A0_165.executePlayerReturn
                  L9_174(A0_165)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionSupportMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "SupportDeskWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionConfigMenu" then
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "ConfigWidget")
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionLogoutMenu" then
                  L9_174 = A0_165.executePlayerLogout
                  L9_174(A0_165)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionLootMenu" then
                  L9_174 = A0_165.setBazaarActor
                  L9_174(A0_165)
                  L9_174 = A0_165.openMainMenuRootWidget
                  L9_174(A0_165, "ItemListWidget", nil, true, 3)
                  break
                elseif L8_173 == "UILuaCommands.ShortCutActionCheck" then
                elseif L8_173 == "UILuaCommands.ShortCutActionBazaar" then
                else
                end
                if L8_173 == "UILuaCommands.ShortCutActionCraft" then
                  L9_174 = A0_165.executeShortcutCommand
                  L9_174(A0_165, A3_168)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ChangeTargetCircleAll" then
                  L9_174 = A0_165.targetModeShortCut
                  L9_174(A0_165, 1)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ChangeTargetCirclePlayer" then
                  L9_174 = A0_165.targetModeShortCut
                  L9_174(A0_165, 2)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ChangeTargetCircleParty" then
                  L9_174 = A0_165.targetModeShortCut
                  L9_174(A0_165, 3)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ChangeTargetCircleEnemy" then
                  L9_174 = A0_165.targetModeShortCut
                  L9_174(A0_165, 4)
                  break
                else
                end
                if L8_173 == "UILuaCommands.CallChocobo" then
                  L9_174 = A0_165.executeCallChocobo
                  L9_174(A0_165)
                  break
                else
                end
                if L8_173 == "UILuaCommands.CallGoobbue" then
                  L9_174 = A0_165.executeCallGoobbue
                  L9_174(A0_165)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ChangeWidgetLock" then
                  L9_174 = A0_165.switchConfigParameter
                  L9_174(A0_165, 37, nil, 25332, 25333)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ChangePopupHelp" then
                  L9_174 = A0_165.switchConfigParameter
                  L9_174(A0_165, 33, nil, 25326, 25327)
                  break
                else
                end
                if L8_173 == "UILuaCommands.ChangePopupActionHelp" then
                  L9_174 = A0_165.switchConfigParameter
                  L9_174(A0_165, 71, nil, 25347, 25348)
                  break
                else
                end
              end
          end
        end
    else
    end
end
L0_0.processUICommandEvent = L1_1
L0_0 = DesktopWidget
function L1_1(A0_175, A1_176)
  if A0_175:isWidgetExec(3) == true then
    return
  end
  if A0_175:getStaticWidget(17):isShow() == true then
    return
  end
  if A1_176 == "UILuaCommands.ShortCutActionCheck" then
    if A0_175:isTargetOtherPlayer() == true then
      A0_175:executePlayerCheck()
      do break end
      else
      end
      if A1_176 == "UILuaCommands.ShortCutActionBazaar" then
        if A0_175:isTargetBazaar() == true then
          A0_175:executeBazaarCommand()
          do break end
          else
          end
          if A1_176 == "UILuaCommands.ShortCutActionCraft" and A0_175:executeCraftCommand() == false and A0_175:getGatherPlaceDrivenCommandID() ~= 0 then
            A0_175:executePlayerSystemCommand(24301)
            break
          else
          end
        else
        end
    else
    end
end
L0_0.executeShortcutCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_177)
  return A0_177:craftCommand(false)
end
L0_0.isExistCraftCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_178)
  return A0_178:craftCommand(true)
end
L0_0.executeCraftCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_179, A1_180)
  local L2_181, L3_182
  L2_181 = false
  L3_182 = worldMaster
  L3_182 = L3_182._getMyPlayer
  L3_182 = L3_182(L3_182)
  L3_182 = L3_182.getMainSkillCategory
  L3_182 = L3_182(L3_182)
  if L3_182 == 29 then
    if A1_180 == true then
      L3_182 = A0_179.cannotExecuteWithErrorMessage
      L3_182 = L3_182(A0_179)
      if L3_182 == true then
        L2_181 = false
      end
    else
      L3_182 = A0_179.getReadyCommand
      L3_182 = L3_182(A0_179, 3)
      if L3_182 ~= nil then
        if A1_180 == true then
          L2_181 = A0_179:executePlayerCommand(L3_182, nil, nil, nil, nil, worldMaster:_getMyPlayer())
        else
          L2_181 = true
        end
      end
    end
  end
  return L2_181
end
L0_0.craftCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_183)
  local L1_184, L2_185
  L2_185 = A0_183.getPlayerPlaceDrivenCommandVariation
  L2_185 = L2_185(A0_183)
  if L2_185 == 20001 then
  else
  end
  if L2_185 == 20005 then
    L1_184 = 39
    break
  elseif L2_185 == 20002 then
  else
  end
  if L2_185 == 20006 then
    L1_184 = 40
    break
  elseif L2_185 == 30003 then
  else
  end
  if L2_185 == 20007 then
    L1_184 = 41
    do break end
    break
  else
  end
  return L2_185
end
L0_0.getGatherPlaceDrivenCommandID = L1_1
L0_0 = DesktopWidget
function L1_1(A0_186, A1_187)
  local L2_188, L3_189
  L3_189 = A0_186.work
  L3_189 = L3_189.commandIndex
  L3_189 = L3_189[A1_187]
  if L3_189 ~= 0 and A0_186:getPlayerEquippedReadyCommand(L3_189) == true then
    L2_188 = A0_186:getPlayerEquippedReadyCommand(L3_189)
  end
  return L2_188
end
L0_0.getReadyCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_190)
  local L1_191
  L1_191 = false
  if A0_190:getItemPackageCount(5) > 0 then
    L1_191 = true
  end
  return L1_191
end
L0_0.isExistDropItemCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_192)
  A0_192:openMainMenuRootWidget("ItemListWidget", nil, true, 3)
end
L0_0.openDropItemWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_193)
  local L1_194, L2_195, L3_196, L4_197, L5_198, L6_199, L7_200
  L1_194 = worldMaster
  L2_195 = L1_194
  L1_194 = L1_194._getMyPlayer
  L1_194 = L1_194(L2_195)
  L3_196 = L1_194
  L2_195 = L1_194.getNpcLinkshellChatLinkshellLength
  L2_195 = L2_195(L3_196)
  L3_196 = -1
  for L7_200 = 1, L2_195 do
    if L1_194:hasNpcLinkshell(L7_200) == true then
      if L3_196 == -1 then
        L3_196 = 0
      end
      if L1_194:isNpcLinkshellChatCalling(L7_200) == true then
        L3_196 = 2
        break
      end
      if L1_194:isNpcLinkshellChatCalling(L7_200) == true then
        L3_196 = 1
      end
    end
  end
  return L3_196
end
L0_0.getLinkpearlStatus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_201, A1_202)
  local L2_203, L3_204
  L3_204 = A0_201
  L2_203 = A0_201.isSubTargetSelectMode
  L2_203 = L2_203(L3_204)
  if L2_203 == true then
    L3_204 = A0_201
    L2_203 = A0_201.changeTargetOnlyPartyMember
    L2_203(L3_204, A1_202, true)
    return
  end
  L2_203 = worldMaster
  L3_204 = L2_203
  L2_203 = L2_203._getMyPlayer
  L2_203 = L2_203(L3_204)
  L3_204 = L2_203._getLockonTarget
  L3_204 = L3_204(L2_203)
  if L3_204 ~= nil then
    return
  end
  L3_204 = A0_201.getConfigWork
  L3_204 = L3_204(A0_201, 13)
  if L3_204 ~= 1 then
    L3_204 = A0_201.changeTargetOnlyPartyMember
    L3_204(A0_201, A1_202)
    return
  end
  L3_204 = A0_201.work
  L3_204 = L3_204.targetMode
  for _FORV_7_ = 1, 4 do
    if A1_202 == true then
      if L3_204 >= 4 then
        L3_204 = 1
      else
        L3_204 = L3_204 + 1
      end
    elseif L3_204 <= 1 then
      L3_204 = 4
    else
      L3_204 = L3_204 - 1
    end
    if A0_201:isValidTargetMode(L3_204) == true then
      break
    end
  end
  A0_201:setTargetMode(L3_204)
end
L0_0.changeTargetMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_205, A1_206)
  local L2_207
  L2_207 = false
  if A1_206 == 2 then
  else
  end
  if A1_206 == 4 then
    L2_207 = true
    break
  else
  end
  if A1_206 == 1 then
    if A0_205:getConfigWork(13) ~= 1 then
      L2_207 = true
      do break end
      else
      end
      if A1_206 == 3 and A0_205:isJoinedPartyMyPlayer() == true then
        L2_207 = true
        break
      else
      end
    else
    end
  return L2_207
end
L0_0.isValidTargetMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_208, A1_209)
  if A0_208:getConfigWork(13) ~= 0 then
    return
  end
  if A0_208:isSubTargetSelectMode() == true then
    return
  end
  if worldMaster:_getMyPlayer():_getLockonTarget() ~= nil then
    return
  end
  if A0_208:isValidTargetMode(A1_209) == false then
    return
  end
  A0_208:setTargetMode(A1_209)
end
L0_0.targetModeShortCut = L1_1
L0_0 = DesktopWidget
function L1_1(A0_210, A1_211)
  local L2_212
  L2_212 = A0_210.work
  L2_212 = L2_212.targetMode
  if L2_212 == A1_211 then
    return
  end
  L2_212 = A0_210.work
  L2_212.targetMode = A1_211
  L2_212 = A0_210.getStaticWidget
  L2_212 = L2_212(A0_210, 18)
  L2_212 = L2_212.setMode
  L2_212(L2_212, A1_211)
  L2_212 = nil
  if A0_210:checkActor(A0_210.work.oldTarget[A1_211]) == nil then
    A0_210.work.oldTarget[A1_211] = nil
  end
  if A1_211 == 1 then
  else
  end
  if A1_211 == 2 then
    L2_212 = worldMaster:_getMyPlayer()
    break
  else
  end
  if A1_211 == 4 then
    L2_212 = A0_210:checkActor(A0_210.work.oldTarget[A1_211])
    if L2_212 ~= nil and A0_210:isInvalidEnmityTarget(L2_212) == true then
      L2_212 = nil
    end
    break
  else
  end
  if A1_211 == 3 then
    L2_212 = worldMaster:_getMyPlayer()
    do break end
    break
  else
  end
  A0_210.work.mainTargetCursorImage = 6
  A0_210:setMainTargetCursorStatus(false)
  if L2_212 ~= nil and A0_210:isValidTarget(L2_212) == false then
    L2_212 = nil
  end
  if L2_212 ~= nil then
    A0_210:setTargetCharacter(1, L2_212)
  else
    A0_210:_setTargetCharacter(1, nil)
    A0_210:sendDesktopCommand("RaptureCommands.ChangeTargetNext")
  end
end
L0_0.setTargetMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_213)
  if A0_213:isTutorialMainMenuMask() == true then
    return
  end
  if A0_213:isWidgetExec(3) == true then
    return
  end
  if A0_213:isSubTargetSelectMode() then
    return
  end
  if A0_213:getStaticWidget(1):isShow() == false then
    if A0_213.work.widgetEnableFlag[3] == false then
      return
    end
    A0_213:getStaticWidget(1):show()
  else
    A0_213:getStaticWidget(1):hide()
  end
end
L0_0.processCommandMainMenu = L1_1
L0_0 = DesktopWidget
function L1_1(A0_214, A1_215, A2_216)
  local L3_217, L4_218
  if A1_215 == "UILuaCommands.ChangeActivateMode" then
    L4_218 = A0_214
    L3_217 = A0_214.isRiding
    L3_217 = L3_217(L4_218)
    if L3_217 == true then
      L4_218 = A0_214
      L3_217 = A0_214.executePlayerCommand
      L3_217(L4_218, 12015)
      L3_217 = true
      return L3_217
    end
    L3_217 = false
    L4_218 = nil
    if worldMaster:_getMyPlayer():isActiveMode() == true then
      L3_217, L4_218 = A0_214:executePlayerActivation(false)
    else
      L3_217, L4_218 = A0_214:executePlayerActivation(true)
    end
    return L3_217
  elseif A1_215 == "UILuaCommands.ActionMenu" then
    L4_218 = A0_214
    L3_217 = A0_214.updateActionMenuWidget
    L3_217(L4_218, false, true)
  elseif A1_215 == "UILuaCommands.EmoteList" then
    L4_218 = A0_214
    L3_217 = A0_214.getStaticWidget
    L3_217 = L3_217(L4_218, 15)
    L4_218 = L3_217.openEmoteList
    return L4_218(L3_217)
  elseif A1_215 == "UILuaCommands.UseItemList" then
    L4_218 = A0_214
    L3_217 = A0_214.getStaticWidget
    L3_217 = L3_217(L4_218, 15)
    L4_218 = L3_217.openUseItemList
    return L4_218(L3_217)
  elseif A1_215 == "UILuaCommands.StatusEffect" then
    L4_218 = A0_214
    L3_217 = A0_214.getStaticWidget
    L3_217 = L3_217(L4_218, 16)
    L4_218 = A0_214.changeFocusedWidget
    return L4_218(A0_214, L3_217, false)
  end
  L3_217 = false
  return L3_217
end
L0_0.analyzeShortCutCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_219, A1_220, A2_221, A3_222, A4_223, A5_224)
  local L6_225, L7_226, L8_227
  do break end
  do return end
  do break end
  do return end
  if A1_220 == nil then
    return
  end
  L7_226 = A0_219
  L6_225 = A0_219.getCurrentTargetCharacter
  L6_225 = L6_225(L7_226)
  if A1_220 == L6_225 then
    L8_227 = A0_219
    L7_226 = A0_219.getStaticWidget
    L7_226 = L7_226(L8_227, 5)
    L8_227 = A3_222
    if L8_227 == "status" then
      L7_226:updateStatus()
      break
    else
    end
    if L8_227 == "stateAtQuicklyForAll" then
      L7_226:updateHp()
      break
    else
    end
    if L8_227 == "stateForAll" then
      L7_226:updateRank()
      break
    else
    end
    if L8_227 == "bazaar" then
      A0_219:updateMainMenuWidget()
      break
    else
    end
    if L8_227 == "property" and not A1_220:isPropertyEnabled(1) then
      worldMaster:_getMyPlayer():_setLockonTarget(nil)
      A0_219:cancelAllTarget()
      break
    else
    end
  else
  end
  L8_227 = A0_219
  L7_226 = A0_219.isJoinedPartyMyPlayer
  L7_226 = L7_226(L8_227)
  if L7_226 then
    L8_227 = A0_219
    L7_226 = A0_219.getStaticWidget
    L7_226 = L7_226(L8_227, 6)
    L8_227 = A0_219.isJoinedCharacterAtMyParty
    L8_227 = L8_227(A0_219, A1_220)
    if L8_227 > 0 then
      if A3_222 == "status" then
        L7_226:updateStatus(L8_227)
        break
      else
      end
      if A3_222 == "stateAtQuicklyForAll" then
        L7_226:updateHp(L8_227)
        L7_226:updateMp(L8_227)
        L7_226:updateTp(L8_227)
        break
      elseif A3_222 == "commandDetailForSelf" then
      else
      end
      if A3_222 == "commandDetailForAll" then
        L7_226:updateStackedCombination(L8_227)
        break
      else
      end
      if A3_222 == "exp" then
        L7_226:updateAll(L8_227)
      else
      end
    else
    end
  else
  end
  L8_227 = A1_220
  L7_226 = A1_220.isPlayer
  L7_226 = L7_226(L8_227)
  if L7_226 then
    L8_227 = A1_220
    L7_226 = A1_220.isMyPlayer
    L7_226 = L7_226(L8_227)
    if L7_226 then
      L7_226 = A3_222
      if L7_226 == "command" then
      else
      end
      if L7_226 == "commandEquip" then
        L8_227 = A0_219.updateActionMenuWidget
        L8_227(A0_219, true)
        L8_227 = A0_219.updateMainMenuWidget
        L8_227(A0_219)
        L8_227 = A0_219.getWidget
        L8_227 = L8_227(A0_219, 3, "ActionSettingWidget")
        if L8_227 ~= nil then
          L8_227:update()
        else
        end
      else
        if L7_226 == "commandDetailForAll" then
          break
        else
        end
        if L7_226 == "commandDetailForSelf" then
          L8_227 = A0_219.updateActionMenuWidget
          L8_227(A0_219, false)
          break
        else
        end
        if L7_226 == "castState" then
          L8_227 = A0_219.getStaticWidget
          L8_227 = L8_227(A0_219, 7)
          L8_227 = L8_227.updateCastInfo
          L8_227(L8_227)
          break
        else
        end
        if L7_226 == "status" then
          L8_227 = A0_219.getStaticWidget
          L8_227 = L8_227(A0_219, 16)
          L8_227:update()
          A0_219:updateActionMenuWidget(false)
          if A0_219:getWidget(4, "CraftStartWidget") ~= nil then
            A0_219:getWidget(4, "CraftStartWidget"):updateBuffInfo()
          end
          if A0_219:getWidget(4, "CraftRepairWidget") ~= nil then
            A0_219:getWidget(4, "CraftRepairWidget"):updateBuffInfo()
            do break end
            else
            end
            if L7_226 == "stateAtQuicklyForAll" then
              L8_227 = A0_219.getStaticWidget
              L8_227 = L8_227(A0_219, 4)
              L8_227:updateHp()
              L8_227:updateMp()
              L8_227:updateTp()
              A0_219:updateActionMenuWidget(false)
              if A0_219:getWidget(3, "StatusWidget") ~= nil then
                A0_219:getWidget(3, "StatusWidget"):update(A3_222)
              end
              if A0_219:getWidget(3, "EquipWidget") ~= nil then
                A0_219:getWidget(3, "EquipWidget"):update(A3_222)
                do break end
                else
                end
                if L7_226 == "stateAtQuicklyForSelf" then
                  L8_227 = A0_219.getStaticWidget
                  L8_227 = L8_227(A0_219, 4)
                  L8_227 = L8_227.updateTp
                  L8_227(L8_227)
                  L8_227 = A0_219.getStaticChildWidget
                  L8_227 = L8_227(A0_219, 4, "PlayerProfileWidget")
                  L8_227 = L8_227.update
                  L8_227(L8_227)
                  break
                else
                end
                if L7_226 == "battleStateForSelf" then
                  L8_227 = A0_219.getStaticChildWidget
                  L8_227 = L8_227(A0_219, 4, "PlayerProfileWidget")
                  L8_227 = L8_227.update
                  L8_227(L8_227)
                  L8_227 = A0_219.getWidget
                  L8_227 = L8_227(A0_219, 3, "StatusWidget")
                  if L8_227 ~= nil then
                    L8_227:update(A3_222)
                  end
                  if A0_219:getWidget(3, "EquipWidget") ~= nil then
                    A0_219:getWidget(3, "EquipWidget"):update(A3_222)
                    do break end
                    else
                    end
                    if L7_226 == "exp" then
                      L8_227 = A0_219.getStaticWidget
                      L8_227 = L8_227(A0_219, 4)
                      L8_227:updateAll()
                      if A0_219:getWidget(3, "StatusWidget") ~= nil then
                        A0_219:getWidget(3, "StatusWidget"):update(A3_222)
                      end
                      if A0_219:getWidget(3, "EquipWidget") ~= nil then
                        A0_219:getWidget(3, "EquipWidget"):update(A3_222)
                      end
                      if A0_219:getWidget(3, "ItemListWidget") ~= nil then
                        A0_219:getWidget(3, "ItemListWidget"):update(A3_222)
                      end
                      A0_219:updateMainMenuWidget()
                      if A0_219:getWidget(3, "PcMatchingEditWidget") ~= nil then
                        A0_219:getWidget(3, "PcMatchingEditWidget"):update()
                      end
                      if A0_219:getWidget(3, "PcMatchingFindWidget") ~= nil then
                        A0_219:getWidget(3, "PcMatchingFindWidget"):update()
                      end
                      if A0_219:getWidget(3, "ActionSettingWidget") ~= nil then
                        A0_219:getWidget(3, "ActionSettingWidget"):update()
                      end
                      if A0_219:getWidget(3, "PcSearchWidget") ~= nil then
                        A0_219:getWidget(3, "PcSearchWidget"):update(A3_222)
                        do break end
                        else
                        end
                        if L7_226 == "bazaar" then
                          L8_227 = A0_219.updateMainMenuWidget
                          L8_227(A0_219)
                          break
                        elseif L7_226 == "battleParameter" then
                        else
                        end
                        if L7_226 == "gameParameter" then
                          L8_227 = A0_219.getWidget
                          L8_227 = L8_227(A0_219, 3, "StatusWidget")
                          if L8_227 ~= nil then
                            L8_227:update(A3_222)
                          end
                          if A0_219:getWidget(3, "EquipWidget") ~= nil then
                            A0_219:getWidget(3, "EquipWidget"):update(A3_222)
                          end
                          A0_219:updateMainMenuWidget()
                          break
                        else
                        end
                        if L7_226 == "achieveAetheryte" then
                          L8_227 = A0_219.getWidget
                          L8_227 = L8_227(A0_219, 3, "MapNavigationWidget")
                          if L8_227 ~= nil then
                            L8_227:updateAetheryteList()
                            do break end
                            else
                            end
                            if L7_226 == "linkshellIcon" then
                              L8_227 = A0_219.getStaticWidget
                              L8_227 = L8_227(A0_219, 2)
                              L8_227 = L8_227.updateTitle
                              L8_227(L8_227)
                              L8_227 = A0_219.getWidgetByName
                              L8_227 = L8_227(A0_219, A0_219, "Ask/LinkshellListWidget")
                              if L8_227 ~= nil then
                                L8_227:update()
                                do break end
                                elseif L7_226 == "journal" then
                                else
                                end
                                if L7_226 == "guildleve" then
                                  L8_227 = A0_219.getWidget
                                  L8_227 = L8_227(A0_219, 3, "Ask/JournalListWidget")
                                  if L8_227 ~= nil then
                                    L8_227:updateList(true)
                                  end
                                else
                                end
                              else
                              end
                          else
                          end
                      else
                      end
                  else
                  end
              else
              end
          else
          end
      end
    else
    end
  else
  end
end
L0_0.processCharacterParameterUpdated = L1_1
L0_0 = DesktopWidget
function L1_1(A0_228, A1_229, A2_230, A3_231, A4_232)
  local L5_233, L6_234, L7_235, L8_236, L9_237, L10_238
  if nil == true then
    return
  end
  if nil == true then
    return
  end
  if A1_229 == nil then
    return
  end
  L6_234 = A0_228
  L5_233 = A0_228.getCurrentTargetCharacter
  L5_233 = L5_233(L6_234)
  if A1_229 == L5_233 then
    L7_235 = A0_228
    L6_234 = A0_228.getStaticWidget
    L8_236 = 5
    L6_234 = L6_234(L7_235, L8_236)
    L7_235 = L6_234
    L6_234 = L6_234.updateStatus
    L6_234(L7_235)
  end
  L7_235 = A0_228
  L6_234 = A0_228.isJoinedPartyMyPlayer
  L6_234 = L6_234(L7_235)
  if L6_234 == true then
    L7_235 = A0_228
    L6_234 = A0_228.isJoinedCharacterAtMyParty
    L8_236 = A1_229
    L6_234 = L6_234(L7_235, L8_236)
    if L6_234 > 0 then
      L8_236 = A0_228
      L7_235 = A0_228.getStaticWidget
      L9_237 = 6
      L7_235 = L7_235(L8_236, L9_237)
      L8_236 = L7_235
      L7_235 = L7_235.updateStatus
      L9_237 = L6_234
      L7_235(L8_236, L9_237)
    end
  end
  L7_235 = A1_229
  L6_234 = A1_229.isPlayer
  L6_234 = L6_234(L7_235)
  if L6_234 == true then
    L7_235 = A1_229
    L6_234 = A1_229.isMyPlayer
    L6_234 = L6_234(L7_235)
    if L6_234 == true then
      L7_235 = A0_228
      L6_234 = A0_228.getStaticWidget
      L8_236 = 6
      L6_234 = L6_234(L7_235, L8_236)
      L8_236 = A0_228
      L7_235 = A0_228.getPartyBuffID
      L9_237 = A3_231
      L7_235 = L7_235(L8_236, L9_237)
      if L7_235 ~= nil then
        L9_237 = L6_234
        L8_236 = L6_234.updatePartyBuff
        L10_238 = L7_235
        L8_236 = L8_236(L9_237, L10_238)
        L10_238 = A0_228
        L9_237 = A0_228.getStaticWidget
        L9_237 = L9_237(L10_238, 20)
        L10_238 = L9_237.isShow
        L10_238 = L10_238(L9_237)
        if L10_238 == true then
          L10_238 = false
          if L7_235 == 223194 then
            L10_238 = true
          end
          L9_237:startEffect(L10_238)
        end
        L10_238 = A0_228.work
        L10_238 = L10_238.mode
        if L10_238 == 8 and L8_236 ~= 223194 then
          L10_238 = A0_228.executeEffect
          L10_238(A0_228, 2130706533)
        end
      else
        L9_237 = A0_228
        L8_236 = A0_228.getPartyBuffID
        L10_238 = A4_232
        L8_236 = L8_236(L9_237, L10_238)
        if L8_236 ~= nil then
          L9_237 = L6_234
          L8_236 = L6_234.updatePartyBuff
          L10_238 = nil
          L8_236(L9_237, L10_238)
        end
      end
      L9_237 = A0_228
      L8_236 = A0_228.getStaticWidget
      L10_238 = 16
      L8_236 = L8_236(L9_237, L10_238)
      L9_237 = L8_236
      L8_236 = L8_236.update
      L8_236(L9_237)
      L9_237 = A0_228
      L8_236 = A0_228.getWidget
      L10_238 = 4
      L8_236 = L8_236(L9_237, L10_238, "CraftStartWidget")
      if L8_236 ~= nil then
        L10_238 = L8_236
        L9_237 = L8_236.updateBuffInfo
        L9_237(L10_238)
      end
      L10_238 = A0_228
      L9_237 = A0_228.getWidget
      L9_237 = L9_237(L10_238, 4, "CraftRepairWidget")
      if L9_237 ~= nil then
        L10_238 = L9_237.updateBuffInfo
        L10_238(L9_237)
      end
    end
  end
end
L0_0.processChangeSubStatStatus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_239, A1_240)
  if A1_240 ~= nil and (A1_240:getStatusId() == 223193 or A1_240:getStatusId() == 223194) then
    return (A1_240:getStatusId())
  end
  return nil
end
L0_0.getPartyBuffID = L1_1
L0_0 = DesktopWidget
function L1_1(A0_241, A1_242, A2_243, A3_244)
  local L4_245, L5_246, L6_247, L7_248
  do break end
  do return end
  do break end
  do return end
  if A1_242 == nil then
    return
  end
  L4_245 = worldMaster
  L5_246 = L4_245
  L4_245 = L4_245._getMyPlayer
  L4_245 = L4_245(L5_246)
  L6_247 = A0_241
  L5_246 = A0_241.getCurrentTargetCharacter
  L5_246 = L5_246(L6_247)
  L7_248 = L4_245
  L6_247 = L4_245._getLockonTarget
  L6_247 = L6_247(L7_248)
  L7_248 = A0_241._getCurrentTargetCursor
  L7_248 = L7_248(A0_241)
  if A1_242:isPlayer() then
    if A1_242:isMyPlayer() then
      if A1_242:isDead() then
        L4_245:_setLockonTarget(nil)
        A0_241:cancelSubTargetSelect()
        A0_241:setTargetCharacter(1, nil)
        A0_241:updateActionMenuWidget(false, false)
        A0_241:getStaticChildWidget(7, "ActionGaugeWidget"):stopCastGauge()
        if A0_241:_getCurrentAreaMaster():isInstanceRaid() == false then
          worldMaster:notify(worldMaster, 25005)
        end
      else
        if A2_243 == 2 then
          A0_241:requestAutoLockonTarget()
        end
        A0_241:updateActionMenuWidget(false)
      end
      if A0_241:getStaticChildWidget(15, "EmoteListWidget") ~= nil then
        A0_241:getStaticChildWidget(15, "EmoteListWidget"):update()
      end
      A0_241:updateMainMenuWidget()
    elseif L5_246 == A1_242 then
      A0_241:updateActionMenuWidget(false)
    end
  elseif L5_246 == A1_242 then
    if L5_246:isDead() then
      if L6_247 == nil or L6_247 == A1_242 then
        if L6_247 ~= nil then
          L4_245:_setLockonTarget(nil)
        end
        A0_241:setTargetCharacter(L7_248, nil)
        A0_241:updateActionMenuWidget(false, false)
        A0_241:playSoundTargetCanceled()
      else
        A0_241:setTargetCharacter(L7_248, L6_247)
        A0_241:updateActionMenuWidget(false)
      end
    else
      A0_241:updateActionMenuWidget(false)
    end
  end
end
L0_0.processCharacterActorMainStatUpdated = L1_1
L0_0 = DesktopWidget
function L1_1(A0_249, A1_250, A2_251, A3_252, A4_253)
end
L0_0.processCharacterActorNetStatSystemUpdated = L1_1
L0_0 = DesktopWidget
function L1_1(A0_254, A1_255, A2_256, A3_257, A4_258)
  if A0_254:getWidget(3, "PcSearchWidget") ~= nil then
    A0_254:getWidget(3, "PcSearchWidget"):processCharacterActorNetStatUserUpdated(A1_255, A2_256, A3_257, A4_258)
  end
end
L0_0.processCharacterActorNetStatUserUpdated = L1_1
L0_0 = DesktopWidget
function L1_1(A0_259, A1_260, A2_261, A3_262)
  local L4_263, L5_264, L6_265, L7_266, L8_267
  do break end
  do return end
  L4_263 = A2_261
  if L4_263 == 10001 then
    L6_265 = A0_259
    L5_264 = A0_259.updateActionMenuWidget
    L7_266 = false
    L5_264(L6_265, L7_266)
    L6_265 = A0_259
    L5_264 = A0_259.getStaticWidget
    L7_266 = 6
    L5_264 = L5_264(L6_265, L7_266)
    L7_266 = A0_259
    L6_265 = A0_259.getWidget
    L8_267 = 3
    L6_265 = L6_265(L7_266, L8_267, "PartyManagerWidget")
    L8_267 = A0_259
    L7_266 = A0_259.getWidget
    L7_266 = L7_266(L8_267, 3, "PartyManagerSubWidget")
    L8_267 = 0
    if A3_262:_countMember() > 1 then
      L8_267 = A0_259:isJoinedCharacterAtMyParty(A1_260)
      L5_264:show()
      if L6_265 ~= nil then
        L6_265:update(A1_260, A3_262)
      end
      if L7_266 ~= nil then
        L7_266:update()
      end
    else
      L5_264:hide()
      if L6_265 ~= nil then
        L6_265:update(A1_260, A3_262)
      end
      if L7_266 ~= nil then
        L7_266:update()
      end
      if A0_259:getStaticWidget(2):getChatMode() == 4 then
        A0_259:getStaticWidget(2):setChatMode(1)
      end
      if A0_259.work.targetMode == 3 then
        A0_259:setTargetMode(A0_259:getDefaultTargetMode())
      end
    end
    L5_264:updateAll(A1_260, A3_262)
    if A0_259:getWidget(3, "ItemShareWidget") ~= nil then
      A0_259:getWidget(3, "ItemShareWidget"):update(L8_267)
    end
    if A0_259:getWidget(3, "PartyRootWidget") ~= nil then
      A0_259:getWidget(3, "PartyRootWidget"):update(L8_267)
    end
    if A0_259:getWidget(3, "AddressListWidget") ~= nil then
      A0_259:getWidget(3, "AddressListWidget"):update(L8_267)
    end
    if A0_259:getWidget(3, "LinkshellMenuSubWidget") ~= nil then
      A0_259:getWidget(3, "LinkshellMenuSubWidget"):updateVariation()
      do break end
      else
      end
      if L4_263 == 50001 then
        L6_265 = A0_259
        L5_264 = A0_259.updateActionMenuWidget
        L7_266 = false
        L5_264(L6_265, L7_266)
        break
      else
      end
      if L4_263 == 80001 then
        L6_265 = A0_259
        L5_264 = A0_259.getWidget
        L7_266 = 3
        L8_267 = "RetainerListWidget"
        L5_264 = L5_264(L6_265, L7_266, L8_267)
        if L5_264 ~= nil then
          L7_266 = L5_264
          L6_265 = L5_264.updateRetainerData
          L6_265(L7_266)
        end
      else
      end
    else
    end
end
L0_0.processUpdateGroupInformation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_268, A1_269, A2_270, A3_271)
  if A2_270 == 20002 then
    A0_268:processUpdateCurrentCommunityGroup(A3_271, 1)
    do break end
    break
  else
  end
end
L0_0.processUpdateCommunityGroupCurrent = L1_1
L0_0 = DesktopWidget
function L1_1(A0_272, A1_273, A2_274, A3_275)
  do break end
  do return end
  A0_272:updateBazaarListWidget(A1_273, A2_274, A3_275)
  A0_272:updateMateriaAttachContractWidget(A1_273, A2_274, A3_275)
  A0_272:updateRetainerListWidget("RetainerTradeWidget", A1_273, A2_274, A3_275)
  A0_272:updateRetainerListWidget("Ask/RetainerItemListWidget", A1_273, A2_274, A3_275)
  if A0_272:getWidget(3, "PcProfileWidget") ~= nil then
    for _FORV_9_ = 1, #A3_275 do
      A0_272:getWidget(3, "PcProfileWidget"):processUpdateItemInformation(A1_273, A2_274, A3_275[_FORV_9_])
    end
  end
  if A0_272:getWidget(3, "RepairEquipmentWidget") ~= nil then
    for _FORV_10_ = 1, #A3_275 do
      A0_272:getWidget(3, "RepairEquipmentWidget"):processUpdateItemInformation(A1_273, A2_274, A3_275[_FORV_10_])
    end
  end
  if A1_273 ~= worldMaster:_getMyPlayer() then
    return
  end
  A0_272:updateItemInfoEventModeWidget("TradeWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/ShopBuyWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/ShopSellWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("CraftStartWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("CraftRepairWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/RewardSelectWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/EventItemSelectWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/ItemStoragePutWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/ItemStorageGetWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/GrandCompanyShopWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/QuestDeliveryWidget", A2_274, A3_275)
  A0_272:updateItemInfoEventModeWidget("Ask/MateriaRemoveWidget", A2_274, A3_275)
  A0_272:updateMainMenuModeWidget("ItemListWidget", A2_274, A3_275)
  A0_272:updateMainMenuModeWidget("ItemSelectWidget", A2_274, A3_275)
  A0_272:updateItemUseWidget(A2_274, A3_275)
  A0_272:updateMainMenuModeWidget("EquipWidget", A2_274, A3_275)
  if A0_272:getWidget(3, "StatusWidget") ~= nil then
    A0_272:getWidget(3, "StatusWidget"):updateMoneyList(A2_274)
  end
  A0_272:updateMainMenuWidget()
end
L0_0.processUpdateItemInformation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_276, A1_277)
  do break end
  do return end
  A0_276:updateItemWorkWidget(3, "ItemListWidget", A1_277)
  A0_276:updateItemWorkWidget(3, "ItemSelectWidget", A1_277)
  A0_276:updateItemWorkWidget(3, "EquipWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "BazaarListWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "ItemSelectWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "CraftEditWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "TradeEditWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "Ask/ShopSellWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "Ask/RetainerItemListWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "RetainerTradeWidget", A1_277)
  A0_276:updateItemWorkWidget(4, "Ask/ItemStoragePutWidget", A1_277)
end
L0_0.processUpdateItemWork = L1_1
L0_0 = DesktopWidget
function L1_1(A0_278)
  do break end
  do return end
  A0_278:updateMainMenuWidget()
end
L0_0.processUpdateMyPlayerRestrictionByContents = L1_1
L0_0 = DesktopWidget
function L1_1(A0_279, A1_280, A2_281, A3_282)
  if A0_279:getWidget(A1_280, A2_281) == nil then
    return
  end
  A0_279:getWidget(A1_280, A2_281):syncItemWork(A3_282)
end
L0_0.updateItemWorkWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_283, A1_284, A2_285, A3_286)
  local L4_287
  L4_287 = A0_283.getWidget
  L4_287 = L4_287(A0_283, 4, A1_284)
  if L4_287 == nil then
    return
  end
  A0_283:updatePlayerItem(L4_287, A2_285, A3_286)
end
L0_0.updateItemInfoEventModeWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_288, A1_289, A2_290, A3_291)
  local L4_292
  L4_292 = A0_288.getWidget
  L4_292 = L4_292(A0_288, 4, "BazaarListWidget")
  if L4_292 == nil then
    return
  end
  A0_288:updateActorWidget(A0_288:getBazaarActor(), L4_292, A1_289, A2_290, A3_291)
end
L0_0.updateBazaarListWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_293, A1_294, A2_295, A3_296)
  if A0_293:getWidget(3, "Ask/MateriaAttachAskWidget") ~= nil then
    A0_293:getWidget(3, "Ask/MateriaAttachAskWidget"):updateItemList(A1_294, A2_295, A3_296)
  end
end
L0_0.updateMateriaAttachContractWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_297, A1_298, A2_299, A3_300, A4_301)
  local L5_302
  L5_302 = A0_297.getWidget
  L5_302 = L5_302(A0_297, 4, A1_298)
  if L5_302 == nil then
    return
  end
  A0_297:updateActorWidget(A0_297:getRetainer(), L5_302, A2_299, A3_300, A4_301)
end
L0_0.updateRetainerListWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_303, A1_304, A2_305, A3_306, A4_307, A5_308)
  if A1_304 == nil then
    return
  end
  if A1_304 == A3_306 then
    A2_305:updateItemList(0, #A5_308)
    for _FORV_9_ = 1, #A5_308 do
      A2_305:updateItemList(A4_307, A5_308[_FORV_9_])
    end
  elseif worldMaster:_getMyPlayer() == A3_306 then
    A0_303:updatePlayerItem(A2_305, A4_307, A5_308)
  end
end
L0_0.updateActorWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_309, A1_310, A2_311, A3_312)
  local L4_313
  L4_313 = A0_309.getWidget
  L4_313 = L4_313(A0_309, 3, A1_310)
  if L4_313 == nil then
    return
  end
  A0_309:updatePlayerItem(L4_313, A2_311, A3_312)
end
L0_0.updateMainMenuModeWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_314, A1_315, A2_316)
  local L3_317
  L3_317 = A0_314.getStaticChildWidget
  L3_317 = L3_317(A0_314, 15, "ItemUseWidget")
  if L3_317 == nil then
    return
  end
  if A0_314:isSubTargetSelectMode() == true and A0_314:checkActor(A0_314.work.subTargetExecuteWidget) ~= nil and A0_314.work.subTargetExecuteWidget == L3_317 then
    A0_314:cancelSubTargetSelect()
  end
  A0_314:updatePlayerItem(L3_317, A1_315, A2_316)
end
L0_0.updateItemUseWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_318, A1_319, A2_320, A3_321)
  A1_319:updatePlayerItem(0, #A3_321)
  for _FORV_7_ = 1, #A3_321 do
    A1_319:updatePlayerItem(A2_320, A3_321[_FORV_7_])
  end
end
L0_0.updatePlayerItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_322, A1_323, A2_324, A3_325, ...)
  local L5_327, L6_328, L7_329, L8_330, L9_331
  do break end
  do return end
  L6_328 = A0_322
  L5_327 = A0_322.openPublicInformDialogWidget
  L7_329 = A1_323
  L8_330 = A3_325
  L9_331 = ...
  return L5_327(L6_328, L7_329, L8_330, L9_331)
end
L0_0.processUpdatePublicInformationDialog = L1_1
L0_0 = DesktopWidget
function L1_1(A0_332, A1_333, A2_334, A3_335, A4_336, ...)
  local L6_338, L7_339, L8_340, L9_341, L10_342, L11_343, L12_344
  do break end
  do return end
  L6_338 = A1_333
  if L6_338 == 10 then
    L8_340 = A0_332
    L7_339 = A0_332.openPublicInformLongDialogWidget
    L9_341 = A2_334
    L10_342 = A4_336
    L12_344 = ...
    L7_339(L8_340, L9_341, L10_342, L11_343, L12_344, ...)
    break
  else
  end
  if L6_338 == 1 then
    L8_340 = A0_332
    L7_339 = A0_332.openCautionInformDialogWidget
    L9_341 = A2_334
    L10_342 = A4_336
    L12_344 = ...
    L7_339(L8_340, L9_341, L10_342, L11_343, L12_344, ...)
    break
  else
  end
  if L6_338 == 3 then
    L8_340 = A0_332
    L7_339 = A0_332.openPublicEffectWidget
    L9_341 = A4_336
    L7_339(L8_340, L9_341)
    break
  else
  end
  if L6_338 == 2 then
    L8_340 = A0_332
    L7_339 = A0_332.openTutorialSuccessWidget
    L9_341 = A4_336
    L10_342 = true
    L7_339(L8_340, L9_341, L10_342)
    break
  else
  end
  if L6_338 == 4 then
    L7_339 = select
    L8_340 = 1
    L12_344 = ...
    L7_339 = L7_339(L8_340, L9_341, L10_342, L11_343, L12_344, ...)
    L9_341 = A0_332
    L8_340 = A0_332.openTutorialWidget
    L10_342 = A4_336
    L11_343 = L7_339
    L8_340(L9_341, L10_342, L11_343)
    break
  else
  end
  if L6_338 == 5 then
    L8_340 = A0_332
    L7_339 = A0_332.closeTutorialWidget
    L7_339(L8_340)
    break
  else
  end
  if L6_338 == 7 then
    L7_339 = desktopWidget
    L8_340 = L7_339
    L7_339 = L7_339.isTutorialMode
    L7_339 = L7_339(L8_340)
    if L7_339 == true then
      L8_340 = A0_332
      L7_339 = A0_332.closeTutorialWidget
      L7_339(L8_340)
      L8_340 = A0_332
      L7_339 = A0_332.cancelTutorialMode
      L7_339(L8_340)
      do break end
      else
      end
      if L6_338 == 8 then
        L8_340 = A0_332
        L7_339 = A0_332.closeRaidDungeonExecutionWidget
        L7_339(L8_340)
        break
      else
      end
      if L6_338 == 9 then
        L8_340 = A0_332
        L7_339 = A0_332.isTutorialMode
        L7_339 = L7_339(L8_340)
        if L7_339 == false then
          L8_340 = A0_332
          L7_339 = A0_332.orderTutorialMode
          L7_339(L8_340)
        end
        L7_339 = false
        L8_340 = false
        L9_341 = false
        L10_342 = true
        L11_343 = true
        L12_344 = 3
        desktopWidget:setTutorialMask(L7_339, L8_340, L9_341, L10_342, L11_343, L12_344)
        break
      else
      end
    else
    end
end
L0_0.processUpdateGeneralNotificationDialog = L1_1
L0_0 = DesktopWidget
function L1_1(A0_345, A1_346, A2_347, A3_348)
  local L4_349, L5_350, L6_351
  L5_350 = A0_345
  L4_349 = A0_345.checkActor
  L6_351 = A1_346
  L4_349 = L4_349(L5_350, L6_351)
  if L4_349 == nil then
    return
  end
  L5_350 = A1_346
  L4_349 = A1_346.getKindContentsInformation
  L4_349 = L4_349(L5_350)
  if L4_349 == nil then
    return
  end
  L5_350, L6_351 = nil, nil
  if L4_349 == 1 then
    L5_350 = 1
    L6_351 = "GuildleveExecutionWidget"
    break
  else
  end
  if L4_349 == 2 then
    L5_350 = 2
    L6_351 = "ChocoboCaravanWidget"
    break
  else
  end
  do return end
  A0_345:updateContentsInformation(A1_346, L5_350, L6_351, A2_347, A3_348)
end
L0_0.processUpdateContentsInformation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_352, A1_353, A2_354, A3_355, A4_356, A5_357)
  local L6_358, L7_359, L8_360, L9_361
  L7_359 = A0_352
  L6_358 = A0_352.getContentsIndex
  L8_360 = A1_353
  L9_361 = A2_354
  L6_358 = L6_358(L7_359, L8_360, L9_361)
  L7_359 = A4_356
  if L7_359 == "start" then
    if L6_358 ~= 0 then
    else
      L9_361 = A0_352
      L8_360 = A0_352.getFreeContentsIndex
      L8_360 = L8_360(L9_361)
      L6_358 = L8_360
      if L6_358 == 0 then
      else
        L9_361 = A0_352
        L8_360 = A0_352.openContentsWidget
        L8_360(L9_361, L6_358, A2_354, A1_353, A3_355, A1_353)
        do break end
        else
        end
        if L7_359 == "update" then
          L8_360 = nil
          if L6_358 == 0 then
            L9_361 = A0_352.getFreeContentsIndex
            L9_361 = L9_361(A0_352)
            L6_358 = L9_361
            if L6_358 == 0 then
            else
              else
                L9_361 = A0_352.getContentsWidget
                L9_361 = L9_361(A0_352, L6_358, A1_353, A3_355)
                L8_360 = L9_361
              end
              if L8_360 == nil then
                L9_361 = A0_352.isCreateWidgetCommandPlaying
                L9_361 = L9_361(A0_352)
                if L9_361 == false then
                  L9_361 = A0_352.openContentsWidget
                  L9_361(A0_352, L6_358, A2_354, A1_353, A3_355, A1_353)
                end
              else
                L9_361 = 1
                if type(A5_357) == "number" then
                  L9_361 = A5_357
                end
                L8_360:update(A1_353, L9_361)
                do break end
                elseif L7_359 == "finish" then
                else
                end
                if L7_359 ~= "cancel" or L6_358 == 0 then
                else
                  L9_361 = A0_352
                  L8_360 = A0_352.closeContentsWidget
                  L8_360(L9_361, L6_358, A1_353, A3_355)
                  do break end
                  do break end
                  break
                end
              end
            end
      end
    end
end
L0_0.updateContentsInformation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_362, A1_363, A2_364, ...)
  local L4_366, L5_367, L6_368, L7_369, L8_370, L9_371, L10_372, L11_373, L12_374, L13_375
  do break end
  do return end
  L4_366 = nil
  L5_367 = A1_363
  if L5_367 == "qtdata" then
    L4_366 = 1
    break
  else
  end
  if L5_367 == "qtmap" then
    L7_369 = A0_362
    L6_368 = A0_362.getWidget
    L6_368 = L6_368(L7_369, L8_370, L9_371)
    if L6_368 ~= nil then
      L7_369 = select
      L13_375 = ...
      L7_369 = L7_369(L8_370, L9_371, L10_372, L11_373, L12_374, L13_375, ...)
      if L7_369 > 0 then
        L8_370(L9_371, L10_372)
        for L11_373 = 1, L7_369 do
          L13_375 = L6_368
          L12_374(L13_375, L11_373, select(L11_373, ...))
        end
        L13_375 = ...
        L13_375 = L9_371(L10_372, L11_373, L12_374, L13_375, ...)
        for L13_375 = 2, L7_369 do
        end
        L10_372(L11_373, L12_374)
        L10_372(L11_373, L12_374)
        do break end
        else
        end
        if L5_367 == "activegl" then
          L4_366 = 2
          break
        else
        end
        if L5_367 == "glHist" then
          L7_369 = A0_362
          L6_368 = A0_362.getWidget
          L6_368 = L6_368(L7_369, L8_370, L9_371)
          if L6_368 ~= nil then
            L7_369 = L6_368.setDetailData
            L13_375 = ...
            L7_369(L8_370, L9_371, L10_372, L11_373, L12_374, L13_375, ...)
          else
          end
        else
        end
      else
      end
    else
    end
  if L4_366 ~= nil then
    L6_368 = A0_362
    L5_367 = A0_362.processUpdateJournalDetailWidget
    L7_369 = L4_366
    L13_375 = ...
    L5_367(L6_368, L7_369, L8_370, L9_371, L10_372, L11_373, L12_374, L13_375, ...)
  end
end
L0_0.processRecievedRequestedDataForWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_376)
  do break end
  do return end
  A0_376:getStaticWidget(15):updateQuestLinkPerlIcon()
  if A0_376:getWidget(3, "NpcLinkshellListWidget") ~= nil then
    A0_376:getWidget(3, "NpcLinkshellListWidget"):updateLinkshellList()
  end
end
L0_0.processUpdateNpcLinkshellChat = L1_1
L0_0 = DesktopWidget
function L1_1(A0_377, A1_378, A2_379)
  if A0_377:getWidget(3, "Ask/JournalListWidget") ~= nil then
    A0_377:getWidget(3, "Ask/JournalListWidget"):updateList(false)
  end
end
L0_0.processUpdateQuestComplete = L1_1
L0_0 = DesktopWidget
function L1_1(A0_380, A1_381, A2_382)
end
L0_0.processUpdateCommandAcquired = L1_1
L0_0 = DesktopWidget
function L1_1(A0_383, A1_384, A2_385)
end
L0_0.processLoadedHelpData = L1_1
L0_0 = DesktopWidget
function L1_1(A0_386)
  do break end
  do return end
  A0_386:updateMainMenuWidget()
end
L0_0.processUpdatePlaceDrivenCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_387)
  return worldMaster:_getMyPlayer():getPlaceDrivenCommandVariation()
end
L0_0.getPlayerPlaceDrivenCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_388)
  do break end
  do return end
  A0_388:updateMainMenuWidget()
end
L0_0.processUpdateContentCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_389)
  return worldMaster:_getMyPlayer():getContentCommandVariation()
end
L0_0.getPlayerContentCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_390)
  do break end
  do return end
  A0_390:updateMainMenuWidget()
  if A0_390:getWidget(3, "PartyRootWidget") ~= nil then
    A0_390:getWidget(3, "PartyRootWidget"):updateJoinButton()
  end
  if A0_390:getWidget(3, "AddressListWidget") ~= nil then
    A0_390:getWidget(3, "AddressListWidget"):updateVariation()
  end
  if A0_390:getWidget(3, "LinkshellMenuSubWidget") ~= nil then
    A0_390:getWidget(3, "LinkshellMenuSubWidget"):updateVariation()
  end
end
L0_0.processUpdateConfirmGroupCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_391)
  return worldMaster:_getMyPlayer():getConfirmGroupCommandVariation()
end
L0_0.getPlayerConfirmGroupCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_392)
  do break end
  do return end
  A0_392:updateMainMenuWidget()
end
L0_0.processUpdateConfirmWarpCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_393)
  A0_393:getStaticWidget(7):updateComboInfo()
end
L0_0.processUpdateComboInformation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_394)
  A0_394:getStaticWidget(15):update()
end
L0_0.processUpdateConsoleTray = L1_1
L0_0 = DesktopWidget
function L1_1(A0_395, A1_396)
  A0_395:getStaticChildWidget(4, "PlayerProfileWidget"):update()
end
L0_0.processUpdateExpBonus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_397)
  A0_397:getStaticWidget(7):updateComboInfo()
end
L0_0.processUpdateTimingCommandInformation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_398)
  do break end
  do return end
  A0_398:updateMainMenuWidget()
end
L0_0.processUpdateConfirmTradeCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_399)
  do break end
  do return end
  A0_399:updateMainMenuWidget()
end
L0_0.processUpdateConfirmRaiseCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_400)
  do break end
  do return end
  A0_400:updateMainMenuWidget()
end
L0_0.processUpdateEmoteSitCommandVariation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_401, A1_402)
  if A0_401:_getKeyboardFocusedWidget() == A1_402 then
    return true
  end
  return false
end
L0_0.checkKeyboardFocused = L1_1
L0_0 = DesktopWidget
function L1_1(A0_403, A1_404, A2_405, A3_406)
  if A0_403:checkActor(A1_404) == nil then
    return false
  end
  if A1_404 ~= A0_403 then
    A1_404:setInputEnable(true)
  end
  if A2_405 == true and A1_404:isShow() == false and A1_404:show(true, A3_406) == false then
    return false
  end
  if A0_403:_getKeyboardFocusedWidget() == A1_404 then
    return true
  end
  return A0_403:_setKeyboardFocusedWidget(A1_404)
end
L0_0.changeFocusedWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_407, A1_408)
  local L2_409, L3_410, L4_411, L5_412
  L3_410 = A0_407
  L2_409 = A0_407.executeTextCommand
  L4_411 = A1_408
  L5_412 = false
  L5_412 = L2_409(L3_410, L4_411, L5_412)
  return L4_411, L5_412
end
L0_0.processInputWordAnalyze = L1_1
L0_0 = DesktopWidget
function L1_1(A0_413, A1_414)
  local L2_415, L3_416, L4_417, L5_418, L6_419, L7_420, L8_421, L9_422
  L2_415 = string
  L3_416 = L2_415
  L2_415 = L2_415.split
  L4_417 = A1_414
  L5_418 = " "
  L2_415 = L2_415(L3_416, L4_417, L5_418)
  L3_416 = worldMaster
  L4_417 = L3_416
  L3_416 = L3_416._getMyPlayer
  L3_416 = L3_416(L4_417)
  L4_417 = false
  L5_418 = string
  L6_419 = L5_418
  L5_418 = L5_418.startsWith
  L7_420 = L2_415[1]
  L8_421 = "///"
  L5_418 = L5_418(L6_419, L7_420, L8_421)
  if L5_418 then
  else
    L5_418 = string
    L6_419 = L5_418
    L5_418 = L5_418.startsWith
    L7_420 = L2_415[1]
    L8_421 = "//"
    L5_418 = L5_418(L6_419, L7_420, L8_421)
    if L5_418 then
      L6_419 = L3_416
      L5_418 = L3_416._getGMRank
      L5_418 = L5_418(L6_419)
      if L5_418 ~= nil then
        L4_417 = true
      end
    else
    end
  end
  if L4_417 == true then
    L5_418 = {}
    L6_419 = 0
    L8_421 = A0_413
    L7_420 = A0_413.getMainTargetCharacter
    L7_420 = L7_420(L8_421)
    L8_421 = nil
    for _FORV_12_ = 1, #L2_415 do
      if L6_419 < 4 then
        if L2_415[_FORV_12_] == "<t>" then
          if L7_420 ~= nil then
            L6_419 = L6_419 + 1
            L5_418[L6_419] = L7_420
          end
        elseif L2_415[_FORV_12_] == "<st>" or L2_415[_FORV_12_] == "<stpc>" or L2_415[_FORV_12_] == "<stnpc>" or L2_415[_FORV_12_] == "<stpt>" then
          if L8_421 ~= nil then
            L6_419 = L6_419 + 1
            L5_418[L6_419] = L8_421
          end
        elseif L2_415[_FORV_12_] == "<me>" then
          L6_419 = L6_419 + 1
          L5_418[L6_419] = worldMaster:_getMyPlayer()
        end
      end
    end
    for _FORV_14_ = 1, 10 do
      if L2_415[_FORV_14_] == nil then
        break
      elseif _FORV_14_ == 1 then
        L9_422[_FORV_14_] = _string.gsub(L2_415[_FORV_14_], "//", "", 1)
        if L9_422[_FORV_14_] == "" or L9_422[_FORV_14_] == nil then
          L9_422[_FORV_14_] = " "
        end
      elseif L2_415[_FORV_14_] == "<t>" or L2_415[_FORV_14_] == "<me>" or L2_415[_FORV_14_] == "<st>" then
        if 1 < 5 then
          L9_422[_FORV_14_] = L5_418[1]
        else
          L9_422[_FORV_14_] = L2_415[_FORV_14_]
        end
      else
        L9_422[_FORV_14_] = L2_415[_FORV_14_]
      end
    end
    L3_416:commandAboutDebug(unpack(L9_422))
    return true
  end
  L5_418 = false
  return L5_418
end
L0_0.debugCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_423, A1_424, A2_425, A3_426)
  if A3_426 == nil then
    return A1_424
  end
  return _replaceMacroCodeString(A1_424, A2_425, A3_426)
end
L0_0.replaceString = L1_1
L0_0 = DesktopWidget
function L1_1(A0_427, A1_428)
  local L2_429, L3_430, L4_431
  L3_430 = A0_427
  L2_429 = A0_427.getStaticWidget
  L4_431 = 2
  L2_429 = L2_429(L3_430, L4_431)
  L4_431 = L2_429
  L3_430 = L2_429.getChatMode
  L4_431 = L3_430(L4_431)
  A0_427:getStaticWidget(2):resetTemporaryChatMode()
  if L3_430 == 3 and (L4_431 == nil or L4_431 == "") then
    return
  end
  A0_427:chatDirect(L3_430, A1_428, L4_431)
end
L0_0.chat = L1_1
L0_0 = DesktopWidget
function L1_1(A0_432, A1_433, A2_434, A3_435)
  local L4_436, L5_437, L6_438, L7_439, L8_440
  L5_437 = A0_432
  L4_436 = A0_432.checkText
  L6_438 = A2_434
  L4_436 = L4_436(L5_437, L6_438)
  if L4_436 == false then
    return
  end
  L4_436 = worldMaster
  L5_437 = L4_436
  L4_436 = L4_436._getMyPlayer
  L4_436 = L4_436(L5_437)
  L6_438 = L4_436
  L5_437 = L4_436.isDead
  L5_437 = L5_437(L6_438)
  if L5_437 == true then
    L5_437 = A1_433
    if L5_437 == 1 then
    elseif L5_437 == 2 then
    else
    end
    if L5_437 == 6 then
      return
    else
    end
  else
  end
  L5_437 = nil
  L6_438 = ""
  L7_439 = nil
  L8_440 = A1_433
  if L8_440 == 1 then
    L6_438 = "say"
    break
  else
  end
  if L8_440 == 2 then
    L6_438 = "shout"
    break
  else
  end
  if L8_440 == 3 then
    if A3_435 == nil then
      return
    end
    A0_432:getStaticWidget(2):saveSendHistroy(A3_435)
    L6_438 = "tell"
    L5_437 = A3_435
    break
  else
  end
  if L8_440 == 4 then
    if A0_432:isJoinedPartyMyPlayer() == false then
      worldMaster:alert(worldMaster, 30502)
      return
    end
    L5_437 = L4_436:getPlayerParty()
    L6_438 = "group"
    L7_439 = 1
    break
  else
  end
  if L8_440 == 6 then
    L6_438 = "emote"
    break
  else
  end
  if L8_440 == 5 then
    L5_437 = A0_432:checkActor(L4_436:getCommunityGroupCurrent(20002))
    if L5_437 == nil then
      return
    end
    L6_438 = "group"
    L7_439 = 1
    break
  else
  end
  do return end
  L8_440 = A0_432.convertPronouns
  L8_440 = L8_440(A0_432, A2_434)
  L4_436:_chat(L8_440, L6_438, L5_437, L7_439)
end
L0_0.chatDirect = L1_1
L0_0 = DesktopWidget
function L1_1(A0_441, A1_442)
  local L2_443, L3_444, L4_445, L5_446, L6_447, L7_448, L8_449, L9_450, L10_451, L11_452, L12_453, L13_454
  if A1_442 == "" then
    return A1_442
  end
  L2_443 = A0_441.work
  L2_443 = L2_443.lockUserControl
  if L2_443 == false then
    L2_443 = _string
    L2_443 = L2_443.match
    L3_444 = A1_442
    L4_445 = "<sign[0-7]>"
    L2_443 = L2_443(L3_444, L4_445)
    if L2_443 ~= nil then
      L3_444 = tonumber
      L4_445 = _string
      L4_445 = L4_445.sub
      L5_446 = L2_443
      L6_447 = 6
      L13_454 = L4_445(L5_446, L6_447, L7_448)
      L3_444 = L3_444(L4_445, L5_446, L6_447, L7_448, L8_449, L9_450, L10_451, L11_452, L12_453, L13_454, L4_445(L5_446, L6_447, L7_448))
      L5_446 = A0_441
      L4_445 = A0_441.executePlayerSignal
      L6_447 = L3_444 + 1
      L4_445(L5_446, L6_447)
    end
  end
  L2_443 = worldMaster
  L3_444 = L2_443
  L2_443 = L2_443._getMyPlayer
  L2_443 = L2_443(L3_444)
  L3_444 = A1_442
  L4_445 = nil
  L6_447 = A0_441
  L5_446 = A0_441.deleteChineseName
  L13_454 = L7_448(L8_449)
  L5_446 = L5_446(L6_447, L7_448, L8_449, L9_450, L10_451, L11_452, L12_453, L13_454, L7_448(L8_449))
  L4_445 = L5_446
  L6_447 = A0_441
  L5_446 = A0_441.replaceString
  L5_446 = L5_446(L6_447, L7_448, L8_449, L9_450)
  L3_444 = L5_446
  L6_447 = A0_441
  L5_446 = A0_441.replaceString
  L5_446 = L5_446(L6_447, L7_448, L8_449, L9_450)
  L3_444 = L5_446
  L6_447 = A0_441
  L5_446 = A0_441.getMainTargetCharacter
  L5_446 = L5_446(L6_447)
  if L5_446 ~= nil then
    L6_447 = A0_441.deleteChineseName
    L13_454 = L8_449(L9_450)
    L6_447 = L6_447(L7_448, L8_449, L9_450, L10_451, L11_452, L12_453, L13_454, L8_449(L9_450))
    L4_445 = L6_447
    L6_447 = A0_441.replaceString
    L10_451 = L4_445
    L6_447 = L6_447(L7_448, L8_449, L9_450, L10_451)
    L3_444 = L6_447
  end
  L6_447 = A0_441.work
  L6_447 = L6_447.subTargetName
  if L6_447 ~= "" then
    L6_447 = A0_441.deleteChineseName
    L6_447 = L6_447(L7_448, L8_449)
    L4_445 = L6_447
    L6_447 = A0_441.replaceString
    L10_451 = L4_445
    L6_447 = L6_447(L7_448, L8_449, L9_450, L10_451)
    L3_444 = L6_447
  end
  L6_447 = A0_441._getLastAttacker
  L6_447 = L6_447(L7_448)
  L5_446 = L6_447
  if L5_446 ~= nil then
    L6_447 = A0_441.deleteChineseName
    L10_451 = L5_446
    L13_454 = L8_449(L9_450, L10_451)
    L6_447 = L6_447(L7_448, L8_449, L9_450, L10_451, L11_452, L12_453, L13_454, L8_449(L9_450, L10_451))
    L4_445 = L6_447
    L6_447 = A0_441.replaceString
    L10_451 = L4_445
    L6_447 = L6_447(L7_448, L8_449, L9_450, L10_451)
    L3_444 = L6_447
  end
  L6_447 = 1
  for L10_451 = 1, 8 do
    L12_453 = A0_441
    L11_452 = A0_441.isPartyMemberActorMe
    L13_454 = L10_451
    L11_452 = L11_452(L12_453, L13_454)
    if L11_452 == false then
      L11_452 = "<p"
      L12_453 = tostring
      L13_454 = L6_447
      L12_453 = L12_453(L13_454)
      L13_454 = ">"
      L11_452 = L11_452 .. L12_453 .. L13_454
      L13_454 = A0_441
      L12_453 = A0_441.deleteChineseName
      L12_453 = L12_453(L13_454, A0_441:getPartyMemberDisplayName(L10_451))
      L4_445 = L12_453
      L13_454 = A0_441
      L12_453 = A0_441.replaceString
      L12_453 = L12_453(L13_454, L3_444, L11_452, L4_445)
      L3_444 = L12_453
      L6_447 = L6_447 + 1
    end
  end
  L13_454 = L8_449(L9_450)
  L11_452 = L2_443
  L10_451 = L2_443.getHPMax
  L13_454 = L10_451(L11_452)
  L4_445 = L7_448 .. L8_449 .. L9_450
  L10_451 = "<hp>"
  L11_452 = L4_445
  L3_444 = L7_448
  if L8_449 > 0 then
    L10_451 = _math
    L10_451 = L10_451.floor
    L11_452 = L7_448 / L8_449
    L11_452 = L11_452 * 100
    L13_454 = L10_451(L11_452)
    L10_451 = "%"
    L4_445 = L9_450 .. L10_451
    L10_451 = A0_441
    L11_452 = L3_444
    L12_453 = "<hpp>"
    L13_454 = L4_445
    L3_444 = L9_450
  end
  L11_452 = L2_443
  L10_451 = L2_443.getMP
  L13_454 = L10_451(L11_452)
  L10_451 = "/"
  L11_452 = tostring
  L13_454 = L2_443
  L12_453 = L2_443.getMPMax
  L13_454 = L12_453(L13_454)
  L11_452 = L11_452(L12_453, L13_454, L12_453(L13_454))
  L4_445 = L9_450 .. L10_451 .. L11_452
  L10_451 = A0_441
  L11_452 = L3_444
  L12_453 = "<mp>"
  L13_454 = L4_445
  L3_444 = L9_450
  L10_451 = L2_443
  L11_452 = L2_443
  L10_451 = L2_443.getMPMax
  L10_451 = L10_451(L11_452)
  if L10_451 > 0 then
    L11_452 = tostring
    L12_453 = _math
    L12_453 = L12_453.floor
    L13_454 = L9_450 / L10_451
    L13_454 = L13_454 * 100
    L13_454 = L12_453(L13_454)
    L11_452 = L11_452(L12_453, L13_454, L12_453(L13_454))
    L12_453 = "%"
    L4_445 = L11_452 .. L12_453
    L12_453 = A0_441
    L11_452 = A0_441.replaceString
    L13_454 = L3_444
    L11_452 = L11_452(L12_453, L13_454, "<mpp>", L4_445)
    L3_444 = L11_452
  end
  L11_452 = tostring
  L13_454 = L2_443
  L12_453 = L2_443.getTP
  L13_454 = L12_453(L13_454)
  L11_452 = L11_452(L12_453, L13_454, L12_453(L13_454))
  L4_445 = L11_452
  L12_453 = A0_441
  L11_452 = A0_441.replaceString
  L13_454 = L3_444
  L11_452 = L11_452(L12_453, L13_454, "<tp>", L4_445)
  L3_444 = L11_452
  L12_453 = A0_441
  L11_452 = A0_441.getStaticWidget
  L13_454 = 10
  L11_452 = L11_452(L12_453, L13_454)
  L13_454 = L11_452
  L12_453 = L11_452.getPlayerMapPosition
  L13_454 = L12_453(L13_454, "CustomControl_MiniMap")
  if L12_453 >= 0 and L13_454 >= 0 then
    L4_445 = "( X: " .. tostring(L12_453) .. ", Y: " .. tostring(L13_454) .. " )"
    L3_444 = A0_441:replaceString(L3_444, "<pos>", L4_445)
  end
  return L3_444
end
L0_0.convertPronouns = L1_1
L0_0 = DesktopWidget
function L1_1(A0_455, A1_456)
  local L2_457
  L2_457 = A0_455.getStaticWidget
  L2_457 = L2_457(A0_455, 2)
  A0_455:changeFocusedWidget(L2_457, false)
  L2_457:setKeyboardFocusToChatControl()
  L2_457:appendTextIdForChatControl(2256, 103, A1_456)
end
L0_0.setTellAddress = L1_1
L0_0 = DesktopWidget
function L1_1(A0_458)
  A0_458:getStaticWidget(2):updateLogFormat()
  A0_458:getStaticWidget(3):updateLogFormat()
end
L0_0.updateLogColor = L1_1
L0_0 = DesktopWidget
function L1_1(A0_459)
  local L1_460
  L1_460 = A0_459:getLogWidgetTransparency(6)
  A0_459:getStaticWidget(2):setTransparency(L1_460)
  L1_460 = A0_459:getLogWidgetTransparency(7)
  A0_459:getStaticWidget(3):setTransparency(L1_460)
end
L0_0.updateLogTransparency = L1_1
L0_0 = DesktopWidget
function L1_1(A0_461)
  local L1_462
  L1_462 = A0_461:getLogWidgetTextTransparency(17)
  A0_461:getStaticWidget(2):setTextTransparency(L1_462)
  L1_462 = A0_461:getLogWidgetTextTransparency(18)
  A0_461:getStaticWidget(3):setTextTransparency(L1_462)
end
L0_0.updateLogTextTransparency = L1_1
L0_0 = DesktopWidget
function L1_1(A0_463, A1_464)
  return 100 - A0_463:getConfigWork(A1_464) * 10
end
L0_0.getLogWidgetTransparency = L1_1
L0_0 = DesktopWidget
function L1_1(A0_465, A1_466)
  return A0_465:getConfigWork(A1_466) * 10
end
L0_0.getLogWidgetTextTransparency = L1_1
L0_0 = DesktopWidget
function L1_1(A0_467)
  local L1_468, L2_469
  L2_469 = A0_467
  L1_468 = A0_467.getConfigWork
  L1_468 = L1_468(L2_469, 12)
  L2_469 = A0_467.getConfigWork
  L2_469 = L2_469(A0_467, 16)
  A0_467:getStaticWidget(2):setAutoHideTime(L1_468)
  A0_467:getStaticWidget(3):setAutoHideTime(L2_469)
end
L0_0.updateLogAutoHideTime = L1_1
L0_0 = DesktopWidget
function L1_1(A0_470, A1_471)
  if A1_471 == true then
    A0_470:getStaticWidget(2):setAutoHideEnable(true)
    A0_470:getStaticWidget(3):setAutoHideEnable(true)
    A0_470:updateLogAutoHideTime()
  else
    A0_470:getStaticWidget(2):setAutoHideTime(0)
    A0_470:getStaticWidget(3):setAutoHideTime(0)
    A0_470:getStaticWidget(2):setAutoHideEnable(false)
    A0_470:getStaticWidget(3):setAutoHideEnable(false)
  end
end
L0_0.setLogAutoHideEnable = L1_1
L0_0 = DesktopWidget
function L1_1(A0_472, A1_473)
  local L2_474
  L2_474 = 0.1
  if A1_473 == true then
    L2_474 = 0.11
  end
  A0_472:getStaticWidget(2):setDrawPriority(L2_474)
  A0_472:getStaticWidget(3):setDrawPriority(L2_474)
end
L0_0.setLogPriority = L1_1
L0_0 = DesktopWidget
function L1_1(A0_475, A1_476, A2_477)
  if A2_477 ~= true then
    if A0_475:getStaticWidget(2):isForceHide() == true then
      return
    end
    if A0_475.work.logHideFlag == true then
      return
    end
  end
  A0_475:getStaticWidget(2):setEventHide(A1_476)
  A0_475:getStaticWidget(3):setEventHide(A1_476)
end
L0_0.setLogEventHide = L1_1
L0_0 = DesktopWidget
function L1_1(A0_478, A1_479)
  local L2_480
  if A1_479 == nil or A1_479 == 39 then
    L2_480 = A0_478:getLogFontSize(39)
    A0_478:getStaticWidget(2):setLogFontSize(L2_480)
  end
  if A1_479 == nil or A1_479 == 40 then
    L2_480 = A0_478:getLogFontSize(40)
    A0_478:getStaticWidget(3):setLogFontSize(L2_480)
  end
end
L0_0.updateLogFontSize = L1_1
L0_0 = DesktopWidget
function L1_1(A0_481, A1_482)
  local L2_483
  L2_483 = 12
  if A0_481:getConfigWork(A1_482) == 1 then
    L2_483 = 14
    break
  else
  end
  if A0_481:getConfigWork(A1_482) == 2 then
    L2_483 = 18
    do break end
    break
  else
  end
  return L2_483
end
L0_0.getLogFontSize = L1_1
L0_0 = DesktopWidget
function L1_1(A0_484, A1_485, A2_486, A3_487)
  if A1_485 == nil then
    return nil
  end
  if A3_487 == nil then
    A3_487 = "_"
  end
  if A2_486 < 1 or A2_486 > #string:split(A1_485, A3_487) then
    return nil
  end
  return string:split(A1_485, A3_487)[A2_486]
end
L0_0.parseWidgetString = L1_1
L0_0 = DesktopWidget
function L1_1(A0_488)
  A0_488:createStaticWidget(1, "MainMenuWidget", nil, 3, false)
  A0_488:createStaticWidget(15, "ConsoleIconTrayWidget", nil, 3, true)
  A0_488:createStaticWidget(2, "LogWidget", nil, 1, true, 1)
  A0_488:createStaticWidget(3, "LogWidget", "LogWidget2", 1, true, 2)
  A0_488:createStaticWidget(4, "PlayerParameterWidget", nil, 1, true)
  A0_488:createStaticChildWidget(4, "PlayerProfileWidget", true)
  A0_488:createStaticWidget(16, "StatusEffectWidget", nil, 1, true)
  A0_488:createStaticWidget(5, "TargetParameterWidget", nil, 1, false)
  A0_488:createStaticWidget(6, "PartyParameterWidget", nil, 1, true)
  A0_488:createStaticWidget(7, "ActionMenuWidget", nil, 2, false)
  A0_488:createStaticChildWidget(7, "ActionGaugeWidget", false)
  A0_488:createStaticWidget(8, "PublicInformDialogWidget", nil, 1, false)
  A0_488:createStaticWidget(9, "CaptionWidget", nil, 1, true)
  A0_488:createStaticWidget(14, "NpcSayWidget", nil, 1, true)
  A0_488:createStaticWidget(10, "MiniMapWidget", nil, 1, true)
  A0_488:createStaticWidget(11, "SystemTrayWidget", nil, 1, true)
  A0_488:createStaticWidget(12, "CutSceneSkipWidget", nil, 1, false)
  A0_488:createStaticWidget(13, "CutSceneSkipWarningWidget", nil, 1, false)
  A0_488:createStaticWidget(17, "ErrorDialogWidget", nil, 1, false)
  A0_488:createStaticWidget(18, "TargetSelectModeWidget", nil, 1, true)
  A0_488:createStaticWidget(19, "WarningDialogWidget", nil, 1, false)
  A0_488:createStaticWidget(20, "PartyBuffEffectWidget", nil, 1, true)
  A0_488:createStaticWidget(21, "PopupHelpWidget", nil, 1, false)
  A0_488:createStaticWidget(22, "TutorialSuccessWidget", nil, 1, false)
  A0_488:createStaticWidget(23, "ChocoboRentalTimerWidget", nil, 1, false)
  A0_488:createStaticWidget(24, "AchievementPopupWidget", nil, 1, false)
end
L0_0.setDefaultWidgetLocation = L1_1
L0_0 = DesktopWidget
function L1_1(A0_489)
  A0_489:updateActionMenuWidget(true, A0_489:getConfigFlag(1), true)
  A0_489:getStaticWidget(4):updateAll()
  A0_489:getStaticWidget(16):update()
end
L0_0.initializeParameterforStaticWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_490, A1_491)
  local L2_492
  if nil == true then
    return
  end
  L2_492 = A0_490.getModeLevel
  L2_492 = L2_492(A0_490, A1_491)
  if L2_492 == 0 then
    return
  end
  A0_490.work.desktopMode[L2_492] = A1_491
  if L2_492 >= A0_490.work.modeLevel then
    A0_490:setDesktopModeDetail(A1_491, L2_492)
  end
end
L0_0.orderDesktopWidgetMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_493, A1_494)
  local L2_495, L3_496
  if nil == true then
    return
  end
  L3_496 = A0_493
  L2_495 = A0_493.getModeLevel
  L2_495 = L2_495(L3_496, A1_494)
  if L2_495 == 0 then
    return
  end
  if L2_495 > 1 then
    L3_496 = A0_493.work
    L3_496 = L3_496.desktopMode
    L3_496 = L3_496[L2_495]
    if L3_496 == 0 then
      return
    end
    if A1_494 == 126 then
      L3_496 = worldMaster
      L3_496 = L3_496._getMyPlayer
      L3_496 = L3_496(L3_496)
      L3_496 = L3_496._unlockPlayerControl
      L3_496(L3_496)
    end
    L3_496 = A0_493.work
    L3_496 = L3_496.desktopMode
    L3_496[L2_495] = 0
  else
    L3_496 = A0_493.work
    L3_496 = L3_496.desktopMode
    L3_496[L2_495] = 8
  end
  L3_496 = A0_493.work
  L3_496 = L3_496.modeLevel
  if L2_495 <= L3_496 then
    L3_496 = A0_493.work
    L3_496 = L3_496.modeLevel
    if L3_496 >= 4 then
      L3_496 = 3
    end
    if L2_495 < L3_496 then
      for _FORV_7_ = L2_495 + 1, L3_496 do
        if A0_493.work.desktopMode[_FORV_7_] ~= 0 then
          A0_493.work.desktopMode[_FORV_7_] = 0
        end
      end
    end
    if L2_495 < _FOR_.modeLevel and A0_493.work.modeLevel == 5 then
      return
    end
    if L2_495 < A0_493.work.modeLevel and A0_493.work.modeLevel == 4 then
      return
    end
    if L2_495 > 1 then
      for _FORV_7_ = L2_495 - 1, 1, -1 do
        if A0_493.work.desktopMode[_FORV_7_] ~= 0 then
          L2_495 = _FORV_7_
          break
        end
      end
    end
    A0_493:setDesktopModeDetail(A0_493.work.desktopMode[L2_495], L2_495)
  end
end
L0_0.cancelDesktopWidgetMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_497)
  do break end
  do return 0 end
  return A0_497.work.mode
end
L0_0.getDesktopWidgetMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_498, A1_499)
  local L2_500, L3_501
  L2_500 = 0
  L3_501 = A1_499
  if L3_501 == 8 then
  else
  end
  if L3_501 == 120 then
    L2_500 = 1
    break
  elseif L3_501 == 16 then
  else
  end
  if L3_501 == 32 then
    L2_500 = 2
    break
  elseif L3_501 == 61 then
  elseif L3_501 == 62 then
  elseif L3_501 == 63 then
  else
  end
  if L3_501 == 64 then
    L2_500 = 3
    break
  else
  end
  if L3_501 == 126 then
    L2_500 = 4
    break
  else
  end
  if L3_501 == 127 then
    L2_500 = 5
    do break end
    break
  else
  end
  return L2_500
end
L0_0.getModeLevel = L1_1
L0_0 = DesktopWidget
function L1_1(A0_502)
  local L1_503
  L1_503 = false
  if A0_502:getDesktopWidgetMode() == 61 then
  elseif A0_502:getDesktopWidgetMode() == 62 then
  elseif A0_502:getDesktopWidgetMode() == 63 then
  else
  end
  if A0_502:getDesktopWidgetMode() == 64 then
    L1_503 = true
    do break end
    break
  else
  end
  return L1_503
end
L0_0.isCutSceneMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_504, A1_505, A2_506)
  local L3_507, L4_508, L5_509, L6_510, L7_511, L8_512, L9_513, L10_514, L11_515, L12_516, L13_517, L14_518, L15_519, L16_520, L17_521, L18_522, L19_523, L20_524, L21_525, L22_526, L23_527, L24_528, L25_529, L26_530
  L3_507 = A0_504.work
  L3_507.mode = A1_505
  L3_507 = A0_504.work
  L3_507.modeLevel = A2_506
  L4_508 = A0_504
  L3_507 = A0_504.getStaticWidget
  L5_509 = 17
  L3_507 = L3_507(L4_508, L5_509)
  L4_508 = L3_507
  L3_507 = L3_507.finish
  L5_509 = true
  L3_507(L4_508, L5_509)
  L4_508 = A0_504
  L3_507 = A0_504.cancelWidgetCommand
  L3_507(L4_508)
  L3_507 = A0_504.work
  L3_507 = L3_507.mode
  if L3_507 == 16 then
  elseif L3_507 == 61 then
  elseif L3_507 == 62 then
  elseif L3_507 == 63 then
  elseif L3_507 == 126 then
  else
  end
  if L3_507 == 127 then
    L5_509 = A0_504
    L4_508 = A0_504.closeWidget
    L6_510 = 11
    L7_511 = nil
    L4_508(L5_509, L6_510, L7_511)
    L4_508 = A0_504.work
    L4_508.cutsceneMapFlag = false
    L5_509 = A0_504
    L4_508 = A0_504.closeCutSceneEffectWidget
    L4_508(L5_509)
    L5_509 = A0_504
    L4_508 = A0_504.closeWidget
    L6_510 = 2
    L7_511 = nil
    L4_508(L5_509, L6_510, L7_511)
    L5_509 = A0_504
    L4_508 = A0_504.closeWidget
    L6_510 = 3
    L7_511 = nil
    L4_508(L5_509, L6_510, L7_511)
    L5_509 = A0_504
    L4_508 = A0_504.getStaticWidget
    L6_510 = 1
    L4_508 = L4_508(L5_509, L6_510)
    L5_509 = L4_508
    L4_508 = L4_508.hide
    L6_510 = true
    L7_511 = true
    L4_508(L5_509, L6_510, L7_511)
  else
  end
  if L3_507 == 32 then
    L5_509 = A0_504
    L4_508 = A0_504.closeWidget
    L6_510 = 3
    L7_511 = "PcProfileWidget"
    L4_508(L5_509, L6_510, L7_511)
    L5_509 = A0_504
    L4_508 = A0_504.updateActionMenuWidget
    L6_510 = false
    L7_511 = false
    L4_508(L5_509, L6_510, L7_511)
    do break end
    break
  else
  end
  L4_508 = A0_504
  L3_507 = A0_504.getWidget
  L5_509 = 3
  L6_510 = "RepairEquipmentWidget"
  L3_507 = L3_507(L4_508, L5_509, L6_510)
  if L3_507 ~= nil then
    L5_509 = L3_507
    L4_508 = L3_507.getArgActor
    L4_508 = L4_508(L5_509)
    if L4_508 == nil then
      L5_509 = A0_504
      L4_508 = A0_504.closeWidgetDirect
      L6_510 = L3_507
      L4_508(L5_509, L6_510)
    end
  end
  L5_509 = A0_504
  L4_508 = A0_504.cancelSubTargetSelect
  L4_508(L5_509)
  L5_509 = A0_504
  L4_508 = A0_504.getStaticWidget
  L6_510 = 7
  L4_508 = L4_508(L5_509, L6_510)
  L6_510 = L4_508
  L5_509 = L4_508.resetCastingCommandInfomation
  L7_511 = 1
  L5_509(L6_510, L7_511)
  L6_510 = L4_508
  L5_509 = L4_508.resetCastingCommandInfomation
  L7_511 = 2
  L5_509(L6_510, L7_511)
  L5_509 = true
  L6_510 = true
  L7_511 = false
  L8_512 = false
  L9_513 = false
  L10_514 = false
  L11_515 = false
  L12_516 = false
  L13_517 = false
  L14_518 = false
  L15_519 = false
  L16_520 = false
  L17_521 = false
  L18_522 = false
  L19_523 = false
  L20_524 = false
  L21_525 = 0.1
  L22_526 = false
  if L23_527 == 0 then
  else
  end
  if L23_527 == 1 then
    return
  else
  end
  if L23_527 == 8 then
    L5_509 = false
    L6_510 = false
    L7_511 = true
    L8_512 = true
    L9_513 = true
    L10_514 = true
    L11_515 = true
    L12_516 = true
    L13_517 = true
    L14_518 = true
    L16_520 = true
    L19_523 = true
    break
  else
  end
  if L23_527 == 16 then
    L8_512 = true
    L9_513 = true
    L11_515 = true
    L13_517 = true
    L14_518 = true
    L18_522 = true
    break
  else
  end
  if L23_527 == 61 then
    L8_512 = true
    L9_513 = true
    L11_515 = true
    L16_520 = true
    L17_521 = true
    L18_522 = true
    L21_525 = 0.12
    L22_526 = true
    break
  else
  end
  if L23_527 == 62 then
    L15_519 = true
    L16_520 = true
    L17_521 = true
    break
  else
  end
  if L23_527 == 63 then
    L8_512 = true
    L9_513 = true
    L11_515 = true
    L15_519 = true
    L16_520 = true
    L17_521 = true
    L18_522 = true
    L21_525 = 0.12
    L22_526 = true
    break
  else
  end
  if L23_527 == 32 then
    L8_512 = true
    L9_513 = true
    L11_515 = true
    L12_516 = true
    L13_517 = true
    L14_518 = true
    break
  else
  end
  if L23_527 == 120 then
    L5_509 = false
    L6_510 = false
    L7_511 = true
    L10_514 = true
    L11_515 = true
    L12_516 = true
    L13_517 = true
    L14_518 = true
    L16_520 = true
    L19_523 = true
    L20_524 = true
    break
  else
  end
  if L23_527 == 126 then
    L24_528(L25_529)
    L11_515 = true
    L13_517 = true
    break
  else
    if L23_527 == 127 then
      break
    else
    end
    return
  end
  L23_527(L24_528, L25_529)
  L23_527.lockUserControl = L6_510
  L26_530 = L11_515
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L11_515
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L11_515
  L23_527(L24_528, L25_529, L26_530)
  L23_527[7] = L11_515
  L23_527.logHideFlag = L22_526
  L26_530 = true
  L23_527(L24_528, L25_529, L26_530)
  L23_527(L24_528, L25_529)
  L26_530 = L12_516
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L12_516
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L13_517
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L13_517
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L13_517
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L14_518
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L14_518
  L23_527(L24_528, L25_529, L26_530)
  L23_527(L24_528)
  L23_527(L24_528, L25_529)
  L23_527[2] = L10_514
  L26_530 = L10_514
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L10_514
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L10_514
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L10_514
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L15_519
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L7_511
  L23_527(L24_528, L25_529, L26_530)
  L23_527[3] = L7_511
  L26_530 = L7_511
  L23_527(L24_528, L25_529, L26_530)
  L23_527[4] = L8_512
  L26_530 = L8_512
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L8_512
  L23_527(L24_528, L25_529, L26_530)
  L23_527[5] = L9_513
  for L26_530 = 6, 8 do
    A0_504:setForceVisible(L26_530, L9_513)
  end
  L26_530 = L9_513
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L9_513
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L9_513
  L23_527(L24_528, L25_529, L26_530)
  L23_527[1] = L16_520
  L23_527[6] = L16_520
  L23_527(L24_528)
  L26_530 = L17_521
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L17_521
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L18_522
  L23_527(L24_528, L25_529, L26_530)
  L23_527(L24_528, L25_529)
  L26_530 = L19_523
  L23_527(L24_528, L25_529, L26_530)
  L26_530 = L20_524
  L23_527(L24_528, L25_529, L26_530)
  L23_527(L24_528, L25_529)
  L23_527(L24_528, L25_529)
end
L0_0.setDesktopModeDetail = L1_1
L0_0 = DesktopWidget
function L1_1(A0_531, A1_532, A2_533)
  local L3_534
  L3_534 = A0_531.work
  L3_534 = L3_534.rootWidget
  L3_534 = L3_534[A1_532]
  if L3_534 == nil then
    return false
  end
  L3_534:forceVisible(A2_533)
  return true
end
L0_0.setForceVisible = L1_1
L0_0 = DesktopWidget
function L1_1(A0_535, A1_536, A2_537)
  A0_535:getStaticWidget(A1_536):forceVisible(A2_537)
end
L0_0.setStaticForceVisible = L1_1
L0_0 = DesktopWidget
function L1_1(A0_538)
  A0_538.work.tutorialFlag = true
  worldMaster:_getMyPlayer():_lockLockonControl()
  A0_538:setTutorialMask(true, true, true, true, true, 4)
  A0_538:orderDesktopWidgetMode(120)
end
L0_0.orderTutorialMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_539)
  worldMaster:_getMyPlayer():_unlockLockonControl()
  A0_539:setTutorialMask(false, false, false, false, false, 0)
  A0_539:cancelDesktopWidgetMode(120)
  A0_539.work.tutorialFlag = false
end
L0_0.cancelTutorialMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_540, A1_541, A2_542, A3_543, A4_544, A5_545, A6_546)
  if A1_541 ~= nil and A0_540.work.tutorialLockFlag[1] ~= A1_541 then
    A0_540.work.tutorialLockFlag[1] = A1_541
    if A1_541 == true then
      worldMaster:_getMyPlayer():_lockPlayerControl()
    else
      worldMaster:_getMyPlayer():_unlockPlayerControl()
    end
  end
  if A2_542 ~= nil and A0_540.work.tutorialLockFlag[2] ~= A2_542 then
    A0_540.work.tutorialLockFlag[2] = A2_542
    if A2_542 == true then
      A0_540:_lockTargetCursorControl()
    else
      A0_540:_unlockTargetCursorControl()
    end
  end
  if A3_543 ~= nil then
    A0_540.work.tutorialLockFlag[3] = A3_543
  end
  if A4_544 ~= nil and A0_540.work.tutorialLockFlag[4] ~= A4_544 then
    A0_540.work.tutorialLockFlag[4] = A4_544
  end
  if A5_545 ~= nil and A0_540.work.tutorialLockFlag[5] ~= A5_545 then
    A0_540.work.tutorialLockFlag[5] = A5_545
    A0_540:getStaticWidget(7):updateButtonMask()
  end
  if A6_546 ~= nil and A0_540.work.tutorialMenuType ~= A6_546 then
    A0_540.work.tutorialMenuType = A6_546
    A0_540:getStaticWidget(1):updateButtonMask()
  end
  if true == true then
    A0_540:getStaticWidget(15):updateButtonMask()
  end
end
L0_0.setTutorialMask = L1_1
L0_0 = DesktopWidget
function L1_1(A0_547)
  return A0_547.work.tutorialFlag
end
L0_0.isTutorialMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_548, A1_549)
  local L2_550
  L2_550 = A0_548.work
  L2_550 = L2_550.tutorialFlag
  if L2_550 == false then
    L2_550 = false
    return L2_550
  end
  L2_550 = A0_548.work
  L2_550 = L2_550.tutorialLockFlag
  L2_550 = L2_550[A1_549]
  return L2_550
end
L0_0.isTutorialLock = L1_1
L0_0 = DesktopWidget
function L1_1(A0_551)
  local L1_552
  L1_552 = A0_551.work
  L1_552 = L1_552.tutorialFlag
  if L1_552 == false then
    L1_552 = 0
    return L1_552
  end
  L1_552 = A0_551.work
  L1_552 = L1_552.tutorialMenuType
  return L1_552
end
L0_0.getTutorialMenuType = L1_1
L0_0 = DesktopWidget
function L1_1(A0_553, A1_554)
  local L2_555
  L2_555 = A0_553.work
  L2_555 = L2_555.tutorialFlag
  if L2_555 == false then
    return
  end
  L2_555 = A0_553.work
  L2_555.tutorialMenuStatus = A1_554
end
L0_0.setTutorialMenuStatus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_556)
  local L1_557
  L1_557 = A0_556.work
  L1_557 = L1_557.tutorialFlag
  if L1_557 == false then
    L1_557 = 0
    return L1_557
  end
  L1_557 = A0_556.work
  L1_557 = L1_557.tutorialMenuStatus
  return L1_557
end
L0_0.getTutorialMenuStatus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_558)
  local L1_559
  L1_559 = false
  if A0_558:getTutorialMenuType() == 4 then
    L1_559 = true
  end
  return L1_559
end
L0_0.isTutorialMainMenuMask = L1_1
L0_0 = DesktopWidget
function L1_1(A0_560, A1_561, A2_562)
  A0_560:getStaticWidget(22):setData(A1_561, A2_562)
end
L0_0.openTutorialSuccessWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_563)
  A0_563:getStaticWidget(22):hide()
end
L0_0.closeTutorialSuccessWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_564, A1_565, A2_566)
  local L3_567, L4_568, L5_569
  L3_567 = A0_564.work
  A1_565 = L3_567.tutorialDeviceType
  L3_567 = "TutorialWidgetK"
  if A1_565 == 2 then
    L3_567 = "TutorialWidgetP"
  end
  L4_568 = L3_567
  L5_569 = tostring
  L5_569 = L5_569(A2_566)
  L3_567 = L4_568 .. L5_569
  L4_568 = A2_566
  if L4_568 == 1 then
  elseif L4_568 == 2 then
  elseif L4_568 == 3 then
  elseif L4_568 == 4 then
  elseif L4_568 == 5 then
  elseif L4_568 == 6 then
  elseif L4_568 == 7 then
  elseif L4_568 == 10 then
  else
  end
  if L4_568 == 15 then
    L5_569 = A0_564.openWidgetYield
    L5_569 = L5_569(A0_564, 12, "Ask/TutorialWidget", L3_567, nil, false, A1_565, A2_566)
    if L5_569 ~= nil then
      A0_564:selectWidgetYield(L5_569, true)
      A0_564:changeFocusedWidget(A0_564)
      do break end
      elseif L4_568 == 8 then
      elseif L4_568 == 9 then
      elseif L4_568 == 11 then
      elseif L4_568 == 12 then
      elseif L4_568 == 13 then
      elseif L4_568 == 14 then
      elseif L4_568 == 16 then
      elseif L4_568 == 17 then
      else
      end
      if L4_568 == 18 then
        L5_569 = A0_564.openWidget
        L5_569(A0_564, 12, "Ask/TutorialWidget", L3_567, nil, true, A1_565, A2_566)
        break
      else
      end
    else
    end
end
L0_0.openTutorialWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_570)
  A0_570:closeWidget(12, nil)
end
L0_0.closeTutorialWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_571)
  local L1_572, L2_573
  L1_572 = 1
  L2_573 = A0_571.openWidgetYield
  L2_573 = L2_573(A0_571, 12, "Ask/TutorialModeSelectWidget", nil, nil, false)
  if L2_573 ~= nil then
    if A0_571:selectWidgetYield(L2_573, true) == true then
      L1_572 = L2_573:getAskResult()
    end
    A0_571:closeWidgetDirect(L2_573)
  end
  A0_571.work.tutorialDeviceType = L1_572
  if L1_572 == 1 then
    A0_571:setConfigFlag(43, false)
  end
  return L1_572
end
L0_0.askTutorialDeviceType = L1_1
L0_0 = DesktopWidget
function L1_1(A0_574, A1_575)
  A0_574.work.tutorialDeviceType = A1_575
end
L0_0.setTutorialDeviceType = L1_1
L0_0 = DesktopWidget
function L1_1(A0_576)
  if A0_576:getConfigFlag(1) == true then
    return true
  end
  return A0_576:isMainTargetDecided()
end
L0_0.isShowActionMenu = L1_1
L0_0 = DesktopWidget
function L1_1(A0_577, A1_578, A2_579, A3_580)
  local L4_581, L5_582
  L5_582 = A0_577
  L4_581 = A0_577.getStaticWidget
  L4_581 = L4_581(L5_582, 7)
  if A1_578 ~= nil then
    if A1_578 then
      L5_582 = A0_577.updateReadyCommand
      L5_582(A0_577)
      L5_582 = L4_581.updateActionMenu
      L5_582(L4_581)
    end
    L5_582 = A0_577.getMainTargetCharacter
    L5_582 = L5_582(A0_577)
    L4_581:updateActionMenuEnabled(L5_582)
  end
  if A2_579 ~= nil then
    L5_582 = false
    if A2_579 == true and A0_577:isSubTargetSelectMode() == false then
      L5_582 = true
    end
    if A3_580 ~= true then
      A0_577:setMainTargetCursorStatus(L5_582)
    end
    if L5_582 == true then
      L4_581:show()
      if A3_580 ~= true then
        if A0_577.work.mainTargetDecidedFlag == true then
          A0_577:changeFocusedWidget(L4_581)
        else
          A0_577:changeFocusedWidget(A0_577)
        end
      end
    elseif A0_577:getConfigFlag(1) == false then
      if L4_581:isShowMacro() == false then
        L4_581:hide()
      end
    elseif A0_577:checkKeyboardFocused(L4_581) == true and L4_581:isShowMacro() == false then
      A0_577:changeFocusedWidget(A0_577)
    end
  end
end
L0_0.updateActionMenuWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_583, A1_584, A2_585, A3_586, A4_587)
  do break end
  do return end
  A0_583:updateActionMenuWidget(false)
end
L0_0.showGauge = L1_1
L0_0 = DesktopWidget
function L1_1(A0_588)
  A0_588:updateReadyCommand()
  if A0_588:getStaticWidget(1) ~= nil then
    A0_588:getStaticWidget(1):update()
  end
  A0_588:getStaticWidget(15):update()
end
L0_0.updateMainMenuWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_589)
  local L1_590, L2_591
  L2_591 = A0_589
  L1_590 = A0_589.getStaticWidget
  L1_590 = L1_590(L2_591, 17)
  L2_591 = L1_590
  L1_590 = L1_590.isShow
  L1_590 = L1_590(L2_591)
  if L1_590 == true then
    L1_590 = false
    return L1_590
  end
  L2_591 = A0_589
  L1_590 = A0_589.getDesktopWidgetMode
  L1_590 = L1_590(L2_591)
  if L1_590 ~= 8 and L1_590 ~= 120 then
    L2_591 = false
    return L2_591
  end
  L2_591 = A0_589.work
  L2_591 = L2_591.rootWidget
  L2_591 = L2_591[3]
  if L2_591 == nil then
    A0_589:openMainMenuRootWidget("MapNavigationWidget", nil, 0)
  elseif L2_591:getWindowName() == "MapNavigationWidget" then
    A0_589:closeWidgetDirect(L2_591)
  end
  return true
end
L0_0.processCommandMap = L1_1
L0_0 = DesktopWidget
function L1_1(A0_592)
  worldMaster:_getMyPlayer():postMapOpen()
end
L0_0.postMapOpen = L1_1
L0_0 = DesktopWidget
function L1_1(A0_593, A1_594, A2_595, A3_596, A4_597, A5_598, A6_599)
  if A0_593:getWidget(3, "MapNavigationWidget") == nil then
    return false
  end
  A0_593:getWidget(3, "MapNavigationWidget"):setMapNavigationWidgetMarkerData(A1_594, A2_595, A3_596, A4_597, A5_598, A6_599)
  return true
end
L0_0.setMapNavigationWidgetMarkerData = L1_1
L0_0 = DesktopWidget
function L1_1(A0_600, A1_601)
  local L2_602
  L2_602 = A0_600.work
  L2_602 = L2_602.cutsceneMapFlag
  if L2_602 == true then
    L2_602 = false
    return L2_602
  end
  L2_602 = false
  if A0_600:isCutSceneMode() == true then
    L2_602 = A0_600:openRootWidget(11, "MapNavigationWidget", nil, true, 2, A1_601)
    if L2_602 == true then
      A0_600.work.cutsceneMapFlag = true
    end
  else
  end
  return L2_602
end
L0_0.openMapForCutScene = L1_1
L0_0 = DesktopWidget
function L1_1(A0_603)
  local L1_604
  L1_604 = A0_603.work
  L1_604 = L1_604.cutsceneMapFlag
  if L1_604 == false then
    L1_604 = false
    return L1_604
  end
  L1_604 = false
  if A0_603:isCutSceneMode() == true then
    L1_604 = A0_603:closeWidget(11, "MapNavigationWidget")
    if L1_604 == false then
      A0_603:cancelWidgetCommand()
    end
    A0_603.work.cutsceneMapFlag = false
  else
  end
  return L1_604
end
L0_0.closeMapForCutScene = L1_1
L0_0 = DesktopWidget
function L1_1(A0_605, ...)
  A0_605:getStaticWidget(10):setMiniMapWidgetMarkerData(...)
end
L0_0.setMiniMapWidgetMarkerData = L1_1
L0_0 = DesktopWidget
function L1_1(A0_607, A1_608)
  local L2_609
  L2_609 = false
  if A0_607:checkActor(A0_607.work.bazaarTargetActor) == nil then
    return L2_609
  end
  A0_607.work.bazaarActor = A0_607:checkActor(A0_607.work.bazaarTargetActor)
  if A1_608 == 1 then
    L2_609 = A0_607:openRootWidget(4, "BazaarListWidget", nil, true, true)
    if L2_609 == true then
      if A0_607:getBazaarActor() ~= nil and A0_607:getBazaarActor() ~= worldMaster:_getMyPlayer() then
        A0_607:getBazaarActor():updateItemPackage(8)
      end
      A0_607.work.bazaarUpdateTime = 0
      A0_607:waitWidgetCreateYield(4)
      A0_607:updateBazaarPackage()
      while A0_607:getWidget(4, "BazaarListWidget") ~= nil do
        A0_607:_wait(0.1)
      end
    else
    end
  else
    if A1_608 == 2 then
      do break end
      break
    else
    end
  end
  return L2_609
end
L0_0.orderBazaarWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_610)
  A0_610:openWidgetYield(5, "Ask/JournalListWidget", nil, nil, false, 7)
end
L0_0.openCutSceneReplaySelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_611)
  A0_611:closeWidget(5, "Ask/JournalListWidget")
end
L0_0.closeCutSceneReplaySelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_612)
  local L1_613, L2_614
  L1_613 = false
  L2_614 = A0_612.getWidget
  L2_614 = L2_614(A0_612, 5, "Ask/JournalListWidget")
  if L2_614 ~= nil then
    L2_614:resetBaseAskResult()
    L2_614:show(true, true)
    L1_613 = A0_612:selectWidgetYield(L2_614)
  end
  if L1_613 == false then
    return false
  end
  L2_614:hide(true, true)
  return true, L2_614:getAskResult()
end
L0_0.selectCutSceneReplaySelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_615, A1_616, A2_617)
  local L3_618, L4_619
  if A2_617 == 0 then
    L4_619 = A0_615
    L3_618 = A0_615.openWidgetYield
    L3_618(L4_619, 4, "Ask/JournalListWidget", nil, nil, false, 2, A1_616)
  end
  L4_619 = A0_615
  L3_618 = A0_615.selectEventModeWidgetYield
  L4_619 = L3_618(L4_619, "Ask/JournalListWidget")
  if L3_618 == false then
    L4_619 = 0
  end
  return L3_618, L4_619
end
L0_0.askActiveGuildleveSelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_620, A1_621, A2_622, A3_623, A4_624, A5_625, A6_626, A7_627, A8_628)
  local L9_629, L10_630, L11_631, L12_632
  L9_629 = false
  L10_630 = false
  L11_631 = A0_620.work
  L11_631 = L11_631.rootWidget
  L11_631 = L11_631[4]
  L12_632 = A0_620.openWidgetYield
  L12_632 = L12_632(A0_620, 4, "Ask/JournalDetailWidget", nil, L11_631, false, 2, 1, A1_621)
  if L12_632 ~= nil then
    L12_632:setDetailData(nil, A2_622, A3_623, A4_624, A5_625, A6_626, A7_627, A8_628)
    if A0_620:selectWidgetYield(L12_632, true) == true and L12_632:getAskResult() == 1 then
      L10_630 = true
    end
    if L10_630 == true then
      A0_620:closeWidgetDirect(L11_631)
    else
      A0_620:closeWidgetDirect(L12_632)
    end
    L9_629 = true
  end
  return L9_629, L10_630
end
L0_0.askActiveGuildleveDetailWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_633)
  return A0_633:askEventModeWidgetYield("Ask/JournalListWidget", 2, 3)
end
L0_0.askPassiveGuildleveSelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_634)
  return A0_634:askEventModeWidgetYield("Ask/JournalListWidget", 1, 6)
end
L0_0.askPassiveGuildleveReleaseWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_635)
  return nil
end
L0_0.askSelectReleaseQuestWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_636, A1_637)
  if A0_636:askEventModeWidgetYield("Ask/QuestDetailWidget", 1, 3, A1_637) ~= true then
    return nil
  end
  return A0_636:askEventModeWidgetYield("Ask/QuestDetailWidget", 1, 3, A1_637)
end
L0_0.askQuestDetailWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_638, A1_639, A2_640)
  local L3_641, L4_642, L5_643, L6_644, L7_645, L8_646, L9_647, L10_648, L11_649, L12_650, L13_651, L14_652
  L3_641 = worldMaster
  L4_642 = L3_641
  L3_641 = L3_641._getMyPlayer
  L3_641 = L3_641(L4_642)
  if A2_640 == nil then
    L4_642 = false
    return L4_642
  end
  L4_642 = 0
  L5_643 = A1_639
  if L5_643 == 1 then
  else
  end
  if L5_643 == 12 then
    L6_644 = L3_641.getScenarioQuestLength
    L6_644 = L6_644(L7_645)
    for L10_648 = 1, L6_644 do
      L12_650 = L3_641
      L11_649 = L3_641.getScenarioQuest
      L13_651 = L10_648
      L11_649 = L11_649(L12_650, L13_651)
      if L11_649 ~= nil then
        L13_651 = A2_640
        L12_650 = A2_640.setInitialData
        L14_652 = L10_648
        L12_650(L13_651, L14_652, L11_649:getQuestId(), false, false)
        L4_642 = L4_642 + 1
      end
    end
    break
  elseif L5_643 == 2 then
  else
  end
  if L5_643 == 5 then
    L6_644 = L3_641.getGuildleveIndexMax
    L6_644 = L6_644(L7_645)
    for L10_648 = 1, L6_644 do
      L12_650 = L3_641
      L11_649 = L3_641.getGuildleveID
      L13_651 = L10_648
      L11_649 = L11_649(L12_650, L13_651)
      if L11_649 ~= 0 then
        L13_651 = L3_641
        L12_650 = L3_641.isDoneGuildleveById
        L14_652 = L11_649
        L12_650 = L12_650(L13_651, L14_652)
        L14_652 = L3_641
        L13_651 = L3_641.isCheckedGuildleveById
        L13_651 = L13_651(L14_652, L11_649)
        L14_652 = nil
        if A1_639 == 5 and A2_640:getArgActor() ~= nil then
          L14_652 = A2_640:getArgActor():canUseGuildleve(L3_641, L11_649)
        end
        A2_640:setInitialData(L10_648, L11_649, L12_650, L13_651, L14_652)
        L4_642 = L4_642 + 1
      end
    end
    break
  elseif L5_643 == 3 then
  else
  end
  if L5_643 == 7 then
    L6_644 = L3_641.getGuildleveQuestLength
    L6_644 = L6_644(L7_645)
    for L10_648 = 1, L6_644 do
      L12_650 = L3_641
      L11_649 = L3_641.getGuildleveQuest
      L13_651 = L10_648
      L11_649 = L11_649(L12_650, L13_651)
      if L11_649 ~= nil then
        L13_651 = L11_649
        L12_650 = L11_649.getQuestId
        L12_650 = L12_650(L13_651)
        L14_652 = A2_640
        L13_651 = A2_640.setInitialData
        L13_651(L14_652, L10_648, L12_650, nil, nil)
        L4_642 = L4_642 + 1
      end
    end
    break
  elseif L5_643 == 4 then
  else
  end
  if L5_643 == 8 then
    L6_644 = L3_641.getScenarioQuestLength
    L6_644 = L6_644(L7_645)
    for L10_648 = 1, L6_644 do
      L12_650 = L3_641
      L11_649 = L3_641.getScenarioQuest
      L13_651 = L10_648
      L11_649 = L11_649(L12_650, L13_651)
      if L11_649 ~= nil then
        L13_651 = L11_649
        L12_650 = L11_649.getQuestId
        L12_650 = L12_650(L13_651)
        L14_652 = A2_640
        L13_651 = A2_640.setInitialData
        L13_651(L14_652, L10_648, L12_650, nil, nil)
        L4_642 = L4_642 + 1
      end
    end
    break
  elseif L5_643 == 9 then
  else
    if L5_643 == 0 then
  end
  if L4_642 ~= 0 then
    L6_644 = A2_640
    L5_643 = A2_640.setJournalContentsLineNumber
    L5_643(L6_644, L7_645)
  end
end
L0_0.orderUpdateJournalListWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_653, A1_654, A2_655, A3_656, A4_657)
  local L5_658, L6_659, L7_660, L8_661
  L5_658 = worldMaster
  L6_659 = L5_658
  L5_658 = L5_658._getMyPlayer
  L5_658 = L5_658(L6_659)
  L6_659 = false
  L7_660 = A1_654
  if L7_660 == 1 then
    L8_661 = L5_658.getSystemCommand
    L8_661 = L8_661(L5_658, 24212)
    if L8_661 ~= nil then
      L6_659 = L5_658:command(L8_661, "activegl", A3_656, nil, nil, nil)
      do break end
      elseif L7_660 == 2 then
      else
      end
      if L7_660 == 3 then
        L8_661 = L5_658.getSystemCommand
        L8_661 = L8_661(L5_658, 24211)
        if L8_661 ~= nil then
          L6_659 = L5_658:command(L8_661, A2_655, A4_657, nil, nil, nil)
        else
        end
      else
      end
    else
    end
  return L6_659
end
L0_0.executeCommandJournalDetailInfo = L1_1
L0_0 = DesktopWidget
function L1_1(A0_662)
  local L1_663, L2_664, L3_665
  L1_663 = worldMaster
  L2_664 = L1_663
  L1_663 = L1_663._getMyPlayer
  L1_663 = L1_663(L2_664)
  L2_664 = false
  L3_665 = L1_663.getSystemCommand
  L3_665 = L3_665(L1_663, 24212)
  if L3_665 ~= nil then
    L2_664 = L1_663:command(L3_665, "glHist")
  end
  return L2_664
end
L0_0.executeCommandJournalHistoryInfo = L1_1
L0_0 = DesktopWidget
function L1_1(A0_666, A1_667, A2_668, A3_669)
  local L4_670, L5_671, L6_672
  L4_670 = worldMaster
  L5_671 = L4_670
  L4_670 = L4_670._getMyPlayer
  L4_670 = L4_670(L5_671)
  L6_672 = L4_670
  L5_671 = L4_670.getSystemCommand
  L5_671 = L5_671(L6_672, 24241)
  L6_672 = false
  if A1_667 == 1 then
  elseif A1_667 == 2 then
  else
  end
  if A1_667 == 3 and L5_671 ~= nil then
    L6_672 = L4_670:command(L5_671, A2_668, A3_669, nil, nil)
    break
  else
  end
  return L6_672
end
L0_0.executeJournalCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_673, A1_674, A2_675, ...)
  local L4_677
  L4_677 = A0_673:getWidget(3, "Ask/JournalDetailWidget")
  if L4_677 ~= nil then
    L4_677:setDetailData(...)
  end
  L4_677 = A0_673:getWidget(3, "Ask/QuestDetailWidget")
  if L4_677 ~= nil then
    L4_677:setDetailData(...)
  end
end
L0_0.processUpdateJournalDetailWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_678, A1_679, A2_680)
  local L3_681, L4_682, L5_683
  L3_681 = 0
  L4_682 = 0
  L5_683 = A1_679
  if L5_683 == 1 then
    L3_681, L4_682 = A0_678:getActiveGLIcon(A2_680)
    break
  else
  end
  if L5_683 == 2 then
    L3_681, L4_682 = A0_678:getLocalGLIconID(A2_680)
    break
  else
  end
  if L5_683 == 3 then
    L3_681, L4_682 = A0_678:getQuestIconID(A2_680)
    do break end
    break
  else
  end
  L5_683 = L3_681
  return L5_683, L4_682
end
L0_0.getJournalIconID = L1_1
L0_0 = DesktopWidget
function L1_1(A0_684, A1_685)
  local L2_686, L3_687
  if A1_685 >= 1000 and A1_685 <= 1099 then
    L2_686 = 535
    L3_687 = 78423
    return L2_686, L3_687
  elseif A1_685 >= 1100 and A1_685 <= 1199 then
    L2_686 = 536
    L3_687 = 78424
    return L2_686, L3_687
  elseif A1_685 >= 1200 and A1_685 <= 1299 then
    L2_686 = 537
    L3_687 = 78425
    return L2_686, L3_687
  elseif A1_685 >= 3200 and A1_685 <= 3399 then
    L2_686 = 597
    L3_687 = 78471
    return L2_686, L3_687
  elseif A1_685 >= 4000 and A1_685 <= 4199 then
    L2_686 = 597
    L3_687 = 78471
    return L2_686, L3_687
  elseif A1_685 >= 4800 and A1_685 <= 4999 then
    L2_686 = 597
    L3_687 = 78471
    return L2_686, L3_687
  elseif A1_685 >= 3400 and A1_685 <= 3599 then
    L2_686 = 598
    L3_687 = 78472
    return L2_686, L3_687
  elseif A1_685 >= 4200 and A1_685 <= 4399 then
    L2_686 = 598
    L3_687 = 78472
    return L2_686, L3_687
  elseif A1_685 >= 5000 and A1_685 <= 5199 then
    L2_686 = 598
    L3_687 = 78472
    return L2_686, L3_687
  elseif A1_685 >= 3600 and A1_685 <= 3799 then
    L2_686 = 599
    L3_687 = 78473
    return L2_686, L3_687
  elseif A1_685 >= 4400 and A1_685 <= 4599 then
    L2_686 = 599
    L3_687 = 78473
    return L2_686, L3_687
  elseif A1_685 >= 5200 and A1_685 <= 5399 then
    L2_686 = 599
    L3_687 = 78473
    return L2_686, L3_687
  elseif A1_685 >= 20800 and A1_685 <= 21599 then
    L2_686 = 527
    L3_687 = 78474
    return L2_686, L3_687
  elseif A1_685 >= 21600 and A1_685 <= 22399 then
    L2_686 = 529
    L3_687 = 78475
    return L2_686, L3_687
  elseif A1_685 >= 22400 and A1_685 <= 23159 then
    L2_686 = 528
    L3_687 = 78476
    return L2_686, L3_687
  end
  L2_686 = 596
  L3_687 = 78477
  return L2_686, L3_687
end
L0_0.getActiveGLIcon = L1_1
L0_0 = DesktopWidget
function L1_1(A0_688, A1_689)
  local L2_690, L3_691, L4_692, L5_693, L6_694, L7_695, L8_696, L9_697, L10_698, L11_699, L12_700, L13_701
  L2_690 = worldMaster
  L3_691 = L2_690
  L2_690 = L2_690._getMyPlayer
  L2_690 = L2_690(L3_691)
  L4_692 = L2_690
  L3_691 = L2_690.getGuildleveQuestLength
  L3_691 = L3_691(L4_692)
  L4_692 = 0
  L5_693 = 0
  for L9_697 = 1, L3_691 do
    L11_699 = L2_690
    L10_698 = L2_690.getGuildleveQuest
    L12_700 = L9_697
    L10_698 = L10_698(L11_699, L12_700)
    if L10_698 ~= nil then
      L12_700 = L10_698
      L11_699 = L10_698.getQuestId
      L11_699 = L11_699(L12_700)
      if A1_689 == L11_699 then
        L13_701 = L10_698
        L12_700 = L10_698.getQuestData
        L12_700 = L12_700(L13_701, 52)
        L13_701 = L12_700
        if L13_701 == 329 then
          L4_692 = 607
          L5_693 = 78478
          break
        else
        end
        if L13_701 == 330 then
          L4_692 = 600
          L5_693 = 78479
          break
        else
        end
        if L13_701 == 331 then
          L4_692 = 601
          L5_693 = 78480
          break
        else
        end
        if L13_701 == 332 then
          L4_692 = 604
          L5_693 = 78481
          break
        else
        end
        if L13_701 == 333 then
          L4_692 = 606
          L5_693 = 78482
          break
        else
        end
        if L13_701 == 334 then
          L4_692 = 603
          L5_693 = 78483
          break
        else
        end
        if L13_701 == 335 then
          L4_692 = 605
          L5_693 = 78484
          break
        else
        end
        if L13_701 == 336 then
          L4_692 = 602
          L5_693 = 78485
        end
      else
      end
    else
    end
  end
  return L6_694, L7_695
end
L0_0.getLocalGLIconID = L1_1
L0_0 = DesktopWidget
function L1_1(A0_702, A1_703)
  local L2_704, L3_705
  if A1_703 >= 110001 and A1_703 <= 110059 then
    L2_704 = 104
    L3_705 = 78404
    return L2_704, L3_705
  end
  if A1_703 >= 110821 and A1_703 <= 110824 then
    L2_704 = 296
    L3_705 = 2941
    return L2_704, L3_705
  end
  if A1_703 >= 110600 and A1_703 <= 110971 then
    L2_704 = 222
    L3_705 = 78405
    return L2_704, L3_705
  end
  if A1_703 >= 110080 and A1_703 <= 110099 then
    L2_704 = 203
    L3_705 = 78406
    return L2_704, L3_705
  end
  if A1_703 >= 110060 and A1_703 <= 110079 then
    L2_704 = 206
    L3_705 = 78407
    return L2_704, L3_705
  end
  if A1_703 >= 110100 and A1_703 <= 110119 then
    L2_704 = 204
    L3_705 = 78408
    return L2_704, L3_705
  end
  if A1_703 >= 110180 and A1_703 <= 110199 then
    L2_704 = 205
    L3_705 = 78409
    return L2_704, L3_705
  end
  if A1_703 >= 110160 and A1_703 <= 110179 then
    L2_704 = 207
    L3_705 = 78410
    return L2_704, L3_705
  end
  if A1_703 >= 110260 and A1_703 <= 110279 then
    L2_704 = 234
    L3_705 = 78411
    return L2_704, L3_705
  end
  if A1_703 >= 110240 and A1_703 <= 110259 then
    L2_704 = 233
    L3_705 = 78412
    return L2_704, L3_705
  end
  if A1_703 >= 110300 and A1_703 <= 110319 then
    L2_704 = 212
    L3_705 = 78413
    return L2_704, L3_705
  end
  if A1_703 >= 110320 and A1_703 <= 110339 then
    L2_704 = 209
    L3_705 = 78414
    return L2_704, L3_705
  end
  if A1_703 >= 110360 and A1_703 <= 110379 then
    L2_704 = 213
    L3_705 = 78415
    return L2_704, L3_705
  end
  if A1_703 >= 110380 and A1_703 <= 110399 then
    L2_704 = 211
    L3_705 = 78416
    return L2_704, L3_705
  end
  if A1_703 >= 110400 and A1_703 <= 110419 then
    L2_704 = 210
    L3_705 = 78417
    return L2_704, L3_705
  end
  if A1_703 >= 110420 and A1_703 <= 110439 then
    L2_704 = 215
    L3_705 = 78418
    return L2_704, L3_705
  end
  if A1_703 >= 110440 and A1_703 <= 110459 then
    L2_704 = 214
    L3_705 = 78419
    return L2_704, L3_705
  end
  if A1_703 >= 110460 and A1_703 <= 110479 then
    L2_704 = 217
    L3_705 = 78420
    return L2_704, L3_705
  end
  if A1_703 >= 110480 and A1_703 <= 110499 then
    L2_704 = 218
    L3_705 = 78421
    return L2_704, L3_705
  end
  if A1_703 >= 110500 and A1_703 <= 110519 then
    L2_704 = 219
    L3_705 = 78422
    return L2_704, L3_705
  end
  if A1_703 >= 111401 and A1_703 <= 111599 then
    L2_704 = 527
    L3_705 = 78450
    return L2_704, L3_705
  end
  if A1_703 >= 111601 and A1_703 <= 111799 then
    L2_704 = 528
    L3_705 = 78452
    return L2_704, L3_705
  end
  if A1_703 >= 111801 and A1_703 <= 111999 then
    L2_704 = 529
    L3_705 = 78451
    return L2_704, L3_705
  end
  if A1_703 >= 111200 and A1_703 <= 111219 then
    L2_704 = 941
    L3_705 = 78464
    return L2_704, L3_705
  end
  if A1_703 >= 111220 and A1_703 <= 111239 then
    L2_704 = 940
    L3_705 = 78465
    return L2_704, L3_705
  end
  if A1_703 >= 111240 and A1_703 <= 111259 then
    L2_704 = 944
    L3_705 = 78466
    return L2_704, L3_705
  end
  if A1_703 >= 111260 and A1_703 <= 111279 then
    L2_704 = 945
    L3_705 = 78467
    return L2_704, L3_705
  end
  if A1_703 >= 111280 and A1_703 <= 111299 then
    L2_704 = 939
    L3_705 = 78468
    return L2_704, L3_705
  end
  if A1_703 >= 111300 and A1_703 <= 111319 then
    L2_704 = 943
    L3_705 = 78469
    return L2_704, L3_705
  end
  if A1_703 >= 111320 and A1_703 <= 111339 then
    L2_704 = 942
    L3_705 = 78470
    return L2_704, L3_705
  end
  if A1_703 >= 11082001 and A1_703 <= 11082020 then
    L2_704 = 242
    L3_705 = 5107
    return L2_704, L3_705
  end
  L2_704 = 0
  L3_705 = 0
  return L2_704, L3_705
end
L0_0.getQuestIconID = L1_1
L0_0 = DesktopWidget
function L1_1(A0_706)
  local L1_707, L2_708, L3_709, L4_710, L5_711, L6_712, L7_713
  L1_707 = worldMaster
  L2_708 = L1_707
  L1_707 = L1_707._getMyPlayer
  L1_707 = L1_707(L2_708)
  L2_708 = 0
  L3_709 = L1_707.getScenarioQuestLength
  L3_709 = L3_709(L4_710)
  for L7_713 = 1, L3_709 do
    if L1_707:getScenarioQuest(L7_713) ~= nil then
      L2_708 = L2_708 + 1
    end
  end
  return L4_710, L5_711
end
L0_0.getQuestCount = L1_1
L0_0 = DesktopWidget
function L1_1(A0_714, A1_715, A2_716, A3_717, ...)
  do break end
  do return end
  if A0_714:getStaticWidget(9):isShow() == false then
    return
  end
  A0_714:getStaticWidget(9):setCaptionText(A2_716, A3_717, ...)
end
L0_0.showCaption = L1_1
L0_0 = DesktopWidget
function L1_1(A0_719)
  do break end
  do return end
  A0_719:getStaticWidget(9):removeCaptionText()
end
L0_0.hideCaption = L1_1
L0_0 = DesktopWidget
function L1_1(A0_720, A1_721)
  A0_720:getStaticWidget(12):setArgActor(A1_721)
end
L0_0.showCutSceneSkip = L1_1
L0_0 = DesktopWidget
function L1_1(A0_722)
  A0_722:clearCutSceneSkip()
end
L0_0.hideCutSceneSkip = L1_1
L0_0 = DesktopWidget
function L1_1(A0_723)
  A0_723:getStaticWidget(12):clear()
end
L0_0.clearCutSceneSkip = L1_1
L0_0 = DesktopWidget
function L1_1(A0_724)
  local L1_725, L2_726, L3_727, L4_728, L5_729, L6_730
  L1_725 = 0
  do break end
  do return L1_725 end
  for L5_729 = 1, 4 do
    L6_730 = A0_724.work
    L6_730 = L6_730.widgetOwner
    L6_730 = L6_730[L5_729]
    if L6_730 == nil then
      L1_725 = L5_729
      break
    end
  end
  return L1_725
end
L0_0.getFreeContentsIndex = L1_1
L0_0 = DesktopWidget
function L1_1(A0_731, A1_732, A2_733)
  local L3_734, L4_735, L5_736, L6_737, L7_738
  L3_734 = 0
  do break end
  do return L3_734 end
  for L7_738 = 1, 4 do
    if A0_731:isValidContentsOwner(L7_738, A1_732) == true and A0_731.work.contentsType[L7_738] == A2_733 then
      L3_734 = L7_738
      break
    end
  end
  return L3_734
end
L0_0.getContentsIndex = L1_1
L0_0 = DesktopWidget
function L1_1(A0_739, A1_740)
  local L2_741, L3_742, L4_743, L5_744
  for L5_744 = 1, 4 do
    A0_739:closeContentsWidget(L5_744, A1_740, nil)
  end
end
L0_0.closeAllOwnedContentWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_745, A1_746, A2_747, A3_748)
  local L4_749, L5_750
  if L4_749 == nil then
    L5_750 = -1
    return L5_750, 0, 0
  end
  L5_750 = worldMaster
  L5_750 = L5_750._getMyPlayer
  L5_750 = L5_750(L5_750)
  return L4_749:getShopSellingItemDetail(L5_750, A1_746, A2_747, A3_748)
end
L0_0.getShopSellingItemInfo = L1_1
L0_0 = DesktopWidget
function L1_1(A0_751, A1_752, A2_753, A3_754)
  local L4_755, L5_756
  if L4_755 == nil then
    L5_756 = -1
    return L5_756
  end
  L5_756 = worldMaster
  L5_756 = L5_756._getMyPlayer
  L5_756 = L5_756(L5_756)
  return L4_755:getShopSellingItemDetail(L5_756, A1_752, A2_753, A3_754)
end
L0_0.getShopSellingItemPrice = L1_1
L0_0 = DesktopWidget
function L1_1(A0_757)
  do break end
  do return end
  A0_757:closeWidget(4, nil)
  A0_757:closeWidget(5, nil)
end
L0_0.closeAllEventModeWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_758, A1_759, A2_760, A3_761, A4_762)
  local L5_763, L6_764, L7_765, L8_766, L9_767, L10_768, L11_769, L12_770, L13_771
  L5_763 = false
  L6_764 = 0
  L7_765 = nil
  L8_766 = {}
  L9_767 = A0_758.getWidget
  L9_767 = L9_767(L10_768, L11_769, L12_770)
  if L9_767 ~= nil then
    if A1_759 ~= nil then
      if A1_759 >= 0 then
        L13_771 = A2_760
        L10_768(L11_769, L12_770, L13_771, A3_761)
      end
      L13_771 = A4_762
      L13_771 = L12_770(L13_771)
      L10_768(L11_769, L12_770, L13_771, L12_770(L13_771))
      if A1_759 == -2 then
        L10_768(L11_769)
      end
    else
      L10_768(L11_769)
    end
    L13_771 = true
    L5_763 = L10_768
    if L5_763 == true then
      L7_765 = L11_769
      L6_764 = L10_768
      if L6_764 ~= 0 then
        for L13_771 = 1, 8 do
          L8_766[L13_771] = L9_767:getCraftItems(L13_771)
        end
      end
    end
  end
  L13_771 = L8_766
  return L10_768, L11_769, L12_770, L13_771
end
L0_0.selectCraftItemSelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_772, ...)
  local L2_774, L3_775
  L2_774 = 0
  L3_775 = A0_772.getWidget
  L3_775 = L3_775(A0_772, 4, "CraftStartWidget")
  if L3_775 ~= nil then
    L3_775:setRecipeList(...)
    if A0_772:selectWidgetYield(L3_775) == true then
      L2_774 = L3_775:getRecipeIndex()
    end
  end
  return L2_774
end
L0_0.selectCraftRecipeSelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_776, A1_777, A2_778, A3_779, A4_780, A5_781, A6_782, A7_783, A8_784)
  local L9_785, L10_786, L11_787, L12_788
  L9_785 = false
  L11_787 = A0_776
  L10_786 = A0_776.getWidget
  L12_788 = 4
  L10_786 = L10_786(L11_787, L12_788, "CraftStartWidget")
  if L10_786 ~= nil then
    L11_787 = nil
    L12_788 = L10_786.getFacility
    L12_788 = L12_788(L10_786)
    if L10_786:isRecipeMode() == true then
      L11_787 = A0_776:openWidgetYield(4, "CraftRecipeWidget", nil, L10_786, false, A1_777, A2_778, A3_779, A4_780, A5_781, A6_782, A7_783, A8_784, L12_788)
      if L11_787 ~= nil then
        L10_786:clearOperation()
        L11_787:show()
      end
    else
      L11_787 = A0_776:getWidget(4, "CraftRecipeWidget")
      L11_787:setRecipeData(A1_777, A2_778, A3_779, A4_780, A5_781, A6_782, A7_783, A8_784, L12_788)
    end
    if L11_787 ~= nil and A0_776:selectWidgetYield(L10_786, true) == true then
      L9_785 = L10_786:getRecipeDecision()
    end
  end
  return L9_785
end
L0_0.selectCraftRecipeDetailWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_789, A1_790, A2_791, A3_792, A4_793, A5_794, A6_795, A7_796)
  local L8_797, L9_798, L10_799, L11_800, L12_801, L13_802, L14_803, L15_804, L16_805
  L8_797 = false
  L9_798 = 0
  L10_799 = nil
  L11_800 = {}
  L12_801 = A0_789.openWidgetYield
  L16_805 = nil
  L12_801 = L12_801(L13_802, L14_803, L15_804, L16_805, nil, false)
  if L12_801 ~= nil then
    L16_805 = A2_791
    L13_802(L14_803, L15_804, L16_805, A3_792, A4_793, A5_794, A6_795, A7_796)
    L16_805 = true
    L8_797 = L13_802
    if L8_797 == true then
      L10_799 = L14_803
      L9_798 = L13_802
      if L9_798 ~= 0 then
        for L16_805 = 1, 8 do
          L11_800[L16_805] = L12_801:getCraftItems(L16_805)
        end
      end
    end
    L13_802(L14_803, L15_804)
  end
  L16_805 = L11_800
  return L13_802, L14_803, L15_804, L16_805
end
L0_0.askCraftRepairWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_806, A1_807, A2_808)
  local L3_809, L4_810, L5_811, L6_812
  L3_809 = false
  L4_810 = 0
  L6_812 = A0_806
  L5_811 = A0_806.getWidget
  L5_811 = L5_811(L6_812, 4, "CraftProgressWidget")
  if L5_811 ~= nil then
    L6_812 = {}
    for _FORV_10_ = 1, 10 do
      if A1_807 < _FORV_10_ then
        L6_812[_FORV_10_] = 0
      else
        L6_812[_FORV_10_] = A2_808[_FORV_10_]
      end
    end
    L5_811:setCommand(unpack(L6_812))
    L3_809 = A0_806:selectWidgetYield(L5_811, true)
    if L3_809 == true then
      L4_810 = L5_811:getCommand()
    end
  end
  L6_812 = L3_809
  return L6_812, L4_810
end
L0_0.selectCraftProgressWidgetDisplay = L1_1
L0_0 = DesktopWidget
function L1_1(A0_813, A1_814, A2_815, A3_816, A4_817, A5_818, A6_819, A7_820, A8_821)
  if A0_813:getEventModeWidget("CraftProgressWidget") == nil then
    return false
  end
  A0_813:getEventModeWidget("CraftProgressWidget"):updateProcess(A1_814, A2_815, A3_816, A4_817, A5_818, A6_819, A7_820, A8_821)
  return true
end
L0_0.orderCraftProgressWidgetUpdate = L1_1
L0_0 = DesktopWidget
function L1_1(A0_822, A1_823, ...)
  if A0_822:openWidget(4, "TradeWidget", nil, nil, true) == false then
    return false
  end
  A0_822:waitWidgetCreateYield(4)
  return true
end
L0_0.dictateOpenTradeWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_825, A1_826)
  return A0_825:closeWidget(4, "TradeWidget")
end
L0_0.dictateCloseTradeWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_827, A1_828)
  if A0_827:getWidget(4, "TradeWidget") == nil then
    return nil
  end
  if A0_827:getWidget(4, "TradeWidget"):processWaitCallFunction() == false then
    return false
  end
  return true, A0_827:getWidget(4, "TradeWidget"):getAskResult()
end
L0_0.checkReplyTradeWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_829, A1_830, ...)
  if A0_829:getWidget(4, "TradeWidget") == nil then
    return false
  end
  A0_829:getWidget(4, "TradeWidget"):dictateNoticeTradeWidget(...)
  return true
end
L0_0.dictateNoticeTradeWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_832, A1_833, A2_834)
  local L3_835, L4_836, L5_837
  L3_835 = worldMaster
  L4_836 = L3_835
  L3_835 = L3_835._getMyPlayer
  L3_835 = L3_835(L4_836)
  L5_837 = A0_832
  L4_836 = A0_832.getWidget
  L4_836 = L4_836(L5_837, 4, "TradeWidget")
  if L4_836 == nil then
    return
  end
  L5_837 = A1_833._getTradingItem
  L5_837 = L5_837(A1_833, A2_834)
  if A1_833 == L3_835 then
    L4_836:processUpdatePlayerTradingItem(A2_834, L5_837)
  else
    L4_836:processUpdateTradingItem(A2_834, L5_837)
  end
end
L0_0.processUpdateTradingItem = L1_1
L0_0 = DesktopWidget
function L1_1(A0_838, A1_839, A2_840, ...)
  if A0_838:checkActor(A1_839) == nil then
    return
  end
  A0_838:getStaticWidget(8):setInitialData(1, A1_839, A2_840, ...)
  return A0_838:getStaticWidget(8):show()
end
L0_0.openPublicInformDialogWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_842, A1_843, A2_844, ...)
  if A0_842:checkActor(A1_843) == nil then
    return
  end
  A0_842:getStaticWidget(8):setInitialData(2, A1_843, A2_844, ...)
  return A0_842:getStaticWidget(8):show()
end
L0_0.openPublicInformLongDialogWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_846, A1_847, A2_848, ...)
  if A0_846:checkActor(A1_847) == nil then
    return
  end
  A0_846:getStaticWidget(8):setInitialData(3, A1_847, A2_848, ...)
  return A0_846:getStaticWidget(8):show()
end
L0_0.openCautionInformDialogWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_850, A1_851, A2_852, ...)
  A0_850:getStaticWidget(19):setInitialData(A1_851, A2_852, ...)
  A0_850:getStaticWidget(19):show()
end
L0_0.openWarningInformDialogWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_854, A1_855)
  local L2_856, L3_857
  L3_857 = A0_854
  L2_856 = A0_854.isWidgetExec
  L2_856 = L2_856(L3_857, 13)
  if L2_856 == true then
    L3_857 = A0_854
    L2_856 = A0_854.closeWidget
    L2_856(L3_857, 13, nil)
  end
  L2_856, L3_857 = nil, nil
  if A1_855 == 1 then
    L2_856 = "RaidDungeonStartWidget"
    break
  else
  end
  if A1_855 == 2 then
    L2_856 = "RaidDungeonSuccessWidget2"
    break
  else
  end
  if A1_855 == 3 then
    L2_856 = "RaidDungeonFailureWidget"
    break
  else
  end
  if A1_855 == 4 then
    L2_856 = "GrandCompanyRecruitWidget1"
    L3_857 = 2130706533
    break
  else
  end
  if A1_855 == 5 then
    L2_856 = "GrandCompanyRecruitWidget2"
    L3_857 = 2130706533
    break
  else
  end
  if A1_855 == 6 then
    L2_856 = "GrandCompanyRecruitWidget3"
    L3_857 = 2130706533
    break
  else
  end
  if A1_855 == 13 then
    L2_856 = "DutyAbandonedWidget"
    break
  else
  end
  if A1_855 == 14 then
    L2_856 = "DutyCommencedWidget1"
    break
  else
  end
  if A1_855 == 15 then
    L2_856 = "DutyCommencedWidget2"
    break
  else
  end
  if A1_855 == 16 then
    L2_856 = "DutyCommencedWidget3"
    break
  else
  end
  if A1_855 == 17 then
    L2_856 = "DutyCompleteWidget1"
    break
  else
  end
  if A1_855 == 18 then
    L2_856 = "DutyCompleteWidget2"
    break
  else
  end
  if A1_855 == 19 then
    L2_856 = "DutyCompleteWidget3"
    break
  else
  end
  if A1_855 == 20 then
    L2_856 = "DutyFailedWidget"
    break
  else
  end
  do return end
  A0_854:openWidget(13, "SplashEffectWidget", L2_856, nil, true, L3_857)
end
L0_0.openPublicEffectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_858, A1_859, A2_860, A3_861, A4_862, ...)
  local L6_864, L7_865, L8_866, L9_867, L10_868, L11_869, L12_870, L13_871, L14_872, L15_873, L16_874, L17_875
  L7_865 = A0_858
  L6_864 = A0_858.openWidget
  L8_866 = 17
  L9_867 = "JobQuestInformationWidget"
  L10_868, L11_869 = nil, nil
  L12_870 = true
  L13_871 = A1_859
  L14_872 = A2_860
  L15_873 = A3_861
  L16_874 = A4_862
  L17_875 = ...
  return L6_864(L7_865, L8_866, L9_867, L10_868, L11_869, L12_870, L13_871, L14_872, L15_873, L16_874, L17_875)
end
L0_0.openJobQuestInformationWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_876, A1_877, A2_878, A3_879, ...)
  local L5_881, L6_882, L7_883, L8_884, L9_885, L10_886, L11_887, L12_888, L13_889, L14_890, L15_891, L16_892
  L6_882 = A0_876
  L5_881 = A0_876.openWidget
  L7_883 = 17
  L8_884 = "Ask/QuestRewardWidget"
  L9_885, L10_886 = nil, nil
  L11_887 = true
  L12_888 = 2
  L13_889 = A1_877
  L14_890 = A2_878
  L15_891 = A3_879
  L16_892 = ...
  return L5_881(L6_882, L7_883, L8_884, L9_885, L10_886, L11_887, L12_888, L13_889, L14_890, L15_891, L16_892)
end
L0_0.openQuestRewardWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_893, A1_894)
  local L2_895, L3_896
  L3_896 = A0_893
  L2_895 = A0_893.isWidgetExec
  L2_895 = L2_895(L3_896, 14)
  if L2_895 == true then
    return
  end
  L2_895, L3_896 = nil, nil
  if A1_894 == 1 then
    L2_895 = "RaidDungeonTitleWidget1"
    break
  else
  end
  if A1_894 == 2 then
    L2_895 = "RaidDungeonTitleWidget2"
    break
  else
  end
  if A1_894 == 3 then
    L2_895 = "RaidDungeonSuccessWidget"
    L3_896 = 2130706534
    break
  else
  end
  if A1_894 == 4 then
    L2_895 = "LocationTitleWidget1"
    break
  else
  end
  if A1_894 == 5 then
    L2_895 = "LocationTitleWidget2"
    break
  else
  end
  if A1_894 == 6 then
    L2_895 = "LocationTitleWidget3"
    break
  else
  end
  if A1_894 == 7 then
    L2_895 = "RaidDungeonTitleWidget3"
    break
  else
  end
  if A1_894 == 8 then
    L2_895 = "RaidDungeonTitleWidget4"
    break
  else
  end
  if A1_894 == 15 then
    L2_895 = "CastrumNovumTitleWidget"
    break
  else
  end
  if A1_894 == 9 then
    L2_895 = "DutyCompleteWidget4"
    break
  else
  end
  if A1_894 == 10 then
    L2_895 = "DutyCompleteWidget5"
    break
  else
  end
  if A1_894 == 11 then
    L2_895 = "DutyCompleteWidget6"
    break
  else
  end
  if A1_894 == 12 then
    L2_895 = "HamletDefenseTitleWidget1"
    break
  else
  end
  if A1_894 == 13 then
    L2_895 = "HamletDefenseTitleWidget2"
    break
  else
  end
  if A1_894 == 14 then
    L2_895 = "HamletDefenseTitleWidget3"
    break
  else
  end
  do return end
  A0_893:openWidget(14, "SplashEffectWidget", L2_895, nil, true, L3_896)
end
L0_0.openCutSceneEffectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_897)
  if A0_897:getWidget(14) ~= nil then
    A0_897:getWidget(14):finish()
  end
end
L0_0.closeCutSceneEffectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_898, A1_899, A2_900, A3_901)
  A0_898:openWidgetYield(15, "RaidDungeonExecutionWidget", nil, nil, true, A2_900, A3_901)
end
L0_0.openRaidDungeonExecutionWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_902)
  A0_902:closeWidget(15, nil)
  A0_902:closeWidget(16, nil)
end
L0_0.closeRaidDungeonExecutionWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_903)
  return A0_903:askEventModeWidgetYield2("Ask/ChocoboNamingWidget", 1, true)
end
L0_0.askChocoboNamingWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_904, A1_905, A2_906, A3_907, A4_908, A5_909)
  A0_904:askEventModeWidgetYield2("Ask/HamletDefenseRankingWidget", 1, A1_905, A2_906, A3_907, A4_908, A5_909)
end
L0_0.askHamletDefenseRankingWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_910)
  A0_910:openWidgetYield(15, "HamletDefenseWidget", nil, nil, false)
  A0_910:openWidgetYield(16, "HamletDefensePopupWidget", nil, nil, true)
end
L0_0.openHamletExecutionWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_911)
  return A0_911:getWidget(15, "HamletDefenseWidget")
end
L0_0.getHamletExecutionWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_912)
  return A0_912:getWidget(16, "HamletDefensePopupWidget")
end
L0_0.getHamletPopupWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_913, A1_914)
  A0_913:askEventModeWidgetYield2("Ask/HamletDefenseScoreWidget", 1, A1_914)
end
L0_0.askHamletDefenseScoreWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_915, A1_916, A2_917, A3_918, A4_919, A5_920, ...)
  local L7_922, L8_923
  do break end
  for _FORV_10_ = 1, #A5_920 do
    A5_920[_FORV_10_] = nil
  end
  do return L7_922 end
  if L8_923 ~= nil then
    L8_923:ask(A1_916, A2_917, A3_918, false, false, A4_919, A5_920, ...)
    if A0_915:selectWidgetYield(L8_923, true) == true then
    end
    A0_915:closeWidgetDirect(L8_923)
  end
  return L7_922
end
L0_0.ask = L1_1
L0_0 = DesktopWidget
function L1_1(A0_924, A1_925, A2_926, A3_927, A4_928, A5_929, A6_930, A7_931, A8_932, ...)
  local L10_934, L11_935
  do break end
  for _FORV_13_ = 1, #A8_932 do
    A8_932[_FORV_13_] = nil
  end
  do return L10_934 end
  if L11_935 ~= nil then
    L11_935:ask(A2_926, A3_927, A4_928, A5_929, A6_930, A7_931, A8_932, ...)
    if A0_924:selectWidgetYield(L11_935, true) == true then
    end
    A0_924:closeWidgetDirect(L11_935)
  end
  return L10_934
end
L0_0.askForEventMode = L1_1
L0_0 = DesktopWidget
function L1_1(A0_936, A1_937, A2_938, A3_939, A4_940, A5_941, A6_942, A7_943, A8_944, A9_945, ...)
  local L11_947, L12_948
  do break end
  L11_947 = -3
  do return L11_947 end
  L11_947 = 0
  L12_948 = A0_936.openWidgetYield
  L12_948 = L12_948(A0_936, 4, "Ask/AskWidget", nil, nil, false)
  if L12_948 ~= nil then
    L12_948:askMultiple(A2_938, A3_939, A4_940, A5_941, A6_942, A7_943, A8_944, A9_945, ...)
    if A0_936:selectWidgetYield(L12_948, true) == true then
      L11_947 = L12_948:getAskResult()
    end
    A0_936:closeWidgetDirect(L12_948)
  end
  return L11_947
end
L0_0.askForEventModeMultiple = L1_1
L0_0 = DesktopWidget
function L1_1(A0_949, A1_950, A2_951, A3_952, A4_953, A5_954, A6_955, ...)
  local L8_957, L9_958
  L8_957 = 0
  L9_958 = A0_949.openWidgetYield
  L9_958 = L9_958(A0_949, 4, "Ask/AskWidget", nil, A0_949.work.rootWidget[4], false)
  if L9_958 ~= nil then
    L9_958:ask(nil, A1_950, A2_951, A3_952, A4_953, A5_954, A6_955, ...)
    if A0_949:selectWidgetYield(L9_958, true) == true then
      L8_957 = L9_958:getAskResult()
    end
    A0_949:closeWidgetDirect(L9_958)
  end
  return L8_957
end
L0_0.askForEventModeChild = L1_1
L0_0 = DesktopWidget
function L1_1(A0_959, A1_960, A2_961, A3_962, A4_963, A5_964, A6_965, A7_966, ...)
  local L9_968, L10_969
  L9_968 = 0
  L10_969 = A0_959.openWidgetYield
  L10_969 = L10_969(A0_959, 4, "Ask/MarketSelectWidget", nil, nil, false)
  if L10_969 ~= nil then
    L10_969:ask(A2_961, A3_962, A4_963, A5_964, A6_965, A7_966, ...)
    if A0_959:selectWidgetYield(L10_969, true) == true then
      L9_968 = L10_969:getAskResult()
    end
    A0_959:closeWidgetDirect(L10_969)
  end
  return L9_968
end
L0_0.askMarketSelectWidget = L1_1
L0_0 = DesktopWidget
function L1_1(A0_970, A1_971)
  if A0_970:checkActor(A1_971) == nil then
    return 0
  end
  return (A1_971:getStatusSlotLength())
end
L0_0.getCharacterStatusSlotLength = L1_1
L0_0 = DesktopWidget
function L1_1(A0_972, A1_973, A2_974)
  local L3_975, L4_976, L5_977, L6_978, L7_979
  L4_976 = A0_972
  L3_975 = A0_972.checkActor
  L5_977 = A1_973
  L3_975 = L3_975(L4_976, L5_977)
  if L3_975 == nil then
    L3_975 = 0
    L4_976 = 0
    L5_977 = 0
    L6_978 = 0
    return L3_975, L4_976, L5_977, L6_978
  end
  if not (A2_974 < 1) then
    L4_976 = A1_973
    L3_975 = A1_973.getStatusSlotLength
    L3_975 = L3_975(L4_976)
  elseif A2_974 > L3_975 then
    L3_975 = 0
    L4_976 = 0
    L5_977 = 0
    L6_978 = 0
    return L3_975, L4_976, L5_977, L6_978
  end
  L4_976 = A1_973
  L3_975 = A1_973.getStatus
  L5_977 = A2_974
  L3_975 = L3_975(L4_976, L5_977)
  if L3_975 == nil then
    L4_976 = 0
    L5_977 = 0
    L6_978 = 0
    L7_979 = 0
    return L4_976, L5_977, L6_978, L7_979
  end
  L5_977 = L3_975
  L4_976 = L3_975.getStatusId
  L4_976 = L4_976(L5_977)
  L6_978 = L3_975
  L5_977 = L3_975.getStatusIcon
  L5_977 = L5_977(L6_978)
  L7_979 = A1_973
  L6_978 = A1_973.getStatusLostTime
  L6_978 = L6_978(L7_979, L3_975)
  L7_979 = worldMaster
  L7_979 = L7_979._getServerTime
  L7_979 = L7_979(L7_979)
  L7_979 = L6_978 - L7_979
  return L4_976, L5_977, L7_979, L6_978
end
L0_0.getCharacterBufferStatus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_980)
  local L1_981, L2_982
  L2_982 = A0_980
  L1_981 = A0_980.getCharacterStatusSlotLength
  L1_981 = L1_981(L2_982, worldMaster:_getMyPlayer())
  return L1_981
end
L0_0.getPlayerStatusSlotLength = L1_1
L0_0 = DesktopWidget
function L1_1(A0_983, A1_984)
  local L2_985, L3_986, L4_987, L5_988
  L3_986 = A0_983
  L2_985 = A0_983.getCharacterBufferStatus
  L4_987 = worldMaster
  L5_988 = L4_987
  L4_987 = L4_987._getMyPlayer
  L4_987 = L4_987(L5_988)
  L5_988 = A1_984
  L5_988 = L2_985(L3_986, L4_987, L5_988)
  return L2_985, L3_986, L4_987, L5_988
end
L0_0.getPlayerBufferStatus = L1_1
L0_0 = DesktopWidget
function L1_1(A0_989)
  local L1_990, L2_991, L3_992, L4_993, L5_994, L6_995, L7_996, L8_997, L9_998, L10_999
  L1_990 = worldMaster
  L1_990 = L1_990._getMyPlayer
  L1_990 = L1_990(L2_991)
  for L5_994 = 1, 18 do
    L6_995 = A0_989.work
    L6_995 = L6_995.commandIndex
    L6_995[L5_994] = 0
  end
  L5_994, L6_995 = nil, nil
  for L10_999 = 1, L2_991 do
    if A0_989:checkActor(L3_992) ~= nil then
      L5_994 = L3_992:getCommandId()
      L6_995 = A0_989:getReadyCommandIndex(L5_994)
      if L6_995 ~= 0 then
        A0_989.work.commandIndex[L6_995] = L10_999
      end
    end
  end
end
L0_0.updateReadyCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1000, A1_1001)
  local L2_1002, L3_1003
  L2_1002 = 0
  L3_1003 = A1_1001
  if L3_1003 == 21006 then
    L2_1002 = 1
    break
  else
  end
  if L3_1003 == 22001 then
    L2_1002 = 3
    break
  else
  end
  if L3_1003 == 21001 then
    L2_1002 = 4
    break
  else
  end
  if L3_1003 == 21002 then
    L2_1002 = 5
    break
  else
  end
  if L3_1003 == 21007 then
    L2_1002 = 6
    break
  else
  end
  if L3_1003 == 12009 then
    L2_1002 = 7
    break
  else
  end
  if L3_1003 == 22013 then
    L2_1002 = 8
    break
  else
  end
  if L3_1003 == 12010 then
    L2_1002 = 10
    break
  else
  end
  if L3_1003 == 12007 then
    L2_1002 = 9
    break
  else
  end
  if L3_1003 == 12005 then
    L2_1002 = 11
    break
  else
  end
  if L3_1003 == 22012 then
    L2_1002 = 12
    break
  else
  end
  if L3_1003 == 12011 then
    L2_1002 = 13
    break
  else
  end
  if L3_1003 == 22014 then
    L2_1002 = 15
    break
  else
  end
  if L3_1003 == 29497 then
    L2_1002 = 16
    break
  else
  end
  if L3_1003 == 22015 then
    L2_1002 = 17
    break
  else
  end
  if L3_1003 == 22016 then
    L2_1002 = 18
    do break end
    break
  else
  end
  return L2_1002
end
L0_0.getReadyCommandIndex = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1004, A1_1005)
  local L2_1006, L3_1007, L4_1008
  L2_1006 = worldMaster
  L3_1007 = L2_1006
  L2_1006 = L2_1006._getMyPlayer
  L2_1006 = L2_1006(L3_1007)
  L3_1007 = 0
  L4_1008 = L2_1006.getSystemCommand
  L4_1008 = L4_1008(L2_1006, A1_1005)
  if L4_1008 == nil then
    return nil, L3_1007, false
  end
  if L4_1008:_isAlive() == false then
    return L4_1008, L3_1007, false
  end
  return L4_1008, L3_1007, true
end
L0_0.getSystemCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1009, A1_1010)
  local L2_1011, L3_1012, L4_1013
  L2_1011 = worldMaster
  L3_1012 = L2_1011
  L2_1011 = L2_1011._getMyPlayer
  L2_1011 = L2_1011(L3_1012)
  if not (A1_1010 < 1) then
    L4_1013 = L2_1011
    L3_1012 = L2_1011.getReadyCommandSlotLength
    L3_1012 = L3_1012(L4_1013)
  elseif A1_1010 > L3_1012 then
    L3_1012 = nil
    L4_1013 = -1
    return L3_1012, L4_1013, false
  end
  L4_1013 = L2_1011
  L3_1012 = L2_1011.getReadyCommand
  L4_1013 = L3_1012(L4_1013, A1_1010)
  if type(L4_1013) == nil then
    L4_1013 = 0
  end
  if L3_1012 == nil then
    return nil, L4_1013, false
  end
  if L3_1012:_isAlive() == false then
    return L3_1012, L4_1013, false
  end
  return L3_1012, L4_1013, true
end
L0_0.getPlayerEquippedReadyCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1014)
  return worldMaster:_getMyPlayer():getReadyCommandSlotLength()
end
L0_0.getPlayerEquippedReadyCommandSlotLength = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1015, A1_1016)
  local L2_1017, L3_1018, L4_1019
  L2_1017 = worldMaster
  L3_1018 = L2_1017
  L2_1017 = L2_1017._getMyPlayer
  L2_1017 = L2_1017(L3_1018)
  if not (A1_1016 < 1) then
    L4_1019 = L2_1017
    L3_1018 = L2_1017.getCustomCommandSlotLength
    L3_1018 = L3_1018(L4_1019)
  elseif A1_1016 > L3_1018 then
    L3_1018 = nil
    L4_1019 = -1
    return L3_1018, L4_1019, false
  end
  L4_1019 = L2_1017
  L3_1018 = L2_1017.getCustomCommand
  L4_1019 = L3_1018(L4_1019, A1_1016)
  if type(L4_1019) == nil then
    L4_1019 = 0
  end
  if L3_1018 == nil then
    return nil, L4_1019, false
  end
  if L3_1018:_isAlive() == false then
    return L3_1018, L4_1019, false
  end
  return L3_1018, L4_1019, true
end
L0_0.getPlayerEquippedCustomCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1020, A1_1021)
  local L2_1022, L3_1023, L4_1024, L5_1025, L6_1026, L7_1027, L8_1028
  L6_1026 = A0_1020
  L5_1025 = A0_1020.getPlayerEquippedCustomCommand
  L7_1027 = A1_1021
  L7_1027 = L5_1025(L6_1026, L7_1027)
  if L5_1025 == nil or L7_1027 == false then
    L8_1028 = L2_1022
    return L8_1028, L3_1023, L4_1024
  end
  L8_1028 = worldMaster
  L8_1028 = L8_1028._getMyPlayer
  L8_1028 = L8_1028(L8_1028)
  L2_1022 = L5_1025:getCommandHPCost(L8_1028)
  L3_1023 = L5_1025:getCommandMPCost(L8_1028)
  L4_1024 = L5_1025:getCommandTPCost(L8_1028)
  if L2_1022 == 0 then
    L2_1022 = nil
  end
  if L3_1023 > 0 then
    L3_1023 = _math.ceil(L3_1023 * (1 - L8_1028:getComboInformation()))
  else
    L3_1023 = nil
  end
  if L4_1024 > 0 then
    L4_1024 = _math.ceil(L4_1024 * (1 - L8_1028:getComboInformation()))
  else
    L4_1024 = nil
  end
  return L2_1022, L3_1023, L4_1024
end
L0_0.getPlayerEquippedCustomCommandCost = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1029, A1_1030)
  if A1_1030 < 1 or A1_1030 > worldMaster:_getMyPlayer():getCustomCommandSlotLength() then
    return nil
  end
  if worldMaster:_getMyPlayer():getCustomCommand(A1_1030) == nil then
    return nil
  end
  if not worldMaster:_getMyPlayer():getCustomCommand(A1_1030):_isAlive() then
    return nil
  end
  return worldMaster:_getMyPlayer():getCustomCommand(A1_1030):getCastTime()
end
L0_0.getCastTimeForCustomCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1031, A1_1032)
  local L2_1033, L3_1034, L4_1035, L5_1036, L6_1037, L7_1038
  L2_1033 = worldMaster
  L3_1034 = L2_1033
  L2_1033 = L2_1033._getMyPlayer
  L2_1033 = L2_1033(L3_1034)
  if not (A1_1032 < 1) then
    L4_1035 = L2_1033
    L3_1034 = L2_1033.getCustomCommandSlotLength
    L3_1034 = L3_1034(L4_1035)
  elseif A1_1032 > L3_1034 then
    L3_1034 = nil
    return L3_1034
  end
  L4_1035 = L2_1033
  L3_1034 = L2_1033.getCustomCommand
  L5_1036 = A1_1032
  L3_1034 = L3_1034(L4_1035, L5_1036)
  if L3_1034 == nil then
    L4_1035, L5_1036 = nil, nil
    return L4_1035, L5_1036
  end
  L5_1036 = L3_1034
  L4_1035 = L3_1034._isAlive
  L4_1035 = L4_1035(L5_1036)
  if L4_1035 == false then
    L4_1035, L5_1036 = nil, nil
    return L4_1035, L5_1036
  end
  L5_1036 = L3_1034
  L4_1035 = L3_1034.getRecastTime
  L4_1035 = L4_1035(L5_1036)
  L6_1037 = L2_1033
  L5_1036 = L2_1033.getCommandRecastTime
  L7_1038 = A1_1032
  L5_1036 = L5_1036(L6_1037, L7_1038)
  L7_1038 = L2_1033
  L6_1037 = L2_1033.getMaxCommandRecastTime
  L6_1037 = L6_1037(L7_1038, A1_1032)
  L7_1038 = worldMaster
  L7_1038 = L7_1038._getServerTime
  L7_1038 = L7_1038(L7_1038)
  L7_1038 = L5_1036 - L7_1038
  if L6_1037 > 0 and L6_1037 < L7_1038 then
    L7_1038 = L6_1037
    L5_1036 = L5_1036 - (L7_1038 - L6_1037)
  end
  return L5_1036, L7_1038
end
L0_0.getRecastTimeForCustomCommand = L1_1
L0_0 = DesktopWidget
function L1_1(A0_1039)
  return worldMaster:_getMyPlayer():isDead()
end
L0_0.isMyPlayerDead = L1_1
L0_0 = DesktopWidget
L1_1 = "isMyPlayerOccupancy"
function L2_2(A0_1040)
  if worldMaster:_getMyPlayer():getPlayerParty():_getOccupancyGroup() ~= nil then
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTargetName"
function L2_2(A0_1041)
  local L1_1042, L2_1043
  L2_1043 = A0_1041
  L1_1042 = A0_1041.getCurrentTargetCharacter
  L1_1042 = L1_1042(L2_1043)
  L2_1043 = ""
  if L1_1042 ~= nil then
    L2_1043 = L1_1042:_getLocalizedDisplayName()
  end
  return L2_1043
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTargetGaugeMaxParameter"
function L2_2(A0_1044)
  local L1_1045, L2_1046, L3_1047, L4_1048
  L2_1046 = A0_1044
  L1_1045 = A0_1044.getCurrentTargetCharacter
  L1_1045 = L1_1045(L2_1046)
  if L1_1045 == nil then
    L2_1046 = 0
    L3_1047 = 0
    L4_1048 = 0
    do return L2_1046, L3_1047, L4_1048 end
    do break end
    L2_1046 = 0
    L3_1047 = 0
    L4_1048 = 0
    return L2_1046, L3_1047, L4_1048
  end
  L3_1047 = L1_1045
  L2_1046 = L1_1045.getHPMax
  L2_1046 = L2_1046(L3_1047)
  L4_1048 = L1_1045
  L3_1047 = L1_1045.getMPMax
  L3_1047 = L3_1047(L4_1048)
  L4_1048 = 0
  return L2_1046, L3_1047, L4_1048
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTargetGaugeCurrentParameter"
function L2_2(A0_1049)
  local L1_1050, L2_1051, L3_1052, L4_1053
  L2_1051 = A0_1049
  L1_1050 = A0_1049.getCurrentTargetCharacter
  L1_1050 = L1_1050(L2_1051)
  if L1_1050 == nil then
    L2_1051 = 0
    L3_1052 = 0
    L4_1053 = 0
    do return L2_1051, L3_1052, L4_1053 end
    do break end
    L2_1051 = 0
    L3_1052 = 0
    L4_1053 = 0
    return L2_1051, L3_1052, L4_1053
  end
  L3_1052 = L1_1050
  L2_1051 = L1_1050.getHP
  L2_1051 = L2_1051(L3_1052)
  L4_1053 = L1_1050
  L3_1052 = L1_1050.getMP
  L3_1052 = L3_1052(L4_1053)
  L4_1053 = 0
  return L2_1051, L3_1052, L4_1053
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTargetStatusSlotLength"
function L2_2(A0_1054)
  local L1_1055
  L1_1055 = A0_1054.getCurrentTargetCharacter
  L1_1055 = L1_1055(A0_1054)
  if L1_1055 == nil then
    do return -1 end
    do break end
    return 0
  end
  return (A0_1054:getCharacterStatusSlotLength(L1_1055))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTargetBufferStatus"
function L2_2(A0_1056, A1_1057)
  local L2_1058, L3_1059, L4_1060, L5_1061, L6_1062, L7_1063
  L3_1059 = A0_1056
  L2_1058 = A0_1056.getCurrentTargetCharacter
  L2_1058 = L2_1058(L3_1059)
  if L2_1058 == nil then
    L3_1059 = -3
    L4_1060 = 0
    L5_1061 = 0
    do return L3_1059, L4_1060, L5_1061 end
    do break end
    L3_1059 = -1
    L4_1060 = 0
    L5_1061 = 0
    return L3_1059, L4_1060, L5_1061
  end
  L4_1060 = A0_1056
  L3_1059 = A0_1056.getCharacterBufferStatus
  L5_1061 = L2_1058
  L6_1062 = A1_1057
  L5_1061 = L3_1059(L4_1060, L5_1061, L6_1062)
  L6_1062 = L3_1059
  L7_1063 = L4_1060
  return L6_1062, L7_1063, L5_1061
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isTargetTalkable"
function L2_2(A0_1064)
  local L1_1065, L2_1066
  L2_1066 = A0_1064
  L1_1065 = A0_1064.getMainTargetCharacter
  L1_1065 = L1_1065(L2_1066)
  L2_1066 = A0_1064.checkActor
  L2_1066 = L2_1066(A0_1064, L1_1065)
  if L2_1066 == nil then
    L2_1066 = false
    do return L2_1066 end
    do break end
    L2_1066 = false
    return L2_1066
  end
  L2_1066 = worldMaster
  L2_1066 = L2_1066._getMyPlayer
  L2_1066 = L2_1066(L2_1066)
  if L1_1065:isPlayer() == false then
    return L1_1065:_isTalkable(L2_1066)
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isTargetOtherPlayer"
function L2_2(A0_1067)
  local L1_1068
  L1_1068 = A0_1067.getMainTargetCharacter
  L1_1068 = L1_1068(A0_1067)
  return A0_1067:isOtherPlayer(L1_1068)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isTargetTradeOffer"
function L2_2(A0_1069)
  local L1_1070
  L1_1070 = A0_1069.getMainTargetCharacter
  L1_1070 = L1_1070(A0_1069)
  if A0_1069:isOtherPlayer(L1_1070) == false then
    return false
  end
  if worldMaster:_getMyPlayer():isActiveMode() then
    return false
  end
  if worldMaster:_getMyPlayer():hasRelationGroup(50002) then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isTargetDuringTradeOffer"
function L2_2(A0_1071)
  local L1_1072
  L1_1072 = A0_1071.getMainTargetCharacter
  L1_1072 = L1_1072(A0_1071)
  if A0_1071:isOtherPlayer(L1_1072) == false then
    return false
  end
  return worldMaster:_getMyPlayer():hasRelationGroup(50002, L1_1072)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isTargetBazaar"
function L2_2(A0_1073)
  local L1_1074
  L1_1074 = A0_1073.getMainTargetCharacter
  L1_1074 = L1_1074(A0_1073)
  if A0_1073:checkActor(L1_1074) == nil then
    do return false end
    do break end
    return false
  end
  if worldMaster:_getMyPlayer():isActiveMode() == true then
    return false
  end
  if worldMaster:_getMyPlayer() == L1_1074 then
    return false
  end
  if L1_1074:isPlayer() == false then
    if L1_1074:isRetainer() == true then
      if A0_1073:isMyRetainer(L1_1074) == true then
        return false
      end
      return L1_1074:isDealer()
    end
  else
    return L1_1074:isDealer()
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTargetRepairType"
function L2_2(A0_1075)
  local L1_1076
  L1_1076 = A0_1075.isRideChocobo
  L1_1076 = L1_1076(A0_1075)
  if L1_1076 == true then
    L1_1076 = 0
    return L1_1076
  end
  L1_1076 = A0_1075.getMainTargetCharacter
  L1_1076 = L1_1076(A0_1075)
  if A0_1075:isOtherPlayer(L1_1076) == false then
    return 0
  end
  return L1_1076:getRepairType()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isOtherPlayer"
function L2_2(A0_1077, A1_1078)
  do break end
  do return false end
  if A0_1077:checkActor(A1_1078) == nil then
    return false
  end
  if A1_1078:isPlayer() == false then
    return false
  end
  if A1_1078 == worldMaster:_getMyPlayer() then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isOtherRetainerBazaar"
function L2_2(A0_1079, A1_1080)
  do break end
  do return false end
  if A0_1079:checkActor(A1_1080) == nil then
    return false
  end
  if A1_1080:isPlayer() == true then
    return false
  end
  if A1_1080:isRetainer() == false then
    return false
  end
  if A0_1079:isMyRetainer(A1_1080) == true then
    return false
  end
  return A1_1080:isDealer()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isMyRetainer"
function L2_2(A0_1081, A1_1082)
  local L2_1083
  L2_1083 = false
  if worldMaster:_getMyPlayer():_getGroup(80001) ~= nil then
    L2_1083 = worldMaster:_getMyPlayer():_getGroup(80001):_isMember(A1_1082)
  end
  return L2_1083
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isTargetMateriaAttachDealer"
function L2_2(A0_1084)
  local L1_1085
  L1_1085 = A0_1084.isRideChocobo
  L1_1085 = L1_1085(A0_1084)
  if L1_1085 == true then
    L1_1085 = false
    return L1_1085
  end
  L1_1085 = A0_1084.getMainTargetCharacter
  L1_1085 = L1_1085(A0_1084)
  if A0_1084:isOtherPlayer(L1_1085) == false then
    return false
  end
  return L1_1085:isMateriaAttachDealer()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCommand"
function L2_2(A0_1086, A1_1087, A2_1088, A3_1089, A4_1090, A5_1091, A6_1092, A7_1093, A8_1094, A9_1095, A10_1096, A11_1097)
  local L12_1098, L13_1099
  L13_1099 = A0_1086
  L12_1098 = A0_1086.checkActor
  L12_1098 = L12_1098(L13_1099, A1_1087)
  if L12_1098 == nil then
    L12_1098 = false
    return L12_1098
  end
  if A7_1093 ~= nil then
    L13_1099 = A7_1093
    L12_1098 = A7_1093._isAlive
    L12_1098 = L12_1098(L13_1099)
    if L12_1098 == false then
      L12_1098 = false
      return L12_1098
    end
  end
  L12_1098 = nil
  L13_1099 = A1_1087.isPlayer
  L13_1099 = L13_1099(A1_1087)
  if L13_1099 == true then
    L13_1099 = A1_1087.getSystemCommand
    L13_1099 = L13_1099(A1_1087, A2_1088)
    if L13_1099 == nil then
      return false
    end
    L12_1098 = A0_1086:command(A1_1087, L13_1099, A3_1089, A4_1090, A5_1091, A6_1092, A7_1093, A8_1094, A9_1095, A10_1096, A11_1097)
  else
    L13_1099 = A0_1086.command
    L13_1099 = L13_1099(A0_1086, A1_1087, A2_1088, A3_1089, A4_1090, A5_1091, A7_1093, A8_1094, A9_1095, A10_1096, A11_1097)
    L12_1098 = L13_1099
  end
  return L12_1098
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "command"
function L2_2(A0_1100, A1_1101, ...)
  local L4_1103, L5_1104, L6_1105
  L5_1104 = A1_1101
  L4_1103 = A1_1101.canCommand
  L6_1105 = ...
  L4_1103 = L4_1103(L5_1104, L6_1105, ...)
  if L4_1103 == false then
    L5_1104 = false
    return L5_1104
  end
  L6_1105 = A1_1101
  L5_1104 = A1_1101.command
  return L5_1104(L6_1105, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerCommandLocal"
function L2_2(A0_1106, A1_1107, A2_1108, A3_1109, A4_1110, A5_1111, A6_1112, A7_1113, A8_1114, A9_1115, A10_1116)
  return A0_1106:executeCommand(worldMaster:_getMyPlayer(), A1_1107, A2_1108, A3_1109, A4_1110, A5_1111, A6_1112, A7_1113, A8_1114, A9_1115, A10_1116)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isValidItemParameter"
function L2_2(A0_1117, A1_1118, A2_1119, A3_1120)
  if A0_1117:checkActor(A1_1118) == nil then
    return false
  end
  if A1_1118:_hasItemPackage(A2_1119) == false then
    return false
  end
  if A3_1120 < 1 or A3_1120 > A1_1118:_getItemPackageCapacity(A2_1119) then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getItem"
function L2_2(A0_1121, A1_1122, A2_1123, A3_1124)
  local L4_1125
  L4_1125 = A0_1121.isValidItemParameter
  L4_1125 = L4_1125(A0_1121, A1_1122, A2_1123, A3_1124)
  if L4_1125 == false then
    L4_1125 = nil
    return L4_1125
  end
  L4_1125 = A1_1122._getExtendedTemporaryItem
  L4_1125 = L4_1125(A1_1122, A2_1123, A3_1124)
  if A0_1121:checkActor(L4_1125) == nil then
    return nil
  end
  return L4_1125
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getBazaarItem"
function L2_2(A0_1126, A1_1127, A2_1128)
  local L3_1129, L4_1130
  L4_1130 = A0_1126
  L3_1129 = A0_1126.getBazaarActor
  L3_1129 = L3_1129(L4_1130)
  L4_1130 = A0_1126.isValidItemParameter
  L4_1130 = L4_1130(A0_1126, L3_1129, A1_1127, A2_1128)
  if L4_1130 == false then
    L4_1130 = nil
    return L4_1130
  end
  L4_1130 = L3_1129._getExtendedTemporaryItem
  L4_1130 = L4_1130(L3_1129, A1_1127, A2_1128)
  if A0_1126:checkActor(L4_1130) == nil then
    return nil
  end
  return L4_1130
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getRetainerItem"
function L2_2(A0_1131, A1_1132, A2_1133)
  local L3_1134, L4_1135
  L4_1135 = A0_1131
  L3_1134 = A0_1131.getRetainer
  L3_1134 = L3_1134(L4_1135)
  L4_1135 = A0_1131.isValidItemParameter
  L4_1135 = L4_1135(A0_1131, L3_1134, A1_1132, A2_1133)
  if L4_1135 == false then
    L4_1135 = nil
    return L4_1135
  end
  L4_1135 = L3_1134._getExtendedTemporaryItem
  L4_1135 = L4_1135(L3_1134, A1_1132, A2_1133)
  if A0_1131:checkActor(L4_1135) == nil then
    return nil
  end
  return L4_1135
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerCommand"
function L2_2(A0_1136, A1_1137, A2_1138, A3_1139, A4_1140, A5_1141, A6_1142, A7_1143)
  local L8_1144, L9_1145, L10_1146, L11_1147, L12_1148, L13_1149
  do break end
  L8_1144 = false
  do return L8_1144 end
  L8_1144 = type
  L9_1145 = A1_1137
  L8_1144 = L8_1144(L9_1145)
  if L8_1144 == "number" then
    L8_1144 = _getStaticActor
    L9_1145 = A1_1137
    L8_1144 = L8_1144(L9_1145)
    A1_1137 = L8_1144
  end
  if A1_1137 ~= nil then
    L9_1145 = A1_1137
    L8_1144 = A1_1137._isAlive
    L8_1144 = L8_1144(L9_1145)
  elseif L8_1144 == false then
    L8_1144 = false
    return L8_1144
  end
  L8_1144 = worldMaster
  L9_1145 = L8_1144
  L8_1144 = L8_1144._getMyPlayer
  L8_1144 = L8_1144(L9_1145)
  L9_1145 = true
  if A6_1142 ~= nil then
    L11_1147 = A6_1142
    L10_1146 = A6_1142._isAlive
    L10_1146 = L10_1146(L11_1147)
  elseif L10_1146 == false then
    L11_1147 = A0_1136
    L10_1146 = A0_1136.getCurrentTargetCharacter
    L10_1146 = L10_1146(L11_1147)
    A6_1142 = L10_1146
    L9_1145 = false
  end
  L11_1147 = L8_1144
  L10_1146 = L8_1144.command
  L12_1148 = A1_1137
  L13_1149 = A2_1138
  L10_1146 = L10_1146(L11_1147, L12_1148, L13_1149, A3_1139, A4_1140, A5_1141, A6_1142, nil, nil, nil, A7_1143)
  if L10_1146 == false then
    L11_1147 = _isInstanceOf
    L12_1148 = A1_1137
    L13_1149 = "GameCommandBaseClass"
    L11_1147 = L11_1147(L12_1148, L13_1149)
    if L11_1147 then
      L12_1148 = A1_1137
      L11_1147 = A1_1137.processCanFire
      L13_1149 = L8_1144
      L12_1148 = L11_1147(L12_1148, L13_1149, A2_1138, A3_1139, A4_1140, A5_1141, A6_1142, nil, nil, nil, A7_1143)
      L13_1149 = A1_1137.getCommandId
      L13_1149 = L13_1149(A1_1137)
      if L9_1145 == false then
        A6_1142 = L8_1144
      end
      if L12_1148 == nil or L12_1148 == 0 or L13_1149 == nil or L13_1149 == 0 then
        return
      end
      if _isInstanceOf(A1_1137, "ProgCommandBaseClass") then
        worldMaster:alert(worldMaster, L12_1148, L13_1149)
      elseif L12_1148 > 32500 and L12_1148 < 32600 or L12_1148 > 32700 and L12_1148 < 32800 then
        worldMaster:alert(worldMaster, L12_1148, L13_1149)
      end
    else
      L12_1148 = A0_1136
      L11_1147 = A0_1136.alertCommandError
      L13_1149 = A1_1137
      L11_1147(L12_1148, L13_1149, A4_1140)
    end
  end
  return L10_1146
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerReadyCommand"
function L2_2(A0_1150, A1_1151, A2_1152, A3_1153, A4_1154, A5_1155, A6_1156)
  local L7_1157, L8_1158, L9_1159, L10_1160
  do break end
  L7_1157 = false
  do return L7_1157 end
  L7_1157 = worldMaster
  L8_1158 = L7_1157
  L7_1157 = L7_1157._getMyPlayer
  L7_1157 = L7_1157(L8_1158)
  L9_1159 = A0_1150
  L8_1158 = A0_1150.getReadyCommandIndex
  L10_1160 = A1_1151
  L8_1158 = L8_1158(L9_1159, L10_1160)
  if L8_1158 == 0 then
    L9_1159 = false
    return L9_1159
  end
  L9_1159 = A0_1150.work
  L9_1159 = L9_1159.commandIndex
  L9_1159 = L9_1159[L8_1158]
  if L9_1159 <= 0 then
    L9_1159 = false
    return L9_1159
  end
  L9_1159, L10_1160 = nil, nil
  L9_1159, L10_1160 = L7_1157:getReadyCommand(A0_1150.work.commandIndex[L8_1158])
  if A4_1154 == nil then
    A4_1154 = L10_1160
  end
  return A0_1150:executePlayerCommand(L9_1159, A2_1152, A3_1153, A4_1154, nil, A5_1155, A6_1156)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerSystemCommand"
function L2_2(A0_1161, A1_1162, A2_1163, A3_1164, A4_1165, A5_1166)
  local L6_1167, L7_1168, L8_1169, L9_1170, L10_1171, L11_1172
  L6_1167 = worldMaster
  L7_1168 = L6_1167
  L6_1167 = L6_1167._getMyPlayer
  L6_1167 = L6_1167(L7_1168)
  L8_1169 = L6_1167
  L7_1168 = L6_1167.getSystemCommand
  L9_1170 = A1_1162
  L7_1168 = L7_1168(L8_1169, L9_1170)
  L9_1170 = A0_1161
  L8_1169 = A0_1161.checkActor
  L10_1171 = L7_1168
  L8_1169 = L8_1169(L9_1170, L10_1171)
  if L8_1169 == nil then
    L8_1169 = false
    return L8_1169
  end
  L8_1169, L9_1170, L10_1171 = nil, nil, nil
  L11_1172 = A1_1162
  if L11_1172 == 24302 then
  else
  end
  if L11_1172 == 24238 then
    L10_1171 = A4_1165
    break
  else
  end
  if L11_1172 == 24101 then
    if L10_1171 == nil then
      L10_1171 = A0_1161:getCurrentTargetCharacter()
      do break end
      else
      end
      if L11_1172 == 24203 then
        L10_1171 = A0_1161:getCurrentTargetCharacter()
        break
      elseif L11_1172 == 24208 then
      else
      end
      if L11_1172 == 24207 then
        if A2_1163 == nil and A4_1165 ~= nil then
          L10_1171 = A4_1165
          do break end
          elseif L11_1172 == 24215 then
          elseif L11_1172 == 24102 then
          elseif L11_1172 == 24305 then
          elseif L11_1172 == 24217 then
          else
          end
          if L11_1172 == 24230 then
            if L10_1171 == nil then
              L10_1171 = A0_1161:getCurrentTargetCharacter()
              do break end
              L10_1171 = nil
            else
            end
          else
          end
        else
        end
    else
    end
  L11_1172 = L6_1167.getSystemCommand
  L11_1172 = L11_1172(L6_1167, A1_1162)
  L7_1168 = L11_1172
  L11_1172 = A0_1161.checkActor
  L11_1172 = L11_1172(A0_1161, L7_1168)
  if L11_1172 == nil then
    L11_1172 = false
    return L11_1172
  end
  L11_1172 = A1_1162
  if L11_1172 == 24301 then
    L8_1169, L9_1170, L10_1171 = L6_1167:getPlaceDrivenCommandVariation()
    break
  else
  end
  if L11_1172 == 24302 then
    L8_1169, L9_1170 = L6_1167:getContentCommandVariation()
    break
  else
  end
  if L11_1172 == 24303 then
    L8_1169 = L6_1167:getConfirmGroupCommandVariation()
    break
  else
  end
  if L11_1172 == 24304 then
    L8_1169 = L6_1167:getConfirmWarpCommandVariation()
    break
  else
  end
  if L11_1172 == 24305 then
    L8_1169 = L6_1167:getConfirmTradeCommandVariation()
    break
  else
  end
  if L11_1172 == 24306 then
    L8_1169 = L6_1167:getConfirmRaiseCommandVariation()
    break
  else
  end
  L9_1170 = nil
  L8_1169 = nil
  do break end
  if A2_1163 ~= nil then
    L8_1169 = A2_1163
  end
  if A3_1164 ~= nil then
    L9_1170 = A3_1164
  end
  L11_1172 = L6_1167.canCommand
  L11_1172 = L11_1172(L6_1167, L7_1168, L8_1169, L9_1170, nil, nil, L10_1171, nil, nil, nil, nil)
  if L11_1172 == false then
    A0_1161:alertCommandError(L7_1168, 0)
    return L11_1172
  end
  L11_1172 = L6_1167:command(L7_1168, L8_1169, L9_1170, nil, nil, L10_1171, nil, nil, nil, nil)
  return L11_1172
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerSetAway"
function L2_2(A0_1173, A1_1174)
  local L2_1175, L3_1176, L4_1177
  L2_1175 = worldMaster
  L3_1176 = L2_1175
  L2_1175 = L2_1175._getMyPlayer
  L2_1175 = L2_1175(L3_1176)
  L3_1176 = 0
  L4_1177 = L2_1175.getSystemCommand
  L4_1177 = L4_1177(L2_1175, 24239)
  if A0_1173:checkActor(L4_1177) == nil then
    return false
  end
  if A1_1174 ~= nil then
    if A1_1174 then
      L3_1176 = 1
    end
  elseif not L2_1175:_getNetStatUser(1) then
    L3_1176 = 1
  end
  return L2_1175:command(L4_1177, 1, L3_1176)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerSetRequestJoinParty"
function L2_2(A0_1178, A1_1179)
  local L2_1180, L3_1181, L4_1182
  L2_1180 = worldMaster
  L3_1181 = L2_1180
  L2_1180 = L2_1180._getMyPlayer
  L2_1180 = L2_1180(L3_1181)
  L3_1181 = 0
  L4_1182 = L2_1180.getSystemCommand
  L4_1182 = L4_1182(L2_1180, 24239)
  if A0_1178:checkActor(L4_1182) == nil then
    return false
  end
  if A1_1179 ~= nil then
    if A1_1179 then
      L3_1181 = 1
    end
  elseif not L2_1180:_getNetStatUser(2) then
    L3_1181 = 1
  end
  return L2_1180:command(L4_1182, 2, L3_1181)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerCheck"
function L2_2(A0_1183)
  local L1_1184
  L1_1184 = A0_1183.getMainTargetCharacter
  L1_1184 = L1_1184(A0_1183)
  if A0_1183:isOtherPlayer(L1_1184) == false then
    return false
  end
  return A0_1183:openMainMenuRootWidget("PcProfileWidget", nil, L1_1184)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerRepair"
function L2_2(A0_1185)
  local L1_1186
  L1_1186 = A0_1185.getMainTargetCharacter
  L1_1186 = L1_1186(A0_1185)
  if A0_1185:isOtherPlayer(L1_1186) == false then
    return false
  end
  return A0_1185:openMainMenuRootWidget("RepairEquipmentWidget", nil, L1_1186)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openMateriaAttachContractWidget"
function L2_2(A0_1187)
  local L1_1188
  L1_1188 = A0_1187.getMainTargetCharacter
  L1_1188 = L1_1188(A0_1187)
  if A0_1187:isOtherPlayer(L1_1188) == false then
    return false
  end
  if A0_1187:getStaticWidget(17):isShow() == true then
    return false
  end
  return A0_1187:openRootWidget(3, "Ask/MateriaAttachAskWidget", nil, false, 100, nil, 3, L1_1188)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerEmote"
function L2_2(A0_1189, A1_1190, A2_1191, A3_1192)
  local L4_1193
  if A3_1192 == nil then
    L4_1193 = A0_1189.getCurrentTargetCharacter
    L4_1193 = L4_1193(A0_1189)
    A3_1192 = L4_1193
  end
  L4_1193 = worldMaster
  L4_1193 = L4_1193._getMyPlayer
  L4_1193 = L4_1193(L4_1193)
  if A3_1192 == L4_1193 then
    A3_1192 = nil
  end
  L4_1193 = 0
  if A2_1191 == true then
    L4_1193 = 1
  end
  return A0_1189:executePlayerCommandLocal(24102, A1_1190, L4_1193, nil, nil, A3_1192)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerSit"
function L2_2(A0_1194, A1_1195)
  return A0_1194:executePlayerCommandLocal(24312, A1_1195)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "canPartyCommand"
function L2_2(A0_1196)
  if worldMaster:_getMyPlayer():isRestrictedByContents(1) == true then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyInviteByName"
function L2_2(A0_1197, A1_1198)
  if A0_1197:canPartyCommand() == false then
    return false
  end
  if A0_1197:checkText(A1_1198) == false then
    return false
  end
  if string:contains(A1_1198, " ") == false then
    return false
  end
  return A0_1197:executePlayerCommandLocal(24203, A1_1198)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyInviteByActor"
function L2_2(A0_1199, A1_1200)
  if A0_1199:canPartyCommand() == false then
    return false
  end
  if A0_1199:checkActor(A1_1200) == nil then
    return false
  end
  if A1_1200:isPlayer() == false then
    return false
  end
  return A0_1199:executePlayerCommandLocal(24203, nil, nil, nil, nil, A1_1200)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyResign"
function L2_2(A0_1201)
  if A0_1201:canPartyCommand() == false then
    return false
  end
  return A0_1201:executePlayerCommandLocal(24205)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyKickByName"
function L2_2(A0_1202, A1_1203)
  if A0_1202:canPartyCommand() == false then
    return false
  end
  return A0_1202:executePlayerCommandLocal(24207, A1_1203)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyKickByActor"
function L2_2(A0_1204, A1_1205)
  if A0_1204:canPartyCommand() == false then
    return false
  end
  return A0_1204:executePlayerCommandLocal(24207, nil, nil, nil, nil, A1_1205)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyBreakup"
function L2_2(A0_1206)
  if A0_1206:canPartyCommand() == false then
    return false
  end
  return A0_1206:executePlayerCommandLocal(24206)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyConfirm"
function L2_2(A0_1207, A1_1208)
  local L2_1209, L3_1210, L4_1211, L5_1212, L6_1213
  L3_1210 = A0_1207
  L2_1209 = A0_1207.canPartyCommand
  L2_1209 = L2_1209(L3_1210)
  if L2_1209 == false then
    L2_1209 = false
    return L2_1209
  end
  L2_1209 = worldMaster
  L3_1210 = L2_1209
  L2_1209 = L2_1209._getMyPlayer
  L2_1209 = L2_1209(L3_1210)
  L4_1211 = L2_1209
  L3_1210 = L2_1209.getConfirmGroupCommandVariation
  L5_1212 = L3_1210(L4_1211)
  if L3_1210 ~= 10001 then
    L6_1213 = false
    return L6_1213
  end
  L6_1213 = 1
  if A1_1208 == false then
    L6_1213 = 2
  end
  return A0_1207:executePlayerCommandLocal(24303, 10001, L6_1213)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "alertCommandError"
function L2_2(A0_1214, A1_1215, A2_1216)
  local L3_1217
  if A1_1215 == nil then
    L3_1217 = worldMaster
    L3_1217 = L3_1217.alert
    L3_1217(L3_1217, worldMaster, 32706)
    return
  end
  L3_1217 = A1_1215._isAlive
  L3_1217 = L3_1217(A1_1215)
  if L3_1217 == false then
    L3_1217 = worldMaster
    L3_1217 = L3_1217.alert
    L3_1217(L3_1217, worldMaster, 32707)
    return
  end
  L3_1217 = A1_1215.getCommandId
  L3_1217 = L3_1217(A1_1215)
  if L3_1217 > 24300 and L3_1217 < 24400 or L3_1217 == 0 then
    worldMaster:alert(worldMaster, 32501)
  else
    worldMaster:alert(worldMaster, 32708, L3_1217)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "cancelPlayerCastCommand"
function L2_2(A0_1218, A1_1219)
  return A0_1218:executePlayerReadyCommand(21006, A1_1219)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerTargetMarking"
function L2_2(A0_1220, A1_1221, A2_1222)
  if A2_1222 == nil then
    A2_1222 = A0_1220:getCurrentTargetCharacter()
  end
  return A0_1220:executePlayerPartyTarget(A1_1221, 2, A2_1222)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerSignal"
function L2_2(A0_1223, A1_1224)
  local L2_1225, L3_1226, L4_1227, L5_1228
  L3_1226 = A0_1223
  L2_1225 = A0_1223.executePlayerPartyTarget
  L4_1227 = A1_1224
  L5_1228 = 1
  return L2_1225(L3_1226, L4_1227, L5_1228, worldMaster:_getMyPlayer())
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyTarget"
function L2_2(A0_1229, A1_1230, A2_1231, A3_1232)
  local L4_1233
  L4_1233 = A0_1229.checkActor
  L4_1233 = L4_1233(A0_1229, A3_1232)
  if L4_1233 == nil then
    L4_1233 = false
    return L4_1233
  end
  L4_1233 = 0
  if A1_1230 ~= nil then
    if A0_1229:isValidPartyTargetID(A1_1230) == true then
      if A1_1230 > 3 and A1_1230 < 8 then
        L4_1233 = A1_1230 + 100
      else
        L4_1233 = A1_1230 - 1 + 100
      end
    else
      return false
    end
  end
  return A0_1229:executePlayerReadyCommand(12011, L4_1233, A2_1231, 0, A3_1232)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isValidPartyTargetID"
function L2_2(A0_1234, A1_1235)
  local L2_1236
  if A1_1235 == nil then
    L2_1236 = false
    return L2_1236
  end
  if A1_1235 > 0 and A1_1235 <= 8 then
    L2_1236 = true
    return L2_1236
  end
  L2_1236 = false
  return L2_1236
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerActivation"
function L2_2(A0_1237, A1_1238)
  local L2_1239
  L2_1239 = false
  if A0_1237:isTutorialLock(4) == false then
    if A1_1238 == true then
      L2_1239 = A0_1237:executePlayerReadyCommand(21001)
    else
      L2_1239 = A0_1237:executePlayerReadyCommand(21002)
    end
  end
  return L2_1239
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCharacterUseItem"
function L2_2(A0_1240, A1_1241, A2_1242, A3_1243)
  local L4_1244
  L4_1244 = A0_1240.getItem
  L4_1244 = L4_1244(A0_1240, worldMaster:_getMyPlayer(), A1_1241, A2_1242)
  if L4_1244 == nil then
    return false
  end
  return A0_1240:executePlayerReadyCommand(21007, L4_1244, nil, nil, A3_1243)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCharacterEquipItem"
function L2_2(A0_1245, A1_1246, A2_1247, A3_1248)
  local L4_1249
  L4_1249 = A0_1245.getItem
  L4_1249 = L4_1249(A0_1245, worldMaster:_getMyPlayer(), A2_1247, A3_1248)
  if L4_1249 == nil then
    return false
  end
  return A0_1245:executePlayerReadyCommand(12009, L4_1249, nil, nil, nil, A1_1246)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCharacterRemoveItem"
function L2_2(A0_1250, A1_1251)
  return A0_1250:executePlayerReadyCommand(12009, nil, nil, nil, nil, A1_1251)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCharacterEquipItemSet"
function L2_2(A0_1252, A1_1253)
  return A0_1252:executePlayerReadyCommand(12007, A1_1253)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeRepairMyPlayerItem"
function L2_2(A0_1254, A1_1255, A2_1256)
  local L3_1257, L4_1258
  L3_1257 = worldMaster
  L4_1258 = L3_1257
  L3_1257 = L3_1257._getMyPlayer
  L3_1257 = L3_1257(L4_1258)
  L4_1258 = A0_1254.getItem
  L4_1258 = L4_1258(A0_1254, L3_1257, A1_1255, A2_1256)
  if L4_1258 == nil then
    return false
  end
  return A0_1254:executePlayerReadyCommand(22013, nil, L4_1258, nil, L3_1257)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeRepairBazaarItem"
function L2_2(A0_1259, A1_1260, A2_1261)
  local L3_1262, L4_1263, L5_1264
  L4_1263 = A0_1259
  L3_1262 = A0_1259.getBazaarActor
  L3_1262 = L3_1262(L4_1263)
  L5_1264 = A0_1259
  L4_1263 = A0_1259.getItem
  L4_1263 = L4_1263(L5_1264, L3_1262, A1_1260, A2_1261)
  if L4_1263 == nil then
    L5_1264 = false
    return L5_1264
  end
  L5_1264 = L4_1263._getDealingAttached
  L5_1264 = L5_1264(L4_1263)
  if L4_1263 == nil then
    return false
  end
  return A0_1259:executePlayerReadyCommand(22012, L4_1263, L5_1264, nil, L3_1262)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeBazaarCommand"
function L2_2(A0_1265)
  local L1_1266
  L1_1266 = A0_1265.getCurrentTargetCharacter
  L1_1266 = L1_1266(A0_1265)
  if L1_1266 == nil then
    L1_1266 = worldMaster:_getMyPlayer()
  end
  A0_1265.work.bazaarTargetActor = L1_1266
  return A0_1265:executePlayerCommandLocal(24215, nil, nil, nil, nil, L1_1266)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerItemMovePackage"
function L2_2(A0_1267, A1_1268, A2_1269, A3_1270, A4_1271)
  local L5_1272
  L5_1272 = A0_1267.getItem
  L5_1272 = L5_1272(A0_1267, worldMaster:_getMyPlayer(), A1_1268, A2_1269)
  if L5_1272 == nil then
    return false
  end
  return A0_1267:executePlayerCommandLocal(24223, L5_1272, A3_1270, A1_1268, nil, nil, A4_1271)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerItemSplit"
function L2_2(A0_1273, A1_1274, A2_1275, A3_1276)
  local L4_1277
  L4_1277 = A0_1273.getItem
  L4_1277 = L4_1277(A0_1273, worldMaster:_getMyPlayer(), A1_1274, A2_1275)
  if L4_1277 == nil then
    return false
  end
  if A3_1276 > L4_1277:_countStack() then
    return false
  end
  return A0_1273:executePlayerCommandLocal(24224, L4_1277, A3_1276, A1_1274)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerItemWaste"
function L2_2(A0_1278, A1_1279, A2_1280)
  local L3_1281
  L3_1281 = A0_1278.getItem
  L3_1281 = L3_1281(A0_1278, worldMaster:_getMyPlayer(), A1_1279, A2_1280)
  if L3_1281 == nil then
    return false
  end
  return A0_1278:executePlayerCommandLocal(24226, L3_1281, A1_1279)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerItemTransfer"
function L2_2(A0_1282, A1_1283, A2_1284, A3_1285, A4_1286)
  local L5_1287, L6_1288
  L6_1288 = A0_1282
  L5_1287 = A0_1282.getItem
  L5_1287 = L5_1287(L6_1288, worldMaster:_getMyPlayer(), A1_1283, A2_1284)
  if L5_1287 == nil then
    L6_1288 = false
    return L6_1288
  end
  L6_1288 = nil
  if A3_1285 == 0 then
    L6_1288 = A0_1282:getCurrentTargetCharacter()
  else
    L6_1288 = A0_1282:getPartyMemberActor(A3_1285)
  end
  if L6_1288 == nil then
    return false
  end
  return A0_1282:executePlayerCommandLocal(24225, L5_1287, A4_1286, A1_1283, nil, L6_1288)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerItemStuff"
function L2_2(A0_1289, A1_1290, A2_1291)
  local L3_1292
  L3_1292 = A0_1289.getItem
  L3_1292 = L3_1292(A0_1289, worldMaster:_getMyPlayer(), A1_1290, A2_1291)
  if L3_1292 == nil then
    return false
  end
  return A0_1289:executePlayerCommandLocal(24221, L3_1292)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerNPCLinkshellChat"
function L2_2(A0_1293, A1_1294)
  return A0_1293:executePlayerCommandLocal(24213, A1_1294)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLogout"
function L2_2(A0_1295, A1_1296)
  return A0_1295:executePlayerCommandLocal(24219, A1_1296)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerTelepo"
function L2_2(A0_1297, A1_1298)
  return A0_1297:executePlayerCommandLocal(24220, A1_1298)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerReturn"
function L2_2(A0_1299)
  return A0_1299:executePlayerCommandLocal(24220)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerSetCurrentLinkshell"
function L2_2(A0_1300, A1_1301)
  local L2_1302
  if A1_1301 ~= nil then
    L2_1302 = A0_1300:getLinkshellUniqueIdentifier(A1_1301)
    if L2_1302 == nil then
      return false
    end
  end
  if A0_1300:executePlayerCommandLocal(24236, L2_1302, nil, 1) == true and A1_1301 ~= nil then
    A0_1300:updateLinkshellMemberInformation(A1_1301)
  end
  return (A0_1300:executePlayerCommandLocal(24236, L2_1302, nil, 1))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerSetCurrentLinkshellInOrder"
function L2_2(A0_1303)
  local L1_1304, L2_1305, L3_1306, L4_1307, L5_1308, L6_1309, L7_1310, L8_1311, L9_1312, L10_1313
  L1_1304 = worldMaster
  L2_1305 = L1_1304
  L1_1304 = L1_1304._getMyPlayer
  L1_1304 = L1_1304(L2_1305)
  L3_1306 = L1_1304
  L2_1305 = L1_1304.countCommunityGroup
  L4_1307 = 20002
  L2_1305 = L2_1305(L3_1306, L4_1307)
  if L2_1305 == 0 then
    L3_1306 = false
    return L3_1306
  end
  L4_1307 = L1_1304
  L3_1306 = L1_1304.getCommunityGroupCurrent
  L3_1306 = L3_1306(L4_1307, L5_1308)
  L4_1307 = nil
  if L3_1306 == nil then
    L8_1311 = 1
    L4_1307 = L5_1308
  else
    for L8_1311 = 1, L2_1305 do
      L10_1313 = L1_1304
      L9_1312 = L1_1304.getCommunityGroup
      L9_1312 = L9_1312(L10_1313, 20002, L8_1311)
      if L3_1306 == L9_1312 then
        L10_1313 = L8_1311 + 1
        if L2_1305 >= L10_1313 then
          L4_1307 = L1_1304:getCommunityGroup(20002, L10_1313)
        end
        break
      end
    end
  end
  if L5_1308 == true and L4_1307 ~= nil then
    L8_1311 = L4_1307
    L6_1309(L7_1310, L8_1311)
  end
  return L5_1308
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLinkshellInvite"
function L2_2(A0_1314, A1_1315, A2_1316)
  local L3_1317
  L3_1317 = A0_1314.checkActor
  L3_1317 = L3_1317(A0_1314, A2_1316)
  if L3_1317 == nil then
    L3_1317 = false
    return L3_1317
  end
  L3_1317 = A0_1314.getLinkshellUniqueIdentifier
  L3_1317 = L3_1317(A0_1314, A1_1315)
  if L3_1317 == nil then
    return false
  end
  return A0_1314:executePlayerCommandLocal(24232, L3_1317, nil, nil, nil, A2_1316)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerCurrentLinkshellInvite"
function L2_2(A0_1318)
  local L1_1319, L2_1320
  L2_1320 = A0_1318
  L1_1319 = A0_1318.isInviteCurrnetLinkshellByTarget
  L1_1319 = L1_1319(L2_1320)
  if L1_1319 == false then
    L1_1319 = false
    return L1_1319
  end
  L1_1319 = worldMaster
  L2_1320 = L1_1319
  L1_1319 = L1_1319._getMyPlayer
  L1_1319 = L1_1319(L2_1320)
  L2_1320 = L1_1319
  L1_1319 = L1_1319.getCommunityGroupCurrent
  L1_1319 = L1_1319(L2_1320, 20002)
  L2_1320 = A0_1318.getCurrentTargetCharacter
  L2_1320 = L2_1320(A0_1318)
  return A0_1318:executePlayerLinkshellInvite(L1_1319, L2_1320)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLinkshellInviteFromName"
function L2_2(A0_1321, A1_1322, A2_1323)
  local L3_1324
  L3_1324 = type
  L3_1324 = L3_1324(A2_1323)
  if L3_1324 ~= "string" then
    L3_1324 = false
    return L3_1324
  end
  L3_1324 = A0_1321.getLinkshellUniqueIdentifier
  L3_1324 = L3_1324(A0_1321, A1_1322)
  if L3_1324 == nil then
    return false
  end
  return A0_1321:executePlayerCommandLocal(24232, L3_1324, A2_1323)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLinkshellInviteCancel"
function L2_2(A0_1325, A1_1326)
  if A0_1325:checkActor(A1_1326) == nil then
    return false
  end
  return A0_1325:executePlayerCommandLocal(24233, nil, nil, nil, nil, A1_1326)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLinkshellInviteCancelByName"
function L2_2(A0_1327, A1_1328)
  if type(A1_1328) ~= "string" then
    return false
  end
  return A0_1327:executePlayerCommandLocal(24233, A1_1328)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerTargetLinkshellInviteCancel"
function L2_2(A0_1329)
  local L1_1330
  L1_1330 = A0_1329.getCurrentTargetCharacter
  L1_1330 = L1_1330(A0_1329)
  return A0_1329:executePlayerLinkshellInviteCancel(L1_1330)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLinkshellResign"
function L2_2(A0_1331, A1_1332)
  local L2_1333, L3_1334
  L2_1333 = worldMaster
  L3_1334 = L2_1333
  L2_1333 = L2_1333._getMyPlayer
  L2_1333 = L2_1333(L3_1334)
  if A1_1332 == nil then
    L3_1334 = L2_1333.getCommunityGroupCurrent
    L3_1334 = L3_1334(L2_1333, 20002)
    A1_1332 = L3_1334
  end
  L3_1334 = A0_1331.checkActor
  L3_1334 = L3_1334(A0_1331, A1_1332)
  if L3_1334 == nil then
    L3_1334 = false
    return L3_1334
  end
  L3_1334 = A1_1332.isOwner
  L3_1334 = L3_1334(A1_1332, L2_1333)
  if L3_1334 == true then
    L3_1334 = false
    return L3_1334
  end
  L3_1334 = A0_1331.getLinkshellUniqueIdentifier
  L3_1334 = L3_1334(A0_1331, A1_1332)
  if L3_1334 == nil then
    return false
  end
  return A0_1331:executePlayerCommandLocal(24235, L3_1334)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLinkshellKick"
function L2_2(A0_1335, A1_1336, A2_1337)
  local L3_1338, L4_1339, L5_1340
  L3_1338 = A1_1336
  if L3_1338 == nil then
    L4_1339 = worldMaster
    L5_1340 = L4_1339
    L4_1339 = L4_1339._getMyPlayer
    L4_1339 = L4_1339(L5_1340)
    L5_1340 = L4_1339
    L4_1339 = L4_1339.getCommunityGroupCurrent
    L4_1339 = L4_1339(L5_1340, 20002)
    if L4_1339 == nil then
      L5_1340 = false
      return L5_1340
    end
    L3_1338 = L4_1339
  end
  L5_1340 = A0_1335
  L4_1339 = A0_1335.getLinkshellUniqueIdentifier
  L4_1339 = L4_1339(L5_1340, L3_1338)
  if L4_1339 == nil then
    L5_1340 = false
    return L5_1340
  end
  L5_1340 = L3_1338._getMemberLocalizedDisplayName
  L5_1340 = L5_1340(L3_1338, A2_1337)
  if L5_1340 == nil or L5_1340 == "" then
    A0_1335:updateLinkshellMemberInformation(L3_1338)
    return false
  end
  if A0_1335:executePlayerCommandLocal(24234, L4_1339, L5_1340) == true then
    A0_1335:updateLinkshellMemberInformation(L3_1338)
  end
  return (A0_1335:executePlayerCommandLocal(24234, L4_1339, L5_1340))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerLinkshellAppoint"
function L2_2(A0_1341, A1_1342, A2_1343, A3_1344)
  local L4_1345, L5_1346, L6_1347
  L4_1345 = A1_1342
  if L4_1345 == nil then
    L5_1346 = worldMaster
    L6_1347 = L5_1346
    L5_1346 = L5_1346._getMyPlayer
    L5_1346 = L5_1346(L6_1347)
    L6_1347 = L5_1346
    L5_1346 = L5_1346.getCommunityGroupCurrent
    L5_1346 = L5_1346(L6_1347, 20002)
    if L5_1346 == nil then
      L6_1347 = false
      return L6_1347
    end
    L4_1345 = L5_1346
  end
  L6_1347 = A0_1341
  L5_1346 = A0_1341.getLinkshellUniqueIdentifier
  L5_1346 = L5_1346(L6_1347, L4_1345)
  if L5_1346 == nil then
    L6_1347 = false
    return L6_1347
  end
  L6_1347 = L4_1345._getMemberLocalizedDisplayName
  L6_1347 = L6_1347(L4_1345, A2_1343)
  if L6_1347 == nil or L6_1347 == "" then
    A0_1341:updateLinkshellMemberInformation(A1_1342)
    return false
  end
  if A0_1341:executePlayerCommandLocal(24231, L5_1346, L6_1347, A3_1344) == true then
    A0_1341:updateLinkshellRankInformation(A1_1342)
  end
  return (A0_1341:executePlayerCommandLocal(24231, L5_1346, L6_1347, A3_1344))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerJobChange"
function L2_2(A0_1348, A1_1349)
  local L2_1350
  L2_1350 = 0
  if A1_1349 == true then
    L2_1350 = 1
  elseif A1_1349 == false then
    L2_1350 = 2
  end
  return desktopWidget:executePlayerCommand(12017, L2_1350)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPlayerGaugeMaxParameter"
function L2_2(A0_1351)
  local L1_1352, L2_1353, L3_1354, L4_1355
  L1_1352 = worldMaster
  L2_1353 = L1_1352
  L1_1352 = L1_1352._getMyPlayer
  L1_1352 = L1_1352(L2_1353)
  L3_1354 = L1_1352
  L2_1353 = L1_1352.getHPMax
  L2_1353 = L2_1353(L3_1354)
  L4_1355 = L1_1352
  L3_1354 = L1_1352.getMPMax
  L3_1354 = L3_1354(L4_1355)
  L4_1355 = L1_1352.getTPMax
  L4_1355 = L4_1355(L1_1352)
  return L2_1353, L3_1354, L4_1355
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPlayerGaugeCurrentParameter"
function L2_2(A0_1356)
  local L1_1357, L2_1358, L3_1359, L4_1360
  L1_1357 = worldMaster
  L2_1358 = L1_1357
  L1_1357 = L1_1357._getMyPlayer
  L1_1357 = L1_1357(L2_1358)
  L3_1359 = L1_1357
  L2_1358 = L1_1357.getHP
  L2_1358 = L2_1358(L3_1359)
  L4_1360 = L1_1357
  L3_1359 = L1_1357.getMP
  L3_1359 = L3_1359(L4_1360)
  L4_1360 = L1_1357.getTP
  L4_1360 = L4_1360(L1_1357)
  return L2_1358, L3_1359, L4_1360
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isStackIntoActionMenu"
function L2_2(A0_1361, A1_1362, A2_1363, A3_1364, A4_1365, A5_1366)
  local L6_1367, L7_1368, L8_1369, L9_1370, L10_1371, L11_1372, L12_1373
  L6_1367 = worldMaster
  L7_1368 = L6_1367
  L6_1367 = L6_1367._getMyPlayer
  L6_1367 = L6_1367(L7_1368)
  L8_1369 = A0_1361
  L7_1368 = A0_1361.checkActor
  L9_1370 = A1_1362
  L7_1368 = L7_1368(L8_1369, L9_1370)
  if L7_1368 == nil then
    L7_1368 = false
    L8_1369 = false
    return L7_1368, L8_1369
  end
  L8_1369 = A0_1361
  L7_1368 = A0_1361.getCurrentTargetCharacter
  L7_1368 = L7_1368(L8_1369)
  L9_1370 = A1_1362
  L8_1369 = A1_1362.processCanFireWithoutTarget
  L10_1371 = L6_1367
  L11_1372 = A2_1363
  L12_1373 = A3_1364
  L10_1371 = L8_1369(L9_1370, L10_1371, L11_1372, L12_1373, A4_1365)
  if L7_1368 == nil then
    L7_1368 = L6_1367
  end
  L12_1373 = A1_1362
  L11_1372 = A1_1362.isActionMenu
  L11_1372 = L11_1372(L12_1373, L6_1367, L7_1368)
  L12_1373 = L11_1372
  return L12_1373, L8_1369, L10_1371
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPlayerActionCommandData"
function L2_2(A0_1374, A1_1375, A2_1376)
  if A0_1374:checkActor(A1_1375) == nil then
    return nil
  end
  return A1_1375:getGameCommandBasicData(A2_1376)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getCommandID"
function L2_2(A0_1377, A1_1378)
  if A0_1377:checkActor(A1_1378) == nil then
    return -1
  end
  return A1_1378:getCommandId()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "canTargetJoinMyPlayerParty"
function L2_2(A0_1379)
  local L1_1380
  L1_1380 = A0_1379.getCurrentTargetCharacter
  L1_1380 = L1_1380(A0_1379)
  if L1_1380 == nil then
    return false
  end
  if L1_1380 == worldMaster:_getMyPlayer() then
    return false
  end
  if not L1_1380:isPlayer() then
    return false
  end
  if A0_1379:isJoinedCharacterAtMyParty(L1_1380) > 0 then
    return false
  end
  if not worldMaster:_getMyPlayer():isPartyLeader() then
    return false
  end
  if worldMaster:_getMyPlayer():hasRelationGroup(50001, L1_1380) then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isJoinedPartyMyPlayer"
function L2_2(A0_1381)
  if worldMaster:_getMyPlayer():getPlayerParty():_countMember() > 1 then
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isMyPartyLeader"
function L2_2(A0_1382, A1_1383)
  if A1_1383 > worldMaster:_getMyPlayer():getPlayerParty():_countMember() then
    return false
  end
  return worldMaster:_getMyPlayer():getPlayerParty():isPartyLeader(A1_1383)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isMyPartyLeaderForMyPlayer"
function L2_2(A0_1384)
  local L1_1385
  L1_1385 = worldMaster
  L1_1385 = L1_1385._getMyPlayer
  L1_1385 = L1_1385(L1_1385)
  return L1_1385:getPlayerParty():isPartyLeader(L1_1385)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setPlayerPartyLeaderMark"
function L2_2(A0_1386, A1_1387)
  local L2_1388, L3_1389, L4_1390
  L2_1388 = worldMaster
  L3_1389 = L2_1388
  L2_1388 = L2_1388._getMyPlayer
  L2_1388 = L2_1388(L3_1389)
  L4_1390 = L2_1388
  L3_1389 = L2_1388.getPlayerParty
  L3_1389 = L3_1389(L4_1390)
  L4_1390 = A0_1386.getStaticWidget
  L4_1390 = L4_1390(A0_1386, 4)
  if A0_1386:checkActor(L4_1390) ~= nil then
    L4_1390:setPartyLeader(A1_1387)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isJoinedCharacterAtMyParty"
function L2_2(A0_1391, A1_1392)
  local L2_1393, L3_1394, L4_1395, L5_1396, L6_1397, L7_1398, L8_1399
  L3_1394 = A0_1391
  L2_1393 = A0_1391.checkActor
  L4_1395 = A1_1392
  L2_1393 = L2_1393(L3_1394, L4_1395)
  if L2_1393 == nil then
    L2_1393 = 0
    return L2_1393
  end
  L2_1393 = worldMaster
  L3_1394 = L2_1393
  L2_1393 = L2_1393._getMyPlayer
  L2_1393 = L2_1393(L3_1394)
  L4_1395 = L2_1393
  L3_1394 = L2_1393.getPlayerParty
  L3_1394 = L3_1394(L4_1395)
  L4_1395 = L3_1394._countMember
  L4_1395 = L4_1395(L5_1396)
  if L4_1395 > 1 then
    for L8_1399 = 1, L4_1395 do
      if L3_1394:_isMember(A1_1392, L8_1399) then
        return L8_1399
      end
    end
  end
  return L5_1396
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isJoinedPartyMember"
function L2_2(A0_1400, A1_1401)
  local L2_1402, L3_1403
  L2_1402 = false
  L3_1403 = false
  if A1_1401 > worldMaster:_getMyPlayer():getPlayerParty():_countMember() then
  elseif worldMaster:_getMyPlayer():getPlayerParty():_isExistInClientMember(A1_1401) then
    L2_1402 = true
    L3_1403 = true
  elseif not worldMaster:_getMyPlayer():getPlayerParty():_isExistInWorldMember(A1_1401) then
    L2_1402 = false
    L3_1403 = false
  else
    L2_1402 = false
    L3_1403 = true
  end
  return L2_1402, L3_1403
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "countPartyMember"
function L2_2(A0_1404)
  return worldMaster:_getMyPlayer():getPlayerParty():_countMember()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberActor"
function L2_2(A0_1405, A1_1406)
  if not A0_1405:isJoinedPartyMyPlayer() then
    return nil
  end
  if A1_1406 > worldMaster:_getMyPlayer():getPlayerParty():_countMember() then
    return nil
  elseif not worldMaster:_getMyPlayer():getPlayerParty():_isExistInClientMember(A1_1406) then
    return nil
  end
  return worldMaster:_getMyPlayer():getPlayerParty():_getMember(A1_1406)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setTargetCharacterForPartyMember"
function L2_2(A0_1407, A1_1408, A2_1409)
  local L3_1410, L4_1411
  L3_1410 = false
  L4_1411 = A0_1407.getPartyMemberActor
  L4_1411 = L4_1411(A0_1407, A1_1408)
  if L4_1411 ~= nil then
    L3_1410 = A0_1407:setShortcutTarget(L4_1411, A2_1409)
  end
  return L3_1410
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setShortcutTarget"
function L2_2(A0_1412, A1_1413, A2_1414)
  local L3_1415
  L3_1415 = A0_1412._getCurrentTargetCursor
  L3_1415 = L3_1415(A0_1412)
  if A1_1413 == nil then
    return A0_1412:setTargetCharacter(L3_1415, nil)
  end
  if L3_1415 == 1 then
    if A0_1412:isValidTarget(A1_1413) == false then
      return false
    end
  elseif A0_1412:checkSubTargetable(A1_1413, A0_1412.work.subTargetCursorType) == false then
    return false
  end
  if A2_1414 ~= true and A0_1412:isSubTargetSelectMode() == true then
    A0_1412:subTargetDecided(A1_1413)
    return true
  end
  return A0_1412:setTargetCharacter(L3_1415, A1_1413)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberWorkIndex"
function L2_2(A0_1416, A1_1417)
  local L2_1418, L3_1419, L4_1420, L5_1421, L6_1422
  L2_1418 = 1
  for L6_1422 = 1, 8 do
    if A0_1416:isPartyMemberActorMe(L6_1422) == false then
      if A1_1417 == L2_1418 then
        return L6_1422
      end
      L2_1418 = L2_1418 + 1
    end
  end
  return L3_1419
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberListIndex"
function L2_2(A0_1423, A1_1424)
  local L2_1425, L3_1426, L4_1427, L5_1428, L6_1429, L7_1430, L8_1431, L9_1432
  L3_1426 = A0_1423
  L2_1425 = A0_1423.checkActor
  L4_1427 = A1_1424
  L2_1425 = L2_1425(L3_1426, L4_1427)
  if L2_1425 == nil then
    L2_1425 = 0
    return L2_1425
  end
  L2_1425 = worldMaster
  L3_1426 = L2_1425
  L2_1425 = L2_1425._getMyPlayer
  L2_1425 = L2_1425(L3_1426)
  if A1_1424 == L2_1425 then
    L3_1426 = 0
    return L3_1426
  end
  L4_1427 = L2_1425
  L3_1426 = L2_1425.getPlayerParty
  L3_1426 = L3_1426(L4_1427)
  L5_1428 = L3_1426
  L4_1427 = L3_1426._countMember
  L4_1427 = L4_1427(L5_1428)
  L5_1428 = 1
  if L4_1427 > 1 then
    for L9_1432 = 1, L4_1427 do
      if L3_1426:_isMember(L2_1425, L9_1432) == false then
        if L3_1426:_isMember(A1_1424, L9_1432) == true then
          return L5_1428
        end
        L5_1428 = L5_1428 + 1
      end
    end
  end
  return L6_1429
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "partyMemberTargetShortcut"
function L2_2(A0_1433, A1_1434, A2_1435)
  local L3_1436
  L3_1436 = A0_1433.getPartyMemberWorkIndex
  L3_1436 = L3_1436(A0_1433, A1_1434)
  if L3_1436 == 0 then
    return
  end
  A0_1433:setTargetCharacterForPartyMember(L3_1436, A2_1435)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isPartyMemberActorMe"
function L2_2(A0_1437, A1_1438)
  local L2_1439
  L2_1439 = A0_1437.isJoinedPartyMyPlayer
  L2_1439 = L2_1439(A0_1437)
  if not L2_1439 then
    L2_1439 = false
    return L2_1439
  end
  L2_1439 = worldMaster
  L2_1439 = L2_1439._getMyPlayer
  L2_1439 = L2_1439(L2_1439)
  if A1_1438 > L2_1439:getPlayerParty():_countMember() then
    return false
  end
  return L2_1439:getPlayerParty():_isMember(L2_1439, A1_1438)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberDisplayName"
function L2_2(A0_1440, A1_1441)
  if not A0_1440:isJoinedPartyMyPlayer() then
    return nil
  end
  if A1_1441 > worldMaster:_getMyPlayer():getPlayerParty():_countMember() then
    return nil
  end
  return (worldMaster:_getMyPlayer():getPlayerParty():_getMemberLocalizedDisplayName(A1_1441))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getMyPartyMemberDisplayName"
function L2_2(A0_1442, A1_1443)
  if not A0_1442:isJoinedPartyMyPlayer() then
    return nil
  end
  if A1_1443 > worldMaster:_getMyPlayer():getPlayerParty():_countMember() then
    return nil
  end
  return worldMaster:_getMyPlayer():getPlayerParty():_getMemberDisplayName(A1_1443)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isMyPartyMatcing"
function L2_2(A0_1444)
  if not A0_1444:isJoinedPartyMyPlayer() then
    return false
  end
  if A0_1444:getWidget(3, "PartyRootWidget") == nil then
    return false
  end
  if A0_1444:getWidget(3, "PartyRootWidget"):getEditMode() < 1 then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberCurrentParameter"
function L2_2(A0_1445, A1_1446)
  local L2_1447, L3_1448, L4_1449, L5_1450
  L3_1448 = A0_1445
  L2_1447 = A0_1445.getPartyMemberActor
  L4_1449 = A1_1446
  L2_1447 = L2_1447(L3_1448, L4_1449)
  if L2_1447 == nil then
    L3_1448, L4_1449, L5_1450 = nil, nil, nil
    return L3_1448, L4_1449, L5_1450
  end
  L4_1449 = L2_1447
  L3_1448 = L2_1447.getHP
  L3_1448 = L3_1448(L4_1449)
  L5_1450 = L2_1447
  L4_1449 = L2_1447.getMP
  L4_1449 = L4_1449(L5_1450)
  L5_1450 = L2_1447.getTP
  L5_1450 = L5_1450(L2_1447)
  return L3_1448, L4_1449, L5_1450
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberMaxParameter"
function L2_2(A0_1451, A1_1452)
  local L2_1453, L3_1454, L4_1455
  L3_1454 = A0_1451
  L2_1453 = A0_1451.getPartyMemberActor
  L4_1455 = A1_1452
  L2_1453 = L2_1453(L3_1454, L4_1455)
  if L2_1453 == nil then
    L3_1454, L4_1455 = nil, nil
    return L3_1454, L4_1455, nil
  end
  L4_1455 = L2_1453
  L3_1454 = L2_1453.getHPMax
  L3_1454 = L3_1454(L4_1455)
  L4_1455 = L2_1453.getMPMax
  L4_1455 = L4_1455(L2_1453)
  return L3_1454, L4_1455
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberStatusSlotLength"
function L2_2(A0_1456, A1_1457)
  local L2_1458
  L2_1458 = A0_1456.getPartyMemberActor
  L2_1458 = L2_1458(A0_1456, A1_1457)
  if L2_1458 == nil then
    return 0
  end
  return (A0_1456:getCharacterStatusSlotLength(L2_1458))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberBufferStatus"
function L2_2(A0_1459, A1_1460, A2_1461)
  local L3_1462, L4_1463, L5_1464, L6_1465, L7_1466, L8_1467
  L4_1463 = A0_1459
  L3_1462 = A0_1459.getPartyMemberActor
  L5_1464 = A1_1460
  L3_1462 = L3_1462(L4_1463, L5_1464)
  if L3_1462 == nil then
    L4_1463 = 0
    return L4_1463
  end
  L5_1464 = A0_1459
  L4_1463 = A0_1459.getCharacterBufferStatus
  L6_1465 = L3_1462
  L7_1466 = A2_1461
  L6_1465 = L4_1463(L5_1464, L6_1465, L7_1466)
  L7_1466 = L4_1463
  L8_1467 = L5_1464
  return L7_1466, L8_1467, L6_1465
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getStackedCombinationCountByPartyMember"
function L2_2(A0_1468, A1_1469)
  if A0_1468:getPartyMemberActor(A1_1469) == nil then
    return 0
  end
  return A0_1468:getPartyMemberActor(A1_1469):getMyCombinationStackedNum()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberSkillNumber"
function L2_2(A0_1470, A1_1471)
  local L2_1472, L3_1473, L4_1474
  L3_1473 = A0_1470
  L2_1472 = A0_1470.getPartyMemberActor
  L4_1474 = A1_1471
  L2_1472 = L2_1472(L3_1473, L4_1474)
  if L2_1472 == nil then
    L3_1473 = 0
    L4_1474 = 0
    return L3_1473, L4_1474
  end
  L4_1474 = L2_1472
  L3_1473 = L2_1472.getStateMainSkill
  L3_1473 = L3_1473(L4_1474)
  if L3_1473 == nil then
    L4_1474 = 0
    return L4_1474, 0
  end
  L4_1474 = L2_1472.getMainClassOrJob
  L4_1474 = L4_1474(L2_1472)
  if L2_1472:isJob(L4_1474) == false then
    L4_1474 = 0
  end
  return L3_1473, L4_1474
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberSkillRank"
function L2_2(A0_1475, A1_1476)
  local L2_1477, L3_1478
  L3_1478 = A0_1475
  L2_1477 = A0_1475.getPartyMemberActor
  L2_1477 = L2_1477(L3_1478, A1_1476)
  if L2_1477 == nil then
    L3_1478 = 0
    return L3_1478
  end
  L3_1478 = L2_1477.getStateMainSkill
  L3_1478 = L3_1478(L2_1477)
  if L3_1478 == nil then
    return 0
  end
  return L2_1477:getStateMainSkillLevel(L3_1478)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "changeTargetOnlyPartyMember"
function L2_2(A0_1479, A1_1480, A2_1481)
  local L3_1482
  L3_1482 = A0_1479.getPartyMemberIndexNextTarget
  L3_1482 = L3_1482(A0_1479, A0_1479.work.partyTargetIndex, A1_1480)
  if L3_1482 == 0 then
    if A0_1479:setTargetCharacterForMyPlayer(A2_1481) == false then
      L3_1482 = A0_1479:getPartyMemberIndexNextTarget(L3_1482, A1_1480)
      if L3_1482 ~= 0 then
        A0_1479:partyMemberTargetShortcut(L3_1482, A2_1481)
      end
    end
  else
    A0_1479:partyMemberTargetShortcut(L3_1482, A2_1481)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "canTargetForPartyMember"
function L2_2(A0_1483, A1_1484)
  local L2_1485, L3_1486, L4_1487, L5_1488, L6_1489, L7_1490, L8_1491, L9_1492
  L3_1486 = A0_1483
  L2_1485 = A0_1483.isJoinedPartyMember
  L4_1487 = A1_1484
  L2_1485 = L2_1485(L3_1486, L4_1487)
  if L2_1485 == false then
    L3_1486 = false
    return L3_1486
  end
  L4_1487 = A0_1483
  L3_1486 = A0_1483.getPartyMemberActor
  L5_1488 = A1_1484
  L3_1486 = L3_1486(L4_1487, L5_1488)
  if L3_1486 == nil then
    L4_1487 = false
    return L4_1487
  end
  L4_1487 = worldMaster
  L5_1488 = L4_1487
  L4_1487 = L4_1487._getMyPlayer
  L4_1487 = L4_1487(L5_1488)
  L5_1488 = L4_1487
  L4_1487 = L4_1487._getPos
  L6_1489 = L4_1487(L5_1488)
  L8_1491 = L3_1486
  L7_1490 = L3_1486._getPos
  L9_1492 = L7_1490(L8_1491)
  if math:distance(L4_1487, L5_1488, L6_1489, L7_1490, L8_1491, L9_1492) > 50 then
    return false
  end
  if A0_1483:_getCurrentTargetCursor() == 1 then
    return A0_1483:isValidTarget(L3_1486)
  elseif A0_1483:_getCurrentTargetCursor() == A0_1483.work.subTargetCursorIndex[1] then
    if A0_1483:checkSubTargetable(L3_1486, A0_1483.work.subTargetCursorType) == false then
      return false
    end
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPartyMemberIndexNextTarget"
function L2_2(A0_1493, A1_1494, A2_1495)
  local L3_1496, L4_1497, L5_1498, L6_1499, L7_1500
  L3_1496 = worldMaster
  L4_1497 = L3_1496
  L3_1496 = L3_1496._getMyPlayer
  L3_1496 = L3_1496(L4_1497)
  L5_1498 = L3_1496
  L4_1497 = L3_1496.getPlayerParty
  L4_1497 = L4_1497(L5_1498)
  L6_1499 = L4_1497
  L5_1498 = L4_1497._countMember
  L5_1498 = L5_1498(L6_1499)
  L5_1498 = L5_1498 - 1
  if L5_1498 == 0 or A1_1494 < 0 or A1_1494 > L5_1498 then
    L6_1499 = 0
    return L6_1499
  end
  L6_1499 = A1_1494
  L7_1500 = nil
  for _FORV_11_ = 0, L5_1498 do
    if A2_1495 == true then
      L6_1499 = L6_1499 + 1
      if L5_1498 < L6_1499 then
        L6_1499 = 0
      end
    else
      L6_1499 = L6_1499 - 1
      if L6_1499 < 0 then
        L6_1499 = L5_1498
      end
    end
    L7_1500 = A0_1493:getPartyMemberWorkIndex(L6_1499)
    if L7_1500 == 0 then
      return 0
    elseif L7_1500 > 0 and A0_1493:canTargetForPartyMember(L7_1500) == true then
      return L6_1499
    end
  end
  return _FOR_
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "canTargetNegotiation"
function L2_2(A0_1501)
  if A0_1501:getReadyCommand(16) == nil then
    return false
  end
  if not worldMaster:_getMyPlayer():enableNegotiation() then
    return false
  end
  if A0_1501:getCurrentTargetCharacter() == nil then
    return false
  end
  if A0_1501:getCurrentTargetCharacter():isPlayer() then
    return false
  end
  if not A0_1501:getCurrentTargetCharacter():isNegotiatable() then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeNegotiationCommand"
function L2_2(A0_1502)
  local L1_1503, L2_1504
  L1_1503 = false
  L2_1504 = A0_1502.getReadyCommand
  L2_1504 = L2_1504(A0_1502, 16)
  if L2_1504 ~= nil then
    L1_1503 = A0_1502:executePlayerCommand(L2_1504)
  end
  return L1_1503
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askGuildleveSelectPackNumber"
function L2_2(A0_1505, A1_1506, A2_1507)
  local L3_1508, L4_1509, L5_1510, L6_1511, L7_1512, L8_1513, L9_1514, L10_1515
  L5_1510 = A0_1505
  L4_1509 = A0_1505.openWidgetYield
  L9_1514 = nil
  L10_1515 = false
  L4_1509 = L4_1509(L5_1510, L6_1511, L7_1512, L8_1513, L9_1514, L10_1515, A2_1507)
  if L4_1509 ~= nil then
    L5_1510 = A1_1506.getMaxGuildlevePackNum
    L5_1510 = L5_1510(L6_1511)
    for L9_1514 = 1, L5_1510 do
      L10_1515 = A1_1506.getPreGuildlevePackId
      L10_1515 = L10_1515(A1_1506, L9_1514)
      L4_1509:addAreaParameter(L9_1514, L10_1515)
    end
    L6_1511(L7_1512)
    L9_1514 = true
    if L6_1511 == true then
      L3_1508 = L6_1511
    end
    L6_1511(L7_1512, L8_1513)
  end
  return L3_1508
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askGuildleveSelectCard"
function L2_2(A0_1516, A1_1517)
  local L2_1518, L3_1519, L4_1520, L5_1521, L6_1522, L7_1523, L8_1524
  L4_1520 = A1_1517
  L3_1519 = A1_1517.getMaxCardNum
  L3_1519 = L3_1519(L4_1520)
  L4_1520 = {}
  for L8_1524 = 1, L3_1519 do
    L4_1520[L8_1524] = A1_1517:getPreGuildleveId(L8_1524)
  end
  L8_1524 = "Ask/GuildleveCardOrderWidget"
  if L5_1521 ~= nil then
    L8_1524 = L5_1521
    if L6_1522 == true then
      L2_1518 = L6_1522
    end
    L8_1524 = L5_1521
    L6_1522(L7_1523, L8_1524)
  end
  return L2_1518
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askJournalDetailWidget"
function L2_2(A0_1525, A1_1526, A2_1527, ...)
  local L4_1529, L5_1530, L6_1531, L7_1532, L8_1533, L9_1534, L10_1535, L11_1536, L12_1537, L13_1538, L14_1539, L15_1540, L16_1541, L17_1542
  L6_1531 = 3
  L7_1532 = false
  L8_1533 = false
  L9_1534 = A1_1526
  if L9_1534 == 9 then
    L5_1530 = 1
    break
  else
  end
  if L9_1534 == 6 then
    L5_1530 = 1
    L6_1531 = 4
    break
  else
  end
  if L9_1534 == 10 then
    L5_1530 = 1
    L7_1532 = true
    break
  else
  end
  if L9_1534 == 7 then
    L5_1530 = 2
    L6_1531 = 2
    break
  else
  end
  if L9_1534 == 11 then
    L5_1530 = 2
    break
  else
  end
  if L9_1534 == 13 then
    L5_1530 = 2
    L6_1531 = 4
    break
  else
  end
  if L9_1534 == 1 then
    L5_1530 = 3
    L6_1531 = 2
    do break end
    break
  else
  end
  L9_1534, L10_1535, L11_1536, L12_1537, L13_1538, L14_1539, L15_1540, L16_1541 = nil, nil, nil, nil, nil, nil, nil, nil
  if L5_1530 == 1 then
    L9_1534 = nil
    L17_1542 = select
    L17_1542 = L17_1542(6, ...)
    L10_1535 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(2, ...)
    L11_1536 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(3, ...)
    L12_1537 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(4, ...)
    L13_1538 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(5, ...)
    L14_1539 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(1, ...)
    L15_1540 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(7, ...)
    L16_1541 = L17_1542
  elseif L5_1530 == 2 then
    L17_1542 = select
    L17_1542 = L17_1542(1, ...)
    L9_1534 = L17_1542
    L10_1535 = nil
    L17_1542 = select
    L17_1542 = L17_1542(2, ...)
    L11_1536 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(3, ...)
    L12_1537 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(4, ...)
    L13_1538 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(5, ...)
    L14_1539 = L17_1542
    L15_1540, L16_1541 = nil, nil
  else
    L17_1542 = select
    L17_1542 = L17_1542(1, ...)
    L9_1534 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(2, ...)
    L10_1535 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(3, ...)
    L11_1536 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(4, ...)
    L12_1537 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(5, ...)
    L13_1538 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(6, ...)
    L14_1539 = L17_1542
    L17_1542 = select
    L17_1542 = L17_1542(7, ...)
    L15_1540 = L17_1542
    L16_1541 = nil
  end
  L17_1542 = A0_1525.openWidgetYield
  L17_1542 = L17_1542(A0_1525, 4, "Ask/JournalDetailWidget", nil, nil, false, L6_1531, L5_1530, A2_1527, L7_1532, L8_1533)
  if L17_1542 ~= nil then
    L17_1542:setDetailData(L9_1534, L10_1535, L11_1536, L12_1537, L13_1538, L14_1539, L15_1540, L16_1541)
    if A0_1525:selectWidgetYield(L17_1542, true) == true and L17_1542:getAskResult() == 1 then
      L4_1529 = true
    end
    A0_1525:closeWidgetDirect(L17_1542)
  end
  return L4_1529
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askGuildleveChangeCard"
function L2_2(A0_1543, A1_1544)
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askNextGuildleveJournal"
function L2_2(A0_1545, A1_1546, ...)
  local L3_1548, L4_1549, L5_1550, L6_1551, L7_1552
  L4_1549 = A0_1545
  L3_1548 = A0_1545.askJournalDetailWidget
  L5_1550 = 10
  L6_1551 = A1_1546
  L7_1552 = ...
  return L3_1548(L4_1549, L5_1550, L6_1551, L7_1552)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askRetainerListWidget"
function L2_2(A0_1553, A1_1554, ...)
  local L3_1556, L4_1557, L5_1558, L6_1559, L7_1560, L8_1561
  L4_1557 = A0_1553
  L3_1556 = A0_1553.askEventModeWidgetYield2
  L5_1558 = "RetainerListWidget"
  L6_1559 = 1
  L7_1560 = true
  L8_1561 = ...
  return L3_1556(L4_1557, L5_1558, L6_1559, L7_1560, L8_1561)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askRetainerNamingWidget"
function L2_2(A0_1562, A1_1563, ...)
  local L3_1565, L4_1566, L5_1567, L6_1568, L7_1569, L8_1570
  L4_1566 = A0_1562
  L3_1565 = A0_1562.askEventModeWidgetYield2
  L5_1567 = "Ask/RetainerNamingWidget"
  L6_1568 = 2
  L7_1569 = true
  L8_1570 = ...
  return L3_1565(L4_1566, L5_1567, L6_1568, L7_1569, L8_1570)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askRetainerPaymentWidget"
function L2_2(A0_1571, A1_1572, ...)
  local L3_1574, L4_1575, L5_1576, L6_1577, L7_1578, L8_1579
  L4_1575 = A0_1571
  L3_1574 = A0_1571.askEventModeWidgetYield2
  L5_1576 = "RetainerPaymentWidget"
  L6_1577 = 1
  L7_1578 = true
  L8_1579 = ...
  return L3_1574(L4_1575, L5_1576, L6_1577, L7_1578, L8_1579)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openRetainerTradeWidget"
function L2_2(A0_1580, A1_1581, ...)
  if A0_1580:getRetainer() == nil then
    return false
  end
  return A0_1580:openEventModeWidgetYield("RetainerTradeWidget", ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeRetainerTradeWidget"
function L2_2(A0_1583, A1_1584)
  return A0_1583:closeWidget(4, "RetainerTradeWidget")
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectRetainerTradeWidget"
function L2_2(A0_1585, A1_1586)
  local L2_1587, L3_1588, L4_1589, L5_1590, L6_1591
  L2_1587 = 0
  L3_1588 = 0
  L4_1589 = 0
  L5_1590 = 0
  L6_1591 = A0_1585.getWidget
  L6_1591 = L6_1591(A0_1585, 4, "RetainerTradeWidget")
  if L6_1591 ~= nil then
    L6_1591:show()
    L6_1591:reActivateWidget()
    if A0_1585:selectWidgetYield(L6_1591) == true then
      L2_1587, L3_1588, L4_1589, L5_1590 = L6_1591:getAskResult()
    end
  end
  return L2_1587, L3_1588, L4_1589, L5_1590
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "noticeRetainerTradeResult"
function L2_2(A0_1592, A1_1593, A2_1594)
  if A0_1592:getWidget(4, "RetainerTradeWidget") ~= nil then
    A0_1592:getWidget(4, "RetainerTradeWidget"):noticeItemTransferResult(A1_1593, A2_1594)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openRetainerItemListWidget"
function L2_2(A0_1595, A1_1596, ...)
  if A0_1595:getRetainer() == nil then
    return false
  end
  return A0_1595:openEventModeWidgetYield("Ask/RetainerItemListWidget", ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeRetainerItemListWidget"
function L2_2(A0_1598, A1_1599)
  return A0_1598:closeWidget(4, "Ask/RetainerItemListWidget")
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectRetainerItemListWidget"
function L2_2(A0_1600, A1_1601)
  local L2_1602, L3_1603, L4_1604, L5_1605, L6_1606, L7_1607, L8_1608, L9_1609, L10_1610, L11_1611
  L2_1602 = 0
  L3_1603 = 0
  L4_1604 = 0
  L5_1605 = 0
  L6_1606 = 0
  L7_1607 = 0
  L8_1608 = 0
  L9_1609 = 0
  L10_1610 = 0
  L11_1611 = A0_1600.getWidget
  L11_1611 = L11_1611(A0_1600, 4, "Ask/RetainerItemListWidget")
  if L11_1611 ~= nil then
    L11_1611:show()
    L11_1611:setAskParameter()
    if A0_1600:selectWidgetYield(L11_1611) == true then
      L2_1602, L3_1603, L4_1604, L5_1605, L6_1606, L7_1607, L8_1608, L9_1609, L10_1610 = L11_1611:getAskResult()
    end
  end
  return L2_1602, L3_1603, L4_1604, L5_1605, L6_1606, L7_1607, L8_1608, L9_1609, L10_1610
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getRetainer"
function L2_2(A0_1612)
  local L1_1613, L2_1614, L3_1615, L4_1616, L5_1617, L6_1618, L7_1619, L8_1620
  L1_1613 = worldMaster
  L2_1614 = L1_1613
  L1_1613 = L1_1613._getMyPlayer
  L1_1613 = L1_1613(L2_1614)
  L3_1615 = L1_1613
  L2_1614 = L1_1613.getRelationGroup
  L4_1616 = 50003
  L2_1614 = L2_1614(L3_1615, L4_1616)
  if L2_1614 == nil then
    L3_1615 = nil
    return L3_1615
  end
  L3_1615 = nil
  L4_1616 = L2_1614._countMember
  L4_1616 = L4_1616(L5_1617)
  for L8_1620 = 1, L4_1616 do
    if L2_1614:_isExistInClientMember(L8_1620) == true and L2_1614:_getMember(L8_1620):_isAlive() == true and L2_1614:_getMember(L8_1620):isPlayer() == false and L2_1614:_getMember(L8_1620):isRetainer() == true then
      L3_1615 = L2_1614:_getMember(L8_1620)
      break
    end
  end
  return L3_1615
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getRetainerName"
function L2_2(A0_1621)
  if A0_1621:getRetainer() == nil then
    return nil
  end
  return A0_1621:getRetainer():_getLocalizedDisplayName()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isValidRetainer"
function L2_2(A0_1622)
  if A0_1622:getRetainer() == nil then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "countRetainerMember"
function L2_2(A0_1623)
  if worldMaster:_getMyPlayer():_getGroup(80001) == nil then
    return nil
  end
  return worldMaster:_getMyPlayer():_getGroup(80001):_countMember()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getRetainerMemberInfo"
function L2_2(A0_1624, A1_1625)
  local L2_1626, L3_1627, L4_1628, L5_1629, L6_1630, L7_1631
  L2_1626 = 0
  L3_1627 = 0
  L4_1628 = 0
  L5_1629 = 0
  L6_1630 = ""
  L7_1631 = 0
  if worldMaster:_getMyPlayer():_getGroup(80001) ~= nil then
    L2_1626 = worldMaster:_getMyPlayer():_getGroup(80001):getMemberWorkCoordinateId(A1_1625)
    L3_1627 = worldMaster:_getMyPlayer():_getGroup(80001):getMemberWorkEmploymentState(A1_1625)
    L4_1628 = worldMaster:_getMyPlayer():_getGroup(80001):getMemberLocation(A1_1625)
    L5_1629 = worldMaster:_getMyPlayer():_getGroup(80001):getMemberRetainerLevel(A1_1625)
    L6_1630 = worldMaster:_getMyPlayer():_getGroup(80001):_getMemberLocalizedDisplayName(A1_1625)
    L7_1631 = worldMaster:_getMyPlayer():_getGroup(80001):getMemberTown(A1_1625)
    if worldMaster:_getMyPlayer():_getGroup(80001):isPlayerMember(A1_1625) == true then
      L3_1627 = 127
    end
  end
  return L2_1626, L3_1627, L4_1628, L5_1629, L6_1630, L7_1631
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPlayerMainSkillNumber"
function L2_2(A0_1632)
  return 0
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPlayerSkillRank"
function L2_2(A0_1633, A1_1634)
  if worldMaster:_getMyPlayer():isJob(A1_1634) then
    if not worldMaster:_getMyPlayer():hasJobStone(A1_1634) then
      return 0
    end
    A1_1634 = worldMaster:_getMyPlayer():convertSkillId(A1_1634)
  end
  return worldMaster:_getMyPlayer():getSkillLevel(A1_1634)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerEquipAction"
function L2_2(A0_1635, A1_1636, A2_1637, A3_1638, A4_1639)
  local L5_1640, L6_1641, L7_1642, L8_1643, L9_1644, L10_1645, L11_1646, L12_1647
  L5_1640 = 10
  L6_1641 = A0_1635.work
  L6_1641 = L6_1641.commandIndex
  L6_1641 = L6_1641[L5_1640]
  if L6_1641 <= 0 then
    L6_1641 = false
    return L6_1641
  end
  L6_1641 = worldMaster
  L7_1642 = L6_1641
  L6_1641 = L6_1641._getMyPlayer
  L6_1641 = L6_1641(L7_1642)
  L8_1643 = L6_1641
  L7_1642 = L6_1641.getReadyCommand
  L9_1644 = A0_1635.work
  L9_1644 = L9_1644.commandIndex
  L9_1644 = L9_1644[L5_1640]
  L8_1643 = L7_1642(L8_1643, L9_1644)
  L10_1645 = A0_1635
  L9_1644 = A0_1635.command
  L11_1646 = L6_1641
  L12_1647 = L7_1642
  L9_1644 = L9_1644(L10_1645, L11_1646, L12_1647, A2_1637, A3_1638, nil, nil, nil, nil, nil, A1_1636, A4_1639)
  if L9_1644 == false then
    L11_1646 = L7_1642
    L10_1645 = L7_1642.processCanFire
    L12_1647 = L6_1641
    L11_1646 = L10_1645(L11_1646, L12_1647, A2_1637, A3_1638, 0, nil, nil, nil, nil, A1_1636, A4_1639)
    L12_1647 = L7_1642.getCommandId
    L12_1647 = L12_1647(L7_1642)
    if L11_1646 == nil or L11_1646 == 0 or L12_1647 == nil or L12_1647 == 0 then
      return
    end
    if L11_1646 > 32500 and L11_1646 < 32600 or L11_1646 > 32700 and L11_1646 < 32800 then
      worldMaster:alert(worldMaster, L11_1646, L12_1647)
    end
  end
  L10_1645 = true
  return L10_1645
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "demandPlayerCommandEquipInfomation"
function L2_2(A0_1648)
  return worldMaster:_getMyPlayer():updateGameParameters("commandEquip")
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "demandPlayerExpInfomation"
function L2_2(A0_1649)
  return worldMaster:_getMyPlayer():updateGameParameters("exp")
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updatePlayerCommandAcquired"
function L2_2(A0_1650, A1_1651, A2_1652)
  return worldMaster:_getMyPlayer():updateCommandAcquired(A1_1651, A2_1652)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updateQuestComplete"
function L2_2(A0_1653, A1_1654, A2_1655)
  return worldMaster:_getMyPlayer():updateQuestComplete(A1_1654, A2_1655)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "convertRegionID"
function L2_2(A0_1656, A1_1657)
  local L2_1658, L3_1659
  L2_1658 = A1_1657
  L3_1659 = A1_1657
  if L3_1659 == 202 then
    L2_1658 = 101
    break
  else
  end
  if L3_1659 == 204 then
    L2_1658 = 103
    break
  else
  end
  if L3_1659 == 205 then
    L2_1658 = 104
    break
  else
  end
  if L3_1659 == 203 then
    L2_1658 = 102
    do break end
    break
  else
  end
  return L2_1658
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getAchieveAetheryteID"
function L2_2(A0_1660, A1_1661, A2_1662)
  local L3_1663, L4_1664
  if A0_1660:convertRegionID(A1_1661) == 101 then
    L3_1663 = 1280001
    if A2_1662 == true then
      L4_1664 = 1280006
    else
      L4_1664 = 1280023
      do break end
      else
      end
      if A0_1660:convertRegionID(A1_1661) == 103 then
        L3_1663 = 1280061
        if A2_1662 == true then
          L4_1664 = 1280066
        else
          L4_1664 = 1280087
          do break end
          else
          end
          if A0_1660:convertRegionID(A1_1661) == 104 then
            L3_1663 = 1280031
            if A2_1662 == true then
              L4_1664 = 1280036
            else
              L4_1664 = 1280056
              do break end
              else
              end
              if A0_1660:convertRegionID(A1_1661) == 102 then
                L3_1663 = 1280091
                if A2_1662 == true then
                  L4_1664 = 1280096
                else
                  L4_1664 = 1280116
                  do break end
                  else
                  end
                  if A0_1660:convertRegionID(A1_1661) == 105 then
                    L3_1663 = 1280121
                    if A2_1662 == true then
                      L4_1664 = 1280122
                    else
                      L4_1664 = 1280125
                      do break end
                      break
                    end
                  else
                  end
                end
            end
        end
    end
  return L3_1663, L4_1664
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updateAchieveAetheryte"
function L2_2(A0_1665, A1_1666, A2_1667)
  local L3_1668, L4_1669
  L4_1669 = A0_1665
  L3_1668 = A0_1665.getAchieveAetheryteID
  L4_1669 = L3_1668(L4_1669, A1_1666, A2_1667)
  L3_1668 = L3_1668 - 1280000
  L4_1669 = L4_1669 - 1280000
  return worldMaster:_getMyPlayer():updatePlayerParameters("achieveAetheryte", L3_1668, L4_1669)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updateItemWork"
function L2_2(A0_1670, A1_1671)
  if worldMaster:_getMyPlayer():isEventPlaying() == true then
    return false
  end
  return A1_1671:updateWork()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerPartyJoin"
function L2_2(A0_1672, A1_1673)
  return A0_1672:executePlayerCommandLocal(24204, A1_1673)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPlayerEquipmentForParts"
function L2_2(A0_1674, A1_1675)
  local L2_1676, L3_1677
  if A1_1675 <= 0 or A1_1675 > 27 then
    return L2_1676, L3_1677
  end
  if worldMaster:_getMyPlayer():_getEquippingItem(A1_1675) ~= nil then
    L2_1676 = worldMaster:_getMyPlayer():_getEquippingItem(A1_1675):_getCatalogID()
    L3_1677 = worldMaster:_getMyPlayer():_getEquippingItem(A1_1675):getItemIcon()
  end
  return L2_1676, L3_1677
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getPlayerItemInPackage"
function L2_2(A0_1678, A1_1679, A2_1680)
  local L3_1681, L4_1682, L5_1683, L6_1684, L7_1685, L8_1686
  L3_1681 = worldMaster
  L4_1682 = L3_1681
  L3_1681 = L3_1681._getMyPlayer
  L3_1681 = L3_1681(L4_1682)
  L5_1683 = L3_1681
  L4_1682 = L3_1681._hasItemPackage
  L6_1684 = A1_1679
  L4_1682 = L4_1682(L5_1683, L6_1684)
  if L4_1682 == false then
    L4_1682 = 0
    L5_1683 = 0
    L6_1684 = false
    L7_1685 = 0
    return L4_1682, L5_1683, L6_1684, L7_1685
  end
  L5_1683 = L3_1681
  L4_1682 = L3_1681._getItemPackageCapacity
  L6_1684 = A1_1679
  L4_1682 = L4_1682(L5_1683, L6_1684)
  if A2_1680 < 1 or A2_1680 > L4_1682 then
    L5_1683 = 0
    L6_1684 = 0
    L7_1685 = false
    L8_1686 = 0
    return L5_1683, L6_1684, L7_1685, L8_1686
  end
  L5_1683 = 0
  L6_1684 = 0
  L7_1685 = false
  L8_1686 = 0
  if L3_1681:_getItem(A1_1679, A2_1680) == nil then
    L5_1683 = 0
    L6_1684 = 0
    L8_1686 = 0
  else
    L5_1683 = L3_1681:_getItem(A1_1679, A2_1680):_getCatalogID()
    L6_1684 = L3_1681:_getItem(A1_1679, A2_1680):getItemIcon()
    L7_1685 = L3_1681:_getItem(A1_1679, A2_1680):_isStackable()
    if L7_1685 == true then
      L8_1686 = L3_1681:_getItem(A1_1679, A2_1680):_countStack()
    else
      L8_1686 = 0
    end
  end
  return L5_1683, L6_1684, L7_1685, L8_1686
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getItemPackageCapacityLocal"
function L2_2(A0_1687, A1_1688, A2_1689)
  if A0_1687:checkActor(A1_1688) == nil then
    return 0
  end
  if A1_1688:_hasItemPackage(A2_1689) == false then
    return 0
  end
  return A1_1688:_getItemPackageCapacity(A2_1689)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getBazaarItemPackageCapacity"
function L2_2(A0_1690, A1_1691)
  return A0_1690:getItemPackageCapacityLocal(A0_1690:getBazaarActor(), A1_1691)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getRetainerItemPackageCapacity"
function L2_2(A0_1692, A1_1693)
  return A0_1692:getItemPackageCapacityLocal(A0_1692:getRetainer(), A1_1693)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "testEquipItemOnSlot"
function L2_2(A0_1694, A1_1695, A2_1696, A3_1697)
  local L4_1698, L5_1699, L6_1700
  L4_1698 = worldMaster
  L5_1699 = L4_1698
  L4_1698 = L4_1698._getMyPlayer
  L4_1698 = L4_1698(L5_1699)
  L6_1700 = L4_1698
  L5_1699 = L4_1698._hasItemPackage
  L5_1699 = L5_1699(L6_1700, A2_1696)
  if L5_1699 == false then
    L5_1699 = false
    return L5_1699
  end
  L6_1700 = L4_1698
  L5_1699 = L4_1698._getItemPackageCapacity
  L5_1699 = L5_1699(L6_1700, A2_1696)
  if A3_1697 < 1 or A3_1697 > L5_1699 then
    L6_1700 = false
    return L6_1700
  end
  L6_1700 = false
  if L4_1698:_getItem(A2_1696, A3_1697) ~= nil then
    L6_1700 = L4_1698:_getItem(A2_1696, A3_1697):isFitForEquipPoint(A1_1695)
  end
  return L6_1700
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getItemPackageCount"
function L2_2(A0_1701, A1_1702)
  if worldMaster:_getMyPlayer():_hasItemPackage(A1_1702) == false then
    return 0
  end
  return worldMaster:_getMyPlayer():_getItemPackageCapacity(A1_1702) - worldMaster:_getMyPlayer():_getItemPackageFreeSpace(A1_1702)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isDealingItemLocal"
function L2_2(A0_1703, A1_1704, A2_1705, A3_1706)
  if A0_1703:getItem(A1_1704, A2_1705, A3_1706) == nil then
    return false
  end
  if A0_1703:getItem(A1_1704, A2_1705, A3_1706):_isDealing() == false then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isDealingItem"
function L2_2(A0_1707, A1_1708, A2_1709)
  return A0_1707:isDealingItemLocal(worldMaster:_getMyPlayer(), A1_1708, A2_1709)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isBazaarDealingItem"
function L2_2(A0_1710, A1_1711, A2_1712)
  return A0_1710:isDealingItemLocal(A0_1710:getBazaarActor(), A1_1711, A2_1712)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isRetainerDealingItem"
function L2_2(A0_1713, A1_1714, A2_1715)
  return A0_1713:isDealingItemLocal(A0_1713:getRetainer(), A1_1714, A2_1715)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isItemEqualToIndex"
function L2_2(A0_1716, A1_1717, A2_1718, A3_1719, A4_1720)
  if A1_1717 == nil then
    return false
  end
  if A1_1717 == A2_1718:_getItem(A3_1719, A4_1720) then
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getItemDealDataLocal"
function L2_2(A0_1721, A1_1722, A2_1723, A3_1724)
  local L4_1725, L5_1726, L6_1727, L7_1728, L8_1729, L9_1730, L10_1731, L11_1732, L12_1733, L13_1734, L14_1735, L15_1736
  L5_1726 = A0_1721
  L4_1725 = A0_1721.isDealingItemLocal
  L6_1727 = A1_1722
  L7_1728 = A2_1723
  L8_1729 = A3_1724
  L4_1725 = L4_1725(L5_1726, L6_1727, L7_1728, L8_1729)
  if L4_1725 == false then
    L4_1725 = 0
    L5_1726 = 0
    L6_1727 = 0
    return L4_1725, L5_1726, L6_1727
  end
  L5_1726 = A1_1722
  L4_1725 = A1_1722._getItem
  L6_1727 = A2_1723
  L7_1728 = A3_1724
  L4_1725 = L4_1725(L5_1726, L6_1727, L7_1728)
  L6_1727 = L4_1725
  L5_1726 = L4_1725._getDealingInfo
  L5_1726 = L5_1726(L6_1727)
  L7_1728 = L4_1725
  L6_1727 = L4_1725._getDealingAttached
  L8_1729 = L6_1727(L7_1728)
  L9_1730 = 0
  L10_1731 = 0
  if L6_1727 ~= nil then
    L11_1732 = _isInstanceOf
    L11_1732 = L11_1732(L12_1733, L13_1734)
    if L11_1732 == true then
      L11_1732 = A1_1722._getItemPackageCapacity
      L11_1732 = L11_1732(L12_1733, L13_1734)
      for L15_1736 = 1, L11_1732 do
        if A0_1721:isItemEqualToIndex(L6_1727, A1_1722, A2_1723, L15_1736) == true then
          L10_1731 = L15_1736
          break
        end
      end
      L9_1730 = 0
    else
      L9_1730 = L8_1729
      L10_1731 = 0
    end
  end
  L11_1732 = L5_1726
  return L11_1732, L12_1733, L13_1734
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getItemDealData"
function L2_2(A0_1737, A1_1738, A2_1739)
  local L3_1740, L4_1741, L5_1742, L6_1743, L7_1744
  L3_1740 = worldMaster
  L4_1741 = L3_1740
  L3_1740 = L3_1740._getMyPlayer
  L3_1740 = L3_1740(L4_1741)
  L5_1742 = A0_1737
  L4_1741 = A0_1737.getItemDealDataLocal
  L6_1743 = L3_1740
  L7_1744 = A1_1738
  L6_1743 = L4_1741(L5_1742, L6_1743, L7_1744, A2_1739)
  L7_1744 = nil
  if L6_1743 ~= 0 then
    L7_1744 = L3_1740:_getExtendedTemporaryItem(A1_1738, L6_1743)
  end
  return L4_1741, L5_1742, L7_1744
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getBazaarItemDealData"
function L2_2(A0_1745, A1_1746, A2_1747)
  local L3_1748, L4_1749, L5_1750, L6_1751, L7_1752
  L4_1749 = A0_1745
  L3_1748 = A0_1745.getBazaarActor
  L3_1748 = L3_1748(L4_1749)
  L5_1750 = A0_1745
  L4_1749 = A0_1745.getItemDealDataLocal
  L6_1751 = L3_1748
  L7_1752 = A1_1746
  L6_1751 = L4_1749(L5_1750, L6_1751, L7_1752, A2_1747)
  L7_1752 = nil
  if L6_1751 ~= 0 then
    L7_1752 = L3_1748:_getExtendedTemporaryItem(A1_1746, L6_1751)
  end
  return L4_1749, L5_1750, L7_1752
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getRetainerItemDealData"
function L2_2(A0_1753, A1_1754, A2_1755)
  local L3_1756, L4_1757, L5_1758, L6_1759, L7_1760
  L4_1757 = A0_1753
  L3_1756 = A0_1753.getRetainer
  L3_1756 = L3_1756(L4_1757)
  L5_1758 = A0_1753
  L4_1757 = A0_1753.getItemDealDataLocal
  L6_1759 = L3_1756
  L7_1760 = A1_1754
  L6_1759 = L4_1757(L5_1758, L6_1759, L7_1760, A2_1755)
  L7_1760 = nil
  if L6_1759 ~= 0 then
    L7_1760 = L3_1756:_getExtendedTemporaryItem(A1_1754, L6_1759)
  end
  return L4_1757, L5_1758, L7_1760
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setItemDeal"
function L2_2(A0_1761, A1_1762, A2_1763, A3_1764, A4_1765, A5_1766, A6_1767)
  local L7_1768, L8_1769, L9_1770
  L8_1769 = A0_1761
  L7_1768 = A0_1761.getBazaarActor
  L7_1768 = L7_1768(L8_1769)
  L9_1770 = A0_1761
  L8_1769 = A0_1761.getItem
  L8_1769 = L8_1769(L9_1770, L7_1768, A1_1762, A2_1763)
  if L8_1769 == nil then
    L9_1770 = false
    return L9_1770
  end
  L9_1770 = nil
  if A5_1766 == nil then
    A5_1766 = L8_1769:_countStack()
  end
  if A3_1764 == 20 then
  else
  end
  if A3_1764 == 30 then
    if type(A4_1765) == "number" then
      L9_1770 = A0_1761:executePlayerCommandLocal(24214, 1000001, L8_1769, A3_1764, nil, L7_1768, A4_1765, A5_1766)
    else
      if A6_1767 == nil then
        A6_1767 = A4_1765:_countStack()
      end
      L9_1770 = A0_1761:executePlayerCommandLocal(24214, A4_1765, L8_1769, A3_1764, nil, L7_1768, A6_1767, A5_1766)
      do break end
      L9_1770 = A0_1761:executePlayerCommandLocal(24214, L8_1769, 1000001, A3_1764, nil, L7_1768, A5_1766, A4_1765)
      break
    end
  else
  end
  return L9_1770
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setItemUndeal"
function L2_2(A0_1771, A1_1772, A2_1773, A3_1774)
  local L4_1775, L5_1776, L6_1777, L7_1778, L8_1779
  L5_1776 = A0_1771
  L4_1775 = A0_1771.getBazaarActor
  L4_1775 = L4_1775(L5_1776)
  L6_1777 = A0_1771
  L5_1776 = A0_1771.getItem
  L7_1778 = L4_1775
  L8_1779 = A1_1772
  L5_1776 = L5_1776(L6_1777, L7_1778, L8_1779, A2_1773)
  if L5_1776 == nil then
    L6_1777 = false
    return L6_1777
  end
  L7_1778 = L5_1776
  L6_1777 = L5_1776._isDealing
  L6_1777 = L6_1777(L7_1778)
  if L6_1777 == false then
    L6_1777 = false
    return L6_1777
  end
  L7_1778 = L5_1776
  L6_1777 = L5_1776._countStack
  L6_1777 = L6_1777(L7_1778)
  L7_1778 = 1
  L8_1779 = L5_1776._getDealingAttached
  L8_1779 = L8_1779(L5_1776)
  if _isInstanceOf(L8_1779, "ItemBaseClass") == true then
    L7_1778 = L8_1779:_countStack()
  elseif L8_1779 ~= nil then
    L7_1778 = L8_1779(L5_1776)
  end
  return A0_1771:executePlayerCommandLocal(24216, L5_1776, nil, A3_1774, nil, L4_1775, L6_1777, L7_1778)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setMateriaAttachDeal"
function L2_2(A0_1780, A1_1781, A2_1782)
  local L3_1783, L4_1784, L5_1785
  L3_1783 = worldMaster
  L4_1784 = L3_1783
  L3_1783 = L3_1783._getMyPlayer
  L3_1783 = L3_1783(L4_1784)
  L5_1785 = L3_1783
  L4_1784 = L3_1783._getItem
  L4_1784 = L4_1784(L5_1785, 1, A1_1781)
  L5_1785 = L3_1783._getItem
  L5_1785 = L5_1785(L3_1783, 1, A2_1782)
  return A0_1780:executePlayerCommandLocal(24214, L4_1784, L5_1785, 40, nil, L3_1783)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setMateriaAttachUndeal"
function L2_2(A0_1786)
  local L1_1787
  L1_1787 = worldMaster
  L1_1787 = L1_1787._getMyPlayer
  L1_1787 = L1_1787(L1_1787)
  return A0_1786:executePlayerCommandLocal(24216, nil, nil, 40, nil, L1_1787)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeBazaarBuy"
function L2_2(A0_1788, A1_1789, A2_1790, A3_1791, A4_1792)
  local L5_1793, L6_1794
  L6_1794 = A0_1788
  L5_1793 = A0_1788.getBazaarActor
  L5_1793 = L5_1793(L6_1794)
  L6_1794 = A0_1788.getItem
  L6_1794 = L6_1794(A0_1788, L5_1793, A1_1789, A2_1790)
  if L6_1794 == nil then
    return false
  end
  if A0_1788:executePlayerCommandLocal(24227, L6_1794, A3_1791, nil, nil, L5_1793, A4_1792, L6_1794:_getCatalogID(), L6_1794:_getNameIndex()) == true then
    A0_1788.work.bazaarUpdateTime = worldMaster:_getServerTime()
    A0_1788.work.bazaarUpdateTimeAdd = 3
  end
  return (A0_1788:executePlayerCommandLocal(24227, L6_1794, A3_1791, nil, nil, L5_1793, A4_1792, L6_1794:_getCatalogID(), L6_1794:_getNameIndex()))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeBazaarSell"
function L2_2(A0_1795, A1_1796, A2_1797, A3_1798, A4_1799)
  local L5_1800, L6_1801, L7_1802, L8_1803, L9_1804, L10_1805
  L6_1801 = A0_1795
  L5_1800 = A0_1795.getBazaarActor
  L5_1800 = L5_1800(L6_1801)
  L7_1802 = A0_1795
  L6_1801 = A0_1795.getItem
  L8_1803 = L5_1800
  L9_1804 = A3_1798
  L10_1805 = A4_1799
  L6_1801 = L6_1801(L7_1802, L8_1803, L9_1804, L10_1805)
  if L6_1801 == nil then
    L7_1802 = false
    return L7_1802
  end
  L8_1803 = A0_1795
  L7_1802 = A0_1795.getItem
  L9_1804 = worldMaster
  L10_1805 = L9_1804
  L9_1804 = L9_1804._getMyPlayer
  L9_1804 = L9_1804(L10_1805)
  L10_1805 = A1_1796
  L7_1802 = L7_1802(L8_1803, L9_1804, L10_1805, A2_1797)
  if L7_1802 == nil then
    L8_1803 = false
    return L8_1803
  end
  L9_1804 = L6_1801
  L8_1803 = L6_1801._countStack
  L8_1803 = L8_1803(L9_1804)
  L9_1804 = 1
  L10_1805 = L6_1801._getDealingAttached
  L10_1805 = L10_1805(L6_1801)
  if _isInstanceOf(L10_1805, "ItemBaseClass") == true then
    L9_1804 = L10_1805:_countStack()
  end
  if A0_1795:executePlayerCommandLocal(24227, L6_1801, L7_1802, L9_1804, nil, L5_1800, L8_1803, L6_1801:_getCatalogID(), L6_1801:_getNameIndex()) == true then
    A0_1795.work.bazaarUpdateTime = worldMaster:_getServerTime()
    A0_1795.work.bazaarUpdateTimeAdd = 3
  end
  return (A0_1795:executePlayerCommandLocal(24227, L6_1801, L7_1802, L9_1804, nil, L5_1800, L8_1803, L6_1801:_getCatalogID(), L6_1801:_getNameIndex()))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isItemAttached"
function L2_2(A0_1806, A1_1807, A2_1808, A3_1809)
  if A0_1806:getItem(A1_1807, A2_1808, A3_1809) == nil then
    return false
  end
  return A0_1806:getItem(A1_1807, A2_1808, A3_1809):_isAttached()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isPlayerItemAttached"
function L2_2(A0_1810, A1_1811, A2_1812)
  return A0_1810:isItemAttached(worldMaster:_getMyPlayer(), A1_1811, A2_1812)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isBazaarItemAttached"
function L2_2(A0_1813, A1_1814, A2_1815)
  return A0_1813:isItemAttached(A0_1813:getBazaarActor(), A1_1814, A2_1815)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isRetainerItemAttached"
function L2_2(A0_1816, A1_1817, A2_1818)
  return A0_1816:isItemAttached(A0_1816:getRetainer(), A1_1817, A2_1818)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerMaterializeCommand"
function L2_2(A0_1819, A1_1820)
  local L2_1821
  L2_1821 = A0_1819.getItem
  L2_1821 = L2_1821(A0_1819, worldMaster:_getMyPlayer(), 1, A1_1820)
  if L2_1821 == nil then
    return false
  end
  return A0_1819:executePlayerCommandLocal(24240, L2_1821)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerMateriaJoinCommand"
function L2_2(A0_1822, A1_1823, A2_1824)
  local L3_1825, L4_1826, L5_1827
  L3_1825 = worldMaster
  L4_1826 = L3_1825
  L3_1825 = L3_1825._getMyPlayer
  L3_1825 = L3_1825(L4_1826)
  L5_1827 = A0_1822
  L4_1826 = A0_1822.getItem
  L4_1826 = L4_1826(L5_1827, L3_1825, 1, A1_1823)
  if L4_1826 == nil then
    L5_1827 = false
    return L5_1827
  end
  L5_1827 = A0_1822.getItem
  L5_1827 = L5_1827(A0_1822, L3_1825, 1, A2_1824)
  if L5_1827 == nil then
    return false
  end
  return A0_1822:executePlayerReadyCommand(22014, L4_1826, L5_1827, nil, L3_1825)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeTargetMateriaJoinCommand"
function L2_2(A0_1828, A1_1829)
  local L2_1830, L3_1831, L4_1832, L5_1833, L6_1834, L7_1835, L8_1836, L9_1837
  for L8_1836 = 1, 4 do
    L9_1837 = A0_1828.getItem
    L9_1837 = L9_1837(A0_1828, A1_1829, 6, L8_1836)
    if L9_1837:isEquipment() then
      L2_1830 = L9_1837
    elseif L9_1837:isEnchantMateria() then
      L3_1831 = L9_1837
    elseif L9_1837:_getCatalogID() == 1000001 then
      L4_1832 = L9_1837
    end
  end
  if L2_1830 == nil or L3_1831 == nil or L4_1832 == nil then
    return L5_1833
  end
  for L9_1837 = 1, 4 do
    if A0_1828:getItem(A1_1829, 6, L9_1837):_getCatalogID() == L3_1831:getItemRepairItem() then
      break
    end
  end
  if L5_1833 == nil then
    return L6_1834
  end
  L9_1837 = L2_1830
  return L6_1834(L7_1835, L8_1836, L9_1837, L3_1831, nil, A1_1829, nil)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerMateriaJoinRateGetCommand"
function L2_2(A0_1838, A1_1839, A2_1840)
  local L3_1841, L4_1842, L5_1843
  L3_1841 = worldMaster
  L4_1842 = L3_1841
  L3_1841 = L3_1841._getMyPlayer
  L3_1841 = L3_1841(L4_1842)
  L5_1843 = A0_1838
  L4_1842 = A0_1838.getItem
  L4_1842 = L4_1842(L5_1843, L3_1841, 1, A1_1839)
  if L4_1842 == nil then
    L5_1843 = false
    return L5_1843
  end
  L5_1843 = A0_1838.getItem
  L5_1843 = L5_1843(A0_1838, L3_1841, 1, A2_1840)
  if L5_1843 == nil then
    return false
  end
  return A0_1838:executePlayerReadyCommand(22015, L4_1842, L5_1843, nil, L3_1841)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askItemSearchWidget"
function L2_2(A0_1844)
  A0_1844:_waitForItemSearchWidget()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executePlayerBonusPointAssign"
function L2_2(A0_1845)
  local L1_1846, L2_1847
  L1_1846 = false
  L2_1847 = A0_1845.getReadyCommand
  L2_1847 = L2_1847(A0_1845, 11)
  if L2_1847 ~= nil then
    L1_1846 = A0_1845:executePlayerCommand(L2_1847, nil, nil, nil, nil, worldMaster:_getMyPlayer())
  end
  return L1_1846
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getLinkshellUniqueIdentifier"
function L2_2(A0_1848, A1_1849)
  local L2_1850
  if A1_1849 == nil then
    A1_1849 = worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002)
  end
  if A1_1849 ~= nil and A1_1849:_isAlive() == true then
    L2_1850 = A1_1849:getUniqueIdentifier()
  end
  return L2_1850
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getLinkshellUniqueIdentifierAndMember"
function L2_2(A0_1851, A1_1852, A2_1853)
  local L3_1854, L4_1855
  if A1_1852 == nil then
    L4_1855 = worldMaster
    L4_1855 = L4_1855._getMyPlayer
    L4_1855 = L4_1855(L4_1855)
    L4_1855 = L4_1855.getCommunityGroupCurrent
    L4_1855 = L4_1855(L4_1855, 20002)
    A1_1852 = L4_1855
  end
  if A1_1852 ~= nil then
    L4_1855 = A1_1852._isAlive
    L4_1855 = L4_1855(A1_1852)
    if L4_1855 == true then
      L4_1855 = A1_1852.getUniqueIdentifier
      L4_1855 = L4_1855(A1_1852)
      L3_1854 = L4_1855
    end
  end
  if L3_1854 == nil then
    L4_1855 = false
    return L4_1855
  end
  L4_1855 = nil
  if A1_1852:_isExistInWorldMember(A2_1853) == true and A1_1852:_isExistInClientMember(A2_1853) == true then
    L4_1855 = A0_1851:checkActor(A1_1852:_getMember(A2_1853))
  end
  return true, L3_1854, L4_1855
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updateLinkshellMemberInformation"
function L2_2(A0_1856, A1_1857)
  local L2_1858
  L2_1858 = false
  if A1_1857 == nil then
    A1_1857 = worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002)
  end
  if A1_1857 ~= nil and A1_1857:_isAlive() == true then
    A1_1857:updateMemberInformation()
    A1_1857:updateRankInGroup()
    L2_1858 = true
  end
  return L2_1858
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updateLinkshellRankInformation"
function L2_2(A0_1859, A1_1860)
  local L2_1861
  L2_1861 = false
  if A1_1860 == nil then
    A1_1860 = worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002)
  end
  if A1_1860 ~= nil and A1_1860:_isAlive() == true then
    A1_1860:updateRankInGroup()
    L2_1861 = true
  end
  return L2_1861
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getLinkshellIconID"
function L2_2(A0_1862, A1_1863)
  local L2_1864
  if A1_1863 == 0 then
    L2_1864 = 0
    return L2_1864
  end
  L2_1864 = A1_1863 + 40001
  L2_1864 = L2_1864 - 1
  return L2_1864
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getLinkshellBaseIconID"
function L2_2(A0_1865, A1_1866)
  local L2_1867
  L2_1867 = A1_1866 - 1
  L2_1867 = L2_1867 * 10
  return A0_1865:getLinkshellIconID(L2_1867 + 1)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isValidCurrnetLinkshell"
function L2_2(A0_1868)
  if A0_1868:checkActor(worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002)) == nil then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isMyCurrnetLinkshell"
function L2_2(A0_1869)
  local L1_1870
  L1_1870 = worldMaster
  L1_1870 = L1_1870._getMyPlayer
  L1_1870 = L1_1870(L1_1870)
  if A0_1869:checkActor(L1_1870:getCommunityGroupCurrent(20002)) == nil then
    return false
  end
  return A0_1869:checkActor(L1_1870:getCommunityGroupCurrent(20002)):isOwner(L1_1870)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getCurrnetLinkshellOwnerName"
function L2_2(A0_1871)
  local L1_1872, L2_1873, L3_1874, L4_1875, L5_1876, L6_1877, L7_1878, L8_1879
  L2_1873 = worldMaster
  L3_1874 = L2_1873
  L2_1873 = L2_1873._getMyPlayer
  L2_1873 = L2_1873(L3_1874)
  L4_1875 = A0_1871
  L3_1874 = A0_1871.checkActor
  L8_1879 = L5_1876(L6_1877, L7_1878)
  L3_1874 = L3_1874(L4_1875, L5_1876, L6_1877, L7_1878, L8_1879, L5_1876(L6_1877, L7_1878))
  if L3_1874 == nil then
    return L1_1872
  end
  L4_1875 = L3_1874._countMember
  L4_1875 = L4_1875(L5_1876)
  for L8_1879 = 1, L4_1875 do
    if L3_1874:getMemberRank(L8_1879) == 10 then
      L1_1872 = L3_1874:_getMemberLocalizedDisplayName(L8_1879)
      break
    end
  end
  if L1_1872 == nil then
    L1_1872 = ""
  end
  return L1_1872
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getCurrnetLinkshellIconID"
function L2_2(A0_1880)
  local L1_1881, L2_1882, L3_1883, L4_1884
  L1_1881 = 0
  L2_1882 = worldMaster
  L3_1883 = L2_1882
  L2_1882 = L2_1882._getMyPlayer
  L2_1882 = L2_1882(L3_1883)
  L4_1884 = A0_1880
  L3_1883 = A0_1880.checkActor
  L3_1883 = L3_1883(L4_1884, L2_1882:getCommunityGroupCurrent(20002))
  if L3_1883 ~= nil then
    L4_1884 = L3_1883.getCrestIcon
    L4_1884 = L4_1884(L3_1883)
    L1_1881 = A0_1880:getLinkshellIconID(L4_1884)
  end
  return L1_1881
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isInviteCurrnetLinkshell"
function L2_2(A0_1885)
  local L1_1886, L2_1887, L3_1888, L4_1889
  L1_1886 = worldMaster
  L2_1887 = L1_1886
  L1_1886 = L1_1886._getMyPlayer
  L1_1886 = L1_1886(L2_1887)
  L3_1888 = A0_1885
  L2_1887 = A0_1885.checkActor
  L4_1889 = L1_1886.getCommunityGroupCurrent
  L4_1889 = L4_1889(L1_1886, 20002)
  L2_1887 = L2_1887(L3_1888, L4_1889, L4_1889(L1_1886, 20002))
  if L2_1887 == nil then
    L3_1888 = false
    return L3_1888
  end
  L4_1889 = L2_1887
  L3_1888 = L2_1887.getMemberRank
  L3_1888 = L3_1888(L4_1889, L1_1886)
  L4_1889 = L3_1888
  if L4_1889 == 7 then
  else
    if L4_1889 == 10 then
      break
    else
    end
    return false
  end
  L4_1889 = true
  return L4_1889
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isInviteCurrnetLinkshellByTarget"
function L2_2(A0_1890)
  local L1_1891
  L1_1891 = A0_1890.getCurrentTargetCharacter
  L1_1891 = L1_1891(A0_1890)
  if L1_1891 == nil then
    return false
  end
  if L1_1891 == worldMaster:_getMyPlayer() then
    return false
  end
  if L1_1891:isPlayer() == false then
    return false
  end
  if worldMaster:_getMyPlayer():hasRelationGroup(50001, L1_1891) == true then
    return false
  end
  return A0_1890:isInviteCurrnetLinkshell()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isTargetDuringLinkshellInviteOffer"
function L2_2(A0_1892)
  local L1_1893
  L1_1893 = A0_1892.getMainTargetCharacter
  L1_1893 = L1_1893(A0_1892)
  if A0_1892:checkActor(L1_1893) == nil then
    do return false end
    do break end
    return false
  end
  if not L1_1893:isPlayer() then
    return false
  end
  if L1_1893 == worldMaster:_getMyPlayer() then
    return false
  end
  if not worldMaster:_getMyPlayer():hasRelationGroup(50001, L1_1893) then
    return false
  end
  if worldMaster:_getMyPlayer():getRelationGroup(50001):getCommandVariation() ~= 10002 then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "createCurrnetLinkshellMemberList"
function L2_2(A0_1894, A1_1895)
  local L2_1896, L3_1897, L4_1898, L5_1899, L6_1900, L7_1901, L8_1902, L9_1903, L10_1904, L11_1905, L12_1906, L13_1907, L14_1908
  L2_1896 = worldMaster
  L3_1897 = L2_1896
  L2_1896 = L2_1896._getMyPlayer
  L2_1896 = L2_1896(L3_1897)
  L4_1898 = A0_1894
  L3_1897 = A0_1894.checkActor
  L5_1899 = L2_1896.getCommunityGroupCurrent
  L14_1908 = L5_1899(L6_1900, L7_1901)
  L3_1897 = L3_1897(L4_1898, L5_1899, L6_1900, L7_1901, L8_1902, L9_1903, L10_1904, L11_1905, L12_1906, L13_1907, L14_1908, L5_1899(L6_1900, L7_1901))
  if L3_1897 == nil then
    L4_1898 = false
    return L4_1898
  end
  L5_1899 = L3_1897
  L4_1898 = L3_1897._countMember
  L4_1898 = L4_1898(L5_1899)
  L5_1899 = 0
  for L9_1903 = 1, L4_1898 do
    L10_1904 = 0
    L11_1905 = false
    L12_1906 = 0
    L14_1908 = L3_1897
    L13_1907 = L3_1897._isExistInWorldMember
    L13_1907 = L13_1907(L14_1908, L9_1903)
    if L13_1907 == true then
      L11_1905 = true
      L14_1908 = L3_1897
      L13_1907 = L3_1897._isExistInClientMember
      L13_1907 = L13_1907(L14_1908, L9_1903)
      if L13_1907 == true then
        L12_1906 = 1
        L14_1908 = A0_1894
        L13_1907 = A0_1894.checkActor
        L13_1907 = L13_1907(L14_1908, L3_1897:_getMember(L9_1903))
        if L13_1907 ~= nil and L13_1907 == L2_1896 then
          L10_1904 = 1
        end
      end
    end
    L14_1908 = L3_1897
    L13_1907 = L3_1897.getMemberRank
    L13_1907 = L13_1907(L14_1908, L9_1903)
    L14_1908 = L3_1897._getMemberLocalizedDisplayName
    L14_1908 = L14_1908(L3_1897, L9_1903)
    if L13_1907 == 0 then
      L12_1906 = 0
    end
    A1_1895:setListItem(L5_1899, L9_1903, L14_1908, L13_1907, L10_1904, L11_1905, L12_1906)
    L5_1899 = L5_1899 + 1
  end
  return L6_1900
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getCurrnetLinkshellMemberName"
function L2_2(A0_1909, A1_1910)
  if A0_1909:checkActor(worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002)) == nil then
    return nil
  end
  if A1_1910 > A0_1909:checkActor(worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002)):_countMember() then
    return nil
  end
  return A0_1909:checkActor(worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002)):_getMemberLocalizedDisplayName(A1_1910)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getLinkshellOnlineMemberCount"
function L2_2(A0_1911, A1_1912)
  local L2_1913, L3_1914, L4_1915, L5_1916, L6_1917, L7_1918
  if A1_1912 == nil then
    L2_1913 = worldMaster
    L3_1914 = L2_1913
    L2_1913 = L2_1913._getMyPlayer
    L2_1913 = L2_1913(L3_1914)
    L3_1914 = L2_1913
    L2_1913 = L2_1913.getCommunityGroupCurrent
    L2_1913 = L2_1913(L3_1914, L4_1915)
    A1_1912 = L2_1913
  end
  L3_1914 = A0_1911
  L2_1913 = A0_1911.checkActor
  L2_1913 = L2_1913(L3_1914, L4_1915)
  if L2_1913 == nil then
    L2_1913 = 0
    return L2_1913
  end
  L3_1914 = A1_1912
  L2_1913 = A1_1912._countMember
  L2_1913 = L2_1913(L3_1914)
  L3_1914 = 0
  for L7_1918 = 1, L2_1913 do
    if A1_1912:_isExistInWorldMember(L7_1918) == true then
      L3_1914 = L3_1914 + 1
    end
  end
  return L3_1914
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getLinkshellRankIcon"
function L2_2(A0_1919, A1_1920)
  local L2_1921, L3_1922
  L2_1921 = 0
  L3_1922 = A1_1920
  if L3_1922 == 7 then
    L2_1921 = 384
    break
  else
  end
  if L3_1922 == 10 then
    L2_1921 = 383
    do break end
    break
  else
  end
  return L2_1921
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "processUpdateCurrentCommunityGroup"
function L2_2(A0_1923, A1_1924, A2_1925)
  if A2_1925 == 1 then
    A0_1923:getStaticWidget(2):updateTitle()
    break
  else
    if A2_1925 == 2 then
      do break end
      break
    else
    end
  end
  if A0_1923:getWidgetByName(A0_1923, "Ask/LinkshellListWidget") ~= nil then
    A0_1923:getWidgetByName(A0_1923, "Ask/LinkshellListWidget"):update()
  end
  if A0_1923:getWidget(3, "LinkshellMembersListWidget") ~= nil then
    A0_1923:getWidget(3, "LinkshellMembersListWidget"):update(A2_1925)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askLinkshellNamingWidget"
function L2_2(A0_1926)
  return A0_1926:askEventModeWidgetYield("Ask/LinkshellNamingWidget", 2)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askLinkshellSelectIconWidget"
function L2_2(A0_1927, A1_1928, A2_1929)
  return A0_1927:askEventModeWidgetYield("Ask/LinkshellSelectIconWidget", 2, A1_1928, A2_1929)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askLinkshellConfirmWidget"
function L2_2(A0_1930, A1_1931, A2_1932, A3_1933)
  return A0_1930:askEventModeWidgetYield("Ask/LinkshellConfirmWidget", 1, A1_1931, A2_1932, A3_1933)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askLinkshellListWidget"
function L2_2(A0_1934, A1_1935)
  return A0_1934:askEventModeWidgetYield("Ask/LinkshellListWidget", 1, A1_1935)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectAetheryteRegion"
function L2_2(A0_1936, A1_1937)
  return A0_1936:selectEventModeWidgetYield("Ask/AetheryteListWidget", 0, A1_1937)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectAetheryteList"
function L2_2(A0_1938, ...)
  local L2_1940, L3_1941, L4_1942, L5_1943, L6_1944
  L3_1941 = A0_1938
  L2_1940 = A0_1938.selectEventModeWidgetYield
  L4_1942 = "Ask/AetheryteListWidget"
  L5_1943 = 1
  L6_1944 = ...
  L3_1941 = L2_1940(L3_1941, L4_1942, L5_1943, L6_1944)
  return L3_1941
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openGrandCompanyStatusWidgetYield"
function L2_2(A0_1945, A1_1946, ...)
  local L4_1948, L5_1949, L6_1950, L7_1951, L8_1952, L9_1953, L10_1954, L11_1955
  L5_1949 = A0_1945
  L4_1948 = A0_1945.openWidgetYield
  L6_1950 = 5
  L7_1951 = "GrandCompanyStatusWidget"
  L8_1952, L9_1953 = nil, nil
  L10_1954 = true
  L11_1955 = A1_1946
  L4_1948 = L4_1948(L5_1949, L6_1950, L7_1951, L8_1952, L9_1953, L10_1954, L11_1955, ...)
  if L4_1948 == nil then
    L5_1949 = false
    return L5_1949
  end
  L5_1949 = true
  return L5_1949
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeGrandCompanyStatusWidget"
function L2_2(A0_1956)
  return A0_1956:closeWidget(5, "GrandCompanyStatusWidget")
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setGrandCompanyStatusWidgetPoint"
function L2_2(A0_1957, A1_1958)
  if A0_1957:getWidget(5, "GrandCompanyStatusWidget") ~= nil then
    A0_1957:getWidget(5, "GrandCompanyStatusWidget"):setGrandCompanyPoint(A1_1958)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setGrandCompanyStatusWidgetJoinStatus"
function L2_2(A0_1959, A1_1960)
  if A0_1959:getWidget(5, "GrandCompanyStatusWidget") ~= nil then
    A0_1959:getWidget(5, "GrandCompanyStatusWidget"):setGrandCompanyJoinStatus(A1_1960)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openGrandCompanyJoinEffectWidget"
function L2_2(A0_1961, A1_1962, A2_1963)
  local L3_1964
  L3_1964 = A0_1961.isWidgetExec
  L3_1964 = L3_1964(A0_1961, 13)
  if L3_1964 == true then
    L3_1964 = A0_1961.closeWidget
    L3_1964(A0_1961, 13, nil)
  end
  L3_1964 = nil
  if A1_1962 == 1 then
    L3_1964 = "GrandCompanyJoinWidget1"
    break
  else
  end
  if A1_1962 == 2 then
    L3_1964 = "GrandCompanyJoinWidget2"
    break
  else
  end
  if A1_1962 == 3 then
    L3_1964 = "GrandCompanyJoinWidget3"
    break
  else
  end
  do return end
  A0_1961:openWidget(13, "GrandCompanyJoinWidget", L3_1964, nil, true, A1_1962, A2_1963)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCommandMacro"
function L2_2(A0_1965, A1_1966, A2_1967)
  if A0_1965:isMacroCommandPlaying() == true then
    if A0_1965.work.subTargetMacroFlag == true then
      A0_1965:subTargetDecided(nil)
    end
    A0_1965:cancelMacroCommand()
  end
  if A1_1966 <= 0 or A1_1966 > 2 then
    return false
  end
  if A2_1967 <= 0 or A2_1967 > 50 then
    return false
  end
  if A1_1966 == 2 then
    A2_1967 = A2_1967 + 50
  end
  return A0_1965:commandMacro(A2_1967)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getCommandMacroInfo"
function L2_2(A0_1968, A1_1969, A2_1970)
  local L3_1971, L4_1972, L5_1973, L6_1974, L7_1975
  L3_1971 = A2_1970 - 1
  L4_1972 = _math
  L4_1972 = L4_1972.floor
  L5_1973 = L3_1971 / 10
  L4_1972 = L4_1972(L5_1973)
  L4_1972 = L4_1972 + 1
  L5_1973 = L3_1971 % 10
  L5_1973 = L5_1973 + 1
  if A1_1969 == 2 then
    L5_1973 = L5_1973 + 10
  end
  L7_1975 = A0_1968
  L6_1974 = A0_1968._getUserMacroTitle
  L6_1974 = L6_1974(L7_1975, L4_1972, L5_1973)
  L7_1975 = A0_1968._getUserMacroIcon
  L7_1975 = L7_1975(A0_1968, L4_1972, L5_1973)
  if L7_1975 > 0 then
    L7_1975 = L7_1975 + 41001 - 1
  end
  return L6_1974, L7_1975
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeTextCommand"
function L2_2(A0_1976, A1_1977, A2_1978, A3_1979, A4_1980, A5_1981)
  local L6_1982, L7_1983, L8_1984, L9_1985, L10_1986, L11_1987, L12_1988, L13_1989, L14_1990, L15_1991, L16_1992, L17_1993, L18_1994, L19_1995, L20_1996
  L7_1983 = A0_1976
  L6_1982 = A0_1976.debugCommand
  L8_1984 = A1_1977
  L6_1982 = L6_1982(L7_1983, L8_1984)
  if L6_1982 == true then
    L6_1982 = false
    L7_1983, L8_1984, L9_1985 = nil, nil, nil
    return L6_1982, L7_1983, L8_1984, L9_1985
  end
  L7_1983 = A0_1976
  L6_1982 = A0_1976.getTextCommandParameter
  L8_1984 = A1_1977
  L11_1987 = L6_1982(L7_1983, L8_1984)
  if L6_1982 == false then
    L12_1988 = false
    L13_1989, L14_1990, L15_1991 = nil, nil, nil
    return L12_1988, L13_1989, L14_1990, L15_1991
  end
  L13_1989 = A0_1976
  L12_1988 = A0_1976.getTextCommandTarget
  L14_1990 = L7_1983
  L15_1991 = L9_1985
  L16_1992 = L10_1986
  L17_1993 = L11_1987
  L15_1991 = L12_1988(L13_1989, L14_1990, L15_1991, L16_1992, L17_1993)
  L17_1993 = A0_1976
  L16_1992 = A0_1976.isSubTargetType
  L18_1994 = L12_1988
  L16_1992 = L16_1992(L17_1993, L18_1994)
  if L16_1992 == true and A2_1978 == false and A3_1979 == nil then
    L17_1993 = A0_1976
    L16_1992 = A0_1976.isSubTargetSelectMode
    L16_1992 = L16_1992(L17_1993)
    if L16_1992 == false then
      L16_1992 = true
      L17_1993 = nil
      L18_1994 = L14_1990
      L19_1995 = L15_1991
      return L16_1992, L17_1993, L18_1994, L19_1995
    else
      L12_1988 = 0
    end
  end
  L16_1992 = false
  L17_1993 = nil
  if L12_1988 ~= 0 then
    L19_1995 = A0_1976
    L18_1994 = A0_1976.getTextCommandType
    L20_1996 = L7_1983
    L18_1994 = L18_1994(L19_1995, L20_1996)
    L17_1993 = L18_1994
    if A2_1978 == true and A4_1980 == 2 and L17_1993 == 2 then
      L19_1995 = A0_1976
      L18_1994 = A0_1976._wait
      L20_1996 = 1
      L18_1994(L19_1995, L20_1996)
    end
    L18_1994 = nil
    L19_1995 = L12_1988
    if L19_1995 == 2 then
      break
    else
    end
    if L19_1995 == 3 then
      L20_1996 = worldMaster
      L20_1996 = L20_1996._getMyPlayer
      L20_1996 = L20_1996(L20_1996)
      L18_1994 = L20_1996
      break
    else
    end
    if L19_1995 == 4 then
      L20_1996 = A0_1976.getMainTargetCharacter
      L20_1996 = L20_1996(A0_1976)
      L18_1994 = L20_1996
      break
    elseif L19_1995 == 5 then
    elseif L19_1995 == 6 then
    elseif L19_1995 == 7 then
    elseif L19_1995 == 8 then
    elseif L19_1995 == 9 then
    else
    end
    if L19_1995 == 10 then
      if A2_1978 == true then
        L20_1996 = A0_1976._wait
        L20_1996(A0_1976, 0.1)
        L20_1996 = A0_1976.work
        L20_1996.subTargetActor = nil
        L20_1996 = A0_1976.work
        L20_1996.subTargetMacroFlag = true
        L20_1996 = A0_1976.executeSubTarget
        L20_1996 = L20_1996(A0_1976, A0_1976, L14_1990, nil, L15_1991)
        if L20_1996 == true then
          while true do
            L20_1996 = A0_1976.work
            L20_1996 = L20_1996.subTargetMacroFlag
            if L20_1996 == true then
              L20_1996 = A0_1976._wait
              L20_1996(A0_1976, 0.1)
            end
          end
          L20_1996 = A0_1976.checkActor
          L20_1996 = L20_1996(A0_1976, A0_1976.work.subTargetActor)
          L18_1994 = L20_1996
          else
            L18_1994 = A3_1979
            do break end
            else
            end
            if L19_1995 == 11 then
              L20_1996 = A0_1976.work
              L20_1996 = L20_1996.subTargetName
              if L20_1996 ~= "" then
                L20_1996 = worldMaster
                L20_1996 = L20_1996._getMyPlayer
                L20_1996 = L20_1996(L20_1996)
                L18_1994 = L20_1996
                L20_1996 = A0_1976.work
                L13_1989 = L20_1996.subTargetName
                do break end
                else
                end
                if L19_1995 == 12 then
                  L20_1996 = A0_1976._getLastAttacker
                  L20_1996 = L20_1996(A0_1976)
                  L18_1994 = L20_1996
                  break
                elseif L19_1995 == 13 then
                elseif L19_1995 == 14 then
                elseif L19_1995 == 15 then
                elseif L19_1995 == 16 then
                elseif L19_1995 == 17 then
                elseif L19_1995 == 18 then
                else
                end
                if L19_1995 == 19 then
                  L20_1996 = A0_1976.getPartyMemberWorkIndex
                  L20_1996 = L20_1996(A0_1976, L12_1988 - 13 + 1)
                  if L20_1996 ~= 0 then
                    L18_1994 = A0_1976:getPartyMemberActor(L20_1996)
                  else
                  end
                else
                end
              else
              end
          end
        else
        end
    if L12_1988 ~= 11 and L18_1994 ~= nil then
      L20_1996 = L18_1994
      L19_1995 = L18_1994._isAlive
      L19_1995 = L19_1995(L20_1996)
      if L19_1995 == true then
        L20_1996 = L18_1994
        L19_1995 = L18_1994._getLocalizedDisplayName
        L19_1995 = L19_1995(L20_1996)
        L13_1989 = L19_1995
      else
        L18_1994 = nil
      end
    end
    if L13_1989 ~= nil and L13_1989 == "" then
      L13_1989 = nil
    end
    L20_1996 = A0_1976
    L19_1995 = A0_1976.executeTextCommandLocal
    L19_1995 = L19_1995(L20_1996, L7_1983, L9_1985, L10_1986, L11_1987, A2_1978, L18_1994, L13_1989, A5_1981, A1_1977)
    L16_1992 = L19_1995
  end
  if L16_1992 == false then
    L19_1995 = A0_1976
    L18_1994 = A0_1976.errorText
    L20_1996 = A1_1977
    L18_1994(L19_1995, L20_1996)
  end
  L18_1994 = L16_1992
  L19_1995 = L17_1993
  L20_1996 = nil
  return L18_1994, L19_1995, L20_1996, nil
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTextCommandParameter"
function L2_2(A0_1997, A1_1998)
  local L2_1999, L3_2000, L4_2001, L5_2002, L6_2003, L7_2004
  if A1_1998 == nil then
    L2_1999 = false
    return L2_1999
  end
  if A1_1998 == "" then
    L2_1999 = false
    return L2_1999
  end
  L2_1999 = {
    [6] = L3_2000(L4_2001, L5_2002)
  }
  L4_2001 = A0_1997
  L3_2000 = A0_1997._parseTextCommand
  L5_2002 = A1_1998
  L7_2004 = L3_2000(L4_2001, L5_2002)
  ;({
    [6] = L3_2000(L4_2001, L5_2002)
  })[1] = L3_2000
  ;({
    [6] = L3_2000(L4_2001, L5_2002)
  })[2] = L4_2001
  ;({
    [6] = L3_2000(L4_2001, L5_2002)
  })[3] = L5_2002
  ;({
    [6] = L3_2000(L4_2001, L5_2002)
  })[4] = L6_2003
  ;({
    [6] = L3_2000(L4_2001, L5_2002)
  })[5] = L7_2004
  L3_2000 = L2_1999[1]
  L4_2001 = L2_1999[2]
  if L3_2000 == nil then
    L6_2003 = A0_1997
    L5_2002 = A0_1997.chat
    L7_2004 = A1_1998
    L5_2002(L6_2003, L7_2004)
    L5_2002 = false
    return L5_2002
  end
  if L3_2000 < 0 then
    L6_2003 = A0_1997
    L5_2002 = A0_1997.errorText
    L7_2004 = L2_1999[3]
    L5_2002(L6_2003, L7_2004)
    L5_2002 = false
    return L5_2002
  end
  L5_2002 = {}
  L6_2003 = {}
  L7_2004 = {}
  if L4_2001 > 0 then
    for _FORV_12_ = 1, L4_2001 do
      L5_2002[_FORV_12_] = L2_1999[3]
      L6_2003[_FORV_12_] = L2_1999[3 + L4_2001]
      if L5_2002[_FORV_12_] ~= nil or L6_2003[_FORV_12_] == nil or L3_2000 == 216 then
        break
      else
      end
      A0_1997:errorText(A1_1998)
      return false
    end
  end
  for _FORV_13_ = L4_2001, 7 do
    L7_2004[1] = L2_1999[3 + 1 + L4_2001]
  end
  return true, L3_2000, L4_2001, L5_2002, L6_2003, L7_2004
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeTextCommandLocal"
function L2_2(A0_2005, A1_2006, A2_2007, A3_2008, A4_2009, A5_2010, A6_2011, A7_2012, A8_2013, A9_2014)
  local L10_2015, L11_2016, L12_2017, L13_2018, L14_2019, L15_2020, L16_2021, L17_2022, L18_2023, L19_2024, L20_2025, L21_2026
  L10_2015 = A0_2005.work
  L10_2015 = L10_2015.tutorialFlag
  if L10_2015 == true then
    L10_2015 = A1_2006
    if L10_2015 == 101 then
    elseif L10_2015 == 102 then
    elseif L10_2015 == 103 then
    elseif L10_2015 == 104 then
    elseif L10_2015 == 105 then
    else
      if L10_2015 == 287 then
        break
      else
      end
      L11_2016 = false
      return L11_2016
    end
  end
  L10_2015 = false
  L11_2016 = A0_2005.work
  L11_2016 = L11_2016.lockUserControl
  if L11_2016 == true then
    L10_2015 = true
  elseif A8_2013 ~= true then
    L12_2017 = A0_2005
    L11_2016 = A0_2005.isSubTargetSelectMode
    L11_2016 = L11_2016(L12_2017)
    if L11_2016 == true then
      L10_2015 = true
    end
  end
  if L10_2015 == true then
    L11_2016 = A1_2006
    if L11_2016 == 201 then
    elseif L11_2016 == 101 then
    elseif L11_2016 == 102 then
    elseif L11_2016 == 103 then
    elseif L11_2016 == 104 then
    elseif L11_2016 == 105 then
    elseif L11_2016 == 287 then
    elseif L11_2016 == 107 then
    elseif L11_2016 == 242 then
    elseif L11_2016 == 330 then
    elseif L11_2016 == 234 then
    elseif L11_2016 == 221 then
    elseif L11_2016 == 222 then
    else
      if L11_2016 == 223 then
        break
      else
      end
      L12_2017 = false
      return L12_2017
    end
  end
  L11_2016 = worldMaster
  L12_2017 = L11_2016
  L11_2016 = L11_2016._getMyPlayer
  L11_2016 = L11_2016(L12_2017)
  L12_2017 = false
  L13_2018 = A1_2006
  if L13_2018 == 201 then
    L14_2019 = A2_2007[1]
    if L14_2019 ~= nil then
      L15_2020 = A0_2005
      L14_2019 = A0_2005.printSystemMessage
      L16_2021 = 25303
      L14_2019(L15_2020, L16_2021, L17_2022)
      L12_2017 = true
      do break end
      else
      end
      if L13_2018 == 101 then
        L15_2020 = A0_2005
        L14_2019 = A0_2005.chatCommand
        L16_2021 = 1
        L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
        L12_2017 = L14_2019
        break
      else
      end
      if L13_2018 == 102 then
        L15_2020 = A0_2005
        L14_2019 = A0_2005.chatCommand
        L16_2021 = 2
        L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
        L12_2017 = L14_2019
        break
      else
      end
      if L13_2018 == 103 then
        if A7_2012 ~= nil then
          L14_2019 = A4_2009[3]
          if A6_2011 ~= nil then
            L14_2019 = A4_2009[2]
          end
          L16_2021 = A0_2005
          L15_2020 = A0_2005.chatCommand
          L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023, L19_2024)
          L12_2017 = L15_2020
          do break end
          else
          end
          if L13_2018 == 104 then
            L15_2020 = A0_2005
            L14_2019 = A0_2005.chatCommand
            L16_2021 = 4
            L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
            L12_2017 = L14_2019
            break
          else
          end
          if L13_2018 == 105 then
            L15_2020 = A0_2005
            L14_2019 = A0_2005.chatCommand
            L16_2021 = 5
            L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
            L12_2017 = L14_2019
            break
          else
          end
          if L13_2018 == 287 then
            L14_2019 = nil
            L15_2020 = A2_2007[1]
            if L15_2020 ~= nil then
              L16_2021 = A0_2005
              L15_2020 = A0_2005.getSubCommandID
              L15_2020 = L15_2020(L16_2021, L17_2022)
              if L15_2020 == 63 then
                L14_2019 = 1
                break
              else
              end
              if L15_2020 == 71 then
                L14_2019 = 2
                break
              else
              end
              if L15_2020 == 65 then
                if A7_2012 ~= nil then
                  L16_2021 = string
                  L16_2021 = L16_2021._gsub
                  L20_2025 = " "
                  L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024, L20_2025)
                  A7_2012 = L16_2021
                  L16_2021 = string
                  L16_2021 = L16_2021.split
                  L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024)
                  if L17_2022 > 2 then
                    A7_2012 = L17_2022 .. L18_2023 .. L19_2024
                  end
                  A7_2012 = L17_2022
                  L14_2019 = 3
                  do break end
                  else
                  end
                  if L15_2020 == 67 then
                    L14_2019 = 4
                    break
                  else
                  end
                  if L15_2020 == 69 then
                    L14_2019 = 5
                    break
                  else
                  end
                else
                end
              if L14_2019 ~= nil then
                L16_2021 = A0_2005
                L15_2020 = A0_2005.chatCommand
                L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023, L19_2024)
                L12_2017 = L15_2020
              end
            else
              L15_2020, L16_2021 = nil, nil
              L16_2021 = L18_2023
              L14_2019 = L17_2022
              if L17_2022 == 1 then
                L15_2020 = 101
                break
              else
              end
              if L17_2022 == 2 then
                L15_2020 = 102
                break
              else
              end
              if L17_2022 == 3 then
                if L16_2021 ~= nil then
                  L16_2021 = L18_2023 .. L19_2024
                  L15_2020 = 103
                  do break end
                  else
                  end
                  if L17_2022 == 4 then
                    L15_2020 = 104
                    break
                  else
                  end
                  if L17_2022 == 5 then
                    L15_2020 = 105
                    break
                  else
                  end
                else
                end
              if L15_2020 ~= nil then
                if L16_2021 == nil then
                  L16_2021 = ""
                else
                  L16_2021 = L17_2022
                end
                L20_2025 = L15_2020
                L21_2026 = L16_2021
                L17_2022(L18_2023, L19_2024, L20_2025, L21_2026)
                L12_2017 = true
                do break end
                else
                end
                if L13_2018 == 107 then
                  L14_2019 = A4_2009[1]
                  if L14_2019 ~= nil then
                    L15_2020 = A0_2005
                    L14_2019 = A0_2005.echoText
                    L16_2021 = A0_2005.convertPronouns
                    L21_2026 = L16_2021(L17_2022, L18_2023)
                    L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024, L20_2025, L21_2026, L16_2021(L17_2022, L18_2023))
                    L12_2017 = L14_2019
                    do break end
                    else
                    end
                    if L13_2018 == 231 then
                      L14_2019 = A2_2007[1]
                      if L14_2019 ~= nil then
                        L14_2019 = A2_2007[2]
                        if L14_2019 == nil then
                          L14_2019 = 0
                        end
                        L16_2021 = A0_2005
                        L15_2020 = A0_2005.executePlayerEquipAction
                        L20_2025 = 0
                        L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023, L19_2024, L20_2025)
                        L12_2017 = L15_2020
                        do break end
                        else
                        end
                        if L13_2018 == 216 then
                          if A6_2011 ~= nil then
                            L15_2020 = L11_2016
                            L14_2019 = L11_2016.searchCommandSlot
                            L16_2021 = A2_2007[1]
                            L14_2019 = L14_2019(L15_2020, L16_2021)
                            if L14_2019 ~= nil then
                              L16_2021 = L11_2016
                              L15_2020 = L11_2016.getCustomCommand
                              L16_2021 = L15_2020(L16_2021, L17_2022)
                              L20_2025 = L15_2020
                              L21_2026 = nil
                              L12_2017 = L17_2022
                              if L12_2017 == true then
                                L20_2025 = L14_2019
                                L17_2022(L18_2023, L19_2024, L20_2025)
                              end
                            else
                              L16_2021 = A0_2005
                              L15_2020 = A0_2005.printErrorMessage
                              L15_2020(L16_2021, L17_2022)
                              do break end
                              else
                              end
                              if L13_2018 == 232 then
                                L15_2020 = A0_2005
                                L14_2019 = A0_2005.getEquipID
                                L16_2021 = A2_2007[1]
                                L14_2019 = L14_2019(L15_2020, L16_2021)
                                if L14_2019 ~= nil then
                                  L15_2020 = A2_2007[2]
                                  if L15_2020 ~= nil then
                                    L16_2021 = A0_2005
                                    L15_2020 = A0_2005.getItemIndex
                                    L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023, L19_2024)
                                    if L15_2020 ~= 0 then
                                      L16_2021 = A0_2005.executeCharacterEquipItem
                                      L20_2025 = L15_2020
                                      L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024, L20_2025)
                                      L12_2017 = L16_2021
                                    else
                                    end
                                  else
                                    L15_2020 = A3_2008[2]
                                    if L15_2020 == nil then
                                      L16_2021 = A0_2005
                                      L15_2020 = A0_2005.executeCharacterRemoveItem
                                      L15_2020 = L15_2020(L16_2021, L17_2022)
                                      L12_2017 = L15_2020
                                      do break end
                                      else
                                      end
                                      if L13_2018 == 242 then
                                        L15_2020 = A0_2005
                                        L14_2019 = A0_2005.chatCommand
                                        L16_2021 = 6
                                        L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                        L12_2017 = L14_2019
                                        break
                                      else
                                      end
                                      if L13_2018 == 227 then
                                        if A5_2010 == false then
                                        else
                                          L14_2019 = A4_2009[1]
                                          if L14_2019 ~= nil then
                                            L14_2019 = tonumber
                                            L15_2020 = A4_2009[1]
                                            L14_2019 = L14_2019(L15_2020)
                                            if L14_2019 == nil or L14_2019 > 60 then
                                            else
                                              L16_2021 = A0_2005
                                              L15_2020 = A0_2005._wait
                                              L15_2020(L16_2021, L17_2022)
                                              L12_2017 = true
                                              do break end
                                              else
                                              end
                                              if L13_2018 == 288 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 5
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 289 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 5
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 293 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 5
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 290 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 5
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 291 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 3
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 213 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 3
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 292 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 3
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 294 then
                                                L15_2020 = A0_2005
                                                L14_2019 = A0_2005.switchConfigParameterOld
                                                L16_2021 = 1
                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                L12_2017 = L14_2019
                                                break
                                              else
                                              end
                                              if L13_2018 == 321 then
                                                L14_2019 = A2_2007[1]
                                                L12_2017 = false
                                                if L14_2019 == nil then
                                                  L16_2021 = A0_2005
                                                  L15_2020 = A0_2005.executePlayerCommand
                                                  L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023)
                                                  L12_2017 = L15_2020
                                                else
                                                  L16_2021 = A0_2005
                                                  L15_2020 = A0_2005.getSubCommandID
                                                  L15_2020 = L15_2020(L16_2021, L17_2022)
                                                  if L15_2020 == 3 then
                                                    L16_2021 = A0_2005.executePlayerCommand
                                                    L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024)
                                                    L12_2017 = L16_2021
                                                    break
                                                  else
                                                  end
                                                  if L15_2020 == 1 then
                                                    L16_2021 = A0_2005.executePlayerCommand
                                                    L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024)
                                                    L12_2017 = L16_2021
                                                    do break end
                                                    do break end
                                                    do break end
                                                    else
                                                    end
                                                    if L13_2018 == 234 then
                                                      L14_2019 = worldMaster
                                                      L15_2020 = L14_2019
                                                      L14_2019 = L14_2019._getServerTime
                                                      L14_2019 = L14_2019(L15_2020)
                                                      L15_2020 = math
                                                      L16_2021 = L15_2020
                                                      L15_2020 = L15_2020._floor
                                                      L15_2020 = L15_2020(L16_2021, L17_2022)
                                                      L16_2021 = worldMaster
                                                      L16_2021 = L16_2021.getGuildleveTime
                                                      L16_2021 = L16_2021(L17_2022)
                                                      L20_2025 = worldMaster
                                                      L21_2026 = L20_2025
                                                      L20_2025 = L20_2025.getBoostTime
                                                      L21_2026 = L20_2025(L21_2026)
                                                      A0_2005:printSystemMessage(25304, L14_2019, 59 - math:_floor(L14_2019 / 60) % 60, L16_2021, L17_2022, L18_2023, L19_2024)
                                                      L12_2017 = true
                                                      break
                                                    else
                                                    end
                                                    if L13_2018 == 322 then
                                                      L15_2020 = L11_2016
                                                      L14_2019 = L11_2016.getSystemCommand
                                                      L16_2021 = 24242
                                                      L14_2019 = L14_2019(L15_2020, L16_2021)
                                                      L15_2020 = A2_2007[1]
                                                      if L14_2019 ~= nil then
                                                        L16_2021 = L11_2016.command
                                                        L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024)
                                                        L12_2017 = L16_2021
                                                        do break end
                                                        else
                                                        end
                                                        if L13_2018 == 236 then
                                                          L15_2020 = A0_2005
                                                          L14_2019 = A0_2005.processCommandMap
                                                          L14_2019 = L14_2019(L15_2020)
                                                          L12_2017 = L14_2019
                                                          break
                                                        else
                                                        end
                                                        if L13_2018 == 229 then
                                                          L15_2020 = A0_2005
                                                          L14_2019 = A0_2005.setBazaarActor
                                                          L14_2019(L15_2020)
                                                          L15_2020 = A0_2005
                                                          L14_2019 = A0_2005.openMainMenuRootWidget
                                                          L16_2021 = "ItemListWidget"
                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                          L12_2017 = L14_2019
                                                          break
                                                        else
                                                        end
                                                        if L13_2018 == 204 then
                                                          L15_2020 = A0_2005
                                                          L14_2019 = A0_2005.openMainMenuRootWidget
                                                          L16_2021 = "AddressListWidget"
                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                          L12_2017 = L14_2019
                                                          break
                                                        else
                                                        end
                                                        if L13_2018 == 207 then
                                                          L15_2020 = A0_2005
                                                          L14_2019 = A0_2005.openMainMenuRootWidget
                                                          L16_2021 = "IgnoreListWidget"
                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                          L12_2017 = L14_2019
                                                          break
                                                        else
                                                        end
                                                        if L13_2018 == 239 then
                                                          L15_2020 = A0_2005
                                                          L14_2019 = A0_2005.isChinese
                                                          L14_2019 = L14_2019(L15_2020)
                                                          if L14_2019 == false then
                                                            L15_2020 = A0_2005
                                                            L14_2019 = A0_2005.openMainMenuRootWidget
                                                            L16_2021 = "SupportDeskWidget"
                                                            L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023)
                                                            L12_2017 = L14_2019
                                                            do break end
                                                            else
                                                            end
                                                            if L13_2018 == 215 then
                                                              L15_2020 = A0_2005
                                                              L14_2019 = A0_2005.executePlayerLogout
                                                              L16_2021 = 2
                                                              L14_2019 = L14_2019(L15_2020, L16_2021)
                                                              L12_2017 = L14_2019
                                                              break
                                                            else
                                                            end
                                                            if L13_2018 == 315 then
                                                              L15_2020 = A0_2005
                                                              L14_2019 = A0_2005.executePlayerLogout
                                                              L16_2021 = 1
                                                              L14_2019 = L14_2019(L15_2020, L16_2021)
                                                              L12_2017 = L14_2019
                                                              break
                                                            else
                                                            end
                                                            if L13_2018 == 241 then
                                                              L15_2020 = L11_2016
                                                              L14_2019 = L11_2016.getEmoteSitCommandVariation
                                                              L14_2019 = L14_2019(L15_2020)
                                                              L15_2020 = L14_2019
                                                              if L15_2020 == 10001 then
                                                              else
                                                              end
                                                              if L15_2020 == 10002 then
                                                                L16_2021 = A0_2005.getSwitchFlag
                                                                L16_2021 = L16_2021(L17_2022, L18_2023)
                                                                if L16_2021 == false then
                                                                else
                                                                  if L17_2022 ~= nil then
                                                                  else
                                                                    L20_2025 = L11_2016
                                                                  end
                                                                  if L18_2023 == L14_2019 then
                                                                    L20_2025 = L11_2016
                                                                    if L19_2024 == true then
                                                                    else
                                                                      else
                                                                        L20_2025 = L11_2016
                                                                        if L19_2024 == false then
                                                                      end
                                                                      else
                                                                        L20_2025 = A0_2005
                                                                        L21_2026 = L18_2023
                                                                        L12_2017 = L19_2024
                                                                        do break end
                                                                        do break end
                                                                        do break end
                                                                        do break end
                                                                        else
                                                                        end
                                                                        if L13_2018 == 210 then
                                                                          L15_2020 = A0_2005
                                                                          L14_2019 = A0_2005.getSubCommandID
                                                                          L16_2021 = A2_2007[1]
                                                                          L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                          if L14_2019 == 5 then
                                                                            if A6_2011 ~= nil then
                                                                              L16_2021 = A0_2005
                                                                              L15_2020 = A0_2005.executePlayerPartyInviteByActor
                                                                              L15_2020 = L15_2020(L16_2021, L17_2022)
                                                                              L12_2017 = L15_2020
                                                                            else
                                                                              if A7_2012 ~= nil then
                                                                                L16_2021 = A0_2005
                                                                                L15_2020 = A0_2005.convertChineseName
                                                                                L15_2020 = L15_2020(L16_2021, L17_2022)
                                                                                L16_2021 = A0_2005.executePlayerPartyInviteByName
                                                                                L16_2021 = L16_2021(L17_2022, L18_2023)
                                                                                L12_2017 = L16_2021
                                                                                do break end
                                                                                else
                                                                                end
                                                                                if L14_2019 == 7 then
                                                                                  L16_2021 = A0_2005
                                                                                  L15_2020 = A0_2005.executePlayerPartyResign
                                                                                  L15_2020 = L15_2020(L16_2021)
                                                                                  L12_2017 = L15_2020
                                                                                  break
                                                                                else
                                                                                end
                                                                                if L14_2019 == 9 then
                                                                                  if A6_2011 ~= nil then
                                                                                    L16_2021 = A0_2005
                                                                                    L15_2020 = A0_2005.executePlayerPartyKickByActor
                                                                                    L15_2020 = L15_2020(L16_2021, L17_2022)
                                                                                    L12_2017 = L15_2020
                                                                                  else
                                                                                    if A7_2012 ~= nil then
                                                                                      L16_2021 = A0_2005
                                                                                      L15_2020 = A0_2005.convertChineseName
                                                                                      L15_2020 = L15_2020(L16_2021, L17_2022)
                                                                                      L16_2021 = A0_2005.executePlayerPartyKickByName
                                                                                      L16_2021 = L16_2021(L17_2022, L18_2023)
                                                                                      L12_2017 = L16_2021
                                                                                      do break end
                                                                                      else
                                                                                      end
                                                                                      if L14_2019 == 11 then
                                                                                        L16_2021 = A0_2005
                                                                                        L15_2020 = A0_2005.executePlayerPartyBreakup
                                                                                        L15_2020 = L15_2020(L16_2021)
                                                                                        L12_2017 = L15_2020
                                                                                        do break end
                                                                                        do break end
                                                                                        do break end
                                                                                        do break end
                                                                                        else
                                                                                        end
                                                                                        if L13_2018 == 211 then
                                                                                          L15_2020 = A0_2005
                                                                                          L14_2019 = A0_2005.executePlayerPartyConfirm
                                                                                          L16_2021 = true
                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                          L12_2017 = L14_2019
                                                                                          break
                                                                                        else
                                                                                        end
                                                                                        if L13_2018 == 212 then
                                                                                          L15_2020 = A0_2005
                                                                                          L14_2019 = A0_2005.executePlayerPartyConfirm
                                                                                          L16_2021 = false
                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                          L12_2017 = L14_2019
                                                                                          break
                                                                                        else
                                                                                        end
                                                                                        if L13_2018 == 217 then
                                                                                          L15_2020 = A0_2005
                                                                                          L14_2019 = A0_2005.getSwitchFlag
                                                                                          L16_2021 = A2_2007[1]
                                                                                          L15_2020 = L14_2019(L15_2020, L16_2021)
                                                                                          if L14_2019 == false then
                                                                                          else
                                                                                            L16_2021 = false
                                                                                            if L15_2020 ~= nil then
                                                                                              if L15_2020 == true then
                                                                                                L16_2021 = true
                                                                                              end
                                                                                            elseif L17_2022 == false then
                                                                                              L16_2021 = true
                                                                                            end
                                                                                            if L17_2022 == L16_2021 then
                                                                                            else
                                                                                              L12_2017 = L17_2022
                                                                                              do break end
                                                                                              else
                                                                                              end
                                                                                              if L13_2018 == 224 then
                                                                                                L15_2020 = L11_2016
                                                                                                L14_2019 = L11_2016._getLockonTarget
                                                                                                L14_2019 = L14_2019(L15_2020)
                                                                                                if L14_2019 == nil then
                                                                                                  L15_2020 = A0_2005
                                                                                                  L14_2019 = A0_2005.lockonCurrentTarget
                                                                                                  L14_2019 = L14_2019(L15_2020)
                                                                                                  L12_2017 = L14_2019
                                                                                                else
                                                                                                  L15_2020 = L11_2016
                                                                                                  L14_2019 = L11_2016._setLockonTarget
                                                                                                  L16_2021 = nil
                                                                                                  L14_2019(L15_2020, L16_2021)
                                                                                                  L12_2017 = true
                                                                                                  do break end
                                                                                                  else
                                                                                                  end
                                                                                                  if L13_2018 == 228 then
                                                                                                    L14_2019 = A2_2007[1]
                                                                                                    if L14_2019 ~= nil then
                                                                                                      L16_2021 = L11_2016
                                                                                                      L15_2020 = L11_2016.searchCommandSlot
                                                                                                      L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023)
                                                                                                      L16_2021 = L11_2016.searchCommandSlot
                                                                                                      L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024)
                                                                                                      if L15_2020 == nil and L16_2021 == nil then
                                                                                                      elseif L15_2020 ~= nil and L16_2021 ~= nil then
                                                                                                        L20_2025 = A0_2005
                                                                                                        L21_2026 = L15_2020
                                                                                                        L20_2025 = A0_2005
                                                                                                        L21_2026 = L16_2021
                                                                                                        if L17_2022 ~= nil and L18_2023 ~= nil then
                                                                                                          L20_2025 = A0_2005
                                                                                                          L21_2026 = 32619
                                                                                                          L19_2024(L20_2025, L21_2026, L14_2019, L17_2022, L18_2023)
                                                                                                          L12_2017 = true
                                                                                                        end
                                                                                                      else
                                                                                                        if L15_2020 ~= nil then
                                                                                                          L20_2025 = A0_2005
                                                                                                          L21_2026 = L15_2020
                                                                                                        else
                                                                                                          L20_2025 = A0_2005
                                                                                                          L21_2026 = L16_2021
                                                                                                        end
                                                                                                        if L17_2022 ~= nil then
                                                                                                          L20_2025 = A0_2005
                                                                                                          L21_2026 = 32618
                                                                                                          L19_2024(L20_2025, L21_2026, L14_2019, L17_2022)
                                                                                                          L12_2017 = true
                                                                                                          do break end
                                                                                                          else
                                                                                                          end
                                                                                                          if L13_2018 == 230 then
                                                                                                            if A6_2011 ~= nil then
                                                                                                              L14_2019 = A2_2007[1]
                                                                                                              if L14_2019 ~= nil then
                                                                                                                L15_2020 = A0_2005
                                                                                                                L14_2019 = A0_2005.getItemIndex
                                                                                                                L16_2021 = A2_2007[1]
                                                                                                                L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                if L14_2019 ~= 0 then
                                                                                                                  L16_2021 = A0_2005
                                                                                                                  L15_2020 = A0_2005.executeCharacterUseItem
                                                                                                                  L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                  L12_2017 = L15_2020
                                                                                                                  do break end
                                                                                                                  else
                                                                                                                  end
                                                                                                                  if L13_2018 == 226 then
                                                                                                                    L15_2020 = A0_2005
                                                                                                                    L14_2019 = A0_2005.sendDesktopCommand
                                                                                                                    L16_2021 = "RaptureCommands.MoveCharacterAutoRun"
                                                                                                                    L14_2019(L15_2020, L16_2021)
                                                                                                                    L12_2017 = true
                                                                                                                    break
                                                                                                                  else
                                                                                                                  end
                                                                                                                  if L13_2018 == 214 then
                                                                                                                    L15_2020 = A0_2005
                                                                                                                    L14_2019 = A0_2005.getSwitchFlag
                                                                                                                    L16_2021 = A2_2007[1]
                                                                                                                    L15_2020 = L14_2019(L15_2020, L16_2021)
                                                                                                                    if L14_2019 == true then
                                                                                                                      L16_2021 = A0_2005.executePlayerSetAway
                                                                                                                      L16_2021 = L16_2021(L17_2022, L18_2023)
                                                                                                                      L12_2017 = L16_2021
                                                                                                                      do break end
                                                                                                                      else
                                                                                                                      end
                                                                                                                      if L13_2018 == 221 then
                                                                                                                        L15_2020 = A0_2005
                                                                                                                        L14_2019 = A0_2005._setTargetNearestCharacter
                                                                                                                        L16_2021 = 1
                                                                                                                        L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                        L12_2017 = L14_2019
                                                                                                                        break
                                                                                                                      else
                                                                                                                      end
                                                                                                                      if L13_2018 == 222 then
                                                                                                                        L15_2020 = A0_2005
                                                                                                                        L14_2019 = A0_2005._setTargetNearestCharacter
                                                                                                                        L16_2021 = 2
                                                                                                                        L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                        L12_2017 = L14_2019
                                                                                                                        break
                                                                                                                      else
                                                                                                                      end
                                                                                                                      if L13_2018 == 308 then
                                                                                                                        L15_2020 = A0_2005
                                                                                                                        L14_2019 = A0_2005._setTargetNearestCharacter
                                                                                                                        L16_2021 = 3
                                                                                                                        L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                        L12_2017 = L14_2019
                                                                                                                        break
                                                                                                                      else
                                                                                                                      end
                                                                                                                      if L13_2018 == 312 then
                                                                                                                        L15_2020 = A0_2005
                                                                                                                        L14_2019 = A0_2005._setTargetNearestCharacter
                                                                                                                        L16_2021 = 4
                                                                                                                        L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                        L12_2017 = L14_2019
                                                                                                                        break
                                                                                                                      else
                                                                                                                      end
                                                                                                                      if L13_2018 == 223 then
                                                                                                                        if A6_2011 ~= nil then
                                                                                                                          L15_2020 = A6_2011
                                                                                                                          L14_2019 = A6_2011._getLookAtCharacter
                                                                                                                          L14_2019 = L14_2019(L15_2020)
                                                                                                                          if L14_2019 ~= nil then
                                                                                                                            L16_2021 = A0_2005
                                                                                                                            L15_2020 = A0_2005.setTargetCharacter
                                                                                                                            L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023)
                                                                                                                            L12_2017 = L15_2020
                                                                                                                            do break end
                                                                                                                            else
                                                                                                                            end
                                                                                                                            if L13_2018 == 240 then
                                                                                                                              L15_2020 = A0_2005
                                                                                                                              L14_2019 = A0_2005.executePlayerCheck
                                                                                                                              L14_2019 = L14_2019(L15_2020)
                                                                                                                              L12_2017 = L14_2019
                                                                                                                              break
                                                                                                                            else
                                                                                                                            end
                                                                                                                            if L13_2018 == 219 then
                                                                                                                              if A6_2011 ~= nil then
                                                                                                                                L15_2020 = A0_2005
                                                                                                                                L14_2019 = A0_2005.isValidPartyTargetID
                                                                                                                                L16_2021 = A2_2007[1]
                                                                                                                                L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                                if L14_2019 == true then
                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                  L14_2019 = A0_2005.executePlayerTargetMarking
                                                                                                                                  L16_2021 = A2_2007[1]
                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                  do break end
                                                                                                                                  else
                                                                                                                                  end
                                                                                                                                  if L13_2018 == 296 then
                                                                                                                                    L15_2020 = A0_2005
                                                                                                                                    L14_2019 = A0_2005.getSubCommandID
                                                                                                                                    L16_2021 = A2_2007[1]
                                                                                                                                    L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                                    if L14_2019 == 29 then
                                                                                                                                      L16_2021 = A0_2005
                                                                                                                                      L15_2020 = A0_2005.getSwitchFlag
                                                                                                                                      L16_2021 = L15_2020(L16_2021, L17_2022)
                                                                                                                                      if L15_2020 == true and L16_2021 ~= nil then
                                                                                                                                        L20_2025 = 12013
                                                                                                                                        L21_2026 = 1
                                                                                                                                        L18_2023(L19_2024, L20_2025, L21_2026, L17_2022)
                                                                                                                                        L12_2017 = true
                                                                                                                                        do break end
                                                                                                                                        else
                                                                                                                                        end
                                                                                                                                        if L14_2019 == 19 then
                                                                                                                                          L16_2021 = A0_2005
                                                                                                                                          L15_2020 = A0_2005.getSwitchFlag
                                                                                                                                          L16_2021 = L15_2020(L16_2021, L17_2022)
                                                                                                                                          if L15_2020 == true and L16_2021 ~= nil then
                                                                                                                                            L20_2025 = 12013
                                                                                                                                            L21_2026 = 2
                                                                                                                                            L18_2023(L19_2024, L20_2025, L21_2026, L17_2022)
                                                                                                                                            L12_2017 = true
                                                                                                                                            do break end
                                                                                                                                            do break end
                                                                                                                                            do break end
                                                                                                                                            do break end
                                                                                                                                            else
                                                                                                                                            end
                                                                                                                                            if L13_2018 == 297 then
                                                                                                                                              L14_2019 = nil
                                                                                                                                              L15_2020 = A2_2007[1]
                                                                                                                                              if L15_2020 == 1 then
                                                                                                                                                L14_2019 = 12
                                                                                                                                              else
                                                                                                                                                if L15_2020 == 2 then
                                                                                                                                                  L14_2019 = 16
                                                                                                                                                  do break end
                                                                                                                                                  do break end
                                                                                                                                                  L16_2021 = A0_2005.getSwitchFlag
                                                                                                                                                  L16_2021 = L16_2021(L17_2022, L18_2023)
                                                                                                                                                  if L16_2021 == false then
                                                                                                                                                  else
                                                                                                                                                    if L17_2022 == nil then
                                                                                                                                                      L20_2025 = L14_2019
                                                                                                                                                    end
                                                                                                                                                    if L17_2022 == true then
                                                                                                                                                    end
                                                                                                                                                    L21_2026 = A0_2005
                                                                                                                                                    L20_2025 = A0_2005.setConfigWorkWithSave
                                                                                                                                                    L20_2025(L21_2026, L14_2019, L18_2023)
                                                                                                                                                    L21_2026 = A0_2005
                                                                                                                                                    L20_2025 = A0_2005.updateLogAutoHideTime
                                                                                                                                                    L20_2025(L21_2026)
                                                                                                                                                    L21_2026 = A0_2005
                                                                                                                                                    L20_2025 = A0_2005.printSystemMessage
                                                                                                                                                    L20_2025(L21_2026, L19_2024, L15_2020)
                                                                                                                                                    L12_2017 = true
                                                                                                                                                    do break end
                                                                                                                                                    else
                                                                                                                                                    end
                                                                                                                                                    if L13_2018 == 298 then
                                                                                                                                                      L14_2019 = nil
                                                                                                                                                      L15_2020 = 25050
                                                                                                                                                      L16_2021 = A0_2005.getSubCommandID
                                                                                                                                                      L16_2021 = L16_2021(L17_2022, L18_2023)
                                                                                                                                                      if L16_2021 == 83 then
                                                                                                                                                        L14_2019 = 0
                                                                                                                                                        break
                                                                                                                                                      else
                                                                                                                                                      end
                                                                                                                                                      if L16_2021 == 85 then
                                                                                                                                                        L14_2019 = 1
                                                                                                                                                        L15_2020 = 25120
                                                                                                                                                        break
                                                                                                                                                      else
                                                                                                                                                      end
                                                                                                                                                      if L16_2021 == 87 then
                                                                                                                                                        L14_2019 = 2
                                                                                                                                                        L15_2020 = 25325
                                                                                                                                                        do break end
                                                                                                                                                        break
                                                                                                                                                      else
                                                                                                                                                      end
                                                                                                                                                      if L14_2019 ~= nil then
                                                                                                                                                        L16_2021 = A0_2005.setConfigWorkWithSave
                                                                                                                                                        L16_2021(L17_2022, L18_2023, L19_2024)
                                                                                                                                                        L16_2021 = A0_2005.printSystemMessage
                                                                                                                                                        L16_2021(L17_2022, L18_2023)
                                                                                                                                                        L12_2017 = true
                                                                                                                                                        do break end
                                                                                                                                                        else
                                                                                                                                                        end
                                                                                                                                                        if L13_2018 == 300 then
                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                          L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                          L16_2021 = 30
                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                          break
                                                                                                                                                        else
                                                                                                                                                        end
                                                                                                                                                        if L13_2018 == 301 then
                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                          L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                          L16_2021 = 31
                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                          break
                                                                                                                                                        else
                                                                                                                                                        end
                                                                                                                                                        if L13_2018 == 303 then
                                                                                                                                                          L14_2019 = nil
                                                                                                                                                          L15_2020 = 25319
                                                                                                                                                          L16_2021 = A0_2005.getSubCommandID
                                                                                                                                                          L16_2021 = L16_2021(L17_2022, L18_2023)
                                                                                                                                                          if L16_2021 == 83 then
                                                                                                                                                            L14_2019 = 0
                                                                                                                                                            break
                                                                                                                                                          else
                                                                                                                                                          end
                                                                                                                                                          if L16_2021 == 85 then
                                                                                                                                                            L14_2019 = 1
                                                                                                                                                            L15_2020 = 25318
                                                                                                                                                            break
                                                                                                                                                          else
                                                                                                                                                          end
                                                                                                                                                          if L16_2021 == 87 then
                                                                                                                                                            L14_2019 = 2
                                                                                                                                                            L15_2020 = 25320
                                                                                                                                                            do break end
                                                                                                                                                            break
                                                                                                                                                          else
                                                                                                                                                          end
                                                                                                                                                          if L14_2019 ~= nil then
                                                                                                                                                            L16_2021 = A0_2005.setConfigWorkWithSave
                                                                                                                                                            L16_2021(L17_2022, L18_2023, L19_2024)
                                                                                                                                                            L16_2021 = A0_2005.printSystemMessage
                                                                                                                                                            L16_2021(L17_2022, L18_2023)
                                                                                                                                                            L12_2017 = true
                                                                                                                                                            do break end
                                                                                                                                                            else
                                                                                                                                                            end
                                                                                                                                                            if L13_2018 == 302 then
                                                                                                                                                              L14_2019 = nil
                                                                                                                                                              L15_2020 = A2_2007[1]
                                                                                                                                                              if L15_2020 ~= nil then
                                                                                                                                                                L16_2021 = A0_2005
                                                                                                                                                                L15_2020 = A0_2005.getSubCommandID
                                                                                                                                                                L15_2020 = L15_2020(L16_2021, L17_2022)
                                                                                                                                                                if L15_2020 == 81 then
                                                                                                                                                                  L14_2019 = false
                                                                                                                                                                end
                                                                                                                                                              else
                                                                                                                                                                L14_2019 = true
                                                                                                                                                              end
                                                                                                                                                              if L14_2019 ~= nil then
                                                                                                                                                                L16_2021 = A0_2005
                                                                                                                                                                L15_2020 = A0_2005.setDefaultCamera
                                                                                                                                                                L15_2020(L16_2021, L17_2022)
                                                                                                                                                                L12_2017 = true
                                                                                                                                                                do break end
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 304 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 33
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 331 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 71
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 305 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 34
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 306 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 1
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 307 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 35
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 310 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 37
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 311 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 41
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 313 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 42
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 324 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                  L16_2021 = 43
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                  L12_2017 = L14_2019
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 325 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.sendDesktopCommand
                                                                                                                                                                  L16_2021 = "UILuaCommands.FaceTarget"
                                                                                                                                                                  L14_2019(L15_2020, L16_2021)
                                                                                                                                                                  L12_2017 = true
                                                                                                                                                                  break
                                                                                                                                                                else
                                                                                                                                                                end
                                                                                                                                                                if L13_2018 == 327 then
                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                  L14_2019 = A0_2005.getStaticWidget
                                                                                                                                                                  L16_2021 = 1
                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                                                                  L16_2021 = L14_2019
                                                                                                                                                                  L15_2020 = L14_2019.isButtonEnable
                                                                                                                                                                  L15_2020 = L15_2020(L16_2021, L17_2022)
                                                                                                                                                                  if L15_2020 == false then
                                                                                                                                                                    L12_2017 = false
                                                                                                                                                                  else
                                                                                                                                                                    L16_2021 = A0_2005
                                                                                                                                                                    L15_2020 = A0_2005.getWidget
                                                                                                                                                                    L15_2020 = L15_2020(L16_2021, L17_2022, L18_2023)
                                                                                                                                                                    if L15_2020 ~= nil then
                                                                                                                                                                      L16_2021 = A0_2005.closeWidgetDirect
                                                                                                                                                                      L16_2021(L17_2022, L18_2023)
                                                                                                                                                                    end
                                                                                                                                                                    L16_2021 = A0_2005.openMainMenuRootWidget
                                                                                                                                                                    L20_2025 = A9_2014
                                                                                                                                                                    L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024, L20_2025)
                                                                                                                                                                    L12_2017 = L16_2021
                                                                                                                                                                    do break end
                                                                                                                                                                    else
                                                                                                                                                                    end
                                                                                                                                                                    if L13_2018 == 328 then
                                                                                                                                                                      L15_2020 = A0_2005
                                                                                                                                                                      L14_2019 = A0_2005.getSwitchFlag
                                                                                                                                                                      L16_2021 = A2_2007[1]
                                                                                                                                                                      L15_2020 = L14_2019(L15_2020, L16_2021)
                                                                                                                                                                      if L14_2019 == true then
                                                                                                                                                                        L16_2021 = A0_2005.executePlayerJobChange
                                                                                                                                                                        L16_2021(L17_2022, L18_2023)
                                                                                                                                                                        L12_2017 = true
                                                                                                                                                                        do break end
                                                                                                                                                                        else
                                                                                                                                                                        end
                                                                                                                                                                        if L13_2018 == 332 then
                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                          L14_2019 = A0_2005.switchConfigParameter
                                                                                                                                                                          L16_2021 = 15
                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022, L18_2023, L19_2024)
                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                          break
                                                                                                                                                                        else
                                                                                                                                                                        end
                                                                                                                                                                        if L13_2018 == 326 then
                                                                                                                                                                          L14_2019 = A2_2007[1]
                                                                                                                                                                          if L14_2019 == nil then
                                                                                                                                                                            L14_2019 = 5
                                                                                                                                                                          else
                                                                                                                                                                            if L14_2019 < 1 or L14_2019 > 20 then
                                                                                                                                                                              L12_2017 = false
                                                                                                                                                                          end
                                                                                                                                                                          else
                                                                                                                                                                            L16_2021 = A0_2005
                                                                                                                                                                            L15_2020 = A0_2005._sendCountDown
                                                                                                                                                                            L15_2020(L16_2021, L17_2022)
                                                                                                                                                                            L12_2017 = true
                                                                                                                                                                            do break end
                                                                                                                                                                            else
                                                                                                                                                                            end
                                                                                                                                                                            if L13_2018 == 330 then
                                                                                                                                                                              L15_2020 = A0_2005
                                                                                                                                                                              L14_2019 = A0_2005.getMainMenuModeWidget
                                                                                                                                                                              L16_2021 = "LinkshellMembersListWidget"
                                                                                                                                                                              L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                                                                              if L14_2019 == nil then
                                                                                                                                                                                L15_2020 = A0_2005
                                                                                                                                                                                L14_2019 = A0_2005.getMainMenuModeWidget
                                                                                                                                                                                L16_2021 = "LinkshellListSubWidget"
                                                                                                                                                                                L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                                                                                if L14_2019 == nil then
                                                                                                                                                                                  L15_2020 = A0_2005
                                                                                                                                                                                  L14_2019 = A0_2005.getMainMenuModeWidget
                                                                                                                                                                                  L16_2021 = "LinkshellMenuSubWidget"
                                                                                                                                                                                  L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                                                                                end
                                                                                                                                                                              else
                                                                                                                                                                                if L14_2019 ~= nil then
                                                                                                                                                                                  L12_2017 = false
                                                                                                                                                                              end
                                                                                                                                                                              else
                                                                                                                                                                                L14_2019 = worldMaster
                                                                                                                                                                                L15_2020 = L14_2019
                                                                                                                                                                                L14_2019 = L14_2019._getMyPlayer
                                                                                                                                                                                L14_2019 = L14_2019(L15_2020)
                                                                                                                                                                                L16_2021 = L14_2019
                                                                                                                                                                                L15_2020 = L14_2019.countCommunityGroup
                                                                                                                                                                                L15_2020 = L15_2020(L16_2021, L17_2022)
                                                                                                                                                                                if L15_2020 > 0 then
                                                                                                                                                                                  L16_2021 = tonumber
                                                                                                                                                                                  L16_2021 = L16_2021(L17_2022)
                                                                                                                                                                                  if L16_2021 == nil or L16_2021 <= 0 or L15_2020 < L16_2021 then
                                                                                                                                                                                    L16_2021 = A4_2009[1]
                                                                                                                                                                                  end
                                                                                                                                                                                  if L16_2021 == nil then
                                                                                                                                                                                    L12_2017 = L17_2022
                                                                                                                                                                                  elseif L17_2022 == "string" then
                                                                                                                                                                                    for L20_2025 = 1, L15_2020 do
                                                                                                                                                                                      L21_2026 = L14_2019.getCommunityGroup
                                                                                                                                                                                      L21_2026 = L21_2026(L14_2019, 20002, L20_2025)
                                                                                                                                                                                      if L21_2026:_getDisplayName() == L16_2021 then
                                                                                                                                                                                        L12_2017 = A0_2005:executePlayerSetCurrentLinkshell(L21_2026)
                                                                                                                                                                                        break
                                                                                                                                                                                      end
                                                                                                                                                                                    end
                                                                                                                                                                                  else
                                                                                                                                                                                    if L17_2022 == L18_2023 then
                                                                                                                                                                                      if L16_2021 > L17_2022 and L15_2020 >= L16_2021 then
                                                                                                                                                                                        L20_2025 = L14_2019
                                                                                                                                                                                        L21_2026 = 20002
                                                                                                                                                                                        L21_2026 = L19_2024(L20_2025, L21_2026, L16_2021)
                                                                                                                                                                                        L12_2017 = L17_2022
                                                                                                                                                                                        do break end
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 243
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 101
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 244
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 102
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 245
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 103
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 246
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 104
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 247
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 105
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 248
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 106
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 249
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 107
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 250
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 108
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 251
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 109
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 252
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 110
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 253
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 111
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 254
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 112
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 255
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 113
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 256
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 114
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 257
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 115
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 258
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 116
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 259
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 117
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 260
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 118
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 261
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 119
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 262
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 120
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 263
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 121
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 264
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 122
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 265
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 123
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 266
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 124
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 267
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 125
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 268
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 126
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 269
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 127
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 270
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 128
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 271
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 129
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 272
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 130
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 273
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 131
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 274
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 132
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 275
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 133
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 276
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 134
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 277
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 135
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 278
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 136
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 279
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 137
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 280
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 138
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 281
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 139
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 282
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 140
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 283
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 141
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 284
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 142
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 285
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 143
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 286
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 144
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 309
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 145
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 317
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 149
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 333
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 155
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 334
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 156
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 318
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 151
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 319
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 152
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 320
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 153
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021, L17_2022)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 329
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L16_2021 = "emoteCommand"
                                                                                                                                                                                          L15_2020 = A0_2005
                                                                                                                                                                                          L14_2019 = A0_2005[L16_2021]
                                                                                                                                                                                          L16_2021 = 154
                                                                                                                                                                                          L14_2019 = L14_2019(L15_2020, L16_2021)
                                                                                                                                                                                          L12_2017 = L14_2019
                                                                                                                                                                                          break
                                                                                                                                                                                        else
                                                                                                                                                                                          L14_2019 = 314
                                                                                                                                                                                        end
                                                                                                                                                                                        if L13_2018 == L14_2019 then
                                                                                                                                                                                          L12_2017 = false
                                                                                                                                                                                          L14_2019 = nil
                                                                                                                                                                                          L16_2021 = L11_2016
                                                                                                                                                                                          L15_2020 = L11_2016[L17_2022]
                                                                                                                                                                                          L15_2020 = L15_2020(L16_2021)
                                                                                                                                                                                          L16_2021 = 0
                                                                                                                                                                                          if L15_2020 > L16_2021 then
                                                                                                                                                                                            L16_2021 = L15_2020
                                                                                                                                                                                            if L16_2021 == L17_2022 then
                                                                                                                                                                                              L14_2019 = 146
                                                                                                                                                                                              break
                                                                                                                                                                                            else
                                                                                                                                                                                            end
                                                                                                                                                                                            if L16_2021 == L17_2022 then
                                                                                                                                                                                              L14_2019 = 148
                                                                                                                                                                                              break
                                                                                                                                                                                            else
                                                                                                                                                                                            end
                                                                                                                                                                                            if L16_2021 == L17_2022 then
                                                                                                                                                                                              L14_2019 = 147
                                                                                                                                                                                              break
                                                                                                                                                                                            else
                                                                                                                                                                                            end
                                                                                                                                                                                            L16_2021 = A0_2005[L18_2023]
                                                                                                                                                                                            L16_2021 = L16_2021(L17_2022, L18_2023, L19_2024)
                                                                                                                                                                                            L12_2017 = L16_2021
                                                                                                                                                                                          else
                                                                                                                                                                                          end
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
                                                                                                                                                                      else
                                                                                                                                                                      end
                                                                                                                                                                  end
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
                                                                                                                                          else
                                                                                                                                          end
                                                                                                                                        else
                                                                                                                                        end
                                                                                                                                      else
                                                                                                                                      end
                                                                                                                                else
                                                                                                                                end
                                                                                                                              else
                                                                                                                              end
                                                                                                                          else
                                                                                                                          end
                                                                                                                        else
                                                                                                                        end
                                                                                                                    else
                                                                                                                    end
                                                                                                                else
                                                                                                                end
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
                                                                    end
                                                                end
                                                              else
                                                              end
                                                          else
                                                          end
                                                      else
                                                      end
                                                  else
                                                  end
                                                end
                                            end
                                          else
                                          end
                                        end
                                    else
                                    end
                                  end
                                else
                                end
                            end
                          else
                          end
                      else
                      end
                  else
                  end
              else
              end
            end
        else
        end
    else
    end
  return L12_2017
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTextCommandType"
function L2_2(A0_2027, A1_2028)
  local L2_2029, L3_2030
  L2_2029 = 1
  L3_2030 = A1_2028
  if L3_2030 == 210 then
  elseif L3_2030 == 211 then
  elseif L3_2030 == 212 then
  elseif L3_2030 == 217 then
  elseif L3_2030 == 231 then
  elseif L3_2030 == 216 then
  elseif L3_2030 == 232 then
  elseif L3_2030 == 230 then
  elseif L3_2030 == 296 then
  else
  end
  if L3_2030 == 328 then
    L2_2029 = 2
    break
  else
  end
  if L3_2030 == 227 then
    L2_2029 = 3
    do break end
    break
  else
  end
  return L2_2029
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTextCommandTarget"
function L2_2(A0_2031, A1_2032, A2_2033, A3_2034, A4_2035)
  local L5_2036, L6_2037, L7_2038, L8_2039, L9_2040, L10_2041, L11_2042, L12_2043, L13_2044, L14_2045, L15_2046
  L5_2036 = 1
  L6_2037, L7_2038, L8_2039 = nil, nil, nil
  L9_2040 = false
  L10_2041 = A1_2032
  if L10_2041 == 103 then
    L8_2039 = A4_2035[2]
    L7_2038 = A4_2035[1]
    L9_2040 = true
    break
  else
  end
  if L10_2041 == 287 then
    L7_2038 = A4_2035[1]
    L9_2040 = true
    break
  else
  end
  if L10_2041 == 210 then
    L8_2039 = A4_2035[2]
    L7_2038 = A4_2035[1]
    break
  else
  end
  if L10_2041 == 216 then
    L7_2038 = A4_2035[1]
    break
  else
  end
  if L10_2041 == 230 then
    L7_2038 = A3_2034[2]
    break
  else
  end
  if L10_2041 == 219 then
    L7_2038 = A4_2035[1]
    break
  else
  end
  if L10_2041 == 223 then
    L7_2038 = A4_2035[1]
    do break end
    break
  else
  end
  if L7_2038 ~= nil then
    L11_2042 = A0_2031
    L10_2041 = A0_2031.getTextCommandTargetType
    L12_2043 = L7_2038
    L13_2044 = L9_2040
    L10_2041 = L10_2041(L11_2042, L12_2043, L13_2044)
    L5_2036 = L10_2041
    if L5_2036 == 2 then
      L6_2037 = L7_2038
      if L8_2039 ~= nil then
        L10_2041 = L6_2037
        L11_2042 = " "
        L12_2043 = L8_2039
        L6_2037 = L10_2041 .. L11_2042 .. L12_2043
      end
    elseif A1_2032 == 103 then
      L10_2041 = A4_2035[3]
      if L10_2041 ~= nil then
        L10_2041 = A4_2035[2]
        L11_2042 = " "
        L12_2043 = A4_2035[3]
        L10_2041 = L10_2041 .. L11_2042 .. L12_2043
        A4_2035[3] = L10_2041
      end
    end
  end
  L10_2041 = 101
  L11_2042 = false
  L12_2043 = L5_2036
  if L12_2043 == 5 then
    L13_2044 = A1_2032
    if L13_2044 == 216 then
      L14_2045 = worldMaster
      L15_2046 = L14_2045
      L14_2045 = L14_2045._getMyPlayer
      L14_2045 = L14_2045(L15_2046)
      L15_2046 = L14_2045.searchCommandSlot
      L15_2046 = L15_2046(L14_2045, A2_2033[1])
      if L15_2046 ~= nil then
        L10_2041 = L14_2045:getCustomCommand(L15_2046):getTargetControlMode()
        L11_2042 = L14_2045:getCustomCommand(L15_2046):isMagicCommand()
      else
        A0_2031:printErrorMessage(32711)
        L5_2036 = 0
        do break end
        do break end
        do break end
        do break end
        else
        end
        if L12_2043 == 6 then
          L10_2041 = 102
          break
        else
        end
        if L12_2043 == 7 then
          L10_2041 = 103
          break
        else
        end
        if L12_2043 == 8 then
          L10_2041 = 104
          break
        else
        end
        if L12_2043 == 9 then
          L10_2041 = 106
          break
        else
        end
        if L12_2043 == 10 then
          L10_2041 = 107
          break
        else
        end
      end
    else
    end
  L12_2043 = L5_2036
  L13_2044 = L6_2037
  L14_2045 = L10_2041
  L15_2046 = L11_2042
  return L12_2043, L13_2044, L14_2045, L15_2046
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getTextCommandTargetType"
function L2_2(A0_2047, A1_2048, A2_2049)
  local L3_2050, L4_2051
  L3_2050 = false
  if A2_2049 == true then
    L4_2051 = _string
    L4_2051 = L4_2051.find
    L4_2051 = L4_2051(A1_2048, "<")
    if L4_2051 == 1 then
      L3_2050 = true
    end
  end
  L4_2051 = 2
  if A1_2048 == "<me>" then
  else
  end
  if A1_2048 == "<p0>" then
    L4_2051 = 3
    break
  else
  end
  if A1_2048 == "<t>" then
    L4_2051 = 4
    break
  else
  end
  if A1_2048 == "<st>" then
    L4_2051 = 5
    break
  else
  end
  if A1_2048 == "<stpc>" then
    L4_2051 = 6
    break
  else
  end
  if A1_2048 == "<stnpc>" then
    L4_2051 = 7
    break
  else
  end
  if A1_2048 == "<stparty>" then
    L4_2051 = 8
    break
  else
  end
  if A1_2048 == "<stenemy>" then
    L4_2051 = 9
    break
  else
  end
  if A1_2048 == "<stenmity>" then
    L4_2051 = 10
    break
  else
  end
  if A1_2048 == "<lastst>" then
    if L3_2050 == true then
      L4_2051 = 11
      do break end
      else
      end
      if A1_2048 == "<lastat>" then
        L4_2051 = 12
        break
      else
      end
      if A1_2048 == "<p1>" then
        L4_2051 = 13
        break
      else
      end
      if A1_2048 == "<p2>" then
        L4_2051 = 14
        break
      else
      end
      if A1_2048 == "<p3>" then
        L4_2051 = 15
        break
      else
      end
      if A1_2048 == "<p4>" then
        L4_2051 = 16
        break
      else
      end
      if A1_2048 == "<p5>" then
        L4_2051 = 17
        break
      else
      end
      if A1_2048 == "<p6>" then
        L4_2051 = 18
        break
      else
      end
      if A1_2048 == "<p7>" then
        L4_2051 = 19
        break
      else
      end
      if L3_2050 == true then
        L4_2051 = 0
      end
    else
    end
  if A0_2047.work.lockUserControl == true and A0_2047:isSubTargetType(L4_2051) == true then
    L4_2051 = 0
  end
  if A0_2047.work.tutorialFlag == true and L4_2051 ~= 2 then
    L4_2051 = 0
  end
  return L4_2051
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isSubTargetType"
function L2_2(A0_2052, A1_2053)
  local L2_2054, L3_2055
  L2_2054 = false
  L3_2055 = A1_2053
  if L3_2055 == 5 then
  elseif L3_2055 == 6 then
  elseif L3_2055 == 7 then
  elseif L3_2055 == 8 then
  elseif L3_2055 == 9 then
  else
  end
  if L3_2055 == 10 then
    L2_2054 = true
    do break end
    break
  else
  end
  return L2_2054
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getSubCommandID"
function L2_2(A0_2056, A1_2057)
  local L3_2058
  if A1_2057 == nil then
    L3_2058 = nil
    return L3_2058
  end
  L3_2058 = A1_2057
  if A1_2057 % 2 == 0 then
    L3_2058 = L3_2058 - 1
  end
  return L3_2058
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getEquipID"
function L2_2(A0_2059, A1_2060)
  local L2_2061
  if A0_2059:getSubCommandID(A1_2060) == 19 then
    L2_2061 = 1
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 21 then
    L2_2061 = 2
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 23 then
    L2_2061 = 5
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 25 then
    L2_2061 = 6
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 27 then
    L2_2061 = 7
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 29 then
    L2_2061 = 9
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 31 then
    L2_2061 = 10
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 33 then
    L2_2061 = 11
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 35 then
    L2_2061 = 12
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 37 then
    L2_2061 = 13
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 39 then
    L2_2061 = 14
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 41 then
    L2_2061 = 15
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 43 then
    L2_2061 = 16
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 45 then
    L2_2061 = 17
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 47 then
    L2_2061 = 18
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 49 then
    L2_2061 = 18
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 89 then
    L2_2061 = 18
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 51 then
    L2_2061 = 20
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 53 then
    L2_2061 = 20
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 91 then
    L2_2061 = 20
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 55 then
    L2_2061 = 22
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 59 then
    L2_2061 = 22
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 93 then
    L2_2061 = 22
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 57 then
    L2_2061 = 23
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 61 then
    L2_2061 = 23
    break
  else
  end
  if A0_2059:getSubCommandID(A1_2060) == 95 then
    L2_2061 = 23
    do break end
    break
  else
  end
  return L2_2061
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getHandID"
function L2_2(A0_2062, A1_2063, A2_2064)
  local L3_2065
  if A1_2063 ~= nil then
    if A0_2062:getSubCommandID(A1_2063) == 19 then
      L3_2065 = 1
      break
    else
    end
    if A0_2062:getSubCommandID(A1_2063) == 21 then
      L3_2065 = 2
      do break end
      break
    else
    end
  elseif A2_2064 == nil then
    L3_2065 = 1
  end
  return L3_2065
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getSwitchFlag"
function L2_2(A0_2066, A1_2067)
  local L2_2068, L3_2069
  L2_2068 = true
  L3_2069 = nil
  if A1_2067 ~= nil then
    if A0_2066:getSubCommandID(A1_2067) == 1 then
      L3_2069 = true
    elseif A0_2066:getSubCommandID(A1_2067) == 3 then
      L3_2069 = false
    else
      L2_2068 = false
    end
  end
  return L2_2068, L3_2069
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "emoteCommand"
function L2_2(A0_2070, A1_2071, A2_2072)
  local L3_2073
  L3_2073 = true
  if A2_2072 ~= nil then
    if A0_2070:getSubCommandID(A2_2072) == 15 then
      L3_2073 = false
    else
      return false
    end
  end
  return A0_2070:executePlayerEmote(A1_2071, L3_2073)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "chatCommand"
function L2_2(A0_2074, A1_2075, A2_2076, A3_2077)
  if A3_2077 ~= nil then
    if A3_2077 == "" then
      return false
    end
    if string:contains(A3_2077, "/") == true then
      return false
    end
    A3_2077 = _normalizeDisplayName(A3_2077)
  end
  if A2_2076 ~= nil then
    A0_2074:chatDirect(A1_2075, A2_2076, A3_2077)
  elseif A1_2075 ~= 6 then
    A0_2074:getStaticWidget(2):setChatMode(A1_2075, A3_2077)
  else
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "printSystemMessage"
function L2_2(A0_2078, A1_2079, ...)
  local L4_2081, L5_2082, L6_2083, L7_2084
  L4_2081 = worldMaster
  L5_2082 = L4_2081
  L4_2081 = L4_2081.notify
  L6_2083 = worldMaster
  L7_2084 = A1_2079
  L4_2081(L5_2082, L6_2083, L7_2084, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "printErrorMessage"
function L2_2(A0_2085, A1_2086, ...)
  local L4_2088, L5_2089, L6_2090, L7_2091
  L4_2088 = worldMaster
  L5_2089 = L4_2088
  L4_2088 = L4_2088.alert
  L6_2090 = worldMaster
  L7_2091 = A1_2086
  L4_2088(L5_2089, L6_2090, L7_2091, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "echoText"
function L2_2(A0_2092, A1_2093)
  if A0_2092:checkText(A1_2093) == false then
    return
  end
  worldMaster:_printLog(A1_2093)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "errorText"
function L2_2(A0_2094, A1_2095)
  if A0_2094:checkText(A1_2095) == false then
    return
  end
  A0_2094:printErrorMessage(25301, A1_2095)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "switchConfigParameterOld"
function L2_2(A0_2096, A1_2097, A2_2098, A3_2099)
  local L4_2100, L5_2101, L6_2102
  L4_2100 = false
  L6_2102 = A0_2096
  L5_2101 = A0_2096._getUserConfig
  L5_2101 = L5_2101(L6_2102, A1_2097, A2_2098)
  L6_2102 = nil
  if A3_2099 == nil then
    if L5_2101 == 0 then
      L6_2102 = 1
    else
      L6_2102 = 0
    end
  else
    if A0_2096:getSubCommandID(A3_2099) == 1 then
      L6_2102 = 1
      break
    else
    end
    if A0_2096:getSubCommandID(A3_2099) == 3 then
      L6_2102 = 0
      do break end
      break
    else
    end
  end
  if L6_2102 ~= nil then
    if L5_2101 ~= L6_2102 then
      A0_2096:_setUserConfig(A1_2097, A2_2098, L6_2102)
      A0_2096:_saveUserConfig()
      if A0_2096:getWidget(3, "ConfigWidget") ~= nil then
        A0_2096:getWidget(3, "ConfigWidget"):update()
      end
    end
    L4_2100 = true
  end
  return L4_2100
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "switchConfigParameter"
function L2_2(A0_2103, A1_2104, A2_2105, A3_2106, A4_2107)
  local L5_2108, L6_2109, L7_2110, L8_2111, L9_2112
  L5_2108 = false
  L7_2110 = A0_2103
  L6_2109 = A0_2103.getSwitchFlag
  L8_2111 = A2_2105
  L7_2110 = L6_2109(L7_2110, L8_2111)
  if L6_2109 == true then
    L8_2111 = 0
    L9_2112 = A4_2107
    if L7_2110 == nil then
      if A0_2103:getConfigWork(A1_2104) == 0 then
        L7_2110 = true
      else
        L7_2110 = false
      end
    end
    if L7_2110 == true then
      L8_2111 = 1
      L9_2112 = A3_2106
    end
    A0_2103:setConfigWorkWithSave(A1_2104, L8_2111)
    A0_2103:printSystemMessage(L9_2112)
    L5_2108 = true
  end
  return L5_2108
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getItemIndex"
function L2_2(A0_2113, A1_2114, A2_2115, A3_2116)
  local L4_2117, L5_2118, L6_2119, L7_2120, L8_2121, L9_2122
  if A2_2115 ~= nil then
    A2_2115 = A2_2115 + 1
  end
  L4_2117 = 0
  L5_2118 = A0_2113.getItemPackageCount
  L5_2118 = L5_2118(L6_2119, L7_2120)
  for L9_2122 = 1, L5_2118 do
    if A0_2113:isEqualItem(1, L9_2122, A1_2114, A2_2115, A3_2116) == true then
      L4_2117 = L9_2122
      break
    end
  end
  return L4_2117
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isEqualItem"
function L2_2(A0_2123, A1_2124, A2_2125, A3_2126, A4_2127, A5_2128)
  if A0_2123:getItem(worldMaster:_getMyPlayer(), A1_2124, A2_2125):_getCatalogID() == A3_2126 then
    if A5_2128 == true and A0_2123:getItem(worldMaster:_getMyPlayer(), A1_2124, A2_2125):_isEquipping() == true then
      return false
    end
    if A4_2127 ~= nil and A4_2127 ~= A0_2123:getItem(worldMaster:_getMyPlayer(), A1_2124, A2_2125):_getNameIndex() then
      return false
    end
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getRecastTime"
function L2_2(A0_2129, A1_2130)
  if A0_2129:getRecastTimeForCustomCommand(A1_2130) == nil then
    return nil
  end
  return 0
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setDefaultCamera"
function L2_2(A0_2131, A1_2132)
  if A1_2132 == true then
    A0_2131:sendDesktopCommand("RaptureCommands.TPSCameraMemorize")
  else
    A0_2131:sendDesktopCommand("RaptureCommands.TPSCameraInitialize")
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigCategory"
function L2_2(A0_2133, A1_2134)
  local L2_2135, L3_2136, L4_2137, L5_2138
  L4_2137 = A1_2134
  if L4_2137 == 1 then
    L2_2135 = 1
    L3_2136 = 1
    break
  else
  end
  if L4_2137 == 4 then
    L2_2135 = 1
    L3_2136 = 4
    break
  else
  end
  if L4_2137 == 5 then
    L2_2135 = 1
    L3_2136 = 5
    break
  else
  end
  if L4_2137 == 6 then
    L2_2135 = 1
    L3_2136 = 6
    break
  else
  end
  if L4_2137 == 7 then
    L2_2135 = 1
    L3_2136 = 7
    break
  else
  end
  if L4_2137 == 17 then
    L2_2135 = 1
    L3_2136 = 17
    break
  else
  end
  if L4_2137 == 18 then
    L2_2135 = 1
    L3_2136 = 18
    break
  else
  end
  if L4_2137 == 19 then
    L2_2135 = 1
    L3_2136 = 19
    break
  else
  end
  if L4_2137 == 9 then
    L2_2135 = 1
    L3_2136 = 9
    break
  else
  end
  if L4_2137 == 10 then
    L2_2135 = 1
    L3_2136 = 10
    break
  else
  end
  if L4_2137 == 11 then
    L2_2135 = 1
    L3_2136 = 11
    break
  else
  end
  if L4_2137 == 12 then
    L2_2135 = 1
    L3_2136 = 12
    break
  else
  end
  if L4_2137 == 16 then
    L2_2135 = 1
    L3_2136 = 16
    break
  else
  end
  if L4_2137 == 13 then
    L2_2135 = 1
    L3_2136 = 13
    break
  else
  end
  if L4_2137 == 14 then
    L2_2135 = 1
    L3_2136 = 14
    break
  else
  end
  if L4_2137 == 15 then
    L2_2135 = 1
    L3_2136 = 15
    break
  else
  end
  if L4_2137 == 20 then
    L2_2135 = 3
    L3_2136 = 1
    break
  else
  end
  if L4_2137 == 21 then
    L2_2135 = 3
    L3_2136 = 2
    break
  else
  end
  if L4_2137 == 22 then
    L2_2135 = 3
    L3_2136 = 3
    break
  else
  end
  if L4_2137 == 23 then
    L2_2135 = 3
    L3_2136 = 4
    break
  else
  end
  if L4_2137 == 24 then
    L2_2135 = 3
    L3_2136 = 5
    break
  else
  end
  if L4_2137 == 25 then
    L2_2135 = 3
    L3_2136 = 6
    break
  else
  end
  if L4_2137 == 26 then
    L2_2135 = 3
    L3_2136 = 7
    break
  else
  end
  if L4_2137 == 27 then
    L2_2135 = 3
    L3_2136 = 8
    break
  else
  end
  if L4_2137 == 28 then
    L2_2135 = 3
    L3_2136 = 12
    break
  else
  end
  if L4_2137 == 29 then
    L2_2135 = 3
    L3_2136 = 15
    break
  else
  end
  if L4_2137 == 30 then
    L2_2135 = 3
    L3_2136 = 16
    break
  else
  end
  if L4_2137 == 31 then
    L2_2135 = 3
    L3_2136 = 17
    break
  else
  end
  if L4_2137 == 32 then
    L2_2135 = 3
    L3_2136 = 18
    break
  else
  end
  if L4_2137 == 33 then
    L2_2135 = 3
    L3_2136 = 21
    break
  else
  end
  if L4_2137 == 34 then
    L2_2135 = 3
    L3_2136 = 22
    break
  else
  end
  if L4_2137 == 35 then
    L2_2135 = 3
    L3_2136 = 23
    break
  else
  end
  if L4_2137 == 36 then
    L2_2135 = 3
    L3_2136 = 24
    break
  else
  end
  if L4_2137 == 37 then
    L2_2135 = 3
    L3_2136 = 25
    break
  else
  end
  if L4_2137 == 38 then
    L2_2135 = 3
    L3_2136 = 26
    break
  else
  end
  if L4_2137 == 39 then
    L2_2135 = 3
    L3_2136 = 27
    break
  else
  end
  if L4_2137 == 40 then
    L2_2135 = 3
    L3_2136 = 28
    break
  else
  end
  if L4_2137 == 41 then
    L2_2135 = 3
    L3_2136 = 29
    break
  else
  end
  if L4_2137 == 42 then
    L2_2135 = 3
    L3_2136 = 30
    break
  else
  end
  if L4_2137 == 43 then
    L2_2135 = 3
    L3_2136 = 31
    break
  else
  end
  if L4_2137 == 50 then
    L2_2135 = 4
    L3_2136 = 1
    break
  else
  end
  if L4_2137 == 51 then
    L2_2135 = 4
    L3_2136 = 2
    break
  else
  end
  if L4_2137 == 52 then
    L2_2135 = 4
    L3_2136 = 3
    break
  else
  end
  if L4_2137 == 53 then
    L2_2135 = 4
    L3_2136 = 4
    break
  else
  end
  if L4_2137 == 54 then
    L2_2135 = 4
    L3_2136 = 5
    break
  else
  end
  if L4_2137 == 55 then
    L2_2135 = 4
    L3_2136 = 6
    break
  else
  end
  if L4_2137 == 56 then
    L2_2135 = 4
    L3_2136 = 7
    break
  else
  end
  if L4_2137 == 60 then
    L2_2135 = 5
    L3_2136 = 1
    break
  else
  end
  if L4_2137 == 61 then
    L2_2135 = 5
    L3_2136 = 2
    break
  else
  end
  if L4_2137 == 62 then
    L2_2135 = 5
    L3_2136 = 3
    break
  else
  end
  if L4_2137 == 63 then
    L2_2135 = 5
    L3_2136 = 4
    break
  else
  end
  if L4_2137 == 64 then
    L2_2135 = 5
    L3_2136 = 9
    break
  else
  end
  if L4_2137 == 70 then
    L2_2135 = 7
    L3_2136 = 1
    break
  else
  end
  if L4_2137 == 71 then
    L2_2135 = 7
    L3_2136 = 2
    break
  else
  end
  if L4_2137 == 72 then
    L2_2135 = 7
    L3_2136 = 17
    break
  else
  end
  if L4_2137 == 73 then
    L2_2135 = 7
    L3_2136 = 4
    break
  else
  end
  if L4_2137 == 74 then
    L2_2135 = 7
    L3_2136 = 5
    break
  else
  end
  if L4_2137 == 75 then
    L2_2135 = 7
    L3_2136 = 6
    break
  else
  end
  if L4_2137 == 76 then
    L2_2135 = 7
    L3_2136 = 7
    break
  else
  end
  if L4_2137 == 77 then
    L2_2135 = 7
    L3_2136 = 8
    break
  else
  end
  if L4_2137 == 78 then
    L2_2135 = 7
    L3_2136 = 9
    break
  else
  end
  if L4_2137 == 79 then
    L2_2135 = 7
    L3_2136 = 10
    break
  else
  end
  if L4_2137 == 80 then
    L2_2135 = 7
    L3_2136 = 11
    break
  else
  end
  if L4_2137 == 85 then
    L2_2135 = 7
    L3_2136 = 16
    break
  else
  end
  if L4_2137 == 81 then
    L2_2135 = 7
    L3_2136 = 12
    break
  else
  end
  if L4_2137 == 82 then
    L2_2135 = 7
    L3_2136 = 13
    break
  else
  end
  if L4_2137 == 83 then
    L2_2135 = 7
    L3_2136 = 14
    break
  else
  end
  if L4_2137 == 84 then
    L2_2135 = 7
    L3_2136 = 15
    do break end
    break
  else
  end
  L4_2137 = L2_2135
  L5_2138 = L3_2136
  return L4_2137, L5_2138
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setConfigWork"
function L2_2(A0_2139, A1_2140, A2_2141)
  local L3_2142, L4_2143
  L4_2143 = A0_2139
  L3_2142 = A0_2139.getConfigCategory
  L4_2143 = L3_2142(L4_2143, A1_2140)
  if L3_2142 == nil then
    return false
  end
  if A0_2139:_getUserConfig(L3_2142, L4_2143) == A2_2141 then
    return false
  end
  A0_2139:_setUserConfig(L3_2142, L4_2143, A2_2141)
  A0_2139:updateConfigWork(A1_2140)
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updateConfigWork"
function L2_2(A0_2144, A1_2145)
  local L2_2146, L3_2147
  L2_2146 = A1_2145
  if L2_2146 == 1 then
    L3_2147 = A0_2144.updateActionMenuWidget
    L3_2147(A0_2144, false, A0_2144:isShowActionMenu(), true)
    break
  else
  end
  if L2_2146 == 13 then
    L3_2147 = A0_2144.cancelLockon
    L3_2147(A0_2144)
    L3_2147 = A0_2144.setTargetMode
    L3_2147(A0_2144, A0_2144:getDefaultTargetMode())
    break
  else
  end
  if L2_2146 == 33 then
    L3_2147 = A0_2144.getStaticWidget
    L3_2147 = L3_2147(A0_2144, 15)
    L3_2147 = L3_2147.updatePopupHelp
    L3_2147(L3_2147)
    break
  else
  end
  if L2_2146 == 37 then
    L3_2147 = true
    if A0_2144:getConfigFlag(A1_2145) == true then
      L3_2147 = false
    end
    A0_2144:setProperty("IsDragResize", L3_2147)
    A0_2144:getStaticWidget(15):updateUILock()
    break
  else
  end
  if L2_2146 == 39 then
    L3_2147 = A0_2144.updateLogFontSize
    L3_2147(A0_2144, 39)
    break
  else
  end
  if L2_2146 == 40 then
    L3_2147 = A0_2144.updateLogFontSize
    L3_2147(A0_2144, 40)
    break
  else
  end
  if L2_2146 == 41 then
    L3_2147 = A0_2144.getConfigFlag
    L3_2147 = L3_2147(A0_2144, 41)
    if L3_2147 == false then
      L3_2147 = A0_2144.getStaticWidget
      L3_2147 = L3_2147(A0_2144, 7)
      if L3_2147:isShowMacro() == true then
        L3_2147:hideUserMacro()
        do break end
        else
        end
        if L2_2146 == 71 then
          L3_2147 = A0_2144.getStaticWidget
          L3_2147 = L3_2147(A0_2144, 15)
          L3_2147 = L3_2147.updateActionHelp
          L3_2147(L3_2147)
          break
        else
        end
      else
      end
    else
    end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setConfigWorkWithSave"
function L2_2(A0_2148, A1_2149, A2_2150)
  if A0_2148:setConfigWork(A1_2149, A2_2150) == true then
    A0_2148:_saveUserConfig()
    if A0_2148:getWidget(3, "ConfigWidget") ~= nil then
      A0_2148:getWidget(3, "ConfigWidget"):update()
    end
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigWork"
function L2_2(A0_2151, A1_2152)
  local L2_2153, L3_2154
  L3_2154 = A0_2151
  L2_2153 = A0_2151.getConfigCategory
  L3_2154 = L2_2153(L3_2154, A1_2152)
  if L2_2153 == nil then
    return nil
  end
  return A0_2151:_getUserConfig(L2_2153, L3_2154)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "resetConfigWork"
function L2_2(A0_2155, A1_2156)
  local L2_2157, L3_2158
  L3_2158 = A0_2155
  L2_2157 = A0_2155.getConfigCategory
  L3_2158 = L2_2157(L3_2158, A1_2156)
  if L2_2157 == nil then
    return
  end
  A0_2155:_resetUserConfig(L2_2157, L3_2158)
  if A0_2155:_getUserConfig(L2_2157, L3_2158) ~= A0_2155:_getUserConfig(L2_2157, L3_2158) then
    A0_2155:updateConfigWork(A1_2156)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setConfigFlag"
function L2_2(A0_2159, A1_2160, A2_2161)
  local L3_2162
  L3_2162 = 0
  if A2_2161 == true then
    L3_2162 = 1
  end
  A0_2159:setConfigWork(A1_2160, L3_2162)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigFlag"
function L2_2(A0_2163, A1_2164)
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigLogIndex"
function L2_2(A0_2165, A1_2166, A2_2167)
  local L3_2168, L4_2169
  L3_2168 = A1_2166 - 1
  L3_2168 = L3_2168 * 4
  L4_2169 = A2_2167 - 1
  L3_2168 = L3_2168 + L4_2169
  return L3_2168
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setConfigLogTitle"
function L2_2(A0_2170, A1_2171, A2_2172, A3_2173)
  if A3_2173 == nil or A3_2173 == "" then
    A3_2173 = "@"
  end
  A0_2170:_setUserConfig(6, 1 + A0_2170:getConfigLogIndex(A1_2171, A2_2172), A3_2173)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigLogTitle"
function L2_2(A0_2174, A1_2175, A2_2176)
  if A0_2174:_getUserConfig(6, 1 + A0_2174:getConfigLogIndex(A1_2175, A2_2176)) == "" or A0_2174:_getUserConfig(6, 1 + A0_2174:getConfigLogIndex(A1_2175, A2_2176)) == "@" then
    if A1_2175 == 1 then
      if A2_2176 == 1 then
      else
        if A2_2176 == 2 then
          do break end
          else
          end
          if A1_2175 == 2 and A2_2176 == 1 then
        else
        end
      end
    return 2202
  end
  return (A0_2174:_getUserConfig(6, 1 + A0_2174:getConfigLogIndex(A1_2175, A2_2176)))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setConfigLogData"
function L2_2(A0_2177, A1_2178, A2_2179, A3_2180)
  local L4_2181, L5_2182, L6_2183
  L5_2182 = A0_2177
  L4_2181 = A0_2177.getConfigLogIndex
  L6_2183 = A1_2178
  L4_2181 = L4_2181(L5_2182, L6_2183, A2_2179)
  L5_2182 = "@"
  if A3_2180 ~= nil then
    L6_2183 = #A3_2180
    if L6_2183 >= 1 then
      L5_2182 = ""
      for _FORV_10_ = 1, L6_2183 do
        L5_2182 = L5_2182 .. "/" .. tostring(A3_2180[_FORV_10_])
      end
    end
  end
  L6_2183 = A0_2177._setUserConfig
  L6_2183(A0_2177, 6, 9 + L4_2181, L5_2182)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigLogData"
function L2_2(A0_2184, A1_2185, A2_2186)
  return ""
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "checkConfigLogData"
function L2_2(A0_2187)
  local L1_2188, L2_2189, L3_2190, L4_2191, L5_2192, L6_2193, L7_2194, L8_2195, L9_2196
  L1_2188 = false
  for L5_2192 = 1, 2 do
    for L9_2196 = 1, 2 do
      if A0_2187:_getUserConfig(6, 9 + A0_2187:getConfigLogIndex(L5_2192, L9_2196)) == "" then
        A0_2187:initConfigLogData(L5_2192, L9_2196)
        L1_2188 = true
      end
    end
  end
  if L1_2188 == true then
    L2_2189(L3_2190)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "initConfigLogData"
function L2_2(A0_2197, A1_2198, A2_2199)
  local L3_2200, L4_2201
  L4_2201 = A0_2197
  L3_2200 = A0_2197.getConfigLogDefaultData
  L3_2200 = L3_2200(L4_2201, A1_2198, A2_2199)
  L4_2201 = A0_2197.setConfigLogData
  L4_2201(A0_2197, A1_2198, A2_2199, L3_2200)
  L4_2201 = false
  if A2_2199 == 1 then
    L4_2201 = true
  end
  A0_2197:setConfigLogEnable(A1_2198, A2_2199, L4_2201)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigLogDefaultData"
function L2_2(A0_2202, A1_2203, A2_2204)
  local L3_2205, L4_2206, L5_2207, L6_2208, L7_2209, L8_2210, L9_2211, L10_2212
  L3_2205 = {}
  L4_2206 = 0
  if A1_2203 == 1 then
    if A2_2204 == 1 then
      L4_2206 = 1
    elseif A2_2204 == 2 then
      L4_2206 = 2
    end
  elseif A1_2203 == 2 and A2_2204 == 1 then
    L4_2206 = 2
  end
  L5_2207 = L4_2206
  if L5_2207 == 1 then
    for L9_2211 = 1, 128 do
      L10_2212 = L9_2211
      if L10_2212 == 28 then
      elseif L10_2212 == 29 then
      elseif L10_2212 == 30 then
      elseif L10_2212 == 31 then
      elseif L10_2212 == 34 then
      elseif L10_2212 == 35 then
      elseif L10_2212 == 36 then
      elseif L10_2212 == 37 then
      elseif L10_2212 == 38 then
      elseif L10_2212 == 39 then
      elseif L10_2212 == 13 then
      elseif L10_2212 == 67 then
      elseif L10_2212 == 14 then
      elseif L10_2212 == 15 then
      elseif L10_2212 == 16 then
      elseif L10_2212 == 17 then
      elseif L10_2212 == 18 then
      elseif L10_2212 == 19 then
      elseif L10_2212 == 20 then
      elseif L10_2212 == 21 then
      elseif L10_2212 == 22 then
      elseif L10_2212 == 23 then
      elseif L10_2212 == 24 then
      elseif L10_2212 == 26 then
      elseif L10_2212 == 80 then
      elseif L10_2212 == 81 then
      elseif L10_2212 == 82 then
      elseif L10_2212 == 83 then
      elseif L10_2212 == 84 then
      elseif L10_2212 == 85 then
      elseif L10_2212 == 86 then
      elseif L10_2212 == 87 then
      elseif L10_2212 == 88 then
      elseif L10_2212 == 89 then
      elseif L10_2212 == 90 then
      elseif L10_2212 == 91 then
      elseif L10_2212 == 92 then
      elseif L10_2212 == 93 then
      elseif L10_2212 == 94 then
      elseif L10_2212 == 95 then
      elseif L10_2212 == 96 then
      elseif L10_2212 == 97 then
      elseif L10_2212 == 98 then
      elseif L10_2212 == 99 then
      elseif L10_2212 == 100 then
      elseif L10_2212 == 101 then
      elseif L10_2212 == 102 then
      elseif L10_2212 == 103 then
      elseif L10_2212 == 104 then
      elseif L10_2212 == 105 then
      elseif L10_2212 == 106 then
      elseif L10_2212 == 107 then
      elseif L10_2212 == 108 then
      elseif L10_2212 == 109 then
      elseif L10_2212 == 69 then
      elseif L10_2212 == 71 then
      else
        if L10_2212 == 73 then
          break
        else
        end
        _table.insert(L3_2205, L9_2211)
        break
      end
    end
    break
  else
  end
  if L5_2207 == 2 then
    for L9_2211 = 66, 109 do
      L10_2212 = L9_2211
      if L10_2212 == 67 then
      elseif L10_2212 == 66 then
      elseif L10_2212 == 85 then
      elseif L10_2212 == 91 then
      elseif L10_2212 == 97 then
      elseif L10_2212 == 103 then
      elseif L10_2212 == 109 then
      elseif L10_2212 == 69 then
      elseif L10_2212 == 70 then
      elseif L10_2212 == 71 then
      elseif L10_2212 == 72 then
      else
        if L10_2212 == 73 then
          break
        else
        end
        table:_insert(L3_2205, L9_2211)
        break
      end
    end
    do break end
    break
  else
  end
  return L3_2205
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigLogFlagTable"
function L2_2(A0_2213, A1_2214, A2_2215)
  local L3_2216, L4_2217
  L3_2216 = {}
  for _FORV_7_ = 1, 128 do
    L3_2216[_FORV_7_] = false
  end
  if L4_2217 ~= "" then
    for _FORV_9_ = 1, #string:split(L4_2217, "/") do
      if tonumber(string:split(L4_2217, "/")[_FORV_9_]) ~= nil then
        L3_2216[tonumber(string:split(L4_2217, "/")[_FORV_9_])] = true
      end
    end
  end
  L3_2216[13] = L3_2216[3]
  L3_2216[67] = L3_2216[66]
  L3_2216[14] = L3_2216[5]
  L3_2216[15] = L3_2216[6]
  L3_2216[16] = L3_2216[7]
  L3_2216[17] = L3_2216[8]
  L3_2216[18] = L3_2216[9]
  L3_2216[19] = L3_2216[10]
  L3_2216[20] = L3_2216[11]
  L3_2216[21] = L3_2216[12]
  if A0_2213:getConfigFlag(19) then
    L3_2216[110] = L3_2216[80]
    L3_2216[111] = L3_2216[81]
    L3_2216[112] = L3_2216[82]
    L3_2216[113] = L3_2216[83]
    L3_2216[114] = L3_2216[84]
    L3_2216[115] = L3_2216[85]
    L3_2216[116] = L3_2216[86]
    L3_2216[117] = L3_2216[87]
    L3_2216[118] = L3_2216[88]
    L3_2216[119] = L3_2216[89]
    L3_2216[120] = L3_2216[90]
    L3_2216[121] = L3_2216[91]
    L3_2216[122] = L3_2216[92]
    L3_2216[123] = L3_2216[93]
    L3_2216[124] = L3_2216[94]
    L3_2216[125] = L3_2216[95]
    L3_2216[126] = L3_2216[96]
    L3_2216[127] = L3_2216[97]
  else
    L3_2216[110] = false
    L3_2216[111] = false
    L3_2216[112] = false
    L3_2216[113] = false
    L3_2216[114] = false
    L3_2216[115] = false
    L3_2216[116] = false
    L3_2216[117] = false
    L3_2216[118] = false
    L3_2216[119] = false
    L3_2216[120] = false
    L3_2216[121] = false
    L3_2216[122] = false
    L3_2216[123] = false
    L3_2216[124] = false
    L3_2216[125] = false
    L3_2216[126] = false
    L3_2216[127] = false
  end
  return L3_2216
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigLogFilterData"
function L2_2(A0_2218, A1_2219, A2_2220)
  local L3_2221, L4_2222, L5_2223, L6_2224, L7_2225, L8_2226
  L3_2221 = ""
  L4_2222 = A0_2218.getConfigLogFlagTable
  L4_2222 = L4_2222(L5_2223, L6_2224, L7_2225)
  for L8_2226 = 1, #L4_2222 do
    if L4_2222[L8_2226] == true then
      L3_2221 = L3_2221 .. "," .. tostring(L8_2226)
    end
  end
  return L3_2221
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setConfigLogEnable"
function L2_2(A0_2227, A1_2228, A2_2229, A3_2230)
  local L4_2231, L5_2232
  L5_2232 = A0_2227
  L4_2231 = A0_2227.getConfigLogIndex
  L4_2231 = L4_2231(L5_2232, A1_2228, A2_2229)
  L5_2232 = 0
  if A3_2230 == true then
    L5_2232 = 1
  end
  A0_2227:_setUserConfig(6, 17 + L4_2231, L5_2232)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getConfigLogEnable"
function L2_2(A0_2233, A1_2234, A2_2235)
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "canRideChocobo"
function L2_2(A0_2236)
  local L1_2237
  L1_2237 = worldMaster
  L1_2237 = L1_2237._getMyPlayer
  L1_2237 = L1_2237(L1_2237)
  return _getStaticActor(320013):hasWhistle(L1_2237)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isRideChocobo"
function L2_2(A0_2238)
  local L1_2239
  L1_2239 = worldMaster
  L1_2239 = L1_2239._getMyPlayer
  L1_2239 = L1_2239(L1_2239)
  return _getStaticActor(320013):isRidingChocobo(L1_2239)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "processUpdateChocoboStatus"
function L2_2(A0_2240)
  A0_2240:getStaticWidget(15):updateChocoboStatus()
  A0_2240:getStaticWidget(15):updateGoobbueStatus()
  if A0_2240:isRideChocobo() == false then
    A0_2240:getStaticWidget(23):hide()
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "processRentalChocobo"
function L2_2(A0_2241, A1_2242)
  A0_2241:getStaticWidget(23):setTimer(A1_2242)
  A0_2241:getStaticWidget(23):show()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCallChocobo"
function L2_2(A0_2243)
  if A0_2243:isRideChocobo() == true then
    A0_2243:executePlayerCommand(12015)
  elseif A0_2243:canRideChocobo() == true then
    A0_2243:executePlayerCommand(12014)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "canRideGoobbue"
function L2_2(A0_2244)
  local L1_2245
  L1_2245 = worldMaster
  L1_2245 = L1_2245._getMyPlayer
  L1_2245 = L1_2245(L1_2245)
  return _getStaticActor(320013):hasGoobbueWhistle(L1_2245)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isRideGoobbue"
function L2_2(A0_2246)
  local L1_2247
  L1_2247 = worldMaster
  L1_2247 = L1_2247._getMyPlayer
  L1_2247 = L1_2247(L1_2247)
  return _getStaticActor(320013):isRidingGoobbue(L1_2247)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isRiding"
function L2_2(A0_2248)
  local L1_2249
  L1_2249 = worldMaster
  L1_2249 = L1_2249._getMyPlayer
  L1_2249 = L1_2249(L1_2249)
  return _getStaticActor(320013):isRiding(L1_2249)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "executeCallGoobbue"
function L2_2(A0_2250)
  if A0_2250:isRideGoobbue() == true then
    A0_2250:executePlayerCommand(12015)
  elseif A0_2250:canRideGoobbue() == true then
    A0_2250:executePlayerCommand(12014, true)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "cannotExecuteByRidingWithErrorMessage"
function L2_2(A0_2251)
  local L1_2252
  L1_2252 = worldMaster
  L1_2252 = L1_2252._getMyPlayer
  L1_2252 = L1_2252(L1_2252)
  if _getStaticActor(320013):isRiding(L1_2252) then
    worldMaster:alert(worldMaster, _getStaticActor(320013):getRidingErrorTextId(L1_2252))
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "cannotExecuteWithErrorMessage"
function L2_2(A0_2253)
  if A0_2253:cannotExecuteByRidingWithErrorMessage() then
    return true
  end
  if A0_2253:_getCurrentAreaMaster():_isInn() then
    worldMaster:alert(worldMaster, 60012)
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isNMRushEnable"
function L2_2(A0_2254)
  if worldMaster:_getMyPlayer():_getNMRushUpdateTime() > 0 then
    return true
  else
    return false
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "showAchievementPopup"
function L2_2(A0_2255, A1_2256, A2_2257)
  A0_2255:getStaticWidget(24):setAchivement(A1_2256, A2_2257)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "processReceiveAchievementRate"
function L2_2(A0_2258, A1_2259, A2_2260, A3_2261)
  if A0_2258:getWidget(3, "AchievementListWidget") ~= nil then
    A0_2258:getWidget(3, "AchievementListWidget"):updateRate(A1_2259, A2_2260, A3_2261)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "createStaticWidget"
function L2_2(A0_2262, A1_2263, A2_2264, A3_2265, A4_2266, A5_2267, ...)
  local L7_2269, L9_2270, L10_2271, L11_2272, L12_2273, L13_2274, L14_2275, L15_2276
  if A3_2265 == nil then
    A3_2265 = A2_2264
  end
  L7_2269 = A0_2262.work
  L7_2269 = L7_2269.widget
  L10_2271 = A0_2262
  L9_2270 = A0_2262.createWidget
  L11_2272 = A2_2264
  L12_2273 = A0_2262
  L13_2274 = A3_2265
  L14_2275 = A4_2266
  L15_2276 = A5_2267
  L9_2270 = L9_2270(L10_2271, L11_2272, L12_2273, L13_2274, L14_2275, L15_2276, ...)
  L7_2269[A1_2263] = L9_2270
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "createStaticChildWidget"
function L2_2(A0_2277, A1_2278, A2_2279, A3_2280, ...)
  local L5_2282
  L5_2282 = A0_2277.getStaticWidget
  L5_2282 = L5_2282(A0_2277, A1_2278)
  A0_2277:createWidget(A2_2279, L5_2282, A2_2279, L5_2282:getWidgetIndex(), A3_2280, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getStaticWidget"
function L2_2(A0_2283, A1_2284)
  local L2_2285
  L2_2285 = A0_2283.work
  L2_2285 = L2_2285.widget
  L2_2285 = L2_2285[A1_2284]
  return L2_2285
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getStaticChildWidget"
function L2_2(A0_2286, A1_2287, A2_2288)
  return A0_2286:getStaticWidget(A1_2287):getChildWidgetByWindowName(A2_2288)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openWidgetLocal"
function L2_2(A0_2289, A1_2290, A2_2291, A3_2292, A4_2293, A5_2294, ...)
  local L7_2296
  if A2_2291 == nil then
    A2_2291 = A1_2290
  end
  L7_2296 = true
  if A3_2292 == nil then
    A3_2292 = A0_2289
  elseif A3_2292 ~= A0_2289 and A3_2292:isShow() == true then
    L7_2296 = A3_2292:getInputEnable()
  end
  if A3_2292:_isAlive() == false then
    return false
  end
  if A0_2289:commandCreateWidget(A1_2290, false, A3_2292, L7_2296, A2_2291, A4_2293, A5_2294, ...) == true and A3_2292 ~= A0_2289 and A3_2292:isShow() == true then
    A3_2292:setInputEnable(false)
  end
  return (A0_2289:commandCreateWidget(A1_2290, false, A3_2292, L7_2296, A2_2291, A4_2293, A5_2294, ...))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openWidget"
function L2_2(A0_2297, A1_2298, A2_2299, A3_2300, A4_2301, A5_2302, ...)
  local L7_2304
  if nil == true then
    L7_2304 = false
    return L7_2304
  end
  L7_2304 = nil
  L7_2304 = A0_2297:getWidgetTypeByIndex(A1_2298)
  if L7_2304 == nil then
    return false
  end
  if A0_2297.work.widgetEnableFlag[L7_2304] == false then
    return false
  end
  if A4_2301 == nil and A0_2297.work.rootWidget[A1_2298] ~= nil then
    return false
  end
  if A0_2297:openWidgetLocal(A2_2299, A3_2300, A4_2301, A1_2298, A5_2302, ...) == false then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openInitialChildWidget"
function L2_2(A0_2305, A1_2306, A2_2307, A3_2308, A4_2309, ...)
  local L6_2311, L7_2312, L8_2313, L9_2314, L10_2315, L11_2316, L12_2317, L13_2318
  if nil == true then
    return
  end
  L7_2312 = A0_2305
  L6_2311 = A0_2305.createWidget
  L8_2313 = A2_2307
  L9_2314 = A3_2308
  L10_2315 = A2_2307
  L11_2316 = A1_2306
  L12_2317 = A4_2309
  L13_2318 = ...
  L6_2311(L7_2312, L8_2313, L9_2314, L10_2315, L11_2316, L12_2317, L13_2318)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeWidgetRecursive"
function L2_2(A0_2319, A1_2320)
  local L2_2321, L3_2322, L4_2323, L5_2324, L6_2325, L7_2326, L8_2327, L9_2328
  if A1_2320 == nil then
    L2_2321 = false
    return L2_2321
  end
  L3_2322 = A1_2320
  L2_2321 = A1_2320._countChildWidgets
  L2_2321 = L2_2321(L3_2322)
  L3_2322 = false
  L4_2323 = {}
  for L8_2327 = 1, L2_2321 do
    L9_2328 = A1_2320._getChildWidget
    L9_2328 = L9_2328(A1_2320, L8_2327)
    L4_2323[L8_2327] = L9_2328
  end
  for L8_2327 = 1, L2_2321 do
    L9_2328 = L4_2323[L8_2327]
    if A0_2319:closeWidgetRecursive(L9_2328) == true then
      L3_2322 = true
    end
  end
  if L5_2324 ~= nil then
    if L6_2325 == false then
      L8_2327 = nil
      L6_2325(L7_2326, L8_2327)
    end
  end
  if L5_2324 ~= nil and L5_2324 == A1_2320 then
    L3_2322 = true
  end
  if L6_2325 == true then
    L8_2327 = A1_2320
    L7_2326(L8_2327)
  end
  return L3_2322
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeWidgetLocal"
function L2_2(A0_2329, A1_2330)
  if A0_2329:closeWidgetRecursive(A1_2330) == true and A0_2329:getThreadOwnerWidget() ~= nil then
    A0_2329:setThreadOwnerWidget(nil)
    A0_2329:getThreadOwnerWidget():close()
  else
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeWidget"
function L2_2(A0_2331, A1_2332, A2_2333)
  local L3_2334
  if nil == true then
    L3_2334 = false
    return L3_2334
  end
  L3_2334 = A0_2331.getWidget
  L3_2334 = L3_2334(A0_2331, A1_2332, A2_2333)
  if L3_2334 == nil then
    return false
  end
  return A0_2331:closeWidgetDirect(L3_2334)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeWidgetDirect"
function L2_2(A0_2335, A1_2336)
  if nil == true then
    return false
  end
  if A1_2336 == nil then
    return false
  end
  if A1_2336:_isAlive() == false then
    return false
  end
  A0_2335:closeWidgetLocal(A1_2336)
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getWidgetByName"
function L2_2(A0_2337, A1_2338, A2_2339)
  local L3_2340, L4_2341, L5_2342, L6_2343, L7_2344, L8_2345, L9_2346
  if A1_2338 == nil then
    L3_2340 = nil
    return L3_2340
  end
  L4_2341 = A1_2338
  L3_2340 = A1_2338._isAlive
  L3_2340 = L3_2340(L4_2341)
  if L3_2340 == false then
    L3_2340 = nil
    return L3_2340
  end
  if A2_2339 == nil then
    return A1_2338
  end
  L4_2341 = A1_2338
  L3_2340 = A1_2338.getWindowName
  L3_2340 = L3_2340(L4_2341)
  if L3_2340 == A2_2339 then
    return A1_2338
  end
  L4_2341 = A1_2338
  L3_2340 = A1_2338._countChildWidgets
  L3_2340 = L3_2340(L4_2341)
  L4_2341, L5_2342 = nil, nil
  for L9_2346 = 1, L3_2340 do
    L4_2341 = A1_2338:_getChildWidget(L9_2346)
    L5_2342 = A0_2337:getWidgetByName(L4_2341, A2_2339)
    if L5_2342 ~= nil then
      return L5_2342
    end
  end
  return L6_2343
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getWidget"
function L2_2(A0_2347, A1_2348, A2_2349)
  local L3_2350
  if nil == true then
    L3_2350 = nil
    return L3_2350
  end
  L3_2350 = A0_2347.work
  L3_2350 = L3_2350.rootWidget
  L3_2350 = L3_2350[A1_2348]
  if L3_2350 ~= nil and L3_2350:_isAlive() == false then
    A0_2347.work.rootWidget[A1_2348] = nil
    return nil
  end
  return A0_2347:getWidgetByName(L3_2350, A2_2349)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isWidgetExec"
function L2_2(A0_2351, A1_2352)
  local L2_2353
  L2_2353 = A0_2351.work
  L2_2353 = L2_2353.rootWidget
  L2_2353 = L2_2353[A1_2352]
  if L2_2353 ~= nil then
    L2_2353 = true
    return L2_2353
  end
  L2_2353 = false
  return L2_2353
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "processWidgetCreated"
function L2_2(A0_2354, A1_2355, A2_2356, A3_2357, A4_2358, A5_2359, A6_2360, ...)
  local L8_2362, L9_2363, L10_2364, L11_2365, L12_2366, L13_2367
  if A2_2356 == true then
    L9_2363 = A1_2355
    L8_2362 = A1_2355._getParentWidget
    L8_2362 = L8_2362(L9_2363)
    if L8_2362 ~= A0_2354 then
      L9_2363 = L8_2362.setInputEnable
      L9_2363(L10_2364, L11_2365)
    end
  end
  L9_2363 = A1_2355
  L8_2362 = A1_2355.isCreateCancel
  L8_2362 = L8_2362(L9_2363)
  if L8_2362 == true then
    L9_2363 = A0_2354
    L8_2362 = A0_2354.closeWidgetDirect
    L8_2362(L9_2363, L10_2364)
    return
  end
  if not A2_2356 then
    return
  end
  L8_2362 = A0_2354.work
  L8_2362 = L8_2362.rootWidget
  L8_2362 = L8_2362[A5_2359]
  if L8_2362 == nil then
    L8_2362 = A0_2354.work
    L8_2362 = L8_2362.rootWidget
    L8_2362[A5_2359] = A1_2355
  end
  L8_2362 = A0_2354.work
  L8_2362 = L8_2362.widgetEnableFlag
  L9_2363 = A1_2355.getWidgetType
  L9_2363 = L9_2363(L10_2364)
  L8_2362 = L8_2362[L9_2363]
  if L8_2362 == false then
    return
  end
  L9_2363 = A1_2355
  L8_2362 = A1_2355.getVisibleFlag
  L8_2362 = L8_2362(L9_2363)
  if L8_2362 == false then
    return
  end
  L9_2363 = A1_2355
  L8_2362 = A1_2355._countChildWidgets
  L8_2362 = L8_2362(L9_2363)
  L9_2363 = nil
  for L13_2367 = 1, L8_2362 do
    L9_2363 = A1_2355:_getChildWidget(L13_2367)
    if L9_2363:getVisibleFlag() == true then
      L9_2363:show()
    end
  end
  L10_2364(L11_2365)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "processWidgetCreateAborted"
function L2_2(A0_2368)
  local L1_2369, L2_2370, L3_2371, L4_2372
  for L4_2372 = 1, 17 do
    if A0_2368.work.rootWidget[L4_2372] ~= nil and A0_2368.work.rootWidget[L4_2372]:_isAlive() == false then
      A0_2368.work.rootWidget[L4_2372] = nil
    end
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "processWidgetDeleted"
function L2_2(A0_2373, A1_2374)
  if A0_2373.work.rootWidget[A1_2374:getWidgetIndex()] ~= nil then
    if A0_2373.work.rootWidget[A1_2374:getWidgetIndex()]:_isAlive() == true then
      if A0_2373.work.rootWidget[A1_2374:getWidgetIndex()] == A1_2374 then
        A0_2373.work.rootWidget[A1_2374:getWidgetIndex()] = nil
      end
    else
      A0_2373.work.rootWidget[A1_2374:getWidgetIndex()] = nil
    end
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openRootWidget"
function L2_2(A0_2375, A1_2376, A2_2377, A3_2378, A4_2379, ...)
  if nil == true then
    return false
  end
  if A0_2375:isWidgetExec(A1_2376) == true then
    return false
  end
  return A0_2375:openWidget(A1_2376, A2_2377, nil, A3_2378, A4_2379, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openChildWidget"
function L2_2(A0_2381, A1_2382, A2_2383, A3_2384, ...)
  local L5_2386
  L5_2386 = A2_2383.getWidgetIndex
  L5_2386 = L5_2386(A2_2383)
  return A0_2381:openWidget(L5_2386, A1_2382, nil, A2_2383, A3_2384, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeChildWidget"
function L2_2(A0_2387, A1_2388, A2_2389)
  local L3_2390
  L3_2390 = A2_2389.getWidgetIndex
  L3_2390 = L3_2390(A2_2389)
  return A0_2387:closeWidget(L3_2390, A1_2388)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openMainMenuRootWidget"
function L2_2(A0_2391, A1_2392, A2_2393, ...)
  if A0_2391:getStaticWidget(17):isShow() == true then
    return false
  end
  return A0_2391:openRootWidget(3, A1_2392, A2_2393, true, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectWidgetYield"
function L2_2(A0_2395, A1_2396, A2_2397)
  local L3_2398, L4_2399, L5_2400, L6_2401, L7_2402
  if nil == true then
    L3_2398 = false
    return L3_2398
  end
  if A2_2397 == true then
    L3_2398 = A1_2396._countChildWidgets
    L3_2398 = L3_2398(L4_2399)
    for L7_2402 = 1, L3_2398 do
      if A1_2396:_getChildWidget(L7_2402):getVisibleFlag() == true then
        A1_2396:_getChildWidget(L7_2402):show()
      end
    end
    L4_2399(L5_2400)
  end
  L3_2398 = A0_2395.selectWidgetTimerYield
  L3_2398 = L3_2398(L4_2399, L5_2400, L6_2401)
  return L3_2398
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectWidgetTimerYield"
function L2_2(A0_2403, A1_2404, A2_2405)
  local L3_2406, L4_2407
  if nil == true then
    L3_2406 = false
    L4_2407 = false
    return L3_2406, L4_2407
  end
  L3_2406 = false
  L4_2407 = false
  while true do
    if A1_2404 == nil or A1_2404:_isAlive() == false then
      break
    end
    if A1_2404:processWaitCallFunction() == true then
      L3_2406 = true
      break
    end
    if A2_2405 ~= nil then
      A1_2404:processWaitTimerFunction(A2_2405)
      if A2_2405 <= 0 then
        L3_2406 = true
        L4_2407 = true
        break
      else
        A2_2405 = A2_2405 - 0.1
        if A2_2405 < 0 then
          A2_2405 = 0
        end
      end
    end
    A0_2403:_wait(0.1)
  end
  return L3_2406, L4_2407
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askEventModeWidgetYield"
function L2_2(A0_2408, A1_2409, A2_2410, ...)
  local L4_2412, L5_2413, L6_2414, L7_2415, L8_2416, L9_2417
  L5_2413 = A0_2408
  L4_2412 = A0_2408.askWidgetYield
  L6_2414 = 4
  L7_2415 = A1_2409
  L8_2416 = A2_2410
  L9_2417 = ...
  return L4_2412(L5_2413, L6_2414, L7_2415, L8_2416, L9_2417)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askWidgetYield"
function L2_2(A0_2418, A1_2419, A2_2420, A3_2421, ...)
  local L5_2423, L6_2424, L7_2425
  L5_2423 = false
  L6_2424 = {}
  L7_2425 = A0_2418.openWidgetYield
  L7_2425 = L7_2425(A0_2418, A1_2419, A2_2420, nil, nil, false, ...)
  if L7_2425 ~= nil then
    if A0_2418:selectWidgetYield(L7_2425, true) == true then
      L6_2424 = {
        L7_2425:getAskResult()
      }
      L5_2423 = true
    end
    A0_2418:closeWidgetDirect(L7_2425)
  end
  if L5_2423 == false then
    return false
  end
  return true, unpack(L6_2424, 1, A3_2421)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "askEventModeWidgetYield2"
function L2_2(A0_2426, A1_2427, A2_2428, ...)
  local L4_2430, L5_2431, L6_2432
  L4_2430 = false
  L5_2431 = {}
  L6_2432 = A0_2426.openWidgetYield
  L6_2432 = L6_2432(A0_2426, 4, A1_2427, nil, nil, false, ...)
  if L6_2432 ~= nil then
    if A0_2426:selectWidgetYield(L6_2432, true) == true then
      L5_2431 = {
        L6_2432:getAskResult()
      }
      L4_2430 = true
    end
    A0_2426:closeWidgetDirect(L6_2432)
  end
  if L4_2430 == false then
    return
  end
  return unpack(L5_2431, 1, A2_2428)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openWidgetYield"
function L2_2(A0_2433, A1_2434, A2_2435, A3_2436, A4_2437, A5_2438, ...)
  local L7_2440, L8_2441, L9_2442
  if A4_2437 == nil then
    L8_2441 = A0_2433
    L7_2440 = A0_2433.isWidgetExec
    L9_2442 = A1_2434
    L7_2440 = L7_2440(L8_2441, L9_2442)
    if L7_2440 == true then
      L7_2440 = nil
      return L7_2440
    end
    A4_2437 = A0_2433
  end
  L7_2440 = nil
  L9_2442 = A0_2433
  L8_2441 = A0_2433.getWidgetTypeByIndex
  L8_2441 = L8_2441(L9_2442, A1_2434)
  L9_2442 = A2_2435
  if A3_2436 ~= nil then
    L9_2442 = A3_2436
  end
  while true do
    if A0_2433:openWidget(A1_2434, A2_2435, A3_2436, A4_2437, A5_2438, ...) == true then
      A0_2433:waitWidgetCreateYield(A1_2434)
      L7_2440 = A0_2433:getWidget(A1_2434, L9_2442)
      if L7_2440 == nil then
      end
      break
    end
    if A0_2433.work.widgetEnableFlag[L8_2441] == false then
      break
    end
    A0_2433:_wait(0.1)
  end
  return L7_2440
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "waitWidgetCreateYield"
function L2_2(A0_2443, A1_2444)
  local L2_2445
  while true do
    if not A0_2443:isCreateWidgetCommandPlaying() then
      break
    end
    A0_2443:_wait(0.1)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openContentsWidget"
function L2_2(A0_2446, A1_2447, A2_2448, A3_2449, A4_2450, ...)
  local L6_2452
  if nil == true then
    L6_2452 = false
    return L6_2452
  end
  L6_2452 = A0_2446.checkActor
  L6_2452 = L6_2452(A0_2446, A3_2449)
  if L6_2452 == nil then
    L6_2452 = false
    return L6_2452
  end
  L6_2452 = A0_2446.work
  L6_2452 = L6_2452.widgetOwner
  L6_2452 = L6_2452[A1_2447]
  if L6_2452 ~= nil then
    L6_2452 = A0_2446.work
    L6_2452 = L6_2452.widgetOwner
    L6_2452 = L6_2452[A1_2447]
    if L6_2452 ~= A3_2449 then
      L6_2452 = false
      return L6_2452
    end
    L6_2452 = A0_2446.work
    L6_2452 = L6_2452.contentsType
    L6_2452 = L6_2452[A1_2447]
    if L6_2452 ~= A2_2448 then
      L6_2452 = false
      return L6_2452
    end
  end
  L6_2452 = A0_2446.getContentsWidgetIndex
  L6_2452 = L6_2452(A0_2446, A1_2447)
  if A0_2446:openWidget(L6_2452, A4_2450, nil, nil, true, ...) == false then
    return false
  end
  if A0_2446.work.widgetOwner[A1_2447] == nil then
    A0_2446.work.widgetOwner[A1_2447] = A3_2449
    A0_2446.work.contentsType[A1_2447] = A2_2448
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeContentsWidget"
function L2_2(A0_2453, A1_2454, A2_2455, A3_2456)
  local L4_2457
  if nil == true then
    L4_2457 = false
    return L4_2457
  end
  L4_2457 = A0_2453.isValidContentsOwner
  L4_2457 = L4_2457(A0_2453, A1_2454, A2_2455)
  if L4_2457 == false then
    L4_2457 = false
    return L4_2457
  end
  L4_2457 = A0_2453.work
  L4_2457 = L4_2457.widgetOwner
  L4_2457[A1_2454] = nil
  L4_2457 = A0_2453.work
  L4_2457 = L4_2457.contentsType
  L4_2457[A1_2454] = 0
  L4_2457 = A0_2453.getContentsWidgetIndex
  L4_2457 = L4_2457(A0_2453, A1_2454)
  if A0_2453:closeWidget(L4_2457, A3_2456) == false then
  end
  return (A0_2453:closeWidget(L4_2457, A3_2456))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getContentsWidgetIndex"
function L2_2(A0_2458, A1_2459)
  local L2_2460
  L2_2460 = A1_2459 + 6
  L2_2460 = L2_2460 - 1
  return L2_2460
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getContentsWidget"
function L2_2(A0_2461, A1_2462, A2_2463, A3_2464)
  local L4_2465
  L4_2465 = A0_2461.isValidContentsOwner
  L4_2465 = L4_2465(A0_2461, A1_2462, A2_2463)
  if L4_2465 == false then
    L4_2465 = nil
    return L4_2465
  end
  L4_2465 = A0_2461.getContentsWidgetIndex
  L4_2465 = L4_2465(A0_2461, A1_2462)
  return A0_2461:getWidget(L4_2465, A3_2464)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isValidContentsOwner"
function L2_2(A0_2466, A1_2467, A2_2468)
  local L3_2469
  if A2_2468 == nil then
    L3_2469 = false
    return L3_2469
  end
  L3_2469 = A0_2466.work
  L3_2469 = L3_2469.widgetOwner
  L3_2469 = L3_2469[A1_2467]
  if L3_2469 == nil then
    return false
  end
  if L3_2469:_isAlive() == false then
    A0_2466.work.widgetOwner[A1_2467] = nil
    return false
  end
  if L3_2469 ~= A2_2468 then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openEventModeWidgetYield"
function L2_2(A0_2470, A1_2471, ...)
  local L4_2473, L5_2474, L6_2475, L7_2476, L8_2477, L9_2478, L10_2479
  L5_2474 = A0_2470
  L4_2473 = A0_2470.openWidgetYield
  L6_2475 = 4
  L7_2476 = A1_2471
  L8_2477, L9_2478 = nil, nil
  L10_2479 = false
  L4_2473 = L4_2473(L5_2474, L6_2475, L7_2476, L8_2477, L9_2478, L10_2479, ...)
  if L4_2473 == nil then
    L5_2474 = false
    return L5_2474
  end
  L5_2474 = true
  return L5_2474
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openEventModeChildWidgetYield"
function L2_2(A0_2480, A1_2481, A2_2482, ...)
  local L4_2484, L5_2485, L6_2486, L7_2487, L8_2488, L9_2489, L10_2490, L11_2491
  if A2_2482 == nil then
    L4_2484 = A0_2480.work
    L4_2484 = L4_2484.rootWidget
    A2_2482 = L4_2484[4]
  end
  L5_2485 = A0_2480
  L4_2484 = A0_2480.openWidgetYield
  L6_2486 = 4
  L7_2487 = A1_2481
  L8_2488 = nil
  L9_2489 = A2_2482
  L10_2490 = false
  L11_2491 = ...
  L4_2484 = L4_2484(L5_2485, L6_2486, L7_2487, L8_2488, L9_2489, L10_2490, L11_2491)
  if L4_2484 == nil then
    L5_2485 = false
    return L5_2485
  end
  L5_2485 = true
  return L5_2485
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "closeEventModeWidget"
function L2_2(A0_2492, A1_2493)
  return A0_2492:closeWidget(4, A1_2493)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectEventModeWidgetYield"
function L2_2(A0_2494, A1_2495, ...)
  local L3_2497, L4_2498
  L3_2497 = false
  L4_2498 = A0_2494.initEventModeWidget
  L4_2498 = L4_2498(A0_2494, A1_2495, ...)
  if L4_2498 ~= nil then
    L3_2497 = A0_2494:selectWidgetYield(L4_2498)
  end
  if L3_2497 == false then
    return false
  end
  return true, L4_2498:getAskResult()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "selectEventModeWidgetTimerYield"
function L2_2(A0_2499, A1_2500, A2_2501, ...)
  local L4_2503, L5_2504, L6_2505
  L4_2503 = false
  L5_2504 = false
  L6_2505 = A0_2499.initEventModeWidget
  L6_2505 = L6_2505(A0_2499, A1_2500, ...)
  if L6_2505 ~= nil then
    L4_2503, L5_2504 = A0_2499:selectWidgetTimerYield(L6_2505, A2_2501)
  end
  if L4_2503 == false then
    return false
  end
  if L5_2504 == true then
    return true, false
  end
  return true, true, L6_2505:getAskResult()
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "initEventModeWidget"
function L2_2(A0_2506, A1_2507, ...)
  if A0_2506:getWidget(4, A1_2507) ~= nil then
    A0_2506:getWidget(4, A1_2507):resetBaseAskResult()
    A0_2506:getWidget(4, A1_2507):setAskParameter(...)
    A0_2506:getWidget(4, A1_2507):show(true, true)
  end
  return (A0_2506:getWidget(4, A1_2507))
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "updateEventModeWidget"
function L2_2(A0_2509, A1_2510, ...)
  local L3_2512
  L3_2512 = false
  if A0_2509:getWidget(4, A1_2510) ~= nil then
    A0_2509:getWidget(4, A1_2510):updateAskParameter(...)
    L3_2512 = true
  end
  return L3_2512
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getMainMenuModeWidget"
function L2_2(A0_2513, A1_2514)
  return A0_2513:getWidget(3, A1_2514)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getEventModeWidget"
function L2_2(A0_2515, A1_2516)
  return A0_2515:getWidget(4, A1_2516)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "openCommandFailedWidget"
function L2_2(A0_2517, A1_2518, A2_2519)
  A0_2517:getStaticWidget(17):request(A1_2518, A2_2519)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isChinese"
function L2_2(A0_2520)
  if _getLanguage() == 4 or _getLanguage() == 5 then
    return true
  end
  return false
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "createWidget2"
function L2_2(A0_2521, A1_2522, A2_2523, A3_2524, ...)
  local L5_2526, L6_2527, L7_2528
  L6_2527 = A0_2521
  L5_2526 = A0_2521._isExistWidgetInWidgetContainer
  L7_2528 = A1_2522
  L5_2526 = L5_2526(L6_2527, L7_2528)
  if L5_2526 == true then
    return
  end
  L6_2527 = A0_2521
  L5_2526 = A0_2521.getCreateParameter
  L7_2528 = A1_2522
  L7_2528 = L5_2526(L6_2527, L7_2528)
  if A2_2523 == nil then
    A2_2523 = A0_2521
  end
  A0_2521:_createWidgetInWidgetContainer(A1_2522, L5_2526, A2_2523, L6_2527, L7_2528, A3_2524, ...)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getCreateParameter"
function L2_2(A0_2529, A1_2530)
  local L2_2531, L3_2532, L4_2533, L5_2534, L6_2535, L7_2536
  L5_2534 = A1_2530
  if L5_2534 == 1 then
    L2_2531 = "GuildleveExecutionWidget"
    L4_2533 = 6
    break
  else
  end
  if L5_2534 == 2 then
    L2_2531 = "EquipWidget"
    L4_2533 = 3
    break
  else
  end
  do return end
  if L3_2532 == nil then
    L3_2532 = L2_2531
  end
  L5_2534 = L2_2531
  L6_2535 = L3_2532
  L7_2536 = L4_2533
  return L5_2534, L6_2535, L7_2536
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "deleteWidget2"
function L2_2(A0_2537, A1_2538)
  local L2_2539
  L2_2539 = A0_2537._isExistWidgetInWidgetContainer
  L2_2539 = L2_2539(A0_2537, A1_2538)
  if L2_2539 == false then
    return
  end
  L2_2539 = A0_2537._isCreatingWidgetInWidgetContainer
  L2_2539 = L2_2539(A0_2537, A1_2538)
  if L2_2539 == true then
    L2_2539 = A0_2537._deleteCreatingWidgetInWidgetContainer
    L2_2539(A0_2537, A1_2538)
  else
    L2_2539 = A0_2537._getWidgetFromWidgetContainer
    L2_2539 = L2_2539(A0_2537, A1_2538)
    A0_2537:closeWidgetDirect(L2_2539)
  end
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "getWidget2"
function L2_2(A0_2540, A1_2541)
  if A0_2540:isValidWidget(A1_2541) == false then
    return nil
  end
  return A0_2540:_getWidgetFromWidgetContainer(A1_2541)
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "isValidWidget"
function L2_2(A0_2542, A1_2543)
  if A0_2542:_isExistWidgetInWidgetContainer(A1_2543) == false then
    return false
  end
  if A0_2542:_isCreatingWidgetInWidgetContainer(A1_2543) == true then
    return false
  end
  return true
end
L0_0[L1_1] = L2_2
L0_0 = DesktopWidget
L1_1 = "setDebugTipsDisplay"
function L2_2(A0_2544, A1_2545)
end
L0_0[L1_1] = L2_2
