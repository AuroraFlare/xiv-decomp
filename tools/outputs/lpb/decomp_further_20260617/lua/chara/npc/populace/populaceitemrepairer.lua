require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceItemRepairer", "NpcBaseClass")
function PopulaceItemRepairer.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
  A0_0:_loadTextDataPermanently(2204, "populaceItemRepairer")
  A0_0:_setGroundOn(false)
end
function PopulaceItemRepairer.talkWelcome(A0_3, A1_4, A2_5, A3_6, A4_7)
  local L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14
  L6_9 = A0_3
  L5_8 = A0_3.startCliantTalkTurn
  L7_10 = 2
  L8_11 = A1_4
  L5_8(L6_9, L7_10, L8_11)
  L6_9 = A0_3
  L5_8 = A0_3.getActorClassId
  L5_8 = L5_8(L6_9)
  L6_9 = true
  L7_10, L8_11 = nil, nil
  L9_12 = L5_8
  if L9_12 == 1500114 then
    L7_10 = 37
    L8_11 = 38
    break
  else
  end
  if L9_12 == 1500115 then
    L7_10 = 44
    L8_11 = 45
    break
  else
  end
  if L9_12 == 1500116 then
    L7_10 = 51
    L8_11 = 52
    break
  elseif L9_12 == 1500259 then
  elseif L9_12 == 1500249 then
  elseif L9_12 == 1500245 then
  elseif L9_12 == 1500246 then
  else
  end
  if L9_12 == 1500242 then
    if A3_6 ~= 20 then
      L7_10 = 102
      L8_11 = nil
    else
      L7_10 = 87
      L8_11 = nil
      do break end
      elseif L9_12 == 1500239 then
      elseif L9_12 == 1500261 then
      elseif L9_12 == 1500256 then
      elseif L9_12 == 1500251 then
      else
      end
      if L9_12 == 1500243 then
        if A4_7 == true then
          L7_10 = 102
          L8_11 = nil
        else
          L7_10 = 87
          L8_11 = nil
          do break end
          elseif L9_12 == 1500241 then
          elseif L9_12 == 1500258 then
          elseif L9_12 == 1500254 then
          elseif L9_12 == 1500237 then
          else
          end
          if L9_12 == 1500240 then
            if A3_6 == 20 then
              L7_10 = 102
              L8_11 = nil
            else
              L7_10 = 87
              L8_11 = nil
              do break end
              L7_10 = 87
              L8_11 = nil
              L6_9 = false
              break
            end
          else
          end
        end
    end
  if A2_5 == true then
    if L7_10 ~= nil then
      L10_13 = A0_3
      L9_12 = A0_3.say
      L11_14 = A0_3
      L9_12(L10_13, L11_14, L7_10, 0)
    end
    if L8_11 ~= nil then
      L10_13 = A0_3
      L9_12 = A0_3.say
      L11_14 = A0_3
      L9_12(L10_13, L11_14, L8_11, 0)
    end
  end
  L9_12 = true
  while true do
    if L9_12 == true then
      L10_13 = nil
      if L6_9 == true then
        L11_14 = A0_3.askExtendWidget
        L11_14 = L11_14(A0_3, A0_3, 1, 4, 1, 1)
        L10_13 = L11_14
      else
        L11_14 = {2, 5}
        L10_13 = desktopWidget:askForEventMode(A0_3, A0_3, A0_3, 1, false, true, 1, L11_14)
        if L10_13 ~= 1 then
          L10_13 = 0
        end
      end
      if L10_13 == 1 then
        L11_14 = L5_8
        if L11_14 == 1500114 then
          A0_3:say(A0_3, 39, 0)
          break
        else
        end
        if L11_14 == 1500115 then
          A0_3:say(A0_3, 46, 0)
          break
        else
        end
        if L11_14 == 1500116 then
          A0_3:say(A0_3, 53, 0)
          do break end
          break
        else
        end
        return L10_13
      end
      if L10_13 == 2 then
        L11_14 = L5_8
        if L11_14 == 1500114 then
          A0_3:say(A0_3, 40, 0)
          break
        else
        end
        if L11_14 == 1500115 then
          A0_3:say(A0_3, 47, 0)
          break
        else
        end
        if L11_14 == 1500116 then
          A0_3:say(A0_3, 54, 0)
          do break end
          break
        else
        end
        return L10_13
      end
      if L10_13 == 3 then
        L11_14 = L5_8
        if L11_14 == 1500114 then
          A0_3:say(A0_3, 41, 0)
          break
        else
        end
        if L11_14 == 1500115 then
          A0_3:say(A0_3, 48, 0)
          break
        else
        end
        if L11_14 == 1500116 then
          A0_3:say(A0_3, 55, 0)
          do break end
          break
        else
        end
        L11_14 = A0_3.readRepairManual
        L11_14 = L11_14(A0_3, A1_4)
        if L11_14 == false then
          if L5_8 == 1500114 then
            A0_3:say(A0_3, 42, 0)
            break
          else
          end
          if L5_8 == 1500115 then
            A0_3:say(A0_3, 49, 0)
            do break end
            break
          end
          if L5_8 == 1500116 then
            A0_3:say(A0_3, 56, 0)
            do break end
            break
          end
        end
      end
      L11_14 = L5_8
      if L11_14 == 1500114 then
        A0_3:say(A0_3, 43, 0)
        break
      else
      end
      if L11_14 == 1500115 then
        A0_3:say(A0_3, 50, 0)
        break
      else
      end
      if L11_14 == 1500116 then
        A0_3:say(A0_3, 57, 0)
        do break end
        break
      else
      end
      L9_12 = false
    end
  end
  return
end
function PopulaceItemRepairer.readRepairManual(A0_15, A1_16)
  local L2_17
  L2_17 = A0_15.askExtendWidget
  L2_17 = L2_17(A0_15, A0_15, 58, 2, 1, 1)
  if L2_17 == 1 then
    while true == true do
      L2_17 = A0_15:askExtendWidget(A0_15, 61, 5, 1, 1)
      if L2_17 == 1 then
        worldMaster:say(A0_15, 67)
        worldMaster:say(A0_15, 68)
        worldMaster:say(A0_15, 69)
      elseif L2_17 == 2 then
        worldMaster:say(A0_15, 70)
        worldMaster:say(A0_15, 71)
        worldMaster:say(A0_15, 72)
        worldMaster:say(A0_15, 73)
        worldMaster:say(A0_15, 74)
        worldMaster:say(A0_15, 75)
        worldMaster:say(A0_15, 76)
        worldMaster:say(A0_15, 98)
        worldMaster:say(A0_15, 99)
        worldMaster:say(A0_15, 100)
        worldMaster:say(A0_15, 101)
      elseif L2_17 == 3 then
        worldMaster:say(A0_15, 77)
        worldMaster:say(A0_15, 78)
        worldMaster:say(A0_15, 79)
        worldMaster:say(A0_15, 80)
        worldMaster:say(A0_15, 81)
      elseif L2_17 == 4 then
        worldMaster:say(A0_15, 82)
        worldMaster:say(A0_15, 83)
        worldMaster:say(A0_15, 84)
        worldMaster:say(A0_15, 85)
        worldMaster:say(A0_15, 86)
      else
      end
    end
    return true
  else
    return false
  end
end
function PopulaceItemRepairer.selectItem(A0_18, A1_19, A2_20, A3_21, A4_22, A5_23, A6_24, A7_25, A8_26, A9_27)
  local L10_28, L11_29, L12_30, L13_31
  L11_29 = {}
  L12_30 = A2_20
  if L12_30 == 1 then
    if A9_27 == false then
      L10_28 = 88
      L13_31 = {
        33,
        34,
        35,
        36,
        18
      }
      L11_29 = L13_31
    else
      L10_28 = 88
      L13_31 = {
        13,
        14,
        15,
        16,
        18
      }
      L11_29 = L13_31
      do break end
      else
      end
      if L12_30 == 2 then
        L10_28 = 88
        L13_31 = {
          20,
          21,
          23,
          25,
          26
        }
        L11_29 = L13_31
        break
      else
      end
      L10_28 = 88
      L13_31 = {
        89,
        90,
        92,
        94,
        95
      }
      L11_29 = L13_31
      break
    end
  L12_30 = nil
  L13_31 = desktopWidget
  L13_31 = L13_31.askForEventMode
  L13_31 = L13_31(L13_31, A0_18, A0_18, A0_18, A3_21, true, true, L10_28, L11_29, A2_20, 3, 0, 0, 0, A4_22, A5_23, A6_24, A7_25, A8_26)
  L12_30 = L13_31
  L13_31 = A2_20
  if L12_30 == -1 then
    L13_31 = A2_20 + 1
    if L13_31 > 3 then
      L13_31 = 1
    end
    return nil, L13_31, 1
  elseif L12_30 == -2 then
    L13_31 = A2_20 - 1
    if L13_31 < 1 then
      L13_31 = 3
    end
    return nil, L13_31, 1
  elseif L12_30 == -3 then
    return nil, nil, nil
  end
  if A2_20 == 1 then
    if L12_30 == 1 then
      return nil, nil, nil
    elseif L12_30 == 2 then
      return -1, L13_31, L12_30
    end
  end
  return 5 * A2_20 + L12_30 - 7, L13_31, L12_30
end
function PopulaceItemRepairer.confirmRepairItem(A0_32, A1_33, A2_34, A3_35, A4_36)
  local L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43, L13_44, L14_45
  L7_38 = A0_32
  L6_37 = A0_32.askExtendWidget
  L8_39 = A0_32
  L9_40 = 6
  L10_41 = 2
  L11_42 = 1
  L12_43 = 1
  L13_44 = A3_35
  L14_45 = A4_36
  L6_37 = L6_37(L7_38, L8_39, L9_40, L10_41, L11_42, L12_43, L13_44, L14_45, A2_34, A1_33:getMoneyOnHand())
  if L6_37 == 1 then
    L7_38 = true
    return L7_38
  end
  L7_38 = false
  return L7_38
end
function PopulaceItemRepairer.confirmUseFacility(A0_46, A1_47, A2_48)
  local L4_49, L5_50, L6_51, L7_52, L8_53, L9_54, L10_55
  L5_50 = A0_46
  L4_49 = A0_46.askExtendWidget
  L6_51 = A0_46
  L7_52 = 9
  L8_53 = 2
  L9_54 = 1
  L10_55 = 1
  L4_49 = L4_49(L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, A2_48, A1_47:getMoneyOnHand())
  if L4_49 == 1 then
    L5_50 = true
    return L5_50
  end
  L5_50 = false
  return L5_50
end
function PopulaceItemRepairer.finishTalkTurn(A0_56)
  A0_56:finishCliantTalkTurn()
end
