require("/Chara/Npc/NpcBaseClass")
_defineClass("MiningPoint", "NpcBaseClass")
function MiningPoint.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
end
function MiningPoint.isMapMarkerVisibleForTalkable(A0_1)
  if A0_1:getActorClassId() == 1200053 then
  elseif A0_1:getActorClassId() == 1200055 then
  else
  end
  if A0_1:getActorClassId() == 1200057 then
    return true
  else
  end
  return false
end
function MiningPoint.getMapMarkerTypeForTalkable(A0_2)
  if A0_2:getActorClassId() == 1200053 then
    return 10
  else
  end
  if A0_2:getActorClassId() == 1200055 then
    return 11
  else
  end
  if A0_2:getActorClassId() == 1200057 then
    return 12
  else
  end
  return 6
end
