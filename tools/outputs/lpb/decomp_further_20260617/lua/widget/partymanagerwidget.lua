require("/Widget/WidgetBaseClass")
_defineClass("PartyManagerWidget", "WidgetBaseClass")
function PartyManagerWidget.init(A0_0)
  A0_0:_setUICommandCondition("Button_Leave", "UILuaCommands.Operate", 5)
  A0_0:_setUICommandCondition("Button_Breakup", "UILuaCommands.Operate", 5)
  A0_0:_setUICommandCondition("_widget", "UILuaCommands.Cancel", 5)
  A0_0:_setUICommandCondition("_widget", "UILuaCommands.WidgetClose", 5)
  A0_0:_setUICommandTemplateCondition("ControlTemplate_ListBoxItem", "Button_List", "UILuaCommands.Operate", 5)
  A0_0:addListBoxItem("ListBox_PartyList", "PartyMember", 8)
  A0_0:setHelpParameter("ListBox_PartyList", 1, 75462)
  A0_0:setHelpParameter("TextBlock_Number", 1, 75463)
  A0_0:initMemberList()
  A0_0:setMemberCountDisplay(1)
  A0_0:setModal(true)
  A0_0:updateMemberList()
end
function PartyManagerWidget.processUICommandEvent(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  local L6_7
  L6_7 = A3_4
  if L6_7 == "UILuaCommands.Cancel" then
  else
  end
  if L6_7 == "UILuaCommands.WidgetClose" then
    if A2_3 == "_widget" then
      A0_1:updateRootStatus(3)
      desktopWidget:closeWidgetDirect(A0_1)
      do break end
      else
      end
      if L6_7 == "UILuaCommands.Operate" then
        if A2_3 == "Button_Leave" then
          if desktopWidget:executePlayerSystemCommand(24205) == true and desktopWidget:getChildWidgetByWindowName("MainMenuWidget") ~= nil and desktopWidget:getChildWidgetByWindowName("MainMenuWidget"):getChildWidgetByWindowName("PartyRootWidget") ~= nil then
            desktopWidget:getChildWidgetByWindowName("MainMenuWidget"):getChildWidgetByWindowName("PartyRootWidget"):setEnable("Button_PartyManager", false)
          end
          A0_1:updateRootStatus(4)
          return
        elseif A2_3 == "Button_Breakup" then
          if desktopWidget:executePlayerSystemCommand(24206) == true and desktopWidget:getChildWidgetByWindowName("MainMenuWidget") ~= nil and desktopWidget:getChildWidgetByWindowName("MainMenuWidget"):getChildWidgetByWindowName("PartyRootWidget") ~= nil then
            desktopWidget:getChildWidgetByWindowName("MainMenuWidget"):getChildWidgetByWindowName("PartyRootWidget"):setEnable("Button_PartyManager", false)
          end
          A0_1:updateRootStatus(4)
          return
        else
          if A2_3 == "Button_List" then
            if A4_5 == nil then
              return
            end
            if A4_5 > 0 and A4_5 <= desktopWidget:countPartyMember() and desktopWidget:openChildWidget("PartyManagerSubWidget", A0_1, true, A4_5, A0_1) == true then
              A0_1:setBorder(A4_5)
            end
          else
          end
        end
      else
      end
    else
    end
end
function PartyManagerWidget.processBeforeShow(A0_8, A1_9)
  if A1_9 ~= true then
    A0_8:updateRootStatus(2)
  end
  return true
end
function PartyManagerWidget.update(A0_10, A1_11, A2_12)
  A0_10:updateMemberList(A1_11, A2_12)
end
function PartyManagerWidget.updateMemberList(A0_13, A1_14, A2_15)
  local L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24
  L3_16 = false
  L4_17 = false
  L5_18 = worldMaster
  L6_19 = L5_18
  L5_18 = L5_18._getMyPlayer
  L5_18 = L5_18(L6_19)
  L7_20 = L5_18
  L6_19 = L5_18.getPlayerParty
  L6_19 = L6_19(L7_20)
  if A2_15 ~= nil and L6_19 == A2_15 then
    L6_19 = A2_15
  end
  L7_20 = L6_19._countMember
  L7_20 = L7_20(L8_21)
  if L7_20 == 1 then
    L8_21(L9_22)
    L8_21(L9_22, L10_23)
    L11_24 = false
    L8_21(L9_22, L10_23, L11_24)
    return
  end
  for L11_24 = 1, L7_20 do
    L3_16, L4_17 = desktopWidget:isJoinedPartyMember(L11_24)
    if L3_16 then
      A0_13:addMemberItem(L11_24)
      A0_13:updataMember(L11_24, true)
    elseif not L4_17 then
      A0_13:removeMemberItem(L11_24)
    else
      A0_13:addMemberItem(L11_24)
      A0_13:updataMember(L11_24, false)
    end
  end
  L11_24 = L6_19.isPartyLeader
  L11_24 = L11_24(L6_19, L5_18)
  L8_21(L9_22, L10_23, L11_24, L11_24(L6_19, L5_18))
  L8_21(L9_22, L10_23)
  L8_21(L9_22, L10_23)
end
function PartyManagerWidget.initMemberList(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30
  if A1_26 ~= nil then
    for L5_30 = A1_26, 8 do
      A0_25:removeMemberItem(L5_30)
    end
  else
    for L5_30 = 1, 8 do
      A0_25:removeMemberItem(L5_30)
    end
  end
end
function PartyManagerWidget.updataMember(A0_31, A1_32, A2_33)
  local L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41
  L5_36 = 0
  L6_37 = 0
  L7_38 = 0
  L8_39 = false
  L9_40 = desktopWidget
  L10_41 = L9_40
  L9_40 = L9_40.getPartyMemberDisplayName
  L9_40 = L9_40(L10_41, A1_32)
  L10_41 = desktopWidget
  L10_41 = L10_41.isMyPartyLeader
  L10_41 = L10_41(L10_41, A1_32)
  if A2_33 then
    L3_34 = desktopWidget:getPartyMemberActor(A1_32)
    if L3_34 == nil then
      return
    end
    if L3_34:isPlayer() then
      L5_36, L6_37 = desktopWidget:getPartyMemberSkillNumber(A1_32)
      L7_38 = desktopWidget:getPartyMemberSkillRank(A1_32)
    end
  end
  A0_31:setMemberCharacterName(A1_32, L9_40)
  A0_31:setMemberLeader(A1_32, L10_41)
  A0_31:setMemberSkillName(A1_32, L5_36, L6_37, L7_38)
end
function PartyManagerWidget.setBorder(A0_42, A1_43)
  local L2_44, L3_45, L4_46, L5_47, L6_48, L7_49
  if A1_43 < 0 then
    for L5_47 = 1, 8 do
      L7_49 = A0_42
      L6_48 = A0_42.getMemberItemName
      L6_48 = L6_48(L7_49, L5_47)
      L7_49 = "Border_ItemSelected"
      A0_42:_setProperty(L6_48, L7_49, "Visibility", "Collapsed")
    end
  else
    L5_47 = A0_42
    L6_48 = L2_44
    L7_49 = L3_45
    L4_46(L5_47, L6_48, L7_49, "Visibility", "Visible")
  end
end
function PartyManagerWidget.addMemberItem(A0_50, A1_51)
  local L2_52, L3_53
  L3_53 = A0_50
  L2_52 = A0_50.getMemberItemName
  L2_52 = L2_52(L3_53, A1_51)
  L3_53 = A0_50.getMemberButtonName
  L3_53 = L3_53(A0_50)
  A0_50:_setProperty(L2_52, L3_53, "Visibility", "Visible")
  if desktopWidget:isPartyMemberActorMe(A1_51) == true then
    A0_50:_setProperty(L2_52, L3_53 .. ":TextBlock_Name", "SqwtStyle", "TBL_selectedItem")
  else
    A0_50:_setProperty(L2_52, L3_53 .. ":TextBlock_Name", "SqwtStyle", "TBL_null")
  end
  A0_50:_setProperty(L2_52, L3_53, "CommandParameter", A0_50:packCommandParameter(A1_51))
end
function PartyManagerWidget.removeMemberItem(A0_54, A1_55)
  local L2_56, L3_57
  L3_57 = A0_54
  L2_56 = A0_54.getMemberItemName
  L2_56 = L2_56(L3_57, A1_55)
  L3_57 = A0_54.getMemberButtonName
  L3_57 = L3_57(A0_54)
  A0_54:_setProperty(L2_56, L3_57, "Visibility", "Collapsed")
  A0_54:_setProperty(L2_56, L3_57, "CommandParameter", A0_54:packCommandParameter(0))
end
function PartyManagerWidget.setMemberCountDisplay(A0_58, A1_59)
  A0_58:setText("TextBlock_Number", 228, A1_59, 8)
end
function PartyManagerWidget.setMemberCharacterName(A0_60, A1_61, A2_62)
  local L3_63, L4_64
  L4_64 = A0_60
  L3_63 = A0_60.getMemberItemName
  L3_63 = L3_63(L4_64, A1_61)
  L4_64 = A0_60.getMemberTextBlockName
  L4_64 = L4_64(A0_60)
  if A2_62 ~= nil and A2_62 ~= "" then
    A0_60:setItemText(L3_63, L4_64, 230, A2_62)
  else
    A0_60:setItemText(L3_63, L4_64, 208)
  end
end
function PartyManagerWidget.setMemberLeader(A0_65, A1_66, A2_67)
  local L3_68, L4_69
  L4_69 = A0_65
  L3_68 = A0_65.getMemberItemName
  L3_68 = L3_68(L4_69, A1_66)
  L4_69 = A0_65.getMemberLeaderIconName
  L4_69 = L4_69(A0_65)
  if A2_67 then
    A0_65:_setProperty(L3_68, L4_69, "Visibility", "Visible")
  else
    A0_65:_setProperty(L3_68, L4_69, "Visibility", "Hidden")
  end
end
function PartyManagerWidget.setMemberPhysicalLevel(A0_70, A1_71, A2_72)
  local L3_73, L4_74
  L4_74 = A0_70
  L3_73 = A0_70.getMemberItemName
  L3_73 = L3_73(L4_74, A1_71)
  L4_74 = A0_70.getMemberTextBlockPhysicalLevel
  L4_74 = L4_74(A0_70)
  if A2_72 > 0 then
    A0_70:setItemText(L3_73, L4_74, tostring(A2_72))
  else
    A0_70:setItemText(L3_73, L4_74, 208)
  end
end
function PartyManagerWidget.setMemberSkillName(A0_75, A1_76, A2_77, A3_78, A4_79)
  local L5_80, L6_81
  L6_81 = A0_75
  L5_80 = A0_75.getMemberItemName
  L5_80 = L5_80(L6_81, A1_76)
  L6_81 = A0_75.getMemberTextBlockSkillName
  L6_81 = L6_81(A0_75)
  if A2_77 > 0 then
    A0_75:setItemText(L5_80, L6_81, 231, A2_77, A4_79, A3_78)
  else
    A0_75:setItemText(L5_80, L6_81, 208)
  end
end
function PartyManagerWidget.setMemberSkillRank(A0_82, A1_83, A2_84)
  local L3_85, L4_86
  L4_86 = A0_82
  L3_85 = A0_82.getMemberItemName
  L3_85 = L3_85(L4_86, A1_83)
  L4_86 = A0_82.getMemberTextBlockSkillRank
  L4_86 = L4_86(A0_82)
  if A2_84 > 0 then
    A0_82:setItemText(L3_85, L4_86, 219, A2_84)
  else
    A0_82:setItemText(L3_85, L4_86, 208)
  end
end
function PartyManagerWidget.getMemberItemName(A0_87, A1_88)
  return "PartyMember" .. tostring(A1_88)
end
function PartyManagerWidget.getMemberButtonName(A0_89)
  local L1_90
  L1_90 = "Button_List"
  return L1_90
end
function PartyManagerWidget.getMemberTextBlockName(A0_91)
  local L1_92
  L1_92 = "TextBlock_Name"
  return L1_92
end
function PartyManagerWidget.getMemberLeaderIconName(A0_93, A1_94)
  local L2_95
  L2_95 = "IconControl_Status"
  return L2_95
end
function PartyManagerWidget.getMemberTextBlockPhysicalLevel(A0_96)
  local L1_97
  L1_97 = "TextBlock_Parameter_Level"
  return L1_97
end
function PartyManagerWidget.getMemberTextBlockSkillName(A0_98)
  local L1_99
  L1_99 = "TextBlock_Parameter_Skill"
  return L1_99
end
function PartyManagerWidget.getMemberTextBlockSkillRank(A0_100)
  local L1_101
  L1_101 = "TextBlock_Parameter_Rank"
  return L1_101
end
function PartyManagerWidget.getMemberCountTextBlock(A0_102)
  local L1_103
  L1_103 = "TextBlock_Number"
  return L1_103
end
function PartyManagerWidget.getMemberMaxTextBlock(A0_104)
  local L1_105
  L1_105 = "TextBlock_MaxStack"
  return L1_105
end
function PartyManagerWidget.updateRootStatus(A0_106, A1_107)
  if A0_106:_getParentWidget() ~= nil then
    A0_106:_getParentWidget():updateChildWidgetStatus("PartyManagerWidget", A1_107)
  end
end
