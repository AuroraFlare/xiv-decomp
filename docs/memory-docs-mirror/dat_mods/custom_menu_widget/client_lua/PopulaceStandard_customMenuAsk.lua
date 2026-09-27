-- Reference Lua for the API23 CustomMenuWidget overlay.
-- Every short phase reacquires the exact typed AskWidget == generic slot-4
-- root. Only declared AskWidget work is retained between calls.

local function exactAsk()
  local widget = desktopWidget:getWidget(4, "Ask/AskWidget")
  if widget == nil then return nil, -105 end
  if desktopWidget:getWidget(4, nil) ~= widget then return nil, -106 end
  return widget, 1
end

function PopulaceStandard.customMenuApiVersion(self) return 23 end

function PopulaceStandard.customMenuOpen(self)
  if desktopWidget:getWidget(4, nil) ~= nil then return -101 end
  if desktopWidget:isCreateWidgetCommandPlaying() ~= false then return -102 end
  if desktopWidget:openWidget(4, "Ask/AskWidget", nil, nil, false) ~= true then return -103 end
  for _ = 1, 10 do
    if desktopWidget:isCreateWidgetCommandPlaying() == false then
      local _, result = exactAsk()
      return result
    end
    desktopWidget:_wait(0.1)
  end
  desktopWidget:cancelWidgetCommand()
  return -104
end

function PopulaceStandard.customMenuReset(self, answerCount)
  local widget, result = exactAsk(); if widget == nil then return result end
  widget.askWork.askResult = 0
  widget.askWork.inputControlFlag = true
  widget.work.askAnswerMax = answerCount
  widget.work.askPaging = false
  widget.work.canCancel = true
  widget.work.askPageMax = answerCount > 16 and 3 or (answerCount > 8 and 2 or 1)
  widget.work.askPageNow = 1
  widget.work.askDefaultAnswer = 1
  widget:_setProperty(nil, "TextBlock_Question", "Text", "")
  for index = 1, 24 do
    local item = "Item_Answers" .. tostring(index)
    widget:_setProperty(item, "TemplateButton_Answer", "Content", "")
    widget:_setProperty(item, item, "Visibility", "Collapsed")
  end
  return 1
end

function PopulaceStandard.customMenuSetTitle(self, title)
  local widget, result = exactAsk(); if widget == nil then return result end
  widget:_setProperty(nil, "TextBlock_Question", "Text", title)
  return 1
end

function PopulaceStandard.customMenuSetRow(self, index, label)
  local widget, result = exactAsk(); if widget == nil then return result end
  local item = "Item_Answers" .. tostring(index)
  widget:_setProperty(item, "TemplateButton_Answer", "Content", label)
  widget:_setProperty(item, item, "Visibility", index <= 8 and "Visible" or "Collapsed")
  return 1
end

function PopulaceStandard.customMenuSetPaging(self, answerCount)
  local widget, result = exactAsk(); if widget == nil then return result end
  widget.work.askPageMax = answerCount > 16 and 3 or (answerCount > 8 and 2 or 1)
  widget:_setProperty(nil, "Grid_Button", "Visibility", widget.work.askPageMax > 1 and "Visible" or "Collapsed")
  widget:pageChange(1)
  return 1
end

function PopulaceStandard.customMenuShow(self)
  local widget, result = exactAsk(); if widget == nil then return result end
  if widget:show() ~= true then return -107 end
  if desktopWidget:changeFocusedWidget(widget, false, false) ~= true then return -107 end
  if widget:processAfterShow(false) ~= true then return -107 end
  return 1
end

function PopulaceStandard.customMenuPoll(self)
  local widget, result = exactAsk(); if widget == nil then return result end
  result = widget.askWork.askResult; if result ~= 0 then return result end
  desktopWidget:_wait(0.1)
  widget, result = exactAsk(); if widget == nil then return result end
  result = widget.askWork.askResult; if result ~= 0 then return result end
  desktopWidget:_wait(0.1)
  widget, result = exactAsk(); if widget == nil then return result end
  result = widget.askWork.askResult; if result ~= 0 then return result end
  desktopWidget:_wait(0.1)
  widget, result = exactAsk(); if widget == nil then return result end
  result = widget.askWork.askResult; if result ~= 0 then return result end
  desktopWidget:_wait(0.1)
  widget, result = exactAsk(); if widget == nil then return result end
  result = widget.askWork.askResult; if result ~= 0 then return result end
  desktopWidget:_wait(0.1)
  widget, result = exactAsk(); if widget == nil then return result end
  return widget.askWork.askResult
end
function PopulaceStandard.customMenuHide(self)
  local widget, result = exactAsk(); if widget == nil then return result end
  if widget:hide(false, false, false) ~= true then return -107 end
  return 1
end

function PopulaceStandard.customMenuClose(self)
  local widget, result = exactAsk(); if widget == nil then return result end
  if desktopWidget:closeWidgetDirect(widget) ~= true then return -108 end
  for _ = 1, 10 do
    if desktopWidget:getWidget(4, "Ask/AskWidget") == nil
      and desktopWidget:getWidget(4, nil) == nil
      and desktopWidget:isCreateWidgetCommandPlaying() == false then return 1 end
    desktopWidget:_wait(0.1)
  end
  return -109
end

function PopulaceStandard.customMenuAskRows(self, textOwner, questionRow, answerCount, ...)
  return self:ask(textOwner, questionRow, answerCount, ...)
end

function PopulaceStandard.customNpcSay(self, textOwner, textRow, animationId, ...)
  return self:say(textOwner, textRow, animationId, ...)
end
