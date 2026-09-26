require("/Widget/WidgetBaseClass")
_defineClass("AddressListWidget", "WidgetBaseClass")
function AddressListWidget.init(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L2_2 = A0_0.work
  L3_3 = {
    L4_4,
    L5_5,
    L6_6,
    L7_7
  }
  L4_4 = {L5_5, L6_6}
  L5_5 = "chosenOperation"
  L5_5 = {L6_6, L7_7}
  L9_9 = "integer8"
  L2_2._temp = L3_3
  L2_2 = A0_0.work
  L2_2.chosenOperation = 0
  L2_2 = A0_0.work
  L2_2.listindex = -1
  L2_2 = 20
  L3_3 = desktopWidget
  L4_4 = L3_3
  L3_3 = L3_3.getWindowSize
  L4_4 = L3_3(L4_4)
  if L3_3 == 640 and L4_4 == 480 then
    L2_2 = 24
  end
  L5_5 = A0_0.getControlProperty
  L5_5 = L5_5(L6_6, L7_7, L8_8)
  L6_6.iteminpage = L7_7
  L6_6(L7_7)
  L6_6(L7_7)
  L6_6(L7_7, L8_8)
  L6_6(L7_7, L8_8)
  L6_6(L7_7, L8_8)
  L9_9 = "UILuaCommands.PropertyChanged"
  L6_6(L7_7, L8_8, L9_9)
  L6_6(L7_7, L8_8)
  L6_6(L7_7, L8_8)
  L9_9 = "UILuaCommands.Previous"
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = "UILuaCommands.Next"
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = "UILuaCommands.Add"
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = "IsTabStop"
  L10_10 = false
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L9_9 = "Button_Address"
  L6_6(L7_7, L8_8, L9_9)
  for L9_9 = 1, L7_7.iteminpage do
    L10_10 = "Address_"
    L10_10 = L10_10 .. tostring(L9_9)
    A0_0:_addItem(nil, "ListBox_Address", "ControlTemplate_Address", L10_10)
    A0_0:setVisibility(L10_10, false)
    A0_0:setControlProperty(L10_10, "IsTabStop", false)
    A0_0:setControlProperty(L10_10 .. ":Button_Address", "CommandParameter", L9_9)
    A0_0:setHelpParameter(L10_10 .. ":IconControl_Status", 1, 75515, nil, nil, nil)
  end
  L9_9 = false
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = false
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = 3720
  L10_10 = 200
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L9_9 = ""
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = "@"
  L10_10 = tostring
  L10_10 = L10_10(3702)
  L9_9 = L9_9 .. L10_10
  L6_6(L7_7, L8_8, L9_9)
  L6_6(L7_7, L8_8)
  L6_6(L7_7, L8_8)
  L6_6.page = 0
  L6_6(L7_7, L8_8)
end
function AddressListWidget.setFocus(A0_11, A1_12)
  if A1_12 ~= nil and A1_12 ~= "" then
    A0_11:setLogicalFocus(A1_12)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_11 then
      A0_11:setKeyboardFocusedControl(A1_12)
    end
  end
end
function AddressListWidget.processUICommandEvent(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18)
  local L6_19
  if A3_16 == "UILuaCommands.PropertyChanged" then
    L6_19 = A0_13.getSignal
    L6_19 = L6_19(A0_13)
    if L6_19 == 2 or L6_19 == 22 or L6_19 == 32 then
      A0_13:makeThisPage()
      return A0_13:setSignal(10)
    elseif L6_19 == 3 or L6_19 == 23 or L6_19 == 33 then
      return A0_13:setSignal(10)
    end
  end
  L6_19 = A0_13.getSignal
  L6_19 = L6_19(A0_13)
  if L6_19 == 21 then
    return
  else
    L6_19 = A0_13.getSignal
    L6_19 = L6_19(A0_13)
    if L6_19 == 31 then
      return
    end
  end
  if A3_16 == "UILuaCommands.WidgetClose" then
    L6_19 = A0_13.setSignal
    L6_19(A0_13, 11)
    L6_19 = desktopWidget
    L6_19 = L6_19.closeWidgetDirect
    return L6_19(L6_19, A0_13)
  end
  if A3_16 == "UILuaCommands.Cancel" then
    if A2_15 == "ListBox_Address" then
      L6_19 = A0_13.getAddressListMax
      L6_19 = L6_19(A0_13)
      if L6_19 == 200 then
        L6_19 = A0_13.setSignal
        L6_19(A0_13, 11)
        L6_19 = desktopWidget
        L6_19 = L6_19.closeWidgetDirect
        return L6_19(L6_19, A0_13)
      else
        L6_19 = A0_13.setFocus
        return L6_19(A0_13, "Button_Add")
      end
    else
      L6_19 = A0_13.setSignal
      L6_19(A0_13, 11)
      L6_19 = desktopWidget
      L6_19 = L6_19.closeWidgetDirect
      return L6_19(L6_19, A0_13)
    end
  end
  if A3_16 == "UILuaCommands.Previous" then
    L6_19 = A0_13.getEnable
    L6_19 = L6_19(A0_13, "Button_Previous")
    if L6_19 == true then
      L6_19 = A0_13.work
      L6_19.page = A0_13.work.page - 1
      L6_19 = A0_13.pageSe
      L6_19(A0_13)
      L6_19 = A0_13.makeThisPage
      return L6_19(A0_13)
    end
  end
  if A3_16 == "UILuaCommands.Next" then
    L6_19 = A0_13.getEnable
    L6_19 = L6_19(A0_13, "Button_Next")
    if L6_19 == true then
      L6_19 = A0_13.work
      L6_19.page = A0_13.work.page + 1
      L6_19 = A0_13.pageSe
      L6_19(A0_13)
      L6_19 = A0_13.makeThisPage
      return L6_19(A0_13)
    end
  end
  if A3_16 == "UILuaCommands.Add" then
    L6_19 = A0_13.setFocus
    return L6_19(A0_13, "Button_Add")
  end
  if A3_16 == "UILuaCommands.Operate" then
    if A2_15 == "Button_Add" then
      L6_19 = A0_13.setLogicalFocus
      L6_19(A0_13, A2_15)
      L6_19 = desktopWidget
      L6_19 = L6_19.openChildWidget
      L6_19 = L6_19(L6_19, "AddressListNamingWidget", A0_13, true, 0, nil, A0_13:ignoreFamilyName())
      if L6_19 == true then
        return L6_19
      end
    end
    if A2_15 == "Button_Previous" then
      L6_19 = A0_13.work
      L6_19.page = A0_13.work.page - 1
      L6_19 = A0_13.pageSe
      L6_19(A0_13)
      L6_19 = A0_13.makeThisPage
      return L6_19(A0_13)
    end
    if A2_15 == "Button_Next" then
      L6_19 = A0_13.work
      L6_19.page = A0_13.work.page + 1
      L6_19 = A0_13.pageSe
      L6_19(A0_13)
      L6_19 = A0_13.makeThisPage
      return L6_19(A0_13)
    else
      if A4_17 == nil then
        return
      end
      if A4_17 > 0 then
        L6_19 = A0_13.work
        L6_19.listindex = A0_13.work.page * A0_13.work.iteminpage + A4_17
        L6_19 = A0_13.work
        L6_19 = L6_19.listindex
        if L6_19 > A0_13:getAddressListMax() then
          L6_19 = A0_13.makeThisPage
          return L6_19(A0_13)
        end
        L6_19 = A0_13.setLogicalFocus
        L6_19(A0_13, "Address_" .. tostring(A4_17))
        L6_19 = A0_13.getChildWidgetByWindowName
        L6_19 = L6_19(A0_13, "AddressListSubWidget")
        if L6_19 ~= nil then
          A0_13:setBorder(A4_17)
          L6_19:setMode(0, A4_17, A0_13, A0_13:isPartyEnable())
          L6_19:show()
        else
          L6_19 = desktopWidget:openChildWidget("AddressListSubWidget", A0_13, true, 0, A4_17, A0_13, A0_13:isPartyEnable())
        end
        if L6_19 == true then
          A0_13:setBorder(A4_17)
          return L6_19
        end
      end
    end
  end
end
function AddressListWidget.pageSe(A0_20)
  A0_20:sendControlCommand("TextBlock_Total", "Page")
end
function AddressListWidget.makeThisPage(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38
  L2_23 = A0_21
  L1_22 = A0_21.getAddressListMax
  L1_22 = L1_22(L2_23)
  L2_23 = 0
  L3_24 = true
  L4_25 = true
  if L1_22 == 0 then
    L8_29 = ""
    L5_26(L6_27, L7_28, L8_29)
    L5_26(L6_27, L7_28)
    L8_29 = true
    L5_26(L6_27, L7_28, L8_29)
    for L8_29 = 1, L6_27.iteminpage do
      L12_33 = L9_30
      L13_34 = false
      L10_31(L11_32, L12_33, L13_34)
    end
    L8_29 = false
    L5_26(L6_27, L7_28, L8_29)
    L8_29 = false
    L5_26(L6_27, L7_28, L8_29)
    L8_29 = true
    L5_26(L6_27, L7_28, L8_29)
    L5_26(L6_27, L7_28)
    return L5_26
  else
    L8_29 = false
    L5_26(L6_27, L7_28, L8_29)
    L8_29 = "AnchoredIndex"
    L8_29 = A0_21.work
    L8_29 = L8_29.iteminpage
    if L6_27 < L7_28 then
      L7_28.page = L6_27
    elseif L7_28 < 0 then
      L7_28.page = 0
    end
    L8_29 = A0_21
    if L7_28 == "Button_Previous" then
      L2_23 = 1
    else
      L8_29 = A0_21
      if L7_28 == "Button_Next" then
        L2_23 = 2
      end
    end
    if L7_28 == 0 then
      L8_29 = A0_21
      L7_28(L8_29, L9_30, L10_31)
      L4_25 = false
    else
      L8_29 = A0_21
      L7_28(L8_29, L9_30, L10_31)
      L4_25 = true
    end
    if L7_28 == L6_27 then
      L8_29 = A0_21
      L7_28(L8_29, L9_30, L10_31)
      L3_24 = false
    else
      L8_29 = A0_21
      L7_28(L8_29, L9_30, L10_31)
      L3_24 = true
    end
    L8_29 = A0_21.work
    L8_29 = L8_29.iteminpage
    L8_29 = A0_21.work
    L8_29 = L8_29.iteminpage
    L8_29 = L7_28 + L8_29
    L8_29 = L8_29 - 1
    if L1_22 < L8_29 then
      L8_29 = L1_22
    end
    L12_33 = 3745
    L13_34 = L7_28
    L14_35 = L8_29
    L15_36 = L1_22
    L9_30(L10_31, L11_32, L12_33, L13_34, L14_35, L15_36)
    L12_33 = true
    L9_30(L10_31, L11_32, L12_33)
    for L12_33 = 1, L10_31.iteminpage do
      L13_34 = "Address_"
      L14_35 = tostring
      L15_36 = L12_33
      L14_35 = L14_35(L15_36)
      L13_34 = L13_34 .. L14_35
      L14_35 = L7_28 + L12_33
      L14_35 = L14_35 - 1
      if L1_22 >= L14_35 then
        L16_37 = A0_21
        L15_36 = A0_21.setVisibility
        L17_38 = L13_34
        L15_36(L16_37, L17_38, true)
        L16_37 = A0_21
        L15_36 = A0_21.getAddressName
        L17_38 = L14_35
        L16_37 = L15_36(L16_37, L17_38)
        L17_38 = A0_21.setText
        L17_38(A0_21, L13_34 .. ":TextBlock_Name", 230, L15_36)
        L17_38 = 386
        if L16_37 == 1 then
          L17_38 = 385
        end
        A0_21:setIcon(L13_34 .. ":IconControl_Status", L17_38)
      else
        if L5_26 >= L12_33 then
          if L2_23 == 0 then
            L16_37 = A0_21
            L15_36 = A0_21.setFocus
            L17_38 = "Address_"
            L17_38 = L17_38 .. tostring(L5_26)
            L15_36(L16_37, L17_38)
          end
        end
        L16_37 = A0_21
        L15_36 = A0_21.setVisibility
        L17_38 = L13_34
        L15_36(L16_37, L17_38, false)
      end
    end
    if L2_23 == 1 then
      if L4_25 == true then
        L9_30(L10_31, L11_32)
      elseif L3_24 == true then
        L9_30(L10_31, L11_32)
      else
        L9_30(L10_31, L11_32)
      end
    elseif L2_23 == 2 then
      if L3_24 == true then
        L9_30(L10_31, L11_32)
      elseif L4_25 == true then
        L9_30(L10_31, L11_32)
      else
        L9_30(L10_31, L11_32)
      end
    end
  end
  if L1_22 == 200 then
    L8_29 = false
    L5_26(L6_27, L7_28, L8_29)
  else
    L8_29 = true
    L5_26(L6_27, L7_28, L8_29)
  end
  return
end
function AddressListWidget.getAddressListMax(A0_39)
  return A0_39:getControlProperty("Address_Maker", "Count")
end
function AddressListWidget.setSignal(A0_40, A1_41)
  if A1_41 == 0 then
    return
  end
  A0_40:setControlProperty("Button_Add", "IntData.Value2", A1_41)
end
function AddressListWidget.getSignal(A0_42)
  return A0_42:getControlProperty("Button_Add", "IntData.Value2")
end
function AddressListWidget.ignoreFamilyName(A0_43)
  return A0_43:getControlProperty("Button_Add", "IntData.Value3")
end
function AddressListWidget.setSubWindowOperation(A0_44, A1_45, A2_46)
  if A1_45 == 0 then
    return
  elseif A1_45 == 21 then
    return A0_44:deleteRequest(A0_44.work.listindex)
  elseif A1_45 == 31 then
    return A0_44:addRequest(A2_46)
  end
end
function AddressListWidget.deleteRequest(A0_47, A1_48)
  local L2_49
  L2_49 = A0_47.getAddressListMax
  L2_49 = L2_49(A0_47)
  if A1_48 > L2_49 then
    return
  end
  L2_49 = A0_47.getListProperty
  L2_49 = L2_49(A0_47, "Address_Maker", A1_48 - 1, "name")
  A0_47:setControlProperty("Button_Add", "StringData.Value2", L2_49)
  A0_47:setSignal(21)
end
function AddressListWidget.addRequest(A0_50, A1_51)
  if A1_51 == "" or A1_51 == nil then
    return
  end
  A0_50:setControlProperty("Button_Add", "StringData.Value2", A1_51)
  A0_50:setSignal(31)
end
function AddressListWidget.getAddressName(A0_52, A1_53)
  local L2_54, L3_55, L4_56
  if A1_53 ~= nil then
    L2_54 = A1_53
  else
    L3_55 = A0_52.work
    L2_54 = L3_55.listindex
  end
  if L2_54 < 1 then
    L3_55 = ""
    L4_56 = 0
    return L3_55, L4_56
  end
  L4_56 = A0_52
  L3_55 = A0_52.getListProperty
  L3_55 = L3_55(L4_56, "Address_Maker", L2_54 - 1, "name")
  L4_56 = A0_52.getListProperty
  L4_56 = L4_56(A0_52, "Address_Maker", L2_54 - 1, "online")
  return L3_55, L4_56
end
function AddressListWidget.makeTestList(A0_57, A1_58)
  local L2_59, L3_60, L4_61, L5_62, L6_63
  L2_59 = 25
  if A1_58 ~= nil then
    L2_59 = A1_58
  end
  for L6_63 = 0, L2_59 do
    A0_57:setListProperty("Address_Maker", L6_63, "name", "name" .. tostring(L6_63))
    A0_57:setListProperty("Address_Maker", L6_63, "online", L6_63 % 2)
  end
  L3_60(L4_61, L5_62)
end
function AddressListWidget.isPartyEnable(A0_64)
  local L1_65
  L1_65 = A0_64.getAddressName
  L1_65 = L1_65(A0_64)
  if L1_65(A0_64) == 0 then
    return false
  end
  if A0_64:isPartyMember(L1_65) == true then
    return false
  end
  if desktopWidget:getPlayerConfirmGroupCommandVariation() == 10001 or desktopWidget:getPlayerConfirmGroupCommandVariation() == 10002 then
    return false
  elseif desktopWidget:countPartyMember() <= 1 then
    return true
  elseif desktopWidget:isMyPartyLeaderForMyPlayer() == false then
    return false
  elseif desktopWidget:countPartyMember() == 8 then
    return false
  else
    return true
  end
end
function AddressListWidget.isPartyMember(A0_66, A1_67)
  local L2_68, L3_69, L4_70, L5_71, L6_72
  L2_68 = desktopWidget
  L2_68 = L2_68.countPartyMember
  L2_68 = L2_68(L3_69)
  for L6_72 = 1, L2_68 do
    if desktopWidget:getPartyMemberDisplayName(L6_72) == A1_67 then
      return true
    end
  end
  return L3_69
end
function AddressListWidget.update(A0_73, A1_74)
  local L2_75, L3_76
  L3_76 = A0_73
  L2_75 = A0_73.updateSubWidgetPartyCommand
  L2_75(L3_76, A0_73:isPartyEnable())
end
function AddressListWidget.updateVariation(A0_77)
  local L1_78, L2_79
  L2_79 = A0_77
  L1_78 = A0_77.updateSubWidgetPartyCommand
  L1_78(L2_79, A0_77:isPartyEnable())
end
function AddressListWidget.updateSubWidgetPartyCommand(A0_80, A1_81)
  if A0_80:getChildWidgetByWindowName("AddressListSubWidget") ~= nil then
    A0_80:getChildWidgetByWindowName("AddressListSubWidget"):setPartyEnable(A1_81)
  end
end
function AddressListWidget.setBorder(A0_82, A1_83)
  local L2_84, L3_85, L4_86, L5_87
  if A1_83 < 0 then
    for L5_87 = 1, L3_85.iteminpage do
      A0_82:setVisibility("Address_" .. tostring(L5_87) .. ":Border_ItemSelected", false)
    end
  else
    L5_87 = tostring
    L5_87 = L5_87(A1_83)
    L5_87 = true
    L2_84(L3_85, L4_86, L5_87)
  end
end
