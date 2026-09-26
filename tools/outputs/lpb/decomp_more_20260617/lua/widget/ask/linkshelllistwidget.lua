require("/Widget/Ask/AskBaseClass")
_defineClass("LinkshellListWidget", "AskBaseClass")
function LinkshellListWidget.initAsk(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6
  L5_5 = "mode"
  L6_6 = "integer8"
  L2_2._temp = L3_3
  L2_2(L3_3)
  L2_2(L3_3)
  L5_5 = "UILuaCommands.SelectionChanged"
  L2_2(L3_3, L4_4, L5_5)
  L2_2(L3_3, L4_4)
  if A1_1 ~= 1 then
    L5_5 = true
    L2_2(L3_3, L4_4, L5_5)
    if A1_1 == 2 then
    else
    end
    L5_5 = "TextBlock_SystemMessage"
    L6_6 = L2_2
    L3_3(L4_4, L5_5, L6_6)
  end
  for L5_5 = 1, 8 do
    L6_6 = "ListBoxItem_Linkshell_"
    L6_6 = L6_6 .. tostring(L5_5)
    A0_0:setText(L6_6 .. ":TextBlock_LinkshellNumber", tostring(L5_5))
  end
  L2_2.mode = A1_1
  L2_2(L3_3)
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
end
function LinkshellListWidget.processUICommandClose(A0_7, A1_8, A2_9, A3_10, A4_11)
  if A0_7.work.mode == 1 then
    desktopWidget:closeWidgetDirect(A0_7)
  else
    A0_7:setBaseAskResult(-1)
  end
end
function LinkshellListWidget.processUICommandSelectionChanged(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17, L6_18
  L5_17 = A0_12.work
  L5_17 = L5_17.mode
  if L5_17 == 1 then
    L6_18 = A0_12
    L5_17 = A0_12.getWindowPosition
    L6_18 = L5_17(L6_18)
    L5_17 = L5_17 + 240
    L6_18 = L6_18 + 60
    if desktopWidget:openChildWidget("LinkshellListSubWidget", A0_12, true, A3_15 + 1, L5_17, L6_18) == true then
      A0_12:setBorder(A3_15 + 1)
    end
  else
    L6_18 = A0_12
    L5_17 = A0_12.setBaseAskResult
    L5_17(L6_18, A3_15 + 1)
  end
end
function LinkshellListWidget.createList(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36
  L1_20 = worldMaster
  L2_21 = L1_20
  L1_20 = L1_20._getMyPlayer
  L1_20 = L1_20(L2_21)
  L3_22 = L1_20
  L2_21 = L1_20.getCommunityGroupCurrent
  L2_21 = L2_21(L3_22, L4_23)
  L3_22 = L1_20.countCommunityGroup
  L3_22 = L3_22(L4_23, L5_24)
  if L3_22 > 0 then
    L7_26 = false
    L4_23(L5_24, L6_25, L7_26)
    L7_26 = true
    L4_23(L5_24, L6_25, L7_26)
    for L7_26 = 1, L3_22 do
      L8_27 = "ListBoxItem_Linkshell_"
      L9_28 = tostring
      L10_29 = L7_26
      L9_28 = L9_28(L10_29)
      L8_27 = L8_27 .. L9_28
      L10_29 = L1_20
      L9_28 = L1_20.getCommunityGroup
      L11_30 = 20002
      L12_31 = L7_26
      L9_28 = L9_28(L10_29, L11_30, L12_31)
      L11_30 = A0_19
      L10_29 = A0_19.setTextWorldMaster
      L12_31 = L8_27
      L13_32 = ":TextBlock_LinkshellName"
      L12_31 = L12_31 .. L13_32
      L13_32 = 33626
      L14_33 = L9_28
      L10_29(L11_30, L12_31, L13_32, L14_33)
      L10_29 = desktopWidget
      L11_30 = L10_29
      L10_29 = L10_29.getLinkshellOnlineMemberCount
      L12_31 = L9_28
      L10_29 = L10_29(L11_30, L12_31)
      L12_31 = A0_19
      L11_30 = A0_19.setText
      L13_32 = L8_27
      L14_33 = ":TextBlock_OnlineMember"
      L13_32 = L13_32 .. L14_33
      L14_33 = 228
      L15_34 = L10_29
      L17_36 = L9_28
      L16_35 = L9_28._countMember
      L17_36 = L16_35(L17_36)
      L11_30(L12_31, L13_32, L14_33, L15_34, L16_35, L17_36, L16_35(L17_36))
      L12_31 = L9_28
      L11_30 = L9_28.getMemberRank
      L13_32 = L1_20
      L11_30 = L11_30(L12_31, L13_32)
      L12_31 = desktopWidget
      L13_32 = L12_31
      L12_31 = L12_31.getLinkshellRankIcon
      L14_33 = L11_30
      L12_31 = L12_31(L13_32, L14_33)
      L14_33 = A0_19
      L13_32 = A0_19.setIconWithVisibility
      L15_34 = L8_27
      L16_35 = ":IconControl_Reader"
      L15_34 = L15_34 .. L16_35
      L16_35 = L12_31
      L13_32(L14_33, L15_34, L16_35)
      L13_32 = L11_30
      if L13_32 == 7 then
        L15_34 = A0_19
        L14_33 = A0_19.setHelpParameter
        L16_35 = L8_27
        L17_36 = ":IconControl_Reader"
        L16_35 = L16_35 .. L17_36
        L17_36 = 1
        L14_33(L15_34, L16_35, L17_36, 79246)
        break
      else
      end
      if L13_32 == 10 then
        L15_34 = A0_19
        L14_33 = A0_19.setHelpParameter
        L16_35 = L8_27
        L17_36 = ":IconControl_Reader"
        L16_35 = L16_35 .. L17_36
        L17_36 = 1
        L14_33(L15_34, L16_35, L17_36, 79203)
        break
      else
      end
      L14_33 = L9_28
      L13_32 = L9_28.getCrestIcon
      L16_35 = L13_32(L14_33)
      L17_36 = desktopWidget
      L17_36 = L17_36.getLinkshellIconID
      L17_36 = L17_36(L17_36, L13_32)
      L13_32 = L17_36
      L17_36 = A0_19.setIconWithVisibility
      L17_36(A0_19, L8_27 .. ":IconControl_Emblem", L13_32)
      L17_36 = L8_27
      L17_36 = L17_36 .. ":IconControl_Current"
      if L2_21 ~= L9_28 then
        A0_19:setHidden(L17_36)
      else
        A0_19:setVisibility(L17_36, true)
      end
    end
    for L7_26 = L3_22 + 1, 8 do
      L8_27 = "ListBoxItem_Linkshell_"
      L9_28 = tostring
      L10_29 = L7_26
      L9_28 = L9_28(L10_29)
      L8_27 = L8_27 .. L9_28
      L10_29 = A0_19
      L9_28 = A0_19.setVisibility
      L11_30 = L8_27
      L12_31 = false
      L9_28(L10_29, L11_30, L12_31)
    end
  else
    L7_26 = true
    L4_23(L5_24, L6_25, L7_26)
    L7_26 = false
    L4_23(L5_24, L6_25, L7_26)
  end
end
function LinkshellListWidget.update(A0_37)
  A0_37:createList()
end
function LinkshellListWidget.setBorder(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43, L6_44
  if A1_39 < 0 then
    for L5_43 = 1, 8 do
      L6_44 = "ListBoxItem_Linkshell_"
      L6_44 = L6_44 .. tostring(L5_43)
      A0_38:setVisibility(L6_44 .. ":Border_ItemSelected", false)
    end
  else
    L5_43 = L2_40
    L6_44 = ":Border_ItemSelected"
    L5_43 = L5_43 .. L6_44
    L6_44 = true
    L3_41(L4_42, L5_43, L6_44)
  end
end
