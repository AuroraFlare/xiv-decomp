require("/Widget/WidgetBaseClass")
_defineClass("SupportDeskGMCallWidget", "WidgetBaseClass")
function SupportDeskGMCallWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "uieventok"
  L5_5 = "boolean"
  L1_1._temp = L2_2
  L1_1.uieventok = false
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = "UILuaCommands.Operate"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.Cancel"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.Operate"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.Cancel"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "ApplicationCommands.Operate"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "ApplicationCommands.Operate"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.Cancel"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.LostFocus"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.Cancel"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.LostFocus"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.Cancel"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.Cancel"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.PropertyChanged"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "UILuaCommands.SelectComboBoxItem"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  for L4_4 = 1, 8 do
    L5_5 = "Kind_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:setVisibility(L5_5, false)
  end
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "ComboBox_Kind"
  L5_5 = "IntData.Value1"
  L1_1(L2_2, L3_3, L4_4, L5_5, -1)
  L1_1(L2_2, L3_3)
end
function SupportDeskGMCallWidget.setFocus(A0_6, A1_7)
  A0_6:setKeyboardFocusedControl(A1_7)
end
function SupportDeskGMCallWidget.setSignal(A0_8, A1_9)
  if A1_9 == 0 then
    return
  end
  A0_8:_setProperty(nil, "Button_Send", "IntData.Value2", A1_9)
end
function SupportDeskGMCallWidget.getSignal(A0_10)
  return A0_10:_getProperty(nil, "Button_Send", "IntData.Value2")
end
function SupportDeskGMCallWidget.setData(A0_11)
  A0_11:_setProperty(nil, "ComboBox_Kind", "IntData.Value2", A0_11:_getProperty(nil, "ComboBox_Kind", "IntData.Value1") + 1)
  return
end
function SupportDeskGMCallWidget.makeKindmenu(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19
  L1_13 = A0_12._getProperty
  L5_17 = "Count"
  L1_13 = L1_13(L2_14, L3_15, L4_16, L5_17)
  if L1_13 == 0 then
    L5_17 = false
    L2_14(L3_15, L4_16, L5_17)
  else
    for L5_17 = 1, L1_13 do
      L7_19 = A0_12
      L6_18 = A0_12.getListProperty
      L6_18 = L6_18(L7_19, "Kind_Maker", L5_17 - 1, "kindtext")
      L7_19 = "Kind_"
      L7_19 = L7_19 .. tostring(L5_17)
      A0_12:setContent(L7_19, L6_18)
      A0_12:setVisibility(L7_19, true)
    end
    L5_17 = true
    L2_14(L3_15, L4_16, L5_17)
  end
end
function SupportDeskGMCallWidget.updateSendButton(A0_20)
  local L1_21
  L1_21 = true
  if A0_20:_getProperty(nil, "TextBox_Header", "Text") == "" then
    L1_21 = false
  end
  if A0_20:_getProperty(nil, "TextBox_Content", "Text") == "" then
    L1_21 = false
  end
  if A0_20:_getProperty(nil, "ComboBox_Kind", "IntData.Value1") < 0 then
    L1_21 = false
  end
  A0_20:setEnable("Button_Send", L1_21)
end
function SupportDeskGMCallWidget.processUICommandEvent(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27)
  local L6_28, L7_29
  if A3_25 == "UILuaCommands.PropertyChanged" then
    L7_29 = A0_22
    L6_28 = A0_22.getSignal
    L6_28 = L6_28(L7_29)
    if L6_28 == 2 then
      L7_29 = A0_22.makeKindmenu
      L7_29(A0_22)
      L7_29 = A0_22.setEnable
      L7_29(A0_22, "ComboBox_Kind", true)
      L7_29 = A0_22.work
      L7_29.uieventok = true
      L7_29 = A0_22.setSignal
      return L7_29(A0_22, 10)
    elseif L6_28 == 3 then
      L7_29 = A0_22.setSignal
      return L7_29(A0_22, 10)
    elseif L6_28 == 22 then
      L7_29 = A0_22._getParentWidget
      L7_29 = L7_29(A0_22)
      if L7_29 ~= nil and L7_29:getWindowName() == "SupportDeskInformationWidget" then
        return desktopWidget:closeWidgetDirect(L7_29)
      end
      A0_22:setSignal(11)
      return desktopWidget:closeWidgetDirect(A0_22)
    elseif L6_28 == 23 then
      L7_29 = A0_22.setSignal
      return L7_29(A0_22, 10)
    end
  end
  if A3_25 == "UILuaCommands.WidgetClose" then
    L7_29 = A0_22
    L6_28 = A0_22.setSignal
    L6_28(L7_29, 11)
    L6_28 = desktopWidget
    L7_29 = L6_28
    L6_28 = L6_28.closeWidgetDirect
    return L6_28(L7_29, A0_22)
  end
  L6_28 = A0_22.work
  L6_28 = L6_28.uieventok
  if L6_28 ~= true then
    L6_28 = false
    return L6_28
  end
  if A3_25 == "UILuaCommands.LostFocus" then
    L7_29 = A0_22
    L6_28 = A0_22.updateSendButton
    L6_28(L7_29)
  end
  if A3_25 == "UILuaCommands.Cancel" then
    L7_29 = A0_22
    L6_28 = A0_22.updateSendButton
    L6_28(L7_29)
    if A2_24 == "TextBox_Content" then
      L7_29 = A0_22
      L6_28 = A0_22.setFocus
      return L6_28(L7_29, "Border_Content")
    end
    if A2_24 == "Border_Content" then
      L7_29 = A0_22
      L6_28 = A0_22.setFocus
      return L6_28(L7_29, "Button_Abort")
    end
    if A2_24 == "Button_Send" then
      L7_29 = A0_22
      L6_28 = A0_22.setFocus
      return L6_28(L7_29, "Button_Abort")
    end
    if A2_24 == "TextBox_Header" then
      L7_29 = A0_22
      L6_28 = A0_22.setFocus
      return L6_28(L7_29, "Button_Abort")
    end
    if A2_24 == "ComboBox_Kind" then
      L7_29 = A0_22
      L6_28 = A0_22.setFocus
      return L6_28(L7_29, "Button_Abort")
    end
    if A2_24 == "Button_Abort" then
      L7_29 = A0_22
      L6_28 = A0_22.setSignal
      L6_28(L7_29, 11)
      L6_28 = desktopWidget
      L7_29 = L6_28
      L6_28 = L6_28.closeWidgetDirect
      return L6_28(L7_29, A0_22)
    end
  end
  if A3_25 == "ApplicationCommands.Operate" then
    L7_29 = A0_22
    L6_28 = A0_22.updateSendButton
    L6_28(L7_29)
    if A2_24 == "TextBox_Header" then
      L7_29 = A0_22
      L6_28 = A0_22.setFocus
      return L6_28(L7_29, "ComboBox_Kind")
    end
  end
  if A3_25 == "UILuaCommands.SelectComboBoxItem" and A2_24 == "ComboBox_Kind" then
    L7_29 = A0_22
    L6_28 = A0_22._getProperty
    L6_28 = L6_28(L7_29, nil, A2_24, "SelectedIndex")
    L7_29 = A0_22._setProperty
    L7_29(A0_22, nil, A2_24, "SelectedIndex", -1)
    L7_29 = A0_22._getProperty
    L7_29 = L7_29(A0_22, nil, A2_24, "IntData.Value1")
    if L6_28 ~= L7_29 and L6_28 > -1 then
      L7_29 = A0_22._setProperty
      L7_29(A0_22, nil, A2_24, "IntData.Value1", L6_28)
      L7_29 = A0_22.updateSendButton
      L7_29(A0_22)
    end
  end
  if A3_25 == "UILuaCommands.Operate" then
    L7_29 = A0_22
    L6_28 = A0_22.updateSendButton
    L6_28(L7_29)
    if A2_24 == "Button_Abort" then
      L7_29 = A0_22
      L6_28 = A0_22.setSignal
      L6_28(L7_29, 11)
      L6_28 = desktopWidget
      L7_29 = L6_28
      L6_28 = L6_28.closeWidgetDirect
      return L6_28(L7_29, A0_22)
    end
    if A2_24 == "Button_Send" then
      L7_29 = A0_22
      L6_28 = A0_22._getProperty
      L6_28 = L6_28(L7_29, nil, "TextBox_Header", "Text")
      if L6_28 ~= "" then
        L7_29 = A0_22
        L6_28 = A0_22._getProperty
        L6_28 = L6_28(L7_29, nil, "TextBox_Content", "Text")
        if L6_28 ~= "" then
          L7_29 = A0_22
          L6_28 = A0_22._getProperty
          L6_28 = L6_28(L7_29, nil, "ComboBox_Kind", "IntData.Value1")
        end
      elseif L6_28 < 0 then
        L6_28 = false
        return L6_28
      end
      L7_29 = A0_22
      L6_28 = A0_22.setData
      L6_28(L7_29)
      L7_29 = A0_22
      L6_28 = A0_22.setSignal
      return L6_28(L7_29, 21)
    end
  end
end
function SupportDeskGMCallWidget.makeTestList(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L5_35, L6_36
  L2_32 = 8
  if A1_31 ~= nil then
    L2_32 = A1_31
  end
  for L6_36 = 1, L2_32 do
    A0_30:setListProperty("Kind_Maker", L6_36 - 1, "kindtext", "\227\131\151\227\131\171\227\131\128\227\130\166\227\131\179\227\129\157\227\129\174" .. tostring(L6_36))
  end
  L3_33(L4_34, L5_35)
end
