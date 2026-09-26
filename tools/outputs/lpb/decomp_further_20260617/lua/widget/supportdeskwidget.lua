require("/Widget/WidgetBaseClass")
_defineClass("SupportDeskWidget", "WidgetBaseClass")
function SupportDeskWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "index"
  L5_5 = "integer8"
  L1_1._temp = L2_2
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = "ListBox_Information"
  L5_5 = "IsTabStop"
  L1_1(L2_2, L3_3, L4_4, L5_5, false)
  L4_4 = "ListBox_GMCall"
  L5_5 = "IsTabStop"
  L1_1(L2_2, L3_3, L4_4, L5_5, false)
  L4_4 = "UILuaCommands.PropertyChanged"
  L5_5 = 5
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = "Button_Header"
  L5_5 = "UILuaCommands.Operate"
  L1_1(L2_2, L3_3, L4_4, L5_5, 5)
  for L4_4 = 0, 5 do
    L5_5 = "Info_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:_addItem(nil, "ListBox_Information", "ControlTemplate_Header", L5_5)
    A0_0:setVisibility(L5_5, false)
    A0_0:_setProperty(nil, L5_5, "IsTabStop", false)
    A0_0:_setProperty(nil, L5_5 .. ":Button_Header", "CommandParameter", L4_4)
  end
  L4_4 = 3858
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "Info_0:TextBlock_Header"
  L5_5 = "FontStyle"
  L1_1(L2_2, L3_3, L4_4, L5_5, "Italic")
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  for L4_4 = 1, 1 do
    L5_5 = "Call_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:_addItem(nil, "ListBox_GMCall", "ControlTemplate_Header", L5_5)
    A0_0:setVisibility(L5_5, false)
    A0_0:_setProperty(nil, L5_5, "IsTabStop", false)
    A0_0:setIcon(L5_5 .. ":IconControl_KindIcon", 447)
    A0_0:_setProperty(nil, L5_5 .. ":Button_Header", "CommandParameter", 100 + L4_4)
  end
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
end
function SupportDeskWidget.setFocus(A0_6, A1_7)
  A0_6:setKeyboardFocusedControl(A1_7)
end
function SupportDeskWidget.displayTopic(A0_8)
  if A0_8:_getProperty(nil, "TextBlock_Topic", "Text") ~= "" then
    A0_8:setVisibility("Grid_Topic", true)
  else
    A0_8:setVisibility("Grid_Topic", false)
  end
end
function SupportDeskWidget.makeInformation(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
  L1_10 = A0_9._getProperty
  L5_14 = "Count"
  L1_10 = L1_10(L2_11, L3_12, L4_13, L5_14)
  if L1_10 == 0 then
    L5_14 = true
    L2_11(L3_12, L4_13, L5_14)
    L5_14 = 3859
    L2_11(L3_12, L4_13, L5_14)
    for L5_14 = 1, 5 do
      L6_15 = "Info_"
      L7_16 = tostring
      L8_17 = L5_14
      L7_16 = L7_16(L8_17)
      L6_15 = L6_15 .. L7_16
      L8_17 = A0_9
      L7_16 = A0_9.setVisibility
      L9_18 = L6_15
      L7_16(L8_17, L9_18, false)
    end
    L5_14 = 1
    L2_11(L3_12, L4_13, L5_14)
  else
    L5_14 = false
    L2_11(L3_12, L4_13, L5_14)
    for L5_14 = 1, L1_10 do
      L6_15 = "Info_"
      L7_16 = tostring
      L8_17 = L5_14
      L7_16 = L7_16(L8_17)
      L6_15 = L6_15 .. L7_16
      L8_17 = A0_9
      L7_16 = A0_9.getListProperty
      L9_18 = "Info_Maker"
      L7_16 = L7_16(L8_17, L9_18, L5_14 - 1, "kind")
      L8_17 = 0
      if L7_16 == 0 then
      elseif L7_16 == 1 then
        L8_17 = 449
      elseif L7_16 == 2 then
        L8_17 = 448
      elseif L7_16 == 3 then
        L8_17 = 449
      end
      if L8_17 == 0 then
        L9_18 = A0_9.setHidden
        L9_18(A0_9, L6_15 .. ":IconControl_KindIcon")
      else
        L9_18 = A0_9.setVisibility
        L9_18(A0_9, L6_15 .. ":IconControl_KindIcon", true)
        L9_18 = A0_9.setIcon
        L9_18(A0_9, L6_15 .. ":IconControl_KindIcon", L8_17)
      end
      L9_18 = A0_9.getListProperty
      L9_18 = L9_18(A0_9, "Info_Maker", L5_14 - 1, "header")
      A0_9:setText(L6_15 .. ":TextBlock_Header", L9_18)
      A0_9:setVisibility(L6_15, true)
    end
    L5_14 = 3856
    L6_15 = L1_10
    L2_11(L3_12, L4_13, L5_14, L6_15)
    L5_14 = 1
    L6_15 = 75902
    L2_11(L3_12, L4_13, L5_14, L6_15)
  end
  return L2_11
end
function SupportDeskWidget.makeGMCall(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28
  L1_20 = A0_19._getProperty
  L5_24 = "Count"
  L1_20 = L1_20(L2_21, L3_22, L4_23, L5_24)
  if L1_20 == 0 then
    L5_24 = false
    L2_21(L3_22, L4_23, L5_24)
  else
    for L5_24 = 1, 1 do
      L6_25 = "Call_"
      L7_26 = tostring
      L8_27 = L5_24
      L7_26 = L7_26(L8_27)
      L6_25 = L6_25 .. L7_26
      L8_27 = A0_19
      L7_26 = A0_19.getListProperty
      L9_28 = "Call_Maker"
      L7_26 = L7_26(L8_27, L9_28, L5_24 - 1, "kind")
      L8_27 = 0
      if L7_26 == 0 then
      elseif L7_26 == 1 then
        L8_27 = 449
      elseif L7_26 == 2 then
        L8_27 = 448
      elseif L7_26 == 3 then
        L8_27 = 449
      end
      if L8_27 == 0 then
        L9_28 = A0_19.setHidden
        L9_28(A0_19, L6_25 .. ":IconControl_KindIcon")
      else
        L9_28 = A0_19.setVisibility
        L9_28(A0_19, L6_25 .. ":IconControl_KindIcon", true)
        L9_28 = A0_19.setIcon
        L9_28(A0_19, L6_25 .. ":IconControl_KindIcon", L8_27)
      end
      L9_28 = A0_19.getListProperty
      L9_28 = L9_28(A0_19, "Call_Maker", L5_24 - 1, "header")
      A0_19:setText(L6_25 .. ":TextBlock_Header", L9_28)
      A0_19:setVisibility(L6_25, true)
    end
    L5_24 = true
    L2_21(L3_22, L4_23, L5_24)
  end
end
function SupportDeskWidget.processUICommandEvent(A0_29, A1_30, A2_31, A3_32, A4_33, A5_34)
  if A3_32 == "UILuaCommands.WidgetClose" then
    A0_29:setSignal(11)
    return desktopWidget:closeWidgetDirect(A0_29)
  end
  if A3_32 == "UILuaCommands.Cancel" then
    A0_29:setSignal(11)
    return desktopWidget:closeWidgetDirect(A0_29)
  end
  if A3_32 == "UILuaCommands.Operate" and A2_31 == "Button_Header" then
    A0_29.work.index = A4_33
    if A4_33 == 100 then
    else
    end
    if desktopWidget:openChildWidget("SupportDeskInformationWidget", A0_29, true, A4_33, A0_29) ~= nil then
      return (desktopWidget:openChildWidget("SupportDeskInformationWidget", A0_29, true, A4_33, A0_29))
    end
  end
  if A3_32 == "UILuaCommands.PropertyChanged" and A0_29:getSignal() == 2 then
    A0_29:displayTopic()
    A0_29:makeInformation()
    A0_29:makeGMCall()
    A0_29:setSignal(10)
  end
end
function SupportDeskWidget.setSignal(A0_35, A1_36)
  if A1_36 == 0 then
    return
  end
  A0_35:_setProperty(nil, "TextBlock_TopicTitle", "IntData.Value2", A1_36)
end
function SupportDeskWidget.getSignal(A0_37)
  return A0_37:_getProperty(nil, "TextBlock_TopicTitle", "IntData.Value2")
end
function SupportDeskWidget.getContent(A0_38)
  local L1_39, L2_40, L3_41, L4_42
  L1_39 = A0_38.work
  L1_39 = L1_39.index
  L1_39 = L1_39 - 1
  L2_40 = "Info_Maker"
  L3_41 = A0_38.work
  L3_41 = L3_41.index
  if L3_41 >= 100 then
    L3_41 = A0_38.work
    L3_41 = L3_41.index
    L3_41 = L3_41 - 100
    L1_39 = L3_41 - 1
    L2_40 = "Call_Maker"
  end
  L4_42 = A0_38
  L3_41 = A0_38.getListProperty
  L3_41 = L3_41(L4_42, L2_40, L1_39, "kind")
  L4_42 = A0_38.getListProperty
  L4_42 = L4_42(A0_38, L2_40, L1_39, "header")
  return L3_41, L4_42
end
function SupportDeskWidget.closeGMCall(A0_43)
  if A0_43.work.index >= 100 then
    A0_43:setFocus("Info_0")
  end
  return A0_43:setVisibility("Grid_GMCall", false)
end
function SupportDeskWidget.makeTestList(A0_44, A1_45, A2_46)
  local L3_47, L4_48
  L3_47 = 5
  L4_48 = 1
  if A1_45 ~= nil then
    L3_47 = A1_45
  end
  if A2_46 ~= nil then
    L4_48 = A2_46
  end
  for _FORV_8_ = 1, L3_47 do
    A0_44:setListProperty("Info_Maker", _FORV_8_ - 1, "kind", _FORV_8_ % 2 + 1)
    A0_44:setListProperty("Info_Maker", _FORV_8_ - 1, "header", _FORV_8_ % 2 + 1)
    if _FORV_8_ % 2 + 1 == 2 then
      A0_44:setListProperty("Info_Maker", _FORV_8_ - 1, "header", "\227\129\138\231\159\165\227\130\137\227\129\155\227\129\167\227\129\153\227\129\138\231\159\165\227\130\137\227\129\155\227\129\167\227\129\153\227\128\130")
    elseif _FORV_8_ % 2 + 1 == 1 then
      A0_44:setListProperty("Info_Maker", _FORV_8_ - 1, "header", "FAQ\227\129\167\227\129\153FAQ\227\129\167\227\129\153\227\128\130")
    end
  end
  A0_44:updateListProperty("Info_Maker")
  for _FORV_8_ = 1, L4_48 do
    A0_44:setListProperty("Call_Maker", _FORV_8_ - 1, "kind", 3)
    A0_44:setListProperty("Call_Maker", _FORV_8_ - 1, "header", "GMCallGMCallGMCallGMCallGMCallGMCallGMCallGMCall")
  end
  A0_44:updateListProperty("Call_Maker")
end
