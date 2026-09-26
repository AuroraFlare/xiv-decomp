require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGMEventTelepoGateOut", "NpcBaseClass")
function PopulaceGMEventTelepoGateOut.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7968, "populaceGMEventTelepoGateOut")
end
function PopulaceGMEventTelepoGateOut.telepoGateOutTalkEvent01_01(A0_1, A1_2, A2_3)
  A0_1:startCliantTalkTurn(2, A1_2)
  worldMaster:say(A0_1, 1, A2_3)
  A0_1:finishCliantTalkTurn()
  return (A0_1:askExtendWidget(A0_1, 2, 2, 1, 2, A2_3))
end
