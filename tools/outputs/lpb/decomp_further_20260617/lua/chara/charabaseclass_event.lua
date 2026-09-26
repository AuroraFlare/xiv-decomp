local L0_0, L1_1
L0_0 = CharaBaseClass
function L1_1(A0_2)
  return A0_2:hasGameParameter() and A0_2.charaWork.eventTemp.bazaarRetail
end
L0_0.isRetailDealer = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_3)
  return A0_3:hasGameParameter() and A0_3.charaWork.eventTemp.bazaarRepair
end
L0_0.isRepairDealer = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_4)
  return A0_4:hasGameParameter() and A0_4.charaWork.eventTemp.bazaarMateria
end
L0_0.isMateriaAttachDealer = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10
  L3_8 = A0_5
  L2_7 = A0_5.hasGameParameter
  L2_7 = L2_7(L3_8)
  if L2_7 == true then
    L2_7 = _isInstanceOf
    L3_8 = A1_6
    L4_9 = "ItemBaseClass"
    L2_7 = L2_7(L3_8, L4_9)
    if L2_7 == true then
      L3_8 = A0_5
      L2_7 = A0_5._getCurrentAreaMaster
      L2_7 = L2_7(L3_8)
      L3_8 = _isInstanceOf
      L4_9 = L2_7
      L5_10 = "PrivateAreaMasterMarket"
      L3_8 = L3_8(L4_9, L5_10)
      if L3_8 then
        L4_9 = L2_7
        L3_8 = L2_7._getAreaType
        L4_9 = L3_8(L4_9)
        L5_10 = A1_6.isProperMarket
        L5_10 = L5_10(A1_6, L4_9)
        if L5_10 == true then
          L5_10 = A0_5.charaWork
          L5_10 = L5_10.eventSave
          L5_10 = L5_10.bazaarTax
          L5_10 = _math.floor(L5_10 / 2)
          if L5_10 < 1 then
            L5_10 = 1
          end
          return L5_10
        end
      end
    end
    L2_7 = A0_5.charaWork
    L2_7 = L2_7.eventSave
    L2_7 = L2_7.bazaarTax
    return L2_7
  end
  L2_7 = 0
  return L2_7
end
L0_0.getBazaarTax = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_11)
  if A0_11:hasGameParameter() then
    return A0_11.charaWork.eventSave.repairType
  end
  return 0
end
L0_0.getRepairType = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_12)
  if not A0_12:isPlayer() and not A0_12:isRetainer() then
    return 0, 0, 0, 0
  end
  if A0_12:hasGameParameter() == true then
    return A0_12.charaWork.eventTemp.linkshellIcon[1], A0_12.charaWork.eventTemp.linkshellIcon[2], A0_12.charaWork.eventTemp.linkshellIcon[3], A0_12.charaWork.eventTemp.linkshellIcon[4]
  end
  return 0, 0, 0, 0
end
L0_0.getLinkshellIconId = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L1_14 = {
    L2_15,
    L3_16,
    L4_17
  }
  L2_15 = {L3_16, L4_17}
  L3_16 = "bazaar"
  L4_17 = "boolean"
  L3_16 = {L4_17, L5_18}
  L4_17 = "bazaarTax"
  L5_18 = "integer8"
  L4_17 = {L5_18, L6_19}
  L5_18 = "repairType"
  L6_19 = "integer8"
  L2_15 = {}
  L3_16 = {
    L4_17,
    L5_18,
    L6_19,
    {
      "bazaarMateria",
      "boolean"
    }
  }
  L4_17 = {
    L5_18,
    L6_19,
    4,
    "integer16"
  }
  L5_18 = "linkshellIcon"
  L6_19 = "array"
  L5_18 = {L6_19, "boolean"}
  L6_19 = "bazaarRetail"
  L6_19 = {
    "bazaarRepair",
    "boolean"
  }
  L4_17 = {}
  L5_18 = {
    L6_19,
    {
      "linkshellIcon",
      1,
      {
        "eventTemp",
        "linkshellIcon"
      }
    }
  }
  L6_19 = {
    "bazaar",
    1,
    {"eventSave", "bazaar"},
    {
      "eventTemp",
      "bazaarRetail"
    },
    {
      "eventTemp",
      "bazaarRepair"
    },
    {"eventSave", "bazaarTax"},
    {"eventSave", "repairType"},
    {
      "eventTemp",
      "bazaarMateria"
    }
  }
  L6_19 = {}
  return L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
end
L0_0.initEventSyncWork = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_20, A1_21, A2_22)
  if A0_20:_hasItemPackage(A1_21) == false then
    return 0, 0
  end
  if A2_22 < 1 or A2_22 > A0_20:_getItemPackageCapacity(A1_21) then
    return 0, 0
  end
  if A0_20:_getItem(A1_21, A2_22) == nil then
    return 0, 0
  else
    return A0_20:_getItem(A1_21, A2_22):_getCatalogID(), A0_20:_getItem(A1_21, A2_22):_countStack()
  end
end
L0_0.countStackAtIndex = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_23, A1_24)
  return A0_23:_createExtendedTemporaryVirtualItem(A1_24, 1, 1)
end
L0_0.createVirtualItem = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_25, A1_26, A2_27, A3_28)
  if A0_25:_getItem(A2_27, A3_28) ~= nil and A0_25:_getItem(A2_27, A3_28) == A1_26 then
    return true
  end
  return false
end
L0_0.checkSameItem = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_29, A1_30)
  local L2_31, L3_32, L4_33
  L2_31 = passiveGLIconSheet
  L3_32 = L2_31
  L2_31 = L2_31._loadKeyTemporarily
  L4_33 = A1_30
  L2_31(L3_32, L4_33, A1_30)
  L2_31 = passiveGLIconSheet
  L3_32 = L2_31
  L2_31 = L2_31._getData
  L4_33 = A1_30
  L2_31 = L2_31(L3_32, L4_33, 3)
  L3_32 = passiveGLIconSheet
  L4_33 = L3_32
  L3_32 = L3_32._getData
  L3_32 = L3_32(L4_33, A1_30, 4)
  L4_33 = passiveGLIconSheet
  L4_33 = L4_33._getData
  L4_33 = L4_33(L4_33, A1_30, 5)
  return L2_31, L3_32, L4_33
end
L0_0.getPassiveGuildleveIcons = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_34, A1_35, A2_36)
  if A1_35 < 10001 or A1_35 > 10024 then
    return false
  end
  if A2_36 < 10001 or A2_36 > 10024 then
    return false
  end
  if _math.floor((A1_35 - 10001) / 3) + 29 == _math.floor((A2_36 - 10001) / 3) + 29 and _math.fmod(A1_35 - 10001, 3) + 1 >= _math.fmod(A2_36 - 10001, 3) + 1 then
    return true
  end
  return false
end
L0_0.isValidFacility = L1_1
