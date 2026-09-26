require("/Chara/Npc/NpcBaseClass")
_defineClass("ObjectEventDoor", "NpcBaseClass")
function ObjectEventDoor.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(200, "objectEventDoor")
end
function ObjectEventDoor.eventDoorMoveAsk(A0_1)
  return (A0_1:askExtendWidget(A0_1, 1, 2, 1, 1))
end
