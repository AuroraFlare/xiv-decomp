require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGMEventTelepoLure", "NpcBaseClass")
function PopulaceGMEventTelepoLure.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7920, "populaceGMEventTelepoLure")
end
function PopulaceGMEventTelepoLure.telepoLureTalkEvent01_01(A0_1, A1_2)
  A0_1:startCliantTalkTurn(2, A1_2)
  A0_1:say(A0_1, 2, 0)
  A0_1:say(A0_1, 3, 0)
  A0_1:say(A0_1, 4, 0)
  A0_1:finishCliantTalkTurn()
end
