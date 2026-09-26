require("/Widget/WidgetBaseClass")
_defineClass("ItemShareWidget", "WidgetBaseClass")
function ItemShareWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "PartyManagerWidget"
  return L1_1
end
function ItemShareWidget.init(A0_2)
  A0_2.work._temp = {
    {
      "editWidgetMode",
      "integer8"
    }
  }
  A0_2:setProperty("Title", "@" .. tostring(3236))
  A0_2:setProperty("Margin", "40%,15%,0,0")
  A0_2:setCancelCondition()
  A0_2:setCloseCondition()
  A0_2:setButtonEvents("Button_Leave")
  A0_2:setButtonEvents("Button_Breakup")
  A0_2:setContent("Button_Leave", 3240)
  A0_2:setContent("Button_Breakup", 3252)
  A0_2:setVisibility("Button_Breakup", false)
  A0_2:_setUICommandTemplateCondition("ControlTemplate_ListBoxItem", "Button_List", "UILuaCommands.Operate", 5)
  A0_2:addListBoxItem("ListBox_PartyList", "PartyMember", 8)
  A0_2:initMemberList()
  A0_2:setMemberCountDisplay(0)
  A0_2:setModal(true)
  A0_2:updateMemberList()
  A0_2:setHelpParameter("ListBox_PartyList", 1, 75391)
  A0_2:setHelpParameter("TextBlock_Number", 1, 75393)
end
function ItemShareWidget.setButtonEvents(A0_3, A1_4)
  A0_3:setConfirmCondition(A1_4)
  A0_3:setCancelCondition(A1_4)
end
function ItemShareWidget.closeRequest(A0_5)
  A0_5.work.editWidgetMode = -1
  if A0_5:_getParentWidget() ~= nil then
    A0_5:_getParentWidget():setItemShare(12)
    A0_5:_getParentWidget():closeItemShare()
  end
end
function ItemShareWidget.processUICommandEvent(A0_6, A1_7, A2_8, A3_9, A4_10, A5_11)
  local L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19
  if A3_9 == "UILuaCommands.WidgetClose" then
    L7_13 = A0_6
    L6_12 = A0_6.closeRequest
    return L6_12(L7_13)
  elseif A3_9 == "UILuaCommands.Cancel" then
    L7_13 = A0_6
    L6_12 = A0_6.closeRequest
    return L6_12(L7_13)
  elseif A3_9 == "UILuaCommands.Operate" then
    L6_12 = A0_6.work
    L6_12 = L6_12.editWidgetMode
    if L6_12 ~= 0 then
      L6_12 = false
      return L6_12
    end
    L6_12 = worldMaster
    L7_13 = L6_12
    L6_12 = L6_12._getMyPlayer
    L6_12 = L6_12(L7_13)
    L8_14 = L6_12
    L7_13 = L6_12._getItemPackageCapacity
    L9_15 = 5
    L7_13 = L7_13(L8_14, L9_15)
    L9_15 = L6_12
    L8_14 = L6_12._getItemPackageFreeSpace
    L10_16 = 5
    L8_14 = L8_14(L9_15, L10_16)
    if L7_13 == L8_14 then
      L8_14 = A0_6
      L7_13 = A0_6.closeRequest
      return L7_13(L8_14)
    end
    L8_14 = A0_6
    L7_13 = A0_6._getParentWidget
    L7_13 = L7_13(L8_14)
    L8_14 = nil
    if L7_13 ~= nil then
      L10_16 = L7_13
      L9_15 = L7_13.getShareItem
      L9_15 = L9_15(L10_16)
      L8_14 = L9_15
      if L8_14 == nil then
        L10_16 = A0_6
        L9_15 = A0_6.closeRequest
        return L9_15(L10_16)
      end
    end
    if A2_8 == "Button_List" then
      if L8_14 == 0 then
        L10_16 = L7_13
        L9_15 = L7_13.setItemShare
        L11_17 = 13
        L9_15(L10_16, L11_17)
        return
      elseif L8_14 > 0 then
        L9_15 = worldMaster
        L10_16 = L9_15
        L9_15 = L9_15._getMyPlayer
        L9_15 = L9_15(L10_16)
        L11_17 = L9_15
        L10_16 = L9_15._getItem
        L12_18 = 5
        L13_19 = L8_14
        L10_16 = L10_16(L11_17, L12_18, L13_19)
        if L10_16 ~= nil then
          L12_18 = L10_16
          L11_17 = L10_16._countStack
          L11_17 = L11_17(L12_18)
          L12_18 = desktopWidget
          L13_19 = L12_18
          L12_18 = L12_18.isPartyMemberActorMe
          L12_18 = L12_18(L13_19, A4_10)
          if L12_18 == true then
            L13_19 = L10_16
            L12_18 = L10_16.getItemProperPackage
            L12_18 = L12_18(L13_19)
            L13_19 = desktopWidget
            L13_19 = L13_19.executePlayerItemMovePackage
            L13_19 = L13_19(L13_19, 5, L8_14, L12_18, L11_17)
            if L13_19 == true then
              L13_19 = A0_6.work
              L13_19.editWidgetMode = 11
              L13_19 = L7_13.setItemShare
              L13_19(L7_13, 11)
              L13_19 = L7_13.closeItemShare
              L13_19(L7_13)
            else
              L13_19 = A0_6.closeRequest
              return L13_19(A0_6)
            end
          else
            L12_18 = desktopWidget
            L13_19 = L12_18
            L12_18 = L12_18.executePlayerItemTransfer
            L12_18 = L12_18(L13_19, 5, L8_14, A4_10, 5)
            if L12_18 == true then
              L12_18 = A0_6.work
              L12_18.editWidgetMode = 13
              L13_19 = L7_13
              L12_18 = L7_13.setItemShare
              L12_18(L13_19, 13)
              L13_19 = L7_13
              L12_18 = L7_13.closeItemShare
              L12_18(L13_19)
            else
              L13_19 = A0_6
              L12_18 = A0_6.closeRequest
              return L12_18(L13_19)
            end
          end
          return
        else
          L12_18 = A0_6
          L11_17 = A0_6.closeRequest
          return L11_17(L12_18)
        end
      else
        L10_16 = A0_6
        L9_15 = A0_6.closeRequest
        return L9_15(L10_16)
      end
      return
    end
    if A2_8 == "Button_Breakup" then
      L9_15 = worldMaster
      L10_16 = L9_15
      L9_15 = L9_15._getMyPlayer
      L9_15 = L9_15(L10_16)
      L11_17 = L9_15
      L10_16 = L9_15._getItem
      L12_18 = 5
      L13_19 = L8_14
      L10_16 = L10_16(L11_17, L12_18, L13_19)
      L12_18 = A0_6
      L11_17 = A0_6._getParentWidget
      L11_17 = L11_17(L12_18)
      if L10_16 ~= nil then
        L12_18 = desktopWidget
        L13_19 = L12_18
        L12_18 = L12_18.executePlayerItemWaste
        L12_18 = L12_18(L13_19, 5, L8_14)
        if L12_18 == true and L11_17 ~= nil then
          L12_18 = A0_6.work
          L12_18.editWidgetMode = 11
          L13_19 = L11_17
          L12_18 = L11_17.setItemShare
          L12_18(L13_19, 11)
          L13_19 = L11_17
          L12_18 = L11_17.closeItemShare
          L12_18(L13_19)
        end
      elseif L11_17 ~= nil then
        L13_19 = A0_6
        L12_18 = A0_6.closeRequest
        return L12_18(L13_19)
      end
    end
    if A2_8 == "Button_Leave" then
      if L8_14 == 0 then
        L10_16 = L7_13
        L9_15 = L7_13.closeItemShare
        L11_17 = 13
        L9_15(L10_16, L11_17)
        return
      elseif L8_14 > 0 then
        L9_15 = worldMaster
        L10_16 = L9_15
        L9_15 = L9_15._getMyPlayer
        L9_15 = L9_15(L10_16)
        L11_17 = L9_15
        L10_16 = L9_15._getItem
        L12_18 = 5
        L13_19 = L8_14
        L10_16 = L10_16(L11_17, L12_18, L13_19)
        if L10_16 ~= nil then
          L12_18 = L10_16
          L11_17 = L10_16._countStack
          L11_17 = L11_17(L12_18)
          L13_19 = L10_16
          L12_18 = L10_16._getCatalogID
          L12_18 = L12_18(L13_19)
          L13_19 = L10_16.getItemProperPackage
          L13_19 = L13_19(L10_16)
          if L13_19 == nil then
            return
          end
          if desktopWidget:executePlayerItemMovePackage(5, L8_14, L13_19, L11_17) == true then
            A0_6.work.editWidgetMode = 11
            L7_13:setItemShare(11)
            L7_13:closeItemShare()
          else
            return A0_6:closeRequest()
          end
          return
        else
          L12_18 = A0_6
          L11_17 = A0_6.closeRequest
          return L11_17(L12_18)
        end
      else
        L10_16 = A0_6
        L9_15 = A0_6.closeRequest
        return L9_15(L10_16)
      end
      return
    end
  end
end
function ItemShareWidget.update(A0_20, A1_21)
  A0_20:updateMemberList()
end
function ItemShareWidget.updateMemberList(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29
  L1_23 = false
  L2_24 = false
  L3_25 = desktopWidget
  L3_25 = L3_25.countPartyMember
  L3_25 = L3_25(L4_26)
  if L3_25 > 0 then
    for L7_29 = 1, L3_25 do
      L1_23, L2_24 = desktopWidget:isJoinedPartyMember(L7_29)
      if L1_23 then
        A0_22:addMemberItem(L7_29)
        A0_22:updataMember(L7_29, true)
      elseif not L2_24 then
        A0_22:removeMemberItem(L7_29)
      else
        A0_22:addMemberItem(L7_29)
        A0_22:updataMember(L7_29, false)
      end
    end
  end
  L4_26(L5_27, L6_28)
  L4_26(L5_27, L6_28)
  if L3_25 <= 1 then
    L7_29 = false
    L4_26(L5_27, L6_28, L7_29)
    L7_29 = false
    L4_26(L5_27, L6_28, L7_29)
    L7_29 = false
    L4_26(L5_27, L6_28, L7_29)
    if L4_26 ~= "Button_Breakup" then
      L4_26(L5_27, L6_28)
    end
  else
    L7_29 = true
    L4_26(L5_27, L6_28, L7_29)
    L7_29 = true
    L4_26(L5_27, L6_28, L7_29)
    L7_29 = true
    L4_26(L5_27, L6_28, L7_29)
  end
end
function ItemShareWidget.initMemberList(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L5_35
  if A1_31 ~= nil then
    for L5_35 = A1_31, 8 do
      A0_30:removeMemberItem(L5_35)
    end
  else
    for L5_35 = 1, 8 do
      A0_30:removeMemberItem(L5_35)
    end
  end
end
function ItemShareWidget.updataMember(A0_36, A1_37, A2_38)
  local L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46
  if A1_37 < 1 or A1_37 > 8 then
    return
  end
  L3_39, L4_40 = nil, nil
  L5_41 = 0
  L6_42 = 0
  L7_43 = 0
  L8_44 = false
  L9_45 = desktopWidget
  L10_46 = L9_45
  L9_45 = L9_45.getPartyMemberDisplayName
  L9_45 = L9_45(L10_46, A1_37)
  L10_46 = desktopWidget
  L10_46 = L10_46.isMyPartyLeader
  L10_46 = L10_46(L10_46, A1_37)
  if A2_38 then
    L3_39 = desktopWidget:getPartyMemberActor(A1_37)
    if L3_39 == nil then
      return
    end
    if L3_39:isPlayer() then
      L5_41, L6_42 = desktopWidget:getPartyMemberSkillNumber(A1_37)
      L7_43 = desktopWidget:getPartyMemberSkillRank(A1_37)
    end
  end
  A0_36:setMemberCharacterName(A1_37, L9_45)
  A0_36:setMemberLeader(A1_37, L10_46)
  A0_36:setMemberSkillName(A1_37, L5_41, L6_42, L7_43)
end
function ItemShareWidget.addMemberItem(A0_47, A1_48)
  local L2_49, L3_50
  L3_50 = A0_47
  L2_49 = A0_47.getMemberItemName
  L2_49 = L2_49(L3_50, A1_48)
  L3_50 = A0_47.getMemberButtonName
  L3_50 = L3_50(A0_47)
  A0_47:_setProperty(L2_49, L3_50, "Visibility", "Visible")
  if desktopWidget:isPartyMemberActorMe(A1_48) == true then
    A0_47:_setProperty(L2_49, L3_50 .. ":TextBlock_Name", "SqwtStyle", "TBL_selectedItem")
  else
    A0_47:_setProperty(L2_49, L3_50 .. ":TextBlock_Name", "SqwtStyle", "TBL_null")
  end
  A0_47:_setProperty(L2_49, L3_50, "CommandParameter", A0_47:packCommandParameter(A1_48))
end
function ItemShareWidget.removeMemberItem(A0_51, A1_52)
  local L2_53, L3_54
  L3_54 = A0_51
  L2_53 = A0_51.getMemberItemName
  L2_53 = L2_53(L3_54, A1_52)
  L3_54 = A0_51.getMemberButtonName
  L3_54 = L3_54(A0_51)
  if A1_52 > 1 then
    A0_51:_setProperty(L2_53, L3_54, "Visibility", "Collapsed")
  end
  A0_51:_setProperty(L2_53, L3_54, "CommandParameter", A0_51:packCommandParameter(0))
end
function ItemShareWidget.setMemberCountDisplay(A0_55, A1_56)
  A0_55:setText("TextBlock_Number", 228, A1_56, 8)
end
function ItemShareWidget.setMemberCharacterName(A0_57, A1_58, A2_59)
  local L3_60, L4_61
  L4_61 = A0_57
  L3_60 = A0_57.getMemberItemName
  L3_60 = L3_60(L4_61, A1_58)
  L4_61 = A0_57.getMemberTextBlockName
  L4_61 = L4_61(A0_57)
  if A2_59 ~= nil then
    A0_57:setItemText(L3_60, L4_61, 230, A2_59)
  else
    A0_57:setItemText(L3_60, L4_61, 208)
  end
end
function ItemShareWidget.setMemberLeader(A0_62, A1_63, A2_64)
  local L3_65, L4_66
  L4_66 = A0_62
  L3_65 = A0_62.getMemberItemName
  L3_65 = L3_65(L4_66, A1_63)
  L4_66 = A0_62.getMemberLeaderIconName
  L4_66 = L4_66(A0_62)
  if A2_64 then
    A0_62:setVisibility(L3_65 .. ":" .. L4_66, true)
  else
    A0_62:setHidden(L3_65 .. ":" .. L4_66)
  end
end
function ItemShareWidget.setMemberPhysicalLevel(A0_67, A1_68, A2_69)
  local L3_70, L4_71
  L4_71 = A0_67
  L3_70 = A0_67.getMemberItemName
  L3_70 = L3_70(L4_71, A1_68)
  L4_71 = A0_67.getMemberTextBlockPhysicalLevel
  L4_71 = L4_71(A0_67)
  if A2_69 > 0 then
    A0_67:_setProperty(L3_70, L4_71, "Text", tostring(A2_69))
  else
    A0_67:setItemText(L3_70, L4_71, 208)
  end
end
function ItemShareWidget.setMemberSkillName(A0_72, A1_73, A2_74, A3_75, A4_76)
  local L5_77, L6_78
  L6_78 = A0_72
  L5_77 = A0_72.getMemberItemName
  L5_77 = L5_77(L6_78, A1_73)
  L6_78 = A0_72.getMemberTextBlockSkillName
  L6_78 = L6_78(A0_72)
  if A2_74 > 0 then
    A0_72:setItemText(L5_77, L6_78, 231, A2_74, A4_76, A3_75)
  else
    A0_72:setItemText(L5_77, L6_78, 208)
  end
end
function ItemShareWidget.setMemberSkillRank(A0_79, A1_80, A2_81)
  local L3_82, L4_83
  L4_83 = A0_79
  L3_82 = A0_79.getMemberItemName
  L3_82 = L3_82(L4_83, A1_80)
  L4_83 = A0_79.getMemberTextBlockSkillRank
  L4_83 = L4_83(A0_79)
  if A2_81 > 0 then
    A0_79:setItemText(L3_82, L4_83, 219, A2_81)
  else
    A0_79:setItemText(L3_82, L4_83, 208)
  end
end
function ItemShareWidget.getMemberItemName(A0_84, A1_85)
  return "PartyMember" .. tostring(A1_85)
end
function ItemShareWidget.getMemberButtonName(A0_86)
  local L1_87
  L1_87 = "Button_List"
  return L1_87
end
function ItemShareWidget.getMemberTextBlockName(A0_88)
  local L1_89
  L1_89 = "TextBlock_Name"
  return L1_89
end
function ItemShareWidget.getMemberLeaderIconName(A0_90, A1_91)
  local L2_92
  L2_92 = "IconControl_Status"
  return L2_92
end
function ItemShareWidget.getMemberTextBlockPhysicalLevel(A0_93)
  local L1_94
  L1_94 = "TextBlock_Parameter_Level"
  return L1_94
end
function ItemShareWidget.getMemberTextBlockSkillName(A0_95)
  local L1_96
  L1_96 = "TextBlock_Parameter_Skill"
  return L1_96
end
function ItemShareWidget.getMemberTextBlockSkillRank(A0_97)
  local L1_98
  L1_98 = "TextBlock_Parameter_Rank"
  return L1_98
end
function ItemShareWidget.getMemberCountTextBlock(A0_99)
  local L1_100
  L1_100 = "TextBlock_Number"
  return L1_100
end
function ItemShareWidget.getMemberMaxTextBlock(A0_101)
  local L1_102
  L1_102 = "TextBlock_MaxStack"
  return L1_102
end
