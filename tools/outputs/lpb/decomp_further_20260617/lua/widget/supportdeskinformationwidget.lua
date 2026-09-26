require("/Widget/WidgetBaseClass")
_defineClass("SupportDeskInformationWidget", "WidgetBaseClass")
function SupportDeskInformationWidget.init(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = A0_0.work
  L4_4 = {
    {"uieventok", "boolean"},
    {"kind", "integer8"}
  }
  L3_3._temp = L4_4
  L3_3 = A0_0.work
  L3_3.uieventok = false
  L4_4 = A0_0
  L3_3 = A0_0.setCancelCondition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setCloseCondition
  L3_3(L4_4)
  L4_4 = A0_0
  L3_3 = A0_0.setModal
  L3_3(L4_4, true)
  L4_4 = A0_0
  L3_3 = A0_0.setDrag
  L3_3(L4_4, true)
  L4_4 = A0_0
  L3_3 = A0_0._setUICommandCondition
  L3_3(L4_4, "Button_Call", "UILuaCommands.Operate", 5)
  L4_4 = A0_0
  L3_3 = A0_0._setUICommandCondition
  L3_3(L4_4, "Button_Close", "UILuaCommands.Operate", 5)
  L4_4 = A0_0
  L3_3 = A0_0._setUICommandCondition
  L3_3(L4_4, "Button_Call", "UILuaCommands.PropertyChanged", 5)
  L4_4 = A0_0
  L3_3 = A0_0.setUICommandCondition
  L3_3(L4_4, "ApplicationCommands.MoveFocus")
  L4_4 = A0_0
  L3_3 = A0_0.getContent
  L4_4 = L3_3(L4_4, A2_2)
  A0_0.work.kind = L3_3
  if A1_1 ~= nil then
    A0_0:_setProperty(nil, "Button_Call", "IntData.Value3", A1_1)
  end
  A0_0:setContent("Button_Call", 3826)
  A0_0:setContent("Button_Close", 3825)
  if L3_3 == 0 then
    A0_0:setText("TextBlock_Title", "")
    A0_0:setHidden("IconControl_KindIcon")
  elseif L3_3 == 1 then
    A0_0:setText("TextBlock_Title", 3808)
    A0_0:setIcon("IconControl_KindIcon", 449)
  elseif L3_3 == 2 then
    A0_0:setText("TextBlock_Title", 3855)
    A0_0:setIcon("IconControl_KindIcon", 448)
  elseif L3_3 == 3 then
    A0_0:setText("TextBlock_Title", 3857)
    A0_0:setIcon("IconControl_KindIcon", 447)
    A0_0:setContent("Button_Call", 3816)
    A0_0:setContent("Button_Close", 3817)
  end
  A0_0:setText("TextBlock_Header", L4_4)
  A0_0:setSignal(1)
end
function SupportDeskInformationWidget.setFocus(A0_5, A1_6)
  A0_5:setKeyboardFocusedControl(A1_6)
end
function SupportDeskInformationWidget.setSignal(A0_7, A1_8)
  if A1_8 == 0 then
    return
  end
  A0_7:_setProperty(nil, "Button_Call", "IntData.Value2", A1_8)
end
function SupportDeskInformationWidget.getSignal(A0_9)
  return A0_9:_getProperty(nil, "Button_Call", "IntData.Value2")
end
function SupportDeskInformationWidget.getContent(A0_10, A1_11)
  local L2_12, L3_13
  L2_12 = 0
  L3_13 = ""
  if A1_11 ~= nil then
    L2_12, L3_13 = A1_11:getContent()
  end
  return L2_12, L3_13
end
function SupportDeskInformationWidget.processUICommandEvent(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19)
  if A3_17 == "UILuaCommands.PropertyChanged" then
    if A0_14:getSignal() == 2 then
      A0_14.work.uieventok = true
      return A0_14:setSignal(10)
    elseif A0_14:getSignal() == 3 then
      A0_14.work.uieventok = true
      return A0_14:setSignal(10)
    elseif A0_14:getSignal() == 22 then
      if A0_14:_getParentWidget() ~= nil then
        A0_14:_getParentWidget():closeGMCall()
      end
      return desktopWidget:closeWidgetDirect(A0_14)
    end
  end
  if A3_17 == "UILuaCommands.WidgetClose" then
    if A0_14.work.kind == 3 then
      return
    end
    A0_14:setSignal(11)
    return desktopWidget:closeWidgetDirect(A0_14)
  end
  if A0_14.work.uieventok ~= true then
    return false
  end
  if A3_17 == "UILuaCommands.Cancel" then
    if A0_14.work.kind == 3 then
      return
    end
    A0_14:setSignal(11)
    return desktopWidget:closeWidgetDirect(A0_14)
  end
  if A3_17 == "UILuaCommands.Operate" then
    if A2_16 == "Button_Close" then
      if A0_14.work.kind == 3 then
        return A0_14:setSignal(21)
      else
        return desktopWidget:closeWidgetDirect(A0_14)
      end
    end
    if A2_16 == "Button_Call" and A0_14.work.uieventok == true and desktopWidget:openChildWidget("SupportDeskGMCallWidget", A0_14, true) ~= nil then
      return (desktopWidget:openChildWidget("SupportDeskGMCallWidget", A0_14, true))
    end
  end
end
