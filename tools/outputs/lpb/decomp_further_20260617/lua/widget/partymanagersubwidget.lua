require("/Widget/WidgetBaseClass")
_defineClass("PartyManagerSubWidget", "WidgetBaseClass")
function PartyManagerSubWidget.init(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L3_3 = A0_0.work
  L4_4 = {
    L5_5,
    L6_6,
    L7_7
  }
  L5_5 = {L6_6, L7_7}
  L6_6 = "memberIndex"
  L7_7 = "integer8"
  L6_6 = {L7_7, L8_8}
  L7_7 = "memberCount"
  L8_8 = "integer8"
  L7_7 = {L8_8, L9_9}
  L8_8 = "isLeader"
  L9_9 = "boolean"
  L3_3._temp = L4_4
  L4_4 = A0_0
  L3_3 = A0_0.setConfirmCondition
  L5_5 = "Button_SendTell"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setConfirmCondition
  L5_5 = "Button_ChangeLeader"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setConfirmCondition
  L5_5 = "Button_KickOut"
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.setCancelCondition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setCloseCondition
  L3_3(L4_4)
  L3_3 = A0_0.work
  L3_3.memberIndex = A1_1
  L3_3 = A0_0.work
  L3_3.isLeader = false
  L3_3 = A0_0.work
  L4_4 = desktopWidget
  L5_5 = L4_4
  L4_4 = L4_4.countPartyMember
  L4_4 = L4_4(L5_5)
  L3_3.memberCount = L4_4
  L4_4 = A0_0
  L3_3 = A0_0.setModal
  L5_5 = true
  L3_3(L4_4, L5_5)
  L4_4 = A0_0
  L3_3 = A0_0.updateMenu
  L3_3(L4_4)
  L3_3 = 0
  L4_4 = 0
  L6_6 = A0_0
  L5_5 = A0_0.setProperty
  L7_7 = "Margin"
  L8_8 = "0,0,0,0"
  L5_5(L6_6, L7_7, L8_8)
  L6_6 = A2_2
  L5_5 = A2_2.getWindowPosition
  L6_6 = L5_5(L6_6)
  L8_8 = A2_2
  L7_7 = A2_2.getWindowSize
  L8_8 = L7_7(L8_8)
  L9_9 = A1_1 - 1
  L9_9 = L9_9 * 40
  L10_10 = L8_8 - 40
  if L9_9 > L10_10 then
    L9_9 = L8_8 - 80
  end
  L10_10 = L6_6 + 64
  L10_10 = L10_10 + L9_9
  L11_11 = L5_5 + 36
  L11_11 = L11_11 + 362
  if L11_11 + 160 > desktopWidget:getWindowSize() * 0.85 then
    L11_11 = desktopWidget:getWindowSize() * 0.85 - 160
  end
  if L10_10 + 100 > desktopWidget:getWindowSize() * 0.85 then
    L10_10 = desktopWidget:getWindowSize() * 0.85 - 100
  end
  if L10_10 < desktopWidget:getWindowSize() * 0.15 and desktopWidget:getWindowSize() == 480 then
    L10_10 = desktopWidget:getWindowSize() * 0.15
  elseif L10_10 < 64 then
    L10_10 = 64
  end
  A0_0:setProperty("Top", L10_10)
  A0_0:setProperty("Left", L11_11)
end
function PartyManagerSubWidget.processUICommandEvent(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17)
  local L6_18, L7_19, L8_20, L9_21
  L6_18 = A3_15
  if L6_18 == "UILuaCommands.Cancel" then
  else
  end
  if L6_18 == "UILuaCommands.WidgetClose" then
    if A2_14 == "_widget" or A2_14 == "Button_Cancel" then
      L8_20 = A0_12
      L7_19 = A0_12._getParentWidget
      L7_19 = L7_19(L8_20)
      if L7_19 ~= nil then
        L9_21 = L7_19
        L8_20 = L7_19.setBorder
        L8_20(L9_21, -1)
      end
      L8_20 = desktopWidget
      L9_21 = L8_20
      L8_20 = L8_20.closeWidgetDirect
      L8_20(L9_21, A0_12)
      do break end
      else
      end
      if L6_18 == "UILuaCommands.Operate" then
        L7_19 = desktopWidget
        L8_20 = L7_19
        L7_19 = L7_19.getPartyMemberActor
        L9_21 = A0_12.work
        L9_21 = L9_21.memberIndex
        L7_19 = L7_19(L8_20, L9_21)
        L8_20 = desktopWidget
        L9_21 = L8_20
        L8_20 = L8_20.getMyPartyMemberDisplayName
        L8_20 = L8_20(L9_21, A0_12.work.memberIndex)
        if A2_14 == "Button_SendTell" then
          L9_21 = desktopWidget
          L9_21 = L9_21.getPartyMemberDisplayName
          L9_21 = L9_21(L9_21, A0_12.work.memberIndex)
          desktopWidget:setTellAddress(L9_21)
          if A0_12:_getParentWidget() ~= nil then
            A0_12:_getParentWidget():setBorder(-1)
          end
          desktopWidget:closeWidgetDirect(A0_12)
        elseif A2_14 == "Button_SendLetter" then
          L9_21 = A0_12._getParentWidget
          L9_21 = L9_21(A0_12)
          if L9_21 ~= nil then
            L9_21:setBorder(-1)
          end
          desktopWidget:closeWidgetDirect(A0_12)
        elseif A2_14 == "Button_ChangeLeader" then
          L9_21 = A0_12.work
          L9_21 = L9_21.isLeader
          if L9_21 and L7_19 ~= nil then
            L9_21 = desktopWidget
            L9_21 = L9_21.executePlayerSystemCommand
            L9_21 = L9_21(L9_21, 24208, nil, nil, L7_19)
            if L9_21 == true then
              L9_21 = desktopWidget
              L9_21 = L9_21.getChildWidgetByWindowName
              L9_21 = L9_21(L9_21, "MainMenuWidget")
              if L9_21 ~= nil and L9_21:getChildWidgetByWindowName("PartyRootWidget") ~= nil then
                L9_21:getChildWidgetByWindowName("PartyRootWidget"):setEnable("Button_PcMatching_Edit", false)
              end
            end
          end
          L9_21 = A0_12._getParentWidget
          L9_21 = L9_21(A0_12)
          if L9_21 ~= nil then
            L9_21:setBorder(-1)
          end
          desktopWidget:closeWidgetDirect(A0_12)
        else
          if A2_14 == "Button_KickOut" then
            L9_21 = A0_12.work
            L9_21 = L9_21.isLeader
            if L9_21 then
              if L7_19 ~= nil then
                L9_21 = desktopWidget
                L9_21 = L9_21.executePlayerSystemCommand
                L9_21(L9_21, 24207, nil, nil, L7_19)
              elseif L8_20 ~= nil then
                L9_21 = desktopWidget
                L9_21 = L9_21.executePlayerSystemCommand
                L9_21(L9_21, 24207, L8_20)
              end
            end
            L9_21 = A0_12._getParentWidget
            L9_21 = L9_21(A0_12)
            if L9_21 ~= nil then
              L9_21:setBorder(-1)
            end
            desktopWidget:closeWidgetDirect(A0_12)
          else
          end
        end
      else
      end
    else
    end
end
function PartyManagerSubWidget.update(A0_22)
  A0_22:updateMenu()
end
function PartyManagerSubWidget.updateMenu(A0_23)
  A0_23.work.isLeader = desktopWidget:isMyPartyLeaderForMyPlayer()
  A0_23:displayCommand(A0_23.work.memberIndex, A0_23.work.isLeader)
end
function PartyManagerSubWidget.displayCommand(A0_24, A1_25, A2_26)
  A0_24:setEnable("Button_SendTell", false)
  A0_24:setEnable("Button_ChangeLeader", false)
  A0_24:setEnable("Button_KickOut", false)
  if desktopWidget:isPartyMemberActorMe(A1_25) then
    return
  end
  if desktopWidget:getPartyMemberDisplayName(A1_25) == nil or desktopWidget:getPartyMemberDisplayName(A1_25) == "" then
    return
  end
  if A0_24.work.memberCount ~= desktopWidget:countPartyMember() then
    return
  end
  if desktopWidget:countPartyMember() <= 1 then
    return
  end
  A0_24:setEnable("Button_SendTell", true)
  if A2_26 then
    if desktopWidget:isJoinedPartyMember(A1_25) and not desktopWidget:isMyPartyMatcing() then
      A0_24:setEnable("Button_ChangeLeader", true)
    end
    A0_24:setEnable("Button_KickOut", true)
  end
end
