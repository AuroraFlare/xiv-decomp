require("/Widget/WidgetBaseClass")
_defineClass("ItemStorageDialogWidget", "WidgetBaseClass")
function ItemStorageDialogWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9)
  A0_0.work._temp = {
    {"dialogType", "integer16"},
    {"catalogId", "integer32"},
    {"iconId", "integer32"},
    {"quality", "integer16"},
    {
      "name",
      "string",
      64
    },
    {"cantEquip", "boolean"},
    {"polish", "boolean"},
    {
      "polishProgress",
      "integer16"
    },
    {
      "materialize",
      "boolean"
    }
  }
  A0_0.work.dialogType = A1_1
  A0_0.work.catalogId = A2_2
  A0_0.work.iconId = 0
  A0_0.work.quality = 0
  A0_0.work.name = ""
  A0_0.work.cantEquip = false
  A0_0.work.polish = false
  A0_0.work.polishProgress = 0
  A0_0.work.materialize = false
  if A0_0.work.dialogType == 1 then
    A0_0.work.iconId = A3_3
    A0_0.work.quality = A4_4
    A0_0.work.name = A5_5
    A0_0.work.cantEquip = A6_6
    A0_0.work.polish = A7_7
    A0_0.work.polishProgress = A8_8
    A0_0.work.materialize = A9_9
    break
  else
  end
  A0_0:initForm()
  A0_0:setWindowFocus("Button_Cancel")
  A0_0:setConfirmCondition("Button_OK")
  A0_0:setConfirmCondition("Button_Cancel")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
end
function ItemStorageDialogWidget.initForm(A0_10)
  local L1_11, L2_12, L3_13
  L1_11 = A0_10.work
  L1_11 = L1_11.dialogType
  if L1_11 == 1 then
    L3_13 = A0_10
    L2_12 = A0_10.setIcon
    L2_12(L3_13, "IconControl_ItemIcon", A0_10.work.iconId)
    L3_13 = A0_10
    L2_12 = A0_10.setVisibility
    L2_12(L3_13, "IconControl_ItemIcon", true)
    L3_13 = A0_10
    L2_12 = A0_10.setVisibility
    L2_12(L3_13, "IconControl_NotEquiped", A0_10.work.cantEquip)
    L3_13 = A0_10
    L2_12 = A0_10.setText
    L2_12(L3_13, "TextBlock_ItemName", A0_10.work.name)
    L3_13 = A0_10
    L2_12 = A0_10.setStyle
    L2_12(L3_13, "TextBlock_ItemName", "TBL_null")
    L3_13 = A0_10
    L2_12 = A0_10.setVisibility
    L2_12(L3_13, "TextBlock_ItemName", true)
    L3_13 = A0_10
    L2_12 = A0_10.setVisibility
    L2_12(L3_13, "Grid_ItemPolish", A0_10.work.polish)
    L2_12 = A0_10.work
    L2_12 = L2_12.polish
    if L2_12 == true then
      L3_13 = A0_10
      L2_12 = A0_10.setValue
      L2_12(L3_13, "ProgressBar_ItemPolish", A0_10.work.polishProgress)
      L3_13 = A0_10
      L2_12 = A0_10.setText
      L2_12(L3_13, "TextBlock_Text", 3911)
      L3_13 = A0_10
      L2_12 = A0_10.setVisibility
      L2_12(L3_13, "Grid_MateriaPossible", A0_10.work.materialize)
    else
      L3_13 = A0_10
      L2_12 = A0_10.setText
      L2_12(L3_13, "TextBlock_Text", 3912)
      do break end
      else
      end
      if L1_11 == 2 then
        L2_12 = worldMaster
        L3_13 = L2_12
        L2_12 = L2_12._getMyPlayer
        L2_12 = L2_12(L3_13)
        L3_13 = L2_12.createVirtualItem
        L3_13 = L3_13(L2_12, A0_10.work.catalogId)
        if L3_13 ~= nil then
          A0_10.work.iconId = L3_13:getItemIcon()
          A0_10.work.quality = L3_13:_getNameIndex()
          A0_10.work.name = A0_10:packTextParameter(3202, A0_10.work.catalogId, A0_10.work.quality)
          A0_10.work.cantEquip = desktopWidget:cantEquipPlayer(L3_13)
        else
          return false
        end
        A0_10:setIcon("IconControl_ItemIcon", A0_10.work.iconId)
        A0_10:setVisibility("IconControl_ItemIcon", true)
        A0_10:setVisibility("IconControl_NotEquiped", A0_10.work.cantEquip)
        A0_10:setText("TextBlock_ItemName", A0_10.work.name)
        A0_10:setStyle("TextBlock_ItemName", "TBL_null")
        A0_10:setVisibility("TextBlock_ItemName", true)
        A0_10:setText("TextBlock_Text", 3913)
        A0_10:setVisibility("Grid_ItemPolish", A0_10.work.polish)
        A0_10:setVisibility("Grid_MateriaPossible", A0_10.work.materialize)
        break
      else
      end
    end
  L2_12 = A0_10
  L1_11 = A0_10.setContent
  L3_13 = "Button_OK"
  L1_11(L2_12, L3_13, 3914)
  L2_12 = A0_10
  L1_11 = A0_10.setContent
  L3_13 = "Button_Cancel"
  L1_11(L2_12, L3_13, 3915)
end
function ItemStorageDialogWidget.processBeforeShow(A0_14, A1_15)
  local L2_16
  L2_16 = A0_14.work
  L2_16 = L2_16.dialogType
  if L2_16 == 1 then
    if A0_14.work.materialize == true then
      A0_14:_sendStoryboardCommand(nil, "Label_MateriaPossibleEffect", "UILuaCommands.MateriaPossibleEffectStop")
      if A0_14.work.polishProgress >= 100 then
        A0_14:_sendStoryboardCommand(nil, "Label_MateriaPossibleEffect", "UILuaCommands.MateriaPossibleEffectStart")
      end
    else
    end
  else
    if L2_16 == 2 then
  end
  L2_16 = true
  return L2_16
end
function ItemStorageDialogWidget.processUICommandOperate(A0_17, A1_18, A2_19, A3_20, A4_21)
  if A0_17:_getParentWidget() ~= nil then
    if A0_17:_getParentWidget():getAskWaitStatus() == false then
      return
    end
    if A2_19 == "Button_OK" then
      A0_17:_getParentWidget():setConfirmDialogData(1)
      A0_17:_getParentWidget():closeConfirmDialog()
    elseif A2_19 == "Button_Cancel" then
      A0_17:_getParentWidget():setConfirmDialogData(2)
      A0_17:_getParentWidget():closeConfirmDialog()
    end
  end
end
function ItemStorageDialogWidget.processUICommandCancel(A0_22, A1_23, A2_24, A3_25, A4_26)
  if A0_22:_getParentWidget() ~= nil and A0_22:_getParentWidget():getAskWaitStatus() == false then
    return
  end
  if A0_22:getKeyboardFocusedControl() ~= nil then
    if A0_22:getKeyboardFocusedControl() == "Button_OK" then
      A0_22:setWindowFocus("Button_Cancel")
    elseif A0_22:getKeyboardFocusedControl() == "Button_Cancel" and A0_22:_getParentWidget() ~= nil then
      A0_22:_getParentWidget():setConfirmDialogData(2)
      A0_22:_getParentWidget():closeConfirmDialog()
    end
  end
end
function ItemStorageDialogWidget.setWindowFocus(A0_27, A1_28)
  if A1_28 ~= nil and A1_28 ~= "" then
    A0_27:setLogicalFocus(A1_28)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_27 then
      A0_27:setKeyboardFocusedControl(A1_28)
    end
  end
end
