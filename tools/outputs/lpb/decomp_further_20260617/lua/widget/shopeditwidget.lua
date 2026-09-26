require("/Widget/WidgetBaseClass")
_defineClass("ShopEditWidget", "WidgetBaseClass")
function ShopEditWidget.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9)
  A0_0.work._temp = {
    {"mode", "integer8"},
    {
      "chosenPackage",
      "integer32"
    },
    {"chosenItem", "integer32"},
    {
      "chosenOperation",
      "integer8"
    },
    {"unit", "integer8"},
    {"stack", "integer16"},
    {"stackMax", "integer16"},
    {"cost", "integer32"},
    {"price", "integer32"},
    {"num1", "integer32"},
    {"num1max", "integer32"}
  }
  A0_0.work.chosenOperation = 0
  A0_0:setCancelCondition()
  A0_0:setConfirmCondition("Button_Done")
  A0_0:setConfirmCondition("Button_Back")
  A0_0:setCancelCondition("Button_Done")
  A0_0:setCancelCondition("Button_Back")
  A0_0:setContent("Button_Back", 3220)
  A0_0:setControlCommandCondition("CustomControl_NumberInput", "NumberInputBox.ValueChanged")
  A0_0:setInitialData(A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9)
end
function ShopEditWidget.setInitialData(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17, A8_18, A9_19)
  local L10_20, L11_21, L12_22, L13_23, L14_24, L15_25
  L10_20 = A0_10.work
  L10_20.mode = A1_11
  L11_21 = A0_10
  L10_20 = A0_10.setModal
  L12_22 = true
  L10_20(L11_21, L12_22)
  L11_21 = A0_10
  L10_20 = A0_10.setText
  L12_22 = "TextBlock_ItemName"
  L14_24 = A6_16
  L13_23 = A6_16.getItemContent
  L15_25 = nil
  L15_25 = L13_23(L14_24, L15_25, "TextBlock_ItemName", "Text")
  L10_20(L11_21, L12_22, L13_23, L14_24, L15_25, L13_23(L14_24, L15_25, "TextBlock_ItemName", "Text"))
  L11_21 = A0_10
  L10_20 = A0_10.setIcon
  L12_22 = "IconControl_ItemIcon"
  L14_24 = A6_16
  L13_23 = A6_16.getItemContent
  L15_25 = nil
  L15_25 = L13_23(L14_24, L15_25, "IconControl_ItemIcon", "IconDatas")
  L10_20(L11_21, L12_22, L13_23, L14_24, L15_25, L13_23(L14_24, L15_25, "IconControl_ItemIcon", "IconDatas"))
  L10_20 = A0_10.work
  L10_20 = L10_20.mode
  if L10_20 == 11 then
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_WindowTitle"
    L13_23 = 3402
    L10_20(L11_21, L12_22, L13_23)
  else
    L10_20 = A0_10.work
    L10_20 = L10_20.mode
    if L10_20 == 13 then
      L10_20 = 8020
      if A6_16 ~= nil then
        L12_22 = A6_16
        L11_21 = A6_16.getSelectedIndex
        L13_23 = "TabControl_ItemList"
        L11_21 = L11_21(L12_22, L13_23)
        L10_20 = L10_20 + L11_21
      end
      L12_22 = A0_10
      L11_21 = A0_10.setText
      L13_23 = "TextBlock_WindowTitle"
      L14_24 = L10_20
      L11_21(L12_22, L13_23, L14_24)
      if A8_18 then
        L12_22 = A0_10
        L11_21 = A0_10.setText
        L13_23 = "TextBlock_WindowTitle"
        L14_24 = 8016
        L11_21(L12_22, L13_23, L14_24)
      end
    else
      L10_20 = A0_10.work
      L10_20 = L10_20.mode
      if L10_20 == 14 then
        L11_21 = A0_10
        L10_20 = A0_10.setText
        L12_22 = "TextBlock_WindowTitle"
        L13_23 = 8034
        L10_20(L11_21, L12_22, L13_23)
      else
        L10_20 = A0_10.work
        L10_20 = L10_20.mode
        if L10_20 == 20 then
          L11_21 = A0_10
          L10_20 = A0_10.setText
          L12_22 = "TextBlock_WindowTitle"
          L13_23 = 8034
          L10_20(L11_21, L12_22, L13_23)
        else
          L11_21 = A0_10
          L10_20 = A0_10.setText
          L12_22 = "TextBlock_WindowTitle"
          L13_23 = 3401
          L10_20(L11_21, L12_22, L13_23)
          if A8_18 then
            L11_21 = A0_10
            L10_20 = A0_10.setText
            L12_22 = "TextBlock_WindowTitle"
            L13_23 = 8015
            L10_20(L11_21, L12_22, L13_23)
          end
        end
      end
    end
  end
  if A4_14 ~= nil then
    L11_21 = A0_10
    L10_20 = A0_10.setIcon
    L12_22 = "IconControl_Gil"
    L13_23 = A4_14
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.setIcon
    L12_22 = "IconControl_TotalGil"
    L13_23 = A4_14
    L10_20(L11_21, L12_22, L13_23)
  end
  if A5_15 ~= 1000001 and (A1_11 == 12 or A1_11 == 14) then
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_CloseBlacket"
    L13_23 = 3409
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_TotalGilMark"
    L13_23 = ""
    L10_20(L11_21, L12_22, L13_23)
  end
  L10_20 = A0_10.work
  L10_20.unit = 1
  L10_20 = A0_10.work
  L10_20.price = 0
  L10_20 = A0_10.work
  L10_20.num1 = 1
  L11_21 = A0_10
  L10_20 = A0_10.setVisibility
  L12_22 = "Grid_MateriaNumber"
  L13_23 = false
  L10_20(L11_21, L12_22, L13_23)
  L11_21 = A0_10
  L10_20 = A0_10.setVisibility
  L12_22 = "IconControl_PolishMAX"
  L13_23 = false
  L10_20(L11_21, L12_22, L13_23)
  L11_21 = A0_10
  L10_20 = A0_10.setVisibility
  L12_22 = "IconControl_NotEquiped"
  L14_24 = A0_10
  L13_23 = A0_10.getItemContentFromWidget
  L15_25 = "equipx"
  L13_23 = L13_23(L14_24, L15_25, "Strings", A6_16)
  L13_23 = L13_23 == "Visible"
  L10_20(L11_21, L12_22, L13_23)
  if A1_11 == nil or A1_11 == 11 then
    L11_21 = A0_10
    L10_20 = A0_10.setContent
    L12_22 = "Button_Done"
    L13_23 = 3402
    L10_20(L11_21, L12_22, L13_23)
    if A2_12 ~= nil then
      L10_20 = A0_10.work
      L10_20.price = A2_12
    end
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_Price"
    L13_23 = 3201
    L14_24 = A0_10.work
    L14_24 = L14_24.price
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_TotalPrice"
    L13_23 = 3201
    L14_24 = A0_10.work
    L14_24 = L14_24.price
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L10_20 = A0_10.work
    L10_20.num1 = 1
    L10_20 = A0_10.work
    L12_22 = A0_10
    L11_21 = A0_10.getItemContentFromWidget
    L13_23 = "stackCount"
    L14_24 = "Int"
    L15_25 = A6_16
    L11_21 = L11_21(L12_22, L13_23, L14_24, L15_25)
    L10_20.num1max = L11_21
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_ItemStackMax"
    L13_23 = 225
    L14_24 = A0_10.work
    L14_24 = L14_24.num1max
    L10_20(L11_21, L12_22, L13_23, L14_24)
    if A7_17 > 1000002 and A7_17 < 1000101 then
      L10_20 = A0_10.work
      L10_20 = L10_20.num1max
      if L10_20 > 999 then
        L10_20 = A0_10.work
        L10_20.num1max = 999
      end
    end
    L10_20 = A0_10.work
    L11_21 = A0_10.work
    L11_21 = L11_21.num1max
    L10_20.num1 = L11_21
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_TotalPrice"
    L13_23 = 3201
    L14_24 = A0_10.work
    L14_24 = L14_24.price
    L15_25 = A0_10.work
    L15_25 = L15_25.num1
    L14_24 = L14_24 * L15_25
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L11_21 = A0_10
    L10_20 = A0_10.setNumberInput
    L12_22 = "CustomControl_NumberInput"
    L13_23 = A0_10.work
    L13_23 = L13_23.num1
    L14_24 = 1
    L15_25 = A0_10.work
    L15_25 = L15_25.num1max
    L10_20(L11_21, L12_22, L13_23, L14_24, L15_25)
    L10_20 = worldMaster
    L11_21 = L10_20
    L10_20 = L10_20._getMyPlayer
    L10_20 = L10_20(L11_21)
    L11_21 = false
    L13_23 = L10_20
    L12_22 = L10_20.hasItem
    L14_24 = 101
    L15_25 = 2001001
    L12_22 = L12_22(L13_23, L14_24, L15_25)
    if not L12_22 then
      L13_23 = L10_20
      L12_22 = L10_20.hasItem
      L14_24 = 101
      L15_25 = 2001002
      L12_22 = L12_22(L13_23, L14_24, L15_25)
      if not L12_22 then
        L13_23 = L10_20
        L12_22 = L10_20.hasItem
        L14_24 = 101
        L15_25 = 2001003
        L12_22 = L12_22(L13_23, L14_24, L15_25)
      end
    elseif L12_22 then
      L11_21 = true
    end
    L13_23 = A0_10
    L12_22 = A0_10.getItemContentFromWidget
    L14_24 = "stackable"
    L15_25 = "Int"
    L12_22 = L12_22(L13_23, L14_24, L15_25, A6_16)
    if L12_22 == 1 then
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "CustomControl_NumberInput"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "Grid_ItemStack"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "TextBlock_OpenBlacket"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "Grid_NumberInput_Gil"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "TextBlock_CloseBlacket"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "Grid_NumberInput_TotalGil"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setHelpParameter
      L14_24 = "Grid_ItemStack"
      L15_25 = 1
      L12_22(L13_23, L14_24, L15_25, 76034)
      L13_23 = A0_10
      L12_22 = A0_10.setHelpParameter
      L14_24 = "Grid_NumberInput_Gil"
      L15_25 = 1
      L12_22(L13_23, L14_24, L15_25, 76036)
    else
      L13_23 = A0_10
      L12_22 = A0_10.getItemContentFromWidget
      L14_24 = "materiapermission"
      L15_25 = "Int"
      L12_22 = L12_22(L13_23, L14_24, L15_25, A6_16)
      L14_24 = A0_10
      L13_23 = A0_10.setVisibility
      L15_25 = "Grid_MateriaNumber"
      L13_23(L14_24, L15_25, L12_22)
      L14_24 = A0_10
      L13_23 = A0_10.getItemContentFromWidget
      L15_25 = "materianumber"
      L13_23 = L13_23(L14_24, L15_25, "Int", A6_16)
      if L13_23 > 0 then
        L15_25 = A0_10
        L14_24 = A0_10.setVisibility
        L14_24(L15_25, "IconControl_MateriaIcon", true)
        L15_25 = A0_10
        L14_24 = A0_10.setText
        L14_24(L15_25, "TextBlock_MateriaNumber", 225, L13_23)
        L15_25 = A0_10
        L14_24 = A0_10.setIcon
        L14_24(L15_25, "IconControl_MateriaIcon", 608)
      else
        L15_25 = A0_10
        L14_24 = A0_10.setVisibility
        L14_24(L15_25, "IconControl_MateriaIcon", true)
        L15_25 = A0_10
        L14_24 = A0_10.setIcon
        L14_24(L15_25, "IconControl_MateriaIcon", 609)
      end
      L15_25 = A0_10
      L14_24 = A0_10.getItemContentFromWidget
      L14_24 = L14_24(L15_25, "polish", "Int", A6_16)
      L15_25 = A0_10.getItemContentFromWidget
      L15_25 = L15_25(A0_10, "mperm", "Int", A6_16)
      L15_25 = L15_25 == 1
      A0_10:setVisibility("IconControl_PolishMAX", L14_24 and L11_21 and L15_25)
      A0_10:setVisibility("CustomControl_NumberInput", false)
      A0_10:setVisibility("Grid_ItemStack", false)
      A0_10:setVisibility("TextBlock_OpenBlacket", false)
      A0_10:setVisibility("Grid_NumberInput_Gil", false)
      A0_10:setVisibility("TextBlock_CloseBlacket", false)
      A0_10:setVisibility("Grid_NumberInput_TotalGil", true)
    end
    L13_23 = A0_10
    L12_22 = A0_10.setHelpParameter
    L14_24 = "Grid_ItemName"
    L15_25 = 1
    L12_22(L13_23, L14_24, L15_25, 76032)
    L13_23 = A0_10
    L12_22 = A0_10.setHelpParameter
    L14_24 = "Grid_NumberInput_TotalGil"
    L15_25 = 1
    L12_22(L13_23, L14_24, L15_25, 76038)
  elseif A1_11 == 12 then
    if A2_12 ~= nil then
      L10_20 = A0_10.work
      L10_20.price = A2_12
    end
    L11_21 = A0_10
    L10_20 = A0_10.setContent
    L12_22 = "Button_Done"
    L13_23 = 3401
    L10_20(L11_21, L12_22, L13_23)
    L10_20 = A0_10.work
    L10_20.num1 = 1
    L10_20 = A0_10.work
    L12_22 = A0_10
    L11_21 = A0_10.getItemContentFromWidget
    L13_23 = "stackMax"
    L14_24 = "Int"
    L15_25 = A6_16
    L11_21 = L11_21(L12_22, L13_23, L14_24, L15_25)
    L10_20.stackMax = L11_21
    L10_20 = A0_10.work
    L11_21 = A0_10.work
    L11_21 = L11_21.stackMax
    L10_20.num1max = L11_21
    L10_20 = A0_10.work
    L12_22 = A0_10
    L11_21 = A0_10.getItemContentFromWidget
    L13_23 = "pricedata"
    L14_24 = "Int"
    L15_25 = A6_16
    L11_21 = L11_21(L12_22, L13_23, L14_24, L15_25)
    L10_20.price = L11_21
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_ItemStackMax"
    L13_23 = 225
    L14_24 = A0_10.work
    L14_24 = L14_24.num1max
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L10_20 = A0_10.work
    L10_20 = L10_20.price
    L11_21 = A0_10.work
    L11_21 = L11_21.num1max
    L10_20 = L10_20 * L11_21
    if A3_13 < L10_20 then
      L10_20 = A0_10.work
      L11_21 = _math
      L11_21 = L11_21.floor
      L12_22 = A0_10.work
      L12_22 = L12_22.price
      L12_22 = A3_13 / L12_22
      L11_21 = L11_21(L12_22)
      L10_20.num1max = L11_21
    end
    if A7_17 > 1000002 and A7_17 < 1000101 then
      L10_20 = A0_10.work
      L10_20 = L10_20.num1max
      if L10_20 > 999 then
        L10_20 = A0_10.work
        L10_20.num1max = 999
      end
    end
    L11_21 = A0_10
    L10_20 = A0_10.setNumberInput
    L12_22 = "CustomControl_NumberInput"
    L13_23 = A0_10.work
    L13_23 = L13_23.num1
    L14_24 = A0_10.work
    L14_24 = L14_24.num1
    L15_25 = A0_10.work
    L15_25 = L15_25.num1max
    L10_20(L11_21, L12_22, L13_23, L14_24, L15_25)
    L11_21 = A0_10
    L10_20 = A0_10.getItemContentFromWidget
    L12_22 = "price"
    L13_23 = "String"
    L14_24 = A6_16
    L10_20 = L10_20(L11_21, L12_22, L13_23, L14_24)
    if L10_20 ~= false then
      L11_21 = A0_10
      L10_20 = A0_10.setText
      L12_22 = "TextBlock_Price"
      L14_24 = A0_10
      L13_23 = A0_10.getItemContentFromWidget
      L15_25 = "price"
      L15_25 = L13_23(L14_24, L15_25, "String", A6_16)
      L10_20(L11_21, L12_22, L13_23, L14_24, L15_25, L13_23(L14_24, L15_25, "String", A6_16))
    end
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_TotalPrice"
    L13_23 = 3201
    L14_24 = A0_10.work
    L14_24 = L14_24.price
    L15_25 = A0_10.work
    L15_25 = L15_25.num1
    L14_24 = L14_24 * L15_25
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L11_21 = A0_10
    L10_20 = A0_10.getItemContentFromWidget
    L12_22 = "stackable"
    L13_23 = "Int"
    L14_24 = A6_16
    L10_20 = L10_20(L11_21, L12_22, L13_23, L14_24)
    if L10_20 == 1 then
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "CustomControl_NumberInput"
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_ItemStack"
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "TextBlock_OpenBlacket"
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_NumberInput_Gil"
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "TextBlock_CloseBlacket"
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setHelpParameter
      L12_22 = "Grid_ItemStack"
      L13_23 = 1
      L14_24 = 76033
      L10_20(L11_21, L12_22, L13_23, L14_24)
      L11_21 = A0_10
      L10_20 = A0_10.setHelpParameter
      L12_22 = "Grid_NumberInput_Gil"
      L13_23 = 1
      L14_24 = 76035
      L10_20(L11_21, L12_22, L13_23, L14_24)
    else
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "CustomControl_NumberInput"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_ItemStack"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "TextBlock_OpenBlacket"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_NumberInput_Gil"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "TextBlock_CloseBlacket"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
    end
    if A3_13 < A2_12 then
      L11_21 = A0_10
      L10_20 = A0_10.setEnable
      L12_22 = "Button_Done"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
    end
    L11_21 = A0_10
    L10_20 = A0_10.getItemContentFromWidget
    L12_22 = "mpvisible"
    L13_23 = "Strings"
    L14_24 = A6_16
    L10_20 = L10_20(L11_21, L12_22, L13_23, L14_24)
    if L10_20 == "Visible" then
      L12_22 = A0_10
      L11_21 = A0_10.setVisibility
      L13_23 = "Grid_MateriaNumber"
      L14_24 = true
      L11_21(L12_22, L13_23, L14_24)
      L12_22 = A0_10
      L11_21 = A0_10.setIcon
      L13_23 = "IconControl_MateriaIcon"
      L14_24 = 609
      L11_21(L12_22, L13_23, L14_24)
      L12_22 = A0_10
      L11_21 = A0_10.setVisibility
      L13_23 = "TextBlock_MateriaNumber"
      L14_24 = false
      L11_21(L12_22, L13_23, L14_24)
    end
    L12_22 = A0_10
    L11_21 = A0_10.setHelpParameter
    L13_23 = "Grid_ItemName"
    L14_24 = 1
    L15_25 = 76031
    L11_21(L12_22, L13_23, L14_24, L15_25)
    L12_22 = A0_10
    L11_21 = A0_10.setHelpParameter
    L13_23 = "Grid_NumberInput_TotalGil"
    L14_24 = 1
    L15_25 = 76037
    L11_21(L12_22, L13_23, L14_24, L15_25)
  elseif A1_11 == 13 then
    L10_20 = A0_10.work
    L12_22 = A0_10
    L11_21 = A0_10.getItemContentFromWidget
    L13_23 = "stackMax"
    L14_24 = "Int"
    L15_25 = A6_16
    L11_21 = L11_21(L12_22, L13_23, L14_24, L15_25)
    L10_20.stackMax = L11_21
    L10_20 = A0_10.work
    L12_22 = A0_10
    L11_21 = A0_10.getItemContentFromWidget
    L13_23 = "pricedata"
    L14_24 = "Int"
    L15_25 = A6_16
    L11_21 = L11_21(L12_22, L13_23, L14_24, L15_25)
    L10_20.price = L11_21
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_ItemStackMax"
    L13_23 = 225
    L14_24 = A0_10.work
    L14_24 = L14_24.stackMax
    L10_20(L11_21, L12_22, L13_23, L14_24)
    if A2_12 ~= false then
      L11_21 = A0_10
      L10_20 = A0_10.setText
      L12_22 = "TextBlock_TotalPrice"
      L13_23 = 3042
      L14_24 = A2_12
      L10_20(L11_21, L12_22, L13_23, L14_24)
    end
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_TotalGilMark"
    L13_23 = ""
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.setVisibility
    L12_22 = "TextBlock_OpenBlacket"
    L13_23 = false
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.setVisibility
    L12_22 = "Grid_NumberInput_Gil"
    L13_23 = false
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.setVisibility
    L12_22 = "TextBlock_CloseBlacket"
    L13_23 = false
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.getItemContentFromWidget
    L12_22 = "stackable"
    L13_23 = "Int"
    L14_24 = A6_16
    L10_20 = L10_20(L11_21, L12_22, L13_23, L14_24)
    if L10_20 == 1 then
      L10_20 = A0_10.work
      L12_22 = A0_10
      L11_21 = A0_10.getItemContentFromWidget
      L13_23 = "stackCount"
      L14_24 = "Int"
      L15_25 = A6_16
      L11_21 = L11_21(L12_22, L13_23, L14_24, L15_25)
      L10_20.num1 = L11_21
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_ItemStack"
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Label_NumberInput_1"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "TextBlock_NumberInput_1"
      L13_23 = true
      L10_20(L11_21, L12_22, L13_23)
      L11_21 = A0_10
      L10_20 = A0_10.setText
      L12_22 = "TextBlock_NumberInput_1"
      L13_23 = tostring
      L14_24 = A0_10.work
      L14_24 = L14_24.num1
      L15_25 = L13_23(L14_24)
      L10_20(L11_21, L12_22, L13_23, L14_24, L15_25, L13_23(L14_24))
      L11_21 = A0_10
      L10_20 = A0_10.setHelpParameter
      L12_22 = "Grid_ItemStack"
      L13_23 = 1
      L14_24 = 76033
      L10_20(L11_21, L12_22, L13_23, L14_24)
    else
      L11_21 = A0_10
      L10_20 = A0_10.setVisibility
      L12_22 = "Grid_ItemStack"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
    end
    L11_21 = A0_10
    L10_20 = A0_10.setContent
    L12_22 = "Button_Done"
    L13_23 = 8013
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.setContent
    L12_22 = "Button_Back"
    L13_23 = 8014
    L10_20(L11_21, L12_22, L13_23)
    L10_20 = A0_10.work
    L10_20 = L10_20.price
    if A3_13 < L10_20 then
      L11_21 = A0_10
      L10_20 = A0_10.setEnable
      L12_22 = "Button_Done"
      L13_23 = false
      L10_20(L11_21, L12_22, L13_23)
    end
    L11_21 = A0_10
    L10_20 = A0_10.getItemContentFromWidget
    L12_22 = "mpvisible"
    L13_23 = "Strings"
    L14_24 = A6_16
    L10_20 = L10_20(L11_21, L12_22, L13_23, L14_24)
    if L10_20 == "Visible" then
      L12_22 = A0_10
      L11_21 = A0_10.setVisibility
      L13_23 = "Grid_MateriaNumber"
      L14_24 = true
      L11_21(L12_22, L13_23, L14_24)
      L12_22 = A0_10
      L11_21 = A0_10.setIcon
      L13_23 = "IconControl_MateriaIcon"
      L14_24 = 609
      L11_21(L12_22, L13_23, L14_24)
      L12_22 = A0_10
      L11_21 = A0_10.setVisibility
      L13_23 = "TextBlock_MateriaNumber"
      L14_24 = false
      L11_21(L12_22, L13_23, L14_24)
    end
    L12_22 = A0_10
    L11_21 = A0_10.setHelpParameter
    L13_23 = "Grid_ItemName"
    L14_24 = 1
    L15_25 = 76031
    L11_21(L12_22, L13_23, L14_24, L15_25)
    L12_22 = A0_10
    L11_21 = A0_10.setHelpParameter
    L13_23 = "Grid_NumberInput_TotalGil"
    L14_24 = 1
    L15_25 = 76037
    L11_21(L12_22, L13_23, L14_24, L15_25)
  elseif A1_11 == 14 or A1_11 == 20 then
    L11_21 = A0_10
    L10_20 = A0_10.setContent
    L12_22 = "Button_Done"
    L13_23 = 8035
    L10_20(L11_21, L12_22, L13_23)
    L11_21 = A0_10
    L10_20 = A0_10.setContent
    L12_22 = "Button_Back"
    L13_23 = 8036
    L10_20(L11_21, L12_22, L13_23)
    if A2_12 ~= nil then
      L10_20 = A0_10.work
      L10_20.price = A2_12
    end
    if A1_11 == 20 and A9_19 ~= nil then
      L10_20 = A0_10.work
      L10_20.unit = A9_19
    end
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_Price"
    L13_23 = 3201
    L14_24 = A0_10.work
    L14_24 = L14_24.price
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_TotalPrice"
    L13_23 = 3201
    L14_24 = A0_10.work
    L14_24 = L14_24.price
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L10_20 = A0_10.work
    L10_20.num1 = 1
    L10_20 = A0_10.work
    L12_22 = A0_10
    L11_21 = A0_10.getItemContentFromWidget
    L13_23 = "stackCount"
    L14_24 = "Int"
    L15_25 = A6_16
    L11_21 = L11_21(L12_22, L13_23, L14_24, L15_25)
    L10_20.num1max = L11_21
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_ItemStackMax"
    L13_23 = 225
    L14_24 = A0_10.work
    L14_24 = L14_24.num1max
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L10_20 = A0_10.work
    L11_21 = A0_10.work
    L11_21 = L11_21.num1max
    L10_20.num1 = L11_21
    L11_21 = A0_10
    L10_20 = A0_10.setText
    L12_22 = "TextBlock_TotalPrice"
    L13_23 = 3201
    L14_24 = A0_10.work
    L14_24 = L14_24.price
    L15_25 = A0_10.work
    L15_25 = L15_25.num1
    L14_24 = L14_24 * L15_25
    L10_20(L11_21, L12_22, L13_23, L14_24)
    L11_21 = A0_10
    L10_20 = A0_10.setNumberInput
    L12_22 = "CustomControl_NumberInput"
    L13_23 = A0_10.work
    L13_23 = L13_23.num1
    L14_24 = 1
    L15_25 = A0_10.work
    L15_25 = L15_25.num1max
    L10_20(L11_21, L12_22, L13_23, L14_24, L15_25)
    L10_20 = worldMaster
    L11_21 = L10_20
    L10_20 = L10_20._getMyPlayer
    L10_20 = L10_20(L11_21)
    L11_21 = false
    L13_23 = L10_20
    L12_22 = L10_20.hasItem
    L14_24 = 101
    L15_25 = 2001001
    L12_22 = L12_22(L13_23, L14_24, L15_25)
    if not L12_22 then
      L13_23 = L10_20
      L12_22 = L10_20.hasItem
      L14_24 = 101
      L15_25 = 2001002
      L12_22 = L12_22(L13_23, L14_24, L15_25)
      if not L12_22 then
        L13_23 = L10_20
        L12_22 = L10_20.hasItem
        L14_24 = 101
        L15_25 = 2001003
        L12_22 = L12_22(L13_23, L14_24, L15_25)
      end
    elseif L12_22 then
      L11_21 = true
    end
    L13_23 = A0_10
    L12_22 = A0_10.getItemContentFromWidget
    L14_24 = "stackable"
    L15_25 = "Int"
    L12_22 = L12_22(L13_23, L14_24, L15_25, A6_16)
    if L12_22 == 1 then
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "CustomControl_NumberInput"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "Grid_ItemStack"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "TextBlock_OpenBlacket"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "Grid_NumberInput_Gil"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "TextBlock_CloseBlacket"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "Grid_NumberInput_TotalGil"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setHelpParameter
      L14_24 = "Grid_ItemStack"
      L15_25 = 1
      L12_22(L13_23, L14_24, L15_25, 76043)
      L13_23 = A0_10
      L12_22 = A0_10.setHelpParameter
      L14_24 = "Grid_NumberInput_Gil"
      L15_25 = 1
      L12_22(L13_23, L14_24, L15_25, 76044)
    else
      L13_23 = A0_10
      L12_22 = A0_10.getItemContentFromWidget
      L14_24 = "materiapermission"
      L15_25 = "Int"
      L12_22 = L12_22(L13_23, L14_24, L15_25, A6_16)
      L14_24 = A0_10
      L13_23 = A0_10.setVisibility
      L15_25 = "Grid_MateriaNumber"
      L13_23(L14_24, L15_25, L12_22)
      L14_24 = A0_10
      L13_23 = A0_10.getItemContentFromWidget
      L15_25 = "materianumber"
      L13_23 = L13_23(L14_24, L15_25, "Int", A6_16)
      if L13_23 > 0 then
        L15_25 = A0_10
        L14_24 = A0_10.setVisibility
        L14_24(L15_25, "IconControl_MateriaIcon", true)
        L15_25 = A0_10
        L14_24 = A0_10.setText
        L14_24(L15_25, "TextBlock_MateriaNumber", 225, L13_23)
        L15_25 = A0_10
        L14_24 = A0_10.setIcon
        L14_24(L15_25, "IconControl_MateriaIcon", 608)
      else
        L15_25 = A0_10
        L14_24 = A0_10.setVisibility
        L14_24(L15_25, "IconControl_MateriaIcon", true)
        L15_25 = A0_10
        L14_24 = A0_10.setIcon
        L14_24(L15_25, "IconControl_MateriaIcon", 609)
      end
      L15_25 = A0_10
      L14_24 = A0_10.getItemContentFromWidget
      L14_24 = L14_24(L15_25, "polish", "Int", A6_16)
      L15_25 = A0_10.getItemContentFromWidget
      L15_25 = L15_25(A0_10, "mperm", "Int", A6_16)
      L15_25 = L15_25 == 1
      A0_10:setVisibility("IconControl_PolishMAX", L14_24 and L11_21 and L15_25)
      A0_10:setVisibility("CustomControl_NumberInput", false)
      A0_10:setVisibility("Grid_ItemStack", false)
      A0_10:setVisibility("TextBlock_OpenBlacket", false)
      A0_10:setVisibility("Grid_NumberInput_Gil", false)
      A0_10:setVisibility("TextBlock_CloseBlacket", false)
      A0_10:setVisibility("Grid_NumberInput_TotalGil", true)
    end
    L13_23 = A0_10
    L12_22 = A0_10.setHelpParameter
    L14_24 = "Grid_NumberInput_TotalGil"
    L15_25 = 1
    L12_22(L13_23, L14_24, L15_25, 76045)
    if A1_11 == 20 then
      L13_23 = A0_10
      L12_22 = A0_10.setHelpParameter
      L14_24 = "Grid_NumberInput_TotalGil"
      L15_25 = 0
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "TextBlock_OpenBlacket"
      L15_25 = false
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "Grid_NumberInput_Gil"
      L15_25 = false
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "TextBlock_CloseBlacket"
      L15_25 = true
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setVisibility
      L14_24 = "IconControl_TotalGil"
      L15_25 = false
      L12_22(L13_23, L14_24, L15_25)
      L12_22 = A0_10.work
      L12_22 = L12_22.unit
      if L12_22 > 1 then
        L13_23 = A0_10
        L12_22 = A0_10.setText
        L14_24 = "TextBlock_TotalPrice"
        L15_25 = 3201
        L12_22(L13_23, L14_24, L15_25, A0_10.work.price * _math.floor(A0_10.work.num1 / A0_10.work.unit))
      end
      L13_23 = A0_10
      L12_22 = A0_10.setText
      L14_24 = "TextBlock_CloseBlacket"
      L15_25 = 8044
      L12_22(L13_23, L14_24, L15_25)
      L13_23 = A0_10
      L12_22 = A0_10.setText
      L14_24 = "TextBlock_TotalGilMark"
      L15_25 = ""
      L12_22(L13_23, L14_24, L15_25)
    end
  end
end
function ShopEditWidget.processBeforeShow(A0_26, A1_27)
  local L2_28
  if A1_27 ~= true then
    L2_28 = A0_26._getParentWidget
    L2_28 = L2_28(A0_26)
    if L2_28 ~= nil and A0_26:getItemContentFromWidget("isEquipping", "Int", L2_28) == 1 then
      L2_28:setShopEditData(2, A0_26.work.num1)
      L2_28:closeShopEdit()
    end
    return true
  end
  L2_28 = true
  return L2_28
end
function ShopEditWidget.processAfterShow(A0_29, A1_30)
  if A1_30 ~= true then
    A0_29:setWindowFocus("Button_Back")
  end
end
function ShopEditWidget.setNumberInput(A0_31, A1_32, A2_33, A3_34, A4_35)
  if A3_34 ~= nil then
    A0_31:setControlProperty(A1_32, "Minimum", A3_34)
  end
  if A4_35 ~= nil then
    A0_31:setMaximum(A1_32, A4_35)
  end
  A0_31:setValue(A1_32, A2_33)
end
function ShopEditWidget.setWindowFocus(A0_36, A1_37)
  if A1_37 ~= nil and A1_37 ~= "" then
    A0_36:setLogicalFocus(A1_37)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_36 then
      A0_36:setKeyboardFocusedControl(A1_37)
    end
  end
end
function ShopEditWidget.processUICommandCancel(A0_38, A1_39, A2_40, A3_41, A4_42)
  if A0_38:getAskWaitStatus() == false then
    return
  end
  if A0_38.work.chosenOperation ~= 0 then
    return
  end
  if A2_40 == "Button_Back" then
    A0_38.work.chosenOperation = 2
    A0_38:_getParentWidget():setShopEditData(2, A0_38.work.num1)
    A0_38:_getParentWidget():closeShopEdit()
    return true
  else
    A0_38:setWindowFocus("Button_Back")
    return
  end
end
function ShopEditWidget.processUICommandOperate(A0_43, A1_44, A2_45, A3_46, A4_47)
  if A0_43:getAskWaitStatus() == false then
    return
  end
  if A0_43.work.chosenOperation ~= 0 then
    return
  end
  if A2_45 == "Button_Done" then
    A0_43.work.chosenOperation = 1
    A0_43:_getParentWidget():setShopEditData(1, A0_43.work.num1)
    A0_43:_getParentWidget():closeShopEdit()
    return true
  end
  if A2_45 == "Button_Back" then
    A0_43.work.chosenOperation = 2
    A0_43:_getParentWidget():setShopEditData(2, A0_43.work.num1)
    A0_43:_getParentWidget():closeShopEdit()
    return true
  end
end
function ShopEditWidget.processUICommandDefault(A0_48, A1_49, A2_50, A3_51, A4_52, A5_53)
  if A0_48:getAskWaitStatus() == false then
    return
  end
  if A0_48.work.chosenOperation ~= 0 then
    return
  end
  if A3_51 == "NumberInputBox.ValueChanged" then
    A0_48:updateNumber(A4_52)
  end
end
function ShopEditWidget.updateNumber(A0_54, A1_55)
  if A0_54:getControlProperty("CustomControl_NumberInput", "IsKeyboardFocusWithin") ~= true then
    return
  end
  A0_54.work.num1 = A1_55
  if A0_54.work.unit > 1 then
    A0_54:setText("TextBlock_TotalPrice", 3201, A0_54.work.price * _math.floor(A0_54.work.num1 / A0_54.work.unit))
  else
    A0_54:setText("TextBlock_TotalPrice", 3201, A0_54.work.price * A0_54.work.num1)
  end
end
function ShopEditWidget.updateMoney(A0_56, A1_57)
  if A0_56.work.mode == 13 then
    if A1_57 > A0_56.work.price then
      A0_56:setEnable("Button_Done", true)
    else
      if A0_56:checkKeyboardFocusedControl("Button_Done") == true then
        A0_56:setWindowFocus("Button_Back")
      end
      A0_56:setEnable("Button_Done", false)
    end
  else
    A0_56.work.num1max = _math.floor(A1_57 / A0_56.work.price)
    if A0_56.work.num1max > A0_56.work.stackMax then
      A0_56.work.num1max = A0_56.work.stackMax
    end
    if A0_56.work.num1 > A0_56.work.num1max then
      A0_56.work.num1 = A0_56.work.num1max
    end
    if A0_56.work.num1 == 0 then
      A0_56.work.num1 = 1
      if A0_56:checkKeyboardFocusedControl("Button_Done") == true then
        A0_56:setWindowFocus("Button_Back")
      end
      A0_56:setEnable("Button_Done", false)
    else
      A0_56:setEnable("Button_Done", true)
    end
    A0_56:setNumberInput("CustomControl_NumberInput", A0_56.work.num1, 1, A0_56.work.num1max)
    if 1 < A0_56.work.unit then
      A0_56:setText("TextBlock_TotalPrice", 3201, A0_56.work.price * _math.floor(A0_56.work.num1 / A0_56.work.unit))
    else
      A0_56:setText("TextBlock_TotalPrice", 3201, A0_56.work.price * A0_56.work.num1)
    end
  end
end
function ShopEditWidget.getItemContent(A0_58, A1_59, A2_60, A3_61, A4_62)
  if A0_58:_getParentWidget() ~= nil then
    if A1_59 == nil then
      if A4_62 == nil then
        return A0_58:_getParentWidget():getItemContent(nil, A2_60, A3_61)
      else
        return A0_58:_getParentWidget():getItemContent(1, A3_61, A4_62)
      end
    elseif A3_61 == nil then
      A0_58:setControlProperty(A1_59, A2_60, A0_58:_getParentWidget():getItemContent(nil, A1_59, A2_60))
    else
      A0_58:setControlProperty(A1_59, A2_60, A0_58:_getParentWidget():getItemContent(1, A3_61, A4_62))
    end
    return true
  end
  return false
end
function ShopEditWidget.getItemContentFromWidget(A0_63, A1_64, A2_65, A3_66)
  if A3_66 ~= nil then
    return A3_66:getItemContent(-1, A1_64, A2_65)
  end
  return false
end
function ShopEditWidget.getAskWaitStatus(A0_67)
  if A0_67:_getParentWidget() ~= nil then
    return A0_67:_getParentWidget():getAskWaitStatus()
  end
  return false
end
