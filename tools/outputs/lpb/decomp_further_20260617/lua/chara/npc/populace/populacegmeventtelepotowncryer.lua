require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGMEventTelepoTownCryer", "NpcBaseClass")
function PopulaceGMEventTelepoTownCryer.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7936, "populaceGMEventTelepoTownCryer")
end
function PopulaceGMEventTelepoTownCryer.telepoCryerTalkEvent01_01(A0_1, A1_2, A2_3)
  A0_1:startCliantTalkTurn(2, A1_2)
  A0_1:say(A0_1, 2, 0)
  A0_1:say(A0_1, 3, 0)
  A0_1:say(A0_1, 4, 0, A2_3)
  A0_1:finishCliantTalkTurn()
end
