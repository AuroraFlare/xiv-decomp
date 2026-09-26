require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGMEventSageCryer", "NpcBaseClass")
function PopulaceGMEventSageCryer.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(9956, "populaceGMEventSageCryer")
end
function PopulaceGMEventSageCryer.sageTalkEvent01_01(A0_1, A1_2, A2_3)
  A0_1:startCliantTalkTurn(2, A1_2)
  A0_1:say(A0_1, 2, 0)
  A0_1:say(A0_1, 3, 0)
  A0_1:say(A0_1, 4, 0)
  A0_1:say(A0_1, 5, 0)
  A0_1:say(A0_1, 6, 0)
  if A2_3 == 1 then
    A0_1:say(A0_1, 7, 0)
    break
  else
  end
  if A2_3 == 2 then
    A0_1:say(A0_1, 8, 0)
    break
  else
  end
  if A2_3 == 3 then
    A0_1:say(A0_1, 9, 0)
    break
  else
  end
  A0_1:finishCliantTalkTurn()
end
function PopulaceGMEventSageCryer.sageTalkEvent02_01(A0_4, A1_5)
  A0_4:startCliantTalkTurn(2, A1_5)
  A0_4:say(A0_4, 10, 0)
  A0_4:say(A0_4, 11, 0)
  A0_4:say(A0_4, 12, 0)
  A0_4:finishCliantTalkTurn()
end
