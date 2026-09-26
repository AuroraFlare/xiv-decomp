require("/Widget/Ask/AskBaseClass")
_defineClass("GuildleveAreaOrderWidget", "AskBaseClass")
function GuildleveAreaOrderWidget.initAsk(A0_0, A1_1)
  A0_0.work._temp = {
    {
      "passiveGuildleve",
      "boolean"
    }
  }
  A0_0:setControlCommandCondition("ListBox_AreaSelect", "UILuaCommands.Selection")
  A0_0:setCancelCondition()
  if A1_1 == true then
    A0_0:setText("TextBlock_ListTitle_1", 6108)
    A0_0:setVisibility("TextBlock_ListTitle_2", false)
    A0_0:setHelpParameter("TextBlock_ListTitle_1", 1, 78605)
    A0_0:setHelpParameter("TextBlock_ListTitle_2", 0)
    A0_0.work.passiveGuildleve = true
  else
    A0_0:setText("TextBlock_ListTitle_1", 6102)
    A0_0:setText("TextBlock_ListTitle_2", 6103)
    A0_0:setHelpParameter("TextBlock_ListTitle_1", 1, 78601)
    A0_0:setHelpParameter("TextBlock_ListTitle_2", 1, 78602)
    A0_0.work.passiveGuildleve = false
  end
  A0_0:setLogicalFocus("ListBox_AreaSelect")
end
function GuildleveAreaOrderWidget.addAreaParameter(A0_2, A1_3, A2_4)
  A1_3 = A1_3 - 1
  if A0_2.work.passiveGuildleve == true then
    A0_2:setListText("ListBox", A1_3, "Text1", 206, A2_4)
    A0_2:setListProperty("ListBox", A1_3, "Text2Visibility", false)
  else
    A0_2:setListText("ListBox", A1_3, "Text1", 211, A2_4)
    A0_2:setListText("ListBox", A1_3, "Text2", 6107, A2_4)
  end
end
function GuildleveAreaOrderWidget.updateList(A0_5)
  A0_5:updateListProperty("ListBox")
  if A0_5:getKeyboardFocusedControl() ~= nil then
    A0_5:setKeyboardFocusedControl("ListBox_AreaSelect")
  end
end
function GuildleveAreaOrderWidget.processUICommandSelection(A0_6, A1_7, A2_8, A3_9, A4_10)
  A0_6:setBaseAskResult(A3_9 + 1)
end
function GuildleveAreaOrderWidget.processUICommandClose(A0_11, A1_12, A2_13, A3_14, A4_15)
  A0_11:setBaseAskResult(-1)
end
function GuildleveAreaOrderWidget.getAskResult(A0_16)
  if A0_16:getBaseAskResult() == -1 then
    return nil
  end
  return (A0_16:getBaseAskResult())
end
