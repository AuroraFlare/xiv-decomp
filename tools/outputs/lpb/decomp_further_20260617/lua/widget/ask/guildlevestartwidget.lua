require("/Widget/Ask/AskBaseClass")
_defineClass("GuildleveStartWidget", "AskBaseClass")
function GuildleveStartWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  A0_0.work._temp = {}
  A0_0:_setProperty(nil, "TextBlock_GuildleveTitle", "Text", worldMaster, 33601, A1_1)
  A0_0:setConfirmCondition("Button_Begin")
  A0_0:setContent("Button_Begin", 4203)
  A0_0:setConfirmCondition("Button_Discontinue")
  A0_0:setContent("Button_Discontinue", 4204)
  if A2_2 == 1 then
    A0_0:_setProperty(nil, "TextBlock_Level", "Text", worldMaster, 50016)
  elseif A2_2 == 2 then
    A0_0:_setProperty(nil, "TextBlock_Level", "Text", worldMaster, 50017)
  elseif A2_2 == 3 then
    A0_0:_setProperty(nil, "TextBlock_Level", "Text", worldMaster, 50018)
  elseif A2_2 == 4 then
    A0_0:_setProperty(nil, "TextBlock_Level", "Text", worldMaster, 50019)
  elseif A2_2 == 5 then
    A0_0:_setProperty(nil, "TextBlock_Level", "Text", worldMaster, 50020)
  else
    A0_0:setVisibility("Grid_Level", false)
  end
  if A3_3 > 0 then
    A0_0:setText("TextBlock_BP", 4326, A3_3, A4_4, A5_5)
  else
    A0_0:setVisibility("TextBlock_BP", false)
  end
  if A6_6 ~= 0 or A7_7 ~= 0 or A8_8 ~= 0 or A9_9 ~= 0 or A10_10 ~= 0 then
    A0_0:setText("TextBlock_Attention", 4325, A6_6, A7_7, A8_8, A9_9, A10_10)
  else
    A0_0:setVisibility("Grid_Attention", false)
  end
  A0_0:setCancelCondition()
end
function GuildleveStartWidget.processUICommandOperate(A0_11, A1_12, A2_13, A3_14, A4_15)
  if A2_13 == "Button_Begin" then
    A0_11:setBaseAskResult(1)
  elseif A2_13 == "Button_Discontinue" then
    A0_11:setBaseAskResult(-1)
  end
end
function GuildleveStartWidget.processUICommandCancel(A0_16, A1_17, A2_18, A3_19, A4_20)
  A0_16:setBaseAskResult(-1)
end
