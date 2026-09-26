require("/Widget/WidgetBaseClass")
_defineClass("CutSceneSkipWidget", "WidgetBaseClass")
function CutSceneSkipWidget.init(A0_0)
  A0_0:setConfirmCondition("Button_CutSceneSkip")
end
function CutSceneSkipWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  local L7_6, L8_7, L9_8, L10_9, L11_10
  L7_6 = A2_3
  if L7_6 == "Button_CutSceneSkip" then
    L8_7 = desktopWidget
    L9_8 = L8_7
    L8_7 = L8_7.openChildWidget
    L10_9 = "CommonAskWidget"
    L11_10 = A0_1
    L8_7(L9_8, L10_9, L11_10, true, nil, A0_1:packTextParameter(1022), 2, A0_1:packTextParameter(1023), A0_1:packTextParameter(1024))
    do break end
    break
  else
  end
end
function CutSceneSkipWidget.processAskResult(A0_11, A1_12)
  if A1_12 == 1 and A0_11:getArgActor() ~= nil then
    A0_11:getArgActor():_skip()
    A0_11:setArgActor(nil)
  end
  A0_11:hide()
end
function CutSceneSkipWidget.skipDirect(A0_13)
  A0_13:sendControlCommand("Button_CutSceneSkip", "UILuaCommands.Operate")
end
function CutSceneSkipWidget.clear(A0_14)
  local L1_15
  L1_15 = A0_14.getChildWidgetByWindowName
  L1_15 = L1_15(A0_14, "CommonAskWidget")
  if L1_15 ~= nil then
    desktopWidget:closeWidgetDirect(L1_15)
  end
  A0_14:setArgActor(nil)
  A0_14:hide()
end
