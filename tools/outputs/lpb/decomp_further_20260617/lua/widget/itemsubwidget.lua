require("/Widget/WidgetBaseClass")
_defineClass("ItemSubWidget", "WidgetBaseClass")
function ItemSubWidget.init(A0_0, A1_1)
  A0_0.work._temp = {
    {"chosenItem", "integer32"},
    {
      "chosenPackage",
      "integer32"
    },
    {
      "chosenOwner",
      "integer8"
    },
    {
      "chosenOperation",
      "integer32"
    },
    {"mode", "integer16"},
    {"closeok", "boolean"}
  }
  A0_0.work.chosenItem = 0
  A0_0.work.chosenOperation = 0
  A0_0:initForm()
  A0_0:setWindowFocus("Button_Cancel")
  A0_0:hide()
  A0_0:setModal(true)
end
function ItemSubWidget.initForm(A0_2)
  A0_2:setButtonEvents("Button_BazaarAbort")
  A0_2:setButtonEvents("Button_BazaarSell")
  A0_2:setButtonEvents("Button_BazaarBuy")
  A0_2:setButtonEvents("Button_BazaarRepair")
  A0_2:setButtonEvents("Button_Repair")
  A0_2:setButtonEvents("Button_Materialize")
  A0_2:setButtonEvents("Button_MateriaAttach")
  A0_2:setButtonEvents("Button_MateriaOrder")
  A0_2:setButtonEvents("Button_MateriaAbort")
  A0_2:setButtonEvents("Button_MateriaView")
  A0_2:setButtonEvents("Button_DropItemGetAll")
  A0_2:setButtonEvents("Button_DropItemGiveAll")
  A0_2:setButtonEvents("Button_Trash")
  A0_2:setButtonEvents("Button_Sort")
  A0_2:setButtonEvents("Button_Cancel")
end
function ItemSubWidget.setButtonEvents(A0_3, A1_4)
  local L2_5
  L2_5 = A0_3._getProperty
  L2_5 = L2_5(A0_3, nil, A1_4, "Command")
  A0_3:setControlCommandCondition(A1_4, L2_5)
  A0_3:setCancelCondition(A1_4)
end
function ItemSubWidget.setWindowFocus(A0_6, A1_7)
  if A1_7 ~= nil and A1_7 ~= "" then
    A0_6:setLogicalFocus(A1_7)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_6 then
      A0_6:setKeyboardFocusedControl(A1_7)
    end
  end
end
function ItemSubWidget.setSubMenuVisibility(A0_8, A1_9, A2_10)
  local L3_11
  L3_11 = A2_10
  if L3_11 == 0 then
    A0_8:setVisibility(A1_9, false)
    A0_8:setEnable(A1_9, false)
    break
  else
  end
  if L3_11 == 1 then
    A0_8:setVisibility(A1_9, true)
    A0_8:setEnable(A1_9, false)
    break
  else
  end
  if L3_11 == 2 then
    A0_8:setVisibility(A1_9, true)
    A0_8:setEnable(A1_9, true)
    do break end
    break
  else
  end
end
function ItemSubWidget.processUICommandOperate(A0_12, A1_13, A2_14, A3_15, A4_16)
  if A2_14 == "Button_BazaarAbort" then
    if A0_12:_getParentWidget():operateBazaarAbort() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_BazaarSell" then
    if A0_12:_getParentWidget():operateBazaarSell() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_BazaarBuy" then
    if A0_12:_getParentWidget():operateBazaarBuy() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_BazaarRepair" then
    if A0_12:_getParentWidget():operateBazaarRepair() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_Repair" then
    if A0_12:_getParentWidget():operateRepair() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_Materialize" then
    if A0_12:_getParentWidget():operateMaterialize() then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_MateriaAttach" then
    if A0_12:_getParentWidget():operateMateriaAttach(12) then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_MateriaOrder" then
    if A0_12:_getParentWidget():operateMateriaAttach(13) then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_MateriaAbort" then
    if A0_12:_getParentWidget():operateMateriaAbort() then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_MateriaView" then
    if A0_12:_getParentWidget():operateMateriaView() then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_DropItemGetAll" then
    if A0_12:_getParentWidget():operateGetDrop() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_DropItemGiveAll" then
    if A0_12:_getParentWidget():operateShareDrop() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_Trash" then
    if A0_12:_getParentWidget():operateTrash() == true then
      return A0_12:_getParentWidget():closeSubWidget()
    end
  elseif A2_14 == "Button_Sort" then
    if desktopWidget:openChildWidget("SortChangeWidget", A0_12, true, A0_12, A0_12:_getParentWidget():getCurrentSortType()) then
    end
  elseif A2_14 == "Button_Cancel" then
    return A0_12:_getParentWidget():closeSubWidget()
  end
end
function ItemSubWidget.processUICommandCancel(A0_17, A1_18, A2_19, A3_20, A4_21)
  return A0_17:_getParentWidget():closeSubWidget()
end
function ItemSubWidget.processUICommandClose(A0_22, A1_23, A2_24, A3_25, A4_26)
  return A0_22:_getParentWidget():closeSubWidget()
end
function ItemSubWidget.setSortSub(A0_27, A1_28)
  if A0_27:_getParentWidget():operateSort(A1_28) == true then
    return A0_27:_getParentWidget():closeSubWidget()
  end
end
