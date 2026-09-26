require("/Widget/WidgetBaseClass")
_defineClass("ItemEditWidget", "WidgetBaseClass")
function ItemEditWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
  A0_0.work._temp = {
    {"mode", "integer8"},
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
    {"stack", "integer32"},
    {"stackable", "boolean"},
    {"stackMax", "integer32"},
    {"enableOK", "boolean"},
    {"num1", "integer32"},
    {"num2", "integer32"},
    {
      "item",
      "string",
      16
    },
    {
      "commandThrow",
      "boolean"
    },
    {"wastelevel", "integer8"},
    {"wastestep", "integer8"},
    {"error", "boolean"},
    {"bakcatalog", "integer32"},
    {"bakquality", "integer8"},
    {"bakstack", "integer32"},
    {"bakrare", "boolean"},
    {"bakex", "boolean"},
    {"baklife", "integer32"},
    {"bakpolish", "integer32"},
    {"bakmateria", "integer8"}
  }
  A0_0.work.chosenOperation = 0
  A0_0.work.commandThrow = true
  A0_0.work.error = false
  A0_0:setCancelCondition()
  A0_0:setConfirmCondition("Button_OK")
  A0_0:setConfirmCondition("Button_Cancel")
  A0_0:setCancelCondition("Button_Cancel")
  A0_0:setInitialData(A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
  A0_0:setHelpParameter("Button_OK", 0)
  A0_0:setHelpParameter("Button_Cancel", 0)
end
function ItemEditWidget.setInitialData(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12, A6_13)
  local L7_14, L8_15, L9_16, L10_17, L11_18, L12_19
  L7_14 = A0_7.work
  L7_14.mode = A2_9
  L7_14 = A0_7.work
  L7_14.mode = 3
  L7_14 = A0_7.work
  L7_14.num1 = 1
  L7_14 = A0_7.work
  L7_14.num2 = 1
  L8_15 = A0_7
  L7_14 = A0_7.setModal
  L9_16 = A1_8
  L7_14(L8_15, L9_16)
  L7_14 = A0_7.work
  L7_14.chosenPackage = A3_10
  L7_14 = A0_7.work
  L7_14.chosenItem = A4_11
  L7_14 = A0_7.work
  L7_14.wastelevel = 0
  L7_14 = nil
  if A5_12 ~= nil then
    L8_15 = A0_7.work
    L8_15.chosenOwner = A5_12
  else
    L8_15 = A0_7.work
    L8_15.chosenOwner = 1
  end
  L8_15 = worldMaster
  L9_16 = L8_15
  L8_15 = L8_15._getMyPlayer
  L8_15 = L8_15(L9_16)
  L9_16 = A0_7.work
  L9_16 = L9_16.chosenOwner
  if L9_16 == 1 then
    L9_16 = A0_7.work
    L9_16.commandThrow = true
    L10_17 = L8_15
    L9_16 = L8_15._getItem
    L11_18 = A0_7.work
    L11_18 = L11_18.chosenPackage
    L12_19 = A0_7.work
    L12_19 = L12_19.chosenItem
    L9_16 = L9_16(L10_17, L11_18, L12_19)
    L7_14 = L9_16
  else
    L9_16 = A0_7.work
    L9_16 = L9_16.chosenOwner
    if L9_16 == 2 then
      L9_16 = A0_7.work
      L9_16.commandThrow = false
      L9_16 = desktopWidget
      L10_17 = L9_16
      L9_16 = L9_16.getBazaarItem
      L11_18 = A0_7.work
      L11_18 = L11_18.chosenPackage
      L12_19 = A0_7.work
      L12_19 = L12_19.chosenItem
      L9_16 = L9_16(L10_17, L11_18, L12_19)
      L7_14 = L9_16
    else
      L9_16 = A0_7.work
      L9_16 = L9_16.chosenOwner
      if L9_16 == 4 then
        L9_16 = A0_7.work
        L9_16.commandThrow = false
        L9_16 = desktopWidget
        L10_17 = L9_16
        L9_16 = L9_16.getRetainerItem
        L11_18 = A0_7.work
        L11_18 = L11_18.chosenPackage
        L12_19 = A0_7.work
        L12_19 = L12_19.chosenItem
        L9_16 = L9_16(L10_17, L11_18, L12_19)
        L7_14 = L9_16
      end
    end
  end
  if L7_14 == nil then
    L9_16 = A0_7.work
    L9_16.error = true
  else
    L10_17 = A0_7
    L9_16 = A0_7.checkMateriaLicense
    L9_16 = L9_16(L10_17)
    L11_18 = A6_13
    L10_17 = A6_13.checkChosenItem
    L12_19 = L7_14
    L10_17 = L10_17(L11_18, L12_19)
    if L10_17 == false then
      L10_17 = A0_7.work
      L10_17.error = true
    else
      L11_18 = A0_7
      L10_17 = A0_7.setIcon
      L12_19 = "IconControl_ItemIcon"
      L10_17(L11_18, L12_19, L7_14:getItemIcon())
      L10_17 = A0_7.work
      L12_19 = L7_14
      L11_18 = L7_14._getCatalogID
      L11_18 = L11_18(L12_19)
      L10_17.bakcatalog = L11_18
      L10_17 = A0_7.work
      L12_19 = L7_14
      L11_18 = L7_14._getNameIndex
      L11_18 = L11_18(L12_19)
      L10_17.bakquality = L11_18
      L10_17 = A0_7.work
      L12_19 = L7_14
      L11_18 = L7_14._countStack
      L11_18 = L11_18(L12_19)
      L10_17.bakstack = L11_18
      L10_17 = A0_7.work
      L12_19 = L7_14
      L11_18 = L7_14.isRareItem
      L11_18 = L11_18(L12_19)
      L10_17.bakrare = L11_18
      L10_17 = A0_7.work
      L12_19 = L7_14
      L11_18 = L7_14.isExclusiveItem
      L11_18 = L11_18(L12_19)
      L10_17.bakex = L11_18
      L10_17 = A0_7.work
      L12_19 = L7_14
      L11_18 = L7_14.getItemLife
      L11_18 = L11_18(L12_19)
      L10_17.baklife = L11_18
      L11_18 = L7_14
      L10_17 = L7_14.isEquipment
      L10_17 = L10_17(L11_18)
      if L10_17 then
        L10_17 = A0_7.work
        L12_19 = L7_14
        L11_18 = L7_14.getNormalItemFitness
        L11_18 = L11_18(L12_19)
        L10_17.bakpolish = L11_18
        L11_18 = L7_14
        L10_17 = L7_14.getMaterializePermission
        L10_17 = L10_17(L11_18)
        L11_18 = A0_7.work
        L11_18 = L11_18.bakpolish
        if L11_18 == 10000 and L9_16 and L10_17 then
          L12_19 = A0_7
          L11_18 = A0_7.setVisibility
          L11_18(L12_19, "IconControl_PolishMAX", true)
        else
          L12_19 = A0_7
          L11_18 = A0_7.setVisibility
          L11_18(L12_19, "IconControl_PolishMAX", false)
        end
        L11_18 = desktopWidget
        L12_19 = L11_18
        L11_18 = L11_18.getItemMateriaAttachInfo
        L12_19 = L11_18(L12_19, L7_14)
        A0_7.work.bakmateria = L11_18
        if L11_18 > 0 then
          A0_7:setVisibility("Grid_MateriaNumber", true)
          A0_7:setVisibility("IconControl_MateriaIcon", true)
          A0_7:setVisibility("TextBlock_MateriaNumber", true)
          A0_7:setIcon("IconControl_MateriaIcon", 608)
          A0_7:setText("TextBlock_MateriaNumber", tostring(L11_18))
        elseif L12_19 == true then
          A0_7:setVisibility("Grid_MateriaNumber", true)
          A0_7:setVisibility("IconControl_MateriaIcon", true)
          A0_7:setIcon("IconControl_MateriaIcon", 609)
          A0_7:setVisibility("TextBlock_MateriaNumber", false)
        else
          A0_7:setVisibility("Grid_MateriaNumber", false)
        end
      else
        L10_17 = A0_7.work
        L10_17.bakpolish = 0
        L10_17 = A0_7.work
        L10_17.bakmateria = 0
        L11_18 = A0_7
        L10_17 = A0_7.setVisibility
        L12_19 = "IconControl_PolishMAX"
        L10_17(L11_18, L12_19, false)
        L11_18 = A0_7
        L10_17 = A0_7.setVisibility
        L12_19 = "Grid_MateriaNumber"
        L10_17(L11_18, L12_19, false)
      end
      L11_18 = A0_7
      L10_17 = A0_7.setText
      L12_19 = "TextBlock_ItemName"
      L10_17(L11_18, L12_19, 3202, A0_7.work.bakcatalog, A0_7.work.bakquality)
      L11_18 = L7_14
      L10_17 = L7_14._isStackable
      L10_17 = L10_17(L11_18)
      if L10_17 then
        L10_17 = A0_7.work
        L10_17.stackable = true
      else
        L10_17 = A0_7.work
        L10_17.stackable = false
      end
      L10_17 = A0_7.work
      L11_18 = A0_7.work
      L11_18 = L11_18.bakstack
      L10_17.stack = L11_18
      L10_17 = A0_7.work
      L10_17 = L10_17.stackable
      if L10_17 == false then
        L11_18 = A0_7
        L10_17 = A0_7.setVisibility
        L12_19 = "TextBlock_ItemStack"
        L10_17(L11_18, L12_19, false)
        L11_18 = A0_7
        L10_17 = A0_7.setText
        L12_19 = "TextBlock_ItemStack"
        L10_17(L11_18, L12_19, "")
        L10_17 = A0_7.work
        L10_17.stack = 1
      else
        L11_18 = A0_7
        L10_17 = A0_7.setVisibility
        L12_19 = "TextBlock_ItemStack"
        L10_17(L11_18, L12_19, true)
        L11_18 = A0_7
        L10_17 = A0_7.setText
        L12_19 = "TextBlock_ItemStack"
        L10_17(L11_18, L12_19, 225, A0_7.work.stack)
      end
      L10_17 = A0_7.work
      L12_19 = L7_14
      L11_18 = L7_14._getMaxStack
      L11_18 = L11_18(L12_19)
      L10_17.stackMax = L11_18
      L11_18 = L7_14
      L10_17 = L7_14.isEquipment
      L10_17 = L10_17(L11_18)
      if L10_17 then
        L11_18 = A0_7
        L10_17 = A0_7.setVisibility
        L12_19 = "IconControl_NotEquiped"
        L10_17(L11_18, L12_19, desktopWidget:cantEquipPlayer(L7_14))
      else
        L11_18 = A0_7
        L10_17 = A0_7.setVisibility
        L12_19 = "IconControl_NotEquiped"
        L10_17(L11_18, L12_19, false)
      end
      L10_17 = 3199
      L12_19 = L7_14
      L11_18 = L7_14.isMateriaAttached
      L11_18 = L11_18(L12_19)
      L12_19 = L7_14.isExclusiveItem
      L12_19 = L12_19(L7_14)
      if L12_19 then
        L10_17 = 3200
      end
      A0_7:setText("TextBlock_TrashAgree", L10_17)
      A0_7:setVisibility("Grid_TrashAgree", L11_18 or L12_19)
      A0_7:setChecked("CheckBox_TrashAgree", not L11_18 and not L12_19)
      if L7_14:_isEquipping() then
        A0_7.work.error = true
      end
    end
  end
  L10_17 = A0_7
  L9_16 = A0_7.setWindowFocus
  L11_18 = "Button_Cancel"
  L9_16(L10_17, L11_18)
  L9_16 = A0_7.work
  L9_16.enableOK = true
end
function ItemEditWidget.processBeforeShow(A0_20, A1_21)
  if A1_21 ~= true and A0_20.work.error == true then
    A0_20.work.chosenOperation = 12
    if A0_20:_getParentWidget() ~= nil then
      if A0_20.work.chosenOwner == 4 then
        A0_20:_getParentWidget():setItemEditData(A0_20.work.chosenOperation, 0, 0)
      else
        A0_20:_getParentWidget():setItemEditData(A0_20.work.chosenOperation)
      end
      A0_20:_getParentWidget():closeItemEdit()
    end
    return true
  end
  return true
end
function ItemEditWidget.setWindowFocus(A0_22, A1_23)
  if A1_23 ~= nil and A1_23 ~= "" then
    A0_22:setLogicalFocus(A1_23)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_22 then
      A0_22:setKeyboardFocusedControl(A1_23)
    end
  end
end
function ItemEditWidget.processUICommandCancel(A0_24, A1_25, A2_26, A3_27, A4_28)
  if A2_26 == "Button_Cancel" then
    A0_24.work.chosenOperation = 12
    A0_24:_getParentWidget():setItemEditData(A0_24.work.chosenOperation, A0_24.work.mode)
    A0_24:_getParentWidget():closeItemEdit()
    return
  else
    A0_24:setWindowFocus("Button_Cancel")
    return
  end
end
function ItemEditWidget.processUICommandOperate(A0_29, A1_30, A2_31, A3_32, A4_33)
  local L5_34, L6_35
  L6_35 = A0_29
  L5_34 = A0_29._getParentWidget
  L5_34 = L5_34(L6_35)
  if A2_31 == "Button_Cancel" then
    L6_35 = A0_29.work
    L6_35.chosenOperation = 12
    L6_35 = L5_34.setItemEditData
    L6_35(L5_34, A0_29.work.chosenOperation, A0_29.work.mode)
    L6_35 = L5_34.closeItemEdit
    L6_35(L5_34)
    L6_35 = true
    return L6_35
  end
  L6_35 = A0_29.work
  L6_35 = L6_35.chosenOperation
  if L6_35 ~= 0 then
    return
  end
  if A2_31 == "Button_OK" then
    L6_35 = nil
    if A0_29.work.enableOK == false then
      return false
    end
    if A0_29.work.commandThrow == true then
      if A0_29:checkCertainItem() == false then
        A0_29.work.chosenOperation = 12
        L5_34:setItemEditData(A0_29.work.chosenOperation, A0_29.work.mode)
        A0_29:setModal(false)
        desktopWidget:changeFocusedWidget(L5_34, true)
        L5_34:closeItemEdit()
        return
      end
      L6_35 = desktopWidget:executePlayerItemWaste(A0_29.work.chosenPackage, A0_29.work.chosenItem, A0_29.work.num1)
      if L6_35 == true then
        A0_29.work.chosenOperation = A0_29.work.mode
        L5_34:setItemEditData(A0_29.work.chosenOperation, A0_29.work.mode)
        L5_34:closeItemEdit()
      end
    else
      if A0_29:checkCertainItem() == false then
        A0_29.work.chosenOperation = 12
        L5_34:setItemEditData(A0_29.work.chosenOperation, A0_29.work.mode)
        A0_29:setModal(false)
        desktopWidget:changeFocusedWidget(L5_34, true)
        L5_34:closeItemEdit()
        return
      end
      L6_35 = L5_34:setItemEditData(13, 3, A0_29.work.stack)
      if L6_35 == true then
        A0_29.work.chosenOperation = A0_29.work.mode
        L5_34:closeItemEdit()
      end
    end
    return true
  end
end
function ItemEditWidget.getItemContent(A0_36, A1_37, A2_38, A3_39)
  if A0_36:_getParentWidget() ~= nil then
    return A0_36:_getParentWidget():getItemContent(A1_37, A2_38, A3_39)
  end
  return false
end
function ItemEditWidget.getItemContentFromWidget(A0_40, A1_41, A2_42, A3_43)
  if A3_43 ~= nil then
    return A3_43:getItemContent(-1, A1_41, A2_42)
  end
  return false
end
function ItemEditWidget.checkCertainItem(A0_44)
  local L1_45, L2_46, L3_47
  L2_46 = A0_44.work
  L2_46 = L2_46.chosenOwner
  if L2_46 == 1 then
    L2_46 = worldMaster
    L3_47 = L2_46
    L2_46 = L2_46._getMyPlayer
    L2_46 = L2_46(L3_47)
    L3_47 = L2_46._getItem
    L3_47 = L3_47(L2_46, A0_44.work.chosenPackage, A0_44.work.chosenItem)
    L1_45 = L3_47
  else
    L2_46 = A0_44.work
    L2_46 = L2_46.chosenOwner
    if L2_46 == 4 then
      L2_46 = desktopWidget
      L3_47 = L2_46
      L2_46 = L2_46.getRetainerItem
      L2_46 = L2_46(L3_47, A0_44.work.chosenPackage, A0_44.work.chosenItem)
      L1_45 = L2_46
    end
  end
  if L1_45 == nil then
    L2_46 = false
    return L2_46
  end
  L3_47 = A0_44
  L2_46 = A0_44._getParentWidget
  L2_46 = L2_46(L3_47)
  if L2_46 ~= nil then
    L3_47 = L2_46.checkChosenItem
    L3_47 = L3_47(L2_46, L1_45, A0_44.work.chosenPackage, A0_44.work.chosenItem)
    if L3_47 == false then
      L3_47 = false
      return L3_47
    end
  end
  L3_47 = A0_44.work
  L3_47 = L3_47.bakcatalog
  if L3_47 ~= L1_45:_getCatalogID() then
    L3_47 = false
    return L3_47
  end
  L3_47 = A0_44.work
  L3_47 = L3_47.bakquality
  if L3_47 ~= L1_45:_getNameIndex() then
    L3_47 = false
    return L3_47
  end
  L3_47 = A0_44.work
  L3_47 = L3_47.bakstack
  if L3_47 ~= L1_45:_countStack() then
    L3_47 = false
    return L3_47
  end
  L3_47 = A0_44.work
  L3_47 = L3_47.bakrare
  if L3_47 ~= L1_45:isRareItem() then
    L3_47 = false
    return L3_47
  end
  L3_47 = A0_44.work
  L3_47 = L3_47.bakex
  if L3_47 ~= L1_45:isExclusiveItem() then
    L3_47 = false
    return L3_47
  end
  L3_47 = A0_44.work
  L3_47 = L3_47.baklife
  if L3_47 ~= L1_45:getItemLife() then
    L3_47 = false
    return L3_47
  end
  L3_47 = 0
  if L1_45:isEquipment() then
    L3_47 = L1_45:getNormalItemFitness()
  end
  if A0_44.work.bakpolish ~= L3_47 then
    return false
  end
  if A0_44.work.bakmateria ~= desktopWidget:getItemMateriaAttachInfo(L1_45) then
    return false
  end
  return true
end
function ItemEditWidget.checkMateriaLicense(A0_48)
  local L1_49
  L1_49 = false
  if worldMaster:_getMyPlayer():hasItem(101, 2001001) or worldMaster:_getMyPlayer():hasItem(101, 2001002) or worldMaster:_getMyPlayer():hasItem(101, 2001003) then
    L1_49 = true
  end
  return L1_49
end
