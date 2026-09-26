require("/Chara/Npc/NpcBaseClass")
_defineClass("RetainerFurniture", "NpcBaseClass")
function RetainerFurniture.getLimitedDistanceForTalk(A0_0)
  local L1_1
  L1_1 = 4
  return L1_1
end
function RetainerFurniture.initForEvent(A0_2)
  local L1_3
end
function RetainerFurniture.getRetainer(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12
  L1_5 = worldMaster
  L2_6 = L1_5
  L1_5 = L1_5._getMyPlayer
  L1_5 = L1_5(L2_6)
  L3_7 = L1_5
  L2_6 = L1_5._getGroup
  L4_8 = 50003
  L2_6 = L2_6(L3_7, L4_8)
  if L2_6 ~= nil then
    L4_8 = L2_6
    L3_7 = L2_6._countMember
    L3_7 = L3_7(L4_8)
    L4_8 = 1
    for L8_12 = 1, L3_7 do
      if L2_6:_isExistInWorldMember(L8_12) == true and L2_6:_isExistInClientMember(L8_12) == true and L2_6:_getMember(L8_12) ~= nil and L2_6:_getMember(L8_12):_isAlive() == true and L2_6:_getMember(L8_12):isPlayer() == false then
        return (L2_6:_getMember(L8_12))
      end
    end
  end
  L3_7 = nil
  return L3_7
end
function RetainerFurniture.eventPushStepOpenRetainerMenu(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23
  L1_14 = worldMaster
  L2_15 = L1_14
  L1_14 = L1_14._getMyPlayer
  L1_14 = L1_14(L2_15)
  L2_15 = 0
  L4_17 = L1_14
  L3_16 = L1_14._getGroup
  L5_18 = 80001
  L3_16 = L3_16(L4_17, L5_18)
  if L3_16 == nil then
    L4_17 = 0
    return L4_17
  end
  L5_18 = L3_16
  L4_17 = L3_16._countMember
  L4_17 = L4_17(L5_18)
  if L4_17 < 2 then
    L5_18 = 0
    return L5_18
  end
  L5_18 = desktopWidget
  L6_19 = L5_18
  L5_18 = L5_18.askRetainerListWidget
  L10_23 = 6501
  L5_18 = L5_18(L6_19, L7_20, L8_21, L9_22, L10_23)
  L2_15 = L5_18
  L5_18 = 1
  L6_19 = 1
  for L10_23 = 1, L4_17 do
    if L3_16:isPlayerMember(L10_23) == false then
      if L6_19 == L2_15 then
        L2_15 = L10_23
        break
      else
        L6_19 = L6_19 + 1
      end
    end
  end
  return L2_15
end
function RetainerFurniture.eventPushRetainerCallCaution(A0_24)
  if A0_24:askExtendWidget(worldMaster, 49066, 2, 1, 2) ~= 1 then
    return 0
  end
  return (A0_24:askExtendWidget(worldMaster, 49066, 2, 1, 2))
end
function RetainerFurniture.eventRingBell(A0_25)
  A0_25:_runCharaScheduler(67522560)
  desktopWidget:cancelMainTargetCharacter()
end
function RetainerFurniture.eventTalkRetainerMenu(A0_26, A1_27, A2_28)
  local L3_29, L4_30, L5_31, L6_32, L7_33
  L3_29 = worldMaster
  L4_30 = L3_29
  L3_29 = L3_29._getMyPlayer
  L3_29 = L3_29(L4_30)
  L4_30 = {
    L5_31,
    L6_32,
    L7_33,
    4,
    3,
    5,
    8
  }
  L5_31 = 1
  L6_32 = 2
  L7_33 = 7
  L6_32 = A0_26
  L5_31 = A0_26.getRetainer
  L5_31 = L5_31(L6_32)
  L6_32 = {
    L7_33,
    true,
    true,
    false,
    true,
    true,
    A2_28
  }
  L7_33 = true
  L7_33 = 0
  repeat
    if L5_31 ~= nil and L5_31:_isAlive() == true then
      L5_31:startCliantTalkTurn(2, L3_29)
    end
    L7_33 = worldMaster:askRestrictChoices(A0_26, nil, 6321, unpack(L6_32))
    if type(L7_33) == "nil" then
      return 0
    end
    if L7_33 <= 0 then
      return 0
    end
    if L4_30[L7_33] == 3 then
      if A0_26:eventTalkRetainerDismissal(A1_27) == true then
        return L4_30[L7_33]
      end
    else
      return L4_30[L7_33]
    end
  until L4_30[L7_33] == 0
  return 0
end
function RetainerFurniture.eventTalkRetainerDismissal(A0_34, A1_35)
  if A0_34:getRetainer() == nil then
    return false
  end
  if desktopWidget:askEventModeWidgetYield("Ask/RetainerDismissalWidget", 1) == true and desktopWidget:askEventModeWidgetYield("Ask/RetainerDismissalWidget", 1) == 1 then
    return true
  end
  return false
end
function RetainerFurniture.eventTalkRetainerMannequin(A0_36, A1_37)
  local L2_38
  L2_38 = 0
  if A1_37 == 1 then
    L2_38 = worldMaster:ask(A0_36, nil, 6345, 2)
    if L2_38 == 1 then
      return 2
    end
  else
    L2_38 = worldMaster:ask(A0_36, nil, 6342, 2)
    if L2_38 == 1 then
      return 1
    end
  end
  return A1_37
end
function RetainerFurniture.eventTalkRetainerItemTrade(A0_39, A1_40)
  local L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48
  L3_42 = A0_39
  L2_41 = A0_39.getRetainer
  L2_41 = L2_41(L3_42)
  if L2_41 == nil then
    L3_42 = 0
    L4_43 = nil
    L5_44 = 0
    L6_45 = 0
    L7_46 = 0
    L8_47 = 0
    return L3_42, L4_43, L5_44, L6_45, L7_46, L8_47
  end
  L3_42 = worldMaster
  L4_43 = L3_42
  L3_42 = L3_42._getMyPlayer
  L3_42 = L3_42(L4_43)
  L4_43 = true
  L5_44 = 1
  L6_45 = 1
  L7_46 = 1
  L8_47 = 1
  L9_48 = L2_41._isAlive
  L9_48 = L9_48(L2_41)
  if L9_48 == true then
    L9_48 = L2_41.startCliantTalkTurn
    L9_48(L2_41, 2, L3_42)
  end
  L9_48 = nil
  if A1_40 == 1 then
    L2_41:updateRetainerItemPackage()
    L4_43 = desktopWidget:openRetainerTradeWidget(L2_41)
    if L4_43 == false then
      do return 0, nil, 0, 0, 0, 0 end
      do break end
      else
      end
      if A1_40 == 3 then
        desktopWidget:closeRetainerTradeWidget(L2_41)
        break
      else
      end
      if A1_40 == 2 then
        L2_41:updateRetainerItemPackage()
        L5_44, L6_45, L7_46, L8_47 = desktopWidget:selectRetainerTradeWidget(A0_39)
        if type(L8_47) ~= "number" then
          L8_47 = 0
        end
        if L5_44 == 1 then
          return 100, nil, 0, 0, 0, 0
        elseif L5_44 == 31 then
          L9_48 = L2_41:_getItem(L6_45, L7_46)
          if L9_48 == nil then
          elseif L9_48:_isAlive() == false then
          else
            return L5_44, L9_48, L6_45, L8_47, L9_48:_getCatalogID(), L9_48:_getNameIndex()
          end
        else
          if L5_44 == 32 then
            L9_48 = L3_42:_getItem(L6_45, L7_46)
            if L9_48 == nil then
            elseif L9_48:_isAlive() == false then
            else
              return L5_44, L9_48, L6_45, L8_47, L9_48:_getCatalogID(), L9_48:_getNameIndex()
            end
          else
          end
        end
      else
      end
    else
    end
  return 1, nil, 0, 0, 0, 0
end
function RetainerFurniture.eventTalkRetainerItemList(A0_49, A1_50)
  local L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61, L13_62, L14_63, L15_64, L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71
  L3_52 = A0_49
  L2_51 = A0_49.getRetainer
  L2_51 = L2_51(L3_52)
  if L2_51 == nil then
    L3_52 = 0
    L4_53 = nil
    L5_54 = 0
    L6_55 = 0
    L7_56 = 0
    L8_57 = 0
    L9_58 = 0
    L10_59 = 0
    return L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59
  end
  L3_52 = worldMaster
  L4_53 = L3_52
  L3_52 = L3_52._getMyPlayer
  L3_52 = L3_52(L4_53)
  L4_53 = true
  L5_54 = 1
  L6_55 = 1
  L7_56 = 1
  L8_57 = 10
  L9_58 = 0
  L10_59 = 1
  L11_60 = 1
  L12_61 = 1
  L13_62 = 1
  L15_64 = L2_51
  L14_63 = L2_51._isAlive
  L14_63 = L14_63(L15_64)
  if L14_63 == true then
    L15_64 = L2_51
    L14_63 = L2_51.startCliantTalkTurn
    L16_65 = 2
    L17_66 = L3_52
    L14_63(L15_64, L16_65, L17_66)
  end
  L14_63 = nil
  L15_64 = A1_50
  if L15_64 == 1 then
    L17_66 = L2_51
    L16_65 = L2_51.updateRetainerItemPackage
    L16_65(L17_66)
    L16_65 = desktopWidget
    L17_66 = L16_65
    L16_65 = L16_65.openRetainerItemListWidget
    L18_67 = L2_51
    L16_65 = L16_65(L17_66, L18_67)
    L4_53 = L16_65
    if L4_53 == false then
      L16_65 = 0
      L17_66 = nil
      L18_67 = 0
      L22_71 = 0
      do return L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, 0, 0, 0 end
      do break end
      else
      end
      if L15_64 == 3 then
        L16_65 = desktopWidget
        L17_66 = L16_65
        L16_65 = L16_65.closeRetainerItemListWidget
        L18_67 = L2_51
        L16_65(L17_66, L18_67)
        break
      else
      end
      if L15_64 == 2 then
        L17_66 = L2_51
        L16_65 = L2_51.updateRetainerItemPackage
        L16_65(L17_66)
        L16_65 = desktopWidget
        L17_66 = L16_65
        L16_65 = L16_65.selectRetainerItemListWidget
        L18_67 = L2_51
        L12_61, L13_62, L16_65 = 0, 0, L16_65(L17_66, L18_67)
        L12_61, L13_62, L17_66 = 0, 0, L16_65(L17_66, L18_67)
        L12_61, L13_62, L18_67 = 0, 0, L16_65(L17_66, L18_67)
        L12_61, L13_62, L22_71 = 0, 0, L16_65(L17_66, L18_67)
        L11_60 = L22_71
        L10_59 = L21_70
        L9_58 = L20_69
        L8_57 = L19_68
        L7_56 = L18_67
        L6_55 = L17_66
        L5_54 = L16_65
        if L5_54 == 1 then
          L16_65 = 100
          L17_66 = nil
          L18_67 = 0
          L22_71 = 0
          return L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, 0, 0, 0
        elseif L5_54 == 11 then
          L17_66 = L2_51
          L16_65 = L2_51._getItem
          L18_67 = L6_55
          L16_65 = L16_65(L17_66, L18_67, L19_68)
          L14_63 = L16_65
          if L14_63 == nil then
          else
            L17_66 = L14_63
            L16_65 = L14_63._isAlive
            L16_65 = L16_65(L17_66)
            if L16_65 == false then
            else
              L16_65 = L5_54
              L17_66 = L14_63
              L18_67 = 0
              L22_71 = L14_63._countStack
              L22_71 = L22_71(L14_63)
              return L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, 0, L14_63:_getCatalogID(), L14_63:_getNameIndex()
            end
          end
        elseif L5_54 == 12 then
          L17_66 = L2_51
          L16_65 = L2_51._getItem
          L18_67 = L6_55
          L16_65 = L16_65(L17_66, L18_67, L19_68)
          L14_63 = L16_65
          if L14_63 == nil then
          else
            L17_66 = L14_63
            L16_65 = L14_63._isAlive
            L16_65 = L16_65(L17_66)
            if L16_65 == false then
            else
              L16_65 = L5_54
              L17_66 = L14_63
              L18_67 = 0
              L22_71 = L14_63._countStack
              L22_71 = L22_71(L14_63)
              return L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, 0, L14_63:_getCatalogID(), L14_63:_getNameIndex()
            end
          end
        elseif L5_54 == 13 then
          L17_66 = L2_51
          L16_65 = L2_51._getItem
          L18_67 = L6_55
          L16_65 = L16_65(L17_66, L18_67, L19_68)
          L14_63 = L16_65
          if L14_63 == nil then
          else
            L17_66 = L14_63
            L16_65 = L14_63._isAlive
            L16_65 = L16_65(L17_66)
            if L16_65 == false then
            else
              L16_65 = L5_54
              L17_66 = L14_63
              L18_67 = 0
              L22_71 = L14_63._countStack
              L22_71 = L22_71(L14_63)
              return L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, 0, L14_63:_getCatalogID(), L14_63:_getNameIndex()
            end
          end
        elseif L5_54 == 21 then
          L17_66 = L2_51
          L16_65 = L2_51._getItem
          L18_67 = L6_55
          L16_65 = L16_65(L17_66, L18_67, L19_68)
          L14_63 = L16_65
          if L14_63 == nil then
          else
            L17_66 = L14_63
            L16_65 = L14_63._isAlive
            L16_65 = L16_65(L17_66)
            if L16_65 == false then
            else
              L16_65 = type
              L17_66 = L12_61
              L16_65 = L16_65(L17_66)
              if L16_65 ~= "number" then
                L17_66 = L14_63
                L16_65 = L14_63._countStack
                L16_65 = L16_65(L17_66)
                L12_61 = L16_65
              end
              if L8_57 == 20 or L8_57 == 30 then
                if L10_59 == 0 then
                  L17_66 = L2_51
                  L16_65 = L2_51._getItem
                  L18_67 = 100
                  L16_65 = L16_65(L17_66, L18_67, L19_68)
                  L18_67 = L2_51
                  L17_66 = L2_51._hasItemPackage
                  L17_66 = L17_66(L18_67, L19_68)
                  if L17_66 == true then
                    L18_67 = L2_51
                    L17_66 = L2_51._getItemPackageCapacity
                    L17_66 = L17_66(L18_67, L19_68)
                    if L17_66 > 0 then
                      L18_67 = nil
                      for L22_71 = 1, L17_66 do
                        if L2_51:_getItem(100, L22_71) ~= nil and L2_51:_getItem(100, L22_71):_getCatalogID() == 1000001 then
                          L16_65 = L2_51:_getItem(100, L22_71)
                          break
                        end
                      end
                    end
                  end
                  L17_66 = L5_54
                  L18_67 = L16_65
                  L22_71 = L6_55
                  return L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, L9_58, L12_61, L16_65:_getCatalogID(), L16_65:_getNameIndex()
                else
                  L17_66 = L2_51
                  L16_65 = L2_51._getItem
                  L18_67 = L10_59
                  L16_65 = L16_65(L17_66, L18_67, L19_68)
                  if L16_65 == nil then
                  else
                    L18_67 = L16_65
                    L17_66 = L16_65._isAlive
                    L17_66 = L17_66(L18_67)
                    if L17_66 == false then
                    else
                      L17_66 = type
                      L18_67 = L13_62
                      L17_66 = L17_66(L18_67)
                      if L17_66 ~= "number" then
                        L18_67 = L16_65
                        L17_66 = L16_65._countStack
                        L17_66 = L17_66(L18_67)
                        L13_62 = L17_66
                      end
                      L17_66 = L5_54
                      L18_67 = L16_65
                      L22_71 = L6_55
                      return L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, L13_62, L12_61, L16_65:_getCatalogID(), L16_65:_getNameIndex()
                    end
                  end
                end
              else
                L16_65 = L5_54
                L17_66 = L14_63
                L18_67 = L8_57
                L22_71 = L12_61
                do return L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, L9_58, L14_63:_getCatalogID(), L14_63:_getNameIndex() end
                break
              end
            end
          end
        else
          if L5_54 == 22 then
            L17_66 = L2_51
            L16_65 = L2_51._getItem
            L18_67 = L6_55
            L16_65 = L16_65(L17_66, L18_67, L19_68)
            L14_63 = L16_65
            if L14_63 == nil then
            else
              L17_66 = L14_63
              L16_65 = L14_63._isAlive
              L16_65 = L16_65(L17_66)
              if L16_65 == false then
              else
                L17_66 = L14_63
                L16_65 = L14_63._getDealingAttached
                L18_67 = L16_65(L17_66)
                if L19_68 == true then
                  L18_67 = L19_68
                end
                L22_71 = 0
                do return L19_68, L20_69, L21_70, L22_71, L14_63:_getPackage(), 0, L14_63:_countStack(), L18_67, L14_63:_getCatalogID(), L14_63:_getNameIndex() end
                break
              end
            end
          else
          end
        end
      else
      end
    else
    end
  L15_64 = 2
  L16_65 = nil
  L17_66 = 0
  L18_67 = 0
  L22_71 = 0
  return L15_64, L16_65, L17_66, L18_67, L19_68, L20_69, L21_70, L22_71, 0, 0
end
function RetainerFurniture.eventTalkSelectBazaarStreet(A0_72, A1_73)
  local L2_74, L3_75, L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83
  L2_74 = 0
  L3_75 = 0
  L4_76 = {}
  L5_77 = {}
  L6_78 = 0
  L7_79 = 0
  L8_80 = {
    L9_81,
    L10_82,
    L11_83
  }
  L9_81 = 60007
  L10_82 = 60007
  L9_81 = {
    L10_82,
    L11_83,
    3051
  }
  L10_82 = 1051
  repeat
    L10_82 = desktopWidget
    L10_82 = L10_82.askMarketSelectWidget
    L10_82 = L10_82(L11_83, A0_72, A0_72, worldMaster, 1, true, 60002, L8_80, unpack(L9_81))
    L7_79 = L10_82
    if L7_79 > 0 and L7_79 <= 3 then
      L10_82 = 1261
      if L7_79 == 1 then
        L10_82 = 1261
        L2_74 = 202
      elseif L7_79 == 2 then
        L10_82 = 2261
        L2_74 = 204
      elseif L7_79 == 3 then
        L10_82 = 3261
        L2_74 = 205
      end
      L3_75 = 0
      for _FORV_14_ = L10_82, L10_82 + A1_73 - 1 do
        L3_75 = L3_75 + 1
        L4_76[L3_75] = 60007
        L5_77[L3_75] = _FORV_14_
      end
      repeat
        L7_79 = L11_83
        if L7_79 > 0 then
          if L7_79 <= L11_83 then
            if type(L11_83) == "number" and L11_83 == 1 then
              do return L2_74, L5_77[L7_79] end
              do break end
              break
            end
          end
        end
      until L7_79 < 0
      L7_79 = 0
      do break end
      break
    end
  until L7_79 < 0
  L10_82 = 0
  return L10_82, L11_83
end
function RetainerFurniture.eventReturnResult(A0_84, A1_85, A2_86)
  local L3_87
  L3_87 = A1_85
  if L3_87 == 31 then
    desktopWidget:noticeRetainerTradeResult(31, A2_86)
    break
  else
  end
  if L3_87 == 32 then
    desktopWidget:noticeRetainerTradeResult(32, A2_86)
    do break end
    break
  else
  end
end
function RetainerFurniture.eventTalkFinish(A0_88)
  if A0_88:getRetainer() ~= nil then
    A0_88:getRetainer():finishCliantTalkTurn()
  end
end
function RetainerFurniture.eventPlayerTurn(A0_89, A1_90)
  if worldMaster:_getMyPlayer() ~= nil then
    worldMaster:_getMyPlayer():_turnDir(A1_90)
  end
end
