require("/Widget/WidgetBaseClass")
_defineClass("NpcSayWidget", "WidgetBaseClass")
function NpcSayWidget.init(A0_0)
  local L1_1
  L1_1 = A0_0.work
  L1_1._temp = {
    {
      "displayWidget",
      "boolean"
    }
  }
  L1_1 = A0_0.setUICommandCondition
  L1_1(A0_0, "UILuaCommands.TextChanged")
  L1_1 = A0_0.setUICommandCondition
  L1_1(A0_0, "UILuaCommands.PressedKey")
  L1_1 = A0_0.resetConsumedCommand
  L1_1(A0_0, "UILuaCommands.Cancel")
  L1_1 = A0_0.work
  L1_1.displayWidget = false
  L1_1 = tostring
  L1_1 = L1_1(38)
  L1_1 = L1_1 .. "," .. tostring(40)
  A0_0:setControlProperty("LogControl_NpcSay", "Categories", L1_1)
  A0_0:setControlProperty("LogControl_NpcSay", "IsHitTestVisible", false)
  A0_0:setControlProperty("LogControl_NpcSay:PART_TextArea", "IsHitTestVisible", false)
  A0_0:setControlProperty("LogControl_NpcSay:PART_ContentHost", "IsHitTestVisible", false)
  A0_0:setControlProperty("LogControl_NpcSay:PART_TextArea:PART_Caret", "IsHitTestVisible", false)
  A0_0:setControlProperty("LogControl_NpcSay:PART_WaitCursor", "IsHitTestVisible", false)
end
function NpcSayWidget.processUICommandEvent(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7)
  local L6_8
  if A3_5 == "UILuaCommands.TextChanged" then
    L6_8 = A0_2.isShow
    L6_8 = L6_8(A0_2)
    if L6_8 == true then
      L6_8 = A0_2.setControlProperty
      L6_8(A0_2, "LogControl_NpcSay", "SelectionLength", 0)
      L6_8 = A0_2.getControlProperty
      L6_8 = L6_8(A0_2, "LogControl_NpcSay", "Talker")
      if L6_8 ~= "" then
        A0_2:setVisibility("Label_NpcName", true)
        A0_2:setText("TextBlock_NpcName", L6_8)
      elseif L6_8 == "" then
        A0_2:setHidden("Label_NpcName")
      end
      if A0_2.work.displayWidget == false then
        A0_2:changeDisplay(true)
      end
    end
  end
end
function NpcSayWidget.processAfterHide(A0_9, A1_10)
  A0_9:setText("TextBlock_NpcName", "")
  A0_9.work.displayWidget = false
  return true
end
function NpcSayWidget.display(A0_11, A1_12)
  A0_11:changeDisplay(A1_12)
end
function NpcSayWidget.cancelLogWait(A0_13)
  A0_13:sendControlCommand("LogControl_NpcSay", "RaptureCommands.LogControlPressKeyCancel")
end
function NpcSayWidget.changeDisplay(A0_14, A1_15)
  if A1_15 == true then
    A0_14:sendCommand("UILuaCommands.NpcSayStart")
    A0_14.work.displayWidget = true
  else
    A0_14:sendCommand("UILuaCommands.NpcSayEnd")
    A0_14.work.displayWidget = false
  end
end
