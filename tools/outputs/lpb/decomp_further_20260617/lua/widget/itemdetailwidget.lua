require("/Widget/WidgetBaseClass")
_defineClass("ItemDetailWidget", "WidgetBaseClass")
function ItemDetailWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L5_5 = A0_0.work
  L6_6 = {
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    {"listbox", "integer8"},
    {
      "listSelectStep",
      "integer8"
    },
    {
      "listColumnVisibility",
      "integer32"
    },
    {"page", "integer8"},
    {"bonus1", "boolean"},
    {"bonus2", "boolean"},
    {"bonus3", "boolean"},
    {"itemlife", "boolean"},
    {"bazaar", "boolean"},
    {
      "isRewardMode",
      "boolean"
    },
    {"rewardItem", "integer32"},
    {
      "rewardItemPackage",
      "integer32"
    },
    {
      "orderCatalog",
      "integer32"
    },
    {"orderStack", "integer32"},
    {
      "editWidgetMode",
      "integer8"
    },
    {
      "updatecount",
      "integer32"
    },
    {"slot", "integer32"},
    {
      "updatenexttime",
      "boolean"
    },
    {"closeok", "boolean"},
    {"demandSync", "boolean"},
    {"num1", "integer32"},
    {"num1max", "integer32"},
    {"num2", "integer32"},
    {"num2max", "integer32"}
  }
  L7_7 = {L8_8, L9_9}
  L8_8 = "chosenItem"
  L9_9 = "integer32"
  L8_8 = {L9_9, L10_10}
  L9_9 = "chosenPackage"
  L10_10 = "integer32"
  L9_9 = {L10_10, L11_11}
  L10_10 = "chosenOwner"
  L11_11 = "integer8"
  L10_10 = {L11_11, L12_12}
  L11_11 = "chosenOperation"
  L12_12 = "integer32"
  L11_11 = {L12_12, "integer16"}
  L12_12 = "mode"
  L12_12 = {"index", "integer32"}
  L5_5._temp = L6_6
  L5_5 = A0_0.work
  L5_5.chosenItem = 0
  L5_5 = A0_0.work
  L5_5.chosenOperation = 0
  L5_5 = A0_0.work
  L5_5.isRewardMode = false
  L5_5 = A0_0.work
  L5_5.bonus1 = false
  L5_5 = A0_0.work
  L5_5.bonus2 = false
  L5_5 = A0_0.work
  L5_5.bonus3 = false
  L5_5 = A0_0.work
  L5_5.itemlife = false
  L5_5 = A0_0.work
  L5_5.bazaar = false
  L5_5 = A0_0.work
  L5_5.mode = 0
  L6_6 = A0_0
  L5_5 = A0_0.setDrag
  L7_7 = true
  L5_5(L6_6, L7_7)
  L6_6 = A0_0
  L5_5 = A0_0.setControlProperty
  L7_7 = "Button_EditBack"
  L8_8 = "Command"
  L9_9 = "UILuaCommands.Operate"
  L5_5(L6_6, L7_7, L8_8, L9_9)
  L6_6 = A0_0
  L5_5 = A0_0.setButtonEvents
  L7_7 = "Button_EditBack"
  L5_5(L6_6, L7_7)
  L6_6 = A0_0
  L5_5 = A0_0.setButtonContent
  L7_7 = "Button_EditBack"
  L8_8 = 3318
  L5_5(L6_6, L7_7, L8_8)
  L6_6 = A0_0
  L5_5 = A0_0.setControlProperty
  L7_7 = "Button_EditCommand"
  L8_8 = "Command"
  L9_9 = "UILuaCommands.Operate"
  L5_5(L6_6, L7_7, L8_8, L9_9)
  L6_6 = A0_0
  L5_5 = A0_0.setButtonEvents
  L7_7 = "Button_EditCommand"
  L5_5(L6_6, L7_7)
  L6_6 = A0_0
  L5_5 = A0_0.setControlCommandCondition
  L7_7 = "CustomControl_NumberInput"
  L8_8 = "NumberInputBox.ValueChanged"
  L5_5(L6_6, L7_7, L8_8)
  L6_6 = A0_0
  L5_5 = A0_0.setControlCommandCondition
  L7_7 = "CustomControl_NumberInput_Gil"
  L8_8 = "NumberInputBox.ValueChanged"
  L5_5(L6_6, L7_7, L8_8)
  L6_6 = A0_0
  L5_5 = A0_0.setCancelCondition
  L7_7 = "CustomControl_NumberInput"
  L5_5(L6_6, L7_7)
  L6_6 = A0_0
  L5_5 = A0_0.setCancelCondition
  L7_7 = "CustomControl_NumberInput_Gil"
  L5_5(L6_6, L7_7)
  L6_6 = A0_0
  L5_5 = A0_0.setText
  L7_7 = "TextBlock_ItemLifeHeader"
  L8_8 = 214
  L9_9 = 10091
  L5_5(L6_6, L7_7, L8_8, L9_9)
  L6_6 = A0_0
  L5_5 = A0_0.setText
  L7_7 = "TextBlock_RepairMaterialHeader"
  L8_8 = 214
  L9_9 = 10093
  L5_5(L6_6, L7_7, L8_8, L9_9)
  L6_6 = A0_0
  L5_5 = A0_0.setText
  L7_7 = "TextBlock_Help"
  L8_8 = ""
  L5_5(L6_6, L7_7, L8_8)
  L5_5 = desktopWidget
  L6_6 = L5_5
  L5_5 = L5_5.setMateriaAttachSlotIconHelp
  L7_7 = A0_0
  L5_5(L6_6, L7_7)
  L6_6 = A0_0
  L5_5 = A0_0.setInitialData
  L7_7 = A1_1
  L8_8 = A2_2
  L5_5(L6_6, L7_7, L8_8)
  if A2_2 == 620 and A3_3 ~= nil then
    L5_5 = worldMaster
    L6_6 = L5_5
    L5_5 = L5_5._getMyPlayer
    L5_5 = L5_5(L6_6)
    L7_7 = L5_5
    L6_6 = L5_5.createVirtualItem
    L8_8 = A3_3
    L9_9 = 1
    L10_10 = 1
    L11_11 = 100
    L6_6 = L6_6(L7_7, L8_8, L9_9, L10_10, L11_11)
    L8_8 = A0_0
    L7_7 = A0_0.displayItemHelp
    L9_9 = L6_6
    L7_7(L8_8, L9_9)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L9_9 = "Border_ItemLife_IconCaution"
    L10_10 = false
    L7_7(L8_8, L9_9, L10_10)
    L8_8 = A0_0
    L7_7 = A0_0.setVisibility
    L9_9 = "Border_ItemLife_IconDanger"
    L10_10 = false
    L7_7(L8_8, L9_9, L10_10)
    L8_8 = A4_4
    L7_7 = A4_4.getWindowPosition
    L8_8 = L7_7(L8_8)
    L10_10 = A4_4
    L9_9 = A4_4.getWindowSize
    L10_10 = L9_9(L10_10)
    L11_11 = L7_7 + L9_9
    L11_11 = L11_11 + 24
    L12_12 = L8_8 + 32
    L12_12 = L12_12 + 20
    A0_0:setProperty("Margin", "0,0,0,0")
    if desktopWidget:getWindowSize() < L11_11 + 446 then
      L11_11 = desktopWidget:getWindowSize() - 446
    end
    if desktopWidget:getWindowSize() < L12_12 + A0_0:getWindowSize() then
      L12_12 = desktopWidget:getWindowSize() - A0_0:getWindowSize()
    end
    A0_0:setProperty("Top", L12_12)
    A0_0:setProperty("Left", L11_11)
    A0_0:setVisibility("Grid_ActorName", false)
    A0_0:setVisibility("Grid_BackpackAndGil", false)
    A0_0:setVisibility("Grid_Help", false)
    A0_0:setText("TextBlock_Title", 12013, A3_3)
    A0_0:setText("TextBlock_ItemLife", 3553, 100)
    A0_0:setStyle("TextBlock_ItemLife", "TBL_parameterPlus")
    if desktopWidget:getWindowSize() < 1280 then
      A0_0:setModal(true)
      A0_0:setVisibility("Grid_Edit", true)
      A0_0:setVisibility("Grid_ItemStack", false)
      A0_0:setVisibility("Grid_NumberInput_Gil", false)
      A0_0:setVisibility("Button_EditCommand", false)
    end
  end
end
function ItemDetailWidget.setInitialData(A0_13, A1_14, A2_15)
  A0_13:setModal(A1_14)
  A0_13.work.mode = A2_15
  A0_13.work.index = 0
  A0_13.work.listSelectStep = 0
  A0_13:setGridVisibility(1)
  if A2_15 ~= 620 then
    A0_13:hide()
  end
end
function ItemDetailWidget.setButtonEvents(A0_16, A1_17)
  local L2_18
  L2_18 = A0_16.getControlProperty
  L2_18 = L2_18(A0_16, A1_17, "Command")
  A0_16:setControlCommandCondition(A1_17, L2_18)
  A0_16:setCancelCondition(A1_17)
end
function ItemDetailWidget.setGridVisibility(A0_19, A1_20)
  A0_19:setVisibility("Grid_Edit", A1_20 == 6 or A1_20 == 7 or A1_20 == 8 or A1_20 == 9)
  A0_19:setVisibility("Grid_ItemStack", A1_20 == 7)
  A0_19:setVisibility("Grid_NumberInput_Gil", A1_20 == 8)
  A0_19:setVisibility("Grid_ActorName", true)
  A0_19:setVisibility("Grid_Help", A1_20 == 2 or A1_20 == 3)
  A0_19:setVisibility("Grid_BackpackAndGil", false)
  A0_19:setVisibility("Grid_ItemNameBase", A1_20 == 1 or A1_20 == 4 or A1_20 == 5 or A1_20 == 6 or A1_20 == 7 or A1_20 == 8 or A1_20 == 9 or A1_20 == 10)
  A0_19:setVisibility("Grid_ItemDetail1", A0_19.work.bonus1)
  A0_19:setVisibility("Grid_ItemDetail2", A0_19.work.bonus2)
  A0_19:setVisibility("Grid_ItemDetail3", A0_19.work.bonus3 or A0_19.work.itemlife or A0_19.work.bazaar)
  A0_19:setVisibility("Label_ItemBonus5", A0_19.work.bonus3)
  A0_19:setVisibility("Grid_ItemLife", A0_19.work.itemlife)
  A0_19:setVisibility("TOG_itemDetail", false)
end
function ItemDetailWidget.setWindowFocus(A0_21, A1_22)
  if A1_22 ~= nil and A1_22 ~= "" then
    A0_21:setLogicalFocus(A1_22)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_21 then
      A0_21:setKeyboardFocusedControl(A1_22)
    end
  end
end
function ItemDetailWidget.setButtonContent(A0_23, A1_24, A2_25)
  A0_23:setContent(A1_24, A2_25)
end
function ItemDetailWidget.displayHelp(A0_26, A1_27)
  A0_26:setText("TextBlock_Help", A1_27)
end
function ItemDetailWidget.getListPropertyName(A0_28, A1_29)
  local L2_30
  L2_30 = "WidgetInternal"
  return L2_30
end
function ItemDetailWidget.displayName(A0_31, A1_32)
  local L2_33
  if A1_32 == 1 then
    L2_33 = desktopWidget
    L2_33 = L2_33.getPlayerName
    L2_33 = L2_33(L2_33)
    if L2_33 ~= nil then
      A0_31:setText("TextBlock_ActorName", 230, L2_33)
    else
      A0_31:setText("TextBlock_ActorName", "")
    end
    A0_31:setStyle("TextBlock_ActorName", "TBL_null")
    A0_31:setText("TextBlock_Title", 3510)
  elseif A1_32 == 2 then
    L2_33 = desktopWidget
    L2_33 = L2_33.getTargetName
    L2_33 = L2_33(L2_33)
    if L2_33 ~= nil then
      A0_31:setText("TextBlock_ActorName", 230, L2_33)
    else
      A0_31:setText("TextBlock_ActorName", "???")
    end
    A0_31:setStyle("TextBlock_ActorName", "TBL_null")
    A0_31:setText("TextBlock_Title", 3511)
  elseif A1_32 == 4 then
    L2_33 = desktopWidget
    L2_33 = L2_33.getRetainerName
    L2_33 = L2_33(L2_33)
    if L2_33 ~= nil then
      A0_31:setText("TextBlock_ActorName", 230, L2_33)
    else
      A0_31:setText("TextBlock_ActorName", "???")
    end
    A0_31:setStyle("TextBlock_ActorName", "TBL_myRetainer")
    A0_31:setText("TextBlock_Title", 3511)
  end
end
function ItemDetailWidget.displayItemHelp(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39)
  A0_34.work.listSelectStep = 0
  if A1_35 == nil then
    if A2_36 == 1 then
      A0_34:setText("TextBlock_Title", 3207)
    else
      A0_34:setText("TextBlock_Title", 3208)
    end
    return A0_34:displayHelp(3140)
  else
    if A5_39 ~= nil and A5_39 > 0 then
      A0_34:setText("TextBlock_Title", 215, A5_39)
    end
    return A0_34:displayFocusedItemHelp(A1_35, A2_36, A3_37, A4_38, A5_39)
  end
end
function ItemDetailWidget.displayEmpty(A0_40, A1_41)
  A0_40:displayName(A1_41)
  A0_40:displayHelp(3140)
  A0_40.work.bonus1 = false
  A0_40.work.bonus2 = false
  A0_40.work.bonus3 = false
  A0_40.work.itemlife = false
  A0_40.work.page = 0
  A0_40:setGridVisibility(2)
end
function ItemDetailWidget.displayFocusedItemHelp(A0_42, A1_43, A2_44, A3_45, A4_46, A5_47)
  local L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L12_54, L13_55, L14_56, L15_57, L16_58, L17_59, L18_60, L19_61, L20_62, L21_63
  L7_49 = A0_42
  L6_48 = A0_42.getListPropertyName
  L6_48 = L6_48(L7_49)
  L7_49 = A0_42.work
  L7_49.index = 0
  L7_49 = A2_44
  L8_50 = A3_45
  L9_51 = A4_46
  L10_52 = worldMaster
  L11_53 = L10_52
  L10_52 = L10_52._getMyPlayer
  L10_52 = L10_52(L11_53)
  L11_53 = A1_43
  if L11_53 == nil then
    if L9_51 == 1 then
      L13_55 = L10_52
      L12_54 = L10_52._getItem
      L14_56 = L7_49
      L15_57 = L8_50
      L12_54 = L12_54(L13_55, L14_56, L15_57)
      L11_53 = L12_54
    elseif L9_51 == 2 then
      L12_54 = desktopWidget
      L13_55 = L12_54
      L12_54 = L12_54.getBazaarItem
      L14_56 = L7_49
      L15_57 = L8_50
      L12_54 = L12_54(L13_55, L14_56, L15_57)
      L11_53 = L12_54
    elseif L9_51 == 4 then
      L12_54 = desktopWidget
      L13_55 = L12_54
      L12_54 = L12_54.getRetainerItem
      L14_56 = L7_49
      L15_57 = L8_50
      L12_54 = L12_54(L13_55, L14_56, L15_57)
      L11_53 = L12_54
    end
  end
  if L11_53 ~= nil then
  else
    L13_55 = A0_42
    L12_54 = A0_42.displayEmpty
    L12_54(L13_55)
  end
  L13_55 = A0_42
  L12_54 = A0_42.displayName
  L14_56 = L9_51
  L12_54(L13_55, L14_56)
  L12_54 = false
  L13_55 = nil
  if L9_51 ~= 7 then
    L14_56 = 0
    L15_57 = 0
    L16_58 = 0
    L17_59 = 0
    if L18_60 == true then
      for L21_63 = 1, 27 do
        if L11_53:isFitForEquipPoint(L21_63) == true then
          if L14_56 == 0 then
            L14_56 = L21_63
          elseif L15_57 == 0 then
            L15_57 = L21_63
          elseif L16_58 == 0 then
            L16_58 = L21_63
          elseif L17_59 == 0 then
            L17_59 = L21_63
            break
          end
        end
      end
    end
    if L14_56 ~= 0 then
      L13_55 = L18_60
    end
    if L13_55 == nil and L15_57 ~= 0 then
      L13_55 = L18_60
    end
    if L13_55 == nil and L16_58 ~= 0 then
      L13_55 = L18_60
    end
    if L13_55 == nil and L17_59 ~= 0 then
      L13_55 = L18_60
    end
  else
    L13_55 = A1_43
  end
  L14_56 = desktopWidget
  L15_57 = L14_56
  L14_56 = L14_56.setItemDetail
  L16_58 = A0_42
  L17_59 = L11_53
  L14_56(L15_57, L16_58, L17_59, L18_60, L19_61)
  L14_56 = false
  L15_57 = A0_42.work
  L15_57 = L15_57.mode
  if L15_57 == 620 then
    L14_56 = true
  end
  L15_57 = A0_42.work
  L15_57 = L15_57.mode
  if L15_57 == 621 then
    L14_56 = true
  end
  L15_57 = A0_42.work
  L16_58 = A0_42.work
  L17_59 = A0_42.work
  L21_63 = A0_42
  L18_60.itemlife, L21_63 = L11_53, L19_61(L20_62, L21_63, L11_53, A0_42:getListPropertyName(A0_42.work.listbox), A0_42.work.index, L13_55, false, false, false, false, L9_51 == 7, nil, nil, nil, L14_56)
  L17_59.bonus3 = L21_63
  L16_58.bonus2 = L20_62
  L15_57.bonus1 = L19_61
  L15_57 = false
  L17_59 = L11_53
  L16_58 = L11_53.isEquipment
  L16_58 = L16_58(L17_59)
  if L16_58 then
    L16_58 = desktopWidget
    L17_59 = L16_58
    L16_58 = L16_58.getAttachedMateriaCountByItem
    L16_58 = L16_58(L17_59, L18_60)
    if L16_58 > 0 then
      L15_57 = true
    end
  end
  if L15_57 then
    L17_59 = A0_42
    L16_58 = A0_42.showMateriaList
    L16_58(L17_59, L18_60)
  else
    L17_59 = A0_42
    L16_58 = A0_42.closeMateriaList
    L16_58(L17_59)
  end
  if L9_51 == 7 then
    L17_59 = A0_42
    L16_58 = A0_42.setGridVisibility
    L16_58(L17_59, L18_60)
    L17_59 = A0_42
    L16_58 = A0_42.setVisibility
    L16_58(L17_59, L18_60, L19_61)
    L17_59 = A0_42
    L16_58 = A0_42.setVisibility
    L16_58(L17_59, L18_60, L19_61)
    L17_59 = A0_42
    L16_58 = A0_42.show
    L16_58(L17_59)
  else
    L17_59 = A0_42
    L16_58 = A0_42.setGridVisibility
    L16_58(L17_59, L18_60)
  end
  L16_58 = true
  return L16_58
end
function ItemDetailWidget.processUICommandEvent(A0_64, A1_65, A2_66, A3_67, A4_68, A5_69)
  if A3_67 == "UILuaCommands.Cancel" then
    if A0_64.work.mode == 610 then
      A0_64:hide()
      return
    elseif A0_64.work.mode == 620 then
      desktopWidget:closeWidgetDirect(A0_64)
      return
    elseif A0_64.work.mode == 621 then
      A0_64:hide()
      return
    else
      if A2_66 ~= "Button_EditBack" then
        return A0_64:setWindowFocus("Button_EditBack")
      end
      A0_64:setModal(false)
      A0_64:setVisibility("Grid_Edit", false)
      if A0_64.work.editWidgetMode == 2 then
        A0_64:hide()
      end
      return A0_64:_getParentWidget():setItemCount(0, A0_64.work.chosenOwner)
    end
  end
  if A3_67 == "UILuaCommands.Operate" then
    if A0_64.work.mode == 620 then
      desktopWidget:closeWidgetDirect(A0_64)
      return
    end
    if A2_66 == "Button_EditBack" then
      A0_64:setModal(false)
      A0_64:setVisibility("Grid_Edit", false)
      if A0_64.work.editWidgetMode == 2 then
      end
      return A0_64:_getParentWidget():setItemCount(0, A0_64.work.chosenOwner)
    elseif A2_66 == "Button_EditCommand" then
      A0_64:setModal(false)
      A0_64:setVisibility("Grid_Edit", false)
      if A0_64.work.editWidgetMode == 2 then
        A0_64:_getParentWidget():setItemCount(A0_64.work.num2, A0_64.work.chosenOwner)
      else
        A0_64:_getParentWidget():setItemCount(A0_64.work.num1, A0_64.work.chosenOwner)
      end
      return
    elseif A0_64.work.mode == 610 and A2_66 == "Button_Back" then
      A0_64:hide()
      return
    elseif A0_64.work.mode == 621 and A2_66 == "Button_Back" then
      A0_64:hide()
      return
    end
  end
  if A3_67 == "NumberInputBox.ValueChanged" then
    A0_64:updateNumber(A4_68, A2_66)
  end
end
function ItemDetailWidget.updateNumber(A0_70, A1_71, A2_72)
  if A2_72 == "CustomControl_NumberInput" and A0_70:_getProperty(nil, A2_72, "IsKeyboardFocusWithin") == true then
    A0_70.work.num1 = A1_71
  elseif A2_72 == "CustomControl_NumberInput_Gil" and A0_70:_getProperty(nil, A2_72, "IsKeyboardFocusWithin") == true then
    A0_70.work.num2 = A1_71
  end
  if A1_71 == 0 then
    A0_70:setEnable("Button_EditCommand", false)
  else
    A0_70:setEnable("Button_EditCommand", true)
  end
end
function ItemDetailWidget.editCount(A0_73, A1_74, A2_75, A3_76)
  local L4_77, L5_78, L6_79, L7_80, L8_81, L9_82
  L4_77 = A0_73.work
  L4_77.chosenPackage = A1_74
  L4_77 = A0_73.work
  L4_77.chosenItem = A2_75
  L4_77 = A0_73.work
  L4_77.chosenOwner = A3_76
  L4_77, L5_78, L6_79, L7_80, L8_81, L9_82 = nil, nil, nil, nil, nil, nil
  if A3_76 == nil or A3_76 == 1 then
    A0_73:setButtonContent("Button_EditCommand", 3510)
    L9_82 = worldMaster:_getMyPlayer():_getItem(A1_74, A2_75)
  else
    A0_73:setButtonContent("Button_EditCommand", 3511)
    L9_82 = desktopWidget:getRetainerItem(A1_74, A2_75)
  end
  if L9_82 == nil then
    return false
  end
  A0_73:displayFocusedItemHelp(L9_82, A1_74, A2_75, A3_76)
  A0_73:setVisibility("Grid_Edit", true)
  L4_77 = L9_82:_getCatalogID()
  L5_78 = L9_82:getItemIcon()
  L6_79 = L9_82:_isStackable()
  L7_80 = L9_82:_countStack()
  if L6_79 == false then
    L7_80 = 1
    A0_73:setVisibility("Grid_ItemStack", false)
  else
    A0_73:setVisibility("Grid_ItemStack", true)
  end
  if L4_77 ~= 1000001 then
    A0_73:setVisibility("Grid_NumberInput_Gil", false)
    A0_73.work.editWidgetMode = 1
    A0_73.work.listSelectStep = 2
    A0_73.work.num1 = L7_80
    A0_73.work.num1max = L7_80
    if L6_79 == true then
      A0_73:setGridVisibility(7)
    else
      A0_73:setGridVisibility(6)
    end
    A0_73:setText("TextBlock_ItemStackMax", 225, A0_73.work.num1max)
    if L4_77 > 1000002 and L4_77 < 1000101 and A0_73.work.num1max > 999 then
      A0_73.work.num1max = 999
    end
    if A0_73.work.num1 > A0_73.work.num1max then
      A0_73.work.num1 = A0_73.work.num1max
    end
    A0_73:_setProperty(nil, "CustomControl_NumberInput", "Minimum", 1)
    A0_73:_setProperty(nil, "CustomControl_NumberInput", "Value", 1)
    A0_73:_setProperty(nil, "CustomControl_NumberInput", "Maximum", 1)
    A0_73:_setProperty(nil, "CustomControl_NumberInput", "Maximum", A0_73.work.num1max)
    A0_73:_setProperty(nil, "CustomControl_NumberInput", "Value", A0_73.work.num1)
    L8_81 = "Button_EditCommand"
    A0_73:setEnable("Button_EditCommand", true)
  else
    A0_73:displayItemHelp(L9_82, A1_74, A2_75, A3_76)
    A0_73:setVisibility("Grid_ItemStack", false)
    A0_73:setVisibility("Grid_NumberInput_Gil", true)
    A0_73.work.editWidgetMode = 2
    A0_73.work.listSelectStep = 1
    A0_73.work.num2 = 0
    A0_73.work.num2max = L7_80
    A0_73:_setProperty(nil, "CustomControl_NumberInput_Gil", "Minimum", 0)
    A0_73:_setProperty(nil, "CustomControl_NumberInput_Gil", "Value", 0)
    A0_73:_setProperty(nil, "CustomControl_NumberInput_Gil", "Maximum", 1)
    A0_73:_setProperty(nil, "CustomControl_NumberInput_Gil", "Maximum", A0_73.work.num2max)
    A0_73:_setProperty(nil, "CustomControl_NumberInput_Gil", "Value", A0_73.work.num2)
    A0_73:setGridVisibility(8)
    L8_81 = "CustomControl_NumberInput_Gil"
    A0_73:setEnable("Button_EditCommand", false)
  end
  A0_73:setModal(true)
  desktopWidget:changeFocusedWidget(A0_73, true)
  A0_73:setWindowFocus(L8_81)
  return true
end
function ItemDetailWidget.showMateriaList(A0_83, A1_84)
  if A1_84 ~= nil then
    desktopWidget:setMateriaListItems(A0_83, A1_84)
    A0_83:setVisibility("Grid_MateriaEquipList", true)
  else
    A0_83:setVisibility("Grid_MateriaEquipList", false)
  end
end
function ItemDetailWidget.closeMateriaList(A0_85)
  A0_85:setVisibility("Grid_MateriaEquipList", false)
end
