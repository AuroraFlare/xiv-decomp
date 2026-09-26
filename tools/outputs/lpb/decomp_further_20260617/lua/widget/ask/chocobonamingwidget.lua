require("/Widget/Ask/AskBaseClass")
_defineClass("ChocoboNamingWidget", "AskBaseClass")
function ChocoboNamingWidget.initAsk(A0_0)
  A0_0.work._temp = {
    {"maxZenHan", "integer8"}
  }
  A0_0:setControlCommandCondition("TextBox_Name", "UILuaCommands.TextChanged")
  A0_0:setApplicationOperateCommand("TextBox_Name")
  A0_0:setConfirmCondition("Button_Decide")
  A0_0:setConfirmCondition("Button_Cancel")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setEnable("Button_Decide", false)
  if desktopWidget:isChinese() == false then
    A0_0:setAcceptChars("TextBox_Name", "A-Z a-z")
    A0_0:setControlProperty("TextBox_Name", "MaxLength", 10)
    A0_0:setControlProperty("TextBox_Name", "InputMethod.SqwtInputAllowedChars", "Alphabet")
  else
    A0_0:setAcceptChars("TextBox_Name", A0_0:getControlUserWorkString(1, "TextBox_Name"))
    A0_0:setIMEInput("TextBox_Name", true)
    A0_0:setControlProperty("TextBox_Name", "MaxLength", tostring(10) .. "b")
    A0_0:setControlProperty("TextBox_Name", "IsReplaceUnaccept", true)
    A0_0:setControlProperty("TextBox_Name", "InputMethod.SqwtInputAllowedChars", "Alphabet|Number")
    A0_0.work.maxZenHan = 4
  end
end
function ChocoboNamingWidget.processUICommandApplicationOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  if A2_3 == "TextBox_Name" and A0_1:getKeyboardFocusedControl() ~= nil and A0_1:getEnable("Button_Decide") == true then
    A0_1:setKeyboardFocusedControl("Button_Decide")
  end
end
function ChocoboNamingWidget.processUICommandDefault(A0_6, A1_7, A2_8, A3_9, A4_10, A5_11)
  local L6_12, L7_13, L8_14
  L6_12 = A3_9
  if L6_12 == "UILuaCommands.TextChanged" then
    L7_13 = false
    L8_14 = A0_6.getName
    L8_14 = L8_14(A0_6)
    if desktopWidget:isChinese() == false then
      if #L8_14 >= 3 then
        L7_13 = true
      end
    else
      if 3 <= A0_6:getZenHanLength(L8_14) and A0_6:getZenHanLength(L8_14) <= A0_6.work.maxZenHan then
        L7_13 = true
      end
      if A0_6:getControlProperty("TextBox_Name", "IsValidFirst") == false then
        L7_13 = false
      end
    end
    A0_6:setEnable("Button_Decide", L7_13)
    break
  else
  end
end
function ChocoboNamingWidget.getName(A0_15)
  return A0_15:getText("TextBox_Name")
end
function ChocoboNamingWidget.processUICommandClose(A0_16, A1_17, A2_18, A3_19, A4_20)
  A0_16:finish()
end
function ChocoboNamingWidget.finish(A0_21)
  A0_21:setBaseAskResult(2)
end
function ChocoboNamingWidget.getAskResult(A0_22)
  local L1_23
  L1_23 = ""
  if A0_22:getBaseAskResult() == 1 then
    L1_23 = desktopWidget:convertNameText(A0_22:getName())
  end
  return L1_23
end
function ChocoboNamingWidget.processUICommandOperate(A0_24, A1_25, A2_26, A3_27, A4_28)
  if A2_26 == "Button_Decide" then
    A0_24:setEnable("TextBox_Name", false)
    desktopWidget:openChildWidget("CommonDialogWidget", A0_24, true, nil, A0_24:packTextParameter(7015, desktopWidget:convertNameText(A0_24:getName())), 2)
  end
end
function ChocoboNamingWidget.processAskResult(A0_29, A1_30)
  if A1_30 == 1 then
    A0_29:setBaseAskResult(1)
    return
  end
  A0_29:setEnable("TextBox_Name", true)
  A0_29:setLogicalFocus("TextBox_Name")
end
function ChocoboNamingWidget.getZenHanLength(A0_31, A1_32)
  if A1_32 ~= nil and A1_32 ~= "" then
  end
  return (_getUTF8StringLength(A1_32) * 3 - #A1_32) / 2 + (_getUTF8StringLength(A1_32) - (_getUTF8StringLength(A1_32) * 3 - #A1_32) / 2) * 2
end
