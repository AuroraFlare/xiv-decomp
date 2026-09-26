require("/Widget/Ask/AskBaseClass")
_defineClass("MateriaInformWidget", "AskBaseClass")
function MateriaInformWidget.setResultText(A0_0, A1_1, A2_2, A3_3)
  if A3_3 == nil then
    if A1_1 then
      A0_0:setText("TextBlock_InformText", 3590)
      A0_0:setStyle("TextBlock_InformText", "TBL_parameterPlus")
    else
      A0_0:setText("TextBlock_InformText", 3591)
      A0_0:setStyle("Border_AttachArrow", "BOD_trade_directionIconDown_N")
      A0_0:setStyle("TextBlock_InformText", "TBL_parameterMinus")
    end
    A0_0:setVisibility("Grid_ButtonArea", false)
  else
    if A1_1 then
      A0_0:setText("TextBlock_InformText", 3592)
      A0_0:setStyle("Border_AttachArrow", "BOD_trade_directionIconDown_H")
      A0_0:setStyle("TextBlock_InformText", "TBL_parameterPlus")
    else
      A0_0:setText("TextBlock_InformText", 3593)
      A0_0:setStyle("TextBlock_InformText", "TBL_parameterMinus")
      A0_0:setVisibility("Border_AttachArrow", false)
    end
    A0_0:setVisibility("Grid_ButtonArea", true)
  end
end
function MateriaInformWidget.setMateriaInform(A0_4, A1_5, A2_6, A3_7)
  local L4_8, L5_9, L6_10
  L5_9 = A0_4
  L4_8 = A0_4.setIcon
  L6_10 = "IconControl_ItemIcon"
  L4_8(L5_9, L6_10, A2_6:getItemIcon())
  L5_9 = A0_4
  L4_8 = A0_4.setText
  L6_10 = "TextBlock_ItemName"
  L4_8(L5_9, L6_10, 3202, A2_6:_getCatalogID(), A2_6:_getNameIndex())
end
function MateriaInformWidget.setEquipInform(A0_11, A1_12, A2_13, A3_14, A4_15)
  if A1_12 == nil then
    A0_11:setVisibility("Grid_Materialize", false)
  else
    A0_11:setIcon("IconControl_NewItemIcon", A1_12:getItemIcon())
    A0_11:setText("TextBlock_NewItemName", 3202, A1_12:_getCatalogID(), A1_12:_getNameIndex())
    if A4_15 == false then
      A2_13 = A2_13 - 1
    end
    if A2_13 > 0 then
      A0_11:setIcon("IconControl_MateriaIcon", 608)
      A0_11:setText("TextBlock_MateriaNumber", tostring(A2_13))
    elseif A1_12:getMateriaBindPermission() then
      A0_11:setVisibility("IconControl_MateriaIcon", true)
      A0_11:setIcon("IconControl_MateriaIcon", 609)
      A0_11:setVisibility("TextBlock_MateriaNumber", false)
    else
      A0_11:setVisibility("IconControl_MateriaIcon", false)
      A0_11:setVisibility("TextBlock_MateriaNumber", false)
    end
    A0_11:setVisibility("IconControl_PolishMAX", A3_14)
    A0_11:setVisibility("Grid_Materialize", true)
  end
end
function MateriaInformWidget.initAsk(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21)
  local L6_22, L7_23, L8_24, L9_25
  L7_23 = A0_16
  L6_22 = A0_16.setResultText
  L8_24 = A1_17
  L9_25 = A2_18
  L6_22(L7_23, L8_24, L9_25, A3_19)
  L7_23 = A0_16
  L6_22 = A0_16.setMateriaInform
  L8_24 = A1_17
  L9_25 = A2_18
  L6_22(L7_23, L8_24, L9_25, A3_19)
  L7_23 = A0_16
  L6_22 = A0_16.setEquipInform
  L8_24 = A3_19
  L9_25 = A4_20
  L6_22(L7_23, L8_24, L9_25, A5_21, A1_17)
  if A1_17 == false and A3_19 ~= nil and A2_18 ~= nil then
    L7_23 = A2_18
    L6_22 = A2_18.getItemRepairItem
    L6_22 = L6_22(L7_23)
    L7_23 = worldMaster
    L8_24 = L7_23
    L7_23 = L7_23._getMyPlayer
    L7_23 = L7_23(L8_24)
    L9_25 = L7_23
    L8_24 = L7_23.createVirtualItem
    L8_24 = L8_24(L9_25, L6_22)
    L9_25 = L8_24.getItemIcon
    L9_25 = L9_25(L8_24)
    A0_16:setIcon("IconControl_ItemIcon_2", L9_25)
    A0_16:setText("TextBlock_ItemName_2", 3202, L6_22, 1)
    A0_16:setVisibility("Label_Catalyst", true)
    A0_16:setVisibility("Grid_Materialize", true)
  end
  L7_23 = A0_16
  L6_22 = A0_16.setConfirmCondition
  L8_24 = "Button_OK"
  L6_22(L7_23, L8_24)
  L7_23 = A0_16
  L6_22 = A0_16.setCancelCondition
  L6_22(L7_23)
end
function MateriaInformWidget.processUICommandOperate(A0_26, A1_27, A2_28, A3_29, A4_30)
  A0_26:setBaseAskResult(1)
end
function MateriaInformWidget.processUICommandCancel(A0_31, A1_32, A2_33, A3_34, A4_35)
  A0_31:setBaseAskResult(1)
end
