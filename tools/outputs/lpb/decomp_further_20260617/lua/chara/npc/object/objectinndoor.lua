require("/Chara/Npc/NpcBaseClass")
_defineClass("ObjectInnDoor", "NpcBaseClass")
function ObjectInnDoor.isMapMarkerVisibleForTalkable(A0_0)
  local L1_1
  L1_1 = false
  return L1_1
end
function ObjectInnDoor.innDoorAsk(A0_2, A1_3)
  if A0_2:askExtendWidget(worldMaster, 60013, 2, 1, 1) == 1 then
    return (A0_2:askExtendWidget(worldMaster, 60013, 2, 1, 1))
  else
  end
end
