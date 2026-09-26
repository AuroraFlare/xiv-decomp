require("/Chara/Npc/NpcBaseClass")
_defineClass("MapObjTutorial", "NpcBaseClass")
function MapObjTutorial.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  if A0_0:getActorClassId() == 5900017 or A0_0:getActorClassId() == 5900018 or A0_0:getActorClassId() == 5900019 then
    A0_0:_runBgScheduler("clos")
  else
    A0_0:_runBgScheduler("show")
  end
end
