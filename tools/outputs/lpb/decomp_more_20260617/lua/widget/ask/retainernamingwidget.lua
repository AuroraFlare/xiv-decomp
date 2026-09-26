require("/Widget/Ask/AskBaseClass")
_defineClass("RetainerNamingWidget", "AskBaseClass")
function RetainerNamingWidget.initAsk(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = A0_0.work
  L4_4 = {
    {"askAnswer", "integer32"},
    {"maxZenHan", "integer8"}
  }
  L3_3._temp = L4_4
  L3_3 = ""
  L4_4 = A0_0.work
  L4_4.askAnswer = -1
  if A2_2 ~= nil then
    L4_4 = A0_0.setText
    L4_4(A0_0, "TextBlock_Message", 6601)
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_NickName", "MaxLength", "24b")
    L4_4 = A0_0.setRetainerData
    L4_4(A0_0, A2_2)
    L4_4 = A0_0.setHelpParameter
    L4_4(A0_0, "TextBlock_Name", 1, 76301)
  else
    L4_4 = A0_0.setText
    L4_4(A0_0, "TextBlock_Message", 6610)
    L4_4 = A0_0.setVisibility
    L4_4(A0_0, "TextBlock_NameTitle", false)
    L4_4 = A0_0.setVisibility
    L4_4(A0_0, "TextBlock_Name", false)
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_NickName", "MaxLength", "18b")
    L4_4 = A0_0.setText
    L4_4(A0_0, "TextBlock_Help", 6612)
    L4_4 = A0_0.setRetainerData
    L4_4(A0_0)
  end
  L4_4 = A0_0.setConfirmCondition
  L4_4(A0_0, "Button_Decide")
  L4_4 = A0_0.setConfirmCondition
  L4_4(A0_0, "Button_Cancel")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0, "Button_Decide")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0, "Button_Cancel")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0)
  L4_4 = A0_0.setCloseCondition
  L4_4(A0_0)
  L4_4 = A0_0.setApplicationOperateCommand
  L4_4(A0_0, "TextBox_NickName")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_NickName", "ApplicationCommands.Cancel")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_NickName", "UILuaCommands.TextChanged")
  L4_4 = A0_0.setText
  L4_4(A0_0, "TextBox_NickName", "")
  L4_4 = A0_0.isChinese
  L4_4 = L4_4(A0_0)
  if L4_4 == false then
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_NickName", "InputMethod.SqwtInputAllowedChars", "Alphabet")
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_NickName", "InputMethod.AcceptChars", "A-Z a-z")
  else
    if A2_2 ~= nil then
      L4_4 = A0_0.setControlProperty
      L4_4(A0_0, "TextBox_NickName", "MaxLength", "24b")
      L4_4 = A0_0.work
      L4_4.maxZenHan = 16
    else
      L4_4 = A0_0.setControlProperty
      L4_4(A0_0, "TextBox_NickName", "MaxLength", "18b")
      L4_4 = A0_0.work
      L4_4.maxZenHan = 12
    end
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_NickName", "IsReplaceUnaccept", "True")
    L4_4 = A0_0.setIMEInput
    L4_4(A0_0, "TextBox_NickName", true)
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_NickName", "InputMethod.SqwtInputAllowedChars", "Alphabet|Number")
    L4_4 = A0_0.getControlProperty
    L4_4 = L4_4(A0_0, "TextBox_NickName", "StringData.Value0")
    A0_0:setAcceptChars("TextBox_NickName", L4_4)
  end
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_NickName", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_NickName", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Decide", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Decide", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Cancel", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Cancel", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.setEnable
  L4_4(A0_0, "Button_Decide", false)
end
function RetainerNamingWidget.processUICommandClose(A0_5, A1_6, A2_7, A3_8, A4_9)
  A0_5:setBaseAskResult(-3)
  A0_5.work.askAnswer = -3
end
function RetainerNamingWidget.processUICommandCancel(A0_10, A1_11, A2_12, A3_13, A4_14)
  if A2_12 == "Button_Cancel" then
    A0_10:setBaseAskResult(-3)
    A0_10.work.askAnswer = -3
  else
    A0_10:setFocus("Button_Cancel")
  end
end
function RetainerNamingWidget.processUICommandOperate(A0_15, A1_16, A2_17, A3_18, A4_19)
  local L5_20, L6_21
  if A2_17 == "Button_Decide" then
    L6_21 = A0_15
    L5_20 = A0_15.getNameData
    L5_20 = L5_20(L6_21)
    if nil ~= L5_20 and "" ~= L5_20 then
      L6_21 = A0_15.packTextParameter
      L6_21 = L6_21(A0_15, 6606, L5_20)
      desktopWidget:openChildWidget("CommonDialogWidget", A0_15, true, nil, L6_21, 2)
    end
    return
  end
  if A2_17 == "Button_Cancel" then
    L6_21 = A0_15
    L5_20 = A0_15.setBaseAskResult
    L5_20(L6_21, -3)
    L5_20 = A0_15.work
    L5_20.askAnswer = -3
  end
end
function RetainerNamingWidget.processUICommandApplicationOperate(A0_22, A1_23, A2_24, A3_25, A4_26)
  if A2_24 == "TextBox_NickName" then
    if A0_22:getControlProperty("Button_Decide", "IsEnabled") == "True" then
      A0_22:setFocus("Button_Decide")
    else
      A0_22:setFocus("Button_Cancel")
    end
  end
end
function RetainerNamingWidget.processUICommandDefault(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32)
  local L6_33, L7_34
  if A3_30 == "UILuaCommands.TextChanged" then
    L6_33 = false
    L7_34 = A0_27.getText
    L7_34 = L7_34(A0_27, "TextBox_NickName")
    if desktopWidget:isChinese() == false then
      if #L7_34 >= 3 then
        L6_33 = true
      end
    else
      if 3 <= A0_27:getZenHanLength(L7_34) and A0_27:getZenHanLength(L7_34) <= A0_27.work.maxZenHan then
        L6_33 = true
      end
      if A0_27:getControlProperty("TextBox_NickName", "IsValidFirst") == false then
        L6_33 = false
      end
    end
    A0_27:setEnable("Button_Decide", L6_33)
  end
  if A3_30 == "UILuaCommands.TabNext" then
    if A2_29 == "TextBox_NickName" then
      L7_34 = A0_27
      L6_33 = A0_27.getControlProperty
      L6_33 = L6_33(L7_34, "Button_Decide", "IsEnabled")
      if L6_33 == "True" then
        L7_34 = A0_27
        L6_33 = A0_27.setFocus
        L6_33(L7_34, "Button_Decide")
      else
        L7_34 = A0_27
        L6_33 = A0_27.setFocus
        L6_33(L7_34, "Button_Cancel")
      end
    elseif A2_29 == "Button_Decide" then
      L7_34 = A0_27
      L6_33 = A0_27.setFocus
      L6_33(L7_34, "Button_Cancel")
    elseif A2_29 == "Button_Cancel" then
      L7_34 = A0_27
      L6_33 = A0_27.setFocus
      L6_33(L7_34, "TextBox_NickName")
    end
  end
  if A3_30 == "UILuaCommands.TabPrevious" then
    if A2_29 == "TextBox_NickName" then
      L7_34 = A0_27
      L6_33 = A0_27.setFocus
      L6_33(L7_34, "Button_Cancel")
    elseif A2_29 == "Button_Decide" then
      L7_34 = A0_27
      L6_33 = A0_27.setFocus
      L6_33(L7_34, "TextBox_NickName")
    elseif A2_29 == "Button_Cancel" then
      L7_34 = A0_27
      L6_33 = A0_27.getControlProperty
      L6_33 = L6_33(L7_34, "Button_Decide", "IsEnabled")
      if L6_33 == "True" then
        L7_34 = A0_27
        L6_33 = A0_27.setFocus
        L6_33(L7_34, "Button_Decide")
      else
        L7_34 = A0_27
        L6_33 = A0_27.setFocus
        L6_33(L7_34, "TextBox_NickName")
      end
    end
  end
end
function RetainerNamingWidget.processAskResult(A0_35, A1_36)
  if 1 == A1_36 then
    A0_35:setEnable("TextBox_NickName", false)
    A0_35:setBaseAskResult(1)
  else
    A0_35:setFocus("TextBox_NickName")
  end
end
function RetainerNamingWidget.setRetainerData(A0_37, A1_38)
  if A1_38 ~= nil then
    A0_37:setText("TextBlock_Name", 210, A1_38)
  else
    A0_37:setText("TextBlock_Name", desktopWidget:getTargetName())
  end
end
function RetainerNamingWidget.getAskResult(A0_39)
  if A0_39.work.askAnswer == -3 then
    return -3
  end
  if A0_39:getNameData() ~= nil then
    return (A0_39:getNameData())
  end
  return nil
end
function RetainerNamingWidget.getNameData(A0_40)
  local L1_41
  L1_41 = A0_40._getProperty
  L1_41 = L1_41(A0_40, nil, "TextBox_NickName", "Text")
  if "" == L1_41 then
    L1_41 = nil
  else
    L1_41 = desktopWidget:convertNameText(L1_41)
  end
  return L1_41
end
function RetainerNamingWidget.setFocus(A0_42, A1_43)
  if A1_43 ~= nil and A1_43 ~= "" then
    A0_42:setLogicalFocus(A1_43)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_42 then
      A0_42:setKeyboardFocusedControl(A1_43)
    end
  end
end
function RetainerNamingWidget.isChinese(A0_44)
  return desktopWidget:isChinese()
end
function RetainerNamingWidget.getZenHanLength(A0_45, A1_46)
  if A1_46 ~= nil and A1_46 ~= "" then
  end
  return (_getUTF8StringLength(A1_46) * 3 - #A1_46) / 2 + (_getUTF8StringLength(A1_46) - (_getUTF8StringLength(A1_46) * 3 - #A1_46) / 2) * 2
end
