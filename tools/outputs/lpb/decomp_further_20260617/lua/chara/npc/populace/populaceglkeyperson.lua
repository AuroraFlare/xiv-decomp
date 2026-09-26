require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGLKeyPerson", "NpcBaseClass")
function PopulaceGLKeyPerson.initForEvent(A0_0)
  local L1_1
  L1_1 = {
    {"talkStep", "integer8"}
  }
  A0_0:initWork(nil, L1_1)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(3341, "populaceGLKeyPerson")
end
function PopulaceGLKeyPerson.eventTalkStart(A0_2, A1_3)
  local L2_4
  L2_4 = worldMaster
  L2_4 = L2_4._getMyPlayer
  L2_4 = L2_4(L2_4)
  A0_2:startCliantTalkTurn(2, L2_4)
  if A1_3 == 1111 then
    A0_2:_runCharaScheduler(69197824)
    A0_2:say(A0_2, 1, 0)
    A0_2:say(A0_2, 2, 0)
    A0_2:_runCharaScheduler(67887104)
    A0_2:say(A0_2, 3, 0)
    A0_2:say(A0_2, 4, 0)
    A0_2:say(A0_2, 5, 0)
    A0_2:_runCharaScheduler(84013056)
    A0_2:say(A0_2, 6, 0)
  elseif A1_3 == 1112 then
    A0_2:_runCharaScheduler(69197824)
    A0_2:say(A0_2, 10, 0)
    A0_2:say(A0_2, 11, 0)
    A0_2:say(A0_2, 12, 0)
    A0_2:say(A0_2, 13, 0)
    A0_2:_runCharaScheduler(67887104)
    A0_2:say(A0_2, 14, 0)
    A0_2:say(A0_2, 15, 0)
    A0_2:say(A0_2, 16, 0)
    A0_2:_runCharaScheduler(84013056)
    A0_2:say(A0_2, 17, 0)
  elseif A1_3 == 1113 then
    A0_2:_runCharaScheduler(69197824)
    A0_2:say(A0_2, 21, 0)
    A0_2:say(A0_2, 22, 0)
    A0_2:_runCharaScheduler(70799360)
    A0_2:say(A0_2, 23, 0)
    A0_2:say(A0_2, 24, 0)
    A0_2:say(A0_2, 25, 0)
    A0_2:_runCharaScheduler(84013056)
    A0_2:say(A0_2, 26, 0)
  end
  A0_2:finishCliantTalkTurn()
end
function PopulaceGLKeyPerson.eventTalkMission(A0_5, A1_6)
  local L2_7
  L2_7 = worldMaster
  L2_7 = L2_7._getMyPlayer
  L2_7 = L2_7(L2_7)
  A0_5:startCliantTalkTurn(2, L2_7)
  if A1_6 == 1111 then
    A0_5:_runCharaScheduler(84013056)
    A0_5:say(A0_5, 7, 0)
  elseif A1_6 == 1112 then
    A0_5:_runCharaScheduler(84013056)
    A0_5:say(A0_5, 18, 0)
  elseif A1_6 == 1113 then
    A0_5:_runCharaScheduler(84013056)
    A0_5:say(A0_5, 27, 0)
  elseif A1_6 == 1214 then
    A0_5:_runCharaScheduler(354103296)
    A0_5:say(A0_5, 30, 0)
    A0_5:say(A0_5, 31, 0)
    A0_5:say(A0_5, 32, 0)
    A0_5:_runCharaScheduler(67112955)
    A0_5:_wait(2)
  end
  A0_5:finishCliantTalkTurn()
end
function PopulaceGLKeyPerson.eventTalkEnd(A0_8, A1_9)
  local L2_10
  L2_10 = worldMaster
  L2_10 = L2_10._getMyPlayer
  L2_10 = L2_10(L2_10)
  A0_8:startCliantTalkTurn(2, L2_10)
  if A1_9 == 1111 then
    A0_8:_runCharaScheduler(84004864)
    A0_8:say(A0_8, 8, 0)
    A0_8:say(A0_8, 9, 0)
  elseif A1_9 == 1112 then
    A0_8:_runCharaScheduler(84004864)
    A0_8:say(A0_8, 19, 0)
    A0_8:say(A0_8, 20, 0)
  elseif A1_9 == 1113 then
    A0_8:_runCharaScheduler(84004864)
    A0_8:say(A0_8, 28, 0)
    A0_8:say(A0_8, 29, 0)
  end
  A0_8:finishCliantTalkTurn()
end
