require("/Chara/Npc/NpcBaseClass")
_defineClass("MarketEntrance", "NpcBaseClass")
function MarketEntrance.initForEvent(A0_0)
  local L1_1
end
function MarketEntrance.eventPushChoiceAreaOrQuest(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8)
  local L7_9, L8_10, L9_11, L10_12, L11_13
  L7_9 = 0
  L8_10 = {}
  L9_11 = {}
  if A1_3 ~= 0 then
    L7_9 = L7_9 + 1
    L8_10[L7_9] = 60007
    L9_11[L7_9] = A1_3
  end
  if A2_4 ~= 0 then
    L7_9 = L7_9 + 1
    L8_10[L7_9] = 60007
    L9_11[L7_9] = A2_4
    L11_13 = A0_2
    L10_12 = A0_2._getCurrentAreaMaster
    L10_12 = L10_12(L11_13)
    L11_13 = L10_12._getRegion
    L11_13 = L11_13(L10_12)
    if _isInstanceOf(L10_12, "PrivateAreaMasterBranch") == true then
      if L11_13 ~= 202 then
        L7_9 = L7_9 + 1
        L8_10[L7_9] = 60007
        L9_11[L7_9] = 1519
      end
      if L11_13 ~= 204 then
        L7_9 = L7_9 + 1
        L8_10[L7_9] = 60007
        L9_11[L7_9] = 2534
      end
      if L11_13 ~= 205 then
        L7_9 = L7_9 + 1
        L8_10[L7_9] = 60007
        L9_11[L7_9] = 3533
      end
    else
      L7_9 = L7_9 + 1
      L8_10[L7_9] = 60007
      L9_11[L7_9] = 1519
      L7_9 = L7_9 + 1
      L8_10[L7_9] = 60007
      L9_11[L7_9] = 2534
      L7_9 = L7_9 + 1
      L8_10[L7_9] = 60007
      L9_11[L7_9] = 3533
    end
  end
  if A3_5 ~= 0 then
    L7_9 = L7_9 + 1
    L8_10[L7_9] = 60007
    L9_11[L7_9] = A3_5
  end
  if A4_6 ~= 0 then
    L7_9 = L7_9 + 1
    L8_10[L7_9] = 60007
    L9_11[L7_9] = A4_6
  end
  if A5_7 == true then
    L7_9 = L7_9 + 1
    L8_10[L7_9] = 60009
    L9_11[L7_9] = 0
    if A6_8 ~= 0 and A6_8 ~= nil then
      L7_9 = L7_9 + 1
      L8_10[L7_9] = 60010
      L9_11[L7_9] = A6_8
    end
  end
  L7_9 = L7_9 + 1
  L8_10[L7_9] = 25003
  L9_11[L7_9] = 0
  L10_12 = 1
  L11_13 = 1
  if A1_3 ~= 0 and A2_4 ~= 0 then
    L11_13 = 2
  end
  while L10_12 ~= #L8_10 and L10_12 ~= nil and L10_12 > 0 do
    L10_12 = desktopWidget:askMarketSelectWidget(A0_2, A0_2, worldMaster, L11_13, true, 60002, L8_10, unpack(L9_11))
    if L10_12 ~= nil and L10_12 > 0 and L10_12 <= #L8_10 then
      if A5_7 == true then
        if A6_8 ~= 0 and A6_8 ~= nil then
          if L10_12 + 2 == #L8_10 then
            desktopWidget:askItemSearchWidget()
            return -2
          elseif L10_12 + 1 == #L8_10 then
            return -1
          else
            return L9_11[L10_12]
          end
        elseif L10_12 + 1 == #L8_10 then
          desktopWidget:askItemSearchWidget()
          return -2
        else
          return L9_11[L10_12]
        end
      else
        return L9_11[L10_12]
      end
    end
  end
  return L10_12
end
function MarketEntrance.eventPushStepPrvMarket(A0_14, A1_15, A2_16, A3_17)
  local L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31
  L4_18 = 0
  L5_19 = {}
  L6_20 = {}
  L7_21 = 0
  for L11_25 = A1_15, L9_23 - 1 do
    if L11_25 ~= A3_17 then
      L4_18 = L4_18 + 1
      L5_19[L4_18] = 60007
      L6_20[L4_18] = L11_25
    end
  end
  L11_25 = A0_14
  L12_26 = A0_14
  L13_27 = worldMaster
  L14_28 = 1
  L15_29 = true
  L16_30 = 60002
  L17_31 = L5_19
  if L8_22 > 0 then
    if L8_22 <= L9_23 then
      return L9_23
    end
  end
  return L8_22
end
