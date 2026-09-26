require("/Widget/Ask/AskBaseClass")
_defineClass("LinkshellNamingWidget", "AskBaseClass")
function LinkshellNamingWidget.initAsk(A0_0)
  local L1_1
  L1_1 = A0_0.setVisibility
  L1_1(A0_0, "Grid_Introductory", false)
  L1_1 = A0_0.setConfirmCondition
  L1_1(A0_0, "Button_Next")
  L1_1 = A0_0.setConfirmCondition
  L1_1(A0_0, "Button_Quit")
  L1_1 = A0_0.setCancelCondition
  L1_1(A0_0, "Button_Next")
  L1_1 = A0_0.setCancelCondition
  L1_1(A0_0, "Button_Quit")
  L1_1 = A0_0.setCommandParameter
  L1_1(A0_0, "Button_Next", 1)
  L1_1 = A0_0.setCommandParameter
  L1_1(A0_0, "Button_Quit", -1)
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "TextBox_LinkshellName", "ApplicationCommands.Operate")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "TextBox_LinkshellName", "UILuaCommands.TextChanged")
  L1_1 = A0_0.setEnable
  L1_1(A0_0, "Button_Next", false)
  L1_1 = A0_0.setCancelCondition
  L1_1(A0_0)
  L1_1 = desktopWidget
  L1_1 = L1_1.isChinese
  L1_1 = L1_1(L1_1)
  if L1_1 == false then
    L1_1 = A0_0.setAcceptChars
    L1_1(A0_0, "TextBox_LinkshellName", "Space")
  else
    L1_1 = A0_0.setControlProperty
    L1_1(A0_0, "TextBox_LinkshellName", "MaxLength", "30b")
    L1_1 = A0_0.setControlProperty
    L1_1(A0_0, "TextBox_LinkshellName", "IsReplaceUnaccept", "True")
    L1_1 = A0_0.setIMEInput
    L1_1(A0_0, "TextBox_LinkshellName", true)
    L1_1 = A0_0.setControlProperty
    L1_1(A0_0, "TextBox_LinkshellName", "InputMethod.SqwtInputAllowedChars", "Alphabet|Number")
    L1_1 = A0_0.getUserWorkString
    L1_1 = L1_1(A0_0, 1, nil, "TextBox_LinkshellName")
    A0_0:setAcceptChars("TextBox_LinkshellName", L1_1)
  end
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "TextBox_LinkshellName", "UILuaCommands.TabNext")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "TextBox_LinkshellName", "UILuaCommands.TabPrevious")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "Button_Next", "UILuaCommands.TabNext")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "Button_Next", "UILuaCommands.TabPrevious")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "Button_Quit", "UILuaCommands.TabNext")
  L1_1 = A0_0.setControlCommandCondition
  L1_1(A0_0, "Button_Quit", "UILuaCommands.TabPrevious")
end
function LinkshellNamingWidget.processUICommandOperate(A0_2, A1_3, A2_4, A3_5, A4_6)
  if A2_4 == "Button_Quit" then
    A0_2:setBaseAskResult(A3_5)
    return
  end
  if A0_2:getText("TextBox_LinkshellName") == "" then
    return
  end
  if A2_4 == "TextBox_LinkshellName" then
    A0_2:setKeyboardFocusedControl("Button_Next")
    break
  else
  end
  A0_2:setBaseAskResult(A3_5)
  break
end
function LinkshellNamingWidget.processUICommandCancel(A0_7, A1_8, A2_9, A3_10, A4_11)
  if A2_9 == "Button_Quit" then
    A0_7:setBaseAskResult(-3)
    return
  end
  if A2_9 == "Button_Next" then
    A0_7:setKeyboardFocusedControl("TextBox_LinkshellName")
    return
  end
  A0_7:setKeyboardFocusedControl("Button_Quit")
end
function LinkshellNamingWidget.processUICommandDefault(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17)
  local L6_18, L7_19
  L6_18 = false
  L7_19 = A0_12.getText
  L7_19 = L7_19(A0_12, "TextBox_LinkshellName")
  if desktopWidget:isChinese() == false then
    if #L7_19 >= 3 then
      L6_18 = true
    end
  else
    if 3 <= A0_12:getZenHanLength(L7_19) and A0_12:getZenHanLength(L7_19) <= 20 then
      L6_18 = true
    end
    if A0_12:getControlProperty("TextBox_LinkshellName", "IsValidFirst") == false then
      L6_18 = false
    end
  end
  A0_12:setEnable("Button_Next", L6_18)
  if A3_15 == "UILuaCommands.TabNext" then
    if A2_14 == "TextBox_LinkshellName" then
      if A0_12:getControlProperty("Button_Next", "IsEnabled") == "True" then
        A0_12:setKeyboardFocusedControl("Button_Next")
      else
        A0_12:setKeyboardFocusedControl("Button_Quit")
      end
    elseif A2_14 == "Button_Next" then
      A0_12:setKeyboardFocusedControl("Button_Quit")
    elseif A2_14 == "Button_Quit" then
      A0_12:setKeyboardFocusedControl("TextBox_LinkshellName")
    end
  end
  if A3_15 == "UILuaCommands.TabPrevious" then
    if A2_14 == "TextBox_LinkshellName" then
      A0_12:setKeyboardFocusedControl("Button_Quit")
    elseif A2_14 == "Button_Next" then
      A0_12:setKeyboardFocusedControl("TextBox_LinkshellName")
    elseif A2_14 == "Button_Quit" then
      if A0_12:getControlProperty("Button_Next", "IsEnabled") == "True" then
        A0_12:setKeyboardFocusedControl("Button_Next")
      else
        A0_12:setKeyboardFocusedControl("TextBox_LinkshellName")
      end
    end
  end
end
function LinkshellNamingWidget.getZenHanLength(A0_20, A1_21)
  if A1_21 ~= nil and A1_21 ~= "" then
  end
  return (_getUTF8StringLength(A1_21) * 3 - #A1_21) / 2 + (_getUTF8StringLength(A1_21) - (_getUTF8StringLength(A1_21) * 3 - #A1_21) / 2) * 2
end
function LinkshellNamingWidget.getAskResult(A0_22)
  local L1_23, L2_24
  L2_24 = A0_22
  L1_23 = A0_22.getBaseAskResult
  L1_23 = L1_23(L2_24)
  L2_24 = ""
  if L1_23 == 1 then
    L2_24 = A0_22:getText("TextBox_LinkshellName")
  end
  return L1_23, L2_24
end
