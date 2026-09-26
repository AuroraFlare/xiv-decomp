require("/Director/InstanceRaid/InstanceRaidBaseClass")
_defineClass("InstanceRaidHamletDefense", "InstanceRaidBaseClass")
function InstanceRaidHamletDefense.setHamletID(A0_0)
  local L1_1, L2_2, L3_3
  L3_3 = A0_0
  L2_2 = A0_0.getContentID
  L2_2 = L2_2(L3_3)
  L3_3 = L2_2
  if L3_3 == 8 then
    L1_1 = 1
    break
  else
  end
  if L3_3 == 9 then
    L1_1 = 2
    break
  else
  end
  if L3_3 == 10 then
    L1_1 = 3
    do break end
    break
  else
  end
  L3_3 = A0_0.work
  L3_3.hamletID = L1_1
end
function InstanceRaidHamletDefense.getGathererBuffTbl(A0_4)
  local L1_5
  L1_5 = {
    1,
    2,
    3
  }
  return L1_5
end
function InstanceRaidHamletDefense.getCrafterBuffTbl(A0_6)
  local L1_7
  L1_7 = {
    4,
    5,
    6
  }
  return L1_7
end
function InstanceRaidHamletDefense.processInitialize(A0_8)
  A0_8.work._temp = {
    {"hamletRank", "integer8"},
    {"hamletID", "integer8"},
    {
      "cargoTarget",
      "integer8"
    },
    {
      "battleValue",
      "integer8"
    },
    {"bossFlag", "boolean"},
    {
      "harvestTbl",
      "array",
      3,
      "integer8"
    },
    {
      "lineStatusTbl",
      "array",
      3,
      "integer8"
    },
    {
      "goodsStatusTbl",
      "array",
      4,
      "integer8"
    },
    {
      "fieldBuffTbl",
      "array",
      6,
      "boolean"
    }
  }
  A0_8:_loadTextDataPermanently(10208, "InstanceRaidHamletDefense")
  A0_8.work.hamletRank = 1
  A0_8.work.cargoTarget = 0
  A0_8.work.battleValue = 0
  A0_8.work.bossFlag = false
  for _FORV_4_ = 1, 3 do
    A0_8.work.harvestTbl[_FORV_4_] = 0
  end
  for _FORV_4_ = 1, 3 do
    A0_8.work.lineStatusTbl[_FORV_4_] = 1
  end
  for _FORV_4_ = 1, 4 do
    A0_8.work.goodsStatusTbl[_FORV_4_] = 1
  end
  for _FORV_4_ = 1, 6 do
    A0_8.work.fieldBuffTbl[_FORV_4_] = false
  end
end
function InstanceRaidHamletDefense.processLogin(A0_9, A1_10)
  A0_9:setHamletID()
end
function InstanceRaidHamletDefense.processStartEffect(A0_11)
  A0_11:printNPCSay(1)
  desktopWidget:openPublicEffectWidget(({
    14,
    15,
    16
  })[A0_11.work.hamletID])
end
function InstanceRaidHamletDefense.processFailedEffect(A0_12)
  A0_12:printNPCSay(3)
  desktopWidget:openPublicEffectWidget(20)
end
function InstanceRaidHamletDefense.localClearEvent(A0_13)
  A0_13:printNPCSay(2)
  if worldMaster:_getMyPlayer():_countHamletDefenseScore() ~= nil then
    desktopWidget:askHamletDefenseScoreWidget(A0_13:getContentID())
  end
end
function InstanceRaidHamletDefense.openInformationWidget(A0_14)
  desktopWidget:openHamletExecutionWidget()
end
function InstanceRaidHamletDefense.processUserMessage(A0_15, A1_16, ...)
  local L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27
  L3_18 = desktopWidget
  L3_18 = L3_18.getHamletExecutionWidget
  L3_18 = L3_18(L4_19)
  if L4_19 == 1 then
    if L3_18 ~= nil then
      L11_26 = ...
      L6_21(L7_22, L8_23, L9_24)
      L11_26 = L8_23(L9_24)
      L6_21(L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L8_23(L9_24))
      L6_21(L7_22)
    else
    end
    return
  else
  end
  if L4_19 == 2 then
    for L8_23 = 1, 3 do
      L11_26 = L8_23
      L9_24[L8_23] = L10_25
    end
    break
  else
  end
  if L4_19 == 3 then
    for L8_23 = 1, 3 do
      L9_24[L8_23] = 0
    end
    if L3_18 ~= nil then
      L5_20(L6_21)
      do break end
      else
      end
      if L4_19 == 4 then
        for L8_23 = 1, 6 do
          L11_26 = L8_23
          L9_24[L8_23] = L10_25
        end
        break
      else
      end
      if L4_19 == 5 then
        for L8_23 = 1, 3 do
          L11_26 = ...
          if L9_24 == 0 then
          else
          end
          L11_26 = A0_15.work
          L11_26 = L11_26.lineStatusTbl
          L11_26[L8_23] = L10_25
        end
        break
      else
      end
      if L4_19 == 6 then
        for L8_23 = 1, 4 do
          L11_26 = L8_23
          L9_24[L8_23] = L10_25
        end
        break
      else
      end
      if L4_19 == 7 then
        L11_26 = ...
        L5_20.cargoTarget = L6_21
        break
      else
      end
      if L4_19 == 8 then
        L5_20.bossFlag = true
        break
      else
      end
      if L4_19 == 9 then
        L11_26 = ...
        L5_20.battleValue = L6_21
        break
      else
      end
      if L4_19 == 10 then
        L11_26 = ...
        L5_20(L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, ...)
        return
      else
      end
    else
    end
  if L3_18 == nil then
    return
  end
  L4_19(L5_20, L6_21, L7_22)
  for L7_22 = 1, 3 do
    L11_26 = A0_15.work
    L11_26 = L11_26.lineStatusTbl
    L11_26 = L11_26[L7_22]
    L8_23(L9_24, L10_25, L11_26)
  end
  for L8_23 = 1, 4 do
    L11_26 = L4_19[L8_23]
    L9_24(L10_25, L11_26, L12_27)
  end
  if L6_21 ~= 0 then
  end
  L6_21(L7_22, L8_23)
  for L9_24 = 1, 3 do
    if L10_25 > 0 then
      L11_26 = L9_24 - 1
      L11_26 = L11_26 * 3
      for _FORV_15_ = 1, L10_25 do
        L11_26 = L11_26 + 1
        L3_18:cmdSetGatheringItem(L11_26)
      end
    end
  end
  for L10_25 = 1, #L6_21 do
    L11_26 = 2
    if L12_27 == true then
      L11_26 = 3
    end
    L12_27(L3_18, L10_25, L11_26)
  end
  for L11_26 = 1, #L7_22 do
    L3_18:cmdSetEnemyBuff(L11_26, L12_27)
  end
  if L8_23 == true then
    L8_23(L9_24, L10_25)
  end
end
function InstanceRaidHamletDefense.dispInformation(A0_28, A1_29, ...)
  local L3_31, L4_32, L5_33, L6_34
  L3_31 = desktopWidget
  L4_32 = L3_31
  L3_31 = L3_31.getHamletPopupWidget
  L3_31 = L3_31(L4_32)
  L4_32 = {
    L5_33,
    L6_34,
    {
      13,
      false,
      0
    },
    {
      14,
      false,
      0
    },
    {
      15,
      false,
      0
    },
    {
      16,
      false,
      0
    },
    {
      17,
      false,
      0
    },
    {
      18,
      false,
      0
    },
    {
      19,
      false,
      0
    },
    {
      20,
      false,
      0
    },
    {
      21,
      true,
      1019
    },
    {
      22,
      true,
      1091
    },
    {
      23,
      true,
      1022
    },
    {
      24,
      true,
      1063
    },
    {
      25,
      true,
      1013
    },
    {
      26,
      true,
      1018
    },
    {
      27,
      true,
      1017
    },
    {
      28,
      true,
      1063
    }
  }
  L5_33 = {
    L6_34,
    false,
    0
  }
  L6_34 = 11
  L6_34 = {
    12,
    false,
    0
  }
  L5_33 = L4_32[A1_29]
  L6_34 = L5_33[1]
  if L3_31 ~= nil then
    L3_31:dispInformation(L5_33[2], A0_28.work.hamletID, L5_33[3], A0_28, L6_34, ...)
  end
  worldMaster:notify(A0_28, L6_34, ...)
end
function InstanceRaidHamletDefense.printNPCSay(A0_35, A1_36)
  desktopWidget:showLog(({
    1600146,
    1200220,
    1000062
  })[A0_35.work.hamletID], 35, A0_35, A0_35:getLocalText(A1_36))
end
function InstanceRaidHamletDefense.getLocalText(A0_37, A1_38)
  if A1_38 == 1 then
  elseif A1_38 == 2 then
  else
  end
  if A1_38 == 3 then
    do break end
    break
  else
  end
  return ({
    {
      2,
      5,
      8
    },
    {
      3,
      6,
      9
    },
    {
      4,
      7,
      10
    }
  })[A1_38][A0_37.work.hamletID]
end
