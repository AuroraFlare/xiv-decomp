require("/Chara/Npc/NpcBaseClass")
_defineBaseClass("RetainerBaseClass", "NpcBaseClass")
function RetainerBaseClass.isRetainer(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function RetainerBaseClass.initForEvent(A0_2, ...)
  local L2_4
  L2_4 = A0_2.retainerWork
  L2_4._temp = {
    {
      "lastUpdateItemPackage",
      "integer32"
    },
    {
      "retryRequest",
      "timer",
      true
    },
    {
      "_assignForChild",
      55
    }
  }
  L2_4 = A0_2.retainerWork
  L2_4.lastUpdateItemPackage = worldMaster:_getServerTime()
end
function RetainerBaseClass.processReceiveData(A0_5, A1_6, ...)
  if A1_6 == 1 then
  elseif A1_6 == 2 then
  end
end
function RetainerBaseClass.updateRetainerItemPackage(A0_8)
  if worldMaster:_getServerTime() - A0_8.retainerWork.lastUpdateItemPackage >= 1 then
    A0_8:_updateItemPackage(1)
    A0_8:_updateItemPackage(100)
    A0_8:_updateItemPackage(8)
    A0_8.retainerWork.lastUpdateItemPackage = worldMaster:_getServerTime()
    return true
  elseif type(A0_8.retainerWork.retryRequest) == "nil" then
    A0_8.retainerWork.retryRequest = 1 - (worldMaster:_getServerTime() - A0_8.retainerWork.lastUpdateItemPackage)
  end
  return false
end
function RetainerBaseClass.processTimer(A0_9, A1_10)
  if A1_10 == "retryRequest" and worldMaster:_getServerTime() - A0_9.retainerWork.lastUpdateItemPackage >= 1 then
    A0_9:_updateItemPackage(1)
    A0_9:_updateItemPackage(100)
    A0_9:_updateItemPackage(8)
    A0_9.retainerWork.lastUpdateItemPackage = worldMaster:_getServerTime()
  end
end
