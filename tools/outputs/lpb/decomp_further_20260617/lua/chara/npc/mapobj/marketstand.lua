require("/Chara/Npc/NpcBaseClass")
_defineClass("MarketStand", "NpcBaseClass")
function MarketStand.initForEvent(A0_0, A1_1, A2_2, A3_3)
  if A1_1 == true then
    A0_0:_runBgScheduler("show")
  else
    A0_0:_runBgScheduler("hide")
  end
  A0_0:_runBgScheduler("set" .. ({
    "a",
    "b",
    "c",
    "d"
  })[A2_2])
  A0_0:_runBgScheduler("set" .. tostring(A3_3))
end
function MarketStand._onReaction(A0_4, A1_5, A2_6)
end
function MarketStand.eventPushStepCounter(A0_7, A1_8, A2_9, A3_10)
  local L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22
  L4_11 = worldMaster
  L5_12 = L4_11
  L4_11 = L4_11._getMyPlayer
  L4_11 = L4_11(L5_12)
  L6_13 = L4_11
  L5_12 = L4_11.getMoneyOnHand
  L5_12 = L5_12(L6_13)
  L7_14 = A0_7
  L6_13 = A0_7.askExtendWidget
  L8_15 = worldMaster
  L9_16 = 49072
  L10_17 = 2
  L11_18 = 1
  L15_22 = L5_12
  L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, A3_10, 0, 0)
  if L6_13 ~= 1 then
    L7_14 = 0
    return L7_14
  end
  L8_15 = L4_11
  L7_14 = L4_11.getMoneyOnHand
  L7_14 = L7_14(L8_15)
  if A3_10 > L7_14 then
    L8_15 = worldMaster
    L9_16 = L8_15
    L8_15 = L8_15.say
    L10_17 = worldMaster
    L11_18 = 25065
    L8_15(L9_16, L10_17, L11_18)
    L8_15 = 0
    return L8_15
  end
  L9_16 = L4_11
  L8_15 = L4_11._getGroup
  L10_17 = 80001
  L8_15 = L8_15(L9_16, L10_17)
  if L8_15 == nil then
    L9_16 = 0
    return L9_16
  end
  L10_17 = L8_15
  L9_16 = L8_15._countMember
  L9_16 = L9_16(L10_17)
  if L9_16 < 2 then
    L10_17 = 0
    return L10_17
  end
  L10_17 = desktopWidget
  L11_18 = L10_17
  L10_17 = L10_17.askRetainerListWidget
  L10_17 = L10_17(L11_18, L12_19, L13_20, L14_21)
  L6_13 = L10_17
  L10_17 = 1
  L11_18 = 1
  for L15_22 = 1, L9_16 do
    if L8_15:isPlayerMember(L15_22) == false then
      if L11_18 == L6_13 then
        L6_13 = L15_22
        break
      else
        L11_18 = L11_18 + 1
      end
    end
  end
  return L6_13
end
function MarketStand.eventPushRetainerCallCaution(A0_23)
  if A0_23:askExtendWidget(worldMaster, 49066, 2, 1, 2) ~= 1 then
    return 0
  end
  return (A0_23:askExtendWidget(worldMaster, 49066, 2, 1, 2))
end
function MarketStand.eventPushMakeupCounter(A0_24, A1_25, A2_26)
  local L3_27, L4_28, L5_29, L6_30, L7_31
  L3_27 = worldMaster
  L4_28 = L3_27
  L3_27 = L3_27._getMyPlayer
  L3_27 = L3_27(L4_28)
  L4_28 = 0
  L5_29 = 0
  L6_30 = 0
  L7_31 = {}
  while true do
    L4_28, L5_29 = 0, 0
    L7_31 = {
      49020,
      49021,
      49022,
      25003
    }
    L4_28 = A0_24:askForCustomizeOption(worldMaster, 1, false, true, 49029, L7_31)
    if L4_28 == #L7_31 then
      return 0, 0, 0
    end
    if L4_28 ~= 2 then
      if L4_28 < 0 then
        L4_28 = 0
      end
      return L4_28, 0, 0
    end
    while true do
      while true do
        while true do
          while true do
            L7_31 = {
              49031,
              49041,
              25004,
              25003
            }
            L5_29 = A0_24:askForCustomizeOption(worldMaster, 1, false, true, 49018, L7_31)
            if L5_29 == #L7_31 then
              return 0, 0, 0
            end
            if L5_29 == 1 then
              L7_31 = {
                49032,
                49033,
                49034,
                49035,
                25004,
                25003
              }
              L6_30 = A0_24:askForCustomizeOption(worldMaster, 1, false, true, 49031, L7_31)
              if L6_30 == #L7_31 then
                return 0, 0, 0
              end
              if L6_30 > 0 and L6_30 < #L7_31 - 1 then
                do return L4_28, L5_29, L6_30 end
                if L5_29 == 2 then
                  L7_31 = {
                    49042,
                    49043,
                    49044,
                    49045,
                    49046,
                    49047,
                    49048,
                    49049,
                    25004,
                    25003
                  }
                  L6_30 = A0_24:askForCustomizeOption(worldMaster, 1, false, true, 49041, L7_31)
                  if L6_30 == #L7_31 then
                    return 0, 0, 0
                  end
                  if L6_30 > 0 and L6_30 < #L7_31 - 1 then
                    do return L4_28, L5_29, L6_30 end
                    if L5_29 == 3 then
                      break
                    end
                    break
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return 0, 0, 0
end
function MarketStand.eventPushEndLeaseStand(A0_32, A1_33, A2_34)
  local L3_35
  L3_35 = 0
  L3_35 = A0_32:askForCustomizeOption(worldMaster, 2, false, true, 49027, {25001, 25002}, A2_34, A1_33, 0, 0)
  if L3_35 ~= 1 then
    return 0
  end
  return L3_35
end
function MarketStand.eventPushExpandLeaseStand(A0_36, A1_37, A2_38, A3_39)
  local L4_40, L5_41
  L4_40 = worldMaster
  L5_41 = L4_40
  L4_40 = L4_40._getMyPlayer
  L4_40 = L4_40(L5_41)
  L5_41 = L4_40.getMoneyOnHand
  L5_41 = L5_41(L4_40)
  if A0_36:askExtendWidget(worldMaster, 49075, 2, 1, 2, A2_38, A1_37, L5_41, A3_39, 0, 0) ~= 1 then
    return 0
  end
  return (A0_36:askExtendWidget(worldMaster, 49075, 2, 1, 2, A2_38, A1_37, L5_41, A3_39, 0, 0))
end
function MarketStand.eventPushCheckBazaar(A0_42)
  return (desktopWidget:orderBazaarWidget(1))
end
