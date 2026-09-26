require("/Chara/Npc/NpcBaseClass")
_defineClass("ObjectBell", "NpcBaseClass")
function ObjectBell.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
end
function ObjectBell.defTalk(A0_3, A1_4)
end
function ObjectBell.isMapMarkerVisibleForTalkable(A0_5)
  local L1_6
  L1_6 = false
  return L1_6
end
