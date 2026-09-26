require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceYukata", "NpcBaseClass")
function PopulaceYukata.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 10612, "populaceYukata")
  L1_1 = A0_0._setGroundOn
  L1_1(A0_0, true)
  L1_1 = {
    {
      "directorStatus",
      "integer8"
    }
  }
  A0_0:initWork(nil, nil, L1_1)
  A0_0.work._tag = {
    {
      "status",
      1,
      {
        "directorStatus"
      }
    }
  }
end
function PopulaceYukata.processEventTalkInterval(A0_2, A1_3)
  A0_2:startCliantTalkTurn(2, A1_3)
  A0_2:say(A0_2, 2, 0)
  if A0_2:askExtendWidget(A0_2, 3, 2, 1, 2) == 1 then
    A0_2:say(A0_2, 6, 0)
    A0_2:say(A0_2, 7, 0)
    A0_2:say(A0_2, 8, 0)
    worldMaster:say(A0_2, 9, 0)
    worldMaster:say(A0_2, 10, 0)
    A0_2:say(A0_2, 11, 0)
    worldMaster:say(A0_2, 12, 0)
    worldMaster:say(A0_2, 13, 0)
    worldMaster:say(A0_2, 14, 0)
    worldMaster:say(A0_2, 15, 0)
  else
  end
  A0_2:finishCliantTalkTurn()
end
function PopulaceYukata.processEventTalkReward(A0_4, A1_5, A2_6)
  A0_4:startCliantTalkTurn(2, A1_5)
  if A2_6 == 20 then
    A0_4:_runCharaScheduler(354107392)
    A0_4:say(A0_4, 16, 0)
    break
  else
  end
  if A2_6 == 10 then
    A0_4:_runCharaScheduler(354107392)
    A0_4:say(A0_4, 17, 0)
    break
  else
  end
  if A2_6 == 6 then
    A0_4:_runCharaScheduler(354107392)
    A0_4:say(A0_4, 18, 0)
    break
  else
  end
  if A2_6 == 3 then
    A0_4:_runCharaScheduler(354107392)
    A0_4:say(A0_4, 19, 0)
    break
  else
  end
  if A2_6 == 1 then
    A0_4:_runCharaScheduler(354107392)
    A0_4:say(A0_4, 35, 0)
    break
  else
  end
  A0_4:finishCliantTalkTurn()
end
function PopulaceYukata.processEventItemFull(A0_7, A1_8)
  A0_7:startCliantTalkTurn(2, A1_8)
  A0_7:say(A0_7, 20, 0)
  A0_7:finishCliantTalkTurn()
end
function PopulaceYukata.processUpdateWork(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14, L6_15
  if A1_10 == "status" then
    L2_11 = {}
    L3_12 = {}
    L3_12[1002078] = 14
    L3_12[1002079] = 15
    L3_12[1002080] = 16
    L2_11[3] = L3_12
    L3_12 = {}
    L3_12[1002078] = 17
    L3_12[1002079] = 18
    L3_12[1002080] = 19
    L2_11[5] = L3_12
    L3_12 = {}
    L3_12[1002078] = 20
    L3_12[1002079] = 20
    L3_12[1002080] = 20
    L2_11[6] = L3_12
    L3_12 = A0_9.work
    L3_12 = L3_12.directorStatus
    L4_13 = L2_11[L3_12]
    if L4_13 == nil then
      return
    end
    L6_15 = A0_9
    L5_14 = A0_9.getActorClassId
    L5_14 = L5_14(L6_15)
    L6_15 = L4_13[L5_14]
    if L6_15 == nil then
      return
    end
    if (worldMaster:_getMyPlayer():_getPos() - A0_9:_getPos()) ^ 2 + (worldMaster:_getMyPlayer():_getPos() - A0_9:_getPos()) ^ 2 < 900 then
      desktopWidget:openPublicEffectWidget(L6_15)
    end
  end
end
