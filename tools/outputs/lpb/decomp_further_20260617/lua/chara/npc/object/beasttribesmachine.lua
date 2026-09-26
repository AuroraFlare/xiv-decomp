require("/Chara/Npc/NpcBaseClass")
_defineClass("BeastTribesMachine", "NpcBaseClass")
function BeastTribesMachine.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
  if A0_0:getActorClassId() == 1200105 or A0_0:getActorClassId() == 1200106 then
    A0_0:_runCharaScheduler(67727360)
  elseif A0_0:getActorClassId() == 1200142 then
    A0_0:_runCharaScheduler(67731456)
  elseif A0_0:getActorClassId() == 1200111 or A0_0:getActorClassId() == 1200112 then
    A0_0:_runCharaScheduler(67727360)
  elseif A0_0:getActorClassId() == 1200143 then
    A0_0:_runCharaScheduler(67731456)
  end
end
function BeastTribesMachine.defTalk(A0_3, A1_4)
end
