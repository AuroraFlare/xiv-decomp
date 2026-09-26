require("/Chara/Npc/Retainer/RetainerBaseClass")
_defineClass("OrdinaryRetainer", "RetainerBaseClass")
function OrdinaryRetainer._onInit(A0_0, A1_1, A2_2, A3_3, ...)
  A0_0:_callSuperClassFunc("_onInit", A1_1, A2_2, A3_3, ...)
  A0_0:_loadTextDataPermanently(319, "ordinaryRetainer")
end
function OrdinaryRetainer.eventTalkRetainerOther(A0_5, A1_6)
  return (desktopWidget:orderBazaarWidget(1))
end
function OrdinaryRetainer.checkRetainerMeetingGroupClient(A0_7)
  if A0_7:_getGroup(50003) == nil then
    return false
  end
  if A0_7:_getGroup(50003):_countMember() < 2 then
    return false
  end
  return true
end
function OrdinaryRetainer.eventTalkRetainerMenu(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13, L6_14, L7_15
  L3_11 = worldMaster
  L4_12 = L3_11
  L3_11 = L3_11._getMyPlayer
  L3_11 = L3_11(L4_12)
  L4_12 = {
    L5_13,
    L6_14,
    L7_15,
    4,
    3,
    5,
    8,
    6
  }
  L5_13 = 1
  L6_14 = 2
  L7_15 = 7
  L5_13 = {
    L6_14,
    L7_15,
    true,
    false,
    false,
    true,
    false,
    true
  }
  L6_14 = true
  L7_15 = true
  if A1_9 == 2 then
    L6_14 = {
      L7_15,
      true,
      true,
      false,
      false,
      false,
      false,
      true
    }
    L7_15 = true
    L5_13 = L6_14
  end
  L6_14 = 1
  repeat
    L7_15 = A0_8.checkRetainerMeetingGroupClient
    L7_15 = L7_15(A0_8)
    if L7_15 == true then
      break
    else
      L7_15 = A0_8._wait
      L7_15(A0_8, 1)
      L6_14 = L6_14 + 1
    end
  until L6_14 > 10
  L7_15 = 0
  repeat
    A0_8:startCliantTalkTurn(2, L3_11)
    L7_15 = worldMaster:askRestrictChoices(A0_8, nil, 6321, unpack(L5_13))
    if type(L7_15) == "nil" then
      return 0
    end
    if L7_15 <= 0 then
      return 0
    end
    if L4_12[L7_15] == 3 then
      if A0_8:eventTalkRetainerDismissal(A2_10) == true then
        return L4_12[L7_15]
      end
    else
      return L4_12[L7_15]
    end
  until L4_12[L7_15] == 0
  return 0
end
function OrdinaryRetainer.eventTalkRetainerDismissal(A0_16, A1_17)
  local L2_18
  L2_18 = 0
  if A1_17 == true then
    L2_18 = A0_16:askExtendWidget(nil, 6334, 2, 1, 2)
  else
    L2_18 = A0_16:askExtendWidget(nil, 6331, 2, 1, 2)
  end
  if L2_18 == 1 then
    return true
  end
  return false
end
function OrdinaryRetainer.eventTalkRetainerMannequin(A0_19, A1_20)
  local L2_21
  L2_21 = 0
  if A1_20 == 1 then
    L2_21 = worldMaster:ask(A0_19, nil, 6345, 2)
    if L2_21 == 1 then
      return 2
    end
  else
    L2_21 = worldMaster:ask(A0_19, nil, 6342, 2)
    if L2_21 == 1 then
      return 1
    end
  end
  return A1_20
end
function OrdinaryRetainer.eventTalkRetainerItemTrade(A0_22, A1_23)
  local L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30
  L2_24 = worldMaster
  L3_25 = L2_24
  L2_24 = L2_24._getMyPlayer
  L2_24 = L2_24(L3_25)
  L3_25 = true
  L4_26 = 1
  L5_27 = 1
  L6_28 = 1
  L7_29 = 1
  L8_30 = nil
  A0_22:startCliantTalkTurn(2, L2_24)
  if A1_23 == 1 then
    A0_22:updateRetainerItemPackage()
    L3_25 = desktopWidget:openRetainerTradeWidget(A0_22)
    if L3_25 == false then
      do return 0, nil, 0, 0, 0, 0 end
      do break end
      else
      end
      if A1_23 == 3 then
        desktopWidget:closeRetainerTradeWidget(A0_22)
        break
      else
      end
      if A1_23 == 2 then
        A0_22:updateRetainerItemPackage()
        L4_26, L5_27, L6_28, L7_29 = desktopWidget:selectRetainerTradeWidget(A0_22)
        if type(L7_29) ~= "number" then
          L7_29 = 0
        end
        if L4_26 == 1 then
          return 100, nil, 0, 0, 0, 0
        elseif L4_26 == 31 then
          L8_30 = A0_22:_getItem(L5_27, L6_28)
          if L8_30 == nil then
          elseif L8_30:_isAlive() == false then
          else
            return L4_26, L8_30, L5_27, L7_29, L8_30:_getCatalogID(), L8_30:_getNameIndex()
          end
        else
          if L4_26 == 32 then
            L8_30 = L2_24:_getItem(L5_27, L6_28)
            if L8_30 == nil then
            elseif L8_30:_isAlive() == false then
            else
              return L4_26, L8_30, L5_27, L7_29, L8_30:_getCatalogID(), L8_30:_getNameIndex()
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
function OrdinaryRetainer.eventTalkRetainerItemList(A0_31, A1_32)
  local L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43, L13_44, L14_45, L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52
  L2_33 = worldMaster
  L3_34 = L2_33
  L2_33 = L2_33._getMyPlayer
  L2_33 = L2_33(L3_34)
  L3_34 = true
  L4_35 = 1
  L5_36 = 1
  L6_37 = 1
  L7_38 = 10
  L8_39 = 0
  L9_40 = 1
  L10_41 = 1
  L11_42 = 1
  L12_43 = 1
  L13_44 = nil
  L15_46 = A0_31
  L14_45 = A0_31.startCliantTalkTurn
  L16_47 = 2
  L17_48 = L2_33
  L14_45(L15_46, L16_47, L17_48)
  L14_45 = A1_32
  if L14_45 == 1 then
    L16_47 = A0_31
    L15_46 = A0_31.updateRetainerItemPackage
    L15_46(L16_47)
    L15_46 = desktopWidget
    L16_47 = L15_46
    L15_46 = L15_46.openRetainerItemListWidget
    L17_48 = A0_31
    L15_46 = L15_46(L16_47, L17_48)
    L3_34 = L15_46
    if L3_34 == false then
      L15_46 = 0
      L16_47 = nil
      L17_48 = 0
      L21_52 = 0
      do return L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, 0, 0, 0 end
      do break end
      else
      end
      if L14_45 == 3 then
        L15_46 = desktopWidget
        L16_47 = L15_46
        L15_46 = L15_46.closeRetainerItemListWidget
        L17_48 = A0_31
        L15_46(L16_47, L17_48)
        break
      else
      end
      if L14_45 == 2 then
        L16_47 = A0_31
        L15_46 = A0_31.updateRetainerItemPackage
        L15_46(L16_47)
        L15_46 = desktopWidget
        L16_47 = L15_46
        L15_46 = L15_46.selectRetainerItemListWidget
        L17_48 = A0_31
        L11_42, L12_43, L15_46 = 0, 0, L15_46(L16_47, L17_48)
        L11_42, L12_43, L16_47 = 0, 0, L15_46(L16_47, L17_48)
        L11_42, L12_43, L17_48 = 0, 0, L15_46(L16_47, L17_48)
        L11_42, L12_43, L21_52 = 0, 0, L15_46(L16_47, L17_48)
        L10_41 = L21_52
        L9_40 = L20_51
        L8_39 = L19_50
        L7_38 = L18_49
        L6_37 = L17_48
        L5_36 = L16_47
        L4_35 = L15_46
        if L4_35 == 1 then
          L15_46 = 100
          L16_47 = nil
          L17_48 = 0
          L21_52 = 0
          return L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, 0, 0, 0
        elseif L4_35 == 11 then
          L16_47 = A0_31
          L15_46 = A0_31._getItem
          L17_48 = L5_36
          L15_46 = L15_46(L16_47, L17_48, L18_49)
          L13_44 = L15_46
          if L13_44 == nil then
          else
            L16_47 = L13_44
            L15_46 = L13_44._isAlive
            L15_46 = L15_46(L16_47)
            if L15_46 == false then
            else
              L15_46 = L4_35
              L16_47 = L13_44
              L17_48 = 0
              L21_52 = L13_44._countStack
              L21_52 = L21_52(L13_44)
              return L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, 0, L13_44:_getCatalogID(), L13_44:_getNameIndex()
            end
          end
        elseif L4_35 == 12 then
          L16_47 = A0_31
          L15_46 = A0_31._getItem
          L17_48 = L5_36
          L15_46 = L15_46(L16_47, L17_48, L18_49)
          L13_44 = L15_46
          if L13_44 == nil then
          else
            L16_47 = L13_44
            L15_46 = L13_44._isAlive
            L15_46 = L15_46(L16_47)
            if L15_46 == false then
            else
              L15_46 = L4_35
              L16_47 = L13_44
              L17_48 = 0
              L21_52 = L13_44._countStack
              L21_52 = L21_52(L13_44)
              return L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, 0, L13_44:_getCatalogID(), L13_44:_getNameIndex()
            end
          end
        elseif L4_35 == 13 then
          L16_47 = A0_31
          L15_46 = A0_31._getItem
          L17_48 = L5_36
          L15_46 = L15_46(L16_47, L17_48, L18_49)
          L13_44 = L15_46
          if L13_44 == nil then
          else
            L16_47 = L13_44
            L15_46 = L13_44._isAlive
            L15_46 = L15_46(L16_47)
            if L15_46 == false then
            else
              L15_46 = L4_35
              L16_47 = L13_44
              L17_48 = 0
              L21_52 = L13_44._countStack
              L21_52 = L21_52(L13_44)
              return L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, 0, L13_44:_getCatalogID(), L13_44:_getNameIndex()
            end
          end
        elseif L4_35 == 21 then
          L16_47 = A0_31
          L15_46 = A0_31._getItem
          L17_48 = L5_36
          L15_46 = L15_46(L16_47, L17_48, L18_49)
          L13_44 = L15_46
          if L13_44 == nil then
          else
            L16_47 = L13_44
            L15_46 = L13_44._isAlive
            L15_46 = L15_46(L16_47)
            if L15_46 == false then
            else
              L15_46 = type
              L16_47 = L11_42
              L15_46 = L15_46(L16_47)
              if L15_46 ~= "number" then
                L16_47 = L13_44
                L15_46 = L13_44._countStack
                L15_46 = L15_46(L16_47)
                L11_42 = L15_46
              end
              if L7_38 == 20 or L7_38 == 30 then
                if L9_40 == 0 then
                  L16_47 = A0_31
                  L15_46 = A0_31._getItem
                  L17_48 = 100
                  L15_46 = L15_46(L16_47, L17_48, L18_49)
                  L17_48 = A0_31
                  L16_47 = A0_31._hasItemPackage
                  L16_47 = L16_47(L17_48, L18_49)
                  if L16_47 == true then
                    L17_48 = A0_31
                    L16_47 = A0_31._getItemPackageCapacity
                    L16_47 = L16_47(L17_48, L18_49)
                    if L16_47 > 0 then
                      L17_48 = nil
                      for L21_52 = 1, L16_47 do
                        if A0_31:_getItem(100, L21_52) ~= nil and A0_31:_getItem(100, L21_52):_getCatalogID() == 1000001 then
                          L15_46 = A0_31:_getItem(100, L21_52)
                          break
                        end
                      end
                    end
                  end
                  L16_47 = L4_35
                  L17_48 = L15_46
                  L21_52 = L5_36
                  return L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, L8_39, L11_42, L15_46:_getCatalogID(), L15_46:_getNameIndex()
                else
                  L16_47 = A0_31
                  L15_46 = A0_31._getItem
                  L17_48 = L9_40
                  L15_46 = L15_46(L16_47, L17_48, L18_49)
                  if L15_46 == nil then
                  else
                    L17_48 = L15_46
                    L16_47 = L15_46._isAlive
                    L16_47 = L16_47(L17_48)
                    if L16_47 == false then
                    else
                      L16_47 = type
                      L17_48 = L12_43
                      L16_47 = L16_47(L17_48)
                      if L16_47 ~= "number" then
                        L17_48 = L15_46
                        L16_47 = L15_46._countStack
                        L16_47 = L16_47(L17_48)
                        L12_43 = L16_47
                      end
                      L16_47 = L4_35
                      L17_48 = L15_46
                      L21_52 = L5_36
                      return L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, L12_43, L11_42, L15_46:_getCatalogID(), L15_46:_getNameIndex()
                    end
                  end
                end
              else
                L15_46 = L4_35
                L16_47 = L13_44
                L17_48 = L7_38
                L21_52 = L11_42
                do return L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, L8_39, L13_44:_getCatalogID(), L13_44:_getNameIndex() end
                break
              end
            end
          end
        else
          if L4_35 == 22 then
            L16_47 = A0_31
            L15_46 = A0_31._getItem
            L17_48 = L5_36
            L15_46 = L15_46(L16_47, L17_48, L18_49)
            L13_44 = L15_46
            if L13_44 == nil then
            else
              L16_47 = L13_44
              L15_46 = L13_44._isAlive
              L15_46 = L15_46(L16_47)
              if L15_46 == false then
              else
                L16_47 = L13_44
                L15_46 = L13_44._getDealingAttached
                L17_48 = L15_46(L16_47)
                if L18_49 == true then
                  L17_48 = L18_49
                end
                L21_52 = 0
                do return L18_49, L19_50, L20_51, L21_52, L13_44:_getPackage(), 0, L13_44:_countStack(), L17_48, L13_44:_getCatalogID(), L13_44:_getNameIndex() end
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
  L14_45 = 2
  L15_46 = nil
  L16_47 = 0
  L17_48 = 0
  L21_52 = 0
  return L14_45, L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, 0, 0
end
function OrdinaryRetainer.sayToPlayer(A0_53, A1_54, A2_55, A3_56)
  local L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65
  L4_57 = type
  L5_58 = A1_54
  L4_57 = L4_57(L5_58)
  if L4_57 ~= "number" then
    L4_57 = worldMaster
    L5_58 = L4_57
    L4_57 = L4_57._getMyPlayer
    L4_57 = L4_57(L5_58)
    if L4_57 == nil then
      L5_58 = false
      return L5_58
    end
    L6_59 = L4_57
    L5_58 = L4_57._getGroup
    L7_60 = 80001
    L5_58 = L5_58(L6_59, L7_60)
    if L5_58 == nil then
      L6_59 = false
      return L6_59
    end
    L7_60 = L5_58
    L6_59 = L5_58._countMember
    L6_59 = L6_59(L7_60)
    L7_60 = 1
    L8_61 = 0
    for L12_65 = 1, L6_59 do
      if L5_58:_getMember(L12_65) == A0_53 then
        L8_61 = L12_65
        break
      end
    end
    if L8_61 == 0 then
      return L9_62
    end
    A1_54 = L9_62
  end
  L4_57 = A1_54 - 3001101
  if A1_54 >= 3003101 then
    L4_57 = A1_54 - 3003101
  elseif A1_54 >= 3002101 then
    L4_57 = A1_54 - 3002101
  elseif A1_54 >= 3001101 then
    L4_57 = A1_54 - 3001101
  end
  L5_58 = _math
  L5_58 = L5_58.floor
  L6_59 = L4_57 / 5
  L5_58 = L5_58(L6_59)
  L6_59 = _math
  L6_59 = L6_59.fmod
  L7_60 = L4_57
  L8_61 = 5
  L6_59 = L6_59(L7_60, L8_61)
  L7_60 = -1
  L8_61 = L5_58
  if L8_61 == 0 then
    L7_60 = 0
    break
  else
  end
  if L8_61 == 1 then
    L7_60 = 1
    break
  else
  end
  if L8_61 == 2 then
    L7_60 = 8
    break
  elseif L8_61 == 3 then
  else
  end
  if L8_61 == 5 then
    L7_60 = 2
    break
  elseif L8_61 == 4 then
  else
  end
  if L8_61 == 6 then
    L7_60 = 3
    break
  elseif L8_61 == 7 then
  else
  end
  if L8_61 == 9 then
    L7_60 = 4
    break
  elseif L8_61 == 8 then
  else
  end
  if L8_61 == 10 then
    L7_60 = 5
    break
  elseif L8_61 == 11 then
  else
  end
  if L8_61 == 12 then
    L7_60 = 6
    break
  elseif L8_61 == 13 then
  else
  end
  if L8_61 == 14 then
    L7_60 = 7
    do break end
    break
  else
  end
  if L7_60 < 0 then
    L8_61 = false
    return L8_61
  end
  L8_61 = 0
  if L9_62 == 1 then
    L8_61 = 2
    break
  else
  end
  if L9_62 == 2 then
    L8_61 = 102
    break
  else
  end
  if L9_62 == 3 then
    L8_61 = 202
    break
  else
  end
  if L9_62 == 4 then
    L8_61 = 302
    break
  else
  end
  if L9_62 == 5 then
    L8_61 = 402
    break
  else
  end
  if L9_62 == 6 then
    L8_61 = 502
    break
  else
  end
  if L9_62 == 7 then
    L8_61 = 602
    break
  else
  end
  if L9_62 == 8 then
    L8_61 = 702
    break
  else
  end
  if L9_62 == 9 then
    L8_61 = 802
    break
  else
  end
  if L9_62 == 10 then
    L8_61 = 902
    break
  else
  end
  L8_61 = 0
  do break end
  if L8_61 ~= 0 then
    L12_65 = A0_53
    L11_64(L12_65, A0_53, L10_63, 0, A3_56)
    return L11_64
  end
  return L9_62
end
function OrdinaryRetainer.eventReturnResult(A0_66, A1_67, A2_68)
  local L3_69
  L3_69 = A1_67
  if L3_69 == 31 then
    desktopWidget:noticeRetainerTradeResult(31, A2_68)
    break
  else
  end
  if L3_69 == 32 then
    desktopWidget:noticeRetainerTradeResult(32, A2_68)
    do break end
    break
  else
  end
end
function OrdinaryRetainer.eventTalkFinish(A0_70)
  A0_70:finishCliantTalkTurn()
end
function OrdinaryRetainer.eventPlayerTurn(A0_71, A1_72)
  if worldMaster:_getMyPlayer() ~= nil then
    worldMaster:_getMyPlayer():_turnDir(A1_72)
  end
end
