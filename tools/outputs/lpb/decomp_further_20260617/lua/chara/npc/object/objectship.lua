require("/Chara/Npc/NpcBaseClass")
_defineClass("ObjectShip", "NpcBaseClass")
function ObjectShip.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
  if A0_0:getActorClassId() == 1200021 then
    A0_0:_runCharaScheduler(67731456)
  elseif A0_0:getActorClassId() == 1200020 then
    A0_0:_runCharaScheduler(67731456)
  end
end
function ObjectShip.defTalk(A0_3, A1_4)
end
