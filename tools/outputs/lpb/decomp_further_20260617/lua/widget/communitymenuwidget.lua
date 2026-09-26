require("/Widget/WidgetBaseClass")
_defineClass("CommunityMenuWidget", "WidgetBaseClass")
function CommunityMenuWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5)
  A0_0.work._temp = {}
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:_setUICommandCondition("Button_AddressList", "UILuaCommands.Operate", 5)
  A0_0:_setUICommandCondition("Button_IgnoreList", "UILuaCommands.Operate", 5)
  A0_0:setModal(true)
  A0_0:setDrag(true)
end
function CommunityMenuWidget.setFocus(A0_6, A1_7)
  A0_6:setProperty("LogicalFocus", A1_7)
  return A0_6:setKeyboardFocusedControl(A1_7)
end
function CommunityMenuWidget.processUICommandEvent(A0_8, A1_9, A2_10, A3_11, A4_12, A5_13)
  if A3_11 == "UILuaCommands.WidgetClose" then
    return desktopWidget:closeWidgetDirect(A0_8)
  end
  if A3_11 == "UILuaCommands.Cancel" then
    return desktopWidget:closeWidgetDirect(A0_8)
  end
  if A3_11 == "UILuaCommands.Operate" then
    if A2_10 == "Button_AddressList" and desktopWidget:openChildWidget("AddressListWidget", A0_8, true) ~= nil then
      return (desktopWidget:openChildWidget("AddressListWidget", A0_8, true))
    end
    if A2_10 == "Button_IgnoreList" and desktopWidget:openChildWidget("IgnoreListWidget", A0_8, true) ~= nil then
      return (desktopWidget:openChildWidget("IgnoreListWidget", A0_8, true))
    end
  end
end
