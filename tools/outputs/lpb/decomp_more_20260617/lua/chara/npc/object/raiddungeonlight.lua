require("/Chara/Npc/NpcBaseClass")
_defineClass("RaidDungeonLight", "NpcBaseClass")
function RaidDungeonLight.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(6813, "raidDungeonLight")
end
function RaidDungeonLight.isMapMarkerVisibleForTalkable(A0_1)
  local L1_2
  L1_2 = false
  return L1_2
end
function RaidDungeonLight.askYesNo(A0_3)
  local L1_4
  L1_4 = A0_3:askExtendWidget(A0_3, 1, 2, 1, 1)
  return L1_4
end
