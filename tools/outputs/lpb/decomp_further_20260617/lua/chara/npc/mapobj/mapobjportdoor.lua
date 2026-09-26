require("/Chara/Npc/NpcBaseClass")
_defineClass("MapObjPortDoor", "NpcBaseClass")
function MapObjPortDoor.initForEvent(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = {L5_5}
  L5_5 = {"dummy", "integer32"}
  L5_5 = {
    {"layout", "integer16"},
    {"instance", "integer16"}
  }
  A0_0:initWork(L4_4, L5_5)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(175, "mapObjPortDoor")
end
function MapObjPortDoor.eventIn(A0_6, A1_7)
  worldMaster:say(A0_6, 1)
  if worldMaster:ask(A0_6, A0_6, 2, 2) == 1 then
    return true
  else
    return
  end
end
function MapObjPortDoor.eventOut(A0_8, A1_9)
  if worldMaster:ask(A0_8, A0_8, 6, 2) == 1 then
    return true
  else
    return
  end
end
