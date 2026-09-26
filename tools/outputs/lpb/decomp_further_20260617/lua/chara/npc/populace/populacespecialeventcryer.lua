require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceSpecialEventCryer", "NpcBaseClass")
function PopulaceSpecialEventCryer.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(6688, "populaceSpecialEventCryer")
end
function PopulaceSpecialEventCryer.eventTalkStep0(A0_1, A1_2)
  local L2_3
  L2_3 = worldMaster
  L2_3 = L2_3._getMyPlayer
  L2_3 = L2_3(L2_3)
  A0_1:startCliantTalkTurn(7, L2_3)
  if A1_2 == 0 then
    if A0_1:getActorClassId() == 1001619 then
      A0_1:_runCharaScheduler(84090880)
      A0_1:_wait(1)
      A0_1:say(A0_1, 11, 0)
    elseif A0_1:getActorClassId() == 1001623 then
      A0_1:_runCharaScheduler(84094976)
      A0_1:_wait(1)
      A0_1:say(A0_1, 13, 0)
    elseif A0_1:getActorClassId() == 1001627 then
      A0_1:_runCharaScheduler(84099072)
      A0_1:_wait(1)
      A0_1:say(A0_1, 14, 0)
    end
  elseif A0_1:getActorClassId() == 1001619 then
    A0_1:_runCharaScheduler(84090880)
    A0_1:_wait(1)
    A0_1:say(A0_1, 16, 0)
  elseif A0_1:getActorClassId() == 1001623 then
    A0_1:_runCharaScheduler(84094976)
    A0_1:_wait(1)
    A0_1:say(A0_1, 17, 0)
  elseif A0_1:getActorClassId() == 1001627 then
    A0_1:_runCharaScheduler(84099072)
    A0_1:_wait(1)
    A0_1:say(A0_1, 18, 0)
  end
  A0_1:finishCliantTalkTurn()
end
function PopulaceSpecialEventCryer.eventTalkNotGCmenber(A0_4, A1_5)
  local L2_6
  L2_6 = worldMaster
  L2_6 = L2_6._getMyPlayer
  L2_6 = L2_6(L2_6)
  A0_4:startCliantTalkTurn(2, L2_6)
  if A1_5 == 1 then
    A0_4:_runCharaScheduler(353959936)
    A0_4:say(A0_4, 25, 0)
  elseif A1_5 == 2 then
    A0_4:_runCharaScheduler(353959936)
    A0_4:say(A0_4, 39, 0)
  elseif A1_5 == 3 then
    A0_4:_runCharaScheduler(353959936)
    A0_4:say(A0_4, 51, 0)
  end
  A0_4:finishCliantTalkTurn()
end
function PopulaceSpecialEventCryer.eventTalkCrystalExchange(A0_7, A1_8, A2_9, A3_10)
  local L4_11, L5_12, L6_13
  L4_11 = 0
  L5_12 = 0
  L6_13 = 0
  A0_7:startCliantTalkTurn(2, A1_8)
  if A2_9 == 1 then
    A0_7:doSalute(1, 23)
    A0_7:_wait(1)
    A0_7:say(A0_7, 23, 0)
    A0_7:_runCharaScheduler(353959936)
    A0_7:say(A0_7, 24, 0)
  elseif A2_9 == 2 then
    A0_7:doSalute(2, 23)
    A0_7:_wait(1)
    A0_7:say(A0_7, 37, 0)
    A0_7:_runCharaScheduler(353959936)
    A0_7:say(A0_7, 38, 0)
  elseif A2_9 == 3 then
    A0_7:doSalute(3, 23)
    A0_7:_wait(1)
    A0_7:say(A0_7, 49, 0)
    A0_7:_runCharaScheduler(353959936)
    A0_7:say(A0_7, 50, 0)
  end
  if A3_10 == 1 then
    L4_11 = A0_7:askExtendWidget(A0_7, 26, 3, 1, 1)
    if L4_11 == 1 then
      if A2_9 == 1 then
        worldMaster:say(A0_7, 30, 3020537, 1000, 4)
      elseif A2_9 == 2 then
        worldMaster:say(A0_7, 42, 3020537, 1000, 4)
      elseif A2_9 == 3 then
        worldMaster:say(A0_7, 55, 3020537, 1000, 4)
      end
      L5_12 = A0_7:askExtendWidget(A0_7, 58, 2, 1, 1)
      if L5_12 == 1 then
        L6_13 = 1
      end
    elseif L4_11 == 2 then
      if A2_9 == 1 then
        worldMaster:say(A0_7, 30, 3020413, 3000, 1)
      elseif A2_9 == 2 then
        worldMaster:say(A0_7, 42, 3020413, 3000, 1)
      elseif A2_9 == 3 then
        worldMaster:say(A0_7, 55, 3020413, 3000, 1)
      end
      L5_12 = A0_7:askExtendWidget(A0_7, 58, 2, 1, 1)
      if L5_12 == 1 then
        L6_13 = 2
      end
    end
  end
  A0_7:finishCliantTalkTurn()
  return L6_13
end
function PopulaceSpecialEventCryer.eventTalkCsOverflow(A0_14, A1_15, A2_16)
  A0_14:startCliantTalkTurn(2, A1_15)
  if A2_16 == 1 then
    worldMaster:say(A0_14, 32)
  elseif A2_16 == 2 then
    worldMaster:say(A0_14, 44)
  elseif A2_16 == 3 then
    worldMaster:say(A0_14, 57)
  end
  A0_14:finishCliantTalkTurn()
end
function PopulaceSpecialEventCryer.eventTalkCrystalExchange2(A0_17, A1_18, A2_19)
  A0_17:startCliantTalkTurn(2, A1_18)
  if A2_19 == 1 then
    A0_17:_runCharaScheduler(354107392)
    A0_17:say(A0_17, 31, 0)
  elseif A2_19 == 2 then
    A0_17:_runCharaScheduler(354107392)
    A0_17:say(A0_17, 43, 0)
  elseif A2_19 == 3 then
    A0_17:_runCharaScheduler(354107392)
    A0_17:say(A0_17, 56, 0)
  end
  A0_17:finishCliantTalkTurn()
end
