require("/Chara/Npc/NpcBaseClass")
_defineClass("RetainerMeetingSpace", "NpcBaseClass")
function RetainerMeetingSpace.initForEvent(A0_0)
  local L1_1
end
function RetainerMeetingSpace.getRetainer(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  L1_3 = worldMaster
  L2_4 = L1_3
  L1_3 = L1_3._getMyPlayer
  L1_3 = L1_3(L2_4)
  L3_5 = L1_3
  L2_4 = L1_3._getGroup
  L4_6 = 50003
  L2_4 = L2_4(L3_5, L4_6)
  if L2_4 ~= nil then
    L4_6 = L2_4
    L3_5 = L2_4._countMember
    L3_5 = L3_5(L4_6)
    L4_6 = 1
    for L8_10 = 1, L3_5 do
      if L2_4:_isExistInWorldMember(L8_10) == true and L2_4:_isExistInClientMember(L8_10) == true and L2_4:_getMember(L8_10) ~= nil and L2_4:_getMember(L8_10):_isAlive() == true and L2_4:_getMember(L8_10):isPlayer() == false then
        return (L2_4:_getMember(L8_10))
      end
    end
  end
  L3_5 = nil
  return L3_5
end
function RetainerMeetingSpace.eventPushStepOpenRetainerMenu(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21
  L1_12 = worldMaster
  L2_13 = L1_12
  L1_12 = L1_12._getMyPlayer
  L1_12 = L1_12(L2_13)
  L2_13 = 0
  L4_15 = L1_12
  L3_14 = L1_12._getGroup
  L5_16 = 80001
  L3_14 = L3_14(L4_15, L5_16)
  if L3_14 == nil then
    L4_15 = 0
    return L4_15
  end
  L5_16 = L3_14
  L4_15 = L3_14._countMember
  L4_15 = L4_15(L5_16)
  if L4_15 < 2 then
    L5_16 = 0
    return L5_16
  end
  L5_16 = desktopWidget
  L6_17 = L5_16
  L5_16 = L5_16.askRetainerListWidget
  L10_21 = 6501
  L5_16 = L5_16(L6_17, L7_18, L8_19, L9_20, L10_21)
  L2_13 = L5_16
  L5_16 = 1
  L6_17 = 1
  for L10_21 = 1, L4_15 do
    if L3_14:isPlayerMember(L10_21) == false then
      if L6_17 == L2_13 then
        L2_13 = L10_21
        break
      else
        L6_17 = L6_17 + 1
      end
    end
  end
  return L2_13
end
function RetainerMeetingSpace.eventPushRetainerCallCaution(A0_22)
  if A0_22:askExtendWidget(worldMaster, 49066, 2, 1, 2) ~= 1 then
    return 0
  end
  return (A0_22:askExtendWidget(worldMaster, 49066, 2, 1, 2))
end
function RetainerMeetingSpace.eventTalkRetainerMenu(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28, L6_29
  L2_25 = worldMaster
  L3_26 = L2_25
  L2_25 = L2_25._getMyPlayer
  L2_25 = L2_25(L3_26)
  L3_26 = {
    L4_27,
    L5_28,
    L6_29,
    4,
    3,
    5,
    8,
    6
  }
  L4_27 = 1
  L5_28 = 2
  L6_29 = 7
  L5_28 = A0_23
  L4_27 = A0_23.getRetainer
  L4_27 = L4_27(L5_28)
  L5_28 = {
    L6_29,
    true,
    true,
    false,
    false,
    true,
    false,
    true
  }
  L6_29 = true
  L6_29 = 0
  repeat
    if L4_27 ~= nil and L4_27:_isAlive() == true then
      L4_27:startCliantTalkTurn(2, L2_25)
    end
    L6_29 = worldMaster:askRestrictChoices(A0_23, nil, 6321, unpack(L5_28))
    if type(L6_29) == "nil" then
      return 0
    end
    if L6_29 <= 0 then
      return 0
    end
    if L3_26[L6_29] == 3 then
      if A0_23:eventTalkRetainerDismissal(A1_24) == true then
        return L3_26[L6_29]
      end
    else
      return L3_26[L6_29]
    end
  until L3_26[L6_29] == 0
  return 0
end
function RetainerMeetingSpace.eventTalkRetainerDismissal(A0_30, A1_31)
  local L2_32, L3_33
  L3_33 = A0_30
  L2_32 = A0_30.getRetainer
  L2_32 = L2_32(L3_33)
  if L2_32 == nil then
    L3_33 = false
    return L3_33
  end
  L3_33 = 0
  if A1_31 == true then
    L3_33 = A0_30:askExtendWidget(nil, 6334, 2, 1, 2)
  else
    L3_33 = A0_30:askExtendWidget(nil, 6331, 2, 1, 2)
  end
  if L3_33 == 1 then
    return true
  end
  return false
end
function RetainerMeetingSpace.eventTalkRetainerMannequin(A0_34, A1_35)
  local L2_36
  L2_36 = 0
  if A1_35 == 1 then
    L2_36 = worldMaster:ask(A0_34, nil, 6345, 2)
    if L2_36 == 1 then
      return 2
    end
  else
    L2_36 = worldMaster:ask(A0_34, nil, 6342, 2)
    if L2_36 == 1 then
      return 1
    end
  end
  return A1_35
end
function RetainerMeetingSpace.eventTalkRetainerItemTrade(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46
  L3_40 = A0_37
  L2_39 = A0_37.getRetainer
  L2_39 = L2_39(L3_40)
  if L2_39 == nil then
    L3_40 = 0
    L4_41 = nil
    L5_42 = 0
    L6_43 = 0
    L7_44 = 0
    L8_45 = 0
    return L3_40, L4_41, L5_42, L6_43, L7_44, L8_45
  end
  L3_40 = worldMaster
  L4_41 = L3_40
  L3_40 = L3_40._getMyPlayer
  L3_40 = L3_40(L4_41)
  L4_41 = true
  L5_42 = 1
  L6_43 = 1
  L7_44 = 1
  L8_45 = 1
  L9_46 = L2_39._isAlive
  L9_46 = L9_46(L2_39)
  if L9_46 == true then
    L9_46 = L2_39.startCliantTalkTurn
    L9_46(L2_39, 2, L3_40)
  end
  L9_46 = nil
  if A1_38 == 1 then
    L2_39:updateRetainerItemPackage()
    L4_41 = desktopWidget:openRetainerTradeWidget(L2_39)
    if L4_41 == false then
      do return 0, nil, 0, 0, 0, 0 end
      do break end
      else
      end
      if A1_38 == 3 then
        desktopWidget:closeRetainerTradeWidget(L2_39)
        break
      else
      end
      if A1_38 == 2 then
        L2_39:updateRetainerItemPackage()
        L5_42, L6_43, L7_44, L8_45 = desktopWidget:selectRetainerTradeWidget(A0_37)
        if type(L8_45) ~= "number" then
          L8_45 = 0
        end
        if L5_42 == 1 then
          return 100, nil, 0, 0, 0, 0
        elseif L5_42 == 31 then
          L9_46 = L2_39:_getItem(L6_43, L7_44)
          if L9_46 == nil then
          elseif L9_46:_isAlive() == false then
          else
            return L5_42, L9_46, L6_43, L8_45, L9_46:_getCatalogID(), L9_46:_getNameIndex()
          end
        else
          if L5_42 == 32 then
            L9_46 = L3_40:_getItem(L6_43, L7_44)
            if L9_46 == nil then
            elseif L9_46:_isAlive() == false then
            else
              return L5_42, L9_46, L6_43, L8_45, L9_46:_getCatalogID(), L9_46:_getNameIndex()
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
function RetainerMeetingSpace.eventTalkRetainerItemList(A0_47, A1_48)
  local L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60, L14_61, L15_62, L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69
  L3_50 = A0_47
  L2_49 = A0_47.getRetainer
  L2_49 = L2_49(L3_50)
  if L2_49 == nil then
    L3_50 = 0
    L4_51 = nil
    L5_52 = 0
    L6_53 = 0
    L7_54 = 0
    L8_55 = 0
    L9_56 = 0
    L10_57 = 0
    return L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57
  end
  L3_50 = worldMaster
  L4_51 = L3_50
  L3_50 = L3_50._getMyPlayer
  L3_50 = L3_50(L4_51)
  L4_51 = true
  L5_52 = 1
  L6_53 = 1
  L7_54 = 1
  L8_55 = 10
  L9_56 = 0
  L10_57 = 1
  L11_58 = 1
  L12_59 = 1
  L13_60 = 1
  L15_62 = L2_49
  L14_61 = L2_49._isAlive
  L14_61 = L14_61(L15_62)
  if L14_61 == true then
    L15_62 = L2_49
    L14_61 = L2_49.startCliantTalkTurn
    L16_63 = 2
    L17_64 = L3_50
    L14_61(L15_62, L16_63, L17_64)
  end
  L14_61 = nil
  L15_62 = A1_48
  if L15_62 == 1 then
    L17_64 = L2_49
    L16_63 = L2_49.updateRetainerItemPackage
    L16_63(L17_64)
    L16_63 = desktopWidget
    L17_64 = L16_63
    L16_63 = L16_63.openRetainerItemListWidget
    L18_65 = L2_49
    L16_63 = L16_63(L17_64, L18_65)
    L4_51 = L16_63
    if L4_51 == false then
      L16_63 = 0
      L17_64 = nil
      L18_65 = 0
      L22_69 = 0
      do return L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, 0, 0, 0 end
      do break end
      else
      end
      if L15_62 == 3 then
        L16_63 = desktopWidget
        L17_64 = L16_63
        L16_63 = L16_63.closeRetainerItemListWidget
        L18_65 = L2_49
        L16_63(L17_64, L18_65)
        break
      else
      end
      if L15_62 == 2 then
        L17_64 = L2_49
        L16_63 = L2_49.updateRetainerItemPackage
        L16_63(L17_64)
        L16_63 = desktopWidget
        L17_64 = L16_63
        L16_63 = L16_63.selectRetainerItemListWidget
        L18_65 = L2_49
        L12_59, L13_60, L16_63 = 0, 0, L16_63(L17_64, L18_65)
        L12_59, L13_60, L17_64 = 0, 0, L16_63(L17_64, L18_65)
        L12_59, L13_60, L18_65 = 0, 0, L16_63(L17_64, L18_65)
        L12_59, L13_60, L22_69 = 0, 0, L16_63(L17_64, L18_65)
        L11_58 = L22_69
        L10_57 = L21_68
        L9_56 = L20_67
        L8_55 = L19_66
        L7_54 = L18_65
        L6_53 = L17_64
        L5_52 = L16_63
        if L5_52 == 1 then
          L16_63 = 100
          L17_64 = nil
          L18_65 = 0
          L22_69 = 0
          return L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, 0, 0, 0
        elseif L5_52 == 11 then
          L17_64 = L2_49
          L16_63 = L2_49._getItem
          L18_65 = L6_53
          L16_63 = L16_63(L17_64, L18_65, L19_66)
          L14_61 = L16_63
          if L14_61 == nil then
          else
            L17_64 = L14_61
            L16_63 = L14_61._isAlive
            L16_63 = L16_63(L17_64)
            if L16_63 == false then
            else
              L16_63 = L5_52
              L17_64 = L14_61
              L18_65 = 0
              L22_69 = L14_61._countStack
              L22_69 = L22_69(L14_61)
              return L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, 0, L14_61:_getCatalogID(), L14_61:_getNameIndex()
            end
          end
        elseif L5_52 == 12 then
          L17_64 = L2_49
          L16_63 = L2_49._getItem
          L18_65 = L6_53
          L16_63 = L16_63(L17_64, L18_65, L19_66)
          L14_61 = L16_63
          if L14_61 == nil then
          else
            L17_64 = L14_61
            L16_63 = L14_61._isAlive
            L16_63 = L16_63(L17_64)
            if L16_63 == false then
            else
              L16_63 = L5_52
              L17_64 = L14_61
              L18_65 = 0
              L22_69 = L14_61._countStack
              L22_69 = L22_69(L14_61)
              return L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, 0, L14_61:_getCatalogID(), L14_61:_getNameIndex()
            end
          end
        elseif L5_52 == 13 then
          L17_64 = L2_49
          L16_63 = L2_49._getItem
          L18_65 = L6_53
          L16_63 = L16_63(L17_64, L18_65, L19_66)
          L14_61 = L16_63
          if L14_61 == nil then
          else
            L17_64 = L14_61
            L16_63 = L14_61._isAlive
            L16_63 = L16_63(L17_64)
            if L16_63 == false then
            else
              L16_63 = L5_52
              L17_64 = L14_61
              L18_65 = 0
              L22_69 = L14_61._countStack
              L22_69 = L22_69(L14_61)
              return L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, 0, L14_61:_getCatalogID(), L14_61:_getNameIndex()
            end
          end
        elseif L5_52 == 21 then
          L17_64 = L2_49
          L16_63 = L2_49._getItem
          L18_65 = L6_53
          L16_63 = L16_63(L17_64, L18_65, L19_66)
          L14_61 = L16_63
          if L14_61 == nil then
          else
            L17_64 = L14_61
            L16_63 = L14_61._isAlive
            L16_63 = L16_63(L17_64)
            if L16_63 == false then
            else
              L16_63 = type
              L17_64 = L12_59
              L16_63 = L16_63(L17_64)
              if L16_63 ~= "number" then
                L17_64 = L14_61
                L16_63 = L14_61._countStack
                L16_63 = L16_63(L17_64)
                L12_59 = L16_63
              end
              if L8_55 == 20 or L8_55 == 30 then
                if L10_57 == 0 then
                  L17_64 = L2_49
                  L16_63 = L2_49._getItem
                  L18_65 = 100
                  L16_63 = L16_63(L17_64, L18_65, L19_66)
                  L18_65 = L2_49
                  L17_64 = L2_49._hasItemPackage
                  L17_64 = L17_64(L18_65, L19_66)
                  if L17_64 == true then
                    L18_65 = L2_49
                    L17_64 = L2_49._getItemPackageCapacity
                    L17_64 = L17_64(L18_65, L19_66)
                    if L17_64 > 0 then
                      L18_65 = nil
                      for L22_69 = 1, L17_64 do
                        if L2_49:_getItem(100, L22_69) ~= nil and L2_49:_getItem(100, L22_69):_getCatalogID() == 1000001 then
                          L16_63 = L2_49:_getItem(100, L22_69)
                          break
                        end
                      end
                    end
                  end
                  L17_64 = L5_52
                  L18_65 = L16_63
                  L22_69 = L6_53
                  return L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, L9_56, L12_59, L16_63:_getCatalogID(), L16_63:_getNameIndex()
                else
                  L17_64 = L2_49
                  L16_63 = L2_49._getItem
                  L18_65 = L10_57
                  L16_63 = L16_63(L17_64, L18_65, L19_66)
                  if L16_63 == nil then
                  else
                    L18_65 = L16_63
                    L17_64 = L16_63._isAlive
                    L17_64 = L17_64(L18_65)
                    if L17_64 == false then
                    else
                      L17_64 = type
                      L18_65 = L13_60
                      L17_64 = L17_64(L18_65)
                      if L17_64 ~= "number" then
                        L18_65 = L16_63
                        L17_64 = L16_63._countStack
                        L17_64 = L17_64(L18_65)
                        L13_60 = L17_64
                      end
                      L17_64 = L5_52
                      L18_65 = L16_63
                      L22_69 = L6_53
                      return L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, L13_60, L12_59, L16_63:_getCatalogID(), L16_63:_getNameIndex()
                    end
                  end
                end
              else
                L16_63 = L5_52
                L17_64 = L14_61
                L18_65 = L8_55
                L22_69 = L12_59
                do return L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, L9_56, L14_61:_getCatalogID(), L14_61:_getNameIndex() end
                break
              end
            end
          end
        else
          if L5_52 == 22 then
            L17_64 = L2_49
            L16_63 = L2_49._getItem
            L18_65 = L6_53
            L16_63 = L16_63(L17_64, L18_65, L19_66)
            L14_61 = L16_63
            if L14_61 == nil then
            else
              L17_64 = L14_61
              L16_63 = L14_61._isAlive
              L16_63 = L16_63(L17_64)
              if L16_63 == false then
              else
                L17_64 = L14_61
                L16_63 = L14_61._getDealingAttached
                L18_65 = L16_63(L17_64)
                if L19_66 == true then
                  L18_65 = L19_66
                end
                L22_69 = 0
                do return L19_66, L20_67, L21_68, L22_69, L14_61:_getPackage(), 0, L14_61:_countStack(), L18_65, L14_61:_getCatalogID(), L14_61:_getNameIndex() end
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
  L15_62 = 2
  L16_63 = nil
  L17_64 = 0
  L18_65 = 0
  L22_69 = 0
  return L15_62, L16_63, L17_64, L18_65, L19_66, L20_67, L21_68, L22_69, 0, 0
end
function RetainerMeetingSpace.eventReturnResult(A0_70, A1_71, A2_72)
  local L3_73
  L3_73 = A1_71
  if L3_73 == 31 then
    desktopWidget:noticeRetainerTradeResult(31, A2_72)
    break
  else
  end
  if L3_73 == 32 then
    desktopWidget:noticeRetainerTradeResult(32, A2_72)
    do break end
    break
  else
  end
end
function RetainerMeetingSpace.eventTalkFinish(A0_74)
  if A0_74:getRetainer() ~= nil then
    A0_74:getRetainer():finishCliantTalkTurn()
  end
end
function RetainerMeetingSpace.eventPlayerTurn(A0_75, A1_76)
  if worldMaster:_getMyPlayer() ~= nil then
    worldMaster:_getMyPlayer():_turnDir(A1_76)
  end
end
