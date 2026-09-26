require("/Widget/WidgetBaseClass")
_defineClass("PcSearchWidget", "WidgetBaseClass")
function PcSearchWidget.init(A0_0, A1_1)
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setOperatorCloseCondition()
  A0_0:setOperatorOpenChildCondition()
  A0_0:setOperatorRequestCondition()
  A0_0:setModal(true)
  A0_0:setNetStatXmlData()
  if A1_1 ~= nil then
    A0_0:setListProperty("XmlDataMaker_Data", 0, "string_command_line", A1_1)
  else
    A0_0:setListProperty("XmlDataMaker_Data", 0, "string_command_line", "mode_widget")
  end
end
function PcSearchWidget.processAfterShow(A0_2, A1_3)
  if desktopWidget:demandPlayerExpInfomation() == false then
    A0_2:update(nil)
  end
  return true
end
function PcSearchWidget.setNetStatXmlData(A0_4)
  A0_4:setListProperty("XmlDataMaker_Data", 0, "value_netstat_user_away", worldMaster:_getMyPlayer():_getNetStatUser(1))
  A0_4:setListProperty("XmlDataMaker_Data", 0, "value_netstat_user_requestjoinparty", worldMaster:_getMyPlayer():_getNetStatUser(2))
end
function PcSearchWidget.update(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10, L6_11, L7_12
  L2_7 = A0_5.setListProperty
  L6_11 = "value_current_skill"
  L7_12 = desktopWidget
  L7_12 = L7_12.getPlayerMainSkillNumber
  L7_12 = L7_12(L7_12)
  L2_7(L3_8, L4_9, L5_10, L6_11, L7_12, L7_12(L7_12))
  L2_7 = 0
  for L6_11 = 1, 44 do
    L7_12 = A0_5.setListProperty
    L7_12(A0_5, "XmlDataMaker_Data", L2_7, "value_skill", L6_11)
    L7_12 = desktopWidget
    L7_12 = L7_12.getPlayerSkillRank
    L7_12 = L7_12(L7_12, L6_11)
    A0_5:setListProperty("XmlDataMaker_Data", L2_7, "value_skill_level", L7_12)
    L2_7 = L2_7 + 1
  end
  L6_11 = L2_7
  L7_12 = "value_skill"
  L3_8(L4_9, L5_10, L6_11, L7_12, -1)
  L6_11 = 1
  L3_8(L4_9, L5_10, L6_11)
end
function PcSearchWidget.processCharacterActorNetStatUserUpdated(A0_13, A1_14, A2_15, A3_16, A4_17)
  if worldMaster:_getMyPlayer() ~= A1_14 then
    return
  end
  A0_13:setNetStatXmlData()
  A0_13:sendCommand("UIOperatorCommands.Reply", 2)
end
function PcSearchWidget.processUIOperatorCommandRequest(A0_18, A1_19, A2_20)
  local L3_21
  L3_21 = A0_18.getListProperty
  L3_21 = L3_21(A0_18, "XmlDataMaker_Data", 0, "string_target_name")
  if A1_19 == 1 then
    desktopWidget:setTellAddress(L3_21)
    break
  else
  end
  if A1_19 == 2 then
    desktopWidget:executePlayerPartyInviteByName(L3_21)
    break
  else
  end
  if A1_19 == 3 then
    desktopWidget:executePlayerSetRequestJoinParty(A2_20 ~= 0)
    do break end
    break
  else
  end
end
