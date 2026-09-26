require("/Chara/Npc/NpcBaseClass")
_defineClass("MapObjOnlyShowHide", "NpcBaseClass")
function MapObjOnlyShowHide.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  if A0_0:getActorClassId() == 5900006 then
    A0_0:_runBgScheduler("show")
  else
    A0_0:_runBgScheduler("hide")
  end
end
