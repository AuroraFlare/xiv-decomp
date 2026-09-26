require("/Widget/WidgetBaseClass")
_defineClass("PartyRootWidget", "WidgetBaseClass")
function PartyRootWidget.init(A0_0)
  A0_0.work._temp = {
    {
      "initialized",
      "boolean"
    },
    {
      "leaderWhenOpen",
      "boolean"
    },
    {
      "notSoloWhenOpen",
      "boolean"
    },
    {"closeOK", "boolean"},
    {"edit", "integer8"},
    {"find", "integer8"},
    {"view", "integer8"},
    {"party", "integer8"},
    {"root", "integer8"}
  }
  A0_0.work.initialized = false
  A0_0.work.edit = 0
  A0_0.work.find = 0
  A0_0.work.view = 0
  A0_0.work.party = 0
  A0_0.work.root = 1
  A0_0.work.closeOK = false
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setConfirmCondition("Button_PcMatching_Edit")
  A0_0:setConfirmCondition("Button_PcMatching_Find")
  A0_0:setConfirmCondition("Button_PartyManager")
  A0_0:setCancelCondition("Button_PcMatching_Edit")
  A0_0:setCancelCondition("Button_PcMatching_Find")
  A0_0:setCancelCondition("Button_PartyManager")
  A0_0:setControlCommandCondition("Button_PcMatching_Edit", "UILuaCommands.PropertyChanged")
  A0_0:setModal(true)
  A0_0:setDrag(true)
  A0_0:setVisibility("Grid_Help", false)
  A0_0:setText("TextBlock_Party_Max", tostring(8))
  A0_0:update()
  if 1 < desktopWidget:countPartyMember() then
    A0_0.work.notSoloWhenOpen = true
    if desktopWidget:isMyPartyLeaderForMyPlayer() == true then
      A0_0.work.leaderWhenOpen = true
    else
      A0_0.work.leaderWhenOpen = false
    end
  else
    A0_0.work.notSoloWhenOpen = false
    A0_0.work.leaderWhenOpen = false
  end
  A0_0:setEnable("Button_PcMatching_Edit", false)
  A0_0:setSignal(1)
end
function PartyRootWidget.setFocus(A0_1, A1_2)
  A0_1:setLogicalFocus(A1_2)
  if desktopWidget:_getKeyboardFocusedWidget() == A0_1 then
    A0_1:setKeyboardFocusedControl(A1_2)
  end
end
function PartyRootWidget.processUICommandCancel(A0_3, A1_4, A2_5, A3_6, A4_7)
  if A0_3.work.closeOK == true or A0_3.work.root == 2 then
    desktopWidget:closeWidgetDirect(A0_3)
  end
end
function PartyRootWidget.processUICommandOperate(A0_8, A1_9, A2_10, A3_11, A4_12)
  if A0_8.work.party == 4 then
    return
  elseif A0_8.work.party == 3 and A0_8:getChildWidgetByWindowName("PartyManagerWidget") == nil then
    A0_8.work.party = 0
  end
  if A0_8.work.closeOK == true and A0_8.work.root == 2 then
    desktopWidget:closeWidgetDirect(A0_8)
  end
  if A2_10 == "Button_PcMatching_Edit" then
    if A0_8:getEditMode() == 0 then
      if desktopWidget:openChildWidget("PcMatchingEditWidget", A0_8, true) == true then
        A0_8.work.edit = 1
      end
    elseif A0_8:getEditMode() == 1 then
      if desktopWidget:openChildWidget("PcMatchingViewWidget", A0_8, true, 1) == true then
        A0_8.work.view = 1
      end
    elseif A0_8:getEditMode() == 2 and desktopWidget:openChildWidget("PcMatchingViewWidget", A0_8, true, 2) == true then
      A0_8.work.view = 1
    end
    return
  end
  if A2_10 == "Button_PcMatching_Find" then
    if A0_8.work.root < 2 then
      return
    end
    if desktopWidget:openChildWidget("PcMatchingFindWidget", A0_8, true) == true then
      A0_8.work.find = 1
    end
    return
  end
  if A2_10 == "Button_PartyManager" then
    if desktopWidget:openChildWidget("PartyManagerWidget", A0_8, true) == true then
      A0_8.work.party = 1
    end
    return
  end
end
function PartyRootWidget.processUICommandDefault(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18)
  local L6_19, L7_20
  if A3_16 == "UILuaCommands.PropertyChanged" then
    L7_20 = A0_13
    L6_19 = A0_13.getSignal
    L6_19 = L6_19(L7_20)
    if L6_19 == 2 then
      L6_19 = A0_13.work
      L6_19.root = 2
      L6_19 = A0_13.work
      L6_19 = L6_19.initialized
      if L6_19 == false then
        L7_20 = A0_13
        L6_19 = A0_13.getEditMode
        L6_19 = L6_19(L7_20)
        L7_20 = ""
        if L6_19 == 2 then
          L7_20 = 2906
          A0_13:setEnable("Button_PcMatching_Edit", true)
        elseif L6_19 == 1 then
          L7_20 = 2905
          A0_13:setEnable("Button_PcMatching_Edit", true)
        else
          L7_20 = 2904
          if 1 < desktopWidget:countPartyMember() and desktopWidget:isMyPartyLeaderForMyPlayer() == false then
            L7_20 = 2905
            A0_13:setEnable("Button_PcMatching_Edit", false)
            A0_13.work.leaderWhenOpen = false
          elseif desktopWidget:countPartyMember() == 8 and desktopWidget:isMyPartyLeaderForMyPlayer() == true then
            A0_13:setEnable("Button_PcMatching_Edit", false)
            A0_13.work.leaderWhenOpen = true
          else
            if desktopWidget:getPlayerConfirmGroupCommandVariation() == 10001 or desktopWidget:getPlayerConfirmGroupCommandVariation() == 10002 then
              A0_13:setEnable("Button_PcMatching_Edit", false)
            else
              A0_13:setEnable("Button_PcMatching_Edit", true)
            end
            A0_13.work.leaderWhenOpen = true
          end
        end
        A0_13:setContent("Button_PcMatching_Edit", L7_20)
      end
    end
    return
  end
  L6_19 = A0_13.work
  L6_19 = L6_19.party
  if L6_19 == 4 then
    return
  else
    L6_19 = A0_13.work
    L6_19 = L6_19.party
    if L6_19 == 3 then
      L7_20 = A0_13
      L6_19 = A0_13.getChildWidgetByWindowName
      L6_19 = L6_19(L7_20, "PartyManagerWidget")
      if L6_19 == nil then
        L6_19 = A0_13.work
        L6_19.party = 0
      end
    end
  end
end
function PartyRootWidget.update(A0_21, A1_22)
  local L2_23
  L2_23 = desktopWidget
  L2_23 = L2_23.countPartyMember
  L2_23 = L2_23(L2_23)
  if L2_23 <= 1 then
    A0_21:setEnable("Button_PartyManager", false)
    A0_21:setHelpParameter("Button_PartyManager", 0)
    L2_23 = 1
    A0_21:setHidden("TextBlock_Party")
    A0_21:setHidden("TextBlock_Party_Slash")
    A0_21:setHidden("TextBlock_Party_Max")
    if A0_21:getEditMode() == 1 and A0_21.work.notSoloWhenOpen == true and A0_21.work.leaderWhenOpen == false then
      A0_21:setEditMode(0)
      A0_21:setContent("Button_PcMatching_Edit", 2904)
      A0_21:setEnable("Button_PcMatching_Edit", true)
    end
    if A0_21.work.notSoloWhenOpen == true then
      if (A0_21.work.edit == 0 or A0_21.work.edit == 2) and (A0_21.work.view == 0 or A0_21.work.view == 2) and (A0_21.work.find == 0 or A0_21.work.find == 2) and (A0_21.work.party == 0 or A0_21.work.party == 2) and A0_21.work.root == 2 then
        A0_21.work.root = 3
        return desktopWidget:closeWidgetDirect(A0_21)
      else
        A0_21.work.closeOK = true
      end
    end
    if A0_21.work.party == 2 and A0_21.work.root == 2 then
      A0_21.work.party = 3
      desktopWidget:closeChildWidget("PartyManagerWidget", A0_21)
    end
  else
    if A0_21.work.closeOK == true and A0_21.work.root == 2 then
      A0_21.work.root = 3
      return desktopWidget:closeWidgetDirect(A0_21)
    end
    A0_21:setEnable("Button_PartyManager", true)
    A0_21:setText("TextBlock_Party", tostring(L2_23))
    A0_21:setVisibility("TextBlock_Party", true)
    A0_21:setVisibility("TextBlock_Party_Slash", true)
    A0_21:setVisibility("TextBlock_Party_Max", true)
    if desktopWidget:isMyPartyLeaderForMyPlayer() == false then
      if A0_21:getEditMode() == 0 then
        A0_21:setEnable("Button_PcMatching_Edit", false)
      elseif A0_21:getEditMode() == 2 then
        A0_21:setEditMode(0)
        A0_21:setContent("Button_PcMatching_Edit", 2905)
        A0_21:setEnable("Button_PcMatching_Edit", false)
        if A0_21.work.view == 2 then
          desktopWidget:closeChildWidget("PcMatchingViewWidget", A0_21)
        end
      end
      if A0_21.work.edit == 2 then
        desktopWidget:closeChildWidget("PcMatchingEditWidget", A0_21)
      end
    else
      if desktopWidget:countPartyMember() == 8 then
        A0_21:setEnable("Button_PcMatching_Edit", false)
        if A0_21.work.edit == 2 then
          desktopWidget:closeChildWidget("PcMatchingEditWidget", A0_21)
        end
      else
        A0_21:setEnable("Button_PcMatching_Edit", true)
      end
      if A0_21.work.notSoloWhenOpen == true and A0_21.work.leaderWhenOpen == false then
        A0_21:setEditMode(0)
        A0_21:setContent("Button_PcMatching_Edit", 2904)
      end
    end
  end
end
function PartyRootWidget.closeViewWidget(A0_24, A1_25, A2_26)
  if A2_26 == nil then
    desktopWidget:closeChildWidget("PcMatchingViewWidget", A0_24)
  else
    A0_24.work.closeOK = true
    A0_24.work.root = 3
    return desktopWidget:closeWidgetDirect(A0_24)
  end
end
function PartyRootWidget.getEditMode(A0_27)
  return A0_27:getControlProperty("Button_PcMatching_Edit", "IntData.Value3")
end
function PartyRootWidget.setEditMode(A0_28, A1_29)
  A0_28:setControlProperty("Button_PcMatching_Edit", "IntData.Value3", A1_29)
end
function PartyRootWidget.getSignal(A0_30)
  return A0_30:getControlProperty("Button_PcMatching_Edit", "IntData.Value2")
end
function PartyRootWidget.setSignal(A0_31, A1_32)
  A0_31:setControlProperty("Button_PcMatching_Edit", "IntData.Value2", A1_32)
end
function PartyRootWidget.updateChildWidgetStatus(A0_33, A1_34, A2_35)
  if A1_34 == "PcMatchingViewWidget" then
    if A0_33.work.view == 1 then
      A0_33.work.view = 2
    end
    if A2_35 ~= nil then
      A0_33.work.view = A2_35
    end
    if A0_33.work.view == 5 and A0_33:getEditMode() == 2 then
      if 1 < desktopWidget:countPartyMember() and desktopWidget:isMyPartyLeaderForMyPlayer() == false then
        A0_33:setEnable("Button_PcMatching_Edit", false)
        return
      end
      if desktopWidget:isMyPartyLeaderForMyPlayer() == true then
        if desktopWidget:countPartyMember() == 8 then
          A0_33:setEnable("Button_PcMatching_Edit", false)
          return
        end
        A0_33:setContent("Button_PcMatching_Edit", 2904)
        A0_33:setEnable("Button_PcMatching_Edit", true)
        A0_33:setEditMode(0)
      end
    end
  elseif A1_34 == "PcMatchingEditWidget" then
    if A0_33.work.edit == 1 then
      A0_33.work.edit = 2
    end
    if A2_35 ~= nil then
      A0_33.work.edit = A2_35
    end
  elseif A1_34 == "PcMatchingFindWidget" then
    if A0_33.work.find == 1 then
      A0_33.work.find = 2
    end
    if A2_35 ~= nil then
      A0_33.work.find = A2_35
    end
  elseif A1_34 == "PartyManagerWidget" then
    if A0_33.work.party == 1 then
      A0_33.work.party = 2
    end
    if A2_35 ~= nil then
      A0_33.work.find = A2_35
    end
    if A2_35 == 4 then
      A0_33:setEnable("Button_PartyManager", false)
      A0_33.work.closeOK = true
    end
  end
  if A0_33.work.closeOK == true and A0_33.work.root == 2 then
    A0_33.work.root = 3
    return desktopWidget:closeWidgetDirect(A0_33)
  end
end
function PartyRootWidget.updateJoinButton(A0_36)
  if desktopWidget:getPlayerConfirmGroupCommandVariation() == 10001 or desktopWidget:getPlayerConfirmGroupCommandVariation() == 10002 then
    if A0_36:getChildWidgetByWindowName("PcMatchingViewWidget") ~= nil and A0_36:getEditMode() == 0 and (A0_36.work.view == 0 or A0_36.work.view == 2) then
      desktopWidget:closeChildWidget("PcMatchingViewWidget", A0_36)
      A0_36.work.view = 0
    end
    if A0_36:getChildWidgetByWindowName("PcMatchingEditWidget") ~= nil and A0_36.work.edit == 2 then
      desktopWidget:closeChildWidget("PcMatchingEditWidget", A0_36)
      A0_36.work.edit = 0
    end
    if A0_36:getChildWidgetByWindowName("PcMatchingFindWidget") ~= nil and A0_36.work.find == 2 then
      desktopWidget:closeChildWidget("PcMatchingFindWidget", A0_36)
    end
    if (A0_36.work.edit == 0 or A0_36.work.edit == 2) and (A0_36.work.view == 0 or A0_36.work.view == 2) and (A0_36.work.find == 0 or A0_36.work.find == 2) and (A0_36.work.party == 0 or A0_36.work.party == 2) and A0_36.work.root == 2 then
      A0_36.work.root = 3
      desktopWidget:closeWidgetDirect(A0_36)
    else
      A0_36.work.closeOK = true
    end
  end
end
function PartyRootWidget.getPartyRoot(A0_37)
  local L1_38
  return A0_37
end
