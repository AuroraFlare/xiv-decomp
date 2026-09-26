require("/Widget/WidgetBaseClass")
_defineClass("AddressListNamingWidget", "WidgetBaseClass")
function AddressListNamingWidget.init(A0_0, A1_1, A2_2, A3_3)
  local L4_4
  L4_4 = A0_0.work
  L4_4._temp = {
    {"mode", "integer8"},
    {"delete", "boolean"},
    {"confirm", "boolean"},
    {
      "name",
      "string",
      32
    }
  }
  L4_4 = A0_0.work
  L4_4.confirm = false
  L4_4 = A0_0.work
  L4_4.name = ""
  if A1_1 ~= nil then
    L4_4 = A0_0.work
    L4_4.mode = A1_1
  else
    L4_4 = A0_0.work
    L4_4.mode = 0
  end
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0)
  L4_4 = A0_0.setCloseCondition
  L4_4(A0_0)
  L4_4 = A0_0.setConfirmCondition
  L4_4(A0_0, "Button_Decide")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0, "Button_Decide")
  L4_4 = A0_0.setConfirmCondition
  L4_4(A0_0, "Button_Cancel")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0, "Button_Cancel")
  L4_4 = A0_0.setApplicationOperateCommand
  L4_4(A0_0, "TextBox_Name")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0, "TextBox_Name")
  L4_4 = A0_0.setApplicationOperateCommand
  L4_4(A0_0, "TextBox_Name_2")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0, "TextBox_Name_2")
  L4_4 = A0_0.setApplicationOperateCommand
  L4_4(A0_0, "TextBox_Name_3")
  L4_4 = A0_0.setCancelCondition
  L4_4(A0_0, "TextBox_Name_3")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_Name", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_Name", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_Name_2", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_Name_2", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_Name_3", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "TextBox_Name_3", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Decide", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Decide", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Cancel", "UILuaCommands.TabNext")
  L4_4 = A0_0.setControlCommandCondition
  L4_4(A0_0, "Button_Cancel", "UILuaCommands.TabPrevious")
  L4_4 = A0_0.work
  L4_4 = L4_4.mode
  if L4_4 ~= 0 then
    L4_4 = A0_0.work
    L4_4 = L4_4.mode
  else
    if L4_4 == 1 then
      L4_4 = A0_0.setText
      L4_4(A0_0, "TextBlock_Message", 3726)
      L4_4 = A0_0.confirm
      L4_4(A0_0, false)
      L4_4 = A0_0.work
      L4_4.delete = false
  end
  else
    L4_4 = A0_0.work
    L4_4 = L4_4.mode
    if L4_4 ~= 2 then
      L4_4 = A0_0.work
      L4_4 = L4_4.mode
    else
      if L4_4 == 3 then
        L4_4 = A0_0.setText
        L4_4(A0_0, "TextBlock_Message", 3705)
        L4_4 = A0_0.confirm
        L4_4(A0_0, true)
        L4_4 = A0_0.work
        L4_4.delete = true
        L4_4 = A0_0.work
        L4_4 = L4_4.mode
        if L4_4 == 2 then
          L4_4 = A0_0.setText
          L4_4(A0_0, "TextBlock_Help", 3722, A2_2)
        else
          L4_4 = A0_0.setText
          L4_4(A0_0, "TextBlock_Help", 3724, A2_2)
        end
        L4_4 = A0_0.work
        L4_4.name = A2_2
    end
    else
      L4_4 = A0_0.work
      L4_4 = L4_4.mode
      if L4_4 == 4 then
        L4_4 = A0_0.setText
        L4_4(A0_0, "TextBlock_Message", 3714)
        L4_4 = A0_0.confirm
        L4_4(A0_0, true)
        L4_4 = A0_0.setText
        L4_4(A0_0, "TextBlock_Help", 3725, A2_2)
        L4_4 = A0_0.work
        L4_4.name = A2_2
      end
    end
  end
  L4_4 = A0_0.isChinese
  L4_4 = L4_4(A0_0)
  if L4_4 == false then
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_Name", "InputMethod.SqwtInputAllowedChars", "Alphabet")
    L4_4 = A0_0.setAcceptChars
    L4_4(A0_0, "TextBox_Name", "A-Z a-z")
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_Name_2", "InputMethod.SqwtInputAllowedChars", "Alphabet")
    L4_4 = A0_0.setAcceptChars
    L4_4(A0_0, "TextBox_Name_2", "A-Z a-z")
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_Name", "InputMethod.SqwtInputMethodStatus", "Enable")
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_Name_2", "InputMethod.SqwtInputMethodStatus", "Enable")
    L4_4 = A0_0.setVisibility
    L4_4(A0_0, "Grid_Chinese", false)
    if A3_3 ~= nil and A3_3 == 1 then
      L4_4 = A0_0.setControlProperty
      L4_4(A0_0, "TextBox_Name", "InputMethod.SqwtInputAllowedChars", "Alphabet|Number")
      L4_4 = A0_0.setAcceptChars
      L4_4(A0_0, "TextBox_Name", "A-Z a-z 0-9")
    end
  else
    L4_4 = A0_0.setVisibility
    L4_4(A0_0, "Grid_Normal", false)
    L4_4 = A0_0.setText
    L4_4(A0_0, "TextBox_Name_2", "!!!")
    L4_4 = A0_0.setControlProperty
    L4_4(A0_0, "TextBox_Name_3", "InputMethod.SqwtInputAllowedChars", "Alphabet|Number")
    L4_4 = A0_0.getControlProperty
    L4_4 = L4_4(A0_0, "TextBox_Name_3", "StringData.Value0")
    A0_0:setAcceptChars("TextBox_Name_3", L4_4)
  end
  L4_4 = A0_0.setModal
  L4_4(A0_0, true)
  L4_4 = A0_0.setDrag
  L4_4(A0_0, true)
end
function AddressListNamingWidget.setFocus(A0_5, A1_6)
  if A1_6 ~= nil and A1_6 ~= "" then
    A0_5:setLogicalFocus(A1_6)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_5 then
      A0_5:setKeyboardFocusedControl(A1_6)
    end
  end
end
function AddressListNamingWidget.processUICommandClose(A0_7, A1_8, A2_9, A3_10, A4_11)
  desktopWidget:closeWidgetDirect(A0_7)
end
function AddressListNamingWidget.processUICommandCancel(A0_12, A1_13, A2_14, A3_15, A4_16)
  if A2_14 == "Button_Cancel" then
    if A0_12.work.delete == true then
      return desktopWidget:closeWidgetDirect(A0_12)
    elseif A0_12.work.mode == 4 then
      return desktopWidget:closeWidgetDirect(A0_12)
    elseif A0_12.work.confirm == true then
      return A0_12:confirm(false)
    else
      return desktopWidget:closeWidgetDirect(A0_12)
    end
  else
    return A0_12:setFocus("Button_Cancel")
  end
end
function AddressListNamingWidget.processUICommandOperate(A0_17, A1_18, A2_19, A3_20, A4_21)
  local L5_22, L6_23
  if A2_19 == "Button_Cancel" then
    L5_22 = A0_17.work
    L5_22 = L5_22.delete
    if L5_22 == true then
      L5_22 = desktopWidget
      L6_23 = L5_22
      L5_22 = L5_22.closeWidgetDirect
      return L5_22(L6_23, A0_17)
    else
      L5_22 = A0_17.work
      L5_22 = L5_22.mode
      if L5_22 == 4 then
        L5_22 = desktopWidget
        L6_23 = L5_22
        L5_22 = L5_22.closeWidgetDirect
        return L5_22(L6_23, A0_17)
      else
        L5_22 = A0_17.work
        L5_22 = L5_22.confirm
        if L5_22 == true then
          L6_23 = A0_17
          L5_22 = A0_17.confirm
          return L5_22(L6_23, false)
        else
          L5_22 = desktopWidget
          L6_23 = L5_22
          L5_22 = L5_22.closeWidgetDirect
          return L5_22(L6_23, A0_17)
        end
      end
    end
  end
  if A2_19 == "Button_Decide" then
    L5_22 = A0_17.work
    L5_22 = L5_22.delete
    if L5_22 == true then
      L6_23 = A0_17
      L5_22 = A0_17._getParentWidget
      L5_22 = L5_22(L6_23)
      if L5_22 ~= nil then
        L6_23 = L5_22.setParentBorder
        L6_23(L5_22)
        L6_23 = L5_22.setSubWindowOperation
        L6_23(L5_22, 21)
        L6_23 = desktopWidget
        L6_23 = L6_23.closeWidgetDirect
        return L6_23(L6_23, A0_17)
      end
    else
      L5_22 = A0_17.work
      L5_22 = L5_22.mode
      if L5_22 == 4 then
        L5_22 = desktopWidget
        L6_23 = L5_22
        L5_22 = L5_22.executePlayerPartyInviteByName
        L5_22 = L5_22(L6_23, A0_17.work.name)
        if L5_22 == true then
          L6_23 = A0_17._getParentWidget
          L6_23 = L6_23(A0_17)
          if L6_23 ~= nil then
            L6_23:setParentBorder()
            return desktopWidget:closeWidgetDirect(L6_23)
          end
        end
      else
        L6_23 = A0_17
        L5_22 = A0_17.isChinese
        L5_22 = L5_22(L6_23)
        if L5_22 == false then
          L5_22 = A0_17.work
          L5_22 = L5_22.confirm
          if L5_22 == true then
            L5_22 = ""
            L6_23 = A0_17.ignoreFamilyName
            L6_23 = L6_23(A0_17)
            if L6_23 ~= 0 then
              L6_23 = A0_17.getInputName
              L6_23 = L6_23(A0_17)
              L5_22 = L6_23
            else
              L6_23 = A0_17.getInputName
              L6_23 = L6_23(A0_17)
              L5_22 = L6_23 .. " " .. A0_17:getInputName(2)
            end
            L6_23 = A0_17._getParentWidget
            L6_23 = L6_23(A0_17)
            if L6_23 ~= nil then
              L6_23:setSubWindowOperation(31, L5_22)
              return desktopWidget:closeWidgetDirect(A0_17)
            end
          else
            L6_23 = A0_17
            L5_22 = A0_17.getInputName
            L5_22 = L5_22(L6_23)
            if L5_22 ~= "" then
              L6_23 = A0_17
              L5_22 = A0_17.getInputName
              L5_22 = L5_22(L6_23, 2)
              if L5_22 ~= "" then
                L6_23 = A0_17
                L5_22 = A0_17.confirm
                return L5_22(L6_23, true)
              end
            else
              L6_23 = A0_17
              L5_22 = A0_17.ignoreFamilyName
              L5_22 = L5_22(L6_23)
              if L5_22 ~= 0 then
                L6_23 = A0_17
                L5_22 = A0_17.getInputName
                L5_22 = L5_22(L6_23)
                if L5_22 ~= "" then
                  L6_23 = A0_17
                  L5_22 = A0_17.confirm
                  return L5_22(L6_23, true)
                end
              end
            end
          end
        else
          L5_22 = A0_17.work
          L5_22 = L5_22.confirm
          if L5_22 == true then
            L5_22 = ""
            L6_23 = A0_17.getInputName
            L6_23 = L6_23(A0_17, 3)
            L5_22 = L6_23 .. " " .. A0_17:getInputName(2)
            L6_23 = A0_17._getParentWidget
            L6_23 = L6_23(A0_17)
            if L6_23 ~= nil then
              L6_23:setSubWindowOperation(31, L5_22)
              return desktopWidget:closeWidgetDirect(A0_17)
            end
          else
            L6_23 = A0_17
            L5_22 = A0_17.getInputName
            L5_22 = L5_22(L6_23, 3)
            if L5_22 ~= "" then
              L6_23 = A0_17
              L5_22 = A0_17.confirm
              return L5_22(L6_23, true)
            end
          end
        end
      end
    end
  end
end
function AddressListNamingWidget.processUICommandApplicationOperate(A0_24, A1_25, A2_26, A3_27, A4_28)
  if A0_24:isChinese() == false then
    if A2_26 == "TextBox_Name_2" then
      A0_24:setFocus("Button_Decide")
    end
    if A2_26 == "TextBox_Name" then
      A0_24:setFocus("TextBox_Name_2")
    end
  elseif A2_26 == "TextBox_Name_3" then
    A0_24:setFocus("Button_Decide")
  end
end
function AddressListNamingWidget.processUICommandDefault(A0_29, A1_30, A2_31, A3_32, A4_33, A5_34)
  if A0_29:isChinese() == false then
    if A3_32 == "UILuaCommands.TabNext" then
      if A2_31 == "TextBox_Name" then
        A0_29:setFocus("TextBox_Name_2")
      elseif A2_31 == "TextBox_Name_2" then
        A0_29:setFocus("Button_Decide")
      elseif A2_31 == "Button_Decide" then
        A0_29:setFocus("Button_Cancel")
      elseif A2_31 == "Button_Cancel" then
        if A0_29.work.confirm == true then
          A0_29:setFocus("Button_Decide")
        else
          A0_29:setFocus("TextBox_Name")
        end
      end
    end
    if A3_32 == "UILuaCommands.TabPrevious" then
      if A2_31 == "TextBox_Name" then
        A0_29:setFocus("Button_Cancel")
      elseif A2_31 == "TextBox_Name_2" then
        A0_29:setFocus("TextBox_Name")
      elseif A2_31 == "Button_Decide" then
        if A0_29.work.confirm == true then
          A0_29:setFocus("Button_Cancel")
        else
          A0_29:setFocus("TextBox_Name_2")
        end
      elseif A2_31 == "Button_Cancel" then
        A0_29:setFocus("Button_Decide")
      end
    end
  else
    if A3_32 == "UILuaCommands.TabNext" then
      if A2_31 == "TextBox_Name_3" then
        A0_29:setFocus("Button_Decide")
      elseif A2_31 == "Button_Decide" then
        A0_29:setFocus("Button_Cancel")
      elseif A2_31 == "Button_Cancel" then
        if A0_29.work.confirm == true then
          A0_29:setFocus("Button_Decide")
        else
          A0_29:setFocus("TextBox_Name_3")
        end
      end
    end
    if A3_32 == "UILuaCommands.TabPrevious" then
      if A2_31 == "TextBox_Name_3" then
        A0_29:setFocus("Button_Cancel")
      elseif A2_31 == "Button_Decide" then
        if A0_29.work.confirm == true then
          A0_29:setFocus("Button_Cancel")
        else
          A0_29:setFocus("TextBox_Name_3")
        end
      elseif A2_31 == "Button_Cancel" then
        A0_29:setFocus("Button_Decide")
      end
    end
  end
end
function AddressListNamingWidget.getInputName(A0_35, A1_36)
  local L2_37
  L2_37 = ""
  if A1_36 == 2 then
    L2_37 = A0_35:getText("TextBox_Name_2")
  elseif A1_36 == 3 then
    L2_37 = A0_35:getText("TextBox_Name_3")
  else
    L2_37 = A0_35:getText("TextBox_Name")
  end
  if L2_37 ~= "" and A0_35:isChinese() == false then
    L2_37 = desktopWidget:convertNameText(L2_37)
  end
  return L2_37
end
function AddressListNamingWidget.confirm(A0_38, A1_39, A2_40)
  local L3_41, L4_42
  L3_41 = A0_38.work
  L3_41.confirm = A1_39
  if A1_39 == true then
    L4_42 = A0_38
    L3_41 = A0_38.isChinese
    L3_41 = L3_41(L4_42)
    if L3_41 == false then
      L4_42 = A0_38
      L3_41 = A0_38.getInputName
      L3_41 = L3_41(L4_42)
      L4_42 = A0_38.getInputName
      L4_42 = L4_42(A0_38, 2)
      if A0_38.work.mode == 0 then
        A0_38:setText("TextBlock_Help", 3721, L3_41 .. " " .. L4_42)
      elseif A0_38.work.mode == 1 then
        A0_38:setText("TextBlock_Help", 3723, L3_41 .. " " .. L4_42)
      end
    else
      L4_42 = A0_38
      L3_41 = A0_38.getInputName
      L3_41 = L3_41(L4_42, 3)
      L4_42 = A0_38.work
      L4_42 = L4_42.mode
      if L4_42 == 0 then
        L4_42 = A0_38.setText
        L4_42(A0_38, "TextBlock_Help", 3721, L3_41)
      else
        L4_42 = A0_38.work
        L4_42 = L4_42.mode
        if L4_42 == 1 then
          L4_42 = A0_38.setText
          L4_42(A0_38, "TextBlock_Help", 3723, L3_41)
        end
      end
    end
    L4_42 = A0_38
    L3_41 = A0_38.setVisibility
    L3_41(L4_42, "Grid_Help", true)
    L4_42 = A0_38
    L3_41 = A0_38.setVisibility
    L3_41(L4_42, "Grid_TextBox", false)
    L4_42 = A0_38
    L3_41 = A0_38.setFocus
    L3_41(L4_42, "Button_Cancel")
    L3_41 = desktopWidget
    L4_42 = L3_41
    L3_41 = L3_41.isChinese
    L3_41 = L3_41(L4_42)
    if L3_41 == false then
      L4_42 = A0_38
      L3_41 = A0_38.setContent
      L3_41(L4_42, "Button_Decide", 1005)
      L4_42 = A0_38
      L3_41 = A0_38.setContent
      L3_41(L4_42, "Button_Cancel", 1006)
    else
      L4_42 = A0_38
      L3_41 = A0_38.setContent
      L3_41(L4_42, "Button_Decide", 1007)
      L4_42 = A0_38
      L3_41 = A0_38.setContent
      L3_41(L4_42, "Button_Cancel", 1008)
    end
  else
    L4_42 = A0_38
    L3_41 = A0_38.setVisibility
    L3_41(L4_42, "Grid_Help", false)
    L4_42 = A0_38
    L3_41 = A0_38.setVisibility
    L3_41(L4_42, "Grid_TextBox", true)
    L4_42 = A0_38
    L3_41 = A0_38.isChinese
    L3_41 = L3_41(L4_42)
    if L3_41 == false then
      L4_42 = A0_38
      L3_41 = A0_38.setFocus
      L3_41(L4_42, "TextBox_Name")
    else
      L4_42 = A0_38
      L3_41 = A0_38.setFocus
      L3_41(L4_42, "TextBox_Name_3")
    end
    L4_42 = A0_38
    L3_41 = A0_38.setContent
    L3_41(L4_42, "Button_Decide", 3727)
    L4_42 = A0_38
    L3_41 = A0_38.setContent
    L3_41(L4_42, "Button_Cancel", 3728)
  end
  return
end
function AddressListNamingWidget.ignoreFamilyName(A0_43)
  if A0_43:_getParentWidget() ~= nil and A0_43:_getParentWidget():getWindowName() ~= "AddressListSubWidget" then
    return A0_43:_getParentWidget():ignoreFamilyName()
  end
  return 0
end
function AddressListNamingWidget.isChinese(A0_44)
  return desktopWidget:isChinese()
end
