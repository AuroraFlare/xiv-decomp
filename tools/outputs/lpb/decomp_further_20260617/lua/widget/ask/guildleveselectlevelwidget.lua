require("/Widget/Ask/AskBaseClass")
_defineClass("GuildleveSelectLevelWidget", "AskBaseClass")
function GuildleveSelectLevelWidget.initAsk(A0_0, A1_1)
  A0_0.work._temp = {}
  A0_0:_setProperty(nil, "TextBlock_Title", "Text", worldMaster, 50015)
  A0_0:setConfirmCondition("ListBoxItem_Level_1")
  A0_0:_setProperty(nil, "ListBoxItem_Level_1" .. ":TextBlock_Lebel", "Text", worldMaster, 50016)
  if A1_1 == nil then
    A1_1 = 5
  end
  if A1_1 > 1 then
    A0_0:setConfirmCondition("ListBoxItem_Level_2")
    A0_0:_setProperty(nil, "ListBoxItem_Level_2" .. ":TextBlock_Lebel", "Text", worldMaster, 50017)
  else
    A0_0:setItemVisibility(nil, "ListBoxItem_Level_2", false)
  end
  if A1_1 > 2 then
    A0_0:setConfirmCondition("ListBoxItem_Level_3")
    A0_0:_setProperty(nil, "ListBoxItem_Level_3" .. ":TextBlock_Lebel", "Text", worldMaster, 50018)
  else
    A0_0:setItemVisibility(nil, "ListBoxItem_Level_3", false)
  end
  if A1_1 > 3 then
    A0_0:setConfirmCondition("ListBoxItem_Level_4")
    A0_0:_setProperty(nil, "ListBoxItem_Level_4" .. ":TextBlock_Lebel", "Text", worldMaster, 50019)
  else
    A0_0:setItemVisibility(nil, "ListBoxItem_Level_4", false)
  end
  if A1_1 > 4 then
    A0_0:setConfirmCondition("ListBoxItem_Level_5")
    A0_0:_setProperty(nil, "ListBoxItem_Level_5" .. ":TextBlock_Lebel", "Text", worldMaster, 50020)
  else
    A0_0:setItemVisibility(nil, "ListBoxItem_Level_5", false)
  end
  A0_0:setConfirmCondition("Button_Cancel")
  A0_0:_setProperty(nil, "Button_Cancel", "Content", worldMaster, 50021)
  A0_0:setCancelCondition()
end
function GuildleveSelectLevelWidget.processUICommandOperate(A0_2, A1_3, A2_4, A3_5, A4_6)
  if A2_4 == "ListBoxItem_Level_1" then
    A0_2:setBaseAskResult(1)
  elseif A2_4 == "ListBoxItem_Level_2" then
    A0_2:setBaseAskResult(2)
  elseif A2_4 == "ListBoxItem_Level_3" then
    A0_2:setBaseAskResult(3)
  elseif A2_4 == "ListBoxItem_Level_4" then
    A0_2:setBaseAskResult(4)
  elseif A2_4 == "ListBoxItem_Level_5" then
    A0_2:setBaseAskResult(5)
  elseif A2_4 == "Button_Cancel" then
    A0_2:setBaseAskResult(-1)
  end
end
function GuildleveSelectLevelWidget.processUICommandCancel(A0_7, A1_8, A2_9, A3_10, A4_11)
  A0_7:setBaseAskResult(-1)
end
