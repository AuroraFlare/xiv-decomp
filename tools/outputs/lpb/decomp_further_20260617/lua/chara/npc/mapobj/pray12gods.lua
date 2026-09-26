require("/Chara/Npc/NpcBaseClass")
_defineClass("Pray12Gods", "NpcBaseClass")
function Pray12Gods.initForEvent(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = {L4_4}
  L4_4 = {"dummy", "integer32"}
  L4_4 = {
    {"layout", "integer16"},
    {"instance", "integer16"}
  }
  A0_0:initWork(L3_3, L4_4)
  A0_0:_setGroundOn(false)
  A0_0:_setMapObjScale(10, 5, 10)
end
function Pray12Gods.isMapMarkerVisibleForTalkable(A0_5)
  local L1_6
  L1_6 = false
  return L1_6
end
function Pray12Gods._onEmoteEvent(A0_7, A1_8, A2_9)
  A0_7:_callServerOnEmote(A1_8, A2_9)
  A1_8:_setLockonTarget(nil)
  desktopWidget:cancelAllTarget()
end
