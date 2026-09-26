require("/Area/AreaBaseClass_layout")
function AreaBaseClass.getZoneName(A0_0)
  return A0_0:_getZoneName()
end
function AreaBaseClass.isNormalZone(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  L2_3 = A0_1
  L1_2 = A0_1._getZoneName
  L1_2 = L1_2(L2_3)
  if L1_2 == "_jail" then
    L2_3 = true
    return L2_3
  end
  if L1_2 == "performanceTest" then
    L2_3 = true
    return L2_3
  end
  L2_3 = string
  L3_4 = L2_3
  L2_3 = L2_3.contains
  L4_5 = L1_2
  L2_3 = L2_3(L3_4, L4_5, "Test")
  if L2_3 or L1_2 == "test" then
    L2_3 = false
    return L2_3
  end
  L2_3 = _string
  L2_3 = L2_3.match
  L3_4 = L1_2
  L4_5 = "^(%l%l%l%d)(%u%l+)(%d+)%l?$"
  L4_5 = L2_3(L3_4, L4_5)
  if L2_3 == nil or L3_4 == nil or L4_5 == nil then
    return false
  end
  L4_5 = tonumber(L4_5)
  if L3_4 == "Field" or L3_4 == "Dungeon" or L3_4 == "Town" or L3_4 == "Market" or L3_4 == "Battle" or L3_4 == "Event" or L3_4 == "Ship" or L3_4 == "Office" or L3_4 == "Inn" or L3_4 == "Hamlet" then
    return true
  end
  return false
end
function AreaBaseClass.isJailZone(A0_6)
  return A0_6:_getZoneName() == "_jail"
end
function AreaBaseClass.isInstanceRaid(A0_7)
  return A0_7.areaWork.isInstanceRaid
end
function AreaBaseClass.isEntranceDesion(A0_8)
  return A0_8.areaWork.isEntranceDesion
end
function AreaBaseClass.initWork(A0_9, A1_10, A2_11)
  A0_9.work._temp = A2_11 or {}
end
function AreaBaseClass.getTempWork(A0_12, A1_13)
  return A0_12.work[A1_13]
end
function AreaBaseClass.getSaveWork(A0_14, A1_15)
  return A0_14.work[A1_15]
end
function AreaBaseClass.setTempWork(A0_16, A1_17, A2_18)
  A0_16.work[A1_17] = A2_18
end
function AreaBaseClass.setSaveWork(A0_19, A1_20, A2_21)
  A0_19.work[A1_20] = A2_21
end
function AreaBaseClass.create(A0_22, A1_23, A2_24, A3_25, A4_26, ...)
  local L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34
  if A1_23 ~= nil then
    L6_28 = _string
    L6_28 = L6_28.sub
    L7_29 = A1_23
    L8_30 = 1
    L9_31 = 1
    L6_28 = L6_28(L7_29, L8_30, L9_31)
    L7_29 = _createActor
    L8_30 = A1_23
    L9_31 = A2_24
    L10_32 = false
    L12_34 = ...
    return L7_29(L8_30, L9_31, L10_32, L11_33, L12_34, ...)
  else
    L6_28 = _string
    L6_28 = L6_28.sub
    L7_29 = A2_24
    L8_30 = 1
    L9_31 = 1
    L6_28 = L6_28(L7_29, L8_30, L9_31)
    L8_30 = A0_22
    L7_29 = A0_22._getZoneName
    L7_29 = L7_29(L8_30)
    L8_30 = {}
    L8_30.Field = "Fld"
    L8_30.Dungeon = "Dgn"
    L8_30.Town = "Twn"
    L8_30.Battle = "Btl"
    L8_30.Test = "Tes"
    L8_30.Event = "Evt"
    L8_30.Ship = "Shp"
    L8_30.Office = "Ofc"
    L8_30.Inn = "Inn"
    L9_31 = _string
    L9_31 = L9_31.gsub
    L10_32 = L7_29
    L11_33 = "(%u%l+)"
    L12_34 = L8_30
    L9_31 = L9_31(L10_32, L11_33, L12_34)
    L7_29 = L9_31
    L9_31 = _isInstanceOf
    L10_32 = A0_22
    L11_33 = "PrivateAreaBaseClass"
    L9_31 = L9_31(L10_32, L11_33)
    if L9_31 then
      L10_32 = A0_22
      L9_31 = A0_22.isNormalZone
      L9_31 = L9_31(L10_32)
      if L9_31 then
        L9_31 = _string
        L9_31 = L9_31.gsub
        L10_32 = L7_29
        L11_33 = "(%l)$"
        L12_34 = "P"
        L9_31 = L9_31(L10_32, L11_33, L12_34)
        L7_29 = L9_31
      else
        L9_31 = L7_29
        L10_32 = "P"
        L7_29 = L9_31 .. L10_32
      end
    end
    L9_31 = A2_24
    L10_32 = {}
    L10_32.Populace = "Ppl"
    L10_32.Monster = "Mon"
    L10_32.Crowd = "Crd"
    L10_32.MapObj = "Map"
    L10_32.Object = "Obj"
    L10_32.Retainer = "Rtn"
    L10_32.Standard = "Std"
    L11_33 = _string
    L11_33 = L11_33.gsub
    L12_34 = L9_31
    L11_33 = L11_33(L12_34, "(%u%l+)", L10_32)
    L9_31 = L11_33
    L11_33 = _string
    L11_33 = L11_33.sub
    L12_34 = L9_31
    L11_33 = L11_33(L12_34, 1, 20 - #L7_29)
    L9_31 = L11_33
    L11_33 = string
    L12_34 = L11_33
    L11_33 = L11_33.lowerCamelCase
    L11_33 = L11_33(L12_34, L9_31)
    L12_34 = "_"
    L11_33 = L11_33 .. L12_34 .. L7_29 .. "_"
    L12_34 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    repeat
      A0_22.areaWork.actorNumber = (A0_22.areaWork.actorNumber + 1) % (#L12_34 * #L12_34)
      A1_23 = L11_33 .. _string.sub(L12_34, 1 + _math.floor(A0_22.areaWork.actorNumber / #L12_34), 1 + _math.floor(A0_22.areaWork.actorNumber / #L12_34)) .. _string.sub(L12_34, 1 + A0_22.areaWork.actorNumber % #L12_34, 1 + A0_22.areaWork.actorNumber % #L12_34)
    until _canCreateActorByName(A1_23)
    return _createActor(A1_23, A2_24, false, ...)
  end
end
function AreaBaseClass._onInit(A0_35, A1_36, A2_37, A3_38)
  A0_35:_callSuperClassFunc("_onInit")
  A0_35.areaWork._temp = {
    {
      "actorNumber",
      "integer16"
    },
    {
      "isInstanceRaid",
      "boolean"
    },
    {
      "isEntranceDesion",
      "boolean"
    },
    {
      "_assignForChild",
      64
    }
  }
  A0_35.areaWork.isInstanceRaid = A2_37
  A0_35.areaWork.isEntranceDesion = A3_38
  A0_35:_setInstanceRaid(A2_37)
  A0_35:_setLoopInterval(1)
  if not _isExistActor("desktopWidget") then
    A0_35:loadCommonTableData(A0_35:_getRegion(), A0_35:_getZoneName(), nil)
    A0_35:_loadSpreadSheetPermanently()
  end
  if A0_35:_isInn() and _isExistActor("cutReplaySheet") == false then
    cutReplaySheet = _createActor("cutReplaySheet", "SpreadSheet", true, "cutReplay")
  end
end
function AreaBaseClass.prepareSpreadSheet(A0_39, A1_40, A2_41)
  local L3_42
  if not A2_41 then
    L3_42 = A1_40
    L3_42 = _string.gsub(L3_42, ".+/", "")
    L3_42 = string:lowerCamelCase(unpack(string:split(L3_42, "_")))
    L3_42 = L3_42 .. "Sheet"
  end
  if _isExistActor(L3_42) then
    return _getActorByName(L3_42)
  end
  return (_createActor(L3_42, "SpreadSheet", L3_42 ~= nil, A1_40))
end
function AreaBaseClass._onLoop(A0_43, A1_44)
  do break end
  do return end
  A0_43:processLoop()
end
function AreaBaseClass.processLoop(A0_45)
  local L1_46
end
function AreaBaseClass._onFinalize(A0_47)
  A0_47:_callSuperClassFunc("_onFinalize")
  if A0_47:_isInn() and _isExistActor("cutReplaySheet") then
    cutReplaySheet:_delete()
  end
end
