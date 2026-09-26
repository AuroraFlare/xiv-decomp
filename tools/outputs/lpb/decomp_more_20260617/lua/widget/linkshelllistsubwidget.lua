require("/Widget/WidgetBaseClass")
_defineClass("LinkshellListSubWidget", "WidgetBaseClass")
function LinkshellListSubWidget.init(A0_0, A1_1, A2_2, A3_3)
  A0_0.work._temp = {
    {"index", "integer8"}
  }
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setConfirmCondition("Button_6")
  if worldMaster:_getMyPlayer():getCommunityGroupCurrent(20002) == worldMaster:_getMyPlayer():getCommunityGroup(20002, A1_1) then
    A0_0:setConfirmCondition("Button_1")
    A0_0:setConfirmCondition("Button_2")
    A0_0:setConfirmCondition("Button_4")
    A0_0:setVisibility("Button_3", false)
    if desktopWidget:isMyCurrnetLinkshell() == false then
      A0_0:setConfirmCondition("Button_5")
    else
      A0_0:setVisibility("Button_5", false)
    end
  else
    A0_0:setConfirmCondition("Button_3")
    A0_0:setVisibility("Button_1", false)
    A0_0:setVisibility("Button_2", false)
    A0_0:setVisibility("Button_4", false)
    A0_0:setVisibility("Button_5", false)
  end
  A0_0:setModal(true)
  A0_0:setWindowPosition(A2_2, A3_3)
  A0_0.work.index = A1_1
end
function LinkshellListSubWidget.setButton(A0_4, A1_5, A2_6)
  if A2_6 == true then
    A0_4:setConfirmCondition(A1_5)
  else
    A0_4:setVisibility(A1_5, false)
  end
end
function LinkshellListSubWidget.processUICommandCancel(A0_7, A1_8, A2_9, A3_10, A4_11)
  A0_7:setParentBorder()
  desktopWidget:closeWidgetDirect(A0_7)
  return
end
function LinkshellListSubWidget.processUICommandOperate(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17, L6_18, L7_19
  L5_17 = A2_14
  if L5_17 == "Button_1" then
    L6_18 = desktopWidget
    L7_19 = L6_18
    L6_18 = L6_18.isValidCurrnetLinkshell
    L6_18 = L6_18(L7_19)
    if L6_18 == true then
      L6_18 = desktopWidget
      L7_19 = L6_18
      L6_18 = L6_18.getStaticWidget
      L6_18 = L6_18(L7_19, 2)
      L7_19 = L6_18.setChatMode
      L7_19(L6_18, 5)
      L7_19 = desktopWidget
      L7_19 = L7_19.changeFocusedWidget
      L7_19(L7_19, L6_18)
      do break end
      else
      end
      if L5_17 == "Button_2" then
        L6_18 = desktopWidget
        L7_19 = L6_18
        L6_18 = L6_18.isValidCurrnetLinkshell
        L6_18 = L6_18(L7_19)
        if L6_18 == true then
          L6_18 = desktopWidget
          L7_19 = L6_18
          L6_18 = L6_18.openChildWidget
          L6_18(L7_19, "LinkshellMembersListWidget", A0_12, true)
          do break end
          else
          end
          if L5_17 == "Button_3" then
            L6_18 = worldMaster
            L7_19 = L6_18
            L6_18 = L6_18._getMyPlayer
            L6_18 = L6_18(L7_19)
            L7_19 = L6_18.getCommunityGroup
            L7_19 = L7_19(L6_18, 20002, A0_12.work.index)
            if desktopWidget:executePlayerSetCurrentLinkshell(L7_19) == true then
              A0_12:setParentBorder()
              desktopWidget:closeWidgetDirect(A0_12)
              do return end
              do break end
              else
              end
              if L5_17 == "Button_4" then
                L6_18 = desktopWidget
                L7_19 = L6_18
                L6_18 = L6_18.executePlayerSetCurrentLinkshell
                L6_18 = L6_18(L7_19)
                if L6_18 == true then
                  L7_19 = A0_12
                  L6_18 = A0_12.setParentBorder
                  L6_18(L7_19)
                  L6_18 = desktopWidget
                  L7_19 = L6_18
                  L6_18 = L6_18.closeWidgetDirect
                  L6_18(L7_19, A0_12)
                  do return end
                  do break end
                  else
                  end
                  if L5_17 == "Button_5" then
                    L6_18 = desktopWidget
                    L7_19 = L6_18
                    L6_18 = L6_18.isValidCurrnetLinkshell
                    L6_18 = L6_18(L7_19)
                    if L6_18 == true then
                      L6_18 = desktopWidget
                      L7_19 = L6_18
                      L6_18 = L6_18.openChildWidget
                      L6_18(L7_19, "CommonDialogWidget", A0_12, true, nil, 1213, 2, 2)
                      do break end
                      else
                      end
                      if L5_17 == "Button_6" then
                        L7_19 = A0_12
                        L6_18 = A0_12.setParentBorder
                        L6_18(L7_19)
                        L6_18 = desktopWidget
                        L7_19 = L6_18
                        L6_18 = L6_18.closeWidgetDirect
                        L6_18(L7_19, A0_12)
                        break
                      else
                      end
                    else
                    end
                else
                end
            else
            end
        else
        end
    else
    end
end
function LinkshellListSubWidget.processAskResult(A0_20, A1_21)
  if A1_21 == 1 then
    if desktopWidget:isValidCurrnetLinkshell() == true and desktopWidget:isMyCurrnetLinkshell() == false then
      desktopWidget:executePlayerLinkshellResign()
    else
    end
    A0_20:setParentBorder()
    desktopWidget:closeWidgetDirect(A0_20)
  end
end
function LinkshellListSubWidget.setParentBorder(A0_22)
  if A0_22:_getParentWidget() ~= nil then
    A0_22:_getParentWidget():setBorder(-1)
  end
end
