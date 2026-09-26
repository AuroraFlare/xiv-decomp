require("/Widget/WidgetBaseClass")
_defineClass("LinkshellMenuSubWidget", "WidgetBaseClass")
function LinkshellMenuSubWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5, L6_6, L7_7, L8_8
  L5_5 = A0_0.work
  L6_6 = {
    L7_7,
    L8_8,
    {"memberID", "integer16"},
    {"isLogin", "boolean"}
  }
  L7_7 = {L8_8, "integer8"}
  L8_8 = "askType"
  L8_8 = {"rank", "integer8"}
  L5_5._temp = L6_6
  L6_6 = A0_0
  L5_5 = A0_0.setCancelCondition
  L5_5(L6_6)
  L6_6 = A0_0
  L5_5 = A0_0.setCloseCondition
  L5_5(L6_6)
  L6_6 = A0_0
  L5_5 = A0_0.setConfirmCondition
  L7_7 = "Button_6"
  L5_5(L6_6, L7_7)
  L6_6 = A0_0
  L5_5 = A0_0.setVisibility
  L7_7 = "Button_3"
  L8_8 = false
  L5_5(L6_6, L7_7, L8_8)
  L5_5 = false
  L6_6 = false
  L7_7 = A1_1
  if L7_7 == 10 then
    L5_5 = true
    L6_6 = true
    break
  else
  end
  if L7_7 == 7 and A3_3 == 4 then
    L6_6 = true
    do break end
    break
  else
  end
  L8_8 = A0_0
  L7_7 = A0_0.setConfirmCondition
  L7_7(L8_8, "Button_1")
  L8_8 = A0_0
  L7_7 = A0_0.setButton
  L7_7(L8_8, "Button_1", A4_4)
  if L5_5 == true then
    L7_7, L8_8 = nil, nil
    if A3_3 == 7 then
      L7_7 = 1218
      L8_8 = 79223
    else
      L7_7 = 1217
      L8_8 = 79222
    end
    A0_0:setContent("Button_4", L7_7, 100007)
    A0_0:setHelpParameter("Button_4", 1, L8_8)
  else
    L8_8 = A0_0
    L7_7 = A0_0.setContent
    L7_7(L8_8, "Button_4")
  end
  L8_8 = A0_0
  L7_7 = A0_0.setButton
  L7_7(L8_8, "Button_4", L5_5 and A4_4)
  L8_8 = A0_0
  L7_7 = A0_0.setButton
  L7_7(L8_8, "Button_5", L6_6 and A4_4)
  L8_8 = A0_0
  L7_7 = A0_0.setButton
  L7_7(L8_8, "Button_2", A4_4)
  L8_8 = A0_0
  L7_7 = A0_0.setModal
  L7_7(L8_8, true)
  L7_7 = A0_0.work
  L7_7.memberID = A2_2
  L7_7 = A0_0.work
  L7_7.rank = A3_3
  L7_7 = A0_0.work
  L7_7.isLogin = A4_4
end
function LinkshellMenuSubWidget.setButton(A0_9, A1_10, A2_11)
  if A2_11 == true then
    A0_9:setConfirmCondition(A1_10)
  else
    A0_9:setVisibility(A1_10, false)
  end
end
function LinkshellMenuSubWidget.processUICommandCancel(A0_12, A1_13, A2_14, A3_15, A4_16)
  A0_12:setParentBorder()
end
function LinkshellMenuSubWidget.processUICommandOperate(A0_17, A1_18, A2_19, A3_20, A4_21)
  local L5_22, L6_23
  L5_22 = A2_19
  if L5_22 == "Button_1" then
    L6_23 = desktopWidget
    L6_23 = L6_23.getCurrnetLinkshellMemberName
    L6_23 = L6_23(L6_23, A0_17.work.memberID)
    if L6_23 == nil then
      return
    end
    desktopWidget:setTellAddress(L6_23)
    break
  else
  end
  if L5_22 == "Button_2" then
    L6_23 = A0_17.openCommonDialogWidget
    L6_23(A0_17, 3)
    break
  else
  end
  if L5_22 == "Button_4" then
    L6_23 = A0_17.openCommonDialogWidget
    L6_23(A0_17, 1)
    break
  else
  end
  if L5_22 == "Button_5" then
    L6_23 = A0_17.openCommonDialogWidget
    L6_23(A0_17, 2)
    break
  else
  end
  if L5_22 == "Button_6" then
    L6_23 = A0_17.setParentBorder
    L6_23(A0_17)
    do break end
    break
  else
  end
end
function LinkshellMenuSubWidget.processBeforeShow(A0_24, A1_25)
  local L2_26, L3_27, L4_28
  if A1_25 ~= true then
    L3_27 = A0_24
    L2_26 = A0_24.setEnable
    L4_28 = "Button_2"
    L2_26(L3_27, L4_28, A0_24:isPartyEnable())
  end
  L2_26 = true
  return L2_26
end
function LinkshellMenuSubWidget.openCommonDialogWidget(A0_29, A1_30)
  local L2_31, L3_32, L4_33
  L2_31 = desktopWidget
  L3_32 = L2_31
  L2_31 = L2_31.getCurrnetLinkshellMemberName
  L4_33 = A0_29.work
  L4_33 = L4_33.memberID
  L2_31 = L2_31(L3_32, L4_33)
  if L2_31 == nil then
    return
  end
  L3_32 = nil
  L4_33 = 2
  if A1_30 == 1 then
    if A0_29.work.rank == 7 then
      L3_32 = 1259
    else
      L3_32 = 1258
    end
    L3_32 = A0_29:packTextParameter(L3_32, L2_31, 100007)
    break
  else
  end
  if A1_30 == 2 then
    L3_32 = A0_29:packTextParameter(1260, L2_31)
    break
  else
  end
  if A1_30 == 3 then
    L3_32 = A0_29:packTextParameter(3725, L2_31)
    L4_33 = 3
    break
  else
  end
  do return end
  A0_29.work.askType = A1_30
  desktopWidget:openChildWidget("CommonDialogWidget", A0_29, true, nil, L3_32, L4_33, 2)
end
function LinkshellMenuSubWidget.processAskResult(A0_34, A1_35)
  local L2_36, L3_37
  if A1_35 ~= 1 then
    return
  end
  L2_36 = A0_34.work
  L2_36 = L2_36.askType
  if L2_36 == 1 then
    L3_37 = nil
    if A0_34.work.rank == 7 then
      L3_37 = 4
    else
      L3_37 = 7
    end
    desktopWidget:executePlayerLinkshellAppoint(nil, A0_34.work.memberID, L3_37)
    break
  else
  end
  if L2_36 == 2 then
    L3_37 = desktopWidget
    L3_37 = L3_37.isValidCurrnetLinkshell
    L3_37 = L3_37(L3_37)
    if L3_37 == true then
      L3_37 = desktopWidget
      L3_37 = L3_37.executePlayerLinkshellKick
      L3_37(L3_37, nil, A0_34.work.memberID)
      do break end
      do break end
      else
      end
      if L2_36 == 3 then
        L3_37 = A0_34.isPartyEnable
        L3_37 = L3_37(A0_34)
        if L3_37 == true then
          L3_37 = desktopWidget
          L3_37 = L3_37.getCurrnetLinkshellMemberName
          L3_37 = L3_37(L3_37, A0_34.work.memberID)
          if L3_37 == nil then
            return false
          end
          if desktopWidget:executePlayerPartyInviteByName(L3_37) == true then
            do break end
            return
          end
        end
      else
      end
    end
  L3_37 = A0_34
  L2_36 = A0_34.setParentBorder
  L2_36(L3_37)
end
function LinkshellMenuSubWidget.setParentBorder(A0_38)
  if A0_38:_getParentWidget() ~= nil then
    A0_38:_getParentWidget():setBorder(-1)
  end
  desktopWidget:closeWidgetDirect(A0_38)
end
function LinkshellMenuSubWidget.isPartyEnable(A0_39)
  local L1_40
  L1_40 = A0_39.work
  L1_40 = L1_40.isLogin
  if L1_40 == false then
    L1_40 = false
    return L1_40
  end
  L1_40 = desktopWidget
  L1_40 = L1_40.getCurrnetLinkshellMemberName
  L1_40 = L1_40(L1_40, A0_39.work.memberID)
  if L1_40 == nil then
    return false
  end
  if A0_39:isPartyMember(L1_40) == true then
    return false
  end
  if worldMaster:_getMyPlayer():isRestrictedByContents(1) == true then
    return false
  end
  if desktopWidget:getPlayerConfirmGroupCommandVariation() == 10001 or desktopWidget:getPlayerConfirmGroupCommandVariation() == 10002 then
    return false
  elseif 1 >= desktopWidget:countPartyMember() then
    return true
  elseif desktopWidget:isMyPartyLeaderForMyPlayer() == false then
    return false
  elseif desktopWidget:countPartyMember() == 8 then
    return false
  else
    return true
  end
end
function LinkshellMenuSubWidget.isPartyMember(A0_41, A1_42)
  local L2_43, L3_44, L4_45, L5_46, L6_47
  L2_43 = desktopWidget
  L2_43 = L2_43.countPartyMember
  L2_43 = L2_43(L3_44)
  for L6_47 = 1, L2_43 do
    if desktopWidget:getPartyMemberDisplayName(L6_47) == A1_42 then
      return true
    end
  end
  return L3_44
end
function LinkshellMenuSubWidget.updateVariation(A0_48)
  local L1_49, L2_50, L3_51
  L2_50 = A0_48
  L1_49 = A0_48.setEnable
  L3_51 = "Button_2"
  L1_49(L2_50, L3_51, A0_48:isPartyEnable())
end
