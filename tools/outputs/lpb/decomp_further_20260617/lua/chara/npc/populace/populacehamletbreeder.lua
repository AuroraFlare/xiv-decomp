require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceHamletBreeder", "NpcBaseClass")
function PopulaceHamletBreeder.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
  A0_0:_loadTextDataPermanently(1334, "populaceHamletBreeder")
end
function PopulaceHamletBreeder.defTalk(A0_3, A1_4)
  A0_3:startCliantTalkTurn(2, A1_4)
  if A0_3:getActorClassId() == 1500011 then
    A0_3:say(A0_3, 1, 0)
  elseif A0_3:getActorClassId() == 1500012 then
    A0_3:say(A0_3, 2, 0)
  elseif A0_3:getActorClassId() == 1500062 then
    A0_3:say(A0_3, 3, 0)
    A0_3:say(A0_3, 9, 0)
  elseif A0_3:getActorClassId() == 1500063 then
    A0_3:say(A0_3, 4, 0)
    A0_3:say(A0_3, 10, 0)
  elseif A0_3:getActorClassId() == 1500064 then
    A0_3:say(A0_3, 5, 0)
    A0_3:say(A0_3, 11, 0)
  elseif A0_3:getActorClassId() == 1500065 then
    A0_3:say(A0_3, 6, 0)
    A0_3:say(A0_3, 12, 0)
  elseif A0_3:getActorClassId() == 1500066 then
    A0_3:say(A0_3, 7, 0)
    A0_3:say(A0_3, 13, 0)
  elseif A0_3:getActorClassId() == 1500067 then
    A0_3:say(A0_3, 8, 0)
    A0_3:say(A0_3, 14, 0)
  end
  A0_3:finishCliantTalkTurn()
end
function PopulaceHamletBreeder.xmas(A0_5, A1_6)
  A0_5:startCliantTalkTurn(2, A1_6)
  if A0_5:getActorClassId() == 1500011 then
    A0_5:say(A0_5, 15, 0)
  elseif A0_5:getActorClassId() == 1500012 then
    A0_5:say(A0_5, 16, 0)
  elseif A0_5:getActorClassId() == 1500062 then
    A0_5:say(A0_5, 17, 0)
  elseif A0_5:getActorClassId() == 1500063 then
    A0_5:say(A0_5, 18, 0)
  elseif A0_5:getActorClassId() == 1500064 then
    A0_5:say(A0_5, 19, 0)
  elseif A0_5:getActorClassId() == 1500065 then
    A0_5:say(A0_5, 20, 0)
  elseif A0_5:getActorClassId() == 1500066 then
    A0_5:say(A0_5, 21, 0)
  elseif A0_5:getActorClassId() == 1500067 then
    A0_5:say(A0_5, 22, 0)
  end
  A0_5:finishCliantTalkTurn()
end
function PopulaceHamletBreeder.select(A0_7, A1_8)
  local L2_9
  return L2_9
end
function PopulaceHamletBreeder.wantTrade(A0_10, A1_11)
  local L2_12
  return L2_12
end
function PopulaceHamletBreeder.wantTradeRenewal(A0_13, A1_14)
  local L2_15
  return L2_15
end
function PopulaceHamletBreeder.goTrade(A0_16, A1_17)
  local L2_18
  return L2_18
end
