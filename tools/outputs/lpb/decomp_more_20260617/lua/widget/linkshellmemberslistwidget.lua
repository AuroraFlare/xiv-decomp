require("/Widget/WidgetBaseClass")
_defineClass("LinkshellMembersListWidget", "WidgetBaseClass")
function LinkshellMembersListWidget.init(A0_0)
  local L1_1
  L1_1 = A0_0.setCancelCondition
  L1_1(A0_0)
  L1_1 = A0_0.setCloseCondition
  L1_1(A0_0)
  L1_1 = A0_0.setConfirmCondition
  L1_1(A0_0, "Button_Back")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "ListBox_MembersList", "UILuaCommands.SelectionChanged")
  L1_1 = A0_0.setUICommandCondition
  L1_1(A0_0, "UILuaCommands.Shown")
  L1_1 = A0_0.setModal
  L1_1(A0_0, true)
  L1_1 = desktopWidget
  L1_1 = L1_1.isValidCurrnetLinkshell
  L1_1 = L1_1(L1_1)
  if L1_1 == true then
    L1_1 = worldMaster
    L1_1 = L1_1._getMyPlayer
    L1_1 = L1_1(L1_1)
    L1_1 = L1_1.getCommunityGroupCurrent
    L1_1 = L1_1(L1_1, 20002)
    A0_0:setTextWorldMaster("TextBlock_LinkshellName", 33626, L1_1)
    A0_0:setIcon("IconControl_Emblem", desktopWidget:getCurrnetLinkshellIconID())
  else
    L1_1 = A0_0.setVisibility
    L1_1(A0_0, "IconControl_Emblem", false)
  end
  L1_1 = A0_0.createMemberList
  L1_1(A0_0)
end
function LinkshellMembersListWidget.processUICommandOperate(A0_2, A1_3, A2_4, A3_5, A4_6)
  desktopWidget:closeWidgetDirect(A0_2)
end
function LinkshellMembersListWidget.processUICommandSelectionChanged(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20
  L5_12 = desktopWidget
  L6_13 = L5_12
  L5_12 = L5_12.isValidCurrnetLinkshell
  L5_12 = L5_12(L6_13)
  if L5_12 == false then
    return
  end
  L6_13 = A0_7
  L5_12 = A0_7.getListPropertyIndex
  L7_14 = "ListBox"
  L8_15 = A3_10
  L5_12 = L5_12(L6_13, L7_14, L8_15)
  L7_14 = A0_7
  L6_13 = A0_7.getListProperty
  L8_15 = "ListBox"
  L9_16 = L5_12
  L10_17 = "IsClient"
  L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17)
  L8_15 = A0_7
  L7_14 = A0_7.getListProperty
  L9_16 = "ListBox"
  L10_17 = L5_12
  L11_18 = "IsLogin"
  L7_14 = L7_14(L8_15, L9_16, L10_17, L11_18)
  if L7_14 == false then
    return
  end
  L9_16 = A0_7
  L8_15 = A0_7.getListProperty
  L10_17 = "ListBox"
  L11_18 = L5_12
  L12_19 = "IsPlayer"
  L8_15 = L8_15(L9_16, L10_17, L11_18, L12_19)
  if L8_15 == 1 then
    return
  end
  L9_16 = worldMaster
  L10_17 = L9_16
  L9_16 = L9_16._getMyPlayer
  L9_16 = L9_16(L10_17)
  L11_18 = L9_16
  L10_17 = L9_16.getCommunityGroupCurrent
  L12_19 = 20002
  L10_17 = L10_17(L11_18, L12_19)
  L12_19 = L10_17
  L11_18 = L10_17.getMemberRank
  L13_20 = L9_16
  L11_18 = L11_18(L12_19, L13_20)
  L13_20 = A0_7
  L12_19 = A0_7.getListProperty
  L12_19 = L12_19(L13_20, "ListBox", L5_12, "MemberRank")
  L13_20 = A0_7.getListProperty
  L13_20 = L13_20(A0_7, "ListBox", L5_12, "MemberID")
  if desktopWidget:openChildWidget("LinkshellMenuSubWidget", A0_7, true, L11_18, L13_20, L12_19, L7_14) == true then
    A0_7:setBorder(L5_12)
  end
end
function LinkshellMembersListWidget.processUICommandDefault(A0_21, A1_22, A2_23, A3_24, A4_25, A5_26)
  if A3_24 == "UILuaCommands.Shown" then
    desktopWidget:updateLinkshellMemberInformation()
    do break end
    break
  else
  end
end
function LinkshellMembersListWidget.createMemberList(A0_27)
  A0_27:setVisibility("ListBox_MembersList", false)
  A0_27:deleteListPropertyAll("ListBox")
  A0_27:updateMemberList()
  A0_27:setVisibility("ListBox_MembersList", true)
end
function LinkshellMembersListWidget.updateMemberList(A0_28)
  desktopWidget:createCurrnetLinkshellMemberList(A0_28)
  A0_28:updateListProperty("ListBox")
  A0_28:updateMemberInformation()
end
function LinkshellMembersListWidget.updateMemberInformation(A0_29)
  local L1_30, L2_31
  L2_31 = A0_29
  L1_30 = A0_29.getListPropertyCount
  L1_30 = L1_30(L2_31, "ListBox")
  L2_31 = 0
  for _FORV_6_ = 1, L1_30 do
    if A0_29:getListProperty("ListBox", _FORV_6_ - 1, "StatusIcon") == 385 then
      L2_31 = L2_31 + 1
    end
  end
  A0_29:setText("TextBlock_OnlineMember", 228, L2_31, L1_30)
end
function LinkshellMembersListWidget.setListItem(A0_32, A1_33, A2_34, A3_35, A4_36, A5_37, A6_38, A7_39)
  local L8_40, L9_41, L10_42, L11_43, L12_44
  L8_40 = desktopWidget
  L9_41 = L8_40
  L8_40 = L8_40.getLinkshellRankIcon
  L10_42 = A4_36
  L8_40 = L8_40(L9_41, L10_42)
  L9_41 = "Visible"
  if L8_40 == 0 then
    L9_41 = "Hidden"
  end
  L10_42 = 385
  L11_43 = 79217
  L12_44 = 1
  if A6_38 == false then
    L10_42 = 386
    L11_43 = 79221
    L12_44 = 0.5
  end
  A0_32:setListProperty("ListBox", A1_33, "StatusIcon", L10_42)
  A0_32:setListText("ListBox", A1_33, "MemberName", 230, A3_35)
  A0_32:setListProperty("ListBox", A1_33, "RankIcon", L8_40)
  A0_32:setListProperty("ListBox", A1_33, "RankIconVisibility", L9_41)
  A0_32:setListProperty("ListBox", A1_33, "StatusIconHelp", L11_43)
  if A4_36 == 7 then
    A0_32:setListProperty("ListBox", A1_33, "RankIconHelp", 79247)
    break
  else
  end
  if A4_36 == 10 then
    A0_32:setListProperty("ListBox", A1_33, "RankIconHelp", 79218)
    break
  else
  end
  A0_32:setListProperty("ListBox", A1_33, "MemberID", A2_34)
  A0_32:setListProperty("ListBox", A1_33, "MemberRank", A4_36)
  A0_32:setListProperty("ListBox", A1_33, "IsPlayer", A5_37)
  A0_32:setListProperty("ListBox", A1_33, "IsClient", A7_39)
  A0_32:setListProperty("ListBox", A1_33, "IsLogin", A6_38)
  A0_32:setListProperty("ListBox", A1_33, "Selected", "Collapsed")
  A0_32:setListProperty("ListBox", A1_33, "ItemColor", tostring(L12_44))
end
function LinkshellMembersListWidget.update(A0_45, A1_46)
  local L2_47
  L2_47 = A1_46
  if L2_47 == 1 then
    A0_45:createMemberList()
    break
  else
  end
  if L2_47 == 2 then
    A0_45:updateMemberList()
    do break end
    break
  else
  end
end
function LinkshellMembersListWidget.setBorder(A0_48, A1_49)
  local L2_50, L3_51, L4_52, L5_53, L6_54
  if A1_49 < 0 then
    L2_50 = A0_48.getListPropertyCount
    L2_50 = L2_50(L3_51, L4_52)
    for L6_54 = 0, L2_50 - 1 do
      A0_48:setListProperty("ListBox", L6_54, "Selected", "Collapsed")
    end
  else
    L2_50 = A0_48.setListProperty
    L6_54 = "Selected"
    L2_50(L3_51, L4_52, L5_53, L6_54, "Visible")
  end
  L2_50 = A0_48.updateListProperty
  L2_50(L3_51, L4_52)
end
