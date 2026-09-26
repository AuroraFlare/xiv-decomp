require("/Widget/WidgetBaseClass")
_defineClass("BazaarEditWidget", "WidgetBaseClass")
function BazaarEditWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
  A0_0.work._temp = {
    {"mode", "integer16"},
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
      "integer16"
    },
    {
      "itemDealStatus",
      "integer32"
    },
    {"rewardItem", "integer32"},
    {
      "rewardPackage",
      "integer32"
    },
    {
      "rewardItemCount",
      "integer32"
    },
    {
      "rewardIsItem",
      "boolean"
    },
    {
      "rewardItemPackageSelectReturn",
      "integer32"
    },
    {
      "rewardItemSelectReturn",
      "integer32"
    },
    {"unit", "integer8"},
    {"stack", "integer32"},
    {"stackMax", "integer32"},
    {"tax", "integer32"},
    {
      "comment",
      "string",
      128
    },
    {
      "rewardWidgetOpen",
      "boolean"
    },
    {
      "extraIsDraw",
      "boolean"
    },
    {"isRetainer", "boolean"},
    {"num2", "integer32"},
    {"num2max", "integer32"},
    {"num3", "integer32"},
    {"num3max", "integer32"},
    {"error", "boolean"},
    {"bakcatalog", "integer32"},
    {"bakquality", "integer8"},
    {"bakstack", "integer32"},
    {
      "bakstackable",
      "boolean"
    },
    {"bakrare", "boolean"},
    {"bakex", "boolean"},
    {"price", "integer32"}
  }
  A0_0.work.chosenOperation = 0
  A0_0.work.isRetainer = false
  A0_0.work.error = false
  A0_0:setModal(true)
  A0_0:setCancelCondition()
  A0_0:setConfirmCondition("Button_Done")
  A0_0:setConfirmCondition("Button_Back")
  A0_0:setConfirmCondition("Button_Extra")
  A0_0:setCancelCondition("Button_Back")
  A0_0:setControlCommandCondition("CustomControl_NumberInput_ItemSource", "NumberInputBox.ValueChanged")
  A0_0:setControlCommandCondition("CustomControl_NumberInput", "NumberInputBox.ValueChanged")
  A0_0:setControlCommandCondition("CustomControl_NumberInput_Gil", "NumberInputBox.ValueChanged")
  A0_0:setControlCommandCondition("CustomControl_NumberInput_TotalGil", "NumberInputBox.ValueChanged")
  A0_0:setControlCommandCondition("ComboBox_Select", "UILuaCommands.SelectComboBoxItem")
  A0_0:setUserWorkInt(3, nil, "ComboBox_Select", -1)
  A0_0:setInitialData(A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
end
function BazaarEditWidget.setInitialData(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12, A6_13)
  local L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28
  if A5_12 == 4 then
    L7_14 = A0_7.work
    L7_14.isRetainer = true
  else
    L7_14 = A0_7.work
    L7_14.isRetainer = false
  end
  L7_14 = A0_7.work
  L7_14.unit = 1
  L7_14 = A0_7.work
  L7_14.stack = 1
  L7_14 = A0_7.work
  L7_14.stackMax = 1
  L7_14 = A0_7.work
  L7_14.comment = ""
  if A4_11 ~= nil then
    L7_14 = A0_7.work
    L7_14.chosenItem = A4_11
  end
  if A3_10 ~= nil then
    L7_14 = A0_7.work
    L7_14.chosenPackage = A3_10
  end
  if A5_12 ~= nil then
    L7_14 = A0_7.work
    L7_14.chosenOwner = A5_12
  else
    L7_14 = A0_7.work
    L7_14.chosenOwner = 1
  end
  L7_14 = A0_7.work
  L7_14.mode = A2_9
  L7_14 = A0_7.work
  L7_14 = L7_14.mode
  if L7_14 == 5 then
    L8_15 = A0_7
    L7_14 = A0_7.setContent
    L9_16 = "Button_Extra"
    L10_17 = 3122
    L7_14(L8_15, L9_16, L10_17)
    L8_15 = A0_7
    L7_14 = A0_7.setVisibility
    L9_16 = "Button_Extra"
    L10_17 = true
    L7_14(L8_15, L9_16, L10_17)
    L7_14 = A0_7.work
    L7_14.extraIsDraw = false
    return
  end
  L7_14 = worldMaster
  L8_15 = L7_14
  L7_14 = L7_14._getMyPlayer
  L7_14 = L7_14(L8_15)
  L8_15 = nil
  L9_16 = false
  L10_17 = false
  if A5_12 == nil or A5_12 == 1 then
    L12_19 = L7_14
    L11_18 = L7_14._getItem
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L8_15 = L11_18
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.isDealingItem
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L9_16 = L11_18
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.isPlayerItemAttached
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L10_17 = L11_18
  elseif A5_12 == 2 then
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.getBazaarItem
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L8_15 = L11_18
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.isBazaarDealingItem
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L9_16 = L11_18
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.isBazaarItemAttached
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L10_17 = L11_18
  elseif A5_12 == 4 then
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.getRetainerItem
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L8_15 = L11_18
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.isRetainerDealingItem
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L9_16 = L11_18
    L11_18 = desktopWidget
    L12_19 = L11_18
    L11_18 = L11_18.isRetainerItemAttached
    L13_20 = A3_10
    L14_21 = A4_11
    L11_18 = L11_18(L12_19, L13_20, L14_21)
    L10_17 = L11_18
  end
  if L8_15 == nil then
    L11_18 = A0_7.work
    L11_18.error = true
    L11_18 = false
    return L11_18
  end
  L12_19 = L8_15
  L11_18 = L8_15._isAlive
  L11_18 = L11_18(L12_19)
  if L11_18 == false then
    L11_18 = A0_7.work
    L11_18.error = true
    L11_18 = false
    return L11_18
  end
  if A6_13 == nil then
    L11_18 = A0_7.work
    L11_18.error = true
    return
  end
  L12_19 = A6_13
  L11_18 = A6_13._isAlive
  L11_18 = L11_18(L12_19)
  if L11_18 == false then
    L11_18 = A0_7.work
    L11_18.error = true
    return
  end
  L12_19 = A6_13
  L11_18 = A6_13.checkChosenItem
  L13_20 = L8_15
  L11_18 = L11_18(L12_19, L13_20)
  if L11_18 == false then
    L11_18 = A0_7.work
    L11_18.error = true
  else
    L11_18 = A0_7.work
    L13_20 = L7_14
    L12_19 = L7_14.getBazaarTax
    L14_21 = L8_15
    L12_19 = L12_19(L13_20, L14_21)
    L11_18.tax = L12_19
    L12_19 = L8_15
    L11_18 = L8_15._isAlive
    L11_18 = L11_18(L12_19)
    if L11_18 == false then
      L11_18 = A0_7.work
      L11_18.error = true
      L11_18 = false
      return L11_18
    end
    L12_19 = A0_7
    L11_18 = A0_7.setIcon
    L13_20 = "IconControl_ItemSourceIcon"
    L15_22 = L8_15
    L14_21 = L8_15.getItemIcon
    L21_28 = L14_21(L15_22)
    L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L14_21(L15_22))
    L12_19 = L8_15
    L11_18 = L8_15.isEquipment
    L11_18 = L11_18(L12_19)
    if L11_18 then
      L12_19 = A0_7
      L11_18 = A0_7.setVisibility
      L13_20 = "IconControl_NotEquiped"
      L14_21 = desktopWidget
      L15_22 = L14_21
      L14_21 = L14_21.cantEquipPlayer
      L16_23 = L8_15
      L21_28 = L14_21(L15_22, L16_23)
      L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L14_21(L15_22, L16_23))
    else
      L12_19 = A0_7
      L11_18 = A0_7.setVisibility
      L13_20 = "IconControl_NotEquiped"
      L14_21 = false
      L11_18(L12_19, L13_20, L14_21)
    end
    L11_18 = false
    L13_20 = L8_15
    L12_19 = L8_15.isEquipment
    L12_19 = L12_19(L13_20)
    if L12_19 then
      L13_20 = L8_15
      L12_19 = L8_15.getNormalItemFitness
      L12_19 = L12_19(L13_20)
      if L12_19 == 10000 then
        L11_18 = true
      end
    end
    L12_19 = false
    L14_21 = L7_14
    L13_20 = L7_14.hasItem
    L15_22 = 101
    L16_23 = 2001001
    L13_20 = L13_20(L14_21, L15_22, L16_23)
    if not L13_20 then
      L14_21 = L7_14
      L13_20 = L7_14.hasItem
      L15_22 = 101
      L16_23 = 2001002
      L13_20 = L13_20(L14_21, L15_22, L16_23)
      if not L13_20 then
        L14_21 = L7_14
        L13_20 = L7_14.hasItem
        L15_22 = 101
        L16_23 = 2001003
        L13_20 = L13_20(L14_21, L15_22, L16_23)
      end
    elseif L13_20 then
      L12_19 = true
    end
    L14_21 = L8_15
    L13_20 = L8_15.getMaterializePermission
    L13_20 = L13_20(L14_21)
    L15_22 = A0_7
    L14_21 = A0_7.setVisibility
    L16_23 = "IconControl_PolishMAX"
    L17_24 = L11_18 and L12_19 and L13_20
    L14_21(L15_22, L16_23, L17_24)
    L14_21 = desktopWidget
    L15_22 = L14_21
    L14_21 = L14_21.getItemMateriaAttachInfo
    L16_23 = L8_15
    L15_22 = L14_21(L15_22, L16_23)
    if L14_21 > 0 then
      L17_24 = A0_7
      L16_23 = A0_7.setVisibility
      L18_25 = "Grid_MateriaNumber"
      L19_26 = true
      L16_23(L17_24, L18_25, L19_26)
      L17_24 = A0_7
      L16_23 = A0_7.setVisibility
      L18_25 = "TextBlock_MateriaNumber_2"
      L19_26 = true
      L16_23(L17_24, L18_25, L19_26)
      L17_24 = A0_7
      L16_23 = A0_7.setText
      L18_25 = "TextBlock_MateriaNumber"
      L19_26 = 225
      L20_27 = L14_21
      L16_23(L17_24, L18_25, L19_26, L20_27)
      L17_24 = A0_7
      L16_23 = A0_7.setIcon
      L18_25 = "IconControl_MateriaIcon"
      L19_26 = 608
      L16_23(L17_24, L18_25, L19_26)
    else
      L17_24 = A0_7
      L16_23 = A0_7.setVisibility
      L18_25 = "TextBlock_MateriaNumber"
      L19_26 = false
      L16_23(L17_24, L18_25, L19_26)
      L17_24 = A0_7
      L16_23 = A0_7.setVisibility
      L18_25 = "Grid_MateriaNumber"
      L19_26 = L15_22
      L16_23(L17_24, L18_25, L19_26)
      if L15_22 then
        L17_24 = A0_7
        L16_23 = A0_7.setIcon
        L18_25 = "IconControl_MateriaIcon"
        L19_26 = 609
        L16_23(L17_24, L18_25, L19_26)
      end
    end
    L17_24 = L8_15
    L16_23 = L8_15._countStack
    L16_23 = L16_23(L17_24)
    L17_24 = A0_7.work
    L17_24.bakstack = L16_23
    L17_24 = A0_7.work
    L19_26 = L8_15
    L18_25 = L8_15._getNameIndex
    L18_25 = L18_25(L19_26)
    L17_24.bakquality = L18_25
    L17_24 = A0_7.work
    L19_26 = L8_15
    L18_25 = L8_15._isStackable
    L18_25 = L18_25(L19_26)
    L17_24.bakstackable = L18_25
    L17_24 = A0_7.work
    L19_26 = L8_15
    L18_25 = L8_15._getCatalogID
    L18_25 = L18_25(L19_26)
    L17_24.bakcatalog = L18_25
    L17_24 = A0_7.work
    L19_26 = L8_15
    L18_25 = L8_15.isRareItem
    L18_25 = L18_25(L19_26)
    L17_24.bakrare = L18_25
    L17_24 = A0_7.work
    L19_26 = L8_15
    L18_25 = L8_15.isExclusiveItem
    L18_25 = L18_25(L19_26)
    L17_24.bakex = L18_25
    L17_24 = A0_7.work
    L17_24 = L17_24.bakcatalog
    if L17_24 == 1000001 then
      L18_25 = A0_7
      L17_24 = A0_7.setText
      L19_26 = "TextBlock_ItemSourceName"
      L20_27 = 3263
      L21_28 = L16_23
      L17_24(L18_25, L19_26, L20_27, L21_28)
    else
      L17_24 = A0_7.work
      L17_24 = L17_24.bakcatalog
      if L17_24 >= 1000101 then
        L17_24 = A0_7.work
        L17_24 = L17_24.bakcatalog
        if L17_24 <= 1000124 then
          L17_24 = A0_7.work
          L17_24 = L17_24.bakcatalog
          L17_24 = L17_24 - 1000101
          L17_24 = 3421 + L17_24
          L19_26 = A0_7
          L18_25 = A0_7.setText
          L20_27 = "TextBlock_ItemSourceName"
          L21_28 = L17_24
          L18_25(L19_26, L20_27, L21_28, L16_23)
        end
      else
        L18_25 = A0_7
        L17_24 = A0_7.setText
        L19_26 = "TextBlock_ItemSourceName"
        L20_27 = 3202
        L21_28 = A0_7.work
        L21_28 = L21_28.bakcatalog
        L17_24(L18_25, L19_26, L20_27, L21_28, A0_7.work.bakquality)
      end
    end
    L18_25 = A0_7
    L17_24 = A0_7.setText
    L19_26 = "TextBlock_ItemStack_ItemSource"
    L20_27 = 225
    L21_28 = L16_23
    L17_24(L18_25, L19_26, L20_27, L21_28)
    L18_25 = A0_7
    L17_24 = A0_7.setText
    L19_26 = "TextBlock_ItemStackMax_ItemSource"
    L20_27 = 225
    L21_28 = L16_23
    L17_24(L18_25, L19_26, L20_27, L21_28)
    L17_24 = L16_23
    L19_26 = L8_15
    L18_25 = L8_15._isAlive
    L18_25 = L18_25(L19_26)
    if L18_25 == false then
      L18_25 = A0_7.work
      L18_25.error = true
      L18_25 = false
      return L18_25
    end
    L19_26 = A0_7
    L18_25 = A0_7.isItemCrystal
    L20_27 = L8_15
    L18_25 = L18_25(L19_26, L20_27)
    if L18_25 == true and L17_24 > 999 then
      L17_24 = 999
    end
    L19_26 = A0_7
    L18_25 = A0_7.setNumberInput
    L20_27 = "CustomControl_NumberInput_ItemSource"
    L21_28 = 1
    L18_25(L19_26, L20_27, L21_28, 1, L17_24)
    L18_25 = A0_7.work
    L18_25 = L18_25.bakstackable
    if L18_25 == false then
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_ItemSourceStack"
      L21_28 = false
      L18_25(L19_26, L20_27, L21_28)
    else
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_ItemSourceStack"
      L21_28 = true
      L18_25(L19_26, L20_27, L21_28)
    end
    L18_25 = A0_7.work
    L18_25 = L18_25.mode
    if L18_25 == 1 then
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_Price"
      L21_28 = true
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_RewardTitle"
      L21_28 = false
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_RewardItemName"
      L21_28 = false
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_ItemStack"
      L21_28 = false
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_Tax"
      L21_28 = true
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setText
      L20_27 = "TextBlock_TaxCaption"
      L21_28 = 3118
      L18_25(L19_26, L20_27, L21_28, A0_7:getTax())
      if A3_10 == 8 then
        L18_25 = A0_7.work
        L18_25.error = true
        L18_25 = false
        return L18_25
      end
      L19_26 = A0_7
      L18_25 = A0_7.setText
      L20_27 = "TextBlock_WindowTitle"
      L21_28 = 3126
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Label_NumberInput_ItemSource"
      L21_28 = true
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "TextBlock_ItemStack_ItemSource"
      L21_28 = false
      L18_25(L19_26, L20_27, L21_28)
      L18_25 = A0_7.work
      L18_25 = L18_25.bakstackable
      if L18_25 == false then
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Grid_Unit"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_Single"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_Set"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_Part"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_OpenBlacket"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Grid_NumberInput_Gil"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Grid_TaxGil"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L18_25 = A0_7.work
        L18_25.unit = 1
      else
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Grid_Unit"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_Single"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_Set"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_Part"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_OpenBlacket"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Grid_NumberInput_Gil"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Label_NumberInput_2"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_NumberInput_Gil"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_CloseBlacket"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Grid_TaxGil"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L18_25 = A0_7.work
        L18_25.unit = 3
      end
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Grid_NumberInput_TotalGil"
      L21_28 = true
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Label_NumberInput_3"
      L21_28 = true
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "TextBlock_NumberInput_TotalGil"
      L21_28 = false
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setNumberInput
      L20_27 = "CustomControl_NumberInput_Gil"
      L21_28 = 0
      L18_25(L19_26, L20_27, L21_28, 0, 999999999)
      L19_26 = A0_7
      L18_25 = A0_7.setNumberInput
      L20_27 = "CustomControl_NumberInput_TotalGil"
      L21_28 = 0
      L18_25(L19_26, L20_27, L21_28, 0, 999999999)
      L18_25 = A0_7.work
      L18_25 = L18_25.unit
      if L18_25 == 3 then
        L19_26 = A0_7
        L18_25 = A0_7.setSelectedIndex
        L20_27 = "ComboBox_Select"
        L21_28 = 1
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setControlProperty
        L20_27 = "ComboBox_Select"
        L21_28 = "IntData.Value2"
        L18_25(L19_26, L20_27, L21_28, 1)
        L19_26 = A0_7
        L18_25 = A0_7.setText
        L20_27 = "ComboBox_Select"
        L21_28 = 3103
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Label_NumberInput_2"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_NumberInput_Gil"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "Label_NumberInput_3"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.setVisibility
        L20_27 = "TextBlock_NumberInput_TotalGil"
        L21_28 = true
        L18_25(L19_26, L20_27, L21_28)
        L19_26 = A0_7
        L18_25 = A0_7.getNumberInput
        L20_27 = "CustomControl_NumberInput_TotalGil"
        L18_25 = L18_25(L19_26, L20_27)
        L20_27 = A0_7
        L19_26 = A0_7.updateNumber
        L21_28 = L18_25
        L19_26(L20_27, L21_28, "CustomControl_NumberInput_TotalGil", true)
        L20_27 = A0_7
        L19_26 = A0_7.displayPrice
        L19_26(L20_27)
      end
      if L16_23 == 1 then
        L19_26 = A0_7
        L18_25 = A0_7.setEnable
        L20_27 = "ComboBox_Select"
        L21_28 = false
        L18_25(L19_26, L20_27, L21_28)
      end
      L19_26 = A0_7
      L18_25 = A0_7.setVisibility
      L20_27 = "Button_Extra"
      L21_28 = false
      L18_25(L19_26, L20_27, L21_28)
      L19_26 = A0_7
      L18_25 = A0_7.setHelpParameter
      L20_27 = "Grid_ItemName"
      L21_28 = 1
      L18_25(L19_26, L20_27, L21_28, 75341)
      L19_26 = A0_7
      L18_25 = A0_7.setHelpParameter
      L20_27 = "Label_NumberInput_ItemSource"
      L21_28 = 1
      L18_25(L19_26, L20_27, L21_28, 75343)
      L19_26 = A0_7
      L18_25 = A0_7.setHelpParameter
      L20_27 = "Label_NumberInput_2"
      L21_28 = 1
      L18_25(L19_26, L20_27, L21_28, 75349)
      L19_26 = A0_7
      L18_25 = A0_7.setHelpParameter
      L20_27 = "Label_NumberInput_3"
      L21_28 = 1
      L18_25(L19_26, L20_27, L21_28, 75350)
      L19_26 = A0_7
      L18_25 = A0_7.setHelpParameter
      L20_27 = "TextBlock_NumberInput_TotalGil"
      L21_28 = 1
      L18_25(L19_26, L20_27, L21_28, 75362)
      L19_26 = A0_7
      L18_25 = A0_7.setHelpParameter
      L20_27 = "TextBlock_NumberInput_Gil"
      L21_28 = 1
      L18_25(L19_26, L20_27, L21_28, 75361)
    else
      L18_25 = A0_7.work
      L18_25 = L18_25.mode
      if L18_25 ~= 2 then
        L18_25 = A0_7.work
        L18_25 = L18_25.mode
      else
        if L18_25 == 3 then
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_Unit"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_Price"
          L21_28 = true
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_RewardTitle"
          L21_28 = true
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "TextBlock_OpenBlacket"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_NumberInput_Gil"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_Tax"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          if A3_10 == 8 then
            L18_25 = A0_7.work
            L18_25.error = true
            L18_25 = false
            return L18_25
          end
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Label_NumberInput_ItemSource"
          L21_28 = true
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "TextBlock_ItemStack_ItemSource"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L18_25 = A0_7.work
          L18_25 = L18_25.mode
          if L18_25 == 2 then
            L19_26 = A0_7
            L18_25 = A0_7.setText
            L20_27 = "TextBlock_WindowTitle"
            L21_28 = 3127
            L18_25(L19_26, L20_27, L21_28)
          else
            L19_26 = A0_7
            L18_25 = A0_7.setText
            L20_27 = "TextBlock_WindowTitle"
            L21_28 = 3128
            L18_25(L19_26, L20_27, L21_28)
          end
          L19_26 = A0_7
          L18_25 = A0_7.setContent
          L20_27 = "Button_Extra"
          L21_28 = 3124
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setHelpParameter
          L20_27 = "Button_Extra"
          L21_28 = 1
          L18_25(L19_26, L20_27, L21_28, 75359)
          L19_26 = A0_7
          L18_25 = A0_7.setText
          L20_27 = "TextBlock_RewardTitle"
          L21_28 = 3123
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setHelpParameter
          L20_27 = "Grid_RewardTitle"
          L21_28 = 1
          L18_25(L19_26, L20_27, L21_28, 75355)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_RewardItemName"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_ItemStack"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_NumberInput_TotalGil"
          L21_28 = true
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Label_NumberInput_3"
          L21_28 = true
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "CustomControl_NumberInput_TotalGil"
          L21_28 = true
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "TextBlock_NumberInput_TotalGil"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L18_25 = nil
          L19_26 = A0_7.work
          L19_26 = L19_26.isRetainer
          if L19_26 == false then
            L20_27 = A0_7
            L19_26 = A0_7.getMoney
            L21_28 = 1
            L19_26 = L19_26(L20_27, L21_28)
            L18_25 = L19_26
          else
            L20_27 = A0_7
            L19_26 = A0_7.getMoney
            L21_28 = 4
            L19_26 = L19_26(L20_27, L21_28)
            L18_25 = L19_26
          end
          L20_27 = A0_7
          L19_26 = A0_7.setNumberInput
          L21_28 = "CustomControl_NumberInput_Gil"
          L19_26(L20_27, L21_28, 0, 0, L18_25)
          L20_27 = A0_7
          L19_26 = A0_7.setNumberInput
          L21_28 = "CustomControl_NumberInput_TotalGil"
          L19_26(L20_27, L21_28, 0, 0, L18_25)
          L19_26 = A0_7.work
          L19_26 = L19_26.mode
          if L19_26 == 2 then
            L20_27 = A0_7
            L19_26 = A0_7.setHelpParameter
            L21_28 = "Grid_ItemName"
            L19_26(L20_27, L21_28, 1, 75365)
          else
            L20_27 = A0_7
            L19_26 = A0_7.setHelpParameter
            L21_28 = "Grid_ItemName"
            L19_26(L20_27, L21_28, 1, 75366)
          end
          L20_27 = A0_7
          L19_26 = A0_7.setHelpParameter
          L21_28 = "Label_NumberInput_ItemSource"
          L19_26(L20_27, L21_28, 1, 75367)
          L20_27 = A0_7
          L19_26 = A0_7.setHelpParameter
          L21_28 = "Label_NumberInput_3"
          L19_26(L20_27, L21_28, 1, 75358)
      end
      else
        L18_25 = A0_7.work
        L18_25 = L18_25.mode
        if L18_25 == 6 then
          L19_26 = A0_7
          L18_25 = A0_7.setText
          L20_27 = "TextBlock_WindowTitle"
          L21_28 = 3135
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.setVisibility
          L20_27 = "Grid_Unit"
          L21_28 = false
          L18_25(L19_26, L20_27, L21_28)
          L19_26 = A0_7
          L18_25 = A0_7.getItemContentFromWidget
          L20_27 = "bazaarkind"
          L21_28 = "Int"
          L18_25 = L18_25(L19_26, L20_27, L21_28, A6_13)
          L20_27 = A0_7
          L19_26 = A0_7.getItemContentFromWidget
          L21_28 = "rewardprice"
          L19_26 = L19_26(L20_27, L21_28, "Int", A6_13)
          L20_27 = A0_7.work
          L20_27.price = L19_26
          L21_28 = A0_7
          L20_27 = A0_7.getItemContentFromWidget
          L20_27 = L20_27(L21_28, "stackCount", "Int", A6_13)
          L21_28 = L20_27
          A0_7:setVisibility("Grid_Unit", false)
          if L18_25 == 13 then
            A0_7:setVisibility("TextBlock_Single", false)
            A0_7:setVisibility("TextBlock_Set", true)
            A0_7:setVisibility("TextBlock_Part", false)
            A0_7:setVisibility("TextBlock_OpenBlacket", true)
            A0_7:setVisibility("Grid_NumberInput_Gil", true)
            A0_7:setVisibility("Label_NumberInput_2", false)
            A0_7:setVisibility("TextBlock_NumberInput_Gil", true)
            A0_7:setText("TextBlock_NumberInput_Gil", 3201, _math.floor(L19_26 / L20_27))
            A0_7:setVisibility("TextBlock_CloseBlacket", true)
            A0_7:setVisibility("Grid_NumberInput_TotalGil", true)
            A0_7:setVisibility("Label_NumberInput_3", true)
            A0_7:setVisibility("CustomControl_NumberInput_TotalGil", false)
            A0_7:setVisibility("TextBlock_NumberInput_TotalGil", true)
            A0_7:setText("TextBlock_NumberInput_TotalGil", 3201, L19_26)
            A0_7:setVisibility("Label_NumberInput_ItemSource", false)
            A0_7:setVisibility("TextBlock_ItemStack_ItemSource", true)
            A0_7:setNumberInput("CustomControl_NumberInput_ItemSource", L21_28, 1, L21_28)
            A0_7:setNumberInput("CustomControl_NumberInput_TotalGil", L19_26, 1, L19_26)
          elseif L18_25 == 12 then
            A0_7:setVisibility("TextBlock_Single", false)
            A0_7:setVisibility("TextBlock_Set", false)
            A0_7:setVisibility("TextBlock_Part", true)
            A0_7:setVisibility("TextBlock_OpenBlacket", true)
            A0_7:setVisibility("Grid_NumberInput_Gil", true)
            A0_7:setVisibility("Label_NumberInput_2", false)
            A0_7:setVisibility("TextBlock_NumberInput_Gil", true)
            A0_7:setVisibility("Label_NumberInput_3", true)
            A0_7:setVisibility("CustomControl_NumberInput_TotalGil", false)
            A0_7:setVisibility("TextBlock_NumberInput_TotalGil", true)
            A0_7:setText("TextBlock_NumberInput_Gil", 3201, L19_26)
            A0_7:setVisibility("TextBlock_CloseBlacket", true)
            A0_7:setVisibility("Grid_NumberInput_TotalGil", true)
            A0_7:setText("TextBlock_NumberInput_TotalGil", 3201, L19_26)
            A0_7:setVisibility("Label_NumberInput_ItemSource", true)
            A0_7:setVisibility("TextBlock_ItemStack_ItemSource", false)
            if L21_28 > A0_7:getMoney(1) / L19_26 then
              L21_28 = A0_7:getMoney(1) / L19_26
            end
            A0_7:setNumberInput("CustomControl_NumberInput_ItemSource", 1, 1, L21_28)
            A0_7:setNumberInput("CustomControl_NumberInput_Gil", L19_26, 1, L19_26)
            A0_7:setNumberInput("CustomControl_NumberInput_TotalGil", L19_26, 1, L19_26 * L20_27)
          elseif L18_25 == 11 then
            A0_7:setVisibility("TextBlock_Single", true)
            A0_7:setVisibility("TextBlock_Set", false)
            A0_7:setVisibility("TextBlock_Part", false)
            A0_7:setVisibility("TextBlock_OpenBlacket", false)
            A0_7:setVisibility("Grid_NumberInput_Gil", false)
            A0_7:setVisibility("TextBlock_CloseBlacket", false)
            A0_7:setVisibility("Grid_NumberInput_TotalGil", true)
            A0_7:setVisibility("Label_NumberInput_3", true)
            A0_7:setVisibility("CustomControl_NumberInput_TotalGil", false)
            A0_7:setVisibility("TextBlock_NumberInput_TotalGil", true)
            A0_7:setText("TextBlock_NumberInput_TotalGil", 3201, L19_26)
            A0_7:setNumberInput("CustomControl_NumberInput_ItemSource", 1, 1, 1)
            A0_7:setNumberInput("CustomControl_NumberInput_Gil", L19_26, 1, L19_26)
            A0_7:setNumberInput("CustomControl_NumberInput_TotalGil", L19_26, 1, L19_26)
          end
          A0_7:setVisibility("Grid_Price", true)
          A0_7:setVisibility("Grid_RewardTitle", false)
          A0_7:setVisibility("Grid_RewardItemName", false)
          A0_7:setVisibility("Grid_ItemStack", false)
          A0_7:setVisibility("Grid_Tax", false)
          A0_7:setHelpParameter("Grid_ItemName", 1, 75342)
          A0_7:setHelpParameter("Label_NumberInput_ItemSource", 1, 75344)
          A0_7:setHelpParameter("Grid_NumberInput_Gil", 1, 75361)
          A0_7:setHelpParameter("Grid_NumberInput_TotalGil", 1, 75362)
          A0_7:setVisibility("Button_Extra", false)
        else
          L18_25 = A0_7.work
          L18_25 = L18_25.mode
          if L18_25 ~= 7 then
            L18_25 = A0_7.work
            L18_25 = L18_25.mode
            if L18_25 == 8 then
            end
          end
        end
      end
    end
    L19_26 = A0_7
    L18_25 = A0_7.displayPrice
    L20_27 = A6_13
    L18_25(L19_26, L20_27)
  end
end
function BazaarEditWidget.processBeforeShow(A0_29, A1_30)
  if A1_30 ~= true and A0_29.work.error == true then
    A0_29:setVisibility("Grid_Base", false)
    A0_29.work.chosenOperation = 1
    if A0_29:_getParentWidget() ~= nil then
      if A0_29.work.isRetainer == false then
        A0_29:_getParentWidget():setBazaarEditData(A0_29.work.chosenOperation)
      else
        A0_29:_getParentWidget():setBazaarEditData(A0_29.work.chosenOperation, 0, 0, 0, 0, 0, 0)
      end
      A0_29:_getParentWidget():closeBazaarEdit()
    else
      desktopWidget:closeWidgetDirect(A0_29)
    end
    return true
  end
  return true
end
function BazaarEditWidget.setNumberInput(A0_31, A1_32, A2_33, A3_34, A4_35)
  if A3_34 ~= nil then
    A0_31:setControlProperty(A1_32, "Minimum", A3_34)
  end
  if A4_35 ~= nil then
    A0_31:setMaximum(A1_32, A4_35)
    if A1_32 == "CustomControl_NumberInput_Gil" then
      A0_31.work.num2max = A4_35
    elseif A1_32 == "CustomControl_NumberInput_TotalGil" then
      A0_31.work.num3max = A4_35
    end
  end
  A0_31:setValue(A1_32, A2_33)
  if A1_32 == "CustomControl_NumberInput_Gil" then
    A0_31.work.num2 = A2_33
    if A0_31.work.num2 > A0_31.work.num2max then
      A0_31:setValue(A1_32, A0_31.work.num2max)
      A0_31.work.num2 = A0_31.work.num2max
    end
    A0_31:setText("TextBlock_NumberInput_Gil", 3201, A0_31.work.num2)
  elseif A1_32 == "CustomControl_NumberInput_TotalGil" then
    A0_31.work.num3 = A2_33
    if A0_31.work.num3 > A0_31.work.num3max then
      A0_31:setValue(A1_32, A0_31.work.num3max)
      A0_31.work.num3 = A0_31.work.num3max
    end
    A0_31:setText("TextBlock_NumberInput_TotalGil", 3201, A0_31.work.num3)
  end
  return
end
function BazaarEditWidget.getNumberInput(A0_36, A1_37)
  if A1_37 == "CustomControl_NumberInput_Gil" then
    return A0_36.work.num2
  elseif A1_37 == "CustomControl_NumberInput_TotalGil" then
    return A0_36.work.num3
  else
    return A0_36:getValue(A1_37)
  end
end
function BazaarEditWidget.getMoney(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43
  if A1_39 == 1 then
    return L3_41(L4_42)
  elseif A1_39 == 4 then
    L5_43 = 100
    for L5_43 = 1, L3_41(L4_42, L5_43) do
      if A0_38:isMoney(L5_43, 4) == true then
        return A0_38:isMoney(L5_43, 4)
      end
    end
  end
  return L2_40
end
function BazaarEditWidget.isMoney(A0_44, A1_45, A2_46)
  local L3_47, L4_48, L5_49, L6_50
  if A2_46 == 1 then
    L3_47 = desktopWidget
    L4_48 = L3_47
    L3_47 = L3_47.getPlayerItemInPackage
    L5_49 = 100
    L6_50 = A1_45
    L6_50 = L3_47(L4_48, L5_49, L6_50)
    if L3_47 == 1000001 then
      return true, L6_50
    end
  elseif A2_46 == 4 then
    L3_47 = desktopWidget
    L4_48 = L3_47
    L3_47 = L3_47.getRetainerItem
    L5_49 = 100
    L6_50 = A1_45
    L3_47 = L3_47(L4_48, L5_49, L6_50)
    if L3_47 ~= nil then
      L5_49 = L3_47
      L4_48 = L3_47._getCatalogID
      L4_48 = L4_48(L5_49)
      if L4_48 == 1000001 then
        L4_48 = true
        L6_50 = L3_47
        L5_49 = L3_47._countStack
        L6_50 = L5_49(L6_50)
        return L4_48, L5_49, L6_50, L5_49(L6_50)
      end
    end
  end
  L3_47 = false
  L4_48 = 0
  return L3_47, L4_48
end
function BazaarEditWidget.extraButtonIsDraw(A0_51)
  A0_51:setContent("Button_Extra", 3113)
  A0_51:setHelpParameter("Button_Extra", 1)
  A0_51:setEnable("Button_Done", false)
  A0_51.work.extraIsDraw = true
end
function BazaarEditWidget.setWindowFocus(A0_52, A1_53)
  if A1_53 ~= nil and A1_53 ~= "" then
    A0_52:setLogicalFocus(A1_53)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_52 then
      A0_52:setKeyboardFocusedControl(A1_53)
    end
  end
end
function BazaarEditWidget.displayPrice(A0_54, A1_55)
  A0_54:setText("TextBlock_TaxCaption", 3118, A0_54:getTax())
  A0_54:setText("TextBlock_TaxGil", 3201, _math.floor(A0_54:getNumberInput("CustomControl_NumberInput_Gil") * A0_54:getTax() / 100))
  A0_54:setText("TextBlock_TaxTotalGil", 3201, _math.floor(A0_54:getNumberInput("CustomControl_NumberInput_TotalGil") * A0_54:getTax() / 100))
  if A0_54.work.extraIsDraw == false and (A0_54.work.mode == 2 or A0_54.work.mode == 3) then
    if A0_54.work.rewardIsItem == false then
      if A0_54:getNumberInput("CustomControl_NumberInput_TotalGil") == 0 then
        A0_54:setEnable("Button_Done", false)
      else
        A0_54:setEnable("Button_Done", true)
      end
    else
      A0_54:setEnable("Button_Done", true)
    end
  end
  if A0_54.work.mode == 1 and A0_54.work.extraIsDraw == false then
    if A0_54.work.bakstackable == true then
      if A0_54:getControlProperty("ComboBox_Select", "IntData.Value2") == -1 then
        A0_54:setEnable("Button_Done", false)
      elseif A0_54:getControlProperty("ComboBox_Select", "IntData.Value2") == 1 and A0_54:getNumberInput("CustomControl_NumberInput_Gil") == 0 then
        A0_54:setEnable("Button_Done", false)
      elseif A0_54:getControlProperty("ComboBox_Select", "IntData.Value2") == 0 and A0_54:getNumberInput("CustomControl_NumberInput_TotalGil") == 0 then
        A0_54:setEnable("Button_Done", false)
      else
        A0_54:setEnable("Button_Done", true)
      end
    elseif A0_54:getNumberInput("CustomControl_NumberInput_Gil") == 0 or A0_54:getNumberInput("CustomControl_NumberInput_TotalGil") == 0 then
      A0_54:setEnable("Button_Done", false)
    else
      A0_54:setEnable("Button_Done", true)
    end
  end
end
function BazaarEditWidget.processUICommandEvent(A0_56, A1_57, A2_58, A3_59, A4_60, A5_61)
  local L6_62, L7_63, L8_64, L9_65, L10_66, L11_67
  L6_62 = 0
  L7_63 = 0
  L9_65 = A0_56
  L8_64 = A0_56._getParentWidget
  L8_64 = L8_64(L9_65)
  if L8_64 == nil then
  end
  L9_65 = A0_56.work
  L9_65 = L9_65.rewardWidgetOpen
  if L9_65 == true then
    return
  end
  L9_65 = worldMaster
  L10_66 = L9_65
  L9_65 = L9_65._getMyPlayer
  L9_65 = L9_65(L10_66)
  if A3_59 == "UILuaCommands.Cancel" then
    if A2_58 == "Button_Back" then
      L10_66 = A0_56.work
      L10_66 = L10_66.chosenOperation
      if L10_66 ~= 1 then
        L10_66 = A0_56.work
        L10_66.chosenOperation = 1
        L10_66 = A0_56.work
        L10_66 = L10_66.isRetainer
        if L10_66 == false then
          L11_67 = L8_64
          L10_66 = L8_64.setBazaarEditData
          L10_66(L11_67, A0_56.work.chosenOperation)
        else
          L11_67 = L8_64
          L10_66 = L8_64.setBazaarEditData
          L10_66(L11_67, A0_56.work.chosenOperation, 0, 0, 0, 0, 0, 0)
        end
        L11_67 = L8_64
        L10_66 = L8_64.closeBazaarEdit
        L10_66(L11_67)
      end
      L10_66 = true
      return L10_66
    else
      L11_67 = A0_56
      L10_66 = A0_56.setKeyboardFocusedControl
      L10_66(L11_67, "Button_Back")
      return
    end
  end
  if A3_59 == "UILuaCommands.SelectComboBoxItem" and A2_58 == "ComboBox_Select" then
    L10_66 = A0_56.work
    L10_66 = L10_66.mode
    if L10_66 == 1 then
      L11_67 = A0_56
      L10_66 = A0_56.getSelectedIndex
      L10_66 = L10_66(L11_67, "ComboBox_Select")
      if L10_66 > -1 then
        L11_67 = A0_56.setControlProperty
        L11_67(A0_56, "ComboBox_Select", "IntData.Value2", L10_66)
      end
      L11_67 = A0_56._setProperty
      L11_67(A0_56, nil, "ComboBox_Select", "SelectedIndex", -1)
      if L10_66 ~= 1 then
        L11_67 = A0_56.getValue
        L11_67 = L11_67(A0_56, "CustomControl_NumberInput_ItemSource")
      else
        if L11_67 == 1 then
          L11_67 = A0_56.setControlProperty
          L11_67(A0_56, "ComboBox_Select", "IntData.Value2", 1)
          L11_67 = A0_56.setText
          L11_67(A0_56, "ComboBox_Select", 3103)
          L11_67 = A0_56.setVisibility
          L11_67(A0_56, "Label_NumberInput_2", true)
          L11_67 = A0_56.setVisibility
          L11_67(A0_56, "TextBlock_NumberInput_Gil", false)
          L11_67 = A0_56.setVisibility
          L11_67(A0_56, "Label_NumberInput_3", false)
          L11_67 = A0_56.setVisibility
          L11_67(A0_56, "TextBlock_NumberInput_TotalGil", true)
      end
      elseif L10_66 == 0 then
        L11_67 = A0_56.setControlProperty
        L11_67(A0_56, "ComboBox_Select", "IntData.Value2", 0)
        L11_67 = A0_56.setVisibility
        L11_67(A0_56, "Label_NumberInput_3", true)
        L11_67 = A0_56.setVisibility
        L11_67(A0_56, "TextBlock_NumberInput_TotalGil", false)
        L11_67 = A0_56.setVisibility
        L11_67(A0_56, "Label_NumberInput_2", false)
        L11_67 = A0_56.setVisibility
        L11_67(A0_56, "TextBlock_NumberInput_Gil", true)
      end
      L11_67 = A0_56.getNumberInput
      L11_67 = L11_67(A0_56, "CustomControl_NumberInput_TotalGil")
      A0_56:updateNumber(L11_67, "CustomControl_NumberInput_TotalGil", true)
      A0_56:displayPrice()
    end
  end
  if A3_59 == "UILuaCommands.Operate" then
    if A2_58 == "Button_Back" then
      L10_66 = A0_56.work
      L10_66 = L10_66.chosenOperation
      if L10_66 ~= 1 then
        L10_66 = A0_56.work
        L10_66.chosenOperation = 1
        L10_66 = A0_56.work
        L10_66 = L10_66.isRetainer
        if L10_66 == false then
          L11_67 = L8_64
          L10_66 = L8_64.setBazaarEditData
          L10_66(L11_67, A0_56.work.chosenOperation)
        else
          L11_67 = L8_64
          L10_66 = L8_64.setBazaarEditData
          L10_66(L11_67, A0_56.work.chosenOperation, 0, 0, 0, 0, 0, 0)
        end
        L11_67 = L8_64
        L10_66 = L8_64.closeBazaarEdit
        L10_66(L11_67)
      end
      L10_66 = true
      return L10_66
    end
    L10_66 = A0_56.work
    L10_66 = L10_66.chosenOperation
    if L10_66 ~= 0 then
      return
    end
    if A2_58 == "Button_Done" then
      L11_67 = A0_56
      L10_66 = A0_56.checkCertainItem
      L10_66 = L10_66(L11_67)
      if L10_66 == false then
        L10_66 = A0_56.work
        L10_66.chosenOperation = 1
        L10_66 = A0_56.work
        L10_66 = L10_66.isRetainer
        if L10_66 == false then
          L11_67 = L8_64
          L10_66 = L8_64.setBazaarEditData
          L10_66(L11_67, A0_56.work.chosenOperation)
        else
          L11_67 = L8_64
          L10_66 = L8_64.setBazaarEditData
          L10_66(L11_67, A0_56.work.chosenOperation, 0, 0, 0, 0, 0, 0)
        end
        L11_67 = L8_64
        L10_66 = L8_64.closeBazaarEdit
        L10_66(L11_67)
        return
      end
      L10_66 = A0_56.work
      L10_66.chosenOperation = 2
      L10_66 = A0_56.work
      L11_67 = A0_56.getNumberInput
      L11_67 = L11_67(A0_56, "CustomControl_NumberInput_ItemSource")
      L10_66.stack = L11_67
      L10_66 = A0_56.work
      L10_66 = L10_66.mode
      if L10_66 == 1 then
        L10_66 = A0_56.work
        L10_66 = L10_66.bakstackable
        if L10_66 == true then
          L11_67 = A0_56
          L10_66 = A0_56.getControlProperty
          L10_66 = L10_66(L11_67, "ComboBox_Select", "IntData.Value2")
          if L10_66 == -1 then
            L11_67 = A0_56.work
            L11_67.chosenOperation = 0
            L11_67 = false
            return L11_67
          elseif L10_66 == 0 then
            L6_62 = 13
            L11_67 = A0_56.getNumberInput
            L11_67 = L11_67(A0_56, "CustomControl_NumberInput_TotalGil")
            L7_63 = L11_67
          else
            L6_62 = 12
            L11_67 = A0_56.getNumberInput
            L11_67 = L11_67(A0_56, "CustomControl_NumberInput_Gil")
            L7_63 = L11_67
          end
        else
          L10_66 = A0_56.work
          L10_66 = L10_66.unit
          if L10_66 == 1 then
            L11_67 = A0_56
            L10_66 = A0_56.getNumberInput
            L10_66 = L10_66(L11_67, "CustomControl_NumberInput_TotalGil")
            L7_63 = L10_66
            L6_62 = 11
          end
        end
        L10_66 = A0_56.work
        L10_66 = L10_66.isRetainer
        if L10_66 == false then
          L11_67 = L9_65
          L10_66 = L9_65._getItem
          L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
          if L10_66 == nil then
            L11_67 = A0_56
            L10_66 = A0_56.closeWidgetForCancel
            return L10_66(L11_67)
          end
          L10_66 = desktopWidget
          L11_67 = L10_66
          L10_66 = L10_66.isDealingItem
          L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
          if L10_66 == true then
            L11_67 = A0_56
            L10_66 = A0_56.closeWidgetForCancel
            return L10_66(L11_67)
          end
          L10_66 = desktopWidget
          L11_67 = L10_66
          L10_66 = L10_66.isPlayerItemAttached
          L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
          if L10_66 == true then
            L11_67 = A0_56
            L10_66 = A0_56.closeWidgetForCancel
            return L10_66(L11_67)
          end
          L10_66 = desktopWidget
          L11_67 = L10_66
          L10_66 = L10_66.setItemDeal
          L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem, L6_62, L7_63, A0_56.work.stack)
          if L10_66 == true then
            L11_67 = L8_64
            L10_66 = L8_64.setBazaarEditData
            L10_66(L11_67, A0_56.work.chosenOperation)
            L11_67 = L8_64
            L10_66 = L8_64.closeBazaarEdit
            L10_66(L11_67)
            L10_66 = true
            return L10_66
          else
            L10_66 = A0_56.work
            L10_66.chosenOperation = 0
            L11_67 = L8_64
            L10_66 = L8_64.closeBazaarEdit
            L10_66(L11_67)
            L10_66 = false
            return L10_66
          end
        else
          L11_67 = L8_64
          L10_66 = L8_64.setBazaarEditData
          L10_66(L11_67, 21, L6_62, L7_63, A0_56.work.stack, 0, 0, 0)
          L11_67 = L8_64
          L10_66 = L8_64.closeBazaarEdit
          L10_66(L11_67)
          L10_66 = true
          return L10_66
        end
      else
        L10_66 = A0_56.work
        L10_66 = L10_66.mode
        if L10_66 == 2 then
          L6_62 = 20
          L11_67 = A0_56
          L10_66 = A0_56.getNumberInput
          L10_66 = L10_66(L11_67, "CustomControl_NumberInput_TotalGil")
          L7_63 = L10_66
          L10_66 = A0_56.work
          L11_67 = A0_56.getNumberInput
          L11_67 = L11_67(A0_56, "CustomControl_NumberInput_ItemSource")
          L10_66.stack = L11_67
          L10_66 = A0_56.work
          L10_66 = L10_66.rewardIsItem
          if L10_66 == false then
            L10_66 = A0_56.work
            L10_66 = L10_66.isRetainer
            if L10_66 == false then
              L11_67 = L9_65
              L10_66 = L9_65._getItem
              L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
              if L10_66 == nil then
                L11_67 = A0_56
                L10_66 = A0_56.closeWidgetForCancel
                return L10_66(L11_67)
              end
              L10_66 = desktopWidget
              L11_67 = L10_66
              L10_66 = L10_66.isDealingItem
              L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
              if L10_66 == true then
                L11_67 = A0_56
                L10_66 = A0_56.closeWidgetForCancel
                return L10_66(L11_67)
              end
              L10_66 = desktopWidget
              L11_67 = L10_66
              L10_66 = L10_66.isPlayerItemAttached
              L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
              if L10_66 == true then
                L11_67 = A0_56
                L10_66 = A0_56.closeWidgetForCancel
                return L10_66(L11_67)
              end
              L10_66 = desktopWidget
              L11_67 = L10_66
              L10_66 = L10_66.setItemDeal
              L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem, L6_62, L7_63, A0_56.work.stack)
              if L10_66 == true then
                L11_67 = L8_64
                L10_66 = L8_64.setBazaarEditData
                L10_66(L11_67, A0_56.work.chosenOperation)
                L11_67 = L8_64
                L10_66 = L8_64.closeBazaarEdit
                L10_66(L11_67)
                L10_66 = true
                return L10_66
              else
                L10_66 = A0_56.work
                L10_66.chosenOperation = 0
                L11_67 = L8_64
                L10_66 = L8_64.closeBazaarEdit
                L10_66(L11_67)
                L10_66 = false
                return L10_66
              end
            else
              L11_67 = L8_64
              L10_66 = L8_64.setBazaarEditData
              L10_66(L11_67, 21, L6_62, L7_63, A0_56.work.stack, 0, 0, 0)
              L11_67 = L8_64
              L10_66 = L8_64.closeBazaarEdit
              L10_66(L11_67)
            end
          else
            L11_67 = A0_56
            L10_66 = A0_56.getNumberInput
            L10_66 = L10_66(L11_67, "CustomControl_NumberInput")
            L11_67 = A0_56.work
            L11_67 = L11_67.isRetainer
            if L11_67 == false then
              L11_67 = L9_65._getItem
              L11_67 = L11_67(L9_65, A0_56.work.chosenPackage, A0_56.work.chosenItem)
              if L11_67 == nil then
                L11_67 = A0_56.closeWidgetForCancel
                return L11_67(A0_56)
              end
              L11_67 = desktopWidget
              L11_67 = L11_67.isDealingItem
              L11_67 = L11_67(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
              if L11_67 == true then
                L11_67 = A0_56.closeWidgetForCancel
                return L11_67(A0_56)
              end
              L11_67 = desktopWidget
              L11_67 = L11_67.isPlayerItemAttached
              L11_67 = L11_67(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
              if L11_67 == true then
                L11_67 = A0_56.closeWidgetForCancel
                return L11_67(A0_56)
              end
              L11_67 = L9_65._getItem
              L11_67 = L11_67(L9_65, A0_56.work.rewardItemPackageSelectReturn, A0_56.work.rewardItemSelectReturn)
              if L11_67 ~= nil then
                if desktopWidget:setItemDeal(A0_56.work.chosenPackage, A0_56.work.chosenItem, L6_62, L11_67, A0_56.work.stack, L10_66) == true then
                  L8_64:setBazaarEditData(A0_56.work.chosenOperation)
                  L8_64:closeBazaarEdit()
                  return true
                else
                  A0_56.work.chosenOperation = 0
                  L8_64:closeBazaarEdit()
                  return false
                end
              end
            else
              L11_67 = L8_64.setBazaarEditData
              L11_67(L8_64, 21, L6_62, 0, A0_56.work.stack, A0_56.work.rewardItemPackageSelectReturn, A0_56.work.rewardItemSelectReturn, L10_66)
              L11_67 = L8_64.closeBazaarEdit
              L11_67(L8_64)
            end
          end
        else
          L10_66 = A0_56.work
          L10_66 = L10_66.mode
          if L10_66 == 3 then
            L6_62 = 30
            L11_67 = A0_56
            L10_66 = A0_56.getNumberInput
            L10_66 = L10_66(L11_67, "CustomControl_NumberInput_TotalGil")
            L7_63 = L10_66
            L10_66 = A0_56.work
            L11_67 = A0_56.getNumberInput
            L11_67 = L11_67(A0_56, "CustomControl_NumberInput_ItemSource")
            L10_66.stack = L11_67
            L10_66 = A0_56.work
            L10_66 = L10_66.rewardIsItem
            if L10_66 == false then
              L10_66 = A0_56.work
              L10_66 = L10_66.isRetainer
              if L10_66 == false then
                L11_67 = L9_65
                L10_66 = L9_65._getItem
                L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
                if L10_66 == nil then
                  L11_67 = A0_56
                  L10_66 = A0_56.closeWidgetForCancel
                  return L10_66(L11_67)
                end
                L10_66 = desktopWidget
                L11_67 = L10_66
                L10_66 = L10_66.isDealingItem
                L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
                if L10_66 == true then
                  L11_67 = A0_56
                  L10_66 = A0_56.closeWidgetForCancel
                  return L10_66(L11_67)
                end
                L10_66 = desktopWidget
                L11_67 = L10_66
                L10_66 = L10_66.isPlayerItemAttached
                L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
                if L10_66 == true then
                  L11_67 = A0_56
                  L10_66 = A0_56.closeWidgetForCancel
                  return L10_66(L11_67)
                end
                L10_66 = desktopWidget
                L11_67 = L10_66
                L10_66 = L10_66.setItemDeal
                L10_66 = L10_66(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem, L6_62, L7_63, A0_56.work.stack)
                if L10_66 == true then
                  L11_67 = L8_64
                  L10_66 = L8_64.setBazaarEditData
                  L10_66(L11_67, A0_56.work.chosenOperation)
                  L11_67 = L8_64
                  L10_66 = L8_64.closeBazaarEdit
                  L10_66(L11_67)
                  L10_66 = true
                  return L10_66
                else
                  L10_66 = A0_56.work
                  L10_66.chosenOperation = 0
                  L11_67 = L8_64
                  L10_66 = L8_64.closeBazaarEdit
                  L10_66(L11_67)
                  L10_66 = false
                  return L10_66
                end
              else
                L11_67 = L8_64
                L10_66 = L8_64.setBazaarEditData
                L10_66(L11_67, 21, L6_62, L7_63, A0_56.work.stack, 0, 0, 0)
                L11_67 = L8_64
                L10_66 = L8_64.closeBazaarEdit
                L10_66(L11_67)
              end
            else
              L11_67 = A0_56
              L10_66 = A0_56.getNumberInput
              L10_66 = L10_66(L11_67, "CustomControl_NumberInput")
              L11_67 = A0_56.work
              L11_67 = L11_67.isRetainer
              if L11_67 == false then
                L11_67 = L9_65._getItem
                L11_67 = L11_67(L9_65, A0_56.work.chosenPackage, A0_56.work.chosenItem)
                if L11_67 == nil then
                  L11_67 = A0_56.closeWidgetForCancel
                  return L11_67(A0_56)
                end
                L11_67 = desktopWidget
                L11_67 = L11_67.isDealingItem
                L11_67 = L11_67(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
                if L11_67 == true then
                  L11_67 = A0_56.closeWidgetForCancel
                  return L11_67(A0_56)
                end
                L11_67 = desktopWidget
                L11_67 = L11_67.isPlayerItemAttached
                L11_67 = L11_67(L11_67, A0_56.work.chosenPackage, A0_56.work.chosenItem)
                if L11_67 == true then
                  L11_67 = A0_56.closeWidgetForCancel
                  return L11_67(A0_56)
                end
                L11_67 = L9_65._getItem
                L11_67 = L11_67(L9_65, A0_56.work.rewardItemPackageSelectReturn, A0_56.work.rewardItemSelectReturn)
                if L11_67 ~= nil then
                  if desktopWidget:setItemDeal(A0_56.work.chosenPackage, A0_56.work.chosenItem, L6_62, L11_67, A0_56.work.stack, L10_66) == true then
                    L8_64:setBazaarEditData(A0_56.work.chosenOperation)
                    L8_64:closeBazaarEdit()
                    return true
                  else
                    A0_56.work.chosenOperation = 0
                    L8_64:closeBazaarEdit()
                    return false
                  end
                end
              else
                L11_67 = L8_64.setBazaarEditData
                L11_67(L8_64, 21, L6_62, 0, A0_56.work.stack, A0_56.work.rewardItemPackageSelectReturn, A0_56.work.rewardItemSelectReturn, L10_66)
                L11_67 = L8_64.closeBazaarEdit
                L11_67(L8_64)
              end
            end
          else
            L10_66 = A0_56.work
            L10_66 = L10_66.mode
            if L10_66 == 5 then
              L11_67 = L8_64
              L10_66 = L8_64.setBazaarEditData
              L10_66(L11_67, 5)
              L11_67 = L8_64
              L10_66 = L8_64.closeBazaarEdit
              L10_66(L11_67)
            else
              L10_66 = A0_56.work
              L10_66 = L10_66.mode
              if L10_66 == 6 then
                L11_67 = A0_56
                L10_66 = A0_56.getNumberInput
                L10_66 = L10_66(L11_67, "CustomControl_NumberInput_ItemSource")
                L11_67 = A0_56.getNumberInput
                L11_67 = L11_67(A0_56, "CustomControl_NumberInput_TotalGil")
                if desktopWidget:executeBazaarBuy(A0_56.work.chosenPackage, A0_56.work.chosenItem, L11_67, L10_66) == true then
                  L8_64:setBazaarEditData(A0_56.work.chosenOperation)
                  L8_64:closeBazaarEdit()
                  return true
                else
                  L8_64:closeBazaarEdit()
                end
              else
                L10_66 = A0_56.work
                L10_66 = L10_66.mode
                if L10_66 == 7 then
                else
                  L10_66 = A0_56.work
                  L10_66 = L10_66.mode
                  if L10_66 == 8 then
                  end
                end
              end
            end
          end
        end
      end
      L10_66 = true
      return L10_66
    end
    if A2_58 == "Button_Extra" then
      L10_66 = A0_56.work
      L10_66 = L10_66.extraIsDraw
      if L10_66 == false then
        L10_66 = A0_56.work
        L10_66 = L10_66.mode
        if L10_66 ~= 2 then
          L10_66 = A0_56.work
          L10_66 = L10_66.mode
        elseif L10_66 == 3 then
          L10_66 = A0_56.work
          L10_66 = L10_66.rewardIsItem
          if L10_66 == false then
            L10_66 = A0_56.work
            L10_66 = L10_66.isRetainer
            if L10_66 == false then
              L10_66 = desktopWidget
              L11_67 = L10_66
              L10_66 = L10_66.openChildWidget
              L10_66 = L10_66(L11_67, "ItemSelectWidget", A0_56, true, true, 400, A0_56.work.chosenPackage, A0_56.work.chosenItem)
              if L10_66 == true then
                L10_66 = A0_56.work
                L10_66.rewardItemSelectReturn = 0
              end
            else
              L10_66 = desktopWidget
              L11_67 = L10_66
              L10_66 = L10_66.openChildWidget
              L10_66 = L10_66(L11_67, "ItemSelectWidget", A0_56, true, true, 400, A0_56.work.chosenPackage, A0_56.work.chosenItem, 4)
              if L10_66 == true then
                L10_66 = A0_56.work
                L10_66.rewardItemSelectReturn = 0
              end
            end
          else
            L11_67 = A0_56
            L10_66 = A0_56.setContent
            L10_66(L11_67, "Button_Extra", 3124)
            L11_67 = A0_56
            L10_66 = A0_56.setHelpParameter
            L10_66(L11_67, "Button_Extra", 1, 75359)
            L11_67 = A0_56
            L10_66 = A0_56.setText
            L10_66(L11_67, "TextBlock_RewardTitle", 3123)
            L11_67 = A0_56
            L10_66 = A0_56.setHelpParameter
            L10_66(L11_67, "Grid_RewardTitle", 1, 75355)
            L11_67 = A0_56
            L10_66 = A0_56.setVisibility
            L10_66(L11_67, "Grid_RewardItemName", false)
            L11_67 = A0_56
            L10_66 = A0_56.setVisibility
            L10_66(L11_67, "Grid_ItemStack", false)
            L11_67 = A0_56
            L10_66 = A0_56.setVisibility
            L10_66(L11_67, "Grid_NumberInput_TotalGil", true)
            L11_67 = A0_56
            L10_66 = A0_56.setVisibility
            L10_66(L11_67, "Label_NumberInput_3", true)
            L11_67 = A0_56
            L10_66 = A0_56.setVisibility
            L10_66(L11_67, "TextBlock_NumberInput_TotalGil", false)
            L11_67 = A0_56
            L10_66 = A0_56.setKeyboardFocusedControl
            L10_66(L11_67, "CustomControl_NumberInput_TotalGil")
            L10_66 = A0_56.work
            L10_66.rewardIsItem = false
            L11_67 = A0_56
            L10_66 = A0_56.displayPrice
            L10_66(L11_67)
          end
        end
      else
      end
      L10_66 = true
      return L10_66
    end
  end
  if A3_59 == "NumberInputBox.ValueChanged" then
    L11_67 = A0_56
    L10_66 = A0_56.updateNumber
    L10_66(L11_67, A4_60, A2_58)
  end
end
function BazaarEditWidget.updateNumber(A0_68, A1_69, A2_70, A3_71)
  local L4_72, L5_73, L6_74, L7_75
  L4_72 = A0_68.work
  L4_72 = L4_72.mode
  if L4_72 == 6 then
    if A2_70 == "CustomControl_NumberInput_ItemSource" then
      L5_73 = A0_68
      L4_72 = A0_68.getControlProperty
      L6_74 = A2_70
      L7_75 = "IsKeyboardFocusWithin"
      L4_72 = L4_72(L5_73, L6_74, L7_75)
      if L4_72 == true then
        L5_73 = A0_68
        L4_72 = A0_68.getNumberInput
        L6_74 = "CustomControl_NumberInput_Gil"
        L4_72 = L4_72(L5_73, L6_74)
        L4_72 = A1_69 * L4_72
        L6_74 = A0_68
        L5_73 = A0_68.setNumberInput
        L7_75 = "CustomControl_NumberInput_TotalGil"
        L5_73(L6_74, L7_75, L4_72)
        L6_74 = A0_68
        L5_73 = A0_68.setText
        L7_75 = "TextBlock_NumberInput_TotalGil"
        L5_73(L6_74, L7_75, 3201, L4_72)
        L6_74 = A0_68
        L5_73 = A0_68.getMoney
        L7_75 = 1
        L5_73 = L5_73(L6_74, L7_75)
        if L4_72 > L5_73 then
          L6_74 = A0_68
          L5_73 = A0_68.setEnable
          L7_75 = "Button_Done"
          L5_73(L6_74, L7_75, false)
        else
          L6_74 = A0_68
          L5_73 = A0_68.setEnable
          L7_75 = "Button_Done"
          L5_73(L6_74, L7_75, true)
        end
      end
    end
  elseif A2_70 == "CustomControl_NumberInput_ItemSource" then
    L5_73 = A0_68
    L4_72 = A0_68.getControlProperty
    L6_74 = A2_70
    L7_75 = "IsKeyboardFocusWithin"
    L4_72 = L4_72(L5_73, L6_74, L7_75)
    if L4_72 == true then
      L5_73 = A0_68
      L4_72 = A0_68.getNumberInput
      L6_74 = "CustomControl_NumberInput_Gil"
      L4_72 = L4_72(L5_73, L6_74)
      L5_73 = A1_69
      L6_74, L7_75 = nil, nil
      if A0_68.work.mode == 2 or A0_68.work.mode == 3 then
        if A0_68.work.isRetainer == false then
          L7_75 = A0_68:getMoney(1)
        else
          L7_75 = A0_68:getMoney(4)
        end
      elseif A0_68.work.mode == 1 then
        L7_75 = 999999999
        L6_74 = L5_73 * L4_72
        if L7_75 < L6_74 then
          L5_73 = _math.floor(L7_75 / L4_72)
          if L5_73 >= A0_68:getControlProperty(A2_70, "Minimum") then
            A0_68:setNumberInput(A2_70, L5_73)
            L6_74 = L5_73 * L4_72
          else
            L5_73 = A0_68:getControlProperty(A2_70, "Minimum")
            A0_68:setNumberInput(A2_70, L5_73)
            L6_74 = L5_73 * L4_72
            if L7_75 < L6_74 then
              L6_74 = L7_75
              L4_72 = L6_74
              A0_68:setNumberInput("CustomControl_NumberInput_Gil", L4_72)
            end
          end
        end
        A0_68:setNumberInput("CustomControl_NumberInput_TotalGil", L6_74)
      end
      if L5_73 == 1 and A0_68:getControlProperty("ComboBox_Select", "IntData.Value2") == 0 then
        A0_68:setSelectedIndex("ComboBox_Select", 1)
        A0_68:setControlProperty("ComboBox_Select", "IntData.Value2", 1)
        A0_68:setText("ComboBox_Select", 3103)
        A0_68:setVisibility("Label_NumberInput_2", true)
        A0_68:setVisibility("TextBlock_NumberInput_Gil", false)
        A0_68:setVisibility("Label_NumberInput_3", false)
        A0_68:setVisibility("TextBlock_NumberInput_TotalGil", true)
      end
    end
  elseif A2_70 == "CustomControl_NumberInput_Gil" then
    L5_73 = A0_68
    L4_72 = A0_68.getControlProperty
    L6_74 = A2_70
    L7_75 = "IsKeyboardFocusWithin"
    L4_72 = L4_72(L5_73, L6_74, L7_75)
    if L4_72 == true or A3_71 == true then
      L5_73 = A0_68
      L4_72 = A0_68.getNumberInput
      L6_74 = "CustomControl_NumberInput_ItemSource"
      L4_72 = L4_72(L5_73, L6_74)
      L5_73 = A1_69
      L7_75 = A0_68
      L6_74 = A0_68.setNumberInput
      L6_74(L7_75, A2_70, A1_69)
      L6_74, L7_75 = nil, nil
      if A0_68.work.mode == 2 or A0_68.work.mode == 3 then
        if A0_68.work.isRetainer == false then
          L7_75 = A0_68:getMoney(1)
        else
          L7_75 = A0_68:getMoney(4)
        end
      elseif A0_68.work.mode == 1 then
        L7_75 = 999999999
        L6_74 = L4_72 * L5_73
        if L7_75 < L6_74 then
          L5_73 = _math.floor(L7_75 / L4_72)
          A0_68:setNumberInput(A2_70, L5_73)
          L6_74 = L4_72 * L5_73
        end
      end
      A0_68:setNumberInput("CustomControl_NumberInput_TotalGil", L6_74)
    end
  elseif A2_70 == "CustomControl_NumberInput_TotalGil" then
    L5_73 = A0_68
    L4_72 = A0_68.getControlProperty
    L6_74 = A2_70
    L7_75 = "IsKeyboardFocusWithin"
    L4_72 = L4_72(L5_73, L6_74, L7_75)
    if L4_72 == true or A3_71 == true then
      L5_73 = A0_68
      L4_72 = A0_68.getNumberInput
      L6_74 = "CustomControl_NumberInput_ItemSource"
      L4_72 = L4_72(L5_73, L6_74)
      L5_73 = A1_69
      L7_75 = A0_68
      L6_74 = A0_68.setNumberInput
      L6_74(L7_75, A2_70, A1_69)
      L6_74 = _math
      L6_74 = L6_74.floor
      L7_75 = L5_73 / L4_72
      L6_74 = L6_74(L7_75)
      L7_75 = A0_68.setNumberInput
      L7_75(A0_68, "CustomControl_NumberInput_Gil", L6_74)
      L7_75 = A0_68.getControlProperty
      L7_75 = L7_75(A0_68, "ComboBox_Select", "IntData.Value2")
      if L7_75 == 1 then
        L5_73 = L4_72 * L6_74
      end
      A0_68:setNumberInput("CustomControl_NumberInput_TotalGil", L5_73)
    end
  end
  L5_73 = A0_68
  L4_72 = A0_68.displayPrice
  L4_72(L5_73)
end
function BazaarEditWidget.getTax(A0_76)
  return A0_76.work.tax
end
function BazaarEditWidget.closeWidgetForCancel(A0_77)
  if A0_77:_getParentWidget() == nil then
    return nil
  end
  A0_77.work.chosenOperation = 1
  A0_77:_getParentWidget():setBazaarEditData(A0_77.work.chosenOperation)
  return A0_77:_getParentWidget():closeBazaarEdit()
end
function BazaarEditWidget.updateMoney(A0_78, A1_79)
  local L2_80, L3_81, L4_82, L5_83
  L2_80 = A0_78.work
  L2_80 = L2_80.mode
  if L2_80 == 6 then
    L2_80 = A0_78.work
    L2_80 = L2_80.price
    L3_81 = A0_78.work
    L3_81 = L3_81.bakstack
    L4_82 = A1_79 / L2_80
    if L3_81 > L4_82 then
      L3_81 = A1_79 / L2_80
    end
    L5_83 = A0_78
    L4_82 = A0_78.getValue
    L4_82 = L4_82(L5_83, "CustomControl_NumberInput_ItemSource")
    if L3_81 < L4_82 then
      L4_82 = L3_81
    end
    L5_83 = A0_78.getKeyboardFocusedControl
    L5_83 = L5_83(A0_78)
    if L5_83 == "CustomControl_NumberInput_ItemSource" then
      L5_83 = A0_78.setNumberInput
      L5_83(A0_78, "CustomControl_NumberInput_ItemSource", L4_82, 1, L3_81)
    else
    end
    L5_83 = A0_78.work
    L5_83 = L5_83.price
    L5_83 = L4_82 * L5_83
    A0_78:setNumberInput("CustomControl_NumberInput_TotalGil", L5_83)
    A0_78:setText("TextBlock_NumberInput_TotalGil", 3201, L5_83)
  else
    L2_80 = A0_78.work
    L2_80 = L2_80.mode
    if L2_80 ~= 2 then
      L2_80 = A0_78.work
      L2_80 = L2_80.mode
    elseif L2_80 == 3 then
      L2_80 = A0_78.work
      L2_80 = L2_80.rewardIsItem
      if L2_80 == false then
        L2_80 = A0_78.work
        L2_80.num3max = A1_79
        L2_80 = A0_78.work
        L2_80 = L2_80.num3
        L3_81 = A0_78.work
        L3_81 = L3_81.num3max
        if L2_80 > L3_81 then
          L2_80 = A0_78.work
          L3_81 = A0_78.work
          L3_81 = L3_81.num3max
          L2_80.num3 = L3_81
        end
        L3_81 = A0_78
        L2_80 = A0_78.getKeyboardFocusedControl
        L2_80 = L2_80(L3_81)
        if L2_80 == "CustomControl_NumberInput_TotalGil" then
          L3_81 = A0_78
          L2_80 = A0_78.setNumberInput
          L4_82 = "CustomControl_NumberInput_TotalGil"
          L5_83 = A0_78.work
          L5_83 = L5_83.num3
          L2_80(L3_81, L4_82, L5_83, 0, A0_78.work.num3max)
        end
      end
    end
  end
end
function BazaarEditWidget.getItemContent(A0_84, A1_85, A2_86, A3_87)
  if A0_84:_getParentWidget() ~= nil then
    return A0_84:_getParentWidget():getItemContent(A1_85, A2_86, A3_87)
  end
  return false
end
function BazaarEditWidget.getItemContentFromWidget(A0_88, A1_89, A2_90, A3_91)
  if A3_91 ~= nil then
    return A3_91:getItemContent(-1, A1_89, A2_90)
  end
  return false
end
function BazaarEditWidget.setReward(A0_92, A1_93, A2_94)
  local L3_95, L4_96, L5_97, L6_98, L7_99, L8_100, L9_101, L10_102, L11_103, L12_104, L13_105, L14_106, L15_107
  if A1_93 ~= nil then
    L3_95 = A0_92.work
    L3_95.rewardItemPackageSelectReturn = A1_93
    L3_95 = A0_92.work
    L3_95.rewardItemSelectReturn = A2_94
    L4_96 = A0_92
    L3_95 = A0_92.setContent
    L5_97 = "Button_Extra"
    L6_98 = 3123
    L3_95(L4_96, L5_97, L6_98)
    L4_96 = A0_92
    L3_95 = A0_92.setHelpParameter
    L5_97 = "Button_Extra"
    L6_98 = 1
    L7_99 = 75360
    L3_95(L4_96, L5_97, L6_98, L7_99)
    L4_96 = A0_92
    L3_95 = A0_92.setText
    L5_97 = "TextBlock_RewardTitle"
    L6_98 = 3124
    L3_95(L4_96, L5_97, L6_98)
    L4_96 = A0_92
    L3_95 = A0_92.setHelpParameter
    L5_97 = "Grid_RewardTitle"
    L6_98 = 1
    L7_99 = 75354
    L3_95(L4_96, L5_97, L6_98, L7_99)
    L4_96 = A0_92
    L3_95 = A0_92.setVisibility
    L5_97 = "Grid_RewardItemName"
    L6_98 = true
    L3_95(L4_96, L5_97, L6_98)
    L4_96 = A0_92
    L3_95 = A0_92.setVisibility
    L5_97 = "Grid_NumberInput_TotalGil"
    L6_98 = false
    L3_95(L4_96, L5_97, L6_98)
    L3_95 = A0_92.work
    L3_95.rewardIsItem = true
    L3_95, L4_96, L5_97, L6_98, L7_99 = nil, nil, nil, nil, nil
    L8_100 = worldMaster
    L9_101 = L8_100
    L8_100 = L8_100._getMyPlayer
    L8_100 = L8_100(L9_101)
    L9_101 = A0_92.work
    L9_101 = L9_101.isRetainer
    if L9_101 == true then
      L9_101 = desktopWidget
      L10_102 = L9_101
      L9_101 = L9_101.getRetainerItem
      L11_103 = A1_93
      L12_104 = A2_94
      L9_101 = L9_101(L10_102, L11_103, L12_104)
      L7_99 = L9_101
      if L7_99 == nil then
        L9_101 = false
        return L9_101
      end
      L10_102 = L7_99
      L9_101 = L7_99._getCatalogID
      L9_101 = L9_101(L10_102)
      L3_95 = L9_101
      L10_102 = L7_99
      L9_101 = L7_99.getItemIcon
      L9_101 = L9_101(L10_102)
      L4_96 = L9_101
      L10_102 = L7_99
      L9_101 = L7_99._isStackable
      L9_101 = L9_101(L10_102)
      L5_97 = L9_101
      L10_102 = L7_99
      L9_101 = L7_99._countStack
      L9_101 = L9_101(L10_102)
      L6_98 = L9_101
    else
      L9_101 = desktopWidget
      L10_102 = L9_101
      L9_101 = L9_101.getPlayerItemInPackage
      L11_103 = A1_93
      L12_104 = A2_94
      L12_104 = L9_101(L10_102, L11_103, L12_104)
      L6_98 = L12_104
      L5_97 = L11_103
      L4_96 = L10_102
      L3_95 = L9_101
      L10_102 = L8_100
      L9_101 = L8_100._getItem
      L11_103 = A1_93
      L12_104 = A2_94
      L9_101 = L9_101(L10_102, L11_103, L12_104)
      L7_99 = L9_101
    end
    if L5_97 == true then
      L10_102 = A0_92
      L9_101 = A0_92.setVisibility
      L11_103 = "Grid_ItemStack"
      L12_104 = true
      L9_101(L10_102, L11_103, L12_104)
      L10_102 = A0_92
      L9_101 = A0_92.setVisibility
      L11_103 = "Label_NumberInput_1"
      L12_104 = true
      L9_101(L10_102, L11_103, L12_104)
      L9_101 = L6_98
      L11_103 = A0_92
      L10_102 = A0_92.isItemCrystal
      L12_104 = L7_99
      L10_102 = L10_102(L11_103, L12_104)
      if L10_102 == true and L9_101 > 999 then
        L9_101 = 999
      end
      L11_103 = A0_92
      L10_102 = A0_92.setNumberInput
      L12_104 = "CustomControl_NumberInput"
      L13_105 = 1
      L14_106 = 1
      L15_107 = L9_101
      L10_102(L11_103, L12_104, L13_105, L14_106, L15_107)
      L11_103 = A0_92
      L10_102 = A0_92.setText
      L12_104 = "TextBlock_ItemStackMax"
      L13_105 = 225
      L14_106 = L6_98
      L10_102(L11_103, L12_104, L13_105, L14_106)
      L11_103 = A0_92
      L10_102 = A0_92.setVisibility
      L12_104 = "TextBlock_ItemStack"
      L13_105 = false
      L10_102(L11_103, L12_104, L13_105)
      L11_103 = A0_92
      L10_102 = A0_92.setVisibility
      L12_104 = "TextBlock_ItemStackSlash"
      L13_105 = true
      L10_102(L11_103, L12_104, L13_105)
      L11_103 = A0_92
      L10_102 = A0_92.setVisibility
      L12_104 = "TextBlock_ItemStackMax"
      L13_105 = true
      L10_102(L11_103, L12_104, L13_105)
    else
      L9_101 = A0_92.work
      L9_101.stack = 1
      L10_102 = A0_92
      L9_101 = A0_92.setVisibility
      L11_103 = "Grid_ItemStack"
      L12_104 = false
      L9_101(L10_102, L11_103, L12_104)
      L10_102 = A0_92
      L9_101 = A0_92.setNumberInput
      L11_103 = "CustomControl_NumberInput"
      L12_104 = 1
      L13_105 = 1
      L14_106 = 1
      L9_101(L10_102, L11_103, L12_104, L13_105, L14_106)
    end
    L9_101 = false
    L11_103 = L7_99
    L10_102 = L7_99.isEquipment
    L10_102 = L10_102(L11_103)
    if L10_102 then
      L11_103 = L7_99
      L10_102 = L7_99.getNormalItemFitness
      L10_102 = L10_102(L11_103)
      if L10_102 == 10000 then
        L9_101 = true
      end
    end
    L10_102 = false
    L12_104 = L8_100
    L11_103 = L8_100.hasItem
    L13_105 = 101
    L14_106 = 2001001
    L11_103 = L11_103(L12_104, L13_105, L14_106)
    if not L11_103 then
      L12_104 = L8_100
      L11_103 = L8_100.hasItem
      L13_105 = 101
      L14_106 = 2001002
      L11_103 = L11_103(L12_104, L13_105, L14_106)
      if not L11_103 then
        L12_104 = L8_100
        L11_103 = L8_100.hasItem
        L13_105 = 101
        L14_106 = 2001003
        L11_103 = L11_103(L12_104, L13_105, L14_106)
      end
    elseif L11_103 then
      L10_102 = true
    end
    L12_104 = L7_99
    L11_103 = L7_99.getMaterializePermission
    L11_103 = L11_103(L12_104)
    L13_105 = A0_92
    L12_104 = A0_92.setVisibility
    L14_106 = "IconControl_PolishMAX_2"
    L15_107 = L9_101 and L10_102 and L11_103
    L12_104(L13_105, L14_106, L15_107)
    L12_104 = desktopWidget
    L13_105 = L12_104
    L12_104 = L12_104.getItemMateriaAttachInfo
    L14_106 = L7_99
    L13_105 = L12_104(L13_105, L14_106)
    if L12_104 > 0 then
      L15_107 = A0_92
      L14_106 = A0_92.setVisibility
      L14_106(L15_107, "Grid_MateriaNumber_2", true)
      L15_107 = A0_92
      L14_106 = A0_92.setText
      L14_106(L15_107, "TextBlock_MateriaNumber_2", 225, L12_104)
      L15_107 = A0_92
      L14_106 = A0_92.setVisibility
      L14_106(L15_107, "TextBlock_MateriaNumber_2", true)
      L15_107 = A0_92
      L14_106 = A0_92.setIcon
      L14_106(L15_107, "IconControl_MateriaIcon_2", 608)
    else
      L15_107 = A0_92
      L14_106 = A0_92.setVisibility
      L14_106(L15_107, "TextBlock_MateriaNumber_2", false)
      L15_107 = A0_92
      L14_106 = A0_92.setVisibility
      L14_106(L15_107, "Grid_MateriaNumber_2", L13_105)
      if L13_105 then
        L15_107 = A0_92
        L14_106 = A0_92.setIcon
        L14_106(L15_107, "IconControl_MateriaIcon_2", 609)
      end
    end
    L15_107 = L7_99
    L14_106 = L7_99.isEquipment
    L14_106 = L14_106(L15_107)
    if L14_106 then
      L15_107 = A0_92
      L14_106 = A0_92.setVisibility
      L14_106(L15_107, "IconControl_NotEquiped_2", desktopWidget:cantEquipPlayer(L7_99))
    else
      L15_107 = A0_92
      L14_106 = A0_92.setVisibility
      L14_106(L15_107, "IconControl_NotEquiped_2", false)
    end
    L15_107 = A0_92
    L14_106 = A0_92.displayPrice
    L14_106(L15_107)
    L15_107 = L7_99
    L14_106 = L7_99._getNameIndex
    L14_106 = L14_106(L15_107)
    L15_107 = A0_92.setIcon
    L15_107(A0_92, "IconControl_ItemIcon", L4_96)
    L15_107 = A0_92.setVisibility
    L15_107(A0_92, "IconControl_ItemIcon", true)
    if L3_95 == 1000001 then
      L15_107 = A0_92.setText
      L15_107(A0_92, "TextBlock_ItemName", 3263, L6_98)
    elseif L3_95 >= 1000101 and L3_95 <= 1000124 then
      L15_107 = L3_95 - 1000101
      L15_107 = 3421 + L15_107
      A0_92:setText("TextBlock_ItemName", L15_107, L6_98)
    else
      L15_107 = A0_92.setText
      L15_107(A0_92, "TextBlock_ItemName", 3202, L3_95, L14_106)
    end
  end
  L3_95 = A0_92.work
  L3_95.rewardWidgetOpen = false
  L3_95 = true
  return L3_95
end
function BazaarEditWidget.isItemCrystal(A0_108, A1_109)
  if A1_109 ~= nil then
    if A1_109:_isAlive() == true then
      if A1_109:_getCatalogID() > 1000002 and A1_109:_getCatalogID() < 1000101 then
        return true
      end
    else
      A0_108.work.error = true
    end
  else
    A0_108.work.error = true
  end
  return false
end
function BazaarEditWidget.checkCertainItem(A0_110)
  local L1_111, L2_112, L3_113
  L2_112 = A0_110.work
  L2_112 = L2_112.mode
  if L2_112 == 6 then
    L3_113 = A0_110
    L2_112 = A0_110._getParentWidget
    L2_112 = L2_112(L3_113)
    L3_113 = 0
    if L2_112 ~= nil then
      L3_113 = L2_112:getCurrentIndex()
    end
    if L3_113 ~= 0 then
      A0_110.work.chosenItem = L3_113
    end
  end
  L2_112 = A0_110.work
  L2_112 = L2_112.chosenOwner
  if L2_112 == 1 then
    L2_112 = worldMaster
    L3_113 = L2_112
    L2_112 = L2_112._getMyPlayer
    L2_112 = L2_112(L3_113)
    L3_113 = L2_112._getItem
    L3_113 = L3_113(L2_112, A0_110.work.chosenPackage, A0_110.work.chosenItem)
    L1_111 = L3_113
  else
    L2_112 = A0_110.work
    L2_112 = L2_112.chosenOwner
    if L2_112 == 2 then
      L2_112 = desktopWidget
      L3_113 = L2_112
      L2_112 = L2_112.getBazaarItem
      L2_112 = L2_112(L3_113, A0_110.work.chosenPackage, A0_110.work.chosenItem)
      L1_111 = L2_112
    else
      L2_112 = A0_110.work
      L2_112 = L2_112.chosenOwner
      if L2_112 == 4 then
        L2_112 = desktopWidget
        L3_113 = L2_112
        L2_112 = L2_112.getRetainerItem
        L2_112 = L2_112(L3_113, A0_110.work.chosenPackage, A0_110.work.chosenItem)
        L1_111 = L2_112
      end
    end
  end
  if L1_111 == nil then
    L2_112 = false
    return L2_112
  end
  L2_112 = A0_110.work
  L2_112 = L2_112.bakcatalog
  L3_113 = L1_111._getCatalogID
  L3_113 = L3_113(L1_111)
  if L2_112 ~= L3_113 then
    L2_112 = false
    return L2_112
  end
  L2_112 = A0_110.work
  L2_112 = L2_112.bakquality
  L3_113 = L1_111._getNameIndex
  L3_113 = L3_113(L1_111)
  if L2_112 ~= L3_113 then
    L2_112 = false
    return L2_112
  end
  L2_112 = A0_110.work
  L2_112 = L2_112.bakstack
  L3_113 = L1_111._countStack
  L3_113 = L3_113(L1_111)
  if L2_112 ~= L3_113 then
    L2_112 = false
    return L2_112
  end
  L2_112 = A0_110.work
  L2_112 = L2_112.bakrare
  L3_113 = L1_111.isRareItem
  L3_113 = L3_113(L1_111)
  if L2_112 ~= L3_113 then
    L2_112 = false
    return L2_112
  end
  L2_112 = A0_110.work
  L2_112 = L2_112.bakex
  L3_113 = L1_111.isExclusiveItem
  L3_113 = L3_113(L1_111)
  if L2_112 ~= L3_113 then
    L2_112 = false
    return L2_112
  end
  L2_112 = true
  return L2_112
end
function BazaarEditWidget.setParentSortType(A0_114, A1_115)
  A0_114:_getParentWidget():setSortTypeWork(A1_115)
end
