require("/Widget/WidgetBaseClass")
_defineClass("SortChangeWidget", "WidgetBaseClass")
function SortChangeWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "ItemSubWidget"
  return L1_1
end
function SortChangeWidget.init(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = A0_2.work
  L3_5._temp = {}
  L3_5 = A0_2.initForm
  L3_5(A0_2)
  if A2_4 == 0 then
    L3_5 = A0_2.setWindowFocus
    L3_5(A0_2, "Button_BazaarAbort")
  elseif A2_4 == 1 then
    L3_5 = A0_2.setWindowFocus
    L3_5(A0_2, "Button_BazaarSell")
  elseif A2_4 == 2 then
    L3_5 = A0_2.setWindowFocus
    L3_5(A0_2, "Button_BazaarBuy")
  elseif A2_4 == 3 then
    L3_5 = A0_2.setWindowFocus
    L3_5(A0_2, "Button_BazaarRepair")
  elseif A2_4 == 4 then
    L3_5 = A0_2.setWindowFocus
    L3_5(A0_2, "Button_Repair")
  else
    L3_5 = A0_2.setWindowFocus
    L3_5(A0_2, "Button_Cancel")
  end
  L3_5 = A0_2.setModal
  L3_5(A0_2, true)
  L3_5 = A1_3.getWindowPosition
  L3_5 = L3_5(A1_3)
  A0_2:setProperty("Top", L3_5(A1_3) + 80)
  A0_2:setProperty("Left", L3_5)
end
function SortChangeWidget.initForm(A0_6)
  A0_6:setButtonEvents("Button_BazaarAbort")
  A0_6:setContent("Button_BazaarAbort", 3186)
  A0_6:setControlProperty("Button_BazaarAbort", "Foreground", "#ffe57a45")
  A0_6:setButtonEvents("Button_BazaarSell")
  A0_6:setContent("Button_BazaarSell", 3177)
  A0_6:setControlProperty("Button_BazaarSell", "Foreground", "#ff99ffb3")
  A0_6:setButtonEvents("Button_BazaarBuy")
  A0_6:setContent("Button_BazaarBuy", 3178)
  A0_6:setControlProperty("Button_BazaarBuy", "Foreground", "#ff99ffb3")
  A0_6:setButtonEvents("Button_BazaarRepair")
  A0_6:setContent("Button_BazaarRepair", 3179)
  A0_6:setControlProperty("Button_BazaarRepair", "Foreground", "#ff99ffb3")
  A0_6:setButtonEvents("Button_Repair")
  A0_6:setContent("Button_Repair", 3180)
  A0_6:setControlProperty("Button_Repair", "Foreground", "#ff99ffb3")
  A0_6:setVisibility("Button_Materialize", false)
  A0_6:setVisibility("Button_MateriaAttach", false)
  A0_6:setVisibility("Button_MateriaOrder", false)
  A0_6:setVisibility("Button_MateriaAbort", false)
  A0_6:setVisibility("Button_MateriaView", false)
  A0_6:setVisibility("Button_DropItemGetAll", false)
  A0_6:setVisibility("Button_DropItemGiveAll", false)
  A0_6:setVisibility("Button_Trash", false)
  A0_6:setVisibility("Button_Sort", false)
  A0_6:setButtonEvents("Button_Cancel")
end
function SortChangeWidget.setButtonEvents(A0_7, A1_8)
  local L2_9
  L2_9 = A0_7._getProperty
  L2_9 = L2_9(A0_7, nil, A1_8, "Command")
  A0_7:setControlCommandCondition(A1_8, L2_9)
  A0_7:setCancelCondition(A1_8)
  A0_7:setHelpParameter(A1_8, 0)
end
function SortChangeWidget.setWindowFocus(A0_10, A1_11)
  if A1_11 ~= nil and A1_11 ~= "" then
    A0_10:setLogicalFocus(A1_11)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_10 then
      A0_10:setKeyboardFocusedControl(A1_11)
    end
  end
end
function SortChangeWidget.processUICommandOperate(A0_12, A1_13, A2_14, A3_15, A4_16)
  if A2_14 == "Button_BazaarAbort" then
    A0_12:_getParentWidget():setSortSub(0)
    return desktopWidget:closeWidgetDirect(A0_12)
  elseif A2_14 == "Button_BazaarSell" then
    A0_12:_getParentWidget():setSortSub(1)
    return desktopWidget:closeWidgetDirect(A0_12)
  elseif A2_14 == "Button_BazaarBuy" then
    A0_12:_getParentWidget():setSortSub(2)
    return desktopWidget:closeWidgetDirect(A0_12)
  elseif A2_14 == "Button_BazaarRepair" then
    A0_12:_getParentWidget():setSortSub(3)
    return desktopWidget:closeWidgetDirect(A0_12)
  elseif A2_14 == "Button_Repair" then
    A0_12:_getParentWidget():setSortSub(4)
    return desktopWidget:closeWidgetDirect(A0_12)
  elseif A2_14 == "Button_Cancel" then
    return desktopWidget:closeWidgetDirect(A0_12)
  end
end
function SortChangeWidget.processUICommandCancel(A0_17, A1_18, A2_19, A3_20, A4_21)
  return desktopWidget:closeWidgetDirect(A0_17)
end
