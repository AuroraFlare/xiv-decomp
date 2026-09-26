require("/Widget/WidgetBaseClass")
_defineClass("MateriaAttachWarningWidget", "WidgetBaseClass")
function MateriaAttachWarningWidget.getFormName(A0_0)
  local L1_1
  L1_1 = "MateriaAttachAskWidget"
  return L1_1
end
function MateriaAttachWarningWidget.updateMateriaItemDetail(A0_2, A1_3)
  local L2_4, L3_5
  L2_4 = worldMaster
  L3_5 = L2_4
  L2_4 = L2_4._getMyPlayer
  L2_4 = L2_4(L3_5)
  L3_5 = L2_4._getItem
  L3_5 = L3_5(L2_4, 1, A1_3)
  if L3_5 then
    desktopWidget:setItemDetail(A0_2, L3_5)
    desktopWidget:setItemDetailEquip(A0_2, L3_5)
    desktopWidget:setItemCatalyst(A0_2, L3_5, L2_4)
    return L3_5:_getCatalogID(), L3_5:getNameIndex(), L3_5:getItemLevel()
  end
end
function MateriaAttachWarningWidget.updateEquipItemDetail(A0_6, A1_7, A2_8)
  local L3_9, L4_10
  L3_9 = worldMaster
  L4_10 = L3_9
  L3_9 = L3_9._getMyPlayer
  L3_9 = L3_9(L4_10)
  L4_10 = L3_9._getItem
  L4_10 = L4_10(L3_9, 1, A1_7)
  if L4_10 then
    desktopWidget:setItemMateriaInstall(A0_6, L4_10, L3_9)
    desktopWidget:setItemMateriaInstallSkill(A0_6, L4_10)
    desktopWidget:setItemMateriaInstallRate(A0_6, L4_10, A2_8)
    return L4_10:_getCatalogID(), L4_10:getNameIndex(), L4_10:getItemLevel()
  end
end
function MateriaAttachWarningWidget.init(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16)
  local L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26, L16_27, L17_28
  L6_17 = A0_11.work
  L7_18 = {L8_19}
  L8_19 = {L9_20, L10_21}
  L9_20 = "close"
  L10_21 = "boolean"
  L6_17._temp = L7_18
  L7_18 = A0_11
  L6_17 = A0_11.setModal
  L8_19 = true
  L6_17(L7_18, L8_19)
  L7_18 = A0_11
  L6_17 = A0_11.setConfirmCondition
  L8_19 = "Button_Install"
  L6_17(L7_18, L8_19)
  L7_18 = A0_11
  L6_17 = A0_11.setConfirmCondition
  L8_19 = "Button_Back"
  L6_17(L7_18, L8_19)
  L7_18 = A0_11
  L6_17 = A0_11.setCancelCondition
  L6_17(L7_18)
  L7_18 = A0_11
  L6_17 = A0_11.setCloseCondition
  L6_17(L7_18)
  L7_18 = A0_11
  L6_17 = A0_11.setContent
  L8_19 = "Button_Install"
  L9_20 = 1005
  L6_17(L7_18, L8_19, L9_20)
  L7_18 = A0_11
  L6_17 = A0_11.setVisibility
  L8_19 = "Button_Back"
  L9_20 = false
  L6_17(L7_18, L8_19, L9_20)
  L6_17 = desktopWidget
  L7_18 = L6_17
  L6_17 = L6_17.setMateriaAttachSlotIconHelp
  L8_19 = A0_11
  L6_17(L7_18, L8_19)
  L6_17 = A1_12
  if L6_17 == 1 then
    if A2_13 ~= nil then
      L8_19 = A0_11
      L7_18 = A0_11.setTextByOwner
      L9_20 = "TextBlock_Help"
      L10_21 = worldMaster
      L11_22 = 40233
      L12_23 = A2_13
      L13_24 = A3_14
      L7_18(L8_19, L9_20, L10_21, L11_22, L12_23, L13_24)
    else
      L7_18 = A0_11.work
      L7_18.close = true
      do break end
      else
      end
      if L6_17 == 2 then
        if A2_13 ~= nil then
          L8_19 = A0_11
          L7_18 = A0_11.setTextByOwner
          L9_20 = "TextBlock_Help"
          L10_21 = worldMaster
          L11_22 = 40234
          L12_23 = A2_13
          L7_18(L8_19, L9_20, L10_21, L11_22, L12_23)
        else
          L7_18 = A0_11.work
          L7_18.close = true
          do break end
          else
          end
          if L6_17 == 3 then
            if A2_13 ~= nil then
              L8_19 = A0_11
              L7_18 = A0_11.setTextByOwner
              L9_20 = "TextBlock_Help"
              L10_21 = worldMaster
              L11_22 = 40235
              L12_23 = A2_13
              L13_24 = A3_14
              L7_18(L8_19, L9_20, L10_21, L11_22, L12_23, L13_24)
            else
              L7_18 = A0_11.work
              L7_18.close = true
              do break end
              else
              end
              if L6_17 == 4 then
                L8_19 = A0_11
                L7_18 = A0_11.setTextByOwner
                L9_20 = "TextBlock_Help"
                L10_21 = worldMaster
                L11_22 = 40238
                L7_18(L8_19, L9_20, L10_21, L11_22)
                break
              else
              end
              if L6_17 == 5 then
                if A2_13 ~= nil then
                  L8_19 = A0_11
                  L7_18 = A0_11.setTextByOwner
                  L9_20 = "TextBlock_Help"
                  L10_21 = worldMaster
                  L11_22 = 40237
                  L12_23 = A2_13
                  L13_24 = A3_14
                  L14_25 = A4_15
                  L15_26 = 1
                  L7_18(L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26)
                else
                  L7_18 = A0_11.work
                  L7_18.close = true
                  do break end
                  else
                  end
                  if L6_17 == 6 then
                    if A2_13 ~= nil then
                      L8_19 = A0_11
                      L7_18 = A0_11.setTextByOwner
                      L9_20 = "TextBlock_Help"
                      L10_21 = worldMaster
                      L11_22 = 40236
                      L12_23 = A2_13
                      L13_24 = A3_14
                      L14_25 = A4_15
                      L15_26 = A5_16
                      L7_18(L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26)
                    else
                      L7_18 = A0_11.work
                      L7_18.close = true
                      do break end
                      else
                      end
                      if L6_17 == 7 then
                        L8_19 = A0_11
                        L7_18 = A0_11.setTextByOwner
                        L9_20 = "TextBlock_Help"
                        L10_21 = worldMaster
                        L11_22 = 40242
                        L12_23 = 2001003
                        L13_24 = 1
                        L7_18(L8_19, L9_20, L10_21, L11_22, L12_23, L13_24)
                        break
                      else
                      end
                      if L6_17 == 13 then
                        L8_19 = A0_11
                        L7_18 = A0_11.setTextByOwner
                        L9_20 = "TextBlock_Help"
                        L10_21 = worldMaster
                        L11_22 = 25291
                        L12_23 = A2_13
                        L13_24 = A3_14
                        L7_18(L8_19, L9_20, L10_21, L11_22, L12_23, L13_24)
                        break
                      elseif L6_17 == 102 then
                      elseif L6_17 == 103 then
                      elseif L6_17 == 105 then
                      else
                      end
                      if L6_17 == 106 then
                        L7_18 = A2_13
                        L8_19 = A3_14
                        L10_21 = A0_11
                        L9_20 = A0_11.updateMateriaItemDetail
                        L11_22 = L7_18
                        L11_22 = L9_20(L10_21, L11_22)
                        L13_24 = A0_11
                        L12_23 = A0_11.updateEquipItemDetail
                        L14_25 = L8_19
                        L15_26 = 100
                        L14_25 = L12_23(L13_24, L14_25, L15_26)
                        if L9_20 == nil or L12_23 == nil then
                          L15_26 = A0_11.work
                          L15_26.close = true
                        else
                          if L11_22 > L14_25 then
                            L16_27 = A0_11
                            L15_26 = A0_11.setStyle
                            L17_28 = "TextBlock_ItemEquipCondition"
                            L15_26(L16_27, L17_28, "TBL_parameterMinus")
                          end
                          L15_26 = worldMaster
                          L16_27 = L15_26
                          L15_26 = L15_26._getMyPlayer
                          L15_26 = L15_26(L16_27)
                          L17_28 = L15_26
                          L16_27 = L15_26._getItem
                          L16_27 = L16_27(L17_28, 1, L7_18)
                          L17_28 = L15_26._getItem
                          L17_28 = L17_28(L15_26, 1, L8_19)
                          if not L16_27:isMateriaFitItemEquipPoint(nil, L17_28) then
                            A0_11:setColor("WrapPanel_MateriaSlot", 0.5, 0.5, 0)
                          end
                          if not L16_27:isMateriaFitItemEquipPoint(nil, L17_28) or L11_22 > L14_25 then
                            A0_11:setTextByOwner("TextBlock_Help", worldMaster, 40236, L12_23, L13_24, L9_20, L10_21)
                          else
                            A0_11:setText("TextBlock_Help", 3547, L12_23, L13_24, L9_20, L10_21)
                            do break end
                            L7_18 = A0_11.work
                            L7_18.close = true
                            break
                          end
                        end
                      else
                      end
                    end
                end
            end
        end
    end
  L7_18 = A0_11
  L6_17 = A0_11.setGridVisibility
  L8_19 = A1_12
  L6_17(L7_18, L8_19)
end
function MateriaAttachWarningWidget.setGridVisibility(A0_29, A1_30)
  A0_29:setVisibility("Grid_DisplayTitle", false)
  A0_29:setVisibility("Grid_ActorName", false)
  A0_29:setVisibility("Grid_Help", true)
  A0_29:setVisibility("Grid_BackpackAndGil", false)
  A0_29:setVisibility("Grid_ItemNameBase", A1_30 > 100)
  A0_29:setVisibility("Grid_ItemDetail1", false)
  A0_29:setVisibility("Grid_ItemDetail2", false)
  A0_29:setVisibility("Grid_ItemDetail3", false)
  A0_29:setVisibility("Label_ItemBonus5", false)
  A0_29:setVisibility("Grid_ItemLife", false)
  A0_29:setVisibility("Grid_Edit", false)
  A0_29:setVisibility("Grid_Catalyst", A1_30 > 100)
  A0_29:setVisibility("Grid_MateriaAttachCost", false)
  A0_29:setVisibility("Grid_Craft", A1_30 > 100)
  A0_29:setVisibility("Grid_SuccessRate", false)
  A0_29:setVisibility("Grid_Button", true)
end
function MateriaAttachWarningWidget.processUICommandOperate(A0_31, A1_32, A2_33, A3_34, A4_35)
  desktopWidget:closeWidgetDirect(A0_31)
end
function MateriaAttachWarningWidget.processUICommandClose(A0_36, A1_37, A2_38, A3_39, A4_40)
  desktopWidget:closeWidgetDirect(A0_36)
end
function MateriaAttachWarningWidget.setFocus(A0_41, A1_42)
  if A1_42 ~= nil and A1_42 ~= "" then
    A0_41:setLogicalFocus(A1_42)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_41 then
      A0_41:setKeyboardFocusedControl(A1_42)
    end
  end
end
function MateriaAttachWarningWidget.processBeforeShow(A0_43, A1_44)
  if A0_43.work.close == true then
    desktopWidget:closeWidgetDirect(A0_43)
  end
end
