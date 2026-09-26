require("/Widget/WidgetBaseClass")
_defineClass("AddressListSubWidget", "WidgetBaseClass")
function AddressListSubWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4)
  A0_0.work._temp = {
    {"mode", "integer8"},
    {"error", "boolean"},
    {"party", "integer8"}
  }
  A0_0.work.error = false
  A0_0:setCancelCondition()
  A0_0:setConfirmCondition("Button_Tell")
  A0_0:setConfirmCondition("Button_Letter")
  A0_0:setConfirmCondition("Button_Party")
  A0_0:setConfirmCondition("Button_Delete")
  A0_0:setConfirmCondition("Button_Close")
  A0_0:setContent("Button_Close", 1230)
  A0_0:setMode(A1_1, A2_2, A3_3, A4_4)
  A0_0:setModal(true)
  A0_0:setDrag(true)
end
function AddressListSubWidget.setMode(A0_5, A1_6, A2_7, A3_8, A4_9)
  local L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16
  if A1_6 ~= nil then
    L5_10 = A0_5.work
    L5_10.mode = A1_6
  else
    L5_10 = A0_5.work
    L5_10.mode = 0
  end
  L5_10 = 0
  L6_11 = 0
  L7_12 = 0
  L6_11 = 120
  L9_14 = A0_5
  L8_13 = A0_5.setProperty
  L10_15 = "Margin"
  L11_16 = "0,0,0,0"
  L8_13(L9_14, L10_15, L11_16)
  L8_13 = A0_5.work
  L8_13 = L8_13.mode
  if L8_13 == 1 then
    L8_13 = A0_5.work
    L8_13.party = 0
    L9_14 = A0_5
    L8_13 = A0_5.setVisibility
    L10_15 = "Button_Tell"
    L11_16 = false
    L8_13(L9_14, L10_15, L11_16)
    L9_14 = A0_5
    L8_13 = A0_5.setVisibility
    L10_15 = "Button_Letter"
    L11_16 = false
    L8_13(L9_14, L10_15, L11_16)
    L9_14 = A0_5
    L8_13 = A0_5.setVisibility
    L10_15 = "Button_Party"
    L11_16 = false
    L8_13(L9_14, L10_15, L11_16)
    L5_10 = 20
    L7_12 = 40
    L9_14 = A3_8
    L8_13 = A3_8.getAddressName
    L9_14 = L8_13(L9_14)
    if L8_13 == 0 or L8_13 == "" or L8_13 == nil then
      L10_15 = A0_5.work
      L10_15.error = true
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Tell", false)
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Party", false)
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Delete", false)
    else
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Delete", true)
    end
  else
    L8_13 = A0_5.work
    L8_13.party = 2
    L9_14 = A0_5
    L8_13 = A0_5.setVisibility
    L10_15 = "Button_Tell"
    L11_16 = true
    L8_13(L9_14, L10_15, L11_16)
    L9_14 = A0_5
    L8_13 = A0_5.setVisibility
    L10_15 = "Button_Letter"
    L11_16 = false
    L8_13(L9_14, L10_15, L11_16)
    L9_14 = A0_5
    L8_13 = A0_5.setVisibility
    L10_15 = "Button_Party"
    L11_16 = true
    L8_13(L9_14, L10_15, L11_16)
    L9_14 = A3_8
    L8_13 = A3_8.getAddressName
    L9_14 = L8_13(L9_14)
    if L8_13 == nil then
      L10_15 = A0_5.work
      L10_15.error = true
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Tell", false)
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Party", false)
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Delete", false)
    elseif L8_13 == 0 or L8_13 == "" then
      L10_15 = A0_5.work
      L10_15.error = true
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Tell", false)
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Party", false)
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Delete", false)
    else
      if L9_14 == nil then
        L11_16 = A0_5
        L10_15 = A0_5.setEnable
        L10_15(L11_16, "Button_Tell", false)
        L11_16 = A0_5
        L10_15 = A0_5.setEnable
        L10_15(L11_16, "Button_Party", false)
      elseif L9_14 == 0 then
        L11_16 = A0_5
        L10_15 = A0_5.setEnable
        L10_15(L11_16, "Button_Tell", false)
        L11_16 = A0_5
        L10_15 = A0_5.setEnable
        L10_15(L11_16, "Button_Party", false)
      else
        L11_16 = A0_5
        L10_15 = A0_5.setEnable
        L10_15(L11_16, "Button_Tell", true)
        L11_16 = A0_5
        L10_15 = A0_5.setEnable
        L10_15(L11_16, "Button_Party", true)
      end
      L11_16 = A0_5
      L10_15 = A0_5.setEnable
      L10_15(L11_16, "Button_Delete", true)
    end
    L5_10 = 0
    L7_12 = 80
  end
  if A4_9 ~= nil then
    L9_14 = A0_5
    L8_13 = A0_5.setPartyEnable
    L10_15 = A4_9
    L8_13(L9_14, L10_15)
  end
  if A2_7 ~= nil then
    L9_14 = A3_8
    L8_13 = A3_8.getWindowPosition
    L9_14 = L8_13(L9_14)
    L10_15 = A2_7 - 1
    L10_15 = L10_15 * 20
    L10_15 = L9_14 + L10_15
    L10_15 = L10_15 + L5_10
    L11_16 = L8_13 + 420
    if L11_16 + L6_11 > desktopWidget:getWindowSize() * 0.9 then
      L11_16 = desktopWidget:getWindowSize() * 0.9 - L6_11
    end
    if L10_15 + L7_12 > desktopWidget:getWindowSize() * 0.9 - L5_10 then
      L10_15 = desktopWidget:getWindowSize() * 0.9 - L7_12 - L5_10
    end
    if L10_15 < desktopWidget:getWindowSize() * 0.05 then
      L10_15 = desktopWidget:getWindowSize() * 0.05
    end
    A0_5:setProperty("Top", L10_15)
    A0_5:setProperty("Left", L11_16)
  end
end
function AddressListSubWidget.setPartyEnable(A0_17, A1_18)
  if A1_18 == nil then
    A0_17.work.party = 0
    A0_17:setVisibility("Button_Party", false)
  else
    A0_17:setVisibility("Button_Party", true)
    if A1_18 == false then
      if A0_17:getKeyboardFocusedControl() == "Button_Party" then
        A0_17:setFocus("Button_Delete")
      end
      A0_17:setEnable("Button_Party", false)
      if A0_17.work.party > 2 then
        desktopWidget:closeChildWidget("AddressListNamingWidget", A0_17)
      end
      A0_17.work.party = 1
    else
      A0_17:setEnable("Button_Party", true)
      if A0_17.work.party < 2 then
        A0_17.work.party = 2
      end
    end
  end
end
function AddressListSubWidget.setFocus(A0_19, A1_20)
  if A1_20 ~= nil and A1_20 ~= "" then
    A0_19:setLogicalFocus(A1_20)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_19 then
      A0_19:setKeyboardFocusedControl(A1_20)
    end
  end
end
function AddressListSubWidget.processBeforeShow(A0_21, A1_22)
  if A1_22 ~= true and A0_21.work.error == true then
    A0_21:setParentBorder()
    return desktopWidget:closeWidgetDirect(A0_21)
  end
  return true
end
function AddressListSubWidget.processUICommandCancel(A0_23, A1_24, A2_25, A3_26, A4_27)
  A0_23:setParentBorder()
  return desktopWidget:closeWidgetDirect(A0_23)
end
function AddressListSubWidget.processUICommandOperate(A0_28, A1_29, A2_30, A3_31, A4_32)
  A0_28:setFocus(A2_30)
  if A2_30 == "Button_Tell" then
    return A0_28:sendTellFormat()
  end
  if A2_30 == "Button_Letter" then
    return nil
  end
  if A2_30 == "Button_Party" then
    return A0_28:openPartyDialog()
  end
  if A2_30 == "Button_Delete" then
    return A0_28:openDeleteDialog()
  end
  if A2_30 == "Button_Close" then
    A0_28:setParentBorder()
    return desktopWidget:closeWidgetDirect(A0_28)
  end
end
function AddressListSubWidget.openPartyDialog(A0_33)
  local L1_34, L2_35
  L2_35 = A0_33
  L1_34 = A0_33._getParentWidget
  L1_34 = L1_34(L2_35)
  L2_35 = L1_34.getAddressName
  L2_35 = L2_35(L1_34)
  if L2_35 ~= false and L2_35 ~= "" and L2_35 ~= 0 then
    if desktopWidget:openChildWidget("AddressListNamingWidget", A0_33, true, 4, L2_35) ~= nil then
      A0_33.work.party = 3
      return (desktopWidget:openChildWidget("AddressListNamingWidget", A0_33, true, 4, L2_35))
    end
  else
    A0_33.work.error = true
    A0_33:setParentBorder()
    return desktopWidget:closeWidgetDirect(A0_33)
  end
end
function AddressListSubWidget.openDeleteDialog(A0_36)
  local L1_37, L2_38, L3_39
  L1_37 = 3
  L2_38 = A0_36.work
  L2_38 = L2_38.mode
  if L2_38 == 0 then
    L1_37 = 2
  end
  L3_39 = A0_36
  L2_38 = A0_36._getParentWidget
  L2_38 = L2_38(L3_39)
  L3_39 = L2_38.getAddressName
  L3_39 = L3_39(L2_38)
  if L3_39 ~= false and L3_39 ~= "" and L3_39 ~= 0 then
    if desktopWidget:openChildWidget("AddressListNamingWidget", A0_36, true, L1_37, L3_39) ~= nil then
      return (desktopWidget:openChildWidget("AddressListNamingWidget", A0_36, true, L1_37, L3_39))
    end
  else
    A0_36.work.error = true
    A0_36:setParentBorder()
    return desktopWidget:closeWidgetDirect(A0_36)
  end
end
function AddressListSubWidget.sendTellFormat(A0_40)
  local L1_41, L2_42
  L2_42 = A0_40
  L1_41 = A0_40._getParentWidget
  L1_41 = L1_41(L2_42)
  L2_42 = L1_41.getAddressName
  L2_42 = L2_42(L1_41)
  return desktopWidget:setTellAddress(L2_42)
end
function AddressListSubWidget.setSubWindowOperation(A0_43, A1_44, A2_45)
  if A0_43:_getParentWidget() ~= nil then
    A0_43:_getParentWidget():setSubWindowOperation(A1_44, A2_45)
  end
  if A1_44 == 21 then
    A0_43:setEnable("Button_Tell", false)
    A0_43:setEnable("Button_Delete", false)
    A0_43:hide()
  end
  A0_43:setParentBorder()
  desktopWidget:closeWidgetDirect(A0_43)
end
function AddressListSubWidget.ignoreFamilyName(A0_46)
  if A0_46:_getParentWidget() ~= nil then
    return A0_46:_getParentWidget():ignoreFamilyName()
  else
    return 0
  end
end
function AddressListSubWidget.setParentBorder(A0_47)
  if A0_47:_getParentWidget() ~= nil then
    A0_47:_getParentWidget():setBorder(-1)
  end
end
