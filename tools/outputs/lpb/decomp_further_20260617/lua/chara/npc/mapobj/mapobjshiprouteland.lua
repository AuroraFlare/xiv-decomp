require("/Chara/Npc/NpcBaseClass")
_defineClass("MapObjShipRouteLand", "NpcBaseClass")
function MapObjShipRouteLand.initForEvent(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = {L5_5}
  L5_5 = {"dummy", "integer32"}
  L5_5 = {
    {"layout", "integer16"},
    {"instance", "integer16"},
    {"baseTerm", "integer32"}
  }
  A0_0:initWork(L4_4, L5_5)
  if A0_0:getActorClassId() == 5900013 then
  else
  end
  if A1_1 == 5145 then
    if worldMaster:_getServerTime() % 600 < 240 then
      A0_0:_runBgSchedulerFromMidstream("fdot", 240 - worldMaster:_getServerTime() % 600)
    end
  elseif worldMaster:_getServerTime() % 600 >= 360 then
    A0_0:_runBgSchedulerFromMidstream("fdin", worldMaster:_getServerTime() % 600 - 360)
  end
  A0_0:_setGroundOn(false)
end
