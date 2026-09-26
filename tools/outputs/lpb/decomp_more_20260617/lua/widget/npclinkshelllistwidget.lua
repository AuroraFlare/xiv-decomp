require("/Widget/WidgetBaseClass")
_defineClass("NpcLinkshellListWidget", "WidgetBaseClass")
function NpcLinkshellListWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5)
  local L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L6_6 = A0_0.work
  L7_7 = {L8_8}
  L6_6._temp = L7_7
  L7_7 = A0_0
  L6_6 = A0_0.setCancelCondition
  L6_6(L7_7)
  L7_7 = A0_0
  L6_6 = A0_0.setCloseCondition
  L6_6(L7_7)
  L7_7 = A0_0
  L6_6 = A0_0.setControlCommandCondition
  L6_6(L7_7, L8_8, L9_9)
  L7_7 = A0_0
  L6_6 = A0_0.setControlCommandCondition
  L6_6(L7_7, L8_8, L9_9)
  L7_7 = A0_0
  L6_6 = A0_0.setControlCommandCondition
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = worldMaster
  L7_7 = L6_6
  L6_6 = L6_6._getMyPlayer
  L6_6 = L6_6(L7_7)
  L7_7 = L6_6.getNpcLinkshellChatLinkshellLength
  L7_7 = L7_7(L8_8)
  L8_8.buttonNum = 0
  for L11_11 = 1, L7_7 do
    L12_12 = L6_6.hasNpcLinkshell
    L12_12 = L12_12(L6_6, L11_11)
    if L12_12 == true then
      L12_12 = A0_0.work
      L12_12.buttonNum = A0_0.work.buttonNum + 1
      L12_12 = "NPC_LS_"
      L12_12 = L12_12 .. tostring(A0_0.work.buttonNum)
      A0_0:_addItem(nil, "ListBox_LinkshellList", "ControlTemplate_Button_LS", L12_12)
      A0_0:setControlProperty(L12_12, "IntData.Value0", L11_11)
      A0_0:setControlProperty(L12_12, "IsTabSTop", false)
      A0_0:setText(L12_12 .. ":TextBlock_LS_Name", 3482, L11_11)
      A0_0:setVisibility(L12_12, true)
    end
  end
  if L8_8 == 0 then
    L11_11 = false
    L8_8(L9_9, L10_10, L11_11)
    L11_11 = true
    L8_8(L9_9, L10_10, L11_11)
  else
    L11_11 = true
    L8_8(L9_9, L10_10, L11_11)
    L11_11 = false
    L8_8(L9_9, L10_10, L11_11)
  end
  L8_8(L9_9)
  L8_8(L9_9, L10_10)
  L8_8(L9_9, L10_10)
  L8_8(L9_9)
end
function NpcLinkshellListWidget.setFocus(A0_13, A1_14)
  if A1_14 ~= nil and A1_14 ~= "" then
    A0_13:setLogicalFocus(A1_14)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_13 then
      A0_13:setKeyboardFocusedControl(A1_14)
    end
  end
end
function NpcLinkshellListWidget.moveListFocus(A0_15, A1_16)
  if A0_15.work.buttonNum > 0 then
    A0_15:setFocus("ListBox_LinkshellList")
    A0_15:setControlProperty("ListBox_LinkshellList", "SqwtFocusedIndex", A1_16 - 1)
    A0_15:setSelectedIndex("ListBox_LinkshellList", A1_16 - 1)
    A0_15:setSelectedIndex("ListBox_LinkshellList", -1)
  end
end
function NpcLinkshellListWidget.processAfterShow(A0_17, A1_18)
  A0_17:moveListFocus()
  return true
end
function NpcLinkshellListWidget.processUICommandOperate(A0_19, A1_20, A2_21, A3_22, A4_23)
  local L5_24
  if A3_22 == nil then
    L5_24 = false
    return L5_24
  end
  if A3_22 == 0 then
    L5_24 = false
    return L5_24
  end
end
function NpcLinkshellListWidget.processUICommandDefault(A0_25, A1_26, A2_27, A3_28, A4_29, A5_30)
end
function NpcLinkshellListWidget.processUICommandSelectionChanged(A0_31, A1_32, A2_33, A3_34, A4_35)
  local L5_36, L6_37
  if A3_34 == nil then
    return
  end
  if A3_34 == -1 then
    return
  end
  L5_36 = "NPC_LS_"
  L6_37 = tostring
  L6_37 = L6_37(A3_34 + 1)
  L5_36 = L5_36 .. L6_37
  L6_37 = A0_31.getControlProperty
  L6_37 = L6_37(A0_31, L5_36, "IntData.Value0")
  A0_31:setFocus(L5_36)
  if desktopWidget:executePlayerNPCLinkshellChat(L6_37) == true then
    return true
  end
end
function NpcLinkshellListWidget.updateLinkshellList(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L7_45
  L1_39 = worldMaster
  L1_39 = L1_39._getMyPlayer
  L1_39 = L1_39(L2_40)
  for L5_43 = 1, L3_41.buttonNum do
    L6_44 = "NPC_LS_"
    L7_45 = tostring
    L7_45 = L7_45(L5_43)
    L6_44 = L6_44 .. L7_45
    L7_45 = A0_38.getControlProperty
    L7_45 = L7_45(A0_38, L6_44, "IntData.Value0")
    if L1_39:isNpcLinkshellChatCalling(L7_45) == true and L1_39:isNpcLinkshellChatCalling(L7_45) == true then
      A0_38:setIcon(L6_44 .. ":IconControl_LS_Perl", 291)
      A0_38:setHelpParameter(L6_44 .. ":Label_IconAnime", 1, 75804)
      A0_38:setIcon(L6_44 .. ":IconControl_LS_Perl_Anime", 291)
      A0_38:sendControlCommand(L6_44 .. ":Label_IconAnime", "UILuaCommands.IconAnimeStart")
    elseif L1_39:isNpcLinkshellChatCalling(L7_45) == true then
      A0_38:setIcon(L6_44 .. ":IconControl_LS_Perl", 292)
      A0_38:setHelpParameter(L6_44 .. ":Label_IconAnime", 1, 75803)
      A0_38:setIcon(L6_44 .. ":IconControl_LS_Perl_Anime", 292)
      A0_38:sendControlCommand(L6_44 .. ":Label_IconAnime", "UILuaCommands.IconAnimeStop")
    else
      A0_38:setIcon(L6_44 .. ":IconControl_LS_Perl", 293)
      A0_38:setHelpParameter(L6_44 .. ":Label_IconAnime", 1, 75802)
    end
  end
  return L2_40
end
function NpcLinkshellListWidget.searchFirstCall(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55
  L1_47 = worldMaster
  L2_48 = L1_47
  L1_47 = L1_47._getMyPlayer
  L1_47 = L1_47(L2_48)
  L2_48 = 0
  L3_49 = 0
  for L7_53 = 1, L5_51.buttonNum do
    L8_54 = "NPC_LS_"
    L9_55 = tostring
    L9_55 = L9_55(L7_53)
    L8_54 = L8_54 .. L9_55
    L9_55 = A0_46.getControlProperty
    L9_55 = L9_55(A0_46, L8_54, "IntData.Value0")
    if L1_47:isNpcLinkshellChatCalling(L9_55) == true and L1_47:isNpcLinkshellChatCalling(L9_55) == true then
      if L2_48 == 0 then
        L2_48 = L7_53
      end
    elseif L1_47:isNpcLinkshellChatCalling(L9_55) == true and L3_49 == 0 then
      L3_49 = L7_53
    end
  end
  if L2_48 ~= 0 then
    return L2_48
  elseif L3_49 ~= 0 then
    return L3_49
  else
    return L4_50
  end
end
