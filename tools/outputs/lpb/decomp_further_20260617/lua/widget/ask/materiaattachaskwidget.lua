require("/Widget/Ask/AskBaseClass")
_defineClass("MateriaAttachAskWidget", "AskBaseClass")
function MateriaAttachAskWidget.updateMateriaItemDetail(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5, L6_6
  L6_6 = A1_1
  L5_5 = A1_1._getItem
  L5_5 = L5_5(L6_6, A2_2, A3_3)
  L6_6 = nil
  if A4_4 ~= nil then
    L6_6 = A1_1:_getItem(A2_2, A4_4)
  end
  if L5_5 then
    desktopWidget:setItemDetail(A0_0, L5_5)
    desktopWidget:setItemDetailEquip(A0_0, L5_5)
    desktopWidget:setItemCatalyst(A0_0, L5_5, A1_1, A2_2, L6_6)
  end
end
function MateriaAttachAskWidget.updateEquipItemDetail(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12
  L5_12 = A1_8._getItem
  L5_12 = L5_12(A1_8, A2_9, A3_10)
  if L5_12 then
    desktopWidget:setItemMateriaInstall(A0_7, L5_12, A1_8)
    desktopWidget:setItemMateriaInstallSkill(A0_7, L5_12)
    desktopWidget:setItemMateriaInstallRate(A0_7, L5_12, A4_11)
  end
end
function MateriaAttachAskWidget.setMateriaAttachCost(A0_13, A1_14, A2_15, A3_16)
  local L4_17, L5_18, L6_19, L7_20
  L4_17 = A0_13.work
  L4_17 = L4_17.mode
  if L4_17 == 1 then
    L5_18 = A0_13
    L4_17 = A0_13.setVisibility
    L6_19 = "Grid_MateriaAttachCost"
    L7_20 = false
    L4_17(L5_18, L6_19, L7_20)
    return
  end
  L5_18 = A1_14
  L4_17 = A1_14._getItem
  L6_19 = A2_15
  L7_20 = A3_16
  L4_17 = L4_17(L5_18, L6_19, L7_20)
  L6_19 = L4_17
  L5_18 = L4_17.getAttachMateriaAmount
  L5_18 = L5_18(L6_19)
  L7_20 = A0_13
  L6_19 = A0_13.setText
  L6_19(L7_20, "TextBlock_RepairEquipCost", 225, L5_18)
  L6_19 = worldMaster
  L7_20 = L6_19
  L6_19 = L6_19._getMyPlayer
  L6_19 = L6_19(L7_20)
  L7_20 = L6_19.getMoneyOnHand
  L7_20 = L7_20(L6_19)
  A0_13:setText("TextBlock_CurrentMoney", 225, L7_20)
  if A0_13.work.mode == 2 then
    if L5_18 > L7_20 then
      A0_13:setStyle("TextBlock_CurrentMoney", "TBL_parameterMinus")
    else
      A0_13:setStyle("TextBlock_CurrentMoney", "TBL_parameterPlus")
    end
  else
    A0_13:setStyle("TextBlock_CurrentMoney", "TBL_null")
    A0_13:setVisibility("IconControl_CatalystNumberIcon", false)
    A0_13:setVisibility("Label_OwnedCatalystNumber", false)
  end
end
function MateriaAttachAskWidget.setInitialData(A0_21, A1_22, A2_23, A3_24, A4_25, A5_26, A6_27)
  local L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34
  L8_29 = A0_21
  L7_28 = A0_21.updateEquipItemDetail
  L9_30 = A1_22
  L10_31 = A2_23
  L11_32 = A3_24
  L12_33 = A0_21.work
  L12_33 = L12_33.rate
  L7_28(L8_29, L9_30, L10_31, L11_32, L12_33)
  L8_29 = A0_21
  L7_28 = A0_21.updateMateriaItemDetail
  L9_30 = A1_22
  L10_31 = A2_23
  L11_32 = A4_25
  L12_33 = A5_26
  L7_28(L8_29, L9_30, L10_31, L11_32, L12_33)
  L7_28 = A0_21.work
  L7_28 = L7_28.rate
  if L7_28 == 0 then
    L8_29 = A0_21
    L7_28 = A0_21.setEnable
    L9_30 = "Button_Install"
    L10_31 = false
    L7_28(L8_29, L9_30, L10_31)
  end
  L8_29 = A1_22
  L7_28 = A1_22._getItem
  L9_30 = A2_23
  L10_31 = A4_25
  L7_28 = L7_28(L8_29, L9_30, L10_31)
  L9_30 = A1_22
  L8_29 = A1_22._getItem
  L10_31 = A2_23
  L11_32 = A3_24
  L8_29 = L8_29(L9_30, L10_31, L11_32)
  if L7_28 == nil or L8_29 == nil then
    L9_30 = false
    return L9_30
  end
  if A6_27 ~= nil then
    L10_31 = A0_21
    L9_30 = A0_21.setVisibility
    L11_32 = "Button_Install"
    L12_33 = false
    L9_30(L10_31, L11_32, L12_33)
    L10_31 = A0_21
    L9_30 = A0_21.setVisibility
    L11_32 = "Grid_Help"
    L12_33 = true
    L9_30(L10_31, L11_32, L12_33)
    L10_31 = L7_28
    L9_30 = L7_28._getCatalogID
    L9_30 = L9_30(L10_31)
    L11_32 = L7_28
    L10_31 = L7_28.getNameIndex
    L10_31 = L10_31(L11_32)
    L12_33 = L8_29
    L11_32 = L8_29._getCatalogID
    L11_32 = L11_32(L12_33)
    L13_34 = L8_29
    L12_33 = L8_29.getNameIndex
    L12_33 = L12_33(L13_34)
    L13_34 = A0_21.setText
    L13_34(A0_21, "TextBlock_Help", 3547, L11_32, L12_33, L9_30, L10_31)
  end
  L10_31 = L7_28
  L9_30 = L7_28.isMateriaFitItemEquipPoint
  L11_32 = nil
  L12_33 = L8_29
  L9_30 = L9_30(L10_31, L11_32, L12_33)
  if not L9_30 then
    L11_32 = A0_21
    L10_31 = A0_21.setColor
    L12_33 = "WrapPanel_MateriaSlot"
    L13_34 = 0.5
    L10_31(L11_32, L12_33, L13_34, 0.5, 0)
    L10_31 = A0_21.work
    L10_31 = L10_31.mode
    if L10_31 == 2 then
      L11_32 = A0_21
      L10_31 = A0_21.setEnable
      L12_33 = "Button_Install"
      L13_34 = false
      L10_31(L11_32, L12_33, L13_34)
      L11_32 = A0_21
      L10_31 = A0_21.setVisibility
      L12_33 = "Grid_SuccessRate"
      L13_34 = false
      L10_31(L11_32, L12_33, L13_34)
      L11_32 = L7_28
      L10_31 = L7_28._getCatalogID
      L10_31 = L10_31(L11_32)
      L12_33 = L7_28
      L11_32 = L7_28.getNameIndex
      L11_32 = L11_32(L12_33)
      L13_34 = L8_29
      L12_33 = L8_29._getCatalogID
      L12_33 = L12_33(L13_34)
      L13_34 = L8_29.getNameIndex
      L13_34 = L13_34(L8_29)
      A0_21:setTextByOwner("TextBlock_Help", worldMaster, 40236, L12_33, L13_34, L10_31, L11_32)
      A0_21:setVisibility("Grid_Help", true)
      worldMaster:alert(worldMaster, 40236, L12_33, L13_34, L10_31, L11_32)
    end
  end
  L10_31 = A0_21.work
  L10_31 = L10_31.mode
  if L10_31 == 2 then
    L11_32 = L7_28
    L10_31 = L7_28.getItemLevel
    L10_31 = L10_31(L11_32)
    L12_33 = L8_29
    L11_32 = L8_29.getItemLevel
    L11_32 = L11_32(L12_33)
    if L10_31 > L11_32 then
      L11_32 = A0_21
      L10_31 = A0_21.setStyle
      L12_33 = "TextBlock_ItemEquipCondition"
      L13_34 = "TBL_parameterMinus"
      L10_31(L11_32, L12_33, L13_34)
      L11_32 = A0_21
      L10_31 = A0_21.setEnable
      L12_33 = "Button_Install"
      L13_34 = false
      L10_31(L11_32, L12_33, L13_34)
      L11_32 = A0_21
      L10_31 = A0_21.setVisibility
      L12_33 = "Grid_SuccessRate"
      L13_34 = false
      L10_31(L11_32, L12_33, L13_34)
      if L9_30 then
        L11_32 = L7_28
        L10_31 = L7_28._getCatalogID
        L10_31 = L10_31(L11_32)
        L12_33 = L7_28
        L11_32 = L7_28.getNameIndex
        L11_32 = L11_32(L12_33)
        L13_34 = L8_29
        L12_33 = L8_29._getCatalogID
        L12_33 = L12_33(L13_34)
        L13_34 = L8_29.getNameIndex
        L13_34 = L13_34(L8_29)
        A0_21:setTextByOwner("TextBlock_Help", worldMaster, 40236, L12_33, L13_34, L10_31, L11_32)
        A0_21:setVisibility("Grid_Help", true)
        worldMaster:alert(worldMaster, 40236, L12_33, L13_34, L10_31, L11_32)
      end
    end
  end
  L10_31 = A0_21.work
  L10_31 = L10_31.mode
  if L10_31 == 2 then
    L11_32 = A0_21
    L10_31 = A0_21.setStyle
    L12_33 = "TextBlock_ClassName"
    L13_34 = "TBL_null"
    L10_31(L11_32, L12_33, L13_34)
    L11_32 = A0_21
    L10_31 = A0_21.setStyle
    L12_33 = "TextBlock_RankText"
    L13_34 = "TBL_null"
    L10_31(L11_32, L12_33, L13_34)
  end
  L10_31 = A0_21.work
  L12_33 = L8_29
  L11_32 = L8_29.getItemRepairSkill
  L11_32 = L11_32(L12_33)
  L10_31.requireClass = L11_32
  L10_31 = A0_21.work
  L12_33 = L8_29
  L11_32 = L8_29.getItemLevel
  L11_32 = L11_32(L12_33)
  L10_31.requireLevel = L11_32
  L10_31 = A0_21.work
  L12_33 = L8_29
  L11_32 = L8_29._getCatalogID
  L11_32 = L11_32(L12_33)
  L10_31.equipItem = L11_32
  L10_31 = A0_21.work
  L12_33 = L8_29
  L11_32 = L8_29.getNameIndex
  L11_32 = L11_32(L12_33)
  L10_31.equipItemHQ = L11_32
  L10_31 = true
  return L10_31
end
function MateriaAttachAskWidget.initAsk(A0_35, A1_36, A2_37, A3_38, A4_39)
  local L5_40, L6_41, L7_42, L8_43, L9_44, L10_45
  if A3_38 == nil then
    A3_38 = 1
  end
  L6_41 = A0_35
  L5_40 = A0_35.setConfirmCondition
  L7_42 = "Button_Install"
  L5_40(L6_41, L7_42)
  L6_41 = A0_35
  L5_40 = A0_35.setConfirmCondition
  L7_42 = "Button_Back"
  L5_40(L6_41, L7_42)
  L6_41 = A0_35
  L5_40 = A0_35.setCancelCondition
  L7_42 = "Button_Back"
  L5_40(L6_41, L7_42)
  L6_41 = A0_35
  L5_40 = A0_35.setCancelCondition
  L5_40(L6_41)
  L6_41 = A0_35
  L5_40 = A0_35.setCloseCondition
  L5_40(L6_41)
  L5_40 = desktopWidget
  L6_41 = L5_40
  L5_40 = L5_40.setMateriaAttachSlotIconHelp
  L7_42 = A0_35
  L5_40(L6_41, L7_42)
  L5_40 = A0_35.work
  L6_41 = {
    L7_42,
    L8_43,
    L9_44,
    L10_45,
    {
      "requireLevel",
      "integer8"
    },
    {"equipItem", "integer32"},
    {
      "equipItemHQ",
      "integer8"
    }
  }
  L7_42 = {L8_43, L9_44}
  L8_43 = "rate"
  L9_44 = "float"
  L8_43 = {L9_44, L10_45}
  L9_44 = "mode"
  L10_45 = "integer8"
  L9_44 = {L10_45, "boolean"}
  L10_45 = "error"
  L10_45 = {
    "requireClass",
    "integer8"
  }
  L5_40._temp = L6_41
  L5_40 = A0_35.work
  L5_40.rate = A1_36
  L5_40 = A0_35.work
  L5_40.mode = A3_38
  L5_40 = A3_38
  if L5_40 == 2 then
    L7_42 = A0_35
    L6_41 = A0_35.setText
    L8_43 = "TextBlock_Title"
    L9_44 = 3150
    L6_41(L7_42, L8_43, L9_44)
    L7_42 = A0_35
    L6_41 = A0_35.setContent
    L8_43 = "Button_Install"
    L9_44 = 3154
    L6_41(L7_42, L8_43, L9_44)
    L7_42 = A0_35
    L6_41 = A0_35.setContent
    L8_43 = "Button_Back"
    L9_44 = 3155
    L6_41(L7_42, L8_43, L9_44)
  else
  end
  if L5_40 == 3 then
    L6_41 = A0_35.askWork
    L6_41.inputControlFlag = false
    break
  else
  end
  L5_40 = A3_38
  if L5_40 == 1 then
  else
  end
  if L5_40 == 2 then
    L6_41 = desktopWidget
    L7_42 = L6_41
    L6_41 = L6_41.getMainMenuModeWidget
    L8_43 = "ItemListWidget"
    L6_41 = L6_41(L7_42, L8_43)
    if L6_41 == nil then
      L8_43 = A0_35
      L7_42 = A0_35.setBaseAskResult
      L9_44 = -1
      L7_42(L8_43, L9_44)
      return
    end
    L8_43 = L6_41
    L7_42 = L6_41.getMateriaItemIndex
    L7_42 = L7_42(L8_43)
    L9_44 = L6_41
    L8_43 = L6_41.getMateriaAttachEquipItemIndex
    L8_43 = L8_43(L9_44)
    L9_44 = nil
    L10_45 = worldMaster
    L10_45 = L10_45._getMyPlayer
    L10_45 = L10_45(L10_45)
    if A0_35:setInitialData(L10_45, 1, L8_43, L7_42, L9_44, A2_37) == false then
      A0_35.work.error = true
    else
      A0_35:setMateriaAttachCost(L10_45, 1, L8_43)
      do break end
      else
      end
      if L5_40 == 3 then
        L7_42 = A0_35
        L6_41 = A0_35.setArgActor
        L8_43 = A4_39
        L6_41(L7_42, L8_43)
        L7_42 = A0_35
        L6_41 = A0_35.setText
        L8_43 = "TextBlock_MateriaAttachCost"
        L9_44 = 3153
        L6_41(L7_42, L8_43, L9_44)
        L7_42 = A0_35
        L6_41 = A0_35.setText
        L8_43 = "TextBlock_Title"
        L9_44 = 3156
        L6_41(L7_42, L8_43, L9_44)
        L7_42 = A0_35
        L6_41 = A0_35.setContent
        L8_43 = "Button_Install"
        L9_44 = 3156
        L6_41(L7_42, L8_43, L9_44)
        L7_42 = A0_35
        L6_41 = A0_35.setContent
        L8_43 = "Button_Back"
        L9_44 = 3157
        L6_41(L7_42, L8_43, L9_44)
        L7_42 = A4_39
        L6_41 = A4_39.updateItemPackage
        L8_43 = 6
        L6_41(L7_42, L8_43)
        L7_42 = A0_35
        L6_41 = A0_35.setCommonTimer
        L8_43 = 5
        L6_41(L7_42, L8_43)
        break
      else
      end
    end
end
function MateriaAttachAskWidget.closeMateriaAttachWidget(A0_46)
  local L1_47
  L1_47 = desktopWidget
  L1_47 = L1_47.getMainMenuModeWidget
  L1_47 = L1_47(L1_47, "MateriaAttachWidget")
  desktopWidget:closeWidgetDirect(L1_47)
end
function MateriaAttachAskWidget.updateItemList(A0_48, A1_49, A2_50, A3_51)
  if A0_48.work.mode ~= 3 then
    return
  end
  if A1_49 == nil then
    return
  end
  if A1_49 ~= A0_48:getArgActor() then
    return
  end
  if A2_50 ~= 6 then
    return
  end
  if A1_49:getItemPackageItemCount(A2_50) ~= 4 then
    desktopWidget:closeWidgetDirect(A0_48)
    return
  end
  A0_48:show()
  A0_48:setInitialData(A1_49, A2_50, 1, 2, 3)
  A0_48:setMateriaAttachCost(A1_49, A2_50, 1)
end
function MateriaAttachAskWidget.processTimer(A0_52)
  if A0_52:isShow() == false then
    desktopWidget:closeWidgetDirect(A0_52)
    return
  end
end
function MateriaAttachAskWidget.setWindowFocus(A0_53, A1_54)
  if A1_54 ~= nil and A1_54 ~= "" then
    A0_53:setLogicalFocus(A1_54)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_53 then
      A0_53:setKeyboardFocusedControl(A1_54)
    end
  end
end
function MateriaAttachAskWidget.processUICommandCancel(A0_55, A1_56, A2_57, A3_58, A4_59)
  if A2_57 == "Button_Back" then
    if A0_55.work.mode == 1 then
      A0_55:setBaseAskResult(-1)
      break
    elseif A0_55.work.mode == 2 then
    else
    end
    if A0_55.work.mode == 3 then
      desktopWidget:closeWidgetDirect(A0_55)
      do break end
      break
    else
    end
  else
    A0_55:setWindowFocus("Button_Back")
  end
end
function MateriaAttachAskWidget.processUICommandOperate(A0_60, A1_61, A2_62, A3_63, A4_64)
  local L5_65, L6_66, L7_67, L8_68
  L5_65 = A0_60.work
  L5_65 = L5_65.mode
  if L5_65 == 1 then
    if A2_62 == "Button_Install" then
      L6_66 = A0_60.work
      L6_66 = L6_66.rate
      if L6_66 < 100 then
        L6_66 = desktopWidget
        L7_67 = L6_66
        L6_66 = L6_66.openChildWidget
        L8_68 = "MateriaAttachCautionWidget"
        L6_66 = L6_66(L7_67, L8_68, A0_60, true, 3544, 3545, 3546)
      else
        L7_67 = A0_60
        L6_66 = A0_60.closeMateriaAttachWidget
        L6_66(L7_67)
        L7_67 = A0_60
        L6_66 = A0_60.setBaseAskResult
        L8_68 = 1
        L6_66(L7_67, L8_68)
      end
    end
    if A2_62 == "Button_Back" then
      L7_67 = A0_60
      L6_66 = A0_60.setBaseAskResult
      L8_68 = -1
      L6_66(L7_67, L8_68)
      do break end
      else
      end
      if L5_65 == 2 then
        if A2_62 == "Button_Install" then
          L6_66 = desktopWidget
          L7_67 = L6_66
          L6_66 = L6_66.getMainMenuModeWidget
          L8_68 = "ItemListWidget"
          L6_66 = L6_66(L7_67, L8_68)
          if L6_66 ~= nil then
            L8_68 = L6_66
            L7_67 = L6_66.getMateriaItemIndex
            L7_67 = L7_67(L8_68)
            L8_68 = L6_66.getMateriaAttachEquipItemIndex
            L8_68 = L8_68(L6_66)
            desktopWidget:setMateriaAttachDeal(L8_68, L7_67)
            L6_66:setOrderTime()
          end
          L8_68 = A0_60
          L7_67 = A0_60.closeMateriaAttachWidget
          L7_67(L8_68)
        end
        if A2_62 == "Button_Back" then
          L6_66 = desktopWidget
          L7_67 = L6_66
          L6_66 = L6_66.closeWidgetDirect
          L8_68 = A0_60
          L6_66(L7_67, L8_68)
          do break end
          else
          end
          if L5_65 == 3 then
            if A2_62 == "Button_Install" then
              L6_66 = worldMaster
              L7_67 = L6_66
              L6_66 = L6_66._getMyPlayer
              L6_66 = L6_66(L7_67)
              L8_68 = L6_66
              L7_67 = L6_66.hasItem
              L7_67 = L7_67(L8_68, 101, 2001002)
              if not L7_67 then
                L8_68 = L6_66
                L7_67 = L6_66.hasItem
                L7_67 = L7_67(L8_68, 101, 2001003)
                if not L7_67 then
                  L7_67 = worldMaster
                  L8_68 = L7_67
                  L7_67 = L7_67.alert
                  L7_67(L8_68, worldMaster, 40232)
                  return
                end
              end
              L7_67 = A0_60.work
              L7_67 = L7_67.requireClass
              L8_68 = L6_66.getStateMainSkill
              L8_68 = L8_68(L6_66)
              if L7_67 ~= L8_68 then
                L7_67 = worldMaster
                L8_68 = L7_67
                L7_67 = L7_67.alert
                L7_67(L8_68, worldMaster, 40234, A0_60.work.requireClass)
                return
              end
              L7_67 = A0_60.work
              L7_67 = L7_67.requireLevel
              L8_68 = L6_66.getStateMainSkillLevel
              L8_68 = L8_68(L6_66)
              if L7_67 > L8_68 then
                L7_67 = worldMaster
                L8_68 = L7_67
                L7_67 = L7_67.alert
                L7_67(L8_68, worldMaster, 40235, A0_60.work.equipItem, A0_60.work.equipItemHQ)
                return
              end
              L8_68 = A0_60
              L7_67 = A0_60.getArgActor
              L7_67 = L7_67(L8_68)
              if L7_67 then
                L8_68 = desktopWidget
                L8_68 = L8_68.executeTargetMateriaJoinCommand
                L8_68(L8_68, L7_67)
              end
              L8_68 = desktopWidget
              L8_68 = L8_68.closeWidgetDirect
              L8_68(L8_68, A0_60)
            end
            if A2_62 == "Button_Back" then
              L6_66 = desktopWidget
              L7_67 = L6_66
              L6_66 = L6_66.closeWidgetDirect
              L8_68 = A0_60
              L6_66(L7_67, L8_68)
            end
          else
          end
        else
        end
    else
    end
end
function MateriaAttachAskWidget.processUICommandClose(A0_69, A1_70, A2_71, A3_72, A4_73)
  A0_69:setBaseAskResult(-1)
end
function MateriaAttachAskWidget.getAskResult(A0_74)
  if A0_74:getBaseAskResult() == -1 then
    return nil
  end
  return (A0_74:getBaseAskResult())
end
function MateriaAttachAskWidget.processAskResult(A0_75, A1_76)
  local L2_77
  if 1 == A1_76 then
    L2_77 = desktopWidget
    L2_77 = L2_77.getMainMenuModeWidget
    L2_77 = L2_77(L2_77, "MateriaAttachWidget")
    if L2_77 ~= nil then
      desktopWidget:closeWidgetDirect(L2_77)
    end
    A0_75:setBaseAskResult(1)
  else
    L2_77 = A0_75.setFocus
    L2_77(A0_75, "Button_Back")
  end
end
function MateriaAttachAskWidget.setFocus(A0_78, A1_79)
  if A1_79 ~= nil and A1_79 ~= "" then
    A0_78:setLogicalFocus(A1_79)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_78 then
      A0_78:setKeyboardFocusedControl(A1_79)
    end
  end
end
function MateriaAttachAskWidget.processBeforeShow(A0_80, A1_81)
  if A0_80.work.mode == 2 and A0_80:_getParentWidget() ~= nil then
    A0_80:_getParentWidget():askShow()
  end
  if A0_80.work.error == true then
    if A0_80.work.mode == 1 then
      A0_80:setBaseAskResult(-1)
      break
    elseif A0_80.work.mode == 2 then
    else
    end
    if A0_80.work.mode == 3 then
      desktopWidget:closeWidgetDirect(A0_80)
      break
    else
    end
  else
  end
end
