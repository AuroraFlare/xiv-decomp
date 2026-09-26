require("/Chara/Npc/NpcBaseClass")
_defineClass("PrivateAreaPastExit", "NpcBaseClass")
function PrivateAreaPastExit.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
end
function PrivateAreaPastExit.getMapMarkerRange(A0_1)
  local L1_2, L2_3
  L1_2 = "exit"
  L2_3 = "caution"
  return L1_2, L2_3
end
