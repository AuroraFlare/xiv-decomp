require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGMEventTelepoGateIn", "NpcBaseClass")
function PopulaceGMEventTelepoGateIn.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7952, "populaceGMEventTelepoGateIn")
end
function PopulaceGMEventTelepoGateIn.telepoGateInTalkEvent01_01(A0_1, A1_2)
  A0_1:startCliantTalkTurn(2, A1_2)
  worldMaster:say(A0_1, 1)
  A0_1:finishCliantTalkTurn()
  return (A0_1:askExtendWidget(A0_1, 2, 2, 1, 2))
end
