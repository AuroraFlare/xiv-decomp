require("/Widget/Ask/AskBaseClass")
_defineClass("MateriaDialogWidget", "AskBaseClass")
function MateriaDialogWidget.initAsk(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7)
  A0_0.work._temp = {
    {"mode", "integer8"},
    {"index", "integer32"}
  }
  A0_0.work.mode = A1_1
  if A2_2 ~= nil then
    A0_0.work.index = A2_2 + 1
  else
    A0_0.work.index = 0
  end
  A0_0:setModal(true)
  A0_0:setConfirmCondition("Button_OK")
  A0_0:setConfirmCondition("Button_Cancel")
  A0_0:setCancelCondition("Button_OK")
  A0_0:setCancelCondition("Button_Cancel")
  A0_0:setCancelCondition("CheckBox_TrashAgree")
  A0_0:setContent("Button_OK", 3587)
  A0_0:setContent("Button_Cancel", 3588)
  if A1_1 == 1 then
    A0_0:initDialogMaterialize(A0_0.work.index)
    break
  else
  end
  if A1_1 == 2 then
    A0_0:initDialogMateriaRemove(A3_3, A4_4, A5_5, A6_6, A7_7)
    do break end
    break
  else
  end
end
function MateriaDialogWidget.processAfterShow(A0_8, A1_9)
  if A1_9 ~= true then
    A0_8:setWindowFocus("Button_Cancel")
  end
end
function MateriaDialogWidget.processUICommandOperate(A0_10, A1_11, A2_12, A3_13, A4_14)
  if A0_10.work.mode == 1 then
    if A2_12 == "Button_OK" then
      if not desktopWidget:executePlayerMaterializeCommand(A0_10.work.index) then
      end
      if A0_10:_getParentWidget() ~= nil then
        A0_10:_getParentWidget():closeMateriaList()
      end
    elseif A2_12 == "Button_Cancel" and A0_10:_getParentWidget() ~= nil then
      A0_10:_getParentWidget():closeMateriaList()
    end
    desktopWidget:closeWidgetDirect(A0_10)
  elseif A0_10.work.mode == 2 then
    if A2_12 == "Button_OK" then
      A0_10:setBaseAskResult(1)
    elseif A2_12 == "Button_Cancel" then
      A0_10:setBaseAskResult(-1)
    end
    if desktopWidget:getEventModeWidget("Ask/MateriaRemoveWidget") ~= nil then
      desktopWidget:getEventModeWidget("Ask/MateriaRemoveWidget"):closeMateriaList()
    end
  end
end
function MateriaDialogWidget.processUICommandCancel(A0_15, A1_16, A2_17, A3_18, A4_19)
  if A0_15.work.mode == 1 then
    if A2_17 == "Button_OK" or A2_17 == "CheckBox_TrashAgree" then
      A0_15:setWindowFocus("Button_Cancel")
    elseif A2_17 == "Button_Cancel" then
      if A0_15:_getParentWidget() ~= nil then
        A0_15:_getParentWidget():closeMateriaList()
      end
      desktopWidget:closeWidgetDirect(A0_15)
    end
  elseif A0_15.work.mode == 2 then
    if A2_17 == "Button_OK" then
      A0_15:setWindowFocus("Button_Cancel")
    elseif A2_17 == "Button_Cancel" then
      if desktopWidget:getEventModeWidget("Ask/MateriaRemoveWidget") ~= nil then
        desktopWidget:getEventModeWidget("Ask/MateriaRemoveWidget"):closeMateriaList()
      end
      A0_15:setBaseAskResult(-1)
    end
  end
end
function MateriaDialogWidget.initDialogMaterialize(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
  L2_22 = worldMaster
  L3_23 = L2_22
  L2_22 = L2_22._getMyPlayer
  L2_22 = L2_22(L3_23)
  L4_24 = L2_22
  L3_23 = L2_22._getItem
  L5_25 = 1
  L6_26 = A1_21
  L3_23 = L3_23(L4_24, L5_25, L6_26)
  L5_25 = A0_20
  L4_24 = A0_20.packTextParameter
  L6_26 = 3202
  L8_28 = L3_23
  L7_27 = L3_23._getCatalogID
  L7_27 = L7_27(L8_28)
  L8_28 = L3_23._getNameIndex
  L8_28 = L8_28(L3_23)
  L4_24 = L4_24(L5_25, L6_26, L7_27, L8_28, L8_28(L3_23))
  L5_25 = desktopWidget
  L6_26 = L5_25
  L5_25 = L5_25.getAttachedMateriaCountByItem
  L7_27 = L3_23
  L5_25 = L5_25(L6_26, L7_27)
  L6_26 = false
  if L5_25 > 0 then
    L6_26 = true
  end
  L7_27 = false
  L8_28 = L3_23.isEquipment
  L8_28 = L8_28(L3_23)
  if L8_28 then
    L8_28 = L3_23.canEquipSimple
    L8_28 = L8_28(L3_23, L2_22)
    if L8_28 == false then
      L7_27 = true
    end
  end
  L8_28 = A0_20.setVisibility
  L8_28(A0_20, "IconControl_NotEquiped", L7_27)
  L8_28 = false
  if L3_23:isEquipment() and L3_23:getNormalItemFitness() == 10000 then
    L8_28 = true
  end
  A0_20:setVisibility("IconControl_PolishMAX", L8_28)
  A0_20:setText("TextBlock_DialogText", 3586)
  A0_20:setIcon("IconControl_ItemIcon", L3_23:getItemIcon())
  A0_20:setText("TextBlock_ItemName", L4_24)
  A0_20:setMateriaIcon(L5_25)
  if L5_25 == 0 and L3_23:getMateriaBindPermission() == true then
    A0_20:setVisibility("IconControl_MateriaIcon", true)
    A0_20:setVisibility("TextBlock_MateriaNumber", true)
    A0_20:setIcon("IconControl_MateriaIcon", 609)
  end
  if L5_25 > 0 or L3_23:isExclusiveItem() then
    A0_20:setVisibility("Grid_TrashAgree", true)
    A0_20:setChecked("CheckBox_TrashAgree", false)
    A0_20:setEnable("Button_OK", false)
    if L5_25 > 0 then
      A0_20:setText("TextBlock_TrashAgree", 3556)
    end
    if L3_23:isExclusiveItem() then
      A0_20:setText("TextBlock_TrashAgree", 3557)
    end
  end
  A0_20:setVisibility("Grid_Price", false)
end
function MateriaDialogWidget.initDialogMateriaRemove(A0_29, A1_30, A2_31, A3_32, A4_33, A5_34)
  local L6_35, L7_36, L8_37, L9_38, L10_39
  L6_35 = worldMaster
  L7_36 = L6_35
  L6_35 = L6_35._getMyPlayer
  L6_35 = L6_35(L7_36)
  L8_37 = L6_35
  L7_36 = L6_35.createVirtualItem
  L9_38 = A1_30
  L7_36 = L7_36(L8_37, L9_38)
  L9_38 = A0_29
  L8_37 = A0_29.packTextParameter
  L10_39 = 3202
  L8_37 = L8_37(L9_38, L10_39, A1_30, A2_31)
  L9_38 = false
  if A3_32 > 0 then
    L9_38 = true
  end
  L10_39 = false
  if L7_36:isEquipment() and L7_36:canEquipSimple(L6_35) == false then
    L10_39 = true
  end
  A0_29:setVisibility("IconControl_NotEquiped", L10_39)
  A0_29:setVisibility("IconControl_PolishMAX", A5_34)
  if A4_33 > L6_35:getMoneyOnHand() then
    A0_29:setText("TextBlock_DialogText", 3597, A4_33)
    A0_29:setContent("Button_Cancel", 3581)
    A0_29:setHidden("Button_OK")
  else
    A0_29:setText("TextBlock_DialogText", 3589)
  end
  A0_29:setIcon("IconControl_ItemIcon", L7_36:getItemIcon())
  A0_29:setText("TextBlock_ItemName", L8_37)
  A0_29:setMateriaIcon(A3_32)
  if A3_32 == 0 and L7_36:getMateriaBindPermission() == true then
    A0_29:setVisibility("IconControl_MateriaIcon", true)
    A0_29:setVisibility("TextBlock_MateriaNumber", true)
    A0_29:setIcon("IconControl_MateriaIcon", 609)
  end
  A0_29:setText("TextBlock_Price", 225, A4_33)
  A0_29:setVisibility("Grid_Price", true)
end
function MateriaDialogWidget.setMateriaIcon(A0_40, A1_41)
  if A1_41 > 0 then
    A0_40:setIcon("IconControl_MateriaIcon", 608)
    A0_40:setText("TextBlock_MateriaNumber", tostring(A1_41))
    A0_40:setVisibility("IconControl_MateriaIcon", true)
    A0_40:setVisibility("TextBlock_MateriaNumber", true)
  else
    A0_40:setHidden("IconControl_MateriaIcon")
    A0_40:setHidden("TextBlock_MateriaNumber")
  end
end
function MateriaDialogWidget.setWindowFocus(A0_42, A1_43)
  if A1_43 ~= nil and A1_43 ~= "" then
    A0_42:setLogicalFocus(A1_43)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_42 then
      A0_42:setKeyboardFocusedControl(A1_43)
    end
  end
end
