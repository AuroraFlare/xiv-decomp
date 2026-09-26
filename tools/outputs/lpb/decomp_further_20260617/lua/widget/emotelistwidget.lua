require("/Widget/WidgetBaseClass")
_defineClass("EmoteListWidget", "WidgetBaseClass")
function EmoteListWidget.init(A0_0)
  A0_0.work._temp = {
    {"updating", "boolean"}
  }
  A0_0.work.updating = false
  A0_0:setControlCommandCondition("ListBox_EmoteList", "UILuaCommands.OperateItem")
  A0_0:setConfirmCondition("Button_Marking_1")
  A0_0:setConfirmCondition("Button_Marking_2")
  A0_0:setConfirmCondition("Button_Marking_3")
  A0_0:setConfirmCondition("Button_Marking_4")
  A0_0:setConfirmCondition("Button_Marking_5")
  A0_0:setConfirmCondition("Button_Marking_6")
  A0_0:setConfirmCondition("Button_Marking_7")
  A0_0:setConfirmCondition("Button_Marking_8")
  A0_0:setConfirmCondition("Button_Marking_9")
  A0_0:setConfirmCondition("Button_Signal_1")
  A0_0:setConfirmCondition("Button_Signal_2")
  A0_0:setConfirmCondition("Button_Signal_3")
  A0_0:setVisibility("Button_Signal_4", false)
  A0_0:setConfirmCondition("Button_Signal_5")
  A0_0:setConfirmCondition("Button_Signal_6")
  A0_0:setConfirmCondition("Button_Signal_7")
  A0_0:setConfirmCondition("Button_Signal_8")
  A0_0:setConfirmCondition("Button_Signal_9")
  A0_0:setControlCommandCondition("TabControl_List", "UILuaCommands.TabPrevious")
  A0_0:setControlCommandCondition("TabControl_List", "UILuaCommands.TabNext")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  A0_0:updateEmoteList()
  A0_0:setFocusedIndex("ListBox_EmoteList", 1)
end
function EmoteListWidget.processUICommandDefault(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  local L6_7, L7_8, L8_9, L9_10, L10_11
  L6_7 = A0_1.work
  L6_7 = L6_7.updating
  if L6_7 == true then
    return
  end
  L7_8 = A0_1
  L6_7 = A0_1.getControlProperty
  L8_9 = "TabControl_List"
  L9_10 = "ItemCount"
  L6_7 = L6_7(L7_8, L8_9, L9_10)
  L8_9 = A0_1
  L7_8 = A0_1.getControlProperty
  L9_10 = "TabControl_List"
  L10_11 = "SelectedIndex"
  L7_8 = L7_8(L8_9, L9_10, L10_11)
  L8_9 = A3_4
  if L8_9 == "UILuaCommands.OperateItem" then
    L10_11 = A0_1
    L9_10 = A0_1.getListProperty
    L9_10 = L9_10(L10_11, "EmoteList", A4_5, "EmoteID")
    L10_11 = nil
    if L9_10 == -1 then
      return
    elseif L9_10 == 10001 then
    else
    end
    if L9_10 == 0 then
      L10_11 = 24312
      if L9_10 == 0 then
        L9_10 = nil
        do break end
        L10_11 = 24102
      else
      end
    else
    end
    desktopWidget:executePlayerSystemCommand(L10_11, L9_10, 1)
    desktopWidget:closeWidgetDirect(A0_1)
    break
  else
  end
end
function EmoteListWidget.executePartyTargetCommand(A0_12, A1_13)
  desktopWidget:executePartyTarget(A1_13)
end
function EmoteListWidget.processUICommandOperate(A0_14, A1_15, A2_16, A3_17, A4_18)
  local L5_19
  L5_19 = A0_14.work
  L5_19 = L5_19.updating
  if L5_19 == true then
    return
  end
  L5_19 = A2_16
  if L5_19 == "Button_Marking_1" then
    desktopWidget:executePlayerTargetMarking(1)
    break
  else
  end
  if L5_19 == "Button_Marking_2" then
    desktopWidget:executePlayerTargetMarking(2)
    break
  else
  end
  if L5_19 == "Button_Marking_3" then
    desktopWidget:executePlayerTargetMarking(3)
    break
  else
  end
  if L5_19 == "Button_Marking_4" then
    desktopWidget:executePlayerTargetMarking(4)
    break
  else
  end
  if L5_19 == "Button_Marking_5" then
    desktopWidget:executePlayerTargetMarking(5)
    break
  else
  end
  if L5_19 == "Button_Marking_6" then
    desktopWidget:executePlayerTargetMarking(6)
    break
  else
  end
  if L5_19 == "Button_Marking_7" then
    desktopWidget:executePlayerTargetMarking(7)
    break
  else
  end
  if L5_19 == "Button_Marking_8" then
    desktopWidget:executePlayerTargetMarking(8)
    break
  else
  end
  if L5_19 == "Button_Marking_9" then
    desktopWidget:executePlayerTargetMarking(nil)
    break
  else
  end
  if L5_19 == "Button_Signal_1" then
    desktopWidget:executePlayerSignal(1)
    break
  else
  end
  if L5_19 == "Button_Signal_2" then
    desktopWidget:executePlayerSignal(2)
    break
  else
  end
  if L5_19 == "Button_Signal_3" then
    desktopWidget:executePlayerSignal(3)
    break
  else
  end
  if L5_19 == "Button_Signal_5" then
    desktopWidget:executePlayerSignal(4)
    break
  else
  end
  if L5_19 == "Button_Signal_6" then
    desktopWidget:executePlayerSignal(5)
    break
  else
  end
  if L5_19 == "Button_Signal_7" then
    desktopWidget:executePlayerSignal(6)
    break
  else
  end
  if L5_19 == "Button_Signal_8" then
    desktopWidget:executePlayerSignal(7)
    break
  else
  end
  if L5_19 == "Button_Signal_9" then
    desktopWidget:executePlayerSignal(nil)
    break
  else
  end
end
function EmoteListWidget.update(A0_20)
  A0_20.work.updating = true
  if desktopWidget:isMyPlayerDead() then
    desktopWidget:closeWidgetDirect(A0_20)
    return
  end
  A0_20:updateEmoteList()
  A0_20.work.updating = false
end
function EmoteListWidget.updateEmoteList(A0_21)
  local L1_22
  L1_22 = A0_21.removeAllListData
  L1_22(A0_21)
  L1_22 = 1
  L1_22 = A0_21:addEmoteDataSeparator(L1_22, 1053)
  L1_22 = A0_21:addSpecialEventEmoteData(L1_22)
  L1_22 = A0_21:addSitEmoteData(L1_22)
  L1_22 = A0_21:addEmoteDataSeparator(L1_22, 1054)
  L1_22 = A0_21:addEmoteData(L1_22, 105)
  L1_22 = A0_21:addGroundCompanySaluteEmoteData(L1_22)
  L1_22 = A0_21:addEmoteData(L1_22, 115)
  L1_22 = A0_21:addEmoteData(L1_22, 119)
  L1_22 = A0_21:addEmoteData(L1_22, 131)
  L1_22 = A0_21:addEmoteData(L1_22, 116)
  L1_22 = A0_21:addEmoteData(L1_22, 141)
  L1_22 = A0_21:addEmoteDataSeparator(L1_22, 1055)
  L1_22 = A0_21:addEmoteData(L1_22, 149)
  L1_22 = A0_21:addEmoteData(L1_22, 106)
  L1_22 = A0_21:addEmoteData(L1_22, 129)
  L1_22 = A0_21:addEmoteData(L1_22, 123)
  L1_22 = A0_21:addEmoteData(L1_22, 125)
  L1_22 = A0_21:addEmoteData(L1_22, 124)
  L1_22 = A0_21:addEmoteData(L1_22, 155)
  L1_22 = A0_21:addEmoteData(L1_22, 130)
  L1_22 = A0_21:addEmoteData(L1_22, 139)
  L1_22 = A0_21:addEmoteData(L1_22, 143)
  L1_22 = A0_21:addEmoteData(L1_22, 142)
  L1_22 = A0_21:addEmoteDataSeparator(L1_22, 1056)
  L1_22 = A0_21:addEmoteData(L1_22, 154)
  L1_22 = A0_21:addEmoteData(L1_22, 107)
  L1_22 = A0_21:addEmoteData(L1_22, 111)
  L1_22 = A0_21:addEmoteData(L1_22, 113)
  L1_22 = A0_21:addEmoteData(L1_22, 151)
  L1_22 = A0_21:addEmoteData(L1_22, 145)
  L1_22 = A0_21:addEmoteData(L1_22, 136)
  L1_22 = A0_21:addEmoteData(L1_22, 137)
  L1_22 = A0_21:addEmoteData(L1_22, 101)
  L1_22 = A0_21:addEmoteDataSeparator(L1_22, 1057)
  L1_22 = A0_21:addEmoteData(L1_22, 108)
  L1_22 = A0_21:addEmoteData(L1_22, 144)
  L1_22 = A0_21:addEmoteData(L1_22, 122)
  L1_22 = A0_21:addEmoteData(L1_22, 127)
  L1_22 = A0_21:addEmoteData(L1_22, 128)
  L1_22 = A0_21:addEmoteDataSeparator(L1_22, 1058)
  L1_22 = A0_21:addEmoteData(L1_22, 104)
  L1_22 = A0_21:addEmoteData(L1_22, 120)
  L1_22 = A0_21:addEmoteData(L1_22, 109)
  L1_22 = A0_21:addEmoteData(L1_22, 152)
  L1_22 = A0_21:addEmoteData(L1_22, 118)
  L1_22 = A0_21:addEmoteData(L1_22, 121)
  L1_22 = A0_21:addEmoteData(L1_22, 134)
  L1_22 = A0_21:addEmoteData(L1_22, 135)
  L1_22 = A0_21:addEmoteDataSeparator(L1_22, 1059)
  L1_22 = A0_21:addEmoteData(L1_22, 102)
  L1_22 = A0_21:addEmoteData(L1_22, 110)
  L1_22 = A0_21:addEmoteData(L1_22, 153)
  L1_22 = A0_21:addEmoteData(L1_22, 112)
  L1_22 = A0_21:addEmoteData(L1_22, 114)
  L1_22 = A0_21:addEmoteData(L1_22, 103)
  L1_22 = A0_21:addEmoteData(L1_22, 117)
  L1_22 = A0_21:addEmoteData(L1_22, 126)
  L1_22 = A0_21:addEmoteData(L1_22, 132)
  L1_22 = A0_21:addEmoteData(L1_22, 133)
  L1_22 = A0_21:addEmoteData(L1_22, 138)
  L1_22 = A0_21:addEmoteData(L1_22, 140)
  A0_21:removeListData(0)
  A0_21:updateListbox()
end
function EmoteListWidget.removeAllListData(A0_23)
  A0_23:deleteListPropertyAll("EmoteList")
end
function EmoteListWidget.removeListData(A0_24, A1_25)
  A0_24:deleteListProperty("EmoteList", A1_25)
end
function EmoteListWidget.addEmoteDataSeparator(A0_26, A1_27, A2_28)
  A0_26:setListProperty("EmoteList", A1_27, "EmoteData", "Hidden")
  A0_26:setListProperty("EmoteList", A1_27, "EmoteIcon", "Hidden")
  A0_26:setListProperty("EmoteList", A1_27, "EmoteSeparator", "Visible")
  A0_26:setListProperty("EmoteList", A1_27, "EmoteID", -1)
  A0_26:setListText("EmoteList", A1_27, "EmoteSeparatorTitle", A2_28)
  return A1_27 + 1
end
function EmoteListWidget.addEmoteData(A0_29, A1_30, A2_31)
  A0_29:setListProperty("EmoteList", A1_30, "EmoteData", "Visible")
  A0_29:setListProperty("EmoteList", A1_30, "EmoteSeparator", "Hidden")
  A0_29:setListProperty("EmoteList", A1_30, "EmoteID", A2_31)
  A0_29:setListText("EmoteList", A1_30, "EmoteName", 1120, A2_31)
  A0_29:setListText("EmoteList", A1_30, "EmoteCommand", 1040, A2_31)
  if worldMaster:_getMyPlayer():isSitMode() == true then
    if A2_31 == 107 then
    elseif A2_31 == 113 then
    elseif A2_31 == 115 then
    elseif A2_31 == 117 then
    else
      if A2_31 == 120 then
        break
      else
      end
      A0_29:setListProperty("EmoteList", A1_30, "EmoteIcon", "Hidden")
      break
    end
  elseif desktopWidget:isRiding() == true then
    A0_29:setListProperty("EmoteList", A1_30, "EmoteIcon", "Hidden")
  end
  return A1_30 + 1
end
function EmoteListWidget.addSpecialEventEmoteData(A0_32, A1_33)
  local L2_34
  if worldMaster:_getSpecialEventWork(9) == 18 then
    L2_34 = 156
    break
  else
  end
  do return A1_33 end
  A0_32:setListProperty("EmoteList", A1_33, "EmoteData", "Visible")
  A0_32:setListProperty("EmoteList", A1_33, "EmoteSeparator", "Hidden")
  A0_32:setListProperty("EmoteList", A1_33, "EmoteID", L2_34)
  A0_32:setListText("EmoteList", A1_33, "EmoteName", 1120, L2_34)
  A0_32:setListText("EmoteList", A1_33, "EmoteCommand", 1040, L2_34)
  if worldMaster:_getMyPlayer():isSitMode() == true then
    A0_32:setListProperty("EmoteList", A1_33, "EmoteIcon", "Hidden")
  elseif desktopWidget:isRiding() == true then
    A0_32:setListProperty("EmoteList", A1_33, "EmoteIcon", "Hidden")
  end
  return A1_33 + 1
end
function EmoteListWidget.addGroundCompanySaluteEmoteData(A0_35, A1_36)
  local L2_37
  if worldMaster:_getMyPlayer():_getBelongGrandCompany() == 1 then
    L2_37 = 146
    break
  else
  end
  if worldMaster:_getMyPlayer():_getBelongGrandCompany() == 3 then
    L2_37 = 148
    break
  else
  end
  if worldMaster:_getMyPlayer():_getBelongGrandCompany() == 2 then
    L2_37 = 147
    break
  else
  end
  do return A1_36 end
  A0_35:setListProperty("EmoteList", A1_36, "EmoteData", "Visible")
  A0_35:setListProperty("EmoteList", A1_36, "EmoteSeparator", "Hidden")
  A0_35:setListProperty("EmoteList", A1_36, "EmoteID", L2_37)
  A0_35:setListText("EmoteList", A1_36, "EmoteName", 1120, L2_37)
  A0_35:setListText("EmoteList", A1_36, "EmoteCommand", 1040, L2_37)
  if worldMaster:_getMyPlayer():isSitMode() == true then
    A0_35:setListProperty("EmoteList", A1_36, "EmoteIcon", "Hidden")
  elseif desktopWidget:isRiding() == true then
    A0_35:setListProperty("EmoteList", A1_36, "EmoteIcon", "Hidden")
  end
  return A1_36 + 1
end
function EmoteListWidget.addSitEmoteData(A0_38, A1_39)
  A0_38:setListProperty("EmoteList", A1_39, "EmoteData", "Visible")
  A0_38:setListProperty("EmoteList", A1_39, "EmoteSeparator", "Hidden")
  if worldMaster:_getMyPlayer():isSitMode() == false then
    A0_38:setListText("EmoteList", A1_39, "EmoteName", 2125, 10001)
    A0_38:setListProperty("EmoteList", A1_39, "EmoteID", 10001)
  else
    A0_38:setListText("EmoteList", A1_39, "EmoteName", 2126)
    A0_38:setListProperty("EmoteList", A1_39, "EmoteID", 0)
  end
  if desktopWidget:isRiding() == true then
    A0_38:setListProperty("EmoteList", A1_39, "EmoteIcon", "Hidden")
  end
  A0_38:setListText("EmoteList", A1_39, "EmoteCommand", 1041, 241)
  return A1_39 + 1
end
function EmoteListWidget.updateListbox(A0_40)
  A0_40:updateListProperty("EmoteList")
end
